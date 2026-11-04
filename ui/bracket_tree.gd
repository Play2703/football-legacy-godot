class_name BracketTree
extends Control






















const ROW_H: float = 32.0
const ROW_GAP: float = 3.0
const TIE_GAP: float = 16.0
const HEAD_H: float = 34.0
const COL_GAP: float = 22.0
const NARROW: float = 170.0
const NOMBRE_SUELO: int = 11








const ESPEJO_COL_MIN: float = 150.0



const COMO_PX: float = 18.0






var grande: bool = false
const ROW_H_GRANDE: float = 40.0
const HEAD_H_GRANDE: float = 40.0
const LETRA_GRANDE: int = 24
const ESCUDO_GRANDE: float = 32.0



const GLOBAL_H: float = 18.0






const RONDA_CORTA: Dictionary = {"Semifinal": "SEMIS"}
const GLOBAL_H_GRANDE: float = 32.0

const FASES_DE_TABLA: Array[String] = ["Fase de grupos", "Fase de liga"]


const RONDAS_ANCHAS: Array[String] = ["Previa", "Primera ronda", "Segunda ronda",
	"Tercera ronda", "Cuarta ronda", "Quinta ronda", "Sexta ronda", "Séptima ronda",
	"Octava ronda", "Treintaidosavos", "Dieciseisavos"]
const RONDAS_MAX: int = 4

var _accent: Color = Color.WHITE
var _you_key: String = ""


var _you_team: Dictionary = {}



var _rounds: Array = []

var _links: Array = []


var _links_huecos: Array = []














var _corchetes: Array = []
var _corchetes_huecos: Array = []
const CORCHETE: float = 6.0
const CODO_AIRE: float = 8.0








const LINEA_GRANDE: float = 4.0
const PARALELO_AIRE: float = 6.0
const COL_GAP_GRANDE: float = CORCHETE + LINEA_GRANDE + PARALELO_AIRE + CODO_AIRE








const ESCALON_TOL: float = 0.5




















const FINAL_AIRE: float = 16.0
const FINAL_BARRA_AIRE: float = 16.0
const FINAL_CAJA_AIRE: float = 6.0



const FINAL_GAP: float = CORCHETE + LINEA_GRANDE * 0.5 + FINAL_BARRA_AIRE + LINEA_GRANDE \
		+ FINAL_CAJA_AIRE + 2.0


func setup(bracket: Array, names: Array, accent: Color, you_key: String,
		you_team: Dictionary = {}) -> void:
	_accent = accent
	_you_key = you_key
	_you_team = you_team
	for c in get_children():
		c.queue_free()
	_rounds.clear()






	var br: Array = []
	var nm: Array = []
	for ri in maxi(bracket.size(), names.size()):
		var ties_ri: Array = bracket[ri] if ri < bracket.size() else []
		if ri < names.size() and String(names[ri]) in FASES_DE_TABLA and ties_ri.is_empty():
			continue
		br.append(ties_ri)
		if ri < names.size():
			nm.append(names[ri])








	while br.size() > RONDAS_MAX:
		var nombre0: String = String(nm[0]) if not nm.is_empty() else ""
		if (br[0] as Array).size() <= 8 and not nombre0 in RONDAS_ANCHAS:
			break
		br.pop_front()
		if not nm.is_empty():
			nm.pop_front()
	bracket = br
	names = nm
	var total: int = maxi(bracket.size(), names.size())
	for ri in total:
		var ties: Array = bracket[ri] if ri < bracket.size() else []
		var entry: Dictionary = {"ties": ties, "nodes": [], "head": null,
			"pending": null, "head2": null, "pending2": null, "global": null, "global2": null}
		var rotulo: String = String(names[ri]) if ri < names.size() \
				else I18n.tf("RONDA {0}", [ri + 1])
		entry["head"] = _make_head(rotulo)

		entry["head2"] = _make_head(rotulo)
		if RONDA_CORTA.has(rotulo):
			for h in [entry["head"], entry["head2"]]:
				(h as Label).set_meta("rotulo_corto",
					CareerTheme.caps(I18n.t(String(RONDA_CORTA[rotulo]))))



		var doble_vuelta: bool = false
		for tie in ties:
			doble_vuelta = doble_vuelta or (tie is Dictionary and (tie as Dictionary).has("leg2"))
		if grande and doble_vuelta:
			entry["global"] = _make_global()
			entry["global2"] = _make_global()
		for tie in ties:
			var t: Dictionary = tie
			var winner: String = String(t.get("winner", ""))




			var marcador: String = String(t.get("score", ""))
			if marcador.is_empty():
				marcador = String(t.get("leg1", ""))
			var goals: Array = _split_score(marcador)
			var como: String = _como_paso(t)
			entry["nodes"].append([
				_make_side(String(t.get("a", "")), winner, String(goals[0]), como),
				_make_side(String(t.get("b", "")), winner, String(goals[1]), como),
			])
		if ties.is_empty():
			entry["pending"] = _make_pending()
			entry["pending2"] = _make_pending()







			if grande and ri == 0 and total > 1:
				var huecos0: Array = []
				for k in 1<<(total - 1):
					huecos0.append([_make_hueco(), _make_hueco()])
				entry["huecos"] = huecos0
			if grande and ri > 0:
				var antes: Dictionary = _rounds[ri - 1]
				var n_antes: int =(antes["ties"] as Array).size() if not (antes["ties"] as Array).is_empty() \
						else (antes.get("huecos", []) as Array).size()
				if n_antes > 0:
					var huecos: Array = []
					for k in maxi(1, ceili(float(n_antes) / 2.0)):
						huecos.append([_make_hueco(), _make_hueco()])
					entry["huecos"] = huecos
		_rounds.append(entry)
	_siglas_del_cuadro()
	_relayout()







func _siglas_del_cuadro() -> void:
	var equipos: Array = []
	var cajas_de: Dictionary = {}
	for entry in _rounds:
		for par in entry["nodes"]:
			for c in par:
				var box: Control = c
				var team: Dictionary = box.get_meta("sigla_team", {})
				if team.is_empty() or String(box.get_meta("abbrev")).is_empty():
					continue
				var id: String = _sigla_id(team)
				if not cajas_de.has(id):
					cajas_de[id] = []
					equipos.append(team)
				(cajas_de[id] as Array).append(box)
	var siglas: Array = siglas_unicas(equipos)
	for i in equipos.size():
		for box in cajas_de[_sigla_id(equipos[i])]:
			(box as Control).set_meta("abbrev", String(siglas[i]))


static func _sigla_id(team: Dictionary) -> String:
	return String(team.get("id", team.get("name", "")))














static func siglas_unicas(equipos: Array) -> Array:
	var orden: Array = range(equipos.size())
	orden.sort_custom(func(a: int, b: int) -> bool:
		var ia: String = _sigla_id(equipos[a] if equipos[a] is Dictionary else {})
		var ib: String = _sigla_id(equipos[b] if equipos[b] is Dictionary else {})
		return ia < ib if ia != ib else a < b)
	var out: Array = []
	out.resize(equipos.size())
	var usadas: Dictionary = {}
	for i in orden:
		var team: Dictionary = equipos[i] if equipos[i] is Dictionary else {}
		var base: String = sigla_legible(team)
		var sigla: String = base
		if usadas.has(sigla):
			var letras: String = letras_del_nombre(team)
			var largo: int = maxi(base.length(), 2)
			var pie: String = base.left(largo - 1)
			var cands: Array = []
			for k in range(1, letras.length()):
				cands.append(pie + letras[k])
			for j in range(1, letras.length()):
				for k in range(j + 1, letras.length()):
					cands.append(letras.left(1) + letras[j] + letras[k])
			for cand in cands:
				if not usadas.has(String(cand)) and _sigla_vale(String(cand), team):
					sigla = String(cand)
					break
		usadas[sigla] = true
		out[i] = sigla
	return out









static func sigla_legible(team: Dictionary) -> String:
	var base: String = Competitions.demarca(String(team.get("abbrev", ""))).to_upper()
	if _sigla_vale(base, team):
		return base
	var letras: String = letras_del_nombre(team)
	if letras.length() >= 3:
		return letras.left(3)
	if not letras.is_empty():
		return letras
	var solo: String = ""
	for ch in base:
		if ch >= "A" and ch <= "Z":
			solo += ch
	return solo



static func _sigla_vale(s: String, team: Dictionary) -> bool:
	if s.length() != 3:
		return false
	for ch in s:
		if ch < "A" or ch > "Z":
			return false
	if bool(team.get("is_nation", false)):
		return true
	var letras: String = letras_del_nombre(team)
	for ch in s:
		if not letras.contains(ch):
			return false
	return true




static func letras_del_nombre(team: Dictionary) -> String:
	var nombre: String = Competitions.demarca(String(team.get("name", team.get("abbrev", ""))))
	var out: String = ""
	for ch in nombre.to_upper():
		var c: String = String(SIN_TILDE.get(ch, ch))
		if c >= "A" and c <= "Z" and c.length() == 1:
			out += c
	return out



const SIN_TILDE: Dictionary = {
	"Á": "A", "À": "A", "Â": "A", "Ä": "A", "Ã": "A", "Å": "A",
	"É": "E", "È": "E", "Ê": "E", "Ë": "E",
	"Í": "I", "Ì": "I", "Î": "I", "Ï": "I", "İ": "I",
	"Ó": "O", "Ò": "O", "Ô": "O", "Ö": "O", "Õ": "O", "Ø": "O",
	"Ú": "U", "Ù": "U", "Û": "U", "Ü": "U",
	"Ñ": "N", "Ç": "C", "Ş": "S", "Ğ": "G", "Ł": "L", "Ž": "Z", "Š": "S", "Č": "C", "Ć": "C",
}


func _ready() -> void:
	resized.connect(_relayout)


func _make_pending() -> Label:
	var p: Label = CareerUi.plain(_letra(), CareerTheme.TEXT_DIM)
	p.text = I18n.t("Por definir.")
	p.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	p.clip_text = true
	add_child(p)
	return p




func _make_hueco() -> PanelContainer:
	var box: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.GHOST_BG
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(1)
	sb.set_corner_radius_all(4)
	box.add_theme_stylebox_override("panel", sb)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.set_meta("bracket_hueco", true)
	add_child(box)
	return box







func _como_paso(t: Dictionary) -> String:
	if String(t.get("winner", "")).is_empty():
		return ""
	if not String(t.get("pens", "")).is_empty():
		return "penal"
	if bool(t.get("por_puesto", false)):
		return "palmares"
	return ""















static func liguilla_partes(bracket: Array) -> Dictionary:
	var marcado: Array = []
	for k in bracket.size():
		var ronda: Array = []
		for t in bracket[k]:
			var d: Dictionary =(t as Dictionary).duplicate()
			var g: Array = Liguilla.goles(String(d.get("score", "")))
			if k < Liguilla.REGLA.size() and Liguilla.REGLA[k] == "sembrado" \
					and g.size() == 2 and int(g[0]) == int(g[1]) \
					and not String(d.get("winner", "")).is_empty():
				d["por_puesto"] = true
			ronda.append(d)
		marcado.append(ronda)
	var playin: Array = marcado.slice(0, Liguilla.CUARTOS)
	var jugado: bool = false
	for r in playin:
		jugado = jugado or not (r as Array).is_empty()
	return {
		"playin": playin if jugado else [],
		"playin_names": Array(Liguilla.RONDAS).slice(0, Liguilla.CUARTOS) if jugado else [],
		"cuadro": marcado.slice(Liguilla.CUARTOS),
		"cuadro_names": Array(Liguilla.RONDAS).slice(Liguilla.CUARTOS),
	}







static func liguilla_proyeccion(orden: Array) -> Array:
	return Liguilla.cuadro_nuevo(orden.slice(0, Liguilla.CLUBES_MIN))



func _split_score(score: String) -> Array:
	var parts: PackedStringArray = score.split("-")
	if parts.size() != 2:
		return ["", ""]
	return [parts[0].strip_edges(), parts[1].strip_edges()]


func _make_head(text: String) -> Label:


	var l: Label = CareerUi.plain(_letra(), CareerTheme.text_on_dark(_accent))
	l.text = CareerTheme.caps(I18n.t(text))
	l.set_meta("rotulo_entero", l.text)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS

	l.set_meta("bracket_head", true)
	add_child(l)
	return l




func _make_global() -> Label:
	var l: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM)
	l.name = "Global"
	l.text = CareerTheme.caps(I18n.t("GLOBAL", "cuadro"))
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	l.set_meta("torn_global", true)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(l)
	return l






func _make_side(key: String, winner: String, goals: String,
		como: String = "") -> PanelContainer:
	var you: bool = key == _you_key or key == GameState.player_team_id
	var club_id: String = GameState.player_team_id if key == _you_key else key
	var team: Dictionary
	if key == _you_key and not _you_team.is_empty():
		team = _you_team
	else:
		team = Teams.by_id(club_id)

		if team.is_empty():
			team = Nations.as_team(key)
	var decided: bool = not winner.is_empty()
	var won: bool = decided and winner == key





	var color: Color = CareerTheme.TEXT
	if decided and not won:
		color = CareerTheme.TEXT_DIM
	var box: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(_accent.r, _accent.g, _accent.b, 0.28) if won \
			else Color(1, 1, 1, 0.04)
	sb.corner_radius_top_left = 4
	sb.corner_radius_top_right = 4
	sb.corner_radius_bottom_left = 4
	sb.corner_radius_bottom_right = 4
	sb.content_margin_left = 6
	sb.content_margin_right = 6
	if you:
		sb.set_border_width_all(2)
		sb.border_color = _accent
	box.add_theme_stylebox_override("panel", sb)
	add_child(box)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 6)
	box.add_child(row)
	if not team.is_empty():
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(ESCUDO_GRANDE, ESCUDO_GRANDE) if grande \
				else Vector2(22, 22)
		crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		crest.set_team(team)
		crest.modulate = Color(1, 1, 1, 1) if not decided or won else Color(1, 1, 1, 0.35)
		row.add_child(crest)
	var name_l: Label = CareerUi.plain(_letra(), color)
	name_l.text = String(team.get("name", I18n.t("Por definir")))
	name_l.clip_text = true
	name_l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(name_l)
	box.set_meta("name_label", name_l)
	box.set_meta("abbrev", String(team.get("abbrev", "")))

	box.set_meta("sigla_team", team)
	box.set_meta("full", name_l.text)




	if won and not como.is_empty():
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(COMO_PX, COMO_PX)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(como, color)
		row.add_child(ic)
	if not goals.is_empty():
		var g: Label = CareerUi.plain(_letra(), color)
		g.text = goals
		g.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		g.custom_minimum_size = Vector2(32.0 if grande else 20.0, 0)
		g.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(g)
	return box












func _relayout() -> void:
	_links.clear()
	_links_huecos.clear()
	_corchetes.clear()
	_corchetes_huecos.clear()
	if _rounds.is_empty():
		return
	var rondas: int = _rounds.size()
	var first_n: int = int((_rounds[0] as Dictionary)["ties"].size())



	if first_n == 0:
		first_n =((_rounds[0] as Dictionary).get("huecos", []) as Array).size()
	var espejo: bool = _en_espejo(rondas, first_n)


	var cols: int = 2 *(rondas - 1) + 1 if espejo else rondas
	var gap: float = _col_gap()

	var extra: float = _final_extra(espejo)
	var col_w: float = maxf((size.x - gap * float(cols - 1) - 2.0 * extra) / float(cols), 90.0)
	var paso: float = col_w + gap
	var por_lado: int = ceili(float(first_n) / 2.0) if espejo else first_n



	var ordenes: Array = []
	var pos_prev: Dictionary = {}
	for ri in rondas:
		var o: Array = _order_by_source(_rounds[ri]["ties"],
			_rounds[ri - 1]["ties"] if ri > 0 else [], pos_prev)
		ordenes.append(o)
		pos_prev = {}
		for k in o.size():
			pos_prev[int(o[k])] = k

	if grande:
		ordenes = _orden_arbol(ordenes)
	var esc: Dictionary = _escalones(ordenes, espejo) if grande \
			else {"rondas": {}, "arriba": false, "abajo": false}
	var arriba: bool = bool(esc["arriba"])
	var ext: int =(1 if arriba else 0) +(1 if bool(esc["abajo"]) else 0)
	var head_h: float = HEAD_H_GRANDE if grande else HEAD_H


	var con_global: bool = false
	for e in _rounds:
		con_global = con_global or (e as Dictionary).get("global") != null


	var letra_fila: int = _letra_de_fila(col_w) if grande else LETRA_GRANDE
	var global_h: float = GLOBAL_H_GRANDE if letra_fila >= LETRA_GRANDE else GLOBAL_H
	if con_global:
		head_h += global_h



	head_h += _rotulos_en_dos(col_w, letra_fila if grande else _letra())
	var row_h: float = ROW_H_GRANDE if grande else ROW_H

	var minimo: float = head_h +(row_h * 2.0 + ROW_GAP + TIE_GAP) * float(maxi(por_lado, 1))



	minimo += float(ext) *(row_h + ROW_GAP) * 0.5
	if grande and ext == 0:
		var hay: float =(size.y - 6.0 - head_h) / float(maxi(por_lado, 1))
		row_h = maxf(row_h, floorf((hay - ROW_GAP - TIE_GAP) * 0.5))
	elif grande:
		var n: float = float(maxi(por_lado, 1))
		var libre: float = size.y - 6.0 - head_h - n *(ROW_GAP + TIE_GAP) - float(ext) * ROW_GAP * 0.5
		row_h = maxf(row_h, floorf(libre /(2.0 * n + float(ext) * 0.5)))
	var slot: float = row_h * 2.0 + ROW_GAP + TIE_GAP
	var span: float = slot * float(maxi(por_lado, 1))


	var y0: float = head_h +((row_h + ROW_GAP) * 0.5 if arriba else 0.0)
	var bottom: float = y0 + span


	var suelo: float = y0 + span +((row_h + ROW_GAP) * 0.5 if bool(esc["abajo"]) else 0.0)


	var prev_xy: Dictionary = {}


	var hueco_x: Vector2 = Vector2(INF, - INF)
	var pendiente: Label = null



	var por_columna: Dictionary = {}
	var prev_lados: Array = [[], []]
	for ri in rondas:
		var entry: Dictionary = _rounds[ri]
		var ties: Array = entry["ties"]
		var doble: bool = espejo and ri < rondas - 1
		var x_izq: float = _col_x(ri, paso, rondas - 1 if espejo else -1, extra)
		var x_der: float = _col_x(cols - 1 - ri, paso, rondas - 1 if espejo else -1, extra)
		var head: Label = entry["head"]
		head.position = Vector2(x_izq, 0.0)
		head.size = Vector2(col_w, head_h - 6.0 -(global_h if con_global else 0.0))
		var head2: Label = entry["head2"]
		head2.visible = doble
		head2.position = Vector2(x_der, 0.0)
		head2.size = head.size
		var glob: Label = entry.get("global")
		if glob != null:

			glob.position = Vector2(x_izq, head.size.y)
			glob.size = Vector2(col_w, global_h)
			_pon_letra(glob, letra_fila if grande else CareerTheme.T_CAP_TUMBADO)
			var glob2: Label = entry.get("global2")
			_pon_letra(glob2, letra_fila if grande else CareerTheme.T_CAP_TUMBADO)
			glob2.visible = doble
			glob2.position = Vector2(x_der, head.size.y)
			glob2.size = glob.size
		if grande:




			_pon_letra(head, letra_fila)
			_pon_letra(head2, letra_fila)
		var order: Array = ordenes[ri]
		var escalon: Dictionary =(esc["rondas"] as Dictionary).get(ri, {})

		var izq: int = ceili(float(order.size()) / 2.0) if doble else order.size()

		var clasico: Dictionary = _clasico(ri, order, izq, prev_xy, row_h, head_h, suelo) \
				if grande and ri > 0 and not ties.is_empty() else {}
		var xy: Dictionary = {}
		var lados: Array = [[], []]
		for k in order.size():
			var i: int = int(order[k])
			var derecha: bool = k >= izq
			var kk: int = k - izq if derecha else k
			var n_lado: int = order.size() - izq if derecha else izq
			var x: float = x_der if derecha else x_izq

			var y: float = y0 + span *(float(kk) + 0.5) / float(n_lado)

			y += float(escalon.get(i, 0)) *(row_h + ROW_GAP) * 0.5
			var pair: Array = entry["nodes"][i]
			var a: Control = pair[0]
			var b: Control = pair[1]
			a.position = Vector2(x, y - row_h - ROW_GAP * 0.5)
			a.size = Vector2(col_w, row_h)
			b.position = Vector2(x, y + ROW_GAP * 0.5)
			b.size = Vector2(col_w, row_h)
			var pegado: bool = false
			if clasico.has(i):


				var c: Array = clasico[i]
				a.position.y = float(c[0]) - row_h * 0.5
				b.position.y = float(c[1]) - row_h * 0.5
				y =(float(c[0]) + float(c[1])) * 0.5
				pegado = bool(c[2])
			xy[i] = Vector2(x, y)
			if grande:
				if not por_columna.has(x):
					por_columna[x] = []
				por_columna[x].append(a)
				por_columna[x].append(b)
			else:
				_fit_name(a, col_w)
				_fit_name(b, col_w)
			(lados[1 if derecha else 0] as Array).append(Vector2(x, y))
			bottom = maxf(bottom, maxf(a.position.y, b.position.y) + row_h)

			if grande and ri < rondas - 1:
				_corchetes.append(_corchete(x, col_w, a.position.y + row_h * 0.5,
					b.position.y + row_h * 0.5, -1.0 if derecha else 1.0))

			if ri > 0:
				var t: Dictionary = ties[i]
				for j in _source_indices(t, _rounds[ri - 1]["ties"]):
					if not prev_xy.has(int(j)):
						continue

					var w: String = String((_rounds[ri - 1]["ties"][int(j)] as Dictionary).get("winner", ""))
					var caja: Control = a if w == String(t.get("a", "")) else b
					_links.append(_codo(prev_xy[int(j)], x, col_w,
						caja.position.y + row_h * 0.5 if grande else y, pegado))
		var huecos: Array = entry.get("huecos", [])
		if ties.is_empty() and not huecos.is_empty():
			_coloca_huecos(huecos, doble, x_izq, x_der, col_w, row_h, y0, span, prev_lados,
				lados, ri < rondas - 1)
			(entry["pending"] as Label).visible = false
			(entry["pending2"] as Label).visible = false
		elif ties.is_empty():
			var p: Label = entry["pending"]
			p.position = Vector2(x_izq, y0 + span * 0.5 -(row_h * 0.5 if grande else 10.0))
			p.size = Vector2(col_w, row_h if grande else 22.0)
			var p2: Label = entry["pending2"]
			p2.visible = doble
			p2.position = Vector2(x_der, p.position.y)
			p2.size = p.size
			if grande:
				hueco_x.x = minf(hueco_x.x, x_izq)
				hueco_x.y = maxf(hueco_x.y,(x_der if doble else x_izq) + col_w)
				p.visible = pendiente == null
				p2.visible = false
				if pendiente == null:
					pendiente = p
		prev_xy = xy
		prev_lados = lados



	for cx in por_columna:
		var cajas: Array = por_columna[cx]
		var todas: bool = true
		for c in cajas:
			todas = todas and _cabe_entero(c as Control, col_w)
		for c in cajas:
			var box: Control = c
			var l: Label = box.get_meta("name_label")
			var ab: String = String(box.get_meta("abbrev"))
			var entero: bool = todas or ab.is_empty()
			l.text = String(box.get_meta("full")) if entero else ab
			box.set_meta("bracket_columna", cx)
			box.set_meta("bracket_forma", "nombre" if entero else "sigla")
	if pendiente != null:


		pendiente.text = CareerTheme.caps(I18n.t("Por definir"))
		pendiente.position.x = hueco_x.x
		pendiente.size.x = hueco_x.y - hueco_x.x
		_letra_que_cabe(pendiente, pendiente.size.x)
	custom_minimum_size = Vector2(0,(minimo if grande else bottom) + 6.0)
	queue_redraw()



func _letra() -> int:
	return LETRA_GRANDE if grande else 15




func _letra_que_cabe(l: Label, ancho: float) -> void:
	_pon_letra(l, LETRA_GRANDE if _cabe_a(l, ancho, LETRA_GRANDE) else CareerTheme.T_CAP_TUMBADO)







func _letra_de_fila(ancho: float) -> int:
	for corta in [false, true]:
		var cabe: bool = true
		for e in _rounds:
			var d: Dictionary = e
			for k in ["head", "head2"]:
				var h: Label = d.get(k) as Label
				if h == null:
					continue
				var entero: String = String(h.get_meta("rotulo_entero", h.text))
				h.text = String(h.get_meta("rotulo_corto", entero)) if corta else entero
			cabe = cabe and _cabe_a(d["head"], ancho, LETRA_GRANDE)
			var g: Label = d.get("global") as Label
			if g != null:
				cabe = cabe and _cabe_a(g, ancho, LETRA_GRANDE)
		if cabe:
			return LETRA_GRANDE
	for e in _rounds:
		for k in ["head", "head2"]:
			var h: Label =(e as Dictionary).get(k) as Label
			if h != null:
				h.text = String(h.get_meta("rotulo_entero", h.text))
	return CareerTheme.T_CAP_TUMBADO







func _rotulos_en_dos(ancho: float, tam: int) -> float:
	var partidos: Dictionary = {}
	for e in _rounds:
		var h: Label =(e as Dictionary).get("head") as Label
		if h != null and not _cabe_a(h, ancho, tam) and _cabe_en_dos(h, ancho, tam):
			partidos[e] = true
	for e in _rounds:
		for k in ["head", "head2"]:
			var h: Label =(e as Dictionary).get(k) as Label
			if h == null:
				continue
			h.autowrap_mode = TextServer.AUTOWRAP_WORD if partidos.has(e) else TextServer.AUTOWRAP_OFF


			if not h.has_meta("alin_nacida"):
				h.set_meta("alin_nacida", h.vertical_alignment)
			h.vertical_alignment = VERTICAL_ALIGNMENT_CENTER if not partidos.is_empty() \
					else int(h.get_meta("alin_nacida")) as VerticalAlignment
	if partidos.is_empty():
		return 0.0
	var f: Font =((_rounds[0] as Dictionary)["head"] as Label).get_theme_font("font")
	return f.get_height(tam) if f != null else float(tam)



func _cabe_en_dos(l: Label, ancho: float, tam: int) -> bool:
	var f: Font = l.get_theme_font("font")
	if f == null:
		return false
	var lineas: int = 1
	var linea: String = ""
	for palabra in l.text.split(" ", false):
		var prueba: String = palabra if linea.is_empty() else linea + " " + palabra
		if f.get_string_size(prueba, HORIZONTAL_ALIGNMENT_LEFT, -1.0, tam).x <= ancho:
			linea = prueba
		elif f.get_string_size(palabra, HORIZONTAL_ALIGNMENT_LEFT, -1.0, tam).x <= ancho:
			lineas += 1
			linea = palabra
		else:
			return false
	return lineas <= 2



func _cabe_a(l: Label, ancho: float, tam: int) -> bool:
	var f: Font = l.get_theme_font("font")
	return f == null or f.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
		tam).x <= ancho


func _pon_letra(l: Label, tam: int) -> void:
	l.add_theme_font_size_override("font_size", tam)

	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER




func _en_espejo(rondas: int, first_n: int) -> bool:
	if not UiKit.es_horizontal() or rondas < 3 or first_n < 2:
		return false
	var cols: int = 2 *(rondas - 1) + 1
	return (size.x - _col_gap() * float(cols - 1) - 2.0 * _final_extra(true)) / float(cols) \
			>= ESPEJO_COL_MIN




func _col_gap() -> float:
	return COL_GAP_GRANDE if grande else COL_GAP




func _final_extra(espejo: bool) -> float:
	return maxf(FINAL_GAP - _col_gap(), 0.0) if grande and espejo else 0.0




func _col_x(c: int, paso: float, final: int, extra: float) -> float:
	var x: float = float(c) * paso
	if final >= 0:
		x += extra *(float(c >= final) + float(c > final))
	return x




func grosor_linea() -> float:
	return LINEA_GRANDE if grande else 2.0













func _escalones(ordenes: Array, espejo: bool) -> Dictionary:
	var out: Dictionary = {"rondas": {}, "arriba": false, "abajo": false}
	var rondas: int = _rounds.size()
	for ri in range(rondas - 1):
		var ties: Array = _rounds[ri]["ties"]
		var sig: Array = _rounds[ri + 1]["ties"]
		if ties.is_empty() or ties.size() != sig.size():
			continue

		var sitio: Array = []
		for r in [ri, ri + 1]:
			var o: Array = ordenes[r]
			var doble: bool = espejo and r < rondas - 1
			var izq: int = ceili(float(o.size()) / 2.0) if doble else o.size()
			var d: Dictionary = {}
			for k in o.size():
				var derecha: bool = k >= izq
				d[int(o[k])] = [1 if derecha else 0, k - izq if derecha else k,
					o.size() - izq if derecha else izq]
			sitio.append(d)
		var signo: Dictionary = {}
		var vale: bool = true
		for i2 in sig.size():
			var t: Dictionary = sig[i2]
			var src: Array = _source_indices(t, ties)
			if src.size() != 1 or signo.has(int(src[0])):
				vale = false
				break
			var j: int = int(src[0])
			var w: String = String((ties[j] as Dictionary).get("winner", ""))
			var s_ri: Array = sitio[0][j]
			var s_sig: Array = sitio[1][i2]

			if s_ri[1] != s_sig[1] or s_ri[2] != s_sig[2] \
					or (s_ri[0] != s_sig[0] and ri + 1 < rondas - 1):
				vale = false
				break
			signo[j] = -1 if w == String(t.get("a", "")) else 1
		if not vale or signo.size() != ties.size():
			continue

		var por_lado: Array = [[], []]
		for k in (ordenes[ri] as Array).size():
			var i: int = int(ordenes[ri][k])
			(por_lado[int(sitio[0][i][0])] as Array).append(int(signo[i]))
		for lado in por_lado:
			var l: Array = lado
			for n in range(l.size() - 1):
				vale = vale and not (int(l[n]) > 0 and int(l[n + 1]) < 0)
		if not vale:
			continue
		out["rondas"][ri] = signo
		for lado in por_lado:
			var l: Array = lado
			if l.is_empty():
				continue
			out["arriba"] = bool(out["arriba"]) or int(l[0]) < 0
			out["abajo"] = bool(out["abajo"]) or int(l[l.size() - 1]) > 0
	return out









func _orden_arbol(ordenes: Array) -> Array:
	var out: Array = ordenes.duplicate()
	var r_top: int = -1
	for ri in _rounds.size():
		if not (_rounds[ri]["ties"] as Array).is_empty():
			r_top = ri
	for r in range(r_top - 1, -1, -1):
		var ties: Array = _rounds[r]["ties"]
		var sig: Array = _rounds[r + 1]["ties"]
		var pos: Dictionary = {}
		for k in (out[r] as Array).size():
			pos[int(out[r][k])] = k
		var nuevo: Array = []
		for i2 in out[r + 1]:
			var src: Array = _source_indices(sig[int(i2)], ties)
			src.sort_custom(func(p: int, q: int) -> bool: return int(pos.get(p, 0)) < int(pos.get(q, 0)))
			for j in src:
				if not nuevo.has(int(j)):
					nuevo.append(int(j))
		if nuevo.size() != ties.size():
			break
		out[r] = nuevo
	return out









func _clasico(ri: int, order: Array, izq: int, prev_xy: Dictionary, row_h: float,
		techo: float, suelo: float) -> Dictionary:
	var ties: Array = _rounds[ri]["ties"]
	var prev: Array = _rounds[ri - 1]["ties"]
	var fila: float = row_h + ROW_GAP
	var out: Dictionary = {}
	var por_lado: Array = [[], []]
	for k in order.size():
		var i: int = int(order[k])
		var t: Dictionary = ties[i]
		var ys: Array = [null, null]
		for j in _source_indices(t, prev):
			if prev_xy.has(int(j)):
				var w: String = String((prev[int(j)] as Dictionary).get("winner", ""))
				ys[0 if w == String(t.get("a", "")) else 1] =(prev_xy[int(j)] as Vector2).y
		if ys[0] == null and ys[1] == null:
			return {}
		var pegado: bool = false
		if ys[0] == null:
			ys[0] = float(ys[1]) - fila
		elif ys[1] == null:
			ys[1] = float(ys[0]) + fila
		elif absf(float(ys[0]) - float(ys[1])) < row_h + FINAL_AIRE:
			if ri < _rounds.size() - 1:
				return {}
			var m: float =(float(ys[0]) + float(ys[1])) * 0.5
			var s: float = 1.0 if float(ys[0]) <= float(ys[1]) else -1.0
			ys = [m - s *(row_h + FINAL_AIRE) * 0.5, m + s *(row_h + FINAL_AIRE) * 0.5]
			pegado = true
		out[i] = [float(ys[0]), float(ys[1]), pegado]
		(por_lado[1 if k >= izq else 0] as Array).append(i)
	for lado in por_lado:
		var cajas: Array = []
		for i in lado:
			cajas.append([float(out[i][0]), int(i)])
			cajas.append([float(out[i][1]), int(i)])
		cajas.sort_custom(func(p: Array, q: Array) -> bool: return float(p[0]) < float(q[0]))
		for n in cajas.size():
			var yc: float = float(cajas[n][0])
			if yc - row_h * 0.5 < techo - 0.5 or yc + row_h * 0.5 > suelo + 0.5:
				return {}
			if n > 0 and yc - float(cajas[n - 1][0]) < fila - 0.01:
				return {}

			if n % 2 == 1 and int(cajas[n][1]) != int(cajas[n - 1][1]):
				return {}
	return out







func _order_by_source(ties: Array, prev_ties: Array, prev_pos: Dictionary) -> Array:
	var keyed: Array = []
	for i in ties.size():
		var key: float = float(i)
		if not prev_ties.is_empty():
			var sum: float = 0.0
			var n: int = 0
			for j in _source_indices(ties[i], prev_ties):
				if prev_pos.has(int(j)):
					sum += float(prev_pos[int(j)])
					n += 1
			if n > 0:
				key = sum / float(n)
		keyed.append({"i": i, "key": key})
	keyed.sort_custom(func(p: Dictionary, q: Dictionary) -> bool:
		if not is_equal_approx(float(p["key"]), float(q["key"])):
			return float(p["key"]) < float(q["key"])
		return int(p["i"]) < int(q["i"]))
	var out: Array = []
	for e in keyed:
		out.append(int((e as Dictionary)["i"]))
	return out





func _fit_name(box: Control, col_w: float) -> void:
	var l: Label = box.get_meta("name_label")
	var ab: String = String(box.get_meta("abbrev"))
	if grande and not ab.is_empty():
		l.text = String(box.get_meta("full")) if _cabe_entero(box, col_w) else ab
		return
	if col_w < NARROW and not ab.is_empty():
		l.text = ab
		return




	var full: String = String(box.get_meta("full"))
	var corto: String = GameState.nombre_corto_club(full)
	var hueco: float = _hueco_nombre(box, col_w)
	var f: Font = l.get_theme_font("font")
	for tam in range(_letra(), NOMBRE_SUELO - 1, -1):
		for txt in [full, corto]:
			if f == null or f.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x <= hueco:
				l.text = txt
				l.add_theme_font_size_override("font_size", tam)
				return
	l.text = ab if not ab.is_empty() else full
	l.add_theme_font_size_override("font_size", _letra() if not ab.is_empty() else NOMBRE_SUELO)




func _cabe_entero(box: Control, col_w: float) -> bool:
	var l: Label = box.get_meta("name_label")
	var f: Font = l.get_theme_font("font")
	var full: String = String(box.get_meta("full"))
	return f == null or f.get_string_size(full, HORIZONTAL_ALIGNMENT_LEFT, -1,
		LETRA_GRANDE).x <= _hueco_nombre(box, col_w)




func _hueco_nombre(box: Control, col_w: float) -> float:
	var l: Label = box.get_meta("name_label")
	var fila: Node = l.get_parent()
	var resto: float = 6.0 * 2.0 + 6.0 * float(maxi(fila.get_child_count() - 1, 0))
	for h in fila.get_children():
		if h != l and h is Control:
			resto +=(h as Control).get_combined_minimum_size().x
	return col_w - resto










func _coloca_huecos(huecos: Array, doble: bool, x_izq: float, x_der: float, col_w: float,
		row_h: float, head_h: float, span: float, prev_lados: Array, lados: Array,
		con_corchete: bool = false) -> void:
	var izq: int = ceili(float(huecos.size()) / 2.0) if doble else huecos.size()
	for k in huecos.size():
		var derecha: bool = k >= izq
		var kk: int = k - izq if derecha else k
		var n_lado: int = huecos.size() - izq if derecha else izq
		var x: float = x_der if derecha else x_izq
		var y: float = head_h + span *(float(kk) + 0.5) / float(n_lado)
		var origenes: Array = []
		if doble or (prev_lados[1] as Array).is_empty():
			var lado_prev: Array = prev_lados[1 if derecha else 0]
			for j in [2 * kk, 2 * kk + 1]:
				if j < lado_prev.size():
					origenes.append(lado_prev[j])
		else:

			for lp in prev_lados:
				if not (lp as Array).is_empty():
					origenes.append((lp as Array)[(lp as Array).size() - 1])
		var ya: float = y - ROW_GAP * 0.5 - row_h * 0.5
		var yb: float = y + ROW_GAP * 0.5 + row_h * 0.5



		var pegado: bool = false
		if origenes.size() == 2:
			ya =(origenes[0] as Vector2).y
			yb =(origenes[1] as Vector2).y
			if absf(ya - yb) < row_h + FINAL_AIRE:
				var m: float =(ya + yb) * 0.5
				var s: float = 1.0 if ya <= yb else -1.0
				ya = m - s *(row_h + FINAL_AIRE) * 0.5
				yb = m + s *(row_h + FINAL_AIRE) * 0.5
				pegado = true
			y =(ya + yb) * 0.5
		var pair: Array = huecos[k]
		(pair[0] as Control).position = Vector2(x, ya - row_h * 0.5)
		(pair[0] as Control).size = Vector2(col_w, row_h)
		(pair[1] as Control).position = Vector2(x, yb - row_h * 0.5)
		(pair[1] as Control).size = Vector2(col_w, row_h)
		(lados[1 if derecha else 0] as Array).append(Vector2(x, y))
		if con_corchete:
			_corchetes_huecos.append(_corchete(x, col_w, ya, yb, -1.0 if derecha else 1.0))
		for n in origenes.size():
			_links_huecos.append(_codo(origenes[n], x, col_w, ya if n == 0 else yb, pegado))





func _corchete(x: float, col_w: float, ya: float, yb: float, dir: float) -> Array:
	var canto: float = x + col_w if dir > 0.0 else x
	var barra: float = canto + dir * CORCHETE
	return [Vector2(canto, ya), Vector2(barra, ya), Vector2(barra, yb), Vector2(canto, yb)]









func _codo(o: Vector2, x: float, col_w: float, y: float, pegado: bool = false) -> Array:
	var desde: float = o.x + col_w if o.x < x else o.x
	var hasta: float = x if o.x < x else x + col_w
	if not grande:
		var mid: float =(desde + hasta) * 0.5
		return [Vector2(desde, o.y), Vector2(mid, o.y), Vector2(mid, y), Vector2(hasta, y)]
	var dir: float = signf(hasta - desde)
	var barra: float = desde + dir * CORCHETE

	if absf(o.y - y) <= ESCALON_TOL:
		return [Vector2(barra, y), Vector2(hasta, y)]
	var quiebro: float = hasta - dir * CODO_AIRE
	if pegado:
		var l: float = grosor_linea()
		var lo: float = desde + dir *(CORCHETE + l + FINAL_BARRA_AIRE)
		var hi: float = hasta - dir *(l * 0.5 + FINAL_CAJA_AIRE)
		quiebro =(lo + hi) * 0.5
	return [Vector2(barra, o.y), Vector2(quiebro, o.y), Vector2(quiebro, y), Vector2(hasta, y)]




func _source_indices(tie: Dictionary, prev_ties: Array) -> Array:
	var out: Array = []
	var a: String = String(tie.get("a", ""))
	var b: String = String(tie.get("b", ""))
	for j in prev_ties.size():
		var w: String = String((prev_ties[j] as Dictionary).get("winner", ""))
		if not w.is_empty() and (w == a or w == b):
			out.append(j)
	return out


func _draw() -> void:



	var col: Color = Color(_accent.r, _accent.g, _accent.b, 0.7 if grande else 0.35)

	var grosor: float = grosor_linea()
	for seg in _links + _corchetes:
		_traza(seg, col, grosor)


	for seg in _links_huecos + _corchetes_huecos:
		_traza(seg, CareerTheme.SURFACE_LINE, grosor)








func _traza(seg: Array, col: Color, grosor: float) -> void:
	if not grande:
		draw_polyline(PackedVector2Array(seg), col, grosor)
		return
	var medio: float = grosor * 0.5
	for n in seg.size() - 1:
		var p: Vector2 = seg[n]
		var q: Vector2 = seg[n + 1]
		var dir: Vector2 =(q - p).normalized()
		if dir == Vector2.ZERO:
			continue
		if n > 0:
			p += dir * medio
		if n < seg.size() - 2:
			q += dir * medio
		var lado: Vector2 = Vector2(- dir.y, dir.x) * medio
		var r: Rect2 = Rect2(p - lado, Vector2.ZERO).expand(p + lado).expand(q - lado).expand(q + lado)
		draw_rect(r, col)
