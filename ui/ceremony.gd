class_name Ceremony
extends Control





























const HUB_SCENE: String = "res://ui/career_hub.tscn"

const LOGROS_SCENE: String = "res://ui/logros.tscn"


const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS: Vector2 = Vector2(65.0, 38.0)



















const PAREJA_HEIGHT_M: float = 1.7
const PAREJA_METRICS: Vector2 = Vector2(69.0, 38.0)

const PAREJA_PIXEL: float = PAREJA_HEIGHT_M / 69.0
const PLAYER_SINK: float = 0.04


const CENTER_Z: float = 52.5






const FLASH_LIFE: float = 0.16
const FLASH_MAX: int = 70
const FLASH_R: float = 7.0


const CONFETTI_MAX: int = 240
const CONFETTI_FALL: Vector2 = Vector2(90.0, 190.0)
const CONFETTI_SIZE: Vector2 = Vector2(7.0, 15.0)




var data_override: Dictionary = {}




var locker_audio: Node = null
var locker_murmur: AudioStreamPlayer = null



var locker_far: AudioStreamPlayer = null

var locker_shower: AudioStreamPlayer = null

var data: Dictionary = {}
var accent: Color = CareerTheme.MONEY
var standalone: bool = false










var embedded: bool = false


signal acto_terminado











static var replay_pendiente: Dictionary = {}
static var replay_hecho: String = ""





static var suelto_pendiente: Dictionary = {}
static var suelto_vuelve: String = ""
var _vuelve_a: String = ""
var replay: bool = false
var t: float = 0.0


var viewport: SubViewport



var viewport_box: SubViewportContainer
var stadium: Stadium
var cam: Camera3D
var player: AnimatedSprite3D
var audio: MatchAudio

var cam_keys: Array[Dictionary] = []
var focus: Vector3 = Vector3(0.0, 0.0, CENTER_Z)
var orbit_speed: float = -1.4


var flash_pool: Array[Vector3] = []
var flash_rate: float = 0.0
var flash_burst_at: float = -1.0
var flash_burst_dur: float = 1.5
var flash_burst_mult: float = 5.0


var flash_radius: float = FLASH_R
var confetti_colors: Array[Color] = []



var confetti_count: int = CONFETTI_MAX

var rng: RandomNumberGenerator = RandomNumberGenerator.new()








var _shake_amp: float = 0.0
var _shake_left: float = 0.0
var _shake_dur: float = 0.001
var _fov_punch: float = 0.0
var _white: float = 0.0
var _white_dur: float = 0.001

var _flashes: Array[Dictionary] = []
var _flash_acc: float = 0.0
var _fx_layer: Control
















var _walk_pend: Array[Dictionary] = []



var _telon: MenuLoading = null
var _telon_capa: CanvasLayer = null
var _telon_base: float = 0.0

var _scrim_grad: Gradient = null
var _confetti: Array[Dictionary] = []
var _confetti_on: bool = false


var chyron: Control
var card: PanelContainer
var card_box: VBoxContainer
var card_at: float = 8.2
var chyron_at: float = 2.9
var _chyron_tw: Tween
var _chyron_espera: bool = false
var _card_tw: Tween
var _card_rest: float = 0.0
var _count_label: Label
var _count_to: int = 0
var _leaving: bool = false




var ficha_puesta: bool = false
const AUTO_SEGUIR: float = 20.0
var _auto_tw: Tween






















const DECISION_GAP: float = 1.7



const DECISION_MAX: float = 0.5


const WORLD_SHRINK_AT: float = 0.3





const DECISION_COLUMNA_K: float = 0.44
const DECISION_COLUMNA_MIN: float = 760.0
const DECISION_COLUMNA_MAX: float = 960.0



const FICHA_CENTRADA_MAX: float = 1100.0
const FICHA_CENTRADA_AIRE: float = 20.0


var world_band: float = 1.0











var tumbado_centrado: bool = false
var _band_tw: Tween
var _bg: ColorRect

var _decision_ev: Dictionary = {}
var _decision_recap: String = ""
var _decision_resolve: Callable = Callable()





var _decision_enabled: Callable = Callable()
var _decision_postpone: String = ""
var _decision: DecisionPanel
var _decision_scroll: ScrollContainer
var _decision_open: bool = false






var _kit_marca: int = -1


func _ready() -> void:


	Telemetry.marca_pantalla(3, self)
	_kit_marca = KitRecolor.marca_sesion()



	add_to_group(Settings.AHORRO_HOLD_GROUP)




	add_to_group(Entrada.CAPA_GROUP)
	_adopta_replay()
	standalone = not data_override.is_empty()
	data = data_override if standalone else _consume()
	if data.is_empty():

		SceneFade.to_scene(HUB_SCENE)
		return









	_primera_vez = not Career.escenas_vividas.has(String(data.get("kind", "")))
	if se_vive(replay, standalone, embedded):
		if Career.marca_escena_vivida(sella_vivo(_recuerdo())):
			Career._save()




		Career.mensaje_eco_idolo(String(data.get("kind", "")))
	accent = _accent_for()
	CareerTheme.accent_ctx = accent
	rng.seed = hash(str(data.get("kind", "")) + str(data.get("season", 0))
		+ String(data.get("club", "")))
	set_anchors_preset(Control.PRESET_FULL_RECT)
	_build_viewport()
	_build_scrim()
	_build_fx_layer()





	_build_skip()

















	_aplica_musica()





	_precalienta_cues()













	_armar_vigia_arranque()










	var previo: Dictionary = _estadio_previo()
	if not previo.is_empty():
		_adopta_telon()
		if _telon != null:
			await _levanta_estadio(previo)
			if not is_inside_tree() or _leaving:
				return
	_build()

	_build_ok = true


	_build_foto()
	CareerUi.normalize_caps(self)


	_armar_vigia()






	if _walk_pend.is_empty() and _telon != null:
		_cierra_telon()
	else:
		_reparte_caminatas()


func _exit_tree() -> void:
	CareerTheme.clear_ctx()



	if _kit_marca >= 0:
		KitRecolor.poda_desde(_kit_marca)
		_kit_marca = -1



	if _rec != null and is_instance_valid(_rec):
		_rec.abort()


func _process(delta: float) -> void:
	if _leaving or cam == null:
		return






	if _telon != null and is_instance_valid(_telon):
		_tick_camera()
		return
	t += delta
	_tick_chyron()
	_tick_punch(delta)
	_tick_camera()
	_tick_flashes(delta)
	_tick_confetti(delta)
	_espalda_follow()
	_pecho_scan(delta)
	_cara_scan(delta)
	_pecho_follow()
	_tick(delta)



func _consume() -> Dictionary:
	return Career.consume_ceremony()






func _adopta_replay() -> void:
	if data_override.is_empty() and not suelto_pendiente.is_empty():
		data_override = suelto_pendiente
		_vuelve_a = suelto_vuelve
		suelto_pendiente = {}
		suelto_vuelve = ""
		return
	if not data_override.is_empty() or replay_pendiente.is_empty():
		return
	data_override = replay_pendiente
	replay_pendiente = {}
	replay = true






func _recuerdo() -> Dictionary:
	return data











const VIVO: String = "_vivo"





static func se_vive(es_replay: bool, es_standalone: bool, es_embedded: bool) -> bool:
	return not es_replay and (not es_standalone or es_embedded)


func sella_vivo(r: Dictionary) -> Dictionary:
	var out: Dictionary = r.duplicate(true)
	if not out.has(VIVO):
		out[VIVO] = {
			"club": GameState.player_team_id,
			"div": GameState.player_div(),
			"number": GameState.shirt_number_now(),
			"season": GameState.season_num,
		}
	return out




func vivo_de(key: String, def: Variant) -> Variant:
	var v: Variant = data.get(VIVO)
	return (v as Dictionary).get(key, def) if v is Dictionary else def













const MUSIC_KEEP: String = "@keep"


func _music_for() -> String:
	return Ceremonies.music_of(String(data.get("kind", "")))


func _aplica_musica() -> void:
	var id: String = _music_for()
	if id == MUSIC_KEEP:
		return
	if id.is_empty():
		Music.stop(0.8)
		return
	Music.play(id)



func _build() -> void:
	pass



func _tick(_delta: float) -> void:
	pass



func _accent_for() -> Color:
	return CareerTheme.accent_of(team())






func team() -> Dictionary:





	var nation: String = String(data.get("nation", ""))
	if not nation.is_empty():
		var nat: Dictionary = Nations.as_team(nation)
		if not nat.is_empty():
			return nat
	return Teams.by_id(club_del_acto())




func club_del_acto() -> String:
	return String(data.get("club", vivo_de("club", GameState.player_team_id)))







func team_name(vacio: String = "") -> String:
	return Nations.team_label(team(), vacio)


func div() -> int:
	return clampi(int(data.get("div", vivo_de("div", GameState.player_div()))), 1, 3)



func temporada_del_acto() -> int:
	return int(data.get("season", vivo_de("season", GameState.season_num)))





func dorsal_vivido() -> int:
	return int(vivo_de("number", GameState.shirt_number_now()))





func shirt() -> int:
	var n: int = int(data.get("number", 0))
	return n if n > 0 else dorsal_vivido()













func winner() -> Dictionary:
	return data.get("winner", {}) as Dictionary



func mine() -> bool:
	return winner().is_empty()



func act_name() -> String:
	return Career.player_name if mine() else String(winner().get("name", "?"))












func act_look(kit: Dictionary) -> Dictionary:
	if mine():
		var mio: Dictionary = GameState.team_custom.duplicate()




		for k in KitRecolor.TEAM_KEYS:
			mio.erase(k)
		mio.merge(kit, true)
		return mio
	var w: Dictionary = winner()
	var nom: String = String(w.get("name", "?"))
	var base: Dictionary = act_keeper_cfg(kit)




	var look: Dictionary = KitRecolor.appearance_for(nom, base)
	look["apellido"] = Espalda.apellido_de(nom)
	look["number"] = int(w.get("number", 0))
	return look











func act_keeper() -> bool:
	return bool(winner().get("portero", false))









func act_keeper_cfg(kit: Dictionary) -> Dictionary:
	if not act_keeper():
		return kit





	return KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(
		String(team().get("id", "")), -1, String(kit.get("pattern", ""))), kit)





func act_sheet(fallback: String = "") -> String:
	return "res://assets/sprites/anim/idle_keeper_" if act_keeper() else fallback




func _build_viewport() -> void:
	var vpc: SubViewportContainer = SubViewportContainer.new()
	viewport_box = vpc
	vpc.stretch = true
	vpc.set_anchors_preset(Control.PRESET_FULL_RECT)
	vpc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(vpc)
	viewport = SubViewport.new()
	viewport.transparent_bg = false















	viewport.own_world_3d = true
	viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS

	viewport.msaa_3d = Viewport.MSAA_DISABLED


	UiKit.aplica_escala_3d_sub(viewport, get_viewport())
	vpc.add_child(viewport)




















func make_stadium(cfg: Dictionary) -> Stadium:


	if _estadio_hecho and stadium != null and is_instance_valid(stadium):
		return stadium
	_prepara_estadio(cfg)
	viewport.add_child(stadium)
	_viste_estadio(cfg)
	return stadium





func _prepara_estadio(cfg: Dictionary) -> void:
	stadium = Stadium.new()
	stadium.div = clampi(int(cfg.get("div", div())), 1, 3)
	stadium.att_override = clampf(float(cfg.get("attendance", 1.0)), 0.0, 1.0)
	stadium.home_only = bool(cfg.get("home_only", true))




	stadium.venue_empty = bool(cfg.get("venue_empty", false))






	if cfg.has("training"):
		stadium.train_override = 1 if bool(cfg["training"]) else 0









	stadium.dugout_views = bool(cfg.get("dugout_views", true))



	if cfg.has("tifo_especial"):
		stadium.tifo_especial = Dictionary(cfg["tifo_especial"])
	if cfg.has("rival_club"):
		stadium.rival_club = String(cfg["rival_club"])














	stadium.kickoff_override = clampf(float(cfg.get("kickoff", -1.0)), -1.0, 1.0)
	stadium.party = bool(cfg.get("party", false))




	stadium.flare_cap = int(cfg.get("flare_cap", -1))
	stadium.flare_odds = float(cfg.get("flare_odds", 1.0))








	if cfg.has("comp"):
		stadium.comp_override = String(cfg["comp"])
	stadium.home_club = String(cfg.get("home_club", ""))
	var kit: Dictionary = cfg.get("kit", {})
	if not kit.is_empty():
		stadium.home_kit = kit
	stadium.banner_text = String(cfg.get("banner", ""))


	if cfg.has("cannons"):
		stadium.cannons_act_force = 1 if bool(cfg["cannons"]) else 0
	var spots_v: Variant = cfg.get("cannon_spots", [])
	if spots_v is Array and not (spots_v as Array).is_empty():
		for v in spots_v:
			stadium.cannon_spots_override.append(v as Vector3)
		stadium.cannon_aim_override = cfg.get("cannon_aim", Vector3.ZERO)
	stadium.cannons_manual = bool(cfg.get("cannons_manual", false))



func _viste_estadio(cfg: Dictionary) -> void:
	stadium.apply_weather(String(cfg.get("weather", "day")))





	stadium.serpentinas_throw(true)
	var board: String = String(cfg.get("board", ""))
	if not board.is_empty():
		stadium.set_scoreboard_text(board)






func _estadio_previo() -> Dictionary:
	return {}



var _estadio_hecho: bool = false



const ESTADIO_TRAMO: float = 0.85


func _levanta_estadio(cfg: Dictionary) -> void:
	_prepara_estadio(cfg)

	stadium.async_build = true
	stadium.build_progress.connect(_progreso_estadio)
	viewport.add_child(stadium)
	await stadium.build_async()
	if not is_inside_tree() or not is_instance_valid(stadium):
		return
	stadium.build_progress.disconnect(_progreso_estadio)
	_viste_estadio(cfg)
	_estadio_hecho = true
	if _telon != null and is_instance_valid(_telon):
		_telon_progreso(ESTADIO_TRAMO)
		_telon_base = _telon.rebase()


func _progreso_estadio(done: float) -> void:
	_telon_progreso(done * ESTADIO_TRAMO)









const BOARD_CABE_GRANDE: int = 9
func board_fit(s: String) -> String:
	var txt: String = CareerTheme.caps(s).strip_edges()
	if txt.length() <= BOARD_CABE_GRANDE or txt.length() > 12:
		return txt
	var falta: int = 13 - txt.length()
	return " ".repeat(falta / 2 + falta % 2) + txt + " ".repeat(falta / 2)




func make_camera(keys: Array, fov_default: float = 40.0) -> Camera3D:
	cam_keys.assign(keys)
	cam = Camera3D.new()
	cam.fov = fov_default
	cam.current = true
	viewport.add_child(cam)
	if not cam_keys.is_empty():
		_apply_cam(cam_keys[0])
	if stadium != null:
		stadium.rain_follow(cam.global_position)
	return cam













const CUBIERTA_CANTO: float = 0.8




const CUBIERTA_DESDE: float = 16.0

const CUBIERTA_SUELO: float = 0.2









func cubierta_tapa(ojo: Vector3, marco: Dictionary) -> bool:
	return cubierta_tapa_en(stadium, ojo, marco)




static func cubierta_tapa_en(est: Stadium, ojo: Vector3, marco: Dictionary) -> bool:
	if est == null or marco.is_empty():
		return false


	var borde: Vector3 =(marco["center"] as Vector3) +(marco["normal"] as Vector3) * 0.26 \
			+ Vector3.UP *(float(marco["height"]) * 1.3 / 3.4)
	var sube: Vector3 = Vector3.UP * CUBIERTA_CANTO
	for caja in est._roof_boxes:
		var inv: Transform3D = caja["inv"]
		var h: Vector3 = caja["half"]
		if AABB(- h, h * 2.0).intersects_segment(inv *(ojo + sube), inv *(borde + sube)):
			return true
	return false













func alza_cubierta(llano: Vector3, dist: float, marco: Dictionary,
		desde: float = CUBIERTA_DESDE) -> float:
	if not cubierta_tapa(llano, marco):
		return 0.0
	var tope: float = rad_to_deg(atan((llano.y - CUBIERTA_SUELO) / maxf(dist, 0.001)))
	var g: float = minf(desde, tope)
	while g < tope and cubierta_tapa(llano + Vector3.DOWN * dist * tan(deg_to_rad(g)), marco):
		g = minf(g + 1.0, tope)
	return maxf(g, 0.0)











const WALK_SHEET: String = "res://assets/sprites/anim/walk_player_"
const WALK_FRAMES: int = 8
const WALK_FPS: float = 7.0























func add_walk(spr: AnimatedSprite3D, kit: Dictionary = {}, paso: int = 1,
		diferido: bool = false) -> bool:
	if spr == null or spr.sprite_frames == null:
		return false
	var cfg: Dictionary = _walk_cfg(spr, kit)
	if diferido and not GameState.readonly_save:
		for d in WALK_DIRS:
			_walk_pend.append({"spr": spr, "cfg": cfg, "paso": paso, "dir": d})


		return ResourceLoader.exists("%ssouth_01.png" % WALK_SHEET)
	var any: bool = false
	for d in WALK_DIRS:
		any = _walk_dir(spr, cfg, paso, d) or any
	return any





func _walk_cfg(spr: AnimatedSprite3D, kit: Dictionary) -> Dictionary:
	var cfg: Dictionary = kit
	if cfg.is_empty():
		cfg = GameState.team_custom.duplicate()
		for k in KitRecolor.TEAM_KEYS:
			cfg.erase(k)
		cfg.merge(GameState.player_kit(), true)
	return _cfg_laminas(spr, cfg)

































func _cfg_laminas(spr: AnimatedSprite3D, cfg: Dictionary) -> Dictionary:
	if _espalda_puesta(spr) or espalda_toca(cfg):
		cfg = cfg.duplicate()
		cfg["num_lamina"] = true
	return _cfg_con_escudo(cfg, false)



func _walk_dir(spr: AnimatedSprite3D, cfg: Dictionary, paso: int,
		d: String) -> bool:
	if spr == null or not is_instance_valid(spr) or spr.sprite_frames == null:
		return false
	var anim: String = "walk_" + d
	if spr.sprite_frames.has_animation(anim):
		return true
	var added: int = 0
	for i in range(1, WALK_FRAMES + 1, maxi(paso, 1)):
		var path: String = "%s%s_%02d.png" % [WALK_SHEET, d, i]
		if not ResourceLoader.exists(path):
			continue
		if added == 0:
			spr.sprite_frames.add_animation(anim)
			spr.sprite_frames.set_animation_loop(anim, true)



			spr.sprite_frames.set_animation_speed(anim,
				WALK_FPS / float(maxi(paso, 1)))
		spr.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
		added += 1
	if added > 0:





		espalda_registra(spr, anim, "%s%s_" % [WALK_SHEET, d], 1, maxi(paso, 1))
	return added > 0



const WALK_DIRS: Array[String] = ["south", "north", "east", "west"]






func _walk_listo(spr: AnimatedSprite3D) -> void:
	if _walk_pend.is_empty():
		return
	var quedan: Array[Dictionary] = []
	for e in _walk_pend:
		if e["spr"] == spr:
			_walk_dir(spr, e["cfg"], int(e["paso"]), String(e["dir"]))
		else:
			quedan.append(e)
	_walk_pend = quedan



const TELON_LAYER: int = 90


const TELON_CIERRE: float = 0.5















func _reparte_caminatas() -> void:
	if _walk_pend.is_empty():
		return
	_adopta_telon()
	var total: int = _walk_pend.size()
	while not _walk_pend.is_empty():
		await get_tree().process_frame


		if not is_inside_tree():
			return



		if _walk_pend.is_empty():
			break
		var e: Dictionary = _walk_pend.pop_front()
		_walk_dir(e["spr"], e["cfg"], int(e["paso"]), String(e["dir"]))
		_telon_progreso(1.0 - float(_walk_pend.size()) / float(total))
	await _cierra_telon()







func _adopta_telon() -> void:
	var t: MenuLoading = SceneFade.curtain_handoff()
	if t == null:
		return
	_telon = t
	_telon_base = _telon.rebase()
	_telon_capa = CanvasLayer.new()
	_telon_capa.layer = TELON_LAYER
	add_child(_telon_capa)
	_telon_capa.add_child(_telon)
	_telon.set_message(I18n.t("Cargando…"))


	_telon.tree_exited.connect(_telon_capa.queue_free)


func _telon_progreso(p: float) -> void:
	if _telon != null and is_instance_valid(_telon):
		_telon.set_progress(_telon_base +(1.0 - _telon_base) * clampf(p, 0.0, 1.0))





func _cierra_telon() -> void:
	if _telon == null or not is_instance_valid(_telon):
		return
	_telon_progreso(1.0)
	var t0: int = Time.get_ticks_msec()
	while not _telon.bar_settled() \
			and Time.get_ticks_msec() - t0 < int(TELON_CIERRE * 1000.0):
		await get_tree().process_frame
		if not is_inside_tree() or not is_instance_valid(_telon):
			return
	_telon.dismiss()
	_telon = null










func walk_dir_name(dir: Vector3, spr: Node = null) -> String:
	return Stadium.dir_name_towards(dir, vista_de(spr))














func vista_de(spr: Node) -> Camera3D:
	var c: Camera3D = SceneFade.meta_vivo(spr, &"vista") as Camera3D
	return c if c != null else cam

















const IDLE_SHEET: String = "res://assets/sprites/anim/idle_"



func add_idle_views(spr: AnimatedSprite3D, kit: Dictionary = {}) -> bool:
	if spr == null or spr.sprite_frames == null:
		return false





	var cfg: Dictionary = kit
	if cfg.is_empty():
		cfg = spr.sprite_frames.get_meta("look_cfg", {})
	if cfg.is_empty():
		cfg = _walk_cfg(spr, {})



	cfg = _cfg_laminas(spr, cfg)
	var any: bool = false
	for d: String in ["east", "west", "north"]:
		var anim: String = "idle_" + d
		if spr.sprite_frames.has_animation(anim):
			any = true
			continue
		var path: String = "%s%s_00.png" % [IDLE_SHEET, d]
		if not ResourceLoader.exists(path):
			continue
		spr.sprite_frames.add_animation(anim)
		spr.sprite_frames.set_animation_loop(anim, true)
		spr.sprite_frames.set_animation_speed(anim, 4.5)
		spr.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))








		espalda_registra(spr, anim, "%s%s_" % [IDLE_SHEET, d], 0)
		any = true
	return any


























func add_gesto(spr: AnimatedSprite3D, familia: String, cuadros: int,
		fps: float, kit: Dictionary = {}) -> bool:
	if spr == null or spr.sprite_frames == null:
		return false
	var cfg: Dictionary = kit
	if cfg.is_empty():
		cfg = spr.sprite_frames.get_meta("look_cfg", {})
	if cfg.is_empty():
		cfg = _walk_cfg(spr, {})




	cfg = _cfg_laminas(spr, cfg)
	spr.sprite_frames.set_meta("gesto_" + familia,
		{"cuadros": cuadros, "fps": fps, "cfg": cfg})



	return ResourceLoader.exists(
		"res://assets/sprites/anim/%s_player_south_01.png" % familia)






func gesto_play(spr: AnimatedSprite3D, familia: String, dir: Vector3) -> bool:
	if spr == null or spr.sprite_frames == null:
		return false
	var d: String = walk_dir_name(dir, spr)
	var anim: String = "%s_%s" % [familia, d]
	if not spr.sprite_frames.has_animation(anim):
		if not _gesto_arma(spr, familia, d):
			return false
	spr.play(anim)
	return true









func gesto_sostiene(spr: AnimatedSprite3D, familia: String, dir: Vector3,
		desde: int = 1) -> bool:
	if spr == null or spr.sprite_frames == null:
		return false
	var seguia: bool = String(spr.animation).begins_with(familia + "_")
	if seguia and spr.is_playing():
		return true
	if not gesto_play(spr, familia, dir):
		return false
	if seguia:
		spr.frame = mini(desde, spr.sprite_frames.get_frame_count(spr.animation) - 1)
	return true









func _gesto_arma(spr: AnimatedSprite3D, familia: String, d: String) -> bool:
	var receta: Dictionary = spr.sprite_frames.get_meta("gesto_" + familia, {})
	if receta.is_empty():
		return false
	var anim: String = "%s_%s" % [familia, d]
	var cfg: Dictionary = receta["cfg"]
	var added: int = 0
	for i in range(1, int(receta["cuadros"]) + 1):
		var path: String = "res://assets/sprites/anim/%s_player_%s_%02d.png" \
				% [familia, d, i]
		if not ResourceLoader.exists(path):
			break
		if added == 0:
			spr.sprite_frames.add_animation(anim)
			spr.sprite_frames.set_animation_loop(anim, false)
			spr.sprite_frames.set_animation_speed(anim, float(receta["fps"]))
		spr.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
		added += 1
	if added == 0 and spr.sprite_frames.has_animation(anim):
		spr.sprite_frames.remove_animation(anim)
	if added > 0:






		espalda_registra(spr, anim, "%s_player_%s_" % [familia, d], 1)
	return added > 0









func en_gesto(spr: AnimatedSprite3D) -> bool:
	if spr == null or spr.sprite_frames == null:
		return false
	var a: String = spr.animation
	if a == "idle" or a.begins_with("idle_"):
		return false
	return spr.is_playing()








func idle_play(spr: AnimatedSprite3D, dir: Vector3) -> void:
	if spr == null or spr.sprite_frames == null:
		return


	if en_gesto(spr):
		return
	var anim: String = "idle"
	if Vector2(dir.x, dir.z).length_squared() > 0.0001:
		var d: String = walk_dir_name(dir, spr)
		if d != "south":
			anim = "idle_" + d
	if spr.animation == anim or not spr.sprite_frames.has_animation(anim):
		return



	var f: int = spr.frame
	spr.play(anim)
	spr.frame = f % maxi(1, spr.sprite_frames.get_frame_count(anim))





func walk_play(spr: AnimatedSprite3D, dir: Vector3) -> void:
	if spr == null or spr.sprite_frames == null:
		return
	_walk_listo(spr)


	var anim: String = "walk_" + walk_dir_name(dir, spr)
	if Vector2(dir.x, dir.z).length_squared() < 0.0001 \
			or not spr.sprite_frames.has_animation(anim):
		anim = "idle"
	if spr.animation != anim and spr.sprite_frames.has_animation(anim):
		spr.play(anim)



























const COACH_IDLE_SHEET: String = "res://assets/sprites/anim/coach_south_"


const COACH_IDLE_ART: String = "res://assets/sprites/anim/coach_south_00.png"

var paseo_dt: AnimatedSprite3D = null
var paseo_y0: float = 0.0
var _paseo_x: float = 0.0
var _paseo_dir: float = -1.0
var _paseo_wait: float = 0.0
var paseo_x: Vector2 = Vector2.ZERO
var paseo_ms: float = 0.0
var paseo_pausa: Vector2 = Vector2(1.0, 2.0)
var paseo_espera: float = 0.0





const HAIR_DIRECTIVO: int = 6
const HAIR_DIRECTIVO_ALT: int = 0







const CORTES_DIRECTIVO: Array[String] = ["p_corte_ejecutivo", "p_gentleman_raya_clasica",
	"p_ivy_league_peinado", "p_crew_cut_clasico", "p_cesar_clasico"]















func directivo_look(club_id: String = "", evitar: Dictionary = {}) -> Dictionary:
	var club: String = club_id
	if club.is_empty():
		club = String(team().get("id", ""))
	var look: Dictionary = Coach.look_de("directivo_" + club)
	var pelo: Color = KitRecolor.HAIR_COLORS[HAIR_DIRECTIVO]
	if evitar.get("hair") == pelo:
		pelo = KitRecolor.HAIR_COLORS[HAIR_DIRECTIVO_ALT]
	look["hair"] = pelo
	look["brows"] = KitRecolor.brow_for(pelo)
	look["modular_hair"] = CORTES_DIRECTIVO[
		absi(hash("directivo_" + club + "|corte")) % CORTES_DIRECTIVO.size()]
	return look
































const CARA_DEL_TECNICO: Dictionary = {
	"coach_out": "tristeza", "salida": "tristeza", "welcome": "alegria",
	"contract": "alegria", "refuerzo": "alegria", "captain_room": "alegria",
	"cup_room": "concentra", "derby_room": "concentra", "half_time": "concentra",
	"rival_board": "concentra",
}
var _coach_cara: CaraViva = null

func coach_sprite(pos: Vector3, alto: float = 1.8,
		look: Dictionary = {}, nombre: String = "", rival: bool = false,
		niv: int = -1) -> AnimatedSprite3D:
	var frames: SpriteFrames = player_frames(look, "south", COACH_IDLE_SHEET, true)
	if frames.get_frame_count("idle") == 0:
		return null
	coach_walk_frames(frames, look)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = alto / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(pos.x, feet_offset(spr.pixel_size, COACH_IDLE_ART), pos.z)
	viewport.add_child(spr)
	spr.play("idle")


	var cara: CaraViva = CaraViva.pon(spr)
	if cara != null:
		_coach_cara = cara
		cara.anima(CARA_DEL_TECNICO.get(get_script().resource_path.get_file().get_basename(), ""))
	if not nombre.is_empty():
		PlacaNombre.cuelga(spr, nombre, true, rival, niv)


	paseo_dt = spr
	paseo_y0 = spr.position.y
	_paseo_x = spr.position.x
	_paseo_wait = paseo_espera
	return spr


























func coach_walk_frames(frames: SpriteFrames, look: Dictionary = {}) -> void:
	for dir: String in ["south", "north"]:
		var hoja: String = Stadium.COACH_WALK_SHEET if dir == "south" \
				else Stadium.COACH_WALK_NORTH_SHEET
		var imgs: Array[Texture2D] = []
		var falta: bool = false
		for i in range(1, Stadium.COACH_WALK_FRAMES + 1):
			var path: String = "%s%02d.png" % [hoja, i]
			if not ResourceLoader.exists(path):
				falta = true
				break




			imgs.append(KitRecolor.apply(load(path), look))
		if falta:
			continue
		var anim: String = "walk_" + dir
		frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, Stadium.COACH_WALK_FPS)
		for tex in imgs:
			frames.add_frame(anim, tex)





func coach_walk_anim(dx: float) -> String:
	if paseo_dt == null or paseo_dt.sprite_frames == null:
		return ""
	var quiere: String = "walk_" + walk_dir_name(Vector3(dx, 0.0, 0.0))
	if quiere == "walk_east" or quiere == "walk_west":
		quiere = "walk_south"
	if paseo_dt.sprite_frames.has_animation(quiere):
		return quiere
	if paseo_dt.sprite_frames.has_animation("walk_south"):
		return "walk_south"
	return ""











func tick_paseo(delta: float) -> void:
	if paseo_dt == null or not is_instance_valid(paseo_dt):
		return



	var lamina: String = coach_walk_anim(_paseo_dir)
	var anda: bool = paseo_ms > 0.0 and paseo_x.y > paseo_x.x and not lamina.is_empty()
	if anda:
		if _paseo_wait > 0.0:
			_paseo_wait -= delta
		else:
			_paseo_x += _paseo_dir * paseo_ms * delta
			if _paseo_x <= paseo_x.x or _paseo_x >= paseo_x.y:



				_paseo_x = clampf(_paseo_x, paseo_x.x, paseo_x.y)
				_paseo_dir = - _paseo_dir
				_paseo_wait = rng.randf_range(paseo_pausa.x, paseo_pausa.y)
	var quieto: bool = _paseo_wait > 0.0 or not anda
	if anda:



		lamina = coach_walk_anim(_paseo_dir)
		var toca: String = "idle" if quieto else lamina
		if paseo_dt.animation != toca:
			paseo_dt.play(toca)



		paseo_dt.flip_h = _paseo_dir < 0.0
		paseo_dt.position.x = _paseo_x
	var gesto: Vector2 = _paseo_gesto(quieto)
	paseo_dt.position.x += gesto.x
	paseo_dt.position.y = paseo_y0 + gesto.y



func _paseo_gesto(_quieto: bool) -> Vector2:
	return Vector2.ZERO















const RUN_SHEET: String = "res://assets/sprites/anim/run_player_"
const RUN_FRAMES: int = 6
const RUN_FPS: float = 12.0








func add_run(spr: AnimatedSprite3D, kit: Dictionary = {}) -> bool:
	if spr == null or spr.sprite_frames == null:
		return false
	var cfg: Dictionary = kit
	if cfg.is_empty():
		cfg = GameState.team_custom.duplicate()
		for k in KitRecolor.TEAM_KEYS:
			cfg.erase(k)
		cfg.merge(GameState.player_kit(), true)









	if _espalda_puesta(spr) or espalda_toca(cfg):
		cfg = cfg.duplicate()
		cfg["num_lamina"] = true




	cfg = _cfg_con_escudo(cfg, false)
	var any: bool = false
	for d in ["south", "north", "east", "west"]:
		var anim: String = "run_" + d
		if spr.sprite_frames.has_animation(anim):
			continue
		var added: int = 0
		for i in range(1, RUN_FRAMES + 1):
			var path: String = "%s%s_%02d.png" % [RUN_SHEET, d, i]
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				spr.sprite_frames.add_animation(anim)
				spr.sprite_frames.set_animation_loop(anim, true)
				spr.sprite_frames.set_animation_speed(anim, RUN_FPS)
			spr.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
			added += 1
		if added > 0:




			espalda_registra(spr, anim, "%s%s_" % [RUN_SHEET, d], 1)
		any = any or added > 0
	return any









func run_play(spr: AnimatedSprite3D, dir: Vector3) -> void:
	if spr == null or spr.sprite_frames == null:
		return



	_walk_listo(spr)
	if Vector2(dir.x, dir.z).length_squared() < 0.0001:
		if spr.animation != "idle" and spr.sprite_frames.has_animation("idle"):
			spr.play("idle")
		return
	var face: String = walk_dir_name(dir, spr)
	var anim: String = "run_" + face
	if not spr.sprite_frames.has_animation(anim):
		anim = "walk_" + face
	if not spr.sprite_frames.has_animation(anim):
		anim = "idle"
	if spr.animation != anim and spr.sprite_frames.has_animation(anim):
		spr.play(anim)













const CARA_LLORA_DEL_ACTO: Dictionary = {"trophy": "llorar_alegria", "parade": "llorar_alegria"}
const CARA_LLORA_P: float = 0.5

const CARA_DEL_ACTO: Dictionary = {

	"trophy": "reir", "parade": "reir", "promotion": "reir", "first_goal": "reir",
	"celebracion": "reir", "vuelta": "reir", "juvenil_gol": "reir",

	"gala": "alegria", "club_gala": "alegria", "motm": "alegria", "ovacion": "alegria",
	"birthday": "alegria", "welcome": "alegria", "kit_reveal": "alegria", "contract": "alegria",
	"wc_callup": "alegria", "juvenil_debut": "alegria", "juvenil_contrato": "alegria",
	"juvenil_dorsal": "alegria", "juvenil_presentacion": "alegria", "estatua": "alegria",
	"legend_meet": "alegria", "balcon": "alegria", "barbacoa": "alegria", "foto_equipo": "alegria",
	"clase_baile": "alegria", "autografos": "alegria", "firma_fotos": "alegria", "encuentro_fan": "alegria",
	"firmas_grada": "alegria", "stadium_name": "alegria", "regreso": "alegria",

	"homenaje": "llorar_alegria", "last_home": "llorar_alegria", "adios": "llorar_alegria",
	"nat_retire": "llorar_alegria",

	"final_lost": "lamento", "relegation": "lamento", "runner_up": "tristeza",
	"juvenil_vendido": "tristeza", "salida": "tristeza", "last_afternoon": "tristeza",
	"focos_crisis": "tristeza",

	"injury": "dolor",

	"pitada": "rabia", "rival_board": "rabia", "enemy_return": "rabia", "al_rival": "rabia",
	"cara_a_cara": "rabia", "verdugo": "rabia", "pancarta": "rabia",

	"shootout": "concentra", "half_time": "concentra", "half_time_out": "concentra",
	"squad_talk": "concentra", "captain_room": "concentra", "pulse": "concentra",
	"cold_open": "concentra",
}












func make_player(kit: Dictionary = {}, facing: String = "south",
		sheet: String = "", own_kit: bool = false,
		pixel_size: float = 0.0) -> AnimatedSprite3D:
	player = AnimatedSprite3D.new()
	player.pixel_size = pixel_size if pixel_size > 0.0 \
			else PLAYER_HEIGHT_M / PLAYER_METRICS.x
	player.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	player.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	player.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD





	var cfg: Dictionary = player_cfg(kit, own_kit)
	if espalda_toca(cfg):
		cfg = cfg.duplicate()
		cfg["num_lamina"] = true
	player.sprite_frames = player_frames(cfg, facing, sheet, own_kit)
	player.position = Vector3(focus.x,
		feet_offset(player.pixel_size) - PLAYER_SINK, focus.z)
	player.play("idle")
	viewport.add_child(player)


	var cara_viva: CaraViva = CaraViva.pon(player)
	var acto_base: String = get_script().resource_path.get_file().get_basename()
	var cara_acto: String = String(CARA_DEL_ACTO.get(acto_base, ""))


	if CARA_LLORA_DEL_ACTO.has(acto_base) and (bool(data.get("llora", false)) or randf() < CARA_LLORA_P):
		cara_acto = String(CARA_LLORA_DEL_ACTO[acto_base])
	if cara_viva != null and not cara_acto.is_empty():
		cara_viva.anima(cara_acto)





	espalda_registra(player, "idle", player_prefix(facing, sheet), 0)
	espalda_vestir(player, cfg)
	return player












































func retrato_image(w: int, h: int, kit: Dictionary = {},
		alto_rel: float = 0.36) -> Image:
	var frames: SpriteFrames = player_frames(player_cfg(kit), "south")
	if frames == null or frames.get_frame_count("idle") <= 0:
		return null
	var tex: Texture2D = frames.get_frame_texture("idle", 0)
	if tex == null:
		return null
	var src: Image = tex.get_image()
	if src == null:
		return null
	if src.is_compressed():
		src.decompress()
	var used: Rect2i = src.get_used_rect()
	if used.size.y <= 0 or used.size.x <= 0:
		return null
	var alto: int = maxi(int(float(used.size.y) * alto_rel), 1)
	var ancho: int = int(float(alto) * float(w) / float(h))




	if ancho > used.size.x:
		ancho = used.size.x
		alto = maxi(int(float(ancho) * float(h) / float(w)), 1)
	ancho = maxi(ancho, 1)
	var region: Image = src.get_region(Rect2i(
		used.position.x +(used.size.x - ancho) / 2, used.position.y, ancho, alto))


	region.resize(w, h, Image.INTERPOLATE_NEAREST)
	return region


func make_jersey(cfg: Dictionary, number: int = 0,
		height_m: float = 1.05, y_m: float = 0.79) -> Sprite3D:
	var ape: String = String(cfg.get("apellido", "")).strip_edges()




	var con_lamina: bool = number > 0
	var spr: Sprite3D = Sprite3D.new()

	spr.texture = JerseyArt.texture(cfg, 0 if con_lamina else number)
	spr.pixel_size = height_m / float(JerseyArt.SIZE)
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.no_depth_test = true
	spr.render_priority = 1
	spr.position = Vector3(focus.x, y_m, focus.z)
	viewport.add_child(spr)
	if con_lamina:
		var pecho: Rect2 = Rect2(JerseyArt.BODY_X0, JerseyArt.BODY_Y0 + 5,
			JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1, 9)
		var rec: Dictionary = Espalda.receta_para(cfg, SceneFade.imagen(spr.texture),
			pecho)
		var lam: ImageTexture = Espalda.textura(ape, number, rec)
		if lam != null:
			Espalda.nodo_prenda(lam, spr,
				float(JerseyArt.BODY_X1 - JerseyArt.BODY_X0 - 1),
				float(JerseyArt.BODY_Y0 + JerseyArt.BODY_Y1 + 1) * 0.5, float(JerseyArt.SIZE))
	return spr











const CLAP_SHEET: String = "res://assets/sprites/anim/clap_player_south_"













const ESMOQUIN_SHEET: String = "res://assets/sprites/anim/gala_south_"
const ESMOQUIN_CLAP_SHEET: String = "res://assets/sprites/anim/gala_clap_south_"






func esmoquin_clap(frames: SpriteFrames, cfg: Dictionary) -> void:




	cfg = cfg.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	frames.add_animation("clap")
	frames.set_animation_loop("clap", true)


	frames.set_animation_speed("clap", 7.0)






	var rutas: Array = []
	for i in range(1, 4):
		var path: String = "%s%02d.png" % [ESMOQUIN_CLAP_SHEET, i]
		if ResourceLoader.exists(path):
			frames.add_frame("clap", KitRecolor.apply(load(path), cfg))
			rutas.append(path)
	if frames.get_frame_count("clap") == 0:
		frames.remove_animation("clap")




	elif frames.has_meta("cara_fuentes"):
		var fuentes: Dictionary =(frames.get_meta("cara_fuentes") as Dictionary).duplicate()
		fuentes["clap"] = rutas
		frames.set_meta("cara_fuentes", fuentes)















var _espaldas: Dictionary = {}




func espalda_toca(cfg: Dictionary) -> bool:












	if cfg.has("bib"):
		return false
	if int(cfg.get("number", 0)) <= 0:
		return false
	var ape: String = String(cfg.get("apellido", ""))
	if ape.strip_edges().is_empty():
		ape = Career.nombre_espalda()
	return not ape.strip_edges().is_empty()



func _espalda_puesta(spr: AnimatedSprite3D) -> bool:
	if spr == null or not _espaldas.has(spr):
		return false
	return (_espaldas[spr] as Dictionary)["lam"] != null






func espalda_registra(spr: AnimatedSprite3D, anim: String, prefijo: String,
		desde: int, paso: int = 1) -> void:
	if spr == null:
		return
	if not _espaldas.has(spr):
		_espaldas[spr] = {"lam": null, "pat": {}}
	(_espaldas[spr]["pat"] as Dictionary)[anim] = [prefijo, desde, maxi(paso, 1)]






func espalda_vestir(spr: AnimatedSprite3D, cfg: Dictionary) -> void:
	if spr == null or not _espaldas.has(spr):
		return
	var num: int = int(cfg.get("number", 0))
	if num <= 0:
		return
	var ape: String = String(cfg.get("apellido", ""))
	if ape.strip_edges().is_empty():
		ape = Career.nombre_espalda()
	if ape.strip_edges().is_empty():
		return



	var img: Image = null
	var caja: Rect2 = Rect2()
	var base: String = ""
	var fila: Dictionary = _espaldas[spr]
	var pat: Dictionary = fila["pat"]
	if spr.sprite_frames != null and pat.has("idle") \
			and spr.sprite_frames.get_frame_count("idle") > 0:
		var t: Texture2D = spr.sprite_frames.get_frame_texture("idle", 0)
		if t != null:
			img = t.get_image()
		base = _espalda_base(pat["idle"], 0)
		caja = Espalda.caja_fichero(base)









	if not cfg.has("bib"):
		var rec: Dictionary = Espalda.receta_para(cfg, img, caja)
		var tex: ImageTexture = Espalda.textura(ape, num, rec)
		if tex == null:
			return
		var lam: Sprite3D = Espalda.nodo(tex)
		viewport.add_child(lam)
		fila["lam"] = lam





	var rec_s: Dictionary = ShortNum.receta_para(cfg, img,
		ShortNum.caja_fichero(base))
	var tex_s: ImageTexture = ShortNum.textura(num, rec_s)
	if tex_s != null:
		var lam_s: Sprite3D = ShortNum.nodo(tex_s)
		viewport.add_child(lam_s)
		fila["shn"] = lam_s




























var _pechos: Dictionary = {}





const PECHO_ESCANEO_S: float = 0.25





const PECHO_POR_PASADA: int = 2
var _pecho_reloj: float = 0.0













func _cfg_con_escudo(cfg: Dictionary, own_kit: bool) -> Dictionary:
	if own_kit or cfg.has("crest_logo"):
		return cfg







	if not cfg.has("crest_fill") and not cfg.has("crest_flag"):
		return cfg




















	if cfg.has("crest_flag"):
		var pais: String = String(cfg["crest_flag"])
		var nat_key: String = CrestLogos.key_of({"id": pais, "is_nation": true})
		var nat_out: Dictionary = cfg.duplicate()
		nat_out["pecho_club"] = pais
		if not nat_key.is_empty() and CrestLogos.has(nat_key):
			nat_out["crest_logo"] = nat_key
		return nat_out
	var club: Dictionary = team()
	var id: String = String(cfg.get("club", ""))
	if not id.is_empty():
		club = Teams.by_id(id)
	if club.is_empty():
		return cfg
	var clave: String = CrestLogos.key_of(club)
	if clave.is_empty() or not CrestLogos.has(clave):








		var sin_pack: Dictionary = cfg.duplicate()
		sin_pack["pecho_club"] = String(club.get("id", ""))
		return sin_pack
	var out: Dictionary = cfg.duplicate()
	out["crest_logo"] = clave



	out["pecho_club"] = String(club.get("id", ""))
	return out








func pecho_cfg_a_mano(cfg: Dictionary, own_kit: bool = false) -> Dictionary:
	return _cfg_con_escudo(cfg, own_kit)






func pecho_marca_a_mano(frames: SpriteFrames, cfg: Dictionary,
		prefijo: String) -> void:
	if frames == null or not (cfg.has("crest_logo") or cfg.has("pecho_club")):
		return
	frames.set_meta("pecho_cfg", cfg)
	frames.set_meta("pecho_prefijo", prefijo)















func keeper_idle_frames(look: Dictionary, club: String = "") -> SpriteFrames:
	var cfg: Dictionary = look.duplicate()
	if not club.is_empty():
		cfg["club"] = club
	cfg = pecho_cfg_a_mano(cfg)
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)
	var any: bool = false
	for i in 4:
		var path: String = "res://assets/sprites/anim/idle_keeper_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			any = true
	if not any:
		return player_frames(KitRecolor.team_only(look), "south")
	pecho_marca_a_mano(frames, cfg, "res://assets/sprites/anim/idle_keeper_")
	return frames













const CARA_ESCANEO_S: float = 0.3
const CARA_EXTRAS_MAX: int = 24
var _cara_reloj: float = 0.0
var _cara_extras: int = 0
var _cara_rng := RandomNumberGenerator.new()




func animo_extras() -> String:
	var acto: String = get_script().resource_path.get_file().get_basename()
	if CARA_LLORA_DEL_ACTO.has(acto):
		return "titulo"
	var cara: String = String(CARA_DEL_ACTO.get(acto, ""))
	if cara in ["reir", "alegria", "llorar_alegria", "guino"]:
		return "buena"
	if cara in ["lamento", "tristeza", "llorar", "protesta", "rabia"]:
		return "mala"
	return "normal"


func _cara_scan(delta: float) -> void:
	if viewport == null or _cara_extras >= CARA_EXTRAS_MAX:
		return
	_cara_reloj -= delta
	if _cara_reloj > 0.0:
		return
	_cara_reloj = CARA_ESCANEO_S
	if _cara_extras == 0:
		_cara_rng.randomize()
	var animo: String = animo_extras()
	var pila: Array = [viewport]
	while not pila.is_empty() and _cara_extras < CARA_EXTRAS_MAX:
		var n: Node = pila.pop_back()
		for h in n.get_children():
			pila.append(h)
		var spr: AnimatedSprite3D = n as AnimatedSprite3D
		if spr == null or spr == player or spr.sprite_frames == null \
				or not spr.sprite_frames.has_meta("cara_fuentes") or CaraViva.de(spr) != null:
			continue
		var cara: CaraViva = CaraViva.pon(spr)
		if cara != null:
			cara.anima(Expresiones.de_bolsa(_animo_de(spr, animo), _cara_rng))
			_cara_extras += 1








func _animo_de(spr: AnimatedSprite3D, animo: String) -> String:
	if player == null or player.sprite_frames == null or animo == "normal":
		return animo
	var mio: String = String((player.sprite_frames.get_meta("look_cfg", {}) as Dictionary).get("crest_logo", ""))
	var suyo: String = String((spr.sprite_frames.get_meta("look_cfg", {}) as Dictionary).get("crest_logo", ""))
	if mio.is_empty() or suyo.is_empty() or mio == suyo:
		return animo
	return "buena" if animo == "mala" else "mala"



func _pecho_scan(delta: float) -> void:
	if viewport == null:
		return
	_pecho_reloj -= delta
	if _pecho_reloj > 0.0:
		return
	_pecho_reloj = PECHO_ESCANEO_S
	var vestidos: int = 0













	if is_instance_valid(player) and not _pechos.has(player) \
			and player.sprite_frames != null \
			and player.sprite_frames.has_meta("pecho_cfg") \
			and viewport.is_ancestor_of(player):
		_pecho_vestir(player)
		vestidos += 1
		if vestidos >= PECHO_POR_PASADA:
			return
	var pila: Array = [viewport]
	while not pila.is_empty():
		var nd: Node = pila.pop_back()
		for h in nd.get_children():
			pila.append(h)
		var spr: AnimatedSprite3D = nd as AnimatedSprite3D
		if spr == null or _pechos.has(spr) or spr.sprite_frames == null:
			continue
		if not spr.sprite_frames.has_meta("pecho_cfg"):
			continue
		_pecho_vestir(spr)
		vestidos += 1
		if vestidos >= PECHO_POR_PASADA:
			return





func _pecho_vestir(spr: AnimatedSprite3D) -> void:
	var cfg: Dictionary = spr.sprite_frames.get_meta("pecho_cfg", {})


	if not _espaldas.has(spr) or not (_espaldas[spr]["pat"] as Dictionary).has("idle"):
		espalda_registra(spr, "idle",
			String(spr.sprite_frames.get_meta("pecho_prefijo", "")), 0)



	if bool(cfg.get("num_lamina", false)) and not _espalda_puesta(spr):
		espalda_vestir(spr, cfg)

















	if cfg.has("bib"):
		_pechos[spr] = {}
		return





	var epoca: bool = bool(cfg.get("retro", false))
	var fila: Dictionary = {}



	var logo: Texture2D = CrestLogos.texture(String(cfg.get("crest_logo", "")), epoca) \
			if cfg.has("crest_logo") else null
	if logo != null:
		var esc: Sprite3D = Pecho.nodo(logo)
		viewport.add_child(esc)
		fila["esc"] = esc
	var club_id: String = String(cfg.get("pecho_club", ""))




	var marca: Texture2D = SponsorLogos.for_team(club_id, epoca) \
			if not cfg.has("crest_flag") else null
	if marca != null:
		var pat: Sprite3D = Pecho.nodo(Pecho.marca_para(marca, cfg, "pat"))
		viewport.add_child(pat)
		fila["pat"] = pat

	var fab_tex: Texture2D = KitBrands.for_team(club_id, epoca, int(cfg.get("kit_slot", 0)))
	if fab_tex != null:
		var fab: Sprite3D = Pecho.nodo(Pecho.marca_para(fab_tex, cfg, "fab"))
		viewport.add_child(fab)
		fila["fab"] = fab

	var cmp_tex: Texture2D = Pecho.campeon_textura(cfg, club_id)
	if cmp_tex != null:
		var cmp: Sprite3D = Pecho.nodo(cmp_tex)
		cmp.alpha_scissor_threshold = 0.12
		viewport.add_child(cmp)
		fila["cmp"] = cmp





	if bool(cfg.get("parche_lamina", false)):
		var man_tex: Texture2D = SleevePatch.textura(cfg)
		if man_tex != null:
			var man: Sprite3D = Pecho.nodo(man_tex)
			man.alpha_scissor_threshold = 0.12
			viewport.add_child(man)
			fila["man"] = man
	_pechos[spr] = fila





func _pecho_follow() -> void:
	if _pechos.is_empty() or cam == null:
		return
	for k in _pechos:
		if not is_instance_valid(k):
			continue
		var spr: AnimatedSprite3D = k as AnimatedSprite3D
		if spr == null:
			continue
		var fila: Dictionary = _pechos[k]
		if fila.is_empty():
			continue
		var r: Dictionary = {}


		var base: String = ""
		var entrada: Variant =(_espaldas.get(k, {}) as Dictionary).get("pat", {}) \
				.get(spr.animation)
		if entrada is Array:
			base = _espalda_base(entrada, spr.frame)
			r = Pecho.rects_base(base)




		var ps: float = spr.pixel_size * spr.scale.y
		var esc: Sprite3D = SceneFade.vivo(fila.get("esc")) as Sprite3D
		if is_instance_valid(esc):
			Pecho.seguir(esc, spr, r.get("esc", Rect2()), ps, vista_de(spr))
			_calca_alfa(esc, spr)
		var pat: Sprite3D = SceneFade.vivo(fila.get("pat")) as Sprite3D
		if is_instance_valid(pat):
			Pecho.seguir(pat, spr, r.get("pat", Rect2()), ps, vista_de(spr), Pecho.PAT_CRECE)
			_calca_alfa(pat, spr)
		var fab: Sprite3D = SceneFade.vivo(fila.get("fab")) as Sprite3D
		if is_instance_valid(fab):
			Pecho.seguir(fab, spr, r.get("fab", Rect2()), ps, vista_de(spr))
			_calca_alfa(fab, spr)
		var cmp: Sprite3D = SceneFade.vivo(fila.get("cmp")) as Sprite3D
		if is_instance_valid(cmp):
			Pecho.seguir(cmp, spr, r.get("cmp", Rect2()), ps, vista_de(spr))
			_calca_alfa(cmp, spr)





		var man: Sprite3D = SceneFade.vivo(fila.get("man")) as Sprite3D
		if is_instance_valid(man):
			var look: Variant = spr.sprite_frames.get_meta("look_cfg", {}) \
					if spr.sprite_frames != null else {}
			Pecho.seguir(man, spr,
				SleevePatch.rect_de(base, look if look is Dictionary else {}), ps, vista_de(spr))
			_calca_alfa(man, spr)












func _calca_alfa(lam: Sprite3D, duenio: SpriteBase3D) -> void:
	if not lam.visible:
		return
	var a: float = duenio.modulate.a
	lam.modulate.a = a


	if a <= 0.02:
		lam.visible = false



func _espalda_base(entrada: Array, i: int) -> String:
	var paso: int = int(entrada[2]) if entrada.size() > 2 else 1
	return "%s%02d" % [String(entrada[0]).get_file(), i * paso + int(entrada[1])]





func _espalda_follow() -> void:
	if _espaldas.is_empty() or cam == null:
		return
	for k in _espaldas:
		if not is_instance_valid(k):
			continue
		var spr: AnimatedSprite3D = k as AnimatedSprite3D
		if spr == null:
			continue
		var fila: Dictionary = _espaldas[k]
		var lam: Sprite3D = SceneFade.vivo(fila["lam"]) as Sprite3D
		var shn: Sprite3D = SceneFade.vivo(fila.get("shn")) as Sprite3D
		if not is_instance_valid(lam):
			continue





		if not spr.is_visible_in_tree():
			lam.visible = false
			if is_instance_valid(shn):
				shn.visible = false
			continue
		var pat: Dictionary = fila["pat"]
		var entrada: Variant = pat.get(spr.animation)
		if not (entrada is Array):
			lam.visible = false
			if is_instance_valid(shn):
				shn.visible = false
			continue
		var base: String = _espalda_base(entrada, spr.frame)

		Espalda.seguir(lam, spr, Espalda.caja_fichero(base),
			spr.pixel_size * spr.scale.y, vista_de(spr), Espalda.centro_fichero(base),
			Espalda.giro_fichero(base))
		_calca_alfa(lam, spr)


		if is_instance_valid(shn):
			ShortNum.seguir(shn, spr, ShortNum.caja_fichero(base),
				spr.pixel_size * spr.scale.y, vista_de(spr))
			_calca_alfa(shn, spr)






func player_cfg(kit: Dictionary = {}, own_kit: bool = false) -> Dictionary:
	var cfg: Dictionary = kit
	if cfg.is_empty() and not own_kit:
		cfg = GameState.team_custom.duplicate()
		for k in KitRecolor.TEAM_KEYS:
			cfg.erase(k)
		cfg.merge(GameState.player_kit(), true)
	if own_kit:
		cfg = cfg.duplicate()
		for k in KitRecolor.TEAM_KEYS:
			cfg.erase(k)
	return cfg





func player_prefix(facing: String = "south", sheet: String = "") -> String:
	return sheet if not sheet.is_empty() \
			else "res://assets/sprites/anim/idle_%s_" % facing


func player_frames(kit: Dictionary = {}, facing: String = "south",
		sheet: String = "", own_kit: bool = false) -> SpriteFrames:
	var cfg: Dictionary = kit




	if cfg.is_empty() and not own_kit:
		cfg = GameState.team_custom.duplicate()
		for k in KitRecolor.TEAM_KEYS:
			cfg.erase(k)
		cfg.merge(GameState.player_kit(), true)
	if own_kit:




		cfg = cfg.duplicate()
		for k in KitRecolor.TEAM_KEYS:
			cfg.erase(k)
	var prefix: String = sheet if not sheet.is_empty() \
			else "res://assets/sprites/anim/idle_%s_" % facing




	cfg = _cfg_con_escudo(cfg, own_kit)





	if not own_kit and espalda_toca(cfg):
		cfg = cfg.duplicate()
		cfg["num_lamina"] = true

















	if not own_kit and espalda_toca(cfg) and SleevePatch.textura(cfg) != null:
		cfg = cfg.duplicate()
		cfg["parche_lamina"] = true
	elif cfg.has("comp_parche"):
		cfg = cfg.duplicate()
		cfg.erase("comp_parche")
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)
	var fuentes: Array = []
	for i in 4:
		var path: String = "%s%02d.png" % [prefix, i]
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			fuentes.append(path)
	if frames.get_frame_count("idle") == 0:


		var base: String = "res://assets/sprites/players/player_south.png"
		if ResourceLoader.exists(base):
			frames.add_frame("idle", KitRecolor.apply(load(base), cfg))




	if cfg.has("crest_logo") or cfg.has("pecho_club") \
			or bool(cfg.get("num_lamina", false)) \
			or bool(cfg.get("parche_lamina", false)):
		frames.set_meta("pecho_cfg", cfg)
		frames.set_meta("pecho_prefijo", prefix)





	frames.set_meta("look_cfg", cfg)


	if not fuentes.is_empty():
		frames.set_meta("cara_fuentes", {"idle": fuentes})
	return frames
































const PEOPLE_MAX: int = 22















func squad_people(team_id: String, n: int, mine: bool = false,
		skip: String = "", skip_keeper: bool = false) -> Array:
	var out: Array = []
	var tope: int = clampi(n, 0, PEOPLE_MAX)
	var yo: String = String(Squad.user_slot(team_id).get("name", "")) if mine else ""
	for row in Squad.of(team_id):
		if out.size() >= tope:
			break
		var r: Dictionary = row
		if skip_keeper and String(r.get("pos", "")) == "POR":
			continue
		var nm: String = String(r.get("name", ""))
		if nm.is_empty() or nm == skip or (mine and nm == yo):
			continue
		out.append({"name": nm, "number": int(r.get("number", 0))})
	while out.size() < tope:
		out.append({"name": "", "number": 0, "idx": out.size()})
	return out









func person_look(person: Dictionary, base: Dictionary) -> Dictionary:
	var nm: String = String(person.get("name", ""))
	var cfg: Dictionary = KitRecolor.appearance_for(
		nm if not nm.is_empty() else "extra_%d" % int(person.get("idx", 0)),
		base)
	cfg["number"] = int(person.get("number", 0))




	if not nm.is_empty():
		cfg["apellido"] = Career.espalda_de(nm)
		_lentes_de_fiesta(cfg, nm)
	return cfg










const LENTES_FIESTA_ACTOS: Array[String] = ["trophy", "vuelta_honor", "parade", "balcon", "pena"]
const LENTES_FIESTA: Array[String] = ["p_lentes_blancos", "p_lentes_ambar"]
const LENTES_FIESTA_P: float = 0.25


func _lentes_de_fiesta(cfg: Dictionary, nm: String) -> void:
	if cfg.has("modular_face_acc") or get_script() == null:
		return
	var acto: String = get_script().resource_path.get_file().get_basename()
	if not LENTES_FIESTA_ACTOS.has(acto):
		return

	var r := RandomNumberGenerator.new()
	r.seed = hash(nm + "|lentes_fiesta")
	if r.randf() < LENTES_FIESTA_P:
		cfg["modular_face_acc"] = LENTES_FIESTA[r.randi() % LENTES_FIESTA.size()]










func people_frames_pool(people: Array, kit: Dictionary,
		facing: String = "south", sheet: String = "") -> Array[SpriteFrames]:
	var out: Array[SpriteFrames] = []
	var base: Dictionary = KitRecolor.team_only(kit)
	for persona in people:
		out.append(player_frames(person_look(persona, base), facing, sheet))
	return out





func squad_frames_pool(kit: Dictionary, n: int, team_id: String,
		facing: String = "south", mine: bool = false, skip: String = "",
		skip_keeper: bool = false, sheet: String = "") -> Array[SpriteFrames]:
	return people_frames_pool(
		squad_people(team_id, n, mine, skip, skip_keeper), kit, facing, sheet)





















const FESTEJO_GESTOS: Array = [
	{"anim": "puno", "hoja": "res://assets/sprites/anim/puno_south_",
		"desde": 1, "hasta": 6, "fps": 9.0},
	{"anim": "cielo", "hoja": "res://assets/sprites/anim/cielo_south_",
		"desde": 1, "hasta": 4, "fps": 7.0},
	{"anim": "aplauso", "hoja": "res://assets/sprites/anim/clap_player_south_",
		"desde": 0, "hasta": 3, "fps": 8.0},
]






static func plantel_festeja() -> bool:
	return OS.get_environment("FL_PLANTEL_FESTEJA") != "0"











func festejo_hornea(frames: SpriteFrames, k: int) -> String:
	if frames == null or not frames.has_meta("look_cfg"):
		return ""
	var receta: Dictionary = FESTEJO_GESTOS[posmod(k, FESTEJO_GESTOS.size())]
	var anim: String = String(receta["anim"])
	if frames.has_animation(anim):
		return anim
	var cfg: Dictionary = frames.get_meta("look_cfg", {})
	frames.add_animation(anim)
	frames.set_animation_loop(anim, true)
	frames.set_animation_speed(anim, float(receta["fps"]))
	for i in range(int(receta["desde"]), int(receta["hasta"]) + 1):
		var path: String = "%s%02d.png" % [String(receta["hoja"]), i]
		if ResourceLoader.exists(path):
			frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count(anim) == 0:
		frames.remove_animation(anim)
		return ""
	return anim












func festejo_play(spr: AnimatedSprite3D, anim: String) -> void:
	if spr == null or anim.is_empty() or spr.sprite_frames == null \
			or not spr.sprite_frames.has_animation(anim):
		return
	for receta in FESTEJO_GESTOS:
		if String(receta["anim"]) == anim:
			espalda_registra(spr, anim, String(receta["hoja"]), int(receta["desde"]))
			break
	spr.play(anim)
	spr.speed_scale = rng.randf_range(0.85, 1.25)
	var n: int = spr.sprite_frames.get_frame_count(anim)
	if n > 1:
		spr.frame = rng.randi_range(0, n - 1)























func extras_frames_pool(kit: Dictionary, n: int, seed_key: String,
		facing: String = "south") -> Array[SpriteFrames]:
	var out: Array[SpriteFrames] = []


	var team: Dictionary = KitRecolor.team_only(kit)
	for i in maxi(n, 1):
		var cfg: Dictionary = KitRecolor.appearance_for(
			"%s_%d" % [seed_key, i], team)
		out.append(player_frames(cfg, facing))
	return out



















static var _feet_memo: Dictionary = {}








static func feet_offset_px(path: String) -> float:
	path = KitRecolor.GALA_WEAR.base_path(path)
	if _feet_memo.has(path):
		return float(_feet_memo[path])
	var crudo: float = PLAYER_METRICS.y


	var img: Image = SceneFade.imagen(load(path)) if ResourceLoader.exists(path) else null
	if img != null:
		if img.is_compressed():
			img.decompress()
		var used: Rect2i = img.get_used_rect()
		if used.size.y > 0:
			var pad_bottom: float = float(img.get_height() - used.end.y)
			crudo = float(img.get_height()) * 0.5 - pad_bottom
	_feet_memo[path] = crudo
	return crudo


func feet_offset(pixel_size: float, path: String = "") -> float:
	return feet_offset_px(path if not path.is_empty() \
			else "res://assets/sprites/anim/idle_south_00.png") * pixel_size














































func make_trophy(icon_type: String, pos: Vector3, height_m: float = 1.15,
		px: int = 320, into: Node = null, once: bool = true,
		pad: float = 0.0, logo_type: String = "",
		country: String = "") -> Sprite3D:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(px, px)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE if once \
			else SubViewport.UPDATE_ALWAYS
	vp.disable_3d = true
	(into if into != null else self).add_child(vp)
	var icon: TrophyIcon = TrophyIcon.new()
	icon.set_anchors_preset(Control.PRESET_FULL_RECT)
	icon.custom_minimum_size = Vector2(px, px)
	if pad > 0.0:
		var m: float = float(px) * pad
		icon.offset_left = m
		icon.offset_top = m
		icon.offset_right = - m
		icon.offset_bottom = - m
		icon.custom_minimum_size = Vector2.ZERO
	icon.set_type(icon_type)



	if not logo_type.is_empty():
		icon.set_logo_type(logo_type)

	if not country.is_empty():
		icon.set_country(country)
	vp.add_child(icon)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = vp.get_texture()
	spr.pixel_size = height_m / float(px)
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = pos
	(into if into != null else viewport).add_child(spr)
	return spr


























func make_comp_logo(logo_type: String, col: Color, pos: Vector3,
		height_m: float = 1.0, flat: bool = false, px: int = 256) -> Sprite3D:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(px, px)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	vp.disable_3d = true
	add_child(vp)
	var logo: CompLogo = CompLogo.new()
	logo.set_anchors_preset(Control.PRESET_FULL_RECT)
	logo.custom_minimum_size = Vector2(px, px)
	logo.set_type(logo_type)
	logo.color = col
	vp.add_child(logo)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = vp.get_texture()
	spr.pixel_size = height_m / float(px)
	if not flat:
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = pos
	viewport.add_child(spr)
	return spr

















func crest_texture(crest_team: Dictionary, px: int = 256, once: bool = false) -> Texture2D:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(px, px)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE if once \
			else SubViewport.UPDATE_ALWAYS
	vp.disable_3d = true
	add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(px, px)
	crest.set_team(crest_team)
	vp.add_child(crest)
	return vp.get_texture()






















const TUNNEL_BACK_X: float = -40.4
const MOUTH_X: float = -36.6




const MOUTH_HALF_W: float = 2.1
const MOUTH_H: float = 3.15
const MOUTH_JAMB: float = 0.34







const MOUTH_DEPTH: float = 3.5
const MOUTH_DARK: Color = Color(0.028, 0.032, 0.04)





const MOUTH_IN_WALL: Color = Color(0.105, 0.112, 0.13)
const MOUTH_IN_FLOOR: Color = Color(0.15, 0.152, 0.16)


const MOUTH_LAMP: Color = Color(0.86, 0.8, 0.62)


const MOUTH_BASE_H: float = 0.34
const MOUTH_CAP_H: float = 0.1
const MOUTH_CAP_OUT: float = 0.09























func make_tunnel_mouth(at_z: float = CENTER_Z, open_back: bool = false,
		deco: Color = Color(0.0, 0.0, 0.0, 0.0)) -> void:
	var half: float = MOUTH_HALF_W
	var jamb: float = MOUTH_JAMB








	if stadium != null:
		stadium.drop_ad_segment_at(at_z)
	var wall: Color = stadium.front_wall_color() if stadium != null \
			else Color(0.22, 0.23, 0.26)



	var body: Color = wall.darkened(0.12)
	var length: float = TUNNEL_BACK_X - MOUTH_X
	var mid_x: float =(TUNNEL_BACK_X + MOUTH_X) * 0.5

	for s in [-1.0, 1.0]:
		_mouth_slab(Vector3(mid_x, MOUTH_H * 0.5, at_z + s *(half + jamb * 0.5)),
			Vector3(absf(length), MOUTH_H, jamb), body, true)
	_mouth_slab(Vector3(mid_x, MOUTH_H + jamb * 0.5, at_z),
		Vector3(absf(length), jamb,(half + jamb) * 2.0), body, true)


	for s in [-1.0, 1.0]:
		_mouth_slab(Vector3(mid_x, MOUTH_BASE_H * 0.5,
			at_z + s *(half + jamb * 0.5)),
			Vector3(absf(length), MOUTH_BASE_H, jamb + 0.05),
			body.darkened(0.34), true)


	_mouth_slab(Vector3(mid_x, MOUTH_H + jamb + MOUTH_CAP_H * 0.5, at_z),
		Vector3(absf(length), MOUTH_CAP_H,
			(half + jamb) * 2.0 + MOUTH_CAP_OUT * 2.0), wall.lightened(0.08), true)



	var in_x: float = MOUTH_X - MOUTH_DEPTH * 0.5
	if not open_back:
		_mouth_slab(Vector3(MOUTH_X - MOUTH_DEPTH, MOUTH_H * 0.5, at_z),
			Vector3(0.2, MOUTH_H, half * 2.0), MOUTH_DARK)
	for s in [-1.0, 1.0]:
		_mouth_slab(Vector3(in_x, MOUTH_H * 0.5, at_z + s *(half - 0.03)),
			Vector3(MOUTH_DEPTH, MOUTH_H, 0.06), MOUTH_IN_WALL)
	_mouth_slab(Vector3(in_x, 0.03, at_z),
		Vector3(MOUTH_DEPTH, 0.06, half * 2.0), MOUTH_IN_FLOOR)
	_mouth_slab(Vector3(in_x, MOUTH_H - 0.03, at_z),
		Vector3(MOUTH_DEPTH, 0.06, half * 2.0), MOUTH_IN_WALL.darkened(0.3))



	_mouth_slab(Vector3(in_x, MOUTH_H - 0.11, at_z),
		Vector3(MOUTH_DEPTH * 0.78, 0.07, 0.34), MOUTH_LAMP)


	_mouth_slab(Vector3(in_x, 0.07, at_z),
		Vector3(MOUTH_DEPTH * 0.7, 0.02, half * 1.1),
		MOUTH_IN_FLOOR.lightened(0.22))


	for s in [-1.0, 1.0]:
		_mouth_slab(Vector3(MOUTH_X, MOUTH_H * 0.5, at_z + s *(half + jamb * 0.5)),
			Vector3(0.5, MOUTH_H + jamb, jamb * 1.5), wall, true)
	_mouth_slab(Vector3(MOUTH_X, MOUTH_H + jamb * 0.5, at_z),
		Vector3(0.5, jamb * 1.5,(half + jamb) * 2.0), wall, true)







	var band: Color = deco if deco.a > 0.0 \
			else CareerTheme.accent_of(team()).darkened(0.25)




	for s in [-1.0, 1.0]:
		_mouth_slab(Vector3(in_x, 1.9, at_z + s *(half - 0.06)),
			Vector3(MOUTH_DEPTH, 0.2, 0.05), band)
	_mouth_slab(Vector3(MOUTH_X - 0.02, MOUTH_H + jamb * 1.55, at_z),
		Vector3(0.46, jamb * 0.8,(half + jamb) * 1.7), band, true)




	var crest: Sprite3D = Sprite3D.new()
	crest.texture = crest_texture(team())




	crest.pixel_size = 0.26 / 256.0
	crest.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	crest.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



	crest.rotation_degrees = Vector3(0.0, 90.0, 0.0)
	crest.position = Vector3(MOUTH_X + 0.23, MOUTH_H + jamb * 1.62, at_z)
	viewport.add_child(crest)
	_mouth_detail(at_z, in_x, half, jamb, band)
	preload("res://features/stadium/stadium_finish.gd").pasillo(viewport,
		MOUTH_X - MOUTH_DEPTH, MOUTH_X, at_z, half, MOUTH_H,
		stadium.div if stadium != null else 1)
	preload("res://features/stadium/tunnel_detail.gd").boca(viewport,
		MOUTH_X, TUNNEL_BACK_X, at_z, half, MOUTH_H, jamb, band,
		stadium.div if stadium != null else 1)
	preload("res://features/stadium/tunnel_detail.gd").pasillo(viewport,
		MOUTH_X - MOUTH_DEPTH, MOUTH_X, at_z, half, MOUTH_H,
		stadium.div if stadium != null else 1)
	_tunnel_wall_crests(MOUTH_X - 0.38, at_z, half, 0.62)



func _tunnel_wall_crests(at_x: float, at_z: float, half: float, size_m: float) -> void:
	var texture: Texture2D = crest_texture(team())
	for side in [-1.0, 1.0]:
		var badge: Sprite3D = Sprite3D.new()
		badge.name = "EscudoInteriorTunel"
		badge.texture = texture
		badge.pixel_size = size_m / float(texture.get_height())
		badge.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		badge.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		badge.shaded = false
		badge.rotation.y = PI if side > 0.0 else 0.0
		badge.position = Vector3(at_x, 1.48, at_z + side *(half - 0.11))
		viewport.add_child(badge)
		var title: Label3D = Label3D.new()

		title.text = team_name().to_upper()
		var year: int = int(team().get("founded", 0))
		if year > 0:
			title.text += " · " + str(year)
		title.font_size = 40
		title.pixel_size = minf(0.003, size_m * 1.5 / maxf(40.0, title.text.length() * 24.0))
		title.outline_size = 4
		title.position = Vector3(at_x, 0.82, at_z + side *(half - 0.12))
		title.rotation.y = badge.rotation.y
		viewport.add_child(title)
























const MOUTH_SILL_D: float = 0.34
const MOUTH_SILL_H: float = 0.05
const MOUTH_SILL: Color = Color(0.33, 0.345, 0.37)


const MOUTH_ZEBRA_H: float = 0.44
const MOUTH_ZEBRA: Color = Color(0.78, 0.72, 0.28)

const MOUTH_RAIL_Y: float = 1.02
const MOUTH_RAIL_T: float = 0.055
const MOUTH_RAIL: Color = Color(0.28, 0.3, 0.33)


const MOUTH_RIBS: int = 3
func _mouth_detail(at_z: float, in_x: float, half: float, jamb: float,
		band: Color) -> void:


	_mouth_slab(Vector3(MOUTH_X + MOUTH_SILL_D * 0.35, MOUTH_SILL_H * 0.5, at_z),
		Vector3(MOUTH_SILL_D, MOUTH_SILL_H,(half + jamb * 0.5) * 2.0),
		MOUTH_SILL, true)


	for s in [-1.0, 1.0]:
		for k in 2:
			_mouth_slab(Vector3(MOUTH_X + 0.01,
					MOUTH_ZEBRA_H *(0.32 + float(k) * 0.42),
					at_z + s *(half + jamb * 0.5)),
				Vector3(0.02, MOUTH_ZEBRA_H * 0.26, jamb * 0.92),
				MOUTH_ZEBRA, true)


	for s in [-1.0, 1.0]:
		var puerta_x: float = in_x + s * minf(0.65, MOUTH_DEPTH * 0.12)
		for tramo in [Vector2(in_x - MOUTH_DEPTH * 0.46, puerta_x - 0.5),
				Vector2(puerta_x + 0.5, in_x + MOUTH_DEPTH * 0.46)]:
			if tramo.y > tramo.x:
				_mouth_slab(Vector3((tramo.x + tramo.y) * 0.5, MOUTH_RAIL_Y, at_z + s *(half - 0.05)),
					Vector3(tramo.y - tramo.x, MOUTH_RAIL_T, MOUTH_RAIL_T), MOUTH_RAIL)



	for r in MOUTH_RIBS:
		var f: float =(float(r) + 0.5) / float(MOUTH_RIBS)
		_mouth_slab(Vector3(MOUTH_X - MOUTH_DEPTH * f, MOUTH_H - 0.16, at_z),
			Vector3(0.07, 0.1,(half - 0.05) * 2.0), band)


func _mouth_slab(pos: Vector3, size: Vector3, col: Color,
		lit: bool = false) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	m.mesh = box
	var mat: StandardMaterial3D = StandardMaterial3D.new()







	if lit:
		mat.roughness = 0.95
		preload("res://features/stadium/stadium_finish.gd").acabado(mat, "concreto",
			stadium.div if stadium != null else 1)
		mat.uv1_scale = Vector3(maxf(size.x / 2.0, 1.0), maxf(size.y / 2.0, 1.0), 1.0)
	else:
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	m.material_override = mat
	m.position = pos
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON if lit \
			else GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(m)
	return m






func make_beam(from: Vector3, to: Vector3, top_r: float, bottom_r: float,
		col: Color, alpha: float = 0.05) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = top_r
	cyl.bottom_radius = bottom_r
	cyl.height = from.distance_to(to)
	cyl.radial_segments = 12
	m.mesh = cyl
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.albedo_color = Color(col.r, col.g, col.b, alpha)
	m.material_override = mat
	m.position =(from + to) * 0.5

	var dir: Vector3 =(to - from).normalized()
	var axis: Vector3 = Vector3.UP.cross(dir)
	if axis.length() > 0.0001:
		m.rotate(axis.normalized(), Vector3.UP.angle_to(dir))
	viewport.add_child(m)
	return m














const BOARD_SIZE: Vector2 = Vector2(7.2, 3.4)
const BOARD_BACK: float = 1.7





const BOARD_COLS: int = 17







const BOARD_ROWS: int = 15




const BOARD_TILE: Vector2i = Vector2i(64, 32)










const BOARD_LOGO: Vector2i = Vector2i(48, 20)




const MIC_H: float = 0.62







func make_press_board(at: Vector3, back: float = BOARD_BACK) -> MeshInstance3D:
	var quad: MeshInstance3D = MeshInstance3D.new()
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = BOARD_SIZE
	quad.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = press_board_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	quad.material_override = mat
	quad.position = Vector3(at.x, BOARD_SIZE.y * 0.5, at.z - back)
	viewport.add_child(quad)


	var frame: MeshInstance3D = MeshInstance3D.new()
	var fmesh: QuadMesh = QuadMesh.new()
	fmesh.size = BOARD_SIZE + Vector2(0.16, 0.16)
	frame.mesh = fmesh
	var fmat: StandardMaterial3D = StandardMaterial3D.new()
	fmat.albedo_color = accent.darkened(0.55)
	fmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	frame.material_override = fmat
	frame.position = quad.position + Vector3(0.0, 0.0, -0.02)
	viewport.add_child(frame)
	return quad

















func press_board_texture() -> ImageTexture:





	var img: Image = Image.create(BOARD_COLS * BOARD_TILE.x,
		BOARD_ROWS * BOARD_TILE.y, false, Image.FORMAT_RGBA8)
	img.fill(Color(0.94, 0.94, 0.95))
	var t: Dictionary = team()

	var club: String = team_name().to_upper()




	var patro_tex: Texture2D = SponsorLogos.for_team(String(t.get("id", "")))



	var patro_id: String = KitDeals.sponsor_of(String(t.get("id", "")))
	var patro: String = SponsorLogos.name_of(patro_id).to_upper()
	if patro.is_empty():
		patro = patro_id.to_upper()
	if patro.is_empty():
		var list: Array = Stadium.sponsors_for(String(t.get("country", "")),
			div() >= 3)
		if not list.is_empty():
			patro = String(list[0][0])




	var crest_tex: Texture2D = CrestLogos.texture(CrestLogos.key_of(t))




	var comp_id: String = String(data.get("logo", ""))
	if comp_id.is_empty():
		comp_id = Competitions.logo_type_of(data)
	var comp_tex: Texture2D = CompLogos.texture(comp_id)
	var comp: String = Competitions.name_of(data).to_upper()





	var tinte: Dictionary = {}
	for r in BOARD_ROWS:
		for c in BOARD_COLS:




			var negativo: bool =(r + c) % 2 == 1
			var bg: Color = Color(0.99, 0.99, 1.0) if negativo else accent
			var fg: Color = accent if negativo else CareerTheme.TEXT
			var name: String = club
			var tex: Texture2D = crest_tex






			var tenir: bool = false
			match (r + c) % 3:
				1:
					name = patro
					tex = patro_tex
					tenir = true
				2:
					name = comp
					tex = comp_tex
			var logo: Image = null
			if tex != null:
				logo = _board_logo(tex, bg, tenir, tinte)
			_board_tile(img, c * BOARD_TILE.x, r * BOARD_TILE.y, name, bg, fg, logo)
	return ImageTexture.create_from_image(img)









func _board_logo(tex: Texture2D, fondo: Color, tenir: bool,
		cache: Dictionary) -> Image:
	var id: String = tex.resource_path if tex.resource_path != "" \
			else str(tex.get_instance_id())
	var llave: String = id + "|" + fondo.to_html(false) +("|t" if tenir else "")
	if cache.has(llave):
		return cache[llave]
	var out: Image = null
	var src_tex: Texture2D = tex
	if tenir:
		src_tex = Pecho.marca_para(tex, {"kit": fondo})
	if src_tex != null:
		var src: Image = src_tex.get_image()
		if src != null:
			var w: int = src.get_width()
			var h: int = src.get_height()
			if w > 0 and h > 0:



				var k: float = minf(float(BOARD_LOGO.x) / float(w),
					float(BOARD_LOGO.y) / float(h))
				var copia: Image = src.duplicate()
				copia.resize(maxi(1, int(round(float(w) * k))),
					maxi(1, int(round(float(h) * k))), Image.INTERPOLATE_LANCZOS)
				if copia.get_format() != Image.FORMAT_RGBA8:
					copia.convert(Image.FORMAT_RGBA8)
				out = copia
	cache[llave] = out
	return out



func _board_tile(img: Image, x0: int, y0: int, text: String, bg: Color,
		fg: Color, logo: Image = null) -> void:
	var pad_x: int = 3
	var pad_y: int = 2
	for y in range(pad_y, BOARD_TILE.y - pad_y):
		for x in range(pad_x, BOARD_TILE.x - pad_x):
			img.set_pixel(x0 + x, y0 + y, bg)




	if logo != null:
		var dw: int = logo.get_width()
		var dh: int = logo.get_height()
		img.blend_rect(logo, Rect2i(0, 0, dw, dh),
			Vector2i(x0 +(BOARD_TILE.x - dw) / 2, y0 +(BOARD_TILE.y - dh) / 2))
		return

	var inner: int = BOARD_TILE.x - pad_x * 2 - 4
	var px: int = 3
	while px > 1 and PixelText.text_width(text, px) > inner:
		px -= 1



	text = _fit_words(text, inner, px)
	PixelText.draw_text(img, x0 +(BOARD_TILE.x - PixelText.text_width(text, px)) / 2,
		y0 +(BOARD_TILE.y - PixelText.GLYPH_H * px) / 2, text, fg, px)




func _fit_words(text: String, inner: int, px: int) -> String:
	if PixelText.text_width(text, px) <= inner:
		return text
	var words: PackedStringArray = text.split(" ", false)
	var out: String = ""
	for w in words:
		var cand: String = w if out.is_empty() else out + " " + w
		if PixelText.text_width(cand, px) > inner:
			break
		out = cand
	if not out.is_empty():
		return out
	var cut: String = text
	while cut.length() > 1 and PixelText.text_width(cut, px) > inner:
		cut = cut.substr(0, cut.length() - 1)
	return cut













func make_mic(pos: Vector3) -> Sprite3D:
	var w: int = 24
	var h: int = 64
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))




	var foam: Color = Color(0.13, 0.14, 0.17)
	var dark: Color = Color(0.08, 0.09, 0.11)

	for y in range(0, 22):
		for x in range(2, w - 2):
			var edge: bool = x < 4 or x >= w - 4 or y < 2 or y >= 20
			img.set_pixel(x, y, foam.darkened(0.35) if edge else foam)


	for x in range(4, w - 4):
		img.set_pixel(x, 18, accent)
		img.set_pixel(x, 19, accent.darkened(0.25))
	PixelText.draw_text(img,(w - PixelText.text_width("TV", 2)) / 2, 6, "TV",
		Color(0.97, 0.97, 1.0), 2)


	for y in range(22, h):
		for x in range(w / 2 - 2, w / 2 + 2):
			img.set_pixel(x, y, dark if x < w / 2 + 1 else dark.lightened(0.18))
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = MIC_H / float(h)
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.position = pos
	viewport.add_child(spr)



	var foot: float = pos.y - MIC_H * 0.5
	var pole: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = 0.018
	cyl.bottom_radius = 0.026
	cyl.height = maxf(foot, 0.05)
	cyl.radial_segments = 10
	pole.mesh = cyl
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.09, 0.1, 0.12)
	mat.roughness = 0.7
	pole.material_override = mat
	pole.position = Vector3(pos.x, foot * 0.5, pos.z)
	viewport.add_child(pole)
	var base: MeshInstance3D = MeshInstance3D.new()
	var disc: CylinderMesh = CylinderMesh.new()
	disc.top_radius = 0.16
	disc.bottom_radius = 0.22
	disc.height = 0.05
	disc.radial_segments = 14
	base.mesh = disc
	base.material_override = mat
	base.position = Vector3(pos.x, 0.025, pos.z)
	viewport.add_child(base)
	return spr






func press_flash_pool(at: Vector3, n: int = 24) -> Array[Vector3]:
	var out: Array[Vector3] = []
	for i in n:
		var side: float = 1.0 if rng.randf() < 0.5 else -1.0
		out.append(Vector3(
			at.x + side * rng.randf_range(0.9, 2.4),
			rng.randf_range(0.6, 1.2),
			at.z + rng.randf_range(1.4, 3.2)))
	return out







func shake(amp: float, dur: float = 0.3) -> void:
	_shake_amp = amp
	_shake_dur = maxf(dur, 0.001)
	_shake_left = _shake_dur




func punch_fov(deg: float, back: float = 0.3) -> void:
	_fov_punch = deg
	var tw: Tween = create_tween()
	tw.tween_method(func(v: float) -> void: _fov_punch = v, deg, 0.0, back) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)





func screen_flash(dur: float = 0.16) -> void:
	_white_dur = maxf(dur, 0.001)
	_white = _white_dur


func _tick_punch(delta: float) -> void:
	if _shake_left > 0.0:
		_shake_left = maxf(_shake_left - delta, 0.0)
	if _white > 0.0:
		_white = maxf(_white - delta, 0.0)
		_fx_layer.queue_redraw()




func make_audio(attendance: float, chant: bool = false) -> MatchAudio:
	audio = MatchAudio.new()
	audio.div = div()
	audio.attendance = clampf(attendance, 0.0, 1.0)
	add_child(audio)
	if chant:
		audio.set_chant(true)
	return audio































const MURMUR_DB: float = -21.0








const SHOWER_DB: float = -24.0
const COACH_DB: Vector2 = Vector2(-31.0, -26.0)
const STEP_DB: Vector2 = Vector2(-26.0, -17.0)


func make_locker_audio(murmullo: bool = true, far_db: float = -26.0) -> Node:
	var host: Node = Node.new()
	add_child(host)
	if murmullo:
		locker_murmur = _loop_player(host, "locker_murmur", MURMUR_DB)
	locker_far = _loop_player(host, "locker_far_crowd", far_db)


	locker_shower = _loop_player(host, "locker_shower", SHOWER_DB)



	locker_audio = host
	return host









func locker_murmur_fade(dur: float) -> void:
	locker_murmur_to(-60.0, dur)





func locker_murmur_to(db: float, dur: float) -> void:
	_db_to(locker_murmur, db, dur)






func locker_far_to(db: float, dur: float) -> void:
	_db_to(locker_far, db, dur)









func _db_to(p: AudioStreamPlayer, db: float, dur: float) -> void:
	if p == null or not is_instance_valid(p):
		return
	if dur <= 0.0:
		p.volume_db = db
		return
	var tw: Tween = create_tween()
	tw.tween_property(p, "volume_db", db, maxf(dur, 0.05)) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)




const LOOP_FADE_IN: float = 0.9

func _loop_player(host: Node, id: String, db: float) -> AudioStreamPlayer:
	var stream: AudioStream = AudioBank.stream(id)
	if stream == null:
		push_warning("Ceremony: el bucle '%s' no existe en AudioSynth" % id)
		return null
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.stream = stream





	p.volume_db = -60.0
	p.bus = "Stadium" if AudioServer.get_bus_index("Stadium") >= 0 else "SFX"
	host.add_child(p)
	p.play()
	var tw: Tween = p.create_tween()
	tw.tween_property(p, "volume_db", db, LOOP_FADE_IN)
	return p










func locker_step(db: float = NAN) -> void:
	if locker_audio == null or not is_instance_valid(locker_audio):
		return
	var stream: AudioStream = AudioBank.stream("studs_tick")
	if stream == null:
		return
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.stream = stream
	p.volume_db = rng.randf_range(STEP_DB.x, STEP_DB.y) if is_nan(db) else db
	p.pitch_scale = rng.randf_range(0.86, 1.18)
	p.bus = "Stadium" if AudioServer.get_bus_index("Stadium") >= 0 else "SFX"
	locker_audio.add_child(p)
	p.finished.connect(p.queue_free)
	p.play()










func coach_talk() -> void:

	if _coach_cara != null and is_instance_valid(_coach_cara):
		_coach_cara.habla(true)




		SceneFade.timer(0.35).timeout.connect(_coach_calla)
	var id: String = ["coach_talk_a", "coach_talk_b", "coach_talk_c"][rng.randi() % 3]
	var stream: AudioStream = AudioBank.stream(id)
	if stream == null:
		return
	var p: AudioStreamPlayer = AudioStreamPlayer.new()









	p.stream = stream
	p.volume_db = rng.randf_range(COACH_DB.x, COACH_DB.y)
	p.pitch_scale = rng.randf_range(0.88, 1.12)
	p.bus = "Stadium" if AudioServer.get_bus_index("Stadium") >= 0 else "SFX"
	add_child(p)
	p.finished.connect(p.queue_free)
	p.play()




func _coach_calla() -> void:
	if _coach_cara != null and is_instance_valid(_coach_cara):
		_coach_cara.habla(false)






const DOOR_DB: float = -14.0


func locker_door() -> void:
	if locker_audio == null or not is_instance_valid(locker_audio):
		return
	var stream: AudioStream = AudioBank.stream("door_clack")
	if stream == null:
		return
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.stream = stream
	p.volume_db = DOOR_DB
	p.pitch_scale = rng.randf_range(0.94, 1.06)
	p.bus = "Stadium" if AudioServer.get_bus_index("Stadium") >= 0 else "SFX"
	locker_audio.add_child(p)
	p.finished.connect(p.queue_free)
	p.play()





func ovation(db: float = 0.0) -> void:
	if audio != null:



		audio.ovation(db)




	Music.duck(clampf(-8.0 - db, -14.0, -5.0), 0.5, 1.4)










func applause(on: bool = true, db: float = -11.0) -> void:
	if audio != null:
		audio.set_applause(on, db)


	if on:
		Music.duck(-7.0, 0.4, 1.2)









func locker_shower_off() -> void:
	sting("shower_off", -13.0)
	_db_to(locker_shower, -60.0, AudioSynth.SHOWER_OFF_TAIL)





























const CUES_BASE: PackedStringArray = ["fanfare"]






func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray()




func _precalienta_cues() -> void:
	var ids: PackedStringArray = _cues_del_acto()
	if not embedded:
		ids.append_array(CUES_BASE)
	for id in ids:
		AudioBank.stream(id)











func sting(id: String, db: float = -6.0) -> void:
	var stream: AudioStream = AudioBank.stream(id)
	if stream == null:
		push_warning("Ceremony.sting: el cue '%s' no existe en AudioSynth" % id)
		return
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.stream = stream
	p.volume_db = db
	p.bus = "SFX"
	add_child(p)
	p.finished.connect(p.queue_free)
	p.play()






func stand_flash_pool(z_center: float = CENTER_Z, spread: float = 40.0) -> Array[Vector3]:
	var out: Array[Vector3] = []
	for i in 180:
		var side: float = 1.0 if rng.randf() < 0.5 else -1.0
		var depth: float = rng.randf_range(2.4, 9.0)
		out.append(Vector3(side *(Stadium.SIDE_STAND_X + depth),
			1.0 +(depth - 1.5) * 1.6 + 0.85,
			z_center + rng.randf_range(- spread, spread)))
	return out







const CAM_CHANNELS: Array[String] = ["dist", "h", "yaw", "aim_y", "fov",
	"focus_x", "focus_z"]


















func _tick_camera() -> void:
	if cam == null or cam_keys.is_empty():
		return
	var last: Dictionary = cam_keys[cam_keys.size() - 1]
	if t >= float(last["t"]):
		var drift: Dictionary = last.duplicate()
		drift["yaw"] = float(last["yaw"]) +(t - float(last["t"])) * orbit_speed
		_apply_cam(drift)
		return
	for i in range(cam_keys.size() - 1):
		if t > float(cam_keys[i + 1]["t"]):
			continue
		var span: float = maxf(float(cam_keys[i + 1]["t"])
			- float(cam_keys[i]["t"]), 0.001)
		var k: float = clampf((t - float(cam_keys[i]["t"])) / span, 0.0, 1.0)


		var k2: float = k * k
		var k3: float = k2 * k
		var h00: float = 2.0 * k3 - 3.0 * k2 + 1.0
		var h10: float = k3 - 2.0 * k2 + k
		var h01: float = -2.0 * k3 + 3.0 * k2
		var h11: float = k3 - k2
		var out: Dictionary = {}
		for c: String in CAM_CHANNELS:
			out[c] = h00 * _cam_val(i, c) + h10 * span * _cam_tangent(i, c) \
					+ h01 * _cam_val(i + 1, c) + h11 * span * _cam_tangent(i + 1, c)
		_apply_cam(out)
		return




func _cam_val(i: int, c: String) -> float:
	var key: Dictionary = cam_keys[i]
	if key.has(c):
		return float(key[c])
	if c == "focus_x":
		return focus.x
	if c == "focus_z":
		return focus.z
	return 0.0








func _cam_tangent(i: int, c: String) -> float:
	var n: int = cam_keys.size()
	if i <= 0:
		return 0.0
	if i >= n - 1:
		return orbit_speed if c == "yaw" else 0.0
	var dt_prev: float = maxf(float(cam_keys[i]["t"])
		- float(cam_keys[i - 1]["t"]), 0.001)
	var dt_next: float = maxf(float(cam_keys[i + 1]["t"])
		- float(cam_keys[i]["t"]), 0.001)
	var s_prev: float =(_cam_val(i, c) - _cam_val(i - 1, c)) / dt_prev
	var s_next: float =(_cam_val(i + 1, c) - _cam_val(i, c)) / dt_next


	if s_prev * s_next <= 0.0:
		return 0.0


	var w1: float = 2.0 * dt_next + dt_prev
	var w2: float = dt_next + 2.0 * dt_prev
	return (w1 + w2) /(w1 / s_prev + w2 / s_next)


func _apply_cam(key: Dictionary) -> void:
	var yaw: float = deg_to_rad(float(key["yaw"]))
	var dist: float = float(key["dist"])


	var fx: float = float(key.get("focus_x", focus.x))
	var fz: float = float(key.get("focus_z", focus.z))
	var pos: Vector3 = Vector3(fx + sin(yaw) * dist, float(key["h"]),
		fz - cos(yaw) * dist)
	var aim: Vector3 = Vector3(fx, float(key["aim_y"]), fz)
	if _shake_left > 0.0:


		var k: float = _shake_left / _shake_dur
		var off: Vector3 = Vector3(rng.randf_range(-1.0, 1.0),
			rng.randf_range(-1.0, 1.0), rng.randf_range(-1.0, 1.0)) * _shake_amp * k * k
		pos += off
		aim += off
	var f: float = maxf(float(key["fov"]) - _fov_punch, 5.0)
	if world_band < 0.999:





		f = rad_to_deg(2.0 * atan(tan(deg_to_rad(f) * 0.5) * world_band))
	cam.fov = maxf(f, 3.0)
	cam.look_at_from_position(pos, aim)




func _build_fx_layer() -> void:
	_fx_layer = Control.new()
	_fx_layer.set_anchors_preset(Control.PRESET_FULL_RECT)
	_fx_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_fx_layer.draw.connect(_draw_fx)
	add_child(_fx_layer)


func _tick_flashes(delta: float) -> void:
	if flash_rate <= 0.0 or flash_pool.is_empty():


		_camara_rate = 0.0
		_tick_camaras()




		if not _flashes.is_empty():
			_flashes.clear()
			_fx_layer.queue_redraw()
		return
	_tick_camaras()
	for f in _flashes:
		f["t"] += delta
	_flashes = _flashes.filter(func(f: Dictionary) -> bool: return f["t"] < FLASH_LIFE)
	var rate: float = flash_rate
	if flash_burst_at >= 0.0:
		var since: float = t - flash_burst_at
		if since >= 0.0 and since < flash_burst_dur:
			rate *= lerpf(flash_burst_mult, 1.0, since / flash_burst_dur)
	_flash_acc += rate * delta
	while _flash_acc >= 1.0 and _flashes.size() < FLASH_MAX:
		_flash_acc -= 1.0
		_flashes.append({"pos": flash_pool[rng.randi() % flash_pool.size()], "t": 0.0})
	_flash_acc = minf(_flash_acc, 4.0)
	_camara_rate = rate
	_fx_layer.queue_redraw()
















const CAM_RATE_MIN: float = 1.5
const CAM_RATE_FULL: float = 14.0
const CAM_DB: Vector2 = Vector2(-26.0, -13.0)

var _camara: AudioStreamPlayer = null
var _camara_rate: float = 0.0


func _tick_camaras() -> void:
	if _camara_rate < CAM_RATE_MIN and (_camara == null or not is_instance_valid(_camara)):


		return
	if _camara == null or not is_instance_valid(_camara):
		var st: AudioStream = AudioBank.stream("camera_storm")
		if st == null:
			return
		_camara = AudioStreamPlayer.new()
		_camara.stream = st
		_camara.volume_db = -60.0


		_camara.bus = "SFX"
		add_child(_camara)
		_camara.play()
	if _camara_rate < CAM_RATE_MIN:
		if _camara.playing:
			_camara.volume_db = -60.0
		return
	var f: float = clampf((_camara_rate - CAM_RATE_MIN) \
			/ maxf(CAM_RATE_FULL - CAM_RATE_MIN, 0.01), 0.0, 1.0)



	_camara.volume_db = lerpf(CAM_DB.x, CAM_DB.y, f)




func set_confetti(on: bool) -> void:
	_confetti_on = on
	if on and _confetti.is_empty():
		for i in maxi(confetti_count, 1):
			_confetti.append(_new_confetti(rng.randf_range(-1.2, 0.0)))


func _new_confetti(y_frac: float) -> Dictionary:
	var cols: Array[Color] = confetti_colors if not confetti_colors.is_empty() \
			else ([accent, CareerTheme.MONEY, Color.WHITE] as Array[Color])
	return {
		"x": rng.randf(),
		"y": y_frac,
		"vy": rng.randf_range(CONFETTI_FALL.x, CONFETTI_FALL.y),
		"sway": rng.randf_range(0.6, 2.2),
		"phase": rng.randf_range(0.0, TAU),
		"w": rng.randf_range(CONFETTI_SIZE.x, CONFETTI_SIZE.y),
		"col": cols[rng.randi() % cols.size()],
		"spin": rng.randf_range(1.5, 5.0),
	}


func _tick_confetti(delta: float) -> void:
	if not _confetti_on:
		return
	var h: float = maxf(size.y, 1.0)
	for c in _confetti:
		c["y"] += c["vy"] * delta / h
		if c["y"] > 1.15:


			var fresh: Dictionary = _new_confetti(rng.randf_range(-0.3, -0.05))
			for k in fresh:
				c[k] = fresh[k]
	_fx_layer.queue_redraw()


func _draw_fx() -> void:

	if _confetti_on:
		for c in _confetti:
			var y: float = float(c["y"]) * size.y
			if y < -20.0 or y > size.y + 20.0:
				continue
			var sway: float = sin(float(c["phase"]) + t * float(c["sway"])) * 26.0
			var x: float = float(c["x"]) * size.x + sway

			var w: float = float(c["w"]) * absf(cos(t * float(c["spin"]) + float(c["phase"])))
			_fx_layer.draw_rect(Rect2(x, y, maxf(w, 1.5), float(c["w"]) * 0.55),
				c["col"])
	if flash_rate <= 0.0 or cam == null or not cam.is_inside_tree():
		_draw_white()
		return
	for f in _flashes:
		var p3: Vector3 = f["pos"]
		if cam.is_position_behind(p3):
			continue
		var p: Vector2 = _flash_en_pantalla(cam.unproject_position(p3))

		var k: float = 1.0 - float(f["t"]) / FLASH_LIFE
		_draw_flash(f, p, k)
	_draw_white()





func _draw_flash(_f: Dictionary, p: Vector2, k: float) -> void:
	var a: float = k * k
	_fx_layer.draw_circle(p, flash_radius *(0.6 + 0.4 * k), Color(1, 1, 1, a))
	_fx_layer.draw_circle(p, flash_radius * 2.2, Color(1, 0.97, 0.88, a * 0.28))






func _flash_en_pantalla(p: Vector2) -> Vector2:
	if viewport_box == null:
		return p
	return p + viewport_box.position





func _draw_white() -> void:
	if _white <= 0.0:
		return
	var k: float = _white / _white_dur
	_fx_layer.draw_rect(Rect2(Vector2.ZERO, size), Color(1, 1, 1, k * k * 0.85))






const SCRIM_OFFSETS: Array = [0.0, 0.18, 0.46, 0.72, 1.0]
const SCRIM_ALPHAS: Array = [0.8, 0.34, 0.02, 0.42, 0.92]
const SCRIM_TINT: Color = Color(0.02, 0.03, 0.06, 1.0)




func _build_scrim() -> void:
	_scrim_grad = Gradient.new()
	_scrim_grad.offsets = PackedFloat32Array(SCRIM_OFFSETS)
	_aplica_scrim(1.0)
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = _scrim_grad
	tex.fill_from = Vector2(0.0, 0.0)
	tex.fill_to = Vector2(0.0, 1.0)
	var scrim: TextureRect = TextureRect.new()
	scrim.texture = tex
	scrim.stretch_mode = TextureRect.STRETCH_SCALE
	scrim.set_anchors_preset(Control.PRESET_FULL_RECT)
	scrim.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(scrim)











func scrim_dim(mult: float) -> void:
	if _scrim_grad == null:
		return
	_aplica_scrim(clampf(mult, 0.0, 1.0))


func _aplica_scrim(mult: float) -> void:
	var cols: PackedColorArray = PackedColorArray()
	for a in SCRIM_ALPHAS:
		cols.append(Color(SCRIM_TINT.r, SCRIM_TINT.g, SCRIM_TINT.b, a * mult))
	_scrim_grad.colors = cols









func _build_skip() -> void:
	var firme: bool = _salto_firme()
	if firme and not replay:
		return
	var skip: Button = Button.new()
	skip.flat = true
	skip.focus_mode = Control.FOCUS_NONE
	skip.set_anchors_preset(Control.PRESET_FULL_RECT)
	if not firme:
		skip.pressed.connect(_on_skip)
	add_child(skip)
	_skip_btn = skip
	if firme:
		_monta_salto_mantenido(skip)




func _salto_firme() -> bool:
	return Ceremonies.SALTO_FIRME.has(String(data.get("kind", "")))



const SALTO_FIRME_SECS: float = 0.9






func _monta_salto_mantenido(skip: Button) -> void:
	CareerUi.hold_gesture(skip, SALTO_FIRME_SECS, _on_skip)
	var fill: ColorRect = skip.get_child(skip.get_child_count() - 1) as ColorRect
	if fill != null:
		fill.anchor_top = 1.0
		fill.offset_top = -10.0
	var rot: Label = CareerUi.plain(28, CareerTheme.TEXT_DIM)
	rot.text = I18n.t("MANTÉN PARA SALTAR")
	rot.name = "MantenParaSaltar"
	rot.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	rot.clip_text = true
	rot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rot.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	rot.offset_top = -64.0
	rot.offset_bottom = -18.0
	skip.add_child(rot)


	if fill != null:
		skip.move_child(fill, skip.get_child_count() - 1)



var _skip_btn: Button = null


var _primera_vez: bool = true








func salta_con_atras() -> bool:
	if _skip_btn == null or not is_instance_valid(_skip_btn):
		return false

	if not _leaving:
		_on_skip()
	return true






const VIDEO_SECS: float = 8.0

var _foto_btn: Button

var _columna_cede: float = 0.0


var _card_clavada: bool = false
var _foto_ocupado: bool = false
var _rec: ScreenRec






func _foto_posible() -> bool:
	if DisplayServer.get_name() == "headless":
		return false



	if embedded:
		return false
	return ScreenRec.available()














func _build_foto() -> void:
	if not _foto_posible():
		return
	_foto_btn = Button.new()
	_foto_btn.focus_mode = Control.FOCUS_NONE
	_foto_btn.text = I18n.t("GUARDAR")
	UiKit.apply_button(_foto_btn)







	_foto_btn.clip_text = true
	_foto_btn.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	_foto_btn.offset_top = 150.0 + UiKit.top_safe_inset(get_viewport())
	_foto_btn.offset_bottom = _foto_btn.offset_top + 76.0
	_foto_btn.modulate.a = 0.0
	_foto_btn.pressed.connect(_on_foto)
	add_child(_foto_btn)


	_foto_ajusta_ancho()




	var tw: Tween = create_tween()
	tw.tween_interval(1.6)
	tw.tween_property(_foto_btn, "modulate:a", 0.85, 0.35)












func _foto_ajusta_ancho() -> void:
	if not is_instance_valid(_foto_btn):
		return





	_foto_btn.custom_minimum_size = Vector2(0, 76)
	_foto_btn.clip_text = false
	var w: float = clampf(_foto_btn.get_combined_minimum_size().x + 24.0, 190.0, 640.0)
	_foto_btn.clip_text = true
	_foto_btn.custom_minimum_size = Vector2(w, 76)



	var derecha: float = 26.0 + UiKit.side_safe_inset(get_viewport())
	if _columna_cede > 0.0:
		derecha = 26.0 + _columna_cede
	_foto_btn.offset_right = - derecha
	_foto_btn.offset_left = -(w + derecha)



















func _on_foto() -> void:
	if _foto_ocupado:
		return
	_foto_ocupado = true
	_foto_btn.visible = false



	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	_rec = ScreenRec.new()
	add_child(_rec)




	_rec.finished.connect(_on_video_listo)
	_rec.start(get_viewport(), VIDEO_SECS, String(data.get("kind", "acto")),
		ScreenRec.MAX_SECS, zonas_sello())


func _on_video_listo(ok: bool, msg: String) -> void:
	if is_instance_valid(_rec):
		_rec.queue_free()
	_rec = null
	_foto_ocupado = false
	if is_instance_valid(_foto_btn):
		_foto_btn.visible = true




	if ok:
		_foto_aviso(I18n.t("GUARDADO"))
	else:
		_foto_aviso(msg if not msg.is_empty() else I18n.t("NO SE PUDO GUARDAR"))








func zonas_sello() -> Array[Rect2]:
	var out: Array[Rect2] = []
	if is_instance_valid(chyron) and chyron.visible:
		var r: Rect2 = chyron.get_global_rect()
		r.position.x -= chyron.position.x
		if r.size.y <= 0.0:
			r.size = chyron.get_combined_minimum_size()
		out.append(r)
	return out





func grabando() -> bool:
	return _foto_ocupado and _rec != null





func _foto_aviso(texto: String) -> void:
	if not is_instance_valid(_foto_btn):
		return
	_foto_btn.text = texto


	_foto_ajusta_ancho()
	var tw: Tween = create_tween()
	tw.tween_interval(2.0)
	tw.tween_callback(func() -> void:
		if is_instance_valid(_foto_btn):
			_foto_btn.text = I18n.t("GUARDAR")
			_foto_ajusta_ancho())























func make_chyron(tag: String, title: String, crest_team: Dictionary = {},
		at: float = -1.0, comp: String = "", sub: String = "",
		sub_color: Color = Color(0, 0, 0, 0)) -> Control:
	if at >= 0.0:
		chyron_at = at
	chyron = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0.03, 0.04, 0.06, 0.88)
	sb.border_color = accent
	sb.border_width_left = 10



	sb.content_margin_left = 22.0 + UiKit.side_safe_inset(get_viewport())
	sb.content_margin_right = 30.0
	sb.content_margin_top = 14.0
	sb.content_margin_bottom = 14.0
	chyron.add_theme_stylebox_override("panel", sb)
	chyron.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chyron.set_anchors_preset(Control.PRESET_TOP_LEFT)
	chyron.offset_top = 150.0 + UiKit.top_safe_inset(get_viewport())
	chyron.modulate.a = 0.0
	add_child(chyron)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 18)
	chyron.add_child(row)
	if not comp.is_empty():
		var logo: CompLogo = CompLogo.new()
		logo.custom_minimum_size = Vector2(72, 72)
		logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		logo.set_type(comp)
		logo.color = text_accent()
		row.add_child(logo)
	if not crest_team.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(76, 76)
		crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		crest.set_team(crest_team)
		row.add_child(crest)
	chyron.set_meta("escudo", String(crest_team.get("id", "")))
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 0)
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(col)
	var tag_l: Label = CareerUi.plain(20, text_accent())
	tag_l.text = I18n.gritado_seguro(tag)
	col.add_child(tag_l)
	var title_l: Label = CareerUi.plain(34, CareerTheme.TEXT)
	title_l.text = I18n.gritado_seguro(title)
	col.add_child(title_l)
	if not sub.is_empty():






		var sub_l: Label = CareerUi.plain(20,
			sub_color if sub_color.a > 0.0 else CareerTheme.TEXT_MID)
		sub_l.text = I18n.gritado_seguro(sub)
		col.add_child(sub_l)
	chyron.position.x = -900.0











	_chyron_tw = create_tween()
	_chyron_tw.set_parallel(true)
	_chyron_tw.tween_property(chyron, "position:x", 0.0, 0.5) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_chyron_tw.tween_property(chyron, "modulate:a", 1.0, 0.3)
	_chyron_tw.pause()
	_chyron_espera = true
	return chyron







func _tick_chyron() -> void:
	if not _chyron_espera or t < chyron_at:
		return
	_chyron_espera = false
	if _chyron_tw != null and _chyron_tw.is_valid():
		_chyron_tw.play()










func make_cita_idolo(nombre: String, texto: String, rotulo: String = "") -> PanelContainer:
	var cita: PanelContainer = PanelContainer.new()
	cita.name = "IdoloCita"
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	var fondo: Color = CareerTheme.BG_DEEP
	fondo.a = 0.92
	sb.bg_color = fondo
	sb.border_color = accent
	sb.border_width_top = 4
	sb.content_margin_left = 26.0
	sb.content_margin_right = 26.0
	sb.content_margin_top = 16.0
	sb.content_margin_bottom = 18.0
	cita.add_theme_stylebox_override("panel", sb)
	cita.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cita.anchor_left = 0.5
	cita.anchor_right = 0.5
	cita.anchor_top = 1.0
	cita.anchor_bottom = 1.0
	cita.offset_left = -490.0
	cita.offset_right = 490.0
	var abajo: float = 150.0 + UiKit.bottom_safe_inset(get_viewport())
	cita.offset_top = - abajo
	cita.offset_bottom = - abajo
	cita.grow_vertical = Control.GROW_DIRECTION_BEGIN
	cita.modulate.a = 0.0
	add_child(cita)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	cita.add_child(col)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	col.add_child(fila)
	var quien: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_MID)
	quien.text = CareerTheme.caps(CareerUi.display_name(nombre))
	quien.clip_text = true
	quien.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(quien)
	var chip: PanelContainer = PanelContainer.new()
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var csb: StyleBoxFlat = StyleBoxFlat.new()
	csb.bg_color = accent
	csb.set_corner_radius_all(8)
	csb.content_margin_left = 12.0
	csb.content_margin_right = 12.0
	csb.content_margin_top = 4.0
	csb.content_margin_bottom = 4.0
	chip.add_theme_stylebox_override("panel", csb)
	fila.add_child(chip)
	var chip_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.BG_DEEP)
	chip_l.text = I18n.t("TU ÍDOLO") if rotulo.is_empty() else rotulo
	chip.add_child(chip_l)
	var frase: Label = CareerUi.plain(CareerTheme.T_HUD_ROTULO, CareerTheme.TEXT)
	frase.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	frase.max_lines_visible = 3
	frase.text = "«%s»" % texto
	col.add_child(frase)
	return cita










func make_card(at: float = -1.0) -> VBoxContainer:
	if at >= 0.0:
		card_at = at
	card = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.plate_tinted(accent))
	if UiKit.es_horizontal() and tumbado_centrado:
		_card_centrada()
	elif UiKit.es_horizontal():
		_card_en_columna()
	else:
		card.anchor_left = 0.0
		card.anchor_right = 1.0
		card.anchor_top = 1.0
		card.anchor_bottom = 1.0
		_card_rest = -(44.0 + UiKit.bottom_safe_inset(get_viewport()))
		card.offset_left = 34.0
		card.offset_right = -34.0
		card.grow_horizontal = Control.GROW_DIRECTION_BOTH
		card.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_set_card_offset(_card_rest)
	card.modulate.a = 0.0


	card.visible = false
	add_child(card)
	card_box = VBoxContainer.new()
	card_box.add_theme_constant_override("separation", 10)
	card.add_child(card_box)
	_card_tw = create_tween()
	_card_tw.tween_interval(card_at)
	_card_tw.tween_callback(_reveal_card)
	return card_box




func card_title(text: String, size_px: int = 46) -> Label:
	var l: Label = CareerUi.plain(size_px, CareerTheme.TEXT)
	l.text = I18n.gritado_seguro(text)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER







	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.size_flags_horizontal = Control.SIZE_FILL
	card_box.add_child(l)
	return l


func card_sub(text: String, col: Color = Color.TRANSPARENT, size_px: int = 26) -> Label:
	var l: Label = CareerUi.plain(size_px, col if col.a > 0.0 else text_accent())
	l.text = I18n.gritado_seguro(text)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	card_box.add_child(l)
	return l














func card_club(equipo: Dictionary, size_px: int = 26) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var cv: CrestView = CrestView.new()
	cv.custom_minimum_size = Vector2(38, 38)
	cv.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cv.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cv.set_team(equipo)
	row.add_child(cv)
	var l: Label = CareerUi.plain(size_px, text_accent())







	l.clip_text = true
	l.custom_minimum_size = Vector2(380, 0)

	l.text = CareerTheme.caps(Nations.team_label(equipo, "?"))
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(l)
	card_box.add_child(row)
	return row








func card_note(text: String) -> Label:
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	l.text = I18n.gritado_seguro(text)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	card_box.add_child(l)
	return l





















func card_reward(pts: int, xp: int = 0) -> Label:
	var l: Label = null
	if pts > 0 or xp > 0:
		l = CareerUi.plain(22, accent)
		l.text = I18n.tf("+{0} XP", [xp]) if xp > 0 else I18n.tf("+{0} PTS DE HABILIDAD", [pts])
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		card_box.add_child(l)
	var prima: int = int(data.get("prima", 0))
	if prima > 0:
		var m: Label = CareerUi.plain(22, CareerTheme.MONEY)
		m.text = I18n.tf("+${0} DE PRIMA", [CareerUi.money(prima)])
		m.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		card_box.add_child(m)
		if l == null:
			l = m
	return l




func card_count(to: int, caption: String) -> Label:
	_count_to = to
	_count_label = CareerUi.plain(64, CareerTheme.TEXT)
	_count_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_count_label.text = "0"
	card_box.add_child(_count_label)
	if not caption.is_empty():
		var cap: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		cap.text = I18n.gritado_seguro(caption)
		cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		card_box.add_child(cap)
	return _count_label


















func card_stats(stats: Array) -> HBoxContainer:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 6)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	for i in stats.size():
		var cell: VBoxContainer = VBoxContainer.new()
		cell.add_theme_constant_override("separation", 0)
		cell.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var v: Label = CareerUi.plain(30, Color(stats[i].get("c",
			text_accent() if i == 0 else CareerTheme.TEXT)))
		v.text = String(stats[i].get("v", ""))
		v.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		cell.add_child(v)
		var k: Label = CareerUi.plain(15, CareerTheme.TEXT_DIM)
		k.text = CareerTheme.caps(String(stats[i].get("k", "")))
		k.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		cell.add_child(k)
		row.add_child(cell)
	card_box.add_child(row)
	return row




































func card_decision(moment_id: String, recap: String = "",
		patch: Dictionary = {}, socio: String = "") -> void:


	if replay:
		card_cta()
		return
	var ev: Dictionary = WeekEvents.moment_by_id(moment_id)
	if ev.is_empty():
		card_cta()
		return
	if not patch.is_empty():
		ev = ev.duplicate(true)
		ev.merge(patch, true)
	_decision_ev = ev
	_decision_recap = recap
	_decision_resolve = func(key: String) -> String:
		return Career.resolve_moment(moment_id, key, socio)





func _open_decision() -> void:
	if _decision_ev.is_empty() or _decision_open or _leaving or card == null:
		return
	_decision_open = true
	var tw: Tween = create_tween()
	tw.tween_property(card_box, "modulate:a", 0.0, 0.16)
	tw.tween_callback(_swap_to_decision)
	tw.tween_property(card_box, "modulate:a", 1.0, 0.22)













func _decision_extra() -> Control:
	return null


func _swap_to_decision() -> void:


	_count_label = null
	for c in card_box.get_children():
		card_box.remove_child(c)
		c.queue_free()
	if not _decision_recap.is_empty():
		var l: Label = CareerUi.plain(24, text_accent())
		l.text = _decision_recap
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		card_box.add_child(l)
	var extra: Control = _decision_extra()
	if extra != null:
		card_box.add_child(extra)



	var columna: bool = UiKit.es_horizontal()
	if columna:
		_decision_en_columna()
	else:
		card.offset_left = 0.0
		card.offset_right = 0.0
		_card_rest = 0.0
		_set_card_offset(0.0)
	_decision_scroll = DragScroll.new()
	_decision_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_decision_scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if columna:
		_decision_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	card_box.add_child(_decision_scroll)
	_decision = DecisionPanel.new()
	_decision.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	_decision.show_rels = not DecisionUi.rels_at_stake(_decision_ev).is_empty()



	_decision.finished.connect(_leave)
	if not _decision_postpone.is_empty():
		_decision.postpone_label = _decision_postpone
		_decision.postponed.connect(_leave)
	_decision_scroll.add_child(_decision)
	_decision.setup(_decision_ev, _decision_resolve, _decision_enabled)



	_decision.minimum_size_changed.connect(_fit_card)



	var inset: float = UiKit.bottom_safe_inset(get_viewport())
	if inset > 0.0 and not columna:
		var pad: Control = Control.new()
		pad.custom_minimum_size.y = inset
		pad.mouse_filter = Control.MOUSE_FILTER_IGNORE
		card_box.add_child(pad)




	CareerUi.normalize_caps(card_box)
	_fit_card()





func _fit_card() -> void:
	if _decision_scroll == null or not is_instance_valid(_decision):
		return


	if UiKit.es_horizontal():
		return
	await get_tree().process_frame
	if _decision_scroll == null or not is_instance_valid(_decision):
		return
	_decision_scroll.custom_minimum_size.y = minf(
		_decision.get_combined_minimum_size().y, size.y * DECISION_MAX)
	await get_tree().process_frame
	if card != null and not _leaving:
		fit_world_above(card.size.y)













func _decision_en_columna() -> void:
	var vp: Viewport = get_viewport()
	_card_en_columna()
	card.anchor_top = 0.0
	card.anchor_bottom = 1.0
	card.offset_top = 24.0 + UiKit.top_safe_inset(vp)
	card.offset_bottom = -(24.0 + UiKit.bottom_safe_inset(vp))




	_card_clavada = true
	_ceder_columna()























func _card_en_columna() -> void:
	var vp: Viewport = get_viewport()
	card.anchor_left = 1.0
	card.anchor_right = 1.0
	card.anchor_top = 0.5
	card.anchor_bottom = 0.5
	card.offset_right = -(UiKit.side_safe_inset(vp) + 24.0)
	card.offset_left = card.offset_right - _columna_ancho()
	card.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	card.grow_vertical = Control.GROW_DIRECTION_BOTH
	_card_rest =(UiKit.top_safe_inset(vp) - UiKit.bottom_safe_inset(vp)) * 0.5





func _card_centrada() -> void:
	var vp: Viewport = get_viewport()
	var ancho: float = minf(SceneFade.rect_visible(self).size.x
		- 2.0 *(UiKit.side_safe_inset(vp) + 34.0), FICHA_CENTRADA_MAX)
	card.anchor_left = 0.5
	card.anchor_right = 0.5
	card.anchor_top = 1.0
	card.anchor_bottom = 1.0
	card.offset_left = - ancho * 0.5
	card.offset_right = ancho * 0.5
	card.grow_horizontal = Control.GROW_DIRECTION_BOTH
	card.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_card_rest = -(44.0 + UiKit.bottom_safe_inset(vp))





func tope_sobre_ficha() -> float:
	var alto: float = SceneFade.rect_visible(self).size.y
	if card == null or not (tumbado_centrado and UiKit.es_horizontal()):
		return alto
	return alto + _card_rest - card.get_combined_minimum_size().y - FICHA_CENTRADA_AIRE


func _columna_ancho() -> float:
	return clampf(SceneFade.rect_visible(self).size.x * DECISION_COLUMNA_K,
		DECISION_COLUMNA_MIN, DECISION_COLUMNA_MAX)























func _ceder_columna() -> void:
	if card == null:
		return
	_columna_cede = - card.offset_left
	_foto_ajusta_ancho()
	if viewport_box == null:
		return
	if absf(viewport_box.offset_left + _columna_cede) < 0.5:
		return
	var tw: Tween = create_tween()
	tw.tween_property(viewport_box, "offset_left", - _columna_cede, 0.35) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)








func fit_world_above(used: float) -> void:
	if UiKit.es_horizontal():
		return
	var band: float = 1.0
	if used > size.y * WORLD_SHRINK_AT:
		band = clampf((size.y - used) / maxf(size.y, 1.0), 0.28, 1.0)
	if absf(band - world_band) < 0.005:
		return
	if _band_tw != null and _band_tw.is_valid():
		_band_tw.kill()
	_band_tw = create_tween()
	_band_tw.tween_method(_set_world_band, world_band, band, 0.35) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


func _set_world_band(k: float) -> void:
	world_band = clampf(k, 0.2, 1.0)
	if viewport_box != null:
		viewport_box.offset_bottom = -(1.0 - world_band) * size.y
	if _bg == null and world_band < 0.999:


		_bg = ColorRect.new()
		_bg.color = CareerTheme.BG_DEEP
		_bg.set_anchors_preset(Control.PRESET_FULL_RECT)
		_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(_bg)
		move_child(_bg, 0)


func card_cta(text: String = I18n.t("CONTINUAR")) -> Button:
	var b: Button = CareerUi.primary_cta(text, _leave)
	card_box.add_child(b)
	return b


func _reveal_card() -> void:
	if card == null or card.visible:
		return
	card.visible = true
	ficha_puesta = true





	if _salto_firme() and not replay and _decision_ev.is_empty() and card_box != null \
			and card_box.find_children("*", "Button", true, false).is_empty():
		card_cta()


	if UiKit.es_horizontal() and not tumbado_centrado:
		_ceder_columna()


	flash_rate = 0.0
	_armar_auto_seguir()
	var tw: Tween = create_tween()
	tw.set_parallel(true)
	tw.tween_method(_set_card_offset, _card_rest + 140.0, _card_rest, 0.45) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_property(card, "modulate:a", 1.0, 0.35)


	if _chyron_espera:
		_chyron_espera = false
		if _chyron_tw != null and _chyron_tw.is_valid():
			_chyron_tw.kill()
	if chyron != null:
		tw.tween_property(chyron, "modulate:a", 0.0, 0.35)
	if _count_label != null:
		var count: Tween = create_tween()
		count.tween_method(_set_count, 0.0, float(_count_to), 1.1) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


	if not _decision_ev.is_empty():
		var d: Tween = create_tween()
		d.tween_interval(DECISION_GAP)
		d.tween_callback(_open_decision)






func _armar_auto_seguir() -> void:
	if not _decision_ev.is_empty():
		return
	if _auto_tw != null and _auto_tw.is_valid():
		_auto_tw.kill()
	_auto_tw = create_tween()
	_auto_tw.tween_interval(AUTO_SEGUIR)
	_auto_tw.tween_callback(_leave)





























const VIGIA_MARGEN: float = 20.0


func _armar_vigia() -> void:


	if GameState.readonly_save:
		return



	while _telon != null and is_instance_valid(_telon):
		await get_tree().process_frame
		if not is_inside_tree():
			return


	SceneFade.timer(card_at + VIGIA_MARGEN, true, false, true) \
			.timeout.connect(_vigia_ficha)











const VIGIA_BUILD: float = 30.0


var _build_ok: bool = false


func _armar_vigia_arranque() -> void:
	if GameState.readonly_save:
		return

	SceneFade.timer(VIGIA_BUILD, true, false, true) \
			.timeout.connect(_vigia_build)











func _vigia_build() -> void:
	if _build_ok or _leaving:
		return
	push_warning("[acto] %s no llegó a montarse en %.0f s reales: se cierra solo"
		% [String(data.get("kind", "?")), VIGIA_BUILD])
	if _telon != null and is_instance_valid(_telon):
		_telon.dismiss()
		_telon = null
	_leave()




func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	push_warning("[acto] %s no aterrizó su ficha en %.1f s reales: se cierra solo"
		% [String(data.get("kind", "?")), card_at + VIGIA_MARGEN])
	_leave()


func _set_card_offset(v: float) -> void:
	if card == null or _card_clavada:
		return
	card.offset_top = v
	card.offset_bottom = v


func _set_count(v: float) -> void:
	if _count_label != null:
		_count_label.text = thousands(int(round(v)))







func _on_skip() -> void:



	if grabando():
		return
	if t >= card_at:





		if not _decision_ev.is_empty():
			_open_decision()
			return




		if _salto_firme() and not replay:
			return
		_leave()
		return
	t = card_at
	_tick_camera()
	_skipped()
	_chyron_espera = false
	if _chyron_tw != null and _chyron_tw.is_valid():
		_chyron_tw.kill()
	if chyron != null:
		chyron.position.x = 0.0
		chyron.modulate.a = 1.0
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	_reveal_card()




func _skipped() -> void:
	pass





func _leave() -> void:
	if _leaving:
		return
	_leaving = true



	if embedded:
		acto_terminado.emit()
		return



	if replay:
		replay_hecho = String(data.get("kind", ""))
		SceneFade.to_scene(LOGROS_SCENE)
		return
	if standalone:
		SceneFade.to_scene(HUB_SCENE if _vuelve_a.is_empty() else _vuelve_a)
		return






	if not Career.pending_summary.is_empty() \
			and not Ceremonies.antes_de_la_ficha(Career.next_ceremony()):
		SceneFade.to_scene(HUB_SCENE)
		return


	SceneFade.to_scene(Career.acto_o_suelo(HUB_SCENE))







func text_accent() -> Color:


	return CareerTheme.text_on_dark(accent)




func thousands(v: int) -> String:
	return I18n.num(maxi(v, 0))
