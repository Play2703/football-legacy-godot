class_name CuerdasRed
extends RefCounted




































const ENTRA_X: float = 11.0
const ENTRA_Z: float = -3.6


const PUESTO_FUERA_M: float = 0.42
const PUESTO_Z: float = -2.45


const MIRA_S: float = 1.1
const CORRE_S: float = 1.6
const TIENDE_S: float = 1.7
const DESFASE_S: float = 0.25
const TENSA_S: float = 0.45
const APLAUDE_S: float = 1.5
const SE_VA_S: float = 1.4
const BRAZOS_K: float = 0.55









const CAM_FOV: float = 50.0
const CERCA_POS: Vector3 = Vector3(9.4, 3.2, -2.4)
const CERCA_MIRA: Vector3 = Vector3(3.66, 2.0, -2.65)





const ANCHO_POS: Vector3 = Vector3(9.5, 2.8, 8.0)
const ANCHO_RETRATO_MIRA: Vector3 = Vector3(4.8, 1.2, -2.8)



const ANCHO_TUMBADO_POS: Vector3 = Vector3(0.0, 3.4, 6.5)
const ANCHO_MIRA: Vector3 = Vector3(0.0, 1.4, -2.6)
const ACERCA_K: float = 0.06

const BANCO_ALTO: float = 0.42


const MANOS_ARRIBA_M: float = 2.25
const BANCO_LARGO: float = 0.6
const BANCO_FONDO: float = 0.3
const BANCO_TABLA: float = 0.05
const BANCO_PATA: float = 0.05
const BANCO_MADERA: Color = Color("a0703f")
const BANCO_PATAS: Color = Color("6b4526")


const BANCO_EN_BRAZOS: Vector3 = Vector3(0.0, 0.55, 0.28)

const BANCO_X_M: float = 0.2
const DEJA_S: float = 0.3
const SUBE_S: float = 0.35
const BAJA_S: float = 0.3
const RECOGE_S: float = 0.3
const SALTO_M: float = 0.14


static var forzar: bool = false



static func toca(m, _chance: Dictionary) -> bool:
	if m._stadium == null or not is_instance_valid(m._stadium):
		return false
	if forzar:
		return true
	if m._tutorial_active:
		return false
	return condiciones(int(m._stadium.net_ropes_broken()))



static func condiciones(rotas: int) -> bool:
	return rotas >= 2








static func tira_lado() -> String:
	var derecha: Vector3 =((CERCA_MIRA - CERCA_POS) * Vector3(1.0, 0.0, 1.0)).cross(Vector3.UP)
	return "east" if derecha.dot(Vector3(0.0, 0.0, 1.0)) > 0.0 else "west"


static func juega(m) -> void:
	var st = m._stadium
	var estado_previo: int = m.state
	m.state = m.State.SETUP
	var ocultos: Array = []
	for hijo in m._actors.get_children():
		if hijo is Node3D and (hijo as Node3D).visible:
			(hijo as Node3D).visible = false
			ocultos.append(hijo)
	var balon_estaba: bool = is_instance_valid(m._ball) and m._ball.visible
	if balon_estaba:
		m._ball.visible = false


	var cuerdas: Array = []
	for i in 2:
		var ends: PackedVector3Array = st.net_rope_ends(i)
		if ends.size() == 2:
			cuerdas.append({"i": i, "lado": signf(ends[0].x)})
	var staff: Array[AnimatedSprite3D] = []
	var bancos: Array[Node3D] = []
	for c in cuerdas:
		var lado: float = c["lado"]
		var a: AnimatedSprite3D = m._spawn_actor(m.TEAM_TEX, lado * ENTRA_X, ENTRA_Z,
			m.PLAYER_METRICS, m.PLAYER_HEIGHT_M, _staff_cfg(int(c["i"])))
		staff.append(a)

		var b: Node3D = banco()
		b.position = Vector3(lado * ENTRA_X, 0.0, ENTRA_Z) + BANCO_EN_BRAZOS
		m.add_child(b)
		bancos.append(b)
	var prev_cam: Camera3D = SceneFade.camara_de(m)
	var cam: Camera3D = Camera3D.new()
	cam.fov = CAM_FOV
	m.add_child(cam)

	var vista: Vector2 = m.get_viewport().get_visible_rect().size
	var ancho: Vector3 = ANCHO_TUMBADO_POS if vista.x > vista.y else ANCHO_POS
	var mira_ancho: Vector3 = ANCHO_MIRA if vista.x > vista.y else ANCHO_RETRATO_MIRA
	_plano(st, cam, ancho, mira_ancho, 0.0)
	cam.current = true
	var limpia: Callable = func() -> void:
		for n in staff:
			if is_instance_valid(n):
				n.queue_free()
		for b in bancos:
			if is_instance_valid(b):
				b.queue_free()
		if is_instance_valid(cam):
			cam.queue_free()
		for hijo in ocultos:
			if is_instance_valid(hijo):
				(hijo as Node3D).visible = true


		if is_instance_valid(m):
			if balon_estaba and is_instance_valid(m._ball):
				m._ball.visible = true
			if m._audio != null:
				m._audio.set_applause(false)
		if is_instance_valid(prev_cam):
			prev_cam.current = true
	if staff.size() != cuerdas.size() or staff.has(null) or cuerdas.is_empty():
		limpia.call()
		m.state = estado_previo
		return



	var puestos: Array[Vector3] = []
	var subidos: Array[Vector3] = []
	var suelos: Array[Vector3] = []
	var corre: Array[String] = []
	var tira: Array[String] = []
	var sale: Array[String] = []
	var pares: Array = []
	for k in staff.size():
		var a: AnimatedSprite3D = staff[k]
		var lado: float = cuerdas[k]["lado"]
		var p: Vector3 = Vector3(lado *(Stadium.GOAL_HALF_W + PUESTO_FUERA_M), a.position.y,
			PUESTO_Z)
		puestos.append(p)
		var x_banco: float = lado *(Stadium.GOAL_HALF_W + BANCO_X_M)
		suelos.append(Vector3(x_banco, 0.0, PUESTO_Z))
		subidos.append(Vector3(x_banco, p.y + BANCO_ALTO, PUESTO_Z))
		corre.append("run_" + m._dir_name_move(a, p - a.position))
		tira.append("saque_banda_" + tira_lado())
		sale.append("run_" + m._dir_name_move(a, Vector3(lado, 0.0, 0.0)))
		pares.append_array([[a, corre[k]], [a, tira[k]], [a, "clap"], [a, "idle"],
			[a, sale[k]]])


	await m._pique_arma(pares)
	if not _sigue(m, cam):
		limpia.call()
		return
	m._ondemand_deadline_us = Time.get_ticks_usec() + m.INJURY_ART_BUDGET_US

	_plano(st, cam, CERCA_POS, CERCA_MIRA, MIRA_S)
	await SceneFade.timer(MIRA_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return

	_plano(st, cam, ancho, mira_ancho, CORRE_S)

	m._hud.show_message(I18n.t("¡El staff arregla la red!"), Color("f2ede0"), CORRE_S)



	Achievements.ingest_cuerdas_red()
	var tw: Tween = m.create_tween().set_parallel(true)
	for k in staff.size():
		m._sub_play(staff[k], corre[k], "idle")
		tw.tween_property(staff[k], "position", puestos[k], CORRE_S) \
				.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)

		var en_brazos: Vector3 = Vector3(puestos[k].x, 0.0, puestos[k].z) + BANCO_EN_BRAZOS
		tw.tween_property(bancos[k], "position", en_brazos, CORRE_S) \
				.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	await SceneFade.timer(CORRE_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return



	_plano(st, cam, CERCA_POS, CERCA_MIRA, DEJA_S + SUBE_S + TIENDE_S + DESFASE_S + TENSA_S)
	var tw_deja: Tween = m.create_tween().set_parallel(true)
	for k in staff.size():
		m._sub_play(staff[k], "idle", "idle")
		tw_deja.tween_property(bancos[k], "position", suelos[k], DEJA_S) \
				.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	await SceneFade.timer(DEJA_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return
	var tw_sube: Tween = m.create_tween().set_parallel(true)
	for k in staff.size():
		tw_sube.tween_method(_paso.bind(staff[k], puestos[k], subidos[k]), 0.0, 1.0, SUBE_S)
	await SceneFade.timer(SUBE_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return
	for k in staff.size():
		m._pique_juega(staff[k], tira[k], tira[k].trim_prefix("saque_banda_"))
		staff[k].speed_scale = BRAZOS_K
		m._cara(staff[k], "concentra", TIENDE_S + DESFASE_S)
		if k == 0:
			st.repair_net_rope(int(cuerdas[k]["i"]), TIENDE_S)
		else:


			SceneFade.timer(DESFASE_S, false).timeout.connect(
				_tiende.bind(st, int(cuerdas[k]["i"])))
	await SceneFade.timer(TIENDE_S + DESFASE_S + TENSA_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return


	_plano(st, cam, ancho, mira_ancho, BAJA_S + APLAUDE_S + RECOGE_S + SE_VA_S)
	var tw_baja: Tween = m.create_tween().set_parallel(true)
	for k in staff.size():
		staff[k].speed_scale = 1.0
		m._sub_play(staff[k], "idle", "idle")
		tw_baja.tween_method(_paso.bind(staff[k], subidos[k], puestos[k]), 0.0, 1.0, BAJA_S)
	await SceneFade.timer(BAJA_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return
	for k in staff.size():
		m._pique_juega(staff[k], "clap", "idle")
		m._cara(staff[k], "alegria", APLAUDE_S + SE_VA_S)
	m._audio.set_applause(true, -14.0)
	await SceneFade.timer(APLAUDE_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return

	var tw_recoge: Tween = m.create_tween().set_parallel(true)
	for k in staff.size():
		m._sub_play(staff[k], "idle", "idle")
		tw_recoge.tween_property(bancos[k], "position", Vector3(puestos[k].x, 0.0,
			puestos[k].z) + BANCO_EN_BRAZOS, RECOGE_S) \
					.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	await SceneFade.timer(RECOGE_S, false).timeout
	if not _sigue(m, cam):
		limpia.call()
		return

	var tw_va: Tween = m.create_tween().set_parallel(true)
	for k in staff.size():
		m._sub_play(staff[k], sale[k], "idle")
		var lado: float = cuerdas[k]["lado"]
		var fuera: Vector3 = Vector3(lado * ENTRA_X, staff[k].position.y, ENTRA_Z)
		tw_va.tween_property(staff[k], "position", fuera, SE_VA_S)
		tw_va.tween_property(bancos[k], "position", Vector3(fuera.x, 0.0, fuera.z)
			+ BANCO_EN_BRAZOS, SE_VA_S)
	await SceneFade.timer(SE_VA_S, false).timeout
	limpia.call()
	if is_instance_valid(m):
		m.state = estado_previo




static func _paso(k: float, a: AnimatedSprite3D, desde: Vector3, hasta: Vector3) -> void:
	if is_instance_valid(a):
		a.position = desde.lerp(hasta, k) + Vector3(0.0, sin(k * PI) * SALTO_M, 0.0)




static func banco() -> Node3D:
	var b: Node3D = Node3D.new()
	b.name = "BancoStaff"
	var madera: StandardMaterial3D = StandardMaterial3D.new()
	madera.albedo_color = BANCO_MADERA
	madera.roughness = 0.85
	var patas: StandardMaterial3D = StandardMaterial3D.new()
	patas.albedo_color = BANCO_PATAS
	patas.roughness = 0.85
	_pieza(b, Vector3(BANCO_FONDO, BANCO_TABLA, BANCO_LARGO),
		Vector3(0.0, BANCO_ALTO - BANCO_TABLA * 0.5, 0.0), madera)
	var alto_pata: float = BANCO_ALTO - BANCO_TABLA
	var px: float = BANCO_FONDO * 0.5 - BANCO_PATA
	var pz: float = BANCO_LARGO * 0.5 - BANCO_PATA
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_pieza(b, Vector3(BANCO_PATA, alto_pata, BANCO_PATA),
				Vector3(sx * px, alto_pata * 0.5, sz * pz), patas)
		_pieza(b, Vector3(BANCO_PATA * 0.6, BANCO_PATA, pz * 2.0),
			Vector3(sx * px, alto_pata * 0.45, 0.0), patas)
	return b


static func _pieza(padre: Node3D, tam: Vector3, pos: Vector3,
		mat: StandardMaterial3D) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = tam
	mi.mesh = bm
	mi.material_override = mat
	mi.position = pos
	padre.add_child(mi)




static func _tiende(st, i: int) -> void:
	if is_instance_valid(st) and st.is_inside_tree():
		st.repair_net_rope(i, TIENDE_S - DESFASE_S)





static func _plano(st, cam: Camera3D, pos: Vector3, mira: Vector3, dura: float) -> void:
	if cam.has_meta("empuje"):
		var viejo: Tween = cam.get_meta("empuje")
		if viejo != null and viejo.is_valid():
			viejo.kill()
	cam.position = pos
	cam.look_at(mira)
	st.keep_view_clear(cam.global_position, PackedVector3Array(), cam)
	if dura <= 0.0:
		return
	var tw: Tween = cam.create_tween()
	tw.tween_property(cam, "position", pos.lerp(mira, ACERCA_K), dura) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	cam.set_meta("empuje", tw)



static func _sigue(m, cam: Camera3D) -> bool:
	return is_instance_valid(m) and m.is_inside_tree() and m.state == m.State.SETUP \
			and is_instance_valid(cam)




static func _staff_cfg(i: int) -> Dictionary:
	var fx: Dictionary = GameState.current_fixture()
	var semilla: String = "cuerdas_%s_%s_%d" % [str(fx.get("home", "")),
		str(fx.get("round", "")), i]
	var cfg: Dictionary = KitRecolor.appearance_for(semilla,
		{"kit": Stadium.BALLBOY_KIT, "kit2": Stadium.BALLBOY_KIT2})
	cfg["number"] = 0
	cfg.erase("apellido")
	return cfg
