class_name LifeLegacyOutbox
extends RefCounted

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

# Executa o despacho individual garantindo idempotência
static func dispatch_intent(intent: Dictionary) -> bool:
	if intent.get("status", "") == STATUS_COMMITTED:
		return true

	var target: String = String(intent.get("target", ""))
	var token: String = String(intent.get("token", ""))
	var payload: Dictionary = intent.get("payload", {})
	var ok: bool = false

	if target == "career_effects":
		var delta_money: int = int(payload.get("money", 0))
		var delta_energy: float = float(payload.get("energy", 0.0))
		if Career != null:
			ok = Career.apply_idempotent_effect(token, delta_money, delta_energy)
	elif target == "career_social":
		var post_data: Dictionary = payload.get("post_data", {})
		if Career != null:
			ok = Career.apply_idempotent_social_post(token, post_data)
	else:
		push_error("[LifeLegacyOutbox] Destino desconhecido de despacho: %s" % target)
		intent["status"] = STATUS_FAILED
		return false

	if ok:
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
