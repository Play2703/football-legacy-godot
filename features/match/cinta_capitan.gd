class_name CintaCapitan
extends RefCounted




























const TABLA: String = "res://assets/cinta_capitan.json"
const ATLAS: String = "res://assets/cinta_capitan.png"



const _PAPELES: Array[int] = [50, 100, 150, 200, 250]

static var _leido: bool = false
static var _celda: int = 32
static var _lado: int = 16
static var _cols: int = 24

static var _cuadros: Dictionary = {}
static var _atlas: Image = null

static var _indice: Dictionary = {}

static var _tex: Dictionary = {}


static func _lee() -> void:
	if _leido:
		return
	_leido = true
	var d: Variant = JSON.parse_string(FileAccess.get_file_as_string(TABLA))
	if not (d is Dictionary):
		return
	var dic: Dictionary = d
	_celda = int(dic.get("celda", 32))
	_lado = int(dic.get("lado", 16))
	_cols = maxi(1, int(dic.get("cols", 24)))
	if dic.get("cuadros") is Dictionary:
		_cuadros = dic["cuadros"]
	var t: Texture2D = load(ATLAS) as Texture2D
	if t != null:
		_atlas = t.get_image()
		if _atlas != null:
			if _atlas.is_compressed():
				_atlas.decompress()
			_atlas.convert(Image.FORMAT_RGBA8)




static func build_index(anims: Array) -> void:
	_lee()
	_indice.clear()
	for spec in anims:
		if not (spec is Dictionary):
			continue
		var d: Dictionary = spec
		var dirs: Array = ["south", "north", "east", "west"] \
				if bool(d.get("dirs", false)) else [""]
		for dir in dirs:
			var anim: String = String(d.get("anim", ""))
			if anim.is_empty():
				continue
			if not dir.is_empty():
				anim = anim % dir
			var lista: PackedStringArray = PackedStringArray()
			var alguno: bool = false
			for i in range(int(d.get("from", 0)), int(d.get("to", 0)) + 1):
				var fichero: String =(String(d.get("path", "")) % [dir, i]) \
						if not dir.is_empty() else (String(d.get("path", "")) % i)
				var cuadro: String = fichero.get_file().get_basename()
				if _cuadros.has(cuadro):
					alguno = true
				lista.append(cuadro)


			if alguno:
				_indice[anim] = lista



static func cuadro_de(anim: String, i: int) -> String:
	var lista: Variant = _indice.get(anim)
	if not (lista is PackedStringArray):
		return ""
	var a: PackedStringArray = lista
	return a[i] if i >= 0 and i < a.size() else ""




static func rect_de(cuadro: String) -> Rect2:
	_lee()
	var v: Variant = _cuadros.get(cuadro)
	if not (v is Array) or (v as Array).size() < 3:
		return Rect2()
	var a: Array = v
	return Rect2(float(a[1]), float(a[2]), float(_lado), float(_lado))



static func textura(cuadro: String, banda: Color) -> Texture2D:
	_lee()
	var v: Variant = _cuadros.get(cuadro)
	if _atlas == null or not (v is Array):
		return null
	var llave: String = "%s|%s" % [cuadro, banda.to_html(false)]
	if _tex.has(llave):
		return _tex[llave]
	var n: int = int((v as Array)[0])
	var ox: int =(n % _cols) * _celda
	var oy: int = int(n / float(_cols)) * _celda
	if ox + _celda > _atlas.get_width() or oy + _celda > _atlas.get_height():
		return null


	var tonos: Array[Color] = [
		banda.darkened(ArmbandArt.EDGE_DARK),
		banda.lightened(ArmbandArt.HILITE),
		banda,
		banda.darkened(ArmbandArt.SHADE_DARK),
		ArmbandArt._contrast(banda),
	]
	var img: Image = Image.create(_celda, _celda, false, Image.FORMAT_RGBA8)
	for y in _celda:
		for x in _celda:
			var p: Color = _atlas.get_pixel(ox + x, oy + y)
			if p.a < 0.5:
				continue
			var r: int = int(round(p.r * 255.0))
			var mejor: int = 0
			for k in _PAPELES.size():
				if absi(_PAPELES[k] - r) < absi(_PAPELES[mejor] - r):
					mejor = k
			img.set_pixel(x, y, tonos[mejor])
	var t: ImageTexture = ImageTexture.create_from_image(img)
	_tex[llave] = t
	return t





static func nodo() -> Sprite3D:
	var s: Sprite3D = Pecho.nodo(null)
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.set_meta("cinta_capitan", true)
	return s




static func seguir(lamina: Sprite3D, duenio: AnimatedSprite3D, banda: Color,
		cam: Camera3D) -> void:
	var cuadro: String = cuadro_de(duenio.animation, duenio.frame)
	var tex: Texture2D = textura(cuadro, banda) if not cuadro.is_empty() else null
	if tex == null:
		lamina.visible = false
		return
	lamina.texture = tex



	lamina.flip_h = duenio.flip_h
	Pecho.seguir(lamina, duenio, rect_de(cuadro), duenio.pixel_size, cam)



static func invalida() -> void:
	_leido = false
	_cuadros = {}
	_atlas = null
	_tex.clear()
	_indice.clear()
