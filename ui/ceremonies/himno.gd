extends "res://ui/ceremonies/banca_juego.gd"































const PASO: float = 1.15







const HIMNO_KEYS: Array = [
	{"t": 0.0, "dist": 12.0, "h": 2.3, "yaw": 166.0, "aim_y": 1.4, "fov": 34.0},
	{"t": 1.4, "dist": 8.0, "h": 1.6, "yaw": 182.0, "aim_y": 0.72, "fov": 30.0,
		"focus_x":(float(Himno.MIO + Himno.VECINO) * 0.5 - float(Himno.LINEA_N - 1) * 0.5) * PASO,
		"focus_z": CENTER_Z},
]


const HIMNO_DRIFT: float = -0.05
const HIMNO_DB: float = -3.0



const TELE_ANCHO_DIST: float = 12.5
const TELE_ANCHO_H: float = 2.4
const TELE_ANCHO_FOV: float = 40.0
const TELE_CERCA_DIST: float = 4.0
const TELE_CERCA_H: float = 1.6
const TELE_CERCA_AIM: float = 1.38
const TELE_CERCA_FOV: float = 25.0





const TELE_ANCHO_VERTICAL: float = 0.44
const TELE_ANCHO_TUMBADO: float = 0.24
const TELE_MARGEN: float = 20.0



const RESPINGO: float = 0.04
const TEMBLOR: float = 0.025
const TEMBLOR_CADA: float = 0.22

const MUERDE_DESDE: float = 0.5

var _g: Dictionary = {}
var _e: Dictionary = {}
var _reloj: float = 0.0
var _mantiene: bool = false
var _fin: int = 0
var _empezado: bool = false


var _equivocado: bool = false
var _prologo: float = 0.0
var _musiquita: bool = false


var _cara_yo: String = "-"
var _cara_el: String = "-"
var _dicho: String = ""
var _temblor_t: float = 0.0

var _fila: Array[AnimatedSprite3D] = []
var _tele: PanelContainer
var _tele_marco: StyleBoxFlat
var _tele_punto: Panel
var _vp2: SubViewport
var _cam2: Camera3D
var _tira: TiraTele
var _barra: BarraRisa
var _aguanta_b: Button


func _kind() -> String:
	return Ceremonies.HIMNO


func _titulo() -> String:
	return "EL HIMNO"


func _contra() -> bool:
	return false


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["himno_nacional", "himno_risa", "himno_equivocado"])





func _consume() -> Dictionary:
	var fx: Dictionary = GameState.current_fixture()
	if not GameState.next_starter or String(fx.get("comp", "")) != "nat":
		return {}
	return {
		"kind": Ceremonies.HIMNO,
		"nation": Career.nationality,
		"div": 1,
		"club": GameState.player_team_id,
		"opp": String(fx.get("opp", "")),
		"season": GameState.season_num,
		"caps": Career.nat_caps,
		"number": GameState.shirt_number_now(),
	}




func _cfg_estadio() -> Dictionary:
	return {
		"div": 1,
		"attendance": 1.0,
		"party": false,
		"home_only": true,
		"weather": String(data.get("weather", "sunset")),
		"kit": GameState.kit_variant(team(), 0),
		"banner": I18n.t("VAMOS"),
		"board": board_fit(I18n.t("HIMNO")),
	}




func _ready() -> void:
	await super._ready()
	if not data.is_empty() and not _leaving and not standalone and not replay:
		SceneFade.calienta_partido_en_acto()


func _build() -> void:
	make_stadium(_cfg_estadio())
	auto = bool(data.get("auto", false))
	azar.seed = hash("himno|%s|%s|%s" % [String(data.get("nation", "")),
		str(data.get("season", 0)), str(data.get("caps", 0))])
	_g = Himno.guion(azar.randi())
	_e = Himno.estado()



	_equivocado = bool(data.get("equivocado", false)) or (not replay and not standalone
		and Himno.equivocado(Career.himno_equivocado, Himno.dado_equivocado(
			String(data.get("nation", "")), int(data.get("season", 0)), int(data.get("caps", 0)))))


	if not replay and not standalone:
		Career.marca_himno()
		if _equivocado:
			Career.marca_himno_equivocado()
	focus = Vector3(0.0, 0.0, CENTER_Z)
	_monta_fila(GameState.kit_variant(team(), 0))


	if _equivocado:
		for i in _fila.size():
			if not Himno.mirada(i).is_empty():
				add_idle_views(_fila[i])
	make_camera(_keys_equivocado() if _equivocado else HIMNO_KEYS)
	orbit_speed = HIMNO_DRIFT
	make_audio(1.0, false)
	stadium.crowd_excite(0.4)
	_monta_tele()
	_monta_ficha()







func _keys_equivocado() -> Array:
	var abierto: Dictionary = {"dist": 18.5, "h": 1.7, "yaw": 180.0, "aim_y": 0.8, "fov": 32.0,
		"focus_x": _x_de(float(Himno.MIO - 1)), "focus_z": CENTER_Z}
	var suena: float = T_FICHA + Himno.PROLOGO_S
	var keys: Array = [HIMNO_KEYS[0]]
	for t: float in [T_FICHA, suena]:
		var k: Dictionary = abierto.duplicate()
		k["t"] = t
		keys.append(k)
	var pareja: Dictionary =(HIMNO_KEYS[1] as Dictionary).duplicate()
	pareja["t"] = suena + 0.7
	keys.append(pareja)
	return keys


func _x_de(i: float) -> float:
	return (i - float(Himno.LINEA_N - 1) * 0.5) * PASO







func _monta_fila(kit: Dictionary) -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(kit, true)
	look["number"] = shirt()
	var gente: Array = _convocados(Himno.LINEA_N - 1)

	var con_nombre: Array[int] = []
	for i in gente.size():
		if not String((gente[i] as Dictionary).get("name", "")).is_empty():
			con_nombre.append(i)
	var i_el: int = con_nombre[azar.randi() % con_nombre.size()] if not con_nombre.is_empty() else 0
	var bromista: Dictionary =(gente[i_el] as Dictionary).duplicate()
	gente.remove_at(i_el)



	var usados: Array[int] = [shirt()]
	for g in gente:
		usados.append(int((g as Dictionary).get("number", 0)))
	var dorsal: int = int(bromista.get("number", 0))
	if dorsal <= 0 or dorsal == shirt():
		dorsal = 2
		while dorsal in usados:
			dorsal += 1
		bromista["number"] = dorsal
	nombre_el = CareerTheme.caps(String(bromista.get("name", ""))) \
			if not String(bromista.get("name", "")).is_empty() else I18n.t("TU COMPAÑERO")
	var pool: Array[SpriteFrames] = people_frames_pool(gente, kit)
	var y: float = feet_offset(PLAYER_HEIGHT_M / PLAYER_METRICS.x) - PLAYER_SINK
	var k_pool: int = 0
	for i in Himno.LINEA_N:
		var fr: SpriteFrames
		if i == Himno.MIO:
			fr = player_frames(look)
		elif i == Himno.VECINO:
			fr = player_frames(person_look(bromista, KitRecolor.team_only(kit)))
		else:
			fr = pool[k_pool % pool.size()]
			k_pool += 1
		var s: AnimatedSprite3D = _en_fila(fr, i, y)
		_fila.append(s)
	yo = _fila[Himno.MIO]
	el = _fila[Himno.VECINO]
	player = yo
	_y0[yo] = yo.position.y
	_y0[el] = el.position.y


	_viva(yo)
	_viva(el)



func _convocados(n: int) -> Array:
	var out: Array = []
	for row in Career.nat_squad_list():
		if out.size() >= n:
			break
		var r: Dictionary = row
		if bool(r.get("is_you", false)):
			continue
		out.append({"name": String(r.get("name", "")), "number": int(r.get("number", 0))})
	while out.size() < n:
		out.append({"name": "", "number": 0, "idx": out.size()})
	return out


func _en_fila(fr: SpriteFrames, i: int, y: float) -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.sprite_frames = fr
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.position = Vector3(_x_de(float(i)), y, CENTER_Z)
	viewport.add_child(s)
	s.play("idle")

	s.speed_scale = azar.randf_range(0.8, 1.25)
	var n: int = fr.get_frame_count("idle")
	if n > 1:
		s.frame = azar.randi_range(0, n - 1)
	return s










func _monta_tele() -> void:
	_tele = PanelContainer.new()
	_tele.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_tele.visible = false
	_tele_marco = StyleBoxFlat.new()
	_tele_marco.bg_color = CareerTheme.INK_DARK
	_tele_marco.border_color = CareerTheme.SURFACE_LINE
	_tele_marco.set_border_width_all(4)
	_tele_marco.set_corner_radius_all(10)
	_tele_marco.set_content_margin_all(4)
	_tele.add_theme_stylebox_override("panel", _tele_marco)

	add_child(_tele)
	var caja: SubViewportContainer = SubViewportContainer.new()
	caja.stretch = true
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_tele.add_child(caja)
	_vp2 = SubViewport.new()
	_vp2.transparent_bg = false
	_vp2.world_3d = viewport.find_world_3d()
	_vp2.render_target_update_mode = SubViewport.UPDATE_DISABLED
	_vp2.msaa_3d = Viewport.MSAA_DISABLED
	UiKit.aplica_escala_3d_sub(_vp2, get_viewport())
	caja.add_child(_vp2)
	_cam2 = Camera3D.new()
	_cam2.current = true
	_vp2.add_child(_cam2)


	var bug: HBoxContainer = HBoxContainer.new()
	bug.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bug.add_theme_constant_override("separation", 8)
	bug.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	bug.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	_tele.add_child(bug)
	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(4, 0)
	bug.add_child(hueco)
	_tele_punto = Panel.new()
	_tele_punto.custom_minimum_size = Vector2(16, 16)
	_tele_punto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_tele_punto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.DANGER
	sb.set_corner_radius_all(8)
	_tele_punto.add_theme_stylebox_override("panel", sb)
	bug.add_child(_tele_punto)
	var rot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
	rot.text = I18n.t("EN DIRECTO")
	rot.add_theme_color_override("font_outline_color", CareerTheme.INK_DARK)
	rot.add_theme_constant_override("outline_size", 6)
	bug.add_child(rot)
	_coloca_tele()
	_tick_tele()




func _coloca_tele() -> void:
	if _tele == null:
		return
	var tumbado: bool = UiKit.es_horizontal()
	var w: float = size.x *(TELE_ANCHO_TUMBADO if tumbado else TELE_ANCHO_VERTICAL)
	var h: float = w * 9.0 / 16.0
	_tele.size = Vector2(w, h)
	if tumbado:
		_tele.position = Vector2(UiKit.side_safe_inset(get_viewport()) + TELE_MARGEN,
			size.y - h - TELE_MARGEN)
	else:
		_tele.position = Vector2(TELE_MARGEN, UiKit.top_safe_inset(get_viewport()) + TELE_MARGEN)


func _tele_enciende() -> void:
	if _tele == null:
		return
	_tele.visible = true
	_vp2.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_coloca_tele()
	UiKit.punch(_tele)




func _tick_tele() -> void:
	if _cam2 == null:
		return
	var c: float = float(Himno.MIO) if _fin < 0 else Himno.camara(_reloj, _g)
	var desde: Vector3
	var hacia: Vector3
	if c < 0.0:
		_cam2.fov = TELE_ANCHO_FOV
		desde = Vector3(0.0, TELE_ANCHO_H, CENTER_Z + TELE_ANCHO_DIST)
		hacia = Vector3(0.0, 1.0, CENTER_Z)
	else:
		_cam2.fov = TELE_CERCA_FOV
		var x: float = _x_de(c)
		desde = Vector3(x, TELE_CERCA_H, CENTER_Z + TELE_CERCA_DIST)
		hacia = Vector3(x, TELE_CERCA_AIM, CENTER_Z)
	_cam2.look_at_from_position(desde, hacia)
	var en_ti: bool = _fin < 0 or (_empezado and Himno.en_cuadro(_reloj, _g))
	_tele_marco.border_color = CareerTheme.DANGER if en_ti else CareerTheme.SURFACE_LINE

	if _tele_punto != null:
		_tele_punto.modulate.a = 1.0 if en_ti or fmod(_reloj, 1.0) < 0.6 else 0.25
	if _tira != null:
		_tira.camara = c
		_tira.en_ti = en_ti
		_tira.aviso = _empezado and _fin == 0 and Himno.aviso(_reloj, _g)
		_tira.reloj = _reloj
		_tira.queue_redraw()







func _monta_marcador() -> void:
	card_sub(I18n.tf("A TU LADO: {0}", [nombre_el]), CareerTheme.NAV_GENTE, 22) \
			.clip_text = true
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	card_box.add_child(fila)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(38, 38)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(ic)
	ic.setup("tv", CareerTheme.TEXT)
	_tira = TiraTele.new()
	_tira.custom_minimum_size = Vector2(0, 52)
	_tira.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_tira.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(_tira)



func _monta_juego(caja: VBoxContainer) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	caja.add_child(fila)
	var rot: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.NAV_GENTE)
	rot.text = I18n.t("RISA")
	rot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(rot)
	_barra = BarraRisa.new()
	_barra.custom_minimum_size = Vector2(0, 34)
	_barra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(_barra)
	_aguanta_b = CareerUi.primary_cta(I18n.t("AGUANTA"))
	_aguanta_b.custom_minimum_size.y = 128
	_aguanta_b.focus_mode = Control.FOCUS_NONE

	UiKit.set_cue(_aguanta_b, "")



	_aguanta_b.button_down.connect(_al_apretar)


	_aguanta_b.set_meta(Entrada.PRIMERO_META, true)
	caja.add_child(_aguanta_b)


func _al_apretar() -> void:
	UiAudio.haptic(8)




func _tick(delta: float) -> void:
	super._tick(delta)
	_coloca_tele()
	_tick_tele()
	_tick_cuerpos(delta)


func _juega(delta: float) -> void:
	if _equivocado and _prologo < Himno.PROLOGO_S:
		_juega_prologo(delta)
		return
	if not _empezado:
		_arranca()
	var dt: float = minf(delta, 0.1) if auto else delta
	if auto:
		_mantiene = Himno.peligro(_reloj, _g)
		if bool(data.get("auto_pillado", false)) and Himno.en_vuelta(_reloj, _g):
			_mantiene = false
	else:
		_mantiene = _aguanta_b != null and _aguanta_b.is_pressed()
	var estallaba: bool = float(_e.get("estalla", 0.0)) > 0.0
	Himno.paso(_e, _reloj, dt, _mantiene, _g)
	_reloj += dt
	if not estallaba and float(_e.get("estalla", 0.0)) > 0.0:

		bota(yo, TEMBLOR * 2.0, 0.2)
		UiAudio.haptic(20)
	if _barra != null:
		_barra.risa = float(_e.get("risa", 0.0))
		_barra.estalla = float(_e.get("estalla", 0.0)) > 0.0
		_barra.queue_redraw()
	_pinta_caras()
	_pinta_estado()
	_fin = Himno.final(_e, _reloj)
	if _fin != 0:
		_termina(_fin)


func _arranca() -> void:
	_empezado = true
	sting("himno_nacional", HIMNO_DB)
	if audio != null:
		audio.hush()
	if _equivocado:

		_e = Himno.estado(Himno.RISA_EQUIVOCADO)
		_se_miran(false)
	else:
		_tele_enciende()
	foco_juego(_aguanta_b)






func _juega_prologo(delta: float) -> void:
	if not _musiquita:
		_musiquita = true
		sting("himno_equivocado", HIMNO_DB)
		if audio != null:
			audio.hush()
		_tele_enciende()
	var dt: float = minf(delta, 0.1) if auto else delta
	var antes: float = _prologo
	_prologo += dt
	if not Himno.se_miran(antes) and Himno.se_miran(_prologo):
		_se_miran(true)
	_e["risa"] = Himno.risa_prologo(_prologo)
	if _barra != null:
		_barra.risa = float(_e["risa"])
		_barra.queue_redraw()






func _se_miran(si: bool) -> void:
	for i in _fila.size():
		var lado: String = Himno.mirada(i)
		var s: AnimatedSprite3D = _fila[i]
		if lado.is_empty() or not is_instance_valid(s):
			continue
		if si and add_idle_views(s):
			s.play("idle_" + lado)
		elif not si:
			s.play("idle")
	if si:
		bota(yo, RESPINGO, 0.2)
		_cara_yo = "muerde"
		cara_fondo(yo, _cara_yo)
		_cara_el = "resoplar"
		cara_fondo(el, _cara_el)
		di(I18n.t("¡ESE NO ES!"), CareerTheme.NAV_GENTE)
		UiAudio.haptic(15)





func _pinta_caras() -> void:
	var mia: String = "reir" if bool(_e.get("riendo", false)) else (
		"muerde" if float(_e.get("risa", 0.0)) >= MUERDE_DESDE else "concentra")
	if mia != _cara_yo:
		_cara_yo = mia
		cara_fondo(yo, mia)
	var m: Dictionary = Himno.mueca(_reloj, _g)
	var suya: String = String(m.get("cara", ""))
	if suya.is_empty():
		var c: float = Himno.camara(_reloj, _g)
		if c >= 0.0 and absf(c - float(Himno.VECINO)) <= Himno.PROPIO:
			suya = "concentra"
	if suya != _cara_el:

		if not m.is_empty() and _cara_el not in Himno.CARAS:
			bota(el, RESPINGO, 0.2)
		_cara_el = suya
		cara_fondo(el, suya)



func _pinta_estado() -> void:
	var riendo: bool = bool(_e.get("riendo", false))
	var cual: String
	if Himno.aviso(_reloj, _g):
		cual = "busca"
	elif Himno.en_cuadro(_reloj, _g):
		cual = "directo"
	elif float(_e.get("estalla", 0.0)) > 0.0:
		cual = "revienta"
	elif riendo and Himno.peligro(_reloj, _g):
		cual = "tele"
	elif riendo:
		cual = "ja"
	else:
		cual = "serio"
	if cual == _dicho:
		return
	_dicho = cual
	match cual:
		"busca":
			di(I18n.t("¡TE BUSCA!"), CareerTheme.DANGER)
			UiAudio.haptic(15)
		"directo":
			di(I18n.t("EN DIRECTO"), CareerTheme.DANGER)
		"revienta":
			di(I18n.t("¡REVIENTAS!"), CareerTheme.DANGER)
		"tele":
			di(I18n.t("¡LA TELE!"), CareerTheme.DANGER)
		"ja":
			di(I18n.t("¡JA, JA!"), CareerTheme.NAV_GENTE)
		_:
			di(I18n.t("SERIO"), CareerTheme.TEXT)



func _tick_cuerpos(delta: float) -> void:
	var riendo: bool =(_fin < 0) or (_empezado and _fin == 0 and bool(_e.get("riendo", false)))
	if not riendo:
		_temblor_t = 0.0
		return
	_temblor_t -= delta
	if _temblor_t <= 0.0:
		_temblor_t = TEMBLOR_CADA
		bota(yo, TEMBLOR, TEMBLOR_CADA * 0.9)






func _termina(f: int) -> void:
	if acabado:
		return
	acabado = true
	_mantiene = false
	_zona.visible = false
	_al_campo.visible = false
	if f < 0:
		di(I18n.t("¡PILLADO!"), CareerTheme.DANGER)
		sting("himno_risa", -2.0)
		UiAudio.haptic(40)

		_cara_yo = "reir"
		cara_fondo(yo, "reir")
		_cara_el = "reir"
		cara_fondo(el, "reir")
		shake(0.04, 0.3)
		card_note(I18n.t("Todo el país te ha visto reírte en pleno himno."))
		if not replay:
			Achievements.ingest_himno(false)
	else:
		di(I18n.t("¡AGUANTASTE!"), CareerTheme.NAV_YO)
		if audio != null:
			audio.unhush()
		ovation(0.0)
		UiAudio.haptic(30)

		_cara_yo = "alegria"
		cara_fondo(yo, "alegria")
		cara_momento(el, "guino", CARA_FINAL_S)
		_cara_el = ""
		cara_fondo(el, "")
		card_note(I18n.t("Cara de piedra con todo el país mirando."))
		if not replay:
			Achievements.ingest_himno(true)
	if _barra != null:
		_barra.queue_redraw()
	card_cta(I18n.t("AL CAMPO"))
	var tw: Tween = create_tween()
	tw.tween_interval(FIN_AUTO)
	tw.tween_callback(_leave)





class TiraTele extends Control:
	var camara: float = Himno.ANCHO
	var en_ti: bool = false
	var aviso: bool = false
	var reloj: float = 0.0

	func _draw() -> void:
		var n: int = Himno.LINEA_N
		var r: float = minf(13.0, size.x / float(n) * 0.32)
		var paso: float =(size.x - r * 4.0) / float(n - 1)
		var x0: float = r * 2.0
		var cy: float = size.y * 0.5


		var marco: Rect2
		var col: Color = CareerTheme.SURFACE_LINE
		var grosor: float = 2.0
		if camara < 0.0:
			marco = Rect2(x0 - r * 1.6, cy - r * 1.7, paso * float(n - 1) + r * 3.2, r * 3.4)
		else:
			var a: float = x0 +(camara - Himno.ENCUADRE) * paso
			var b: float = x0 +(camara + Himno.ENCUADRE) * paso
			marco = Rect2(a - r * 0.6, cy - r * 1.9, b - a + r * 1.2, r * 3.8)
			col = CareerTheme.DANGER if en_ti else CareerTheme.TEXT
			grosor = 4.0
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.draw_center = false
		sb.border_color = col
		sb.set_border_width_all(int(grosor))
		sb.set_corner_radius_all(int(r))
		draw_style_box(sb, marco)
		for i in n:
			var c: Vector2 = Vector2(x0 + float(i) * paso, cy)
			var relleno: Color = CareerTheme.SURFACE_HI
			if i == Himno.MIO:
				relleno = CareerTheme.NAV_YO
			elif i == Himno.VECINO:
				relleno = CareerTheme.NAV_GENTE
			draw_circle(c, r, relleno)
			if i == Himno.MIO:

				var anillo: Color = CareerTheme.DANGER if aviso and fmod(reloj, 0.25) < 0.14 \
						else CareerTheme.TEXT
				draw_arc(c, r + 5.0, 0.0, TAU, 28, anillo, 3.0, true)




class BarraRisa extends Control:
	const ROJA_DESDE: float = 0.75
	var risa: float = 0.0
	var estalla: bool = false

	func _draw() -> void:
		var fondo: StyleBoxFlat = StyleBoxFlat.new()
		fondo.bg_color = CareerTheme.SURFACE_HI
		fondo.border_color = CareerTheme.SURFACE_LINE
		fondo.set_border_width_all(2)
		fondo.set_corner_radius_all(int(size.y * 0.5))
		draw_style_box(fondo, Rect2(Vector2.ZERO, size))
		var k: float = clampf(risa, 0.0, 1.0)
		if k <= 0.0:
			return
		var lleno: StyleBoxFlat = StyleBoxFlat.new()
		lleno.bg_color = CareerTheme.DANGER if estalla or k >= ROJA_DESDE \
				else CareerTheme.NAV_GENTE
		lleno.set_corner_radius_all(int(size.y * 0.5))
		var w: float = maxf(size.y, size.x * k)
		draw_style_box(lleno, Rect2(Vector2.ZERO, Vector2(w, size.y)))
