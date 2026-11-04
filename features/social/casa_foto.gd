class_name CasaFoto
extends RefCounted


























const CLAVES: Array[String] = ["house_level", "land_tier", "house_extras", "house_items",
	"house_layout", "house_finishes", "house_finish", "house_pets_off", "pet_names",
	"floor_paint", "lifestyle"]




const PROPIAS: Array[String] = ["awards", "keepsakes", "season_history", "transfers",
	"trophy_pins", "vitrina_picks", "captain_bands", "first_goal", "goal_reel", "jersey_picks",
	"season_best", "best_goal_dist", "best_presentation", "nat_debut", "record_marks",
	"nat_caps", "pareja", "house_used", "house_used_stamp", "house_best", "shirt_name"]















const TROFEOS: Array[String] = ["vitrina", "trophy_pins", "vitrina_picks", "jersey_picks",
	"clubes"]
const MAX_COPAS: int = 999
const MAX_PINS: int = 60
const MAX_PERCHAS: int = 40
const MAX_MARCOS: int = 16
const MAX_CLUBES: int = 60
const MAX_TEMPS: int = 80


const MAX_ITEMS: int = 600
const MAX_EXTRAS: int = 400
const MAX_NODOS: int = 20000
const MAX_HONDO: int = 8
const MAX_PINTURA: int = 20000
const MAX_CELDAS: int = 200000
const MAX_LADO: int = 400
const MAX_TXT: int = 200
const NOMBRE_MAX: int = 24

const MAX_BYTES: int = 240000


static var activa: bool = false





static var pendiente: Dictionary = {}


static var _clubes: Array = []


static var _re_v: RegEx = null










static func de_cfg(path: String, json: String = "") -> Dictionary:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(path) != OK or not cfg.has_section("shop"):
		return {}
	if int(cfg.get_value("shop", "land_tier", -1)) < 0:
		return {}
	var foto: Dictionary = {}
	for k in CLAVES:
		if cfg.has_section_key("shop", k):
			foto[k] = cfg.get_value("shop", k)


	var pin: Variant = foto.get("floor_paint", {})
	var lista: Dictionary = {}
	if pin is Dictionary:
		for k in pin:
			var capa: Variant = pin[k]
			lista[str(k)] = House.pintura_a_lista(capa) if capa is Dictionary else capa
	foto["floor_paint"] = lista


	var crudo: Dictionary = {
		"vitrina": _cuenta(cfg.get_value("career", "awards", [])),
		"trophy_pins": cfg.get_value("shop", "trophy_pins", []),
		"vitrina_picks": cfg.get_value("shop", "vitrina_picks", {}),
		"jersey_picks": cfg.get_value("shop", "jersey_picks", {}),
		"clubes": _clubes_de(cfg.get_value("season", "history", []), json)}
	foto.merge(_trofeos(crudo), true)
	return foto



static func _cuenta(awards: Variant) -> Dictionary:
	var out: Dictionary = {}
	if awards is Array:
		for a in awards:
			if a is String and Trophies.CATALOG.has(a):
				out[a] = int(out.get(a, 0)) + 1
	return out





static func _clubes_de(hist: Variant, json: String) -> Array:
	var hoy: String = ""
	var dorsal_hoy: int = 0
	var temp_hoy: int = 0
	if not json.is_empty():
		var data: Dictionary = SaveSlots.read_json_dict(json)
		hoy = String(data.get("player_team_id", ""))
		dorsal_hoy = int(data.get("player_number", 0))
		temp_hoy = int(data.get("season_num", 0))
	var orden: Array = []
	var por: Dictionary = {}
	for r in (hist as Array if hist is Array else []):
		if not (r is Dictionary):
			continue
		var id: String = String(r.get("club", ""))
		if id.is_empty():
			continue
		if not por.has(id):
			orden.append(id)
			por[id] = {"club": id, "number": 0, "temps": []}
		if int(r.get("number", 0)) > 0:
			por[id]["number"] = int(r["number"])
		var t: int = int(r.get("season", 0))
		if t > 0 and not (por[id]["temps"] as Array).has(t):
			(por[id]["temps"] as Array).append(t)
	if not hoy.is_empty():
		if not por.has(hoy):
			orden.append(hoy)
			por[hoy] = {"club": hoy, "number": 0, "temps": []}
		por[hoy]["number"] = dorsal_hoy
		if temp_hoy > 0 and not (por[hoy]["temps"] as Array).has(temp_hoy):
			(por[hoy]["temps"] as Array).append(temp_hoy)
	var out: Array = []
	for id in orden:
		var c: Dictionary = por[id]

		if int(c["number"]) <= 0:
			c["number"] = dorsal_hoy
		out.append(c)
	return out




static func a_json(foto: Dictionary) -> Variant:
	return Nube.a_json(foto)




static func de_json(v: Variant, hondo: int = 0) -> Variant:
	if hondo > MAX_HONDO + 2:
		return null
	if v is Dictionary:
		if v.size() == 1 and v.has("__v"):
			return _revive(v["__v"])
		var d: Dictionary = {}
		for k in v:
			d[str(k)] = de_json(v[k], hondo + 1)
		return d
	if v is Array:
		var a: Array = []
		for x in v:
			a.append(de_json(x, hondo + 1))
		return a
	if v is float and is_equal_approx(v, roundf(v)) and absf(v) < 1000000000000000.0:
		return int(v)
	if v is bool or v is float or v is int or v is String:
		return v
	return null


static func _revive(s: Variant) -> Variant:
	if not (s is String) or (s as String).length() > 120:
		return null
	if _re_v == null:
		_re_v = RegEx.new()
		_re_v.compile("^(Vector2|Vector2i|Vector3|Rect2|Rect2i|Color)\\(\\s*-?[0-9][0-9.eE+-]*"
			+ "(\\s*,\\s*-?[0-9][0-9.eE+-]*){1,3}\\s*\\)$")
	if _re_v.search(s) == null:
		return null
	return str_to_var(s)







static func valida(foto: Variant) -> Dictionary:
	if not (foto is Dictionary):
		return {}
	var f: Dictionary = foto
	var out: Dictionary = {}
	out["house_level"] = House.clamp_level(_entero(f.get("house_level", 0)))
	out["land_tier"] = clampi(_entero(f.get("land_tier", 0)), 0, House.TERRENOS.size() - 1)
	var extras: Array = []
	for e in _lista(f.get("house_extras", []), MAX_EXTRAS):
		if e is String and not House.extra_by_id(e).is_empty() and not extras.has(e) \
				and not House.kind_vetado(String(House.extra_by_id(e).get("kind", ""))):
			extras.append(e)
	out["house_extras"] = extras
	var items: Array = []
	for it in _lista(f.get("house_items", []), MAX_ITEMS):
		var ok: Dictionary = _item(it)
		if not ok.is_empty():
			items.append(ok)
	out["house_items"] = items
	var lay: Variant = f.get("house_layout", {})
	var nodos: Array = [0]
	out["house_layout"] = lay if lay is Dictionary and _sano(lay, 0, nodos) else {}
	var fins: Array = []
	for a in _lista(f.get("house_finishes", []), MAX_EXTRAS):
		if a is String and not House.acabado_by_id(a).is_empty() and not fins.has(a):
			fins.append(a)
	out["house_finishes"] = fins
	var fin: Dictionary = {}
	var fin_in: Variant = f.get("house_finish", {})
	if fin_in is Dictionary:
		for k in fin_in:
			var val: Variant = fin_in[k]
			if fin.size() < 200 and String(k).length() <= 64 and val is String \
					and not House.acabado_by_id(val).is_empty():
				fin[String(k)] = val
	out["house_finish"] = fin
	var off: Array = []
	for p in _lista(f.get("house_pets_off", []), 60):
		if p is String and (p as String).length() <= 64:
			off.append(p)
	out["house_pets_off"] = off
	var nombres: Dictionary = {}
	var nom_in: Variant = f.get("pet_names", {})
	if nom_in is Dictionary:
		for k in nom_in:
			if nombres.size() < 60 and String(k).length() <= 64 and nom_in[k] is String:



				var nom: String = sin_control(String(nom_in[k])).strip_edges().left(NOMBRE_MAX)
				if not Apodo.es_ofensivo(nom):
					nombres[String(k)] = nom
	out["pet_names"] = nombres
	out["floor_paint"] = _pintura(f.get("floor_paint", {}))
	var life: Array = []
	for l in _lista(f.get("lifestyle", []), MAX_EXTRAS):
		if l is String and (l as String).length() <= 64 and not life.has(l):
			life.append(l)
	out["lifestyle"] = life
	out.merge(_trofeos(f), true)
	return out




static func sin_control(t: String) -> String:
	var out: String = t
	for i in out.length():
		var u: int = out.unicode_at(i)
		if u < 32 or u == 127:
			out[i] = " "
	return out





static func _trofeos(f: Dictionary) -> Dictionary:
	var vit: Dictionary = {}
	var vit_in: Variant = f.get("vitrina", {})
	if vit_in is Dictionary:
		for k in vit_in:
			var n: int = _entero(vit_in[k])
			if k is String and Trophies.CATALOG.has(k) and n > 0:
				vit[k] = mini(n, MAX_COPAS)
	var pins: Array = []
	for p in _lista(f.get("trophy_pins", []), MAX_PINS):
		if p is String and (p as String).length() <= 64 and not pins.has(p):
			pins.append(p)




	var vit_picks: Dictionary = {}
	var ya_puestos: Dictionary = {}
	var vp_in: Variant = f.get("vitrina_picks", {})
	if vp_in is Dictionary:
		for mueble in vp_in:
			if vit_picks.size() >= MAX_PERCHAS or ya_puestos.size() >= MAX_PINS:
				break
			if not (mueble is String and not (mueble as String).is_empty() \
					and (mueble as String).length() <= 64):
				continue
			var titulos: Array = []
			for t in _lista(vp_in[mueble], MAX_PINS):
				if ya_puestos.size() >= MAX_PINS:
					break
				if t is String and (t as String).length() <= 64 and not ya_puestos.has(t):
					ya_puestos[t] = true
					titulos.append(t)
			if not titulos.is_empty():
				vit_picks[mueble] = titulos
	var picks: Dictionary = {}
	var pk_in: Variant = f.get("jersey_picks", {})
	if pk_in is Dictionary:
		for percha in pk_in:
			if picks.size() >= MAX_PERCHAS:
				break
			var marcos: Variant = pk_in[percha]


			if not (percha is String and not (percha as String).is_empty() \
					and (percha as String).length() <= 64 and marcos is Dictionary):
				continue
			var m_out: Dictionary = {}
			for m in marcos:
				if m_out.size() >= MAX_MARCOS:
					break
				var pick: Variant = marcos[m]
				if not (m is String and (m as String).is_valid_int() and pick is Dictionary):
					continue
				var idx: int =(m as String).to_int()
				var club: Variant = pick.get("club", "")
				if idx < 0 or idx >= MAX_MARCOS or not (club is String and _club_ok(club)):
					continue
				m_out[str(idx)] = {"club": club, "number": _dorsal_ok(pick.get("number", 0))}
			if not m_out.is_empty():
				picks[percha] = m_out
	var clubes: Array = []
	var vistos: Array = []
	for c in _lista(f.get("clubes", []), MAX_CLUBES):
		if not (c is Dictionary):
			continue
		var id: Variant = c.get("club", "")
		if not (id is String and _club_ok(id)) or vistos.has(id):
			continue
		vistos.append(id)
		var temps: Array = []
		for t in _lista(c.get("temps", []), MAX_TEMPS):
			var n: int = _entero(t)
			if n >= 1 and n <= 999 and not temps.has(n):
				temps.append(n)
		temps.sort()
		clubes.append({"club": id, "number": _dorsal_ok(c.get("number", 0)), "temps": temps})
	return {"vitrina": vit, "trophy_pins": pins, "vitrina_picks": vit_picks,
		"jersey_picks": picks, "clubes": clubes}




static func _club_ok(id: String) -> bool:
	return not id.is_empty() and id.length() <= 40 and not Teams.by_id(id).is_empty()


static func _dorsal_ok(v: Variant) -> int:
	return clampi(_entero(v), 0, 99)


static func _entero(v: Variant) -> int:
	return int(v) if v is int or v is float else 0


static func _lista(v: Variant, tope: int) -> Array:
	if not (v is Array or v is PackedStringArray):
		return []
	var a: Array = Array(v)
	return a.slice(0, tope)





static func _item(v: Variant) -> Dictionary:
	if not (v is Dictionary):
		return {}
	var kind: Variant = v.get("kind", "")
	var iid: Variant = v.get("iid", "")
	var extra: Variant = v.get("extra", "")
	var size: Variant = v.get("size", Vector2.ZERO)
	if not (kind is String and iid is String and extra is String and size is Vector2):
		return {}
	if not _es_nombre(kind) or (iid as String).length() > 64 or House.kind_vetado(kind):
		return {}
	if not (extra as String).is_empty() and House.extra_by_id(extra).is_empty():
		return {}
	var s: Vector2 = size
	if not (s.x > 0.0 and s.y > 0.0 and s.x <= 64.0 and s.y <= 64.0):
		return {}
	var out: Dictionary = {"iid": iid, "kind": kind, "extra": extra, "size": s}
	if bool(v.get("copia", false)) == true:
		out["copia"] = true
	return out


static func _es_nombre(s: String) -> bool:
	if s.is_empty() or s.length() > 40:
		return false
	for ch in s:
		if not ((ch >= "a" and ch <= "z") or (ch >= "0" and ch <= "9") or ch == "_"):
			return false
	return true




static func _sano(v: Variant, hondo: int, nodos: Array) -> bool:
	nodos[0] = int(nodos[0]) + 1
	if hondo > MAX_HONDO or int(nodos[0]) > MAX_NODOS:
		return false
	match typeof(v):
		TYPE_BOOL, TYPE_INT, TYPE_FLOAT, TYPE_VECTOR2, TYPE_VECTOR2I, TYPE_VECTOR3, \
				TYPE_RECT2, TYPE_RECT2I, TYPE_COLOR:
			return true
		TYPE_STRING:
			return (v as String).length() <= MAX_TXT
		TYPE_ARRAY:
			for x in v:
				if not _sano(x, hondo + 1, nodos):
					return false
			return true
		TYPE_DICTIONARY:
			for k in v:
				if not (k is String) or (k as String).length() > MAX_TXT:
					return false
				if not _sano(v[k], hondo + 1, nodos):
					return false
			return true
	return false




static func _pintura(v: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not (v is Dictionary):
		return out
	var rects: int = 0
	var celdas: int = 0
	for k in v:
		if out.size() >= 8 or String(k).length() > 16:
			break
		var buena: PackedStringArray = PackedStringArray()
		for e in _lista(v[k], MAX_PINTURA):
			if not (e is String) or (e as String).length() > 80:
				continue
			var c: PackedStringArray =(e as String).rsplit(" ", true, 4)
			if c.size() != 5 or c[0].is_empty():
				continue
			var i0: int = c[1].to_int()
			var j0: int = c[2].to_int()
			var w: int = c[3].to_int()
			var h: int = c[4].to_int()
			if w < 1 or h < 1 or w > MAX_LADO or h > MAX_LADO \
					or absi(i0) > MAX_LADO or absi(j0) > MAX_LADO:
				continue
			rects += 1
			celdas += w * h
			if rects > MAX_PINTURA or celdas > MAX_CELDAS:
				break
			buena.append(e)
		out[String(k)] = buena
	return out





static func mia() -> Dictionary:
	var out: Dictionary = {}
	for k in CLAVES + PROPIAS + ["player_name", "nationality", "_season_award_mark"]:
		out[k] = Career.get(k)
	return out





static func pon(foto: Dictionary, nombre: String, nat: String = "") -> void:
	for k in PROPIAS:
		Career.set(k, _vacio(Career.get(k)))
	for k in CLAVES:
		if k == "floor_paint":
			continue
		var v: Variant = foto.get(k, null)
		Career.set(k, v.duplicate(true) if v is Array or v is Dictionary \
				else (v if v != null else _vacio(Career.get(k))))
	var pintura: Dictionary = {}
	var pin: Variant = foto.get("floor_paint", {})
	if pin is Dictionary:
		for k in pin:
			pintura[k] = House.pintura_de_lista(pin[k])
	Career.floor_paint = pintura



	var tro: Dictionary = _trofeos(foto)
	var premios: Array = []
	var vit: Dictionary = tro["vitrina"]
	for k in vit:
		for i in int(vit[k]):
			premios.append(k)
	Career.awards = premios



	Career._season_award_mark = premios.size()
	Career.trophy_pins = tro["trophy_pins"]
	Career.vitrina_picks = tro["vitrina_picks"]
	Career.jersey_picks = tro["jersey_picks"]
	_clubes = tro["clubes"]



	var limpio: String = nombre.strip_edges().left(NOMBRE_MAX)
	Career.player_name = "" if Apodo.es_ofensivo(limpio) else limpio
	Career.nationality = nat
	activa = true


static func restaura(antes: Dictionary) -> void:
	for k in antes:
		Career.set(k, antes[k])
	_clubes = []
	activa = false



static func _vacio(v: Variant) -> Variant:
	match typeof(v):
		TYPE_ARRAY:
			return []
		TYPE_DICTIONARY:
			return {}
		TYPE_INT:
			return 0
		TYPE_FLOAT:
			return 0.0
		TYPE_STRING:
			return ""
		TYPE_BOOL:
			return false
	return null





static func clubes() -> Array:
	if not activa:
		return Career.clubs_history()
	var out: Array = []
	for c in _clubes:
		out.append(String(c["club"]))
	return out




static func dorsal(club: String) -> int:
	if not activa:
		return Career.club_number(club)
	for c in _clubes:
		if String(c["club"]) == club:
			return int(c["number"])
	return 0



static func temporadas(club: String) -> Array:
	if not activa:
		return Career.club_seasons(club)
	for c in _clubes:
		if String(c["club"]) == club:
			return (c["temps"] as Array).duplicate()
	return []
