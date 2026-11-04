class_name RelationsStage
extends HBoxContainer
















signal relation_pressed(key: String)




const LABELS: Dictionary = {
	"tecnico": "TÉCNICO", "equipo": "VESTUARIO", "aficion": "AFICIÓN",
	"prensa": "PRENSA", "agente": "AGENTE", "pareja": "PAREJA",
}

var _cells: Dictionary = {}
var _vals: Dictionary = {}
var _tiers: Dictionary = {}
var _levels: Dictionary = {}
var _names: Array = []


const NAME_PX: int = 20
const NAME_PX_MIN: int = 12



static func headless() -> bool:
	return RelationCell.headless()















func setup(levels: Dictionary, club: Dictionary, div: int,
		deltas: Dictionary = {}, looks: Dictionary = {}) -> void:


	add_theme_constant_override("separation", 2)
	for key in RelationCell.KEYS:
		if not levels.has(key):
			continue
		var v: int = clampi(int(levels.get(key, 50)), 0, 100)
		_levels[key] = v
		add_child(_column(key, v, int(deltas.get(key, 0)), club, div,
			looks.get(key, {})))
	if not resized.is_connected(_fit_names):
		resized.connect(_fit_names)










func _fit_names() -> void:
	var n: int = _names.size()
	if n == 0 or size.x <= 0.0:
		return
	var f: Font =(_names[0] as Label).get_theme_font("font")

	var hueco: float =(size.x - 2.0 * float(n - 1)) / float(n) - 14.0
	var px: int = NAME_PX
	for l in _names:
		px = mini(px, CareerUi.fit_font_size(f,(l as Label).text, hueco,
			NAME_PX, NAME_PX_MIN))
	for l in _names:
		(l as Label).add_theme_font_size_override("font_size", px)





func set_levels(levels: Dictionary) -> void:
	for key in RelationCell.KEYS:


		if not levels.has(key):
			continue
		var v: int = clampi(int(levels.get(key, 50)), 0, 100)
		if v == int(_levels.get(key, -1)):
			continue
		_levels[key] = v
		if _cells.has(key) and is_instance_valid(_cells[key]):
			_cells[key].set_level(v)
		if _vals.has(key):
			_vals[key].text = str(v)
		if _tiers.has(key):
			_tiers[key].text = I18n.t(RelationCell.tier_name(RelationCell.tier(v)))


func _column(key: String, value: int, d: int, club: Dictionary, div: int,
		look: Dictionary = {}) -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 0)

	if not RelationCell.headless():
		var cell: RelationCell = RelationCell.new()
		cell.key = key
		cell.level = value
		cell.delta = d
		cell.club = club
		cell.div = div
		cell.look = look
		cell.size_flags_vertical = Control.SIZE_EXPAND_FILL
		cell.tapped.connect(func() -> void: relation_pressed.emit(key))
		col.add_child(cell)




		_cells[key] = cell
	else:
		var gap: Control = Control.new()
		gap.size_flags_vertical = Control.SIZE_EXPAND_FILL
		col.add_child(gap)



	var foot: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(0, 0, 0, 0.55)
	sb.content_margin_top = 8.0
	sb.content_margin_bottom = 10.0
	sb.content_margin_left = 4.0
	sb.content_margin_right = 4.0
	foot.add_theme_stylebox_override("panel", sb)
	col.add_child(foot)
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 2)
	foot.add_child(box)
	var name_l: Label = CareerUi.plain(NAME_PX, CareerTheme.TEXT)




	name_l.text = I18n.t(String(LABELS.get(key, key)), "relaciones")
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	box.add_child(name_l)
	_names.append(name_l)
	var val_l: Label = CareerUi.plain(26, CareerTheme.accent_text())
	val_l.text = str(value)
	val_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(val_l)
	_vals[key] = val_l


	var tier_l: Label = CareerUi.plain(15, CareerTheme.TEXT_DIM)
	tier_l.text = I18n.t(RelationCell.tier_name(RelationCell.tier(value)))
	tier_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	tier_l.clip_text = true
	box.add_child(tier_l)
	_tiers[key] = tier_l
	return col
