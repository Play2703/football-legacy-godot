class_name LogrosGoles
extends RefCounted
































const VISOR: String = "res://ui/repe_guardada.tscn"


const VISOR_GD: String = "res://ui/repe_guardada.gd"

const TOPE: int = ReplayAlbum.MAX_POR_RANURA

const COLUMNAS: int = 8
const FILAS: int = 4

const HUECO: float = 13.0

const ASPECTO: float = 16.0 / 11.0

const TRAMO_W: float = 139.0
const TRAMO_H: float = 75.0

const AVISO_W: float = 300.0


const VACIO_TXT_W: float = 560.0


const MANTENER_S: float = 1.2


const TODOS: Vector2i = Vector2i(0, 1<<30)


static var volver_a: String = ""


static var abre_escena: Callable = Callable()


var host: Control = null

var repinta: Callable = Callable()

var sel: String = ""
var tramo: Vector2i = TODOS

var _de_vuelta: bool = false

var _entradas: Array = []

var _minis: Dictionary = {}

var _celdas: Dictionary = {}

var _ficha_box: VBoxContainer = null
var _ficha_ancho: float = 460.0


func _init(pantalla: Control, al_repintar: Callable) -> void:
	host = pantalla
	repinta = al_repintar
	if not volver_a.is_empty():
		sel = volver_a
		volver_a = ""
		_de_vuelta = true
	recarga()




static func vuelve_del_visor() -> bool:
	return not volver_a.is_empty()



static func avance() -> Vector2i:
	return Vector2i(ReplayAlbum.cuantas(), TOPE)



static func nota() -> String:
	var a: Vector2i = avance()
	return "%d/%d" % [a.x, a.y]


func recarga() -> void:
	_entradas = ReplayAlbum.lista()
	_valida()


func entradas() -> Array:
	return _entradas




func _valida() -> void:
	if tramo != TODOS and not _entradas.any(func(e: Dictionary) -> bool: return _en_tramo(e, tramo)):
		tramo = TODOS
	var vis: Array[String] = _ids_vista()
	if not vis.has(sel):
		sel = vis[0] if not vis.is_empty() else ""


static func _ilegible(e: Dictionary) -> bool:
	return bool(e.get("ilegible", false))


static func _temporada(e: Dictionary) -> int:
	return int(e.get("temporada", 0))


func _en_tramo(e: Dictionary, t: Vector2i) -> bool:
	if t == TODOS:
		return true

	return not _ilegible(e) and _temporada(e) >= t.x and _temporada(e) <= t.y


func _vista() -> Array:
	return _entradas.filter(func(e: Dictionary) -> bool: return _en_tramo(e, tramo))


func _ids_vista() -> Array[String]:
	var out: Array[String] = []
	for e in _vista():
		out.append(String(e["id"]))
	return out


func _entrada(id: String) -> Dictionary:
	for e in _entradas:
		if String(e["id"]) == id:
			return e
	return {}






func _tramos(cabe: int) -> Array:
	var temps: Array[int] = []
	for e in _entradas:
		var t: int = _temporada(e)
		if not _ilegible(e) and t > 0 and not temps.has(t):
			temps.append(t)
	temps.sort()
	temps.reverse()
	var out: Array = [[I18n.t("TODOS"), TODOS, _entradas.size()]]
	var sitios: int = maxi(cabe - 1, 0)
	var sueltas: Array[int] = temps.duplicate()
	var viejas: Array[int] = []
	if temps.size() > sitios and sitios == 1:


		sueltas = temps.slice(0, 1)
	elif temps.size() > sitios:
		sueltas = temps.slice(0, maxi(sitios - 1, 0))
		viejas = temps.slice(maxi(sitios - 1, 0)) if sitios > 0 else []
	for t in sueltas:
		var r: Vector2i = Vector2i(t, t)
		out.append([I18n.tf("T{0}", [t]), r, _cuenta(r)])
	if not viejas.is_empty():
		var r: Vector2i = Vector2i(viejas.min(), viejas.max())
		out.append([I18n.tf("T{0}-T{1}", [r.x, r.y]) if r.x != r.y else I18n.tf("T{0}", [r.x]),
			r, _cuenta(r)])

	if not out.any(func(x: Array) -> bool: return x[1] == tramo):
		tramo = TODOS
		_valida()
	return out


func _cuenta(r: Vector2i) -> int:
	return _entradas.filter(func(e: Dictionary) -> bool: return _en_tramo(e, r)).size()


func _elige_tramo(r: Vector2i) -> void:
	if r == tramo:
		return
	tramo = r
	_valida()
	_repinta()


func _repinta() -> void:
	if repinta.is_valid():
		repinta.call()








static func minuto(e: Dictionary) -> String:
	var m: Variant = e.get("minuto", "")
	if typeof(m) == TYPE_INT or typeof(m) == TYPE_FLOAT:
		return "%d'" % int(m)
	return String(m)



static func _marcador(e: Dictionary) -> Array:
	var m: Variant = e.get("marcador", [])
	if typeof(m) == TYPE_ARRAY and (m as Array).size() >= 2:
		return [int(m[0]), int(m[1])]
	return []



static func marcador(e: Dictionary, sep: String = "-") -> String:
	var m: Array = _marcador(e)
	return "%d%s%d" % [m[0], sep, m[1]] if not m.is_empty() else ""




static func t_j(e: Dictionary) -> String:
	var t: int = _temporada(e)
	if t <= 0:
		return ""
	var s: String = I18n.tf("T{0}", [t])
	var j: int = int(e.get("jornada", 0))
	if j > 0:
		s += " · " + I18n.tf("J{0}", [j])
	return s



static func donde(e: Dictionary, corto: bool = false) -> String:
	if bool(e.get("local", true)):
		return I18n.t("CASA" if corto else "EN CASA")
	return I18n.t("FUERA")



static func viento_ms(e: Dictionary) -> int:
	var v: Variant = e.get("viento", [])
	if typeof(v) != TYPE_ARRAY or (v as Array).size() < 3:
		return 0
	return int(round(Vector3(float(v[0]), float(v[1]), float(v[2])).length()))




static func club(e: Dictionary) -> Dictionary:
	var id: String = String(e.get("club", ""))
	return _equipo(id if not id.is_empty() else GameState.player_team_id)


static func rival(e: Dictionary) -> Dictionary:
	return _equipo(String(e.get("rival", "")))




static func _equipo(id: String) -> Dictionary:
	if id.is_empty():
		return {}
	var t: Dictionary = Teams.by_id(id)
	if t.is_empty():
		t = Nations.as_team(id.trim_prefix("nat:"))
	return t



static func nombre(t: Dictionary) -> String:
	return CareerTheme.caps(Nations.team_label(t, "?"))


static func clima_txt(e: Dictionary) -> String:
	var c: String = String(e.get("clima", ""))
	if c.is_empty():
		return ""
	return CareerTheme.caps(I18n.t(Weather.display_name(c, int(e.get("lluvia", -1)))))


func _mini(id: String) -> Texture2D:
	if not _minis.has(id):
		_minis[id] = ReplayAlbum.miniatura(id)
	return _minis[id] as Texture2D







func ver(id: String) -> void:
	if id.is_empty() or _ilegible(_entrada(id)):
		return
	volver_a = id
	var visor: GDScript = load(VISOR_GD) as GDScript
	if visor != null:
		visor.set("pendiente", id)
	if abre_escena.is_valid():
		abre_escena.call(VISOR)
	else:
		SceneFade.to_scene(VISOR)





func borrar(id: String) -> bool:
	var i: int = _ids_vista().find(id)


	var i_todos: int = _entradas.map(func(e: Dictionary) -> String: return String(e["id"])).find(id)
	var tramo_antes: Vector2i = tramo
	if not ReplayAlbum.borra(id):
		return false
	_minis.erase(id)
	_entradas = ReplayAlbum.lista()

	var era_sel: bool = sel == id
	_valida()
	if tramo != tramo_antes:
		i = i_todos
	var vis: Array[String] = _ids_vista()
	if era_sel and not vis.is_empty():
		sel = vis[clampi(i, 0, vis.size() - 1)]
	if host != null and is_instance_valid(host):
		CareerUi.close_top_modal(host)
	_repinta()
	return true








func pinta_album(cats: HBoxContainer, area: HBoxContainer, ancho: float) -> void:
	_entradas = ReplayAlbum.lista()
	_valida()
	_celdas.clear()
	var lleno: bool = _entradas.size() >= TOPE

	var izq: HBoxContainer = HBoxContainer.new()
	izq.add_theme_constant_override("separation", 18)
	cats.add_child(izq)
	var ico: MenuIcon = MenuIcon.new()
	ico.custom_minimum_size = Vector2(53, 53)
	ico.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ico.setup("gol", CareerTheme.NAV_YO)
	izq.add_child(ico)
	var tit: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	tit.text = I18n.t("GOLES")
	tit.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	izq.add_child(tit)
	var hueco: Control = Control.new()
	hueco.custom_minimum_size = Vector2(6, 0)
	izq.add_child(hueco)
	var cuenta: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO,
		CareerTheme.text_on_dark(CareerTheme.DANGER) if lleno else CareerTheme.TEXT)
	cuenta.text = "%d / %d" % [_entradas.size(), TOPE]
	cuenta.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cuenta.set_meta("goles_cuenta", true)
	izq.add_child(cuenta)
	var barra: Control = _barra(float(_entradas.size()) / float(TOPE),
		CareerTheme.DANGER if lleno else CareerTheme.NAV_YO, 16.0)
	barra.custom_minimum_size.x = 293.0
	barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	izq.add_child(barra)

	var medio: Control
	if lleno:
		var aviso: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO,
			CareerTheme.text_on_dark(CareerTheme.DANGER))
		aviso.text = I18n.t("LLENO · BORRA UNO PARA GUARDAR OTRO")




		aviso.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		aviso.custom_minimum_size.x = AVISO_W
		aviso.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		aviso.set_meta("goles_lleno", true)
		medio = aviso
	else:
		medio = Control.new()
	medio.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cats.add_child(medio)

	var libre: float = ancho - izq.get_combined_minimum_size().x - 16.0 \
			-(AVISO_W + 16.0 if lleno else 0.0)
	var cabe: int = clampi(int(floorf((libre + 8.0) /(TRAMO_W + 8.0))), 1, 8)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	cats.add_child(fila)

	for tr in ([] if _entradas.is_empty() else _tramos(cabe)):
		var b: Button = _boton_tramo(String(tr[0]), int(tr[2]), tr[1] == tramo, tr[1])
		b.custom_minimum_size = Vector2(TRAMO_W, TRAMO_H)
		fila.add_child(b)

	var rej: _Rejilla = _Rejilla.new()
	rej.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rej.size_flags_vertical = Control.SIZE_EXPAND_FILL
	area.add_child(rej)
	var vista: Array = _vista()
	for e in vista:
		var c: Button = _celda(e)
		rej.add_child(c)
		rej.celdas.append(c)



	if tramo == TODOS:
		for i in range(vista.size(), TOPE):
			var h: _Hueco = _Hueco.new()
			rej.add_child(h)
			rej.celdas.append(h)
	if _entradas.is_empty():
		rej.encima = _vacio()
		rej.add_child(rej.encima)
	else:
		var pie: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM)
		pie.text = I18n.t("TOCA UN GOL Y VELO. BORRAR SE MANTIENE.")
		pie.clip_text = true
		pie.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		rej.pie = pie
		rej.add_child(pie)




func _boton_tramo(nombre: String, n: int, activo: bool, r: Vector2i) -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	for estado in ["normal", "hover", "pressed", "hover_pressed"]:
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = CareerTheme.SURFACE_HI if activo else CareerTheme.SURFACE
		if estado != "normal":
			sb.bg_color = sb.bg_color.lightened(0.06)
		sb.border_color = CareerTheme.TEXT if activo else CareerTheme.SURFACE_HI
		sb.set_border_width_all(3)
		sb.set_corner_radius_all(CareerTheme.RADIUS)
		b.add_theme_stylebox_override(estado, sb)
	UiKit.add_feedback(b)
	b.set_meta("goles_tramo", r)
	b.pressed.connect(func() -> void: _elige_tramo(r))
	var caja: VBoxContainer = VBoxContainer.new()
	caja.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_theme_constant_override("separation", 4)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(caja)
	var nl: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.text_on_dark(CareerTheme.NAV_YO))
	nl.text = nombre
	nl.clip_text = true
	nl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(nl)
	var cl: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	cl.text = str(n)
	cl.clip_text = true
	cl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(cl)
	return b






func _celda(e: Dictionary) -> Button:
	var id: String = String(e["id"])
	var roto: bool = _ilegible(e)
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.clip_contents = true
	b.set_meta("gol_id", id)
	for estado in ["normal", "hover", "pressed", "hover_pressed"]:
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = _fondo_foto()
		if estado != "normal":
			sb.bg_color = sb.bg_color.lightened(0.05)
		sb.set_corner_radius_all(CareerTheme.RADIUS)
		if roto:
			sb.border_color = CareerTheme.DANGER.darkened(0.45)
			sb.set_border_width_all(3)
		b.add_theme_stylebox_override(estado, sb)
	UiKit.add_feedback(b)
	if roto:
		var q: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT_DIM)
		q.text = "?"
		q.set_anchors_preset(Control.PRESET_FULL_RECT)
		q.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		q.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		b.add_child(q)
	else:
		_foto(b, id)
		_esquina(b, _pastilla(minuto(e), CareerTheme.T_CAP_TUMBADO), 0)
		var esc: CrestView = CrestView.new()
		esc.custom_minimum_size = Vector2(37, 37)
		esc.set_team(rival(e))
		_esquina(b, esc, 2)
		var s: String = marcador(e)
		if not s.is_empty():
			_esquina(b, _pastilla(s, CareerTheme.T_CAP_TUMBADO), 3)
	var marco: Panel = Panel.new()
	marco.name = "Marco"
	var sbm: StyleBoxFlat = StyleBoxFlat.new()
	sbm.draw_center = false
	sbm.border_color = CareerTheme.NAV_YO
	sbm.set_border_width_all(4)
	sbm.set_corner_radius_all(CareerTheme.RADIUS)
	marco.add_theme_stylebox_override("panel", sbm)
	marco.set_anchors_preset(Control.PRESET_FULL_RECT)
	b.add_child(marco)
	marco.visible = id == sel

	if id == sel:
		b.set_meta(Entrada.PRIMERO_META, true)
	_sin_raton(b)
	b.pressed.connect(func() -> void: elige(id))
	_celdas[id] = b
	return b



func elige(id: String) -> void:
	if id == sel:
		return
	var antes: Button = SceneFade.vivo(_celdas.get(sel)) as Button
	if antes != null:
		(antes.get_node("Marco") as Control).visible = false
		antes.remove_meta(Entrada.PRIMERO_META)
	sel = id
	var b: Button = SceneFade.vivo(_celdas.get(id)) as Button
	if b != null:
		(b.get_node("Marco") as Control).visible = true
		b.set_meta(Entrada.PRIMERO_META, true)
	if _ficha_box != null and is_instance_valid(_ficha_box):
		pinta_ficha(_ficha_box, _ficha_ancho)



func pinta_ficha(box: VBoxContainer, ancho: float) -> void:
	_ficha_box = box
	_ficha_ancho = ancho
	for c in box.get_children():
		box.remove_child(c)
		c.queue_free()


	var col_ficha: VBoxContainer = VBoxContainer.new()
	col_ficha.add_theme_constant_override("separation", 0)
	box.add_child(col_ficha)
	box = col_ficha
	if _entradas.is_empty():
		_como_se_guarda(box, ancho)
		return
	var e: Dictionary = _entrada(sel)
	if e.is_empty():
		return
	var alto_foto: float = floorf(ancho / ASPECTO)
	if _ilegible(e):
		var caja: PanelContainer = PanelContainer.new()
		caja.custom_minimum_size = Vector2(ancho, alto_foto)
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = _fondo_foto()
		sb.border_color = CareerTheme.DANGER
		sb.set_border_width_all(4)
		sb.set_corner_radius_all(CareerTheme.RADIUS)
		caja.add_theme_stylebox_override("panel", sb)
		box.add_child(caja)
		var col: VBoxContainer = VBoxContainer.new()
		col.alignment = BoxContainer.ALIGNMENT_CENTER
		col.add_theme_constant_override("separation", 21)
		caja.add_child(col)
		var q: Label = CareerUi.plain(CareerTheme.T_HEROE_TUMBADO, CareerTheme.TEXT_DIM)
		q.text = "?"
		q.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		col.add_child(q)
		var nl: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.text_on_dark(CareerTheme.DANGER))
		nl.text = I18n.t("NO SE PUEDE LEER")
		nl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		nl.set_meta("goles_ilegible", true)
		col.add_child(nl)
		_aire(box, 21.0)
		var nota: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID)
		nota.text = I18n.t("El archivo se dañó. Sólo queda borrarlo.")
		nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		nota.custom_minimum_size.x = ancho
		box.add_child(nota)
		_aire(box, 21.0)
		_botones_ficha(box, id_de(e), false)
		return

	var foto: Button = _foto_grande(String(e["id"]), Vector2(ancho, alto_foto), t_j(e), 4.0)
	box.add_child(foto)
	_aire(box, 21.0)

	var fila: HBoxContainer = HBoxContainer.new()
	box.add_child(fila)
	var ml: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	ml.text = minuto(e)
	ml.clip_text = true
	ml.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ml.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	ml.set_meta("goles_minuto", true)
	fila.add_child(ml)
	var dc: PanelContainer = _pastilla(donde(e), CareerTheme.T_CAP_TUMBADO, CareerTheme.SURFACE_HI)
	dc.set_meta("goles_donde", true)
	fila.add_child(dc)
	_aire(box, 19.0)

	box.add_child(_placa(e, 59.0, CareerTheme.T_DATO_TUMBADO, CareerTheme.SURFACE, true))
	_aire(box, 19.0)

	box.add_child(_clima_viento(e, 29.0, CareerTheme.T_CAP_TUMBADO, false))
	_aire(box, 21.0)
	_botones_ficha(box, String(e["id"]), true)


static func id_de(e: Dictionary) -> String:
	return String(e.get("id", ""))



func _botones_ficha(box: VBoxContainer, id: String, con_ver: bool) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	box.add_child(fila)
	if con_ver:
		var ver_b: Button = _boton_play(I18n.t("VER"), CareerTheme.T_LEE_TUMBADO, 35.0)
		ver_b.custom_minimum_size = Vector2(280, 88)
		ver_b.set_meta("goles_ver", true)
		ver_b.pressed.connect(func() -> void: ver(id))
		fila.add_child(ver_b)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 8)
	fila.add_child(col)
	var borra: Button = Button.new()
	borra.text = I18n.t("BORRAR")
	borra.custom_minimum_size = Vector2(164, 88)

	CareerTheme.apply_button(borra, CareerTheme.Kind.WARN, CareerTheme.T_CAP_TUMBADO)
	borra.set_meta("goles_borrar", true)
	col.add_child(borra)
	var pista: Control = _barra(0.0, CareerTheme.DANGER, 7.0)
	col.add_child(pista)
	_mantener(borra, pista.get_child(1) as Control, id)





func _como_se_guarda(box: VBoxContainer, ancho: float) -> void:
	_aire(box, TRAMO_H + 10.0)
	var dib: _DibujoRepe = _DibujoRepe.new()
	dib.custom_minimum_size = Vector2(ancho, 316)
	dib.clip_contents = true
	box.add_child(dib)
	var comp: Control = _boton_falso("compartir", CareerTheme.SURFACE_HI, false)
	comp.position = Vector2(19, 13)
	dib.add_child(comp)
	var gol: Control = _boton_falso("gol", CareerTheme.SURFACE.lerp(CareerTheme.NAV_YO, 0.6), true)
	gol.position = Vector2(107, 13)
	dib.add_child(gol)
	var aqui: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT)
	aqui.text = "< " + I18n.t("AQUI")
	aqui.position = Vector2(200, 34)
	dib.add_child(aqui)
	_aire(box, 21.0)
	var txt: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID)
	txt.text = I18n.t("Hasta 30 goles por carrera. Se ven con el cielo y el viento de aquel día, en tu estadio de hoy.")
	txt.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	txt.custom_minimum_size.x = ancho
	box.add_child(txt)



func _vacio() -> Control:
	var card: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(3)
	sb.set_corner_radius_all(CareerTheme.RADIUS * 2)
	sb.set_content_margin_all(37.0)
	card.add_theme_stylebox_override("panel", sb)
	card.set_meta("goles_vacio", true)
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 24)
	card.add_child(col)
	var ico: MenuIcon = MenuIcon.new()
	ico.custom_minimum_size = Vector2(96, 96)
	ico.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ico.setup("gol", CareerTheme.NAV_YO)
	col.add_child(ico)
	var t: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	t.text = I18n.t("SIN GOLES TODAVIA")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(t)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 16)
	col.add_child(fila)
	var l: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID)
	l.text = I18n.t("MARCA, Y EN LA REPETICION PULSA")
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER




	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var f: Font = l.get_theme_font("font")
	var w: float = VACIO_TXT_W if f == null else ceilf(f.get_string_size(l.text,
		HORIZONTAL_ALIGNMENT_LEFT, -1, CareerTheme.T_CAP_TUMBADO).x) + 2.0
	l.custom_minimum_size.x = minf(w, VACIO_TXT_W)
	fila.add_child(l)
	fila.add_child(_boton_falso("gol", CareerTheme.SURFACE.lerp(CareerTheme.NAV_YO, 0.6), false,
		Vector2(69, 64)))
	return card








func pinta_tramos_pie(strip: HBoxContainer) -> void:
	_entradas = ReplayAlbum.lista()
	_valida()
	for tr in _tramos(6):
		var b: Button = _boton_tramo(String(tr[0]), int(tr[2]), tr[1] == tramo, tr[1])
		b.custom_minimum_size = Vector2(0, 75)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		strip.add_child(b)




func pinta_lista_pie(body: VBoxContainer) -> void:
	_entradas = ReplayAlbum.lista()
	_valida()
	var lleno: bool = _entradas.size() >= TOPE
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 19)
	body.add_child(cab)
	var cl: Label = CareerUi.plain(CareerTheme.T_DIM,
		CareerTheme.text_on_dark(CareerTheme.DANGER) if lleno else CareerTheme.TEXT)
	cl.text = "%d / %d" % [_entradas.size(), TOPE]
	cl.set_meta("goles_cuenta", true)
	cab.add_child(cl)
	var barra: Control = _barra(float(_entradas.size()) / float(TOPE),
		CareerTheme.DANGER if lleno else CareerTheme.NAV_YO, 13.0)
	barra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cab.add_child(barra)
	if lleno:
		var aviso: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.text_on_dark(CareerTheme.DANGER))
		aviso.text = I18n.t("LLENO · BORRA UNO PARA GUARDAR OTRO")


		aviso.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		aviso.set_meta("goles_lleno", true)
		body.add_child(aviso)
	if _entradas.is_empty():
		body.add_child(_vacio())
		return
	var vista: Array = _vista()
	var temps: Array[int] = []
	for e in vista:
		var t: int = _temporada(e)
		if not _ilegible(e) and not temps.has(t):
			temps.append(t)
	temps.sort()
	temps.reverse()
	for t in temps:
		var de: Array = vista.filter(func(e: Dictionary) -> bool:
			return not _ilegible(e) and _temporada(e) == t)
		_grupo(body, I18n.tf("TEMPORADA {0}", [t]) if t > 0 else "?", de.size(), CareerTheme.NAV_YO)
		for e in de:
			body.add_child(_fila_pie(e))
	var rotos: Array = vista.filter(func(e: Dictionary) -> bool: return _ilegible(e))
	if not rotos.is_empty():
		_grupo(body, I18n.t("NO SE PUEDE LEER"), rotos.size(), CareerTheme.DANGER)
		for e in rotos:
			body.add_child(_fila_pie(e))
	_de_vuelta = false



func _grupo(body: VBoxContainer, titulo: String, n: int, col: Color) -> void:


	var aire: Control = Control.new()
	aire.custom_minimum_size = Vector2(0, 10)
	aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
	body.add_child(aire)
	var pc: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.draw_center = false
	sb.border_color = col
	sb.border_width_left = 7
	sb.content_margin_left = 14.0
	sb.content_margin_top = 4.0
	sb.content_margin_bottom = 4.0
	pc.add_theme_stylebox_override("panel", sb)
	body.add_child(pc)
	var fila: HBoxContainer = HBoxContainer.new()
	pc.add_child(fila)
	var tl: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
	tl.text = titulo
	tl.clip_text = true
	tl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(tl)
	var nl: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)

	nl.text = "%d %s" % [n, I18n.plural(n, "GOL", "GOLES")]
	nl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(nl)






func _fila_pie(e: Dictionary) -> Button:
	var id: String = String(e["id"])
	var roto: bool = _ilegible(e)
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 117)
	b.set_meta("gol_id", id)
	var borde: Color = CareerTheme.DANGER.darkened(0.45) if roto \
			else (CareerTheme.NAV_YO if id == sel and _de_vuelta else CareerTheme.SURFACE_HI)


	for estado in ["normal", "hover", "pressed", "hover_pressed", "disabled"]:
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = CareerTheme.SURFACE if estado in ["normal", "disabled"] \
				else CareerTheme.SURFACE.lightened(0.05)
		sb.border_color = borde
		sb.set_border_width_all(3)
		sb.border_width_bottom = CareerTheme.SINK
		sb.set_corner_radius_all(CareerTheme.RADIUS)
		b.add_theme_stylebox_override(estado, sb)
	UiKit.add_feedback(b)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.set_anchors_preset(Control.PRESET_FULL_RECT)
	fila.offset_left = 16.0
	fila.offset_right = -16.0
	fila.offset_bottom = - float(CareerTheme.SINK)
	fila.add_theme_constant_override("separation", 19)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(fila)
	var foto: Control = Control.new()
	foto.custom_minimum_size = Vector2(132, 91)
	foto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	foto.clip_contents = true
	fila.add_child(foto)
	var fondo: ColorRect = ColorRect.new()
	fondo.color = _fondo_foto()
	fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
	foto.add_child(fondo)
	if roto:
		var q: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT_DIM)
		q.text = "?"
		q.set_anchors_preset(Control.PRESET_FULL_RECT)
		q.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		q.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		foto.add_child(q)
		var nl: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.text_on_dark(CareerTheme.DANGER))
		nl.text = I18n.t("NO SE PUEDE LEER")
		nl.clip_text = true
		nl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		nl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		nl.set_meta("goles_ilegible", true)
		fila.add_child(nl)
		_sin_raton(b)
		var borra: Button = Button.new()
		borra.text = I18n.t("BORRAR")
		borra.custom_minimum_size = Vector2(155, 75)
		borra.size_flags_vertical = Control.SIZE_SHRINK_CENTER


		CareerTheme.apply_button(borra, CareerTheme.Kind.WARN, CareerTheme.T_CAPTION)
		borra.set_meta("goles_borrar", true)
		fila.add_child(borra)
		_mantener(borra, _barra_interior(borra), id)

		b.focus_mode = Control.FOCUS_NONE
		b.disabled = true
		return b
	_foto(foto, id)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 13)
	fila.add_child(col)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.add_theme_constant_override("separation", 13)
	col.add_child(arriba)
	var ml: Label = CareerUi.plain(CareerTheme.T_CARD, CareerTheme.TEXT)
	ml.text = minuto(e)
	ml.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	arriba.add_child(ml)
	var esc: CrestView = CrestView.new()
	esc.custom_minimum_size = Vector2(35, 35)
	esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	esc.set_team(rival(e))
	arriba.add_child(esc)
	var rl: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
	rl.text = nombre(rival(e))
	rl.clip_text = true
	rl.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	rl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	arriba.add_child(rl)
	var abajo: HBoxContainer = HBoxContainer.new()
	abajo.add_theme_constant_override("separation", 11)
	col.add_child(abajo)
	var s: String = marcador(e)
	if not s.is_empty():
		abajo.add_child(_pastilla(s, CareerTheme.T_CAPTION, CareerTheme.SURFACE_HI))
	abajo.add_child(_pastilla(donde(e, true), CareerTheme.T_CAPTION, CareerTheme.SURFACE_HI))
	abajo.add_child(_clima_viento(e, 27.0, CareerTheme.T_CAPTION, true))
	var play: Button = _boton_play("", 0, 35.0)
	play.custom_minimum_size = Vector2(85, 75)
	play.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	play.set_meta("goles_ver", true)
	play.pressed.connect(func() -> void: ver(id))
	_sin_raton(b)
	play.mouse_filter = Control.MOUSE_FILTER_STOP
	fila.add_child(play)
	b.pressed.connect(func() -> void: _abre_ficha_pie(id))
	if id == sel and _de_vuelta:
		b.set_meta(Entrada.PRIMERO_META, true)
	return b




func _abre_ficha_pie(id: String) -> void:
	var e: Dictionary = _entrada(id)
	if e.is_empty() or _ilegible(e):
		return
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	sel = id
	box.add_theme_constant_override("separation", 0)
	box.set_meta("goles_ficha", id)
	var ancho: float = CareerUi.MODAL_HALF_W * 2.0 - CareerTheme.plate().get_minimum_size().x
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 19)
	box.add_child(cab)
	var ico: MenuIcon = MenuIcon.new()
	ico.custom_minimum_size = Vector2(48, 48)
	ico.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ico.setup("gol", CareerTheme.NAV_YO)
	cab.add_child(ico)
	var tl: Label = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.TEXT)
	tl.text = I18n.t("GOL") + " · " + minuto(e)
	tl.clip_text = true
	tl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	tl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	tl.set_meta("goles_minuto", true)
	cab.add_child(tl)
	var cerrar: Button = Button.new()
	cerrar.custom_minimum_size = Vector2(85, 75)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.NEUTRAL)
	cerrar.set_meta("atras", true)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	var x: MenuIcon = MenuIcon.new()
	x.setup("cerrar", CareerTheme.TEXT)
	x.custom_minimum_size = Vector2(32, 32)
	x.set_anchors_preset(Control.PRESET_CENTER)
	x.offset_left = -16.0
	x.offset_right = 16.0
	x.offset_top = -16.0 - float(CareerTheme.SINK) * 0.5
	x.offset_bottom = 16.0 - float(CareerTheme.SINK) * 0.5
	cerrar.add_child(x)
	cab.add_child(cerrar)
	_aire(box, 24.0)
	box.add_child(_foto_grande(id, Vector2(ancho, floorf(ancho / ASPECTO)), t_j(e), 4.0, false))
	_aire(box, 21.0)
	box.add_child(_placa(e, 75.0, CareerTheme.T_TITLE_MODAL, _fondo_foto(), false))
	_aire(box, 21.0)
	var chips: HBoxContainer = HBoxContainer.new()
	chips.add_theme_constant_override("separation", 13)
	box.add_child(chips)
	var dc: PanelContainer = _pastilla(donde(e), CareerTheme.T_CAPTION, CareerTheme.SURFACE_HI)
	dc.set_meta("goles_donde", true)
	chips.add_child(dc)
	chips.add_child(_clima_viento(e, 32.0, CareerTheme.T_CAPTION, false))
	_aire(box, 27.0)
	var ver_b: Button = _boton_play(I18n.t("VER EL GOL"), CareerTheme.T_BODY, 37.0)
	ver_b.custom_minimum_size = Vector2(ancho, 85)
	ver_b.set_meta("goles_ver", true)

	ver_b.set_meta(Entrada.PRIMERO_META, true)
	ver_b.pressed.connect(func() -> void: ver(id))
	box.add_child(ver_b)
	_aire(box, 16.0)
	var borra: Button = Button.new()
	borra.text = I18n.t("MANTEN PARA BORRAR")
	borra.custom_minimum_size = Vector2(ancho, 75)
	borra.clip_text = true
	CareerTheme.apply_button(borra, CareerTheme.Kind.WARN, CareerTheme.T_CAPTION)
	borra.set_meta("goles_borrar", true)
	box.add_child(borra)
	_mantener(borra, _barra_interior(borra), id)







static func _fondo_foto() -> Color:
	return CareerTheme.BG_DEEP.lerp(CareerTheme.SURFACE, 0.4)




func _foto(padre: Control, id: String) -> void:
	var tex: Texture2D = _mini(id)
	if tex != null:
		var tr: TextureRect = TextureRect.new()
		tr.texture = tex
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		tr.set_anchors_preset(Control.PRESET_FULL_RECT)
		tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		padre.add_child(tr)
		return
	var ico: MenuIcon = MenuIcon.new()
	ico.setup("gol", CareerTheme.SURFACE_LINE)
	ico.custom_minimum_size = Vector2(1, 1)
	ico.anchor_left = 0.3
	ico.anchor_right = 0.7
	ico.anchor_top = 0.2
	ico.anchor_bottom = 0.8
	padre.add_child(ico)




func _foto_grande(id: String, tam: Vector2, tj: String, borde: float, con_disco: bool = true) -> Button:
	var b: Button = Button.new()
	b.focus_mode = Control.FOCUS_NONE
	b.custom_minimum_size = tam
	b.clip_contents = true
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = _fondo_foto()
	sb.set_corner_radius_all(CareerTheme.RADIUS)
	for estado in ["normal", "hover", "pressed", "hover_pressed"]:
		b.add_theme_stylebox_override(estado, sb)
	UiKit.add_feedback(b)
	_foto(b, id)
	if not tj.is_empty():
		var chip: PanelContainer = _pastilla(tj, CareerTheme.T_CAPTION)
		chip.set_meta("goles_tj", true)
		_esquina(b, chip, 0, 11.0)
	if con_disco:
		var disco: _Disco = _Disco.new()
		disco.custom_minimum_size = Vector2(91, 91)
		disco.set_anchors_preset(Control.PRESET_CENTER)
		disco.offset_left = -45.0
		disco.offset_right = 46.0
		disco.offset_top = -45.0
		disco.offset_bottom = 46.0
		b.add_child(disco)
		var pl: MenuIcon = MenuIcon.new()
		pl.setup("play", CareerTheme.TEXT)
		pl.custom_minimum_size = Vector2(1, 1)
		pl.anchor_left = 0.25
		pl.anchor_right = 0.75
		pl.anchor_top = 0.25
		pl.anchor_bottom = 0.75
		disco.add_child(pl)
	var marco: Panel = Panel.new()
	var sbm: StyleBoxFlat = StyleBoxFlat.new()
	sbm.draw_center = false
	sbm.border_color = CareerTheme.NAV_YO
	sbm.set_border_width_all(int(borde))
	sbm.set_corner_radius_all(CareerTheme.RADIUS)
	marco.add_theme_stylebox_override("panel", sbm)
	marco.set_anchors_preset(Control.PRESET_FULL_RECT)
	b.add_child(marco)
	_sin_raton(b)
	b.pressed.connect(func() -> void: ver(id))
	return b





func _placa(e: Dictionary, escudo: float, fuente: int, fondo: Color, nombres_lado: bool) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = fondo
	sb.border_color = CareerTheme.SURFACE_HI
	sb.set_border_width_all(3 if nombres_lado else 0)
	sb.set_corner_radius_all(CareerTheme.RADIUS * 2)
	sb.content_margin_left = 19.0
	sb.content_margin_right = 19.0
	sb.content_margin_top = 16.0
	sb.content_margin_bottom = 16.0
	pc.add_theme_stylebox_override("panel", sb)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 13)
	pc.add_child(col)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	col.add_child(fila)
	var mio: CrestView = CrestView.new()
	mio.custom_minimum_size = Vector2(escudo, escudo)
	mio.set_team(club(e))
	fila.add_child(mio)
	var medio: VBoxContainer = VBoxContainer.new()
	medio.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	medio.alignment = BoxContainer.ALIGNMENT_CENTER
	medio.add_theme_constant_override("separation", 13)
	fila.add_child(medio)
	var ml: Label = CareerUi.plain(fuente, CareerTheme.TEXT)
	ml.text = marcador(e, " - ")
	ml.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ml.set_meta("goles_marcador", true)
	medio.add_child(ml)
	var suyo: CrestView = CrestView.new()
	suyo.custom_minimum_size = Vector2(escudo, escudo)
	suyo.set_team(rival(e))
	fila.add_child(suyo)
	if nombres_lado:
		var nombres: HBoxContainer = HBoxContainer.new()
		col.add_child(nombres)
		var a: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
		a.text = nombre(club(e))
		a.clip_text = true
		a.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		a.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		nombres.add_child(a)
		var b: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
		b.text = nombre(rival(e))
		b.clip_text = true
		b.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		nombres.add_child(b)
	else:
		var ab: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_MID)
		ab.text = nombre(club(e)) + " · " + nombre(rival(e))
		ab.clip_text = true
		ab.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		ab.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		ab.custom_minimum_size.x = 1.0
		medio.add_child(ab)
	return pc




func _clima_viento(e: Dictionary, icono: float, fuente: int, corto: bool) -> HBoxContainer:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 11)
	var c: String = String(e.get("clima", ""))
	if not c.is_empty():
		var w: WeatherIcon = WeatherIcon.new()
		w.custom_minimum_size = Vector2(icono, icono)
		w.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		w.weather_id = c
		w.rain_level = int(e.get("lluvia", -1))
		w.mouse_filter = Control.MOUSE_FILTER_IGNORE
		fila.add_child(w)
		if not corto:
			var cl: Label = CareerUi.plain(fuente, CareerTheme.TEXT_MID)

			cl.text = clima_txt(e)
			cl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			cl.set_meta("goles_clima", true)
			fila.add_child(cl)
			var aire: Control = Control.new()
			aire.custom_minimum_size = Vector2(8, 0)
			fila.add_child(aire)
	if e.has("viento"):
		var vi: MenuIcon = MenuIcon.new()
		vi.custom_minimum_size = Vector2(icono, icono)
		vi.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		vi.setup("viento", CareerTheme.TEXT_MID)
		fila.add_child(vi)
		var vl: Label = CareerUi.plain(fuente, CareerTheme.TEXT_MID)
		vl.text = str(viento_ms(e)) if corto else I18n.tf("{0} M/S", [viento_ms(e)])
		vl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		vl.set_meta("goles_viento", true)
		fila.add_child(vl)

	for n in fila.get_children():
		(n as Control).mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return fila




func _boton_play(texto: String, fuente: int, icono: float) -> Button:
	var b: Button = Button.new()
	CareerTheme.apply_button_tinted(b, CareerTheme.NAV_YO, 0, 0.6)
	var caja: HBoxContainer = HBoxContainer.new()
	caja.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.offset_bottom = - float(CareerTheme.SINK)
	caja.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_theme_constant_override("separation", 13)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(caja)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(icono, icono)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup("play", CareerTheme.TEXT)
	caja.add_child(ic)
	if not texto.is_empty():
		var l: Label = CareerUi.plain(fuente, CareerTheme.TEXT)
		l.text = texto
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(l)
	return b





func _mantener(btn: Button, relleno: Control, id: String) -> void:
	CareerUi.hold_gesture(btn, MANTENER_S, func() -> void: borrar(id))
	var vivo: Array = [null]
	var para: Callable = func() -> void:
		var tw: Tween = vivo[0] as Tween
		if tw != null and tw.is_valid():
			tw.kill()
		vivo[0] = null
		if is_instance_valid(relleno):
			relleno.anchor_right = 0.0
	btn.button_down.connect(func() -> void:
		para.call()
		var tw: Tween = btn.create_tween()
		tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tw.set_ignore_time_scale(true)
		vivo[0] = tw
		tw.tween_property(relleno, "anchor_right", 1.0,
			maxf(0.05, float(btn.get_meta("hold_secs", MANTENER_S)))))
	btn.button_up.connect(func() -> void: para.call())
	btn.mouse_exited.connect(func() -> void: para.call())



static func _barra_interior(btn: Button) -> Control:
	var r: ColorRect = ColorRect.new()
	r.color = CareerTheme.text_on_dark(CareerTheme.DANGER)
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	r.anchor_left = 0.0
	r.anchor_right = 0.0
	r.anchor_top = 1.0
	r.anchor_bottom = 1.0
	r.offset_top = -7.0
	btn.add_child(r)
	return r




static func _barra(frac: float, col: Color, alto: float) -> Control:
	var pista: Control = Control.new()
	pista.custom_minimum_size = Vector2(0, alto)
	pista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fondo: ColorRect = ColorRect.new()
	fondo.color = CareerTheme.SURFACE
	fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pista.add_child(fondo)
	var lleno: ColorRect = ColorRect.new()
	lleno.color = col
	lleno.anchor_bottom = 1.0
	lleno.anchor_right = clampf(frac, 0.0, 1.0)
	lleno.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lleno.set_meta("goles_barra", true)
	pista.add_child(lleno)
	return pista



static func _pastilla(texto: String, fuente: int, fondo: Color = Color(CareerTheme.BG_DEEP, 0.82)) -> PanelContainer:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = fondo
	sb.set_corner_radius_all(CareerTheme.RADIUS)
	sb.content_margin_left = 8.0
	sb.content_margin_right = 8.0
	sb.content_margin_top = 4.0
	sb.content_margin_bottom = 4.0
	var pc: PanelContainer = PanelContainer.new()
	pc.add_theme_stylebox_override("panel", sb)
	pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var l: Label = CareerUi.plain(fuente, CareerTheme.TEXT)
	l.text = texto
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(l)
	return pc





static func _esquina(padre: Control, c: Control, cual: int, m: float = 7.0) -> void:
	var der: bool = cual == 1 or cual == 3
	var abajo: bool = cual >= 2
	c.anchor_left = 1.0 if der else 0.0
	c.anchor_right = c.anchor_left
	c.anchor_top = 1.0 if abajo else 0.0
	c.anchor_bottom = c.anchor_top
	c.grow_horizontal = Control.GROW_DIRECTION_BEGIN if der else Control.GROW_DIRECTION_END
	c.grow_vertical = Control.GROW_DIRECTION_BEGIN if abajo else Control.GROW_DIRECTION_END
	c.offset_left = - m if der else m
	c.offset_right = c.offset_left
	c.offset_top = - m if abajo else m
	c.offset_bottom = c.offset_top
	padre.add_child(c)



static func _boton_falso(icono: String, col: Color, señalado: bool,
		tam: Vector2 = Vector2(75, 69)) -> Control:
	var p: Panel = Panel.new()
	p.custom_minimum_size = tam
	p.size = tam
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = col
	sb.border_color = col.darkened(0.55)
	sb.set_border_width_all(1)
	sb.border_width_bottom = CareerTheme.SINK
	sb.set_corner_radius_all(CareerTheme.RADIUS)
	if señalado:

		sb.shadow_color = CareerTheme.TEXT
		sb.shadow_size = 4
	p.add_theme_stylebox_override("panel", sb)
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(icono, CareerTheme.TEXT)
	ic.custom_minimum_size = Vector2(1, 1)
	ic.anchor_left = 0.2
	ic.anchor_right = 0.8
	ic.anchor_top = 0.15
	ic.anchor_bottom = 0.75
	p.add_child(ic)
	return p


static func _aire(box: Container, alto: float) -> void:
	var c: Control = Control.new()
	c.custom_minimum_size = Vector2(0, alto)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(c)



static func _sin_raton(n: Node) -> void:
	for c in n.get_children():
		var ct: Control = c as Control
		if ct != null:
			ct.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_sin_raton(c)











class _Rejilla extends Container:
	var celdas: Array[Control] = []
	var pie: Control = null
	var encima: Control = null

	func _get_minimum_size() -> Vector2:
		return Vector2(8.0 * 48.0 + 7.0 * LogrosGoles.HUECO, 4.0 * 33.0 + 3.0 * LogrosGoles.HUECO)

	func _notification(what: int) -> void:
		if what != NOTIFICATION_SORT_CHILDREN:
			return
		var g: float = LogrosGoles.HUECO
		var pie_h: float = 0.0
		if pie != null:
			pie_h = pie.get_combined_minimum_size().y + 29.0
		var por_ancho: float =(size.x - 7.0 * g) / 8.0
		var por_alto: float =(size.y - pie_h - 3.0 * g) / 4.0 * LogrosGoles.ASPECTO
		var cw: float = floorf(maxf(minf(por_ancho, por_alto), 8.0))
		var ch: float = floorf(cw / LogrosGoles.ASPECTO)
		for i in celdas.size():
			var c: Control = celdas[i]
			if is_instance_valid(c):
				fit_child_in_rect(c, Rect2((i % 8) *(cw + g),(i / 8) *(ch + g), cw, ch))
		var alto_rej: float = 4.0 * ch + 3.0 * g
		var ancho_rej: float = 8.0 * cw + 7.0 * g
		if pie != null:
			fit_child_in_rect(pie, Rect2(0.0, alto_rej + 29.0, ancho_rej, pie.get_combined_minimum_size().y))
		if encima != null:
			var m: Vector2 = encima.get_combined_minimum_size()
			var w: float = minf(maxf(m.x, 800.0), ancho_rej)
			fit_child_in_rect(encima, Rect2((ancho_rej - w) * 0.5, maxf((alto_rej - m.y) * 0.5, 0.0), w, m.y))



class _Hueco extends Control:
	func _ready() -> void:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		set_meta("goles_hueco", true)
		var ic: MenuIcon = MenuIcon.new()
		ic.setup("gol", CareerTheme.SURFACE_HI)
		ic.custom_minimum_size = Vector2(1, 1)
		ic.anchor_left = 0.5
		ic.anchor_right = 0.5
		ic.anchor_top = 0.5
		ic.anchor_bottom = 0.5
		ic.offset_left = -20.0
		ic.offset_right = 20.0
		ic.offset_top = -20.0
		ic.offset_bottom = 20.0
		add_child(ic)
		resized.connect(queue_redraw)

	func _draw() -> void:
		var r: Rect2 = Rect2(Vector2(1.5, 1.5), size - Vector2(3.0, 3.0))
		var col: Color = CareerTheme.SURFACE_HI
		var esquinas: Array[Vector2] = [r.position, Vector2(r.end.x, r.position.y), r.end,
			Vector2(r.position.x, r.end.y)]
		for i in 4:
			draw_dashed_line(esquinas[i], esquinas[(i + 1) % 4], col, 3.0, 10.0)



class _Disco extends Control:
	func _ready() -> void:
		mouse_filter = Control.MOUSE_FILTER_IGNORE

	func _draw() -> void:
		var c: Vector2 = size * 0.5
		var r: float = minf(size.x, size.y) * 0.5
		draw_circle(c, r - 2.0, Color(CareerTheme.NAV_YO.darkened(0.28), 0.9))
		draw_arc(c, r - 2.0, 0.0, TAU, 48, CareerTheme.TEXT, 4.0, true)




class _DibujoRepe extends Control:
	func _ready() -> void:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		resized.connect(queue_redraw)

	func _draw() -> void:
		var cielo: float = floorf(size.y * 0.55)
		draw_rect(Rect2(Vector2.ZERO, Vector2(size.x, cielo)), CareerTheme.PITCH_SKY_A)
		var franja: float = 26.0
		var y: float = cielo
		var k: int = 0
		while y < size.y:
			draw_rect(Rect2(0.0, y, size.x, franja),
				CareerTheme.PITCH_GRASS_A if k % 2 == 0 else CareerTheme.PITCH_GRASS_B)
			y += franja
			k += 1
		draw_rect(Rect2(0.0, 0.0, size.x, 96.0), Color(CareerTheme.BG_DEEP, 0.84))
