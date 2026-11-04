extends "res://ui/ceremonies/trophy.gd"






























func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["stinger_bad"])
















func _tu_en_la_pina() -> bool:
	return false


func _lift_sting() -> void:
	sting("stinger_bad", -12.0)


func _mine() -> Dictionary:
	var t: Dictionary = Teams.by_id(String(data.get("away_club", vivo_de("club", GameState.player_team_id))))
	return t if not t.is_empty() else GameState.you_team()






func _award_for_comp() -> String:
	match String(data.get("comp", "copa")):
		"champions", "ucl": return "Campeón de Champions"



		"europa", "uel", "eul": return "Campeón de Europa League"
		"conference", "conf": return "Campeón de Conference"
		"cwc", "clubes", "mundialito": return "Campeón del Mundo de Clubes"




		"liguilla": return "Campeón de Liga"


		"campeones": return "Campeón de Campeones"

		"supercopa": return SupercopaNacional.TITULO

		"copaliga": return CopaLiga.TITULO

		"recopa": return Supercopas.RECOPA
		"intercont", "intercontinental": return Supercopas.INTERCONT
		"supereuropa": return Supercopas.SUPEREUROPA
		"superafrica": return Supercopas.SUPERAFRICA

		"ligas": return CopaLigas.TITULO






		"lib", "libertadores": return Continental.titulo("lib")
		"sud", "sudamericana": return Continental.titulo("sud")
		"cca", "concacaf": return Continental.titulo("cca")
		"ace", "oriente": return Continental.titulo("ace")
		"ac2", "sol": return Continental.titulo("ac2")
		"caf", "atlas": return Continental.titulo("caf")
		"cf2", "baobab": return Continental.titulo("cf2")

		"ofc", "coral": return Continental.titulo("ofc")
		_: return "Campeón de Copa"



func _es_liguilla() -> bool:
	return String(data.get("comp", "")) == "liguilla"





func _accent_for() -> Color:
	_cfg = Ceremonies.trophy_cfg(_award_for_comp())
	var comp: String = String(_cfg.get("comp", "liga"))
	if comp == "liga":
		return CareerTheme.accent_of(_stage_team())
	return Competitions.COMP_ACCENT.get(comp, CareerTheme.MONEY)






func _build() -> void:
	var host: Dictionary = _stage_team()
	var kit: Dictionary = GameState.kit_variant(host, 0)
	_stage = _stage_de_hoy()


	make_stadium({
		"div": div(),
		"attendance": 1.0,
		"party": true,
		"weather": String(_cfg.get("weather", "night")),
		"kit": kit,
		"home_club": String(host.get("id", "")),
		"banner": I18n.t("CAMPEONES"),
		"board": I18n.t("CAMPEONES"),
	})
	focus = Vector3(LOST_FOCUS.x, LOST_FOCUS.y, CENTER_Z)



	var dec_v: Variant = data.get("decisor", {})
	var dec: Dictionary = dec_v if dec_v is Dictionary else {}
	if String(dec.get("cara", "")).is_empty():
		dec = {}

	_squad_skip = String(dec.get("name", ""))
	make_camera(LOST_KEYS if dec.is_empty() else _keys_decisor())




	_build_podium()
	_build_squad(kit)
	_build_crew(int(_stage["crew"]))



	make_audio(1.0, true)
	stadium.crowd_excite(0.8)
	flash_pool = stand_flash_pool(CENTER_Z, 34.0)
	flash_rate = float(_stage["flash"])
	flash_burst_at = T_LIFT
	confetti_count = int(_stage["confetti"])
	confetti_colors = [accent, CareerTheme.MONEY, Color.WHITE, accent.lightened(0.35)]


	_build_watchers()




	if not dec.is_empty():
		var s: AnimatedSprite3D = decisor_sprite(dec, String(host.get("id", "")), kit)
		s.position = Vector3(PLAYER_X, s.position.y + _piso_en(PLAYER_X, CENTER_Z), CENTER_Z)




	accent = CareerTheme.DANGER



	make_chyron(CareerTheme.caps(I18n.t("Subcampeón")),
		CareerTheme.caps(String(host.get("name", "?"))), _mine(), 1.6, "",
		CareerTheme.caps(I18n.t("FINAL DE LA LIGUILLA")) if _es_liguilla() else "")

	make_card(-1.0 if dec.is_empty() else DECISOR_CARD_AT)
	card_title(CareerTheme.caps(I18n.t("Subcampeón")), 40)


	if _es_liguilla():
		card_sub(CareerTheme.caps(I18n.tf("Campeón de Liga: {0}",
			[String(host.get("name", ""))])))
	else:
		card_sub(CareerTheme.caps(I18n.tf("Campeón: {0}", [String(host.get("name", ""))])))
	card_note(_nota_decisor(dec) if not dec.is_empty()
		else (I18n.t("Una liga entera para perderla en la última noche. La vuelta al campo la dan ellos.")
			if _es_liguilla()
			else I18n.t("La fiesta estaba lista. La están dando ellos, en el sitio donde ibas a estar tú.")))
	card_cta(I18n.t("SEGUIR"))









func _keys_decisor() -> Array:
	var ks: Array = [LOST_KEYS[0], LOST_KEYS[1]]
	ks.append({"t": 6.9, "dist": 7.4, "h": 2.35, "yaw": 84.0, "aim_y": 1.5, "fov": 31.0,
		"focus_x": PLAYER_X, "focus_z": CENTER_Z})
	ks.append({"t": 9.8, "dist": 6.8, "h": 2.25, "yaw": 80.0, "aim_y": 1.5, "fov": 30.0,
		"focus_x": PLAYER_X, "focus_z": CENTER_Z})
	return ks




const DECISOR_CARD_AT: float = 9.2



func _nota_decisor(dec: Dictionary) -> String:
	var n: String = String(dec.get("nombre", ""))
	match String(dec.get("como", "")):
		"tanda":
			return I18n.tf("{0} metió el penalti que decidió la final. Su nombre se queda contigo.", [n])
		"parada":
			return I18n.tf("{0} paró el penalti que decidió la final. Su nombre se queda contigo.", [n])
	return I18n.tf("{0} decidió la final. Su nombre se queda contigo.", [n])





func _build_watchers() -> void:
	var kit: Dictionary = GameState.kit_variant(_mine(), 1)

	_miran_de_espaldas(kit, String(_mine().get("id", "")), true)


	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)





	look["number"] = dorsal_vivido()
	make_player(look)
	player.position = Vector3(YOU_SPOT.x, player.position.y, CENTER_Z + YOU_SPOT.y)
	player.sprite_frames = player_frames(look, "north")







	espalda_registra(player, "idle", player_prefix("north"), 0)
	player.play("idle")
