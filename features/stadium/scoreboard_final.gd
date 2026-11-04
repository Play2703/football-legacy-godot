class_name ScoreboardFinal
extends SubViewport
































const W: int = 960
const H: int = 260
const FRANJA_H: float = 48.0
const MARGEN: float = 14.0
const ESCUDO: float = 52.0
const FILA_H: float = 60.0

const GOLES_W: float = 140.0
const T_GOLES: int = 56


const T_CLUB: Array[int] = [40, 32, 24, 16]
const T_GOLEADOR: Array[int] = [24, 16]
const T_FRANJA: int = 24
const T_TORNEO: int = 16


const BLANCO: Color = Color(0.96, 0.95, 0.93)


var _capas: Array[Array] = []
var _tw: Tween

var _redibujos: int = 0


var cuerpo_goleadores: int = 0
var textos_goleadores: Array[PackedStringArray] = [PackedStringArray(), PackedStringArray()]


func _init() -> void:
	size = Vector2i(W, H)
	disable_3d = true
	gui_disable_input = true
	transparent_bg = false
	render_target_update_mode = SubViewport.UPDATE_ONCE


	process_mode = Node.PROCESS_MODE_ALWAYS
	set_process(false)


func _notification(what: int) -> void:


	if what == NOTIFICATION_ENTER_TREE and not _capas.is_empty():
		_redibuja()








func _redibuja() -> void:
	_redibujos = 2
	render_target_update_mode = SubViewport.UPDATE_ALWAYS
	set_process(true)


func _process(_delta: float) -> void:


	if _tw != null and _tw.is_valid() and _tw.is_running():
		return
	_redibujos -= 1
	if _redibujos <= 0:
		render_target_update_mode = SubViewport.UPDATE_ONCE
		set_process(false)











func pinta(d: Dictionary) -> void:
	for c in get_children():
		remove_child(c)
		c.queue_free()
	_capas.clear()
	textos_goleadores = [PackedStringArray(), PackedStringArray()]
	var bg: Color = d.get("bg", Color("0d1118")) as Color
	var ink: Color = d.get("ink", Color("ffd54a")) as Color
	var manual: bool = bool(d.get("manual", false))
	var claro: Color = ink if manual else BLANCO
	var fx_v: Variant = d.get("fx", {})
	var fx: Dictionary = fx_v if fx_v is Dictionary else {}
	var acc: Color = Competitions.accent_of(fx)


	var acc_txt: Color = ink if manual else CareerTheme.text_on_dark(acc)

	var fondo: ColorRect = ColorRect.new()
	fondo.color = bg
	fondo.size = Vector2(W, H)
	add_child(fondo)


	var franja: Array = []
	var velo: ColorRect = ColorRect.new()
	velo.color = Color(ink, 0.08) if manual else Color(acc.r, acc.g, acc.b, 0.22)
	velo.size = Vector2(W, FRANJA_H)
	add_child(velo)
	franja.append(velo)
	var logo: CompLogo = CompLogo.new()
	logo.custom_minimum_size = Vector2(40, 40)
	add_child(logo)
	logo.setup(Competitions.logo_type_of(fx), acc_txt)

	var logo_w: float = 120.0 if logo.is_logo() else 40.0
	logo.position = Vector2(MARGEN,(FRANJA_H - 40.0) * 0.5)
	logo.size = Vector2(logo_w, 40.0)
	franja.append(logo)

	var titular: String = I18n.t("FINAL DEL PARTIDO")
	var tit_w: float = ceilf(_ancho(titular, T_FRANJA))
	franja.append(_rotulo(titular, ink, T_FRANJA, Vector2(W - MARGEN - tit_w, 0.0),
		Vector2(tit_w, FRANJA_H), HORIZONTAL_ALIGNMENT_RIGHT))
	var torneo: String = CareerTheme.caps(I18n.t(Competitions.name_of(fx)))
	var ronda: String = MatchStrip.round_display(Competitions.round_of(fx))
	if not ronda.is_empty():
		torneo = "%s · %s" % [torneo, ronda]
	var tor_x: float = MARGEN + logo_w + 12.0

	franja.append(_rotulo(torneo, acc_txt, T_TORNEO, Vector2(tor_x, 0.0),
		Vector2(maxf(W - MARGEN - tit_w - 16.0 - tor_x, 0.0), FRANJA_H),
		HORIZONTAL_ALIGNMENT_LEFT))
	_capas.append(franja)



	var clubes: Array = d.get("clubes", [{}, {}]) as Array
	var goles: Array = d.get("goles", [0, 0]) as Array
	var listas: Array = d.get("goleadores", [[], []]) as Array
	var nota: String = String(d.get("nota", ""))
	var x0: float = MARGEN + ESCUDO + 16.0
	var ancho: float = W - x0 - MARGEN
	var grupos: Array = [goleadores(listas[0] as Array if listas.size() > 0 else []),
		goleadores(listas[1] as Array if listas.size() > 1 else [])]
	var nota_h: float = 28.0 if not nota.is_empty() else 0.0
	var tam: int = T_GOLEADOR[T_GOLEADOR.size() - 1]
	var lineas: Array[int] = [0, 0]
	for t in T_GOLEADOR:
		lineas = [_lineas(grupos[0], t, ancho), _lineas(grupos[1], t, ancho)]
		tam = t
		if FRANJA_H + 2.0 * FILA_H + float(lineas[0] + lineas[1]) * _alto_linea(t) \
				+ nota_h <= H - 8.0:
			break
	cuerpo_goleadores = tam




	var topes: Array[int] = [-1, -1]
	var cabe: int = maxi(floori((H - 8.0 - FRANJA_H - 2.0 * FILA_H - nota_h)
		/ _alto_linea(tam)), 0)
	if lineas[0] + lineas[1] > cabe:
		var t_arriba: int = mini(lineas[0], cabe - cabe / 2)
		var t_abajo: int = mini(lineas[1], cabe - t_arriba)
		t_arriba = mini(lineas[0], cabe - t_abajo)
		topes = [t_arriba, t_abajo]
		lineas = [t_arriba, t_abajo]
	var usado: float = FRANJA_H + 2.0 * FILA_H \
			+ float(lineas[0] + lineas[1]) * _alto_linea(tam) + nota_h


	var aire: float = maxf(H - usado, 0.0) / 3.0
	var y: float = FRANJA_H + aire
	for lado in 2:
		var capa: Array = []
		var club: Dictionary = clubes[lado] as Dictionary if lado < clubes.size() else {}
		var escudo: CrestView = CrestView.new()
		escudo.position = Vector2(MARGEN, y +(FILA_H - ESCUDO) * 0.5)
		escudo.size = Vector2(ESCUDO, ESCUDO)
		escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(escudo)
		escudo.set_team(club)
		capa.append(escudo)
		var nombre: String = CareerTheme.caps(Competitions.demarca(String(club.get("name",
			club.get("abbrev", "")))))
		var nom_w: float = ancho - GOLES_W - 12.0
		var t_club: int = _cabe(nombre, T_CLUB, nom_w)
		capa.append(_rotulo(nombre, claro, t_club, Vector2(x0, y), Vector2(nom_w, FILA_H),
			HORIZONTAL_ALIGNMENT_LEFT))
		var n: int = int(goles[lado]) if lado < goles.size() else 0
		capa.append(_rotulo(str(n), ink, T_GOLES, Vector2(W - MARGEN - GOLES_W, y),
			Vector2(GOLES_W, FILA_H), HORIZONTAL_ALIGNMENT_RIGHT))
		y += FILA_H
		_capas.append(capa)
		if not (grupos[lado] as Array).is_empty() and topes[lado] != 0:
			var fila_g: Array = _pinta_goleadores(grupos[lado], tam, x0, y, ancho, claro,
				ink, lado, topes[lado])
			_capas.append(fila_g)
			y += float(lineas[lado]) * _alto_linea(tam)
		if lado == 0:


			var medio: float = y + aire * 0.5
			if not nota.is_empty():
				var nl: Label = _rotulo(nota, ink, T_TORNEO, Vector2(0.0, medio - 2.0),
					Vector2(W, nota_h), HORIZONTAL_ALIGNMENT_CENTER)
				_capas.append([nl])
				y += nota_h
			else:
				var raya: ColorRect = ColorRect.new()
				raya.color = Color(claro, 0.14)
				raya.position = Vector2(MARGEN, medio)
				raya.size = Vector2(W - MARGEN * 2.0, 2.0)
				add_child(raya)
				_capas.append([raya])
			y += aire
	_redibuja()






func enciende(retraso: float) -> void:
	if _tw != null:
		_tw.kill()
	if Settings.reduce_motion or _capas.is_empty():
		return
	for capa in _capas:
		for pieza in capa:
			var ci: CanvasItem = pieza as CanvasItem
			ci.modulate.a = 0.0
	render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_tw = create_tween()
	_tw.set_parallel(true)
	_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_tw.set_ignore_time_scale(true)
	for i in _capas.size():
		for pieza in _capas[i]:
			_tw.tween_property(pieza, "modulate:a", 1.0, 0.06).set_delay(retraso + 0.11 * i)
	_tw.chain().tween_callback(_redibuja)




func asienta() -> void:
	if _tw != null:
		_tw.kill()
	for capa in _capas:
		for pieza in capa:
			if is_instance_valid(pieza):
				var ci: CanvasItem = pieza as CanvasItem
				ci.modulate.a = 1.0
	_redibuja()







static func goleadores(lista: Array) -> Array:
	var out: Array = []
	var por_nombre: Dictionary = {}
	for g in lista:
		var gol: Dictionary = g as Dictionary
		var entero: String = CareerTheme.caps(String(gol.get("name", "")).strip_edges())
		if entero.is_empty():
			continue
		if not por_nombre.has(entero):
			por_nombre[entero] = out.size()
			out.append({"nombre": apellido(entero), "mins": PackedStringArray()})
		var m: String = minuto(gol)
		if not m.is_empty():



			var item: Dictionary = out[int(por_nombre[entero])]
			var mins: PackedStringArray = item["mins"]
			mins.append(m)
			item["mins"] = mins
	return out



static func apellido(nombre: String) -> String:
	var partes: PackedStringArray = nombre.strip_edges().split(" ", false)
	if partes.is_empty():
		return ""
	return CareerTheme.caps(partes[partes.size() - 1])



static func minuto(gol: Dictionary) -> String:
	var m: int = int(gol.get("min", -1))
	if m < 0:
		return ""
	var extra: int = int(gol.get("extra", 0))
	return "%d+%d'" % [m, extra] if extra > 0 else "%d'" % m








func _pinta_goleadores(grupo: Array, tam: int, x0: float, y0: float, ancho: float,
		claro: Color, ink: Color, lado: int, max_lineas: int = -1) -> Array:
	var piezas: Array = []
	var lh: float = _alto_linea(tam)
	var x: float = x0
	var y: float = y0
	var hueco: float = float(tam)
	var linea: int = 1
	var renglon: PackedStringArray = []


	var puestos: Array[Dictionary] = []
	var i: int = 0
	while i < grupo.size():
		var item: Dictionary = grupo[i] as Dictionary
		var nom: String = String(item["nombre"])
		var mins: String = " ".join(item["mins"] as PackedStringArray)
		var nom_w: float = ceilf(_ancho(nom, tam))
		var min_w: float = ceilf(_ancho(mins, tam)) if not mins.is_empty() else 0.0
		var pieza_w: float = nom_w +(hueco * 0.5 + min_w if min_w > 0.0 else 0.0)
		if x > x0 and x + pieza_w > x0 + ancho:
			if max_lineas >= 0 and linea >= max_lineas:
				break
			textos_goleadores[lado].append("   ".join(renglon))
			renglon = PackedStringArray()
			puestos.clear()
			x = x0
			y += lh
			linea += 1
		var suyos: Array = [_rotulo(nom, claro, tam, Vector2(x, y), Vector2(nom_w, lh),
			HORIZONTAL_ALIGNMENT_LEFT)]
		if min_w > 0.0:
			suyos.append(_rotulo(mins, ink, tam, Vector2(x + nom_w + hueco * 0.5, y),
				Vector2(min_w, lh), HORIZONTAL_ALIGNMENT_LEFT))
		piezas.append_array(suyos)
		puestos.append({"x": x, "piezas": suyos})
		renglon.append(("%s %s" % [nom, mins]).strip_edges())
		x += pieza_w + hueco * 1.5
		i += 1
	var resto: int = grupo.size() - i
	if resto > 0:
		var mas: String = "+%d" % resto
		while x + _ancho(mas, tam) > x0 + ancho and not puestos.is_empty():
			var ultimo: Dictionary = puestos.pop_back()
			for p in ultimo["piezas"] as Array:
				piezas.erase(p)
				remove_child(p)
				(p as Node).queue_free()
			renglon.remove_at(renglon.size() - 1)
			x = float(ultimo["x"])
			resto += 1
			mas = "+%d" % resto
		piezas.append(_rotulo(mas, ink, tam, Vector2(x, y), Vector2(ceilf(_ancho(mas, tam)), lh),
			HORIZONTAL_ALIGNMENT_LEFT))
		renglon.append(mas)
	if not renglon.is_empty():
		textos_goleadores[lado].append("   ".join(renglon))
	return piezas




func _lineas(grupo: Array, tam: int, ancho: float) -> int:
	if grupo.is_empty():
		return 0
	var n: int = 1
	var x: float = 0.0
	var hueco: float = float(tam)
	for it in grupo:
		var item: Dictionary = it as Dictionary
		var mins: String = " ".join(item["mins"] as PackedStringArray)
		var min_w: float = ceilf(_ancho(mins, tam)) if not mins.is_empty() else 0.0
		var pieza_w: float = ceilf(_ancho(String(item["nombre"]), tam)) \
				+(hueco * 0.5 + min_w if min_w > 0.0 else 0.0)
		if x > 0.0 and x + pieza_w > ancho:
			n += 1
			x = 0.0
		x += pieza_w + hueco * 1.5
	return n




static func _alto_linea(tam: int) -> float:
	return float(tam) + ceilf(float(tam) / 3.0)




func _cabe(txt: String, cuerpos: Array[int], ancho: float) -> int:
	for t in cuerpos:
		if _ancho(txt, t) <= ancho:
			return t
	return cuerpos[cuerpos.size() - 1]


static func _fuente() -> Font:
	var tema: Theme = ThemeDB.get_project_theme()
	if tema != null and tema.default_font != null:
		return tema.default_font
	return ThemeDB.fallback_font


static func _ancho(txt: String, tam: int) -> float:
	return _fuente().get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x


func _rotulo(txt: String, color: Color, tam: int, pos: Vector2, caja: Vector2,
		align: HorizontalAlignment) -> Label:
	var l: Label = Label.new()
	l.text = txt






	var ajuste: LabelSettings = LabelSettings.new()
	ajuste.font_size = tam
	ajuste.font_color = color
	l.label_settings = ajuste
	l.horizontal_alignment = align
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.position = pos
	l.size = caja
	add_child(l)
	return l
