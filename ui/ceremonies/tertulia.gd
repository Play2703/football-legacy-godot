extends "res://ui/ceremonies/deadline_night.gd"


























const MESA_W: float = 3.95


const SITIO: Dictionary = {
	Tertulia.EXJUGADOR: -1.15,
	Tertulia.PERIODISTA: 0.0,
	Tertulia.CRITICO: 1.15,
}




const T_ROTULO: float = 0.6
const T_TV: float = 1.4
const T_TV_FIN: float = 2.7
const T_TURNOS: Array[float] = [3.4, 6.2, 9.0]

const TURNO_QUIETO: float = 2.2
const T_GENERAL: float = 11.8
const T_FICHA: float = 12.5

const BARRA_MAX: float = 1700.0
const BARRA_BOTON: float = 300.0








const TELE_W: float = 3.9
const TELE_H: float = TELE_W * 0.5625
const TELE_Y: float = 2.12 + TELE_H * 0.5
const TELE_Z: float = TV_Z






const ESTUDIO_SUELO: Color = Color("141f3a")
const ESTUDIO_TARIMA: Color = Color("22325a")
const ESTUDIO_TELON: Color = Color("142a56")
const ESTUDIO_LAMA: Color = Color("2a4785")
const NEON_CIAN: Color = Color("38c8f2")
const NEON_MAGENTA: Color = Color("e04aa8")
const NEON_VIOLETA: Color = Color("6b4ad8")







const PLANO_GENERAL: Dictionary = {"dist": 11.4, "h": 2.85, "yaw": 181.5, "aim_y": 2.55,
	"fov": 38.0, "focus_x": 0.0, "focus_z": 0.35}



const PLANO_TV: Dictionary = {"dist": TELE_W * 0.54 / 0.5625 / 0.3153 - 0.9, "h": TELE_Y,
	"yaw": 180.0, "aim_y": TELE_Y, "fov": 35.0, "focus_x": 0.0, "focus_z": TELE_Z + 0.9}
const PLANO_MEDIO: Dictionary = {"dist": 4.8, "h": 1.75, "aim_y": 1.5, "fov": 34.0,
	"focus_z": 0.35}








const PLANO_GENERAL_TUMBADO: Dictionary = {"dist": 8.2, "h": 2.5, "yaw": 181.0, "aim_y": 1.95,
	"fov": 38.0, "focus_x": 0.0, "focus_z": 0.35}
const PLANO_TV_TUMBADO: Dictionary = {"dist": 4.4, "h": TELE_Y, "yaw": 180.0, "aim_y": TELE_Y,
	"fov": 35.0, "focus_x": 0.0, "focus_z": TELE_Z + 0.9}
const PLANO_CIERRE_TUMBADO: Dictionary = {"dist": 6.4, "h": 2.2, "yaw": 179.0, "aim_y": 1.85,
	"fov": 38.0, "focus_x": 0.0, "focus_z": 0.35}



const CADENA_FONDO: Color = Color("0a1320")
const CADENA_BARRA: Color = Color("111c2e")

const HUD_ENTRA: float = 0.35

const TICKER_VEL: float = 110.0


var _sprite_de: Dictionary = {}
var _cara_de: Dictionary = {}

var _turno: int = -1

var _cita: PanelContainer
var _cita_rol: Label
var _cita_chip: PanelContainer
var _cita_chip_l: Label
var _cita_frase: Label
var _cita_tw: Tween


var _tele3d: Pantalla
var _tele2d: Pantalla
var _tam_pedido: Vector2 = Vector2.ZERO
var _calientes: int = 3

var _hud: Control
var _hud_piloto: ColorRect
var _hud_reloj: Label
var _hud_tw: Tween
var _hud_dentro: bool = false
var _ticker_caja: Control
var _ticker_l: Label
var _ticker_x: float = 0.0
var _ticker_vuelta: float = 0.0




func _accent_for() -> Color:
	return CareerTheme.DANGER if _veredicto() == Tertulia.MAL else CareerTheme.accent_of(team())


func _build() -> void:


	tumbado_centrado = true
	focus = Vector3(0.0, 0.0, 0.35)
	_mundo_de_plato()
	_build_set()
	_build_tv()
	_build_hosts()
	make_camera(_keys(), 38.0)


	orbit_speed = 0.0
	make_audio(0.0, false)
	make_chyron(_rotulo(), CareerTheme.caps(Career.player_name), team(), T_ROTULO)
	_build_cita()
	_build_hud()
	make_card(T_FICHA)
	if UiKit.es_horizontal():
		_ficha_barra()
	else:
		_monta_ficha()
		card_cta(I18n.t("SEGUIR"))


func _keys() -> Array:
	var ks: Array = []
	var tumbado: bool = UiKit.es_horizontal()
	var tv: Dictionary = PLANO_TV_TUMBADO if tumbado else PLANO_TV
	ks.append(_key(0.0, PLANO_GENERAL_TUMBADO if tumbado else PLANO_GENERAL))
	ks.append(_key(T_TV, tv))
	ks.append(_key(T_TV_FIN, tv))
	var panel: Array = _panel()
	for i in T_TURNOS.size():
		var rol: String = String((panel[i] as Dictionary).get("rol", Tertulia.TURNOS[i])) \
				if i < panel.size() else Tertulia.TURNOS[i]
		var x: float = float(SITIO.get(rol, 0.0))
		var p: Dictionary = PLANO_MEDIO.duplicate()
		p["focus_x"] = x


		p["yaw"] = 180.0 - x * 5.0
		ks.append(_key(T_TURNOS[i], p))
		ks.append(_key(T_TURNOS[i] + TURNO_QUIETO, p))
	var fin: Dictionary = PLANO_GENERAL.duplicate()
	fin["dist"] = 10.8
	fin["yaw"] = 179.0
	ks.append(_key(T_GENERAL, PLANO_CIERRE_TUMBADO if tumbado else fin))
	return ks


func _key(at: float, plano: Dictionary) -> Dictionary:
	var k: Dictionary = plano.duplicate()
	k["t"] = at
	return k










func _build_set() -> void:
	_caja(Vector3(0.0, -0.05, 0.0), Vector3(34.0, 0.1, 34.0), ESTUDIO_SUELO, 0.35)



	_caja(Vector3(0.0, 0.06, 0.55), Vector3(7.2, 0.12, 3.4), ESTUDIO_TARIMA, 0.4)
	_emitir(_caja(Vector3(0.0, 0.1, 2.26), Vector3(7.2, 0.04, 0.04), NEON_CIAN, 0.5),
		NEON_CIAN, 2.0)
	for lado: float in [-1.0, 1.0]:
		_emitir(_caja(Vector3(lado * 3.6, 0.1, 0.55), Vector3(0.04, 0.04, 3.4),
			NEON_CIAN, 0.5), NEON_CIAN, 2.0)
	_caja(Vector3(0.0, 3.85, TELE_Z - 0.55), Vector3(30.0, 8.3, 0.3), ESTUDIO_TELON, 0.85)


	for i in 27:
		var x: float = -11.7 + float(i) * 0.9
		_caja(Vector3(x, 2.6, TELE_Z - 0.38), Vector3(0.1, 5.2, 0.1), ESTUDIO_LAMA, 0.75)
		if i < 26:
			_emitir(_caja(Vector3(x + 0.45, 2.6, TELE_Z - 0.4), Vector3(0.62, 4.6, 0.02),
				NEON_VIOLETA, 0.8), NEON_VIOLETA.darkened(0.62 if i % 2 == 0 else 0.72), 1.0)



	_emitir(_caja(Vector3(0.0, 1.5, TELE_Z - 0.3), Vector3(30.0, 0.06, 0.04), NEON_CIAN,
		0.5), NEON_CIAN, 2.0)
	_emitir(_caja(Vector3(0.0, 5.05, TELE_Z - 0.3), Vector3(30.0, 0.06, 0.04),
		NEON_MAGENTA, 0.5), NEON_MAGENTA, 2.0)

	for par: Array in [[TELE_W * 0.5 + 0.38, 1.5, 0.0], [5.6, 1.0, 0.35]]:
		var tono: Color = accent.darkened(float(par[2]))
		for lado: float in [-1.0, 1.0]:
			_emitir(_caja(Vector3(lado * float(par[0]), 2.4, TELE_Z - 0.12),
				Vector3(0.13, 4.7, 0.13), tono, 0.6), tono, float(par[1]))
	_parrilla()
	_build_mesa()





func _parrilla() -> void:
	_caja(Vector3(0.0, 4.95, 0.6), Vector3(26.0, 0.1, 0.1), Color("24304a"), 0.9)
	var tonos: Array[Color] = [Color("ffe9bd"), NEON_CIAN, Color("ffe9bd"), NEON_MAGENTA]
	for i in 10:
		var x: float = -5.85 + float(i) * 1.3
		_emitir(_caja(Vector3(x, 4.77, 0.6), Vector3(0.24, 0.26, 0.24), Color("2a323f"),
			0.8), tonos[i % tonos.size()], 0.7)





func _build_tv() -> void:
	_caja(Vector3(0.0, TELE_Y, TELE_Z - 0.04), Vector3(TELE_W + 0.16, TELE_H + 0.16, 0.09),
		Color("15181f"), 0.55)
	for lado: float in [-1.0, 1.0]:
		_emitir(_caja(Vector3(0.0, TELE_Y + lado *(TELE_H * 0.5 + 0.06), TELE_Z + 0.01),
			Vector3(TELE_W + 0.12, 0.03, 0.02), accent, 0.5), accent, 1.6)
		_emitir(_caja(Vector3(lado *(TELE_W * 0.5 + 0.06), TELE_Y, TELE_Z + 0.01),
			Vector3(0.03, TELE_H + 0.12, 0.02), accent, 0.5), accent, 1.6)
	var panel: MeshInstance3D = _caja(Vector3(0.0, TELE_Y, TELE_Z + 0.005),
		Vector3(TELE_W, TELE_H, 0.02), Color("0c1626"), 1.0)
	_mat_panel =(panel.mesh as PrimitiveMesh).material
	_emitir(panel, Color("0c1626"), 1.4)











	var vp: SubViewport = SubViewport.new()
	vp.size = TV_PX * 2
	vp.size_2d_override = TV_PX
	vp.size_2d_override_stretch = true
	vp.canvas_item_default_texture_filter = Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	_tv_vp = vp
	add_child(vp)
	_montar_pantalla(vp)
	var img: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(TELE_W - 0.03, TELE_H - 0.03)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	mat.emission_enabled = true
	mat.emission_texture = vp.get_texture()
	mat.emission = Color(1, 1, 1)
	mat.emission_energy_multiplier = 0.45
	img.mesh = qm
	img.material_override = mat
	img.position = Vector3(0.0, TELE_Y, TELE_Z + 0.03)
	viewport.add_child(img)




func _build_mesa() -> void:
	_caja(Vector3(0.0, MESA_Y, MESA_Z), Vector3(MESA_W, 0.1, 0.78),
		Color("34446a"), 0.45)
	_caja(Vector3(0.0, MESA_Y * 0.5, MESA_Z + 0.3),
		Vector3(MESA_W - 0.2, MESA_Y, 0.16), Color("2a2160"), 0.7)
	var franja: MeshInstance3D = _caja(Vector3(0.0, 0.8, MESA_Z + 0.39),
		Vector3(MESA_W - 0.2, 0.07, 0.03), accent, 0.5)
	_emitir(franja, accent, 2.6)
	_emitir(_caja(Vector3(0.0, 0.22, MESA_Z + 0.39), Vector3(MESA_W - 0.2, 0.04, 0.03),
		NEON_MAGENTA, 0.5), NEON_MAGENTA, 2.0)






func _build_hosts() -> void:
	_sprite_de[Tertulia.EXJUGADOR] = _persona(GALA_SHEET,
		float(SITIO[Tertulia.EXJUGADOR]), {
			"hair": Color(0.16, 0.13, 0.12),
			"hair_style": "part",
		}, GALA_ART)
	_sprite_de[Tertulia.CRITICO] = _persona(COACH_SHEET,
		float(SITIO[Tertulia.CRITICO]), {
			"hair": Color(0.74, 0.7, 0.64),
			"hair_style": "entradas",
			"facial_hair": "beard",
		}, COACH_ART)
	_sprite_de[Tertulia.PERIODISTA] = _periodista(float(SITIO[Tertulia.PERIODISTA]))
	for rol in Tertulia.TURNOS:
		var spr: AnimatedSprite3D = _sprite_de.get(rol) as AnimatedSprite3D
		_hosts.append(spr)
		_host_y0.append(spr.position.y if spr != null else 0.0)
		if spr == null:
			continue


		spr.sprite_frames = spr.sprite_frames.duplicate()
		var cara: CaraViva = CaraViva.pon(spr)
		if cara != null:
			_cara_de[rol] = cara




func _periodista(x: float) -> AnimatedSprite3D:
	var hoja: String = Pareja.ANIM_DIR + "mujer_look_traje_idle_south_"
	var look: Dictionary = KitRecolor.sin_pelirrojo_oscuro({
		"skin": KitRecolor.SKIN_TONES[1],
		"hair": KitRecolor.HAIR_COLORS[Pareja.PELOS[0]],
	})
	var frames: SpriteFrames = player_frames(look, "south", hoja, true)
	if frames.get_frame_count("idle") == 0:
		return null
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = PAREJA_PIXEL
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(x, feet_offset(PAREJA_PIXEL, hoja + "00.png") - PLAYER_SINK,
		HOST_Z)
	viewport.add_child(spr)
	spr.play("idle")
	return spr



func _montar_pantalla(vp: SubViewport) -> void:
	_tele3d = Pantalla.new()
	_tele3d.theme = TEMA
	_tele3d.size = Vector2(TV_PX)
	_tele3d.montar(team(), _programa(), _tema(), _veredicto(), _color_veredicto(_veredicto()),
		_cuerpo_tele, _con_losa())
	vp.add_child(_tele3d)
	_tele2d = Pantalla.new()
	_tele2d.theme = TEMA
	_tele2d.size = Vector2(TV_PX)
	_tele2d.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_tele2d.visible = false
	_tele2d.montar(team(), _programa(), _tema(), _veredicto(), _color_veredicto(_veredicto()),
		_cuerpo_tele, _con_losa())
	add_child(_tele2d)






func _build_cita() -> void:
	_cita = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0.03, 0.04, 0.06, 0.9)
	sb.border_color = accent
	sb.border_width_top = 4
	sb.content_margin_left = 26.0
	sb.content_margin_right = 26.0
	sb.content_margin_top = 16.0
	sb.content_margin_bottom = 18.0
	_cita.add_theme_stylebox_override("panel", sb)
	_cita.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_cita.anchor_left = 0.5
	_cita.anchor_right = 0.5
	_cita.anchor_top = 1.0
	_cita.anchor_bottom = 1.0
	_cita.offset_left = -490.0
	_cita.offset_right = 490.0
	var abajo: float = 150.0 + UiKit.bottom_safe_inset(get_viewport())
	_cita.offset_top = - abajo
	_cita.offset_bottom = - abajo
	_cita.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_cita.modulate.a = 0.0
	add_child(_cita)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	_cita.add_child(col)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	col.add_child(fila)
	_cita_rol = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_MID)
	_cita_rol.clip_text = true
	_cita_rol.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(_cita_rol)
	_cita_chip = PanelContainer.new()
	_cita_chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(_cita_chip)
	_cita_chip_l = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
	_cita_chip.add_child(_cita_chip_l)
	_cita_frase = CareerUi.plain(CareerTheme.T_HUD_ROTULO, CareerTheme.TEXT)
	_cita_frase.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART



	_cita_frase.max_lines_visible = 3
	col.add_child(_cita_frase)









func _build_hud() -> void:
	var vp: Viewport = get_viewport()
	var lados: Vector2 = UiKit.side_safe_insets(vp)
	_hud = Control.new()
	_hud.set_anchors_preset(Control.PRESET_FULL_RECT)
	_hud.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_hud.modulate.a = 0.0
	add_child(_hud)

	var mosca: PanelContainer = PanelContainer.new()
	var sm: StyleBoxFlat = StyleBoxFlat.new()
	sm.bg_color = Color(0.0, 0.0, 0.0, 0.72)
	sm.border_color = accent
	sm.border_width_left = 8
	sm.content_margin_left = 16.0
	sm.content_margin_right = 18.0
	sm.content_margin_top = 10.0
	sm.content_margin_bottom = 12.0
	mosca.add_theme_stylebox_override("panel", sm)
	mosca.mouse_filter = Control.MOUSE_FILTER_IGNORE
	mosca.anchor_left = 1.0
	mosca.anchor_right = 1.0
	mosca.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	mosca.offset_right = -(28.0 + lados.y)
	mosca.offset_left = mosca.offset_right


	mosca.offset_top = 36.0 + UiKit.top_safe_inset(vp)
	_hud.add_child(mosca)
	var mc: VBoxContainer = VBoxContainer.new()
	mc.add_theme_constant_override("separation", 6)
	mosca.add_child(mc)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.add_theme_constant_override("separation", 14)
	mc.add_child(arriba)
	var vivo: PanelContainer = PanelContainer.new()
	var sv: StyleBoxFlat = CareerTheme.tag(CareerTheme.DANGER)
	sv.content_margin_left = 10.0
	sv.content_margin_right = 12.0
	sv.content_margin_top = 4.0
	sv.content_margin_bottom = 4.0
	vivo.add_theme_stylebox_override("panel", sv)
	vivo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	arriba.add_child(vivo)
	var vf: HBoxContainer = HBoxContainer.new()
	vf.add_theme_constant_override("separation", 8)
	vivo.add_child(vf)
	_hud_piloto = ColorRect.new()
	_hud_piloto.color = CareerTheme.on_color(CareerTheme.DANGER)
	_hud_piloto.custom_minimum_size = Vector2(10, 10)
	_hud_piloto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	vf.add_child(_hud_piloto)
	var vl: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.on_color(CareerTheme.DANGER))
	vl.text = I18n.t("EN VIVO")
	vf.add_child(vl)
	_hud_reloj = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	_hud_reloj.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_hud_reloj.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	arriba.add_child(_hud_reloj)
	_pon_hora()
	var prog: Label = CareerUi.plain(CareerTheme.T_HUD_ROTULO, CareerTheme.TEXT)
	prog.text = _programa()
	mc.add_child(prog)

	var faja: PanelContainer = PanelContainer.new()
	var sf: StyleBoxFlat = StyleBoxFlat.new()
	sf.bg_color = Color(0.02, 0.03, 0.06, 0.92)
	sf.border_color = accent
	sf.border_width_top = 4
	faja.add_theme_stylebox_override("panel", sf)
	faja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	faja.anchor_left = 0.0
	faja.anchor_right = 1.0
	faja.anchor_top = 1.0
	faja.anchor_bottom = 1.0
	faja.offset_left = lados.x
	faja.offset_right = - lados.y
	var abajo: float = UiKit.bottom_safe_inset(vp) + 40.0
	faja.offset_bottom = - abajo
	faja.offset_top = - abajo - 58.0
	_hud.add_child(faja)
	var ff: HBoxContainer = HBoxContainer.new()
	ff.add_theme_constant_override("separation", 0)
	faja.add_child(ff)
	var etiqueta: PanelContainer = PanelContainer.new()
	var se: StyleBoxFlat = CareerTheme.tag(accent)
	se.set_corner_radius_all(0)
	etiqueta.add_theme_stylebox_override("panel", se)
	ff.add_child(etiqueta)
	var el: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.on_color(accent))
	el.text = I18n.t("ÚLTIMA HORA")
	el.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	etiqueta.add_child(el)
	_ticker_caja = Control.new()
	_ticker_caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_ticker_caja.clip_contents = true
	_ticker_caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ff.add_child(_ticker_caja)
	_ticker_l = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	_ticker_caja.add_child(_ticker_l)


	var una: String = _titulares()
	_ticker_l.text = una
	_ticker_vuelta = _ticker_l.get_minimum_size().x
	_ticker_l.text = una + una
	_ticker_l.size = _ticker_l.get_minimum_size()
	_ticker_x = 24.0




func _titulares() -> String:
	var sep: String = "     ·     "
	return sep.join(_noticias()) + sep




func _noticias() -> Array[String]:
	var partes: Array[String] = []
	partes.append("%s  %d %s  %d %s" % [CareerTheme.caps(Career.player_name),
		int(data.get("g", 0)), I18n.t("GOLES"), int(data.get("a", 0)), I18n.t("ASIST.")])
	var puesto: int = int(data.get("puesto", 0))
	if puesto > 0:
		partes.append("%s  %s" % [team_name("?").to_upper(), I18n.tf("PUESTO {0}", [puesto])])
	partes.append("%s %s" % [I18n.t("NOTA"), String.num(float(data.get("nota", 6.0)), 1)])
	partes.append(_tema())
	partes.append(_rotulo())
	return partes


func _pon_hora() -> void:
	var h: Dictionary = Time.get_time_dict_from_system()
	var txt: String = "%02d:%02d" % [int(h.get("hour", 0)), int(h.get("minute", 0))]
	if _hud_reloj.text != txt:
		_hud_reloj.text = txt



func _anima_hud(delta: float) -> void:
	if _hud == null:
		return
	var dentro: bool = t >= HUD_ENTRA and t < T_GENERAL
	if dentro != _hud_dentro:
		_hud_dentro = dentro
		if _hud_tw != null and _hud_tw.is_valid():
			_hud_tw.kill()
		_hud_tw = create_tween()
		_hud_tw.tween_property(_hud, "modulate:a", 1.0 if dentro else 0.0, 0.3)
	if _hud.modulate.a <= 0.0:
		return
	_hud_piloto.modulate.a = 1.0 if int(t / Pantalla.PILOTO_MS) % 2 == 0 else 0.15
	_pon_hora()
	_ticker_x -= TICKER_VEL * delta
	if _ticker_vuelta > 0.0 and _ticker_x <= - _ticker_vuelta:
		_ticker_x += _ticker_vuelta
	_ticker_l.position = Vector2(roundf(_ticker_x),
		roundf((_ticker_caja.size.y - _ticker_l.size.y) * 0.5))



func _pon_turno(i: int) -> void:
	_turno = i
	var panel: Array = _panel()
	if i < 0 or i >= panel.size():
		return



	if i == 0 and chyron != null and is_instance_valid(chyron):
		create_tween().tween_property(chyron, "modulate:a", 0.0, 0.25)
	var fila: Dictionary = panel[i]
	var rol: String = String(fila.get("rol", ""))
	for r in _cara_de:
		(_cara_de[r] as CaraViva).habla(r == rol)
	var v: String = String(fila.get("veredicto", Tertulia.NORMAL))
	var col: Color = _color_veredicto(v)
	_cita_rol.text = CareerTheme.caps(I18n.t(String(Tertulia.ROL.get(rol, ""))))
	_cita_chip_l.text = I18n.t(_postura(v))
	_cita_chip_l.add_theme_color_override("font_color", col)
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0, 0, 0, 0)
	sb.border_color = col
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(4)
	sb.content_margin_left = 10.0
	sb.content_margin_right = 10.0
	sb.content_margin_top = 3.0
	sb.content_margin_bottom = 3.0
	_cita_chip.add_theme_stylebox_override("panel", sb)
	_cita_frase.text = "«%s»" % I18n.tf(String(fila.get("frase", "")),
		fila.get("args", []) as Array)


	if _cita_tw != null and _cita_tw.is_valid():
		_cita_tw.kill()
	_cita.modulate.a = 0.0
	_cita_tw = create_tween()
	_cita_tw.tween_property(_cita, "modulate:a", 1.0, 0.25)

	if i == panel.size() - 1:
		match v:
			Tertulia.MAL:
				sting("stinger_bad", -12.0)
			Tertulia.BIEN:
				sting("ui_confirm", -10.0)
			_:
				sting("ui_pop", -12.0)
	else:
		sting("ui_pop", -15.0)


func _calla_todos() -> void:
	for r in _cara_de:
		(_cara_de[r] as CaraViva).habla(false)


func _tick(delta: float) -> void:
	_anima_hud(delta)
	if _calientes > 0:
		_calientes -= 1
		_repintar()
	var k: int = -1
	if t < T_GENERAL:
		for i in T_TURNOS.size():
			if t >= T_TURNOS[i]:
				k = i
	if k != _turno and k >= 0:
		_pon_turno(k)

	if t >= T_GENERAL and _turno != -2:
		_turno = -2
		_calla_todos()
		if _cita_tw != null and _cita_tw.is_valid():
			_cita_tw.kill()
		_cita_tw = create_tween()
		_cita_tw.tween_property(_cita, "modulate:a", 0.0, 0.3)
	if _tele3d != null and is_instance_valid(_tele3d) and _tele3d.tick(t):
		_repintar()
	if _tele2d != null and is_instance_valid(_tele2d):
		_tele2d.tick(t)
		_encaja_tele()
	_respirar()






func _encaja_tele() -> void:
	if t < T_TV or t > T_TV_FIN or cam == null:
		_tele2d.visible = false
		return
	var centro: Vector3 = Vector3(0.0, TELE_Y, TELE_Z + 0.03)
	var hw: float =(TELE_W - 0.03) * 0.5
	var hh: float =(TELE_H - 0.03) * 0.5
	var a: Vector2 = cam.unproject_position(centro + Vector3(- hw, hh, 0.0))
	var b: Vector2 = cam.unproject_position(centro + Vector3(hw, - hh, 0.0))
	var r: Rect2 = Rect2(Vector2(minf(a.x, b.x), minf(a.y, b.y)),(b - a).abs()).abs()
	r.position += viewport_box.position
	var pos: Vector2 = r.position.round()
	var tam: Vector2 = r.size.round()
	if _tele2d.position != pos:
		_tele2d.position = pos





	if absf(_tam_pedido.x - tam.x) > 1.0 or absf(_tam_pedido.y - tam.y) > 1.0:
		_tam_pedido = tam
		_tele2d.size = Vector2(TV_PX)
		_tele2d.scale = Vector2(tam.x / float(TV_PX.x), tam.y / float(TV_PX.y))
	_tele2d.visible = true



func _skipped() -> void:
	_turno = -2
	_calla_todos()
	if _cita_tw != null and _cita_tw.is_valid():
		_cita_tw.kill()
	if _cita != null:
		_cita.modulate.a = 0.0
	if _tele2d != null:
		_tele2d.visible = false
	if _hud != null:
		if _hud_tw != null and _hud_tw.is_valid():
			_hud_tw.kill()
		_hud.modulate.a = 0.0
		_hud = null












func _programa() -> String:
	return I18n.t("EL DEBATE")



func _rotulo() -> String:
	return I18n.t("LA TERTULIA")



func _tema() -> String:
	var v: String = _veredicto()
	return I18n.t("¿ES PARA PRIMERA?" if v == Tertulia.MAL
		else ("¿YA ES UN CRACK?" if v == Tertulia.BIEN else "¿CUMPLE O NO CUMPLE?"))



func _con_losa() -> bool:
	return true




func _cuerpo_tele(p: Pantalla) -> Control:
	return _cuerpo_ficha(p)




func _cuerpo_ficha(p: Pantalla) -> Control:
	var der: VBoxContainer = _columna_nombre(p)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	der.add_child(fila)
	var medalla: OvrBadge = OvrBadge.new()
	medalla.setup(int(data.get("ovr", 0)), CareerTheme.T_HEAD)
	fila.add_child(medalla)
	fila.add_child(CareerUi.pos_chip(String(data.get("pos", Squad.USER_POS))))
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(hueco)
	var puesto: int = int(data.get("puesto", 0))
	if puesto > 0:
		fila.add_child(_pastilla(p, I18n.tf("PUESTO {0}", [puesto]), p.acento))
	var cifras: HBoxContainer = HBoxContainer.new()
	cifras.add_theme_constant_override("separation", 10)
	der.add_child(cifras)
	for par: Array in [
			[str(int(data.get("pj", 0))), "PJ", CareerTheme.TEXT],
			[str(int(data.get("g", 0))), "GOLES", CareerTheme.STAT_GOAL],
			[str(int(data.get("a", 0))), "ASIST.", CareerTheme.STAT_ASSIST],
			[String.num(float(data.get("nota", 6.0)), 1), "NOTA", _color_veredicto(_veredicto())]]:
		cifras.add_child(p._cubo(String(par[0]), I18n.t(String(par[1])), par[2]))
	return _cuerpo_busto(der)




func _cuerpo_busto(der: Control) -> Control:
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.add_theme_constant_override("separation", 40)
	var margen: Control = Control.new()
	margen.custom_minimum_size = Vector2(44, 0)
	cuerpo.add_child(margen)
	var av: PlayerAvatar = PlayerAvatar.new()
	av.chrome = false
	av.bust = PlayerAvatar.BUST_CLOSE
	av.custom_minimum_size = Vector2(216, 282)
	av.size_flags_vertical = Control.SIZE_SHRINK_END
	av.club = team()
	cuerpo.add_child(av)
	av.set_look(GameState.player_look())
	der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cuerpo.add_child(der)
	var cola: Control = Control.new()
	cola.custom_minimum_size = Vector2(24, 0)
	cuerpo.add_child(cola)
	return cuerpo




func _columna_nombre(p: Pantalla) -> VBoxContainer:
	var der: VBoxContainer = VBoxContainer.new()
	der.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	der.add_theme_constant_override("separation", 14)
	var nombre: Label = p._texto(CareerTheme.caps(Career.player_name),
		CareerTheme.T_TITLE, CareerTheme.TEXT)
	nombre.clip_text = true
	nombre.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0.55))
	nombre.add_theme_constant_override("shadow_offset_x", 3)
	nombre.add_theme_constant_override("shadow_offset_y", 3)
	der.add_child(nombre)
	var raya: ColorRect = ColorRect.new()
	raya.color = p.acento
	raya.custom_minimum_size = Vector2(150, 6)
	raya.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	der.add_child(raya)
	return der





func _pastilla(p: Pantalla, txt: String, c: Color, px: int = CareerTheme.T_HEAD) -> Control:
	var tag: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.tag(c)
	sb.content_margin_left = 14.0
	sb.content_margin_right = 14.0
	tag.add_theme_stylebox_override("panel", sb)
	tag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tag.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	tag.add_child(p._texto(txt, px, CareerTheme.on_color(c)))
	return tag



func _monta_ficha() -> void:
	card_title(_titulo(), 40)
	card_sub(I18n.tf("{0} · TEMPORADA {1}", [team_name("?").to_upper(), _season()]),
		_color_veredicto(_veredicto()))
	card_stats([
		{"v": str(int(data.get("pj", 0))), "k": I18n.t("PJ")},
		{"v": str(int(data.get("g", 0))), "k": I18n.t("GOLES")},
		{"v": str(int(data.get("a", 0))), "k": I18n.t("ASIST.")},
		{"v": String.num(float(data.get("nota", 6.0)), 1), "k": I18n.t("NOTA")},
	])
	card_note(_nota_final())









func _ficha_barra() -> void:
	var vp: Viewport = get_viewport()
	var ancho: float = minf(SceneFade.rect_visible(self).size.x
		- 2.0 *(UiKit.side_safe_inset(vp) + 34.0), BARRA_MAX)
	card.offset_left = - ancho * 0.5
	card.offset_right = ancho * 0.5
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 32)
	card_box.add_child(fila)
	var textos: VBoxContainer = VBoxContainer.new()
	textos.add_theme_constant_override("separation", 6)
	textos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	textos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(textos)


	var caja: VBoxContainer = card_box
	card_box = textos
	_monta_ficha()
	card_box = caja
	for c in textos.get_children():
		if c is Label:
			(c as Label).horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		elif c is HBoxContainer:

			textos.remove_child(c)
			var cifras: HBoxContainer = c
			cifras.add_theme_constant_override("separation", 22)
			cifras.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			for cel in cifras.get_children():
				(cel as Control).size_flags_horizontal = Control.SIZE_SHRINK_CENTER
			fila.add_child(cifras)
	var b: Button = CareerUi.primary_cta(I18n.t("SEGUIR"), _leave)
	b.custom_minimum_size.x = BARRA_BOTON
	b.size_flags_horizontal = Control.SIZE_SHRINK_END
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(b)








func _panel() -> Array:
	var raw: Variant = data.get("panel", [])
	if raw is Array and not (raw as Array).is_empty():
		return raw as Array
	return _panel_de_serie()




func _panel_de_serie() -> Array:
	return Tertulia.panel(data)


func _veredicto() -> String:
	var v: String = String(data.get("veredicto", ""))
	return v if v in [Tertulia.BIEN, Tertulia.NORMAL, Tertulia.MAL] \
			else Tertulia.veredicto(_score_de_serie())



func _score_de_serie() -> float:
	return Tertulia.puntua(data)


func _season() -> int:
	return maxi(temporada_del_acto(), 1)




func _color_veredicto(v: String) -> Color:
	match v:
		Tertulia.BIEN:
			return CareerTheme.text_on_dark(CareerTheme.accent_of(team()))
		Tertulia.MAL:
			return CareerTheme.DANGER
	return CareerTheme.TEXT_MID


func _postura(v: String) -> String:
	match v:
		Tertulia.BIEN:
			return "A FAVOR"
		Tertulia.MAL:
			return "EN CONTRA"
	return "CON DUDAS"


func _titulo() -> String:
	match _veredicto():
		Tertulia.BIEN:
			return I18n.t("TE ADORAN")
		Tertulia.MAL:
			return I18n.t("TE CRITICAN")
	return I18n.t("OPINIONES DIVIDIDAS")


func _nota_final() -> String:
	match _veredicto():
		Tertulia.BIEN:
			return I18n.t("En la tele ya hablan de ti como de los buenos.")
		Tertulia.MAL:
			return I18n.t("En la tele piden más. En el campo se contesta.")
	return I18n.t("En la tele no terminan de decidirse contigo.")










class Pantalla extends Control:
	const PILOTO_MS: float = 0.5
	var _piloto: Control
	var _piloto_on: bool = true


	var acento: Color = CareerTheme.accent()





	func montar(club: Dictionary, programa: String, tema: String, veredicto: String,
			col_v: Color, cuerpo: Callable, losa: bool) -> void:


		acento = CareerTheme.accent_of(club)
		if acento.s < 0.3 or acento.v < 0.25:
			acento = NEON_VIOLETA
		var fondo: FondoTele = FondoTele.new()
		fondo.acento = acento
		fondo.losa = losa
		fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
		fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(fondo)
		var col: VBoxContainer = VBoxContainer.new()
		col.set_anchors_preset(Control.PRESET_FULL_RECT)
		col.add_theme_constant_override("separation", 0)
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(col)
		col.add_child(_barra(club, acento, programa))
		var c: Control = cuerpo.call(self)
		c.size_flags_vertical = Control.SIZE_EXPAND_FILL
		col.add_child(c)
		col.add_child(_barra_inferior(tema, veredicto, col_v, acento))



	func _barra(club: Dictionary, acento: Color, programa: String) -> Control:
		var barra: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = Color(0, 0, 0, 0.55)
		sb.border_color = acento
		sb.border_width_bottom = 5
		sb.content_margin_left = 20.0
		sb.content_margin_right = 20.0
		sb.content_margin_top = 10.0
		sb.content_margin_bottom = 10.0
		barra.add_theme_stylebox_override("panel", sb)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 16)
		barra.add_child(fila)
		var vivo: PanelContainer = PanelContainer.new()
		var sv: StyleBoxFlat = CareerTheme.tag(CareerTheme.DANGER)
		sv.content_margin_left = 12.0
		sv.content_margin_right = 14.0
		vivo.add_theme_stylebox_override("panel", sv)
		vivo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fila.add_child(vivo)
		var vf: HBoxContainer = HBoxContainer.new()
		vf.add_theme_constant_override("separation", 10)
		vivo.add_child(vf)
		var dot: ColorRect = ColorRect.new()
		dot.color = CareerTheme.on_color(CareerTheme.DANGER)
		dot.custom_minimum_size = Vector2(14, 14)
		dot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		vf.add_child(dot)
		_piloto = dot
		vf.add_child(_texto(I18n.t("EN VIVO"), CareerTheme.T_HEAD,
			CareerTheme.on_color(CareerTheme.DANGER)))
		var titulo: Label = _texto(programa, CareerTheme.T_TITLE_MODAL,
			CareerTheme.TEXT)
		titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		titulo.clip_text = true
		fila.add_child(titulo)
		var esc: CrestView = CrestView.new()
		esc.custom_minimum_size = Vector2(44, 44)
		esc.set_team(club)
		fila.add_child(esc)
		return barra



	func _cubo(valor: String, cap: String, c: Color) -> Control:
		var caja: PanelContainer = PanelContainer.new()
		caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = Color(0, 0, 0, 0.42)
		sb.border_color = c
		sb.border_width_top = 5
		sb.set_corner_radius_all(4)
		sb.content_margin_top = 8.0
		sb.content_margin_bottom = 8.0
		caja.add_theme_stylebox_override("panel", sb)
		var v: VBoxContainer = VBoxContainer.new()
		v.add_theme_constant_override("separation", 0)
		caja.add_child(v)
		var n: Label = _texto(valor, CareerTheme.T_TITLE, c)
		n.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		n.clip_text = true
		v.add_child(n)
		var k: Label = _texto(CareerTheme.caps(cap), CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
		k.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		k.clip_text = true
		v.add_child(k)
		return caja




	func _barra_inferior(tema: String, veredicto: String, col_v: Color, acento: Color) -> Control:
		var barra: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = Color(0, 0, 0, 0.62)
		sb.border_color = acento if veredicto == Tertulia.NORMAL else col_v
		sb.border_width_left = 16
		sb.content_margin_left = 22.0
		sb.content_margin_right = 20.0
		sb.content_margin_top = 10.0
		sb.content_margin_bottom = 10.0
		barra.add_theme_stylebox_override("panel", sb)
		var l: Label = _texto(tema, CareerTheme.T_HEAD, CareerTheme.TEXT)
		l.clip_text = true
		barra.add_child(l)
		return barra

	func _texto(txt: String, px: int, c: Color) -> Label:
		var l: Label = Label.new()
		l.text = txt
		l.add_theme_font_size_override("font_size", px)
		l.add_theme_color_override("font_color", c)
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		return l


	func tick(t: float) -> bool:
		var on: bool = int(t / PILOTO_MS) % 2 == 0
		if on == _piloto_on or _piloto == null:
			return false
		_piloto_on = on
		_piloto.modulate.a = 1.0 if on else 0.15
		return true







class FondoTele extends Control:
	var acento: Color = CareerTheme.accent()
	var losa: bool = true

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		var esq: PackedColorArray = PackedColorArray([
			acento.darkened(0.7), CADENA_FONDO, NEON_VIOLETA.darkened(0.62),
			acento.darkened(0.8)])
		draw_polygon(PackedVector2Array([Vector2.ZERO, Vector2(w, 0), Vector2(w, h),
			Vector2(0, h)]), esq)
		var x: float = - h
		while x < w:
			draw_line(Vector2(x, h), Vector2(x + h * 0.6, 0), Color(1, 1, 1, 0.035), 10.0)
			x += 46.0

		var top: float = 66.0
		var bot: float = h - 54.0
		if losa:
			var pol: PackedVector2Array = PackedVector2Array([Vector2(70, top),
				Vector2(318, top), Vector2(268, bot), Vector2(20, bot)])
			draw_polygon(pol, PackedColorArray([acento, acento.darkened(0.15),
				acento.darkened(0.55), acento.darkened(0.45)]))
			draw_line(Vector2(318, top), Vector2(268, bot), acento.lightened(0.45), 5.0)
			draw_line(Vector2(334, top), Vector2(284, bot), Color(acento, 0.45), 3.0)
			for r: float in [130.0, 100.0, 70.0]:
				draw_circle(Vector2(152, bot - 200.0), r, Color(1, 1, 1, 0.06))

		for i in 3:
			var x0: float = 262.0 + i * 22.0
			draw_polygon(PackedVector2Array([Vector2(x0, 14), Vector2(x0 + 12, 14),
				Vector2(x0 + 2, 52), Vector2(x0 - 10, 52)]),
				PackedColorArray([NEON_MAGENTA, NEON_MAGENTA, NEON_MAGENTA, NEON_MAGENTA]))
