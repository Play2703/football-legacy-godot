class_name WorldNews





























































































































































const MAX: int = 80


const PER_CLOSE: int = 8
const PER_ROUND: int = 1



const FAMA: int = 85



const FAMA_LIGA: int = 88



const SORPRESA_GAP: int = 8


const ANILLO_MUNDO: int = 0
const ANILLO_LIGA: int = 1
const ANILLO_TUYO: int = 2




const CLAVES: Array[String] = ["season", "day", "kind", "club", "club2", "name",
	"n", "n2", "pais"]































const CIFRAS: Dictionary = {
	"liga": "rating", "descenso": "div", "bombazo": "fee", "retiro": "balones",
	"sorpresa": "puestos", "racha": "largo", "tecnico": "llega", "proyecto": "tipo",
	"goleo": "goles", "asistencias": "asistencias", "mvp": "media",
	"renueva": "hasta", "no_renueva": "hasta", "precontrato": "hasta",


	"palabra": "cumplida",


	"promesa": "edad",

	"campeones": "rating",

	"camiseta": "nada",


	"curva": "aplauso",


	"pizarra": "idea",


	"fairplay": "escalon",


	"uefa": "fase",


	"naming": "temporadas",


	"concurso": "nada",



	"socios": "pct",



	"directiva": "meta",





	"previa": "que",




	"pareja": "tipo",
}









const COMPS: Array[String] = ["league", "champions", "europa", "conference",
	"cup", "cwc", "libertadores", "sudamericana", "concacaf", "oriente", "sol",
	"atlas", "baobab",

	"coral"]



static func premio_comp(f: Dictionary) -> Array:
	var v: int = int(f.get("n2", 0))
	if v < 0:
		return [clampi(- v - 1, 0, COMPS.size() - 1), true]
	return [clampi(v, 0, COMPS.size() - 1), false]



static func premio_n2(comp: int, definitivo: bool) -> int:
	return -(comp + 1) if definitivo else comp









const PESO: Dictionary = {
	"sorpresa": 5, "bombazo": 5, "mvp": 4, "goleo": 4, "retiro": 4, "liga": 3,
	"asistencias": 3, "descenso": 2, "tecnico": 2, "racha": 1,


	"proyecto": 4,


	"fairplay": 4,

	"uefa": 4,

	"naming": 3,

	"concurso": 3,

	"socios": 3,

	"directiva": 2,

	"previa": 4,



	"salida": 5,


	"renueva": 2, "no_renueva": 2, "precontrato": 3,



	"palabra": 5,

	"promesa": 3,


	"campeones": 2,


	"camiseta": 5, "curva": 4,


	"pizarra": 2,

	"pareja": 5,
}






const ICONOS: Dictionary = {
	"liga": "torneos", "descenso": "derribar", "bombazo": "moneda",
	"retiro": "leyendas", "sorpresa": "balon", "racha": "velocidad",
	"tecnico": "tecnico",

	"proyecto": "mercado",

	"fairplay": "tarjeta",

	"uefa": "tarjeta",

	"naming": "local",

	"concurso": "candado",

	"socios": "aficion",

	"directiva": "torneos",

	"previa": "torneos",


	"goleo": "penal", "asistencias": "vision", "mvp": "palmares",



	"salida": "maletas",


	"renueva": "contrato", "no_renueva": "maletas", "precontrato": "contrato",


	"palabra": "prensa",

	"promesa": "cantera",

	"campeones": "torneos",


	"camiseta": "aficion", "curva": "aficion",

	"pizarra": "tecnico",

	"pareja": "pareja",
}








static func _fila(season: int, day: int, kind: String, club: String, club2: String,
		name: String, n: int, n2: int, pais: String) -> Dictionary:
	return {
		"season": season, "day": day, "kind": kind,
		"club": club, "club2": club2, "name": name,
		"n": n, "n2": n2, "pais": pais,
	}










static func empuja(feed: Array, filas: Array) -> Array:
	for i in range(filas.size() - 1, -1, -1):
		feed.push_front(filas[i])
	if feed.size() > MAX:
		return feed.slice(0, MAX)
	return feed








static func anillo(f: Dictionary) -> int:
	var mio: String = GameState.player_team_id
	if not mio.is_empty() and (str(f.get("club", "")) == mio
			or str(f.get("club2", "")) == mio):
		return ANILLO_TUYO
	var mi_pais: String = Teams.country_of(mio)
	if not mi_pais.is_empty() and str(f.get("pais", "")) == mi_pais:
		return ANILLO_LIGA







	if str(f.get("kind", "")) == "tecnico" and int(f.get("n2", 0)) == 1 \
			and not mi_pais.is_empty() \
			and Teams.country_of(str(f.get("club2", ""))) == mi_pais:
		return ANILLO_LIGA


	if str(f.get("kind", "")) == "tecnico" and Coach.es_nat(str(f.get("club", ""))) \
			and not mi_pais.is_empty() \
			and Teams.country_of(str(f.get("club2", ""))) == mi_pais:
		return ANILLO_LIGA
	return ANILLO_MUNDO




static func es_tuya(f: Dictionary) -> bool:
	return anillo(f) == ANILLO_TUYO






static func tuyas_sin_ver(feed: Array, pend: int) -> int:
	var n: int = 0
	for i in mini(maxi(pend, 0), feed.size()):
		if es_tuya(feed[i]):
			n += 1
	return n




static func _pasa(f: Dictionary, rating: int, barra: int) -> bool:
	return anillo(f) != ANILLO_MUNDO or rating >= barra






static func _prio(f: Dictionary, rating: int) -> int:
	var peso: int = int(PESO.get(str(f.get("kind", "")), 0))




	if CIFRAS.has(str(f.get("kind", ""))) and _es_premio(f) \
			and not bool(premio_comp(f)[1]):
		peso = maxi(peso - 1, 0)
	return anillo(f) * 10000 + peso * 100 + clampi(rating, 0, 99)




static func _es_premio(f: Dictionary) -> bool:
	var k: String = str(f.get("kind", ""))
	return k == "goleo" or k == "asistencias" or k == "mvp"















static func fila_premio(temporada: int, dia: int, kind: String, lider: Dictionary,
		valor: int, comp: int, definitivo: bool) -> Dictionary:
	var nombre: String = str(lider.get("name", ""))
	var club: String = str(lider.get("team", ""))
	if nombre.is_empty() or valor <= 0:
		return {}
	return _fila(temporada, dia, kind, club, "", nombre, valor,
		premio_n2(comp, definitivo), Teams.country_of(club))


static func _antes(a: Dictionary, b: Dictionary) -> bool:
	var pa: int = int(a.get("_p", 0))
	var pb: int = int(b.get("_p", 0))
	if pa != pb:
		return pa > pb
	var ka: String = str(a.get("kind", "")) + "|" + str(a.get("club", ""))
	var kb: String = str(b.get("kind", "")) + "|" + str(b.get("club", ""))
	return ka < kb





static func _corta(cand: Array, tope: int) -> Array:
	cand.sort_custom(_antes)
	var out: Array = []
	for i in mini(tope, cand.size()):
		var f: Dictionary = cand[i]
		f.erase("_p")
		out.append(f)
	return out


static func _cand(f: Dictionary, rating: int) -> Dictionary:
	f["_p"] = _prio(f, rating)
	return f













static func activas_hoy() -> Array:
	var out: Array = []
	for e in WorldLegends.emerged():
		var d: Dictionary = e
		var nom: String = str(d.get("name", ""))
		if nom.is_empty():
			continue
		if WorldLegends.active_of(nom, str(d.get("last_club", ""))):
			out.append(nom)
	out.sort()
	return out












static func filas_cierre(temporada: int, dia: int, activas_antes: Array) -> Array:
	var cand: Array = []
	_campeones(cand, temporada, dia)
	_descensos(cand, temporada, dia)
	_retiros(cand, temporada, dia, activas_antes)
	_promesas(cand, temporada, dia)
	return _corta(cand, PER_CLOSE)









static func _campeones(cand: Array, temporada: int, dia: int) -> void:
	var hist: Array = Career.league_history
	var i: int = hist.size() - 1
	while i >= 0:
		var fila: Dictionary = hist[i]
		i -= 1
		var s: int = int(fila.get("season", -1))
		if s < temporada:
			break
		if s != temporada:
			continue
		var pais: String = str(fila.get("country", ""))
		if pais.is_empty():
			continue
		var campeon: String = Career.league_champion_of(pais, temporada)
		if campeon.is_empty():
			continue
		var rat: int = Teams.rating(campeon)








		var sl: String = str(fila.get("superlider", "")) \
				if Liguilla.aplica(pais, 1) else ""
		if sl == campeon:
			sl = ""





		var n2: int = 0
		var ap: String = str(fila.get("champion_ap", ""))
		if not ap.is_empty():
			n2 = 2 if ap == campeon else 1
			sl = "" if ap == campeon else ap
		var f: Dictionary = _fila(temporada, dia, "liga", campeon, sl, "",
			rat, n2, pais)
		if _pasa(f, rat, FAMA_LIGA):
			cand.append(_cand(f, rat))
		_campeon_de_campeones(cand, fila, temporada, dia, pais)










static func _campeon_de_campeones(cand: Array, fila: Dictionary, temporada: int,
		dia: int, pais: String) -> void:
	var cdc: String = str(fila.get("campeones", ""))
	if cdc.is_empty():
		return
	var otro: String = ""
	for c in Career.campeones_de(pais, temporada - 1):
		if str(c) != cdc:
			otro = str(c)
	var rat: int = Teams.rating(cdc)
	var f: Dictionary = _fila(temporada, dia, "campeones", cdc, otro, "", rat, 0, pais)
	if _pasa(f, rat, FAMA_LIGA):
		cand.append(_cand(f, rat))











static func _descensos(cand: Array, temporada: int, dia: int) -> void:
	for id in GameState.last_div_moves:
		if int(GameState.last_div_moves[id]) != 1:
			continue
		var club: String = str(id)
		var div: int = GameState.div_of(club)
		var rat: int = Teams.rating(club)
		var f: Dictionary = _fila(temporada, dia, "descenso", club, "", "",
			div, rat, Teams.country_of(club))
		if anillo(f) == ANILLO_MUNDO and div != 2:
			continue
		if _pasa(f, rat, FAMA):
			cand.append(_cand(f, rat))











static func _retiros(cand: Array, temporada: int, dia: int,
		activas_antes: Array) -> void:
	if activas_antes.is_empty():
		return
	var vivas: Dictionary = {}
	for n in activas_hoy():
		vivas[str(n)] = true
	for e in WorldLegends.emerged():
		var d: Dictionary = e
		var nom: String = str(d.get("name", ""))
		if nom.is_empty() or vivas.has(nom) or not activas_antes.has(nom):
			continue
		var club: String = str(d.get("last_club", ""))
		var rat: int = Teams.rating(club)
		var f: Dictionary = _fila(temporada, dia, "retiro", club, "", nom,
			int(d.get("balon", 0)), 0, Teams.country_of(club))
		if _pasa(f, rat, FAMA):
			cand.append(_cand(f, rat))











const PROMESA_EDAD: int = 20
static func _promesas(cand: Array, temporada: int, dia: int) -> void:
	var mio: String = GameState.player_team_id
	var mi_pais: String = Teams.country_of(mio)
	var mejor: Dictionary = {}
	var mejor_o: int = -1
	var tuya: Dictionary = {}
	var tuya_o: int = -1
	for t in Teams.all():
		var cid: String = str((t as Dictionary).get("id", ""))
		var rat: int = int((t as Dictionary).get("rating", 62))
		if cid != mio and rat < FAMA and Teams.country_of(cid) != mi_pais:
			continue
		var sq: Array = Squad.home_of(cid)
		for i in mini(sq.size(), Squad.FORMATION.size()):
			var pos: String = Squad.FORMATION[i]
			var rel: Dictionary = WorldAging.seat_relevo(cid, i, pos, temporada)
			if int(rel.get("gen", 0)) < 1 or int(rel.get("desde", -1)) != temporada:
				continue
			if WorldAging.heir_kind(cid, i, int(rel["gen"])) != WorldAging.HEIR_CANTERA:
				continue



			var ces: Dictionary = WorldAging.cesion_of(cid, i, int(rel["gen"]))
			var edad: int = WorldAging.seat_age(cid, i, pos, temporada)
			if edad > PROMESA_EDAD + int(ces.get("temps", 0)):
				continue
			var p: Dictionary = sq[i]
			var o: int = SquadMeta.ovr_of(p, str(p.get("pos", pos)))
			var f: Dictionary = _fila(temporada, dia, "promesa", cid, String(ces.get("club", "")),
				str(p.get("name", "")), edad, WorldAging.cantera_fama(cid, temporada),
				Teams.country_of(cid))
			if cid == mio:
				if o > tuya_o:
					tuya = _cand(f, rat)
					tuya_o = o
			elif _pasa(f, rat, FAMA) and o > mejor_o:
				mejor = _cand(f, rat)
				mejor_o = o
	if not mejor.is_empty():
		cand.append(mejor)
	if not tuya.is_empty():
		cand.append(tuya)



























static func filas_jornada(temporada: int, dia: int, resultados: Array,
		pos: Dictionary, feed: Array) -> Array:
	var cand: Array = []
	_sorpresas(cand, temporada, dia, resultados, pos)
	_rachas(cand, temporada, dia, pos, feed)
	return _corta(cand, PER_ROUND)





static func _puesto(pos: Dictionary, club_id: String) -> int:
	if club_id.is_empty():
		return 0
	return int(pos.get(GameState.form_key_of(club_id), 0))






static func _sorpresas(cand: Array, temporada: int, dia: int, resultados: Array,
		pos: Dictionary) -> void:
	var n_eq: int = pos.size()
	if n_eq < 6:
		return
	for r in resultados:
		var d: Dictionary = r
		var ga: int = int(d.get("ga", 0))
		var gb: int = int(d.get("gb", 0))
		if ga == gb:
			continue
		var gan: String = str(d.get("a", "")) if ga > gb else str(d.get("b", ""))
		var per: String = str(d.get("b", "")) if ga > gb else str(d.get("a", ""))
		var pg: int = _puesto(pos, gan)
		var pp: int = _puesto(pos, per)
		if pg <= 0 or pp <= 0 or pg - pp < SORPRESA_GAP:
			continue
		if pp > 3 and pg < n_eq - 2:
			continue
		var f: Dictionary = _fila(temporada, dia, "sorpresa", gan, per, "",
			pg, pp, Teams.country_of(gan))
		cand.append(_cand(f, Teams.rating(gan)))










static func _rachas(cand: Array, temporada: int, dia: int, pos: Dictionary,
		feed: Array) -> void:
	var n_eq: int = pos.size()
	if n_eq < 6:
		return
	for k in GameState.league_form:
		var l: Array = GameState.league_form[k]
		if l.size() < GameState.FORM_N:
			continue
		var ganados: int = 0
		for r in l:
			if str(r) == "G":
				ganados += 1
		var dir: int = 0
		if ganados == GameState.FORM_N:
			dir = 1
		elif ganados == 0:
			dir = -1
		else:
			continue
		var clave: String = str(k)
		var club: String = GameState.player_team_id \
				if clave == GameState.YOU_KEY else clave
		if club.is_empty():
			continue
		var p: int = _puesto(pos, club)
		if p <= 0:
			continue
		if dir > 0 and p > 3:
			continue
		if dir < 0 and p < n_eq - 2:
			continue
		if _ya_racha(feed, temporada, club, dir):
			continue
		var f: Dictionary = _fila(temporada, dia, "racha", club, "", "",
			GameState.FORM_N, dir, Teams.country_of(club))
		cand.append(_cand(f, Teams.rating(club)))





static func _ya_racha(feed: Array, temporada: int, club: String, dir: int) -> bool:
	for n in feed:
		var f: Dictionary = n
		if int(f.get("season", -1)) != temporada:
			continue
		if str(f.get("kind", "")) == "racha" and str(f.get("club", "")) == club \
				and int(f.get("n2", 0)) == dir:
			return true
	return false



















static func fila_bombazo(temporada: int, dia: int, noticias: Array,
		pendientes: int, record: int) -> Dictionary:
	var tope: int = mini(maxi(pendientes, 0), noticias.size())
	var mejor: Dictionary = {}
	var alto: int = record
	for i in tope:
		var m: Dictionary = noticias[i]
		if str(m.get("kind", "")) != "signing":
			continue
		var fee: int = int(m.get("fee", 0))
		if fee <= alto:
			continue
		alto = fee
		mejor = m
	if mejor.is_empty():
		return {}
	var a: String = str(mejor.get("to", ""))
	return _fila(temporada, dia, "bombazo", a, str(mejor.get("from", "")),
		str(mejor.get("name", "")), int(mejor.get("fee", 0)), 0,
		Teams.country_of(a))












const ANUARIO_MAX: int = 6
const ANUARIO_LIGAS: int = 3
const ANUARIO_RETIROS: int = 2
























static func filas_anuario(temporada: int, mi_pais: String, feed: Array,
		noticias: Array, tope: int, gala: Dictionary, mi_club: String = "") -> Array:
	var out: Array = []
	var ganador: Dictionary = gala.get("winner", {}) as Dictionary
	if not ganador.is_empty() and not bool(ganador.get("you", false)) \
			and not str(ganador.get("name", "")).is_empty():
		var eq: String = str(ganador.get("team", ""))
		out.append(_fila(temporada, 0, "balon", eq, "", str(ganador.get("name", "")),
			0, 0, Teams.country_of(eq)))


	for par in [["mundo", "mundo"], ["chico", "chico"]]:
		var otro: Dictionary =(gala.get(par[0], {}) as Dictionary).get("winner", {}) \
				as Dictionary
		if otro.is_empty() or bool(otro.get("you", false)) \
				or str(otro.get("name", "")).is_empty():
			continue
		var eq2: String = str(otro.get("team", ""))
		out.append(_fila(temporada, 0, String(par[1]), eq2, "", str(otro.get("name", "")),
			int(otro.get("age", 0)), 0, Teams.country_of(eq2)))



	var gol: Dictionary =(gala.get("gol", {}) as Dictionary).get("winner", {}) as Dictionary
	if not gol.is_empty() and not str(gol.get("name", "")).is_empty():
		var eq3: String = str(gol.get("club", ""))
		out.append(_fila(temporada, 0, "gol", eq3, str(gol.get("tipo", "")),
			str(gol.get("name", "")), int(gol.get("min", 0)), 0, Teams.country_of(eq3)))
	var ligas: Array = []
	var retiros: Array = []
	for v in feed:
		if not v is Dictionary:
			continue
		var f: Dictionary = v
		if int(f.get("season", -1)) != temporada:
			continue
		match str(f.get("kind", "")):
			"liga":
				if str(f.get("pais", "")) != mi_pais:
					ligas.append(f)
			"retiro":
				retiros.append(f)


	ligas.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a.get("n", 0)) != int(b.get("n", 0)):
			return int(a.get("n", 0)) > int(b.get("n", 0))
		return str(a.get("club", "")) < str(b.get("club", "")))
	retiros.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a.get("n", 0)) != int(b.get("n", 0)):
			return int(a.get("n", 0)) > int(b.get("n", 0))
		return str(a.get("name", "")) < str(b.get("name", "")))
	var bomba: Dictionary = _bombazo_del_ano(temporada, noticias, tope, mi_club)
	var n_ret: int = mini(retiros.size(), ANUARIO_RETIROS)
	var libres: int = ANUARIO_MAX - out.size() - n_ret -(0 if bomba.is_empty() else 1)




	var bota: Dictionary =(gala.get("bota", {}) as Dictionary).get("winner", {}) as Dictionary
	if libres > 0 and not bota.is_empty() and not bool(bota.get("you", false)) \
			and not str(bota.get("name", "")).is_empty():
		var eq4: String = str(bota.get("team", ""))
		out.append(_fila(temporada, 0, "bota", eq4, "", str(bota.get("name", "")),
			int(bota.get("goals", 0)), 0, Teams.country_of(eq4)))
		libres -= 1
	for i in mini(ligas.size(), mini(ANUARIO_LIGAS, maxi(libres, 0))):
		out.append(ligas[i])
	if not bomba.is_empty():
		out.append(bomba)
	for i in n_ret:
		out.append(retiros[i])
	return out.slice(0, ANUARIO_MAX)




















static func _bombazo_del_ano(temporada: int, noticias: Array, tope: int,
		mi_club: String = "") -> Dictionary:
	var del_ano: Array = []
	var cubierto: bool = noticias.size() < tope
	for v in noticias:
		if not v is Dictionary:
			continue
		var m: Dictionary = v
		var s: int = int(m.get("season", -1))
		if s > temporada:
			continue
		if s < temporada:
			cubierto = true
			break

		if mi_club.is_empty() or str(m.get("to", "")) != mi_club:
			del_ano.append(m)
		if int(m.get("day", 0)) <= Market.summer_last():
			cubierto = true
	if not cubierto or del_ano.is_empty():
		return {}
	return fila_bombazo(temporada, 0, del_ano, del_ano.size(), 0)


































static func fila_tecnico(temporada: int, dia: int, club: String, nombre: String,
		club_anterior: String = "", llega: bool = true,
		robo: bool = false) -> Dictionary:
	if club.is_empty() or nombre.is_empty():
		return {}
	if not club_anterior.is_empty() and club_anterior == club:
		return {}
	var f: Dictionary = _fila(temporada, dia, "tecnico", club, club_anterior,
		nombre, 1 if llega else 0, 1 if robo else 0, Teams.country_of(club))
	if not _pasa(f, Teams.rating(club), FAMA):
		return {}
	return f







static func fila_seleccion(temporada: int, dia: int, pais: String, nombre: String,
		club_anterior: String = "", llega: bool = true) -> Dictionary:
	if pais.is_empty() or nombre.is_empty():
		return {}
	var sitio: String = Coach.origen_nat(pais)
	if not club_anterior.is_empty() and club_anterior == sitio:
		return {}
	var f: Dictionary = _fila(temporada, dia, "tecnico", sitio, club_anterior,
		nombre, 1 if llega else 0, 0, Nations.name_of(pais))
	if not _pasa(f, Nations.strength(pais), FAMA):
		return {}
	return f



















static func fila_proyecto(temporada: int, dia: int, club: String, tipo: int,
		dura: int, perfil: String = "") -> Dictionary:
	if club.is_empty():
		return {}
	var f: Dictionary = _fila(temporada, dia, "proyecto", club, "", "", signi(tipo),
		maxi(dura, 0), Teams.country_of(club))

	if tipo != 0 and not perfil.is_empty():
		f["perfil"] = perfil
	return f





static func fila_fairplay(temporada: int, dia: int, club: String,
		sancion: bool) -> Dictionary:
	if club.is_empty():
		return {}
	return _fila(temporada, dia, "fairplay", club, "", "", 2 if sancion else 1,
		ClubFinance.FFP_PUNTOS, Teams.country_of(club))






static func fila_uefa(temporada: int, dia: int, club: String, fallo: bool) -> Dictionary:
	if club.is_empty():
		return {}
	return _fila(temporada, dia, "uefa", club, "", "", 2 if fallo else 1,
		Duenos.UEFA_SIN_EUROPA, Teams.country_of(club))





const DIRECTIVA_SUBE: int = 1
const DIRECTIVA_BAJA: int = 2
const DIRECTIVA_KO: int = 3
static func fila_directiva(temporada: int, dia: int, club: String, que: int,
		puesto: int = 0, comp: String = "") -> Dictionary:
	if club.is_empty():
		return {}
	var f: Dictionary = _fila(temporada, dia, "directiva", club, "", "", que, puesto,
		Teams.country_of(club))
	if not comp.is_empty():
		f["comp"] = comp
	return f






const PREVIA_ESTRENO: int = 1
const PREVIA_RIVAL: int = 2
const PREVIA_PASA: int = 3
const PREVIA_CAE: int = 4
const PREVIA_EPS: int = 5
static func fila_previa(temporada: int, dia: int, club: String, que: int, rival: String = "",
		comp: String = "", ronda: String = "", pais: String = "") -> Dictionary:
	if club.is_empty():
		return {}
	var f: Dictionary = _fila(temporada, dia, "previa", club, rival, "", que, 0,
		pais if not pais.is_empty() else Teams.country_of(club))
	if not comp.is_empty():
		f["comp"] = comp
	if not ronda.is_empty():
		f["ronda"] = ronda
	return f



static func _ronda_previa(ronda: String) -> String:
	match ronda:
		"LP", "":
			return I18n.t("FASE DE LIGA")
		"PO":
			return I18n.t("PLAYOFF")
	return I18n.t(ronda)





static func fila_naming(temporada: int, dia: int, club: String, nombre: String) -> Dictionary:
	if club.is_empty() or nombre.is_empty():
		return {}
	return _fila(temporada, dia, "naming", club, "", nombre, NombreComercial.TEMPORADAS, 0,
		Teams.country_of(club))






static func fila_concurso(temporada: int, dia: int, club: String, casero: String = "") -> Dictionary:
	if club.is_empty():
		return {}
	return _fila(temporada, dia, "concurso", club, casero, "", 0, 0, Teams.country_of(club))





const CONCURSO_SALE: int = 1
static func fila_convenio(temporada: int, dia: int, club: String) -> Dictionary:
	if club.is_empty():
		return {}
	return _fila(temporada, dia, "concurso", club, "", "", 0, CONCURSO_SALE, Teams.country_of(club))




static func fila_socios(temporada: int, dia: int, club: String, pct: int) -> Dictionary:
	if club.is_empty():
		return {}
	return _fila(temporada, dia, "socios", club, "", "", pct, 0, Teams.country_of(club))






const SOCIOS_SIGUEN: int = 1
const SOCIOS_VENDEN: int = 2
static func fila_fin_socios(temporada: int, dia: int, club: String, pct: int, vende: bool) -> Dictionary:
	if club.is_empty():
		return {}
	return _fila(temporada, dia, "socios", club, "", "", pct,
		SOCIOS_VENDEN if vende else SOCIOS_SIGUEN, Teams.country_of(club))











const SALIDA_MOTIVOS: Array = [Salida.MINUTOS, Salida.MEJOR, Salida.PROYECTO]











static func fila_salida(temporada: int, dia: int, club: String, nombre: String,
		cesion: bool, motivo: String) -> Dictionary:
	if club.is_empty() or nombre.is_empty():
		return {}
	return _fila(temporada, dia, "salida", club, "", nombre,
		SALIDA_MOTIVOS.find(motivo) + 1, 1 if cesion else 0, Teams.country_of(club))











static func fila_palabra(temporada: int, dia: int, club: String, rival: String,
		nombre: String, cumplida: bool, gol: bool = false) -> Dictionary:
	if club.is_empty() or rival.is_empty() or nombre.is_empty():
		return {}
	return _fila(temporada, dia, "palabra", club, rival, nombre,
		1 if cumplida else 0, 1 if gol else 0, Teams.country_of(club))





static func fila_camiseta(temporada: int, dia: int, club: String,
		nombre: String) -> Dictionary:
	if club.is_empty() or nombre.is_empty():
		return {}
	return _fila(temporada, dia, "camiseta", club, "", nombre, 0, 0,
		Teams.country_of(club))





static func fila_curva(temporada: int, dia: int, club: String, rival: String,
		aplauso: bool) -> Dictionary:
	if club.is_empty() or rival.is_empty():
		return {}
	return _fila(temporada, dia, "curva", club, rival, "", 1 if aplauso else 0, 0,
		Teams.country_of(club))







const PAREJA_BODA: int = 1
const PAREJA_DIVORCIO: int = 2
const PAREJA_RUPTURA: int = 3
const PAREJA_SE_VIENE: int = 4
const PAREJA_SE_QUEDA: int = 5
static func fila_pareja(temporada: int, dia: int, club: String, nombre: String,
		tipo: int) -> Dictionary:
	if club.is_empty() or nombre.is_empty() or tipo < PAREJA_BODA or tipo > PAREJA_SE_QUEDA:
		return {}
	return _fila(temporada, dia, "pareja", club, "", nombre, tipo, 0,
		Teams.country_of(club))





static func fila_pizarra(temporada: int, dia: int, club: String, nombre: String,
		idea: String) -> Dictionary:
	if club.is_empty() or nombre.is_empty():
		return {}
	var n: int = -1
	for i in Coach.IDEAS.size():
		if String((Coach.IDEAS[i] as Dictionary)["id"]) == idea:
			n = i
	if n < 0:
		return {}
	return _fila(temporada, dia, "pizarra", club, "", nombre, n, 0, Teams.country_of(club))











static func fila_contrato(temporada: int, dia: int, kind: String, club: String,
		club2: String, nombre: String, anio: int, relevante: bool) -> Dictionary:
	if club.is_empty() or nombre.is_empty():
		return {}
	var f: Dictionary = _fila(temporada, dia, kind, club, club2, nombre, anio, 0,
		Teams.country_of(club))
	if es_tuya(f):
		return f
	if not relevante or not _pasa(f, Teams.rating(club), FAMA):
		return {}
	return f





static func ya_contrato(feed: Array, temporada: int, club: String) -> bool:
	for f in feed:
		if int(f.get("season", 0)) != temporada or str(f.get("club", "")) != club:
			continue
		if str(f.get("kind", "")) in ["renueva", "no_renueva", "precontrato"]:
			return true
	return false










static func _club(id: String) -> String:
	if id.is_empty():
		return "?"

	if Coach.es_nat(id):
		return Nations.display_name(Coach.pais_nat(id))
	var t: Dictionary = Teams.by_id(id)
	if t.is_empty():
		return "?"
	return Competitions.demarca(str(t.get("name", "?")))







static func _apellido(full: String) -> String:
	var i: int = full.find(" ")
	return full if i < 0 else full.substr(i + 1)




static func _titular_seleccion(nombre: String, sitio: String, antes: String,
		n: int) -> String:
	if n <= 0:
		return I18n.tf("{0} deja de ser seleccionador de {1}", [nombre, _club(sitio)])
	if antes.is_empty():
		return I18n.tf("{0}, nuevo seleccionador de {1}", [nombre, _club(sitio)])
	if Coach.es_nat(antes):
		return I18n.tf("{0} deja la selección de {1} y coge la de {2}",
			[nombre, _club(antes), _club(sitio)])
	return I18n.tf("{0} deja el {1} para dirigir a {2}",
		[nombre, _club(antes), _club(sitio)])






static func sello(f: Dictionary) -> String:
	match str(f.get("kind", "")):
		"liga":
			return I18n.t("CAMPEÓN DE LIGA")
		"campeones":
			return I18n.t(Competitions.CAMPEONES_NAME)
		"descenso":
			return I18n.t("DESCIENDE")
		"bombazo":
			return I18n.t("BOMBAZO")
		"retiro":
			return I18n.t("SE RETIRA")
		"promesa":
			return I18n.t("PROMESA")
		"sorpresa":
			return I18n.t("SORPRESA")
		"racha":
			return I18n.t("EN RACHA")
		"tecnico":
			return I18n.t("BANQUILLO")
		"proyecto":

			if int(f.get("n", 0)) < 0:
				return I18n.t("CRISIS")

			match str(f.get("perfil", "")):
				Duenos.JEQUE:
					return I18n.t("UN JEQUE")
				Duenos.MAGNATE:
					return I18n.t("UN MAGNATE")
				Duenos.FONDO:
					return I18n.t("UN FONDO")
			return I18n.t("INVERSOR")
		"fairplay":

			return I18n.t("SANCION") if int(f.get("n", 0)) >= 2 else I18n.t("FAIR PLAY")
		"uefa":


			return I18n.t("EUROPA")
		"naming":
			return I18n.t("ESTADIO")
		"concurso":
			return I18n.t("CONCURSO")
		"socios":
			return I18n.t("SOCIOS")
		"directiva":
			return I18n.t("DIRECTIVA")
		"previa":
			return I18n.t("PREVIA")
		"salida":


			return I18n.t("PIDE SALIR")
		"palabra":


			return I18n.t("BRAVATA")
		"camiseta":
			return I18n.t("REGALO")
		"pizarra":
			return I18n.t("PIZARRA")
		"pareja":

			match int(f.get("n", 0)):
				PAREJA_BODA:
					return I18n.t("BODA")
				PAREJA_DIVORCIO:
					return I18n.t("DIVORCIO")
				PAREJA_RUPTURA:
					return I18n.t("RUPTURA")
				PAREJA_SE_VIENE:
					return I18n.t("JUNTOS")
				PAREJA_SE_QUEDA:
					return I18n.t("A DISTANCIA")
			return ""
		"curva":


			return I18n.t("APLAUSOS") if int(f.get("n", 0)) > 0 else I18n.t("PITOS")
		"renueva":
			return I18n.t("RENUEVA")
		"no_renueva":
			return I18n.t("SE VA LIBRE")
		"precontrato":
			return I18n.t("PRECONTRATO")
		"goleo":





			return _sello_premio(f, I18n.t("REY DEL GOL"))
		"asistencias":
			return _sello_premio(f, I18n.t("REY DEL PASE"))
		"mvp":






			return I18n.t("MEJOR JUGADOR DE LA LIGA")
	return ""






static func _sello_premio(f: Dictionary, base: String) -> String:
	var c: Array = premio_comp(f)
	if int(c[0]) == 0:
		return base
	return base + " · " + Competitions.comp_name(COMPS[int(c[0])])





static func titular(f: Dictionary) -> String:
	var kind: String = str(f.get("kind", ""))
	var club: String = str(f.get("club", ""))
	var club2: String = str(f.get("club2", ""))
	var nombre: String = str(f.get("name", ""))
	var n: int = int(f.get("n", 0))
	match kind:
		"liga":


			if int(f.get("n2", 0)) == 2:
				return I18n.tf("{0} es bicampeón: Apertura y Clausura", [_club(club)])
			if int(f.get("n2", 0)) == 1 and not club2.is_empty():
				return I18n.tf("{0} gana el Clausura; el Apertura fue de {1}",
					[_club(club), _club(club2)])

			if not club2.is_empty():
				return I18n.tf("{0} gana la liguilla y la liga; {1} fue superlíder",
					[_club(club), _club(club2)])
			return I18n.tf("{0} se lleva la liga", [_club(club)])
		"campeones":
			if club2.is_empty():
				return I18n.tf("{0} es Campeón de Campeones", [_club(club)])
			return I18n.tf("{0} es Campeón de Campeones ante {1}",
				[_club(club), _club(club2)])
		"descenso":



			return I18n.tf("{0} baja a {1}", [_club(club),
				I18n.t(Teams.div_name(n))])
		"bombazo":
			return I18n.tf("{0} es el fichaje más caro de la ventana",
				[_apellido(nombre)])
		"retiro":
			return I18n.tf("{0} cuelga las botas", [nombre])
		"promesa":

			if not club2.is_empty():
				return I18n.tf("{0}, {2} años, vuelve de su cesión en el {3} y se gana el once del {1}",
					[nombre, _club(club), n, _club(club2)])
			if int(f.get("n2", 0)) >= 1:
				return I18n.tf("La cantera del {1} no para: {0}, {2} años, ya es titular",
					[nombre, _club(club), n])
			return I18n.tf("{0}, {2} años, se gana un puesto en el once del {1}",
				[nombre, _club(club), n])
		"sorpresa":
			return I18n.tf("{0} tumba al {1}", [_club(club), _club(club2)])
		"racha":
			if int(f.get("n2", 0)) > 0:
				return I18n.tf("{0} lleva {1} victorias seguidas", [_club(club), n])
			return I18n.tf("{0} lleva {1} partidos sin ganar", [_club(club), n])
		"goleo":
			if bool(premio_comp(f)[1]):
				return I18n.tf("{0} acaba de máximo goleador con {1}",
					[_apellido(nombre), n])
			return I18n.tf("{0} lidera el goleo con {1}", [_apellido(nombre), n])
		"asistencias":
			if bool(premio_comp(f)[1]):
				return I18n.tf("{0} acaba líder de asistencias con {1}",
					[_apellido(nombre), n])
			return I18n.tf("{0} manda en asistencias con {1}",
				[_apellido(nombre), n])
		"mvp":


			return I18n.tf("{0} es el jugador de la temporada ({1})",
				[_apellido(nombre), "%.1f" %(float(n) / 10.0)])
		"salida":





			return _titular_salida(_apellido(nombre), club, n,
				int(f.get("n2", 0)) == 1)
		"palabra":
			if int(f.get("n2", 0)) == 1:
				if n > 0:
					return I18n.tf("{0} cumplió su promesa de gol ante el {1}",
						[_apellido(nombre), _club(club2)])
				return I18n.tf("{0} prometió un gol ante el {1} y no llegó",
					[_apellido(nombre), _club(club2)])
			if n > 0:
				return I18n.tf("{0} cumplió su palabra ante el {1}",
					[_apellido(nombre), _club(club2)])
			return I18n.tf("{0} se traga sus palabras ante el {1}",
				[_apellido(nombre), _club(club2)])
		"camiseta":
			return I18n.tf("{0} le da su camiseta a un niño de la grada",
				[_apellido(nombre)])
		"pareja":
			match n:
				PAREJA_BODA:
					return I18n.tf("{0} se casa", [_apellido(nombre)])
				PAREJA_DIVORCIO:
					return I18n.tf("{0} se divorcia", [_apellido(nombre)])
				PAREJA_RUPTURA:
					return I18n.tf("{0} rompe con su pareja", [_apellido(nombre)])
				PAREJA_SE_VIENE:
					return I18n.tf("{0} llega al {1} con su pareja",
						[_apellido(nombre), _club(club)])
				PAREJA_SE_QUEDA:
					return I18n.tf("{0} llega solo al {1}: su pareja no se muda",
						[_apellido(nombre), _club(club)])
			return ""
		"pizarra":


			var forma: String = String((Coach.IDEAS[clampi(n, 0, Coach.IDEAS.size() - 1)]
				as Dictionary).get("forma", ""))
			return I18n.tf("El {0} ya juega el {1} de {2}",
				[_club(club), forma, _apellido(nombre)])
		"curva":
			if n > 0:
				return I18n.tf("Goleada ante el {0}: la grada del {1} aplaude igual",
					[_club(club2), _club(club)])
			return I18n.tf("Goleada ante el {0}: pitos y pañuelos para el {1}",
				[_club(club2), _club(club)])
		"tecnico":

			if Coach.es_nat(club):
				return _titular_seleccion(nombre, club, club2, n)
			if Coach.es_nat(club2):
				return I18n.tf("{0} deja la selección de {1} y coge el {2}",
					[nombre, _club(club2), _club(club)])
			if n <= 0:
				return I18n.tf("El {0} destituye a {1}", [_club(club), nombre])
			if club2.is_empty():
				return I18n.tf("{0} coge el banquillo del {1}", [nombre, _club(club)])



			if int(f.get("n2", 0)) == 1:
				return I18n.tf("El {0} se lleva a {1} del {2}",
					[_club(club), nombre, _club(club2)])
			return I18n.tf("{0} deja el {1} y coge el {2}",
				[nombre, _club(club2), _club(club)])
		"renueva":
			return I18n.tf("{0} renueva con el {1} hasta {2}",
				[_apellido(nombre), _club(club), n])
		"no_renueva":
			return I18n.tf("{0} no renovará con el {1}: se va libre en junio",
				[_apellido(nombre), _club(club)])
		"precontrato":
			return I18n.tf("{0} firma un precontrato con el {1}",
				[_apellido(nombre), _club(club2)])
		"proyecto":

			if n > 0:
				match str(f.get("perfil", "")):
					Duenos.JEQUE:
						return I18n.tf("Un jeque compra el {0}: viene a ganarlo todo", [_club(club)])
					Duenos.MAGNATE:
						return I18n.tf("Un magnate compra el {0}: llega dinero para fichar", [_club(club)])
					Duenos.FONDO:
						return I18n.tf("Un fondo compra el {0} para revenderlo", [_club(club)])
				return I18n.tf("{0} cambia de dueño: llega dinero para fichar", [_club(club)])
			if n < 0:

				if str(f.get("perfil", "")) == Duenos.JEQUE:
					return I18n.tf("El jeque deja el {0} y su nómina se queda: crisis", [_club(club)])
				return I18n.tf("{0} entra en crisis y tendrá que vender", [_club(club)])
			return I18n.tf("Se acaba el dinero del nuevo dueño del {0}", [_club(club)])
		"fairplay":
			if n >= 2:
				return I18n.tf("{0} arranca la liga con -{1} puntos por el fair play",
					[_club(club), int(f.get("n2", 0))])
			return I18n.tf("{0} incumple el fair play: si repite, perderá {1} puntos",
				[_club(club), int(f.get("n2", 0))])
		"uefa":
			if n >= 2:
				return I18n.tf("El comité europeo deja al {0} sin Europa una temporada", [_club(club)])
			return I18n.tf("El comité europeo investiga el dinero del jeque del {0}", [_club(club)])
		"naming":
			return I18n.tf("El {0} vende el nombre de su estadio: ahora es el {1}",
				[_club(club), str(f.get("name", ""))])
		"concurso":
			if int(f.get("n2", 0)) == CONCURSO_SALE:
				return I18n.tf("El {0} sale del concurso: pacta con sus acreedores y vuelve a fichar",
					[_club(club)])

			var casero: String = str(f.get("club2", ""))
			if not casero.is_empty():
				return I18n.tf("El {0} entra en concurso y le embargan el estadio: jugará en el campo del {1}",
					[_club(club), _club(casero)])
			return I18n.tf("El {0} entra en concurso de acreedores: este verano no ficha",
				[_club(club)])
		"directiva":
			match n:
				DIRECTIVA_SUBE:
					return I18n.tf("El {0} se ilusiona: la directiva pide acabar {1}",
						[_club(club), I18n.ordinal(int(f.get("n2", 1)))])
				DIRECTIVA_BAJA:
					return I18n.tf("El {0} rebaja la meta: ahora le basta acabar {1}",
						[_club(club), I18n.ordinal(int(f.get("n2", 1)))])
			return I18n.tf("El {0} cae en {1} antes de lo que pedía la directiva",
				[_club(club), I18n.t(Competitions.comp_name(String(ClubGoals.BRAND.get(str(f.get("comp", "")), "copa"))))])
		"previa":
			var copa: String = I18n.t(Competitions.comp_name(String(ClubGoals.BRAND.get(str(f.get("comp", "")), "champions"))))
			var ronda: String = str(f.get("ronda", ""))
			match n:
				PREVIA_ESTRENO:
					return I18n.t("Las copas europeas estrenan rondas previas este verano")
				PREVIA_RIVAL:
					return I18n.tf("El {0} jugará la ronda {1} de la {2} contra el {3}",
						[_club(club), _ronda_previa(ronda), copa, _club(club2)])
				PREVIA_PASA:
					if ronda == "LP":
						return I18n.tf("El {0} elimina al {1} y entra en la fase de liga de la {2}",
							[_club(club), _club(club2), copa])
					return I18n.tf("El {0} elimina al {1} y pasa a la ronda {2} de la {3}",
						[_club(club), _club(club2), _ronda_previa(ronda), copa])
				PREVIA_CAE:
					if str(f.get("comp", "")).is_empty():
						return I18n.tf("El {0} cae ante el {1} y se queda sin Europa",
							[_club(club), _club(club2)])
					if ronda == "LP":
						return I18n.tf("El {0} cae ante el {1} y baja a la fase de liga de la {2}",
							[_club(club), _club(club2), copa])
					return I18n.tf("El {0} cae ante el {1} y baja a la ronda {2} de la {3}",
						[_club(club), _club(club2), _ronda_previa(ronda), copa])
			return I18n.tf("{0} gana una plaza extra en la {1} por su temporada europea",
				[I18n.t(str(f.get("pais", ""))), copa])
		"socios":

			match int(f.get("n2", 0)):
				SOCIOS_VENDEN:
					return I18n.tf("Los socios venden el {0} a un inversor: un {1}% vota sí",
						[_club(club), n])
				SOCIOS_SIGUEN:
					return I18n.tf("Los socios del {0} no venden: un {1}% vota seguir",
						[_club(club), 100 - n])
			return I18n.tf("Los socios compran el {0}: un {1}% vota sí en la asamblea",
				[_club(club), n])
	return ""








static func _titular_salida(quien: String, club: String, motivo: int,
		cesion: bool) -> String:
	if cesion:
		if motivo == 1:
			return I18n.tf("{0} pide salir cedido para jugar más", [quien])
		if motivo == 2:
			return I18n.tf("{0} busca una cesión donde lo vean", [quien])
		if motivo == 3:
			return I18n.tf("{0} pide una cesión: no ve futuro en el {1}",
				[quien, _club(club)])
		return I18n.tf("{0} se ofrece para salir cedido", [quien])
	if motivo == 1:
		return I18n.tf("{0} pide salir del {1}: quiere jugar más",
			[quien, _club(club)])
	if motivo == 2:
		return I18n.tf("{0} pide salir del {1} y busca un club mayor",
			[quien, _club(club)])
	if motivo == 3:
		return I18n.tf("{0} no cree en el proyecto del {1} y pide salir",
			[quien, _club(club)])
	return I18n.tf("{0} pide salir del {1}", [quien, _club(club)])




static func icono(f: Dictionary) -> String:
	return str(ICONOS.get(str(f.get("kind", "")), ""))






static func tono(f: Dictionary) -> int:
	match str(f.get("kind", "")):
		"liga", "campeones":
			return 1
		"descenso":
			return -1
		"bombazo":
			return 0
		"retiro":
			return 0
		"promesa":
			return 1
		"sorpresa":
			return 0
		"racha":
			return 1 if int(f.get("n2", 0)) > 0 else -1
		"tecnico":
			return -1 if int(f.get("n", 0)) <= 0 else 0
		"proyecto":


			return 0 if int(f.get("n", 0)) > 0 else -1
		"fairplay":
			return -1
		"uefa":
			return -1

		"naming":
			return -1

		"concurso":
			return 0 if int(f.get("n2", 0)) == CONCURSO_SALE else -1


		"socios":
			return 0 if int(f.get("n2", 0)) == SOCIOS_VENDEN else 1

		"directiva":
			return 1 if int(f.get("n", 0)) == DIRECTIVA_SUBE else -1

		"previa":
			match int(f.get("n", 0)):
				PREVIA_PASA, PREVIA_EPS:
					return 1
				PREVIA_CAE:
					return -1
			return 0
		"salida":





			return 0
		"palabra":


			return 1 if int(f.get("n", 0)) > 0 else -1
		"camiseta":
			return 1
		"pareja":

			var t: int = int(f.get("n", 0))
			return 1 if t == PAREJA_BODA or t == PAREJA_SE_VIENE else -1
		"pizarra":

			return 0
		"curva":


			return 1 if int(f.get("n", 0)) > 0 else -1
		"renueva", "precontrato":
			return 0
		"no_renueva":


			return -1
		"goleo", "asistencias", "mvp":



			return 1
	return 0







static func cifra(f: Dictionary) -> int:
	if str(f.get("kind", "")) == "bombazo":
		return int(f.get("n", 0))
	return 0
