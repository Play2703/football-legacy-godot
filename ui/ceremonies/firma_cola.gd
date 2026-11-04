extends RefCounted
























































const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")
const RelVivo := preload("res://ui/ceremonies/rel_vivo.gd")
const GenteCalle := preload("res://ui/ceremonies/gente_calle.gd")
const SelfieVisor := preload("res://ui/ceremonies/selfie_visor.gd")
const SelfieCamara := preload("res://ui/ceremonies/selfie_camara.gd")

const N_FIRMAS: int = 10


const FX: String = "marca"



const VEL: float = 1.35


const LLEGA_PAUSA: float = 0.25

const FIESTA: float = 0.9
const FICHA_TRAS: float = 3.0

const VAIVEN: float = 2.6


const LIENZO_PX: float = 820.0
const LIENZO_ALTO: float = 1180.0


const NINO_H: float = 1.32


const FILA_PECHO: float = 36.0
const FILA_PECHO_ELLA: float = 34.0
const FILAS_CIELO: Array[float] = [13.0, 15.0, 17.0, 15.0]
const TOMAS: Dictionary = {"voz_pide": 4, "voz_cele": 4, "voz_protesta": 3}




const SENTADO: String = "res://assets/sprites/anim/sentado_foto_south_"






const SENTADO_BAJA: float = 0.28


const RESPALDO_TAM: Vector3 = Vector3(0.46, 0.7, 0.07)
const RESPALDO_ARRIBA: float = 1.3
const RESPALDO_COLOR: Color = Color("2a2c31")

const GUARDIA_LADO: float = 0.62
const GUARDIA_ATRAS: float = 0.5


const GUARDIA_CHALECO: Color = Color(0.94, 1.14, 0.08)
const GUARDIA_ROPA: Color = Color("1c1d21")
const GUARDIA_ZAPATO: Color = Color("141416")

const GUARDIA_SEMILLA: int = 9

const A_LA_MESA: float = 0.3



const AUTO_FALLO: Array[float] = [0.0, 1.0, 0.45]

const CARA_BAJO: float = 7.0

const MINI: Vector2 = Vector2(150, 200)
const MINI_ESTRELLA: float = 26.0
const MINI_SELLO: float = 52.0




const FUERA_M: float = 3.0


const CUELA_LADO: float = 0.5
const CUELA_DESDE: float = 2.5
const CUELA_ATRAS: int = 2

const ESCOLTA_JUNTO: float = 0.45

const ESCOLTA_RODEO: float = 0.45



const ESCOLTA_VE: float = 1.6

var c: Ceremony = null
var cfg: Dictionary = {}

var _kit: Dictionary = {}
var _suelo: float = 0.0
var _px_h: float = Ceremony.PLAYER_HEIGHT_M / Ceremony.PLAYER_METRICS.x


var _cola: Array[Dictionary] = []
var _guardias: Array[AnimatedSprite3D] = []
var _gritos: Array = []
var _excita: float = 0.4
var _t_excita: float = -10.0

var _i: int = 0
var _fase: String = "abre"
var _fase_t: float = 0.0
var _lienzo: FirmaLienzo = null
var _firmadas: int = 0
var _premiado: bool = false
var _ms_f: int = 0
var _terminado: bool = false


var _pide: Array[int] = []
var _tomas: Array = []
var _selfie: SelfieVisor = null
var _camara: SelfieCamara = null

var _personas: Array[Dictionary] = []



var _rev: Dictionary = {}


var _seguridad_on: bool = false


var _escoltas: Array[Dictionary] = []
var _escolta: Dictionary = {}




func arma(acto: Ceremony, conf: Dictionary) -> void:
	c = acto
	cfg = conf
	_kit = cfg.get("kit", {})
	_suelo = float(cfg.get("suelo", 0.0))
	_pon_mesa()
	_pon_montaje()
	_sienta()
	_seguridad_on = bool(c.data.get("revendedor", false))
	_pon_guardias()
	var qs: Array[Dictionary] = quienes(String(cfg.get("semilla", "marca")),
		N_FIRMAS + clampi(int(cfg.get("extra", 3)), 0, 6))
	for k in qs.size():
		var f: Dictionary = _persona(qs[k], _slot(k), k < N_FIRMAS)
		if not f.is_empty():
			f["id"] = k
			_cola.append(f)
			_personas.append(f)
	if _seguridad_on:
		var tipos: Array = []
		for f in _cola:
			tipos.append(String(f["tipo"]))
		_arma_revendedor(Revendedor.plan(String(cfg.get("semilla", "marca")), tipos, N_FIRMAS,
			true))
	_voces("voz_pide", 2, 0.4, 1.6, -18.0)
	_pide = SelfieMotor.pide_selfie(String(cfg.get("semilla", "marca")), N_FIRMAS)



func tomas() -> Array:
	return _tomas



func firmadas() -> int:
	return _firmadas



func premiado() -> bool:
	return _premiado







func _pon_mesa() -> void:
	var m: Dictionary = cfg["mesa"]
	var o: Vector3 =(m["centro"] as Vector3) + Vector3(0.0, _suelo, 0.0)
	var tam: Vector3 = m["tam"]
	var c1: Color = m.get("color", Color(0.85, 0.85, 0.82))
	_caja(tam, o + Vector3(0.0, tam.y * 0.5, 0.0), c1.darkened(0.1))
	_caja(Vector3(tam.x + 0.04, 0.02, tam.z + 0.04), o + Vector3(0.0, tam.y + 0.01, 0.0),
		c1.lightened(0.08))
	_caja(Vector3(tam.x + 0.01, 0.1, 0.01),
		o + Vector3(0.0, tam.y - 0.14, tam.z * 0.5 + 0.006), m.get("franja", c1.lightened(0.5)))

	var lado: float = - signf((cfg["puesto"] as Vector3).x - o.x)
	var alto: float = _alto_pieza()
	for k in 2:
		var s: Sprite3D = _pieza()
		s.position = o + Vector3(lado *(tam.x * 0.5 - 0.16 - 0.24 * k),
			tam.y + 0.02 + alto * 0.5, -0.08 + 0.12 * k)


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
	c.viewport.add_child(m)
	return m





func _sienta() -> void:
	var tu: Vector3 = cfg["tu"]
	var look: Dictionary = c.player.sprite_frames.get_meta("look_cfg", {}) \
			if c.player.sprite_frames != null else {}
	var frames: SpriteFrames = c.player_frames(look, "south", SENTADO)
	if frames != null and frames.get_frame_count("idle") > 0 \
			and ResourceLoader.exists(SENTADO + "01.png"):
		c.player.sprite_frames = frames
		c.player.play("idle")
	c.player.position = Vector3(tu.x, _suelo + c.feet_offset(c.player.pixel_size,
		SENTADO + "01.png") - Ceremony.PLAYER_SINK - SENTADO_BAJA, tu.z)
	_caja(RESPALDO_TAM, Vector3(tu.x, _suelo + RESPALDO_ARRIBA - RESPALDO_TAM.y * 0.5, tu.z - 0.1),
		RESPALDO_COLOR)




func _pon_guardias() -> void:
	var tu: Vector3 = cfg["tu"]
	var huecos: Array = cfg.get("guardias", [tu + Vector3(- GUARDIA_LADO, 0.0, - GUARDIA_ATRAS),
		tu + Vector3(GUARDIA_LADO, 0.0, - GUARDIA_ATRAS)])
	for i in huecos.size():
		var ropa: Dictionary = GenteCalle._ropa(GUARDIA_SEMILLA + i, {}, false)
		ropa["casual_shirt"] = GUARDIA_ROPA
		ropa["casual_pants"] = GUARDIA_ROPA
		ropa["casual_shoes_color"] = GUARDIA_ZAPATO
		ropa.erase("casual_print")
		var look: Dictionary = KitRecolor.casual_of(ropa)
		look["bib"] = GUARDIA_CHALECO
		var spr: AnimatedSprite3D = _gente(c.player_frames(look, "south"), _px_h)
		var p: Vector3 = huecos[i]
		spr.position = Vector3(p.x, _suelo + c.feet_offset(_px_h) - Ceremony.PLAYER_SINK, p.z)
		_guardias.append(spr)


		if _seguridad_on:
			c.add_walk(spr, look, 1, true)
			_escoltas.append({"spr": spr, "pos": p, "casa": p, "camino": [], "t0": 0.0,
				"largo": 0.0, "pie": spr.position.y, "fila": FILA_PECHO, "cielo": false,
				"firmada": false, "t_fiesta": -99.0, "fase": 0.0, "quieto": true, "va": ""})




func _en_mesa() -> Vector3:
	var m: Dictionary = cfg["mesa"]
	var o: Vector3 = m["centro"]
	var tu: Vector3 = cfg["tu"]
	var puesto: Vector3 = cfg["puesto"]
	return Vector3(lerpf(tu.x, puesto.x, 0.3),
		_suelo +(m["tam"] as Vector3).y + 0.02 + _alto_pieza() * 0.5,
		o.z + 0.04)










static func quienes(semilla: String, cuantos: int) -> Array[Dictionary]:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("firma_marca|" + semilla)
	var looks: Array[String] = []
	for o in GenteCalle.ELLAS_LOOKS:
		if ResourceLoader.exists(Pareja.ANIM_DIR + "mujer_look_%s_walk_east_00.png" % o):
			looks.append(o)
	var tipos: Array[String] = ["el", "ella", "nino"]
	for k in cuantos - tipos.size():
		var r: float = dado.randf()
		tipos.append("nino" if r < 0.2 else ("ella" if r < 0.6 else "el"))


	for k in range(mini(N_FIRMAS, tipos.size()) - 1, 0, -1):
		var j: int = dado.randi_range(0, k)
		var x: String = tipos[k]
		tipos[k] = tipos[j]
		tipos[j] = x
	var vistos: Dictionary = {}
	var out: Array[Dictionary] = []
	for k in tipos.size():
		var q: Dictionary = {}


		for intento in 10:
			match tipos[k] if not (tipos[k] == "ella" and looks.is_empty()) else "el":
				"ella":

					q = {"tipo": "ella", "atuendo": looks[dado.randi() % looks.size()],
						"cfg": KitRecolor.sin_pelirrojo_oscuro({
							"skin": KitRecolor.SKIN_TONES[dado.randi() % KitRecolor.SKIN_TONES.size()],
							"hair": KitRecolor.HAIR_COLORS[
								Pareja.PELOS[dado.randi() % Pareja.PELOS.size()]]})}
				"nino":
					q = {"tipo": "nino", "semilla": "firma_marca_nino|%s|%d|%d" % [semilla, k, intento]}
				_:
					q = {"tipo": "el", "ropa": dado.randi_range(13, 420)}
			if not vistos.has(GenteCalle.clave_persona(q)):
				break
		vistos[GenteCalle.clave_persona(q)] = true
		out.append(q)
	return out


func _slot(k: int) -> Vector3:
	var huecos: Array = cfg.get("cola", [])
	if not huecos.is_empty():
		return huecos[mini(k, huecos.size() - 1)]
	var c0: Vector3 = cfg["cola_0"]
	var paso: Vector3 = cfg["cola_paso"]
	return c0 + paso * float(k)


func _hecho(k: int) -> Vector3:
	var hechos: Array = cfg["hechos"]
	return hechos[k % hechos.size()]


func _persona(q: Dictionary, pos: Vector3, elegido: bool) -> Dictionary:
	var f: Dictionary = {}
	match String(q.get("tipo", "el")):
		"ella":
			f = _ella(q)
		"nino":
			f = _nino(q)
	if f.is_empty():
		f = _el(q)



	var spr: AnimatedSprite3D = f["spr"]
	if String(f["tipo"]) != "ella":
		c.add_walk(spr, f["look"], 1 if elegido else 2, true)
	f["pos"] = pos
	f["camino"] = []
	f["t0"] = 0.0
	f["largo"] = 0.0
	f["firmada"] = false
	f["t_fiesta"] = -99.0
	f["fase"] = c.rng.randf_range(0.0, TAU)
	f["pieza"] = _pieza()
	f["pie"] = float(f["pie"]) + _suelo
	spr.position = Vector3(pos.x, float(f["pie"]), pos.z)
	return f


func _el(q: Dictionary) -> Dictionary:
	var look: Dictionary = KitRecolor.casual_of(GenteCalle._ropa(int(q.get("ropa", 13)), _kit,
		true))
	var frames: SpriteFrames = c.player_frames(look, "south")
	var spr: AnimatedSprite3D = _gente(frames, _px_h)
	return {"tipo": "el", "spr": spr, "look": look, "fila": FILA_PECHO, "ropa": int(q.get("ropa", 13)),
		"pie": c.feet_offset(_px_h) - Ceremony.PLAYER_SINK, "cielo": _cielo(frames, look)}





func _nino(q: Dictionary) -> Dictionary:
	var look: Dictionary = KitRecolor.infantil(KitRecolor.casual_of(KitRecolor.appearance_for(
		String(q.get("semilla", "firma_marca_nino")), {})))
	var frames: SpriteFrames = c.player_frames(look)
	var px: float = NINO_H / Ceremony.PLAYER_METRICS.x
	var spr: AnimatedSprite3D = _gente(frames, px)
	return {"tipo": "nino", "spr": spr, "look": look, "fila": FILA_PECHO,
		"pie": c.feet_offset(px) - Ceremony.PLAYER_SINK, "cielo": _cielo(frames, look)}





func _ella(q: Dictionary) -> Dictionary:
	var pre: String = Pareja.ANIM_DIR + "mujer_look_%s_" % String(q.get("atuendo", ""))
	if not ResourceLoader.exists(pre + "idle_south_00.png"):
		return {}
	var base: Dictionary = q.get("cfg", {})
	var frames: SpriteFrames = c.player_frames(base, "south", pre + "idle_south_", true)
	var look: Dictionary = frames.get_meta("look_cfg", base) if frames.has_meta("look_cfg") \
			else base
	for d in Ceremony.WALK_DIRS:
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
	var spr: AnimatedSprite3D = _gente(frames, Ceremony.PAREJA_PIXEL)
	return {"tipo": "ella", "spr": spr, "look": look, "fila": FILA_PECHO_ELLA,
		"pie": c.feet_offset(Ceremony.PAREJA_PIXEL, pre + "idle_south_00.png") - Ceremony.PLAYER_SINK,
		"cielo": false}


func _gente(frames: SpriteFrames, px: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = px
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	c.viewport.add_child(spr)
	spr.play("idle")
	spr.speed_scale = c.rng.randf_range(0.85, 1.15)
	return spr




func _cielo(frames: SpriteFrames, look: Dictionary) -> bool:
	var l: Dictionary = frames.get_meta("look_cfg", look) if frames.has_meta("look_cfg") \
			else look
	frames.add_animation("cielo")
	frames.set_animation_speed("cielo", 7.0)
	frames.set_animation_loop("cielo", true)
	for k in [2, 3, 4, 3]:
		var path: String = "res://assets/sprites/anim/cielo_south_%02d.png" % k
		if ResourceLoader.exists(path):
			frames.add_frame("cielo", KitRecolor.apply(load(path), l))
	if frames.get_frame_count("cielo") == 0:
		frames.remove_animation("cielo")
		return false
	return true






func _pieza() -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.double_sided = true
	c.viewport.add_child(s)
	_pon_textura(s, cfg.get("pieza") as Texture2D)
	return s




func _pon_textura(s: Sprite3D, tex: Texture2D) -> void:
	if s == null or tex == null or tex.get_width() <= 0:
		return
	s.texture = tex
	s.pixel_size = float(cfg.get("pieza_m", 0.22)) / float(tex.get_width())




func _pon_firmada(f: Dictionary, img: Image) -> void:
	var m: Image = img.duplicate()
	if m.get_width() > 300:
		m.resize(m.get_width() / 2, m.get_height() / 2, Image.INTERPOLATE_BILINEAR)
	m.generate_mipmaps()
	_pon_textura(f["pieza"], ImageTexture.create_from_image(m))


func _alto_pieza() -> float:
	var tex: Texture2D = cfg.get("pieza") as Texture2D
	if tex == null or tex.get_width() <= 0:
		return float(cfg.get("pieza_m", 0.22))
	return float(cfg.get("pieza_m", 0.22)) * float(tex.get_height()) / float(tex.get_width())


func _en_manos(f: Dictionary) -> Vector3:
	var spr: AnimatedSprite3D = f["spr"]
	var alto: float = _alto_pieza()
	var p: Vector3 = spr.position
	if c.cam != null:
		var mira: Vector3 = c.cam.global_position - p
		mira.y = 0.0
		if mira.length() > 0.01:
			p += mira.normalized() * 0.12
	if spr.animation == &"cielo":
		var fila: float = FILAS_CIELO[spr.frame % FILAS_CIELO.size()]

		p.y = spr.position.y +(46.0 - fila) * spr.pixel_size + alto * 0.15
	else:
		p.y = spr.position.y +(46.0 - float(f["fila"])) * spr.pixel_size - alto * 0.3
	return p





func _base() -> Image:
	var img: Image = null
	var fuente: Callable = cfg.get("base", Callable())
	if fuente.is_valid():
		img = fuente.call()
	if img == null or img.is_empty():
		img = Image.create(440, 600, false, Image.FORMAT_RGBA8)
		img.fill(cfg.get("fondo", Color(0.96, 0.95, 0.91)))
	return img




func _anda(f: Dictionary, puntos: Array) -> void:
	var camino: Array = [f["pos"]]
	camino.append_array(puntos)
	var largo: float = 0.0
	for k in range(1, camino.size()):
		largo +=(camino[k] as Vector3).distance_to(camino[k - 1])
	f["camino"] = camino
	f["t0"] = c.t
	f["largo"] = largo


func _andando(f: Dictionary) -> bool:
	return not (f["camino"] as Array).is_empty()


func _tick_persona(f: Dictionary) -> void:
	var spr: AnimatedSprite3D = f["spr"]
	var camino: Array = f["camino"]
	if not camino.is_empty():
		var s: float =(c.t - float(f["t0"])) * VEL
		if s >= float(f["largo"]):
			f["pos"] = camino[camino.size() - 1]
			f["camino"] = []
			c.walk_play(spr, Vector3.ZERO)
		else:
			for k in range(1, camino.size()):
				var a: Vector3 = camino[k - 1]
				var b: Vector3 = camino[k]
				var tramo: float = a.distance_to(b)
				if s <= tramo or k == camino.size() - 1:
					f["pos"] = a.lerp(b, clampf(s / maxf(tramo, 0.001), 0.0, 1.0))
					c.walk_play(spr, b - a)
					break
				s -= tramo
	var bote: float = 0.0

	if (f["camino"] as Array).is_empty() and not bool(f.get("quieto", false)):

		var arriba: bool = bool(f["cielo"]) and bool(f["firmada"]) \
				and (_terminado or c.t < float(f["t_fiesta"]) + FIESTA)
		var quiere: String = "cielo" if arriba else "idle"
		if spr.animation != quiere and spr.sprite_frames.has_animation(quiere):
			spr.play(quiere)
		var brinco: float = 0.05 if bool(f["firmada"]) else 0.02
		bote = absf(sin(c.t * 7.5 + float(f["fase"]))) * brinco * _excita
	var pos: Vector3 = f["pos"]
	spr.position = Vector3(pos.x, float(f["pie"]) + bote, pos.z)
	if f.get("pieza") == null:
		return

	var k: float = clampf((c.t - float(f.get("mesa_t", -99.0))) / A_LA_MESA, 0.0, 1.0)
	if not bool(f.get("en_mesa", false)):
		k = 1.0 - k
	var manos: Vector3 = _en_manos(f)
	(f["pieza"] as Sprite3D).position = manos.lerp(_en_mesa(), smoothstep(0.0, 1.0, k))


	var extras: Array = f.get("extras", [])
	if not extras.is_empty():
		var derecha: Vector3 = Vector3.RIGHT
		var atras: Vector3 = Vector3.BACK
		if c.cam != null:
			derecha = c.cam.global_transform.basis.x
			atras = - c.cam.global_transform.basis.z
			derecha.y = 0.0
			atras.y = 0.0
		for j in extras.size():
			var lado: float =(1.0 if j % 2 == 0 else -1.0) * Revendedor.PIEZA_LADO * float(j / 2 + 1)
			(extras[j] as Sprite3D).position = manos + derecha.normalized() * lado \
					+ atras.normalized() * 0.03 * float(j + 1) + Vector3.UP * 0.02 * float(j + 1)



func _turno(i: int) -> void:
	_i = i
	_fase = "avanza"
	_fase_t = c.t
	var f: Dictionary = _cola[i]


	if String(f.get("rev_fase", "")) == "sale":
		_disfraza(f)
		f["pos"] = _slot(0) + _lado_cola(0) * CUELA_DESDE
	f["rev_fase"] = ""
	_anda(f, [cfg["puesto"]])
	_reacomoda(i + 1)
	_voces("voz_pide", 1, 0.1, 0.6, -16.0)


	if i > 0:
		c.cam_keys.assign([_cerca(c.t, i), _cerca(c.t + VAIVEN, i + 1)])


func _cerca(tk: float, turno: int) -> Dictionary:
	var cerca: Callable = cfg["cerca"]
	return cerca.call(tk, float(turno % 2))


func _tick_flujo() -> void:
	match _fase:
		"abre":
			if c.t >= float(cfg.get("t_empieza", 1.8)):
				_turno(0)
		"avanza":
			if not _andando(_cola[_i]):
				_fase = "llega"
				_fase_t = c.t
		"llega":
			if c.t >= _fase_t + LLEGA_PAUSA:
				_abre_lienzo()
		"fiesta":
			if c.t >= _fase_t + FIESTA:



				if _pide.has(_i) and bool(_cola[_i]["firmada"]) and not _es_rev(_i):
					_abre_selfie()
				else:
					_sigue()
		"escolta":

			if not _escolta.is_empty() and String(_escolta["va"]) == "va" \
					and not _andando(_escolta):
				_saca(_cola[_i])
				_fase = "saca"
				_fase_t = c.t
		"saca":

			if c.t >= _fase_t + ESCOLTA_VE:
				_siguiente()




func _sigue() -> void:
	var f: Dictionary = _cola[_i]
	var camino: Array =(cfg.get("salida", []) as Array).duplicate()
	if _otra_visita(_i) >= 0:
		camino.append(_fuera())
		f["rev_fase"] = "sale"
	else:
		camino.append(_hecho(_i))
	_anda(f, camino)
	_siguiente()


func _siguiente() -> void:
	if _i + 1 < N_FIRMAS:
		_turno(_i + 1)
	else:
		_final()




func _abre_selfie() -> void:
	_fase = "selfie"
	_fase_t = c.t
	if c.chyron != null:
		c.chyron.visible = false
	var f: Dictionary = _cola[_i]
	_camara = SelfieCamara.new()
	_camara.monta(c, _cara(f["spr"]), _cara(c.player))
	_selfie = SelfieVisor.new()
	c.add_child(_selfie)
	_selfie.monta(_camara, SelfieMotor.new(hash("%s|%d" % [String(cfg.get("semilla", "marca")),
		_i])), _tomas.size())
	_selfie.hecha.connect(_on_selfie)


	if bool(c.data.get("firma_auto", false)) and not bool(c.data.get("selfie_mano", false)):
		_selfie.sola(AUTO_FALLO[_tomas.size() % AUTO_FALLO.size()])


func _on_selfie(toma: Dictionary) -> void:
	var t: Dictionary = toma.duplicate()
	t["k"] = _i
	t["semilla"] = String(cfg.get("semilla", "marca"))

	t["tipo"] = String(_cola[_i]["tipo"])
	_tomas.append(t)
	_quita_selfie()
	_sigue()


func _quita_selfie() -> void:
	if _selfie != null:
		_selfie.queue_free()
		_selfie = null
	if _camara != null:
		_camara.quita()
		_camara = null






func _cara(spr: AnimatedSprite3D) -> Vector3:
	var alto: float = 64.0
	var arriba: float = 6.0
	var tex: Texture2D = null



	var anim: StringName = &"idle" if spr.sprite_frames != null \
			and spr.sprite_frames.has_animation(&"idle") else spr.animation
	if spr.sprite_frames != null and spr.sprite_frames.has_animation(anim) \
			and spr.sprite_frames.get_frame_count(anim) > 0:
		tex = spr.sprite_frames.get_frame_texture(anim, 0)
	var img: Image = tex.get_image() if tex != null else null
	if img != null and not img.is_empty():
		if img.is_compressed():
			img.decompress()
		alto = float(img.get_height())
		var hallada: bool = false
		for y in img.get_height():
			for x in img.get_width():
				if img.get_pixel(x, y).a > 0.5:
					arriba = float(y)
					hallada = true
					break
			if hallada:
				break
	return spr.global_position + Vector3.UP *((alto * 0.5 - arriba - CARA_BAJO) * spr.pixel_size)


func _abre_lienzo() -> void:
	_fase = "firma"
	_fase_t = c.t
	_a_mesa(_cola[_i], true)
	if c.chyron != null:
		c.chyron.visible = false
	var img: Image = _base()
	var tam: Vector2 = Vector2(img.get_size())
	var z: Rect2 = cfg.get("zona", Rect2(0.08, 0.08, 0.84, 0.84))
	_lienzo = FirmaLienzo.new()
	c.add_child(_lienzo)
	_lienzo.monta(img, Rect2i(Vector2i.ZERO, img.get_size()),
		Rect2i(Vector2i((z.position * tam).round()), Vector2i((z.size * tam).round())),
		String(cfg.get("titulo", "")), I18n.t("Firma con el dedo"),
		"%d / %d" % [_i + 1, N_FIRMAS], LIENZO_PX, LIENZO_ALTO)
	_lienzo.firmada.connect(_on_firmada)

	if (c.embedded or not c.standalone) and not c.replay:
		_lienzo.ofrece_no(Career.firma_fx(FX, true), Career.firma_fx(FX, false))
		_lienzo.negada.connect(_on_negada)
	CareerUi.normalize_caps(_lienzo)
	if bool(c.data.get("firma_auto", false)):
		_lienzo.firma_sola(false)


func _on_firmada(premio: bool, negada: bool = false) -> void:
	var f: Dictionary = _cola[_i]
	_a_mesa(f, false)
	if _lienzo != null:

		if not negada:
			_pon_firmada(f, _lienzo.img)
		_lienzo.queue_free()
		_lienzo = null
	_ms_f = Time.get_ticks_msec()


	if premio and (c.embedded or not c.standalone) and not c.replay:
		RelVivo.lanza(c, Career.firma_resuelve(FX, true))
		_premiado = true
	_fase = "fiesta"
	_fase_t = c.t
	if _es_rev(_i):
		_rev["vista"] = int(_rev["vista"]) + 1
		if not negada:
			_rev["firmadas"] = int(_rev["firmadas"]) + 1
	if not negada:
		_firmadas += 1
		f["firmada"] = true
		f["t_fiesta"] = c.t
		_t_excita = c.t
		c.sting("lone_shout", -16.0)
		_voces("voz_cele", 2, 0.0, 0.6, -14.0)


func _a_mesa(f: Dictionary, si: bool) -> void:
	if bool(f.get("en_mesa", false)) == si:
		return
	f["en_mesa"] = si
	f["mesa_t"] = c.t




func _on_negada() -> void:
	RelVivo.lanza(c, Career.firma_resuelve(FX, false))
	_voces("voz_protesta", 1, 0.0, 0.3, -12.0)
	_on_firmada(false, true)









func _arma_revendedor(plan: Dictionary) -> void:
	if plan.is_empty():
		return
	var k0: int = int(plan["k"])
	var f: Dictionary = _cola[k0]
	var en: int = k0
	var trajes: Array = []
	for v in int(plan["vueltas"]):
		en = Revendedor.vuelta_en(en, N_FIRMAS)
		if en < 0:
			break
		_cola.insert(en, f)
		trajes.append(_traje(f, v + 1))
	if trajes.is_empty():
		return
	var extras: Array = []
	for j in trajes.size():
		extras.append(_pieza())
	f["extras"] = extras
	_rev = {"f": f, "visitas": trajes.size() + 1, "vista": 0, "firmadas": 0,
		"pillado": false, "trajes": trajes}




func _traje(f: Dictionary, vuelta: int) -> AnimatedSprite3D:
	var look: Dictionary = KitRecolor.casual_of(Revendedor.disfraz(
		GenteCalle._ropa(int(f.get("ropa", 13)), _kit, true), vuelta))
	var frames: SpriteFrames = c.player_frames(look, "south")
	var spr: AnimatedSprite3D = _gente(frames, _px_h)
	spr.visible = false
	c.add_walk(spr, look, 1, true)
	_cielo(frames, look)
	return spr


func _es_rev(i: int) -> bool:
	return not _rev.is_empty() and i >= 0 and i < _cola.size() and is_same(_cola[i], _rev["f"])



func _otra_visita(i: int) -> int:
	if not _es_rev(i):
		return -1
	for k in range(i + 1, N_FIRMAS):
		if is_same(_cola[k], _rev["f"]):
			return k
	return -1




func _disfraza(f: Dictionary) -> void:
	var trajes: Array = _rev.get("trajes", [])
	if trajes.is_empty():
		return
	var nuevo: AnimatedSprite3D = trajes.pop_front()
	var viejo: AnimatedSprite3D = f["spr"]
	nuevo.visible = true
	nuevo.position = viejo.position
	f["spr"] = nuevo
	viejo.queue_free()
	f["firmada"] = false
	f["t_fiesta"] = -99.0
	_pon_textura(f["pieza"], cfg.get("pieza") as Texture2D)
	var extras: Array = f.get("extras", [])
	if not extras.is_empty():
		(extras.pop_back() as Sprite3D).queue_free()




func _fuera() -> Vector3:
	if cfg.has("fuera"):
		return cfg["fuera"]
	var dir: Vector3 = _hecho(_i) -(cfg["puesto"] as Vector3)
	dir.y = 0.0
	if dir.length() < 0.01:
		dir = Vector3.RIGHT
	return _hecho(_i) + dir.normalized() * FUERA_M




func _lado_cola(r: int) -> Vector3:
	var d: Vector3 = _slot(r + 1) - _slot(r)
	if r > 0 and d.length() < 0.01:
		d = _slot(r) - _slot(r - 1)
	d.y = 0.0
	if d.length() < 0.01:
		d = Vector3.BACK
	var lado: Vector3 = Vector3(- d.z, 0.0, d.x).normalized()
	if c.cam != null and lado.dot(c.cam.global_position - _slot(r)) < 0.0:
		lado = - lado
	return lado





func _en_fila(desde: int) -> Array[int]:
	var out: Array[int] = []
	var vistos: Dictionary = {}
	var ahora: int = int(_cola[_i].get("id", -1)) if _i < desde and _i < _cola.size() else -2
	for k in range(desde, _cola.size()):
		var f: Dictionary = _cola[k]
		var id: int = int(f.get("id", k))
		if vistos.has(id):
			continue
		vistos[id] = true
		if id == ahora or bool(f.get("echado", false)) \
				or String(f.get("rev_fase", "")) == "sale":
			continue
		out.append(k)
	return out



func _reacomoda(desde: int) -> void:
	var fila: Array[int] = _en_fila(desde)
	for r in fila.size():
		var f: Dictionary = _cola[fila[r]]
		if String(f.get("rev_fase", "")) == "vuelve":
			_anda(f, [_slot(r) + _lado_cola(r) * CUELA_LADO, _slot(r)])
		else:
			_anda(f, [_slot(r)])




func _cuela(f: Dictionary) -> void:
	_disfraza(f)
	f["rev_fase"] = "vuelve"
	var fila: Array[int] = _en_fila(_i + 1)
	var r: int = 0
	for j in fila.size():
		if is_same(_cola[fila[j]], f):
			r = j
	var desde: int = mini(r + CUELA_ATRAS, fila.size())
	var p: Vector3 = _slot(desde) + _lado_cola(desde) * CUELA_DESDE
	f["pos"] = p
	(f["spr"] as AnimatedSprite3D).position = Vector3(p.x, float(f["pie"]), p.z)
	_reacomoda(_i + 1)





func _tick_fuera() -> void:
	for f in _personas:
		match String(f.get("rev_fase", "")):
			"sale":
				if not _andando(f):
					_cuela(f)
			"vuelve":
				if not _andando(f):
					f["rev_fase"] = ""
			"escoltado":
				if not _andando(f):
					_desaparece(f)
	for g in _escoltas:
		match String(g["va"]):
			"lleva":
				if not _andando(g):
					g["va"] = "vuelve"
					var camino: Array =(g["ruta"] as Array).duplicate()
					camino.reverse()
					camino.append(g["casa"])
					_anda(g, camino)
			"vuelve":
				if not _andando(g):
					g["va"] = ""
					c.walk_play(g["spr"], Vector3.ZERO)



func _desaparece(f: Dictionary) -> void:
	f["rev_fase"] = "fuera"
	f["camino"] = []
	(f["spr"] as AnimatedSprite3D).visible = false
	(f["pieza"] as Sprite3D).visible = false
	for x in f.get("extras", []):
		(x as Sprite3D).queue_free()
	f["extras"] = []



func _escoltas_a_casa() -> void:
	for g in _escoltas:
		g["camino"] = []
		g["pos"] = g["casa"]
		g["va"] = ""
		c.walk_play(g["spr"], Vector3.ZERO)



func _ultima_visita() -> int:
	if _rev.is_empty():
		return -1
	for k in range(mini(N_FIRMAS, _cola.size()) - 1, -1, -1):
		if is_same(_cola[k], _rev["f"]):
			return k
	return -1









func seguridad() -> bool:
	if _lienzo == null or not _seguridad_on or _escoltas.is_empty():
		return false
	var f: Dictionary = _cola[_i]
	var pillado: bool = _es_rev(_i)
	_lienzo.queue_free()
	_lienzo = null
	_a_mesa(f, false)
	_ms_f = Time.get_ticks_msec()
	f["echado"] = true
	_fase = "escolta"
	_fase_t = c.t
	var puesto: Vector3 = cfg["puesto"]
	var lado: float = _lado_libre()
	var o: Vector3 =(cfg["mesa"] as Dictionary)["centro"]
	_escolta = _escoltas[0]
	for g in _escoltas:
		if ((g["casa"] as Vector3).x - o.x) * lado >((_escolta["casa"] as Vector3).x - o.x) * lado:
			_escolta = g


	var punta: float = _punta(lado)
	var casa: Vector3 = _escolta["casa"]
	var junto: Vector3 = puesto + Vector3(lado * ESCOLTA_JUNTO, 0.0, - ESCOLTA_JUNTO * 0.6)
	var ida: Array = [Vector3(punta, 0.0, casa.z), Vector3(punta, 0.0, junto.z), junto]
	_escolta["ruta"] = ida
	_escolta["va"] = "va"
	_anda(_escolta, ida)
	if pillado:
		_rev["pillado"] = true
		_quita_visitas()
		_t_excita = c.t
		c.sting("lone_shout", -16.0)
		_voces("voz_cele", 3, 0.2, 1.0, -12.0)
	else:
		_voces("voz_protesta", 1, 0.0, 0.3, -12.0)
	if (c.embedded or not c.standalone) and not c.replay:
		RelVivo.lanza(c, Career.seguridad_resuelve(pillado, String(cfg.get("semilla", "marca")),
			_i, String(f["tipo"]) == "ella"))
	return true




func _quita_visitas() -> void:
	var f: Dictionary = _rev["f"]
	for k in range(_cola.size() - 1, _i, -1):
		if is_same(_cola[k], f):
			_cola.remove_at(k)
	for t in _rev.get("trajes", []):
		(t as AnimatedSprite3D).queue_free()
	_rev["trajes"] = []





func _saca(f: Dictionary) -> void:
	var lado: float = _lado_libre()
	var camino: Array = [cfg.get("fuera_escolta", Vector3(_punta(lado) + lado * FUERA_M, 0.0,
		(f["pos"] as Vector3).z))]
	f["rev_fase"] = "escoltado"
	_anda(f, camino)
	var junto: Vector3 =(_escolta["pos"] as Vector3) -(f["pos"] as Vector3)
	var suyo: Array = []
	for p in camino:
		suyo.append((p as Vector3) + junto)
	(_escolta["ruta"] as Array).append_array(suyo)
	_escolta["va"] = "lleva"
	_anda(_escolta, suyo)




func _lado_libre() -> float:
	var hacia: float = _slot(0).x - _slot(1).x
	return signf(hacia) if absf(hacia) > 0.01 else 1.0



func _punta(lado: float) -> float:
	var m: Dictionary = cfg["mesa"]
	return (m["centro"] as Vector3).x + lado *((m["tam"] as Vector3).x * 0.5 + ESCOLTA_RODEO)




func revendedor() -> String:
	if _rev.is_empty():
		return ""
	return Revendedor.desenlace(bool(_rev["pillado"]), int(_rev["firmadas"]), int(_rev["visitas"]))




func _final() -> void:
	_fase = "fin"
	_fase_t = c.t
	var llega: float = float(_cola[N_FIRMAS - 1]["largo"]) / VEL
	var fin: Callable = cfg["final"]
	c.cam_keys.assign([_cerca(c.t, N_FIRMAS), fin.call(c.t + llega + 0.6)])
	var tw: Tween = c.create_tween()
	tw.tween_interval(llega + 0.2)
	tw.tween_callback(_todos_arriba)

	if not _tomas.is_empty() and (c.embedded or not c.standalone) and not c.replay:
		Career.selfie_publica(_tomas)


	if revendedor() == "reventa" and (c.embedded or not c.standalone) and not c.replay:
		RelVivo.lanza(c, Career.firma_resuelve("reventa", false, 0))
	_fila_selfies()
	_a_la_ficha(llega + FICHA_TRAS)





func _fila_selfies() -> void:
	if _tomas.is_empty() or c.card_box == null:
		return
	var suben: Array = SelfieMotor.a_publicar(_tomas)
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "Selfies"
	v.add_theme_constant_override("separation", 14)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 14)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(cab)
	cab.add_child(_icono_mini("camera", 40.0, CareerTheme.NAV_GENTE))
	var tit: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	tit.text = I18n.t("SELFIES")
	tit.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cab.add_child(tit)
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(hueco)
	if not suben.is_empty():
		cab.add_child(_chip_redes())
	var fotos: HBoxContainer = HBoxContainer.new()
	fotos.alignment = BoxContainer.ALIGNMENT_CENTER
	fotos.add_theme_constant_override("separation", 40)
	fotos.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(fotos)
	for t in _tomas:
		fotos.add_child(_miniatura(t, suben.has(t)))
	c.card_box.add_child(v)

	if c._count_label != null and c._count_label.get_parent() == c.card_box:
		c.card_box.move_child(v, mini(c._count_label.get_index() + 2,
			c.card_box.get_child_count() - 1))
	CareerUi.normalize_caps(v)


func _miniatura(t: Dictionary, sube: bool) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 16)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var marco: Control = Control.new()
	marco.custom_minimum_size = MINI
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(marco)
	var foto: TextureRect = TextureRect.new()
	var img: Image = t.get("img") as Image
	if img != null and not img.is_empty():
		foto.texture = ImageTexture.create_from_image(img)
	foto.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	foto.stretch_mode = TextureRect.STRETCH_SCALE
	foto.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	foto.set_anchors_preset(Control.PRESET_FULL_RECT)
	foto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(foto)
	if sube:
		var borde: Panel = Panel.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.draw_center = false
		sb.border_color = CareerTheme.REDES_MARCA
		sb.set_border_width_all(3)
		sb.expand_margin_left = 3.0
		sb.expand_margin_right = 3.0
		sb.expand_margin_top = 3.0
		sb.expand_margin_bottom = 3.0
		borde.add_theme_stylebox_override("panel", sb)
		borde.set_anchors_preset(Control.PRESET_FULL_RECT)
		borde.mouse_filter = Control.MOUSE_FILTER_IGNORE
		marco.add_child(borde)
		var sello: Panel = Panel.new()
		var sbs: StyleBoxFlat = StyleBoxFlat.new()
		sbs.bg_color = CareerTheme.REDES_MARCA
		sbs.set_corner_radius_all(int(MINI_SELLO * 0.5))
		sello.add_theme_stylebox_override("panel", sbs)
		sello.size = Vector2(MINI_SELLO, MINI_SELLO)
		sello.position = Vector2(MINI.x - MINI_SELLO + 18.0, -18.0)
		sello.mouse_filter = Control.MOUSE_FILTER_IGNORE
		marco.add_child(sello)
		var ic: MenuIcon = _icono_mini("smartphone", 30.0, CareerTheme.TEXT)
		ic.position = Vector2(11.0, 11.0)
		ic.size = Vector2(30.0, 30.0)
		sello.add_child(ic)
	else:
		foto.modulate.a = 0.55
	var est: HBoxContainer = HBoxContainer.new()
	est.alignment = BoxContainer.ALIGNMENT_CENTER
	est.add_theme_constant_override("separation", 6)
	est.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(est)
	var n: int = int(t.get("estrellas", 1))
	var apagada: Color = CareerTheme.TEXT
	apagada.a = 0.22
	for k in 3:
		est.add_child(_icono_mini("media", MINI_ESTRELLA,
			CareerTheme.NAV_GENTE if k < n else apagada))
	return col



func _chip_redes() -> PanelContainer:
	var chip: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.REDES_MARCA_SOFT
	sb.border_color = CareerTheme.REDES_MARCA
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(3)
	sb.content_margin_left = 22.0
	sb.content_margin_right = 22.0
	sb.content_margin_top = 10.0
	sb.content_margin_bottom = 10.0
	chip.add_theme_stylebox_override("panel", sb)
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_child(h)
	h.add_child(_icono_mini("smartphone", 30.0, CareerTheme.REDES_MARCA_INK))
	var l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.REDES_MARCA_INK)
	l.text = I18n.t("A TUS REDES")
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	h.add_child(l)
	return chip


func _icono_mini(tipo: String, lado: float, col: Color) -> MenuIcon:
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(tipo, col)
	ic.custom_minimum_size = Vector2(lado, lado)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return ic


func _a_la_ficha(en: float) -> void:

	c._count_to = _firmadas
	c.card_at = c.t + en
	if c._card_tw != null and c._card_tw.is_valid():
		c._card_tw.kill()
	c._card_tw = c.create_tween()
	c._card_tw.tween_interval(en)
	c._card_tw.tween_callback(c._reveal_card)


func _todos_arriba() -> void:


	if _terminado or c.ficha_puesta:
		return
	_terminado = true
	_t_excita = c.t
	_voces("voz_cele", 3, 0.0, 1.0, -12.0)




func tick(delta: float) -> void:
	_excita = maxf(0.9 if _terminado else 0.4, 1.0 - maxf(c.t - _t_excita, 0.0) / 1.5 * 0.6)
	_tick_gritos()
	_tick_flujo()
	if _seguridad_on:
		_tick_fuera()
	for f in _personas:
		_tick_persona(f)
	for g in _escoltas:
		_tick_persona(g)
	if _lienzo != null:
		_lienzo.tick(delta)
	if _selfie != null:
		_selfie.tick(delta)





func salta() -> bool:
	if _lienzo != null or _selfie != null:
		return true
	if not _terminado and _fase != "fin":
		_salta_a_firma()
		return true
	return false


func _salta_a_firma() -> void:

	var i: int = _i + 1 if _fase in ["fiesta", "selfie", "escolta", "saca"] else _i
	_quita_selfie()
	if _fase == "abre":
		i = 0
	_gritos.clear()
	if c._chyron_tw != null and c._chyron_tw.is_valid():
		c._chyron_tw.kill()
	_escoltas_a_casa()



	for k in i:
		var f: Dictionary = _cola[k]
		f["largo"] = 0.0
		f["en_mesa"] = false

		if bool(f.get("echado", false)):
			_desaparece(f)
		elif not (_es_rev(k) and _ultima_visita() >= i):
			f["camino"] = []
			f["pos"] = _hecho(k)
	if i >= N_FIRMAS:
		_final()
		return
	_i = i
	var f: Dictionary = _cola[i]

	for p in _personas:
		if String(p.get("rev_fase", "")) in ["sale", "vuelve"]:
			if String(p["rev_fase"]) == "sale":
				_disfraza(p)
			p["rev_fase"] = ""
	f["camino"] = []
	f["pos"] = cfg["puesto"]
	var fila: Array[int] = _en_fila(i + 1)
	for r in fila.size():
		_cola[fila[r]]["camino"] = []
		_cola[fila[r]]["pos"] = _slot(r)
	c.cam_keys.assign([_cerca(c.t, i)])
	c._tick_camera()
	for p in _personas:
		_tick_persona(p)
	for g in _escoltas:
		_tick_persona(g)
	_abre_lienzo()



func al_saltar() -> void:
	_quita_selfie()
	_escoltas_a_casa()
	for k in N_FIRMAS:
		var f: Dictionary = _cola[k]
		f["en_mesa"] = false
		if bool(f.get("echado", false)):
			_desaparece(f)
			continue
		f["camino"] = []
		f["pos"] = _hecho(k)
	_terminado = true
	for f in _personas:
		_tick_persona(f)
	for g in _escoltas:
		_tick_persona(g)




func retiene_ficha() -> bool:
	var desde_firma: float = float(Time.get_ticks_msec() - _ms_f) / 1000.0
	return _lienzo != null or _selfie != null or _fase != "fin" \
			or desde_firma < FICHA_TRAS + 4.0 + Ceremony.VIGIA_MARGEN




static func zonas_lienzo(vp: Viewport, pieza: Vector2, titulo: String) -> Array[Rect2]:
	return FirmaLienzo.cajas_cabecera(vp.get_visible_rect(), UiKit.top_safe_inset(vp),
		UiKit.bottom_safe_inset(vp), FirmaLienzo.medida_lienzo(pieza, LIENZO_PX, LIENZO_ALTO),
		titulo, I18n.t("Firma con el dedo"), "%d / %d" % [N_FIRMAS, N_FIRMAS])




func _voces(familia: String, cuantas: int, desde: float, hasta: float, db: float) -> void:
	for i in cuantas:
		_gritos.append([c.t + c.rng.randf_range(desde, hasta),
			"%s_%d" % [familia, c.rng.randi_range(1, int(TOMAS[familia]))],
			db + c.rng.randf_range(-2.5, 1.0), c.rng.randf_range(0.9, 1.14)])


func _tick_gritos() -> void:
	var i: int = 0
	while i < _gritos.size():
		var g: Array = _gritos[i]
		if c.t < float(g[0]):
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
		p.bus = "SFX"
		c.add_child(p)
		p.finished.connect(p.queue_free)
		p.play()















const PHOTOCALL_ATRAS: float = 1.35
const PHOTOCALL_ALTO: float = 2.25
const PHOTOCALL_TESELA_PX: Vector2i = Vector2i(224, 128)


const PHOTOCALL_TESELA_M: Vector2 = Vector2(1.05, 0.6)



const LOGO_SUELO_M: float = 0.9
const LOGO_SUELO_DELANTE: float = 1.3
const MOQUETA_X0: float = -9.0
const MOQUETA_DELANTE: float = 1.9
const ROLLUP_TAM: Vector2 = Vector2(0.8, 2.0)
const ROLLUP_PX: Vector2i = Vector2i(160, 400)
const CORDON_POSTES: int = 4
const CORDON_PASO: float = 1.1
const CORDON_ALTO: float = 0.95
const METAL: Color = Color("2a2d33")
const CROMO: Color = Color("c9ccd2")

func _pon_montaje() -> void:
	var mj: Dictionary = cfg.get("montaje", {})
	if mj.is_empty():
		return
	_moqueta(mj)
	var ph: Variant = mj.get("photocall", {})
	if ph is Dictionary:
		_photocall(mj, ph)
	if bool(mj.get("rollup", true)):
		_rollup(mj)
	if bool(mj.get("focos", true)) and ph is Dictionary:
		_focos_evento(ph)
	_cordon(mj)
	_utileria_de_mesa(mj)





func _moqueta(mj: Dictionary) -> void:
	var o: Vector3 =(cfg["mesa"] as Dictionary)["centro"]
	var tam: Vector3 =(cfg["mesa"] as Dictionary)["tam"]
	var col: Color = Sponsors.color_of(String(mj.get("marca", "")))
	var x0: float = MOQUETA_X0
	var x1: float = o.x + tam.x * 0.5 + 1.15
	var z0: float = o.z - PHOTOCALL_ATRAS
	var z1: float = o.z + MOQUETA_DELANTE
	var cx: float =(x0 + x1) * 0.5
	_caja(Vector3(x1 - x0, 0.006, z1 - z0), Vector3(cx, _suelo + 0.003,(z0 + z1) * 0.5),
		col.darkened(0.62))
	for z: float in [z1 - 0.14, z0 + 0.14]:
		_caja(Vector3(x1 - x0 - 0.2, 0.008, 0.06), Vector3(cx, _suelo + 0.004, z),
			col.darkened(0.2))


	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(LOGO_SUELO_M, LOGO_SUELO_M)
	q.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = _logo_tex(String(mj.get("marca", "")), 96, col.lightened(0.25))
	mat.albedo_color = Color(0.5, 0.5, 0.5)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	q.material_override = mat
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	q.rotation_degrees.x = -90.0
	q.position = Vector3(o.x, _suelo + 0.007, o.z + LOGO_SUELO_DELANTE)
	c.viewport.add_child(q)




func _logo_tex(marca: String, px: int, col: Color) -> Texture2D:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(px, px)
	vp.disable_3d = true
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	c.add_child(vp)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.size = Vector2(px, px)
	vp.add_child(logo)
	logo.setup(marca, col)
	return vp.get_texture()





func _photocall(mj: Dictionary, ph: Dictionary) -> void:
	var o: Vector3 =(cfg["mesa"] as Dictionary)["centro"]
	var tu: Vector3 = cfg["tu"]
	var ancho: float = float(ph.get("ancho", 2.8))
	var cx: float = float(ph.get("x", tu.x - 0.25))
	var z: float = o.z - PHOTOCALL_ATRAS
	var abajo: float = _suelo + 0.08
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(ancho, PHOTOCALL_ALTO)
	q.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()


	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = _tesela_photocall(mj)
	mat.albedo_color = Color(0.86, 0.86, 0.86)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.texture_repeat = true
	mat.uv1_scale = Vector3(ancho / PHOTOCALL_TESELA_M.x, PHOTOCALL_ALTO / PHOTOCALL_TESELA_M.y, 1.0)
	q.material_override = mat
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	q.position = Vector3(cx, abajo + PHOTOCALL_ALTO * 0.5, z)
	c.viewport.add_child(q)

	for lado: float in [-1.0, 1.0]:
		var x: float = cx + lado *(ancho * 0.5 + 0.03)
		_caja(Vector3(0.05, PHOTOCALL_ALTO + 0.14, 0.05),
			Vector3(x, _suelo +(PHOTOCALL_ALTO + 0.14) * 0.5, z - 0.02), METAL)
		_caja(Vector3(0.08, 0.04, 0.6), Vector3(x, _suelo + 0.02, z), METAL)
	_caja(Vector3(ancho + 0.1, 0.05, 0.05), Vector3(cx, abajo + PHOTOCALL_ALTO + 0.03, z - 0.02),
		METAL)




func _tesela_photocall(mj: Dictionary) -> Texture2D:
	var px: Vector2i = PHOTOCALL_TESELA_PX
	var marca: String = String(mj.get("marca", ""))
	var col: Color = Sponsors.color_of(marca)
	var claro: Color = Color("f4f1ec")
	var vp: SubViewport = SubViewport.new()
	vp.size = px
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	c.add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(px)
	vp.add_child(root)
	var fondo: ColorRect = ColorRect.new()
	fondo.color = col.darkened(0.3)
	fondo.size = Vector2(px)
	root.add_child(fondo)
	var mitad: float = float(px.y) * 0.5
	var nombre: String = CareerTheme.caps(String(mj.get("nombre", "")))
	for fila in 2:
		var y: float = mitad * float(fila)
		var logo_x: float = 10.0 if fila == 0 else float(px.x) - 62.0
		var logo: SponsorLogo = SponsorLogo.new()
		logo.position = Vector2(logo_x, y + 6.0)
		logo.size = Vector2(52, 52)
		root.add_child(logo)
		logo.setup(marca, claro)
		var r: Rect2 = Rect2(68.0, y + 6.0, float(px.x) - 74.0, 52.0) if fila == 0 \
				else Rect2(6.0, y + 6.0, float(px.x) - 74.0, 52.0)
		_rotulo(root, _dos_renglones(nombre), r, 18, claro)
	return vp.get_texture()




func _dos_renglones(txt: String) -> String:
	if txt.length() <= 10:
		return txt
	var mejor: int = -1
	for i in txt.length():
		if txt[i] == " " and (mejor < 0
				or absi(i - txt.length() / 2) < absi(mejor - txt.length() / 2)):
			mejor = i
	if mejor < 0:
		return txt
	return txt.substr(0, mejor) + "\n" + txt.substr(mejor + 1)





func _rotulo(root: Control, txt: String, r: Rect2, techo: int, col: Color) -> void:
	var l: Label = Label.new()
	l.text = txt
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.add_theme_color_override("font_color", col)
	l.position = r.position
	l.size = r.size
	root.add_child(l)
	var cuerpo: int = techo
	l.add_theme_font_size_override("font_size", cuerpo)
	while cuerpo > 8 and (l.get_minimum_size().x > r.size.x - 4.0
			or l.get_minimum_size().y > r.size.y):
		cuerpo -= 1
		l.add_theme_font_size_override("font_size", cuerpo)
	l.clip_text = true



	l.size = r.size




func _rollup(mj: Dictionary) -> void:
	var o: Vector3 =(cfg["mesa"] as Dictionary)["centro"]
	var tam: Vector3 =(cfg["mesa"] as Dictionary)["tam"]
	var at: Vector3 = Vector3(o.x + tam.x * 0.5 + 0.6, _suelo, o.z - 0.45)
	var q: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = ROLLUP_TAM
	q.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = _lona_rollup(mj)
	mat.albedo_color = Color(0.86, 0.86, 0.86)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	q.material_override = mat
	q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	q.position = at + Vector3(0.0, 0.1 + ROLLUP_TAM.y * 0.5, 0.0)
	c.viewport.add_child(q)
	_caja(Vector3(ROLLUP_TAM.x + 0.08, 0.1, 0.18), at + Vector3(0.0, 0.05, 0.0), METAL)
	_caja(Vector3(0.03, ROLLUP_TAM.y, 0.03), at + Vector3(0.0, 0.1 + ROLLUP_TAM.y * 0.5, -0.04),
		METAL)


func _lona_rollup(mj: Dictionary) -> Texture2D:
	var px: Vector2i = ROLLUP_PX
	var marca: String = String(mj.get("marca", ""))
	var col: Color = Sponsors.color_of(marca)
	var claro: Color = Color("f4f1ec")
	var vp: SubViewport = SubViewport.new()
	vp.size = px
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	c.add_child(vp)
	var root: Control = Control.new()
	root.size = Vector2(px)
	vp.add_child(root)
	var fondo: ColorRect = ColorRect.new()
	fondo.color = col
	fondo.size = Vector2(px)
	root.add_child(fondo)
	var pie: ColorRect = ColorRect.new()
	pie.color = col.darkened(0.45)
	pie.position = Vector2(0, px.y - 92)
	pie.size = Vector2(px.x, 92)
	root.add_child(pie)
	var logo: SponsorLogo = SponsorLogo.new()
	logo.position = Vector2(float(px.x) * 0.5 - 40.0, 14.0)
	logo.size = Vector2(80, 80)
	root.add_child(logo)
	logo.setup(marca, claro)
	var cara: Image = c.retrato_image(140, 170, KitRecolor.casual_of(GameState.team_custom), 0.5)
	if cara != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = ImageTexture.create_from_image(cara)
		tr.stretch_mode = TextureRect.STRETCH_SCALE
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.position = Vector2(10, 108)
		tr.size = Vector2(140, 170)
		root.add_child(tr)
	_rotulo(root, CareerTheme.caps(Career.nombre_espalda()), Rect2(6, px.y - 88, px.x - 12, 40),
		26, claro)
	_rotulo(root, CareerTheme.caps(String(mj.get("nombre", ""))),
		Rect2(6, px.y - 46, px.x - 12, 36), 16, col.lightened(0.55))
	return vp.get_texture()





func _focos_evento(ph: Dictionary) -> void:
	var o: Vector3 =(cfg["mesa"] as Dictionary)["centro"]
	var tu: Vector3 = cfg["tu"]
	var ancho: float = float(ph.get("ancho", 2.8))
	var cx: float = float(ph.get("x", tu.x - 0.25))
	var z: float = o.z - PHOTOCALL_ATRAS + 0.4
	for lado: float in [-1.0, 1.0]:
		var base: Vector3 = Vector3(cx + lado *(ancho * 0.5 + 0.4), _suelo, z)
		var pie: Node3D = Node3D.new()
		pie.position = base
		pie.rotation.y = atan2(o.x - base.x,(o.z + 0.6) - base.z)
		c.viewport.add_child(pie)
		_caja_en(pie, Vector3(0.0, 0.02, 0.0), Vector3(0.55, 0.04, 0.55), METAL)
		_caja_en(pie, Vector3(0.0, 1.2, 0.0), Vector3(0.04, 2.4, 0.04), METAL)
		var cabeza: Node3D = Node3D.new()
		cabeza.position = Vector3(0.0, 2.5, 0.0)
		cabeza.rotation_degrees.x = -22.0
		pie.add_child(cabeza)
		_caja_en(cabeza, Vector3.ZERO, Vector3(0.6, 0.45, 0.3), Color("1f242c"))
		var cara: MeshInstance3D = _caja_en(cabeza, Vector3(0.0, 0.0, 0.16),
			Vector3(0.52, 0.38, 0.02), Color("fff2d8"))
		var m: StandardMaterial3D = cara.material_override
		m.emission_enabled = true
		m.emission = Color("fff2d8")
		m.emission_energy_multiplier = 0.9






func _cordon(mj: Dictionary) -> void:
	var cola0: Vector3 = cfg["cola_0"]
	var col: Color = Sponsors.color_of(String(mj.get("marca", "")))
	var z: float = cola0.z - 0.27
	var xs: Array[float] = []
	for k in CORDON_POSTES:
		xs.append(cola0.x - 0.1 - CORDON_PASO * float(k))
	for x in xs:
		var p: MeshInstance3D = _cilindro(0.025, CORDON_ALTO, Vector3(x, _suelo + CORDON_ALTO * 0.5, z),
			CROMO)
		p.name = "poste"
		_cilindro(0.15, 0.03, Vector3(x, _suelo + 0.015, z), CROMO)
		_cilindro(0.045, 0.05, Vector3(x, _suelo + CORDON_ALTO + 0.02, z), CROMO)

	var y: float = _suelo + CORDON_ALTO - 0.06
	for k in xs.size() - 1:
		var a: float = xs[k]
		var b: float = xs[k + 1]
		var medio: float =(a + b) * 0.5
		for tramo: Array in [[a, y, medio, y - 0.06], [medio, y - 0.06, b, y]]:
			var x0: float = float(tramo[0])
			var y0: float = float(tramo[1])
			var x1: float = float(tramo[2])
			var y1: float = float(tramo[3])
			var largo: float = Vector2(x1 - x0, y1 - y0).length()
			var t: MeshInstance3D = _caja(Vector3(largo, 0.035, 0.035),
				Vector3((x0 + x1) * 0.5,(y0 + y1) * 0.5, z), col)
			t.rotation.z = atan2(y1 - y0, x1 - x0)


func _cilindro(r: float, h: float, pos: Vector3, color: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: CylinderMesh = CylinderMesh.new()
	mesh.top_radius = r
	mesh.bottom_radius = r
	mesh.height = h
	mesh.radial_segments = 10
	mesh.rings = 1
	m.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.metallic = 0.6
	mat.roughness = 0.35
	m.material_override = mat
	m.position = pos
	c.viewport.add_child(m)
	return m





func _utileria_de_mesa(mj: Dictionary) -> void:
	var m: Dictionary = cfg["mesa"]
	var o: Vector3 = m["centro"]
	var tam: Vector3 = m["tam"]
	var arriba: float = _suelo + tam.y + 0.02
	var col: Color = Sponsors.color_of(String(mj.get("marca", "")))

	var placa_at: Vector3 = Vector3(o.x + 0.24, arriba + 0.05, o.z + 0.2)
	_caja(Vector3(0.36, 0.1, 0.04), placa_at, Color("ecebe6"))
	_caja(Vector3(0.36, 0.018, 0.041), placa_at + Vector3(0.0, -0.041, 0.0), col)
	var l: Label3D = Label3D.new()
	l.text = CareerTheme.caps(Career.nombre_espalda())
	l.modulate = Color("1c1d21")
	l.outline_size = 0
	l.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	l.pixel_size = 0.0012
	l.font_size = _cuerpo_placa(l.text, 0.33 / 0.0012, 48)
	l.position = placa_at + Vector3(0.0, 0.008, 0.021)
	c.viewport.add_child(l)

	var agua: Vector3 = Vector3(o.x - tam.x * 0.5 + 0.1, arriba, o.z - 0.16)
	_cilindro(0.032, 0.2, agua + Vector3(0.0, 0.1, 0.0), Color(0.72, 0.86, 0.95))
	_cilindro(0.02, 0.03, agua + Vector3(0.0, 0.215, 0.0), col)
	var vaso: Vector3 = Vector3(o.x + 0.04, arriba, o.z - 0.2)
	_cilindro(0.04, 0.1, vaso + Vector3(0.0, 0.05, 0.0), Color("1c1d21"))
	for k in 3:
		var r: MeshInstance3D = _caja(Vector3(0.014, 0.14, 0.014),
			vaso + Vector3(-0.015 + 0.015 * float(k), 0.12, 0.0),
			[Color("1c1d21"), col, Color("f4f1ec")][k])
		r.rotation.z =(-0.15 + 0.15 * float(k))




func _cuerpo_placa(txt: String, ancho_px: float, techo: int) -> int:
	var f: Font = c.get_theme_default_font()
	var cuerpo: int = techo
	while cuerpo > 12 and f.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo).x > ancho_px:
		cuerpo -= 1
	return cuerpo




func _caja_en(padre: Node3D, pos: Vector3, tam: Vector3, color: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = tam
	m.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.9
	m.material_override = mat
	m.position = pos
	padre.add_child(m)
	return m
