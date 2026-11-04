extends "res://ui/ceremonies/programa_tele.gd"







func _angulo_de_serie() -> String:
	return ProgramasTele.VUELTA


func _args_de_serie() -> Array:
	return [String.num(_ppp("ppp_con"), 1), String.num(_ppp("ppp_sin"), 1)]


func _ppp(k: String) -> float:
	return float(data.get(k, 0.0))


func _programa() -> String:
	return I18n.t("EL DEBATE")


func _rotulo() -> String:
	return I18n.t("CON ÉL Y SIN ÉL")


func _tema() -> String:
	return I18n.t("¿LO HAN ECHADO DE MENOS?")


func _con_losa() -> bool:
	return true



func _color_lado(propio: float, otro: float) -> Color:
	if propio > otro + 0.2:
		return CareerTheme.text_on_dark(CareerTheme.accent_of(team()))
	if propio < otro - 0.2:
		return CareerTheme.DANGER
	return CareerTheme.TEXT_MID


func _cuerpo_tele(p: Pantalla) -> Control:
	var der: VBoxContainer = _columna_nombre(p)
	der.add_child(_seccion(p, I18n.t("PUNTOS POR PARTIDO")))
	var cifras: HBoxContainer = HBoxContainer.new()
	cifras.add_theme_constant_override("separation", 12)
	der.add_child(cifras)
	var con: float = _ppp("ppp_con")
	var sin: float = _ppp("ppp_sin")
	cifras.add_child(p._cubo(String.num(con, 1), I18n.t("CON ÉL"), _color_lado(con, sin)))
	cifras.add_child(p._cubo(String.num(sin, 1), I18n.t("SIN ÉL"), _color_lado(sin, con)))
	var puesto: int = int(data.get("puesto", 0))
	if puesto > 0:
		der.add_child(_pastilla(p, I18n.tf("PUESTO {0}", [puesto]), p.acento))
	return _cuerpo_busto(der)


func _titulares_propios() -> Array[String]:
	var out: Array[String] = []
	out.append("%s %s  ·  %s %s" % [I18n.t("CON ÉL"), String.num(_ppp("ppp_con"), 1),
		I18n.t("SIN ÉL"), String.num(_ppp("ppp_sin"), 1)])
	return out


func _cifras_ficha() -> Array:
	return [
		{"v": String.num(_ppp("ppp_con"), 1), "k": I18n.t("CON ÉL")},
		{"v": String.num(_ppp("ppp_sin"), 1), "k": I18n.t("SIN ÉL")},
		{"v": str(int(data.get("pj_sin", 0))), "k": I18n.t("PJ")},
	]


func _titulo() -> String:
	match _veredicto():
		Tertulia.BIEN:
			return I18n.t("IMPRESCINDIBLE")
		Tertulia.MAL:
			return I18n.t("A GANARSE EL PUESTO")
	return I18n.t("DE VUELTA")


func _nota_final() -> String:
	match _veredicto():
		Tertulia.BIEN:
			return I18n.t("Sin ti el equipo se resintió. Vuelve su referente.")
		Tertulia.MAL:
			return I18n.t("El equipo sumó más sin ti. Toca demostrar en el campo.")
	return I18n.t("Con o sin ti, el equipo fue igual. Ahora, a marcar la diferencia.")
