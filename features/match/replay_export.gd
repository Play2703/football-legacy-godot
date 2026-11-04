class_name ReplayExport
extends Node

































const OUT_W: int = 720
const OUT_H: int = 1280


const OUT_FPS: int = 30



const MAX_SECS: float = 8.0



signal progress(frac: float)

signal finished(ok: bool, message: String)

var _clip: ReplayRec.Clip
var _vp: SubViewport
var _cam: Camera3D
var _busy: bool = false
var _sink: VideoSink



var compartir: bool = false








var velocidad: float = 1.0

var _images: Array = []







static func available() -> bool:
	return VideoSink.available()





const ROTULO_NOMBRE_MAX: int = 16







static func rotulo(minuto: String) -> String:
	var partes: PackedStringArray = []
	var nombre: String = Career.player_name.strip_edges()
	if not nombre.is_empty():
		partes.append(nombre.substr(0, ROTULO_NOMBRE_MAX).strip_edges())
	var dorsal: int = GameState.shirt_number_now()
	if dorsal > 0:
		partes.append("#%d" % dorsal)
	if not minuto.is_empty():
		partes.append(minuto)
	return "  ".join(partes)






static func rotulo_de(clip: ReplayRec.Clip) -> String:
	if clip == null or clip.ajeno:
		return ""
	return rotulo(clip.label)





static func cuadros_jugada(dur: float, vel: float = 1.0) -> int:
	return maxi(int(round(dur / vel * OUT_FPS)), 2)








func export_clip(clip: ReplayRec.Clip, world: Node3D,
		render_only: bool = false) -> void:
	if _busy:
		return
	if clip == null or clip.samples() < 2:
		finished.emit(false, I18n.t("No hay jugada que guardar"))
		return
	_busy = true
	_clip = clip
	_images.clear()
	_sink = null
	var dur: float = minf(clip.length(), MAX_SECS)


	var vel: float = velocidad if velocidad > 0.0 else 1.0
	var total: int = cuadros_jugada(dur, vel)


	if not render_only:
		_sink = VideoSink.new()
		_sink.finished.connect(_on_sink_finished)



		_sink.pon_audio(ReplayAudio.pcm_video(clip, dur, total, OUT_FPS, vel),
			clip.audio_rate)
		if not _sink.begin(OUT_W, OUT_H, OUT_FPS, "gol", rotulo_de(clip)):
			_sink = null
			_busy = false
			finished.emit(false, I18n.t("No se pudo empezar a grabar"))
			return
	_build_viewport(world)




	var cola_est: int = cola_cuadros
	var todos: int = total + cola_est
	for i in total:
		var t: float = dur *(float(i) / float(total - 1))
		_pose_world(t)
		_place_cam(t)
		if not await _graba():
			return
		progress.emit(float(i + 1) / float(todos))







	if cola_est > 0 and cola_abre.call():
		var t0_ms: int = Time.get_ticks_msec()
		var dt: float = 1.0 / float(OUT_FPS)
		for j in COLA_MAX_CUADROS:
			if not cola_paso.call(dt, _cam):
				break
			if not await _graba():
				cola_cierra.call()
				return
			progress.emit(minf(float(total + j + 1) / float(todos), 1.0))
			var toca_ms: int = t0_ms + int(float(j + 1) * 1000.0 / float(OUT_FPS))
			while Time.get_ticks_msec() < toca_ms:
				await get_tree().process_frame
		cola_cierra.call()

	if _sink != null:


		_teardown()
		if compartir:
			_sink.finish_share(VideoSink.pie_compartir())
		else:
			_sink.finish()
		return
	_teardown()
	finished.emit(true, I18n.t("Listo"))




func _graba() -> bool:


	_vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	await RenderingServer.frame_post_draw




	var img: Image = _vp.get_texture().get_image() if is_instance_valid(_vp) else null
	if img == null:
		if _sink != null:
			_sink.cancel_interno()
			_sink = null
		_teardown()
		finished.emit(false, I18n.t("Se cortó la grabación"))
		return false
	if img.get_format() != Image.FORMAT_RGBA8:
		img.convert(Image.FORMAT_RGBA8)
	if _sink != null:
		if not _sink.push(img):
			_sink.cancel_interno()
			_sink = null
			_teardown()
			finished.emit(false, I18n.t("Se cortó la grabación"))
			return false
	else:
		_images.append(img)
	return true


func _on_sink_finished(ok: bool, msg: String) -> void:
	_sink = null
	_busy = false
	finished.emit(ok, msg)




func _build_viewport(world: Node3D) -> void:
	_vp = SubViewport.new()
	_vp.size = Vector2i(OUT_W, OUT_H)
	_vp.own_world_3d = false
	_vp.world_3d = world.get_world_3d()
	_vp.transparent_bg = false
	_vp.render_target_update_mode = SubViewport.UPDATE_DISABLED
	add_child(_vp)
	_cam = Camera3D.new()
	_cam.fov = 52.0
	_cam.far = 260.0
	_vp.add_child(_cam)
	_cam.current = true





func _pose_world(t: float) -> void:
	ghost_poser.call(t)






var ghost_poser: Callable = func(_t: float) -> void: pass

var cam_placer: Callable = func(_t: float, _c: Camera3D) -> void: pass







var cola_cuadros: int = 0
var cola_abre: Callable = func() -> bool: return false
var cola_paso: Callable = func(_dt: float, _c: Camera3D) -> bool: return false
var cola_cierra: Callable = func() -> void: pass


const COLA_MAX_CUADROS: int = 180


func _place_cam(t: float) -> void:
	cam_placer.call(t, _cam)


func _teardown() -> void:
	if _sink == null:
		_busy = false
	if is_instance_valid(_vp):
		_vp.queue_free()
	_vp = null
	_cam = null



func frames() -> Array:
	return _images
