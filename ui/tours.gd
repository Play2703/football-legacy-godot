class_name Tours
extends RefCounted





















































const STEPS: Dictionary = {

	"plantilla": [
		{"anchor": "", "title": "TU PLANTEL",
			"body": "El once de hoy sobre la cancha y, debajo, quién descansa. Es"
				+ " una foto: el once lo pone el técnico, no tú."},
		{"anchor": "", "title": "LA ENERGÍA MANDA",
			"body": "Tus compañeros se cansan y el técnico los rota: la cancha, la"
				+ " banca y los que no viajan son los del PRÓXIMO partido, no una"
				+ " lista fija. FRESCO, EN FORMA y CARGADO dicen cómo llega cada uno."},
	],

	"juego": [
		{"anchor": "", "title": "TU HABILIDAD",
			"body": "Tus diez cualidades. Las ocho de arriba deciden cómo te sale"
				+ " el balón; las dos de abajo son tu especialidad."},
		{"anchor": "BALÓN PARADO", "title": "LA ESPECIALIDAD",
			"body": "Penales y balón parado NO suben tu media: te hacen el"
				+ " lanzador del equipo. Es una elección de estilo, no un atajo."},
		{"anchor": "", "title": "LOS PUNTOS",
			"body": "Al subir de nivel ganas puntos. Se gastan con el más de cada"
				+ " fila, y mientras no salgas de la pantalla puedes deshacer."},
	],
	"contrato": [
		{"anchor": "", "title": "TU CONTRATO",
			"body": "El trato que tienes con el club: tu rol, tu sueldo y hasta"
				+ " cuándo."},
		{"anchor": "OBJETIVO DE TEMPORADA", "title": "LO QUE TE PIDEN",
			"body": "El club te marca una meta del año. De cómo la lleves depende"
				+ " lo que te ofrezcan al renovar."},


		{"anchor": "RENEGOCIAR", "title": "PEDIR MÁS",
			"body": "Se pide en AGENTE, junto a las ofertas. Lo que puedes pedir sale"
				+ " de cómo vienes jugando, no de lo que te gustaría."},
	],







	"gerencia": [
		{"anchor": "", "title": "LOS DESPACHOS",
			"body": "Aquí se trata con el club fuera de la cancha: cuánto te"
				+ " escuchan y a quién te traen."},
		{"anchor": "TU NIVEL EN EL CLUB", "title": "CUÁNTO TE ESCUCHAN",
			"body": "Seis niveles, y cada uno te deja pedir más. Los sube tu relación"
				+ " (técnico, vestuario, años, afición y títulos aquí) y se revisan en"
				+ " invierno y en verano. Toca uno: verás qué pide y qué da."},
		{"anchor": "FICHAJES", "title": "LA MESA DE FICHAJES",
			"body": "Con la ventana abierta marcas a quién vendes y a quién fichas,"
				+ " y el presupuesto se rehace con cada toque. Nada se mueve hasta"
				+ " que confirmas."},
		{"anchor": "ALTAS Y BAJAS", "title": "LO QUE SE MUEVE",
			"body": "Son fichajes de verdad del mercado, no adorno: el que entra"
				+ " viene de un club real y por un precio."},
	],








	"gente": [
		{"anchor": "RELACIONES", "title": "PARA QUÉ SIRVEN",
			"body": "Ninguna barra es adorno. El técnico y el vestuario deciden si"
				+ " juegas; la afición y la prensa, cuánto vales y qué marcas te"
				+ " buscan; el agente, cuántas ofertas ves."},
		{"anchor": "", "title": "EL VESTUARIO TE DA EL BALÓN",
			"body": "No es simpatía: con el vestuario hundido te llegan MENOS"
				+ " ocasiones por partido, y con él alto, una o dos más."},
		{"anchor": "", "title": "LA GRADA JUEGA",
			"body": "Con la afición por los suelos, el estadio te arruina jugadas."
				+ " Con la afición contigo, apuntas más fino."},





		{"anchor": "TE BUSCAN", "title": "SUBEN Y BAJAN",
			"body": "Quien te reclama esta semana mueve su barra según lo que"
				+ " contestes. Y todas tiran hacia el medio cada temporada: lo alto"
				+ " cae rápido, lo bajo sube despacio."},
	],
	"aspecto": [


		{"anchor": "", "title": "TU ASPECTO",
			"body": "Tu cara y tu pelo, lo que llevas en la cancha y la ropa de"
				+ " calle, en tres pestañas."},
		{"anchor": "", "title": "SE GUARDA SOLO",
			"body": "Cada toque queda guardado. Y lo que compres en TIENDA"
				+ " aparece aquí para ponértelo."},
	],
	"tienda": [
		{"anchor": "BOTAS", "title": "LAS BOTAS",
			"body": "Dan un bono a tu golpeo, y SE GASTAN con el uso: al agotarse"
				+ " dejan de dártelo."},
		{"anchor": "PARA LA JORNADA", "title": "PARA LA JORNADA",
			"body": "Lo que se consume: recuperarte, ponerte a punto y llegar"
				+ " mejor al siguiente partido."},
		{"anchor": "TU AGENTE", "title": "TU AGENTE",
			"body": "Se lleva una comisión de lo que ingresas, y otra al firmar."
				+ " Es el precio de que alguien te mueva."},
	],
	"casa": [
		{"anchor": "", "title": "TU CASA",
			"body": "Donde vives entre partidos. Subir de casa mejora cómo llegas"
				+ " al siguiente."},
		{"anchor": "ESTA SEMANA, EN CASA", "title": "LA SEMANA",
			"body": "Lo que puedes hacer en casa esta semana, sin salir a ningún"
				+ " lado."},
		{"anchor": "MUDARSE", "title": "MUDARSE",
			"body": "El siguiente peldaño, con lo que cuesta y lo que da. Ojo: el"
				+ " descanso tiene techo, no se acumula sin fin."},
	],

	"torneos": [
		{"anchor": "", "title": "TORNEOS",
			"body": "Cada competición que juegas, por dentro: su tabla, su cuadro"
				+ " o su grupo, y quién lleva los goles."},
		{"anchor": "", "title": "EL MUNDO ENTERO",
			"body": "En la liga puedes viajar a otro país y a otra división: las"
				+ " tablas del planeta están aquí."},
		{"anchor": "HISTORIAL", "title": "EL HISTORIAL",
			"body": "Quién ganó cada año. Tu nombre entra en esa lista si te lo"
				+ " ganas."},
	],








	"mercado": [
		{"anchor": "", "title": "EL MERCADO",
			"body": "Quién te quiere, cuánto pagan y qué te ofrece cada club. Sólo"
				+ " se mueve en sus dos ventanas: verano e invierno."},
		{"anchor": "", "title": "QUIÉN PUEDE FICHARTE",
			"body": "Hay dos vetos: un grande no ficha a quien no le da el nivel, y"
				+ " un modesto no puede pagarte. Por eso no te llama todo el mundo."},
		{"anchor": "", "title": "LO QUE VALES",






			"body": "Cuatro cosas: lo que sabes hacer, tu puesto, lo que llevas hecho"
				+ " esta temporada y lo que la gente sabe de ti. Y la edad manda: de"
				+ " joven multiplica, y desde los 28 pierdes casi un cuarto cada año."},
		{"anchor": "", "title": "TU AGENTE ABRE PUERTAS",
			"body": "Su nivel decide CUÁNTAS ofertas ves, y ayuda a arrancarle más"
				+ " sueldo al club. Por eso cobra."},
		{"anchor": "", "title": "SI NO JUEGAS",
			"body": "Puedes pedir salir o irte cedido. Al club no le gusta que se lo"
				+ " pidan."},
	],


	"fichajes": [
		{"anchor": "", "title": "EL MERCADO DE LOS DEMÁS",
			"body": "Quién ficha por quién en todo el mundo, con lo que pagaron."},
		{"anchor": "", "title": "ORDÉNALO",
			"body": "Las fichas de arriba ordenan por fecha, media o precio, y"
				+ " recortan a tu club, tu liga o el mundo."},
	],
	"calendario": [
		{"anchor": "", "title": "TU TEMPORADA",
			"body": "Todos tus partidos en el orden en que se juegan, con lo ya"
				+ " jugado y su resultado."},
		{"anchor": "", "title": "MIRA ADELANTE",
			"body": "Aquí se ve cuándo se te juntan liga, copa y selección: ésas"
				+ " son las semanas en que el cansancio pesa."},
	],
	"ranking": [
		{"anchor": "RANKING DE JUGADORES", "title": "EL RANKING",
			"body": "Los jugadores del planeta ordenados por su media, con la"
				+ " tuya dentro para compararte."},
		{"anchor": "", "title": "ACÓTALO",
			"body": "Se puede filtrar por puesto y por país: así se ve contra"
				+ " quién compites de verdad."},
	],





	"noticias": [
		{"anchor": "", "title": "EL MUNDO SIGUE",
			"body": "Lo que pasa en los partidos que no juegas. La liga vive"
				+ " aunque tú no estés."},
		{"anchor": "NOTICIAS", "title": "TU CELULAR",
			"body": "Cada app es un recorte: tu club, tu liga, el mundo y tus"
				+ " redes, donde se contesta a quien te critica."},
		{"anchor": "", "title": "LO TUYO VA MARCADO",
			"body": "Las noticias que te tocan llevan el borde de color, y sólo"
				+ " salen las últimas: esto es una portada, no un archivo."},
	],

	"carrera": [
		{"anchor": "", "title": "TU CARRERA",
			"body": "Los números de todo lo que llevas hecho: temporada a"
				+ " temporada y torneo por torneo."},
		{"anchor": "TU RECORRIDO", "title": "TU RECORRIDO",
			"body": "Cada club por el que pasaste y lo que costó cada movimiento."},
		{"anchor": "VALOR DE MERCADO", "title": "TU VALOR",
			"body": "La curva de lo que vales: el termómetro de si vas subiendo o"
				+ " cayendo."},
	],
	"mapa": [
		{"anchor": "MAPA DE TIROS", "title": "TU PUNTERÍA",
			"body": "Desde dónde tiras y desde dónde te entra. Cada marca es un"
				+ " remate tuyo, no una media inventada, y la curva es el vuelo"
				+ " que tuvo ese balón."},
		{"anchor": "", "title": "Y TUS PASES",
			"body": "Arriba se cambia a PASES: a dónde repartes, y cuántos de"
				+ " esos balones acaban en remate o en gol."},
		{"anchor": "", "title": "Y TUS REGATES",
			"body": "El tercer mapa: por dónde te mueves de verdad, dónde te"
				+ " quitan el balón y dónde te hacen falta."},
		{"anchor": "", "title": "TOCA UNA MARCA",
			"body": "Cada balón del campo se puede tocar: te dice contra quién"
				+ " fue, en qué minuto, y te dibuja el vuelo que tuvo."},
		{"anchor": "DESDE MÁS LEJOS", "title": "TUS MARCAS",
			"body": "El gol más lejano, el mejor acierto… lo que hiciste, no lo"
				+ " que crees que haces."},
		{"anchor": "", "title": "AÑO POR AÑO",
			"body": "Con las flechas se mira cualquier temporada ya cerrada."},
	],
	"trofeos": [
		{"anchor": "VITRINA", "title": "TU VITRINA",
			"body": "Lo que ya ganaste. Se queda para siempre y se ve también"
				+ " dentro de tu casa."},
		{"anchor": "LO QUE SE PUEDE GANAR", "title": "LO QUE FALTA",
			"body": "Todo lo que existe por ganar, incluido lo que hoy te queda"
				+ " lejos."},
	],
	"clubes": [
		{"anchor": "TU CLUB", "title": "LA CASA POR DENTRO",
			"body": "Lo que tu club ganó antes de que llegaras, y quiénes lo"
				+ " hicieron."},
		{"anchor": "GOLEADORES HISTÓRICOS", "title": "LOS DE SIEMPRE",
			"body": "Los máximos goleadores de la casa. Ahí es donde hay que"
				+ " meterse."},
	],
	"leyendas": [
		{"anchor": "LEYENDAS DEL MUNDO", "title": "LAS LEYENDAS",
			"body": "Los grandes del juego, por liga y por club. Son la vara con"
				+ " la que se te mide."},
		{"anchor": "", "title": "TU SITIO",
			"body": "Con los años, tu nombre aparece en estas listas. Eso es el"
				+ " legado."},
	],
	"balon": [
		{"anchor": "LA VOTACIÓN", "title": "EL JUGADOR DEL AÑO",
			"body": "Quién lo ganó cada año y con qué números. Si no lo ganas tú,"
				+ " lo gana alguien."},
		{"anchor": "COMO SE GANA", "title": "CÓMO SE GANA",
			"body": "Lo que pesa en la votación. Meter goles es una parte, no"
				+ " toda."},
		{"anchor": "ASÍ VA LA VOTACIÓN", "title": "ESTE AÑO",
			"body": "Cómo va la votación ahora mismo, contigo dentro si andas"
				+ " cerca."},
	],
}








const AUTO: PackedStringArray = ["juego", "contrato", "mercado", "tienda",
	"plantilla"]












const HUD_STEPS: Array = [
	{"anchor": "marcador", "title": "EL PARTIDO",
		"body": "Tu equipo, el rival y el minuto. Un partido no se juega de"
			+ " corrido: se juega por OCASIONES, y cada una es tuya."},







	{"anchor": "jugador", "title": "A QUIÉN LLEVAS",
		"body": "El jugador que controlas ahora. Un pase FUERA del área te pasa el"
			+ " mando al que lo recibe; dentro del área remata él de primera y no"
			+ " hay relevo."},
	{"anchor": "nota", "title": "TU NOTA",
		"body": "Sube y baja con cada cosa que haces. Es la nota con la que el"
			+ " técnico te juzga, y la que decide tu temporada."},
	{"anchor": "viento", "title": "EL VIENTO",
		"body": "Hacia dónde sopla y cuánto. El balón se va con él: cuéntalo al"
			+ " apuntar o el centro se te pasa largo."},
	{"anchor": "", "title": "EL PARTIDO SE INCLINA",
		"body": "Cuando tu equipo se enciende, el rival marca menos entre tus"
			+ " jugadas. Cuando se enfría, aprieta él. Lo verás avisado."},
]













const RULES: Dictionary = {
	"fuera_de_lugar": {"title": "FUERA DE LUGAR",




		"body": "Cuando salió el pase, el que lo recibió estaba más cerca del arco que"
			+ " el balón y que el penúltimo rival (el portero cuenta): el abanderado"
			+ " levanta y la jugada se anula. A la altura, en juego."},




	"falta": {"title": "EL ÁRBITRO PITA",
		"body": "El árbitro pita lo que ve. No siempre a tu favor: también te la"
			+ " pitan a ti."},




	"tarjeta": {"title": "TARJETA",
		"body": "Queda anotada. La amarilla es un aviso; una roja te deja fuera de"
			+ " los próximos partidos de ese torneo, y ahí no se juega ni se"
			+ " entrena: se espera."},
	"relevo": {"title": "AHORA LLEVAS A OTRO",
		"body": "Diste el pase y el mando saltó al que la recibió. Termina tú la"
			+ " jugada: si él vuelve a pasar, el mando se queda contigo."},









	"cambio": {"title": "TE CAMBIAN",
		"body": "Desperdiciar ocasiones SEGUIDAS con la nota por los suelos te saca"
			+ " del partido. Si el técnico confía en ti te compra una más, pero no"
			+ " muchas."},
}



static func steps(tab_id: String) -> Array:
	return STEPS.get(tab_id, [])


static func has(tab_id: String) -> bool:
	return STEPS.has(tab_id) and not (STEPS[tab_id] as Array).is_empty()



static func tabs() -> Array:
	return STEPS.keys()




static func rule(id: String) -> Array:
	if not RULES.has(id):
		return []
	var r: Dictionary = RULES[id]
	return [{"target": null, "title": String(r["title"]),
		"body": String(r["body"])}]


static func rule_ids() -> Array:
	return RULES.keys()
