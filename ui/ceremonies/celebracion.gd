class_name CelebracionActo
extends Ceremony





























const TROFEOS_MAX: int = 8





const FERVOR_LLENO: int = 4

var _trofeos: Array[String] = []
var _fervor: float = 0.0
var _es_nacion: bool = false
var _quieto: bool = false
var _hazana: String = ""





func _prepara() -> void:
	_trofeos = _titulos()




	_es_nacion = not str(data.get("nation", "")).is_empty()







	if _es_nacion and not _trofeos.is_empty():
		var rank: int = int(Ceremonies.TROPHIES.get(_trofeos[0], {}).get("rank", 75))
		_fervor = clampf(float(rank) / 100.0, 0.7, 1.0)
	else:
		_fervor = clampf(float(_trofeos.size()) / float(FERVOR_LLENO), 0.0, 1.0)
	_quieto = Settings != null and Settings.reduce_motion








	_hazana = "" if _es_nacion else str(data.get("hazana", ""))









func _titulos() -> Array[String]:
	var out: Array[String] = []
	for a in data.get("awards", []):
		var s: String = str(a)
		if Ceremonies.TROPHIES.has(s):
			out.append(s)
	out.sort_custom(func(x: String, y: String) -> bool:
		return int(Ceremonies.TROPHIES[x].get("rank", 0)) \
				> int(Ceremonies.TROPHIES[y].get("rank", 0)))
	if out.size() > TROFEOS_MAX:
		out.resize(TROFEOS_MAX)
	return out





func _seed_id() -> String:
	return str(data.get("nation", data.get("club", "")))





func _capa(id: String, db: float) -> AudioStreamPlayer:
	var stream: AudioStream = AudioBank.stream(id)
	if stream == null:
		return null
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.stream = stream
	p.volume_db = db
	p.bus = "SFX"
	add_child(p)
	p.play()
	return p






func _icono_tex(tipo: String) -> Texture2D:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(128, 128)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var icon: TrophyIcon = TrophyIcon.new()
	icon.set_anchors_preset(Control.PRESET_FULL_RECT)
	icon.custom_minimum_size = Vector2(128, 128)
	icon.set_type(tipo)
	vp.add_child(icon)


	return vp.get_texture()














func _lista_titulos() -> void:
	if _trofeos.is_empty():
		return
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 6)
	flow.alignment = FlowContainer.ALIGNMENT_CENTER
	for a in _trofeos:
		var chip: PanelContainer = CareerUi.chip()
		var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, text_accent())



		l.text = CareerTheme.caps(Competitions.t_demarca(String(a)))
		chip.add_child(l)
		flow.add_child(chip)
	card_box.add_child(flow)


	CareerUi.normalize_caps(flow)

























func _ambiente_calle(sun_yaw: float = 38.0) -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("e8a05c").lerp(Color("2b3a58"), 0.45)
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("c6c0cf")



	e.ambient_light_energy = 1.05


	e.fog_enabled = true
	e.fog_light_color = Color("c9a882").lerp(Color("8090a8"), 0.5)
	e.fog_density = 0.006
	viewport.add_child(env)
	env.environment = e




	var sun: DirectionalLight3D = DirectionalLight3D.new()
	sun.light_color = Color("ffd9a8")
	sun.light_energy = 1.15
	sun.shadow_enabled = false
	sun.rotation_degrees = Vector3(-22.0, sun_yaw, 0.0)
	viewport.add_child(sun)
