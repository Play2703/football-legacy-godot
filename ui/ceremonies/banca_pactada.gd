extends "res://ui/ceremonies/bench.gd"


















func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _consume() -> Dictionary:
	if Career.pactado_hoy() != DescansoPactado.BANCA:
		return {}
	return {
		"kind": Ceremonies.BANCA_PACTADA,
		"status": Standing.STATUS_BANCA,
		"div": GameState.home_div(),
		"club": GameState.player_team_id,
		"season": GameState.season_num,
		"importancia": String(Career.descanso_pactado.get("importancia",
			DescansoPactado.NORMAL)),
	}


func _ficha() -> void:
	make_chyron(I18n.t("BANCA, POR SI HACE FALTA"), team_name("?").to_upper(),
		team(), 1.6)
	make_card(T_CARD)
	card_title(CareerTheme.caps(Career.player_name), 40)
	card_sub(I18n.t("EL MÍSTER TE GUARDA"), text_accent())
	var imp: String = String(data.get("importancia", DescansoPactado.NORMAL))
	var celdas: Array = celdas_de(imp)
	if celdas.is_empty():


		card_note(I18n.t("Hoy el partido no se juega nada. Sólo entras si se lesiona un compañero."))
	else:
		card_stats(celdas)
		card_note(I18n.t("Se mira el global de la eliminatoria." if imp == DescansoPactado.VUELTA
			else "Si el partido se tuerce, el míster te llama."))
	card_cta(I18n.t("SEGUIR"))






static func celdas_de(imp: String) -> Array:
	var out: Array = []
	for par in (DescansoPactado.TABLA.get(imp, []) as Array):
		var dif: int = int(par[0])
		var rotulo: String = "PERDIENDO"
		if dif == 0:
			rotulo = "EMPATANDO"
		elif dif > 0:
			rotulo = "GANANDO POR 1"
		out.append({"v": "%d'" % int(par[1]), "k": I18n.t(rotulo)})
	return out
