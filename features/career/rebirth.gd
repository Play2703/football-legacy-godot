class_name Rebirth
extends RefCounted














































































const BUDGET: int = 6





const BUDGET_MAX: int = 7

static func budget() -> int:
	return mini(BUDGET_MAX, BUDGET + Herencia.presupuesto_extra())










const MODIFIERS: Array = [




	{"id": "botas_heredadas", "icon": "bota_potencia", "name": "BOTAS HEREDADAS",
		"req": "temporada_div3", "tier": 1,
		"boots": "trueno",
		"desc": "Te quedaste las botas de aquel año en Tercera. Estrenas unas TRUENO XT: pegan más fuerte, y duran lo que duran."},
	{"id": "con_cartel", "icon": "aficion", "name": "CON CARTEL",
		"req": "presentado", "tier": 1,
		"rel_floor": {"aficion": 45},
		"desc": "Llegas con cartel: la grada ya coreó tu nombre una vez y te lo guarda."},
	{"id": "pie_educado", "icon": "precision", "name": "PIE EDUCADO",
		"req": "goleador_10", "tier": 1,
		"skill_bonus": {"precision": 3},
		"desc": "Los primeros diez goles no se olvidan: +3 de precisión desde el debut."},
	{"id": "picardia", "icon": "regate", "name": "PICARDIA",
		"req": "primer_regate", "tier": 1,
		"skill_bonus": {"regate": 4},
		"desc": "El uno contra uno lo aprendiste en una cancha sin red: +4 de regate desde el debut."},



	{"id": "mano_fria", "icon": "penal", "name": "MANO FRIA",
		"req": "doblete", "tier": 1,
		"skill_bonus": {"penal": 5},
		"desc": "Cuando pitan penalti, el balón lo coges tú: +5 de penales, que es lo que decide quién lo tira en tu equipo."},
	{"id": "cara_anuncio", "icon": "prensa", "name": "CARA DE ANUNCIO",
		"req": "primer_sponsor", "tier": 1,
		"rel_floor": {"prensa": 40},
		"desc": "Sales bien en foto y la prensa lo nota: empiezas con la puerta de los patrocinios abierta, no en tu segunda temporada."},



	{"id": "buen_toque", "icon": "precision", "name": "BUEN TOQUE", "tier": 1,
		"skill_bonus": {"efecto": 4},
		"desc": "Le pegas con rosca desde niño: +4 de efecto desde el debut."},
	{"id": "pulmones", "icon": "fisico", "name": "PULMONES", "tier": 1,
		"skill_bonus": {"fisico": 4},
		"desc": "Ibas corriendo al colegio y de vuelta: +4 de físico desde el debut."},


	{"id": "recomendado", "icon": "tecnico", "name": "RECOMENDADO",
		"req": "veterano_100", "tier": 2,
		"rel_floor": {"tecnico": 42, "equipo": 40},
		"desc": "El técnico ya oyó hablar de ti. Debutas con su confianza, no en la grada."},
	{"id": "mano_derecha", "icon": "agente", "name": "MANO DERECHA",
		"req": "primer_titulo_liga", "tier": 2,
		"agent_level": 1,
		"desc": "Un agente con oficina te firma antes que ningún club: más puertas y menos comisión. Su cuota mensual, también desde el día uno."},
	{"id": "el_diez", "icon": "camiseta", "name": "EL DIEZ",
		"req": "el_diez", "tier": 2,
		"skill_bonus": {"vision": 3}, "shirt_pref": 10,
		"desc": "Ya llevaste el 10 y no se te olvidó: +3 de visión, y si el 10 está libre en tu club, te lo guardan."},



	{"id": "el_telefono", "icon": "agente", "name": "EL TELEFONO",
		"req": "via_bosman", "tier": 2,
		"rel_floor": {"agente": 72},
		"desc": "Tienes el teléfono de alguien que mueve fichas: tu agente arranca con la mesa llena y el mercado abierto desde el primer mes."},
	{"id": "el_nueve", "icon": "gol", "name": "EL NUEVE",
		"req": "goleador_50", "tier": 2,
		"skill_bonus": {"potencia": 3}, "shirt_pref": 9,
		"desc": "El área es tuya: +3 de potencia, y si el 9 está libre en tu club, te lo guardan."},

	{"id": "el_que_volvio", "icon": "aficion", "name": "EL QUE VOLVIO",
		"req": "vuelve_donde_fue_feliz", "tier": 2,
		"rel_floor": {"aficion": 50, "prensa": 32},
		"desc": "Ya jugaste aquí una vez y nadie lo olvidó: la grada te espera y la prensa te da el beneficio de la duda."},





	{"id": "el_deportivo", "icon": "coche", "name": "EL DEPORTIVO",
		"req": "presentacion_40k", "tier": 2,
		"shop_item": "coche",
		"desc": "Cuarenta mil personas fueron a verte firmar y te compraste el coche. Llegas tarde a entrenar, pero llegas: la prensa te adora y el vestuario menos."},






	{"id": "prodigio", "icon": "potencia", "name": "PRODIGIO",
		"req": "campeon_primera", "tier": 2,
		"skill_points": 3,
		"desc": "Naciste con algo. Empiezas con 3 puntos de habilidad por repartir."},
	{"id": "los_ahorros", "icon": "material", "name": "LOS AHORROS", "tier": 2,
		"money_bonus": 25000,
		"desc": "La familia guardó para tu debut: veinticinco mil de salida en toda carrera nueva."},
	{"id": "el_capitan", "icon": "camiseta", "name": "EL CAPITAN", "tier": 2,
		"rel_floor": {"equipo": 55, "tecnico": 40},
		"desc": "El vestuario te sigue antes de que abras la boca: el equipo nunca por debajo de 55."},


	{"id": "killer_nato", "icon": "gol", "name": "KILLER NATO",
		"req": "goleador_100", "tier": 3,
		"skill_bonus": {"potencia": 6, "precision": 6, "efecto": 6},
		"desc": "El gol lo llevas puesto: +6 a potencia, precisión y efecto de salida."},
	{"id": "cuerpo_hierro", "icon": "fisico", "name": "CUERPO DE HIERRO",
		"req": "veterano_300", "tier": 3,
		"injury_mult": 0.8,
		"desc": "Trescientos partidos enseñan a caer: 20% menos de riesgo de lesión, toda la carrera."},








	{"id": "ahijado", "icon": "tecnico", "name": "EL AHIJADO",
		"req": "dinastia", "tier": 3,
		"rel_floor": {"tecnico": 48, "prensa": 30},
		"desc": "En este vestuario tu apellido ya sonaba: el técnico te conoce antes de verte jugar, y la prensa lo sabe."},


	{"id": "botas_de_oro", "icon": "corona", "name": "BOTAS DE ORO",
		"req": "pichichi_x3", "tier": 3,
		"boots": "corona",
		"desc": "Tres trofeos de goleador vinieron con unas CORONA DE ORO. Estrenas un par, sin estrenar y sin pagar."},





	{"id": "patio_familia", "icon": "arbol", "name": "EL PATIO DE LA FAMILIA",
		"req": "mansion", "tier": 3,
		"land_tier": 2,
		"desc": "El terreno de la familia ya era tuyo antes de firmar nada. La casa la levantas tú, pero el sitio donde ponerla no lo pagas."},






	{"id": "sangre_azul", "icon": "seleccion", "name": "SANGRE AZUL",
		"req": "campeon_del_mundo", "tier": 3,
		"nat_edge": 6,
		"desc": "El seleccionador ya sabe quién eres: empiezas con crédito para entrar en la primera lista."},
	{"id": "el_cerebro", "icon": "precision", "name": "EL CEREBRO", "tier": 3,
		"skill_bonus": {"vision": 6, "precision": 3, "efecto": 3},
		"desc": "Ves la jugada antes que nadie: +6 de visión y +3 de precisión y efecto."},
	{"id": "reloj_abuelo", "icon": "reloj_lujo", "name": "EL RELOJ DEL ABUELO", "tier": 3,
		"shop_item": "reloj",
		"desc": "Un reloj de lujo que ya era de la familia: la prensa te mira distinto desde el primer día."},


	{"id": "hijo_leyenda", "icon": "leyendas", "name": "HIJO DE LEYENDA",
		"req": "leyenda", "tier": 4,
		"house_level": 1, "skill_points": 2,
		"desc": "Heredas el apellido y la casa: entras a vivir el primer día. El mantenimiento también se hereda."},
	{"id": "fichaje_oro", "icon": "contrato_firma", "name": "FICHAJE DE ORO",
		"req": "balon_de_oro", "tier": 4,
		"role_bump": true,
		"desc": "No llegas a pelear un sitio: llegas a ocuparlo. Un peldaño más de rol en tu contrato de debut."},







	{"id": "piernas_de_nino", "icon": "velocidad", "name": "PIERNAS DE NIÑO",
		"req": "clase_mundial", "tier": 4,
		"skill_bonus": {"velocidad": 6, "aceleracion": 6, "regate": 6},
		"desc": "Las piernas no se acuerdan de los años: +6 a velocidad, aceleración y regate de salida."},





	{"id": "preparador_familia", "icon": "fisio", "name": "EL PREPARADOR DE LA FAMILIA",
		"req": "conquistador", "tier": 4,
		"invest_id": "fisio",
		"desc": "El que puso en pie a tu padre te conoce desde niño. Te recuperas entre partidos como nadie de tu edad, y a él no hay que pagarle."},
	{"id": "superdotado", "icon": "potencia", "name": "SUPERDOTADO", "tier": 4,
		"skill_points": 8,
		"desc": "Naciste para esto: 8 puntos de habilidad por repartir antes de debutar."},
	{"id": "la_fortuna", "icon": "material", "name": "LA FORTUNA FAMILIAR", "tier": 4,
		"money_bonus": 250000,
		"desc": "Doscientos cincuenta mil de salida en toda carrera nueva. Nunca vas a vivir al día."},
]




static func all() -> Array:
	return MODIFIERS


static func by_id(id: String) -> Dictionary:
	for m in MODIFIERS:
		if String(m["id"]) == id:
			return m
	return {}
















static func is_unlocked(id: String) -> bool:
	var m: Dictionary = by_id(id)
	if m.is_empty():
		return false
	if Store.tiene_derecho(String(Iap.DERECHO_VENTAJAS["id"])):
		return true


	return Herencia.tiene(id)



static func unlocked() -> Array:
	var out: Array = []
	for m in MODIFIERS:
		if is_unlocked(String(m["id"])):
			out.append(m)
	return out


static func any_unlocked() -> bool:
	return not unlocked().is_empty()







const TIER_NAMES: Array = ["BRONCE", "PLATA", "ORO", "DIAMANTE"]


static func tier_name(t: int) -> String:
	return String(TIER_NAMES[clampi(t, 1, 4) - 1])


static func tier_color(t: int) -> Color:
	return CareerTheme.TIER_COLORS[clampi(t, 1, 4) - 1]


static func of_tier(t: int) -> Array:
	var out: Array = []
	for m in MODIFIERS:
		if int(m.get("tier", 1)) == t:
			out.append(m)
	return out





static func cost_of(id: String) -> int:
	var m: Dictionary = by_id(id)
	return int(m.get("tier", 1)) if not m.is_empty() else 0


static func cost_total(ids: Array) -> int:
	var total: int = 0
	for raw in ids:
		total += cost_of(String(raw))
	return total





static func fits(ids: Array, id: String) -> bool:
	if ids.has(id):
		return true
	return cost_total(ids) + cost_of(id) <= budget()





static func req_name(id: String) -> String:
	var m: Dictionary = by_id(id)
	if m.is_empty():
		return ""
	var meta: Dictionary = Achievements.meta_of(String(m.get("req", "")))
	return String(meta.get("name", ""))




static func req_desc(id: String) -> String:
	var m: Dictionary = by_id(id)
	if m.is_empty():
		return ""
	var meta: Dictionary = Achievements.meta_of(String(m.get("req", "")))
	return String(meta.get("desc", ""))















static func stats_of(id: String) -> Array:
	var m: Dictionary = by_id(id)
	if m.is_empty():
		return []
	var out: Array = []


	for stat in m.get("skill_bonus", {}):
		out.append({"label": String(stat), "value": int(m["skill_bonus"][stat]),
			"icon": String(stat)})
	if int(m.get("skill_points", 0)) > 0:
		out.append({"label": "PUNTOS", "value": int(m["skill_points"])})
	for key in m.get("rel_floor", {}):
		out.append({"label": String(key), "text": str(int(m["rel_floor"][key])),
			"icon": String(key)})
	if m.has("boots"):
		var b: Dictionary = _boot_by_id(String(m["boots"]))
		out.append({"label": "BOTAS", "text": String(b.get("name", "")),
			"icon": String(b.get("icon", "bota_potencia"))})


		if int(b.get("life", 0)) > 0:
			out.append({"label": "VIDA", "text": "%d" % int(b["life"])})
	if int(m.get("agent_level", 0)) > 0:
		var a: Dictionary = Shop.agent_current(int(m["agent_level"]))
		out.append({"label": "AGENTE", "text": String(a.get("name", "")), "icon": "agente"})


		var delta: int = int(round((Shop.agent_cut(int(m["agent_level"]))
			- Shop.agent_cut(0)) * 100.0))
		if delta != 0:
			out.append({"label": "COMISION", "value": delta, "suffix": "%",
				"lower_better": true})
	if int(m.get("house_level", 0)) > 0:
		out.append({"label": "CASA",
			"text": String(House.level_data(int(m["house_level"])).get("name", "")),
			"icon": "sofa"})





	if m.has("shop_item"):
		var l: Dictionary = Shop.lifestyle_by_id(String(m["shop_item"]))
		var mejor: String = ""
		var peor: String = ""
		var v_mejor: int = 0
		var v_peor: int = 0
		for key in Shop.LIFESTYLE_KEYS:
			var d: int = int(l.get(key, 0))
			if d > v_mejor:
				v_mejor = d
				mejor = String(key)
			if d < v_peor:
				v_peor = d
				peor = String(key)
		for key in [mejor, peor]:
			if not String(key).is_empty():
				out.append({"label": String(key), "value": int(l.get(key, 0)),
					"icon": String(key)})


		if int(l.get("upkeep", 0)) > 0:
			out.append({"label": "MANTENIMIENTO", "value": - int(l["upkeep"]),
				"lower_better": true, "icon": "moneda"})
		for key in Shop.LIFESTYLE_KEYS:
			var d2: int = int(l.get(key, 0))
			if d2 != 0 and String(key) != mejor and String(key) != peor:
				out.append({"label": String(key), "value": d2, "icon": String(key)})


	if int(m.get("land_tier", 0)) > 0:
		out.append({"label": "TERRENO",
			"text": "%d x %d" % [int(House.lado_of(int(m["land_tier"]))),
				int(House.lado_of(int(m["land_tier"])))],
			"icon": "arbol"})

	if m.has("invest_id"):
		var v: Dictionary = Shop.investment_by_id(String(m["invest_id"]))
		out.append({"label": "INVERSION", "text": String(v.get("name", "")),
			"icon": String(v.get("icon", "fisio"))})
		if float(v.get("rest", 0.0)) > 0.0:
			out.append({"label": "RECUPERACION", "value": int(round(float(v["rest"]))),
				"icon": "botiquin"})
	if int(m.get("nat_edge", 0)) != 0:
		out.append({"label": "SELECCION", "value": int(m["nat_edge"]), "icon": "seleccion"})
	if bool(m.get("role_bump", false)):
		out.append({"label": "DEBUT", "text": "MEJOR ROL", "icon": "contrato"})
	if int(m.get("shirt_pref", 0)) > 0:
		out.append({"label": "DORSAL", "text": "%d" % int(m["shirt_pref"]),
			"icon": "camiseta"})
	if m.has("injury_mult"):
		out.append({"label": "LESION",
			"value": int(round((float(m["injury_mult"]) - 1.0) * 100.0)),
			"suffix": "%", "lower_better": true, "icon": "botiquin"})
	if int(m.get("money_bonus", 0)) > 0:
		out.append({"label": "BANCO", "value": int(m["money_bonus"]), "icon": "moneda"})
	return out




static func _boot_by_id(id: String) -> Dictionary:
	for b in Shop.BOOTS:
		if String(b.get("id", "")) == id:
			return b
	return {}





static func mult_of(ids: Array, key: String, base: float = 1.0) -> float:
	var out: float = base
	for raw in ids:
		var m: Dictionary = by_id(String(raw))
		if m.has(key):
			out *= float(m[key])
	return out
