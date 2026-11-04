extends Ceremony












































const STAGE: Dictionary = {
	3: {
		"steps": [Vector3(11.2, 0.34, 7.0), Vector3(5.4, 0.16, 3.4),
			Vector3(2.6, 0.3, 1.6)],
		"carpet": Vector2(13.6, 9.0), "halo": true, "plinth": 0.0,
		"beams": 4, "pillars": 10, "lamp": 3.8, "flash": 46.0,
		"squad": [0, 1, 2, 3], "crest": 2.6,



		"on_stage": true, "squad_squash": 0.5, "crew": 5,


		"decals": true, "backdrop": true, "confetti": 460,
	},
	2: {
		"steps": [Vector3(3.4, 0.16, 2.2), Vector3(2.6, 0.3, 1.6)],
		"carpet": Vector2(7.0, 4.4), "halo": false, "plinth": 0.0,
		"beams": 2, "pillars": 0, "lamp": 3.2, "flash": 30.0,
		"squad": [0, 1, 2], "crest": 1.5,
		"on_stage": false, "squad_squash": 1.0, "crew": 2,






		"decals": false, "backdrop": true, "confetti": 240,
	},
	1: {
		"steps": [Vector3(2.9, 0.3, 1.8)],
		"carpet": Vector2(5.4, 3.6), "halo": false, "plinth": 0.0,
		"beams": 0, "pillars": 0, "lamp": 2.4, "flash": 14.0,
		"squad": [0, 2], "crest": 1.2,
		"on_stage": false, "squad_squash": 1.0, "crew": 0,




		"decals": false, "backdrop": true, "confetti": 150,
	},
}




const CARPET_A: float = 0.62
const PILLAR_R: float = 6.6
const PILLAR_Y: float = 15.0












const BEAM_FLOOR: float = 2.6
const BEAM_R: float = 1.25
const PILLAR_A0: float = 0.1
const PILLAR_A1: float = 0.34
const TROPHY_H: float = 1.25
const PLAYER_X: float = 1.9























const SQUAD_FACES: int = 12
const SQUAD_ROWS: Array = [
	{"n": 4, "r": 4.8, "from": 186.0, "to": 238.0},
	{"n": 3, "r": 6.6, "from": 198.0, "to": 242.0},
	{"n": 3, "r": 5.2, "from": 298.0, "to": 330.0},
	{"n": 2, "r": 7.0, "from": 302.0, "to": 334.0},
]






const STAGE_ROWS: Array = [
	{"n": 4, "r": 4.4, "from": 207.0, "to": 249.0},
	{"n": 3, "r": 6.0, "from": 214.0, "to": 252.0},
	{"n": 3, "r": 4.6, "from": 292.0, "to": 331.0},
	{"n": 2, "r": 6.2, "from": 297.0, "to": 334.0},
]
const SQUAD_H: float = 1.74





































const KEYS: Array = [
	{"t": 0.0, "dist": 15.5, "h": 4.0, "yaw": 104.0, "aim_y": 2.0, "fov": 42.0},
	{"t": 2.9, "dist": 13.2, "h": 3.35, "yaw": 96.0, "aim_y": 1.85, "fov": 39.0},
	{"t": 6.2, "dist": 12.2, "h": 2.95, "yaw": 89.0, "aim_y": 1.75, "fov": 37.0},
	{"t": 8.6, "dist": 11.8, "h": 2.75, "yaw": 83.0, "aim_y": 1.7, "fov": 36.0},
]

const T_LIFT: float = 2.9
const REACT_EVERY: float = 3.2













const WATCH_H: float = 1.74



const WATCH_FACES: int = 6









const WATCH_SPOTS: Array = [
	Vector2(14.6, -4.4), Vector2(13.6, -2.4), Vector2(14.8, -0.5),
	Vector2(13.8, 1.6), Vector2(14.5, 3.0), Vector2(13.4, 4.4),
]
const YOU_SPOT: Vector2 = Vector2(12.6, 0.5)












const LOST_KEYS: Array = [
	{"t": 0.0, "dist": 21.0, "h": 3.6, "yaw": 92.0, "aim_y": 1.7, "fov": 39.0},
	{"t": 3.4, "dist": 19.2, "h": 3.1, "yaw": 86.0, "aim_y": 1.5, "fov": 36.0},
	{"t": 7.4, "dist": 23.5, "h": 4.7, "yaw": 99.0, "aim_y": 2.3, "fov": 45.0},
]
const LOST_FOCUS: Vector3 = Vector3(0.8, 1.5, 0.0)

var _cfg: Dictionary = {}
var _stage: Dictionary = {}


var _pie_base: float = 0.0
var _lifted: bool = false
var _next_react: float = 0.0


var _festejan: Array[Dictionary] = []



const FESTEJO_OLA_S: float = 0.35
const FESTEJO_OLA_M: float = 6.0



var _squad_skip: String = ""



var _rev: Dictionary = {}















func _pomp() -> int:
	var score: float = float(_cfg.get("rank", 50))
	var comp: String = String(_cfg.get("comp", "liga"))
	if comp == "liga" or comp == "copa":
		score += [0.0, 25.0, 0.0, -18.0][div()]
	if score >= 70.0:
		return 3
	if score >= 38.0:
		return 2
	return 1




func _accent_for() -> Color:
	_cfg = Ceremonies.trophy_cfg(String(data.get("award", "Campeón de Liga")))
	var comp: String = String(_cfg.get("comp", "liga"))
	if comp == "liga":
		return CareerTheme.accent_of(_stage_team())
	return Competitions.COMP_ACCENT.get(comp, CareerTheme.MONEY)




func _stage_team() -> Dictionary:
	if bool(_cfg.get("nation", false)):
		var nat: Dictionary = Nations.as_team(Career.nationality)
		if not nat.is_empty():
			return nat
	return team()


func _build() -> void:
	var who: Dictionary = _stage_team()
	var kit: Dictionary = GameState.kit_variant(who, 0)
	_stage = _stage_de_hoy()

	var est: Dictionary = {
		"div": div(),
		"attendance": 1.0,
		"party": true,
		"weather": String(_cfg.get("weather", "sunset")),
		"kit": kit,
		"banner": I18n.t("CAMPEONES"),
		"board": I18n.t("CAMPEONES"),
	}
	est.merge(_canones_cfg())
	make_stadium(est)


	focus = Vector3(0.3, 0.0, CENTER_Z)






	var rev_v: Variant = data.get("revancha", {})
	_rev = rev_v if rev_v is Dictionary else {}
	if not _rev.is_empty() and not bool(_cfg.get("nation", false)):
		focus = Vector3(LOST_FOCUS.x, LOST_FOCUS.y, CENTER_Z)
		make_camera(LOST_KEYS)
	else:
		_rev = {}
		make_camera(KEYS)
	_build_podium()
	_build_squad(kit)
	_build_crew(int(_stage["crew"]))
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)



	look["number"] = shirt()
	make_player(look)

	_pie_base = player.position.y


	if _pina:
		var fin: Vector2 = PINA_CAPI if _yo_capi else PINA_TU
		_walk_b = Vector3(fin.x, 0.0, CENTER_Z + fin.y)
		_walk_a = _walk_b + Vector3(0.0, 0.0, PINA_ENTRA_Z)
		if _yo_capi:
			_capi = player
			_alza_hornea(player.sprite_frames)
			_copa_mano = CopaEnManos.hornea(self, player)
		else:
			_tu_gesto = festejo_hornea(player.sprite_frames, 0)
	else:
		_walk_b = Vector3(PLAYER_X, 0.0, CENTER_Z)
		_walk_a = _walk_b + Vector3(WALK_FROM, 0.0, 0.0)
	player.position.x = _walk_b.x
	player.position.z = _walk_b.z
	player.position.y = _pie_base + _piso_en(_walk_b.x, _walk_b.z)





	_walks = add_walk(player, look)
	if _walks:
		player.position.x = _walk_a.x
		player.position.z = _walk_a.z



	_piso_pie = _piso_en(player.position.x, player.position.z)
	player.position.y = _pie_base + _piso_pie
	make_audio(1.0, true)
	stadium.crowd_excite(0.8)
	flash_pool = stand_flash_pool(CENTER_Z, 34.0)

	flash_rate = float(_stage["flash"])
	flash_burst_at = T_LIFT
	confetti_count = int(_stage["confetti"])
	confetti_colors = [accent, CareerTheme.MONEY, Color.WHITE, accent.lightened(0.35)]



	if not _rev.is_empty():
		_build_revancha()







	var sub: String = ""
	if not _rev.is_empty():
		sub = I18n.tf("REVANCHA · TEMPORADA {0}", [int(_rev.get("season", 0))])
	make_chyron(_comp_label(), Nations.team_label(who, "?").to_upper(), who,
		-1.0, "", sub)
	make_card()









	card_title(Competitions.demarca(I18n.t(JuegosOlimpicos.pinta(
		String(_cfg.get("award", "CAMPEONES"))))).to_upper(), 40)
	card_sub(Nations.team_label(who).to_upper())




	card_count(int(data.get("goals", 0)), I18n.tf("TUS GOLES EN ESTE TORNEO · {0} PARTIDOS",
		[int(data.get("matches", 0))]))
	card_reward(int(data.get("pts", 0)), int(data.get("pts_xp", 0)))
	if not _rev.is_empty():



		card_note(I18n.tf("{0} te quitó la final de la temporada {1} ({2}). Esta noche los que miran son ellos.",
			[Nations.team_label(Teams.by_id(String(_rev.get("club", ""))), "?"),
				int(_rev.get("season", 0)), marcador_final(int(_rev.get("gf", 0)),
					int(_rev.get("ga", 0)), _rev.get("pen", []))]))
	else:
		card_note(I18n.t(String(_cfg.get("line", ""))))
	card_cta(I18n.t("SEGUIR"))






static func marcador_final(gf: int, ga: int, pen: Variant) -> String:
	var s: String = "%d-%d" % [gf, ga]
	if pen is Array and (pen as Array).size() == 2:
		s += ", " + I18n.tf("PENALES {0}-{1}", [int(pen[0]), int(pen[1])])
	return s










func _build_revancha() -> void:
	var rival: Dictionary = Teams.by_id(String(_rev.get("club", "")))
	if rival.is_empty():
		return
	var rid: String = String(rival.get("id", ""))
	var kit: Dictionary = GameState.kit_variant(rival, 0)
	if Teams.kits_clash(kit["kit"], GameState.kit_variant(_stage_team(), 0)["kit"]):
		kit = GameState.kit_variant(rival, 1)
	var sigue: bool = bool(_rev.get("sigue", false)) \
			and not String(_rev.get("cara", "")).is_empty()
	_miran_de_espaldas(kit, rid, false, String(_rev.get("name", "")) if sigue else "")
	if not sigue:
		return
	var yo: AnimatedSprite3D = decisor_sprite(_rev, rid, kit, "north")
	yo.position = Vector3(YOU_SPOT.x, yo.position.y, CENTER_Z + YOU_SPOT.y)






func _miran_de_espaldas(kit: Dictionary, team_id: String, mine: bool, skip: String = "") -> void:
	var px: float = WATCH_H / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	var pool: Array[SpriteFrames] = squad_frames_pool(kit, WATCH_FACES, team_id,
		"north", mine, skip)
	if pool[0].get_frame_count("idle") == 0:
		return
	for i in WATCH_SPOTS.size():
		var sp: Vector2 = WATCH_SPOTS[i]
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = pool[i % pool.size()]
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = Vector3(sp.x, y, CENTER_Z + sp.y)
		viewport.add_child(s)
		s.play("idle")
		s.speed_scale = rng.randf_range(0.7, 1.2)
		if s.sprite_frames.get_frame_count("idle") > 1:
			s.frame = rng.randi_range(0, s.sprite_frames.get_frame_count("idle") - 1)













func decisor_sprite(d: Dictionary, rid: String, kit: Dictionary,
		facing: String = "south") -> AnimatedSprite3D:
	var persona: Dictionary = {"name": String(d.get("cara", "")),
		"number": int(d.get("number", 0))}
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	var alto: float = PLAYER_HEIGHT_M
	if String(d.get("como", "")) == "parada":
		var de_campo: Dictionary = GameState.kit_variant(Teams.by_id(rid), 0)
		var base: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(rid, -1,
			String(de_campo.get("pattern", "solid"))), de_campo)
		var look: Dictionary = person_look(persona, base)
		look["club"] = rid
		if facing == "south":
			alto = KEEPER_H
			s.sprite_frames = keeper_idle_frames(look)
		else:
			s.sprite_frames = player_frames(look, facing)
	else:
		var cfg: Dictionary = person_look(persona, kit)
		cfg["club"] = rid
		s.sprite_frames = player_frames(cfg, facing)
	s.pixel_size = alto / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.position = Vector3(0.0, feet_offset(s.pixel_size) - PLAYER_SINK, CENTER_Z)
	viewport.add_child(s)
	s.play("idle")
	PlacaNombre.cuelga(s, String(d.get("nombre", "")), true, true)
	return s



const KEEPER_H: float = 1.9

















func _piso_en(x: float, z: float) -> float:


	if not bool(_stage["on_stage"]) and not _pina:
		return 0.0
	var techo: float = _tarima_en(x, z)
	for g in _gradas:
		if absf(x - float(g["x"])) <= float(g["w"]) * 0.5 \
				and absf(z - CENTER_Z) <= float(g["d"]) * 0.5:
			techo = maxf(techo, float(g["y"]))
	return techo




func _tarima_en(x: float, z: float) -> float:
	var y: float = 0.0
	var techo: float = 0.0
	for paso in _stage["steps"]:
		var s: Vector3 = paso
		y += s.y
		if absf(x) <= s.x * 0.5 and absf(z - CENTER_Z) <= s.z * 0.5:
			techo = y
	return techo










func _build_podium() -> void:
	_build_carpet()






	var y: float = 0.0
	var steps: Array = _stage["steps"]
	for i in steps.size():
		var s: Vector3 = steps[i]


		var tone: float = lerpf(0.07, 0.11, float(i) / maxf(float(steps.size() - 1), 1.0))
		_box(s, Vector3(0.0, y + s.y * 0.5, CENTER_Z),
			Color(tone, tone + 0.012, tone + 0.035))
		y += s.y
		_rim(Vector2(s.x, s.z), y)





	var plinth: float = float(_stage["plinth"])
	if plinth > 0.0:
		_box(Vector3(0.62, plinth, 0.62), Vector3(0.0, y + plinth * 0.5, CENTER_Z),
			Color(0.13, 0.14, 0.18))
		var cap: MeshInstance3D = _box(Vector3(0.78, 0.05, 0.78),
			Vector3(0.0, y + plinth, CENTER_Z), accent)
		(cap.material_override as StandardMaterial3D).shading_mode = \
				BaseMaterial3D.SHADING_MODE_UNSHADED
		y += plinth



	var trophy: Sprite3D = make_trophy(String(_cfg.get("icon", "liga")),
		Vector3(0.0, y + TROPHY_H * 0.5, CENTER_Z), TROPHY_H, 320, null, true)
	trophy.modulate = Color(0.35, 0.35, 0.4)
	_build_halo(trophy.position)


	var lamp: OmniLight3D = OmniLight3D.new()
	lamp.light_color = Color(1.0, 0.95, 0.8)
	lamp.light_energy = 0.0
	lamp.omni_range = 7.0
	lamp.position = Vector3(0.0, y + TROPHY_H + 0.9, CENTER_Z - 0.6)
	viewport.add_child(lamp)
	_trophy = trophy
	_lamp = lamp

	if bool(_stage["decals"]):
		_build_decals(float((steps[0] as Vector3).y),
			float((steps[0] as Vector3).x), float((steps[0] as Vector3).z))
	if bool(_stage["backdrop"]):
		_build_backdrop()
	if int(_stage["pillars"]) > 0:
		_build_pillars(int(_stage["pillars"]))
	_build_beams(y)





func _build_beams(top_y: float) -> void:
	var n: int = int(_stage["beams"])
	var from_y: float = 13.0
	for i in n:

		var side: float = -1.0 if i % 2 == 0 else 1.0
		var rank: float = float(i / 2) + 1.0







		var suelo: float = maxf(top_y * 0.5, BEAM_FLOOR)
		_beams.append(make_beam(
			Vector3(side * 1.7 * rank, from_y, CENTER_Z + side * 1.4 * rank),
			Vector3(side * 0.5 * rank, suelo, CENTER_Z),
			0.35, BEAM_R / rank, accent, 0.0))














func _build_halo(pos: Vector3) -> void:
	var g: Gradient = Gradient.new()
	g.offsets = PackedFloat32Array([0.0, 0.3, 1.0])
	g.colors = PackedColorArray([
		Color(1.0, 1.0, 1.0, 1.0), Color(1.0, 1.0, 1.0, 0.45),
		Color(1.0, 1.0, 1.0, 0.0)])
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = g
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	tex.width = 96
	tex.height = 96
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	m.disable_receive_shadows = true
	m.albedo_texture = tex


	m.albedo_color = Color(_accent_for().lerp(Color.WHITE, 0.45), 0.0)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(HALO_R * 2.0, HALO_R * 2.0)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = q
	mi.material_override = m
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = pos + Vector3(0.0, 0.0, -0.25)
	viewport.add_child(mi)
	_halo_mat = m
	_halo = mi













func _build_decals(top: float, w: float, d: float) -> void:
	var logo: String = _logo_torneo()


	var spr: Sprite3D = make_comp_logo(logo, CareerTheme.on_accent(),
		Vector3(0.0, top + 0.02, CENTER_Z - d * 0.32), w * 0.34, true)
	spr.rotate_x(- PI * 0.5)
	spr.modulate = Color(1.0, 1.0, 1.0, 0.72)
	var crest: Texture2D = crest_texture(_stage_team())
	for side in [-1.0, 1.0]:
		var q: MeshInstance3D = _quad(Vector2(1.7, 1.7), top + 0.02,
			CENTER_Z - d * 0.3, Color(1.0, 1.0, 1.0, 0.72))
		q.position.x = side * w * 0.34
		var m: StandardMaterial3D = q.material_override
		m.albedo_texture = crest
		m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA













func _logo_torneo() -> String:
	var comp: String = String(_cfg.get("comp", "liga"))
	if comp != "liga":
		return Competitions.comp_logo(comp)
	var pais: String = str(team().get("country", ""))
	if pais.is_empty():
		pais = Teams.country_of(club_del_acto())
	return Competitions.league_div_logo(pais, div())










const BACKDROP_X: float = -9.0
const BACKDROP: Vector3 = Vector3(0.3, 4.1, 13.0)





const BACKDROP_EMBLEM_Y: float = 2.75
const BACKDROP_EMBLEM_H: float = 1.5


func _build_backdrop() -> void:
	_box(BACKDROP, Vector3(BACKDROP_X, BACKDROP.y * 0.5, CENTER_Z),
		Color(0.07, 0.08, 0.11))


	var cap: MeshInstance3D = _box(
		Vector3(BACKDROP.x * 1.3, 0.16, BACKDROP.z),
		Vector3(BACKDROP_X, BACKDROP.y, CENTER_Z), accent)
	(cap.material_override as StandardMaterial3D).shading_mode = \
			BaseMaterial3D.SHADING_MODE_UNSHADED


	var logo: String = _logo_torneo()
	var crest: Texture2D = crest_texture(_stage_team())
	for i in 5:
		var z: float = CENTER_Z + lerpf(-4.8, 4.8, float(i) / 4.0)
		var at: Vector3 = Vector3(BACKDROP_X + BACKDROP.x * 0.5 + 0.03,
			BACKDROP_EMBLEM_Y, z)
		if i % 2 == 0:
			var q: MeshInstance3D = _quad(
				Vector2(BACKDROP_EMBLEM_H, BACKDROP_EMBLEM_H), at.y, z, Color.WHITE)
			q.position.x = at.x
			q.rotation = Vector3.ZERO
			q.rotate_y(PI * 0.5)
			var m: StandardMaterial3D = q.material_override
			m.albedo_texture = crest
			m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		else:
			var spr: Sprite3D = make_comp_logo(logo, accent.lightened(0.4), at,
				BACKDROP_EMBLEM_H, true)
			spr.rotate_y(PI * 0.5)





















const CREW_SHEET: String = "res://assets/sprites/anim/crew_south_"
const CREW_H: float = 1.72

const CREW_DEG: Array = [163.0, 199.0, 236.0, 288.0, 335.0]
const CREW_RX: float = 7.6
const CREW_RZ: float = 4.9


func _build_crew(n: int) -> void:
	if n <= 0 or not ResourceLoader.exists(CREW_SHEET + "00.png"):
		return
	var px: float = CREW_H / PLAYER_METRICS.x
	var y: float = feet_offset(px, CREW_SHEET + "00.png") - PLAYER_SINK
	for i in mini(n, CREW_DEG.size()):



		var a: float = deg_to_rad(float(CREW_DEG[(i * 2) % CREW_DEG.size()]))
		var at: Vector3 = Vector3(sin(a) * CREW_RX, 0.0, CENTER_Z - cos(a) * CREW_RZ)
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = player_frames(_crew_look(i), "south", CREW_SHEET, true)
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = at + Vector3(0.0, y, 0.0)
		viewport.add_child(s)
		s.play("idle")
		s.speed_scale = rng.randf_range(0.6, 1.1)
		_build_rig(at, i)









func _crew_look(i: int) -> Dictionary:
	return Coach.look_de("crew_%d" % i)









func _build_rig(at: Vector3, i: int) -> void:

	var to_stage: Vector3 =(Vector3(0.0, 0.0, CENTER_Z) - at).normalized()



	var side: float = 0.3 if i % 2 == 0 else -0.3
	var out: Vector3 = Vector3(- to_stage.z, 0.0, to_stage.x)
	var shoulder: Vector3 = at + out * side + Vector3(0.0, 1.24, 0.0)
	_box(Vector3(0.46, 0.34, 0.4), shoulder + to_stage * 0.2,
		Color(0.12, 0.13, 0.16))


	_box(Vector3(0.22, 0.22, 0.42), shoulder + to_stage * 0.52,
		Color(0.16, 0.17, 0.21))

	_box(Vector3(0.12, 0.26, 0.12), shoulder + to_stage * 0.08 - Vector3(0.0, 0.2, 0.0),
		Color(0.1, 0.11, 0.13))
	var tally: MeshInstance3D = _box(Vector3(0.09, 0.09, 0.09),
		shoulder + to_stage * 0.34 + Vector3(0.0, 0.22, 0.0), CareerTheme.DANGER)
	(tally.material_override as StandardMaterial3D).shading_mode = \
			BaseMaterial3D.SHADING_MODE_UNSHADED












func _build_pillars(n: int) -> void:













	var z_fondo: float = _squad_z_max()
	var lim: float = acos(clampf(- z_fondo / PILLAR_R, -0.999, 0.999))
	for i in n:
		var a: float = lerpf(lim, TAU - lim,(float(i) + 0.5) / float(n))
		var r: float = PILLAR_R
		var at: Vector3 = Vector3(sin(a) * r, 0.0, CENTER_Z + cos(a) * r)


		_pillars.append(make_beam(at + Vector3(0.0, PILLAR_Y, 0.0), at,
			0.95, 0.18, accent, PILLAR_A0))





func _squad_z_max() -> float:
	var rows: Array = STAGE_ROWS if bool(_stage["on_stage"]) else SQUAD_ROWS
	var squash: float = float(_stage["squad_squash"])
	var out: float = 0.0
	for idx in _stage["squad"]:
		var row: Dictionary = rows[int(idx)]
		for deg in [float(row["from"]), float(row["to"])]:
			out = maxf(out, float(row["r"]) * squash * cos(deg_to_rad(deg)))


	return out + 1.0










func _rim(size: Vector2, y: float, w: float = 0.17) -> void:
	for i in 4:
		var long: bool = i < 2
		var side: float = -1.0 if i % 2 == 0 else 1.0
		var box: Vector3 = Vector3(size.x, 0.055, w) if long \
				else Vector3(w, 0.055, size.y - w * 2.0)
		var at: Vector3 = Vector3(0.0, y, CENTER_Z + side *(size.y - w) * 0.5) if long \
				else Vector3(side *(size.x - w) * 0.5, y, CENTER_Z)
		var m: MeshInstance3D = _box(box, at, accent)
		(m.material_override as StandardMaterial3D).shading_mode = \
				BaseMaterial3D.SHADING_MODE_UNSHADED




func _box(size: Vector3, pos: Vector3, col: Color) -> MeshInstance3D:
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = size
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.9
	box.material_override = mat
	box.position = pos
	viewport.add_child(box)
	return box





func _build_carpet() -> void:
	var size: Vector2 = _stage["carpet"]



	if bool(_stage["halo"]):
		_quad(size * 1.55, 0.008, CENTER_Z, Color(accent.r, accent.g, accent.b, 0.16))
	_quad(Vector2(size.x + 0.34, size.y + 0.34), 0.012, CENTER_Z,
		Color(accent.r, accent.g, accent.b, 0.85))
	_quad(size, 0.02, CENTER_Z, Color(0.07, 0.09, 0.12, CARPET_A))





	if bool(_stage["decals"]):
		return
	var cs: float = float(_stage["crest"])
	var crest: MeshInstance3D = _quad(Vector2(cs, cs), 0.03,
		CENTER_Z - size.y * 0.5 + cs * 0.78, Color.WHITE)
	var cmat: StandardMaterial3D = crest.material_override
	cmat.albedo_texture = crest_texture(_stage_team())
	cmat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA




func _quad(size: Vector2, y: float, z: float, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	m.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	if col.a < 1.0:
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.material_override = mat
	m.position = Vector3(0.0, y, z)
	m.rotate_x(- PI * 0.5)
	viewport.add_child(m)
	return m





func _build_squad(kit: Dictionary) -> void:
	if _plantel_festeja():
		_build_pina(kit)
		return
	var rows: Array = STAGE_ROWS if bool(_stage["on_stage"]) else SQUAD_ROWS




	var stage_id: String = String(_stage_team().get("id", ""))





	var pool: Array[SpriteFrames] = squad_frames_pool(kit, SQUAD_FACES, stage_id,
		"south", stage_id == club_del_acto(),
		_squad_skip)
	if pool[0].get_frame_count("idle") == 0:
		return

	var gestos: Array[String] = []
	for k in pool.size():
		gestos.append(festejo_hornea(pool[k], k) if _plantel_festeja() else "")



	var squash: float = float(_stage["squad_squash"])
	var n: int = 0




	for idx in _stage["squad"]:
		var row: Dictionary = rows[int(idx)]
		var count: int = int(row["n"])
		for i in count:


			var k: float = float(i) / maxf(float(count - 1), 1.0)
			var deg: float = lerpf(float(row["from"]), float(row["to"]), k) \
					+ rng.randf_range(-3.5, 3.5)
			var r: float = float(row["r"]) + rng.randf_range(-0.35, 0.35)
			var a: float = deg_to_rad(deg)
			var sx: float = sin(a) * r
			var sz: float = CENTER_Z - cos(a) * r * squash
			var s: AnimatedSprite3D = _actor_plantel(pool[n % pool.size()], sx, sz)
			_festeja_apunta(s, gestos[n % pool.size()])
			n += 1




func _actor_plantel(frames: SpriteFrames, sx: float, sz: float) -> AnimatedSprite3D:
	var px: float = SQUAD_H / PLAYER_METRICS.x
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.sprite_frames = frames
	s.pixel_size = px
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


	s.position = Vector3(sx, feet_offset(px) - PLAYER_SINK + _piso_en(sx, sz), sz)
	viewport.add_child(s)
	s.play("idle")
	s.speed_scale = rng.randf_range(0.7, 1.45)
	if s.sprite_frames.get_frame_count("idle") > 1:
		s.frame = rng.randi_range(0, s.sprite_frames.get_frame_count("idle") - 1)
	return s



func _festeja_apunta(s: AnimatedSprite3D, gesto: String) -> void:
	if gesto.is_empty():
		return



	var ya: bool = gesto == "aplauso"
	_festejan.append({"spr": s, "anim": gesto, "desde": 0.0 if ya else -1.0,
		"ola": clampf(Vector2(s.position.x, s.position.z - CENTER_Z).length()
			/ FESTEJO_OLA_M, 0.0, 1.0) * FESTEJO_OLA_S})
	if ya:
		festejo_play(s, gesto)

















const PINA_CAPI: Vector2 = Vector2(-0.45, 0.0)



const PINA_TU: Vector2 = Vector2(-0.45, 0.78)
const PINA_SLOTS: Array = [
	Vector2(-0.45, -0.78),
	Vector2(-1.15, -0.38), Vector2(-1.15, 0.38), Vector2(-1.15, -1.14), Vector2(-1.15, 1.14),
	Vector2(-1.85, -0.76), Vector2(-1.85, 0.76), Vector2(-1.85, -1.52), Vector2(-1.85, 1.52),
	Vector2(-2.55, -1.14), Vector2(-2.55, 1.14), Vector2(-2.55, -1.9), Vector2(-2.55, 1.9),



	Vector2(-2.55, -0.38), Vector2(-2.55, 0.38), Vector2(-1.85, 0.0),
]





const PINA_GRADAS: Array = [
	{"x": -1.85, "w": 0.7, "d": 3.8, "sube": 0.2},
	{"x": -2.55, "w": 0.7, "d": 4.6, "sube": 0.4},
]





const PINA_TARIMA: Vector2 = Vector2(6.0, 5.0)
const PINA_ESCALON: Vector2 = Vector2(1.2, 1.0)

const PINA_ENTRA_Z: float = 3.4




const ALZA_HOJA: String = "res://assets/sprites/anim/celebration_south_"
const ALZA_DESDE: int = 4
const ALZA_HASTA: int = 6
const ALZA_FPS: float = 5.0


const ALZA_MANOS_PX: float = 70.0



const COPA_ALZADA_ESCALA: float = 0.6
const ALZA_DUR: float = 0.45




const COPA_ALZADA_BAJA: float = 0.3

var _pina: bool = false
var _gradas: Array[Dictionary] = []

var _capi: AnimatedSprite3D = null
var _yo_capi: bool = false

var _tu_gesto: String = ""




func _tu_en_la_pina() -> bool:
	return true





func _llevas_la_c(mine: bool) -> bool:
	if bool(_cfg.get("nation", false)):
		return Career.nat_captain
	return mine and Career.is_captain


func _build_pina(kit: Dictionary) -> void:
	_pina = true
	var stage_id: String = String(_stage_team().get("id", ""))
	var mine: bool = stage_id == club_del_acto()


	var rows: Array = STAGE_ROWS if bool(_stage["on_stage"]) else SQUAD_ROWS
	var n: int = 0
	for idx in _stage["squad"]:
		n += int((rows[int(idx)] as Dictionary)["n"])
	var tu: bool = _tu_en_la_pina()
	_yo_capi = tu and _llevas_la_c(mine)



	var gente: Array = squad_people(stage_id, n + 6, mine, _squad_skip)
	var capi: Dictionary = {}
	if not _yo_capi and not gente.is_empty():
		var nm: String = Squad.captain_name(stage_id)
		for p in gente:
			if not nm.is_empty() and String((p as Dictionary).get("name", "")) == nm:
				capi = p
				break
		if capi.is_empty():
			capi = gente[0]
		gente.erase(capi)
	gente = gente.slice(0, n)



	var slots: Array = PINA_SLOTS.duplicate()
	if not tu:
		slots.push_front(PINA_TU)
	elif _yo_capi:
		slots.push_back(PINA_TU)
	_build_gradas(slots, gente.size())

	var pool: Array[SpriteFrames] = people_frames_pool(gente, kit)
	for i in mini(pool.size(), slots.size()):
		var at: Vector2 = slots[i]

		var s: AnimatedSprite3D = _actor_plantel(pool[i],
			at.x + rng.randf_range(-0.06, 0.06),
			CENTER_Z + at.y + rng.randf_range(-0.05, 0.05))
		_festeja_apunta(s, festejo_hornea(pool[i], i))
	if not capi.is_empty():
		var cf: SpriteFrames = people_frames_pool([capi], kit)[0]
		_capi = _actor_plantel(cf, PINA_CAPI.x, CENTER_Z + PINA_CAPI.y)
		_alza_hornea(cf)
		_copa_mano = CopaEnManos.hornea(self, _capi)




func _build_gradas(slots: Array, gente: int) -> void:
	var techo: float = 0.0
	for paso in _stage["steps"]:
		techo +=(paso as Vector3).y
	for g in PINA_GRADAS:
		var usada: bool = false
		for i in mini(gente, slots.size()):
			if absf((slots[i] as Vector2).x - float(g["x"])) <= float(g["w"]) * 0.5:
				usada = true
				break
		if not usada:
			continue
		var y: float = techo + float(g["sube"])
		var w: float = float(g["w"])
		var d: float = float(g["d"])
		_box(Vector3(w, y, d), Vector3(float(g["x"]), y * 0.5, CENTER_Z),
			Color(0.1, 0.112, 0.145))

		var filo: MeshInstance3D = _box(Vector3(0.05, 0.055, d),
			Vector3(float(g["x"]) + w * 0.5, y, CENTER_Z), accent)
		(filo.material_override as StandardMaterial3D).shading_mode = \
				BaseMaterial3D.SHADING_MODE_UNSHADED
		_gradas.append({"x": float(g["x"]), "w": w, "d": d, "y": y})




func _alza_hornea(frames: SpriteFrames) -> void:
	if frames == null or frames.has_animation("alza") or not frames.has_meta("look_cfg"):
		return
	var cfg: Dictionary = frames.get_meta("look_cfg", {})
	frames.add_animation("alza")
	frames.set_animation_loop("alza", true)
	frames.set_animation_speed("alza", ALZA_FPS)
	for i in range(ALZA_DESDE, ALZA_HASTA + 1):
		var path: String = "%s%02d.png" % [ALZA_HOJA, i]
		if ResourceLoader.exists(path):
			frames.add_frame("alza", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("alza") == 0:
		frames.remove_animation("alza")




func _alza_copa() -> void:
	if _capi == null or not is_instance_valid(_capi) \
			or not _capi.sprite_frames.has_animation("alza"):
		_canones_dispara()
		return


	espalda_registra(_capi, "alza", ALZA_HOJA, ALZA_DESDE)
	_capi.play("alza")
	_capi.speed_scale = 1.0
	if _yo_capi == false and not _tu_gesto.is_empty():
		festejo_play(player, _tu_gesto)
	var pies: float = _piso_en(_capi.position.x, _capi.position.z)
	var alto: float = COPA_ALZADA_ESCALA * TROPHY_H

	var dest: Vector3 = Vector3(_capi.position.x + 0.1,
		pies + _capi.pixel_size * ALZA_MANOS_PX + alto * 0.5 - COPA_ALZADA_BAJA, _capi.position.z)
	_copa_arriba = dest
	var tw: Tween = create_tween()
	_alza_tw = tw
	tw.set_parallel(true)
	tw.set_trans(Tween.TRANS_BACK)
	tw.set_ease(Tween.EASE_OUT)
	tw.tween_property(_trophy, "position", dest, ALZA_DUR)
	tw.tween_property(_trophy, "scale", Vector3.ONE * COPA_ALZADA_ESCALA, ALZA_DUR)
	if _halo != null:

		tw.tween_property(_halo, "position", dest + Vector3(-0.25, 0.0, 0.0), ALZA_DUR)
	tw.tween_property(_lamp, "position", dest + Vector3(0.6, 0.9, 0.0), ALZA_DUR)
	tw.chain().tween_callback(_canones_dispara)



















const T_BAJA: float = 5.4
const BAJA_DUR: float = 0.25
const T_ANDA: float = 6.0
const ANDA_M: float = 0.9
const ANDA_MS: float = 0.7



var _copa_mano: bool = false
var _copa_arriba: Vector3 = Vector3.ZERO
var _alza_tw: Tween = null

var _copa_dibujo: Rect2 = Rect2()
var _copa_s: float = 0.0

var _capi_x0: float = 0.0
var _capi_y0: float = 0.0
var _capi_piso: float = 0.0

var _manos: Sprite3D = null


func _copa_tick(dt: float) -> void:
	if not _copa_mano or not _lifted or t < T_BAJA or _capi == null \
			or not is_instance_valid(_capi) or _trophy == null:
		return
	if _alza_tw != null and _alza_tw.is_valid() and _alza_tw.is_running():
		return
	if _copa_s <= 0.0:
		_copa_dibujo = CopaEnManos.mide(_trophy)
		_copa_s = CopaEnManos.escala(_capi, _trophy, _copa_dibujo)
		_capi_x0 = _capi.position.x
		_capi_piso = _piso_en(_capi.position.x, _capi.position.z)
		_capi_y0 = _capi.position.y - _capi_piso
		_manos = CopaEnManos.manos_monta(self, _capi)

	var hecho: float = clampf((t - T_ANDA) * ANDA_MS, 0.0, ANDA_M)
	var anda: bool = t >= T_ANDA and hecho < ANDA_M
	_capi.position.x = _capi_x0 + hecho


	_capi_piso = move_toward(_capi_piso, _piso_en(_capi.position.x, _capi.position.z),
		PASO_SUBIDA * dt)
	_capi.position.y = _capi_y0 + _capi_piso
	CopaEnManos.anima(self, _capi, Vector3.RIGHT if anda else Vector3.ZERO)
	var pos: Variant = CopaEnManos.donde(self, _capi, _trophy, _copa_dibujo, _copa_s)
	_trophy.visible = pos != null


	var k: float = clampf((t - T_BAJA) / BAJA_DUR, 0.0, 1.0)
	if k >= 1.0 and pos != null:
		CopaEnManos.manos(self, _capi, _manos)
	elif _manos != null:
		_manos.visible = false
	if pos == null:
		return
	var e: float = 1.0 - pow(1.0 - k, 2.0)
	var p: Vector3 = _copa_arriba.lerp(pos, e)
	_trophy.position = p
	_trophy.scale = Vector3.ONE * lerpf(COPA_ALZADA_ESCALA, _copa_s, e)
	if _halo != null:
		_halo.position = p + Vector3(-0.25, 0.0, 0.0)
	_lamp.position = p + Vector3(0.6, 0.9, 0.0)


















const CANONES: Array = [Vector2(-4.3, -2.5), Vector2(-4.3, 2.5),
	Vector2(-3.9, -3.7), Vector2(-3.9, 3.7)]



func _stage_de_hoy() -> Dictionary:
	var st: Dictionary = STAGE[_pomp()]
	if not _plantel_festeja():
		return st
	st = st.duplicate(true)
	var steps: Array = st["steps"]
	var n: int = steps.size()
	for i in n:
		var paso: Vector3 = steps[i]
		var min_xz: Vector2 = PINA_TARIMA + PINA_ESCALON * float(n - 1 - i)
		steps[i] = Vector3(maxf(paso.x, min_xz.x), paso.y, maxf(paso.z, min_xz.y))


	var base: Vector3 = steps[0]
	var alfombra: Vector2 = st["carpet"]
	st["carpet"] = Vector2(maxf(alfombra.x, base.x + 1.6), maxf(alfombra.y, base.z + 1.4))
	return st




func _canones_cfg() -> Dictionary:
	if not _plantel_festeja():
		return {}
	var comp: String = String(Ceremonies.trophy_cfg(
		String(data.get("award", "Campeón de Liga"))).get("comp", "liga"))
	if div() > 2 and (comp == "liga" or comp == "copa"):
		return {"cannons": false}
	var spots: Array = []
	for c in CANONES:
		var at: Vector2 = c
		spots.append(Vector3(at.x, _tarima_en(at.x, CENTER_Z + at.y), CENTER_Z + at.y))
	return {"cannons": true, "cannons_manual": true, "cannon_spots": spots,
		"cannon_aim": Vector3(0.0, 0.0, CENTER_Z)}


func _canones_dispara() -> void:
	if stadium == null or not is_instance_valid(stadium) or not stadium.cannons_manual:
		return
	stadium.cannons_fire()
	if stadium.confetti_cannons_n() > 0:


		shake(0.04, 0.35)




const HALO_A1: float = 0.26
const HALO_R: float = 1.15
var _halo_mat: StandardMaterial3D = null

var _halo: MeshInstance3D = null

var _trophy: Sprite3D
var _lamp: OmniLight3D
var _beams: Array[MeshInstance3D] = []



var _pillars: Array[MeshInstance3D] = []









const WALK_FROM: float = 3.2
const WALK_MARGIN: float = 0.35
const WALK_DUR: float = 2.0

const PASO_SUBIDA: float = 0.9

var _walks: bool = false

var _walk_a: Vector3 = Vector3.ZERO
var _walk_b: Vector3 = Vector3.ZERO


var _piso_pie: float = 0.0


func _walk_in(dt: float) -> void:
	if not _walks:
		return
	var t0: float = maxf(T_LIFT - WALK_MARGIN - WALK_DUR, 0.0)
	var k: float = clampf((t - t0) / WALK_DUR, 0.0, 1.0)




	if k >= 1.0 and _lifted:
		return
	var e: float = 1.0 - pow(1.0 - k, 2.4)
	var p: Vector3 = _walk_b.lerp(_walk_a, 1.0 - e)
	player.position.x = p.x
	player.position.z = p.z







	_piso_pie = move_toward(_piso_pie,
		_piso_en(player.position.x, player.position.z), PASO_SUBIDA * dt)
	player.position.y = _pie_base + _piso_pie








	walk_play(player,(_walk_b - _walk_a).normalized() if (k > 0.0 and k < 1.0) \
			else Vector3.ZERO)


func _tick(_delta: float) -> void:
	_walk_in(_delta)
	if not _lifted and t >= T_LIFT:
		_lift()
	_festeja_tick()
	_copa_tick(_delta)
	if _lifted and not ficha_puesta and t >= _next_react:
		_next_react = t + REACT_EVERY
		stadium.crowd_react("home", "goal")


		ovation(-3.0)


func _skipped() -> void:
	if not _lifted:
		_lift()




func _plantel_festeja() -> bool:
	return plantel_festeja()




func _festeja_tick() -> void:
	for f in _festejan:
		var d: float = float(f["desde"])
		var spr: AnimatedSprite3D = SceneFade.vivo(f["spr"]) as AnimatedSprite3D
		if d < 0.0 or t < d or not is_instance_valid(spr):
			continue
		if spr.animation != StringName(String(f["anim"])):
			festejo_play(spr, String(f["anim"]))




func _lift() -> void:
	_lifted = true
	_next_react = t + REACT_EVERY


	for f in _festejan:
		if float(f["desde"]) < 0.0:
			f["desde"] = t + float(f["ola"]) + rng.randf_range(0.0, 0.08)
	if _pina:
		_alza_copa()
	set_confetti(true)
	stadium.crowd_react("home", "goal")
	stadium.pulse_ads(4.0)
	ovation(2.0)
	applause(true)
	_lift_sting()




	shake(0.06, 1.2)











func _lift_sting() -> void:
	sting("fanfare", -4.0)
	punch_fov(3.5, 0.55)
	var tw: Tween = create_tween()
	tw.set_parallel(true)












	tw.tween_property(_trophy, "modulate", Color.WHITE, 0.5)
	if _halo_mat != null:
		tw.tween_property(_halo_mat, "albedo_color:a", HALO_A1, 0.6)
	tw.tween_property(_lamp, "light_energy", float(_stage["lamp"]), 0.5)
	for beam in _beams:
		tw.tween_property(beam.material_override as StandardMaterial3D,
			"albedo_color:a", 0.05, 0.7)
	for pillar in _pillars:
		tw.tween_property(pillar.material_override as StandardMaterial3D,
			"albedo_color:a", PILLAR_A1, 0.9)




func _comp_label() -> String:
	var comp: String = String(_cfg.get("comp", "liga"))
	if comp == "liga":


		var liga: String = Competitions.league_div_name(
			Teams.country_of(String(_stage_team().get("id", club_del_acto()))), div())
		return I18n.tf("CAMPEÓN DE {0}", [I18n.t(liga)])


	return I18n.tf("CAMPEÓN · {0}", [I18n.t(Competitions.comp_name(comp))])
