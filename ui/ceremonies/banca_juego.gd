extends "res://ui/ceremonies/bench.gd"





























const JUEGO_KEYS: Array = [
	{"t": 0.0, "dist": 7.8, "h": 2.7, "yaw": 108.0, "aim_y": 0.7, "fov": 38.0},
	{"t": 2.6, "dist": 5.4, "h": 2.15, "yaw": 100.0, "aim_y": 0.62, "fov": 36.0},
]


const JUEGO_DRIFT: float = -0.06


const T_FICHA: float = 1.4


const FIN_AUTO: float = 6.0



const SOBRE_CABEZA: float = 0.62


const CARA_MOMENTO_S: float = 1.5
const CARA_FINAL_S: float = 2.2


const PEND: int = 0
const BIEN: int = 1
const MAL: int = 2

var yo: AnimatedSprite3D
var el: AnimatedSprite3D
var piel_yo: Color = KitRecolor.REF_SKIN
var piel_el: Color = KitRecolor.REF_SKIN


var nombre_el: String = ""
var llave_el: String = ""



var azar: RandomNumberGenerator = RandomNumberGenerator.new()

var auto: bool = false
var jugando: bool = false
var acabado: bool = false

var _y0: Dictionary = {}
var _caras: Dictionary = {}
var _marcador_yo: Array[Panel] = []
var _marcador_el: Array[Panel] = []
var _estado: Label
var _zona: VBoxContainer
var _al_campo: Button
var _burbujas: Array[Dictionary] = []


func _kind() -> String:
	return ""


func _titulo() -> String:
	return ""




func _juego_keys() -> Array:
	return JUEGO_KEYS


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())




func _consume() -> Dictionary:
	if GameState.next_starter:
		return {}
	return {
		"kind": _kind(),
		"status": Standing.STATUS_BANCA,
		"div": GameState.home_div(),
		"club": GameState.player_team_id,
		"season": GameState.season_num,
		"n": Career.bench_open_n,
	}


func _build_skip() -> void:
	pass


func _armar_auto_seguir() -> void:
	pass


func _build() -> void:
	make_stadium(_cfg_estadio())
	auto = bool(data.get("auto", false))
	azar.seed = hash("banca_juego|%s|%s|%s|%s" % [String(data.get("club", "")),
		str(data.get("season", 0)), str(data.get("n", 0)), _kind()])
	_sienta_pareja()
	make_camera(_juego_keys())
	orbit_speed = JUEGO_DRIFT
	make_audio(ATT, true)
	stadium.crowd_excite(0.5)


	stadium.hold_coaches(600.0, true)


	stadium.coach_aparta(true, focus)
	_monta_ficha()



func _sienta_pareja() -> void:
	var look: Dictionary = GameState.player_look()
	look["bib"] = Stadium.BIB_COLORS[0]
	piel_yo = look.get("skin", KitRecolor.REF_SKIN)
	var s: Array[Dictionary] = stadium.dugout_sentados(true)
	var i_el: int = -1
	var i_yo: int = -1



	for k in range(s.size() - 1, 0, -1):
		var dz: float =(s[k]["pos"] as Vector3).z -(s[k - 1]["pos"] as Vector3).z
		if dz < BancaJuego.HUECO:
			i_yo = k
			i_el = k - 1
			break
	if i_el < 0 and not s.is_empty():
		i_el = s.size() - 1
	if i_el >= 0:
		el = s[i_el]["node"]
		llave_el = String(s[i_el]["quien"])
	if i_yo >= 0:
		yo = s[i_yo]["node"]


		yo.remove_meta("viste")
	elif el != null:
		yo = AnimatedSprite3D.new()
		yo.pixel_size = el.pixel_size
		yo.billboard = el.billboard
		yo.texture_filter = el.texture_filter
		yo.alpha_cut = el.alpha_cut
		el.get_parent().add_child(yo)
		yo.position = el.position + Vector3(0.0, 0.0, BancaJuego.JUNTOS)
	else:


		var base: Vector3 = stadium.dugout_wait_spot(true)
		el = _sentado_suelto(base)
		yo = _sentado_suelto(base + Vector3(0.0, 0.0, BancaJuego.JUNTOS))
	var fr: SpriteFrames = stadium.sentado_frames(look)
	if fr != null:
		yo.sprite_frames = fr
		yo.play("idle")



	yo.position.z = BancaJuego.z_arrimado(yo.position.z, el.position.z)
	if el.sprite_frames == null:


		el.sprite_frames = stadium.sentado_frames(KitRecolor.appearance_for(llave_el, look))
		el.play("idle")




	stadium.sentado_gestos(yo.sprite_frames, look, _gestos())
	if el.sprite_frames != null:
		stadium.sentado_gestos(el.sprite_frames,
			el.sprite_frames.get_meta("anim_cfg", KitRecolor.appearance_for(llave_el, look)),
			_gestos())
	if el.has_meta("viste"):
		el.remove_meta("viste")
	for n: AnimatedSprite3D in [yo, el]:
		if not n.animation_finished.is_connected(_al_reposo.bind(n)):
			n.animation_finished.connect(_al_reposo.bind(n))

		_viva(n)
	nombre_el = I18n.t("TU COMPAÑERO") if llave_el.is_empty() or llave_el.contains("_sub") \
			else CareerTheme.caps(llave_el)
	if not llave_el.is_empty():
		piel_el = KitRecolor.traits_for(llave_el).get("skin", KitRecolor.REF_SKIN)
	_y0[yo] = yo.position.y
	_y0[el] = el.position.y

	var pyo: Vector3 = yo.global_position
	var pel: Vector3 = el.global_position
	focus = Vector3((pyo.x + pel.x) * 0.5, 0.0,(pyo.z + pel.z) * 0.5)


func _sentado_suelto(at: Vector3) -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.pixel_size = Stadium.SUB_HEIGHT / Stadium.PERSON_BODY_PX
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	viewport.add_child(s)
	s.position = Vector3(at.x - Stadium.SUB_STAND_X, 0.54 + 23.0 * s.pixel_size, at.z)
	return s




func _monta_ficha() -> void:
	make_card(T_FICHA)
	card_title(I18n.t(_titulo()), 34)
	if _contra():
		card_sub(I18n.tf("CONTRA {0}", [nombre_el]), CareerTheme.NAV_GENTE, 22) \
				.clip_text = true
	_monta_marcador()
	_estado = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	_estado.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_estado.clip_text = true
	card_box.add_child(_estado)
	_zona = VBoxContainer.new()
	_zona.add_theme_constant_override("separation", 10)
	card_box.add_child(_zona)
	_monta_juego(_zona)


	_al_campo = CareerUi.primary_cta(I18n.t("AL CAMPO"), _leave)
	CareerTheme.apply_button(_al_campo, CareerTheme.Kind.GHOST, 20)
	_al_campo.custom_minimum_size.y = 62
	card_box.add_child(_al_campo)




func _monta_marcador() -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 14)
	card_box.add_child(fila)
	var tu: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.NAV_YO)
	tu.text = I18n.t("TÚ")
	fila.add_child(tu)
	for i in _bolitas():
		_marcador_yo.append(_bolita(fila))
	if not _contra():
		pinta_marcador([], [])
		return
	var sep: Control = Control.new()
	sep.custom_minimum_size.x = 40
	fila.add_child(sep)
	for i in _bolitas():
		_marcador_el.append(_bolita(fila))
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(34, 34)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(ic)
	ic.setup("equipo", CareerTheme.NAV_GENTE)
	pinta_marcador([], [])


func _bolitas() -> int:
	return 2




func _contra() -> bool:
	return true




func _gestos() -> Array:
	return ["gana", "pierde"]


func _bolita(fila: HBoxContainer) -> Panel:
	var p: Panel = Panel.new()
	p.custom_minimum_size = Vector2(30, 30)
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(p)
	return p




func pinta_marcador(mios: Array, suyos: Array) -> void:
	for lado in 2:
		var bolas: Array[Panel] = _marcador_yo if lado == 0 else _marcador_el
		var estados: Array = mios if lado == 0 else suyos
		var col: Color = CareerTheme.NAV_YO if lado == 0 else CareerTheme.NAV_GENTE
		for i in bolas.size():
			var e: int = int(estados[i]) if i < estados.size() else PEND
			var sb: StyleBoxFlat = StyleBoxFlat.new()
			sb.set_corner_radius_all(15)
			sb.bg_color = col if e == BIEN else (CareerTheme.DANGER if e == MAL \
					else CareerTheme.SURFACE_HI)
			sb.border_color = CareerTheme.SURFACE_LINE
			sb.set_border_width_all(2 if e == PEND else 0)
			bolas[i].add_theme_stylebox_override("panel", sb)



func di(texto: String, col: Color = CareerTheme.TEXT) -> void:
	if _estado == null:
		return
	_estado.text = I18n.gritado_seguro(texto)
	_estado.add_theme_color_override("font_color", col)
	UiKit.punch(_estado)




func _monta_juego(_caja: VBoxContainer) -> void:
	pass



func _juega(_delta: float) -> void:
	pass












func foco_juego(b: Control, grupo: Array = []) -> void:
	if Entrada.modo != Entrada.Modo.MANDO or not is_instance_valid(b) \
			or not b.is_visible_in_tree():
		return
	if b is BaseButton and (b as BaseButton).disabled:
		return


	var f: Control = SceneFade.foco(self)
	if f != null and (f == b or grupo.has(f)):
		return



	if b.focus_mode == Control.FOCUS_NONE:
		Entrada.foco_para(b)
	b.grab_focus()










func salta_con_atras() -> bool:
	if Entrada.modo != Entrada.Modo.MANDO:
		return super()
	if _leaving:
		return true
	var al_campo: bool = is_instance_valid(_al_campo) and _al_campo.is_visible_in_tree()
	if not (al_campo or acabado):
		return false
	_leave()
	return true


func _tick(delta: float) -> void:
	_tick_burbujas()
	if acabado or not ficha_puesta:
		return
	if not jugando:
		jugando = true
	_juega(delta)







func bota(n: AnimatedSprite3D, alto: float = 0.06, dura: float = 0.18) -> void:
	if n == null or not _y0.has(n):
		return
	var y0: float = float(_y0[n])
	var tw: Tween = create_tween()
	tw.tween_property(n, "position:y", y0 + alto, dura * 0.4) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.tween_property(n, "position:y", y0, dura * 0.6) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)




const BOTE_DE: Dictionary = {
	"chinchan": 0.04, "lanza": 0.05, "toque": 0.04, "gana": 0.1, "pierde": 0.0,
}





func gesto(n: AnimatedSprite3D, nombre: String) -> void:
	if n == null or not is_instance_valid(n):
		return
	var fr: SpriteFrames = n.sprite_frames
	if fr != null and fr.has_animation(nombre):

		n.play(nombre)
		return
	var alto: float = float(BOTE_DE.get(nombre, 0.05))
	if alto > 0.0:
		bota(n, alto, 0.18 if alto < 0.08 else 0.3)


func _al_reposo(n: AnimatedSprite3D) -> void:
	if is_instance_valid(n) and n.sprite_frames != null and n.sprite_frames.has_animation("idle"):
		n.play("idle")













func cara_fondo(n: AnimatedSprite3D, estado: String) -> void:
	if n == null or not is_instance_valid(n):
		return
	var c: Dictionary = _caras.get(n, {"fondo": "", "token": 0, "momento": false})
	c["fondo"] = estado
	_caras[n] = c
	if not bool(c["momento"]):
		_pon_cara(n, estado)


func cara_momento(n: AnimatedSprite3D, anim: String, dura_s: float) -> void:
	if n == null or not is_instance_valid(n):
		return
	var c: Dictionary = _caras.get(n, {"fondo": "", "token": 0, "momento": false})


	c["token"] = int(c["token"]) + 1
	c["momento"] = true
	_caras[n] = c
	_pon_cara(n, anim)

	var tw: Tween = create_tween()
	tw.tween_interval(dura_s)
	tw.tween_callback(_cara_acaba.bind(n, int(c["token"])))


func _cara_acaba(n: AnimatedSprite3D, token: int) -> void:
	if not is_instance_valid(n) or not _caras.has(n):
		return
	var c: Dictionary = _caras[n]
	if int(c["token"]) != token:
		return
	c["momento"] = false
	_pon_cara(n, String(c["fondo"]))


func _pon_cara(n: AnimatedSprite3D, anim: String) -> void:
	var viva: CaraViva = _viva(n)
	if viva != null:
		viva.anima(anim)











func _viva(n: AnimatedSprite3D) -> CaraViva:
	if n == null or not is_instance_valid(n):
		return null
	var ya: CaraViva = CaraViva.de(n)
	if ya != null:
		return ya
	var fr: SpriteFrames = n.sprite_frames
	if fr != null and fr.has_meta("cara_rutas") and not fr.has_meta("cara_fuentes"):

		fr.set_meta("cara_fuentes", fr.get_meta("cara_rutas"))
		fr.set_meta("look_cfg", fr.get_meta("anim_cfg", {}))
	return CaraViva.pon(n)




func burbuja(n: AnimatedSprite3D) -> PanelContainer:
	var b: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(22)
	sb.set_content_margin_all(12)
	b.add_theme_stylebox_override("panel", sb)
	b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.visible = false

	add_child(b)
	if card != null:
		move_child(b, card.get_index())
	_burbujas.append({"panel": b, "nodo": n})
	return b




static func mano(cual: int, piel: Color, lado: int = 100) -> TextureRect:
	var r: TextureRect = TextureRect.new()
	r.texture = load(MANOS_PNG[clampi(cual, 0, 2)])
	r.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	r.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	r.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	r.custom_minimum_size = Vector2(lado, lado)
	r.modulate = piel
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return r


const MANOS_PNG: Array[String] = BancaJuego.MANOS_PNG





func _tick_burbujas() -> void:
	if cam == null or not is_instance_valid(cam):
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	for e in _burbujas:
		var b: PanelContainer = e["panel"]
		var n: AnimatedSprite3D = e["nodo"]
		if not b.visible or n == null or not is_instance_valid(n):
			continue
		var cabeza: Vector3 = n.global_position + Vector3(0.0, SOBRE_CABEZA, 0.0)
		if cam.is_position_behind(cabeza):
			continue
		var p: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
		p -= Vector2(b.size.x * 0.5, b.size.y)
		p.x = clampf(p.x, 16.0, size.x - b.size.x - 16.0)
		b.position = p








func termina(res: int, premio: String = "") -> void:
	if acabado:
		return
	acabado = true
	if res > 0:
		di(I18n.t("¡GANASTE!"), CareerTheme.NAV_YO)
	elif res < 0:
		di(I18n.t("PERDISTE"), CareerTheme.NAV_GENTE)
	else:
		di(I18n.t("EMPATE"), CareerTheme.TEXT)
	_zona.visible = false
	_al_campo.visible = false
	card_note(I18n.t("Hoy recoge él los conos.") if res > 0 else (
		I18n.t("Hoy recoges tú los conos.") if res < 0 else I18n.t("Los conos, a medias.")))
	if not premio.is_empty():
		card_sub(premio, CareerTheme.NAV_YO).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	card_cta(I18n.t("AL CAMPO"))
	sting("ui_confirm" if res >= 0 else "ui_back", -4.0)
	UiAudio.haptic(30 if res > 0 else 15)



	if res > 0:
		gesto(yo, "gana")
		gesto(el, "pierde")
		_cara_final(yo, el)
	elif res < 0:
		gesto(el, "gana")
		gesto(yo, "pierde")
		_cara_final(el, yo)
	else:
		for n: AnimatedSprite3D in [yo, el]:
			cara_fondo(n, "")
			cara_momento(n, "resoplar", CARA_FINAL_S)
	var tw: Tween = create_tween()
	tw.tween_interval(FIN_AUTO)
	tw.tween_callback(_leave)


func _cara_final(gana: AnimatedSprite3D, pierde: AnimatedSprite3D) -> void:
	cara_fondo(gana, "alegria")
	cara_momento(gana, "grito", CARA_FINAL_S)
	cara_fondo(pierde, "tristeza")
	cara_momento(pierde, "protesta", CARA_FINAL_S)


func _skipped() -> void:
	pass
