extends Node






























const SINGLETON: String = "NotificacionesBridge"

const SIN_DECIDIR: int = 0
const CONCEDIDO: int = 1
const DENEGADO: int = 2

const HORA: int = 3600
const DIA: int = 86400





const H_OFERTA: int = 18
const H_PARTIDO: int = 20
const H_LESION: int = 20

const DIAS_VUELTA: Array[int] = [1, 3, 7]



const HECHO_HORIZONTE: int = 6







const VENTANA_DESDE: int = 9
const VENTANA_HASTA: int = 22

var _puente: Object = null


func _ready() -> void:
	if not Engine.has_singleton(SINGLETON):
		return
	_puente = Engine.get_singleton(SINGLETON)



func disponible() -> bool:
	return _puente != null


func permiso() -> int:
	if not disponible():
		return SIN_DECIDIR
	return int(_puente.call("permiso"))





func pedir_permiso() -> void:
	if not disponible() or permiso() != SIN_DECIDIR:
		return
	_puente.call("pedir_permiso")























func avisos_de(estado: Dictionary, ahora_s: int = -1) -> Array:


	var reto: Array = _aviso_reto(estado, ahora_s)
	reto.append_array(_aviso_liga(estado, ahora_s))
	if not bool(estado.get("jugando", false)):
		return reto
	var out: Array = []
	var dias_usados: Dictionary = {}



	var club: String = String(estado.get("club", ""))
	if int(estado.get("ofertas", 0)) > 0:
		out.append(_aviso("oferta", I18n.tf("{0} espera respuesta", [club]),
			I18n.t("Tu oferta caduca. Nadie va a decidir por ti."), H_OFERTA))
		dias_usados[1] = true



	if bool(estado.get("cumple_hoy", false)) and not dias_usados.has(1):
		out.append(_aviso("cumple", I18n.t("Hoy es tu cumpleaños"),
			I18n.t("El vestuario te ha preparado algo."), H_PARTIDO))
		dias_usados[1] = true
	var partido: String = String(estado.get("partido", ""))
	if partido != "" and not dias_usados.has(1):
		out.append(_aviso("partido", partido, I18n.t("Tu once te espera."), H_PARTIDO))
		dias_usados[1] = true


	var semanas: int = int(estado.get("lesion_vuelve_en", 0))
	if semanas == 1 and not dias_usados.has(1):
		out.append(_aviso("lesion", I18n.t("Ya casi estás en forma"),
			I18n.t("Una semana más y vuelves al once."), H_LESION))
		dias_usados[1] = true









	var vuelta: String = String(estado.get("pendiente", ""))
	if vuelta != "":
		var hechos: Array[String] = _hechos_de(estado)
		var usados: int = 0
		for d in DIAS_VUELTA:
			if dias_usados.has(d):
				continue
			var cuerpo: String = hechos[usados] if usados < hechos.size() else vuelta
			usados += 1
			out.append(_aviso("vuelta_d%d" % d, I18n.t("Tu carrera sigue ahí"), cuerpo,
				H_PARTIDO +(d - 1) * 24))
			dias_usados[d] = true


	if ahora_s >= 0:
		for a in out:
			a["segundos"] = _en_ventana(int(a["segundos"]), ahora_s)
	out.append_array(reto)
	return out






func _hechos_de(estado: Dictionary) -> Array[String]:
	var out: Array[String] = []
	var derbi: int = int(estado.get("derbi_en", 0))
	if derbi >= 1 and derbi <= HECHO_HORIZONTE:
		out.append(I18n.t("Falta una jornada para el derbi.") if derbi == 1
			else I18n.tf("Faltan {0} jornadas para el derbi.", [derbi]))
	var fifa: int = int(estado.get("fifa_en", 0))
	if fifa >= 1 and fifa <= HECHO_HORIZONTE:
		out.append(I18n.t("Falta una jornada para la fecha de selecciones.") if fifa == 1
			else I18n.tf("Faltan {0} jornadas para la fecha de selecciones.", [fifa]))
	return out







const RETO_ANTES: int = 12 * HORA


func _aviso_reto(estado: Dictionary, ahora_s: int) -> Array:
	var falta: int = int(estado.get("reto_vence_en", 0))
	if falta < 2 * HORA:
		return []
	var quien: String = String(estado.get("reto_de", ""))
	var a: Dictionary = _aviso("reto", I18n.tf("Reto de {0}", [quien]) if quien != "" \
			else I18n.t("Tienes un reto"), I18n.t("Se acaba pronto: juégalo antes de que venza."), 1)
	a["segundos"] = maxi(falta - RETO_ANTES, HORA)
	if ahora_s >= 0:
		var en_ventana: int = _en_ventana(int(a["segundos"]), ahora_s)
		if en_ventana <= falta - HORA / 2:
			a["segundos"] = en_ventana
	return [a]


func _aviso(id: String, titulo: String, cuerpo: String, horas: int) -> Dictionary:
	return {"id": id, "titulo": titulo, "cuerpo": cuerpo, "segundos": horas * HORA}






func _en_ventana(segundos: int, ahora_s: int) -> int:
	var cae: int =(ahora_s + segundos) % DIA
	var desde: int = VENTANA_DESDE * HORA
	if cae < desde:
		return segundos + desde - cae
	if cae >= VENTANA_HASTA * HORA:
		return segundos + DIA - cae + desde
	return segundos




func hora_local_s() -> int:
	var t: Dictionary = Time.get_time_dict_from_system()
	return int(t["hour"]) * HORA + int(t["minute"]) * 60 + int(t["second"])









func reprogramar() -> int:
	if not disponible() or permiso() != CONCEDIDO or not Settings.avisos:
		return 0


	if GameState.readonly_save:
		return 0
	_puente.call("cancelar_todas")
	var n: int = 0
	for a in avisos_de(estado_actual(), hora_local_s()):
		if bool(_puente.call("programar", String(a["id"]), String(a["titulo"]),
				String(a["cuerpo"]), int(a["segundos"]))):
			n += 1
	return n






const LIGA_ANTES: int = 24 * HORA


func _aviso_liga(estado: Dictionary, ahora_s: int) -> Array:
	var falta: int = int(estado.get("liga_termina_en", 0))
	if falta < 2 * HORA:
		return []
	var pos: int = int(estado.get("liga_puesto", 0))
	var a: Dictionary = _aviso("liga", I18n.tf("Liga {0}: último día", [String(estado.get("liga_codigo", ""))]),
		I18n.tf("Vas {0}º. Aún puedes remontar.", [pos]) if pos > 0
			else I18n.t("Aún puedes sumar antes del final."), 1)
	a["segundos"] = maxi(falta - LIGA_ANTES, HORA)
	if ahora_s >= 0:
		var en_ventana: int = _en_ventana(int(a["segundos"]), ahora_s)
		if en_ventana <= falta - HORA / 2:
			a["segundos"] = en_ventana
	return [a]



func _liga_que_acaba() -> Dictionary:
	var ahora: int = int(Time.get_unix_time_from_system())
	var mejor: Dictionary = {}
	for l in Nube.ligas:
		if int(l.termina) > ahora and (mejor.is_empty() or int(l.termina) < int(mejor.termina)):
			mejor = l
	if mejor.is_empty():
		return {}
	var pos: int = 0
	for f in Amigos.tabla_liga(Nube.tablas_liga.get(String(mejor.id), []), "ga"):
		if bool(f.get("yo", false)) and not bool(f.get("espera", false)):
			pos = int(f.get("pos", 0))
	return {"liga_termina_en": int(mejor.termina) - ahora, "liga_codigo": String(mejor.codigo),
		"liga_puesto": pos}




func estado_actual() -> Dictionary:
	var reto: Dictionary = Amigos.reto_que_vence()
	var del_reto: Dictionary = {} if reto.is_empty() else {
		"reto_vence_en": int(reto.vence) - int(Time.get_unix_time_from_system()),
		"reto_de": String(reto.quien)}
	del_reto.merge(_liga_que_acaba())
	if Career.player_name.is_empty() or Career.retired:
		return {"jugando": false}.merged(del_reto)





	var club: String = ""
	if GameState.player_team_id != "":
		club = Competitions.demarca(String(
			Teams.by_id(GameState.player_team_id).get("name", "")))
	return {
		"jugando": true,
		"club": club,
		"ofertas": Career.offers_expiring_today(),
		"cumple_hoy": Career.birthday_due_now(),
		"lesion_vuelve_en": Career.injury_weeks,
		"partido": _partido_del_dia(),
		"derbi_en": _derbi_jornadas_hasta(),
		"fifa_en": _fifa_jornadas_hasta(),

		"pendiente": I18n.tf("Tu temporada con el {0} sigue a medias.", [club]) if club != "" else "",
	}.merged(del_reto)








func _partido_del_dia() -> String:
	if Career.retired or Career.free_agent:
		return ""
	var d: Dictionary = Career.jornada_decisiva()
	if not d.is_empty():
		match String(d.get("tipo", "")):
			"ascenso":
				return I18n.t("Te juegas el ascenso")
			"salvacion":
				return I18n.t("Te juegas la salvación")
		return I18n.t("Te juegas el título")
	var fx: Dictionary = GameState.current_fixture()
	var opp: String = String(fx.get("opp", ""))
	if opp.is_empty() or not Career.is_derby(opp):
		return ""


	var rival: Dictionary = Nations.as_team(opp) if String(fx.get("comp", "")) == "nat" \
			else Teams.by_id(opp)
	var nombre: String = Nations.team_label(rival)
	return I18n.t("Te espera el derbi") if nombre.is_empty() \
			else I18n.tf("Derbi ante {0}", [nombre])






func _derbi_jornadas_hasta() -> int:
	if Career.free_agent:
		return 0
	var cal: Array = GameState.calendar
	var n: int = 0
	var i: int = GameState.season_day
	while i < cal.size() and n <= HECHO_HORIZONTE:
		var f: Dictionary = cal[i]
		if not bool(f.get("dead", false)):
			var opp: String = String(f.get("opp", ""))
			if n >= 1 and String(f.get("comp", "")) != "nat" and opp != "" \
					and Career.is_derby(opp):
				return n
			n += 1
		i += 1
	return 0



func _fifa_jornadas_hasta() -> int:
	if Career.nat_retired or Career.nationality.is_empty():
		return 0
	return maxi(Avisos.nat_jornadas_hasta(), 0)


func _notification(what: int) -> void:



	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_WM_CLOSE_REQUEST:
		reprogramar()
