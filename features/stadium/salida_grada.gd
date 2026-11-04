extends RefCounted

























const TOPE: int = 40
const TOPE_GRADA: int = 12
const VEL_FILA: Vector2 = Vector2(1.0, 1.3)
const VEL_SUBE: Vector2 = Vector2(0.8, 1.4)


const DELANTE: float = 0.3
const BOTE: float = 0.035
const BOTE_HZ: float = 2.1


const ACCESO_X: float = 1.8

var andando: Array[Dictionary] = []
var _por_grada: Dictionary = {}





static func talud(u: float) -> Vector2:
	var z: float = -2.4 - u
	return Vector2(1.0 +(- z - 1.5) * 1.6 + 0.15 + 0.7, z)



func cabe(grada: Dictionary) -> bool:
	return andando.size() < TOPE and int(_por_grada.get(int(grada["id"]), 0)) < TOPE_GRADA




func echa(nodo: Node3D, temp: bool, grada: Dictionary, asiento: Vector3,
		paraguas: Dictionary = {}) -> void:
	var u: float = -2.4 - asiento.z
	var meta_x: float = _escalera(grada, asiento.x)
	var w: Dictionary = {
		"nodo": nodo, "temp": temp, "gid": int(grada["id"]),
		"x": asiento.x, "u": u - DELANTE,
		"meta_x": meta_x, "meta_u": _salida_u(grada, meta_x, u - DELANTE),
		"fase": 0,
		"vel": randf_range(VEL_FILA.x, VEL_FILA.y),
		"sube": randf_range(VEL_SUBE.x, VEL_SUBE.y),
		"pos0": asiento, "t": randf_range(0.0, 1.0),
		"pmm": null, "pi": -1,
	}
	if nodo is AnimatedSprite3D:
		var spr: AnimatedSprite3D = nodo
		w["anim0"] = spr.animation
		w["vel0"] = spr.speed_scale

		spr.play("idle")
		spr.speed_scale = 1.5
	if not paraguas.is_empty():
		var pmm: MultiMesh = paraguas["mm"]
		var i: int = int(paraguas["i"])
		w["pmm"] = pmm
		w["pi"] = i
		w["pxf"] = pmm.get_instance_transform(i)

		w["poff"] =(w["pxf"] as Transform3D).origin - asiento
		var c: Color = pmm.get_instance_color(i)
		c.a = 1.0
		pmm.set_instance_color(i, c)
	nodo.visible = true


	nodo.set_meta("andando", true)
	andando.append(w)
	_por_grada[int(grada["id"])] = int(_por_grada.get(int(grada["id"]), 0)) + 1
	_pon(w)


func tick(delta: float) -> void:
	for i in range(andando.size() - 1, -1, -1):
		var w: Dictionary = andando[i]
		if not is_instance_valid(w["nodo"]):
			_acaba(w)
			andando.remove_at(i)
			continue
		w["t"] = float(w["t"]) + delta
		if int(w["fase"]) == 0:



			var dx: float = float(w["meta_x"]) - float(w["x"])
			var paso: float = float(w["vel"]) * delta
			if absf(dx) <= paso:
				w["x"] = w["meta_x"]
				w["fase"] = 1
			else:
				w["x"] = float(w["x"]) + signf(dx) * paso
		else:
			var du: float = float(w["meta_u"]) - float(w["u"])
			var paso: float = float(w["sube"]) * delta
			if absf(du) <= paso:
				_acaba(w)
				andando.remove_at(i)
				continue
			w["u"] = float(w["u"]) + signf(du) * paso
		_pon(w)




func suelta(nodo: Node3D) -> void:
	for i in range(andando.size() - 1, -1, -1):
		if andando[i]["nodo"] == nodo:
			_acaba(andando[i])
			andando.remove_at(i)



func limpia() -> void:
	for w in andando:
		_acaba(w)
	andando.clear()
	_por_grada.clear()


func _pon(w: Dictionary) -> void:
	var p: Vector2 = talud(float(w["u"]))
	var nodo: Node3D = w["nodo"]
	nodo.position = Vector3(float(w["x"]),
		p.x + absf(sin(float(w["t"]) * BOTE_HZ * PI)) * BOTE, p.y)
	if w["pmm"] != null:
		(w["pmm"] as MultiMesh).set_instance_transform(int(w["pi"]),
			Transform3D(Basis(), nodo.position +(w["poff"] as Vector3)))


func _acaba(w: Dictionary) -> void:
	var pmm: MultiMesh = w["pmm"]
	if pmm != null:
		var i: int = int(w["pi"])
		pmm.set_instance_transform(i, w["pxf"])
		var c: Color = pmm.get_instance_color(i)
		c.a = 0.0
		pmm.set_instance_color(i, c)
	var nodo: Node3D = w["nodo"]
	if is_instance_valid(nodo):
		nodo.remove_meta("andando")
		if bool(w["temp"]):
			nodo.queue_free()
		else:
			nodo.visible = false
			nodo.position = w["pos0"]
			if nodo is AnimatedSprite3D and w.has("anim0"):
				(nodo as AnimatedSprite3D).play(StringName(w["anim0"]))
				(nodo as AnimatedSprite3D).speed_scale = float(w["vel0"])
	var gid: int = int(w["gid"])
	_por_grada[gid] = maxi(int(_por_grada.get(gid, 1)) - 1, 0)




func _escalera(grada: Dictionary, x: float) -> float:
	var mejor: float = INF
	var meta: float = x
	for ax in grada["aisles"]:
		if absf(float(ax) - x) < mejor:
			mejor = absf(float(ax) - x)
			meta = float(ax)
	if mejor == INF:
		var borde: float = float(grada["length"]) * 0.5 - 0.6
		meta = borde if x >= 0.0 else - borde
	return meta





func _salida_u(grada: Dictionary, ax: float, u: float) -> float:
	var top: float = float(grada["top_u"])
	var box: Vector2 = grada["box"]
	var meta: float = minf(box.x, top) if u < box.x else top
	for a in grada["accesos"]:
		var acc: Vector3 = a
		if absf(acc.x - ax) > ACCESO_X:
			continue
		var boca: float = clampf(u, acc.y, acc.z)
		if absf(boca - u) < absf(meta - u):
			meta = boca
	return meta
