extends Control





















const MENU_BG_PATH: String = "res://ui/menu_stadium_bg.tscn"
const BG_FADE: float = 0.35








const INTRO_SCREEN: GDScript = preload("res://ui/portada_intro.gd")

var _loading: PortadaIntro

var _acunadas: bool = false




var _del_arranque: bool = false

var _con_intro: bool = false






func _init() -> void:
	_del_arranque = not Telemetry.tiene_fase("es")
	Telemetry.fase_arranque("es")


var _logros_encima: bool = false








var _fondo: ColorRect




var _medallas: Array[OvrBadge] = []
var _placas: Array[SlotPlate] = []

var _logo_ball: PixelBall
var _logo_title: Label
var _logo_firma: VBoxContainer




var _ui_root: VBoxContainer
var _scrim: CanvasItem









const ACHIEVEMENT_POPUP_PATH: String = "res://ui/achievement_popup.gd"

const TIENDA_LEGADO: GDScript = preload("res://ui/tienda_legado.gd")
const NEW_CAREER_SCENE: String = "res://ui/new_career.tscn"
const HUB_SCENE: String = "res://ui/career_hub.tscn"
const RETIRE_SCENE: String = "res://ui/retirement.tscn"









const REVIEW_URL: String = "https://apps.apple.com/app/id6796523780?action=write-review"
const REVIEW_URL_ANDROID: String = "market://details?id=football.legacy"




const REVIEW_URL_ANDROID_WEB: String = "https://play.google.com/store/apps/details?id=football.legacy"







const STORE_LOGO: String = "res://assets/branding/tiendas/appstore.svg"
const STORE_LOGO_ANDROID: String = "res://assets/branding/tiendas/googleplay.svg"













const SHARE_URL: String = "https://www.footballlegacy.org/app"




const SHARE_ICON: String = "res://assets/branding/iconos/compartir.svg"








const CONTACT_ICON: String = "res://assets/branding/iconos/contacto.svg"
const WHATSAPP_ICON: String = "res://assets/branding/redes/whatsapp.svg"
const CONTACTO_NOMBRE: String = "CESAR ALVAREZ"
const CONTACTO_WA: String = "+52 442 114 9057"
const CONTACTO_WA_URL: String = "https://wa.me/524421149057"
const CONTACTO_MAIL: String = "calvarez@footballlegacy.org"



const MEZCLA_CONTACTO: float = 0.4




const SUN_ICON: String = "res://assets/branding/iconos/sol.svg"
const MOON_ICON: String = "res://assets/branding/iconos/luna.svg"



func _ready() -> void:


	Telemetry.fase_arranque("mm")












	if not Lienzo.ya_cuadra():
		set_process(false)
		var espera: TextureRect = PortadaIntro.splash_rect(true)
		add_child(espera)
		await Lienzo.espera_giro()
		espera.free()
		_sella_giro()
		if not is_inside_tree():
			return


		Lienzo.rehaz_al_cuadrar(self, "res://ui/main_menu.tscn")







	if not SceneFade.portada_presentada and PackRecibido.hay():
		add_child(PortadaIntro.splash_rect(true))
		SceneFade.to_scene_sobre("res://ui/squad_editor.tscn", PortadaIntro.splash_rect(true))
		return











	if Apertura.toca_arrancar():






		add_child(PortadaIntro.splash_rect(true))
		SceneFade.to_scene_sobre("res://ui/apertura.tscn", PortadaIntro.splash_rect(true))
		return




	if Career.has_save() and not Career.retired:
		CareerUi.dress_for_matchday(GameState.current_fixture())
	else:
		CareerTheme.clear_ctx()






	SceneFade.arbol().process_frame.connect(_pide_coliseo, CONNECT_ONE_SHOT)
	set_process(true)



	_scrim = CareerTheme.scrim()
	add_child(_scrim)








	Music.play("menu")
	_build_ui()



	Respaldo.copias_cambiaron.connect(_al_cambiar_copias)




	if not Anuncios.apagado():
		Anuncios.refresca(self)











	if SceneFade.portada_presentada:
		_fondo = ColorRect.new()
		_fondo.color = CareerTheme.BG_DEEP
		_fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
		_fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(_fondo)


		move_child(_fondo, 0)

		_acuna_medallas()
	else:
		SceneFade.portada_presentada = true
		_con_intro = _del_arranque
		_loading = INTRO_SCREEN.new()
		_loading.sella_tope = _con_intro
		add_child(_loading)


		_loading.apunta_a(_logo_ball, _logo_title, _ui_root, _scrim, _logo_firma)
		_loading.silencia_musica()





		_loading.retirada.connect(_al_retirarse_intro, CONNECT_ONE_SHOT)


	_present_achievements()


	PackRecibido.reintenta()


func _pide_coliseo() -> void:



	_esperando_leyendas = Legends.pide_generadas()
	if not _esperando_leyendas:
		_pide_el_coliseo()


func _pide_el_coliseo() -> void:
	_coliseo_pedido = true


	if not PortadaFusible.abre_3d(self):
		return
	_marca_coliseo("pide")
	ResourceLoader.load_threaded_request(MENU_BG_PATH)



var _esperando_leyendas: bool = false





const STADIUM_GD: String = "res://features/stadium/stadium.gd"

















func _marca_coliseo(paso: String, extra: Dictionary = {}) -> void:
	if not OS.has_feature("banco"):
		return
	var d: Dictionary = {"ev": "coliseo", "paso": paso, "us": Time.get_ticks_usec(),
		"cuadro": Engine.get_process_frames()}
	d.merge(extra)
	SceneFade.banco_ev(d)





func _estado_guion_estadio() -> Dictionary:
	var en_cache: bool = ResourceLoader.has_cached(STADIUM_GD)
	var g: Resource = ResourceLoader.get_cached_ref(STADIUM_GD) if en_cache else null
	return {"en_cache": en_cache,
		"compilado": g is Script and (g as Script).can_instantiate()}




var _coliseo_pedido: bool = false






func _process(_dt: float) -> void:
	if _esperando_leyendas:
		if not Legends.generadas_listas():
			return
		_esperando_leyendas = false
		_pide_el_coliseo()
		return
	var estado: int = ResourceLoader.load_threaded_get_status(MENU_BG_PATH)





	if estado == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		return
	if estado != ResourceLoader.THREAD_LOAD_LOADED and not _coliseo_pedido:
		return
	set_process(false)
	if OS.has_feature("banco"):
		_marca_coliseo("listo", _estado_guion_estadio().merged({"estado": estado}))




		RenderingServer.frame_pre_draw.connect(SceneFade.banco_ev.bind(
			{"ev": "coliseo", "paso": "dibujo_ini"}), CONNECT_ONE_SHOT)
		RenderingServer.frame_post_draw.connect(SceneFade.banco_ev.bind(
			{"ev": "coliseo", "paso": "dibujo_fin"}), CONNECT_ONE_SHOT)
		SceneFade.arbol().process_frame.connect(SceneFade.banco_ev.bind(
			{"ev": "coliseo", "paso": "cuadro_sig"}), CONNECT_ONE_SHOT)















	SceneFade.precalienta_desde_portada()
	if estado != ResourceLoader.THREAD_LOAD_LOADED:
		_dismiss_loading()
		return
	var scene: PackedScene = ResourceLoader.load_threaded_get(MENU_BG_PATH) as PackedScene
	_marca_coliseo("recogido")
	if scene == null:


		_dismiss_loading()
		return
	var bg: CanvasItem = scene.instantiate() as CanvasItem
	_marca_coliseo("instanciado")
	bg.modulate.a = 0.0




	bg.connect("world_ready", func() -> void:
		_sella_world_ready()
		var tw: Tween = create_tween()
		tw.tween_property(bg, "modulate:a", 1.0, BG_FADE)

		if _fondo != null:
			tw.finished.connect(_drop_fondo)





		_dismiss_loading(String(bg.get("clima")), bg))
	bg.connect("world_progress", func(done: float) -> void:
		if _loading != null:
			_loading.set_progress(done))

	add_child(bg)
	_marca_coliseo("montado")
	move_child(bg, 0)


	if _fondo != null:
		move_child(_fondo, 0)





func _dismiss_loading(clima: String = "night", bg: CanvasItem = null) -> void:
	if not is_instance_valid(_loading):
		_loading = null
		return



	_loading.amanece_hacia(clima, bg)









	_loading.dismiss()
	_loading = null





	_acuna_medallas()











func _acuna_medallas() -> void:


	if _acunadas:
		return
	_acunadas = true
	for placa in _placas:
		placa.arranca()
	for i in _medallas.size():
		var m: OvrBadge = _medallas[i]
		m.arranca()
		m.acuna(0.2 + float(i) * 0.3)






func _sella_giro() -> void:
	if _del_arranque:
		Telemetry.fase_arranque("gi")





func _sella_world_ready() -> void:
	if _con_intro:
		Telemetry.fase_arranque("wr")







func acepta_pack() -> bool:
	if _loading != null or SceneFade.en_fundido() or CareerUi.modal_open(self):
		return false
	SceneFade.to_scene("res://ui/squad_editor.tscn")
	return true




func _al_retirarse_intro() -> void:

	if _con_intro:
		Telemetry.fase_arranque("ri")
	_loading = null
	_acuna_medallas()
	_novedades_al_entrar()







func _drop_fondo() -> void:
	if _fondo == null:
		return
	_fondo.queue_free()
	_fondo = null



func _exit_tree() -> void:
	CareerTheme.clear_ctx()
	if Respaldo.copias_cambiaron.is_connected(_al_cambiar_copias):
		Respaldo.copias_cambiaron.disconnect(_al_cambiar_copias)




	if _con_intro and not Telemetry.tiene_fase("wr"):
		Telemetry.fase_arranque("sx")




func _al_cambiar_copias() -> void:
	if CareerUi.modal_open(self) or SaveSlots.primera_libre() < 0:
		return
	if is_instance_valid(_ui_root):
		_ui_root.queue_free()
	_build_ui()




func _present_achievements() -> void:




	if Career.retired:
		return
	var rows: Array = Achievements.take_pending()
	if rows.is_empty():
		return
	var popup: Control =(load(ACHIEVEMENT_POPUP_PATH) as GDScript).new()
	add_child(popup)
	popup.setup(rows)


	_logros_encima = true


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 40.0
	root.offset_right = -40.0
	root.offset_top = 48.0
	root.offset_bottom = -48.0
	root.add_theme_constant_override("separation", 16)
	CareerUi.apply_safe_area(root, get_viewport())
	add_child(root)
	_ui_root = root
	if UiKit.es_horizontal():
		_build_ui_apaisada(root)
		CareerUi.normalize_caps(root)
		return






	_build_top_bar(root)

	_build_logo(root)












	if SaveSlots.count() > SaveSlots.COUNT:
		_build_slots_scroll(root)
	else:
		_build_slots(root)








	_build_practice(root)
	var fila_baja: HBoxContainer = HBoxContainer.new()
	fila_baja.add_theme_constant_override("separation", 12)
	root.add_child(fila_baja)
	_build_buttons(fila_baja)
	_build_banner(root)


	CareerUi.normalize_caps(root)









































const COL_MARCA_W: float = 600.0



const BOTONERA_ALTO: float = 112.0


func _build_ui_apaisada(root: VBoxContainer) -> void:



	var cabecera: HBoxContainer = HBoxContainer.new()
	cabecera.add_theme_constant_override("separation", 24)
	root.add_child(cabecera)




	var ala: VBoxContainer = VBoxContainer.new()
	ala.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ala.alignment = BoxContainer.ALIGNMENT_BEGIN
	ala.add_theme_constant_override("separation", 16)
	ala.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cabecera.add_child(ala)


	var iconos: HBoxContainer = HBoxContainer.new()
	iconos.add_theme_constant_override("separation", 12)
	ala.add_child(iconos)
	_build_iconos(iconos)
	_build_banner(ala, BANNER_ALTO_TUMBADO)
	var marca: VBoxContainer = VBoxContainer.new()
	marca.custom_minimum_size = Vector2(COL_MARCA_W, 0)
	marca.add_theme_constant_override("separation", 16)
	cabecera.add_child(marca)
	_build_logo(marca)
	var der: VBoxContainer = VBoxContainer.new()
	der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cabecera.add_child(der)
	_build_top_bar(der)
	_build_slots_fila(root)
	var botonera: HBoxContainer = HBoxContainer.new()
	botonera.add_theme_constant_override("separation", 12)
	root.add_child(botonera)
	_build_practice(botonera)
	_build_buttons(botonera)




func _build_slots_scroll(padre: VBoxContainer) -> void:
	var sc: DragScroll = DragScroll.new()
	sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	padre.add_child(sc)
	var ranuras: VBoxContainer = VBoxContainer.new()
	ranuras.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ranuras.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sc.add_child(ranuras)
	_build_slots(ranuras)













func _build_slots_fila(padre: VBoxContainer) -> void:
	var caja: GridContainer = GridContainer.new()
	caja.columns = SaveSlots.count()
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.size_flags_vertical = Control.SIZE_EXPAND|Control.SIZE_SHRINK_CENTER
	var sep: int = SLOT_SEP_CUATRO if _cuatro_apretadas() else SLOT_SEP
	caja.add_theme_constant_override("h_separation", sep)
	caja.add_theme_constant_override("v_separation", sep)
	padre.add_child(caja)
	for i in SaveSlots.count():
		_add_slot_card(caja, i, true)



















const ESCUDO_FILA: float = 76.0
const ESCUDO_FILA_BAJO: float = 60.0

const SLOT_SEP: int = 14
const SLOT_SEP_INT: int = 8


const SLOT_SEP_CUATRO: int = 8
const SLOT_MARGEN_CUATRO: float = 14.0












func _build_slots(root: VBoxContainer) -> void:
	var caja: VBoxContainer = VBoxContainer.new()
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_theme_constant_override("separation",
		SLOT_SEP_CUATRO if _cuatro_apretadas() else SLOT_SEP)
	root.add_child(caja)
	for i in SaveSlots.count():
		_add_slot_card(caja, i, true)










func _cuatro_apretadas() -> bool:
	return SaveSlots.count() > SaveSlots.COUNT and not _cta_cabe()





func _build_logo(root: VBoxContainer) -> void:

	var ball: PixelBall = PixelBall.new()
	ball.custom_minimum_size = Vector2(108, 108)
	ball.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	root.add_child(ball)
	_logo_ball = ball

	var title: Label = Label.new()
	CareerTheme.title(title, 64)
	title.text = "FOOTBALL\nLEGACY"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_constant_override("line_spacing", 6)
	root.add_child(title)
	_logo_title = title
	CareerTheme.rule(root)






	var firma: VBoxContainer = VBoxContainer.new()
	firma.add_theme_constant_override("separation", 6)
	firma.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(0, PortadaIntro.FIRMA_HUECO_DEST)
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	firma.add_child(hueco)
	var pre: Label = CareerUi.plain(PortadaIntro.FIRMA_PRE_DEST, CareerTheme.TEXT_DIM)
	pre.text = I18n.t("UN JUEGO DE")
	pre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	firma.add_child(pre)
	var who: Label = CareerUi.plain(PortadaIntro.FIRMA_WHO_DEST, CareerTheme.MONEY)
	who.text = "CESAR ALVAREZ"
	who.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	firma.add_child(who)
	CareerUi.normalize_caps(firma)


	firma.visible = false
	root.add_child(firma)
	_logo_firma = firma






func _add_slot_card(parent: Container, slot: int, hero: bool = false) -> void:
	var info: Dictionary = SaveSlots.summary(slot)
	var used: bool = bool(info.get("exists", false))
	var team: Dictionary = Teams.by_id(String(info.get("team_id", ""))) if used else {}


	var col_accent: Color = CareerTheme.accent_of(team) if used else CareerTheme.accent()













	var media_slot: int = int(info.get("ovr", 0))
	var fase: float = OvrBadge.fase_estreno(media_slot, 0.55 + float(slot) * 0.3)
	var plate: PanelContainer
	if used:

		var metal: SlotPlate = SlotPlate.new()
		metal.setup(media_slot, fase)
		_placas.append(metal)
		plate = metal
	else:


		plate = PanelContainer.new()
	var sb_plate: StyleBox = KitPattern.stylebox(team, int(info.get("season", 1))) if used \
			else CareerTheme.plate()
	if _cuatro_apretadas():
		sb_plate = sb_plate.duplicate()
		sb_plate.content_margin_top = minf(sb_plate.content_margin_top, SLOT_MARGEN_CUATRO)
		sb_plate.content_margin_bottom = minf(sb_plate.content_margin_bottom, SLOT_MARGEN_CUATRO)
	plate.add_theme_stylebox_override("panel", sb_plate)


	plate.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(plate)
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", SLOT_SEP_INT)
	plate.add_child(col)


	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 10)
	col.add_child(head)







	var tag: Label = CareerUi.plain(18,
		Color(CareerTheme.INK_LIGHT.r, CareerTheme.INK_LIGHT.g,
			CareerTheme.INK_LIGHT.b, 0.72) if used else CareerTheme.TEXT_DIM)
	tag.text = I18n.tf("RANURA {0}", [slot + 1])
	tag.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	head.add_child(tag)
	if slot == SaveSlots.active:
		var active_chip: PanelContainer = PanelContainer.new()
		active_chip.add_theme_stylebox_override("panel", CareerTheme.tag(col_accent))
		var al: Label = CareerUi.plain(16, CareerTheme.on_color(col_accent))
		al.text = I18n.t("ACTIVA")
		active_chip.add_child(al)
		head.add_child(active_chip)

	if used:
		_fill_used_card(col, slot, info, team, col_accent, hero, fase)
	else:
		_fill_empty_card(col, slot)




















func _fill_used_card(col: VBoxContainer, slot: int, info: Dictionary,
		team: Dictionary, col_accent: Color, hero: bool = false,
		fase: float = 0.0) -> void:
	var retired: bool = bool(info.get("retired", false))
	var media: int = int(info.get("ovr", 0))









	var tumbada: bool = UiKit.es_horizontal()

	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	col.add_child(row)
	var vit: Control = vitrina(info, team, media, fase)


	_medallas.append(vit.get_meta("medalla") as OvrBadge)
	row.add_child(vit)

	var datos: VBoxContainer = VBoxContainer.new()
	datos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	datos.add_theme_constant_override("separation", SLOT_SEP_INT)
	row.add_child(datos)





	var id_row: HBoxContainer = HBoxContainer.new()
	id_row.add_theme_constant_override("separation", 12)
	datos.add_child(id_row)
	var who: VBoxContainer = VBoxContainer.new()
	who.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	who.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	who.add_theme_constant_override("separation", 4)
	id_row.add_child(who)




	var name_l: Label = CareerUi.plain(28, CareerTheme.INK_LIGHT)
	name_l.text = CareerTheme.caps(String(info.get("name", "")))
	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	who.add_child(name_l)


	var club_l: Label = CareerUi.plain(19,
		Color(CareerTheme.INK_LIGHT.r, CareerTheme.INK_LIGHT.g, CareerTheme.INK_LIGHT.b, 0.58))

	club_l.text = "%s · %s" % [CareerTheme.caps(String(team.get("name", I18n.t("Sin club")))),
		Teams.div_short(int(info.get("div", 3)))]
	club_l.clip_text = true
	club_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	who.add_child(club_l)











	var crest: CrestView = CrestView.new()
	var d_crest: float = ESCUDO_FILA if _cta_cabe() else ESCUDO_FILA_BAJO
	crest.custom_minimum_size = Vector2(d_crest, d_crest)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crest.set_team(team)
	id_row.add_child(crest)

	if tumbada:



		var head: HBoxContainer = col.get_child(0) as HBoxContainer
		(head.get_child(0) as Control).size_flags_horizontal = Control.SIZE_FILL
		var plata: Label = _plata(info)
		plata.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		plata.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		head.add_child(plata)
		head.move_child(plata, 1)
		CareerUi.autoshrink(plata, 16)
		_add_deeds_row(datos, info, col_accent, hero, 3)
		_add_pie_row(col if _cuatro_apretadas() else datos, info, col_accent, retired, false)
	else:
		_add_deeds_row(datos, info, col_accent, hero)
		_add_pie_row(datos, info, col_accent, retired)









	var go: Button = Button.new()
	go.text = I18n.t("VER LEGADO") if retired else I18n.t("CONTINUAR")








	var cta: bool = hero and _cta_cabe() and SaveSlots.count() <= SaveSlots.COUNT
	var fila: bool = hero and not _cuatro_apretadas()
	go.custom_minimum_size = Vector2(0,
		CareerTheme.BTN_CTA_H if cta else (CareerTheme.BTN_ROW_H if fila else 58))
	go.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button_accent(go, col_accent,
		CareerTheme.BTN_CTA_FONT if cta else (CareerTheme.BTN_SECONDARY_FONT if fila else 30))
	go.pressed.connect(func() -> void: _open_slot(slot, retired))


	if slot == SaveSlots.active:
		go.set_meta(Entrada.PRIMERO_META, true)
	col.add_child(go)





























const VITRINA: Vector2 = Vector2(145, 190)

const VITRINA_DORSAL: float = 18.0



const VITRINA_OVR: int = 24



const VITRINA_ROL: float = 30.0


const VITRINA_ROL_MIN: float = 20.0

const VITRINA_ROL_X: float = 6.0
const VITRINA_ROL_AIRE: float = 6.0
const VITRINA_ROL_SEP: int = 4






static func vitrina(info: Dictionary, team: Dictionary, media: int,
		fase: float) -> Control:
	var baja: int = int(info.get("injury_weeks", 0))
	var caja: Control = Control.new()
	caja.custom_minimum_size = VITRINA


	caja.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE





	var marco: Control = Control.new()
	marco.set_anchors_preset(Control.PRESET_FULL_RECT)
	marco.clip_contents = true
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(marco)



	var nat: String = String(info.get("nat", ""))
	if not nat.is_empty():
		var fondo: TextureRect = Flags.make_rect(nat, 0.0)
		fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
		fondo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		fondo.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED

		fondo.modulate.a = PlayerCard.FONDO_ALFA
		marco.add_child(fondo)






	var velo: ColorRect = ColorRect.new()
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	velo.color = CardFrame.tier_de(media, false, baja > 0)
	velo.color.a = PlayerCard.VELO_METAL
	marco.add_child(velo)

	var av: PlayerAvatar = PlayerAvatar.new()
	av.set_anchors_preset(Control.PRESET_FULL_RECT)

	av.chrome = false




	av.bust = PlayerAvatar.BUST_TORSO


	av.club = team
	marco.add_child(av)











	var poss: Array = info.get("poss", ["DC"]) as Array
	var portero: bool = not poss.is_empty() and String(poss[0]) == "POR"
	var base: Dictionary = GameState.kit_variant(team, 0, int(info.get("season", 1)))
	if portero:
		base = KitRecolor.keeper_cfg(String(team.get("id", "")), -1,
			String(base.get("pattern", "solid")))
	base["number"] = int(info.get("number", 0))




	var cfg: Dictionary = KitRecolor.appearance_for(String(info.get("name", "")), base)
	var look: Dictionary = info.get("look", {}) as Dictionary
	if not look.is_empty():
		cfg = look.duplicate()
		cfg.merge(base, true)
	av.set_look(cfg, PlayerCard.KEEPER_TEX if portero else null)




	var marca: CardFrame.Marca = CardFrame.Marca.new()
	marca.set_anchors_preset(Control.PRESET_FULL_RECT)
	marca.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(marca)
	marca.pon(int(info.get("number", 0)), CardFrame.tier_de(media, false, baja > 0),
		VITRINA_DORSAL)












	var chapas: Array[String] = []
	if bool(info.get("is_captain", false)):
		chapas.append("capitan")
	if bool(info.get("cobra_penales", false)):
		chapas.append("penal")
	if bool(info.get("cobra_parados", false)):
		chapas.append("parado")
	if baja > 0:
		chapas.append("lesion")
	if not chapas.is_empty():










		var fs_dorsal: int = maxi(CardFrame.DORSAL_MIN_FS,
			int(roundf(VITRINA.y * CardFrame.DORSAL_PARTE)))
		var ancho_dorsal: float = float(str(int(info.get("number", 0))).length()
			* fs_dorsal)
		var libre: float = VITRINA.x - VITRINA_DORSAL - ancho_dorsal * 0.5 \
				- VITRINA_ROL_X - VITRINA_ROL_AIRE
		var n: int = chapas.size()
		var d: float = clampf((libre - float(VITRINA_ROL_SEP *(n - 1))) / float(n),
			VITRINA_ROL_MIN, VITRINA_ROL)
		var roles: HBoxContainer = HBoxContainer.new()
		roles.add_theme_constant_override("separation", VITRINA_ROL_SEP)
		roles.mouse_filter = Control.MOUSE_FILTER_IGNORE
		for tipo in chapas:
			roles.add_child(PlayerCard.medalla_rol(tipo, d))




		roles.position = Vector2(VITRINA_ROL_X, VITRINA.y - d - 4.0)
		caja.add_child(roles)









	var ovr: OvrBadge = OvrBadge.new()
	ovr.setup(media, VITRINA_OVR)
	ovr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(ovr)



	ovr.size = ovr.custom_minimum_size
	ovr.position = Vector2(VITRINA.x - ovr.custom_minimum_size.x + 2.0, -2.0)


	ovr.sincroniza(fase)














	var puestos: VBoxContainer = PlayerCard.columna_puestos(
		info.get("poss", ["DC"]) as Array)




	puestos.position = Vector2(-2.0,
		-2.0 +(ovr.custom_minimum_size.y - PlayerCard.tam_pastilla().y) * 0.5)
	caja.add_child(puestos)
	caja.set_meta("medalla", ovr)
	return caja



















func _add_pie_row(datos: VBoxContainer, info: Dictionary, col_accent: Color,
		retired: bool, con_plata: bool = true) -> void:
	var pie: HBoxContainer = HBoxContainer.new()
	pie.add_theme_constant_override("separation", 10)
	datos.add_child(pie)

	var izq: HBoxContainer = HBoxContainer.new()
	izq.add_theme_constant_override("separation", 8)


	izq.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	izq.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pie.add_child(izq)
	if retired:
		_stat_chip(izq, "equipo", str(int(info.get("matches", 0))), col_accent, false)
	else:
		_stat_chip(izq, "reloj", I18n.tf("T{0}", [int(info.get("season", 1))]),
			col_accent, false)
		_stat_chip(izq, "perfil", I18n.tf("{0} AÑOS", [int(info.get("age", 17))]),
			col_accent, false)
	if not con_plata:
		return
	var plata: Label = _plata(info)





	plata.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	plata.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	pie.add_child(plata)





func _plata(info: Dictionary) -> Label:
	var plata: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.MONEY)
	plata.text = "$ %s" % CareerUi.money(int(info.get("money", 0)))
	plata.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	plata.clip_text = true
	return plata








func _cta_cabe() -> bool:
	return SceneFade.rect_visible(self).size.y >= CTA_ALTO_MIN

const CTA_ALTO_MIN: float = 2200.0



















func _add_deeds_row(col: VBoxContainer, info: Dictionary, col_accent: Color,
		hero: bool = false, rejilla: int = 0) -> void:










	if int(info.get("matches", 0)) == 0 and not hero:
		return


	var deeds: Container
	if rejilla > 0:
		var g: GridContainer = GridContainer.new()
		g.columns = rejilla
		g.add_theme_constant_override("v_separation", 8)
		deeds = g
	else:
		deeds = HFlowContainer.new()
		deeds.add_theme_constant_override("v_separation", 8)
	deeds.add_theme_constant_override("h_separation", HECHOS_SEP)
	col.add_child(deeds)



	if rejilla == 0:
		deeds.resized.connect(_aprieta_hechos.bind(deeds))





	var pj: int = int(info.get("matches", 0))
	_stat_chip(deeds, "gol", str(int(info.get("goals", 0))), CareerTheme.STAT_GOAL)
	_stat_chip(deeds, "asist", str(int(info.get("assists", 0))), CareerTheme.STAT_ASSIST)
	_stat_chip(deeds, "media",
		"—" if pj == 0 else "%.1f" % float(info.get("avg", 0.0)), CareerTheme.STAT_AVG)





	var team_cups: int = int(info.get("cups_team", 0))
	if hero or team_cups > 0:
		_stat_chip(deeds, "trofeo:liga", str(team_cups), col_accent)
	var solo_cups: int = int(info.get("cups_solo", 0))
	if hero or solo_cups > 0:
		_stat_chip(deeds, "trofeo:mvp", str(solo_cups), col_accent)








	var legado: int = int(info.get("legacy", 0))
	if hero or legado > 0:
		_stat_chip(deeds, "vitrina", str(legado), CareerTheme.NAV_LEGADO)
	if rejilla > 0:
		deeds.set_meta("apretado", true)
		_aprieta(deeds)




















const HECHOS_SEP: int = 10
const HECHOS_SEP_APRE: int = 6
const HECHOS_FS: int = 20
const HECHOS_FS_APRE: int = 16
const HECHOS_ICO: float = 26.0
const HECHOS_ICO_APRE: float = 22.0



const HECHOS_PAD_APRE: float = 14.0


func _aprieta_hechos(deeds: HFlowContainer) -> void:
	if bool(deeds.get_meta("apretado", false)) or deeds.size.x <= 0.0:
		return
	var n: int = deeds.get_child_count()
	if n <= 1:
		return
	var pide: float = float(HECHOS_SEP *(n - 1))
	for c in deeds.get_children():
		pide +=(c as Control).get_combined_minimum_size().x
	if pide <= deeds.size.x:
		return

	deeds.set_meta("apretado", true)
	_aprieta(deeds)



func _aprieta(deeds: Container) -> void:
	deeds.add_theme_constant_override("h_separation", HECHOS_SEP_APRE)
	for c in deeds.get_children():
		var chip: PanelContainer = c as PanelContainer
		if chip == null:
			continue
		var sb: StyleBoxFlat = CareerTheme.chip()
		sb.content_margin_left = HECHOS_PAD_APRE
		sb.content_margin_right = HECHOS_PAD_APRE
		chip.add_theme_stylebox_override("panel", sb)
		var fila: HBoxContainer = chip.get_child(0) as HBoxContainer
		if fila == null:
			continue
		fila.add_theme_constant_override("separation", 6)
		var ico: Control = fila.get_child(0) as Control
		if ico != null:
			ico.custom_minimum_size = Vector2(HECHOS_ICO_APRE, HECHOS_ICO_APRE)
		var val: Label = fila.get_child(1) as Label
		if val != null:
			val.add_theme_font_size_override("font_size", HECHOS_FS_APRE)













func _stat_chip(parent: Container, icon_name: String, value: String,
		col_accent: Color, expande: bool = true) -> void:
	var chip: PanelContainer = CareerUi.chip()
	chip.size_flags_horizontal = Control.SIZE_EXPAND_FILL if expande else Control.SIZE_SHRINK_BEGIN
	parent.add_child(chip)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	chip.add_child(row)
	var icon: Control
	if icon_name.begins_with("trofeo:"):
		var t: TrophyIcon = TrophyIcon.new()
		t.set_type(icon_name.substr(7))
		icon = t
	else:
		var m: MenuIcon = MenuIcon.new()
		m.setup(icon_name, col_accent)
		icon = m
	icon.custom_minimum_size = Vector2(HECHOS_ICO, HECHOS_ICO)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(icon)
	var v: Label = CareerUi.plain(HECHOS_FS, CareerTheme.TEXT)
	v.text = value
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(v)



func _fill_empty_card(col: VBoxContainer, slot: int) -> void:
	var hint: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	hint.text = I18n.t("Ranura libre.")
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(hint)
	var go: Button = Button.new()
	go.text = I18n.t("+ NUEVA CARRERA")


	if slot == SaveSlots.active:
		go.set_meta(Entrada.PRIMERO_META, true)
	go.custom_minimum_size = Vector2(0, 60)
	go.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(go, CareerTheme.Kind.NEUTRAL, 30)



	CareerTheme.apply_button_peldano(go, CareerTheme.NAV_YO, false, 30)







	if UiKit.es_horizontal():
		go.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	go.pressed.connect(func() -> void: _start_new(slot))
	col.add_child(go)





	if not Respaldo.restaurables().is_empty():
		var rest: Button = CareerUi.accion("girar", I18n.t("RESTAURAR"), UiKit.BTN_BLUE["bg"])
		rest.pressed.connect(_abre_restaurar.bind(slot))
		col.add_child(rest)






func _abre_restaurar(slot: int) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("RESTAURAR CARRERA")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	titulo.clip_text = true
	box.add_child(titulo)
	var nota: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	nota.text = I18n.t("Copias guardadas en iCloud.")
	nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(nota)


	for c in Respaldo.restaurables().slice(0, 5):
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(64, 64)
		crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
		crest.set_team(Teams.by_id(String(c["club"])))
		var nombre: String = String(c["nombre"])
		var fila: Button = CareerUi.menu_row(nombre if not nombre.is_empty() else "—",
			I18n.tf("T{0}", [int(c["temporada"])]), CareerTheme.TEXT_DIM, "", crest)
		fila.pressed.connect(_restaura.bind(String(c["id"]), slot, box))
		box.add_child(fila)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cerrar.pressed.connect(CareerUi.close_modal.bind(box))
	box.add_child(cerrar)






func _abre_remota(slot: int, retired: bool, r: Dictionary) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("VERSION MAS NUEVA")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	titulo.clip_text = true
	box.add_child(titulo)
	var nota: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	var aparato: String = String(r.get("aparato", ""))
	nota.text = I18n.tf("Se jugó después en {0}.", [aparato]) if not aparato.is_empty() \
			else I18n.t("Se jugó después en otro aparato.")
	nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(nota)
	var nube: Button = CareerUi.menu_row(I18n.t("iCLOUD"),
		I18n.tf("T{0}", [int(r["temporada"])]), CareerTheme.TEXT, "girar")
	nube.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		if not Respaldo.usa_remota(slot).is_empty():
			_toast(I18n.t("No se pudo restaurar la carrera."))
			return
		_open_slot(slot, bool(SaveSlots.summary(slot).get("retired", retired))))
	box.add_child(nube)
	var aqui: Button = CareerUi.menu_row(I18n.t("ESTE APARATO"),
		I18n.tf("T{0}", [int(r["temporada_local"])]), CareerTheme.TEXT_DIM, "smartphone")
	aqui.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		Respaldo.quedate_local(slot)
		_open_slot(slot, retired))
	box.add_child(aqui)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cerrar.pressed.connect(CareerUi.close_modal.bind(box))
	box.add_child(cerrar)


func _restaura(id: String, slot: int, box: VBoxContainer) -> void:
	var motivo: String = Respaldo.restaurar(id, slot)
	CareerUi.close_modal(box)
	if not motivo.is_empty():
		_toast(I18n.t("No se pudo restaurar la carrera."))
		return
	_toast(I18n.t("Carrera restaurada."))


	if is_instance_valid(_ui_root):
		_ui_root.queue_free()
	_build_ui()



func _open_redes() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("REDES")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(titulo)
	for red in CareerUi.REDES:


		var tint: Color = red["tint"] as Color
		if String(red["name"]) == "TikTok":
			tint = CareerTheme.TEXT
		var url: String = String(red["url"])
		var fila_red: Button = CareerUi.menu_row(String(red["name"]).to_upper(), "",
			CareerTheme.TEXT_DIM, "", _contact_icon(String(red["logo"]), tint), "")
		fila_red.pressed.connect(func() -> void: OS.shell_open(url))
		box.add_child(fila_red)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cerrar.pressed.connect(CareerUi.close_modal.bind(box))
	box.add_child(cerrar)





func _hay_novedades() -> bool:
	return Novedades.BUILD > Settings.novedades_build_visto











func _open_novedades() -> void:
	if NovedadesModal.abrir(self):
		Settings.set_novedades_build_visto(Novedades.BUILD)














func _novedades_al_entrar() -> void:












	if not is_inside_tree() or is_queued_for_deletion() or SceneFade.en_fundido():
		return



	match NovedadesModal.decide(_aparato_con_carrera(), _logros_encima):
		"abrir": _open_novedades()
		"apuntar": Settings.set_novedades_build_visto(Novedades.BUILD)




func _aparato_con_carrera() -> bool:
	for i in SaveSlots.MAX:
		if bool(SaveSlots.summary(i).get("exists", false)):
			return true
	return false







func _open_contact() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("CONTACTO")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(titulo)
	var quien: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_DIM)
	quien.text = CONTACTO_NOMBRE
	quien.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(quien)
	var sub: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	sub.text = I18n.t("¿Una idea, un fallo o sólo quieres saludar? Escríbeme directo.")
	sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(sub)
	var wa: Button = CareerUi.menu_row("WHATSAPP", "", CareerTheme.TEXT_DIM, "",
		_contact_icon(WHATSAPP_ICON, CareerTheme.CONTACTO_WHATSAPP), CONTACTO_WA)
	CareerTheme.apply_button_tinted(wa, CareerTheme.CONTACTO_WHATSAPP, 26, MEZCLA_CONTACTO)
	wa.pressed.connect(_open_whatsapp)
	box.add_child(wa)
	var mail: Button = CareerUi.menu_row(I18n.t("CORREO"), "", CareerTheme.TEXT_DIM, "",
		_contact_icon(CONTACT_ICON, CareerTheme.CONTACTO_CORREO), CONTACTO_MAIL)
	CareerTheme.apply_button_tinted(mail, CareerTheme.CONTACTO_CORREO, 26, MEZCLA_CONTACTO)
	mail.pressed.connect(_open_mail)
	box.add_child(mail)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cerrar.pressed.connect(CareerUi.close_modal.bind(box))
	box.add_child(cerrar)


func _contact_icon(path: String, tinte: Color) -> Control:
	var ic: TextureRect = TextureRect.new()
	ic.texture = load(path) as Texture2D
	ic.custom_minimum_size = Vector2(44, 44)
	ic.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	ic.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	ic.modulate = tinte
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return ic


func _open_whatsapp() -> void:
	_open_or_copy(CONTACTO_WA_URL, CONTACTO_WA)


func _open_mail() -> void:
	_open_or_copy("mailto:" + CONTACTO_MAIL, CONTACTO_MAIL)





func _open_or_copy(url: String, dato: String) -> void:
	if OS.shell_open(url) != OK:
		DisplayServer.clipboard_set(dato)


		_toast(I18n.t("COPIADO · PÉGALO DONDE QUIERAS"))




func _open_share() -> void:
	DisplayServer.clipboard_set(SHARE_URL)
	_toast(I18n.t("ENLACE COPIADO · PÉGALO DONDE QUIERAS"))




func _toast(text: String) -> void:
	var panel: PanelContainer = PanelContainer.new()
	panel.add_theme_stylebox_override("panel", CareerTheme.plate())
	panel.anchor_left = 0.5
	panel.anchor_right = 0.5
	panel.anchor_top = 0.32
	panel.anchor_bottom = 0.32
	panel.offset_left = -430.0
	panel.offset_right = 430.0
	panel.grow_horizontal = Control.GROW_DIRECTION_BOTH
	panel.grow_vertical = Control.GROW_DIRECTION_BOTH
	panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(panel)
	var l: Label = CareerUi.plain(26, CareerTheme.MONEY)
	l.text = text
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(l)
	UiKit.pop_in(panel)
	SceneFade.timer(1.8, false).timeout.connect(panel.queue_free)





func _open_review() -> void:





	StoreReview.ya_valoro()
	if OS.get_name() == "Android":


		if OS.shell_open(REVIEW_URL_ANDROID) != OK:
			_open_or_copy(REVIEW_URL_ANDROID_WEB, REVIEW_URL_ANDROID_WEB)
	else:
		OS.shell_open(REVIEW_URL)












const MAS_FILA_W: float = 600.0

func _open_mas() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("MÁS")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(titulo)




	var filas: Container = box
	if UiKit.es_horizontal():
		var rejilla: GridContainer = GridContainer.new()
		rejilla.columns = 2
		rejilla.add_theme_constant_override("h_separation", 24)
		rejilla.add_theme_constant_override("v_separation", box.get_theme_constant("separation"))
		rejilla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		box.add_child(rejilla)
		filas = rejilla






	var revista: MenuIcon = MenuIcon.new()
	revista.custom_minimum_size = Vector2(44, 44)
	revista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	revista.setup("magazine", CareerTheme.NAV_MUNDO)
	var nov: Button = CareerUi.menu_row(I18n.t("NOVEDADES"), "", CareerTheme.TEXT_DIM,
		"", revista)
	if _hay_novedades():
		CareerUi.dot_badge(nov, CareerTheme.NAV_MUNDO)
	nov.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_open_novedades())
	filas.add_child(nov)



	var grada: MenuIcon = MenuIcon.new()
	grada.custom_minimum_size = Vector2(44, 44)
	grada.mouse_filter = Control.MOUSE_FILTER_IGNORE
	grada.setup("aficion", CareerTheme.NAV_MUNDO)
	var redes: Button = CareerUi.menu_row(I18n.t("REDES"), "", CareerTheme.TEXT_DIM,
		"", grada)
	redes.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_open_redes())
	filas.add_child(redes)

	var comp: Button = CareerUi.menu_row(I18n.t("COMPARTIR EL JUEGO"), "",
		CareerTheme.TEXT_DIM, "", _contact_icon(SHARE_ICON, CareerTheme.TEXT))
	comp.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_open_share())
	filas.add_child(comp)

	var val: Button = CareerUi.menu_row(I18n.t("VALORAR EL JUEGO"), "",
		CareerTheme.TEXT_DIM, "", _contact_icon(
			STORE_LOGO_ANDROID if OS.get_name() == "Android" else STORE_LOGO,
			CareerTheme.TEXT))
	val.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_open_review())
	filas.add_child(val)

	var cont: Button = CareerUi.menu_row(I18n.t("CONTACTO"), "", CareerTheme.TEXT_DIM,
		"", _contact_icon(CONTACT_ICON, CareerTheme.TEXT))
	cont.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_open_contact())
	filas.add_child(cont)

	var claro: bool = CareerTheme.light_theme
	var tema: Button = CareerUi.menu_row(
		I18n.t("TEMA CLARO") if not claro else I18n.t("TEMA OSCURO"), "",
		CareerTheme.TEXT_DIM, "",
		_contact_icon(SUN_ICON if not claro else MOON_ICON, CareerTheme.NAV_PAPEL))
	tema.pressed.connect(func() -> void:
		Settings.set_theme_light(not CareerTheme.light_theme)
		SceneFade.reload())
	filas.add_child(tema)
	if filas != box:
		for f in filas.get_children():
			(f as Control).custom_minimum_size.x = MAS_FILA_W

	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	cerrar.pressed.connect(CareerUi.close_modal.bind(box))
	box.add_child(cerrar)














func _build_top_bar(root: VBoxContainer) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_END
	root.add_child(fila)


	if not UiKit.es_horizontal():
		fila.add_theme_constant_override("separation", 12)
		_build_iconos(fila)
		var muelle: Control = Control.new()
		muelle.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		muelle.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(muelle)





	var cell: PanelContainer = PanelContainer.new()
	cell.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	var placa: StyleBoxFlat = CareerTheme.plate()
	placa.content_margin_top = 14.0
	placa.content_margin_bottom = 14.0
	cell.add_theme_stylebox_override("panel", placa)
	fila.add_child(cell)

	var caja: HBoxContainer = HBoxContainer.new()
	caja.add_theme_constant_override("separation", 16)
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	cell.add_child(caja)





	var atlas: AtlasTexture = AtlasTexture.new()
	atlas.atlas = Flags.texture(String(I18n.LOCALE_FLAG[I18n.locale]))
	atlas.region = Rect2(1, 1, Flags.W - 2, Flags.H - 2)
	var bandera: TextureRect = TextureRect.new()
	bandera.texture = atlas
	bandera.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	bandera.custom_minimum_size = Vector2(60, 40)
	bandera.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bandera.stretch_mode = TextureRect.STRETCH_SCALE
	bandera.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	bandera.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(bandera)










	var word: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)


	word.text = CareerTheme.caps(String(I18n.LOCALE_WORD[I18n.locale]))
	word.clip_text = true
	word.custom_minimum_size = Vector2(240.0, 0.0)
	word.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	word.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	word.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	caja.add_child(word)

	cell.add_child(CareerUi.hit_overlay(float(CareerTheme.BTN_ROW_H),
		CareerUi.language_sheet.bind(self)))


















const CROMO: Dictionary = {
	"AJUSTES": ["ajustes", "res://ui/settings_menu.tscn"],
	"LOGROS": ["leyendas", "res://ui/logros.tscn"],
	"EDITOR": ["lapiz", "res://ui/squad_editor.tscn"],

	"MÁS": ["menu", ""],
}




const MEZCLA_JUEGO: float = 0.26
const MEZCLA_CROMO: float = 0.18





const LEGADO_EN_MENU: bool = true


var _legado_btn: Button = null









func _build_practice(root: Container) -> Container:


	var tumbado: bool = UiKit.es_horizontal()
	var row: Container = root
	if not tumbado:
		row = HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		root.add_child(row)
	var practice: Button = Button.new()
	practice.custom_minimum_size = Vector2(0, _alto_baldosa())
	practice.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button_tinted(practice, CareerTheme.NAV_YO, 28, MEZCLA_JUEGO)




	_dress_button(practice, I18n.t("PRÁCTICA"), "cono", CareerTheme.NAV_YO, 28, tumbado)
	practice.pressed.connect(func() -> void:
		SceneFade.to_scene("res://ui/practice_menu.tscn"))
	row.add_child(practice)



	var amigos: Button = Button.new()
	amigos.name = "BotonAmigos"
	amigos.custom_minimum_size = Vector2(0, _alto_baldosa())
	amigos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button_tinted(amigos, CareerTheme.NAV_GENTE, 28, MEZCLA_JUEGO)
	_dress_button(amigos, I18n.t("AMIGOS"), "relaciones", CareerTheme.NAV_GENTE, 28, tumbado)
	amigos.pressed.connect(func() -> void:
		SceneFade.to_scene("res://ui/amigos.tscn"))
	row.add_child(amigos)





	_insignia_amigos(amigos)
	var repinta: Callable = _insignia_amigos.bind(amigos)
	Nube.cambio.connect(repinta)
	amigos.tree_exiting.connect(func() -> void:
		if Nube.cambio.is_connected(repinta):
			Nube.cambio.disconnect(repinta))
	return row













func _build_tienda(fila: Container) -> void:


	if not LEGADO_EN_MENU:
		return
	var tienda: Button = Button.new()
	tienda.name = "BotonTienda"
	tienda.custom_minimum_size = Vector2(0, _alto_baldosa())
	tienda.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button_tinted(tienda, CareerTheme.NAV_DINERO, 28, MEZCLA_JUEGO)


	_dress_button(tienda, I18n.t("TIENDA"), "carrito", CareerTheme.NAV_DINERO, 28,
		UiKit.es_horizontal())
	tienda.pressed.connect(func() -> void:
		SceneFade.to_scene("res://ui/tienda_legado.tscn"))
	fila.add_child(tienda)
	_legado_btn = tienda
	_legado_visible()
	if not Store.caja_lista.is_connected(_legado_visible):
		Store.caja_lista.connect(_legado_visible)


	if Iap.LEGADO_VENDE_HERENCIA and Herencia.disponibles() > 0:
		CareerUi.count_badge(tienda, Herencia.disponibles(), CareerTheme.NAV_LEGADO,
			38.0, 8.0, 10.0)


func _legado_visible() -> void:
	if _legado_btn != null and is_instance_valid(_legado_btn):
		_legado_btn.visible = TIENDA_LEGADO.tiene_algo()



















const BANNER_ALTO_MAX: float = 150.0


const BANNER_ALTO_TUMBADO: float = 110.0








const ANUNCIO_ENLACE_CON_MANDO: bool = false


static var abre_enlace_test: Callable = Callable()


func _build_banner(root: Container, alto: float = BANNER_ALTO_MAX) -> void:

	if Anuncios.apagado():
		return
	var ad: Dictionary = Anuncios.banner()
	if ad.is_empty():
		return
	var tex: Texture2D = ad["textura"]
	var rect: TextureRect = TextureRect.new()
	rect.texture = tex
	rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	rect.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	rect.custom_minimum_size = Vector2(0.0, alto)
	rect.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	Telemetry.count("anuncio_banner")
	var enlace: String = String(ad.get("enlace", ""))
	if enlace.begins_with("https://"):
		rect.mouse_filter = Control.MOUSE_FILTER_STOP
		rect.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		rect.gui_input.connect(func(ev: InputEvent) -> void:


			var suelta: bool = ev is InputEventMouseButton and not ev.pressed \
					and ev.button_index == MOUSE_BUTTON_LEFT






			if suelta and (ANUNCIO_ENLACE_CON_MANDO or Entrada.modo != Entrada.Modo.MANDO):
				Telemetry.count("anuncio_banner_toque")
				if abre_enlace_test.is_valid():
					abre_enlace_test.call(enlace)
				else:
					OS.shell_open(enlace))
	else:
		rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(rect)





func _build_buttons(row: Container) -> void:
	var tumbado: bool = UiKit.es_horizontal()
	var clave: String = "LOGROS"
	var col: Color = _cromo_color(clave)
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, _alto_baldosa())
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button_tinted(b, col, 28, MEZCLA_CROMO)


	_dress_button(b, I18n.t("COLECCIÓN"), String((CROMO[clave] as Array)[0]), col, 28, tumbado)
	row.add_child(b)
	_conecta_cromo(b, clave)
	_build_tienda(row)





	if Achievements.unseen_count() > 0:
		CareerUi.count_badge(b, Achievements.unseen_count(),
			CareerTheme.NAV_LEGADO, 38.0, 8.0, 10.0)










const ICONO_CROMO_LADO: float = 112.0

func _build_iconos(fila: Container) -> void:
	for clave in ["AJUSTES", "MÁS", "EDITOR"]:
		var col: Color = _cromo_color(clave)
		var b: Button = Button.new()
		b.name = "Icono" + {"AJUSTES": "Ajustes", "MÁS": "Mas", "EDITOR": "Editor"}[clave]
		b.tooltip_text = I18n.t(clave)
		b.custom_minimum_size = Vector2(ICONO_CROMO_LADO, ICONO_CROMO_LADO)
		b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		CareerTheme.apply_button_tinted(b, col, 24, MEZCLA_CROMO)
		var centro: CenterContainer = CenterContainer.new()
		centro.set_anchors_preset(Control.PRESET_FULL_RECT)
		centro.offset_bottom = - float(CareerTheme.SINK)
		centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(centro)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(60, 60)
		ic.setup(String((CROMO[clave] as Array)[0]), col)
		ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
		centro.add_child(ic)
		fila.add_child(b)
		_conecta_cromo(b, clave)
		if clave == "MÁS" and _hay_novedades():
			CareerUi.dot_badge(b, CareerTheme.NAV_MUNDO)




func _alto_baldosa() -> float:
	return BOTONERA_ALTO if UiKit.es_horizontal() else 92.0



func _conecta_cromo(b: Button, clave: String) -> void:
	if clave == "MÁS":
		b.pressed.connect(_open_mas)
		return
	var dest: String = String((CROMO[clave] as Array)[1])




	var es_ajustes: bool = clave == "AJUSTES"
	b.pressed.connect(func() -> void:
		if es_ajustes:
			SceneFade.ajustes_desde_portada = true
		SceneFade.to_scene(dest))




func _insignia_amigos(btn: Button) -> void:
	if not is_instance_valid(btn):
		return
	var vieja: Node = btn.get_node_or_null("InsigniaRetos")
	if vieja != null:
		vieja.free()
	btn.remove_meta("badge")


	var n: int = 0 if Amigos.demo() else Amigos.te_tocan()
	if n <= 0:
		return
	CareerUi.count_badge(btn, n, CareerTheme.NAV_GENTE, 38.0, 8.0, 10.0)
	btn.get_child(btn.get_child_count() - 1).name = "InsigniaRetos"






func _cromo_color(clave: String) -> Color:
	match clave:
		"AJUSTES": return CareerTheme.NAV_PAPEL
		"LOGROS": return CareerTheme.NAV_LEGADO
		"MÁS": return CareerTheme.NAV_GENTE
		_: return CareerTheme.NAV_MUNDO












func _dress_button(b: Button, rotulo: String, icono: String, col: Color,
		tam: int, apilado: bool) -> void:
	b.text = ""
	var caja: BoxContainer = VBoxContainer.new() if apilado else HBoxContainer.new()
	caja.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.offset_bottom = - float(CareerTheme.SINK)
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_theme_constant_override("separation", 12 if apilado else 18)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(caja)

	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(40, 40)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup(icono, col)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(ic)

	var l: Label = CareerUi.plain(tam, CareerTheme.TEXT)
	l.text = rotulo
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if apilado:





		l.clip_text = true
		l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	caja.add_child(l)


	if apilado and UiKit.es_horizontal():
		CareerUi.autoshrink(l, 16)





















func _open_slot(slot: int, retired: bool) -> void:



	var remota: Dictionary = Respaldo.remota_de(slot)
	if not remota.is_empty():
		_abre_remota(slot, retired, remota)
		return









	var probable: String = HUB_SCENE
	if retired and ResourceLoader.exists(RETIRE_SCENE):
		probable = RETIRE_SCENE
	var cargar: Callable = func() -> String:
		SaveSlots.switch_to(slot)



		var final_pendiente: bool = Career.retired and (Career.farewell_pending
			or not Career.pending_ceremonies.is_empty()
			or not Career.last_report.is_empty())
		if retired and not final_pendiente and ResourceLoader.exists(RETIRE_SCENE):
			return RETIRE_SCENE
		return HUB_SCENE
	SceneFade.to_scene_tras_velo(cargar, probable)




func _start_new(slot: int) -> void:
	SaveSlots.switch_to(slot)
	if ResourceLoader.exists(NEW_CAREER_SCENE):
		SceneFade.to_scene(NEW_CAREER_SCENE)
	else:
		SceneFade.to_scene(HUB_SCENE)
