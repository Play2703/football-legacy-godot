class_name IdoloEscenas
extends RefCounted


















const FUERA_DEL_TOPE: Array[String] = [Ceremonies.IDOLO_FICHA, Ceremonies.IDOLO_DESPEDIDA]




const EDAD_RETIRO_CREIBLE: int = 32



const FALLOS_PARA_RETIRO: int = 2



static func _hilo_de_career() -> Dictionary:
	if not (Career.idolo_escenas.get("_hilo", null) is Dictionary):
		Career.idolo_escenas["_hilo"] = {}
	return Career.idolo_escenas["_hilo"]
























static func localiza(idolo: Dictionary, temporada: int, club_pista: String = "",
		hilo: Variant = null) -> Dictionary:
	if idolo.is_empty():
		return {}
	var key: String = String(idolo.get("key", ""))
	if key.is_empty():
		return {}
	if String(idolo.get("tipo", "")) != "activo":
		var a: Dictionary = Legends.asiento_de(key)
		if a.is_empty():
			return {}
		return {"club": String(a.get("team", "")), "seat": -1,
			"p": {"name": String(a.get("name", "")), "number": int(a.get("number", 0))}}
	var h: Dictionary = hilo if hilo is Dictionary else _hilo_de_career()
	var vistos: Dictionary = {}
	for c: String in [club_pista, String(h.get("club_hoy", "")),
			String(idolo.get("club", ""))]:
		if c.is_empty() or c == Teams.FREE_ID or vistos.has(c):
			continue
		vistos[c] = true
		var r: Dictionary = _busca_en(idolo, c, temporada)
		if not r.is_empty():
			return _visto(h, r, temporada)
	var libre: Dictionary = _busca_libre(idolo, temporada)
	if not libre.is_empty():
		return _visto(h, libre, temporada)
	if int(h.get("barrido", -1)) == temporada:
		return {}
	h["barrido"] = temporada







	var ref: String = String(h.get("club_hoy", ""))
	if ref.is_empty() or ref == Teams.FREE_ID:
		ref = String(idolo.get("club", ""))
	var pais: String = "" if ref == Teams.FREE_ID else Teams.country_of(ref)
	var nat_pais: String = String(idolo.get("nat", "")) if pais.is_empty() else ""
	for t: Variant in Teams.all():
		var id: String = String((t as Dictionary).get("id", ""))
		if id.is_empty() or vistos.has(id):
			continue
		if GameState.div_of(id) != 1:
			var c_id: String = Teams.country_of(id)
			if not pais.is_empty():
				if c_id != pais:
					continue
			elif nat_pais.is_empty() or Nations.canon_id(c_id) != nat_pais:
				continue
		var r2: Dictionary = _busca_en(idolo, id, temporada)
		if not r2.is_empty():
			return _visto(h, r2, temporada)
	h["perdido"] = temporada
	return {}



static func _visto(h: Dictionary, r: Dictionary, temporada: int) -> Dictionary:
	h["club_hoy"] = String(r.get("club", ""))
	h["ultima_vista"] = temporada
	h.erase("perdido")
	h["fallos"] = 0
	return r



static func _edad_esperada(idolo: Dictionary, temporada: int) -> int:
	if not idolo.has("age"):
		return -1
	return int(idolo["age"]) + maxi(0, temporada - int(idolo.get("season", temporada)))



static func _busca_en(idolo: Dictionary, club: String, temporada: int) -> Dictionary:
	var key: String = String(idolo.get("key", ""))



	var crudo: String = String(idolo.get("crudo", ""))
	var squad: Array = Squad.of(club)
	var cands: Array = []
	for i in squad.size():
		var p: Dictionary = squad[i]
		var nombre: String = String(p.get("name", ""))
		if (nombre == crudo) if not crudo.is_empty() \
				else (Competitions.demarca(nombre) == key):
			cands.append(i)
	if cands.is_empty():
		return {}



	var nat: String = String(idolo.get("nat", ""))
	var edad: int = _edad_esperada(idolo, temporada)
	var elegido: int = -1
	var mejor_d: int = 99
	for i: int in cands:
		var p2: Dictionary = squad[i]
		if not nat.is_empty() and Nations.canon_id(String(p2.get("nat", ""))) != nat:
			continue
		var d: int = 0
		if edad > 0:
			d = absi(WorldAging.seat_age(club, Squad.home_seat(squad, i),
				String(p2.get("pos", "MC"))) - edad)
			if d > 1:
				continue
		if d < mejor_d:
			mejor_d = d
			elegido = i
	if elegido < 0:
		return {}
	return {"club": club, "p":(squad[elegido] as Dictionary).duplicate(), "seat": elegido}




static func _busca_libre(idolo: Dictionary, temporada: int) -> Dictionary:
	var key: String = String(idolo.get("key", ""))


	var crudo: String = String(idolo.get("crudo", ""))
	for f: Variant in Career.free_agents:
		if not (f is Dictionary):
			continue
		var ident: Dictionary = AiMarket._free_identity(f, temporada)
		var nom: String = String(ident.get("name", ""))
		if (nom != crudo) if not crudo.is_empty() else (Competitions.demarca(nom) != key):
			continue
		var nat: String = String(idolo.get("nat", ""))
		if not nat.is_empty() and Nations.canon_id(String(ident.get("nation", ""))) != nat:
			continue
		return {"club": Teams.FREE_ID, "seat": -1,
			"p": {"name": String(ident.get("name", "")), "number": 0,
				"pos": String((f as Dictionary).get("pos", idolo.get("pos", "MC"))),
				"nat": String(ident.get("nation", ""))}}
	return {}












static func retiro_creible(idolo: Dictionary, temporada: int, hilo: Variant = null) -> bool:
	if idolo.is_empty() or String(idolo.get("tipo", "")) != "activo":
		return false
	var h: Dictionary = hilo if hilo is Dictionary else _hilo_de_career()
	if bool(h.get("retirado", false)):
		return false
	if not localiza(idolo, temporada, "", h).is_empty():
		return false
	var edad: int = _edad_esperada(idolo, temporada)
	var en_edad: bool = edad >= EDAD_RETIRO_CREIBLE
	if idolo.has("retiro_prev") and temporada >= int(idolo["retiro_prev"]):
		en_edad = true
	if en_edad:
		return true

	if int(h.get("fallo_temp", -1)) != temporada:
		h["fallo_temp"] = temporada
		h["fallos"] = int(h.get("fallos", 0)) + 1
	if int(h.get("fallos", 0)) >= FALLOS_PARA_RETIRO:
		h["retirado"] = true
		h["retirado_sin_escena"] = temporada
	return false







static var _entradas: Dictionary = {}
static func entrada_de(key: String) -> Dictionary:
	if key.is_empty():
		return {}
	if _entradas.has(key):
		return _entradas[key]
	for e: Variant in Legends._pool():
		if e is Dictionary and Legends.key_of(e) == key:
			_entradas[key] = e
			return e
	return {}




static func club_de_leyenda(key: String) -> String:
	var clubs: Variant = entrada_de(key).get("clubs", {})
	if not (clubs is Dictionary):
		return ""
	var mejor: String = ""
	var mejor_n: int = -1
	var ids: Array =(clubs as Dictionary).keys()
	ids.sort()
	for cid: Variant in ids:
		var n: int = 0
		var t: Variant =(clubs as Dictionary)[cid]
		if t is Array:
			for x: Variant in t:
				n += int(x)
		if n > mejor_n:
			mejor_n = n
			mejor = String(cid)
	return mejor













static func dorsal_historico(key: String, club: String, hilo: Variant = null) -> int:
	var h: Dictionary = hilo if hilo is Dictionary else _hilo_de_career()
	if not (h.get("dorsales", null) is Dictionary):
		h["dorsales"] = {}
	var memo: Dictionary = h["dorsales"]
	var clave: String = key + "|" + club
	if memo.has(clave):
		return int(memo[clave])
	var escalera: Array[int] = ShirtNumber.LADDER
	var tuya: Dictionary = Career.retired_shirt()
	var retirado: int = int(tuya.get("number", 0)) \
			if String(tuya.get("club", "")) == club else 0
	var i0: int = absi(hash("idolo_dorsal|" + key + "|" + club)) % escalera.size()
	var n: int = escalera[i0]
	for k in escalera.size():
		n = escalera[(i0 + k) % escalera.size()]
		if n != retirado:
			break
	memo[clave] = n
	return n














static func balon_toca(idolo: Dictionary, gala: Dictionary, temporada: int,
		escenas: Dictionary, libre: bool, retirado: bool) -> bool:
	if idolo.is_empty() or String(idolo.get("tipo", "")) == "activo" or not retirado:
		return false
	if not libre or escenas.has(Ceremonies.IDOLO_BALON):
		return false
	if temporada <= int(idolo.get("season", temporada)):
		return false
	var podio: Variant = gala.get("podium", [])
	if not (podio is Array) or (podio as Array).is_empty() \
			or not ((podio as Array)[0] is Dictionary):
		return false
	return bool(((podio as Array)[0] as Dictionary).get("you", false))




static func frase_balon(balones: int) -> String:
	if balones <= 0:
		return "Nunca lo gané. Verlo en tus manos es casi lo mismo."
	if balones == 1:
		return "Yo también lo levanté una vez. Ahora es tuyo."
	return "Lo levanté {0} veces. Ninguna pesó como ésta."





static func payload_balon(acto: Dictionary) -> Dictionary:
	var key: String = String(acto.get("key", ""))
	return {"nombre": String(acto.get("nombre", key)), "cara": String(acto.get("cara", key)),
		"balones": int(entrada_de(key).get("balon", 0))}






const FAN_ANIOS: int = 3



const FAN_MOTM: int = 4


const FAN_PRENSA: int = 60


const FAN_REPARTO: Dictionary = {
	"a": {"aficion": 6, "prensa": -3},
	"b": {"prensa": 6, "aficion": -6},
}













static func fan_toca(idolo: Dictionary, temporada: int, div: int, prensa: int, motm: int,
		escenas: Dictionary, libre: bool, cola: Array) -> bool:
	if idolo.is_empty() or div != 1 or not libre:
		return false
	if escenas.has(Ceremonies.IDOLO_FAN) or not idolo.has("motm0"):
		return false
	if temporada - int(idolo.get("season", temporada)) < FAN_ANIOS:
		return false
	if motm - int(idolo["motm0"]) < FAN_MOTM or prensa < FAN_PRENSA:
		return false
	for c: Variant in cola:
		var k: String = String((c as Dictionary).get("kind", "")) if c is Dictionary else ""
		if k in [Ceremonies.PRESSER, Ceremonies.PRE_PRESSER, Ceremonies.MVP] \
				or k.begins_with("idolo_"):
			return false
	return true






static func payload_fan(idolo: Dictionary, temporada: int, motm: int, avg: float) -> Dictionary:
	var dicho: int = int(idolo.get("season", temporada))
	var p: Dictionary = {"mode": Ceremonies.IDOLO_FAN, "tipo": String(idolo.get("tipo", "")),
		"pintado": String(idolo.get("name", "")), "nat": String(idolo.get("nat", "")),
		"dicho": dicho, "anios": temporada - dicho,
		"motm": motm - int(idolo.get("motm0", 0)), "avg": avg}
	if String(idolo.get("tipo", "")) == "activo":
		p["pos"] = String(idolo.get("pos", ""))
		p["ovr"] = int(idolo.get("ovr", 0))
	return p





static func fan_reparto(key: String, rel: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	var pide: Dictionary = FAN_REPARTO.get(key, {})
	for k: String in pide:
		var v: int = int(rel.get(k, 0))
		var d: int = int(pide[k])
		var real: int = mini(d, 100 - v) if d > 0 else - mini(- d, v)
		if real != 0:
			out[k] = real
	return out







const CONOCE_ANIOS: int = 2


const CONOCE_MINUTOS: int = 60


const EN_PERSONA: Array[String] = [Ceremonies.IDOLO_BALON, Ceremonies.IDOLO_CONOCE,
	Ceremonies.IDOLO_FESTEJO, Ceremonies.IDOLO_CONSEJO, Ceremonies.IDOLO_CAMISETA]



const CONOCE_FRASES: Dictionary = {
	"final_ganada": "Te vi levantarla. Yo también temblaba la primera vez.",
	"final_perdida": "Hoy duele. Guárdalo: la próxima vez te toca a ti.",
	"derbi": "Esta casa también fue la mía. Gracias por cuidarla.",
	"derbi_perdido": "Esta grada no olvida, y yo tampoco. Sigue.",
}


















static func conoce_variante(idolo: Dictionary, temporada: int, escenas: Dictionary,
		libre: bool, retirado: bool, partido: Dictionary, cola: Array) -> String:
	if idolo.is_empty() or String(idolo.get("tipo", "")) == "activo" or not retirado:
		return ""
	if not libre or temporada - int(idolo.get("season", temporada)) < CONOCE_ANIOS:
		return ""
	for k: String in EN_PERSONA:
		if escenas.has(k):
			return ""
	if int(partido.get("div", 0)) != 1 or String(partido.get("comp", "")) == "nat" \
			or int(partido.get("minutos", 0)) < CONOCE_MINUTOS:
		return ""
	for c: Variant in cola:
		var k: String = String((c as Dictionary).get("kind", "")) if c is Dictionary else ""
		if k in [Ceremonies.LEGEND, Ceremonies.KEEPSAKE] or k.begins_with("idolo_"):
			return ""
	if bool(partido.get("final", false)) and not bool(partido.get("supercopa", false)):
		if bool(partido.get("ganada", false)):
			return "final_ganada"
		if bool(partido.get("perdida", false)):
			return "final_perdida"
		return ""
	var sus: Variant = partido.get("sus_clubs", [])
	if bool(partido.get("derbi", false)) and bool(partido.get("casa", false)) \
			and sus is Array and (sus as Array).has(String(partido.get("club", ""))):
		return "derbi_perdido" if int(partido.get("result", 0)) < 0 else "derbi"
	return ""



static func clubes_de_leyenda(key: String) -> Array:
	var clubs: Variant = entrada_de(key).get("clubs", {})
	return (clubs as Dictionary).keys().map(func(c): return String(c)) \
			if clubs is Dictionary else []






static func payload_conoce(acto: Dictionary, idolo: Dictionary, temporada: int,
		variante: String, partido: Dictionary) -> Dictionary:
	var key: String = String(acto.get("key", ""))
	return {"nombre": String(acto.get("nombre", key)), "cara": String(acto.get("cara", key)),
		"variante": variante, "anios": temporada - int(idolo.get("season", temporada)),
		"gf": int(partido.get("gf", 0)), "ga": int(partido.get("ga", 0)),
		"rival": String(partido.get("rival", "")), "home": bool(partido.get("casa", true)),
		"final": variante.begins_with("final")}






const FESTEJO_ANIOS: int = 2








const FESTEJO_HOJAS: Dictionary = {
	"reverencia": {"hoja": "res://assets/sprites/anim/reverencia_south_", "cuadros": 4, "fps": 5.0},
	"reloj": {"hoja": "res://assets/sprites/anim/reloj_south_", "cuadros": 4, "fps": 5.0},
	"escudo": {"hoja": "res://assets/sprites/anim/escudo_south_", "cuadros": 4, "fps": 6.0},
	"zen": {"hoja": "res://assets/sprites/anim/zen_south_", "cuadros": 6, "fps": 4.0},
	"cielo": {"hoja": "res://assets/sprites/anim/cielo_south_", "cuadros": 4, "fps": 7.0},
	"rugido": {"hoja": "res://assets/sprites/anim/fj_rugido_south_", "cuadros": 8, "fps": 6.0},
	"oreja": {"hoja": "res://assets/sprites/anim/oreja_south_", "cuadros": 4, "fps": 7.0},
	"tresdedos": {"hoja": "res://assets/sprites/anim/tresdedos_south_", "cuadros": 4, "fps": 7.0},
}


const FESTEJO_ORDEN: Array[String] = ["reverencia", "reloj", "escudo", "zen", "cielo",
	"rugido", "oreja", "tresdedos"]

const FESTEJO_FRASES: Dictionary = {
	"leyenda": "La levanté con esta misma camiseta. Ahora mi festejo es tuyo.",
	"activo": "Me has ganado la final. Esto ya no es mío.",
}



static func festejo_de(key: String) -> String:
	return FESTEJO_ORDEN[posmod(key.hash(), FESTEJO_ORDEN.size())]



static func hoja_festejo(gesto: String) -> Dictionary:
	return FESTEJO_HOJAS.get(gesto, {})



















static func festejo_variante(idolo: Dictionary, temporada: int, escenas: Dictionary,
		libre: bool, retirado: bool, club_idolo: String, partido: Dictionary,
		cola: Array) -> String:
	if idolo.is_empty() or escenas.has(Ceremonies.IDOLO_FESTEJO) or not libre:
		return ""
	if temporada - int(idolo.get("season", temporada)) < FESTEJO_ANIOS:
		return ""
	var comp: String = String(partido.get("comp", ""))
	if int(partido.get("div", 0)) != 1 or comp == "nat" \
			or int(partido.get("minutos", 0)) < CONOCE_MINUTOS:
		return ""
	if not bool(partido.get("final", false)) or bool(partido.get("supercopa", false)) \
			or not bool(partido.get("ganada", false)):
		return ""
	for c: Variant in cola:
		var k: String = String((c as Dictionary).get("kind", "")) if c is Dictionary else ""
		if k in [Ceremonies.LEGEND, Ceremonies.KEEPSAKE] or k.begins_with("idolo_"):
			return ""
	if not retirado:
		return "activo" if not club_idolo.is_empty() \
				and club_idolo == String(partido.get("rival", "")) else ""
	if String(idolo.get("tipo", "")) == "activo":
		return ""
	var titulos: Variant =(entrada_de(String(idolo.get("key", ""))).get("clubs", {}) as Dictionary) \
			.get(String(partido.get("club", "")), [])
	var i: int = _festejo_titulo(comp)
	if i < 0 or not (titulos is Array) or (titulos as Array).size() <= i:
		return ""
	return "leyenda" if int((titulos as Array)[i]) > 0 else ""




static func _festejo_titulo(comp: String) -> int:
	if Continental.es_continental(comp):
		return 2
	if comp in ["cup", CopaLiga.COMP]:
		return 1
	if comp == "liga":
		return 0
	return -1






static func festejos_regalados() -> Array[String]:
	var out: Array[String] = []
	for g: String in FESTEJO_ORDEN:
		if Settings.celeb_desbloqueado(Celebs.id_for(Celebs.GESTO, g)):
			out.append(g)
	return out




static func festejo_estreno() -> String:
	for g: String in festejos_regalados():
		if not Settings.celeb_seen(Celebs.id_for(Celebs.GESTO, g)):
			return g
	return ""







static func payload_festejo(acto: Dictionary, idolo: Dictionary, temporada: int,
		variante: String, partido: Dictionary, dorsal: int) -> Dictionary:
	var key: String = String(acto.get("key", ""))
	var gesto: String = festejo_de(key)
	return {"nombre": String(acto.get("nombre", key)), "cara": String(acto.get("cara", key)),
		"variante": variante, "gesto": gesto,
		"nuevo": not Settings.celeb_seen(Celebs.id_for(Celebs.GESTO, gesto)),
		"anios": temporada - int(idolo.get("season", temporada)),
		"gf": int(partido.get("gf", 0)), "ga": int(partido.get("ga", 0)),
		"rival": String(partido.get("rival", "")), "home": bool(partido.get("casa", true)),
		"club_leyenda": String(partido.get("club", "")) if variante == "leyenda"
			else String(acto.get("club", "")),
		"dorsal_leyenda": dorsal}








const CONSEJO_ANIOS: int = 5











const CONSEJO_TURNOS: Array = [
	["el", "Hace {0} años dijiste en una rueda de prensa que yo era tu ídolo."],
	["tu", "Y lo sigues siendo."],
	["el", "Cuando me retiré pensé que echaría de menos las finales."],
	["el", "Pero echo de menos los martes. El autobús, el café malo, las risas del vestuario."],
	["el", "Me he pasado la vida esperando el próximo gran día. Y la felicidad estaba en todos los demás."],
	["tu", "¿Y ahora qué hago?"],
	["el", "Lo mismo que en el campo: un día cada vez. En el fútbol y en la vida, la felicidad está en cada día."],
	["el", "Por cada día."],
	["tu", "Por cada día."],
]


const CONSEJO_ACTIVO: Dictionary = {
	2: "Yo todavía juego, y ya sé lo que voy a echar de menos.",
	3: "No serán las finales. Serán los martes: el autobús, el café malo, las risas del vestuario.",
}











static func consejo_toca(idolo: Dictionary, temporada: int, escenas: Dictionary) -> bool:
	if idolo.is_empty() or escenas.has(Ceremonies.IDOLO_CONSEJO):
		return false
	return temporada - int(idolo.get("season", temporada)) >= CONSEJO_ANIOS




static func consejo_turnos(activo: bool) -> Array:
	var out: Array = []
	for i in CONSEJO_TURNOS.size():
		var fila: Array =(CONSEJO_TURNOS[i] as Array).duplicate()
		if activo and CONSEJO_ACTIVO.has(i):
			fila[1] = CONSEJO_ACTIVO[i]
		out.append(fila)
	return out






static func payload_consejo(acto: Dictionary, idolo: Dictionary, temporada: int) -> Dictionary:
	var key: String = String(acto.get("key", ""))
	return {"nombre": String(acto.get("nombre", key)), "cara": String(acto.get("cara", key)),
		"activo": not bool(acto.get("retirado", true)),
		"anios": temporada - int(idolo.get("season", temporada)),

		"club_idolo": String(acto.get("club", "")), "dorsal_idolo": int(acto.get("dorsal", 0))}







const CAMISETA_ANIOS: int = 2




const CAMISETA_MEDIA: float = 7.0
const CAMISETA_JUGADO: float = 0.5






const COMPARA_ALTA: float = 7.4
const COMPARA_BAJA: float = 6.6
const COMPARA_SUBE: int = 3
const COMPARA_CAE: int = -4














static func camiseta_toca(idolo: Dictionary, temporada: int, escenas: Dictionary,
		libre: bool, sigue_jugando: bool, club: String, tu: Dictionary, dorsal: int) -> bool:
	if idolo.is_empty() or String(idolo.get("tipo", "")) == "activo" or sigue_jugando:
		return false
	if escenas.has(Ceremonies.IDOLO_CAMISETA) or not libre:
		return false
	if temporada - int(idolo.get("season", temporada)) < CAMISETA_ANIOS:
		return false
	if club.is_empty() or not clubes_de_leyenda(String(idolo.get("key", ""))).has(club):
		return false
	if int(tu.get("div", 0)) != 1 or bool(tu.get("cedido", false)) \
			or int(tu.get("peldano", 1)) < Gerencia.PELDANO_CAPITAN:
		return false
	if float(tu.get("media", 0.0)) < CAMISETA_MEDIA \
			or float(tu.get("jugado", 0.0)) < CAMISETA_JUGADO:
		return false
	return dorsal > 0 and dorsal != int(tu.get("dorsal", 0))



static func camiseta_compara(media: float) -> int:
	if media >= COMPARA_ALTA:
		return COMPARA_SUBE
	if media < COMPARA_BAJA:
		return COMPARA_CAE
	return 0






static func payload_camiseta(acto: Dictionary, idolo: Dictionary, temporada: int,
		club: String, dorsal: int, tu: Dictionary) -> Dictionary:
	var key: String = String(acto.get("key", ""))
	var clubs: Variant = entrada_de(key).get("clubs", {})
	var t: Variant =(clubs as Dictionary).get(club, []) if clubs is Dictionary else []
	var titulos: Array = []
	for i in 3:
		titulos.append(int((t as Array)[i]) if t is Array and (t as Array).size() > i else 0)
	return {"nombre": String(acto.get("nombre", key)), "cara": String(acto.get("cara", key)),
		"club": club, "dorsal": dorsal, "mio": int(tu.get("dorsal", 0)),
		"media": float(tu.get("media", 0.0)), "titulos": titulos,
		"anios": temporada - int(idolo.get("season", temporada)), "season": temporada}








const AHIJADO_ANIOS: int = 3



const AHIJADO_GOLES: int = 2


const AHIJADO_FRASES: Dictionary = {
	"companero": "Y ahora me pasa el balón todos los fines de semana.",
	"rival": "Hoy lo tuve enfrente. Sigue siendo él.",
}












static func ahijado_toca(idolo: Dictionary, temporada: int, escenas: Dictionary, libre: bool,
		ahijado: String, figura: Dictionary, cola: Array) -> bool:
	if idolo.is_empty() or not libre or escenas.has(Ceremonies.IDOLO_AHIJADO):
		return false
	if not idolo.has("season") or temporada - int(idolo["season"]) < AHIJADO_ANIOS:
		return false
	if ahijado.is_empty() or bool(figura.get("mia", true)) \
			or String(figura.get("name", "")) != ahijado \
			or String(figura.get("club", "")).is_empty():
		return false
	if not bool(figura.get("gano", false)) and int(figura.get("goals", 0)) < AHIJADO_GOLES:
		return false
	for c: Variant in cola:
		var k: String = String((c as Dictionary).get("kind", "")) if c is Dictionary else ""
		if k in [Ceremonies.PRESSER, Ceremonies.PRE_PRESSER, Ceremonies.MVP] \
				or k.begins_with("idolo_"):
			return false
	return true







static func payload_ahijado(idolo: Dictionary, temporada: int, figura: Dictionary, comp: String,
		club_tuyo: String, tu: String, numero: int) -> Dictionary:
	var club: String = String(figura.get("club", ""))
	var dicho: int = int(idolo.get("season", temporada))
	return {"mode": Ceremonies.IDOLO_AHIJADO, "club": club, "comp": comp,
		"goals": int(figura.get("goals", 0)), "assists": int(figura.get("assists", 0)),
		"winner": {"name": String(figura.get("name", "")), "number": numero, "portero": false},
		"rama": "companero" if club == club_tuyo else "rival",
		"tu": tu, "pintado": String(idolo.get("name", "")),
		"dicho": dicho, "anios": temporada - dicho, "season": temporada}







const RIVAL_TEMPORADAS: int = 2


const RIVAL_MEDIA: float = 7.0


const RIVAL_ARRIBA: int = 4


const RIVAL_FRASES: Dictionary = {
	"rival": "Hoy no eres su aficionado. Eres su rival.",
	"fan": "Noventa minutos sin pedirle un autógrafo.",
}













static func rival_toca(idolo: Dictionary, temporada: int, escenas: Dictionary, libre: bool,
		fx: Dictionary, derbi: bool, final: bool, titular: bool, media: float, peso: bool,
		cola: Array) -> bool:
	if idolo.is_empty() or String(idolo.get("tipo", "")) != "activo":
		return false
	if not libre or escenas.has(Ceremonies.IDOLO_RIVAL) or not cola.is_empty():
		return false
	if not idolo.has("season") or temporada - int(idolo["season"]) < RIVAL_TEMPORADAS:
		return false
	if fx.is_empty() or String(fx.get("comp", "")) == "nat" \
			or String(fx.get("opp", "")).is_empty() or derbi or final:
		return false
	if not titular and media < RIVAL_MEDIA:
		return false
	return peso
















static func payload_rival(idolo: Dictionary, temporada: int, p: Dictionary, opp: String,
		casa: bool, club: String, div: int, yo: int, su_media: int,
		vs: Dictionary = {}) -> Dictionary:
	var nombre: String = String(idolo.get("name", ""))
	var dicho: int = int(idolo.get("season", temporada))
	var cara: String = String(p.get("name", ""))
	var el: Dictionary = Dictionary(vs.get("el", {}))
	return {"club": club, "div": div, "opp": opp, "home": casa,
		"cara": cara, "number": int(p.get("number", 0)),
		"pos": String(p.get("pos", "")), "nombre": nombre,
		"apellido": Espalda.apellido_de(nombre),
		"dicho": dicho, "anios": temporada - dicho, "rank": int(idolo.get("rank", 0)),
		"rama": "rival" if yo >= su_media else "fan", "season": temporada,
		"mode": "pases", "comp": String(vs.get("comp", "")),
		"pestana": String(vs.get("pestana", "")),
		"goleo": {"key": String(vs.get("key", "league")), "titular": "duelo",
			"duelo": {"team": opp, "name": cara, "g": int(el.get("g", 0)),
				"a": int(el.get("a", 0)), "avg": float(el.get("avg", 0.0)), "por": "g"}},
		"vs": {"tu": Dictionary(vs.get("tu", {})), "el": el}}










static func vs_hoy(fx: Dictionary, opp: String, p: Dictionary, asiento: int,
		su_media: int) -> Dictionary:
	var key: String = String(fx.get("comp", ""))
	var tu: Dictionary = {"ovr": Career.ovr_shown(), "pos": Career.puesto_hoy()}
	var el: Dictionary = {"ovr": su_media, "pos": String(p.get("pos", ""))}
	var tabla: Array = WorldRanking.rows(1)
	tu["rank"] = WorldRanking.rank_of_you(tabla)
	el["rank"] = rank_en(tabla, opp, asiento)
	var d: Dictionary = GoleoVivo.de(key, opp)
	if not d.is_empty():
		var suyo: Dictionary = en_carrera(GoleoVivo._carrera(key),
			String(p.get("name", "")), opp)
		if not suyo.is_empty():
			tu.merge({"g": int(d.get("g", 0)), "a": int(d.get("a", 0)),
				"avg": float(d.get("avg", 0.0)), "carrera": true}, true)
			el.merge(suyo, true)
			el["carrera"] = true
	return {"key": key if not key.is_empty() else "league",
		"comp": Competitions.id_of(fx), "pestana": HubBanner.linea_de(fx),
		"tu": tu, "el": el}




static func rank_en(tabla: Array, club: String, asiento: int) -> int:
	for i in tabla.size():
		var r: Dictionary = tabla[i] as Dictionary
		if String(r.get("club", "")) == club and int(r.get("seat", -2)) == asiento:
			return i + 1
	return 0




static func en_carrera(race: Array, cara: String, club: String) -> Dictionary:
	var up: String = cara.to_upper()
	if up.is_empty():
		return {}
	for e in race:
		var r: Dictionary = e as Dictionary
		if String(r.get("team", "")) == club and String(r.get("name", "")).to_upper() == up:
			return {"g": int(r.get("goals", 0)), "a": int(r.get("assists", 0)),
				"avg": float(r.get("avg", 6.0))}
	return {}











const DISCIPULO_ANIOS: int = 2


const DISCIPULO_DISTANCIA: int = 50


const DISCIPULO_TOP: int = 100




const DISCIPULO_HUECO: int = 2



const DISCIPULO_FRASES: Dictionary = {
	Tertulia.EXJUGADOR: "Hace {0} temporadas dijo en una rueda de prensa que su ídolo era {1}. Hoy el ranking los pone al revés.",
	Tertulia.CRITICO: "Un número no es una carrera. {1} ya tiene la suya; a {2} todavía le falta escribirla.",
	Tertulia.PERIODISTA: "Hemos hablado con {1} esta mañana. Dice que alguien tenía que pasarle algún día, y que se alegra de que haya sido {2}.",
}
const DISCIPULO_VEREDICTO: Dictionary = {
	Tertulia.EXJUGADOR: Tertulia.BIEN,
	Tertulia.CRITICO: Tertulia.NORMAL,
	Tertulia.PERIODISTA: Tertulia.BIEN,
}















static func discipulo_toca(idolo: Dictionary, temporada: int, escenas: Dictionary,
		libre: bool, div: int, comp: String, cola: Array, tertulia_vista: int) -> bool:
	if idolo.is_empty() or String(idolo.get("tipo", "")) != "activo":
		return false
	if not libre or escenas.has(Ceremonies.IDOLO_DISCIPULO) or not cola.is_empty():
		return false
	if not idolo.has("season") or temporada - int(idolo["season"]) < DISCIPULO_ANIOS:
		return false
	if div != 1 or comp == "nat" or tertulia_vista == temporada:
		return false
	if con_distancia(idolo) and distancia0(idolo) < DISCIPULO_DISTANCIA:
		return false
	return discipulo_hueco(escenas, temporada)




static func discipulo_hueco(escenas: Dictionary, temporada: int) -> bool:
	for k: String in escenas:
		if k.begins_with("_") or FUERA_DEL_TOPE.has(k):
			continue
		if int(escenas[k]) > temporada - DISCIPULO_HUECO:
			return false
	return true




static func con_distancia(idolo: Dictionary) -> bool:
	return int(idolo.get("tu_rank", 0)) > 0 and int(idolo.get("rank_con_yo", 0)) > 0




static func distancia0(idolo: Dictionary) -> int:
	if not con_distancia(idolo):
		return 0
	return int(idolo["tu_rank"]) - int(idolo["rank_con_yo"])





static func discipulo_puestos(tabla: Array, club: String, asiento: int) -> Dictionary:
	var tu: int = 0
	var el: int = 0
	for i in tabla.size():
		var r: Dictionary = tabla[i] as Dictionary
		if bool(r.get("yo", false)):
			tu = i + 1
		elif String(r.get("club", "")) == club and int(r.get("seat", -2)) == asiento:
			el = i + 1
	if tu <= 0 or el <= 0:
		return {}
	return {"tu": tu, "el": el, "tu_ovr": int((tabla[tu - 1] as Dictionary).get("ovr", 0)),
		"su_ovr": int((tabla[el - 1] as Dictionary).get("ovr", 0))}





static func discipulo_supera(puestos: Dictionary) -> bool:
	if puestos.is_empty():
		return false
	var tu: int = int(puestos.get("tu", 0))
	return tu > 0 and tu <= DISCIPULO_TOP and tu < int(puestos.get("el", 0)) \
			and int(puestos.get("tu_ovr", 0)) > int(puestos.get("su_ovr", 0))




static func panel_discipulo(anios: int, nombre: String, tu_nombre: String) -> Array:
	var out: Array = []
	for rol: String in Tertulia.TURNOS:
		out.append({"rol": rol, "veredicto": String(DISCIPULO_VEREDICTO[rol]),
			"angulo": "discipulo", "frase": String(DISCIPULO_FRASES[rol]),
			"args": [anios, nombre, tu_nombre]})
	return out









static func payload_discipulo(idolo: Dictionary, temporada: int, p: Dictionary,
		club_idolo: String, puestos: Dictionary, yo: Dictionary) -> Dictionary:
	var nombre: String = String(idolo.get("name", ""))
	var dicho: int = int(idolo.get("season", temporada))
	var anios: int = temporada - dicho
	return {"club": String(yo.get("club", "")), "div": int(yo.get("div", 1)),
		"number": int(yo.get("number", 0)), "pos": String(yo.get("pos", "")),
		"ovr": int(puestos.get("tu_ovr", 0)),
		"cara": String(p.get("name", "")), "su_number": int(p.get("number", 0)),
		"su_pos": String(p.get("pos", "")), "su_ovr": int(puestos.get("su_ovr", 0)),
		"club_idolo": club_idolo, "nombre": nombre, "apellido": Espalda.apellido_de(nombre),
		"dicho": dicho, "anios": anios,
		"tu_rank": int(puestos.get("tu", 0)), "su_rank": int(puestos.get("el", 0)),
		"tu_rank0": int(idolo.get("tu_rank", 0)), "su_rank0": int(idolo.get("rank_con_yo", 0)),
		"season": temporada, "veredicto": Tertulia.BIEN,
		"panel": panel_discipulo(anios, nombre, String(yo.get("nombre", "")))}






const FICHA_ANIOS: int = 1


const FICHA_ANIOS_PEDIDO: int = 2



const FICHA_SEMANAS: int = 4


const FICHA_FRASES: Dictionary = {
	"tu": "Llegas nuevo, y el primero que viene a darte la bienvenida es él.",
	"el": "El club lo ha fichado. Ahora entrenas cada día con el que veías por la tele.",
	"pedido": "Lo pediste tú y el club lo trajo. Ahora te toca estar a su altura.",
}











static func ficha_sigue(hilo: Dictionary, aqui: bool, club: String, pedido: bool) -> void:
	if not aqui:
		hilo["ficha_lejos"] = club
		hilo.erase("ficha_junto")
		return
	var junto: Variant = hilo.get("ficha_junto", null)
	if not (junto is Dictionary):
		if not hilo.has("ficha_lejos"):
			return
		var tu: bool = String(hilo["ficha_lejos"]) != club
		junto = {"n": 0, "rama": "tu" if tu else "el", "pedido": pedido and not tu}
		hilo.erase("ficha_lejos")
		hilo["ficha_junto"] = junto
	(junto as Dictionary)["n"] = int((junto as Dictionary).get("n", 0)) + 1









static func ficha_toca(idolo: Dictionary, temporada: int, escenas: Dictionary,
		junto: Dictionary, cola: Array) -> bool:
	if idolo.is_empty() or String(idolo.get("tipo", "")) != "activo":
		return false
	if escenas.has(Ceremonies.IDOLO_FICHA) or not cola.is_empty():
		return false
	var n: int = int(junto.get("n", 0))
	if n < 1 or n > FICHA_SEMANAS:
		return false
	var hacen: int = FICHA_ANIOS_PEDIDO if bool(junto.get("pedido", false)) else FICHA_ANIOS
	return idolo.has("season") and temporada - int(idolo["season"]) >= hacen






static func payload_ficha(idolo: Dictionary, temporada: int, p: Dictionary, club: String,
		div: int, junto: Dictionary, ovr: int) -> Dictionary:
	var dicho: int = int(idolo.get("season", temporada))
	var rama: String = "pedido" if bool(junto.get("pedido", false)) \
			else String(junto.get("rama", "el"))
	return {"club": club, "div": div, "cara": String(p.get("name", "")),
		"number": int(p.get("number", 0)), "pos": String(p.get("pos", "")), "ovr": ovr,
		"nombre": String(idolo.get("name", "")), "dicho": dicho, "anios": temporada - dicho,
		"rama": rama, "season": temporada}





static func esta_en(idolo: Dictionary, club: String, temporada: int) -> Dictionary:
	if idolo.is_empty() or club.is_empty() or String(idolo.get("tipo", "")) != "activo":
		return {}
	return _busca_en(idolo, club, temporada)






const PALCO_ANIOS: int = 2


const PALCO_GOLES: int = 2


const PALCO_FRASES: Dictionary = {
	"doblete": "Dos en mi casa. Esta grada ya tiene otro nombre que cantar.",
	"derbi": "Un gol en el derbi, en esta casa. Eso no se olvida nunca.",
}

















static func palco_variante(idolo: Dictionary, temporada: int, escenas: Dictionary,
		libre: bool, retirado: bool, partido: Dictionary, cola: Array) -> String:
	if idolo.is_empty() or String(idolo.get("tipo", "")) == "activo" or not retirado:
		return ""
	if not libre or escenas.has(Ceremonies.IDOLO_PALCO) \
			or temporada - int(idolo.get("season", temporada)) < PALCO_ANIOS:
		return ""
	if int(partido.get("div", 0)) != 1 or String(partido.get("comp", "")) == "nat" \
			or int(partido.get("minutos", 0)) < CONOCE_MINUTOS \
			or int(partido.get("result", 0)) <= 0 or not bool(partido.get("casa", false)):
		return ""
	var sus: Variant = partido.get("sus_clubs", [])
	if not (sus is Array) or not (sus as Array).has(String(partido.get("club", ""))):
		return ""
	for c: Variant in cola:
		var k: String = String((c as Dictionary).get("kind", "")) if c is Dictionary else ""
		if k in [Ceremonies.LEGEND, Ceremonies.KEEPSAKE] or k.begins_with("idolo_"):
			return ""
	var goles: int = int(partido.get("goles", 0))
	if bool(partido.get("derbi", false)) and goles >= 1:
		return "derbi"
	if goles >= PALCO_GOLES:
		return "doblete"
	return ""




static func payload_palco(acto: Dictionary, idolo: Dictionary, temporada: int,
		variante: String, partido: Dictionary) -> Dictionary:
	var key: String = String(acto.get("key", ""))
	return {"nombre": String(acto.get("nombre", key)), "cara": String(acto.get("cara", key)),
		"variante": variante, "anios": temporada - int(idolo.get("season", temporada)),
		"goles": int(partido.get("goles", 0)), "gf": int(partido.get("gf", 0)),
		"ga": int(partido.get("ga", 0)), "rival": String(partido.get("rival", ""))}










const DESPEDIDA_ANIOS: int = 2


const DESPEDIDA_FRASES: Dictionary = {
	"ficha": "Compartisteis vestuario. Hoy le aplaudes desde la grada.",
	"rival": "Te tocó enfrentarte a él. Hoy te tocó despedirlo.",


	"estrella": "Él tampoco lo olvidó: tu nombre estaba en su lista de invitados.",
}








static func despedida_rama(escenas: Dictionary, estrella: bool) -> String:
	if escenas.has(Ceremonies.IDOLO_FICHA):
		return "ficha"
	if escenas.has(Ceremonies.IDOLO_RIVAL):
		return "rival"
	return "estrella" if estrella else ""








static func despedida_apunta(hilo: Dictionary, donde: Dictionary, div: int,
		temporada: int) -> void:
	var club: String = String(donde.get("club", ""))
	var p: Variant = donde.get("p", null)
	if club.is_empty() or club == Teams.FREE_ID or not (p is Dictionary) \
			or String((p as Dictionary).get("name", "")).is_empty():
		hilo.erase("despedida_previa")
		return
	hilo["despedida_previa"] = {"club": club, "div": div, "season": temporada,
		"name": String((p as Dictionary).get("name", "")),
		"number": int((p as Dictionary).get("number", 0))}















static func despedida_toca(idolo: Dictionary, temporada: int, escenas: Dictionary,
		rama: String, div: int, previa: Dictionary, te_retiras: bool) -> bool:
	if idolo.is_empty() or String(idolo.get("tipo", "")) != "activo":
		return false
	if escenas.has(Ceremonies.IDOLO_DESPEDIDA) or rama.is_empty() or te_retiras:
		return false
	if not idolo.has("season") or temporada - int(idolo["season"]) < DESPEDIDA_ANIOS:
		return false
	if int(previa.get("season", -1)) != temporada or String(previa.get("club", "")).is_empty():
		return false
	return div == 1 and int(previa.get("div", 0)) == 1







static func payload_despedida(idolo: Dictionary, temporada: int, previa: Dictionary,
		rama: String) -> Dictionary:
	var nombre: String = String(idolo.get("name", ""))
	var dicho: int = int(idolo.get("season", temporada))
	return {"club": String(previa.get("club", "")), "div": 1,
		"cara": String(previa.get("name", "")), "number": int(previa.get("number", 0)),
		"nombre": nombre, "apellido": Espalda.apellido_de(nombre), "dicho": dicho,
		"anios": temporada - dicho, "rama": rama, "season": temporada}
