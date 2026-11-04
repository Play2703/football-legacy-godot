extends "res://ui/ceremonies/tertulia.gd"




















func _veredicto() -> String:
	return Tertulia.BIEN


func _programa() -> String:
	return I18n.t("EDICIÓN ESPECIAL")


func _rotulo() -> String:
	return I18n.t("EL DISCÍPULO YA ES MEJOR")


func _tema() -> String:
	return I18n.t("EL ALUMNO SUPERA AL MAESTRO")



func _con_losa() -> bool:
	return false



func _panel_de_serie() -> Array:
	return IdoloEscenas.panel_discipulo(_anios(), _nombre(), Career.player_name)




func _noticias() -> Array[String]:
	var partes: Array[String] = []
	partes.append(I18n.tf("ÚLTIMA HORA: {0} SUPERA A {1} EN EL RANKING",
		[CareerTheme.caps(Career.player_name), CareerTheme.caps(_nombre())]))
	partes.append(_tema())
	partes.append(_rotulo())
	return partes





func _cuerpo_tele(p: Pantalla) -> Control:
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_theme_constant_override("separation", 18)
	var su_club: Dictionary = Teams.by_id(String(data.get("club_idolo", "")))
	cuerpo.add_child(_lado(p, {
		"look": GameState.player_look(), "club": team(),
		"nombre": Espalda.apellido_de(Career.player_name), "color": CareerTheme.NAV_YO,
		"ovr": int(data.get("ovr", 0)), "pos": String(data.get("pos", Squad.USER_POS)),
		"rank": int(data.get("tu_rank", 0)), "rotulo": I18n.t("TU RANKING")}))
	var raya: ColorRect = ColorRect.new()
	raya.color = p.acento
	raya.custom_minimum_size = Vector2(6, 0)
	raya.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_child(raya)
	cuerpo.add_child(_lado(p, {
		"look": person_look({"name": String(data.get("cara", "")),
			"number": int(data.get("su_number", 0))},
			GameState.kit_variant(su_club, 0) if not su_club.is_empty() else {}),
		"club": su_club, "nombre": String(data.get("apellido", _nombre())),
		"color": CareerTheme.text_on_dark(CareerTheme.accent_of(su_club))
			if not su_club.is_empty() else CareerTheme.TEXT_MID,
		"ovr": int(data.get("su_ovr", 0)), "pos": String(data.get("su_pos", "")),
		"rank": int(data.get("su_rank", 0)), "rotulo": I18n.t("SU RANKING")}))
	return cuerpo




func _lado(p: Pantalla, l: Dictionary) -> Control:
	var lado: HBoxContainer = HBoxContainer.new()
	lado.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	lado.add_theme_constant_override("separation", 10)
	var av: PlayerAvatar = PlayerAvatar.new()
	av.chrome = false
	av.bust = PlayerAvatar.BUST_CLOSE
	av.custom_minimum_size = Vector2(176, 230)
	av.size_flags_vertical = Control.SIZE_SHRINK_END
	av.club = l["club"]
	lado.add_child(av)
	av.set_look(l["look"])
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 6)
	lado.add_child(col)
	var c: Color = l["color"]
	var rot: Label = p._texto(CareerTheme.caps(String(l["rotulo"])), CareerTheme.T_CAPTION,
		CareerTheme.TEXT_MID)
	rot.clip_text = true
	col.add_child(rot)
	var rank: int = int(l["rank"])
	var num: Label = p._texto("#%d" % rank if rank > 0 else "—", CareerTheme.T_SCORE, c)
	num.clip_text = true
	num.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0.55))
	num.add_theme_constant_override("shadow_offset_x", 3)
	num.add_theme_constant_override("shadow_offset_y", 3)
	col.add_child(num)
	var nom: Label = p._texto(CareerTheme.caps(String(l["nombre"])), CareerTheme.T_HEAD,
		CareerTheme.TEXT)
	nom.clip_text = true
	col.add_child(nom)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	col.add_child(fila)
	if int(l["ovr"]) > 0:
		var medalla: OvrBadge = OvrBadge.new()
		medalla.setup(int(l["ovr"]), CareerTheme.T_HEAD)
		fila.add_child(medalla)
	if not String(l["pos"]).is_empty():
		fila.add_child(CareerUi.pos_chip(String(l["pos"])))
	return lado





func _monta_ficha() -> void:
	card_title(_rotulo(), 40)
	var sub: Label = card_sub(CareerTheme.caps(_nombre()), _color_veredicto(_veredicto()))
	sub.clip_text = true
	var stats: Array = []
	if int(data.get("tu_rank", 0)) > 0:
		stats.append({"v": "#%d" % int(data["tu_rank"]), "k": I18n.t("tu ranking")})
	if int(data.get("su_rank", 0)) > 0:
		stats.append({"v": "#%d" % int(data["su_rank"]), "k": I18n.t("su ranking")})
	stats.append({"v": str(_anios()), "k": I18n.t("temporadas")})
	card_stats(stats)
	card_note(nota_camino())



func nota_camino() -> String:
	var antes: int = int(data.get("tu_rank0", 0)) - int(data.get("su_rank0", 0))
	if int(data.get("tu_rank0", 0)) > 0 and int(data.get("su_rank0", 0)) > 0 and antes > 0:
		return I18n.tf("El día que lo nombraste te sacaba {0} puestos.", [antes])
	return I18n.t("El día que lo nombraste lo mirabas desde muy abajo.")


func _anios() -> int:
	return maxi(int(data.get("anios", 0)), 1)


func _nombre() -> String:
	return String(data.get("nombre", "?"))
