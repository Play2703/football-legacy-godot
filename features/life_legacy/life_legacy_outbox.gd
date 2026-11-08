class_name LifeLegacyOutbox
extends RefCounted

# Semântica Transacional: At-Least-Once Delivery com Deduplicação no Receptor (Career)
#
# 1. Pré-compromisso (Pre-commitment Log):
#    A intenção de despacho é gerada e gravada no disco como STATUS_PENDING antes de qualquer
#    chamada ser enviada ao receptor (Career). Se a gravação de pré-compromisso falhar, nenhum
#    efeito é disparado e o evento permanece pendente.
#
# 2. Despacho ao Receptor:
#    A intenção é despachada via Career.apply_idempotent_effect ou apply_idempotent_social_post.
#
# 3. Barreira de Deduplicação do Receptor (Idempotency Barrier):
#    O receptor (Career) valida se o token da intenção já está presente em seu ledger persistido
#    (processed_career_tokens ou processed_muro_tokens). Se já constar, retorna true imediatamente
#    sem reaplicar os efeitos em dinheiro, energia ou muro social.
#
# 4. Confirmação do Outbox (COMMITTED):
#    O intent só tem seu status atualizado para STATUS_COMMITTED no Outbox APÓS a confirmação
#    estrita de sucesso retornada pelo Career.
#
# 5. Tolerância a Crash entre Despacho e Commit:
#    Caso ocorra uma queda do processo após a confirmação do Career mas antes que o LifeLegacy
#    persista o status COMMITTED, na reinicialização o mecanismo de boot chamará reconcile_outbox().
#    A intenção pendente será reenviada; a barreira do Career dedup reconhecerá o token e retornará
#    true sem efeitos colaterais duplicados, permitindo que o Outbox finalmente seja persistido
#    como STATUS_COMMITTED com segurança absoluta.

const STATUS_PENDING: String = "PENDING"
const STATUS_COMMITTED: String = "COMMITTED"
const STATUS_FAILED: String = "FAILED"

# Cria registro formal de intenção antes do envio (Pre-commitment Intent Log)
static func create_intent(target: String, token: String, payload: Dictionary) -> Dictionary:
	return {
		"target": target, # "career_effects" ou "career_social"
		"token": token,
		"payload": payload,
		"status": STATUS_PENDING,
		"retry_count": 0,
		"created_at": Time.get_datetime_string_from_system()
	}

static func _get_career() -> Object:
	var tree = Engine.get_main_loop() as SceneTree
	if tree != null and tree.root != null:
		return tree.root.get_node_or_null("Career")
	return null

# Executa o despacho individual garantindo idempotência e confirmação estrita
static func dispatch_intent(intent: Dictionary) -> bool:
	if intent.get("status", "") == STATUS_COMMITTED:
		return true

	var target: String = String(intent.get("target", ""))
	var token: String = String(intent.get("token", ""))
	var payload: Dictionary = intent.get("payload", {})
	var ok: bool = false
	var career = _get_career()

	if target == "career_effects":
		var delta_money: int = int(payload.get("money", 0))
		var delta_energy: float = float(payload.get("energy", 0.0))
		if career != null:
			ok = career.apply_idempotent_effect(token, delta_money, delta_energy)
	elif target == "career_social":
		var post_data: Dictionary = payload.get("post_data", {})
		if career != null:
			ok = career.apply_idempotent_social_post(token, post_data)
	else:
		push_error("[LifeLegacyOutbox] Destino desconhecido de despacho: %s" % target)
		intent["status"] = STATUS_FAILED
		return false

	if ok:
		# Marcação COMMITTED ocorre estritamente após a confirmação bem-sucedida do receptor
		intent["status"] = STATUS_COMMITTED
		intent["committed_at"] = Time.get_datetime_string_from_system()
	else:
		intent["retry_count"] = int(intent.get("retry_count", 0)) + 1
		intent["status"] = STATUS_PENDING

	return ok

# Reconciliação no boot/reload: reprocessa todos os despachos pendentes
static func reconcile_outbox(outbox_data: Dictionary) -> int:
	var pending: Array = outbox_data.get("pending_dispatches", [])
	var committed_count: int = 0
	
	for i in range(pending.size()):
		var item: Dictionary = pending[i]
		if item.get("status", "") == STATUS_PENDING:
			if dispatch_intent(item):
				committed_count += 1
	
	return committed_count
