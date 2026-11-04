extends "res://ui/ceremonies/cold_open.gd"





























const T_VS: float = 4.1



const T_CARD_RIVAL: float = 9.6

var _vs_tele: VsTele = null


func _es_previa() -> bool:
	return false





func _accent_for() -> Color:
	viste(data)
	return super._accent_for()





static func viste(d: Dictionary) -> void:
	d["mode"] = "pases"
	var g: Dictionary = d.get("goleo", {}) if d.get("goleo", null) is Dictionary else {}
	if Dictionary(g.get("duelo", {})).is_empty():
		g = {"key": String(g.get("key", "league")), "titular": "duelo",
			"duelo": {"team": String(d.get("opp", "")), "name": String(d.get("cara", ""))}}
		d["goleo"] = g
	g["titular"] = "duelo"




func _pases_hud_arma() -> void:
	var du: Dictionary = Dictionary(Dictionary(data.get("goleo", {})).get("duelo", {}))
	if du.is_empty():
		return
	_pases_partida_arma(du)
	_partida.quita_vs()
	_vs_tele = VsTele.new()
	add_child(_vs_tele)
	var vp: Viewport = get_viewport()
	_vs_tele.arma(cfg_vs(du), {"abajo": UiKit.bottom_safe_inset(vp),
		"lado": UiKit.side_safe_inset(vp)})







func cfg_vs(du: Dictionary) -> Dictionary:
	var vs: Dictionary = data.get("vs", {})
	var tu: Dictionary = vs.get("tu", {})
	var el: Dictionary = vs.get("el", {})
	var club: Dictionary = _rival()
	var cfg: Dictionary = _pases_cfg_base()
	cfg["kicker"] = I18n.t("SE MIDE CON SU ÍDOLO")
	cfg["lados"] = [
		{"nombre": CareerTheme.caps(Espalda.apellido_de(Career.player_name)),
			"look": _pases_look if not _pases_look.is_empty() else GameState.player_look(),
			"club": Teams.by_id(String(vivo_de("club", GameState.player_team_id))), "color": CareerTheme.NAV_YO,
			"ovr": int(tu.get("ovr", Career.ovr_shown())),
			"pos": String(tu.get("pos", Career.puesto_hoy()))},
		{"nombre": CareerTheme.caps(String(data.get("apellido", data.get("nombre", "")))),
			"look": _pases_look_rival(du), "club": club,
			"color": CareerTheme.accent_of(club) if not club.is_empty()
				else CareerTheme.TEXT_MID,
			"ovr": int(el.get("ovr", 0)), "pos": String(el.get("pos", data.get("pos", "")))}]
	cfg["filas"] = filas_vs(vs)
	return cfg






static func filas_vs(vs: Dictionary) -> Array:
	var tu: Dictionary = vs.get("tu", {})
	var el: Dictionary = vs.get("el", {})
	var filas: Array = []
	if int(tu.get("rank", 0)) > 0 and int(el.get("rank", 0)) > 0:
		filas.append({"icono": "mundo", "rotulo": I18n.t("RANKING"),
			"izq": float(tu["rank"]), "der": float(el["rank"]), "menor_mejor": true,
			"prefijo": "#", "cuenta": false})
	if bool(el.get("carrera", false)):
		filas.append({"icono": "gol", "rotulo": I18n.t("GOLES"),
			"izq": float(tu.get("g", 0)), "der": float(el.get("g", 0))})
		filas.append({"icono": "asist", "rotulo": I18n.t("ASIST."),
			"izq": float(tu.get("a", 0)), "der": float(el.get("a", 0))})
		filas.append({"icono": "media", "rotulo": I18n.t("NOTA"),
			"izq": float(tu.get("avg", 0.0)), "der": float(el.get("avg", 0.0)),
			"decimales": true})
	return filas




func _tick(delta: float) -> void:
	_tick_pases(delta)
	if _vs_tele != null:
		_vs_tele.anima(t - T_VS, T_CARD_RIVAL - t)


func _build() -> void:
	super._build()
	_ficha()


func _rival() -> Dictionary:
	return Teams.by_id(String(data.get("opp", "")))


func _anios() -> int:
	return maxi(int(data.get("anios", 0)), 1)




func frase() -> String:
	return I18n.t(String(IdoloEscenas.RIVAL_FRASES.get(String(data.get("rama", "")),
		IdoloEscenas.RIVAL_FRASES["fan"])))


func _ficha() -> void:
	make_card(T_CARD_RIVAL)




	card_title(CareerTheme.caps(String(data.get("nombre", "?"))), 40)
	card_club(_rival())
	var sub: Label = card_sub(I18n.tf("LO ELEGISTE HACE {0} TEMPORADAS", [str(_anios())]))
	sub.clip_text = true
	var stats: Array = [{"v": str(_anios()), "k": I18n.t("temporadas")}]



	if int(data.get("rank", 0)) > 0:
		stats.append({"v": "#%d" % int(data["rank"]), "k": I18n.t("ranking")})
	card_stats(stats)
	card_note(I18n.t("Alguien le enseñó aquella rueda de prensa. Te reconoce."))
	card_note(frase())
	card_cta(I18n.t("SEGUIR"))
