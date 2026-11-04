extends "res://ui/ceremonies/programa_tele.gd"








func _accent_for() -> Color:
	return CareerTheme.DANGER


func _angulo_de_serie() -> String:
	return ProgramasTele.PARTE


func _args_de_serie() -> Array:
	return [str(_semanas()), str(int(data.get("perdidos", 0)))]


func _semanas() -> int:
	return maxi(int(data.get("semanas", ProgramasTele.PARTE_MIN)), 1)


func _programa() -> String:
	return I18n.t("EL PARTE MÉDICO")


func _rotulo() -> String:
	return I18n.t("PARTE MÉDICO")


func _tema() -> String:
	return I18n.tf("{0} SEMANAS DE BAJA", [_semanas()])


func _con_losa() -> bool:
	return true


func _cuerpo_tele(p: Pantalla) -> Control:
	var der: VBoxContainer = _columna_nombre(p)
	der.add_theme_constant_override("separation", 12)
	der.add_child(_pastilla(p, I18n.tf("{0} SEMANAS DE BAJA", [_semanas()]), CareerTheme.DANGER))
	var partidos: Array = data.get("partidos", [])
	if partidos.is_empty():
		der.add_child(_seccion(p, I18n.t("SIN PARTIDOS A LA VISTA")))
		return _cuerpo_busto(der)
	der.add_child(_seccion(p, I18n.t("SE PIERDE")))
	for x in partidos:
		var fx: Dictionary = x
		var gordo: String = String(fx.get("gordo", ""))
		der.add_child(_fila_club(p, String(fx.get("opp", "")), CareerTheme.T_HEAD,
			I18n.t(gordo) if not gordo.is_empty() else ""))
	var resto: int = int(data.get("perdidos", partidos.size())) - partidos.size()
	if resto > 0:
		der.add_child(_seccion(p, I18n.tf("Y {0} MÁS", [resto])))
	return _cuerpo_busto(der)


func _titulares_propios() -> Array[String]:
	var out: Array[String] = []
	out.append(I18n.tf("{0} SEMANAS DE BAJA", [_semanas()]))
	return out


func _cifras_ficha() -> Array:
	return [
		{"v": str(_semanas()), "k": I18n.t("SEMANAS")},
		{"v": str(int(data.get("perdidos", 0))), "k": I18n.t("PARTIDOS")},
	]


func _titulo() -> String:
	match _veredicto():
		Tertulia.BIEN:
			return I18n.t("UN SUSTO")
		Tertulia.MAL:
			return I18n.t("MAZAZO")
	return I18n.t("BAJA SENSIBLE")


func _nota_final() -> String:
	match _veredicto():
		Tertulia.BIEN:
			return I18n.t("Poca cosa. En nada vuelves a estar disponible.")
		Tertulia.MAL:
			return I18n.t("Va para largo. El equipo tendrá que apañarse sin ti.")
	return I18n.t("Te toca mirar desde la grada unas semanas.")
