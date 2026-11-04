extends "res://ui/ceremonies/tertulia.gd"













func _angulo() -> String:
	var a: String = String(data.get("angulo", ""))
	return a if ProgramasTele.FRASES.has(a) else _angulo_de_serie()


func _angulo_de_serie() -> String:
	return ProgramasTele.PARTE


func _score_de_serie() -> float:
	return ProgramasTele.nota_de(_angulo(), data)


func _panel_de_serie() -> Array:
	return ProgramasTele.panel(_angulo(), _score_de_serie(), _args_de_serie())



func _args_de_serie() -> Array:
	return []


func _con_losa() -> bool:
	return false



func _noticias() -> Array[String]:
	var partes: Array[String] = _titulares_propios()
	partes.append(CareerTheme.caps(Career.player_name))
	partes.append(_tema())
	partes.append(_rotulo())
	return partes


func _titulares_propios() -> Array[String]:
	return []



func _monta_ficha() -> void:
	card_title(_titulo(), 40)
	card_sub(I18n.tf("{0} · TEMPORADA {1}", [team_name("?").to_upper(), _season()]),
		_color_veredicto(_veredicto()))
	var cifras: Array = _cifras_ficha()
	if not cifras.is_empty():
		card_stats(cifras)
	card_note(_nota_final())


func _cifras_ficha() -> Array:
	return []





func _fila_club(p: Pantalla, club_id: String, px: int = CareerTheme.T_HEAD,
		pastilla: String = "", col_pastilla: Color = CareerTheme.DANGER) -> Control:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	var club: Dictionary = Teams.by_id(club_id)
	var esc: CrestView = CrestView.new()
	esc.custom_minimum_size = Vector2(px + 14, px + 14)
	esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	esc.set_team(club)
	fila.add_child(esc)
	var nom: Label = p._texto(Nations.team_label(club, "?").to_upper(), px, CareerTheme.TEXT)
	nom.clip_text = true
	nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nom.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(nom)
	if not pastilla.is_empty():
		fila.add_child(_pastilla(p, pastilla, col_pastilla, CareerTheme.T_CAPTION))
	return fila



func _seccion(p: Pantalla, txt: String) -> Label:
	var l: Label = p._texto(CareerTheme.caps(txt), CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
	l.clip_text = true
	return l






class Campito extends Control:

	var marca: String = ""
	var acento: Color = CareerTheme.accent()

	func _draw() -> void:
		var r: Rect2 = Rect2(Vector2.ZERO, size).grow(-6.0)
		draw_rect(r, Color(0, 0, 0, 0.38))
		var linea: Color = Color(1, 1, 1, 0.55)
		draw_rect(r, linea, false, 3.0)
		var cx: float = r.position.x + r.size.x * 0.5
		var mitad: float = r.position.y + r.size.y * 0.5
		draw_line(Vector2(r.position.x, mitad), Vector2(r.end.x, mitad), linea, 2.0)
		draw_arc(Vector2(cx, mitad), r.size.x * 0.16, 0.0, TAU, 40, linea, 2.0)

		var aw: float = r.size.x * 0.56
		var ah: float = r.size.y * 0.16
		draw_rect(Rect2(cx - aw * 0.5, r.position.y, aw, ah), linea, false, 2.0)
		draw_rect(Rect2(cx - aw * 0.5, r.end.y - ah, aw, ah), linea, false, 2.0)
		var pw: float = r.size.x * 0.26
		var ph: float = r.size.y * 0.06
		draw_rect(Rect2(cx - pw * 0.5, r.position.y, pw, ph), linea, false, 2.0)
		draw_rect(Rect2(cx - pw * 0.5, r.end.y - ph, pw, ph), linea, false, 2.0)

		var gw: float = r.size.x * 0.14
		draw_rect(Rect2(cx - gw * 0.5, r.position.y - 10.0, gw, 10.0), Color(1, 1, 1, 0.85))
		var punto: Vector2 = Vector2(cx, r.position.y + r.size.y * 0.11)
		draw_circle(punto, 3.0, linea)
		match marca:
			"roja":

				var c: Vector2 = Vector2(cx + r.size.x * 0.12, r.position.y + r.size.y * 0.3)
				var tr: Transform2D = Transform2D(-0.22, c)
				draw_set_transform_matrix(tr)
				draw_rect(Rect2(-20, -28, 40, 56), CareerTheme.DANGER)
				draw_rect(Rect2(-20, -28, 40, 56), Color(1, 1, 1, 0.8), false, 2.0)
				draw_set_transform_matrix(Transform2D.IDENTITY)
			"penal":

				var fuera: Vector2 = Vector2(cx + gw * 0.5 + 18.0, r.position.y - 2.0)
				_estela(punto, fuera, CareerTheme.DANGER)
				draw_circle(fuera, 9.0, Color.WHITE)
				draw_arc(fuera, 9.0, 0.0, TAU, 20, CareerTheme.DANGER, 3.0)
			"gol_final":

				var desde: Vector2 = Vector2(cx - r.size.x * 0.18, r.position.y + r.size.y * 0.24)
				var dentro: Vector2 = Vector2(cx + gw * 0.25, r.position.y - 4.0)
				_estela(desde, dentro, acento)
				draw_circle(dentro, 9.0, Color.WHITE)
				draw_arc(dentro, 9.0, 0.0, TAU, 20, acento, 3.0)


	func _estela(a: Vector2, b: Vector2, c: Color) -> void:
		for i in 9:
			var k: float = float(i) / 9.0
			draw_circle(a.lerp(b, k), 2.0 + 3.0 * k, Color(c, 0.35 + 0.55 * k))
