class_name SquadEditor
extends Control



































const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")



const PLAYER_TEX: Texture2D = preload("res://assets/sprites/players/player_south.png")




const LOOK_BAND: float = 420.0







const STAT_LABELS: Array = [
	["velocidad", "VELOCIDAD"], ["aceleracion", "ACELERACION"],
	["entrada", "ENTRADA"], ["pegada", "PEGADA"],
	["punteria", "PUNTERIA"], ["rosca", "ROSCA"], ["cabeza", "CABEZA"],
	["penal", "PENAL"], ["parado", "BALON PARADO"], ["reflejos", "REFLEJOS"],
]










const NATION_POOL: Array[String] = [
	"España", "Inglaterra", "Italia", "Alemania", "México", "Portugal",
	"Francia", "Países Bajos", "Brasil", "Argentina", "Estados Unidos",
	"Arabia Saudí", "Turquía", "Bélgica",
	"FRA", "BRA", "arg", "ned", "bel", "uru", "col", "cro", "sen", "MAR",
	"jpn", "kor", "usa", "nga", "gha", "sui", "srb", "pol", "swe", "NOR",
	"din", "civ", "cmr", "ecu", "per", "chi",
]





const MIN_QUERY: int = 2
const MAX_CLUB_HITS: int = 12
const MAX_PLAYER_HITS: int = 30


const MAX_COACH_HITS: int = 12

var _body: VBoxContainer


var _page: String = "clubs"




var _query: String = ""
var _query_raw: String = ""










var _roster_vista: String = "lista"

















var _abre_identidad: bool = false










var _hermanos: Array = []
var _hermanos_key: String = ""





var _club_desde_lista: bool = false




var _nat_desde_edits: bool = false
var _nat_query: String = ""
var _nat_inicial: String = "A"
var _legend_inicial: String = "A"
var _edits_tipo: int = 0
var _edits_pais: String = ""
var _edits_div: int = 1
var _edits_inicial: String = "A"
var _edits_desde_roster: bool = false
var _nat_results: VBoxContainer



var _nat_nada: Label
var _nat_puertas: int = 30
var _nat_orden_cache: Array = []


var _nat_scroll: ScrollContainer
var _nat_scroll_y: int = -1

var _pos_filter: String = ""
var _search_edit: LineEdit
var _results: VBoxContainer

















var _name_index: Array = []


var _index_ready: bool = false






var _coach_index: Array = []
var _coach_index_v: int = -1

var _countries: Array = []
var _country_idx: int = 0
var _div: int = 1
var _team: Dictionary = {}
var _idx: int = -1








var _swap: Dictionary = {}
var _same_pos: bool = true
var _notice: String = ""



var _flash_idx: int = -1



var _draft: Dictionary = {}





var _edit_player: Dictionary = {}
var _edit_badge: OvrBadge
var _name_edit: LineEdit
var _age_label: Label
var _nation_label: Label
var _nation_flag: TextureRect
var _poss_warn: String = ""
var _num_label: Label = null



var _pot_label: Label = null







var _player_undo: Button






var _club_crest: CrestView
var _club_name_edit: LineEdit
var _club_abbrev_edit: LineEdit
var _club_venue_edit: LineEdit
var _club_venue_auto: Button
var _club_planta_pic: TextureRect
var _club_labels: Dictionary = {}
var _club_swatches: Dictionary = {}
var _club_brand_logos: Dictionary = {}





var _club_slot: int = 0
const KIT_SLOT_PREFIX: Array[String] = ["", "away_", "third_"]
const KIT_SLOT_NAMES: Array[String] = ["LOCAL", "VISITA", "ALTERNA"]















const KIT_BODY: Rect2 = Rect2(29, 17, 35, 69)



var _club_previews: Array = []
var _club_undo: Button



var _look_cfg: Dictionary = {}
var _look_preview: TextureRect


var _look_club: String = ""




var _look_stage: LockerStage = null
var _look_undo: Button




var _look_draft: bool = false




var _pack_info: Dictionary = {}





var _pack_zip: String = ""



var _pack_escudos_zip: int = 0






var _importando: bool = false

var _recibido_esperando: bool = false



const RUTA_EXPORT: String = "user://packs/plantilla.json"




func _ruta_export(country: String) -> String:
	if country.is_empty():
		return RUTA_EXPORT
	return "user://packs/plantilla_%s.json" % country.to_lower().replace(" ", "_")
























static var abrir_en_carrera: bool = false


var _carrera: bool = false


func _ready() -> void:
	Telemetry.count("editor")
	_carrera = abrir_en_carrera
	abrir_en_carrera = false






	SquadEdits.retiene()


	if not _carrera:







		Career.fija_huella_asientos()
		TransferBook.suspend()




		WorldAging.suspend()


		EuroCrown.suspend()


		ClubForm.suspend()





		OvrCap.suspend()



		CareerEdits.suspend()





		RosterDelta.suspend_career()




		Coaches.suspend()
		MisterEdits.suspend()


		LegendEdits.suspend()
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 40.0
	root.offset_bottom = -34.0
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	add_child(root)

	var title: Label = Label.new()
	CareerTheme.title(title, CareerTheme.T_TITLE)
	title.text = I18n.t("EDITOR")
	root.add_child(title)






	if _carrera:
		var banda: PanelContainer = CareerUi.plate()
		root.add_child(banda)
		var bl: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.accent_text())

		bl.text = I18n.tf("EDITANDO TU CARRERA · {0} · TEMPORADA {1}", [
			CareerTheme.caps(String(Teams.by_id(GameState.player_team_id).get("name", ""))),
			GameState.season_num])
		bl.clip_text = true
		banda.add_child(bl)

	_countries = _build_countries()
	_body = VBoxContainer.new()
	_body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_body.add_theme_constant_override("separation", 14)
	root.add_child(_body)




	var recibido: String = "" if _carrera else PackRecibido.toma()
	if not recibido.is_empty():
		_page = "packs"
	_render()
	if not recibido.is_empty():
		_abre_recibido(recibido)







func _abre_recibido(ruta: String) -> void:
	_recibido_esperando = true
	while SceneFade.en_fundido():
		await get_tree().process_frame
		if not is_inside_tree():
			return
	_recibido_esperando = false
	_on_pack_elegido(ruta)







func acepta_pack() -> bool:
	if _carrera or _importando or _recibido_esperando or CareerUi.modal_open(self) \
			or _open_picker() != null \
			or not _swap.is_empty() \
			or _page in ["create", "look", "coach_look", "legend_look"]:
		return false
	var ruta: String = PackRecibido.toma()
	if ruta.is_empty():
		return true
	_flush_name()
	_pack_info = {}
	_page = "packs"
	_render()
	_on_pack_elegido(ruta)
	return true





func _exit_tree() -> void:





	if _carrera and not GameState.readonly_save:
		Career._save()

	SquadEdits.suelta()



	TransferBook.resume()
	WorldAging.resume()
	EuroCrown.resume()
	ClubForm.resume()
	OvrCap.resume()
	CareerEdits.resume()
	RosterDelta.resume_career()
	Coaches.resume()
	MisterEdits.resume()
	LegendEdits.resume()


	if not _carrera:
		Career.reancla_asientos()



	var nat: Object = PackImport.nativo()
	if nat != null:
		_nativo_conectar(nat, false)






func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_PAUSED \
			or what == NOTIFICATION_APPLICATION_FOCUS_OUT \
			or what == NOTIFICATION_WM_CLOSE_REQUEST:
		SquadEdits.vuelca()






func atras() -> bool:
	_on_back()
	return true



func _build_countries() -> Array:
	var out: Array = []
	for t in Teams.all():
		var country: String = String(t.get("country", ""))
		if country != "" and not out.has(country):
			out.append(country)
	return out


func _current_country() -> String:
	return String(_countries[clampi(_country_idx, 0, _countries.size() - 1)])


func _divs_of_country() -> Array:
	var out: Array = []
	for d in range(1, Teams.max_div(_current_country()) + 1):
		if not Teams.teams_in(_current_country(), d).is_empty():
			out.append(d)
	return out

















func _slot_read(team_id: String, idx: int) -> Dictionary:
	if not _carrera:
		var g: Dictionary = SquadEdits.effective_full(team_id, idx)





		var techo_g: int = SquadEdits.pot_of(team_id, idx)
		if techo_g > 0:
			g["pot"] = techo_g
		return g







	var squad: Array = Squad.home_of(team_id, true)
	if idx < 0 or idx >= squad.size():
		return {}
	var out: Dictionary =(squad[idx] as Dictionary).duplicate()
	var meta: Array = Career.editor_meta(team_id)
	var pm: Dictionary = meta[idx] if idx < meta.size() else {}
	out["age"] = int(pm.get("age", 26))
	out["nation"] = String(pm.get("nation", Teams.country_of(team_id)))
	out["look"] = _look_read(team_id, idx)

	var techo_c: int = CareerEdits.pot_of(team_id, idx)
	if techo_c > 0:
		out["pot"] = techo_c
	return out





func _slot_read_person(team_id: String, idx: int) -> Dictionary:
	if not _carrera:
		return SquadEdits.raw_full(team_id, idx)
	Squad.suspend_gold_floor()
	var out: Dictionary = _slot_read(team_id, idx)
	Squad.resume_gold_floor()
	return out









func _slot_write(team_id: String, idx: int, player: Dictionary) -> bool:
	if not _carrera:
		SquadEdits.set_slot(team_id, idx, player)
		return true
	if not CareerEdits.set_slot(team_id, idx, player):
		return false
	Career.editor_set_meta(team_id, idx, int(player.get("age", 26)),
		String(player.get("nation", "")))
	return true


func _slot_clear(team_id: String, idx: int) -> void:
	if _carrera:
		CareerEdits.clear_slot(team_id, idx)
	else:
		SquadEdits.clear_slot(team_id, idx)


func _slot_edited(team_id: String, idx: int) -> bool:
	return CareerEdits.slot_edited(team_id, idx) if _carrera \
			else SquadEdits.slot_edited(team_id, idx)


func _team_edited(team_id: String) -> bool:
	return CareerEdits.has_edits(team_id) if _carrera \
			else SquadEdits.has_edits(team_id)


func _team_reset(team_id: String) -> void:
	if _carrera:
		CareerEdits.reset_team(team_id)
	else:
		SquadEdits.reset_team(team_id)



func _team_shift(team_id: String, delta: int) -> bool:
	if _carrera:
		return CareerEdits.shift_team(team_id, delta)
	SquadEdits.shift_team(team_id, delta)
	return true




func _team_meta(team_id: String, squad: Array) -> Array:
	if _carrera:
		return Career.editor_meta(team_id)



	var meta: Array = SquadMeta.seed(team_id, Teams.country_of(team_id))
	SquadEdits.apply_meta(team_id, meta)
	return meta









func _squad_read(team_id: String) -> Array:
	return Squad.home_of(team_id, _carrera)





func _look_read(team_id: String, idx: int) -> Dictionary:
	if _carrera:
		var propio: Dictionary = CareerEdits.look_of(team_id, idx)
		if not propio.is_empty():
			return propio
	return SquadEdits.look_of(team_id, idx)


func _edited_teams() -> Array:
	return CareerEdits.edited_teams() if _carrera else SquadEdits.edited_teams()


func _edited_slots(team_id: String) -> Array:
	return CareerEdits.edited_slots(team_id) if _carrera \
			else SquadEdits.edited_slots(team_id)




func _edited_team_count() -> int:




	return (CareerEdits.edited_team_count() if _carrera \
			else SquadEdits.edited_team_count() + TeamEdits.edited_count()
			+ NationEdits.edited_count()) \
					+ MisterEdits.edited_count(_carrera) \
					+ LegendEdits.edited_count(_carrera)







func _do_swap(team_a: String, idx_a: int, team_b: String, idx_b: int) -> void:
	if not _carrera:
		SquadEdits.swap(team_a, idx_a, team_b, idx_b)
		return
	var pa: Dictionary = _slot_read_person(team_a, idx_a)
	var pb: Dictionary = _slot_read_person(team_b, idx_b)
	var s: int = GameState.season_num


	var meta_a: Array = Career.editor_meta(team_a)
	var meta_b: Array = Career.editor_meta(team_b)
	var fa: Dictionary =(meta_a[idx_a] as Dictionary).duplicate(true) \
			if idx_a < meta_a.size() else {}
	var fb: Dictionary =(meta_b[idx_b] as Dictionary).duplicate(true) \
			if idx_b < meta_b.size() else {}











	var mapas: Dictionary = {}
	var sa: Dictionary = Career._salida_de(team_a, idx_a, s, TransferBook.VIA_EDITOR,
		String(pa.get("pos", "")), mapas)
	var sb: Dictionary = Career._salida_de(team_b, idx_b, s, TransferBook.VIA_EDITOR,
		String(pb.get("pos", "")), mapas)
	var oa: Dictionary = sa["origen"]
	var ob: Dictionary = sb["origen"]
	pa = pa.duplicate()
	pb = pb.duplicate()
	pa["carrera"] = sa["carrera"]
	pb["carrera"] = sb["carrera"]
	pa.erase("etapa_desde")
	pb.erase("etapa_desde")


	Career._asienta(team_a, idx_a, pb, s, String(ob.get("from", "")),
		int(ob.get("f_idx", TransferBook.SIN_ORIGEN)), mapas)
	Career._asienta(team_b, idx_b, pa, s, String(oa.get("from", "")),
		int(oa.get("f_idx", TransferBook.SIN_ORIGEN)), mapas)
	Career.editor_ficha_llega(team_a, idx_a, fb, s)
	Career.editor_ficha_llega(team_b, idx_b, fa, s)

	Career.editor_asientos_relevados(["%s#%d" % [team_a, idx_a], "%s#%d" % [team_b, idx_b]])
	TransferBook.invalidate_caches()






func _div_of(team_id: String) -> int:
	return GameState.div_of(team_id) if _carrera else Teams.base_div(team_id)





func _clubs_in_div(country: String, div: int) -> Array:
	var out: Array = Teams.teams_in(country, div).duplicate() if not _carrera \
			else Teams.teams_of_country(country).filter(func(t: Dictionary) -> bool:
			return GameState.div_of(String(t.get("id", ""))) == div)
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return Squad.media_once(String(a.get("id", ""))) \
				> Squad.media_once(String(b.get("id", ""))))
	return out




func _can_swap_div() -> bool:
	return Career.editor_can_swap_div() if _carrera else true



func _do_swap_div(id_a: String, id_b: String) -> bool:
	return Career.editor_swap_div(id_a, id_b) if _carrera \
			else TeamEdits.swap_div(id_a, id_b)




func _do_place(team_id: String, idx: int, player: Dictionary) -> bool:
	if not _carrera:
		SquadEdits.set_slot(team_id, idx, player)
		return true


	if not Career._asienta(team_id, idx, player, GameState.season_num, "",
			TransferBook.SIN_ORIGEN, {}):
		return false


	Career._patch_squad_meta(team_id, idx, player)
	Career.editor_asientos_relevados(["%s#%d" % [team_id, idx]])
	TransferBook.invalidate_caches()
	return true



































func _do_move(team_a: String, idx_a: int, team_b: String) -> bool:
	var pa: Dictionary = _slot_read_person(team_a, idx_a)
	var pos: String = String(pa.get("pos", "MC"))




	if team_a == team_b:
		return false
	var squad_a: Array = _squad_read(team_a)
	var seats_a: int = squad_a.size()





	if SquadEdits.PROTECTED_POS.has(pos):
		var quedan: int = 0
		for i in squad_a.size():
			if i != idx_a and String((squad_a[i] as Dictionary).get("pos", "")) == pos:
				quedan += 1
		if quedan == 0:
			return false
	var squad_b: Array = _squad_read(team_b)
	var ficha: Dictionary = {}





	if _carrera:
		Career.editor_meta(team_b)
	if _carrera and Career.editor_meta_materialized(team_a):
		var meta_a: Array = Career.editor_meta(team_a)
		if idx_a < meta_a.size():
			ficha =(meta_a[idx_a] as Dictionary).duplicate(true)


	var base: bool = not _carrera
	var nuevo: int = RosterDelta.add_seat(team_b, pos,


		Squad.free_number(squad_b, pos, team_b), SquadEdits.snapshot_identity(pa),
		base, squad_b.size())
	if nuevo < 0:
		return false
	if not RosterDelta.drop_seat(team_a, idx_a, base, seats_a):
		RosterDelta.reset_last(team_b, base)
		return false
	_drop_shift(team_a, idx_a, base)




	if base:
		SquadEdits.flush()
	if _carrera:
		Career.editor_add_meta(team_b, ficha if not ficha.is_empty() \
				else SquadMeta.fresh(int(pa.get("age", 26)), String(pa.get("nation", ""))))
	Squad.invalidate()
	NatTeam.invalidate_candidates()
	return true





func _motivo_no_move(team_a: String, idx_a: int, team_b: String) -> String:
	if team_a == team_b:
		return I18n.t("Ya juega en ese club.")
	var squad_a: Array = _squad_read(team_a)
	if squad_a.size() <= RosterDelta.MIN_SEATS:
		return I18n.tf("Un club no puede bajar de {0} jugadores.",
			[RosterDelta.MIN_SEATS])
	if _squad_read(team_b).size() >= RosterDelta.MAX_SEATS:
		return I18n.tf("Un club no puede pasar de {0} jugadores.",
			[RosterDelta.MAX_SEATS])
	var pos: String = String((squad_a[idx_a] as Dictionary).get("pos", "MC")) \
			if idx_a < squad_a.size() else "MC"
	if SquadEdits.PROTECTED_POS.has(pos):
		for i in squad_a.size():
			if i != idx_a and String((squad_a[i] as Dictionary).get("pos", "")) == pos:
				return ""




		return I18n.tf("{0} se quedaría sin ningún {1}.",
			[String(_team.get("name", "")) if String(_team.get("id", "")) == team_a \
					else team_a, CareerUi.pos_rotulo(pos)])
	return ""






func _drop_shift(team_id: String, idx: int, base: bool) -> void:
	if not base:








		Career.corre_asiento_carrera(team_id, idx)
		return



	SquadEdits.drop_seat(team_id, idx)
	TransferBook.drop_seat(team_id, idx)
	CareerEdits.drop_seat(team_id, idx)
	Career.editor_drop_meta(team_id, idx)




func _render() -> void:
	for c in _body.get_children():
		c.queue_free()
	_cols_fijas.clear()
	match _page:
		"clubs":
			_render_clubs()
		"roster":
			_render_roster()
		"player":
			_render_player()
		"create":
			_render_create()
		"club":
			_render_club()
		"look":
			_render_look()
		"edits":
			_render_edits()
		"packs":
			_render_packs()
		"comunidad":
			_render_comunidad()
		"coach":
			_render_coach()
		"coach_look":
			_render_coach_look()
		"legends":
			_render_legends()
		"legend_look":
			_render_legend_look()
		"nations":
			_render_nations()
		"nation":
			_render_nation()
		"nation_squad":
			_render_nation_squad()
	_envuelve_fijas()
	CareerUi.normalize_caps(_body)



func _pending_create() -> bool:
	return String(_swap.get("kind", "swap")) == "create"





func _pending_div() -> bool:
	return String(_swap.get("kind", "swap")) == "div"






func _pending_solo() -> bool:
	return bool(_swap.get("solo", false))




func _pending_coach() -> bool:
	return String(_swap.get("kind", "swap")) == "coach"






func _pending_derbi() -> bool:
	return String(_swap.get("kind", "swap")) == "derbi"






func _pending_nat_derbi() -> bool:
	return String(_swap.get("kind", "swap")) == "derbi_nat"






const MANDO_APAISADO_W: float = 760.0


const MANDO_LISTA_W: float = 520.0










func _partir_tumbado(ancho: float) -> Array[VBoxContainer]:
	return _columnas_tumbadas([ancho, 0.0])







func _columnas_tumbadas(anchos: Array[float]) -> Array[VBoxContainer]:
	var cols: Array[VBoxContainer] = []
	if not UiKit.es_horizontal():
		for _a in anchos:
			cols.append(_body)
		return cols
	var fila: HBoxContainer = HBoxContainer.new()
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_theme_constant_override("separation", 28)
	_body.add_child(fila)
	for a in anchos:
		var col: VBoxContainer = VBoxContainer.new()
		col.add_theme_constant_override("separation", 14)
		if a > 0.0:
			col.custom_minimum_size = Vector2(a, 0)
			_cols_fijas.append(col)
		else:
			col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(col)
		cols.append(col)
	return cols




var _cols_fijas: Array[VBoxContainer] = []














func _envuelve_fijas() -> void:
	for col in _cols_fijas:
		if not is_instance_valid(col):
			continue
		var botones: Array[Button] = []
		_botones_de(col, botones)
		botones.sort_custom(func(a: Button, b: Button) -> bool:
			return a.get_combined_minimum_size().x > b.get_combined_minimum_size().x)
		for b in botones:
			if col.get_combined_minimum_size().x <= col.custom_minimum_size.x + 0.5:
				break
			if b.autowrap_mode != TextServer.AUTOWRAP_OFF:
				continue



			var fila: Array[Button] = [b]
			if b.get_parent() is HBoxContainer:
				fila = []
				for h in b.get_parent().get_children():
					if h is Button and not (h as Button).text.is_empty():
						fila.append(h as Button)
			for f in fila:
				_parte(f)





func _parte(b: Button) -> void:
	b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var base: Font = b.get_theme_font("font")
	if base == null:
		return
	if not _fuentes_con_aire.has(base):
		var fv: FontVariation = FontVariation.new()
		fv.base_font = base
		fv.spacing_bottom = 6
		_fuentes_con_aire[base] = fv
	b.add_theme_font_override("font", _fuentes_con_aire[base])



static var _fuentes_con_aire: Dictionary = {}


func _botones_de(n: Node, out: Array[Button]) -> void:
	for h in n.get_children():
		if h is Button and not (h as Button).text.is_empty() \
				and (h as Button).autowrap_mode == TextServer.AUTOWRAP_OFF:
			out.append(h as Button)
		_botones_de(h, out)


func _render_clubs() -> void:





	var partes: Array[VBoxContainer] = _partir_tumbado(MANDO_APAISADO_W)
	var mando: VBoxContainer = partes[0]
	var lista_padre: VBoxContainer = partes[1]


	if _pending_create():
		_swap_banner(mando, I18n.t("ELIGE EL CLUB DONDE ENTRA"), "")
	elif _pending_coach():
		_swap_banner(mando, I18n.t("ELIGE SU EQUIPO NUEVO"),
			I18n.t("Se cruza con el técnico de ese club: cada uno se sienta en el banquillo del otro."))
	elif _pending_div():
		_swap_banner(mando, I18n.t("ELIGE EL CLUB CON EL QUE SE CAMBIA"),
			I18n.t("Los dos se cruzan: uno sube y el otro baja.\nTiene que ser de otra división del mismo país."))
	elif _pending_derbi():
		_swap_banner(mando, I18n.t("ELIGE SU RIVAL DE DERBI"),
			I18n.t("Tiene que ser del mismo país.\nPuede ser de otra división."))
	elif _pending_solo():


		_swap_banner(mando, I18n.t("ELIGE EL CLUB DESTINO"),
			I18n.t("Al tocar un club se ficha ahí mismo: no eliges asiento."))
	else:
		_swap_banner(mando, I18n.t("ELIGE EL CLUB DESTINO"),
			I18n.t("También puede ser su propio club, para cambiarlo de asiento."))
	if _swap.is_empty():
		var sub: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)



		sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		sub.text = I18n.t("Lo que toques aquí cambia SOLO esta carrera.\nTu base de datos global no se entera.") \
				if _carrera else \
				I18n.t("Fichajes, cualidades, caras y escudos a tu gusto.\nSe guarda solo y vale para todas las carreras.")
		mando.add_child(sub)





	_index_ready = false


	_hermanos_key = ""









	_search_edit = LineEdit.new()
	_search_edit.placeholder_text = I18n.t("BUSCAR CLUB O JUGADOR")
	_search_edit.text = _query_raw
	_search_edit.custom_minimum_size = Vector2(0, 92)
	_search_edit.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	_search_edit.virtual_keyboard_enabled = true
	_search_edit.clear_button_enabled = true
	_style_line_edit(_search_edit)
	_search_edit.text_changed.connect(_on_query_changed)
	mando.add_child(_search_edit)





	if _swap.is_empty():
		var tocados: int = _edited_team_count()
		if tocados > 0:



			var mis: Button = CareerUi.accion("pincel", I18n.t("MIS EDICIONES"),
				CareerTheme.NAV_YO)
			mis.pressed.connect(func() -> void:
				_page = "edits"
				_render())
			mando.add_child(mis)




		var leg: Button = CareerUi.accion("leyendas", I18n.t("LEYENDAS"), CareerTheme.NAV_LEGADO)
		leg.pressed.connect(func() -> void:
			_page = "legends"
			_render())
		mando.add_child(leg)




		if not _carrera:
			var sel: Button = CareerUi.accion("seleccion", I18n.t("SELECCIONES"),
				CareerTheme.NAV_MUNDO)
			sel.pressed.connect(func() -> void:
				_nat_desde_edits = false
				_page = "nations"
				_render())
			mando.add_child(sel)






		if not _carrera:
			var imp: Button = CareerUi.accion("caja_abierta", I18n.t("IMPORTAR DATOS"),
				CareerTheme.NAV_MUNDO)
			imp.pressed.connect(func() -> void:
				_pack_info = {}
				_page = "packs"
				_render())
			mando.add_child(imp)





			var com: Button = CareerUi.accion("aficion", I18n.t("PLANTILLAS DE COMUNIDAD"),
				CareerTheme.NAV_MUNDO)
			com.pressed.connect(_abre_comunidad)
			mando.add_child(com)




	if mando != _body:
		_modo_apertura(mando)

	_results = VBoxContainer.new()
	_results.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_results.add_theme_constant_override("separation", 14)
	lista_padre.add_child(_results)
	_fill_results()

	if mando != _body:

		var hueco: Control = Control.new()
		hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
		mando.add_child(hueco)
	CareerUi.back_button(mando, _on_back)









var _query_timer: Timer = null
const QUERY_DEBOUNCE_S: float = 0.17


func _on_query_changed(t: String) -> void:
	_query_raw = t



	_query = CareerTheme.llave(t.strip_edges())
	if _query_timer == null:
		_query_timer = Timer.new()
		_query_timer.one_shot = true
		_query_timer.timeout.connect(_fill_results)
		add_child(_query_timer)
	_query_timer.start(QUERY_DEBOUNCE_S)




func _fill_results() -> void:




	if _results == null or not is_instance_valid(_results):
		return
	for c in _results.get_children():
		c.queue_free()
	if _query.length() < MIN_QUERY:
		_fill_browse()
	else:
		_fill_matches()
	CareerUi.normalize_caps(_results)











func _modo_apertura(parent: Container) -> void:
	if not _swap.is_empty() or _carrera:
		return
	var cap: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	cap.text = I18n.t("AL TOCAR UN CLUB SE ABRE")
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)



	parent.add_child(cap)
	parent.add_child(row)
	for identidad: bool in [false, true]:
		var mb: Button = Button.new()
		mb.text = CareerTheme.caps(I18n.t("IDENTIDAD" if identidad else "PLANTILLA"))
		mb.custom_minimum_size = Vector2(0, 76)
		mb.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(mb,
			CareerTheme.Kind.PRIMARY if identidad == _abre_identidad \
					else CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)


		mb.pressed.connect(func() -> void:
			_abre_identidad = identidad


			for k in row.get_children():
				if k is Button:
					CareerTheme.apply_button(k as Button, CareerTheme.Kind.PRIMARY if k == mb \
							else CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
			_fill_results())
		row.add_child(mb)



func _fill_browse() -> void:


	if _query.length() == 1:
		CareerUi.dim(_results, I18n.t("Escribe al menos dos letras para buscar."))




	var country_btn: Button = CareerUi.selector_button(96, 40.0, CareerTheme.T_MONEY)


	(country_btn.get_meta("label") as Label).text = CareerTheme.caps(_current_country())
	(country_btn.get_meta("flag") as TextureRect).texture = Flags.texture(
		Nations.id_for_country(_current_country()))





	country_btn.disabled = _pending_div() or _pending_derbi()
	country_btn.pressed.connect(_open_country_picker)


	var cabeza: Container = _results
	if UiKit.es_horizontal():
		cabeza = HBoxContainer.new()
		cabeza.add_theme_constant_override("separation", 8)
		_results.add_child(cabeza)
		country_btn.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cabeza.add_child(country_btn)



	var div_row: HBoxContainer = HBoxContainer.new()
	div_row.add_theme_constant_override("separation", 8)
	div_row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cabeza.add_child(div_row)
	for d in _divs_of_country():



		if _pending_div() and int(d) == int(_swap.get("div", 0)):
			continue
		var db: Button = Button.new()
		db.text = CareerTheme.caps(I18n.t(Teams.div_name(int(d))))
		db.custom_minimum_size = Vector2(0, 76)
		db.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(db,
			CareerTheme.Kind.PRIMARY if int(d) == _div else CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
		db.pressed.connect(_set_div.bind(int(d)))
		div_row.add_child(db)

	if not UiKit.es_horizontal():
		_modo_apertura(_results)


	var list: VBoxContainer = _scroll_list(_results)



	if UiKit.es_horizontal():
		_club_casillas(list, _clubs_in_div(_current_country(), _div))
	else:
		for club in _clubs_in_div(_current_country(), _div):
			_club_row(list, club)








func _fill_matches() -> void:




	var solo_clubes: bool = not _swap.is_empty()

	var clubs: Array = []
	for t in Teams.all():



		if CareerTheme.llave(String(t.get("name", ""))).contains(_query) \
				or CareerTheme.llave(String(t.get("abbrev", ""))).contains(_query):
			clubs.append(t)
	clubs.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return Squad.media_once(String(a.get("id", ""))) \
				> Squad.media_once(String(b.get("id", ""))))






	var coaches: Array = []
	if not solo_clubes:
		_ensure_coach_index()
		for e in _coach_index:
			if String(e["f"]).contains(_query) or String(e["e"]).contains(_query):
				coaches.append(String(e["c"]))

	var players: Array = []
	if not solo_clubes:


		_ensure_name_index()
		for e in _name_index:
			if not String(e["f"]).contains(_query):
				continue
			var t: Dictionary = e["t"]
			var i: int = int(e["i"])
			var ficha: Dictionary = Squad.home_of(String(t.get("id", "")))[i]
			players.append({"team": t, "idx": i, "p": ficha,



				"m": SquadMeta.ovr_of(ficha, String(ficha.get("pos", "MC")))})


		players.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return float(a["m"]) > float(b["m"]))

	if clubs.is_empty() and players.is_empty() and coaches.is_empty():
		CareerUi.dim(_results, I18n.t("Nada encaja con esa búsqueda."))
		return






	var presentes: Array = []
	for h in players:
		var hp: String = String((h["p"] as Dictionary).get("pos", "MC"))
		if not presentes.has(hp):
			presentes.append(hp)
	presentes.sort_custom(func(a: String, b: String) -> bool:
		return SquadEdits.POS_KEYS.find(a) < SquadEdits.POS_KEYS.find(b))



	var hay_chips: bool = presentes.size() > 1 or not _pos_filter.is_empty()
	var todos: int = players.size()
	if not _pos_filter.is_empty():
		var filtrados: Array = []
		for h in players:
			if String((h["p"] as Dictionary).get("pos", "MC")) == _pos_filter:
				filtrados.append(h)
		players = filtrados

	var list: VBoxContainer = _scroll_list(_results)
	if not clubs.is_empty():
		_result_head(list, I18n.t("CLUBES"), clubs.size(), MAX_CLUB_HITS)



		if not UiKit.es_horizontal():
			_modo_apertura(list)
		for i in mini(clubs.size(), MAX_CLUB_HITS):
			_club_row(list, clubs[i])



	if not coaches.is_empty():
		_result_head(list, I18n.t("TÉCNICOS"), coaches.size(), MAX_COACH_HITS)
		for i in mini(coaches.size(), MAX_COACH_HITS):
			_coach_row(list, String(coaches[i]), true)




	if hay_chips or not players.is_empty():
		_result_head(list, I18n.t("JUGADORES"), todos if _pos_filter.is_empty() \
				else players.size(), MAX_PLAYER_HITS)
	if hay_chips:
		_pos_filter_row(list, presentes)
	if players.is_empty() and not _pos_filter.is_empty():


		CareerUi.dim(list, I18n.tf(
			"Ningún {0} encaja con esa búsqueda. Toca TODOS para ver el resto.",
			[_pos_filter]))
	for i in mini(players.size(), MAX_PLAYER_HITS):
		_hit_row(list, players[i])





func _pos_filter_row(parent: Container, presentes: Array) -> void:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	parent.add_child(flow)
	var opciones: Array = [""]
	opciones.append_array(presentes)
	for opt in opciones:
		var key: String = String(opt)
		var chip: Button = Button.new()
		chip.text = I18n.t("TODOS") if key.is_empty() else key
		chip.custom_minimum_size = Vector2(0, 64)
		CareerTheme.apply_button(chip,
			CareerTheme.Kind.PRIMARY if key == _pos_filter else CareerTheme.Kind.GHOST,
			CareerTheme.T_DIM)
		chip.pressed.connect(func() -> void:
			_pos_filter = key
			_fill_results())
		flow.add_child(chip)





func _result_head(list: VBoxContainer, label_text: String, total: int,
		cap: int) -> void:
	var head: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	if total > cap:
		head.text = I18n.tf("{0} · {1} DE {2} — AFINA LA BUSQUEDA",
			[label_text, cap, total])
	else:
		head.text = I18n.tf("{0} · {1}", [label_text, total])
	list.add_child(head)




func _hit_row(list: VBoxContainer, hit: Dictionary) -> void:
	var team: Dictionary = hit["team"]
	var p: Dictionary = hit["p"]
	var pos: String = String(p.get("pos", "MC"))
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 108)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
	b.text = ""
	b.pressed.connect(_open_hit.bind(team, int(hit["idx"])))
	list.add_child(b)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 14.0
	row.offset_right = -16.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 12)
	b.add_child(row)
	var ovr: OvrBadge = OvrBadge.new()
	ovr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ovr.setup(SquadMeta.ovr_of(p, pos), 30)
	row.add_child(ovr)
	row.add_child(CareerUi.pos_chip(pos))
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 2)
	row.add_child(col)
	var name_l: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	name_l.text = CareerUi.display_name(String(p.get("name", "")))
	name_l.clip_text = true
	col.add_child(name_l)
	var club_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	club_l.text = I18n.tf("{0} · {1}", [CareerTheme.caps(String(team.get("name", ""))),
		I18n.t(Teams.div_name(int(team.get("div", 1)))).to_upper()])
	club_l.clip_text = true
	col.add_child(club_l)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(48, 48)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.set_team(team)
	row.add_child(crest)
	_mute(row)





func _open_hit(team: Dictionary, idx: int) -> void:
	_query = ""
	_query_raw = ""
	_pos_filter = ""
	_team = team
	_idx = idx
	_page = "player"
	_render()




func _ensure_name_index() -> void:
	if _index_ready:
		return
	_build_name_index()
	_index_ready = true







func _ensure_coach_index() -> void:
	if _coach_index_v == Coaches.version():
		return
	_coach_index.clear()
	for t in Teams.all():
		var cid: String = String((t as Dictionary).get("id", ""))
		if cid.is_empty() or Coaches.id_of(cid).is_empty():
			continue
		_coach_index.append({
			"c": cid,
			"f": CareerTheme.caps(Coaches.name_of(cid)),
			"e": CareerTheme.caps(String(t.get("name", ""))) + " " \
					+ CareerTheme.caps(String(t.get("abbrev", "")))})
	_coach_index_v = Coaches.version()




func _build_name_index() -> void:
	_name_index.clear()
	for t in Teams.all():
		var squad: Array = Squad.home_of(String(t.get("id", "")))
		for i in squad.size():
			_name_index.append({"t": t, "i": i, "f": CareerTheme.caps(
				CareerUi.display_name(String(squad[i].get("name", ""))))})



func _scroll_list(parent: Container, sin_tope: bool = false) -> VBoxContainer:
	var scroll: DragScroll = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED


	scroll.sin_tope = sin_tope and not UiKit.es_horizontal()
	parent.add_child(scroll)
	var list: VBoxContainer = VBoxContainer.new()
	list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	list.add_theme_constant_override("separation", 8)
	scroll.add_child(list)
	return list



func _club_row(list: VBoxContainer, club: Dictionary) -> void:
	var b: Button = _club_boton(club)
	b.custom_minimum_size = Vector2(0, 108)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	list.add_child(b)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 18.0
	row.offset_right = -18.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 16)
	b.add_child(row)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(64, 64)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.set_team(club)
	row.add_child(crest)
	var name_l: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(String(club.get("name", "")))
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	row.add_child(name_l)
	if _club_editado(club):
		var tag: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.accent_text())
		tag.text = I18n.t("EDITADO")
		tag.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		row.add_child(tag)
	var ovr: OvrBadge = OvrBadge.new()
	ovr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ovr.setup(_club_media(club), 30)
	row.add_child(ovr)
	_mute(row)











const CLUB_CASILLA: Vector2 = Vector2(172, 168)


func _club_casillas(list: VBoxContainer, clubs: Array) -> void:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	list.add_child(flow)
	for club in clubs:
		_club_casilla(flow, club)




func _club_casilla(flow: Container, club: Dictionary) -> void:
	var b: Button = _club_boton(club)
	b.custom_minimum_size = CLUB_CASILLA
	flow.add_child(b)
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_left = 8.0
	col.offset_right = -8.0
	col.offset_top = 6.0
	col.offset_bottom = - float(CareerTheme.SINK) - 4.0
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 4)
	b.add_child(col)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.alignment = BoxContainer.ALIGNMENT_CENTER
	arriba.add_theme_constant_override("separation", 8)
	col.add_child(arriba)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(60, 60)
	crest.set_team(club)
	arriba.add_child(crest)
	var ovr: OvrBadge = OvrBadge.new()
	ovr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ovr.setup(_club_media(club), 22)
	arriba.add_child(ovr)
	var name_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(String(club.get("name", "")))
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	CareerUi.autoshrink(name_l, 12)
	col.add_child(name_l)
	if _club_editado(club):
		var tag: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.accent_text())
		tag.text = I18n.t("EDITADO")
		tag.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		CareerUi.autoshrink(tag, 12)
		col.add_child(tag)
	_mute(col)






func _club_editado(club: Dictionary) -> bool:
	return _team_edited(String(club.get("id", ""))) \
			or (not _carrera and TeamEdits.edited(String(club.get("id", ""))))







func _club_media(club: Dictionary) -> int:
	return Squad.ovr_scale(float(Squad.media_once(String(club.get("id", "")))))



func _club_boton(club: Dictionary) -> Button:
	var b: Button = Button.new()
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.text = ""
	if _pending_div():





		var mismo_pais: bool = Teams.country_of(String(club.get("id", ""))) \
				== String(_swap.get("country", ""))
		var otra_div: bool = _div_of(String(club.get("id", ""))) \
				!= int(_swap.get("div", 0))
		b.disabled = not (mismo_pais and otra_div)
		b.pressed.connect(_confirm_div_swap.bind(club))
	elif _pending_derbi():



		var id_d: String = String(club.get("id", ""))
		var id_s: String = String(_swap.get("team_id", ""))
		b.disabled = Teams.country_of(id_d) != String(_swap.get("country", "")) \
				or id_d == id_s or TeamEdits.derbis_of(id_s).has(id_d) \
				or TeamEdits.derbis_of(id_d).size() >= TeamEdits.MAX_DERBIS
		b.pressed.connect(_confirm_derbi.bind(club))
	elif _pending_coach():



		b.disabled = String(club.get("id", "")) == String(_swap.get("team_id", ""))
		b.pressed.connect(_confirm_coach_move.bind(club))
	elif _pending_solo():







		b.disabled = String(club.get("id", "")) == String(_swap.get("team_id", ""))
		b.pressed.connect(_confirm_move.bind(club))
	else:


		b.pressed.connect(_abrir_club.bind(club))
	return b




func _open_country_picker() -> void:
	var items: Array = []
	for c in _countries:
		items.append({"id": String(c), "name": String(c)})
	FlagPicker.open(self, I18n.t("PAIS"), items, _current_country(),
		func(id: String) -> void:
			_country_idx = maxi(_countries.find(id), 0)


			if not _divs_of_country().has(_div):
				_div = 1
			_render(),
		[_current_country()])


func _set_div(d: int) -> void:
	if d == _div:
		return
	_div = d
	_render()


func _open_roster(club: Dictionary) -> void:
	_edits_desde_roster = false
	_team = club
	_page = "roster"
	_render()









func _abrir_club(club: Dictionary) -> void:
	if _abre_identidad and not _carrera:
		_team = club
		_open_club(true)
		return
	_open_roster(club)











func _render_packs() -> void:
	var cuerpo_original: VBoxContainer = _body
	var partes: Array[VBoxContainer] = _partir_tumbado(MANDO_LISTA_W)
	_body = partes[0]
	CareerUi.head(_body, I18n.t("IMPORTAR DATOS"))
	var sub: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	sub.text = I18n.t("Nombres, plantillas y escudos desde un archivo tuyo. Se puede deshacer entero.")
	_body.add_child(sub)



	var derechos: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	derechos.name = "AvisoDerechos"
	derechos.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	derechos.text = I18n.t("El juego no trae nombres, escudos ni marcas reales. Importa sólo lo que tengas derecho a usar: es responsabilidad tuya.")
	_body.add_child(derechos)


	if not _pack_info.is_empty():
		var res: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.accent_text())
		res.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		res.text = _pack_resumen(_pack_info)
		var salida: String = String(_pack_info.get("exportado", ""))
		if not salida.is_empty():
			res.text = "%s · %s" % [I18n.tf("EXPORTADO A {0}", [salida]), res.text]
		_body.add_child(res)








	var exp: Button = CareerUi.accion("compartir", I18n.t("EXPORTAR EL MUNDO ENTERO"),
		CareerTheme.NAV_MUNDO)
	exp.pressed.connect(func() -> void: _confirm_export(""))
	_body.add_child(exp)

	var imp_btn: Button = Button.new()
	imp_btn.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(imp_btn, CareerTheme.Kind.PRIMARY, CareerTheme.T_BODY)
	_body.add_child(imp_btn)

	var nat: Object = PackImport.nativo()



	var selector: bool = nat == null and PackImport.selector_sistema()
	if nat != null or selector:












		if nat != null:
			_nativo_conectar(nat, true)
			imp_btn.pressed.connect(_importar_nativo)
		else:
			imp_btn.pressed.connect(_importar_selector)
		imp_btn.text = I18n.t("IMPORTAR UN ARCHIVO")
		var como: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		como.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		como.text = I18n.t("Exportar te da un archivo para editarlo en el ordenador; importar lo trae de vuelta. Vale .json o un .zip con la carpeta de escudos dentro.")
		_body.add_child(como)



		if selector:
			var drive: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
			drive.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			drive.text = I18n.t("Si el archivo está en Drive, bájalo antes a Descargas.")
			_body.add_child(drive)
	else:



		imp_btn.text = I18n.t("IMPORTAR: ABRIR ARCHIVOS")
		imp_btn.pressed.connect(_abrir_carpeta_packs)
		var packs: Array[String] = PackImport.available()
		if packs.is_empty():
			var vacio: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
			vacio.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

			vacio.text = I18n.t("No hay ningún archivo todavía. Toca IMPORTAR, deja tu .json en esa carpeta y vuelve.")
			_body.add_child(vacio)
		else:
			if UiKit.es_horizontal():
				_pack_lista_horizontal(partes[1], packs)
			else:
				var list: VBoxContainer = _scroll_list(_body)
				for path in packs:
					_pack_row(list, path)

	if TeamEdits.edited_count() > 0 or SquadEdits.edited_team_count() > 0 \
			or CrestLogos.count() > 0 or CompEdits.count() > 0:
		var quitar: Button = Button.new()
		quitar.text = I18n.t("QUITAR TODO LO IMPORTADO")
		quitar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		CareerTheme.apply_button(quitar, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
		quitar.pressed.connect(_confirm_reset_all)
		_body.add_child(quitar)
	CareerUi.back_button(_body, _on_back)
	_body = cuerpo_original


func _pack_lista_horizontal(parent: Container, packs: Array[String]) -> void:
	var busca: LineEdit = CareerUi.campo("", 64, I18n.t("BUSCAR"))
	busca.custom_minimum_size.y = 56.0
	parent.add_child(busca)
	var lista: VBoxContainer = _scroll_list(parent)
	lista.name = "ArchivosHorizontal"
	busca.text_changed.connect(_pack_filtra_horizontal.bind(lista, packs))
	_pack_filtra_horizontal("", lista, packs)


func _pack_filtra_horizontal(texto: String, lista: VBoxContainer, packs: Array[String]) -> void:
	for hijo in lista.get_children():
		lista.remove_child(hijo)
		hijo.queue_free()
	var q: String = CareerTheme.llave(texto.strip_edges())
	var elegidos: Array[String] = []
	for path in packs:
		if q.is_empty() or CareerTheme.llave(path.get_file()).begins_with(q):
			elegidos.append(path)
	CareerUi.dim(lista, I18n.tf("{0}-{1} DE {2}", [1 if not elegidos.is_empty() else 0,
		mini(10, elegidos.size()), elegidos.size()]))
	for path in elegidos.slice(0, 10):
		_pack_row(lista, path)





func _pack_row(list: VBoxContainer, path: String) -> void:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.text = path.get_file()
	b.clip_text = true
	b.pressed.connect(func() -> void: _confirm_pack(path))
	list.add_child(b)







func _nativo_conectar(nat: Object, encender: bool) -> void:
	var pares: Array = [["picked", _on_pack_elegido], ["cancelled", _on_pack_cancelado],
		["failed", _on_pack_fallo]]
	for par in pares:
		var sig: String = String(par[0])
		var cb: Callable = par[1]
		if encender:
			if not nat.is_connected(sig, cb):
				nat.connect(sig, cb)
		elif nat.is_connected(sig, cb):
			nat.disconnect(sig, cb)




func _importar_nativo() -> void:
	var nat: Object = PackImport.nativo()
	if nat == null:
		return
	DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(PackImport.DIR_PACKS))
	nat.call("pick_json", ProjectSettings.globalize_path(PackImport.DIR_PACKS))






func _on_pack_elegido(ruta: String) -> void:
	var path: String = ruta
	_pack_zip = ""


	if path.get_extension().to_lower() == "zip" or PackImport.es_zip(path):






		_pack_zip = path


		_pack_escudos_zip = PackImport.escudos_en_zip(path)
		path = PackImport.unzip(path, true)
		if path.is_empty():
			_pack_zip = ""





			var motivo: String = PackImport.ultimo_corte
			if not motivo.is_empty():
				push_warning("[pack] importación cortada: %s" % motivo)
				_aviso(I18n.t("NO SE PUDO LEER"),
					I18n.t("El archivo es demasiado grande: no se importó nada."))
				return
			_aviso(I18n.t("NO SE PUDO LEER"),
				I18n.t("El .zip no trae ningún archivo .json dentro."))
			return
	_confirm_pack(path)





func _on_pack_cancelado() -> void:
	pass








func _importar_selector() -> void:
	var err: Error = DisplayServer.file_dialog_show(I18n.t("IMPORTAR UN ARCHIVO"),
		"", "", false, DisplayServer.FILE_DIALOG_MODE_OPEN_FILE, PackedStringArray(),
		_on_selector_elegido)
	if err != OK:
		push_warning("[pack] file_dialog_show: %d" % err)
		_on_pack_fallo("no se pudo abrir el selector")






func _on_selector_elegido(ok: bool, rutas: PackedStringArray, _filtro: int) -> void:
	if not ok or rutas.is_empty():
		return
	var local: String = PackImport.recoger_del_selector(rutas[0])
	if local.is_empty():
		push_warning("[pack] selector: %s" % PackImport.ultimo_corte)
		_on_pack_fallo("no se pudo copiar el archivo elegido")
		return
	_on_pack_elegido(local)










func _guardar_por_selector(archivo: String, res: Dictionary) -> void:
	var err: Error = DisplayServer.file_dialog_show(I18n.t("EXPORTAR"), "",
		archivo.get_file(), false, DisplayServer.FILE_DIALOG_MODE_SAVE_FILE,
		PackedStringArray(), _on_guardado_elegido.bind(archivo, res))
	if err != OK:
		push_warning("[pack] file_dialog_show (guardar): %d" % err)
		_on_pack_fallo("no se pudo abrir el selector")













func _on_guardado_elegido(ok: bool, rutas: PackedStringArray, _filtro: int,
		archivo: String, res: Dictionary) -> void:
	if not ok or rutas.is_empty():
		return
	if not PackImport.copiar_a(archivo, rutas[0]):
		push_warning("[pack] no se pudo guardar en %s" % rutas[0])
		if is_inside_tree():
			_overlay(I18n.t("NO SE PUDO ESCRIBIR"),
				[I18n.t("No se pudo guardar el archivo donde elegiste.")],
				I18n.t("ENTENDIDO"), func() -> void: pass)
		return
	_pack_info = {"clubes": int(res.get("clubes", 0)), "jugadores": int(res.get("jugadores", 0)),
		"logos": 0, "torneos": 0, "exportado": archivo.get_file()}
	if is_inside_tree():
		_render()





func _on_pack_fallo(motivo: String) -> void:
	_aviso(I18n.t("NO SE PUDO LEER"), I18n.t(motivo))




func _aviso(titulo: String, linea: String) -> void:
	_overlay(titulo, [linea], I18n.t("ENTENDIDO"), func() -> void: pass)















func _abrir_carpeta_packs() -> void:
	var abs: String = ProjectSettings.globalize_path(PackImport.DIR_PACKS)
	DirAccess.make_dir_recursive_absolute(abs)
	if OS.get_name() == "iOS":
		OS.shell_open("shareddocuments://" + abs)
	else:
		OS.shell_open(abs)






func _confirm_export(country: String) -> void:
	var archivo: String = _ruta_export(country)
	var nat: Object = PackImport.nativo()



	var donde: String
	if nat != null:
		donde = I18n.t("Al terminar se abre COMPARTIR: mándalo a Archivos o a tu ordenador para editarlo y volver a importarlo.")
	elif PackImport.selector_sistema():


		donde = I18n.t("Al terminar se abre GUARDAR: déjalo en Descargas y desde ahí pásalo al ordenador o a tu nube para editarlo y volver a importarlo.")
	else:
		donde = I18n.tf("Queda en la carpeta de Football Legacy como {0}: ábrelo en el ordenador para ajustar tus plantillas y vuelve a importarlo.", [archivo.get_file()])
	_overlay(I18n.t("EXPORTAR PLANTILLA"), [
		I18n.t("Saca todos los clubes, plantillas y competiciones tal y como están ahora."),
		donde,
		I18n.t("Los escudos no van dentro: esos los pones tú."),



		I18n.t("El archivo es tuyo y para tu uso personal: el juego no aloja ni reparte packs."),
	], I18n.t("EXPORTAR"), func() -> void:
		var res: Dictionary = PackImport.export_all(archivo, country)
		if not String(res["error"]).is_empty():
			_overlay(I18n.t("NO SE PUDO ESCRIBIR"), [String(res["error"])],
				I18n.t("ENTENDIDO"), func() -> void: pass)
			return
		if nat != null:
			nat.call("share_file", ProjectSettings.globalize_path(archivo))
		elif PackImport.selector_sistema():


			_guardar_por_selector(archivo, res)
			return



		_pack_info = {"clubes": int(res["clubes"]), "jugadores": int(res["jugadores"]),
			"logos": 0, "torneos": 0, "exportado": archivo.get_file()}
		_render())


func _confirm_pack(path: String) -> void:
	var pv: Dictionary = PackImport.preview(path)
	if not bool(pv["ok"]):
		_overlay(I18n.t("NO SE PUDO LEER"), [String(pv["error"])],
			I18n.t("ENTENDIDO"), func() -> void: pass)
		return
	var lineas: Array = [_pack_resumen(pv),
		I18n.t("Pisa los nombres y las plantillas que tengas ahora."),
		I18n.t("Vale para todas las ranuras y se puede quitar entero."),



		I18n.t("Lo que importes es tuyo y se queda en tu dispositivo: tú respondes de lo que metas en el archivo."),
	]


	if _pack_escudos_zip > 0 and int(pv.get("logos", 0)) == 0:
		pv["logos"] = _pack_escudos_zip
	if not (pv["avisos"] as Array).is_empty():
		lineas.append("· " + "\n· ".join(pv["avisos"]))
	_overlay(I18n.t("IMPORTAR"), lineas, I18n.t("IMPORTAR"), func() -> void:
		_importar_confirmado(path))















func _importar_confirmado(path: String) -> void:
	if _importando:
		return
	_importando = true
	var aviso: VBoxContainer = CareerUi.modal(self)
	if aviso != null:
		var t: Label = Label.new()
		CareerTheme.title(t, CareerTheme.T_TITLE_MODAL)
		t.text = I18n.t("IMPORTANDO…")
		aviso.add_child(t)
		var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		l.text = I18n.t("Guardando el catálogo y los escudos. No cierres el juego.")
		aviso.add_child(l)
		CareerUi.normalize_caps(aviso)
	await get_tree().process_frame
	await get_tree().process_frame


	if not _pack_zip.is_empty():
		await PackImport.unzip_en_hilo(_pack_zip)
	_pack_info = PackImport.import_file(path)
	if aviso != null:
		CareerUi.close_modal(aviso)
	_importando = false
	if not is_inside_tree():
		return
	_render()
	_pack_mundo_movido()
























func _pack_mundo_movido() -> void:
	if not _carrera or not bool(_pack_info.get("ok", false)):
		return





	var movidos: int = TransferBook.frozen_seats()
	if movidos <= 0:
		return



	var devolver: Callable = func() -> void:
		TransferBook.clear()





		if not GameState.readonly_save:
			Career._save()
		_render()
	_overlay(I18n.t("EL MUNDO SE MOVIO"), [


		I18n.tf("Los clubes llevan {0} en esta carrera. Esos jugadores se quedan con su"
			+ " nombre anterior: el pack no los reescribe.",
			[_cuenta(movidos, "fichaje", "fichajes")]),
		I18n.t("Puedes devolver el mundo al catálogo que acabas de importar. Se pierden"
			+ " esos fichajes, también los de tu plantilla; tu carrera, tu club y tus"
			+ " estadísticas no se tocan."),
	], I18n.t("VOLVER AL PACK"), devolver, I18n.t("DEJARLO ASI"))















func _pack_resumen(info: Dictionary) -> String:
	var sillas: int = int(info.get("sillas", 0))
	var jug: int = int(info["jugadores"])
	var partes: Array[String] = [_cuenta(int(info["clubes"]), "club", "clubes")]
	if sillas > jug:
		partes.append(I18n.tf("{0} de {1} jugadores", [jug, sillas]))
	else:
		partes.append(_cuenta(jug, "jugador", "jugadores"))
	var fuera: int = int(info.get("sin_cubrir", 0))
	if fuera > 0:
		partes.append(I18n.tf("{0} sin cubrir", [fuera]))
	if int(info.get("ignorados", 0)) > 0:
		partes.append(I18n.tf("{0} descartados", [int(info["ignorados"])]))



	if int(info.get("logos", 0)) > 0:
		partes.append(_cuenta(int(info["logos"]), "escudo", "escudos"))
	if int(info.get("torneos", 0)) > 0:
		partes.append(_cuenta(int(info["torneos"]), "competicion", "competiciones"))



	if int(info.get("estadios", 0)) > 0:
		partes.append(_cuenta(int(info["estadios"]), "estadio", "estadios"))
	if int(info.get("derbis", 0)) > 0:
		partes.append(_cuenta(int(info["derbis"]), "derbi", "derbis"))

	if int(info.get("tecnicos", 0)) > 0:
		partes.append(_cuenta(int(info["tecnicos"]), "técnico", "técnicos"))
	if int(info.get("tecnicos_libres", 0)) > 0:
		partes.append(_cuenta(int(info["tecnicos_libres"]), "técnico sin equipo",
			"técnicos sin equipo"))
	if int(info.get("seleccionadores", 0)) > 0:
		partes.append(_cuenta(int(info["seleccionadores"]), "seleccionador",
			"seleccionadores"))


	if int(info.get("leyendas", 0)) > 0:
		partes.append(_cuenta(int(info["leyendas"]), "cara de leyenda",
			"caras de leyenda"))
	return " · ".join(partes)







func _cuenta(n: int, singular: String, plural: String) -> String:
	return "%d %s" % [n, I18n.plural(n, singular, plural)]




















const COMUNIDAD_TUMBADO_MAX: int = 8
const COMUNIDAD_FILA_H: float = 104.0
const COMUNIDAD_HUECO: int = 8



var _comunidad_red: String = ""
var _comunidad_q: String = ""
var _comunidad_q_raw: String = ""
var _comunidad_lista: VBoxContainer = null
var _comunidad_cuenta: Label = null
var _comunidad_de: Label = null
var _comunidad_campo: LineEdit = null




func _abre_comunidad() -> void:
	_page = "comunidad"
	_comunidad_red = ""
	_comunidad_q = ""
	_comunidad_q_raw = ""
	PackCatalogo.refresca(self, _comunidad_llega)
	_render()


func _comunidad_llega(ok: bool) -> void:
	_comunidad_red = "ok" if ok else "sin_red"
	if _page != "comunidad" or not is_inside_tree():
		return





	if is_instance_valid(_comunidad_campo) and _comunidad_campo.has_focus() \
			and PackCatalogo.lista().size() > COMUNIDAD_TUMBADO_MAX:
		_comunidad_rellena()
		return
	_render()


func _render_comunidad() -> void:
	var partes: Array[VBoxContainer] = _partir_tumbado(MANDO_LISTA_W)
	var mando: VBoxContainer = partes[0]


	var titulo: Label = CareerUi.head(mando, I18n.t("PLANTILLAS DE COMUNIDAD"))
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var sub: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	sub.text = I18n.t("Packs que hace la gente. Cada uno vive en la web de quien lo hizo.")
	mando.add_child(sub)
	var packs: Array = PackCatalogo.lista()
	_comunidad_campo = null
	_comunidad_cuenta = null
	_comunidad_de = null
	_comunidad_lista = null


	if packs.size() > COMUNIDAD_TUMBADO_MAX:
		_comunidad_campo = LineEdit.new()
		_comunidad_campo.placeholder_text = I18n.t("BUSCAR PACK O CREADOR")
		_comunidad_campo.text = _comunidad_q_raw
		_comunidad_campo.custom_minimum_size = Vector2(0, 92)


		_comunidad_campo.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
		_comunidad_campo.virtual_keyboard_enabled = true
		_comunidad_campo.clear_button_enabled = true
		_style_line_edit(_comunidad_campo)
		_comunidad_campo.text_changed.connect(_on_comunidad_q)
		mando.add_child(_comunidad_campo)
		var cuenta: HBoxContainer = HBoxContainer.new()
		cuenta.add_theme_constant_override("separation", 8)
		mando.add_child(cuenta)
		_comunidad_cuenta = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
		cuenta.add_child(_comunidad_cuenta)
		_comunidad_de = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		_comunidad_de.size_flags_vertical = Control.SIZE_SHRINK_END
		cuenta.add_child(_comunidad_de)
	_comunidad_pasos(mando)
	if packs.is_empty():
		_comunidad_estado(partes[1])
	else:
		if UiKit.es_horizontal():


			_comunidad_lista = VBoxContainer.new()
			_comunidad_lista.add_theme_constant_override("separation", COMUNIDAD_HUECO)
			partes[1].add_child(_comunidad_lista)
		else:
			_comunidad_lista = _scroll_list(partes[1], true)
		_comunidad_rellena()
	if mando != _body:
		var muelle: Control = Control.new()
		muelle.size_flags_vertical = Control.SIZE_EXPAND_FILL
		mando.add_child(muelle)
	CareerUi.back_button(mando, _on_back)




func _on_comunidad_q(t: String) -> void:
	_comunidad_q_raw = t
	_comunidad_q = CareerTheme.llave(t.strip_edges())
	_comunidad_rellena()



func _comunidad_rellena() -> void:
	if _comunidad_lista == null or not is_instance_valid(_comunidad_lista):
		return


	for c in _comunidad_lista.get_children():
		_comunidad_lista.remove_child(c)
		c.queue_free()
	var packs: Array = PackCatalogo.lista()
	var tope: int = COMUNIDAD_TUMBADO_MAX if UiKit.es_horizontal() else packs.size()
	var vistos: int = 0
	for p in packs:
		if vistos >= tope:
			break
		if not _comunidad_q.is_empty() and not CareerTheme.llave(
				String(p["titulo"]) + " " + String(p["creador"])).contains(_comunidad_q):
			continue
		var fila: Button = _comunidad_fila(p as Dictionary)
		if vistos == 0:
			fila.set_meta(Entrada.PRIMERO_META, true)
		_comunidad_lista.add_child(fila)
		vistos += 1
	if vistos == 0:
		CareerUi.dim(_comunidad_lista, I18n.t("SIN RESULTADOS"))
	if is_instance_valid(_comunidad_cuenta):
		_comunidad_cuenta.text = str(vistos)

	if is_instance_valid(_comunidad_de):
		_comunidad_de.text = I18n.t("DE {0}").format([packs.size()])



	CareerUi.normalize_caps(_comunidad_lista)





func _comunidad_fila(p: Dictionary) -> Button:
	var antes: Variant = CareerTheme.accent_ctx
	CareerTheme.accent_ctx = CareerTheme.NAV_MUNDO
	var b: Button = CareerUi.menu_row(String(p["titulo"]), "", CareerTheme.TEXT_DIM, "mundo",
		null, String(p["creador"]), CareerTheme.TEXT_DIM)
	CareerTheme.accent_ctx = antes
	b.custom_minimum_size.y = COMUNIDAD_FILA_H


	for h in b.get_child(0).get_children():
		if h is VBoxContainer:
			(h as VBoxContainer).add_theme_constant_override("separation", 8)
	var id: String = String(p["id"])
	b.set_meta("pack_id", id)

	b.pressed.connect(func() -> void:
		if not PackCatalogo.abre(id):
			_render())
	return b




func _comunidad_pasos(parent: VBoxContainer) -> void:
	var placa: PanelContainer = CareerUi.plate()
	parent.add_child(placa)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)
	placa.add_child(col)
	var pasos: Array = [
		["mundo", CareerTheme.NAV_MUNDO, I18n.t("BÁJALO"), I18n.t("en su web")],
		["caja_abierta", CareerTheme.NAV_MUNDO, I18n.t("TÓCALO"), I18n.t("en Descargas")],
		["check", CareerTheme.TEXT, I18n.t("IMPORTA"), I18n.t("se abre en el juego")],
	]
	for i in pasos.size():
		var paso: Array = pasos[i]
		var fila: HBoxContainer = HBoxContainer.new()
		fila.custom_minimum_size.y = 64
		fila.add_theme_constant_override("separation", 16)
		col.add_child(fila)
		var bola: PanelContainer = PanelContainer.new()
		bola.custom_minimum_size = Vector2(48, 48)
		bola.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = CareerTheme.SURFACE_HI
		sb.set_corner_radius_all(24)
		bola.add_theme_stylebox_override("panel", sb)
		fila.add_child(bola)
		var num: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
		num.text = str(i + 1)
		num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		bola.add_child(num)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(40, 40)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(String(paso[0]), paso[1] as Color)
		fila.add_child(ic)
		var textos: VBoxContainer = VBoxContainer.new()
		textos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		textos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		textos.add_theme_constant_override("separation", 6)
		fila.add_child(textos)
		var que: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
		que.text = String(paso[2])
		que.clip_text = true
		CareerUi.autoshrink(que)
		textos.add_child(que)
		var nota: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		nota.text = String(paso[3])
		nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		textos.add_child(nota)






func _comunidad_estado(parent: VBoxContainer) -> void:
	if PackCatalogo.bajando():
		var hueso: VBoxContainer = VBoxContainer.new()
		hueso.size_flags_vertical = Control.SIZE_EXPAND_FILL
		hueso.add_theme_constant_override("separation", COMUNIDAD_HUECO)
		parent.add_child(hueso)
		for largos in [[0.58, 0.22], [0.34, 0.18], [0.46, 0.26], [0.4, 0.2]]:
			hueso.add_child(_comunidad_hueso(largos as Array))
		var carga: HBoxContainer = HBoxContainer.new()
		carga.size_flags_vertical = Control.SIZE_EXPAND_FILL
		carga.alignment = BoxContainer.ALIGNMENT_CENTER
		carga.add_theme_constant_override("separation", 16)
		hueso.add_child(carga)
		var reloj: MenuIcon = MenuIcon.new()
		reloj.custom_minimum_size = Vector2(48, 48)
		reloj.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		reloj.setup("reloj", CareerTheme.TEXT_DIM)
		carga.add_child(reloj)
		var l: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_DIM)
		l.text = I18n.t("CARGANDO")
		l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		carga.add_child(l)
		return
	var sin_red: bool = _comunidad_red != "ok"
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_vertical = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 24)
	col.set_meta("comunidad_estado", "sin_red" if sin_red else "vacia")
	parent.add_child(col)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(96, 96)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ic.setup("mundo" if sin_red else "aficion",
		CareerTheme.DISABLED_INK if sin_red else CareerTheme.TEXT_DIM)
	col.add_child(ic)
	var t: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	t.text = I18n.t("SIN CONEXIÓN") if sin_red else I18n.t("TODAVÍA NO HAY")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(t)
	var s: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	s.text = I18n.t("Conéctate a internet para ver la lista.") if sin_red \
			else I18n.t("Cuando alguien comparta un pack, sale aquí.")
	s.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	s.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(s)
	if sin_red:
		var otra: Button = Button.new()
		otra.text = I18n.t("REINTENTAR")
		otra.clip_text = true
		otra.custom_minimum_size = Vector2(MANDO_LISTA_W, 96)
		otra.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		CareerTheme.apply_button(otra, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
		otra.set_meta(Entrada.PRIMERO_META, true)
		otra.pressed.connect(_abre_comunidad)
		col.add_child(otra)




func _comunidad_hueso(largos: Array) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, COMUNIDAD_FILA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL



	b.set_meta(Entrada.SIN_FOCO_META, true)
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.focus_mode = Control.FOCUS_NONE
	b.text = ""
	b.disabled = true
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_right = -24.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.add_theme_constant_override("separation", 24)
	b.add_child(row)
	var franja: ColorRect = ColorRect.new()
	franja.color = CareerTheme.SURFACE_HI
	franja.custom_minimum_size = Vector2(8, 0)
	row.add_child(franja)
	var bola: PanelContainer = PanelContainer.new()
	bola.custom_minimum_size = Vector2(48, 48)
	bola.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE_HI
	sb.set_corner_radius_all(24)
	bola.add_theme_stylebox_override("panel", sb)
	row.add_child(bola)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 12)
	row.add_child(col)
	for j in 2:

		var renglon: HBoxContainer = HBoxContainer.new()
		renglon.add_theme_constant_override("separation", 0)
		col.add_child(renglon)
		var barra: ColorRect = ColorRect.new()
		barra.color = CareerTheme.SURFACE_HI
		barra.custom_minimum_size.y = 24 if j == 0 else 16
		barra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		barra.size_flags_stretch_ratio = float(largos[j])
		renglon.add_child(barra)
		var resto: Control = Control.new()
		resto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		resto.size_flags_stretch_ratio = 1.0 - float(largos[j])
		renglon.add_child(resto)
	_mute(row)
	return b















const EDITS_PAGINA: int = 60
const EDITS_MAX_ASIENTOS: int = 300
var _edits_lim: int = EDITS_PAGINA


func _render_edits() -> void:


	var partes: Array[VBoxContainer] = _partir_tumbado(MANDO_LISTA_W)
	var mando: VBoxContainer = partes[0]
	CareerUi.head(mando, I18n.t("MIS EDICIONES"))
	var sub: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	sub.text = I18n.t("Todo lo que has tocado, para llegar de un toque y para poder deshacerlo.")
	mando.add_child(sub)



	if _carrera:
		CareerUi.dim(mando, I18n.tf("{0} de {1} asientos editados en esta carrera.",
			[CareerEdits.slot_count(), CareerEdits.MAX_SLOTS]))



	var ids: Dictionary = {}
	for t in _edited_teams():
		ids[String(t)] = true


	if not _carrera:
		for t in TeamEdits.edited_teams():
			ids[String(t)] = true
	var clubs: Array = []
	for id in ids:
		var club: Dictionary = Teams.by_id(String(id))


		if not club.is_empty():
			clubs.append(club)
	clubs.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return CareerTheme.llave(String(a.get("name", ""))) \
				< CareerTheme.llave(String(b.get("name", ""))))



	var dt_clubs: Array = _coach_clubs_editados()

	var leyendas: Array[String] = LegendEdits.editadas(_carrera)


	var naciones: Array = [] if _carrera else _naciones_editadas()
	if UiKit.es_horizontal() and not (clubs.is_empty() and dt_clubs.is_empty()
		and leyendas.is_empty() and naciones.is_empty()):
		_edits_horizontal(mando, partes[1], clubs, dt_clubs, leyendas, naciones)
		return

	if clubs.is_empty() and dt_clubs.is_empty() and leyendas.is_empty() \
			and naciones.is_empty():
		CareerUi.dim(mando, I18n.t("Todavía no has editado nada en esta carrera.")
			if _carrera else I18n.t("Todavía no has editado nada."))
		var spring_v: Control = Control.new()
		spring_v.size_flags_vertical = Control.SIZE_EXPAND_FILL
		mando.add_child(spring_v)
		CareerUi.back_button(mando, _on_back)
		return

	var list: VBoxContainer = _scroll_list(partes[1], true)




	var total_asientos: int = 0
	for club in clubs:
		total_asientos += _edited_slots(String(club.get("id", ""))).size()
		if total_asientos > EDITS_MAX_ASIENTOS:
			break
	var con_asientos: bool = total_asientos <= EDITS_MAX_ASIENTOS
	var hasta: int = mini(clubs.size(), _edits_lim)
	for club in clubs.slice(0, hasta):



		var grupo: VBoxContainer = list
		if mando != _body:
			grupo = VBoxContainer.new()
			grupo.add_theme_constant_override("separation", 4)
			list.add_child(grupo)
		_club_row(grupo, club)
		var team_id: String = String(club.get("id", ""))
		var ov: Dictionary = TeamEdits.of(team_id) if not _carrera else {}
		if ov.has(TeamEdits.DIV_KEY):
			var dvl: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.accent_text())
			dvl.text = I18n.tf("· DIVISION CAMBIADA ({0})",
				[I18n.t(Teams.div_name(int(ov[TeamEdits.DIV_KEY]))).to_upper()])
			dvl.clip_text = true
			grupo.add_child(dvl)


		var aparte: int = 0
		if ov.has(TeamEdits.DERBI_KEY):
			aparte += 1
			var rival_d: Dictionary = Teams.by_id(String(ov[TeamEdits.DERBI_KEY]))
			if not rival_d.is_empty():
				var dl: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.accent_text())
				dl.text = I18n.tf("· DERBI: {0}", [String(rival_d.get("name", "")).to_upper()])
				dl.clip_text = true
				grupo.add_child(dl)
		if ov.has("estadio") or ov.has("planta"):
			aparte += 1 if ov.has("estadio") else 0
			aparte += 1 if ov.has("planta") else 0
			var el: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.accent_text())
			el.text = I18n.t("· ESTADIO")
			el.clip_text = true
			grupo.add_child(el)



		if ov.size() >(1 if ov.has(TeamEdits.DIV_KEY) else 0) + aparte:
			var idl: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.accent_text())
			idl.text = I18n.t("· IDENTIDAD DEL CLUB (NOMBRE, COLORES, ESCUDO)")
			idl.clip_text = true
			grupo.add_child(idl)
		if con_asientos:
			for idx in _edited_slots(team_id):
				_edited_slot_row(list, club, int(idx))
	if hasta < clubs.size():
		var mas: Button = Button.new()
		mas.text = I18n.tf("VER MÁS ({0})", [clubs.size() - hasta])
		mas.clip_text = true
		mas.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		CareerTheme.apply_button(mas, CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
		mas.pressed.connect(func() -> void:
			_edits_lim += EDITS_PAGINA
			_render())
		list.add_child(mas)
	if not dt_clubs.is_empty():
		var sep_dt: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		sep_dt.text = I18n.t("— TÉCNICOS —")
		sep_dt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		list.add_child(sep_dt)
		for cid in dt_clubs:
			_coach_row(list, String(cid), true)
	if not leyendas.is_empty():
		var sep_lg: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		sep_lg.text = I18n.t("— LEYENDAS —")
		sep_lg.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		list.add_child(sep_lg)
		for key in leyendas:
			var e: Dictionary = _legend_entry(String(key))


			if not e.is_empty():
				_legend_row(list, e, true)
	if not naciones.is_empty():
		var sep_nt: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		sep_nt.text = I18n.t("— SELECCIONES —")
		sep_nt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		list.add_child(sep_nt)
		for nid in naciones:
			_nation_row(list, String(nid), true)

	var quitar: Button = Button.new()
	quitar.text = I18n.t("QUITAR TODO LO EDITADO")
	quitar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(quitar, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	quitar.pressed.connect(_confirm_reset_all)
	if mando != _body:
		var muelle: Control = Control.new()
		muelle.size_flags_vertical = Control.SIZE_EXPAND_FILL
		mando.add_child(muelle)
	mando.add_child(quitar)
	CareerUi.back_button(mando, _on_back)





func _edits_horizontal(mando: VBoxContainer, derecha: VBoxContainer, clubs: Array,
		dt_clubs: Array, leyendas: Array[String], naciones: Array) -> void:
	var cantidades: Array[int] = [clubs.size(), dt_clubs.size(), leyendas.size(), naciones.size()]
	if cantidades[_edits_tipo] == 0:
		for i in cantidades.size():
			if cantidades[i] > 0:
				_edits_tipo = i
				break
	var tipos: GridContainer = GridContainer.new()
	tipos.columns = 2
	tipos.add_theme_constant_override("h_separation", 8)
	tipos.add_theme_constant_override("v_separation", 8)
	mando.add_child(tipos)
	var etiquetas: Array = ["CLUBES", "TÉCNICOS", "LEYENDAS", "SELECCIONES"]
	for i in etiquetas.size():
		var b: Button = Button.new()
		b.text = I18n.t(String(etiquetas[i]))
		b.clip_text = true
		b.custom_minimum_size.y = 56.0
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.disabled = cantidades[i] == 0
		CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY if i == _edits_tipo \
				else CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
		b.pressed.connect(_edits_elige_tipo.bind(i))
		tipos.add_child(b)
	var lista: VBoxContainer = _scroll_list(derecha)
	lista.name = "EdicionesHorizontal"
	if _edits_tipo < 2:
		var paises: Array = []
		var candidatos: Array = clubs if _edits_tipo == 0 else dt_clubs.map(
			func(id: String) -> Dictionary: return Teams.by_id(id))
		for club in candidatos:
			var pais: String = String(club.get("country", ""))
			if not paises.has(pais):
				paises.append(pais)
		paises.sort()
		if not paises.is_empty():
			if not paises.has(_edits_pais):
				_edits_pais = String(paises[0])
			var pais: Button = CareerUi.selector_button(76, 30.0, CareerTheme.T_BODY)
			(pais.get_meta("label") as Label).text = CareerTheme.caps(I18n.t(_edits_pais))
			(pais.get_meta("flag") as TextureRect).texture = Flags.texture(Nations.id_for_country(_edits_pais))
			pais.pressed.connect(_edits_paises.bind(paises))
			mando.add_child(pais)
			var divs: HBoxContainer = CareerUi.segmented([I18n.t(Teams.div_short(1)),
				I18n.t(Teams.div_short(2)), I18n.t(Teams.div_short(3))], _edits_div - 1,
				_edits_elige_div, 64)
			mando.add_child(divs)
		var elegidos: Array = []
		for club in candidatos:
			var id: String = String(club.get("id", ""))
			if String(club.get("country", "")) == _edits_pais and _div_of(id) == _edits_div:
				elegidos.append(club)
		if _edits_tipo == 0:
			var flow: GridContainer = GridContainer.new()
			flow.columns = 5
			flow.add_theme_constant_override("h_separation", 12)
			flow.add_theme_constant_override("v_separation", 12)
			lista.add_child(flow)
			for club in elegidos:
				_club_casilla(flow, club)
				var b: Button = flow.get_child(flow.get_child_count() - 1) as Button
				for enlace in b.pressed.get_connections():
					b.pressed.disconnect(enlace["callable"])
				b.pressed.connect(_edits_abre_roster.bind(club))
		else:
			var rejilla: GridContainer = GridContainer.new()
			rejilla.columns = 3
			rejilla.add_theme_constant_override("h_separation", 12)
			rejilla.add_theme_constant_override("v_separation", 8)
			lista.add_child(rejilla)
			for club in elegidos:
				_coach_row(rejilla, String(club.get("id", "")), true)
				(rejilla.get_child(rejilla.get_child_count() - 1) as Control).custom_minimum_size.x = 340.0
	else:
		var nombres: Array = []
		if _edits_tipo == 2:
			for key in leyendas:
				nombres.append(Legends.pintado_de(key))
		else:
			for id in naciones:
				nombres.append(Nations.display_name(String(id)))
		var hay_inicial: bool = false
		for nombre in nombres:
			if CareerTheme.empieza_por(String(nombre), _edits_inicial):
				hay_inicial = true
		if not hay_inicial and not nombres.is_empty():
			_edits_inicial = CareerTheme.inicial(String(nombres[0]))
		_indice_iniciales(mando, nombres, _edits_elige_inicial)
		if _edits_tipo == 2:
			for key in leyendas:
				if CareerTheme.empieza_por(Legends.pintado_de(key), _edits_inicial):
					var e: Dictionary = _legend_entry(key)
					if not e.is_empty():
						_legend_row(lista, e, true)
		else:
			var rejilla: GridContainer = GridContainer.new()
			rejilla.columns = 4
			rejilla.add_theme_constant_override("h_separation", 8)
			rejilla.add_theme_constant_override("v_separation", 8)
			lista.add_child(rejilla)
			for id in naciones:
				if CareerTheme.empieza_por(Nations.display_name(String(id)), _edits_inicial):
					_nation_row(rejilla, String(id), true)
	var muelle: Control = Control.new()
	muelle.size_flags_vertical = Control.SIZE_EXPAND_FILL
	mando.add_child(muelle)
	var quitar: Button = CareerUi.menu_row(I18n.t("QUITAR TODO LO EDITADO"), "")
	quitar.pressed.connect(_confirm_reset_all)
	mando.add_child(quitar)
	CareerUi.back_button(mando, _on_back)


func _edits_elige_tipo(i: int) -> void:
	_edits_tipo = i
	_render()


func _edits_elige_div(i: int) -> void:
	_edits_div = i + 1
	_render()


func _edits_elige_inicial(letra: String) -> void:
	_edits_inicial = letra
	_render()


func _edits_paises(paises: Array) -> void:
	var items: Array = []
	for pais in paises:
		items.append({"id": String(pais), "name": String(pais)})
	FlagPicker.open(self, I18n.t("PAIS"), items, _edits_pais,
		func(id: String) -> void:
			_edits_pais = id
			_edits_div = 1
			_render(), [_edits_pais])


func _edits_abre_roster(club: Dictionary) -> void:
	_edits_desde_roster = true
	_team = club
	_page = "roster"
	_render()




func _edited_slot_row(list: VBoxContainer, club: Dictionary, idx: int) -> void:
	var team_id: String = String(club.get("id", ""))
	var p: Dictionary = _slot_read(team_id, idx)


	if p.is_empty():
		return
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 84)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	b.text = ""
	b.pressed.connect(func() -> void:
		_team = Teams.by_id(team_id)
		_open_player(idx))
	list.add_child(b)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)


	row.offset_left = 46.0
	row.offset_right = -16.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 12)
	b.add_child(row)
	var pos: String = String(p.get("pos", "MC"))
	row.add_child(CareerUi.pos_chip(pos))
	var name_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	name_l.text = CareerUi.display_name(String(p.get("name", "")))
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	row.add_child(name_l)
	var ovr: OvrBadge = OvrBadge.new()
	ovr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ovr.setup(SquadMeta.ovr_of(p, pos), 30)
	row.add_child(ovr)
	_mute(row)




func _confirm_reset_all() -> void:
	if _carrera:


		_overlay(I18n.t("QUITAR TODO LO EDITADO"), [
			I18n.t("Todo lo que has tocado EN ESTA CARRERA vuelve a como estaba."),
			I18n.t("La base de datos global no se toca: sigue igual en todas las ranuras."),
			I18n.t("Los fichajes que hiciste aquí NO se deshacen: son parte de la partida."),
			I18n.t("Esto SI es para siempre."),
		], I18n.t("QUITAR TODO"), func() -> void:
			CareerEdits.clear_all()


			MisterEdits.clear_carrera()

			LegendEdits.clear_carrera()
			_page = "clubs"
			_render())
		return
	var lineas: Array = [
		I18n.t("Las plantillas, los traspasos, las caras y los escudos vuelven a la base de fábrica."),
	]


	if NationEdits.edited_count() > 0:
		lineas.append(I18n.t("Las selecciones vuelven a su uniforme y su convocatoria de fábrica."))
	lineas.append(I18n.t("Vale para todas las ranuras de partida, no solo para esta."))
	lineas.append(I18n.t("Esto SI es para siempre."))
	_overlay(I18n.t("QUITAR TODO LO EDITADO"), lineas, I18n.t("QUITAR TODO"), func() -> void:
		PackImport.clear_all()
		MisterEdits.clear_base()
		LegendEdits.clear_base()
		NationEdits.clear_all()
		_pack_info = {}
		_page = "clubs"
		_render())








const ROSTER_MANDO_W: float = 500.0



const FILA_ASIENTO_TUMBADA: float = 72.0


func _render_roster() -> void:
	var team_id: String = String(_team.get("id", ""))



	var partes: Array[VBoxContainer] = _partir_tumbado(ROSTER_MANDO_W)
	var mando: VBoxContainer = partes[0]
	var derecha: VBoxContainer = partes[1]
	if _pending_create():
		_swap_banner(mando, I18n.t("ELIGE EL ASIENTO QUE OCUPA"),
			I18n.t("Quien tenga ese asiento hoy SALE del juego; el nuevo\nhereda su puesto y su dorsal."))
	else:
		_swap_banner(mando, I18n.t("ELIGE CON QUIEN SE INTERCAMBIA"),
			I18n.t("Los dos jugadores se cambian de club; el puesto y el dorsal\nson del asiento, no viajan."))


	if not _notice.is_empty():
		var note: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.accent_text())
		note.text = _notice
		note.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		mando.add_child(note)
		_notice = ""


	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 16)
	mando.add_child(head)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(72, 72)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.set_team(_team)
	head.add_child(crest)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 4)
	head.add_child(col)
	var name_l: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(String(_team.get("name", "")))
	name_l.clip_text = true
	col.add_child(name_l)
	var sub_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)




	sub_l.text = I18n.tf("{0} · MEDIA {1}", [
		I18n.t(Teams.div_name(_div_of(team_id))).to_upper(),
		Squad.ovr_scale(float(Squad.media_once(team_id)))])
	col.add_child(sub_l)




	if _swap.is_empty():
		_stepper(mando, _pos_hermano(team_id), _hermanos_de(team_id).size(), _salta_club)


		_coach_row(mando, team_id, false)



	if not _swap.is_empty() and not _pending_create():
		var filt: Button = Button.new()



		filt.text = I18n.tf("SOLO SU POSICION ({0}): {1}", [I18n.t(String(_swap["pos"])),
			I18n.t("SI", "editor") if _same_pos else I18n.t("NO", "editor")])
		filt.custom_minimum_size = Vector2(0, 84)
		CareerTheme.apply_button(filt,
			CareerTheme.Kind.PRIMARY if _same_pos else CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
		filt.pressed.connect(func() -> void:
			_same_pos = not _same_pos
			_render())
		mando.add_child(filt)





	if _swap.is_empty():
		var acciones: HBoxContainer = HBoxContainer.new()
		acciones.add_theme_constant_override("separation", 10)
		mando.add_child(acciones)







		if not _carrera:


			var club_btn: Button = CareerUi.accion("pincel", I18n.t("EDITAR CLUB"),
				CareerTheme.NAV_MUNDO)
			club_btn.custom_minimum_size = Vector2(0, 84)
			club_btn.pressed.connect(_open_club)
			acciones.add_child(club_btn)
		else:



			var div_btn: Button = CareerUi.accion("torneos", I18n.t("CAMBIAR DE DIVISION"),
				CareerTheme.NAV_MUNDO)
			div_btn.custom_minimum_size = Vector2(0, 84)



			div_btn.disabled = not _can_swap_div()
			div_btn.pressed.connect(_start_div_swap)
			acciones.add_child(div_btn)
		var crear: Button = CareerUi.accion("ficha_vacia", I18n.t("CREAR JUGADOR"),
			CareerTheme.NAV_MUNDO)
		crear.custom_minimum_size = Vector2(0, 84)
		crear.pressed.connect(_open_create)
		acciones.add_child(crear)
		if _carrera and not _can_swap_div():
			CareerUi.dim(mando, I18n.t("La división solo se cambia con la temporada recién empezada: el calendario, la tabla y el bombo de copa ya están armados con las de ahora."))



		var ajustar: Button = CareerUi.accion("stats", I18n.t("SUBIR O BAJAR TODO EL CLUB"),
			CareerTheme.NAV_MUNDO)
		ajustar.pressed.connect(_open_shift)
		mando.add_child(ajustar)















	if _swap.is_empty():
		mando.add_child(CareerUi.segmented(
			[I18n.t("LISTA"), I18n.t("CANCHA")],
			0 if _roster_vista == "lista" else 1,
			func(k: int) -> void:
				_roster_vista = "lista" if k == 0 else "cancha"
				_render(),
			70.0))

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	derecha.add_child(scroll)
	var list: VBoxContainer = VBoxContainer.new()
	list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	list.add_theme_constant_override("separation", 8)
	scroll.add_child(list)

	var squad: Array = _squad_read(team_id)



	var meta: Array = _team_meta(team_id, squad)



	var visible: Array = []
	for i in squad.size():
		if not _swap.is_empty() and not _pending_create():



			if String(_swap["team_id"]) == team_id and int(_swap["idx"]) == i:
				continue
			if _same_pos and String(squad[i]["pos"]) != String(_swap["pos"]):
				continue
		visible.append(i)
	if visible.is_empty():
		CareerUi.dim(list, I18n.t("Nadie encaja aquí con el filtro puesto. Apágalo para ver el plantel completo."))
	elif _roster_vista == "cancha" and _swap.is_empty():
		_roster_cancha(list, team_id, squad, meta)
	else:










		var conv: Dictionary = _convocatoria(team_id, squad, meta)
		var vistos: Dictionary = {}
		for i in visible:
			vistos[int(i)] = true
		var bloques: Array = [
			[conv["once"], I18n.tf("— TITULARES · {0} —",
				[Squad.formation_of(team_id)])],
			[conv["banca"], I18n.t("— BANCA —")],
			[conv["resto"], I18n.t("— RESERVA —")],
		]
		for b in bloques:
			var idxs: Array = b[0]
			var puesto: bool = false
			for v in idxs:
				var i: int = int(v)
				if not vistos.has(i) or i >= mini(squad.size(), meta.size()):
					continue
				if not puesto:
					puesto = true
					var sep: Label = CareerUi.plain(CareerTheme.T_DIM,
						CareerTheme.TEXT_DIM)
					sep.text = String(b[1])
					sep.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER



					sep.clip_text = true
					list.add_child(sep)
				_player_row(list, team_id, i, squad[i], meta[i])


	if _swap.is_empty() and _team_edited(team_id):
		var reset: Button = Button.new()
		reset.text = I18n.t("QUITAR EDICIONES DEL CLUB")
		reset.custom_minimum_size = Vector2(0, 84)
		CareerTheme.apply_button(reset, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
		reset.pressed.connect(_confirm_reset_team.bind(team_id))
		mando.add_child(reset)

	CareerUi.back_button(mando, _on_back)































func _convocatoria(team_id: String, squad: Array, meta: Array) -> Dictionary:
	var slots: Array = Squad.formation_slots(team_id)
	var xi: Array = slots.slice(0, mini(Squad.STARTING_XI, slots.size()))
	var once: Array = Rotation.lineup(squad, meta, xi)
	var banca: Array = []
	if once.is_empty():
		for k in mini(Squad.STARTING_XI, squad.size()):
			once.append(k)
	else:




		banca = Rotation.bench(squad, meta, once, Squad.BENCH_SIZE, 1.0,
			slots.slice(Squad.STARTING_XI, Squad.STARTING_XI + Squad.BENCH_SIZE))
	if banca.is_empty():
		for k in range(mini(Squad.STARTING_XI, squad.size()),
				mini(Squad.STARTING_XI + Squad.BENCH_SIZE, squad.size())):
			if not once.has(k):
				banca.append(k)
	var puestos: Dictionary = {}
	for k in once.size():
		puestos[int(once[k])] = String(xi[k]) if k < xi.size() else "MC"
	var resto: Array = []
	for i in squad.size():
		if not once.has(i) and not banca.has(i):
			resto.append(i)
	return {"once": once, "banca": banca, "resto": resto, "puestos": puestos}









func _roster_cancha(list: VBoxContainer, team_id: String, squad: Array,
		meta: Array) -> void:
	var conv: Dictionary = _convocatoria(team_id, squad, meta)
	var once: Array = conv["once"]
	var puestos: Dictionary = conv["puestos"]




	var cap_i: int = _mejor_del_once(squad, once, "", puestos)
	var pen_i: int = _mejor_del_once(squad, once, "penal", puestos)
	var libre_i: int = _mejor_del_once(squad, once, "parado", puestos)



	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 10)
	list.add_child(cab)
	var tit: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	tit.text = CareerTheme.caps("%s · %s"
		% [I18n.t("EL ONCE"), Squad.formation_of(team_id)])
	tit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	tit.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tit.clip_text = true
	cab.add_child(tit)
	var med: OvrBadge = OvrBadge.new()
	med.custom_minimum_size = Vector2(58, 62)
	med.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cab.add_child(med)
	med.setup(Squad.ovr_scale(float(Squad.media_once(team_id))), 22)

	var pitch: PitchView = PitchView.new()
	pitch.custom_minimum_size = Vector2(0, 1180)
	list.add_child(pitch)
	var cards: Array = []
	var slots_once: Array = []
	for v in once:
		var i: int = int(v)
		cards.append(_roster_card(team_id, i, squad[i], meta[i], cap_i, pen_i, libre_i))
		slots_once.append(String(puestos.get(i, "MC")))
	for c in cards:
		pitch.add_child(c)




	_coloca_once(pitch, cards, slots_once)

	_roster_grid(list, I18n.t("BANCA"), "banquillo", team_id, squad, meta,
		conv["banca"], cap_i, pen_i, libre_i)
	_roster_grid(list, I18n.t("RESERVA"), "equipo", team_id, squad, meta,
		conv["resto"], cap_i, pen_i, libre_i)




func _coloca_once(pitch: PitchView, cards: Array, slots_once: Array) -> void:
	await get_tree().process_frame


	if is_instance_valid(pitch):
		pitch.place(cards, slots_once)









func _roster_grid(list: VBoxContainer, titulo: String, icono: String,
		team_id: String, squad: Array, meta: Array, idxs: Array,
		cap_i: int, pen_i: int, libre_i: int) -> void:



	if idxs.is_empty():
		return
	var ic: MenuIcon = MenuIcon.new()


	ic.setup(icono, CareerTheme.accent_text())
	CareerUi.head(list, titulo, ic)
	var filas: VBoxContainer = VBoxContainer.new()
	filas.add_theme_constant_override("separation", 10)
	filas.size_flags_horizontal = Control.SIZE_FILL
	list.add_child(filas)
	const COLS: int = 4
	var k: int = 0
	while k < idxs.size():
		var fila: HBoxContainer = HBoxContainer.new()
		fila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		filas.add_child(fila)
		_espaciador(fila)
		for n in range(k, mini(k + COLS, idxs.size())):
			var j: int = int(idxs[n])
			if j < 0 or j >= mini(squad.size(), meta.size()):
				continue
			fila.add_child(_roster_card(team_id, j, squad[j], meta[j],
				cap_i, pen_i, libre_i))
			_espaciador(fila)
		k += COLS



func _espaciador(fila: HBoxContainer) -> void:
	var sp: Control = Control.new()
	sp.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(sp)









func _roster_card(team_id: String, i: int, p: Dictionary, pm: Dictionary,
		cap_i: int, pen_i: int, libre_i: int) -> PlayerCard:




	var card: PlayerCard = PlayerCard.build(p, _team, String(pm.get("nation", "")),
		false, false,
		i == cap_i, Career.dias_baja_ficha(pm), -1,
		i == pen_i, i == libre_i)
	card.set_tap(func() -> void: _open_player(i))
	return card











func _mejor_del_once(squad: Array, once: Array, clave: String, puestos: Dictionary) -> int:
	var top_i: int = -1
	var top_v: int = -1
	for sel in once:
		var i: int = int(sel)
		if i < 0 or i >= squad.size():
			continue
		var p: Dictionary = squad[i]
		if String(puestos.get(i, p.get("pos", "MC"))) == "POR":
			continue
		var v: int = SquadMeta.ovr_of(p, String(p.get("pos", "MC"))) if clave.is_empty() \
				else int(p.get(clave, 0))
		if v > top_v:
			top_v = v
			top_i = i
	return top_i






const SHIFT_STEPS: Array[int] = [-5, -1, 1, 5]





func _open_shift() -> void:
	var team_id: String = String(_team.get("id", ""))
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	col.add_theme_constant_override("separation", 16)
	var t: Label = Label.new()
	CareerTheme.title(t, CareerTheme.T_TITLE_MODAL)
	t.text = I18n.t("AJUSTAR EL CLUB")
	col.add_child(t)
	var expl: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	expl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	expl.text = I18n.t("Suma o resta a TODAS las cualidades de los 23 asientos.")
	col.add_child(expl)
	var lim: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	lim.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	lim.text = I18n.tf("Nada baja de {0} ni pasa de {1}. Se deshace entero con QUITAR EDICIONES DEL CLUB.",
		[SquadEdits.STAT_MIN, SquadEdits.STAT_MAX])
	col.add_child(lim)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	col.add_child(row)




	var cerrar_ref: Array = [null]
	for step in SHIFT_STEPS:
		var b: Button = Button.new()


		b.text = "%+d" % int(step)
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b,
			CareerTheme.Kind.WARN if int(step) < 0 else CareerTheme.Kind.PRIMARY,
			CareerTheme.T_CARD)
		b.pressed.connect(func() -> void:



			if not _team_shift(team_id, int(step)):
				CareerUi.close_modal(cerrar_ref[0])
				_aviso(I18n.t("NO CABE"), I18n.tf(
					"Esta carrera ya tiene {0} asientos editados, que es el tope.",
					[CareerEdits.MAX_SLOTS]))
				return


			_render())
		row.add_child(b)
	var cerrar: Button = Button.new()
	cerrar_ref[0] = cerrar
	cerrar.text = I18n.t("LISTO")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.BTN_ROW_FONT)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	col.add_child(cerrar)
	CareerUi.normalize_caps(col)




func _player_row(list: VBoxContainer, team_id: String, i: int,
		p: Dictionary, pm: Dictionary) -> void:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, FILA_ASIENTO_TUMBADA if UiKit.es_horizontal() else 96.0)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
	b.text = ""
	if _swap.is_empty():
		b.pressed.connect(_open_player.bind(i))
	else:
		b.pressed.connect(_confirm_swap.bind(team_id, i))
	list.add_child(b)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 14.0
	row.offset_right = -16.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_theme_constant_override("separation", 12)
	b.add_child(row)
	var num: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	num.text = "%d" % int(p.get("number", i + 1))
	num.custom_minimum_size = Vector2(38, 0)
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(num)
	var pos: String = String(p.get("pos", "MC"))
	var ovr: OvrBadge = OvrBadge.new()
	ovr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ovr.setup(SquadMeta.ovr_of(p, pos), 30)
	row.add_child(ovr)
	row.add_child(CareerUi.pos_chip(pos))
	var name_l: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)


	name_l.text = CareerUi.display_name(String(p.get("name", "")))
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	row.add_child(name_l)
	if _slot_edited(team_id, i):
		var dot: ColorRect = ColorRect.new()
		dot.color = CareerTheme.accent()
		dot.custom_minimum_size = Vector2(10, 10)
		dot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(dot)
	var flag: TextureRect = Flags.make_rect(String(pm.get("nation", "")), 22.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(flag)
	var age_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	age_l.text = "%d" % int(pm.get("age", 26))
	age_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(age_l)

	_mute(row)




	if i == _flash_idx:
		_flash_idx = -1
		b.modulate = CareerTheme.accent_text()
		b.create_tween().tween_property(b, "modulate", Color.WHITE, 0.35) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)



func _open_player(i: int) -> void:
	_tope_avisado = false
	_idx = i
	_page = "player"
	_render()









const FICHA_QUIEN_W: float = 640.0
const FICHA_CUALIDADES_W: float = 600.0


func _render_player() -> void:
	var team_id: String = String(_team.get("id", ""))
	_edit_player = _slot_read(team_id, _idx)
	var pos: String = String(_edit_player.get("pos", "MC"))



	var cols: Array[VBoxContainer] = _columnas_tumbadas([FICHA_QUIEN_W, 0.0, FICHA_CUALIDADES_W])
	var quien: VBoxContainer = cols[0]
	var juega: VBoxContainer = cols[1]
	var vale: VBoxContainer = cols[2]






	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 14)
	quien.add_child(head)
	var bust: PlayerAvatar = PlayerAvatar.new()
	bust.custom_minimum_size = Vector2(76, 92)
	bust.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	bust.set_look(_look_for_slot(team_id, _idx, _edit_player))
	head.add_child(bust)
	var num: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT_DIM)
	num.text = "%d" % int(_edit_player.get("number", _idx + 1))
	num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	head.add_child(num)
	head.add_child(CareerUi.pos_chip(pos))
	_edit_badge = OvrBadge.new()
	_edit_badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_edit_badge.setup(SquadMeta.ovr_of(_edit_player, pos), 34)
	head.add_child(_edit_badge)
	var club_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	club_l.text = CareerTheme.caps(String(_team.get("name", "")))
	club_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	club_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	club_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	club_l.clip_text = true


	club_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	head.add_child(club_l)




	_stepper(quien, _idx, _squad_read(team_id).size(), _salta_jugador)



	_name_edit = LineEdit.new()
	_name_edit.max_length = SquadEdits.NAME_MAX
	_name_edit.text = String(_edit_player.get("name", ""))
	_name_edit.custom_minimum_size = Vector2(0, 96)
	_name_edit.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	_name_edit.virtual_keyboard_enabled = true
	_style_line_edit(_name_edit)
	var edit: LineEdit = _name_edit
	_name_edit.text_submitted.connect(func(_t: String) -> void: _commit_name(edit))
	_name_edit.focus_exited.connect(func() -> void: _commit_name(edit))
	quien.add_child(_name_edit)





















	var data_row: HBoxContainer = HBoxContainer.new()
	data_row.add_theme_constant_override("separation", 10)
	quien.add_child(data_row)
	_age_label = _build_cycler(data_row, I18n.t("EDAD"), _step_age)



	_num_label = _build_cycler(data_row, I18n.t("DORSAL"), _step_num)






	if _page == "player":
		_pot_label = _build_cycler(data_row, I18n.t("POTENCIAL"), _step_pot)
	else:
		_pot_label = null
	_build_nation_selector(quien)
	_refresh_data_row()

	_poss_grid(juega, pos)



	var card: PanelContainer = CareerUi.chip()
	vale.add_child(card)
	var stats_col: VBoxContainer = VBoxContainer.new()
	stats_col.add_theme_constant_override("separation", 10)
	card.add_child(stats_col)




	var visibles: Array = Squad.stat_keys_for(pos)
	for entry in STAT_LABELS:
		if not visibles.has(String(entry[0])):
			continue
		_stat_slider(stats_col, String(entry[0]), String(entry[1]), _edit_player,
			func() -> void:
				_commit_player()




				_refresh_player_undo())
	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("Cada puesto se mide por sus cualidades. Se guarda solo.")


	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	stats_col.add_child(foot)



	var sec: HBoxContainer = HBoxContainer.new()
	sec.add_theme_constant_override("separation", 10)
	juega.add_child(sec)

	var fisico: Button = CareerUi.accion("espejo", I18n.t("FISICO"), CareerTheme.NAV_MUNDO)
	fisico.custom_minimum_size = Vector2(0, 84)
	fisico.pressed.connect(_open_look)
	sec.add_child(fisico)
	var dup: Button = CareerUi.accion("ficha", I18n.t("DUPLICAR"), CareerTheme.NAV_MUNDO)
	dup.custom_minimum_size = Vector2(0, 84)
	dup.pressed.connect(_duplicate_player)
	sec.add_child(dup)
	juega.add_child(CareerUi.primary_cta(I18n.t("TRASPASAR"), _start_swap))



	_player_undo = Button.new()
	_player_undo.text = I18n.t("QUITAR EDICION (VOLVER AL DE BASE)")
	_player_undo.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button(_player_undo, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	_player_undo.pressed.connect(func() -> void:
		_slot_clear(team_id, _idx)
		_render())
	quien.add_child(_player_undo)
	_refresh_player_undo()

	var spring: Control = Control.new()
	spring.size_flags_vertical = Control.SIZE_EXPAND_FILL
	quien.add_child(spring)
	CareerUi.back_button(quien, _on_back)






func _refresh_player_undo() -> void:
	if not is_instance_valid(_player_undo):
		return
	var debe: bool = _slot_edited(String(_team.get("id", "")), _idx)


	if debe and not _player_undo.visible:
		_player_undo.visible = true


		_player_undo.modulate.a = 0.0
		_player_undo.create_tween().tween_property(_player_undo, "modulate:a", 1.0, 0.12)
	else:
		_player_undo.visible = debe







func _stat_slider(parent: VBoxContainer, key: String, label_text: String,
		target: Dictionary, on_commit: Callable) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	parent.add_child(row)
	var name_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)



	name_l.text = I18n.t(label_text)
	name_l.custom_minimum_size = Vector2(250, 0)
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(name_l)
	var val_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.accent_text())
	val_l.text = "%d" % int(target.get(key, 70))
	val_l.custom_minimum_size = Vector2(56, 0)
	val_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	val_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(val_l)
	var slider: HSlider = HSlider.new()
	slider.min_value = SquadEdits.STAT_MIN
	slider.max_value = SquadEdits.STAT_MAX
	slider.step = 1
	slider.value = int(target.get(key, 70))
	slider.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	slider.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	slider.custom_minimum_size = Vector2(0, 44)



	UiKit.style_slider(slider)
	slider.value_changed.connect(func(v: float) -> void:
		target[key] = int(v)
		val_l.text = "%d" % int(v)
		_edit_badge.setup(SquadMeta.ovr_of(target,
			String(target.get("pos", "MC"))), 34)



		if is_instance_valid(_pot_label):
			_pot_label.text = "%d" % _pot_actual())
	slider.drag_ended.connect(func(changed: bool) -> void:
		if changed and on_commit.is_valid():
			on_commit.call())
	row.add_child(slider)









func _cycler_row(parent: Container) -> HBoxContainer:
	var hueco: MarginContainer = MarginContainer.new()
	hueco.add_theme_constant_override("margin_top", 12)
	parent.add_child(hueco)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	hueco.add_child(row)
	return row


func _build_cycler(parent: HBoxContainer, caption: String, on_step: Callable) -> Label:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 4)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(col)



	if not caption.is_empty():
		var cap: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		cap.text = caption
		col.add_child(cap)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 4)
	col.add_child(row)
	var prev: Button = _arrow("<")
	prev.custom_minimum_size = Vector2(44, 64)
	prev.pressed.connect(func() -> void: on_step.call(-1))
	row.add_child(prev)
	var val: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	val.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	val.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	val.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	val.clip_text = true
	row.add_child(val)
	var nxt: Button = _arrow(">")
	nxt.custom_minimum_size = Vector2(44, 64)
	nxt.pressed.connect(func() -> void: on_step.call(1))
	row.add_child(nxt)
	return val






func _build_nation_selector(parent: Container = null) -> void:
	if parent == null:
		parent = _body
	CareerUi.head(parent, I18n.t("NACION"))
	var btn: Button = CareerUi.selector_button(88, 32.0, CareerTheme.T_MONEY)
	_nation_flag = btn.get_meta("flag")
	_nation_label = btn.get_meta("label")
	btn.pressed.connect(_open_nation_picker)
	parent.add_child(btn)












func _canon_nation(v: String) -> String:
	var n: Dictionary = Nations.by_id(v)
	if not n.is_empty():
		return String(n["id"])
	return Nations.id_for_country(v)




















func _nation_items() -> Array:
	var out: Array = []
	var seen: Dictionary = {}
	for n in Nations.POOL:
		var id: String = _canon_nation(String((n as Dictionary)["id"]))
		if seen.has(id):
			continue
		seen[id] = true
		out.append({"id": id, "name": CareerTheme.caps(Nations.display_name(id))})
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return String(a["name"]).naturalnocasecmp_to(String(b["name"])) < 0)
	return out


func _open_nation_picker() -> void:
	var target: Dictionary = _edit_player if _page == "player" else _draft
	var cur: String = _canon_nation(String(target.get("nation", NATION_POOL[0])))


	var sug: Array = [cur]
	var home: String = _canon_nation(_current_country())
	if not sug.has(home):
		sug.append(home)
	FlagPicker.open(self, I18n.t("NACION"), _nation_items(), cur,
		func(id: String) -> void:
			target["nation"] = id
			_refresh_data_row()
			if _page == "player":
				_commit_player(),
		sug)




func _refresh_data_row() -> void:
	var target: Dictionary = _edit_player if _page == "player" else _draft
	if is_instance_valid(_age_label):
		_age_label.text = "%d" % int(target.get("age", 24))
	if is_instance_valid(_nation_label):
		var nat: String = String(target.get("nation", NATION_POOL[0]))




		_nation_label.text = CareerTheme.caps(Nations.display_name(_canon_nation(nat)))
		if is_instance_valid(_nation_flag):
			_nation_flag.texture = Flags.texture(nat)
	if is_instance_valid(_num_label):
		_num_label.text = "%d" % int(target.get("number", _idx + 1))
	if is_instance_valid(_pot_label):
		_pot_label.text = "%d" % _pot_actual()











func _step_num(dir: int) -> void:
	var target: Dictionary = _edit_player if _page == "player" else _draft
	var actual: int = int(target.get("number", _idx + 1))
	var quiero: int = clampi(actual + dir, SquadEdits.NUM_MIN, SquadEdits.NUM_MAX)
	if quiero == actual:
		return
	target["number"] = quiero
	if _page == "player":
		_swap_number(String(_team.get("id", "")), _idx, actual, quiero)
		_commit_player()
	_refresh_data_row()







func _swap_number(team_id: String, idx: int, suelto: int, quiero: int) -> void:
	if team_id.is_empty():
		return
	var squad: Array = _squad_read(team_id)
	for i in squad.size():
		if i == idx or int(squad[i].get("number", 0)) != quiero:
			continue
		var otro: Dictionary = _slot_read(team_id, i)
		otro["number"] = suelto
		if not _slot_write(team_id, i, otro):
			_aviso_tope()
		return










func _pot_actual() -> int:
	var target: Dictionary = _edit_player if _page == "player" else _draft
	if int(target.get("pot", -1)) > 0:
		return int(target["pot"])
	return WorldAging.peak_ovr(target, String(target.get("pos", "MC")),
		int(target.get("age", 24)), 0)





func _step_pot(dir: int) -> void:
	var target: Dictionary = _edit_player if _page == "player" else _draft
	var pos_p: String = String(target.get("pos", "MC"))
	var edad_p: int = int(target.get("age", 24))
	var desde: int = _pot_actual()







	var pedido: int = desde
	for _i in SquadEdits.POT_MAX - SquadEdits.POT_MIN:
		pedido = clampi(pedido + dir, SquadEdits.POT_MIN, SquadEdits.POT_MAX)
		var real: int = WorldAging.techo_alcanzable(target, pos_p, edad_p, 0, pedido)
		if real != desde:
			target["pot"] = real
			_refresh_data_row()
			if _page == "player":
				_commit_player()
			return
		if pedido == SquadEdits.POT_MIN or pedido == SquadEdits.POT_MAX:
			return


func _step_age(dir: int) -> void:
	var target: Dictionary = _edit_player if _page == "player" else _draft
	target["age"] = clampi(int(target.get("age", 24)) + dir,
		SquadEdits.AGE_MIN, SquadEdits.AGE_MAX)
	_refresh_data_row()
	if _page == "player":
		_commit_player()

























func _poss_grid(parent: Container, pos: String) -> void:




	CareerUi.head(parent, I18n.t("SABE JUGAR DE"))
	if not _poss_warn.is_empty():
		var warn_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.DANGER)
		warn_l.text = _poss_warn


		warn_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		parent.add_child(warn_l)
		_poss_warn = ""
	var marcados: Array = _poss_vista(pos)
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	parent.add_child(flow)
	for key in SquadEdits.POS_KEYS:
		var p: String = String(key)
		var marcado: bool = marcados.has(p)




		var ovr: int = SquadMeta.ovr_of(_edit_player, p) if marcado else 0
		var chip: Button = CareerUi.pos_check(p, marcado, p == pos, ovr)
		chip.pressed.connect(func() -> void: _toggle_poss(p))
		flow.add_child(chip)
	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)



	foot.text = I18n.tf("El primero es su puesto (hoy {0}) y el número es su OVR ahí: quítalo y pasa al siguiente. Hasta {1}, y viajan con la persona.",
		[CareerUi.pos_rotulo(pos), Squad.POS_MAX])
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	parent.add_child(foot)









func _poss_vista(pos: String) -> Array:
	var fuera: Array = [pos]
	for v in Squad.poss_of(_edit_player):
		var p: String = String(v)
		if p != pos and not fuera.has(p):
			fuera.append(p)
	return fuera.slice(0, Squad.POS_MAX)

















func _toggle_poss(key: String) -> void:
	var team_id: String = String(_team.get("id", ""))
	var pos: String = String(_edit_player.get("pos", "MC"))
	var lista: Array = _poss_vista(pos)
	var quitar: bool = lista.has(key)
	var nueva: Array = []
	if key == "POR" or pos == "POR":


		if quitar and key == "POR" and pos == "POR":
			_poss_warn = I18n.t("MARCA SU PUESTO DE CAMPO: ASI SALE DEL ARCO.")
			_render()
			return
		if quitar:


			_poss_warn = I18n.t("EL ARCO ES EXCLUYENTE: UN PORTERO NO JUEGA DE NADA MAS.")
			_render()
			return
		nueva = [key]
	elif quitar:
		if lista.size() <= 1:
			_poss_warn = I18n.t("AL MENOS UN PUESTO: MARCA OTRO ANTES DE QUITAR ESTE.")
			_render()
			return
		nueva = lista.duplicate()
		nueva.erase(key)
	else:
		if lista.size() >= Squad.POS_MAX:
			_poss_warn = I18n.tf("HASTA {0} PUESTOS: QUITA UNO PARA PONER OTRO.",
				[Squad.POS_MAX])
			_render()
			return
		nueva = lista.duplicate()
		nueva.append(key)
	var nuevo_pos: String = String(nueva[0])
	if nuevo_pos != pos and SquadEdits.would_break_protected_pos(team_id, _idx, nuevo_pos):
		_poss_warn = I18n.tf("ES EL ULTIMO {0} DEL CLUB: MARCA A OTRO PRIMERO.",
			[CareerUi.pos_rotulo(pos)])
		_render()
		return
	_edit_player["pos"] = nuevo_pos
	_edit_player["poss"] = nueva
	_commit_player()



	_render()


func _commit_name(edit: LineEdit) -> void:
	var clean: String = edit.text.strip_edges()
	if clean.is_empty():




		return
	if clean == String(_edit_player.get("name", "")):
		return






	var look_hoy: Variant = _edit_player.get("look", null)
	if not (look_hoy is Dictionary) or (look_hoy as Dictionary).is_empty():
		_edit_player["look"] = _look_traits(String(_team.get("id", "")), _idx,
			_edit_player)
	_edit_player["name"] = clean
	_commit_player()
	_render()


func _commit_player() -> void:
	if not _slot_write(String(_team.get("id", "")), _idx, _edit_player):
		_aviso_tope()





var _tope_avisado: bool = false


func _aviso_tope() -> void:
	if _tope_avisado:
		return
	_tope_avisado = true
	_aviso(I18n.t("NO CABE"), I18n.tf(
		"Esta carrera ya tiene {0} asientos editados, que es el tope. Quita alguno en MIS EDICIONES.",
		[CareerEdits.MAX_SLOTS]))


func _style_line_edit(edit: LineEdit) -> void:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(1)
	sb.set_corner_radius_all(4)
	sb.set_content_margin_all(18.0)
	edit.add_theme_stylebox_override("normal", sb)
	var focus_sb: StyleBoxFlat = sb.duplicate()
	focus_sb.border_color = CareerTheme.accent()
	focus_sb.set_border_width_all(2)
	edit.add_theme_stylebox_override("focus", focus_sb)
	edit.add_theme_color_override("font_color", CareerTheme.TEXT)
	edit.add_theme_color_override("font_placeholder_color", CareerTheme.TEXT_DIM)
	edit.add_theme_color_override("caret_color", CareerTheme.accent_text())












func _look_for_slot(team_id: String, idx: int, player: Dictionary) -> Dictionary:
	var cfg: Dictionary = _look_traits(team_id, idx, player)








	cfg.merge(GameState.kit_variant(Teams.by_id(team_id), 0), true)
	return cfg





func _look_traits(team_id: String, idx: int, player: Dictionary) -> Dictionary:
	var cfg: Dictionary = _look_read(team_id, idx)
	if cfg.is_empty():
		cfg = KitRecolor.traits_for(String(player.get("name", "")))
	return _full_look(cfg)







static func _full_look(cfg: Dictionary) -> Dictionary:
	var out: Dictionary = {
		"skin": cfg.get("skin", KitRecolor.REF_SKIN),
		"hair": cfg.get("hair", KitRecolor.REF_HAIR),
		"hair_style": String(cfg.get("hair_style", "normal")),
		"facial_hair": String(cfg.get("facial_hair", "none")),
	}
	for key in SquadEdits.LOOK_COLOR_OPT + SquadEdits.LOOK_STYLE_OPT:
		if cfg.has(key):
			out[key] = cfg[key]
	return out


func _open_look() -> void:


	_flush_name()
	_look_draft = false
	_look_cfg = _look_traits(String(_team.get("id", "")), _idx, _edit_player)
	_page = "look"
	_render()






func _open_draft_look() -> void:
	if is_instance_valid(_name_edit):
		_draft["name"] = _name_edit.text.strip_edges()
	_look_draft = true
	_look_cfg = _draft_look()
	_page = "look"
	_render()





func _draft_look() -> Dictionary:
	var cfg: Variant = _draft.get("look", null)
	if not (cfg is Dictionary) or (cfg as Dictionary).is_empty():
		cfg = KitRecolor.traits_for(String(_draft.get("name", "")))
	return _full_look(cfg)


func _render_look() -> void:
	var team_id: String = String(_team.get("id", ""))
	CareerUi.head(_body, I18n.t("FISICO"))
	var who: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)

	who.text = "%s · %s" % [
		CareerUi.display_name(String(_draft.get("name", "")) if _look_draft \
				else String(_edit_player.get("name", ""))),
		CareerTheme.caps(String(_team.get("name", "")))]
	who.clip_text = true
	_body.add_child(who)






	_build_look_mirror(team_id)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_body.add_child(scroll)
	var look: LookEditor = LookEditor.new()
	look.size_flags_horizontal = Control.SIZE_EXPAND_FILL







	look.view = "fisico,uniforme"




	look.set_cfg(_look_cfg)
	look.changed.connect(_on_slot_look_changed)
	scroll.add_child(look)

	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)



	foot.text = I18n.t("Nace con esta cara. El alta no se confirma hasta elegir asiento.") \
			if _look_draft \
			else I18n.t("La cara viaja con la persona: si la traspasas, se la lleva. Se guarda solo.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_body.add_child(foot)





	_look_undo = Button.new()
	_look_undo.text = I18n.t("QUITAR FISICO (VOLVER AL DE FABRICA)")
	_look_undo.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button(_look_undo, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	_look_undo.pressed.connect(_clear_slot_look)
	_look_undo.visible = _draft.has("look") if _look_draft \
			else not _look_read(team_id, _idx).is_empty()
	_body.add_child(_look_undo)

	CareerUi.back_button(_body, _on_back)




func _on_slot_look_changed(cfg: Dictionary) -> void:
	_look_cfg = _full_look(cfg)
	if _look_draft:

		_draft["look"] = _look_cfg
	else:
		_edit_player["look"] = _look_cfg
		_commit_player()
	_refresh_look_preview()
	if is_instance_valid(_look_undo):
		_look_undo.visible = true





func _clear_slot_look() -> void:
	if _look_draft:
		_draft.erase("look")
		_look_cfg = _draft_look()
		_render()
		return
	_edit_player.erase("look")
	_commit_player()
	_look_cfg = _look_traits(String(_team.get("id", "")), _idx, _edit_player)
	_render()








func _build_look_mirror(team_id: String, parent: Container = null) -> void:
	if parent == null:
		parent = _body




	_look_club = team_id
	_look_stage = null
	_look_preview = null
	if not LockerStage.headless():
		_look_stage = LockerStage.new()
		_look_stage.club = Teams.by_id(team_id)
		_look_stage.div = int(Teams.by_id(team_id).get("div", 3))
		_look_stage.look = _look_preview_cfg()
		_look_stage.custom_minimum_size = Vector2(0, LOOK_BAND)
		_look_stage.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		parent.add_child(_look_stage)
		if not _look_stage.ok():
			_look_stage.queue_free()
			_look_stage = null
	if _look_stage == null:
		var plate: PanelContainer = CareerUi.plate()
		parent.add_child(plate)
		_look_preview = TextureRect.new()
		_look_preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		_look_preview.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		_look_preview.custom_minimum_size = Vector2(0, 300)
		plate.add_child(_look_preview)
	_refresh_look_preview()





func _look_preview_cfg() -> Dictionary:
	var cfg: Dictionary = _look_cfg.duplicate()



	var club: Dictionary = Teams.by_id(_look_club)
	if not club.is_empty():
		cfg.merge(GameState.kit_variant(club, 0), true)
	return cfg


func _refresh_look_preview() -> void:
	var cfg: Dictionary = _look_preview_cfg()
	if _look_stage != null and is_instance_valid(_look_stage):
		_look_stage.set_look(cfg)
	elif is_instance_valid(_look_preview):
		_look_preview.texture = KitRecolor.apply(PLAYER_TEX, cfg)















const PATTERN_NAMES: Dictionary = {
	"solid": "LISO", "stripes": "RAYAS", "hoops": "AROS", "half": "MITADES",
	"sleeves": "MANGAS", "pinstripes": "RAYA FINA", "sash": "BANDA",
	"diagonal": "DIAGONAL", "checkers": "CUADROS", "band_v": "FRANJA VERTICAL",
	"band_h": "FRANJA PECHO",
}




const SHORT_PAT_NAMES: Dictionary = {
	"solid": "LISO", "filo": "FILO", "doble_filo": "DOBLE FILO", "ribete": "RIBETE",
	"filo_ribete": "FILO Y RIBETE", "panel": "PANEL", "abertura": "ABERTURA",
}
const SOCK_PAT_NAMES: Dictionary = {
	"solid": "LISO", "vuelta_fina": "VUELTA FINA", "vuelta_dos": "DOBLE VUELTA",
	"dos_rayas": "DOS RAYAS", "raya_alta": "RAYA ALTA", "banda": "BANDA ANCHA",
	"aros_anchos": "AROS ANCHOS", "vuelta": "VUELTA DE COLOR", "franja": "FRANJA", "aros": "AROS",
	"dos_franjas": "DOS FRANJAS",
}
const SHAPE_NAMES: Dictionary = {
	"shield": "ESCUDO", "round": "REDONDO", "scudetto": "SCUDETTO",
	"hex": "HEXAGONO", "pennant": "BANDERIN", "diamond": "ROMBO",
	"banner": "ESTANDARTE", "keystone": "TRAPECIO", "french": "FRANCES",
	"spade": "PICA", "rounded_square": "CUADRADO",
}
const CREST_PATTERN_NAMES: Dictionary = {
	"solid": "LISO", "halved": "MITADES", "pale": "PALO", "fess": "FAJA",
	"vstripes": "RAYAS", "hoops": "AROS", "quartered": "CUARTELES",
	"sash": "BANDA", "cross": "CRUZ", "chevron": "CHEVRON", "chief": "JEFE",
	"base": "PIE", "bordure": "ORLA", "per_bend": "DIAGONAL", "pile": "PUNTA",
	"lozenge": "ROMBOS", "tri_stripes": "TRICOLOR",
}
const TONE_NAMES: Dictionary = {
	"alt": "SEGUNDO COLOR", "dark": "OSCURO", "light": "CLARO",
}
const EMBLEM_NAMES: Dictionary = {
	"none": "NADA", "letters": "LETRAS", "monogram": "INICIAL", "star": "ESTRELLA",
	"double_star": "DOS ESTRELLAS", "ring": "ARO", "ball": "BALON",
	"eagle": "AGUILA", "bull": "TORO", "crown": "CORONA", "bolt": "RAYO",
	"crescent": "LUNA", "tower": "TORRE", "anchor": "ANCLA", "gear": "ENGRANE",
	"leaf": "HOJA",
}
const RIM_NAMES: Dictionary = {
	"dark": "OSCURO", "gold": "ORO", "white": "BLANCO", "black": "NEGRO",
}




const FOOTPRINT_NAMES: Dictionary = {
	"": "AUTOMATICA",
	"bowl_closed": "CUENCO CERRADO", "rect_open": "CUATRO TRIBUNAS",
	"horseshoe": "HERRADURA", "main_L": "TRIBUNA EN L", "two_side": "DOS TRIBUNAS",
	"athletics": "CON PISTA", "bowl_round": "CUENCO REDONDO", "coliseo": "COLISEO",
	"octagono": "OCTAGONO", "catedral": "CATEDRAL", "velas": "VELAS",
	"ucl_anillos": "DOS ANILLOS", "mundial_membrana": "MEMBRANA",
	"eul_principal": "TRIBUNA ALTA", "conf_caldera": "CALDERA",
	"principal_doble": "TRIBUNA DOBLE", "cubierta_membrana": "TECHO DE TELA",
	"fondo_kop": "FONDO ALTO", "fondo_bloques": "FONDO EN BLOQUES",
	"sin_fondo_arboles": "SIN FONDO, ARBOLES", "dos_aguas": "TECHO A DOS AGUAS",
	"campo_hundido": "CAMPO HUNDIDO", "pantallon": "PANTALLA GIGANTE",
	"fondo_arco": "ARCO AL FONDO", "terraplen": "TERRAPLEN", "gradas_tubo": "GRADAS TUBO",
	"muro_de_pie": "MURO DE PIE", "tres_anillos": "TRES ANILLOS",
	"fondo_banderas": "FONDO DE BANDERAS", "tribuna_postes": "TRIBUNA CON POSTES",
	"torre_reloj": "TORRE DEL RELOJ", "campo_coches": "CAMPO CON COCHES",
	"fondo_chimeneas": "FONDO DE CHIMENEAS", "piel_envolvente": "PIEL ENVOLVENTE",
	"lateral_plano": "LATERAL PLANO", "anillo_colgado": "ANILLO COLGADO",
	"techo_dientes": "TECHO DE DIENTES", "columnata": "COLUMNATA",
	"cubierta_flotante": "TECHO FLOTANTE", "torres_rampa": "TORRES CON RAMPA",
	"calabaza": "CALABAZA", "puerta_monumental": "PUERTA MONUMENTAL",
	"ola_vidrio": "OLA DE VIDRIO", "cu_olimpico": "OLIMPICO DE PIEDRA",
	"azteca_coloso": "COLOSO", "bombonera": "CAJON VERTICAL",
	"monumental_river": "HERRADURA DE TRES PISOS", "camp_nou": "TRES GRADAS ABIERTAS",
}


func _open_club(desde_lista: bool = false) -> void:
	_page = "club"
	_club_desde_lista = desde_lista



	_club_slot = 0
	_render()






const CLUB_MANDO_W: float = 560.0


func _render_club() -> void:
	var team_id: String = String(_team.get("id", ""))


	_team = Teams.by_id(team_id)
	_club_labels = {}
	_club_swatches = {}
	_club_brand_logos = {}




	var partes: Array[VBoxContainer] = _partir_tumbado(CLUB_MANDO_W)
	var mando: VBoxContainer = partes[0]
	CareerUi.head(mando, I18n.t("CLUB"))



	_stepper(mando, _pos_hermano(team_id), _hermanos_de(team_id).size(), _salta_club)



	var head: BoxContainer = VBoxContainer.new() if UiKit.es_horizontal() \
			else HBoxContainer.new()
	head.add_theme_constant_override("separation", 16)
	mando.add_child(head)
	_club_crest = CrestView.new()
	_club_crest.custom_minimum_size = Vector2(128, 128)
	_club_crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_club_crest.size_flags_horizontal = Control.SIZE_SHRINK_CENTER




	var tumbado: bool = UiKit.es_horizontal()
	if tumbado:
		var escudo_fila: HBoxContainer = HBoxContainer.new()
		escudo_fila.add_theme_constant_override("separation", 16)
		head.add_child(escudo_fila)
		escudo_fila.add_child(_club_crest)
		var siglas: VBoxContainer = VBoxContainer.new()
		siglas.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		siglas.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		escudo_fila.add_child(siglas)
		var siglas_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		siglas_l.text = I18n.t("SIGLAS (VAN EN EL ESCUDO)")
		siglas_l.clip_text = true
		siglas.add_child(siglas_l)
		_club_abbrev_edit = _club_line_edit(siglas, String(_team.get("abbrev", "")),
			TeamEdits.ABBREV_MAX, _commit_club_text)
	else:
		head.add_child(_club_crest)
	var plate: PanelContainer = CareerUi.plate()
	plate.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	head.add_child(plate)






	var tira: HBoxContainer = HBoxContainer.new()
	tira.add_theme_constant_override("separation", 6)
	plate.add_child(tira)
	_club_previews = []
	for slot in KIT_SLOT_PREFIX.size():
		tira.add_child(_club_kit_pick(slot))

	var list: VBoxContainer = _scroll_list(partes[1])



	CareerUi.head(list, I18n.t("NOMBRE"))
	_club_name_edit = _club_line_edit(list, String(_team.get("name", "")),
		TeamEdits.NAME_MAX, _commit_club_text)
	if not tumbado:
		CareerUi.head(list, I18n.t("SIGLAS (VAN EN EL ESCUDO)"))
		_club_abbrev_edit = _club_line_edit(list, String(_team.get("abbrev", "")),
			TeamEdits.ABBREV_MAX, _commit_club_text)









	CareerUi.head(list, I18n.t("DIVISION"))
	var div_btn: Button = CareerUi.menu_row(
		I18n.t(Teams.div_name(_div_of(team_id))).to_upper(),
		I18n.t("CAMBIAR"),
		CareerTheme.accent_text() if TeamEdits.div_moved(team_id) \
				else CareerTheme.TEXT_DIM)
	div_btn.pressed.connect(_start_div_swap)
	list.add_child(div_btn)
	var div_foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	div_foot.text = I18n.t("Se INTERCAMBIA con un club de otra división del mismo país: uno sube y el otro baja, y cada liga sigue con los mismos equipos.")
	div_foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(div_foot)








	_club_estadio_block(list)
	if not _carrera:
		_club_derbi_block(list, team_id)









	if not tumbado:
		CareerUi.head(list, I18n.tf("UNIFORME · {0}",
			[I18n.t(KIT_SLOT_NAMES[_club_slot])]))
	var pre: String = KIT_SLOT_PREFIX[_club_slot]
	_club_color_row(list, I18n.t("Playera"), pre + "kit")
	_club_color_row(list, I18n.t("Shorts"), pre + "kit2")





	var patron: Container = _seccion_tumbada(list, I18n.t("PATRON"))
	_club_cycler(_cycler_row(patron), "", pre + "pattern", PATTERN_NAMES)
	_club_color_row(patron, I18n.t("Acento del patrón"), pre + "kit_b")
	var pat_foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)





	pat_foot.text = I18n.t("El acento solo se ve si la playera lleva patrón.") \
			if _club_slot == 0 else \
			I18n.t("Este uniforme se genera solo cada temporada. El club lo estrena tal cual en la temporada en que lo elijas, y a partir de ahí sigue cambiando de color y dibujo cada año.")
	pat_foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	patron.add_child(pat_foot)
	_club_detalles_block(list, pre)

	CareerUi.head(list, I18n.t("ESCUDO"))
	var crest_a: HBoxContainer = _cycler_row(list)



	_club_cycler(crest_a, I18n.t("FORMA", "escudo"), "shape", SHAPE_NAMES)
	_club_cycler(crest_a, I18n.t("FONDO"), "crest_pattern", CREST_PATTERN_NAMES)
	var crest_b: HBoxContainer = _cycler_row(list)
	_club_cycler(crest_b, I18n.t("TINTA"), "crest_tone", TONE_NAMES)
	_club_cycler(crest_b, I18n.t("EMBLEMA"), "emblem", EMBLEM_NAMES)
	var crest_c: HBoxContainer = _cycler_row(list)
	_club_cycler(crest_c, I18n.t("BORDE"), "rim", RIM_NAMES)























	var hay_patros: bool = not SponsorLogos.marcas().is_empty()
	var hay_marcas: bool = not KitBrands.marcas().is_empty()
	if hay_patros or hay_marcas:
		CareerUi.head(list, I18n.t("PECHO DE LA PLAYERA"))
		var pecho: HBoxContainer = _cycler_row(list)
		if hay_patros:




			var nombres: Dictionary = {"": "NINGUNO"}
			for m in SponsorLogos.marcas():
				var nom: String = SponsorLogos.name_of(String(m))
				if not nom.is_empty():
					nombres[String(m)] = nom
			_club_cycler(pecho, I18n.t("PATROCINADOR"), "sponsor", nombres)
		if hay_marcas:
			_club_cycler(pecho, I18n.t("MARCA DEPORTIVA"), "brand", {"": "NINGUNO"})












		var logos: HBoxContainer = HBoxContainer.new()
		logos.add_theme_constant_override("separation", 10)
		list.add_child(logos)
		for key in (["sponsor"] if hay_patros else []) \
				+(["brand"] if hay_marcas else []):
			var caja: PanelContainer = PanelContainer.new()
			caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			var caja_sb: StyleBoxFlat = StyleBoxFlat.new()
			caja_sb.set_corner_radius_all(8)


			caja_sb.set_content_margin_all(12.0)
			caja.add_theme_stylebox_override("panel", caja_sb)
			logos.add_child(caja)
			var logo: TextureRect = TextureRect.new()
			logo.custom_minimum_size = Vector2(0, 110)
			logo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			logo.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			caja.add_child(logo)
			_club_brand_logos[key] = {"tex": logo, "fondo": caja_sb}
		var pecho_foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)




		pecho_foot.text = I18n.t("Las marcas salen de tu pack. El club estrena lo que elijas en esta misma temporada, y desde ahí los contratos siguen rotando solos cada pocas temporadas.") \
				if not KitBrands.de_fabrica() \
				else I18n.t("Estas son las marcas del juego: importa un pack de logos para usar las tuyas. El club estrena lo que elijas en esta misma temporada, y desde ahí los contratos siguen rotando solos cada pocas temporadas.")
		pecho_foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		list.add_child(pecho_foot)















		if not tumbado:
			CareerUi.head(list, I18n.tf("TINTA DEL PECHO · {0}",
				[I18n.t(KIT_SLOT_NAMES[_club_slot])]))
		if hay_patros:
			_club_color_row(list, I18n.t("Color del patrocinador"),
				pre + "pat_ink", true)
		if hay_marcas:
			_club_color_row(list, I18n.t("Color de la marca deportiva"),
				pre + "fab_ink", true)
		var tinta_foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		tinta_foot.text = I18n.t("Con AUTO el juego elige el color que mejor se lee sobre esta playera. El color que fijes vale solo para este uniforme.")
		tinta_foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		list.add_child(tinta_foot)

	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("La fuerza y el país no se tocan aquí: son la estructura de la liga.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(foot)




	_club_undo = Button.new()
	_club_undo.text = I18n.t("QUITAR EDICION DEL CLUB")
	_club_undo.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button(_club_undo, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	_club_undo.pressed.connect(_confirm_reset_club.bind(team_id))
	if mando != _body:
		var muelle: Control = Control.new()
		muelle.size_flags_vertical = Control.SIZE_EXPAND_FILL
		mando.add_child(muelle)
	mando.add_child(_club_undo)

	CareerUi.back_button(mando, _on_back)
	_refresh_club()






func _club_line_edit(parent: Container, value: String, max_len: int,
		commit: Callable) -> LineEdit:
	var edit: LineEdit = LineEdit.new()
	edit.max_length = max_len
	edit.text = value
	edit.custom_minimum_size = Vector2(0, 96)
	edit.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	edit.virtual_keyboard_enabled = true
	_style_line_edit(edit)
	edit.text_submitted.connect(func(_t: String) -> void: commit.call())
	edit.focus_exited.connect(commit)
	parent.add_child(edit)
	return edit

























func _club_estadio_block(list: VBoxContainer) -> void:
	CareerUi.head(list, I18n.t("ESTADIO"))
	var max_len: int = VenueEdits.NAME_MAX if _es_seleccion() else TeamEdits.VENUE_MAX
	_club_venue_edit = _club_line_edit(list, Stadiums.of(_team), max_len,
		_commit_club_venue)

	_club_cycler(_cycler_row(list), I18n.t("PLANTA", "estadio"), "planta",
		FOOTPRINT_NAMES)


	var marco: PanelContainer = PanelContainer.new()
	marco.add_theme_stylebox_override("panel", CareerTheme.plate())
	marco.custom_minimum_size = Vector2(0, 380)
	list.add_child(marco)
	_club_planta_pic = TextureRect.new()
	_club_planta_pic.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_club_planta_pic.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	_club_planta_pic.clip_contents = true
	_club_planta_pic.texture = planta_miniatura(_club_value("planta"), _div_estadio())
	marco.add_child(_club_planta_pic)




	var sello: PanelContainer = PanelContainer.new()
	sello.add_theme_stylebox_override("panel",
		CareerTheme.tag(CareerTheme.div_color(_div_estadio())))
	sello.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	sello.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	sello.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sello_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.BG_DEEP)

	sello_l.text = "%s %s" % [Teams.div_short(_div_estadio()), I18n.t("DIVISION")]
	sello.add_child(sello_l)
	marco.add_child(sello)
	var toque: Button = Button.new()
	toque.flat = true
	toque.set_anchors_preset(Control.PRESET_FULL_RECT)
	toque.pressed.connect(_abre_planta_grande)
	marco.add_child(toque)





	_club_venue_auto = CareerUi.accion("girar", I18n.t("VOLVER AL ESTADIO AUTOMATICO"),
		UiKit.BTN_BLUE["bg"] as Color)
	_club_venue_auto.custom_minimum_size = Vector2(0, 72)
	_club_venue_auto.pressed.connect(_auto_club_venue)
	list.add_child(_club_venue_auto)
	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("El nombre sale en la carátula de TV y en el hub. La planta es la forma de las gradas en el partido.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(foot)







static func planta_miniatura(planta: String, div: int = 1) -> Texture2D:
	if planta.is_empty():
		return null
	var ruta: String = "res://assets/ui/plantas/d%d/%s.webp" % [clampi(div, 1, 3), planta]
	if not ResourceLoader.exists(ruta):
		return null
	return load(ruta) as Texture2D






func _div_estadio() -> int:
	if _es_seleccion():
		return 1
	var id: String = String(_team.get("id", ""))
	return clampi(GameState.stadium_built_div(id) if _carrera else Teams.base_div(id), 1, 3)





func _abre_planta_grande() -> void:
	var planta: String = _club_value("planta")
	var div: int = _div_estadio()
	var tex: Texture2D = planta_miniatura(planta, div)
	if tex == null:
		return
	var col: VBoxContainer = CareerUi.modal(self)
	if col == null:
		return
	col.add_theme_constant_override("separation", 18)
	var t: Label = Label.new()
	CareerTheme.title(t, CareerTheme.T_TITLE_MODAL)
	t.text = I18n.t(String(FOOTPRINT_NAMES.get(planta, planta.to_upper())))
	col.add_child(t)
	var pic: TextureRect = TextureRect.new()
	pic.texture = tex
	pic.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	pic.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED

	pic.custom_minimum_size = Vector2(0, 520)
	col.add_child(pic)


	var fila: Array = []
	var elige: Callable = func(i: int) -> void:
		pic.texture = planta_miniatura(planta, i + 1)
		CareerUi.mark_segmented(fila[0], i)
	var divs: HBoxContainer = CareerUi.segmented([Teams.div_short(1),
		Teams.div_short(2), Teams.div_short(3)], div - 1, elige, 72)
	fila.append(divs)
	col.add_child(divs)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.BTN_ROW_FONT)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	col.add_child(cerrar)



func _venue_editado() -> bool:
	if _es_seleccion():
		var pais: String = String(_team.get("name", ""))
		return not VenueEdits.venue_of(pais).is_empty() \
				or not VenueEdits.footprint_of(pais).is_empty()
	var id: String = String(_team.get("id", ""))
	return TeamEdits.tiene(id, "estadio") or TeamEdits.tiene(id, "planta")





func _commit_club_venue() -> void:
	if _page != "club" and _page != "nation":
		return
	if not is_instance_valid(_club_venue_edit):
		return
	var v: String = _club_venue_edit.text.strip_edges()
	if v.is_empty() or v == Stadiums.of(_team):
		return
	if _es_seleccion():
		VenueEdits.set_fields(String(_team.get("name", "")), {"nombre": v})
	else:
		TeamEdits.set_fields(String(_team.get("id", "")), {"estadio": v})
	_releer_team()
	_club_venue_edit.text = Stadiums.of(_team)
	_refresh_club()


func _auto_club_venue() -> void:
	if _es_seleccion():
		VenueEdits.clear_nation(String(_team.get("name", "")))
	else:
		TeamEdits.clear_fields(String(_team.get("id", "")), ["estadio", "planta"])
	_releer_team()
	if is_instance_valid(_club_venue_edit):
		_club_venue_edit.text = Stadiums.of(_team)
	_refresh_club()





func _club_derbi_block(list: VBoxContainer, team_id: String) -> void:
	CareerUi.head(list, I18n.t("DERBI"))
	var elegidos: Array = TeamEdits.derbis_of(team_id)
	if elegidos.is_empty():


		var rival: Dictionary = Teams.by_id(Rivalries.rival_of(team_id))
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(56, 56)
		if not rival.is_empty():
			crest.set_team(rival)
		var btn: Button = CareerUi.menu_row(
			String(rival.get("name", "")).to_upper() if not rival.is_empty() \
					else I18n.t("SIN DERBI"),
			I18n.t("CAMBIAR"), CareerTheme.TEXT_DIM, "", crest)
		btn.pressed.connect(_start_derbi_pick)
		list.add_child(btn)
	else:




		for rid_v in elegidos:
			var rid: String = String(rid_v)
			var rival: Dictionary = Teams.by_id(rid)
			var crest: CrestView = CrestView.new()
			crest.custom_minimum_size = Vector2(56, 56)
			if not rival.is_empty():
				crest.set_team(rival)
			var fila: Button = CareerUi.menu_row(
				String(rival.get("name", rid)).to_upper(), I18n.t("QUITAR"),
				CareerTheme.DANGER, "", crest)
			fila.pressed.connect(func() -> void:
				TeamEdits.remove_derbi(team_id, rid)
				_team = Teams.by_id(team_id)
				_render())
			list.add_child(fila)
		if elegidos.size() < TeamEdits.MAX_DERBIS:
			var mas: Button = CareerUi.accion("banderines", I18n.t("AÑADIR OTRO DERBI"),
				CareerTheme.NAV_MUNDO)
			mas.custom_minimum_size = Vector2(0, 72)
			mas.pressed.connect(_start_derbi_pick)
			list.add_child(mas)
		var auto: Button = CareerUi.accion("girar", I18n.t("VOLVER AL DERBI AUTOMATICO"),
			UiKit.BTN_BLUE["bg"] as Color)
		auto.custom_minimum_size = Vector2(0, 72)
		auto.pressed.connect(func() -> void:


			TeamEdits.clear_derbi(team_id)
			_team = Teams.by_id(team_id)
			_render())
		list.add_child(auto)
	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("Es el partido con más ambiente del año. Tiene que ser del mismo país; puede ser de otra división.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(foot)
	var foot2: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot2.text = I18n.t("Hasta tres rivales; el primero es el derbi principal.")
	foot2.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(foot2)





func _start_derbi_pick() -> void:
	_flush_name()
	var team_id: String = String(_team.get("id", ""))
	var country: String = Teams.country_of(team_id)
	_swap = {
		"kind": "derbi",
		"team_id": team_id,
		"team_name": String(_team.get("name", "")),
		"country": country,
	}
	_country_idx = maxi(_countries.find(country), 0)
	_div = _div_of(team_id)
	_query = ""
	_query_raw = ""
	_page = "clubs"
	_render()






func _confirm_derbi(club: Dictionary) -> void:
	var dst_id: String = String(club.get("id", ""))
	var src_id: String = String(_swap.get("team_id", ""))

	var src_name: String = String(_swap.get("team_name", ""))
	var dst_name: String = String(club.get("name", ""))



	var ya_hay: bool = not TeamEdits.derbis_of(src_id).is_empty() \
			or not TeamEdits.derbis_of(dst_id).is_empty()
	var lineas: Array = [
		I18n.tf("{0} y {1} pasan a ser rivales de derbi.", [src_name, dst_name]),
		I18n.t("Se suma a los derbis que ya tenían elegidos.") if ya_hay \
				else I18n.t("Los rivales que tenían hasta hoy se quedan sin derbi, y el juego les busca otro."),
		I18n.t("Las carreras ya empezadas lo estrenan al volver a cargar la partida."),
	]
	_overlay(I18n.t("CONFIRMAR DERBI"), lineas, I18n.t("CONFIRMAR"), func() -> void:


		TeamEdits.add_derbi(src_id, dst_id)
		_swap = {}
		_team = Teams.by_id(src_id)
		_page = "club"
		_render())









func _nation_derbi_block(list: VBoxContainer, nat_id: String) -> void:
	CareerUi.head(list, I18n.t("DERBI"))
	var elegidos: Array = NationEdits.derbis_of(nat_id)
	if elegidos.is_empty():


		var rivales: Array = Rivalries.nation_rivals_of(nat_id)
		var rival: String = String(rivales[0]) if not rivales.is_empty() else ""
		var btn: Button = CareerUi.menu_row(
			CareerTheme.caps(Nations.display_name(rival)) if not rival.is_empty() \
					else I18n.t("SIN DERBI"),
			I18n.t("CAMBIAR"), CareerTheme.TEXT_DIM, "", _bandera_fila(rival))
		btn.pressed.connect(_start_nat_derbi_pick)
		list.add_child(btn)
	else:

		for rid_v in elegidos:
			var rid: String = String(rid_v)
			var fila: Button = CareerUi.menu_row(
				CareerTheme.caps(Nations.display_name(rid)), I18n.t("QUITAR"),
				CareerTheme.DANGER, "", _bandera_fila(rid))
			fila.pressed.connect(func() -> void:
				NationEdits.remove_derbi(nat_id, rid)
				_team = Nations.as_team(nat_id)
				_render())
			list.add_child(fila)
		if elegidos.size() < TeamEdits.MAX_DERBIS:
			var mas: Button = CareerUi.accion("banderines", I18n.t("AÑADIR OTRO DERBI"),
				CareerTheme.NAV_MUNDO)
			mas.custom_minimum_size = Vector2(0, 72)
			mas.pressed.connect(_start_nat_derbi_pick)
			list.add_child(mas)
		var auto: Button = CareerUi.accion("girar", I18n.t("VOLVER AL DERBI AUTOMATICO"),
			UiKit.BTN_BLUE["bg"] as Color)
		auto.custom_minimum_size = Vector2(0, 72)
		auto.pressed.connect(func() -> void:


			NationEdits.clear_derbi(nat_id)
			_team = Nations.as_team(nat_id)
			_render())
		list.add_child(auto)
	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("Es el partido con más ambiente del año. Puede ser de cualquier confederación; sus otros rivales de siempre se quedan.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(foot)
	var foot2: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot2.text = I18n.t("Hasta tres rivales; el primero es el derbi principal.")
	foot2.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(foot2)




func _bandera_fila(nat_id: String) -> Control:
	if nat_id.is_empty():
		return null
	var fr: TextureRect = Flags.make_rect(nat_id, 40.0)
	fr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	return fr





func _start_nat_derbi_pick() -> void:
	var nat_id: String = String(_team.get("id", ""))
	_swap = {
		"kind": "derbi_nat",
		"nat_id": nat_id,
		"name": CareerTheme.caps(Nations.display_name(nat_id)),
	}
	_nat_query = ""
	_page = "nations"
	_render()








func _confirm_nat_derbi(dst_raw: String) -> void:
	var src_id: String = String(_swap.get("nat_id", ""))
	var dst_id: String = Nations.canon_id(dst_raw)


	var mios: Array = NationEdits.derbis_of(src_id)
	if dst_id == src_id or dst_id.is_empty() or mios.has(dst_id) \
			or mios.size() >= TeamEdits.MAX_DERBIS \
			or NationEdits.derbis_of(dst_id).size() >= TeamEdits.MAX_DERBIS:
		return
	var src_name: String = String(_swap.get("name", ""))
	var dst_name: String = CareerTheme.caps(Nations.display_name(dst_id))
	var lineas: Array = [
		I18n.tf("{0} y {1} pasan a ser rivales de derbi.", [src_name, dst_name]),
		I18n.t("Las carreras ya empezadas lo estrenan al volver a cargar la partida."),
	]


	if not mios.is_empty() or not NationEdits.derbis_of(dst_id).is_empty():
		lineas.insert(1, I18n.t("Se suma a los derbis que ya tenían elegidos."))
	_overlay(I18n.t("CONFIRMAR DERBI"), lineas, I18n.t("CONFIRMAR"), func() -> void:

		NationEdits.add_derbi(src_id, dst_id)
		_swap = {}
		_team = Nations.as_team(src_id)
		_page = "nation"
		_render())














func _commit_club_text() -> void:
	if _page != "club":
		return
	var team_id: String = String(_team.get("id", ""))
	var fields: Dictionary = {}
	if is_instance_valid(_club_name_edit):
		var n: String = _club_name_edit.text.strip_edges()
		if not n.is_empty() and n != String(_team.get("name", "")):
			fields["name"] = n
	if is_instance_valid(_club_abbrev_edit):
		var a: String = _club_abbrev_edit.text.strip_edges()
		if not a.is_empty() and a.to_upper() != String(_team.get("abbrev", "")):
			fields["abbrev"] = a
	if fields.is_empty():
		return
	TeamEdits.set_fields(team_id, fields)
	_team = Teams.by_id(team_id)



	if fields.has("name") and is_instance_valid(_club_name_edit):
		_club_name_edit.text = String(_team.get("name", ""))
	if fields.has("abbrev") and is_instance_valid(_club_abbrev_edit):
		_club_abbrev_edit.text = String(_team.get("abbrev", ""))
	_refresh_club()



func _club_color_row(parent: Container, label_text: String, key: String,
		con_auto: bool = false) -> void:
	CareerUi.head(parent, label_text)
	var row: HFlowContainer = HFlowContainer.new()
	row.add_theme_constant_override("h_separation", 10)
	row.add_theme_constant_override("v_separation", 10)
	parent.add_child(row)
	var entries: Array = []





	if con_auto:
		var a_ring: PanelContainer = PanelContainer.new()
		var a_ring_sb: StyleBoxFlat = StyleBoxFlat.new()
		a_ring_sb.bg_color = UiKit.CLEAR
		a_ring_sb.set_corner_radius_all(8)
		a_ring_sb.set_content_margin_all(5.0)
		a_ring.add_theme_stylebox_override("panel", a_ring_sb)
		row.add_child(a_ring)
		var ab: Button = Button.new()
		ab.custom_minimum_size = Vector2(76, 76)



		ab.text = I18n.t("AUTO", "tinta")
		ab.clip_text = true
		var a_sb: StyleBoxFlat = StyleBoxFlat.new()
		a_sb.bg_color = CareerTheme.BG_DEEP
		a_sb.set_corner_radius_all(4)
		a_sb.border_color = CareerTheme.TEXT_DIM
		a_sb.set_border_width_all(2)
		ab.add_theme_stylebox_override("normal", a_sb)
		ab.add_theme_stylebox_override("hover", a_sb)
		ab.add_theme_stylebox_override("pressed", a_sb)
		ab.add_theme_font_size_override("font_size", CareerTheme.T_CAPTION)
		ab.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
		UiKit.add_feedback(ab)
		ab.pressed.connect(_clear_club_color.bind(key))
		a_ring.add_child(ab)
		entries.append({"ring": a_ring_sb, "style": a_sb, "value": Color.WHITE,
			"auto": true})
	for c in KitRecolor.KIT_COLORS:






		var ring: PanelContainer = PanelContainer.new()
		var ring_sb: StyleBoxFlat = StyleBoxFlat.new()
		ring_sb.bg_color = UiKit.CLEAR
		ring_sb.set_corner_radius_all(8)
		ring_sb.set_content_margin_all(5.0)
		ring.add_theme_stylebox_override("panel", ring_sb)
		row.add_child(ring)
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(76, 76)
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = c
		sb.set_corner_radius_all(4)






		sb.border_color = CareerTheme.BG_DEEP
		b.add_theme_stylebox_override("normal", sb)
		b.add_theme_stylebox_override("hover", sb)
		b.add_theme_stylebox_override("pressed", sb)

		UiKit.add_feedback(b)
		b.pressed.connect(_pick_club_color.bind(key, c))
		ring.add_child(b)
		entries.append({"ring": ring_sb, "style": sb, "value": c})
	_club_swatches[key] = entries
















func _club_detalles_block(parent: Container, pre: String) -> void:
	var list: Container = parent
	if UiKit.es_horizontal():
		list = _seccion_tumbada(parent, I18n.t("SHORT, MEDIAS Y CUELLO"))
	CareerUi.head(list, I18n.t("DIBUJO DEL SHORT"))
	_club_cycler(_cycler_row(list), "", pre + "short_pat", SHORT_PAT_NAMES)
	_club_color_row(list, I18n.t("Acento del short"), pre + "short_b", true)
	_club_color_row(list, I18n.t("Medias"), pre + "sock", true)
	CareerUi.head(list, I18n.t("DIBUJO DE LAS MEDIAS"))
	_club_cycler(_cycler_row(list), "", pre + "sock_pat", SOCK_PAT_NAMES)
	_club_color_row(list, I18n.t("Acento de las medias"), pre + "sock_b", true)
	_club_color_row(list, I18n.t("Cuello polo"), pre + "cuello", true)
	_club_color_row(list, I18n.t("Fin de manga"), pre + "puno", true)







func _seccion_tumbada(list: Container, titulo: String) -> Container:
	CareerUi.head(list, titulo)
	if not UiKit.es_horizontal():
		return list
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 8)
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	list.add_child(caja)
	return caja














func _club_kit_pick(slot: int) -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 4)
	var ring: PanelContainer = PanelContainer.new()
	var ring_sb: StyleBoxFlat = StyleBoxFlat.new()
	ring_sb.bg_color = UiKit.CLEAR
	ring_sb.set_corner_radius_all(10)
	ring_sb.set_content_margin_all(4.0)
	ring.add_theme_stylebox_override("panel", ring_sb)
	col.add_child(ring)
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 280)



	b.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION)
	b.pressed.connect(_pick_club_slot.bind(slot))
	ring.add_child(b)











	var av: PlayerAvatar = PlayerAvatar.new()
	av.chrome = false
	av.bust = KIT_BODY
	av.mouse_filter = Control.MOUSE_FILTER_IGNORE
	av.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	b.add_child(av)
	var cap: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	cap.text = I18n.t(KIT_SLOT_NAMES[slot])
	cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cap.clip_text = true
	col.add_child(cap)
	_club_previews.append({"ring": ring_sb, "av": av, "cap": cap, "slot": slot})
	return col





func _pick_club_slot(slot: int) -> void:
	if slot == _club_slot:
		return
	_club_slot = slot
	_render()














func _sello_de(key: String) -> int:






	const DERIVAN: Array[String] = ["pattern", "away_pattern", "third_pattern",
		"sponsor", "brand"]
	if TeamEdits.COLOR_KEYS.has(key) or DERIVAN.has(key):
		return maxi(GameState.season_num, 1)
	return 0


func _pick_club_color(key: String, color: Color) -> void:
	_kit_set(key, color)







func _es_seleccion() -> bool:
	return bool(_team.get("is_nation", false))



func _releer_team() -> void:
	var id: String = String(_team.get("id", ""))
	_team = Nations.as_team(id) if _es_seleccion() else Teams.by_id(id)




func _kit_set(key: String, value: Variant) -> void:
	var id: String = String(_team.get("id", ""))
	if key == "planta" and _es_seleccion():


		VenueEdits.set_fields(String(_team.get("name", "")), {"planta": String(value)})
	elif _es_seleccion():
		NationEdits.set_fields(id, {key: value}, _sello_de(key))
	else:
		TeamEdits.set_fields(id, {key: value}, _sello_de(key))
	_releer_team()
	_refresh_club()





func _clear_club_color(key: String) -> void:
	var team_id: String = String(_team.get("id", ""))
	if _es_seleccion():
		NationEdits.clear_fields(team_id, [key])
	else:
		TeamEdits.clear_fields(team_id, [key])
	_releer_team()
	_refresh_club()






func _club_cycler(parent: HBoxContainer, caption: String, key: String,
		names: Dictionary) -> void:
	var label: Label = _build_cycler(parent, caption,
		func(dir: int) -> void: _step_club(key, dir))
	_club_labels[key] = {"label": label, "names": names}


func _club_pool(key: String) -> Array:


	if key == "sponsor":
		return [""] + SponsorLogos.marcas()
	if key == "brand":
		return [""] + KitBrands.marcas()
	var out: Array = []
	for v in TeamEdits.pool_for(key):
		if not out.has(v):
			out.append(v)
	return out






func _club_value(key: String) -> String:
	if key == "pattern":
		return String(_team.get("pattern", "solid"))


	if TeamEdits.DETALLE_TEXT_KEYS.has(key):
		var slot_d: int = 1 if key.begins_with("away_") else (2 if key.begins_with("third_") else 0)
		return String(_club_kit(slot_d).get(key.trim_prefix(KIT_SLOT_PREFIX[slot_d]), "solid"))


	if key == "away_pattern" or key == "third_pattern":
		return String(_club_kit(1 if key.begins_with("away_") else 2)
			.get("pattern", "solid"))



	if key == "sponsor" or key == "brand":
		return String(_team.get(key, ""))


	if key == "planta":
		return Stadiums.nation_footprint(String(_team.get("name", ""))) \
				if _es_seleccion() else Stadiums.footprint_of(String(_team.get("id", "")))
	return String(CrestView.traits_of(_team).get(key, ""))


func _step_club(key: String, dir: int) -> void:
	var pool: Array = _club_pool(key)
	if pool.is_empty():
		return
	var i: int = maxi(pool.find(_club_value(key)), 0)
	i = wrapi(i + dir, 0, pool.size())
	_kit_set(key, String(pool[i]))





func _refresh_club() -> void:


	if _es_seleccion():
		if _page != "nation":
			return
	elif not is_instance_valid(_club_crest):
		return
	if is_instance_valid(_club_undo):
		_club_undo.visible = NationEdits.kit_edited(String(_team.get("id", ""))) \
				if _es_seleccion() else TeamEdits.edited(String(_team.get("id", "")))
	if is_instance_valid(_club_crest):
		_club_crest.set_team(_team)
	if is_instance_valid(_club_venue_auto):
		_club_venue_auto.visible = _venue_editado()
	if is_instance_valid(_club_planta_pic):
		_club_planta_pic.texture = planta_miniatura(_club_value("planta"), _div_estadio())



	for e in _club_previews:
		var av: PlayerAvatar = e["av"]
		if not is_instance_valid(av):
			continue





		av.club = _team
		av.set_look(_club_kit(int(e["slot"])))
		var picked: bool = int(e["slot"]) == _club_slot
		(e["ring"] as StyleBoxFlat).bg_color = CareerTheme.accent_text() \
				if picked else UiKit.CLEAR
		(e["cap"] as Label).add_theme_color_override("font_color",
			CareerTheme.accent_text() if picked else CareerTheme.TEXT_DIM)
	for key in _club_labels:
		var entry: Dictionary = _club_labels[key]
		var val: String = _club_value(String(key))
		var names: Dictionary = entry["names"]




		(entry["label"] as Label).text = I18n.t(String(names.get(val, val.to_upper())))
	for key in _club_swatches:




		var auto: bool =(TeamEdits.INK_KEYS.has(String(key))
				or TeamEdits.DETALLE_COLOR_KEYS.has(String(key))) \
						and not (_team.get(String(key)) is Color)
		var cur: Color = _club_current_color(String(key))
		for e in _club_swatches[key]:
			var es_auto: bool = bool(e.get("auto", false))
			var picked: bool =(es_auto == auto) \
					and (auto or (e["value"] as Color).is_equal_approx(cur))
			var ring: StyleBoxFlat = e["ring"]
			ring.bg_color = CareerTheme.accent_text() if picked else UiKit.CLEAR



			(e["style"] as StyleBoxFlat).set_border_width_all(
				2 if es_auto else (3 if picked else 0))




	var tela: Dictionary = _club_kit(_club_slot)
	for key in _club_brand_logos:
		var ficha: Dictionary = _club_brand_logos[key]
		var logo: TextureRect = ficha["tex"]
		if not is_instance_valid(logo):
			continue
		(ficha["fondo"] as StyleBoxFlat).bg_color = tela.get("kit", CareerTheme.BG_DEEP)
		var marca: String = _club_value(String(key))



		var cruda: Texture2D = null if marca.is_empty() else \
				(SponsorLogos.texture(marca) if String(key) == "sponsor"
				else KitBrands.texture(KitBrands.variante(marca, _club_slot)))







		logo.texture = Pecho.marca_para(cruda, tela,
			"pat" if String(key) == "sponsor" else "fab")





func _club_current_color(key: String) -> Color:





	if TeamEdits.INK_KEYS.has(key) or TeamEdits.DETALLE_COLOR_KEYS.has(key):
		return _team.get(key, Color.WHITE)
	for slot in [1, 2]:
		var pre: String = KIT_SLOT_PREFIX[slot]
		if key.begins_with(pre):



			return _club_kit(slot).get(key.trim_prefix(pre), Color.WHITE)
	if key == "kit_b":
		return _team.get("kit_b", _team.get("kit2", Color.WHITE))
	return _team.get(key, Color.WHITE)









func _club_kit(slot: int) -> Dictionary:
	return GameState.kit_canonical(_team, slot)




func _confirm_reset_club(team_id: String) -> void:
	_overlay(I18n.t("QUITAR EDICION DEL CLUB"),
		[I18n.tf("{0} vuelve a su nombre, uniforme y escudo de fábrica.",
			[String(_team.get("name", ""))]),
		I18n.t("Su estadio y su derbi, también."),
		I18n.t("Su plantel no se toca."),



		I18n.t("La división tampoco: se deshace intercambiando otra vez.")],
		I18n.t("QUITAR"),
		func() -> void:
			TeamEdits.clear_team(team_id)
			_team = Teams.by_id(team_id)
			_render())












const NAT_FILA_H: float = 104.0



const NAT_PUERTAS_PASO: int = 30





func _nat_orden() -> Array:
	if _nat_orden_cache.is_empty():
		for n in Nations.top(Nations.POOL.size()):
			_nat_orden_cache.append(String((n as Dictionary).get("id", "")))
	return _nat_orden_cache



func _naciones_editadas() -> Array:
	var out: Array = []
	var tocadas: Array = NationEdits.edited_nations()
	if tocadas.is_empty():
		return out
	for id in _nat_orden():
		if tocadas.has(id):
			out.append(id)
	return out


func _render_nations() -> void:


	var partes: Array[VBoxContainer] = _partir_tumbado(MANDO_LISTA_W)
	var mando: VBoxContainer = partes[0]
	CareerUi.head(mando, I18n.t("SELECCIONES"))
	if _pending_nat_derbi():

		_swap_banner(mando, I18n.t("ELIGE SU RIVAL DE DERBI"),
			I18n.t("Puede ser de cualquier confederación."))
	else:
		var sub: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		sub.text = I18n.t("El uniforme y la convocatoria de cada selección valen para todas tus partidas.")
		mando.add_child(sub)


	var edit: LineEdit = LineEdit.new()
	edit.placeholder_text = I18n.t("BUSCAR SELECCION")
	edit.text = _nat_query
	edit.custom_minimum_size = Vector2(0, 92)
	edit.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	edit.virtual_keyboard_enabled = true
	edit.clear_button_enabled = true
	_style_line_edit(edit)
	edit.text_changed.connect(func(t: String) -> void:
		_nat_query = t
		_fill_nations())
	mando.add_child(edit)
	if UiKit.es_horizontal():
		var nombres: Array = []
		for id in _nat_orden():
			nombres.append(Nations.display_name(String(id)))


		if not nombres.is_empty() and not nombres.any(func(n: Variant) -> bool:
				return CareerTheme.empieza_por(String(n), _nat_inicial)):
			_nat_inicial = CareerTheme.inicial(String(nombres[0]))
		_indice_iniciales(mando, nombres, _nat_elige_inicial)
	_nat_results = _scroll_list(partes[1], true)
	_fill_nations()
	if mando != _body:
		var muelle: Control = Control.new()
		muelle.size_flags_vertical = Control.SIZE_EXPAND_FILL
		mando.add_child(muelle)
	CareerUi.back_button(mando, _on_back)












func _fill_nations() -> void:
	if not is_instance_valid(_nat_results):
		return
	if _nat_results.get_child_count() == 0:
		_nat_nada = null
		var padre: Container = _nat_results
		if UiKit.es_horizontal():
			var rejilla: GridContainer = GridContainer.new()
			rejilla.name = "RejillaNaciones"
			rejilla.columns = 4
			rejilla.add_theme_constant_override("h_separation", 8)
			rejilla.add_theme_constant_override("v_separation", 8)
			_nat_results.add_child(rejilla)
			padre = rejilla
		for id in _nat_orden():
			_nation_row(padre, id)
		var scroll: ScrollContainer = _nat_results.get_parent() as ScrollContainer
		if scroll != null:
			scroll.get_v_scroll_bar().value_changed.connect(
				func(_v: float) -> void: _nat_medallas_en_vista())
			scroll.resized.connect(_nat_medallas_en_vista)
			if scroll is DragScroll:
				(scroll as DragScroll).desplazada.connect(_nat_medallas_en_vista)
				(scroll as DragScroll).repartido_listo.connect(_nat_medallas_en_vista)



		_nat_results.sort_children.connect(_nat_medallas_en_vista)
	var q: String = CareerTheme.llave(_nat_query.strip_edges())
	var inicial: String = CareerTheme.llave(_nat_inicial)
	var n: int = 0
	var contenedor: Container = _nat_results.get_child(0) as Container if UiKit.es_horizontal() else _nat_results
	for c in contenedor.get_children():
		if not c.has_meta("nat_id"):
			continue
		var id: String = String(c.get_meta("nat_id"))
		var nombre: String = CareerTheme.llave(Nations.display_name(id))
		var casa: bool = q.is_empty() or nombre.contains(q) or CareerTheme.llave(id).contains(q)
		if UiKit.es_horizontal():
			casa = CareerTheme.empieza_por(Nations.display_name(id), inicial) if q.is_empty() \
					else nombre.begins_with(q) or CareerTheme.llave(id) == q
		(c as Control).visible = casa
		if casa:
			n += 1
	if n == 0 and not is_instance_valid(_nat_nada):
		_nat_nada = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		_nat_nada.text = I18n.t("Ninguna selección se llama así.")
		_nat_nada.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_nat_results.add_child(_nat_nada)
	elif n > 0 and is_instance_valid(_nat_nada):
		_nat_nada.queue_free()
		_nat_nada = null


func _nat_elige_inicial(letra: String) -> void:
	_nat_inicial = letra
	_nat_query = ""
	_page = "nations"
	_render()




func _indice_iniciales(parent: Container, nombres: Array, on_pick: Callable) -> void:
	var letras: Array[String] = []
	for nombre in nombres:
		var letra: String = CareerTheme.inicial(String(nombre))
		if not letra.is_empty() and not letras.has(letra):
			letras.append(letra)
	letras.sort()
	var indice: HFlowContainer = HFlowContainer.new()
	indice.name = "IndiceIniciales"
	indice.add_theme_constant_override("h_separation", 8)
	indice.add_theme_constant_override("v_separation", 8)
	parent.add_child(indice)
	for letra in letras:
		var b: Button = Button.new()
		b.text = letra
		b.custom_minimum_size = Vector2(56.0, 56.0)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
		b.pressed.connect(on_pick.bind(letra))
		indice.add_child(b)









func _nat_medallas_en_vista() -> void:
	if not is_instance_valid(_nat_results):
		return
	var scroll: ScrollContainer = _nat_results.get_parent() as ScrollContainer
	if scroll == null:
		return
	var arriba: float = float(scroll.scroll_vertical) - NAT_FILA_H
	var abajo: float = float(scroll.scroll_vertical) + scroll.size.y + NAT_FILA_H
	var filas: Container = _nat_results.get_child(0) as Container if UiKit.es_horizontal() else _nat_results
	for c in filas.get_children():
		if not c.has_meta("nat_badge"):
			continue
		var fila: Control = c as Control


		var med: OvrBadge = SceneFade.vivo(fila.get_meta("nat_badge", null)) as OvrBadge
		if not is_instance_valid(med):
			continue


		med.set_process(OvrBadge.ANIMADA and fila.visible
			and fila.position.y + fila.size.y >= arriba and fila.position.y <= abajo
			and fila.position.x + fila.size.x >= 0.0 and fila.position.x <= scroll.size.x)




func _nation_row(list: Container, id: String, desde_edits: bool = false) -> void:
	if UiKit.es_horizontal():
		_nation_casilla(list, id, desde_edits)
		return
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, NAT_FILA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.text = ""
	b.pressed.connect(_open_nation.bind(id, desde_edits))
	list.add_child(b)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 16.0
	row.offset_right = -16.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.add_theme_constant_override("separation", 14)
	b.add_child(row)
	var flag: TextureRect = Flags.make_rect(id, 40.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(flag)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 2)
	row.add_child(col)
	var nom: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	nom.text = CareerTheme.caps(Nations.display_name(id))
	nom.clip_text = true
	col.add_child(nom)



	var partes: Array = []
	if NationEdits.kit_edited(id):
		partes.append(I18n.t("UNIFORME"))
	if NationEdits.convocatoria_edited(id):
		partes.append(I18n.t("CONVOCATORIA"))
	if not NationEdits.derbi_of(id).is_empty():
		partes.append(I18n.t("DERBI"))
	if not partes.is_empty():
		var tag: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.accent_text())
		tag.text = I18n.tf("EDITADO: {0}", [" · ".join(partes)])
		tag.clip_text = true
		col.add_child(tag)
	var ovr: OvrBadge = OvrBadge.new()
	ovr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ovr.setup(Nations.strength(id), 30)
	row.add_child(ovr)
	_mute(row)

	b.set_meta("nat_id", id)
	b.set_meta("nat_badge", ovr)




func _nation_casilla(parent: Container, id: String, desde_edits: bool) -> void:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(260.0, 104.0)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
	b.pressed.connect(_open_nation.bind(id, desde_edits))
	parent.add_child(b)
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	col.offset_left = 10.0
	col.offset_right = -10.0
	col.offset_top = 6.0
	col.offset_bottom = - float(CareerTheme.SINK) - 6.0
	col.add_theme_constant_override("separation", 4)
	b.add_child(col)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.alignment = BoxContainer.ALIGNMENT_CENTER
	arriba.add_theme_constant_override("separation", 18)
	col.add_child(arriba)
	arriba.add_child(Flags.make_rect(id, 28.0))
	var ovr: OvrBadge = OvrBadge.new()
	ovr.setup(Nations.strength(id), 14)
	arriba.add_child(ovr)
	var nombre: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
	nombre.text = CareerTheme.caps(Nations.display_name(id))
	nombre.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nombre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(nombre)
	b.tooltip_text = nombre.text
	if NationEdits.edited(id):
		CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY, CareerTheme.T_DIM)
		b.tooltip_text += " · " + I18n.t("EDITADO")
	_mute(col)
	b.set_meta("nat_id", id)
	b.set_meta("nat_badge", ovr)


func _open_nation(id: String, desde_edits: bool = false) -> void:
	if _pending_nat_derbi():
		_confirm_nat_derbi(id)
		return
	_nat_desde_edits = desde_edits
	_team = Nations.as_team(id)
	_club_slot = 0
	_page = "nation"
	_render()



func _salta_nacion(dir: int) -> void:
	var orden: Array = _nat_orden()
	var i: int = orden.find(String(_team.get("id", ""))) + dir
	if i < 0 or i >= orden.size():
		return
	_team = Nations.as_team(String(orden[i]))
	_render()








func _render_nation() -> void:
	var nat_id: String = String(_team.get("id", ""))
	_team = Nations.as_team(nat_id)
	_club_labels = {}
	_club_swatches = {}
	_club_brand_logos = {}



	_club_crest = null
	_club_name_edit = null
	_club_abbrev_edit = null



	var partes: Array[VBoxContainer] = _partir_tumbado(CLUB_MANDO_W)
	var mando: VBoxContainer = partes[0]
	CareerUi.head(mando, I18n.t("SELECCION"))
	var orden: Array = _nat_orden()
	_stepper(mando, orden.find(nat_id), orden.size(), _salta_nacion)
	var tit: HBoxContainer = HBoxContainer.new()
	tit.add_theme_constant_override("separation", 14)
	mando.add_child(tit)
	var flag: TextureRect = Flags.make_rect(nat_id, 48.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tit.add_child(flag)
	var nom: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	nom.text = CareerTheme.caps(Nations.display_name(nat_id))
	nom.clip_text = true
	nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nom.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tit.add_child(nom)
	var plate: PanelContainer = CareerUi.plate()
	mando.add_child(plate)
	var tira: HBoxContainer = HBoxContainer.new()
	tira.add_theme_constant_override("separation", 6)
	plate.add_child(tira)
	_club_previews = []
	for slot in KIT_SLOT_PREFIX.size():
		tira.add_child(_club_kit_pick(slot))

	var list: VBoxContainer = _scroll_list(partes[1])



	CareerUi.head(list, I18n.t("CONVOCATORIA"))
	var nf: int = NationEdits.fijados(nat_id).size()
	var nv: int = NationEdits.vetados(nat_id).size()





	var resumen: String = I18n.t("AUTOMATICA") if nf + nv == 0 \
			else "%d %s · %d %s" % [nf, I18n.plural(nf, "FIJADO", "FIJADOS"),
			nv, I18n.plural(nv, "VETADO", "VETADOS")]
	var conv_btn: Button = CareerUi.menu_row(I18n.t("ELEGIR CONVOCADOS"), resumen,
		CareerTheme.TEXT_DIM if nf + nv == 0 else CareerTheme.accent_text())
	conv_btn.pressed.connect(func() -> void:
		_nat_puertas = NAT_PUERTAS_PASO
		_page = "nation_squad"
		_render())
	list.add_child(conv_btn)



	_club_estadio_block(list)


	_nation_derbi_block(list, nat_id)

	CareerUi.head(list, I18n.tf("UNIFORME · {0}",
		[I18n.t(KIT_SLOT_NAMES[_club_slot])]))
	var pre: String = KIT_SLOT_PREFIX[_club_slot]
	_club_color_row(list, I18n.t("Playera"), pre + "kit")
	_club_color_row(list, I18n.t("Shorts"), pre + "kit2")
	CareerUi.head(list, I18n.t("PATRON"))
	_club_cycler(_cycler_row(list), "", pre + "pattern", PATTERN_NAMES)
	_club_color_row(list, I18n.t("Acento del patrón"), pre + "kit_b")
	var pat_foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)



	pat_foot.text = I18n.t("El acento solo se ve si la playera lleva patrón.") \
			if _club_slot == 0 else \
			I18n.t("Este uniforme se genera solo cada temporada. La selección lo estrena tal cual en la temporada en que lo elijas, y a partir de ahí sigue cambiando de color y dibujo cada año.")
	pat_foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(pat_foot)
	_club_detalles_block(list, pre)
	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("La bandera, el nombre y la fuerza de un país no se tocan aquí.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	list.add_child(foot)



	_club_undo = Button.new()
	_club_undo.text = I18n.t("QUITAR EDICION DEL UNIFORME")
	_club_undo.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button(_club_undo, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	_club_undo.pressed.connect(_confirm_reset_nation_kit.bind(nat_id))
	if mando != _body:
		var muelle: Control = Control.new()
		muelle.size_flags_vertical = Control.SIZE_EXPAND_FILL
		mando.add_child(muelle)
	mando.add_child(_club_undo)

	CareerUi.back_button(mando, _on_back)
	_refresh_club()


func _confirm_reset_nation_kit(nat_id: String) -> void:
	_overlay(I18n.t("QUITAR EDICION DEL UNIFORME"),
		[I18n.tf("{0} vuelve a sus uniformes de fábrica.",
			[CareerTheme.caps(Nations.display_name(nat_id))]),
		I18n.t("Su convocatoria no se toca.")],
		I18n.t("QUITAR"),
		func() -> void:
			NationEdits.clear_kit(nat_id)
			_team = Nations.as_team(nat_id)
			_render())











func _render_nation_squad() -> void:
	var nat_id: String = String(_team.get("id", ""))
	CareerUi.head(_body, I18n.t("CONVOCATORIA"))
	var tit: HBoxContainer = HBoxContainer.new()
	tit.add_theme_constant_override("separation", 14)
	_body.add_child(tit)
	var flag: TextureRect = Flags.make_rect(nat_id, 40.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tit.add_child(flag)
	var nom: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	nom.text = CareerTheme.caps(Nations.display_name(nat_id))
	nom.clip_text = true
	nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nom.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tit.add_child(nom)
	var sub: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	sub.text = I18n.t("FIJAR: va siempre. VETAR: no va nunca. El resto de la lista la arma el juego con los mejores del país.")
	_body.add_child(sub)

	var list: VBoxContainer = _scroll_list(_body)
	_nat_scroll = list.get_parent() as ScrollContainer
	var squad: Array = NatTeam.convocatoria_editor(nat_id)
	var en_lista: Dictionary = {}
	for r in squad:
		en_lista[String((r as Dictionary).get("name", "")).to_upper()] = true

	CareerUi.head(list, I18n.tf("CONVOCADOS · {0}", [squad.size()]))
	for r in squad:
		_nat_player_row(list, nat_id, r as Dictionary, true)






	var puertas: Array = []
	var sin_sitio: Array = []
	var en_pool: Dictionary = {}
	for c in NatTeam.candidate_players(nat_id):
		var n_c: String = String((c as Dictionary).get("name", "")).to_upper()
		en_pool[n_c] = true
		if en_lista.has(n_c):
			continue
		if NationEdits.estado_de(nat_id, n_c) == "fijado":
			sin_sitio.append(c)
		else:
			puertas.append(c)
	puertas = sin_sitio + puertas
	if not puertas.is_empty():
		CareerUi.head(list, I18n.t("A LAS PUERTAS"))
		for i in mini(_nat_puertas, puertas.size()):
			_nat_player_row(list, nat_id, puertas[i] as Dictionary, false)

		if puertas.size() > _nat_puertas:
			var mas: Button = Button.new()
			mas.text = I18n.tf("VER {0} MAS", [mini(NAT_PUERTAS_PASO, puertas.size() - _nat_puertas)])
			mas.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
			CareerTheme.apply_button(mas, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
			mas.pressed.connect(func() -> void:
				_nat_puertas += NAT_PUERTAS_PASO
				_nat_rearma())
			list.add_child(mas)








	var vetados: Array = NationEdits.vetados(nat_id)
	var perdidos: Array = []
	for n in NationEdits.fijados(nat_id):
		var n_up: String = String(n).strip_edges().to_upper()
		if not en_lista.has(n_up) and not en_pool.has(n_up):
			perdidos.append(n)
	if not vetados.is_empty() or not perdidos.is_empty():
		CareerUi.head(list, I18n.t("FUERA DE LA LISTA"))
		for n in vetados:
			_nat_nombre_row(list, nat_id, String(n), I18n.t("VETADO"),
				I18n.t("QUITAR VETO"))
		for n in perdidos:
			_nat_nombre_row(list, nat_id, String(n), I18n.t("FIJADO, PERO YA NO ESTA EN EL PAIS"),
				I18n.t("SOLTAR"))

	if NationEdits.convocatoria_edited(nat_id):
		var quitar: Button = Button.new()
		quitar.text = I18n.t("QUITAR FIJADOS Y VETOS")
		quitar.custom_minimum_size = Vector2(0, 84)
		CareerTheme.apply_button(quitar, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
		quitar.pressed.connect(func() -> void:
			_overlay(I18n.t("QUITAR FIJADOS Y VETOS"),
				[I18n.tf("{0} vuelve a convocar solo a sus mejores.",
					[CareerTheme.caps(Nations.display_name(nat_id))]),
				I18n.t("Su uniforme no se toca.")],
				I18n.t("QUITAR"),
				func() -> void:
					NationEdits.clear_convocatoria(nat_id)
					_render()))
		_body.add_child(quitar)

	CareerUi.back_button(_body, _on_back)


	if _nat_scroll_y > 0:
		var y: int = _nat_scroll_y
		var sc: ScrollContainer = _nat_scroll
		SceneFade.arbol().process_frame.connect(func() -> void:
			if is_instance_valid(sc):
				sc.scroll_vertical = y, CONNECT_ONE_SHOT)
	_nat_scroll_y = -1



func _nat_rearma() -> void:
	_nat_scroll_y = _nat_scroll.scroll_vertical if is_instance_valid(_nat_scroll) else -1
	_render()





func _nat_player_row(list: VBoxContainer, nat_id: String, p: Dictionary,
		convocado: bool) -> void:
	var nombre: String = String(p.get("name", ""))
	var estado: String = NationEdits.estado_de(nat_id, nombre)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	list.add_child(fila)
	var plate: PanelContainer = CareerUi.plate()
	plate.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(plate)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	plate.add_child(row)
	var ovr: OvrBadge = OvrBadge.new()
	ovr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ovr.setup(roundi(float(p.get("score", 0.0))), 26)
	row.add_child(ovr)
	var pos: String = String(p.get("slot", p.get("pos", ""))) if convocado \
			else String(p.get("pos", ""))
	row.add_child(CareerUi.pos_chip(pos))
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 2)
	row.add_child(col)
	var nom: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	nom.text = CareerUi.display_name(nombre)
	nom.clip_text = true
	col.add_child(nom)
	var det: Label = CareerUi.plain(CareerTheme.T_CAPTION,
		CareerTheme.accent_text() if estado == "fijado" else CareerTheme.TEXT_DIM)
	var club: String = CareerTheme.caps(String(p.get("club", "")))
	var marcas: Array = []
	if convocado and bool(p.get("starter", false)):
		marcas.append(I18n.t("TITULAR"))
	if estado == "fijado":
		marcas.append(I18n.t("FIJADO") if convocado else I18n.t("FIJADO, SIN SITIO"))
	marcas.append(club)
	det.text = " · ".join(marcas)
	det.clip_text = true
	col.add_child(det)




	fila.add_child(_nat_toggle(nat_id, nombre, estado, "fijado",
		I18n.t("SOLTAR") if estado == "fijado" else I18n.t("FIJAR")))
	fila.add_child(_nat_toggle(nat_id, nombre, estado, "vetado", I18n.t("VETAR")))




func _nat_toggle(nat_id: String, nombre: String, estado: String, suyo: String,
		texto: String) -> Button:
	var b: Button = Button.new()
	b.text = texto
	b.clip_text = true
	b.custom_minimum_size = Vector2(150, 84)
	var encendido: bool = estado == suyo
	CareerTheme.apply_button(b,
		CareerTheme.Kind.PRIMARY if encendido else CareerTheme.Kind.NEUTRAL,
		CareerTheme.T_CAPTION)
	if suyo == "fijado" and not encendido \
			and NationEdits.fijados(nat_id).size() >= NationEdits.FIJADOS_MAX:
		b.disabled = true
	b.pressed.connect(func() -> void:
		NationEdits.set_estado(nat_id, nombre, "" if encendido else suyo)
		_nat_rearma())
	return b




func _nat_nombre_row(list: VBoxContainer, nat_id: String, nombre: String,
		motivo: String, accion: String) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	list.add_child(fila)
	var plate: PanelContainer = CareerUi.plate()
	plate.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(plate)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)
	plate.add_child(col)
	var nom: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	nom.text = CareerUi.display_name(nombre)
	nom.clip_text = true
	col.add_child(nom)
	var det: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	det.text = motivo
	det.clip_text = true
	col.add_child(det)

	var b: Button = CareerUi.accion("girar", accion, UiKit.BTN_BLUE["bg"] as Color)
	b.size_flags_horizontal = Control.SIZE_FILL
	b.custom_minimum_size = Vector2(230, 84)
	b.pressed.connect(func() -> void:
		NationEdits.set_estado(nat_id, nombre, "")
		_nat_rearma())
	fila.add_child(b)







func _open_create() -> void:
	if _draft.is_empty():
		_draft = {"name": "", "age": 24, "nation": NATION_POOL[0]}
		for entry in STAT_LABELS:
			_draft[String(entry[0])] = 70
	_page = "create"
	_render()


func _render_create() -> void:


	var cols: Array[VBoxContainer] = _columnas_tumbadas([FICHA_QUIEN_W, 0.0, FICHA_CUALIDADES_W])
	var espejo: VBoxContainer = cols[0]
	var datos: VBoxContainer = cols[1]
	var vale: VBoxContainer = cols[2]
	CareerUi.head(espejo, I18n.t("JUGADOR NUEVO"))


	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 14)
	espejo.add_child(head)
	_edit_badge = OvrBadge.new()
	_edit_badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_edit_badge.setup(SquadMeta.ovr_of(_draft, "DC"), 34)
	head.add_child(_edit_badge)
	var hint_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	hint_l.text = I18n.t("El puesto y el dorsal los da el asiento\nque elijas al final.")
	hint_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hint_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT


	hint_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	head.add_child(hint_l)





	_look_cfg = _draft_look()
	_build_look_mirror(String(_team.get("id", "")), espejo)
	var to_look: Button = CareerUi.accion("espejo", I18n.t("FISICO"), CareerTheme.NAV_MUNDO)
	to_look.pressed.connect(_open_draft_look)
	espejo.add_child(to_look)

	_name_edit = LineEdit.new()
	_name_edit.max_length = SquadEdits.NAME_MAX
	_name_edit.text = String(_draft.get("name", ""))
	_name_edit.placeholder_text = I18n.t("NOMBRE DEL JUGADOR")
	_name_edit.custom_minimum_size = Vector2(0, 96)
	_name_edit.add_theme_font_size_override("font_size", CareerTheme.T_MONEY)
	_name_edit.virtual_keyboard_enabled = true
	_style_line_edit(_name_edit)
	datos.add_child(_name_edit)




	var data_row: HBoxContainer = HBoxContainer.new()
	data_row.add_theme_constant_override("separation", 10)
	datos.add_child(data_row)
	_age_label = _build_cycler(data_row, I18n.t("EDAD"), _step_age)
	_build_nation_selector(datos)
	_refresh_data_row()

	var card: PanelContainer = CareerUi.chip()
	vale.add_child(card)
	var stats_col: VBoxContainer = VBoxContainer.new()
	stats_col.add_theme_constant_override("separation", 10)
	card.add_child(stats_col)
	for entry in STAT_LABELS:

		_stat_slider(stats_col, String(entry[0]), String(entry[1]), _draft, Callable())
	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("REFLEJOS solo cuenta en porteros.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	stats_col.add_child(foot)

	var cta: Button = CareerUi.primary_cta(I18n.t("ELEGIR ASIENTO"), _start_place)
	cta.disabled = _name_edit.text.strip_edges().is_empty()
	datos.add_child(cta)


	_name_edit.text_changed.connect(func(t: String) -> void:
		_draft["name"] = t.strip_edges()
		cta.disabled = _draft["name"].is_empty()



		if not _draft.has("look"):
			_look_cfg = _draft_look()
			_refresh_look_preview())

	var spring: Control = Control.new()
	spring.size_flags_vertical = Control.SIZE_EXPAND_FILL
	datos.add_child(spring)
	CareerUi.back_button(datos, _on_back)














func _duplicate_player() -> void:
	_flush_name()
	var team_id: String = String(_team.get("id", ""))
	var origen: Dictionary = _slot_read_person(team_id, _idx)
	_draft = {"name": "", "age": int(origen.get("age", 24)),
		"nation": String(origen.get("nation", NATION_POOL[0]))}
	for entry in STAT_LABELS:
		_draft[String(entry[0])] = int(origen.get(String(entry[0]), 70))



	var look: Dictionary = _look_read(team_id, _idx)
	if not look.is_empty():
		_draft["look"] = look
	_page = "create"
	_render()




func _start_place() -> void:
	if String(_draft.get("name", "")).is_empty():
		return
	_swap = {"kind": "create", "name": String(_draft["name"]),
		"player": _draft.duplicate()}
	_page = "roster"
	_render()







func _flush_name() -> void:
	if _page == "player" and is_instance_valid(_name_edit):
		_commit_name(_name_edit)
	elif _page == "club":
		_commit_club_text()




func _start_swap() -> void:
	_flush_name()
	_swap = {
		"team_id": String(_team.get("id", "")),
		"team_name": String(_team.get("name", "")),
		"idx": _idx,
		"name": String(_edit_player.get("name", "")),
		"pos": String(_edit_player.get("pos", "MC")),


		"solo": false,
	}
	_same_pos = true
	_page = "clubs"
	_render()










func _start_div_swap() -> void:
	_flush_name()
	var team_id: String = String(_team.get("id", ""))
	var country: String = Teams.country_of(team_id)
	var div: int = _div_of(team_id)
	_swap = {
		"kind": "div",
		"team_id": team_id,
		"team_name": String(_team.get("name", "")),
		"div": div,
		"country": country,
	}
	_country_idx = maxi(_countries.find(country), 0)
	for d in _divs_of_country():
		if int(d) != div:
			_div = int(d)
			break
	_query = ""
	_query_raw = ""
	_page = "clubs"
	_render()









func _confirm_div_swap(club: Dictionary) -> void:
	var dst_id: String = String(club.get("id", ""))
	var src_id: String = String(_swap.get("team_id", ""))
	var src_div: int = int(_swap.get("div", 1))
	var dst_div: int = _div_of(dst_id)


	var src_name: String = String(_swap.get("team_name", ""))
	var dst_name: String = String(club.get("name", ""))
	var src_a: String = I18n.t(Teams.div_name(dst_div)).to_upper()
	var dst_a: String = I18n.t(Teams.div_name(src_div)).to_upper()
	var lineas: Array = [
		I18n.tf("{0} pasa a {1}.", [src_name, src_a]),
		I18n.tf("{0} pasa a {1}.", [dst_name, dst_a]),
		I18n.t("Se cruzan los dos, así que cada división sigue con los mismos equipos."),


		I18n.t("Su plantel y su fuerza no cambian."),
	]



	lineas.append(I18n.t("El calendario se vuelve a sortear: liga, copa y europeas.")
		if _carrera else
		I18n.t("Las carreras ya empezadas siguen con la división que tengan."))
	_overlay(I18n.t("CONFIRMAR CAMBIO DE DIVISION"), lineas,
		I18n.t("CONFIRMAR"), func() -> void:




		var hecho: bool = _do_swap_div(src_id, dst_id)
		_swap = {}
		_team = Teams.by_id(src_id)
		if hecho:
			_notice = I18n.tf("CAMBIO HECHO: {0} A {1}.",
				[CareerTheme.caps(src_name), src_a])
		_page = "roster" if (hecho or _carrera) else "club"
		_render())




func _swap_banner(parent: Container, step_text: String, hint: String) -> void:
	if _swap.is_empty():
		return
	var plate: PanelContainer = CareerUi.plate()
	parent.add_child(plate)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	plate.add_child(col)
	var who: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.accent_text())


	if _pending_div():


		who.text = I18n.tf("CAMBIO DE DIVISION: {0} ({1})", [
			String(_swap["team_name"]).to_upper(),
			I18n.t(Teams.div_name(int(_swap.get("div", 1)))).to_upper()])
	elif _pending_derbi():
		who.text = I18n.tf("DERBI DE: {0}", [String(_swap["team_name"]).to_upper()])
	elif _pending_nat_derbi():

		who.text = I18n.tf("DERBI DE: {0}", [String(_swap["name"])])
	elif _pending_coach():

		who.text = I18n.tf("CAMBIO DE EQUIPO: {0} ({1})", [
			String(_swap["name"]).to_upper(), String(_swap["team_name"]).to_upper()])
	elif _pending_create():
		who.text = I18n.tf("JUGADOR NUEVO: {0}",
			[CareerUi.display_name(String(_swap["name"])).to_upper()])
	else:
		who.text = I18n.tf("TRASPASO: {0} ({1} · {2})", [
			CareerUi.display_name(String(_swap["name"])).to_upper(),
			String(_swap["pos"]), String(_swap["team_name"]).to_upper()])
	who.clip_text = true
	col.add_child(who)
	var step_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	step_l.text = step_text
	col.add_child(step_l)
	if not hint.is_empty():
		var hint_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		hint_l.text = hint




		hint_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		col.add_child(hint_l)




	if not _pending_div() and not _pending_create() and not _pending_coach() \
			and not _pending_derbi() and not _pending_nat_derbi():
		var modo: Button = Button.new()
		modo.text = I18n.t("SE VA SOLO (SIN CAMBIO)") if _pending_solo() \
				else I18n.t("INTERCAMBIO CON OTRO JUGADOR")
		modo.custom_minimum_size = Vector2(0, 72)
		CareerTheme.apply_button(modo,
			CareerTheme.Kind.PRIMARY if _pending_solo() else CareerTheme.Kind.GHOST,
			CareerTheme.T_DIM)
		modo.pressed.connect(func() -> void:
			_swap["solo"] = not _pending_solo()
			_render())
		col.add_child(modo)
		var modo_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		modo_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		modo_l.text = I18n.t("Nadie vuelve a cambio: su club se queda con un jugador menos.") \
				if _pending_solo() else I18n.t("Los dos jugadores cambian de club.")
		col.add_child(modo_l)

	var cancel: Button = Button.new()
	if _pending_div() or _pending_coach() or _pending_derbi() or _pending_nat_derbi():
		cancel.text = I18n.t("CANCELAR CAMBIO")
	else:
		cancel.text = I18n.t("CANCELAR ALTA") if _pending_create() \
				else I18n.t("CANCELAR TRASPASO")
	cancel.custom_minimum_size = Vector2(0, 72)
	CareerTheme.apply_button(cancel, CareerTheme.Kind.GHOST, CareerTheme.T_DIM)
	cancel.pressed.connect(_cancel_swap)
	col.add_child(cancel)




func _cancel_swap() -> void:
	var was_create: bool = _pending_create()







	if _pending_nat_derbi():
		_team = Nations.as_team(String(_swap.get("nat_id", "")))
		_swap = {}
		_page = "nation"
		_render()
		return
	if _pending_div() or _pending_derbi():
		var en_plantel: bool = _carrera and _pending_div()
		_team = Teams.by_id(String(_swap.get("team_id", "")))
		_swap = {}
		_page = "roster" if en_plantel else "club"
		_render()
		return

	if _pending_coach():
		_team = Teams.by_id(String(_swap.get("team_id", "")))
		_swap = {}
		_page = "coach"
		_render()
		return
	_swap = {}
	_page = "create" if was_create else "roster"
	_render()







func _confirm_move(club: Dictionary) -> void:
	var dst_id: String = String(club.get("id", ""))



	var motivo: String = _motivo_no_move(String(_swap["team_id"]),
		int(_swap["idx"]), dst_id)
	if not motivo.is_empty():
		_aviso(I18n.t("NO SE PUDO"), motivo)
		return
	var a_name: String = CareerUi.display_name(String(_swap["name"]))
	var origen: String = String(_swap["team_name"])
	var seats_a: int = _squad_read(String(_swap["team_id"])).size()
	var seats_b: int = _squad_read(dst_id).size()
	_overlay(I18n.t("CONFIRMAR TRASPASO"), [
		I18n.tf("{0} ficha por {1}.", [a_name, String(club.get("name", ""))]),
		I18n.t("Nadie vuelve a cambio y nadie deja su asiento."),
		I18n.tf("{0} se queda con {1} jugadores y {2} pasa a {3}.",
			[origen, seats_a - 1, String(club.get("name", "")), seats_b + 1]),
		I18n.t("Sigue jugando en su puesto, con un dorsal libre del club nuevo."),
	], I18n.t("CONFIRMAR"), func() -> void:
		if not _do_move(String(_swap["team_id"]), int(_swap["idx"]), dst_id):



			_aviso(I18n.t("NO SE PUDO"), I18n.t("Ese traspaso no se puede hacer."))
			return
		_notice = I18n.tf("TRASPASO HECHO: {0} FICHA POR {1}.",
			[CareerTheme.caps(a_name),
			CareerTheme.caps(String(club.get("name", "")))])



		_flash_idx = seats_b
		_swap = {}
		_team = Teams.by_id(dst_id)
		_page = "roster"
		_render())







func _confirm_swap(team_id: String, i: int) -> void:
	var dst: Dictionary = _slot_read(team_id, i)
	var a_name: String = CareerUi.display_name(String(_swap["name"]))
	var b_name: String = CareerUi.display_name(String(dst.get("name", "")))
	var b_pos: String = String(dst.get("pos", "MC"))
	if _pending_create():
		_overlay(I18n.t("CONFIRMAR ALTA"), [
			I18n.tf("{0} entra en {1}.", [a_name, String(_team.get("name", ""))]),
			I18n.tf("{0} deja su asiento y SALE del juego.", [b_name]),
			I18n.tf("El nuevo jugará de {0} con el dorsal {1}.", [b_pos,
				int(dst.get("number", i + 1))]),




			I18n.t("No es para siempre: QUITAR EDICION devuelve al de antes."),
		], I18n.t("CREAR"), func() -> void:
			_do_place(team_id, i, _swap["player"])
			_notice = I18n.tf("ALTA HECHA: {0} ENTRA POR {1}.",
				[CareerTheme.caps(a_name), CareerTheme.caps(b_name)])
			_flash_idx = i
			_swap = {}
			_draft = {}
			_team = Teams.by_id(team_id)
			_page = "roster"
			_render())
		return
	var a_pos: String = String(_swap["pos"])
	var lines: Array = [
		I18n.tf("{0} ficha por {1}.", [a_name, String(_team.get("name", ""))]),
		I18n.tf("{0} se marcha a {1}.", [b_name, String(_swap["team_name"])]),
	]
	if a_pos != b_pos:
		lines.append(I18n.tf("OJO: {0} pasa a jugar de {1} y {2} de {3}.", [
			a_name, b_pos, b_name, a_pos]))
	_overlay(I18n.t("CONFIRMAR TRASPASO"), lines, I18n.t("CONFIRMAR"), func() -> void:
		_do_swap(String(_swap["team_id"]), int(_swap["idx"]), team_id, i)
		_notice = I18n.tf("TRASPASO HECHO: {0} LLEGA POR {1}.",
			[CareerTheme.caps(a_name), CareerTheme.caps(b_name)])
		_flash_idx = i
		_swap = {}
		_team = Teams.by_id(team_id)
		_page = "roster"
		_render())


func _confirm_reset_team(team_id: String) -> void:
	_overlay(I18n.t("QUITAR EDICIONES"), [
		I18n.tf("Todo el {0} vuelve a su plantilla de base.",
			[String(_team.get("name", ""))]),
		I18n.t("Los traspasos hechos con este club también se deshacen aquí.")],
		I18n.t("QUITAR TODO"), func() -> void:
			_team_reset(team_id)
			_render())











func _overlay(title_text: String, lines: Array, ok_text: String,
		on_ok: Callable, cancel_text: String = "") -> void:
	var col: VBoxContainer = CareerUi.modal(self)

	if col == null:
		return
	col.add_theme_constant_override("separation", 18)
	var t: Label = Label.new()
	CareerTheme.title(t, CareerTheme.T_TITLE_MODAL)
	t.text = title_text
	col.add_child(t)
	for line in lines:
		var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
		l.text = String(line)
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		col.add_child(l)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	col.add_child(row)
	var cancel: Button = Button.new()



	cancel.text = I18n.t(cancel_text if not cancel_text.is_empty() else "CANCELAR")
	cancel.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	cancel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(cancel, CareerTheme.Kind.GHOST, CareerTheme.BTN_ROW_FONT)
	cancel.pressed.connect(func() -> void: CareerUi.close_modal(cancel))
	row.add_child(cancel)
	var okb: Button = Button.new()
	okb.text = ok_text
	okb.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	okb.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(okb, CareerTheme.Kind.PRIMARY, CareerTheme.BTN_ROW_FONT)
	okb.pressed.connect(func() -> void:
		CareerUi.close_modal(okb)
		on_ok.call())
	row.add_child(okb)
	CareerUi.normalize_caps(col)














var _coach_desde_edits: bool = false



var _coach_cfg: Dictionary = {}
var _coach_preview: PlayerAvatar = null
var _coach_look_undo: Button = null


const COACH_FILA_H: float = 104.0
const COACH_CARA_K: float = 2.0
const COACH_CARA_FICHA_K: float = 5.0


const COACH_SEDE_K: float = 26.0

const COACH_ESPEJO_K: float = 7.0




func _coach_tocado(team_id: String) -> bool:
	if MisterEdits.editado(Coaches.id_of(team_id), _carrera):
		return true
	return not _carrera and MisterEdits.origen_fabrica(team_id) != team_id






func _coach_nivel_pintado(team_id: String) -> int:
	if _carrera:
		return Coaches.nivel_of(team_id)
	var fijo: int = MisterEdits.nivel_de(Coaches.id_of(team_id), false)
	if fijo >= 0:
		return fijo
	var org0: String = String(Coaches.seat(team_id).get("club", team_id))
	return Coach.nivel_tipico(org0, Teams.rating(org0))





func _coach_base_actual(team_id: String) -> int:
	var fijo: int = MisterEdits.nivel_de(Coaches.id_of(team_id), _carrera)
	if fijo >= 0:
		return fijo
	var s: Dictionary = Coaches.seat(team_id)
	var org: String = String(s.get("club", team_id))
	if not _carrera:
		return Coach.nivel_tipico(org, Teams.rating(org))
	return Coach.nivel_base(org, int(s.get("term", Coaches.TERM_BASE)), Teams.rating(org),
		Career.world_seed)




func _coach_row(parent: Container, team_id: String, desde_edits: bool) -> void:
	var id: String = Coaches.id_of(team_id)
	if id.is_empty():
		return
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, COACH_FILA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.text = ""
	b.pressed.connect(func() -> void:
		_team = Teams.by_id(team_id)
		_coach_desde_edits = desde_edits
		_page = "coach"
		_render())
	parent.add_child(b)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 16.0
	row.offset_right = -16.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.add_theme_constant_override("separation", 14)
	b.add_child(row)
	row.add_child(CoachRankingView.cara(id, COACH_CARA_K))
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 2)
	row.add_child(col)






	if desde_edits:
		col.add_child(CoachRankingView._linea_club(team_id,
			Coaches.nation_of(team_id), COACH_SEDE_K))
	else:
		var rot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		rot.text = I18n.t("TÉCNICO")
		rot.clip_text = true
		col.add_child(rot)
	var nom: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	nom.text = Coaches.name_of(team_id)
	nom.clip_text = true
	col.add_child(nom)
	if _coach_tocado(team_id):
		var tag: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.accent_text())
		tag.text = I18n.t("EDITADO")
		tag.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		row.add_child(tag)
	var est: Control = CareerUi.estrellas(_coach_nivel_pintado(team_id), 24.0)
	est.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(est)
	_mute(row)





func _coach_clubs_editados() -> Array:
	var tocados: Dictionary = {}
	for id in MisterEdits.editados(_carrera):
		tocados[String(id)] = true
	var out: Array = []
	for t in Teams.all():
		var cid: String = String((t as Dictionary).get("id", ""))
		if cid.is_empty():
			continue
		if tocados.has(Coaches.id_of(cid)) \
				or (not _carrera and MisterEdits.origen_fabrica(cid) != cid):
			out.append(cid)
	out.sort_custom(func(a: String, b: String) -> bool:
		return CareerTheme.llave(String(Teams.by_id(a).get("name", ""))) \
				< CareerTheme.llave(String(Teams.by_id(b).get("name", ""))))
	return out




func _render_coach() -> void:
	var team_id: String = String(_team.get("id", ""))
	var id: String = Coaches.id_of(team_id)
	if id.is_empty():
		_page = "roster"
		_render()
		return
	if not _notice.is_empty():
		var note: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.accent_text())
		note.text = _notice
		note.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_body.add_child(note)
		_notice = ""
	CareerUi.head(_body, I18n.t("TÉCNICO"))
	var plate: PanelContainer = CareerUi.plate()
	_body.add_child(plate)
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 18)
	plate.add_child(top)
	top.add_child(CoachRankingView.cara(id, COACH_CARA_FICHA_K))
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 10)
	top.add_child(col)
	var nom: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	nom.text = Coaches.name_of(team_id)
	nom.clip_text = true
	col.add_child(nom)
	col.add_child(CoachRankingView._linea_club(team_id, Coaches.nation_of(team_id), 30.0))
	var idea: Dictionary = Coach.idea_of(Coaches.idea_of(team_id))
	var idea_l: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	idea_l.text = I18n.t(String(idea.get("label", "")))
	idea_l.clip_text = true
	col.add_child(idea_l)


	CareerUi.subhead(_body, I18n.t("HABILIDAD"))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	_body.add_child(fila)
	var base: int = _coach_base_actual(team_id)
	var menos: Button = _arrow("-")
	menos.disabled = base <= MisterEdits.NIV_MIN
	menos.pressed.connect(_step_coach_nivel.bind(-1))
	fila.add_child(menos)
	var est: Control = CareerUi.estrellas(_coach_nivel_pintado(team_id), 40.0, true)
	est.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	est.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(est)
	var mas: Button = _arrow("+")
	mas.disabled = base >= MisterEdits.NIV_MAX
	mas.pressed.connect(_step_coach_nivel.bind(1))
	fila.add_child(mas)



	var fija: bool = MisterEdits.nivel_de(id, _carrera) >= 0
	var nota: String = ""
	if not _carrera:
		nota = I18n.t("Fija en todas tus carreras. Sus resultados la suben o la bajan.") \
				if fija else I18n.t("Sin tocar, se sortea en cada carrera alrededor de esto.")
	else:
		nota = I18n.t("Sus resultados la suben o la bajan hasta estrella y media.")
	var nota_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	nota_l.text = nota
	nota_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_body.add_child(nota_l)


	var acciones: HBoxContainer = HBoxContainer.new()
	acciones.add_theme_constant_override("separation", 10)
	_body.add_child(acciones)


	var cara_b: Button = CareerUi.accion("espejo", I18n.t("SU CARA"), CareerTheme.NAV_MUNDO)
	cara_b.custom_minimum_size = Vector2(0, 84)
	cara_b.pressed.connect(_open_coach_look)
	acciones.add_child(cara_b)
	var eq_b: Button = CareerUi.accion("mercado", I18n.t("CAMBIAR DE EQUIPO"),
		CareerTheme.NAV_MUNDO)
	eq_b.custom_minimum_size = Vector2(0, 84)
	eq_b.pressed.connect(_start_coach_move)
	acciones.add_child(eq_b)


	CareerUi.dim(_body, I18n.t("El cambio de equipo vale para las carreras nuevas.")
		if not _carrera else I18n.t("El cambio de equipo vale desde hoy en esta carrera."))











	var sede: Dictionary = Coaches.seat(team_id)
	if _carrera and team_id != GameState.player_team_id \
			and not bool(sede.get("libro", false)):
		var libre: Button = Button.new()
		libre.text = I18n.t("DEJARLO LIBRE")
		libre.custom_minimum_size = Vector2(0, 84)
		CareerTheme.apply_button(libre, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
		libre.pressed.connect(func() -> void:
			var quien: String = Coaches.name_of(team_id).to_upper()
			Coaches.reserva(team_id, maxi(GameState.season_num, 1))
			_notice = I18n.tf("{0} SE QUEDA SIN EQUIPO. EN SU BANQUILLO SE SIENTA {1}.",
				[quien, Coaches.name_of(team_id).to_upper()])
			_render())
		_body.add_child(libre)
		CareerUi.dim(_body, I18n.t("Se va al mercado de técnicos y puede volver."))




	var org: String = String(sede.get("club", team_id))
	if not _carrera and org != team_id and not Teams.by_id(org).is_empty():
		var vuelve: Button = CareerUi.accion("girar", I18n.t("DEVOLVER A SU CLUB"),
			UiKit.BTN_BLUE["bg"] as Color)
		vuelve.custom_minimum_size = Vector2(0, 84)
		vuelve.pressed.connect(func() -> void:
			MisterEdits.cambia_sede(team_id, org)
			_notice = I18n.tf("{0} VUELVE A {1}.", [Coaches.name_of(org).to_upper(),
				CareerTheme.caps(String(Teams.by_id(org).get("name", "")))])
			_team = Teams.by_id(org)
			_render())
		_body.add_child(vuelve)
	if MisterEdits.editado(id, _carrera):
		var quitar: Button = Button.new()
		quitar.text = I18n.t("QUITAR EDICIÓN DEL TÉCNICO")
		quitar.custom_minimum_size = Vector2(0, 84)
		CareerTheme.apply_button(quitar, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
		quitar.pressed.connect(func() -> void:
			MisterEdits.quita(id, _carrera)
			_render())
		_body.add_child(quitar)
	var spring: Control = Control.new()
	spring.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_body.add_child(spring)
	CareerUi.back_button(_body, _on_back)




func _step_coach_nivel(dir: int) -> void:
	var team_id: String = String(_team.get("id", ""))
	var id: String = Coaches.id_of(team_id)
	var base: int = _coach_base_actual(team_id)
	var nuevo: int = clampi(base + dir, MisterEdits.NIV_MIN, MisterEdits.NIV_MAX)
	if nuevo == base:
		return
	MisterEdits.pon_nivel(id, nuevo, _carrera)
	_render()




func _open_coach_look() -> void:
	_coach_cfg = _full_look(Coach.look_de(Coaches.face_of(String(_team.get("id", "")))))
	_page = "coach_look"
	_render()





func _render_coach_look() -> void:
	var team_id: String = String(_team.get("id", ""))
	CareerUi.head(_body, I18n.t("SU CARA"))
	var who: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)

	who.text = "%s · %s" % [Coaches.name_of(team_id),
		CareerTheme.caps(String(_team.get("name", "")))]
	who.clip_text = true
	_body.add_child(who)
	var plate: PanelContainer = CareerUi.plate()
	_body.add_child(plate)
	var centro: CenterContainer = CenterContainer.new()
	plate.add_child(centro)
	_coach_preview = PlayerAvatar.new()
	_coach_preview.bust = PlayerAvatar.BUST_CLOSE
	_coach_preview.custom_minimum_size = PlayerAvatar.BUST_CLOSE.size * COACH_ESPEJO_K
	_coach_preview.mouse_filter = Control.MOUSE_FILTER_IGNORE
	centro.add_child(_coach_preview)
	_coach_preview.set_look(_coach_cfg, CoachRankingView.COACH_TEX)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_body.add_child(scroll)
	var look: LookEditor = LookEditor.new()
	look.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	look.view = "fisico"
	look.set_cfg(_coach_cfg)
	look.changed.connect(_on_coach_look_changed)
	scroll.add_child(look)

	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("La cara viaja con él: si cambia de banquillo, se la lleva. Se guarda sola.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_body.add_child(foot)


	_coach_look_undo = Button.new()
	_coach_look_undo.text = I18n.t("QUITAR CARA (VOLVER A LA SUYA)")
	_coach_look_undo.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button(_coach_look_undo, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	_coach_look_undo.pressed.connect(_clear_coach_look)
	_coach_look_undo.visible = not MisterEdits.look_de(Coaches.id_of(team_id),
		_carrera).is_empty()
	_body.add_child(_coach_look_undo)
	CareerUi.back_button(_body, _on_back)



func _on_coach_look_changed(cfg: Dictionary) -> void:
	_coach_cfg = _full_look(cfg)
	MisterEdits.pon_look(Coaches.id_of(String(_team.get("id", ""))), _coach_cfg, _carrera)
	if is_instance_valid(_coach_preview):
		_coach_preview.set_look(_coach_cfg, CoachRankingView.COACH_TEX)
	if is_instance_valid(_coach_look_undo):
		_coach_look_undo.visible = true




func _clear_coach_look() -> void:
	var team_id: String = String(_team.get("id", ""))
	MisterEdits.quita_look(Coaches.id_of(team_id), _carrera)
	_coach_cfg = _full_look(Coach.look_de(Coaches.face_of(team_id)))
	_render()




func _start_coach_move() -> void:
	var team_id: String = String(_team.get("id", ""))
	_swap = {
		"kind": "coach",
		"team_id": team_id,
		"team_name": String(_team.get("name", "")),
		"name": Coaches.name_of(team_id),
	}
	_query = ""
	_query_raw = ""
	_page = "clubs"
	_render()




func _confirm_coach_move(club: Dictionary) -> void:
	var src_id: String = String(_swap.get("team_id", ""))
	var dst_id: String = String(club.get("id", ""))
	if src_id.is_empty() or dst_id.is_empty() or src_id == dst_id:
		return
	var src_name: String = String(_swap.get("team_name", ""))
	var dst_name: String = String(club.get("name", ""))
	var el: String = String(_swap.get("name", ""))
	var otro: String = Coaches.name_of(dst_id)
	var lineas: Array = [
		I18n.tf("{0} pasa a entrenar al {1}.", [el, dst_name]),
		I18n.tf("{0} pasa a entrenar al {1}.", [otro, src_name]),
		I18n.t("Cada uno se lleva su habilidad, su cara y sus trofeos."),
	]



	if not _carrera:
		lineas.append(I18n.t("Las carreras ya empezadas siguen con sus banquillos."))
	elif GameState.player_team_id in [src_id, dst_id]:
		lineas.append(I18n.t("Tu relación con tu técnico no cambia."))
	_overlay(I18n.t("CONFIRMAR CAMBIO DE EQUIPO"), lineas, I18n.t("CONFIRMAR"),
		func() -> void:
			var hecho: bool = Coaches.intercambia(src_id, dst_id) if _carrera \
					else MisterEdits.cambia_sede(src_id, dst_id)
			_swap = {}


			_team = Teams.by_id(dst_id if hecho else src_id)
			if hecho:
				_notice = I18n.tf("CAMBIO HECHO: {0} ENTRENA AL {1}.",
					[el.to_upper(), CareerTheme.caps(dst_name)])
			_page = "coach"
			_render())



















var _legend_key: String = ""


var _legend_cfg: Dictionary = {}
var _legend_undo: Button = null


var _legend_desde_edits: bool = false


const LEGEND_FILA_H: float = 104.0
const LEGEND_CARA_K: float = 2.0





func _legends_pool() -> Array:
	var out: Array = []
	out.append_array(Legends.ALL)
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return Legends.rank_prestige(a) > Legends.rank_prestige(b))
	return out






func _legend_club(e: Dictionary) -> String:
	var vivo: String = String(e.get("live_club", ""))
	if not vivo.is_empty() and not Teams.by_id(vivo).is_empty():
		return vivo
	var mejor: String = ""
	var top: int = -1
	var clubs: Variant = e.get("clubs", {})
	if clubs is Dictionary:
		for id in (clubs as Dictionary):
			if Teams.by_id(String(id)).is_empty():
				continue
			var t: int = 0
			var titulos: Variant =(clubs as Dictionary)[id]
			if titulos is Array:
				for n in (titulos as Array):
					t += int(n)
			if t > top:
				top = t
				mejor = String(id)
	return mejor





func _legend_entry(key: String) -> Dictionary:
	for e in Legends.ALL:
		if String(e.get("name", "")) == key:
			return e
	return {}




func _render_legends() -> void:

	var partes: Array[VBoxContainer] = _partir_tumbado(MANDO_LISTA_W)
	var mando: VBoxContainer = partes[0]
	CareerUi.head(mando, I18n.t("LEYENDAS"))
	var sub: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	sub.text = I18n.t("Los grandes de la historia no juegan en ningún club: su cara se toca aquí.")
	mando.add_child(sub)
	if UiKit.es_horizontal():
		var nombres: Array = []
		for e in _legends_pool():
			nombres.append(Legends.pintado_de(String(e.get("name", ""))))
		_indice_iniciales(mando, nombres, _legend_elige_inicial)
	var list: VBoxContainer = _scroll_list(partes[1], true)
	for e in _legends_pool():
		if UiKit.es_horizontal() and not CareerTheme.empieza_por(Legends.pintado_de(
			String(e.get("name", ""))), _legend_inicial):
			continue
		_legend_row(list, e as Dictionary)
	if mando != _body:
		var muelle: Control = Control.new()
		muelle.size_flags_vertical = Control.SIZE_EXPAND_FILL
		mando.add_child(muelle)
	CareerUi.back_button(mando, _on_back)


func _legend_elige_inicial(letra: String) -> void:
	_legend_inicial = letra
	_page = "legends"
	_render()




func _legend_row(list: VBoxContainer, e: Dictionary,
		desde_edits: bool = false) -> void:
	var key: String = String(e.get("name", ""))
	if key.is_empty():
		return
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, LEGEND_FILA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_CARD)
	b.text = ""
	b.pressed.connect(_open_legend_look.bind(key, desde_edits))
	list.add_child(b)
	var row: HBoxContainer = HBoxContainer.new()
	row.set_anchors_preset(Control.PRESET_FULL_RECT)
	row.offset_left = 16.0
	row.offset_right = -16.0
	row.offset_bottom = - float(CareerTheme.SINK)
	row.add_theme_constant_override("separation", 14)
	b.add_child(row)
	var cara: PlayerAvatar = PlayerAvatar.new()
	cara.bust = PlayerAvatar.BUST_CLOSE
	cara.custom_minimum_size = PlayerAvatar.BUST_CLOSE.size * LEGEND_CARA_K
	cara.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cara.set_look(_legend_look_cfg(key))
	row.add_child(cara)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 2)
	row.add_child(col)
	var nom: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)


	nom.text = Legends.pintado_de(key)
	nom.clip_text = true
	col.add_child(nom)
	if LegendEdits.editada(key, _carrera):
		var tag: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.accent_text())
		tag.text = I18n.t("EDITADO")
		tag.clip_text = true
		col.add_child(tag)
	var flag: TextureRect = Flags.make_rect(Legends.flag_id(String(e.get("nat", ""))), 30.0)
	flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(flag)
	_mute(row)






func _legend_look_cfg(key: String) -> Dictionary:
	var cfg: Dictionary = LegendEdits.look_de(key, _carrera)
	if cfg.is_empty():
		cfg = KitRecolor.traits_for(Legends.cara_de(key, Legends.pintado_de(key)))
	return _full_look(cfg)


func _open_legend_look(key: String, desde_edits: bool = false) -> void:
	_legend_key = key
	_legend_desde_edits = desde_edits
	_legend_cfg = _legend_look_cfg(key)
	_page = "legend_look"
	_render()





func _render_legend_look() -> void:
	var e: Dictionary = _legend_entry(_legend_key)
	CareerUi.head(_body, I18n.t("SU CARA"))
	var who: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	var club_id: String = _legend_club(e)
	var club: Dictionary = Teams.by_id(club_id)

	who.text = "%s · %s" % [Legends.pintado_de(_legend_key),
		CareerTheme.caps(String(club.get("name", "")))] if not club.is_empty() \
				else Legends.pintado_de(_legend_key)
	who.clip_text = true
	_body.add_child(who)

	_look_cfg = _legend_cfg
	_build_look_mirror(club_id)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_body.add_child(scroll)
	var look: LookEditor = LookEditor.new()
	look.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	look.view = "fisico"
	look.set_cfg(_legend_cfg)
	look.changed.connect(_on_legend_look_changed)
	scroll.add_child(look)

	var foot: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	foot.text = I18n.t("Sale con esta cara donde aparezca: al conocerla, en la gala y en la cancha. Se guarda sola.")
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_body.add_child(foot)


	_legend_undo = Button.new()
	_legend_undo.text = I18n.t("QUITAR CARA (VOLVER A LA SUYA)")
	_legend_undo.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button(_legend_undo, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	_legend_undo.pressed.connect(_clear_legend_look)
	_legend_undo.visible = LegendEdits.editada(_legend_key, _carrera)
	_body.add_child(_legend_undo)
	CareerUi.back_button(_body, _on_back)




func _on_legend_look_changed(cfg: Dictionary) -> void:
	_legend_cfg = _full_look(cfg)
	LegendEdits.pon_look(_legend_key, _legend_cfg, _carrera)


	_look_cfg = _legend_cfg
	_refresh_look_preview()
	if is_instance_valid(_legend_undo):
		_legend_undo.visible = true




func _clear_legend_look() -> void:
	LegendEdits.quita_look(_legend_key, _carrera)
	_legend_cfg = _legend_look_cfg(_legend_key)
	_render()





func _mute(node: Control) -> void:
	node.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for c in node.get_children():
		if c is Control:
			_mute(c)




func _open_picker() -> FlagPicker:
	for c in get_children():
		if c is FlagPicker:
			return c
	return null


func _arrow(text: String) -> Button:
	var b: Button = Button.new()
	b.text = text
	b.custom_minimum_size = Vector2(76, 84)
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_MONEY)
	return b















func _stepper(parent: Container, i: int, total: int, on_step: Callable) -> void:
	if total <= 1 or i < 0:
		return
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	parent.add_child(row)
	var prev: Button = _arrow("<")
	prev.disabled = i <= 0
	prev.pressed.connect(func() -> void: on_step.call(-1))
	row.add_child(prev)
	var val: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	val.text = "%d / %d" % [i + 1, total]
	val.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	val.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	val.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(val)
	var nxt: Button = _arrow(">")
	nxt.disabled = i >= total - 1
	nxt.pressed.connect(func() -> void: on_step.call(1))
	row.add_child(nxt)




func _hermanos_de(team_id: String) -> Array:
	var key: String = "%s|%d" % [Teams.country_of(team_id), _div_of(team_id)]
	if key != _hermanos_key:
		_hermanos_key = key
		_hermanos = _clubs_in_div(Teams.country_of(team_id), _div_of(team_id))
	return _hermanos




func _pos_hermano(team_id: String) -> int:
	var lista: Array = _hermanos_de(team_id)
	for k in lista.size():
		if String((lista[k] as Dictionary).get("id", "")) == team_id:
			return k
	return -1




func _salta_club(dir: int) -> void:
	var id: String = String(_team.get("id", ""))
	var lista: Array = _hermanos_de(id)
	var j: int = _pos_hermano(id) + dir
	if j < 0 or j >= lista.size():
		return


	_flush_name()
	_team = Teams.by_id(String((lista[j] as Dictionary).get("id", "")))

	_club_slot = 0
	_idx = -1
	_render()



func _salta_jugador(dir: int) -> void:
	var squad: Array = _squad_read(String(_team.get("id", "")))
	var j: int = _idx + dir
	if j < 0 or j >= squad.size():
		return
	_flush_name()
	_open_player(j)





func _on_back() -> void:



	if _importando:
		return




	var picker: FlagPicker = _open_picker()
	if picker != null:
		picker.queue_free()
		return





	if CareerUi.close_top_modal(self):
		return
	match _page:
		"player":
			_flush_name()
			_page = "roster"
			_render()
		"look":
			if _look_draft:


				_look_draft = false
				_page = "create"
				_render()
				return


			_edit_player = _slot_read(String(_team.get("id", "")), _idx)
			_page = "player"
			_render()
		"club":
			_flush_name()



			_page = "clubs" if _club_desde_lista else "roster"
			_render()
		"create":
			_page = "roster"
			_render()
		"roster":
			_page = "edits" if _edits_desde_roster else "clubs"
			_edits_desde_roster = false
			_render()
		"edits":
			_page = "clubs"
			_render()
		"packs":
			_page = "clubs"
			_render()
		"comunidad":
			_page = "clubs"
			_render()
		"coach":


			_page = "edits" if _coach_desde_edits else "roster"
			_coach_desde_edits = false
			_render()
		"coach_look":

			_page = "coach"
			_render()
		"legend_look":


			_page = "edits" if _legend_desde_edits else "legends"
			_legend_desde_edits = false
			_render()
		"legends":
			_page = "clubs"
			_render()
		"nations":
			if _pending_nat_derbi():
				_cancel_swap()
			else:
				_page = "clubs"
				_render()
		"nation":

			_page = "edits" if _nat_desde_edits else "nations"
			_nat_desde_edits = false
			_render()
		"nation_squad":
			_page = "nation"
			_render()
		"clubs":
			if not _swap.is_empty():
				if not _pending_create():
					_team = Teams.by_id(String(_swap["team_id"]))
				_cancel_swap()
			elif _carrera:



				SceneFade.to_scene("res://ui/settings_menu.tscn")
			else:
				SceneFade.to_scene("res://ui/main_menu.tscn")
