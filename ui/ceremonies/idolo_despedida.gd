extends "res://ui/ceremonies/adios.gd"
































const PalcoCinta := preload("res://ui/ceremonies/palco_cinta.gd")


const LADO_X: float = -1.0


const T_GRADA: float = 22.5
const T_GRADA_FIN: float = 26.0
const T_POSTAL: float = 30.0


var tu_grada: AnimatedSprite3D = null
var en_cinta: bool = false
var _palco_pie: Vector3 = Vector3.ZERO
var _cristal_x: float = 0.0
var _medido: bool = false
var _acomp: Array[AnimatedSprite3D] = []


func _cara() -> String:
	return String(data.get("cara", data.get("nombre", "")))


func _nombre() -> String:
	return CareerUi.display_name(String(data.get("nombre", "?")))


func _anios() -> int:
	return maxi(1, int(data.get("anios", 1)))


func _look_protagonista(kit: Dictionary) -> Dictionary:


	var cfg: Dictionary = person_look({"name": _cara(), "number": int(data.get("number", 0))},
		KitRecolor.team_only(kit))



	var ape: String = String(data.get("apellido", ""))
	if not ape.strip_edges().is_empty():
		cfg["apellido"] = ape
	return cfg


func _nombre_tablero() -> String:
	return _nombre().to_upper()


func _piezas_arco() -> Array[String]:
	return []


func _monta_ahijado() -> void:
	_mide_palco()
	if en_cinta:
		PalcoCinta.abre(stadium, _cristal_x, _palco_pie.y, CENTER_Z, LADO_X)
	else:
		PalcoCinta.cabina(self, LADO_X, CENTER_Z, accent)
	var p: Vector3 = _tu_pos()
	var cfg: Dictionary = GameState.team_custom.duplicate()
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.name = "TuPalco"
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	var frames: SpriteFrames = player_frames(cfg, "south", ESMOQUIN_SHEET, true)
	if frames == null:
		return
	esmoquin_clap(frames, cfg)
	spr.sprite_frames = frames
	spr.position = Vector3(p.x, p.y + feet_offset(spr.pixel_size, ESMOQUIN_SHEET + "00.png")
		- PLAYER_SINK, p.z)


	viewport.add_child(spr)


	spr.play("clap" if frames.has_animation("clap") else "idle")
	CaraViva.pon(spr)
	PlacaNombre.cuelga(spr, Career.nombre_espalda(), true, false)
	tu_grada = spr
	_acomp = PalcoCinta.acompanantes(self, spr.position, spr.pixel_size,
		String(data.get("club", "palco")), LADO_X)





func _mide_palco() -> void:
	if _medido or stadium == null:
		return
	_medido = true
	var m: Dictionary = PalcoCinta.mide(stadium, LADO_X, CENTER_Z)
	en_cinta = not m.is_empty()
	if en_cinta:
		_cristal_x = float(m["cristal_x"])
		_palco_pie = m["suelo"]
	else:
		_palco_pie = PalcoCinta.cabina_pie(LADO_X, CENTER_Z)



func _tu_pos() -> Vector3:
	_mide_palco()
	return _palco_pie


func _keys() -> Array:
	var k: Array = []
	for key: Dictionary in KEYS:
		if float(key["t"]) < T_GRADA:
			k.append(key)
	var p: Vector3 = _tu_pos()





	k.append({"t": T_GRADA, "dist": 13.0, "h": p.y + 1.5, "yaw": 90.0, "aim_y": p.y + 1.0,
		"fov": 34.0, "focus_x": p.x, "focus_z": p.z - 0.35})
	k.append({"t": T_GRADA_FIN, "dist": 8.0, "h": p.y + 1.5, "yaw": 92.0, "aim_y": p.y + 1.1,
		"fov": 34.0, "focus_x": p.x, "focus_z": p.z - 0.35})
	k.append((KEYS[KEYS.size() - 1] as Dictionary).merged({"t": T_POSTAL}, true))
	return k


func _ficha(club: Dictionary) -> void:
	var nombre: String = CareerTheme.caps(_nombre())
	make_chyron(I18n.t("SU DESPEDIDA"), nombre, club, T_CHYRON)
	make_card(T_CARD)

	card_title(nombre, 40)
	card_club(club)
	var stats: Array = [{"v": str(_anios()), "k": I18n.t("años después")}]
	if int(data.get("number", 0)) > 0:
		stats.append({"v": str(int(data["number"])), "k": I18n.t("su dorsal")})
	card_stats(stats)
	card_note(I18n.tf("Hace {0} años dijiste su nombre delante de todos.", [str(_anios())])
		if _anios() > 1 else I18n.t("Hace un año dijiste su nombre delante de todos."))
	card_note(frase())
	card_cta(I18n.t("SEGUIR"))





func frase() -> String:
	var rama: String = String(data.get("rama", "estrella"))
	return I18n.t(String(IdoloEscenas.DESPEDIDA_FRASES.get(rama,
		IdoloEscenas.DESPEDIDA_FRASES["estrella"])))
