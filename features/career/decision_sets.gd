class_name DecisionSets
extends RefCounted




















const PRENSA: String = "prensa"


const BANQUILLO: String = "banquillo"

const CAMPO: String = "campo"

const ENFERMERIA: String = "enfermeria"



const NOCHE: String = "noche"


const VESTUARIO: String = "vestuario"


const CASA: String = "casa"


const CALLE: String = "calle"


const PLATO: String = "plato"


const RESTAURANTE: String = "restaurante"


const BAR: String = "bar"


const GALERIA: String = "galeria"





const DESPACHO: String = "despacho"



const ASAMBLEA: String = "asamblea"

const ALL: Array[String] = [PRENSA, BANQUILLO, CAMPO, ENFERMERIA, NOCHE,
	VESTUARIO, CASA, CALLE, PLATO, RESTAURANTE, BAR, GALERIA, DESPACHO, ASAMBLEA]



const MAP: Dictionary = {

	"entrevista": PLATO, "polemica": PRENSA, "acto_marca": PLATO,
	"charla": VESTUARIO, "asado": VESTUARIO,


	"reconversion": VESTUARIO,





	"socio_penal": VESTUARIO, "socio_prensa": PRENSA, "socio_cena": CASA,




	"socio_suplente": BANQUILLO, "socio_bronca": VESTUARIO,
	"socio_rehab": ENFERMERIA, "socio_padrino": RESTAURANTE,




	"socio_secreto": VESTUARIO, "socio_gol": CAMPO,
	"socio_dinero": CASA, "socio_despedida": VESTUARIO, "socio_tele": PLATO,








	"nino_tunel": CAMPO, "botas_espuma": VESTUARIO,
	"abrazo_banda": BANQUILLO, "pizarra_sin_ti": VESTUARIO,
	"ultimatum": BANQUILLO, "ultimatum_win": BANQUILLO,
	"ultimatum_fail": BANQUILLO,

	"capitan_encara": VESTUARIO,


	"micro_derbi": PRENSA, "micro_retractar": PRENSA,


	"comunicado": PRENSA,





	"rival_sin_estrella": PRENSA, "prensa_rival_lanzado": PRENSA,
	"prensa_rival_herido": PRENSA, "prensa_tecnico_nuevo": PRENSA,
	"prensa_ex_tecnico": PRENSA, "prensa_fichaje_rival": PRENSA,
	"prensa_campeon_pais": PRENSA,
	"hospital": CALLE, "fiesta": NOCHE,


	"casa_vecinos": CALLE, "casa_mascota": CASA, "casa_asado": CASA,
	"casa_piscina": CASA, "casa_vitrina": CASA,

	"ps4_o_dt": CASA, "plato_o_descanso": PLATO, "aficion_o_prensa": CALLE,
	"agente_o_dt": CASA, "gym_o_marca": ENFERMERIA, "equipo_o_casa": CASA,
	"capitan": VESTUARIO, "vida_privada": CASA, "baile_redes": CASA,
	"rondo_hijo": CAMPO, "autografo_lluvia": CALLE, "micro_polemica": PRENSA,
	"paparazzi": CALLE,

	"bus_nuevo": CALLE, "primera_entrevista": PRENSA, "dedica_gol": CAMPO,
	"dia_libre_triple": CASA, "foto_equipo": CAMPO, "marcas_triple": PLATO,
	"redes_triple": CASA,

	"cantar_o_bailar": VESTUARIO, "keepie": CAMPO, "fifa_estrella": CASA,
	"casino_agente": NOCHE, "pronostico_tv": PLATO, "penalti_reto": CAMPO,
	"karaoke": NOCHE, "baile_gol": CAMPO, "dardos": NOCHE,

	"ronda_victoria": NOCHE, "heroe_victoria": PRENSA,



	"culpables_derrota": BANQUILLO, "bronca_capitan": VESTUARIO,
	"micro_derrota": PRENSA, "ciudad_derbi": CALLE, "reto_derbi": VESTUARIO,
	"medico_o_mister": ENFERMERIA, "benefico_ciudad": CALLE,


	"tifo_derbi": CAMPO,




	"dorsal": VESTUARIO, "dorsal_libre": VESTUARIO,
	"presi_victoria": VESTUARIO,



	"discurso_nuevo": VESTUARIO, "casa_nueva": CASA,




	"plante_minutos": BANQUILLO, "motin_vestuario": VESTUARIO,
	"filtracion_renovacion": CASA, "policia_del_brazalete": VESTUARIO,
	"marca_apuestas": PLATO,







	"huelga_primas": VESTUARIO, "final_lesionado": ENFERMERIA,
	"equipo_viaja": ENFERMERIA, "parte_filtrado": ENFERMERIA,
	"medico_agente": ENFERMERIA,
	"rebaja_crack": CASA, "bando_brazalete": VESTUARIO,
	"entrada_entreno": CAMPO, "suplente_mejor": BANQUILLO,
	"camiseta_rival": CALLE,


	"rival_lesionado": ENFERMERIA, "capitan_te_cita": VESTUARIO,



	"capitan_penales": VESTUARIO, "tecnico_nueve": BANQUILLO,






	"nat_debut": VESTUARIO, "nat_seleccionador": BANQUILLO,
	"nat_doble_agenda": VESTUARIO, "nat_gol_pais": CAMPO,
	"nat_prensa_pais": PRENSA, "nat_suplente": BANQUILLO,




	"castigo_final": CAMPO, "castigo_objetivo": VESTUARIO,
	"castigo_goleada": BANQUILLO, "castigo_derbi": CALLE,
	"castigo_ridiculo": PRENSA,





	"premio_titulo": CAMPO, "premio_ascenso": CALLE,
	"premio_balon": PLATO, "premio_mvp": PLATO,



	"premio_estadio": PLATO,





	"pedi_salir_vestuario": VESTUARIO, "pedi_salir_grada": CAMPO,
	"en_venta_prensa": PRENSA,







	"ojeador_grada": PRENSA, "companero_curro": CALLE, "cancha_tierra": CAMPO,
	"documental": CASA, "clausula_portada": PRENSA,
	"penalti_no_tirado": BANQUILLO, "pizarra_racha": VESTUARIO,
	"suplente_aplauso": BANQUILLO,





	"momento_mvp": PRENSA, "momento_lesion": ENFERMERIA,

	"momento_penal": PRENSA,

	"momento_zasca": CASA,
	"momento_pique": CASA,
	"momento_retiro": ENFERMERIA,






	"momento_companero": VESTUARIO,



	"momento_senalado": VESTUARIO,



	"momento_trivia": VESTUARIO,



	"mercado_interes": PRENSA,



	"mercado_doble": PLATO,





	"club_te_vende": VESTUARIO, "club_proyecto": VESTUARIO, "club_impago": VESTUARIO, "club_huelga": VESTUARIO,


	"club_administrador": DESPACHO,
	"club_acciones": DESPACHO,


	"club_rebaja": VESTUARIO,

	"club_asamblea": ASAMBLEA,

	"club_fin_socios": ASAMBLEA,














	"cita_cena": RESTAURANTE,
	"cita_copa": BAR,
	"cita_arte": GALERIA,


	"pareja_dinero": CASA,









	"pareja_fiesta_equipo": BAR,
	"pareja_palco": CAMPO,
	"pareja_campana": PLATO,
	"pareja_cena_negocios": RESTAURANTE,
	"pareja_video": CASA,
	"pareja_prensa_dos": PLATO,



	"pareja_r_casera": CASA,
	"pareja_r_ambiciosa": RESTAURANTE,
	"pareja_r_celosa": CASA,
	"pareja_r_independiente": CASA,
	"pareja_r_hincha": CAMPO,
	"pareja_r_reservada": CALLE,
	"pareja_r_companera": CASA,
	"pareja_r_cazafortunas": CASA,
	"pareja_r_millonaria": RESTAURANTE,



	"pareja_r_casera_padres": CASA,
	"pareja_r_casera_pueblo": CALLE,
	"pareja_r_fiestera_isla": BAR,
	"pareja_r_fiestera_foto": CASA,
	"pareja_r_ambiciosa_mesa": RESTAURANTE,
	"pareja_r_ambiciosa_marca": GALERIA,
	"pareja_r_celosa_mensaje": CASA,
	"pareja_r_celosa_fisio": CASA,
	"pareja_r_independiente_expo": GALERIA,
	"pareja_r_independiente_no": CASA,
	"pareja_r_hincha_pena": BAR,
	"pareja_r_hincha_coche": CASA,
	"pareja_r_reservada_nombre": CASA,
	"pareja_r_reservada_valla": CASA,
	"pareja_r_cazafortunas_cuenta": CASA,
	"pareja_r_cazafortunas_escaparate": CALLE,
	"pareja_r_companera_examen": CASA,
	"pareja_r_companera_cena": CASA,
	"pareja_r_millonaria_avion": CALLE,
	"pareja_r_millonaria_padre": RESTAURANTE,


	"pareja_c_luna": CASA,
	"pareja_c_navidad": CASA,
	"pareja_c_primera": RESTAURANTE,
	"pareja_c_fotos": PLATO,
	"pareja_c_anos": CASA,

	"pareja_ex_prensa": PLATO,
	"pareja_ex_encuentro": RESTAURANTE,


	"pareja_aniversario": RESTAURANTE,


	"pareja_boda": RESTAURANTE,
	"pareja_prenup": CASA,

	"pareja_escrituras": CASA,


	"pareja_frio_a": CASA,
	"pareja_frio_b": CASA,
	"pareja_frio_c": CASA,
	"pareja_divorcio": CASA,
	"pareja_caza_tasacion": CASA,


	"pareja_viaje": CASA,
	"pareja_lesion": ENFERMERIA,
	"pareja_conocer": RESTAURANTE,
	"pareja_presentan": BAR,
	"pareja_galeria": GALERIA,
	"pareja_puerta": CALLE,

	"pareja_fiesta": BAR,


	"pareja_gira": VESTUARIO,
	"pareja_concentracion": VESTUARIO,


	"pareja_foto": PLATO,




	"pareja_mudanza": CASA,
	"pareja_cumple": CASA,
	"pareja_bronca": CASA,
	"pareja_esperando": CASA,
	"ruptura": CASA,


	"pareja_cita": RESTAURANTE,
}


















const WEAR_KIT: String = "uniforme"
const WEAR_CASUAL: String = "casual"
const WEAR_SUIT: String = "traje"






const WEAR: Dictionary = {
	CAMPO: WEAR_KIT, BANQUILLO: WEAR_KIT, VESTUARIO: WEAR_KIT,
	PRENSA: WEAR_KIT, ENFERMERIA: WEAR_KIT,


	CALLE: WEAR_KIT,
	CASA: WEAR_CASUAL, NOCHE: WEAR_CASUAL,
	PLATO: WEAR_SUIT,




	RESTAURANTE: WEAR_CASUAL, BAR: WEAR_CASUAL, GALERIA: WEAR_SUIT,


	DESPACHO: WEAR_CASUAL,

	ASAMBLEA: WEAR_CASUAL,
}




static func wear_of(ev: Dictionary, set_key: String) -> String:
	var w: String = String(ev.get("wear", ""))
	if not w.is_empty():
		return w
	return String(WEAR.get(set_key, WEAR_KIT))




const BY_REL: Dictionary = {
	"prensa": PRENSA, "tecnico": VESTUARIO, "equipo": VESTUARIO,
	"aficion": CALLE, "agente": CASA,




	"pareja": CASA,
}






static func set_of(id: String, ev: Dictionary = {}) -> String:
	if MAP.has(id):
		return String(MAP[id])
	var tally: Dictionary = {}
	for key in ["a", "b", "c"]:
		if ev.has(key):
			_tally(ev[key].get("fx", {}), tally)
	var best: String = ""
	var best_abs: float = -1.0
	for k in tally:
		if absf(float(tally[k])) > best_abs:
			best_abs = absf(float(tally[k]))
			best = String(k)
	return String(BY_REL.get(best, CAMPO))




static func _tally(fx: Dictionary, tally: Dictionary) -> void:
	if fx.has("risk"):
		var risk: Dictionary = fx["risk"]
		_tally(risk.get("win", {}), tally)
		_tally(risk.get("lose", {}), tally)
		return
	var rels: Dictionary = fx.get("rel", {})
	for k in rels:
		tally[k] = float(tally.get(k, 0.0)) + float(rels[k])
