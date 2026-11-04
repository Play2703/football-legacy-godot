extends CelebracionActo

















































const T_TOTAL: float = 12.0
const BUS_X0: float = -9.0
const BUS_X1: float = 25.0




const XI: int = 11







const XI_CARAS: int = XI - 1










const FILA_DELANTE: int = 6
const FILA_Z: float = -0.42
const FILA_Z_ATRAS: float = 0.62































const KEYS: Array = [
	{"t": 0.0, "dist": 34.0, "h": 8.6, "yaw": 26.0, "aim_y": 5.4, "fov": 40.0},
	{"t": 3.2, "dist": 30.0, "h": 5.4, "yaw": 20.0, "aim_y": 6.1, "fov": 42.0},
	{"t": 7.0, "dist": 28.5, "h": 3.6, "yaw": 13.0, "aim_y": 6.6, "fov": 44.0},
	{"t": 10.2, "dist": 28.0, "h": 3.3, "yaw": 8.0, "aim_y": 6.8, "fov": 44.0},
]































const COPA_Z: float = -0.92
const PASAMANOS_Z_LLEVANDO: float = -0.8
const COPA_SUBIDO: float = 0.2
const COPA_PUNTA: float = 0.36
const T_ALZA_1: float = 0.5
const T_BAJA_1: float = 2.3
const BAJA_DUR: float = 0.25
const T_ANDA: float = 2.6
const T_LLEGA: float = 9.8
const T_ALZA_2: float = 9.95

var _llevada: CopaLlevada = null
var _rugido: bool = false

var _scape: ParadeScape
var _motor: AudioStreamPlayer
var _bombo: AudioStreamPlayer
var _next_claxon: float = 2.2
var _arrancado: bool = false


var _next_ola: float = 1.4


func _build() -> void:


	_prepara()
	_ambiente_calle()
	_recorrido()




	focus = Vector3(BUS_X0, 0.0, 0.0)
	make_camera(KEYS, 42.0)





	orbit_speed = 0.0

	_pasajeros()
	_copas()
	_rotular_bus()
	make_audio(1.0, true)





	_motor = _capa("engine_loop", -17.0)
	_bombo = _capa("parade_drum", -11.0)





	confetti_colors = [accent, Color.WHITE, CareerTheme.MONEY]



	confetti_count = CONFETTI_MAX

	chyron_at = 2.6


	card_at = 10.8 if _llevada != null else 9.6


	var sub_rotulo: String = str(team().get("name", "")) if _es_nacion \
			else str(data.get("div_name", Teams.div_name(div())))





	var hazana: bool = not _hazana.is_empty()
	make_chyron(I18n.t(_hazana) if hazana else I18n.t("CELEBRACIÓN DE TÍTULOS"),
		sub_rotulo.to_upper(), team())
	make_card()
	card_title(I18n.t(_hazana) if hazana else I18n.t("LA CIUDAD ES VUESTRA"), 40)
	card_sub(String(team().get("name", "")).to_upper())




	card_count(_trofeos.size(), I18n.t("TÍTULOS SOBRE EL AUTOBÚS"))
	_lista_titulos()
	card_note(_nota())
	card_cta(I18n.t("SEGUIR"))






func _recorrido() -> void:
	_scape = ParadeScape.new()
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
	_scape.bus.position = Vector3(BUS_X0, 0.0, 0.0)














func _pasajeros() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var L: float = _scape.largo_bus


	var util: float = L * 0.86
	var caras: Array[SpriteFrames] = squad_frames_pool(kit, XI_CARAS,
		String(team().get("id", "")), "south", true)

	var gestos: Array[String] = []
	for k in caras.size():
		gestos.append(festejo_hornea(caras[k], k) if plantel_festeja() else "")


	var tu_slot: int = FILA_DELANTE / 2
	var puestos: Array[Vector3] = []
	for i in XI:
		var atras: bool = i >= FILA_DELANTE
		var n_fila: int =(XI - FILA_DELANTE) if atras else FILA_DELANTE
		var idx: int =(i - FILA_DELANTE) if atras else i

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
		spr.position = Vector3(at.x,
			_scape.deck_y + feet_offset(spr.pixel_size) - PLAYER_SINK, at.z)
		spr.play("idle")

		spr.speed_scale = rng.randf_range(0.8, 1.3)
		_scape.bus.add_child(spr)


		festejo_play(spr, gesto)



	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	make_player(look)


	viewport.remove_child(player)
	_scape.bus.add_child(player)
	var tuyo: Vector3 = puestos[tu_slot]
	player.position = Vector3(tuyo.x,
		_scape.deck_y + feet_offset(player.pixel_size) - PLAYER_SINK, tuyo.z)









func _copas() -> void:
	if _trofeos.is_empty():
		return


	var en_pasamanos: Array[String] = _trofeos.duplicate()
	var cfg0: Dictionary = Ceremonies.TROPHIES.get(_trofeos[0], {})
	_llevada = CopaLlevada.monta(self, player, str(cfg0.get("icon", "liga")))
	if _llevada != null:
		en_pasamanos.remove_at(0)
		player.position = Vector3(_copa_x(0.0), player.position.y + COPA_SUBIDO, COPA_Z)







	var L: float = _scape.largo_bus



	var alto: float = 1.35
	var n: int = en_pasamanos.size()
	var paso: float = minf(1.45,(L * 0.62) / float(maxi(n, 1)))
	for i in n:
		var cfg: Dictionary = Ceremonies.TROPHIES.get(en_pasamanos[i], {})
		var icono: String = str(cfg.get("icon", "liga"))


		var y: float = _scape.deck_y + _scape.alto_panel + alto * 0.5 - 0.1


		var x: float =(float(i) - float(n - 1) * 0.5) * paso
		var z: float = PASAMANOS_Z_LLEVANDO if _llevada != null else FILA_Z - 0.55
		make_trophy(icono, Vector3(x, y, z),
			alto, 320, _scape.bus, true)












func _rotular_bus() -> void:
	var L: float = _scape.largo_bus
	var W: float = float(ParadeScape.DIV_BUS.get(div(), ParadeScape.DIV_BUS[3])["ancho"])
	var nombre: String = Competitions.demarca(String(team().get("name", ""))).to_upper()






	var y_rotulo: float = 0.98
	if not nombre.is_empty():
		var tex: ImageTexture = _texto_tex(nombre)
		for s in [-1.0, 1.0]:
			var r: Sprite3D = Sprite3D.new()
			r.texture = tex
			var ancho_m: float = L * 0.4
			r.pixel_size = ancho_m / float(maxi(tex.get_width(), 1))
			r.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			r.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			r.position = Vector3(0.0, y_rotulo,(W * 0.5 + 0.04) * s)
			r.rotation_degrees = Vector3(0.0, 180.0 if s < 0.0 else 0.0, 0.0)
			_scape.bus.add_child(r)




	var n: int = _trofeos.size()
	var paso: float = 0.82
	for i in n:
		var cfg: Dictionary = Ceremonies.TROPHIES.get(_trofeos[i], {})
		var tex: Texture2D = _icono_tex(str(cfg.get("icon", "liga")))
		if tex == null:
			continue
		var x: float =(float(i) - float(n - 1) * 0.5) * paso
		for s in [-1.0, 1.0]:
			var st: Sprite3D = Sprite3D.new()
			st.texture = tex
			st.pixel_size = 0.5 / float(maxi(tex.get_height(), 1))
			st.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			st.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			st.modulate = Color("ffd54a")
			st.position = Vector3(x, y_rotulo + 0.62,(W * 0.5 + 0.05) * s)
			st.rotation_degrees = Vector3(0.0, 180.0 if s < 0.0 else 0.0, 0.0)
			_scape.bus.add_child(st)





func _texto_tex(texto: String) -> ImageTexture:
	var px: int = 3
	var w: int = maxi(PixelText.text_width(texto, px) + 8, 8)
	var h: int = 7 * px + 8
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))

	PixelText.draw_text(img, 5, 5, texto, Color(0.05, 0.05, 0.07, 0.7), px)
	PixelText.draw_text(img, 4, 4, texto, accent, px)
	return ImageTexture.create_from_image(img)





func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["claxon"])





func _nota() -> String:


	if not _hazana.is_empty():
		return I18n.t("Esto ya no es una temporada: es la historia del club.")
	if _trofeos.size() >= 3:
		return I18n.t("Hay años que se cuentan por títulos. Éste no cabe en una vitrina.")
	if _trofeos.size() == 2:
		return I18n.t("Dos en la misma temporada. La ciudad no se lo va a callar.")
	return I18n.t("Un año entero cabe en esta calle, y toda esta gente vino a verlo.")


func _tick(delta: float) -> void:
	if not _arrancado and t > 0.35:
		_arrancado = true
		sting("fanfare", -4.0)
		if not _quieto:
			set_confetti(true)



	var k: float = clampf(t / T_TOTAL, 0.0, 1.0)
	var x: float = lerpf(BUS_X0, BUS_X1, smoothstep(0.0, 1.0, k))
	if _scape != null and is_instance_valid(_scape.bus):
		_scape.bus.position.x = x
		if not _quieto:
			_scape.tick(t)




	focus.x = x
	_copa_tick()
	if ficha_puesta:
		return



	if t >= _next_claxon:
		_next_claxon = t + lerpf(3.6, 2.0, _fervor) + rng.randf_range(-0.3, 0.5)
		sting("claxon", rng.randf_range(-9.0, -6.0))



	if t >= _next_ola:
		_next_ola = t + lerpf(4.2, 2.4, _fervor)
		ovation(-3.0)
		if not _quieto:
			punch_fov(1.2, 0.5)



func _copa_x(k: float) -> float:
	var punta: float = _scape.largo_bus * COPA_PUNTA
	return lerpf(punta, - punta, k)





func _copa_tick() -> void:
	if _llevada == null or player == null:
		return
	var k: float = clampf((t - T_ANDA) /(T_LLEGA - T_ANDA), 0.0, 1.0)
	player.position.x = _copa_x(k)
	var alza_dur: float = float(CopaLlevada._const().get("ALZA_DUR", 0.45))
	if t >= T_ALZA_2:
		_llevada.alza((t - T_ALZA_2) / alza_dur)

		if not _rugido and not ficha_puesta:
			_rugido = true
			ovation(-1.0)
			if not _quieto:
				punch_fov(1.6, 0.6)
	elif t >= T_ANDA and k < 1.0:
		_llevada.lleva(Vector3.LEFT)
	elif t >= T_BAJA_1:
		_llevada.baja((t - T_BAJA_1) / BAJA_DUR)
	elif t >= T_ALZA_1:
		_llevada.alza((t - T_ALZA_1) / alza_dur)
	else:
		_llevada.lleva(Vector3.ZERO)





func _skipped() -> void:
	if _scape != null and is_instance_valid(_scape.bus):
		_scape.bus.position.x = BUS_X1
	focus.x = BUS_X1
	if not _quieto:
		set_confetti(true)
