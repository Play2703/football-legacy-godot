class_name BaloneroLento
extends RefCounted






















const P: float = 0.35
const MINUTO: int = 80

const CAL_X: float = 34.15
const BALON_FUERA_M: float = 1.6

const YO_DENTRO_M: float = 4.0
const CHICO_FUERA: Vector2 = Vector2(4.5, -7.5)
const ALTO_K: float = 0.74

const LLEGA_S: float = 1.05
const YO_PARA_S: float = 3.0
const YO_FONDO_M: float = 14.0
const PRISA_K: float = 1.7
const SE_VA_S: float = 2.2
const AGACHA_S: float = 0.35
const COGE_S: float = 0.6
const SUELTA_S: float = 0.5
const VUELA_S: float = 0.9
const VUELO_ALTO_M: float = 3.2
const VALLA_LEJOS_M: float = 9.0
const RECLAMA_S: float = 0.9
const RESPIRO_S: float = 0.5

const CAM_OFF: Vector3 = Vector3(-6.5, 1.9, 5.5)
const CAM_FOV: float = 36.0


static var forzar: bool = false



static func toca(m, chance: Dictionary) -> bool:
	if m._stadium == null or m._self_actor == null or not is_instance_valid(m._self_actor):
		return false
	if m.has_meta("balonero_hecho") or bool(m._stadium.venue_empty):
		return false
	if forzar:
		return true
	if m._tutorial_active or not String(m._practice_kind).is_empty() \
			or GameState.readonly_save:
		return false
	if String(chance.get("kind", "")) == m.META_KIND or bool(chance.get("pedido", false)):
		return false
	if not condiciones(bool(m._home_match), int(m.match_minute), int(m.team_goals),
			int(m.rival_goals)):
		return false
	return randf() < P



static func condiciones(en_casa: bool, minuto: int, mios: int, suyos: int) -> bool:
	return not en_casa and minuto >= MINUTO and suyos - mios == 1


static func juega(m) -> void:
	m.set_meta("balonero_hecho", true)
	var estado_previo: int = m.state
	m.state = m.State.SETUP
	var yo0: AnimatedSprite3D = m._self_actor


	var lado: float = signf(yo0.position.x) if absf(yo0.position.x) > 3.0 else 1.0
	var z0: float = clampf(yo0.position.z, 16.0, 80.0)
	var ocultos: Array = []
	for hijo in m._actors.get_children():
		if hijo is Node3D and (hijo as Node3D).visible:
			(hijo as Node3D).visible = false
			ocultos.append(hijo)
	var balon_estaba: bool = is_instance_valid(m._ball) and m._ball.visible
	if balon_estaba:
		m._ball.visible = false




	var yo: AnimatedSprite3D = m._spawn_actor(m.TEAM_TEX, lado *(CAL_X - YO_DENTRO_M),
		z0 - YO_FONDO_M, m.PLAYER_METRICS, m.PLAYER_HEIGHT_M, true)
	var chico: AnimatedSprite3D = m._spawn_actor(m.TEAM_TEX, lado *(CAL_X + CHICO_FUERA.x),
		z0 + CHICO_FUERA.y, m.PLAYER_METRICS, m.PLAYER_HEIGHT_M * ALTO_K, _chico_cfg(m))
	var r: float = m.BALL_VISUAL_D * 0.5
	var balon: Node3D = null
	if is_instance_valid(m._ball):
		balon = m._ball.duplicate() as Node3D
		m._ball.get_parent().add_child(balon)
		balon.visible = true
		balon.position = Vector3(lado *(CAL_X + BALON_FUERA_M), r, z0)
	var prev_cam: Camera3D = SceneFade.camara_de(m)
	var cam: Camera3D = Camera3D.new()
	cam.fov = CAM_FOV
	m.add_child(cam)
	var mira: Vector3 = Vector3(lado *(CAL_X - 0.2), 1.0, z0 - 0.4)
	cam.position = Vector3(lado *(CAL_X + CAM_OFF.x), CAM_OFF.y, z0 + CAM_OFF.z)
	cam.look_at(mira)
	cam.current = true
	m._stadium.keep_view_clear(cam.global_position, PackedVector3Array(), cam)
	var limpia: Callable = func() -> void:
		for n in [yo, chico, balon, cam]:
			if is_instance_valid(n):
				(n as Node).queue_free()
		for hijo in ocultos:
			if is_instance_valid(hijo):
				(hijo as Node3D).visible = true


		if balon_estaba and is_instance_valid(m) and is_instance_valid(m._ball):
			m._ball.visible = true
		if is_instance_valid(prev_cam):
			prev_cam.current = true
	if yo == null or chico == null or balon == null:
		limpia.call()
		m.state = estado_previo
		return



	var junto_balon: Vector3 = Vector3(balon.position.x - lado * 0.45, chico.position.y,
		z0 + 0.15)
	var yo_para: Vector3 = Vector3(junto_balon.x - lado * 1.5, yo.position.y, junto_balon.z)
	var medio: Vector3 =(junto_balon + yo_para) * 0.5
	cam.position = Vector3(medio.x - lado * 3.2, CAM_OFF.y, medio.z + 7.2)
	cam.look_at(Vector3(medio.x - lado * 0.2, 0.95, medio.z))

	var derecha: Vector3 = cam.global_transform.basis.x
	derecha.y = 0.0
	derecha = derecha.normalized()
	var yo_corre: String = "run_" + m._dir_name_move(yo, yo_para - yo.position)
	var chico_corre: String = "run_" + m._dir_name_move(chico, junto_balon - chico.position)
	var yo_a_el: String = m._dir_name(junto_balon - yo_para)


	var a_valla: Vector3 = Vector3(lado, 0.0, 0.0)
	var lanza: String = "saque_banda_" +("east" if derecha.dot(a_valla) > 0.0 else "west")


	var yo_quieto: String = "idle_east" if yo_a_el.contains("east") \
			else ("idle_west" if yo_a_el.contains("west") else "idle")


	var chico_huye: String = "run_" + m._dir_name_move(chico, a_valla)




	await m._pique_arma([[yo, yo_corre], [chico, chico_corre], [chico, lanza],
		[yo, "pelea_dedo_" + yo_a_el], [yo, "pelea_encara_" + yo_a_el],
		[yo, yo_quieto], [chico, "idle"], [chico, chico_huye]])
	m._arma_barrera(chico)
	if not _sigue(m, cam):
		limpia.call()
		return
	m._ondemand_deadline_us = Time.get_ticks_usec() + m.INJURY_ART_BUDGET_US


	var hacia_cam: Vector3 = cam.global_position - junto_balon
	hacia_cam.y = 0.0
	hacia_cam = hacia_cam.normalized() * 0.22

	m._sub_play(yo, yo_corre, "idle")
	m._sub_play(chico, chico_corre, "idle")

	chico.speed_scale = PRISA_K
	m._cara(yo, "concentra", LLEGA_S)
	var tw: Tween = m.create_tween().set_parallel(true)
	tw.tween_property(chico, "position", junto_balon, LLEGA_S)
	tw.tween_property(yo, "position", yo_para, YO_PARA_S) \
			.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tw.tween_callback(func() -> void:
		if is_instance_valid(yo):
			m._sub_play(yo, yo_quieto, "idle")).set_delay(YO_PARA_S)
	await SceneFade.timer(LLEGA_S, false).timeout


	if not _sigue(m, cam):
		limpia.call()
		return
	chico.speed_scale = 1.0




	var sf: SpriteFrames = chico.sprite_frames
	if sf != null and sf.has_animation(&"barrera_agacha"):
		balon.position = chico.position + hacia_cam * 1.6 \
				+ Vector3(0.0, r - chico.position.y, 0.0)
		var n: int = sf.get_frame_count(&"barrera_agacha")
		sf.set_animation_speed(&"barrera_agacha", float(n) / AGACHA_S)
		chico.play(&"barrera_agacha")
		await SceneFade.timer(AGACHA_S + 0.1, false).timeout
		if not _sigue(m, cam):
			limpia.call()
			return
		chico.play_backwards(&"barrera_agacha")
		var tw_coge: Tween = m.create_tween()
		tw_coge.tween_property(balon, "position", chico.position + hacia_cam, AGACHA_S)
		await tw_coge.finished
		if not _sigue(m, cam):
			limpia.call()
			return
	m._sub_play(chico, "idle", "idle")
	balon.position = chico.position + hacia_cam
	m._cara(chico, "alegria", 6.0)
	m._stadium.crowd_react("home", "close")
	await SceneFade.timer(COGE_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return



	m._pique_juega(chico, lanza, lanza.trim_prefix("saque_banda_"))
	var arriba: Vector3 = chico.position + Vector3(0.0, 0.72, 0.0)
	var tw_sube: Tween = m.create_tween()
	tw_sube.tween_property(balon, "position", arriba, SUELTA_S * 0.6)
	await SceneFade.timer(SUELTA_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return
	var b0: Vector3 = balon.position
	var b1: Vector3 = Vector3(lado *(CAL_X + VALLA_LEJOS_M), 0.3, z0 + 1.0)
	var tw_vuela: Tween = m.create_tween()
	tw_vuela.tween_method(func(k: float) -> void:
		if is_instance_valid(balon):
			var p: Vector3 = b0.lerp(b1, k)
			p.y += sin(k * PI) * VUELO_ALTO_M
			balon.position = p
			balon.visible = k < 0.97, \
					0.0, 1.0, VUELA_S)
	m._audio.ooh()


	Achievements.ingest_balonero_lento()
	await tw_vuela.finished
	if not _sigue(m, cam):
		limpia.call()
		return


	m._sub_play(chico, "idle", "idle")
	m._cara(chico, "alegria", 4.0)
	m._cara(yo, "rabia", RECLAMA_S * 3.0 + 0.4)
	m._audio.voz_tras("protesta", 0.05)
	m._hud.show_message(I18n.t("¡El recogepelotas hace tiempo!"), CareerTheme.DANGER, 2.6)
	var huye: bool = false
	for gesto in ["pelea_dedo_", "pelea_encara_", "pelea_dedo_"]:
		m._pique_juega(yo, gesto + yo_a_el, yo_a_el)
		if not huye:

			huye = true



			SceneFade.timer(RECLAMA_S * 0.6, false).timeout.connect(
				_chico_se_va.bind(m, chico, chico_huye, lado))
		await SceneFade.timer(RECLAMA_S, false).timeout
		if not _sigue(m, cam):
			limpia.call()
			return
		if gesto == "pelea_encara_":
			m._audio.voz_tras("protesta", 0.0)
	m._cara(yo, "protesta", RESPIRO_S + 0.2)
	await SceneFade.timer(RESPIRO_S, false).timeout
	limpia.call()
	if is_instance_valid(m):
		m.state = estado_previo





static func _chico_se_va(m, chico: AnimatedSprite3D, chico_huye: String, lado: float) -> void:
	if not is_instance_valid(m) or not m.is_inside_tree() or not is_instance_valid(chico):
		return
	m._sub_play(chico, chico_huye, "idle")
	var tw_va: Tween = m.create_tween()
	tw_va.tween_property(chico, "position", Vector3(lado *(CAL_X + 6.0),
		chico.position.y, chico.position.z + 0.6), SE_VA_S)
	tw_va.tween_callback(_chico_oculta.bind(chico))



static func _chico_oculta(chico: AnimatedSprite3D) -> void:
	if is_instance_valid(chico):
		chico.visible = false



static func _sigue(m, cam: Camera3D) -> bool:
	return is_instance_valid(m) and m.is_inside_tree() and m.state == m.State.SETUP \
			and is_instance_valid(cam)




static func _chico_cfg(m) -> Dictionary:
	var fx: Dictionary = GameState.current_fixture()
	var semilla: String = "balonero_%s_%s" % [str(fx.get("home", "")), str(fx.get("round", ""))]
	var cfg: Dictionary = KitRecolor.appearance_for(semilla,
		{"kit": Stadium.BALLBOY_KIT, "kit2": Stadium.BALLBOY_KIT2})
	cfg = KitRecolor.infantil(cfg)
	cfg["number"] = 0
	cfg.erase("apellido")
	return cfg
