extends Ceremony





























const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")
const RelVivo := preload("res://ui/ceremonies/rel_vivo.gd")
const GenteCalle := preload("res://ui/ceremonies/gente_calle.gd")


const EncuentroFan := preload("res://ui/ceremonies/encuentro_fan.gd")
const PixelNitido := preload("res://ui/pixel_nitido.gd")

const N_FIRMAS: int = 3


const FIRMA_PIE_FPS: float = 4.0

const ATT: float = 0.95




const FRENTE_X: float = Stadium.SIDE_STAND_X - 1.0
const BARANDILLA_Y: float = 2.28

const TU_X: float = FRENTE_X - 0.55


const FILAS: Array[Vector2] = [Vector2(Stadium.SIDE_STAND_X + 0.3, 1.05),
	Vector2(Stadium.SIDE_STAND_X + 0.85, 1.35)]


const NINO_H: float = 1.32
const NINO_SUELO: float = 1.45



const Z_PRIMERO: float = Stadium.HALF_LINE + 13.0
const PASO_Z: float = 2.1
const TU_DESDE: float = 3.8





const TU_LADO: float = 0.62
const CAMISETA_DZ: float = 0.18
const VEL: float = 1.3


const T_ROTULO: float = 0.6



const ENTREGA: float = 1.25
const BAJA_DUR: float = 0.8
const SUBE_DUR: float = 0.7

const FIESTA: float = 1.9
const FICHA_TRAS: float = 4.2


const ESC: int = 16
const LADO: int = JerseyArt.SIZE * ESC
const CUERPO: Rect2i = Rect2i(JerseyArt.BODY_X0 * ESC, JerseyArt.BODY_Y0 * ESC,
	(JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1) * ESC,
	(JerseyArt.BODY_Y1 - JerseyArt.BODY_Y0 + 1) * ESC)

const CAMISETA_PX: float = 0.0019


const FILA_PECHO: float = 33.0
const FILA_PECHO_ELLA: float = 31.0
const FILAS_CIELO: Array[float] = [13.0, 15.0, 17.0, 15.0]









const HOLGURA: float = 0.03


const PASE_RADIO: float = 0.12





const ASOMA_X: float = FRENTE_X + 0.45
const ASOMA_X_ELLA: float = FRENTE_X + 0.6


const REVERENCIA_CORONILLA: float = 39.0
const ASOMA_CABEZA: float = 0.3


const ALCANZA_DESDE: float = 0.55
const ALCANZA_HASTA: float = 0.5












const CARTEL_CARTON: Color = Color(0.93, 0.88, 0.75)
const CARTEL_CANTO: Color = Color(0.66, 0.55, 0.4)
const CARTEL_TINTA: Color = Color(0.78, 0.1, 0.12)


const CARTEL_MINI: float = 0.5


const CARTEL_PUNTO: int = 24


const CARTEL_MARGEN: int = 16
const CARTEL_BORDE: int = 8


const CARTEL_AGARRE: float = 0.75


const CARTEL_CAE: float = 9.8


const TUS_MANOS_X: float = 0.25
const TUS_MANOS_Y: float = 0.6


const TOMAS: Dictionary = {"voz_pide": 4, "voz_cele": 4, "voz_protesta": 3}
const GESTOS: Array[String] = ["clap", "puno", "cel", "clap", "puno", "idle", "cel",
	"clap", "puno", "clap"]

const GESTO_HOJAS: Dictionary = {
	"clap": ["clap_player_south_", 0, 3, 8.0, true],
	"puno": ["puno_south_", 1, 6, 9.0, true],
	"cel": ["afi_celular_south_", 1, 7, 9.0, false],
}
const LOOKS_HOMBRE: int = 10
const LOOKS_MUJER: int = 6
const GENTE_PASO: float = 0.58

const GENTE_MARGEN: float = 3.4

var _kit_club: Dictionary = {}
var _px_h: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
var _looks: Dictionary = {}


var _muro: Dictionary = {}
var _gente_fans: Array[Dictionary] = []

var _elegidos: Array[Dictionary] = []
var _gritos: Array = []
var _excita: float = 0.5
var _t_excita: float = -10.0

var _i: int = 0
var _fase: String = "anda"
var _fase_t: float = 0.0
var _fase_dur: float = 0.0
var _z_desde: float = 0.0
var _z_hasta: float = 0.0
var _lienzo: FirmaLienzo = null
var _premiado: bool = false
var _premio_lbl: Label = null
var _nota_lbl: Label = null
var _ms_f: int = 0
var _terminado: bool = false
var _nitido_listo: bool = false


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
	focus = Vector3(TU_X, 0.0, _z_fan(0))
	_pon_jugador()
	_pon_elegidos()
	_pon_gente()
	var llega: float =(TU_DESDE - TU_LADO) / VEL
	make_camera([_plano_apertura(0.0), _plano_apertura(1.2, 0.6),
		_cerca(0, llega + 0.2)], 40.0)
	orbit_speed = 0.0
	scrim_dim(0.35)
	make_audio(ATT, false)
	applause(true, -13.0)
	if stadium != null:
		stadium.crowd_excite(0.7)
	for p in stand_flash_pool(_z_fan(1), 7.0):


		if p.x > 0.0:
			flash_pool.append(p)
	flash_rate = 2.5
	_voces("voz_pide", 2, 0.4, 1.8, -14.0)
	_empieza_anda(0, TU_DESDE)
	_rotulo()
	_ficha()



func _rotulo() -> void:
	var sub: String = ""
	var rival: Dictionary = Teams.by_id(String(data.get("rival", "")))
	if not rival.is_empty():
		sub = "%d-%d  %s" % [int(data.get("gf", 0)), int(data.get("ga", 0)),
			CareerTheme.caps(Nations.team_label(rival))]
	make_chyron(I18n.t("FINAL DEL PARTIDO"), CareerTheme.caps(team_name()), team(),
		T_ROTULO, "", sub)


func _z_fan(i: int) -> float:
	return Z_PRIMERO - PASO_Z * float(i)




func _pon_jugador() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(_kit_club, true)
	look["number"] = shirt()
	make_player(look, "south")
	add_walk(player, look)
	add_idle_views(player, look)


	add_gesto(player, "clap", 1, 2.0, look)



	add_gesto(player, "firma_pie", 4, FIRMA_PIE_FPS, look)
	player.position = Vector3(TU_X, feet_offset(player.pixel_size) - PLAYER_SINK,
		_z_fan(0) + TU_DESDE)




	PixelNitido.aplica(player)
	_nitido_laminas()









func _nitido_laminas() -> void:
	if _nitido_listo or not is_instance_valid(player):
		return
	for fila in [_espaldas.get(player, {}), _pechos.get(player, {})]:
		for v in (fila as Dictionary).values():
			if v is Sprite3D and is_instance_valid(v) \
					and not ((v as Sprite3D).material_override is ShaderMaterial):
				PixelNitido.aplica_lamina(v as Sprite3D, player)
	_nitido_listo = _pechos.has(player)











static func quienes(n: int, club: String) -> Array[Dictionary]:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("firmas_grada|%d|%s" % [n, club])
	var tipos: Array[String] = ["el", "ella", "nino"]
	for k in range(tipos.size() - 1, 0, -1):
		var j: int = dado.randi_range(0, k)
		var x: String = tipos[k]
		tipos[k] = tipos[j]
		tipos[j] = x
	var out: Array[Dictionary] = []
	for slot in tipos.size():
		var q: Dictionary = {"tipo": tipos[slot], "slot": slot}
		match tipos[slot]:
			"el":


				q["ropa"] = dado.randi_range(13, 420)
			"ella":
				var looks: Array[String] = []
				for o in GenteCalle.ELLAS_LOOKS:
					if ResourceLoader.exists(Pareja.ANIM_DIR
							+ "mujer_look_%s_idle_south_00.png" % o):
						looks.append(o)
				if looks.is_empty():
					q["tipo"] = "el"
					q["ropa"] = dado.randi_range(13, 420)
				else:
					q["atuendo"] = looks[dado.randi() % looks.size()]

					q["cfg"] = KitRecolor.sin_pelirrojo_oscuro({
						"skin": KitRecolor.SKIN_TONES[dado.randi() % KitRecolor.SKIN_TONES.size()],
						"hair": KitRecolor.HAIR_COLORS[
							Pareja.PELOS[dado.randi() % Pareja.PELOS.size()]]})
			"nino":
				q["semilla"] = "firmas_grada_nino|%d|%s" % [n, club]
		out.append(q)
	return out


func _pon_elegidos() -> void:
	var qs: Array[Dictionary] = quienes(int(data.get("n", 1)), String(data.get("club", "")))
	var hincha: Dictionary = data.get("hincha", {})
	if not hincha.is_empty():
		qs = con_hincha_al_final(qs)
	elif bool(data.get("nino", false)):
		qs = con_nino_al_final(qs)
	for i in qs.size():
		var q: Dictionary = qs[i]
		var z: float = _z_fan(i)
		var f: Dictionary = {}
		match String(q["tipo"]):
			"ella":
				f = _elegida_ella(q, z)
			"nino":
				f = _elegido_nino(q, z)
			"hincha":
				f = _elegido_hincha(q, z, hincha)
		if f.is_empty():
			f = _elegido_el(q, z)
		f["z"] = z
		f["estado"] = "espera"
		f["desde"] = 0.0
		_prepara_camiseta(f, int(q["slot"]))
		if bool(q.get("pide", false)):
			f["pide"] = true
			_prepara_cartel(f)
		_elegidos.append(f)








static func con_nino_al_final(qs: Array[Dictionary]) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var nino: Dictionary = {}
	for q in qs:
		if nino.is_empty() and String(q.get("tipo", "")) == "nino":
			nino = q.duplicate()
		else:
			out.append(q.duplicate())
	if nino.is_empty():
		return qs
	for i in out.size():
		out[i]["slot"] = i + 1
	nino["slot"] = 0
	nino["pide"] = true
	out.append(nino)
	return out









static func con_hincha_al_final(qs: Array[Dictionary]) -> Array[Dictionary]:
	var out: Array[Dictionary] = con_nino_al_final(qs)
	if not out.is_empty() and bool(out[out.size() - 1].get("pide", false)):
		out[out.size() - 1]["tipo"] = "hincha"
	return out


func _elegido_el(q: Dictionary, z: float) -> Dictionary:
	var cfg: Dictionary = KitRecolor.casual_of(GenteCalle._ropa(int(q.get("ropa", 13)),
		_kit_club, true))
	var frames: SpriteFrames = player_frames(cfg, "south")
	var cielo: bool = _cielo(frames, cfg)
	var asoma: bool = _asoma(frames, cfg)
	var spr: AnimatedSprite3D = _gente(frames, _px_h)
	var y: float = FILAS[0].y + feet_offset(_px_h) - PLAYER_SINK
	spr.position = Vector3(FILAS[0].x, y, z)
	return {"tipo": "el", "spr": spr, "y": y, "fila": FILA_PECHO, "cielo": cielo,
		"x0": FILAS[0].x, "x_asoma": ASOMA_X, "alza": _alza(y, _px_h) if asoma else 0.0,
		"asoma": asoma}




func _elegida_ella(q: Dictionary, z: float) -> Dictionary:
	var hoja: String = Pareja.ANIM_DIR + "mujer_look_%s_idle_south_" % String(q["atuendo"])
	if not ResourceLoader.exists(hoja + "00.png"):
		return {}
	var frames: SpriteFrames = player_frames(q["cfg"], "south", hoja, true)
	var spr: AnimatedSprite3D = _gente(frames, PAREJA_PIXEL)
	var y: float = FILAS[0].y + feet_offset(PAREJA_PIXEL, hoja + "00.png") - PLAYER_SINK
	spr.position = Vector3(FILAS[0].x, y, z)
	return {"tipo": "ella", "spr": spr, "y": y, "fila": FILA_PECHO_ELLA, "cielo": false,
		"x0": FILAS[0].x, "x_asoma": ASOMA_X_ELLA, "alza": 0.0, "asoma": false}





func _elegido_nino(q: Dictionary, z: float) -> Dictionary:
	var cfg: Dictionary = KitRecolor.infantil(KitRecolor.appearance_for(
		String(q["semilla"]), KitRecolor.team_only(_kit_club)))
	var frames: SpriteFrames = player_frames(cfg)
	var cielo: bool = _cielo(frames, cfg)
	var asoma: bool = _asoma(frames, cfg)
	var px: float = NINO_H / PLAYER_METRICS.x
	var spr: AnimatedSprite3D = _gente(frames, px)
	var y: float = NINO_SUELO + feet_offset(px) - PLAYER_SINK
	spr.position = Vector3(FILAS[0].x, y, z)
	return {"tipo": "nino", "spr": spr, "y": y, "fila": FILA_PECHO, "cielo": cielo,
		"x0": FILAS[0].x, "x_asoma": ASOMA_X, "alza": _alza(y, px) if asoma else 0.0,
		"asoma": asoma}











func _elegido_hincha(q: Dictionary, z: float, h: Dictionary) -> Dictionary:
	var anos: int = int(h.get("anos", 0))
	var club: Dictionary = Teams.by_id(String(h.get("club", "")))
	var kit: Dictionary = _kit_club if club.is_empty() else GameState.kit_variant(club, 0)
	var cfg: Dictionary = KitRecolor.appearance_for(String(h.get("seed", q.get("semilla", ""))),
		KitRecolor.team_only(kit))
	if anos < EncuentroFan.HINCHA_ADULTO:
		cfg = KitRecolor.infantil(cfg)
	var alto: float = EncuentroFan.hincha_altura(anos)
	var suelo: float = lerpf(NINO_SUELO, FILAS[0].y,
		clampf(inverse_lerp(NINO_H, PLAYER_HEIGHT_M, alto), 0.0, 1.0))
	var frames: SpriteFrames = player_frames(cfg)
	var cielo: bool = _cielo(frames, cfg)
	var asoma: bool = _asoma(frames, cfg)
	var px: float = alto / PLAYER_METRICS.x
	var spr: AnimatedSprite3D = _gente(frames, px)
	var y: float = suelo + feet_offset(px) - PLAYER_SINK
	spr.position = Vector3(FILAS[0].x, y, z)
	return {"tipo": "hincha", "spr": spr, "y": y, "fila": FILA_PECHO, "cielo": cielo,
		"x0": FILAS[0].x, "x_asoma": ASOMA_X, "alza": _alza(y, px) if asoma else 0.0,
		"asoma": asoma}




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




func _asoma(frames: SpriteFrames, cfg: Dictionary) -> bool:
	var path: String = "res://assets/sprites/anim/reverencia_south_01.png"
	if not ResourceLoader.exists(path):
		return false
	var look: Dictionary = frames.get_meta("look_cfg", cfg) if frames.has_meta("look_cfg") \
			else cfg
	frames.add_animation("asoma")
	frames.set_animation_loop("asoma", true)
	frames.add_frame("asoma", KitRecolor.apply(load(path), look))
	return true




func _alza(y: float, px: float) -> float:
	return maxf(0.0, BARANDILLA_Y + ASOMA_CABEZA -(y +(46.0 - REVERENCIA_CORONILLA) * px))







func _pon_gente() -> void:
	_muro = gente_muro(int(data.get("n", 1)), String(data.get("club", "")))
	var z_alto: float = _z_fan(0) + GENTE_MARGEN
	var z_bajo: float = _z_fan(N_FIRMAS - 1) - GENTE_MARGEN
	var ellos: int = 0
	var ellas: int = 0
	var i: int = 0



	var paso: float = GENTE_PASO *(2.0 if Settings.calidad_muy_baja else 1.0)
	for fila in FILAS.size():
		var z: float = z_alto -(paso * 0.5 if fila == 1 else 0.0)
		while z >= z_bajo:
			var libre: bool = true
			for k in N_FIRMAS:
				if absf(z - _z_fan(k)) <(0.48 if fila == 0 else 0.3):
					libre = false
			if libre:
				var p: Vector3 = Vector3(FILAS[fila].x + rng.randf_range(-0.05, 0.05),
					FILAS[fila].y, z + rng.randf_range(-0.06, 0.06))
				var f: Dictionary = {}
				if (i + int(_muro.get("fase", 0))) % 3 == 1:
					f = _fan_mujer(ellas, p)
					ellas += 1
				if f.is_empty():
					f = _fan_hombre(ellos + 1, p)
					ellos += 1
				_gente_fans.append(f)
				i += 1
			z -= paso













static func gente_muro(n: int, club: String) -> Dictionary:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("firmas_grada_muro|%d|%s" % [n, club])
	var vistos: Dictionary = {}
	for q in quienes(n, club):
		vistos[GenteCalle.clave_persona(q)] = true
	var hombres: Array[int] = []


	for intento in LOOKS_HOMBRE * 40:
		if hombres.size() == LOOKS_HOMBRE:
			break
		var ropa: int = dado.randi_range(1, 420)
		var clave: String = GenteCalle.clave_persona({"tipo": "el", "ropa": ropa})
		if not vistos.has(clave):
			vistos[clave] = true
			hombres.append(ropa)
	while hombres.size() < LOOKS_HOMBRE:
		hombres.append(hombres.size() + 1)
	var muro: Dictionary = {"hombres": hombres, "fase": dado.randi() % 3}
	var looks: Array[String] = []
	for o in GenteCalle.ELLAS_LOOKS:
		if ResourceLoader.exists(Pareja.ANIM_DIR + "mujer_look_%s_idle_south_00.png" % o):
			looks.append(o)




	var mujeres: Array[Dictionary] = []
	if not looks.is_empty():
		for intento in LOOKS_MUJER * 40:
			if mujeres.size() == LOOKS_MUJER:
				break

			var q: Dictionary = {"tipo": "ella", "atuendo": looks[dado.randi() % looks.size()],
				"cfg": KitRecolor.sin_pelirrojo_oscuro({
					"skin": KitRecolor.SKIN_TONES[dado.randi() % KitRecolor.SKIN_TONES.size()],
					"hair": KitRecolor.HAIR_COLORS[
						Pareja.PELOS[dado.randi() % Pareja.PELOS.size()]]})}
			var clave: String = GenteCalle.clave_persona(q)
			if not vistos.has(clave):
				vistos[clave] = true
				mujeres.append(q)
	muro["mujeres"] = mujeres
	return muro


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


func _fan_hombre(i: int, p: Vector3) -> Dictionary:
	var j: int =(i - 1) % LOOKS_HOMBRE + 1
	var clave: String = "h%d" % j
	if not _looks.has(clave):
		var ropa: Dictionary = GenteCalle._ropa(int(_muro["hombres"][j - 1]), _kit_club, true)
		var cfg: Dictionary = KitRecolor.casual_of(ropa)
		var frames: SpriteFrames = player_frames(cfg, "south")
		var tipo: String = GESTOS[j % GESTOS.size()]
		_gesto(frames, frames.get_meta("look_cfg", cfg), tipo)
		_looks[clave] = [frames, tipo]
	var look: Array = _looks[clave]
	var spr: AnimatedSprite3D = _gente(look[0], _px_h)
	spr.flip_h =((i - 1) / LOOKS_HOMBRE) % 2 == 1
	var y: float = p.y + feet_offset(_px_h) - PLAYER_SINK
	spr.position = Vector3(p.x, y, p.z)
	return _ficha_fan(spr, y, String(look[1]))


func _fan_mujer(i: int, p: Vector3) -> Dictionary:

	var mujeres: Array = _muro.get("mujeres", [])
	if mujeres.is_empty():
		return {}
	var j: int = i % mini(LOOKS_MUJER, mujeres.size())
	var q: Dictionary = mujeres[j]
	var hoja: String = Pareja.ANIM_DIR + "mujer_look_%s_idle_south_" % String(q["atuendo"])
	var clave: String = "m%d" % j
	if not _looks.has(clave):
		_looks[clave] = player_frames(q["cfg"], "south", hoja, true)
	var spr: AnimatedSprite3D = _gente(_looks[clave], PAREJA_PIXEL)
	spr.flip_h =(i / LOOKS_MUJER) % 2 == 1
	var y: float = p.y + feet_offset(PAREJA_PIXEL, hoja + "00.png") - PLAYER_SINK
	spr.position = Vector3(p.x, y, p.z)
	return _ficha_fan(spr, y, "idle")


func _ficha_fan(spr: AnimatedSprite3D, y: float, tipo: String) -> Dictionary:
	return {"spr": spr, "y": y, "tipo": tipo, "on": false,
		"desde": rng.randf_range(0.0, 1.6) if tipo != "idle" else INF,
		"ritmo": rng.randf_range(7.0, 10.0), "fase": rng.randf_range(0.0, TAU),
		"amp": rng.randf_range(0.03, 0.07)}


func _gesto(frames: SpriteFrames, cfg: Dictionary, tipo: String) -> void:
	if not GESTO_HOJAS.has(tipo):
		return
	var hoja: Array = GESTO_HOJAS[tipo]
	frames.add_animation("gesto")
	frames.set_animation_speed("gesto", float(hoja[3]))
	frames.set_animation_loop("gesto", bool(hoja[4]))
	for k in range(int(hoja[1]), int(hoja[2]) + 1):
		var path: String = "res://assets/sprites/anim/%s%02d.png" % [hoja[0], k]
		if ResourceLoader.exists(path):
			frames.add_frame("gesto", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("gesto") == 0:
		frames.remove_animation("gesto")




func _tick_gente() -> void:
	var base: float = 0.9 if _terminado else 0.5
	_excita = maxf(base, 1.0 - maxf(t - _t_excita, 0.0) / 1.5 * 0.5)
	for f in _gente_fans:
		var spr: AnimatedSprite3D = f["spr"]
		if not bool(f["on"]) and t >= float(f["desde"]):
			f["on"] = true
			if spr.sprite_frames.has_animation("gesto"):
				spr.play("gesto")
				if spr.sprite_frames.get_animation_loop("gesto"):
					spr.frame = rng.randi() % spr.sprite_frames.get_frame_count("gesto")
		var bote: float = absf(sin(t * float(f["ritmo"]) + float(f["fase"])))
		spr.position.y = float(f["y"]) + bote * float(f["amp"]) * _excita






func _prepara_camiseta(f: Dictionary, slot: int) -> void:
	var kit: Dictionary = GameState.kit_variant(team(), slot)
	var tex: Texture2D = JerseyArt.texture_named(kit, shirt(), Career.nombre_espalda(), ESC)
	if tex == null:
		tex = JerseyArt.texture(kit, shirt())
	if tex == null:
		return



	var raw: Image = tex.get_image()
	if raw == null or raw.is_empty():
		return
	var img: Image = raw.duplicate()
	if img.is_compressed():
		img.decompress()
	img.convert(Image.FORMAT_RGBA8)
	if img.get_width() != LADO or img.get_height() != LADO:
		img.resize(LADO, LADO, Image.INTERPOLATE_NEAREST)
	f["base"] = img
	f["img"] = img
	_mide(f)
	var cam: Sprite3D = Sprite3D.new()
	cam.pixel_size = CAMISETA_PX
	cam.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y


	cam.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS
	cam.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	cam.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(cam)
	f["camiseta"] = cam
	_sube_prenda(f)









static func cartel_img(camiseta: Image) -> Image:
	var img: Image = Image.create(LADO, LADO, false, Image.FORMAT_RGBA8)
	img.fill(Color(0.0, 0.0, 0.0, 0.0))
	var pinta: Image = null
	if camiseta != null:
		var tela: Image = camiseta.duplicate()
		if tela.is_compressed():
			tela.decompress()
		tela.convert(Image.FORMAT_RGBA8)
		var usado: Rect2i = tela.get_used_rect()
		if usado.has_area():
			pinta = tela.get_region(usado)
			pinta.resize(maxi(1, roundi(usado.size.x * CARTEL_MINI)),
				maxi(1, roundi(usado.size.y * CARTEL_MINI)), Image.INTERPOLATE_NEAREST)
	var q_w: int = PixelText.GLYPH_W * CARTEL_PUNTO
	var q_h: int = PixelText.GLYPH_H * CARTEL_PUNTO
	var pinta_w: int = pinta.get_width() + CARTEL_MARGEN if pinta != null else 0
	var dentro: Vector2i = Vector2i(pinta_w + q_w,
		maxi(q_h, pinta.get_height() if pinta != null else 0))
	var caja: Vector2i = dentro + Vector2i.ONE * 2 *(CARTEL_MARGEN + CARTEL_BORDE)
	caja.x = mini(caja.x, LADO)
	var o: Vector2i = Vector2i((LADO - caja.x) / 2, CUERPO.position.y)
	img.fill_rect(Rect2i(o, caja), CARTEL_CANTO)
	img.fill_rect(Rect2i(o + Vector2i.ONE * CARTEL_BORDE, caja - Vector2i.ONE * 2 * CARTEL_BORDE),
		CARTEL_CARTON)
	var d: Vector2i = o + Vector2i.ONE *(CARTEL_BORDE + CARTEL_MARGEN)
	if pinta != null:
		img.blend_rect(pinta, Rect2i(Vector2i.ZERO, pinta.get_size()),
			d + Vector2i(0,(dentro.y - pinta.get_height()) / 2))
	PixelText.draw_text(img, d.x + pinta_w, d.y +(dentro.y - q_h) / 2, "?", CARTEL_TINTA,
		CARTEL_PUNTO)
	return img





func _prepara_cartel(f: Dictionary) -> void:
	var img: Image = cartel_img(f.get("base"))
	var usado: Rect2i = img.get_used_rect()
	var spr: Sprite3D = Sprite3D.new()
	spr.pixel_size = CAMISETA_PX
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	var m: Image = img.duplicate()
	m.generate_mipmaps()
	spr.texture = ImageTexture.create_from_image(m)
	viewport.add_child(spr)
	f["cartel"] = spr
	f["cartel_sube"] = float(usado.size.y) * CARTEL_AGARRE * CAMISETA_PX
	f["cartel_medio"] = float(usado.size.x) * 0.5 * CAMISETA_PX



func _sube_prenda(f: Dictionary) -> void:
	var cam: Sprite3D = f.get("camiseta")
	if cam == null or f.get("img") == null:
		return
	var m: Image =(f["img"] as Image).duplicate()
	m.generate_mipmaps()
	cam.texture = ImageTexture.create_from_image(m)





func _mide(f: Dictionary) -> void:
	var img: Image = f.get("img")
	if img == null:
		return
	var usado: Rect2i = img.get_used_rect()
	if not usado.has_area():
		usado = Rect2i(0, 0, LADO, LADO)
	var medio: float = float(LADO) * 0.5
	f["medio"] = maxf(absf(float(usado.position.x) - medio), absf(float(usado.end.x) - medio)) \
			* CAMISETA_PX
	f["bajo"] =(float(usado.end.y) - medio) * CAMISETA_PX





func _canto(f: Dictionary) -> float:
	return _canto_de(float(f.get("medio", float(LADO) * 0.5 * CAMISETA_PX)))



func _canto_de(medio: float) -> float:
	if cam == null:
		return medio
	var z: Vector3 = cam.global_transform.basis.z
	var eje: Vector2 = Vector2(z.z, - z.x)
	return medio *(absf(eje.normalized().x) if eje.length() > 0.001 else 1.0)






func _en_manos(f: Dictionary) -> Vector3:
	var spr: AnimatedSprite3D = f["spr"]
	var fila: float = float(f["fila"])
	if bool(f["cielo"]):
		var cuadro: int = spr.frame if spr.animation == &"cielo" else 1
		fila = FILAS_CIELO[cuadro % FILAS_CIELO.size()]
	var p: Vector3 = Vector3(float(f["x0"]), float(f["y"]) + float(f.get("bote", 0.0)),
		spr.position.z)
	if cam != null:
		var mira: Vector3 = cam.global_position - p
		mira.y = 0.0
		if mira.length() > 0.01:
			p += mira.normalized() * 0.14
	p.x = maxf(p.x, Stadium.SIDE_STAND_X + _canto(f) + HOLGURA)
	p.y +=(46.0 - fila) * spr.pixel_size \
			-(float(LADO) * 0.5 - float(CUERPO.position.y)) * CAMISETA_PX
	return p




func _en_barandilla(f: Dictionary) -> Vector3:
	return Vector3(FRENTE_X - _canto(f) - HOLGURA,
		BARANDILLA_Y + 0.05 -(float(LADO) * 0.5 - float(CUERPO.position.y)) * CAMISETA_PX,
		float(f["z"]) + CAMISETA_DZ)




func _pase(f: Dictionary, k: float) -> Vector3:
	return ruta_pase(_en_manos(f), _en_barandilla(f),
		BARANDILLA_Y + HOLGURA + float(f.get("bajo", 0.35)) + PASE_RADIO, PASE_RADIO, k)





func _de_tus_manos(f: Dictionary, k: float) -> Vector3:
	var r: Vector3 = _en_barandilla(f)
	var z: float = float(f["z"])
	return Vector3(r.x - TUS_MANOS_X, r.y - TUS_MANOS_Y, lerpf(z, z + TU_LADO, 0.5)).lerp(r, k)














static func ruta_pase(m: Vector3, r: Vector3, alto: float, radio: float, k: float) -> Vector3:
	var u: Vector3 = Vector3(m.x, maxf(alto, m.y), m.z)
	var e: Vector3 = Vector3(r.x, maxf(alto, r.y), r.z)
	var pts: PackedVector3Array = PackedVector3Array([m])
	_esquina(pts, m, u, e, radio)
	_esquina(pts, u, e, r, radio)
	pts.append(r)
	var acum: PackedFloat32Array = PackedFloat32Array([0.0])
	for i in range(1, pts.size()):
		acum.append(acum[i - 1] + pts[i].distance_to(pts[i - 1]))
	var total: float = acum[acum.size() - 1]
	if total <= 0.0001:
		return r
	var s: float = clampf(k, 0.0, 1.0) * total
	for i in range(1, pts.size()):
		if s <= acum[i]:
			var tramo: float = acum[i] - acum[i - 1]
			return pts[i - 1].lerp(pts[i],(s - acum[i - 1]) / tramo if tramo > 0.0 else 1.0)
	return r





static func _esquina(pts: PackedVector3Array, a: Vector3, c: Vector3, b: Vector3,
		radio: float) -> void:
	var ra: float = minf(radio, minf(a.distance_to(c), b.distance_to(c)) * 0.5)
	var p0: Vector3 = c +(a - c).normalized() * ra
	var p1: Vector3 = c +(b - c).normalized() * ra
	for j in 9:
		var q: float = float(j) / 8.0
		pts.append(p0.lerp(c, q).lerp(c.lerp(p1, q), q))




func _asomo(estado: String, k: float) -> float:
	match estado:
		"baja":
			return smoothstep(0.2, 0.7, k)
		"firma":
			return 1.0
		"sube":
			return 1.0 - smoothstep(0.3, 0.8, k)
	return 0.0




func _tick_elegidos() -> void:
	for f in _elegidos:
		var spr: AnimatedSprite3D = f["spr"]
		var estado: String = String(f["estado"])
		var desde: float = float(f["desde"])
		var k: float = 0.0
		if estado == "baja":
			k = clampf((t - desde) / BAJA_DUR, 0.0, 1.0)
		elif estado == "sube":
			k = clampf((t - desde) / SUBE_DUR, 0.0, 1.0)
		var asomo: float = smoothstep(0.0, 1.0, _asomo(estado, k))
		var quiere: String = "idle"
		if bool(f["asoma"]) and asomo > 0.5:
			quiere = "asoma"
		elif bool(f["cielo"]):
			quiere = "cielo"
		if spr.animation != quiere:
			spr.play(quiere)
		var fuerza: float = 1.4 if estado == "fiesta" and t < desde + FIESTA else 1.0
		var bote: float = 0.0
		if estado in ["espera", "fiesta"]:
			bote = absf(sin(t * 8.5 + float(f["z"]))) * 0.05 * fuerza * _excita
		f["bote"] = bote
		spr.position.x = lerpf(float(f["x0"]), float(f["x_asoma"]), asomo)
		spr.position.y = float(f["y"]) + bote + float(f["alza"]) * asomo
		_tick_cartel(f, estado, asomo)
		var cam3: Sprite3D = f.get("camiseta")
		if cam3 == null:
			continue


		var pide: bool = bool(f.get("pide", false))
		cam3.visible = not (pide and estado == "espera")
		cam3.scale = Vector3.ONE *(clampf(k * 6.0, 0.0, 1.0) if pide and estado == "baja"
			else 1.0)
		match estado:
			"baja":
				var kb: float = smoothstep(0.0, 1.0, k)
				cam3.position = _de_tus_manos(f, kb) if pide else _pase(f, kb)
				if k >= 1.0:
					f["estado"] = "firma"
			"firma":
				cam3.position = _en_barandilla(f)
			"sube":
				cam3.position = _pase(f, 1.0 - smoothstep(0.0, 1.0, k))
				if k >= 1.0:
					f["estado"] = "fiesta"
			_:
				cam3.position = _en_manos(f)





func _tick_cartel(f: Dictionary, estado: String, asomo: float) -> void:
	var spr: Sprite3D = f.get("cartel")
	if spr == null:
		return
	var cuello: float =(float(LADO) * 0.5 - float(CUERPO.position.y)) * CAMISETA_PX
	if not f.has("solto"):
		var p: Vector3 = _en_manos(f) + Vector3.UP * float(f["cartel_sube"])
		p.x = maxf(p.x, Stadium.SIDE_STAND_X + _canto_de(float(f["cartel_medio"])) + HOLGURA)
		spr.position = p
		if estado == "espera" or (estado == "baja" and asomo <= 0.5):
			spr.visible = true
			return
		f["solto"] = t if estado == "baja" else t - 10.0
		f["solto_p"] = p
	var dt: float = t - float(f["solto"])
	var cae: Vector3 = f["solto_p"]
	cae.y -= 0.5 * CARTEL_CAE * dt * dt
	spr.position = cae
	spr.visible = cae.y + cuello > BARANDILLA_Y





func _empieza_anda(i: int, desde_dz: float) -> void:
	_i = i
	_fase = "anda"
	_fase_t = t
	_z_desde = _z_fan(i) + desde_dz
	_z_hasta = _z_fan(i) + TU_LADO
	_fase_dur = absf(_z_hasta - _z_desde) / VEL


func _tick_flujo() -> void:
	if player == null:
		return
	match _fase:
		"anda":
			var k: float = clampf((t - _fase_t) / maxf(_fase_dur, 0.01), 0.0, 1.0)
			player.position.z = lerpf(_z_desde, _z_hasta, k)
			if k >= 1.0:
				walk_play(player, Vector3.ZERO)
				_empieza_entrega()
			else:
				walk_play(player, Vector3(0.0, 0.0, signf(_z_hasta - _z_desde)))
		"entrega":
			_pose_jugador()
			if t >= _fase_t + ENTREGA:
				_abre_lienzo()
		"firma":
			_pose_jugador()
		"fiesta":
			_pose_jugador()
			if t >= _fase_t + FIESTA:
				if _i + 1 < N_FIRMAS:
					_empieza_anda(_i + 1, PASO_Z + TU_LADO)
					cam_keys.assign([_cerca(_i - 1, t, 0.35), _cerca(_i, t + _fase_dur + 0.15)])
					_voces("voz_pide", 2, 0.2, 1.2, -13.0)
				else:
					_final()
		"fin":

			idle_play(player, Vector3.ZERO)






func _pose_jugador() -> void:
	var f: Dictionary = _elegidos[_i] if _i < _elegidos.size() else {}
	var desde: float = float(f.get("desde", 0.0))
	var arriba: bool = false
	match String(f.get("estado", "")):
		"baja":
			arriba = t - desde >= BAJA_DUR * ALCANZA_DESDE
		"firma":
			arriba = true
		"sube":
			arriba = t - desde <= SUBE_DUR * ALCANZA_HASTA


	if String(f.get("estado", "")) == "firma" \
			and gesto_sostiene(player, "firma_pie", Vector3.RIGHT):
		return
	var alzado: bool = String(player.animation).begins_with("clap_")
	if arriba and (alzado or gesto_play(player, "clap", Vector3.RIGHT)):
		return


	if alzado or String(player.animation).begins_with("firma_pie_"):
		player.stop()
	idle_play(player, Vector3.RIGHT)



func _empieza_entrega() -> void:
	_fase = "entrega"
	_fase_t = t
	var f: Dictionary = _elegidos[_i]
	f["estado"] = "baja"
	f["desde"] = t
	sting("lone_shout", -15.0)


func _abre_lienzo() -> void:
	var f: Dictionary = _elegidos[_i]
	_fase = "firma"
	_fase_t = t
	if f.get("base") == null:
		_on_firmada(false)
		return
	if chyron != null:
		chyron.visible = false
	flash_rate = 0.0
	_lienzo = FirmaLienzo.new()
	add_child(_lienzo)
	var img: Image = f["base"]
	var usado: Rect2i = img.get_used_rect().grow(12)
	var recorte: Rect2i = usado.intersection(Rect2i(0, 0, LADO, LADO)) if usado.has_area() \
			else Rect2i(0, 0, LADO, LADO)



	var pide: bool = bool(f.get("pide", false))
	var sub: String = I18n.t("Firma con el dedo")
	if pide:
		sub = I18n.t("Es para tu hincha de siempre") if String(f.get("tipo", "")) == "hincha" \
				else I18n.t("Es para el niño del cartel")
	_lienzo.monta(img, recorte, CUERPO,
		I18n.t("FIRMA TU CAMISETA") if pide else I18n.t("FIRMA LA CAMISETA"),
		sub, "%d / %d" % [_i + 1, N_FIRMAS])
	_lienzo.firmada.connect(_on_firmada)

	if (embedded or not standalone) and not replay:
		_lienzo.ofrece_no(Career.firma_fx("grada", true), Career.firma_fx("grada", false))
		_lienzo.negada.connect(_on_negada)
	CareerUi.normalize_caps(_lienzo)
	if bool(data.get("firma_auto", false)):
		_lienzo.firma_sola(false)




func _on_firmada(premio: bool, negada: bool = false) -> void:
	var f: Dictionary = _elegidos[_i]
	if _lienzo != null:

		if not negada:
			f["img"] = _lienzo.img.duplicate()
		_lienzo.queue_free()
		_lienzo = null
	_sube_prenda(f)
	_mide(f)
	f["estado"] = "sube"
	f["desde"] = t
	_ms_f = Time.get_ticks_msec()





	if premio and (embedded or not standalone) and not replay:
		RelVivo.lanza(self, Career.firmas_grada_firmadas())
		if not _premiado:
			_premiado = true
			if _premio_lbl != null:
				_premio_lbl.visible = true



	if String(f.get("tipo", "")) == "hincha" and f.get("base") != null \
			and (embedded or not standalone) and not replay:
		Career.hincha_camiseta(not negada)
	if negada and String(f.get("tipo", "")) == "hincha" and _nota_lbl != null:
		_nota_lbl.text = I18n.gritado_seguro(I18n.t("Le negaste tu camiseta a tu hincha de siempre."))
	if negada:

		_fase = "fiesta"
		_fase_t = t
		_voces("voz_protesta", 2, 0.05, 0.8, -11.0)
		cam_keys.assign([_cerca(_i, t), _cerca(_i, t + FIESTA, 0.35)])
		return
	_fase = "fiesta"
	_fase_t = t
	_t_excita = t
	screen_flash(0.18)
	punch_fov(1.5, 0.3)
	applause(true, -9.0)
	ovation(-10.0)
	_voces("voz_cele", 3, 0.1, 1.5, -10.0)
	if stadium != null:
		stadium.crowd_excite(1.0)
	flash_burst_at = t
	flash_rate = 3.0
	cam_keys.assign([_cerca(_i, t), _cerca(_i, t + FIESTA, 0.35)])



func _on_negada() -> void:
	RelVivo.lanza(self, Career.firma_resuelve("grada", false))
	_on_firmada(false, true)




func _final() -> void:
	_fase = "fin"
	_fase_t = t
	_terminado = true
	sting("fanfare", -9.0)
	ovation(-5.0)
	if stadium != null:
		stadium.crowd_greet(1.0, 5.0)
		stadium.crowd_excite(1.0)
	if audio != null:
		audio.set_chant(true)
	flash_burst_at = t
	flash_rate = 6.0
	cam_keys.assign([_cerca(N_FIRMAS - 1, t, 0.35), _plano_final(t + 3.2)])
	orbit_speed = 0.0
	card_at = t + FICHA_TRAS
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	_card_tw = create_tween()
	_card_tw.tween_interval(FICHA_TRAS)
	_card_tw.tween_callback(_reveal_card)














func _cerca(i: int, tk: float, empuje: float = 0.0) -> Dictionary:
	return {"t": tk, "dist": 7.5 - empuje * 1.5, "h": 4.2, "yaw": 315.0,
		"aim_y": 1.95 + empuje * 0.1, "fov": 38.0, "focus_x": FRENTE_X + 0.3,
		"focus_z": _z_fan(i) + 0.3}



func _plano_apertura(tk: float, deriva: float = 0.0) -> Dictionary:
	return {"t": tk, "dist": 12.5 - deriva, "h": 3.4, "yaw": 246.0 + deriva * 2.0,
		"aim_y": 2.6, "fov": 40.0, "focus_x": FRENTE_X + 1.0,
		"focus_z": _z_fan(1) + 1.2}




func _plano_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 12.0, "h": 4.5, "yaw": 320.0, "aim_y": 2.0, "fov": 32.0,
		"focus_x": FRENTE_X + 0.6, "focus_z": _z_fan(1) + 0.2}





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
	_nitido_laminas()
	_tick_gritos()
	_tick_flujo()
	_tick_gente()
	_tick_elegidos()
	if _lienzo != null:
		_lienzo.tick(delta)





func _on_skip() -> void:
	if _lienzo != null:
		return
	if not _terminado:
		_salta_a_firma()
		return
	super._on_skip()


func _salta_a_firma() -> void:

	var i: int = _i + 1 if _fase == "fiesta" else _i
	if i >= N_FIRMAS:
		_final()
		return
	_gritos.clear()
	if _chyron_tw != null and _chyron_tw.is_valid():
		_chyron_tw.kill()

	for k in i:
		if String(_elegidos[k]["estado"]) in ["sube", "baja", "firma", "espera"]:
			_elegidos[k]["estado"] = "fiesta"
			_elegidos[k]["desde"] = t - FIESTA
	_i = i
	player.position.z = _z_fan(i) + TU_LADO
	walk_play(player, Vector3.ZERO)
	var f: Dictionary = _elegidos[i]
	f["estado"] = "firma"
	f["desde"] = t
	cam_keys.assign([_cerca(i, t)])
	_tick_camera()
	_tick_elegidos()
	_abre_lienzo()



func _skipped() -> void:
	for f in _elegidos:
		f["estado"] = "fiesta"
		f["desde"] = t - FIESTA
	_tick_elegidos()




func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	var desde_firma: float = float(Time.get_ticks_msec() - _ms_f) / 1000.0
	if _lienzo != null or not _terminado or desde_firma < FICHA_TRAS + VIGIA_MARGEN:
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()




func _ficha() -> void:
	make_card(40.0)

	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("TRES CAMISETAS PARA LA GRADA"), 40)
	card_count(N_FIRMAS, I18n.t("CAMISETAS FIRMADAS"))
	_nota_lbl = card_note(_nota())
	_premio_lbl = CareerUi.plain(CareerTheme.T_BODY, text_accent())
	_premio_lbl.text = I18n.tf("AFICIÓN +{0}", [1])
	_premio_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_premio_lbl.clip_text = true
	_premio_lbl.visible = false
	card_box.add_child(_premio_lbl)
	card_cta(I18n.t("AL VESTUARIO"))




func _nota() -> String:
	if not (data.get("hincha", {}) as Dictionary).is_empty():
		return I18n.t("Tu hincha de siempre se lleva tu camiseta.")
	if bool(data.get("nino", false)):
		return I18n.t("Marcaste, y el niño del cartel se lleva tu camiseta.")
	if int(data.get("gf", 0)) > int(data.get("ga", 0)):
		return I18n.t("Ganaste, y tres se van a casa con tu firma.")
	return I18n.t("No hubo victoria, pero tres se van a casa con tu firma.")
