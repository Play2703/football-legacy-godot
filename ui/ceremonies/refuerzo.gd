extends Ceremony























































const WALK_FROM_X: float = 22.0



const RUMBO: float = -1.0



const WALK_Z: float = 51.0
const PAIR_DZ: float = 1.0












const GRUPO: Array = [
	[3.4, -1.4], [3.8, 1.2], [5.2, -0.4], [5.6, 1.9], [7.0, 0.3], [7.4, -1.8],
]
























const DT_ATRAS: float = 8.0
const DT_LADO: float = 3.4













const VELOCIDAD: float = 0.85

















const VEL_MIN: float = 0.93
const VEL_MAX: float = 1.07




const KEYS: Array = [
	{"t": 0.0, "dist": 9.5, "h": 2.2, "yaw": 280.0, "aim_y": 1.5, "fov": 44.0},
	{"t": 6.0, "dist": 10.2, "h": 2.7, "yaw": 286.0, "aim_y": 1.6, "fov": 46.0},
]


const FOCUS_X: float = WALK_FROM_X







const SEGUIMIENTO: float = 2.0




const KICKOFF: float = 0.0



const SCRIM: float = 0.55






const T_ANDAR: float = 0.0




const T_FICHA: float = 5.9

var _el: AnimatedSprite3D = null
var _andando: bool = false
var _mates: Array[AnimatedSprite3D] = []


func _accent_for() -> Color:

	return CareerTheme.accent()


func _build() -> void:
	make_stadium({
		"div": div(),




		"training": true,



		"home_club": String(team().get("id", "")),
		"home_only": true,
		"kit": GameState.kit_variant(team(), 0),
		"weather": "day",
		"kickoff": KICKOFF,



		"attendance": 0.0,
		"venue_empty": true,
	})
	scrim_dim(SCRIM)
	focus = Vector3(FOCUS_X, 0.0, WALK_Z)
	make_camera(KEYS, 44.0)


	orbit_speed = -0.3

	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.player_kit(), true)
	look["number"] = dorsal_vivido()




	make_player(look, "south")
	add_walk(player, look)
	player.position.x = WALK_FROM_X
	player.position.z = WALK_Z - PAIR_DZ * 0.5

	_el = _make_refuerzo(Vector3(WALK_FROM_X, 0.0, WALK_Z + PAIR_DZ * 0.5))
	_monta_grupo(look)






	coach_sprite(Vector3(WALK_FROM_X - RUMBO * DT_ATRAS, 0.0, WALK_Z + DT_LADO),
		1.8, Career.coach_look(), Career.coach_name(), false, Career.coach_nivel())
	_reparte_ritmo()
	make_audio(0.0, false)






	var vuelve: bool = _ex() > 0
	make_chyron(I18n.t("REGRESA A CASA") if vuelve else I18n.t("REFUERZO"),
		CareerTheme.caps(String(data.get("name", ""))), team(), 1.6)
	make_card(T_FICHA)
	card_title(I18n.t("VUELVE A CASA") if vuelve else I18n.t("TE HICIERON CASO"), 40)
	card_sub(CareerTheme.caps(String(data.get("name", ""))))
	card_stats(_stats())
	if vuelve:
		card_note(I18n.tf("La grada no lo olvidó: {0} con esta camiseta."
			+ " Desde hoy vuelve a entrenar contigo.",
			["%d %s" % [_ex(), I18n.plural(_ex(), "temporada", "temporadas")]]))
	else:
		card_note(I18n.t("Lo señalaste tú y el club puso el dinero."
			+ " Desde hoy entrena contigo."))
	card_cta(I18n.t("SEGUIR"))





func _ex() -> int:
	return maxi(int(data.get("ex", 0)), 0)










func _stats() -> Array:
	var fee: int = maxi(int(data.get("fee", 0)), 0)
	var media: int = maxi(int(data.get("media", 0)), 0)
	var de: Dictionary = Teams.by_id(String(data.get("from", "")))
	return [









		{"v": CareerUi.short_money(fee), "k": I18n.t("traspaso"), "c": CareerTheme.MONEY}
			if fee > 0 else {"v": I18n.t("LIBRE"), "k": I18n.t("traspaso")},
		{"v": str(media) if media > 0 else "—", "k": I18n.t("media")},
		{"v": String(de.get("abbrev", "—")), "k": I18n.t("venía de")},
	]






func _make_refuerzo(at: Vector3) -> AnimatedSprite3D:
	var kit: Dictionary = GameState.team_custom.duplicate()
	kit.merge(GameState.kit_variant(team(), 0), true)





	var base: Dictionary = KitRecolor.team_only(kit)
	var portero: bool = String(data.get("pos",
		_puestos().get(String(data.get("name", "")), ""))) == "POR"
	var cfg: Dictionary = KitRecolor.appearance_for(
		String(data.get("name", "refuerzo")), _ropa_portero(base) if portero else base)
	if portero:
		cfg = KitRecolor.keeper_field_cfg(cfg)
	cfg["number"] = int(data.get("number", 0))




	var nm: String = String(data.get("name", ""))
	if not nm.is_empty():
		cfg["apellido"] = Career.espalda_de(nm)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = player_frames(cfg, "south")
	spr.position = Vector3(at.x,
		feet_offset(spr.pixel_size) - PLAYER_SINK, at.z)
	viewport.add_child(spr)
	add_walk(spr, cfg)
	spr.play("idle")
	return spr










func _monta_grupo(_look: Dictionary) -> void:
	var kit: Dictionary = GameState.team_custom.duplicate()
	kit.merge(GameState.kit_variant(team(), 0), true)
	var cid: String = String(team().get("id", ""))





	var mio: int = dorsal_vivido()
	var suyo: int = int(data.get("number", 0))
	var gente: Array = []
	for row in squad_people(cid, GRUPO.size() + 4, true, String(data.get("name", ""))):
		var n: int = int(row.get("number", 0))
		if n > 0 and (n == mio or n == suyo):
			continue
		gente.append(row)
		if gente.size() >= GRUPO.size():
			break
	while gente.size() < GRUPO.size():
		gente.append({"name": "", "number": 0, "idx": gente.size()})
	var base: Dictionary = KitRecolor.team_only(kit)



	var puestos: Dictionary = _puestos()
	for i in GRUPO.size():
		var portero: bool = puestos.get(String(gente[i].get("name", "")), "") == "POR"
		var cfg: Dictionary = person_look(gente[i], _ropa_portero(base) if portero else base)
		if portero:
			cfg = KitRecolor.keeper_field_cfg(cfg)
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.sprite_frames = player_frames(cfg, "south")



		spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		spr.position = Vector3(WALK_FROM_X - RUMBO * float(GRUPO[i][0]),
			feet_offset(spr.pixel_size) - PLAYER_SINK,
			WALK_Z + float(GRUPO[i][1]))
		viewport.add_child(spr)
		add_walk(spr, cfg)
		spr.play("idle")
		_mates.append(spr)








func _reparte_ritmo() -> void:
	for spr in _todos():
		var pareja: bool =(spr == player or spr == _el)
		var f: float = rng.randf_range(
			lerpf(VEL_MIN, 1.0, 0.55) if pareja else VEL_MIN,
			lerpf(VEL_MAX, 1.0, 0.55) if pareja else VEL_MAX)
		spr.set_meta("vel", f)
		spr.speed_scale = f







func _ropa_portero(base: Dictionary) -> Dictionary:
	var gk: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(
		String(team().get("id", "")), -1, String(base.get("pattern", ""))), base)
	for k in base:
		if String(k).begins_with("num_"):
			gk[k] = base[k]
	return gk





func _puestos() -> Dictionary:
	var out: Dictionary = {}
	for row in Squad.of(String(team().get("id", ""))):
		out[String((row as Dictionary).get("name", ""))] = String((row as Dictionary).get("pos", ""))
	return out


func _tick(delta: float) -> void:
	if not _andando and t >= T_ANDAR:
		_andando = true
	if _andando:
		_andar(delta)


	_seguir(delta)










func _seguir(delta: float) -> void:
	if player == null or not is_instance_valid(player):
		return
	focus.x = lerpf(focus.x, player.position.x, minf(1.0, SEGUIMIENTO * delta))


func _andar(delta: float) -> void:






	var dir: Vector3 = Vector3(RUMBO, 0.0, 0.0)
	for spr in _todos():
		spr.position.x += RUMBO * VELOCIDAD * float(spr.get_meta("vel", 1.0)) * delta



		walk_play(spr, dir)
		_desfasa(spr)






func _desfasa(spr: AnimatedSprite3D) -> void:
	if spr.has_meta("desfasado") or not spr.animation.begins_with("walk"):
		return
	spr.set_meta("desfasado", true)
	var n: int = spr.sprite_frames.get_frame_count(spr.animation)
	if n > 1:
		spr.frame = rng.randi_range(0, n - 1)






func _todos() -> Array:
	var out: Array = []
	if player != null and is_instance_valid(player):
		out.append(player)
	if _el != null and is_instance_valid(_el):
		out.append(_el)
	for spr in _mates:
		if spr != null and is_instance_valid(spr):
			out.append(spr)
	return out
