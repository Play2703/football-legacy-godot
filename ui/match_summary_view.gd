class_name MatchSummaryView
extends VBoxContainer



























const REL_ROWS: Array = [
	["tecnico", "Técnico"], ["equipo", "Vestuario"], ["aficion", "Afición"],
	["prensa", "Prensa"], ["agente", "Agente"],
]





const PAY_ROWS: Array = [
	["ficha", "SUELDO"],
	["resultado", "PRIMA DE RESULTADO"],
	["goles", "PRIMA POR GOL"],



	["ex_club", "GOL AL EX CLUB"],
	["asistencias", "PRIMA POR ASISTENCIA"],
	["patrocinio", "PATROCINIO"],


	["regalo_pareja", "REGALO DE ELLA"],



	["impago", "IMPAGO DEL CLUB"],


	["multa_roja", "MULTA POR LA ROJA"],
	["multa_festejo", "MULTA DEL COMITÉ"],
	["agente", "COMISIÓN DEL AGENTE"],
	["mantenimiento", "ESTILO DE VIDA"],
	["pareja_casa", "VIVIR CON ELLA"],



	["tren_vida", "DINERO PARADO"],




	["camaras", "CÁMARA ROTA"],




	["balones", "BALÓN A LA GRADA"],






	["calle", "BALÓN A LA CALLE"],




	["ninos", "RECOGEPELOTAS DERRIBADO"],




	["cristal", "CRISTAL DEL PALCO"],
]













static func map_color(tab: int) -> Color:
	match tab:
		1:
			return CareerTheme.STAT_ASSIST
		2:
			return CareerTheme.STAT_MOVE
		_:
			return CareerTheme.TEXT





const LEG_DOT: float = 16.0



const ENERGY_BAR_H: float = 44.0




const REL_BAR_H: float = 20.0



var _sum_anim: Array = []
var _tw: Tween




func populate(data: Dictionary) -> void:
	for c in get_children():
		c.queue_free()
	add_theme_constant_override("separation", 20)
	_sum_anim.clear()



	_map_tab = 0
	if UiKit.es_horizontal():
		_secciones_horizontal(data)
		_reveal()
		return
	var played: bool = bool(data.get("played", true))




	if data.has("score"):
		add_child(_hero_card(data))



	else:


		add_child(_rating_card(float(data.get("rating", 6.0)), played,
			float(data.get("rating_peso", 1.0))))



	if int(data.get("new_injury", 0)) > 0:
		add_child(_injury_card(int(data.get("new_injury", 0)),
			int(data.get("injury_min", 0))))





	if int(data.get("sub_saved_min", 0)) > 0:
		add_child(_sub_exit_card(int(data.get("sub_saved_min", 0)),
			float(data.get("sub_saved_energy", 0.0)),
			bool(data.get("sub_welcome", false))))
	add_child(_stat_tiles(data))




	if played:
		var por_que: Control = _rating_breakdown_card(data)
		if por_que != null:
			add_child(por_que)




	if played and float(data.get("energy_start", -1.0)) >= 0.0:
		add_child(_energy_card(data))








	if played:
		add_child(_maps_card(data))






	var pay: Dictionary = data.get("pay", {})
	var hay_xp: bool = int(data.get("xp", 0)) > 0
	if hay_xp and not pay.is_empty():
		var fila_prog: HBoxContainer = HBoxContainer.new()
		fila_prog.add_theme_constant_override("separation", 12)




		_sum_anim.append({"kind": "card", "node": fila_prog})
		var xp_c: Control = _xp_card(data)
		xp_c.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila_prog.add_child(xp_c)
		var pay_c: Control = _pay_card(pay)
		pay_c.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila_prog.add_child(pay_c)
		add_child(fila_prog)
	elif hay_xp:
		add_child(_xp_card(data))
	elif not pay.is_empty():
		add_child(_pay_card(pay))


	if not Career.last_sponsors.is_empty():
		add_child(_sponsor_card())




	var socios_c: Control = _socios_card()
	if socios_c != null:
		add_child(socios_c)
	add_child(_relations(data.get("rel", {}), data.get("rel_delta", {})))
	_reveal()




func _secciones_horizontal(data: Dictionary) -> void:
	var secciones: Array = []
	var played: bool = bool(data.get("played", true))
	var general: VBoxContainer = VBoxContainer.new()
	general.add_theme_constant_override("separation", 20)
	_sum_anim.append({"kind": "card", "node": general})
	general.add_child(_hero_card(data) if data.has("score") else _rating_card(float(data.get("rating", 6.0)), played, float(data.get("rating_peso", 1.0))))
	general.add_child(_stat_tiles(data))
	secciones.append(["RESUMEN", general])
	if int(data.get("new_injury", 0)) > 0:
		secciones.append(["LESIÓN", _injury_card(int(data["new_injury"]), int(data.get("injury_min", 0)))])
	if int(data.get("sub_saved_min", 0)) > 0:
		secciones.append(["PEDIR EL CAMBIO", _sub_exit_card(int(data["sub_saved_min"]), float(data.get("sub_saved_energy", 0.0)), bool(data.get("sub_welcome", false)))])
	if played:
		var nota: Control = _rating_breakdown_card(data)
		if nota != null:
			secciones.append(["NOTA", nota])
		if float(data.get("energy_start", -1.0)) >= 0.0:
			secciones.append(["ENERGÍA", _energy_card(data)])
		secciones.append(["MAPA DE TIROS", _maps_card(data)])
	if int(data.get("xp", 0)) > 0:
		secciones.append(["PROGRESIÓN", _xp_card(data)])
	if not (data.get("pay", {}) as Dictionary).is_empty():
		secciones.append(["NÓMINA", _pay_card(data["pay"])])
	if not Career.last_sponsors.is_empty():
		secciones.append(["PATROCINADORES", _sponsor_card()])
	var socios: Control = _socios_card()
	if socios != null:
		secciones.append(["LA SOCIEDAD", socios])
	secciones.append(["RELACIONES", _relations(data.get("rel", {}), data.get("rel_delta", {}))])
	var fila: HBoxContainer = HBoxContainer.new()


	fila.custom_minimum_size.x = maxf(0.0, SceneFade.rect_visible(self).size.x - UiKit.side_safe_inset(get_viewport()) * 2.0 - 120.0)
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_theme_constant_override("separation", 24)
	add_child(fila)
	_sum_anim.push_front({"kind": "card", "node": fila})
	var categorias: VBoxContainer = VBoxContainer.new()
	categorias.custom_minimum_size.x = 340.0
	categorias.add_theme_constant_override("separation", 8)
	fila.add_child(categorias)
	var detalle: VBoxContainer = VBoxContainer.new()
	detalle.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	detalle.add_theme_constant_override("separation", 18)
	fila.add_child(detalle)
	var titulo: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.accent_text())
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	detalle.add_child(titulo)
	var botones: Array[Button] = []
	for seccion in secciones:
		var contenido: Control = seccion[1]
		contenido.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		contenido.visible = false
		detalle.add_child(contenido)
		var b: Button = Button.new()
		b.text = I18n.t(String(seccion[0]))
		b.clip_text = true
		b.custom_minimum_size = Vector2(340, 60)
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
		b.pressed.connect(func() -> void:
			for s in secciones:
				(s[1] as Control).visible = s[1] == contenido
			titulo.text = b.text
			for boton in botones:
				CareerTheme.apply_button(boton, CareerTheme.Kind.PRIMARY if boton == b else CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM))
		categorias.add_child(b)
		botones.append(b)
	botones[0].pressed.emit()




func advance() -> void:
	if _tw != null and _tw.is_valid():
		_tw.custom_step(30.0)





static func rating_color(r: float) -> Color:
	if r >= 7.0:
		return CareerTheme.GOOD
	if r < 5.5:
		return UiKit.DANGER
	return CareerTheme.TEXT





func _reveal() -> void:
	if _tw != null and _tw.is_valid():
		_tw.kill()


	for c in get_children():
		if c is CanvasItem:
			(c as CanvasItem).modulate.a = 0.0
	for e in _sum_anim:
		match String(e["kind"]):
			"group":
				for n in e["nodes"]:
					n.modulate.a = 0.0
			"ticks":
				for it in e["items"]:
					(it["label"] as Label).text = "0"
			"bar":
				CareerUi.set_bar(e["fill"], 0.0)
				if e["delta"] != null:
					e["delta"].modulate.a = 0.0
				for n in e.get("also", []):
					(n as CanvasItem).modulate.a = 0.0
			"drain":



				CareerUi.set_bar(e["fill"], float(e["from"]))
				(e["fill"] as ColorRect).color = \
						CareerTheme.energy_color(float(e["from"]) * 100.0)
				e["ghost"].modulate.a = 0.0
				e["delta"].modulate.a = 0.0
			"recover":


				for n in e["rows"]:
					(n as CanvasItem).modulate.a = 0.0
	_tw = create_tween()
	var bar_i: int = 0
	for e in _sum_anim:
		match String(e["kind"]):
			"card":
				_tw.tween_property(e["node"], "modulate:a", 1.0, 0.18) \
						.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				bar_i = 0
			"pop":


				var pn: Control = e["node"]
				_tw.tween_callback(func() -> void:
					if is_instance_valid(pn):
						pn.modulate.a = 1.0
						UiKit.pop_in(pn))
			"group":


				var gi: int = 0
				for n in e["nodes"]:
					var step: Tween = _tw if gi == 0 else _tw.parallel()
					step.tween_property(n, "modulate:a", 1.0, 0.18) \
							.set_delay(0.04 * gi) \
							.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
					gi += 1
			"dial":



				var to: float = float(e["to"])
				var dial: StatDial = e["dial"]
				var col: Color = rating_color(to)



				var fs: int = int(e.get("font", 40))
				_tw.tween_method(func(v: float) -> void:
					dial.setup(MatchRating.dial_text(v), v / 10.0, col, col, fs), 0.0, to, 0.5) \
							.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)




				_tw.tween_callback(func() -> void:
					if is_instance_valid(dial):
						RatingFlair.celebrate(dial, to, fs))
			"ticks":










				var ti: int = 0
				for it in e["items"]:
					var tl: Label = it["label"]
					var tv: float = float(it["to"])
					_tw.parallel().tween_method(func(v: float) -> void:
						tl.text = str(int(round(v))), 0.0, tv, 0.45) \
								.set_delay(0.04 * float(ti)) \
								.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
					ti += 1
			"count":
				var lab: Label = e["label"]
				var xp: float = float(e["to"])
				_tw.tween_method(func(v: float) -> void:
					lab.text = "+%d XP" % int(v), 0.0, xp, 0.4) \
							.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
			"money":
				var mlab: Label = e["label"]
				var total: int = int(e["to"])
				_tw.tween_method(func(v: float) -> void:
					mlab.text = "%s$ %s" % ["+" if total >= 0 else "-",
						CareerUi.money(int(v))], 0.0, float(absi(total)), 0.45) \
								.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)




				if total > 0:
					_tw.tween_callback(func() -> void:
						CareerUi.coin_burst(mlab, mlab.size * 0.5))
			"bar":


				var fill: ColorRect = e["fill"]
				var frac: float = float(e["to"])
				var d0: float = 0.06 * float(bar_i)
				var step: Tween = _tw if bar_i == 0 else _tw.parallel()
				step.tween_method(func(v: float) -> void:
					CareerUi.set_bar(fill, v), 0.0, frac, 0.35) \
							.set_delay(d0).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
				if e["delta"] != null:
					_tw.parallel().tween_property(e["delta"], "modulate:a", 1.0, 0.15) \
							.set_delay(d0 + 0.3)
				for n in e.get("also", []):
					_tw.parallel().tween_property(n, "modulate:a", 1.0, 0.15) \
							.set_delay(d0 + 0.3)
				bar_i += 1
			"drain":





				var dfill: ColorRect = e["fill"]
				var da: float = float(e["from"])
				var db: float = float(e["to"])
				_tw.tween_method(func(v: float) -> void:
					CareerUi.set_bar(dfill, v)
					dfill.color = CareerTheme.energy_color(v * 100.0), da, db, 0.9) \
							.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)


				_tw.parallel().tween_property(e["ghost"], "modulate:a", 1.0, 0.45) \
						.set_delay(0.35)
				_tw.parallel().tween_property(e["delta"], "modulate:a", 1.0, 0.3) \
						.set_delay(0.6)
			"recover":






				var rfill: ColorRect = e["fill"]
				var ra: float = float(e["from"])
				var rb: float = float(e["to"])
				_tw.tween_method(func(v: float) -> void:
					CareerUi.set_bar(rfill, v)
					rfill.color = CareerTheme.energy_color(v * 100.0), ra, rb, 0.6) \
							.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)



				_tw.parallel().tween_property(e["ghost"], "anchor_left",
					minf(rb, float(e["ghost"].anchor_right)), 0.6) \
							.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)



				var ri: int = 0
				for n in e["rows"]:
					_tw.parallel().tween_property(n, "modulate:a", 1.0, 0.18) \
							.set_delay(0.25 + 0.05 * float(ri))
					ri += 1





func _hero_card(data: Dictionary) -> Control:
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 8)






	_sum_anim.append({"kind": "card", "node": caja})
	var res: int = int(data.get("result", 0))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 24)
	caja.add_child(fila)
	var score: Array = data.get("score", [0, 0])
	for lado in [0, 1]:
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(96, 96)
		crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		var tid: String = String(data.get("you_id" if lado == 0 else "rival_id", ""))




		crest.set_team(Nations.as_team(tid) if bool(data.get("is_nat", false)) \
				else Teams.by_id(tid))
		if lado == 0:
			fila.add_child(crest)
		else:

			var num: Label = _centered(64, CareerTheme.TEXT, "%d - %d" \
					% [int(score[0]), int(score[1])])
			num.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			fila.add_child(num)
			fila.add_child(crest)






	var fila_ver: HBoxContainer = HBoxContainer.new()
	fila_ver.alignment = BoxContainer.ALIGNMENT_CENTER


	fila_ver.add_theme_constant_override("separation", 34)
	caja.add_child(fila_ver)
	var veredicto: Label = _centered(CareerTheme.T_TITLE_MODAL,
		CareerTheme.GOOD if res > 0 else (UiKit.DANGER if res < 0 else CareerTheme.TEXT),
		String(data.get("result_text", "")).to_upper())
	veredicto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila_ver.add_child(veredicto)
	if bool(data.get("played", true)):
		var r: float = float(data.get("rating", 6.0))

















		var col_nota: VBoxContainer = VBoxContainer.new()
		col_nota.add_theme_constant_override("separation", 2)
		col_nota.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		var dial: StatDial = StatDial.new()
		dial.custom_minimum_size = Vector2(168.0, 168.0)
		dial.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		dial.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col_nota.add_child(dial)


		col_nota.add_child(_centered(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM,
			I18n.t("NOTA")))
		fila_ver.add_child(col_nota)
		dial.setup("0.0", 0.0, rating_color(r), rating_color(r),
			CareerTheme.T_TITLE_MODAL)
		_peso_sello(dial, float(data.get("rating_peso", 1.0)))


		_sum_anim.append({"kind": "dial", "dial": dial, "to": r,
			"font": CareerTheme.T_TITLE_MODAL})
	var nota: String = String(data.get("nota", ""))
	if not nota.is_empty():
		caja.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM, nota))


	if bool(data.get("mvp", false)):
		var pill: HBoxContainer = HBoxContainer.new()
		pill.alignment = BoxContainer.ALIGNMENT_CENTER
		pill.add_theme_constant_override("separation", 8)
		var ti: TrophyIcon = TrophyIcon.new()
		ti.custom_minimum_size = Vector2(40, 40)
		ti.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		pill.add_child(ti)
		ti.set_type(TrophyIcon.partido_de(String(data.get("comp", "league"))))
		var t: Label = _centered(CareerTheme.T_BODY, CareerTheme.accent_text(),
			CareerTheme.caps(I18n.t("Jugador del Partido")))
		t.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		pill.add_child(t)
		caja.add_child(pill)
		_sum_anim.append({"kind": "pop", "node": pill})
	return caja









const MAP_H: int = 590







const MAP_HEAT_W: int = 911



var _map_tab: int = 0



var _map_row: HBoxContainer = null
var _map_body: VBoxContainer = null


var _map_data: Dictionary = {}





















func _maps_card(data: Dictionary) -> Control:
	_map_data = data
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 6)
	card.add_child(box)


	_map_row = CareerUi.segmented([I18n.t("TIROS"), I18n.t("PASES"),
		I18n.t("REGATES")], _map_tab, _on_map_tab)
	box.add_child(_map_row)




	_mark_map_tabs()
	_map_body = VBoxContainer.new()
	_map_body.add_theme_constant_override("separation", 6)
	box.add_child(_map_body)
	_fill_map_body()
	_sum_anim.append({"kind": "card", "node": card})
	return card





func _on_map_tab(i: int) -> void:
	var pedida: int = clampi(i, 0, 2)
	if pedida == _map_tab:
		return
	_map_tab = pedida
	_mark_map_tabs()
	_fill_map_body()





func _mark_map_tabs() -> void:
	for i in _map_row.get_child_count():
		var b: Button = _map_row.get_child(i) as Button
		if b == null:
			continue
		if i == _map_tab:
			CareerTheme.apply_button_accent(b, map_color(i), CareerTheme.BTN_ROW_FONT)
		else:
			CareerTheme.style_button(b, CareerTheme.Kind.NEUTRAL,
				CareerTheme.BTN_ROW_FONT)


func _fill_map_body() -> void:



	for c in _map_body.get_children():
		_map_body.remove_child(c)
		c.queue_free()
	match _map_tab:
		1:
			_map_pases()
		2:
			_map_regates()
		_:
			_map_tiros()





func _map_vacio(texto: String) -> void:
	var l: Label = _centered(CareerTheme.T_BODY, CareerTheme.TEXT_DIM, texto)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size = Vector2(0, 120)
	_map_body.add_child(l)








func _map_lamina(view: Control) -> void:
	var holder: Control = Control.new()
	holder.custom_minimum_size = Vector2(MAP_HEAT_W, MAP_H)
	holder.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	holder.mouse_filter = Control.MOUSE_FILTER_IGNORE
	holder.clip_contents = true
	_map_body.add_child(holder)
	view.set_anchors_preset(Control.PRESET_FULL_RECT)
	holder.add_child(view)


func _map_tiros() -> void:
	var tiros: Array = _map_data.get("shots", [])
	if tiros.is_empty():
		_map_vacio(I18n.t("En este partido no remataste."))
		return


	var a_puerta: int = 0
	var goles: int = 0
	for s in tiros:
		var o: String = String((s as Dictionary).get("o", ""))
		if o in ShotBook.A_PUERTA:
			a_puerta += 1
		if o == "goal":
			goles += 1




	var n: int = tiros.size()
	_map_cifras(PackedStringArray([
		"%d %s" % [n, I18n.plural(n, "TIRO", "TIROS")],
		"%d %s" % [a_puerta, I18n.plural(a_puerta, "A PUERTA", "A PUERTA")],
		"%d %s" % [goles, I18n.plural(goles, "GOL", "GOLES")]]))


	_map_body.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM,
		I18n.t("LA CANCHA — desde dónde tiraste")))
	var mapa: ShotMapView = ShotMapView.new()
	mapa.mode = "campo"
	mapa.cancha = true
	_map_lamina(mapa)
	mapa.set_shots(tiros)



	_map_legend([
		[CareerTheme.MONEY, "GOL"], [CareerTheme.TEXT, "A PUERTA"],
		[CareerTheme.DANGER, "DESVIADO"], [CareerTheme.TEXT_MID, "TAPADO"],
	])


func _map_pases() -> void:
	var pases: Array = _map_data.get("passes_log", [])
	if pases.is_empty():
		_map_vacio(I18n.t("En este partido no le dejaste el balón a nadie."))
		return




	var n_pases: int = int(_map_data.get("passes", 0))
	var n_asist: int = int(_map_data.get("assists", 0))
	_map_cifras(PackedStringArray([
		"%d %s" % [n_pases, I18n.plural(n_pases, "PASE", "PASES")],
		I18n.tf("{0} CLAVE", [int(_map_data.get("key_passes", 0))]),
		"%d %s" % [n_asist, I18n.plural(n_asist, "ASISTENCIA", "ASISTENCIAS")]]))
	_map_body.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM,
		I18n.t("LA CANCHA — tu último pase de cada jugada")))
	var mapa: ShotMapView = ShotMapView.new()



	mapa.mode = "pases"
	mapa.cancha = true
	_map_lamina(mapa)
	mapa.set_passes(pases)
	_map_legend([
		[CareerTheme.MONEY, "ASISTENCIA"], [CareerTheme.STAT_ASSIST, "A REMATE"],
		[Color(CareerTheme.STAT_ASSIST, 0.72), "SIN REMATE"],
		[CareerTheme.DANGER, "ANULADO"],
	])


func _map_regates() -> void:
	var moves: Array = _map_data.get("moves", [])
	var heat: PackedInt32Array = _map_data.get("heat", PackedInt32Array())





	var regates: Array = _map_data.get("dribbles", [])




	if moves.is_empty() and regates.is_empty() and not MoveBook.has_heat(heat):
		_map_vacio(I18n.t("En este partido no quedó rastro de tus movimientos."))
		return




	var cuenta: Dictionary = MoveBook.tally(moves)
	var ganados: int = regates.size()
	var perdidas: int = int(cuenta["perdida"])
	var faltas: int = int(cuenta["falta"])
	_map_cifras(PackedStringArray([
		"%d %s" % [ganados, I18n.plural(ganados, "REGATE", "REGATES")],
		"%d %s" % [perdidas, I18n.plural(perdidas, "PÉRDIDA", "PÉRDIDAS")],
		"%d %s" % [faltas, I18n.plural(faltas, "FALTA RECIBIDA", "FALTAS RECIBIDAS")]]))
	_map_body.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM,
		I18n.t("LA CANCHA — atacas hacia la derecha")))
	var view: HeatMapView = HeatMapView.new()
	_map_lamina(view)
	view.set_data(heat, moves + regates)


	_map_legend([
		[CareerTheme.TEXT, "REGATE GANADO"],
		[CareerTheme.NAV_YO, "POR DÓNDE ANDUVISTE"], [CareerTheme.STAT_MOVE, "TE HICIERON FALTA"],
		[CareerTheme.MONEY, "PENAL"], [CareerTheme.DANGER, "TE LA QUITARON"],
	])










func _map_cifras(partes: PackedStringArray) -> void:
	var l: Label = _centered(CareerTheme.T_DIM, CareerTheme.TEXT, " · ".join(partes))
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_map_body.add_child(l)












func _map_legend(items: Array) -> void:
	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 18)
	flow.add_theme_constant_override("v_separation", 6)
	flow.alignment = FlowContainer.ALIGNMENT_CENTER
	_map_body.add_child(flow)
	for it in items:
		var cel: HBoxContainer = HBoxContainer.new()
		cel.add_theme_constant_override("separation", 7)
		flow.add_child(cel)
		var dot: ColorRect = ColorRect.new()
		dot.color = it[0] as Color
		dot.custom_minimum_size = Vector2(LEG_DOT, LEG_DOT)
		dot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cel.add_child(dot)
		var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		l.text = I18n.t(String(it[1]))
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		cel.add_child(l)






func _rating_card(rating: float, played: bool, peso: float = 1.0) -> Control:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	card.add_child(col)
	col.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM, I18n.t("CALIFICACIÓN")))
	var dial: StatDial = StatDial.new()



	dial.custom_minimum_size = Vector2(168.0, 168.0)
	dial.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	dial.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(dial)
	_sum_anim.append({"kind": "card", "node": card})
	if played:
		dial.setup("0.0", 0.0, rating_color(rating), rating_color(rating), 40)
		_sum_anim.append({"kind": "dial", "dial": dial, "to": rating})
		_peso_sello(dial, peso)
	else:

		dial.setup("—", 0.0, CareerTheme.TEXT_DIM, CareerTheme.TEXT_DIM, 40)
	return card











func _peso_sello(dial: StatDial, peso: float) -> void:
	var txt: String = MatchRating.peso_text(peso)
	if txt.is_empty():
		return
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MONEY)
	l.text = txt
	l.name = "PesoNota"
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM

	l.clip_text = true
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE

	l.add_theme_color_override("font_outline_color", CareerTheme.SURFACE)
	l.add_theme_constant_override("outline_size", 6)
	l.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	l.offset_top = - float(CareerTheme.T_CAPTION) - 4.0
	l.offset_bottom = 0.0
	dial.add_child(l)









func _injury_card(weeks: int, minute: int = 0) -> Control:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	card.add_child(col)
	col.add_child(_centered(CareerTheme.T_DIM, UiKit.DANGER,
		I18n.tf("LESIONADO EN EL {0}'", [minute]) if minute > 0
		else I18n.t("LESIÓN", "sim")))
	var l: Label = _centered(30, UiKit.DANGER,
		I18n.tf("{0} {1} DE BAJA", [weeks, I18n.plural(weeks, "SEMANA", "SEMANAS")]))
	col.add_child(l)
	_sum_anim.append({"kind": "card", "node": card})
	return card









func _sub_exit_card(minutes: int, energy: float, welcome: bool) -> Control:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	card.add_child(col)
	var tinta: Color = UiKit.GOLD if welcome else UiKit.INK_DIM
	col.add_child(_centered(CareerTheme.T_DIM, tinta,
		I18n.t("SALIDA GESTIONADA" if welcome else "PEDISTE EL CAMBIO")))



	var l: Label = _centered(CareerTheme.T_CARD, CareerTheme.TEXT,
		I18n.tf("{0} MIN Y {1} % DE ENERGÍA QUE NO GASTASTE",
			[minutes, maxi(int(round(energy)), 1)]))


	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	col.add_child(l)
	_sum_anim.append({"kind": "card", "node": card})
	return card



























func _energy_card(data: Dictionary) -> Control:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)
	card.add_child(col)


	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 10)
	col.add_child(top)
	var tag: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	tag.text = I18n.t("ENERGÍA")
	top.add_child(tag)
	var st: Dictionary = Career.energy_state()
	var st_l: Label = CareerUi.plain(CareerTheme.T_CAPTION, st["color"])
	st_l.text = CareerTheme.caps(I18n.t(String(st["label"]), "energia"))
	st_l.clip_text = true
	st_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	st_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	top.add_child(st_l)

	var ini: float = clampf(float(data.get("energy_start", 0.0)), 0.0, 100.0)
	var fin: float = clampf(float(data.get("energy", 0.0)), 0.0, 100.0)













	var rec: Dictionary = data.get("recovery", {})
	var bajo: float = clampf(float(rec.get("antes", fin)), 0.0, 100.0)
	var repuesto: float = maxf(0.0, float(rec.get("aplicado", 0.0)))
	var f0: float = ini / 100.0
	var f1: float = minf(bajo, ini) / 100.0
	var f2: float = maxf(fin, minf(bajo, ini)) / 100.0
	var fill: ColorRect = CareerUi.bar(col, CareerTheme.energy_color(ini), ENERGY_BAR_H)
	var track: Control = fill.get_parent()




	var ghost: ColorRect = ColorRect.new()
	ghost.color = Color(CareerTheme.DANGER, 0.3)
	ghost.anchor_left = f1
	ghost.anchor_right = f0
	ghost.anchor_top = 0.0
	ghost.anchor_bottom = 1.0
	ghost.mouse_filter = Control.MOUSE_FILTER_IGNORE
	track.add_child(ghost)
	CareerUi.energy_zones(track)





	var cap: float = clampf(float(data.get("energy_cap", 100.0)), 0.0, 100.0)
	if cap < 99.9:
		CareerUi.bar_cap_veil(track, cap / 100.0)

	var bot: HBoxContainer = HBoxContainer.new()
	bot.add_theme_constant_override("separation", 10)
	col.add_child(bot)





	var l_ini: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	l_ini.text = I18n.tf("SALISTE CON {0}", [int(round(ini))])
	l_ini.clip_text = true
	l_ini.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bot.add_child(l_ini)


	var gasto: int = int(round(minf(bajo, ini) - ini))
	var l_gasto: Label = CareerUi.plain(CareerTheme.T_MONEY,
		UiKit.DANGER if gasto < 0 else CareerTheme.TEXT_DIM)
	l_gasto.text = "%+d" % gasto
	l_gasto.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l_gasto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bot.add_child(l_gasto)
	var l_fin: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	l_fin.text = I18n.tf("ACABAS EN {0}", [int(round(fin))])
	l_fin.clip_text = true
	l_fin.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l_fin.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	bot.add_child(l_fin)
	_sum_anim.append({"kind": "card", "node": card})
	_sum_anim.append({"kind": "drain", "fill": fill, "from": f0, "to": f1,
		"ghost": ghost, "delta": l_gasto})


	if repuesto >= 0.5:
		var rows: Array = _recovery_rows(col, rec, repuesto, fin)
		_sum_anim.append({"kind": "recover", "fill": fill, "from": f1, "to": f2,
			"ghost": ghost, "rows": rows})
	return card





const REC_MAX_ITEMS: int = 4












func _recovery_rows(col: VBoxContainer, rec: Dictionary, repuesto: float,
		fin: float) -> Array:
	var rows: Array = []
	var total_int: int = int(round(repuesto))
	rows.append(CareerUi.kv(col, I18n.t("RECUPERASTE"),
		"+%d" % total_int, CareerTheme.energy_color(fin)))




	var dias: int = int(round(float(rec.get("dias", -1.0))))
	if dias > 0:
		rows.append(CareerUi.kv(col, I18n.t("DÍAS DE DESCANSO"), str(dias), CareerTheme.TEXT_DIM))


	var total: float = maxf(0.001, float(rec.get("total", repuesto)))

	var escala: float = clampf(repuesto / total, 0.0, 1.0)
	var items: Array = rec.get("items", [])
	var i: int = 0
	var cola: float = 0.0


	var pintado: int = 0
	for it in items:
		var v: float = float(it.get("amount", 0.0)) * escala
		if i < REC_MAX_ITEMS and int(round(v)) > 0:
			rows.append(CareerUi.kv(col, I18n.t(String(it.get("label", ""))),
				"+%d" % int(round(v)), CareerTheme.TEXT_DIM))
			pintado += int(round(v))
			i += 1
		else:
			cola += v
	if int(round(cola)) > 0:
		rows.append(CareerUi.kv(col, I18n.t("OTRAS COMPRAS"),
			"+%d" % int(round(cola)), CareerTheme.TEXT_DIM))
		pintado += int(round(cola))












	var natural: int = total_int - pintado
	if natural != 0:
		rows.append(CareerUi.kv(col, I18n.t("DESCANSO Y FÍSICO"),
			"%+d" % natural, CareerTheme.TEXT_DIM))
	return rows


func _stat_tiles(data: Dictionary) -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	var tiles: Array = []
	var ticks: Array = []





	var cifras: Array = [
			["OCASIONES", int(data.get("chances", 0))],
			["PASES", int(data.get("passes", 0))],
			["GOLES", int(data.get("goals", 0))],
			["ASISTENCIAS", int(data.get("assists", 0))]]












	var clave: int = int(data.get("key_passes", 0))




	var tiros: int =(data.get("shots", []) as Array).size()
	var hay_tiros: bool = data.has("shots")
	for tile in cifras:
		var sub: String = ""
		var vivo: bool = false
		match String(tile[0]):
			"PASES":
				sub = I18n.tf("{0} CLAVE", [clave])
				vivo = clave > 0
			"OCASIONES":
				if hay_tiros:
					sub = "%d %s" % [tiros, I18n.plural(tiros, "TIRO", "TIROS")]
					vivo = tiros > 0
		var t: Control = _stat_tile(String(tile[0]), int(tile[1]), sub, vivo)
		row.add_child(t)
		tiles.append(t)
		ticks.append({"label": t.get_meta("valor") as Label, "to": int(tile[1])})


	_sum_anim.append({"kind": "card", "node": row})
	_sum_anim.append({"kind": "group", "nodes": tiles})
	_sum_anim.append({"kind": "ticks", "items": ticks})
	return row





func _stat_tile(label: String, value: int, sub: String = "",
		sub_vivo: bool = false) -> Control:
	var tile: PanelContainer = PanelContainer.new()
	tile.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	tile.add_theme_stylebox_override("panel", CareerTheme.chip())
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	tile.add_child(col)







	var val_l: Label = _centered(CareerTheme.T_TITLE_MODAL,
		CareerTheme.TEXT if value > 0 else CareerTheme.TEXT_DIM, "0")
	col.add_child(val_l)
	tile.set_meta("valor", val_l)


	col.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM, I18n.t(label)))
	if not sub.is_empty():



		var sub_l: Label = _centered(CareerTheme.T_CAPTION,
			CareerTheme.TEXT if sub_vivo else CareerTheme.TEXT_DIM, sub)
		sub_l.autowrap_mode = TextServer.AUTOWRAP_WORD
		col.add_child(sub_l)
	return tile















func _rating_breakdown_card(data: Dictionary) -> Control:



	var partes: Dictionary = MatchRating.breakdown(data.get("rating_counts", {}), 3,
		float(data.get("rating_peso", 1.0)))
	var suma: Array = partes["suma"]
	var resta: Array = partes["resta"]
	if suma.is_empty() and resta.is_empty():
		return null
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	card.add_child(col)


	var tag: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	tag.text = I18n.t("POR QUÉ ESA NOTA")
	col.add_child(tag)


	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 28)
	col.add_child(fila)
	fila.add_child(_breakdown_col(I18n.t("LO QUE SUMÓ"), suma))
	fila.add_child(_breakdown_col(I18n.t("LO QUE RESTÓ"), resta))
	_sum_anim.append({"kind": "card", "node": card})
	return card














func _breakdown_col(titulo: String, filas: Array) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 6)
	var cab: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	cab.text = titulo
	cab.clip_text = true
	col.add_child(cab)
	if filas.is_empty():


		var nada: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		nada.text = I18n.t("NADA", "nota")
		col.add_child(nada)
		return col
	for f in filas:
		var g: Dictionary = f as Dictionary
		var v: float = float(g["v"])
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 8)
		col.add_child(fila)
		var que: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
		que.text = I18n.t(String(g["label"]), "nota")
		que.clip_text = true
		que.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		que.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(que)
		var n: int = int(g["n"])
		if n > 1:
			var veces: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
			veces.text = "×%d" % n
			fila.add_child(veces)


		var cuanto: Label = CareerUi.plain(CareerTheme.T_DIM,
			CareerTheme.GOOD if v > 0.0 else UiKit.DANGER)
		cuanto.text = "%+.1f" % v
		cuanto.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		fila.add_child(cuanto)
	return col







func _xp_card(data: Dictionary) -> Control:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	card.add_child(col)
	col.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM, I18n.t("EXPERIENCIA")))



	var big: Label = _centered(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT,
		"+%d XP" % int(data.get("xp", 0)))
	col.add_child(big)
	_sum_anim.append({"kind": "card", "node": card})
	_sum_anim.append({"kind": "count", "label": big, "to": int(data.get("xp", 0))})







	var rows: Array = []
	for m in data.get("milestones", []):
		var r: Label = _centered(CareerTheme.T_DIM, CareerTheme.GOOD,
			"%s  +%d" % [I18n.t(String(m.get("label", ""))), int(m.get("xp", 0))])
		col.add_child(r)
		rows.append(r)
	var ups: int = int(data.get("level_up", 0))
	if ups > 0:
		var lvl: int = int(data.get("level", 0))







		var up_l: Label = _centered(CareerTheme.T_BODY, CareerTheme.accent_text(),
			I18n.tf("¡NIVEL {0}!", [lvl]) if Career.skills_maxed()
			else I18n.tf("¡NIVEL {0}!  +{1} puntos",
				[lvl, ups * Career.SKILL_POINTS_PER_LEVEL]))
		col.add_child(up_l)
		rows.append(up_l)
	if not rows.is_empty():
		_sum_anim.append({"kind": "group", "nodes": rows})
	return card













func _pay_card(pay: Dictionary) -> Control:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	card.add_child(col)


	if Career.paga_mult() > 1.0:
		col.add_child(_centered(CareerTheme.T_DIM, CareerTheme.MONEY,
			"%s ×%d" % [I18n.t("NÓMINA"), roundi(Career.paga_mult())]))
	else:
		col.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM, I18n.t("NÓMINA")))
	var total: int = int(pay.get("total", 0))
	var big: Label = _centered(CareerTheme.T_TITLE_MODAL,
		CareerTheme.MONEY if total >= 0 else UiKit.DANGER,
		"%s$ %s" % ["+" if total >= 0 else "-", CareerUi.money(absi(total))])
	col.add_child(big)
	_sum_anim.append({"kind": "card", "node": card})
	_sum_anim.append({"kind": "money", "label": big, "to": total})
	if UiKit.es_horizontal():


		var factura: GridContainer = GridContainer.new()
		factura.columns = 2
		factura.add_theme_constant_override("h_separation", 28)
		factura.add_theme_constant_override("v_separation", 8)
		col.add_child(factura)
		for row in PAY_ROWS:
			var amount: int = int(pay.get(String(row[0]), 0))
			if amount == 0:
				continue
			var concepto: Control = _pay_row(String(row[1]), amount)
			concepto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			factura.add_child(concepto)
		return card





	var entra: int = 0
	var sale: int = 0
	for row in PAY_ROWS:
		var amount: int = int(pay.get(String(row[0]), 0))
		if amount > 0:
			entra += amount
		else:
			sale += amount
	var rows: Array = []
	if entra != 0:
		var r_in: Control = _pay_row("INGRESOS", entra)
		col.add_child(r_in)
		rows.append(r_in)
	if sale != 0:
		var r_out: Control = _pay_row("DESCUENTOS", sale)
		col.add_child(r_out)
		rows.append(r_out)
	if not rows.is_empty():
		_sum_anim.append({"kind": "group", "nodes": rows})



	var desglose: VBoxContainer = VBoxContainer.new()
	desglose.add_theme_constant_override("separation", 6)
	desglose.visible = false
	for row in PAY_ROWS:
		var amount: int = int(pay.get(String(row[0]), 0))


		if amount == 0:
			continue
		var concepto: Control = _pay_row(String(row[1]), amount)
		concepto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		desglose.add_child(concepto)


	if desglose.get_child_count() > 1:


		var toggle: Button = CareerUi.accion("moneda", I18n.t("VER DESGLOSE"),
			CareerTheme.MONEY)
		toggle.custom_minimum_size = Vector2(0, 56)
		toggle.pressed.connect(func() -> void:
			desglose.visible = not desglose.visible
			CareerUi.pinta_accion(toggle, "moneda", I18n.t("OCULTAR DESGLOSE"
				if desglose.visible else "VER DESGLOSE"), CareerTheme.MONEY,
				desglose.visible))
		col.add_child(toggle)
		col.add_child(desglose)
	return card



func _pay_row(label: String, amount: int) -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	var name_label: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	name_label.text = I18n.t(label)
	name_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(name_label)
	var value: Label = CareerUi.plain(CareerTheme.T_DIM,
		CareerTheme.MONEY if amount > 0 else UiKit.DANGER)
	value.text = "%s$ %s" % ["+" if amount > 0 else "-", CareerUi.money(absi(amount))]
	row.add_child(value)
	return row













func _sponsor_card() -> Control:
	var card: PanelContainer = PanelContainer.new()
	card.add_theme_stylebox_override("panel", CareerTheme.chip())
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	card.add_child(col)



	col.add_child(_centered(CareerTheme.T_DIM, CareerTheme.TEXT_DIM,
		I18n.t("TUS PATROCINADORES")))




	_sum_anim.append({"kind": "card", "node": card})




	var rows: Array = []
	for e in Career.last_sponsors:
		var c: Dictionary = e.get("contract", {})
		if c.is_empty():
			continue
		var brand: Color = Sponsors.color_of(String(e["id"]))
		var line: HBoxContainer = HBoxContainer.new()
		line.add_theme_constant_override("separation", 12)
		col.add_child(line)
		rows.append(line)
		var logo: SponsorLogo = SponsorLogo.new()
		logo.custom_minimum_size = Vector2(34, 34)
		logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		logo.setup(String(e["id"]), brand)
		line.add_child(logo)


		var nom: Label = CareerUi.plain(CareerTheme.T_DIM, brand)
		nom.text = I18n.t(String(Sponsors.by_id(String(e["id"])).get("name", "")))
		nom.custom_minimum_size = Vector2(400 if UiKit.es_horizontal() else 240, 0)
		nom.clip_text = not UiKit.es_horizontal()
		if UiKit.es_horizontal():
			nom.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		nom.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		line.add_child(nom)
		var barra: Control = CareerUi.stat_bar(Sponsors.progress_ratio(c), brand, 380)
		barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		line.add_child(barra)
		var det: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
		det.text = Sponsors.progress_text(c)
		det.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		det.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		det.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		det.clip_text = not UiKit.es_horizontal()
		if UiKit.es_horizontal():
			det.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		line.add_child(det)




		var gain: int = int(e.get("gain", 0))
		if gain > 0 and String(e.get("obj", "")) != "rating":
			var plus: Label = CareerUi.plain(CareerTheme.T_DIM,
				CareerTheme.accent_text())
			plus.text = "+%d" % gain
			plus.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			line.add_child(plus)
	if not rows.is_empty():
		_sum_anim.append({"kind": "group", "nodes": rows})
	return card









const SOCIO_CHIPS: int = 3














func _socios_card() -> Control:
	var puntos: Dictionary = Career.last_socios
	if puntos.is_empty():
		return null
	var filas: Array = []
	for nm in puntos:












		if absi(int(puntos[nm])) < 2:
			continue
		filas.append({"name": String(nm), "v": int(puntos[nm])})
	if filas.is_empty():
		return null
	filas.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["v"]) > int(b["v"]))
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 14)
	CareerUi.head(box, I18n.t("LA SOCIEDAD"))





	CareerUi.dim(box, I18n.t("en este partido"))
	_sum_anim.append({"kind": "card", "node": box})



	var flow: HFlowContainer = HFlowContainer.new()
	flow.add_theme_constant_override("h_separation", 8)
	flow.add_theme_constant_override("v_separation", 8)
	box.add_child(flow)
	for i in mini(SOCIO_CHIPS, filas.size()):
		var fila: Dictionary = filas[i]




		flow.add_child(CareerUi.stat_chip(
			CareerUi.display_name(CareerUi.surname(String(fila["name"]))),
			int(fila["v"])))
	if filas.size() > SOCIO_CHIPS:


		CareerUi.dim(box, I18n.tf("y {0} más", [filas.size() - SOCIO_CHIPS]))
	return box


func _relations(rel: Dictionary, rel_delta: Dictionary) -> Control:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 14)



	CareerUi.head(box, I18n.t("RELACIONES"))
	_sum_anim.append({"kind": "card", "node": box})




	var bravata: Label = _spicy_line()
	if bravata != null:
		box.add_child(bravata)
















	var movidas: Array = []
	var quietas: Array = []
	for entry in REL_ROWS:
		var key: String = String(entry[0])
		if int(rel_delta.get(key, 0)) != 0:
			movidas.append(entry)
		else:
			quietas.append(entry)
	for entry in movidas:
		var key: String = String(entry[0])
		box.add_child(_relation_row(key, String(entry[1]),
			int(rel.get(key, 0)), int(rel_delta.get(key, 0))))
	if not quietas.is_empty():




		var partes: PackedStringArray = PackedStringArray()
		for entry in quietas:
			partes.append("%s %d" % [CareerTheme.caps(I18n.t(String(entry[1]))),
				int(rel.get(String(entry[0]), 0))])
		var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		l.text = "%s · %s" % [I18n.t("SIN CAMBIOS"), " · ".join(partes)]
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		box.add_child(l)
	return box







func _spicy_line() -> Label:
	var s: Dictionary = Career.last_spicy
	if s.is_empty():
		return null
	var rival: Dictionary = Teams.by_id(String(s.get("club", "")))
	var nombre: String = Competitions.demarca(String(rival.get("name", "?"))) \
			if not rival.is_empty() else "?"
	var cumplida: bool = bool(s.get("cumplida", false))
	var l: Label = CareerUi.plain(CareerTheme.T_BODY,
		CareerTheme.accent_text() if cumplida else CareerTheme.DANGER)


	if bool(s.get("gol", false)):
		l.text = I18n.tf("Cumpliste tu promesa de gol ante el {0}", [nombre]) if cumplida \
				else I18n.tf("Prometiste un gol ante el {0} y no llegó", [nombre])
	else:
		l.text = I18n.tf("Cumpliste tu palabra ante el {0}", [nombre]) if cumplida \
				else I18n.tf("Te tragas tus palabras ante el {0}", [nombre])
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	return l











func _relation_row(icon_type: String, name: String, value: int, delta: int) -> Control:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 8)
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 14)
	box.add_child(top)
	var icon: MenuIcon = MenuIcon.new()
	icon.custom_minimum_size = Vector2(40, 40)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup(icon_type, CareerTheme.accent_text())
	top.add_child(icon)



	var name_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	name_l.text = CareerTheme.caps(I18n.t(name))
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	top.add_child(name_l)


	var antes: int = clampi(value - delta, 0, 100)
	var l_antes: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	l_antes.text = "%d →" % antes
	l_antes.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	top.add_child(l_antes)
	var val_l: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	val_l.text = str(value)
	top.add_child(val_l)
	var d_l: Label = CareerUi.plain(CareerTheme.T_BODY,
		CareerTheme.GOOD if delta > 0 else UiKit.DANGER)
	d_l.text = "%+d" % delta
	d_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	top.add_child(d_l)


	var lo: float = float(mini(antes, value)) / 100.0
	var hi: float = float(maxi(antes, value)) / 100.0
	var fill: ColorRect = CareerUi.bar(box, CareerTheme.accent(), REL_BAR_H)
	var tramo: ColorRect = ColorRect.new()
	tramo.color = CareerTheme.GOOD if delta > 0 else UiKit.DANGER
	tramo.anchor_left = lo
	tramo.anchor_right = hi
	tramo.anchor_top = 0.0
	tramo.anchor_bottom = 1.0
	tramo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fill.get_parent().add_child(tramo)
	CareerUi.set_bar(fill, lo)
	_sum_anim.append({"kind": "bar", "fill": fill, "to": lo, "delta": d_l,
		"also": [tramo]})
	return box






func _centered(size: int, color: Color, text: String) -> Label:
	var l: Label = CareerUi.plain(size, color)
	l.text = text
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	return l
