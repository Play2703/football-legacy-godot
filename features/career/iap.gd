class_name Iap
extends RefCounted











































const PREFIJO: String = "mx.cesaralvarez.footballlegacy."



const TIPO_DINERO: String = "dinero"
const TIPO_PUNTOS: String = "puntos"



const TIPO_LOTE: String = "lote"








const TIPO_DERECHO: String = "derecho"







const TIPO_ESTRELLAS: String = "estrellas"








const TIPO_REINICIO: String = "reinicio"










const EDICIONES: Array = [
	{"id": "debut", "name": "EDICIÓN DEBUT", "color": Color("f4f1ec"), "de_pack": true},
	{"id": "ascenso", "name": "EDICIÓN ASCENSO", "color": Color("2f6fd0"), "de_pack": true},
	{"id": "oro", "name": "EDICIÓN ORO", "color": Color("e3b23c"), "de_pack": true},
	{"id": "noche", "name": "EDICIÓN NOCHE", "color": Color("7b3fe4")},
	{"id": "fuego", "name": "EDICIÓN FUEGO", "color": Color("e0482a")},
	{"id": "hielo", "name": "EDICIÓN HIELO", "color": Color("9fd8ef")},
	{"id": "neon", "name": "EDICIÓN NEÓN", "color": Color("d94f97")},
]








const LOTES: Array = [
	{"id": "pack_debut", "pid": PREFIJO + "pack_debut", "tipo": TIPO_LOTE, "mxn": 49,
		"icon": "bota_potencia", "name": "PACK DEBUT", "grupo": "pack",
		"entrega": {"dinero": 300000, "puntos": 15, "ediciones": ["debut"], "botas": ["barrio"]}},
	{"id": "pack_ascenso", "pid": PREFIJO + "pack_ascenso", "tipo": TIPO_LOTE, "mxn": 149,
		"icon": "bota_precision", "name": "PACK ASCENSO", "grupo": "pack",
		"entrega": {"dinero": 1500000, "puntos": 50, "ediciones": ["ascenso"], "botas": ["eclipse"]}},
	{"id": "pack_balon_oro", "pid": PREFIJO + "pack_balon_oro", "tipo": TIPO_LOTE, "mxn": 499,
		"icon": "corona", "name": "PACK JUGADOR DEL AÑO", "grupo": "pack",
		"entrega": {"dinero": 10000000, "puntos": 150, "ediciones": ["oro"], "botas": ["zenit"]}},
	{"id": "botas_noche", "pid": PREFIJO + "botas_noche", "tipo": TIPO_LOTE, "mxn": 29,
		"icon": "bota_efecto", "name": "EDICIÓN NOCHE", "grupo": "coleccion",
		"entrega": {"ediciones": ["noche"]}},
	{"id": "botas_fuego", "pid": PREFIJO + "botas_fuego", "tipo": TIPO_LOTE, "mxn": 29,
		"icon": "bota_potencia", "name": "EDICIÓN FUEGO", "grupo": "coleccion",
		"entrega": {"ediciones": ["fuego"]}},
	{"id": "botas_hielo", "pid": PREFIJO + "botas_hielo", "tipo": TIPO_LOTE, "mxn": 29,
		"icon": "bota_precision", "name": "EDICIÓN HIELO", "grupo": "coleccion",
		"entrega": {"ediciones": ["hielo"]}},
	{"id": "botas_neon", "pid": PREFIJO + "botas_neon", "tipo": TIPO_LOTE, "mxn": 29,
		"icon": "bota_efecto", "name": "EDICIÓN NEÓN", "grupo": "coleccion",
		"entrega": {"ediciones": ["neon"]}},
]
























const PACKS: Array = [












	{"id": "dinero_prima", "pid": PREFIJO + "dinero_prima", "tipo": TIPO_DINERO,
		"cuanto": 250000, "mxn": 19, "icon": "moneda",
		"name": "PRIMA DE PARTIDO",
		"desc": "Para lo que te falta hoy: unas botas, o el gel y la bebida antes del derbi."},
	{"id": "dinero_bono", "pid": PREFIJO + "dinero_bono", "tipo": TIPO_DINERO,
		"cuanto": 1200000, "mxn": 59, "icon": "caja",
		"name": "BONO DE CONTRATO",
		"desc": "El deportivo, o unas botas de las buenas con repuesto para toda la temporada."},
	{"id": "dinero_fichaje", "pid": PREFIJO + "dinero_fichaje", "tipo": TIPO_DINERO,
		"cuanto": 4000000, "mxn": 179, "icon": "contrato_firma",
		"name": "FICHAJE",
		"desc": "Alcanza para el preparador físico, o para subir de escalón con tu agente."},
	{"id": "dinero_traspaso", "pid": PREFIJO + "dinero_traspaso", "tipo": TIPO_DINERO,
		"cuanto": 12500000, "mxn": 449, "icon": "caja_abierta",
		"name": "TRASPASO RÉCORD",
		"desc": "La clínica y el analista de vídeo, de una sentada."},
	{"id": "dinero_clausula", "pid": PREFIJO + "dinero_clausula", "tipo": TIPO_DINERO,
		"cuanto": 30000000, "mxn": 999, "icon": "corona",
		"name": "CLÁUSULA DE RESCISIÓN",
		"desc": "El agente que te sienta con los grandes de Europa, pagado de golpe."},






















	{"id": "puntos_sesion", "pid": PREFIJO + "puntos_sesion", "tipo": TIPO_PUNTOS,
		"cuanto": 12, "mxn": 29, "icon": "potencia",
		"name": "SESIÓN EXTRA",
		"desc": "Cuatro niveles de golpe. Para rematar la habilidad que traes a medias."},
	{"id": "puntos_pretemporada", "pid": PREFIJO + "puntos_pretemporada", "tipo": TIPO_PUNTOS,
		"cuanto": 50, "mxn": 79, "icon": "fisico",
		"name": "PRETEMPORADA",
		"desc": "Sube una habilidad entera de 60 a 85, o reparte donde más duela."},
	{"id": "puntos_campo", "pid": PREFIJO + "puntos_campo", "tipo": TIPO_PUNTOS,
		"cuanto": 150, "mxn": 179, "icon": "cancha",
		"name": "CAMPO DE ENTRENAMIENTO",
		"desc": "Una habilidad de 60 a 99, y todavía sobra para empezar la siguiente."},
	{"id": "puntos_talento", "pid": PREFIJO + "puntos_talento", "tipo": TIPO_PUNTOS,
		"cuanto": 300, "mxn": 399, "icon": "media",
		"name": "TALENTO GENERACIONAL",
		"desc": "Trescientos puntos. Casi la mitad de todo lo que se puede subir en una carrera."},
]




































const COMBO: Dictionary = {
	"id": "pack_doble", "pid": PREFIJO + "pack_doble",
	"tipo": TIPO_DINERO, "cuanto": 700000, "puntos_extra": 25,
	"mxn": 99, "icon": "estilo",
	"name": "PACK DOBLE",
	"desc": "Las dos monedas en una compra, y sale mejor que por separado.",
}





















const ESTRELLAS: Array = [
	{"id": "estrellas_punado", "pid": PREFIJO + "estrellas_punado", "tipo": TIPO_ESTRELLAS,
		"cuanto": 150, "mxn": 19, "icon": "vitrina",
		"name": "UN PUÑADO DE ESTRELLAS",
		"desc": "Ciento cincuenta estrellas: tu primera ventaja, la de nivel 1, sin esperar al primer retiro."},
]




























const REINICIO: Dictionary = {
	"id": "reinicio_partido", "pid": PREFIJO + "reinicio_partido",
	"tipo": TIPO_REINICIO, "cuanto": 1, "mxn": 39, "icon": "reiniciar",
	"name": "REINICIAR PARTIDO", "a_la_venta": false,
}






























const DERECHO_VENTAJAS: Dictionary = {
	"id": "ventajas_todas", "pid": PREFIJO + "ventajas_todas",
	"tipo": TIPO_DERECHO,
	"mxn": 149, "icon": "leyendas",
	"name": "TODAS LAS VENTAJAS",
	"desc": "Abre de golpe la vitrina entera de NUEVA CARRERA+, sin esperar a sus logros.",
}












const DERECHO_DOBLE_PAGA: Dictionary = {
	"id": "doble_paga", "pid": PREFIJO + "doble_paga",
	"tipo": TIPO_DERECHO,
	"mxn": 149, "icon": "moneda",
	"name": "DOBLE PAGA",
	"desc": "Sueldo, primas y patrocinios ×2 en todas tus carreras, las de hoy y las que vengan.",
}












const DERECHO_DOBLE_XP: Dictionary = {
	"id": "doble_xp", "pid": PREFIJO + "doble_xp",
	"tipo": TIPO_DERECHO,
	"mxn": 149, "icon": "media",
	"name": "DOBLE XP",
	"desc": "La XP de cada partido ×2 en todas tus carreras, las de hoy y las que vengan.",
}












const DERECHO_PACK_LEYENDA: Dictionary = {
	"id": "pack_leyenda", "pid": PREFIJO + "pack_leyenda",
	"tipo": TIPO_DERECHO,
	"mxn": 249, "icon": "leyendas",
	"name": "PACK LEYENDA",
	"desc": "DOBLE PAGA y DOBLE XP juntos, en todas tus carreras, las de hoy y las que vengan.",
	"incluye": ["doble_paga", "doble_xp"],
}








const DERECHO_CUARTA_RANURA: Dictionary = {
	"id": "cuarta_ranura", "pid": PREFIJO + "cuarta_ranura",
	"tipo": TIPO_DERECHO,
	"mxn": 49, "icon": "otra",
	"name": "CUARTA RANURA",
	"desc": "Una cuarta ranura en la portada, para llevar otra carrera a la vez.",
}






const DERECHOS_LEGADO: Array = [DERECHO_DOBLE_PAGA, DERECHO_DOBLE_XP, DERECHO_PACK_LEYENDA,
	DERECHO_CUARTA_RANURA]






static func ahorro(d: Dictionary) -> int:
	var sueltas: int = 0
	for id in d.get("incluye", []):
		for p in DERECHOS_LEGADO:
			if String((p as Dictionary)["id"]) == String(id):
				sueltas += int((p as Dictionary)["mxn"])
	if sueltas <= 0:
		return 0
	return maxi(0, int(round(100.0 *(1.0 - float(d["mxn"]) / float(sueltas)))))











const LEGADO_VENDE_HERENCIA: bool = false



















const MXN_VENTAJA: Dictionary = {1: 19, 2: 29, 3: 59, 4: 99}
static var _derechos_herencia: Array = []
static var _derechos_sueltos: Array = []


static func derechos_herencia() -> Array:
	if not _derechos_herencia.is_empty():
		return _derechos_herencia
	var out: Array = []
	for p in Herencia.PACKS:
		var pd: Dictionary = p as Dictionary
		out.append(_derecho_de(String(pd["id"]), String(pd["icon"]), String(pd["name"]),
			String(pd["desc"]), int(pd["mxn"])))
	_derechos_herencia = out
	return out




static func derechos_herencia_sueltos() -> Array:
	if not _derechos_sueltos.is_empty():
		return _derechos_sueltos
	var out: Array = []
	for m in Rebirth.MODIFIERS:
		var d: Dictionary = m as Dictionary
		out.append(_derecho_de(String(d["id"]), String(d["icon"]), String(d["name"]),
			String(d["desc"]), int(MXN_VENTAJA[int(d.get("tier", 1))])))
	for k in Herencia.KITS:
		var kd: Dictionary = k as Dictionary
		out.append(_derecho_de(String(kd["id"]), String(kd["icon"]), String(kd["name"]),
			String(kd["desc"]), int(MXN_VENTAJA[int(kd.get("tier", 1))])))
	_derechos_sueltos = out
	return out


static func _derecho_de(id: String, icon: String, name: String, desc: String, mxn: int) -> Dictionary:
	return {"id": "herencia_" + id, "pid": PREFIJO + "herencia_" + id, "tipo": TIPO_DERECHO,
		"herencia": id, "mxn": mxn, "icon": icon, "name": name, "desc": desc}




static func derecho_herencia(herencia_id: String) -> Dictionary:
	for d in derechos_herencia():
		if String((d as Dictionary)["herencia"]) == herencia_id:
			return d as Dictionary
	return {}





static func product_ids() -> PackedStringArray:
	var out: PackedStringArray = PackedStringArray()
	for p in PACKS:
		out.append(String((p as Dictionary)["pid"]))
	out.append(String(COMBO["pid"]))
	for p in LOTES:
		out.append(String((p as Dictionary)["pid"]))
	out.append(String(DERECHO_VENTAJAS["pid"]))
	for d in DERECHOS_LEGADO:
		out.append(String((d as Dictionary)["pid"]))
	for p in ESTRELLAS:
		out.append(String((p as Dictionary)["pid"]))
	out.append(String(REINICIO["pid"]))
	for p in derechos_herencia() + derechos_herencia_sueltos():
		out.append(String((p as Dictionary)["pid"]))
	return out



static func lotes_de(grupo: String) -> Array:
	var out: Array = []
	for p in LOTES:
		if String((p as Dictionary).get("grupo", "")) == grupo:
			out.append(p)
	return out



static func edicion(id: String) -> Dictionary:
	for e in EDICIONES:
		if String((e as Dictionary)["id"]) == id:
			return e as Dictionary
	return {}




static func de_tipo(tipo: String) -> Array:
	var out: Array = []
	for p in PACKS:
		var d: Dictionary = p as Dictionary
		if String(d["tipo"]) == tipo and not bool(d.get("retirado", false)):
			out.append(d)
	return out
















static func peso_de(pid: String) -> float:
	var p: Dictionary = by_product(pid)
	if p.is_empty():
		return 0.0
	var maxi_mxn: int = int(COMBO["mxn"])
	var mini_mxn: int = maxi_mxn
	for q in PACKS + LOTES:
		var v: int = int((q as Dictionary).get("mxn", 0))
		maxi_mxn = maxi(maxi_mxn, v)
		mini_mxn = mini(mini_mxn, v)
	if maxi_mxn <= mini_mxn:
		return 0.0
	return clampf(float(int(p.get("mxn", 0)) - mini_mxn)
		/ float(maxi_mxn - mini_mxn), 0.0, 1.0)



static func by_id(id: String) -> Dictionary:
	if id == String(COMBO["id"]):
		return COMBO
	for p in PACKS + LOTES:
		if String((p as Dictionary)["id"]) == id:
			return p as Dictionary
	return {}





static func by_product(pid: String) -> Dictionary:
	if pid == String(COMBO["pid"]):
		return COMBO
	if pid == String(DERECHO_VENTAJAS["pid"]):
		return DERECHO_VENTAJAS
	if pid == String(REINICIO["pid"]):
		return REINICIO
	for p in PACKS + LOTES + ESTRELLAS + DERECHOS_LEGADO + derechos_herencia() + derechos_herencia_sueltos():
		if String((p as Dictionary)["pid"]) == pid:
			return p as Dictionary
	return {}




static func es_estrellas(pid: String) -> bool:
	return String(by_product(pid).get("tipo", "")) == TIPO_ESTRELLAS




static func es_reinicio(pid: String) -> bool:
	return String(by_product(pid).get("tipo", "")) == TIPO_REINICIO





static func es_derecho(pid: String) -> bool:
	return String(by_product(pid).get("tipo", "")) == TIPO_DERECHO










static func bono(p: Dictionary) -> int:
	var fam: Array = de_tipo(String(p.get("tipo", "")))
	if fam.is_empty():
		return 0
	var base: Dictionary = fam[0] as Dictionary
	var base_ratio: float = float(base["cuanto"]) / float(base["mxn"])
	if base_ratio <= 0.0:
		return 0
	var ratio: float = float(p["cuanto"]) / float(p["mxn"])
	return maxi(0, int(round(100.0 *(ratio / base_ratio - 1.0))))
