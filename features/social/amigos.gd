class_name Amigos
extends RefCounted














static func demo() -> bool:
	return Nube.amigos.is_empty()








const CATEGORIAS: Array = [
	["goals", "GOLES", "gol"],
	["assists", "ASIST.", "asist"],
	["ga", "G+A", "gol+asist"],
	["cups", "TÍTULOS", "trofeo:liga"],
	["ovr", "MEDIA", "media"],
	["legacy", "LEGADO", "vitrina"],
]





static func mi_codigo() -> String:
	if Nube.codigo != "":
		return Nube.codigo
	const SIGNOS: String = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
	var h: int = absi(OS.get_unique_id().hash())
	var out: String = ""
	for i in 6:
		out += SIGNOS[h % SIGNOS.length()]
		h = h / SIGNOS.length() + 7919 *(i + 1)
	return out





static func yo() -> Dictionary:
	var mias: Array[Dictionary] = carreras_mias()
	var mejor: Dictionary = mejor_en(mias, "legacy").duplicate()
	if not mejor.is_empty():
		mejor["yo"] = true
		mejor["code"] = mi_codigo()
		mejor["carreras"] = mias
	return mejor



static func lista() -> Array[Dictionary]:
	if not demo():
		return Nube.amigos.duplicate()
	var out: Array[Dictionary] = []
	for d in _demo():
		out.append(d)
	return out




static func valor(p: Dictionary, clave: String) -> int:
	if clave == "cups":
		return int(p.get("cups_team", 0)) + int(p.get("cups_solo", 0))
	if clave == "ga":
		return int(p.get("goals", 0)) + int(p.get("assists", 0))
	return int(p.get(clave, 0))






static func tabla_liga(filas: Array, clave: String) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for f in filas:
		if f is Dictionary:
			var g: Dictionary =(f as Dictionary).duplicate()
			g["valor"] = valor(g.get("suma", {}), clave)
			out.append(g)

	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if bool(a.get("espera", false)) != bool(b.get("espera", false)):
			return bool(b.get("espera", false))
		if int(a.valor) != int(b.valor):
			return int(a.valor) > int(b.valor)
		return int((a.suma as Dictionary).get("matches", 0)) < int((b.suma as Dictionary).get("matches", 0)))
	var anterior: int = -1
	for i in out.size():
		if i == 0 or int(out[i].valor) != anterior:
			out[i]["pos"] = i + 1
		else:
			out[i]["pos"] = int(out[i - 1].pos)
		anterior = int(out[i].valor)
	return out






static func movimiento_liga(antes: Array, ahora: Array) -> Array[Dictionary]:
	var previo: Dictionary = {}
	for f in antes:
		if f is Dictionary:
			previo[String(f.get("code", ""))] = valor(f.get("suma", {}), "ga")
	var out: Array[Dictionary] = []
	for f in ahora:
		if f is Dictionary and not bool(f.get("espera", false)):
			var d: int = valor(f.get("suma", {}), "ga") - int(previo.get(String(f.get("code", "")), 0))
			if d > 0:


				out.append({"name": String(f.get("name", "")), "ga": d, "yo": bool(f.get("yo", false)),
					"code": String(f.get("code", "")), "apodo": f.get("apodo", "")})
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return int(a.ga) > int(b.ga))
	return out



static func dias_liga(termina: int, ahora: int = -1) -> int:
	if ahora < 0:
		ahora = int(Time.get_unix_time_from_system())
	return 0 if termina <= ahora else ceili((termina - ahora) / 86400.0)





static func clasificacion(clave: String) -> Array[Dictionary]:
	var personas: Array[Dictionary] = lista()
	var tu: Dictionary = yo()
	if not tu.is_empty():
		personas.append(tu)
	var todos: Array[Dictionary] = []
	for p in personas:
		todos.append(representante(p, clave))
	todos.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return valor(a, clave) > valor(b, clave))



	for i in todos.size():
		var v: int = valor(todos[i], clave)
		todos[i]["pos"] = int(todos[i - 1].pos) if i > 0 and v == valor(todos[i - 1], clave) else i + 1
	return todos




const NOVEDAD: Dictionary = {
	"fichaje": ["contrato_firma", "{0} fichó por {1}"],
	"titulo": ["trofeo:liga", "{0} ganó un título"],
	"premio": ["trofeo:mvp", "{0} ganó un premio individual"],
	"media": ["media", "{0} subió a {1} de media"],
	"goles": ["gol", "{0} llegó a {1} goles"],
	"lesion": ["botiquin", "{0} se lesionó: {1} semanas"],
	"retiro": ["vitrina", "{0} colgó las botas"],
}





static func feed() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	if not demo():
		var ahora: int = int(Time.get_unix_time_from_system())
		for n in Nube.novedades:
			var a: Dictionary = por_uid(String(n.get("jugador", "")))
			if a.is_empty() or not NOVEDAD.has(String(n.get("tipo", ""))):
				continue
			var t: Array = NOVEDAD[String(n.tipo)]
			var args: Array =(n.get("args", []) as Array).duplicate() \
					if n.get("args", []) is Array else []
			var e: Dictionary = {"code": String(a.code), "icono": String(t[0]),
				"plantilla": String(t[1]), "args": args,
				"dias": maxi(0,(ahora - int(n.get("creada", ahora))) / 86400)}



			if not args.is_empty() and args.back() is Dictionary:
				e["nombre"] = Apodo.nombre_ajeno((args.pop_back() as Dictionary).get("n", ""))
			out.append(e)
		return out
	for e in _demo_feed():
		out.append(e)
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a.dias) < int(b.dias))
	return out


static func por_codigo(code: String) -> Dictionary:
	for d in lista():
		if String(d.get("code", "")) == code:
			return d
	return {}


static func por_uid(id: String) -> Dictionary:
	for d in Nube.amigos:
		if String(d.get("uid", "")) == id:
			return d
	return {}















const TIPOS_RETO: Array = [
	["penal", "penal"],
	["libre", "parado"],
	["solo", "regate"],
	["frontal", "potencia"],
	["lejano", "precision"],
]
const JUGADAS: Array[int] = [5, 10, 15]


const TE_TOCA: String = "TE TOCA"
const ESPERANDO: String = "ESPERANDO"
const ENVIANDO: String = "ENVIANDO"
const GANASTE: String = "GANASTE"
const PERDISTE: String = "PERDISTE"
const EMPATE: String = "EMPATE"
const VENCIDO: String = "CADUCADO"


const PUESTO: String = "PUESTO"


const GRACIA: int = 86400


static func icono_reto(tipo: String) -> String:
	for t in TIPOS_RETO:
		if String(t[0]) == tipo:
			return String(t[1])
	return "penal"



static func marcas(r: Dictionary, yo_uid: String) -> Array[int]:
	var out: Array[int] = [-1, -1]
	for f in r.get("resultados", []):
		out[0 if String(f.get("jugador", "")) == yo_uid else 1] = int(f.get("marca", 0))
	return out




static func estado_reto(r: Dictionary, yo_uid: String, ahora: int, en_cola: bool) -> String:
	if en_cola:
		return ENVIANDO
	var mia: Dictionary = {}
	var suya: Dictionary = {}
	for f in r.get("resultados", []):
		if String(f.get("jugador", "")) == yo_uid:
			mia = f
		else:
			suya = f
	var vence: int = int(r.get("vence", 0))
	if mia.is_empty():
		if ahora <= vence:
			return TE_TOCA

		return VENCIDO if suya.is_empty() else PERDISTE
	if suya.is_empty():

		return GANASTE if ahora > vence else ESPERANDO

	if not bool(suya.get("terminado", true)) and ahora <= vence + GRACIA:
		return ESPERANDO
	var a: int = int(mia.get("marca", 0))
	var b: int = int(suya.get("marca", 0))
	return GANASTE if a > b else (PERDISTE if a < b else EMPATE)











static func yo_en_grupo(r: Dictionary, yo_uid: String) -> Dictionary:
	for m in r.get("miembros", []):
		if String((m as Dictionary).get("uid", "")) == yo_uid:
			return m
	return {}






static func estado_grupo(r: Dictionary, yo_uid: String, ahora: int, en_cola: bool) -> String:
	if en_cola:
		return ENVIANDO
	var vence: int = int(r.get("vence", 0))
	var mio: Dictionary = yo_en_grupo(r, yo_uid)
	if not bool(mio.get("empezado", false)):
		return TE_TOCA if ahora <= vence else VENCIDO
	for m in r.get("miembros", []):
		var e: bool = bool((m as Dictionary).get("empezado", false))
		var t: bool = bool((m as Dictionary).get("terminado", false))
		if (not e and ahora <= vence) or (e and not t and ahora <= vence + GRACIA):
			return ESPERANDO
	var p: Array[int] = puesto_grupo(r, yo_uid)
	if p[0] != 1:
		return PUESTO
	var primeros: int = 0
	for f in tabla_grupo(r):
		primeros += 1 if int(f.pos) == 1 else 0
	return GANASTE if primeros == 1 else EMPATE





static func tabla_grupo(r: Dictionary) -> Array[Dictionary]:
	var jugaron: Array[Dictionary] = []
	var resto: Array[Dictionary] = []
	for m in r.get("miembros", []):
		var f: Dictionary =(m as Dictionary).duplicate()
		f["pos"] = 0
		if bool(f.get("empezado", false)) and int(f.get("marca", -1)) >= 0:
			jugaron.append(f)
		else:
			resto.append(f)
	jugaron.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a.marca) > int(b.marca))
	for i in jugaron.size():
		var f: Dictionary = jugaron[i]
		f["pos"] = i + 1 if i == 0 or int(f.marca) < int(jugaron[i - 1].marca) \
				else int(jugaron[i - 1].pos)

	resto.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return bool(a.get("empezado", false)) and not bool(b.get("empezado", false)))
	jugaron.append_array(resto)
	return jugaron



static func puesto_grupo(r: Dictionary, yo_uid: String) -> Array[int]:
	var pos: int = 0
	var jugaron: int = 0
	for f in tabla_grupo(r):
		if bool(f.get("empezado", false)):
			jugaron += 1
		if String(f.get("uid", "")) == yo_uid:
			pos = int(f.pos)
	return [pos, jugaron]




static func retos() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	if demo():
		for e in _demo_retos():
			out.append(e)
		return out
	var ahora: int = int(Time.get_unix_time_from_system())
	var i: int = 0
	for r in Nube.retos:
		var e: Dictionary = r.duplicate()
		var creo: bool = String(r.creador) == Nube.uid
		var otro: String = String(r.rival) if creo else String(r.creador)
		e["amigo"] = por_uid(otro)



		var fotos: Dictionary = r.get("carreras", {})
		var c: Dictionary = fotos.get("c", {})
		var rv: Dictionary = fotos.get("r", {})
		e["con"] = c if creo else rv
		e["contra"] = rv if creo else c
		var cola: bool = Nube.pendiente(String(r.id))
		e["estado"] = estado_reto(r, Nube.uid, ahora, cola)
		var m: Array[int] = marcas(r, Nube.uid)
		e["mia"] = Nube.marca_pendiente(String(r.id)) if cola else m[0]
		e["suya"] = m[1]
		e["orden"] = i
		i += 1
		out.append(e)



	for r in Nube.retos_grupo:
		var e: Dictionary = r.duplicate()
		var cola: bool = Nube.pendiente(String(r.id))
		e["estado"] = estado_grupo(r, Nube.uid, ahora, cola)
		e["mia"] = Nube.marca_pendiente(String(r.id)) if cola \
				else int(yo_en_grupo(r, Nube.uid).get("marca", -1))
		e["puesto"] = puesto_grupo(r, Nube.uid)
		e["orden"] = i
		i += 1
		out.append(e)
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var pa: int = _prioridad(String(a.estado))
		var pb: int = _prioridad(String(b.estado))
		if pa != pb:
			return pa < pb


		var ca: int = int(a.get("creado", 0))
		var cb: int = int(b.get("creado", 0))
		return ca > cb if ca != cb else int(a.orden) < int(b.orden))
	return out



static func te_tocan() -> int:
	var n: int = 0
	for r in retos():
		if String(r.estado) == TE_TOCA:
			n += 1
	return n






const NIVELES_PADRINO: Array[int] = [1, 3, 5, 10]



static func nivel_padrino(cumplidos: int) -> int:
	var n: int = 0
	for meta in NIVELES_PADRINO:
		if cumplidos >= meta:
			n += 1
	return n






static func reto_que_vence(ahora: int = -1) -> Dictionary:
	if demo():
		return {}
	if ahora < 0:
		ahora = int(Time.get_unix_time_from_system())
	var mejor: Dictionary = {}
	for r in retos():
		if String(r.estado) != TE_TOCA or int(r.get("vence", 0)) <= ahora:
			continue
		if mejor.is_empty() or int(r.vence) < int(mejor.vence):
			var amigo: Variant = r.get("amigo", {})
			mejor = {"vence": int(r.vence),
				"quien": String((amigo as Dictionary).get("name", "")) if amigo is Dictionary else ""}
	return mejor


static func _prioridad(estado: String) -> int:
	match estado:
		TE_TOCA:
			return 0
		ENVIANDO, ESPERANDO:
			return 1
	return 2















const MAX_CARRERAS: int = 8




static var _mias: Array[Dictionary] = []
static var _mias_ms: int = -100000




static func carreras_mias() -> Array[Dictionary]:
	if Time.get_ticks_msec() - _mias_ms < 1000:
		return _mias.duplicate()
	var out: Array[Dictionary] = []
	for s in SaveSlots.count():
		var info: Dictionary = SaveSlots.summary(s)
		if not bool(info.get("exists", false)):
			continue
		var c: Dictionary = info.duplicate()
		c["cid"] = cid_ranura(s, c)
		c["slot"] = s
		out.append(c)
	for p in SalonFama.placas():
		if out.size() >= MAX_CARRERAS:
			break
		out.append(placa_a_carrera(p))
	ordena_carreras(out)
	_mias = out
	_mias_ms = Time.get_ticks_msec()
	return out.duplicate()






static func cid_ranura(slot: int, info: Dictionary) -> String:
	return "r%d-%x" % [slot, hash([String(info.get("name", "")), String(info.get("nat", ""))])
		&16777215]





static func placa_a_carrera(p: Dictionary) -> Dictionary:
	var c: Dictionary = SalonFama.info_retrato(p)
	for k in ["age", "matches", "goals", "assists", "ovr", "cups_team", "cups_solo"]:
		c[k] = int(p.get(k, 0))
	c["avg"] = float(p.get("avg", 0.0))
	c["team_id"] = String(p.get("team_id", ""))
	c["legacy"] = int(p.get("score", 0))
	c["retired"] = true
	c["hof"] = true
	c["exists"] = true
	c["cid"] = "p:" + String(p.get("id", ""))
	var div: int = Teams.base_div(String(c.team_id)) if String(c.team_id) != "" else 3
	var museo: Variant = p.get("museo", {})
	if museo is Dictionary and (museo as Dictionary).get("season_history", []) is Array:
		var hist: Array =(museo as Dictionary).get("season_history", [])
		if not hist.is_empty() and hist.back() is Dictionary:
			div = int((hist.back() as Dictionary).get("div", div))
	c["div"] = div
	return c




static func ordena_carreras(lista: Array) -> void:
	lista.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var ra: bool = bool(a.get("retired", false))
		var rb: bool = bool(b.get("retired", false))
		if ra != rb:
			return not ra
		return int(a.get("legacy", 0)) > int(b.get("legacy", 0)))




static func carreras_de(p: Dictionary) -> Array:
	var cs: Variant = p.get("carreras", [])
	if cs is Array and not (cs as Array).is_empty():
		return cs
	return [] if p.is_empty() else [p]




static func mejor_en(lista: Array, clave: String) -> Dictionary:
	var mejor: Dictionary = {}
	for c in lista:
		if c is Dictionary and (mejor.is_empty() or valor(c, clave) > valor(mejor, clave)):
			mejor = c
	return mejor





static func representante(p: Dictionary, clave: String) -> Dictionary:
	var c: Dictionary = mejor_en(carreras_de(p), clave)
	var out: Dictionary =(c if not c.is_empty() else p).duplicate()
	for k in ["code", "uid", "yo", "plataforma"]:
		if p.has(k):
			out[k] = p[k]
	out["carreras"] = carreras_de(p)
	out["dueno"] = String(p.get("name", ""))
	return out




static func carrera(p: Dictionary, cid: String) -> Dictionary:
	for c in carreras_de(p):
		if c is Dictionary and String(c.get("cid", "")) == cid:
			return c
	return carreras_de(p)[0] if not carreras_de(p).is_empty() else {}











static var _prestado_antes: Dictionary = {}




const KIT_SLOTS: int = 3

















static func prestar(con: Dictionary, kit: int = -1, kit_rival: int = -1) -> void:
	devolver()
	if con.is_empty() and kit < 0 and kit_rival < 0:
		return
	_prestado_antes = {"name": Career.player_name, "shirt_name": Career.shirt_name,
		"nat": Career.nationality, "number": GameState.player_number,
		"team_id": GameState.player_team_id, "look": GameState.team_custom.duplicate(true),
		"kit": [GameState.player_kit_slot, GameState.rival_kit_slot,
			GameState.kit_choice_ready, GameState.kit_choice_day]}
	var mio: bool = kit >= 0 and kit < KIT_SLOTS
	var suyo: bool = kit_rival >= 0 and kit_rival < KIT_SLOTS
	if mio or suyo:
		GameState.ensure_kit_choice()
		if mio:
			GameState.player_kit_slot = kit
		if suyo:
			GameState.rival_kit_slot = kit_rival
		GameState.mark_kit_choice()
	var nombre: String = String(con.get("name", "")).strip_edges().left(40)
	if nombre != "":
		Career.player_name = nombre
		Career.shirt_name = ""
	if String(con.get("nat", "")) != "":
		Career.nationality = String(con.get("nat", ""))
	var dorsal: int = int(con.get("number", 0))
	if dorsal >= 1 and dorsal <= 99:
		GameState.player_number = dorsal
	var club: String = String(con.get("team_id", ""))
	if club != "" and not Teams.by_id(club).is_empty():
		GameState.player_team_id = club
	var look: Dictionary = look_seguro(con.get("look", {}))
	if not look.is_empty():
		GameState.team_custom = look








static func cualidades_de(con: Dictionary) -> Dictionary:
	var cid: String = String(con.get("cid", ""))
	if cid.begins_with("r") and cid.contains("-"):
		var slot: int = int(cid.substr(1, cid.find("-") - 1))
		if slot >= 0 and slot < SaveSlots.count():
			var info: Dictionary = SaveSlots.summary(slot)
			if bool(info.get("exists", false)) and cid_ranura(slot, info) == cid:
				var cfg: ConfigFile = ConfigFile.new()
				if SaveSlots.load_cfg(cfg, SaveSlots.slot_path("career_meta.cfg", slot)) == OK:
					var sk: Variant = cfg.get_value("player", "skills", {})
					if sk is Dictionary and not (sk as Dictionary).is_empty():
						return cualidades_limpias(sk)
	var ovr: int = int(con.get("ovr", 0))
	if ovr <= 0:
		return {}
	var out: Dictionary = {}
	for k in Career.skills:
		out[k] = clampi(ovr, 1, 99)
	return out



static func cualidades_limpias(sk: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in Career.skills:
		if sk.has(k):
			out[k] = clampi(int(sk[k]), 1, 99)
		else:
			out[k] = int(Career.skills[k])
	return out




static func devolver() -> void:
	if _prestado_antes.is_empty():
		return
	var a: Dictionary = _prestado_antes
	_prestado_antes = {}
	Career.player_name = String(a.name)
	Career.shirt_name = String(a.shirt_name)
	Career.nationality = String(a.nat)
	GameState.player_number = int(a.number)
	GameState.player_team_id = String(a.team_id)
	GameState.team_custom = a.look
	var k: Array = a.kit
	GameState.player_kit_slot = int(k[0])
	GameState.rival_kit_slot = int(k[1])
	GameState.kit_choice_ready = bool(k[2])
	GameState.kit_choice_day = k[3]




static func club_de(con: Dictionary) -> Dictionary:
	var club: Dictionary = Teams.by_id(String(con.get("team_id", "")))
	return club if not club.is_empty() else GameState.you_team()


static func prestado() -> bool:
	return not _prestado_antes.is_empty()





static func look_seguro(raw: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not raw is Dictionary:
		return out
	for k in raw:
		var key: String = str(k)
		if key in KitRecolor.TEAM_KEYS:
			continue
		var v: Variant = raw[k]
		if v is Color or v is bool:
			out[key] = v
		elif v is String and key in KitRecolor.STYLE_KEYS and (v as String).length() <= 40:
			out[key] = v
	return out




static func _demo() -> Array:
	var piel: Array[Color] = KitRecolor.SKIN_TONES
	var pelo: Array[Color] = KitRecolor.HAIR_COLORS
	var amigos: Array = _demo_fichas(piel, pelo)


	var otras: Array = [
		[{"cid": "p:demo1", "hof": true, "retired": true, "name": "Bruno Ruiz", "nat": "MEX",
			"team_id": "liv", "ovr": 84, "age": 35, "season": 17, "matches": 540, "goals": 263,
			"assists": 98, "cups_team": 7, "cups_solo": 2, "legacy": 371, "poss": ["DC"],
			"number": 11, "look": {"skin": piel[2 % piel.size()], "hair": pelo[4 % pelo.size()]}},
			{"cid": "r1", "retired": true, "name": "Iker Ruiz", "nat": "MEX", "team_id": "val",
			"ovr": 74, "age": 33, "season": 14, "matches": 380, "goals": 96, "assists": 61,
			"cups_team": 1, "cups_solo": 0, "legacy": 120, "poss": ["MC"], "number": 6,
			"look": {"skin": piel[1 % piel.size()], "hair": pelo[3 % pelo.size()]}}],
		[],
		[{"cid": "r2", "retired": true, "name": "Hugo Torres", "nat": "ESP", "team_id": "bet",
			"ovr": 71, "age": 34, "season": 15, "matches": 410, "goals": 58, "assists": 33,
			"cups_team": 0, "cups_solo": 1, "legacy": 95, "poss": ["DFC"], "number": 4,
			"look": {"skin": piel[0], "hair": pelo[0]}}],
		[{"cid": "p:demo2", "hof": true, "retired": true, "name": "Vale Gil", "nat": "COL",
			"team_id": "ars", "ovr": 79, "age": 36, "season": 18, "matches": 520, "goals": 141,
			"assists": 166, "cups_team": 3, "cups_solo": 2, "legacy": 233, "poss": ["MCO"],
			"number": 10, "look": {"skin": piel[3 % piel.size()], "hair": pelo[2 % pelo.size()]}}],
	]
	for i in amigos.size():
		var a: Dictionary = amigos[i]
		var cs: Array = [a.duplicate()]
		cs[0]["cid"] = "r0"
		for c in otras[i]:
			c["exists"] = true
			c["div"] = 1
			cs.append(c)
		ordena_carreras(cs)
		a["carreras"] = cs
	return amigos


static func _demo_fichas(piel: Array[Color], pelo: Array[Color]) -> Array:
	return [
		{"code": "K7QM2X", "name": "Ana Ruiz", "nat": "MEX", "team_id": "rma",
			"ovr": 86, "age": 24, "season": 8, "goals": 214, "assists": 77,
			"cups_team": 6, "cups_solo": 3, "legacy": 412, "poss": ["DC"], "number": 9,
			"plataforma": "ios",
			"look": {"skin": piel[2 % piel.size()], "hair": pelo[1 % pelo.size()]}},
		{"code": "P4TZ8N", "name": "Leo Vidal", "nat": "ARG", "team_id": "bar",
			"ovr": 81, "age": 22, "season": 6, "goals": 131, "assists": 102,
			"cups_team": 4, "cups_solo": 1, "legacy": 288, "poss": ["MCO"], "number": 10,
			"plataforma": "android",
			"look": {"skin": piel[1 % piel.size()], "hair": pelo[0]}},
		{"code": "W9HB3R", "name": "Max Torres", "nat": "ESP", "team_id": "atm",
			"ovr": 77, "age": 21, "season": 5, "goals": 88, "assists": 41,
			"cups_team": 1, "cups_solo": 2, "legacy": 160, "poss": ["ED"], "number": 7,
			"plataforma": "ios",
			"look": {"skin": piel[0], "hair": pelo[2 % pelo.size()]}},
		{"code": "D2LS6V", "name": "Sofi Gil", "nat": "COL", "team_id": "sev",
			"ovr": 72, "age": 19, "season": 3, "goals": 47, "assists": 30,
			"cups_team": 0, "cups_solo": 1, "legacy": 74, "poss": ["MC"], "number": 8,
			"plataforma": "android",
			"look": {"skin": piel[3 % piel.size()], "hair": pelo[3 % pelo.size()]}},
	]


static func _demo_retos() -> Array:
	var amigos: Array = _demo()
	var dia: int = 86400
	var ahora: int = int(Time.get_unix_time_from_system())


	var tu: Dictionary = yo()
	return [
		{"id": "demo1", "tipo": "penal", "jugadas": 5, "amigo": amigos[1], "estado": TE_TOCA,
			"mia": -1, "suya": -1, "vence": ahora + 2 * dia, "creado": ahora,
			"con": tu, "contra": carrera(amigos[1], "r0")},
		_demo_grupo(amigos, ahora, dia),
		{"id": "demo2", "tipo": "libre", "jugadas": 10, "amigo": amigos[0], "estado": ESPERANDO,
			"mia": 6, "suya": -1, "vence": ahora + dia, "creado": ahora - dia},
		{"id": "demo3", "tipo": "solo", "jugadas": 15, "amigo": amigos[2], "estado": GANASTE,
			"mia": 11, "suya": 8, "vence": ahora - dia, "creado": ahora - 4 * dia,
			"con": tu, "contra": carrera(amigos[2], "r2")},
		{"id": "demo4", "tipo": "lejano", "jugadas": 10, "amigo": amigos[3], "estado": PERDISTE,
			"mia": 3, "suya": 5, "vence": ahora - 2 * dia, "creado": ahora - 5 * dia},
	]





static func _demo_grupo(amigos: Array, ahora: int, dia: int) -> Dictionary:
	var m: Array[Dictionary] = [{"uid": Nube.uid, "code": mi_codigo(), "name": "", "carrera": yo(),
		"empezado": true, "terminado": true, "marca": 7}]

	for d in [[0, true, true, 9], [1, true, true, 7], [2, true, false, -1], [3, false, false, -1],
			["Q8RT4M", true, true, 4], ["Z3KD7P", false, false, -1]]:
		var amigo: bool = d[0] is int
		var a: Dictionary = amigos[d[0]] if amigo else {}
		m.append({"uid": "demo-g%d" % m.size(), "code": String(a.get("code", "")) if amigo else d[0],
			"name": String(a.get("name", "")),
			"carrera": carrera(a, "") if amigo else {"nat": "Brasil", "team_id": "fla"},
			"empezado": d[1], "terminado": d[2], "marca": d[3]})
	var r: Dictionary = {"id": "demo5", "grupo": true, "creador": "demo-g1", "tipo": "frontal",
		"jugadas": 10, "semilla": 0, "vence": ahora + dia, "creado": ahora - 3600, "miembros": m}
	r["estado"] = estado_grupo(r, Nube.uid, ahora, false)
	r["mia"] = 7
	r["puesto"] = puesto_grupo(r, Nube.uid)
	return r


static func _demo_feed() -> Array:
	return [
		{"code": "P4TZ8N", "icono": "contrato_firma", "plantilla": "{0} fichó por {1}",
			"args": ["bar"], "dias": 0},
		{"code": "K7QM2X", "icono": "trofeo:liga", "plantilla": "{0} ganó la liga",
			"args": [], "dias": 1},
		{"code": "W9HB3R", "icono": "botiquin", "plantilla": "{0} se lesionó: {1} semanas",
			"args": [6], "dias": 2},
		{"code": "D2LS6V", "icono": "media", "plantilla": "{0} subió a {1} de media",
			"args": [72], "dias": 3},
		{"code": "K7QM2X", "icono": "gol", "plantilla": "{0} llegó a {1} goles",
			"args": [200], "dias": 5},
		{"code": "W9HB3R", "icono": "trofeo:mvp", "plantilla": "{0} ganó el premio al Jugador del Año",
			"args": [], "dias": 9},
	]
