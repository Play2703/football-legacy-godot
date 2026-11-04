extends Ceremony





































const Particulas = preload("res://features/match/particulas.gd")







const ARCO_R: float = 8.5




const ARCO_ABRE: float = 68.0


const TROFEOS_MAX: int = 16
const PEANA: Vector3 = Vector3(0.6, 0.62, 0.48)
const TROFEO_H: float = 0.86


const TROFEO_HUNDE: float = 0.1




const SALIDA_DZ: float = 16.0
const PARADA_DZ: float = 1.6



const VELOCIDAD: float = 1.6
const T_ANDAR: float = 1.2
const T_LLEGADA: float = T_ANDAR +(SALIDA_DZ - PARADA_DZ) / VELOCIDAD



const T_BANDA: float = 13.4





const BANDA_X: float = -9.0



const TRAMO: float = 2.8
const PARA_M: float = 1.6


















const OJOS_Y: float = 0.68


const OJOS_X: float = 0.11
const GOTA_M: float = 0.022
const GOTAS: int = 10
const GOTA_VIDA: float = 1.1
const GOTA_COLOR: Color = Color(0.78, 0.9, 1.0, 0.92)





































const KEYS: Array = [
	{"t": 0.0, "dist": 8.0, "h": 1.35, "yaw": 176.0, "aim_y": 1.3, "fov": 40.0,
		"focus_x": 0.0, "focus_z": CENTER_Z + SALIDA_DZ - 1.0},
	{"t": 4.2, "dist": 10.0, "h": 1.75, "yaw": 172.0, "aim_y": 1.35, "fov": 42.0,
		"focus_x": 0.0, "focus_z": CENTER_Z + 9.5},
	{"t": 8.0, "dist": 11.0, "h": 1.85, "yaw": 160.0, "aim_y": 1.35, "fov": 40.0,
		"focus_x": 0.0, "focus_z": CENTER_Z + 4.0},
	{"t": 10.4, "dist": 12.0, "h": 2.6, "yaw": 150.0, "aim_y": 1.2, "fov": 40.0,
		"focus_x": 0.0, "focus_z": CENTER_Z + PARADA_DZ},







	{"t": 13.2, "dist": 12.5, "h": 2.7, "yaw": 138.0, "aim_y": 1.2, "fov": 40.0,
		"focus_x": 0.0, "focus_z": CENTER_Z + PARADA_DZ},










	{"t": 17.0, "dist": 11.0, "h": 1.55, "yaw": 90.0, "aim_y": 1.05, "fov": 38.0,
		"focus_x": -5.0, "focus_z": CENTER_Z + PARADA_DZ},



	{"t": 20.5, "dist": 10.0, "h": 1.45, "yaw": 88.0, "aim_y": 1.0, "fov": 36.0,
		"focus_x": -8.0, "focus_z": CENTER_Z + PARADA_DZ},





	{"t": 24.0, "dist": 34.0, "h": 7.0, "yaw": 90.0, "aim_y": 5.0, "fov": 30.0,
		"focus_x": - GRADA_X + 7.5, "focus_z": CENTER_Z},
	{"t": 28.0, "dist": 44.0, "h": 21.0, "yaw": 132.0, "aim_y": 12.0, "fov": 46.0,
		"focus_x": 0.0, "focus_z": CENTER_Z},
]


const DRIFT: float = -0.9

const T_CHYRON: float = 2.0







const T_CARD: float = 13.6
const AFORO: float = 1.0





const GRADA_X: float = Stadium.SIDE_STAND_X




const CERCANOS: int = 18
const CERCA_FONDO: Vector2 = Vector2(2.2, 5.4)
const CERCA_Z: float = 7.0
const CERCA_H: float = 1.66





const LLORAN: int = 5

var _andando: bool = false
var _llegado: bool = false
var _pies_y: float = 0.0
var _lagrimas: GeometryInstance3D = null

























const AHIJADO_AT: Vector3 = Vector3(BANDA_X - 1.2, 0.0, CENTER_Z + PARADA_DZ + 1.6)


var ahijado_actor: AnimatedSprite3D = null
var _ahijado_aplaude: bool = false




func _keys() -> Array:
	return KEYS


func _build() -> void:
	var club: Dictionary = team()
	var kit: Dictionary = GameState.kit_variant(club, 0)
	make_stadium({
		"div": div(),
		"attendance": AFORO,
		"party": true,
		"weather": String(data.get("weather", "sunset")),




		"home_club": String(data.get("club", "")),
		"kit": kit,
		"banner": I18n.t("GRACIAS"),
		"board": I18n.t("GRACIAS") + " " + _nombre_tablero(),








		"kickoff": 0.45,
	})
	focus = Vector3(0.0, 0.0, CENTER_Z + SALIDA_DZ - 1.0)
	make_camera(_keys(), 40.0)
	orbit_speed = DRIFT
	_arco_de_copas()












	var look: Dictionary = _look_protagonista(kit)
	make_player(look, "north")





	add_walk(player, look)
	_monta_palmas(look)
	_monta_lagrimas()
	_pies_y = feet_offset(player.pixel_size) - PLAYER_SINK
	player.position = Vector3(0.0, _pies_y, CENTER_Z + SALIDA_DZ)
	_grada_cercana()
	_monta_ahijado()
	make_audio(AFORO, true)
	stadium.crowd_excite(0.95)



	applause(true)
	flash_pool = stand_flash_pool(CENTER_Z, 46.0)
	flash_rate = 26.0
	flash_burst_at = T_LLEGADA
	confetti_colors = [accent, CareerTheme.MONEY, Color.WHITE, accent.lightened(0.3)]
	_ficha(club)






















const CLAP_NORTE: String = "res://assets/sprites/anim/clap_player_north_"


func _monta_palmas(cfg: Dictionary) -> void:
	if player == null or player.sprite_frames == null:
		return
	_arma_palmas(cfg, "clap", CLAP_SHEET)
	_arma_palmas(cfg, "clap_north", CLAP_NORTE)








func _arma_palmas(cfg: Dictionary, anim: String, hoja: String) -> void:
	if player.sprite_frames.has_animation(anim):
		return









	var vestido: Dictionary = _walk_cfg(player, cfg)
	var puestos: int = 0
	for i in range(0, 8):
		var path: String = "%s%02d.png" % [hoja, i]
		if not ResourceLoader.exists(path):
			continue
		if puestos == 0:
			player.sprite_frames.add_animation(anim)
			player.sprite_frames.set_animation_loop(anim, true)



			player.sprite_frames.set_animation_speed(anim, 7.0)
		player.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), vestido))
		puestos += 1
	if puestos > 0:
		espalda_registra(player, anim, hoja, 0)









func _monta_lagrimas() -> void:
	if player == null:
		return
	var p: GeometryInstance3D = Particulas.nodo()
	p.amount = GOTAS
	p.lifetime = GOTA_VIDA
	p.emitting = false
	p.local_coords = false
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX









	pm.emission_box_extents = Vector3(OJOS_X, 0.01, OJOS_X)
	pm.direction = Vector3(0.0, -1.0, 0.0)
	pm.spread = 4.0
	pm.initial_velocity_min = 0.1
	pm.initial_velocity_max = 0.22
	pm.gravity = Vector3(0.0, -3.2, 0.0)
	pm.scale_min = 0.7
	pm.scale_max = 1.0


	var curva: Curve = Curve.new()
	curva.add_point(Vector2(0.0, 1.0))
	curva.add_point(Vector2(0.72, 1.0))
	curva.add_point(Vector2(1.0, 0.0))



	pm.alpha_curve = Particulas.curva(curva)
	p.process_material = pm
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(GOTA_M, GOTA_M)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = GOTA_COLOR
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	mat.vertex_color_use_as_albedo = true
	quad.material = mat
	p.draw_pass_1 = quad
	player.add_child(p)
	p.position = Vector3(0.0, OJOS_Y, 0.02)
	_lagrimas = p












func _arco_de_copas() -> void:
	var piezas: Array[String] = _piezas_arco()
	if piezas.is_empty():
		return



	var pasos: int = maxi(piezas.size() - 1, 1)
	var paso: float =(ARCO_ABRE * 2.0) / float(pasos)
	for i in piezas.size():
		var lado: float = 1.0 if i % 2 == 0 else -1.0
		var rango: int =(i + 1) / 2
		var ang: float = deg_to_rad(clampf(lado * float(rango) * paso, - ARCO_ABRE,
			ARCO_ABRE))


		var at: Vector3 = Vector3(sin(ang) * ARCO_R, 0.0,
			CENTER_Z - cos(ang) * ARCO_R)
		_peana(piezas[i], at)





func _piezas_arco() -> Array[String]:
	var cab: Dictionary = Trophies.cabinet(Career.awards)
	var piezas: Array[String] = []
	for grupo in [cab.get("team", []), cab.get("individual", [])]:
		for item in grupo:
			for _i in int((item as Dictionary).get("count", 1)):
				if piezas.size() >= TROFEOS_MAX:
					break
				piezas.append(String((item as Dictionary).get("type", "liga")))
	return piezas





func _look_protagonista(kit: Dictionary) -> Dictionary:
	var look: Dictionary = kit.duplicate()
	look["number"] = shirt()
	return look


func _nombre_tablero() -> String:
	return Career.player_name




func _peana(tipo: String, at: Vector3) -> void:
	var caja: MeshInstance3D = MeshInstance3D.new()
	var malla: BoxMesh = BoxMesh.new()
	malla.size = PEANA
	caja.mesh = malla
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.09, 0.1, 0.13)
	mat.roughness = 0.9
	caja.material_override = mat
	caja.position = at + Vector3(0.0, PEANA.y * 0.5, 0.0)
	viewport.add_child(caja)
	var faldon: MeshInstance3D = MeshInstance3D.new()
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(PEANA.x * 0.9, PEANA.y * 0.5)
	faldon.mesh = quad
	var fmat: StandardMaterial3D = StandardMaterial3D.new()
	fmat.albedo_color = accent
	fmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	faldon.material_override = fmat


	faldon.position = at + Vector3(0.0, PEANA.y * 0.5, PEANA.z * 0.5 + 0.01)
	viewport.add_child(faldon)
	make_trophy(tipo, at + Vector3(0.0,
		PEANA.y + TROFEO_H * 0.5 - TROFEO_HUNDE, 0.0), TROFEO_H)


















func _grada_cercana() -> void:
	if stadium == null:
		return
	var pool: Array[SpriteFrames] = stadium.fan_frames_variants(true, 5)
	if pool.is_empty() or pool[0] == null:
		return


	var cada: int = maxi(CERCANOS / maxi(LLORAN, 1), 2)
	for i in CERCANOS:
		var frames: SpriteFrames = pool[i % pool.size()]
		if frames == null:
			continue
		var fondo: float = rng.randf_range(CERCA_FONDO.x, CERCA_FONDO.y)
		var f: AnimatedSprite3D = AnimatedSprite3D.new()
		f.sprite_frames = frames
		f.pixel_size = CERCA_H / 32.0
		f.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		f.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		f.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		f.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



		f.set_meta("occ_gente", true)



		f.position = Vector3(-(GRADA_X + fondo),
			1.0 +(fondo - 1.5) * 1.6 + 0.85 + CERCA_H * 0.5,
			CENTER_Z + rng.randf_range(- CERCA_Z, CERCA_Z))
		viewport.add_child(f)
		var pena: bool =(i % cada) == 1
		var anim: String = "sad" if pena else "cheer"
		if not frames.has_animation(anim):
			anim = "idle"
		f.play(anim)


		f.speed_scale = rng.randf_range(0.55, 0.85) if pena \
				else rng.randf_range(0.9, 1.6)
		if frames.get_frame_count(anim) > 1:
			f.frame = rng.randi_range(0, frames.get_frame_count(anim) - 1)











func _monta_ahijado() -> void:
	var ah: Dictionary = data.get("ahijado", {})
	var nm: String = String(ah.get("name", ""))
	if nm.is_empty():
		return
	var su_club: Dictionary = Teams.by_id(String(ah.get("club", "")))
	if su_club.is_empty():
		su_club = team()
	var cfg: Dictionary = person_look({"name": nm, "number": int(ah.get("number", 0))},
		KitRecolor.team_only(GameState.kit_variant(su_club, 0)))
	cfg["club"] = String(su_club.get("id", ""))
	var frames: SpriteFrames = player_frames(cfg, "south")
	if frames == null or frames.get_frame_count("idle") == 0:
		return
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.name = "Ahijado"
	spr.sprite_frames = frames
	spr.pixel_size = px
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(AHIJADO_AT.x, feet_offset(px) - PLAYER_SINK, AHIJADO_AT.z)
	viewport.add_child(spr)
	spr.play("idle")


	festejo_hornea(frames, _gesto_aplauso())
	var ap: String = String(ah.get("apellido", ""))
	PlacaNombre.cuelga(spr, ap if not ap.is_empty() else Juveniles.apellido(nm), true, false)
	ahijado_actor = spr




func _gesto_aplauso() -> int:
	for i in FESTEJO_GESTOS.size():
		if String((FESTEJO_GESTOS[i] as Dictionary)["anim"]) == "aplauso":
			return i
	return 0


func _ahijado_palmas() -> void:
	if _ahijado_aplaude or ahijado_actor == null or not is_instance_valid(ahijado_actor):
		return
	_ahijado_aplaude = true
	festejo_play(ahijado_actor, "aplauso")


func _ficha(club: Dictionary) -> void:
	make_chyron(I18n.t("EL ADIOS"), String(club.get("name", "?")).to_upper(),
		club, T_CHYRON)
	make_card(T_CARD)
	card_title(CareerTheme.caps(Career.player_name), 40)
	card_club(club)
	card_count(int(data.get("seasons", 0)), I18n.t("TEMPORADAS EN ESTA CASA"))



	var line: Dictionary = data.get("line", {})
	card_stats([
		{"v": str(int(line.get("matches", 0))), "k": I18n.t("partidos")},
		{"v": str(int(line.get("goals", 0))), "k": I18n.t("goles")},
		{"v": str(int(line.get("assists", 0))), "k": I18n.t("asist.")},
	])
	card_note(I18n.t(_nota()))
	card_cta(I18n.t("SEGUIR"))





func _nota() -> String:
	if int(data.get("trophies", 0)) <= 0:
		return "Ni una copa que sacar al césped, y el estadio en pie igual."
	if bool(data.get("home", false)):
		return "Aquí empezó todo. Y aquí se acaba, con todo lo que ganaste puesto."
	return "Los que te vieron crecer se quedaron de pie hasta el final."


func _tick(delta: float) -> void:


	if t >= T_LLEGADA:
		_ahijado_palmas()
	if not _andando and t >= T_ANDAR:
		_andando = true




		walk_play(player, Vector3(0.0, 0.0, -1.0))
	if _andando and not _llegado:
		player.position.z -= VELOCIDAD * delta
		if player.position.z <= CENTER_Z + PARADA_DZ:
			_llegado = true
			player.position.z = CENTER_Z + PARADA_DZ
			_llegas()
		return
	if _llegado:
		_tick_banda(delta)

















func _tick_banda(delta: float) -> void:
	if t < T_BANDA or player == null or not is_instance_valid(player):
		return
	if player.position.x <= BANDA_X:
		_palmas(true)
		return



	var hecho: float = absf(player.position.x)
	var dentro: float = fmod(hecho, TRAMO + PARA_M)
	if dentro >= TRAMO:
		_palmas(true)
		return
	_palmas(false)
	walk_play(player, Vector3(-1.0, 0.0, 0.0))
	player.position.x -= VELOCIDAD * delta





func _palmas(on: bool) -> void:
	if player == null or not is_instance_valid(player) or player.sprite_frames == null:
		return
	var anim: String = _hoja_palmas()
	if on and player.sprite_frames.has_animation(anim):
		if player.animation != anim:
			player.play(anim)
	elif not on and player.animation.begins_with("clap"):


		player.play("idle")
	if _lagrimas != null and is_instance_valid(_lagrimas):
		_lagrimas.emitting = on










func _hoja_palmas() -> String:
	var d: String = walk_dir_name(Vector3(-1.0, 0.0, 0.0))
	if d == "south":
		return "clap"
	var anim: String = "clap_" + d
	return anim if player.sprite_frames.has_animation(anim) else "clap"






func _llegas() -> void:


	walk_play(player, Vector3.ZERO)
	set_confetti(true)
	stadium.crowd_react("home", "goal")
	stadium.pulse_ads(3.0)
	ovation(1.5)
	sting("fanfare", -6.0)


func _skipped() -> void:



	if player != null and is_instance_valid(player):
		player.position.z = CENTER_Z + PARADA_DZ
		player.position.x = BANDA_X
	if not _llegado:
		_llegado = true
		_llegas()
	_palmas(true)
	_ahijado_palmas()
