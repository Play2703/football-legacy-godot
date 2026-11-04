class_name MemoramaCartas
extends RefCounted





















const Brazaletes := preload("res://features/career/brazaletes.gd")

const PLAYERA: String = "playera"
const PLAYERA_CAMBIO: String = "playera_cambio"
const TROFEO: String = "trofeo"
const BRAZALETE: String = "brazalete"
const ESCUDO: String = "escudo"
const BANDERA: String = "bandera"

const MINIMO: int = 8



const LADO_PX: int = 160







const MAX_HORNOS: int = 24


static var _hornos: Dictionary = {}

static var _orden: Array[String] = []


static var _taller: Node = null









static func piezas(n_parejas: int, semilla: int, carrera: Variant = null) -> Array:
	var d: Dictionary = carrera if carrera is Dictionary else datos_carrera()
	var rng := RandomNumberGenerator.new()
	if semilla == 0:
		rng.randomize()
	else:
		rng.seed = semilla
	var n: int = maxi(n_parejas, 0)
	var usadas: Dictionary = {}
	var vetos: Dictionary = {}





	var playeras: Array = []
	var numeros: Dictionary = d.get("numeros", {})
	for id: Variant in d.get("clubs", []):
		var club: String = String(id)
		if Teams.is_free(club):
			continue
		playeras.append(_pieza("%s:%s" % [PLAYERA, club], PLAYERA, {"club": club,
			"slot": 0, "temporada": -1, "numero": int(numeros.get(club, 0)),
			"apellido": String(d.get("espalda", ""))}, true))





	var cambios: Array = []
	for k: Variant in Keepsakes.of_kind(d.get("keepsakes", []), Keepsakes.SHIRT):
		var ks: Dictionary = k
		var rival: String = String(ks.get("rival", ""))
		if rival.is_empty():
			continue
		var temporada: int = int(ks.get("season", 0))
		var num: int = int(ks.get("who_num", 0))
		var ape: String = Espalda.apellido_de(Keepsakes.quien_pintado(ks))


		cambios.append(_pieza("%s:%s|%d|%d|%s" % [PLAYERA_CAMBIO, rival, temporada,
			num, ape], PLAYERA_CAMBIO, {"club": rival, "slot": 1,
			"temporada": temporada if temporada > 0 else -1, "numero": num,
			"apellido": ape}, true))



	var trofeos: Array = []
	var vitrina: Dictionary = Trophies.cabinet(d.get("awards", []))
	for fila: Variant in vitrina.get("team", []) + vitrina.get("individual", []):
		var tipo: String = _tipo_icono(String((fila as Dictionary).get("type", "")))
		if tipo.is_empty():
			continue
		trofeos.append(_pieza("%s:%s" % [TROFEO, tipo], TROFEO,
			{"type": tipo, "no_ganado": false}, true))
		vetos["%s:%s" % [TROFEO, tipo]] = true






	var brazaletes: Array = []
	for b: Variant in Brazaletes.sanitizar(d.get("brazaletes", [])):
		var bd: Dictionary = b
		var equipo: String = String(bd["equipo"])
		var seleccion: bool = String(bd["tipo"]) == "seleccion"
		brazaletes.append(_pieza("%s:%s:%s" % [BRAZALETE, bd["tipo"], equipo], BRAZALETE,
			{"equipo": equipo, "seleccion": seleccion}, true))
		vetos[("%s:%s" % [BANDERA, equipo]) if seleccion else ("%s:%s" % [ESCUDO, equipo])] = true





	var propias: Array = _por_turnos([playeras, cambios, trofeos, brazaletes], rng)




	var relleno: Array = []
	var nacion: String = String(d.get("nacionalidad", ""))
	if not nacion.is_empty() and Flags.has(nacion):
		relleno.append(_pieza("%s:%s" % [BANDERA, nacion], BANDERA, {"nacion": nacion}, false))
	var escudos: Array = []
	for t: Variant in _liga_de(String(d.get("club", ""))):
		var id: String = String((t as Dictionary).get("id", ""))
		if not Teams.is_free(id):
			escudos.append(_pieza("%s:%s" % [ESCUDO, id], ESCUDO, {"equipo": id}, false))
	var grises: Array = []
	for tipo: String in _tipos_catalogo():
		grises.append(_pieza("%s:%s" % [TROFEO, tipo], TROFEO,
			{"type": tipo, "no_ganado": true}, false))
	relleno += _por_turnos([escudos, grises], rng)

	var out: Array = []
	for p: Dictionary in propias + relleno:
		if out.size() >= n:
			break
		var clave: String = String(p["clave"])
		if usadas.has(clave) or (not bool(p["propia"]) and vetos.has(clave)):
			continue
		usadas[clave] = true
		out.append(p)
	return out




static func datos_carrera() -> Dictionary:
	var club: String = GameState.player_team_id
	if Teams.is_free(club):
		return {}
	var clubs: Array = Career.clubs_history()
	var numeros: Dictionary = {}
	for id: Variant in clubs:
		numeros[String(id)] = Career.club_number(String(id))
	return {"club": club, "clubs": clubs, "numeros": numeros,
		"espalda": Career.nombre_espalda(), "keepsakes": Career.keepsakes,
		"awards": Career.awards, "brazaletes": Brazaletes.snapshot(),
		"nacionalidad": Career.nationality}









static func textura(pieza: Dictionary) -> Texture2D:
	var ref: Dictionary = pieza.get("ref", {})
	match String(pieza.get("tipo", "")):
		PLAYERA, PLAYERA_CAMBIO:
			var club: String = String(ref.get("club", ""))
			var kit: Dictionary = GameState.kit_variant(_equipo(club),
				int(ref.get("slot", 0)), int(ref.get("temporada", -1)))
			return JerseyArt.texture_named(kit, int(ref.get("numero", 0)),
				String(ref.get("apellido", "")))
		BANDERA:
			return Flags.texture(String(ref.get("nacion", "")))
		BRAZALETE:
			var eq: String = String(ref.get("equipo", ""))
			if bool(ref.get("seleccion", false)) and Flags.has(eq):
				return Flags.texture(eq)
			return _escudo(eq)
		ESCUDO:
			return _escudo(String(ref.get("equipo", "")))
		TROFEO:
			var tipo: String = String(ref.get("type", ""))
			if tipo.is_empty():
				return null
			return _hornea("%s:%s" % [TROFEO, tipo], func() -> Control:
				var ti: TrophyIcon = TrophyIcon.new()
				ti.set_type(tipo)
				return ti)
	return null




static func soltar() -> void:




	if _taller != null and is_instance_valid(_taller):
		_taller.queue_free()
	_taller = null
	_hornos.clear()
	_orden.clear()


static func _pieza(clave: String, tipo: String, ref: Dictionary, propia: bool) -> Dictionary:
	return {"clave": clave, "tipo": tipo, "ref": ref, "propia": propia}




static func _por_turnos(familias: Array, rng: RandomNumberGenerator) -> Array:
	var colas: Array = []
	var largo: int = 0
	for f: Variant in familias:
		var cola: Array =(f as Array).duplicate()
		for i: int in range(cola.size() - 1, 0, -1):
			var j: int = rng.randi_range(0, i)
			var t: Variant = cola[i]
			cola[i] = cola[j]
			cola[j] = t
		colas.append(cola)
		largo = maxi(largo, cola.size())
	var out: Array = []
	for i: int in largo:
		for cola: Variant in colas:
			if i <(cola as Array).size():
				out.append((cola as Array)[i])
	return out






static func _liga_de(club: String) -> Array:
	var t: Dictionary = {} if Teams.is_free(club) else Teams.by_id(club)
	if t.is_empty():
		var mejor: int = -1
		for e: Variant in Teams.all():
			if int((e as Dictionary).get("rating", 0)) > mejor:
				mejor = int((e as Dictionary).get("rating", 0))
				t = e
	if t.is_empty():
		return []
	return Teams.teams_in(String(t.get("country", "")), int(t.get("div", 1)))





static func _tipos_catalogo() -> Array:
	var out: Array = []
	for clave: Variant in Trophies.CATALOG:
		var tipo: String = _tipo_icono(String((Trophies.CATALOG[clave] as Dictionary).get("type", "")))
		if not tipo.is_empty() and not out.has(tipo):
			out.append(tipo)
	return out




static func _tipo_icono(tipo: String) -> String:
	return "clubes" if tipo == "intercontinental" else tipo




static func _equipo(id: String) -> Dictionary:
	var t: Dictionary = Teams.by_id(id)
	return t if not t.is_empty() else Nations.as_team(id)




static func _escudo(id: String) -> Texture2D:
	var equipo: Dictionary = _equipo(id)
	if equipo.is_empty():
		return null
	var llave: String = CrestLogos.key_of(equipo)
	if not llave.is_empty() and CrestLogos.has(llave):
		var logo: Texture2D = CrestLogos.texture(llave)
		if logo != null:
			return logo
	return _hornea("%s:%s|%d" % [ESCUDO, id, CrestLogos.version], func() -> Control:
		var cv: CrestView = CrestView.new()
		cv.set_team(equipo)
		return cv)









static func _hornea(clave: String, fabrica: Callable) -> Texture2D:



	_orden.erase(clave)
	if _hornos.has(clave) and is_instance_valid(_hornos[clave]):
		_orden.append(clave)
		return (_hornos[clave] as SubViewport).get_texture()
	_hornos.erase(clave)
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	if arbol == null:
		return null
	if _taller == null or not is_instance_valid(_taller):
		_taller = Node.new()
		_taller.name = "MemoramaTaller"
		arbol.root.add_child.call_deferred(_taller)
	while _orden.size() >= MAX_HORNOS:
		var vieja: String = _orden.pop_front()
		if is_instance_valid(_hornos.get(vieja)):
			(_hornos[vieja] as Node).queue_free()
		_hornos.erase(vieja)
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(LADO_PX, LADO_PX)
	vp.transparent_bg = true
	vp.disable_3d = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	var dibujo: Control = fabrica.call()


	dibujo.custom_minimum_size = Vector2(LADO_PX, LADO_PX)
	dibujo.size = Vector2(LADO_PX, LADO_PX)
	vp.add_child(dibujo)
	_taller.add_child(vp)
	_hornos[clave] = vp
	_orden.append(clave)
	return vp.get_texture()
