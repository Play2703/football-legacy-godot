class_name Shop
extends RefCounted




























const BOOTS: Array = [
	{"id": "cantera", "icon": "tienda", "price": 0, "name": "BOTA DE CANTERA",
		"pot": 0.0, "pre": 0.0, "efe": 0.0,
		"desc": "Las de siempre. Sin trucos."},












	{"id": "barrio", "icon": "bota_precision", "price": 45000, "life": 18, "cool": 2, "name": "BARRIO 90",
		"pot": 0.02, "pre": 0.03, "efe": 0.03, "color": Color("242424"),
		"desc": "Tu primer salto. Un poco de todo, a tu alcance."},
	{"id": "acero", "icon": "bota_potencia", "price": 90000, "life": 20, "cool": 3, "name": "ACERO PRO",
		"pot": 0.03, "pre": 0.02, "efe": 0.02, "color": Color("50565e"),
		"desc": "Hechas para durar. Rendimiento modesto, muchos partidos."},
	{"id": "trueno", "icon": "bota_potencia", "price": 114000, "life": 22, "cool": 4, "name": "TRUENO XT",
		"pot": 0.09, "pre": -0.07, "efe": -0.04, "color": Color("d1341f"),
		"desc": "Pega más fuerte, pero cuesta domarla."},
	{"id": "bisturi", "icon": "bota_precision", "price": 126000, "life": 24, "cool": 5, "name": "BISTURÍ 09",
		"pot": -0.03, "pre": 0.12, "efe": 0.02, "color": Color("f0f0f0"),
		"desc": "Para quien coloca en vez de reventar."},
	{"id": "comba", "icon": "bota_efecto", "price": 138000, "life": 26, "cool": 6, "name": "COMBA CLÁSICA",
		"pot": -0.03, "pre": 0.02, "efe": 0.2, "color": Color("2f6fd0"),
		"desc": "Rosca de verdad. La falta es tuya."},
	{"id": "orbita", "icon": "bota_efecto", "price": 185000, "life": 28, "cool": 7, "name": "ÓRBITA 10",
		"pot": -0.05, "pre": 0.08, "efe": 0.13, "color": Color("8848c8"),
		"desc": "Coloca y dibuja la curva. Menos fuerza, más intención."},
	{"id": "corona", "icon": "corona", "price": 375000, "life": 32, "cool": 8, "name": "CORONA DE ORO",
		"pot": 0.07, "pre": 0.07, "efe": 0.11, "color": Color("e8c86a"),
		"desc": "Sin peros. Si puedes pagarla."},
	{"id": "eclipse", "icon": "bota_efecto", "price": 600000, "life": 36, "cool": 10, "name": "ECLIPSE X",
		"pot": 0.1, "pre": 0.1, "efe": 0.22, "color": Color("212438"),
		"desc": "Oscuridad y neón. Potencia, puntería y una comba de élite."},
	{"id": "nova", "icon": "bota_efecto", "price": 900000, "life": 40, "cool": 12, "name": "NOVA PRISM",
		"pot": 0.12, "pre": 0.14, "efe": 0.26, "color": Color("e8edf8"),
		"desc": "Brillo de otro mundo. Cada disparo traza su propia curva."},
	{"id": "zenit", "icon": "corona", "price": 1350000, "life": 46, "cool": 14, "name": "ZÉNIT SUPREMA",
		"pot": 0.16, "pre": 0.18, "efe": 0.3, "color": Color("522487"),
		"desc": "La cima del juego. Fuerza, precisión y comba sin concesiones."},
]



const ITEMS: Array = [






	{"id": "bebida", "icon": "lata", "price": 4500, "name": "BEBIDA ENERGÉTICA",
		"energy": 35.0, "heal": 0, "form": 0,
		"desc": "+35 de energía. Ábrela entre semana o en el descanso."},
	{"id": "gel", "icon": "gel", "price": 21000, "name": "GEL ANTIINFLAMATORIO",
		"energy": 0.0, "heal": 1, "form": 0,
		"desc": "Adelanta una semana tu recuperación."},












	{"id": "psicologo", "icon": "psicologo", "price": 45000, "name": "CHARLA CON EL PSICÓLOGO",
		"energy": 0.0, "heal": 0, "form": 0, "next_match": "form_shield",
		"desc": "Tu próximo partido no te bajará la forma, juegues como juegues."},



	{"id": "botellin", "icon": "botellin", "price": 15000, "name": "BOTELLÍN ISOTÓNICO",
		"energy": 10.0, "heal": 0, "form": 0, "next_match": "boot_care",
		"desc": "+10 de energía, y tus botas no se gastan en el próximo partido."},





	{"id": "camara", "icon": "capsula", "price": 78000, "name": "CÁMARA HIPERBÁRICA",
		"energy": 20.0, "heal": 9, "form": 0,
		"desc": "Borra cualquier lesión al instante y devuelve +20 de energía. El cuerpo sólo la aguanta una vez por temporada."},

















	{"id": "cena_capitan", "icon": "plate", "price": 140000, "cooldown": 10,
		"name": "CENA CON EL CAPITÁN", "energy": 0.0, "heal": 0, "form": 0,
		"rel": {"equipo": 7},
		"desc": "Invitas al vestuario y pagas tú. +7 con el equipo. No se puede repetir en 10 partidos."},





	{"id": "reunion_tecnico", "icon": "tecnico", "price": 165000, "cooldown": 10,
		"name": "REUNIÓN CON EL TÉCNICO", "energy": 0.0, "heal": 0, "form": 0,
		"rel": {"tecnico": 6}, "next_match": "coach_meeting",
		"desc": "Le pides explicaciones y sales reforzado. +6 con el técnico — pero si fallas en el próximo partido, se lo cobra el doble."},





	{"id": "infiltracion", "icon": "jeringa", "price": 190000, "cooldown": 8,
		"name": "INFILTRACIÓN", "energy": 0.0, "heal": 0, "form": 0,
		"next_match": "play_hurt", "needs": "injury",
		"desc": "Juegas el próximo partido aunque estés lesionado. Al acabar, tu baja crece 2 semanas."},
]
















const LIFESTYLE: Array = [










	{"id": "reloj", "icon": "reloj_lujo", "price": 135000, "upkeep": 0, "repeat": false,
		"name": "RELOJ DE ORO",
		"prensa": 14, "aficion": 4, "agente": 6, "tecnico": -4, "equipo": -3,
		"desc": "Todos lo ven. El técnico también."},












	{"id": "donacion", "icon": "aficion", "price": 270000, "upkeep": 0, "repeat": true,
		"season_once": true,
		"name": "DONACIÓN AL BARRIO",
		"prensa": 10, "aficion": 25, "agente": 0, "tecnico": 0, "equipo": 0,
		"desc": "La grada corea tu nombre. Las marcas lo notan. Una vez por temporada."},










	{"id": "coche_compacto", "icon": "coche", "modelo": "compacto",
		"price": 75000, "upkeep": 15, "repeat": false, "name": "COMPACTO URBANO",
		"prensa": 2, "aficion": 4, "agente": 0, "tecnico": 0, "equipo": 2,
		"desc": "Pequeño, amarillo y práctico. Tu primer coche sin presumir."},
	{"id": "coche_sedan", "icon": "coche", "modelo": "sedan",
		"price": 135000, "upkeep": 25, "repeat": false, "name": "SEDÁN CLÁSICO",
		"prensa": 3, "aficion": 3, "agente": 2, "tecnico": 0, "equipo": 2,
		"desc": "Cuatro puertas, azul discreto y espacio para el día a día."},
	{"id": "coche_familiar", "icon": "coche", "modelo": "familiar",
		"price": 220000, "upkeep": 40, "repeat": false, "name": "FAMILIAR VIAJERO",
		"prensa": 3, "aficion": 4, "agente": 2, "tecnico": 0, "equipo": 3,
		"desc": "Carrocería larga, barras de techo y maletero para todo el equipo."},
	{"id": "coche_pickup", "icon": "coche", "modelo": "pickup",
		"price": 320000, "upkeep": 60, "repeat": false, "name": "PICKUP DE CAMPO",
		"prensa": 5, "aficion": 5, "agente": 2, "tecnico": 0, "equipo": 3,
		"desc": "Robusta, sencilla y con caja abierta. Para salir de la ciudad."},
	{"id": "coche", "icon": "coche", "price": 540000, "upkeep": 100, "repeat": false,
		"modelo": "deportivo",
		"name": "DEPORTIVO",
		"prensa": 22, "aficion": 8, "agente": 10, "tecnico": -8, "equipo": -5,
		"desc": "Llegas tarde a entrenar, pero llegas."},


	{"id": "coche_muscle", "icon": "coche", "modelo": "muscle",
		"price": 1200000, "upkeep": 150, "repeat": false,
		"name": "MUSCLE CAR",
		"prensa": 24, "aficion": 12, "agente": 8, "tecnico": -10, "equipo": -6,
		"desc": "Franjas negras y cuatro faros. Te oyen antes de verte."},
	{"id": "coche_gt", "icon": "coche", "modelo": "gran_turismo",
		"price": 2100000, "upkeep": 250, "repeat": false,
		"name": "GRAN TURISMO",
		"prensa": 26, "aficion": 10, "agente": 14, "tecnico": -6, "equipo": -4,
		"desc": "Capó largo y verde de lujo. Elegancia que sale en todas las fotos."},
	{"id": "coche_hiper", "icon": "coche", "modelo": "hiper",
		"price": 3200000, "upkeep": 500, "repeat": false,
		"name": "HIPERDEPORTIVO",
		"prensa": 34, "aficion": 14, "agente": 18, "tecnico": -12, "equipo": -8,
		"desc": "Plata, carbono y alerón. Una pieza de colección que acapara portadas."},











]
























































const INVESTMENTS: Array = [







	{"id": "fisio", "icon": "fisio", "price": 2200000, "req_house": "spa",
		"name": "PREPARADOR FÍSICO",
		"rest": 12.0,
		"desc": "Alguien que cuida tu cuerpo a jornada completa: la mayor recuperación tras cada partido."},


























	{"id": "chef", "icon": "plate", "price": 1800000, "req_house": "cocina_dieta",
		"name": "CHEF PERSONAL", "en_casa": true, "libre": "comer",
		"rest": 8.0, "upkeep": 8000,
		"mejoras": [{"price": 1800000, "xp_mult": 1.05}, {"price": 2500000, "xp_mult": 1.1}],
		"desc": "Cocina para ti cada semana: COMER BIEN no te gasta acción y recuperas más energía tras cada partido."},












	{"id": "nutricionista", "icon": "nevera", "price": 1500000, "req_house": "consultorio_nutri",
		"name": "NUTRICIONISTA", "en_casa": true,
		"gasto": 0.92, "upkeep": 6000,
		"mejoras": [{"price": 1500000, "injury_mult": 0.9}, {"price": 2300000, "injury_mult": 0.8}],
		"desc": "Te arma la dieta de cada semana: cada partido te gasta menos energía."},








	{"id": "entrenador", "icon": "fisico", "price": 2100000, "req_house": "gimnasio",
		"name": "ENTRENADOR PERSONAL", "en_casa": true, "libre": "pesas",
		"upkeep": 8000,
		"mejoras": [{"price": 2100000, "rel_libre": {"tecnico": 1.0}},
			{"price": 2700000, "rel_libre": {"tecnico": 2.0}}],
		"desc": "Te espera en tu gimnasio: LEVANTAR PESAS no te gasta acción."},




	{"id": "clinica", "icon": "clinica", "price": 2700000,
		"name": "CLÍNICA PRIVADA",
		"injury_mult": 0.55, "injury_div": 2,
		"desc": "Casi la mitad de riesgo de lesión, y toda baja dura la mitad."},
	{"id": "analista", "icon": "analista", "price": 3400000, "req_house": "video",
		"name": "ANALISTA DE VÍDEO",
		"xp_mult": 1.25,
		"desc": "Estudias cada partido con alguien que sabe mirar: +25% de experiencia."},





]



































const AGENTS: Array = [
	{"id": "ag1", "icon": "agente", "price": 250000, "upkeep": 1500,
		"name": "AGENTE CON OFICINA", "agente": 10, "prensa": 0, "cut": 0.07,
		"desc": "Deja de atenderte desde el coche. Comisión del 7%."},
	{"id": "ag2", "icon": "agente", "price": 900000, "upkeep": 3500,
		"name": "AGENTE CON CARTERA", "agente": 12, "prensa": 3, "cut": 0.06,
		"desc": "Ya lleva a otros profesionales. Más clubes te miran, y cobra el 6%."},
	{"id": "ag3", "icon": "agente", "price": 2400000, "upkeep": 8000,
		"name": "AGENCIA DE PRIMERA", "agente": 14, "prensa": 5, "cut": 0.05,
		"desc": "Un equipo detrás de tu nombre: ofertas de fuera y prensa a favor. El 5%."},
	{"id": "ag4", "icon": "agente", "price": 4200000, "upkeep": 16000,
		"name": "AGENTE DE ESTRELLAS", "agente": 16, "prensa": 7, "cut": 0.035,
		"desc": "Sólo lleva a quince jugadores en el mundo y tú eres uno. El 3,5%."},
	{"id": "ag5", "icon": "contrato_firma", "price": 8600000, "upkeep": 30000,
		"name": "TU PROPIA AGENCIA", "agente": 18, "prensa": 10, "cut": 0.025,
		"desc": "El despacho es tuyo y él trabaja para ti. La comisión baja al 2,5%."},
]




static func agent_next(level: int) -> Dictionary:
	return AGENTS[level] if level >= 0 and level < AGENTS.size() else {}




static func agent_current(level: int) -> Dictionary:
	return AGENTS[level - 1] if level >= 1 and level <= AGENTS.size() else {}



static func agent_cut(level: int) -> float:
	var a: Dictionary = agent_current(level)
	return float(a.get("cut", DEFAULT_AGENT_CUT))





static func agent_stats(a: Dictionary, level_now: int) -> Array:
	var out: Array = []
	if int(a.get("agente", 0)) != 0:
		out.append({"label": "AGENTE", "value": int(a["agente"])})
	if int(a.get("prensa", 0)) != 0:
		out.append({"label": "PRENSA", "value": int(a["prensa"])})
	var delta: float = float(a.get("cut", DEFAULT_AGENT_CUT)) - agent_cut(level_now)
	if not is_zero_approx(delta):
		out.append({"label": "COMISIÓN %", "value": roundi(delta * 100.0),
			"lower_better": true})
	return out



































const CLUB_MERCH: Array = [
	{"id": "gorra", "icon": "aficion", "price": 22000, "aficion": 2,
		"name": "GORRA DEL CLUB",
		"desc": "El escudo en la cabeza, todos los días. Lo más barato que dice de qué eres."},
	{"id": "bufanda", "icon": "aficion", "price": 40000, "aficion": 4,
		"name": "BUFANDA DEL CLUB",
		"desc": "La que se levanta en el himno. Mientras juegues aquí, la grada te la reconoce."},



	{"id": "balon", "icon": "balon", "price": 26000, "rest": 1.2,
		"name": "BALÓN OFICIAL",
		"desc": "El del año, con el sello del club. Lo usas a diario y llegas algo más entero."},
	{"id": "playera", "icon": "camiseta", "price": 34000, "prensa": 3,
		"name": "PLAYERA DE LA TEMPORADA",
		"desc": "La de este año, con tu dorsal. Sales con ella y la prensa lo nota."},

	{"id": "firmada", "icon": "camiseta", "price": 140000, "aficion": 6, "prensa": 4,
		"div1": true, "name": "PLAYERA FIRMADA",
		"desc": "La de la vitrina, firmada por la plantilla. Sólo en primera."},
]





static func merch_catalog(division: int) -> Array:
	if division > 2:
		return []
	var out: Array = []
	for m in CLUB_MERCH:
		if division == 1 or not bool(m.get("div1", false)):
			out.append(m)
	return out


static func merch_by_id(id: String) -> Dictionary:
	for m in CLUB_MERCH:
		if String(m["id"]) == id:
			return m
	return {}





static func merch_total(owned: Array, key: String) -> float:
	var total: float = 0.0
	for id in owned:
		total += float(merch_by_id(String(id)).get(key, 0))
	return total





static func merch_stats(m: Dictionary) -> Array:
	var out: Array = []
	for key in ["aficion", "prensa"]:
		var v: int = int(m.get(key, 0))
		if v != 0:
			out.append({"label": String(LIFESTYLE_LABELS[key]), "value": v})
	var rest: float = float(m.get("rest", 0.0))
	if absf(rest) > 0.001:
		out.append({"label": "ENERGÍA", "value": rest})
	return out


























const DEAL_MULT: float = 0.7





static func deal_of(seed_i: int) -> Dictionary:
	var pool: Array = []
	for b in BOOTS:
		if int(b["price"]) > 0:
			pool.append({"family": "boots", "item": b})
	for i in ITEMS:
		pool.append({"family": "item", "item": i})
	for l in LIFESTYLE:
		if not House.COCHES.has(String(l["id"])):
			pool.append({"family": "lifestyle", "item": l})
	return pool[absi(hash(seed_i)) % pool.size()]


static func deal_price(price: int) -> int:
	return int(round(float(price) * DEAL_MULT))






static func investments_upkeep(owned: Array) -> int:
	var total: int = 0
	for inv_id in owned:
		total += int(investment_by_id(String(inv_id)).get("upkeep", 0))
	return total


static func investment_by_id(id: String) -> Dictionary:
	for i in INVESTMENTS:
		if String(i["id"]) == id:
			return i
	return {}




static func staff_levels(v: Dictionary) -> int:
	return 1 +(v.get("mejoras", []) as Array).size()




static func staff_mejora(v: Dictionary, level: int) -> Dictionary:
	var m: Array = v.get("mejoras", [])
	var i: int = level - 2
	return m[i] if i >= 0 and i < m.size() else {}




static func staff_level_stats(v: Dictionary, level: int) -> Array:
	var m: Dictionary = staff_mejora(v, level)
	var out: Array = []
	if m.has("xp_mult"):
		out.append({"label": "XP", "value": roundi((float(m["xp_mult"]) - 1.0) * 100.0)})
	if m.has("injury_mult"):
		out.append({"label": "RIESGO", "lower_better": true,
			"value": roundi((float(m["injury_mult"]) - 1.0) * 100.0)})


	var extra: Dictionary = m.get("rel_libre", {})
	var base: Dictionary = House.use_by_id(String(v.get("libre", ""))).get("rel", {})
	for k in extra:
		out.append({"label": String(LIFESTYLE_LABELS.get(k, String(k).to_upper())),
			"value": roundi(float(base.get(k, 0.0)) + float(extra[k]))})
	return out




static func staff_level_line(v: Dictionary, level: int) -> String:
	var m: Dictionary = staff_mejora(v, level)
	if m.has("xp_mult"):
		return I18n.tf("Comes como atleta: +{0}% de experiencia en cada partido.",
			[roundi((float(m["xp_mult"]) - 1.0) * 100.0)])
	if m.has("injury_mult"):
		return I18n.tf("Te cuida el cuerpo: {0}% menos riesgo de lesión.",
			[roundi((1.0 - float(m["injury_mult"])) * 100.0)])
	var extra: Dictionary = m.get("rel_libre", {})
	if extra.has("tecnico"):
		var base: float = float((House.use_by_id(String(v.get("libre", ""))).get("rel", {})
			as Dictionary).get("tecnico", 0.0))
		return I18n.tf("Más exigente: LEVANTAR PESAS te da +{0} de técnico.",
			[roundi(base + float(extra["tecnico"]))])
	return ""






static func investment_stats(v: Dictionary) -> Array:
	var out: Array = []
	if v.has("rest"):





		out.append({"label": "ENERGIA", "value": roundi(Career.rest_delta_for(float(v["rest"])))})



	if v.has("injury_mult"):
		out.append({"label": "RIESGO", "lower_better": true,
			"value": roundi((float(v["injury_mult"]) - 1.0) * 100.0)})
	if v.has("injury_div"):


		out.append({"label": "SEMANAS BAJA", "lower_better": true,
			"value": roundi((1.0 / maxf(float(v["injury_div"]), 1.0) - 1.0) * 100.0)})
	if v.has("xp_mult"):
		out.append({"label": "XP", "value": roundi((float(v["xp_mult"]) - 1.0) * 100.0)})
	if v.has("agent_cut"):
		out.append({"label": "COMISION", "lower_better": true,
			"value": roundi((float(v["agent_cut"]) - DEFAULT_AGENT_CUT) * 100.0)})

	if v.has("gasto"):
		out.append({"label": "GASTO", "lower_better": true,
			"value": roundi((float(v["gasto"]) - 1.0) * 100.0)})

	if v.has("libre"):
		out.append({"label": "ACCIONES", "value": 1})
	return out





const DEFAULT_AGENT_CUT: float = 0.08







const DEFAULT_INJURY_CAP: int = 8









const GIMNASIO_REST_BONUS: float = 6.0



const LIFESTYLE_KEYS: Array[String] = ["prensa", "aficion", "agente", "tecnico", "equipo"]
const LIFESTYLE_LABELS: Dictionary = {
	"prensa": "PRENSA", "aficion": "AFICIÓN", "agente": "AGENTE",
	"tecnico": "TÉCNICO", "equipo": "EQUIPO",
}





static func icon_of(d: Dictionary, fallback: String) -> String:
	return String(d.get("icon", fallback))





static func boots_stats(b: Dictionary) -> Array:
	var out: Array = []
	for key in [["pot", "POT"], ["pre", "PRE"], ["efe", "EFE"]]:
		var v: float = float(b.get(key[0], 0.0))
		if absf(v) >= 0.005:
			out.append({"label": String(key[1]), "value": roundi(v * 100.0)})
	return out







static func boot_wear_factor(used: float, life: int) -> float:
	if life <= 0:
		return 1.0
	return clampf(1.0 - float(used) / float(life), 0.0, 1.0)






const BOOT_DIV_MULT: Dictionary = {1: 6.0, 2: 2.5, 3: 1.0}
static func boot_price_mult(division: int) -> float:
	return float(BOOT_DIV_MULT.get(clampi(division, 1, 3), 1.0))




































const PRICE_WAGE_REF: float = 1200.0
const PRICE_WAGE_EXP: float = 0.75
const PRICE_WAGE_MAX: float = 25.0




static func wage_price_mult(wage: int) -> float:
	if wage <= 0:
		return 1.0
	return clampf(pow(float(wage) / PRICE_WAGE_REF, PRICE_WAGE_EXP), 1.0, PRICE_WAGE_MAX)
















const PRICE_WAGE_FAMILIES: Array = ["item"]





static func lifestyle_stats(l: Dictionary) -> Array:
	var out: Array = []
	for key in LIFESTYLE_KEYS:
		var v: int = int(l.get(key, 0))
		if v != 0:
			out.append({"label": String(LIFESTYLE_LABELS[key]), "value": v})
	return out
























const CASUAL_UNLOCKS: Dictionary = {
	"reloj": {
		"outfit_name": "DE ORO",
		"shirt": Color("cfa63c"),
		"pants": Color("cfa63c"),


		"outfit": {"casual_shirt": Color("17161a"), "casual_print": "solid",
			"casual_pants": Color("cfa63c"), "casual_sleeves": "larga"},
	},
	"donacion": {
		"outfit_name": "DEL BARRIO",
		"shirt": Color("1f7a5a"),
		"pants": Color("5a7395"),
		"outfit": {"casual_shirt": Color("1f7a5a"), "casual_print": "hoops",
			"casual_shirt2": Color("e8e6ea"), "casual_pants": Color("5a7395"),
			"casual_sleeves": "corta"},
	},
	"coche": {
		"outfit_name": "DE PISTA",
		"shirt": Color("c1121f"),
		"outfit": {"casual_shirt": Color("c1121f"), "casual_print": "half",
			"casual_shirt2": Color("17161a"), "casual_pants": Color("17161a"),
			"casual_sleeves": "corta", "acc_face": "gafas"},
	},




	"agente_top": {
		"outfit_name": "DE OFICINA",
		"shirt": Color("3a3f4b"),
		"pants": Color("4b5163"),
		"outfit": {"casual_shirt": Color("e8e6ea"), "casual_print": "solid",
			"casual_pants": Color("4b5163"), "casual_sleeves": "larga",
			"acc_face": "lentes"},
	},
}









const CASUAL_UNLOCK_ORDER: Array[String] = ["reloj", "donacion", "coche",
	"agente_top"]


static func casual_colors(owned_lifestyle: Array, key: String) -> Array[Color]:
	var out: Array[Color] = []
	for lid in CASUAL_UNLOCK_ORDER:
		if not owned_lifestyle.has(lid) or not CASUAL_UNLOCKS.has(lid):
			continue
		var u: Dictionary = CASUAL_UNLOCKS[lid]
		if u.has(key):
			out.append(u[key] as Color)
	return out




static func casual_outfits(owned_lifestyle: Array) -> Array:
	var out: Array = []
	for lid in CASUAL_UNLOCK_ORDER:
		if not owned_lifestyle.has(lid) or not CASUAL_UNLOCKS.has(lid):
			continue
		var u: Dictionary = CASUAL_UNLOCKS[lid]
		out.append({"id": lid, "name": String(u.get("outfit_name", lid)),
			"cfg":(u.get("outfit", {}) as Dictionary)})
	return out


static func lifestyle_by_id(id: String) -> Dictionary:
	for l in LIFESTYLE:
		if String(l["id"]) == id:
			return l
	return {}



static func upkeep_total(owned_lifestyle: Array) -> int:
	var total: int = 0
	for id in owned_lifestyle:
		total += int(lifestyle_by_id(String(id)).get("upkeep", 0))
	return total


static func boots_by_id(id: String) -> Dictionary:
	for b in BOOTS:
		if String(b["id"]) == id:
			return b
	return BOOTS[0]


static func item_by_id(id: String) -> Dictionary:
	for i in ITEMS:
		if String(i["id"]) == id:
			return i
	return {}



















const CASUAL_BASE: Dictionary = {
	"casual_top": 3000, "casual_pants_style": 4500, "casual_outer": 9000,
	"casual_shoes": 6000, "acc_head": 3500, "acc_face": 4000, "acc_ear": 3000,
	"acc_neck": 5000, "acc_watch": 8000, "acc_bracelet": 3000,
	"acc_neckwear": 3000, "acc_pocket": 2500, "acc_belt": 4000,


	"acc_torso": 6000,
}



const CASUAL_PRICE: Dictionary = {
	"casual_top/camisa": 5000, "casual_top/lino": 7000, "casual_top/jersey_retro": 8000,
	"casual_top/sueter": 5000, "casual_top/cuello_alto": 5000,
	"casual_top/cuarto_cierre": 6500, "casual_top/rugby": 7000,
	"casual_pants_style/vestir": 7000, "casual_pants_style/pinzas": 6000,
	"casual_pants_style/bano": 2500, "casual_pants_style/short_chino": 3000,
	"casual_pants_style/short_denim": 3500, "casual_pants_style/deportivo": 3000,
	"casual_pants_style/barril": 6000, "casual_pants_style/tecnico": 7000,
	"casual_outer/cuero": 20000, "casual_outer/abrigo": 16000,
	"casual_outer/gabardina": 15000, "casual_outer/blazer": 14000,
	"casual_outer/acolchada": 12000, "casual_outer/varsity": 12000,
	"casual_outer/chaleco": 6000, "casual_outer/rompevientos": 7000,
	"casual_outer/sobrecamisa": 9000, "casual_outer/parka": 14000,
	"casual_shoes/charol": 12000, "casual_shoes/chelsea": 11000,
	"casual_shoes/oxford": 10000, "casual_shoes/botas": 9000,
	"casual_shoes/slides": 2000, "casual_shoes/sandalias": 2500,
	"casual_shoes/gruesos": 8500,
	"acc_head/sombrero": 6000, "acc_head/bucket": 4000,
	"acc_face/aviador": 7000, "acc_face/deportivos": 6000,
	"acc_ear/diamante": 15000, "acc_ear/colgante": 5000,
	"acc_neck/dije": 9000,
	"acc_watch/reloj": 6000, "acc_watch/deportivo": 9000, "acc_watch/lujo": 20000,
	"acc_belt/hebilla": 5000, "acc_neckwear/bufanda": 4000,
}




const CASUAL_FREE: Dictionary = {
	"casual_top": "playera", "casual_pants_style": "recto", "casual_shoes": "bajos",
}





static func wardrobe_id(key: String, opt: String) -> String:
	return "%s/%s" % [key, opt]








const FILAS_ESTETICA: Dictionary = {"modular_hair": "hair", "modular_beard": "beard"}




static func casual_price(key: String, opt: String) -> int:
	if opt.is_empty() or opt == "none" or String(CASUAL_FREE.get(key, "")) == opt:
		return 0
	if FILAS_ESTETICA.has(key):
		var kind: String = String(FILAS_ESTETICA[key])
		if not (opt.begins_with("p_") and KitRecolor.PIEZAS_PROPIAS.es_propia(kind, opt)):
			return 0
		var cobra: int = KitRecolor.PIEZAS_PROPIAS.precio(kind, opt)
		return clampi(cobra, KitRecolor.PIEZAS_PROPIAS.PRECIO_MIN,
			KitRecolor.PIEZAS_PROPIAS.PRECIO_MAX) if cobra > 0 else 0
	if not CASUAL_BASE.has(key):
		return 0




	var grupo: String = String(KitRecolor.FILAS_PROPIAS.get(key, ""))
	if opt.begins_with("p_") and not grupo.is_empty() \
			and KitRecolor.PIEZAS_PROPIAS.es_propia(grupo, opt):
		var propio: int = KitRecolor.PIEZAS_PROPIAS.precio(grupo, opt)
		if propio > 0:
			return clampi(propio, KitRecolor.PIEZAS_PROPIAS.PRECIO_MIN,
				KitRecolor.PIEZAS_PROPIAS.PRECIO_MAX)
	return int(CASUAL_PRICE.get(wardrobe_id(key, opt), CASUAL_BASE[key]))






static func casual_preset_price(preset: Dictionary, owned: Array) -> int:
	var total: int = 0
	for key in preset:
		var val: Variant = preset[key]
		if val is Color:
			continue
		var price: int = casual_price(String(key), String(val))
		if price > 0 and not owned.has(wardrobe_id(String(key), String(val))):
			total += price
	return total




static func casual_preset_ids(preset: Dictionary, owned: Array) -> Array:
	var out: Array = []
	for key in preset:
		var val: Variant = preset[key]
		if val is Color:
			continue
		var id: String = wardrobe_id(String(key), String(val))
		if casual_price(String(key), String(val)) > 0 and not owned.has(id):
			out.append(id)
	return out
