extends RefCounted
const Datos := preload("res://features/career/brazaletes.gd")


static func abrir(casa: Control) -> void:
	var box: VBoxContainer = CareerUi.modal(casa)
	if box == null:
		return
	box.name = "BrazaletesCasaPanel"
	CareerUi.head(box, I18n.t("TUS BRAZALETES"))
	var registros: Array = Datos.snapshot()
	var contenido: VBoxContainer = VBoxContainer.new()
	contenido.add_theme_constant_override("separation", 18)
	box.add_child(contenido)
	var estado: Dictionary = {"pagina": maxi(0, registros.size() - 1)}
	_pagina(contenido, registros, estado)
	CareerUi.dim(box, I18n.t("El nombramiento se gana jugando. La vitrina conserva tus brazaletes."))
	box.add_child(CareerUi.primary_cta(I18n.t("CERRAR"), func() -> void:
		CareerUi.close_modal(box)))


static func _pagina(box: VBoxContainer, registros: Array, estado: Dictionary) -> void:
	for nodo in box.get_children():
		nodo.queue_free()
		box.remove_child(nodo)
	if registros.is_empty():
		CareerUi.dim(box, I18n.t("Tu primer brazalete aparecerá cuando te nombren capitán."))
		return
	var i: int = posmod(int(estado["pagina"]), registros.size())
	var d: Dictionary = registros[i]
	CareerUi.pager(box, I18n.tf("{0} / {1}", [i + 1, registros.size()]),
		registros.size(), i, func(delta: int) -> void:
			estado["pagina"] = posmod(i + delta, registros.size())
			_pagina(box, registros, estado))
	var nombre: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	nombre.text = Datos.nombre(d)
	nombre.clip_text = true
	nombre.custom_minimum_size.y = 128
	nombre.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_child(nombre)
	CareerUi.dim(box, I18n.t("CAPITÁN DE LA SELECCIÓN") if d["tipo"] == "seleccion"
		else I18n.t("CAPITÁN DEL CLUB"))
	CareerUi.dim(box, I18n.tf("REGISTRADO EN LA TEMPORADA {0}", [d["temporada"]])
		if d["recuperado"] else I18n.tf("TEMPORADA {0}", [d["temporada"]]))
	if d["recuperado"]:
		CareerUi.dim(box, I18n.t("Esta partida ya tenía la capitanía. Se conserva la vigente, sin inventar fechas anteriores."))
