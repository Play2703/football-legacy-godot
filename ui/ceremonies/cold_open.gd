extends Ceremony













































const MATCH_SCENE: String = "res://features/match/match.tscn"




















const DURATION: Dictionary = {"anthem": 6.5, "tifo": 4.2,
	"vitrina": 4.6, "tunel": 9.3, "banquillo": 4.6, "sombra": 6.4, "pases": 8.2,
	"pronostico": 8.2}


const LINE_N: int = 11




const LINE_STEP: float = 1.15
const LINE_H: float = 1.78
























const KEYS_ANTHEM: Array = [
	{"t": 0.0, "dist": 12.0, "h": 2.3, "yaw": 152.0, "aim_y": 1.5, "fov": 34.0},
	{"t": 3.6, "dist": 12.0, "h": 2.3, "yaw": 196.0, "aim_y": 1.5, "fov": 34.0},
	{"t": 6.2, "dist": 5.2, "h": 1.85, "yaw": 186.0, "aim_y": 1.35, "fov": 30.0,
		"focus_x": 2.3, "focus_z": Stadium.HALF_LINE},
]





















const TUNNEL_OUT: Vector3 = Vector3(-33.6, 0.0, Stadium.HALF_LINE)


















const LINE_OUT: int = 3
const WALK_SPEED: float = 1.3
const WALK_GAP: float = 0.46








const QUEUE_X: float = -37.9
const QUEUE_STEP: float = 0.4



const QUEUE_LANE: float = 0.75







const KID_H: float = 1.1
const KID_OFF: float = 0.55







const FILE_STEP: float = 1.55




const FILE_LANE: float = 1.15
const STOP_X: float = -32.0













const CUP_Z: float = Stadium.HALF_LINE
const CUP_X: float = -31.0
const CUP_PLINTH: Vector3 = Vector3(0.76, 0.98, 0.62)
const CUP_H: float = 1.1

const CUP_SINK: float = 0.1



const CUP_ICON: Dictionary = {
	"champions": "champions", "europa": "europa", "conference": "conference",
	"copa": "copa", "mundialito": "clubes", "mundial": "mundial",
	"clasif": "mundial", "liga": "liga",



	"libertadores": "libertadores", "sudamericana": "sudamericana",
	"concacaf": "concacaf", "oriente": "oriente", "sol": "sol",
	"atlas": "atlas", "baobab": "baobab",

	"coral": "coral",
}




























const INTERIOR_T: float = 2.8
const KEYS_TUNEL: Array = [





	{"t": 0.0, "dist": 4.5, "h": 1.6, "yaw": 261.0, "aim_y": 1.25, "fov": 62.0,
		"focus_x": 122.9, "focus_z": Stadium.HALF_LINE},
	{"t": 2.79, "dist": 3.7, "h": 1.5, "yaw": 267.0, "aim_y": 1.25, "fov": 58.0,
		"focus_x": 122.7, "focus_z": Stadium.HALF_LINE},
	{"t": 2.8, "dist": 8.2, "h": 0.7, "yaw": 94.0, "aim_y": 1.3, "fov": 42.0},
	{"t": 6.2, "dist": 6.6, "h": 1.3, "yaw": 102.0, "aim_y": 1.4, "fov": 40.0},
	{"t": 9.0, "dist": 10.5, "h": 2.2, "yaw": 104.0, "aim_y": 1.45, "fov": 42.0,
		"focus_x": -32.0, "focus_z": Stadium.HALF_LINE},
]




const TUNEL_ROAR: float = INTERIOR_T + 1.6





const STAND_X: float = Stadium.SIDE_STAND_X - 0.5









const KEYS_TIFO: Array = [
	{"t": 0.0, "dist": 46.0, "h": 7.0, "yaw": 248.0, "aim_y": 5.0, "fov": 44.0},
	{"t": 4.0, "dist": 38.0, "h": 10.0, "yaw": 256.0, "aim_y": 7.0, "fov": 40.0},
]







const KEYS_VITRINA: Array = [
	{"t": 0.0, "dist": 7.5, "h": 2.2, "yaw": 168.0, "aim_y": 1.2, "fov": 40.0},
	{"t": 4.4, "dist": 3.2, "h": 1.55, "yaw": 186.0, "aim_y": 1.05, "fov": 34.0},
]













const BENCH_Z_OFF: float = -13.0
const RONDO_N: int = 5
const RONDO_R: float = 2.6
const RONDO_C: Vector3 = Vector3(-26.0, 0.0, Stadium.HALF_LINE - 9.5)
const SELF_AT: Vector3 = Vector3(-31.5, 0.0, Stadium.HALF_LINE + BENCH_Z_OFF)



const BALL_HOP: float = 0.55













const KEYS_BANQUILLO: Array = [






	{"t": 0.0, "dist": 7.2, "h": 1.6, "yaw": 304.0, "aim_y": 1.05, "fov": 44.0,
		"focus_x": -29.5, "focus_z": Stadium.HALF_LINE - 11.5},
	{"t": 4.4, "dist": 8.0, "h": 2.6, "yaw": 300.0, "aim_y": 0.9, "fov": 44.0,
		"focus_x": -26.0, "focus_z": Stadium.HALF_LINE - 9.5},
]

var _mode: String = "tifo"






func _consume() -> Dictionary:
	if not _es_previa():
		return super._consume()
	var fx: Dictionary = GameState.current_fixture()
	var final: bool = GameState.fixture_is_knockout(fx) \
			and Competitions.stage_of(fx) == "FINAL"




	var sombra: Dictionary = {} if _is_nat() else Career.sombra_a_tiro()

	var goleo: Dictionary = {} if _is_nat() else GoleoVivo.para_previa(
		String(fx.get("comp", "")), Career.season_matches, String(fx.get("opp", "")))

	var prono: Dictionary = {} if _is_nat() else Pronostico.para_previa(fx,
		Career.season_matches)
	var mode: String = Ceremonies.cold_open_for(_is_nat(), Career.nat_caps,
		_derby(), _comp(), GameState.retro_kit_on(), final,
		Competitions.id_of(fx) if _is_nat() else "", GameState.next_starter,
		not sombra.is_empty(), not goleo.is_empty(), not prono.is_empty())
	if mode.is_empty():
		return {}





	return _con_sombra(_con_leyenda({"kind": "cold_open", "mode": mode, "comp": _comp(),
		"nat": _is_nat(), "final_comp": Competitions.id_of(fx),




		"derby": _derby(),


		"rival": String(fx.get("opp", "")),

		"goleo": goleo if mode == "pases" else {},

		"pronostico": prono if mode == "pronostico" else {},

		"pestana": HubBanner.linea_de(fx) if mode == "pases" or mode == "pronostico"
			else "",
		"club": GameState.player_team_id, "season": GameState.season_num}), sombra)















static func _con_leyenda(payload: Dictionary) -> Dictionary:
	var tunel_de_club: bool = String(payload.get("mode", "")) == "tunel" \
			and not bool(payload.get("nat", false))
	payload["leyenda"] = {} if not tunel_de_club else Career.leyenda_para_acto(
		Career.leyenda_en_club(String(payload.get("rival", ""))))
	return payload










static func _con_sombra(payload: Dictionary, sombra: Dictionary) -> Dictionary:
	if String(payload.get("mode", "")) != "sombra":
		return payload
	payload["sombra"] = sombra
	Career.sella_sombra(String(sombra.get("key", "")))
	return payload






const PREVIA_DB: float = -19.0

var _previa: AudioStreamPlayer = null


func _ready() -> void:


	await super._ready()
	if not _es_previa():
		_monta_previa()
		return
	if data.is_empty() and not _leaving:
		SceneFade.to_scene(MATCH_SCENE)
		return
	_monta_previa()




	if not standalone:
		SceneFade.calienta_partido_en_acto()











func _monta_previa() -> void:
	var st: AudioStream = AudioBank.stream("prematch_bed")
	if st == null:
		return
	_previa = AudioStreamPlayer.new()
	_previa.stream = st
	_previa.volume_db = -60.0
	_previa.bus = "SFX"
	add_child(_previa)
	_previa.play()
	var tw: Tween = create_tween()
	tw.tween_property(_previa, "volume_db", PREVIA_DB, 1.6)


func _leave() -> void:
	if _leaving:
		return
	if not _es_previa():
		_apaga_previa()
		super._leave()
		return
	_leaving = true



	_apaga_previa()


	SceneFade.to_scene(HUB_SCENE if standalone else MATCH_SCENE)


func _apaga_previa() -> void:
	if _previa != null and is_instance_valid(_previa):
		var tw: Tween = create_tween()
		tw.tween_property(_previa, "volume_db", -60.0, 0.5)









func _es_previa() -> bool:
	return true






func _stage_team() -> Dictionary:
	if String(data.get("mode", "")) == "anthem" or bool(data.get("nat", false)):
		var nat: Dictionary = Nations.as_team(Career.nationality)
		if not nat.is_empty():
			return nat
	return team()


func _accent_for() -> Color:



	if String(data.get("mode", "")) == "vitrina":
		return CareerTheme.MONEY



	if String(data.get("mode", "")) == "tunel":
		return Competitions.COMP_ACCENT.get(_final_comp(),
			CareerTheme.accent_of(_stage_team()))




	if String(data.get("mode", "")) in ["pases", "pronostico"]:
		return Competitions.accent_of({"comp": _pases_key()})
	var comp: String = String(data.get("comp", ""))
	if not comp.is_empty() and Competitions.COMP_ACCENT.has(comp):
		return Competitions.COMP_ACCENT[comp]
	return CareerTheme.accent_of(_stage_team())







func _estadio_previo() -> Dictionary:
	return _cfg_estadio()


func _cfg_estadio() -> Dictionary:
	_mode = String(data.get("mode", "tifo"))
	return {






		"div": 1 if _mode == "tunel" else div(),








		"home_only": _mode != "tifo",










		"party": _is_derby(),







		"flare_cap": FLARE_DERBI if _is_derby() else -1,
		"flare_odds": FLARE_ODDS_DERBI if _is_derby() else 1.0,





		"tifo_especial": Career.tifo_especial() if _mode == "tifo" else {},
		"rival_club": String(_tifo_rival().get("id", "")),



		"attendance": 0.85 if _mode == "banquillo" else 1.0,



		"weather": _tunel_moja() if _tunel_moja() != "" \
				else ("night" if _mode == "tifo" or _mode == "tunel" else "sunset"),
		"kit": GameState.kit_variant(_stage_team(), 0),

		"banner": I18n.t("DERBI") if _mode == "tifo" \
				else (I18n.t("LA FINAL") if _mode == "tunel" else I18n.t("VAMOS")),



		"board": _board_text(),
	}


func _build() -> void:
	_mode = String(data.get("mode", "tifo"))


	card_at = 0.0
	var who: Dictionary = _stage_team()
	var kit: Dictionary = GameState.kit_variant(who, 0)
	make_stadium(_cfg_estadio())
	match _mode:
		"anthem":
			_build_anthem(who, kit)
		"tunel":
			_build_tunel(who, kit)
		"vitrina":
			_build_vitrina(who)
		"banquillo":
			_build_banquillo(who, kit)
		"sombra":
			_build_sombra(who, kit)
		"pases":
			_build_pases(kit)
		"pronostico":
			_build_pronostico(kit)
		_:
			_build_tifo(who)
	make_audio(1.0, true)
	stadium.crowd_excite(1.0)
	flash_pool = stand_flash_pool(CENTER_Z, 34.0)




	if _mode == "tunel" or _mode == "banquillo" or _mode == "sombra" \
			or _mode == "pases" or _mode == "pronostico":






		flash_rate = 0.0
		flash_burst_at = -1.0
	else:
		flash_rate = 26.0
		flash_burst_at = 0.4
		stadium.pulse_ads(3.0)
		ovation(-1.0)


func _board_text() -> String:
	match _mode:
		"anthem":
			return I18n.t("HIMNO")
		"tunel":


			return I18n.t("LA FINAL")
		_:
			return ""






func _final_comp() -> String:
	var c: String = String(data.get("final_comp", ""))
	return c if not c.is_empty() else String(data.get("comp", ""))






func _cup_icon() -> String:
	var icono: String = String(CUP_ICON.get(_final_comp(), "copa"))
	if icono == "mundial" and String(GameState.nat_state.get("comp", "")) == "cont":
		return "continental"
	return icono




















func _tunel_moja() -> String:
	if _mode != "tunel":
		return ""
	var w: String = String(data.get("weather", GameState.next_weather))
	return w if WeatherWear.marks_on(w) else ""


func _build_tunel(who: Dictionary, kit: Dictionary) -> void:
	focus = TUNNEL_OUT
	make_camera(KEYS_TUNEL, 42.0)


	orbit_speed = 0.0






	make_tunnel_mouth(CENTER_Z, false, accent)
	_build_tunnel_hall()
	_build_cup()
	_build_walkout(kit)












	if stadium != null:
		stadium.visible = false








	var ley: Dictionary = _leyenda()
	var pie: String = "" if ley.is_empty() \
			else I18n.tf("ENFRENTE, {0}", [String(ley.get("nombre", "")).to_upper()])
	make_chyron(_tag(), Nations.team_label(who, "?").to_upper(), who,
		TUNEL_ROAR + 0.5, "", pie)









func _build_cup() -> void:
	var at: Vector3 = Vector3(CUP_X, 0.0, CUP_Z)
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = CUP_PLINTH
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.07, 0.08, 0.11)
	mat.roughness = 0.9
	box.material_override = mat
	box.position = at + Vector3(0.0, CUP_PLINTH.y * 0.5, 0.0)
	viewport.add_child(box)
	var skirt: MeshInstance3D = MeshInstance3D.new()
	var sq: QuadMesh = QuadMesh.new()
	sq.size = Vector2(CUP_PLINTH.x * 0.88, CUP_PLINTH.y * 0.5)
	skirt.mesh = sq
	var smat: StandardMaterial3D = StandardMaterial3D.new()
	smat.albedo_color = accent
	smat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	skirt.material_override = smat


	skirt.rotation_degrees = Vector3(0.0, 90.0, 0.0)
	skirt.position = at + Vector3(CUP_PLINTH.x * 0.5 + 0.01,
		CUP_PLINTH.y * 0.5, 0.0)
	viewport.add_child(skirt)
	make_trophy(_cup_icon(),
		at + Vector3(0.0, CUP_PLINTH.y + CUP_H * 0.5 - CUP_SINK, 0.0), CUP_H)



	var lamp: OmniLight3D = OmniLight3D.new()
	lamp.light_color = accent.lightened(0.45)
	lamp.light_energy = 2.6
	lamp.omni_range = 4.2
	lamp.shadow_enabled = false
	lamp.position = at + Vector3(0.55, 2.35, 0.0)
	viewport.add_child(lamp)





















const HALL_DX: float = 165.0
const HALL_BACK_X: float = -47.6 + HALL_DX
const HALL_END_X: float = -35.8 + HALL_DX
const HALL_GLOW: Color = Color(0.85, 0.72, 0.48)

const STAIR_N: int = 4
const STAIR_H: float = 0.17
const STAIR_D: float = 0.3
const STAIR_RISE: float = 0.68
const RAIL: Color = Color(0.6, 0.62, 0.66)


const HALL_SHIFT: float = HALL_DX - 3.9

func _build_tunnel_hall() -> void:
	var half: float = MOUTH_HALF_W
	preload("res://features/stadium/stadium_finish.gd").pasillo(viewport,
		HALL_BACK_X, HALL_END_X - STAIR_N * STAIR_D - 0.4,
		CENTER_Z, half, MOUTH_H, stadium.div if stadium != null else 1)
	preload("res://features/stadium/tunnel_detail.gd").pasillo(viewport,
		HALL_BACK_X, HALL_END_X - STAIR_N * STAIR_D - 0.4,
		CENTER_Z, half, MOUTH_H, stadium.div if stadium != null else 1)
	var len_x: float = HALL_END_X - HALL_BACK_X
	for badge_x in [HALL_BACK_X + 2.3, HALL_END_X - 3.0]:
		_tunnel_wall_crests(badge_x, CENTER_Z, half, 1.0)
	var mid_x: float =(HALL_END_X + HALL_BACK_X) * 0.5
	for s in [-1.0, 1.0]:
		_mouth_slab(Vector3(mid_x, MOUTH_H * 0.5, CENTER_Z + s *(half - 0.03)),
			Vector3(len_x, MOUTH_H, 0.06), MOUTH_IN_WALL)



	_mouth_slab(Vector3(mid_x, -0.03, CENTER_Z),
		Vector3(len_x, 0.06, half * 2.0), MOUTH_IN_FLOOR)
	_mouth_slab(Vector3(mid_x, MOUTH_H - 0.03, CENTER_Z),
		Vector3(len_x, 0.06, half * 2.0), MOUTH_IN_WALL.darkened(0.3))
	_mouth_slab(Vector3(HALL_BACK_X, MOUTH_H * 0.5, CENTER_Z),
		Vector3(0.2, MOUTH_H, half * 2.0), MOUTH_DARK)







	for lado in [-1.0, 1.0]:
		_mouth_slab(Vector3(HALL_END_X, MOUTH_H * 0.5, CENTER_Z + lado * half * 0.8),
			Vector3(0.18, MOUTH_H, half * 0.4), MOUTH_IN_WALL)
	_mouth_slab(Vector3(HALL_END_X, MOUTH_H - 0.18, CENTER_Z), Vector3(0.2, 0.36, half * 1.2), MOUTH_IN_WALL)
	_mouth_slab(Vector3(HALL_END_X + 1.15, STAIR_RISE - 0.06, CENTER_Z + 1.0), Vector3(2.5, 0.12, 4.6), Color("565850"))
	_mouth_slab(Vector3(HALL_END_X + 2.3, 1.9, CENTER_Z + 1.0), Vector3(0.18, 2.5, 4.6), Color("676653"))
	_mouth_slab(Vector3(HALL_END_X + 1.1, 1.9, CENTER_Z - 1.3), Vector3(2.4, 2.5, 0.16), Color("41494a"))
	_mouth_slab(Vector3(HALL_END_X + 1.1, 3.1, CENTER_Z + 1.0), Vector3(2.4, 0.1, 4.6), Color("353b3c"))
	_mouth_slab(Vector3(HALL_END_X + 1.1, 3.0, CENTER_Z + 2.0), Vector3(1.2, 0.06, 0.35), MOUTH_LAMP)
	var exit_sign: Label3D = Label3D.new()
	exit_sign.text = "→"
	exit_sign.font_size = 96
	exit_sign.pixel_size = 0.005
	exit_sign.modulate = Color("a2d5b5")
	exit_sign.position = Vector3(HALL_END_X + 2.18, 2.15, CENTER_Z)
	exit_sign.rotation.y = - PI * 0.5
	viewport.add_child(exit_sign)


	var sw: float = half * 2.0 * 0.6
	for i in STAIR_N:
		var top: float = STAIR_RISE - float(i) * STAIR_H
		var sx: float = HALL_END_X - 0.15 -(float(i) + 0.5) * STAIR_D
		_mouth_slab(Vector3(sx, top * 0.5, CENTER_Z),
			Vector3(STAIR_D, top, sw),
			MOUTH_IN_FLOOR.lightened(0.3 - 0.06 * float(i)))


		for s in [-1.0, 1.0]:
			var rz: float = CENTER_Z + s *(sw * 0.5 + 0.09)
			_mouth_slab(Vector3(sx, top + 0.42, rz),
				Vector3(0.06, 0.84, 0.06), RAIL)
			_mouth_slab(Vector3(sx, top + 0.86, rz),
				Vector3(STAIR_D + 0.03, 0.06, 0.07), RAIL)

	_mouth_slab(Vector3(HALL_END_X - 0.3 - STAIR_N * STAIR_D - 0.6, 0.003,
		CENTER_Z), Vector3(1.2, 0.004, half * 1.25), MOUTH_IN_FLOOR.lightened(0.35))


	for s in [-1.0, 1.0]:
		_mouth_slab(Vector3(mid_x, 1.95, CENTER_Z + s *(half - 0.05)),
			Vector3(len_x, 0.2, 0.05), accent)


	for s in [-1.0, 1.0]:
		_mouth_slab(Vector3(mid_x, 0.11, CENTER_Z + s *(half - 0.06)),
			Vector3(len_x, 0.22, 0.05), MOUTH_IN_WALL.darkened(0.45))


	for lx in [HALL_DX - 37.5, HALL_DX - 39.5, HALL_DX - 41.5, HALL_DX - 43.5, HALL_DX - 45.5]:
		_mouth_slab(Vector3(lx, MOUTH_H - 0.11, CENTER_Z),
			Vector3(1.1, 0.07, 0.34), MOUTH_LAMP)
		_mouth_slab(Vector3(lx, 0.004, CENTER_Z),
			Vector3(1.0, 0.004, half * 1.1), MOUTH_IN_FLOOR.lightened(0.22))
	for lx in [-42.2, -44.6]:
		_mouth_slab(Vector3(lx, MOUTH_H - 0.11, CENTER_Z),
			Vector3(1.4, 0.07, 0.34), MOUTH_LAMP)
		_mouth_slab(Vector3(lx, 0.004, CENTER_Z),
			Vector3(1.3, 0.004, half * 1.1), MOUTH_IN_FLOOR.lightened(0.22))













const WALK_FACES: int = 5


func _build_walkout(kit: Dictionary) -> void:



	var rival: Dictionary = _final_rival()
	var rival_kit: Dictionary = GameState.kit_variant(rival, 1) if not rival.is_empty() \
			else KitRecolor.team_only(kit)
	_build_column(kit, true)
	_build_column(rival_kit, false)






func _final_rival() -> Dictionary:
	var id: String = String(data.get("rival", ""))
	if id.is_empty():
		return {}
	if bool(data.get("nat", false)):
		return Nations.as_team(id)
	return Teams.by_id(id)







func _leyenda() -> Dictionary:
	var raw: Variant = data.get("leyenda", {})
	if not raw is Dictionary or bool(data.get("nat", false)):
		return {}
	var ley: Dictionary = raw
	if ley.is_empty():
		return {}
	var rival: String = String(data.get("rival", ""))
	if rival.is_empty() or String(ley.get("club", "")) != rival \
			or String(ley.get("cara", "")).is_empty():
		return {}
	return ley











func _build_column(kit: Dictionary, ours: bool) -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)



	look["number"] = GameState.shirt_number_now()
	var team_kit: Dictionary = KitRecolor.team_only(kit)
	var seed_key: String = "tunel_us" if ours else "tunel_them"
	var faces: Array[Dictionary] = []
	for i in WALK_FACES:
		faces.append(KitRecolor.appearance_for("%s_%d" % [seed_key, i], team_kit))



	if _tunel_moja() != "":
		look["chamarra"] = true
		for f: Dictionary in faces:
			f["chamarra"] = true
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	var side: float = 1.0 if ours else -1.0
	var ley: Dictionary = {} if ours else _leyenda()
	for i in LINE_OUT:
		var s: AnimatedSprite3D = AnimatedSprite3D.new()


		var mine: bool = ours and i == 0
		var cfg: Dictionary = look if mine else faces[i % faces.size()]






		if not ley.is_empty() and i == 0:
			cfg = person_look({"name": String(ley["cara"]),
				"number": int(ley.get("dorsal", 0))}, team_kit)
			cfg["club"] = String(ley["club"])
			if _tunel_moja() != "":
				cfg["chamarra"] = true
			s.set_meta("leyenda", String(ley.get("key", "")))
		s.sprite_frames = player_frames(cfg)
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF





		var qpos: Vector3 = Vector3(QUEUE_X - float(i) * QUEUE_STEP, y,
			CENTER_Z + side * QUEUE_LANE)
		s.position = qpos + Vector3(HALL_SHIFT, 0.0, 0.0)
		viewport.add_child(s)

		add_walk(s, cfg)
		s.play("idle")
		if mine:
			player = s
		_walkers.append({
			"spr": s,
			"from": qpos,




			"to": Vector3(STOP_X - float(i) * FILE_STEP, y,
				CENTER_Z + side * FILE_LANE),



			"at": INTERIOR_T +(float(i) * 2.0 +(0.0 if ours else 1.0)) * WALK_GAP,
		})



		var kcfg: Dictionary = faces[(i + 2) % faces.size()].duplicate()


		kcfg = KitRecolor.infantil(kcfg)
		var k: AnimatedSprite3D = AnimatedSprite3D.new()
		k.sprite_frames = player_frames(kcfg)
		var kpx: float = KID_H / PLAYER_METRICS.x
		k.pixel_size = kpx
		k.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		k.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		k.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		k.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var ky: float = feet_offset(kpx) - PLAYER_SINK
		var kq: Vector3 = Vector3(QUEUE_X - float(i) * QUEUE_STEP, ky,
			CENTER_Z + side *(QUEUE_LANE + KID_OFF))
		k.position = kq + Vector3(HALL_SHIFT, 0.0, 0.0)
		viewport.add_child(k)
		add_walk(k, kcfg)
		k.play("idle")
		_walkers.append({
			"spr": k,
			"from": kq,
			"to": Vector3(STOP_X - float(i) * FILE_STEP, ky,
				CENTER_Z + side *(FILE_LANE + KID_OFF)),


			"at": INTERIOR_T +(float(i) * 2.0 +(0.0 if ours else 1.0)) * WALK_GAP,
		})





var _tunnel_step: AudioStreamPlayer
var _step_clock: float = 0.0

func _tunnel_footfall() -> void:
	if _tunnel_step == null:
		_tunnel_step = AudioStreamPlayer.new()
		_tunnel_step.bus = "SFX"
		_tunnel_step.volume_db = -25.0
		var wav: AudioStreamWAV = AudioStreamWAV.new()
		wav.format = AudioStreamWAV.FORMAT_16_BITS
		wav.mix_rate = 22050
		var bytes: PackedByteArray = PackedByteArray()
		bytes.resize(8820 * 2)
		var rng: RandomNumberGenerator = RandomNumberGenerator.new()
		rng.seed = 3187
		for i in 8820:
			var seconds: float = float(i) / 22050.0
			var sample: float = 0.0
			for delay in [0.0, 0.085, 0.17]:
				var age: float = seconds - delay
				if age >= 0.0:
					sample +=(sin(age * TAU * 110.0) * 0.55 + rng.randf_range(-0.2, 0.2)) * exp(- age * 55.0) *(1.0 if delay == 0.0 else 0.22)
			bytes.encode_s16(i * 2, int(clampf(sample, -1.0, 1.0) * 24000.0))
		wav.data = bytes
		_tunnel_step.stream = wav
		add_child(_tunnel_step)
	_tunnel_step.play()


func _tick_walkout(delta: float) -> void:
	if _previa != null and t > 1.6 and not _leaving:
		_previa.volume_db = PREVIA_DB - 11.0 *(1.0 - clampf((t - INTERIOR_T) / 3.0, 0.0, 1.0))
	var walking_inside: bool = false




	if not _cut and t >= INTERIOR_T:
		_cut = true
		if stadium != null:
			stadium.visible = true
		for w in _walkers:
			(w["spr"] as AnimatedSprite3D).position = w["from"]
	for w in _walkers:
		var spr: AnimatedSprite3D = w["spr"]
		_shade_tunnel(spr)
		if t < float(w["at"]):
			continue
		var to: Vector3 = w["to"]
		var dir: Vector3 = to - spr.position
		dir.y = 0.0
		if dir.length() <= WALK_SPEED * delta:


			spr.position = Vector3(to.x, spr.position.y, to.z)
			walk_play(spr, Vector3.ZERO)
			continue
		spr.position += dir.normalized() * WALK_SPEED * delta
		if spr.position.x < MOUTH_X:
			walking_inside = true
		walk_play(spr, dir)
	_step_clock -= delta
	if walking_inside and _step_clock <= 0.0:
		_step_clock = 0.46
		_tunnel_footfall()







func _shade_tunnel(spr: AnimatedSprite3D) -> void:


	if t < INTERIOR_T:
		spr.modulate = Color(0.78, 0.78, 0.8)
		return
	var f: float = clampf((spr.position.x -(MOUTH_X - MOUTH_DEPTH)) / MOUTH_DEPTH,
		0.0, 1.0)
	var b: float = lerpf(0.3, 1.0, f)
	spr.modulate = Color(b, b, b)


var _walkers: Array[Dictionary] = []
var _cut: bool = false














const FACES: int = LINE_N - 1









func _nat_people(n: int) -> Array:
	var out: Array = []
	for row in Career.nat_squad_list():
		if out.size() >= n:
			break
		var r: Dictionary = row
		if bool(r.get("is_you", false)):
			continue
		out.append({"name": String(r.get("name", "")),
			"number": int(r.get("number", 0))})
	while out.size() < n:
		out.append({"name": "", "number": 0, "idx": out.size()})
	return out


func _build_anthem(who: Dictionary, kit: Dictionary) -> void:
	focus = Vector3(0.0, 0.0, CENTER_Z)
	make_camera(KEYS_ANTHEM)
	orbit_speed = 0.0
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)



	look["number"] = GameState.shirt_number_now()
	var frames: SpriteFrames = player_frames(look)
	var pool: Array[SpriteFrames] = people_frames_pool(_nat_people(FACES), kit)
	var y: float = feet_offset(LINE_H / PLAYER_METRICS.x) - PLAYER_SINK



	var mine: int = LINE_N / 2 + 2
	for i in LINE_N:
		var x: float =(float(i) - float(LINE_N - 1) * 0.5) * LINE_STEP
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = frames if i == mine else pool[i % pool.size()]
		s.pixel_size = LINE_H / PLAYER_METRICS.x
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.position = Vector3(x, y, CENTER_Z)
		viewport.add_child(s)
		s.play("idle")


		s.speed_scale = rng.randf_range(0.8, 1.25)
		if frames.get_frame_count("idle") > 1:
			s.frame = rng.randi_range(0, frames.get_frame_count("idle") - 1)
		if i == mine:
			player = s
	make_chyron(I18n.t("DEBUT"), Nations.team_label(who, "?").to_upper(), who, 1.0)






func _build_vitrina(who: Dictionary) -> void:
	focus = Vector3(0.0, 0.0, CENTER_Z)
	make_camera(KEYS_VITRINA, 36.0)


	orbit_speed = 0.35
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(GameState.kit_variant(who, 3), true)



	look["number"] = GameState.shirt_number_now()
	make_player(look)
	make_chyron(I18n.t("CAMISETA DE VITRINA"), Nations.team_label(who, "?").to_upper(),
		who, 0.9)












func _build_tifo(who: Dictionary) -> void:











	focus = Vector3(STAND_X, 0.0, CENTER_Z)
	if stadium != null:
		var spot: Vector3 = stadium.tifo_spot()
		if spot.x < INF:
			focus.z = clampf(spot.z, CENTER_Z - 26.0, CENTER_Z + 26.0)
	var keys: Array = KEYS_TIFO.duplicate(true)
	var sweep: Dictionary = _away_sweep_key(keys[keys.size() - 1]) \
			if _is_derby() else {}






	if _is_derby() and stadium != null:
		stadium.flares_at(Vector3(STAND_X, 0.0, focus.z), FLARES_TIFO, FLARES_FILA)
		if not sweep.is_empty():
			stadium.flares_at(stadium.away_stand_spot(), FLARES_AWAY, FLARES_FILA)
	if not sweep.is_empty():
		keys.append(sweep)
		_dur = TIFO_DERBY_DUR



		orbit_speed = -0.35
	else:
		orbit_speed = -1.1
	make_camera(keys)
	var rival: Dictionary = _tifo_rival()
	if rival.is_empty():
		make_chyron(_tag(), Nations.team_label(who, "?").to_upper(), who, 0.8)
		return




	var head: Dictionary = Career.derby_headline(String(rival.get("id", "")))
	var key: String = String(head.get("key", ""))
	make_chyron(_tag(), Nations.team_label(rival, "?").to_upper(), rival, 0.8, "",
		"" if key.is_empty() else I18n.tf(key, head.get("args", [])),


		CareerTheme.DANGER if bool(head.get("bad", false)) else CareerTheme.TEXT)






func _is_derby() -> bool:
	return _mode == "tifo" and bool(data.get("derby", true))




func _tifo_rival() -> Dictionary:
	if not _is_derby():
		return {}
	var id: String = String(data.get("rival", ""))
	if id.is_empty():
		id = Career.rival_id
	return Teams.by_id(id) if not id.is_empty() else {}




















const FLARES_FILA: int = 7
const FLARES_TIFO: int = 5
const FLARES_AWAY: int = 3

const FLARE_DERBI: int = 14
const FLARE_ODDS_DERBI: float = 2.2

const TIFO_SWEEP_T: float = 6.6
const TIFO_SWEEP_H: float = 9.0
const TIFO_SWEEP_AIM_Y: float = 7.5



const TIFO_SWEEP_FOV: float = 26.0


const TIFO_DERBY_DUR: float = 8.4



var _dur: float = -1.0


func _away_sweep_key(prev: Dictionary) -> Dictionary:
	if stadium == null:
		return {}
	var away: Vector3 = stadium.away_stand_spot()

	var yaw0: float = deg_to_rad(float(prev["yaw"]))
	var d0: float = float(prev["dist"])
	var at: Vector2 = Vector2(
		float(prev.get("focus_x", focus.x)) + sin(yaw0) * d0,
		float(prev.get("focus_z", focus.z)) - cos(yaw0) * d0)
	var v: Vector2 = at - Vector2(away.x, away.z)
	var dist: float = v.length()


	if dist < 12.0:
		return {}








	var yaw_to: float = rad_to_deg(atan2(v.x, - v.y))
	yaw_to += 360.0 * roundf((float(prev["yaw"]) - yaw_to) / 360.0)
	return {"t": TIFO_SWEEP_T, "dist": dist, "h": TIFO_SWEEP_H,
		"yaw": yaw_to, "aim_y": TIFO_SWEEP_AIM_Y,
		"fov": TIFO_SWEEP_FOV, "focus_x": away.x, "focus_z": away.z}








var _rondo: Array[Vector3] = []


var _jugadores: Array[AnimatedSprite3D] = []
var _ball: Sprite3D = null



var _rondo_c: Vector3 = RONDO_C
var _rondo_n: int = RONDO_N
var _ball_hold_dur: float = BALL_HOLD
var _ball_i: int = 0
var _ball_t: float = 0.0
var _ball_from: Vector3
var _ball_to: Vector3


var _ball_sale: Vector3

var _ball_amortigua: bool = false










const BALL_HOLD: float = 0.45







const KICK_LEAD: float = 0.2





const CONTROL_LEAD: float = 0.32




const RECIBE_PASO: float = 0.22

var _ball_hold: float = 0.0


var _ball_next: int = -1









const TU_TURNO: float = 0.5





const PASE_VEL: float = 7.0
const PASE_MIN: float = 0.42
const PASE_MAX: float = 1.1

var _ball_hop: float = BALL_HOP


func _build_banquillo(who: Dictionary, kit: Dictionary) -> void:
	focus = SELF_AT
	make_camera(KEYS_BANQUILLO, 40.0)
	orbit_speed = 0.25


	var bib_kit: Dictionary = kit.duplicate()
	bib_kit["bib"] = Stadium.BIB_COLORS[0]
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(bib_kit, true)

	look["number"] = GameState.shirt_number_now()
	make_player(look)



	var pool: Array[SpriteFrames] = squad_frames_pool(bib_kit, RONDO_N,
		GameState.player_team_id, "south", true)
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	for i in RONDO_N:
		var ang: float = TAU * float(i) / float(RONDO_N)
		var at: Vector3 = RONDO_C + Vector3(cos(ang), 0.0, sin(ang)) * RONDO_R
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = pool[i % pool.size()]
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = Vector3(at.x, y, at.z)
		viewport.add_child(s)
		s.play("idle")

		s.speed_scale = rng.randf_range(0.8, 1.25)





		add_idle_views(s)




		add_gesto(s, "kick", 4, 12.0)
		add_gesto(s, "control", 6, 8.0)
		_jugadores.append(s)
		_rondo.append(at)











	if player != null:
		add_idle_views(player, look)
		add_gesto(player, "kick", 4, 12.0)
		add_gesto(player, "control", 6, 8.0)
		_jugadores.append(player)





		_rondo.append(Vector3(player.position.x, 0.0, player.position.z))






	_ball = Sprite3D.new()
	_ball.texture = load(Stadium.BALL_ART)
	_ball.pixel_size = Stadium.BALL_ART_D / 32.0
	_ball.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_ball.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_ball.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD














	_ball_i = _rondo.size() - 1 if player != null else mini(2, _rondo.size() - 1)
	_ball_from = _rondo[0]
	_ball_to = _rondo[_ball_i]
	_ball_hop = clampf(_ball_from.distance_to(_ball_to) / PASE_VEL,
		PASE_MIN, PASE_MAX)
	_ball.position = _ball_from + Vector3(0.0, 0.11, 0.0)
	viewport.add_child(_ball)
	make_chyron(_tag(), Nations.team_label(who, "?").to_upper(), who, 0.8)








func _siguiente_receptor() -> int:
	var yo: int = _rondo.size() - 1
	var hay_yo: bool = _rondo.size() > _rondo_n \
			and _jugadores.size() == _rondo.size() and player != null
	if hay_yo and _ball_i == yo:
		return rng.randi_range(0, _rondo_n - 1)
	if hay_yo and _tus_pies_en_cuadro() and rng.randf() < TU_TURNO:
		return yo
	return (_ball_i + rng.randi_range(1, _rondo_n - 1)) % _rondo_n








func _tus_pies_en_cuadro() -> bool:
	if cam == null or player == null:
		return false
	return cam.is_position_in_frustum(
		Vector3(player.position.x, 0.2, player.position.z))



















func _tick_rondo(delta: float) -> void:
	if _ball == null:
		return

	if _ball_hold > 0.0:
		var antes: float = _ball_hold
		_ball_hold -= delta
		var quien: Vector3 = _rondo[_ball_i]

		var pie: Vector3 = _rondo_pie(quien, _ball_from)
		var hacia: Vector3 =(pie - quien).normalized()
		_ball.position = pie + Vector3(0.0, 0.11, 0.0)


		var spr: AnimatedSprite3D = _jugadores[_ball_i] if _ball_i < _jugadores.size() \
				else null
		if spr != null and is_instance_valid(spr):
			var k: float = 1.0 - clampf(_ball_hold / _ball_hold_dur, 0.0, 1.0)
			var off: Vector3 = hacia *(sin(k * PI) * RECIBE_PASO)



			spr.position = Vector3(quien.x + off.x, spr.position.y, quien.z + off.z)

		var lead: float = _lead(KICK_LEAD, spr)
		if antes > lead and _ball_hold <= lead:
			_ball_next = _siguiente_receptor()
			if spr != null and is_instance_valid(spr):
				gesto_play(spr, "kick", _cal_d("rondo", _rondo[_ball_next] - quien))
		if _ball_hold <= 0.0:
			_ball_hold = 0.0
			if _ball_next < 0:
				_ball_next = _siguiente_receptor()
			_ball_t = 0.0
			_ball_from = _rondo[_ball_i]
			_ball_i = _ball_next
			_ball_to = _rondo[_ball_i]
			_ball_next = -1
			_ball_hop = clampf(_ball_from.distance_to(_ball_to) / PASE_VEL,
				PASE_MIN, PASE_MAX)
			_ball_amortigua = false
	else:





		if _ball_t <= 0.0:
			_ball_sale = Vector3(_ball.position.x, 0.0, _ball.position.z)
		var llega: Vector3 = _rondo_pie(_ball_to, _ball_from)
		_ball_t += delta
		var u: float = clampf(_ball_t / maxf(_ball_hop, 0.01), 0.0, 1.0)
		var at: Vector3 = _ball_sale.lerp(llega, u)


		at.y = 0.11 + sin(u * PI) *(0.24 + 0.05 * _ball_sale.distance_to(llega))
		_ball.position = at


		var spr2: AnimatedSprite3D = _jugadores[_ball_i] \
				if _ball_i < _jugadores.size() else null
		if not _ball_amortigua and spr2 != null and is_instance_valid(spr2) \
				and (_ball_hop - _ball_t <= _lead(CONTROL_LEAD, spr2) or u >= 1.0):
			_ball_amortigua = true
			gesto_play(spr2, "control", _cal_d("rondo", _ball_from - _ball_to))
		if u >= 1.0:

			_ball_hold = _ball_hold_dur











	for p in _jugadores:
		if is_instance_valid(p):
			idle_play(p, _cal_d("rondo", _ball.position - p.position))



















func _rondo_pie(quien: Vector3, otro: Vector3) -> Vector3:
	var hacia: Vector3 = Vector3(_rondo_c.x - quien.x, 0.0, _rondo_c.z - quien.z)

	var vc: Camera3D = vista_de(_jugadores[0] if not _jugadores.is_empty() else null)
	if vc != null:


		var eje: Basis = vc.global_transform.basis
		hacia = _cal_l("rondo", Vector3(eje.x.x, 0.0, eje.x.z))
		if hacia.dot(otro - quien) < 0.0:
			hacia = - hacia
	return quien + hacia.normalized() * 0.45





static func _lead(segundos: float, spr: AnimatedSprite3D) -> float:
	if spr == null or not is_instance_valid(spr):
		return segundos
	return segundos / maxf(spr.speed_scale, 0.1)

























const PASES_Z: float = 21.0
const PASES_YO: Vector3 = Vector3(-9.0, 0.0, PASES_Z)
const PASES_COMPA: Vector3 = Vector3(9.0, 0.0, PASES_Z)



const PASES_BALON_DZ: float = 0.3


const PASES_BALON_M: float = 0.42
const PASES_BALON_PAD_PX: float = 3.0
const PASES_VUELTAS_VARA: float = 2.5
const PASES_G: float = 9.8



const PASES_K1: float = 0.6
const PASES_GLOBO: float = 1.75
const PASES_PECHO: float = 0.55
const PASES_VOLEA: float = 0.85
const PASES_DOMA: float = 0.3
const PASES_CICLO: float = 3.95
const PASES_VUELTAS: int = 2




const PASES_LEAD_EMPEINE: float = 2.0 / 12.0
const PASES_LEAD_PECHO: float = 3.0 / 7.0
const PASES_LEAD_VOLEA: float = 2.0 / 12.0
const PASES_LEAD_CONTROL: float = 1.0 / 8.0






const PASES_HUD_T: float = 3.0



const PASES_PARTIDA_T: float = 2.95
const PASES_RIVAL_HUD: float = 1.15


const PASES_TU_X: float = 0.25




const PASES_CALIENTA: Array[String] = ["rondo", "charla", "tiros", "dominadas",
	"cabezazos", "arrancadas"]







const CALIENTA_TU: Array[String] = ["pases", "rondo", "charla", "tiros", "dominadas",
	"cabezazos", "arrancadas"]





const PASES_SU_RONDO: Vector3 = Vector3(1.0, 0.0, 84.0)
const PASES_SU_RONDO_R: float = 1.5
const PASES_SU_CHARLA: Vector3 = Vector3(-2.0, 0.0, 82.0)


const PASES_SU_TIRO: Vector3 = Vector3(0.6, 0.0, 93.5)
const TIRO_PORTERO: Vector3 = Vector3(0.0, 0.0, 104.4)











const TIRO_T0: float = PASES_PARTIDA_T + 0.15
const TIRO_ACERCA: float = 0.45
const TIRO_VUELO: float = 0.55
const TIRO_ABRAZA: float = 0.95
const TIRO_SAQUE_FPS: float = 12.0
const TIRO_RUEDA: float = 1.15
const TIRO_TRAS_GOL: float = 1.55
const TIRO_TRAS_RUEDA: float = 0.25









const TIRO_COLOCA: float = 0.45
const TIRO_ATRAS: float = 1.3
const TIRO_ESPERA: float = 0.45
const TIRO_CARRERA: float = 0.6
const TIRO_CARRERILLA: Vector3 = Vector3(0.3, 0.0, -1.9)
const TIRO_CARRERILLA_DIAGONAL: Vector3 = Vector3(0.0, 0.0, -1.9)


const TIRO_T0_PRONO: float = 0.3

const TIRO_SUELO: float = PASES_BALON_M * 0.5


const TIRO_GIRO_MAX: float = 4.0



const TIRO_PILA: Array[Vector3] = [Vector3(-0.85, 0.0, -0.35), Vector3(-1.1, 0.0, -0.1),
	Vector3(-0.9, 0.0, 0.15)]


const TIRO_ESTIRA_M: float = 0.6
const TIRO_TENDIDO: float = 0.55
const TIRO_LEVANTA: float = 0.5
const KEEPER_H: float = 1.9





const DOMINA_EN: Vector3 = Vector3(0.6, 0.0, 86.0)
const DOMINA_SERIE: Array[String] = ["derecha", "izquierda", "derecha", "muslo",
	"derecha", "izquierda", "cabeza", "pecho", "derecha", "muslo", "izquierda"]
const _DOMINADAS: GDScript = preload("res://ui/ceremonies/dominadas.gd")













const CABEZA_EN: Vector3 = Vector3(0.4, 0.0, 85.0)
const CABEZA_HONDO: Vector3 = Vector3(-0.45, 0.0, 1.8)
const CABEZA_SESGO: Vector3 = Vector3(-0.9, 0.0, 1.5)
const CABEZA_VUELO: float = 1.0





const ARRANCA_EN: Vector3 = Vector3(0.3, 0.0, 83.0)
const ARRANCA_LARGO: float = 6.5
const ARRANCA_CALLES: Array[float] = [-0.5, 0.6]
const ARRANCA_TRAMO: float = 1.3
const ARRANCA_PARA: float = 0.55
const ARRANCA_DESFASE: float = 0.3

const ARRANCA_CONO_X: float = 1.15

var _pases_compa: AnimatedSprite3D = null
var _pases_balon: AnimatedSprite3D = null
var _pases_prev_t: float = -1.0
var _pases_prev_pos: Vector3 = Vector3.ZERO


var _pases_look: Dictionary = {}

var _rotulo: RotuloTele = null
var _rotulo_t0: float = 0.0


var _vp2_box: SubViewportContainer = null
var _vp2: SubViewport = null
var _cam2: Camera3D = null
var _partida: PantallaPartida = null
var _partida_dx: float = -1.0

var _calienta: String = ""
var _cam2_desde: Vector3 = Vector3.ZERO
var _cam2_hacia: Vector3 = Vector3.ZERO
var _cam2_fov: float = 40.0


var _tiro_tirador: AnimatedSprite3D = null
var _tiro_portero: AnimatedSprite3D = null
var _tiro_balones: Array[AnimatedSprite3D] = []
var _tiro_vueltas: Array[Dictionary] = []
var _tiro_tramos: Array = []


var _domina: AnimatedSprite3D = null
var _domina_balon: AnimatedSprite3D = null
var _domina_toques: Array[Dictionary] = []
var _domina_hacia: Vector3 = Vector3.FORWARD
var _domina_derecha: Vector3 = Vector3.LEFT


var _cabeza_dos: Array[AnimatedSprite3D] = []
var _cabeza_balon: AnimatedSprite3D = null
var _cabeza_toques: Array[Dictionary] = []


var _cabeza_sep: Vector3 = CABEZA_HONDO

var _arranca: Array[AnimatedSprite3D] = []



var _cal_tu: String = ""
var _lado_tuyo: Node3D = null
var _pases_kit: Dictionary = {}


var _prono_tele: PronosticoTele = null
var _prono_tu_local: bool = true


func _build_pases(kit: Dictionary) -> void:


	focus = PASES_YO
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)
	look["number"] = GameState.shirt_number_now()
	_pases_look = look
	make_player(look)
	if player != null:
		add_idle_views(player, look)
		_pases_gestos(player)
	_pases_kit = kit



	if _cal_tu_pases():
		_pases_monta_pareja(kit)





	var z: float = PASES_Z
	make_camera([
		{"t": 0.0, "dist": 9.0, "h": 1.5, "yaw": 180.0, "aim_y": 1.0, "fov": 46.0,
			"focus_x": PASES_COMPA.x - 1.2, "focus_z": z},
		{"t": PASES_K1, "dist": 9.0, "h": 1.5, "yaw": 180.0, "aim_y": 1.0, "fov": 46.0,
			"focus_x": PASES_COMPA.x - 1.2, "focus_z": z},
		{"t": PASES_K1 + PASES_GLOBO * 0.5, "dist": 11.5, "h": 2.3, "yaw": 180.0,
			"aim_y": 2.9, "fov": 46.0, "focus_x": 0.0, "focus_z": z},
		{"t": PASES_K1 + PASES_GLOBO, "dist": 9.6, "h": 1.5, "yaw": 180.0,
			"aim_y": 1.05, "fov": 46.0, "focus_x": PASES_YO.x + 0.8, "focus_z": z},
		{"t": float(DURATION["pases"]), "dist": 8.4, "h": 1.4, "yaw": 168.0,
			"aim_y": 1.0, "fov": 46.0, "focus_x": PASES_YO.x + 0.9, "focus_z": z},
	], 46.0)
	orbit_speed = 0.0


	_pases_hud_arma()



func _pases_monta_pareja(kit: Dictionary) -> void:

	var pool: Array[SpriteFrames] = squad_frames_pool(kit, 1,
		GameState.player_team_id, "south", true)
	if not pool.is_empty():
		var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		_pases_compa = AnimatedSprite3D.new()
		_pases_compa.sprite_frames = pool[0]
		_pases_compa.pixel_size = px
		_pases_compa.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		_pases_compa.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		_pases_compa.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		_pases_compa.position = Vector3(PASES_COMPA.x, feet_offset(px) - PLAYER_SINK,
			PASES_COMPA.z)
		viewport.add_child(_pases_compa)
		_pases_compa.play("idle")
		add_idle_views(_pases_compa)
		_pases_gestos(_pases_compa)



	var frames: SpriteFrames = BallDeco.frames_for(GameState.current_fixture())
	_pases_balon = AnimatedSprite3D.new()
	_pases_balon.sprite_frames = frames
	_pases_balon.pixel_size = PASES_BALON_M / 32.0
	_pases_balon.offset = Vector2(0.0, - PASES_BALON_PAD_PX)
	_pases_balon.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_pases_balon.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_pases_balon.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	_pases_balon.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	viewport.add_child(_pases_balon)
	if frames != null:
		_pases_balon.play("idle")
	_pases_prev_pos = _pases_balon_en(0.0)
	_pases_balon.position = _pases_prev_pos



func _pases_key() -> String:
	var k: String = String(Dictionary(data.get("goleo", {})).get("key", ""))
	return "league" if k.is_empty() else k





func _pases_estilo() -> Dictionary:
	var id: String = Competitions.id_of({"comp": _pases_key()})
	return Competitions.COMP_STYLE.get(id, Competitions.COMP_STYLE["liga"])





func _pases_logo() -> String:
	var comp: String = String(data.get("comp", ""))
	if comp.is_empty() or comp == "liga":
		return Competitions.league_div_logo(Teams.country_of(GameState.player_team_id),
			GameState.player_div())
	return Competitions.comp_logo(comp)




func _pases_gestos(s: AnimatedSprite3D) -> void:
	add_gesto(s, "empeine", 5, 12.0)
	add_gesto(s, "chest", 6, 7.0)
	add_gesto(s, "volea", 5, 12.0)
	add_gesto(s, "control", 6, 8.0)





func _pases_balon_en(at: float) -> Vector3:
	var r: float = PASES_BALON_M * 0.5
	var pie_compa: Vector3 = PASES_COMPA + Vector3(-0.5, r, 0.0)
	var pecho: Vector3 = PASES_YO + Vector3(0.3, 1.3, 0.0)
	var volea: Vector3 = PASES_YO + Vector3(0.62, 0.5, 0.0)
	var llega: Vector3 = PASES_COMPA + Vector3(-0.45, 0.4, 0.0)
	var p: Vector3 = pie_compa
	var s: float = at - PASES_K1
	var n: int = clampi(int(floor(s / PASES_CICLO)), 0, PASES_VUELTAS - 1)
	s -= float(n) * PASES_CICLO
	if s >= 0.0:
		if s < PASES_GLOBO:
			p = _pases_arco(pie_compa, pecho, PASES_GLOBO, s)
		elif s < PASES_GLOBO + PASES_PECHO:
			p = _pases_arco(pecho, volea, PASES_PECHO, s - PASES_GLOBO)
		elif s < PASES_GLOBO + PASES_PECHO + PASES_VOLEA:
			p = _pases_arco(volea, llega, PASES_VOLEA, s - PASES_GLOBO - PASES_PECHO)
		else:
			p = _pases_arco(llega, pie_compa, PASES_DOMA,
				s - PASES_GLOBO - PASES_PECHO - PASES_VOLEA)
	return p + Vector3(0.0, 0.0, PASES_BALON_DZ)





static func _pases_arco(a: Vector3, b: Vector3, dur: float, s: float) -> Vector3:
	var k: float = clampf(s, 0.0, dur)
	var p: Vector3 = a.lerp(b, k / dur)
	var vy: float =(b.y - a.y + 0.5 * PASES_G * dur * dur) / dur
	p.y = a.y + vy * k - 0.5 * PASES_G * k * k
	return p


func _tick_pases(paso: float) -> void:
	var prev: float = _pases_prev_t
	var delta: float = maxf(t - prev, 0.0001) if prev >= 0.0 else 0.016
	_pases_prev_t = t

	if _pases_balon != null:
		_pases_ciclo(prev, delta)


	if _mode == "pronostico":
		_prono_tick(paso, prev)
	else:
		_pases_partida_tick(paso, prev)
	if _rotulo != null:
		_rotulo.anima(t - _rotulo_t0, float(DURATION["pases"]) - t)



func _pases_ciclo(prev: float, delta: float) -> void:
	var hacia_compa: Vector3 = PASES_COMPA - PASES_YO


	for n in PASES_VUELTAS:
		var k: float = PASES_K1 + float(n) * PASES_CICLO
		var pecho_t: float = k + PASES_GLOBO
		var volea_t: float = pecho_t + PASES_PECHO
		var llega_t: float = volea_t + PASES_VOLEA
		if _pases_cruza(prev, k - PASES_LEAD_EMPEINE):
			gesto_play(_pases_compa, "empeine", - hacia_compa)
		if _pases_cruza(prev, pecho_t - PASES_LEAD_PECHO):
			gesto_play(player, "chest", hacia_compa)
		if _pases_cruza(prev, volea_t - PASES_LEAD_VOLEA):
			gesto_play(player, "volea", hacia_compa)
		if _pases_cruza(prev, llega_t - PASES_LEAD_CONTROL):
			gesto_play(_pases_compa, "control", - hacia_compa)

	idle_play(player, hacia_compa)
	idle_play(_pases_compa, - hacia_compa)
	var pos: Vector3 = _pases_balon_en(t)
	_pases_gira((pos - _pases_prev_pos) / delta)
	_pases_prev_pos = pos
	_pases_balon.position = pos


func _pases_cruza(prev: float, en: float) -> bool:
	return prev < en and t >= en




func _pases_gira(v: Vector3) -> void:
	var fr: SpriteFrames = _pases_balon.sprite_frames
	if fr == null:
		return
	var rap: float = Vector2(v.x, v.z).length()
	if rap < 0.05:
		if _pases_balon.animation != "idle":
			_pases_balon.play("idle")
		_pases_balon.speed_scale = 1.0
		return
	var anim: String = "rollside" if fr.has_animation("rollside") else "roll"
	if not fr.has_animation(anim):
		return
	if _pases_balon.animation != anim or not _pases_balon.is_playing():
		_pases_balon.play(anim)
	var derecha: Vector3 = cam.global_transform.basis.x if cam != null else Vector3.RIGHT
	_pases_balon.speed_scale = rap /(PI * PASES_BALON_M) / PASES_VUELTAS_VARA \
			* signf(Vector3(v.x, 0.0, v.z).dot(derecha))



func _tag_pases() -> String:
	var d: Dictionary = data.get("goleo", {})
	match String(d.get("titular", "")):
		"asist":
			return I18n.t("MÁXIMO ASISTENTE")
		"podio":
			return I18n.tf("{0} EN GOLEO", [I18n.ordinal(int(d.get("rank_g", 1)))])
		"duelo":
			return I18n.t("CARA A CARA")
	return I18n.t("MÁXIMO GOLEADOR")














func _pases_hud_arma() -> void:
	var d: Dictionary = data.get("goleo", {})
	if d.is_empty():
		return
	var du: Dictionary = Dictionary(d.get("duelo", {}))
	var cfg: Dictionary
	if String(d.get("titular", "")) == "duelo" and not du.is_empty():
		_pases_partida_arma(du)
		cfg = _pases_cfg_rival(d, du)
		_rotulo_t0 = PASES_PARTIDA_T + PASES_RIVAL_HUD
	else:
		cfg = _pases_cfg_mio(d)
		_rotulo_t0 = PASES_HUD_T
	_rotulo = RotuloTele.new()
	add_child(_rotulo)
	var vp: Viewport = get_viewport()
	cfg["ancho"] = minf(RotuloTele.ANCHO, SceneFade.rect_visible(self).size.x - 60.0)

	var abajo: float =(48.0 if UiKit.es_horizontal() else 110.0) \
			+ UiKit.bottom_safe_inset(vp)
	_rotulo.arma(cfg, UiKit.side_safe_inset(vp), abajo)






func _pases_cfg_base() -> Dictionary:
	var st: Dictionary = _pases_estilo()
	var pest: String = String(data.get("pestana", ""))
	if pest.is_empty():
		pest = HubBanner.linea_de(GameState.current_fixture())
	return {"acento": accent, "tinta": text_accent(),
		"canto": int(float(st.get("strip", 10.0))), "radio": int(st.get("radius", 0)),
		"logo": _pases_logo(), "pestana": pest}







func _pases_cfg_mio(d: Dictionary) -> Dictionary:
	var asist: bool = String(d.get("titular", "")) == "asist"
	var mio: int = int(d.get("a" if asist else "g", 0))
	var otro: int = int(d.get("rival_a" if asist else "rival_g", 0))
	var puesto: int = int(d.get("rank_a" if asist else "rank_g", 0))
	var tope: float = float(maxi(maxi(mio, otro), 1))
	var cfg: Dictionary = _pases_cfg_base()
	cfg["kicker"] = _tag_pases()
	cfg["nombre"] = CareerTheme.caps(Career.player_name)
	cfg["look"] = _pases_look if not _pases_look.is_empty() else GameState.player_look()
	cfg["club"] = Teams.by_id(GameState.player_team_id)
	cfg["icono"] = "asist" if asist else "gol"
	cfg["cifra"] = float(mio)
	cfg["unidad"] = I18n.t("ASISTENCIAS" if asist else "GOLES")
	cfg["puesto"] = puesto
	cfg["corona"] = puesto == 1
	cfg["barra"] = float(mio) / tope
	cfg["marca"] = float(otro) / tope
	cfg["marca_texto"] = "%s · %d" % [I18n.ordinal(2) if puesto == 1
		else I18n.t("LÍDER"), otro]
	cfg["cubos"] = [
		["gol" if asist else "asist", str(int(d.get("g" if asist else "a", 0)))],
		["partido", str(int(d.get("pj", 0)))],
		["media", RotuloTele._num(float(d.get("avg", 0.0)), true)]]
	return cfg






func _pases_cfg_rival(d: Dictionary, du: Dictionary) -> Dictionary:
	var asist: bool = String(du.get("por", "g")) == "a"
	var suyo: int = int(du.get("a" if asist else "g", 0))
	var mio: int = int(d.get("a" if asist else "g", 0))
	var puesto: int = int(du.get("rank_a" if asist else "rank_g", 0))
	var tope: float = float(maxi(maxi(suyo, mio), 1))
	var club: Dictionary = Teams.by_id(String(du.get("team", "")))
	var color: Color = CareerTheme.accent_of(club) if not club.is_empty() \
			else CareerTheme.TEXT_MID
	var cfg: Dictionary = _pases_cfg_base()
	cfg["kicker"] = I18n.t("TE PELEA LAS ASISTENCIAS" if asist else "TE PELEA EL GOLEO")
	cfg["nombre"] = CareerTheme.caps(String(du.get("name", "")))
	cfg["marca_club"] = color
	cfg["look"] = _pases_look_rival(du)
	cfg["club"] = club
	cfg["foto_color"] = color
	cfg["icono"] = "asist" if asist else "gol"
	cfg["cifra"] = float(suyo)
	cfg["unidad"] = I18n.t("ASISTENCIAS" if asist else "GOLES")
	cfg["puesto"] = puesto
	cfg["corona"] = puesto == 1
	cfg["barra"] = float(suyo) / tope
	cfg["barra_color"] = color
	cfg["marca"] = float(mio) / tope
	cfg["marca_texto"] = "%s · %d" % [I18n.t("TÚ"), mio]
	cfg["marca_color"] = text_accent()
	cfg["cubos"] = [
		["gol" if asist else "asist", str(int(du.get("g" if asist else "a", 0)))],
		["media", RotuloTele._num(float(du.get("avg", 0.0)), true)]]
	return cfg





func _pases_look_rival(du: Dictionary) -> Dictionary:
	var club: Dictionary = Teams.by_id(String(du.get("team", "")))
	var nom: String = String(du.get("name", ""))
	var num: int = 0
	var up: String = nom.to_upper()
	var usados: Dictionary = {}
	for q in Squad.of(String(club.get("id", ""))):
		var ficha: Dictionary = q as Dictionary
		usados[int(ficha.get("number", 0))] = true
		if String(ficha.get("name", "")).to_upper() == up:
			num = int(ficha.get("number", 0))





	if num <= 0:
		num = 2 + absi(hash(up)) % 28
		while usados.has(num) and num < 99:
			num += 1
	var base: Dictionary = GameState.kit_variant(club, 0) if not club.is_empty() else {}
	return person_look({"name": nom, "number": num}, base)

















func _pases_partida_arma(du: Dictionary) -> void:
	var rid: String = String(du.get("team", ""))
	var club: Dictionary = Teams.by_id(rid)
	_calienta = _pases_calienta(du)
	_vp2_monta()
	_vp2_box.anchor_left = PantallaPartida.CORTE_ABAJO
	_vp2_box.anchor_right = 1.0
	_vp2_box.anchor_top = 0.0
	_vp2_box.anchor_bottom = 1.0
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _pases_corte_shader()
	mat.set_shader_parameter("corte",(PantallaPartida.CORTE_ARRIBA
		- PantallaPartida.CORTE_ABAJO) /(1.0 - PantallaPartida.CORTE_ABAJO))
	_vp2_box.material = mat
	_cal_monta(_calienta, du, club)


	if UiKit.es_horizontal():
		_cam2_fov *= 0.62
	_pases_cam2(PASES_PARTIDA_T)
	_partida = PantallaPartida.new()
	add_child(_partida)
	move_child(_partida, _vp2_box.get_index() + 1)
	var color: Color = CareerTheme.accent_of(club) if not club.is_empty() \
			else CareerTheme.TEXT_MID
	var mio_team: Dictionary = GameState.current_team()
	var color_mio: Color = CareerTheme.accent_of(mio_team) if not mio_team.is_empty() else accent
	_partida.arma(color_mio, Career.espalda_de(String(du.get("name", ""))), color,
		UiKit.top_safe_inset(get_viewport()))






func _vp2_monta() -> void:
	_vp2_box = SubViewportContainer.new()
	_vp2_box.stretch = true
	_vp2_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_vp2_box.visible = false
	add_child(_vp2_box)
	move_child(_vp2_box, viewport_box.get_index() + 1)
	_vp2 = SubViewport.new()
	_vp2.transparent_bg = false
	_vp2.world_3d = viewport.find_world_3d()
	_vp2.render_target_update_mode = SubViewport.UPDATE_DISABLED
	_vp2.msaa_3d = Viewport.MSAA_DISABLED
	UiKit.aplica_escala_3d_sub(_vp2, get_viewport())
	_vp2_box.add_child(_vp2)
	_cam2 = Camera3D.new()
	_cam2.current = true
	_vp2.add_child(_cam2)





func _cal_monta(tipo: String, du: Dictionary, club: Dictionary) -> void:
	match tipo:
		"tiros":
			_pases_su_tiros(du, club)
		"dominadas":
			_pases_su_dominadas(du, club)
		"cabezazos":
			_cal_cabezazos(du, club)
		"arrancadas":
			_cal_arrancadas(du, club)
		"charla":
			_pases_su_rondo(du, club, PASES_SU_CHARLA, 2)
		_:
			_pases_su_rondo(du, club, PASES_SU_RONDO, 4)



func _cal_tick(tipo: String, delta: float, prev: float) -> void:
	match tipo:
		"tiros":
			_pases_tiros_tick(prev)
		"dominadas":
			_pases_dominadas_tick(prev)
		"cabezazos":
			_cal_cabezazos_tick(prev)
		"arrancadas":
			_cal_arrancadas_tick()
		_:
			_tick_rondo(delta)





static func _cal_familia(tipo: String) -> String:
	return "rondo" if tipo == "charla" else tipo


func _cal_tu_pases() -> bool:
	return _cal_tu.is_empty() or _cal_tu == "pases"




func _cal_tuyo(fam: String) -> bool:
	return _lado_tuyo != null and _cal_familia(_cal_tu) == fam



func _cal_padre(fam: String) -> Node:
	return _lado_tuyo if _cal_tuyo(fam) else viewport



func _cal_vista(fam: String) -> Camera3D:
	return cam if _cal_tuyo(fam) else _cam2





func _cal_d(fam: String, d: Vector3) -> Vector3:
	return _lado_tuyo.basis * d if _cal_tuyo(fam) else d


func _cal_l(fam: String, d: Vector3) -> Vector3:
	return _lado_tuyo.basis.inverse() * d if _cal_tuyo(fam) else d






func _cal_lado_monta() -> void:
	_lado_tuyo = Node3D.new()
	_lado_tuyo.transform = Transform3D(Basis(Vector3.UP, PI),
		Vector3(0.0, 0.0, Stadium.HALF_LINE * 2.0))
	viewport.add_child(_lado_tuyo)






func _cal_camara_tuya() -> void:
	var desde: Vector3 = _lado_tuyo.transform * _cam2_desde
	var hacia: Vector3 = _lado_tuyo.transform * _cam2_hacia
	var d: Vector3 = desde - hacia
	var dist: float = Vector2(d.x, d.z).length()
	var yaw: float = rad_to_deg(atan2(d.x, - d.z))
	var fin: float = float(DURATION["pronostico"])
	cam_keys.assign([
		{"t": 0.0, "dist": dist, "h": desde.y, "yaw": yaw - 3.0, "aim_y": hacia.y,
			"fov": _cam2_fov, "focus_x": hacia.x, "focus_z": hacia.z},
		{"t": fin, "dist": dist * 0.93, "h": desde.y * 0.97, "yaw": yaw + 3.0,
			"aim_y": hacia.y, "fov": _cam2_fov, "focus_x": hacia.x, "focus_z": hacia.z},
	])
	_apply_cam(cam_keys[0])







func _cal_actor(fam: String, persona: Dictionary, base: Dictionary, rid: String,
		at: Vector3, prota: bool = false) -> AnimatedSprite3D:
	if prota and _cal_tuyo(fam) and player != null:
		player.reparent(_lado_tuyo, false)
		player.position = Vector3(at.x, player.position.y, at.z)
		return player
	var s: AnimatedSprite3D = _pases_suyo(persona, base, rid, at)
	if _cal_tuyo(fam):
		s.remove_meta("vista")
		s.reparent(_lado_tuyo, false)
	return s




func _cal_kit(fam: String, club: Dictionary) -> Dictionary:
	if _cal_tuyo(fam):
		return _pases_kit
	return GameState.kit_variant(club, 0) if not club.is_empty() else {}




func _cal_gente(fam: String, rid: String, n: int, nombre: String) -> Array:
	if _cal_tuyo(fam):
		return squad_people(rid, n, true, "", true)
	return squad_people(rid, n, false, nombre, true)




static func _pases_corte_shader() -> Shader:
	var sh: Shader = Shader.new()
	sh.code = "shader_type canvas_item;\nuniform float corte = 0.214;\nvoid fragment() {\n\tif (UV.x < corte * (1.0 - UV.y)) {\n\t\tdiscard;\n\t}\n}\n"







	return sh





func _pases_calienta(du: Dictionary) -> String:
	var forzado: String = String(data.get("calienta", ""))
	if forzado in PASES_CALIENTA:
		return forzado
	var h: int = absi(hash("%s|%d" % [String(du.get("name", "")),
		int(data.get("season", 0))]))
	return PASES_CALIENTA[h % PASES_CALIENTA.size()]





func _pases_suyo(persona: Dictionary, base: Dictionary, rid: String,
		at: Vector3) -> AnimatedSprite3D:
	var cfg: Dictionary = person_look(persona, base)
	cfg["club"] = rid
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.sprite_frames = player_frames(cfg, "south")
	s.pixel_size = px
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.position = Vector3(at.x, feet_offset(px) - PLAYER_SINK, at.z)
	s.set_meta("vista", _cam2)
	viewport.add_child(s)
	s.play("idle")
	s.speed_scale = rng.randf_range(0.85, 1.2)
	add_idle_views(s)
	return s







func _pases_su_rondo(du: Dictionary, club: Dictionary, c: Vector3, n: int) -> void:
	var rid: String = String(club.get("id", ""))
	var base: Dictionary = KitRecolor.team_only(_cal_kit("rondo", club))
	var gente: Array = [{"name": String(du.get("name", "")),
		"number": int(_pases_look_rival(du).get("number", 0))}]
	gente.append_array(_cal_gente("rondo", rid, n - 1, String(du.get("name", ""))))
	_rondo_c = c
	_rondo_n = n
	_ball_hold_dur = 1.3 if n == 2 else BALL_HOLD
	for i in n:
		var at: Vector3
		if n == 2:


			at = c +(Vector3(-0.7, 0.0, 0.5) if i == 0 else Vector3(0.7, 0.0, -0.5))
		else:
			var ang: float = PI * 0.5 + 0.35 + TAU * float(i) / float(n)
			at = c + Vector3(cos(ang), 0.0, sin(ang)) * PASES_SU_RONDO_R
		var s: AnimatedSprite3D = _cal_actor("rondo", gente[i], base, rid, at, i == 0)
		add_gesto(s, "kick", 4, 12.0)
		add_gesto(s, "control", 6, 8.0)
		_jugadores.append(s)
		_rondo.append(at)
	_ball = Sprite3D.new()
	_ball.texture = load(Stadium.BALL_ART)
	_ball.pixel_size = Stadium.BALL_ART_D / 32.0
	_ball.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_ball.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_ball.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_ball_i = 1
	_ball_from = _rondo[0]
	_ball_to = _rondo[1]
	_ball_hop = clampf(_ball_from.distance_to(_ball_to) / PASE_VEL, PASE_MIN, PASE_MAX)
	_ball.position = _ball_from + Vector3(0.0, 0.11, 0.0)
	_cal_padre("rondo").add_child(_ball)


	if n == 2:
		_cam2_desde = Vector3(c.x, 2.6, c.z - 10.0)
		_cam2_hacia = Vector3(c.x, 0.45, c.z)
	else:
		_cam2_desde = Vector3(c.x, 5.0, c.z - 15.0)
		_cam2_hacia = Vector3(c.x, 0.1, c.z + 1.0)
	_cam2_fov = 40.0






func _pases_su_tiros(du: Dictionary, club: Dictionary) -> void:
	var rid: String = String(club.get("id", ""))
	var de_campo: Dictionary = _cal_kit("tiros", club)
	var persona: Dictionary = {"name": String(du.get("name", "")),
		"number": int(_pases_look_rival(du).get("number", 0))}
	_tiro_tirador = _cal_actor("tiros", persona, KitRecolor.team_only(de_campo), rid,
		PASES_SU_TIRO, true)
	add_gesto(_tiro_tirador, "kick", 4, 12.0)

	add_gesto(_tiro_tirador, "control", 6, 8.0)


	var su_cfg: Dictionary = _tiro_tirador.sprite_frames.get_meta("look_cfg", {})
	add_walk(_tiro_tirador, su_cfg)
	add_run(_tiro_tirador, su_cfg)

	_tiro_tirador.position += _tiro_carrerilla()




	var portero: Dictionary = {"name": "", "number": 1}
	for q in Squad.of(rid):
		var ficha: Dictionary = q as Dictionary
		if String(ficha.get("pos", "")) == "POR":
			portero = {"name": String(ficha.get("name", "")),
				"number": int(ficha.get("number", 1))}
			break
	var base_k: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(rid, -1,
		String(de_campo.get("pattern", "solid"))), de_campo)
	var look_k: Dictionary = person_look(portero, base_k)
	var fr: SpriteFrames = keeper_idle_frames(look_k, rid)
	var cfg_k: Dictionary = look_k.duplicate()
	cfg_k["club"] = rid
	_pases_hoja(fr, "ataja", "chest_catch_%02d", 1, 7, cfg_k)
	_pases_hoja(fr, "estira", "dive_%02d", 1, 6, cfg_k)
	_pases_hoja(fr, "saca", "saque_mano_keeper_%02d", 1, 5, cfg_k)
	var px: float = KEEPER_H / PLAYER_METRICS.x
	_tiro_portero = AnimatedSprite3D.new()
	_tiro_portero.sprite_frames = fr
	_tiro_portero.pixel_size = px
	_tiro_portero.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_tiro_portero.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_tiro_portero.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_tiro_portero.position = Vector3(TIRO_PORTERO.x, feet_offset(px) - PLAYER_SINK,
		TIRO_PORTERO.z)
	if not _cal_tuyo("tiros"):
		_tiro_portero.set_meta("vista", _cam2)
	_cal_padre("tiros").add_child(_tiro_portero)
	_tiro_portero.play("idle")





	var hojas: String = "res://assets/sprites/anim/"
	espalda_registra(_tiro_portero, "ataja", hojas + "chest_catch_", 1)
	espalda_registra(_tiro_portero, "estira", hojas + "dive_", 1)
	espalda_registra(_tiro_portero, "saca", hojas + "saque_mano_keeper_", 1)




	_tiro_balones = [_pases_balon_3d("tiros", _pases_tiro_pie())]
	for off in TIRO_PILA:
		_tiro_balones.append(_pases_balon_3d("tiros", PASES_SU_TIRO + off))
	_pases_tiros_guion()

	_cam2_desde = Vector3(0.4, 3.0, PASES_SU_TIRO.z - 9.0)
	_cam2_hacia = Vector3(0.0, 0.3, PASES_SU_TIRO.z + 4.0)
	_cam2_fov = 40.0




static func _pases_hoja(fr: SpriteFrames, anim: String, patron: String, desde: int,
		hasta: int, cfg: Dictionary) -> void:
	fr.add_animation(anim)
	fr.set_animation_loop(anim, false)
	for i in range(desde, hasta + 1):
		var path: String = "res://assets/sprites/anim/" +(patron % i) + ".png"
		if ResourceLoader.exists(path):
			fr.add_frame(anim, KitRecolor.apply(load(path), cfg))






func _pases_balon_3d(fam: String, at: Vector3) -> AnimatedSprite3D:
	var b: AnimatedSprite3D = AnimatedSprite3D.new()
	b.sprite_frames = BallDeco.frames_for(GameState.current_fixture())
	b.pixel_size = PASES_BALON_M / 32.0
	b.offset = Vector2(0.0, - PASES_BALON_PAD_PX)
	b.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	b.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	b.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	b.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	b.position = Vector3(at.x, TIRO_SUELO, at.z)
	_cal_padre(fam).add_child(b)
	if b.sprite_frames != null:
		b.play("idle")
	return b






func _pases_balon_gira(b: AnimatedSprite3D, vel: Vector3, camara: Camera3D) -> void:
	var fr: SpriteFrames = b.sprite_frames
	if fr == null:
		return
	var rap: float = Vector2(vel.x, vel.z).length()
	if rap < 0.05 or camara == null:
		if b.animation != "idle":
			b.play("idle")
		b.speed_scale = 1.0
		return
	var v: Vector2 = Vector2(vel.x, vel.z)
	var espejo: float = 1.0
	if v.x < 0.0 or (v.x == 0.0 and v.y < 0.0):
		v = - v
		espejo = -1.0
	var w: Vector3 = Vector3.UP.cross(Vector3(v.x, 0.0, v.y))
	var base: Basis = camara.global_transform.basis
	var wx: float = w.dot(base.x)
	var wy: float = w.dot(base.y)
	var anim: String = "rollfwd"
	var sentido: float =(1.0 if wx >= 0.0 else -1.0) * espejo
	if absf(wy) >= absf(wx) - 0.0001:
		anim = "rollside"
		sentido =(1.0 if wy >= 0.0 else -1.0) * espejo
	if not fr.has_animation(anim):
		anim = "roll"
		sentido = 1.0
	if not fr.has_animation(anim):
		return
	if b.animation != anim or not b.is_playing():
		b.play(anim)
	b.speed_scale = minf(rap /(PI * PASES_BALON_M) / PASES_VUELTAS_VARA,
		TIRO_GIRO_MAX) * sentido





func _pases_cam2(at: float) -> void:
	if _cam2 == null:
		return
	var vaiven: Vector3 = Vector3(sin(at * 0.45) * 0.35, sin(at * 0.31) * 0.08, 0.0)
	_cam2.fov = _cam2_fov
	_cam2.look_at_from_position(_cam2_desde + vaiven, _cam2_hacia + vaiven * 0.4)




func _pases_partida_tick(delta: float, prev: float) -> void:
	if _vp2_box == null:
		return
	var s: float = t - PASES_PARTIDA_T


	_cal_tick(_calienta, delta, prev)
	if s < 0.0:
		return
	if not _vp2_box.visible:
		_vp2_box.visible = true
		_vp2.render_target_update_mode = SubViewport.UPDATE_ALWAYS


	if _partida_dx < 0.0:
		_partida_dx = 0.0
		if player != null and cam != null:
			var lado: float = viewport_box.size.x
			var px: float = cam.unproject_position(player.global_position).x \
					* lado / maxf(float(viewport.size.x), 1.0)
			_partida_dx = clampf(px - lado * PASES_TU_X, 0.0, lado * 0.3)
	var k: float = RotuloTele._sale(RotuloTele._tramo(s, PantallaPartida.T_ENTRA))
	viewport_box.position.x = - _partida_dx * k
	var ancho: float = size.x *(1.0 - PantallaPartida.CORTE_ABAJO)
	_vp2_box.position.x = size.x * PantallaPartida.CORTE_ABAJO + ancho *(1.0 - k)
	_pases_cam2(t)
	_partida.anima(s)








const PRONO_ZOOM: float = 0.8






const PRONO_VELO: float = 0.35













func _build_pronostico(kit: Dictionary) -> void:
	var d: Dictionary = data.get("pronostico", {})
	var lados: Array = d.get("lados", [])
	if lados.size() != 2:
		_build_pases(kit)
		_prono_camara_pases()
		return
	_prono_tu_local = bool(d.get("home", true))
	var el: Dictionary = Dictionary(lados[1 if _prono_tu_local else 0])
	var rid: String = String(el.get("team", ""))
	var club: Dictionary = Teams.by_id(rid)


	var nombre: String = String(Dictionary(el.get("goleador", {})).get("name", ""))
	if nombre.is_empty():
		var gente: Array = squad_people(rid, 1, false, "", true)
		if not gente.is_empty():
			nombre = String((gente[0] as Dictionary).get("name", ""))
	var du: Dictionary = {"name": nombre, "team": rid}


	_calienta = _pases_calienta(du)
	_cal_tu = _prono_calienta_tu(rid)
	_build_pases(kit)
	if _cal_tu_pases():
		_prono_camara_pases()
	else:
		_cal_lado_monta()
		var mio: String = GameState.player_team_id
		_cal_monta(_cal_tu, {"name": "", "team": mio}, Teams.by_id(mio))
		_cal_camara_tuya()
	scrim_dim(PRONO_VELO)
	_vp2_monta()
	_cal_monta(_calienta, du, club)
	_prono_coloca()

	var fondo: ColorRect = ColorRect.new()
	fondo.color = CareerTheme.BG_DEEP
	fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(fondo)
	move_child(fondo, 0)
	_prono_tele = PronosticoTele.new()
	add_child(_prono_tele)
	move_child(_prono_tele, _vp2_box.get_index() + 1)
	var vp: Viewport = get_viewport()
	_prono_tele.arma(_prono_cfg(d), {"arriba": UiKit.top_safe_inset(vp),
		"abajo": UiKit.bottom_safe_inset(vp), "lado": UiKit.side_safe_inset(vp)})








func _prono_coloca() -> void:
	var local: SubViewportContainer = viewport_box if _prono_tu_local else _vp2_box
	var visita: SubViewportContainer = _vp2_box if _prono_tu_local else viewport_box
	if UiKit.es_horizontal():
		var tapa: float = PronosticoTele.ALTO_H + PronosticoTele.ABAJO_H \
				+ UiKit.bottom_safe_inset(get_viewport())
		_prono_caja(local, Vector4(0.0, 0.0, 0.5, 1.0), Vector4(0.0, - tapa, 0.0, 0.0))
		_prono_caja(visita, Vector4(0.5, 0.0, 1.0, 1.0), Vector4(0.0, - tapa, 0.0, 0.0))
	else:
		var medio: float = PronosticoTele.ALTO_V * 0.5
		var muesca: float = UiKit.top_safe_inset(get_viewport()) * 0.5
		var barra: float = UiKit.bottom_safe_inset(get_viewport()) * 0.5
		_prono_caja(local, Vector4(0.0, 0.0, 1.0, 0.5),
			Vector4(0.0, muesca - medio, 0.0, muesca))
		_prono_caja(visita, Vector4(0.0, 0.5, 1.0, 1.0),
			Vector4(0.0, - barra, 0.0, medio - barra))


		world_band = PRONO_ZOOM
		_cam2_fov = rad_to_deg(2.0 * atan(tan(deg_to_rad(_cam2_fov) * 0.5) * PRONO_ZOOM))






func _prono_camara_pases() -> void:
	var x: float = PASES_YO.x + 0.9
	cam_keys.assign([
		{"t": 0.0, "dist": 9.0, "h": 1.5, "yaw": 186.0, "aim_y": 1.1, "fov": 46.0,
			"focus_x": x, "focus_z": PASES_Z},
		{"t": float(DURATION["pronostico"]), "dist": 8.0, "h": 1.4, "yaw": 172.0,
			"aim_y": 1.0, "fov": 46.0, "focus_x": x, "focus_z": PASES_Z},
	])
	_apply_cam(cam_keys[0])





func _prono_calienta_tu(rid: String) -> String:
	var suya: String = _cal_familia(_calienta)
	var forzado: String = String(data.get("calienta_tu", ""))
	if forzado in CALIENTA_TU and _cal_familia(forzado) != suya:
		return forzado
	var h: int = absi(hash("%s|%d|%s" % [rid, int(data.get("season", 0)),
		"casa" if _prono_tu_local else "fuera"]))
	for k in CALIENTA_TU.size():
		var c: String = CALIENTA_TU[(h + k) % CALIENTA_TU.size()]
		if _cal_familia(c) != suya:
			return c
	return "pases"




func _prono_caja(box: Control, a: Vector4, o: Vector4) -> void:
	box.anchor_left = a.x
	box.anchor_top = a.y
	box.anchor_right = a.z
	box.anchor_bottom = a.w
	box.set_meta("prono_o", o)
	_prono_corre(box, Vector2.ZERO)


func _prono_corre(box: Control, d: Vector2) -> void:
	var o: Vector4 = box.get_meta("prono_o", Vector4.ZERO)
	box.offset_left = o.x + d.x
	box.offset_top = o.y + d.y
	box.offset_right = o.z + d.x
	box.offset_bottom = o.w + d.y






func _prono_cfg(d: Dictionary) -> Dictionary:
	var cfg: Dictionary = _pases_cfg_base()
	var pest: String = String(cfg.get("pestana", ""))
	cfg["pestana"] = I18n.t("PRONÓSTICO") if pest.is_empty() \
			else "%s · %s" % [I18n.t("PRONÓSTICO"), pest]
	cfg["pct"] = PronosticoTele.pct(d.get("odds", []))
	var lados: Array = []
	for e in d.get("lados", []):
		var l: Dictionary = e as Dictionary
		var club: Dictionary = Teams.by_id(String(l.get("team", "")))
		var gol: Dictionary = l.get("goleador", {})
		var tuyo: bool = bool(l.get("tuyo", false))
		lados.append({"team": club,
			"color": CareerTheme.accent_of(club) if not club.is_empty()
				else CareerTheme.TEXT_MID,
			"sigla": String(club.get("abbrev", club.get("name", ""))),
			"puesto": int(l.get("puesto", 0)), "forma": l.get("forma", []),
			"goleador": "" if gol.is_empty() else Career.nombre_espalda()
				if bool(gol.get("tu", false))
				else Career.espalda_de(String(gol.get("name", ""))),
			"goles": int(gol.get("goals", 0)), "tuyo": bool(gol.get("tu", false)),
			"tinta": text_accent() if tuyo else CareerTheme.INK_LIGHT})
	if lados.size() == 2:
		var c0: Color = lados[0]["color"]
		var c1: Color = lados[1]["color"]
		if Vector3(c0.r - c1.r, c0.g - c1.g, c0.b - c1.b).length() < 0.3:
			lados[1]["color"] = c1.darkened(0.5) if c1.get_luminance() > 0.5 \
					else c1.lightened(0.5)
	cfg["lados"] = lados
	return cfg




func _prono_tick(delta: float, prev: float) -> void:
	if _vp2_box == null or _prono_tele == null:
		return
	_cal_tick(_calienta, delta, prev)
	if _lado_tuyo != null:
		_cal_tick(_cal_tu, delta, prev)
	if not _vp2_box.visible:
		_vp2_box.visible = true
		_vp2.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	var kl: float = RotuloTele._sale(RotuloTele._tramo(t, PronosticoTele.T_MITAD_LOCAL))
	var kv: float = RotuloTele._sale(RotuloTele._tramo(t, PronosticoTele.T_MITAD_VISITA))
	var local: SubViewportContainer = viewport_box if _prono_tu_local else _vp2_box
	var visita: SubViewportContainer = _vp2_box if _prono_tu_local else viewport_box
	if UiKit.es_horizontal():
		var w: float = size.x * 0.5
		_prono_corre(local, Vector2(- w *(1.0 - kl), 0.0))
		_prono_corre(visita, Vector2(w *(1.0 - kv), 0.0))
	else:
		var h: float =(size.y + PronosticoTele.ALTO_V) * 0.5
		_prono_corre(local, Vector2(0.0, - h *(1.0 - kl)))
		_prono_corre(visita, Vector2(0.0, h *(1.0 - kv)))
	_pases_cam2(t)
	_prono_tele.anima(t, float(DURATION["pronostico"]) - t)




static func _pases_tiro_pie() -> Vector3:
	return PASES_SU_TIRO + Vector3(-0.2, TIRO_SUELO, 0.45)















func _pases_tiros_guion() -> void:
	_tiro_vueltas.clear()
	_tiro_tramos.clear()
	for bal in _tiro_balones:
		bal.set_meta("nace", bal.position)
		_tiro_tramos.append([])
	var pie: Vector3 = _pases_tiro_pie()
	var pecho: Vector3 = TIRO_PORTERO + Vector3(0.0, 1.15, -0.25)
	var red: Vector3 = Vector3(TIRO_PORTERO.x - 1.9, 0.75, Stadium.HALF_LINE * 2.0 + 0.6)


	var mano: Vector3 = TIRO_PORTERO + Vector3(0.15, 0.2, -0.35)
	var t0: float = TIRO_T0_PRONO if _mode == "pronostico" else TIRO_T0
	var b: int = 0
	var pila: int = 1
	var goles: int = 0
	var n: int = 0
	var fin: float = float(DURATION.get(_mode, DURATION["pases"])) + 2.0
	while t0 < fin:
		var de_pila: bool = b < 0
		if de_pila:


			if pila >= _tiro_balones.size():
				break
			b = pila
			pila += 1
			(_tiro_tramos[b] as Array).append({"de": t0, "a": t0 + TIRO_ACERCA,
				"kind": "rueda", "p0": _tiro_balones[b].get_meta("nace"), "p1": pie})


		var en_punto: float = t0 +(TIRO_ACERCA if de_pila else 0.0)
		var atras0: float = en_punto
		var atras1: float = en_punto
		if n > 0:
			atras0 = en_punto + TIRO_COLOCA
			atras1 = atras0 + TIRO_ATRAS
		var corre0: float = atras1 + TIRO_ESPERA
		var corre1: float = corre0 + TIRO_CARRERA


		var golpe: float = corre1 + KICK_LEAD
		var llega: float = golpe + TIRO_VUELO
		var gol: bool = n % 2 == 1
		var v: Dictionary = {"t0": t0, "golpe": golpe, "llega": llega, "gol": gol,
			"de_pila": de_pila, "atras0": atras0, "atras1": atras1, "corre0": corre0,
			"corre1": corre1}
		var tramos: Array = _tiro_tramos[b]
		if gol:

			var dentro: Vector3 = red + Vector3(0.35 * float(goles), 0.0, 0.0)
			tramos.append({"de": golpe, "a": llega, "kind": "arco", "p0": pie,
				"p1": dentro})
			tramos.append({"de": llega, "a": llega + 0.35, "kind": "arco",
				"p0": dentro, "p1": Vector3(dentro.x, TIRO_SUELO, dentro.z + 0.2)})
			goles += 1
			b = -1
			v["fin"] = llega + TIRO_TRAS_GOL
		else:
			var saca: float = llega + TIRO_ABRAZA
			var suelta: float = saca + 2.0 / TIRO_SAQUE_FPS
			tramos.append({"de": golpe, "a": llega, "kind": "arco", "p0": pie,
				"p1": pecho})
			tramos.append({"de": llega, "a": saca, "kind": "oculto"})
			tramos.append({"de": saca, "a": suelta, "kind": "recta", "p0": pecho,
				"p1": mano})
			tramos.append({"de": suelta, "a": suelta + TIRO_RUEDA, "kind": "rueda",
				"p0": Vector3(mano.x, TIRO_SUELO, mano.z), "p1": pie})
			v["saca"] = saca
			v["vuelve"] = suelta + TIRO_RUEDA
			v["fin"] = suelta + TIRO_RUEDA + TIRO_TRAS_RUEDA
		_tiro_vueltas.append(v)
		t0 = float(v["fin"])
		n += 1




func _pases_tiros_tick(prev: float) -> void:
	if _tiro_tirador == null or _tiro_balones.is_empty():
		return
	var hacia: Vector3 = _cal_d("tiros", Vector3(0.0, 0.0, 1.0))


	_pases_tirador_en(hacia)


	var para: float = 0.3
	for v in _tiro_vueltas:


		if _pases_cruza(prev, float(v["corre1"])):
			gesto_play(_tiro_tirador, "kick", hacia)
		if bool(v["de_pila"]) and _pases_cruza(prev, float(v["t0"]) + TIRO_ACERCA - para):
			gesto_play(_tiro_tirador, "control", hacia)
		if v.has("vuelve") and _pases_cruza(prev, float(v["vuelve"]) - para):
			gesto_play(_tiro_tirador, "control", hacia)
	idle_play(_tiro_tirador, hacia)
	for i in _tiro_balones.size():
		_pases_tiro_balon(i)
	_pases_portero_en()




func _tiro_carrerilla() -> Vector3:
	return TIRO_CARRERILLA if _mode == "pronostico" else TIRO_CARRERILLA_DIAGONAL






func _pases_tirador_en(hacia: Vector3) -> void:
	var s: AnimatedSprite3D = _tiro_tirador
	var golpea: Vector3 = Vector3(PASES_SU_TIRO.x, s.position.y, PASES_SU_TIRO.z)
	var atras: Vector3 = golpea + _tiro_carrerilla()
	var v: Dictionary = {}
	for w in _tiro_vueltas:
		if float(w["t0"]) <= t:
			v = w
	if v.is_empty():
		s.position = atras
		_pases_parado(s, hacia)
		return
	var a0: float = float(v["atras0"])
	var a1: float = float(v["atras1"])
	var c0: float = float(v["corre0"])
	var c1: float = float(v["corre1"])
	if t < a0:
		s.position = golpea
		_pases_parado(s, hacia)
	elif t < a1:
		s.position = golpea.lerp(atras,(t - a0) /(a1 - a0))
		walk_play(s, _cal_d("tiros", atras - golpea))
	elif t < c0:
		s.position = atras
		_pases_parado(s, hacia)
	elif t < c1:
		s.position = atras.lerp(golpea,(t - c0) /(c1 - c0))
		run_play(s, _cal_d("tiros", golpea - atras))
	else:
		s.position = golpea
		_pases_parado(s, hacia)




func _pases_parado(s: AnimatedSprite3D, dir: Vector3) -> void:
	if s.animation.begins_with("walk_") or s.animation.begins_with("run_"):
		s.play("idle")
	idle_play(s, dir)





func _pases_tiro_balon(i: int) -> void:
	var bal: AnimatedSprite3D = _tiro_balones[i]
	var p: Vector3 = bal.get_meta("nace", bal.position)
	var ve: bool = true
	var vel: Vector3 = Vector3.ZERO
	for tr in _tiro_tramos[i]:
		var de: float = float(tr["de"])
		if t < de:
			break
		var a: float = float(tr["a"])
		var dur: float = maxf(a - de, 0.001)
		var s: float = minf(t, a) - de
		var u: float = clampf(s / dur, 0.0, 1.0)
		var sigue: bool = t < a
		ve = true
		vel = Vector3.ZERO
		match String(tr["kind"]):
			"oculto":
				ve = t >= a
			"arco":
				p = _pases_arco(tr["p0"], tr["p1"], a - de, s)
				if sigue:
					vel =((tr["p1"] as Vector3) -(tr["p0"] as Vector3)) / dur
			"recta":
				p =(tr["p0"] as Vector3).lerp(tr["p1"], u)
			"rueda":

				p =(tr["p0"] as Vector3).lerp(tr["p1"], 1.0 -(1.0 - u) *(1.0 - u))
				if sigue:
					vel =((tr["p1"] as Vector3) -(tr["p0"] as Vector3)) \
							*(2.0 *(1.0 - u) / dur)
	bal.position = p
	bal.visible = ve
	_pases_balon_gira(bal, _cal_d("tiros", vel), _cal_vista("tiros"))





func _pases_portero_en() -> void:
	var k: AnimatedSprite3D = _tiro_portero
	if k == null:
		return
	var fr: SpriteFrames = k.sprite_frames
	var v: Dictionary = {}
	for w in _tiro_vueltas:
		if float(w["t0"]) <= t:
			v = w
	var x: float = TIRO_PORTERO.x
	var anim: String = "idle"
	var cuadro: int = -1
	if v.is_empty():
		pass
	elif not bool(v["gol"]):
		var llega: float = float(v["llega"])
		var saca: float = float(v["saca"])
		var u: float = t -(llega - 0.1)
		if u >= 0.0 and t < saca and fr.has_animation("ataja") \
				and fr.get_frame_count("ataja") > 0:
			anim = "ataja"
			cuadro = mini(int(u * 10.0), fr.get_frame_count("ataja") - 1)
		elif t >= saca and fr.has_animation("saca") and fr.get_frame_count("saca") > 0:
			var q: int = int((t - saca) * TIRO_SAQUE_FPS)
			if q < fr.get_frame_count("saca"):
				anim = "saca"
				cuadro = q
	elif fr.has_animation("estira") and fr.get_frame_count("estira") > 0:
		var nf: int = fr.get_frame_count("estira")
		var ida: float = float(nf) / 12.0
		var u: float = t -(float(v["llega"]) - 0.25)
		if u >= 0.0 and u < ida + TIRO_TENDIDO + TIRO_LEVANTA:
			anim = "estira"
			if u < ida:
				cuadro = int(u * 12.0)
				x -= TIRO_ESTIRA_M * RotuloTele._sale(u / ida)
			elif u < ida + TIRO_TENDIDO:
				cuadro = nf - 1
				x -= TIRO_ESTIRA_M
			else:
				var w: float =(u - ida - TIRO_TENDIDO) / TIRO_LEVANTA
				cuadro = nf - 1 - mini(int(w * float(nf)), nf - 1)
				x -= TIRO_ESTIRA_M *(1.0 - RotuloTele._suave(w))
	k.position.x = x
	if anim == "idle":
		if k.animation != "idle" or not k.is_playing():
			k.play("idle")
		return
	if k.animation != anim:
		k.animation = anim
		k.pause()
	k.frame = clampi(cuadro, 0, fr.get_frame_count(anim) - 1)









func _pases_su_dominadas(du: Dictionary, club: Dictionary) -> void:
	var rid: String = String(club.get("id", ""))
	var base: Dictionary = KitRecolor.team_only(_cal_kit("dominadas", club))
	var persona: Dictionary = {"name": String(du.get("name", "")),
		"number": int(_pases_look_rival(du).get("number", 0))}
	_domina = _cal_actor("dominadas", persona, base, rid, DOMINA_EN, true)
	var toques: Dictionary = _DOMINADAS.TOQUES
	var fps: float = _DOMINADAS.TOQUE_FPS
	var puestos: Dictionary = {}
	for tipo in DOMINA_SERIE:
		var e: Dictionary = toques[tipo]
		if not puestos.has(e["gesto"]):
			puestos[e["gesto"]] = true
			add_gesto(_domina, String(e["gesto"]), int(e["cuadros"]), fps)



	_cam2_desde = Vector3(DOMINA_EN.x + 0.3, 1.6, DOMINA_EN.z - 7.0)
	_cam2_hacia = Vector3(DOMINA_EN.x, 0.85, DOMINA_EN.z + 1.0)
	_cam2_fov = 40.0
	var h: Vector3 = _cam2_desde - DOMINA_EN
	h.y = 0.0
	_domina_hacia = h.normalized()

	_domina_derecha =(- _domina_hacia).cross(Vector3.UP).normalized()


	_domina_toques.clear()
	var at: float = 0.0
	var i: int = 0
	var fin: float = float(DURATION["pases"]) + 1.0
	while at < fin:
		var tipo: String = DOMINA_SERIE[i % DOMINA_SERIE.size()]
		var sig: String = DOMINA_SERIE[(i + 1) % DOMINA_SERIE.size()]
		_domina_toques.append({"t": at, "tipo": tipo, "p": _pases_domina_punto(tipo)})
		var sube: float = float(BancaJuego.DOM_ESTILOS[sig]["h"]) \
				- float(BancaJuego.DOM_ESTILOS[tipo]["h"])
		at += clampf(0.5 + 0.35 * maxf(sube, 0.0), 0.5, 0.95)
		i += 1
	_domina_balon = _pases_balon_3d("dominadas", DOMINA_EN)
	_domina_balon.position = _domina_toques[0]["p"]




func _pases_domina_punto(tipo: String) -> Vector3:
	var e: Dictionary =(_DOMINADAS.TOQUES as Dictionary)[tipo]
	var p: Vector3 = Vector3(DOMINA_EN.x, float(BancaJuego.DOM_ESTILOS[tipo]["h"]),
		DOMINA_EN.z)
	return p + _domina_hacia * float(e.get("delante", _DOMINADAS.DELANTE)) \
			+ _domina_derecha * float(e["lado"])





func _pases_dominadas_tick(prev: float) -> void:
	if _domina == null or _domina_toques.is_empty():
		return
	var toques: Dictionary = _DOMINADAS.TOQUES
	var fps: float = _DOMINADAS.TOQUE_FPS
	for k in _domina_toques:
		var e: Dictionary = toques[String(k["tipo"])]

		var adelanto: float = _lead((float(e["golpe"]) - 0.5) / fps, _domina)
		if _pases_cruza(prev, float(k["t"]) - adelanto):
			gesto_play(_domina, String(e["gesto"]), _cal_d("dominadas", _domina_hacia))
	idle_play(_domina, _cal_d("dominadas", _domina_hacia))
	var n: int = _domina_toques.size()
	var i: int = 0
	while i + 1 < n and float(_domina_toques[i + 1]["t"]) <= t:
		i += 1
	var a: Dictionary = _domina_toques[i]
	if i + 1 >= n:
		_domina_balon.position = a["p"]
		return
	var b: Dictionary = _domina_toques[i + 1]
	var dur: float = float(b["t"]) - float(a["t"])
	var s: float = clampf(t - float(a["t"]), 0.0, dur)
	var p0: Vector3 = a["p"]
	var p1: Vector3 = b["p"]
	var p: Vector3 = p0.lerp(p1, s / dur)
	p.y += 0.5 * BancaJuego.DOM_G * s *(dur - s)
	_domina_balon.position = p









func _cal_cabezazos(du: Dictionary, club: Dictionary) -> void:
	var rid: String = String(club.get("id", ""))
	var base: Dictionary = KitRecolor.team_only(_cal_kit("cabezazos", club))
	var nombre: String = String(du.get("name", ""))
	var gente: Array = [{"name": nombre,
		"number": int(_pases_look_rival(du).get("number", 0))}]
	gente.append_array(_cal_gente("cabezazos", rid, 1, nombre))
	var e: Dictionary =(_DOMINADAS.TOQUES as Dictionary)["cabeza"]
	_cabeza_dos.clear()
	_cabeza_sep = CABEZA_SESGO if _mode == "pronostico" else CABEZA_HONDO
	for i in 2:
		var at: Vector3 = CABEZA_EN +(_cabeza_sep if i == 0 else - _cabeza_sep)
		var s: AnimatedSprite3D = _cal_actor("cabezazos", gente[i], base, rid, at, i == 0)
		add_gesto(s, String(e["gesto"]), int(e["cuadros"]), _DOMINADAS.TOQUE_FPS)
		_cabeza_dos.append(s)




	if _mode == "pronostico":
		_cam2_desde = Vector3(CABEZA_EN.x + 0.3, 2.6, CABEZA_EN.z - 11.5)
		_cam2_hacia = Vector3(CABEZA_EN.x, 1.15, CABEZA_EN.z)
	else:
		_cam2_desde = Vector3(CABEZA_EN.x + 0.3, 2.8, CABEZA_EN.z - 10.0)
		_cam2_hacia = Vector3(CABEZA_EN.x, 1.5, CABEZA_EN.z)
	_cam2_fov = 40.0

	_cabeza_toques.clear()
	var at_t: float = 0.0
	var n: int = 0
	var fin: float = float(DURATION["pases"]) + 1.0
	while at_t < fin:
		_cabeza_toques.append({"t": at_t, "quien": n % 2,
			"p": _cal_cabeza_punto(n % 2)})
		at_t += CABEZA_VUELO
		n += 1
	_cabeza_balon = _pases_balon_3d("cabezazos", CABEZA_EN)
	_cabeza_balon.position = _cabeza_toques[0]["p"]




func _cal_cabeza_punto(quien: int) -> Vector3:
	var yo: Vector3 = CABEZA_EN +(_cabeza_sep if quien == 0 else - _cabeza_sep)
	var otro: Vector3 = CABEZA_EN +(- _cabeza_sep if quien == 0 else _cabeza_sep)
	var e: Dictionary =(_DOMINADAS.TOQUES as Dictionary)["cabeza"]
	var hacia: Vector3 =(otro - yo).normalized()
	return Vector3(yo.x, float(BancaJuego.DOM_ESTILOS["cabeza"]["h"]), yo.z) \
			+ hacia * float(e.get("delante", _DOMINADAS.DELANTE))






func _cal_cabezazos_tick(prev: float) -> void:
	if _cabeza_balon == null or _cabeza_toques.is_empty():
		return
	var e: Dictionary =(_DOMINADAS.TOQUES as Dictionary)["cabeza"]
	var adelanto: float =(float(e["golpe"]) - 0.5) / _DOMINADAS.TOQUE_FPS
	for k in _cabeza_toques:
		var q: int = int(k["quien"])

		if _pases_cruza(prev, float(k["t"]) - _lead(adelanto, _cabeza_dos[q])):
			gesto_play(_cabeza_dos[q], String(e["gesto"]), _cal_d("cabezazos",
				_cabeza_dos[1 - q].position - _cabeza_dos[q].position))
	for q in 2:
		idle_play(_cabeza_dos[q], _cal_d("cabezazos",
			_cabeza_dos[1 - q].position - _cabeza_dos[q].position))
	var n: int = _cabeza_toques.size()
	var i: int = 0
	while i + 1 < n and float(_cabeza_toques[i + 1]["t"]) <= t:
		i += 1
	var a: Dictionary = _cabeza_toques[i]
	var p: Vector3 = a["p"]
	var vel: Vector3 = Vector3.ZERO
	if i + 1 < n:
		var b: Dictionary = _cabeza_toques[i + 1]
		var dur: float = float(b["t"]) - float(a["t"])
		var s: float = clampf(t - float(a["t"]), 0.0, dur)
		p =(a["p"] as Vector3).lerp(b["p"], s / dur)
		p.y += 0.5 * PASES_G * s *(dur - s)
		vel =((b["p"] as Vector3) -(a["p"] as Vector3)) / dur
	_cabeza_balon.position = p
	_pases_balon_gira(_cabeza_balon, _cal_d("cabezazos", vel), _cal_vista("cabezazos"))





func _cal_arrancadas(du: Dictionary, club: Dictionary) -> void:
	var rid: String = String(club.get("id", ""))
	var base: Dictionary = KitRecolor.team_only(_cal_kit("arrancadas", club))
	var nombre: String = String(du.get("name", ""))
	var gente: Array = [{"name": nombre,
		"number": int(_pases_look_rival(du).get("number", 0))}]
	gente.append_array(_cal_gente("arrancadas", rid, ARRANCA_CALLES.size() - 1, nombre))
	_arranca.clear()
	for i in ARRANCA_CALLES.size():
		var at: Vector3 = _cal_arranca_en(i, 0.0)[0]
		var s: AnimatedSprite3D = _cal_actor("arrancadas", gente[i], base, rid, at, i == 0)


		add_run(s, s.sprite_frames.get_meta("look_cfg", {}))
		_arranca.append(s)


	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var tex: ImageTexture = _cal_cono_textura()
	for z in [ARRANCA_EN.z, ARRANCA_EN.z + ARRANCA_LARGO]:
		for x in [- ARRANCA_CONO_X, ARRANCA_CONO_X]:
			var c: Sprite3D = Sprite3D.new()
			c.texture = tex
			c.pixel_size = px
			c.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			c.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			c.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			c.position = Vector3(ARRANCA_EN.x + float(x),
				float(tex.get_height()) * px * 0.5, float(z))
			_cal_padre("arrancadas").add_child(c)


	_cam2_desde = Vector3(ARRANCA_EN.x + 0.4, 3.4, ARRANCA_EN.z - 9.5)
	_cam2_hacia = Vector3(ARRANCA_EN.x, 0.9, ARRANCA_EN.z + ARRANCA_LARGO * 0.55)
	_cam2_fov = 40.0







func _cal_arranca_en(i: int, at: float) -> Array:
	var ciclo: float = 2.0 *(ARRANCA_TRAMO + ARRANCA_PARA)
	var u: float = fposmod(at - float(i) * ARRANCA_DESFASE + ARRANCA_PARA - 0.15, ciclo)
	var x: float = ARRANCA_EN.x + ARRANCA_CALLES[i]
	var lejos: Vector3 = Vector3(x, 0.0, ARRANCA_EN.z + ARRANCA_LARGO)
	var cerca: Vector3 = Vector3(x, 0.0, ARRANCA_EN.z)
	var viene: Vector3 = Vector3(0.0, 0.0, -1.0)
	if u < ARRANCA_PARA:
		return [lejos, Vector3.ZERO, viene]
	u -= ARRANCA_PARA
	if u < ARRANCA_TRAMO:
		return [lejos.lerp(cerca, RotuloTele._suave(u / ARRANCA_TRAMO)), viene, viene]
	u -= ARRANCA_TRAMO
	if u < ARRANCA_PARA:
		return [cerca, Vector3.ZERO, - viene]
	u -= ARRANCA_PARA
	return [cerca.lerp(lejos, RotuloTele._suave(u / ARRANCA_TRAMO)), - viene, - viene]


func _cal_arrancadas_tick() -> void:
	for i in _arranca.size():
		var s: AnimatedSprite3D = _arranca[i]
		var e: Array = _cal_arranca_en(i, t)
		var p: Vector3 = e[0]
		s.position = Vector3(p.x, s.position.y, p.z)
		if (e[1] as Vector3).is_zero_approx():
			_pases_parado(s, _cal_d("arrancadas", e[2]))
		else:
			run_play(s, _cal_d("arrancadas", e[1]))




static func _cal_cono_textura() -> ImageTexture:
	var filas: Array[String] = ["...o...", "..obo..", "..oWo..", ".obbbo.", ".obbbo.",
		"ooBBBoo"]
	var img: Image = Image.create(7, filas.size(), false, Image.FORMAT_RGBA8)
	img.fill(Color.TRANSPARENT)
	var tinta: Dictionary = {"o": CareerTheme.INK_DARK, "b": CareerTheme.FUEGO_MEDIO,
		"B": CareerTheme.FUEGO_BORDE, "W": CareerTheme.INK_LIGHT}
	for y in filas.size():
		for x in 7:
			var ch: String = filas[y][x]
			if tinta.has(ch):
				img.set_pixel(x, y, tinta[ch])
	return ImageTexture.create_from_image(img)





















const SOMBRA_D_PERSONA: float = 39.0
const SOMBRA_D_MEDIO: float = 27.8
const SOMBRA_LADO: float = 1.25
const SOMBRA_T_MEDIO: float = 2.0
const SOMBRA_T_TABLERO: float = 4.2
const SOMBRA_FOV: float = 40.0
const SOMBRA_LLENA: float = 0.94


















const SOMBRA_ALZA: float = -16.0



const SOMBRA_TECHO: float = 250.0
const SOMBRA_DRIFT: float = -0.1




const SOMBRA_ENCIENDE: float = 0.4






const SOMBRA_CHYRON_AT: float = 0.5
const SOMBRA_CHYRON_FUERA: float = 3.0

const SCOREBOARD_SOMBRA: GDScript = preload("res://features/stadium/scoreboard_sombra.gd")


var _pantalla_sombra: ScoreboardFinal = null
var _sombra_eje: Vector3 = Vector3.BACK
var _sombra_centro: Vector3 = Vector3.ZERO
var _sombra_chyron_ido: bool = false


func _build_sombra(who: Dictionary, kit: Dictionary) -> void:
	var s: Dictionary = data.get("sombra", {}) as Dictionary
	var marco: Dictionary = stadium.scoreboard_frame()




	if s.is_empty() or marco.is_empty():
		call_deferred("_leave")
		return
	var n: Vector3 = marco["normal"]
	var yaw: float = rad_to_deg(atan2(n.x, - n.z))
	_sombra_eje = Vector3(sin(deg_to_rad(yaw)), 0.0, - cos(deg_to_rad(yaw)))
	_sombra_centro = marco["center"]

	_pinta_sombra(s, who, marco)




	var tam: Vector2 = SceneFade.rect_visible(self).size
	var t_fov: float = tan(deg_to_rad(SOMBRA_FOV) * 0.5)
	var dist: float =(float(marco["width"]) * 0.5) / maxf(
		SOMBRA_LLENA * t_fov * tam.x / maxf(tam.y, 1.0), 0.001)


	var alto_px: float = tam.x * SOMBRA_LLENA * float(marco["height"]) / float(marco["width"])
	var centro_px: float = SOMBRA_TECHO + UiKit.top_safe_inset(get_viewport()) + alto_px * 0.5
	var sobre_eje: float = atan((1.0 - centro_px /(tam.y * 0.5)) * t_fov)
	var ojo: Vector3 = _sombra_sobre_eje(dist) + Vector3.UP * _sombra_centro.y
	var alza: float = deg_to_rad(alza_cubierta(ojo, dist, marco, - SOMBRA_ALZA))
	var cam_y: float = _sombra_centro.y - dist * tan(alza)
	var mira: float = cam_y + dist * tan(alza - sobre_eje)




	var medio_h: float = 6.5 if alza == 0.0 else lerpf(1.45, cam_y, 0.5)
	var medio_mira: float = 5.0 if alza == 0.0 else lerpf(1.35, mira, 0.7)
	var yo: Vector3 = _sombra_sobre_eje(SOMBRA_D_PERSONA, SOMBRA_LADO)
	var medio: Vector3 = _sombra_sobre_eje(SOMBRA_D_MEDIO, SOMBRA_LADO * 0.4)
	focus = yo
	make_camera([
		{"t": 0.0, "dist": 6.2, "h": 1.45, "yaw": yaw - 8.0, "aim_y": 1.35,
			"fov": 38.0, "focus_x": yo.x, "focus_z": yo.z},
		{"t": SOMBRA_T_MEDIO, "dist": 18.0, "h": medio_h, "yaw": yaw - 3.0,
			"aim_y": medio_mira, "fov": 39.0, "focus_x": medio.x, "focus_z": medio.z},
		{"t": SOMBRA_T_TABLERO, "dist": dist, "h": cam_y, "yaw": yaw,
			"aim_y": mira, "fov": SOMBRA_FOV,
			"focus_x": _sombra_centro.x, "focus_z": _sombra_centro.z},
	], SOMBRA_FOV)
	orbit_speed = SOMBRA_DRIFT


	scrim_dim(0.55)



	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)
	look["number"] = GameState.shirt_number_now()
	make_player(look, "north")
	if player != null:
		player.position = Vector3(yo.x, feet_offset(player.pixel_size) - PLAYER_SINK, yo.z)



	var leyenda_club: Dictionary = _sombra_club(s)
	make_chyron(_tag(), CareerTheme.caps(String(s.get("nombre", ""))),
		leyenda_club if not leyenda_club.is_empty()
			else Nations.as_team(String(s.get("nat", ""))),
		SOMBRA_CHYRON_AT)





func _pinta_sombra(s: Dictionary, who: Dictionary, marco: Dictionary) -> void:
	_pantalla_sombra = SCOREBOARD_SOMBRA.new()
	add_child(_pantalla_sombra)
	var gap: int = int(s.get("gap", 0))
	var leyenda: Array = _sombra_look_leyenda(s)
	var lienzo: Dictionary = {
		"franja": I18n.t("GOLES + ASISTENCIAS"),
		"marca": I18n.t("IGUALADO CON LA LEYENDA") if gap <= 0
			else I18n.t("A {0} DE LA LEYENDA").format([gap]),
		"filas": [
			{"nombre": String(s.get("nombre", "")), "valor": int(s.get("theirs", 0)),
				"look": leyenda[0], "club": leyenda[1]},
			{"nombre": Career.player_name, "valor": int(s.get("mine", 0)),
				"look": GameState.player_look(), "club": who},
		],
		"acc": accent,
	}
	for llave in ["bg", "ink", "manual"]:
		if marco.has(llave):
			lienzo[llave] = marco[llave]
	_pantalla_sombra.pinta(lienzo)
	if not stadium.set_scoreboard_texture(_pantalla_sombra.get_texture()):
		call_deferred("_leave")
		return
	_pantalla_sombra.enciende(SOMBRA_ENCIENDE)



func _sombra_club(s: Dictionary) -> Dictionary:
	var id: String = String(s.get("club", ""))
	return {} if id.is_empty() else Teams.by_id(id)








func _sombra_look_leyenda(s: Dictionary) -> Array:
	var cara: String = String(s.get("cara", s.get("nombre", "")))
	var club: Dictionary = _sombra_club(s)
	if not club.is_empty():
		var cfg: Dictionary = KitRecolor.appearance_for(cara, GameState.kit_variant(club, 0))
		cfg["number"] = int(s.get("dorsal", 0))
		return [cfg, club]
	var pais: Dictionary = Nations.as_team(String(s.get("nat", "")))
	return [KitRecolor.appearance_for(cara,
		GameState.kit_variant(pais, 0) if not pais.is_empty() else {}), {}]




func _sombra_sobre_eje(d: float, lado: float = 0.0) -> Vector3:
	var lat: Vector3 = Vector3(_sombra_eje.z, 0.0, - _sombra_eje.x)
	return Vector3(_sombra_centro.x, 0.0, _sombra_centro.z) + _sombra_eje * d + lat * lado


func _tick_sombra() -> void:
	if _sombra_chyron_ido or t < SOMBRA_CHYRON_FUERA or chyron == null:
		return
	_sombra_chyron_ido = true
	var tw: Tween = create_tween()
	tw.set_parallel(true)
	tw.tween_property(chyron, "modulate:a", 0.0, 0.35)
	tw.tween_property(chyron, "position:x", -900.0, 0.45) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)



func _exit_tree() -> void:
	if _pantalla_sombra != null and stadium != null and is_instance_valid(stadium):
		stadium.set_scoreboard_texture(null)
	super._exit_tree()








func _tag() -> String:
	if _mode == "pases":
		return _tag_pases()
	if _mode == "pronostico":
		return I18n.t("PRONÓSTICO")
	if _mode == "banquillo":
		return I18n.t("DESDE EL BANQUILLO")
	if _mode == "sombra":
		return I18n.t("LA LEYENDA A TIRO")
	if _mode == "tunel":
		match _final_comp():
			"champions", "europa", "conference":
				return I18n.t("LA FINAL DE EUROPA")




			"libertadores", "sudamericana", "concacaf", "oriente", "sol", "atlas", "baobab", "coral":
				return I18n.t("LA FINAL")
			"mundial":




				return I18n.t("LA FINAL DE TU SELECCION")
			"mundialito":
				return I18n.t("LA FINAL DEL MUNDIALITO")
			"copa":
				return I18n.t("LA FINAL DE COPA")
			_:
				return I18n.t("LA FINAL")
	match String(data.get("comp", "")):
		"champions":
			return I18n.t("NOCHE EUROPEA")
		"europa":
			return I18n.t("NOCHE EUROPEA")
		"conference":
			return I18n.t("NOCHE EUROPEA")
		"copa":
			return I18n.t("COPA")
		_:
			return I18n.t("DERBI")


var _out: bool = false

var _booed: bool = false




const T_BOO: float = TIFO_SWEEP_T - 1.2


func _tick(delta: float) -> void:
	if _mode == "banquillo":
		_tick_rondo(delta)
	elif _mode == "sombra":
		_tick_sombra()
	elif _mode == "pases" or _mode == "pronostico":
		_tick_pases(delta)









	if not _booed and _dur > 0.0 and t >= T_BOO:
		_booed = true
		if stadium != null:
			stadium.crowd_boo(3.4, true)
		sting("crowd_whistles", -7.0)
	if _mode == "tunel":
		_tick_walkout(delta)




		if not _out and t >= TUNEL_ROAR:
			_out = true
			flash_rate = 26.0
			flash_burst_at = t
			flash_burst_dur = 2.2
			stadium.pulse_ads(3.0)
			stadium.crowd_excite(1.0)
			ovation(1.0)
			sting("fanfare", -7.0)
	if t >=(_dur if _dur > 0.0 else float(DURATION.get(_mode, 4.2))):
		_leave()







func _is_nat() -> bool:
	return String(GameState.current_fixture().get("comp", "")) == "nat"


func _derby() -> bool:
	if _is_nat():
		return false
	return Career.is_derby(String(GameState.current_fixture().get("opp", "")))


func _comp() -> String:
	if _is_nat():
		return ""
	return Competitions.id_of(GameState.current_fixture())
