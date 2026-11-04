class_name ParejaFicha
extends RefCounted

















static func pct_mult(mult: float) -> String:
	var d: int = roundi((mult - 1.0) * 100.0)
	return I18n.t("NORMAL") if d == 0 else "%+d%%" % d






static func efectos(id: String) -> Array:
	var p: Dictionary = Pareja.by_id(id)
	var sitios: Dictionary = {"cena": "LA CENA DEL CLUB", "bar": "EL BAR",
		"galeria": "LA GALERÍA", "calle": "LA PUERTA DEL ESTADIO"}
	var out: Array = []
	out.append([I18n.t("DÓNDE LA CONOCES"),
		I18n.t(String(sitios.get(Pareja.sitio_de(id), "—"))), CareerTheme.TEXT])



	var gasto: float = Pareja.gasto_frac(id)
	var invita: bool = Pareja.invita_de(id) > 0.0
	var gasto_txt: String = I18n.t("NINGUNO") if gasto <= 0.0 \
			else I18n.tf("EL {0} DEL SUELDO", ["%d%%" % roundi(gasto * 100.0)])
	out.append([I18n.t("GASTO EN CASA"),
		I18n.t("INVITA ELLA") if invita else gasto_txt,
		CareerTheme.MONEY if invita
			else (CareerTheme.DANGER if gasto > Pareja.GASTO_FRAC + 0.0001 else CareerTheme.TEXT)])
	var desc: float = Pareja.descanso_de(id)
	out.append([I18n.t("DESCANSO EN CASA"), pct_mult(desc),
		CareerTheme.DANGER if desc < 1.0 else CareerTheme.TEXT])

	var mud: int = Pareja.mudanza_de(id)
	out.append([I18n.t("SE MUDA CONTIGO"),
		I18n.t("PRONTO") if mud < Pareja.MUDANZA_BARRA
			else (I18n.t("SIN PRISA") if mud > Pareja.MUDANZA_BARRA else I18n.t("NORMAL")),
		CareerTheme.TEXT])
	var celos: float = float(p.get("celos", 1.0))
	out.append([I18n.t("SE ENFADA"), pct_mult(celos),
		CareerTheme.DANGER if celos > 1.0 else CareerTheme.TEXT])
	out.append([I18n.t("SE CONTENTA"), pct_mult(float(p.get("paga", 1.0))),
		CareerTheme.TEXT])


	var calma: int = Pareja.calma_de(id)
	var exige: float = Pareja.exige_de(id)
	var baja_txt: String = I18n.tf("{0} · APENAS", [calma])
	if exige >= 1.0:
		baja_txt = I18n.tf("{0} · RÁPIDO", [calma])
	elif exige >= 0.7:
		baja_txt = I18n.tf("{0} · DESPACIO", [calma])
	out.append([I18n.t("BAJA SOLA DESDE"), baja_txt,
		CareerTheme.DANGER if exige >= 1.0 else CareerTheme.TEXT])
	var pide: float = Pareja.pide_de(id)
	out.append([I18n.t("PIDE DINERO"),
		I18n.tf("EL {0} DEL SUELDO", ["%d%%" % roundi(pide * 100.0)]) if pide > 0.0
			else I18n.t("NUNCA"),
		CareerTheme.DANGER if pide > 0.0 else CareerTheme.TEXT])

	var se_va: bool = Pareja.divorcio_p(id) > 0.0 or Pareja.arruina(id)
	var se_va_txt: String = I18n.t("NUNCA")
	if Pareja.arruina(id):
		se_va_txt = I18n.t("CUANDO LE CONVENGA")
	elif se_va:
		se_va_txt = I18n.t("PUEDE HACERLO")
	out.append([I18n.t("PIDE EL DIVORCIO"), se_va_txt,
		CareerTheme.DANGER if se_va else CareerTheme.TEXT])
	var parte: float = Pareja.divorcio_de(id)




	var lleva: String = I18n.t("DEPENDE DE LAS ESCRITURAS") if Pareja.arruina(id) \
			else (I18n.t("NADA") if parte <= 0.0
			else I18n.tf("EL {0} DE LO TUYO", ["%d%%" % roundi(parte * 100.0)]))
	out.append([I18n.t("SE LLEVA AL IRSE"), lleva,
		CareerTheme.DANGER if parte > 0.0 or Pareja.arruina(id) else CareerTheme.TEXT])
	var regalo: float = float(p.get("regalo", 0.0))
	if regalo > 0.0:
		out.append([I18n.t("TE REGALA"),
			I18n.tf("HASTA EL {0} DEL SUELDO", ["%d%%" % roundi(regalo * 100.0)]),
			CareerTheme.MONEY])




	var mejor: Array = []
	var lejos: float = 0.0
	for barra in Pareja.ENTORNO_BARRAS:
		for lado in ["roce", "eco"]:
			var m: float = float((p.get(lado, {}) as Dictionary).get(barra, 1.0))
			if absf(m - 1.0) > lejos + 0.0001:
				lejos = absf(m - 1.0)
				mejor = [barra, lado, m]
	if not mejor.is_empty():
		var rotulo: Dictionary = {"equipo": "VESTUARIO", "aficion": "AFICIÓN",
			"prensa": "PRENSA"}
		var cuesta: bool = String(mejor[1]) == "roce"
		var mas: bool = float(mejor[2]) > 1.0
		var val: String = I18n.t("TE SUMA MENOS")
		if cuesta and mas:
			val = I18n.t("TE CUESTA MÁS")
		elif cuesta:
			val = I18n.t("TE CUESTA MENOS")
		elif mas:
			val = I18n.t("TE SUMA MÁS")
		out.append([I18n.t(String(rotulo[String(mejor[0])])), val,
			CareerTheme.DANGER if cuesta and mas else CareerTheme.TEXT])
	return out







static func pinta_efectos(col: Container, id: String) -> void:
	pinta_renglones(col, efectos(id))










static func pinta_renglones(col: Container, rows: Array) -> void:
	for e in rows:
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 8)
		col.add_child(fila)
		var k: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		k.text = String(e[0])
		k.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		k.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(k)
		var v: Label = CareerUi.plain(CareerTheme.T_CAPTION, e[2] as Color)
		v.text = String(e[1])
		v.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		v.size_flags_stretch_ratio = 1.25
		v.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		fila.add_child(v)





static func chapa(host: Node, arquetipo: String, d: float = 48.0) -> Button:
	var b: Button = Button.new()
	b.name = "MedallaPareja"
	b.custom_minimum_size = Vector2(56, 56)
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_ROW_FONT)
	for estado in ["normal", "hover", "pressed", "focus"]:
		b.add_theme_stylebox_override(estado, StyleBoxEmpty.new())
	b.pressed.connect(func() -> void: abre(host, arquetipo))
	var m: RasgoBadge = PlayerCard.medalla_pareja(arquetipo, d)
	m.position = Vector2(56.0 - d, 56.0 - d) * 0.5
	b.add_child(m)
	return b





static func abre(host: Node, arquetipo: String) -> void:
	if Pareja.by_id(arquetipo).is_empty():
		return
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	var album: Array = Pareja.ALBUM.get(arquetipo, [arquetipo, ""])
	var col: Color = CareerTheme.RASGO.get(RasgoBadge.PREFIJO_PAREJA + arquetipo,
		CareerTheme.TEXT_DIM)
	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 18)
	box.add_child(top)
	var m: RasgoBadge = PlayerCard.medalla_pareja(arquetipo, RasgoBadge.DIAM * 2.0)
	top.add_child(m)
	var colv: VBoxContainer = VBoxContainer.new()
	colv.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	colv.alignment = BoxContainer.ALIGNMENT_CENTER
	colv.add_theme_constant_override("separation", 8)
	top.add_child(colv)
	var nom: Label = CareerUi.plain(CareerTheme.T_HEAD, col)
	nom.text = CareerTheme.caps(I18n.t(String(album[0])))
	nom.clip_text = true
	colv.add_child(nom)
	var verdad: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	verdad.text = I18n.t(String(album[1]))
	verdad.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	colv.add_child(verdad)
	var efe: VBoxContainer = VBoxContainer.new()
	efe.add_theme_constant_override("separation", 4)
	box.add_child(efe)
	pinta_efectos(efe, arquetipo)
	m.resalta()
	box.add_child(CareerUi.primary_cta(I18n.t("CERRAR"),
		func() -> void: CareerUi.close_top_modal(host)))
