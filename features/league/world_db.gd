class_name WorldDB
extends RefCounted


















































const RUTA: String = "res://features/league/mundo.bin"
const MAGIA: int = 894913606
const REG_FIJO: int = 20




const STATS: Array[String] = ["pegada", "punteria", "rosca", "cabeza", "penal",
	"parado", "reflejos", "velocidad", "entrada", "aceleracion", "regate", "fisico"]



const POS: Array[String] = ["POR", "DFC", "LTI", "LTD", "MCD", "MC", "MI", "MD",
	"EI", "ED", "CAM", "DC"]



const VIAS: Array[String] = ["fichaje", "cesion", "vuelta", "compra", "libre", "editor"]

static var _bytes: PackedByteArray = PackedByteArray()
static var _indice: Dictionary = {}
static var _naciones: PackedStringArray = PackedStringArray()















static var _cache: Dictionary = {}


static var _a_mano: Dictionary = {}

const _C_P: int = 0
const _C_NOMBRE: int = 1
const _C_REAL: int = 2
const _C_DESDE: int = 3
const _C_LVL: int = 4
const _C_CARRERA: int = 5
static var _cargado: bool = false
static var _roto: bool = false







static func _carga() -> void:
	if _cargado:
		return
	_cargado = true
	if not FileAccess.file_exists(RUTA):



		_roto = true
		return
	_bytes = FileAccess.get_file_as_bytes(RUTA)
	if _bytes.size() < 16 or _bytes.decode_u32(0) != MAGIA:
		push_warning("WorldDB: %s no es un mundo FLW5" % RUTA)
		_roto = true
		return
	var n_clubes: int = _bytes.decode_u32(4)
	var largo_ind: int = _bytes.decode_u32(8)
	var off_nac: int = _bytes.decode_u32(12)
	var p: int = 16
	var fin_ind: int = 16 + largo_ind
	for _i in n_clubes:
		var ln: int = _bytes.decode_u8(p)
		p += 1
		var cid: String = _bytes.slice(p, p + ln).get_string_from_utf8()
		p += ln
		_indice[cid] = [fin_ind + _bytes.decode_u32(p), _bytes.decode_u16(p + 4)]
		p += 6
	var q: int = off_nac
	var n_nac: int = _bytes.decode_u16(q)
	q += 2
	for _i in n_nac:
		var ln2: int = _bytes.decode_u8(q)
		q += 1
		_naciones.append(_bytes.slice(q, q + ln2).get_string_from_utf8())
		q += ln2




static func has(team_id: String) -> bool:
	_carga()
	return _indice.has(team_id)




















static func squad_of(team_id: String) -> Array:
	_carga()
	if _roto or not _indice.has(team_id):
		return []
	if not _a_mano.is_empty() and _a_mano.has(team_id):
		return (_a_mano[team_id] as Array).duplicate(true)
	var c: Variant = _cache.get(team_id)
	if c != null:
		return _infla(c)
	return _decodifica(team_id)






static func size_of(team_id: String) -> int:
	_carga()
	if _roto or not _indice.has(team_id):
		return 0
	return int((_indice[team_id] as Array)[1])







static func squad_ref(team_id: String) -> Array:
	return squad_of(team_id)





static func asegura(team_id: String) -> void:
	_carga()
	if not _roto and _indice.has(team_id) and not _cache.has(team_id):
		_decodifica(team_id)




static func _decodifica(team_id: String) -> Array:
	var meta: Array = _indice[team_id]
	var p: int = int(meta[0])
	var n: int = int(meta[1])
	var col_p := PackedInt32Array()
	col_p.resize(n)
	var col_nombre := PackedStringArray()
	col_nombre.resize(n)
	var col_real := PackedStringArray()
	col_real.resize(n)
	var col_desde := PackedInt32Array()
	col_desde.resize(n)
	var col_lvl := PackedInt32Array()
	col_lvl.resize(n)
	var col_carrera: Array = []
	col_carrera.resize(n)
	var out: Array = []
	for i in n:
		col_p[i] = p
		var ficha: Dictionary = _ficha_fija(p)
		var pos: String = ficha["pos"]
		p += REG_FIJO
		var ln: int = _bytes.decode_u8(p)
		p += 1
		ficha["name"] = _bytes.slice(p, p + ln).get_string_from_utf8()
		p += ln





		var lr: int = _bytes.decode_u8(p)
		p += 1
		if lr > 0:
			ficha["real"] = _bytes.slice(p, p + lr).get_string_from_utf8()
		p += lr




		var semilla: int = _bytes.decode_u32(p)
		var ll: int = _bytes.decode_u16(p + 4)
		p += 6
		var cfg: Dictionary = {}
		if ll > 0:
			var raw: Variant = JSON.parse_string(_bytes.slice(p, p + ll).get_string_from_utf8())
			cfg = SquadEdits.look_cfg(SquadEdits._snapshot_look(raw))
		p += ll
		PlayerLooks.set_mundo(String(ficha["name"]), semilla, cfg, String(ficha.get("real", "")))




		var cola: Dictionary = _lee_trayectoria(p)
		var e_desde: int = int(cola["desde"])
		var carrera: Array = cola["carrera"]
		p = int(cola["p"])
		if not carrera.is_empty():
			ficha["carrera"] = carrera

			col_carrera[i] = carrera.duplicate(true)
		if not carrera.is_empty() or e_desde != 0:
			ficha["etapa_desde"] = e_desde
		ficha["_lvl"] = SquadMeta.ovr_of(ficha, pos)
		col_nombre[i] = String(ficha["name"])
		col_real[i] = String(ficha.get("real", ""))
		col_desde[i] = e_desde
		col_lvl[i] = int(ficha["_lvl"])
		out.append(ficha)
	_cache[team_id] = [col_p, col_nombre, col_real, col_desde, col_lvl, col_carrera]
	return out





static func _ficha_fija(p: int) -> Dictionary:
	var nat: String = ""
	var i_nac: int = _bytes.decode_u16(p + 1)
	if i_nac < _naciones.size():
		nat = _naciones[i_nac]
	var mask: int = _bytes.decode_u16(p + 5)
	var poss: Array[String] = []
	for k in POS.size():
		if mask&(1<<k):
			poss.append(POS[k])
	var ficha: Dictionary = {
		"pos": POS[_bytes.decode_u8(p)], "nat": nat, "poss": poss,
		"age": _bytes.decode_u8(p + 3), "number": _bytes.decode_u8(p + 4),
	}




	var contrato: int = _bytes.decode_u8(p + 7)
	if contrato > 0:
		ficha["contract"] = contrato
	for s in STATS.size():
		ficha[STATS[s]] = _bytes.decode_u8(p + REG_FIJO - 12 + s)
	return ficha





static func _infla(c: Array) -> Array:
	var col_p: PackedInt32Array = c[_C_P]
	var nombres: PackedStringArray = c[_C_NOMBRE]
	var reales: PackedStringArray = c[_C_REAL]
	var desde: PackedInt32Array = c[_C_DESDE]
	var lvl: PackedInt32Array = c[_C_LVL]
	var carreras: Array = c[_C_CARRERA]
	var out: Array = []
	out.resize(col_p.size())
	for i in col_p.size():
		var ficha: Dictionary = _ficha_fija(col_p[i])
		ficha["name"] = nombres[i]
		if not reales[i].is_empty():
			ficha["real"] = reales[i]
		var carrera: Variant = carreras[i]
		if carrera != null:
			ficha["carrera"] =(carrera as Array).duplicate(true)
		if carrera != null or desde[i] != 0:
			ficha["etapa_desde"] = desde[i]
		ficha["_lvl"] = lvl[i]
		out[i] = ficha
	return out





static func nation_at(team_id: String, idx: int) -> String:
	var p: int = _p_de(team_id, idx)
	if p < 0:
		return ""
	var i_nac: int = _bytes.decode_u16(p + 1)
	return _naciones[i_nac] if i_nac < _naciones.size() else ""




static func age_at(team_id: String, idx: int) -> int:
	var p: int = _p_de(team_id, idx)
	return _bytes.decode_u8(p + 3) if p >= 0 else -1




static func _p_de(team_id: String, idx: int) -> int:
	_carga()
	if _roto or not _indice.has(team_id):
		return -1
	var meta: Array = _indice[team_id]
	if idx < 0 or idx >= int(meta[1]):
		return -1
	var c: Variant = _cache.get(team_id)
	if c != null:
		return (c[_C_P] as PackedInt32Array)[idx]


	var p: int = int(meta[0])
	for _i in idx:
		p += REG_FIJO
		p += 1 + _bytes.decode_u8(p)
		p += 1 + _bytes.decode_u8(p)
		p += 6 + _bytes.decode_u16(p + 4)
		p = _salta_trayectoria(p)
	return p










static func _lee_trayectoria(p: int, ligera: bool = false) -> Dictionary:
	var e_desde: int = _bytes.decode_s16(p)
	var n_et: int = _bytes.decode_u8(p + 2)
	p += 3
	var carrera: Array = []
	for _e in n_et:
		var lc: int = _bytes.decode_u8(p)
		p += 1
		var et: Dictionary = {"club": _bytes.slice(p, p + lc).get_string_from_utf8()}
		p += lc
		et["desde"] = _bytes.decode_s16(p)
		et["hasta"] = _bytes.decode_s16(p + 2)
		var iv: int = _bytes.decode_u8(p + 4)
		et["via"] = VIAS[iv] if iv < VIAS.size() else VIAS[0]
		p += 5
		var ln3: int = _bytes.decode_u8(p)
		p += 1
		if ln3 > 0 and not ligera:
			et["nombre"] = _bytes.slice(p, p + ln3).get_string_from_utf8()
		p += ln3
		var lp: int = _bytes.decode_u8(p)
		p += 1
		if lp > 0 and not ligera:
			et["pais"] = _bytes.slice(p, p + lp).get_string_from_utf8()
		p += lp
		carrera.append(et)
	return {"desde": e_desde, "carrera": carrera, "p": p}




static func _salta_trayectoria(p: int) -> int:
	var n_et: int = _bytes.decode_u8(p + 2)
	p += 3
	for _e in n_et:
		p += 1 + _bytes.decode_u8(p)
		p += 5
		p += 1 + _bytes.decode_u8(p)
		p += 1 + _bytes.decode_u8(p)
	return p





























static var _por_club: Dictionary = {}
static var _por_club_listo: bool = false
static var _tarea_pasaron: int = -1
static var _pasaron_bg: Dictionary = {}

static func pasaron_por(club_id: String) -> Array:
	_carga()
	if _roto or club_id.is_empty():
		return []
	if not _por_club_listo:
		_indexa_pasaron()
	if not _por_club.has(club_id):
		return []
	return (_por_club[club_id] as Array).duplicate(true)



static func precalienta_pasaron() -> void:
	_carga()
	if _roto or _por_club_listo or _tarea_pasaron != -1:
		return
	_tarea_pasaron = WorkerThreadPool.add_task(_pasaron_en_hilo, false, "WorldDB.pasaron")


static func _pasaron_en_hilo() -> void:
	_pasaron_bg = _construye_pasaron()



static func _indexa_pasaron() -> void:
	_por_club_listo = true
	if _tarea_pasaron != -1:
		WorkerThreadPool.wait_for_task_completion(_tarea_pasaron)
		_tarea_pasaron = -1
		_por_club = _pasaron_bg
		_pasaron_bg = {}
		return
	_por_club = _construye_pasaron()



static func _construye_pasaron() -> Dictionary:
	var por_club: Dictionary = {}
	var t0: int = Time.get_ticks_msec()
	var fichas: int = 0
	for cid in _indice:
		var meta: Array = _indice[cid]
		var p: int = int(meta[0])
		var n: int = int(meta[1])
		for i in n:
			p += REG_FIJO
			p += 1 + _bytes.decode_u8(p)
			p += 1 + _bytes.decode_u8(p)
			p += 6 + _bytes.decode_u16(p + 4)
			var cola: Dictionary = _lee_trayectoria(p, true)
			p = int(cola["p"])
			for et in (cola["carrera"] as Array):
				var club: String = String((et as Dictionary)["club"])
				if club.is_empty():
					continue
				if not por_club.has(club):
					por_club[club] = []
				(por_club[club] as Array).append({"team": cid, "idx": i,
					"desde": int((et as Dictionary)["desde"]),
					"hasta": int((et as Dictionary)["hasta"]),
					"via": String((et as Dictionary)["via"])})
			fichas += 1


	print("WorldDB: índice inverso de trayectoria en %d ms (%d fichas, %d clubes con paso)"
		% [Time.get_ticks_msec() - t0, fichas, por_club.size()])
	return por_club



static func censo() -> Dictionary:
	_carga()
	var fichas: int = 0
	for v in _indice.values():
		fichas += int((v as Array)[1])
	return {"clubes": _indice.size(), "fichas": fichas,
		"naciones": _naciones.size(), "roto": _roto}
