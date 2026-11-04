extends Ceremony































































const SALAS: Dictionary = {
	1: {"w": 18.0, "z0": -8.2, "z1": 13.5, "h": 6.2,
		"st_h": 0.6, "st_w": 10.0, "st_z1": -4.8,
		"mesa_r": 0.85, "cols": [-6.1, -2.6, 2.6, 6.1], "rows": [-2.3, 1.2, 4.7, 8.2]},
	2: {"w": 13.0, "z0": -6.4, "z1": 9.0, "h": 4.0,
		"st_h": 0.34, "st_w": 7.0, "st_z1": -3.9,
		"mesa_r": 0.78, "cols": [-4.4, -2.1, 2.1, 4.4], "rows": [-1.6, 1.5, 4.6]},
	3: {"w": 9.6, "z0": -4.6, "z1": 7.0, "h": 2.95,
		"st_h": 0.0, "st_w": 4.0, "st_z1": -3.0,
		"tramos": [[-4.0, -0.9], [0.9, 4.0]], "rows": [-1.3, 1.3, 3.9]},
}



const AFORO: Dictionary = {1: 0.42, 2: 0.32, 3: 0.2}




const LUZ_GENTE: Dictionary = {
	1: Color(0.92, 0.87, 0.8), 2: Color(0.97, 0.94, 0.89), 3: Color(0.93, 0.95, 1.0),
}







const SIT_DROP: float = 0.38
const MESA_H: float = 0.64



const SEAT_ANG: Array[float] = [-50.0, -17.0, 17.0, 50.0]
const SEAT_GAP: float = 0.3
const TABLON_D: float = 0.8
const TABLON_PASO: float = 0.7


const EXTRAS: int = 6


const SEAT_DEL: int = 1
const SEAT_DEF: int = 2
const SEAT_MED: int = 5
const SEAT_POR: int = 4
const SEAT_YOU: int = 6


const FONDO_SALA: float = 0.1


const SALA_EN_VILO: float = 0.62





const T_CHYRON: float = 0.8
const T_BAJA: float = 2.4
const T_PRIMERO: float = 3.3
const PASO: float = 2.0
const HUSH: float = 1.9
const PAUSA: float = 0.75
const CARD_TRAS: float = 2.3
const PALMAS: float = 1.7
const T_SUSP_CHYRON: float = 0.6






const DE_PIE: float = 2.2
const T_SUSP_CARD: float = 3.8

const ICONO_LINEA: Dictionary = {"POR": "guante", "DEF": "club_def", "MED": "club_med", "DEL": "club_del"}

var _sala: Dictionary = {}
var _div: int = 1
var _susp: bool = false
var _liga: bool = false
var _kit: Color = Color.WHITE
var _kit2: Color = Color.WHITE
var _escudo: Texture2D = null
var _mats: Dictionary = {}
var _frames_memo: Dictionary = {}
var _winners: Array = []
var _best: Dictionary = {}
var _figs: Array = []
var _seat_of: Array = []
var _best_idx: int = -1
var _stage_fig: AnimatedSprite3D = null
var _publico: Array = []
var _base_mod: Dictionary = {}
var _y_sentado: Dictionary = {}
var _sillas: Array = []
var _t_aw: Array[float] = []
var _t_hush: float = 0.0
var _t_reveal: float = 0.0
var _t_llega: float = 0.0
var _walker: AnimatedSprite3D = null
var _llego: bool = false
var _dados: int = 0
var _hushed: bool = false
var _revealed: bool = false
var _de_pie: AnimatedSprite3D = null
var _tw_pie: Tween = null
var _palmas_hasta: float = -1.0
var _follow: SpotLight3D = null
var _stage_spots: Array = []
var _beams: Array = []
var _env: Environment = null
var _lamps: Array = []
var _big_trophy: Sprite3D = null
var _trophy_y: float = 0.0
var _ticker: PanelContainer = null
var _ticker_fuera: bool = false
var _tk_icon: TrophyIcon = null
var _tk_tag: Label = null
var _tk_name: Label = null
var _tk_sub: Label = null
var _tk_quien: HBoxContainer = null







var _pant: Dictionary = {}
var _pant_vp: SubViewport = null
var _pant_spr: Sprite3D = null
var _pant_hojas: Dictionary = {}
var _crest_memo: Dictionary = {}





var _mesa_club: Dictionary = {}



var _fila_tarima: Array = []
var _avance_desde: Vector3 = Vector3.ZERO
var _t_avance: float = -1.0
const AVANCE: float = 1.4



const POSE_LINEA: Dictionary = {
	"POR": "res://assets/sprites/anim/dive_03.png",
	"DEF": "res://assets/sprites/anim/header_player_east_04.png",
	"MED": "res://assets/sprites/anim/control_player_east_04.png",
	"DEL": "res://assets/sprites/anim/chilena_player_east_05.png",
}













const T_PREMIO: float = 3.4
const CARTEL_BAJA: float = 0.3
const CARTEL_LLEGA: float = 1.2
const CUENTA_DE: float = 1.3
const CUENTA_DUR: float = 0.95
const CARTEL_PX: Vector2i = Vector2i(1024, 432)







const CARTEL: Dictionary = {
	1: {"w": 3.4, "y": 1.9, "dz": 0.3, "dist": 8.2},
	2: {"w": 2.8, "y": 1.75, "dz": 0.3, "dist": 6.8},
	3: {"w": 1.8, "y": 1.75, "dz": 0.3, "dist": 4.4},
}
var _premio: int = 0
var _t0: float = 0.0
var _cartel: Node3D = null
var _cartel_vp: SubViewport = null
var _cartel_mat: StandardMaterial3D = null
var _cartel_y: float = 0.0
var _cartel_alto: float = 0.0
var _cifra: Label = null
var _cifra_n: int = -1
var _copas: Array = []
var _contado: bool = false
var _copas_dadas: int = 0
var _cartel_fuera: bool = false





func _accent_for() -> Color:
	if bool(data.get("suspended", false)):
		return CareerTheme.DANGER

	if str(data.get("mode", "")) == "liga":
		return Teams.accent(_pais())
	return super()




func _pais() -> String:
	var c: String = str(data.get("country", ""))
	return c if not c.is_empty() else Teams.country_of(club_del_acto())




func _nombre_liga() -> String:
	return Competitions.league_div_name(_pais(), _div)



func _music_for() -> String:
	if bool(data.get("suspended", false)):
		return ""
	return super()


func _build() -> void:
	_div = div()
	_sala = SALAS.get(_div, SALAS[1]) as Dictionary
	_liga = str(data.get("mode", "")) == "liga"
	_susp = bool(data.get("suspended", false)) and not _liga

	rng.seed = hash("gala%s|%s|%d" % ["liga" if _liga else "club", str(data.get("club", "")),
		int(data.get("season", 0))])
	if _liga:


		_kit = accent
		_kit2 = CareerTheme.MONEY
		_escudo = CompLogos.texture(str(data.get("logo", "")))
	else:
		var kv: Dictionary = GameState.kit_variant(team(), 0)
		_kit = kv.get("kit", accent) as Color
		_kit2 = kv.get("kit2", Color.WHITE) as Color



	if _escudo == null:
		_escudo = crest_texture(team(), 256, true)
	_build_env()
	_build_room()
	_build_stage()
	_reparte_mesas()
	_build_tables()
	_build_lights()
	if _susp:
		_build_suspended()
		return
	_read_winners()

	_premio = 0 if _liga else ClubGala.premio_pct(data)
	_t0 = T_PREMIO if _premio > 0 else 0.0
	if _premio > 0:
		_build_cartel()
	_build_timeline()
	_build_people()
	_plan_de_pie()
	_build_chairs()
	_build_trophies()
	make_camera(_keys(), 44.0)
	orbit_speed = -0.45
	make_audio(float(AFORO.get(_div, 0.3)), false)

	flash_pool = _flash_pool()
	flash_rate = 4.0 if _div == 1 else (1.6 if _div == 2 else 0.6)
	flash_burst_at = _t_llega
	flash_burst_dur = 1.8
	flash_burst_mult = 6.0 if _div == 1 else 4.0
	confetti_colors = [_kit, _kit2, Color.WHITE]
	confetti_count = 240 if _div == 1 else (160 if _div == 2 else 90)
	if _liga:
		make_chyron(I18n.t("GALA DE LA LIGA"), CareerTheme.caps(_nombre_liga()), {}, T_CHYRON,
			str(data.get("logo", "")))
	else:
		make_chyron(I18n.t("GALA DEL CLUB"), CareerTheme.caps(str(team().get("name", "?"))),
			team(), T_CHYRON)
	_build_pantalla()
	_build_ticker()
	_build_card()




func _f(k: String) -> float:
	return float(_sala.get(k, 0.0))


func _read_winners() -> void:
	for w in data.get("winners", []):
		if w is Dictionary and not (w as Dictionary).is_empty():
			_winners.append(w)
	var b: Variant = data.get("best", {})
	_best =(b as Dictionary) if b is Dictionary else {}
	for i in _winners.size():
		var w: Dictionary = _winners[i]
		if str(w.get("line", "")) == str(_best.get("line", "")) \
				and str(w.get("name", "")) == str(_best.get("name", "")):
			_best_idx = i


func _build_timeline() -> void:
	_t_aw.clear()
	for i in _winners.size():
		_t_aw.append(_t0 + T_PRIMERO + PASO * float(i))
	var ult: float = _t_aw[_t_aw.size() - 1] if not _t_aw.is_empty() \
			else _t0 + T_PRIMERO - PASO
	_t_hush = ult + HUSH
	_t_reveal = _t_hush + PAUSA
	_t_llega = _t_reveal


func _nombre(f: Dictionary) -> String:
	return CareerUi.display_name(str(f.get("name", "?")))


func _tag_linea(line: String) -> String:
	match line:
		"POR":
			return I18n.t("MEJOR PORTERO")
		"DEF":
			return I18n.t("MEJOR DEFENSA")
		"MED":
			return I18n.t("MEJOR MEDIO")
		"DEL":
			return I18n.t("MEJOR DELANTERO")
	if _liga:
		return I18n.t("MEJOR JUGADOR DE LA LIGA")
	return I18n.t("MEJOR JUGADOR DE LA TEMPORADA")




func _sp() -> Vector3:
	var st_z1: float = _f("st_z1")
	if _f("st_h") <= 0.0:


		return Vector3(0.55, 0.0, st_z1 - 1.2)
	return Vector3(0.0, _f("st_h"), st_z1 - 1.25)






func _mat(col: Color, rough: float = 0.9, emis: float = 0.0) -> StandardMaterial3D:
	var key: String = "%s|%.2f|%.2f" % [col.to_html(), rough, emis]
	if _mats.has(key):
		return _mats[key]
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = rough
	if emis > 0.0:
		m.emission_enabled = true
		m.emission = col
		m.emission_energy_multiplier = emis
	_mats[key] = m
	return m




func _mat_luz(col: Color) -> StandardMaterial3D:
	var key: String = "u|%s" % col.to_html()
	if _mats.has(key):
		return _mats[key]
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_mats[key] = m
	return m


func _caja(size: Vector3, pos: Vector3, mat: Material, giro: float = 0.0) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = _bm(size)
	mi.material_override = mat
	mi.position = pos
	mi.rotation_degrees.y = giro
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(mi)
	return mi


func _bm(size: Vector3) -> BoxMesh:
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	return b


func _cm(r_top: float, r_bot: float, h: float, seg: int = 16) -> CylinderMesh:
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r_top
	c.bottom_radius = r_bot
	c.height = h
	c.radial_segments = seg
	c.rings = 1
	return c


func _sm(r: float) -> SphereMesh:
	var s: SphereMesh = SphereMesh.new()
	s.radius = r
	s.height = r * 2.0
	s.radial_segments = 8
	s.rings = 4
	return s





func _lote(mesh: Mesh, mat: Material, xs: Array[Transform3D]) -> void:
	if xs.is_empty():
		return
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh


	mm.instance_count = xs.size()
	for i in xs.size():
		mm.set_instance_transform(i, xs[i])
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = mat
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(mmi)


func _omni(pos: Vector3, col: Color, energy: float, rango: float) -> OmniLight3D:
	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = col
	l.light_energy = energy
	l.omni_range = rango
	l.shadow_enabled = false
	l.position = pos
	viewport.add_child(l)
	return l




func _escudo_en(pos: Vector3, size_m: float, giro: float,
		tinte: Color = Color.WHITE) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = _escudo
	s.pixel_size = size_m / 256.0
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.position = pos
	s.rotation_degrees.y = giro
	s.modulate = tinte
	viewport.add_child(s)
	return s





func _texto_en(text: String, pos: Vector3, ancho_m: float, px: int, col: Color,
		fondo: Color = Color(0, 0, 0, 0), giro: float = 0.0) -> Sprite3D:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(1024, 192)
	vp.transparent_bg = fondo.a <= 0.0
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	if fondo.a > 0.0:
		var bg: ColorRect = ColorRect.new()
		bg.color = fondo
		bg.set_anchors_preset(Control.PRESET_FULL_RECT)
		vp.add_child(bg)
	var l: Label = CareerUi.plain(px, col)
	l.text = text
	l.set_anchors_preset(Control.PRESET_FULL_RECT)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	vp.add_child(l)
	var s: Sprite3D = Sprite3D.new()
	s.texture = vp.get_texture()
	s.pixel_size = ancho_m / 1024.0
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.position = pos
	s.rotation_degrees.y = giro
	viewport.add_child(s)
	return s




func _build_env() -> void:
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color(0.02, 0.02, 0.025)
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	match _div:
		1:
			e.ambient_light_color = Color("d9c3a0")
			e.ambient_light_energy = 0.55
		2:
			e.ambient_light_color = Color("e6d2b4")
			e.ambient_light_energy = 0.75
		_:
			e.ambient_light_color = Color("dfe6ee")
			e.ambient_light_energy = 0.95
	if _susp:

		e.ambient_light_energy *= 0.38
	elif _div == 1:

		e.fog_enabled = true
		e.fog_light_color = Color(0.1, 0.09, 0.08)
		e.fog_density = 0.01
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = e
	viewport.add_child(we)
	_env = e


func _paleta() -> Dictionary:
	match _div:
		1:
			return {"suelo": Color("2b1c24"), "techo": Color("15110f"),
				"pared": Color("33241f"), "frente": Color("121217"),
				"zocalo": Color("1f1512"), "oro": Color("b8923a")}
		2:
			return {"suelo": Color("6e4c34"), "techo": Color("d6cfc2"),
				"pared": Color("dacdb5"), "frente": Color("cbbea5"),
				"zocalo": Color("7a5a3e"), "oro": Color("a88a52")}
	return {"suelo": Color("9c988d"), "techo": Color("d2d1ca"),
		"pared": Color("e2dfd3"), "frente": Color("e2dfd3"),
		"zocalo": _kit.darkened(0.25), "oro": Color("8a8f96")}


func _build_room() -> void:
	var w: float = _f("w")
	var z0: float = _f("z0")
	var z1: float = _f("z1")
	var h: float = _f("h")
	var zc: float =(z0 + z1) * 0.5
	var p: Dictionary = _paleta()
	_caja(Vector3(w, 0.1, z1 - z0), Vector3(0.0, -0.05, zc), _mat(p["suelo"], 0.85))
	_caja(Vector3(w, 0.12, z1 - z0), Vector3(0.0, h + 0.06, zc), _mat(p["techo"]))
	_caja(Vector3(w, h, 0.2), Vector3(0.0, h * 0.5, z1 + 0.1), _mat(p["pared"]))
	_caja(Vector3(w, h, 0.2), Vector3(0.0, h * 0.5, z0 - 0.1), _mat(p["frente"]))
	for s in [-1.0, 1.0]:
		_caja(Vector3(0.2, h, z1 - z0), Vector3(float(s) *(w * 0.5 + 0.1), h * 0.5, zc),
			_mat(p["pared"]))
	match _div:
		1:
			_decor_hotel(p)
		2:
			_decor_salon(p)
		_:
			_decor_local(p)




func _decor_hotel(p: Dictionary) -> void:
	var w: float = _f("w")
	var h: float = _f("h")
	var z0: float = _f("z0")
	var z1: float = _f("z1")
	var st_z1: float = _f("st_z1")
	var oro: StandardMaterial3D = _mat(p["oro"], 0.35)
	var zc: float =(z0 + z1) * 0.5


	var largo: float = z1 - st_z1 - 0.4
	var zm: float = st_z1 + 0.2 + largo * 0.5
	_caja(Vector3(2.4, 0.014, largo), Vector3(0.0, 0.007, zm), _mat(_kit.darkened(0.3), 0.9))
	for s in [-1.0, 1.0]:
		_caja(Vector3(0.07, 0.016, largo), Vector3(float(s) * 1.23, 0.008, zm), oro)

	for s in [-1.0, 1.0]:
		_caja(Vector3(0.06, 1.1, z1 - z0), Vector3(float(s) *(w * 0.5 - 0.03), 0.55, zc),
			_mat(p["zocalo"]))
		_caja(Vector3(0.08, 0.06, z1 - z0), Vector3(float(s) *(w * 0.5 - 0.04), 1.12, zc), oro)
	_caja(Vector3(w, 1.1, 0.06), Vector3(0.0, 0.55, z1 - 0.03), _mat(p["zocalo"]))
	_caja(Vector3(w, 0.06, 0.08), Vector3(0.0, 1.12, z1 - 0.04), oro)


	var pil: Array[Transform3D] = []
	var cap: Array[Transform3D] = []
	var apl: Array[Transform3D] = []
	var z: float = z0 + 2.2
	while z < z1 - 1.0:
		for s in [-1.0, 1.0]:
			var x: float = float(s) *(w * 0.5 - 0.14)
			pil.append(Transform3D(Basis(), Vector3(x, h * 0.5, z)))
			cap.append(Transform3D(Basis(), Vector3(x, h - 0.5, z)))
			if z + 1.75 < z1 - 0.5:
				apl.append(Transform3D(Basis(), Vector3(float(s) *(w * 0.5 - 0.1), 2.7, z + 1.75)))
		z += 3.5
	_lote(_bm(Vector3(0.28, h, 0.36)), _mat((p["pared"] as Color).lightened(0.12)), pil)
	_lote(_bm(Vector3(0.4, 0.22, 0.48)), oro, cap)
	_lote(_bm(Vector3(0.12, 0.34, 0.2)), _mat_luz(Color("ffd9a0")), apl)


	for s in [-1.0, 1.0]:
		for zz in [z0 + 5.6, z0 + 12.6]:
			if float(zz) > z1 - 1.5:
				continue
			var x: float = float(s) *(w * 0.5 - 0.12)
			_caja(Vector3(0.05, 3.0, 1.3), Vector3(x, h - 2.2, float(zz)), _mat(_kit, 0.8))
			_caja(Vector3(0.055, 0.22, 1.3), Vector3(x, h - 3.55, float(zz)), _mat(_kit2, 0.8))
			_escudo_en(Vector3(x - float(s) * 0.04, h - 2.0, float(zz)), 0.95, -90.0 * float(s))


	_caja(Vector3(7.2, 4.0, 0.08), Vector3(0.0, h * 0.5 + 0.4, z1 - 0.07),
		_mat(_kit.darkened(0.15), 0.85))
	_caja(Vector3(7.2, 0.3, 0.09), Vector3(0.0, h * 0.5 - 1.45, z1 - 0.075), _mat(_kit2, 0.85))
	_caja(Vector3(7.4, 0.08, 0.1), Vector3(0.0, h * 0.5 + 2.44, z1 - 0.08), oro)
	_escudo_en(Vector3(0.0, h * 0.5 + 0.55, z1 - 0.13), 2.4, 180.0)
	_pant = {"c": Vector3(0.0, h * 0.5 - 0.05, z1 - 0.16), "w": 6.6, "h": 3.4}
	for s in [-1.0, 1.0]:
		_caja(Vector3(1.4, h - 0.3, 0.12), Vector3(float(s) * 4.6,(h - 0.3) * 0.5, z1 - 0.1),
			_mat(Color("4a1f24"), 0.95))

	var vig: Array[Transform3D] = []
	var zv: float = z0 + 1.0
	while zv < z1:
		vig.append(Transform3D(Basis(), Vector3(0.0, h - 0.14, zv)))
		zv += 2.5
	_lote(_bm(Vector3(w, 0.26, 0.22)), _mat((p["techo"] as Color).lightened(0.1)), vig)
	var vig2: Array[Transform3D] = []
	for xv in [-4.5, 0.0, 4.5]:
		vig2.append(Transform3D(Basis(), Vector3(float(xv), h - 0.14, zc)))
	_lote(_bm(Vector3(0.22, 0.26, z1 - z0)), _mat((p["techo"] as Color).lightened(0.1)), vig2)




func _decor_salon(p: Dictionary) -> void:
	var w: float = _f("w")
	var h: float = _f("h")
	var z0: float = _f("z0")
	var z1: float = _f("z1")
	var zc: float =(z0 + z1) * 0.5
	var madera: StandardMaterial3D = _mat(p["zocalo"], 0.7)
	for s in [-1.0, 1.0]:
		_caja(Vector3(0.05, 1.0, z1 - z0), Vector3(float(s) *(w * 0.5 - 0.025), 0.5, zc), madera)
	_caja(Vector3(w, 1.0, 0.05), Vector3(0.0, 0.5, z1 - 0.025), madera)

	var cristal: Array[Transform3D] = []
	var marco: Array[Transform3D] = []
	var cort: Array[Transform3D] = []
	var z: float = z0 + 3.4
	while z < z1 - 1.2:
		for s in [-1.0, 1.0]:
			var x: float = float(s) *(w * 0.5 - 0.02)
			marco.append(Transform3D(Basis(), Vector3(x, 2.1, z)))
			cristal.append(Transform3D(Basis(), Vector3(x - float(s) * 0.02, 2.1, z)))
			for c in [-1.0, 1.0]:
				cort.append(Transform3D(Basis(), Vector3(x - float(s) * 0.05, 2.0,
					z + float(c) * 0.72)))
		z += 3.6
	_lote(_bm(Vector3(0.06, 1.75, 1.25)), _mat(Color("f0ece2"), 0.6), marco)
	_lote(_bm(Vector3(0.04, 1.55, 1.05)), _mat_luz(Color("1b2436")), cristal)
	_lote(_bm(Vector3(0.08, 2.5, 0.34)), _mat(_kit.darkened(0.1), 0.95), cort)

	_caja(Vector3(3.4, 2.1, 0.06), Vector3(0.0, 2.15, z1 - 0.05), _mat(p["oro"], 0.5))
	_caja(Vector3(3.2, 1.9, 0.07), Vector3(0.0, 2.15, z1 - 0.055), _mat(_kit, 0.85))
	_caja(Vector3(3.2, 0.22, 0.075), Vector3(0.0, 1.38, z1 - 0.06), _mat(_kit2, 0.85))
	_escudo_en(Vector3(0.0, 2.3, z1 - 0.1), 1.3, 180.0)
	_pant = {"c": Vector3(0.0, 2.15, z1 - 0.13), "w": 3.2, "h": 1.9}
	var fotos: Array[Transform3D] = []
	var dentro: Array[Transform3D] = []
	for x in [-3.4, -2.5, 2.5, 3.4]:
		for y in [2.55, 1.85]:
			fotos.append(Transform3D(Basis(), Vector3(float(x), float(y), z1 - 0.04)))
			dentro.append(Transform3D(Basis(), Vector3(float(x), float(y), z1 - 0.065)))
	_lote(_bm(Vector3(0.7, 0.52, 0.04)), _mat(Color("2b2622"), 0.6), fotos)
	_lote(_bm(Vector3(0.58, 0.4, 0.03)), _mat(Color("8d8a80"), 0.8), dentro)




func _decor_local(p: Dictionary) -> void:
	var w: float = _f("w")
	var h: float = _f("h")
	var z0: float = _f("z0")
	var z1: float = _f("z1")
	var zc: float =(z0 + z1) * 0.5

	var bald: Array[Transform3D] = []
	var nx: int = int(w / 0.6)
	var nz: int = int((z1 - z0) / 0.6)
	for ix in nx:
		for iz in nz:
			if (ix + iz) % 2 == 0:
				continue
			bald.append(Transform3D(Basis(), Vector3(- w * 0.5 + 0.3 + float(ix) * 0.6, 0.004,
				z0 + 0.3 + float(iz) * 0.6)))
	_lote(_bm(Vector3(0.6, 0.008, 0.6)), _mat(Color("7e7a70"), 0.7), bald)

	for s in [-1.0, 1.0]:
		_caja(Vector3(0.03, 1.1, z1 - z0), Vector3(float(s) *(w * 0.5 - 0.015), 0.55, zc),
			_mat(p["zocalo"], 0.8))
		_caja(Vector3(0.035, 0.08, z1 - z0), Vector3(float(s) *(w * 0.5 - 0.018), 1.14, zc),
			_mat(_kit2, 0.8))
	_caja(Vector3(w, 1.1, 0.03), Vector3(0.0, 0.55, z1 - 0.015), _mat(p["zocalo"], 0.8))
	_caja(Vector3(w, 0.08, 0.035), Vector3(0.0, 1.14, z1 - 0.018), _mat(_kit2, 0.8))



	var zf: float = z1 - 0.22
	_caja(Vector3(2.2, 1.35, 0.4), Vector3(-2.3, 0.9, zf), _mat(Color("4b3322"), 0.7))
	_caja(Vector3(2.0, 1.15, 0.02), Vector3(-2.3, 0.92, zf - 0.21), _mat(Color("9fb4c2"), 0.2))
	var copas: Array[Transform3D] = []
	for i in 5:
		copas.append(Transform3D(Basis(), Vector3(-3.1 + float(i) * 0.4,
			0.62 if i % 2 == 0 else 1.12, zf - 0.06)))
	_lote(_cm(0.07, 0.04, 0.24, 8), _mat(Color("c9a24a"), 0.3), copas)
	_caja(Vector3(1.3, 0.85, 0.03), Vector3(2.3, 1.55, z1 - 0.02), _mat(Color("a8835a"), 0.95))
	var notas: Array[Transform3D] = []
	for i in 5:
		notas.append(Transform3D(Basis(Vector3(0, 0, 1), rng.randf_range(-0.15, 0.15)),
			Vector3(1.9 + float(i % 3) * 0.38, 1.35 + float(i / 3) * 0.36, z1 - 0.04)))
	_lote(_bm(Vector3(0.24, 0.3, 0.01)), _mat(Color("f3f0e6"), 0.95), notas)
	_caja(Vector3(0.95, 0.56, 0.07), Vector3(0.0, 2.2, z1 - 0.3), _mat(Color("15171b"), 0.4))
	_pant = {"c": Vector3(0.0, 2.2, z1 - 0.34), "w": 0.88, "h": 0.5}
	_caja(Vector3(0.14, 0.1, 0.25), Vector3(0.0, 2.2, z1 - 0.13), _mat(Color("15171b"), 0.4))
	_escudo_en(Vector3(0.0, 1.5, z1 - 0.04), 0.85, 180.0)


	for s in [-1.0, 1.0]:
		for k in 4:
			_caja(Vector3(0.2, 0.3, 0.02),
				Vector3(float(s) * 1.85, 2.35 - float(k) * 0.3, z0 + 0.03),
				_mat(_kit if k % 2 == 0 else _kit2, 0.9))


	var ban_a: Array[Transform3D] = []
	var ban_b: Array[Transform3D] = []
	var gz: float = z0 + 2.5
	var gi: int = 0
	while gz < z1 - 0.8:
		var x: float = - w * 0.5 + 0.3
		while x < w * 0.5 - 0.2:
			var k2: float = x /(w * 0.5)
			var y: float = h - 0.3 - 0.32 *(1.0 - k2 * k2)
			var xf: Transform3D = Transform3D(Basis(Vector3(0, 0, 1), PI), Vector3(x, y, gz))
			(ban_a if gi % 2 == 0 else ban_b).append(xf)
			gi += 1
			x += 0.42
		gz += 2.5
	var pr: PrismMesh = PrismMesh.new()
	pr.size = Vector3(0.24, 0.28, 0.012)
	_lote(pr, _mat(_kit, 0.9), ban_a)
	_lote(pr, _mat(_kit2, 0.9), ban_b)




func _build_stage() -> void:
	var st_h: float = _f("st_h")
	var st_w: float = _f("st_w")
	var z0: float = _f("z0")
	var st_z1: float = _f("st_z1")
	var h: float = _f("h")
	var sp: Vector3 = _sp()
	if st_h > 0.0:
		var zc: float =(z0 + st_z1) * 0.5
		var tabla: StandardMaterial3D = _mat(Color("1a1a1f"), 0.35) if _div == 1 \
				else _mat(Color("5a3f2b"), 0.8)
		_caja(Vector3(st_w, st_h, st_z1 - z0), Vector3(0.0, st_h * 0.5, zc), tabla)

		_caja(Vector3(st_w, st_h * 0.86, 0.04), Vector3(0.0, st_h * 0.43, st_z1 + 0.02),
			_mat(_kit.darkened(0.2), 0.9))

		var n: int = 3 if _div == 1 else 2
		for k in range(1, n + 1):
			var hk: float = st_h * float(k) / float(n + 1)
			var zk: float = st_z1 + 0.3 * float(n - k) + 0.15
			_caja(Vector3(2.2, hk, 0.3), Vector3(0.0, hk * 0.5, zk), tabla)
		if _div == 1:
			var pil: Array[Transform3D] = []
			for i in 14:
				pil.append(Transform3D(Basis(), Vector3(- st_w * 0.5 + 0.35 + float(i) *(st_w - 0.7) / 13.0,
					st_h - 0.05, st_z1 + 0.045)))
			_lote(_bm(Vector3(0.08, 0.04, 0.02)),
				_mat_luz(Color("3a3a3a") if _susp else Color("fff1d0")), pil)
	match _div:
		1:
			_pantalla_led(z0, st_h, h)
		2:
			_lona(z0, st_h)
		_:
			_bandera(z0)
	if st_h > 0.0:
		_atril(Vector3(st_w * 0.32, st_h, st_z1 - 0.75))

		var mt: Vector3 = Vector3(- st_w * 0.3, st_h, st_z1 - 0.8)
		_caja(Vector3(2.0, 0.78, 0.62), mt + Vector3(0.0, 0.39, 0.0),
			_mat(Color("ecebe4") if _div == 1 else _kit.darkened(0.12), 0.95))
		_caja(Vector3(2.02, 0.02, 0.26), mt + Vector3(0.0, 0.79, 0.0),
			_mat(_kit2 if _div == 1 else Color("f2efe6"), 0.9))


		var pd: Vector3 = sp + Vector3(0.62, 0.0, 0.35)
		_caja(Vector3(0.46, 0.9, 0.46), pd + Vector3(0.0, 0.45, 0.0), _mat(Color("15151a"), 0.3))
		_caja(Vector3(0.52, 0.04, 0.52), pd + Vector3(0.0, 0.92, 0.0), _mat(Color("c9a24a"), 0.3))
		if _div == 1:
			for s in [-1.0, 1.0]:
				_flores(Vector3(float(s) *(st_w * 0.5 - 0.55), st_h, st_z1 - 0.45))
		else:
			for s in [-1.0, 1.0]:
				_globos(Vector3(float(s) *(st_w * 0.5 + 0.55), 0.0, st_z1 + 0.35))
	else:

		var mp: Vector3 = Vector3(0.0, 0.0, st_z1 - 0.55)
		_caja(Vector3(2.2, 0.03, 0.7), mp + Vector3(0.0, 0.735, 0.0), _mat(Color("d8d6cf"), 0.6))
		_caja(Vector3(2.24, 0.62, 0.02), mp + Vector3(0.0, 0.43, 0.355), _mat(_kit.darkened(0.1), 0.9))
		for s in [-1.0, 1.0]:
			_caja(Vector3(0.03, 0.72, 0.6), mp + Vector3(float(s) * 0.95, 0.36, 0.0),
				_mat(Color("6c6f75"), 0.5))

		var mic: Vector3 = Vector3(1.45, 0.0, st_z1 - 0.95)
		_caja(Vector3(0.26, 0.02, 0.26), mic + Vector3(0.0, 0.01, 0.0), _mat(Color("202226"), 0.4))
		_caja(Vector3(0.025, 1.45, 0.025), mic + Vector3(0.0, 0.73, 0.0), _mat(Color("202226"), 0.4))
		_caja(Vector3(0.05, 0.08, 0.05), mic + Vector3(0.0, 1.49, 0.03), _mat(Color("111111"), 0.4))





func _pantalla_led(z0: float, st_h: float, h: float) -> void:
	var y0: float = st_h + 0.45
	var alto: float = minf(4.1, h - y0 - 0.6)
	var yc: float = y0 + alto * 0.5
	_caja(Vector3(7.9, alto + 0.2, 0.18), Vector3(0.0, yc, z0 + 0.15), _mat(Color("0c0c10"), 0.4))
	if _susp:
		_caja(Vector3(7.6, alto, 0.02), Vector3(0.0, yc, z0 + 0.25), _mat_luz(Color("060607")))
		_escudo_en(Vector3(0.0, yc + 0.55, z0 + 0.27), 1.4, 0.0, Color(0.22, 0.22, 0.24))
		_texto_en(I18n.t("GALA SUSPENDIDA"), Vector3(0.0, yc - 0.75, z0 + 0.27), 6.4, 64,
			CareerTheme.DANGER)
		return
	_caja(Vector3(7.6, alto, 0.02), Vector3(0.0, yc, z0 + 0.25), _mat_luz(_kit.darkened(0.72)))
	_caja(Vector3(7.6, 0.55, 0.022), Vector3(0.0, y0 + 0.7, z0 + 0.255), _mat_luz(_kit.darkened(0.35)))



	_escudo_en(Vector3(0.0, yc + 0.35, z0 + 0.27), 1.8, 0.0)
	for s in [-1.0, 1.0]:
		_caja(Vector3(0.5, alto, 0.12), Vector3(float(s) * 4.35, yc, z0 + 0.2), _mat_luz(_kit))
		_caja(Vector3(0.14, alto, 0.13), Vector3(float(s) * 4.35, yc, z0 + 0.21), _mat_luz(_kit2))





func _lona(z0: float, st_h: float) -> void:
	var y0: float = st_h + 0.55
	var yc: float = y0 + 1.25
	_caja(Vector3(5.2, 2.5, 0.03), Vector3(0.0, yc, z0 + 0.12), _mat(_kit, 0.9))
	_caja(Vector3(5.2, 0.28, 0.032), Vector3(0.0, y0 + 0.35, z0 + 0.125), _mat(_kit2, 0.9))
	for s in [-1.0, 1.0]:
		_caja(Vector3(0.05, 2.9, 0.05), Vector3(float(s) * 2.65, st_h + 1.45, z0 + 0.14),
			_mat(Color("b9bcc2"), 0.4))
		_caja(Vector3(0.36, 0.04, 0.3), Vector3(float(s) * 2.65, st_h + 0.02, z0 + 0.2),
			_mat(Color("30333a"), 0.4))


	_escudo_en(Vector3(0.0, yc + 0.6, z0 + 0.15), 1.2, 0.0)
	if _susp:
		_texto_en(I18n.t("GALA SUSPENDIDA"), Vector3(0.0, yc - 0.55, z0 + 0.16), 2.4, 64,
			CareerTheme.DANGER, Color("f3f1ea"))




func _bandera(z0: float) -> void:
	_caja(Vector3(2.6, 0.75, 0.02), Vector3(0.0, 2.33, z0 + 0.03), _mat(_kit, 0.9))
	_caja(Vector3(2.6, 0.75, 0.02), Vector3(0.0, 1.58, z0 + 0.03), _mat(_kit2, 0.9))
	_escudo_en(Vector3(0.0, 1.95, z0 + 0.05), 1.05, 0.0)
	if _susp:
		_texto_en(I18n.t("GALA SUSPENDIDA"), Vector3(0.0, 1.15, z0 + 0.06), 1.4, 64,
			CareerTheme.DANGER, Color("f3f1ea"))


func _atril(base: Vector3) -> void:
	var madera: StandardMaterial3D = _mat(Color("3b2619") if _div == 1 else Color("6b4a2e"), 0.6)
	_caja(Vector3(0.7, 1.1, 0.48), base + Vector3(0.0, 0.55, 0.0), madera)
	_caja(Vector3(0.78, 0.05, 0.56), base + Vector3(0.0, 1.12, 0.0), madera)
	_escudo_en(base + Vector3(0.0, 0.66, 0.25), 0.36, 0.0)
	_caja(Vector3(0.02, 0.32, 0.02), base + Vector3(0.12, 1.3, 0.1), _mat(Color("222222"), 0.4))
	_caja(Vector3(0.05, 0.07, 0.05), base + Vector3(0.12, 1.48, 0.14), _mat(Color("111111"), 0.4))




func _flores(base: Vector3) -> void:
	_caja(Vector3(0.16, 0.95, 0.16), base + Vector3(0.0, 0.475, 0.0), _mat(Color("c9a24a"), 0.3))
	var bl: Array[Transform3D] = []
	var cl: Array[Transform3D] = []
	for i in 7:
		var a: float = float(i) / 7.0 * TAU
		var off: Vector3 = Vector3(cos(a) * 0.2, 1.05 + 0.1 * sin(a * 2.0), sin(a) * 0.2)
		(cl if i % 3 == 0 else bl).append(Transform3D(Basis(), base + off))
	bl.append(Transform3D(Basis(), base + Vector3(0.0, 1.22, 0.0)))
	_lote(_sm(0.13), _mat(Color("f4f0e6"), 0.9), bl)
	_lote(_sm(0.11), _mat(_kit, 0.9), cl)



func _globos(base: Vector3) -> void:
	var a: Array[Transform3D] = []
	var b: Array[Transform3D] = []
	var c: Array[Transform3D] = []
	for i in 6:
		var p: Vector3 = base + Vector3(rng.randf_range(-0.25, 0.25), 1.7 + float(i % 3) * 0.28,
			rng.randf_range(-0.2, 0.2))
		match i % 3:
			0:
				a.append(Transform3D(Basis(), p))
			1:
				b.append(Transform3D(Basis(), p))
			_:
				c.append(Transform3D(Basis(), p))
	_lote(_sm(0.17), _mat(_kit, 0.4), a)
	_lote(_sm(0.17), _mat(_kit2, 0.4), b)
	_lote(_sm(0.17), _mat(Color("f4f0e6"), 0.4), c)
	_caja(Vector3(0.01, 1.6, 0.01), base + Vector3(0.0, 0.8, 0.0), _mat(Color("dddddd"), 0.9))





func _centros() -> Array:
	var out: Array = []
	for rz in _sala.get("rows", []):
		for cx in _sala.get("cols", []):
			out.append(Vector3(float(cx), 0.0, float(rz)))
	return out


func _build_tables() -> void:
	if _sala.has("tramos"):
		_tablones()
	else:
		_redondas()


func _redondas() -> void:
	var r: float = _f("mesa_r")
	var centros: Array = _centros()
	var cuerpos: Array[Transform3D] = []
	for c in centros:
		cuerpos.append(Transform3D(Basis(),(c as Vector3) + Vector3(0.0, MESA_H * 0.5, 0.0)))
	if _susp:

		var tapas: Array[Transform3D] = []
		var pies: Array[Transform3D] = []
		var bases: Array[Transform3D] = []
		for c in centros:
			var v: Vector3 = c
			tapas.append(Transform3D(Basis(), v + Vector3(0.0, MESA_H - 0.025, 0.0)))
			pies.append(Transform3D(Basis(), v + Vector3(0.0,(MESA_H - 0.05) * 0.5, 0.0)))
			bases.append(Transform3D(Basis(), v + Vector3(0.0, 0.02, 0.0)))
		_lote(_cm(r, r, 0.05, 20), _mat(Color("5b4331"), 0.7), tapas)
		_lote(_cm(0.06, 0.06, MESA_H - 0.05, 8), _mat(Color("2a2a2e"), 0.5), pies)
		_lote(_cm(0.3, 0.34, 0.04, 12), _mat(Color("2a2a2e"), 0.5), bases)
		return

	_lote(_cm(r, r, MESA_H, 20), _mat(Color("ecebe4") if _div == 1 else _kit.darkened(0.12), 0.95),
		cuerpos)
	var ramo: Array[Transform3D] = []
	var ramo2: Array[Transform3D] = []
	var velas: Array[Transform3D] = []
	var llamas: Array[Transform3D] = []
	var cub: Array[Transform3D] = []
	for c in centros:
		var v: Vector3 = c
		if _liga:
			_centro_de_mesa(v)
			for k in 2:
				var pv2: Vector3 = v + Vector3(-0.22 + 0.44 * float(k), 0.0, 0.12)
				velas.append(Transform3D(Basis(), pv2 + Vector3(0.0, MESA_H + 0.07, 0.0)))
				llamas.append(Transform3D(Basis(), pv2 + Vector3(0.0, MESA_H + 0.16, 0.0)))
		elif _div == 1:




			ramo.append(Transform3D(Basis(), v + Vector3(0.0, MESA_H + 0.1, 0.0)))
			ramo2.append(Transform3D(Basis(), v + Vector3(0.09, MESA_H + 0.08, 0.05)))
			for k in 3:
				var a: float = float(k) / 3.0 * TAU + 0.4
				var pv: Vector3 = v + Vector3(cos(a) * 0.24, 0.0, sin(a) * 0.24)
				velas.append(Transform3D(Basis(), pv + Vector3(0.0, MESA_H + 0.07, 0.0)))
				llamas.append(Transform3D(Basis(), pv + Vector3(0.0, MESA_H + 0.16, 0.0)))
		else:

			cub.append(Transform3D(Basis(Vector3.UP, PI * 0.25), v + Vector3(0.0, MESA_H + 0.003, 0.0)))
			ramo.append(Transform3D(Basis(), v + Vector3(0.0, MESA_H + 0.13, 0.0)))
			velas.append(Transform3D(Basis(), v + Vector3(0.14, MESA_H + 0.06, 0.1)))
			llamas.append(Transform3D(Basis(), v + Vector3(0.14, MESA_H + 0.14, 0.1)))
	_lote(_bm(Vector3(r * 1.3, 0.006, r * 1.3)), _mat(Color("f2efe6"), 0.95), cub)
	_lote(_sm(0.15 if _div == 1 else 0.11), _mat(Color("f4f0e6") if _div == 1 else _kit2, 0.9), ramo)
	_lote(_sm(0.09), _mat(_kit, 0.9), ramo2)
	_lote(_cm(0.022, 0.022, 0.14, 6), _mat(Color("f1ead8"), 0.8), velas)
	_lote(_sm(0.022), _mat_luz(Color("ffcf7a")), llamas)





func _tablones() -> void:
	var rows: Array = _sala["rows"]
	var tramos: Array = _sala["tramos"]
	var largo: float = float(tramos[0][1]) - float(tramos[0][0])
	var tops: Array[Transform3D] = []
	var patas: Array[Transform3D] = []
	var botellas: Array[Transform3D] = []
	for rz in rows:
		for tr in tramos:
			var cx: float =(float(tr[0]) + float(tr[1])) * 0.5
			tops.append(Transform3D(Basis(), Vector3(cx, MESA_H * 0.5 if not _susp else MESA_H - 0.02,
				float(rz))))
			for s in [-1.0, 1.0]:
				patas.append(Transform3D(Basis(), Vector3(cx + float(s) *(largo * 0.5 - 0.3),
					(MESA_H - 0.04) * 0.5, float(rz))))
			if not _susp:
				_centro_de_mesa(Vector3(cx, 0.0, float(rz)))
				for k in 2:
					botellas.append(Transform3D(Basis(), Vector3(cx - 0.6 + float(k) * 1.1,
						MESA_H + 0.14, float(rz) - 0.05)))
	if _susp:
		_lote(_bm(Vector3(largo, 0.04, TABLON_D)), _mat(Color("a07d52"), 0.8), tops)
		_lote(_bm(Vector3(0.05, MESA_H - 0.04, TABLON_D - 0.1)), _mat(Color("4a4c52"), 0.6), patas)
		return
	_lote(_bm(Vector3(largo, MESA_H, TABLON_D)), _mat(Color("f1f0ea"), 0.95), tops)
	_lote(_cm(0.04, 0.045, 0.28, 8), _mat(Color("5a3a22"), 0.3), botellas)




func _build_lights() -> void:
	var h: float = _f("h")
	var z0: float = _f("z0")
	var rows: Array = _sala["rows"]
	if _susp:
		_luz_de_obra()
	else:
		match _div:
			1:
				_aranas(h, rows)
			2:
				_tambores(h, rows)
			_:
				_fluorescentes(h, z0)


	var sp: Vector3 = _sp()
	for sx in [-1.0, 1.0]:
		var s: SpotLight3D = SpotLight3D.new()
		s.light_color = Color(1.0, 0.96, 0.88)
		s.light_energy = 0.0
		s.spot_range = 16.0
		s.spot_angle = 22.0
		s.shadow_enabled = false
		var from: Vector3 = Vector3(float(sx) * 2.4, h - 0.3, sp.z + 4.2)
		s.look_at_from_position(from, sp + Vector3(0.0, 1.0, 0.0))
		viewport.add_child(s)
		_stage_spots.append(s)
		if _div == 1 and not _susp:
			var b: MeshInstance3D = make_beam(from, sp, 0.12, 1.2, Color(1.0, 0.95, 0.85), 0.05)
			b.visible = false
			_beams.append(b)

	_follow = SpotLight3D.new()
	_follow.light_color = Color(1.0, 0.97, 0.9)
	_follow.light_energy = 0.0
	_follow.spot_range = 18.0
	_follow.spot_angle = 11.0
	_follow.shadow_enabled = false
	viewport.add_child(_follow)





func _aranas(h: float, rows: Array) -> void:
	var cris: Array[Transform3D] = []
	var bombillas: Array[Transform3D] = []
	var aros: Array[Transform3D] = []
	var aros2: Array[Transform3D] = []
	var varas: Array[Transform3D] = []
	var sitios: Array = []
	for i in mini(3, rows.size()):
		var zz: float = float(rows[i]) + 1.75
		sitios.append(Vector3(0.0, h - 1.5, zz))
		if i >= 1:
			sitios.append(Vector3(-4.35, h - 1.4, zz))
			sitios.append(Vector3(4.35, h - 1.4, zz))
		_lamps.append(_omni(Vector3(0.0, h - 1.8, zz), Color("ffd8a8"), 1.25, 9.5))
	for s in sitios:
		var p: Vector3 = s
		varas.append(Transform3D(Basis(), Vector3(p.x,(h + p.y) * 0.5, p.z)))
		aros.append(Transform3D(Basis(), p))
		aros2.append(Transform3D(Basis(), p + Vector3(0.0, -0.16, 0.0)))
		for k in 12:
			var a: float = float(k) / 12.0 * TAU
			cris.append(Transform3D(Basis(), p + Vector3(cos(a) * 0.43, -0.08, sin(a) * 0.43)))
		for k in 7:
			var a: float = float(k) / 7.0 * TAU
			cris.append(Transform3D(Basis(), p + Vector3(cos(a) * 0.2, -0.32, sin(a) * 0.2)))
		cris.append(Transform3D(Basis(), p + Vector3(0.0, -0.5, 0.0)))
		for k in 8:
			var a: float = float(k) / 8.0 * TAU + 0.2
			bombillas.append(Transform3D(Basis(), p + Vector3(cos(a) * 0.43, 0.06, sin(a) * 0.43)))
	var oro: StandardMaterial3D = _mat(Color("c9a24a"), 0.3)
	_lote(_bm(Vector3(0.03, h -(h - 1.5), 0.03)), oro, varas)
	var t1: TorusMesh = TorusMesh.new()
	t1.inner_radius = 0.4
	t1.outer_radius = 0.46
	_lote(t1, oro, aros)
	var t2: TorusMesh = TorusMesh.new()
	t2.inner_radius = 0.18
	t2.outer_radius = 0.23
	_lote(t2, oro, aros2)
	_lote(_sm(0.045), _mat_luz(Color("fff4de")), cris)
	_lote(_sm(0.04), _mat_luz(Color("ffcf8a")), bombillas)



func _tambores(h: float, rows: Array) -> void:
	var pantallas: Array[Transform3D] = []
	var bocas: Array[Transform3D] = []
	var cables: Array[Transform3D] = []
	for i in rows.size():
		var zz: float = float(rows[i]) + 1.55
		for xx in [-3.3, 0.0, 3.3]:
			var p: Vector3 = Vector3(float(xx), h - 0.75, zz)
			pantallas.append(Transform3D(Basis(), p))
			bocas.append(Transform3D(Basis(), p + Vector3(0.0, -0.16, 0.0)))
			cables.append(Transform3D(Basis(), Vector3(p.x, h - 0.3, p.z)))
		_lamps.append(_omni(Vector3(0.0, h - 1.0, zz), Color("ffd9ad"), 1.0, 7.5))
	_lote(_cm(0.36, 0.36, 0.3, 16), _mat(Color("efe4cf"), 0.95), pantallas)
	_lote(_cm(0.33, 0.33, 0.01, 16), _mat_luz(Color("fff0d2")), bocas)
	_lote(_bm(Vector3(0.012, 0.6, 0.012)), _mat(Color("2a2a2a"), 0.6), cables)




func _fluorescentes(h: float, z0: float) -> void:
	var cajas: Array[Transform3D] = []
	var tubos: Array[Transform3D] = []
	var z: float = z0 + 2.4
	while z < _f("z1") - 0.6:
		for xx in [-2.4, 2.4]:
			cajas.append(Transform3D(Basis(), Vector3(float(xx), h - 0.05, z)))
			tubos.append(Transform3D(Basis(), Vector3(float(xx), h - 0.1, z)))
		z += 3.3
	_lote(_bm(Vector3(1.3, 0.07, 0.22)), _mat(Color("e6e6e2"), 0.5), cajas)
	_lote(_bm(Vector3(1.22, 0.035, 0.08)), _mat_luz(Color("f4f8ff")), tubos)
	_lamps.append(_omni(Vector3(0.0, h - 0.3, z0 + 3.2), Color("e8f0ff"), 1.1, 9.0))
	_lamps.append(_omni(Vector3(0.0, h - 0.3, z0 + 8.0), Color("e8f0ff"), 1.0, 9.0))





func _luz_de_obra() -> void:
	var h: float = _f("h")
	var st_z1: float = _f("st_z1")
	var p: Vector3 = Vector3(0.6, h - 0.9, st_z1 + 0.9)
	_caja(Vector3(0.01, 0.9, 0.01), Vector3(p.x, h - 0.45, p.z), _mat(Color("1a1a1a"), 0.6))
	var bulbo: MeshInstance3D = MeshInstance3D.new()
	bulbo.mesh = _sm(0.05)
	bulbo.material_override = _mat_luz(Color("ffe2a8"))
	bulbo.position = p
	viewport.add_child(bulbo)
	_omni(p, Color("ffd79a"), 2.4, 12.0)



	var puerta: SpotLight3D = SpotLight3D.new()
	puerta.light_color = Color("dfe6ee")
	puerta.light_energy = 1.6
	puerta.spot_range = 16.0
	puerta.spot_angle = 28.0
	puerta.shadow_enabled = false
	puerta.look_at_from_position(Vector3(-1.2, 2.2, _f("z1") - 0.3), Vector3(0.0, 0.6, st_z1 + 1.5))
	viewport.add_child(puerta)
	var cubo: Vector3 = Vector3(-1.5, 0.0, st_z1 + 1.1)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = _cm(0.16, 0.13, 0.3, 12)
	mi.material_override = _mat(Color("7b8088"), 0.5)
	mi.position = cubo + Vector3(0.0, 0.15, 0.0)
	viewport.add_child(mi)
	var palo: MeshInstance3D = _caja(Vector3(0.025, 1.3, 0.025), cubo + Vector3(0.25, 0.62, 0.05),
		_mat(Color("9a7b55"), 0.7))
	palo.rotation_degrees.z = -12.0






func _arco(cx: float, cz: float) -> Array:
	var out: Array = []
	var r: float = _f("mesa_r") + SEAT_GAP
	for a in SEAT_ANG:
		var rad: float = deg_to_rad(a)
		var d: Vector3 = Vector3(sin(rad), 0.0, cos(rad))
		out.append([Vector3(cx, 0.0, cz) + d * r, d])
	return out




func _fila(x0: float, x1: float, z: float) -> Array:
	var out: Array = []
	var x: float = x0 + TABLON_PASO * 0.5
	while x < x1 - 0.2:
		out.append([Vector3(x, 0.0, z + TABLON_D * 0.5 + SEAT_GAP), Vector3(0.0, 0.0, 1.0)])
		x += TABLON_PASO
	return out




func _asientos_equipo() -> Array:
	var rows: Array = _sala["rows"]
	if _sala.has("tramos"):
		var tr: Array = _sala["tramos"]
		return _fila(float(tr[0][0]), float(tr[0][1]), float(rows[0])) \
				+ _fila(float(tr[1][0]), float(tr[1][1]), float(rows[0]))
	var cols: Array = _sala["cols"]
	return _arco(float(cols[1]), float(rows[0])) + _arco(float(cols[2]), float(rows[0]))



func _asientos_invitados() -> Array:
	var out: Array = []
	var rows: Array = _sala["rows"]
	for ri in rows.size():
		if _sala.has("tramos"):
			if ri == 0:
				continue
			for tr in _sala["tramos"]:
				for s in _fila(float(tr[0]), float(tr[1]), float(rows[ri])):
					out.append([s[0], s[1], ri,
						_mesa_key((float(tr[0]) + float(tr[1])) * 0.5, float(rows[ri]))])
		else:
			var cols: Array = _sala["cols"]
			for ci in cols.size():
				if ri == 0 and (ci == 1 or ci == 2):
					continue
				for s in _arco(float(cols[ci]), float(rows[ri])):
					out.append([s[0], s[1], ri, _mesa_key(float(cols[ci]), float(rows[ri]))])
	return out




func _frames_de(persona: Dictionary) -> SpriteFrames:
	var you: bool = bool(persona.get("you", false))
	var key: String = "@yo" if you else str(persona.get("name", ""))
	if _frames_memo.has(key):
		return _frames_memo[key]



	var cfg: Dictionary = GameState.team_custom.duplicate() if you \
			else KitRecolor.appearance_for(key if not key.is_empty() else "galaclub", {})
	var fr: SpriteFrames = player_frames(cfg, "south", ESMOQUIN_SHEET, true)
	esmoquin_clap(fr, cfg)
	_frames_memo[key] = fr
	return fr


func _figura(frames: SpriteFrames, pos: Vector3, sentado: bool, mod: Color,
		suelo: float = 0.0) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = frames


	var y: float = suelo + feet_offset(spr.pixel_size, ESMOQUIN_SHEET + "00.png")
	if sentado:
		y -= SIT_DROP
	spr.position = Vector3(pos.x, y, pos.z)
	spr.play("idle")

	spr.frame = rng.randi() % maxi(frames.get_frame_count("idle"), 1)
	spr.speed_scale = rng.randf_range(0.85, 1.15)
	spr.modulate = mod
	viewport.add_child(spr)
	if sentado:
		_publico.append(spr)
		_base_mod[spr] = mod
		_y_sentado[spr] = y
	return spr


func _build_people() -> void:
	var luz: Color = LUZ_GENTE.get(_div, Color.WHITE) as Color
	var seats: Array = _asientos_equipo()
	var ocupado: Dictionary = {}
	var sentados: Dictionary = {}
	var tu_sentado: bool = false
	var fijos: Dictionary = {"POR": SEAT_POR, "DEF": SEAT_DEF, "MED": SEAT_MED, "DEL": SEAT_DEL}
	_figs.resize(_winners.size())
	_seat_of.resize(_winners.size())

	for i in _winners.size():
		var w: Dictionary = _winners[i]
		var idx: int = int(fijos.get(str(w.get("line", "")), -1))
		if idx < 0 or idx >= seats.size() or ocupado.has(idx):
			continue
		var seat: Array = seats[idx]
		_figs[i] = _figura(_frames_de(w), seat[0], true, luz)
		_seat_of[i] = seat[0]
		_sillas.append(seat)
		ocupado[idx] = true
		sentados[str(w.get("name", ""))] = true
		if bool(w.get("you", false)):
			tu_sentado = true

	if not tu_sentado and SEAT_YOU < seats.size() and not ocupado.has(SEAT_YOU):
		var yo: Array = seats[SEAT_YOU]
		_figura(_frames_de({"you": true}), yo[0], true, luz)
		_sillas.append(yo)
		ocupado[SEAT_YOU] = true


	var libres: Array = []
	for i in seats.size():
		if not ocupado.has(i):
			libres.append(i)
	var k: int = 0
	for p in _companeros_de_mesa():
		if k >= libres.size():
			break
		var nm: String = str((p as Dictionary).get("name", ""))
		if nm.is_empty() or sentados.has(nm):
			continue
		var seat: Array = seats[libres[k]]
		_figura(_frames_de({"name": nm}), seat[0], true, luz)
		_sillas.append(seat)
		sentados[nm] = true
		k += 1


	var pool: Array = []
	for i in EXTRAS:
		pool.append(_frames_de({"name": "galaclub_invitado_%d" % i}))
	var n: int = 0


	var gente: Dictionary = {}
	var turno: Dictionary = {}
	for s in _asientos_invitados():
		var fila: int = int(s[2])
		var dim: float = clampf(1.0 - FONDO_SALA * float(fila), 0.55, 1.0)
		var m: Color = Color(luz.r * dim, luz.g * dim, luz.b * minf(dim * 1.05, 1.0))
		var frames: SpriteFrames = pool[(n * 5 + fila) % pool.size()]
		var club: String = str(_mesa_club.get(s[3], ""))
		if not club.is_empty():
			if not gente.has(club):
				gente[club] = squad_people(club, 8, false, "", true)
			var lista: Array = gente[club]
			var k2: int = int(turno.get(club, 0))
			turno[club] = k2 + 1
			while k2 < lista.size() and sentados.has(str((lista[k2] as Dictionary).get("name", ""))):
				k2 += 1
				turno[club] = k2 + 1
			if k2 < lista.size():
				var nm2: String = str((lista[k2] as Dictionary).get("name", ""))
				frames = _frames_de({"name": nm2})
				sentados[nm2] = true
		_figura(frames, s[0], true, m)
		_sillas.append([s[0], s[1]])
		n += 1


	if not _best.is_empty():
		_monta_fila_tarima()





func _companeros_de_mesa() -> Array:
	var mio: String = club_del_acto()
	if not _liga:
		return squad_people(mio, 18, true)
	var clubes: Array[String] = []
	for f in _winners + [_best]:
		var c: String = str((f as Dictionary).get("team", ""))
		if not c.is_empty() and not clubes.has(c) and not Teams.by_id(c).is_empty():
			clubes.append(c)
	if not clubes.has(mio):
		clubes.append(mio)
	var listas: Array = []
	for c in clubes:
		listas.append(squad_people(c, 6, c == mio, "", true))
	var out: Array = []
	for i in 6:
		for l in listas:
			if i <(l as Array).size():
				out.append((l as Array)[i])
	return out




func _mesa_key(cx: float, cz: float) -> String:
	return "%d,%d" % [roundi(cx * 100.0), roundi(cz * 100.0)]




func _reparte_mesas() -> void:
	_mesa_club.clear()
	if not _liga or _susp:
		return
	var clubes: Array = []
	for t in Teams.teams_in(_pais(), _div):
		var id: String = str((t as Dictionary).get("id", ""))
		if not id.is_empty():
			clubes.append(id)
	if clubes.is_empty():
		return
	var mesas: Array = []
	var rows: Array = _sala["rows"]
	for ri in rows.size():
		if _sala.has("tramos"):
			if ri == 0:
				continue
			for tr in _sala["tramos"]:
				mesas.append(_mesa_key((float(tr[0]) + float(tr[1])) * 0.5, float(rows[ri])))
		else:
			var cols: Array = _sala["cols"]
			for ci in cols.size():
				if ri == 0 and (ci == 1 or ci == 2):
					continue
				mesas.append(_mesa_key(float(cols[ci]), float(rows[ri])))
	for i in mini(mesas.size(), clubes.size()):
		_mesa_club[mesas[i]] = clubes[i]




func _centro_de_mesa(v: Vector3) -> void:
	if not _liga or _susp:
		return
	var club: String = str(_mesa_club.get(_mesa_key(v.x, v.z), ""))
	var tex: Texture2D = _escudo
	if not club.is_empty():
		tex = _crest_de({"team": club})
	if tex == null:
		return
	_caja(Vector3(0.16, 0.06, 0.16), v + Vector3(0.0, MESA_H + 0.03, 0.0), _mat(Color("1c1c22"), 0.4))
	var s: Sprite3D = Sprite3D.new()
	s.texture = tex
	s.pixel_size = 0.3 / float(maxi(tex.get_width(), 1))
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.pixel_size = 0.26 / float(maxi(tex.get_width(), 1))
	s.position = v + Vector3(0.0, MESA_H + 0.25, 0.0)
	viewport.add_child(s)




	if club.is_empty():
		return
	var nombre: String = PixelText.normalize(CareerTheme.caps(
		str(Teams.by_id(club).get("name", ""))))
	if nombre.is_empty():
		return
	var px: int = 2
	var ancho: int = PixelText.text_width(nombre, px) + 10
	var alto: int = PixelText.GLYPH_H * px + 8
	var img: Image = Image.create(ancho, alto, false, Image.FORMAT_RGBA8)
	img.fill(Color("1c1c22"))
	for x in ancho:
		img.set_pixel(x, 0, Color("c9a44a"))
		img.set_pixel(x, alto - 1, Color("c9a44a"))
	PixelText.draw_text(img, 5, 4, nombre, Color("f1e3b8"), px)
	var chapa: Sprite3D = Sprite3D.new()
	chapa.texture = ImageTexture.create_from_image(img)

	chapa.pixel_size = minf(0.085 / float(alto), 0.6 / float(ancho))
	chapa.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	chapa.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	chapa.position = v + Vector3(0.0, MESA_H + 0.09, 0.0)
	viewport.add_child(chapa)





func _monta_fila_tarima() -> void:
	var gente: Array = []
	var yo_idx: int = -1
	for i in _winners.size():
		gente.append(_winners[i])
		if i == _best_idx:
			yo_idx = i
	if yo_idx < 0:
		yo_idx = gente.size() / 2
		gente.insert(yo_idx, _best)
	var sp: Vector3 = _sp()
	var n: int = gente.size()
	var paso: float = minf(1.05,(_f("st_w") * 0.62) / maxf(float(n - 1), 1.0))
	var z: float = sp.z - 0.85
	for i in n:
		var x: float = sp.x +(float(i) - float(n - 1) * 0.5) * paso
		var pos: Vector3 = Vector3(x, sp.y, z)
		var fig: AnimatedSprite3D = _figura(_frames_de(gente[i]), pos, false, Color.WHITE, sp.y)
		fig.visible = false
		_fila_tarima.append(fig)
		if i == yo_idx:
			_stage_fig = fig
			_avance_desde = fig.position
	if _stage_fig != null:
		_paso_frames(_stage_fig.sprite_frames, _best)




func _avanza() -> void:
	var f: float = clampf((t - _t_avance) / AVANCE, 0.0, 1.0)
	if t < _t_avance:
		return
	var destino: Vector3 = Vector3(_sp().x, _avance_desde.y, _sp().z)
	_stage_fig.position = _avance_desde.lerp(destino, f)
	var anim: String = "walk" if f < 1.0 and _stage_fig.sprite_frames.has_animation("walk") \
			else "idle"
	if _stage_fig.animation != anim:
		_stage_fig.play(anim)
	if f >= 1.0:
		_t_avance = -1.0
		if _big_trophy != null:
			_big_trophy.scale = Vector3.ONE * 1.18
			var back: Tween = create_tween()
			back.tween_property(_big_trophy, "scale", Vector3.ONE, 0.32) \
					.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		sting("fanfare", -6.0)




func _paso_frames(frames: SpriteFrames, f: Dictionary) -> void:
	if frames.has_animation("walk"):
		return
	var cfg: Dictionary = GameState.team_custom.duplicate() if bool(f.get("you", false)) \
			else KitRecolor.appearance_for(str(f.get("name", "")), {})
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	frames.add_animation("walk")
	frames.set_animation_loop("walk", true)
	frames.set_animation_speed("walk", 8.0)
	for i in 6:
		var path: String = "res://assets/sprites/anim/gala_walk_south_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("walk", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("walk") == 0:
		frames.remove_animation("walk")




func _plan_de_pie() -> void:
	if _best_idx < 0 or _best_idx >= _figs.size() or _figs[_best_idx] == null:
		return
	_walker = _figs[_best_idx]
	_t_llega = _t_reveal + DE_PIE





func _build_chairs() -> void:
	var cuerpo: Array[Transform3D] = []
	var respaldo: Array[Transform3D] = []
	var banda: Array[Transform3D] = []
	var patas: Array[Transform3D] = []
	var platos: Array[Transform3D] = []
	var vasos: Array[Transform3D] = []
	var servis: Array[Transform3D] = []
	for s in _sillas:
		var pos: Vector3 = s[0]
		var dir: Vector3 = s[1]
		var b: Basis = Basis(Vector3.UP, atan2(dir.x, dir.z))
		var lado: Vector3 = Vector3(dir.z, 0.0, - dir.x)
		match _div:
			1:

				cuerpo.append(Transform3D(b, pos + Vector3(0.0, 0.235, 0.0)))
				respaldo.append(Transform3D(b, pos + dir * 0.2 + Vector3(0.0, 0.76, 0.0)))
				banda.append(Transform3D(b, pos + dir * 0.2 + Vector3(0.0, 0.72, 0.0)))
			2:
				cuerpo.append(Transform3D(b, pos + Vector3(0.0, 0.45, 0.0)))
				respaldo.append(Transform3D(b, pos + dir * 0.19 + Vector3(0.0, 0.72, 0.0)))
				for lx in [-0.18, 0.18]:
					for lz in [-0.18, 0.18]:
						patas.append(Transform3D(b, pos + b * Vector3(float(lx), 0.225, float(lz))))
			_:
				cuerpo.append(Transform3D(b, pos + Vector3(0.0, 0.45, 0.0)))
				respaldo.append(Transform3D(b, pos + dir * 0.18 + Vector3(0.0, 0.78, 0.0)))
				for lx in [-0.17, 0.17]:
					for lz in [-0.16, 0.16]:
						patas.append(Transform3D(b, pos + b * Vector3(float(lx), 0.225, float(lz))))

		var pl: Vector3 = pos - dir *(SEAT_GAP + 0.18)
		platos.append(Transform3D(Basis(), pl + Vector3(0.0, MESA_H + 0.008, 0.0)))
		vasos.append(Transform3D(Basis(), pl + lado * 0.17 + Vector3(0.0, MESA_H + 0.065, 0.0)))
		if _div != 3:
			servis.append(Transform3D(b, pl - lado * 0.15 + Vector3(0.0, MESA_H + 0.012, 0.0)))
	match _div:
		1:
			_lote(_bm(Vector3(0.46, 0.47, 0.46)), _mat(Color("f1efe8"), 0.95), cuerpo)
			_lote(_bm(Vector3(0.46, 0.56, 0.09)), _mat(Color("f1efe8"), 0.95), respaldo)
			_lote(_bm(Vector3(0.48, 0.1, 0.11)), _mat(_kit, 0.8), banda)
		2:
			var madera: StandardMaterial3D = _mat(Color("5e3f28"), 0.7)
			_lote(_bm(Vector3(0.42, 0.05, 0.42)), madera, cuerpo)
			_lote(_bm(Vector3(0.4, 0.46, 0.04)), madera, respaldo)
			_lote(_bm(Vector3(0.035, 0.45, 0.035)), madera, patas)
		_:
			var metal: StandardMaterial3D = _mat(Color("6c6f75"), 0.45)
			_lote(_bm(Vector3(0.4, 0.03, 0.38)), metal, cuerpo)
			_lote(_bm(Vector3(0.38, 0.26, 0.02)), metal, respaldo)
			_lote(_bm(Vector3(0.025, 0.45, 0.025)), metal, patas)
	_lote(_cm(0.13, 0.11, 0.014, 14), _mat(Color("f7f6f1") if _div != 3 else Color("fbfbf8"), 0.5),
		platos)
	_lote(_cm(0.03, 0.025, 0.13, 8), _mat(Color("d7e4ea") if _div != 3 else _kit, 0.2), vasos)
	_lote(_bm(Vector3(0.09, 0.02, 0.15)), _mat(_kit, 0.9), servis)





func _sillas_patas_arriba() -> void:
	var asiento: Array[Transform3D] = []
	var patas: Array[Transform3D] = []
	var respaldo: Array[Transform3D] = []
	if _sala.has("tramos"):
		var w: float = _f("w")
		var z1: float = _f("z1")
		for s in [-1.0, 1.0]:
			for pila in 2:
				var base: Vector3 = Vector3(float(s) *(w * 0.5 - 0.35), 0.0, z1 - 1.6 - float(pila) * 2.2)
				for k in 7:
					var b: Basis = Basis(Vector3.RIGHT, deg_to_rad(9.0)).rotated(Vector3.UP, PI * 0.5)
					asiento.append(Transform3D(b, base + Vector3(float(s) * -0.04 * float(k), 0.55,
						float(k) * 0.05)))
		_lote(_bm(Vector3(0.4, 1.0, 0.04)), _mat(Color("6c6f75"), 0.45), asiento)
		return
	var r: float = _f("mesa_r")
	for c in _centros():
		var v: Vector3 = c
		for k in 4:
			var a: float = float(k) / 4.0 * TAU + 0.35
			var d: Vector3 = Vector3(sin(a), 0.0, cos(a))
			var b: Basis = Basis(Vector3.UP, atan2(d.x, d.z))
			var p: Vector3 = v + d *(r * 0.45)
			asiento.append(Transform3D(b, p + Vector3(0.0, MESA_H + 0.025, 0.0)))
			for lx in [-0.18, 0.18]:
				for lz in [-0.18, 0.18]:
					patas.append(Transform3D(b, p + b * Vector3(float(lx), MESA_H + 0.27, float(lz))))
			respaldo.append(Transform3D(b, p + d * 0.24 + Vector3(0.0, MESA_H - 0.2, 0.0)))
	var madera: StandardMaterial3D = _mat(Color("5e3f28"), 0.7)
	_lote(_bm(Vector3(0.42, 0.05, 0.42)), madera, asiento)
	_lote(_bm(Vector3(0.035, 0.45, 0.035)), madera, patas)
	_lote(_bm(Vector3(0.4, 0.46, 0.04)), madera, respaldo)







func _build_trophies() -> void:
	var st_h: float = _f("st_h")
	var st_w: float = _f("st_w")
	var st_z1: float = _f("st_z1")
	var tipos: Array[String] = ["club_def", "club_med", "club_del"]
	var sp: Vector3 = _sp()
	if st_h > 0.0:
		var mt: Vector3 = Vector3(- st_w * 0.3, st_h + 0.78, st_z1 - 0.8)
		for i in 3:
			make_trophy(tipos[i], mt + Vector3(-0.6 + 0.6 * float(i), 0.21 - 0.1, 0.0), 0.42, 256,
				null, true)
		var pd: Vector3 = sp + Vector3(0.62, 0.94, 0.35)
		_trophy_y = pd.y + 0.31 - 0.1
		_big_trophy = make_trophy(_trofeo_del_ano(), Vector3(pd.x, _trophy_y, pd.z), 0.62, 256, null, true)
	else:
		var mp: Vector3 = Vector3(0.0, 0.75, st_z1 - 0.55)
		var xs: Array[float] = [-0.85, -0.5, -0.15]
		for i in 3:
			make_trophy(tipos[i], mp + Vector3(xs[i], 0.18 - 0.08, 0.0), 0.36, 256, null, true)
		_trophy_y = mp.y + 0.275 - 0.08
		_big_trophy = make_trophy(_trofeo_del_ano(), Vector3(sp.x + 0.42, _trophy_y, mp.z), 0.55, 256,
			null, true)




func _trofeo_del_ano() -> String:
	return "mvp" if _liga else "club_mejor"




func _alto_cartel() -> float:
	var cv: Dictionary = CARTEL.get(_div, CARTEL[1]) as Dictionary
	return float(cv["w"]) * float(CARTEL_PX.y) / float(CARTEL_PX.x)





func _build_cartel() -> void:
	var cv: Dictionary = CARTEL.get(_div, CARTEL[1]) as Dictionary
	var w: float = float(cv["w"])
	var alto: float = _alto_cartel()
	_cartel_vp = SubViewport.new()
	_cartel_vp.size = CARTEL_PX
	_cartel_vp.disable_3d = true


	_cartel_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(_cartel_vp)
	_pinta_cartel()
	_cartel = Node3D.new()
	_cartel_y = _f("st_h") + float(cv["y"]) + alto * 0.5

	_cartel_alto = _f("h") + alto + 0.25
	_cartel.position = Vector3(0.0, _cartel_alto, _f("st_z1") + float(cv["dz"]))
	viewport.add_child(_cartel)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(w, alto)
	_cartel_mat = StandardMaterial3D.new()
	_cartel_mat.albedo_texture = _cartel_vp.get_texture()
	_cartel_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS


	_cartel_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var lam: MeshInstance3D = MeshInstance3D.new()
	lam.mesh = q
	lam.material_override = _cartel_mat
	lam.position = Vector3(0.0, - alto * 0.5, 0.0)
	_cartel.add_child(lam)

	var bast: MeshInstance3D = MeshInstance3D.new()
	bast.mesh = _bm(Vector3(w + 0.08, alto + 0.08, 0.05))
	bast.material_override = _mat(Color("15161b"), 0.4)
	bast.position = Vector3(0.0, - alto * 0.5, -0.03)
	_cartel.add_child(bast)

	var acero: StandardMaterial3D = _mat(Color("9ea2a8"), 0.3)
	for s in [-1.0, 1.0]:
		var c: MeshInstance3D = MeshInstance3D.new()
		c.mesh = _bm(Vector3(0.014, 8.0, 0.014))
		c.material_override = acero
		c.position = Vector3(float(s) * w * 0.4, 4.0, -0.03)
		_cartel.add_child(c)






func _pinta_cartel() -> void:
	var oro: Color = CareerTheme.MONEY
	var px: Vector2 = Vector2(CARTEL_PX)
	var hoja: Control = Control.new()
	hoja.size = px
	_cartel_vp.add_child(hoja)
	_lienzo(hoja, Rect2(Vector2.ZERO, px), Color("101116"))
	var b: float = 12.0
	for r in [Rect2(0, 0, px.x, b), Rect2(0, px.y - b, px.x, b),
			Rect2(0, 0, b, px.y), Rect2(px.x - b, 0, b, px.y)]:
		_lienzo(hoja, r as Rect2, oro)
	var f: float = 26.0
	for r in [Rect2(f, f, px.x - 2 * f, 3), Rect2(f, px.y - f - 3, px.x - 2 * f, 3),
			Rect2(f, f, 3, px.y - 2 * f), Rect2(px.x - f - 3, f, 3, px.y - 2 * f)]:
		_lienzo(hoja, r as Rect2, oro.darkened(0.45))
	var tag: Label = CareerUi.plain(54, Color("e9e4d6"))
	tag.text = I18n.t("PRESUPUESTO")
	tag.position = Vector2(48, 36)
	tag.size = Vector2(px.x - 96, 66)
	tag.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	tag.clip_text = true
	hoja.add_child(tag)
	_cifra = CareerUi.plain(188, oro)
	_cifra.position = Vector2(48, 92)
	_cifra.size = Vector2(px.x - 96, 200)
	_cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_cifra.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_cifra.clip_text = true
	hoja.add_child(_cifra)
	_pon_cifra(0)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 26)
	fila.position = Vector2(48, 292)
	fila.size = Vector2(px.x - 96, 104)
	hoja.add_child(fila)
	var puesto: Label = CareerUi.plain(60, Color("e9e4d6"))
	puesto.text = I18n.ordinal(int(data.get("pos", 0)))
	puesto.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(puesto)
	for i in clampi(int(data.get("titulos", 0)), 0, ClubFinance.TITULO_MAX):


		var hueco: Control = Control.new()
		hueco.custom_minimum_size = Vector2(104, 104)
		fila.add_child(hueco)
		var ic: TrophyIcon = TrophyIcon.new()
		ic.custom_minimum_size = Vector2(104, 104)
		ic.size = Vector2(104, 104)
		ic.pivot_offset = Vector2(52, 52)


		ic.set_type("copa")
		ic.set_generico(true)
		ic.scale = Vector2.ZERO
		hueco.add_child(ic)
		_copas.append(ic)


func _lienzo(padre: Control, r: Rect2, col: Color) -> void:
	var c: ColorRect = ColorRect.new()
	c.color = col
	c.position = r.position
	c.size = r.size
	padre.add_child(c)


func _pon_cifra(n: int) -> void:
	if n == _cifra_n:
		return
	_cifra_n = n


	_cifra.text = "+%d%%" % n





func _tick_cartel() -> void:
	if t >= _t0:
		_quita_cartel()
		return
	var y: float = _cartel_alto
	var giro: float = 0.0
	if t >= CARTEL_LLEGA:
		var s: float = t - CARTEL_LLEGA
		y = _cartel_y - 0.05 * sin(s * 11.0) * exp(- s * 4.0)
		giro = deg_to_rad(2.2) * sin(s * 5.5) * exp(- s * 2.0)
	elif t >= CARTEL_BAJA:
		var u: float =(t - CARTEL_BAJA) /(CARTEL_LLEGA - CARTEL_BAJA)
		y = lerpf(_cartel_alto, _cartel_y, 1.0 - pow(1.0 - u, 3.0))
	_cartel.position.y = y
	_cartel.rotation.z = giro
	if t >= CUENTA_DE:
		var c: float = clampf((t - CUENTA_DE) / CUENTA_DUR, 0.0, 1.0)
		_pon_cifra(int(round(float(_premio) *(1.0 - pow(1.0 - c, 2.0)))))
		if c >= 1.0 and not _contado:
			_aterriza_cifra()

	var t_copa: float = CUENTA_DE + CUENTA_DUR + 0.25 + 0.3 * float(_copas_dadas)
	if _contado and _copas_dadas < _copas.size() and t >= t_copa:
		var ic: TrophyIcon = _copas[_copas_dadas]
		_copas_dadas += 1
		var tw: Tween = create_tween()
		tw.tween_property(ic, "scale", Vector2(1.18, 1.18), 0.14).set_trans(Tween.TRANS_BACK) \
				.set_ease(Tween.EASE_OUT)
		tw.tween_property(ic, "scale", Vector2.ONE, 0.1)
		sting("ui_pop", -10.0)




func _aterriza_cifra() -> void:
	_contado = true
	_pon_cifra(_premio)
	sting("ui_coin", -5.0)
	_palmas(true, null)
	applause(true, -15.0)
	_cartel_mat.albedo_color = Color(1.7, 1.7, 1.7)
	var tw: Tween = create_tween()
	tw.tween_property(_cartel_mat, "albedo_color", Color.WHITE, 0.35)



func _quita_cartel() -> void:
	if _cartel_fuera:
		return
	_cartel_fuera = true
	_cartel.visible = false
	_cartel_vp.render_target_update_mode = SubViewport.UPDATE_DISABLED
	applause(false)







func _cabe(focus_z: float, deseada: float, yaw: float) -> float:
	var c: float = cos(deg_to_rad(yaw))
	if c > 0.05:
		return minf(deseada,(focus_z - _f("z0") - 0.35) / c)
	if c < -0.05:
		return minf(deseada,(_f("z1") - 0.35 - focus_z) / - c)
	return deseada


func _keys() -> Array:
	var rows: Array = _sala["rows"]
	var h: float = _f("h")
	var st_h: float = _f("st_h")
	var st_z1: float = _f("st_z1")
	var mid_z: float =(float(rows[0]) + float(rows[rows.size() - 1])) * 0.5
	var team_z: float = float(rows[0]) + 0.8
	var cam0: float = st_z1 - 0.5
	var keys: Array = []



	if _cartel != null:
		var cv: Dictionary = CARTEL.get(_div, CARTEL[1]) as Dictionary
		var cz: float = _cartel.position.z
		var cy: float = _cartel_y - _alto_cartel() * 0.5
		var d0: float = _cabe(cz, float(cv["dist"]), 180.0)
		keys.append({"t": 0.0, "dist": d0, "h": cy + 0.35, "yaw": 180.0,
			"aim_y": cy + 0.1, "fov": 50.0, "focus_x": 0.0, "focus_z": cz})
		keys.append({"t": _t0 - 0.02, "dist": d0 * 0.93, "h": cy + 0.3, "yaw": 181.5,
			"aim_y": cy + 0.08, "fov": 48.0, "focus_x": 0.0, "focus_z": cz})


	keys.append({"t": _t0, "dist": mid_z - cam0, "h": minf(h * 0.74, 4.6), "yaw": 7.0,
		"aim_y": 0.9, "fov": 58.0, "focus_x": 0.0, "focus_z": mid_z})

	keys.append({"t": _t0 + T_BAJA, "dist": _cabe(team_z, 5.4, -3.0), "h": minf(2.3, h - 0.5),
		"yaw": -3.0, "aim_y": 1.05, "fov": 46.0, "focus_x": 0.0, "focus_z": team_z})


	for i in _winners.size():
		if _seat_of[i] == null:
			continue
		var p: Vector3 = _seat_of[i]
		var lado: float = -1.0 if p.x < 0.0 else 1.0


		keys.append({"t": _t_aw[i] - 0.45, "dist": _cabe(p.z, 4.4, lado * 9.0),
			"h": minf(1.95, _f("h") - 0.4), "yaw": lado * 9.0, "aim_y": 1.25, "fov": 40.0,
			"focus_x": p.x, "focus_z": p.z})
		keys.append({"t": _t_aw[i] + 1.25, "dist": _cabe(p.z, 4.0, lado * 11.0),
			"h": minf(1.9, _f("h") - 0.4), "yaw": lado * 11.0, "aim_y": 1.3, "fov": 38.0,
			"focus_x": p.x, "focus_z": p.z})

	var d_hush: float = _cabe(team_z, 5.0, 0.0)
	keys.append({"t": _t_hush + 0.1, "dist": d_hush, "h": minf(2.2, h - 0.5), "yaw": 0.0,
		"aim_y": 1.1, "fov": 44.0, "focus_x": 0.0, "focus_z": team_z})
	keys.append({"t": _t_reveal - 0.02, "dist": d_hush * 0.94, "h": minf(2.1, h - 0.5), "yaw": 0.0,
		"aim_y": 1.1, "fov": 43.0, "focus_x": 0.0, "focus_z": team_z})

	if _walker != null:
		var q: Vector3 = _walker.position
		keys.append({"t": _t_reveal + 0.02, "dist": _cabe(q.z, 3.6, 0.0), "h": 1.9,
			"yaw": 0.0, "aim_y": 1.3, "fov": 42.0, "focus_x": q.x, "focus_z": q.z})
		keys.append({"t": _t_llega - 0.02, "dist": _cabe(q.z, 3.1, 0.0), "h": 1.85,
			"yaw": 0.0, "aim_y": 1.4, "fov": 42.0, "focus_x": q.x, "focus_z": q.z})


	var sp: Vector3 = _sp()


	keys.append({"t": _t_llega, "dist": _cabe(sp.z, 7.6, 180.0), "h": st_h + 1.5, "yaw": 180.0,
		"aim_y": st_h + 1.3, "fov": 46.0, "focus_x": sp.x, "focus_z": sp.z - 0.4})
	keys.append({"t": _t_llega + 0.5 + AVANCE, "dist": _cabe(sp.z, 5.0, 181.0), "h": st_h + 1.42,
		"yaw": 181.0, "aim_y": st_h + 1.45, "fov": 44.0, "focus_x": sp.x, "focus_z": sp.z})
	keys.append({"t": _t_llega + 2.2 + AVANCE, "dist": _cabe(sp.z, 5.2, 184.0), "h": st_h + 1.38,
		"yaw": 184.0, "aim_y": st_h + 1.45, "fov": 42.0, "focus_x": sp.x, "focus_z": sp.z})
	return keys




func _keys_susp() -> Array:
	var h: float = _f("h")
	var st_h: float = _f("st_h")
	var zc: float =(_f("z0") + _f("st_z1")) * 0.5
	var lejos: float = minf(_f("z1") - 1.0 - zc, 16.0)
	return [
		{"t": 0.0, "dist": lejos, "h": minf(h * 0.68, 4.2), "yaw": 188.0,
			"aim_y": st_h + 1.5, "fov": 50.0, "focus_x": 0.0, "focus_z": zc},
		{"t": 4.6, "dist": lejos * 0.72, "h": minf(h * 0.6, 3.4), "yaw": 182.0,
			"aim_y": st_h + 1.7, "fov": 46.0, "focus_x": 0.0, "focus_z": zc},
	]


func _flash_pool() -> Array[Vector3]:
	var out: Array[Vector3] = []
	if _div == 1:

		for i in 18:
			out.append(Vector3(_f("st_w") * 0.5 + rng.randf_range(0.2, 1.4),
				rng.randf_range(1.3, 1.9), _f("st_z1") + rng.randf_range(0.3, 2.0)))

	for p in _publico:
		if rng.randf() < 0.35:
			var v: Vector3 =(p as AnimatedSprite3D).position
			out.append(Vector3(v.x, MESA_H + 0.45, v.z - 0.2))
	return out




func _build_ticker() -> void:
	_ticker = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.bg_color = Color(0.047, 0.047, 0.055, 0.88)
	sb.border_color = text_accent()
	_ticker.add_theme_stylebox_override("panel", sb)
	_ticker.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	_ticker.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_ticker.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_ticker.offset_bottom = -300.0


	_ticker.custom_minimum_size = Vector2(700.0, 0.0)
	_ticker.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_ticker.modulate.a = 0.0
	add_child(_ticker)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 18)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_ticker.add_child(row)
	_tk_icon = TrophyIcon.new()
	_tk_icon.custom_minimum_size = Vector2(76, 76)
	_tk_icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_tk_icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(_tk_icon)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(col)
	_tk_tag = CareerUi.plain(CareerTheme.T_DIM, text_accent())
	_tk_tag.clip_text = true
	col.add_child(_tk_tag)
	_tk_name = CareerUi.plain(34, CareerTheme.TEXT)
	_tk_name.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	col.add_child(_tk_name)
	_tk_quien = HBoxContainer.new()
	_tk_quien.add_theme_constant_override("separation", 10)
	_tk_quien.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(_tk_quien)
	_tk_sub = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	_tk_sub.clip_text = true
	col.add_child(_tk_sub)




func _set_ticker(f: Dictionary, best: bool, oculto: bool) -> void:
	if _ticker == null:
		return
	var line: String = str(f.get("line", ""))
	_tk_icon.set_type(_trofeo_del_ano() if best else str(ICONO_LINEA.get(line, "club_mejor")))
	_tk_tag.text = _tag_linea("") if best else _tag_linea(line)
	var you: bool = bool(f.get("you", false)) and not oculto
	_tk_name.text = "..." if oculto else CareerTheme.caps(_nombre(f))


	_tk_name.add_theme_color_override("font_color", CareerTheme.MONEY if you else CareerTheme.TEXT)



	for c in _tk_quien.get_children():
		c.queue_free()
	_tk_quien.visible = not oculto
	if not oculto:
		_quien_en(_tk_quien, f, 22)
	_tk_sub.text = "" if oculto else "%s %.1f" % [I18n.t("media"), float(f.get("avg", 0.0))]

	if _liga and not oculto:
		var club: Dictionary = Teams.by_id(str(f.get("team", "")))
		if not club.is_empty():
			_tk_sub.text = "%s · %s %.1f" % [CareerTheme.caps(Nations.team_label(club)),
				I18n.t("media"), float(f.get("avg", 0.0))]
	_show_ticker(true)
	_ticker.pivot_offset = _ticker.size * 0.5
	_ticker.scale = Vector2(1.08, 1.08)
	var tw: Tween = create_tween()
	tw.tween_property(_ticker, "scale", Vector2.ONE, 0.16) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)




func _quien_en(box: HBoxContainer, f: Dictionary, px: int) -> void:

	if _liga and not str(f.get("team", "")).is_empty():
		var crest: Texture2D = _crest_de(f)
		if crest != null:
			var cr: TextureRect = TextureRect.new()
			cr.texture = crest
			cr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			cr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			cr.custom_minimum_size = Vector2(px, px) * 1.6
			cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
			box.add_child(cr)
	var ovr: int = _ovr_de(f)
	if ovr > 0:
		var badge: OvrBadge = OvrBadge.new()
		badge.setup(ovr, px)
		badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
		box.add_child(badge)
	var pos: String = str(f.get("pos", ""))
	if not pos.is_empty():
		var chip: PanelContainer = CareerUi.pos_chip(pos)
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		box.add_child(chip)






var _ovr_cache: Dictionary = {}
func _ovr_de(f: Dictionary) -> int:
	if f.has("ovr"):
		return int(f["ovr"])
	if bool(f.get("you", false)):
		return Career.ovr_shown()
	var nombre: String = str(f.get("name", ""))
	if _ovr_cache.has(nombre):
		return int(_ovr_cache[nombre])
	var club: String = str(f.get("team", ""))
	if club.is_empty():
		club = str(data.get("club", ""))
	var ovr: int = 0
	for r in Squad.of(club) + Squad.plantel_sin_once(club):
		var pl: Dictionary = r as Dictionary
		if str(pl.get("name", "")) == nombre:
			ovr = SquadMeta.ovr_of(pl, str(pl.get("pos", f.get("pos", ""))))
			break
	_ovr_cache[nombre] = ovr
	return ovr


func _show_ticker(on: bool) -> void:
	if _ticker == null:
		return
	var tw: Tween = create_tween()
	tw.tween_property(_ticker, "modulate:a", 1.0 if on else 0.0, 0.18)




func _tick(_delta: float) -> void:
	if _susp:
		return
	if _cartel != null and not _cartel_fuera:
		_tick_cartel()
	while _dados < _winners.size() and t >= _t_aw[_dados]:
		_entrega(_dados)
	if not _hushed and t >= _t_hush:
		_hush()
	if not _revealed and t >= _t_reveal:
		_reveal()
	if not _llego and t >= _t_llega:
		_llegada()
	if _t_avance >= 0.0 and _stage_fig != null:
		_avanza()
	if _palmas_hasta > 0.0 and t >= _palmas_hasta:
		_palmas(false, null)

	if not _ticker_fuera and t >= card_at - 0.3:
		_ticker_fuera = true
		_show_ticker(false)


	if _big_trophy != null:
		_big_trophy.position.y = _trophy_y + sin(t * 1.15) * 0.012




func _entrega(i: int) -> void:
	_dados = i + 1
	var w: Dictionary = _winners[i]
	var fig: AnimatedSprite3D = _figs[i] if i < _figs.size() else null
	_sienta(_de_pie)
	_de_pie = fig
	if fig != null:
		_levanta(fig)
		var p: Vector3 = _seat_of[i]
		_follow.look_at_from_position(Vector3(p.x * 0.3, _f("h") - 0.35, _f("st_z1") - 0.2),
			p + Vector3(0.0, 1.0, 0.0))
		var tw: Tween = create_tween()
		tw.tween_property(_follow, "light_energy", 6.0, 0.15)
	_luz_sala(SALA_EN_VILO, fig)
	_palmas(true, fig)
	applause(true, -12.0)
	_set_ticker(w, false, false)
	_en_pantalla(i)




func _build_pantalla() -> void:
	if _pant.is_empty():
		return
	var ancho_px: int = 1024
	var alto_px: int = int(round(float(ancho_px) * float(_pant["h"]) / float(_pant["w"])))
	_pant_vp = SubViewport.new()
	_pant_vp.size = Vector2i(ancho_px, alto_px)
	_pant_vp.disable_3d = true
	_pant_vp.render_target_update_mode = SubViewport.UPDATE_DISABLED
	add_child(_pant_vp)
	for i in _winners.size():
		_pant_hojas[i] = _hoja_pantalla(_winners[i], Vector2(ancho_px, alto_px))
	_pant_spr = Sprite3D.new()
	_pant_spr.texture = _pant_vp.get_texture()
	_pant_spr.pixel_size = float(_pant["w"]) / float(ancho_px)
	_pant_spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_pant_spr.shaded = false
	_pant_spr.position = _pant["c"]
	_pant_spr.rotation_degrees.y = 180.0
	_pant_spr.visible = false
	viewport.add_child(_pant_spr)





func _hoja_pantalla(f: Dictionary, tam: Vector2) -> Control:
	var hoja: Control = Control.new()
	hoja.size = tam
	hoja.visible = false
	_pant_vp.add_child(hoja)

	var franjas: int = 8
	for k in franjas:
		var fr: ColorRect = ColorRect.new()
		fr.color = Color("2f6b33") if k % 2 == 0 else Color("357a39")
		fr.position = Vector2(tam.x * float(k) / float(franjas), 0.0)
		fr.size = Vector2(tam.x / float(franjas) + 1.0, tam.y)
		hoja.add_child(fr)

	var velo: ColorRect = ColorRect.new()
	velo.color = Color(0.03, 0.03, 0.04, 0.78)
	velo.position = Vector2(tam.x * 0.46, 0.0)
	velo.size = Vector2(tam.x * 0.54, tam.y)
	hoja.add_child(velo)
	var filo: ColorRect = ColorRect.new()
	filo.color = _kit
	filo.position = Vector2(tam.x * 0.46 - 6.0, 0.0)
	filo.size = Vector2(6.0, tam.y)
	hoja.add_child(filo)

	var pose: Texture2D = _pose_de(f)
	if pose != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = pose
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		tr.position = Vector2(tam.x * 0.02, tam.y * 0.02)
		tr.size = Vector2(tam.x * 0.42, tam.y * 0.96)
		hoja.add_child(tr)

	var col: VBoxContainer = VBoxContainer.new()
	col.position = Vector2(tam.x * 0.5, tam.y * 0.08)
	col.size = Vector2(tam.x * 0.46, tam.y * 0.84)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 14)
	hoja.add_child(col)
	var crest: Texture2D = _crest_de(f)
	if crest != null:
		var cr: TextureRect = TextureRect.new()
		cr.texture = crest
		cr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		cr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		cr.custom_minimum_size = Vector2(0.0, tam.y * 0.28)
		col.add_child(cr)
	var nm: Label = CareerUi.plain(40, CareerTheme.MONEY if bool(f.get("you", false)) \
			else CareerTheme.TEXT)
	nm.text = CareerTheme.caps(_nombre(f))
	nm.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nm.clip_text = true
	col.add_child(nm)
	var quien: HBoxContainer = HBoxContainer.new()
	quien.alignment = BoxContainer.ALIGNMENT_CENTER
	quien.add_theme_constant_override("separation", 14)
	_quien_en(quien, f, 34)
	col.add_child(quien)
	var av: Label = CareerUi.plain(CareerTheme.T_BODY, text_accent())
	av.text = "%s %.1f" % [I18n.t("media"), float(f.get("avg", 0.0))]
	av.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	av.clip_text = true
	col.add_child(av)
	return hoja




func _pose_de(f: Dictionary) -> Texture2D:
	var path: String = str(POSE_LINEA.get(str(f.get("line", "")), POSE_LINEA["DEL"]))
	if not ResourceLoader.exists(path):
		return null
	var club: String = str(f.get("team", ""))
	if club.is_empty():
		club = str(data.get("club", ""))
	var kit: Dictionary = Teams.by_id(club)
	var cfg: Dictionary
	if bool(f.get("you", false)):
		cfg = player_cfg()
	else:
		cfg = person_look(f, kit)
	if str(f.get("line", "")) == "POR":
		cfg = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(club), cfg).merged(
			KitRecolor.traits_for(str(f.get("name", ""))), true)
	return KitRecolor.apply(load(path), cfg)


func _crest_de(f: Dictionary) -> Texture2D:
	var club: String = str(f.get("team", ""))
	if club.is_empty():
		club = str(data.get("club", ""))
	if _crest_memo.has(club):
		return _crest_memo[club]
	var t: Dictionary = Teams.by_id(club)
	var tex: Texture2D = crest_texture(t, 256, true) if not t.is_empty() else null
	_crest_memo[club] = tex
	return tex



func _en_pantalla(i: int) -> void:
	if _pant_spr == null:
		return
	var hay: bool = _pant_hojas.has(i)
	for k in _pant_hojas:
		(_pant_hojas[k] as Control).visible = k == i
	_pant_spr.visible = hay
	_pant_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS if hay \
			else SubViewport.UPDATE_DISABLED
	if hay:



		_pant_spr.modulate = Color(2.4, 2.4, 2.4)
		var tw: Tween = create_tween()
		tw.tween_property(_pant_spr, "modulate", Color(1.35, 1.35, 1.35), 0.25)


func _levanta(fig: AnimatedSprite3D) -> void:
	if _tw_pie != null and _tw_pie.is_valid():
		_tw_pie.kill()
	_tw_pie = create_tween()
	_tw_pie.tween_property(fig, "position:y", float(_y_sentado.get(fig, fig.position.y)) + SIT_DROP,
		0.32).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


func _sienta(fig: AnimatedSprite3D) -> void:
	if fig == null:
		return
	var tw: Tween = create_tween()
	tw.tween_property(fig, "position:y", float(_y_sentado.get(fig, fig.position.y)), 0.26) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)





func _luz_sala(k: float, destacado: AnimatedSprite3D) -> void:
	var tw: Tween = create_tween().set_parallel(true)
	for p in _publico:
		var fig: AnimatedSprite3D = p
		var base: Color = _base_mod.get(fig, Color.WHITE) as Color
		var dest: Color = Color.WHITE if fig == destacado \
				else Color(base.r * k, base.g * k, base.b * k, 1.0)
		tw.tween_property(fig, "modulate", dest, 0.22)




func _palmas(on: bool, salvo: AnimatedSprite3D) -> void:
	for p in _publico:
		var fig: AnimatedSprite3D = p
		if fig == salvo or not fig.sprite_frames.has_animation("clap"):
			continue
		if on:
			fig.play("clap")
			fig.frame = rng.randi() % maxi(fig.sprite_frames.get_frame_count("clap"), 1)
		else:
			fig.play("idle")
	_palmas_hasta =(t + PALMAS) if on else -1.0




func _hush() -> void:
	_hushed = true
	_sienta(_de_pie)
	_de_pie = null
	_palmas(false, null)
	applause(false)
	_luz_sala(0.8, null)
	var tw: Tween = create_tween().set_parallel(true)
	tw.tween_property(_follow, "light_energy", 0.0, 0.3)
	tw.tween_property(_env, "ambient_light_energy", _env.ambient_light_energy * 0.6, 0.4)
	for l in _lamps:
		tw.tween_property(l, "light_energy",(l as Light3D).light_energy * 0.55, 0.4)
	_set_ticker(_best, true, true)




func _reveal() -> void:
	_revealed = true
	_set_ticker(_best, true, false)
	if _walker == null:
		_llegada()
		return


	if _de_pie != _walker:
		_sienta(_de_pie)
	_de_pie = _walker
	_levanta(_walker)
	_en_pantalla(_best_idx)
	var p: Vector3 = _seat_of[_best_idx]
	_follow.look_at_from_position(Vector3(p.x * 0.3, _f("h") - 0.35, _f("st_z1") - 0.2),
		p + Vector3(0.0, 1.0, 0.0))
	var tw: Tween = create_tween()
	tw.tween_property(_follow, "light_energy", 6.0, 0.15)
	_luz_sala(SALA_EN_VILO, _walker)
	sting("fanfare", -4.0)
	applause(true, -9.0)
	_palmas(true, _walker)
	_palmas_hasta = -1.0
	_mesa_en_pie(p)





const MESA_R: float = 1.5
func _mesa_en_pie(p: Vector3) -> void:
	var k: int = 0
	for q in _publico:
		var fig: AnimatedSprite3D = q
		if fig == _walker or not fig.visible:
			continue
		if Vector2(fig.position.x - p.x, fig.position.z - p.z).length() > MESA_R:
			continue
		var tw: Tween = create_tween()
		tw.tween_interval(0.18 + 0.09 * k)
		tw.tween_property(fig, "position:y",
			float(_y_sentado.get(fig, fig.position.y)) + SIT_DROP, 0.32) \
					.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

		create_tween().tween_property(fig, "modulate", Color.WHITE, 0.3)
		k += 1




func _llegada() -> void:
	if _llego:
		return
	_llego = true

	_en_pantalla(-2)

	screen_flash(0.2)
	shake(0.05, 0.3)
	punch_fov(2.5, 0.3)
	if _walker == null:
		sting("fanfare", -4.0)
	else:
		_walker.visible = false
		var tf: Tween = create_tween()
		tf.tween_property(_follow, "light_energy", 0.0, 0.3)
	if _best_idx >= 0 and _best_idx < _figs.size() and _figs[_best_idx] != null:
		(_figs[_best_idx] as AnimatedSprite3D).visible = false
	for fig in _fila_tarima:
		var f3: AnimatedSprite3D = fig
		f3.visible = true
		if f3 != _stage_fig and f3.sprite_frames.has_animation("clap"):
			f3.play("clap")
	if _stage_fig != null:
		_stage_fig.visible = true
		_stage_fig.position = _avance_desde
		_t_avance = t + 0.5
	var tw: Tween = create_tween().set_parallel(true)
	for s in _stage_spots:
		tw.tween_property(s, "light_energy", 5.5, 0.12)
	tw.tween_property(_env, "ambient_light_energy", _env.ambient_light_energy * 1.35, 0.3)
	for b in _beams:
		(b as MeshInstance3D).visible = true
	if _big_trophy != null:
		_big_trophy.scale = Vector3.ONE * 1.18
		var back: Tween = create_tween()
		back.tween_property(_big_trophy, "scale", Vector3.ONE, 0.32) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	set_confetti(true)
	ovation(-4.0 if _div == 1 else -9.0)
	applause(true, -9.0)
	_palmas(true, null)
	_palmas_hasta = -1.0




func _skipped() -> void:
	if _susp:
		return
	if _cartel != null:
		_quita_cartel()
	if _tw_pie != null and _tw_pie.is_valid():
		_tw_pie.kill()
	for fig in _y_sentado.keys():
		(fig as AnimatedSprite3D).position.y = float(_y_sentado[fig])
	_de_pie = null
	_dados = _winners.size()
	_hushed = true
	if not _revealed:
		_reveal()
	_llegada()
	_ticker_fuera = true
	_show_ticker(false)




func _build_card() -> void:
	make_card(_t_llega + CARD_TRAS)
	if _best.is_empty():
		card_title(I18n.t("GALA DEL CLUB"), 40)
		card_cta(I18n.t("SEGUIR"))
		return
	card_title(CareerTheme.caps(_nombre(_best)), 40)
	card_sub(_tag_linea(""))
	if _liga:
		var club: Dictionary = Teams.by_id(str(_best.get("team", "")))
		if not club.is_empty():
			card_club(club)


	card_stats([
		{"v": "%.1f" % float(_best.get("avg", 0.0)), "k": I18n.t("media")},
		{"v": str(int(_best.get("goals", 0))), "k": I18n.t("goles")},
		{"v": str(int(_best.get("assists", 0))), "k": I18n.t("asist.")},
		{"v": str(int(_best.get("gp", 0))), "k": I18n.t("partidos")},
	])
	for w in _winners:
		_card_fila(w as Dictionary)
	card_reward(int(data.get("pts", 0)), int(data.get("pts_xp", 0)))
	card_note(_nota())
	card_cta(I18n.t("SEGUIR"))



func _card_fila(w: Dictionary) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var line: String = str(w.get("line", ""))
	var ic: TrophyIcon = TrophyIcon.new()
	ic.custom_minimum_size = Vector2(44, 44)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.set_type(str(ICONO_LINEA.get(line, "club_mejor")))
	row.add_child(ic)
	var tag: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	tag.text = _tag_linea(line)
	tag.clip_text = true
	tag.custom_minimum_size = Vector2(272, 0)
	tag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(tag)
	var quien: HBoxContainer = HBoxContainer.new()
	quien.add_theme_constant_override("separation", 6)
	quien.mouse_filter = Control.MOUSE_FILTER_IGNORE
	quien.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_quien_en(quien, w, 16)
	row.add_child(quien)
	var nm: Label = CareerUi.plain(CareerTheme.T_BODY,
		CareerTheme.MONEY if bool(w.get("you", false)) else CareerTheme.TEXT)
	nm.text = CareerTheme.caps(_nombre(w))
	nm.clip_text = true
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nm.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(nm)
	var av: Label = CareerUi.plain(CareerTheme.T_BODY, text_accent())
	av.text = "%.1f" % float(w.get("avg", 0.0))
	av.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(av)
	card_box.add_child(row)




func _nota() -> String:
	if _liga:
		if bool(_best.get("you", false)):
			return I18n.t("La liga te elige su mejor jugador de la temporada.")
		for w in _winners:
			if bool((w as Dictionary).get("you", false)):
				return I18n.tf("El mejor de tu línea en toda la liga. El del año fue para {0}.",
					[_nombre(_best)])
		return I18n.tf("La liga eligió a {0}. El año que viene, la gala también es tuya.",
			[_nombre(_best)])
	if bool(_best.get("you", false)):
		return I18n.t("Tu vestuario te eligió el mejor de la temporada.")
	for w in _winners:
		if bool((w as Dictionary).get("you", false)):
			return I18n.tf("El mejor de tu línea. El del año fue para {0}.", [_nombre(_best)])
	return I18n.tf("El vestuario eligió a {0}. La próxima gala se empieza a ganar en agosto.",
		[_nombre(_best)])




func _build_suspended() -> void:
	_sillas_patas_arriba()
	make_camera(_keys_susp(), 46.0)
	orbit_speed = -0.25
	make_chyron(I18n.t("GALA DEL CLUB"), I18n.t("SUSPENDIDA"), team(), T_SUSP_CHYRON)
	make_card(T_SUSP_CARD)
	card_title(I18n.t("TROFEOS SUSPENDIDOS"), 40)
	card_club(team())
	var stats: Array = []
	var pos: int = int(data.get("pos", 0))
	if pos > 0:
		stats.append({"v": I18n.ordinal(pos), "k": I18n.t("puesto")})
	var total: int = int(data.get("total", 0))
	if total > 0:
		stats.append({"v": "%d/%d" % [int(data.get("met", 0)), total], "k": I18n.t("objetivos")})
	if not stats.is_empty():
		card_stats(stats)
	if str(data.get("reason", "")) == "descenso":
		card_note(I18n.t("El club bajó de categoría. La directiva suspende los premios del año por el mal rendimiento del equipo."))
	else:
		card_note(I18n.t("El club no cumplió ninguno de sus objetivos. La directiva suspende los premios del año por el mal rendimiento del equipo."))
	card_cta(I18n.t("SEGUIR"))
