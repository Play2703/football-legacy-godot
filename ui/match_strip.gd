class_name MatchStrip
extends Control

















const H: int = 196
const PAD: float = 14.0
const GAP: float = 12.0
const F_TODAY: float = 0.46
const FLANK_VINSET: float = 15.0
const HEADER_H: float = 30.0
const LIP: float = 3.0



const COMP_SHORT: Dictionary = {
	"liga": "LIGA", "copa": "COPA", "champions": "UCL", "europa": "UEL",
	"conference": "UECL", "clasif": "CLASIF", "mundial": "MUNDIAL",



	"mundialito": "CLUBES",


	"libertadores": "LIB", "sudamericana": "SUD", "concacaf": "CCC",
	"oriente": "ORI", "sol": "CSO",

	"atlas": "ATL", "baobab": "BAO",


	"coral": "COR",
}




const FAKE_COMP_SHORT: Dictionary = {
	"liga": "LIGA", "copa": "COPA", "champions": "CC", "europa": "CEU",
	"conference": "CCF", "clasif": "CLASIF", "mundial": "MUNDIAL",
	"mundialito": "CLUBES",


	"libertadores": "GLO", "sudamericana": "SUR", "concacaf": "NOR",

	"oriente": "ORI", "sol": "CSO",

	"atlas": "ATL", "baobab": "BAO",

	"coral": "COR",
}



static func _short(cid: String) -> String:







	var puesto: String = Competitions.pack_short(cid, 9)
	if not puesto.is_empty():
		return puesto
	var tbl: Dictionary = FAKE_COMP_SHORT if Teams.fake_names_on() else COMP_SHORT
	return String(tbl.get(cid, ""))











static func short_of(fx: Dictionary) -> String:
	if Competitions.is_liguilla(fx):
		return Competitions.LIGUILLA_NAME
	var torneo: String = Competitions.torneo_key(fx)
	if not torneo.is_empty():
		return torneo
	return _short(Competitions.id_of(fx))

var _past: Dictionary = {}
var _now: Dictionary = {}
var _next: Dictionary = {}
var _t: float = 0.0



var _hero: Control = null
var _flank_past: Control = null
var _flank_next: Control = null


func _ready() -> void:
	custom_minimum_size = Vector2(0, H)
	set_process(true)





func set_matches(past: Dictionary, current: Dictionary, next: Dictionary) -> void:
	_past = past
	_now = current
	_next = next
	for c in get_children():
		remove_child(c)
		c.queue_free()




	var today_comp: String = short_of(current) if not current.is_empty() else ""
	_flank_past = _make_flank("past", past, today_comp)
	_hero = _make_hero(current)
	_flank_next = _make_flank("next", next, today_comp)
	add_child(_flank_past)
	add_child(_hero)
	add_child(_flank_next)
	_relayout()
	queue_redraw()


func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED:
		_relayout()
		queue_redraw()





func _rects() -> Dictionary:
	var iw: float = size.x - PAD * 2.0
	var y: float = 12.0
	var h: float = size.y - 24.0
	var wt: float = iw * F_TODAY
	var wf: float =(iw - wt - GAP * 2.0) * 0.5
	var x0: float = PAD
	var xt: float = x0 + wf + GAP
	var xn: float = xt + wt + GAP
	return {
		"past": Rect2(x0, y + FLANK_VINSET, wf, h - FLANK_VINSET * 2.0),
		"today": Rect2(xt, y, wt, h),
		"next": Rect2(xn, y + FLANK_VINSET, wf, h - FLANK_VINSET * 2.0),
	}


func _relayout() -> void:
	if _hero == null:
		return
	var r: Dictionary = _rects()
	_flank_past.position =(r["past"] as Rect2).position
	_flank_past.size =(r["past"] as Rect2).size
	_hero.position =(r["today"] as Rect2).position
	_hero.size =(r["today"] as Rect2).size
	_flank_next.position =(r["next"] as Rect2).position
	_flank_next.size =(r["next"] as Rect2).size






func _make_flank(role: String, slot: Dictionary, today_comp: String) -> Control:
	var cell: Control = Control.new()
	cell.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var box: VBoxContainer = VBoxContainer.new()
	box.set_anchors_preset(Control.PRESET_FULL_RECT)
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_theme_constant_override("separation", 7)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cell.add_child(box)

	var kicker: String = I18n.t("ULTIMO") if role == "past" else I18n.t("PROXIMO")
	_lbl(box, kicker, 12, CareerTheme.TEXT_DIM)

	if slot.is_empty():
		_lbl(box, "—", 30, CareerTheme.TEXT_DIM)
		_lbl(box, I18n.t("DEBUT") if role == "past" else I18n.t("FIN"), 12, CareerTheme.TEXT_DIM)
		return cell

	var rival: Dictionary = GameState.rival_of(slot)
	var abbr: String = _abbr(rival)

	_lbl(box, abbr, 30, CareerTheme.TEXT if role == "past" else CareerTheme.TEXT_DIM)

	if role == "past":
		box.add_child(_result_chip(slot))
	else:
		_venue_row(box, bool(slot.get("home", true)))





	var sigla: String = short_of(slot)
	var diff: bool = sigla != today_comp
	if role == "next":
		var rnd: String = _round_short(slot)
		if diff and not rnd.is_empty():
			_lbl(box, "%s · %s" % [I18n.t(sigla), rnd], 12,
				_visible(Competitions.accent_of(slot)))
		elif diff:
			_lbl(box, I18n.t(sigla), 12,
				_visible(Competitions.accent_of(slot)))
		elif not rnd.is_empty():
			_lbl(box, rnd, 12, CareerTheme.TEXT_DIM)
	elif diff:
		_lbl(box, I18n.t(sigla), 12,
			_visible(Competitions.accent_of(slot)))
	return cell



func _result_chip(slot: Dictionary) -> Control:
	var gf: int = int(slot.get("gf", 0))
	var gc: int = int(slot.get("gc", 0))
	var col: Color = CareerTheme.GOOD if gf > gc else (CareerTheme.DANGER if gf < gc else CareerTheme.TEXT_DIM)



	var letter: String = I18n.t("G") if gf > gc \
			else (I18n.t("P") if gf < gc else I18n.t("E"))
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 8)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var badge: PanelContainer = PanelContainer.new()
	badge.add_theme_stylebox_override("panel", CareerTheme.tag(col))
	badge.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var bl: Label = CareerUi.plain(15, CareerTheme.BG_DEEP)
	bl.text = letter
	bl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	badge.add_child(bl)
	row.add_child(badge)
	var score: Label = CareerUi.plain(20, col)
	score.text = "%d-%d" % [gf, gc]
	row.add_child(score)
	return row




func _make_hero(slot: Dictionary) -> Control:
	var cell: Control = Control.new()
	cell.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if slot.is_empty():
		var mid: VBoxContainer = VBoxContainer.new()
		mid.set_anchors_preset(Control.PRESET_FULL_RECT)
		mid.alignment = BoxContainer.ALIGNMENT_CENTER
		mid.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cell.add_child(mid)
		_lbl(mid, I18n.t("SIN PARTIDO"), 26, CareerTheme.TEXT_DIM)
		return cell

	var rival: Dictionary = GameState.rival_of(slot)
	var on: Color = CareerTheme.on_accent()


	var header: HBoxContainer = HBoxContainer.new()
	header.set_anchors_and_offsets_preset(Control.PRESET_TOP_WIDE)
	header.offset_left = 14.0
	header.offset_right = -14.0
	header.offset_top = 0.0
	header.offset_bottom = HEADER_H
	header.alignment = BoxContainer.ALIGNMENT_BEGIN
	header.add_theme_constant_override("separation", 8)
	header.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cell.add_child(header)
	var logo: CompLogo = CompLogo.new()
	logo.custom_minimum_size = Vector2(20, 20)
	logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	logo.setup(Competitions.logo_type_of(slot), on)
	header.add_child(logo)
	var comp_lbl: Label = CareerUi.plain(13, on)
	var short: String = short_of(slot)
	comp_lbl.text = I18n.t(short if not short.is_empty() else "LIGA")
	comp_lbl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	header.add_child(comp_lbl)





	var round_txt: String = _round_short(slot)
	if not round_txt.is_empty():
		var round_lbl: Label = CareerUi.plain(13, on)
		round_lbl.text = "· %s" % round_txt
		round_lbl.modulate.a = 0.78
		round_lbl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		round_lbl.clip_text = true
		round_lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		header.add_child(round_lbl)
	else:
		var hspace: Control = Control.new()
		hspace.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		hspace.mouse_filter = Control.MOUSE_FILTER_IGNORE
		header.add_child(hspace)
	var is_derby: bool = Career.is_derby(String(rival.get("id", "")))
	var tag_lbl: Label = CareerUi.plain(13, on)
	tag_lbl.text = I18n.t("DERBI") if is_derby else I18n.t("HOY")
	tag_lbl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	header.add_child(tag_lbl)


	var body: VBoxContainer = VBoxContainer.new()
	body.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	body.offset_top = HEADER_H
	body.offset_bottom = - LIP
	body.alignment = BoxContainer.ALIGNMENT_CENTER
	body.add_theme_constant_override("separation", 10)
	body.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cell.add_child(body)
	_lbl(body, _abbr(rival), 54, CareerTheme.TEXT)





	var fdots: FormDots = FormDots.new()
	fdots.custom_minimum_size = Vector2(94, 12)
	fdots.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	fdots.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fdots.setup(FormDots.resolve(String(rival.get("id", _abbr(rival))),
		GameState.season_num, int(rival.get("rating", 62)),
		String(slot.get("comp", ""))))
	body.add_child(fdots)

	var home: bool = bool(slot.get("home", true))
	var venue_wrap: HBoxContainer = HBoxContainer.new()
	venue_wrap.alignment = BoxContainer.ALIGNMENT_CENTER
	venue_wrap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	body.add_child(venue_wrap)
	var pill: PanelContainer = PanelContainer.new()
	pill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var vcol: Color = on if home else CareerTheme.TEXT_DIM
	if home:
		pill.add_theme_stylebox_override("panel", CareerTheme.tag(CareerTheme.accent()))
	else:
		pill.add_theme_stylebox_override("panel", _outline_sb())
	var vl: Label = CareerUi.plain(14, vcol)
	vl.text = I18n.t("CASA") if home else I18n.t("FUERA")
	vl.mouse_filter = Control.MOUSE_FILTER_IGNORE




	var prow: HBoxContainer = HBoxContainer.new()
	prow.add_theme_constant_override("separation", 6)
	prow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var vic: MenuIcon = MenuIcon.new()
	vic.custom_minimum_size = Vector2(16, 16)
	vic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	vic.setup("local" if home else "visita", vcol)
	prow.add_child(vic)
	prow.add_child(vl)
	pill.add_child(prow)
	venue_wrap.add_child(pill)




	var vname: String = Competitions.venue_of(slot)
	if not vname.is_empty():
		var vn: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)
		vn.text = CareerTheme.caps(vname)
		vn.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER





		vn.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		vn.size_flags_horizontal = Control.SIZE_FILL
		vn.mouse_filter = Control.MOUSE_FILTER_IGNORE
		body.add_child(vn)




	if is_derby:
		var rec: Dictionary = Career.derby_record(String(rival.get("id", "")))
		if int(rec.get("played", 0)) > 0:
			var tally: Label = CareerUi.plain(13, CareerTheme.TEXT_DIM)
			tally.text = I18n.tf("{0} DERBIS · {1}",
				[int(rec["played"]), DerbyBook.tally(rec)])
			tally.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			tally.mouse_filter = Control.MOUSE_FILTER_IGNORE
			body.add_child(tally)
			var head: Dictionary = Career.derby_headline(String(rival.get("id", "")))
			if not String(head.get("key", "")).is_empty():



				var hl: Label = CareerUi.plain(13, CareerTheme.DANGER
					if bool(head.get("bad", false)) else CareerTheme.accent())
				hl.text = I18n.tf(String(head["key"]), head.get("args", []))
				hl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
				hl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
				hl.size_flags_horizontal = Control.SIZE_FILL
				hl.mouse_filter = Control.MOUSE_FILTER_IGNORE
				body.add_child(hl)
	return cell




func _abbr(rival: Dictionary) -> String:
	var a: String = String(rival.get("abbrev", ""))
	if a.is_empty():
		a = String(rival.get("name", "")).substr(0, 3).to_upper()
	return a










func _round_short(slot: Dictionary) -> String:
	if slot.is_empty():
		return ""
	return round_display(Competitions.round_of(slot))




static func round_display(raw: String) -> String:
	var r: String = raw.strip_edges()
	if r.is_empty():
		return ""



	var leg: Array = Competitions.split_leg(r)
	if not String(leg[1]).is_empty():



		return "%s (%s)" % [round_display(String(leg[0])),
			I18n.t(String(leg[1]), "ronda")]
	if r.begins_with("GRUPO"):
		var jn: String = r.substr(5).strip_edges().trim_prefix("J")
		return I18n.tf("GRUPO {0}", [jn.split("/")[0]])


	if r.begins_with("LIGA J"):
		var ln: String = r.substr(6).strip_edges()
		return I18n.tf("LIGA {0}", [ln.split("/")[0]])


	if r.begins_with("CLASIF J"):
		return I18n.tf("CLASIF J{0}", [r.substr(8)])


	if r.begins_with("J") and r.contains("/"):
		return I18n.tf("J{0}", [r.substr(1)])
	return I18n.t(r)


func _lbl(parent: BoxContainer, text: String, fsize: int, color: Color) -> void:
	var l: Label = CareerUi.plain(fsize, color)
	l.text = text
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.clip_text = true
	parent.add_child(l)




func _venue_row(box: BoxContainer, home: bool) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 5)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(14, 14)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup("local" if home else "visita", CareerTheme.TEXT_DIM)
	row.add_child(ic)
	var l: Label = CareerUi.plain(15, CareerTheme.TEXT_DIM)
	l.text = I18n.t("CASA") if home else I18n.t("FUERA")
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(l)
	box.add_child(row)



func _outline_sb() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0, 0, 0, 0)
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(1)
	sb.set_corner_radius_all(2)
	sb.content_margin_left = 14.0
	sb.content_margin_right = 14.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	return sb



func _visible(c: Color) -> Color:
	return c.lightened(0.4) if c.get_luminance() < 0.45 else c


func _process(delta: float) -> void:
	_t += delta
	queue_redraw()




func _draw() -> void:
	draw_style_box(CareerTheme.plate(), Rect2(Vector2.ZERO, size))
	var r: Dictionary = _rects()

	_draw_flank(r["past"])
	_draw_flank(r["next"])

	_draw_hero(r["today"], _now)




func _draw_flank(rect: Rect2) -> void:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0.05, 0.05, 0.06, 0.9)
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(1)
	sb.set_corner_radius_all(3)
	draw_style_box(sb, rect)


func _draw_hero(rect: Rect2, slot: Dictionary) -> void:
	var accent: Color = CareerTheme.accent()


	var panel: StyleBoxFlat = StyleBoxFlat.new()
	panel.bg_color = CareerTheme.SURFACE.lerp(accent, 0.1)
	panel.border_color = accent if slot.is_empty() else accent.lightened(0.05)
	panel.set_border_width_all(1)
	panel.set_corner_radius_all(3)
	draw_style_box(panel, rect)
	if slot.is_empty():
		return


	var band: Rect2 = Rect2(rect.position, Vector2(rect.size.x, HEADER_H))
	draw_rect(band, accent)

	var lip: Rect2 = Rect2(rect.position + Vector2(0, rect.size.y - LIP),
		Vector2(rect.size.x, LIP))
	draw_rect(lip, accent.darkened(0.5))


	var pulse: float = 0.5 + 0.5 * sin(_t * TAU / 1.5)
	var glow: Color = accent
	glow.a = lerp(0.35, 0.9, pulse)
	var uy: float = rect.position.y + rect.size.y - LIP - 3.0
	draw_rect(Rect2(rect.position.x + 16.0, uy, rect.size.x - 32.0, 2.0), glow)
