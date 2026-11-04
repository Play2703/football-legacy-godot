class_name Pecho
extends RefCounted
































const ANCLAS: String = "res://assets/sprites/pecho_anclas.json"
const CAJAS: String = "res://assets/sprites/pecho_boxes.json"













const HACIA_MIN: float = 0.06
const HACIA_MAX: float = 0.35
const HACIA_POR_M: float = 0.013



const LIENZO: int = 92



const CONTRASTE_MIN: float = 0.28
const VISIBLE_MIN: float = 0.7



const HALO_FRAC: float = 0.02



const CMP_AIRE: float = 0.25





const ESC_ESCALA: float = 0.85
const CMP_MIN: float = 1.5
const CMP_ESCALA: float = 0.9
const CMP_BAJA: float = 1.0





const PAT_CRECE: float = 2.0




const TROFEO_PX: int = 64


const TROFEO_OSCURO: Color = Color(0.72, 0.67, 0.5)

const SIN_MEDALLON: String = "-sin-medallon-"

static var _cargadas: bool = false
static var _anclas: Dictionary = {}
static var _cajas: Dictionary = {}



static var _indice: Dictionary = {}


static var _tenidas: Dictionary = {}



static var _trofeos: Dictionary = {}








static func build_index(anims: Array) -> void:
	_ensure_tablas()
	_indice = {}
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
				var fichero: String =(String(d["path"]) % [dir, i]) if not dir.is_empty() \
						else (String(d["path"]) % i)
				var par: Dictionary = _rects_de(fichero.get_basename())
				if not par.is_empty():
					alguna = true
				lista.append(par)



			if alguna:
				_indice[anim] = lista





static func rects(anim: String, i: int) -> Dictionary:
	var lista: Variant = _indice.get(anim)
	if not (lista is Array):
		return {}
	var a: Array = lista
	return a[i] if i >= 0 and i < a.size() else {}










static func rects_base(base: String) -> Dictionary:
	_ensure_tablas()
	return _rects_de(base)











static func nodo(tex: Texture2D) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = tex





	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.visible = false




	s.set_meta("pecho_lamina", true)
	return s










static func seguir(lamina: Sprite3D, duenio: Node3D, r: Rect2, ps: float,
		cam: Camera3D, crece_alto: float = 1.0) -> void:
	if r.size.x <= 0.0 or not duenio.visible:
		lamina.visible = false
		return
	var ts: Vector2 = lamina.texture.get_size() if lamina.texture != null else Vector2.ZERO
	if ts.x <= 0.0 or ts.y <= 0.0:
		lamina.visible = false
		return

	if crece_alto > 1.0:
		r.size.y = clampf(r.size.x * ts.y / ts.x, r.size.y, r.size.y * crece_alto)



	lamina.pixel_size = minf(r.size.x * ps / ts.x, r.size.y * ps / ts.y)
	var right: Vector3 = Vector3.RIGHT if cam == null else cam.global_transform.basis.x
	right.y = 0.0
	if right.length_squared() < 0.0001:
		right = Vector3.RIGHT
	var hacia: Vector3 = pellizco(duenio, cam)
	var off: Vector2 = offset(r, ps)










	var esp: SpriteBase3D = duenio as SpriteBase3D
	if esp != null and esp.flip_h:
		off.x = - off.x



	if esp != null:
		off += Vector2(esp.offset.x *(-1.0 if esp.flip_h else 1.0), esp.offset.y) * ps
	lamina.global_position = duenio.global_position \
			+ right.normalized() * off.x + Vector3(0.0, off.y, 0.0) + hacia
	lamina.visible = true











static func pellizco(duenio: Node3D, cam: Camera3D) -> Vector3:
	if cam == null:
		return Vector3.ZERO
	var v: Vector3 = cam.global_position - duenio.global_position
	var dist: float = v.length()
	v.y = 0.0
	if v.length_squared() <= 0.0001:
		return Vector3.ZERO
	return v.normalized() * clampf(dist * HACIA_POR_M, HACIA_MIN, HACIA_MAX)






static func offset(r: Rect2, ps: float) -> Vector2:
	var medio: float = float(LIENZO) * 0.5
	var c: Vector2 = r.position + r.size * 0.5
	return Vector2((c.x - medio) * ps,(medio - c.y) * ps)





























static func marca_para(tex: Texture2D, cfg: Dictionary,
		pieza: String = "") -> Texture2D:
	if tex == null:
		return null
	var llave: String = _llave_marca(tex, cfg, pieza)
	if _tenidas.has(llave):
		return _tenidas[llave]
	var t: Dictionary = tinta_para(tex, cfg, pieza)
	var tinta: Color = t["tinta"]
	var halo: Color = t["halo"]
	var out: Texture2D = tex


	if tinta.a > 0.0 or halo.a > 0.0:




		var cruda: Image = SceneFade.imagen(tex)
		if cruda == null:
			return tex
		out = ImageTexture.create_from_image(_pintada(cruda, tinta, halo))
	if _tenidas.size() > 64:
		_tenidas.clear()
	_tenidas[llave] = out
	return out





static func _llave_marca(tex: Texture2D, cfg: Dictionary,
		pieza: String = "") -> String:
	var id: String = tex.resource_path if tex.resource_path != "" \
			else str(tex.get_instance_id())






	var fijo: Variant = cfg.get(pieza + "_ink") if not pieza.is_empty() else null
	if fijo is Color:
		return "%s|%s|#%s" % [id, pieza,(fijo as Color).to_html(false)]
	var kit: Color = cfg.get("kit", Color.WHITE)




	var bib: Variant = cfg.get("bib")
	var sufijo: String =("|b" +(bib as Color).to_html()) if bib is Color else ""
	if not cfg.has("pattern"):
		return "%s|%s%s" % [id, kit.to_html(), sufijo]
	var kb: Color = cfg.get("kit_b", cfg.get("kit2", kit))
	return "%s|%s|%s%s" % [id, kit.to_html(), kb.to_html(), sufijo]

















static func tinta_para(marca: Texture2D, cfg: Dictionary,
		pieza: String = "") -> Dictionary:
	if not pieza.is_empty():
		var fijo: Variant = cfg.get(pieza + "_ink")
		if fijo is Color:
			return {"tinta": fijo, "halo": Color(0, 0, 0, 0)}
	var kit: Color = cfg.get("kit", Color.WHITE)
	var fondos: Array[Color] = [kit]
	if cfg.has("pattern"):
		fondos.append(cfg.get("kit_b", cfg.get("kit2", kit)))







	var bib: Variant = cfg.get("bib")
	if bib is Color:
		fondos.append(bib)
	var media: float = 0.0
	for c in fondos:
		media += c.get_luminance()
	media /= float(fondos.size())
	var oscuro: Color = Color(0.06, 0.06, 0.07)
	var claro: Color = Color(1, 1, 1)






	var corte: float =(claro.get_luminance() + oscuro.get_luminance()) * 0.5








	if _se_defiende(marca, fondos):
		return {"tinta": Color(0, 0, 0, 0), "halo": Color(0, 0, 0, 0)}
	var tinta: Color = claro if media < corte else oscuro















	var halo: Color = Color(0, 0, 0, 0)
	var lt: float = tinta.get_luminance()


	var claras: int = 0
	for c in fondos:
		if c.get_luminance() >= 0.5:
			claras += 1
		if absf(lt - c.get_luminance()) < CONTRASTE_MIN:
			halo = oscuro if tinta == claro else claro
	if halo.a == 0.0 and claras > 0 and claras < fondos.size():
		halo = oscuro if tinta == claro else claro
	return {"tinta": tinta, "halo": halo}












static func _se_defiende(marca: Texture2D, fondos: Array[Color]) -> bool:
	var img: Image = marca.get_image()
	if img == null:
		return false
	for f in fondos:
		var lf: float = f.get_luminance()
		var n: int = 0
		var vistos: int = 0







		for y in range(0, img.get_height(), 2):
			for x in range(0, img.get_width(), 2):
				var c: Color = img.get_pixel(x, y)
				if c.a > 0.6:
					n += 1
					if absf(c.get_luminance() - lf) >= CONTRASTE_MIN:
						vistos += 1
		if n == 0 or float(vistos) / float(n) < VISIBLE_MIN:
			return false
	return true




static func _pintada(src: Image, tinta: Color, halo: Color) -> Image:
	src.convert(Image.FORMAT_RGBA8)
	var w: int = src.get_width()
	var h: int = src.get_height()
	var d: int = maxi(1, int(round(float(maxi(w, h)) * HALO_FRAC)))
	var out: Image = Image.create(w + d * 2, h + d * 2, false, Image.FORMAT_RGBA8)
	out.fill(Color(0, 0, 0, 0))
	if halo.a > 0.0:
		var hi: Image = _repintada(src, halo)
		for off in [Vector2i(0, d), Vector2i(d * 2, d), Vector2i(d, 0), Vector2i(d, d * 2)]:
			out.blend_rect(hi, Rect2i(Vector2i.ZERO, hi.get_size()), off)
	var cuerpo: Image = _repintada(src, tinta) if tinta.a > 0.0 else src
	out.blend_rect(cuerpo, Rect2i(Vector2i.ZERO, cuerpo.get_size()), Vector2i(d, d))
	return out


static func _repintada(src: Image, col: Color) -> Image:
	var out: Image = src.duplicate()
	for y in out.get_height():
		for x in out.get_width():
			var c: Color = out.get_pixel(x, y)
			if c.a > 0.0:
				out.set_pixel(x, y, Color(col.r, col.g, col.b, c.a))
	return out
































const FONDO_INSET: int = 2




const FONDO_BORDE_MIN: float = 0.9






const FONDO_LISO_MIN: float = 0.8






const FONDO_TOL: float = 0.1









const FONDO_QUITADO_MIN: float = 0.45


const FONDO_QUITADO_MAX: float = 0.985


































static func logo_limpio(src: Image, _reintento: int = 0) -> Image:
	if src == null:
		return null
	var w: int = src.get_width()
	var h: int = src.get_height()
	if w - 2 * FONDO_INSET < 3 or h - 2 * FONDO_INSET < 3:
		return src
	var img: Image = src.duplicate()
	img.convert(Image.FORMAT_RGBA8)
	var px: PackedByteArray = img.get_data()
	var fondo: Dictionary = _fondo_de(px, w, h)
	if fondo.is_empty():
		return src
	if bool(fondo.get("foto", false)):
		return null
	var fr: float = fondo["r"]
	var fg: float = fondo["g"]
	var fb: float = fondo["b"]


	var tol: float = FONDO_TOL * 255.0
	var quitados: int = 0
	var x0: int = w
	var y0: int = h
	var x1: int = -1
	var y1: int = -1
	for y in h:
		for x in w:
			var b: int =(y * w + x) * 4
			if px[b + 3] == 0:
				continue
			if absf(float(px[b]) - fr) <= tol and absf(float(px[b + 1]) - fg) <= tol \
					and absf(float(px[b + 2]) - fb) <= tol:
				px[b + 3] = 0
				quitados += 1
				continue
			x0 = mini(x0, x)
			y0 = mini(y0, y)
			x1 = maxi(x1, x)
			y1 = maxi(y1, y)
	if x1 < x0 or y1 < y0:
		return src
	var caja: Rect2i = Rect2i(x0, y0, x1 - x0 + 1, y1 - y0 + 1)
	var frac: float = float(quitados) / float(w * h)
	if frac > FONDO_QUITADO_MAX:
		return src
	if frac < FONDO_QUITADO_MIN:






		if _reintento > 0 or caja.size.x * caja.size.y >= int(float(w * h) * 0.98):
			return src
		return logo_limpio(src.get_region(caja), _reintento + 1)
	return Image.create_from_data(w, h, false, Image.FORMAT_RGBA8, px).get_region(caja)










static func _fondo_de(px: PackedByteArray, w: int, h: int) -> Dictionary:
	var ins: int = FONDO_INSET
	var anillo: PackedInt32Array = PackedInt32Array()
	for x in range(ins, w - ins):
		anillo.append(ins * w + x)
		anillo.append((h - 1 - ins) * w + x)
	for y in range(ins + 1, h - 1 - ins):
		anillo.append(y * w + ins)
		anillo.append(y * w + w - 1 - ins)
	var opacos: PackedInt32Array = PackedInt32Array()
	for i in anillo:
		if px[i * 4 + 3] > 153:
			opacos.append(i)
	if opacos.is_empty() \
			or float(opacos.size()) < float(anillo.size()) * FONDO_BORDE_MIN:
		return {}
	var votos: Dictionary = {}
	var mejor: int = -1
	var mejor_n: int = 0
	for i in opacos:
		var cubo: int =((px[i * 4]>>3)<<10)|((px[i * 4 + 1]>>3)<<5) \
				|(px[i * 4 + 2]>>3)
		var n: int = int(votos.get(cubo, 0)) + 1
		votos[cubo] = n
		if n > mejor_n:
			mejor_n = n
			mejor = cubo



	var sr: int = 0
	var sg: int = 0
	var sb: int = 0
	for i in opacos:
		var cubo2: int =((px[i * 4]>>3)<<10)|((px[i * 4 + 1]>>3)<<5) \
				|(px[i * 4 + 2]>>3)
		if cubo2 == mejor:
			sr += px[i * 4]
			sg += px[i * 4 + 1]
			sb += px[i * 4 + 2]
	var fr: float = float(sr) / float(mejor_n)
	var fg: float = float(sg) / float(mejor_n)
	var fb: float = float(sb) / float(mejor_n)
	var tol: float = FONDO_TOL * 255.0
	var dentro: int = 0
	for i in opacos:
		if absf(float(px[i * 4]) - fr) <= tol and absf(float(px[i * 4 + 1]) - fg) <= tol \
				and absf(float(px[i * 4 + 2]) - fb) <= tol:
			dentro += 1
	if float(dentro) < float(opacos.size()) * FONDO_LISO_MIN:
		return {"foto": true}
	return {"r": fr, "g": fg, "b": fb}







static func _rects_de(base: String) -> Dictionary:
	var a: Variant = _anclas.get(base)
	var c: Rect2i = _caja_de(base)
	if not (a is Dictionary) or c.size.x <= 0:
		return {}
	var d: Dictionary = a
	var out: Dictionary = {}
	if d.has("escudo"):
		var e: Dictionary = d["escudo"]
		var lado_medido: float = float(e.get("lado", 4.0))





		var lado: float = lado_medido * ESC_ESCALA
		var dx: float = float(e.get("dx", 0.0)) +(lado_medido - lado) * 0.5
		var dy: float = float(e.get("dy", 0.0)) +(lado_medido - lado) * 0.5
		var esc: Rect2 = Rect2(c.position.x + c.size.x - lado - dx,
			c.position.y + dy, lado, lado)
		out["esc"] = esc











		var mx: float = c.position.x + dx
		if mx + lado <= esc.position.x:







			out["fab"] = Rect2(mx, c.position.y + dy, lado, lado)








		var cx: float = c.position.x + c.size.x * 0.5
		var lado_cmp: float = minf(lado, 2.0 *(esc.position.x - CMP_AIRE - cx)) * CMP_ESCALA
		if lado_cmp >= CMP_MIN:
			out["cmp"] = Rect2(cx - lado_cmp * 0.5,
				c.position.y + dy +(lado - lado_cmp) * 0.5, lado_cmp, lado_cmp)
	if d.has("patro"):
		var p: Dictionary = d["patro"]
		var an: float = float(p.get("ancho", 9.0))
		var al: float = float(p.get("alto", 4.0))
		out["pat"] = Rect2(
			c.position.x +(c.size.x - an) * 0.5 + float(p.get("dx", 0.0)),
			c.position.y + float(p.get("dy", 0.0)), an, al)



	if out.has("cmp"):
		var cm: Rect2 = out["cmp"]
		var baja: float = CMP_BAJA
		if out.has("pat"):
			baja = clampf((out["pat"] as Rect2).position.y - cm.end.y, 0.0, CMP_BAJA)
		cm.position.y += baja
		out["cmp"] = cm
	return out


static func _caja_de(base: String) -> Rect2i:
	var v: Variant = _cajas.get(base)
	if not (v is Array) or (v as Array).size() != 4:
		return Rect2i()
	var a: Array = v
	return Rect2i(int(a[0]), int(a[1]), int(a[2]), int(a[3]))





static func _ensure_tablas() -> void:
	if _cargadas:
		return
	_cargadas = true
	_anclas = _json(ANCLAS)
	_cajas = _json(CAJAS)


static func _json(ruta: String) -> Dictionary:
	var txt: String = FileAccess.get_file_as_string(ruta)
	if txt.is_empty():
		return {}
	var d: Variant = JSON.parse_string(txt)
	return d if d is Dictionary else {}



static func _test_reset() -> void:
	_cargadas = false
	_anclas = {}
	_cajas = {}
	_indice = {}
	_tenidas = {}



























static func campeon_textura(cfg: Dictionary, club_id: String) -> Texture2D:
	var tipo: String = campeon_tipo(cfg, club_id)
	if tipo.is_empty():
		return null
	var c: Dictionary = cfg.duplicate()
	c["comp_parche"] = tipo
	c["parche_vigente"] = true
	c["oro_forzado"] = true
	var tex: Texture2D = SleevePatch.textura(c)
	return tex if tex != null else _trofeo_respaldo(tipo, cfg)














const CAMPEON_PRIORIDAD: Array[String] = ["mundial", "clubes", "continental"]





static func campeon_tipo(cfg: Dictionary, club_id: String) -> String:
	for clave in CAMPEON_PRIORIDAD:
		var tipo: String = _campeon_por(clave, cfg, club_id)
		if not tipo.is_empty():
			return tipo
	return ""





static func _campeon_por(clave: String, cfg: Dictionary, club_id: String) -> String:
	var pais: bool = cfg.has("crest_flag")
	match clave:
		"mundial":
			if pais and es_campeon_mundial(String(cfg["crest_flag"])):
				return "mundial"
		"clubes":
			if not pais and es_campeon_clubes(club_id):
				return "clubes"
		"continental":
			if not pais:
				return continental_de(club_id)
	return ""






















static func _trofeo_respaldo(tipo: String, cfg: Dictionary) -> Texture2D:
	var k: Variant = cfg.get("kit")
	var oscuro: bool = k is Color and (k as Color).get_luminance() > 0.45
	var llave: String = "%s|%s" % [tipo, oscuro]
	var hecho: Variant = _trofeos.get(llave)
	if hecho is Texture2D:
		return hecho
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	if arbol == null or arbol.root == null:
		return null
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(TROFEO_PX, TROFEO_PX)
	vp.transparent_bg = true
	vp.disable_3d = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	var icon: TrophyIcon = TrophyIcon.new()
	icon.size = Vector2(TROFEO_PX, TROFEO_PX)
	icon.set_generico(true)
	icon.set_logo_type(SIN_MEDALLON)
	icon.set_type(tipo)
	if oscuro:
		icon.modulate = TROFEO_OSCURO
	vp.add_child(icon)
	arbol.root.add_child.call_deferred(vp)
	var tex: Texture2D = vp.get_texture()
	_trofeos[llave] = tex
	return tex










static func es_campeon_clubes(club_id: String) -> bool:
	if club_id.is_empty() or Career == null:
		return false
	var won: Variant = Career.last_season_titles.get(club_id, [])
	return won is Array and (won as Array).has("clubes")














static func continental_de(club_id: String) -> String:
	if club_id.is_empty() or Career == null:
		return ""
	var won: Variant = Career.last_season_titles.get(club_id, [])
	if not (won is Array and (won as Array).has("champions")):
		return ""
	if GameState != null and GameState.last_lib_winner == club_id:
		return "libertadores"
	if GameState != null and GameState.last_cca_winner == club_id:
		return "concacaf"
	return "champions"







static func es_campeon_mundial(pais: String) -> bool:
	if pais.is_empty() or GameState == null or GameState.campeon_mundial.is_empty():
		return false
	return Nations.canon_id(pais) == GameState.campeon_mundial
