extends Ceremony


























































const T_REVEAL: float = 2.2
const LONA_SLIDE: float = 0.6
const LONA_FALL: float = 0.5
const T_SIGN_OPEN: float = 3.4
const T_SIGN_HOLD: float = 6.2
const T_ARC: float = 9.6
const T_CLOSE: float = 13.6
const D_LONA: float = 30.0
const D_SIGN: float = 44.0


const KEYS_SIN_ROTULO: Array = [
	{"t": 0.0, "dist": 40.0, "h": 8.0, "yaw": 150.0, "aim_y": 9.0, "fov": 46.0,
		"focus_x": 0.0, "focus_z": -14.0},
	{"t": 4.4, "dist": 18.0, "h": 4.4, "yaw": 163.0, "aim_y": 1.8, "fov": 38.0},
	{"t": 9.0, "dist": 9.2, "h": 2.1, "yaw": 178.0, "aim_y": 1.1, "fov": 35.0},
]






const ARC_R: float = 5.4






const ARC_HALF_DEG: float = 55.0






const ARC_GAP_DEG: float = 9.0



const ARC_MAX: int = 18
const PLINTH_SIZE: Vector3 = Vector3(0.5, 0.8, 0.42)
const TROPHY_H: float = 0.46

const TROPHY_SINK: float = 0.1




const DRIFT: float = -0.2
const T_CARD: float = 14.2




const T_BURST: float = T_REVEAL + 0.25
const T_BURST_2: float = T_ARC + 0.2


const T_CARD_CORTO: float = 9.6
const T_BURST_CORTO: float = 4.6


var _lona: MeshInstance3D = null
var _lona_mat: StandardMaterial3D = null
var _lona_h: float = 0.0
var _lona_base_y: float = 0.0
var _lona_x0: float = 0.0
var _burst2_puesta: bool = false
var _con_rotulo: bool = false




func _build() -> void:
	var club: Dictionary = team()
	var kit: Dictionary = GameState.kit_variant(club, 0)



	var sname: String = CareerTheme.caps(String(data.get("name", Career.player_name)))










	make_stadium({
		"div": div(),
		"attendance": 1.0,
		"party": true,
		"weather": "sunset",
		"kit": kit,
		"banner": sname,
		"board": sname,
		"home_club": club_del_acto(),
		"comp": "liga",
	})
	focus = Vector3(0.0, 0.0, CENTER_Z)
	var rotulo: MeshInstance3D = _rotulo_a_desvelar()
	_con_rotulo = rotulo != null
	if _con_rotulo:
		_ilumina(rotulo)
		_build_lona(rotulo)
		make_camera(_keys_for(rotulo))
	else:
		make_camera(KEYS_SIN_ROTULO)
	orbit_speed = DRIFT


	make_player(kit, "south", CLAP_SHEET)

	_build_arc(data.get("trophies", []))
	make_audio(1.0, true)
	stadium.crowd_excite(0.8)





	flash_pool = stand_flash_pool(CENTER_Z * 0.5 if _con_rotulo else CENTER_Z, 52.0)
	flash_rate = 7.0
	flash_burst_at = T_BURST if _con_rotulo else T_BURST_CORTO
	flash_burst_dur = 1.8
	set_confetti(true)



	make_chyron(I18n.t("EL ESTADIO LLEVA TU NOMBRE"),
		String(club.get("name", "?")).to_upper(), club,
		T_REVEAL + 0.7 if _con_rotulo else 0.8)
	make_card(T_CARD if _con_rotulo else T_CARD_CORTO)
	card_title(String(data.get("stadium", "")).to_upper(), 40)
	card_sub(I18n.t("ASÍ SE LLAMA DESDE HOY"))



	card_count(int(data.get("total", 0)), I18n.t("TÍTULOS CON ESTE CLUB"))
	var stats: Array = []
	if int(data.get("liga", 0)) > 0:
		stats.append({"v": str(int(data["liga"])), "k": I18n.t("ligas")})
	if int(data.get("copa", 0)) > 0:
		stats.append({"v": str(int(data["copa"])), "k": I18n.t("copas")})
	if int(data.get("cont", 0)) > 0:




		var pais: String = str(club.get("country", ""))
		if pais.is_empty():
			pais = Teams.country_of(String(club.get("id", "")))
		stats.append({"v": str(int(data["cont"])), "k": I18n.t("continentales")
			if Continental.tiene_copas(pais) else I18n.t("europas")})
	if int(data.get("ascensos", 0)) > 0:
		stats.append({"v": str(int(data["ascensos"])), "k": I18n.t("ascensos")})
	if not stats.is_empty():
		card_stats(stats)





	if String(data.get("reason", "")) == "hito":
		card_note(I18n.t("Este club no había ganado nada parecido en toda su historia."
			+ " Lo trajiste tú, y aquí no se va a olvidar."))
	else:
		card_note(I18n.t("Los que vengan detrás van a jugar en un sitio que se llama"
			+ " como tú. Eso ya no te lo quita nadie."))
	card_cta(I18n.t("SEGUIR"))






func _rotulo_a_desvelar() -> MeshInstance3D:
	if stadium == null:
		return null
	for n in stadium.find_children("NombreEstadio", "MeshInstance3D", true, false):
		var padre: Node3D = n.get_parent() as Node3D
		if padre != null and padre.position.z < 0.0 and n.mesh is QuadMesh:
			return n as MeshInstance3D
	for n in stadium.find_children("ApellidoMuro", "MeshInstance3D", true, false):
		if n.mesh is QuadMesh:
			return n as MeshInstance3D
	return null



func _cara(nodo: Node3D) -> Vector3:
	var padre: Node3D = nodo.get_parent() as Node3D
	var b: Basis = padre.global_transform.basis if padre != null else nodo.global_transform.basis
	var f: Vector3 = b.z
	f.y = 0.0
	return f.normalized() if f.length() > 0.001 else Vector3(0.0, 0.0, 1.0)







func _keys_for(rotulo: MeshInstance3D) -> Array:
	var c: Vector3 = rotulo.global_position
	var f: Vector3 = _cara(rotulo)
	var yaw: float = rad_to_deg(atan2(f.x, - f.z))


	var alto: bool = c.y > 5.0



	var h0: float = maxf(c.y * 0.45, 1.6) if alto else 1.7
	var h1: float = maxf(c.y * 0.4, 2.0) if alto else 2.2


	var d0: float = D_LONA if alto else 7.0
	var d1: float = D_SIGN if alto else 7.2


	var baja0: float = 6.5 if alto else 0.4
	var baja1: float = 5.0 if alto else 0.3
	if standalone:
		var q: QuadMesh = rotulo.mesh as QuadMesh
		print("  stadium_name: rótulo en %s, %.1f×%.1f m, cara %s" % [
			str(c), q.size.x, q.size.y, str(f)])
	return [



		{"t": 0.0, "dist": d0, "h": h0, "yaw": yaw + 24.0, "aim_y": c.y - baja0,
			"fov": 42.0 if alto else 60.0, "focus_x": c.x, "focus_z": c.z},
		{"t": T_SIGN_OPEN, "dist": d1, "h": h1, "yaw": yaw, "aim_y": c.y - baja1,
			"fov": 48.0 if alto else 64.0, "focus_x": c.x, "focus_z": c.z},
		{"t": T_SIGN_HOLD, "dist": d1 * 0.92, "h": h1, "yaw": yaw - 6.0,
			"aim_y": c.y - baja1 - 0.2, "fov": 46.0 if alto else 62.0,
			"focus_x": c.x, "focus_z": c.z},
		{"t": T_ARC, "dist": 18.0, "h": 4.4, "yaw": 163.0, "aim_y": 1.8, "fov": 38.0,
			"focus_x": 0.0, "focus_z": CENTER_Z},
		{"t": T_CLOSE, "dist": 9.2, "h": 2.1, "yaw": 178.0, "aim_y": 1.1, "fov": 35.0,
			"focus_x": 0.0, "focus_z": CENTER_Z},
	]






func _ilumina(rotulo: MeshInstance3D) -> void:
	var m: StandardMaterial3D = rotulo.material_override as StandardMaterial3D
	if m == null:
		return
	m = m.duplicate() as StandardMaterial3D
	m.emission_enabled = true
	m.emission = Color(0.93, 0.92, 0.88)
	m.emission_energy_multiplier = 0.9
	m.emission_texture = m.albedo_texture
	rotulo.material_override = m




func _build_lona(rotulo: MeshInstance3D) -> void:
	var q: QuadMesh = rotulo.mesh as QuadMesh


	var w: float = q.size.x + 1.2
	_lona_h = q.size.y + 1.6
	_lona = MeshInstance3D.new()
	var m: QuadMesh = QuadMesh.new()
	m.size = Vector2(w, _lona_h)
	_lona.mesh = m
	_lona_mat = StandardMaterial3D.new()






	var tela: Color = accent
	if tela.get_luminance() < 0.32:
		tela = tela.lerp(Color(0.92, 0.9, 0.86), 0.45)
	elif tela.get_luminance() > 0.7:


		tela = tela.lerp(Color(0.86, 0.72, 0.42), 0.55)
	_lona_mat.albedo_color = tela
	_lona_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_lona_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	_lona_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	_lona.material_override = _lona_mat
	_lona.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(_lona)
	_lona.global_transform = rotulo.global_transform
	_lona.global_position = rotulo.global_position + _cara(rotulo) * 0.08


	var ribete: MeshInstance3D = MeshInstance3D.new()
	var rq: QuadMesh = QuadMesh.new()
	rq.size = Vector2(w + 1.0, _lona_h + 1.0)
	ribete.mesh = rq
	var rm: StandardMaterial3D = StandardMaterial3D.new()
	rm.albedo_color = Color(0.08, 0.08, 0.1)
	rm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	rm.cull_mode = BaseMaterial3D.CULL_DISABLED
	ribete.material_override = rm
	ribete.position = Vector3(0.0, 0.0, -0.03)
	ribete.name = "Ribete"
	_lona.add_child(ribete)




	var escudo: MeshInstance3D = MeshInstance3D.new()
	var eq: QuadMesh = QuadMesh.new()
	var lado: float = _lona_h * 0.78
	eq.size = Vector2(lado, lado)
	escudo.mesh = eq
	var em: StandardMaterial3D = StandardMaterial3D.new()
	em.albedo_texture = crest_texture(team(), 256, true)
	em.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	em.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	em.cull_mode = BaseMaterial3D.CULL_DISABLED
	escudo.material_override = em
	escudo.position = Vector3(0.0, 0.0, 0.03)
	escudo.name = "Escudo"
	_lona.add_child(escudo)
	_lona_x0 = _lona.position.x
	_lona_base_y = _lona.position.y - _lona_h * 0.5


func _tick(_delta: float) -> void:
	if not _con_rotulo:
		return

	if not _burst2_puesta and t >= T_BURST + flash_burst_dur + 0.3:
		_burst2_puesta = true
		flash_burst_at = T_BURST_2
	if _lona == null or t < T_REVEAL:
		return
	var tau: float = t - T_REVEAL
	if tau == 0.0 or (tau < _delta * 1.5):

		screen_flash(0.12)
		shake(0.06, 0.35)
		if stadium != null:
			stadium.crowd_excite(1.0)
	if tau < LONA_SLIDE:


		var k: float = tau / LONA_SLIDE
		var e: float = k * k
		var sy: float = maxf(1.0 - e, 0.12)
		_lona.scale.y = sy
		_lona.position.y = _lona_base_y + _lona_h * sy * 0.5
		_lona.position.x = _lona_x0 + sin(k * 14.0) * 0.12 *(1.0 - k)
		return
	var tf: float = tau - LONA_SLIDE
	if tf < LONA_FALL:

		_lona.position.y = _lona_base_y + _lona_h * 0.06 - 4.9 * tf * tf
		_lona_mat.albedo_color.a = 1.0 - tf / LONA_FALL
		return
	_lona.queue_free()
	_lona = null



func _skipped() -> void:
	if _lona != null:
		_lona.queue_free()
		_lona = null








func _build_arc(kinds: Array) -> void:
	var n: int = mini(kinds.size(), ARC_MAX)
	if n <= 0:
		return








	var angs: Array[float] = []
	var right: int =(n + 1) / 2
	for k in right:
		angs.append(deg_to_rad(_arc_deg(k, right)))
	for k in n - right:
		angs.append(deg_to_rad(- _arc_deg(k, n - right)))



	var by_center: Array[int] = []
	for i in n:
		by_center.append(i)
	by_center.sort_custom(func(a: int, b: int) -> bool:
		return absf(angs[a]) < absf(angs[b]))
	for slot in n:
		var ang: float = angs[by_center[slot]]
		var px: float = focus.x + sin(ang) * ARC_R



		var pz: float = focus.z - cos(ang) * ARC_R
		_plinth(px, pz)
		make_trophy(String(kinds[slot]),
			Vector3(px, PLINTH_SIZE.y + TROPHY_H * 0.5 - TROPHY_SINK, pz),
			TROPHY_H)






func _arc_deg(k: int, count: int) -> float:
	if count <= 1:
		return ARC_GAP_DEG
	return lerpf(ARC_GAP_DEG, ARC_HALF_DEG, float(k) / float(count - 1))





func _plinth(px: float, pz: float) -> void:
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = PLINTH_SIZE
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.1, 0.11, 0.14)
	mat.roughness = 0.9
	box.material_override = mat
	box.position = Vector3(px, PLINTH_SIZE.y * 0.5, pz)
	viewport.add_child(box)
	var skirt: MeshInstance3D = MeshInstance3D.new()
	var sq: QuadMesh = QuadMesh.new()
	sq.size = Vector2(PLINTH_SIZE.x * 0.9, PLINTH_SIZE.y * 0.55)
	skirt.mesh = sq
	var smat: StandardMaterial3D = StandardMaterial3D.new()
	smat.albedo_color = accent
	smat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	skirt.material_override = smat
	skirt.position = Vector3(px, PLINTH_SIZE.y * 0.55,
		pz + PLINTH_SIZE.z * 0.5 + 0.01)
	viewport.add_child(skirt)
