class_name Escenas





























const GLORIA: String = "gloria"
const DUELO: String = "duelo"
const MOMENTOS: String = "momentos"



const IDOLO: String = "idolo"


const GRUPOS: Array[String] = [GLORIA, DUELO, MOMENTOS, IDOLO]



const THUMB_DIR: String = "res://assets/ui/escenas/"









const ALL: Array[Dictionary] = [

	{"kind": Ceremonies.PROMOTION, "grupo": GLORIA, "name": "EL ASCENSO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.TROPHY, "grupo": GLORIA, "name": "LA VUELTA CON LA COPA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.GALA, "grupo": GLORIA, "name": "LA GALA DEL JUGADOR DEL AÑO", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.POTS, "grupo": GLORIA, "name": "JUGADOR DEL AÑO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.MOTM, "grupo": GLORIA, "name": "JUGADOR DEL MES", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.CLUB_GALA, "grupo": GLORIA, "name": "LA GALA DEL CLUB", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.LEAGUE_GALA, "grupo": GLORIA, "name": "LA GALA DE LA LIGA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.CHICO_GALA, "grupo": GLORIA, "name": "LA GALA DEL CHICO DE ORO", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.MVP, "grupo": GLORIA, "name": "FIGURA DEL PARTIDO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.RECORD, "grupo": GLORIA, "name": "EL RECORD", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.GOAL, "grupo": GLORIA, "name": "TU PRIMER GOL", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.LEGEND, "grupo": GLORIA, "name": "LA LEYENDA TE SALUDA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.HISTORIA, "grupo": GLORIA, "name": "TU SITIO EN LA HISTORIA", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.STADIUM_NAME, "grupo": GLORIA, "name": "EL ESTADIO CON TU NOMBRE", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.HOMENAJE, "grupo": GLORIA, "name": "EL HOMENAJE", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.PARADE, "grupo": GLORIA, "name": "EL DESFILE", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.BALCON, "grupo": GLORIA, "name": "EL BALCON DEL AYUNTAMIENTO", "rare": Achievements.RARE_EPIC},

	{"kind": Ceremonies.TU_VITRINA, "grupo": GLORIA, "name": "TU VITRINA", "rare": Achievements.RARE_COMMON},

	{"kind": Ceremonies.PRESENTA_TITULO, "grupo": GLORIA, "name": "PRESENTACIÓN DEL TÍTULO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.VUELTA_HONOR, "grupo": GLORIA, "name": "LA VUELTA DE HONOR", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.PENA, "grupo": GLORIA, "name": "LA PEÑA DEL BARRIO", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.CIUDAD, "grupo": GLORIA, "name": "TU CARA EN LA CIUDAD", "rare": Achievements.RARE_EPIC},

	{"kind": Ceremonies.FIRMA_VALLA, "grupo": GLORIA, "name": "FIRMAS BAJO LA VALLA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.PANTALLAS, "grupo": GLORIA, "name": "LAS PANTALLAS DE NUEVA YORK", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.VUELO, "grupo": GLORIA, "name": "LA COPA VUELVE EN AVION", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.OVACION, "grupo": GLORIA, "name": "LA OVACION AJENA", "rare": Achievements.RARE_RARE},

	{"kind": Ceremonies.FANTASY, "grupo": GLORIA, "name": "EL CAPITÁN DEL FANTASY", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.CHANT, "grupo": GLORIA, "name": "TU CANTO EN LA GRADA", "rare": Achievements.RARE_RARE},


	{"kind": Ceremonies.TRUENO, "grupo": GLORIA, "name": "EL TRUENO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.RIVAL_GUARD, "grupo": GLORIA, "name": "EL PASILLO DEL RIVAL", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.CAPTAIN, "grupo": GLORIA, "name": "EL BRAZALETE", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.CALLUP, "grupo": GLORIA, "name": "LA PRIMERA CONVOCATORIA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.WC_CALLUP, "grupo": GLORIA, "name": "LA LISTA DEL MUNDIAL", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.OLD_NUMBER, "grupo": GLORIA, "name": "TU VIEJO DORSAL", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.BAR, "grupo": GLORIA, "name": "EL BAR DEL BARRIO", "rare": Achievements.RARE_RARE},

	{"kind": Ceremonies.RELEGATION, "grupo": DUELO, "name": "EL DESCENSO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.NAT_QUAL_KO, "grupo": DUELO, "name": "FUERA DEL TORNEO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.NAT_QUAL_OK, "grupo": GLORIA, "name": "CLASIFICADOS", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.RUNNER_UP, "grupo": DUELO, "name": "SUBCAMPEON", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.FINAL_LOST, "grupo": DUELO, "name": "LA FINAL PERDIDA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.LAST, "grupo": DUELO, "name": "LA ULTIMA TARDE", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.INJURY, "grupo": DUELO, "name": "LA LESION", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.HOOKED, "grupo": DUELO, "name": "TE SACAN DEL CAMPO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.BENCH, "grupo": DUELO, "name": "LA PRIMERA BANCA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.PITADA, "grupo": DUELO, "name": "LA PITADA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.COACH_OUT, "grupo": DUELO, "name": "EL TECNICO SE VA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.STAR_GONE, "grupo": DUELO, "name": "LA TAQUILLA VACIA", "rare": Achievements.RARE_RARE},

	{"kind": Ceremonies.FFP_SANCION, "grupo": DUELO, "name": "SANCION DE FAIR PLAY", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.FALLO_UEFA, "grupo": DUELO, "name": "EL FALLO EUROPEO", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.ESTADIO_VENDIDO, "grupo": DUELO, "name": "EL ESTADIO SE VENDE", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.CONCURSO, "grupo": DUELO, "name": "EL CONCURSO DE ACREEDORES", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.AL_RIVAL, "grupo": DUELO, "name": "SE FUE AL RIVAL", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.ENEMY_RETURN, "grupo": DUELO, "name": "LA VUELTA AL CAMPO ENEMIGO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.VERDUGO, "grupo": DUELO, "name": "EL RECIBIMIENTO AL VERDUGO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.LOCKER, "grupo": DUELO, "name": "LA DESPEDIDA DEL VESTUARIO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.LAST_HOME, "grupo": DUELO, "name": "EL ULTIMO PARTIDO EN CASA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.NAT_RETIRE, "grupo": DUELO, "name": "EL ADIOS A LA SELECCION", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.GUARD, "grupo": DUELO, "name": "EL PASILLO DE HONOR", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.ADIOS, "grupo": DUELO, "name": "EL ADIOS", "rare": Achievements.RARE_EPIC},

	{"kind": Ceremonies.SIGNING, "grupo": MOMENTOS, "name": "LA PRESENTACION", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.WELCOME, "grupo": MOMENTOS, "name": "LA BIENVENIDA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.LLEGADA, "grupo": MOMENTOS, "name": "LA LLEGADA AL AEROPUERTO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.CONTRACT, "grupo": MOMENTOS, "name": "LA FIRMA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.CLUB_LEVEL, "grupo": MOMENTOS, "name": "TU NIVEL EN EL CLUB", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.PRESSER, "grupo": MOMENTOS, "name": "LA RUEDA DE PRENSA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.PRE_PRESSER, "grupo": MOMENTOS, "name": "LA PREGUNTA DEL PRECONTRATO", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.OJEADOR, "grupo": MOMENTOS, "name": "EL OJEADOR EN LA TRIBUNA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.REFUERZO, "grupo": MOMENTOS, "name": "LLEGA EL REFUERZO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.FICHAJES_VERANO, "grupo": MOMENTOS, "name": "LOS FICHAJES DEL VERANO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.FOTO_EQUIPO, "grupo": MOMENTOS, "name": "LA FOTO OFICIAL", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.AUTOGRAFOS, "grupo": MOMENTOS, "name": "LOS AUTOGRAFOS EN LA PUERTA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.FIRMAS_GRADA, "grupo": MOMENTOS, "name": "LAS FIRMAS EN LA GRADA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.FIRMA_FOTOS, "grupo": MOMENTOS, "name": "LA FIRMA DE FOTOS", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.CAMISETA_LANZADA, "grupo": MOMENTOS, "name": "TU CAMISETA A LA GRADA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.PIZARRA_TECNICO, "grupo": MOMENTOS, "name": "LA PIZARRA DEL MÍSTER", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.TERTULIA, "grupo": MOMENTOS, "name": "LA TERTULIA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.PARTE_MEDICO, "grupo": MOMENTOS, "name": "PARTE MÉDICO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.TELE_VUELTA, "grupo": MOMENTOS, "name": "CON ÉL Y SIN ÉL", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.MOVIOLA, "grupo": MOMENTOS, "name": "LA MOVIOLA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.RACHA_TELE, "grupo": MOMENTOS, "name": "LA RACHA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.ONCE_TELE, "grupo": MOMENTOS, "name": "EL ONCE DE LA TELE", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.LISTA_TELE, "grupo": MOMENTOS, "name": "LA LISTA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.ENCUENTRO_FAN, "grupo": MOMENTOS, "name": "UN FAN TE PARA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.PACTADO, "grupo": MOMENTOS, "name": "JUEGAS O DESCANSAS", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.BANCA_PACTADA, "grupo": MOMENTOS, "name": "POR SI HACE FALTA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.BANCA_CHINCHANPU, "grupo": MOMENTOS, "name": "CHIN CHAN PU", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.BANCA_BOTELLA, "grupo": MOMENTOS, "name": "BOTELLA DE PIE", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.BANCA_DOMINADAS, "grupo": MOMENTOS, "name": "DOMINADAS", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.PREVIA_PECHO_VOLEA, "grupo": MOMENTOS, "name": "CONTROL Y VOLEA", "rare": Achievements.RARE_RARE},


	{"kind": Ceremonies.HIMNO, "grupo": MOMENTOS, "name": "EL HIMNO", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.DIA_LIBRE, "grupo": MOMENTOS, "name": "DIA LIBRE", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.MARKET_BOARD, "grupo": MOMENTOS, "name": "SE ABRE EL MERCADO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.DEADLINE_NIGHT, "grupo": MOMENTOS, "name": "LA NOCHE DEL CIERRE", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.DEADLINE_DAY, "grupo": MOMENTOS, "name": "TU FICHAJE EN LA PORTADA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.SQUAD_TALK, "grupo": MOMENTOS, "name": "LA CHARLA CON EL COMPAÑERO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.SQUAD_LIST, "grupo": MOMENTOS, "name": "LA LISTA DE LA SELECCION", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.CUP_ROOM, "grupo": MOMENTOS, "name": "EL VESTUARIO DE COPA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.DRAW, "grupo": MOMENTOS, "name": "EL SORTEO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.DERBY_ROOM, "grupo": MOMENTOS, "name": "EL VESTUARIO DEL DERBI", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.DERBY_AFTER, "grupo": MOMENTOS, "name": "LA PORTADA DEL DERBI", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.DERBY_MARCADOR, "grupo": MOMENTOS, "name": "EL MARCADOR DEL DERBI", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.DERBY_ESPEJO, "grupo": MOMENTOS, "name": "EL ESPEJO DEL DERBI", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.DERBY_HUECO, "grupo": MOMENTOS, "name": "EL HUECO DEL DERBI", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.KEEPER_KNOWS, "grupo": MOMENTOS, "name": "EL PORTERO TE CONOCE", "rare": Achievements.RARE_COMMON},


	{"kind": Ceremonies.EX_TUNEL, "grupo": MOMENTOS, "name": "TE CONOCE DE ANTES", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.JUVENIL_DEBUT, "grupo": MOMENTOS, "name": "EL DEBUT DEL CHAVAL", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.JUVENIL_GOL, "grupo": GLORIA, "name": "SU PRIMER GOL", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.JUVENIL_CONTRATO, "grupo": MOMENTOS, "name": "SU PRIMER CONTRATO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.JUVENIL_ACADEMIA, "grupo": MOMENTOS, "name": "LA CANTERA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.JUVENIL_DORSAL, "grupo": DUELO, "name": "TU DORSAL ES SUYO", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.JUVENIL_VENDIDO, "grupo": DUELO, "name": "EL QUE SE FUE", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.JUVENIL_RIVAL, "grupo": MOMENTOS, "name": "AHORA ENFRENTE", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.JUVENIL_ENTRENO, "grupo": MOMENTOS, "name": "DESPUÉS DEL ENTRENO", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.JUVENIL_PADRINO, "grupo": MOMENTOS, "name": "SU PADRINO", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.JUVENIL_PRESENTA, "grupo": GLORIA, "name": "PRESENTADO", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.RIVAL_BOARD, "grupo": MOMENTOS, "name": "LA PIZARRA DEL RIVAL", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.SHOOTOUT, "grupo": MOMENTOS, "name": "LA TANDA DE PENALES", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.KEEPSAKE, "grupo": MOMENTOS, "name": "EL RECUERDO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.KIT_REVEAL, "grupo": MOMENTOS, "name": "LA PASARELA DE EQUIPACIONES", "rare": Achievements.RARE_COMMON},


	{"kind": Ceremonies.REHAB, "grupo": MOMENTOS, "name": "EL ALTA MEDICA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.MUDANZA, "grupo": MOMENTOS, "name": "LA MUDANZA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.BIRTHDAY, "grupo": MOMENTOS, "name": "TU CUMPLEAÑOS", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.VUELTA, "grupo": MOMENTOS, "name": "LAS OFERTAS DEL REGRESO", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.REGRESO, "grupo": MOMENTOS, "name": "LA FIRMA DEL REGRESO", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.MUSEO_EGO, "grupo": MOMENTOS, "name": "EL MUSEO DE TU EGO", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.CLASE_BAILE, "grupo": MOMENTOS, "name": "LA CLASE DE LAS ABUELAS", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.ESTRENO, "grupo": MOMENTOS, "name": "EL ESTRENO", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.TERAPIA, "grupo": MOMENTOS, "name": "TERAPIA DE MISTERS", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.CENA_EX, "grupo": MOMENTOS, "name": "LA CENA DE LAS EX", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.BARBACOA, "grupo": MOMENTOS, "name": "BARBACOA DE LOS DERROTADOS", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.CONSERJE, "grupo": MOMENTOS, "name": "EL CONSERJE DEL SALÓN", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.HUELLA_CEMENTO, "grupo": MOMENTOS, "name": "TU HUELLA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.ESTATUA, "grupo": MOMENTOS, "name": "LA ESTATUA", "rare": Achievements.RARE_LEGEND},




	{"kind": Ceremonies.PANCARTA, "grupo": MOMENTOS, "name": "LA PANCARTA CON FALTA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.TOMA7, "grupo": MOMENTOS, "name": "TOMA 7", "rare": Achievements.RARE_EPIC},

	{"kind": Ceremonies.FIRMA_TOMA7, "grupo": MOMENTOS, "name": "FIRMAS EN EL PLATÓ", "rare": Achievements.RARE_EPIC},


	{"kind": Ceremonies.ESTAMPA, "grupo": MOMENTOS, "name": "TU ESTAMPA", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.FIRMA_ESTAMPA, "grupo": MOMENTOS, "name": "FIRMAS EN EL BARRIO", "rare": Achievements.RARE_COMMON},
	{"kind": Ceremonies.CAJAS, "grupo": MOMENTOS, "name": "TU CARA EN LA CAJA", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.FIRMA_CAJAS, "grupo": MOMENTOS, "name": "FIRMAS EN EL SÚPER", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.RUTA, "grupo": MOMENTOS, "name": "TU CARA EN LA RUTA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.FIRMA_RUTA, "grupo": MOMENTOS, "name": "FIRMAS EN LA PARADA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.PORTADA, "grupo": MOMENTOS, "name": "TU PORTADA", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.FIRMA_PORTADA, "grupo": MOMENTOS, "name": "FIRMAS EN LA TIENDA", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.PALOMAS, "grupo": MOMENTOS, "name": "LAS PALOMAS NO OLVIDAN", "rare": Achievements.RARE_RARE},






	{"kind": Ceremonies.CARA_A_CARA, "grupo": MOMENTOS, "name": "CARA A CARA", "rare": Achievements.RARE_EPIC},
	{"kind": Ceremonies.DUENO_PALCO, "grupo": MOMENTOS, "name": "DUEÑO NUEVO", "rare": Achievements.RARE_RARE},

	{"kind": Ceremonies.NOCHE_ELECTORAL, "grupo": MOMENTOS, "name": "ELECCIONES EN EL CLUB", "rare": Achievements.RARE_RARE},
	{"kind": Ceremonies.FOCOS_CRISIS, "grupo": DUELO, "name": "EL CLUB ENTRA EN CRISIS", "rare": Achievements.RARE_RARE},

	{"kind": Ceremonies.SALA_JUNTAS, "grupo": MOMENTOS, "name": "LA SALA DE JUNTAS", "rare": Achievements.RARE_RARE},



	{"kind": Ceremonies.IDOLO_FAN, "grupo": IDOLO, "name": "EL FAN DE SIEMPRE", "rare": Achievements.RARE_EPIC},


	{"kind": Ceremonies.IDOLO_BALON, "grupo": IDOLO, "name": "DE MANOS DE TU IDOLO", "rare": Achievements.RARE_LEGEND, "tipos": ["leyenda"]},


	{"kind": Ceremonies.IDOLO_CONOCE, "grupo": IDOLO, "name": "LO CONOCES", "rare": Achievements.RARE_EPIC, "tipos": ["leyenda"]},


	{"kind": Ceremonies.IDOLO_FESTEJO, "grupo": IDOLO, "name": "SU FESTEJO", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.IDOLO_CONSEJO, "grupo": IDOLO, "name": "SU ULTIMO CONSEJO", "rare": Achievements.RARE_LEGEND},
	{"kind": Ceremonies.IDOLO_CAMISETA, "grupo": IDOLO, "name": "SU CAMISETA", "rare": Achievements.RARE_LEGEND},


	{"kind": Ceremonies.IDOLO_AHIJADO, "grupo": IDOLO, "name": "LA ENTREVISTA AL REVES", "rare": Achievements.RARE_LEGEND},



	{"kind": Ceremonies.IDOLO_RIVAL, "grupo": IDOLO, "name": "CONTRA TU IDOLO", "rare": Achievements.RARE_EPIC, "tipos": ["activo"]},



	{"kind": Ceremonies.IDOLO_FICHA, "grupo": IDOLO, "name": "FICHA CONTIGO", "rare": Achievements.RARE_EPIC, "tipos": ["activo"]},



	{"kind": Ceremonies.IDOLO_DISCIPULO, "grupo": IDOLO, "name": "EL DISCIPULO YA ES MEJOR", "rare": Achievements.RARE_LEGEND, "tipos": ["activo"]},




	{"kind": Ceremonies.IDOLO_DESPEDIDA, "grupo": IDOLO, "name": "SU DESPEDIDA", "rare": Achievements.RARE_LEGEND, "tipos": ["activo"]},
]


static func of_grupo(grupo: String) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for e in ALL:
		if String(e.get("grupo", "")) == grupo:
			out.append(e)
	return out



static func total() -> int:
	var n: int = 0
	for e in ALL:
		if not DEL_IDOLO.has(String(e.get("kind", ""))):
			n += 1
	return n








const SECRETAS: Array[String] = [Ceremonies.MUSEO_EGO, Ceremonies.CLASE_BAILE, Ceremonies.ESTRENO,
	Ceremonies.TERAPIA, Ceremonies.CENA_EX, Ceremonies.BARBACOA,
	Ceremonies.CONSERJE, Ceremonies.ESTATUA]












const DEL_IDOLO: Array[String] = [Ceremonies.IDOLO_FAN, Ceremonies.IDOLO_BALON,
	Ceremonies.IDOLO_CONOCE, Ceremonies.IDOLO_FESTEJO, Ceremonies.IDOLO_CONSEJO,
	Ceremonies.IDOLO_CAMISETA, Ceremonies.IDOLO_AHIJADO, Ceremonies.IDOLO_RIVAL,
	Ceremonies.IDOLO_FICHA, Ceremonies.IDOLO_PALCO, Ceremonies.IDOLO_DISCIPULO,
	Ceremonies.IDOLO_DESPEDIDA]






static func del_idolo_para(tipo: String) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for e in ALL:
		var k: String = String(e.get("kind", ""))
		if not DEL_IDOLO.has(k):
			continue
		var tipos: Variant = e.get("tipos", null)
		if tipos is Array and not (tipos as Array).has(tipo) \
				and not Career.escenas_vividas.has(k):
			continue
		out.append(e)
	return out



static func completas(vividas: Dictionary) -> bool:
	for e in ALL:
		var k: String = String(e.get("kind", ""))
		if not SECRETAS.has(k) and not DEL_IDOLO.has(k) and not vividas.has(k):
			return false
	return true


static func has(kind: String) -> bool:
	for e in ALL:
		if String(e.get("kind", "")) == kind:
			return true
	return false





static func vividas_count() -> int:
	var n: int = 0
	for e in ALL:
		var k: String = String(e.get("kind", ""))
		if not DEL_IDOLO.has(k) and Career.escenas_vividas.has(k):
			n += 1
	return n


static func thumb_path(kind: String) -> String:
	return THUMB_DIR + kind + ".png"













const APARTE: Array[String] = [Ceremonies.FLASHBACK]


const RECUERDO: String = "recuerdo:"



static func recuerdos() -> Array[String]:
	var out: Array[String] = []
	out.assign(Flashback.ORDEN)
	return out


static func id_recuerdo(momento: String) -> String:
	return RECUERDO + momento


static func es_recuerdo(id: String) -> bool:
	return id.begins_with(RECUERDO)


static func momento_de(id: String) -> String:
	return id.trim_prefix(RECUERDO)




static func recuerdo_visto(momento: String) -> bool:
	return Flashback.ORDEN.has(momento) and Career.flashbacks_vistos.has(momento)




static func thumb_recuerdo(momento: String) -> String:
	return THUMB_DIR + Ceremonies.FLASHBACK + "_" + momento + ".png"





static func payload_recuerdo(momento: String) -> Dictionary:
	return {"kind": Ceremonies.FLASHBACK, "momento": momento, "nation": Career.nationality,
		"div": 1}
