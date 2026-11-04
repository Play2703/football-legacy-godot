extends Ceremony





































const ROW_X: float = -32.5




const ROW_Z0: float = Stadium.HALF_LINE + 2.2





const SLOTS: Array = [0.0, -1.1, 1.1, -2.2, 2.2]




const EN_CESPED: int = 5




const FROM_X: float = -37.3















const CARRIL: float = 0.3


const SALIDA_X: float = MOUTH_X + 1.3




const FUNDIDO: float = 0.25


const T_PRIMERO: float = 0.6
const ESCALON: float = 0.7




const VELOCIDAD: float = 1.5








const KEYS: Array = [



	{"t": 0.0, "dist": 12.0, "h": 2.0, "yaw": 56.0, "aim_y": 1.4, "fov": 46.0,
		"focus_x": -34.8, "focus_z": Stadium.HALF_LINE + 0.9},
	{"t": 3.0, "dist": 12.4, "h": 2.2, "yaw": 64.0, "aim_y": 1.4, "fov": 46.0,
		"focus_x": -34.2, "focus_z": Stadium.HALF_LINE + 1.2},



	{"t": 5.8, "dist": 15.5, "h": 2.2, "yaw": 94.0, "aim_y": 1.25, "fov": 40.0,
		"focus_x": ROW_X, "focus_z": ROW_Z0},
]


const DRIFT: float = -0.25

const T_CHYRON: float = 1.4


const T_CARD: float = 7.6




const KICKOFF: float = 0.0


const SCRIM: float = 0.55



const FICHA_FILAS: int = 5


const OVR_PX: int = CareerTheme.T_CAPTION
const CREST_PX: float = 34.0


const PRECIO_W: float = 160.0

const POS_W: float = 78.0

var _nuevos: Array[AnimatedSprite3D] = []


var _plan: Array[Dictionary] = []
var _aplauso: bool = false

var _con_tunel: bool = true
var _ovacion: bool = false



func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _llegadas() -> Array:
	var v: Variant = data.get("llegadas", [])
	return v if v is Array else []


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),

		"attendance": 1.0,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": "day",
		"kickoff": KICKOFF,
		"kit": kit,
		"board": board_fit(I18n.t("FICHAJES")),






		"venue_empty": true,
	})
	scrim_dim(SCRIM)
	focus = Vector3(-34.8, 0.0, Stadium.HALF_LINE + 0.9)
	make_camera(KEYS, 46.0)
	orbit_speed = DRIFT



	_con_tunel = div() < 3
	if _con_tunel:
		make_tunnel_mouth(CENTER_Z)



	_monta_nuevos()
	make_audio(1.0, false)


	make_chyron(I18n.t("PRETEMPORADA"), CareerTheme.caps(team_name("?")),
		team(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("FICHAJES DE VERANO"), CareerTheme.T_TITLE_MODAL)
	card_club(team())
	_filas_ficha()
	card_cta(I18n.t("SEGUIR"))





func _huecos(n: int) -> Array:
	var out: Array = []
	var suma: float = 0.0
	for i in n:
		suma += float(SLOTS[i])
	var medio: float = suma / maxf(float(n), 1.0)
	for i in n:
		out.append(float(SLOTS[i]) - medio)
	return out












func _monta_nuevos() -> void:
	var lista: Array = _llegadas()
	var n: int = mini(lista.size(), EN_CESPED)
	var huecos: Array = _huecos(n)
	var base_kit: Dictionary = GameState.team_custom.duplicate()
	base_kit.merge(GameState.kit_variant(team(), 0), true)
	var base: Dictionary = KitRecolor.team_only(base_kit)
	for i in n:
		var f: Dictionary = lista[i]
		var nm: String = String(f.get("name", ""))
		var tu: bool = bool(f.get("tu", false))
		var cfg: Dictionary
		if tu:


			cfg = base_kit.duplicate()
		else:

			var portero: bool = String(f.get("pos", "")) == "POR"
			cfg = KitRecolor.appearance_for(
				nm if not nm.is_empty() else "fichaje_%d" % i,
				_ropa_portero(base) if portero else base)





			if portero:
				cfg = KitRecolor.keeper_field_cfg(cfg)
		cfg["number"] = int(f.get("number", 0))


		if not nm.is_empty():
			cfg["apellido"] = Career.espalda_de(nm)
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.sprite_frames = player_frames(cfg, "south")
		spr.position = Vector3(FROM_X,
			feet_offset(spr.pixel_size) - PLAYER_SINK, CENTER_Z + float(huecos[i]) * CARRIL)
		spr.visible = false
		viewport.add_child(spr)
		add_walk(spr, cfg)
		spr.play("idle")
		_nuevos.append(spr)

		var turno: int = n - 1 - i
		_plan.append({
			"sale": T_PRIMERO + ESCALON * float(turno),
			"hacia": Vector3(ROW_X, spr.position.y, ROW_Z0 + float(huecos[i])),
			"llego": false,
		})





func _ropa_portero(base: Dictionary) -> Dictionary:
	var gk: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(
		String(team().get("id", "")), -1, String(base.get("pattern", ""))), base)


	for k in base:
		if String(k).begins_with("num_"):
			gk[k] = base[k]
	return gk


func _tick(delta: float) -> void:
	for i in _nuevos.size():
		var spr: AnimatedSprite3D = _nuevos[i]
		if spr == null or not is_instance_valid(spr):
			continue
		var p: Dictionary = _plan[i]
		if bool(p["llego"]):
			continue
		if t < float(p["sale"]):
			continue
		if not spr.visible:
			spr.visible = true
			_al_salir(i)
			if not _con_tunel:


				spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISABLED
				spr.modulate.a = 0.0
		if not _con_tunel and spr.alpha_cut == SpriteBase3D.ALPHA_CUT_DISABLED:
			var a: float = clampf((t - float(p["sale"])) / FUNDIDO, 0.0, 1.0)
			spr.modulate.a = a
			if a >= 1.0:
				_fin_fundido(spr)
		var hacia: Vector3 = p["hacia"]


		if _con_tunel and spr.position.x < SALIDA_X:
			hacia = Vector3(SALIDA_X + 0.5, spr.position.y, spr.position.z)
		var falta: Vector3 = hacia - spr.position
		falta.y = 0.0
		var paso: float = VELOCIDAD * delta
		if falta.length() <= paso and hacia == p["hacia"]:
			_llega(i)
			continue
		var dir: Vector3 = falta.normalized()
		spr.position += dir * paso


		walk_play(spr, dir)




func _al_salir(i: int) -> void:
	if not _aplauso:
		_aplauso = true
		applause(true, -12.0)
	if i == 0 and not _ovacion:
		_ovacion = true
		ovation(-6.0)





func _llega(i: int) -> void:
	var spr: AnimatedSprite3D = _nuevos[i]
	spr.position = _plan[i]["hacia"]
	_fin_fundido(spr)
	walk_play(spr, Vector3.ZERO)
	_plan[i]["llego"] = true




func _fin_fundido(spr: AnimatedSprite3D) -> void:
	spr.modulate.a = 1.0
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD




func _skipped() -> void:
	for i in _nuevos.size():
		var spr: AnimatedSprite3D = _nuevos[i]
		if spr == null or not is_instance_valid(spr):
			continue
		spr.visible = true
		if not bool(_plan[i]["llego"]):
			_llega(i)





func _filas_ficha() -> void:
	var lista: Array = _llegadas()
	for i in mini(lista.size(), FICHA_FILAS):
		card_box.add_child(_fila(lista[i]))
	var total: int = maxi(int(data.get("total", lista.size())), lista.size())
	var resto: int = total - mini(lista.size(), FICHA_FILAS)
	if resto > 0:
		var mas: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)


		mas.text = I18n.gritado_seguro(I18n.tf("Y {0} MÁS", [resto]))
		mas.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		card_box.add_child(mas)






func _fila(f: Dictionary) -> HBoxContainer:
	var caja: HBoxContainer = HBoxContainer.new()
	caja.add_theme_constant_override("separation", 10)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var de: Dictionary = Teams.by_id(String(f.get("from", "")))
	if not de.is_empty():
		var esc: CrestView = CrestView.new()
		esc.custom_minimum_size = Vector2(CREST_PX, CREST_PX)
		esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(esc)
		esc.set_team(de)
	else:
		var hueco: Control = Control.new()
		hueco.custom_minimum_size = Vector2(CREST_PX, CREST_PX)
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(hueco)

	var media: int = int(f.get("media", 0))
	if media > 0:
		var ovr: OvrBadge = OvrBadge.new()
		ovr.setup(media, OVR_PX)
		ovr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		caja.add_child(ovr)




	var col_pos: HBoxContainer = HBoxContainer.new()
	col_pos.custom_minimum_size = Vector2(POS_W, 0)
	col_pos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col_pos.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(col_pos)
	var pos: String = String(f.get("pos", ""))
	if not pos.is_empty():
		var chip: PanelContainer = CareerUi.pos_chip(pos)
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		col_pos.add_child(chip)



	var nombre: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	nombre.text = CareerTheme.caps(String(f.get("name", "?")))
	nombre.clip_text = true
	nombre.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nombre.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	caja.add_child(nombre)

	caja.add_child(_precio(f))
	return caja







func _precio(f: Dictionary) -> Control:
	var fee: int = int(f.get("fee", 0))
	var marca: String = ""
	if bool(f.get("loan", false)):
		marca = I18n.t("CEDIDO")
	elif fee <= 0:
		marca = I18n.t("LIBRE")
	var celda: HBoxContainer = HBoxContainer.new()
	celda.custom_minimum_size = Vector2(PRECIO_W, 0)
	celda.alignment = BoxContainer.ALIGNMENT_END
	celda.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	celda.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if not marca.is_empty():
		celda.add_child(CareerUi.code_chip(marca, CareerTheme.TEXT_MID,
			CareerTheme.T_CAPTION, 7.0, 2.0))
	else:
		var cifra: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.MONEY)
		cifra.text = CareerUi.short_money(fee)
		cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		celda.add_child(cifra)
	return celda
