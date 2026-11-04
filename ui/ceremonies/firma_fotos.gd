extends Ceremony























const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")
const RelVivo := preload("res://ui/ceremonies/rel_vivo.gd")
const GenteCalle := preload("res://ui/ceremonies/gente_calle.gd")

const N_FOTOS: int = 5


const ATT: float = 0.16




const MESA: Vector3 = Vector3(0.0, 0.0, Stadium.HALF_LINE - 16.0)
const MESA_TAM: Vector3 = Vector3(2.1, 0.76, 0.72)
const LONA_ATRAS: float = 1.3

const TU: Vector3 = MESA + Vector3(-0.15, 0.0, -0.5)

const PUESTO: Vector3 = MESA + Vector3(-1.35, 0.0, 0.28)

const COLA_0: Vector3 = MESA + Vector3(-2.2, 0.0, 0.42)
const COLA_PASO: Vector3 = Vector3(-0.6, 0.0, 0.08)
const COLA_ANCHO: float = 0.42
const POSTES_MAX: int = 9

const HECHOS_0: Vector3 = MESA + Vector3(1.55, 0.0, 1.05)
const HECHOS_PASO: Vector3 = Vector3(0.62, 0.0, 0.1)

const SALIDA: Vector3 = PUESTO + Vector3(0.25, 0.0, 0.9)
const VEL: float = 1.15

const PILA: Vector3 = MESA + Vector3(0.6, MESA_TAM.y, 0.02)
const FOTO_MESA: Vector3 = MESA + Vector3(-0.45, MESA_TAM.y + 0.006, 0.1)


const T_ROTULO: float = 0.6
const T_EMPIEZA: float = 1.8
const TOMA_DUR: float = 0.4
const TOMA_PAUSA: float = 0.25
const DA_DUR: float = 0.5
const FIESTA: float = 1.3
const FICHA_TRAS: float = 3.6





const FOTO_W: int = 64
const FOTO_H: int = 90
const FOTO_ESC: int = 8
const FOTO_BORDE: int = 3
const FOTO_BANDA: int = 12


const LIENZO_PX: float = 820.0
const LIENZO_ALTO: float = 1180.0

const FOTO_M: float = 0.25
const PAPEL: Color = Color(0.96, 0.95, 0.91)
const BANDA: Color = Color(0.07, 0.08, 0.1)











const POSES: Array = [
	["balon_south_", 1],
	["volado_south_", 3],
	["tresdedos_south_", 2],
	["cielo_south_", 3],
	["celebration_south_", 5],
]


const FILA_PECHO: float = 36.0
const FILA_PECHO_ELLA: float = 34.0
const FILAS_CIELO: Array[float] = [13.0, 15.0, 17.0, 15.0]


const TOMAS: Dictionary = {"voz_pide": 4, "voz_cele": 4, "voz_protesta": 3}
const NINO_H: float = 1.32

var _kit_club: Dictionary = {}
var _px_h: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x


var _cola: Array[Dictionary] = []
var _hechos: Array[Dictionary] = []
var _fotos: Array[Image] = []
var _gritos: Array = []
var _excita: float = 0.4
var _t_excita: float = -10.0

var _i: int = 0
var _fase: String = "abre"
var _fase_t: float = 0.0
var _lienzo: FirmaLienzo = null
var _premiado: bool = false
var _premio_lbl: Label = null
var _ms_f: int = 0
var _terminado: bool = false


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh", "rotulador_loop"])


func _build() -> void:
	_kit_club = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": _kit_club,
	})
	focus = PUESTO
	make_press_board(MESA, LONA_ATRAS)
	_pon_mesa()
	_pon_postes()
	_pon_jugador()
	_prepara_fotos()
	_pon_cola()
	make_camera([_plano_apertura(0.0), _plano_apertura(T_EMPIEZA + 0.3, 0.8),
		_cerca(T_EMPIEZA + 1.6)], 40.0)
	orbit_speed = 0.0
	scrim_dim(0.35)
	make_audio(ATT, false)
	applause(true, -18.0)

	flash_pool = press_flash_pool(MESA, 16)
	flash_rate = 0.8
	_voces("voz_pide", 2, 0.5, 2.0, -16.0)
	make_chyron(I18n.t("EVENTO CON LA AFICION"), CareerTheme.caps(team_name()), team(),
		T_ROTULO, "", I18n.t("FIRMA DE FOTOS"))
	_ficha()






func _pon_mesa() -> void:
	var c1: Color = _color_kit("kit", accent)
	var c2: Color = _color_kit("kit2", PAPEL)
	_caja(MESA_TAM, Vector3(MESA.x, MESA_TAM.y * 0.5, MESA.z), c1.darkened(0.1))
	_caja(Vector3(MESA_TAM.x + 0.04, 0.02, MESA_TAM.z + 0.04),
		Vector3(MESA.x, MESA_TAM.y + 0.01, MESA.z), c1.lightened(0.08))
	_caja(Vector3(MESA_TAM.x + 0.01, 0.1, 0.01),
		Vector3(MESA.x, MESA_TAM.y - 0.14, MESA.z + MESA_TAM.z * 0.5 + 0.006), c2)
	_caja(Vector3(0.26, 0.05, 0.36), PILA + Vector3(0.0, 0.045, 0.0), PAPEL)



func _pon_postes() -> void:
	var metal: Color = Color(0.72, 0.74, 0.78)
	var cordon: Color = _color_kit("kit", accent).darkened(0.25)
	for lado in [-1.0, 1.0]:
		var antes: Vector3 = Vector3.INF
		for k in POSTES_MAX:
			var p: Vector3 = COLA_0 + COLA_PASO *(float(k) + 0.5) \
					+ Vector3(0.0, 0.0, lado * COLA_ANCHO)
			_cilindro(0.028, 0.95, Vector3(p.x, 0.475, p.z), metal)
			_cilindro(0.13, 0.03, Vector3(p.x, 0.015, p.z), metal.darkened(0.3))
			if antes != Vector3.INF:
				var medio: Vector3 =(antes + p) * 0.5
				var largo: float = Vector2(p.x - antes.x, p.z - antes.z).length()
				var cuerda: MeshInstance3D = _caja(Vector3(largo, 0.035, 0.035),
					Vector3(medio.x, 0.86, medio.z), cordon)
				cuerda.rotation.y = - atan2(p.z - antes.z, p.x - antes.x)
			antes = p


func _caja(tam: Vector3, pos: Vector3, color: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = tam
	m.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.9
	m.material_override = mat
	m.position = pos
	viewport.add_child(m)
	return m


func _cilindro(radio: float, alto: float, pos: Vector3, color: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: CylinderMesh = CylinderMesh.new()
	mesh.top_radius = radio
	mesh.bottom_radius = radio
	mesh.height = alto
	mesh.radial_segments = 10
	m.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.metallic = 0.6
	mat.roughness = 0.35
	m.material_override = mat
	m.position = pos
	viewport.add_child(m)
	return m



func _color_kit(clave: String, si_no: Color) -> Color:
	var v: Variant = _kit_club.get(clave)
	if v is Color:
		return v
	if v is String and Color.html_is_valid(String(v)):
		return Color(String(v))
	return si_no




func _pon_jugador() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(_kit_club, true)
	look["number"] = shirt()
	make_player(look, "south")
	add_idle_views(player, look)
	player.position = Vector3(TU.x, feet_offset(player.pixel_size) - PLAYER_SINK, TU.z)




func _prepara_fotos() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(_kit_club, true)
	look["number"] = shirt()





	var cfg: Dictionary = pecho_cfg_a_mano(player_cfg(look))
	var piezas: Dictionary = piezas_pecho(cfg)



	var c1: Color = _color_kit("kit", accent)
	var c2: Color = _color_kit("kit2", PAPEL)
	var fondo: Color = c1 if c1.get_luminance() <= c2.get_luminance() else c2
	var raya: Color = c2 if fondo == c1 else c1
	for i in N_FOTOS:
		var pose: Array = POSES[i % POSES.size()]
		var fig: Image = null
		var path: String = "res://assets/sprites/anim/%s%02d.png" % [pose[0], pose[1]]
		if ResourceLoader.exists(path):
			var tex: Texture2D = KitRecolor.apply(load(path), cfg)
			if tex != null:
				fig = tex.get_image()
		var img: Image = compon_foto(fig, fondo, raya, Career.nombre_espalda(), shirt())
		img.resize(FOTO_W * FOTO_ESC, FOTO_H * FOTO_ESC, Image.INTERPOLATE_NEAREST)
		estampa_pecho(img, fig, "%s%02d" % [pose[0], pose[1]], piezas)
		_fotos.append(img)






static func compon_foto(figura: Image, fondo: Color, raya: Color, nombre: String,
		dorsal: int) -> Image:
	var img: Image = Image.create(FOTO_W, FOTO_H, false, Image.FORMAT_RGBA8)
	img.fill(PAPEL)
	var dentro: Rect2i = Rect2i(FOTO_BORDE, FOTO_BORDE, FOTO_W - 2 * FOTO_BORDE,
		FOTO_H - 2 * FOTO_BORDE)
	for y in dentro.size.y:
		var k: float = float(y) / float(maxi(dentro.size.y - 1, 1))
		var c: Color = fondo.lightened(0.12).lerp(fondo.darkened(0.45), k)
		for x in dentro.size.x:
			var cc: Color = c.lerp(raya, 0.14) if ((x + y) / 5) % 2 == 0 else c
			img.set_pixel(dentro.position.x + x, dentro.position.y + y, cc)
	var banda_y: int = dentro.end.y - FOTO_BANDA



	if dorsal > 0:
		var num: String = str(dorsal)
		PixelText.draw_text(img, dentro.position.x + 3, dentro.position.y + 3, num, BANDA, 2)
		PixelText.draw_text(img, dentro.position.x + 2, dentro.position.y + 2, num, PAPEL, 2)
	if figura != null:
		var fig: Image = figura.duplicate()
		if fig.is_compressed():
			fig.decompress()
		fig.convert(Image.FORMAT_RGBA8)
		var u: Rect2i = fig.get_used_rect()
		if u.has_area():
			var o: Vector2i = sitio_figura(u)
			var ox: int = o.x
			var oy: int = o.y
			for y in u.size.y:
				var dy: int = oy + y
				if dy < dentro.position.y or dy >= banda_y:
					continue
				for x in u.size.x:
					var dx: int = ox + x
					if dx < dentro.position.x or dx >= dentro.end.x:
						continue
					var p: Color = fig.get_pixel(u.position.x + x, u.position.y + y)
					if p.a > 0.5:
						img.set_pixel(dx, dy, Color(p.r, p.g, p.b, 1.0))
	img.fill_rect(Rect2i(dentro.position.x, banda_y, dentro.size.x, FOTO_BANDA), BANDA)
	img.fill_rect(Rect2i(dentro.position.x, banda_y, dentro.size.x, 1), raya)
	var txt: String = nombre.strip_edges().to_upper()
	while txt.length() > 1 and PixelText.text_width(txt) > dentro.size.x - 4:
		txt = txt.substr(0, txt.length() - 1)
	var tx: int = dentro.position.x +(dentro.size.x - PixelText.text_width(txt)) / 2
	PixelText.draw_text(img, tx, banda_y +(FOTO_BANDA - PixelText.GLYPH_H) / 2 + 1, txt,
		PAPEL)
	return img







static func sitio_figura(u: Rect2i) -> Vector2i:
	var banda_y: int = FOTO_H - FOTO_BORDE - FOTO_BANDA
	return Vector2i(FOTO_BORDE +(FOTO_W - 2 * FOTO_BORDE - u.size.x) / 2,
		maxi(banda_y + 5 - u.size.y, FOTO_BORDE + 2))






static func piezas_pecho(cfg: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	if cfg.has("bib"):
		return out
	var epoca: bool = bool(cfg.get("retro", false))
	if cfg.has("crest_logo"):
		var logo: Texture2D = CrestLogos.texture(String(cfg["crest_logo"]), epoca)
		if logo != null:
			out["esc"] = logo
	var club_id: String = String(cfg.get("pecho_club", ""))
	if club_id.is_empty():
		return out
	var marca: Texture2D = SponsorLogos.for_team(club_id, epoca) \
			if not cfg.has("crest_flag") else null
	if marca != null:
		out["pat"] = Pecho.marca_para(marca, cfg, "pat")
	var fab: Texture2D = KitBrands.for_team(club_id, epoca, int(cfg.get("kit_slot", 0)))
	if fab != null:
		out["fab"] = Pecho.marca_para(fab, cfg, "fab")
	return out









static func estampa_pecho(img: Image, figura: Image, base: String, piezas: Dictionary) -> void:
	if figura == null or piezas.is_empty():
		return
	var fig: Image = figura
	if fig.is_compressed():
		fig = fig.duplicate()
		fig.decompress()
	var u: Rect2i = fig.get_used_rect()
	if not u.has_area():
		return
	var o: Vector2 = Vector2(sitio_figura(u) - u.position)
	var r: Dictionary = Pecho.rects_base(base)
	var e: float = float(img.get_width()) / float(FOTO_W)

	var visto: Rect2i = Rect2i(roundi(FOTO_BORDE * e), roundi(FOTO_BORDE * e),
		roundi((FOTO_W - 2 * FOTO_BORDE) * e),
		roundi((FOTO_H - 2 * FOTO_BORDE - FOTO_BANDA) * e))
	for pieza in ["esc", "pat", "fab"]:
		var tex: Texture2D = piezas.get(pieza) as Texture2D
		var hueco: Rect2 = r.get(pieza, Rect2())
		if tex == null or hueco.size.x <= 0.0 or hueco.size.y <= 0.0:
			continue
		var ts: Vector2 = tex.get_size()
		if ts.x <= 0.0 or ts.y <= 0.0:
			continue
		var h: Rect2 = Rect2((hueco.position + o) * e, hueco.size * e)
		var k: float = minf(h.size.x / ts.x, h.size.y / ts.y)
		var d: Vector2i = Vector2i(maxi(1, roundi(ts.x * k)), maxi(1, roundi(ts.y * k)))
		var src: Image = tex.get_image()
		if src == null:
			continue
		src = src.duplicate()
		if src.is_compressed():
			src.decompress()
		src.convert(Image.FORMAT_RGBA8)
		src.resize(d.x, d.y, Image.INTERPOLATE_LANCZOS)
		var sitio: Vector2i = Vector2i((h.get_center() - Vector2(d) * 0.5).round())
		var cabe: Rect2i = Rect2i(sitio, d).intersection(visto)
		if not cabe.has_area():
			continue
		img.blend_rect(src, Rect2i(cabe.position - sitio, cabe.size), cabe.position)



func _hoja(i: int) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.pixel_size = FOTO_M / float(FOTO_W * FOTO_ESC)
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.double_sided = true
	viewport.add_child(s)
	_sube_foto(s, _fotos[i])
	return s


func _sube_foto(s: Sprite3D, img: Image) -> void:
	if s == null or img == null:
		return
	var m: Image = img.duplicate()
	m.generate_mipmaps()
	s.texture = ImageTexture.create_from_image(m)


func _tumbada(s: Sprite3D, pos: Vector3) -> void:
	s.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	s.rotation = Vector3(- PI * 0.5, 0.0, 0.0)
	s.position = pos


func _en_manos(f: Dictionary) -> Vector3:
	var spr: AnimatedSprite3D = f["spr"]
	var alto: float = FOTO_M * float(FOTO_H) / float(FOTO_W)
	var p: Vector3 = spr.position
	if cam != null:
		var mira: Vector3 = cam.global_position - p
		mira.y = 0.0
		if mira.length() > 0.01:
			p += mira.normalized() * 0.12
	if spr.animation == &"cielo":
		var fila: float = FILAS_CIELO[spr.frame % FILAS_CIELO.size()]
		p.y = spr.position.y +(46.0 - fila) * spr.pixel_size + alto * 0.4
	else:
		p.y = spr.position.y +(46.0 - float(f["fila"])) * spr.pixel_size - alto * 0.3
	return p








static func quienes(n: int, club: String) -> Array[Dictionary]:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("firma_fotos|%d|%s" % [n, club])
	var tipos: Array[String] = ["el", "ella", "nino"]
	for k in N_FOTOS - tipos.size():
		var r: float = dado.randf()
		tipos.append("nino" if r < 0.2 else ("ella" if r < 0.6 else "el"))
	for k in range(tipos.size() - 1, 0, -1):
		var j: int = dado.randi_range(0, k)
		var x: String = tipos[k]
		tipos[k] = tipos[j]
		tipos[j] = x
	var looks: Array[String] = []
	for o in GenteCalle.ELLAS_LOOKS:
		if ResourceLoader.exists(Pareja.ANIM_DIR + "mujer_look_%s_walk_east_00.png" % o):
			looks.append(o)
	var out: Array[Dictionary] = []
	for i in tipos.size():
		var q: Dictionary = {"tipo": tipos[i]}
		if tipos[i] == "ella" and looks.is_empty():
			q["tipo"] = "el"
		match String(q["tipo"]):
			"el":
				q["ropa"] = dado.randi_range(13, 420)
			"ella":
				q["atuendo"] = looks[dado.randi() % looks.size()]

				q["cfg"] = KitRecolor.sin_pelirrojo_oscuro({
					"skin": KitRecolor.SKIN_TONES[dado.randi() % KitRecolor.SKIN_TONES.size()],
					"hair": KitRecolor.HAIR_COLORS[
						Pareja.PELOS[dado.randi() % Pareja.PELOS.size()]]})
			"nino":
				q["semilla"] = "firma_fotos_nino|%d|%d|%s" % [n, i, club]
		out.append(q)
	return out






func _pon_cola() -> void:
	var qs: Array[Dictionary] = quienes(int(data.get("n", 1)), String(data.get("club", "")))
	for i in qs.size():
		_cola.append(_persona(qs[i], _slot(i), true))
	var extra: Array[Dictionary] = cola_extra(int(data.get("n", 1)), String(data.get("club", "")),
		clampi(int(data.get("cola", 4)), 0, 12))
	for k in extra.size():
		var f: Dictionary = _persona(extra[k], _slot(qs.size() + k), false)
		if not f.is_empty():
			_cola.append(f)













static func cola_extra(n: int, club: String, cuantos: int) -> Array[Dictionary]:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("firma_fotos_cola|%d|%s" % [n, club])
	var looks: Array[String] = []
	for o in GenteCalle.ELLAS_LOOKS:
		if ResourceLoader.exists(Pareja.ANIM_DIR + "mujer_look_%s_walk_east_00.png" % o):
			looks.append(o)
	var vistos: Dictionary = {}
	for q in quienes(n, club):
		vistos[GenteCalle.clave_persona(q)] = true
	var out: Array[Dictionary] = []
	for k in cuantos:
		var q: Dictionary = {}


		for intento in 10:
			var r: float = dado.randf()
			if r < 0.15:
				q = {"tipo": "nino", "semilla": "firma_fotos_cola_nino|%d|%d|%s" % [n, k, club]}
			elif r < 0.55 and not looks.is_empty():

				q = {"tipo": "ella", "atuendo": looks[dado.randi() % looks.size()],
					"cfg": KitRecolor.sin_pelirrojo_oscuro({
						"skin": KitRecolor.SKIN_TONES[dado.randi() % KitRecolor.SKIN_TONES.size()],
						"hair": KitRecolor.HAIR_COLORS[
							Pareja.PELOS[dado.randi() % Pareja.PELOS.size()]]})}
			else:
				q = {"tipo": "el", "ropa": dado.randi_range(13, 420)}
			if not vistos.has(GenteCalle.clave_persona(q)):
				break
		vistos[GenteCalle.clave_persona(q)] = true
		out.append(q)
	return out


func _slot(k: int) -> Vector3:
	return COLA_0 + COLA_PASO * float(k)


func _persona(q: Dictionary, pos: Vector3, elegido: bool) -> Dictionary:
	var dirs: Array[String] = ["east"]
	if elegido:
		dirs = WALK_DIRS
	var f: Dictionary = {}
	match String(q.get("tipo", "el")):
		"ella":
			f = _ella(q, dirs)
		"nino":
			f = _nino(q, dirs)
	if f.is_empty():
		f = _el(q, dirs)
	f["pos"] = pos
	f["camino"] = []
	f["t0"] = 0.0
	f["largo"] = 0.0
	f["foto"] = null
	f["foto_en"] = ""
	f["elegido"] = elegido
	f["fase"] = rng.randf_range(0.0, TAU)
	var spr: AnimatedSprite3D = f["spr"]
	spr.position = Vector3(pos.x, float(f["pie"]), pos.z)
	return f


func _el(q: Dictionary, dirs: Array[String]) -> Dictionary:
	var cfg: Dictionary = KitRecolor.casual_of(GenteCalle._ropa(int(q.get("ropa", 13)),
		_kit_club, true))
	var frames: SpriteFrames = player_frames(cfg, "south")
	var spr: AnimatedSprite3D = _gente(frames, _px_h)
	var cielo: bool = _cielo(frames, cfg)
	for d in dirs:
		_walk_dir(spr, _walk_cfg(spr, cfg), 1, d)
	return {"tipo": "el", "spr": spr, "pie": feet_offset(_px_h) - PLAYER_SINK,
		"fila": FILA_PECHO, "cielo": cielo}


func _nino(q: Dictionary, dirs: Array[String]) -> Dictionary:
	var cfg: Dictionary = KitRecolor.infantil(KitRecolor.appearance_for(
		String(q.get("semilla", "firma_fotos_nino")), KitRecolor.team_only(_kit_club)))
	var frames: SpriteFrames = player_frames(cfg)
	var px: float = NINO_H / PLAYER_METRICS.x
	var spr: AnimatedSprite3D = _gente(frames, px)
	var cielo: bool = _cielo(frames, cfg)
	for d in dirs:
		_walk_dir(spr, _walk_cfg(spr, cfg), 1, d)
	return {"tipo": "nino", "spr": spr, "pie": feet_offset(px) - PLAYER_SINK,
		"fila": FILA_PECHO, "cielo": cielo}





func _ella(q: Dictionary, dirs: Array[String]) -> Dictionary:
	var pre: String = Pareja.ANIM_DIR + "mujer_look_%s_" % String(q.get("atuendo", ""))
	if not ResourceLoader.exists(pre + "idle_south_00.png"):
		return {}
	var cfg: Dictionary = q.get("cfg", {})
	var frames: SpriteFrames = player_frames(cfg, "south", pre + "idle_south_", true)
	var look: Dictionary = frames.get_meta("look_cfg", cfg) if frames.has_meta("look_cfg") \
			else cfg
	for d in dirs:
		var anim: String = "walk_" + d
		frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, 10.0)
		for k in 8:
			var path: String = pre + "walk_%s_%02d.png" % [d, k]
			if ResourceLoader.exists(path):
				frames.add_frame(anim, KitRecolor.apply(load(path), look))
		if frames.get_frame_count(anim) == 0:
			frames.remove_animation(anim)
	var spr: AnimatedSprite3D = _gente(frames, PAREJA_PIXEL)
	return {"tipo": "ella", "spr": spr,
		"pie": feet_offset(PAREJA_PIXEL, pre + "idle_south_00.png") - PLAYER_SINK,
		"fila": FILA_PECHO_ELLA, "cielo": false}


func _gente(frames: SpriteFrames, px: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = px
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(spr)
	spr.play("idle")
	spr.speed_scale = rng.randf_range(0.85, 1.15)
	return spr



func _cielo(frames: SpriteFrames, cfg: Dictionary) -> bool:
	var look: Dictionary = frames.get_meta("look_cfg", cfg) if frames.has_meta("look_cfg") \
			else cfg
	frames.add_animation("cielo")
	frames.set_animation_speed("cielo", 7.0)
	frames.set_animation_loop("cielo", true)
	for k in [2, 3, 4, 3]:
		var path: String = "res://assets/sprites/anim/cielo_south_%02d.png" % k
		if ResourceLoader.exists(path):
			frames.add_frame("cielo", KitRecolor.apply(load(path), look))
	if frames.get_frame_count("cielo") == 0:
		frames.remove_animation("cielo")
		return false
	return true



func _anda(f: Dictionary, puntos: Array) -> void:
	var camino: Array = [f["pos"]]
	camino.append_array(puntos)
	var largo: float = 0.0
	for k in range(1, camino.size()):
		largo +=(camino[k] as Vector3).distance_to(camino[k - 1])
	f["camino"] = camino
	f["t0"] = t
	f["largo"] = largo


func _andando(f: Dictionary) -> bool:
	return not (f["camino"] as Array).is_empty()


func _tick_persona(f: Dictionary) -> void:
	var spr: AnimatedSprite3D = f["spr"]
	var camino: Array = f["camino"]
	if not camino.is_empty():
		var s: float =(t - float(f["t0"])) * VEL
		if s >= float(f["largo"]):
			f["pos"] = camino[camino.size() - 1]
			f["camino"] = []
			walk_play(spr, Vector3.ZERO)
		else:
			for k in range(1, camino.size()):
				var a: Vector3 = camino[k - 1]
				var b: Vector3 = camino[k]
				var tramo: float = a.distance_to(b)
				if s <= tramo or k == camino.size() - 1:
					f["pos"] = a.lerp(b, clampf(s / maxf(tramo, 0.001), 0.0, 1.0))
					walk_play(spr, b - a)





					if spr.animation == "idle" and spr.sprite_frames.has_animation("walk_east"):
						spr.play("walk_east")
					break
				s -= tramo
	var bote: float = 0.0
	var quieto: bool =(f["camino"] as Array).is_empty()
	var quiere: String = ""
	if quieto and String(f["foto_en"]) == "manos":

		var arriba: bool = bool(f["cielo"]) and (_terminado or t < float(f.get("t_fiesta", -99.0)) + FIESTA)
		quiere = "cielo" if arriba else "idle"
		bote = absf(sin(t * 8.5 + float(f["fase"]))) * 0.05 * _excita
	elif quieto:
		quiere = "idle"
		bote = absf(sin(t * 6.0 + float(f["fase"]))) * 0.02 * _excita
	if not quiere.is_empty() and spr.animation != quiere \
			and spr.sprite_frames.has_animation(quiere):
		spr.play(quiere)
	var pos: Vector3 = f["pos"]
	spr.position = Vector3(pos.x, float(f["pie"]) + bote, pos.z)
	var hoja: Sprite3D = f["foto"]
	if hoja != null and String(f["foto_en"]) == "manos":
		hoja.position = _en_manos(f)





func _turno(i: int) -> void:
	_i = i
	_fase = "avanza"
	_fase_t = t
	_anda(_cola[i], [PUESTO])
	for k in range(i + 1, _cola.size()):
		_anda(_cola[k], [_slot(k - i - 1)])
	_voces("voz_pide", 1, 0.2, 0.8, -15.0)


func _tick_flujo() -> void:
	match _fase:
		"abre":
			if t >= T_EMPIEZA:
				_turno(0)
		"avanza":
			if not _andando(_cola[_i]):
				_fase = "toma"
				_fase_t = t
				var f: Dictionary = _cola[_i]
				f["foto"] = _hoja(_i)
				f["foto_en"] = "mesa"
				_tumbada(f["foto"], PILA + Vector3(0.0, 0.08, 0.0))
				sting("ui_whoosh", -18.0)
		"toma":
			var f: Dictionary = _cola[_i]
			var k: float = smoothstep(0.0, 1.0,(t - _fase_t) / TOMA_DUR)
			(f["foto"] as Sprite3D).position =(PILA + Vector3(0.0, 0.08, 0.0)).lerp(FOTO_MESA, k)
			if t >= _fase_t + TOMA_DUR + TOMA_PAUSA:
				_abre_lienzo()
		"da":
			var f: Dictionary = _cola[_i]
			var hoja: Sprite3D = f["foto"]
			var k: float = smoothstep(0.0, 1.0,(t - _fase_t) / DA_DUR)
			idle_play(player, Vector3(-1.0, 0.0, 0.0))
			hoja.position = FOTO_MESA.lerp(_en_manos(f), k)
			hoja.rotation.x = lerpf(- PI * 0.5, 0.0, k)
			if k >= 1.0:
				hoja.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
				hoja.rotation = Vector3.ZERO
				f["foto_en"] = "manos"
				f["t_fiesta"] = t
				_fase = "fiesta"
				_fase_t = t
				_t_excita = t
				applause(true, -12.0)
				_voces("voz_cele", 2, 0.0, 0.8, -12.0)
				flash_burst_at = t
		"fiesta":
			idle_play(player, Vector3.ZERO)
			if t >= _fase_t + FIESTA:
				var f: Dictionary = _cola[_i]
				_anda(f, [SALIDA, _hecho(_i)])
				_hechos.append(f)
				applause(true, -18.0)
				if _i + 1 < N_FOTOS:
					_turno(_i + 1)
				else:
					_final()
		"fin":
			idle_play(player, Vector3.ZERO)


func _hecho(i: int) -> Vector3:
	return HECHOS_0 + HECHOS_PASO * float(i)


func _abre_lienzo() -> void:
	_fase = "firma"
	_fase_t = t
	if chyron != null:
		chyron.visible = false
	flash_rate = 0.0
	var img: Image = _fotos[_i]
	var e: int = FOTO_ESC
	_lienzo = FirmaLienzo.new()
	add_child(_lienzo)
	var todo: Rect2i = Rect2i(0, 0, img.get_width(), img.get_height())
	var dentro: Rect2i = Rect2i(FOTO_BORDE * e, FOTO_BORDE * e,
		(FOTO_W - 2 * FOTO_BORDE) * e,(FOTO_H - 2 * FOTO_BORDE) * e)
	_lienzo.monta(img, todo, dentro, I18n.t("FIRMA LA FOTO"), I18n.t("Firma con el dedo"),
		"%d / %d" % [_i + 1, N_FOTOS], LIENZO_PX, LIENZO_ALTO)
	_lienzo.firmada.connect(_on_firmada)


	if (embedded or not standalone) and not replay:
		_lienzo.ofrece_no(Career.firma_fx("fotos", true), Career.firma_fx("fotos", false))
		_lienzo.negada.connect(_on_negada)
	CareerUi.normalize_caps(_lienzo)
	if bool(data.get("firma_auto", false)):
		_lienzo.firma_sola(false)






func zonas_sello() -> Array[Rect2]:
	var out: Array[Rect2] = super()
	var vp: Viewport = get_viewport()
	if vp == null:
		return out
	out.append_array(FirmaLienzo.cajas_cabecera(vp.get_visible_rect(), UiKit.top_safe_inset(vp),
		UiKit.bottom_safe_inset(vp),
		FirmaLienzo.medida_lienzo(Vector2(FOTO_W * FOTO_ESC, FOTO_H * FOTO_ESC), LIENZO_PX, LIENZO_ALTO),
		I18n.t("FIRMA LA FOTO"), I18n.t("Firma con el dedo"), "%d / %d" % [N_FOTOS, N_FOTOS]))
	return out


func _on_firmada(premio: bool, negada: bool = false) -> void:
	var f: Dictionary = _cola[_i]
	if _lienzo != null:

		if not negada:
			_fotos[_i] = _lienzo.img.duplicate()
		_lienzo.queue_free()
		_lienzo = null
	_sube_foto(f["foto"], _fotos[_i])
	_ms_f = Time.get_ticks_msec()



	if premio and (embedded or not standalone) and not replay:
		RelVivo.lanza(self, Career.firma_fotos_firmadas())
		if not _premiado:
			_premiado = true
			if _premio_lbl != null:
				_premio_lbl.visible = true
	_fase = "da"
	_fase_t = t
	flash_rate = 0.8
	sting("lone_shout", -16.0)
	cam_keys.assign([_cerca(t), _cerca(t + DA_DUR + FIESTA, 0.3)])




func _on_negada() -> void:
	RelVivo.lanza(self, Career.firma_resuelve("fotos", false))
	_voces("voz_protesta", 1, 0.0, 0.3, -12.0)
	_on_firmada(false, true)




func _final() -> void:
	_fase = "fin"
	_fase_t = t
	var llega: float = 0.0
	var f: Dictionary = _cola[N_FOTOS - 1]
	llega = float(f["largo"]) / VEL
	cam_keys.assign([_cerca(t, 0.3), _plano_final(t + llega + 0.4)])
	var tw: Tween = create_tween()
	tw.tween_interval(llega + 0.2)
	tw.tween_callback(_todos_arriba)
	card_at = t + llega + FICHA_TRAS
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	_card_tw = create_tween()
	_card_tw.tween_interval(llega + FICHA_TRAS)
	_card_tw.tween_callback(_reveal_card)


func _todos_arriba() -> void:



	if _terminado or ficha_puesta:
		return
	_terminado = true
	_t_excita = t
	sting("fanfare", -10.0)
	applause(true, -9.0)
	_voces("voz_cele", 3, 0.0, 1.2, -11.0)
	flash_burst_at = t
	flash_rate = 3.0






func _cerca(tk: float, empuje: float = 0.0) -> Dictionary:
	return {"t": tk, "dist": 5.2 - empuje, "h": 1.9, "yaw": 186.0, "aim_y": 1.15,
		"fov": 40.0, "focus_x": PUESTO.x + 0.6, "focus_z": MESA.z + 0.1}



func _plano_apertura(tk: float, deriva: float = 0.0) -> Dictionary:
	return {"t": tk, "dist": 9.5 - deriva, "h": 2.8, "yaw": 228.0 - deriva * 4.0,
		"aim_y": 1.25, "fov": 40.0, "focus_x": PUESTO.x - 0.6, "focus_z": MESA.z + 0.3}



func _plano_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 7.4, "h": 2.2, "yaw": 160.0, "aim_y": 1.3, "fov": 40.0,
		"focus_x": HECHOS_0.x + 0.4, "focus_z": MESA.z + 0.6}




func _voces(familia: String, cuantas: int, desde: float, hasta: float, db: float) -> void:
	for i in cuantas:
		_gritos.append([t + rng.randf_range(desde, hasta),
			"%s_%d" % [familia, rng.randi_range(1, int(TOMAS[familia]))],
			db + rng.randf_range(-2.5, 1.0), rng.randf_range(0.9, 1.14)])


func _tick_gritos() -> void:
	var i: int = 0
	while i < _gritos.size():
		var g: Array = _gritos[i]
		if t < float(g[0]):
			i += 1
			continue
		_gritos.remove_at(i)
		var stream: AudioStream = AudioBank.stream(String(g[1]))
		if stream == null:
			continue
		var p: AudioStreamPlayer = AudioStreamPlayer.new()
		p.stream = stream
		p.volume_db = float(g[2])
		p.pitch_scale = float(g[3])
		p.bus = "Stadium" if AudioServer.get_bus_index("Stadium") >= 0 else "SFX"
		add_child(p)
		p.finished.connect(p.queue_free)
		p.play()




func _tick(delta: float) -> void:
	_excita = maxf(0.9 if _terminado else 0.4, 1.0 - maxf(t - _t_excita, 0.0) / 1.5 * 0.6)
	_tick_gritos()
	_tick_flujo()
	for f in _cola:
		_tick_persona(f)
	if _lienzo != null:
		_lienzo.tick(delta)




func _on_skip() -> void:
	if _lienzo != null:
		return
	if not _terminado and _fase != "fin":
		_salta_a_firma()
		return
	super._on_skip()


func _salta_a_firma() -> void:
	var i: int = _i + 1 if _fase in ["da", "fiesta"] else _i
	if _fase == "abre":
		i = 0
	_gritos.clear()
	if _chyron_tw != null and _chyron_tw.is_valid():
		_chyron_tw.kill()

	for k in i:
		var f: Dictionary = _cola[k]
		if f["foto"] == null:
			f["foto"] = _hoja(k)
		var hoja: Sprite3D = f["foto"]
		hoja.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		hoja.rotation = Vector3.ZERO
		f["foto_en"] = "manos"
		f["camino"] = []
		f["pos"] = _hecho(k)
		if not _hechos.has(f):
			_hechos.append(f)
	if i >= N_FOTOS:
		_final()
		return
	_i = i
	var f: Dictionary = _cola[i]
	f["camino"] = []
	f["pos"] = PUESTO
	for k in range(i + 1, _cola.size()):
		_cola[k]["camino"] = []
		_cola[k]["pos"] = _slot(k - i - 1)
	if f["foto"] == null:
		f["foto"] = _hoja(i)
	f["foto_en"] = "mesa"
	_tumbada(f["foto"], FOTO_MESA)
	cam_keys.assign([_cerca(t)])
	_tick_camera()
	for p in _cola:
		_tick_persona(p)
	_abre_lienzo()



func _skipped() -> void:
	for k in N_FOTOS:
		var f: Dictionary = _cola[k]
		if f["foto"] == null:
			f["foto"] = _hoja(k)
		var hoja: Sprite3D = f["foto"]
		hoja.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		hoja.rotation = Vector3.ZERO
		f["foto_en"] = "manos"
		f["camino"] = []
		f["pos"] = _hecho(k)
	_terminado = true
	for f in _cola:
		_tick_persona(f)


func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	var desde_firma: float = float(Time.get_ticks_msec() - _ms_f) / 1000.0
	if _lienzo != null or _fase != "fin" or desde_firma < FICHA_TRAS + 4.0 + VIGIA_MARGEN:
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()




func _ficha() -> void:
	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("LA FIRMA DE FOTOS"), 40)
	card_count(N_FOTOS, I18n.t("FOTOS FIRMADAS"))
	card_note(_nota())
	_premio_lbl = CareerUi.plain(CareerTheme.T_BODY, text_accent())
	_premio_lbl.text = I18n.tf("AFICIÓN +{0}", [1])
	_premio_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_premio_lbl.clip_text = true
	_premio_lbl.visible = false
	card_box.add_child(_premio_lbl)
	card_cta()


func _nota() -> String:
	if bool(data.get("first", false)):
		return I18n.t("Tu primer evento con la afición: cinco fotos con tu firma.")
	var cola: int = int(data.get("cola", 0))
	if cola > 0:
		return I18n.tf("Y la cola seguía: {0} más esperando su foto.", [cola])
	return I18n.t("Cinco fotos con tu firma, cinco que se van contentos.")
