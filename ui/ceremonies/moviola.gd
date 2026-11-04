extends "res://ui/ceremonies/programa_tele.gd"





func _angulo_de_serie() -> String:
	var c: String = String(data.get("caso", ""))
	return c if c in [ProgramasTele.ROJA, ProgramasTele.PENAL, ProgramasTele.GOL_FINAL] \
			else ProgramasTele.ROJA


func _caso() -> String:
	return _angulo_de_serie()


func _args_de_serie() -> Array:
	return [_marcador()]


func _marcador() -> String:
	return "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))]


func _programa() -> String:
	return I18n.t("LA MOVIOLA")


func _rotulo() -> String:
	return I18n.t("LA MOVIOLA")


func _tema() -> String:
	match _caso():
		ProgramasTele.PENAL:
			return I18n.t("EL PENALTI FALLADO")
		ProgramasTele.GOL_FINAL:
			return I18n.t("EL GOL DEL FINAL")
	return I18n.t("LA ROJA")


func _cuerpo_tele(p: Pantalla) -> Control:
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.add_theme_constant_override("separation", 36)
	var margen: Control = Control.new()
	margen.custom_minimum_size = Vector2(30, 0)
	cuerpo.add_child(margen)
	var campo: Campito = Campito.new()
	campo.marca = _caso()
	campo.acento = CareerTheme.text_on_dark(p.acento)
	campo.custom_minimum_size = Vector2(300, 0)
	campo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_child(campo)
	var der: VBoxContainer = VBoxContainer.new()
	der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	der.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	der.add_theme_constant_override("separation", 16)
	cuerpo.add_child(der)
	var bueno: bool = _caso() == ProgramasTele.GOL_FINAL
	der.add_child(_pastilla(p, _tema(), p.acento if bueno else CareerTheme.DANGER))
	var nombre: Label = p._texto(CareerTheme.caps(Career.player_name), CareerTheme.T_TITLE,
		CareerTheme.TEXT)
	nombre.clip_text = true
	der.add_child(nombre)

	var marcador: HBoxContainer = HBoxContainer.new()
	marcador.add_theme_constant_override("separation", 18)
	der.add_child(marcador)
	var tuyo: CrestView = CrestView.new()
	tuyo.custom_minimum_size = Vector2(72, 72)
	tuyo.set_team(team())
	marcador.add_child(tuyo)
	var res: Label = p._texto(_marcador(), 64, CareerTheme.TEXT)
	res.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	marcador.add_child(res)
	var suyo: CrestView = CrestView.new()
	suyo.custom_minimum_size = Vector2(72, 72)
	suyo.set_team(Teams.by_id(String(data.get("opp", ""))))
	marcador.add_child(suyo)
	der.add_child(_fila_club(p, String(data.get("opp", "")), CareerTheme.T_BODY))
	var cola: Control = Control.new()
	cola.custom_minimum_size = Vector2(24, 0)
	cuerpo.add_child(cola)
	return cuerpo


func _titulares_propios() -> Array[String]:
	var out: Array[String] = []
	out.append("%s  %s  %s" % [team_name("?").to_upper(), _marcador(),
		Nations.team_label(Teams.by_id(String(data.get("opp", ""))), "?").to_upper()])
	return out


func _titulo() -> String:
	return _tema()


func _nota_final() -> String:
	match _caso():
		ProgramasTele.PENAL:
			return I18n.t("La tele lo repite una y otra vez. Al siguiente, se marca.")
		ProgramasTele.GOL_FINAL:
			return I18n.t("Tu gol del final es la jugada de la semana.")
	return I18n.t("Tu roja es la polémica de la semana.")
