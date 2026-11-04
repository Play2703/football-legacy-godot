class_name ClausulasEditor
extends RefCounted






























const NIVELES: Array[String] = ["×1", "×1,5", "×2", "×3"]




const FILA_H: float = 68.0

const ICONO: float = 46.0
const TROFEO: float = 54.0

const TESELA_H: float = 124.0



const HOLD_SECS: float = 1.2






static func salidas() -> Array:
	return [
		["acepta", "check", CareerTheme.accent_text()],
		["contra", "prestamo", CareerTheme.TEXT_MID],
		["portazo", "puerta", CareerTheme.DANGER],
	]








static func chips(parent: Container, c: Dictionary, wage: int,
		col: Color = CareerTheme.TEXT) -> HFlowContainer:
	var items: Array = items_de(c, wage)
	if items.is_empty():
		return null
	var flow: HFlowContainer = HFlowContainer.new()
	flow.name = "Pactado"
	flow.add_theme_constant_override("h_separation", 22)
	flow.add_theme_constant_override("v_separation", 8)
	parent.add_child(flow)
	for it in items:
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 6)
		flow.add_child(fila)
		var ic: Control = _icono(String(it[0]), col, 30.0)
		fila.add_child(ic)
		var l: Label = CareerUi.plain(CareerTheme.T_BODY,
			CareerTheme.MONEY if bool(it[2]) else col)
		l.text = String(it[1])
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		fila.add_child(l)
	return flow




static func items_de(c: Dictionary, wage: int) -> Array:
	var out: Array = []
	if c.is_empty():
		return out
	var ps: Array = c.get("puestos", []) as Array
	if not ps.is_empty():
		var rot: Array[String] = []
		for pos in ps:
			rot.append(CareerUi.pos_rotulo(String(pos)))
		out.append(["once", "/".join(rot), false])
	if c.has("anos"):
		out.append(["jornada", str(int(c["anos"])), false])
	var ts: Dictionary = c.get("titulos", {}) as Dictionary
	for k in Clausulas.TITULOS:
		var n: int = int(ts.get(k, 0))
		if n > 0:
			out.append(["trofeo:" + String(k),
				I18n.t(NIVELES[clampi(n, 0, NIVELES.size() - 1)]), false])
	var gol: float = float(c.get("gol", 0.0))
	if gol > 0.0:
		out.append(["gol", "+$ %s" % CareerUi.money(_prima(wage, gol)), true])
	var asist: float = float(c.get("asist", 0.0))
	if asist > 0.0:
		out.append(["asist", "+$ %s" % CareerUi.money(_prima(wage, asist)), true])
	return out




static func _prima(wage: int, coef: float) -> int:
	return int(float(wage) * 0.5 * coef)





static func _icono(spec: String, col: Color, px: float) -> Control:
	var ic: Control
	if spec.begins_with("trofeo:"):
		var t: TrophyIcon = TrophyIcon.new()
		t.set_type(spec.substr(7))
		ic = t
	else:
		var m: MenuIcon = MenuIcon.new()
		m.setup(spec, col)
		ic = m
	ic.custom_minimum_size = Vector2(px, px)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return ic








static func montar(box: VBoxContainer, mesa: Dictionary, wage: int,
		on_presentar: Callable, on_salir: Callable) -> Dictionary:
	var raiz: VBoxContainer = VBoxContainer.new()
	raiz.name = "Clausulas"
	raiz.add_theme_constant_override("separation", 10)
	box.add_child(raiz)
	var b: Dictionary = mesa["base"]
	var ctx: Dictionary = mesa["ctx"]



	var st: Dictionary = {
		"p": Clausulas.sanea(b, b, ctx), "b": b, "ctx": ctx, "wage": wage, "raiz": raiz,
		"quieta": false,
	}
	_medidor(raiz, st)
	var nota: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	raiz.add_child(nota)
	st["nota"] = nota
	_puestos(raiz, st)
	st["anos"] = _stepper(raiz, "jornada", func(d: int) -> void:
		_cambia(st, "anos", int((st["p"] as Dictionary)["anos"]) + d))


	st["gol"] = _stepper(raiz, "gol", func(d: int) -> void:
		_cambia(st, "gol", float((st["p"] as Dictionary)["gol"])
			+ float(d) * Clausulas.GOL_PASO))
	st["asist"] = _stepper(raiz, "asist", func(d: int) -> void:
		_cambia(st, "asist", float((st["p"] as Dictionary)["asist"])
			+ float(d) * Clausulas.ASIST_PASO))
	_titulos(raiz, st)
	_pie(raiz, st, on_presentar, on_salir)
	_refresca(st)
	return st




static func quieta(st: Dictionary, si: bool) -> void:
	st["quieta"] = si
	_apaga(st["raiz"] as Node, si)
	if not si:
		_refresca(st)


static func _apaga(n: Node, si: bool) -> void:
	if n is Button:
		(n as Button).disabled = si
	for c in n.get_children():
		_apaga(c, si)






static func _medidor(col: VBoxContainer, st: Dictionary) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	col.add_child(fila)
	for s in salidas():
		var celda: HBoxContainer = HBoxContainer.new()
		celda.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		celda.alignment = BoxContainer.ALIGNMENT_CENTER
		celda.add_theme_constant_override("separation", 8)
		fila.add_child(celda)
		celda.add_child(_icono(String(s[1]), s[2] as Color, 40.0))
		var num: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, s[2] as Color)
		num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		celda.add_child(num)
		st["n_" + String(s[0])] = num
	var barra: HBoxContainer = HBoxContainer.new()
	barra.add_theme_constant_override("separation", 0)
	barra.custom_minimum_size = Vector2(0, 12)
	col.add_child(barra)
	for s in salidas():
		var tramo: ColorRect = ColorRect.new()
		tramo.color = s[2] as Color
		tramo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		tramo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		barra.add_child(tramo)
		st["b_" + String(s[0])] = tramo





static func _puestos(raiz: VBoxContainer, st: Dictionary) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	raiz.add_child(fila)
	fila.add_child(_icono("once", CareerTheme.TEXT_DIM, ICONO))


	var flow: HFlowContainer = HFlowContainer.new()
	flow.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	flow.add_theme_constant_override("h_separation", 10)
	flow.add_theme_constant_override("v_separation", 10)
	fila.add_child(flow)
	st["flow"] = flow




static func _pinta_puestos(st: Dictionary) -> void:
	var flow: HFlowContainer = st["flow"]
	for n in flow.get_children():
		flow.remove_child(n)
		n.queue_free()
	var p: Dictionary = st["p"]
	var marcados: Array = p["puestos"] as Array
	var ya: Array = Clausulas.pactables(st["ctx"] as Dictionary, st["b"] as Dictionary)
	for pos in ya:
		var s: String = String(pos)
		var chk: Button = CareerUi.pos_check(s, marcados.has(s))
		chk.custom_minimum_size = Vector2(124, FILA_H)
		chk.pressed.connect(func() -> void:
			var ps: Array =((st["p"] as Dictionary)["puestos"] as Array).duplicate()
			if ps.has(s):
				ps.erase(s)
			elif ps.size() < Clausulas.PUESTOS_MAX:
				ps.append(s)
			else:
				(st["nota"] as Label).text = I18n.tf("Hasta {0}.", [Clausulas.PUESTOS_MAX])
			_cambia(st, "puestos", ps))
		flow.add_child(chk)
	var vetos: Dictionary = Clausulas.vetos(st["ctx"] as Dictionary)
	for pos in vetos:



		if ya.has(String(pos)):
			continue
		var s: String = String(pos)
		var why: String = String(vetos[pos])
		var chk: Button = CareerUi.pos_check(s, false)
		chk.custom_minimum_size = Vector2(124, FILA_H)



		for slot in ["normal", "hover", "focus", "pressed", "hover_pressed"]:
			var sb: StyleBoxFlat = chk.get_theme_stylebox(slot) as StyleBoxFlat
			if sb != null:
				sb.border_color = CareerTheme.TEXT_DIM
		for slot in ["font_color", "font_hover_color", "font_pressed_color",
				"font_focus_color"]:
			chk.add_theme_color_override(slot, CareerTheme.TEXT_DIM)
		chk.modulate = CareerTheme.MUTED
		chk.pressed.connect(func() -> void:
			(st["nota"] as Label).text = "%s · %s" % [CareerUi.pos_rotulo(s), I18n.t(why)])
		flow.add_child(chk)





static func _stepper(parent: VBoxContainer, icono: String, on_paso: Callable) -> Array:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	parent.add_child(fila)
	fila.add_child(_icono(icono, CareerTheme.TEXT_DIM, ICONO))
	var menos: Button = _paso_btn("-", on_paso.bind(-1))
	fila.add_child(menos)
	var val: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	val.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	val.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	val.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	val.clip_text = true
	fila.add_child(val)
	var mas: Button = _paso_btn("+", on_paso.bind(1))
	fila.add_child(mas)
	return [val, menos, mas]


static func _paso_btn(txt: String, on_pressed: Callable) -> Button:
	var btn: Button = Button.new()
	btn.text = txt
	btn.custom_minimum_size = Vector2(110, FILA_H)
	btn.focus_mode = Control.FOCUS_NONE
	CareerTheme.apply_button(btn, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_SECONDARY_FONT)
	btn.pressed.connect(on_pressed)
	return btn







static func _titulos(raiz: VBoxContainer, st: Dictionary) -> void:
	var grid: GridContainer = GridContainer.new()
	grid.columns = 3
	grid.add_theme_constant_override("h_separation", 10)
	grid.add_theme_constant_override("v_separation", 10)
	raiz.add_child(grid)
	var base_t: Dictionary =(st["b"] as Dictionary)["titulos"] as Dictionary
	var teselas: Dictionary = {}
	for k in Clausulas.TITULOS:
		var kind: String = k
		var suelo: int = int(base_t.get(kind, 0))
		var t: Button = Button.new()
		t.name = "Titulo_" + kind
		t.focus_mode = Control.FOCUS_NONE
		t.custom_minimum_size = Vector2(0, TESELA_H)
		t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		grid.add_child(t)


		var v: VBoxContainer = VBoxContainer.new()
		v.set_anchors_preset(Control.PRESET_FULL_RECT)
		v.alignment = BoxContainer.ALIGNMENT_CENTER
		v.add_theme_constant_override("separation", 2)
		v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		t.add_child(v)
		var ic: Control = _icono("trofeo:" + kind, CareerTheme.TEXT, TROFEO)
		ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		v.add_child(ic)
		var nivel: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
		nivel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		nivel.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v.add_child(nivel)
		var dinero: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
		dinero.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		dinero.clip_text = true
		dinero.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v.add_child(dinero)
		t.pressed.connect(func() -> void:
			var ts: Dictionary =((st["p"] as Dictionary)["titulos"] as Dictionary) \
					.duplicate()
			var n: int = int(ts.get(kind, 0))
			ts[kind] = n + 1 if n < NIVELES.size() - 1 else suelo
			_cambia(st, "titulos", ts))
		teselas[kind] = [t, nivel, dinero, suelo]
	st["titulos"] = teselas





static func _pie(raiz: VBoxContainer, st: Dictionary, on_presentar: Callable,
		on_salir: Callable) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	raiz.add_child(fila)
	var atras: Button = Button.new()
	atras.text = I18n.t("< ATRAS")
	atras.custom_minimum_size = Vector2(200, CareerTheme.BTN_ROW_H)
	atras.focus_mode = Control.FOCUS_NONE
	CareerTheme.apply_button(atras, CareerTheme.Kind.GHOST, CareerTheme.BTN_ROW_FONT)


	UiKit.set_cue(atras, "ui_back")

	atras.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	atras.pressed.connect(on_salir)
	fila.add_child(atras)
	var presentar: Button = CareerUi.hold_button(fila, I18n.t("MANTÉN PARA PRESENTAR"),
		HOLD_SECS, func() -> void:
			var p: Dictionary = st["p"]
			if bool(st["quieta"]) or Clausulas.es_base(p, st["b"] as Dictionary):
				return
			on_presentar.call(p.duplicate(true)), CareerTheme.BTN_ROW_FONT)
	presentar.custom_minimum_size.y = CareerTheme.BTN_ROW_H
	presentar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	presentar.clip_text = true
	st["presentar"] = presentar







static func _cambia(st: Dictionary, clave: String, valor: Variant) -> void:
	if bool(st["quieta"]):
		return
	var p: Dictionary =(st["p"] as Dictionary).duplicate(true)
	p[clave] = valor
	st["p"] = Clausulas.sanea(p, st["b"] as Dictionary, st["ctx"] as Dictionary)
	UiAudio.toggle()
	_refresca(st)


static func _refresca(st: Dictionary) -> void:
	var p: Dictionary = st["p"]
	var b: Dictionary = st["b"]
	var ctx: Dictionary = st["ctx"]
	var wage: int = int(st["wage"])


	var pr: Dictionary = Clausulas.probabilidades(p, b, ctx)
	var a: int = roundi(float(pr["acepta"]) * 100.0)
	var z: int = roundi(float(pr["portazo"]) * 100.0)
	var c: int = maxi(0, 100 - a - z)
	(st["n_acepta"] as Label).text = "%d %%" % a
	(st["n_contra"] as Label).text = "%d %%" % c
	(st["n_portazo"] as Label).text = "%d %%" % z
	for par in [["acepta", a], ["contra", c], ["portazo", z]]:
		var tramo: ColorRect = st["b_" + String(par[0])]
		tramo.visible = int(par[1]) > 0
		tramo.size_flags_stretch_ratio = maxf(float(par[1]), 0.01)
	_pinta_puestos(st)

	var an: Array = st["anos"]
	(an[0] as Label).text = str(int(p["anos"]))
	(an[1] as Button).disabled = int(p["anos"]) <= int(ctx.get("anos_min", 1))
	(an[2] as Button).disabled = int(p["anos"]) >= int(ctx.get("anos_max", b["anos"]))
	_pinta_prima(st["gol"] as Array, float(p["gol"]), float(b["gol"]),
		maxf(Clausulas.GOL_MAX, float(b["gol"])), wage)
	_pinta_prima(st["asist"] as Array, float(p["asist"]), float(b["asist"]),
		maxf(Clausulas.ASIST_MAX, float(b["asist"])), wage)
	var teselas: Dictionary = st["titulos"]
	for k in teselas:
		var n: int = int((p["titulos"] as Dictionary).get(k, 0))
		var tes: Array = teselas[k]
		var arriba: bool = n > int(tes[3])


		if arriba:
			CareerTheme.apply_button_tinted(tes[0] as Button, CareerTheme.accent(), 0, 0.3)
		else:
			CareerTheme.apply_button(tes[0] as Button, CareerTheme.Kind.NEUTRAL)
		(tes[1] as Label).text = I18n.t(NIVELES[n])
		(tes[1] as Label).add_theme_color_override("font_color",
			CareerTheme.accent_text() if arriba else CareerTheme.TEXT_DIM)
		(tes[2] as Label).text = "$ %s" % CareerUi.money(ContractTerms.title_bonus(wage,
			String(k), Clausulas.TITULO_MULT[n]))
	(st["presentar"] as Button).disabled = Clausulas.es_base(p, b)


static func _pinta_prima(par: Array, v: float, base: float, techo: float,
		wage: int) -> void:
	(par[0] as Label).text = "-" if v <= 0.0 \
			else "+$ %s" % CareerUi.money(_prima(wage, v))
	(par[1] as Button).disabled = v <= base + 0.001
	(par[2] as Button).disabled = v >= techo - 0.001
