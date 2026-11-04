extends Ceremony




























const PLAYER_DX: float = 0.2
const PLINTH_DX: float = -0.72
const PLINTH_SIZE: Vector3 = Vector3(0.62, 1.05, 0.5)
const TROPHY_H: float = 0.52


const TROPHY_SINK: float = 0.1






const MIC_Y: float = 0.92
const MIC_DZ: float = 0.42
const MIC_DX: float = -0.15


const SET_X: float = -25.0
const SET_Z: float = 34.0




const KEYS: Array = [
	{"t": 0.0, "dist": 8.0, "h": 2.6, "yaw": 180.0, "aim_y": 1.3, "fov": 36.0},
	{"t": 3.0, "dist": 5.0, "h": 1.95, "yaw": 176.0, "aim_y": 1.28, "fov": 32.0},
]
const DRIFT: float = -0.25

const ATT: float = 0.3
const T_CARD: float = 3.4
const T_BURST: float = 0.6












const CONFETI_SUELO_N: int = 1800
const CONFETI_SUELO_M: Vector2 = Vector2(0.05, 0.03)
const CONFETI_CAJA_X: float = 4.5
const CONFETI_CAJA_Z: Vector2 = Vector2(-1.6, 3.4)


const CONFETI_AIRE_N: int = 46




const IRRUMPEN_T: float = 1.1
const IRRUMPEN_STAGGER: float = 0.28
const IRRUMPEN_CORRE: float = 4.2
const IRRUMPEN_DESDE: float = 2.4
const IRRUMPEN_SITIOS: Array = [
	Vector2(0.55, -0.6),
	Vector2(-0.45, -0.78),

	Vector2(1.06, -0.42),
]

const IRRUMPE_DERBI_S: float = 1.9
const IRRUMPE_SALE_X: float = -3.0

const NOTA_SALA: Dictionary = {
	RuedaPrensa.AMB_FINAL_GANADA: "Te cortan la rueda a gritos. Esta noche el vestuario no espera a nadie.",
	RuedaPrensa.AMB_FINAL_PERDIDA: "El confeti del suelo es del otro. Y aun así te toca contestar.",
	RuedaPrensa.AMB_DERBI: "Se cuela uno a gritar detrás de ti. Un derbi también se gana delante del micro.",
}



var _cara: CaraViva
var _irrumpen: Array[Dictionary] = []
var _confeti_suelo: MultiMeshInstance3D

















const MODES: Dictionary = {
	"mvp": {
		"tag": "FIGURA DEL PARTIDO", "trophy": true, "board": "FIN",
		"weather": "night", "suit": false,
		"note": "Dos minutos de micrófono y a la ducha. Mañana no se acuerda nadie.",


		"note_otro": "Hoy el micro es suyo. La semana que viene se vuelve a repartir.",
	},
	"renewal": {
		"tag": "RENOVACIÓN", "trophy": false, "board": "",
		"weather": "day", "suit": true,
		"note": "Firmado. El club apuesta por ti y ahora hay que devolverlo en el campo.",
	},
	"goodbye": {
		"tag": "SE DESPIDE", "trophy": false, "board": "GRACIAS",
		"weather": "overcast", "suit": true,
		"note": "Se acabó aquí. Lo que hiciste con esta camiseta ya no te lo quita nadie.",
	},




	"reconciliacion": {
		"tag": "TENÍAS RAZÓN", "trophy": false, "board": "GRACIAS",
		"weather": "day", "suit": true,
		"note": "Te querían vender y dijiste que no. El año te dio la razón, y el club"
			+ " sale a decirlo delante de todos.",
	},



	"homenaje": {
		"tag": "HOMENAJE", "trophy": false, "board": "GRACIAS",
		"weather": "day", "suit": true,
		"note": "Toda una etapa en el mismo club. El club te lo devuelve delante de los tuyos.",
	},











	"callup": {
		"tag": "CONVOCADO", "trophy": false, "board": "",
		"weather": "day", "suit": true, "nation": true,
		"note": "Te llamaron. Ahora hay que ir y quedarse.",
	},









	"precontrato": {
		"tag": "SE VA EN VERANO", "trophy": false, "board": "",
		"weather": "day", "suit": true,
		"note": "Ya está firmado y todavía quedan cinco meses de temporada."
			+ " Lo que digas hoy es lo que te van a gritar hasta junio.",
	},




	"penal": {
		"tag": "PENAL FALLADO", "trophy": false, "board": "FIN",
		"weather": "night", "suit": false,
		"note": "Un penal fallado pesa más que tres metidos. Lo que digas ahora es lo que se lee mañana.",
	},





	"idolo": {
		"tag": "JUGADOR DEL MES", "trophy": false, "board": "",
		"weather": "night", "suit": false,
		"note": "Primer premio en primera. Y la pregunta que te van a hacer toda la carrera.",
	},




	"idolo_fan": {
		"tag": "JUGADOR DEL MES", "trophy": false, "board": "",
		"weather": "night", "suit": false,
		"note": "Hay respuestas que te siguen toda la carrera.",
	},





	"idolo_ahijado": {
		"tag": "FIGURA DEL PARTIDO", "trophy": true, "board": "FIN",
		"weather": "night", "suit": false,
		"note": "Hace {0} temporadas dijiste {1}. Hoy el nombre que dicen es el tuyo.",
	},
}



const IDOLO_FILAS: int = 30

const IDOLO_TIPOS: Array[String] = ["leyenda", "activo"]


const IDOLO_HOLD_S: float = 1.0




const FAN_VIDEO_INI: float = 1.0
const FAN_VIDEO_FIN: float = 5.6
const FAN_FUNDE_S: float = 0.5
const FAN_T_CARD: float = 6.6




const AHIJADO_PREGUNTA: Vector2 = Vector2(1.0, 3.6)
const AHIJADO_DICE: Vector2 = Vector2(4.0, 9.0)
const AHIJADO_REMATA: Vector2 = Vector2(9.4, 12.4)
const AHIJADO_T_CARD: float = 12.8
const AHIJADO_FUNDE_S: float = 0.25




const AHIJADO_CITA_ABAJO_TUMBADO: float = 30.0



const FLASHBACK_GD: String = "res://ui/ceremonies/flashback.gd"














const SUIT_SHEET: String = "res://assets/sprites/anim/coach_south_"

const CHARLA_HABLA_S: float = 2.2
const CHARLA_CALLA_S: float = 1.1






func _accent_for() -> Color:
	if _mode() == "renewal":
		return CareerTheme.MONEY


	var nat: Dictionary = _nation()
	if not nat.is_empty():
		return CareerTheme.accent_of(nat)
	return super()






func _nation() -> Dictionary:
	if not bool(_cfg().get("nation", false)):
		return {}
	return Nations.as_team(Career.nationality)







func _mode() -> String:
	return String(data.get("mode", data.get("kind", "mvp")))


func _cfg() -> Dictionary:
	return MODES.get(_mode(), MODES["mvp"])


func _build() -> void:
	var cfg: Dictionary = _cfg()
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"weather": String(data.get("weather", cfg["weather"])),
		"kit": kit,
		"banner": "",


		"board": I18n.t(String(cfg["board"])) if not String(cfg["board"]).is_empty() else "",
	})
	focus = Vector3(SET_X, 0.0, SET_Z)
	make_camera(KEYS)
	orbit_speed = DRIFT
	make_press_board(Vector3(SET_X, 0.0, SET_Z))
	if bool(cfg["trophy"]):
		_build_plinth()
	if bool(cfg.get("suit", false)):




		make_player(GameState.team_custom.duplicate(), "south", SUIT_SHEET, true)
	else:






		var look: Dictionary = act_look(kit)
		make_player(RuedaPrensa.viste_tela(look, _tela(), mine(), _clave_tela(look)),
			"south", act_sheet())
	player.position.x = SET_X + PLAYER_DX

	_cara = CaraViva.pon(player)


	if _cara != null and not _es_ahijado():
		_cara.charla(CHARLA_HABLA_S, CHARLA_CALLA_S)
	make_mic(Vector3(SET_X + PLAYER_DX + MIC_DX, MIC_Y, SET_Z + MIC_DZ))
	make_audio(ATT, false)



	flash_pool = press_flash_pool(Vector3(SET_X, 0.0, SET_Z))
	flash_radius = 9.0
	flash_rate = 7.0
	flash_burst_at = T_BURST
	flash_burst_dur = 1.2
	_viste_sala()
	if _es_fan():
		_monta_hemeroteca()
	elif _es_ahijado():
		_monta_ahijado()

	var badge: Dictionary = _nation()
	if badge.is_empty():
		badge = team()


	make_chyron(I18n.t(String(cfg["tag"])), Nations.team_label(badge, "?").to_upper(),
		badge, 0.5)
	make_card(FAN_T_CARD if _es_fan() else (AHIJADO_T_CARD if _es_ahijado() else T_CARD))
	card_title(CareerTheme.caps(act_name()), 40)
	var sub: Label = card_sub(_sub_line())
	if _mode() == "precontrato":






		sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_card_count()

	var nota_sala: String = String(NOTA_SALA.get(_ambiente(), ""))
	if mine() and not nota_sala.is_empty():
		card_note(I18n.t(nota_sala))
	elif _es_ahijado():

		card_note(I18n.tf(String(cfg["note"]), [maxi(1, int(data.get("anios", 1))),
			CareerUi.display_name(String(data.get("pintado", Career.idolo.get("name", "?"))))]))
	else:
		card_note(I18n.t(String(cfg["note"])) if mine() \
				else I18n.t(String(cfg.get("note_otro", cfg["note"]))))













	if _mode() == "mvp" and mine():
		var m: Dictionary = RuedaPrensa.micro_mvp(data,
			WeekEvents.moment_by_id("momento_mvp"), _socio_pintado())
		card_decision("momento_mvp", _recap(), m["patch"], String(m["socio"]))
	elif _mode() == "penal" and mine():
		card_decision("momento_penal", _recap())
	elif _mode() == "precontrato" and _pregunta_viva() and not replay:
		_arma_pregunta()
	elif _es_fan() and mine() and not replay and _fan_viva():
		_arma_fan()
	elif _idolo_pendiente():


		card_box.add_child(CareerUi.primary_cta(
			CareerTheme.caps(I18n.t("ELEGIR A TU ÍDOLO")), _abre_buscador))
	else:
		card_cta(I18n.t("SEGUIR"))




func _idolo_pendiente() -> bool:
	return _mode() == "idolo" and mine() and not replay and Career.idolo.is_empty()








func _salto_firme() -> bool:
	return _idolo_pendiente() or super._salto_firme()




func _armar_auto_seguir() -> void:
	if _idolo_pendiente():
		return
	super._armar_auto_seguir()


















func _abre_buscador() -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	box.set_meta("idolo_buscador", true)
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = CareerTheme.caps(I18n.t("¿QUIÉN ES TU ÍDOLO?"))
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	titulo.clip_text = true
	box.add_child(titulo)



	var estado: Dictionary = {"tipo": IDOLO_TIPOS[0], "pais": "", "liga": "",
		"puestos": [], "listas": {}}
	var seg: HBoxContainer = CareerUi.segmented([I18n.t("LEYENDAS"), I18n.t("EN ACTIVO")], 0,
		func(i: int) -> void:
			estado["tipo"] = IDOLO_TIPOS[i]
			CareerUi.mark_segmented(estado["seg"], i)

			estado["puestos"] = []
			(estado["pinta"] as Callable).call())
	estado["seg"] = seg
	seg.name = "TiposIdolo"
	box.add_child(seg)
	var campo: LineEdit = CareerUi.campo("", 40, I18n.t("BUSCAR"))
	campo.name = "BuscaIdolo"
	box.add_child(campo)
	var filtros: HBoxContainer = HBoxContainer.new()
	filtros.name = "FiltrosIdolo"
	filtros.add_theme_constant_override("separation", 12)
	box.add_child(filtros)
	for f in ["pais", "liga", "puesto"]:
		var campo_f: String = f
		var b: Button = CareerUi.primary_cta(_rotulo_filtro(campo_f, estado),
			func() -> void: _abre_filtro(campo_f, estado, box))
		b.name = "Filtro_" + campo_f
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.clip_text = true
		filtros.add_child(b)
		estado["b_" + campo_f] = b
	var aviso: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	aviso.text = CareerTheme.caps(I18n.t("MANTÉN PULSADO PARA ELEGIRLO: NO PODRÁS CAMBIARLO"))
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	aviso.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(aviso)
	var scroll: DragScroll = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	box.add_child(scroll)
	var res: VBoxContainer = VBoxContainer.new()
	res.name = "ResultadosIdolo"
	res.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	res.add_theme_constant_override("separation", 8)
	scroll.add_child(res)
	var cerrar: Button = CareerUi.primary_cta(I18n.t("CERRAR"), func() -> void:
		CareerUi.close_modal(box))
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	box.add_child(cerrar)
	estado["pinta"] = func() -> void:
		for h in res.get_children():
			res.remove_child(h)
			h.queue_free()
		var tipo: String = String(estado["tipo"])
		var listas: Dictionary = estado["listas"]
		if not listas.has(tipo):
			listas[tipo] = idolo_lista(tipo)
		for k in ["pais", "liga", "puesto"]:
			var bf: Button = estado["b_" + k]
			bf.text = _rotulo_filtro(k, estado)

			bf.visible = k != "puesto" or tipo == "activo"
			var filtra: bool = not _valor_filtro(k, estado).is_empty()


			CareerTheme.style_button(bf, CareerTheme.Kind.PRIMARY if filtra
				else CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
		var filas: Array = idolo_filtra(listas[tipo], campo.text, IDOLO_FILAS,
			{"pais": estado["pais"], "liga": estado["liga"], "puestos": estado["puestos"]})
		for fila in filas:
			res.add_child(_fila_idolo(fila, tipo, box))
		if filas.is_empty():
			var nada: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
			nada.text = CareerTheme.caps(I18n.t("SIN RESULTADOS"))
			nada.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			res.add_child(nada)
		scroll.scroll_vertical = 0
	campo.text_changed.connect(func(_t: String) -> void:(estado["pinta"] as Callable).call())
	(estado["pinta"] as Callable).call()



static func _valor_filtro(campo: String, estado: Dictionary) -> String:
	if campo == "puesto":
		return ",".join(PackedStringArray(estado["puestos"]))
	return String(estado[campo])




static func _rotulo_filtro(campo: String, estado: Dictionary) -> String:
	var v: String = _valor_filtro(campo, estado)
	if v.is_empty():
		match campo:
			"pais":
				return CareerTheme.caps(I18n.t("PAÍS"))
			"liga":
				return CareerTheme.caps(I18n.t("LIGA"))
		return CareerTheme.caps(I18n.t("PUESTO"))
	if campo == "puesto":
		var siglas: PackedStringArray = []
		for p in estado["puestos"]:
			siglas.append(CareerUi.pos_rotulo(String(p)))
		return " · ".join(siglas)
	if campo == "liga":
		var nat_l: String = Nations.id_for_country(v)
		return CareerTheme.caps(Nations.display_name(nat_l) if not nat_l.is_empty()
			else I18n.t(v))
	return CareerTheme.caps(Nations.display_name(v))







func _abre_filtro(campo: String, estado: Dictionary, box: VBoxContainer) -> void:
	var capa: Node = box
	while capa != null and not capa.is_in_group(CareerUi.MODAL_GROUP):
		capa = capa.get_parent()
	if capa == null:
		return
	var tipo: String = String(estado["tipo"])
	var lista: Array =(estado["listas"] as Dictionary).get(tipo, [])
	if campo == "puesto":
		var ops: Array = []
		for k in SquadEdits.POS_KEYS:
			ops.append({"id": String(k), "texto": CareerUi.pos_rotulo(String(k)),
				"icon_type": "camiseta", "color": CareerUi.pos_color(String(k))})
		CareerUi.modal_rejilla_multi(capa, I18n.t("FILTRAR POR PUESTO"), ops,
			(estado["puestos"] as Array).duplicate(), func(elegidas: Array) -> void:
				estado["puestos"] = elegidas
				(estado["pinta"] as Callable).call())
		return
	var opciones: Array = []
	for o in idolo_opciones(lista, tipo, campo):
		var d: Dictionary = {"id": String(o[0]), "texto": String(o[1])}
		if Flags.has(String(o[2])):
			d["icono"] = Flags.make_rect(String(o[2]), 48.0)
		opciones.append(d)
	opciones.push_front({"id": "", "texto": I18n.t("TODOS" if campo == "pais" else "TODAS")})
	CareerUi.modal_rejilla(capa, I18n.t("FILTRAR POR PAÍS" if campo == "pais"
		else "FILTRAR POR LIGA"), opciones, func(id: String) -> void:
			estado[campo] = id
			(estado["pinta"] as Callable).call(), String(estado[campo]))










static func idolo_lista(tipo: String) -> Array:
	var out: Array = []
	if tipo == "activo":
		for r in WorldRanking.rows(1):
			if not bool((r as Dictionary).get("yo", false)):
				out.append(r)
		return out
	var ligas_de: Dictionary = {}
	for e in Legends._pool():
		var ligas: Array = []
		for cid in (e as Dictionary).get("clubs", {}):
			var pais: String = Teams.country_of(String(cid))
			if not pais.is_empty() and not ligas.has(pais):
				ligas.append(pais)
		ligas_de[Legends.key_of(e)] = ligas
	for r in Legends.world_rivals(100000):
		var row: Dictionary = r
		if bool(row.get("active", false)) or bool(row.get("user", false)):
			continue
		row["ligas"] = ligas_de.get(String(row.get("key", "")), [])
		out.append(row)
	return out





static func idolo_opciones(lista: Array, tipo: String, campo: String) -> Array:
	if tipo == "activo" and campo == "liga":
		return WorldRanking.leagues_in(lista)
	if tipo == "activo":
		var paises: Array = []
		for n in WorldRanking.countries_in(lista):
			paises.append([n[0], n[1], n[0]])
		return paises
	var vistos: Dictionary = {}
	for r in lista:
		var row: Dictionary = r
		if campo == "pais":
			vistos[String(row.get("nat", ""))] = true
		else:
			for l in row.get("ligas", []):
				vistos[String(l)] = true
	vistos.erase("")
	var out: Array = []
	for id in vistos:
		if campo == "pais":
			out.append([String(id), Nations.display_name(String(id)), String(id)])
		else:
			var nat: String = Nations.id_for_country(String(id))
			out.append([String(id), Nations.display_name(nat) if not nat.is_empty()
				else I18n.t(String(id)), nat])
	out.sort_custom(func(a: Array, b: Array) -> bool:
		return CareerTheme.deaccent(String(a[1])).naturalnocasecmp_to(
			CareerTheme.deaccent(String(b[1]))) < 0)
	return out




static func idolo_nombre(row: Dictionary) -> String:
	if not row.has("name"):
		row = WorldRanking.ficha(row)
	return CareerUi.display_name(String(row.get("name", "")))







static func idolo_filtra(todas: Array, texto: String, limite: int,
		filtros: Dictionary = {}) -> Array:

	var q: String = CareerTheme.llave(texto.strip_edges())
	var pais: String = String(filtros.get("pais", ""))
	var liga: String = String(filtros.get("liga", ""))
	var puestos: Array = filtros.get("puestos", [])
	var out: Array = []
	for i in todas.size():
		var row: Dictionary = todas[i]
		var es_activo: bool = not row.has("key")
		if not liga.is_empty():
			if es_activo and String(row.get("liga", "")) != liga:
				continue
			if not es_activo and not (row.get("ligas", []) as Array).has(liga):
				continue
		if not puestos.is_empty() and es_activo \
				and not puestos.has(String(row.get("pos", ""))):
			continue
		if not pais.is_empty() or not q.is_empty():
			var f: Dictionary = WorldRanking.ficha(row) if es_activo else row
			if not pais.is_empty() and String(f.get("nat", "")) != pais:
				continue
			if not q.is_empty():
				var donde: String = idolo_nombre(f)
				if es_activo:
					donde += " " + CareerUi.display_name(String(f.get("club_name", "")))
				if not CareerTheme.llave(donde).contains(q):
					continue
		out.append({"row": row, "rank": i + 1})
		if out.size() >= limite:
			break
	return out






func _fila_idolo(fila: Dictionary, tipo: String, box: VBoxContainer) -> Button:
	var row: Dictionary = fila["row"]
	if tipo == "activo":
		row = WorldRanking.ficha(row)
	var marca: HBoxContainer = HBoxContainer.new()
	marca.add_theme_constant_override("separation", 8)
	marca.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marca.add_child(Flags.make_rect(String(row.get("nat", "")), 28.0))
	if tipo == "activo":
		var medalla: OvrBadge = OvrBadge.new()
		medalla.setup(int(row.get("ovr", 0)), 16)
		medalla.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		marca.add_child(medalla)
		var chip: Control = CareerUi.pos_chip(String(row.get("pos", "")))
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		marca.add_child(chip)
	for h in marca.get_children():
		(h as Control).mouse_filter = Control.MOUSE_FILTER_IGNORE
	var b: Button = CareerUi.menu_row(idolo_nombre(row), "#%d" % int(fila["rank"]),
		CareerTheme.TEXT_DIM, "", marca)
	CareerUi.hold_gesture(b, IDOLO_HOLD_S, func() -> void:
		if Career.elegir_idolo(row, int(fila["rank"]), tipo):
			CareerUi.close_modal(box)
			_leave())
	return b






func _pregunta_viva() -> bool:
	return not Career.pending_precontract.is_empty() \
			and String(Career.pending_precontract.get("presser", "")).is_empty()








func _arma_pregunta() -> void:
	_decision_ev = evento()
	_decision_recap = _recap()
	_decision_resolve = func(key: String) -> String:
		Career.resolve_precontract_presser(key)


		return ""
	_decision_enabled = func(key: String) -> String:
		return _bloqueo(key)




	_decision_postpone = "NO CONTESTAR"












func evento() -> Dictionary:
	return {
		"title": "¿POR QUÉ TE VAS?",
		"desc": "Treinta micrófonos y una sola pregunta. Lo que contestes decide"
			+ " quién carga con esto: el míster, la grada o la prensa.",
		"a": _salida("SE LO DIJE AL MÍSTER A LA CARA", "a",
			{"tecnico": 1.0, "prensa": -1.0}),
		"b": _salida("LE DEBO A ESTA GENTE HASTA JUNIO", "b",
			{"aficion": 1.0, "prensa": -1.0}),
		"c": _salida("ES FÚTBOL, NADA PERSONAL", "c",
			{"tecnico": 1.0, "aficion": -1.0}),
	}


func _salida(label: String, key: String, crudo: Dictionary) -> Dictionary:
	return {"label": label, "fx": {"rel": crudo,
		"rel_pts": Career.precontract_presser_split(key)}}






func _bloqueo(key: String) -> String:
	var d: Dictionary = Career.precontract_presser_split(key)
	for k in d:
		if int(d[k]) != 0:
			return ""
	return "YA NO HAY NADA QUE REPARTIR"





func _dest_nombre() -> String:
	return Market.club_name({"id": String(data.get("dest", "")),
		"name": String(data.get("dest_name", ""))})





func _recap() -> String:



	if _mode() == "precontrato":
		return "%s · %s" % [CareerTheme.caps(_dest_nombre()),
			I18n.tf("{0} TEMPORADAS", [int(data.get("seasons", 2))])]


	if _es_fan():
		return "%s · %s" % [CareerTheme.caps(_fan_pintado()),
			I18n.tf("TEMPORADA {0}", [int(data.get("dicho", 1))])]
	var out: String = "%.1f" % float(data.get("rating", 0.0))
	var goals: int = int(data.get("goals", 0))
	var assists: int = int(data.get("assists", 0))
	if goals > 0:
		out += " · %d %s" % [goals, I18n.plural(goals, "GOL", "GOLES")]
	if assists > 0:
		out += " · %d %s" % [assists, I18n.t("ASIST.")]
	return out




func _socio_pintado() -> String:
	var raw: String = String(data.get("socio", ""))
	if raw.is_empty():
		return ""
	return CareerTheme.caps(CareerUi.display_name(CareerUi.surname(raw)))





func _sub_line() -> String:
	match _mode():
		"renewal":
			return I18n.tf("RENUEVA HASTA {0} TEMPORADAS MÁS", [int(data.get("seasons", 1))]) \
					if int(data.get("seasons", 1)) != 1 else I18n.t("RENUEVA UNA TEMPORADA MÁS")
		"goodbye":
			return I18n.t("ÚLTIMO DÍA EN EL CLUB")
		"precontrato":


			return I18n.tf("FIRMA CON {0} PARA EL VERANO",
				[CareerTheme.caps(_dest_nombre())])
		"penal":
			return I18n.t("RUEDA DE PRENSA")
		"idolo":
			return CareerTheme.caps(I18n.t("¿QUIÉN ES TU ÍDOLO?"))
		"idolo_fan":
			return I18n.t("LA PRENSA RECUPERA AQUEL VÍDEO")
		"idolo_ahijado":
			return CareerTheme.caps(I18n.t("SU ÍDOLO ERES TÚ"))
		"callup":


			return I18n.t("TITULAR CON TU SELECCIÓN") \
					if String(data.get("status", "")) == "titular" \
					else I18n.t("EN LA LISTA DE TU SELECCIÓN")
	var goals: int = int(data.get("goals", 0))
	if goals > 0:
		return I18n.tf("{0} {1} · JUGADOR DEL PARTIDO",
			[goals, I18n.plural(goals, "GOL", "GOLES")])
	return I18n.t("JUGADOR DEL PARTIDO")





func _card_count() -> void:
	match _mode():
		"renewal":


			card_count(int(data.get("wage", 0)), I18n.t("TU NUEVO SUELDO POR TEMPORADA"))
			return
		"goodbye":
			card_count(int(data.get("goals", 0)), I18n.tf("GOLES CON ESTA CAMISETA · {0} PARTIDOS",
				[int(data.get("matches", 0))]))
			return
		"precontrato":



			card_count(int(data.get("wage", 0)), I18n.t("TU NUEVO SUELDO POR TEMPORADA"))
			return
		"callup":



			card_count(int(data.get("age", 0)), I18n.t("AÑOS AL ENTRAR EN LA LISTA"))
			return
		"idolo":


			card_count(int(round(float(data.get("avg", 0.0)) * 10.0)),
				I18n.t("TU MEDIA DEL MES (×10)"))
			return
		"idolo_fan":


			card_count(int(data.get("motm", 0)), I18n.t("PREMIOS DEL MES DESDE ENTONCES"))
			return
		"idolo_ahijado":


			card_count(maxi(1, int(data.get("anios", 1))),
				I18n.t("TEMPORADAS DESDE QUE DIJISTE EL TUYO"))
			card_stats(_match_stats())
			return






	if not mine():


		if int(data.get("paradas", 0)) > 0:
			card_count(int(data.get("paradas", 0)), I18n.t("PARADAS EN EL PARTIDO"))
		else:
			card_count(int(data.get("goals", 0)), I18n.t("GOLES EN EL PARTIDO"))
			card_stats(_match_stats())
		return
	card_count(int(round(float(data.get("rating", 0.0)) * 10.0)),
		I18n.t("TU NOTA DEL PARTIDO (×10)"))



	card_stats(_match_stats())





func _match_stats() -> Array:


	var out: Array = [
		{"v": str(int(data.get("goals", 0))), "k": I18n.t("goles")},
		{"v": str(int(data.get("assists", 0))), "k": I18n.t("asist.")},
	]
	if int(data.get("shots", 0)) > 0:
		out.append({"v": str(int(data.get("shots", 0))), "k": I18n.t("tiros")})
	if int(data.get("passes", 0)) > 0:
		out.append({"v": str(int(data.get("passes", 0))), "k": I18n.t("pases")})
	return out





func _build_plinth() -> void:
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = PLINTH_SIZE
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.1, 0.11, 0.14)
	mat.roughness = 0.9
	box.material_override = mat
	var px: float = SET_X + PLINTH_DX
	box.position = Vector3(px, PLINTH_SIZE.y * 0.5, SET_Z)
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
		SET_Z + PLINTH_SIZE.z * 0.5 + 0.01)
	viewport.add_child(skirt)




	make_trophy(TrophyIcon.partido_de(String(data.get("comp", "league"))),
		Vector3(px, PLINTH_SIZE.y + TROPHY_H * 0.5 - TROPHY_SINK, SET_Z), TROPHY_H)






func _ambiente() -> String:
	if _mode() != "mvp" and _mode() != "penal":
		return ""
	return String(data.get("ambiente", ""))




func _tela() -> Dictionary:
	var t: Variant = data.get("tela", {})
	return t if t is Dictionary else {}



func _clave_tela(look: Dictionary) -> String:
	return "%s|%d" % [String(look.get("apellido", "")), int(look.get("number", 0))]




func _viste_sala() -> void:
	match _ambiente():
		RuedaPrensa.AMB_FINAL_GANADA:
			var cols: Array[Color] = _colores_de(team())
			cols.append(CareerTheme.MONEY)
			_pon_confeti_suelo(cols)
			confetti_colors = cols
			confetti_count = CONFETI_AIRE_N
			set_confetti(true)
			flash_rate = 11.0
			_pon_irrumpen(IRRUMPEN_SITIOS.size())
		RuedaPrensa.AMB_FINAL_PERDIDA:


			var suyos: Array[Color] = _colores_de(Teams.by_id(String(data.get("rival", ""))))
			suyos.append(CareerTheme.MONEY)
			_pon_confeti_suelo(suyos)
		RuedaPrensa.AMB_DERBI:
			_pon_irrumpen(1)




func _colores_de(eq: Dictionary) -> Array[Color]:
	var out: Array[Color] = []
	for k in ["kit", "kit2"]:
		var c: Variant = eq.get(k)
		if c is Color:
			out.append(c)
	if out.is_empty():
		out.append(accent)
	out.append(Color(0.96, 0.96, 0.94))
	return out






func _pon_confeti_suelo(cols: Array[Color]) -> void:
	var quad: QuadMesh = QuadMesh.new()
	quad.size = CONFETI_SUELO_M


	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	quad.material = mat
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.use_colors = true
	mm.mesh = quad
	mm.instance_count = CONFETI_SUELO_N
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = 1810
	for i in CONFETI_SUELO_N:
		var b: Basis = Basis(Vector3.UP, r.randf_range(0.0, TAU)) \
				* Basis(Vector3.RIGHT, - PI * 0.5 + r.randf_range(-0.25, 0.25))
		var at: Vector3 = Vector3(SET_X + r.randf_range(- CONFETI_CAJA_X, CONFETI_CAJA_X),
			0.012 + r.randf() * 0.006,
			SET_Z + r.randf_range(CONFETI_CAJA_Z.x, CONFETI_CAJA_Z.y))
		mm.set_instance_transform(i, Transform3D(b, at))

		mm.set_instance_color(i, cols[r.randi() % cols.size()].darkened(r.randf() * 0.25))
	_confeti_suelo = MultiMeshInstance3D.new()
	_confeti_suelo.multimesh = mm
	_confeti_suelo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_confeti_suelo.name = "ConfetiSuelo"
	viewport.add_child(_confeti_suelo)






func _pon_irrumpen(n: int) -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)



	var base: Dictionary = KitRecolor.team_only(kit)
	var gente: Array = squad_people(String(team().get("id", "")), n, true)
	for i in n:
		var look: Dictionary = person_look(gente[i], base) if i < gente.size() \
				else KitRecolor.appearance_for("irrumpe_%d" % i, kit)
		var fr: SpriteFrames = player_frames(
			RuedaPrensa.viste_tela(look, _tela(), false, _clave_tela(look)))
		if fr == null:
			continue
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.sprite_frames = fr
		s.name = "Irrumpe%d" % i
		viewport.add_child(s)
		var sitio_rel: Vector2 = IRRUMPEN_SITIOS[i % IRRUMPEN_SITIOS.size()]
		var sitio: Vector3 = Vector3(SET_X + PLAYER_DX + sitio_rel.x,
			feet_offset(s.pixel_size) - PLAYER_SINK, SET_Z + sitio_rel.y)
		s.position = Vector3(SET_X + PLAYER_DX + IRRUMPEN_DESDE + 0.5 * i, sitio.y, sitio.z)
		s.play("idle")
		var cfg: Dictionary = fr.get_meta("look_cfg", {})
		add_idle_views(s, cfg)
		add_run(s, cfg)
		CaraViva.pon(s)


		s.visible = false
		_irrumpen.append({"spr": s, "fr": fr, "sitio": sitio,
			"t0": IRRUMPEN_T + IRRUMPEN_STAGGER * i, "estado": "espera",
			"gesto": festejo_hornea(fr, i)})


func _tick(delta: float) -> void:
	for m in _irrumpen:
		_tick_irrumpe(m, delta)
	if _es_fan():
		_tick_hemeroteca()
	elif _es_ahijado():
		_tick_ahijado()





func _tick_irrumpe(m: Dictionary, delta: float) -> void:


	if not is_instance_valid(m["spr"]):
		return
	var s: AnimatedSprite3D = m["spr"]
	match String(m["estado"]):
		"espera":
			if t >= float(m["t0"]):
				s.visible = true
				m["estado"] = "entra"
		"entra":
			var hacia: Vector3 = Vector3(m["sitio"]) - s.position
			hacia.y = 0.0
			var paso: float = IRRUMPEN_CORRE * delta
			if hacia.length() <= paso:
				s.position = Vector3(m["sitio"])
				m["estado"] = "festeja"
				m["t_llega"] = t
				if not String(m["gesto"]).is_empty():
					festejo_play(s, String(m["gesto"]))
				else:
					run_play(s, Vector3.ZERO)
				var cv: CaraViva = CaraViva.de(s)
				if cv != null:
					cv.anima("reir")
				if _cara != null:
					_cara.habla(false)
					_cara.anima("reir")
			else:
				run_play(s, hacia.normalized())
				s.position += hacia.normalized() * paso
		"festeja":
			if _ambiente() == RuedaPrensa.AMB_DERBI \
					and t - float(m["t_llega"]) >= IRRUMPE_DERBI_S:
				m["estado"] = "sale"
				var cv: CaraViva = CaraViva.de(s)
				if cv != null:
					cv.anima("")
				if _cara != null:
					_cara.anima("")
					_cara.charla(CHARLA_HABLA_S, CHARLA_CALLA_S)
		"sale":
			var dir: Vector3 = Vector3.LEFT
			run_play(s, dir)
			s.position += dir * IRRUMPEN_CORRE * delta
			if s.position.x <= SET_X + IRRUMPE_SALE_X:
				m["estado"] = "fuera"
				s.queue_free()





func _skipped() -> void:

	if _es_fan():
		_fan_video(0.0)

	if _es_ahijado():
		_tick_ahijado()
	for m in _irrumpen:
		if not is_instance_valid(m["spr"]):
			continue
		var s: AnimatedSprite3D = m["spr"]
		if _ambiente() == RuedaPrensa.AMB_DERBI:
			m["estado"] = "fuera"
			s.queue_free()
			continue
		s.position = Vector3(m["sitio"])
		s.visible = true
		m["estado"] = "festeja"
		m["t_llega"] = t
		if not String(m["gesto"]).is_empty():
			festejo_play(s, String(m["gesto"]))
		var cv: CaraViva = CaraViva.de(s)
		if cv != null:
			cv.anima("reir")



func irrumpen_n() -> int:
	return _irrumpen.size()



func confeti_suelo() -> MultiMeshInstance3D:
	return _confeti_suelo




var _heme: PanelContainer = null
var _heme_mat: ShaderMaterial = null


func _es_fan() -> bool:
	return _mode() == Ceremonies.IDOLO_FAN




func _fan_pintado() -> String:
	var p: String = String(data.get("pintado", ""))
	if p.is_empty():
		p = String(Career.idolo.get("name", "?"))
	return p





func _fan_viva() -> bool:
	if not Career.idolo_escenas.has(Ceremonies.IDOLO_FAN):
		return false
	var h: Variant = Career.idolo_escenas.get("_hilo", {})
	return not (h is Dictionary and (h as Dictionary).has("fan_resp"))







func _monta_hemeroteca() -> void:
	var gd: GDScript = load(FLASHBACK_GD) as GDScript
	var filtro: String = String(gd.get_script_constant_map().get("FILTRO", "")) \
			if gd != null else ""
	if not filtro.is_empty() and viewport_box != null and viewport_box.material == null:
		var sh: Shader = Shader.new()
		sh.code = filtro
		_heme_mat = ShaderMaterial.new()
		_heme_mat.shader = sh
		_heme_mat.set_shader_parameter("fuerza", 0.0)
		viewport_box.material = _heme_mat
	_heme = PanelContainer.new()
	_heme.name = "Hemeroteca"
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.BG_DEEP, 0.9)
	sb.border_color = accent
	sb.border_width_top = 4
	sb.content_margin_left = 26.0
	sb.content_margin_right = 26.0
	sb.content_margin_top = 16.0
	sb.content_margin_bottom = 18.0
	_heme.add_theme_stylebox_override("panel", sb)
	_heme.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_heme.anchor_left = 0.5
	_heme.anchor_right = 0.5
	_heme.anchor_top = 1.0
	_heme.anchor_bottom = 1.0
	_heme.offset_left = -490.0
	_heme.offset_right = 490.0
	var abajo: float = 150.0 + UiKit.bottom_safe_inset(get_viewport())
	_heme.offset_top = - abajo
	_heme.offset_bottom = - abajo
	_heme.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_heme.modulate.a = 0.0
	add_child(_heme)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_heme.add_child(col)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(fila)
	var rol: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_MID)
	rol.text = I18n.tf("TEMPORADA {0}", [int(data.get("dicho", 1))])
	rol.clip_text = true
	rol.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(rol)
	var chip: PanelContainer = PanelContainer.new()
	chip.add_theme_stylebox_override("panel", CareerTheme.tag(accent))
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(chip)
	var chip_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.on_color(accent))
	chip_l.text = I18n.tf("HACE {0} TEMPORADAS", [maxi(1, int(data.get("anios", 1)))])
	chip.add_child(chip_l)
	var quien: HBoxContainer = HBoxContainer.new()
	quien.add_theme_constant_override("separation", 12)
	quien.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(quien)
	var nat: String = String(data.get("nat", ""))
	if not nat.is_empty():
		var bandera: Control = Flags.make_rect(nat, 34.0)
		bandera.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		quien.add_child(bandera)
	if String(data.get("tipo", "")) == "activo" and int(data.get("ovr", 0)) > 0:
		var medalla: OvrBadge = OvrBadge.new()
		medalla.setup(int(data.get("ovr", 0)), 18)
		medalla.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		quien.add_child(medalla)
		var pc: Control = CareerUi.pos_chip(String(data.get("pos", "")))
		pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		quien.add_child(pc)
	for h in quien.get_children():
		(h as Control).mouse_filter = Control.MOUSE_FILTER_IGNORE
	var frase: Label = CareerUi.plain(CareerTheme.T_HUD_ROTULO, CareerTheme.TEXT)
	frase.text = "«%s»" % I18n.tf("MI ÍDOLO ES {0}", [CareerTheme.caps(_fan_pintado())])
	frase.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART



	frase.max_lines_visible = 3
	frase.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	quien.add_child(frase)



func _fan_fuerza() -> float:
	if t < FAN_VIDEO_INI:
		return 0.0
	if t < FAN_VIDEO_INI + FAN_FUNDE_S:
		return (t - FAN_VIDEO_INI) / FAN_FUNDE_S
	if t < FAN_VIDEO_FIN:
		return 1.0
	return clampf(1.0 -(t - FAN_VIDEO_FIN) / FAN_FUNDE_S, 0.0, 1.0)


func _tick_hemeroteca() -> void:
	_fan_video(_fan_fuerza())


func _fan_video(f: float) -> void:
	if _heme_mat != null:
		_heme_mat.set_shader_parameter("fuerza", f)
	if _heme != null:
		_heme.modulate.a = f






func _arma_fan() -> void:
	_decision_ev = evento_fan()
	_decision_recap = _recap()
	_decision_resolve = func(key: String) -> String:
		Career.resolve_idolo_fan(key)

		return ""
	_decision_enabled = func(key: String) -> String:
		return "" if not IdoloEscenas.fan_reparto(key, Career.rel).is_empty() \
				else "YA NO HAY NADA QUE REPARTIR"




func evento_fan() -> Dictionary:
	var ev: Dictionary = {
		"title": "¿SIGUE SIENDO TU ÍDOLO?",
		"desc": I18n.tf("La sala pone el vídeo de hace {0} temporadas."
			+ " Lo que digas hoy sale mañana al lado.", [maxi(1, int(data.get("anios", 1)))]),
	}
	for key: String in ["a", "b"]:
		var crudo: Dictionary = {}
		for k: String in IdoloEscenas.FAN_REPARTO[key]:
			crudo[k] = signf(float(IdoloEscenas.FAN_REPARTO[key][k]))
		ev[key] = {"label": "SIEMPRE LO SERÁ" if key == "a" else "YA JUEGO MI PROPIA HISTORIA",
			"fx": {"rel": crudo, "rel_pts": IdoloEscenas.fan_reparto(key, Career.rel)}}
	return ev




var _ahijado_citas: Array[Dictionary] = []
var _ahijado_sonrie: bool = false


func _es_ahijado() -> bool:
	return _mode() == Ceremonies.IDOLO_AHIJADO







func _monta_ahijado() -> void:
	var suyo: String = String(winner().get("name", "?"))
	var tu: String = CareerUi.display_name(String(data.get("tu", Career.player_name)))
	var remate: String = String(IdoloEscenas.AHIJADO_FRASES.get(String(data.get("rama", "")),
		IdoloEscenas.AHIJADO_FRASES["companero"]))
	var frases: Array = [
		{"quien": I18n.t("RUEDA DE PRENSA"), "rotulo": I18n.t("PRENSA"),
			"texto": I18n.t("¿Quién es tu ídolo?"), "win": AHIJADO_PREGUNTA, "habla": false},
		{"quien": suyo, "rotulo": I18n.t("TU AHIJADO"),
			"texto": I18n.tf("{0}. Me firmó la playera cuando tenía {1} años. Todavía la tengo.",
				[tu, Juveniles.EDAD_NINO]), "win": AHIJADO_DICE, "habla": true},
		{"quien": suyo, "rotulo": I18n.t("TU AHIJADO"), "texto": I18n.t(remate),
			"win": AHIJADO_REMATA, "habla": true},
	]
	for f: Dictionary in frases:
		var cita: PanelContainer = make_cita_idolo(String(f["quien"]), String(f["texto"]),
			String(f["rotulo"]))
		cita.name = "AhijadoCita"
		if UiKit.es_horizontal():
			var abajo: float = AHIJADO_CITA_ABAJO_TUMBADO + UiKit.bottom_safe_inset(get_viewport())
			cita.offset_top = - abajo
			cita.offset_bottom = - abajo
		_ahijado_citas.append({"panel": cita, "win": f["win"], "habla": f["habla"]})






func _tick_ahijado() -> void:
	var dice: bool = false
	for c: Dictionary in _ahijado_citas:
		var w: Vector2 = c["win"]
		(c["panel"] as PanelContainer).modulate.a = clampf(
			minf((t - w.x) / AHIJADO_FUNDE_S,(w.y - t) / AHIJADO_FUNDE_S), 0.0, 1.0)
		if bool(c["habla"]) and t >= w.x and t < w.y - 0.4:
			dice = true
	if _cara == null:
		return
	if _cara._hablando != dice:
		_cara.habla(dice)
	if not _ahijado_sonrie and t >= AHIJADO_REMATA.x:
		_ahijado_sonrie = true
		_cara.anima("alegria")



func ahijado_citas() -> Array[Dictionary]:
	return _ahijado_citas
