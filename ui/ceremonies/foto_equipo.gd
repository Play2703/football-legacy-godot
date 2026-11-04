extends Ceremony














































const X0: float = 28.0





const Z_C: float = 48.0



const SLOT: float = 0.82









const SEAT_TOP: float = 0.4
const STEP1: float = 0.5
const STEP2: float = 1.0



const X_MEDIA: float = 0.95
const X_ATRAS: float = 1.75




const BANCO_X: Vector2 = Vector2(0.1, 0.55)
const PELDANO1_X: float = 0.62
const PELDANO2_X: float = 1.38
const GRADA_FONDO_X: float = 2.4




const JUGADORES_MAX: int = 21

const PORTEROS_MAX: int = 3







const SENTADO_PREFIX: String = "res://assets/sprites/anim/sentado_foto_south_"

const SENTADO_TRASERO: int = 69











const TROFEOS_MAX: int = 3
const TROFEO_ALTO: float = 0.55
const TROFEO_HUNDE: float = 0.06
const TROFEO_X: float = -0.55
const PEANA_ALTO: float = 0.26
const PEANA_LADO: float = 0.36

const TROFEO_PLAZAS: Dictionary = {1: [0], 2: [-1, 1], 3: [0, -1, 1]}





const CAM_DIST: float = 18.0
const CAM_H: float = 1.9

const CENTRO_Y: float = 1.35



const GRUPO_ANCHO: float = 0.78
const GRUPO_ALTO: float = 1.05




const CENTRO_PANTALLA_PIE: float = 0.37
const CENTRO_PANTALLA_TUMBADO: float = 0.53



const GRUPO_ALTO_CENTRADO: float = 0.85
const CENTRO_PANTALLA_CENTRADO: float = 0.335

const TIRA_TITULO: int = 32
const TIRA_BOTON_W: float = 300.0
const TIRA_BOTON_H: float = 84.0





const T_CORTE_FOTOGRAFO: float = 3.4
const T_CORTE_FRENTE: float = 6.0
const T_FOTO: float = 7.5
const T_FICHA: float = 8.9

const JUNTOS_T: Vector2 = Vector2(3.65, 4.85)
const A_LA_DE_TRES_T: Vector2 = Vector2(5.0, 5.95)


const CUENTA_T0: float = 6.15
const CUENTA_PASO: float = 0.45

const BOCADILLO_FUNDE: float = 0.18
const BOCADILLO_LETRA: int = 30
const BOCADILLO_LETRA_CUENTA: int = 72
const BOCADILLO_ANCHO: float = 460.0


const BOCADILLO_ALTO_M: float = 1.95


const BOCADILLO_PICO: Vector2 = Vector2(30.0, 24.0)


const BOCADILLO_ABAJO: float = 150.0








const AIRE_DB: float = -27.0
const CHARLA_DB: float = -23.0

const CHARLA_CEDE_DB: float = 7.0
const FOTOGRAFO_DB: float = -9.0
const CUENTA_DB: float = -5.0
const DISPARO_DB: float = -3.0

const MUSICA_APARTA_DB: float = -11.0

const SILABA_PASO: Vector2 = Vector2(0.11, 0.16)

const TOMAS: Dictionary = {"voz_pide": 4, "voz_cele": 4, "voz_animo": 3}










const ACOMODA_APRIETA: float = 0.45
const ACOMODA_MS: float = 1.3
const ACOMODA_SALE: float = 0.15
const ACOMODA_TURNO: float = 0.07
const ACOMODA_DUDA: float = 0.08






const FOTOGRAFO_ATRAS: float = 0.7
const TRIPODE_LADO: float = -0.55
const TRIPODE_ALTO: float = 1.42
const TRIPODE_ABRE: float = 0.3
const StaffSprites = preload("res://features/stadium/staff_sprites.gd")

const MARCO_FUNDE: float = 0.35





const PIE_LETRA_COMODA: int = 16
const PIE_LETRA_MIN: int = 12
const PIE_LINEAS_MAX: int = 3
const PIE_ENTRE_FILAS: float = 5.0
const PIE_SEPARA: String = " · "




const PIE_LINEAS: Array[String] = ["POR", "DEF", "MED", "DEL"]
const PIE_DT: String = "DT"


const PIE_CHIP_LETRA: int = 14
const PIE_CHIP_PAD: float = 6.0
const PIE_CHIP_AIRE: float = 10.0

const KICKOFF: float = 0.0
const SCRIM: float = 0.55



var _filas_gente: Array = [[], [], []]
var _gente: Array[AnimatedSprite3D] = []
var _n_max: int = 1
var _hay_trofeos: bool = false

var _trofeos_spr: Array[Sprite3D] = []
var _peanas: Array[MeshInstance3D] = []
var _plantel_usado: Array = []
var _disparada: bool = false
var _marco_a: float = 0.0


var _acomodo: Array[Dictionary] = []
var _fotografo: AnimatedSprite3D
var _bocadillo: PanelContainer
var _bocadillo_txt: Label

var _pico_x: float = -1.0

var _sonidos: Array = []
var _aire: AudioStreamPlayer
var _charla: AudioStreamPlayer

var _charla_fase: int = 0

var _marco: Control
var _banda: PanelContainer
var _escudos: Array[CrestView] = []
var _pie: VBoxContainer


var _pie_lineas: Array[String] = []
var _pie_rotulos: Array[PanelContainer] = []
var _pie_nombres: Array = []
var _pie_ancho: float = -1.0
var _pie_alto_max: float = -1.0
var _pie_chip_w: float = 0.0
var _hueco: Rect2 = Rect2()
var _papel: Rect2 = Rect2()


func _accent_for() -> Color:

	return CareerTheme.accent()


func _build() -> void:


	tumbado_centrado = true
	make_stadium({
		"div": div(),

		"training": true,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"kit": GameState.kit_variant(team(), 0),
		"weather": "day",


		"kickoff": KICKOFF,
		"attendance": 0.0,
		"venue_empty": true,
	})
	scrim_dim(SCRIM)
	focus = Vector3(X0 + X_MEDIA, 0.0, Z_C)
	_monta_grupo()
	_monta_acomodo()
	_monta_grada()
	_monta_trofeos()
	_monta_fotografo()
	make_camera(_llaves(), 44.0)

	orbit_speed = 0.0
	_vestir_ya()



	_monta_sonido()


	Music.duck(MUSICA_APARTA_DB, T_FOTO + 0.4, T_FICHA - T_FOTO)


	_monta_marco()
	_monta_bocadillo()
	make_chyron(I18n.t("FOTO OFICIAL"), CareerTheme.caps(String(team().get("name", ""))),
		team(), 0.8)
	make_card(T_FICHA)
	if UiKit.es_horizontal() and tumbado_centrado:
		_ficha_tira()
		return
	card_title(I18n.t("FOTO OFICIAL"), 40)
	card_sub(I18n.tf("TEMPORADA {0}", [_temporada()]))
	card_stats(_stats())
	card_note(I18n.t("La plantilla de este año ya tiene su foto. Colgará en la sede toda la temporada."))
	card_cta(I18n.t("SEGUIR"))









func _ficha_tira() -> void:
	var tira: HBoxContainer = HBoxContainer.new()
	tira.add_theme_constant_override("separation", 28)
	var izq: VBoxContainer = VBoxContainer.new()
	izq.add_theme_constant_override("separation", 10)
	izq.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	izq.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tira.add_child(izq)
	var t: Label = card_title(I18n.t("FOTO OFICIAL"), TIRA_TITULO)
	var st: HBoxContainer = card_stats(_stats())
	var b: Button = card_cta(I18n.t("SEGUIR"))
	card_box.add_child(tira)
	for n in [t, st]:
		card_box.remove_child(n)
		izq.add_child(n)
	card_box.remove_child(b)
	tira.add_child(b)
	t.autowrap_mode = TextServer.AUTOWRAP_OFF
	t.clip_text = true
	t.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	b.size_flags_horizontal = Control.SIZE_SHRINK_END
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	b.custom_minimum_size = Vector2(TIRA_BOTON_W, TIRA_BOTON_H)


func _temporada() -> int:
	return maxi(temporada_del_acto(), 1)





func _stats() -> Array:
	var suma: int = 0
	var n: int = 0
	for r in _plantel_usado:
		var m: int = int((r as Array)[3]) if (r as Array).size() > 3 else 0
		if m > 0:
			suma += m
			n += 1
	var tuya: int = int(round(Career.skills_avg()))
	if tuya > 0:
		suma += tuya
		n += 1
	var dorsal: int = dorsal_vivido()
	return [
		{"v": str(_plantel_usado.size() + 1), "k": I18n.t("jugadores")},
		{"v": str(int(round(float(suma) / float(n)))) if n > 0 else "—", "k": I18n.t("media")},
		{"v": "#%d" % dorsal if dorsal > 0 else "—", "k": I18n.t("dorsal")},
	]











func _recuerdo() -> Dictionary:
	var out: Dictionary = data.duplicate(true)
	out["plantel"] = _plantel(String(team().get("id", ""))).duplicate(true)
	return out











func _plantel(cid: String) -> Array:
	var out: Array = []
	if data.get("plantel") is Array and not (data["plantel"] as Array).is_empty():
		for r in data["plantel"]:
			if r is Array and (r as Array).size() >= 3:
				out.append(r)
		return out
	var yo: String = String(Squad.user_slot(cid).get("name", ""))
	var mio: int = dorsal_vivido()
	for row in Squad.of(cid):
		var r: Dictionary = row
		var nm: String = String(r.get("name", ""))
		var num: int = int(r.get("number", 0))
		if nm.is_empty() or nm == yo or (num > 0 and num == mio):
			continue
		var pos: String = String(r.get("pos", ""))
		out.append([nm, num, pos, SquadMeta.media_of(r, pos)])
	return out









func _filas(p: int) -> Vector3i:
	if p <= 3:
		return Vector3i(p, 0, 0)
	if p % 2 == 0:
		p -= 1
	var k: int = p / 3
	var f: int = k + 1 if k % 2 == 0 else k
	return Vector3i(f, p - 2 * f, f)


func _monta_grupo() -> void:
	var cid: String = String(team().get("id", ""))
	var plantel: Array = _plantel(cid)
	var porteros: Array = []
	var campo: Array = []
	for r in plantel:
		(porteros if String((r as Array)[2]) == "POR" else campo).append(r)
	var por_media: Callable = func(a: Array, b: Array) -> bool:
		return int(a[3] if a.size() > 3 else 0) > int(b[3] if b.size() > 3 else 0)
	campo.sort_custom(por_media)
	porteros.sort_custom(por_media)
	var filas: Vector3i = _filas(mini(JUGADORES_MAX, plantel.size() + 1))
	var n_mates: int = filas.x + filas.y + filas.z - 1
	var gk_n: int = mini(porteros.size(), mini(PORTEROS_MAX, filas.z))
	var gk: Array = porteros.slice(0, gk_n)


	var resto: Array = campo.duplicate()
	resto.append_array(porteros.slice(gk_n))
	var otros: Array = resto.slice(0, maxi(n_mates - gk_n, 0))
	var delante: Array = otros.slice(0, maxi(filas.x - 1, 0))
	var medio: Array = otros.slice(maxi(filas.x - 1, 0), maxi(filas.x - 1, 0) + filas.y)
	var atras: Array = gk.duplicate()
	atras.append_array(otros.slice(maxi(filas.x - 1, 0) + filas.y))
	_plantel_usado = gk.duplicate()
	_plantel_usado.append_array(otros)

	var kit: Dictionary = GameState.team_custom.duplicate()
	kit.merge(GameState.kit_variant(team(), 0), true)
	var base: Dictionary = KitRecolor.team_only(kit)
	_n_max = maxi(filas.x, maxi(filas.y + 1, filas.z))



	var orden: Array = _orden_centro(filas.x)
	for i in filas.x:
		var z: float = _z_de(int(orden[i]), filas.x)
		if i == 0:
			_yo_sentado(z)
		else:
			var r: Array = delante[i - 1]
			var spr: AnimatedSprite3D = _sentado(_cfg_de(r, base), z)
			_apunta(0, spr, String(r[0]), String(r[2]), int(r[1]))




	var n_medio: int = filas.y + 1 if filas.y > 0 else 0
	orden = _orden_centro(n_medio)
	for i in n_medio:
		var z: float = _z_de(int(orden[i]), n_medio)
		if i == 0:
			_dt_de_pie(z)
		else:
			var r: Array = medio[i - 1]
			_apunta(1, _de_pie(_cfg_de(r, base), X0 + X_MEDIA, STEP1, z), String(r[0]),
				String(r[2]), int(r[1]))


	orden = _orden_centro(filas.z)
	for i in filas.z:
		var r: Array = atras[i]
		_apunta(2, _de_pie(_cfg_de(r, base), X0 + X_ATRAS, STEP2,
			_z_de(int(orden[i]), filas.z)), String(r[0]), String(r[2]), int(r[1]))
	for f in _filas_gente:
		(f as Array).sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return (a["spr"] as Node3D).position.z <(b["spr"] as Node3D).position.z)




func _orden_centro(n: int) -> Array:
	var idx: Array = range(n)
	var c: float = float(n - 1) * 0.5
	idx.sort_custom(func(a: int, b: int) -> bool:
		var da: float = absf(float(a) - c)
		var db: float = absf(float(b) - c)
		if is_equal_approx(da, db):
			return a > b
		return da < db)
	return idx


func _z_de(plaza: int, n: int) -> float:
	return Z_C +(float(plaza) - float(n - 1) * 0.5) * SLOT


func _apunta(fila: int, spr: AnimatedSprite3D, nombre: String, pos: String = "",
		num: int = 0) -> void:
	if spr == null:
		return
	(_filas_gente[fila] as Array).append({"spr": spr, "nombre": nombre, "pos": pos, "num": num})




func _cfg_de(r: Array, base: Dictionary) -> Dictionary:
	var persona: Dictionary = {"name": String(r[0]), "number": int(r[1])}
	if String(r[2]) == "POR":
		return KitRecolor.keeper_field_cfg(person_look(persona, _ropa_portero(base)))
	return person_look(persona, base)



func _ropa_portero(base: Dictionary) -> Dictionary:
	var gk: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(
		String(team().get("id", "")), -1, String(base.get("pattern", ""))), base)
	for k in base:
		if String(k).begins_with("num_"):
			gk[k] = base[k]
	return gk


func _sprite_base() -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return spr




func _arranca(spr: AnimatedSprite3D) -> void:
	viewport.add_child(spr)
	spr.play("idle")
	var n: int = spr.sprite_frames.get_frame_count("idle")
	if n > 1:
		spr.frame = rng.randi_range(0, n - 1)
	_gente.append(spr)


func _de_pie(cfg: Dictionary, x: float, suelo: float, z: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = _sprite_base()
	spr.sprite_frames = player_frames(cfg, "south")
	spr.position = Vector3(x, suelo + feet_offset(spr.pixel_size) - PLAYER_SINK, z)
	_arranca(spr)
	return spr




func _sentado(cfg: Dictionary, z: float) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = _sprite_base()
	var frames: SpriteFrames = _frames_sentado(cfg)
	if frames == null:

		return _de_pie(cfg, X0, 0.0, z)
	spr.sprite_frames = frames
	spr.position = Vector3(X0,
		SEAT_TOP + float(SENTADO_TRASERO - 46) * spr.pixel_size, z)



	espalda_registra(spr, "idle", SENTADO_PREFIX, 1)
	_arranca(spr)
	return spr







func _frames_sentado(cfg_in: Dictionary) -> SpriteFrames:
	var cfg: Dictionary = pecho_cfg_a_mano(cfg_in)
	if espalda_toca(cfg):
		cfg = cfg.duplicate()
		cfg["num_lamina"] = true
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)

	frames.set_animation_speed("idle", 4.0)
	var fuentes: Array = []
	for i in range(1, 5):
		var path: String = "%s%02d.png" % [SENTADO_PREFIX, i]
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			fuentes.append(path)
	if fuentes.is_empty():
		return null
	if cfg.has("crest_logo") or cfg.has("pecho_club") \
			or bool(cfg.get("num_lamina", false)):
		frames.set_meta("pecho_cfg", cfg)
		frames.set_meta("pecho_prefijo", SENTADO_PREFIX)
	frames.set_meta("look_cfg", cfg)
	frames.set_meta("cara_fuentes", {"idle": fuentes})
	return frames





func _yo_sentado(z: float) -> void:
	var look: Dictionary = GameState.team_custom.duplicate()



	look.merge(GameState.kit_variant(team(), 0), true)
	look["number"] = dorsal_vivido()
	var cfg: Dictionary = player_cfg(look)
	player = _sentado(cfg, z)
	var cara: CaraViva = CaraViva.pon(player)
	var animo: String = String(CARA_DEL_ACTO.get("foto_equipo", ""))
	if cara != null and not animo.is_empty():
		cara.anima(animo)
	_apunta(0, player, Career.player_name, Career.puesto_hoy(), dorsal_vivido())




func _dt_de_pie(z: float) -> void:
	var dt: AnimatedSprite3D = coach_sprite(Vector3(X0 + X_MEDIA, 0.0, z), 1.8,
		Career.coach_look(), "", false, Career.coach_nivel())
	if dt == null:
		return
	dt.position.y += STEP1


	if paseo_dt == dt:
		paseo_y0 = dt.position.y
	dt.play("idle")
	var n: int = dt.sprite_frames.get_frame_count("idle")
	if n > 1:
		dt.frame = rng.randi_range(0, n - 1)
	_gente.append(dt)
	_apunta(1, dt, Career.coach_name(), PIE_DT)







func _vestir_ya() -> void:
	for spr in _gente:
		if spr == null or not is_instance_valid(spr) or _pechos.has(spr) \
				or spr.sprite_frames == null \
				or not spr.sprite_frames.has_meta("pecho_cfg"):
			continue
		_pecho_vestir(spr)













func _monta_acomodo() -> void:
	for f in [1, 2]:
		var fila: Array = _filas_gente[f]
		if fila.size() < 2:
			continue


		var desde_izq: bool = f == 1
		var cabo: Dictionary = fila[0] if desde_izq else fila.back()
		var z_cabo: float =(cabo["spr"] as Node3D).position.z
		var vista: String = "east" if desde_izq else "west"
		var orden: Array = fila.duplicate()
		orden.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return absf((a["spr"] as Node3D).position.z - z_cabo) \
					> absf((b["spr"] as Node3D).position.z - z_cabo))
		for i in orden.size():
			var quien: Dictionary = orden[i]
			var spr: AnimatedSprite3D = quien["spr"]
			var hasta: Vector3 = spr.position
			var desde: Vector3 = Vector3(hasta.x, hasta.y,
				z_cabo +(hasta.z - z_cabo) * ACOMODA_APRIETA)
			var lejos: float = absf(hasta.z - desde.z)
			if lejos < 0.05 or spr.sprite_frames == null:
				continue
			var anim: String = "walk_" + vista
			if String(quien["pos"]) == PIE_DT:
				anim = "walk_south"
				if not spr.sprite_frames.has_animation(anim):
					continue
			elif not _arma_paso(spr, vista):

				continue
			spr.position = desde
			var sale: float = ACOMODA_SALE + float(i) * ACOMODA_TURNO \
					+ rng.randf_range(0.0, ACOMODA_DUDA)
			_acomodo.append({"spr": spr, "desde": desde, "hasta": hasta, "sale": sale,
				"llega": sale + lejos / ACOMODA_MS, "anim": anim, "listo": false})






func _arma_paso(spr: AnimatedSprite3D, vista: String) -> bool:
	if not spr.sprite_frames.has_meta("look_cfg"):
		return false
	var cfg: Dictionary = _walk_cfg(spr, spr.sprite_frames.get_meta("look_cfg"))
	if GameState.readonly_save:
		return _walk_dir(spr, cfg, 2, vista)
	_walk_pend.append({"spr": spr, "cfg": cfg, "paso": 2, "dir": vista})
	return ResourceLoader.exists("%s%s_01.png" % [WALK_SHEET, vista])


func _tick_acomodo() -> void:
	for a in _acomodo:
		if bool(a["listo"]):
			continue
		var spr: AnimatedSprite3D = a["spr"]
		if not is_instance_valid(spr):
			a["listo"] = true
			continue
		if t < float(a["sale"]):
			continue
		var k: float = clampf((t - float(a["sale"]))
			/ maxf(float(a["llega"]) - float(a["sale"]), 0.001), 0.0, 1.0)
		if k >= 1.0:
			_planta(a)
			continue
		spr.position =(a["desde"] as Vector3).lerp(a["hasta"], k)
		_walk_listo(spr)
		var anim: String = String(a["anim"])
		if spr.animation != anim and spr.sprite_frames.has_animation(anim):
			spr.play(anim)




func _planta(a: Dictionary) -> void:
	a["listo"] = true
	var spr: AnimatedSprite3D = a["spr"]
	if not is_instance_valid(spr):
		return
	spr.position = a["hasta"]
	if spr.animation == &"idle":
		return
	spr.play("idle")
	var n: int = spr.sprite_frames.get_frame_count("idle")
	if n > 1:
		spr.frame = rng.randi_range(0, n - 1)




func _fotografo_pos() -> Vector3:
	return Vector3(focus.x - CAM_DIST - FOTOGRAFO_ATRAS, 0.0, focus.z)




func _monta_fotografo() -> void:
	var frames: SpriteFrames = StaffSprites.camarografo(KitRecolor.appearance_for(
		"%s_fotografo" % String(team().get("id", "")),
		{"kit": Stadium.CAMOP_KIT, "kit2": Stadium.CAMOP_KIT2}))
	if frames == null:
		return
	var p: Vector3 = _fotografo_pos()
	_fotografo = _sprite_base()
	_fotografo.sprite_frames = frames
	_fotografo.position = Vector3(p.x, feet_offset(_fotografo.pixel_size) - PLAYER_SINK, p.z)
	viewport.add_child(_fotografo)
	_fotografo.play("idle")
	_tripode(p + Vector3(0.12, 0.0, TRIPODE_LADO))




func _tripode(pie: Vector3) -> void:
	var cabeza: Vector3 = pie + Vector3(0.0, TRIPODE_ALTO, 0.0)
	for i in 3:
		var ang: float = TAU * float(i) / 3.0 + PI / 6.0
		_vara(pie + Vector3(cos(ang), 0.0, sin(ang)) * TRIPODE_ABRE, cabeza, 0.03)
	_caja(cabeza + Vector3(-0.08, 0.02, -0.065), cabeza + Vector3(0.08, 0.15, 0.065),
		CareerTheme.BG_DEEP)
	_caja(cabeza + Vector3(0.08, 0.045, -0.04), cabeza + Vector3(0.22, 0.125, 0.04),
		CareerTheme.BG_DEEP)



func _vara(a: Vector3, b: Vector3, grosor: float) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = Vector3(grosor, a.distance_to(b), grosor)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = CareerTheme.SURFACE
	mat.roughness = 1.0
	box.material = mat
	m.mesh = box
	m.basis = Basis(Quaternion(Vector3.UP,(b - a).normalized()))
	m.position =(a + b) * 0.5
	viewport.add_child(m)




func _ancho_grupo() -> float:
	return float(_n_max - 1) * SLOT + 0.7





func _monta_grada() -> void:
	var medio: float = _ancho_grupo() * 0.5 + 0.35
	var z0: float = Z_C - medio
	var z1: float = Z_C + medio
	var oscuro: Color = CareerTheme.SURFACE
	_caja(Vector3(X0 + BANCO_X.x, 0.0, z0), Vector3(X0 + BANCO_X.y, SEAT_TOP, z1), oscuro)
	if not (_filas_gente[1] as Array).is_empty():
		_caja(Vector3(X0 + PELDANO1_X, 0.0, z0), Vector3(X0 + GRADA_FONDO_X, STEP1, z1), oscuro)
		_filete(X0 + PELDANO1_X, STEP1, z0, z1)
	if not (_filas_gente[2] as Array).is_empty():
		_caja(Vector3(X0 + PELDANO2_X, 0.0, z0), Vector3(X0 + GRADA_FONDO_X, STEP2, z1), oscuro)
		_filete(X0 + PELDANO2_X, STEP2, z0, z1)
	_filete(X0 + BANCO_X.x, SEAT_TOP, z0, z1)


func _caja(desde: Vector3, hasta: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size =(hasta - desde).abs()
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 1.0
	box.material = mat
	m.mesh = box
	m.position =(desde + hasta) * 0.5
	viewport.add_child(m)
	return m


func _filete(x: float, y: float, z0: float, z1: float) -> void:
	var m: MeshInstance3D = _caja(Vector3(x - 0.01, y - 0.05, z0), Vector3(x + 0.03, y + 0.005, z1),
		_accent_for())
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF






func _monta_trofeos() -> void:
	var tipos: Array = []
	if data.get("trofeos") is Array:
		for x in data["trofeos"]:
			if tipos.size() < TROFEOS_MAX and not String(x).is_empty():
				tipos.append(String(x))
	_hay_trofeos = not tipos.is_empty()
	var pais: String = Teams.country_of(String(team().get("id", "")))
	var plazas: Array = TROFEO_PLAZAS[tipos.size()] if TROFEO_PLAZAS.has(tipos.size()) else []
	var x: float = X0 + TROFEO_X
	var lado: float = PEANA_LADO * 0.5
	for i in tipos.size():
		var z: float = Z_C + float(plazas[i]) * SLOT
		var peana: MeshInstance3D = _caja(Vector3(x - lado, 0.0, z - lado),
			Vector3(x + lado, PEANA_ALTO, z + lado), CareerTheme.SURFACE)
		_peanas.append(peana)

		var filete: MeshInstance3D = _caja(Vector3(x - lado - 0.01, PEANA_ALTO - 0.05, z - lado),
			Vector3(x - lado + 0.03, PEANA_ALTO + 0.005, z + lado), _accent_for())
		filete.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		_trofeos_spr.append(make_trophy(String(tipos[i]),
			Vector3(x, PEANA_ALTO + TROFEO_ALTO * 0.5 - TROFEO_HUNDE, z),
			TROFEO_ALTO, 256, null, true, 0.0, "", pais if String(tipos[i]) == "liga" else ""))




func _tam_plano() -> Vector2:
	if viewport != null and viewport.size.x > 0 and viewport.size.y > 0:
		return Vector2(viewport.size)
	return get_viewport_rect().size



















func _llaves() -> Array:
	var vs: Vector2 = _tam_plano()
	var tumbado: bool = vs.x > vs.y
	var ancho_m: float = _ancho_grupo() + 0.3






	var centrada: bool = tumbado and tumbado_centrado
	var ancho_util: float = vs.x
	if centrada:
		ancho_util = vs.x - 2.0 * UiKit.side_safe_inset(get_viewport())
	elif tumbado:
		ancho_util = vs.x - _columna_ancho() - 2.0 * UiKit.side_safe_inset(get_viewport())
	var ancho_px: float = minf(ancho_util * GRUPO_ANCHO,
		vs.y *(GRUPO_ALTO_CENTRADO if centrada else GRUPO_ALTO))
	var tan_f: float = ancho_m * vs.y /(2.0 * CAM_DIST * ancho_px)
	var fov: float = rad_to_deg(2.0 * atan(tan_f))
	var py: float = vs.y * CENTRO_PANTALLA_PIE
	if centrada:
		py = vs.y * CENTRO_PANTALLA_CENTRADO
	elif tumbado:
		py = vs.y * CENTRO_PANTALLA_TUMBADO
	var phi: float = atan((CAM_H - CENTRO_Y) / CAM_DIST)
	var theta: float = phi - atan((py - vs.y * 0.5) * tan_f /(vs.y * 0.5))
	var aim: float = CAM_H - CAM_DIST * tan(theta)
	var fp: Vector3 = _fotografo_pos()
	return [
		{"t": 0.0, "dist": 12.5, "h": 3.4, "yaw": 232.0, "aim_y": 1.3, "fov": 44.0},
		{"t": T_CORTE_FOTOGRAFO, "dist": 14.5, "h": 2.7, "yaw": 248.0, "aim_y": 1.2, "fov": 44.0},
		{"t": T_CORTE_FOTOGRAFO, "dist": 5.6, "h": 1.75, "yaw": 104.0, "aim_y": 1.15,
			"fov": 40.0, "focus_x": fp.x, "focus_z": fp.z},
		{"t": T_CORTE_FRENTE, "dist": 4.9, "h": 1.7, "yaw": 98.0, "aim_y": 1.15,
			"fov": 40.0, "focus_x": fp.x, "focus_z": fp.z},
		{"t": T_CORTE_FRENTE, "dist": CAM_DIST, "h": CAM_H, "yaw": 270.0, "aim_y": aim, "fov": fov},
	]




func _tick(delta: float) -> void:
	_tick_sonido()
	_tick_acomodo()
	if not _disparada and t >= T_FOTO:
		_dispara(true)
	_tick_bocadillo()
	if not _disparada:
		return
	_marco_a = minf(1.0, _marco_a + delta / MARCO_FUNDE)
	_marco.modulate.a = _marco_a
	_coloca_marco()


	if chyron != null and is_instance_valid(chyron):
		chyron.visible = false


func _skipped() -> void:




	for a in _acomodo:
		if not bool(a["listo"]):
			_planta(a)


	_sonidos.clear()
	_charla_fase = 3
	Music.duck(MUSICA_APARTA_DB, 0.0, 0.8)
	_db_to(_charla, CHARLA_DB, 0.4)
	if not _disparada:
		_dispara(false)
	_marco_a = 1.0
	_marco.modulate.a = 1.0
	_coloca_marco()





func _dispara(con_flash: bool) -> void:
	_disparada = true
	if con_flash:
		screen_flash(0.22)



		sting("reflex_disparo", DISPARO_DB)
	for spr in _gente:
		if spr == null or not is_instance_valid(spr):
			continue
		spr.pause()
		var cara: CaraViva = CaraViva.de(spr)
		if cara != null:
			cara.set_process(false)






func _monta_bocadillo() -> void:
	_bocadillo = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(18)
	_bocadillo.add_theme_stylebox_override("panel", sb)
	_bocadillo_txt = CareerUi.plain(BOCADILLO_LETRA, CareerTheme.BG_DEEP)
	_bocadillo_txt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_bocadillo.add_child(_bocadillo_txt)
	_bocadillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bocadillo.modulate.a = 0.0

	_bocadillo.draw.connect(_dibuja_pico)
	add_child(_bocadillo)


func _dibuja_pico() -> void:
	if _pico_x < 0.0:
		return
	var h: float = _bocadillo.size.y
	var m: float = BOCADILLO_PICO.x * 0.5
	_bocadillo.draw_colored_polygon(PackedVector2Array([
		Vector2(_pico_x - m, h - 1.0), Vector2(_pico_x + m, h - 1.0),
		Vector2(_pico_x, h + BOCADILLO_PICO.y)]), CareerTheme.TEXT)




func _frase(at: float) -> String:
	if at >= JUNTOS_T.x and at < JUNTOS_T.y:
		return I18n.t("¡JUNTITOS, TODOS MIRANDO A LA CÁMARA!")
	if at >= A_LA_DE_TRES_T.x and at < A_LA_DE_TRES_T.y:
		return I18n.t("¡A LA CUENTA DE TRES!")
	if at >= CUENTA_T0 and at < T_FOTO:
		return str(mini(floori((at - CUENTA_T0) / CUENTA_PASO), 2) + 1)
	return ""



func _frase_desde(at: float) -> float:
	if at < JUNTOS_T.y:
		return JUNTOS_T.x
	if at < A_LA_DE_TRES_T.y:
		return A_LA_DE_TRES_T.x
	return CUENTA_T0 + floorf((at - CUENTA_T0) / CUENTA_PASO) * CUENTA_PASO





func _tick_bocadillo() -> void:
	if _bocadillo == null:
		return
	var frase: String = "" if _disparada else _frase(t)
	if frase.is_empty() or cam == null or not is_instance_valid(cam):
		_bocadillo.modulate.a = 0.0
		return
	if _bocadillo_txt.text != frase:
		var cifra: bool = frase.is_valid_int()
		_bocadillo_txt.text = frase
		_bocadillo_txt.add_theme_font_size_override("font_size",
			BOCADILLO_LETRA_CUENTA if cifra else BOCADILLO_LETRA)
		_bocadillo_txt.autowrap_mode = TextServer.AUTOWRAP_OFF if cifra \
				else TextServer.AUTOWRAP_WORD_SMART
		_bocadillo_txt.custom_minimum_size.x = 0.0 if cifra else BOCADILLO_ANCHO

		_bocadillo.size = Vector2.ZERO
	_bocadillo.modulate.a = clampf((t - _frase_desde(t)) / BOCADILLO_FUNDE, 0.0, 1.0)
	var vp: Viewport = get_viewport()
	var b: Vector2 = _bocadillo.size
	var p: Vector2 = Vector2((size.x - b.x) * 0.5,
		size.y - UiKit.bottom_safe_inset(vp) - BOCADILLO_ABAJO - b.y)
	var vs: Vector2 = Vector2(viewport.size)
	var cabeza: Vector3 = _fotografo_pos() + Vector3(0.0, BOCADILLO_ALTO_M, 0.0)
	var boca_x: float = -1.0
	if t < T_CORTE_FRENTE and vs.x > 0.0 and vs.y > 0.0 and not cam.is_position_behind(cabeza):
		var caja: Rect2 = viewport_box.get_global_rect()
		var sobre: Vector2 = caja.position +(cam.unproject_position(cabeza) / vs) * caja.size
		boca_x = sobre.x
		p = sobre - Vector2(b.x * 0.5, b.y + BOCADILLO_PICO.y)
	var lado: float = UiKit.side_safe_inset(vp) + 24.0
	p.x = clampf(p.x, lado, maxf(lado, size.x - b.x - lado))
	p.y = maxf(p.y, UiKit.top_safe_inset(vp) + 24.0)
	_bocadillo.position = p

	var pico: float = -1.0 if boca_x < 0.0 else clampf(boca_x - p.x,
		18.0 + BOCADILLO_PICO.x * 0.5, b.x - 18.0 - BOCADILLO_PICO.x * 0.5)
	if pico != _pico_x:
		_pico_x = pico
		_bocadillo.queue_redraw()


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["reflex_disparo", "reflex_enfoque", "flash_carga", "fotografo_a",
		"fotografo_e", "fotografo_i", "fotografo_o", "fotografo_u", "fotografo_cuenta",
		"studs_tick", "himno_risa", "intro_pajaros", "locker_murmur"])






func _monta_sonido() -> void:
	_aire = _loop_player(self, "intro_pajaros", AIRE_DB)
	_charla = _loop_player(self, "locker_murmur", CHARLA_DB)


	for i in 8:
		_suena(rng.randf_range(0.15, T_CORTE_FOTOGRAFO - 0.3), "studs_tick", -20.0,
			rng.randf_range(0.85, 1.15))
	_voz("voz_pide", rng.randf_range(0.3, 1.2), -18.0)
	_voz("voz_animo", rng.randf_range(1.6, 2.6), -19.0)
	_suena(rng.randf_range(2.2, 3.0), "himno_risa", -22.0, rng.randf_range(1.0, 1.15))

	_habla(JUNTOS_T)
	for i in 4:
		_suena(rng.randf_range(JUNTOS_T.y, JUNTOS_T.y + 0.4), "studs_tick", -22.0,
			rng.randf_range(0.9, 1.1))
	_habla(A_LA_DE_TRES_T)

	for i in 3:
		_suena(CUENTA_T0 + float(i) * CUENTA_PASO, "fotografo_cuenta", CUENTA_DB, 1.0 + 0.07 * float(i))


	_suena(T_FOTO - 0.24, "reflex_enfoque", -15.0, 1.0)
	_suena(T_FOTO + 0.12, "flash_carga", -21.0, 1.0)

	_voz("voz_cele", T_FOTO + rng.randf_range(0.35, 0.6), -16.0)
	_voz("voz_cele", T_FOTO + rng.randf_range(0.65, 1.0), -18.0)


func _suena(at: float, id: String, db: float, pitch: float) -> void:
	_sonidos.append([at, id, db, pitch])


func _voz(familia: String, at: float, db: float) -> void:
	_suena(at, "%s_%d" % [familia, rng.randi_range(1, int(TOMAS[familia]))],
		db + rng.randf_range(-2.0, 1.0), rng.randf_range(0.92, 1.1))





func _habla(ventana: Vector2) -> void:
	var at: float = ventana.x + BOCADILLO_FUNDE * 0.5
	var n: int = 0
	while at < ventana.y - 0.15:
		var k: float =(at - ventana.x) /(ventana.y - ventana.x)
		_suena(at, "fotografo_" + "aeiou"[rng.randi() % 5],
			FOTOGRAFO_DB + rng.randf_range(-2.0, 0.5), rng.randf_range(0.95, 1.05) *(1.0 + 0.1 * k))
		at += rng.randf_range(SILABA_PASO.x, SILABA_PASO.y)
		n += 1
		if n == 4:
			at += 0.12


func _tick_sonido() -> void:
	var i: int = 0
	while i < _sonidos.size():
		var s: Array = _sonidos[i]
		if t < float(s[0]):
			i += 1
			continue
		_sonidos.remove_at(i)
		var stream: AudioStream = AudioBank.stream(String(s[1]))
		if stream == null:
			continue
		var p: AudioStreamPlayer = AudioStreamPlayer.new()
		p.stream = stream
		p.volume_db = float(s[2])
		p.pitch_scale = float(s[3])
		p.bus = "SFX"
		add_child(p)
		p.finished.connect(p.queue_free)
		p.play()

	var fase: int = 3 if t >= T_FOTO + 0.3 else (2 if t >= CUENTA_T0 - 0.25 \
			else (1 if t >= JUNTOS_T.x else 0))
	if fase != _charla_fase:
		_charla_fase = fase
		_db_to(_charla, [CHARLA_DB, CHARLA_DB - CHARLA_CEDE_DB, -60.0, CHARLA_DB][fase],
			[0.3, 0.3, 0.25, 0.8][fase])






func _monta_marco() -> void:
	_marco = Control.new()
	_marco.set_anchors_preset(Control.PRESET_FULL_RECT)
	_marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_marco.modulate.a = 0.0
	_marco.draw.connect(_dibuja_marco)
	add_child(_marco)

	_banda = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.accent_fill()
	sb.content_margin_left = 14
	sb.content_margin_right = 14
	sb.content_margin_top = 6
	sb.content_margin_bottom = 6
	_banda.add_theme_stylebox_override("panel", sb)
	_banda.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_banda.clip_contents = true
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_banda.add_child(fila)
	var textos: VBoxContainer = VBoxContainer.new()
	textos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	textos.alignment = BoxContainer.ALIGNMENT_CENTER
	textos.add_theme_constant_override("separation", 0)
	textos.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var club: Label = CareerUi.plain(30, CareerTheme.TEXT)
	club.text = CareerTheme.caps(String(team().get("name", "")))
	club.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	club.clip_text = true
	club.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	var temp: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	temp.text = I18n.tf("TEMPORADA {0}", [_temporada()])
	temp.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	temp.clip_text = true
	textos.add_child(club)
	textos.add_child(temp)
	fila.add_child(_escudo())
	fila.add_child(textos)
	fila.add_child(_escudo())
	_marco.add_child(_banda)

	_pie = VBoxContainer.new()
	_pie.add_theme_constant_override("separation", 2)
	_pie.mouse_filter = Control.MOUSE_FILTER_IGNORE


	var por_linea: Dictionary = {}
	for f in _filas_gente:
		for g in f:
			var pos: String = String((g as Dictionary).get("pos", ""))
			var linea: String = PIE_DT if pos == PIE_DT else Squad.line_pintada(pos)
			if not por_linea.has(linea):
				por_linea[linea] = []
			(por_linea[linea] as Array).append(g)
	var orden: Array[String] = PIE_LINEAS.duplicate()
	orden.append(PIE_DT)
	for linea in orden:
		if not por_linea.has(linea):
			continue
		var gente: Array = por_linea[linea]
		gente.sort_custom(_por_dorsal)
		var nombres: Array[Label] = _nombres_de(gente)
		if nombres.is_empty():
			continue
		_pie_lineas.append(linea)
		_pie_rotulos.append(_rotulo(linea))
		_pie_nombres.append(nombres)
	_marco.add_child(_pie)



func _por_dorsal(a: Dictionary, b: Dictionary) -> bool:
	var na: int = int(a.get("num", 0))
	var nb: int = int(b.get("num", 0))
	if (na > 0) !=(nb > 0):
		return na > 0
	return na < nb




func _rotulo(linea: String) -> PanelContainer:
	var col: Color = CareerTheme.BG_DEEP if linea == PIE_DT else CareerUi.line_color(linea)
	var chip: PanelContainer = CareerUi.code_chip(I18n.t(linea), col, PIE_CHIP_LETRA,
		PIE_CHIP_PAD, 2.0)
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	var l: Label = chip.get_child(0) as Label
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return chip











func _nombres_de(gente: Array) -> Array[Label]:
	var out: Array[Label] = []
	for g in gente:
		var nm: String = String((g as Dictionary).get("nombre", ""))
		if nm.is_empty():
			continue
		var yo: bool =(g as Dictionary).get("spr") == player
		var l: Label = _letra_pie(CareerTheme.caps(Career.espalda_de(nm)),
			CareerTheme.TEXT if yo else CareerTheme.BG_DEEP)
		if yo:
			var sb: StyleBoxFlat = StyleBoxFlat.new()
			sb.bg_color = CareerTheme.accent_fill()
			sb.set_corner_radius_all(4)
			sb.content_margin_left = 6
			sb.content_margin_right = 6

			sb.content_margin_top = 2
			sb.content_margin_bottom = 2
			l.add_theme_stylebox_override("normal", sb)
		out.append(l)
	return out


func _letra_pie(texto: String, color: Color) -> Label:
	var l: Label = CareerUi.plain(CareerTheme.T_DIM, color)
	l.text = texto

	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l







func _ajusta_pie(ancho: float, alto_max: float = 1000000000.0) -> void:
	if ancho <= 0.0 or _pie_nombres.is_empty() \
			or (absf(ancho - _pie_ancho) < 1.0 and absf(alto_max - _pie_alto_max) < 1.0):
		return
	_pie_ancho = ancho
	_pie_alto_max = alto_max

	_pie_chip_w = 0.0
	for c in _pie_rotulos:
		_pie_chip_w = maxf(_pie_chip_w, ceilf(_ancho_texto((c.get_child(0) as Label).text,
			PIE_CHIP_LETRA) + 2.0 * PIE_CHIP_PAD + 1.0))
	ancho = maxf(ancho - _pie_chip_w - PIE_CHIP_AIRE, 1.0)
	var lineas: Array[int] = []
	for f in _pie_nombres:
		lineas.append(1)
	var tam: int = _letra_que_cabe(lineas, ancho)
	while tam < PIE_LETRA_COMODA:


		var peor: int = 0
		var peor_w: float = -1.0
		for r in _pie_nombres.size():
			var w: float = _linea_mas_ancha(r, lineas[r], CareerTheme.T_DIM)
			if w > peor_w:
				peor = r
				peor_w = w
		if lineas[peor] >= mini((_pie_nombres[peor] as Array).size(), PIE_LINEAS_MAX):
			break
		lineas[peor] += 1
		tam = _letra_que_cabe(lineas, ancho)
	_monta_lineas(lineas, tam)



	while _pie.get_combined_minimum_size().y > alto_max:
		var junta: int = -1
		for r in _pie_nombres.size():
			if lineas[r] > 1 and _linea_mas_ancha(r, lineas[r] - 1, PIE_LETRA_MIN) <= ancho \
					and (junta < 0 or lineas[r] > lineas[junta]):
				junta = r
		if junta >= 0:
			lineas[junta] -= 1
			tam = _letra_que_cabe(lineas, ancho)
		elif tam > PIE_LETRA_MIN:
			tam -= 1
		else:
			break
		_monta_lineas(lineas, tam)




func _letra_que_cabe(lineas: Array[int], ancho: float) -> int:
	var tam: int = CareerTheme.T_DIM
	while tam > PIE_LETRA_MIN:
		var cabe: bool = true
		for r in _pie_nombres.size():
			if _linea_mas_ancha(r, lineas[r], tam) > ancho:
				cabe = false
				break
		if cabe:
			break
		tam -= 1
	return tam




func _reparto(n: int, k: int) -> Array[int]:
	var out: Array[int] = []
	for i in k:
		out.append(n / k +(1 if i < n % k else 0))
	return out


func _linea_mas_ancha(r: int, k: int, tam: int) -> float:
	var nombres: Array = _pie_nombres[r]
	var sep: float = _ancho_texto(PIE_SEPARA, tam)
	var maxw: float = 0.0
	var i: int = 0
	for c in _reparto(nombres.size(), k):
		var w: float = sep * float(maxi(c - 1, 0))
		for j in c:
			w += _ancho_letra(nombres[i + j] as Label, tam)
		i += c
		maxw = maxf(maxw, w)
	return maxw






func _monta_lineas(lineas: Array[int], tam: int) -> void:
	for f in _pie_nombres:
		for l in f:
			_suelta(l)
	for c in _pie_rotulos:
		_suelta(c)
	for hijo in _pie.get_children():
		_pie.remove_child(hijo)
		hijo.queue_free()
	var nombres_w: float = 0.0
	for r in _pie_nombres.size():
		nombres_w = maxf(nombres_w, _linea_mas_ancha(r, lineas[r], tam))
	var bloque_w: float = minf(_pie_chip_w + PIE_CHIP_AIRE + ceilf(nombres_w), _pie_ancho)
	for r in _pie_nombres.size():
		if r > 0:
			var aire: Control = Control.new()
			aire.custom_minimum_size = Vector2(0.0, PIE_ENTRE_FILAS)
			aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
			_pie.add_child(aire)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", int(PIE_CHIP_AIRE))
		fila.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		fila.custom_minimum_size.x = bloque_w
		fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var chip: PanelContainer = _pie_rotulos[r]
		chip.custom_minimum_size.x = _pie_chip_w
		fila.add_child(chip)
		var col: VBoxContainer = VBoxContainer.new()
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.add_theme_constant_override("separation", 2)
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(col)
		var nombres: Array = _pie_nombres[r]
		var i: int = 0
		for c in _reparto(nombres.size(), lineas[r]):
			var linea: HBoxContainer = HBoxContainer.new()
			linea.add_theme_constant_override("separation", 0)
			linea.alignment = BoxContainer.ALIGNMENT_CENTER
			linea.mouse_filter = Control.MOUSE_FILTER_IGNORE
			linea.clip_contents = true
			for j in c:
				if j > 0:
					linea.add_child(_a_medida(_letra_pie(PIE_SEPARA, CareerTheme.BG_DEEP), tam))
				linea.add_child(_a_medida(nombres[i + j] as Label, tam))
			i += c
			col.add_child(linea)
		_pie.add_child(fila)


func _suelta(n: Node) -> void:
	if n.get_parent() != null:
		n.get_parent().remove_child(n)


func _a_medida(l: Label, tam: int) -> Label:
	l.add_theme_font_size_override("font_size", tam)
	l.custom_minimum_size.x = ceilf(_ancho_letra(l, tam))
	return l


func _ancho_texto(texto: String, tam: int) -> float:
	return _pie.get_theme_font("font", "Label").get_string_size(texto,
		HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x


func _ancho_letra(l: Label, tam: int) -> float:
	var w: float = _ancho_texto(l.text, tam)
	var sb: StyleBox = l.get_theme_stylebox("normal")
	if sb != null:
		w += sb.get_margin(SIDE_LEFT) + sb.get_margin(SIDE_RIGHT)
	return w + 1.0


func _escudo() -> CrestView:
	var c: CrestView = CrestView.new()
	c.set_team(team())
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.custom_minimum_size = Vector2(56, 56)
	_escudos.append(c)
	return c





func _esquinas() -> Array:
	var medio: float = _ancho_grupo() * 0.5
	var xd: float = X0 +(TROFEO_X - 0.2 if _hay_trofeos else -0.15)
	var alto: float = SEAT_TOP + 1.33
	var xa: float = X0
	if not (_filas_gente[1] as Array).is_empty():
		alto = STEP1 + 1.82
		xa = X0 + X_MEDIA
	if not (_filas_gente[2] as Array).is_empty():
		alto = maxf(alto, STEP2 + 1.7)
		xa = X0 + X_ATRAS
	return [
		Vector3(xd, 0.0, Z_C - medio), Vector3(xd, 0.0, Z_C + medio),
		Vector3(xa, alto, Z_C - medio), Vector3(xa, alto, Z_C + medio),
	]


func _coloca_marco() -> void:
	if cam == null or not is_instance_valid(cam) or viewport_box == null:
		return
	var vs: Vector2 = Vector2(viewport.size)
	if vs.x <= 0.0 or vs.y <= 0.0:
		return
	var caja: Rect2 = viewport_box.get_global_rect()
	var g: Rect2 = Rect2()
	var hay: bool = false
	for p in _esquinas():
		if cam.is_position_behind(p):
			continue
		var s: Vector2 = caja.position + cam.unproject_position(p) / vs * caja.size
		if not hay:
			g = Rect2(s, Vector2.ZERO)
			hay = true
		else:
			g = g.expand(s)
	if not hay or g.size.x < 8.0:
		return
	var hueco: Rect2 = g.grow_individual(g.size.x * 0.06, g.size.y * 0.12,
		g.size.x * 0.06, g.size.y * 0.04)
	var borde: float = clampf(hueco.size.x * 0.014, 6.0, 16.0)
	var hb: float = clampf(hueco.size.x * 0.085, 80.0, 108.0)
	for c in _escudos:
		c.custom_minimum_size = Vector2(hb - 22.0, hb - 22.0)
	_banda.position = Vector2(hueco.position.x, hueco.position.y - hb)
	_banda.size = Vector2(hueco.size.x, hb - borde * 0.5)
	_pie.position = Vector2(hueco.position.x + borde, hueco.end.y + borde)
	_pie.size = Vector2(hueco.size.x - 2.0 * borde, 0.0)

	_ajusta_pie(_pie.size.x, tope_sobre_ficha() - hueco.end.y - 2.0 * borde)
	var hp: float = _pie.get_combined_minimum_size().y
	_pie.size.y = hp
	_hueco = hueco
	_papel = Rect2(hueco.position.x - borde, hueco.position.y - hb - borde,
		hueco.size.x + 2.0 * borde, hb + hueco.size.y + hp + 3.0 * borde)
	_marco.queue_redraw()




func _dibuja_marco() -> void:
	if _papel.size.x <= 0.0:
		return
	var w: float = _marco.size.x
	var h: float = _marco.size.y
	var fuera: Color = CareerTheme.BG_DEEP
	fuera.a = 0.82
	_marco.draw_rect(Rect2(0.0, 0.0, w, maxf(_papel.position.y, 0.0)), fuera)
	_marco.draw_rect(Rect2(0.0, _papel.end.y, w, maxf(h - _papel.end.y, 0.0)), fuera)
	_marco.draw_rect(Rect2(0.0, _papel.position.y, maxf(_papel.position.x, 0.0),
		_papel.size.y), fuera)
	_marco.draw_rect(Rect2(_papel.end.x, _papel.position.y, maxf(w - _papel.end.x, 0.0),
		_papel.size.y), fuera)
	var papel: Color = CareerTheme.TEXT
	_marco.draw_rect(Rect2(_papel.position,
		Vector2(_papel.size.x, _hueco.position.y - _papel.position.y)), papel)
	_marco.draw_rect(Rect2(_papel.position.x, _hueco.end.y, _papel.size.x,
		_papel.end.y - _hueco.end.y), papel)
	_marco.draw_rect(Rect2(_papel.position.x, _hueco.position.y,
		_hueco.position.x - _papel.position.x, _hueco.size.y), papel)
	_marco.draw_rect(Rect2(_hueco.end.x, _hueco.position.y,
		_papel.end.x - _hueco.end.x, _hueco.size.y), papel)
	_marco.draw_rect(_hueco, CareerTheme.BG_DEEP, false, 2.0)
