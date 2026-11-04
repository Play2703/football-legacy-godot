class_name Celebs


























const SITIO: String = "sitio"
const GESTO: String = "gesto"






const RARO_COMUN: int = 1
const RARO_RARO: int = 2
const RARO_EPICO: int = 3
const RARO_LEGENDARIO: int = 4




const THUMB_DIR: String = "res://assets/celebs/"



const PINGUINAZO_ID: String = "g_pinguinazo"
const PINGUINAZO: String = "pinguinazo"





const OCARINA_ID: String = "g_ocarina"








static var replay_pendiente: String = ""
static var replay_hecho: bool = false







static var abre_en: String = ""
static var volver_a: String = ""











const ATADOS: Array[String] = ["s_medio", "s_tecnico", "s_portero", "s_prensa", "s_palco",
	"s_solo", "s_charco", "s_pasillo", "s_tren", "s_corro", "g_capitan", "g_tresdedos",
	"g_perdon", "g_anillo", "g_cantico", "g_pinguinazo"]
const SOLO_VISITA: Array[String] = ["s_visitante", "s_provocacion", "s_area", "g_playera",
	"g_callar"]




















const ALL: Array[Dictionary] = [



	{
		"id": "s_corner", "kind": SITIO, "clave": "corner", "rare": RARO_COMUN,
		"name": "EL BANDERIN",
		"desc": "El clásico: todo el equipo corre al banderín del lado por donde entró el balón.",
	},
	{
		"id": "s_grada", "kind": SITIO, "clave": "grada", "rare": RARO_COMUN,
		"name": "CON LA GENTE",
		"desc": "Al fondo, detrás de la línea de gol. En casa, además, te abrazas con un aficionado.",
	},
	{
		"id": "s_pina", "kind": SITIO, "clave": "pina", "rare": RARO_COMUN, "cond": true,
		"name": "LA PIÑA",
		"desc": "Nadie se va a ningún lado: la montonera se arma justo donde marcaste.",
	},
	{
		"id": "s_banquillo", "kind": SITIO, "clave": "banquillo", "rare": RARO_COMUN, "cond": true,




		"name": "CON LOS SUPLENTES",
		"desc": "A la banda, con los suplentes. El gol del que acaba de entrar se festeja con los que siguen en el banco.",
	},
	{
		"id": "s_medio", "kind": SITIO, "clave": "medio", "rare": RARO_COMUN, "cond": true,
		"name": "AL CENTRO",
		"desc": "Balón bajo el brazo y a sacar de nuevo. Todavía no hay nada que festejar.",
	},
	{
		"id": "s_visitante", "kind": SITIO, "clave": "visitante", "rare": RARO_COMUN, "cond": true,
		"name": "TU RINCON",
		"desc": "Sólo de visita: a la esquina donde está tu puñado de aficionados.",
	},
	{




		"id": "s_camara", "kind": SITIO, "clave": "camara", "rare": RARO_COMUN,
		"cond": true,
		"name": "PARA LA TELE",
		"desc": "Te plantas delante de la cámara de televisión y el gol se ve por su visor. Sólo donde hay transmisión: en tercera no hay cámaras.",
	},



	{
		"id": "s_valla", "kind": SITIO, "clave": "valla", "rare": RARO_RARO, "cond": true,
		"name": "SALTAR LA VALLA",
		"desc": "Sólo en casa: saltas la publicidad y te vas hasta el pie de la grada. Esa esquina se vuelve loca.",
	},
	{
		"id": "s_tecnico", "kind": SITIO, "clave": "tecnico", "rare": RARO_RARO, "cond": true,
		"name": "AL TECNICO",
		"desc": "Vienes de bronca con el entrenador y te vas a la raya a abrazarlo. Una sola vez por partido.",
	},
	{
		"id": "s_provocacion", "kind": SITIO, "clave": "provocacion", "rare": RARO_EPICO, "cond": true,
		"name": "EN SU CASA",
		"desc": "Gol en un derbi, de visita: lo festejas frente a su fondo. Te abuchea el estadio entero y te llueven botellas.",
	},
	{
		"id": "s_todos", "kind": SITIO, "clave": "todos", "rare": RARO_LEGENDARIO, "cond": true,
		"name": "ES NUESTRO",
		"desc": "Última jornada, y el gol te pone por delante. Salta hasta el banquillo al campo.",
	},




	{
		"id": "s_portero", "kind": SITIO, "clave": "portero", "rare": RARO_RARO,
		"cond": true,
		"name": "A TU PORTERO",
		"desc": "Tu portero te salvó el partido con una parada. El festejo se va hacia TU campo y él viene corriendo desde su área.",
	},
	{
		"id": "s_prensa", "kind": SITIO, "clave": "prensa", "rare": RARO_RARO,
		"cond": true,
		"name": "AL FOSO",
		"desc": "Sólo de noche, con los focos encendidos: te plantas contra la valla del fondo y el estadio entero se te llena de flashes.",
	},
	{
		"id": "s_palco", "kind": SITIO, "clave": "palco", "rare": RARO_EPICO,
		"cond": true,





		"name": "A LA TRIBUNA",
		"desc": "Hay clubes preguntando por ti. Te vas a la banda de la tribuna principal y señalas hacia el palco: que decidan ellos.",
	},
	{
		"id": "s_area", "kind": SITIO, "clave": "area", "rare": RARO_EPICO,
		"cond": true,
		"name": "EN SU AREA",
		"desc": "Derbi de visita: no corres a ningún lado. Te plantas en el punto de penalti, de espaldas al arco y de cara a su gente, con los brazos abiertos.",
	},
	{
		"id": "s_solo", "kind": SITIO, "clave": "solo", "rare": RARO_LEGENDARIO,
		"cond": true,
		"name": "NADIE VIENE",
		"desc": "El vestuario no te quiere. Marcas, y ninguno de los diez va a abrazarte: se dan la vuelta y te dejan ahí.",
	},

	{
		"id": "s_charco", "kind": SITIO, "clave": "charco", "rare": RARO_RARO,
		"cond": true,
		"name": "AL CHARCO",
		"desc": "Sólo con lluvia y campo encharcado: todo el equipo corre al charco más cercano y se lanza de panza. Salpica hasta la valla.",
	},



	{
		"id": "s_sentados", "kind": SITIO, "clave": "sentados", "rare": RARO_RARO,
		"cond": true,
		"name": "EN LA VALLA",
		"desc": "Sólo en casa: te subes a la publicidad con los dos que llegan contigo. Los tres, sentados y de brazos cruzados, mirando al campo.",
	},





	{
		"id": "s_pasillo", "kind": SITIO, "clave": "pasillo", "rare": RARO_LEGENDARIO,
		"cond": true,
		"name": "EL PASILLO",
		"desc": "Tu gol 100, 250 o 500 con el club: tus compañeros se abren en dos filas aplaudiendo y tú cruzas por el medio saludando.",
	},
	{
		"id": "s_tren", "kind": SITIO, "clave": "tren", "rare": RARO_EPICO,
		"cond": true,
		"name": "EL TREN",
		"desc": "Un gol en una final: te tiras en plancha y detrás de ti se tiran los cuatro más cerca, uno a uno, cada uno a los pies del de delante.",
	},
	{
		"id": "s_corro", "kind": SITIO, "clave": "corro", "rare": RARO_LEGENDARIO,
		"cond": true,
		"name": "EL CORRO",
		"desc": "Con el vestuario a tu lado: tus compañeros te rodean aplaudiendo y tú festejas en medio.",
	},




	{
		"id": "g_rodillas", "kind": GESTO, "clave": "rodillas", "rare": RARO_COMUN, "cond": true,
		"name": "DE RODILLAS",
		"desc": "Llegas barriéndote de rodillas. Una de cada tres veces, en los festejos con carrera de verdad.",
	},
	{
		"id": "g_puno", "kind": GESTO, "clave": "puno", "rare": RARO_COMUN, "cond": true,
		"name": "PUÑO AL AIRE",
		"desc": "El salto con el puño cerrado, en el gol agónico que lo cambia todo.",
	},
	{
		"id": "g_patada", "kind": GESTO, "clave": "patada", "rare": RARO_COMUN, "cond": true,
		"name": "BALON A LA GRADA",
		"desc": "La otra cara del gol agónico: reventar el balón hacia arriba y que caiga donde caiga.",
	},
	{
		"id": "g_socio", "kind": GESTO, "clave": "socio", "rare": RARO_COMUN, "cond": true,
		"name": "GRACIAS, SOCIO",
		"desc": "El gol lo empezó otro: vino de un centro o de un córner, y lo primero que haces es señalar a quien lo puso.",
	},
	{
		"id": "g_banderin", "kind": GESTO, "clave": "banderin", "rare": RARO_RARO, "cond": true,
		"name": "BANDERIN PARTIDO",
		"desc": "Llegas al córner y le metes una patada al mástil. Se parte. Uno de cada seis córners.",
	},
	{
		"id": "g_mastil", "kind": GESTO, "clave": "mastil", "rare": RARO_RARO, "cond": true,
		"name": "MASTIL AGARRADO",
		"desc": "Llegas al córner, agarras el mástil con el puño y te plantas con la mano en la cadera.",
	},
	{
		"id": "g_playera", "kind": GESTO, "clave": "playera", "rare": RARO_RARO, "cond": true,
		"name": "SIN CAMISETA",
		"desc": "Te quitas la camiseta y les enseñas el dorsal. Siempre trae factura: abucheo y botellas.",
	},
	{
		"id": "g_callar", "kind": GESTO, "clave": "callar", "rare": RARO_RARO, "cond": true,
		"name": "EL SILENCIO",
		"desc": "Plantarte quieto frente a su fondo mientras el estadio te abuchea. No hacer nada es el gesto.",
	},
	{
		"id": "g_reverencia", "kind": GESTO, "clave": "reverencia", "rare": RARO_RARO,
		"cond": true,
		"name": "LA REVERENCIA",
		"desc": "Un golazo: desde fuera del área o de falta directa. Te giras hacia la grada y te inclinas. La mitad de las veces.",
	},
	{
		"id": "g_escudo", "kind": GESTO, "clave": "escudo", "rare": RARO_RARO, "cond": true,
		"name": "BESO AL ESCUDO",
		"desc": "Tres temporadas o más en el mismo club. Ya no eres un fichaje, eres de la casa: besas el escudo y la grada lo sabe.",
	},
	{
		"id": "g_capitan", "kind": GESTO, "clave": "capitan", "rare": RARO_EPICO, "cond": true,



		"name": "BRAZOS ABIERTOS",
		"desc": "Con el brazalete de tu país: brazos abiertos, pidiéndole más a tu gente.",
	},
	{
		"id": "g_tresdedos", "kind": GESTO, "clave": "tresdedos", "rare": RARO_EPICO,
		"cond": true,
		"name": "TRES DEDOS",
		"desc": "Tu tercer gol del partido. No hay nada que explicar: levantas tres dedos y que los cuenten ellos.",
	},
	{
		"id": "g_perdon", "kind": GESTO, "clave": "perdon", "rare": RARO_EPICO, "cond": true,



		"name": "SIN FESTEJAR",
		"desc": "Le marcaste al club que te formó. Te quedas quieto, con la mano en alto. Los otros nueve vienen a abrazarte igual.",
	},
	{
		"id": "g_cielo", "kind": GESTO, "clave": "cielo", "rare": RARO_LEGENDARIO, "cond": true,
		"name": "AL CIELO",
		"desc": "Tu primer gol después de una lesión larga. Señalas al cielo. Sólo cuenta ese gol, no los de después.",
	},

	{
		"id": "g_oreja", "kind": GESTO, "clave": "oreja", "rare": RARO_COMUN,
		"cond": true,
		"name": "MAS RUIDO",
		"desc": "En casa: las dos manos a las orejas, pidiéndole a tu gente que se oiga.",
	},
	{
		"id": "g_cesped", "kind": GESTO, "clave": "cesped", "rare": RARO_RARO,
		"cond": true,
		"name": "BESAR EL CESPED",
		"desc": "Tu primera temporada en el club: te arrodillas y besas el césped de tu casa nueva.",
	},
	{
		"id": "g_brazos", "kind": GESTO, "clave": "brazos", "rare": RARO_EPICO,
		"cond": true,



		"name": "BRAZOS CRUZADOS",
		"desc": "Ya habías fallado dos claras hoy. A la tercera no festejas: te cruzas de brazos y que hablen ellos.",
	},

	{
		"id": "g_botella", "kind": GESTO, "clave": "botella", "rare": RARO_RARO,
		"cond": true,
		"name": "LA BOTELLA",
		"desc": "Festejando pegado a tu grada, alguien te tira una botella de agua: la atrapas al vuelo, te la bebes y la mandas de vuelta.",
	},

	{
		"id": "g_aplauso", "kind": GESTO, "clave": "aplauso", "rare": RARO_COMUN,
		"cond": true,
		"name": "APLAUSO A TU GENTE",
		"desc": "Marcas, pero seguís perdiendo: nada de gritos, aplaudes a los que vinieron a verte.",
	},
	{
		"id": "g_saludo", "kind": GESTO, "clave": "saludo", "rare": RARO_RARO,
		"cond": true,
		"name": "SALUDO DE GOLEADA",
		"desc": "Con tres goles o más de ventaja ya no hay nada que gritar: caminas saludando a la grada.",
	},

	{
		"id": "g_salto", "kind": GESTO, "clave": "salto", "rare": RARO_RARO,
		"cond": true,
		"name": "SALTO DE CABEZA",
		"desc": "Gol por alto: saltas una y otra vez con los brazos al cielo.",
	},



	{
		"id": "g_avion", "kind": GESTO, "clave": "avion", "rare": RARO_COMUN,
		"cond": true,
		"name": "EL AVION",
		"desc": "Corres al festejo con los brazos abiertos, planeando como un avión. Sólo en los festejos con carrera de verdad.",
	},
	{
		"id": "g_selfie", "kind": GESTO, "clave": "selfie", "rare": RARO_COMUN,
		"cond": true,
		"name": "LA SELFIE",
		"desc": "Pegado a tu gente —tu fondo o la valla en casa, tu rincón de visita—: sacas el teléfono y te haces una foto con ellos.",
	},
	{
		"id": "g_reloj", "kind": GESTO, "clave": "reloj", "rare": RARO_RARO,
		"cond": true,
		"name": "ES MI HORA",
		"desc": "Gol del minuto 80 en adelante: te señalas la muñeca, que es tu hora. Una de cada tres veces.",
	},
	{
		"id": "g_zen", "kind": GESTO, "clave": "zen", "rare": RARO_RARO,
		"cond": true,
		"name": "MODO ZEN",
		"desc": "Con dos goles de ventaja o más: te sientas en el césped con las piernas cruzadas y meditas. Que se preocupen ellos.",
	},


	{
		"id": "g_robot", "kind": GESTO, "clave": "robot", "rare": RARO_COMUN,
		"cond": true,
		"name": "EL ROBOT",
		"desc": "Baile suelto: codos en ángulo recto y la cabeza girando a tirones, como una máquina. Pide sitio a la vista.",
	},
	{
		"id": "g_bebe", "kind": GESTO, "clave": "bebe", "rare": RARO_RARO,
		"cond": true,
		"name": "EL BEBE",
		"desc": "Tienes pareja: meces un bebé invisible en los brazos, para quien te espera en casa.",
	},
	{
		"id": "g_telefono", "kind": GESTO, "clave": "telefono", "rare": RARO_RARO,
		"cond": true,
		"name": "LA LLAMADA",
		"desc": "Hay clubes preguntando por ti: te llevas la mano a la oreja como un teléfono. Que llame tu agente.",
	},
	{
		"id": "g_surf", "kind": GESTO, "clave": "surf", "rare": RARO_COMUN,
		"cond": true,
		"name": "EL SURF",
		"desc": "Baile suelto: te tiras de panza y te deslizas por el césped con los brazos abiertos.",
	},
	{
		"id": "g_bolos", "kind": GESTO, "clave": "bolos", "rare": RARO_COMUN,
		"cond": true,
		"name": "LOS BOLOS",
		"desc": "Baile suelto: zancada baja y lanzas una bola invisible de bolos rasa por el césped.",
	},
	{
		"id": "g_abrazo", "kind": GESTO, "clave": "abrazo", "rare": RARO_COMUN,
		"cond": true,
		"name": "EL ABRAZO",
		"desc": "Baile suelto: abres los brazos y le das un abrazo enorme a la grada.",
	},
	{
		"id": "g_cumbia", "kind": GESTO, "clave": "cumbia", "rare": RARO_COMUN,
		"cond": true,
		"name": "LA CUMBIA",
		"desc": "Baile suelto: pasito a un lado y al otro, cadera y brazos al ritmo.",
	},
	{
		"id": "g_rugido", "kind": GESTO, "clave": "rugido", "rare": RARO_EPICO,
		"cond": true,
		"name": "EL RUGIDO",
		"desc": "Un golazo: te agachas, sacas las garras y ruges como un león.",
	},
	{
		"id": "g_anillo", "kind": GESTO, "clave": "anillo", "rare": RARO_RARO,
		"cond": true,
		"name": "BESO AL ANILLO",
		"desc": "Tienes pareja: besas el anillo y señalas a la grada, a quien te mira desde allí. Uno de cada cinco goles.",
	},
	{
		"id": "g_dorsal", "kind": GESTO, "clave": "dorsal", "rare": RARO_RARO,
		"cond": true,
		"name": "MI NOMBRE",
		"desc": "Hay clubes preguntando por ti: te das la vuelta y te señalas el nombre de la espalda para que lo apunten. La mitad de las veces.",
	},
	{
		"id": "g_mortal", "kind": GESTO, "clave": "mortal", "rare": RARO_EPICO,
		"cond": true,
		"name": "LA MORTAL",
		"desc": "Un golazo, desde fuera del área o de falta: llegas, tomas impulso y das una mortal hacia atrás. La otra mitad de los golazos.",
	},



	{
		"id": "g_dab", "kind": GESTO, "clave": "dab", "rare": RARO_EPICO,
		"cond": true,
		"name": "EL DAB",
		"desc": "Se gana en el banquillo, con tus tres botellas de pie: escondes la cara en el codo y apuntas con el otro brazo. Uno de cada siete goles.",
	},



	{
		"id": "g_chinchanpu", "kind": GESTO, "clave": "chinchanpu", "rare": RARO_EPICO,
		"cond": true,
		"name": "CHIN CHAN PU",
		"desc": "Se gana en el banquillo, con tres partidas ganadas 2-0: te plantas cara a cara con un compañero y os jugáis el gol a una mano. Uno de cada siete goles.",
	},


	{
		"id": "g_cantico", "kind": GESTO, "clave": "cantico", "rare": RARO_RARO,
		"cond": true,
		"name": "LA OREJA",
		"desc": "Tu grada te está cantando: te giras hacia ella con las manos en las orejas y la grada se viene abajo. Sólo delante de los tuyos.",
	},





	{
		"id": "g_pika", "kind": GESTO, "clave": "pika", "rare": RARO_LEGENDARIO,
		"cond": true,
		"name": "TE ELIJO A TI",
		"desc": "Se gana poniéndole a una mascota el nombre del ratón eléctrico: te calas la gorra roja y lanzas la bola. Lo estrena tu siguiente gol; luego, uno de cada trece.",
	},




	{
		"id": OCARINA_ID, "kind": GESTO, "clave": "ocarina", "rare": RARO_LEGENDARIO,
		"cond": true,
		"name": "LA OCARINA",
		"desc": "Se gana en el piano de casa, tocando de oído una canción de la ocarina: te pones el gorro verde, te salen orejas de duende y la tocas. Uno de cada once goles.",
	},






	{
		"id": PINGUINAZO_ID, "kind": GESTO, "clave": PINGUINAZO, "rare": RARO_LEGENDARIO,
		"cond": true,
		"name": "EL PINGUINAZO",
		"desc": "Se gana comprando el pingüino de casa: en tu siguiente gol tu equipo se vuelve pingüinos y los rivales, dinosaurios. Sale una sola vez.",
	},
]





static func of_kind(kind: String) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for c in ALL:
		if String(c.get("kind", "")) == kind:
			out.append(c)
	return out





static func id_for(kind: String, clave: String) -> String:
	if clave.is_empty():
		return ""
	for c in ALL:
		if String(c.get("kind", "")) == kind and String(c.get("clave", "")) == clave:
			return String(c["id"])
	return ""



static func by_id(id: String) -> Dictionary:
	for c in ALL:
		if String(c["id"]) == id:
			return c
	return {}



static func atado(id: String) -> bool:
	return ATADOS.has(id)



static func solo_visita(id: String) -> bool:
	return SOLO_VISITA.has(id)



static func total() -> int:
	return ALL.size()





static func thumb_path(id: String) -> String:
	return THUMB_DIR + id + ".png"
