extends Ceremony

























const ATT: float = 1.0





const KEYS: Array = [
	{"t": 0.0, "dist": 26.0, "h": 8.6, "yaw": 176.0, "aim_y": 2.2, "fov": 40.0},
	{"t": 3.0, "dist": 9.5, "h": 2.5, "yaw": 180.0, "aim_y": 1.35, "fov": 36.0},
	{"t": 6.4, "dist": 17.0, "h": 4.6, "yaw": 168.0, "aim_y": 2.0, "fov": 42.0},
]
const DRIFT: float = -0.9

const T_CHYRON: float = 1.2
const T_JERSEY: float = 3.2
const T_CARD: float = 7.6

var _kit: Dictionary = {}
var _jugador: AnimatedSprite3D
var _playera: Sprite3D
var _mostrada: bool = false



func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:
	focus = Vector3(0.0, 0.0, CENTER_Z)
	var rival: Dictionary = team()



	make_stadium({
		"div": div(), "attendance": ATT, "home_only": true,
		"home_club": String(rival.get("id", "")),
		"weather": "day", "party": true,



		"board": _apellido(String(data.get("name", ""))),
	})



	_kit = GameState.kit_variant(rival, 0)
	_jugador = make_player(KitRecolor.appearance_for(
		String(data.get("name", "?")), _kit), "south")












	_kit["apellido"] = Career.nombre_espalda()
	_playera = make_jersey(_kit, int(data.get("number", 0)))
	_playera.visible = false



	make_audio(ATT, false)
	flash_rate = 7.0
	flash_burst_at = T_JERSEY
	flash_burst_dur = 1.6

	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT
	make_chyron(I18n.t("SE VA AL RIVAL"),
		String(rival.get("name", "?")).to_upper(), rival, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("FICHA POR EL RIVAL"), 38)
	card_sub(String(data.get("name", "")).to_upper(), CareerTheme.DANGER)
	card_stats(_stats())
	card_note(_note_line())
	card_cta(I18n.t("SEGUIR"))


func _tick(_delta: float) -> void:


	if not _mostrada and t >= T_JERSEY:
		_mostrada = true




		if is_instance_valid(_playera):
			_playera.visible = true
		ovation(-3.0)
		punch_fov(3.0, 0.35)


func _skipped() -> void:
	if not _mostrada:
		_tick(0.0)






func _stats() -> Array:
	var fee: int = maxi(int(data.get("fee", 0)), 0)
	var media: int = maxi(int(data.get("media", 0)), 0)
	var t_mio: Dictionary = Teams.by_id(String(data.get("from", "")))
	return [
		{"v": String(t_mio.get("abbrev", "—")), "k": I18n.t("venía de")},
		{"v": CareerUi.money(fee) if fee > 0 else I18n.t("LIBRE"), "k": I18n.t("traspaso")},
		{"v": str(media) if media > 0 else "—", "k": I18n.t("media")},
	]



func _apellido(full: String) -> String:
	var partes: PackedStringArray = full.strip_edges().split(" ", false)
	return String(partes[partes.size() - 1]).to_upper() if partes.size() > 0 \
			else full.to_upper()


func _note_line() -> String:
	if int(data.get("fee", 0)) <= 0:
		return I18n.t("Se fue gratis. A ellos.")
	return I18n.t("Lo pagaron, y lo pagaron caro. Sigue doliendo.")
