extends RefCounted







































const SALIR_MS: int = 2000
const HUB_SCENE: String = "res://ui/career_hub.tscn"
const PAGE_SCENE: String = "res://ui/career_page.tscn"
const MENU_SCENE: String = "res://ui/main_menu.tscn"




const CIERRES: Array[String] = ["CERRAR", "CANCELAR", "VOLVER", "< ATRAS"]









static func despacha(tree: SceneTree, fade: Node, sin_salir: bool = false) -> String:



	for n in SceneFade.grupo(Settings.AHORRO_HOLD_GROUP):
		if n.has_method("grabando") and bool(n.grabando()):
			return "grabando"
	var escena: Node = tree.current_scene
	if escena == null:
		return "nada"




	var foco: Control = tree.root.gui_get_focus_owner()
	if foco is LineEdit and (foco as LineEdit).is_editing():
		(foco as LineEdit).unedit()
		foco.release_focus()
		return "teclado"
	var capa: Node = ultimo_visible(tree, CareerUi.ATRAS_CAPA_GROUP, escena)
	if capa != null and capa.has_method("atras") and bool(capa.atras()):
		return "capa"
	if escena.has_method("atras") and bool(escena.atras()):
		return "pantalla"
	var modal: Node = ultimo_visible(tree, CareerUi.MODAL_GROUP, escena)
	if modal != null:
		var cierre: BaseButton = boton_de_cierre(modal)
		if cierre == null:
			return "modal_sin_boton"
		cierre.pressed.emit()
		return "modal"
	var boton: Node = ultimo_visible(tree, CareerUi.ATRAS_BTN_GROUP, escena, true)
	if boton != null:
		(boton as BaseButton).pressed.emit()
		return "boton"
	match escena.scene_file_path:
		HUB_SCENE:
			fade.to_scene(MENU_SCENE)
			return "mapa"
		PAGE_SCENE:
			if escena.has_method("_on_family"):
				escena._on_family("hogar")
				return "mapa"



	if escena.has_method("salta_con_atras") and bool(escena.salta_con_atras()):
		return "mapa"
	if sin_salir:









		if escena.scene_file_path == MENU_SCENE and OS.has_feature("pc"):
			return salir_modal(tree, fade, escena)
		return "nada"
	return salir(tree, fade)






static func ultimo_visible(tree: SceneTree, grupo: String, escena: Node,
		usable: bool = false) -> Node:
	var lista: Array[Node] = SceneFade.grupo(grupo)
	for i in range(lista.size() - 1, -1, -1):
		var n: Node = lista[i]
		if not escena.is_ancestor_of(n) or n.is_queued_for_deletion():
			continue
		if n is CanvasItem and not (n as CanvasItem).is_visible_in_tree():
			continue
		if usable and not (n is BaseButton and not (n as BaseButton).disabled):
			continue
		return n
	return null




static func boton_de_cierre(modal: Node) -> BaseButton:
	var botones: Array[Node] = modal.find_children("*", "BaseButton", true, false)
	for n in botones:
		var b: BaseButton = n as BaseButton
		if _usable(b) and (b.is_in_group(CareerUi.ATRAS_BTN_GROUP) or b.has_meta("atras")):
			return b
	var cierres: Array[String] = []
	for k in CIERRES:
		cierres.append(_llano(I18n.t(k)))
	for n in botones:
		var b: BaseButton = n as BaseButton
		if _usable(b) and cierres.has(_llano(_rotulo(b))):
			return b
	return null


static func _usable(b: BaseButton) -> bool:
	return b != null and not b.disabled and b.is_visible_in_tree()




static func _rotulo(b: BaseButton) -> String:
	if b is Button and not (b as Button).text.strip_edges().is_empty():
		return (b as Button).text
	for l in b.find_children("*", "Label", true, false):
		var t: String =(l as Label).text
		if not t.strip_edges().is_empty():
			return t
	return ""


static func _llano(t: String) -> String:
	return CareerTheme.deaccent(t.strip_edges().to_upper())






static func salir(tree: SceneTree, fade: Node) -> String:
	var ahora: int = Time.get_ticks_msec()
	if ahora < int(fade.atras_salir_hasta):
		fade.atras_salir_hasta = 0
		cierra(tree, fade)
		return "salir"
	fade.atras_salir_hasta = ahora + SALIR_MS
	aviso(fade as CanvasLayer, I18n.t("PULSA OTRA VEZ PARA SALIR"))
	return "salir_aviso"






static func cierra(tree: SceneTree, fade: Node) -> void:
	if bool(fade.simula_android_atras) or bool(fade.salir_fingido):
		fade.salidas_test = int(fade.salidas_test) + 1
		return
	tree.root.propagate_notification(Node.NOTIFICATION_WM_CLOSE_REQUEST)
	tree.quit()











static func salir_modal(tree: SceneTree, fade: Node, escena: Node) -> String:


	if UiKit.es_horizontal():
		var d: DecisionTumbada = DecisionTumbada.salir_juego(escena,
			func() -> void: cierra(tree, fade))
		return "salir_modal" if d != null else "modal"
	var box: VBoxContainer = CareerUi.modal(escena)
	if box == null:
		return "modal"





	var t: Label = CareerUi.line(box, I18n.t("¿SALIR DEL JUEGO?"))
	t.add_theme_font_size_override("font_size", 34)
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER









	var no: Button = CareerUi.menu_row(I18n.t("CANCELAR"), "")
	no.set_meta("atras", true)
	no.set_meta(Entrada.PRIMERO_META, true)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(no)
	var si: Button = CareerUi.accion("puerta", I18n.t("SALIR"), CareerTheme.DANGER, true)
	si.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		cierra(tree, fade))
	box.add_child(si)
	CareerUi.normalize_caps(box)
	return "salir_modal"









static func aviso(capa: CanvasLayer, texto: String,
		segundos: float = SALIR_MS / 1000.0) -> void:
	var panel: PanelContainer = PanelContainer.new()
	panel.name = "AvisoSalir"
	panel.add_theme_stylebox_override("panel", CareerTheme.plate())
	panel.anchor_left = 0.5
	panel.anchor_right = 0.5
	panel.anchor_top = 0.32
	panel.anchor_bottom = 0.32
	panel.offset_left = -430.0
	panel.offset_right = 430.0
	panel.grow_horizontal = Control.GROW_DIRECTION_BOTH
	panel.grow_vertical = Control.GROW_DIRECTION_BOTH
	panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	capa.add_child(panel)



	var l: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	l.text = texto
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(l)
	UiKit.pop_in(panel)


	SceneFade.timer(segundos, true).timeout.connect(panel.queue_free)
