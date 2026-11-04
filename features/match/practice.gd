class_name Practice
extends RefCounted

























const DRIBBLE: String = "regate"






const OPEN_FIELD: String = "campo_abierto"

















const SWITCH: String = "cambio_banda"











const PRESS_OUT: String = "salir_presion"






















static var salida_jugada_on: bool = true
















const SALIDA: String = "salida"



const SALIDA_GRUPO: String = "CONDUCCIÓN"






















static var salida_meta_on: bool = true
const SALIDA_META: String = "salida_meta"




const SALIDA_META_GRUPO: String = "BALÓN PARADO"
















const SAQUE_BANDA: String = "saque_banda"








const SAQUE_LARGO: String = "saque_largo"























const RECUPERA: String = "recuperar"

















const ZONES: String = "zonas"











const CLEAN_SHOT: String = "tiro_solo"


















const RELEVO: String = "relevo"






















const DIANAS: String = "dianas"
























const BLANCOS: String = "blancos"





























const ESLALON: String = "eslalon"














const ENTRADA: String = "entrada"








const CANO: String = "cano"








const RECEPCION: String = "recepcion"






























const OPEN_ROLL: Dictionary = {
	"solo": [0, 7], "frontal": [8, 23], "lejano": [24, 38], "angulo": [39, 47],
	"contra": [48, 61], "centro": [62, 71],
}











const SET_ROLL: Dictionary = {
	"libre": [83, 88], "corner": [89, 93], "penal": [94, 95],
	"banda": [96, 97], "indirecta": [98, 99],
}








const TRIES: int = 60



























































const SERVICIO: String = "servicio"

















const SERV_CABEZA: String = "serv_cabeza"
const SERV_VOLEA: String = "serv_volea"
const SERV_CHILENA: String = "serv_chilena"




const GESTO_DE: Dictionary = {
	SERV_CABEZA: "cabeza",
	SERV_VOLEA: "volea",
	SERV_CHILENA: "chilena",
}

















const GROUPS: Array = [
	{"title": "JUEGO ABIERTO",
		"kinds": ["solo", "frontal", "lejano", "angulo", "contra", "centro"]},








	{"title": "BALÓN PARADO",
		"kinds": ["libre", "corner", "penal", "indirecta", SAQUE_BANDA,
			SAQUE_LARGO, SALIDA_META]},





	{"title": "CONDUCCIÓN",
		"kinds": [OPEN_FIELD, CANO]},
	{"title": "PASE",
		"kinds": [SWITCH, SERVICIO, RECEPCION]},




	{"title": "REMATE AÉREO",
		"kinds": [SERV_CABEZA, SERV_VOLEA, SERV_CHILENA]},



	{"title": "DEFENSA",
		"kinds": [ENTRADA]},
]












const LABELS: Dictionary = {
	DRIBBLE: "Regate 1 contra 1",
	OPEN_FIELD: "Campo abierto",



	SWITCH: "Centrar por la banda",



	SERVICIO: "Te la sirven",


	SERV_CABEZA: "Cabezazos",
	SERV_VOLEA: "Voleas",
	SERV_CHILENA: "Chilenas",







	PRESS_OUT: "Cruza el medio campo",


	SALIDA: "Salida jugada",

	SALIDA_META: "Salida de meta",

	SAQUE_BANDA: "Saque de banda corto",

	SAQUE_LARGO: "Saque de banda al área",
	RECUPERA: "Recuperar el balón",
	ZONES: "Las cuatro zonas",
	CLEAN_SHOT: "Tiro a puerta",
	RELEVO: "El relevo",
	DIANAS: "Porterías chiquitas",
	BLANCOS: "Rompe las dianas",
	ESLALON: "Eslalon con rival",
	ENTRADA: "La entrada",
	CANO: "Caños",
	RECEPCION: "Balón largo",
	"indirecta": "Falta al borde del área",
}












const LESSON: Dictionary = {
	"solo": {"tip": "Solo ante el portero: define el mano a mano.",
		"demo": "Jala hacia atrás y suelta al arco"},
	"frontal": {"tip": "Disparo de frente: aprovecha el ángulo abierto.",
		"demo": "Jala y suelta con fuerza al arco"},
	"lejano": {"tip": "Desde lejos: la puntería pesa más que la fuerza.",
		"demo": "Apunta fino y suelta al arco"},
	"angulo": {"tip": "Ángulo cerrado: mete efecto para colarla.",
		"demo": "Curva el tiro hacia el palo largo"},
	"contra": {"tip": "Contragolpe: resuelve antes de que cierre la defensa.",
		"demo": "Jala y suelta antes de que te tapen"},











	"centro": {"tip": "El balón es TUYO y estás en la banda: cuélgalo al área o prueba el tiro escorado.",
		"demo": "Jala y suelta: al área o al arco"},
	"libre": {"tip": "Tiro libre directo: sortea la barrera al arco.",
		"demo": "Jala y suelta por encima de la barrera"},
	"corner": {"tip": "Córner: coloca el centro para el remate.",
		"demo": "Pon el balón al corazón del área"},
	"penal": {"tip": "Penal: tú y el portero, a sangre fría.",
		"demo": "Elige tu lado y suelta ajustado"},
	"indirecta": {"tip": "Falta al borde del área: monta el disparo desde fuera.",
		"demo": "Jala y suelta buscando el hueco"},
	"banda": {"tip": "Saque de banda: reanuda el ataque con un compañero.",
		"demo": "Saca rápido hacia un compañero"},
	OPEN_FIELD: {"tip": "Cancha entera y sin reloj: siente la conducción y tira cuando quieras.",
		"demo": "Arrastra para conducir; suelta en el círculo para tirar",


		"demo_m": "Stick izquierdo para conducir; jala el derecho y suelta para tirar",
		"demo_t": "WASD para conducir; mantén una flecha y suelta para tirar"},
	CANO: {"tip": "Te sale a encarar: pica cuando el aro llegue a sus piernas y pásasela por el túnel.",
		"demo": "Toca la pantalla cuando el aro se cierre",
		"demo_m": "Pulsa cuando el aro se cierre"},


	RECEPCION: {"tip": "Te cuelgan un balón largo: pica cuando el aro se cierre para bajarlo. Si te rebota, pierdes la jugada.",
		"demo": "Toca la pantalla cuando el aro se cierre",
		"demo_m": "Pulsa cuando el aro se cierre"},
	SWITCH: {"tip": "Pon el CENTRO a un compañero: se gana completándolo, no tirando a puerta.",
		"demo": "Cuelga el centro a un compañero"},
	DIANAS: {"tip": "Métela en la portería pequeña, no en la grande. Cada balón sale de más lejos.",
		"demo": "Jala y suelta a la portería pequeña"},
	BLANCOS: {"tip": "Rompe las dianas del arco. La chiquita de arriba paga el triple que la gorda de abajo.",
		"demo": "Jala y suelta a una diana"},
	ESLALON: {"tip": "Pisa los conos con el balón. El chico paga el triple, pero está del lado del que te marca.",
		"demo": "Arrastra para conducir; no se tira",
		"demo_m": "Stick izquierdo para conducir; no se tira",
		"demo_t": "WASD para conducir; no se tira"},





	SERVICIO: {"tip": "Te la traen conduciendo y te la pasan. Apunta y remátala de primera, o se te escapa.",
		"demo": "Espera el pase; luego jala y suelta"},




	SERV_CABEZA: {"tip": "Te cuelgan el centro a la cabeza. Espera a que llegue y cabecea a puerta.",
		"demo": "Espera el centro; luego jala y suelta"},
	SERV_VOLEA: {"tip": "Te la ponen al pecho: la paras y le pegas de volea antes de que toque el suelo.",


		"tip_t": "Te la ponen al pecho: la paras y le pegas de volea antes de que bote.",
		"demo": "Espera el control; luego jala y suelta"},
	SERV_CHILENA: {"tip": "Saltas de espaldas al arco: apunta a puerta aunque no la veas.",
		"demo": "Espera el centro; luego jala y suelta"},
	RECUPERA: {"tip": "Ponte entre el balón y tu portería para robar. Al recuperar, sigue arrastrando y ataca.",
		"demo": "Arrastra para correr; toca con un segundo dedo para barrerte",


		"demo_m": "Stick izquierdo para correr; pulsa {0} para barrerte",
		"tip_t": "Ponte entre el balón y tu portería para robar, o pulsa {0} para barrerte. Al recuperar, sigue con WASD y ataca.",
		"demo_t": "WASD para correr; pulsa {0} para barrerte"},


	ENTRADA: {"tip": "Toca cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.",
		"demo": "Toca en el blanco para barrerte",

		"tip_t": "Pulsa {0} cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.",
		"demo_t": "Pulsa {0} en el blanco para barrerte"},




	SALIDA: {"tip": "Naces en tu campo con el balón. Conduce, pásala y avanza: cada pase lo golpeas tú y juegas con quien la recibe.",
		"demo": "Arrastra para conducir; apunta a un compañero y suelta",
		"demo_m": "Stick izquierdo para conducir; apunta con el derecho a un compañero y suelta",
		"demo_t": "WASD para conducir; mantén una flecha hacia un compañero y suelta"},



	SALIDA_META: {"tip": "Sacas de meta con tu portero: juégala en corto o revienta el pase largo. Luego juegas con quien la recibe.",
		"demo": "Apunta a un compañero y suelta"},


	SAQUE_BANDA: {"tip": "Un compañero te la saca de banda: la controlas solo y juegas libre. Regatea, tira o devuélvesela.",
		"demo": "Arrastra para conducir; suelta en el círculo para tirar",
		"demo_m": "Stick izquierdo para conducir; jala el derecho y suelta para tirar",
		"demo_t": "WASD para conducir; mantén una flecha y suelta para tirar"},


	SAQUE_LARGO: {"tip": "Te la sacan de banda al área. No se controla: espera a que llegue y cabecea a puerta.",
		"demo": "Espera el saque; luego jala y suelta"},
}







static func leccion(kind: String, campo: String, mando: bool = false,
		teclado: bool = false) -> String:
	var l: Dictionary = LESSON.get(kind, {})
	if teclado and l.has(campo + "_t"):
		return String(l[campo + "_t"])
	if (mando or teclado) and l.has(campo + "_m"):
		return String(l[campo + "_m"])
	return String(l.get(campo, ""))










static func grupos() -> Array:
	if not salida_jugada_on and salida_meta_on:
		return GROUPS
	var out: Array = []
	for g in GROUPS:
		var kinds: Array =(g["kinds"] as Array).duplicate()
		if salida_jugada_on and String(g["title"]) == SALIDA_GRUPO:
			kinds.append(SALIDA)
		if not salida_meta_on:
			kinds.erase(SALIDA_META)
		out.append({"title": g["title"], "kinds": kinds})
	return out



static func all() -> Array[String]:
	var out: Array[String] = []
	for g in grupos():
		for k in g["kinds"]:
			out.append(String(k))
	return out






static func is_kind(kind: String) -> bool:
	if kind == SALIDA:
		return salida_jugada_on
	if kind == SALIDA_META:
		return salida_meta_on
	if kind == SAQUE_BANDA:
		return true
	return kind == DRIBBLE or kind == OPEN_FIELD or kind == SWITCH \
			or es_servicio(kind) \
			or kind == PRESS_OUT or kind == RECUPERA \
			or kind == ZONES or kind == CLEAN_SHOT or kind == RELEVO \
			or kind == DIANAS or kind == BLANCOS or kind == ESLALON or kind == ENTRADA or kind == CANO \
			or kind == RECEPCION \
			or OPEN_ROLL.has(kind) or SET_ROLL.has(kind)




static func label_of(kind: String) -> String:
	if LABELS.has(kind):
		return String(LABELS[kind])
	return String(ScenarioStore.KIND_LABELS.get(kind, kind))












static func con_maquina(kind: String) -> bool:
	return kind == DIANAS or kind == BLANCOS











static func con_balonera(kind: String) -> bool:
	return con_maquina(kind) or kind == ESLALON






static func es_servicio(kind: String) -> bool:
	return kind == SERVICIO or kind == SAQUE_LARGO or GESTO_DE.has(kind)






static func gesto_de(kind: String) -> String:
	return String(GESTO_DE.get(kind, ""))
