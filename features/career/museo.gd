class_name Museo
extends RefCounted


































const PALETA: Dictionary = {





	"floor": Color("24282f"),
	"wall": Color("ded7c8"),
	"trim": Color("ad915d"),






	"wood": Color("101319"),
	"fabric": Color("572b36"),
	"metal": Color("c8bca3"),
	"rug": Color("572b36"),
}






const LUZ: Dictionary = {
	"amb": Color("eee7d8"), "amb_e": 0.6,
	"sun": Color("fff4df"), "sun_e": 0.24, "bg": Color("101218"),
}




const CARA_DIR: Array[Vector2] = [
	Vector2(0.0, -1.0), Vector2(-1.0, 0.0), Vector2(0.0, 1.0), Vector2(1.0, 0.0),
]









const KIND_FAN: String = "visitante"


const FAN_R: float = 0.28


const FANS_MAX: int = 12

const FANS_MIN: int = 2



const FAN_FRENTE: float = 1.15






const VESTIBULO: Rect2 = Rect2(-5.0, 0.0, 10.0, 6.0)







const NAVE_W: float = 3.5


const NAVE_MIN: float = 12.0


const FILA_Z: float = 3.5

const HUECO_X: float = 1.1

const MARGEN_Z: float = 1.0


const ABSIDE_W: float = 4.0
const ABSIDE_Z: float = 6.0


const ALA_W: float = 6.0
const ALA_Z: float = 8.0

const ALA_OFF: float = 3.0




const ALA_VANO_OFF: float = 2.5
const ALA_VANO: float = 3.0



const BALONES_POR_MUEBLE: int = 32











static func planta(cab: Dictionary = {}, balones: int = 0) -> Dictionary:
	var vitrinas: Array = _vitrinas(cab)
	var n_bal: int = int(ceil(float(maxi(0, balones)) / float(BALONES_POR_MUEBLE)))


	var fondo_bal: float = maxf(ALA_Z, ceilf(1.0 + float(n_bal) *(3.0 + HUECO_X)))
	var largo: float = maxf(NAVE_MIN, _reparte(vitrinas) + MARGEN_Z)
	if n_bal > 0:
		largo = maxf(largo, ALA_OFF + fondo_bal + MARGEN_Z)
	var z_nave: float = VESTIBULO.end.y
	var nave: Rect2 = Rect2(- NAVE_W, z_nave, NAVE_W * 2.0, largo)
	var abside: Rect2 = Rect2(- ABSIDE_W, nave.end.y, ABSIDE_W * 2.0, ABSIDE_Z)
	var rooms: Array = [
		{"id": "vestibulo", "label": "VESTÍBULO", "rect": VESTIBULO},
		{"id": "nave", "label": "TROFEOS", "rect": nave},
		{"id": "abside", "label": "TU LEGADO", "rect": abside},
	]



	var ala_e: Rect2 = Rect2(NAVE_W, z_nave + ALA_OFF, ALA_W, ALA_Z)
	ala_e.size.y = minf(ALA_Z, nave.end.y - ala_e.position.y)
	if ala_e.size.y >= 4.0:
		rooms.append({"id": "ala_este", "label": "CAMISETAS", "rect": ala_e})
	else:
		ala_e = Rect2()

	var ala_o: Rect2 = Rect2()
	if n_bal > 0:
		ala_o = Rect2(- NAVE_W - ALA_W, z_nave + ALA_OFF, ALA_W, fondo_bal)
		if ala_o.size.y >= 4.0:
			rooms.append({"id": "ala_oeste", "label": "HAT-TRICKS", "rect": ala_o})
		else:
			ala_o = Rect2()
	return {
		"rooms": rooms,
		"props": _props(vitrinas, z_nave, abside, ala_o, ala_e, n_bal),
		"tabiques": _tabiques(ala_o, ala_e),
		"aberturas": [],




		"ventanas": [],
		"puerta": Vector2(0.0, VESTIBULO.position.y),
	}




static func _vitrinas(cab: Dictionary) -> Array:
	var out: Array = []
	for fam in ["team", "individual"]:
		var slot: String = "trofeos" if fam == "team" else "premios"
		for row in (cab.get(fam, []) as Array):
			var r: Dictionary = row as Dictionary
			var n: int = int(r.get("count", 0))



			if n <= 0:
				continue
			var kind: String = _mueble_para(n)
			out.append({
				"kind": kind,
				"slot": slot,
				"acepta":(r.get("keys", []) as Array).duplicate(),
				"ancho": House.blueprint_of(kind).x,
				"id": "vit_%s_%d" % [fam, out.size()],
			})
	return out




static func _mueble_para(n: int) -> String:
	if n >= 7:
		return "vitrina_galeria"
	if n >= 3:
		return "vitrina"
	return "vitrina_torre"

































static func _reparte(vitrinas: Array) -> float:
	var z: float = MARGEN_Z
	var i: int = 0
	while i < vitrinas.size():
		var a: Dictionary = vitrinas[i] as Dictionary
		var b: Dictionary = vitrinas[i + 1] as Dictionary \
				if i + 1 < vitrinas.size() else {}
		var ancho: float = float(a["ancho"])
		if not b.is_empty():
			ancho = maxf(ancho, float(b["ancho"]))
		z = _fuera_del_vano(z, ancho)
		a["lado"] = 0
		a["z"] = z +(ancho - float(a["ancho"])) * 0.5
		if not b.is_empty():
			b["lado"] = 1
			b["z"] = z +(ancho - float(b["ancho"])) * 0.5
		z += ancho + HUECO_X
		i += 2
	return z





static func _fuera_del_vano(z: float, ancho: float) -> float:
	var desde: float = ALA_OFF + ALA_VANO_OFF - VANO_AIRE
	var hasta: float = ALA_OFF + ALA_VANO_OFF + ALA_VANO + VANO_AIRE
	if z + ancho > desde and z < hasta:
		return hasta
	return z




const VANO_AIRE: float = 0.5






static func _tabiques(ala_o: Rect2, ala_e: Rect2) -> Array:
	var out: Array = []
	for ala in [ala_o, ala_e]:
		var r: Rect2 = ala as Rect2
		if r.size.x <= 0.0:
			continue
		var x: float = r.end.x if r.position.x < 0.0 else r.position.x
		var a: Vector2 = Vector2(x, r.position.y)
		var b: Vector2 = Vector2(x, r.end.y)
		out.append_array(House.split_wall([a, b],
			Vector2(x, r.position.y + ALA_VANO_OFF), "arco", ALA_VANO))
	return out




static func _props(vitrinas: Array, z_nave: float, abside: Rect2, ala_o: Rect2,
		ala_e: Rect2, n_bal: int) -> Array:
	var out: Array = []



	out.append(_colgado("placa_fichaje", "placa_fichaje", -4.4, VESTIBULO.position.y, 2))
	out.append(_colgado("cartel_partido", "cartel_partido", 2.9, VESTIBULO.position.y, 2))
	out.append(_colgado("escudo_v", "escudo_muro", -2.6, VESTIBULO.position.y, 2))
	out.append(_colgado("banderines_v", "banderines", 0.9, VESTIBULO.position.y, 2))
	out.append(_pieza("planta_v1", "planta", -4.5, 4.6))
	out.append(_pieza("planta_v2", "planta", 4.0, 4.6))


	out.append(_pieza("banco_v1", "butaca_estadio", -3.4, 1.1))
	out.append(_pieza("banco_v2", "butaca_estadio", 1.9, 1.1))





	out.append(_colgado_x("bufandas_v", "bufandas", 2.4, VESTIBULO.position.x, true))
	out.append(_colgado_x("cuadro_v", "cuadro", 2.8, VESTIBULO.end.x, false))





	var expositores: Array = []
	for v in vitrinas:
		var d: Dictionary = v as Dictionary
		var oeste: bool = int(d["lado"]) == 0
		var p: Dictionary = _pieza(String(d["id"]), String(d["kind"]), 0.0, 0.0,
			String(d["slot"]), d["acepta"] as Array)

		p["exhibicion_museo"] = true
		var s2: Vector2 =(p["rect"] as Rect2).size

		p["face"] = 3 if oeste else 1
		p["rect"] = Rect2(
			- NAVE_W + House.TABIQUE_T * 0.5 if oeste else NAVE_W - s2.y - House.TABIQUE_T * 0.5,
			z_nave + float(d["z"]), s2.y, s2.x)
		out.append(p)
		expositores.append(p)




	for lado in 2:
		var ocupado: bool = false
		for v in vitrinas:
			var d: Dictionary = v as Dictionary
			if int(d["lado"]) == lado and float(d["z"]) < ALA_OFF:
				ocupado = true
				break
		if not ocupado:
			out.append(_colgado_x("muro_o0" if lado == 0 else "muro_e0",
				"tapiz" if lado == 0 else "mapa_giras", z_nave + 0.6,
				- NAVE_W if lado == 0 else NAVE_W, lado == 0))




	if ala_o.size.x > 0.0:
		for i in n_bal:
			var zb: float = ala_o.position.y + 1.0 + float(i) *(3.0 + HUECO_X)


			var pb: Dictionary = _pieza("bal_%d" % i, "balones_museo", 0.0, 0.0)
			var tam: Vector2 =(pb["rect"] as Rect2).size
			pb["face"] = 3
			pb["rect"] = Rect2(ala_o.position.x, zb, tam.y, tam.x)
			out.append(pb)
			expositores.append(pb)
		out.append(_colgado("giras_bal", "mapa_giras", ala_o.position.x + 2.0,
			ala_o.position.y, 2))
		out.append(_pieza("butaca_bal", "butaca_estadio", ala_o.end.x - 1.8,
			ala_o.position.y + 0.8))






	if ala_e.size.x > 0.0:
		for i in 3:
			out.append(_colgado("play_n%d" % i, "playera",
				ala_e.position.x + 0.45 + float(i) * 1.8, ala_e.end.y, 0))
		for i in 3:
			out.append(_colgado_x("play_e%d" % i, "playera",
				ala_e.position.y + 1.0 + float(i) * 2.0, ala_e.end.x, false))





		for i in 2:
			out.append(_colgado("play_s%d" % i, "playera",
				ala_e.position.x + 0.5 + float(i) * 1.8, ala_e.position.y, 2))
		var casillero: Dictionary = _pieza("casillero", "casillero", 0.0, 0.0)
		var tam: Vector2 =(casillero["rect"] as Rect2).size
		casillero["face"] = 3
		casillero["rect"] = Rect2(ala_e.position.x + House.TABIQUE_T * 0.5,
			ala_e.position.y + 0.7, tam.y, tam.x)
		out.append(casillero)
		out.append(_colgado("botines", "botines_muro",
			ala_e.end.x - 1.7, ala_e.position.y, 2))
		out.append(_pieza("butaca_camisetas", "butaca_estadio",
			ala_e.position.x + 2.3, ala_e.position.y + 4.5))










	out.append(_colgado("pantalla", "tv_muro", -0.75, abside.end.y, 0))
	for fila in [["butaca_o", -2.5], ["butaca_c", -0.75], ["butaca_e", 1.0]]:
		var asiento: Dictionary = _pieza(String(fila[0]), "butaca_estadio",
			float(fila[1]), abside.end.y - 2.4)

		asiento["face"] = 2
		out.append(asiento)

	out.append(_pieza("maqueta", "maqueta", abside.position.x + 0.5,
		abside.position.y + 1.8))
	out.append(_colgado_x("tifo", "tifo_enmarcado", abside.position.y + 1.0,
		abside.position.x, true))
	out.append(_colgado_x("escudo_ab", "escudo_muro", abside.position.y + 1.3,
		abside.end.x, false))
	out.append(_pieza("planta_ab1", "planta", abside.position.x + 0.5, abside.end.y - 0.9))
	out.append(_pieza("planta_ab2", "planta", abside.end.x - 1.0, abside.end.y - 0.9))


	out.append_array(_visitantes(expositores))
	return out








static func _visitantes(expositores: Array) -> Array:
	var out: Array = []
	var n: int = clampi(expositores.size(), FANS_MIN, FANS_MAX)
	for i in n:
		var punto: Vector2
		if expositores.is_empty():

			punto = Vector2(-1.5 + float(i) * 3.0, VESTIBULO.end.y - 1.6)
		else:



			var mueble: Dictionary = expositores[i % expositores.size()]
			var r: Rect2 = mueble["rect"]
			var cara: int = int(mueble.get("face", 0))&3
			var dir: Vector2 = CARA_DIR[cara]


			var lat: Vector2 = Vector2(- dir.y, dir.x) *(0.45 if i % 2 == 0 else -0.45)
			punto = r.get_center() + Vector2(
				dir.x *(r.size.x * 0.5 + FAN_FRENTE),
				dir.y *(r.size.y * 0.5 + FAN_FRENTE)) + lat
		out.append({
			"id": "fan_%d" % i,
			"kind": KIND_FAN,
			"rect": Rect2(punto.x - FAN_R, punto.y - FAN_R, FAN_R * 2.0, FAN_R * 2.0),
			"slot": "", "tiers": 0, "cap": 1, "pass": false,
		})
	return out







static func _pieza(id: String, kind: String, x: float, z: float,
		slot: String = "", acepta: Array = []) -> Dictionary:
	var tpl: Dictionary = House.blueprint_prop(kind)
	var size: Vector2 = tpl.get("size", Vector2(1.0, 0.5))
	var p: Dictionary = {"id": id, "kind": kind,
		"rect": Rect2(x, z, size.x, size.y),
		"slot": slot if not slot.is_empty() else String(tpl.get("slot", "")),
		"tiers": int(tpl.get("tiers", 0)),
		"cap": int(tpl.get("cap", 1)),





		"pass": bool(tpl.get("pass", false)) \
				or House.SOFT_KINDS.has(kind) or House.CIELO_KINDS.has(kind)}
	if not acepta.is_empty():
		p["acepta"] = acepta


	p["face_fab"] = House.base_face(p)
	var y: float = float(tpl.get("y", 0.0))
	if y > 0.0:
		p["y"] = y
	return p











static func _colgado_x(id: String, kind: String, z: float, x_muro: float,
		hacia_este: bool) -> Dictionary:
	var p: Dictionary = _pieza(id, kind, 0.0, 0.0)
	var s: Vector2 =(p["rect"] as Rect2).size

	p["face"] = 3 if hacia_este else 1
	p["rect"] = Rect2(x_muro if hacia_este else x_muro - s.y, z, s.y, s.x)
	p["pass"] = true
	return p






static func _colgado(id: String, kind: String, x: float, z_muro: float,
		face: int) -> Dictionary:
	var p: Dictionary = _pieza(id, kind, x, z_muro)
	var r: Rect2 = p["rect"] as Rect2
	r.position.y = z_muro - r.size.y if face == 0 else z_muro
	p["rect"] = r
	p["face"] = face

	p["pass"] = true
	return p
