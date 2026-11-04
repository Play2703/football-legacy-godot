class_name WeekEvents
extends RefCounted



































const EVENT_P: float = 0.2









const PAREJA_ACTIVA: bool = true









const VETO_JORNADAS: int = 15





const CONOCER: Array[String] = [
	"pareja_conocer", "pareja_presentan", "pareja_galeria", "pareja_puerta",
]















const PESO_CONOCER: float = 4.0


























const PESO_CITA: float = 8.0










const PAREJA_EXTRA_P: float = 0.1









const FRANJA_ARCO: Array = ["pareja_boda", "pareja_prenup", "pareja_escrituras",
	"pareja_frio_a", "pareja_frio_b", "pareja_frio_c", "pareja_divorcio"]

static func _va_en_la_franja(id: String) -> bool:
	return CONOCER.has(id) or id in ["cita_cena", "cita_copa", "cita_arte"] \
			or FRANJA_ARCO.has(id)













const PESO_ARCO: float = 4.0





const PESO_RASGO: float = 0.5


const PESO_CASADOS: float = 0.6




const VETO_OTRO_ANO: int = 30

const CATALOG: Array = [
	{"id": "entrevista", "title": "TE QUIEREN EN EL PLATÓ",
		"desc": "La televisión te invita a la entrevista de la semana. Media tarde de foco, preguntas y sonrisas.",
		"a": {"label": "ACUDIR", "fx": {"action": true, "energy": -8.0,
			"rel": {"prensa": 6.0, "aficion": 2.0}}},
		"b": {"label": "PLANTARLES", "fx": {"rel": {"prensa": -3.0, "tecnico": 2.0}}}},


	{"id": "acto_marca", "title": "ACTO DE TU PATROCINADOR", "req": "sponsor",
		"wear": "casual",
		"desc": "Tu marca monta una firma de autógrafos y te quiere ahí. Pagan aparte, pero es un día entero.",
		"a": {"label": "IR AL ACTO", "fx": {"action": true, "energy": -6.0,
			"money_sponsor": 3.0, "rel": {"prensa": 3.0}}},
		"b": {"label": "EXCUSARTE", "fx": {"rel": {"prensa": -2.0}, "money_sponsor": -1.0}}},
	{"id": "asado", "title": "ASADO DEL VESTUARIO",
		"desc": "Los veteranos organizan un asado y te toca poner la carne. Caro, pero ahí se hacen los amigos.",
		"a": {"label": "PAGAR EL ASADO", "fx": {"action": true, "money_wage": -1.5,
			"rel": {"equipo": 8.0}}},
		"b": {"label": "NO HAY TIEMPO", "fx": {"rel": {"equipo": -2.0}}}},












	{"id": "reconversion", "title": "EL MÍSTER TIENE UNA IDEA",
		"when": "reconversion", "not": ["newcomer"], "names": ["puesto_nuevo"],
		"desc": "Te enseña la pizarra con tu nombre fuera de tu sitio de siempre: te ve de {0}. Dice que ahí hay hueco y que lo llenas tú.",
		"a": {"label": "ACEPTAR EL CAMBIO", "fx": {"pos_switch": true,
			"rel": {"tecnico": 6.0, "equipo": 2.0}}},
		"b": {"label": "PEDIR GARANTÍAS", "fx": {"risk": {"p": 0.55,
			"win": {"pos_switch": true, "rel": {"tecnico": 9.0}},
			"lose": {"rel": {"tecnico": -6.0}},
			"win_msg": "Te promete el puesto y los minutos.",
			"lose_msg": "No le gustó que le pusieras condiciones."}}},
		"c": {"label": "SEGUIR EN LO TUYO", "fx": {"rel": {"tecnico": -7.0}}}},
	{"id": "charla", "title": "EL TÉCNICO TE LLAMA",
		"desc": "Puerta cerrada. Puedes escuchar y asentir, o jugártela y pedirle más protagonismo.",
		"a": {"label": "ESCUCHAR", "fx": {"rel": {"tecnico": 4.0}}},
		"b": {"label": "PEDIR MÁS", "fx": {"risk": {"p": 0.5,
			"win": {"rel": {"tecnico": 8.0}}, "lose": {"rel": {"tecnico": -6.0}},
			"win_msg": "¡El técnico te compra la idea!",
			"lose_msg": "Mala lectura: al técnico no le gustó."}}}},
	{"id": "hospital", "title": "VISITA A LA CANTERA", "wear": "casual",
		"desc": "El club organiza una visita a los niños de la cantera y del hospital. Nadie te obliga.",
		"a": {"label": "IR", "fx": {"action": true, "energy": -5.0,
			"rel": {"aficion": 7.0}}},
		"b": {"label": "DESCANSAR", "fx": {}}},


	{"id": "polemica", "title": "UN MICRÓFONO CALIENTE", "when": "benched",
		"desc": "Un periodista te tienta: '¿de verdad estás contento con tu papel en el equipo?'",
		"a": {"label": "MORDERTE LA LENGUA", "fx": {"rel": {"tecnico": 3.0}}},


		"b": {"label": "SOLTARLO", "fx": {"multa": 1.0, "rel": {"prensa": 8.0, "aficion": 3.0,
			"tecnico": -7.0}}}},











	{"id": "nino_tunel", "title": "TE ESPERAN EN EL TÚNEL", "when": "aficion_idolo",
		"wear": "uniforme",
		"desc": "Un crío con tu nombre en la espalda lleva media hora esperando en la boca del túnel. Su padre le dice que no molestes, que ya vas tarde.",
		"a": {"label": "PARARTE CON ÉL", "fx": {"energy": -2.0,
			"rel": {"aficion": 9.0, "prensa": 4.0}}},
		"b": {"label": "SALUDAR Y SEGUIR", "fx": {"rel": {"aficion": 2.0}}}},
	{"id": "botas_espuma", "title": "TU CASILLERO NO ESTÁ COMO LO DEJASTE",
		"when": "equipo_unido", "wear": "uniforme",
		"desc": "Llegas al vestuario y tu hueco está lleno de espuma hasta arriba. Nadie te mira, pero nadie está haciendo nada tampoco.",
		"a": {"label": "SEGUIRLES EL JUEGO", "fx": {"rel": {"equipo": 8.0,
			"tecnico": 2.0}}},
		"b": {"label": "LIMPIAR EN SILENCIO", "fx": {"rel": {"equipo": -2.0}}}},
	{"id": "abrazo_banda", "title": "TE PARA EN LA BANDA", "when": "tecnico_padre",
		"wear": "uniforme",
		"desc": "Te sustituye, y en vez de darte la mano y mirar al campo te para, te dice algo al oído y te abraza hasta que la grada se levanta.",
		"a": {"label": "ESCUCHARLE", "fx": {"rel": {"tecnico": 7.0, "aficion": 4.0}}},
		"b": {"label": "IRTE AL BANQUILLO", "fx": {"rel": {"tecnico": -3.0}}}},




	{"id": "pizarra_sin_ti", "title": "EL ONCE YA ESTÁ DIBUJADO",
		"when": "tecnico_frio", "not": ["newcomer"],
		"desc": "Entras al vestuario antes que nadie y la pizarra ya tiene el once del domingo. Lo lees dos veces: tu nombre no está en ninguna de las dos.",
		"a": {"label": "NO DECIR NADA", "fx": {"rel": {"tecnico": 1.0,
			"equipo": 2.0}}},
		"b": {"label": "BORRARLA", "fx": {"rel": {"tecnico": -9.0, "equipo": -6.0,
			"prensa": 5.0}}}},
















	{"id": "ultimatum", "title": "UN GOL EN DOS JORNADAS", "when": "tecnico_harto",
		"desc": "Te llama al despacho y no se anda con rodeos: si no marcas en las dos próximas jornadas, te sientas.",
		"a": {"label": "AGACHAR LA CABEZA", "fx": {"ultimatum": true,
			"rel": {"tecnico": 2.0}}},
		"b": {"label": "DECIRLE LO QUE PIENSAS", "fx": {"ultimatum": true,
			"rel": {"tecnico": -6.0, "prensa": 4.0}}}},








	{"id": "ultimatum_win", "title": "LO MARCASTE",
		"when": ["ultimatum_win", "scored"],
		"desc": "Marcaste dentro del plazo. En el pasillo no te dijo nada, pero el lunes tu nombre volvió a la pizarra del once.",
		"a": {"label": "SEGUIR", "fx": {}},
		"b": {"label": "SEGUIR", "fx": {}}},
	{"id": "ultimatum_fail", "title": "SE ACABÓ EL PLAZO", "when": "ultimatum_fail",
		"desc": "Dos jornadas, ningún gol. No hizo falta que te lo dijera: el once del domingo ya no te lleva.",
		"a": {"label": "SEGUIR", "fx": {}},
		"b": {"label": "SEGUIR", "fx": {}}},













	{"id": "capitan_encara", "title": "EL CAPITÁN TE PARA", "when": "equipo_roto",
		"not": ["newcomer", "captain"], "names": ["capitan"],
		"desc": "{0} te espera en la puerta del vestuario. No levanta la voz: te dice que el equipo lleva semanas jugando para ti y que eso se acaba hoy.",
		"a": {"label": "AGACHAR LA CABEZA", "fx": {"rel": {"equipo": 18.0,
			"tecnico": 4.0, "prensa": -3.0}}},
		"b": {"label": "CONTESTARLE", "fx": {"rel": {"equipo": -6.0,
			"prensa": 7.0}}}},

















	{"id": "micro_derbi", "title": "EL MICRÓFONO ABIERTO", "when": "pre_derby",
		"names": ["derbi"],
		"desc": "Semana de derbi y el periodista deja el micro abierto: '¿os ven por encima de {0}?'. Sabes que lo que digas va a estar en su grada el domingo.",
		"a": {"label": "MEDIR LAS PALABRAS", "fx": {"rel": {"tecnico": 3.0,
			"prensa": -1.0}}},
		"b": {"label": "SOLTAR LA BRAVATA", "fx": {"spicy": true,
			"rel": {"prensa": 10.0, "aficion": 4.0, "tecnico": -4.0}}},







		"c": {"label": "PROMETER UN GOL", "fx": {"spicy": true, "spicy_gol": true,
			"rel": {"prensa": 6.0, "aficion": 2.0, "tecnico": -4.0}}}},







	{"id": "micro_retractar", "title": "TE PIDEN QUE LO ACLARES",
		"when": "spicy_vivo", "names": ["derbi"],
		"desc": "Tu frase lleva toda la semana en la portada y en la grada de {0}. El club te pregunta si quieres suavizarla antes del domingo.",
		"a": {"label": "SOSTENERLA", "fx": {}},
		"b": {"label": "SUAVIZARLA", "fx": {"spicy_off": "next",
			"rel": {"aficion": -4.0, "prensa": -3.0, "tecnico": 4.0}}}},






	{"id": "comunicado", "title": "EL COMUNICADO",
		"when": "comunicado_vivo",
		"desc": "Tus palabras siguen dando vueltas y el club espera un comunicado antes del próximo partido.",
		"desc_roja": "Tu roja dejó al equipo con diez. El club te pide un comunicado antes del próximo partido.",
		"desc_festejo": "Tu festejo le costó una multa al club y la polémica no se apaga. Esperan tu comunicado.",
		"a": {"label": "PEDIR PERDÓN", "fx": {"comunicado": "perdon"}},
		"b": {"label": "SOSTENERLO", "fx": {"comunicado": "sostener"}}},












	{"id": "tifo_derbi", "title": "EL TIFO DEL DERBI",
		"when": ["pre_derby", "tifo_derbi_libre"], "names": ["derbi"],
		"desc": "La peña está pintando las cartulinas para el derbi contra {0} y te pregunta si pones el dinero. Si lo pones, el domingo la curva levanta tu número.",
		"a": {"label": "PAGAR EL TIFO", "fx": {"money_wage": -1.5,
			"tifo_pagar": true}},
		"b": {"label": "QUE SAQUEN SU ESCUDO", "fx": {}}},














	{"id": "rival_sin_estrella", "title": "LLEGAN SIN SU ESTRELLA",
		"when": "rival_sin_estrella",
		"desc": "Tu próximo rival llega sin uno de sus mejores jugadores, que está lesionado. En la rueda de prensa te preguntan si es el partido para aprovecharlo.",
		"a": {"label": "RESPETAR AL RIVAL", "fx": {"rel": {"tecnico": 2.0,
			"prensa": -1.0}}},
		"b": {"label": "HAY QUE APROVECHARLO", "fx": {"rel": {"prensa": 4.0,
			"aficion": 2.0, "tecnico": -2.0}}}},




























	{"id": "prensa_rival_lanzado", "title": "VIENEN LANZADOS",
		"when": "rival_lanzado", "names": ["rival_prox"],
		"desc": "{0} llega con cinco victorias seguidas en liga. En la rueda de prensa te preguntan si os dan miedo.",
		"desc_baja": "{0} llega con cinco victorias seguidas en liga. El de la radio local, el único que te espera a la salida, te pregunta si os dan miedo.",
		"desc_alta": "{0} llega con cinco victorias seguidas en liga. La sala de prensa está llena hasta el pasillo, y todas las cámaras te preguntan si os dan miedo.",
		"a": {"label": "RESPETO, NO MIEDO", "fx": {"rel": {"tecnico": 2.0,
			"prensa": -1.0}}},
		"b": {"label": "LA RACHA SE ACABA AQUÍ", "fx": {"rel": {"prensa": 5.0,
			"aficion": 3.0, "equipo": -2.0}}}},



	{"id": "prensa_rival_herido", "title": "UN GRANDE HERIDO",
		"when": "rival_herido", "names": ["rival_prox"],
		"desc": "{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Te preguntan si es el mejor momento para cruzártelos.",
		"desc_baja": "{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Un periodista de la radio local te para en el aparcamiento: ¿es el mejor momento para cruzártelos?",
		"desc_alta": "{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Con la sala llena, la primera pregunta es para ti: ¿es el mejor momento para cruzártelos?",
		"a": {"label": "UN GRANDE SIEMPRE ES UN GRANDE", "fx": {"rel": {"tecnico": 3.0,
			"prensa": -1.0}}},
		"b": {"label": "HAY QUE REMATARLOS", "fx": {"rel": {"prensa": 4.0,
			"aficion": 3.0, "tecnico": -3.0}}}},



	{"id": "prensa_tecnico_nuevo", "title": "BANQUILLO NUEVO ENFRENTE",
		"when": "rival_tecnico_nuevo", "names": ["rival_prox", "tecnico_rival"],
		"desc": "{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y la prensa quiere saber si tú sí.",
		"desc_baja": "{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y el chico de la radio local quiere saber si tú sí.",
		"desc_alta": "{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y una sala llena de cámaras quiere saber si tú sí.",
		"a": {"label": "ESTUDIARLO CON EL MÍSTER", "fx": {"action": true,
			"rel": {"tecnico": 5.0}}},
		"b": {"label": "QUE SE PREOCUPE ÉL", "fx": {"rel": {"prensa": 3.0,
			"aficion": 1.0, "tecnico": -2.0}}}},



	{"id": "prensa_ex_tecnico", "title": "TU ANTIGUO TÉCNICO",
		"when": "rival_ex_tecnico", "names": ["tecnico_rival", "rival_prox"],
		"desc": "{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Los periodistas buscan la foto del reencuentro.",
		"desc_baja": "{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Sólo el fotógrafo del periódico local busca la foto del reencuentro.",
		"desc_alta": "{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Medio país quiere la foto del reencuentro, y las cámaras ya os esperan en el túnel.",
		"a": {"label": "UN ABRAZO ANTES DEL PARTIDO", "fx": {"rel": {"prensa": 4.0,
			"aficion": 1.0, "tecnico": -2.0}}},
		"b": {"label": "HOY ES UN RIVAL MÁS", "fx": {"rel": {"tecnico": 3.0,
			"prensa": -2.0}}}},



	{"id": "prensa_fichaje_rival", "title": "SU GRAN FICHAJE",
		"when": "rival_fichaje", "names": ["fichaje_rival", "rival_prox"],
		"desc": "{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Te preguntan si el duelo es entre vosotros dos.",
		"desc_baja": "{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. En la radio local te preguntan si podrás con él.",
		"desc_alta": "{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Las portadas ya venden el partido como vuestro duelo, y la sala entera te pregunta por él.",
		"a": {"label": "ES UN PARTIDO DE EQUIPOS", "fx": {"rel": {"equipo": 3.0,
			"prensa": -1.0}}},
		"b": {"label": "AQUÍ LE ESPERO", "fx": {"rel": {"prensa": 5.0,
			"aficion": 2.0, "equipo": -2.0}}}},


	{"id": "prensa_campeon_pais", "title": "CAMPEÓN EN CASA",
		"when": "campeon_de_casa", "names": ["campeon_pais"],
		"desc": "En tu país se ha coronado {0}, y la prensa de allí te pregunta si algún día te verán jugar en casa.",
		"desc_baja": "En tu país se ha coronado {0}. Una radio de allí, de las pocas que te siguen, te pregunta si algún día te verán jugar en casa.",
		"desc_alta": "En tu país se ha coronado {0}, y la prensa de allí abre con tu cara: ¿algún día te verán jugar en casa?",
		"a": {"label": "ALGÚN DÍA, QUIÉN SABE", "fx": {"rel": {"prensa": 3.0,
			"agente": 2.0, "aficion": -3.0}}},
		"b": {"label": "AQUÍ ESTOY A GUSTO", "fx": {"rel": {"aficion": 4.0,
			"prensa": -2.0}}}},
	{"id": "fiesta", "title": "SALIDA DEL EQUIPO",
		"desc": "El vestuario sale esta noche. Habrá fotos, habrá risas, y mañana habrá entrenamiento.",
		"a": {"label": "IR CON ELLOS", "fx": {"action": true, "energy": -15.0,
			"rel": {"equipo": 6.0, "prensa": 2.0}}},
		"b": {"label": "QUEDARTE", "fx": {"energy": 5.0, "rel": {"equipo": -1.0}}}},








	{"id": "casa_vecinos", "title": "ALBOROTO EN TU CALLE", "when": "house_owner",
		"wear": "casual",
		"desc": "Hay aficionados acampados frente a tu casa desde temprano. Los vecinos ya llamaron dos veces.",
		"a": {"label": "SALIR A FIRMAR", "fx": {"action": true, "energy": -4.0,
			"rel": {"aficion": 6.0, "prensa": 2.0}}},
		"b": {"label": "CERRAR CORTINAS", "fx": {"rel": {"aficion": -3.0}}}},
	{"id": "casa_mascota", "title": "TU MASCOTA AMANECIÓ MAL", "when": "house_pet",
		"wear": "casual",
		"desc": "No quiso comer y te mira raro. El veterinario bueno atiende hoy... a la hora del entrenamiento de recuperación.",
		"a": {"label": "LLEVARLA AL VETERINARIO", "fx": {"action": true,
			"money_wage": -0.4, "energy": 4.0}},
		"b": {"label": "ESPERAR A MAÑANA", "fx": {"risk": {"p": 0.6,
			"win": {}, "lose": {"energy": -6.0},
			"win_msg": "Falsa alarma: por la tarde ya corría por la casa.",
			"lose_msg": "Mala noche para los dos. No pegaste ojo."}}}},
	{"id": "casa_asado", "title": "ASADO EN TU JARDÍN", "when": "house_grill",
		"wear": "casual",
		"desc": "Compraste el asador y el vestuario se enteró. 'El sábado en tu casa', dicen. No era pregunta.",
		"a": {"label": "ENCENDER EL ASADOR", "fx": {"action": true,
			"money_wage": -1.0, "rel": {"equipo": 9.0, "prensa": 2.0}}},
		"b": {"label": "OTRO DÍA", "fx": {"rel": {"equipo": -3.0}}}},
	{"id": "casa_piscina", "title": "TARDE DE PISCINA", "when": "house_pool",
		"wear": "casual",
		"desc": "Hace calor, tu piscina está impecable y media plantilla tiene tu dirección. El timbre va a sonar.",
		"a": {"label": "ABRIR LA CASA", "fx": {"action": true, "energy": -6.0,
			"rel": {"equipo": 7.0, "aficion": 2.0}}},
		"b": {"label": "TARDE PARA TI", "fx": {"energy": 6.0,
			"rel": {"equipo": -2.0}}}},




	{"id": "casa_vitrina", "title": "PEREGRINACIÓN A TU VITRINA",
		"when": "house_top", "wear": "casual",
		"desc": "El club pregunta si puedes recibir a los juveniles en tu mansión: quieren ver la vitrina con sus propios ojos.",
		"a": {"label": "RECIBIRLOS", "fx": {"action": true, "energy": -4.0,
			"rel": {"tecnico": 4.0, "aficion": 5.0}}},
		"b": {"label": "OTRA SEMANA", "fx": {"rel": {"tecnico": -2.0}}}},




























	{"id": "pareja_conocer", "title": "ALGUIEN EN LA MESA DE AL LADO",
		"when": ["soltero", "cand_cena"], "wear": "casual", "names": ["candidata"],
		"peso": PESO_CONOCER, "veto_b": VETO_JORNADAS,
		"desc": "Cena del club, y la conversación de tu mesa lleva una hora girando alrededor de {0}. Te está mirando desde hace rato.",
		"a": {"label": "ACERCARTE", "fx": {"action": true, "pareja_start": "?",
			"rel": {"prensa": 2.0}}},
		"b": {"label": "DEJARLO ESTAR", "fx": {"pareja_no": true}}},
	{"id": "pareja_presentan", "title": "TE LA QUIEREN PRESENTAR",
		"when": ["soltero", "cand_bar"], "wear": "casual", "names": ["candidata"],
		"peso": PESO_CONOCER, "veto_b": VETO_JORNADAS,
		"desc": "Un compañero insiste toda la semana: {0} es amiga de su mujer y ya le habló de ti. Sólo tienes que decir que sí.",
		"a": {"label": "QUE SEA EL SÁBADO", "fx": {"action": true,
			"pareja_start": "?", "rel": {"equipo": 4.0}}},
		"b": {"label": "NO ESTÁS PARA ESO", "fx": {"pareja_no": true,
			"rel": {"equipo": -2.0}}}},




	{"id": "pareja_galeria", "title": "LA INAUGURACIÓN",
		"when": ["soltero", "cand_galeria"], "req": "sponsor",
		"names": ["candidata"],
		"peso": PESO_CONOCER, "veto_b": VETO_JORNADAS,
		"desc": "Tu marca te lleva a la inauguración de una exposición y no entiendes ni uno de los cuadros. {0} lleva veinte minutos delante del mismo, y acaba de darse cuenta de que la miras a ella.",
		"a": {"label": "PREGUNTARLE QUÉ VE", "fx": {"action": true,
			"pareja_start": "?", "rel": {"prensa": 2.0}}},
		"b": {"label": "VOLVER CON LOS TUYOS", "fx": {"pareja_no": true}}},


	{"id": "pareja_puerta", "title": "TE ESPERABA EN LA PUERTA",
		"when": ["soltero", "famous", "cand_calle"], "wear": "casual",
		"names": ["candidata"],
		"peso": PESO_CONOCER, "veto_b": VETO_JORNADAS,
		"desc": "{0} llevaba dos horas en la puerta de jugadores. No traía camiseta que firmar: traía su número escrito en un papel.",
		"a": {"label": "GUARDARTE EL PAPEL", "fx": {"pareja_start": "?",
			"rel": {"prensa": 3.0, "aficion": -1.0}}},
		"b": {"label": "SUBIR AL AUTOBÚS", "fx": {"pareja_no": true}}},












	{"id": "cita_cena", "title": "LA PRIMERA CENA", "when": ["cita_1"],
		"wear": "casual", "names": ["pareja"], "juego": true, "peso": PESO_CITA,
		"desc": "Mesa para dos y el teléfono boca abajo. Esta noche va de escucharla — y de que no te pillen mirando la pantalla.",
		"a": {"label": "IR", "fx": {"action": true}},
		"b": {"label": "ESTA SEMANA NO", "fx": {"rel": {"pareja": -8.0}}}},
	{"id": "cita_copa", "title": "LO QUE TE CONTÓ", "when": ["cita_2"],
		"wear": "casual", "names": ["pareja"], "juego": true, "peso": PESO_CITA,
		"desc": "Una copa y la conversación de la otra noche encima de la mesa. Vas a tener que acordarte de lo que te dijo.",
		"a": {"label": "IR", "fx": {"action": true}},
		"b": {"label": "ESTA SEMANA NO", "fx": {"rel": {"pareja": -8.0}}}},
	{"id": "cita_arte", "title": "LA INAUGURACIÓN DE ELLA", "when": ["cita_3"],
		"names": ["pareja"], "juego": true, "peso": PESO_CITA,
		"desc": "Te lleva a una exposición donde no conoces a nadie. Aquí no se trata de entender los cuadros: se trata de saber cuándo hablar.",
		"a": {"label": "IR", "fx": {"action": true}},
		"b": {"label": "ESTA SEMANA NO", "fx": {"rel": {"pareja": -8.0}}}},



	{"id": "pareja_dinero", "title": "HABLEMOS DE DINERO",
		"when": ["pareja_formal", "pareja_interesada"], "wear": "casual",
		"names": ["pareja"], "juego": true, "peso": PESO_ARCO,
		"desc": "{0} ha esperado a que acabe la cena para decirlo, y lo dice sin rodeos: quiere una cantidad fija todos los meses, o esto no tiene sentido.",
		"a": {"label": "HABLARLO", "fx": {"action": true}},
		"b": {"label": "NO PIENSO DISCUTIR ESO", "fx": {"rel": {"pareja": -16.0}}}},













	{"id": "pareja_fiesta_equipo", "title": "LA CENA DEL VESTUARIO",
		"when": ["con_pareja"], "wear": "casual", "names": ["pareja"],
		"desc": "El grupo sale a cenar y alguien lo deja caer con una sonrisa: «esta vez, solos». {0} ya se estaba arreglando.",
		"a": {"label": "LLEVARLA IGUAL", "fx": {"rel": {"pareja": 9.0, "equipo": -7.0}}},
		"b": {"label": "IR SOLO", "fx": {"rel": {"equipo": 6.0, "pareja": -8.0}}}},
	{"id": "pareja_palco", "title": "LA ENTRADA DEL PALCO",
		"when": ["con_pareja"], "names": ["pareja"],
		"desc": "El club te ofrece una butaca de palco para {0}. Desde ahí se ve el partido; desde la grada de siempre se ve a la gente.",
		"a": {"label": "AL PALCO", "fx": {"rel": {"pareja": 7.0, "aficion": -6.0}}},
		"b": {"label": "CON LA GRADA", "fx": {"rel": {"aficion": 7.0, "pareja": -5.0}}}},
	{"id": "pareja_campana", "title": "LA QUIEREN EN LA CAMPAÑA",
		"when": ["con_pareja"], "req": "sponsor", "names": ["pareja"],
		"desc": "La marca ha visto una foto vuestra y quiere a {0} en el anuncio. Pagan por los dos y no aceptan un no fácil.",














		"a": {"label": "QUE SALGA ELLA", "fx": {"money_sponsor": 3.0,
			"rel": {"prensa": 8.0, "pareja": -9.0}}},
		"b": {"label": "ELLA NO SE VENDE", "fx": {"rel": {"prensa": -7.0,
			"pareja": 10.0}}}},
	{"id": "pareja_cena_negocios", "title": "LA CENA DE TU AGENTE",
		"when": ["con_pareja"], "wear": "traje", "names": ["pareja"],
		"desc": "Tu agente ha montado una cena con gente que decide cosas. Es esta noche, y esta noche ya la teníais ocupada.",
		"a": {"label": "IR A LA CENA", "fx": {"rel": {"agente": 8.0, "pareja": -8.0}}},
		"b": {"label": "LO QUE TENÍAIS", "fx": {"rel": {"agente": -6.0,
			"pareja": 9.0}}}},
	{"id": "pareja_video", "title": "EL VÍDEO DEL MÍSTER",
		"when": ["con_pareja"], "wear": "casual", "names": ["pareja"],
		"desc": "El técnico ha mandado dos horas de vídeo para esta noche. {0} lleva toda la semana esperando esta noche.",
		"a": {"label": "VERLO ENTERO", "fx": {"rel": {"tecnico": 7.0,
			"pareja": -7.0}}},
		"b": {"label": "MAÑANA LO VES", "fx": {"rel": {"tecnico": -6.0,
			"pareja": 8.0}}}},
	{"id": "pareja_prensa_dos", "title": "OS QUIEREN A LOS DOS",
		"when": ["con_pareja"], "names": ["pareja"],
		"desc": "Un programa quiere una entrevista de pareja. Sería la primera vez que {0} habla delante de una cámara.",
		"a": {"label": "IR JUNTOS", "fx": {"rel": {"prensa": 9.0, "pareja": -6.0}}},
		"b": {"label": "IR TÚ SOLO", "fx": {"rel": {"prensa": -4.0, "pareja": 6.0}}}},







	{"id": "pareja_ex_prensa", "title": "TU EX HABLA",
		"when": ["con_pareja", "hubo_ex"], "names": ["pareja", "ex"],
		"desc": "Una revista le ha pagado a {1} por contar cómo eras entonces. No miente en nada, y eso es lo peor. {0} lo ha leído entero.",
		"a": {"label": "NO CONTESTAR", "fx": {"rel": {"pareja": 7.0,
			"prensa": -5.0}}},
		"b": {"label": "DESMENTIRLO EN PÚBLICO", "fx": {"rel": {"prensa": 6.0,
			"pareja": -9.0}}}},
	{"id": "pareja_ex_encuentro", "title": "ESTABA EN LA MISMA MESA",
		"when": ["con_pareja", "hubo_ex"], "wear": "casual",
		"names": ["pareja", "ex"],
		"desc": "Cena de gala, y en la mesa de al lado está {1}. {0} la ha reconocido antes de sentarse y no ha soltado tu mano en toda la noche.",
		"a": {"label": "SALUDARLA Y VOLVER", "fx": {"rel": {"pareja": 8.0}}},
		"b": {"label": "HACER COMO QUE NO", "fx": {"rel": {"pareja": -6.0,
			"prensa": 4.0}}}},









	{"id": "pareja_r_casera", "title": "EL PLAN DE NO HACER NADA",
		"when": ["con_pareja", "pareja_casera"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "Hay tres sitios donde deberías dejarte ver este fin de semana. {0} ha comprado comida para dos y no piensa moverse de casa.",
		"a": {"label": "QUEDARTE CON ELLA", "fx": {"energy": 8.0,
			"rel": {"pareja": 10.0, "prensa": -5.0}}},
		"b": {"label": "DEJARTE VER", "fx": {"energy": -6.0,
			"rel": {"prensa": 7.0, "pareja": -7.0}}}},
	{"id": "pareja_r_ambiciosa", "title": "ELLA CREE QUE VALES MÁS",
		"when": ["con_pareja", "pareja_ambiciosa"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} ha leído lo que cobra el que juega en tu puesto en otro sitio. «Pide lo tuyo o pídelo yo por ti.»",
		"a": {"label": "PEDIR MÁS AL CLUB", "fx": {"rel": {"pareja": 9.0,
			"tecnico": -6.0, "agente": 5.0}}},
		"b": {"label": "ESTOY BIEN AQUÍ", "fx": {"rel": {"pareja": -8.0,
			"tecnico": 4.0}}}},
	{"id": "pareja_r_celosa", "title": "LA FOTO DEL PATROCINIO",
		"when": ["con_pareja", "pareja_celosa"], "req": "sponsor", "names": ["pareja"], "peso": PESO_RASGO,
		"desc": "En la foto de la marca sales con una modelo a medio metro. {0} la ha visto antes que tú y no ha dicho nada, que es peor.",
		"a": {"label": "HABLARLO ESA NOCHE", "fx": {"action": true,
			"energy": -4.0, "rel": {"pareja": 11.0}}},
		"b": {"label": "ES TRABAJO, SE LE PASA", "fx": {"rel": {"pareja": -13.0}}}},
	{"id": "pareja_r_independiente", "title": "SE FUE SIN AVISAR",
		"when": ["con_pareja", "pareja_independiente"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} se ha ido diez días con sus amigas y te has enterado por una foto. No es una prueba: es que no se le ocurrió que hubiera que pedir permiso.",
		"a": {"label": "DESEARLE BUEN VIAJE", "fx": {"rel": {"pareja": 10.0}}},
		"b": {"label": "PEDIRLE EXPLICACIONES", "fx": {"rel": {"pareja": -12.0}}}},
	{"id": "pareja_r_hincha", "title": "ELLA YA ERA DE AQUÍ",
		"when": ["con_pareja", "pareja_hincha"], "names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} tiene su sitio en la grada desde antes de conocerte y no piensa cambiarlo por un palco. Hoy le toca cantar contigo abajo.",
		"a": {"label": "SALUDARLA AL GOL", "fx": {"rel": {"pareja": 9.0,
			"aficion": 8.0, "tecnico": -4.0}}},
		"b": {"label": "ESO NO SE HACE", "fx": {"rel": {"pareja": -7.0,
			"tecnico": 3.0}}}},
	{"id": "pareja_r_reservada", "title": "LA CAZARON EN LA PUERTA",
		"when": ["con_pareja", "pareja_reservada"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "Alguien vendió una foto de {0} saliendo de tu casa. No sale mal; sale sin querer salir, que para ella es lo mismo.",
		"a": {"label": "PARAR ESO COMO SEA", "fx": {"money_wage": -0.4,
			"rel": {"pareja": 12.0, "prensa": -8.0}}},
		"b": {"label": "SE OLVIDA EN DOS DÍAS", "fx": {"rel": {"pareja": -11.0}}}},









	{"id": "pareja_r_cazafortunas", "title": "UN FAVOR PARA SU HERMANO",
		"when": ["con_pareja", "pareja_cazafortunas"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "El hermano de {0} tiene un negocio que va a salir seguro y le falta el arranque. Ella no lo pide para ella, y eso es justo lo que hace difícil decir que no.",
		"a": {"label": "ADELANTARLE EL DINERO", "fx": {"money_wage": -2.2,
			"rel": {"pareja": 11.0}}},
		"b": {"label": "QUE LO PIDA AL BANCO", "fx": {"rel": {"pareja": -8.0}}}},
	{"id": "pareja_r_companera", "title": "LA SEMANA MALA",
		"when": ["con_pareja", "pareja_companera", "lost"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "Otra derrota, y en casa no se habla de otra cosa. {0} no te pregunta: te pone las botas en la puerta y se calla.",
		"a": {"label": "SALIR A CORRER CON ELLA", "fx": {"action": true,
			"energy": -5.0, "rel": {"pareja": 8.0, "tecnico": 5.0}}},
		"b": {"label": "HOY NO", "fx": {"rel": {"pareja": -6.0}}}},



	{"id": "pareja_r_millonaria", "title": "LA CUENTA YA ESTABA PAGADA",
		"when": ["con_pareja", "pareja_millonaria"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} ha pagado la cena, el hotel y un coche nuevo para tu madre, y no entiende qué te molesta. «Tengo más de lo que me voy a gastar nunca. Déjame.»",
		"a": {"label": "DEJAR QUE PAGUE", "fx": {"money_wage": 1.5,
			"rel": {"pareja": 9.0}}},
		"b": {"label": "LA PRÓXIMA PAGO YO", "fx": {"rel": {"pareja": -6.0,
			"prensa": 5.0}}}},















	{"id": "pareja_r_casera_padres", "title": "SUS PADRES, EL DOMINGO",
		"when": ["con_pareja", "pareja_casera"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "Los padres de {0} vienen a comer el domingo, como cada mes. Tu agente te ha cerrado una sesión de fotos a la misma hora.",
		"a": {"label": "PONER LA MESA", "fx": {"energy": -3.0,
			"rel": {"pareja": 9.0, "agente": -5.0}}},
		"b": {"label": "LA SESIÓN DE FOTOS", "fx": {"rel": {"agente": 5.0,
			"prensa": 3.0, "pareja": -7.0}}}},
	{"id": "pareja_r_casera_pueblo", "title": "LAS FIESTAS DE SU PUEBLO",
		"when": ["con_pareja", "pareja_casera"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} quiere llevarte a las fiestas de su pueblo. Medio pueblo sabe ya que vas, y el otro medio lo sabrá en cuanto aparques.",
		"a": {"label": "IR AL PUEBLO", "fx": {"energy": -6.0,
			"rel": {"pareja": 10.0, "aficion": 4.0}}},
		"b": {"label": "ESTE AÑO NO", "fx": {"energy": 4.0,
			"rel": {"pareja": -8.0}}}},
	{"id": "pareja_r_fiestera_isla", "title": "SU CUMPLEAÑOS, EN UNA ISLA",
		"when": ["con_pareja", "pareja_fiestera"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} celebra su cumpleaños en una isla: avión fletado, cuarenta amigos y tres noches. Tú entrenas el viernes.",
		"a": {"label": "IR Y VOLVER EN EL DÍA", "fx": {"energy": -14.0,
			"rel": {"pareja": 10.0, "tecnico": -4.0}}},
		"b": {"label": "LLAMARLA A MEDIANOCHE", "fx": {"rel": {"pareja": -8.0}}}},
	{"id": "pareja_r_fiestera_foto", "title": "LA FOTO DE LAS CINCO",
		"when": ["con_pareja", "pareja_fiestera"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "Sale una foto de {0} a las cinco de la mañana en una discoteca, la víspera de tu partido. Tú dormías en casa; en las redes nadie lo cree.",
		"a": {"label": "DEFENDERLA EN PÚBLICO", "fx": {"rel": {"pareja": 9.0,
			"prensa": -5.0, "aficion": -3.0}}},
		"b": {"label": "PEDIRLE QUE BAJE EL RITMO", "fx": {"rel": {"pareja": -9.0,
			"tecnico": 4.0}}}},
	{"id": "pareja_r_ambiciosa_mesa", "title": "LA MESA DEL PRESIDENTE",
		"when": ["con_pareja", "pareja_ambiciosa"], "wear": "traje",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} ha conseguido sentarte en la mesa del presidente en la cena del club. No te lo ha consultado: te ha dicho a qué hora pasa el coche.",
		"a": {"label": "IR Y SONREÍR", "fx": {"energy": -5.0,
			"rel": {"pareja": 8.0, "agente": 4.0, "equipo": -4.0}}},
		"b": {"label": "NO ME MUEVAS LOS HILOS", "fx": {"rel": {"pareja": -9.0,
			"equipo": 3.0}}}},
	{"id": "pareja_r_ambiciosa_marca", "title": "SU MARCA, TU CARA",
		"when": ["con_pareja", "pareja_ambiciosa"], "wear": "traje",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} lanza su propia línea de ropa y quiere que la presentes tú. Dice que es un negocio de los dos; el contrato lo firma ella.",
		"a": {"label": "PRESENTARLA", "fx": {"rel": {"pareja": 9.0,
			"prensa": 6.0, "agente": -5.0}}},
		"b": {"label": "MI CARA NO SE PRESTA", "fx": {"rel": {"pareja": -8.0,
			"agente": 4.0}}}},
	{"id": "pareja_r_celosa_mensaje", "title": "EL MENSAJE DE LAS TRES",
		"when": ["con_pareja", "pareja_celosa"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "A las tres de la mañana se ha encendido tu teléfono: una periodista, por un reportaje. {0} ha visto la pantalla y ya no se ha vuelto a dormir.",
		"a": {"label": "ENSEÑARLE EL TELÉFONO", "fx": {"rel": {"pareja": 9.0,
			"prensa": -3.0}}},
		"b": {"label": "ES MI TRABAJO", "fx": {"rel": {"pareja": -11.0}}}},
	{"id": "pareja_r_celosa_fisio", "title": "LA FISIO NUEVA",
		"when": ["con_pareja", "pareja_celosa"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "El club ha fichado una fisioterapeuta y {0} ya sabe cómo se llama. Pregunta, como quien no quiere la cosa, a qué hora te toca.",
		"a": {"label": "CAMBIAR DE TURNO", "fx": {"rel": {"pareja": 8.0,
			"tecnico": -4.0}}},
		"b": {"label": "ES MI FISIO", "fx": {"rel": {"pareja": -10.0}}}},
	{"id": "pareja_r_independiente_expo", "title": "SU INAUGURACIÓN",
		"when": ["con_pareja", "pareja_independiente"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} inaugura su primera exposición el sábado, y el sábado juegas en la otra punta del país. No te ha pedido que vayas.",
		"a": {"label": "LLEGAR AUNQUE SEA AL FINAL", "fx": {"energy": -10.0,
			"rel": {"pareja": 11.0, "tecnico": -3.0}}},
		"b": {"label": "MANDARLE FLORES", "fx": {"rel": {"pareja": -6.0}}}},
	{"id": "pareja_r_independiente_no", "title": "TE HA DICHO QUE NO",
		"when": ["con_pareja", "pareja_independiente"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "Le pediste a {0} que viniera a la gala del club. Tiene un plan con sus amigas desde hace meses, y te ha dicho que no sin ningún drama.",
		"a": {"label": "IR SOLO Y CONTÁRSELO", "fx": {"rel": {"pareja": 8.0,
			"prensa": -4.0}}},
		"b": {"label": "PEDIRLE QUE LO CAMBIE", "fx": {"rel": {"pareja": -10.0,
			"prensa": 3.0}}}},
	{"id": "pareja_r_hincha_pena", "title": "MADRINA DE LA PEÑA",
		"when": ["con_pareja", "pareja_hincha"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "La peña del barrio quiere a {0} de madrina en su aniversario. Ella ya ha dicho que sí, y a ti te esperan para firmar camisetas.",
		"a": {"label": "IR CON ELLA", "fx": {"energy": -6.0,
			"rel": {"pareja": 7.0, "aficion": 8.0}}},
		"b": {"label": "QUE VAYA ELLA", "fx": {"rel": {"pareja": -6.0,
			"aficion": -4.0}}}},

	{"id": "pareja_r_hincha_coche", "title": "TE LO DIJO EN EL COCHE",
		"when": ["con_pareja", "pareja_hincha", "lost"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "Jugaste mal y {0} te lo ha dicho en el coche, con datos y sin anestesia. Sabe de qué habla: lleva veinte años en la grada.",
		"a": {"label": "ESCUCHARLA ENTERA", "fx": {"energy": -3.0,
			"rel": {"pareja": 8.0}}},
		"b": {"label": "HOY NO, POR FAVOR", "fx": {"energy": 3.0,
			"rel": {"pareja": -6.0}}}},
	{"id": "pareja_r_reservada_nombre", "title": "DIJISTE SU NOMBRE",
		"when": ["con_pareja", "pareja_reservada"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "En una entrevista nombraste a {0}, de pasada y con cariño. Desde entonces le escriben desconocidos.",
		"a": {"label": "PEDIRLE PERDÓN", "fx": {"rel": {"pareja": 9.0,
			"prensa": -4.0}}},
		"b": {"label": "LO DIJE CON CARIÑO", "fx": {"rel": {"pareja": -10.0,
			"prensa": 3.0}}}},
	{"id": "pareja_r_reservada_valla", "title": "UNA VALLA MÁS ALTA",
		"when": ["con_pareja", "pareja_reservada"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} quiere una valla alta y cámaras en la entrada de tu casa. Los vecinos, que te saludan cada mañana, no lo van a entender.",
		"a": {"label": "PONER LA VALLA", "fx": {"money_wage": -0.5,
			"rel": {"pareja": 9.0, "aficion": -4.0}}},
		"b": {"label": "AQUÍ NO HACE FALTA", "fx": {"rel": {"pareja": -8.0,
			"aficion": 3.0}}}},


	{"id": "pareja_r_cazafortunas_cuenta", "title": "UNA CUENTA DE LOS DOS",
		"when": ["con_pareja", "pareja_cazafortunas"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} ha encontrado un banco que os abre una cuenta conjunta con tarjeta de cristal. Dice que así no tiene que pedirte cada cosa.",
		"a": {"label": "ABRIRLA", "fx": {"money_wage": -1.2,
			"rel": {"pareja": 10.0}}},
		"b": {"label": "CADA UNO LA SUYA", "fx": {"rel": {"pareja": -8.0}}}},
	{"id": "pareja_r_cazafortunas_escaparate", "title": "EL ESCAPARATE",
		"when": ["con_pareja", "pareja_cazafortunas"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "Paseabais y {0} se ha parado delante de un escaparate. No ha dicho nada. Al día siguiente ha vuelto a pasar por la misma calle.",
		"a": {"label": "COMPRÁRSELO", "fx": {"money_wage": -1.5,
			"rel": {"pareja": 10.0, "prensa": 2.0}}},
		"b": {"label": "SEGUIR ANDANDO", "fx": {"rel": {"pareja": -6.0}}}},
	{"id": "pareja_r_companera_examen", "title": "SU EXAMEN",
		"when": ["con_pareja", "pareja_companera"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} tiene el lunes el examen más importante de su carrera. Lleva meses aguantando tus viajes; esta semana sólo te pide la casa en silencio.",
		"a": {"label": "DORMIR EN EL HOTEL DEL CLUB", "fx": {"money_wage": -0.2,
			"rel": {"pareja": 9.0}}},
		"b": {"label": "LA CASA ES DE LOS DOS", "fx": {"energy": 4.0,
			"rel": {"pareja": -8.0}}}},
	{"id": "pareja_r_companera_cena", "title": "LA CENA DE FIN DE TEMPORADA",
		"when": ["con_pareja", "pareja_companera"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} se ha hecho amiga de medio vestuario, y ahora el capitán quiere hacer la cena de fin de temporada en tu casa.",
		"a": {"label": "HACERLA EN CASA", "fx": {"energy": -5.0, "money_wage": -0.3,
			"rel": {"equipo": 8.0, "pareja": 4.0}}},
		"b": {"label": "MEJOR EN UN RESTAURANTE", "fx": {"rel": {"equipo": -3.0,
			"pareja": -4.0}}}},
	{"id": "pareja_r_millonaria_avion", "title": "SU AVIÓN",
		"when": ["con_pareja", "pareja_millonaria"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "{0} te ofrece su avión para volver del partido de fuera, en vez del autobús del equipo. Llegarías a casa tres horas antes.",
		"a": {"label": "EL AVIÓN", "fx": {"energy": 10.0,
			"rel": {"pareja": 6.0, "equipo": -6.0}}},
		"b": {"label": "EL AUTOBÚS", "fx": {"rel": {"equipo": 5.0,
			"pareja": -5.0}}}},
	{"id": "pareja_r_millonaria_padre", "title": "LA CENA CON SU PADRE",
		"when": ["con_pareja", "pareja_millonaria"], "wear": "traje",
		"names": ["pareja"], "peso": PESO_RASGO,
		"desc": "El padre de {0} te ha invitado a cenar. Tiene tres empresas y una sola pregunta: qué vas a hacer cuando dejes el fútbol.",
		"a": {"label": "TENGO UN PLAN", "fx": {"energy": -3.0,
			"rel": {"pareja": 8.0}}},
		"b": {"label": "NO LO HE PENSADO", "fx": {"rel": {"pareja": -6.0}}}},












	{"id": "pareja_c_luna", "title": "LA LUNA DE MIEL",
		"when": ["casado"], "not": ["pareja_enfria"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CASADOS,
		"desc": "Os casasteis en plena temporada y la luna de miel sigue en un cajón. {0} ha encontrado diez días en tu calendario y ya ha mirado vuelos.",

		"a": {"label": "IROS LOS DIEZ DÍAS", "fx": {"money_wage": -1.0, "con_ella": true,
			"energy": 8.0, "rel": {"pareja": 12.0, "tecnico": -5.0}}},
		"b": {"label": "EN VERANO, PROMETIDO", "fx": {"rel": {"pareja": -8.0}}}},
	{"id": "pareja_c_navidad", "title": "NAVIDAD, ¿EN QUÉ CASA?",
		"when": ["casado"], "not": ["pareja_enfria"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CASADOS,
		"desc": "Tu madre y {0} se tratan con una educación que da frío. Este año hay que elegir dónde se pasa la Navidad, y las dos esperan la misma respuesta.",
		"a": {"label": "CON SU FAMILIA", "fx": {"energy": -4.0,
			"rel": {"pareja": 9.0}}},
		"b": {"label": "CON LA TUYA", "fx": {"energy": 4.0,
			"rel": {"pareja": -8.0}}}},
	{"id": "pareja_c_primera", "title": "LA MESA DE LA PRIMERA CENA",
		"when": ["casado"], "not": ["pareja_enfria"], "wear": "traje",
		"names": ["pareja"], "peso": PESO_CASADOS,
		"desc": "Lleváis meses sin salir solos. {0} ha reservado el jueves en el restaurante de vuestra primera cena, sin preguntarte si tenías algo.",
		"a": {"label": "IR EL JUEVES", "fx": {"energy": -4.0,
			"rel": {"pareja": 9.0, "tecnico": -2.0}}},
		"b": {"label": "CAMBIARLO DE DÍA", "fx": {"rel": {"pareja": -6.0}}}},
	{"id": "pareja_c_fotos", "title": "LAS FOTOS DE LA BODA",
		"when": ["casado"], "not": ["pareja_enfria"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CASADOS,
		"desc": "Una revista ofrece una fortuna por las fotos de vuestra boda, que nunca enseñasteis a nadie. {0} dice que decidas tú.",
		"a": {"label": "VENDERLAS", "fx": {"money_wage": 1.0,
			"rel": {"prensa": 6.0, "pareja": -8.0}}},
		"b": {"label": "SON NUESTRAS", "fx": {"rel": {"prensa": -4.0,
			"pareja": 8.0}}}},
	{"id": "pareja_c_anos", "title": "¿CUÁNTOS AÑOS MÁS?",
		"when": ["casado"], "not": ["pareja_enfria"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CASADOS,
		"desc": "{0} te ha preguntado, por primera vez, cuántos años más piensas jugar. No era un reproche: quería saber cuándo empezáis a vivir.",
		"a": {"label": "HABLARLO ESA NOCHE", "fx": {"action": true,
			"rel": {"pareja": 10.0}}},
		"b": {"label": "LOS QUE AGUANTEN LAS PIERNAS", "fx": {"rel": {"pareja": -6.0}}}},




	{"id": "pareja_aniversario", "title": "UN AÑO MÁS", "when": ["aniversario"],
		"wear": "casual", "names": ["pareja"], "juego": true, "peso": PESO_ARCO,
		"desc": "Hoy hace justo un año de aquello, y {0} no lo ha mencionado ni una vez en toda la semana. Eso no significa que se le haya olvidado.",
		"a": {"label": "PREPARARLE ALGO", "fx": {"action": true}},
		"b": {"label": "DEJARLO PASAR", "fx": {"rel": {"pareja": -14.0}}}},




	{"id": "capitan_penales", "title": "¿LOS TIRAS TÚ?", "when": ["capitan_penales_pide"],
		"wear": "uniforme", "names": ["lanzador"], "peso": PESO_ARCO, "veto_b": VETO_JORNADAS,
		"desc": "{0} ha fallado dos penales este año y en el vestuario nadie dice nada. Llevas el brazalete: el siguiente lo decides tú.",
		"a": {"label": "LOS COBRO YO", "fx": {"capitan_penales": true,
			"rel": {"equipo": -3.0}}},
		"b": {"label": "SIGUE ÉL", "fx": {"capitan_penales": false,
			"rel": {"equipo": 3.0}}}},



	{"id": "tecnico_nueve", "title": "EL PUESTO QUE QUERÍAS", "when": ["nueve_del_tecnico"],
		"wear": "casual", "names": ["pos_fav"], "peso": PESO_ARCO,
		"desc": "Tres años seguidos siendo el goleador del equipo desde donde no querías jugar. El técnico te para en el pasillo: el {0} es tuyo si lo quieres.",
		"a": {"label": "ES MÍO", "fx": {"nueve_acepta": true, "rel": {"tecnico": 3.0}}},
		"b": {"label": "ME QUEDO DONDE ESTOY", "fx": {"nueve_acepta": false,
			"rel": {"tecnico": 2.0}}}},














	{"id": "pareja_boda", "title": "PEDÍRSELO", "when": ["puede_pedirselo"],
		"wear": "traje", "gala": true, "names": ["pareja"],
		"peso": PESO_ARCO, "veto_b": VETO_OTRO_ANO,
		"desc": "Reservaste sin decirle por qué, y {0} bajó vestida para algo que no sabe qué es. El anillo lleva un mes pagado y lo llevas encima.",
		"a": {"label": "PEDÍRSELO ESTA NOCHE", "fx": {"pareja_pedir": true,
			"rel": {"pareja": 15.0}}},
		"b": {"label": "OTRO AÑO", "fx": {"rel": {"pareja": -6.0}}}},






	{"id": "pareja_prenup", "title": "LO QUE FIRMÁIS", "when": ["prometido", "no_caza"],
		"wear": "traje", "names": ["pareja"], "juego": true, "peso": PESO_ARCO,
		"desc": "Tu agente lleva tres días pidiendo veinte minutos. Trae una carpeta y no la ha abierto delante de nadie.",
		"a": {"label": "ESCUCHARLE", "fx": {"action": true}},
		"b": {"label": "NO HAY NADA QUE FIRMAR", "fx": {"pareja_casar": true,
			"rel": {"pareja": 10.0, "agente": -8.0}}}},






	{"id": "pareja_escrituras", "title": "LAS ESCRITURAS", "when": ["prometido", "caza"],
		"wear": "traje", "names": ["pareja"], "juego": true, "peso": PESO_ARCO,
		"desc": "Tu agente trae las escrituras de la casa y una sola pregunta: a nombre de quién. {0} ya ha preguntado dos veces si hay que firmar algo.",
		"a": {"label": "ESCUCHARLE", "fx": {"action": true}},
		"b": {"label": "QUE DECIDA ELLA", "fx": {"pareja_casar": true,
			"pareja_titular": "ella", "rel": {"pareja": 10.0, "agente": -8.0}}}},















	{"id": "pareja_frio_a", "title": "EL CUARTO DE INVITADOS",
		"when": ["casado", "pareja_enfria", "pareja_frio_0"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CITA,
		"desc": "Llevas tres noches durmiendo solo. {0} dice que es por la espalda, y en la cama de al lado hay una almohada que no estaba.",
		"a": {"label": "PREGUNTARLE QUÉ PASA", "fx": {"energy": -5.0,
			"pareja_calor": true, "rel": {"pareja": 7.0}}},
		"b": {"label": "SERÁ LA ESPALDA", "fx": {"pareja_frio": true,
			"rel": {"pareja": -5.0}}}},
	{"id": "pareja_frio_b", "title": "NO PREGUNTÓ POR EL PARTIDO",
		"when": ["casado", "pareja_enfria", "pareja_frio_1"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CITA,
		"desc": "Entras, dejas la bolsa, y {0} sigue con lo suyo. Antes preguntaba antes de que te quitaras el abrigo. Hoy no, y ayer tampoco.",
		"a": {"label": "APAGAR EL TELÉFONO Y SENTARTE", "fx": {"energy": -9.0,
			"pareja_calor": true, "rel": {"pareja": 9.0}}},
		"b": {"label": "SUBIR A DUCHARTE", "fx": {"pareja_frio": true,
			"rel": {"pareja": -7.0}}}},
	{"id": "pareja_frio_c", "title": "LA MALETA PEQUEÑA",
		"when": ["casado", "pareja_enfria", "pareja_frio_2"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CITA,
		"desc": "La maleta de mano lleva dos semanas junto a la puerta, hecha. {0} no la ha deshecho ni una vez, y tampoco se ha ido.",
		"a": {"label": "PEDIR PERMISO Y LLEVÁRTELA", "fx": {"energy": -14.0,
			"pareja_calor": true, "rel": {"pareja": 12.0, "tecnico": -7.0}}},
		"b": {"label": "NO ABRIR ESE TEMA", "fx": {"pareja_frio": true,
			"rel": {"pareja": -9.0}}}},






	{"id": "pareja_caza_tasacion", "title": "LA TASACIÓN",
		"when": ["casado", "caza_tasa"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CITA,
		"desc": "Ha venido un señor con una carpeta a medir el salón y a fotografiar la vitrina. {0} dice que es por el seguro. Nadie ha cambiado el seguro.",
		"a": {"label": "SUBIRLE LA ASIGNACIÓN", "fx": {"caza_sube": true,
			"rel": {"pareja": 6.0}}},
		"b": {"label": "NO LE DOY MÁS", "fx": {"caza_planta": true}}},
	{"id": "pareja_divorcio", "title": "SU ABOGADO HA LLAMADO",
		"when": ["casado", "divorcio_cerca"], "wear": "casual",
		"names": ["pareja"], "juego": true, "peso": PESO_CITA,
		"desc": "No fue una discusión ni una noche mala: fue una carta. {0} quiere el divorcio, y su abogado ya ha puesto una cifra encima de la mesa.",
		"a": {"label": "VER LA CIFRA", "fx": {"action": true}},
		"b": {"label": "NO ABRIR ESA CARTA", "fx": {"rel": {"pareja": -10.0}}}},





	{"id": "pareja_viaje", "title": "¿SE VIENE CONTIGO?",
		"when": ["con_pareja", "pareja_viaje"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CITA,
		"desc": "El contrato nuevo está encima de la mesa de la cocina, y es en otro país. {0} lo ha leído dos veces sin decir nada. Su vida está aquí.",
		"a": {"label": "PEDIRLE QUE VENGA", "fx": {"pareja_viaja": true}},
		"b": {"label": "QUE SE QUEDE", "fx": {"pareja_queda": true,
			"rel": {"pareja": -4.0}}}},




	{"id": "pareja_lesion", "title": "LA CLÍNICA",
		"when": ["con_pareja", "pareja_lesion"], "wear": "casual",
		"names": ["pareja"], "peso": PESO_CITA,
		"desc": "{0} se ha enterado por la tele antes que por ti. Está en la puerta de la clínica con una bolsa de ropa tuya y cara de no pensar irse.",
		"a": {"label": "DEJAR QUE TE CUIDE", "fx": {"pareja_lesion_fin": true,
			"rel": {"pareja": 8.0}}},
		"b": {"label": "PEDIRLE ESPACIO", "fx": {"pareja_lesion_fin": true,
			"rel": {"pareja": -6.0, "tecnico": 3.0}}}},

























	{"id": "pareja_mudanza", "title": "LA LLAVE DE TU CASA",
		"when": ["con_pareja", "house_owner", "pareja_mudable", "citas_hechas"],
		"not": ["pareja_formal"], "veto_b": VETO_JORNADAS,
		"wear": "casual", "peso": PESO_CITA,
		"names": ["pareja"], "desc": "{0} lleva media semana durmiendo aquí y sus cosas ya ocupan un cajón. Alguien tiene que decirlo en voz alta.",
		"a": {"label": "PEDIRLE QUE SE MUDE", "fx": {"pareja_formal": true,
			"rel": {"pareja": 12.0}}},
		"b": {"label": "TODAVÍA NO", "fx": {"rel": {"pareja": -9.0}}}},
	{"id": "pareja_cita", "title": "LA CENA QUE LE DEBES", "when": "con_pareja",
		"wear": "casual", "names": ["pareja"],
		"desc": "Reservaste hace tres semanas y hoy es la noche. También es la noche del vídeo del rival, que el técnico mandó a todo el plantel.",

		"a": {"label": "IR A CENAR", "fx": {"action": true, "energy": -5.0,
			"money_wage": -0.3, "con_ella": true,
			"rel": {"pareja": 9.0, "tecnico": -3.0}}},
		"b": {"label": "VER EL VÍDEO", "fx": {"rel": {"tecnico": 5.0,
			"pareja": -8.0}}}},
	{"id": "pareja_concentracion", "title": "OTRA SEMANA FUERA",
		"when": ["pareja_formal"], "names": ["pareja"],
		"desc": "Cuatro días de concentración, el tercer viaje del mes. {0} ya no pregunta cuándo vuelves: mira el calendario y se calla.",
		"a": {"label": "LLAMARLA CADA NOCHE", "fx": {"action": true,
			"energy": -3.0, "rel": {"pareja": 7.0}}},
		"b": {"label": "CONCENTRARTE EN EL PARTIDO", "fx": {"rel": {"tecnico": 4.0,
			"pareja": -6.0}}}},


	{"id": "pareja_cumple", "title": "SU CUMPLEAÑOS ES HOY",
		"when": ["pareja_formal"], "wear": "casual", "names": ["pareja"],
		"desc": "Es el cumpleaños de {0} y hay treinta personas en tu casa. Mañana a las nueve hay partido y el técnico avisó de que mirará las caras.",
		"a": {"label": "QUEDARTE HASTA EL FINAL", "fx": {"energy": -14.0,
			"rel": {"pareja": 11.0, "tecnico": -4.0}}},
		"b": {"label": "SUBIR A DORMIR", "fx": {"energy": 4.0,
			"rel": {"pareja": -10.0}}}},
	{"id": "pareja_bronca", "title": "HAY QUE HABLAR",
		"when": ["con_pareja", "pareja_baja"], "wear": "casual",
		"names": ["pareja"],
		"desc": "{0} apagó la televisión en mitad del resumen de la jornada y se sentó enfrente. Esta conversación llevaba meses pendiente.",
		"a": {"label": "ESCUCHARLA ENTERA", "fx": {"action": true, "energy": -6.0,
			"rel": {"pareja": 14.0}}},
		"b": {"label": "DECIRLE QUE NO ES EL MOMENTO", "fx": {"rel": {"pareja": -12.0}}}},





	{"id": "socio_cena", "title": "CENA EN SU CASA", "when": "socio",
		"names": ["socio"], "not": ["newcomer"],
		"desc": "{0} te invita a cenar con su familia la víspera del partido. Es media noche que no duermes, y de las que se recuerdan.",
		"a": {"label": "VOY", "fx": {"socio": 7, "energy": -9.0,
			"rel": {"equipo": 3.0, "tecnico": -3.0}}},
		"b": {"label": "OTRO DÍA", "fx": {"socio": -3, "energy": 4.0,
			"rel": {"tecnico": 2.0}}}},
	{"id": "socio_rehab", "title": "LA REHABILITACIÓN ES SOLA", "when": "socio",
		"names": ["socio"],
		"desc": "{0} se rompió y hace la recuperación por su cuenta, en un gimnasio vacío mientras los demás entrenan. Nadie va a saber si apareces o no.",
		"a": {"label": "ACOMPAÑARLO", "fx": {"action": true, "socio": 7,
			"energy": -8.0, "rel": {"equipo": 4.0, "tecnico": 2.0}}},
		"b": {"label": "YA VOLVERÁ", "fx": {"socio": -3,
			"rel": {"equipo": -2.0}}}},
	{"id": "socio_padrino", "title": "TE QUIERE DE PADRINO", "when": "socio",
		"names": ["socio"], "not": ["newcomer"],
		"desc": "{0} se casa en pretemporada y te pide que estés a su lado. Es un fin de semana entero, y tú tenías otros planes con tu descanso.",
		"a": {"label": "ACEPTAR", "fx": {"action": true, "socio": 8,
			"energy": -6.0, "money_wage": -0.5,
			"rel": {"prensa": 3.0, "tecnico": -2.0}}},
		"b": {"label": "EXCUSARTE", "fx": {"socio": -5,
			"rel": {"prensa": -2.0}}}},
	{"id": "socio_dinero", "title": "TE PIDE DINERO", "when": "socio",
		"names": ["socio"], "not": ["newcomer"],
		"desc": "{0} te llama de noche y tarda un rato en llegar al punto: en su casa hay un lío y necesita una mano. No dice cuándo te lo devuelve.",
		"a": {"label": "PRESTÁRSELO", "fx": {"socio": 9, "money_wage": -3.0,
			"rel": {"equipo": 3.0}}},
		"b": {"label": "NO PUEDO", "fx": {"socio": -6,
			"rel": {"agente": 2.0}}}},
	{"id": "socio_despedida", "title": "SU ÚLTIMO DÍA", "when": "socio",
		"names": ["socio"], "not": ["newcomer"],
		"desc": "El traspaso de {0} está firmado y mañana ya no entrena aquí. El vestuario hará lo de siempre: un aplauso, una foto y a lo suyo.",




		"a": {"label": "ORGANIZARLE UNA DESPEDIDA", "fx": {"action": true,
			"socio": 10, "energy": -5.0, "money_wage": -1.5,
			"rel": {"equipo": 6.0, "tecnico": -2.0}}},
		"b": {"label": "UN ABRAZO Y YA", "fx": {"socio": -2,
			"rel": {"equipo": -2.0, "tecnico": 1.0}}}},
	{"id": "socio_tele", "title": "SÓLO CABE UNO", "when": "socio",
		"names": ["socio"], "not": ["newcomer"],
		"desc": "Un programa os invita a {0} y a ti, pero la productora sólo tiene caché para uno y te lo ha ofrecido a ti primero. Él todavía no lo sabe.",
		"a": {"label": "QUE VAYA ÉL", "fx": {"socio": 8,
			"rel": {"prensa": -4.0, "equipo": 3.0}}},
		"b": {"label": "IR YO", "fx": {"socio": -5, "money_sponsor": 2.0,
			"rel": {"prensa": 5.0}}}},
]


















const POST_MATCH_P: float = 0.22

































































const POST_MATCH: Array = [


	{"id": "ps4_o_dt", "title": "NOCHE LIBRE",
		"desc": "Tus amigos te esperan para una noche de videojuegos. El técnico ofrece una sesión extra de vídeo y tiros a puerta. No llegas a las dos.",
		"a": {"label": "CONSOLA CON AMIGOS", "fx": {"energy": 6.0, "rel": {"equipo": 6.0, "tecnico": -4.0}}},
		"b": {"label": "ENTRENAR CON EL DT", "fx": {"energy": -8.0, "rel": {"tecnico": 7.0, "equipo": -3.0}}}},
	{"id": "plato_o_descanso", "title": "TE QUIEREN EN EL PLATÓ",
		"desc": "El programa deportivo de la noche te reserva el asiento bueno. O eso, o el sofá de casa con las piernas en alto.",
		"a": {"label": "IR A LA ENTREVISTA", "fx": {"energy": -6.0, "rel": {"prensa": 7.0, "aficion": 3.0, "tecnico": -2.0}}},
		"b": {"label": "DESCANSAR EN CASA", "fx": {"energy": 8.0, "rel": {"prensa": -4.0}}}},
	{"id": "aficion_o_prensa", "title": "TODOS TE BUSCAN",
		"desc": "A la salida hay dos corros: la afición con camisetas y bufandas, y los periodistas con micrófonos. Solo te da tiempo a uno.",
		"a": {"label": "FIRMAR A LA AFICIÓN", "fx": {"rel": {"aficion": 7.0, "prensa": -3.0}}},
		"b": {"label": "ATENDER A LA PRENSA", "fx": {"rel": {"prensa": 7.0, "aficion": -3.0}}}},
	{"id": "agente_o_dt", "title": "DOS CENAS, UNA NOCHE",
		"desc": "Tu agente reservó mesa para hablar de tu futuro. El técnico te invitó a la suya para hablar del equipo. Coinciden a la misma hora.",
		"a": {"label": "CENAR CON TU AGENTE", "fx": {"rel": {"agente": 7.0, "tecnico": -3.0}}},
		"b": {"label": "CENAR CON EL DT", "fx": {"rel": {"tecnico": 7.0, "agente": -3.0}}}},


	{"id": "gym_o_marca", "title": "LA TARDE DESPUÉS", "req": "sponsor",
		"when": "played",
		"desc": "El readaptador te espera en el gimnasio para soltar piernas. Tu marca, a la misma hora, monta una firma pagada.",
		"a": {"label": "GIMNASIO", "fx": {"energy": -5.0, "rel": {"tecnico": 5.0, "agente": -3.0}}},
		"b": {"label": "ACTO DE LA MARCA", "fx": {"money_sponsor": 2.5, "rel": {"agente": 6.0, "tecnico": -3.0}}}},
	{"id": "equipo_o_casa", "title": "TERCER TIEMPO",
		"desc": "El vestuario se va a celebrar (o a lamentar) el resultado hasta tarde. En casa te esperaban para cenar tranquilo.",
		"a": {"label": "SALIR CON EL EQUIPO", "fx": {"energy": -12.0, "rel": {"equipo": 7.0, "prensa": 2.0}}},
		"b": {"label": "NOCHE EN CASA", "fx": {"energy": 6.0, "rel": {"equipo": -3.0}}}},













	{"id": "dorsal", "title": "ESA CAMISETA TIENE DUEÑO", "when": "shirt",
		"names": ["dorsal"],
		"desc": "El número que quieres cuelga dos perchas más allá, con el nombre de {0} encima. Cambiarlo se hace más de lo que parece.",
		"a": {"label": "COMPRÁRSELO", "fx": {"money_wage": -2.5, "shirt": true,
			"rel": {"equipo": 3.0, "agente": -2.0}}},
		"b": {"label": "PEDIRLO AL CLUB", "fx": {"shirt": true,
			"rel": {"equipo": -8.0, "tecnico": -2.0}}},
		"c": {"label": "DEJARLO ESTAR", "fx": {"rel": {"equipo": 5.0}}}},



























	{"id": "socio_penal", "title": "ÉL QUIERE EL PENALTI", "when": "socio",
		"names": ["socio"],
		"desc": "{0} lleva tres partidos sin marcar y te pide el próximo penalti. Los dos sabéis que el goleo del año se decide en detalles como éste.",
		"a": {"label": "SE LO DEJO", "fx": {"socio": 6,
			"rel": {"equipo": 5.0, "prensa": -2.0}}},
		"b": {"label": "LOS TIRO YO", "fx": {"socio": -4,
			"rel": {"tecnico": 2.0}}}},
	{"id": "socio_prensa", "title": "TE PREGUNTAN POR ÉL", "when": "socio",
		"names": ["socio"],
		"desc": "Un periodista quiere que valores el mal momento de {0}. La pregunta viene con la respuesta puesta y toda la sala esperando.",
		"a": {"label": "LO DEFIENDO", "fx": {"socio": 5,
			"rel": {"equipo": 4.0, "prensa": -3.0}}},
		"b": {"label": "NO ME MOJO", "fx": {"socio": -3,
			"rel": {"prensa": 2.0}}}},
	{"id": "socio_secreto", "title": "SABES DÓNDE ESTUVO", "when": "socio",
		"names": ["socio"], "not": ["newcomer"],
		"desc": "{0} salió la víspera y lo sabes tú solo. El míster acaba de preguntar en voz alta por qué se movió como si llevara piedras en los pies.",
		"a": {"label": "TAPARLO", "fx": {"socio": 7,
			"rel": {"tecnico": -5.0, "equipo": 4.0}}},
		"b": {"label": "DECIR LA VERDAD", "fx": {"socio": -9,
			"rel": {"tecnico": 5.0, "equipo": -4.0}}}},
	{"id": "socio_gol", "title": "EL GOL ES TUYO", "when": ["socio", "scored"],
		"names": ["socio"],
		"desc": "Acabas de marcar y la grada corea tu nombre. {0} lleva un mes sin jugar y te mira desde el banquillo, aplaudiendo con las manos flojas.",
		"a": {"label": "DEDICÁRSELO", "fx": {"socio": 6,
			"rel": {"aficion": -2.0, "equipo": 3.0}}},
		"b": {"label": "CORRER A LA GRADA", "fx": {"socio": -3,
			"rel": {"aficion": 3.0}}}},
	{"id": "socio_suplente", "title": "LO DEJÓ FUERA", "when": "socio",
		"names": ["socio"], "not": ["newcomer"],
		"desc": "{0} no entró en la lista y lleva media hora sin hablar con nadie. Tú sí juegas, y el míster te escucha más que a él.",
		"a": {"label": "HABLAR POR ÉL", "fx": {"socio": 6,
			"rel": {"tecnico": -4.0, "equipo": 3.0}}},
		"b": {"label": "NO ES MI PELEA", "fx": {"socio": -3,
			"rel": {"tecnico": 1.0}}}},
	{"id": "socio_bronca", "title": "OS GRITASTEIS", "when": "socio",
		"names": ["socio"],
		"desc": "Le pediste el balón a gritos, él te contestó peor, y el banquillo entero lo vio. En el vestuario nadie ha dicho una palabra desde entonces.",
		"a": {"label": "PEDIR PERDÓN YO", "fx": {"socio": 6,
			"rel": {"equipo": 3.0, "prensa": -2.0}}},
		"b": {"label": "QUE SE LE PASE", "fx": {"socio": -4}}},


	{"id": "capitan", "title": "TE POSTULAN DE CAPITÁN", "when": "casi_capitan",
		"not": ["newcomer", "captain", "captain_blocked"],
		"desc": "El vestuario vota y tu nombre suena para el brazalete. Aceptar es echarte el equipo a la espalda; ceder es un gesto al veterano de siempre.",
		"a": {"label": "ACEPTAR EL BRAZALETE", "fx": {"captain_grant": true,
			"rel": {"tecnico": 6.0, "prensa": 3.0, "equipo": -4.0}}},
		"b": {"label": "APOYAR AL VETERANO", "fx": {"rel": {"equipo": 7.0, "prensa": -3.0}}}},


	{"id": "vida_privada", "title": "QUIEREN TU VIDA PRIVADA",
		"when": "famous", "not": ["newcomer"],
		"desc": "Una revista ofrece una fortuna por abrir las puertas de tu casa. Tu agente prefiere que sigas siendo un misterio que se cotiza.",
		"a": {"label": "ABRIR LAS PUERTAS", "fx": {"rel": {"prensa": 7.0, "aficion": 3.0, "agente": -4.0}}},
		"b": {"label": "MANTENER EL MISTERIO", "fx": {"rel": {"agente": 6.0, "prensa": -4.0}}}},








	{"id": "paparazzi", "title": "LOS PAPARAZZI", "when": "estrella",
		"desc": "Un fotógrafo lleva días pegado a ti: el coche, el restaurante, la salida del entreno. Anoche te sacó cenando a las tantas y mañana sale en portada.",
		"a": {"label": "DENUNCIARLO", "fx": {"rel": {"prensa": -2.0, "aficion": 2.0}}},
		"b": {"label": "DEJARLO PASAR", "fx": {"energy": -5.0, "rel": {"aficion": -1.0}}}},
	{"id": "baile_redes", "title": "EL BAILE DE MODA",
		"desc": "El community manager del club te persigue para grabar el baile viral del momento. El míster odia esas cosas.",
		"a": {"label": "GRABAR EL BAILE", "fx": {"rel": {"prensa": 6.0, "aficion": 4.0, "tecnico": -3.0}}},
		"b": {"label": "NI DE BROMA", "fx": {"rel": {"tecnico": 5.0, "prensa": -3.0}}}},
	{"id": "rondo_hijo", "title": "EL HIJO DEL MÍSTER",
		"desc": "En el rondo te toca marcar al hijo del técnico, que anda de pruebas. Puedes hacerle un caño de los que duelen o dejarle lucirse.",
		"a": {"label": "HACERLE UN CAÑO", "fx": {"rel": {"equipo": 6.0, "tecnico": -4.0}}},
		"b": {"label": "DEJARLE LUCIRSE", "fx": {"rel": {"tecnico": 6.0, "equipo": -3.0}}}},

	{"id": "autografo_lluvia", "title": "UN NIÑO BAJO LA LLUVIA", "when": "played",
		"desc": "Sales muerto y llueve, pero un niño lleva dos horas esperando con tu camiseta y un rotulador.",
		"a": {"label": "PARARTE A FIRMAR", "fx": {"energy": -4.0, "rel": {"aficion": 6.0}}},
		"b": {"label": "AL AUTOBÚS", "fx": {"energy": 3.0, "rel": {"aficion": -4.0}}}},


	{"id": "micro_polemica", "title": "UN MICRÓFONO CALIENTE", "when": "benched",
		"desc": "Un periodista te tienta: '¿de verdad estás contento con tu papel en el equipo?'. Una frase gorda vende titulares, pero el míster lo verá.",
		"a": {"label": "MORDERTE LA LENGUA", "fx": {"rel": {"tecnico": 4.0}}},

		"b": {"label": "SOLTARLO TODO", "fx": {"multa": 1.0,
			"rel": {"prensa": 7.0, "aficion": 3.0, "tecnico": -7.0}}}},

	{"id": "bus_nuevo", "title": "¿CON QUIÉN TE SIENTAS?", "when": "newcomer",
		"arrival": true,
		"desc": "Primer viaje con el equipo. En el autobús quedan tres sitios libres, y con quién te sientas se nota.",
		"a": {"label": "CON LOS VETERANOS", "fx": {"rel": {"equipo": 6.0, "tecnico": -2.0, "prensa": -2.0}}},
		"b": {"label": "CON EL MÍSTER", "fx": {"rel": {"tecnico": 6.0, "equipo": -2.0, "aficion": -2.0}}},
		"c": {"label": "GRABANDO PARA REDES", "fx": {"rel": {"prensa": 6.0, "aficion": 2.0, "equipo": -3.0}}}},
	{"id": "primera_entrevista", "title": "TU PRIMERA ENTREVISTA", "when": "newcomer",
		"arrival": true,
		"desc": "Micrófono delante y una sola pregunta abierta. Lo que digas te retrata.",
		"a": {"label": "DEL EQUIPO", "fx": {"rel": {"equipo": 6.0, "prensa": -2.0, "aficion": -2.0}}},
		"b": {"label": "DE TUS METAS", "fx": {"rel": {"prensa": 6.0, "equipo": -2.0, "tecnico": -2.0}}},
		"c": {"label": "DE LA AFICIÓN", "fx": {"rel": {"aficion": 6.0, "prensa": -2.0, "equipo": -1.0}}}},


	{"id": "dedica_gol", "title": "¿A QUIÉN LO DEDICAS?", "when": "scored",
		"desc": "Acabas de marcar y la cámara te busca. El gesto que hagas ahora lo verá todo el estadio.",
		"a": {"label": "AL MÍSTER", "fx": {"rel": {"tecnico": 6.0, "aficion": -2.0, "prensa": -2.0}}},
		"b": {"label": "A LA GRADA", "fx": {"rel": {"aficion": 6.0, "tecnico": -2.0, "equipo": -1.0}}},
		"c": {"label": "A CÁMARA, TU MARCA", "fx": {"rel": {"prensa": 6.0, "agente": 2.0, "equipo": -3.0}}}},
	{"id": "dia_libre_triple", "title": "DÍA LIBRE",
		"desc": "Jornada sin obligaciones. Puedes desconectar en casa, salir con el grupo, o meter horas de gimnasio por tu cuenta.",
		"a": {"label": "DESCANSAR EN CASA", "fx": {"energy": 12.0, "rel": {"equipo": -2.0, "tecnico": -2.0}}},
		"b": {"label": "SALIR CON EL EQUIPO", "fx": {"energy": -6.0, "rel": {"equipo": 6.0, "tecnico": -2.0}}},
		"c": {"label": "GIMNASIO POR TU CUENTA", "fx": {"energy": -6.0, "rel": {"tecnico": 6.0, "equipo": -2.0}}}},
	{"id": "foto_equipo", "title": "LA FOTO DE EQUIPO",
		"desc": "El fotógrafo coloca la foto de plantilla. Hay hueco delante con el capitán, en el centro entre todos, o pegado al cuerpo técnico.",
		"a": {"label": "DELANTE, PROTAGONISTA", "fx": {"rel": {"prensa": 6.0, "equipo": -2.0, "tecnico": -2.0}}},
		"b": {"label": "EN EL CENTRO, CON TODOS", "fx": {"rel": {"equipo": 6.0, "prensa": -2.0, "tecnico": -1.0}}},
		"c": {"label": "AL LADO DEL MÍSTER", "fx": {"rel": {"tecnico": 6.0, "equipo": -2.0, "prensa": -1.0}}}},
	{"id": "marcas_triple", "title": "TRES MARCAS TE TANTEAN", "req": "sponsor",
		"desc": "Tres patrocinadores mueven ficha a la vez: la deportiva de siempre, una firma de moda, y la marca local de tu ciudad.",
		"a": {"label": "LA DEPORTIVA", "fx": {"rel": {"agente": 6.0, "prensa": -2.0, "aficion": -1.0}}},
		"b": {"label": "LA DE MODA", "fx": {"rel": {"prensa": 6.0, "agente": -2.0, "aficion": -2.0}}},
		"c": {"label": "LA LOCAL", "fx": {"rel": {"aficion": 6.0, "agente": -2.0, "prensa": -1.0}}}},









	{"id": "redes_triple", "title": "¿QUÉ SUBES A TUS REDES?",
		"desc": "Foto lista para publicar tras el partido. Lo que subas lo verá todo el mundo, y cada mensaje tiene su público.",
		"a": {"label": "FOTO CON EL VESTUARIO", "fx": {"post": "equipo",
			"rel": {"equipo": 6.0, "tecnico": 2.0}}},
		"b": {"label": "TU MOMENTO", "fx": {"post": "yo", "titular": "crecido",
			"rel": {"prensa": 6.0, "agente": 2.0, "equipo": -3.0}}},
		"c": {"label": "PARA LA GRADA", "fx": {"post": "gente",
			"rel": {"aficion": 6.0, "prensa": 1.0, "tecnico": -2.0}}}},




	{"id": "cantar_o_bailar", "title": "NOVATADA EN LA COMIDA", "when": "newcomer",
		"arrival": true,
		"desc": "Primera comida con la plantilla y toca ritual de novato: subirte a la silla a cantar, o marcarte un baile. Elige tu veneno y reza.",
		"a": {"label": "CANTAR", "fx": {"risk": {"p": 0.6,
			"win": {"rel": {"equipo": 5.0, "aficion": 4.0}}, "lose": {"rel": {"equipo": -3.0, "tecnico": -3.0}},
			"win_msg": "Te saliste: el vestuario te corea de pie.", "lose_msg": "Desafinaste fatal. Qué vergüenza ajena."}}},
		"b": {"label": "BAILAR", "fx": {"risk": {"p": 0.5,
			"win": {"rel": {"equipo": 6.0, "prensa": 3.0}}, "lose": {"rel": {"equipo": -3.0, "tecnico": -3.0}},
			"win_msg": "¡La rompiste! Hasta el utillero lo grabó.", "lose_msg": "Bailaste terrible. No lo superan."}}}},
	{"id": "keepie", "title": "RETO VIRAL DE DOMINADAS",
		"desc": "Un compañero saca el móvil: reto de toques al balón para subirlo a redes. La cámara ya está grabando.",
		"a": {"label": "INTENTARLO", "fx": {"risk": {"p": 0.6,
			"win": {"rel": {"prensa": 5.0, "aficion": 4.0}}, "lose": {"rel": {"prensa": -3.0, "aficion": -2.0}},
			"win_msg": "¡Clip perfecto! Se hace viral.", "lose_msg": "Se te cae a la segunda. Meme asegurado."}}},
		"b": {"label": "NO ME LA JUEGO", "fx": {"rel": {"prensa": -2.0}}}},


	{"id": "fifa_estrella", "title": "DUELO DE CONSOLA",
		"desc": "El crack del vestuario te reta a la consola delante de todos. Ganarle da galones; perder, cachondeo para semanas.",
		"a": {"label": "ACEPTAR EL DUELO", "fx": {"risk": {"p": 0.5,
			"win": {"rel": {"equipo": 6.0, "prensa": 2.0}}, "lose": {"rel": {"equipo": -4.0}},
			"win_msg": "¡Le ganas en la prórroga! Respeto total.", "lose_msg": "Paliza. Te lo recordarán a diario."}}},
		"b": {"label": "OTRO DÍA", "fx": {"rel": {"equipo": -2.0}}}},
	{"id": "casino_agente", "title": "NOCHE DE CASINO",
		"desc": "Tu agente te lleva al casino a 'hacer contactos'. La ruleta llama y él te anima a mojarte.",
		"a": {"label": "APOSTAR FUERTE", "fx": {"risk": {"p": 0.45,
			"win": {"rel": {"agente": 5.0}, "money_wage": 2.0}, "lose": {"rel": {"agente": -3.0}, "money_wage": -2.0},
			"win_msg": "¡Pleno! El agente te mira con otros ojos.", "lose_msg": "Lo dejas todo en la mesa. Ay."}}},
		"b": {"label": "SOLO MIRAR", "fx": {"rel": {"agente": -1.0}}}},

	{"id": "pronostico_tv", "title": "UN PRONÓSTICO ATREVIDO",
		"not": ["newcomer"],
		"desc": "En directo te piden mojarte con el próximo gran partido. Acertar te hace profeta; fallar, el hazmerreír.",
		"a": {"label": "MOJARTE", "fx": {"risk": {"p": 0.55,
			"win": {"rel": {"prensa": 6.0, "aficion": 3.0}}, "lose": {"rel": {"prensa": -4.0}},
			"win_msg": "Clavaste el pronóstico. Portada.", "lose_msg": "Ni una. Los memes no perdonan."}}},
		"b": {"label": "AGUA, NI ME MOJO", "fx": {"rel": {"prensa": -2.0}}}},
	{"id": "penalti_reto", "title": "DUELO DE PENALTIS",
		"desc": "El portero te reta a penaltis al acabar el entreno y medio vestuario se queda a mirar y a picarse.",
		"a": {"label": "ACEPTAR", "fx": {"risk": {"p": 0.6,
			"win": {"rel": {"equipo": 5.0, "tecnico": 3.0}}, "lose": {"rel": {"equipo": -3.0}},
			"win_msg": "Le ganas la tanda. Ovación del grupo.", "lose_msg": "Te para tres. Sonrojo."}}},
		"b": {"label": "A LA DUCHA", "fx": {"rel": {"equipo": -2.0}}}},
	{"id": "karaoke", "title": "KARAOKE DE CONCENTRACIÓN",
		"desc": "Noche de karaoke en la concentración. Todos esperan a ver si te atreves con el micro.",
		"a": {"label": "COGER EL MICRO", "fx": {"risk": {"p": 0.55,
			"win": {"rel": {"equipo": 6.0, "aficion": 2.0}}, "lose": {"rel": {"equipo": -3.0, "prensa": -2.0}},
			"win_msg": "¡Estrella de la noche! Grupo rendido.", "lose_msg": "Un desastre. Y alguien lo grabó."}}},
		"b": {"label": "PASAR EL MICRO", "fx": {"rel": {"equipo": -2.0}}}},


	{"id": "baile_gol", "title": "ESTRENAR BAILE DE GOL",
		"when": "scored",
		"desc": "El vestuario te pincha para que te inventes una celebración nueva para el próximo gol. O sale icónica, o sale ridícula.",
		"a": {"label": "INVENTARME UNO", "fx": {"risk": {"p": 0.5,
			"win": {"rel": {"aficion": 6.0, "prensa": 4.0}}, "lose": {"rel": {"aficion": -3.0, "tecnico": -2.0}},
			"win_msg": "¡Se copia en todos los patios! Icónico.", "lose_msg": "Ridículo total. Mejor no marcar."}}},
		"b": {"label": "CELEBRAR NORMAL", "fx": {"rel": {"aficion": -1.0}}}},



	{"id": "ronda_victoria", "title": "LA CENA LA PAGAS TÚ", "when": ["won", "newcomer"],
		"arrival": true,
		"desc": "Victoria y el vestuario mira al recién llegado: la cena de celebración la paga el nuevo. Es tradición, y es cara.",
		"a": {"label": "PAGAR CON GUSTO", "fx": {"money_wage": -1.0, "rel": {"equipo": 6.0}}},
		"b": {"label": "ESCAQUEARTE", "fx": {"rel": {"equipo": -4.0}}}},


	{"id": "heroe_victoria", "title": "FUISTE LA FIGURA", "when": ["won", "standout"],
		"desc": "Ganasteis y todos preguntan por ti. La sala de prensa está llena y tienes las piernas fundidas.",
		"a": {"label": "ATENDER A TODOS", "fx": {"energy": -5.0, "rel": {"prensa": 7.0, "aficion": 3.0}}},
		"b": {"label": "DIRECTO A CASA", "fx": {"energy": 6.0, "rel": {"prensa": -3.0}}}},
	{"id": "culpables_derrota", "title": "BUSCANDO CULPABLES", "when": "lost",
		"desc": "Derrota y el vestuario arde. El míster pide explicaciones mirando a los ojos. Puedes dar la cara o mirar al suelo.",
		"a": {"label": "DAR LA CARA", "fx": {"rel": {"tecnico": 5.0, "equipo": -2.0}}},
		"b": {"label": "MIRAR AL SUELO", "fx": {"rel": {"tecnico": -5.0}}}},


	{"id": "bronca_capitan", "title": "BRONCA EN EL VESTUARIO", "when": "lost",
		"not": ["captain"],
		"desc": "Tras perder, el capitán monta un pollo y señala a los que no corrieron. Puedes respaldarle o quedarte callado.",
		"a": {"label": "RESPALDAR AL CAPITÁN", "fx": {"rel": {"equipo": 6.0, "tecnico": -2.0}}},
		"b": {"label": "CALLAR Y AGUANTAR", "fx": {"rel": {"tecnico": 3.0, "equipo": -3.0}}}},
	{"id": "micro_derrota", "title": "PREGUNTA ENVENENADA", "when": "lost",
		"desc": "Recién perdido, un periodista te empuja a cargar contra el árbitro. Un titular fácil, pero el técnico odia el circo.",
		"a": {"label": "CONTENERTE", "fx": {"rel": {"tecnico": 4.0, "prensa": -1.0}}},



		"b": {"label": "CARGAR CONTRA TODO", "fx": {"multa": 1.0,
			"rel": {"prensa": 6.0, "aficion": 2.0, "tecnico": -6.0}}}},


	{"id": "ciudad_derbi", "title": "GANASTE EL DERBI", "when": ["derby", "won"],
		"desc": "El derbi cayó de tu lado y la ciudad es una fiesta. La grada corea tu nombre y te invitan a salir a celebrar hasta el amanecer.",
		"a": {"label": "CELEBRAR CON LA GRADA", "fx": {"energy": -12.0, "rel": {"aficion": 8.0, "prensa": 3.0}}},
		"b": {"label": "CELEBRAR CON MODESTIA", "fx": {"energy": 2.0, "rel": {"tecnico": 5.0, "aficion": -2.0}}}},


	{"id": "reto_derbi", "title": "EL RETO DEL DERBI", "when": ["derby", "scored"],
		"desc": "Antes del derbi el vestuario se retó: el que marque, se rapa. Marcaste. Ahora toca cumplir delante de las cámaras… o rajarte.",
		"a": {"label": "CUMPLIR Y RAPARTE", "fx": {"risk": {"p": 0.65,
			"win": {"rel": {"equipo": 6.0, "aficion": 4.0}}, "lose": {"rel": {"prensa": -3.0, "aficion": -2.0}},
			"win_msg": "¡Leyenda del vestuario! La grada lo adora.", "lose_msg": "El corte sale fatal. Cachondeo eterno."}}},
		"b": {"label": "RAJARTE", "fx": {"rel": {"equipo": -4.0}}}},


	{"id": "medico_o_mister", "title": "MOLESTIA A CUESTAS", "when": "played",
		"desc": "Arrastras una molestia. El médico aconseja parar; el míster quiere verte en el próximo entreno fuerte, sin excusas.",
		"a": {"label": "FORZAR POR EL MÍSTER", "fx": {"energy": -8.0, "rel": {"tecnico": 5.0, "equipo": -2.0}}},
		"b": {"label": "HACER CASO AL MÉDICO", "fx": {"energy": 8.0, "rel": {"tecnico": -4.0}}}},



	{"id": "benefico_ciudad", "title": "TU CIUDAD TE LLAMA", "wear": "casual",
		"not": ["newcomer"],
		"desc": "Tu ciudad natal organiza un partido benéfico y quieren tu cara en el cartel. Es un día entero fuera.",
		"a": {"label": "IR AL BENÉFICO", "fx": {"energy": -6.0, "rel": {"aficion": 7.0}}},
		"b": {"label": "EXCUSARTE", "fx": {"energy": 4.0, "rel": {"aficion": -4.0}}}},










	{"id": "dardos", "title": "CAMPEONATO DE DARDOS",
		"desc": "En la concentración montan un torneo de dardos con piques de por medio. El que gana, manda esa semana.",
		"a": {"label": "APUNTARTE", "fx": {"risk": {"p": 0.55,
			"win": {"rel": {"equipo": 5.0, "prensa": 2.0}}, "lose": {"rel": {"equipo": -3.0}},
			"win_msg": "¡Campeón! Mandas en el vestuario.", "lose_msg": "Última ronda de vergüenza."}}},
		"b": {"label": "SOLO MIRAR", "fx": {"rel": {"equipo": -2.0}}}},
	{"id": "presi_victoria", "title": "EL PRESIDENTE BAJA", "when": "won",
		"desc": "Tras la victoria el presidente baja eufórico al vestuario a felicitar uno por uno. Todos miran a quién saluda primero.",
		"a": {"label": "DEDICARLE LA VICTORIA", "fx": {"rel": {"tecnico": 5.0, "agente": 2.0, "equipo": -2.0}}},
		"b": {"label": "CELEBRAR CON EL GRUPO", "fx": {"rel": {"equipo": 6.0, "tecnico": -2.0}}}},












	{"id": "ojeador_grada", "title": "UN OJEADOR EN LA GRADA",
		"when": ["lower_league", "standout"],
		"desc": "Un club grande mandó ojeador a verte y la prensa local se enteró. Todos quieren saber si sueñas con irte.",
		"a": {"label": "HABLAR DEL SUEÑO", "fx": {"rel": {"prensa": 7.0, "agente": 3.0, "tecnico": -4.0}}},
		"b": {"label": "QUITARLE HIERRO", "fx": {"rel": {"tecnico": 5.0, "agente": -3.0}}}},


	{"id": "companero_curro", "title": "EL SEGUNDO TRABAJO",
		"when": "lower_league", "wear": "casual",
		"desc": "Un compañero reparte paquetes por las mañanas para llegar a fin de mes. Esta semana no puede y te pide cubrirle una tarde.",
		"a": {"label": "ECHARLE LA TARDE", "fx": {"energy": -8.0, "rel": {"equipo": 8.0}}},
		"b": {"label": "NO PUEDO", "fx": {"rel": {"equipo": -3.0}}}},


	{"id": "cancha_tierra", "title": "ESTE CAMPO ES UN PATATAL",
		"when": ["lower_league", "newcomer"],
		"desc": "El césped es un parche de tierra y bote falso. Un periodista te pregunta, sonriendo, qué te parece tu nuevo estadio.",
		"a": {"label": "DECIR LA VERDAD", "fx": {"rel": {"prensa": 5.0, "aficion": -4.0}}},
		"b": {"label": "'AQUÍ SE JUEGA IGUAL'", "fx": {"rel": {"aficion": 4.0}}}},




	{"id": "documental", "title": "CÁMARAS EN EL VESTUARIO",
		"when": ["top_flight", "famous"],
		"desc": "Una plataforma quiere rodar tu documental: un mes de cámaras siguiéndote hasta dentro del vestuario. Pagan bien. El grupo no sonríe.",
		"a": {"label": "FIRMAR EL RODAJE", "fx": {"money_sponsor": 2.0,
			"rel": {"prensa": 9.0, "equipo": -6.0, "tecnico": -4.0}}},
		"b": {"label": "PROTEGER EL GRUPO", "fx": {"rel": {"equipo": 5.0, "prensa": -3.0}}}},


	{"id": "clausula_portada", "title": "TU CIFRA EN PORTADA",
		"when": ["top_flight", "last_year"],
		"desc": "Un diario publica lo que pides por renovar, con cifra y todo. Es casi exacta. Confirmarla presiona al club; negarla te protege.",
		"a": {"label": "CONFIRMARLA", "fx": {"rel": {"agente": 8.0, "aficion": -6.0, "tecnico": -2.0}}},
		"b": {"label": "NEGARLO TODO", "fx": {"rel": {"aficion": 4.0, "agente": -4.0}}}},



	{"id": "penalti_no_tirado", "title": "EL PENALTI QUE NO TIRASTE",
		"when": ["played", "lost"],
		"desc": "El designado falló el penalti que costó el partido. Tú eras el segundo de la lista y la prensa lo sabe.",
		"a": {"label": "RESPALDARLO", "fx": {"rel": {"equipo": 7.0, "prensa": -3.0}}},
		"b": {"label": "'YO LO PEDÍ'", "fx": {"rel": {"prensa": 6.0, "equipo": -6.0, "tecnico": -3.0}}}},


	{"id": "pizarra_racha", "title": "TUS NÚMEROS EN LA PIZARRA",
		"when": "slumping",
		"desc": "Un analista joven te espera con tu mala racha desmenuzada en la pizarra: mapas, flechas y todo lo que no estás haciendo.",
		"a": {"label": "TRAGARTE EL ORGULLO", "fx": {"energy": -6.0, "rel": {"tecnico": 6.0}}},
		"b": {"label": "MANDARLO A PASEO", "fx": {"risk": {"p": 0.4,
			"win": {"rel": {"prensa": 5.0, "equipo": 3.0}}, "lose": {"rel": {"tecnico": -8.0}},
			"win_msg": "El siguiente partido te da la razón.",
			"lose_msg": "La racha sigue y el míster no olvida."}}}},



	{"id": "suplente_aplauso", "title": "LA CÁMARA TE ENFOCÓ",
		"when": "benched", "not": ["newcomer"],
		"desc": "Otro partido desde el banco, y la cámara te pilló con cara larga. En redes debaten si eres mal compañero.",
		"a": {"label": "'APOYO AL EQUIPO'", "fx": {"rel": {"equipo": 5.0, "tecnico": 3.0, "prensa": -2.0}}},
		"b": {"label": "NO ACLARAR NADA", "fx": {"rel": {"prensa": 4.0, "equipo": -4.0}}}},










	{"id": "discurso_nuevo", "title": "EL DISCURSO DEL NUEVO", "when": "newcomer",
		"arrival": true,
		"desc": "Primer día con el grupo entero sentado y el míster te cede la palabra. Cuarenta segundos y todo el vestuario midiéndote.",
		"a": {"label": "PROMETER TÍTULOS", "fx": {"rel": {"prensa": 6.0, "aficion": 4.0,
			"tecnico": -3.0, "equipo": -3.0}}},
		"b": {"label": "VENGO A APRENDER", "fx": {"rel": {"tecnico": 7.0, "equipo": 4.0,
			"prensa": -3.0}}},
		"c": {"label": "SÓLO SALUDAR Y SENTARTE", "fx": {"rel": {"equipo": 5.0,
			"prensa": -2.0, "aficion": -2.0}}}},
	{"id": "casa_nueva", "title": "DÓNDE VAS A VIVIR", "when": "newcomer",
		"arrival": true,
		"desc": "El club te pasa tres opciones: el ático del centro que sale en las revistas, una casa pegada a la ciudad deportiva, o seguir en el hotel y no gastar.",
		"a": {"label": "EL ÁTICO DEL CENTRO", "fx": {"money_wage": -3.0,
			"rel": {"prensa": 6.0, "aficion": 4.0, "tecnico": -2.0}}},
		"b": {"label": "PEGADO AL ENTRENAMIENTO", "fx": {"money_wage": -1.5,
			"rel": {"tecnico": 6.0, "equipo": 3.0, "prensa": -2.0}}},
		"c": {"label": "SEGUIR EN EL HOTEL", "fx": {"rel": {"equipo": -4.0,
			"aficion": -3.0}}}},































	{"id": "plante_minutos", "title": "EL PLANTE POR LOS MINUTOS", "when": "benched",
		"not": ["newcomer"],
		"desc": "Otra jornada mirando desde el banco. Tu agente ya tiene el titular escrito y un periodista esperando; el míster te ha citado a solas antes de que salga.",
		"a": {"label": "EXIGIRLO EN PÚBLICO", "fx": {"rel": {"prensa": 14.0, "agente": 10.0,
			"tecnico": -10.0, "equipo": -3.0}}},
		"b": {"label": "TRAGAR Y CALLARTE", "fx": {"rel": {"tecnico": 12.0, "equipo": 6.0,
			"agente": -7.0, "prensa": -4.0}}}},
	{"id": "motin_vestuario", "title": "EL MOTÍN", "when": "slumping",
		"not": ["newcomer"],
		"desc": "El vestuario ha decidido que el míster se tiene que ir y hay una carta con firmas dando vueltas. Falta la tuya, y el despacho está a diez metros por el otro pasillo.",
		"a": {"label": "FIRMAR CON EL GRUPO", "fx": {"rel": {"equipo": 16.0,
			"tecnico": -11.0}}},
		"b": {"label": "AVISAR AL MÍSTER", "fx": {"rel": {"tecnico": 18.0,
			"equipo": -10.0, "prensa": -2.0}}}},
	{"id": "filtracion_renovacion", "title": "EL AÑO QUE TE QUEDA", "when": "last_year",
		"not": ["newcomer", "wants_out"],
		"desc": "Tu agente tiene un periodista al teléfono y una frase preparada: que escuchas ofertas. Filtrarla te dobla el precio y te convierte, esta misma noche, en el que ya se fue.",
		"a": {"label": "DEJARLA CAER", "fx": {"rel": {"agente": 16.0, "prensa": 12.0,
			"aficion": -10.0, "tecnico": -6.0}}},
		"b": {"label": "JURAR QUE TE QUEDAS", "fx": {"rel": {"aficion": 16.0,
			"tecnico": 12.0, "agente": -9.0}}}},
	{"id": "policia_del_brazalete", "title": "LO QUE SABE EL CAPITÁN", "when": "captain",
		"desc": "Tres se saltaron la concentración y tú los viste salir. El club te pregunta a la cara, como capitán, y el vestuario entero espera en el pasillo a ver qué dices.",
		"a": {"label": "DAR LOS NOMBRES", "fx": {"rel": {"tecnico": 16.0, "prensa": 6.0,
			"equipo": -11.0}}},
		"b": {"label": "TAPARLOS", "fx": {"rel": {"equipo": 18.0, "tecnico": -9.0,
			"prensa": -3.0}}}},








	{"id": "huelga_primas", "title": "LA HUELGA DE PRIMAS", "when": "broke",
		"not": ["newcomer"],
		"desc": "El club debe tres meses de primas y la plantilla ha decidido no salir a calentar. El míster está en el túnel mirando el reloj, y hay una cámara en la boca del vestuario.",
		"a": {"label": "SUMARTE AL PARO", "fx": {"rel": {"equipo": 18.0,
			"tecnico": -10.0, "aficion": -7.0}}},
		"b": {"label": "SALIR A CALENTAR SOLO", "fx": {"rel": {"tecnico": 18.0,
			"prensa": 8.0, "equipo": -11.0}}}},




	{"id": "final_lesionado", "title": "LA FINAL ES EL SÁBADO",
		"when": ["hurt", "final_next"],
		"desc": "El parte médico dice que no llegas. El míster te lo pide a la cara, delante del cuerpo técnico, y el doctor niega con la cabeza sin decir nada.",
		"a": {"label": "APRETAR LOS DIENTES", "fx": {"risk": {"p": 0.55,
			"win": {"play_hurt": true, "energy": -20.0,
				"rel": {"tecnico": 20.0, "aficion": 16.0, "equipo": 10.0}},
			"lose": {"injury_relapse": true, "rel": {"tecnico": 6.0, "aficion": 8.0}},
			"win_msg": "Aguantaste: estás disponible para el partido grande.",
			"lose_msg": "Se rompió del todo. La baja es larga."}}},
		"b": {"label": "HACERLE CASO AL MÉDICO", "fx": {"rel": {"tecnico": -9.0,
			"aficion": -6.0, "equipo": -4.0}}}},






	{"id": "equipo_viaja", "title": "EL EQUIPO VIAJA SIN TI", "when": "hurt",
		"desc": "El autobús sale a las nueve y tu nombre no está en la lista. El doctor dice que el viaje no te hace bien; el vestuario, que verte en el banquillo les hace bien a ellos.",
		"a": {"label": "VIAJAR CON LA EXPEDICIÓN", "fx": {"energy": -8.0,
			"rel": {"equipo": 12.0, "tecnico": 6.0}}},
		"b": {"label": "QUEDARTE EN REHABILITACIÓN", "fx": {"energy": 6.0,
			"rel": {"equipo": -3.0, "tecnico": 2.0}}}},
	{"id": "parte_filtrado", "title": "EL PARTE QUE SE FILTRÓ", "when": "hurt",
		"desc": "Un diario publica tu parte médico con dos semanas de más y un titular con la palabra «calvario». El club no fue; alguien de dentro, sí.",
		"a": {"label": "DESMENTIRLO A CÁMARA", "fx": {"rel": {"prensa": 10.0,
			"aficion": 6.0, "tecnico": -3.0}}},
		"b": {"label": "CALLAR Y RECUPERARTE", "fx": {"rel": {"prensa": -4.0,
			"tecnico": 8.0}}}},


	{"id": "medico_agente", "title": "EL MÉDICO DE TU AGENTE", "when": "hurt",
		"not": ["newcomer"],
		"desc": "Tu agente te manda la tarjeta de un doctor «que hace milagros» y que no es del club. El médico del club no sabe nada, y mejor que siga así.",
		"a": {"label": "PROBAR EL TRATAMIENTO", "fx": {"risk": {"p": 0.5,
			"win": {"injury_heal": 2, "rel": {"agente": 8.0}},
			"lose": {"injury_relapse": true, "rel": {"agente": -6.0, "tecnico": -4.0}},
			"win_msg": "El milagro existe: dos semanas menos de baja.",
			"lose_msg": "Se rompió del todo. Y el club se enteró de dónde."}}},
		"b": {"label": "CONFIAR EN EL CLUB", "fx": {"rel": {"tecnico": 8.0,
			"agente": -3.0}}}},
	{"id": "rebaja_crack", "title": "CABE UNO MÁS SI TE BAJAS", "when": "last_year",
		"not": ["newcomer"],
		"desc": "El club tiene apalabrado a un fenómeno y sólo le falta hueco en la nómina: el tuyo. Te piden por las buenas un 20% de tu sueldo, y el vestuario ya sabe que te lo han pedido.",
		"a": {"label": "BAJARTE EL SUELDO", "fx": {"wage_cut": 0.2,
			"rel": {"tecnico": 18.0, "equipo": 14.0, "aficion": 16.0, "agente": -11.0}}},
		"b": {"label": "NI UN PESO", "fx": {"rel": {"agente": 16.0, "tecnico": -8.0,
			"aficion": -7.0}}}},
	{"id": "bando_brazalete", "title": "EL BANDO DEL BRAZALETE",
		"when": ["slumping", "capitan_otro"], "not": ["captain", "newcomer"],
		"names": ["capitan"],
		"desc": "{0} está señalado y el vestuario busca relevo. Suenan dos nombres: el tuyo y el del veterano que lleva once años aquí.",
		"a": {"label": "MOVER FICHA POR EL BRAZALETE", "fx": {"rel": {"tecnico": 16.0,
			"prensa": 10.0, "equipo": -11.0}}},
		"b": {"label": "APOYAR AL VETERANO", "fx": {"captain_block": true,
			"rel": {"equipo": 20.0, "tecnico": -5.0}}}},




	{"id": "entrada_entreno", "title": "LA ENTRADA EN EL ENTRENO",
		"when": ["slumping", "rival"], "not": ["newcomer"], "names": ["rival"],
		"desc": "Fuiste a por un balón que no era tuyo y {0}, el que te disputa el puesto, se ha ido al vestuario cojeando y sin mirarte. El grupo lo vio todo.",
		"a": {"label": "PEDIR PERDÓN DELANTE DE TODOS", "fx": {"rel": {"equipo": 18.0,
			"tecnico": 10.0, "prensa": -3.0}}},
		"b": {"label": "NO DAR EXPLICACIONES", "fx": {"rival_edge": -5,
			"rel": {"equipo": -10.0, "tecnico": -6.0, "prensa": 8.0}}}},
	{"id": "suplente_mejor", "title": "EL CHAVO TE COMIÓ EL PUESTO",
		"when": ["benched", "rival"], "not": ["newcomer"], "names": ["rival"],
		"desc": "{0} entró por ti y volvió a hacerlo bien. Te busca al acabar para que le corrijas dos cosas del perfil de tiro. Enseñárselas es enseñárselas.",
		"a": {"label": "AYUDARLE", "fx": {"rival_edge": 5,
			"rel": {"equipo": 18.0, "tecnico": 8.0}}},
		"b": {"label": "CERRARLE LA PUERTA", "fx": {"rival_edge": -4,
			"rel": {"equipo": -10.0, "tecnico": -3.0}}}},












	{"id": "rival_lesionado", "title": "SE ROMPIÓ EL QUE TE PELEA EL PUESTO",
		"when": ["rival", "rival_rompible"], "not": ["newcomer"], "names": ["rival"],
		"desc": "{0} se rompió en el entreno y el puesto es tuyo hasta nuevo aviso. El vestuario mira a ver qué cara pones.",
		"a": {"label": "LLEVARLE LA REHABILITACIÓN", "fx": {"rival_baja": true, "rival_edge": 4,
			"energy": -6.0, "rel": {"equipo": 8.0, "tecnico": 4.0}}},
		"b": {"label": "APROVECHAR EL HUECO", "fx": {"rival_baja": true, "rival_edge": -3,
			"rel": {"prensa": 5.0, "equipo": -8.0, "tecnico": -3.0}}}},





	{"id": "capitan_te_cita", "title": "EL CAPITÁN TE SIENTA",
		"when": "capitan_otro", "not": ["newcomer", "captain"], "names": ["capitan"],
		"desc": "{0} te aparta antes del entreno con el brazalete en la mano: dice que el grupo está harto de tu forma de celebrar, y que te lo dice él antes de que te lo diga otro.",
		"a": {"label": "BAJAR LA CABEZA", "fx": {"rel": {"equipo": 7.0, "tecnico": 3.0,
			"prensa": -3.0}}},
		"b": {"label": "CONTESTARLE DELANTE DE TODOS", "fx": {"rel": {"prensa": 6.0,
			"agente": 3.0, "equipo": -7.0, "tecnico": -4.0}}}},



	{"id": "camiseta_rival", "title": "LA CAMISETA DEL RIVAL",
		"when_any": ["derby", "lost"],
		"desc": "Su estrella se acerca en el túnel y te ofrece cambiar camisetas. Hay veinte cámaras esperando el gesto, y la grada de tu fondo sigue ahí arriba.",
		"a": {"label": "CAMBIARLA DELANTE DE TODOS", "fx": {"rel": {"prensa": 12.0,
			"agente": 6.0, "aficion": -10.0, "tecnico": -4.0}}},
		"b": {"label": "DEJARLE CON LA MANO TENDIDA", "fx": {"rel": {"aficion": 14.0,
			"equipo": 6.0, "prensa": -4.0}}}},
	{"id": "marca_apuestas", "title": "LA OFERTA QUE NO SE RECHAZA", "when": "famous",
		"not": ["newcomer"],
		"desc": "Una casa de apuestas pone medio año de sueldo por tu cara en su cartel. La grada odia esa marca —hay pancartas cada domingo— y el club firmó contra ella.",
		"a": {"label": "COBRAR Y FIRMAR", "fx": {"money_wage": 6.0,
			"rel": {"agente": 14.0, "aficion": -10.0, "tecnico": -5.0}}},
		"b": {"label": "DECIR QUE NO", "fx": {"rel": {"aficion": 14.0, "tecnico": 8.0,
			"agente": -8.0}}}},














	{"id": "pedi_salir_vestuario", "title": "EL VESTUARIO YA LO SABE",
		"when": "wants_out", "not": ["newcomer"],
		"desc": "Pediste salir y la noticia llegó antes que tú al vestuario. Nadie te dice nada, que es peor. El capitán te espera apoyado en tu taquilla.",
		"a": {"label": "DAR LA CARA", "fx": {"action": true,
			"rel": {"equipo": 12.0, "tecnico": 6.0, "agente": -4.0}}},
		"b": {"label": "NO ES ASUNTO SUYO", "fx": {"rel": {"equipo": -8.0,
			"tecnico": -3.0, "agente": 8.0}}}},
	{"id": "pedi_salir_grada", "title": "LA GRADA TE CANTA",
		"when": "wants_out", "not": ["newcomer"],
		"desc": "En el calentamiento un fondo entero te canta que te vayas ya. A la salida hay bufandas en el suelo y una cámara esperando tu cara.",
		"a": {"label": "APLAUDIR AL FONDO", "fx": {"rel": {"aficion": 14.0,
			"prensa": -2.0, "agente": -3.0}}},
		"b": {"label": "SALIR SIN MIRAR", "fx": {"rel": {"aficion": -9.0,
			"agente": 6.0}}}},
	{"id": "en_venta_prensa", "title": "TE HAN PUESTO EN LA LISTA",
		"when": "for_sale", "not": ["newcomer"],
		"desc": "El club te metió en la lista de transferibles sin avisarte, y te enteraste por la prensa. Hay un micrófono delante y la pregunta ya está hecha.",
		"a": {"label": "TRAGARME EL SAPO", "fx": {"rel": {"tecnico": 10.0,
			"prensa": -3.0, "agente": -2.0}}},
		"b": {"label": "CONTAR LA VERDAD", "fx": {"rel": {"prensa": 14.0,
			"aficion": 6.0, "tecnico": -8.0}}}},
















	{"id": "nat_debut", "title": "TU PRIMERA VEZ CON TU PAÍS",
		"nat": true, "when": ["nat_debut", "played"],
		"desc": "Debutaste con la selección. En el túnel te esperan la cámara de tu país y el utillero con la camiseta del partido, que se guarda o se regala.",
		"a": {"label": "ENMARCARLA PARA TU FAMILIA", "fx": {"rel": {"aficion": 6.0,
			"prensa": -2.0}}},
		"b": {"label": "REGALÁRSELA AL SELECCIONADOR", "fx": {"nat_edge": 2,
			"rel": {"prensa": 3.0}}},
		"c": {"label": "SUBIRLA A TUS REDES", "fx": {"rel": {"prensa": 7.0,
			"agente": 3.0, "aficion": -2.0}}}},



	{"id": "nat_seleccionador", "title": "EL SELECCIONADOR TE APARTA",
		"nat": true, "not": ["nat_debut"],
		"desc": "Al acabar te lleva a un lado, lejos del grupo. Puedes escuchar lo que tenga que decirte, o aprovechar los dos minutos para pedirle el puesto de titular.",
		"a": {"label": "ESCUCHAR Y CALLAR", "fx": {"nat_edge": 1}},
		"b": {"label": "PEDIRLE EL PUESTO", "fx": {"risk": {"p": 0.45,
			"win": {"nat_edge": 4, "rel": {"prensa": 3.0}},
			"lose": {"nat_edge": -3, "rel": {"prensa": -3.0}},
			"win_msg": "Le gustó tu descaro: cuenta contigo.",
			"lose_msg": "No era el momento ni el sitio. Tomó nota."}}}},



	{"id": "nat_doble_agenda", "title": "TU CLUB TE RECLAMA",
		"nat": true, "club_pull": true, "when": "played",
		"desc": "Tu club llamó a la federación: quieren que vuelvas en el primer vuelo y te saltes el segundo partido. El seleccionador te deja elegir a ti, que es la peor parte.",
		"a": {"label": "VOLVER AL CLUB", "fx": {"nat_edge": -3, "energy": 8.0,
			"rel": {"tecnico": 8.0, "aficion": -4.0}}},
		"b": {"label": "QUEDARTE CON TU PAÍS", "fx": {"nat_edge": 3, "energy": -10.0,
			"rel": {"aficion": 6.0, "prensa": 4.0, "tecnico": -8.0}}}},
	{"id": "nat_gol_pais", "title": "MARCASTE CON TU PAÍS",
		"nat": true, "club_pull": true, "when": "scored",
		"desc": "Gol con la camiseta de tu selección y un micrófono de tu país esperándote. Se puede repartir de tres maneras, y las tres se oyen en tu casa.",
		"a": {"label": "AL PAÍS QUE TE VIO NACER", "fx": {"rel": {"aficion": 7.0,
			"prensa": -2.0}}},
		"b": {"label": "AL SELECCIONADOR QUE TE LLAMÓ", "fx": {"nat_edge": 2,
			"rel": {"prensa": 2.0, "aficion": -2.0}}},
		"c": {"label": "AL CLUB QUE TE PAGA", "fx": {"rel": {"tecnico": 6.0,
			"agente": 3.0, "aficion": -4.0}}}},



	{"id": "nat_prensa_pais", "title": "LA PRENSA DE TU PAÍS",
		"nat": true, "when": "lost",
		"desc": "Perdisteis y el país entero pide explicaciones. Te esperan en zona mixta con la pregunta ya escrita: quién tuvo la culpa.",
		"a": {"label": "DAR LA CARA POR EL GRUPO", "fx": {"nat_edge": 2,
			"rel": {"prensa": -3.0, "aficion": 4.0}}},
		"b": {"label": "DECIR QUE TÚ CUMPLISTE", "fx": {"nat_edge": -3,
			"rel": {"prensa": 6.0, "aficion": -5.0}}}},
	{"id": "nat_suplente", "title": "NOVENTA MINUTOS MIRANDO",
		"nat": true, "when": "benched", "not": ["nat_debut"],
		"desc": "Viajaste medio mundo para calentar dos veces y volver a sentarte. Tu agente quiere que se sepa; el segundo entrenador te ha visto la cara desde el banquillo.",
		"a": {"label": "APLAUDIR DESDE EL BANCO", "fx": {"nat_edge": 2,
			"rel": {"agente": -4.0}}},
		"b": {"label": "QUE SE ENTERE TU AGENTE", "fx": {"nat_edge": -2,
			"rel": {"agente": 7.0, "prensa": 4.0}}}},







	{"id": "pareja_esperando", "title": "TE ESPERÓ DESPIERTA",
		"when": ["con_pareja", "pareja_formal", "lost"], "wear": "casual", "names": ["pareja"],
		"desc": "Son las dos de la mañana, perdisteis, y {0} sigue despierta en la cocina con dos platos servidos. No preguntó por el partido.",
		"a": {"label": "SENTARTE A CENAR", "fx": {"energy": -3.0,
			"rel": {"pareja": 10.0}}},
		"b": {"label": "IRTE DERECHO A LA CAMA", "fx": {"energy": 3.0,
			"rel": {"pareja": -7.0}}}},
	{"id": "pareja_foto", "title": "LA FOTO DEL DOMINGO",
		"when": ["con_pareja", "pareja_formal"], "names": ["pareja"],
		"desc": "Una revista ofrece portada: tú y {0}, en casa, ocho páginas. Pagan bien y a ella la fotografiarían por primera vez.",
		"a": {"label": "ACEPTAR LA PORTADA", "fx": {"money_sponsor": 4.0,
			"rel": {"prensa": 9.0, "aficion": 3.0, "pareja": -8.0}}},
		"b": {"label": "PROTEGERLA", "fx": {"rel": {"prensa": -6.0,
			"pareja": 9.0}}}},


	{"id": "pareja_fiesta", "title": "ELLA QUIERE SALIR",
		"when": ["con_pareja", "pareja_fiestera", "won"], "wear": "casual",
		"names": ["pareja"],
		"desc": "Ganasteis y {0} ya tiene mesa reservada para las dos de la mañana. Mañana hay recuperación a las nueve.",
		"a": {"label": "SALIR CON ELLA", "fx": {"energy": -16.0,
			"rel": {"pareja": 10.0, "prensa": 4.0, "tecnico": -5.0}}},
		"b": {"label": "MAÑANA HAY TRABAJO", "fx": {"energy": 4.0,
			"rel": {"tecnico": 3.0, "pareja": -7.0}}}},


	{"id": "pareja_gira", "title": "LA GIRA DE PRETEMPORADA",
		"when": ["con_pareja", "arranque_temporada"], "names": ["pareja"],
		"desc": "Tres semanas al otro lado del mundo. El club permite acompañantes, pero el vestuario mira raro al que viaja con pareja.",
		"a": {"label": "QUE VENGA CONTIGO", "fx": {"money_wage": -0.8,
			"con_ella": true, "rel": {"pareja": 11.0, "equipo": -5.0}}},
		"b": {"label": "IR SOLO", "fx": {"rel": {"equipo": 5.0,
			"pareja": -6.0}}}},
]




































const PUNISH: Array = [
	{"id": "castigo_final", "title": "LA MEDALLA DE PLATA", "sticky": true,
		"desc": "Perdiste la final. En el círculo central te cuelgan la medalla que nadie quiere, y en el túnel hay treinta micrófonos esperando a que señales a alguien.",
		"a": {"label": "CULPAR AL PLANTEAMIENTO", "fx": {"rel": {"tecnico": -10.0,
			"equipo": -2.0}}},
		"b": {"label": "SEÑALAR AL VESTUARIO", "fx": {"rel": {"equipo": -10.0,
			"prensa": -3.0}}},
		"c": {"label": "PASAR DE LARGO SIN HABLAR", "fx": {"rel": {"prensa": -9.0,
			"aficion": -4.0}}}},
	{"id": "castigo_objetivo", "title": "LA REUNIÓN DE JUNIO", "sticky": true,
		"desc": "Despacho, dos directivos y una carpeta con tu temporada abierta encima de la mesa. No cumpliste, y de aquí nadie sale hasta que la culpa tenga un nombre.",
		"a": {"label": "SEÑALAR AL TÉCNICO", "fx": {"rel": {"tecnico": -11.0,
			"equipo": -3.0}}},
		"b": {"label": "SEÑALAR A LA PLANTILLA", "fx": {"rel": {"equipo": -10.0,
			"prensa": -3.0}}},
		"c": {"label": "FIRMAR QUE FUE TU CULPA", "fx": {"rel": {"agente": -9.0,
			"prensa": -6.0}}}},
	{"id": "castigo_goleada", "title": "CUATRO EN CONTRA", "sticky": true,
		"desc": "Ridículo de los que se recuerdan. La grada se quedó de pie esperando a que alguien subiera a dar la cara, y en el vestuario nadie levanta la vista del suelo.",
		"a": {"label": "PEDIR PERDÓN EN CALIENTE", "fx": {"rel": {"prensa": -8.0,
			"agente": -4.0}}},
		"b": {"label": "DECIR QUE NO ES PARA TANTO", "fx": {"rel": {"aficion": -10.0,
			"prensa": -3.0}}},
		"c": {"label": "REVENTAR EL VESTUARIO", "fx": {"rel": {"equipo": -10.0,
			"tecnico": -3.0}}}},























	{"id": "castigo_derbi", "title": "PERDISTE EL DERBI", "sticky": true,
		"desc": "La ciudad es de ellos durante un año entero. En la puerta hay gente esperando el autobús del equipo, y no vienen a pedir autógrafos.",
		"a": {"label": "ENCARARTE CON LA VALLA", "fx": {"rel": {"aficion": -6.0,
			"prensa": -3.0}}},
		"b": {"label": "CARGAR CONTRA EL ÁRBITRO", "fx": {"rel": {"tecnico": -6.0,
			"equipo": -3.0}}},
		"c": {"label": "IRTE EN SILENCIO", "fx": {"rel": {"prensa": -6.0,
			"equipo": -3.0}}}},
	{"id": "castigo_ridiculo", "title": "FUERA CONTRA UN MODESTO", "sticky": true,
		"desc": "Los eliminó un equipo de dos categorías más abajo, en una cancha de mil personas y con el vestuario de local festejando junto al de ustedes.",
		"a": {"label": "DECIR QUE LES SOBRÓ CONFIANZA", "fx": {"rel": {"equipo": -9.0,
			"tecnico": -4.0}}},
		"b": {"label": "DEFENDER AL GRUPO CONTRA TODOS", "fx": {"rel": {"prensa": -10.0,
			"aficion": -3.0}}},
		"c": {"label": "NO ABRIR LA BOCA", "fx": {"rel": {"aficion": -8.0,
			"prensa": -5.0}}}},

























	{"id": "ruptura", "title": "SE ACABÓ", "sticky": true, "wear": "casual",
		"names": ["pareja"], "juego": true,
		"desc": "Las maletas de {0} llevan dos días en el recibidor y esta vez no las está deshaciendo. Queda una conversación, y es esta noche.",
		"a": {"label": "HABLAR CON ELLA", "fx": {}},
		"b": {"label": "DEJAR QUE SE VAYA",
			"fx": {"pareja_end": true, "rel": {"prensa": -10.0, "aficion": -3.0}}}},
]


















































const AWARD: Array = [
	{"id": "premio_titulo", "title": "LA VUELTA AL CAMPO", "sticky": true, "rank": 3,
		"desc": "Campeón. La copa pesa de verdad y el estadio no se va a ir a ninguna parte. Queda una vuelta al campo y todos esperan que se la des a alguien.",
		"a": {"label": "LEVANTARLA ANTE EL FONDO", "fx": {"rel": {"aficion": 20.0,
			"prensa": 6.0}}},
		"b": {"label": "QUE LA LEVANTE EL GRUPO", "fx": {"rel": {"equipo": 20.0,
			"tecnico": 5.0}}},
		"c": {"label": "LLEVÁRSELA AL MÍSTER", "fx": {"rel": {"tecnico": 20.0,
			"equipo": 4.0}}}},
	{"id": "premio_ascenso", "title": "LA CIUDAD ESTÁ EN LA CALLE", "sticky": true,
		"rank": 2,
		"desc": "Ascenso. Hay gente en la avenida desde antes de que acabara el partido, un autobús descapotable esperando y un micrófono que va a llegar a todas las casas.",
		"a": {"label": "PROMETER QUE TE QUEDAS", "fx": {"rel": {"aficion": 22.0,
			"tecnico": 5.0}}},
		"b": {"label": "NOMBRAR UNO A UNO AL VESTUARIO", "fx": {"rel": {"equipo": 20.0,
			"aficion": 6.0}}},
		"c": {"label": "PEDIR REFUERZOS EN DIRECTO", "fx": {"rel": {"prensa": 18.0,
			"agente": 8.0}}}},
	{"id": "premio_balon", "title": "EL MEJOR DEL MUNDO", "sticky": true, "rank": 4,
		"desc": "Jugador del Año. Estás de pie con el trofeo en la mano, la sala en silencio y treinta segundos que se van a repetir el resto de tu carrera.",
		"a": {"label": "A LOS QUE TE PASAN EL BALÓN", "fx": {"rel": {"equipo": 24.0,
			"tecnico": 9.0}}},
		"b": {"label": "A LA GENTE QUE TE VIO EMPEZAR", "fx": {"rel": {"aficion": 24.0,
			"prensa": 8.0}}},
		"c": {"label": "AL CAMINO QUE TE TRAJO AQUÍ", "fx": {"rel": {"agente": 26.0,
			"prensa": 9.0}}}},








	{"id": "premio_estadio", "title": "EL ESTADIO LLEVARÁ TU NOMBRE", "sticky": true,
		"rank": 5,
		"desc": "La directiva lo anuncia en la próxima junta: quiere ponerle tu nombre al estadio. Es el honor más grande que da un club, y sólo se da una vez.",
		"a": {"label": "ACEPTAR EL HONOR", "fx": {"rename_stadium": true,
			"rel": {"aficion": 26.0, "prensa": 9.0}}},
		"b": {"label": "QUE SEA PARA TODO EL VESTUARIO", "fx": {"rel": {"equipo": 24.0,
			"aficion": 7.0}}},
		"c": {"label": "DEJARLO CON SU NOMBRE DE SIEMPRE", "fx": {"rel": {"aficion": 22.0,
			"tecnico": 8.0}}}},
	{"id": "premio_mvp", "title": "EL MEJOR DE LA TEMPORADA", "sticky": true, "rank": 1,
		"desc": "Te dan el premio al mejor del año y hay que decir algo. La sala está llena de gente que decide cosas sobre ti: tu club, tu competición y los que escriben.",
		"a": {"label": "HABLAR DEL EQUIPO QUE TE SOSTUVO", "fx": {"rel": {"equipo": 18.0,
			"tecnico": 8.0}}},
		"b": {"label": "AGRADECER AL MÍSTER QUE TE PUSO", "fx": {"rel": {"tecnico": 20.0,
			"equipo": 5.0}}},
		"c": {"label": "DEDICÁRSELO A LA GRADA", "fx": {"rel": {"aficion": 18.0,
			"prensa": 7.0}}}},











	{"id": "premio_derbi", "title": "LA CIUDAD ES TUYA", "sticky": true, "rank": 1,
		"desc": "Ganasteis el derbi. Hay gente esperando el autobús en la puerta, esta vez para llevaros en volandas, y mañana no se va a hablar de otra cosa en toda la ciudad.",
		"a": {"label": "CELEBRARLO EN LA VALLA", "fx": {"rel": {"aficion": 12.0,
			"prensa": 4.0}}},
		"b": {"label": "DECIR QUE SÓLO SON TRES PUNTOS", "fx": {"rel": {"tecnico": 11.0,
			"equipo": 5.0}}},
		"c": {"label": "DEDICÁRSELO AL VESTUARIO", "fx": {"rel": {"equipo": 12.0,
			"tecnico": 4.0}}}},
]
















const MOMENTS: Array = [
	{"id": "momento_mvp", "title": "TE PONEN EL MICRO",
		"desc": "Figura del partido. La cadena te para antes del vestuario y hay treinta segundos en directo. Lo que digas se repite toda la semana.",
		"a": {"label": "MÉRITO DEL EQUIPO", "fx": {"rel": {"equipo": 6.0, "tecnico": 3.0, "prensa": -2.0}}},






		"a_socio": {"label": "MÉRITO DE {0}", "fx": {"socio": 8,
			"rel": {"tecnico": 3.0, "prensa": -2.0}}},


		"b": {"label": "HABLAR DE TU MOMENTO", "fx": {"titular": "crecido",
			"rel": {"prensa": 7.0, "agente": 3.0, "equipo": -4.0}}},
		"c": {"label": "DEDICÁRSELO A LA GENTE", "fx": {"rel": {"aficion": 7.0, "prensa": 2.0, "tecnico": -2.0}}}},









	{"id": "momento_penal", "title": "EL PENAL FALLADO",
		"desc": "Fallaste un penal y la sala de prensa sólo quiere hablar de eso. Hay cámaras, hay micro y una pregunta esperándote.",
		"a": {"label": "ASUMIRLO", "fx": {"rel": {"tecnico": 5.0, "equipo": 3.0, "agente": -3.0}}},
		"b": {"label": "EL PRÓXIMO LO METO", "fx": {"titular": "crecido",
			"rel": {"prensa": 5.0, "tecnico": -3.0}}},
		"c": {"label": "NO CONTESTAR", "fx": {"rel": {"prensa": -5.0, "agente": 3.0}}}},










	{"id": "momento_zasca", "title": "TE CRITICAN EN REDES",
		"desc": "Partido gris y el hashtag ya corre. Te etiquetan en cada crítica y el móvil no para de vibrar. ¿Contestas?",
		"a": {"label": "IGNORAR", "fx": {"rel": {"prensa": -2.0}}},
		"b": {"label": "CON CLASE", "fx": {"rel": {"tecnico": 3.0, "prensa": 2.0}}},
		"c": {"label": "ZASCA", "fx": {"titular": "zasca"}}},










	{"id": "momento_pique", "title": "TE ETIQUETAN",
		"desc": "Un rival te ha mencionado antes del partido. Todo el mundo mira qué contestas.",
		"a": {"label": "DEJARLO PASAR", "fx": {"rel": {"tecnico": 2.0}}},
		"b": {"label": "CONTESTAR", "fx": {"pique_frase": true}}},
	{"id": "momento_lesion", "title": "CÓMO LO CUENTAS",
		"desc": "El parte ya salió y el teléfono no para. Toca decir algo sobre la baja, y cada versión tiene su precio.",
		"a": {"label": "VOLVERÉ ANTES DE TIEMPO", "fx": {"rel": {"aficion": 6.0, "prensa": 3.0, "tecnico": -3.0}}},
		"b": {"label": "SEGUIR LOS PLAZOS", "fx": {"energy": 6.0, "rel": {"tecnico": 6.0, "equipo": 2.0, "prensa": -3.0}}},
		"c": {"label": "NO DECIR NADA", "fx": {"energy": 4.0, "rel": {"prensa": -5.0, "agente": 4.0}}}},




































	{"id": "momento_companero", "title": "SE LO QUIEREN LLEVAR",
		"desc": "Un compañero tuyo tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.",
























		"a": {"label": "PEDIRLE QUE SE QUEDE", "fx": {"risk": {"p": 0.5,
			"win": {"squad_rumor_stay": true}, "lose": {"squad_rumor_drop": true},
			"win_tag": "SE QUEDA", "lose_tag": "SE VA",
			"win_msg": "Se queda. El traspaso se cae.",
			"lose_msg": "Ya lo tenía decidido. Al menos sabe que se lo pediste."}}},
		"b": {"label": "DECIRLE QUE ES SU OPORTUNIDAD", "fx": {"risk": {"p": 0.1,
			"win": {"squad_rumor_stay": true}, "lose": {"squad_rumor_drop": true},
			"win_tag": "SE QUEDA", "lose_tag": "SE VA",
			"win_msg": "Le dio la vuelta: se queda igual.",
			"lose_msg": "Le has quitado la última duda: se va."}}}},














	{"id": "momento_senalado", "title": "LA HA TOMADO CON ÉL",
		"desc": "El míster se ha ido a por un compañero delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.",
		"a": {"label": "DAR LA CARA POR ÉL", "fx": {"rel": {"tecnico": -3}, "socio": 5}},
		"b": {"label": "QUEDARTE CALLADO", "fx": {"socio": -4}}},












	{"id": "momento_trivia", "title": "PREGUNTA DE VESTUARIO",
		"desc": "En el banco, alguien saca el móvil y lanza una pregunta a todo el vestuario.",
		"a": {"label": "?", "fx": {}},
		"b": {"label": "?", "fx": {}},
		"c": {"label": "?", "fx": {}}},
	{"id": "momento_retiro", "title": "EL CUERPO DECIDE",
		"desc": "El médico no dice plazos: dice que a tu edad una rotura así no vuelve entera. Puedes pelear la rehabilitación y volver mermado, o parar tú antes de que te paren.",
		"a": {"label": "REHABILITARME", "fx": {"injury_secuela": true}},
		"b": {"label": "COLGAR LAS BOTAS", "fx": {"retire_lesion": true}}},
]



static func moment_by_id(id: String) -> Dictionary:
	for e in MOMENTS:
		if String(e["id"]) == id:
			return e
	return {}


static func post_by_id(id: String) -> Dictionary:
	for e in POST_MATCH:
		if String(e["id"]) == id:
			return e
	return {}




static func punish_by_id(id: String) -> Dictionary:
	for e in PUNISH:
		if String(e["id"]) == id:
			return e
	return {}




static func is_punish(id: String) -> bool:
	return not punish_by_id(id).is_empty()




static func award_by_id(id: String) -> Dictionary:
	for e in AWARD:
		if String(e["id"]) == id:
			return e
	return {}


static func is_award(id: String) -> bool:
	return not award_by_id(id).is_empty()



static func award_rank(id: String) -> int:
	return int(award_by_id(id).get("rank", 0))







static func is_forced(id: String) -> bool:
	return is_punish(id) or is_award(id)









static func passes_ctx(e: Dictionary, ctx: Dictionary) -> bool:
	var w: Variant = e.get("when", "")
	if w is Array:
		for k in (w as Array):
			if not bool(ctx.get(String(k), false)):
				return false
	elif String(w) != "" and not bool(ctx.get(String(w), false)):
		return false




	var any: Array = e.get("when_any", [])
	if not any.is_empty():
		var hit: bool = false
		for k in any:
			if bool(ctx.get(String(k), false)):
				hit = true
		if not hit:
			return false
	for k in e.get("not", []):
		if bool(ctx.get(String(k), false)):
			return false
	return true







static func _same_world(e: Dictionary, ctx: Dictionary) -> bool:









	if bool(e.get("both", false)):
		return true
	return bool(e.get("nat", false)) == bool(ctx.get("nat", false))











const APUESTA_IDS: Array[String] = ["casino_agente", "marca_apuestas"]
static func eligible_post(has_sponsor: bool, ctx: Dictionary = {}) -> Array:




	var veto: Array = ctx.get("veto", [])
	return POST_MATCH.filter(func(e: Dictionary) -> bool:
		if not PAREJA_ACTIVA and String(e.get("id", "")).begins_with("pareja_"):
			return false
		if veto.has(String(e.get("id", ""))):
			return false



		if Settings.sin_apuestas() and APUESTA_IDS.has(String(e.get("id", ""))):
			return false
		if bool(e.get("arrival", false)):
			return false
		if not _same_world(e, ctx):
			return false
		if String(e.get("req", "")) == "sponsor" and not has_sponsor:
			return false
		return passes_ctx(e, ctx))





static func eligible_arrival(ctx: Dictionary = {}, seen: Array = []) -> Array:
	return POST_MATCH.filter(func(e: Dictionary) -> bool:
		if not bool(e.get("arrival", false)):
			return false
		if not _same_world(e, ctx):
			return false
		if seen.has(String(e["id"])):
			return false
		return passes_ctx(e, ctx))



















static func _sin_recientes(pool: Array, recent: Array) -> Array:
	if recent.is_empty() or pool.is_empty():
		return pool
	var frescas: Array = pool.filter(func(e: Dictionary) -> bool:
		return not recent.has(String(e.get("id", ""))))
	return frescas if not frescas.is_empty() else pool


static func roll_post_match(has_sponsor: bool, r_event: float, r_pick: float,
		ctx: Dictionary = {}, recent: Array = []) -> String:
	if r_event > POST_MATCH_P:
		return ""
	var pool: Array = _sin_recientes(eligible_post(has_sponsor, ctx), recent)
	if pool.is_empty():
		return ""
	return String(pool[int(clampf(r_pick, 0.0, 0.999) * float(pool.size()))]["id"])







const ARRIVAL_P: float = 0.55





static func roll_arrival(r_event: float, r_pick: float, ctx: Dictionary = {},
		seen: Array = []) -> String:
	if r_event > ARRIVAL_P:
		return ""
	var pool: Array = eligible_arrival(ctx, seen)
	if pool.is_empty():
		return ""
	return String(pool[int(clampf(r_pick, 0.0, 0.999) * float(pool.size()))]["id"])


static func by_id(id: String) -> Dictionary:
	for e in CATALOG:
		if String(e["id"]) == id:
			return e
	return {}















static func puerta_pide(sitio: String) -> Array:
	if sitio.is_empty():
		return []
	var llave: String = "cand_" + sitio
	for e in CATALOG:


		var w: Variant = e.get("when", "")
		var cuando: Array =(w as Array) if w is Array else ([String(w)] if String(w) != "" else [])
		if not cuando.has(llave):
			continue
		var pide: Array = []
		for c in cuando:
			var k: String = String(c)
			if k == "soltero" or k.begins_with("cand_"):
				continue
			pide.append(k)
		var req: String = String(e.get("req", ""))
		if not req.is_empty():
			pide.append(req)
		return pide
	return []










static func eligible(has_sponsor: bool, ctx: Dictionary = {}) -> Array:





	var veto: Array = ctx.get("veto", [])



	var c: Dictionary = con_prensa_mundo(con_camilla_rival(ctx))
	return CATALOG.filter(func(e: Dictionary) -> bool:



		if not PAREJA_ACTIVA and String(e.get("id", "")).begins_with("pareja_"):
			return false
		if veto.has(String(e.get("id", ""))):
			return false
		if not _same_world(e, c):
			return false
		if String(e.get("req", "")) == "sponsor" and not has_sponsor:
			return false
		return passes_ctx(e, c))









const LLAVE_SIN_ESTRELLA: String = "rival_sin_estrella"



const ESTRELLAS_TOP: int = 3
static func con_camilla_rival(ctx: Dictionary) -> Dictionary:
	if ctx.is_empty() or ctx.has(LLAVE_SIN_ESTRELLA):
		return ctx


	if GameState.calendar.is_empty():
		return ctx
	var out: Dictionary = ctx.duplicate()
	out[LLAVE_SIN_ESTRELLA] = rival_sin_estrella(GameState.next_fixture())
	return out













static func rival_sin_estrella(fx: Dictionary) -> bool:
	if String(fx.get("comp", "")) != "league":
		return false
	var opp: String = String(fx.get("opp", ""))
	if opp.is_empty() or opp == GameState.player_team_id:
		return false
	var bajas: Array = Career.bajas_de(opp)
	if bajas.is_empty():
		return false
	var corte: float = corte_estrellas(opp)
	if corte < 0.0:
		return false
	var hoy: Dictionary = GameState.current_fixture()
	var hueco: int = 0
	if String(hoy.get("comp", "")) == "league":
		hueco = Career.dias_de_reloj(
			GameState.dias_entre_jornadas(int(hoy.get("round_idx", -1))))
	for b_v in bajas:
		var b: Dictionary = b_v
		if bool(b.get("titular", false)) and String(b.get("motivo", "")) == "les" \
				and int(b.get("dias", 0)) > hueco and float(b.get("media", 0)) >= corte:
			return true
	return false







static func corte_estrellas(opp: String) -> float:
	var medias: Array = []
	var plantel: Array = Squad.plantel_sin_once(opp)
	for i in mini(Squad.STARTING_XI, plantel.size()):
		var f: Dictionary = plantel[i]
		var pos: String = str(f.get("pos", "MC"))
		if pos != "POR":
			medias.append(SquadMeta.media_of(f, pos))
	if medias.is_empty():
		return -1.0
	medias.sort()
	medias.reverse()
	return float(medias[mini(ESTRELLAS_TOP, medias.size()) - 1])















const LLAVES_PRENSA: Array[String] = ["rival_lanzado", "rival_herido",
	"rival_tecnico_nuevo", "rival_ex_tecnico", "rival_fichaje", "campeon_de_casa"]



const RACHA_N: int = 5


const RECIEN_DIAS: int = 12


const ARRANQUE_DIAS: int = 6


static func con_prensa_mundo(ctx: Dictionary) -> Dictionary:


	if ctx.is_empty() or bool(ctx.get("nat", false)):
		return ctx

	if GameState.calendar.is_empty():
		return ctx
	var falta: bool = false
	for k in LLAVES_PRENSA:
		if not ctx.has(k):
			falta = true
	if not falta:
		return ctx
	var out: Dictionary = ctx.duplicate()
	var opp: String = rival_de_liga(GameState.next_fixture())
	for k in LLAVES_PRENSA:
		if not out.has(k):
			out[k] = _llave_prensa(k, opp)
	return out





static func rival_de_liga(fx: Dictionary) -> String:
	if str(fx.get("comp", "")) != "league":
		return ""
	var opp: String = str(fx.get("opp", ""))
	if opp == GameState.player_team_id:
		return ""
	return opp


static func _llave_prensa(k: String, opp: String) -> bool:
	if k == "campeon_de_casa":
		return not campeon_de_casa().is_empty()
	if opp.is_empty():
		return false
	match k:
		"rival_lanzado":
			return rival_lanzado(opp)
		"rival_herido":
			return rival_herido(opp)
		"rival_tecnico_nuevo":
			return rival_tecnico_nuevo(opp)
		"rival_ex_tecnico":
			return rival_ex_tecnico(opp)
		"rival_fichaje":
			return not fichaje_estrella(opp).is_empty()
	return false




static func _ultimos(opp: String) -> Array:
	var f: Array = GameState.league_form.get(GameState.form_key_of(opp), [])
	if f.size() < RACHA_N:
		return []
	return f.slice(f.size() - RACHA_N)



static func rival_lanzado(opp: String) -> bool:
	var u: Array = _ultimos(opp)
	if u.is_empty():
		return false
	for r in u:
		if str(r) != "G":
			return false
	return true




static func rival_herido(opp: String) -> bool:
	var u: Array = _ultimos(opp)
	if u.is_empty() or u.has("G"):
		return false
	return Teams.rating(opp) >= Teams.rating(GameState.player_team_id)









static func rival_tecnico_nuevo(opp: String) -> bool:
	if GameState.season_num < 2 or GameState.season_day > RECIEN_DIAS:
		return false
	var s: Dictionary = Coaches.seat(opp)
	if s.is_empty() or bool(s.get("tuyo", false)) or bool(s.get("libro", false)):
		return false
	if int(s.get("desde", 0)) != GameState.season_num:
		return false
	return int(s.get("mandato", Coaches.TERM_BASE)) > Coaches.TERM_BASE \
			or not str(s.get("src", "")).is_empty()













static func rival_ex_tecnico(opp: String) -> bool:
	var s: Dictionary = Coaches.seat(opp)
	if not bool(s.get("libro", false)):
		return false
	return int(s.get("desde", 0)) >= GameState.season_num - 1









static func fichaje_estrella(opp: String) -> String:
	if opp.is_empty():
		return ""
	var mejor: Dictionary = {}
	var temporada: int = GameState.season_num




	for d in Career.market_news:
		if d.get("to", "") != opp:
			continue
		if d.get("kind", "") != "signing" or int(d.get("season", -1)) != temporada:
			continue
		if int(d.get("fee", 0)) <= 0 or bool(d.get("free", false)):
			continue
		if mejor.is_empty() or int(d.get("fee", 0)) > int(mejor.get("fee", 0)):
			mejor = d
	var nombre: String = str(mejor.get("name", ""))
	if nombre.is_empty():
		return ""


	var plantel: Array = Squad.plantel_sin_once(opp)
	var suyo: Dictionary = {}
	for i in mini(Squad.STARTING_XI, plantel.size()):
		var f: Dictionary = plantel[i]
		if str(f.get("name", "")) == nombre:
			suyo = f
			break
	var pos: String = str(suyo.get("pos", "POR"))
	if suyo.is_empty() or pos == "POR":
		return ""
	var corte: float = corte_estrellas(opp)
	if corte < 0.0 or float(SquadMeta.media_of(suyo, pos)) < corte:
		return ""
	for b in Career.bajas_de(opp):
		if str((b as Dictionary).get("nombre", "")) == nombre:
			return ""
	return nombre










static func campeon_de_casa(con_ventana: bool = true) -> String:
	var nat: String = Career.nationality
	if nat.is_empty() or GameState.season_num < 2:
		return ""
	if con_ventana and GameState.season_day > ARRANQUE_DIAS:
		return ""
	var casa: String = Teams.country_of(GameState.player_team_id)
	if casa.is_empty() or Nations.canon_id(casa) == nat or casa == nat:
		return ""
	var c: String = str(Career._fila_liga(nat, GameState.season_num - 1)
		.get("champion", ""))
	if c.is_empty():
		return ""
	if c == str(Career._fila_liga(nat, GameState.season_num - 2).get("champion", "")):
		return ""
	return c






static func desc_por_fama(e: Dictionary, escalon: int) -> String:
	var clave: String = ""
	if escalon <= 0:
		clave = "desc_baja"
	elif escalon >= Career.PRENSA_ESCALON_DESDE.size() - 1:
		clave = "desc_alta"
	return String(e.get(clave, e.get("desc", "")))









static func prensa_vigente(e: Dictionary, club: String) -> bool:
	match str(e.get("when", "")):
		"rival_lanzado":
			return rival_lanzado(club)
		"rival_herido":
			return rival_herido(club)
	return true






static func roll(has_sponsor: bool, r_event: float, r_pick: float,
		ctx: Dictionary = {}, recent: Array = []) -> String:
	if r_event > EVENT_P + PAREJA_EXTRA_P:
		return ""
	var pool: Array = _sin_recientes(eligible(has_sponsor, ctx), recent)



	if r_event > EVENT_P:
		var solo_pareja: Array = []
		for e in pool:
			if _va_en_la_franja(String(e["id"])):
				solo_pareja.append(e)
		pool = solo_pareja
	if pool.is_empty():
		return ""
	return _pick(pool, r_pick)









static func peso_de(e: Dictionary) -> float:
	return maxf(0.0, float(e.get("peso", 1.0)))





static func _pick(pool: Array, r_pick: float) -> String:
	var total: float = 0.0
	for e in pool:
		total += peso_de(e)
	if total <= 0.0:
		return ""
	var corte: float = clampf(r_pick, 0.0, 0.999) * total
	var acc: float = 0.0
	for e in pool:
		acc += peso_de(e)
		if corte < acc:
			return String(e["id"])
	return String((pool.back() as Dictionary)["id"])
