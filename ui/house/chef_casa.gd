extends RefCounted

































const RisingSpriteLib := preload("res://ui/house/rising_sprite.gd")
const LookMigracion := preload("res://features/match/look_migracion.gd")

const DIRS: Array[String] = ["south", "north", "east", "west"]
const HOJA: String = "res://assets/sprites/anim/idle_%s_%02d.png"

const SEMILLA: String = "chef_de_casa"

const CONTORNO: Color = Color("090603")
const BLANCO: Color = Color("f7f5f0")
const BLANCO_SOMBRA: Color = Color("d6d0c4")
const BLANCO_PLIEGUE: Color = Color("b3ab9e")
const BOTON: Color = Color("4a4540")

const PANTALON: Color = Color("2a2c31")



const TESTIGO_PANT: Color = Color("20e040")
const TESTIGO_CAMISA: Color = Color("e020c0")


const TESTIGO_PELO: Color = Color("2040ff")
const TESTIGO_PIEL: Color = Color("f0f020")







const SEPARA: float = 0.2
const PUNTO_BARRA: Dictionary = {"cocina_dieta": 0.29, "cocina": 0.0,
	"cocina_isla": 0.0, "cocina_ext": 0.0}





const COCINAS: Array[String] = ["cocina_dieta", "cocina", "cocina_isla", "cocina_ext"]

static var _mem: SpriteFrames = null




const REMUEVE: String = "remueve"
const REMUEVE_FPS: float = 6.0
const GIRO: Array[Vector2] = [Vector2(2, 0), Vector2(0, 1), Vector2(-2, 0), Vector2(0, -1)]




const PUNO: Vector2 = Vector2(-4.0, -6.0)
const BRAZO: float = 9.0
const ANTEBRAZO: float = 9.0
const MADERA: Color = Color("dcae6e")


const MANGA_R: float = 2.0
const MANGA_BORDE: float = 1.0



const CAZO_BAJO: float = 4.0
const CAZO_RX: float = 5.5
const CAZO_RY: float = 2.2
const CAZO_ALTO: float = 5.0
const ACERO: Color = Color("9aa3a8")
const ACERO_LUZ: Color = Color("cfd5d8")
const ACERO_SOMBRA: Color = Color("6c7479")
const CALDO: Color = Color("c9803a")
const CALDO_LUZ: Color = Color("e3a45e")

static var _boca: Vector2 = Vector2(46.5, 57.0)




static var _banda_rel: int = -1



static func cfg(pantalon: Color = PANTALON, camisa: Color = BLANCO,
		testigo: bool = false) -> Dictionary:
	var base: Dictionary = KitRecolor.appearance_for(SEMILLA, {})
	if testigo:
		base["hair"] = TESTIGO_PELO
		base["skin"] = TESTIGO_PIEL
	base["casual_top"] = "camisa"
	base["casual_shirt"] = camisa
	base["casual_outer"] = "none"
	base["casual_print"] = "solid"
	base["casual_pants"] = pantalon
	base["casual_pants_style"] = "recto"
	base["casual_pants_len"] = "largo"
	base["casual_shoes_color"] = Color("1e1e20")

	for k in ["acc_head", "acc_face", "acc_ear", "street_head", "street_face",
			"modular_head_acc", "modular_face_acc", "hair_style", "hair_tips"]:
		base.erase(k)


	base["modular_hair"] = LookMigracion.PELO_POR_DEFECTO
	return KitRecolor.sin_pelirrojo_oscuro(KitRecolor.casual_of(base))





static func frames() -> SpriteFrames:
	if _mem != null:
		return _mem
	var c: Dictionary = cfg()
	var testigo: Dictionary = cfg(TESTIGO_PANT, TESTIGO_CAMISA, true)
	var sf: SpriteFrames = SpriteFrames.new()
	_banda_rel = -1
	for d in DIRS:
		var anim: String = "idle_" + d
		sf.add_animation(anim)
		sf.set_animation_loop(anim, true)
		sf.set_animation_speed(anim, 4.5)
		for i in 4:
			var cuadro: Texture2D = cuadro_idle(d, i, c, testigo)
			if cuadro != null:
				sf.add_frame(anim, cuadro)
	sf.add_animation(REMUEVE)
	sf.set_animation_loop(REMUEVE, true)
	sf.set_animation_speed(REMUEVE, REMUEVE_FPS)
	for i in 4:
		var path: String = HOJA % ["south", i]
		if ResourceLoader.exists(path):


			var remueve: Image = _cuadro_remueve(load(path), c, testigo, i)
			sf.add_frame(REMUEVE, ImageTexture.create_from_image(remueve)
				if remueve != null else KitRecolor.apply(load(path), c))
	_mem = sf
	return sf





static func cuadro_idle(d: String, i: int, c: Dictionary = {},
		testigo: Dictionary = {}) -> Texture2D:
	var path: String = HOJA % [d, i]
	if not ResourceLoader.exists(path):
		return null
	if c.is_empty():
		c = cfg()
	if testigo.is_empty():
		testigo = cfg(TESTIGO_PANT, TESTIGO_CAMISA, true)
	var tex: Texture2D = load(path)
	var vestido: Texture2D = KitRecolor.apply(tex, c)
	var img: Image = _img(vestido)
	var img_testigo: Image = _img(KitRecolor.apply(tex, testigo)) if img != null else null
	if img_testigo == null:
		return vestido
	var marcas: Dictionary = _mascaras(img, img_testigo)
	vestir(img, marcas, d)
	return ImageTexture.create_from_image(img)



static func hechos() -> SpriteFrames:
	return _mem





static func _img(t: Texture2D) -> Image:
	var img: Image = SceneFade.imagen_copia(t)
	if img == null:
		return null
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	return img






static func _mascaras(img: Image, testigo: Image) -> Dictionary:
	var pant: Dictionary = {}
	var camisa: Dictionary = {}
	var pelo: Dictionary = {}
	var piel: Dictionary = {}
	for y in img.get_height():
		for x in img.get_width():
			var a: Color = img.get_pixel(x, y)
			var b: Color = testigo.get_pixel(x, y)
			if a.a < 0.5 or b.a < 0.5:
				continue
			if absf(a.r - b.r) + absf(a.g - b.g) + absf(a.b - b.b) < 0.18:
				continue
			var v: Vector2i = Vector2i(x, y)
			if b.r > 0.2 and absf(b.r - b.g) < 0.25 and b.b < minf(b.r, b.g) * 0.6:
				piel[v] = true
			elif b.g > b.r and b.g > b.b:
				pant[v] = true
			elif b.r > b.g and b.b > b.g:
				camisa[v] = true
			elif b.b > b.r and b.b > b.g:
				pelo[v] = true
	return {"pant": pant, "camisa": camisa, "pelo": pelo, "piel": piel}



static func vestir(img: Image, marcas: Dictionary, dir: String) -> void:
	var usado: Rect2i = img.get_used_rect()
	if usado.size.y <= 0:
		return
	var pant: Dictionary = marcas.get("pant", {})
	var camisa: Dictionary = marcas.get("camisa", {})
	var piel: Dictionary = marcas.get("piel", {})
	_sin_azul(img, camisa)
	_mandil(img, pant, camisa, piel, dir)
	if dir == "south":
		_botones(img, camisa, pant)
	_gorro(img, marcas.get("pelo", {}), piel, usado.position.y, dir)






static func _sin_azul(img: Image, camisa: Dictionary) -> void:
	for p in camisa:
		var q: Vector2i = p
		for dy in range(-2, 3):
			for dx in range(-2, 3):
				var v: Vector2i = q + Vector2i(dx, dy)
				if v.x < 0 or v.y < 0 or v.x >= img.get_width() or v.y >= img.get_height():
					continue
				var c: Color = img.get_pixelv(v)
				if c.a > 0.5 and c.b > 0.55 and c.b - c.r > 0.3 and c.g > c.r:
					img.set_pixelv(v, BLANCO_SOMBRA)









static func _gorro(img: Image, pelo: Dictionary, piel: Dictionary, corona: int,
		dir: String) -> void:
	var w: int = img.get_width()

	var x0: int = w
	var x1: int = -1
	for y in range(corona + 1, corona + 5):
		for x in w:
			if img.get_pixel(x, y).a > 0.5:
				x0 = mini(x0, x)
				x1 = maxi(x1, x)
	if x1 < x0:
		return
	var cxi: int =(x0 + x1) / 2





	var columna: int = cxi
	if dir == "east":
		columna = x1 - 2
	elif dir == "west":
		columna = x0 + 2
	var rel: int = _banda_rel
	if dir != "north" or rel < 0:
		var ultima: int = corona + 2
		for y in range(corona, corona + 10):
			var v: Vector2i = Vector2i(columna, y)
			if piel.has(v):
				break
			if pelo.has(v):
				ultima = y
		rel = clampi(ultima - corona, 2, 6)
		if dir == "south":
			_banda_rel = rel
	var bajo: int = corona + rel

	var h0: int = w
	var h1: int = -1
	for x in w:
		if img.get_pixel(x, bajo).a > 0.5:
			h0 = mini(h0, x)
			h1 = maxi(h1, x)
	if h1 < h0:
		h0 = x0
		h1 = x1
	var cx: float = float(h0 + h1) * 0.5
	var semi_b: float = float(h1 - h0) * 0.5 + 1.0
	var arriba: int = mini(bajo - 12, corona - 3)
	var forma: Dictionary = {}
	for y in range(arriba, bajo + 1):
		if y < 0:
			continue
		var k: int = y - bajo
		var semi: float = semi_b + 1.5
		if k >= -2:
			semi = semi_b
		elif k == -3:
			semi = semi_b - 0.5
		elif y == arriba:
			semi = semi_b - 0.5
		elif y == arriba + 1:
			semi = semi_b + 0.5
		for x in range(int(floor(cx - semi)), int(ceil(cx + semi)) + 1):
			if x >= 0 and x < w:
				forma[Vector2i(x, y)] = k
	for p in forma:
		var q: Vector2i = p
		var k2: int = int(forma[q])
		var borde: bool = not (forma.has(q + Vector2i.LEFT) and forma.has(q + Vector2i.RIGHT)
			and forma.has(q + Vector2i.UP) and forma.has(q + Vector2i.DOWN))
		var col: Color = BLANCO
		if borde:
			col = CONTORNO
		elif k2 == -3:
			col = BLANCO_PLIEGUE
		elif k2 <= -4 and q.y >= arriba + 2 and (q.x - int(round(cx))) % 3 == 0:
			col = BLANCO_PLIEGUE
		elif not forma.has(q + Vector2i.RIGHT * 2):

			col = BLANCO_SOMBRA
		img.set_pixelv(q, col)









static func _mandil(img: Image, pant: Dictionary, camisa: Dictionary, piel: Dictionary,
		dir: String) -> void:
	if pant.is_empty():
		return
	var filas: Dictionary = {}
	for p in pant:
		var q: Vector2i = p
		var ext: Vector2i = filas.get(q.y, Vector2i(q.x, q.x))
		filas[q.y] = Vector2i(mini(ext.x, q.x), maxi(ext.y, q.x))
	var ys: Array = filas.keys()
	ys.sort()
	var cintura: int = int(ys[0])
	var pie: int = int(ys[ys.size() - 1])
	var ext_c: Vector2i = filas[cintura]


	var cx: float = float(ext_c.x + ext_c.y) * 0.5
	if not camisa.is_empty():
		var c0: int = img.get_width()
		var c1: int = -1
		for p in camisa:
			c0 = mini(c0,(p as Vector2i).x)
			c1 = maxi(c1,(p as Vector2i).x)
		cx = float(c0 + c1) * 0.5
	var cadera: float = 0.0
	for y in range(cintura, cintura + 5):
		if filas.has(y):
			var e: Vector2i = filas[y]
			cadera = maxf(cadera, maxf(cx - float(e.x), float(e.y) - cx))
	var formas: Array = []
	match dir:
		"north":
			var cxi: int = int(round(cx))

			var cinta: Dictionary = {}
			for y in range(cintura - 1, cintura + 2):
				for x in range(int(floor(cx - cadera)), int(ceil(cx + cadera)) + 1):
					cinta[Vector2i(x, y)] = true
			formas.append(cinta)

			var lazo: Dictionary = {}
			for dy in range(-2, 3):
				for dx in range(-4, 5):
					if absi(dx) >= 1 and absi(dy) <= 2 - int(absi(dx) == 1):
						lazo[Vector2i(cxi + dx, cintura + dy)] = true
			for y in range(cintura + 1, cintura + 9):
				for dx in [-2, -1]:
					lazo[Vector2i(cxi + dx -(1 if y > cintura + 5 else 0), y)] = true
				for dx in [1, 2]:
					lazo[Vector2i(cxi + dx, y)] = true
			formas.append(lazo)
		"south":
			var faldon: Dictionary = {}
			var bajo: int = cintura + int(round(float(pie - cintura) * 0.66))
			for y in range(cintura - 1, bajo + 1):



				var vuelo: float = 1.0 if y > cintura +(bajo - cintura) / 2 else 0.0
				var semi: float = cadera - 1.5 + vuelo
				for x in range(int(floor(cx - semi)), int(ceil(cx + semi)) + 1):
					faldon[Vector2i(x, y)] = true
			formas.append(faldon)
		_:

			var este: bool = dir == "east"
			var faldon2: Dictionary = {}
			var bajo2: int = cintura + int(round(float(pie - cintura) * 0.66))
			var frente: int = -1 if este else img.get_width()
			for y in range(cintura, bajo2 + 1):
				var e1: Vector2i = filas.get(y, ext_c)
				frente = maxi(frente, e1.y + 1) if este else mini(frente, e1.x - 1)
			for y in range(cintura - 1, bajo2 + 1):
				var e2: Vector2i = filas.get(maxi(y, cintura), ext_c)
				var ancho: int = e2.y - e2.x

				var fondo: float = 0.5 if y <= cintura + 1 else 0.4
				if este:
					for x in range(e2.x + int(ancho * fondo), frente + 1):
						faldon2[Vector2i(x, y)] = true
				else:
					for x in range(frente, e2.y - int(ancho * fondo) + 1):
						faldon2[Vector2i(x, y)] = true
			formas.append(faldon2)




	var delante: Dictionary = {}
	for es_manga in [false, true]:
		for p in (camisa if es_manga else piel):
			var q: Vector2i = p
			if es_manga and q.y <= cintura:
				continue
			delante[q] = true
			for d in [Vector2i.LEFT, Vector2i.RIGHT, Vector2i.UP, Vector2i.DOWN]:
				var r: Vector2i = q + d
				if r.x < 0 or r.y < 0 or r.x >= img.get_width() or r.y >= img.get_height():
					continue
				var c: Color = img.get_pixelv(r)
				if c.a > 0.5 and c.get_luminance() < 0.12:
					delante[r] = true
	for forma in formas:
		_pinta_tela(img, forma, delante, cintura, dir != "north")




static func _pinta_tela(img: Image, forma: Dictionary, delante: Dictionary, cintura: int,
		con_cinta: bool) -> void:
	for p in forma:
		var q: Vector2i = p
		if q.x < 0 or q.y < 0 or q.x >= img.get_width() or q.y >= img.get_height():
			continue
		if delante.has(q):
			continue
		var borde: bool = not (forma.has(q + Vector2i.LEFT) and forma.has(q + Vector2i.RIGHT)
			and forma.has(q + Vector2i.UP) and forma.has(q + Vector2i.DOWN))
		var col: Color = CONTORNO if borde else BLANCO
		if not borde and con_cinta and q.y == cintura + 1:
			col = BLANCO_SOMBRA
		elif not borde and not forma.has(q + Vector2i.RIGHT * 2):
			col = BLANCO_SOMBRA
		img.set_pixelv(q, col)




static func _botones(img: Image, camisa: Dictionary, pant: Dictionary) -> void:
	if camisa.is_empty():
		return
	var arriba: int = img.get_height()
	var cintura: int = img.get_height()
	for p in pant:
		cintura = mini(cintura,(p as Vector2i).y)
	var xs: Array = []
	for p in camisa:
		var q: Vector2i = p
		arriba = mini(arriba, q.y)
		xs.append(q.x)
	xs.sort()
	var cx: int = int(xs[xs.size() / 2])
	for k in 3:
		var y: int = arriba + 5 + k * 4
		if y >= cintura - 2:
			break
		for x in [cx - 2, cx + 2]:
			if camisa.has(Vector2i(x, y)):
				img.set_pixel(x, y, BOTON)





static func sitio(plano: Dictionary) -> Dictionary:
	for kind in COCINAS:
		for prop in plano.get("props", []):
			var pr: Dictionary = prop
			if String(pr.get("kind", "")) != kind or not _en_casa(pr):
				continue
			return _sitio_de(pr, kind)
	return {}




static func _en_casa(pr: Dictionary) -> bool:
	if bool(pr.get("guardado", false)):
		return false
	var req: String = String(pr.get("req", ""))
	if not req.is_empty() and not Career.house_extras.has(req):
		return false
	var vida: String = String(pr.get("req_life", ""))
	return vida.is_empty() or Career.lifestyle.has(vida)


static func _sitio_de(pr: Dictionary, kind: String) -> Dictionary:
	return sitio_en(pr, kind, float(PUNTO_BARRA.get(kind, 0.1)))






static func sitio_en(pr: Dictionary, kind: String, punto: float) -> Dictionary:
	var r: Rect2 = pr["rect"]
	var c: Vector2 = r.get_center()



	var fab: int = int(pr.get("face_fab", House.base_face(pr)))&3
	var face: int = int(pr.get("face", fab))&3
	var giro: int =(face - fab)&3
	var eje_x: bool = House.face_axis(fab) == 0
	var s_fab: Vector2 = r.size if (giro&1) == 0 else Vector2(r.size.y, r.size.x)
	var largo: float = s_fab.x if eje_x else s_fab.y
	var fondo: float = s_fab.y if eje_x else s_fab.x
	var u: Vector2 = _girar(Vector2(1.0, 0.0) if eje_x else Vector2(0.0, 1.0), giro)
	var frente: Vector2 = House.FACE_DIR[face]
	var en_barra: Vector2 = c + u *(largo * punto)
	var pos: Vector2 = en_barra + frente *(fondo * 0.5 + SEPARA)
	return {"pos": pos, "mira": - frente, "lado": u,
		"firma": "%s|%s|%d" % [kind, str(r), face]}




static func _girar(v: Vector2, giro: int) -> Vector2:
	var ang: float = PI * 0.5 * float(giro&3)
	return Vector2(v.x * cos(ang) + v.y * sin(ang), - v.x * sin(ang) + v.y * cos(ang))






static func vapor(ps: float) -> Node3D:
	frames()
	var raiz: Node3D = Node3D.new()
	raiz.name = "Vapor"
	var x: float = -(_boca.x - 46.0) * ps
	var y: float =(46.0 - _boca.y) * ps
	var tex: ImageTexture = RisingSpriteLib.make_texture("vapor", Color("eef0f2"))
	for vi in 3:
		var vap = RisingSpriteLib.new()
		raiz.add_child(vap)



		vap.setup(tex, x, -0.06, y, 0.32, 0.32, 0.02, float(vi) / 3.0, 0.011)
	return raiz





static func _cuadro_remueve(tex: Texture2D, c: Dictionary, testigo: Dictionary, i: int) -> Image:
	var img: Image = _img(KitRecolor.apply(tex, c))
	var img_testigo: Image = _img(KitRecolor.apply(tex, testigo)) if img != null else null
	if img_testigo == null:
		return null
	var marcas: Dictionary = _mascaras(img, img_testigo)
	var w: int = img.get_width()


	var der: Dictionary = _borra_brazo(img, marcas)
	img.flip_x()
	var izq: Dictionary = _borra_brazo(img, _espeja(marcas, w))
	img.flip_x()
	if der.is_empty() or izq.is_empty():
		vestir(img, marcas, "south")
		return img
	var borrado: Dictionary =(der["borrado"] as Dictionary).duplicate()
	borrado.merge(_espeja({"b": izq["borrado"]}, w)["b"])




	vestir(img, _sin(marcas, borrado), "south")
	_recorta(img, borrado)
	var c0: int = w
	var c1: int = -1
	for p in marcas["camisa"]:
		c0 = mini(c0,(p as Vector2i).x)
		c1 = maxi(c1,(p as Vector2i).x)
	var cintura: int = img.get_height()
	for p in marcas["pant"]:
		cintura = mini(cintura,(p as Vector2i).y)
	var eje: float = float(c0 + c1) * 0.5
	var boca: Vector2 = Vector2(eje + 0.5, float(cintura) - CAZO_BAJO)
	if i == 0:
		_boca = boca
	var tono: Color = der["tono"]
	_cazo(img, boca)

	var hombro_d: Vector2 = der["hombro"]
	var asa: Vector2 = boca + Vector2(CAZO_RX + 1.0, 1.5)
	_manga(img, hombro_d, _codo(hombro_d, asa, eje), asa)
	_puno(img, asa, tono)

	var hi: Vector2 = izq["hombro"]
	var hombro_i: Vector2 = Vector2(float(w - 1) - hi.x, hi.y)
	var punta: Vector2 = boca + GIRO[i]
	var puno: Vector2 = punta + PUNO
	_manga(img, hombro_i, _codo(hombro_i, puno, eje), puno)
	_cuchara(img, punta, puno)
	_puno(img, puno, tono)
	return img






static func _cazo(img: Image, boca: Vector2) -> void:
	var w: int = img.get_width()
	var h: int = img.get_height()
	var forma: Dictionary = {}
	var culo: float = boca.y + CAZO_ALTO
	for y in range(int(boca.y - CAZO_RY) - 1, int(culo + CAZO_RY) + 2):
		for x in range(int(boca.x - CAZO_RX) - 1, int(boca.x + CAZO_RX) + 2):
			var fx: float = float(x) + 0.5 - boca.x
			var fy: float = float(y) + 0.5
			var dx: float = fx / CAZO_RX
			var en_boca: bool = dx * dx + pow((fy - boca.y) / CAZO_RY, 2) <= 1.0
			var en_culo: bool = dx * dx + pow((fy - culo) / CAZO_RY, 2) <= 1.0
			var pared: bool = absf(dx) <= 1.0 and fy >= boca.y and fy <= culo
			if not (en_boca or en_culo or pared):
				continue
			var col: Color = ACERO
			if en_boca:
				var ix: float = fx /(CAZO_RX - 1.4)
				var iy: float =(fy - boca.y) /(CAZO_RY - 0.9)
				col = CALDO if ix * ix + iy * iy <= 1.0 else ACERO_LUZ
			elif dx > 0.5:
				col = ACERO_SOMBRA
			elif dx < -0.55:
				col = ACERO_LUZ
			forma[Vector2i(x, y)] = col
	for q in forma:
		var v: Vector2i = q
		if v.x >= 0 and v.y >= 0 and v.x < w and v.y < h:
			img.set_pixelv(v, forma[q])

	var brillo: Vector2i = Vector2i(int(boca.x - 2.0), int(boca.y - 0.5))
	if forma.get(brillo, ACERO) == CALDO:
		img.set_pixelv(brillo, CALDO_LUZ)

	for lado in [-1, 1]:
		for k in 2:
			var a: Vector2i = Vector2i(int(boca.x + float(lado) *(CAZO_RX + 0.5 + float(k))), int(boca.y + 1.5))
			if a.x >= 0 and a.x < w:
				forma[a] = CONTORNO
				img.set_pixelv(a, CONTORNO)
	for q in forma:
		for d in [Vector2i.LEFT, Vector2i.UP, Vector2i.RIGHT, Vector2i.DOWN]:
			var n: Vector2i =(q as Vector2i) + d
			if n.x >= 0 and n.y >= 0 and n.x < w and n.y < h and not forma.has(n):
				img.set_pixelv(n, CONTORNO)





static func _codo(hombro: Vector2, mano: Vector2, eje: float) -> Vector2:
	var v: Vector2 = mano - hombro
	var d: float = clampf(v.length(), 1.0, BRAZO + ANTEBRAZO - 0.01)
	var ang: float = acos(clampf((BRAZO * BRAZO + d * d - ANTEBRAZO * ANTEBRAZO) /(2.0 * BRAZO * d), -1.0, 1.0))
	var e1: Vector2 = hombro + v.normalized().rotated(ang) * BRAZO
	var e2: Vector2 = hombro + v.normalized().rotated(- ang) * BRAZO
	return e1 if absf(e1.x - eje) > absf(e2.x - eje) else e2





static func _manga(img: Image, hombro: Vector2, codo: Vector2, mano: Vector2) -> void:
	var w: int = img.get_width()
	var h: int = img.get_height()
	var tela: Dictionary = {}
	var borde: Dictionary = {}
	var r0: Rect2 = Rect2(hombro, Vector2.ZERO).expand(codo).expand(mano).grow(MANGA_R + MANGA_BORDE + 1.0)
	for y in range(maxi(0, int(r0.position.y)), mini(h, int(r0.end.y) + 1)):
		for x in range(maxi(0, int(r0.position.x)), mini(w, int(r0.end.x) + 1)):
			var p: Vector2 = Vector2(x, y) + Vector2(0.5, 0.5)
			var r: float = minf(_a_segmento(p, hombro, codo), _a_segmento(p, codo, mano))
			if r <= MANGA_R:
				tela[Vector2i(x, y)] = true
			elif r <= MANGA_R + MANGA_BORDE:
				borde[Vector2i(x, y)] = true
	for q in borde:
		if (Vector2(q) + Vector2(0.5, 0.5)).distance_to(hombro) < MANGA_R + 2.5 and img.get_pixelv(q).a > 0.5:
			continue
		img.set_pixelv(q, CONTORNO)
	for q in tela:
		var sombra: bool = not tela.has(q + Vector2i(1, 0)) or not tela.has(q + Vector2i(0, 1))
		img.set_pixelv(q, BLANCO_SOMBRA if sombra else BLANCO)



static func _cuchara(img: Image, punta: Vector2, puno: Vector2) -> void:
	var w: int = img.get_width()
	var h: int = img.get_height()
	var cabo: Vector2 = puno +(puno - punta).normalized() * 3.0
	var pasos: int = int(ceil(cabo.distance_to(punta))) * 2
	for k in pasos + 1:
		var p: Vector2 = punta.lerp(cabo, float(k) / float(pasos))
		var q: Vector2i = Vector2i(int(floor(p.x)), int(floor(p.y)))
		if q.x < 0 or q.y < 0 or q.x >= w or q.y >= h:
			continue
		img.set_pixelv(q, MADERA)
		for lado in [Vector2i(1, 0), Vector2i(-1, 0)]:
			var n: Vector2i = q + lado
			if n.x >= 0 and n.x < w and img.get_pixelv(n).a < 0.5:
				img.set_pixelv(n, CONTORNO)



static func _puno(img: Image, centro: Vector2, tono: Color) -> void:
	var w: int = img.get_width()
	var h: int = img.get_height()
	for y in range(int(centro.y) - 3, int(centro.y) + 4):
		for x in range(int(centro.x) - 3, int(centro.x) + 4):
			if x < 0 or y < 0 or x >= w or y >= h:
				continue
			var dd: float =(Vector2(x, y) + Vector2(0.5, 0.5)).distance_to(centro)
			if dd <= 1.7:
				img.set_pixel(x, y, tono)
			elif dd <= 2.7 and not img.get_pixel(x, y).is_equal_approx(MADERA):
				img.set_pixel(x, y, CONTORNO)





static func _recorta(img: Image, borrado: Dictionary) -> void:
	var w: int = img.get_width()
	var h: int = img.get_height()
	var nuevos: Array = []
	for q in borrado:
		if img.get_pixelv(q).a > 0.5:
			continue
		for d in [Vector2i.LEFT, Vector2i.UP, Vector2i.RIGHT, Vector2i.DOWN]:
			var n: Vector2i = q + d
			if n.x < 0 or n.y < 0 or n.x >= w or n.y >= h:
				continue
			var cn: Color = img.get_pixelv(n)
			if cn.a > 0.5 and not _oscuro(cn):
				nuevos.append(q)
				break
	for q in nuevos:
		img.set_pixelv(q, CONTORNO)


static func _sin(marcas: Dictionary, quita: Dictionary) -> Dictionary:
	var cintura: int = 1<<20
	for p in marcas.get("pant", {}):
		cintura = mini(cintura,(p as Vector2i).y)
	var out: Dictionary = marcas.duplicate()
	for k in ["piel", "camisa"]:
		var m: Dictionary =(marcas.get(k, {}) as Dictionary).duplicate()
		for q in quita:
			if k != "camisa" or (q as Vector2i).y >= cintura:
				m.erase(q)
		out[k] = m
	return out


static func _espeja(marcas: Dictionary, w: int) -> Dictionary:
	var out: Dictionary = {}
	for k in marcas:
		var m: Dictionary = {}
		for p in marcas[k]:
			m[Vector2i(w - 1 -(p as Vector2i).x,(p as Vector2i).y)] = true
		out[k] = m
	return out


static func _oscuro(c: Color) -> bool:
	return c.a > 0.5 and c.get_luminance() < 0.14






static func _borra_brazo(img: Image, marcas: Dictionary) -> Dictionary:
	var w: int = img.get_width()
	var h: int = img.get_height()
	var camisa: Dictionary = marcas.get("camisa", {})
	var piel: Dictionary = marcas.get("piel", {})
	if camisa.is_empty():
		return {}
	var c0: int = w
	var c1: int = -1
	var arriba: int = h
	for p in camisa:
		var q: Vector2i = p
		c0 = mini(c0, q.x)
		c1 = maxi(c1, q.x)
		arriba = mini(arriba, q.y)
	var cx: int =(c0 + c1) / 2


	var cuenta: Dictionary = {}
	var fondo_mano: int = -1
	for p in piel:
		var q: Vector2i = p
		var col: Color = img.get_pixelv(q)
		cuenta[col] = int(cuenta.get(col, 0)) + 1
		if q.x > cx + 5 and q.y > arriba + 8:
			fondo_mano = maxi(fondo_mano, q.y)
	if fondo_mano < 0:
		return {}
	var tono: Color = BLANCO
	var mejor: int = 0
	for col in cuenta:
		if int(cuenta[col]) > mejor:
			mejor = int(cuenta[col])
			tono = col




	var seps: Dictionary = {}
	var votos: Dictionary = {}
	for y in range(arriba + 3, mini(h, fondo_mano + 2)):
		var sep: int = _separa(img, cx, y)
		if sep >= 0:
			seps[y] = sep
			votos[sep] = int(votos.get(sep, 0)) + 1
	if seps.is_empty():
		return {}
	var sobaco: int = h
	for y in seps:
		sobaco = mini(sobaco, int(y))
	var corte: int = -1
	var mas: int = 0
	for x in votos:
		if int(votos[x]) > mas:
			mas = int(votos[x])
			corte = int(x)
	var borrado: Dictionary = {}
	for y in range(sobaco, mini(h, fondo_mano + 5)):


		var desde: int = corte if y <= fondo_mano else corte + 2
		for x in range(desde + 1, w):
			if img.get_pixel(x, y).a > 0.5:
				img.set_pixel(x, y, Color(0, 0, 0, 0))
				borrado[Vector2i(x, y)] = true


	for p in piel:
		var q: Vector2i = p
		if q.x > cx + 5 and q.y > arriba + 8 and not borrado.has(q):
			img.set_pixelv(q, CONTORNO)
			borrado[q] = true
	var hx: int = -1
	for y in range(maxi(0, sobaco - 3), sobaco):
		for x in range(cx, w):
			var cc: Color = img.get_pixel(x, y)
			if cc.a > 0.5 and not _oscuro(cc):
				hx = maxi(hx, x)
	return {"hombro": Vector2(float(hx) - 1.5, float(sobaco) - 2.5), "tono": tono,
		"borrado": borrado}




static func _separa(img: Image, cx: int, y: int) -> int:
	var w: int = img.get_width()
	for x in range(cx + 1, w - 1):
		var a: Color = img.get_pixel(x, y)
		if a.a < 0.5:
			return -1
		var izq: Color = img.get_pixel(x - 1, y)
		if _oscuro(a) and izq.a > 0.5 and not _oscuro(izq):
			for x2 in range(x + 1, mini(w, x + 4)):
				var b: Color = img.get_pixel(x2, y)
				if b.a > 0.5 and not _oscuro(b):
					return x
			return -1
	return -1


static func _a_segmento(p: Vector2, a: Vector2, b: Vector2) -> float:
	var ab: Vector2 = b - a
	var t: float = clampf((p - a).dot(ab) / maxf(ab.length_squared(), 0.0001), 0.0, 1.0)
	return p.distance_to(a + ab * t)
