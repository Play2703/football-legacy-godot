class_name Tutorial
extends RefCounted






























































































const DRILLS: Array = [

















	{
		"id": "muevete", "title": "MUÉVETE",
		"body": "Apoya el dedo dentro del círculo: ahí nace todo. Sácalo del"
			+ " círculo y corres hacia el lado contrario al que jalas. Suelta y"
			+ " paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se"
			+ " apaga y enciende el siguiente, siempre al otro lado. Conducir es"
			+ " elegir a dónde, no correr de frente.",





		"body_m": "Empuja el stick izquierdo y vas al paso hacia donde lo empujas; mantén"
			+ " {3} y corres. Suéltalo y paras en seco. Lleva el balón hasta el disco"
			+ " rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado."
			+ " Conducir es elegir a dónde, no correr de frente.",




		"body_t": "Con WASD vas al paso hacia donde pulsas; mantén {3} y corres. Suéltalas"
			+ " y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y"
			+ " enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no"
			+ " correr de frente.",
		"meta": "Pisa las 4 zonas rojas, en orden.",
		"nota": "Nadie te la quita y no hay reloj. Las estrellas son para quien"
			+ " las encadena rápido.",
		"demo": "Jala hacia atrás y sales corriendo hacia el disco.",


		"gestos": [{"modo": "corre", "pasos": [
			"Apoya el dedo dentro de tu círculo.",
			"Saca el dedo del círculo: corres al lado contrario.",
			"Suelta y paras en seco."]}],



		"gestos_h": [{"modo": "resortera", "stick": "izq", "pasos": [
			"Empuja este stick y corres hacia el disco.",
			"Suelta y paras en seco."]}],
		"cesped": "AL DISCO ROJO",
		"stats": ["velocidad", "aceleracion"],
		"segments": [{"kind": "zonas", "tries": 1, "need": 1}],
	},
	{
		"id": "pegale", "title": "PÉGALE",

















		"body": "Todo se decide en tu círculo: con el dedo DENTRO apuntas y tiras,"
			+ " y en cuanto lo sacas conduces. Es el mismo arrastre sin levantar el"
			+ " dedo: mira la palabra del círculo, que dice TIRO o REGATE según"
			+ " dónde estés. Volver a entrar te para en seco y te devuelve la"
			+ " puntería."
			+ " Jala hacia atrás, como una resortera: la guía apunta hacia"
			+ " adelante. Al soltar, toca el balón — y dónde lo tocas manda."
			+ " La primera vez el balón se pinta por zonas: arriba sale rasa y"
			+ " lenta, abajo sube y cae, a los lados comba. Y cuanto más al"
			+ " borde, menos potencia: el pepinazo va al centro. Con dos dedos"
			+ " giras la vista y apuntas desde otro ángulo.",



		"body_m": "Dos sticks: el izquierdo conduce y el derecho tira. Jala el derecho"
			+ " hacia atrás, como una resortera: la guía apunta hacia adelante. Al"
			+ " soltarlo, apunta al balón con el izquierdo y pulsa {0} — y dónde le"
			+ " pegas manda. La primera vez el balón se pinta por zonas: arriba sale"
			+ " rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al"
			+ " borde, menos potencia: el pepinazo va al centro.",


		"body_t": "WASD conduce y las flechas tiran. Mantén una flecha, como una resortera:"
			+ " la guía apunta al lado contrario. Al soltarla, apunta al balón con WASD y"
			+ " pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por"
			+ " zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y"
			+ " cuanto más al borde, menos potencia: el pepinazo va al centro.",





		"meta": "Dos tiros de práctica: el primero a puerta vacía, el segundo ya"
			+ " con portero. Después, 2 goles en 4 intentos.",
		"nota": "Los dos primeros no puntúan. En los otros, cuantos menos"
			+ " intentos gastes, más estrellas.",
		"demo": "Jala hacia atrás y suelta para pegarle.",









		"gestos": [{"modo": "aro", "pasos": [
			"Dentro del círculo apuntas: la guía crece.",
			"Sacas el dedo del círculo y regateas, sin soltar.",
			"Vuelves a entrar y paras en seco, apuntando.",
			"Sueltas dentro y le pegas."]}],




		"gestos_h": [
			{"modo": "resortera", "stick": "izq", "pasos": [
				"Empuja este stick y conduces.",
				"Suelta y paras en seco."]},
			{"modo": "resortera", "stick": "der", "pasos": [
				"Jala este stick hacia atrás y apuntas.",
				"Sueltas y le pegas."]}],












		"cesped": "DENTRO TIRAS / FUERA REGATEAS",



		"cesped_h": "IZQUIERDO CONDUCE / DERECHO TIRA",

		"cesped_t": "WASD CONDUCE / FLECHAS TIRAN",
		"stats": ["potencia", "precision"],












		"segments": [{"kind": "tiro_solo", "tries": 2, "need": 0, "ensaya": true},
			{"kind": "frontal", "tries": 4, "need": 2}],
	},
	{
		"id": "pasala", "title": "PASALA",




















		"body": "No hay botón de pase: pasar es TIRAR apuntando a un compañero,"
			+ " y el balón se lo queda quien llegue antes. Tienes dos: el de"
			+ " fuera del área y el de dentro. Si tu pase cae fuera del área,"
			+ " pasas a jugar con quien lo recibe. Si cae dentro, no hay control"
			+ " que valga: remata de primera. Y para verlos: un toque en el pasto,"
			+ " fuera de tu círculo y sin nadie debajo, gira la vista a la banda y"
			+ " te enseña a los compañeros; otro toque y vuelve.",

		"body_m": "No hay botón de pase: pasar es TIRAR apuntando a un compañero,"
			+ " y el balón se lo queda quien llegue antes. Tienes dos: el de"
			+ " fuera del área y el de dentro. Si tu pase cae fuera del área,"
			+ " pasas a jugar con quien lo recibe. Si cae dentro, no hay control"
			+ " que valga: remata de primera. Y para verlos: {2} gira la vista a la"
			+ " banda y te enseña a los compañeros; otra vez y vuelve.",
		"meta": "Un pase de práctica. Después, 1 gol en 3 pases al área.",
		"nota": "El primero no puntúa. En los otros, cuantos menos intentos"
			+ " gastes, más estrellas.",
		"demo": "Apunta a un compañero y suelta.",







		"gestos": [
			{"modo": "resortera", "pasos": ["Apunta a un compañero y suelta."]},
			{"modo": "camara", "pasos": [
				"Toca el pasto fuera de tu círculo y giras la vista.",
				"Otro toque y la vista vuelve."]}],




		"gestos_h": [{"modo": "resortera", "stick": "der", "pasos": [
			"Apunta a un compañero y suelta."]}],



		"cesped": "FUERA LO JUEGAS TU / DENTRO REMATA",




		"stats": ["vision"],





		"segments": [{"kind": "relevo", "tries": 1, "need": 0, "ensaya": true},
			{"kind": "relevo", "tries": 3, "need": 1}],
		"need_total": 1,
	},
	{
		"id": "encara", "title": "ENCARA",









		"body": "Rivales encima y el campo por delante: conduce y CRUZA al campo"
			+ " rival — hasta la raya encendida no se tira, se regatea, y cada"
			+ " tramo que avanzas te sale gente nueva al paso. Después, el mano a"
			+ " mano: tira ya, o condúcela y vuelve"
			+ " al círculo para parar en seco y apuntar con calma.",


		"body_m": "Rivales encima y el campo por delante: conduce y CRUZA al campo"
			+ " rival — hasta la raya encendida no se tira, se regatea, y cada"
			+ " tramo que avanzas te sale gente nueva al paso. Después, el mano a"
			+ " mano: conduce con el stick izquierdo y tira con el derecho cuando"
			+ " lo veas.",
		"body_t": "Rivales encima y el campo por delante: conduce y CRUZA al campo"
			+ " rival — hasta la raya encendida no se tira, se regatea, y cada"
			+ " tramo que avanzas te sale gente nueva al paso. Después, el mano a"
			+ " mano: conduce con WASD y tira con las flechas cuando lo veas.",




		"meta": "Primero cruza la media cancha, hasta la raya encendida."
			+ " Después, el mano a mano: 1 gol en 3 intentos.",
		"nota": "La salida es un ensayo y no puntúa. Cuantos menos intentos"
			+ " gastes en el mano a mano, más estrellas.",
		"demo": "Jala hacia atrás y corre: cruza la raya de la media cancha.",
		"gestos": [{"modo": "corre", "pasos": [
			"Apoya el dedo dentro de tu círculo.",
			"Fuera del círculo conduces: cruza la raya.",
			"Suelta y paras en seco."]}],
		"gestos_h": [{"modo": "resortera", "stick": "izq", "pasos": [
			"Empuja este stick y conduces: cruza la raya.",
			"Suelta y paras en seco."]}],
		"cesped": "CRUZA Y ENCARA",
		"stats": ["regate", "fisico"],





		"segments": [{"kind": "salir_presion", "tries": 1, "need": 0,
				"ensaya": true},
			{"kind": "solo", "tries": 3, "need": 1}],
		"need_total": 1,
	},
	{
		"id": "sirve", "title": "SIRVE AL ÁREA",





		"body": "Estos son CENTROS: el balón se cuelga al área. En un córner ya"
			+ " nace en CENTRO; lo dice el indicador de arriba a la derecha. Para"
			+ " cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo"
			+ " mientras apuntas, o toca ese indicador. Busca la cabeza de un"
			+ " compañero, no el arco. Y al cerrar, el cambio de banda: el"
			+ " mismo servicio pero buscando al compañero libre de la otra punta.",


		"body_m": "Estos son CENTROS: el balón se cuelga al área. En un córner ya"
			+ " nace en CENTRO; lo dice el botón TIRO/CENTRO de la pantalla. Para"
			+ " cambiar entre CENTRO (colgado) y TIRO (raso), pulsa {1} mientras"
			+ " apuntas. Busca la cabeza de un compañero, no el arco. Y al cerrar,"
			+ " el cambio de banda: el mismo servicio pero buscando al compañero"
			+ " libre de la otra punta.",






		"meta": "Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve el"
			+ " cambio de banda.",
		"nota": "El gol puede caer en cualquiera de los seis. Cuanto antes,"
			+ " más estrellas. El cambio de banda es ensayo y no puntúa.",
		"demo": "Cuélgala al área. Con otro dedo cambias entre CENTRO y TIRO.",






		"gestos": [{"modo": "centro", "pasos": [
			"Apunta al área y aguanta el dedo.",
			"Con otro dedo cambias entre CENTRO y TIRO.",
			"Suelta y la cuelgas."]}],



		"gestos_h": [{"modo": "centro", "stick": "der", "pasos": [
			"Apunta al área y aguanta el dedo.",
			"Con este botón cambias entre CENTRO y TIRO.",
			"Suelta y la cuelgas."]}],
		"cesped": "CUELGALA AL AREA",
		"stats": ["efecto"],





























		"segments": [{"kind": "corner", "tries": 3, "need": 0},
			{"kind": "centro", "tries": 3, "need": 0},
			{"kind": "cambio_banda", "tries": 1, "need": 0, "ensaya": true}],
		"need_total": 1,
	},
	{
		"id": "parado", "title": "BALÓN PARADO",
		"body": "La barrera tapa el camino raso: elévalo por encima tocando el"
			+ " balón abajo. El costado lo curva, si te atreves. Y el examen"
			+ " final: el penal. Respira. Tú eliges la esquina.",



		"body_t": "La barrera tapa el camino raso: elévalo por encima pegándole al"
			+ " balón abajo. El costado lo curva, si te atreves. Y el examen"
			+ " final: el penal. Respira. Tú eliges la esquina.",
		"meta": "Libre: 1 gol en 3 intentos · Penal: 1 en 2.",
		"nota": "Cuantos menos intentos gastes, más estrellas.",
		"demo": "Jala hacia atrás para pegarle a la falta.",
		"gestos": [{"modo": "resortera",
			"pasos": ["Jala hacia atrás para pegarle a la falta."]}],
		"cesped": "SALVA LA BARRERA",
		"stats": ["parado", "penal"],
		"segments": [{"kind": "libre", "tries": 3, "need": 1},
			{"kind": "penal", "tries": 2, "need": 1}],
	},
]















const ENCARA_SALIDA_ID: String = "encara"
const ENCARA_SALIDA: Dictionary = {




	"body": "Naces en tu campo con el balón y el arco lejos. Conduce, pásala a un"
		+ " compañero y sigue: el pase se golpea como un tiro y juegas con quien la"
		+ " recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano"
		+ " a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y"
		+ " apuntar con calma.",


	"body_m": "Naces en tu campo con el balón y el arco lejos. Conduce con el stick"
		+ " izquierdo, pásala con el derecho a un compañero y sigue: el pase se golpea"
		+ " como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar,"
		+ " el rival aprieta. Después, el mano a mano: tira cuando lo veas.",

	"body_t": "Naces en tu campo con el balón y el arco lejos. Conduce con WASD, pásala"
		+ " con las flechas a un compañero y sigue: el pase se golpea como un tiro y"
		+ " juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta."
		+ " Después, el mano a mano: tira cuando lo veas.",
	"meta": "Primero sal jugando desde tu campo: conduce, pasa y llega hasta el arco."
		+ " Después, el mano a mano: 1 gol en 3 intentos.",
	"nota": "La salida es un ensayo y no puntúa. Cuantos menos intentos"
		+ " gastes en el mano a mano, más estrellas.",
	"demo": "Pásala a un compañero y avanza hacia el arco.",
	"gestos": [{"modo": "resortera",
		"pasos": ["Pásala a un compañero y avanza hacia el arco."]}],


	"gestos_h": [
		{"modo": "resortera", "stick": "izq", "pasos": [
			"Empuja este stick y avanza hacia el arco.",
			"Suelta y paras en seco."]},
		{"modo": "resortera", "stick": "der", "pasos": [
			"Jala este stick y pásala a un compañero."]}],

	"cesped": "PASA Y AVANZA",


	"segments": [{"kind": "salida", "tries": 1, "need": 0, "ensaya": true},
		{"kind": "solo", "tries": 3, "need": 1}],
}



















const SEG_CESPED: Dictionary = {

	"solo": "PARA EN SECO Y APUNTA",

	"cambio_banda": "BUSCA LA OTRA BANDA",
}

























const STRIKE_ZONA_ALTA: String = "RASA Y LENTA"
const STRIKE_ZONA_BAJA: String = "SUBE Y CAE"
const STRIKE_ZONA_LADO: String = "COMBA"
const STRIKE_TIP: String = "EL CENTRO PEGA MAS FUERTE"




const STAR3_RATIO: float = 0.75
const STAR2_RATIO: float = 0.5























const ZONES_T_3: int = 26
const ZONES_T_2: int = 36


static func count() -> int:
	return DRILLS.size()


static func drill(i: int) -> Dictionary:
	var d: Dictionary = DRILLS[clampi(i, 0, DRILLS.size() - 1)]




	if Practice.salida_jugada_on and String(d.get("id", "")) == ENCARA_SALIDA_ID:
		d = d.duplicate()
		d.merge(ENCARA_SALIDA, true)
	return d


static func segments(i: int) -> Array:
	return drill(i)["segments"]


static func seg(i: int, j: int) -> Dictionary:
	var segs: Array = segments(i)
	return segs[clampi(j, 0, segs.size() - 1)]




static func stats(i: int) -> Array:
	return drill(i).get("stats", [])












static func cesped(i: int, tumbado: bool = false, teclado: bool = false) -> String:
	var d: Dictionary = drill(i)
	if teclado and d.has("cesped_t"):
		return String(d["cesped_t"])
	if tumbado and d.has("cesped_h"):
		return String(d["cesped_h"])
	return String(d.get("cesped", ""))



















static func body(i: int, mando: bool = false, teclado: bool = false) -> String:
	return body_de(drill(i), mando, teclado)



static func body_de(d: Dictionary, mando: bool, teclado: bool = false) -> String:
	if teclado and d.has("body_t"):
		return String(d["body_t"])
	if (mando or teclado) and d.has("body_m"):
		return String(d["body_m"])
	return String(d.get("body", ""))








const PASOS_MANDO: Dictionary = {
	"Empuja este stick y corres hacia el disco.": "Empuja este stick hacia el disco; con {3}, corres.",
	"Con este botón cambias entre CENTRO y TIRO.": "Con {1} cambias entre CENTRO y TIRO.",
	"Apunta al área y aguanta el dedo.": "Apunta al área y aguanta el stick.",
	"Sueltas y le pegas.": "Sueltas, apuntas y pulsas {0}.",
}


static func pasos_mando(pasos: Array) -> Array:
	var out: Array = []
	for p in pasos:
		out.append(String(PASOS_MANDO.get(String(p), String(p))))
	return out







const PASOS_TECLADO: Dictionary = {
	"Empuja este stick y corres hacia el disco.": "Pulsa WASD y vas al disco; con {3}, corres.",
	"Empuja este stick y conduces.": "Pulsa WASD y conduces.",
	"Jala este stick hacia atrás y apuntas.": "Mantén una flecha y apuntas.",
	"Sueltas y le pegas.": "Sueltas, apuntas con WASD y pulsas {0}.",
	"Empuja este stick y conduces: cruza la raya.": "Pulsa WASD y conduces: cruza la raya.",
	"Apunta al área y aguanta el dedo.": "Apunta al área y aguanta la flecha.",
	"Empuja este stick y avanza hacia el arco.": "Pulsa WASD y avanza hacia el arco.",
	"Jala este stick y pásala a un compañero.": "Mantén una flecha y pásala a un compañero.",
	"Jala hacia atrás para pegarle a la falta.":
		"Mantén una flecha y suelta para pegarle a la falta.",
}


static func pasos_teclado(pasos: Array) -> Array:
	var out: Array = []
	for p in pasos:
		var k: String = String(p)
		out.append(String(PASOS_TECLADO.get(k, PASOS_MANDO.get(k, k))))
	return out



static func demo(i: int) -> String:
	return String(drill(i).get("demo", ""))


















static func gestos(i: int, tumbado: bool = false) -> Array:
	var d: Dictionary = drill(i)
	var g: Array = d.get("gestos", [])
	if tumbado:
		var h: Array = d.get("gestos_h", [])
		if not h.is_empty():
			return h
		var out: Array = []
		for f in g:
			if String(f.get("modo", "")) == "resortera":
				out.append({"modo": "resortera", "stick": "der", "pasos": f.get("pasos", [])})
		if out.is_empty():
			out.append({"modo": "resortera", "stick": "der", "pasos": [demo(i)]})
		return out
	if g.is_empty():
		return [{"modo": "resortera", "pasos": [demo(i)]}]
	return g




static func need_total(i: int) -> int:
	var d: Dictionary = drill(i)
	if d.has("need_total"):
		return int(d["need_total"])
	var total: int = 0
	for s in segments(i):
		total += int(s["need"])
	return total







static func seg_over(i: int, j: int, goals_j: int, tries_j: int) -> bool:
	var s: Dictionary = seg(i, j)
	var need: int = int(s["need"])
	if need > 0 and goals_j >= need:
		return true
	var tries: int = int(s["tries"])
	return tries > 0 and tries_j >= tries





static func next_step(i: int, j: int, goals: Array, tries: Array) -> String:
	if not seg_over(i, j, int(goals[j]), int(tries[j])):
		return "attempt"














	var need: int = int(seg(i, j)["need"])
	if need > 0 and int(goals[j]) < need:
		return "retry_seg"
	if j + 1 < segments(i).size():
		return "next_seg"
	if not drill_passed(i, goals):
		return "retry"
	return "drill_done"












static func drill_passed(i: int, goals: Array) -> bool:
	var total: int = 0
	var segs: Array = segments(i)
	for j in segs.size():
		var need: int = int(segs[j]["need"])
		if need > 0 and int(goals[j]) < need:
			return false
		if bool(segs[j].get("ensaya", false)):
			continue
		total += int(goals[j])
	return total >= need_total(i)









static func retry_seg(i: int) -> int:
	var segs: Array = segments(i)
	for j in segs.size():
		if not bool(segs[j].get("ensaya", false)):
			return j
	return 0












static func stars(i: int, goals: Array, tries: Array, metrica: int = 0,
		rondas: int = 0) -> int:
	if not drill_passed(i, goals):
		return 0
	if String(seg(i, 0)["kind"]) == Practice.ZONES:
		if metrica <= ZONES_T_3:
			return maxi(3 - rondas, 1)
		return maxi((2 if metrica <= ZONES_T_2 else 1) - rondas, 1)
	var g: int = 0
	var t: int = 0
	for j in segments(i).size():




		if bool(seg(i, j).get("ensaya", false)):
			continue
		g += int(goals[j])
		t += int(tries[j])
	var ratio: float = float(g) / float(maxi(t, 1))
	if ratio >= STAR3_RATIO:
		return maxi(3 - rondas, 1)
	return maxi((2 if ratio >= STAR2_RATIO else 1) - rondas, 1)


static func total(stars_list: Array) -> int:
	var sum: int = 0
	for s in stars_list:
		sum += int(s)
	return sum


static func max_total() -> int:
	return DRILLS.size() * 3





















static func prepara_borrador(nombre: String = "", pos: String = "") -> void:
	Telemetry.count("academia_jugada")








	var puesto: String = pos if Squad.PUESTOS_ALTA.has(pos) \
			else String(Squad.PUESTOS_ALTA[0])



	GameState.career_draft = {"name": Career.capitaliza_nombre(nombre.strip_edges()),
		"look": {}, "nat": "",
		"mods": [], "pos": puesto, "pendiente": true}
	GameState.tutorial_result = {}
	GameState.tutorial_active = true
















	GameState.next_weather = "night"





	GameState.next_rain = -1
