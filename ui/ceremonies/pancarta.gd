extends Ceremony






























const SIDE: float = 1.0


const BANNER_Z: float = Stadium.HALF_LINE - 6.0



const BANNER_ALTO: float = 3.6




const ME_X: float = -4.0
const ME_Z: float = Stadium.HALF_LINE - 2.0


const ATT: float = 0.9




const T_TELA: float = 2.6
const T_CORTE_1: float = 4.6
const T_CORTE_2: float = 7.0
const T_FIN: float = 9.2
const T_CHYRON: float = 2.8
const T_CARD: float = 9.4
const CORTE: float = 0.02


const VECINO_H: float = 1.66




const OREJA_SHEET: String = "res://assets/sprites/anim/oreja_south_"
const OREJA: Dictionary = {"desde": 1, "hasta": 4, "fps": 7.0}
const CLAP: Dictionary = {"desde": 0, "hasta": 3, "fps": 6.0}

var _pano: MeshInstance3D = null




func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _cinta() -> bool:
	return bool(data.get("cinta", false))



func _err() -> Dictionary:
	return {
		"texto": String(data.get("texto", "")),
		"tipo": String(data.get("tipo", "")),
		"idx": int(data.get("idx", 0)),
		"n": int(data.get("n", 1)),
		"buena": String(data.get("buena", "")),
		"club": String(team().get("id", GameState.player_team_id)),
	}


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": kit,
	})
	var tex: ImageTexture = stadium.errata_banner_tex(String(data.get("texto", "")),
		_err(), _cinta())
	var letra: Vector3 = Vector3(Stadium.SIDE_STAND_X + 4.0, 6.0, BANNER_Z)
	var centro: Vector3 = letra
	var arriba_letra: Vector3 = letra + Vector3(0.6, 1.2, 0.0)
	if tex != null:
		var ancho: float = BANNER_ALTO * float(tex.get_width()) / float(tex.get_height())
		_pano = stadium.hang_side_banner(SIDE, tex, Vector2(ancho, BANNER_ALTO), BANNER_Z)
	if _pano != null:



		var size: Vector2 =(_pano.mesh as QuadMesh).size
		var uv: Vector2 = tex.get_meta("letra_uv", Vector2(0.5, 0.5))
		centro = _pano.global_position
		letra = _pano.to_global(Vector3((uv.x - 0.5) * size.x,(0.5 - uv.y) * size.y, 0.0))
		arriba_letra = _pano.to_global(Vector3((uv.x - 0.5) * size.x,
			size.y * 0.5 + VECINO_H * 0.5 - 0.15, 0.0))
	_vecino(arriba_letra)
	var keys: Array = _keys(centro, letra)
	focus = Vector3(centro.x, centro.y, centro.z)
	make_camera(keys, 36.0)
	orbit_speed = 0.35



	var look: Dictionary = GameState.player_look()
	make_player(look, "south")
	player.position = Vector3(ME_X, player.position.y, ME_Z)
	if _cinta():
		_arma_gesto(look, "clap", Ceremony.CLAP_SHEET, CLAP)
	else:
		_arma_gesto(look, "oreja", OREJA_SHEET, OREJA)
	make_audio(ATT, false)
	stadium.crowd_excite(0.8)
	_ficha()





func _keys(centro: Vector3, letra: Vector3) -> Array:
	var general: Dictionary = {"t": 0.0, "dist": 64.0, "h": 20.0, "yaw": 240.0,
		"aim_y": centro.y + 1.0, "fov": 40.0,
		"focus_x": centro.x + 3.0, "focus_z": centro.z - 4.0}
	var tela_a: Dictionary = {"t": T_TELA, "dist": 34.0, "h": centro.y + 4.0,
		"yaw": 252.0, "aim_y": centro.y, "fov": 40.0,
		"focus_x": centro.x, "focus_z": centro.z}
	var tela_b: Dictionary = {"t": T_CORTE_1, "dist": 30.0, "h": centro.y + 3.4,
		"yaw": 255.0, "aim_y": centro.y, "fov": 40.0,
		"focus_x": centro.x, "focus_z": centro.z}


	var yo_a: Dictionary = {"dist": 41.0, "h": 9.0, "yaw": 96.0, "aim_y": 1.05,
		"fov": 9.0, "focus_x": ME_X, "focus_z": ME_Z}
	var yo_b: Dictionary = {"dist": 40.0, "h": 8.8, "yaw": 97.5, "aim_y": 1.0,
		"fov": 8.2, "focus_x": ME_X, "focus_z": ME_Z}


	var det_a: Dictionary = {"dist": 21.0, "h": letra.y + 3.0, "yaw": 262.0,
		"aim_y": letra.y + 0.9, "fov": 34.0,
		"focus_x": letra.x, "focus_z": letra.z}
	var det_b: Dictionary = {"dist": 18.0, "h": letra.y + 2.6, "yaw": 264.0,
		"aim_y": letra.y + 0.9, "fov": 34.0,
		"focus_x": letra.x, "focus_z": letra.z}


	var p1a: Dictionary = det_a if _cinta() else yo_a
	var p1b: Dictionary = det_b if _cinta() else yo_b
	var p2a: Dictionary = yo_a if _cinta() else det_a
	var p2b: Dictionary = yo_b if _cinta() else det_b
	var out: Array = [general, tela_a, tela_b]
	out.append(_en(p1a, T_CORTE_1 + CORTE))
	out.append(_en(p1b, T_CORTE_2))
	out.append(_en(p2a, T_CORTE_2 + CORTE))
	out.append(_en(p2b, T_FIN))
	return out


func _en(key: Dictionary, at: float) -> Dictionary:
	var k: Dictionary = key.duplicate()
	k["t"] = at
	return k





func _vecino(pos: Vector3) -> void:
	if stadium == null:
		return
	var frames: SpriteFrames = stadium.fan_frames(true)
	if frames == null:
		return
	var f: AnimatedSprite3D = AnimatedSprite3D.new()
	f.sprite_frames = frames
	f.pixel_size = VECINO_H / 32.0
	f.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	f.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	f.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	f.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	f.set_meta("occ_gente", true)
	f.position = pos
	viewport.add_child(f)
	var anim: String = "cheer" if _cinta() else "sad"
	if not frames.has_animation(anim):
		anim = "idle"
	f.play(anim)

	f.speed_scale = 1.0 if _cinta() else 0.7





func _arma_gesto(look: Dictionary, anim: String, hoja: String, spec: Dictionary) -> void:
	if player == null or player.sprite_frames.has_animation(anim):
		return
	var vestido: Dictionary = _walk_cfg(player, look)
	var puestos: int = 0
	for i in range(int(spec["desde"]), int(spec["hasta"]) + 1):
		var path: String = "%s%02d.png" % [hoja, i]
		if not ResourceLoader.exists(path):
			continue
		if puestos == 0:
			player.sprite_frames.add_animation(anim)
			player.sprite_frames.set_animation_loop(anim, true)
			player.sprite_frames.set_animation_speed(anim, float(spec["fps"]))
		player.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), vestido))
		puestos += 1
	if puestos == 0:
		return
	espalda_registra(player, anim, hoja, int(spec["desde"]))
	player.play(anim)


func _ficha() -> void:
	var nombre: String = String(data.get("nombre", Career.player_name))


	make_chyron(I18n.t("LA PANCARTA"), CareerTheme.caps(nombre), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("ARREGLADA" if _cinta() else "CASI"), 44)
	card_club(team())
	card_stats([
		{"v": String(data.get("texto", "")), "k": I18n.t("la tela")},
		{"v": String(data.get("ape", "")), "k": I18n.t("tu apellido")},
	])
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))


func _note_line() -> String:
	if _cinta():
		return "Tardaron años, pero la arreglaron. Con cinta."
	return "Una letra mal. La van a colgar igual todos los domingos."



func _skipped() -> void:
	if player != null and player.sprite_frames != null:
		var anim: String = "clap" if _cinta() else "oreja"
		if player.sprite_frames.has_animation(anim) and player.animation != anim:
			player.play(anim)
