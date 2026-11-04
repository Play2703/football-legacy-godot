class_name ScreenRec
extends Node





























const OUT_W: int = 720
const OUT_H: int = 1280
const OUT_FPS: int = 30



const MAX_SECS: float = 8.0



signal progress(frac: float)

signal finished(ok: bool, message: String)

var _sink: VideoSink
var _vp: Viewport

var _tam: Vector2i = Vector2i(OUT_W, OUT_H)
var _secs: float = MAX_SECS
var _t0: int = 0

var _slot: int = 0
var _total: int = 0
var _grabando: bool = false
var _cerrando: bool = false



static func available() -> bool:
	return VideoSink.available()









func start(viewport: Viewport, secs: float = MAX_SECS, prefijo: String = "acto",
		tope: float = MAX_SECS, evita: Array[Rect2] = []) -> void:
	if _grabando:
		return
	_vp = viewport
	if _vp == null:
		finished.emit(false, I18n.t("No se pudo empezar a grabar"))
		return
	_tam = medida(_vp.get_visible_rect().size)
	_sink = VideoSink.new()
	_sink.finished.connect(_on_sink_finished)
	if not _sink.begin(_tam.x, _tam.y, OUT_FPS, prefijo, "", fracciones(evita, _vp.get_visible_rect())):
		_sink = null
		finished.emit(false, I18n.t("No se pudo empezar a grabar"))
		return
	_secs = clampf(secs, 0.5, maxf(tope, 0.5))
	_total = maxi(int(round(_secs * OUT_FPS)), 2)
	_slot = 0
	_cerrando = false
	_grabando = true
	_t0 = Time.get_ticks_msec()
	set_process(true)







static func fracciones(rects: Array[Rect2], visible: Rect2) -> Array:
	var out: Array = []
	if visible.size.x <= 0.0 or visible.size.y <= 0.0:
		return out
	var ref: Rect2 = recorte(visible)
	for r in rects:
		out.append(Rect2((r.position - ref.position) / ref.size, r.size / ref.size))
	return out














static func recorte(visible: Rect2) -> Rect2:
	if visible.size.x <= visible.size.y:
		return visible
	var cw: float = visible.size.y * float(OUT_W) / float(OUT_H)
	return Rect2(visible.position.x +(visible.size.x - cw) * 0.5, visible.position.y,
		cw, visible.size.y)




func stop() -> void:
	if _grabando:
		_cerrar()



func abort() -> void:
	set_process(false)
	_grabando = false
	if _sink != null:
		_sink.cancel()
		_sink = null


func _ready() -> void:



	process_mode = Node.PROCESS_MODE_ALWAYS
	set_process(false)





















static func medida(lienzo: Vector2) -> Vector2i:
	if lienzo.x <= 0.0 or lienzo.y <= 0.0:
		return Vector2i(OUT_W, OUT_H)
	if lienzo.x > lienzo.y:
		return Vector2i(OUT_W, OUT_H)
	var k: float = float(OUT_W) / minf(lienzo.x, lienzo.y)
	return Vector2i(maxi(2, int(round(lienzo.x * k / 2.0)) * 2),
		maxi(2, int(round(lienzo.y * k / 2.0)) * 2))










static func cuadro(img: Image, tam: Vector2i) -> Image:
	if img.get_width() > img.get_height() and tam.x < tam.y:
		var r: Rect2 = recorte(Rect2(Vector2.ZERO, Vector2(img.get_size())))
		img = img.get_region(Rect2i(int(round(r.position.x)), 0,
			int(round(r.size.x)), img.get_height()))
	if img.get_width() != tam.x or img.get_height() != tam.y:
		img.resize(tam.x, tam.y, Image.INTERPOLATE_BILINEAR)
	if img.get_format() != Image.FORMAT_RGBA8:
		img.convert(Image.FORMAT_RGBA8)
	return img


func _process(_dt: float) -> void:
	if not _grabando or _cerrando:
		return


	if not is_instance_valid(_vp):
		_cerrar()
		return

	var pasado: float = float(Time.get_ticks_msec() - _t0) / 1000.0
	var quiere: int = mini(int(floor(pasado * float(OUT_FPS))) + 1, _total)
	if quiere <= _slot:
		return



	var img: Image = _vp.get_texture().get_image()
	if img == null:
		_cerrar()
		return
	img = cuadro(img, _tam)
	while _slot < quiere:
		if not _sink.push(img):
			_grabando = false
			set_process(false)
			_sink.cancel_interno()
			_sink = null
			finished.emit(false, I18n.t("Se cortó la grabación"))
			return
		_slot += 1
	progress.emit(float(_slot) / float(_total))
	if _slot >= _total:
		_cerrar()


func _cerrar() -> void:
	if _cerrando:
		return
	_cerrando = true
	_grabando = false
	set_process(false)
	if _sink == null:
		finished.emit(false, I18n.t("No hay nada grabado"))
		return
	_sink.finish()


func _on_sink_finished(ok: bool, msg: String) -> void:
	_sink = null
	finished.emit(ok, msg)
