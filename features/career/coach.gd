class_name Coach
extends RefCounted




































const CHARACTERS: Array = [
	{"id": "padrino", "rel": 74, "w": 12,
		"label": "TE QUERÍA A TI",
		"desc": "Pidió tu nombre antes de firmar. Vienes de serie en su plan."},
	{"id": "continuista", "rel": 58, "w": 22,
		"label": "NO TOCA LO QUE FUNCIONA",
		"desc": "Ha visto los vídeos y no piensa cambiar lo que ya andaba."},
	{"id": "neutral", "rel": 46, "w": 30,
		"label": "EMPEZAMOS DE CERO",
		"desc": "No te conoce de nada. Todo el mundo parte del mismo sitio."},
	{"id": "exigente", "rel": 34, "w": 24,
		"label": "TE LO VAS A GANAR",
		"desc": "Dice que aquí no hay intocables, y te mira a ti al decirlo."},
	{"id": "descarte", "rel": 18, "w": 12,
		"label": "NO CUENTA CONTIGO",
		"desc": "Tiene otro plan, y en su pizarra tu nombre no aparece."},
]


static func character_of(id: String) -> Dictionary:
	for c in CHARACTERS:
		if String(c["id"]) == id:
			return c
	return CHARACTERS[2]









static func character_for_rel(rel_val: int) -> String:
	var best: String = "neutral"
	var bd: int = 1<<30
	for c in CHARACTERS:
		var d: int = absi(int(c["rel"]) - rel_val)
		if d < bd:
			bd = d
			best = String(c["id"])
	return best















const TIER_TILT: float = 0.85










const SIN_DESCARTE_DESDE: float = 0.75
const DESCARTE: String = "descarte"





static func caracter_a_tu_nivel(id: String, tier: float) -> String:
	if id == DESCARTE and tier >= SIN_DESCARTE_DESDE:
		return "exigente"
	return id








static func roll_character(roll: float = -1.0, tier: float = 0.5) -> String:
	var t: float = clampf(tier, 0.0, 1.0)

	var lean: float =(t - 0.5) * 2.0
	var pesos: Array[float] = []
	var total: float = 0.0
	for i in CHARACTERS.size():
		var c: Dictionary = CHARACTERS[i]



		var lo: int = int(CHARACTERS[CHARACTERS.size() - 1]["rel"])
		var hi: int = int(CHARACTERS[0]["rel"])
		var pos: float = 0.0 if hi == lo else \
				(float(int(c["rel"]) - lo) / float(hi - lo) - 0.5) * 2.0

		var w: float = float(int(c["w"])) * maxf(0.0, 1.0 + lean * pos * TIER_TILT)


		if caracter_a_tu_nivel(String(c["id"]), t) != String(c["id"]):
			w = 0.0
		pesos.append(w)
		total += w
	if total <= 0.0:
		return String(CHARACTERS[2]["id"])
	var r: float = randf() if roll < 0.0 else clampf(roll, 0.0, 0.999)
	var acc: float = 0.0
	for i in CHARACTERS.size():
		acc += pesos[i] / total
		if r < acc:
			return String(CHARACTERS[i]["id"])
	return String(CHARACTERS[CHARACTERS.size() - 1]["id"])












static func name_of(club_id: String, term: int, country: String) -> String:
	if club_id.is_empty():
		return ""


	if es_nat(club_id):
		return nat_name_of(pais_nat(club_id), term)


	return Squad.person_name(country, hash("coach|%s|%d" % [club_id, term]))





















































const IDEAS: Array = [
	{"id": "directo", "w": 18, "rota": 1.0, "edad": 0.0, "forma": "4-4-2",
		"label": "BALÓN AL ÁREA",
		"desc": "No quiere elaborar: quiere el balón arriba y gente rematando."},
	{"id": "toque", "w": 18, "rota": 0.92, "edad": 0.35, "forma": "4-3-3",
		"label": "TOQUE Y PACIENCIA",
		"desc": "Prefiere diez pases a un balonazo. Aquí se juega con la cabeza."},
	{"id": "intensidad", "w": 15, "rota": 1.22, "edad": -0.85, "forma": "3-5-2",
		"label": "PRESIÓN ALTA",
		"desc": "Noventa minutos corriendo. El que no llega, descansa."},
	{"id": "oficio", "w": 15, "rota": 0.78, "edad": 0.85, "forma": "4-5-1",
		"label": "OFICIO",
		"desc": "Once fijo y partido controlado. Aquí mandan los que ya saben."},
	{"id": "equilibrio", "w": 12, "rota": 0.95, "edad": 0.2, "forma": "4-2-3-1",
		"label": "DOBLE PIVOTE",
		"desc": "Dos que barren, uno que piensa y uno arriba. Primero, no perder."},
	{"id": "vertigo", "w": 11, "rota": 1.1, "edad": -0.45, "forma": "3-4-3",
		"label": "ATAQUE TOTAL",
		"desc": "Tres atrás y tres arriba. Si nos meten dos, metemos tres."},
	{"id": "autobus", "w": 11, "rota": 0.85, "edad": 0.55, "forma": "5-3-2",
		"label": "AUTOBÚS",
		"desc": "Cinco atrás y a la contra. Un 1-0 es una goleada."},
]


static func idea_of(id: String) -> Dictionary:
	for i in IDEAS:
		if String(i["id"]) == id:
			return i
	return IDEAS[0]







static func roll_idea(roll: float = -1.0) -> String:
	var total: float = 0.0
	for i in IDEAS:
		total += float(int(i["w"]))
	if total <= 0.0:
		return String(IDEAS[0]["id"])
	var r: float = randf() if roll < 0.0 else clampf(roll, 0.0, 0.999)
	var acc: float = 0.0
	for i in IDEAS:
		acc += float(int(i["w"])) / total
		if r < acc:
			return String(i["id"])
	return String(IDEAS[IDEAS.size() - 1]["id"])






















const RASGO_BUENO_P: float = 0.6
const RASGOS: Array = [
	{"id": "balon_parado", "bueno": true,
		"label": "ESPECIALISTA A BALÓN PARADO",
		"desc": "Ensaya el balón parado: si eres el lanzador, te llegan muchas más faltas, córners y penales."},
	{"id": "corners", "bueno": true,
		"label": "EL CÓRNER ES UN PENAL",
		"desc": "Ensaya el córner: si eres el lanzador, sacas casi el doble de córners y tiras menos faltas."},
	{"id": "contras", "bueno": true,
		"label": "CONTRAGOLPE",
		"desc": "Cede el balón y sale a la carrera: más contras y menos posesión."},
	{"id": "centros", "bueno": true,
		"label": "AL ÁREA, SIEMPRE",
		"desc": "Todo por las bandas: llueven centros al área y hay menos disparos desde fuera."},
	{"id": "mano_a_mano", "bueno": true,
		"label": "JUEGO DE ESPACIOS",
		"desc": "Busca el pase al hueco: más mano a mano con el portero."},
	{"id": "tiro_lejano", "bueno": true,
		"label": "PEGA DESDE FUERA",
		"desc": "Pide el disparo desde fuera del área: más tiros lejanos."},
	{"id": "cerrojo", "bueno": true,
		"label": "CERROJO",
		"desc": "Con ventaja cierra el partido: el rival casi no remonta desde el 75'."},
	{"id": "fergie", "bueno": true,
		"label": "FERGIE TIME",
		"desc": "Sus equipos no se rinden: más goles propios en el descuento."},
	{"id": "penales", "bueno": true,
		"label": "EL ÁREA ES UN CAMPO DE MINAS",
		"desc": "Juega por dentro y lo derriban: el doble de penales a favor."},
	{"id": "cantera", "bueno": true,
		"label": "CONFÍA EN EL CHAVAL",
		"desc": "Apuesta por los jóvenes: hasta los 23 juegas más y antes eres titular."},
	{"id": "posesion", "bueno": true,
		"label": "EL BALÓN ES NUESTRO",
		"desc": "Con el balón el rival no llega: encaja menos, pero el partido va más lento."},
	{"id": "arranque", "bueno": true,
		"label": "SALE A MORDER",
		"desc": "Empieza a mil: la primera media hora es de tu equipo, ida y vuelta."},
	{"id": "claras", "bueno": true,
		"label": "POCAS PERO CLARAS",
		"desc": "Menos ocasiones y mejores: llegan más cerca de la portería, y fallarlas cuesta el doble."},
	{"id": "derbis", "bueno": true,
		"label": "HOMBRE DE DERBIS",
		"desc": "Se crece en los derbis: más juego y una ocasión más contra el rival de siempre."},
	{"id": "fisio", "bueno": true,
		"label": "CUIDA LAS PIERNAS",
		"desc": "Menos lesiones y mejor descanso, a cambio de rotarte más."},
	{"id": "loco", "bueno": false,
		"label": "EL LOCO",
		"desc": "Ida y vuelta sin freno: más energía por partido y más lesiones."},
	{"id": "calienta_banquillos", "bueno": false,
		"label": "NO TE FÍAS DEL CHAVAL",
		"desc": "No se fía de los jóvenes: hasta los 23 te cuesta más el puesto."},
	{"id": "griton", "bueno": false,
		"label": "BRONCA POR TODO",
		"desc": "Bronca por todo: cada mal partido te pesa el doble con él."},
	{"id": "carrusel", "bueno": false,
		"label": "CARRUSEL",
		"desc": "Rota sin parar: te sienta aunque llegues fresco."},
	{"id": "avaro", "bueno": false,
		"label": "NO SUELTA UN DURO",
		"desc": "Manda en los fichajes y no suelta un duro: las mejoras de contrato cuestan más."},
	{"id": "supersticioso", "bueno": false,
		"label": "ONCE DE LA SUERTE",
		"desc": "Si el once ganó, repite: para entrar hay que esperar a que pierda."},
	{"id": "tarjetero", "bueno": false,
		"label": "VE ROJAS DONDE NO LAS HAY",
		"desc": "Sus equipos ven más rojas: jugarás con diez más veces."},
	{"id": "visitante_flojo", "bueno": false,
		"label": "FUERA DE CASA SE ENCOGE",
		"desc": "Fuera de casa se encoge: el rival aprieta más en su campo."},
	{"id": "favoritismo", "bueno": false,
		"label": "SU OJITO DERECHO",
		"desc": "Tiene favoritos: hasta que te lo ganes, otro juega en tu sitio."},
	{"id": "ida_y_vuelta", "bueno": false,
		"label": "PARTIDOS LOCOS",
		"desc": "Sus partidos son locos: goleadas en las dos porterías."},
	{"id": "se_despierta_tarde", "bueno": false,
		"label": "DESPIERTA AL DESCANSO",
		"desc": "Sale dormido: nada antes del 25', y el rival manda la primera parte."},
	{"id": "once_de_hierro", "bueno": false,
		"label": "ONCE DE HIERRO",
		"desc": "Casi no rota: repite el once mientras aguanten las piernas; el que no juega, espera."},
	{"id": "culpa_tuya", "bueno": false,
		"label": "LA CULPA ES TUYA",
		"desc": "Tras perder, la culpa es tuya: afición y prensa te lo cobran el doble."},






	{"id": "revolucion", "bueno": true, "tanda": 2,
		"label": "REVOLUCIÓN",
		"desc": "Llega y manda: lleva al equipo a su dibujo el doble de rápido."},
	{"id": "paciente", "bueno": false, "tanda": 2,
		"label": "LO QUE FUNCIONA NO SE TOCA",
		"desc": "Respeta lo heredado: tarda el doble en llevar al equipo a su dibujo."},
]






































const RASGO_PARTIDO: Dictionary = {





	"centros": {"servicio": 1.6, "dieta": [[2, 5, 3], [1, 5, 2]]},






	"balon_parado": {"parado": [10, 8, 3, 3, 3]},






	"corners": {"parado": [3, 9, 2, 2, 1]},

	"penales": {"parado": [5, 5, 4, 1, 2]},

	"contras": {"dieta": [[1, 4, 3], [5, 4, 2]]},
	"mano_a_mano": {"dieta": [[1, 0, 2], [3, 0, 2]]},
	"tiro_lejano": {"dieta": [[5, 2, 3], [0, 2, 2]]},


	"claras": {"ocasiones": -1, "dieta": [[2, 0, 2], [1, 3, 2]], "fallo": 2.0},

	"posesion": {"tramos": [[0, 999, 1.0, 0.85, 0]], "dieta": [[0, 1, 2]]},

	"arranque": {"tramos": [[0, 30, 1.3, 1.15, 0]]},

	"cerrojo": {"tramos": [[75, 999, 1.0, 0.68, 1]]},

	"fergie": {"tramos": [[85, 999, 1.35, 1.0, 2]]},
	"derbis": {"solo": "derbi", "ocasiones": 1, "tramos": [[0, 999, 1.2, 1.0, 0]]},
	"tarjetero": {"rojas": 1.5},
	"visitante_flojo": {"solo": "fuera", "tramos": [[0, 999, 1.0, 1.25, 0]]},
	"ida_y_vuelta": {"ocasiones": 1, "tramos": [[0, 999, 1.25, 1.25, 0]]},


	"se_despierta_tarde": {"primera": 25,
		"tramos": [[0, 25, 0.0, 1.0, 0], [0, 45, 1.0, 1.2, 0]]},
}





































const RASGO_CARRERA: Dictionary = {



	"fisio": {"lesion": 0.85, "repone": 1.15, "rota": 1.15},

	"loco": {"gasto": 1.1, "lesion": 1.05},





	"carrusel": {"rota": 1.3, "rota_min": 75.0},




	"once_de_hierro": {"rota": 0.5, "puerta": 1.0},



	"cantera": {"joven": 12.0},

	"calienta_banquillos": {"joven": -12.0},

	"favoritismo": {"favorito": -12.0},

	"griton": {"bronca": 2.0},

	"culpa_tuya": {"culpa": 2.0},

	"avaro": {"oferta": 0.92},

	"supersticioso": {"repite": 1.0},




	"revolucion": {"pizarra": 2.0},
	"paciente": {"pizarra": 0.5},
}


const RASGO_SUMA: Array[String] = ["joven", "favorito", "puerta", "repite"]



const RASGO_TOPE: Array[String] = ["rota_min"]



const FAVORITO_REL: int = 70





static func efecto_carrera(rasgos: Array, clave: String) -> float:
	var suma: bool = RASGO_SUMA.has(clave)
	var tope: bool = RASGO_TOPE.has(clave)
	var v: float = 0.0 if (suma or tope) else 1.0
	for r in rasgos:
		var e: Dictionary = RASGO_CARRERA.get(String(r), {})
		if e.has(clave):
			if tope:
				v = maxf(v, float(e[clave]))
			elif suma:
				v += float(e[clave])
			else:
				v *= float(e[clave])
	return v









static func aplica_en_seleccion(id: String) -> bool:
	return RASGO_PARTIDO.has(id)





const SOLO_CLUB_PARTIDO: Array[String] = ["fallo"]

static func clave_vale_en_seleccion(k: String) -> bool:
	if SOLO_CLUB_PARTIDO.has(k):
		return false
	for r in RASGO_CARRERA:
		if (RASGO_CARRERA[r] as Dictionary).has(k):
			return false
	return true




static func rasgo_of(id: String) -> Dictionary:
	for r in RASGOS:
		if String(r["id"]) == id:
			return r
	return {}


static func rasgos_de_signo(bueno: bool) -> Array:
	return RASGOS.filter(func(r): return bool(r["bueno"]) == bueno)














static func roll_rasgos(rng: RandomNumberGenerator) -> Array[String]:
	var out: Array[String] = []
	var pool: Array = rasgos_de_signo(rng.randf() < RASGO_BUENO_P)
	var viejos: Array = pool.filter(func(r): return not (r as Dictionary).has("tanda"))
	var nuevos: Array = pool.filter(func(r): return (r as Dictionary).has("tanda"))
	if viejos.is_empty():
		viejos = nuevos
		nuevos = []
	if viejos.is_empty():
		return out
	var r: Dictionary = viejos[rng.randi_range(0, viejos.size() - 1)]
	if not nuevos.is_empty() and rng.randf() < float(nuevos.size()) / float(pool.size()):
		r = nuevos[rng.randi_range(0, nuevos.size() - 1)]
	out.append(String(r["id"]))
	return out









const JOVEN_HASTA: int = 23
const VETERANO_DESDE: int = 31


static func age01(edad: int) -> float:
	if VETERANO_DESDE <= JOVEN_HASTA:
		return 0.5
	return clampf(float(edad - JOVEN_HASTA)
		/ float(VETERANO_DESDE - JOVEN_HASTA), 0.0, 1.0)





















const AFIN_SPAN: float = 0.22


static func encaje_edad(idea_id: String, edad: int) -> float:



	var yo: float =(age01(edad) - 0.5) * 2.0
	return clampf(float(idea_of(idea_id)["edad"]) * yo, -1.0, 1.0)














const LECTURA_SPAN: float = 0.55
const LECTURA_MIN: float = 0.09
const LECTURA_MAX: float = 0.35


static func span_de(niv: int) -> float:
	return clampf(AFIN_SPAN *(1.0 + n01(niv) * LECTURA_SPAN), LECTURA_MIN, LECTURA_MAX)



static func afinidad_mult(idea_id: String, edad: int, sube: bool,
		niv: int = NIV_REF) -> float:
	var e: float = encaje_edad(idea_id, edad)

	return maxf(0.0, 1.0 +(e if sube else - e) * span_de(niv))
















static func rest_energy(idea_id: String, base: float, suelo: float,
		extra: float = 1.0, piso: float = 0.0) -> float:
	return maxf(maxf(suelo + 1.0, piso), base * float(idea_of(idea_id)["rota"]) * extra)









const GRACE_MATCHES: int = 5




const BAD_RUN: int = 4


const RUN_STEP: float = 0.16





const GAP_STEP: float = 0.055





const MAX_PRESSURE: float = 0.72


























const PUERTA_BUENO: int = 8
const PUERTA_MALO: int = 3


static func puerta_ajuste(niv: int) -> int:
	if niv >= PUERTA_BUENO:
		return -1

	if niv <= PUERTA_MALO and niv > NIV_MIN:
		return 1
	return 0


const FIRE_GATE: float = 0.3




















































const GRACIA_SPAN: int = 6


static func gracia_de(niv: int) -> int:
	return maxi(1, GRACE_MATCHES + int(round(n01(niv) * float(GRACIA_SPAN))))
























const VENTANA_MIN: int = 5
const VENTANA_FIN: int = 4
































static func cumpliendo(ctx: Dictionary) -> bool:
	var pos: int = int(ctx.get("pos", 0))


	var expected: int = int(ctx.get("expected_club", ctx.get("expected", 0)))
	if pos <= 0 or expected <= 0:
		return false


	if bool(ctx.get("zona_roja", ctx.get("relegating", false))):
		return false
	return pos <= expected


static func fire_pressure(ctx: Dictionary) -> float:


	var jornada: int = int(ctx.get("jornada", 0))
	var jornadas: int = int(ctx.get("jornadas", 0))
	if jornada > 0 and jornadas > 0 \
			and (jornada < VENTANA_MIN or jornada > jornadas - VENTANA_FIN):
		return 0.0


	if int(ctx.get("matches", 0)) < int(ctx.get("gracia", GRACE_MATCHES)):
		return 0.0



	if cumpliendo(ctx):
		return 0.0
	var p: float = 0.0
	var winless: int = int(ctx.get("winless", 0))
	if winless > BAD_RUN:
		p += float(winless - BAD_RUN) * RUN_STEP
	var pos: int = int(ctx.get("pos", 0))
	var expected: int = int(ctx.get("expected", 0))
	if pos > 0 and expected > 0 and pos > expected:
		p += float(pos - expected) * GAP_STEP



	if bool(ctx.get("relegating", false)):
		p += 0.22



	if p < FIRE_GATE:
		return 0.0
	return minf(p, MAX_PRESSURE)




static func should_fire(pressure: float, roll: float = -1.0) -> bool:
	if pressure <= 0.0:
		return false
	var r: float = randf() if roll < 0.0 else roll
	return r < pressure



















const AGUANTE_SPAN: float = 0.5


static func aguante(niv: int) -> float:
	return 1.0 - n01(niv) * AGUANTE_SPAN










static func arraigo(niv: int) -> int:
	return 2 +(1 if niv >= 6 else 0) +(1 if niv >= 9 else 0)



























const INV_RECIEN: float = 0.5
const INV_MAX: float = 0.85


static func p_invierno(ctx: Dictionary, niv: int, recien: bool) -> float:
	var c: Dictionary = ctx.duplicate()
	c.erase("jornada")
	c.erase("jornadas")
	if c.has("expected_club"):
		c["expected"] = c["expected_club"]
	var p: float = fire_pressure(c)
	if p <= 0.0:
		return 0.0
	p *= aguante(niv)
	if recien:
		p *= INV_RECIEN
	return minf(p, INV_MAX)
















const CICLO_STEP: float = 0.12
const CICLO_MAX: float = 0.6


static func ciclo(niv: int) -> int:
	return 2 * arraigo(niv)



static func p_ciclo(antig: int, niv: int) -> float:
	return minf(CICLO_MAX, maxf(0.0, float(antig - ciclo(niv))) * CICLO_STEP)






static func sin_ganar_de_forma(forma: String) -> int:
	var n: int = 0
	for i in range(forma.length() - 1, -1, -1):
		if forma[i] == "G":
			break
		n += 1
	return n














const EXPECT_SLACK: int = 3

























const VARA_SPAN: float = 2.0


static func expected_pos(rank: int, teams: int, niv: int = NIV_REF) -> int:
	if teams <= 0:
		return 0
	var slack: int = clampi(EXPECT_SLACK - int(round(n01(niv) * VARA_SPAN)), 1, 5)
	return clampi(rank + 1 + slack, 1, teams)




















const RECUERDAN: Array[String] = ["padrino", "continuista"]


static func te_queria(char_id: String) -> bool:
	return char_id in RECUERDAN





const LIBRO_MAX: int = 12


static func ficha_libro(club_id: String, term: int, char_id: String,
		idea_id: String, temporada: int, cred: int = 0) -> Dictionary:
	return {
		"club": club_id, "term": term, "char": char_id, "idea": idea_id,




		"cred": cred,
		"desde": temporada, "ahora": "",
	}










const RECOLOCA_MARGEN: int = 2











const RECOLOCA_SPAN: float = 3.0
















const RECOLOCA_CAIDA: float = 2.0




const RECOLOCA_BAJA_RATING: int = 5










static func puede_entrenar(rating_anterior: int, club_nuevo: String,
		niv: int = NIV_REF) -> bool:
	if rating_anterior <= 0 or club_nuevo.is_empty():
		return false
	var t: Dictionary = Teams.by_id(club_nuevo)
	if t.is_empty():
		return false
	var rating_nuevo: int = Teams.rating(club_nuevo)
	if rating_nuevo <= 0:
		return false
	var margen: int = clampi(RECOLOCA_MARGEN + int(round(n01(niv) * RECOLOCA_SPAN)), 0, 5)
	if rating_nuevo > rating_anterior + margen:
		return false
	return _mu_club(Teams.base_div(club_nuevo), float(rating_nuevo)) \
			>= float(niv) - RECOLOCA_CAIDA







static func puede_seleccionar(rating_anterior: int, fuerza: int, niv: int = NIV_REF) -> bool:
	if rating_anterior <= 0 or fuerza <= 0:
		return false
	var margen: int = clampi(RECOLOCA_MARGEN + int(round(n01(niv) * RECOLOCA_SPAN)), 0, 5)
	if fuerza > rating_anterior + margen:
		return false
	return _mu_nat(float(fuerza)) >= float(niv) - RECOLOCA_CAIDA













const SEL_P_MUNDIAL: float = 0.4
const SEL_P_CONTINENTAL: float = 0.2

const SEL_P_MAX: float = 0.85





const SEL_DE_CLUB_P: float = 0.35
const SEL_PARO_P: float = 0.6





const SEL_BAJA_MAX: int = 8




static func p_sale_seleccion(kind: String, niv: int) -> float:
	var base: float = SEL_P_MUNDIAL if kind == "wc" \
			else (SEL_P_CONTINENTAL if kind == "cont" else 0.0)
	return minf(base * aguante(niv), SEL_P_MAX)



















const ROBO_SALTO_MIN: int = 6




const ROBO_LADRON_MIN: int = 88




const ROBO_ANTIGUEDAD: int = 1





const ROBO_NIV_MIN: int = 7






static func puede_ser_robado(rating_victima: int, rating_ladron: int,
		niv: int, temporadas: int) -> bool:
	if rating_victima <= 0 or rating_ladron <= 0:
		return false
	if rating_ladron < ROBO_LADRON_MIN:
		return false

	if rating_ladron - rating_victima < ROBO_SALTO_MIN:
		return false



	if temporadas < robo_antiguedad(niv):
		return false
	return niv >= ROBO_NIV_MIN




static func robo_antiguedad(niv: int) -> int:
	return maxi(ROBO_ANTIGUEDAD, arraigo(niv) - 1)








const ROBO_P: float = 0.12







const RECOLOCA_P: float = 0.45



const CAE_P: float = 0.3








const REPESCA_P: float = 0.22

















const NAT_FIRE_BASE: float = 0.55



const NAT_FIRE_STEP: float = 0.25



const NAT_FIRE_MAX: float = 0.9










static func nat_fired(cumplido: bool, fallos: int, roll: float = -1.0,
		niv: int = NIV_REF) -> bool:
	if cumplido:
		return false
	var p: float = minf(NAT_FIRE_BASE + float(maxi(fallos - 1, 0)) * NAT_FIRE_STEP,
		NAT_FIRE_MAX) * aguante(niv)
	var r: float = randf() if roll < 0.0 else clampf(roll, 0.0, 0.999)
	return r < p






static func nat_name_of(pais: String, term: int) -> String:
	if pais.is_empty():
		return ""
	return Squad.person_name(pais, hash("coach|nat|%s|%d" % [pais, term]))

















static func face_seed(club_id: String, term: int) -> String:
	if club_id.is_empty():
		return ""
	return "coach|%s|%d" % [club_id, term]


static func nat_face_seed(pais: String, term: int) -> String:
	if pais.is_empty():
		return ""
	return "coach|nat|%s|%d" % [pais, term]

















const NAT_PREFIJO: String = "nat|"


static func origen_nat(pais: String) -> String:
	return NAT_PREFIJO + pais if not pais.is_empty() else ""


static func es_nat(origen: String) -> bool:
	return origen.begins_with(NAT_PREFIJO)


static func pais_nat(origen: String) -> String:
	return origen.substr(NAT_PREFIJO.length()) if es_nat(origen) else ""





static func parte_src(src: String) -> Array:
	var i: int = src.rfind("|")
	if i <= 0:
		return []
	var cola: String = src.substr(i + 1)
	if not cola.is_valid_int():
		return []
	return [src.substr(0, i), int(cola)]






static func rating_de(sitio: String) -> int:
	if es_nat(sitio):
		return Nations.strength(pais_nat(sitio))
	return Teams.rating(sitio)










static func look_de(cara: String) -> Dictionary:
	if cara.is_empty():
		return {}
	var cfg: Dictionary = KitRecolor.traits_for(cara)
	cfg.erase("boots")
	return cfg



































const NIV_MIN: int = 0
const NIV_MAX: int = 10
const NIV_REF: int = 5
const NIV_SORTEO_MIN: int = 1
const NIV_SORTEO_MAX: int = 9
const NAT_NIV_LO: float = 2.0
const NAT_NIV_HI: float = 9.0





const NIV_RUIDO: float = 2.8







const NIV_SORPRESA_P: float = 0.15






const NAT_LO: float = 52.0
const NAT_HI: float = 99.0



























const DIV_RAT: Dictionary = {1: [78.0, 99.0], 2: [67.0, 80.0], 3: [57.0, 69.0]}
const DIV_NIV: Dictionary = {1: [7.0, 9.0], 2: [5.0, 7.0], 3: [3.0, 5.0]}








const CRED_ESCALON: int = 4
const CRED_DESVIO: int = 3



const CRED_TOPE_PUESTO: int = 5
const CRED_TITULO: int = 2
const CRED_ASCENSO: int = 2
const CRED_DESCENSO: int = 2
const CRED_CESE: int = 6






static func n01(niv: int) -> float:
	return clampf((float(clampi(niv, NIV_MIN, NIV_MAX)) - float(NIV_REF))
		/ float(NIV_REF), -1.0, 1.0)





static func _mu_club(div: int, rating: float) -> float:
	var d: int = clampi(div, 1, 3)
	var rat: Array = DIV_RAT[d]
	var niv: Array = DIV_NIV[d]
	var t: float = clampf((rating - float(rat[0])) /(float(rat[1]) - float(rat[0])),
		0.0, 1.0)
	return float(niv[0]) +(float(niv[1]) - float(niv[0])) * t






static func _mu_nat(fuerza: float) -> float:
	var t: float = clampf((fuerza - NAT_LO) /(NAT_HI - NAT_LO), 0.0, 1.0)
	return NAT_NIV_LO +(NAT_NIV_HI - NAT_NIV_LO) * t






static func nivel_tipico(club_id: String, rating: int) -> int:
	return clampi(int(round(_mu_club(Teams.base_div(club_id), float(rating)))),
		NIV_SORTEO_MIN, NIV_SORTEO_MAX)

















static func nivel_base(club_id: String, term: int, rating: int, semilla: int = 0) -> int:
	if club_id.is_empty():
		return NIV_MIN






	var fijo: int = MisterEdits.nivel_fijo(club_id, term)
	if fijo >= 0:
		return fijo




	if es_nat(club_id):
		var pais: String = pais_nat(club_id)
		return nivel_base_nat(pais, term, Nations.strength(pais), semilla)




	var rng := RandomNumberGenerator.new()
	rng.seed = hash("coachniv|%s|%d|%d" % [club_id, term, semilla])



	var mu: float = _mu_club(Teams.base_div(club_id), float(rating))
	if rng.randf() < NIV_SORPRESA_P and not Teams.POOL.is_empty():
		var otro: Dictionary = Teams.POOL[rng.randi_range(0, Teams.POOL.size() - 1)]
		var oid: String = str(otro.get("id", ""))








		mu = _mu_club(Teams.base_div(oid), float(Teams.rating(oid)))
	return _remata(mu, rng)





static func nivel_base_nat(pais: String, term: int, fuerza: int, semilla: int = 0) -> int:
	if pais.is_empty():
		return NIV_MIN
	var rng := RandomNumberGenerator.new()
	rng.seed = hash("coachniv|nat|%s|%d|%d" % [pais, term, semilla])
	var mu: float = _mu_nat(float(fuerza))
	if rng.randf() < NIV_SORPRESA_P and not Nations.POOL.is_empty():
		var otra: Dictionary = Nations.POOL[rng.randi_range(0, Nations.POOL.size() - 1)]
		mu = _mu_nat(float(Nations.strength(str(otra.get("id", "")))))
	return _remata(mu, rng)






static func _remata(mu: float, rng: RandomNumberGenerator) -> int:
	var ruido: float =(rng.randf() + rng.randf() - 1.0) * NIV_RUIDO
	return clampi(int(round(mu + ruido)), NIV_SORTEO_MIN, NIV_SORTEO_MAX)























static func credito_temporada(pos: int, rank: int, teams: int, niv: int,
		titulo: bool, ascendio: bool, descendio: bool,
		era_el_mas_fuerte: bool) -> int:
	if pos <= 0 or teams <= 0:
		return 0
	var meta: int = clampi(rank + 1 -(niv - NIV_REF), 1, teams)
	var c: int = clampi(meta - pos, - CRED_TOPE_PUESTO, CRED_TOPE_PUESTO)
	if rank >= teams - 1:
		c = mini(c, 1)
	if titulo:
		c += CRED_TITULO



	if ascendio and not era_el_mas_fuerte:
		c += CRED_ASCENSO
	if descendio:
		c -= CRED_DESCENSO
	return c








static func nivel_vivo(base: int, cred: int) -> int:
	if base <= NIV_MIN:
		return NIV_MIN
	var c: int = clampi(cred, - CRED_ESCALON * CRED_DESVIO, CRED_ESCALON * CRED_DESVIO)
	var pasos: int = c / CRED_ESCALON if c >= 0 else -((- c) / CRED_ESCALON)
	return clampi(base + clampi(pasos, - CRED_DESVIO, CRED_DESVIO), NIV_MIN, NIV_MAX)






















const TROFEO_PUNTOS: Dictionary = {"champions": 4, "clubes": 3, "liga": 3, "europa": 2,
	"copa": 1, "conference": 1, "segunda": 1,
	"libertadores": 4, "concacaf": 4, "sudamericana": 2, "oriente": 4, "sol": 2,
	"atlas": 4, "baobab": 2,

	"coral": 2}
const TROFEO_ESCALONES: Array[int] = [3, 9, 18]





static func puntos_trofeos(tro: Dictionary) -> int:
	var pts: int = 0
	for k in tro:
		pts += int(tro[k]) * int(TROFEO_PUNTOS.get(String(k), 1))
	return pts


static func bonus_trofeos(tro: Dictionary) -> int:
	var pts: int = puntos_trofeos(tro)
	var b: int = 0
	for u in TROFEO_ESCALONES:
		if pts >= u:
			b += 1
	return b


static func con_trofeos(niv: int, tro: Dictionary) -> int:
	if niv <= NIV_MIN:
		return NIV_MIN
	return clampi(niv + bonus_trofeos(tro), NIV_MIN, NIV_MAX)
