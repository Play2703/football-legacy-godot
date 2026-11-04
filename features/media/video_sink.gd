class_name VideoSink
extends RefCounted























const SINGLETON: String = "ReplaySaver"






const METODOS: Array[String] = ["begin", "push_frame", "finish", "cancel"]


const DIR_ESCRITORIO: String = "user://videos"





















static var sello: bool = true




const SELLO_LOGO: String = "res://assets/branding/logo_v3_transparent_1024.png"
const SELLO_BOLA: Rect2i = Rect2i(320, 208, 384, 384)
const SELLO_LETRAS: Rect2i = Rect2i(256, 736, 512, 176)
const SELLO_BOLA_LOG: int = 16
const SELLO_LETRAS_LOG: Vector2i = Vector2i(64, 22)


const SELLO_FUENTE: String = "res://assets/fonts/PressStart2P-Regular.ttf"
const SELLO_FUENTE_TAM: int = 8




const SELLO_REF: Vector2 = Vector2(1080.0, 1920.0)
const SELLO_XY: Vector2 = Vector2(60.0, 288.0)
const SELLO_ANCHO_SEGURO: float = 720.0



static var _marca: Image = null


var _sello: Image = null
var _sello_pos: Vector2i = Vector2i.ZERO


signal finished(ok: bool, message: String)

var _w: int = 0
var _h: int = 0
var _fps: int = 30
var _native: Object = null

var _compartiendo: Object = null

var _frames_dir: String = ""
var _n: int = 0
var _abierto: bool = false

var _prefijo: String = "clip"

var _pcm: PackedByteArray = PackedByteArray()
var _pcm_rate: int = 0


var _ultimo: String = ""



func ultimo() -> String:
	return _ultimo




static func available() -> bool:
	return nativo() != null or escritorio_ok()











static func pide_permiso() -> bool:
	var s: Object = nativo()
	if s == null or not s.has_method("request_permission"):
		return true
	s.request_permission()
	var concedido: bool = await Signal(s, "permission")
	return concedido






static func puede_compartir() -> bool:
	var s: Object = nativo()
	return s != null and s.has_method("finish_share")






const ENLACE_COMPARTIR: String = "https://apps.apple.com/app/id6796523780?pt=129245310&ct=compartir&mt=8"





static func pie_compartir() -> String:
	return "%s %s" % [I18n.t("¡Mira mi gol en Football Legacy!"), ENLACE_COMPARTIR]



static func nativo() -> Object:
	if not Engine.has_singleton(SINGLETON):
		return null
	var s: Object = Engine.get_singleton(SINGLETON)
	for m in METODOS:
		if not s.has_method(m):
			return null
	return s







static var permitir_headless: bool = false





static func escritorio_ok() -> bool:
	if DisplayServer.get_name() == "headless" and not permitir_headless:
		return false
	if not (OS.get_name() in ["macOS", "Windows", "Linux", "FreeBSD"]):
		return false
	return not ffmpeg().is_empty()



static func ffmpeg() -> String:
	for c in ["/opt/homebrew/bin/ffmpeg", "/usr/local/bin/ffmpeg",
			"/usr/bin/ffmpeg", "/opt/local/bin/ffmpeg", "/usr/bin/ffmpeg.exe"]:
		if FileAccess.file_exists(c):
			return c
	return ""









func begin(w: int, h: int, fps: int, prefijo: String = "clip",
		rotulo: String = "", evita: Array = []) -> bool:
	if _abierto:
		return false
	_w =(w / 2) * 2
	_h =(h / 2) * 2
	_fps = maxi(fps, 1)
	_prefijo = prefijo
	_n = 0
	_sello = _compone_sello(_w, _h, rotulo, evita) if sello else null
	_native = nativo()
	if _native != null:




		if _native.has_method("set_audio"):
			_native.set_audio(_pcm, _pcm_rate)
		if not _native.begin(_w, _h, _fps):
			_native = null
			return false
		_abierto = true
		return true
	if not escritorio_ok():
		return false
	_frames_dir = _carpeta_limpia()
	if _frames_dir.is_empty():
		return false
	_abierto = true
	return true







func push(img: Image) -> bool:
	if not _abierto or img == null:
		return false
	if img.get_width() != _w or img.get_height() != _h:
		img = img.duplicate()
		img.resize(_w, _h, Image.INTERPOLATE_BILINEAR)
	if img.get_format() != Image.FORMAT_RGBA8:
		img = img.duplicate()
		img.convert(Image.FORMAT_RGBA8)
	sella(img)
	if _native != null:
		var datos: PackedByteArray = img.get_data()
		var esperado: int = _w * _h * 4
		if datos.size() != esperado:
			push_error("VideoSink: cuadro de %d bytes, se esperaban %d (%dx%d RGBA8)"
				% [datos.size(), esperado, _w, _h])
			return false
		if not _native.push_frame(datos):
			return false
	else:
		if img.save_png("%s/f_%05d.png" % [_frames_dir, _n]) != OK:
			return false
	_n += 1
	return true






func pon_audio(pcm: PackedByteArray, rate: int) -> void:
	if _abierto:
		push_error("VideoSink: el sonido va antes de begin")
		return
	_pcm = pcm if rate > 0 else PackedByteArray()
	_pcm_rate = rate if not _pcm.is_empty() else 0



func con_audio() -> bool:
	return not _pcm.is_empty()




func frames() -> int:
	return _n






func sella(img: Image) -> void:
	if _sello == null or img == null:
		return
	img.blend_rect(_sello, Rect2i(Vector2i.ZERO, _sello.get_size()), _sello_pos)



func sello_rect() -> Rect2i:
	if _sello == null:
		return Rect2i()
	return Rect2i(_sello_pos, _sello.get_size())




static func _sello_k(h: int) -> int:
	return maxi(1, int(round(float(h) / 640.0)))






func _compone_sello(w: int, h: int, rotulo: String, evita: Array = []) -> Image:
	var marca: Image = _marca_logica()
	if marca == null:
		return null
	var k: int = _sello_k(h)
	var ancho_log: int = int(floor(SELLO_ANCHO_SEGURO * float(w) / SELLO_REF.x / float(k)))
	if marca.get_width() > ancho_log:
		return null


	var texto: String = _texto_plano(rotulo)
	var cabe: int = maxi(0,(ancho_log - 1) / SELLO_FUENTE_TAM)
	if texto.length() > cabe:
		texto = texto.substr(0, cabe).strip_edges()
	var mascara: Image = _texto_mascara(texto)
	var sw: int = marca.get_width()
	var sh: int = marca.get_height()
	var y_rot: int = sh + 4
	if mascara != null:
		sw = maxi(sw, mascara.get_width() + 1)
		sh = y_rot + mascara.get_height() + 1
	var s: Image = Image.create_empty(sw, sh, false, Image.FORMAT_RGBA8)
	s.blit_rect(marca, Rect2i(Vector2i.ZERO, marca.get_size()), Vector2i.ZERO)
	if mascara != null:


		var r: Rect2i = Rect2i(Vector2i.ZERO, mascara.get_size())
		var oscuro: Image = Image.create_empty(r.size.x, r.size.y, false, Image.FORMAT_RGBA8)
		oscuro.fill(CareerTheme.INK_DARK)
		s.blend_rect_mask(oscuro, mascara, r, Vector2i(1, y_rot + 1))
		var claro: Image = Image.create_empty(r.size.x, r.size.y, false, Image.FORMAT_RGBA8)
		claro.fill(CareerTheme.INK_LIGHT)
		s.blend_rect_mask(claro, mascara, r, Vector2i(0, y_rot))
	s.resize(sw * k, sh * k, Image.INTERPOLATE_NEAREST)
	var base: Rect2i = Rect2i(Vector2i(int(round(SELLO_XY.x * float(w) / SELLO_REF.x)),
		int(round(SELLO_XY.y * float(h) / SELLO_REF.y))), s.get_size())
	_sello_pos = sitio_sello(base, w, h, evita)
	if _sello_pos.y < 0:
		return null
	return s




const SELLO_HUECO: float = 16.0
const SELLO_Y_MAX: float = 1400.0














static func sitio_sello(base: Rect2i, w: int, h: int, evita: Array) -> Vector2i:
	var hueco: int = int(ceil(SELLO_HUECO * float(h) / SELLO_REF.y))
	var fondo: int = int(floor(SELLO_Y_MAX * float(h) / SELLO_REF.y))
	var zonas: Array[Rect2i] = []
	for e in evita:
		if e is Rect2 and (e as Rect2).has_area():
			var z: Rect2 = e
			zonas.append(Rect2i(Vector2i(int(floor(z.position.x * w)), int(floor(z.position.y * h))),
				Vector2i(int(ceil(z.size.x * w)), int(ceil(z.size.y * h)))).grow(hueco))
	var r: Rect2i = base

	for _i in zonas.size() + 1:
		var pisa: bool = false
		for z in zonas:
			if z.intersects(r):
				r.position.y = z.end.y
				pisa = true
		if not pisa:
			return r.position if r.end.y <= fondo else Vector2i(-1, -1)
	return Vector2i(-1, -1)





static func _marca_logica() -> Image:
	if _marca != null:
		return _marca
	var tex: Texture2D = load(SELLO_LOGO) as Texture2D
	if tex == null:
		return null
	var logo: Image = tex.get_image()
	if logo == null or logo.is_empty():
		return null
	if logo.is_compressed():
		logo.decompress()
	if logo.get_format() != Image.FORMAT_RGBA8:
		logo.convert(Image.FORMAT_RGBA8)
	var bola: Image = logo.get_region(SELLO_BOLA)
	bola.resize(SELLO_BOLA_LOG, SELLO_BOLA_LOG, Image.INTERPOLATE_NEAREST)
	var letras: Image = logo.get_region(SELLO_LETRAS)
	letras.resize(SELLO_LETRAS_LOG.x, SELLO_LETRAS_LOG.y, Image.INTERPOLATE_NEAREST)
	var alto: int = maxi(SELLO_BOLA_LOG, SELLO_LETRAS_LOG.y)
	var m: Image = Image.create_empty(SELLO_BOLA_LOG + 4 + SELLO_LETRAS_LOG.x, alto,
		false, Image.FORMAT_RGBA8)
	m.blit_rect(bola, Rect2i(0, 0, SELLO_BOLA_LOG, SELLO_BOLA_LOG),
		Vector2i(0,(alto - SELLO_BOLA_LOG) / 2))
	m.blit_rect(letras, Rect2i(Vector2i.ZERO, SELLO_LETRAS_LOG),
		Vector2i(SELLO_BOLA_LOG + 4,(alto - SELLO_LETRAS_LOG.y) / 2))
	_marca = m
	return _marca






static func _texto_plano(s: String) -> String:
	const CON: String = "ÁÀÂÄÃÉÈÊËÍÌÎÏÓÒÔÖÕÚÙÛÜÑÇ"
	const SIN: String = "AAAAAEEEEIIIIOOOOOUUUUNC"
	var out: String = ""
	for ch in s.strip_edges().to_upper():
		var i: int = CON.find(ch)
		if i >= 0:
			out += SIN[i]
		elif ch.unicode_at(0) >= 32 and ch.unicode_at(0) < 127:
			out += ch
	return out






static func _texto_mascara(texto: String) -> Image:
	if texto.is_empty():
		return null
	var fuente: Font = load(SELLO_FUENTE) as Font
	if fuente == null:
		return null
	var ts: TextServer = TextServerManager.get_primary_interface()
	var forma: RID = ts.create_shaped_text()
	ts.shaped_text_add_string(forma, texto, fuente.get_rids(), SELLO_FUENTE_TAM)
	ts.shaped_text_shape(forma)
	var asc: float = ts.shaped_text_get_ascent(forma)
	var ancho: int = int(ceil(ts.shaped_text_get_width(forma)))
	var alto: int = int(ceil(asc + ts.shaped_text_get_descent(forma)))
	if ancho <= 0 or alto <= 0:
		ts.free_rid(forma)
		return null
	var out: Image = Image.create_empty(ancho, alto, false, Image.FORMAT_RGBA8)
	var atlas_de: Dictionary = {}
	var x: float = 0.0
	for g in ts.shaped_text_get_glyphs(forma):
		var rid: RID = g["font_rid"]
		var idx: int = int(g["index"])
		var tam: Vector2i = Vector2i(int(g["font_size"]), 0)
		var pluma: Vector2 = Vector2(x, asc) + g["offset"]
		x += float(g["advance"]) * float(g["repeat"])
		if not rid.is_valid() or idx == 0:
			continue
		ts.font_render_glyph(rid, tam, idx)
		var ti: int = ts.font_get_glyph_texture_idx(rid, tam, idx)
		if ti < 0:
			continue
		var clave: String = "%s:%d:%d" % [rid.get_id(), tam.x, ti]
		if not atlas_de.has(clave):
			var a: Image = ts.font_get_texture_image(rid, tam, ti)
			if a == null or a.is_empty():
				continue
			a = a.duplicate()
			if a.get_format() != Image.FORMAT_RGBA8:
				a.convert(Image.FORMAT_RGBA8)
			atlas_de[clave] = a
		var atlas: Image = atlas_de[clave]
		var uv: Rect2i = Rect2i(ts.font_get_glyph_uv_rect(rid, tam, idx))
		var o: Vector2i = Vector2i((pluma + ts.font_get_glyph_offset(rid, tam, idx)).round())
		for yy in uv.size.y:
			for xx in uv.size.x:
				var px: int = o.x + xx
				var py: int = o.y + yy
				if px < 0 or py < 0 or px >= ancho or py >= alto:
					continue
				if atlas.get_pixel(uv.position.x + xx, uv.position.y + yy).a >= 0.5:
					out.set_pixel(px, py, Color.WHITE)
	ts.free_rid(forma)
	return out




func cancel() -> void:
	if not _abierto:
		return
	_abierto = false
	if _native != null:
		_native.cancel()
		_native = null
		return
	_borra_dir(_frames_dir)
	_frames_dir = ""






func finish() -> void:
	if not _abierto:
		finished.emit(false, I18n.t("No hay nada grabado"))
		return
	_abierto = false
	if _n < 2:


		cancel_interno()
		finished.emit(false, I18n.t("No hay nada grabado"))
		return
	if _native != null:
		var s: Object = _native
		_native = null
		s.connect("saved", _on_saved, CONNECT_ONE_SHOT)
		s.connect("failed", _on_failed, CONNECT_ONE_SHOT)
		s.finish()
		return
	_cose_escritorio()








func finish_share(texto: String) -> void:
	if _native == null or not _native.has_method("finish_share"):
		finish()
		return
	if not _abierto:
		finished.emit(false, I18n.t("No hay nada grabado"))
		return
	_abierto = false
	if _n < 2:
		cancel_interno()
		finished.emit(false, I18n.t("No hay nada grabado"))
		return
	_compartiendo = _native
	_native = null



	_compartiendo.connect("shared", _on_shared)
	_compartiendo.connect("failed", _on_failed_share)
	_compartiendo.finish_share(texto)


func _suelta_share() -> void:
	var s: Object = _compartiendo
	_compartiendo = null
	if s == null:
		return
	if s.is_connected("shared", _on_shared):
		s.disconnect("shared", _on_shared)
	if s.is_connected("failed", _on_failed_share):
		s.disconnect("failed", _on_failed_share)


func _on_shared(completed: bool) -> void:
	_suelta_share()
	if completed:
		Telemetry.count("repe_compartida")
	finished.emit(true, I18n.t("Compartido") if completed else "")


func _on_failed_share(reason: String) -> void:
	_suelta_share()
	finished.emit(false, I18n.t(reason) if not reason.is_empty()
		else I18n.t("No se pudo abrir compartir"))


func cancel_interno() -> void:
	if _native != null:
		_native.cancel()
		_native = null
	elif not _frames_dir.is_empty():
		_borra_dir(_frames_dir)
		_frames_dir = ""


func _on_saved(_id: String) -> void:
	finished.emit(true, I18n.t("Guardado en tus fotos"))


func _on_failed(reason: String) -> void:




	finished.emit(false, I18n.t(reason) if not reason.is_empty()
		else I18n.t("No se pudo guardar en tus fotos"))





func _cose_escritorio() -> void:
	var dir_abs: String = ProjectSettings.globalize_path(DIR_ESCRITORIO)
	DirAccess.make_dir_recursive_absolute(dir_abs)
	var sello: String = Time.get_datetime_string_from_system() \
			.replace(":", "-").replace("T", "_")
	var salida: String = "%s/%s_%s.mp4" % [dir_abs, _prefijo, sello]
	var cuadros_abs: String = ProjectSettings.globalize_path(_frames_dir)
	var args: PackedStringArray = [
		"-y", "-framerate", str(_fps),
		"-i", cuadros_abs + "/f_%05d.png"]



	if not _pcm.is_empty():
		var bytes: int = int(round(float(_n) * float(_pcm_rate) / float(_fps))) * 8
		var pcm: PackedByteArray = _pcm.slice(0, bytes)
		pcm.resize(bytes)
		var crudo: String = _frames_dir + "/audio.f32"
		var f: FileAccess = FileAccess.open(crudo, FileAccess.WRITE)
		if f != null:
			f.store_buffer(pcm)
			f.close()
			args.append_array(["-f", "f32le", "-ar", str(_pcm_rate), "-ac", "2",
				"-i", ProjectSettings.globalize_path(crudo),
				"-c:a", "aac", "-b:a", "160k"])
	args.append_array(["-c:v", "libx264", "-pix_fmt", "yuv420p",
		"-movflags", "+faststart", salida])
	var log: Array = []
	var code: int = OS.execute(ffmpeg(), args, log, true)
	if code != 0:
		push_error("VideoSink: ffmpeg salió con %d\n%s" % [code, "\n".join(log)])
		finished.emit(false, I18n.t("No se pudo crear el video"))
		return



	if not FileAccess.file_exists(salida) or FileAccess.open(salida,
			FileAccess.READ).get_length() < 1024:
		push_error("VideoSink: ffmpeg no dejó video en %s" % salida)
		finished.emit(false, I18n.t("No se pudo crear el video"))
		return
	_borra_dir(_frames_dir)
	_frames_dir = ""
	print("VideoSink: video guardado en %s (%d cuadros)" % [salida, _n])


	if DisplayServer.get_name() != "headless":
		OS.shell_open(dir_abs)
	_ultimo = salida
	finished.emit(true, I18n.t("Guardado"))




func _carpeta_limpia() -> String:
	var base: String = DIR_ESCRITORIO + "/_frames"
	DirAccess.make_dir_recursive_absolute(base)
	_borra_dir(base)
	return base if DirAccess.dir_exists_absolute(base) else ""


func _borra_dir(path: String) -> void:
	if path.is_empty():
		return
	var d: DirAccess = DirAccess.open(path)
	if d == null:
		return
	d.list_dir_begin()
	var f: String = d.get_next()
	while f != "":
		if not d.current_is_dir():
			d.remove(f)
		f = d.get_next()
	d.list_dir_end()
