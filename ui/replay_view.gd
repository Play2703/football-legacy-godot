class_name ReplayView
extends CanvasLayer





















signal closed






const SPEEDS: Array[float] = [0.25, 0.5, 1.0]


const SPEED_LABELS: Array[String] = ["0.25x", "0.5x", "1x"]

const SPEED_ARRANQUE: int = 1















const CAM_TV: int = 0
const CAM_GOAL: int = 1
const CAM_ORBIT: int = 2
const CAM_LIVE: int = 3
const CAM_FREE: int = 4




const CAM_LABELS: Array[String] = ["TV", "ARCO", "ORBITA", "TU CAMARA", "LIBRE"]



const CAM_CTX: String = "repe"








const MANDO_FS: int = 24
const W_PLAY: float = 120.0
const W_SPEED: float = 184.0
const W_CAM: float = 304.0
const W_SAVE: float = 328.0


const SYNTH_FOV: float = 52.0























const ALTO_RETRATO: float = 1920.0







const BANDA_H_ARRIBA: float = 128.0
const BANDA_H_ABAJO: float = 162.0
var _fov_k: float = 1.0







var lente_retrato: bool = false


var _bandas_h: Vector2 = Vector2.ZERO








const CAM_SETUP: Array = [
	[1.05, 0.26, 13.0],
	[3.14159, 0.13, 11.0],
	[0.0, 0.34, 12.5],
]



const LOOK_BIAS_GOAL: float = 0.28
const ORBIT_SPEED: float = 0.42









const GIRO_POR_ANCHO: float = 1.75
const ALZA_POR_ANCHO: float = 0.9
const GIRO_SUAVE: float = 12.0


const DRAG_SLOP_PX: float = 18.0




const STICK_ZM: float = 0.25
const GIRO_STICK: float = 2.0
const ALZA_STICK: float = 1.0


const BUSCA_PASO_S: float = 0.25
const BUSCA_S: float = 1.0
const CAM_MIN_Y: float = 1.1
const LOOK_UP: float = 1.05

var _clip: ReplayRec.Clip
var _ghosts: Array[AnimatedSprite3D] = []


var _caras: Array = []


var _caras_cfg: Array[String] = []








const CARAS_NUEVAS_POR_FOTOGRAMA: int = 1



const CARAS_ANTICIPO_S: Array[float] = [0.05, 0.1, 0.15, 0.2, 0.25, 0.3]
var _caras_rueda: int = 0



var caras_sin_tope: bool = false









var _lams: Array[Dictionary] = []





var lam_cam: Camera3D = null
var _root: Node3D
var _cam: Camera3D
var _prev_cam: Camera3D
var _hidden: Array = []







var _stadium: Stadium = null

var _t: float = 0.0
var _speed_i: int = SPEED_ARRANQUE
var _cam_i: int = CAM_TV
var _playing: bool = true



var _off_yaw: float = 1.05

var _yaw: float = 1.05
var _pitch: float = 0.26
var _dist: float = 13.0
var _look: Vector3 = Vector3.ZERO
var _look_set: bool = false




var _anchor_look: Vector3 = Vector3.ZERO
var _fixed_yaw: float = 0.0


var _drag: bool = false
var _drag_live: bool = false
var _drag_from: Vector2 = Vector2.ZERO




var _drag_idx: int = -1


var _free_yaw: float = 1.05
var _free_pitch: float = 0.26


var _busca_dir: int = 0


var _gatillos: Array[bool] = [true, true]

var _speed_btn: Button
var _cam_btn: Button
var _play_btn: Button
var _save_btn: Button


var _share_btn: Button
var _share_icon: MenuIcon

var _share_pct: Label


var _hint: Label


var _exporting: bool = false


var _pidiendo_permiso: bool = false

var _atras_prestada: bool = false

var _hint_antes_aviso: String = ""
var _bar_fill: ColorRect
var _bar_rail: Control
var _title: Label












var ring_mat_src: ShaderMaterial = null
var ring_label_tex: Callable = Callable()
var _ring: MeshInstance3D = null
var _ring_label: MeshInstance3D = null
var _ring_label_mat: StandardMaterial3D = null
var _ring_word: String = ""
var _ring_lado: float = 0.0
var _ring_btn: Button = null











enum Album{NADA, LISTO, GUARDANDO, GUARDADO, LLENO, SIN_ESPACIO, FALLO}
var album_gol: int = -1
var album_pide: Callable = Callable()
var album_nace: Album = Album.LISTO
var _album: Album = Album.NADA
var _album_btn: Button = null
var _album_icon: MenuIcon = null


var _album_deco: Control = null
var _album_giro: float = 0.0
var _album_giro_tw: Tween = null


var _album_pista_n: int = 0




var _album_pista_txt: String = ""
var _album_calla: bool = false

var _banda_arriba: ColorRect = null
var _banda_abajo: ColorRect = null

const ALBUM_MINI: Vector2i = Vector2i(320, 220)

const ALBUM_PISTA_S: float = 3.0










var con_mini: bool = false
var _mini: GoalReplay = null











var _festejo_callado: bool = false






func open(clip: ReplayRec.Clip, world: Node3D, hide_while: Array = [],
		stadium: Stadium = null) -> void:
	if clip == null or clip.samples() < 2:
		queue_free()
		return
	_clip = clip
	_compute_anchor()


	_cam_i = CAM_LIVE if clip.has_cam() else CAM_TV
	layer = 90
	process_mode = Node.PROCESS_MODE_ALWAYS



	add_to_group(Entrada.CAPA_GROUP)



	set_meta(Entrada.STICK_PROPIO_META, true)




	_atras_al_modo()
	Entrada.modo_cambiado.connect(_atras_al_modo.unbind(1))


	Entrada.mando_perdido.connect(_on_mando_perdido)
	_root = Node3D.new()
	_root.process_mode = Node.PROCESS_MODE_ALWAYS
	world.add_child(_root)
	_build_ghosts()
	_build_ring()
	_build_camera(world)








	for n in hide_while:
		if is_instance_valid(n) and "visible" in n and n.visible:
			n.visible = false
			_hidden.append(n)
	_build_ui()
	_apply_cam_setup(true)
	_drive(0.0)






	_stadium = stadium
	if _stadium != null and is_instance_valid(_stadium):
		_stadium.view_clip_reset()









		_stadium.weather_under_pause(true, SPEEDS[_speed_i])
	_antes_del_gol()
	get_tree().paused = true





func _build_ghosts() -> void:
	for i in _clip.recipes.size():
		var r: Dictionary = _clip.recipes[i]
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.process_mode = Node.PROCESS_MODE_ALWAYS
		s.sprite_frames = r.get("frames")
		s.pixel_size = float(r.get("pixel_size", 0.01))
		s.modulate = r.get("modulate", Color.WHITE)
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
		s.visible = false
		_root.add_child(s)
		_ghosts.append(s)
		_lams.append(_build_lams(r))
		var cara: Sprite3D = null
		if r.has("cara_rutas"):
			cara = Sprite3D.new()
			cara.process_mode = Node.PROCESS_MODE_ALWAYS
			cara.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			cara.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			cara.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			cara.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			cara.visible = false
			_root.add_child(cara)
		_caras.append(cara)
		_caras_cfg.append(var_to_str(r.get("cara_cfg", {})))






func _build_lams(r: Dictionary) -> Dictionary:
	var fila: Dictionary = {}
	for k in [["lam_esc", "esc"], ["lam_pat", "pat"], ["lam_fab", "fab"], ["lam_cmp", "cmp"]]:
		var tex: Texture2D = r.get(k[0]) as Texture2D
		if tex == null:
			continue
		var n: Sprite3D = Pecho.nodo(tex)
		n.process_mode = Node.PROCESS_MODE_ALWAYS
		_root.add_child(n)
		fila[k[1]] = n


	var par_tex: Texture2D = r.get("lam_par") as Texture2D
	if par_tex != null:
		var par: Sprite3D = Pecho.nodo(par_tex)
		par.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		par.process_mode = Node.PROCESS_MODE_ALWAYS
		_root.add_child(par)
		fila["par"] = par
	var esp_tex: Texture2D = r.get("lam_esp") as Texture2D
	if esp_tex != null:
		var esp: Sprite3D = Espalda.nodo(esp_tex)
		esp.process_mode = Node.PROCESS_MODE_ALWAYS
		_root.add_child(esp)
		fila["esp"] = esp
	var shn_tex: Texture2D = r.get("lam_shn") as Texture2D
	if shn_tex != null:
		var shn: Sprite3D = ShortNum.nodo(shn_tex)
		shn.process_mode = Node.PROCESS_MODE_ALWAYS
		_root.add_child(shn)
		fila["shn"] = shn



	if r.get("lam_cap") is Color:
		var cap: Sprite3D = CintaCapitan.nodo()
		cap.process_mode = Node.PROCESS_MODE_ALWAYS
		cap.set_meta("banda", r["lam_cap"])
		_root.add_child(cap)
		fila["cap"] = cap
	return fila




static func fov_tumbado(fov_retrato: float, k: float) -> float:
	return rad_to_deg(2.0 * atan(tan(deg_to_rad(fov_retrato) * 0.5) * k))



func _lente(fov_retrato: float) -> float:
	return fov_retrato if _fov_k == 1.0 else fov_tumbado(fov_retrato, _fov_k)





func _lente_sintetica() -> float:
	return SYNTH_FOV




func _mide_lente() -> void:
	_fov_k = 1.0
	if UiKit.es_horizontal() and is_inside_tree() and not lente_retrato:
		_fov_k = SceneFade.rect_visible(self).size.y / ALTO_RETRATO


func _build_camera(world: Node3D) -> void:
	_prev_cam = SceneFade.camara_de(world)
	_mide_lente()
	_cam = Camera3D.new()
	_cam.process_mode = Node.PROCESS_MODE_ALWAYS
	_cam.fov = _lente_sintetica()


	_cam.far = 260.0
	_root.add_child(_cam)
	_cam.current = true












func _notification(what: int) -> void:
	if what == NOTIFICATION_PREDELETE:
		_suelta_mini()





func _suelta_mini() -> void:
	if _mini == null:
		return
	var r: GoalReplay = _mini
	_mini = null
	if not is_instance_valid(r):
		return
	if r.get_parent() != null:
		r.get_parent().remove_child(r)
	r.free()


func _exit_tree() -> void:







	if _mini != null and is_instance_valid(_mini):
		var r: GoalReplay = _mini
		_mini = null
		if not r.is_queued_for_deletion():
			r.queue_free()



	if _stadium != null and is_instance_valid(_stadium):
		_stadium.weather_under_pause(false)



	for n in _hidden:
		if is_instance_valid(n):
			n.visible = true
	_hidden.clear()
	if is_instance_valid(_prev_cam):
		_prev_cam.current = true


	if _festejo_callado and _stadium != null and is_instance_valid(_stadium):
		_festejo_callado = false
		_stadium.confetti_cannons_replay_goal()
	if is_instance_valid(_root):
		_root.queue_free()
	if is_inside_tree():
		get_tree().paused = false


func close() -> void:
	closed.emit()
	queue_free()









func atras() -> bool:
	if not Entrada.hay_mando():
		return false
	if _exporting or _pidiendo_permiso:
		return true
	if not is_queued_for_deletion():
		close()
	return true







func _on_mando_perdido() -> void:
	if _playing and is_instance_valid(_play_btn) and not _exporting:
		_on_play()


func _process(delta: float) -> void:
	if _clip == null:
		return



	if Entrada.hay_mando() and not _exporting and not _pidiendo_permiso:
		_pad_tick(delta)
	if _playing:


		if _mini != null:
			_paso_mini(delta)
			return
		_t += delta * SPEEDS[_speed_i]
		if _t > _clip.length():
			_t = 0.0
			if _abre_mini():
				return





	if _stadium != null and is_instance_valid(_stadium):
		_stadium.tick_crowd_manual(delta)






	if _exporting:
		return
	_drive(delta)
	_sync_bar()






func _abre_mini() -> bool:
	if not con_mini or _clip.mini.is_empty() or not is_instance_valid(_root):
		return false
	var m: Dictionary = _clip.mini
	var r: GoalReplay = GoalReplay.new()
	r.sin_reloj = true
	get_parent().add_child(r)
	if not r.start_goal(_clip, _root.get_parent(), [_root], m["cruce"], _stadium,
			m["vuelo"], m["red"], m["tubo"], m["punch"], m["bar"],
			String(m.get("sub", ""))):
		return false
	r.visible = false
	_presta_capa(r)
	_mini = r
	_sync_bar()
	return true






func _presta_capa(r: ReplayView) -> void:
	r._atras_prestada = true
	r._atras_al_modo()




func _atras_al_modo() -> void:
	var quiere: bool = Entrada.hay_mando() and not _atras_prestada
	if quiere and not is_in_group(CareerUi.ATRAS_CAPA_GROUP):
		add_to_group(CareerUi.ATRAS_CAPA_GROUP)
	elif not quiere and is_in_group(CareerUi.ATRAS_CAPA_GROUP):
		remove_from_group(CareerUi.ATRAS_CAPA_GROUP)




func _paso_mini(delta: float) -> void:

	if is_instance_valid(_mini) and _mini.avanza(delta):
		return
	_corta_mini()
	_t = 0.0
	_drive(0.0)
	_sync_bar()






func _corta_mini() -> void:
	if _mini == null:
		return
	_suelta_mini()
	if not is_inside_tree() or is_queued_for_deletion():
		return
	if is_instance_valid(_cam):
		_cam.current = true
	get_tree().paused = true
	if _stadium != null and is_instance_valid(_stadium):
		_stadium.weather_under_pause(true, SPEEDS[_speed_i])


	_antes_del_gol()










func _antes_del_gol() -> void:
	if not con_mini or _stadium == null or not is_instance_valid(_stadium):
		return
	_stadium.confetti_cannons_replay_begin()
	_festejo_callado = true
	if _clip != null and _clip.mini.has("cruce"):
		_stadium.net_impact(_clip.mini["cruce"], true, 1.0, 0.0, 0.02)



func _drive(delta: float) -> void:
	_move_cam(pose_ghosts(_t), delta)








func pose_ghosts(t: float) -> Vector3:
	var ball: Vector3 = Vector3.ZERO
	for i in _ghosts.size():
		var g: AnimatedSprite3D = _ghosts[i]
		var p: Dictionary = _clip.pose(i, t)
		g.position = p["pos"]
		g.visible = p["visible"]
		g.flip_h = p["flip"]
		var anim: StringName = p["anim"]
		if g.sprite_frames != null and g.sprite_frames.has_animation(anim):
			if g.animation != anim:
				g.animation = anim
			g.frame = mini(int(p["frame"]),
				maxi(g.sprite_frames.get_frame_count(anim) - 1, 0))
		_pose_lams(i, g)
		if i == 0:
			ball = p["pos"]
	_pose_ring(t)
	if _caras_en_base():
		pose_caras(t)
	return ball





func _caras_en_base() -> bool:
	return true






func pose_caras(t: float) -> void:
	for i in mini(_caras.size(), _ghosts.size()):
		var cara: Sprite3D = _caras[i]
		if cara == null:
			continue
		var g: AnimatedSprite3D = _ghosts[i]
		var estado: String = String(_clip.pose(i, t).get("cara", ""))
		var rutas: Array = _clip.recipes[i]["cara_rutas"].get(String(g.animation), [])
		if not g.visible or estado.is_empty() or g.frame >= rutas.size():
			cara.visible = false
			continue
		var ruta: String = String(rutas[g.frame])




		if _caras_sin_prisa() or CaraEncima.listo(ruta, _caras_cfg[i], estado) \
				or CaraEncima.gasta(CARAS_NUEVAS_POR_FOTOGRAMA):
			cara.texture = CaraEncima.parche(ruta, _clip.recipes[i].get("cara_cfg", {}),
				estado, _caras_cfg[i])
			cara.visible = cara.texture != null
			cara.set_meta("ruta", ruta)
		elif String(cara.get_meta("ruta", "")) != ruta:
			cara.visible = false
		cara.pixel_size = g.pixel_size
		cara.offset = g.offset
		cara.centered = g.centered
		cara.flip_h = g.flip_h
		cara.modulate = g.modulate
		var cam: Camera3D = lam_cam if is_instance_valid(lam_cam) else _cam
		var hacia: Vector3 = Vector3.ZERO
		if is_instance_valid(cam):
			var v: Vector3 = cam.global_position - g.global_position
			v.y = 0.0
			if v.length_squared() > 0.0001:
				hacia = v.normalized() * CaraEncima.HACIA_M
		cara.position = g.position + hacia
	if not _caras_sin_prisa():
		_precalienta_caras(t)



func _caras_sin_prisa() -> bool:
	return caras_sin_tope or _exporting






func _precalienta_caras(t: float) -> void:
	if not CaraEncima.queda(CARAS_NUEVAS_POR_FOTOGRAMA):
		return
	_caras_rueda =(_caras_rueda + 1) % CARAS_ANTICIPO_S.size()
	var tf: float = t + CARAS_ANTICIPO_S[_caras_rueda]
	if tf > _clip.length():
		return
	for i in mini(_caras.size(), _ghosts.size()):
		if _caras[i] == null:
			continue
		var p: Dictionary = _clip.pose(i, tf)
		var estado: String = String(p.get("cara", ""))
		if estado.is_empty() or not bool(p["visible"]):
			continue
		var sf: SpriteFrames = _ghosts[i].sprite_frames
		if sf == null:
			continue
		var anim: StringName = _anim_prevista(i, p["anim"], tf)
		if not sf.has_animation(anim):
			anim = p["anim"]
			if not sf.has_animation(anim):
				continue
		var f: int = mini(int(p["frame"]), maxi(sf.get_frame_count(anim) - 1, 0))
		var rutas: Array = _clip.recipes[i]["cara_rutas"].get(String(anim), [])
		if f >= rutas.size() or CaraEncima.listo(String(rutas[f]), _caras_cfg[i], estado):
			continue
		if CaraEncima.gasta(CARAS_NUEVAS_POR_FOTOGRAMA):
			CaraEncima.parche(String(rutas[f]), _clip.recipes[i].get("cara_cfg", {}), estado,
				_caras_cfg[i])
		return




func _anim_prevista(_i: int, anim: StringName, _t: float) -> StringName:
	return anim






func _build_ring() -> void:
	if ring_mat_src == null or not _clip.has_ring():
		return
	_ring = MeshInstance3D.new()
	_ring.process_mode = Node.PROCESS_MODE_ALWAYS
	_ring.mesh = QuadMesh.new()
	_ring.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	var mat: ShaderMaterial = ring_mat_src.duplicate() as ShaderMaterial
	mat.set_shader_parameter("carga", 1.0)
	_ring.material_override = mat
	_ring.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_ring.visible = false
	_root.add_child(_ring)
	_ring_label = MeshInstance3D.new()
	_ring_label.mesh = QuadMesh.new()
	_ring_label_mat = StandardMaterial3D.new()
	_ring_label_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_ring_label_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	_ring_label_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	_ring_label_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_ring_label.material_override = _ring_label_mat
	_ring_label.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_ring_label.position = Vector3(0.0, 0.02, 0.0)
	_ring_label.visible = false
	_ring.add_child(_ring_label)




func _pose_ring(t: float) -> void:
	if _ring == null:
		return
	var r: Dictionary = _clip.ring_pose(t)
	var lado: float = float(r["lado"])
	_ring.visible = Settings.repe_aro and lado > 0.0
	if not _ring.visible:
		return
	_ring.position = r["pos"]


	if absf(lado - _ring_lado) > lado * 0.002:
		_ring_lado = lado
		(_ring.mesh as QuadMesh).size = Vector2(lado, lado)
		(_ring_label.mesh as QuadMesh).size = Vector2(lado, lado)


	var word: String = String(r["word"])
	if word != _ring_word:
		_ring_word = word
		var partes: PackedStringArray = word.split("|")
		if partes.size() == 2 and ring_label_tex.is_valid():
			_ring_label_mat.albedo_texture = ring_label_tex.call(partes[0],
				Color.from_string(partes[1], Color.WHITE))
		else:
			_ring_label_mat.albedo_texture = null
	_ring_label.visible = _ring_label_mat.albedo_texture != null




func _on_ring_toggle() -> void:
	Settings.set_repe_aro(not Settings.repe_aro)
	_pose_ring(_t)
	if _ring_btn != null:
		_ring_btn.modulate.a = 1.0 if Settings.repe_aro else 0.45
		_ring_btn.queue_redraw()




func _draw_ring_icon(b: Button) -> void:
	var c: Vector2 = b.size * 0.5
	var r: float = minf(b.size.x, b.size.y) * 0.26
	b.draw_arc(c, r, 0.0, TAU, 40, UiKit.GOLD, 6.0)
	if not Settings.repe_aro:
		var d: Vector2 = Vector2(r, - r) * 1.15
		b.draw_line(c - d, c + d, UiKit.GOLD, 6.0)








func _pose_lams(i: int, g: AnimatedSprite3D) -> void:
	if i >= _lams.size():
		return
	var fila: Dictionary = _lams[i]
	if fila.is_empty():
		return
	var cam: Camera3D = lam_cam if is_instance_valid(lam_cam) else _cam





	var base: String = PechoRig.base_de(g)
	var r: Dictionary = Pecho.rects_base(base) if not base.is_empty() \
			else Pecho.rects(g.animation, g.frame)
	for k in [["esc", "esc"], ["pat", "pat"], ["fab", "fab"], ["cmp", "cmp"]]:
		var n: Sprite3D = SceneFade.vivo(fila.get(k[0])) as Sprite3D
		if is_instance_valid(n):
			Pecho.seguir(n, g, r.get(k[1], Rect2()), g.pixel_size, cam,
				Pecho.PAT_CRECE if k[0] == "pat" else 1.0)


	var par: Sprite3D = SceneFade.vivo(fila.get("par")) as Sprite3D
	if is_instance_valid(par):
		Pecho.seguir(par, g, KitRecolor.parche_rect(base, par.texture), g.pixel_size, cam)
	var cap: Sprite3D = SceneFade.vivo(fila.get("cap")) as Sprite3D
	if is_instance_valid(cap):
		CintaCapitan.seguir(cap, g, cap.get_meta("banda"), cam)
	var esp: Sprite3D = SceneFade.vivo(fila.get("esp")) as Sprite3D
	if is_instance_valid(esp):







		var caja: Rect2 = Espalda.caja_fichero(base) if not base.is_empty() \
				else Espalda.caja(g.animation, g.frame)
		var cx: float = Espalda.centro_fichero(base) if not base.is_empty() \
				else Espalda.centro(g.animation, g.frame)
		var gir: float = Espalda.giro_fichero(base) if not base.is_empty() \
				else Espalda.giro(g.animation, g.frame)
		Espalda.seguir(esp, g, caja, g.pixel_size, cam, cx, gir)
	var shn: Sprite3D = SceneFade.vivo(fila.get("shn")) as Sprite3D
	if is_instance_valid(shn):

		var caja_s: Rect2 = ShortNum.caja_fichero(base) if not base.is_empty() \
				else ShortNum.caja(g.animation, g.frame)
		ShortNum.seguir(shn, g, caja_s, g.pixel_size, cam)











func frame_cam_at(t: float, cam: Camera3D) -> void:






	lam_cam = cam
	_frame_cam_at(t, cam)
	for i in _ghosts.size():
		_pose_lams(i, _ghosts[i])


func _frame_cam_at(t: float, cam: Camera3D) -> void:



	if _cam_i == CAM_LIVE and _clip.has_cam():
		var cp: Dictionary = _clip.cam_pose(t)
		cam.global_transform = Transform3D(Basis(cp["quat"]), cp["pos"])
		cam.fov = cp["fov"]
		return




	var libre: bool = _cam_i == CAM_FREE
	var giro: float = _free_yaw if libre else _off_yaw







	if _cam_i == CAM_ORBIT:
		giro += ORBIT_SPEED * t / SPEEDS[_speed_i]
	var yaw: float = _fixed_yaw + giro
	var pitch: float = _free_pitch if libre else _pitch
	var off: Vector3 = Vector3(
		sin(yaw) * cos(pitch), sin(pitch), cos(yaw) * cos(pitch)) * _dist
	var pos: Vector3 = _anchor_look + off
	pos.y = maxf(pos.y, CAM_MIN_Y)
	cam.position = pos
	cam.look_at(_anchor_look)





	cam.fov = SYNTH_FOV



func _look_for(ball: Vector3) -> Vector3:
	var mouth: Vector3 = Vector3(0.0, 1.2, 0.0)
	return ball.lerp(mouth, LOOK_BIAS_GOAL) + Vector3(0.0, LOOK_UP, 0.0)





func _axis_yaw(ball: Vector3) -> float:
	var axis: Vector2 = Vector2(ball.x, ball.z)
	return atan2(axis.x, axis.y) if axis.length() > 0.5 else 0.0












func _compute_anchor() -> void:
	var goal_ball: Vector3 = _clip.pose(0, _clip.length())["pos"]
	_anchor_look = _look_for(goal_ball)
	_fixed_yaw = _pick_axis_yaw()




func _pick_axis_yaw() -> float:
	var n: int = _clip.samples()
	for s in range(n - 1, -1, -1):
		var t: float = _clip.length() * float(s) / maxf(float(n - 1), 1.0)
		var p: Vector3 = _clip.pose(0, t)["pos"]
		if Vector2(p.x, p.z).length() > 3.0:
			return _axis_yaw(p)
	return _axis_yaw(_clip.pose(0, _clip.length() * 0.5)["pos"])


func _move_cam(_ball: Vector3, delta: float) -> void:


	if _cam_i == CAM_LIVE and _clip.has_cam():
		var cp: Dictionary = _clip.cam_pose(_t)
		_cam.global_transform = Transform3D(Basis(cp["quat"]), cp["pos"])
		_cam.fov = cp["fov"]
		return



	_look = _anchor_look
	_look_set = true
	if _cam_i == CAM_ORBIT:

		_off_yaw = wrapf(_off_yaw + ORBIT_SPEED * delta, - PI, PI)
	elif _cam_i == CAM_FREE:



		var kf: float = 1.0 - exp(- GIRO_SUAVE * delta)
		_off_yaw +=(_free_yaw - _off_yaw) * kf
		_pitch +=(_free_pitch - _pitch) * kf
		var envuelto: float = wrapf(_off_yaw, - PI, PI)
		_free_yaw += envuelto - _off_yaw
		_off_yaw = envuelto
	else:


		var s: Array = CAM_SETUP[_cam_i]
		var k: float = clampf(4.0 * delta, 0.0, 1.0)
		_off_yaw = lerp_angle(_off_yaw, float(s[0]), k)
		_pitch = lerpf(_pitch, float(s[1]), k)
		_dist = lerpf(_dist, float(s[2]), k)
	_yaw = _fixed_yaw + _off_yaw
	var off: Vector3 = Vector3(
		sin(_yaw) * cos(_pitch), sin(_pitch), cos(_yaw) * cos(_pitch)) * _dist
	var pos: Vector3 = _look + off
	pos.y = maxf(pos.y, CAM_MIN_Y)
	_cam.position = pos
	_cam.look_at(_look)




func _apply_cam_setup(_first: bool) -> void:
	if _cam_i >= CAM_SETUP.size():
		return
	var s: Array = CAM_SETUP[_cam_i]
	_off_yaw = float(s[0])
	_pitch = float(s[1])
	_dist = float(s[2])






func _seed_from_cam() -> void:
	_look = _anchor_look
	_look_set = true
	var rel: Vector3 = _cam.global_position - _look
	_dist = clampf(rel.length(), 4.0, 40.0)
	_pitch = clampf(asin(rel.y / maxf(_dist, 0.01)), 0.05, 1.05)
	_off_yaw = wrapf(atan2(rel.x, rel.z) - _fixed_yaw, - PI, PI)
	_cam.fov = _lente_sintetica()






func _on_speed(dir: int = 1) -> void:
	_speed_i = wrapi(_speed_i + dir, 0, SPEEDS.size())
	_speed_btn.text = SPEED_LABELS[_speed_i]


	if _stadium != null and is_instance_valid(_stadium):
		_stadium.weather_under_pause(true, SPEEDS[_speed_i])
















func _texto_ayuda() -> String:
	return Entrada.texto_f("ARRASTRA PARA GIRAR LA CÁMARA",
		"STICK DERECHO: CÁMARA · {0}/{1}: BUSCAR · {2}/{3}: RITMO", [],
		[Entrada.boton("fl_mantener"), Entrada.boton("fl_objetivo"),
		Entrada.boton("lt"), Entrada.boton("rt")])


func _on_cam() -> void:



	var leaving_live: bool = _cam_i == CAM_LIVE
	_cam_i =(_cam_i + 1) %(CAM_SETUP.size() +(1 if _clip.has_cam() else 0))
	_cam_btn.text = _rotulo_cam(_cam_i)
	if leaving_live:



		_seed_from_cam()




func _rotulo_cam(i: int) -> String:
	return I18n.t(CAM_LABELS[i], CAM_CTX)


func _on_play() -> void:
	_playing = not _playing
	_play_btn.text = "II" if _playing else "▶"





func _entra_libre() -> void:
	if _cam_i == CAM_LIVE:


		_seed_from_cam()
	if _cam_i != CAM_FREE:
		_cam_i = CAM_FREE
		_cam_btn.text = _rotulo_cam(CAM_FREE)
		_free_yaw = _off_yaw
		_free_pitch = _pitch











func _pad_tick(delta: float) -> void:
	var e: Vector2 = Entrada.eje(false)
	if e.length() > STICK_ZM and _mini == null:
		_entra_libre()
		_free_yaw -= e.x * GIRO_STICK * delta
		_free_pitch = clampf(_free_pitch + e.y * ALZA_STICK * delta, 0.05, 1.05)
	var dir: int = int(Input.is_action_pressed("fl_objetivo")) \
			- int(Input.is_action_pressed("fl_mantener"))
	if dir != 0:
		if dir != _busca_dir:
			_busca(_t + float(dir) * BUSCA_PASO_S)
		else:
			_busca(_t + float(dir) * BUSCA_S * delta)
	_busca_dir = dir


	var g: int = Entrada.gatillo_flanco(_gatillos)
	if g != 0 and is_instance_valid(_speed_btn):
		_on_speed(g)




func _busca(t: float) -> void:
	_corta_mini()
	_t = clampf(t, 0.0, _clip.length())
	_playing = false
	if is_instance_valid(_play_btn):
		_play_btn.text = "▶"
	_drive(0.0)
	_sync_bar()



func _unhandled_input(ev: InputEvent) -> void:
	if _exporting:
		return



	if ev.device == InputEvent.DEVICE_ID_EMULATION:
		return
	if ev is InputEventScreenTouch or ev is InputEventMouseButton:
		if ev is InputEventMouseButton and ev.button_index != MOUSE_BUTTON_LEFT:
			return
		var idx: int = ev.index if ev is InputEventScreenTouch else 0
		if ev.pressed:


			if _drag_idx == -1 or _drag_idx == idx:
				_drag_idx = idx
				_drag = true
				_drag_live = false
				_drag_from = ev.position
			get_viewport().set_input_as_handled()
		elif idx == _drag_idx:
			_drag_idx = -1
			_drag = false
			_drag_live = false
	elif _drag and (ev is InputEventScreenDrag or ev is InputEventMouseMotion):
		var idx: int = ev.index if ev is InputEventScreenDrag else 0
		if idx != _drag_idx:
			return
		var d: Vector2 = ev.position - _drag_from
		if not _drag_live:
			if d.length() < DRAG_SLOP_PX:
				return
			_drag_live = true
			_entra_libre()
		_drag_from = ev.position



		var ancho: float = maxf(SceneFade.rect_visible(self).size.x, 1.0)
		_free_yaw -= d.x * GIRO_POR_ANCHO / ancho
		_free_pitch = clampf(_free_pitch + d.y * ALZA_POR_ANCHO / ancho, 0.05, 1.05)
		get_viewport().set_input_as_handled()






















func _on_save() -> void:
	if _exporting or _pidiendo_permiso:
		return
	_pidiendo_permiso = true
	var permiso: bool = await VideoSink.pide_permiso()
	_pidiendo_permiso = false
	if not permiso:
		_avisa_sin_permiso()
		return
	_exporta(false)





func _avisa_sin_permiso() -> void:
	var aviso: String = I18n.t("Da permiso a Fotos para guardar el video")
	if is_instance_valid(_hint) and _hint.text != aviso:
		_hint_antes_aviso = _hint.text
	_pinta_fin_guardar(false, aviso)
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_interval(3.0)
	tw.tween_callback(func() -> void:
		if not _exporting and is_instance_valid(_hint) and _hint.text == aviso:
			_repone_hint(_hint_antes_aviso))







func _on_share() -> void:
	if _exporting:
		return
	Telemetry.count("repe_compartir")
	_exporta(true)




func _exporta(compartir: bool) -> void:
	if _exporting:
		return
	_corta_mini()
	_exporting = true
	_playing = false
	_play_btn.text = "▶"
	_set_controls(false)


	_drag_idx = -1
	_drag = false
	_drag_live = false
	var t_antes: float = _t


	var ex: ReplayExport = ReplayExport.new()
	add_child(ex)


	ex.ghost_poser = func(t: float) -> void: pose_ghosts(t)
	ex.cam_placer = func(t: float, c: Camera3D) -> void: frame_cam_at(t, c)
	_presta_mini(ex)
	ex.compartir = compartir


	ex.velocidad = SPEEDS[_speed_i]
	var hint_antes: String = _hint.text if is_instance_valid(_hint) else ""
	ex.progress.connect(func(f: float) -> void: _pinta_progreso(compartir, f))
	ex.finished.connect(func(ok: bool, msg: String) -> void:
		_exporting = false
		_set_controls(true)
		if compartir:
			_share_icon.visible = true
			_share_pct.visible = false


			if msg.is_empty():
				_repone_hint(hint_antes)
			else:
				_pinta_hint(msg, true)
		else:
			_pinta_fin_guardar(ok, msg)


			if ok and _hint_del_album(hint_antes):
				_repone_hint(hint_antes)






		lam_cam = null
		_t = t_antes
		_drive(0.0)
		ex.queue_free()


		var tw: Tween = create_tween()
		tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tw.set_ignore_time_scale(true)
		tw.tween_interval(3.0)
		tw.tween_callback(func() -> void:
			if is_instance_valid(_save_btn) and not _exporting:
				_save_btn.text = I18n.t("GUARDAR")
			if (compartir or not ok) and not _exporting:
				_repone_hint(hint_antes)))
	ex.export_clip(_clip, _root)





func _hint_del_album(antes: String) -> bool:
	return _album_calla or (_album == Album.GUARDANDO and album_pide.is_valid()) \
			or (not _album_pista_txt.is_empty() and antes == _album_pista_txt)






func _repone_hint(antes: String) -> void:
	if not _hint_del_album(antes):
		_pinta_hint(antes, false)
		return
	var dice: bool = _album_calla or _album == Album.GUARDANDO
	_album_calla = false
	_pinta_hint(_texto_ayuda(), false)
	if dice and album_pide.is_valid():
		_album_pista_estado()






func _pinta_progreso(compartir: bool, f: float) -> void:
	var pct: String = "%d%%" % int(round(f * 100.0))
	if not compartir:
		_save_btn.text = pct
		return
	_share_icon.visible = false
	_share_pct.text = pct
	_share_pct.visible = true



	if f >= 0.999:
		_pinta_hint(I18n.t("ENLACE COPIADO: PEGALO EN TU POST"), true)






func _pinta_fin_guardar(ok: bool, msg: String) -> void:
	if ok:
		_save_btn.text = I18n.t("GUARDADO")
		return
	_save_btn.text = I18n.t("GUARDAR")
	_pinta_hint(msg, true)





func _pinta_hint(texto: String, aviso: bool) -> void:
	if not is_instance_valid(_hint):
		return


	_hint.text = texto if aviso else Entrada.repintado(texto)
	_hint.add_theme_color_override("font_color",
		UiKit.GOLD if aviso else Color(1, 1, 1, 0.38))

















func _presta_mini(ex: ReplayExport) -> void:
	if _clip.mini.is_empty() or not is_instance_valid(_root):
		return
	var m: Dictionary = _clip.mini
	var caja: Array = [null]
	ex.cola_cuadros = int(ceil((GoalReplay.GOAL_DUR[0] + GoalReplay.GOAL_DUR[1])
		* float(ReplayExport.OUT_FPS)))
	ex.cola_abre = func() -> bool:
		var r: GoalReplay = GoalReplay.new()
		r.sin_reloj = true
		r.caras_sin_tope = true
		r.lente_retrato = true
		get_parent().add_child(r)

		if not r.start_goal(_clip, _root.get_parent(), [_root], m["cruce"], _stadium,
				m["vuelo"], m["red"], m["tubo"], m["punch"], m["bar"],
				String(m.get("sub", ""))):
			return false
		r.visible = false
		_presta_capa(r)
		caja[0] = r
		return true
	ex.cola_paso = func(dt: float, c: Camera3D) -> bool:
		var r: GoalReplay = caja[0]
		if not is_instance_valid(r) or not r.avanza(dt):
			return false
		c.global_transform = r._cam.global_transform
		c.fov = r._cam.fov
		c.far = r._cam.far
		return true
	ex.cola_cierra = func() -> void:
		var r: GoalReplay = caja[0]
		caja[0] = null
		if is_instance_valid(r):
			r.get_parent().remove_child(r)
			r.free()
		get_tree().paused = true
		if _stadium != null and is_instance_valid(_stadium):
			_stadium.weather_under_pause(true, SPEEDS[_speed_i])

		_antes_del_gol()










func _on_album() -> void:
	if _exporting or not album_pide.is_valid():
		return
	match _album:
		Album.GUARDANDO:
			return
		Album.GUARDADO:
			_album_pista_estado()
			return
		Album.LLENO:
			if ReplayAlbum.cuantas() >= ReplayAlbum.MAX_POR_RANURA:
				_album_pista_estado()
				return
	_album_pon(Album.GUARDANDO)
	_album_pista_estado()


	if DisplayServer.get_name() == "headless":
		_album_tras_dibujo.call_deferred()
	elif not RenderingServer.frame_post_draw.is_connected(_album_tras_dibujo):
		RenderingServer.frame_post_draw.connect(_album_tras_dibujo, CONNECT_ONE_SHOT)


func _album_tras_dibujo() -> void:
	if _album != Album.GUARDANDO or not album_pide.is_valid():
		return
	var foto: Image = _album_miniatura()
	_album_vuela(foto)
	album_pide.call(foto)




func album_fin(id: String, err: String) -> void:
	if not id.is_empty():
		_album_pon(Album.GUARDADO)
	elif err == "LLENO":
		_album_pon(Album.LLENO)
	elif err == "SIN_ESPACIO":
		_album_pon(Album.SIN_ESPACIO)
	else:


		_album_pon(Album.FALLO)
	_album_pista_estado()





func _album_pon(e: Album) -> void:
	_album = e
	if not is_instance_valid(_album_btn):
		return
	var relleno: Color = CareerTheme.NAV_YO.darkened(0.28)
	var labio: Color = CareerTheme.NAV_YO.darkened(0.62)
	if e == Album.FALLO:
		relleno = CareerTheme.DANGER.darkened(0.6)
		labio = CareerTheme.DANGER.darkened(0.45)
	elif e == Album.LLENO or e == Album.SIN_ESPACIO:
		relleno = UiKit.BTN_GRAY_LO["bg"]
		labio = CareerTheme.DANGER.darkened(0.45)
	UiKit.style_button(_album_btn, {"bg": relleno, "border": labio,
		"pressed": relleno.darkened(0.18)})
	_album_btn.set_meta("album_labio", labio)
	var icono: String = "gol"
	match e:
		Album.GUARDADO:
			icono = "check"
		Album.LLENO:
			icono = "candado"
		Album.FALLO:
			icono = "reiniciar"
	_album_icon.set_type(icono)

	if is_instance_valid(_album_giro_tw):
		_album_giro_tw.kill()
		_album_giro_tw = null
	if e == Album.GUARDANDO:
		var gira: Callable = func(a: float) -> void:
			_album_giro = a
			if is_instance_valid(_album_deco):
				_album_deco.queue_redraw()
		_album_giro_tw = create_tween().set_loops()
		_album_giro_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		_album_giro_tw.set_ignore_time_scale(true)
		_album_giro_tw.tween_method(gira, 0.0, TAU, 0.9)
	_album_deco.queue_redraw()




func _album_dibuja() -> void:
	var d: Control = _album_deco
	var s: Vector2 = d.size
	var malo: bool = _album == Album.LLENO or _album == Album.SIN_ESPACIO \
			or _album == Album.FALLO
	var filo: StyleBoxFlat = StyleBoxFlat.new()
	filo.draw_center = false
	filo.border_color = CareerTheme.DANGER if malo else CareerTheme.NAV_YO
	filo.set_border_width_all(3)
	filo.set_corner_radius_all(UiKit.BTN_RADIUS)
	d.draw_style_box(filo, Rect2(Vector2.ZERO, s))
	var labio: Color = _album_btn.get_meta("album_labio", CareerTheme.NAV_YO.darkened(0.62))
	var lado: float = 26.0
	var p: Vector2 = Vector2(s.x - 9.0 - lado, 8.0)
	match _album:
		Album.LISTO:

			d.draw_rect(Rect2(p + Vector2(0.0, 3.0), Vector2(lado, lado)), labio)
			d.draw_rect(Rect2(p, Vector2(lado, lado)), CareerTheme.INK_LIGHT)
			d.draw_rect(Rect2(p + Vector2(10.5, 5.0), Vector2(5.0, 16.0)), labio)
			d.draw_rect(Rect2(p + Vector2(5.0, 10.5), Vector2(16.0, 5.0)), labio)
		Album.SIN_ESPACIO:
			d.draw_rect(Rect2(p, Vector2(lado, lado)), CareerTheme.DANGER)
			d.draw_rect(Rect2(p + Vector2(11.0, 5.0), Vector2(4.0, 11.0)), CareerTheme.INK_LIGHT)
			d.draw_rect(Rect2(p + Vector2(11.0, 18.0), Vector2(4.0, 4.0)), CareerTheme.INK_LIGHT)
		Album.GUARDANDO:
			var c: Vector2 = Vector2(s.x * 0.5, s.y * 0.44)
			var r: float = s.y * 0.375
			d.draw_arc(c, r, 0.0, TAU, 48, UiKit.INK_TICK, 5.0)
			var a0: float = _album_giro - PI * 0.5
			d.draw_arc(c, r, a0, a0 + TAU * 0.65, 40, CareerTheme.INK_LIGHT, 5.0)





func _album_pista_estado() -> void:
	var tope: int = ReplayAlbum.MAX_POR_RANURA
	var rojo: Color = CareerTheme.DANGER.lerp(UiKit.INK, 0.3)
	match _album:
		Album.GUARDANDO:
			_album_pista(I18n.t("GUARDANDO EN TU ALBUM..."), UiKit.INK_BODY, true)
		Album.GUARDADO:
			_album_pista(I18n.t("EN TU ALBUM · %d/%d") % [mini(ReplayAlbum.cuantas(), tope), tope],
				CareerTheme.NAV_YO.lerp(UiKit.INK, 0.4), false)
		Album.LLENO:
			_album_pista(I18n.t("ALBUM LLENO %d/%d · BORRA UNO EN COLECCION")
				% [ReplayAlbum.cuantas(), tope], rojo, false)
		Album.SIN_ESPACIO:
			_album_pista(I18n.t("SIN ESPACIO EN EL TELEFONO"), rojo, false)
		Album.FALLO:
			_album_pista(I18n.t("NO SE PUDO GUARDAR · TOCA PARA REINTENTAR"), rojo, false)


func _album_pista(texto: String, col: Color, queda: bool) -> void:
	if _exporting:
		_album_calla = true
		return
	if not is_instance_valid(_hint):
		return
	_album_pista_n += 1
	var n: int = _album_pista_n
	_album_pista_txt = texto
	_hint.text = texto
	_hint.add_theme_color_override("font_color", col)
	if queda:
		return
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_interval(ALBUM_PISTA_S)
	tw.tween_callback(func() -> void:
		if n == _album_pista_n and not _exporting and is_instance_valid(_hint) \
				and _hint.text == texto:
			_pinta_hint(_texto_ayuda(), false))





func _album_miniatura() -> Image:
	if DisplayServer.get_name() == "headless":
		return null
	var tex: ViewportTexture = get_viewport().get_texture()
	var img: Image = tex.get_image() if tex != null else null
	if img == null or img.is_empty():
		return null
	var vis: Rect2 = get_viewport().get_visible_rect()
	var k: float = float(img.get_height()) / maxf(vis.size.y, 1.0)
	var franja: Vector2 = _album_franja()
	return recorte_miniatura(img, Rect2(0.0, franja.x * k, float(img.get_width()),
		(franja.y - franja.x) * k))



func _album_franja() -> Vector2:
	var alto: float = get_viewport().get_visible_rect().size.y
	var y0: float = _banda_arriba.get_global_rect().end.y if is_instance_valid(_banda_arriba) \
			else 0.0
	var y1: float = _banda_abajo.get_global_rect().position.y if is_instance_valid(_banda_abajo) \
			else alto
	return Vector2(y0, maxf(y1, y0 + 1.0))




static func recorte_miniatura(img: Image, zona: Rect2) -> Image:
	var asp: float = float(ALBUM_MINI.x) / float(ALBUM_MINI.y)
	var w: float = zona.size.x
	var h: float = zona.size.y
	if w / maxf(h, 1.0) > asp:
		w = h * asp
	else:
		h = w / asp
	var r: Rect2i = Rect2i(int(zona.position.x +(zona.size.x - w) * 0.5),
		int(zona.position.y +(zona.size.y - h) * 0.5), int(w), int(h))
	r = r.intersection(Rect2i(Vector2i.ZERO, img.get_size()))
	if r.size.x < 2 or r.size.y < 2:
		return null
	var out: Image = img.get_region(r)
	out.convert(Image.FORMAT_RGB8)
	out.resize(ALBUM_MINI.x, ALBUM_MINI.y, Image.INTERPOLATE_LANCZOS)
	return out





func _album_vuela(img: Image) -> void:
	if img == null or not is_instance_valid(_album_btn):
		return
	var marco: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.INK_LIGHT
	sb.set_corner_radius_all(6)
	sb.set_content_margin_all(4.0)
	sb.shadow_color = Color(CareerTheme.INK_DARK, 0.45)
	sb.shadow_offset = Vector2(0.0, 10.0)
	marco.add_theme_stylebox_override("panel", sb)
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var foto: TextureRect = TextureRect.new()
	foto.texture = ImageTexture.create_from_image(img)
	foto.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	foto.stretch_mode = TextureRect.STRETCH_SCALE
	foto.custom_minimum_size = Vector2(ALBUM_MINI) * 0.75
	foto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(foto)
	add_child(marco)
	var tam: Vector2 = Vector2(ALBUM_MINI) * 0.75 + Vector2(8.0, 8.0)
	marco.size = tam
	marco.pivot_offset = tam * 0.5
	var franja: Vector2 = _album_franja()
	var ancho: float = get_viewport().get_visible_rect().size.x
	marco.position = Vector2(ancho * 0.5,(franja.x + franja.y) * 0.5) - tam * 0.5
	var destino: Vector2 = _album_btn.get_global_rect().get_center() - tam * 0.5
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.set_parallel(true)
	tw.tween_property(marco, "position", destino, 0.55) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	tw.tween_property(marco, "scale", Vector2(0.2, 0.2), 0.55) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	tw.tween_property(marco, "rotation", deg_to_rad(-7.0), 0.3)
	tw.tween_property(marco, "modulate:a", 0.0, 0.15).set_delay(0.45)
	tw.chain().tween_callback(marco.queue_free)



func _set_controls(on: bool) -> void:
	for b in [_play_btn, _speed_btn, _cam_btn]:
		if is_instance_valid(b):
			b.disabled = not on
	if is_instance_valid(_bar_rail):
		_bar_rail.mouse_filter = Control.MOUSE_FILTER_STOP if on \
				else Control.MOUSE_FILTER_IGNORE
	if is_instance_valid(_save_btn):
		_save_btn.disabled = not on
	if is_instance_valid(_share_btn):
		_share_btn.disabled = not on



	if is_instance_valid(_album_btn):
		_album_btn.disabled = not on


func _on_bar_input(ev: InputEvent) -> void:
	if (ev is InputEventScreenTouch and ev.pressed) \
			or (ev is InputEventMouseButton and ev.pressed) \
			or ev is InputEventScreenDrag \
			or (ev is InputEventMouseMotion and _drag):
		var f: float = clampf(ev.position.x / maxf(_bar_rail.size.x, 1.0), 0.0, 1.0)
		_corta_mini()
		_t = f * _clip.length()
		_playing = false
		_play_btn.text = "▶"
		_drive(0.0)
		_sync_bar()


func _sync_bar() -> void:

	var f: float = 1.0 if _mini != null else _t / maxf(_clip.length(), 0.001)
	_bar_fill.size.x = _bar_rail.size.x * clampf(f, 0.0, 1.0)







func _build_ui() -> void:
	var lado: float = UiKit.side_safe_inset(get_viewport())



	var h: bool = UiKit.es_horizontal()
	if h:
		_bandas_h = Vector2(BANDA_H_ARRIBA, BANDA_H_ABAJO)
	var top: ColorRect = _bar(true)
	add_child(top)
	var bottom: ColorRect = _bar(false)
	add_child(bottom)
	_banda_arriba = top
	_banda_abajo = bottom

	_title = Label.new()
	_title.text = I18n.t("LA REPETICION")
	UiKit.style_title(_title, 34, UiKit.GOLD)
	_title.set_anchors_preset(Control.PRESET_TOP_WIDE)
	_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_title.offset_top =(26.0 if h else 40.0) + UiKit.top_safe_inset(get_viewport())
	_title.offset_bottom = _title.offset_top + 44.0
	_title.offset_left = lado + 270.0
	_title.offset_right = - lado - 270.0
	_title.clip_text = true
	_title.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_title)

	if not _clip.label.is_empty():
		var sub: Label = Label.new()
		sub.text = _clip.label
		sub.add_theme_font_size_override("font_size", 22)
		sub.add_theme_color_override("font_color", Color(1, 1, 1, 0.72))
		sub.set_anchors_preset(Control.PRESET_TOP_WIDE)
		sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		sub.offset_top = _title.offset_bottom + 4.0
		sub.offset_bottom = sub.offset_top + 30.0
		sub.offset_left = lado + 270.0
		sub.offset_right = - lado - 270.0
		sub.clip_text = true
		sub.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(sub)



	var close_btn: Button = Button.new()
	close_btn.text = "✕"
	UiKit.apply_button(close_btn, UiKit.BTN_GRAY, 34)
	close_btn.set_anchors_preset(Control.PRESET_TOP_RIGHT)
	close_btn.offset_left = -134.0 - lado
	close_btn.offset_right = -30.0 - lado
	close_btn.offset_top =(16.0 if h else 30.0) + UiKit.top_safe_inset(get_viewport())
	close_btn.offset_bottom = close_btn.offset_top + 96.0
	close_btn.pressed.connect(close)
	add_child(close_btn)






	if VideoSink.puede_compartir():
		_share_btn = _mando("", _on_share, 104.0)
		_share_btn.set_anchors_preset(Control.PRESET_TOP_LEFT)
		_share_btn.offset_left = 30.0 + lado
		_share_btn.offset_right = 134.0 + lado
		_share_btn.offset_top = close_btn.offset_top
		_share_btn.offset_bottom = close_btn.offset_bottom
		_share_icon = MenuIcon.new()
		_share_icon.setup("compartir", UiKit.GOLD)
		_share_icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_share_icon.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		_share_icon.offset_left = 16.0
		_share_icon.offset_right = -16.0
		_share_icon.offset_top = 12.0
		_share_icon.offset_bottom = -12.0
		_share_btn.add_child(_share_icon)
		_share_pct = Label.new()
		_share_pct.visible = false
		_share_pct.add_theme_font_size_override("font_size", MANDO_FS)
		_share_pct.add_theme_color_override("font_color", UiKit.GOLD)
		_share_pct.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		_share_pct.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_share_pct.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		_share_pct.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_share_btn.add_child(_share_pct)
		add_child(_share_btn)



	if album_pide.is_valid():
		_album_btn = _mando("", _on_album, 104.0)
		_album_btn.set_anchors_preset(Control.PRESET_TOP_LEFT)
		_album_btn.offset_left =(_share_btn.offset_left + 120.0) if is_instance_valid(_share_btn) \
				else 30.0 + lado
		_album_btn.offset_right = _album_btn.offset_left + 104.0
		_album_btn.offset_top = close_btn.offset_top
		_album_btn.offset_bottom = close_btn.offset_bottom
		_album_icon = MenuIcon.new()
		_album_icon.setup("gol", CareerTheme.INK_LIGHT)
		_album_icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_album_icon.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

		_album_icon.offset_left = 25.0
		_album_icon.offset_right = -25.0
		_album_icon.offset_top = 15.0
		_album_icon.offset_bottom = -27.0
		_album_btn.add_child(_album_icon)
		_album_deco = Control.new()
		_album_deco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_album_deco.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		_album_deco.draw.connect(_album_dibuja)
		_album_btn.add_child(_album_deco)
		add_child(_album_btn)
		_album_pon(album_nace)



	if _ring != null:
		_ring_btn = _mando("", _on_ring_toggle, 104.0)
		_ring_btn.set_anchors_preset(Control.PRESET_TOP_RIGHT)
		_ring_btn.offset_left = close_btn.offset_left - 120.0
		_ring_btn.offset_right = close_btn.offset_left - 16.0
		_ring_btn.offset_top = close_btn.offset_top
		_ring_btn.offset_bottom = close_btn.offset_bottom
		_ring_btn.modulate.a = 1.0 if Settings.repe_aro else 0.45
		_ring_btn.draw.connect(_draw_ring_icon.bind(_ring_btn))
		add_child(_ring_btn)

	var bottom_inset: float = UiKit.bottom_safe_inset(get_viewport())



	_bar_rail = Control.new()
	_bar_rail.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	_bar_rail.offset_left = 60.0 + lado
	_bar_rail.offset_right = -60.0 - lado
	_bar_rail.offset_top = -(236.0 + bottom_inset)
	_bar_rail.offset_bottom = -(180.0 + bottom_inset)
	_bar_rail.gui_input.connect(_on_bar_input)
	add_child(_bar_rail)
	var rail_bg: ColorRect = ColorRect.new()
	rail_bg.color = Color(1, 1, 1, 0.16)
	rail_bg.set_anchors_preset(Control.PRESET_LEFT_WIDE)



	rail_bg.anchor_bottom = 0.0
	rail_bg.offset_top = 16.0
	rail_bg.offset_bottom = 24.0
	rail_bg.offset_right = 0.0
	rail_bg.anchor_right = 1.0
	rail_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bar_rail.add_child(rail_bg)
	_bar_fill = ColorRect.new()
	_bar_fill.color = UiKit.GOLD
	_bar_fill.position = Vector2(0.0, 16.0)
	_bar_fill.size = Vector2(0.0, 8.0)
	_bar_fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bar_rail.add_child(_bar_fill)

	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 18)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	row.offset_left = 30.0 + lado
	row.offset_right = -30.0 - lado
	row.offset_top = -(168.0 + bottom_inset)
	row.offset_bottom = -(72.0 + bottom_inset)
	add_child(row)

	_play_btn = _mando_fila("II", _on_play, W_PLAY)


	_play_btn.set_meta(Entrada.PRIMERO_META, true)
	row.add_child(_play_btn)
	_speed_btn = _mando_fila(SPEED_LABELS[_speed_i], _on_speed, W_SPEED)
	row.add_child(_speed_btn)
	_cam_btn = _mando_fila(_rotulo_cam(_cam_i), _on_cam, W_CAM)
	row.add_child(_cam_btn)





	if ReplayExport.available():
		_save_btn = _mando_fila(I18n.t("GUARDAR"), _on_save, W_SAVE)
		_save_btn.add_theme_color_override("font_color", UiKit.GOLD)
		row.add_child(_save_btn)





	if h:
		var ancho_fila: float = - float(row.get_theme_constant("separation"))
		for b in row.get_children():
			ancho_fila +=(b as Control).custom_minimum_size.x \
					+ float(row.get_theme_constant("separation"))
		row.alignment = BoxContainer.ALIGNMENT_BEGIN
		row.offset_top = -(146.0 + bottom_inset)
		row.offset_bottom = -(50.0 + bottom_inset)
		_bar_rail.offset_left = row.offset_left + ancho_fila + 36.0
		_bar_rail.offset_top = -(118.0 + bottom_inset)
		_bar_rail.offset_bottom = -(62.0 + bottom_inset)

	_hint = Label.new()


	_hint.text = _texto_ayuda()
	_hint.add_theme_font_size_override("font_size", 19)
	_hint.add_theme_color_override("font_color", Color(1, 1, 1, 0.38))
	_hint.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	_hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

	_hint.clip_text = true


	_hint.add_to_group(Entrada.VIVO_GROUP)
	_hint.offset_top = -((42.0 if h else 62.0) + bottom_inset)
	_hint.offset_bottom = -((10.0 if h else 30.0) + bottom_inset)
	_hint.offset_left = 30.0 + lado
	_hint.offset_right = -30.0 - lado
	_hint.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_hint)
	_cose_cruceta(close_btn)













func _cose_cruceta(close_btn: Button) -> void:
	if not is_instance_valid(close_btn) or not is_instance_valid(_play_btn):
		return
	var arriba: Array[Button] = []
	for b in [_share_btn, _album_btn, _ring_btn, close_btn]:
		if is_instance_valid(b):
			arriba.append(b)
	for b in [_play_btn, _speed_btn, _cam_btn, _save_btn]:
		if is_instance_valid(b):
			(b as Button).focus_neighbor_top =(b as Button).get_path_to(close_btn)
	for i in arriba.size():
		var b: Button = arriba[i]
		b.focus_neighbor_bottom = b.get_path_to(_play_btn)
		if i > 0:
			b.focus_neighbor_left = b.get_path_to(arriba[i - 1])
		if i < arriba.size() - 1:
			b.focus_neighbor_right = b.get_path_to(arriba[i + 1])


func _mando(txt: String, cb: Callable, w: float) -> Button:
	var b: Button = Button.new()
	b.text = txt
	UiKit.apply_button(b, UiKit.BTN_GRAY, 28)
	b.custom_minimum_size = Vector2(w, 96)
	b.pressed.connect(cb)
	return b






func _mando_fila(txt: String, cb: Callable, w: float) -> Button:
	var b: Button = _mando(txt, cb, w)
	b.add_theme_font_size_override("font_size", MANDO_FS)
	b.clip_text = true
	b.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	return b


func _bar(top: bool) -> ColorRect:
	var r: ColorRect = ColorRect.new()
	r.color = Color(0.0, 0.0, 0.0, 0.62)
	r.set_anchors_preset(Control.PRESET_TOP_WIDE if top else Control.PRESET_BOTTOM_WIDE)

	var alto_arriba: float = _bandas_h.x if _bandas_h.x > 0.0 else 150.0
	var alto_abajo: float = _bandas_h.y if _bandas_h.y > 0.0 else 268.0
	if top:
		r.offset_bottom = alto_arriba + UiKit.top_safe_inset(get_viewport())
	else:
		r.offset_top = -(alto_abajo + UiKit.bottom_safe_inset(get_viewport()))
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return r
