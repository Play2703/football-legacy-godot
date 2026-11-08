class_name LifeLegacyFamily
extends RefCounted

const PHASE_INFANT: String = "infant"                 # 0 a 5 anos
const PHASE_CHILD: String = "child"                   # 6 a 11 anos
const PHASE_TEEN: String = "teen"                     # 12 a 15 anos
const PHASE_ELIGIBLE_HEIR: String = "eligible_heir"   # 16+ anos

# Fórmula matemática canônica de idade:
# Idade = (cur_season_num - birth_season_num) - (1 se cur_season_day < birth_season_day senão 0)
static func compute_canonical_age(birth_s: int, birth_d: int, cur_s: int, cur_d: int) -> int:
	var age: int = cur_s - birth_s
	if cur_d < birth_d:
		age -= 1
	return maxi(0, age)

# Retorna a fase de desenvolvimento com base na idade canônica
static func get_development_phase(canonical_age: int) -> String:
	if canonical_age <= 5:
		return PHASE_INFANT
	elif canonical_age <= 11:
		return PHASE_CHILD
	elif canonical_age <= 15:
		return PHASE_TEEN
	else:
		return PHASE_ELIGIBLE_HEIR

# Registro de casamento
static func marry(spouse_data: Dictionary, family_dict: Dictionary) -> bool:
	if not family_dict.get("spouse", {}).is_empty():
		return false # Já casado
	family_dict["spouse"] = spouse_data.duplicate()
	return true

# Registro de divórcio
static func divorce(family_dict: Dictionary) -> bool:
	if family_dict.get("spouse", {}).is_empty():
		return false
	family_dict["spouse"] = {}
	return true

# Registro de nascimento de filho
static func register_child(child_name: String, gender: String, birth_s: int, birth_d: int, family_dict: Dictionary) -> Dictionary:
	var children: Array = family_dict.get("children", [])
	var child_id: String = "child_%s_%d" % [child_name.to_lower().replace(" ", "_"), Time.get_unix_time_from_system()]
	var new_child: Dictionary = {
		"id": child_id,
		"name": child_name,
		"gender": gender,
		"birth_season_num": birth_s,
		"birth_season_day": birth_d,
		"position": "DC",
		"affinity": 50.0,
		"potential": 75.0,
		"initial_ovr": 60
	}
	children.append(new_child)
	family_dict["children"] = children
	return new_child

# Lista todos os filhos elegíveis para herdeiro (idade >= 16)
static func get_eligible_heirs(family_dict: Dictionary, cur_s: int, cur_d: int) -> Array[Dictionary]:
	var eligible: Array[Dictionary] = []
	var children: Array = family_dict.get("children", [])
	for ch in children:
		var c_age: int = compute_canonical_age(
			int(ch.get("birth_season_num", 1)),
			int(ch.get("birth_season_day", 0)),
			cur_s,
			cur_d
		)
		if c_age >= 16:
			var copy_ch: Dictionary = ch.duplicate()
			copy_ch["canonical_age"] = c_age
			copy_ch["phase"] = PHASE_ELIGIBLE_HEIR
			eligible.append(copy_ch)
	return eligible
