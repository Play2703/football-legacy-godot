extends "res://ui/ceremonies/legend_meet.gd"





























const KEYS_CAMISETA: Array = [
	{"t": 0.0, "dist": 26.0, "h": 1.3, "yaw": 138.0, "aim_y": 2.3, "fov": 18.0},
	{"t": 3.0, "dist": 16.0, "h": 1.35, "yaw": 116.0, "aim_y": 2.0, "fov": 24.0},
	{"t": 6.0, "dist": 10.2, "h": 1.42, "yaw": 99.0, "aim_y": 1.62, "fov": 32.0},
	{"t": 10.6, "dist": 9.2, "h": 1.44, "yaw": 94.0, "aim_y": 1.6, "fov": 32.0},
	{"t": 13.4, "dist": 10.2, "h": 1.45, "yaw": 89.0, "aim_y": 1.66, "fov": 33.0},
]
const T_CHYRON_CAMISETA: float = 1.0


const T_CAMISETA: float = 5.6
const CAMISETA_CRECE: float = 0.5



const CAMISETA_DZ: float = -0.06
const CAMISETA_Y: float = 1.08
const CAMISETA_ALTO: float = 0.62

const IDOLO_HABLA: float = 7.0
const IDOLO_CALLA: float = 10.4
const T_CARD_CAMISETA: float = 10.9

const CITA_ARRIBA_TUMBADO: float = 280.0



const ATT_PRETEMPORADA: float = 0.0

var _idolo_fig: AnimatedSprite3D = null
var _camiseta: Sprite3D = null
var _cita: PanelContainer = null
var _sonries: bool = false


func _dorsal() -> int:
	return int(data.get("dorsal", 0))


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT_PRETEMPORADA,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": "day",
		"kit": kit,

		"board": str(_dorsal()) if _dorsal() > 0 else String(data.get("nombre", "")).to_upper(),
	})
	make_camera(KEYS_CAMISETA)
	orbit_speed = DRIFT
	make_audio(ATT_PRETEMPORADA, false)

	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	make_player(look, "south")
	player.position.z = CENTER_Z + PLAYER_DZ
	var cara: CaraViva = CaraViva.de(player)
	if cara != null:
		cara.anima("normal")
	_build_idolo()
	_build_camiseta(kit)
	_build_textos()




func _build_idolo() -> void:
	var cfg: Dictionary = KitRecolor.appearance_for(_cara(), {})
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.name = "IdoloCamiseta"
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = player_frames(cfg, "south", ESMOQUIN_SHEET, true)
	spr.position = Vector3(0.0, feet_offset(spr.pixel_size, ESMOQUIN_SHEET + "00.png")
		- PLAYER_SINK, CENTER_Z + LEGEND_DZ)
	spr.play("idle")
	viewport.add_child(spr)
	_idolo_fig = spr
	CaraViva.pon(spr)





func _build_camiseta(kit: Dictionary) -> void:
	var cfg: Dictionary = kit.duplicate()
	cfg["apellido"] = Career.nombre_espalda()
	_camiseta = make_jersey(cfg, _dorsal(), CAMISETA_ALTO, CAMISETA_Y)
	_camiseta.name = "CamisetaSuya"
	_camiseta.position.z = CENTER_Z + CAMISETA_DZ
	_camiseta.scale = Vector3.ONE * 0.001


func _build_textos() -> void:
	var nombre: String = String(data.get("nombre", ""))
	var visible_n: String = CareerUi.display_name(nombre)
	make_chyron(I18n.t("SU CAMISETA"), visible_n.to_upper(), team(), T_CHYRON_CAMISETA)
	_cita = make_cita_idolo(nombre, I18n.t("El club lo guardaba para alguien como tú."))
	if UiKit.es_horizontal():
		_cita.anchor_top = 0.0
		_cita.anchor_bottom = 0.0
		_cita.offset_top = UiKit.top_safe_inset(get_viewport()) + CITA_ARRIBA_TUMBADO
		_cita.offset_bottom = _cita.offset_top
		_cita.grow_vertical = Control.GROW_DIRECTION_END
	make_card(T_CARD_CAMISETA)
	card_title(visible_n.to_upper(), 40)
	card_sub(I18n.t("SU CAMISETA"))


	var titulos: int = 0
	for n: Variant in data.get("titulos", []):
		titulos += int(n)
	var stats: Array = [{"v": str(_dorsal()), "k": I18n.t("su dorsal")}]
	if titulos > 0:
		stats.append({"v": str(titulos), "k": I18n.t("títulos aquí")})
	else:
		stats.append({"v": str(int(data.get("anios", 0))), "k": I18n.t("temporadas después")})
	stats.append({"v": "%.1f" % float(data.get("media", 0.0)), "k": I18n.t("tu media")})
	card_stats(stats)
	card_note(I18n.tf("{0} te lo cede.", [visible_n]))
	if replay:
		card_cta(I18n.t("SEGUIR"))
		return
	_decision_ev = evento()
	_decision_recap = I18n.tf("{0} te lo cede.", [visible_n])
	_decision_resolve = func(key: String) -> String:
		return _resolver(key)




func evento() -> Dictionary:
	var mio: int = int(data.get("mio", 0))
	return {
		"title": I18n.tf("¿LLEVAS SU {0}?", [_dorsal()]),
		"desc": I18n.t("Cada domingo te compararán con él."),
		"a": {"label": I18n.t("LLEVARLO"), "primary": true, "fx": {}},
		"b": {"label": I18n.tf("SEGUIR CON EL {0}", [mio]), "fx": {}},
	}


func _resolver(key: String) -> String:
	if not Career.resolve_idolo_camiseta(key):
		return ""
	if key == "a":
		return I18n.tf("Ya llevas el {0}.", [_dorsal()])
	return "«%s»" % I18n.t("Tu número, tu historia.")




func _tick(_delta: float) -> void:
	if _camiseta != null:
		var k: float = clampf((t - T_CAMISETA) / CAMISETA_CRECE, 0.0, 1.0)
		var s: float =(1.0 - pow(1.0 - k, 3.0)) *(1.0 + 0.1 * sin(k * PI))
		_camiseta.scale = Vector3.ONE * maxf(s, 0.001)
		_camiseta.position.y = CAMISETA_Y + 0.012 * sin(t * 1.7)
	if not _sonries and t >= T_CAMISETA + CAMISETA_CRECE:
		_sonries = true
		var tu: CaraViva = CaraViva.de(player)
		if tu != null:
			tu.anima("alegria")
	if _idolo_fig == null:
		return
	var dice: bool = t >= IDOLO_HABLA and t < IDOLO_CALLA - 0.4
	var cara: CaraViva = CaraViva.de(_idolo_fig)
	if cara != null and cara._hablando != dice:
		cara.habla(dice)
	if _cita != null:
		_cita.modulate.a = clampf(minf((t - IDOLO_HABLA) / 0.25,(IDOLO_CALLA - t) / 0.3),
			0.0, 1.0)
