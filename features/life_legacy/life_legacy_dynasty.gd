class_name LifeLegacyDynasty
extends RefCounted

const SalonFama = preload("res://features/career/salon_fama.gd")
const LifeLegacyFamily = preload("res://features/life_legacy/life_legacy_family.gd")

const STAGE_IDLE: String = "IDLE"
const STAGE_PREPARED: String = "PREPARED"
const STAGE_FATHER_ARCHIVED: String = "FATHER_ARCHIVED"
const STAGE_HEIR_PROFILE_READY: String = "HEIR_PROFILE_READY"
const STAGE_DYNASTY_UPDATED: String = "DYNASTY_UPDATED"
const STAGE_COMPLETED: String = "COMPLETED"

# Inicia a saga transacional de sucessão geracional com diário persistente
static func start_succession(heir_child: Dictionary, inheritance_percent: float, start_club: String, ll_manager) -> bool:
	var c_age: int = int(heir_child.get("canonical_age", 0))
	if c_age < 16:
		push_error("[LifeLegacyDynasty] Candidato não atingiu a idade canônica mínima de 16 anos.")
		return false

	var data: Dictionary = ll_manager.get_data()
	var dynasty: Dictionary = data.get("dynasty", {})
	var tx_id: String = "dyn_tx_%d" % Time.get_unix_time_from_system()

	# 1. PREPARED
	var journal: Dictionary = {
		"tx_id": tx_id,
		"stage": STAGE_PREPARED,
		"heir_child": heir_child,
		"inheritance_percent": inheritance_percent,
		"start_club": start_club,
		"father_name": Career.player_name if Career != null else "Pai",
		"father_archived": false,
		"heir_instantiated": false,
		"patrimony_transferred": false,
		"dynasty_updated": false,
		"completed": false,
		"created_at": Time.get_datetime_string_from_system()
	}
	dynasty["transition_journal"] = journal
	data["dynasty"] = dynasty
	if not ll_manager.save_current_slot():
		push_error("[LifeLegacyDynasty] Falha ao persistir diário inicial de sucessão.")
		return false

	return _execute_from_stage(journal, dynasty, data, ll_manager)

# Retoma saga interrompida por crash a partir do ponto persistido no diário
static func recover_or_resume_succession(ll_manager) -> bool:
	var data: Dictionary = ll_manager.get_data()
	var dynasty: Dictionary = data.get("dynasty", {})
	var journal: Dictionary = dynasty.get("transition_journal", {})
	var stage: String = journal.get("stage", STAGE_IDLE)
	var completed: bool = bool(journal.get("completed", false))

	if stage == STAGE_IDLE or stage == STAGE_COMPLETED or completed or journal.is_empty():
		return true # Nada pendente a recuperar

	push_warning("[LifeLegacyDynasty] Crash recovery de sucessão detectado na etapa %s (tx_id: %s)" % [stage, journal.get("tx_id", "")])
	return _execute_from_stage(journal, dynasty, data, ll_manager)

static func _execute_from_stage(journal: Dictionary, _dynasty: Dictionary, _data: Dictionary, ll_manager) -> bool:
	var stage: String = journal.get("stage", STAGE_IDLE)
	var tx_id: String = journal.get("tx_id", "")
	var heir_child: Dictionary = journal.get("heir_child", {})
	var inheritance_percent: float = float(journal.get("inheritance_percent", 30.0))
	var start_club: String = String(journal.get("start_club", "rma"))

	# Etapa 1 -> FATHER_ARCHIVED
	if not journal.get("father_archived", false):
		var plaque_id: String = SalonFama.colgar_dinastia(ll_manager.get_current_slot(), tx_id)
		if plaque_id.is_empty():
			push_error("[LifeLegacyDynasty] Falha ao arquivar pai no SalonFama.")
			return false
		journal["plaque_id"] = plaque_id
		journal["father_archived"] = true
		journal["stage"] = STAGE_FATHER_ARCHIVED
		ll_manager.get_data()["dynasty"]["transition_journal"] = journal
		if not ll_manager.save_current_slot():
			push_error("[LifeLegacyDynasty] Falha de I/O ao persistir STAGE_FATHER_ARCHIVED.")
			return false
		stage = STAGE_FATHER_ARCHIVED

	# Etapa 2 -> HEIR_PROFILE_READY (Instanciação do herdeiro e transferência de patrimônio)
	if not journal.get("heir_instantiated", false):
		var current_money: int = Career.money if Career != null else 10000
		var inherited_money: int = int(current_money * (inheritance_percent / 100.0))
		if Career != null:
			var ok: bool = Career.instantiate_dynasty_heir(heir_child, inherited_money, start_club, tx_id)
			if not ok:
				push_error("[LifeLegacyDynasty] Falha ao instanciar carreira do herdeiro.")
				return false
		journal["heir_instantiated"] = true
		journal["patrimony_transferred"] = true
		journal["inherited_money"] = inherited_money
		journal["stage"] = STAGE_HEIR_PROFILE_READY
		ll_manager.get_data()["dynasty"]["transition_journal"] = journal
		if not ll_manager.save_current_slot():
			push_error("[LifeLegacyDynasty] Falha de I/O ao persistir STAGE_HEIR_PROFILE_READY.")
			return false
		stage = STAGE_HEIR_PROFILE_READY

	# Etapa 3 -> DYNASTY_UPDATED
	if not journal.get("dynasty_updated", false):
		var cur_data: Dictionary = ll_manager.get_data()
		var cur_dynasty: Dictionary = cur_data.get("dynasty", {})
		var ancestors: Array = cur_dynasty.get("ancestors", [])
		var p_id: String = journal.get("plaque_id", "")
		var already_in_ancestors: bool = false
		for anc in ancestors:
			if anc is Dictionary and not p_id.is_empty() and anc.get("plaque_id", "") == p_id:
				already_in_ancestors = true
				break
		if not already_in_ancestors:
			ancestors.append({
				"name": journal.get("father_name", "Pai"),
				"plaque_id": p_id,
				"retired_season": GameState.season_num if GameState != null else 1
			})
			cur_dynasty["ancestors"] = ancestors
			cur_dynasty["current_generation"] = int(cur_dynasty.get("current_generation", 1)) + 1

		# Reseta vida pessoal e família para a nova geração
		var family: Dictionary = cur_data.get("family", {})
		family["spouse"] = {}
		family["children"] = []
		cur_data["family"] = family

		journal["dynasty_updated"] = true
		journal["stage"] = STAGE_DYNASTY_UPDATED
		cur_dynasty["transition_journal"] = journal
		cur_data["dynasty"] = cur_dynasty
		if not ll_manager.save_current_slot():
			push_error("[LifeLegacyDynasty] Falha de I/O ao persistir STAGE_DYNASTY_UPDATED.")
			return false
		stage = STAGE_DYNASTY_UPDATED

	# Etapa 4 -> COMPLETED
	if not journal.get("completed", false):
		journal["completed"] = true
		journal["stage"] = STAGE_COMPLETED
		journal["completed_at"] = Time.get_datetime_string_from_system()
		ll_manager.get_data()["dynasty"]["transition_journal"] = journal
		if not ll_manager.save_current_slot():
			push_error("[LifeLegacyDynasty] Falha de I/O ao persistir STAGE_COMPLETED.")
			return false

	return true
