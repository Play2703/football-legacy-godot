extends "res://ui/ceremonies/programa_tele.gd"







const LEE_DESDE: float = T_TV + 0.1
const LEE_CADA: float = 0.17


var _filas_de: Array = []
var _leidas: int = -1


func _angulo_de_serie() -> String:
	return ProgramasTele.angulo_lista(_estado())


func _estado() -> String:
	return String(data.get("estado", "fuera"))


func _programa() -> String:
	return I18n.t("LA LISTA")


func _rotulo() -> String:
	return I18n.t("LA LISTA DE LA SELECCIÓN")


func _tema() -> String:
	match _angulo():
		ProgramasTele.LISTA_TITULAR:
			return I18n.t("TITULAR")
		ProgramasTele.LISTA_BANCA:
			return I18n.t("CONVOCADO")
	return I18n.t("FUERA DE LA LISTA")


func _linea_txt() -> String:
	match String(data.get("linea", "DEL")):
		"POR":
			return I18n.t("PORTEROS")
		"DEF":
			return I18n.t("DEFENSAS")
		"MED":
			return I18n.t("MEDIOS")
	return I18n.t("DELANTEROS")


func _filas() -> Array:
	return data.get("filas", [])


func _cuerpo_tele(p: Pantalla) -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 16)
	var ml: Control = Control.new()
	ml.custom_minimum_size = Vector2(26, 0)
	cab.add_child(ml)
	var linea: Label = p._texto(_linea_txt(), CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	linea.clip_text = true
	linea.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cab.add_child(linea)
	cab.add_child(_pastilla(p, _tema(),
		CareerTheme.DANGER if _angulo() == ProgramasTele.LISTA_FUERA else p.acento))
	var mr: Control = Control.new()
	mr.custom_minimum_size = Vector2(26, 0)
	cab.add_child(mr)
	col.add_child(cab)
	var rejilla: GridContainer = GridContainer.new()


	rejilla.columns = 1
	rejilla.add_theme_constant_override("v_separation", 8)
	rejilla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var marco: MarginContainer = MarginContainer.new()
	marco.add_theme_constant_override("margin_left", 26)
	marco.add_theme_constant_override("margin_right", 26)
	marco.add_child(rejilla)
	col.add_child(marco)
	var mias: Array = []
	for x in _filas():
		var f: Control = _fila_nombre(p, x)
		f.modulate.a = 0.0
		rejilla.add_child(f)
		mias.append(f)
	_filas_de.append(mias)
	_leidas = -1
	return col



func _fila_nombre(p: Pantalla, e: Dictionary) -> Control:
	var tu: bool = bool(e.get("you", false))
	var caja: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = p.acento if tu else Color(0, 0, 0, 0.42)
	sb.set_corner_radius_all(6)
	sb.content_margin_left = 12.0
	sb.content_margin_right = 12.0
	sb.content_margin_top = 5.0
	sb.content_margin_bottom = 5.0
	caja.add_theme_stylebox_override("panel", sb)
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	caja.add_child(fila)
	var chip: Control = CareerUi.pos_chip(String(e.get("pos", "")))
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(chip)
	var nombre: String = CareerTheme.caps(Career.player_name) if tu \
			else String(e.get("name", "")).to_upper()
	var l: Label = p._texto(nombre, CareerTheme.T_TITLE_MODAL,
		CareerTheme.on_color(p.acento) if tu else CareerTheme.TEXT)
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(l)
	var esc: CrestView = CrestView.new()
	esc.custom_minimum_size = Vector2(44, 44)
	esc.set_team(Teams.by_id(String(e.get("club_id", ""))))
	fila.add_child(esc)
	return caja




func _tick(delta: float) -> void:
	super._tick(delta)
	var n: int = 0
	if t >= LEE_DESDE:
		n = int((t - LEE_DESDE) / LEE_CADA) + 1
	_lee(n)


func _skipped() -> void:
	super._skipped()
	_lee(999)


func _lee(n: int) -> void:
	if n == _leidas:
		return
	_leidas = n
	for mias in _filas_de:
		for i in (mias as Array).size():
			var f: Control = mias[i]
			if is_instance_valid(f):
				f.modulate.a = 1.0 if i < n else 0.0
	_repintar()


func _titulares_propios() -> Array[String]:
	var out: Array[String] = []
	out.append(_tema())
	return out


func _titulo() -> String:
	return _tema()


func _nota_final() -> String:
	match _angulo():
		ProgramasTele.LISTA_TITULAR:
			return I18n.t("El seleccionador cuenta contigo de inicio.")
		ProgramasTele.LISTA_BANCA:
			return I18n.t("Estás en la lista. El once, a ganárselo en los entrenamientos.")
	return I18n.t("Esta vez no estás. La próxima lista se gana con tu club.")
