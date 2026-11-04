extends "res://ui/ceremonies/programa_tele.gd"






func _angulo_de_serie() -> String:
	return ProgramasTele.RACHA_SECA if String(data.get("angulo", "")) == ProgramasTele.RACHA_SECA \
			else ProgramasTele.RACHA_GOL


func _seca() -> bool:
	return _angulo() == ProgramasTele.RACHA_SECA


func _n() -> int:
	return maxi(int(data.get("n", ProgramasTele.RACHA_GOL_N)), 1)


func _args_de_serie() -> Array:
	return [str(_n())]


func _programa() -> String:
	return I18n.t("EL DEBATE")


func _rotulo() -> String:
	return I18n.t("LA SEQUÍA") if _seca() else I18n.t("EN RACHA")


func _tema() -> String:
	return I18n.tf("{0} PARTIDOS SIN MARCAR", [_n()]) if _seca() \
			else I18n.tf("{0} PARTIDOS MARCANDO", [_n()])


func _con_losa() -> bool:
	return true


func _goles() -> Array:
	var g: Array = data.get("goles", [])
	if g.is_empty():
		for i in _n():
			g.append(0 if _seca() else 1)
	return g


func _cuerpo_tele(p: Pantalla) -> Control:
	var der: VBoxContainer = _columna_nombre(p)
	der.add_child(_pastilla(p, _tema(), CareerTheme.DANGER if _seca() else p.acento))
	der.add_child(_seccion(p, I18n.t("ÚLTIMOS PARTIDOS")))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	der.add_child(fila)
	for g in _goles():
		var n: int = int(g)
		fila.add_child(p._cubo(str(n), I18n.t("GOLES"),
			CareerTheme.STAT_GOAL if n > 0 else CareerTheme.DANGER))
	return _cuerpo_busto(der)


func _titulares_propios() -> Array[String]:
	var out: Array[String] = []
	out.append(_tema())
	return out


func _cifras_ficha() -> Array:
	var total: int = 0
	for g in _goles():
		total += int(g)
	return [
		{"v": str(_n()), "k": I18n.t("PARTIDOS")},
		{"v": str(total), "k": I18n.t("GOLES")},
	]


func _titulo() -> String:
	return _rotulo()


func _nota_final() -> String:
	if _seca():
		return I18n.t("La portería se te resiste. Un gol lo cambia todo.")
	return I18n.t("La tele no habla de otra cosa: estás en racha.")
