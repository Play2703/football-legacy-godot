class_name RosterDelta
extends RefCounted































































const MIN_SEATS: int = Squad.STARTING_XI + 1
const MAX_SEATS: int = 40


static var _base: Dictionary = {}
static var _career: Dictionary = {}









static var _career_enabled: bool = true


static func suspend_career() -> void:
	_career_enabled = false


static func resume_career() -> void:
	_career_enabled = true


static func career_enabled() -> bool:
	return _career_enabled






static func apply(team_id: String, squad: Array, base: bool) -> void:
	if not base and not _career_enabled:
		return




	if base:
		SquadEdits.warm()
	var ops: Array = _tabla(base).get(team_id, [])
	if ops.is_empty():
		return
	for op in ops:
		if not (op is Dictionary):
			continue
		if String((op as Dictionary).get("op", "")) == "drop":
			var i: int = int((op as Dictionary).get("i", -1))



			if i >= 0 and i < squad.size() and squad.size() > MIN_SEATS:
				squad.remove_at(i)
		else:
			squad.append(_asiento(op as Dictionary))








static func apply_parallel(team_id: String, arr: Array, base: bool,
		relleno: Callable = Callable()) -> void:
	if not base and not _career_enabled:
		return
	var ops: Array = _tabla(base).get(team_id, [])
	if ops.is_empty():
		return
	for op in ops:
		if not (op is Dictionary):
			continue
		if String((op as Dictionary).get("op", "")) == "drop":
			var i: int = int((op as Dictionary).get("i", -1))




			if i >= 0 and i < arr.size() and arr.size() > MIN_SEATS:
				arr.remove_at(i)
		elif relleno.is_valid():
			arr.append(relleno.call(op))
















static func mapa_fabrica(team_id: String, base: bool, seats: int) -> Array:
	var ops: Array = _ops_vivas(team_id, base)
	if ops.is_empty():
		return []
	var mapa: Array = []
	for i in seats:
		mapa.append(i)
	_mapa_aplica(mapa, ops)
	return mapa























static func mapa_fabrica_total(team_id: String, seats: int) -> Array:
	var ops_base: Array = _ops_vivas(team_id, true)
	var ops_carrera: Array = _ops_vivas(team_id, false)
	if ops_base.is_empty() and ops_carrera.is_empty():
		return []
	var mapa: Array = []
	for i in seats:
		mapa.append(i)
	_mapa_aplica(mapa, ops_base)
	_mapa_aplica(mapa, ops_carrera)
	return mapa





static func _ops_vivas(team_id: String, base: bool) -> Array:
	if not base and not _career_enabled:
		return []
	return _tabla(base).get(team_id, [])





static func _mapa_aplica(mapa: Array, ops: Array, relleno: Callable = Callable()) -> void:
	for op in ops:
		if not (op is Dictionary):
			continue
		if String((op as Dictionary).get("op", "")) == "drop":
			var i: int = int((op as Dictionary).get("i", -1))
			if i >= 0 and i < mapa.size() and mapa.size() > MIN_SEATS:
				mapa.remove_at(i)
		elif relleno.is_valid():
			mapa.append(relleno.call(op))
		else:
			mapa.append(-1)









static func altas_carrera(team_id: String, n_base: int) -> Dictionary:
	var ops: Array = _ops_vivas(team_id, false)
	if ops.is_empty():
		return {}
	var filas: Array = []
	for i in n_base:
		filas.append(i)
	_mapa_aplica(filas, ops, func(op: Variant) -> Variant: return op)
	var out: Dictionary = {}
	for idx in filas.size():
		if filas[idx] is Dictionary:
			out[idx] = filas[idx]
	return out





static func tiene_carrera(team_id: String) -> bool:
	return not _ops_vivas(team_id, false).is_empty()





static func tiene_base(team_id: String) -> bool:
	return not _ops_vivas(team_id, true).is_empty()









static func reidentifica(team_id: String, fila: int, n_base: int, identity: Dictionary) -> bool:
	var altas: Dictionary = altas_carrera(team_id, n_base)
	if not altas.has(fila):
		return false
	(altas[fila] as Dictionary)["identity"] = SquadEdits.snapshot_identity(identity)
	return true






static func altas_carrera_total() -> int:
	if not _career_enabled:
		return 0
	var n: int = 0
	for tid in _career:
		for op in _career[tid]:
			if op is Dictionary and String((op as Dictionary).get("op", "")) == "add":
				n += 1
	return n



static func delta_of(team_id: String, base: bool) -> int:
	var n: int = 0
	for op in _tabla(base).get(team_id, []):
		if op is Dictionary:
			n += -1 if String((op as Dictionary).get("op", "")) == "drop" else 1
	return n


static func has(team_id: String) -> bool:
	SquadEdits.adopta_si_pendiente()
	return _base.has(team_id) or _career.has(team_id)









static func drop_seat(team_id: String, idx: int, base: bool, seats: int) -> bool:
	if idx < 0 or idx >= seats or seats <= MIN_SEATS:
		return false
	var t: Dictionary = _tabla(base)
	if not t.has(team_id):
		t[team_id] = []
	(t[team_id] as Array).append({"op": "drop", "i": idx})
	return true




static func add_seat(team_id: String, pos: String, number: int,
		identity: Dictionary, base: bool, seats: int) -> int:
	if seats >= MAX_SEATS:
		return -1
	var t: Dictionary = _tabla(base)
	if not t.has(team_id):
		t[team_id] = []
	(t[team_id] as Array).append({
		"op": "add",
		"pos": SquadEdits.pos_canon(pos) if not SquadEdits.pos_canon(pos).is_empty() else "MC",
		"number": clampi(number, SquadEdits.NUM_MIN, SquadEdits.NUM_MAX),



		"identity": SquadEdits.snapshot_identity(identity),
	})
	return seats






static func reset_last(team_id: String, base: bool) -> void:
	var t: Dictionary = _tabla(base)
	if not t.has(team_id):
		return
	var ops: Array = t[team_id]
	if not ops.is_empty():
		ops.remove_at(ops.size() - 1)
	if ops.is_empty():
		t.erase(team_id)



static func reset_team(team_id: String, base: bool) -> void:
	_tabla(base).erase(team_id)




static func clubes_carrera() -> Array:
	return _career.keys()










static func clubes_que_leen_el_cupo() -> Array:
	var out: Array = []
	SquadEdits.adopta_si_pendiente()
	for tabla in [_base, _career]:
		for tid in tabla:
			for op in tabla[tid]:
				var ident: Variant =(op as Dictionary).get("identity", null) \
						if op is Dictionary else null
				if ident is Dictionary and int((ident as Dictionary).get("pot", -1)) > 0:
					out.append(String(tid))
					break
	return out





static func suma_huella(out: Dictionary) -> void:
	SquadEdits.adopta_si_pendiente()
	for tabla in [_base, _career]:
		for tid in tabla:
			out[String(tid)] = hash([out.get(String(tid), 0),(tabla[tid] as Array).hash()])













static func reancla_carrera(team_id: String, pi: Array, n_viejo: int, n_nuevo: int) -> Array:
	var ops: Array = _career.get(team_id, [])
	if ops.is_empty():
		return pi.duplicate()
	var inversa: Dictionary = {}
	for i in pi.size():
		if int(pi[i]) >= 0:
			inversa[int(pi[i])] = i
	var viejo: Array = []
	for i2 in n_viejo:
		viejo.append(i2)
	var nuevo: Array = []
	for j in n_nuevo:
		nuevo.append(inversa.get(j, "n%d" % j))
	var reescritas: Array = []
	var altas: int = 0
	for op in ops:
		if not (op is Dictionary):
			continue
		if String((op as Dictionary).get("op", "")) != "drop":
			viejo.append("a%d" % altas)
			nuevo.append("a%d" % altas)
			altas += 1
			reescritas.append(op)
			continue
		var k: int = int((op as Dictionary).get("i", -1))
		if k < 0 or k >= viejo.size() or viejo.size() <= MIN_SEATS:
			continue
		var quien: Variant = viejo[k]
		viejo.remove_at(k)
		var donde: int = nuevo.find(quien)
		if donde < 0 or nuevo.size() <= MIN_SEATS:
			continue
		nuevo.remove_at(donde)
		reescritas.append({"op": "drop", "i": donde})
	if reescritas.is_empty():
		_career.erase(team_id)
	else:
		_career[team_id] = reescritas
	var sigma: Array = []
	for h in viejo.size():
		sigma.append(nuevo.find(viejo[h]))
	return sigma






static func renumber(por_indice: Dictionary, idx: int) -> Dictionary:
	var out: Dictionary = {}
	for k in por_indice:
		var i: int = int(String(k))
		if i == idx:
			continue
		out[str(i - 1 if i > idx else i)] = por_indice[k]
	return out




static func base_to_dict() -> Dictionary:
	return _base.duplicate(true)


static func career_to_dict() -> Dictionary:
	return _career.duplicate(true)


static func base_load_from(v: Variant) -> void:
	_base = _sanea(v)


static func career_load_from(v: Variant) -> void:
	_career = _sanea(v)






static func altas_sin_trayectoria() -> Array:
	var out: Array = []
	for team_id in _career:
		for op in (_career[team_id] as Array):
			var o: Dictionary = op
			if String(o.get("op", "")) != "add":
				continue
			var ident: Dictionary = o.get("identity", {})
			if not ident.has("carrera") and not String(ident.get("name", "")).is_empty():
				out.append(ident)
	return out


static func clear_career() -> void:
	_career = {}


static func clear_base() -> void:
	_base = {}





static func _sanea(v: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not (v is Dictionary):
		return out
	for team_id in (v as Dictionary):
		var ops_v: Variant =(v as Dictionary)[team_id]
		if not (ops_v is Array):
			continue
		var limpias: Array = []
		for op in (ops_v as Array):
			if not (op is Dictionary):
				continue
			var o: Dictionary = op
			if String(o.get("op", "")) == "drop":
				var i: int = int(o.get("i", -1))
				if i >= 0:
					limpias.append({"op": "drop", "i": i})
			elif String(o.get("op", "")) == "add":
				limpias.append({
					"op": "add",
					"pos": String(o.get("pos", "MC")),
					"number": int(o.get("number", 0)),
					"identity": SquadEdits.snapshot_identity(
						o.get("identity", {}) if o.get("identity", {}) is Dictionary else {}),
				})
		if not limpias.is_empty():
			out[String(team_id)] = limpias
	return out




static func meta_de(op: Variant) -> Dictionary:
	var ident: Dictionary = {}
	if op is Dictionary and (op as Dictionary).get("identity", null) is Dictionary:
		ident =(op as Dictionary)["identity"]
	return SquadMeta.fresh(int(ident.get("age", 26)), String(ident.get("nation", "")))




static func _tabla(base: bool) -> Dictionary:
	if base:
		SquadEdits.adopta_si_pendiente()
	return _base if base else _career







static func _asiento(op: Dictionary) -> Dictionary:
	var ident: Dictionary = op.get("identity", {})
	var out: Dictionary = {
		"name": String(ident.get("name", "")),
		"pos": String(op.get("pos", "MC")),
		"number": int(op.get("number", 0)),
	}
	var suma: int = 0
	for k in SquadEdits.STAT_KEYS:
		out[k] = int(ident.get(k, 70))
		suma += int(out[k])
	out["_lvl"] = int(round(float(suma) / float(SquadEdits.STAT_KEYS.size())))






	var nacion: String = String(ident.get("nation", ""))
	if not nacion.is_empty():
		out["nat"] = Nations.canon_id(nacion)












	var poss: Array = SquadEdits.sanea_poss(ident.get("poss", null), String(out["pos"]))
	if not poss.is_empty() and PlayerLooks.nace_regen(String(out["name"])) == PlayerLooks.SIN_NACER:
		out["poss"] = poss




	if ident.get("carrera", null) is Array:
		out["carrera"] =(ident["carrera"] as Array).duplicate(true)
	if ident.has("etapa_desde"):
		out["etapa_desde"] = int(ident["etapa_desde"])







		var anos: int = GameState.season_num - int(ident["etapa_desde"])
		if anos > 0 and ident.has("age"):
			WorldAging.crece_alta(out, String(out["pos"]), int(ident["age"]),
				int(ident["age"]) + anos, int(ident.get("pot", -1)))
			suma = 0
			for k in SquadEdits.STAT_KEYS:
				suma += int(out[k])
			out["_lvl"] = int(round(float(suma) / float(SquadEdits.STAT_KEYS.size())))
	return out
