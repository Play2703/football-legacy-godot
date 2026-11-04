class_name CuadroAtlas
extends RefCounted









































const META: String = "cuadro_atlas"
const META_IMG: String = "img_atlas"


const MAX_CELDAS: int = 24


const RELLENO_MIN: float = 0.25




static var _scr: GDScript = null

var _frames: WeakRef = null


var _pend: Dictionary = {}


var _por_tex: Dictionary = {}


var _cerrar: bool = false

var paginas: int = 0
var celdas_selladas: int = 0
var ultimo_sello_us: int = 0



static func de(frames: SpriteFrames) -> CuadroAtlas:
	if frames == null:
		return null


	var v: Variant = frames.get_meta(META) if frames.has_meta(META) else null
	if v is CuadroAtlas:
		return v


	KitRecolor.candado_toma()
	if _scr == null:
		_scr = load("res://features/match/cuadro_atlas.gd")
	var a: CuadroAtlas = _scr.new()
	KitRecolor.candado_suelta()
	a._frames = weakref(frames)
	frames.set_meta(META, a)
	return a



static func existente(frames: SpriteFrames) -> CuadroAtlas:
	if frames == null:
		return null


	var v: Variant = frames.get_meta(META) if frames.has_meta(META) else null
	return v if v is CuadroAtlas else null



static func lado_metal(n: int) -> int:
	if n <= 64:
		return maxi(1, nearest_po2(n))
	return ((n + 63) / 64) * 64









static var _rejillas: Dictionary = {}
static func _rejilla(w: int, h: int) -> Vector2i:
	if w <= 0 or h <= 0:
		return Vector2i.ZERO


	KitRecolor.candado_toma()
	var r: Vector2i = _rejilla_sin_candado(w, h)
	KitRecolor.candado_suelta()
	return r


static func _rejilla_sin_candado(w: int, h: int) -> Vector2i:
	var llave: Vector2i = Vector2i(w, h)
	var hecha: Variant = _rejillas.get(llave)
	if hecha != null:
		return hecha
	var suelto: float = float(w * h) / float(lado_metal(w) * lado_metal(h))
	var mejor: Vector2i = Vector2i.ZERO
	if 1.0 - suelto > RELLENO_MIN:
		var mejor_e: float = suelto
		var mejor_n: int = 1
		for c in range(MAX_CELDAS, 0, -1):
			for f in range(1, MAX_CELDAS / c + 1):
				if c * f < 2:
					continue
				var e: float = float(c * f * w * h) \
						/ float(lado_metal(c * w) * lado_metal(f * h))
				if e > mejor_e + 1e-09 or (absf(e - mejor_e) <= 1e-09 and c * f > mejor_n):
					mejor_e = e
					mejor_n = c * f
					mejor = Vector2i(c, f)
	_rejillas[llave] = mejor
	return mejor





func ofrece(anim: StringName, idx: int, tex: Texture2D) -> bool:
	if tex == null:
		return false
	var iid: int = tex.get_instance_id()
	var celda: Variant = _por_tex.get(iid)
	if celda != null:
		((celda as Dictionary)["refs"] as Array).append([anim, idx])
		return false
	if not tex.has_meta(META_IMG):
		return false


	var img: Variant = tex.get_meta(META_IMG)
	if not (img is Image):
		tex.remove_meta(META_IMG)
		return false
	var im: Image = img



	if im.get_format() != Image.FORMAT_RGBA8 or im.has_mipmaps() \
			or im.get_size() != Vector2i(tex.get_size()):
		tex.remove_meta(META_IMG)
		return false
	var tam: Vector2i = im.get_size()
	var rej: Vector2i = _rejilla(tam.x, tam.y)
	if rej == Vector2i.ZERO:
		tex.remove_meta(META_IMG)
		return false
	var nueva: Dictionary = {"tex": tex, "img": im, "refs": [[anim, idx]]}
	_por_tex[iid] = nueva
	var lista: Array = _pend.get(tam, [])
	lista.append(nueva)
	_pend[tam] = lista
	return lista.size() >= rej.x * rej.y



func cierra() -> void:
	_cerrar = true



func hay_pagina() -> bool:
	for tam in _pend:
		var n: int =(_pend[tam] as Array).size()
		if n == 0:
			continue
		if _cerrar:
			return true
		var rej: Vector2i = _rejilla(tam.x, tam.y)
		if n >= rej.x * rej.y:
			return true
	if _cerrar:
		_cerrar = false
	return false



func pendientes() -> int:
	var n: int = 0
	for tam in _pend:
		n +=(_pend[tam] as Array).size()
	return n









func sella_una() -> bool:
	var t0: int = Time.get_ticks_usec()
	var frames: SpriteFrames = _frames.get_ref() as SpriteFrames if _frames != null else null
	if frames == null:
		_pend.clear()
		_por_tex.clear()
		return false
	var tam: Vector2i = Vector2i.ZERO
	var toma: int = 0
	var rej: Vector2i = Vector2i.ZERO
	for t in _pend:
		var n: int =(_pend[t] as Array).size()
		if n == 0:
			continue
		var r: Vector2i = _rejilla(t.x, t.y)
		var cap: int = r.x * r.y
		if n >= cap or _cerrar:
			tam = t
			rej = r
			toma = mini(n, cap)
			break
	if toma == 0:
		_cerrar = false
		return false
	var lista: Array = _pend[tam]
	var celdas: Array = lista.slice(0, toma)
	_pend[tam] = lista.slice(toma)


	var cols: int = mini(rej.x, toma)
	var filas: int =(toma + cols - 1) / cols
	var pag_img: Image = Image.create(cols * tam.x, filas * tam.y, false, Image.FORMAT_RGBA8)
	for i in toma:
		var c: Dictionary = celdas[i]
		pag_img.blit_rect(c["img"], Rect2i(Vector2i.ZERO, tam),
			Vector2i((i % cols) * tam.x,(i / cols) * tam.y))
	var pag: ImageTexture = ImageTexture.create_from_image(pag_img)
	frames.set_block_signals(true)
	for i in toma:
		var c: Dictionary = celdas[i]
		var tex: Texture2D = c["tex"]
		var at: AtlasTexture = AtlasTexture.new()
		at.atlas = pag
		at.region = Rect2(Vector2((i % cols) * tam.x,(i / cols) * tam.y), Vector2(tam))
		for ref in c["refs"]:
			var anim: StringName = ref[0]
			var idx: int = ref[1]


			if frames.has_animation(anim) and idx < frames.get_frame_count(anim) \
					and is_same(frames.get_frame_texture(anim, idx), tex):
				frames.set_frame(anim, idx, at, frames.get_frame_duration(anim, idx))
		_por_tex.erase(tex.get_instance_id())
	frames.set_block_signals(false)
	frames.emit_changed()


	for c in celdas:
		KitRecolor.suelta(c["tex"])
	paginas += 1
	celdas_selladas += toma
	ultimo_sello_us = int(Time.get_ticks_usec() - t0)
	return true



func sella_todo() -> void:
	cierra()
	while sella_una():
		pass
	_cerrar = false
