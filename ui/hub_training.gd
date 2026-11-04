extends Control






































































const CAM_BACK: float = 15.1
const CAM_H: float = 3.8
const CAM_AIM_Y: float = 2.35
const CAM_FOV: float = 40.0




















const COMP_DUELO: String = "duelo"
const COMP_BANQUILLO: String = "banquillo"
const COMP_ENTRENO: String = "entreno"
const COMP_FIN: String = "fin"
const COMP_CASA: String = "casa"

const REARMES_MAX: int = 2



































const BANCO_DIST: float = CAM_BACK
const BANCO_H: float = CAM_H
const BANCO_YAW: float = 150.0
const BANCO_AIM_Y: float = CAM_AIM_Y
const BANCO_FOV: float = CAM_FOV

















const ENTRENO_SPOT: Vector3 = Vector3(18.0, 0.0, 44.0)
const ENTRENO_DIST: float = CAM_BACK
const ENTRENO_H: float = CAM_H



const ENTRENO_YAW: float = 252.0
const ENTRENO_AIM_Y: float = CAM_AIM_Y
const ENTRENO_FOV: float = CAM_FOV














const CASA_SPOT: Vector3 = Vector3.ZERO
const CASA_YAW: float = 0.0
const HUB_SALON: GDScript = preload("res://ui/hub_salon.gd")






const RAIN_AHEAD: float = 14.0
const RAIN_Y: float = 8.0



const PLAYER_Z: float = Stadium.HALF_LINE









const SIDE_X: float = 1.06

const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS_X: float = 65.0
const PLAYER_SINK: float = 0.04








const TROPHY_H: float = 1.05
const TROPHY_AHEAD: float = 0.4





const PLINTH_H: float = 0.92
const PLINTH_R: float = 0.3



const TROPHY_SINK: float = 0.1




const BALL_D: float = 0.42
const BALL_AHEAD: float = 1.35
const BALL_SIDE: float = 0.0




















const FIN_TROPHY_X0: float = 1.15
const FIN_TROPHY_GAP: float = 1.2



const FIN_TROPHY_MAX: int = 6














const LINE_N: int = 10
const LINE_DZ: float = 1.55
const LINE_DX: float = 0.3
const LINE_Z0: float = 1.3
























const LINE_FALLBACK_SEED: String = "hub_line_%s_%d"














































const SIGN_W: float = 2.5








const SIGN_ASPECT: float = 1.1
















const SIGN_Y: float = 4.1
const SIGN_Z: float = 1.6
const SIGN_TILT: float = -12.0





const SIGN_SPREAD: float = 1.46



const SIGN_PX: int = 1080


const NAME_FONT_MAX: int = 92
const NAME_FONT_MIN: int = 44
const CREST_PX: int = 900
const SIGN_TEXT_PAD: int = 90



















const SIGN_GAP: int = 44








const MEDIA_FONT: int = 96




const MEDIA_OUT: float = 12.0



const REVEAL_T: float = 0.45







const TELON_LAYER: int = 128


const TELON_RESCATE_S: float = 25.0



const TELON_ANTES: float = 0.32




const TELON_RECINTO_0: float = 0.55



const TELON_CIERRE: float = 0.5









const TELON_SOBRE_US: int = 50000




const ESPERA_PRECALIENTA: float = 0.6








static func _lienzo(host: Node) -> Vector2i:
	if host == null or not host.is_inside_tree():
		return Vector2i(UiKit.lienzo())
	var vp: Viewport = host.get_viewport()
	if vp == null:
		return Vector2i(UiKit.lienzo())
	var s: Vector2 = vp.get_visible_rect().size
	if not (s.x > 0.0 and s.y > 0.0):
		return Vector2i(UiKit.lienzo())


	var m: Vector2 = margenes_apaisados(vp)
	return Vector2i(s - Vector2(m.x + m.y, 0.0))
















const COL_APAISADA: float = 696.0


static func margenes_apaisados(_vp: Viewport) -> Vector2:
	return Vector2.ZERO





static func hueco_apaisado(vp: Viewport) -> Rect2:
	var s: Vector2 = vp.get_visible_rect().size if vp != null else UiKit.lienzo()
	if vp == null or not UiKit.es_horizontal():
		return Rect2(Vector2.ZERO, s)
	var lados: Vector2 = UiKit.side_safe_insets(vp, UiKit.CORTESIA_LATERAL)
	return Rect2(lados.x, 0.0, maxf(1.0, s.x - lados.x - lados.y - COL_APAISADA), s.y)


static func aspecto_hueco(vp: Viewport) -> float:
	var h: Rect2 = hueco_apaisado(vp)
	return h.size.x / h.size.y if h.size.x > 0.0 and h.size.y > 0.0 else 0.0













static func aspecto_tumbado_diseno() -> float:
	return (1920.0 - COL_APAISADA) / 1080.0

var _vp: SubViewport
var _stadium: Stadium
var _cam: Camera3D



var _people: Dictionary = {}
var _kit_btn: Dictionary = {}






























static var _aparcado: Dictionary = {}
static var _gancho_puesto: bool = false


static var _fotos: Dictionary = {}
const FOTOS_MEM: int = 2


const FOTO_DIR: String = "user://hub_fondo"


static var foto_dir: String = FOTO_DIR









static var _tarea_foto: int = -1

static var _viva: Object = null

var _sig: String = ""



var _comp_armada: String = ""


var _rearmes: int = 0

var _completo: bool = false
var _box: SubViewportContainer



var _plate: TextureRect

var _foto: TextureRect




var _armando: bool = false




var _pies: Dictionary = {}



var _precalentando: bool = false

signal precalentado





signal estampa_cubre(cubre: bool)



var _telon: MenuLoading


var _telon_base: float = 0.0

var _obra_desde: int = 0



static var forzar_telon: bool = false








static func _vigila_cierre(guardia: Node) -> void:
	if not guardia.tree_exiting.is_connected(_cierra_cache):
		guardia.tree_exiting.connect(_cierra_cache)






static func _cierra_cache() -> void:
	_recoge_foto(true)
	_sondea_foto()
	olvida_fotos()
	_viva = null




static func olvida_fotos() -> void:
	_fotos = {}
	tirar_aparcado()



static func rescatar(destino: String) -> void:


	var caro: bool = destino.begins_with("res://features/") \
			or destino.begins_with("res://ui/ceremonies/")
	if caro:
		tirar_aparcado()
	if _viva == null or not is_instance_valid(_viva):
		return
	var yo = _viva
	_viva = null
	if caro or not yo._completo or yo._vp == null or not is_instance_valid(yo._vp):
		return
	if yo._box == null or not is_instance_valid(yo._box):
		return
	yo._box.remove_child(yo._vp)
	_guardar(yo._vp, yo._stadium, yo._cam, yo._people, yo._pies, yo._sig)
	yo._vp = null



static func _guardar(vp: SubViewport, st: Node, cam: Camera3D, gente: Dictionary,
		pies: Dictionary, sig: String) -> void:
	tirar_aparcado()
	_aparcado = {"vp": vp, "stadium": st, "cam": cam, "people": gente,
		"pies": pies, "sig": sig}


static func tirar_aparcado() -> void:
	var vp = _aparcado.get("vp")
	if vp != null and is_instance_valid(vp):
		(vp as Node).free()
	_aparcado = {}





static func _foto_de(sig: String, size_now: Vector2i) -> Dictionary:
	if _fotos.has(sig):



		if Vector2i(_fotos[sig].get("size", Vector2i.ZERO)) != size_now:
			_fotos.erase(sig)
			return {}
		return _fotos[sig]
	if GameState.readonly_save:
		return {}
	var png: String = "%s/%s.png" % [foto_dir, sig]
	var meta_p: String = "%s/%s.json" % [foto_dir, sig]
	if not FileAccess.file_exists(png) or not FileAccess.file_exists(meta_p):
		return {}
	var meta = JSON.parse_string(FileAccess.get_file_as_string(meta_p))
	if not (meta is Dictionary):
		return {}
	var sz: Array = meta.get("size", [])
	if sz.size() != 2 or Vector2i(int(sz[0]), int(sz[1])) != size_now:
		return {}
	var img: Image = Image.load_from_file(png)
	if img == null or img.is_empty():
		return {}
	var pies: Dictionary = {}
	for k in (meta.get("btn", {}) as Dictionary):
		var v: Array = meta["btn"][k]
		pies[float(k)] = Vector2(float(v[0]), float(v[1]))
	var f: Dictionary = {"tex": ImageTexture.create_from_image(img),
		"btn": pies, "size": size_now}
	_guarda_en_memoria(sig, f)
	return f


static func _guarda_en_memoria(sig: String, f: Dictionary) -> void:
	_fotos[sig] = f
	while _fotos.size() > FOTOS_MEM:
		var vieja = _fotos.keys()[0]
		if vieja == sig:
			break
		_fotos.erase(vieja)





static func _guarda_foto(sig: String, img: Image, pies: Dictionary,
		size_now: Vector2i) -> void:


	_guarda_en_memoria(sig, {"tex": ImageTexture.create_from_image(img),
		"btn": pies, "size": size_now, "fresca": true})
	if GameState.readonly_save:
		return
	var btn: Dictionary = {}
	for k in pies:
		btn[str(float(k))] = [pies[k].x, pies[k].y]
	var meta: String = JSON.stringify({"btn": btn, "size": [size_now.x, size_now.y]})



	_recoge_foto(true)
	_tarea_foto = WorkerThreadPool.add_task(
		_escribe_foto.bind(sig, img.duplicate(), meta))




	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	if arbol != null and not arbol.process_frame.is_connected(_sondea_foto):
		arbol.process_frame.connect(_sondea_foto)




static func _sondea_foto() -> void:
	_recoge_foto(false)
	if _tarea_foto < 0:
		var arbol: SceneTree = Engine.get_main_loop() as SceneTree
		if arbol != null and arbol.process_frame.is_connected(_sondea_foto):
			arbol.process_frame.disconnect(_sondea_foto)





static func _recoge_foto(esperar: bool) -> void:
	if _tarea_foto < 0:
		return
	if esperar or WorkerThreadPool.is_task_completed(_tarea_foto):
		WorkerThreadPool.wait_for_task_completion(_tarea_foto)
		_tarea_foto = -1



static func _escribe_foto(sig: String, img: Image, meta: String) -> void:
	DirAccess.make_dir_recursive_absolute(foto_dir)
	var d: DirAccess = DirAccess.open(foto_dir)
	if d != null:
		for f in d.get_files():
			if not f.begins_with(sig + "."):
				d.remove(f)
	img.save_png("%s/%s.png" % [foto_dir, sig])
	var fa: FileAccess = FileAccess.open("%s/%s.json" % [foto_dir, sig],
		FileAccess.WRITE)
	if fa != null:
		fa.store_string(meta)
		fa.close()

















static func armara_con_telon() -> bool:
	if GameState.readonly_save and not forzar_telon:
		return false
	if GameState.next_weather.is_empty():
		return true
	if _composicion() == COMP_CASA:
		return false
	var sig: String = _firma()
	if not _aparcado.is_empty() and is_instance_valid(_aparcado.get("vp")) \
			and String(_aparcado.get("sig", "")) == sig:
		return false
	if _fotos.has(sig):
		return false
	if not GameState.readonly_save and FileAccess.file_exists("%s/%s.png" % [foto_dir, sig]):
		return false
	return true


static func _firma() -> String:
	return str(hash(str([
		I18n.locale,
		GameState.current_fixture(),
		String(GameState.current_rival().get("id", "")),
		GameState.player_div(),
		GameState.player_kit_slot, GameState.rival_kit_slot,
		GameState.team_custom,
		GameState.next_weather,



		GameState.next_rain,
		GameState.retro_available(), GameState.rival_retro_available(),










		CrestLogos.count(), CrestLogos.version,
		SponsorLogos.count(), SponsorLogos.version,





		GameState.season_close_pending,
		Career.current_season_awards(),






		Squad.cache_version(),





		_composicion(), Career.is_captain_in_match(_es_nat()),




		Career.bajas_asientos(String(GameState.current_rival().get("id", ""))),
	])))





















static func precalienta(host: Node) -> void:
	if host == null or not host.is_inside_tree():
		return

	if _viva != null and is_instance_valid(_viva):
		return


	next_weather_id()
	_convoca_si_fifa()
	var sig: String = _firma()
	if not _aparcado.is_empty() and String(_aparcado.get("sig", "")) == sig:
		return
	var lienzo: Vector2i = _lienzo(host)
	if not _foto_de(sig, lienzo).is_empty():
		return
	await SceneFade.timer(
		ESPERA_PRECALIENTA, true, false, true).timeout
	if not is_instance_valid(host) or not host.is_inside_tree():
		return
	if _viva != null and is_instance_valid(_viva):
		return
	var vp: SubViewport = SubViewport.new()
	vp.size = lienzo



	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	host.add_child(vp)


	var panel: Control =(load("res://ui/hub_training.gd") as GDScript).new()
	panel.set("_precalentando", true)
	panel.set_anchors_preset(Control.PRESET_FULL_RECT)
	vp.add_child(panel)
	await panel.precalentado
	if is_instance_valid(vp):
		vp.queue_free()


func _ready() -> void:



	set_process(false)
	if not _gancho_puesto:
		_gancho_puesto = true
		SceneFade.salvage_add(Callable(get_script(), "rescatar"))
		_vigila_cierre(SceneFade)


	if not _precalentando:
		_viva = self
	_build_world()

	if UiKit.es_horizontal():
		resized.connect(_on_resized_caja)


func _exit_tree() -> void:
	if _viva == self:
		_viva = null


func _build_world() -> void:




	GameState.ensure_kit_choice()









	var sky: Color = CareerTheme.accent()
	var grad: Gradient = Gradient.new()
	grad.set_color(0, sky.lerp(CareerTheme.BG_DEEP, 0.72))
	grad.set_color(1, CareerTheme.BG_DEEP)
	var gtex: GradientTexture2D = GradientTexture2D.new()
	gtex.gradient = grad
	gtex.fill_from = Vector2(0.0, 0.0)
	gtex.fill_to = Vector2(0.0, 1.0)
	var plate: TextureRect = TextureRect.new()
	plate.texture = gtex
	plate.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	plate.stretch_mode = TextureRect.STRETCH_SCALE
	plate.set_anchors_preset(Control.PRESET_FULL_RECT)
	plate.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(plate)
	_plate = plate

	var box: SubViewportContainer = SubViewportContainer.new()
	box.stretch = true


	box.set_meta(UiKit.META_ENCOGE_3D, true)
	box.set_anchors_preset(Control.PRESET_FULL_RECT)

	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(box)
	_box = box








	next_weather_id()



	next_rain_level()

	_convoca_si_fifa()
	_sig = _firma()



	if not _aparcado.is_empty():
		var vp_a = _aparcado.get("vp")
		if is_instance_valid(vp_a) and String(_aparcado.get("sig", "")) == _sig:
			_vp = vp_a
			_stadium = _aparcado["stadium"]
			_cam = _aparcado["cam"]
			_people = _aparcado["people"]
			_pies =(_aparcado["pies"] as Dictionary).duplicate()

			_comp_armada = _composicion()
			_aparcado = {}
			_box.add_child(_vp)

			UiKit.aplica_escala_3d_sub(_vp, get_viewport())
			_completo = true
			_cubre_fondo(true)


			_fov_caja()
			_make_kit_buttons()



			_pecho_revisa()
			return
		tirar_aparcado()

	var f: Dictionary = _foto_de(_sig, Vector2i(_tam_viewport()))
	if not f.is_empty():
		_monta_foto(f)

	_arma_mundo(f.is_empty())




func _tam_viewport() -> Vector2:
	var vr: Vector2 = get_viewport_rect().size if is_inside_tree() else Vector2.ZERO
	if not (vr.x > 0.0 and vr.y > 0.0):
		return UiKit.lienzo()

	var m: Vector2 = margenes_apaisados(get_viewport())
	return vr - Vector2(m.x + m.y, 0.0)










func _monta_foto(f: Dictionary) -> void:
	_foto = TextureRect.new()
	_foto.texture = f["tex"]
	_foto.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_foto.stretch_mode = TextureRect.STRETCH_SCALE


	if (f["tex"] as Texture2D).get_width() < int(_tam_viewport().x):
		_foto.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
	_foto.set_anchors_preset(Control.PRESET_FULL_RECT)
	_foto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_foto)
	move_child(_foto, _box.get_index())
	_pies =(f["btn"] as Dictionary).duplicate()
	_make_kit_buttons()





func _arma_mundo(con_telon: bool) -> void:
	_armando = true
	_completo = false
	_comp_armada = _composicion()


	_box.modulate.a = 0.0
	_cubre_fondo(false)
	if con_telon:
		_monta_telon()
	_vp = SubViewport.new()
	_vp.transparent_bg = false
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_vp.msaa_3d = Viewport.MSAA_DISABLED



	_box.add_child(_vp)
	UiKit.aplica_escala_3d_sub(_vp, get_viewport())
	if _composicion() == COMP_CASA:
		_arma_casa()
		return









	_stadium = Stadium.new()



	_stadium.div = Stadium.struct_div_for(GameState.player_team_id,
		clampi(GameState.player_div(), 1, 3))
	_stadium.att_override = 0.82
	_stadium.home_only = true






	if String(GameState.current_fixture().get("comp", "")) == "nat":
		_stadium.div = 1
		_stadium.home_club = GameState.host_id()






	_stadium.comp_override = String(
		GameState.current_fixture().get("comp", "league"))








	_stadium.async_build = true









	_stadium.backdrop = _composicion() != COMP_BANQUILLO







	if _composicion() == COMP_ENTRENO:
		_stadium.train_override = 1



		_stadium.div = Stadium.struct_div_for(GameState.player_team_id,
			clampi(GameState.player_div(), 1, 3))
		_stadium.home_club = GameState.player_team_id





		_stadium.att_override = 0.0
		_stadium.venue_empty = true
		_stadium.kickoff_override = 0.0
	_vp.add_child(_stadium)

	_cam = Camera3D.new()
	_cam.fov = CAM_FOV
	_cam.current = true
	_vp.add_child(_cam)
	_encuadra()












	var mine_side: float = _my_side()














	if _fin_de_ano():
		_people[mine_side] = [_make_person(
			_mine_cfg(), 0.0, _team_of(mine_side))]
		_captain_badge(_people[mine_side][0])
	elif _composicion() == COMP_BANQUILLO:









		var spot: Vector3 = _banco_spot()
		_people[mine_side] = [_make_person(
			_mine_cfg(), spot.x, _team_of(mine_side), spot.z)]
		_captain_badge(_people[mine_side][0])
	elif _composicion() == COMP_ENTRENO:






		_people[mine_side] = [_make_person(
			_mine_cfg(), ENTRENO_SPOT.x, _team_of(mine_side), ENTRENO_SPOT.z)]
		_captain_badge(_people[mine_side][0])
	else:




		_people[mine_side] = [_make_person(
			_mine_cfg(), SIDE_X * mine_side, _team_of(mine_side))]
		_people[- mine_side] = [_make_person(
			_rival_cfg(), - SIDE_X * mine_side, _team_of(- mine_side))]
		_captain_badge(_people[mine_side][0])
	_make_kit_buttons()



	if _btn_root != null and _foto == null:
		_btn_root.modulate.a = 0.0
	_spread_world(mine_side)










func _arma_casa() -> void:
	var tuyo: Dictionary = _en_la_tele(_my_team())
	var rival: Dictionary = _en_la_tele(GameState.current_rival())



	var club: Dictionary = _en_la_tele(Teams.by_id(GameState.player_team_id))
	var salon = HUB_SALON.new()
	salon.arma(_vp, tuyo, rival, _my_side() > 0.0, HUB_SALON.nivel(), club)
	_cam = Camera3D.new()
	_cam.fov = CAM_FOV
	_cam.current = true
	_vp.add_child(_cam)
	_encuadra()
	var mine_side: float = _my_side()
	_people[mine_side] = [_make_sentado()]
	_spread_world(mine_side)




static func _en_la_tele(team: Dictionary) -> Dictionary:
	if team.is_empty():
		return {}
	var t: Dictionary = team.duplicate()
	t.merge(GameState.kit_variant(team, 0), true)
	return t











func _make_sentado() -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS_X
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.modulate = HUB_SALON.tinte(HUB_SALON.nivel())
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)

	frames.set_animation_speed("idle", 4.0)
	for i in range(1, 5):
		var path: String = "res://assets/sprites/anim/sentado_brazos_south_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("idle") == 0:

		frames = _frames_for(cfg)
		spr.sprite_frames = frames
		spr.position = CASA_SPOT + Vector3(0.0, _feet(spr.pixel_size), -0.6)
	else:
		spr.sprite_frames = frames
		spr.position = CASA_SPOT + Vector3(0.0, HUB_SALON.ASIENTO_TOP
			+ float(HUB_SALON.FILA_TRASERO - 46) * spr.pixel_size, 0.0)
	spr.play("idle")
	_vp.add_child(spr)
	return spr
















func _encuadra() -> void:
	_encuadra_plano()
	_fov_caja()




func _aspecto_caja() -> float:
	if UiKit.es_horizontal() and is_inside_tree():


		return aspecto_hueco(get_viewport())
	var s: Vector2 = get_viewport_rect().size if _precalentando and is_inside_tree() \
			else _tam_viewport()
	return s.x / s.y if s.x > 0.0 and s.y > 0.0 else 0.0





func _fov_caja() -> void:
	if _cam == null or not is_instance_valid(_cam):
		return
	if not UiKit.es_horizontal():
		_cam.h_offset = 0.0
		return
	var a: float = _aspecto_caja()
	if a <= 0.0:
		return
	UiKit.encuadre_caja(_cam, _fov_diseno(), aspecto_tumbado_diseno(), a)
	_cam.h_offset = _corrimiento_hueco()











func _corrimiento_hueco() -> float:
	if _cam == null or not is_instance_valid(_cam) or not is_inside_tree():
		return 0.0
	var s: Vector2 = get_viewport_rect().size
	if s.x <= 0.0 or s.y <= 0.0:
		return 0.0
	var h: Rect2 = hueco_apaisado(get_viewport())
	var dif_px: float = s.x * 0.5 -(h.position.x + h.size.x * 0.5)
	var metros_px: float = 2.0 * CAM_BACK * tan(deg_to_rad(_cam.fov) * 0.5) / s.y
	return dif_px * metros_px



func _fov_diseno() -> float:
	match _composicion():
		COMP_BANQUILLO:
			return BANCO_FOV
		COMP_ENTRENO:
			return ENTRENO_FOV
	return CAM_FOV




func _on_resized_caja() -> void:
	_fov_caja()
	if _completo and _btn_root != null:
		_make_kit_buttons()


func _encuadra_plano() -> void:
	if _cam == null or not is_instance_valid(_cam):
		return
	var comp: String = _composicion()
	if comp == COMP_BANQUILLO and is_instance_valid(_stadium):


		_polar(_banco_spot(), BANCO_DIST, BANCO_H, BANCO_YAW, BANCO_AIM_Y, BANCO_FOV)
		return
	if comp == COMP_ENTRENO:



		_polar(ENTRENO_SPOT, ENTRENO_DIST, ENTRENO_H, ENTRENO_YAW,
			ENTRENO_AIM_Y, ENTRENO_FOV)
		return
	if comp == COMP_CASA:
		_polar(CASA_SPOT, CAM_BACK, CAM_H, CASA_YAW, CAM_AIM_Y, CAM_FOV)
		return
	_cam.fov = CAM_FOV
	_cam.position = Vector3(0.0, CAM_H, PLAYER_Z - CAM_BACK)
	_cam.look_at(Vector3(0.0, CAM_AIM_Y, PLAYER_Z), Vector3.UP)







func _polar(foco: Vector3, dist: float, h: float, yaw_deg: float,
		aim_y: float, fov: float) -> void:
	var yaw: float = deg_to_rad(yaw_deg)
	_cam.fov = fov
	_cam.position = Vector3(foco.x + sin(yaw) * dist, h, foco.z - cos(yaw) * dist)
	_cam.look_at(Vector3(foco.x, aim_y, foco.z), Vector3.UP)







func _banco_spot() -> Vector3:
	return _stadium.dugout_wait_spot(true)









func _monta_telon() -> void:
	if _precalentando or (GameState.readonly_save and not forzar_telon):
		return
	var capa: CanvasLayer = CanvasLayer.new()
	capa.layer = TELON_LAYER
	add_child(capa)





	_telon = SceneFade.curtain_handoff()
	if _telon != null:
		_telon_base = _telon.rebase()
	else:
		_telon = MenuLoading.new()
		_telon_base = 0.0







		SceneFade.timer(TELON_RESCATE_S, true, false, true).timeout.connect(
			_mata_telon_propio.bind(_telon.get_instance_id()))
	capa.add_child(_telon)
	_telon.set_message(I18n.t("Cargando…"))


	_telon.tree_exited.connect(capa.queue_free)



func _telon_tapa() -> bool:
	return _telon != null and is_instance_valid(_telon)









func _respira_obra() -> void:
	var sobre: int = TELON_SOBRE_US if _telon_tapa() else Stadium.OBRA_SOBRE_US
	if Time.get_ticks_usec() - _obra_desde < sobre:
		return
	await get_tree().process_frame
	_obra_desde = Time.get_ticks_usec()



func _progreso(p: float) -> void:
	if _telon != null and is_instance_valid(_telon):
		_telon.set_progress(_telon_base +(1.0 - _telon_base) * p)





func _on_stadium_progress(done: float) -> void:
	var d: float = clampf(
		inverse_lerp(TELON_RECINTO_0, 1.0, done), 0.0, 1.0)
	_progreso(TELON_ANTES +(1.0 - TELON_ANTES) * d)













func _spread_world(mine_side: float) -> void:
	await get_tree().process_frame
	if not is_inside_tree():
		return
	_obra_desde = Time.get_ticks_usec()
	_progreso(0.04)
	if _composicion() == COMP_BANQUILLO or _composicion() == COMP_ENTRENO \
			or _composicion() == COMP_CASA:






		_progreso(TELON_ANTES)
	elif _fin_de_ano():




		_progreso(0.25)
		_make_sign(_my_team(), mine_side, true)
		await get_tree().process_frame
		if not is_inside_tree():
			return
		_fin_trofeos()
		_make_ball()
		_progreso(TELON_ANTES)
	else:
		await _make_line(_my_kit(), mine_side, "you", 0.04, 0.15)
		if not is_inside_tree():
			return
		await _make_line(_rival_kit(), - mine_side, "riv", 0.15, 0.25)
		if not is_inside_tree():
			return
		_progreso(0.25)
		await _respira_obra()
		if not is_inside_tree():
			return
		_make_sign(_my_team(), mine_side)


		await get_tree().process_frame
		if not is_inside_tree():
			return
		var rival: Dictionary = GameState.current_rival()
		if not rival.is_empty():
			_make_sign(rival, - mine_side)
		_make_plinth()
		_make_trophy()
		_make_ball()
		_progreso(TELON_ANTES)

	if is_instance_valid(_stadium):
		_stadium.build_progress.connect(_on_stadium_progress)
		var sobre: int = _stadium.sobre_us
		if _telon_tapa():
			_stadium.sobre_us = TELON_SOBRE_US
		await _stadium.build_async()
		if is_instance_valid(_stadium):
			_stadium.sobre_us = sobre
	if is_instance_valid(_stadium):




		_stadium.apply_weather("day" if _composicion() == COMP_ENTRENO
			else next_weather_id())
		_weather_box()




		if _composicion() == COMP_BANQUILLO:
			_encuadra()
			var spot: Vector3 = _banco_spot()
			for a in (_people.get(_my_side(), []) as Array):
				if is_instance_valid(a):
					var spr: AnimatedSprite3D = a
					spr.position = Vector3(spot.x, spr.position.y, spot.z)


			_make_kit_buttons()





		_stadium.serpentinas_throw(true)








	if _composicion() != _comp_armada and _rearma():
		return

	_completo = true
	_armando = false
	_rearmes = 0



	if _sig != _firma():
		for side in [1.0, -1.0]:
			if _people.has(side):
				_redress(side)
		_sig = _firma()
	if _precalentando:

		_box.modulate.a = 1.0
		await _fotografia()
		if is_instance_valid(_vp) and is_inside_tree():
			_box.remove_child(_vp)
			_guardar(_vp, _stadium, _cam, _people, _pies, _sig)
			_vp = null
		precalentado.emit()
		queue_free()
		return










	var hace_falta: bool = not _foto_fresca()
	var tapado: bool =(_telon != null and is_instance_valid(_telon)) \
			or (_foto != null and is_instance_valid(_foto))
	if hace_falta and tapado:
		await _fotografia()
		if not is_inside_tree():
			return
	await _reveal()
	if hace_falta and not tapado:
		await _fotografia()





func _foto_fresca() -> bool:
	if _vp == null or not is_instance_valid(_vp) or not _fotos.has(_sig):
		return false
	var f: Dictionary = _fotos[_sig]
	return bool(f.get("fresca", false)) \
			and Vector2i(f.get("size", Vector2i.ZERO)) == Vector2i(_tam_viewport())















func _rearma(con_telon: bool = false) -> bool:
	if _rearmes >= REARMES_MAX:
		return false
	_rearmes += 1
	for side in _kit_btn:
		for b in (_kit_btn[side] as Array):
			if is_instance_valid(b):
				(b as Node).queue_free()
	_kit_btn = {}
	_people = {}
	_pies = {}
	if is_instance_valid(_vp):
		_vp.queue_free()
	_vp = null
	_stadium = null
	_cam = null
	_sig = _firma()
	_arma_mundo(con_telon)
	return true











func _reveal() -> void:


	if _box == null or not is_instance_valid(_box) or not is_inside_tree():
		return
	var btns: Control = _btn_root if is_instance_valid(_btn_root) else null



	if _foto != null and is_instance_valid(_foto):
		var vieja: TextureRect = _foto
		_foto = null
		if GameState.readonly_save:
			_box.modulate.a = 1.0
		else:
			var tf: Tween = create_tween()
			tf.tween_property(_box, "modulate:a", 1.0, REVEAL_T) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			await tf.finished
		if is_instance_valid(vieja):
			vieja.queue_free()
		_cubre_fondo(true)
		return



	if _telon != null and is_instance_valid(_telon):
		_progreso(1.0)
		_box.modulate.a = 1.0
		if btns != null:
			btns.modulate.a = 1.0




		var t0: int = Time.get_ticks_msec()
		while not _telon.bar_settled() \
				and Time.get_ticks_msec() - t0 < int(TELON_CIERRE * 1000.0):
			await get_tree().process_frame
			if not is_inside_tree() or not is_instance_valid(_telon):
				return
		_telon.dismiss()
		_telon = null
		_cubre_fondo(true)
		return
	if GameState.readonly_save:
		_box.modulate.a = 1.0
		if btns != null:
			btns.modulate.a = 1.0
		_cubre_fondo(true)
		return
	var tw: Tween = create_tween().set_parallel(true)
	tw.tween_property(_box, "modulate:a", 1.0, REVEAL_T) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	if btns != null:
		tw.tween_property(btns, "modulate:a", 1.0, REVEAL_T) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

	await tw.finished
	if is_inside_tree() and is_instance_valid(_box):
		_cubre_fondo(true)









func duerme_plato(duerme: bool) -> void:
	if _vp == null or not is_instance_valid(_vp):
		return
	_vp.render_target_update_mode = SubViewport.UPDATE_DISABLED if duerme \
			else SubViewport.UPDATE_ALWAYS




func _cubre_fondo(cubre: bool) -> void:
	if _plate != null and is_instance_valid(_plate):
		_plate.visible = not cubre
	estampa_cubre.emit(cubre)





func _fotografia() -> void:
	if _vp == null or not is_instance_valid(_vp) or not is_inside_tree():
		return
	var img: Image
	if StadiumStage.headless():



		img = Image.create_empty(1, 1, false, Image.FORMAT_RGBA8)
	else:
		await RenderingServer.frame_post_draw
		if _vp == null or not is_instance_valid(_vp) or not is_inside_tree():
			return
		img = _vp.get_texture().get_image()
	if img == null or img.is_empty():
		return


	for side in [1.0, -1.0]:
		_pies_de(side)


	_guarda_foto(_sig, img, _pies.duplicate(), Vector2i(_tam_viewport()))




func _refoto() -> void:
	await get_tree().process_frame
	if not is_inside_tree():
		return
	await _fotografia()





func _my_side() -> float:
	return 1.0 if bool(GameState.current_fixture().get("home", true)) else -1.0






func _is_mine(side: float) -> bool:
	return is_equal_approx(side, _my_side())






func _my_team() -> Dictionary:
	return GameState.you_of(GameState.current_fixture())




func _my_kit() -> Dictionary:
	return GameState.kit_variant(_my_team(), GameState.player_kit_slot)





func _make_person(cfg: Dictionary, x: float, team: Dictionary = {},
		z: float = PLAYER_Z) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS_X
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = _frames_for(cfg)
	spr.position = Vector3(x, _feet(spr.pixel_size), z)
	spr.play("idle")
	_vp.add_child(spr)
	_pecho_vestir(spr, cfg, team)



	if not team.is_empty():
		var mio: bool = String(team.get("id", "")) == String(_my_team().get("id", ""))
		var rng := RandomNumberGenerator.new()
		rng.randomize()
		_cara_de_racha(spr, animo_de_racha(_team_form(team, mio)), rng)
	return spr










func _captain_badge(who: AnimatedSprite3D) -> void:
	if who == null or not is_instance_valid(who):
		return
	if not Career.is_captain_in_match(_es_nat()):
		return
	who.add_child(ArmbandArt.make_sprite(_my_kit(), who.position.y))











func _make_line(kit: Dictionary, side: float, seed_key: String,
		p0: float = -1.0, p1: float = -1.0) -> void:
	var team: Dictionary = _team_of(side)


	var cfg_kit: Dictionary = _con_escudo(KitRecolor.team_only(kit), team)
	var fichas: Array = _fila_fichas(side)
	var looks: Array[Dictionary] = []
	var hojas: Array[SpriteFrames] = []
	for i in fichas.size():
		var ficha: Dictionary = fichas[i]
		var cfg: Dictionary = _look_ficha(ficha, cfg_kit, team, seed_key, i)
		looks.append(cfg)
		hojas.append(_frames_portero(cfg) if _es_portero(ficha) else _frames_for(cfg))




		if p0 >= 0.0:
			_progreso(lerpf(p0, p1, float(i + 1) / float(maxi(fichas.size(), 1))))

		if _telon_tapa() and Time.get_ticks_usec() - _obra_desde < TELON_SOBRE_US:
			continue
		await get_tree().process_frame
		_obra_desde = Time.get_ticks_usec()

		if not is_inside_tree() or not is_instance_valid(_vp):
			return
	var animo: String = animo_de_racha(_team_form(team, _is_mine(side)))
	var rng_cara := RandomNumberGenerator.new()
	rng_cara.randomize()
	for i in fichas.size():
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS_X
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.sprite_frames = hojas[i]
		spr.position = Vector3(
			side *(SIDE_X + float(i + 1) * LINE_DX),
			_feet(spr.pixel_size),
			PLAYER_Z + LINE_Z0 + float(i) * LINE_DZ)


		spr.play("idle")
		spr.frame = i % 4
		_vp.add_child(spr)






		_pecho_vestir(spr, looks[i], team)
		_cara_de_racha(spr, animo, rng_cara)
		(_people[side] as Array).append(spr)
		await _respira_obra()
		if not is_inside_tree():
			return




func _es_portero(ficha: Dictionary) -> bool:
	return bool(ficha.get("por", false))





























func _fila_fichas(side: float) -> Array:
	var out: Array = []
	var largo: int = LINE_N
	var tid: String = String(_team_of(side).get("id", ""))
	if not tid.is_empty():
		var mine: bool = _is_mine(side)
		var fuera: String = ""
		if mine:
			fuera = String(Squad.user_slot(tid).get("name", ""))
		else:
			fuera = String(_mejor_ficha(tid).get("name", ""))
		for row in _once_de(tid, mine):
			if out.size() >= largo:
				break
			var r: Dictionary = row
			var nm: String = String(r.get("name", ""))
			if nm.is_empty() or nm == fuera:
				continue
			out.append({"name": nm, "number": int(r.get("number", 0)),
				"por": String(r.get("pos", "")) == "POR"})
	while out.size() < largo:
		out.append({})
	return out








func _once_de(team_id: String, mine: bool) -> Array:
	if mine and team_id == GameState.player_team_id:
		var nominal: Array = Squad.of_nominal(team_id)
		var once: Array = Career.club_lineup()
		if not once.is_empty() and not nominal.is_empty():
			var filas: Array = []
			for i in once:
				var k: int = int(i)
				if k >= 0 and k < nominal.size():
					filas.append(nominal[k])
			if not filas.is_empty():
				return filas



	var sin_bajas: Array = once_con_bajas(team_id)
	if not sin_bajas.is_empty():
		return sin_bajas
	return Squad.of(team_id)





static func _bajas_cuentan(team_id: String) -> bool:
	if team_id.is_empty() or team_id == GameState.player_team_id or _es_nat():
		return false
	var f: Dictionary = GameState.current_fixture()
	return String(f.get("comp", "")) == "league" and String(f.get("opp", "")) == team_id





static func once_con_bajas(team_id: String) -> Array:
	if not _bajas_cuentan(team_id):
		return []
	var orden: Array = Career.orden_con_bajas(team_id)
	if orden.is_empty():
		return []
	var por_asiento: Dictionary = {}
	var plantel: Array = Squad.plantel_sin_once(team_id)
	for i in plantel.size():
		por_asiento[Squad.home_seat(plantel, i)] = plantel[i]
	var out: Array = []
	for a in orden:
		if por_asiento.has(int(a)):
			out.append(por_asiento[int(a)])
	return out






static func baja_rival_hoy() -> Dictionary:
	var opp: String = String(GameState.current_fixture().get("opp", ""))
	if not _bajas_cuentan(opp):
		return {}
	var mejor: Dictionary = {}
	for b_v in Career.bajas_de(opp):
		var b: Dictionary = b_v
		if not bool(b.get("titular", false)):
			continue
		if mejor.is_empty() or int(b.get("media", 0)) > int(mejor.get("media", 0)):
			mejor = b
	return mejor











static func _composicion() -> String:
	if GameState.season_close_pending:
		return COMP_FIN
	if GameState.current_fixture().is_empty():
		return COMP_DUELO
	var st: Dictionary = _nat_hoy() if _es_nat() else Career.standing()




	var status: String = String(st.get("status", ""))



	if status == Standing.STATUS_FUERA:
		return COMP_CASA if _es_nat() else COMP_ENTRENO
	if status == Standing.STATUS_BANCA:
		return COMP_BANQUILLO
	if status.is_empty() and int(st.get("minutes", 0)) <= 0:
		return COMP_BANQUILLO
	return COMP_DUELO




static func _de_inicio() -> bool:
	var c: String = _composicion()
	return c == COMP_DUELO or c == COMP_FIN






















static func _convoca_si_fifa() -> void:
	if not _es_nat():
		return
	Career.nat_match_team_id()
	Career.nat_rival_prepare()


static func _es_nat() -> bool:
	return String(GameState.you_of(GameState.current_fixture()).get("id", "")) \
			!= GameState.player_team_id




static func _nat_hoy() -> Dictionary:
	if Career.has_method("nat_standing"):
		return Career.nat_standing()
	return {"starter": true}


















func _look_ficha(ficha: Dictionary, cfg_kit: Dictionary, team: Dictionary,
		seed_key: String, idx: int) -> Dictionary:
	var nm: String = String(ficha.get("name", ""))
	var base: Dictionary = cfg_kit
	if _es_portero(ficha):
		base = KitRecolor.keeper_cfg(String(team.get("id", "")), -1,
			String(cfg_kit.get("pattern", "solid")))
	var cfg: Dictionary = _con_escudo(KitRecolor.appearance_for(
		nm if not nm.is_empty() else LINE_FALLBACK_SEED % [seed_key, idx], base),
		team)
	cfg["number"] = int(ficha.get("number", 0))
	return cfg






func _mejor_ficha(team_id: String) -> Dictionary:
	if team_id.is_empty():
		return {}
	var mejor: Dictionary = {}
	var top: float = -1.0


	var lista: Array = _once_de(team_id, false)
	for i in mini(Squad.STARTING_XI, lista.size()):
		var ficha: Dictionary = lista[i]
		if String(ficha.get("pos", "")) == "POR":
			continue
		var o: float = float(Squad.ovr(ficha))
		if o > top:
			top = o
			mejor = ficha
	return mejor














func _make_sign(team: Dictionary, side: float, centrado: bool = false) -> void:



	var mine_side_team: bool = _is_mine(side)
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(SIGN_PX, int(round(float(SIGN_PX) * SIGN_ASPECT)))
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	vp.disable_3d = true












	var pad: MarginContainer = MarginContainer.new()
	pad.set_anchors_preset(Control.PRESET_FULL_RECT)
	pad.add_theme_constant_override("margin_left", SIGN_TEXT_PAD)
	pad.add_theme_constant_override("margin_right", SIGN_TEXT_PAD)
	vp.add_child(pad)
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 4)
	pad.add_child(col)
	var crest: CrestView = CrestView.new()




	crest.custom_minimum_size = Vector2(CREST_PX, CREST_PX)


	crest.set_halo(true)
	crest.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	crest.set_team(team)
	col.add_child(crest)
























	var media: int = Career.side_media(String(team.get("id", "")), mine_side_team,
		String(GameState.current_fixture().get("comp", "")) == "nat")
	if media > 0:
		var tier: Color = OvrBadge.tier_color(media)
		var mchip: PanelContainer = PanelContainer.new()
		mchip.add_theme_stylebox_override("panel", _sign_chip(tier))



		mchip.anchor_left = 1.0
		mchip.anchor_top = 1.0
		mchip.anchor_right = 1.0
		mchip.anchor_bottom = 1.0
		mchip.offset_left = MEDIA_OUT
		mchip.offset_top = MEDIA_OUT
		mchip.offset_right = MEDIA_OUT
		mchip.offset_bottom = MEDIA_OUT
		mchip.grow_horizontal = Control.GROW_DIRECTION_BEGIN
		mchip.grow_vertical = Control.GROW_DIRECTION_BEGIN
		mchip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var ml: Label = CareerUi.plain(MEDIA_FONT, tier)
		ml.text = "%d" % media
		ml.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		mchip.add_child(ml)
		crest.add_child(mchip)





	var gap: Control = Control.new()
	gap.custom_minimum_size = Vector2(0, SIGN_GAP)
	gap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(gap)






	var name_l: Label = CareerUi.plain(NAME_FONT_MAX, CareerTheme.TEXT)
	_outline(name_l)


	name_l.text = CareerTheme.caps(Nations.team_label(team))
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	col.add_child(name_l)
	CareerUi.autoshrink(name_l, NAME_FONT_MIN)




	var mine: bool = mine_side_team
	var pos: int = _league_pos(team, mine)





	var baja: Dictionary = {} if mine else baja_rival_hoy()
	if String(team.get("id", "")) != String(GameState.current_fixture().get("opp", "")):
		baja = {}
	var fila_pos: Control = col
	if not baja.is_empty():
		var hb: HBoxContainer = HBoxContainer.new()
		hb.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		hb.add_theme_constant_override("separation", BAJA_SEP)
		hb.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(hb)
		fila_pos = hb
	if pos > 0:







		var pos_l: Label = CareerUi.plain(52, CareerTheme.MONEY)
		pos_l.text = I18n.ordinal(pos)
		pos_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		var chip: PanelContainer = PanelContainer.new()
		chip.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		chip.add_theme_stylebox_override("panel", _sign_chip(CareerTheme.MONEY))
		chip.add_child(pos_l)
		fila_pos.add_child(chip)
	if not baja.is_empty():
		fila_pos.add_child(baja_chip(baja))







	col.add_child(_form_row(_team_form(team, mine)))

	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(SIGN_W, SIGN_W * SIGN_ASPECT)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST



	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED







	mat.no_depth_test = true
	mat.render_priority = 4
	quad.material_override = mat



	var yaw: float = 0.0 if centrado else rad_to_deg(atan2(LINE_DX, LINE_DZ)) * side


	quad.position = Vector3(0.0 if centrado else side * SIGN_SPREAD,
		SIGN_Y, PLAYER_Z + SIGN_Z)
	quad.rotation_degrees = Vector3(SIGN_TILT, 180.0 + yaw, 0.0)
	_vp.add_child(quad)


	quad.add_child(vp)

	_fit_sign(vp, quad, qm, pad)













const LABEL_OUTLINE: int = 12
const LABEL_SHADOW: int = 6


















func _fit_sign(vp: SubViewport, quad: MeshInstance3D, qm: QuadMesh,
		content: Control) -> void:







	await get_tree().process_frame
	if not is_inside_tree():
		return
	await get_tree().process_frame
	if not is_inside_tree():
		return
	if not (is_instance_valid(vp) and is_instance_valid(quad) and is_instance_valid(content)):
		return
	var need: int = int(ceil(content.get_combined_minimum_size().y)) + SIGN_FIT_PAD
	if need > vp.size.y:
		var grow_px: int = need - vp.size.y
		vp.size = Vector2i(vp.size.x, need)


		var m_per_px: float = SIGN_W / float(vp.size.x)
		var grow_m: float = float(grow_px) * m_per_px
		qm.size = Vector2(SIGN_W, qm.size.y + grow_m)
		quad.position.y += grow_m * 0.5
	if is_instance_valid(vp):
		vp.render_target_update_mode = SubViewport.UPDATE_ONCE





const SIGN_FIT_PAD: int = 24

















func _mata_telon_propio(telon_id: int) -> void:
	var t: MenuLoading = instance_from_id(telon_id) as MenuLoading
	if t == null or not is_instance_valid(t) or not t.is_inside_tree():
		return
	push_warning("hub_training: telón propio colgado %.0f s, se retira a la fuerza" % TELON_RESCATE_S)
	if _telon == t:
		_telon = null
	t.queue_free()


func _freeze_vp(vp: SubViewport) -> void:

	await get_tree().process_frame
	if not is_inside_tree():
		return
	await get_tree().process_frame
	if not is_inside_tree() or not is_instance_valid(vp):
		return
	if is_instance_valid(vp):
		vp.render_target_update_mode = SubViewport.UPDATE_ONCE

func _outline(l: Label) -> void:
	l.add_theme_constant_override("outline_size", LABEL_OUTLINE)
	l.add_theme_color_override("font_outline_color", Color(0.04, 0.05, 0.07, 0.96))


	l.add_theme_constant_override("shadow_offset_x", LABEL_SHADOW)
	l.add_theme_constant_override("shadow_offset_y", LABEL_SHADOW)
	l.add_theme_constant_override("shadow_outline_size", 2)
	l.add_theme_color_override("font_shadow_color", Color(0.0, 0.0, 0.0, 0.75))







const FORM_COLORS: Dictionary = {
	"G": Color("6ede77"),
	"E": Color("e8c95a"),
	"P": Color("e2564a"),
}




const FORM_EMPTY_COLOR: Color = Color("9aa1b2")



const FORM_SLOTS: int = 5
const FORM_EMPTY: String = "-"
const FORM_FONT: int = 74
const FORM_SEP: int = 14



const FORM_BORDER: int = 4
const FORM_RADIUS: int = 10
const FORM_PAD: int = 12






























func _team_form(team: Dictionary, mine: bool) -> Array:
	var comp: String = String(GameState.current_fixture().get("comp", "league"))
	var id: String = GameState.player_team_id if mine else String(team.get("id", ""))
	return GameState.form_of_any(id, comp) if not id.is_empty() else []










func _sign_chip(border: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0.055, 0.055, 0.075, 0.92)
	sb.border_color = border
	sb.set_border_width_all(FORM_BORDER)
	sb.set_corner_radius_all(FORM_RADIUS)
	sb.content_margin_left = FORM_PAD + 8
	sb.content_margin_right = FORM_PAD + 8
	sb.content_margin_top = FORM_PAD - 4
	sb.content_margin_bottom = FORM_PAD - 4
	return sb













const BAJA_FONT: int = 52
const BAJA_ICON: int = 52
const BAJA_SEP: int = 12
const BAJA_TEXT_MAX: float = 520.0
func baja_chip(baja: Dictionary) -> PanelContainer:
	var chip: PanelContainer = PanelContainer.new()
	chip.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_theme_stylebox_override("panel", _sign_chip(CareerTheme.DANGER))
	var hb: HBoxContainer = HBoxContainer.new()
	hb.add_theme_constant_override("separation", BAJA_SEP)
	hb.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_child(hb)
	var ico: MenuIcon = MenuIcon.new()
	ico.custom_minimum_size = Vector2(BAJA_ICON, BAJA_ICON)
	ico.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ico.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ico.setup("tarjeta" if String(baja.get("motivo", "les")) == "roja" else "cruz_medica",
		CareerTheme.DANGER)
	hb.add_child(ico)
	var l: Label = CareerUi.plain(BAJA_FONT, CareerTheme.TEXT)
	l.text = CareerTheme.caps(CareerUi.display_name(CareerUi.surname(
		String(baja.get("nombre", "")))))
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	var fnt: Font = l.get_theme_font("font")
	var ancho: float = float(l.text.length() * BAJA_FONT)
	if fnt != null:
		ancho = fnt.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, BAJA_FONT).x
	l.custom_minimum_size = Vector2(minf(ceilf(ancho), BAJA_TEXT_MAX), 0)
	hb.add_child(l)
	return chip






func _form_row(form: Array) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", FORM_SEP)





	var cells: Array = []
	for i in FORM_SLOTS - mini(form.size(), FORM_SLOTS):
		cells.append(FORM_EMPTY)
	for r in form.slice(maxi(form.size() - FORM_SLOTS, 0)):
		cells.append(String(r))
	for r in cells:







		var col: Color = FORM_COLORS.get(String(r), FORM_EMPTY_COLOR)
		var box: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()



		sb.bg_color = Color(0.055, 0.055, 0.075, 0.92)
		sb.border_color = col
		sb.set_border_width_all(FORM_BORDER)
		sb.set_corner_radius_all(FORM_RADIUS)
		sb.set_content_margin_all(FORM_PAD)
		box.add_theme_stylebox_override("panel", sb)
		var lb: Label = CareerUi.plain(FORM_FONT, col)
		lb.text = String(r)
		lb.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		box.add_child(lb)
		row.add_child(box)
	return row











func _league_pos(team: Dictionary, mine: bool) -> int:
	if String(GameState.current_fixture().get("comp", "league")) != "league":
		return 0
	var key: String = GameState.YOU_KEY if mine else String(team.get("id", ""))
	if key.is_empty():
		return 0
	var rows: Array = GameState.league_standings()
	for i in rows.size():
		if String((rows[i] as Dictionary).get("key", "")) == key:
			return i + 1
	return 0
















































const KIT_BTN: Vector2 = Vector2(114.0, 114.0)
const KIT_BTN_PUSH: float = 0.085
const KIT_SLOTS: int = 3
const KIT_GAP: float = 12.0
const KIT_MARGIN: float = 16.0









const KIT_BELOW_FEET: float = 94.0


const KIT_NAMES: Array[String] = ["Uniforme titular", "Uniforme visitante",
	"Tercer uniforme", "Uniforme conmemorativo"]












var _btn_root: Control

func kit_button_root() -> Control:
	if _btn_root == null:
		_btn_root = Control.new()
		_btn_root.name = "KitButtons"
		_btn_root.set_anchors_preset(Control.PRESET_FULL_RECT)


		if is_inside_tree():
			var m: Vector2 = margenes_apaisados(get_viewport())
			_btn_root.offset_left = m.x
			_btn_root.offset_right = - m.y

		_btn_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return _btn_root


func _make_kit_buttons() -> void:












	if _composicion() == COMP_ENTRENO or _composicion() == COMP_CASA:
		return
	if not _kit_btn.is_empty():

		for side in _kit_btn:
			_place_kit_button(side)
			_refresh_kit_button(side)
		_place_lineups_button()
		return
	for side in [1.0, -1.0]:

		if side < 0.0 and GameState.current_rival().is_empty():
			continue











		if not _kit_banco() \
				and (not _people.has(side) or (_people[side] as Array).is_empty()):
			continue
		var row: Array = []




		var gala: bool = GameState.retro_available() if _is_mine(side) \
				else GameState.rival_retro_available()
		var slots: int = KIT_SLOTS + 1 if gala else KIT_SLOTS
		for slot in slots:
			var b: Button = Button.new()
			b.custom_minimum_size = KIT_BTN
			b.size = KIT_BTN
			b.focus_mode = Control.FOCUS_NONE
			b.tooltip_text = I18n.t(KIT_NAMES[slot])
			b.pressed.connect(_on_kit_pressed.bind(side, slot))
			if slot == 3:
				CareerUi.alert_glow(b, CareerTheme.MONEY)
			kit_button_root().add_child(b)
			row.append(b)
		_kit_btn[side] = row
		_place_kit_button(side)
		_refresh_kit_button(side)
	_make_lineups_button()




	call_deferred("_mount_btn_fallback")


func _mount_btn_fallback() -> void:
	if _btn_root != null and not _btn_root.is_inside_tree():
		add_child(_btn_root)

















signal alineaciones_pedidas

var _lineups_btn: Button
var _lineups_lbl: Label





const LINEUPS_W_TEXTO: float = 250.0

const LINEUPS_W_MAX: float = 290.0
const LINEUPS_ICON: float = 52.0


func _make_lineups_button() -> void:
	if _lineups_btn != null:
		_place_lineups_button()
		return
	var b: Button = Button.new()
	b.name = "LineupsButton"
	b.custom_minimum_size = Vector2(KIT_BTN.x, KIT_BTN.y)
	b.size = b.custom_minimum_size
	b.focus_mode = Control.FOCUS_NONE
	b.tooltip_text = I18n.t("ALINEACIONES")
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL)
	b.pressed.connect(func() -> void: alineaciones_pedidas.emit())


	var pila: VBoxContainer = VBoxContainer.new()
	pila.set_anchors_preset(Control.PRESET_FULL_RECT)
	pila.alignment = BoxContainer.ALIGNMENT_CENTER
	pila.add_theme_constant_override("separation", 8)
	pila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(pila)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(LINEUPS_ICON, LINEUPS_ICON)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ic.setup("once", CareerTheme.TEXT)
	pila.add_child(ic)
	_lineups_lbl = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	_lineups_lbl.text = CareerTheme.caps(I18n.t("ALINEACIONES"))
	_lineups_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_lineups_lbl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pila.add_child(_lineups_lbl)
	kit_button_root().add_child(b)
	_lineups_btn = b
	_place_lineups_button()






func _place_lineups_button() -> void:
	if _lineups_btn == null:
		return
	var izq: Array = _kit_btn.get(1.0, [])
	var der: Array = _kit_btn.get(-1.0, [])
	var pie_izq: Vector2 = _pies.get(1.0 if not _kit_banco() else _my_side(), Vector2.INF)
	var pie_der: Vector2 = _pies.get(-1.0 if not _kit_banco() else _my_side(), Vector2.INF)

	if izq.is_empty() or der.is_empty() or pie_izq == Vector2.INF or pie_der == Vector2.INF:
		_lineups_btn.visible = false
		return
	_lineups_btn.visible = true
	var desde: float =(izq[izq.size() - 1] as Button).position.x + KIT_BTN.x + KIT_GAP
	var hasta: float =(der[0] as Button).position.x - KIT_GAP
	var y: float =(izq[0] as Button).position.y
	var hueco: float = hasta - desde
	var w: float
	var con_texto: bool = true
	if hueco >= LINEUPS_W_TEXTO:
		w = minf(hueco, LINEUPS_W_MAX)
	elif hueco >= KIT_BTN.x:
		w = KIT_BTN.x
		con_texto = false
	else:
		w = LINEUPS_W_TEXTO
		var hl: Rect2 = _hueco_local()
		desde = hl.position.x
		hasta = hl.end.x
		y -= KIT_BTN.y + KIT_GAP
	_lineups_lbl.visible = con_texto
	_lineups_btn.custom_minimum_size = Vector2(w, KIT_BTN.y)
	_lineups_btn.size = _lineups_btn.custom_minimum_size
	_lineups_btn.position = Vector2((desde + hasta - w) * 0.5, y)



func _place_kit_button(side: float) -> void:
	var row: Array = _kit_btn.get(side, [])
	if row.is_empty():
		return


	var banco: bool = _kit_banco()
	var pies: Vector2 = _pies_de(_my_side() if banco else side)
	if pies == Vector2.INF:
		return






	var p: Vector2 = pies + Vector2(0.0, KIT_BELOW_FEET)
	var k: Vector2 = Vector2.ONE





	var w: float = KIT_BTN.x + KIT_GAP
	var base: Vector2 = p * k - KIT_BTN * 0.5







	var hl: Rect2 = _hueco_local()
	if not _fin_de_ano():
		base.x += - side * KIT_BTN_PUSH * hl.size.x






	var span: float = float(row.size() - 1) * w
	var lo: float = hl.position.x + KIT_MARGIN
	var hi: float = hl.end.x - KIT_BTN.x - KIT_MARGIN
	if side > 0.0:
		base.x = clampf(base.x - span, lo, hi - span) + span
	else:
		base.x = clampf(base.x, lo, hi - span)






	var left_edge: float = base.x - span if side > 0.0 else base.x
	if _fin_de_ano():
		left_edge = clampf(p.x * k.x -(span + KIT_BTN.x) * 0.5, lo, hi - span)






	if banco:
		left_edge = lo if side > 0.0 else hi - span
	for i in row.size():
		var b: Button = row[i]
		b.position = Vector2(left_edge + float(i) * w, base.y)







func _hueco_local() -> Rect2:
	if not (UiKit.es_horizontal() and is_inside_tree()):
		return Rect2(Vector2.ZERO, size)
	var h: Rect2 = hueco_apaisado(get_viewport())
	return Rect2(h.position - global_position, h.size)


func _pies_de(side: float) -> Vector2:
	var who: AnimatedSprite3D =(_people.get(side, []) as Array)[0] \
			if not (_people.get(side, []) as Array).is_empty() else null
	if is_instance_valid(who) and _cam != null and _vp != null \
			and _vp.size.x > 0 and _vp.size.y > 0:
		var feet: Vector3 = Vector3(who.position.x, 0.0, who.position.z)
		var k: Vector2 = _tam_viewport() / Vector2(_vp.size)
		_pies[side] = _cam.unproject_position(feet) * k
	return _pies.get(side, Vector2.INF)











func _refresh_kit_button(side: float) -> void:
	var row: Array = _kit_btn.get(side, [])
	var team: Dictionary = _my_team() if _is_mine(side) \
			else GameState.current_rival()
	var chosen: int = _kit_slot(side)
	for i in row.size():
		var b: Button = row[i]
		b.icon = JerseyArt.texture_dressed(GameState.kit_variant(team, i), team)






		b.expand_icon = false
		_kit_button_look(b, i == chosen)






const KIT_PAD: float = JerseyArt.BOTON_PAD


func _kit_button_look(b: Button, elegido: bool) -> void:
	JerseyArt.boton_look(b, elegido)


func _kit_slot(side: float) -> int:
	return GameState.player_kit_slot if _is_mine(side) else GameState.rival_kit_slot


func _kit_for(side: float) -> Dictionary:
	var team: Dictionary = _my_team() if _is_mine(side) \
			else GameState.current_rival()
	return GameState.kit_variant(team, _kit_slot(side))





func _on_kit_pressed(side: float, slot: int) -> void:
	if _kit_slot(side) == slot:
		return
	if _is_mine(side):
		GameState.player_kit_slot = slot
	else:
		GameState.rival_kit_slot = slot


	GameState.mark_kit_choice()
	_refresh_kit_button(side)
	UiAudio.toggle(true)



	if _armando:
		return


	if _foto != null:
		_sig = _firma()
		_arma_mundo(false)
		return


	if _composicion() != _comp_armada and _rearma(true):
		return
	_redress(side)






	if is_instance_valid(_stadium):
		_stadium.redress_bench()


	_sig = _firma()
	_refoto()





func _redress(side: float) -> void:


	if _composicion() == COMP_CASA:
		return




	var list: Array = _people.get(side, [])
	if list.is_empty():
		return
	var kit: Dictionary = _kit_for(side)
	var team: Dictionary = _team_of(side)
	var cfg_kit: Dictionary = _con_escudo(KitRecolor.team_only(kit), team)
	var seed_key: String = "you" if _is_mine(side) else "riv"
	var fichas: Array = _fila_fichas(side)
	for i in list.size():
		var spr = list[i]
		if not is_instance_valid(spr):
			continue




		var idx: int = i - 1
		var ficha: Dictionary = fichas[idx] if idx >= 0 and idx < fichas.size() else {}
		var cfg: Dictionary =(_mine_cfg() if _is_mine(side) else _rival_cfg()) \
				if i == 0 else _look_ficha(ficha, cfg_kit, team, seed_key, idx)
		var fr: SpriteFrames
		if i > 0 and _es_portero(ficha):
			fr = _frames_portero(cfg)
		else:
			fr = _frames_for(cfg)
		var frame_now: int = spr.frame
		spr.sprite_frames = fr
		spr.play("idle")
		spr.frame = frame_now



		_pecho_vestir(spr, cfg, team)



	_pecho_revisa()





func _kit_banco() -> bool:
	return _composicion() == COMP_BANQUILLO \
			and not GameState.current_rival().is_empty()



func _rival_kit() -> Dictionary:
	var rival: Dictionary = GameState.current_rival()



	return GameState.rival_kit() if not rival.is_empty() else {}




func _mine_cfg() -> Dictionary:
	var cfg: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	cfg.merge(_my_kit(), true)





	cfg["number"] = GameState.shirt_number_now()


















	if not _de_inicio():
		cfg["bib"] = Stadium.BIB_COLORS[0]
	return _con_escudo(cfg, _my_team())
















func _rival_cfg() -> Dictionary:
	var rival: Dictionary = GameState.current_rival()
	if rival.is_empty():
		return {}
	var kit: Dictionary = GameState.rival_kit()
	var ficha: Dictionary = _mejor_ficha(String(rival.get("id", "")))
	var nm: String = String(ficha.get("name", ""))


	var cfg: Dictionary = KitRecolor.appearance_for(
		nm if not nm.is_empty() else "hub_%s" % String(rival.get("id", "riv")),
		KitRecolor.team_only(kit))




	var num: int = int(ficha.get("number", 0))
	if num > 0:
		cfg["number"] = num
	return _con_escudo(cfg, rival)









func _fin_de_ano() -> bool:
	return GameState.season_close_pending












func _fin_trofeos_del_ano() -> Array:
	var nombres: Array = []
	for a in Career.current_season_awards():
		var n: String = str(a)
		if Ceremonies.TROPHIES.has(n) and not nombres.has(n):
			nombres.append(n)
	nombres.sort_custom(func(x, y) -> bool:
		return int((Ceremonies.TROPHIES[x] as Dictionary).get("rank", 0)) \
				> int((Ceremonies.TROPHIES[y] as Dictionary).get("rank", 0)))
	var out: Array = []
	for n in nombres.slice(0, FIN_TROPHY_MAX):
		out.append(String((Ceremonies.TROPHIES[n] as Dictionary).get("icon", "liga")))
	return out









func _fin_trofeos() -> void:
	var tipos: Array = _fin_trofeos_del_ano()
	for i in tipos.size():

		var paso: int = i / 2
		var signo: float = 1.0 if i % 2 == 0 else -1.0
		var x: float = signo *(FIN_TROPHY_X0 + float(paso) * FIN_TROPHY_GAP)
		_make_plinth(x)
		_make_trophy(String(tipos[i]), x)


func _make_plinth(x: float = 0.0) -> void:
	var col: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = PLINTH_R * 0.82
	cyl.bottom_radius = PLINTH_R
	cyl.height = PLINTH_H
	col.mesh = cyl
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.09, 0.09, 0.12)
	mat.roughness = 0.55
	mat.metallic = 0.25
	col.material_override = mat
	col.position = Vector3(x, PLINTH_H * 0.5, PLAYER_Z - TROPHY_AHEAD)
	_vp.add_child(col)





func _make_ball() -> void:
	var bf: SpriteFrames = BallDeco.frames_for(GameState.current_fixture())
	if bf == null:
		return
	var ball: AnimatedSprite3D = AnimatedSprite3D.new()
	ball.pixel_size = BALL_D / 32.0
	ball.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	ball.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	ball.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	ball.sprite_frames = bf
	ball.play("idle")
	ball.position = Vector3(BALL_SIDE, BALL_D * 0.5, PLAYER_Z - BALL_AHEAD)
	_vp.add_child(ball)










func _make_trophy(tipo: String = "", x: float = 0.0) -> void:
	var t: String = tipo if not tipo.is_empty() else comp_trophy_type()
	if t.is_empty():
		return
	var px: int = 320
	var tvp: SubViewport = SubViewport.new()
	tvp.size = Vector2i(px, px)
	tvp.transparent_bg = true
	tvp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	tvp.disable_3d = true



	var icon: TrophyIcon = TrophyIcon.new()
	icon.set_anchors_preset(Control.PRESET_FULL_RECT)
	icon.custom_minimum_size = Vector2(px, px)
	icon.set_type(t)
	tvp.add_child(icon)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tvp.get_texture()
	spr.pixel_size = TROPHY_H / float(px)
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD

	spr.position = Vector3(x, PLINTH_H + TROPHY_H * 0.5 - TROPHY_SINK,
		PLAYER_Z - TROPHY_AHEAD)
	_vp.add_child(spr)
	spr.add_child(tvp)

	_freeze_vp(tvp)




func comp_trophy_type() -> String:
	match String(GameState.current_fixture().get("comp", "")):
		"league":
			return "liga"
		"cup":
			return "copa"
		"ucl":
			return "champions"
		"eul":
			return "europa"
		"conf":
			return "conference"


		"lib", "sud", "cca", "ace", "ac2", "caf", "cf2", "ofc":
			return Continental.marca(String(GameState.current_fixture().get("comp", "")))


		"recopa", "supereuropa", "superafrica", "copaliga":
			return "copa"

		"ligas":
			return "ligas"
		"cwc", "intercont":
			return "clubes"
		"nat":



			if String(GameState.nat_state.get("comp", "")) == "cont":
				return "continental"
			return "mundial"
	return "liga"



















func _weather_box() -> void:
	if not is_instance_valid(_stadium) or not _stadium.precip_on():
		return
	_stadium.rain_follow(Vector3(0.0, RAIN_Y,
		PLAYER_Z - CAM_BACK + RAIN_AHEAD))










static func next_weather_id() -> String:
	if not GameState.next_weather.is_empty():
		return GameState.next_weather
	var id: String = Weather.pick_for(GameState.home_div(), GameState.home_country(),
		GameState.home_comp(), GameState.season_progress())
	GameState.next_weather = id
	return id















static func next_rain_level() -> int:
	if next_weather_id() != "rain":
		return -1
	if GameState.next_rain < 0:
		GameState.next_rain = Weather.roll_rain()
	return GameState.next_rain













func _feet(pixel_size: float) -> float:
	var path: String = "res://assets/sprites/anim/idle_south_00.png"
	if not ResourceLoader.exists(path):
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	var img: Image = SceneFade.imagen(load(path))
	if img == null:
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	if img.is_compressed():
		img.decompress()
	var used: Rect2i = img.get_used_rect()
	if used.size.y <= 0:
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	var pad_bottom: float = float(img.get_height() - used.end.y)
	return (float(img.get_height()) * 0.5 - pad_bottom) * pixel_size - PLAYER_SINK




func _frames_for(cfg: Dictionary) -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)
	var bases: PackedStringArray = PackedStringArray()
	var fuentes: Array = []
	for i in 4:
		var path: String = "res://assets/sprites/anim/idle_south_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			bases.append(path.get_file().get_basename())
			fuentes.append(path)
	if frames.get_frame_count("idle") == 0:
		frames.add_frame("idle", KitRecolor.apply(
			load("res://assets/sprites/players/player_south.png"), cfg))
		bases.append("player_south")
	_apunta_cara(frames, cfg, fuentes)






	PechoRig.apunta(frames, bases)
	return frames





static func _apunta_cara(frames: SpriteFrames, cfg: Dictionary, fuentes: Array) -> void:
	if fuentes.is_empty() or fuentes.size() != frames.get_frame_count("idle"):
		return
	frames.set_meta("look_cfg", cfg)
	frames.set_meta("cara_fuentes", {"idle": fuentes})









static func animo_de_racha(racha: Array) -> String:
	var nota: int = 0
	for i in racha.size():
		var r: String = String(racha[i])
		var peso: int = 2 if i == racha.size() - 1 else 1
		nota += peso if r == "G" else (- peso if r == "P" else 0)
	return "buena" if nota >= 2 else ("mala" if nota <= -2 else "normal")


func _cara_de_racha(spr: AnimatedSprite3D, animo: String, rng: RandomNumberGenerator) -> void:
	var cara: CaraViva = CaraViva.pon(spr)
	if cara == null:
		return
	cara.anima(Expresiones.de_bolsa(animo, rng))

















func _frames_portero(cfg: Dictionary) -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)
	var bases: PackedStringArray = PackedStringArray()
	var fuentes: Array = []
	for i in PECHO_CUADROS:
		var path: String = "res://assets/sprites/anim/idle_keeper_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			bases.append(path.get_file().get_basename())
			fuentes.append(path)
	if frames.get_frame_count("idle") == 0:
		return _frames_for(cfg)
	_apunta_cara(frames, cfg, fuentes)
	PechoRig.apunta(frames, bases)
	return frames




























const PECHO_ANIMS: Array[Dictionary] = [
	{"anim": "idle", "path": "idle_south_%02d.png", "from": 0, "to": 3},
]





const PECHO_CUADROS: int = 4




















const PECHO_QUIETO: int = 0



static var _pecho_indice: bool = false









var _pecho_puesto: Dictionary = {}




func _team_of(side: float) -> Dictionary:
	return _my_team() if _is_mine(side) else GameState.current_rival()








func _con_escudo(cfg: Dictionary, team: Dictionary) -> Dictionary:
	var clave: String = CrestLogos.key_of(team)
	if clave.is_empty() or not CrestLogos.has(clave):
		return cfg






	if CrestLogos.texture(clave) == null:
		return cfg
	var out: Dictionary = cfg.duplicate()
	out["crest_logo"] = clave
	return out













func _pecho_vestir(spr: AnimatedSprite3D, cfg: Dictionary, team: Dictionary) -> void:
	_pecho_quitar(spr)
	if _vp == null or not is_instance_valid(_vp):
		return
	if spr.sprite_frames == null \
			or spr.sprite_frames.get_frame_count("idle") != PECHO_CUADROS:
		return
	var fila: Dictionary = {}






	var num: int = int(cfg.get("number", 0))
	if num > 0:



		var frame: Image = null
		var t0: Texture2D = spr.sprite_frames.get_frame_texture("idle", 0)
		if t0 != null:
			frame = t0.get_image()




		var rec: Dictionary = ShortNum.receta_para(cfg, frame,
			ShortNum.caja_fichero(PechoRig.base_de(spr, PECHO_QUIETO)))
		var stex: ImageTexture = ShortNum.textura(num, rec)
		if stex != null:
			var shn: Sprite3D = ShortNum.nodo(stex)
			_vp.add_child(shn)
			fila["shn"] = shn
















	if cfg.has("bib"):
		if not fila.is_empty():
			spr.set_meta("pecho", fila)
			set_process(true)
		return
	if not cfg.has("crest_logo"):
		if not fila.is_empty():
			spr.set_meta("pecho", fila)
			set_process(true)
		return





	var epoca: bool = bool(cfg.get("retro", false))
	var logo: Texture2D = CrestLogos.texture(String(cfg["crest_logo"]), epoca)
	if logo == null:
		if not fila.is_empty():
			spr.set_meta("pecho", fila)
			set_process(true)
		return
	if not _pecho_indice:
		_pecho_indice = true
		Pecho.build_index(PECHO_ANIMS)
	var esc: Sprite3D = Pecho.nodo(logo)
	_vp.add_child(esc)
	fila["esc"] = esc


	var marca: Texture2D = SponsorLogos.for_team(String(team.get("id", "")), epoca)
	if marca != null:
		var pat: Sprite3D = Pecho.nodo(Pecho.marca_para(marca, cfg, "pat"))
		_vp.add_child(pat)
		fila["pat"] = pat

	var fab_tex: Texture2D = KitBrands.for_team(String(team.get("id", "")), epoca,
		int(cfg.get("kit_slot", 0)))
	if fab_tex != null:
		var fab: Sprite3D = Pecho.nodo(Pecho.marca_para(fab_tex, cfg, "fab"))
		_vp.add_child(fab)
		fila["fab"] = fab
	spr.set_meta("pecho", fila)
	set_process(true)




func _pecho_quitar(spr: AnimatedSprite3D) -> void:
	if not spr.has_meta("pecho"):
		return
	var fila: Dictionary = spr.get_meta("pecho")
	for k in fila:
		var n: Node = SceneFade.vivo(fila[k]) as Node
		if is_instance_valid(n):
			n.queue_free()
	spr.remove_meta("pecho")
	_pecho_puesto.erase(spr.get_instance_id())




func _pecho_revisa() -> void:
	for side in _people:
		for a in (_people[side] as Array):
			if is_instance_valid(a) and (a as Node).has_meta("pecho"):
				set_process(true)
				return
	set_process(false)














func _process(_delta: float) -> void:
	if _vp == null or not is_instance_valid(_vp) or not is_instance_valid(_cam):
		return
	for side in _people:
		for a in (_people[side] as Array):


			if not is_instance_valid(a):
				continue
			var duenio: AnimatedSprite3D = a as AnimatedSprite3D
			if duenio == null or not duenio.has_meta("pecho"):
				continue
			var fila: Dictionary = duenio.get_meta("pecho")


			var firma: Array = _pecho_firma(duenio)
			var previo: Array = _pecho_puesto.get(duenio.get_instance_id(), [])
			if not previo.is_empty() and is_same(previo[0], fila) and previo[1] == firma:
				continue
			_pecho_puesto[duenio.get_instance_id()] = [fila, firma]





			var r: Dictionary = Pecho.rects_base(
				PechoRig.base_de(duenio, PECHO_QUIETO))
			var esc: Sprite3D = SceneFade.vivo(fila.get("esc")) as Sprite3D
			if is_instance_valid(esc):
				Pecho.seguir(esc, duenio, r.get("esc", Rect2()),
					duenio.pixel_size, _cam)
			var pat: Sprite3D = SceneFade.vivo(fila.get("pat")) as Sprite3D
			if is_instance_valid(pat):
				Pecho.seguir(pat, duenio, r.get("pat", Rect2()),
					duenio.pixel_size, _cam, Pecho.PAT_CRECE)
			var fab: Sprite3D = SceneFade.vivo(fila.get("fab")) as Sprite3D
			if is_instance_valid(fab):
				Pecho.seguir(fab, duenio, r.get("fab", Rect2()),
					duenio.pixel_size, _cam)





			var shn: Sprite3D = SceneFade.vivo(fila.get("shn")) as Sprite3D
			if is_instance_valid(shn):
				ShortNum.seguir(shn, duenio,
					ShortNum.caja_fichero(PechoRig.base_de(duenio, PECHO_QUIETO)),
					duenio.pixel_size, _cam)







func _pecho_firma(duenio: AnimatedSprite3D) -> Array:
	return [duenio.global_position, duenio.flip_h, duenio.offset, duenio.visible,
		duenio.pixel_size, duenio.sprite_frames, duenio.animation,
		_cam.global_transform]
