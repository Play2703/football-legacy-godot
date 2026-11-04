extends Ceremony
































const T_PITIDO: float = 0.6
const T_CORTE: float = 4.4

const T_MOMENTO: float = 5.6
const T_CARD: float = 7.6
const VELO_S: float = 0.35


const KEYS_CANCHA: Array = [
	{"t": 0.0, "dist": 9.0, "h": 2.6, "yaw": 160.0, "aim_y": 1.2, "fov": 38.0},
	{"t": T_CORTE - 0.01, "dist": 6.2, "h": 1.9, "yaw": 176.0, "aim_y": 1.15, "fov": 36.0},
]



const MATES: Array[Vector2] = [
	Vector2(-2.4, -1.6), Vector2(2.2, -1.2), Vector2(-1.1, -3.4), Vector2(1.3, -3.8),
	Vector2(-3.6, -4.6), Vector2(3.4, -4.2),
]
const MATE_CARAS: int = 4
const LOST_CUADROS: int = 5
const LOST_FPS: float = 12.0


const SALA_FOCO: Vector2 = Vector2(2.3, -0.6)


const SALA_DIST: float = 6.0


const SALA_FOV: float = 62.0
const SALA_H: float = 2.45
const SALA_YAW: float = 128.0












const FAMILIA: Array = [
	[1.45, -1.6, 1.0], [1.45, -1.15, 0.66], [1.45, -0.75, 0.66], [1.45, -0.3, 1.0],
	[1.45, 0.2, 0.98], [2.5, -2.3, 1.0], [2.5, 0.45, 1.0],
]

const DE_PIE: Array[int] = [5, 6]
const SENTADO: float = 0.12
const TV_Y: float = 1.3
const TV_PANTALLA: Vector2 = Vector2(1.98, 1.08)
const PLACA: Color = Color(0.05, 0.08, 0.16)

var _ok: bool = false
var _kit: Dictionary = {}
var _pitado: bool = false
var _cortado: bool = false
var _momento: bool = false
var _mates: Array[AnimatedSprite3D] = []
var _gestos: Array[String] = []
var _hay_lost: bool = false
var _sala: DecisionRoom
var _familia: Array[AnimatedSprite3D] = []
var _familia_y: Array[float] = []
var _luz_tele: OmniLight3D
var _luz_tele_e: float = 0.0
var _fiesta: Array[OmniLight3D] = []
var _bandera_mano: MeshInstance3D

var _en_pantalla: Array = []
var _perro: AnimatedSprite3D

var _clase: String = "media"
var _gato: AnimatedSprite3D
var _tele: Array[Node3D] = []

var _tv_confeti: Array = []

var _salida_desde: Array = []

var _perro_desde: Vector3 = Vector3.INF
var _gato_desde: Vector3 = Vector3.INF
var _negro: MeshInstance3D
var _raya: MeshInstance3D
var _velo: ColorRect
var _centro: Vector3
var _hacia: Vector3
var _derecha: Vector3



static func es_ok(kind: String) -> bool:
	return kind == Ceremonies.NAT_QUAL_OK


func _accent_for() -> Color:
	if not es_ok(String(data.get("kind", ""))):
		return CareerTheme.DANGER
	return CareerTheme.accent_of(team())


func _build() -> void:
	_ok = es_ok(String(data.get("kind", "")))
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": 1,
		"attendance": 0.9,
		"party": _ok,


		"weather": "" if _ok else "rain",
		"kit": kit,
		"banner": "",
		"board": "FINAL",
	})
	_kit = kit
	_build_cancha(kit)
	_build_sala()
	var foco: Vector3 = _sala.cone(SALA_FOCO.x, SALA_FOCO.y)
	var keys: Array = KEYS_CANCHA.duplicate(true)
	keys.append({"t": T_CORTE + 0.01, "dist": SALA_DIST, "h": SALA_H, "yaw": SALA_YAW,
		"aim_y": 0.98, "fov": SALA_FOV, "focus_x": foco.x, "focus_z": foco.z})

	keys.append({"t": T_CARD, "dist": SALA_DIST - 0.25, "h": SALA_H - 0.05,
		"yaw": SALA_YAW + 4.0, "aim_y": 1.0, "fov": SALA_FOV,
		"focus_x": foco.x, "focus_z": foco.z})
	make_camera(keys)
	orbit_speed = 0.0
	make_audio(0.9, _ok)
	_build_velo()

	var torneo: String = I18n.t(String(data.get("torneo", "MUNDIAL")))
	make_chyron(I18n.t("CLASIFICADOS") if _ok else I18n.t("ELIMINADOS"),
		torneo.to_upper(), team(), 1.4)
	make_card(T_CARD)
	card_title(team_name("?").to_upper(), 40)
	card_sub(I18n.tf("AL {0}", [torneo.to_upper()]) if _ok
		else I18n.tf("SIN {0}", [torneo.to_upper()]), text_accent())
	card_stats([
		{"v": "%d - %d" % [int(data.get("team_goals", 0)), int(data.get("rival_goals", 0))],
			"k": I18n.t("FINAL")},
		{"v": "%dº" % int(data.get("pos", 0)), "k": I18n.t("GRUPO")},
	])
	card_note(I18n.t("Un país entero lo celebra contigo." if _ok
		else "Un país entero apagó la tele."))
	card_cta(I18n.t("SEGUIR"))




func _build_cancha(kit: Dictionary) -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)
	look["number"] = dorsal_vivido()
	make_player(look)
	var pool: Array[SpriteFrames] = extras_frames_pool(kit, MATE_CARAS,
		"seleccion_" + String(data.get("nation", Career.nationality)))
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	for i in MATES.size():
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = pool[i % pool.size()]
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = Vector3(MATES[i].x, y, CENTER_Z + MATES[i].y)
		viewport.add_child(s)
		s.play("idle")
		s.speed_scale = rng.randf_range(0.7, 1.2)
		_mates.append(s)
	if _ok:

		for i in pool.size():
			_gestos.append(festejo_hornea(pool[i], i) if plantel_festeja() else "")
		_gestos.append(festejo_hornea(player.sprite_frames, 1) if plantel_festeja() else "")
	else:
		_hay_lost = add_gesto(player, "lost", LOST_CUADROS, LOST_FPS)
		for s in _mates:
			add_gesto(s, "lost", LOST_CUADROS, LOST_FPS)




func _pitido(vivo: bool) -> void:
	_pitado = true
	if vivo:
		sting("whistle_long", -6.0)
	if _ok:
		stadium.crowd_react("home", "goal")
		set_confetti(true)
		for i in _mates.size():
			festejo_play(_mates[i], _gestos[i % maxi(_gestos.size() - 1, 1)])
		festejo_play(player, _gestos.back() if not _gestos.is_empty() else "")
	else:
		stadium.crowd_react("away", "whistle")
		if not _hay_lost:
			return


		var hacia_cam: Vector3 = Vector3(0.0, 0.0, -1.0)
		gesto_play(player, "lost", hacia_cam)
		for s in _mates:
			gesto_play(s, "lost", hacia_cam)




func _build_velo() -> void:
	_velo = ColorRect.new()
	_velo.color = Color(0, 0, 0, 0)
	_velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	viewport_box.add_child(_velo)




func _corta() -> void:
	_cortado = true
	var tw: Tween = create_tween()
	_velo.color.a = 1.0
	tw.tween_property(_velo, "color:a", 0.0, VELO_S)
	set_confetti(false)
	stadium.visible = false
	for n in stadium.find_children("*", "WorldEnvironment", true, false):
		n.queue_free()
	for s in _mates:
		s.visible = false
	player.visible = false
	_sala.visible = true
	for n in _tele:
		n.visible = true




func _build_sala() -> void:
	_sala = DecisionRoom.new()
	_sala.kind = DecisionRoom.CASA
	_sala.div = 2
	_sala.club_color = accent
	_sala.crest = crest_texture(team())
	viewport.add_child(_sala)
	_sala.visible = false
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = _sala.cone(-1.4, 0.0) + Vector3(0, 2.2, 0)


	luz.omni_range = 12.0
	luz.light_energy = 7.0
	luz.light_color = Color("ffc98c")
	_sala.add_child(luz)
	var dorsales: Array = _dorsales()
	for i in FAMILIA.size():
		var m: Array = FAMILIA[i]




		var cfg: Dictionary = KitRecolor.appearance_for("familia_%s_%s_%d_%d"
			% [String(data.get("nation", "")), String(data.get("clase", "")), _semilla_familia, i], _kit)
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = player_frames(cfg, "north")
		s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x * float(m[2])
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		var at: Vector3 = _sala.cone(float(m[0]), float(m[1]))
		var yy: float = feet_offset(s.pixel_size) -(0.0 if i in DE_PIE else SENTADO)
		s.position = Vector3(at.x, yy, at.z)
		_sala.add_child(s)
		s.play("idle")
		s.speed_scale = rng.randf_range(0.7, 1.1)




		if i < dorsales.size():
			cfg["number"] = int(dorsales[i][0])
			cfg["apellido"] = String(dorsales[i][1])
			espalda_registra(s, "idle", player_prefix("north"), 0)
			espalda_vestir(s, cfg)


		add_gesto(s, "lost", 5, 9.0, cfg)
		add_gesto(s, "clap", 4, 10.0, cfg)


		if not _ok:
			add_walk(s, cfg, 1, true)
		_familia.append(s)
		_familia_y.append(yy)
	_build_tele()
	_build_decoracion()
	_build_fiesta_casa()
	_build_mascotas()
	_build_vida()








func _dorsales() -> Array:
	var out: Array = []
	var usados: Dictionary = {}
	var mio: int = dorsal_vivido()
	if mio > 0 and not Career.nombre_espalda().strip_edges().is_empty():
		out.append([mio, Career.nombre_espalda()])
		usados[mio] = true
	var filas: Array = []
	var pais: String = String(data.get("nation", Career.nationality))


	var mia: bool = Nations.canon_id(pais) == Nations.canon_id(Career.nationality)
	for r in (Career.nat_squad_list() if mia else []):
		var f: Dictionary = r
		if bool(f.get("is_you", false)):
			continue
		filas.append([String(f.get("pos", "")), int(f.get("number", 0)), String(f.get("name", ""))])
	if filas.is_empty():
		for r in NatReales.squad_of(pais):
			var f: Dictionary = r
			filas.append([String(f.get("p", "")), int(f.get("d", 0)), String(f.get("n", ""))])
	var peso: Dictionary = {"FW": 0, "DEL": 0, "MF": 1, "MED": 1, "DF": 2, "DEF": 2}
	filas.sort_custom(func(a: Array, b: Array) -> bool:
		return int(peso.get(a[0], 3)) < int(peso.get(b[0], 3)))
	for f in filas:
		var num: int = int(f[1])
		if num <= 0 or usados.has(num) or String(f[2]).is_empty():
			continue
		usados[num] = true
		out.append([num, Career.espalda_de(String(f[2]))])
		if out.size() >= FAMILIA.size():
			break
	return out





func _build_vida() -> void:
	for l in _sala.find_children("*", "OmniLight3D", true, false):
		if (l as OmniLight3D).light_color == DecisionRoom.CASA_TV_LIGHT:
			_luz_tele = l
			_luz_tele_e = _luz_tele.light_energy
	var cols: Array[Color] = [Color(_kit.get("kit", accent)), Color(_kit.get("kit2", Color.WHITE))]
	for k in 2:
		var o: OmniLight3D = OmniLight3D.new()
		o.light_color = cols[k]
		o.omni_range = 5.5
		o.light_energy = 0.0
		o.position = _sala.cone(1.9, -2.2 + 2.6 * float(k)) + Vector3(0, 2.3, 0)
		_sala.add_child(o)
		_fiesta.append(o)
	var pie: AnimatedSprite3D = _familia[DE_PIE[0]] if _familia.size() > DE_PIE[0] else null
	if pie != null:
		_bandera_mano = _quad(Vector2(0.55, 0.36), pie.position + Vector3(0, 0.95, 0),
			_sala.face(), cols[0])
		var franja: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()
		q.size = Vector2(0.55, 0.12)
		franja.mesh = q
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.albedo_color = cols[1]
		franja.material_override = mat
		franja.position = Vector3(0, 0, 0.005)
		_bandera_mano.add_child(franja)
		_bandera_mano.visible = _ok








func _build_fiesta_casa() -> void:
	_clase = String(data.get("clase", ""))
	if not CLASES.has(_clase):
		_clase = CLASES.keys()[rng.randi() % CLASES.size()]
	var pal: Dictionary = CLASES[_clase]
	_viste_casa(pal)
	for we in _sala.find_children("*", "WorldEnvironment", true, false):
		var env: Environment =(we as WorldEnvironment).environment
		env.background_color = Color("3a2e26")
		env.ambient_light_color = pal["ambiente"]
		env.ambient_light_energy = float(pal["ambiente_e"])
	var techo: OmniLight3D = OmniLight3D.new()
	techo.position = _sala.cone(1.6, -0.6) + Vector3(0, DecisionRoom.CASA_H - 0.3, 0)
	techo.omni_range = 10.0
	techo.light_energy = 3.0
	techo.light_color = pal["techo"]
	_sala.add_child(techo)
	var c1: Color = Color(_kit.get("kit", accent))
	var c2: Color = Color(_kit.get("kit2", Color.WHITE))
	var giro: float = _sala.face()



	for k in 4:
		_caja(Vector3(0.36, 0.34, 0.12), _sala.cone(0.85, -1.4 + 0.62 * float(k)) + Vector3(0, 0.6, 0),
			giro +(8.0 if k % 2 == 0 else -6.0),(pal["cojin"] as Array)[k % 2])
	match _clase:
		"baja":
			_casa_baja(giro, c1, c2)
		"alta":
			_casa_alta(giro, c1, c2)
		_:
			_casa_media(giro, c1, c2)

	for k in 5:
		_caja(Vector3(0.5, 0.012, 2.2), _sala.cone(2.6, -1.5 + 0.5 * float(k)) + Vector3(0, 0.02, 0),
			giro,(c1 if k % 2 == 0 else c2).darkened(0.1))

	var mesa: Vector3 = _sala.cone(2.6, -0.5) + Vector3(0, 0.43, 0)
	_caja(Vector3(0.42, 0.015, 0.42), mesa + _sala.cone(0.0, -0.35), giro + 20.0, Color("d9a35a"))
	for k in 3:
		var cu: Vector3 = mesa + _sala.cone(0.1 * float(k - 1), 0.15 + 0.2 * float(k))
		_bola(0.09, cu, Color("f2f2f2"))
		_bola(0.07, cu + Vector3(0, 0.05, 0), [Color("e8b04b"), Color("c4562a"), Color("f0d27a")][k])
	for k in 5:
		_caja(Vector3(0.06, 0.12, 0.06), mesa + _sala.cone(-0.2 + 0.1 * float(k % 3), -0.1 + 0.12 * float(k)) + Vector3(0, 0.06, 0),
			0.0, [c1, c2, Color("c0c4c8"), c1, Color("2f8a3e")][k])


	var suelo: Vector3 = _sala.cone(0.0, -0.5)
	_caja(Vector3(0.55, 0.4, 0.38), suelo + _sala.cone(-0.1, 0.9) + Vector3(0, 0.2, 0), giro + 12.0, c2)
	_caja(Vector3(0.57, 0.06, 0.4), suelo + _sala.cone(-0.1, 0.9) + Vector3(0, 0.42, 0), giro + 12.0, c1)
	_caja(Vector3(0.45, 0.05, 0.45), suelo + _sala.cone(-0.2, -0.6) + Vector3(0, 0.03, 0), giro - 15.0, Color("e8dcc4"))
	for k in 4:
		var lata: MeshInstance3D = _caja(Vector3(0.07, 0.12, 0.07),
			suelo + _sala.cone(-0.4 + 0.2 * float(k), -1.6 + 0.5 * float(k)) + Vector3(0, 0.04, 0), 0.0,
			[c1, c2, Color("c0c4c8"), c1][k])
		lata.rotation_degrees.z = 90.0 if k % 2 == 0 else 0.0
	for k in 6:
		_bola(0.16, suelo + _sala.cone(-0.5 + 0.25 * float(k % 3), -2.0 + 0.75 * float(k)) + Vector3(0, 0.16, 0),
			c1 if k % 2 == 0 else c2, true)

	for g in [[3.0, -2.6], [3.0, 0.75], [1.2, 1.6]]:
		for k in 5:
			var b: Vector3 = _sala.cone(float(g[0]), float(g[1])) \
					+ Vector3(0.18 * cos(k * 1.3), 1.85 + 0.2 * float(k % 3), 0.18 * sin(k * 1.3))
			_bola(0.16, b, c1 if k % 2 == 0 else c2, true)

	for k in 14:
		var u: float = float(k) / 13.0
		var at: Vector3 = _sala.cone(3.25, -3.0 + 4.6 * u) \
				+ Vector3(0, DecisionRoom.CASA_H - 0.12 - 0.18 * sin(u * PI), 0)
		_bola(0.035, at, [Color("ffd27a"), c1, Color("ffd27a"), c2][k % 4], true, 3.0)

	if _clase == "baja":
		return
	var maceta: Vector3 = _sala.cone(3.1, 1.9)
	_caja(Vector3(0.3, 0.35, 0.3), maceta + Vector3(0, 0.18, 0), giro, Color("8a5a3a"))
	for k in 4:
		_bola(0.22, maceta + Vector3(0.1 * cos(k * 1.7), 0.55 + 0.18 * float(k), 0.1 * sin(k * 1.7)),
			Color("3f7a3a").lightened(0.08 * float(k)))
	var repisa: Vector3 = _sala.cone(3.35, -2.7) + Vector3(0, 1.05, 0)
	_caja(Vector3(0.9, 0.04, 0.22), repisa, giro, C_REPISA)
	_bola(0.11, repisa + Vector3(0, 0.13, 0) + _sala.cone(0, -0.22), Color.WHITE)
	_caja(Vector3(0.12, 0.26, 0.08), repisa + Vector3(0, 0.15, 0) + _sala.cone(0, 0.2), giro, Color("e0b03c"))











const PERRO_ALTO: float = 0.5
const GATO_ALTO: float = 0.3
const GATO_Y: float = 1.125


func _build_mascotas() -> void:
	_perro = _mascota("pet_", ["idle_south", "walk_east", "bark_south"], PERRO_ALTO)
	_perro.position = _sala.cone(0.15, -1.9) + Vector3(0, _perro.get_meta("pie"), 0)
	_perro.play("walk_east")
	_gato = _mascota("gato_", ["sit_south", "yawn_south", "idle_south", "walk_east"], GATO_ALTO)
	_gato.position = _sala.cone(1.15, 0.95) + Vector3(0, GATO_Y + float(_gato.get_meta("pie")), 0)
	_gato.play("walk_east")


func _mascota(pre: String, anims: Array, alto: float) -> AnimatedSprite3D:
	var sf: SpriteFrames = SpriteFrames.new()
	sf.remove_animation("default")
	var lado: int = 48
	var caja: Rect2i = Rect2i()
	for a in anims:
		sf.add_animation(a)
		sf.set_animation_speed(a, 8.0)
		sf.set_animation_loop(a, true)
		for k in range(1, 30):
			var ruta: String = "res://assets/sprites/anim/%s%s_%02d.png" % [pre, a, k]
			if not ResourceLoader.exists(ruta):
				break
			var tx: Texture2D = load(ruta)
			lado = tx.get_height()
			if caja.size.y == 0:

				caja = SceneFade.caja_usada(tx)
			sf.add_frame(a, tx)
	var m: AnimatedSprite3D = AnimatedSprite3D.new()
	m.sprite_frames = sf


	var cuerpo: int = maxi(caja.size.y, 1)
	m.pixel_size = alto / float(cuerpo)
	m.set_meta("pie", m.pixel_size *(float(lado) / 2.0 - float(lado - caja.end.y)))
	m.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	m.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_sala.add_child(m)
	return m






const CLASES: Dictionary = {
	"baja": {"pared": Color("5f8a86"), "zocalo": Color("46625e"), "suelo": Color("7a756c"),
		"sofa": Color("7a5a40"), "cojin": [Color("b08a5a"), Color("8a6a4a")],
		"ambiente": Color("a8a48c"), "ambiente_e": 2.3, "techo": Color("fff6d0")},
	"media": {"pared": Color("a8714a"), "zocalo": Color("7a5236"), "suelo": Color("6b4a32"),
		"sofa": Color("5a6a80"), "cojin": [Color("d8cbb0"), Color("8a9aae")],
		"ambiente": Color("b89a7c"), "ambiente_e": 2.6, "techo": Color("fff0d8")},
	"alta": {"pared": Color("3e2a1e"), "zocalo": Color("3a281c"), "suelo": Color("d6cfc2"),
		"sofa": Color("e6dac4"), "cojin": [Color("b8955a"), Color("2e2a28")],
		"ambiente": Color("c8aa86"), "ambiente_e": 2.8, "techo": Color("ffe6bf")},
}




func _viste_casa(pal: Dictionary) -> void:
	var sofa: Color = Color("4b5260")
	var mapa: Array = [
		[DecisionRoom.C_WALL, pal["pared"]], [DecisionRoom.C_WALL_LOW, pal["zocalo"]],
		[Color("4a3b2e"), pal["suelo"]], [sofa, pal["sofa"]],
		[sofa.darkened(0.12),(pal["sofa"] as Color).darkened(0.12)],
		[sofa.darkened(0.2),(pal["sofa"] as Color).darkened(0.2)],
	]







	var copias: Dictionary = {}
	for n in _sala.find_children("*", "MeshInstance3D", true, false):
		var mi: MeshInstance3D = n
		var mat: StandardMaterial3D = mi.material_override as StandardMaterial3D
		if mat == null and mi.mesh != null and mi.mesh.get_surface_count() > 0:
			mat = mi.mesh.surface_get_material(0) as StandardMaterial3D
		if mat == null:
			continue
		for par in mapa:
			if mat.albedo_color.is_equal_approx(par[0]):
				var firma: String = _firma_material(mat) + "|" + var_to_str(par[1])
				var m2: StandardMaterial3D = copias.get(firma)
				if m2 == null:
					m2 = mat.duplicate()
					m2.albedo_color = par[1]
					copias[firma] = m2
				mi.material_override = m2
				break






static func _firma_material(mat: Material) -> String:
	var partes: PackedStringArray = []
	for p in mat.get_property_list():
		if not (int(p["usage"])&PROPERTY_USAGE_STORAGE):
			continue
		var nombre: String = String(p["name"])
		if nombre == "resource_name" or nombre == "resource_path" or nombre == "script":
			continue
		var v: Variant = mat.get(nombre)
		partes.append(nombre + "=" +(str((v as Object).get_instance_id()) if v is Object
			else var_to_str(v)))
	return ";".join(partes)




func _casa_baja(giro: float, c1: Color, c2: Color) -> void:
	var foco: Vector3 = _sala.cone(1.8, -0.6) + Vector3(0, DecisionRoom.CASA_H, 0)
	_caja(Vector3(0.01, 0.55, 0.01), foco - Vector3(0, 0.28, 0), giro, Color("222222"))
	_bola(0.07, foco - Vector3(0, 0.6, 0), Color("fff2b0"), true, 4.0)
	var vent: Vector3 = _sala.cone(2.9, 1.7)
	_caja(Vector3(0.03, 1.2, 0.03), vent + Vector3(0, 0.6, 0), giro, Color("dadada"))
	_caja(Vector3(0.3, 0.03, 0.3), vent + Vector3(0, 0.02, 0), giro, Color("dadada"))
	_bola(0.2, vent + Vector3(0, 1.25, 0), Color("cfe0ea"))
	for r in [-2.6, 1.15]:
		var at: Vector3 = _sala.cone(2.4, r)
		_caja(Vector3(0.42, 0.04, 0.42), at + Vector3(0, 0.44, 0), giro, Color("f2f2ee"))
		_caja(Vector3(0.42, 0.42, 0.04), at + Vector3(0, 0.66, 0) + _sala.cone(-0.2, 0), giro, Color("f2f2ee"))
	_quad(Vector2(0.32, 0.42), _sala.cone(3.6, 1.2) + Vector3(0, 1.55, 0), giro, Color("f4f0e6"))
	_quad(Vector2(0.32, 0.1), _sala.cone(3.59, 1.2) + Vector3(0, 1.72, 0), giro, CareerTheme.DANGER)
	_quad(Vector2(0.5, 0.34), _sala.cone(3.6, -2.2) + Vector3(0, 1.85, 0), giro + 4.0, c1)
	_quad(Vector2(0.5, 0.11), _sala.cone(3.59, -2.2) + Vector3(0, 1.85, 0), giro + 4.0, c2)



	var ven: Vector3 = _sala.cone(3.6, 1.4) + Vector3(0, 2.05, 0)
	_quad(Vector2(0.6, 0.45), ven, giro, Color("1c2a3a"))
	for k in 5:
		_quad(Vector2(0.025, 0.45), ven + _sala.cone(-0.01, -0.24 + 0.12 * float(k)), giro, Color("3a3a3a"))
	_quad(Vector2(0.55, 0.3), _sala.cone(3.6, -1.3) + Vector3(0, 0.55, 0), giro + 7.0, Color("8c8a80"))
	_quad(Vector2(0.3, 0.18), _sala.cone(3.6, 0.6) + Vector3(0, 2.25, 0), giro - 5.0, Color("8c8a80"))

	var tend: Vector3 = _sala.cone(2.6, 0.7) + Vector3(0, 2.3, 0)
	_caja(Vector3(1.5, 0.008, 0.008), tend, giro, Color("dddddd"))
	for k in 4:
		_quad(Vector2(0.2, 0.26), tend + _sala.cone(0, -0.55 + 0.37 * float(k)) - Vector3(0, 0.14, 0), giro,
			[Color("c8c2b0"), c1, Color("6a7f9a"), Color("b04a3a")][k])
	var refri: Vector3 = _sala.cone(3.15, 2.2)
	_caja(Vector3(0.6, 1.5, 0.6), refri + Vector3(0, 0.75, 0), giro, Color("e8e4d8"))
	_caja(Vector3(0.03, 0.3, 0.03), refri + Vector3(0, 1.0, 0) + _sala.cone(-0.32, -0.2), giro, Color("888888"))
	_quad(Vector2(0.7, 2.0), _sala.cone(3.58, -2.75) + Vector3(0, 1.0, 0), giro, Color("8a5a8a"))
	_caja(Vector3(0.06, 0.12, 0.06), _sala.cone(3.35, -0.95) + Vector3(0, 1.72, 0), giro, Color("bbbbbb"))




func _casa_media(giro: float, c1: Color, _c2: Color) -> void:
	var ven: Vector3 = _sala.cone(3.6, 1.45) + Vector3(0, 1.75, 0)
	_quad(Vector2(0.8, 0.7), ven, giro, Color("1a2440"))
	for k in 3:
		_bola(0.03, ven + _sala.cone(-0.01, -0.3 + 0.3 * float(k)) - Vector3(0, 0.2 - 0.1 * float(k), 0),
			Color("ffd890"), true, 0.4)
	for r in [-0.6, 0.6]:
		_quad(Vector2(0.28, 0.95), ven + _sala.cone(-0.02, r * 0.85), giro, Color("c9b48a"))
	var lib: Vector3 = _sala.cone(3.3, -2.45)
	_caja(Vector3(0.8, 1.7, 0.3), lib + Vector3(0, 0.85, 0), giro, Color("5a3a26"))
	var col_lib: Array = [Color("a83a3a"), Color("3a6aa8"), Color("e0c060"), Color("3a8a5a"), c1]
	for fila in 3:
		for k in 5:
			_caja(Vector3(0.1, 0.26, 0.2), lib + Vector3(0, 0.35 + 0.5 * float(fila), 0)
				+ _sala.cone(-0.06, -0.3 + 0.14 * float(k)), giro, col_lib[(k + fila) % 5])
	var reloj: Vector3 = _sala.cone(3.6, 0.75) + Vector3(0, 2.2, 0)
	_quad(Vector2(0.3, 0.3), reloj, giro, Color("f4f0e6"))
	_quad(Vector2(0.02, 0.12), reloj + _sala.cone(-0.01, 0) + Vector3(0, 0.04, 0), giro, Color("222222"))
	var foto: Vector3 = _sala.cone(3.6, DecisionRoom.CASA_TV_R) + Vector3(0, 2.3, 0)
	_quad(Vector2(0.5, 0.32), foto, giro, Color("8a6a3a"))
	_quad(Vector2(0.42, 0.25), foto + _sala.cone(-0.01, 0), giro, Color("d8b890"))





func _casa_alta(giro: float, c1: Color, _c2: Color) -> void:
	for k in 6:
		_quad(Vector2(0.06, 1.5), _sala.cone(3.58, -3.0 + 1.2 * float(k)) + Vector3(0, 1.85, 0), giro,
			Color("3e2a1e"))
	var tira: MeshInstance3D = _quad(Vector2(7.0, 0.04), _sala.cone(3.55, -0.6)
		+ Vector3(0, DecisionRoom.CASA_H - 0.06, 0), giro, Color("ffd9a0"))
	(tira.material_override as StandardMaterial3D).albedo_color = Color("ffe2b0")
	var tv: Vector3 = _sala.cone(DecisionRoom.CASA_TV_F - 0.02, DecisionRoom.CASA_TV_R)
	_quad(Vector2(2.7, 1.6), tv + Vector3(0, TV_Y, 0), giro, Color("101010"))
	var arana: Vector3 = _sala.cone(1.7, -0.6) + Vector3(0, DecisionRoom.CASA_H - 0.35, 0)
	_caja(Vector3(0.015, 0.3, 0.015), arana + Vector3(0, 0.18, 0), giro, Color("c9a24a"))
	for k in 8:
		var a: float = TAU * float(k) / 8.0
		_bola(0.045, arana + Vector3(0.28 * cos(a), -0.05 * float(k % 2), 0.28 * sin(a)),
			Color("fff1cc"), true, 2.5)
	_bola(0.08, arana, Color("e8c66a"), true, 1.0)
	for r in [-2.4, 2.4]:
		var at: Vector3 = _sala.cone(3.57, r) + Vector3(0, 1.6, 0)
		_quad(Vector2(0.62, 0.8), at, giro, Color("c9a24a"))
		_quad(Vector2(0.52, 0.7), at + _sala.cone(-0.01, 0), giro,
			[Color("3b5f7a"), Color("8a4a3a")][int(r > 0.0)])
	var bar: Vector3 = _sala.cone(2.2, 2.0)
	_caja(Vector3(0.6, 0.04, 0.4), bar + Vector3(0, 0.75, 0), giro, Color("c9a24a"))
	_caja(Vector3(0.6, 0.04, 0.4), bar + Vector3(0, 0.35, 0), giro, Color("c9a24a"))
	for k in 4:
		_caja(Vector3(0.07, 0.28, 0.07), bar + Vector3(0, 0.91, 0) + _sala.cone(0, -0.21 + 0.14 * float(k)),
			giro, [Color("3a6b3a"), Color("6b2a2a"), Color("d8c08a"), Color("2a3a5a")][k])
	var vitrina: Vector3 = _sala.cone(3.3, -3.05)
	_caja(Vector3(0.7, 1.9, 0.35), vitrina + Vector3(0, 0.95, 0), giro, Color("2a1d14"))
	for k in 3:
		_caja(Vector3(0.12, 0.24, 0.08), vitrina + Vector3(0, 0.6 + 0.5 * float(k), 0) + _sala.cone(-0.2, 0),
			giro, Color("e0b03c"))
	_caja(Vector3(0.2, 0.2, 0.02), vitrina + Vector3(0, 1.75, 0) + _sala.cone(-0.2, 0), giro, c1)


	var ven: Vector3 = _sala.cone(3.6, 1.75) + Vector3(0, 1.3, 0)
	_quad(Vector2(0.75, 2.3), ven, giro, Color("0e1630"))
	var rr: RandomNumberGenerator = RandomNumberGenerator.new()
	rr.seed = 7
	for k in 14:
		_bola(0.025, ven + _sala.cone(-0.01, rr.randf_range(-0.33, 0.33)) + Vector3(0, rr.randf_range(-0.9, 0.2), 0),
			[Color("ffd890"), Color("bfe0ff"), Color("ffffff")][k % 3], true, 0.3)
	_quad(Vector2(0.04, 2.3), ven, giro, Color("c9a24a"))
	var chim: Vector3 = _sala.cone(3.4, 0.95)
	_caja(Vector3(0.8, 0.95, 0.35), chim + Vector3(0, 0.48, 0), giro, Color("d8d2c4"))
	_caja(Vector3(0.45, 0.45, 0.02), chim + Vector3(0, 0.38, 0) + _sala.cone(-0.18, 0), giro, Color("1a1210"))
	_bola(0.14, chim + Vector3(0, 0.3, 0) + _sala.cone(-0.12, 0), Color("ff8a2a"), true, 3.0)
	var fuego: OmniLight3D = OmniLight3D.new()
	fuego.light_color = Color("ff9a40")
	fuego.light_energy = 1.4
	fuego.omni_range = 3.0
	fuego.position = chim + Vector3(0, 0.4, 0) + _sala.cone(-0.5, 0)
	_sala.add_child(fuego)
	_caja(Vector3(1.4, 0.08, 0.1), tv + Vector3(0, TV_Y - 0.88, 0) + _sala.cone(-0.12, 0), giro, Color("151515"))
	_caja(Vector3(4.6, 0.004, 2.6), _sala.cone(1.6, -0.6) + Vector3(0, 0.002, 0), giro, Color("cfc4b0"))


const C_REPISA: Color = Color("6b4a32")


func _caja(size: Vector3, at: Vector3, giro: float, col: Color) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	mi.mesh = b
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.9
	mi.material_override = mat
	mi.position = at
	mi.rotation_degrees.y = giro
	_sala.add_child(mi)
	return mi


func _bola(r: float, at: Vector3, col: Color, brilla: bool = false, energia: float = 0.35) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var sp: SphereMesh = SphereMesh.new()
	sp.radius = r
	sp.height = r * 2.0
	sp.radial_segments = 10
	sp.rings = 6
	mi.mesh = sp
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.4 if brilla else 0.9
	if brilla:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = energia
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = at
	_sala.add_child(mi)




func _build_tele() -> void:
	_centro = _sala.cone(DecisionRoom.CASA_TV_F, DecisionRoom.CASA_TV_R)
	_centro.y = TV_Y
	_hacia = - _sala.cone(1.0, 0.0).normalized()
	_derecha = _sala.cone(0.0, 1.0).normalized()
	var giro: float = _sala.face()
	var col: Color = CareerTheme.accent_of(team())





	_tele.append(_quad(TV_PANTALLA * 0.98, _en_tele(0, 0, 0.085), giro, Color("2f6b33")))
	for k in 7:
		if k % 2 == 0:
			_tele.append(_quad(Vector2(TV_PANTALLA.x * 0.14, TV_PANTALLA.y * 0.98),
				_en_tele(-0.84 + 0.28 * float(k), 0, 0.088), giro, Color("3a7d3d")))
	_tele.append(_quad(Vector2(0.012, TV_PANTALLA.y * 0.98), _en_tele(0, 0, 0.09), giro,
		Color(1, 1, 1, 0.8)))
	_tele.append(_quad(Vector2(TV_PANTALLA.x * 0.98, 0.012), _en_tele(0, -0.3, 0.09), giro,
		Color(1, 1, 1, 0.8)))



	var k1: Color = _kit.get("kit", col)
	var k2: Color = _kit.get("kit2", Color.WHITE)
	var rg: RandomNumberGenerator = RandomNumberGenerator.new()
	rg.seed = 11
	_tele.append(_quad(Vector2(TV_PANTALLA.x * 0.98, 0.34), _en_tele(0, 0.36, 0.091), giro,
		Color("1c2130")))
	for fila in 4:
		for k in 26:
			var tinte: Color = [k1, k2, k1, Color("c8b8a0"), Color("6a6a78")][rg.randi_range(0, 4)]
			_tele.append(_quad(Vector2(0.045, 0.05), _en_tele(-0.94 + 0.075 * float(k)
				+ 0.035 * float(fila % 2), 0.24 + 0.075 * float(fila), 0.092), giro, tinte))
	for k in 6:
		_tele.append(_quad(Vector2(0.32, 0.06), _en_tele(-0.82 + 0.33 * float(k), 0.17, 0.093),
			giro, [Color("e0e0e0"), col, Color("2a4a8a")][k % 3]))
	var px_tv: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x * 0.2
	var fuentes: Array = [player] + _mates.slice(0, 4)
	for i in fuentes.size():
		var src: AnimatedSprite3D = fuentes[i]
		if src == null:
			continue
		var d: AnimatedSprite3D = AnimatedSprite3D.new()
		d.sprite_frames = src.sprite_frames
		d.pixel_size = px_tv *(1.25 if i == 0 else 1.0)
		d.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		d.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		d.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var u: float = [0.0, -0.5, 0.5, -0.27, 0.27][i]
		d.position = _en_tele(u, -0.28 + feet_offset(d.pixel_size) +(0.0 if i == 0 else 0.04), 0.095)
		d.rotation_degrees.y = giro
		_sala.add_child(d)
		d.play("idle")
		_tele.append(d)
		_en_pantalla.append([src, d])
	_tele.append(_quad(Vector2(1.08, 0.24), _en_tele(0, 0.37, 0.1), giro, PLACA))
	var rival: Dictionary = Nations.as_team(String(data.get("rival", "")))
	_tele.append(_escudo(team(), _en_tele(-0.4, 0.37, 0.12), giro))
	_tele.append(_escudo(rival, _en_tele(0.4, 0.37, 0.12), giro))
	var cifra: String = "%d-%d" % [int(data.get("team_goals", 0)), int(data.get("rival_goals", 0))]
	_tele.append(_rotulo(cifra, 96, minf(0.0019, 0.6 /(96.0 * cifra.length())),
		_en_tele(0, 0.37, 0.12), giro, Color.WHITE))
	_tele.append(_rotulo(I18n.t("FINAL"), 48, 0.0014, _en_tele(0, 0.18, 0.12), giro,
		Color.WHITE))

	_tele.append(_quad(Vector2(0.3, 0.1), _en_tele(-0.72, 0.18, 0.11), giro, PLACA))
	_tele.append(_rotulo("90+%d'" % rng.randi_range(2, 6), 32, 0.0013, _en_tele(-0.72, 0.18, 0.12),
		giro, Color.WHITE))
	_tele.append(_quad(Vector2(0.16, 0.1), _en_tele(0.86, -0.25, 0.11), giro, Color(1, 1, 1, 0.55)))
	_tele.append(_rotulo("FL", 32, 0.0013, _en_tele(0.86, -0.25, 0.12), giro, PLACA))
	if _ok:
		for k in 22:
			var q: MeshInstance3D = _quad(Vector2(0.03, 0.03), _en_tele(0, 0, 0.115), giro,
				[k1, k2, CareerTheme.MONEY][k % 3])
			q.visible = false
			_tv_confeti.append([q, rng.randf_range(-0.92, 0.92), rng.randf()])
	_tele.append(_quad(Vector2(0.34, 0.1), _en_tele(0.72, 0.18, 0.11), giro, CareerTheme.DANGER))
	_tele.append(_rotulo(I18n.t("EN VIVO"), 32, 0.0013, _en_tele(0.72, 0.18, 0.12), giro,
		Color.WHITE))
	_tele.append(_quad(Vector2(TV_PANTALLA.x * 0.98, 0.2), _en_tele(0, -0.43, 0.1), giro, PLACA))
	var veredicto: String = I18n.t("CLASIFICADOS") if _ok else I18n.t("ELIMINADOS")
	_tele.append(_rotulo(veredicto, 64, minf(0.0016, 1.4 /(64.0 * veredicto.length())),
		_en_tele(0, -0.43, 0.12), giro, text_accent() if _ok else CareerTheme.DANGER))
	for n in _tele:
		n.visible = false
	_negro = _quad(TV_PANTALLA, _en_tele(0, 0, 0.13), giro, Color(0.01, 0.01, 0.015))
	_negro.visible = false
	_raya = _quad(Vector2(TV_PANTALLA.x, 0.03), _en_tele(0, 0, 0.14), giro, Color.WHITE)
	_raya.visible = false







func _build_decoracion() -> void:
	var giro: float = _sala.face()
	var c1: Color = _kit.get("kit", accent)
	var c2: Color = _kit.get("kit2", Color.WHITE)
	if c1.is_equal_approx(c2):
		c2 = Color.WHITE if c1.get_luminance() < 0.6 else Color(0.1, 0.1, 0.12)
	var pared: float = DecisionRoom.CASA_TV_F + 0.02

	for r in [DecisionRoom.CASA_TV_R - 1.75, DecisionRoom.CASA_TV_R + 1.75]:
		var c: Vector3 = _sala.cone(pared, r) + Vector3(0, 1.55, 0)
		for k in 3:
			_quad(Vector2(1.1, 0.25), c + Vector3(0, 0.25 - 0.25 * k, 0), giro,
				c1 if k != 1 else c2)
		_escudo(team(), c + _hacia * 0.01, giro).scale = Vector3.ONE * 1.1


	var n: int = 13
	for k in n:
		var u: float = lerpf(-2.9, 2.9, float(k) / float(n - 1))
		var cae: float = 0.16 *(1.0 - pow(u / 2.9, 2.0))
		var p: Vector3 = _sala.cone(pared, DecisionRoom.CASA_TV_R + u) \
				+ Vector3(0, 2.35 - cae, 0)
		var b: MeshInstance3D = _quad(Vector2(0.2, 0.24), p, giro, c1 if k % 2 == 0 else c2)
		b.rotation_degrees.z = 45.0
	_quad(Vector2(5.9, 0.015), _sala.cone(pared, DecisionRoom.CASA_TV_R)
		+ Vector3(0, 2.42, 0), giro, Color(0.85, 0.85, 0.8))

	var pc: Vector3 = _sala.cone(pared, DecisionRoom.CASA_TV_R + 2.75) + Vector3(0, 1.45, 0)
	_quad(Vector2(0.7, 0.95), pc, giro, c2.lightened(0.2))
	_quad(Vector2(0.6, 0.85), pc + _hacia * 0.01, giro, c1)
	_escudo(team(), pc + _hacia * 0.02, giro).scale = Vector3.ONE * 1.6

	var f: float = DecisionRoom.CASA_SOFA_F - 0.42
	for k in 9:
		var rr: float = -2.3 + 0.13 * k
		var m: MeshInstance3D = _quad(Vector2(0.13, 0.2), _sala.cone(f, rr)
			+ Vector3(0, 1.05, 0), giro, c1 if k % 2 == 0 else c2)
		m.material_override.shading_mode = BaseMaterial3D.SHADING_MODE_PER_PIXEL


func _en_tele(u: float, v: float, capa: float) -> Vector3:
	return _centro + _derecha * u + Vector3.UP * v + _hacia * capa







func _suena_clase(ok: bool) -> void:
	var v: int = rng.randi_range(1, 3)
	if ok:
		match _clase:
			"baja":
				sting("claxon", -8.0)
				sting("cannon_pop", -10.0)
				sting("voz_cele_%d" % v, -6.0)
				sting("crowd_happy", -12.0)
			"alta":
				sting("cannon_pop", -6.0)
				sting("applause_loop", -10.0)
				sting("fanfare", -12.0)
			_:
				sting("voz_cele_%d" % v, -6.0)
				sting("crowd_happy", -10.0)
				sting("crowd_roar", -14.0)
		return
	sting("stinger_bad", -10.0)
	sting("dolor_queja_%d" % rng.randi_range(1, 6), -10.0)
	match _clase:
		"baja":
			sting("voz_protesta_%d" % v, -8.0)
			sting("rain_roof", -14.0)
		"alta":
			sting("door_slam", -14.0)
		_:
			sting("intro_grillos", -12.0)






const GESTOS_OK: Array = ["clap"]


func _emocion() -> void:
	var hacia: Vector3 = _sala.cone(1.0, 0.0) - _sala.cone(0.0, 0.0)
	for i in _familia.size():
		var s: AnimatedSprite3D = _familia[i]
		s.speed_scale = 1.0
		gesto_play(s, "lost" if not _ok else String(GESTOS_OK[i % GESTOS_OK.size()]), hacia)



func _momento_sala(vivo: bool) -> void:
	_momento = true
	if _ok:


		_confeti_sala()
		if vivo:
			_suena_clase(true)
		_emocion()
		return


	for n in _tele:
		n.visible = false
	_negro.visible = true
	for l in _sala.find_children("*", "OmniLight3D", true, false):
		if (l as OmniLight3D).light_color == DecisionRoom.CASA_TV_LIGHT:
			(l as OmniLight3D).light_energy = 0.0
		elif l in _fiesta:
			continue
		elif vivo:
			create_tween().tween_property(l, "light_energy", 2.6, 1.6)
		else:
			(l as OmniLight3D).light_energy = 2.6
	if vivo:
		_raya.visible = true
		_raya.scale = Vector3(1.0, 4.0, 1.0)
		var tw: Tween = create_tween()
		tw.tween_property(_raya, "scale", Vector3(1.0, 0.4, 1.0), 0.09)
		tw.tween_property(_raya, "scale", Vector3(0.01, 0.4, 1.0), 0.14)
		tw.tween_callback(func() -> void: _raya.visible = false)
	if _gato != null:
		_gato.play("yawn_south")
	if vivo:
		_suena_clase(false)
	_emocion()

	for i in _familia.size():
		var s: AnimatedSprite3D = _familia[i]
		s.speed_scale = 0.5
		if vivo:
			create_tween().tween_property(s, "position:y", _familia_y[i] - 0.07, 1.2) \
					.set_delay(0.5 + 0.2 * float(i))
		else:
			s.position.y = _familia_y[i] - 0.07



func _confeti_sala() -> void:
	var p: CPUParticles3D = CPUParticles3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.045, 0.03)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.vertex_color_use_as_albedo = true
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	q.material = mat
	p.mesh = q
	p.amount = 160
	p.lifetime = 2.4
	p.preprocess = 0.6
	p.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
	p.emission_box_extents = Vector3(1.6, 0.05, 1.6)
	p.direction = Vector3(0, -1, 0)
	p.spread = 25.0
	p.gravity = Vector3(0, -1.2, 0)
	p.initial_velocity_min = 0.2
	p.initial_velocity_max = 0.6
	p.angular_velocity_min = -360.0
	p.angular_velocity_max = 360.0
	var g: Gradient = Gradient.new()
	g.set_color(0, Color(_kit.get("kit", accent)))
	g.set_color(1, Color(_kit.get("kit2", Color.WHITE)))
	p.color_initial_ramp = g
	p.position = _sala.cone(1.8, -0.8) + Vector3(0, 2.55, 0)
	_sala.add_child(p)
	p.emitting = true


func _quad(size: Vector2, at: Vector3, giro: float, col: Color) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	mi.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = at
	mi.rotation_degrees.y = giro
	_sala.add_child(mi)
	return mi


func _rotulo(txt: String, px: int, pixel: float, at: Vector3, giro: float,
		col: Color) -> Label3D:
	var l: Label3D = Label3D.new()
	l.text = txt
	l.font_size = px
	l.pixel_size = pixel
	l.outline_size = 8
	l.modulate = col
	l.outline_modulate = PLACA
	l.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	l.position = at
	l.rotation_degrees.y = giro
	_sala.add_child(l)
	return l


func _escudo(equipo: Dictionary, at: Vector3, giro: float) -> Node3D:
	var s: Sprite3D = Sprite3D.new()
	var tex: Texture2D = crest_texture(equipo) if not equipo.is_empty() else null
	s.texture = tex
	if tex != null:
		s.pixel_size = 0.28 / float(maxi(tex.get_width(), 1))
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.shaded = false
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.position = at
	s.rotation_degrees.y = giro
	_sala.add_child(s)
	return s




func _tick(delta: float) -> void:
	var vivo: bool = delta > 0.0
	if not _pitado and t >= T_PITIDO:
		_pitido(vivo and t < T_PITIDO + 0.3)
	if not _cortado and t >= T_CORTE:
		_corta()
	if not _momento and t >= T_MOMENTO:
		_momento_sala(vivo and t < T_MOMENTO + 0.3)
	if _cortado:
		_vida_sala()






func _vida_sala() -> void:
	if _luz_tele != null and _luz_tele.light_energy > 0.0:
		_luz_tele.light_energy = _luz_tele_e *(0.8 + 0.25 * sin(t * 23.0) * sin(t * 7.3))
	for i in _familia.size():
		var s: AnimatedSprite3D = _familia[i]
		var fase: float = 1.7 * float(i)
		if not _momento:
			s.position.y = _familia_y[i] + 0.015 * sin(t * 5.0 + fase)
		elif _ok:
			var y0: float = _familia_y[i] +(0.0 if i in DE_PIE else SENTADO)
			s.position.y = y0 + 0.26 * absf(sin((t - T_MOMENTO) * 6.5 + fase))

			if not s.is_playing():
				var g: String = String(GESTOS_OK[(i + int(t)) % GESTOS_OK.size()])
				gesto_play(s, g, _sala.cone(1.0, 0.0) - _sala.cone(0.0, 0.0))
	for par in _en_pantalla:
		var o: AnimatedSprite3D = par[0]
		var d: AnimatedSprite3D = par[1]
		if d.sprite_frames.has_animation(o.animation) and d.animation != o.animation:
			d.play(o.animation)
		d.frame = o.frame
		d.flip_h = o.flip_h
	_vida_mascotas()
	if _momento and _ok:
		for c in _tv_confeti:
			var q: MeshInstance3D = c[0]
			q.visible = true
			var v: float = 0.5 - fmod((t - T_MOMENTO) * 0.35 + float(c[2]), 1.0) * 1.0
			q.position = _en_tele(float(c[1]) + 0.04 * sin(t * 4.0 + 9.0 * float(c[2])), v, 0.115)
			q.rotation_degrees.z = 200.0 * t *(0.5 + float(c[2]))
	if _momento and not _ok:
		_vida_salida()
	if _momento and _ok:
		for k in _fiesta.size():
			_fiesta[k].light_energy = 3.5 *(0.5 + 0.5 * sin(t * 8.0 + PI * float(k)))
		if _bandera_mano != null:
			_bandera_mano.rotation_degrees.z = 18.0 * sin(t * 9.0)
			var pie: AnimatedSprite3D = _familia[DE_PIE[0]]
			_bandera_mano.position.y = pie.position.y + 0.95





func _vida_mascotas() -> void:
	var duelo: bool = _momento and not _ok
	var susto: bool = _momento and _ok



	if _perro != null:
		if susto:
			if _perro_desde == Vector3.INF:
				_perro_desde = _perro.position
				_perro.speed_scale = 2.5
			var dir: Vector3 =(_sala.cone(0.0, -1.0) - _sala.cone(0.0, 0.0)).normalized()
			_perro.position = _perro_desde + dir * 4.5 * maxf(0.0, t - T_MOMENTO - 0.15)
			_perro.flip_h = true
			if _perro.animation != "walk_east":
				_perro.play("walk_east")
		elif duelo:
			if _perro.animation != "idle_south":
				_perro.play("idle_south")
				_perro.flip_h = false
		else:
			var u: float = fmod(t * 0.18, 2.0)
			var ida: bool = u < 1.0
			var p: Vector3 = _sala.cone(0.35, lerpf(-1.9, 1.0, u if ida else 2.0 - u))
			_perro.position = Vector3(p.x, _perro.position.y, p.z)
			_perro.flip_h = not ida
			if _perro.animation != "walk_east":
				_perro.play("walk_east")
	if _gato != null:
		if susto:
			if _gato_desde == Vector3.INF:
				_gato_desde = _gato.position
				_gato.speed_scale = 2.5
			var dt: float = maxf(0.0, t - T_MOMENTO - 0.05)
			var dir: Vector3 =(_sala.cone(0.0, 1.0) - _sala.cone(0.0, 0.0)).normalized()

			var y_suelo: float = float(_gato.get_meta("pie"))
			var salto: float = 0.5 * sin(minf(dt / 0.45, 1.0) * PI)
			_gato.position = _gato_desde + dir * 3.5 * dt
			_gato.position.y = lerpf(_gato_desde.y, y_suelo, minf(dt / 0.45, 1.0)) + salto
			_gato.flip_h = false
			if _gato.animation != "walk_east":
				_gato.play("walk_east")
		elif not duelo:
			var u: float = fmod(t * 0.12 + 0.3, 2.0)
			var ida: bool = u < 1.0
			var p: Vector3 = _sala.cone(0.68, lerpf(-1.6, 0.6, u if ida else 2.0 - u))
			_gato.position = Vector3(p.x, _gato.position.y, p.z)
			_gato.flip_h = not ida
			if _gato.animation != "walk_east":
				_gato.play("walk_east")










const SALIDA_VEL: Vector2 = Vector2(0.7, 1.5)
var _plan_salida: Array = []

var _semilla_familia: int = randi()


func _vida_salida() -> void:
	var dt: float = t - T_MOMENTO
	if _plan_salida.is_empty():
		var rs: RandomNumberGenerator = RandomNumberGenerator.new()
		rs.seed = rng.seed + 31
		var quedan: Array = [rs.randi_range(0, _familia.size() - 1)]
		if rs.randf() < 0.5:
			quedan.append(rs.randi_range(0, _familia.size() - 1))
		for i in _familia.size():
			var s: AnimatedSprite3D = _familia[i]
			var r: float = float(FAMILIA[i][1])
			var lado: float = -1.0 if r + rs.randf_range(-0.9, 0.9) < -0.5 else 1.0
			var dir: Vector3 = _sala.cone(rs.randf_range(-0.35, 0.15), lado) - _sala.cone(0.0, 0.0)
			_plan_salida.append({
				"desde": s.position,
				"cuando": rs.randf_range(0.6, 3.5),
				"dir": Vector3(dir.x, 0.0, dir.z).normalized(),
				"vel": rs.randf_range(SALIDA_VEL.x, SALIDA_VEL.y),
				"queda": i in quedan,
			})
	for i in _familia.size():
		var plan: Dictionary = _plan_salida[i]
		if plan["queda"]:
			continue
		var mio: float = dt - float(plan["cuando"])
		if mio < 0.0:
			continue
		var s: AnimatedSprite3D = _familia[i]
		if not s.has_meta("salio"):
			s.set_meta("salio", true)
			if i == 0:
				sting("voz_protesta_%d" % rng.randi_range(1, 3), -9.0)
		var desde: Vector3 = plan["desde"]
		var vel: float = float(plan["vel"])
		var y_pie: float = _familia_y[i] +(0.0 if i in DE_PIE else SENTADO)
		s.position = desde +(plan["dir"] as Vector3) * vel * maxf(0.0, mio - 0.3)
		s.position.y = lerpf(desde.y, y_pie, minf(mio / 0.3, 1.0))

		s.speed_scale = 0.55 + 0.4 *(vel - SALIDA_VEL.x) /(SALIDA_VEL.y - SALIDA_VEL.x)
		walk_play(s, plan["dir"])
		s.visible = s.position.distance_to(_sala.cone(0.0, 0.0)) < 12.0


func _skipped() -> void:
	_tick(0.0)
