extends CelebracionActo







































const XI: int = 11
const XI_CARAS: int = XI - 1







const FILA_DELANTE: int = 7
const UTIL: float = 0.68
const FILA_Z: float = 0.46
const FILA_Z_ATRAS: float = 1.06











const KEYS: Array = [
	{"t": 0.0, "dist": 24.0, "h": 1.95, "yaw": -8.0, "aim_y": 3.4, "fov": 50.0},
	{"t": 3.4, "dist": 22.0, "h": 3.1, "yaw": -6.0, "aim_y": 4.6, "fov": 42.0},
	{"t": 7.2, "dist": 19.0, "h": 4.2, "yaw": -4.0, "aim_y": 5.55, "fov": 33.0},
	{"t": 10.4, "dist": 17.5, "h": 4.7, "yaw": -2.0, "aim_y": 6.05, "fov": 29.0},
]


























const COPA_PUERTA_Z: float = 1.15
const COPA_TARIMA_H: float = 0.35
const COPA_TARIMA_W: float = 0.95
const T_SALE: float = 1.6
const T_LLEGA: float = 3.0
const T_ALZA: float = 3.4


const ATRAS_HUECOS: Array[float] = [-2.5, -1.5, 1.5, 2.5]

var _llevada: CopaLlevada = null
var _con_copa: bool = false

var _scape: ParadeScape
var _bombo: AudioStreamPlayer
var _arrancado: bool = false


var _next_ola: float = 1.2


func _build() -> void:


	_prepara()



	_ambiente_calle(208.0)
	_plaza()


	focus = Vector3(0.0, 0.0, _scape.balcon_z)
	make_camera(KEYS, 42.0)




	orbit_speed = 0.0

	_asomados()
	_copas()





	scrim_dim(0.55)
	make_audio(1.0, true)


	_bombo = _capa("parade_drum", -11.0)







	confetti_colors = [accent, Color.WHITE, CareerTheme.MONEY]
	confetti_count = CONFETTI_MAX

	chyron_at = 2.6
	card_at = 9.6

	var sub_rotulo: String = team_name() if _es_nacion \
			else str(data.get("div_name", Teams.div_name(div())))


	make_chyron(I18n.t("RECIBIMIENTO EN EL PALACIO") if _es_nacion
		else I18n.t("RECIBIMIENTO EN EL AYUNTAMIENTO"), sub_rotulo.to_upper(), team())
	make_card()
	card_title(I18n.t("EL PAÍS ES VUESTRO") if _es_nacion
		else I18n.t("LA PLAZA ES VUESTRA"), 40)
	card_sub(team_name().to_upper())



	card_count(_trofeos.size(), I18n.t("TÍTULOS EN EL BALCÓN"))
	_lista_titulos()
	card_note(_nota())
	card_cta(I18n.t("SEGUIR"))






func _plaza() -> void:
	_scape = ParadeScape.new()
	_scape.modo = ParadeScape.MODO_BALCON
	_scape.div = div()
	_scape.fervor = _fervor
	_scape.club_a = accent
	_scape.club_b = Color.WHITE


	_scape.kit_gente = GameState.kit_variant(team(), 0)

	_scape.pais_gente = str(team().get("country", ""))




	_scape.seed_key = "desfile_%s" % _seed_id()
	_scape.crest = crest_texture(team(), 256, true)
	var pais: String = str(team().get("country", ""))
	if not pais.is_empty() and Flags.has(pais):
		_scape.flag = Flags.texture(pais)

	_scape.fuegos_on = not _quieto
	viewport.add_child(_scape)












func _asomados() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var util: float = _scape.balcon_ancho * UTIL
	var caras: Array[SpriteFrames] = squad_frames_pool(kit, XI_CARAS,
		String(team().get("id", "")), "south", true)

	var gestos: Array[String] = []
	for k in caras.size():
		gestos.append(festejo_hornea(caras[k], k) if plantel_festeja() else "")


	var tu_slot: int = FILA_DELANTE / 2


	_con_copa = not _trofeos.is_empty() and ResourceLoader.exists(
		"%s00.png" %(CopaEnManos.HOJA % ["anda", "south"]))
	var puestos: Array[Vector3] = []
	for i in XI:
		var atras: bool = i >= FILA_DELANTE
		var n_fila: int =(XI - FILA_DELANTE) if atras else FILA_DELANTE
		var idx: int =(i - FILA_DELANTE) if atras else i
		if atras and _con_copa and idx < ATRAS_HUECOS.size():
			puestos.append(Vector3(ATRAS_HUECOS[idx] * util / float(FILA_DELANTE),
				0.0, FILA_Z_ATRAS))
			continue


		var k: float =(float(idx) + 0.5 +(0.5 if atras else 0.0)) / float(n_fila)
		puestos.append(Vector3(util *(k - 0.5), 0.0,
			FILA_Z_ATRAS if atras else FILA_Z))
	var cara: int = 0
	for i in XI:
		if i == tu_slot or caras.is_empty():
			continue
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.sprite_frames = caras[cara % caras.size()]
		var gesto: String = gestos[cara % caras.size()]
		cara += 1
		spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var at: Vector3 = puestos[i]
		spr.position = Vector3(at.x, feet_offset(spr.pixel_size) - PLAYER_SINK, at.z)
		spr.play("idle")

		spr.speed_scale = rng.randf_range(0.8, 1.3)
		_scape.balcon.add_child(spr)


		festejo_play(spr, gesto)



	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	make_player(look)


	viewport.remove_child(player)
	_scape.balcon.add_child(player)
	var tuyo: Vector3 = puestos[tu_slot]
	player.position = Vector3(tuyo.x,
		feet_offset(player.pixel_size) - PLAYER_SINK, tuyo.z)
	if _con_copa:
		var cfg0: Dictionary = Ceremonies.TROPHIES.get(_trofeos[0], {})
		_llevada = CopaLlevada.monta(self, player, str(cfg0.get("icon", "liga")))
		_con_copa = _llevada != null
		if _con_copa:
			player.position.z = COPA_PUERTA_Z
			player.position.y += COPA_TARIMA_H
			_tarima()




func _tarima() -> void:
	var desde: float = FILA_Z - 0.25
	var hasta: float = COPA_PUERTA_Z + 0.12
	var caja: MeshInstance3D = MeshInstance3D.new()
	caja.name = "Tarima"
	var malla: BoxMesh = BoxMesh.new()
	malla.size = Vector3(COPA_TARIMA_W, COPA_TARIMA_H, hasta - desde)
	caja.mesh = malla
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = _scape.club_a.darkened(0.35)
	mat.roughness = 1.0
	caja.material_override = mat
	caja.position = Vector3(0.0, COPA_TARIMA_H * 0.5,(desde + hasta) * 0.5)
	_scape.balcon.add_child(caja)












func _copas() -> void:
	if _trofeos.is_empty():
		return






	var alto: float = 1.05
	var n: int = _trofeos.size()



	var paso: float =(_scape.balcon_ancho * UTIL) / float(FILA_DELANTE)



	var y: float =(_scape.baranda_y - ParadeScape.BALCON_Y) + alto * 0.5 - 0.1


	var desde: int = 1 if _con_copa else 0
	for i in range(desde, n):
		var cfg: Dictionary = Ceremonies.TROPHIES.get(_trofeos[i], {})
		var icono: String = str(cfg.get("icon", "liga"))

		var x: float = x_copa(i - desde, paso)
		make_trophy(icono, Vector3(x, y, 0.12), alto, 320, _scape.balcon, true)









static func x_copa(i: int, paso: float) -> float:
	var lado: float = 1.0 if i % 2 == 0 else -1.0
	return lado *(floorf(float(i) * 0.5) + 0.5) * paso






func _nota() -> String:

	if _es_nacion:
		return I18n.t("Un país entero bajo un balcón, y una sola copa que enseñarle.")
	if _trofeos.size() >= 3:
		return I18n.t("Tres títulos y un balcón. El año que nadie esperaba de vosotros.")
	if _trofeos.size() == 2:
		return I18n.t("Dos en la misma temporada. Abajo no cabe nadie más.")
	return I18n.t("No hizo falta cortar la avenida: vino la ciudad entera aquí.")


func _tick(delta: float) -> void:
	if not _arrancado and t > 0.35:
		_arrancado = true
		sting("fanfare", -4.0)
		if not _quieto:
			set_confetti(true)
	if _scape != null and not _quieto:
		_scape.tick(t)
	_copa_tick()
	if ficha_puesta:
		return



	if t >= _next_ola:
		_next_ola = t + lerpf(4.2, 2.4, _fervor)
		ovation(-3.0)
		if not _quieto:
			punch_fov(1.2, 0.5)




func _copa_tick() -> void:
	if _llevada == null or player == null:
		return
	var k: float = clampf((t - T_SALE) /(T_LLEGA - T_SALE), 0.0, 1.0)
	player.position.z = lerpf(COPA_PUERTA_Z, FILA_Z, k)
	if t >= T_ALZA:
		_llevada.alza((t - T_ALZA) / float(CopaLlevada._const().get("ALZA_DUR", 0.45)))
	elif t >= T_SALE and k < 1.0:

		_llevada.lleva(Vector3.FORWARD)
	else:
		_llevada.lleva(Vector3.ZERO)





func _skipped() -> void:
	if not _quieto:
		set_confetti(true)
