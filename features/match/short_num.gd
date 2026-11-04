class_name ShortNum



















const CAJAS: String = "res://assets/sprites/short_boxes.json"



const RES: int = 8





const NUM_ALTO: float = 3.0
const ANCHO_MAX: float = 5.0
const BORDE: float = 0.18



const CAJA_REF: Vector2 = Vector2(5.0, 5.0)
const ESCALA_MIN: float = 0.55
const ESCALA_MAX: float = 1.2













const LIENZO: int = 92



const CACHE_MAX: int = 96

static var _cache: Dictionary = {}
static var _cajas: Dictionary = {}
static var _crudas: Dictionary = {}
static var _crudas_ok: bool = false





static func textura(numero: int, receta: Dictionary) -> ImageTexture:
	if numero <= 0:
		return null
	var num: String = str(numero)
	Espalda._usar(String(receta.get("fuente", Espalda.FAM_DEF)))
	var clave: String = "%s|%s|%s|%s" % [num, Espalda._fam,
		Color(receta.get("tinta", Color.WHITE)).to_html(),
		Color(receta.get("halo", Color(0, 0, 0, 0))).to_html()]
	if _cache.has(clave):
		return Espalda._toca(_cache, clave)
	var pad: int = int(ceil(BORDE * RES)) + RES
	var w: int = int(ceil(ANCHO_MAX * RES)) + pad * 2
	var h: int = int(ceil(NUM_ALTO * RES)) + pad * 2
	var mask: PackedFloat32Array = PackedFloat32Array()
	mask.resize(w * h)




	var bb: Rect2i = Espalda._recto(mask, w, h, num, float(w) * 0.5,
		float(pad) + NUM_ALTO * RES, NUM_ALTO * RES,
		float(receta.get("track", 0.0)), ANCHO_MAX * RES)
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var tinta: Color = receta.get("tinta", Color(0.98, 0.98, 1.0))
	var halo: Color = receta.get("halo", Color(0, 0, 0, 0))
	if halo.a > 0.0:
		var r: int = maxi(int(round(BORDE * RES)), 1)
		var bo: Array = [Rect2i()]
		var an: PackedFloat32Array = Espalda._anillo(mask, w, h, r, bb, bo)
		Espalda._capa(img, an, w, h, halo, 0, 0, bo[0])
	var cb: Rect2i = bb.intersection(Rect2i(0, 0, w, h))
	for y in range(cb.position.y, cb.end.y):
		for x in range(cb.position.x, cb.end.x):
			var a: float = mask[y * w + x]
			if a > 0.0:
				Espalda._pixel(img, x, y, tinta, a)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	Espalda._guarda(_cache, clave, tex, CACHE_MAX)
	return tex






static func receta_para(cfg: Dictionary, frame: Image, caja_r: Rect2) -> Dictionary:
	var media: float = -1.0
	var rango: float = 0.0
	if frame != null and caja_r.size.x > 0.0:
		var lo: float = 1.0
		var hi: float = 0.0
		var suma: float = 0.0
		var n: int = 0
		for y in range(int(caja_r.position.y), int(caja_r.position.y + caja_r.size.y)):
			for x in range(int(caja_r.position.x), int(caja_r.position.x + caja_r.size.x)):
				if x < 0 or y < 0 or x >= frame.get_width() \
						or y >= frame.get_height():
					continue
				var c: Color = frame.get_pixel(x, y)
				if c.a <= 0.0:
					continue
				var l: float = c.get_luminance()
				suma += l
				lo = minf(lo, l)
				hi = maxf(hi, l)
				n += 1
		if n > 0:
			media = suma / float(n)
			rango = hi - lo
	if media < 0.0:
		var kit2: Color = cfg.get("kit2", Color("f0f0f0"))
		media = kit2.get_luminance()



	var sin_ink: Dictionary = cfg.duplicate()
	sin_ink.erase("num_ink")
	var rec: Dictionary = KitRecolor.dorsal_receta(sin_ink, media, rango)
	rec["track"] = float(Espalda.NUM_TRACK.get(
		String(cfg.get("num_size", "compacto")), 0.0))
	rec["fuente"] = String(cfg.get("num_font", Espalda.FAM_DEF))
	return rec



static func nodo(tex: Texture2D) -> Sprite3D:
	return Espalda.nodo(tex)





static func metrica() -> Dictionary:
	var pad: float = ceil(BORDE * RES) + RES
	return {"ancho": ANCHO_MAX + pad * 2.0 / RES,
		"alto": NUM_ALTO + pad * 2.0 / RES}






static func seguir(lamina: Sprite3D, duenio: Node3D, r: Rect2, ps: float,
		cam: Camera3D) -> void:
	if r.size.x <= 0.0 or cam == null:
		lamina.visible = false
		return
	var esc: float = clampf(r.size.x / CAJA_REF.x, ESCALA_MIN, ESCALA_MAX)
	lamina.pixel_size = ps / float(RES) * esc
	var cx_art: float = r.position.x + r.size.x * 0.5 - float(LIENZO) * 0.5
	var cy_art: float = r.position.y + r.size.y * 0.5 - float(LIENZO) * 0.5
	var off: Vector2 = Vector2(cx_art, - cy_art) * ps
	var esp: SpriteBase3D = duenio as SpriteBase3D
	if esp != null and esp.flip_h:
		off.x = - off.x



	if esp != null:
		off += Vector2(esp.offset.x *(-1.0 if esp.flip_h else 1.0), esp.offset.y) * ps
	var der: Vector3 = cam.global_transform.basis.x
	lamina.global_position = duenio.global_position \
			+ der * off.x + Vector3(0.0, off.y, 0.0) + Pecho.pellizco(duenio, cam)
	lamina.visible = true




static func caja(anim: String, i: int) -> Rect2:
	var lista: Variant = _cajas.get(anim)
	if not (lista is Array):
		return Rect2()
	var a: Array = lista
	return a[i] if i >= 0 and i < a.size() else Rect2()




static func caja_fichero(base: String) -> Rect2:
	var b: Variant = _cajas_crudas().get(base)
	if not (b is Array) or (b as Array).size() < 4:
		return Rect2()
	var a: Array = b
	return Rect2(float(a[0]), float(a[1]), float(a[2]), float(a[3]))



static func build_index(anims: Array) -> void:
	var crudas: Dictionary = _cajas_crudas()
	_cajas = {}
	for spec in anims:
		var d: Dictionary = spec
		var dirs: Array = ["south", "north", "east", "west"] \
				if bool(d.get("dirs", false)) else [""]
		for dir in dirs:
			var anim: String = String(d["anim"])
			if not dir.is_empty():
				anim = anim % dir
			var lista: Array = []
			var alguna: bool = false
			for i in range(int(d["from"]), int(d["to"]) + 1):
				var fichero: String =(String(d["path"]) % [dir, i]) \
						if not dir.is_empty() else (String(d["path"]) % i)
				var b: Variant = crudas.get(fichero.get_file().get_basename())
				if b is Array and (b as Array).size() >= 4:
					var arr: Array = b
					lista.append(Rect2(float(arr[0]), float(arr[1]),
						float(arr[2]), float(arr[3])))
					alguna = true
				else:
					lista.append(Rect2())

			if alguna:
				_cajas[anim] = lista


static func _cajas_crudas() -> Dictionary:
	if _crudas_ok:
		return _crudas
	_crudas_ok = true
	if FileAccess.file_exists(CAJAS):
		var raw: Variant = JSON.parse_string(FileAccess.get_file_as_string(CAJAS))
		if raw is Dictionary:
			_crudas = raw
	return _crudas


static func _test_reset() -> void:
	_cache.clear()
	_cajas.clear()
	_crudas.clear()
	_crudas_ok = false
