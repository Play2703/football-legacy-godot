class_name SquadEdits
extends RefCounted


















































const LookMigracion = preload("res://features/match/look_migracion.gd")


const SaveSlotsScript = preload("res://autoload/save_slots.gd")

const SAVE_PATH_BASE: String = "user://squad_edits.json"



static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)


const FORMAT: int = 1





















const STAT_KEYS: Array[String] = ["velocidad", "pegada", "punteria", "rosca",
	"cabeza", "penal", "parado", "reflejos", "entrada", "aceleracion", "regate",
	"fisico"]
const STAT_MIN: int = 25
const STAT_MAX: int = 99
const NAME_MAX: int = 26





const POS_KEYS: Array[String] = ["POR", "DFC", "LTI", "LTD", "MCD", "MC", "MI",
	"MD", "EI", "ED", "CAM", "DC"]












const POS_COMPAT: Dictionary = {"SD": "CAM"}



static func pos_canon(raw: Variant) -> String:
	var p: String = String(POS_COMPAT.get(String(raw), String(raw)))
	return p if POS_KEYS.has(p) else ""






const PROTECTED_POS: Array[String] = ["POR", "DC"]




const NUM_MIN: int = 1
const NUM_MAX: int = 99

const AGE_MIN: int = 16
const AGE_MAX: int = 40



const CONTRACT_MIN: int = 1
const CONTRACT_MAX: int = 5














const POT_MIN: int = 40
const POT_MAX: int = 99
const NATION_MAX: int = 24






const LOOK_COLOR_KEYS: Array[String] = ["skin", "hair"]
const LOOK_STYLE_KEYS: Array[String] = ["hair_style", "facial_hair"]













const LOOK_COLOR_OPT: Array[String] = ["brows", "eyes", "boots", "hair_tips", "tattoo_ink",
	"tattoo_color", "face_tattoo_color", "tattoo_leg_ink", "tattoo_leg_color", "neck_tattoo_color",
	"wristband_color", "arm_sleeve_color", "field_gloves_color", "sock_tape_color"]
const Appearance = preload("res://features/match/appearance_catalog.gd")
const LOOK_STYLE_OPT: Array[String] = ["tattoo", "tattoo_pat", "tattoo_style", "tattoo_pattern", "modular_hair",
	"modular_brows", "modular_beard", "modular_hair_accessory", "modular_mask",
	"modular_face_tattoo", "modular_face_tattoo_side", "modular_neck_tattoo",
	"tattoo_leg", "tattoo_leg_pat", "tattoo_leg_style", "tattoo_leg_pattern",
	"wristband_style", "arm_sleeve_style", "arm_wrap_style", "sock_style",
	"tights_style", "knee_style", "knee_kind"]


const LOOK_TATTOO_SIDES: Array[String] = ["left", "right", "both"]










static var _data: Dictionary = {}
static var _loaded: bool = false




















const _C_NUM: int = 0
const _C_NAME: int = 1
const _C_POS: int = 2
const _C_POSS: int = 3
const _C_NATION: int = 4
const _C_RESTO: int = 5
const _B_NUMBER: int = 12
const _B_AGE: int = 13
const _B_FLAGS: int = 14
const _F_POSS_OK: int = 1







static func apply(team_id: String, squad: Array) -> void:
	_ensure_loaded()
	if not _data.has(team_id):
		return
	var team_edits: Dictionary = _data[team_id]



	var filas: Array = []
	var con_nombre: bool = false
	for key in team_edits:
		var idx_k: int = int(String(key))
		if idx_k < 0 or idx_k >= squad.size():
			continue
		var f: Array = _fila(idx_k, team_edits[key])
		con_nombre = con_nombre or f[5] != null
		filas.append(f)



	var por_persona: Dictionary = _por_persona(squad) if con_nombre else {}
	for fila in filas:
		var idx: int = int(fila[0])
		var slot: Dictionary = squad[idx]


		var nombre_previo: String = String(slot.get("name", ""))
		var nombre_ov: Variant = fila[5]
		slot["name"] = String(nombre_ov) if nombre_ov != null else String(slot.get("name", ""))




































		if nombre_ov != null:
			var nac_ov: String = String(fila[6]) if fila[6] != null else ""
			var age_ov: int = int(fila[7]) if fila[7] != null else -1
			if not nac_ov.is_empty():
				slot["nat"] = nac_ov
			if age_ov > 0:
				slot["age"] = age_ov
			if (nac_ov.is_empty() or age_ov <= 0) and WorldDB.has(team_id) \
					and idx < WorldDB.size_of(team_id):


				if nac_ov.is_empty():
					slot["nat"] = WorldDB.nation_at(team_id, idx)
				var edad_real: int = WorldDB.age_at(team_id, idx)
				if age_ov <= 0 and edad_real > 0:
					slot["age"] = edad_real


		slot.erase("real")















		if nombre_ov != null:
			var misma: Dictionary = por_persona.get(int(fila[8]), {})
			slot.erase("carrera")
			slot.erase("etapa_desde")
			if fila[11] != null:
				slot["carrera"] =(fila[11] as Array).duplicate(true)
			elif fila[12] == null:
				if misma.has("carrera"):
					slot["carrera"] =(misma["carrera"] as Array).duplicate(true)
				if misma.has("etapa_desde"):
					slot["etapa_desde"] = int(misma["etapa_desde"])
			if fila[12] != null:
				slot["etapa_desde"] = int(fila[12])









			if int(fila[9]) >= 0:
				slot["contract"] = int(fila[9])
			elif misma.has("contract"):
				slot["contract"] = int(misma["contract"])
			elif String(nombre_ov) != nombre_previo:
				slot.erase("contract")


		if fila[2] is PackedByteArray:
			var b: PackedByteArray = fila[2]
			for j in STAT_KEYS.size():
				slot[STAT_KEYS[j]] = b[j]
		else:
			var stats: Array = fila[2]
			for j in range(0, stats.size(), 2):
				slot[stats[j]] = stats[j + 1]



		if fila[1] != null:
			slot["pos"] = String(fila[1])





		if int(fila[3]) >= 0:
			slot["number"] = int(fila[3])






		if fila[4] != null:
			slot["poss"] =(fila[4] as Array).duplicate()
		elif fila[10] != null:
			slot["poss"] = sanea_poss(fila[10], String(slot.get("pos", "")))
























static func extra_seats(team_id: String, n: int) -> int:
	_ensure_loaded()
	if n <= 0 or not _data.has(team_id) or RosterDelta.tiene_base(team_id):
		return 0
	var ed: Dictionary = _data[team_id]
	var k: int = 0
	while k < RosterDelta.MAX_SEATS:
		var ov: Dictionary = _ficha(ed.get(str(n + k), null))
		if not ov.has("name") or not ov.has("pos"):
			break
		k += 1
	return k









static var _alargados: Dictionary = {}


static func clubes_alargados() -> Array:
	return _alargados.keys()







static func alarga_fabrica(team_id: String, squad: Array) -> void:
	var extra: int = extra_seats(team_id, squad.size())
	if extra <= 0:
		return
	_alargados[team_id] = true
	var ed: Dictionary = _data[team_id]
	var dorsales: Dictionary = {}
	for p in squad:
		dorsales[int((p as Dictionary).get("number", 0))] = true
	for _k in extra:
		var ov: Dictionary = _ficha(ed[str(squad.size())])
		var pos: String = String(ov["pos"])
		var nuevo: Dictionary = {"name": "", "pos": pos, "poss": [pos],
			"nat": String(ov.get("nation", "")),
			"age": clampi(int(ov.get("age", 26)), AGE_MIN, AGE_MAX)}
		for k in STAT_KEYS:
			nuevo[k] = clampi(int(ov.get(k, 70)), STAT_MIN, STAT_MAX)
		nuevo["_lvl"] = SquadMeta.ovr_of(nuevo, pos)
		var n: int = 1
		while dorsales.has(n) and n < NUM_MAX:
			n += 1
		dorsales[n] = true
		nuevo["number"] = n
		squad.append(nuevo)










static func _fila(idx: int, v: Variant) -> Array:
	if v is PackedByteArray:
		var c: Array = bytes_to_var(v)
		var b: PackedByteArray = c[_C_NUM]
		var pos: Variant = c[_C_POS]
		var poss_ok: Variant = null
		var poss_raw: Variant = null
		if c[_C_POSS] != null:
			if pos == null:
				poss_raw = c[_C_POSS]
			elif b[_B_FLAGS]&_F_POSS_OK:
				poss_ok = c[_C_POSS]
			else:
				poss_ok = sanea_poss(c[_C_POSS], String(pos))
		var resto: Dictionary = c[_C_RESTO] if c[_C_RESTO] != null else {}
		var nombre_c: Variant = c[_C_NAME]
		return [idx, pos, b, b[_B_NUMBER] if b[_B_NUMBER] > 0 else -1, poss_ok, nombre_c,
			c[_C_NATION], b[_B_AGE] if b[_B_AGE] > 0 else null,
			String(nombre_c).hash() if nombre_c != null else 0,
			clampi(int(resto["contract"]), CONTRACT_MIN, CONTRACT_MAX)
				if resto.has("contract") else -1,
			poss_raw, resto.get("carrera", null), resto.get("etapa_desde", null)]
	var ov: Dictionary = v
	var stats: Array = []
	for k in STAT_KEYS:
		if ov.has(k):
			stats.append(k)
			stats.append(clampi(int(ov[k]), STAT_MIN, STAT_MAX))
	var nombre: Variant = String(ov["name"]) if ov.has("name") else null
	var con_pos: bool = ov.has("pos")
	return [idx, String(ov["pos"]) if con_pos else null, stats,
		clampi(int(ov["number"]), NUM_MIN, NUM_MAX) if ov.has("number") else -1,
		sanea_poss(ov["poss"], String(ov["pos"])) if ov.has("poss") and con_pos else null,
		nombre, String(ov["nation"]) if ov.has("nation") else null,
		ov["age"] if ov.has("age") else null,
		String(nombre).hash() if nombre != null else 0,
		clampi(int(ov["contract"]), CONTRACT_MIN, CONTRACT_MAX) if ov.has("contract") else -1,
		ov["poss"] if ov.has("poss") and not con_pos else null,
		ov.get("carrera", null), ov.get("etapa_desde", null)]







static func _compacta(ov: Dictionary) -> Variant:
	var b: PackedByteArray = PackedByteArray()
	b.resize(_B_FLAGS + 1)
	b.fill(0)
	for j in STAT_KEYS.size():
		var x: Variant = ov.get(STAT_KEYS[j], null)
		if typeof(x) != TYPE_INT or int(x) < STAT_MIN or int(x) > STAT_MAX:
			return ov
		b[j] = int(x)
	var c: Array = [null, null, null, null, null, null]
	var resto: Dictionary = {}
	for k in ov:
		if typeof(k) != TYPE_STRING:
			return ov
		var x: Variant = ov[k]
		if k == "name" or k == "pos" or k == "nation":
			if typeof(x) != TYPE_STRING:
				return ov
			c[_C_NAME if k == "name" else (_C_POS if k == "pos" else _C_NATION)] = x
		elif k == "poss":
			if typeof(x) != TYPE_ARRAY:
				return ov
			c[_C_POSS] = x
		elif k == "number":
			if typeof(x) != TYPE_INT or int(x) < NUM_MIN or int(x) > NUM_MAX:
				return ov
			b[_B_NUMBER] = int(x)
		elif k == "age":
			if typeof(x) != TYPE_INT or int(x) < AGE_MIN or int(x) > AGE_MAX:
				return ov
			b[_B_AGE] = int(x)
		elif not STAT_KEYS.has(k):
			resto[k] = x


	if c[_C_POS] != null and c[_C_POSS] != null \
			and sanea_poss(c[_C_POSS], String(c[_C_POS])) == c[_C_POSS]:
		b[_B_FLAGS] = _F_POSS_OK
	c[_C_NUM] = b
	if not resto.is_empty():
		c[_C_RESTO] = resto
	return var_to_bytes(c)





static func _ficha(v: Variant) -> Dictionary:
	if v is Dictionary:
		return v
	if not (v is PackedByteArray):
		return {}
	var c: Array = bytes_to_var(v)
	var b: PackedByteArray = c[_C_NUM]
	var d: Dictionary = {}
	if c[_C_NAME] != null:
		d["name"] = c[_C_NAME]
	if c[_C_POSS] != null:
		d["poss"] = c[_C_POSS]
	for j in STAT_KEYS.size():
		d[STAT_KEYS[j]] = b[j]
	if b[_B_AGE] > 0:
		d["age"] = b[_B_AGE]
	if c[_C_NATION] != null:
		d["nation"] = c[_C_NATION]
	if c[_C_RESTO] != null:
		d.merge(c[_C_RESTO])
	if c[_C_POS] != null:
		d["pos"] = c[_C_POS]
	if b[_B_NUMBER] > 0:
		d["number"] = b[_B_NUMBER]
	return d




static func _campo(v: Variant, k: String, def: Variant = null) -> Variant:
	if v is Dictionary:
		return (v as Dictionary).get(k, def)
	if not (v is PackedByteArray):
		return def
	var c: Array = bytes_to_var(v)
	var b: PackedByteArray = c[_C_NUM]
	var i: int = STAT_KEYS.find(k)
	if i >= 0:
		return b[i]
	var x: Variant = null
	if k == "name":
		x = c[_C_NAME]
	elif k == "pos":
		x = c[_C_POS]
	elif k == "poss":
		x = c[_C_POSS]
	elif k == "nation":
		x = c[_C_NATION]
	elif k == "number":
		if b[_B_NUMBER] > 0:
			x = b[_B_NUMBER]
	elif k == "age":
		if b[_B_AGE] > 0:
			x = b[_B_AGE]
	elif c[_C_RESTO] != null:
		x =(c[_C_RESTO] as Dictionary).get(k, null)
	return def if x == null else x




static func ficha_guardada(team_id: String, idx: int) -> Dictionary:
	_ensure_loaded()
	return _ficha((_data.get(team_id, {}) as Dictionary).get(str(idx), null))







static func _texto_tabla() -> String:
	var ids: Array = _data.keys()
	ids.sort()
	var clubes: PackedStringArray = PackedStringArray()
	for tid in ids:
		var club: Dictionary = _data[tid]
		var abierto: Dictionary = {}
		for k in club:
			abierto[k] = _ficha(club[k])
		clubes.append(JSON.stringify(String(tid)) + ":" + JSON.stringify(abierto))
	return "{\"format\":" + JSON.stringify(FORMAT) + ",\"roster\":" \
			+ JSON.stringify(RosterDelta.base_to_dict()) + ",\"teams\":{" + ",".join(clubes) + "}}"















static func apply_meta(team_id: String, meta: Array) -> void:
	_ensure_loaded()
	if not _data.has(team_id):
		return
	var team_edits: Dictionary = _data[team_id]



	var fabrica: Array = []
	var por_persona: Dictionary = {}
	var fabrica_leida: bool = false
	for key in team_edits:
		var idx: int = int(String(key))
		if idx < 0 or idx >= meta.size():
			continue


		var fila: Array = _fila(idx, team_edits[key])
		var pm: Dictionary = meta[idx]
		if fila[7] != null:
			pm["age"] = clampi(int(fila[7]), AGE_MIN, AGE_MAX)
		if fila[6] != null:
			pm["nation"] = String(fila[6])
















		if int(fila[9]) >= 0:
			var edad: int = int(pm.get("age", 25))
			pm["contract"] = mini(int(fila[9]), maxi(SquadMeta.AGE_CAP - edad, 1))
		elif fila[5] != null:
			if not fabrica_leida:






				fabrica = Squad.factory_view(team_id)
				por_persona = _por_persona(fabrica)
				fabrica_leida = true
			if idx < fabrica.size():
				var de_fabrica: Dictionary = fabrica[idx]
				var misma: Dictionary = por_persona.get(int(fila[8]), {})
				if String(fila[5]) == String(de_fabrica.get("name", "")):
					pass
				elif misma.has("contract"):
					pm["contract"] = mini(int(misma["contract"]),
						maxi(SquadMeta.AGE_CAP - int(pm.get("age", 25)), 1))
				elif de_fabrica.has("contract"):
					pm["contract"] = SquadMeta.contract_roll(team_id,
						Teams.country_of(team_id), idx,
						String(de_fabrica.get("pos", "MC")), int(pm.get("age", -1)),
						String(pm.get("nation", "")))









static func _por_persona(squad: Array) -> Dictionary:
	var out: Dictionary = {}
	for s in squad:
		var f: Dictionary = s
		var nombre: String = String(f.get("name", ""))
		if nombre.is_empty():
			continue
		var d: Dictionary = {}
		if f.has("carrera"):
			d["carrera"] = f["carrera"]
		if f.has("etapa_desde"):
			d["etapa_desde"] = int(f["etapa_desde"])
		if f.has("contract"):
			d["contract"] = int(f["contract"])
		if d.is_empty():
			continue
		out[PlayerLooks.semilla(nombre)] = d
		out[nombre.hash()] = d
	return out









static func set_slot(team_id: String, idx: int, player: Dictionary) -> void:
	_ensure_loaded()
	if not _data.has(team_id):
		_data[team_id] = {}
	var out: Dictionary = snapshot_full(player)







	if out.has("contract"):
		var fabrica: Array = _fabrica_de(team_id)
		if idx >= 0 and idx < fabrica.size():
			var de_fabrica: Dictionary = fabrica[idx]
			if String(out.get("name", "")) == String(de_fabrica.get("name", "")) \
					and int(out["contract"]) == int(de_fabrica.get("contract", -1)):
				out.erase("contract")
	var antes: Dictionary = _ficha((_data[team_id] as Dictionary).get(str(idx), null))
	_data[team_id][str(idx)] = _compacta(out)
	if _retenida > 0 and _lote <= 0:



		_retenida_pendiente = true
		_publica_cara(antes, out)
	else:
		_write()
	_touch(team_id)






static func _publica_cara(antes: Variant, out: Dictionary) -> void:
	var nombre: String = String(out.get("name", ""))
	var cfg: Dictionary = look_cfg(out.get("look", null))
	var antes_d: Dictionary = antes if antes is Dictionary else {}
	if String(antes_d.get("name", "")) == nombre and look_cfg(antes_d.get("look", null)) == cfg:
		return
	if not nombre.is_empty() and not cfg.is_empty() \
			and String(antes_d.get("name", "")) == nombre:
		PlayerLooks.set_base_one(nombre, cfg)
		return
	_publish_looks()






static func would_break_protected_pos(team_id: String, idx: int, new_pos: String) -> bool:
	var old_pos: String = String(effective(team_id, idx).get("pos", ""))
	if old_pos == new_pos or not PROTECTED_POS.has(old_pos):
		return false



	var squad: Array = Squad.home_of(team_id)
	for i in squad.size():
		if i != idx and String(squad[i].get("pos", "")) == old_pos:
			return false
	return true








static func swap(team_a: String, idx_a: int, team_b: String, idx_b: int) -> void:
	if team_a == team_b and idx_a == idx_b:
		return




	var pa: Dictionary = snapshot_identity(raw_full(team_a, idx_a))
	var pb: Dictionary = snapshot_identity(raw_full(team_b, idx_b))
	_ensure_loaded()
	if not _data.has(team_a):
		_data[team_a] = {}
	if not _data.has(team_b):
		_data[team_b] = {}
	_data[team_a][str(idx_a)] = _compacta(pb)
	_data[team_b][str(idx_b)] = _compacta(pa)
	_write()
	_touch(team_a)
	_touch(team_b)






static func drop_seat(team_id: String, idx: int) -> void:
	_ensure_loaded()
	if not _data.has(team_id):
		return
	var limpio: Dictionary = RosterDelta.renumber(_data[team_id], idx)
	if limpio.is_empty():
		_data.erase(team_id)
	else:
		_data[team_id] = limpio
	_write()
	_touch(team_id)










static func flush() -> void:
	_ensure_loaded()
	_write()

















static func shift_team(team_id: String, delta: int) -> void:
	if delta == 0:
		return
	_ensure_loaded()
	Squad.suspend_gold_floor()





	var squad: Array = Squad.home_of(team_id)
	Squad.resume_gold_floor()
	if squad.is_empty():
		return
	var edits: Dictionary = _data.get(team_id, {})
	for i in squad.size():
		var base: Dictionary = squad[i]
		var snap: Dictionary = _ficha(edits.get(str(i), null)).duplicate()
		snap["name"] = String(base.get("name", snap.get("name", ""))).substr(0, NAME_MAX)
		for k in STAT_KEYS:
			snap[k] = clampi(int(base.get(k, 70)) + delta, STAT_MIN, STAT_MAX)
		edits[str(i)] = _compacta(snap)
	_data[team_id] = edits
	_touch(team_id)
	_write()


static func clear_slot(team_id: String, idx: int) -> void:
	_ensure_loaded()
	if not _data.has(team_id):
		return
	_data[team_id].erase(str(idx))
	if _data[team_id].is_empty():
		_data.erase(team_id)
	_write()
	_touch(team_id)



static func reset_team(team_id: String) -> void:
	_ensure_loaded()
	if not _data.has(team_id):
		return
	_data.erase(team_id)
	_write()
	_touch(team_id)


















static func effective(team_id: String, idx: int) -> Dictionary:
	var squad: Array = Squad.home_of(team_id)
	if idx < 0 or idx >= squad.size():
		return {}
	return (squad[idx] as Dictionary).duplicate()






static func effective_full(team_id: String, idx: int) -> Dictionary:
	var out: Dictionary = effective(team_id, idx)
	if out.is_empty():
		return out
	var meta: Array = SquadMeta.seed(team_id, Teams.country_of(team_id))
	apply_meta(team_id, meta)




	if idx >= meta.size():
		return out
	var pm: Dictionary = meta[idx]
	out["age"] = int(pm.get("age", 26))
	out["nation"] = String(pm.get("nation", Teams.country_of(team_id)))
	out["look"] = look_of(team_id, idx)
	return out











static func effective_full_all(team_id: String) -> Array:


	var squad: Array = Squad.home_of(team_id)
	if squad.is_empty():
		return []
	var pais: String = Teams.country_of(team_id)
	var meta: Array = SquadMeta.seed(team_id, pais)
	apply_meta(team_id, meta)
	var out: Array = []
	for i in squad.size():
		var e: Dictionary =(squad[i] as Dictionary).duplicate()
		var pm: Dictionary = meta[i] if i < meta.size() else {}
		e["age"] = int(pm.get("age", 26))
		e["nation"] = String(pm.get("nation", pais))
		e["look"] = look_of(team_id, i)
		out.append(e)
	return out














static func raw_full(team_id: String, idx: int) -> Dictionary:
	Squad.suspend_gold_floor()
	var out: Dictionary = effective_full(team_id, idx)
	Squad.resume_gold_floor()
	return out












static func raw_look(team_id: String, idx: int) -> Variant:
	_ensure_loaded()
	if not _data.has(team_id):
		return null
	return _campo((_data[team_id] as Dictionary).get(str(idx), null), "look", null)






static func pot_of(team_id: String, idx: int) -> int:
	_ensure_loaded()
	if not _data.has(team_id):
		return -1
	return int(_campo((_data[team_id] as Dictionary).get(str(idx), null), "pot", -1))












static func age_of(team_id: String, idx: int) -> int:
	_ensure_loaded()
	if not _data.has(team_id):
		return -1
	var edad: Variant = _campo((_data[team_id] as Dictionary).get(str(idx), null), "age")
	if edad == null:
		return -1
	return clampi(int(edad), AGE_MIN, AGE_MAX)










static func nation_of(team_id: String, idx: int) -> String:
	_ensure_loaded()
	if not _data.has(team_id):
		return ""
	return String(_campo((_data[team_id] as Dictionary).get(str(idx), null), "nation", ""))









static func asiento_de_nombre(nombre: String) -> Array:
	_ensure_loaded()
	for team_id in _data:
		var club: Dictionary = _data[team_id]
		for k in club:
			if String(_campo(club[k], "name", "")) == nombre:
				return [String(team_id), int(k)]
	return []


static func name_of(team_id: String, idx: int) -> String:
	_ensure_loaded()
	if not _data.has(team_id):
		return ""
	return String(_campo((_data[team_id] as Dictionary).get(str(idx), null), "name", ""))





static func look_of(team_id: String, idx: int) -> Dictionary:
	_ensure_loaded()
	if not _data.has(team_id):
		return {}
	return look_cfg(_campo((_data[team_id] as Dictionary).get(str(idx), null), "look", null))


static func slot_edited(team_id: String, idx: int) -> bool:
	_ensure_loaded()
	return _data.has(team_id) and _data[team_id].has(str(idx))


static func has_edits(team_id: String) -> bool:
	_ensure_loaded()
	return _data.has(team_id)



static func edited_team_count() -> int:
	_ensure_loaded()
	return _data.size()















const PACK_MIN_CLUBES: int = 40

static func pack_de_personas() -> bool:
	_ensure_loaded()
	return _data.size() >= PACK_MIN_CLUBES







static func pack_de_personas_cargado() -> bool:
	return _loaded and _data.size() >= PACK_MIN_CLUBES




static func edited_teams() -> Array:
	_ensure_loaded()
	return _data.keys()





static func edited_slots(team_id: String) -> Array:
	_ensure_loaded()
	if not _data.has(team_id):
		return []
	var out: Array = []
	for key in (_data[team_id] as Dictionary):
		out.append(int(String(key)))
	out.sort()
	return out











static func reset_all() -> void:
	_ensure_loaded()
	var habia_estructura: bool = not RosterDelta.base_to_dict().is_empty()
	RosterDelta.clear_base()
	if _data.is_empty():


		if habia_estructura:
			Squad.invalidate()


			Squad.invalidate_formaciones()
			NatTeam.invalidate_candidates()
			_write()
		return
	for team_id in _data.keys():
		_touch(String(team_id))
	_data = {}
	_write()

































static func warm() -> void:
	if _loaded or _tarea_bg != -1:
		return
	var ruta: String = save_path()
	if not FileAccess.file_exists(ruta):
		_ensure_loaded()
		return
	_bg_ruta = ruta
	_bg_parsed = null
	_bg_limpio = null
	_tarea_bg = WorkerThreadPool.add_task(_parsea_bg, false, "SquadEdits.warm")
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	if arbol == null:
		_ensure_loaded.call_deferred()
	elif not arbol.process_frame.is_connected(_vigila_bg):
		arbol.process_frame.connect(_vigila_bg)





static func _vigila_bg() -> void:
	if _tarea_bg != -1 and not WorkerThreadPool.is_task_completed(_tarea_bg):
		return
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	if arbol != null and arbol.process_frame.is_connected(_vigila_bg):
		arbol.process_frame.disconnect(_vigila_bg)
	_ensure_loaded()





static func adopta_si_pendiente() -> void:
	if _tarea_bg != -1:
		_ensure_loaded()







static var _tarea_bg: int = -1
static var _bg_ruta: String = ""
static var _bg_parsed: Variant = null
static var _bg_limpio: Variant = null

static func _parsea_bg() -> void:
	var f: FileAccess = FileAccess.open(_bg_ruta, FileAccess.READ)
	if f == null:
		return
	_bg_parsed = JSON.parse_string(f.get_as_text())
	if not (_bg_parsed is Dictionary):
		return
	var teams_v: Variant =(_bg_parsed as Dictionary).get("teams", {})
	if teams_v is Dictionary:
		var data: Dictionary = _sanea_clubes(teams_v)
		_bg_limpio = {"data": data, "looks": _indice_looks(data)}







		_bg_parsed = {"roster":(_bg_parsed as Dictionary).get("roster", {})}





static func _recoge_bg() -> Variant:
	if _tarea_bg == -1:
		return null
	WorkerThreadPool.wait_for_task_completion(_tarea_bg)
	_tarea_bg = -1
	var parsed: Variant = _bg_parsed
	var ruta: String = _bg_ruta
	_bg_parsed = null
	_bg_ruta = ""
	if ruta != save_path():
		_bg_limpio = null
		return null
	return parsed


static func invalidate() -> void:
	_recoge_bg()
	_bg_limpio = null




	_retenida_pendiente = false
	_loaded = false
	_data = {}
	PlayerLooks.clear()





	Squad.invalidate_formaciones()


static func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	_data = {}




	PlayerLooks.clear()



	RosterDelta.clear_base()


	var parsed: Variant = _recoge_bg()
	var limpio: Variant = _bg_limpio
	_bg_limpio = null
	if parsed == null:
		limpio = null
		if not FileAccess.file_exists(save_path()):
			return
		var f: FileAccess = FileAccess.open(save_path(), FileAccess.READ)
		if f == null:
			return
		parsed = JSON.parse_string(f.get_as_text())
	if not (parsed is Dictionary):
		return




	RosterDelta.base_load_from((parsed as Dictionary).get("roster", {}))
	if limpio is Dictionary:
		_data = limpio["data"]
		PlayerLooks.set_all(limpio["looks"])
		return
	var teams_v: Variant =(parsed as Dictionary).get("teams", {})
	if not (teams_v is Dictionary):
		return
	_data = _sanea_clubes(teams_v)
	_publish_looks()





static func _sanea_clubes(teams: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for team_id in teams:
		var team_edits: Variant = teams[team_id]
		if not (team_edits is Dictionary):
			continue
		var clean: Dictionary = {}
		for key in (team_edits as Dictionary):
			var ov: Variant = team_edits[key]
			if ov is Dictionary:
				clean[String(key)] = _compacta(snapshot_full(ov))
		if not clean.is_empty():
			out[String(team_id)] = clean
	return out










static var _lote: int = 0
static var _lote_pendiente: bool = false







static var _fabrica_memo: Dictionary = {}








static func _fabrica_de(team_id: String) -> Array:
	if _lote <= 0:
		return Squad.factory_view(team_id)
	if not _fabrica_memo.has(team_id):
		_fabrica_memo[team_id] = Squad.factory_view(team_id)
	return _fabrica_memo[team_id]


static func begin_batch() -> void:
	_lote += 1








static var _formac_lote: Dictionary = {}


static func end_batch() -> void:
	_lote = maxi(0, _lote - 1)
	if _lote == 0:
		_fabrica_memo.clear()
		if not _formac_lote.is_empty():

			Squad.invalidate_formaciones()
			_formac_lote.clear()
	if _lote == 0 and _lote_pendiente:
		_lote_pendiente = false
		_write()





















static var _retenida: int = 0
static var _retenida_pendiente: bool = false


static func retiene() -> void:
	_retenida += 1


static func suelta() -> void:
	_retenida = maxi(0, _retenida - 1)
	if _retenida == 0:
		vuelca()



static func vuelca() -> void:
	if _retenida_pendiente:
		_write()



static func pendiente() -> bool:
	return _retenida_pendiente


static func _write() -> void:
	if _lote > 0:
		_lote_pendiente = true
		return
	_retenida_pendiente = false
	_publish_looks()









	SaveSlotsScript.escribe_atomico(save_path(), _texto_tabla())









static func _publish_looks() -> void:
	PlayerLooks.set_all(_indice_looks(_data))




static func _indice_looks(data: Dictionary) -> Dictionary:
	var index: Dictionary = {}
	for team_id in data:
		for key in (data[team_id] as Dictionary):
			var ov: Variant = data[team_id][key]
			var cfg: Dictionary = look_cfg(_campo(ov, "look", null))
			if cfg.is_empty():
				continue
			var person: String = String(_campo(ov, "name", ""))
			if person.is_empty():
				continue
			index[person] = cfg
	return index












const PARTICULAS: Array[String] = ["de", "del", "da", "das", "do", "dos", "van", "von",
	"der", "den", "ter", "ten", "van't", "op", "la", "le", "les", "du", "di", "dal",
	"della", "degli", "bin", "ibn", "el", "y", "e", "af", "av"]


const PREFIJOS_INTERNOS: Array[String] = ["mac", "mc", "o'", "d'", "l'"]






static func a_titulo(nombre: String) -> String:
	if nombre != nombre.to_upper() or nombre == nombre.to_lower():
		return nombre
	var palabras: PackedStringArray = nombre.split(" ", false)
	var fuera: PackedStringArray = PackedStringArray()
	for i in palabras.size():
		var bajo: String = palabras[i].to_lower()
		fuera.append(bajo if i > 0 and PARTICULAS.has(bajo)
			else _capitaliza_palabra(palabras[i]))
	return " ".join(fuera)


static func _capitaliza_palabra(w: String) -> String:
	if w.contains("-"):
		var partes: PackedStringArray = PackedStringArray()
		for x in w.split("-"):
			partes.append(_capitaliza_palabra(x))
		return "-".join(partes)
	if w.is_empty():
		return w
	var bajo: String = w.to_lower()
	for pref in PREFIJOS_INTERNOS:
		if bajo.begins_with(pref) and bajo.length() > pref.length():
			return bajo.substr(0, 1).to_upper() + bajo.substr(1, pref.length() - 1) \
					+ _capitaliza_palabra(w.substr(pref.length()))
	return bajo.substr(0, 1).to_upper() + bajo.substr(1)


static func snapshot_full(player: Dictionary) -> Dictionary:
	var out: Dictionary = snapshot_identity(player)



	var pos_ok: String = pos_canon(player.get("pos", ""))
	if not pos_ok.is_empty():
		out["pos"] = pos_ok
	var poss_ok: Array = sanea_poss(player.get("poss", null),
		pos_ok if not pos_ok.is_empty() else String(player.get("pos", "")))
	if not poss_ok.is_empty():
		out["poss"] = poss_ok


	if player.has("number") and int(player["number"]) > 0:
		out["number"] = clampi(int(player["number"]), NUM_MIN, NUM_MAX)
	return out














static func sanea_poss(raw: Variant, pos: String) -> Array:
	if pos == "POR":
		return ["POR"]
	var fuera: Array = []
	if raw is Array:
		for v in (raw as Array):
			var p: String = pos_canon(v)
			if not p.is_empty() and p != "POR" and not fuera.has(p):
				fuera.append(p)
	if fuera.is_empty():
		return []



	return fuera.slice(0, Squad.POS_MAX)


static func snapshot_identity(player: Dictionary) -> Dictionary:







	var out: Dictionary = {"name": a_titulo(
		String(player.get("name", ""))).substr(0, NAME_MAX)}



	var poss: Array = sanea_poss(player.get("poss", null), String(player.get("pos", "")))
	if not poss.is_empty():
		out["poss"] = poss
	for k in STAT_KEYS:
		out[k] = clampi(int(player.get(k, 70)), STAT_MIN, STAT_MAX)
	if player.has("age"):
		out["age"] = clampi(int(player["age"]), AGE_MIN, AGE_MAX)


	if int(player.get("pot", -1)) > 0:
		out["pot"] = clampi(int(player["pot"]), POT_MIN, POT_MAX)
	if player.has("nation"):
		out["nation"] = String(player["nation"]).substr(0, NATION_MAX)








	if int(player.get("contract", 0)) > 0:
		out["contract"] = clampi(int(player["contract"]), CONTRACT_MIN, CONTRACT_MAX)
	var look: Dictionary = _snapshot_look(player.get("look", null))
	if not look.is_empty():
		out["look"] = look




	var tray: Dictionary = TransferBook.carrera_de_pack(player.get("carrera", null),
		player.get("etapa_desde", null))
	if not (tray["carrera"] as Array).is_empty():
		out["carrera"] = tray["carrera"]
	if not (tray["carrera"] as Array).is_empty() or int(tray["etapa_desde"]) != 0:
		out["etapa_desde"] = int(tray["etapa_desde"])
	return out






static func _snapshot_look(raw: Variant) -> Dictionary:
	if not (raw is Dictionary) or (raw as Dictionary).is_empty():
		return {}
	var src: Dictionary = raw
	var out: Dictionary = {}
	var defaults: Dictionary = {
		"skin": KitRecolor.REF_SKIN, "hair": KitRecolor.REF_HAIR,
	}
	for k in LOOK_COLOR_KEYS:
		var v: Variant = src.get(k, null)
		var col: Color = defaults[k]
		if v is Color:
			col = v
		elif v is String and Color.html_is_valid(String(v)):
			col = Color(String(v))
		out[k] = col.to_html(false)
	var pools: Dictionary = {
		"hair_style": KitRecolor.HAIR_STYLES + KitRecolor.EXTRA_HAIR_STYLES,
		"facial_hair": KitRecolor.FACIAL_HAIR + KitRecolor.EXTRA_FACIAL_HAIR,
	}
	var fallbacks: Dictionary = {"hair_style": "normal", "facial_hair": "none"}
	for k in LOOK_STYLE_KEYS:
		var val: String = String(src.get(k, fallbacks[k]))
		out[k] = val if (pools[k] as Array).has(val) else String(fallbacks[k])


	for k in LOOK_COLOR_OPT:
		var cv: Variant = src.get(k, null)
		if cv is Color:
			out[k] =(cv as Color).to_html(false)
		elif cv is String and Color.html_is_valid(String(cv)):
			out[k] = Color(String(cv)).to_html(false)
	var pools_opt: Dictionary = {
		"tattoo": LOOK_TATTOO_SIDES, "tattoo_pat": KitRecolor.TAT_PATTERNS,
		"tattoo_style": ["none", "left", "right", "both"], "tattoo_pattern": KitRecolor.TAT_PATTERNS,
		"tattoo_leg": LOOK_TATTOO_SIDES, "tattoo_leg_pat": KitRecolor.TAT_PATTERNS,
		"tattoo_leg_style": ["none", "left", "right", "both"],
		"tattoo_leg_pattern": KitRecolor.TAT_PATTERNS,

		"wristband_style": ["none", "left", "right", "both"],
		"arm_sleeve_style": ["none", "left", "right", "both"],
		"arm_wrap_style": ["none", "left", "right", "both"],
		"sock_style": ["none", "cinta", "bajadas"],

		"tights_style": KitRecolor.TIGHTS_STYLES,
		"knee_style": KitRecolor.KNEE_SIDES,
		"knee_kind": KitRecolor.KNEE_KINDS,
	}
	for k in LOOK_STYLE_OPT:
		if not src.has(k):
			continue
		var sv: String = String(src[k])





		if k == "modular_hair":
			sv = LookMigracion.pelo(sv)
		elif k == "modular_beard":
			sv = LookMigracion.barba(sv)
		if k.begins_with("modular_"):
			if Appearance.valid(k, sv):
				out[k] = sv
		elif (pools_opt[k] as Array).has(sv):
			out[k] = sv



	if not out.has("tattoo"):
		out.erase("tattoo_pat")
		out.erase("tattoo_ink")
	if not out.has("tattoo_style") or out.get("tattoo_style") == "none":
		out.erase("tattoo_pattern")
		out.erase("tattoo_color")

	if not out.has("tattoo_leg"):
		out.erase("tattoo_leg_pat")
		out.erase("tattoo_leg_ink")

	if not out.has("knee_style") or out.get("knee_style") == "none":
		out.erase("knee_kind")
	if not out.has("tattoo_leg_style") or out.get("tattoo_leg_style") == "none":
		out.erase("tattoo_leg_pattern")
		out.erase("tattoo_leg_color")

	if not out.has("modular_neck_tattoo") or out.get("modular_neck_tattoo") == "none":
		out.erase("neck_tattoo_color")
	return out




static func look_cfg(stored: Variant) -> Dictionary:
	if not (stored is Dictionary) or (stored as Dictionary).is_empty():
		return {}
	var src: Dictionary = stored
	var out: Dictionary = {}
	for k in LOOK_COLOR_KEYS:
		var hex: String = String(src.get(k, ""))
		if Color.html_is_valid(hex):
			out[k] = Color(hex)
	for k in LOOK_STYLE_KEYS:
		if src.has(k):
			out[k] = String(src[k])
	for k in LOOK_COLOR_OPT:
		var hex_o: String = String(src.get(k, ""))
		if Color.html_is_valid(hex_o):
			out[k] = Color(hex_o)
	for k in LOOK_STYLE_OPT:
		if src.has(k):
			out[k] = String(src[k])
	return out





static func _touch(team_id: String) -> void:
	Squad.invalidate(team_id)



	if _lote > 0:
		_formac_lote[team_id] = true
	else:
		Squad.invalidate_formaciones(team_id)
	NatTeam.invalidate_candidates()















static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()
