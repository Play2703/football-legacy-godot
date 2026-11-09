class_name LifeLegacyFamily
extends RefCounted

const PHASE_INFANT: String = "infant"                 # 0 a 5 anos
const PHASE_CHILD: String = "child"                   # 6 a 11 anos
const PHASE_TEEN: String = "teen"                     # 12 a 15 anos
const PHASE_ELIGIBLE_HEIR: String = "eligible_heir"   # 16+ anos

const FORMATION_BASIC: String = "basic"
const FORMATION_ELITE: String = "elite"
const FORMATION_FOOTBALL: String = "football"

const VALID_FORMATIONS: Array = [
	FORMATION_BASIC,
	FORMATION_ELITE,
	FORMATION_FOOTBALL
]

static func is_valid_formation(path: String) -> bool:
	return VALID_FORMATIONS.has(path)

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
	family_dict["spouse"] = spouse_data.duplicate(true)
	return true

# Registro de divórcio
static func divorce(family_dict: Dictionary) -> bool:
	if family_dict.get("spouse", {}).is_empty():
		return false
	family_dict["spouse"] = {}
	return true

# Geração determinística e única de ID de filho
static func generate_child_id(child_name: String, birth_s: int, birth_d: int, existing_children: Array = []) -> String:
	var clean_name: String = child_name.to_lower().strip_edges().replace(" ", "_")
	if clean_name.is_empty():
		clean_name = "child"
	var base_id: String = "child_%s_s%d_d%d" % [clean_name, birth_s, birth_d]
	
	var existing_ids: Array = []
	for ch in existing_children:
		if ch is Dictionary:
			existing_ids.append(String(ch.get("id", "")))
	
	if not existing_ids.has(base_id):
		return base_id
	
	var seq: int = 2
	while existing_ids.has("%s_%d" % [base_id, seq]):
		seq += 1
	return "%s_%d" % [base_id, seq]

# Normalização de dados de filho para garantir Schema V5
static func normalize_child(child_dict: Dictionary, existing_children: Array = []) -> Dictionary:
	var normalized: Dictionary = child_dict.duplicate(true)
	
	# Nome seguro
	var raw_name: Variant = normalized.get("name")
	var c_name: String = ""
	if raw_name is String:
		c_name = (raw_name as String).strip_edges()
	if c_name.is_empty():
		c_name = "Filho"
	normalized["name"] = c_name
	
	# Temporada / dia de nascimento seguros
	var raw_s: Variant = normalized.get("birth_season_num")
	var b_s: int = int(raw_s) if (raw_s is int or raw_s is float) else 1
	normalized["birth_season_num"] = b_s
	
	var raw_d: Variant = normalized.get("birth_season_day")
	var b_d: int = int(raw_d) if (raw_d is int or raw_d is float) else 0
	normalized["birth_season_day"] = b_d
	
	# Extração de IDs existentes para garantir unicidade
	var existing_ids: Array = []
	for existing in existing_children:
		if existing is Dictionary and existing.has("id"):
			existing_ids.append(String(existing["id"]))
			
	var raw_id: Variant = normalized.get("id")
	var c_id: String = ""
	if raw_id is String:
		c_id = (raw_id as String).strip_edges()
		
	if c_id.is_empty():
		c_id = generate_child_id(c_name, b_s, b_d, existing_children)
	elif existing_ids.has(c_id):
		# Colisão de ID em dados legados: resolver determinísticamente com sufixo
		var seq: int = 2
		var disambiguated: String = "%s_%d" % [c_id, seq]
		while existing_ids.has(disambiguated):
			seq += 1
			disambiguated = "%s_%d" % [c_id, seq]
		c_id = disambiguated
	normalized["id"] = c_id
	
	# Trilha de formação
	var raw_fp: Variant = normalized.get("formation_path")
	if not (raw_fp is String) or not is_valid_formation(raw_fp as String):
		normalized["formation_path"] = FORMATION_BASIC
	else:
		normalized["formation_path"] = raw_fp as String
		
	# Afinidade obrigatória e com clamp
	var raw_aff: Variant = normalized.get("affinity")
	if raw_aff is float or raw_aff is int:
		normalized["affinity"] = clampf(float(raw_aff), 0.0, 100.0)
	else:
		normalized["affinity"] = 50.0
		
	return normalized

# Registro de nascimento de filho
static func register_child(child_name: String, gender: String, birth_s: int, birth_d: int, family_dict: Dictionary, custom_id: String = "", formation_path: String = FORMATION_BASIC) -> Dictionary:
	var children: Array = family_dict.get("children", [])
	
	var clean_name: String = child_name.strip_edges()
	if clean_name.is_empty():
		clean_name = "Filho"
		
	var child_id: String = custom_id.strip_edges()
	if not child_id.is_empty():
		# Se foi fornecido custom_id, validar que não existe duplicidade!
		for existing in children:
			if existing is Dictionary and String(existing.get("id", "")) == child_id:
				push_error("[LifeLegacyFamily] custom_id '%s' já existe na lista de filhos. Registro rejeitado." % child_id)
				return {}
	else:
		child_id = generate_child_id(clean_name, birth_s, birth_d, children)
	
	if child_id.is_empty():
		return {}
	
	var path: String = formation_path if is_valid_formation(formation_path) else FORMATION_BASIC
	
	var new_child: Dictionary = {
		"id": child_id,
		"name": clean_name,
		"gender": gender,
		"birth_season_num": birth_s,
		"birth_season_day": birth_d,
		"position": "DC",
		"affinity": 50.0,
		"potential": 75.0,
		"initial_ovr": 60,
		"formation_path": path
	}
	children.append(new_child)
	family_dict["children"] = children
	return new_child

# Alteração de trilha de formação
static func set_child_formation(child_id: String, formation_path: String, family_dict: Dictionary) -> bool:
	if not is_valid_formation(formation_path):
		return false
	var children: Array = family_dict.get("children", [])
	for i in range(children.size()):
		var ch = children[i]
		if ch is Dictionary and String(ch.get("id", "")) == child_id:
			ch["formation_path"] = formation_path
			return true
	return false

# Consulta individual de filho
static func get_child_by_id(child_id: String, family_dict: Dictionary) -> Dictionary:
	var children: Array = family_dict.get("children", [])
	for ch in children:
		if ch is Dictionary and String(ch.get("id", "")) == child_id:
			return ch.duplicate(true)
	return {}

# Atualização de afinidade individual filial (clamp [0.0, 100.0])
static func update_child_affinity(child_id: String, delta: float, family_dict: Dictionary) -> float:
	var children: Array = family_dict.get("children", [])
	for i in range(children.size()):
		var ch = children[i]
		if ch is Dictionary and String(ch.get("id", "")) == child_id:
			var cur: float = float(ch.get("affinity", 50.0))
			var new_aff: float = clampf(cur + delta, 0.0, 100.0)
			ch["affinity"] = new_aff
			return new_aff
	return -1.0

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
			var copy_ch: Dictionary = ch.duplicate(true)
			copy_ch["canonical_age"] = c_age
			copy_ch["phase"] = PHASE_ELIGIBLE_HEIR
			eligible.append(copy_ch)
	return eligible
