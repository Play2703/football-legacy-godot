class_name DecisionUi
extends RefCounted





















const REL_LABEL: Dictionary = {
	"tecnico": "Técnico", "equipo": "Vestuario", "aficion": "Afición",
	"prensa": "Prensa", "agente": "Agente", "pareja": "Pareja",
}






const REL_ORDER: Array = [
	["tecnico", "Técnico"], ["equipo", "Vestuario"], ["aficion", "Afición"],
	["prensa", "Prensa"], ["agente", "Agente"], ["pareja", "Pareja"],
]




const VIGILA_MAX: float = 760.0


const VIGILA_OJO: float = 36.0









static func rel_panel(parent: Container, only: Dictionary = {},
		desde: Dictionary = {}) -> Dictionary:
	var rows: Dictionary = {}
	for entry in REL_ORDER:
		var rkey: String = String(entry[0])
		if not Career.rel.has(rkey):
			continue
		if rkey == "pareja" and not Career.pareja_activa():
			continue
		if not only.is_empty() and not only.has(rkey):
			continue
		rows[rkey] = rel_row(parent, rkey, I18n.t(String(entry[1])),
			int(desde.get(rkey, Career.rel[rkey])))
	return rows





static func rels_at_stake(ev: Dictionary) -> Dictionary:
	var keys: Dictionary = {}
	for key in ["a", "b", "c"]:
		if not ev.has(key):
			continue
		var fx: Dictionary =(ev[key] as Dictionary).get("fx", {})
		DecisionUi._collect_rels(keys, fx.get("rel", {}))
		if fx.has("risk"):
			var risk: Dictionary = fx["risk"]
			for branch in ["win", "lose"]:
				DecisionUi._collect_rels(keys,
					(risk.get(branch, {}) as Dictionary).get("rel", {}))
	return keys



static func _tag_or_chips(row: Container, risk: Dictionary, lado: String,
		col: Color) -> void:
	var rotulo: String = String(risk.get("%s_tag" % lado, ""))
	if not rotulo.is_empty():
		var l: Label = CareerUi.plain(16, col)
		l.text = CareerTheme.caps(I18n.t(rotulo))
		row.add_child(l)
		return
	DecisionUi._rel_chips_into(row,(risk.get(lado, {}) as Dictionary).get("rel", {}))
	DecisionUi._edge_chips_into(row, risk.get(lado, {}))


static func _collect_rels(into: Dictionary, rels: Dictionary) -> void:
	for k in rels:
		if not is_zero_approx(float(rels[k])):
			into[String(k)] = true





static func animate_change(rows: Dictionary, before: Dictionary,
		after: Dictionary) -> int:
	var moved: int = 0
	for entry in REL_ORDER:
		var rkey: String = String(entry[0])
		if not rows.has(rkey) or not before.has(rkey):
			continue
		var from_v: int = int(before[rkey])
		var to_v: int = int(after.get(rkey, from_v))
		if from_v != to_v:
			animate_row(rows[rkey], from_v, to_v, 0.15 + float(moved) * 0.18)
			moved += 1
	return moved




static func settle_time(moved: int) -> float:
	return 0.15 + float(maxi(moved, 1)) * 0.18 + 0.5





static func rel_row(parent: Container, icon_type: String, name: String, value: int) -> Dictionary:
	var box: VBoxContainer = VBoxContainer.new()
	box.add_theme_constant_override("separation", 6)
	parent.add_child(box)
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 12)
	box.add_child(top)
	var icon: MenuIcon = MenuIcon.new()
	icon.custom_minimum_size = Vector2(38, 38)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup(icon_type, CareerTheme.accent_text())
	top.add_child(icon)
	var name_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	name_l.text = name
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.clip_text = true
	top.add_child(name_l)

	var badge: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	badge.modulate.a = 0.0
	badge.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	top.add_child(badge)
	var val_l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.accent_text())
	val_l.text = str(value)
	val_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	top.add_child(val_l)
	var fill: ColorRect = CareerUi.bar(box, CareerTheme.accent())
	CareerUi.set_bar(fill, float(value) / 100.0)
	return {"icon": icon, "badge": badge, "value": val_l, "fill": fill}





static func animate_row(refs: Dictionary, from_v: int, to_v: int, delay: float) -> void:
	var fill: ColorRect = refs["fill"]
	var val_l: Label = refs["value"]
	var badge: Label = refs["badge"]
	var icon: MenuIcon = refs["icon"]
	var up: bool = to_v > from_v
	badge.text = "%+d" %(to_v - from_v)
	badge.add_theme_color_override("font_color", CareerTheme.GOOD if up else CareerTheme.DANGER)
	icon.pivot_offset = icon.custom_minimum_size * 0.5

	var t: Tween = fill.create_tween()
	t.set_parallel(true)
	t.tween_method(DecisionUi._set_rel_visual.bind(val_l, fill), float(from_v), float(to_v), 0.55) \
			.set_delay(delay).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	t.tween_property(badge, "modulate:a", 1.0, 0.2).set_delay(delay)

	var it: Tween = icon.create_tween()
	it.tween_interval(delay)
	it.tween_property(icon, "scale", Vector2(1.3, 1.3), 0.16).set_trans(Tween.TRANS_SINE)
	it.tween_property(icon, "scale", Vector2.ONE, 0.24) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)




static func _set_rel_visual(v: float, val_l: Label, fill: ColorRect) -> void:
	val_l.text = str(roundi(v))
	CareerUi.set_bar(fill, v / 100.0)




static func side_effects(e_before: float, m_before: int) -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 16)
	var de: int = roundi(Career.energy - e_before)
	if de != 0:
		var el: Label = CareerUi.plain(19, CareerTheme.GOOD if de > 0 else CareerTheme.DANGER)
		el.text = I18n.tf("{0} energía", ["%+d" % de])
		row.add_child(el)
	var dm: int = Career.money - m_before
	if dm != 0:
		var ml: Label = CareerUi.plain(19, CareerTheme.MONEY)
		ml.text = "%s$ %s" % ["+" if dm > 0 else "-", CareerUi.money(absi(dm))]
		row.add_child(ml)
	return row











static func effects_row(fx: Dictionary) -> Control:
	var row: HFlowContainer = HFlowContainer.new()
	row.alignment = FlowContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("h_separation", 10)
	row.add_theme_constant_override("v_separation", 4)
	if fx.has("risk"):
		var risk: Dictionary = fx["risk"]
		var tag: Label = CareerUi.plain(16, CareerTheme.accent_text())



		tag.text = "%d%% :" % roundi(Career.risk_chance(fx) * 100.0)
		row.add_child(tag)






		DecisionUi._tag_or_chips(row, risk, "win", CareerTheme.TEXT)
		var sep: Label = CareerUi.plain(16, CareerTheme.TEXT_DIM)
		sep.text = I18n.t("o")
		row.add_child(sep)
		DecisionUi._tag_or_chips(row, risk, "lose", CareerTheme.TEXT_DIM)
		return row






	if fx.has("rel_pts"):
		DecisionUi._rel_pts_into(row, fx["rel_pts"])
	else:
		DecisionUi._rel_chips_into(row, fx.get("rel", {}))







	var d_socio: int = int(fx.get("socio", 0))
	if d_socio != 0:
		row.add_child(CareerUi.stat_chip(I18n.t("SOCIEDAD"), d_socio, "",
			false, "relaciones"))
	var e: float = float(fx.get("energy", 0.0))
	if not is_zero_approx(e):
		var el: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		el.text = I18n.tf("{0} energía", ["%+d" % int(e)])
		row.add_child(el)




	var cash: int = Career.event_cash(fx)
	if cash != 0:
		var ml: Label = CareerUi.plain(18,
			CareerTheme.MONEY if cash > 0 else CareerTheme.DANGER)


		ml.text = "%s$ %s" % ["+" if cash > 0 else "-", CareerUi.money(absi(cash))]








		if float(fx.get("multa", 0.0)) > 0.0:
			ml.text = I18n.tf("multa {0}", [ml.text])
		row.add_child(ml)



	if Career.event_invita(fx) > 0:
		var il: Label = CareerUi.plain(18, CareerTheme.MONEY)
		il.text = I18n.t("· invita ella")
		row.add_child(il)











	var rabos: Array[Control] = []
	var vigila: String = String(fx.get("vigila", ""))
	if not vigila.is_empty():
		rabos.append(DecisionUi._rabo_vigila(
			I18n.tf("LA PROXIMA: MULTA ×2 · ROJA {0}", ["%d" % Comunicado.EXTRA_TECNICO])
			if vigila == Comunicado.VIGILA_DOBLE
			else I18n.tf("LA PROXIMA: TECNICO {0}", ["%d" % Comunicado.EXTRA_TECNICO])))
	if bool(fx.get("multa_doble", false)):
		rabos.append(DecisionUi._rabo_vigila(I18n.t("VIGILADO: MULTA ×2")))
	var rtec: int = int(fx.get("reincide_tec", 0))
	if rtec != 0:
		rabos.append(DecisionUi._rabo_vigila(I18n.tf("VIGILADO: TECNICO {0}", ["%d" % rtec])))


	if bool(fx.get("action", false)):
		var al: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		al.text = I18n.t("· 1 acción")
		row.add_child(al)





	if fx.has("pareja_start"):
		var pl: Label = CareerUi.plain(18, CareerTheme.accent_text())
		pl.text = I18n.t("· empezáis a salir")
		row.add_child(pl)
	DecisionUi._edge_chips_into(row, fx)
	if bool(fx.get("court", false)):
		var c: Label = CareerUi.plain(18, CareerTheme.accent_text())
		c.text = I18n.t("· posible oferta")
		row.add_child(c)



	if bool(fx.get("palabra", false)):
		var p: Label = CareerUi.plain(18, CareerTheme.accent_text())
		p.text = I18n.t("· das tu palabra")
		row.add_child(p)



	if not String(fx.get("titular", "")).is_empty():
		var t: Label = CareerUi.plain(18, CareerTheme.accent_text())
		t.text = I18n.t("· te buscarán")
		row.add_child(t)


	if bool(fx.get("spicy_gol", false)):
		var g: Label = CareerUi.plain(18, CareerTheme.accent_text())
		g.text = I18n.t("· tienes que marcar")
		row.add_child(g)


	if not rabos.is_empty():
		var dos: VBoxContainer = VBoxContainer.new()
		dos.add_theme_constant_override("separation", 4)
		dos.add_child(row)
		for r in rabos:
			r.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
			dos.add_child(r)
		return dos
	return row










static func _edge_chips_into(row: Container, fx: Dictionary) -> void:



	for spec in [["nat_edge", "selección", true], ["rival_edge", "competidor", false]]:
		var edge: int = int(fx.get(String(spec[0]), 0))
		if edge == 0:
			continue
		var good: bool =(edge > 0) == bool(spec[2])
		var l: Label = CareerUi.plain(18, CareerTheme.GOOD if good else CareerTheme.DANGER)
		l.text = "%+d %s" % [edge, I18n.t(String(spec[1]))]
		row.add_child(l)




static func _rel_pts_into(row: Container, pts: Dictionary) -> void:
	for k in pts:
		var key: String = String(k)
		if Career.rel_derivada(key):
			continue
		var d: int = int(pts[k])
		var tint: Color = CareerTheme.TEXT_DIM
		if d > 0:
			tint = CareerTheme.GOOD
		elif d < 0:
			tint = CareerTheme.DANGER
		var l: Label = CareerUi.plain(18, tint)
		l.text = "%s%d %s" % ["+" if d > 0 else ("" if d < 0 else "±"), d,
			I18n.t(String(REL_LABEL.get(key, key)))]
		row.add_child(l)






static func _rabo_vigila(texto: String) -> HBoxContainer:
	var hb: HBoxContainer = HBoxContainer.new()
	hb.add_theme_constant_override("separation", 8)
	var ojo: MenuIcon = MenuIcon.new()
	ojo.custom_minimum_size = Vector2(VIGILA_OJO, VIGILA_OJO)
	ojo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ojo.setup("vision", CareerTheme.DANGER)
	hb.add_child(ojo)
	var vl: Label = CareerUi.plain(18, CareerTheme.DANGER)
	vl.text = texto
	vl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var ancho: float = vl.get_minimum_size().x
	vl.clip_text = true
	vl.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	vl.custom_minimum_size.x = minf(ancho, VIGILA_MAX)
	hb.add_child(vl)
	return hb




const MARKET_NAME_MAX: float = 400.0






static func market_row(m: Dictionary) -> Control:
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)
	col.add_child(_market_line(m))
	return col


static func _market_line(m: Dictionary) -> Control:
	var row: HBoxContainer = HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation", 8)
	var club_id: String = String(m.get("club", ""))
	var club: Dictionary = Teams.by_id(club_id) if not club_id.is_empty() else {}
	if not club.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(28, 28)
		crest.set_team(club)
		row.add_child(crest)
		var nm: Label = CareerUi.plain(18, CareerTheme.TEXT)
		nm.text = CareerTheme.caps(String(club.get("name", club_id)))




		var ancho: float = nm.get_minimum_size().x
		nm.clip_text = true
		nm.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		nm.custom_minimum_size.x = minf(ancho, MARKET_NAME_MAX)
		row.add_child(nm)
	else:
		var nadie: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		nadie.text = I18n.t(String(m.get("nadie", "HOY NO PREGUNTA NADIE")))
		row.add_child(nadie)
	var pide: int = int(m.get("pide", 0))
	if pide > 0:


		var sep: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
		sep.text = "·"
		row.add_child(sep)
		var p: Label = CareerUi.plain(18, CareerTheme.MONEY)
		p.text = I18n.tf("PIDEN {0}", ["$ " + CareerUi.money(pide)])
		row.add_child(p)
	return row













static func _rel_chips_into(row: Container, rels: Dictionary) -> void:
	for k in rels:
		var raw: float = float(rels[k])
		if is_zero_approx(raw):
			continue
		var key: String = String(k)






		if Career.rel_derivada(key):
			continue
		var d: int = Career.projected_delta(key, raw)
		var tint: Color = CareerTheme.TEXT_DIM
		if d > 0:
			tint = CareerTheme.GOOD
		elif d < 0:
			tint = CareerTheme.DANGER
		var l: Label = CareerUi.plain(18, tint)
		l.text = "%s%d %s" % ["+" if d > 0 else ("" if d < 0 else "±"), d,
			I18n.t(String(REL_LABEL.get(key, key)))]
		row.add_child(l)
