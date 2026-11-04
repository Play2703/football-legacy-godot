extends RefCounted

























const OFL_PRESS_START: Array = [
	"Copyright 2012 The Press Start 2P Project Authors (cody@zone38.net), with Reserved Font Name \"Press Start 2P\".",
	"",
	"This Font Software is licensed under the SIL Open Font License, Version 1.1.",
	"This license is copied below, and is also available with a FAQ at:",
	"http://scripts.sil.org/OFL",
	"",
	"",
	"-----------------------------------------------------------",
	"SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007",
	"-----------------------------------------------------------",
	"",
	"PREAMBLE",
	"The goals of the Open Font License (OFL) are to stimulate worldwide",
	"development of collaborative font projects, to support the font creation",
	"efforts of academic and linguistic communities, and to provide a free and",
	"open framework in which fonts may be shared and improved in partnership",
	"with others.",
	"",
	"The OFL allows the licensed fonts to be used, studied, modified and",
	"redistributed freely as long as they are not sold by themselves. The",
	"fonts, including any derivative works, can be bundled, embedded, ",
	"redistributed and/or sold with any software provided that any reserved",
	"names are not used by derivative works. The fonts and derivatives,",
	"however, cannot be released under any other type of license. The",
	"requirement for fonts to remain under this license does not apply",
	"to any document created using the fonts or their derivatives.",
	"",
	"DEFINITIONS",
	"\"Font Software\" refers to the set of files released by the Copyright",
	"Holder(s) under this license and clearly marked as such. This may",
	"include source files, build scripts and documentation.",
	"",
	"\"Reserved Font Name\" refers to any names specified as such after the",
	"copyright statement(s).",
	"",
	"\"Original Version\" refers to the collection of Font Software components as",
	"distributed by the Copyright Holder(s).",
	"",
	"\"Modified Version\" refers to any derivative made by adding to, deleting,",
	"or substituting -- in part or in whole -- any of the components of the",
	"Original Version, by changing formats or by porting the Font Software to a",
	"new environment.",
	"",
	"\"Author\" refers to any designer, engineer, programmer, technical",
	"writer or other person who contributed to the Font Software.",
	"",
	"PERMISSION & CONDITIONS",
	"Permission is hereby granted, free of charge, to any person obtaining",
	"a copy of the Font Software, to use, study, copy, merge, embed, modify,",
	"redistribute, and sell modified and unmodified copies of the Font",
	"Software, subject to the following conditions:",
	"",
	"1) Neither the Font Software nor any of its individual components,",
	"in Original or Modified Versions, may be sold by itself.",
	"",
	"2) Original or Modified Versions of the Font Software may be bundled,",
	"redistributed and/or sold with any software, provided that each copy",
	"contains the above copyright notice and this license. These can be",
	"included either as stand-alone text files, human-readable headers or",
	"in the appropriate machine-readable metadata fields within text or",
	"binary files as long as those fields can be easily viewed by the user.",
	"",
	"3) No Modified Version of the Font Software may use the Reserved Font",
	"Name(s) unless explicit written permission is granted by the corresponding",
	"Copyright Holder. This restriction only applies to the primary font name as",
	"presented to the users.",
	"",
	"4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font",
	"Software shall not be used to promote, endorse or advertise any",
	"Modified Version, except to acknowledge the contribution(s) of the",
	"Copyright Holder(s) and the Author(s) or with their explicit written",
	"permission.",
	"",
	"5) The Font Software, modified or unmodified, in part or in whole,",
	"must be distributed entirely under this license, and must not be",
	"distributed under any other license. The requirement for fonts to",
	"remain under this license does not apply to any document created",
	"using the Font Software.",
	"",
	"TERMINATION",
	"This license becomes null and void if any of the above conditions are",
	"not met.",
	"",
	"DISCLAIMER",
	"THE FONT SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND,",
	"EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF",
	"MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT",
	"OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE",
	"COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,",
	"INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL",
	"DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING",
	"FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM",
	"OTHER DEALINGS IN THE FONT SOFTWARE.",
]





const AVISO_BILLING: String = "Copyright (c) 2020 Godot Engine contributors"
const AVISO_PLAY_GAMES: String = "Copyright (c) 2023 Jacob Ibáñez Sánchez"
const AVISO_STEAM: String = "Copyright (c) 2015-Current | GP Garcia, Chris Ridenour, and Contributors"



const COSE_DESDE: int = 60

const RAYA_MAX: int = 24


static var ultima: VBoxContainer = null



static func ofl() -> String:
	return "\n".join(PackedStringArray(OFL_PRESS_START))






static func bloques() -> Array:
	var b: Array = []
	b.append({"titulo": "Godot Engine", "texto": Engine.get_license_text()})
	b.append({"titulo": "Press Start 2P", "texto": ofl()})
	var mit: String = String(Engine.get_license_info().get("Expat", ""))
	if Settings.es_android():
		b.append({"titulo": "Godot Google Play Billing", "texto": AVISO_BILLING + "\n\n" + mit})
		b.append({"titulo": "Godot Play Game Services", "texto": AVISO_PLAY_GAMES + "\n\n" + mit})
	elif SteamPuente.es_steam():
		b.append({"titulo": "GodotSteam", "texto": AVISO_STEAM + "\n\n" + mit})
	for c in Engine.get_copyright_info():
		var nombre: String = String(c.get("name", ""))

		if nombre == "Godot Engine":
			continue
		var lineas: PackedStringArray = []
		for parte in c.get("parts", []):
			for cr in parte.get("copyright", []):
				lineas.append("(c) " + String(cr))
			lineas.append(I18n.t("Licencia: {0}").format([String(parte.get("license", ""))]))
		b.append({"titulo": nombre, "texto": "\n".join(lineas), "componente": true})
	var textos: Dictionary = Engine.get_license_info()
	var claves: Array = textos.keys()
	claves.sort()
	for k in claves:
		b.append({"titulo": String(k), "texto": String(textos[k])})
	return b







static func parrafos(texto: String) -> PackedStringArray:
	var out: PackedStringArray = []
	var actual: String = ""
	var previo: String = ""
	for crudo in texto.split("\n"):
		var linea: String = crudo.strip_edges()
		if linea.is_empty():
			if not actual.is_empty():
				out.append(actual)
			actual = ""
			previo = ""
			continue


		if _es_raya(linea):
			linea = linea.left(RAYA_MAX)
		if actual.is_empty():
			actual = linea
		elif previo.length() >= COSE_DESDE and not _es_raya(previo) and not _es_raya(linea):
			actual += " " + linea
		else:
			actual += "\n" + linea
		previo = linea
	if not actual.is_empty():
		out.append(actual)
	return out


static func _es_raya(linea: String) -> bool:
	return linea.replace("-", "").replace("=", "").strip_edges().is_empty()






const POR_FOTOGRAMA: int = 40




static func _llena(col: VBoxContainer, piezas: Array, t_cabeza: int, t_cuerpo: int,
		box: VBoxContainer) -> void:
	var arbol: SceneTree = col.get_tree()
	var i: int = 0
	while i < piezas.size():
		if not is_instance_valid(col):
			return
		var hasta: int = mini(i + POR_FOTOGRAMA, piezas.size())
		for k in range(i, hasta):
			var cabecera: bool = piezas[k][1]
			var l: Label = CareerUi.plain(t_cabeza if cabecera else t_cuerpo,
				CareerTheme.accent_text() if cabecera else CareerTheme.TEXT_MID)
			l.text = String(piezas[k][0])
			l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			col.add_child(l)
		i = hasta
		if i < piezas.size():
			await arbol.process_frame
	if is_instance_valid(box):
		box.set_meta("completa", true)



static func abre(host: Node) -> VBoxContainer:
	var tumbado: bool = UiKit.es_horizontal()
	var box: VBoxContainer = CareerUi.modal_pantalla(host) if tumbado else CareerUi.modal(host)
	if box == null:
		return null
	ultima = box
	box.name = "Licencias"
	var t_titulo: int = CareerTheme.T_TITULO_TUMBADO if tumbado else CareerTheme.T_TITLE_MODAL
	var t_cabeza: int = CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_HEAD
	var t_cuerpo: int = CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_DIM
	var t: Label = CareerUi.plain(t_titulo, CareerTheme.TEXT)
	t.name = "Titulo"
	t.text = CareerTheme.caps(I18n.t("LICENCIAS"))
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t.clip_text = true
	box.add_child(t)



	var sc: DragScroll = DragScroll.new()
	sc.name = "Texto"
	sc.paginar = false
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	sc.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	if tumbado:


		sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
		sc.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		var vp: Viewport = host.get_viewport()
		var ancho_vp: float = vp.get_visible_rect().size.x if vp != null else 1920.0
		sc.custom_minimum_size.x = minf(ancho_vp - 2.0 * UiKit.side_safe_inset(vp) - 80.0, 1240.0)
	else:


		sc.custom_minimum_size = Vector2(0, 1000)
	box.add_child(sc)
	var col: VBoxContainer = VBoxContainer.new()
	col.name = "Columna"
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 12)
	sc.add_child(col)


	var piezas: Array = []
	for bl in bloques():
		var d: Dictionary = bl
		piezas.append([String(d["titulo"]), true])
		for p in parrafos(String(d["texto"])):
			piezas.append([p, false])
	_llena(col, piezas, t_cabeza, t_cuerpo, box)
	var cerrar: Button = Button.new()
	cerrar.name = "Cerrar"
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.TOQUE_TUMBADO if tumbado else 78.0)
	if tumbado:
		cerrar.custom_minimum_size.x = sc.custom_minimum_size.x
		cerrar.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST,
		CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_BODY)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)

	cerrar.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	return box
