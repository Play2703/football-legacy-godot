extends ScoreboardFinal




























const FILA_S: float = 96.0
const BUSTO: Vector2 = Vector2(76.0, 92.0)
const T_NOMBRE: Array[int] = [40, 32, 24, 16]
const T_CIFRA: int = 56
const CIFRA_W: float = 180.0


var textos: PackedStringArray = PackedStringArray()










func pinta(d: Dictionary) -> void:
	for c in get_children():
		remove_child(c)
		c.queue_free()
	_capas.clear()
	textos = PackedStringArray()
	var bg: Color = d.get("bg", Color("0d1118")) as Color
	var ink: Color = d.get("ink", Color("ffd54a")) as Color
	var manual: bool = bool(d.get("manual", false))
	var claro: Color = ink if manual else BLANCO
	var acc: Color = d.get("acc", ink) as Color
	var acc_txt: Color = ink if manual else CareerTheme.text_on_dark(acc)

	var fondo: ColorRect = ColorRect.new()
	fondo.color = bg
	fondo.size = Vector2(W, H)
	add_child(fondo)



	var franja: Array = []
	var velo: ColorRect = ColorRect.new()
	velo.color = Color(ink, 0.08) if manual else Color(acc.r, acc.g, acc.b, 0.22)
	velo.size = Vector2(W, FRANJA_H)
	add_child(velo)
	franja.append(velo)
	var marca: String = String(d.get("marca", ""))
	var marca_w: float = minf(ceilf(_ancho(marca, T_FRANJA)), W * 0.6)
	franja.append(_pon(marca, ink, T_FRANJA, Vector2(W - MARGEN - marca_w, 0.0),
		Vector2(marca_w, FRANJA_H), HORIZONTAL_ALIGNMENT_RIGHT))
	franja.append(_pon(String(d.get("franja", "")), acc_txt, T_FRANJA,
		Vector2(MARGEN, 0.0), Vector2(maxf(W - MARGEN * 2.0 - marca_w - 16.0, 0.0),
			FRANJA_H), HORIZONTAL_ALIGNMENT_LEFT))
	_capas.append(franja)



	var filas: Array = d.get("filas", []) as Array
	var aire: float = maxf(H - FRANJA_H - 2.0 * FILA_S, 0.0) / 3.0
	var y: float = FRANJA_H + aire
	var x0: float = MARGEN + BUSTO.x + 16.0


	var cifra_w: float = CIFRA_W
	for fv in filas:
		var fd: Dictionary = fv as Dictionary if fv is Dictionary else {}
		cifra_w = maxf(cifra_w, ceilf(_ancho(str(int(fd.get("valor", 0))), T_CIFRA)))
	var nom_w: float = W - x0 - MARGEN - cifra_w - 12.0
	for i in 2:
		var f: Dictionary = filas[i] as Dictionary if i < filas.size() else {}
		var capa: Array = []
		var busto: PlayerAvatar = PlayerAvatar.new()
		busto.chrome = false
		busto.mouse_filter = Control.MOUSE_FILTER_IGNORE
		busto.position = Vector2(MARGEN, y +(FILA_S - BUSTO.y) * 0.5)
		busto.size = BUSTO


		var club_v: Variant = f.get("club", {})
		busto.club = club_v if club_v is Dictionary else {}
		add_child(busto)
		var look_v: Variant = f.get("look", {})
		if look_v is Dictionary and not (look_v as Dictionary).is_empty():
			busto.set_look(look_v as Dictionary)
		capa.append(busto)


		var nombre: String = CareerTheme.caps(String(f.get("nombre", "")))
		capa.append(_pon(nombre, claro, _cabe(nombre, T_NOMBRE, nom_w), Vector2(x0, y),
			Vector2(nom_w, FILA_S), HORIZONTAL_ALIGNMENT_LEFT))
		capa.append(_pon(str(int(f.get("valor", 0))), ink, T_CIFRA,
			Vector2(W - MARGEN - cifra_w, y), Vector2(cifra_w, FILA_S),
			HORIZONTAL_ALIGNMENT_RIGHT))
		_capas.append(capa)
		y += FILA_S
		if i == 0:
			var raya: ColorRect = ColorRect.new()
			raya.color = Color(claro, 0.14)
			raya.position = Vector2(MARGEN, y + aire * 0.5)
			raya.size = Vector2(W - MARGEN * 2.0, 2.0)
			add_child(raya)
			_capas.append([raya])
			y += aire
	_redibuja()



func _pon(txt: String, color: Color, tam: int, pos: Vector2, caja: Vector2,
		align: HorizontalAlignment) -> Label:
	textos.append(txt)
	return _rotulo(txt, color, tam, pos, caja, align)
