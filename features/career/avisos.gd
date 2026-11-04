class_name Avisos
extends RefCounted























const ALIAS: Dictionary = {"seleccion": "torneos", "legado": "carrera"}




static func activos() -> Array:
	return sin_vistos(_catalogo())



static func _catalogo() -> Array:
	var acc: Array = []







	_derbi(acc)


	_jornada(acc)



	_recuperacion(acc)


	_brazalete(acc)


	_peldano_baja(acc)

	_fair_play(acc)

	_impago(acc)


	_ley_club(acc)


	_seleccion(acc)


	if Career.forced_sale:
		_add(acc, "mercado", I18n.t("TE VENDEN"), I18n.t("RESPONDE YA"),
			CareerTheme.DANGER, true, true)
	elif Career.forced_loan:
		_add(acc, "mercado", I18n.t("TE CEDEN"), I18n.t("RESPONDE YA"),
			CareerTheme.DANGER, true, true)

	_venta_prevista(acc)
	if Career.free_agent:



		_add(acc, "mercado", I18n.t("AGENTE LIBRE"), I18n.t("Elige tu próximo club"),
			CareerTheme.accent_text(), true)



	if not Career.free_agent:
		_mercado(acc)




	if not Career.agent_result.is_empty():
		var ar: Dictionary = Career.agent_result
		var ok_res: bool = bool(ar.get("ok", false))
		var ar_tag: String = String(ar.get("tag", ""))



		var ar_val: String = I18n.tf("TRAJO A {0}",
			[CareerTheme.caps(String(ar.get("name", "")))]) \
					if ar_tag == Career.TAG_AGENT_NEW or ar_tag == Career.TAG_AGENT_PRE \
					else I18n.t(ar_tag)
		_add(acc, "mercado", I18n.t("TU AGENTE"), ar_val,
			CareerTheme.accent_text() if ok_res else CareerTheme.TEXT_DIM,
			ok_res)






	if not Career.free_agent and Career.gerencia_mesa_abierta():
		var marcados: int = Career.gerencia_mesa_aceptadas().size() \
				+ Career.gerencia_mesa_compras().size()
		if marcados > 0:
			_add(acc, "gerencia", I18n.t("FICHAJES"),
				I18n.tf("{0} SIN CONFIRMAR", [marcados]), CareerTheme.accent_text(),
				true, true)






	if not Career.haggle_results.is_empty():
		var ups: int = 0
		var walks: int = 0
		var one: Dictionary = Career.haggle_results[0]
		for hr in Career.haggle_results:
			var t: String = String((hr as Dictionary).get("tag", ""))
			if t == Career.TAG_WAGE_UP or t == Career.TAG_ROLE_UP:
				ups += 1
				one = hr
			elif t == Career.TAG_WALK:
				walks += 1
		var hg_val: String = "%s · %s" % [
			CareerTheme.caps(String(one.get("name", ""))),
			I18n.t(String(one.get("tag", "")))] \
					if Career.haggle_results.size() == 1 or ups == 1 \
					else I18n.tf("{0} CLUBES RESPONDIERON", [Career.haggle_results.size()])
		var hg_col: Color = CareerTheme.MONEY if ups > 0 \
				else (CareerTheme.DANGER if walks > 0 else CareerTheme.TEXT_DIM)
		_add(acc, "mercado", I18n.t("NEGOCIACIÓN"), hg_val, hg_col,
			ups > 0)




	if not Career.free_agent and not Career.on_loan() \
			and int(Career.contract["seasons_left"]) <= 1 \
			and Career.pending_precontract.is_empty():
		var renew: bool = Career.can_renew()




		var sub: String = I18n.t("RENOVACIÓN SOBRE LA MESA") if renew \
				else I18n.t("CONTRATOS CONGELADOS") if Career.concurso_tuyo() \
				else I18n.t("SALDRÁS LIBRE AL CIERRE")
		_add(acc, "mercado", I18n.t("ÚLTIMO AÑO"), sub, CareerTheme.DANGER, renew)




	if Career.renegotiation_club_offered() and not Career.on_loan():
		_add(acc, "mercado", I18n.t("MEJORA"), I18n.t("TU CLUB TE LA OFRECE"),
			CareerTheme.MONEY, true)





	if not Career.free_agent and Career.objective_at_risk():
		var ov: String = I18n.t("VAS CORTO")
		match String(Career.contract["obj_type"]):
			"goals", "assists", "matches":
				ov = I18n.tf("{0} DE {1} · VAS CORTO",
					[int(Career.contract["obj_progress"]),
					int(Career.contract["obj_target"])])
		_add(acc, "contrato", I18n.t("OBJETIVO"), ov, CareerTheme.DANGER,
			false)




	elif not Career.free_agent and Career.objective_done_early():
		_add(acc, "contrato", I18n.t("OBJETIVO"), I18n.t("CUMPLIDO"), CareerTheme.MONEY,
			false)





	if not Career.free_agent:
		var cg: Dictionary = Career.club_goal_at_risk()
		if not cg.is_empty():
			_add(acc, "contrato", I18n.t("EL CLUB, CORTO"),
				I18n.tf("{0} · PIDE {1}", [I18n.tf("VAS {0}",
					[I18n.ordinal(int(cg.get("pos", GameState.league_position())))]),
					I18n.ordinal(int(cg.get("target", 1)))]),
				CareerTheme.DANGER, false)



	var rr: Dictionary = Career.record_within_reach()
	if not rr.is_empty():
		var falta: int = int(rr["falta"])
		var uni: String = I18n.plural(falta, "GOL", "GOLES") if bool(rr["goal"]) \
				else I18n.plural(falta, "ASISTENCIA", "ASISTENCIAS")
		_add(acc, "legado", I18n.t("RÉCORD A LA VISTA"),
			I18n.tf("A {0} {1} DEL LIBRO", [falta, uni]),
			CareerTheme.accent_text(), true)


	if Career.sponsor_window_open() and not Career.sponsor_offers.is_empty():
		_add(acc, "relaciones", I18n.t("PATROCINIO"),
			I18n.tf("{0} TE BUSCAN · YA", [Career.sponsor_offers.size()]),
			CareerTheme.accent_text(),
			true)











	if nat_due():




		var st: String = Career.nat_role()
		if st != "fuera":
			_add(acc, "seleccion", I18n.t("SELECCIÓN"), Career.nat_role_label(st),
				CareerTheme.accent_text(),
				false)






	if not Career.free_agent and not Career.retired and Career.is_rusty():
		_add(acc, "juego", I18n.t("RITMO"), I18n.t("FALTO DE RITMO · SE PASA JUGANDO"),
			CareerTheme.accent_text(), false)









	if Career.can_spend_any():
		_add(acc, "juego", I18n.tf("{0} PUNTOS", [Career.skill_points]), "",
			CareerTheme.accent_text(), false)














	if Career.world_news_tuyas_sin_ver() > 0:
		_add(acc, "noticias", I18n.t("NOTICIAS"), "",
			CareerTheme.accent_text(), false)















	if not Career.free_agent and not Career.pending_precontract.is_empty():
		_add(acc, "contrato", precontrato_rotulo(), "", CareerTheme.TEXT_DIM, false)


	_primeros_pasos(acc)
	return acc











static func es_apagable(a: Dictionary) -> bool:
	return String(a["page"]) == "contrato" and not bool(a["pulse"])


static func clave(a: Dictionary) -> String:
	return "%s|%s" % [String(a["title"]), String(a.get("val", ""))]





static func claves_apagables() -> Array:
	var acc: Array = []
	for a in _catalogo():
		if es_apagable(a):
			acc.append(clave(a))
	return acc


static func sin_vistos(lista: Array) -> Array:
	var out: Array = []
	for a in lista:
		if es_apagable(a) and Career.avisos_vistos.has(clave(a)):
			continue
		out.append(a)
	return out

























static func _add(acc: Array, page: String, title: String, val: String, col: Color,
		glow: bool, con_porque: bool = false) -> void:
	acc.append({
		"page": page, "title": title, "col": col, "pulse": glow,
		"porque": val if con_porque else "", "val": val,
	})









static func precontrato_rotulo() -> String:
	return I18n.tf("FIRMADO: {0}",
		[CareerTheme.caps(Market.club_name(Career.pending_precontract))])







static func agrupados(por: String) -> Dictionary:
	return agrupa(activos(), por)






static func agrupa(lista: Array, por: String) -> Dictionary:
	var out: Dictionary = {}
	for a in lista:
		var page: String = String(a["page"])
		var clave: String = familia_de(page) if por == "familia" else tab_de(page)


		if clave.is_empty() or clave == "hogar":
			continue
		var col: Color = Color(a["col"])
		var prev: Dictionary = out.get(clave, {})



		var gana: bool = prev.is_empty() \
				or (col == CareerTheme.DANGER and Color(prev["tint"]) != CareerTheme.DANGER)





		var msgs: Array = prev.get("msgs", []) as Array
		var mios: Array = [String(a["title"])]
		if not String(a["porque"]).is_empty():
			mios.append(String(a["porque"]))
		for m in mios:
			if msgs.has(m):
				continue
			if gana:
				msgs.insert(mios.find(m), m)
			else:
				msgs.append(m)
		out[clave] = {
			"tint": col if gana else prev["tint"],
			"pulse": bool(a["pulse"]) or bool(prev.get("pulse", false)),
			"msgs": msgs,
		}
	return out








static func tab_de(page: String) -> String:
	var p: String = String(ALIAS.get(page, page))
	var tab: String = CareerNav.tab_of_page(p)
	return tab if not tab.is_empty() else p



static func familia_de(page: String) -> String:
	return CareerNav.family_of_tab(tab_de(page))







static func _derbi(acc: Array) -> void:
	if Career.retired or Career.free_agent:
		return
	var fx: Dictionary = GameState.current_fixture()
	var opp: String = String(fx.get("opp", ""))
	if opp.is_empty() or not Career.is_derby(opp):
		return
	var is_nat: bool = String(fx.get("comp", "")) == "nat"
	var rival: Dictionary = Nations.as_team(opp) if is_nat else Teams.by_id(opp)




	var venue: String = I18n.t("EN CASA") if bool(fx.get("home", true)) \
			else I18n.t("FUERA")
	var val: String = venue if rival.is_empty() \
			else "%s · %s" % [CareerTheme.caps(Nations.team_label(rival)), venue]
	_add(acc, "torneos", I18n.t("HOY, DERBI"), val, CareerTheme.DANGER,
		false)















static func _jornada(acc: Array) -> void:
	var d: Dictionary = Career.jornada_decisiva()
	if d.is_empty():
		return
	var titulo: String = I18n.t("HOY, EL TÍTULO")
	match String(d["tipo"]):
		"ascenso":
			titulo = I18n.t("HOY, EL ASCENSO")
		"salvacion":
			titulo = I18n.t("HOY, LA SALVACIÓN")
	var basta: String = I18n.t("UN PUNTO BASTA") if int(d["basta"]) <= 1 \
			else I18n.t("GANA Y LO SELLAS")
	_add(acc, "torneos", titulo, basta, CareerTheme.accent_text(), false, true)



const PASO_CASA_TRAS: int = 2
const PASO_MERCADO_TRAS: int = 4























static func _primeros_pasos(acc: Array) -> void:
	if Career.retired or Career.free_agent:
		return
	var casa_vista: bool = not Career.house_extras.is_empty() \
			or not Career.house_items.is_empty()

	var mercado_visto: bool = Settings.tour_done("mercado") or Career.on_loan()
	match primer_paso(GameState.season_num, Herencia.retiros(), Career.season_matches,
			casa_vista, mercado_visto):
		"casa":
			_add(acc, "casa", I18n.t("TU CASA"), I18n.t("COMPRA UN MUEBLE"),
				CareerTheme.accent_text(), false, true)
		"mercado":
			_add(acc, "mercado", I18n.t("AGENTE"), I18n.t("MIRA QUIÉN TE SIGUE"),
				CareerTheme.accent_text(), false, true)




static func primer_paso(temporada: int, retiros: int, partidos: int, casa_vista: bool,
		mercado_visto: bool) -> String:
	if temporada != 1 or retiros > 0:
		return ""
	if partidos >= PASO_CASA_TRAS and not casa_vista:
		return "casa"
	if partidos >= PASO_MERCADO_TRAS and not mercado_visto:
		return "mercado"
	return ""




















static func _recuperacion(acc: Array) -> void:
	if Career.retired or Career.free_agent or not Career.eased_return:
		return





	var st: Dictionary = Career.standing()
	if not bool(st.get("eased", false)):
		return
	_add(acc, "perfil", I18n.t("TE CUIDAN AL VOLVER"),
		I18n.tf("DESDE LA BANCA · ~{0} MIN", [int(st.get("minutes", 0))]),
		CareerTheme.accent_text(), false, true)




















static func _brazalete(acc: Array) -> void:
	if Career.retired or not Career.captain_lost_fresh():
		return
	var cl: Dictionary = Career.captain_lost
	var porque: String = ""
	match String(cl.get("via", "")):
		"merito":
			porque = I18n.tf("{0} {1} · TU MEDIA {2}", [
				CareerTheme.caps(String(cl.get("rival", ""))),
				"%.1f" % float(cl.get("rival_avg", 0.0)),
				"%.1f" % float(cl.get("tu_avg", 0.0))])
		"nivel":



			porque = I18n.tf("TU NIVEL: {0}", [I18n.t(Gerencia.peldano_nombre(
				int(cl.get("nivel", Gerencia.PELDANO_MESA))))])
		"tecnico":
			porque = I18n.t("EL TÉCNICO NUEVO REPARTE DE CERO")


		"banca":
			porque = I18n.t("NO ERES TITULAR")

		"pediste":
			porque = I18n.t("PEDISTE SALIR")
		"traspaso":
			var club: String = String(cl.get("club", ""))
			porque = I18n.t("VESTUARIO NUEVO") if club.is_empty() \
					else I18n.tf("SE QUEDA EN {0}", [CareerTheme.caps(club)])
	_add(acc, "perfil", I18n.t("PERDISTE EL BRAZALETE"), porque, CareerTheme.DANGER,
		false, not porque.is_empty())













static func _peldano_baja(acc: Array) -> void:
	if Career.retired:
		return
	var av: Dictionary = Career.peldano_aviso_fresh()
	if av.is_empty():
		return
	if Career.captain_lost_fresh() \
			and String(Career.captain_lost.get("via", "")) == "nivel":
		return
	var n: int = int(av.get("n", 1))
	_add(acc, "gerencia", I18n.t("BAJAS DE NIVEL EN EL CLUB"),
		I18n.tf("TU NIVEL: {0}", [I18n.t(Gerencia.peldano_nombre(n))]),
		CareerTheme.DANGER, false, true)











static func _impago(acc: Array) -> void:
	if Career.retired:
		return
	var deuda: int = Career.impago_deuda()
	if deuda <= 0:
		return
	_add(acc, "gerencia", I18n.t("EL CLUB TE DEBE"), "$" + CareerUi.money(deuda),
		CareerTheme.DANGER, false, true)


static func _fair_play(acc: Array) -> void:
	if Career.retired:
		return
	var av: Dictionary = Career.ffp_aviso_fresh()
	if av.is_empty():
		return
	if av.has("sancion"):
		_add(acc, "gerencia", I18n.t("SANCION DE FAIR PLAY"),
			I18n.tf("-{0} PTS EN LA LIGA", [int(av["sancion"])]),
			CareerTheme.DANGER, false, true)
	else:
		_add(acc, "gerencia", I18n.t("AVISO DE FAIR PLAY"),
			I18n.tf("SI REPITE: -{0} PTS", [ClubFinance.FFP_PUNTOS]),
			CareerTheme.DANGER, false, true)







static func _ley_club(acc: Array) -> void:
	if Career.retired:
		return
	var av: Dictionary = Career.ley_club_aviso_fresh()
	if av.is_empty():
		return










	_add(acc, "leyendas", I18n.t("SUPERAS A"),
		CareerTheme.caps(CareerUi.surname(String(av.get("name", "")))),
		CareerTheme.NAV_LEGADO, false, true)
	_add(acc, "leyendas", I18n.tf("LEYENDA Nº{0}", [int(av.get("puesto", 0))]), "",
		CareerTheme.NAV_LEGADO, false)










static func nat_due() -> bool:
	return String(GameState.current_fixture().get("comp", "")) == "nat" \
			or String(GameState.next_fixture().get("comp", "")) == "nat"





static func nat_jornadas_hasta() -> int:
	var cal: Array = GameState.calendar
	var n: int = 0
	var i: int = GameState.season_day
	while i < cal.size():
		var f: Dictionary = cal[i]
		if not bool(f.get("dead", false)):
			if String(f.get("comp", "")) == "nat":
				return n
			n += 1
		i += 1
	return -1





const NAT_RACE_WINDOW: int = 4














static func _seleccion(acc: Array) -> void:
	if Career.retired or Career.nat_retired or Career.nationality.is_empty():
		return
	if nat_due():
		return
	var faltan: int = nat_jornadas_hasta()
	if faltan < 0 or faltan > NAT_RACE_WINDOW:
		return
	var r: Dictionary = Career.nat_race()
	if r.is_empty():
		return


	var col: Color = CareerTheme.DANGER if bool(r["bad"]) else CareerTheme.TEXT_DIM
	for renglon in r.get("renglones", [r["porque"]]):
		_add(acc, "seleccion", I18n.t("SELECCIÓN"), String(renglon), col, false, true)






const VENTA_AVISO_J: int = 3



























static func _venta_prevista(acc: Array) -> void:
	var faltan: int = Market.days_until_open(GameState.season_day, GameState.winter_day())
	if faltan < 1 or faltan > VENTA_AVISO_J:
		return


	if Market.next_window_name(GameState.season_day, GameState.winter_day()) != "INVIERNO":
		return
	var motivo: String = Career.forced_sale_preview()
	if motivo.is_empty():
		return
	for renglon in venta_prevista_renglones(motivo, faltan):
		_add(acc, "mercado", I18n.t("RIESGO DE VENTA"), String(renglon),
			CareerTheme.DANGER, false, true)











static func venta_prevista_renglones(motivo: String, faltan: int) -> Array:
	var out: Array = [I18n.tf("VENTANA EN {0}J", [faltan])]
	if motivo == Career.FORCED_SALE_GRADA:
		out.append(I18n.t("POR TU GRADA"))

		out.append(I18n.tf("AFICIÓN A {0}", [Career.GRADA_VENTA_OFF]))
		out.append(I18n.t("Y ESTÁS A SALVO"))
	else:
		out.append(I18n.t("SALVO ASCENSO"))
		out.append(I18n.t("O EUROPA"))
	return out










static func _mercado(acc: Array) -> void:




	if Career.on_loan():
		return













	var n_of: int = Career.ofertas_en_mesa()
	var n_ce: int = Career.pending_loans.size()
	var n: int = n_of + n_ce
	var open_now: bool = Career.market_open()
	if not open_now and n <= 0:
		return
	var title: String = I18n.t(Market.window_name(GameState.season_day,
		GameState.winter_day())) if open_now else I18n.t("TE BUSCAN")
	var days: int = Career.market_days_left()
	var val: String = ""
	var col: Color = CareerTheme.GOOD




	var destinos: String = "" if n_ce <= 0 else (I18n.tf("{0} DESTINO", [n_ce]) \
			if n_ce == 1 else I18n.tf("{0} DESTINOS", [n_ce]))
	if open_now and Career.market_deadline():

		val = I18n.tf("CIERRA HOY · {0} OFERTAS", [n_of]) if n_of > 0 \
				else I18n.t("CIERRA HOY")
		col = CareerTheme.DANGER
	elif not open_now:


		val = I18n.tf("{0} OFERTAS SOBRE LA MESA", [n_of]) if n_of > 0 else destinos
	elif n_of > 0:






		var exp: int = Career.offers_expiring_today()
		if exp > 0:
			val = I18n.tf("{0} OFERTAS · {1} EXPIRA HOY", [n_of, exp]) if exp == 1 \
					else I18n.tf("{0} OFERTAS · {1} EXPIRAN HOY", [n_of, exp])
			col = CareerTheme.DANGER
		else:
			val = I18n.tf("{0} OFERTAS · {1}J", [n_of, days])
	elif n_ce > 0:



		val = destinos
	else:









		var mio: Dictionary = Career.club_news_unseen()
		var altas: int = int(mio["in"])
		var bajas: int = int(mio["out"])
		var news: int = Career.market_news_unseen()
		if altas + bajas > 0:
			var trozos: Array[String] = []
			if altas > 0:
				trozos.append(I18n.tf("{0} ALTA", [altas]) if altas == 1 \
						else I18n.tf("{0} ALTAS", [altas]))
			if bajas > 0:
				trozos.append(I18n.tf("{0} BAJA", [bajas]) if bajas == 1 \
						else I18n.tf("{0} BAJAS", [bajas]))
			val = "%s · %s" % [I18n.t("TU CLUB"), " · ".join(trozos)]


			col = CareerTheme.accent_text()
		elif news > 0:
			val = I18n.tf("ABIERTO · {0} FICHAJES", [news])
		else:
			val = I18n.tf("ABIERTO · {0}J", [days])









	_add(acc, "mercado", val if not val.is_empty() else title, "", col,
		n > 0 or (open_now and Career.market_deadline()))
