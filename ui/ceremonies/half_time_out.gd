extends "res://ui/ceremonies/half_time.gd"































const T_CHYRON_OUT: float = 0.6



const T_CARD_OUT: float = 3.6





func _accent_for() -> Color:
	return CareerTheme.DANGER





const SALIDA: Vector2 = Vector2(-5.9, 1.55)



const PASO_MS: float = 1.3











const FILA_X: Array = [-3.4, -2.5, -1.5, -0.5, 0.6]

const FILA_Z: Array = [1.42, 1.78, 1.5, 1.86, 1.58]





const ZANCADA: Vector2 = Vector2(0.44, 0.58)





const PISADA_CERCA: Vector2 = Vector2(3.0, -19.0)
const PISADA_LEJOS: Vector2 = Vector2(11.0, -35.0)





const MURMULLO_FADE: float = 4.0





const PUERTA_ANTES: float = 0.75
const PUERTA_DESPUES: float = 0.55




var _fila: Array = []



var _puerta_abre: float = 0.0
var _puerta_cierra: float = 0.0







var _salida_abierta: bool = false
var _salida_cerrada: bool = false


func _build() -> void:



	_mi_peto = Stadium.BIB_COLORS[0]
	_sala_vacia = true


	_llegada = false
	_build_sala()
	_build_fila()



	locker_murmur_fade(MURMULLO_FADE)



	_ducha_off_at = MURMULLO_FADE + 0.8



	make_chyron(I18n.t("DESCANSO"), I18n.t("NO SALES"), team(), T_CHYRON_OUT)
	make_card(T_CARD_OUT)
	card_title(I18n.t("NO SALES"), 46)


	card_sub(I18n.t(_verdict()))


	card_stats(_stats())
	var linea: Dictionary = _out_line()
	card_note(I18n.tf(String(linea["key"]), linea.get("args", [])))
	card_cta(I18n.t("AL BANQUILLO"))








func _build_fila() -> void:
	var por_hueco: Dictionary = room.mates_by_bay()
	var kit: Dictionary = room.room_kit()
	var claves: Array = por_hueco.keys()
	claves.sort()
	var i: int = 0
	for bay in claves:
		if i >= FILA_X.size():
			break
		var mate: Dictionary = por_hueco[bay]
		var nombre: String = String(mate.get("name", ""))
		if nombre.is_empty():
			continue










		var cfg: Dictionary = person_look(mate,
			room.kit_de(mate) if room.es_portero(mate) else kit)
		if room.es_portero(mate):
			cfg = KitRecolor.keeper_field_cfg(cfg)
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.sprite_frames = player_frames(cfg)
		spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF




		add_walk(spr, cfg)
		var p: Vector2 = Vector2(FILA_X[i], FILA_Z[i % FILA_Z.size()])
		spr.position = Vector3(p.x, feet_offset(spr.pixel_size), p.y)
		spr.play("idle")
		viewport.add_child(spr)


		_fila.append({"spr": spr, "from": p,
			"paso": rng.randf_range(0.0, ZANCADA.y)})
		i += 1

	var primero: float = 1000000000.0
	var ultimo: float = 0.0
	for w in _fila:
		var seg: float =(SALIDA - Vector2(w["from"])).length() / PASO_MS
		primero = minf(primero, seg)
		ultimo = maxf(ultimo, seg)
	if _fila.is_empty():
		return
	_puerta_abre = maxf(primero - PUERTA_ANTES, 0.2)
	_puerta_cierra = ultimo + PUERTA_DESPUES






func _tick(delta: float) -> void:
	super._tick(delta)


	if not _salida_abierta and t >= _puerta_abre:
		_salida_abierta = true
		if room.door_open(true):
			locker_door()
	elif _salida_abierta and not _salida_cerrada and t >= _puerta_cierra:
		_salida_cerrada = true
		if room.door_open(false):
			locker_door()
	for w in _fila:
		var spr: AnimatedSprite3D = w["spr"]
		if not is_instance_valid(spr) or not spr.visible:
			continue
		var from: Vector2 = w["from"]
		var dir: Vector2 = SALIDA - from
		var largo: float = dir.length()
		var k: float = clampf((t * PASO_MS) / maxf(largo, 0.01), 0.0, 1.0)
		var pos: Vector2 = from.lerp(SALIDA, k)
		spr.position.x = pos.x
		spr.position.z = pos.y
		if k >= 1.0:
			spr.visible = false
			continue
		walk_play(spr, Vector3(dir.x, 0.0, dir.y).normalized())



		if t >= float(w["paso"]):
			w["paso"] = t + rng.randf_range(ZANCADA.x, ZANCADA.y)
			locker_step(_db_por_distancia(spr.global_position))







func _db_por_distancia(pos: Vector3) -> float:
	if cam == null:
		return PISADA_CERCA.y
	var d: float = cam.global_position.distance_to(pos)
	var k: float = clampf((d - PISADA_CERCA.x) /(PISADA_LEJOS.x - PISADA_CERCA.x),
		0.0, 1.0)
	return lerpf(PISADA_CERCA.y, PISADA_LEJOS.y, k)










func _out_line() -> Dictionary:
	match String(data.get("reason", "")):
		"banquillo":


			return {"key": "Le metiste un balonazo a tu propio banquillo. No hacía "
				+ "falta nada más.", "args": []}
		"waste":
			var n: int = maxi(int(data.get("wasted", 3)), 3)
			return {"key": "{0} ocasiones tiradas antes del descanso. Ya lo había "
				+ "decidido en la tercera.", "args": [n]}
	return {"key": "Cuarenta y cinco minutos y no te he visto. Hoy se acabó aquí.",
		"args": []}
