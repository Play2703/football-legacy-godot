class_name Pareja
extends RefCounted












































































const PERFILES: Array = [
	{"id": "casera", "rasgo": "casera", "gasto": 0.6, "celos": 0.8, "paga": 1.0,
		"mudanza": 58, "calma": 94, "exige": 0.5,

		"sitio": "calle",
		"descanso": 1.2,
		"arraigo": 60,
		"interes": 0.1,
		"desc": "Le gusta la vida tranquila. No pide focos, pide que estés."},
	{"id": "fiestera", "rasgo": "fiestera", "gasto": 1.6, "celos": 1.3, "paga": 1.3,
		"mudanza": 72, "calma": 78, "exige": 1.2,
		"roce": {"aficion": 1.6, "prensa": 1.4, "equipo": 0.6},
		"eco": {"prensa": 1.3},
		"sitio": "bar",
		"descanso": 0.4,
		"arraigo": 45,
		"interes": 0.85,
		"desc": "Vive de noche. Contigo o sin ti, y eso es justo el problema."},
	{"id": "ambiciosa", "rasgo": "ambiciosa", "gasto": 1.4, "celos": 0.9, "paga": 1.1,
		"mudanza": 65, "calma": 80, "exige": 1.0,
		"roce": {"prensa": 0.5, "equipo": 1.3},
		"eco": {"prensa": 1.5},


		"sitio": "cena",
		"descanso": 0.8,
		"arraigo": 80,
		"interes": 1.0,
		"desc": "Tiene lo suyo y va en serio. Te quiere arriba, y lo dice."},
	{"id": "celosa", "rasgo": "celosa", "gasto": 1.0, "celos": 1.6, "paga": 1.2,
		"mudanza": 58, "calma": 78, "exige": 1.0,
		"roce": {"equipo": 1.4, "prensa": 1.2},
		"sitio": "galeria",
		"descanso": 0.8,
		"arraigo": 0,
		"interes": 0.45,
		"desc": "Te quiere entero. Cada foto con otra le cuesta una noche."},
	{"id": "independiente", "rasgo": "independiente", "gasto": 0.8, "celos": 0.6, "paga": 0.8,
		"mudanza": 72, "calma": 85, "exige": 0.9,
		"roce": {"equipo": 0.6, "aficion": 0.6, "prensa": 0.6},
		"eco": {"prensa": 0.7},
		"sitio": "galeria",
		"descanso": 1.0,
		"arraigo": 101,
		"interes": 0.0,
		"desc": "No te necesita, te eligió. Aguanta todo menos que la des por hecha."},
	{"id": "hincha", "rasgo": "hincha", "gasto": 0.8, "celos": 0.7, "paga": 1.2,
		"mudanza": 65, "calma": 92, "exige": 0.6,
		"roce": {"aficion": 0.2}, "eco": {"aficion": 1.5},
		"sitio": "bar",
		"descanso": 1.0,
		"arraigo": 0,
		"interes": 0.2,
		"desc": "Iba al estadio antes de conocerte. Los domingos son sagrados."},
	{"id": "reservada", "rasgo": "reservada", "gasto": 0.8, "celos": 1.1, "paga": 0.9,
		"mudanza": 65, "calma": 86, "exige": 0.8,
		"roce": {"prensa": 1.2, "equipo": 0.8},
		"eco": {"prensa": 0.5},
		"sitio": "calle",
		"descanso": 1.05,
		"arraigo": 70,
		"interes": 0.15,
		"desc": "Odia la prensa. Contigo en privado lo da todo; en público, nada."},



























	{"id": "cazafortunas", "rasgo": "cazafortunas", "gasto": 1.8, "celos": 0.6,
		"paga": 1.4,
		"mudanza": 58, "calma": 96, "exige": 0.3,
		"roce": {"equipo": 1.3},
		"eco": {"prensa": 1.25},
		"sitio": "calle",
		"descanso": 1.15,
		"arraigo": 30,
		"interes": 1.0,
		"arruina": true,
		"desc": "Tranquila, cariñosa y sin dramas. Nunca te pide explicaciones."},
	{"id": "companera", "rasgo": "companera", "gasto": 1.0, "celos": 0.9, "paga": 1.1,
		"mudanza": 65, "calma": 93, "exige": 0.6,
		"roce": {"equipo": 0.3}, "eco": {"equipo": 1.3},
		"sitio": "cena",
		"descanso": 1.3,
		"arraigo": 50,
		"interes": 0.05,
		"desc": "Entiende el oficio: entrena, viaja, aguanta. Y espera lo mismo."},














	{"id": "millonaria", "rasgo": "millonaria", "gasto": 0.0, "celos": 1.0,
		"paga": 1.0,
		"invita": 1.0,
		"mudanza": 72, "calma": 84, "exige": 0.8,
		"roce": {"equipo": 0.5, "aficion": 1.3},
		"eco": {"prensa": 1.3},
		"sitio": "bar",
		"descanso": 1.1,
		"arraigo": 90,
		"interes": 0.0,
		"divorcio": 0.0,
		"regalo": 0.25,
		"desc": "Trabaja en algo que nunca termina de explicar. Invita ella, y no deja discutirlo."},
]






const SORPRESA_P: float = 0.2
const SORPRESA_ID: String = "millonaria"










const ALBUM: Dictionary = {
	"casera": ["La casera", "Quiere tu tiempo, no tu dinero. En casa se duerme."],
	"fiestera": ["La fiestera", "Vive de noche, contigo o sin ti. Te cuesta sueño y dinero."],
	"ambiciosa": ["La ambiciosa", "Te quiere arriba, y te pasa la factura por subir."],
	"celosa": ["La celosa", "Te quiere entero, y cada foto tuya con otra le cuesta una noche."],
	"independiente": ["La independiente", "No te necesita: te eligió. Nunca acepta tu dinero."],
	"hincha": ["La hincha", "Iba al estadio antes que tú. Los domingos son sagrados."],
	"reservada": ["La reservada", "Odia la prensa. En privado lo da todo."],
	"cazafortunas": ["La cazafortunas", "No te quiere. Cuando le salgan las cuentas, se va con lo tuyo; con papel, tarda más y se lleva menos."],
	"companera": ["La compañera", "Entiende el oficio. Entrena, viaja y aguanta contigo."],
	"millonaria": ["La millonaria", "Tiene más que tú y no te lo dice. Te regala dinero cada jornada y paga la boda."],
}














const TEMAS: Array[String] = ["lugar", "odia", "pidio"]









const CITAS_OIDOS: String = "oidos"
const DATOS: Dictionary = {


	"lugar": [
		"Creció en un pueblo de la costa",
		"Creció en un barrio del norte",
		"Se crió en el campo, lejos de todo",
		"Es de una ciudad de montaña",
		"Cambió de casa cada dos años",
		"Nunca ha salido de esta ciudad",
		"Vivió un tiempo en el extranjero",
		"Es del mismo barrio que tú",
	],


	"odia": [
		"No soporta que le hablen de fútbol",
		"No soporta la gente que llega tarde",
		"No soporta las fotos sin avisar",
		"No soporta el ruido de los sitios de moda",
		"No soporta que le mientan por educación",
		"No soporta madrugar",
		"No soporta que le pidan permiso para todo",
		"No soporta el mar",
	],

	"pidio": [
		"Pidió pescado y no se lo acabó",
		"Pidió lo mismo que tú",
		"Pidió sólo postre",
		"Pidió el plato más raro de la carta",
		"No pidió nada, dijo que no tenía hambre",
		"Pidió carne muy hecha",
		"Pidió que eligieras tú",
		"Pidió la sopa del día",
	],
}





static func interes_de(id: String) -> float:
	return float(by_id(id).get("interes", 0.0))





const INTERES_PIDE: float = 0.6




const PIDE_MAX: float = 0.25
const PIDE_MIN: float = 0.12


static func pide_de(id: String) -> float:
	var i: float = interes_de(id)
	if i < INTERES_PIDE:
		return 0.0


	var t: float =(i - INTERES_PIDE) / maxf(0.001, 1.0 - INTERES_PIDE)
	return roundf((PIDE_MIN +(PIDE_MAX - PIDE_MIN) * t) * 100.0) / 100.0












const BODA_TEMPORADAS: int = 2







const BODA_ANOS_PAREJA: int = 5






const BODA_BARRA: int = 60




const BODA_COSTE_FRAC: float = 0.06
const BODA_COSTE_MIN: int = 40000






static func invita_de(id: String) -> float:
	return clampf(float(by_id(id).get("invita", 0.0)), 0.0, 1.0)




const DIVORCIO_MAX: float = 0.5
const DIVORCIO_MIN: float = 0.1




const PRENUP_ESCUDO: float = 0.62



static func divorcio_de(id: String) -> float:


	var p: Dictionary = by_id(id)
	if p.has("divorcio"):
		return float(p["divorcio"])
	var i: float = interes_de(id)
	return DIVORCIO_MIN +(DIVORCIO_MAX - DIVORCIO_MIN) * clampf(i, 0.0, 1.0)















const DIVORCIO_ESPONTANEO: float = 0.35








const FRIO_PASOS: int = 3









static func frio_arranque(id: String) -> int:
	return 1 if interes_de(id) >= INTERES_PIDE else 0



static func divorcio_p(id: String) -> float:
	var i: float = interes_de(id)
	if i < DIVORCIO_ESPONTANEO:
		return 0.0
	return 0.02 + 0.1 * i





static func es_buena(id: String) -> bool:
	return interes_de(id) < INTERES_PIDE and interes_de(id) < DIVORCIO_ESPONTANEO






















const DESCANSO_ALTA: int = 74
const DESCANSO_BAJA: int = 34



const DESCANSO_BONO: float = 6.0
const DESCANSO_CASTIGO: float = 7.0






























static func regalo_de(id: String, barra: int, wage: int) -> int:
	var frac: float = float(by_id(id).get("regalo", 0.0))
	if frac <= 0.0 or wage <= 0:
		return 0
	var t: float = clampf(float(barra - DESCANSO_BAJA)
		/ float(DESCANSO_ALTA - DESCANSO_BAJA), 0.0, 1.0)
	return int(round(float(wage) * frac * t))



static func sitio_de(id: String) -> String:
	var p: Dictionary = by_id(id)
	return String(p.get("sitio", "")) if not p.is_empty() else ""



static func descanso_de(id: String) -> float:
	var p: Dictionary = by_id(id)
	return float(p.get("descanso", 1.0)) if not p.is_empty() else 1.0








static func descanso(id: String, barra: int, suelo: int) -> float:
	if barra >= DESCANSO_ALTA:
		var t: float = float(barra - DESCANSO_ALTA) / float(100 - DESCANSO_ALTA)
		return DESCANSO_BONO * clampf(t, 0.0, 1.0) * descanso_de(id)
	if barra <= DESCANSO_BAJA:
		var u: float = float(DESCANSO_BAJA - barra) / float(maxi(1, DESCANSO_BAJA - suelo))
		return - DESCANSO_CASTIGO * clampf(u, 0.0, 1.0)
	return 0.0

















const POSO_PASO: float = 0.08
const POSO_MAX: float = 0.4



static func poso_mult(poso: float) -> float:
	return 1.0 - clampf(poso, 0.0, POSO_MAX)













const REGALOS: Array = [

	{"txt": "Un fin de semana los dos solos, sin teléfono",
		"rasgos": ["casera", "reservada", "companera", "millonaria"]},
	{"txt": "Una fiesta con toda la gente que quiere",
		"rasgos": ["fiestera", "hincha", "ambiciosa"]},
	{"txt": "Algo que compraste con prisa y sin pensar",
		"rasgos": []},
	{"txt": "Un billete abierto para que se vaya donde quiera",
		"rasgos": ["independiente", "ambiciosa"]},
	{"txt": "Repetir exactamente la primera cena, mesa incluida",
		"rasgos": ["celosa", "casera", "companera", "reservada"]},








	{"txt": "Poner su nombre en algo tuyo: el coche, la casa, la cuenta",
		"rasgos": ["ambiciosa", "cazafortunas", "companera"]},
]






static func cuenta_de(id: String, seed_val: int) -> Dictionary:
	var out: Dictionary = {}
	for t in TEMAS:
		var rng := RandomNumberGenerator.new()
		rng.seed = hash("cuenta|%s|%s|%d" % [id, t, seed_val])
		out[t] = rng.randi() %(DATOS[t] as Array).size()
	return out






static func opciones_de(id: String, tema: String, cierto: int,
		seed_val: int) -> Dictionary:
	var pool: Array = DATOS.get(tema, [])
	if pool.is_empty():
		return {"ops": [], "buena": 0}
	var rng := RandomNumberGenerator.new()
	rng.seed = hash("ops|%s|%s|%d" % [id, tema, seed_val])
	var otros: Array = []
	for i in pool.size():
		if i != cierto:
			otros.append(i)



	for i in range(otros.size() - 1, 0, -1):
		var j: int = rng.randi() %(i + 1)
		var tmp: Variant = otros[i]
		otros[i] = otros[j]
		otros[j] = tmp
	var elegidos: Array = [cierto, otros[0], otros[1]]
	for i in range(2, 0, -1):
		var j2: int = rng.randi() %(i + 1)
		var tmp2: Variant = elegidos[i]
		elegidos[i] = elegidos[j2]
		elegidos[j2] = tmp2
	var ops: Array = []
	var buena: int = 0
	for i in elegidos.size():
		ops.append(String(pool[int(elegidos[i])]))
		if int(elegidos[i]) == cierto:
			buena = i
	return {"ops": ops, "buena": buena}










const FIRST_NAMES: Dictionary = {
	"España": ["Lucía", "Marta", "Carmen", "Elena", "Paula", "Irene", "Noelia", "Alba", "Sara", "Nerea", "Ainhoa", "Claudia"],
	"México": ["Ximena", "Regina", "Itzel", "Mariana", "Daniela", "Fernanda", "Alejandra", "Paola", "Valeria", "Andrea", "Jimena"],
	"Argentina": ["Camila", "Julieta", "Agustina", "Florencia", "Rocío", "Valentina", "Micaela", "Sol", "Martina", "Ailén", "Luciana", "Brisa"],
	"Brasil": ["Beatriz", "Larissa", "Camila", "Juliana", "Rafaela", "Bruna", "Thaís", "Letícia", "Gabriela", "Mariana", "Isadora", "Amanda"],
	"Inglaterra": ["Emily", "Chloe", "Holly", "Megan", "Sophie", "Jade", "Amber", "Leah", "Lucy", "Georgia", "Phoebe", "Ellie"],
	"Escocia": ["Eilidh", "Skye", "Mhairi", "Callie", "Isla", "Ailsa", "Fiona", "Rhona", "Morag", "Kirsty", "Shona", "Elspeth"],
	"Gales": ["Ffion", "Cerys", "Megan", "Siân", "Branwen", "Nia", "Eleri", "Carys", "Seren", "Bethan", "Angharad", "Rhiannon"],
	"Irlanda": ["Saoirse", "Aoife", "Niamh", "Ciara", "Orla", "Sinéad", "Róisín", "Maeve", "Clodagh", "Siobhán", "Eimear", "Gráinne"],
	"Italia": ["Giulia", "Chiara", "Federica", "Martina", "Valentina", "Alessia", "Sara", "Ilaria", "Francesca", "Elisa", "Noemi", "Gaia"],
	"Alemania": ["Lena", "Greta", "Annika", "Svenja", "Johanna", "Mareike", "Nele", "Franziska", "Hannah", "Merle", "Leonie", "Paula"],
	"Austria": ["Theresa", "Magdalena", "Katharina", "Verena", "Elisa", "Sophie", "Anna", "Lisa", "Annika", "Johanna", "Valentina"],
	"Suiza": ["Noémie", "Lara", "Elin", "Selina", "Miriam", "Chiara", "Nina", "Anouk", "Noemi", "Elina", "Janine", "Alina"],
	"Francia": ["Manon", "Camille", "Océane", "Amélie", "Chloé", "Margaux", "Léa", "Solène", "Élodie", "Maëlle", "Louise"],
	"Portugal": ["Inês", "Matilde", "Constança", "Joana", "Rita", "Catarina", "Beatriz", "Margarida", "Mariana", "Leonor", "Carlota"],
	"Países Bajos": ["Sanne", "Femke", "Lotte", "Maaike", "Anouk", "Saar", "Julia", "Evelien", "Ilse", "Merel", "Roos", "Fleur"],
	"Bélgica": ["Eline", "Marie", "Lotte", "Camille", "Nore", "Justine", "Fien", "Amber", "Margot", "Elise", "Julie"],
	"Dinamarca": ["Freja", "Signe", "Astrid", "Ida", "Maja", "Laerke", "Nanna", "Sofie", "Emma", "Josefine", "Camilla", "Mette"],
	"Noruega": ["Ingrid", "Sigrid", "Marte", "Thea", "Solveig", "Maren", "Tuva", "Astrid", "Hanne", "Silje", "Kari", "Linnea"],
	"Suecia": ["Elin", "Saga", "Moa", "Alva", "Maja", "Tilde", "Siri", "Ebba", "Astrid", "Tuva", "Frida", "Nora"],
	"Polonia": ["Zuzanna", "Magda", "Kasia", "Agnieszka", "Weronika", "Ola", "Iwona", "Kinga", "Zofia", "Maja", "Oliwia", "Lena"],
	"Chequia": ["Tereza", "Klára", "Petra", "Markéta", "Veronika", "Lucie", "Eliška", "Anežka", "Kristýna", "Barbora", "Nikola"],
	"Croacia": ["Ivana", "Petra", "Marija", "Lana", "Dora", "Nikolina", "Tena", "Mirjana", "Marta", "Antonia", "Klara"],
	"Rumanía": ["Ioana", "Andreea", "Elena", "Bianca", "Alexandra", "Irina", "Raluca", "Corina", "Diana", "Simona", "Larisa", "Oana"],
	"Bosnia y Herzegovina": ["Amra", "Lejla", "Ajla", "Emina", "Selma", "Amina", "Mirela", "Ivana", "Jelena", "Lamija", "Dženana", "Sara"],
	"Serbia": ["Jelena", "Milica", "Ana", "Tamara", "Ivana", "Sanja", "Tijana", "Dunja", "Sofija", "Nevena", "Katarina"],
	"Balcanes": ["Elena", "Mirjana", "Sanja", "Anja", "Tea", "Lejla", "Maja", "Iva", "Ariana", "Teuta", "Besa"],
	"Grecia": ["Eleni", "Sofia", "Katerina", "Despina", "Ioanna", "Maria", "Anna", "Vaso", "Christina", "Niki", "Areti", "Theodora"],
	"Turquía": ["Elif", "Zeynep", "Merve", "Esra", "Ayşe", "Selin", "Dilara", "Burcu", "Defne", "Ceren", "Gamze"],
	"Ucrania": ["Oksana", "Kateryna", "Iryna", "Olena", "Nataliya", "Yuliya", "Sofiya", "Darya", "Anastasiya", "Mariya", "Viktoriya", "Svitlana"],
	"Estados Unidos": ["Ashley", "Taylor", "Madison", "Brianna", "Kayla", "Sierra", "Haley", "Jordan", "Avery", "Hailey", "Morgan", "Paige"],
	"Colombia": ["Valeria", "Salomé", "Manuela", "Luisa", "Juliana", "Isabella", "Carolina", "Sara", "Luciana", "Isabela", "Daniela", "Mariana"],
	"Chile": ["Javiera", "Catalina", "Antonia", "Montserrat", "Francisca", "Constanza", "Ignacia", "Trinidad", "Fernanda", "Martina", "Valentina", "Josefa"],
	"Uruguay": ["Lucía", "Victoria", "Magdalena", "Sofía", "Pilar", "Agustina", "Delfina", "Manuela", "Malena", "Florencia", "Camila"],
	"Ecuador": ["Doménica", "Ariana", "Gabriela", "Nicole", "Micaela", "Andrea", "Paula", "Samantha", "Nayeli", "Emilia", "Valentina"],
	"Perú": ["Fabiana", "Alessia", "Ariana", "Milagros", "Ximena", "Romina", "Claudia", "Lucero", "Xiomara", "Valeria", "Camila"],
	"Venezuela": ["Andreína", "Genesis", "Yorgelis", "Mariangel", "Dayana", "Oriana", "Nayara", "Scarlet", "Yusmary", "Rosmery", "Keyla"],
	"Paraguay": ["Tania", "Lourdes", "Mariela", "Blanca", "Noelia", "Liliana", "Rossana", "Cynthia", "Larissa", "Belén", "Montserrat"],
	"Bolivia": ["Roxana", "Mariela", "Wara", "Sisa", "Killa", "Daniela", "Gabriela", "Paola", "Carla", "Ximena", "Fabiola"],
	"Japón": ["Yui", "Sakura", "Haruka", "Aoi", "Misaki", "Nanami", "Riko", "Hinata", "Mio", "Akari", "Koharu", "Rin"],
	"Corea": ["Jiwoo", "Seoyeon", "Haeun", "Minseo", "Yejin", "Soyun", "Dahye", "Eunbi", "Yuri", "Sumin", "Chaewon"],
	"Corea del Sur": ["Jiwoo", "Seoyeon", "Haeun", "Minseo", "Yejin", "Soyun", "Dahye", "Eunbi", "Soyeon", "Naeun", "Eunji"],
	"China": ["Mei", "Xiaoyu", "Lingling", "Jiahui", "Yan", "Qian", "Shuang", "Weiwei", "Meiling", "Yanran", "Yueyue", "Fangfang"],
	"Arabia Saudí": ["Noura", "Latifa", "Reem", "Sara", "Amal", "Hanan", "Maha", "Lamia", "Lama", "Hessa", "Jawaher", "Munira"],
	"Egipto": ["Nour", "Mariam", "Salma", "Yasmin", "Dina", "Hala", "Rania", "Aya", "Farida", "Habiba", "Malak"],
	"Marruecos": ["Imane", "Salma", "Khadija", "Najat", "Hanane", "Soukaina", "Meryem", "Laila", "Hajar", "Oumaima", "Asmae", "Fatima"],
	"Túnez": ["Amira", "Sirine", "Mariem", "Yosra", "Rim", "Nesrine", "Emna", "Chaïma", "Olfa", "Rania", "Ons", "Wiem"],



	"Nueva Zelanda": ["Aroha", "Mereana", "Kiri", "Ngaire", "Anahera", "Hana", "Ruby", "Brooke", "Kayla", "Jess", "Grace", "Libby"],
	"Fiyi": ["Litia", "Mere", "Salote", "Losana", "Vasiti", "Sereana", "Kelera", "Unaisi", "Priya", "Shalini", "Anjali", "Sainimere"],
	"Tahití": ["Hinano", "Vaimiti", "Moerani", "Tiare", "Heirani", "Maeva", "Poerava", "Teura", "Vahinerii", "Hina", "Mélanie", "Laetitia"],
	"Nueva Caledonia": ["Eugénie", "Sylvie", "Malia", "Losa", "Falakika", "Kalolaine", "Aurélie", "Stéphanie", "Coralie", "Marion", "Noëlla", "Marie-Josée"],
	"Nigeria": ["Chioma", "Ngozi", "Adaeze", "Funke", "Amara", "Temitope", "Ijeoma", "Yemisi", "Oluwaseun", "Chidinma", "Zainab", "Blessing"],
	"Ghana": ["Akosua", "Ama", "Adwoa", "Afia", "Abena", "Yaa", "Esi", "Nana", "Efua", "Adjoa", "Maame"],
	"Senegal": ["Aïssatou", "Fatou", "Khady", "Ndeye", "Mariama", "Awa", "Sokhna", "Bineta", "Astou", "Seynabou", "Coumba", "Dieynaba"],
	"Costa de Marfil": ["Aya", "Affoué", "Mariam", "Kadidja", "Awa", "Sylvie", "Nadège", "Amenan", "Adjoa", "Akissi", "Fanta"],
	"Camerún": ["Ngo", "Chantal", "Armelle", "Marlyse", "Solange", "Blandine", "Estelle", "Madeleine", "Nadège", "Clarisse", "Mireille", "Sandrine"],
}


static func all() -> Array:
	return PERFILES


static func by_id(id: String) -> Dictionary:
	for p in PERFILES:
		if String(p["id"]) == id:
			return p
	return {}







static func key_of(p) -> String:
	if p is Dictionary:
		return String((p as Dictionary).get("id", ""))
	return String(p)


















































const PENSION_FRAC: float = 0.5
const PENSION_TEMPORADAS: int = 5





static func arruina(id: String) -> bool:
	return bool(by_id(id).get("arruina", false))


















const CAZA_P_BASE: float = 0.012
const CAZA_P_ANIO: float = 0.5
const CAZA_CAIDA: float = 0.85
const CAZA_CAIDA_MULT: float = 3.0
const CAZA_P_MAX: float = 0.25


const CAZA_SANGRIA_MAX: float = 0.4
const CAZA_PAGO_PASO: float = 0.05



























const TITULAR_MADRE: String = "madre"
const TITULAR_ELLA: String = "ella"
const TITULAR_PLAZO_MADRE: float = 1.5
const TITULAR_PLAZO_ELLA: float = 0.45
const TITULAR_DINERO_ELLA: float = 0.5





static func plazo_p(id: String, anios: int, caida: bool, prenup: bool,
		titular: String = "") -> float:
	if not arruina(id):
		return 0.0
	var p: float = CAZA_P_BASE *(1.0 + CAZA_P_ANIO * float(maxi(0, anios)))
	if caida:
		p *= CAZA_CAIDA_MULT
	if prenup:
		p *= 1.0 - PRENUP_ESCUDO
	if titular == TITULAR_MADRE:
		p *= TITULAR_PLAZO_MADRE
	elif titular == TITULAR_ELLA:
		p *= TITULAR_PLAZO_ELLA
	return minf(p, CAZA_P_MAX)





static func caza_compra(id: String, pago: float) -> float:
	var tope: float = CAZA_SANGRIA_MAX - gasto_frac(id)
	var nuevo: float = maxf(pago + CAZA_PAGO_PASO, pide_de(id))
	if nuevo > tope + 0.001:
		return -1.0
	return nuevo

























const PRENUP_BASE: float = 8.0




const PRENUP_RANGO: float = 14.0




static func prenup_golpe(id: String) -> float:
	return PRENUP_BASE + PRENUP_RANGO * interes_de(id)














const OUTFITS: Array[String] = [
	"blusa", "camisa", "cuero", "jersey", "rojo", "sudadera", "traje",
]















const PELOS: Array[int] = [0, 1, 2, 3, 4, 5]


static func ficha_de(id: String, nat: String, seed_val: int,
		usadas: Array = []) -> Dictionary:
	var p: Dictionary = by_id(id)
	if p.is_empty():
		return {}
	var firsts: Array = FIRST_NAMES.get(nat, FIRST_NAMES["España"])
	var ropa: Array = OUTFITS
	var pilas: Dictionary = {}
	var caras: Dictionary = {}
	var ropas: Dictionary = {}
	for u in usadas:
		var d: Dictionary = u as Dictionary
		pilas[String(d.get("pila", ""))] = true
		ropas[String(d.get("outfit", ""))] = true
		caras["%d|%d" % [int(d.get("skin", 0)), int(d.get("hair", 0))]] = true
	var rng := RandomNumberGenerator.new()


	rng.seed = hash("%s|%s|%d" % [id, nat, seed_val])





	var pila: String = ""
	var salto: int = rng.randi() % maxi(1, firsts.size())
	for i in range(firsts.size()):
		var cand: String = String(firsts[(salto + i) % firsts.size()])
		if not pilas.has(cand):
			pila = cand
			break
	if pila.is_empty():
		pila = String(firsts[salto % firsts.size()])



	var outfit: String = ""
	var salto2: int = rng.randi() % ropa.size()
	for i in range(ropa.size()):
		var cand2: String = String(ropa[(salto2 + i) % ropa.size()])
		if not ropas.has(cand2):
			outfit = cand2
			break
	if outfit.is_empty():
		outfit = String(ropa[salto2])










	var np: int = KitRecolor.SKIN_TONES.size()
	var nh: int = PELOS.size()
	var skin: int = rng.randi() % np
	var ih: int = rng.randi() % nh
	var hair: int = PELOS[ih]
	for k in range(np * nh):
		var sk: int =(skin + k) % np
		var ha: int = PELOS[(ih +(k / np)) % nh]


		var vetada: bool = KitRecolor.piel_oscura(KitRecolor.SKIN_TONES[sk]) \
				and KitRecolor.pelo_claro(KitRecolor.HAIR_COLORS[ha])
		if not vetada and not caras.has("%d|%d" % [sk, ha]):
			skin = sk
			hair = ha
			break



	var full: String = Squad.person_name(nat, int(rng.randi()))
	var parts: PackedStringArray = full.strip_edges().split(" ", false)
	var surname: String = String(parts[parts.size() - 1]) if parts.size() > 0 else ""
	return {
		"id": id, "pila": pila, "outfit": outfit, "skin": skin, "hair": hair,
		"nombre": pila if surname.is_empty() else "%s %s" % [pila, surname],
	}



static func nombre_de(id: String, nat: String, seed_val: int,
		usadas: Array = []) -> String:
	return String(ficha_de(id, nat, seed_val, usadas).get("nombre", ""))






static func pool_for(nat: String, seed_val: int, n: int = 3) -> Array:
	var ids: Array = []
	for p in PERFILES:
		ids.append(String(p["id"]))
	var rng := RandomNumberGenerator.new()
	rng.seed = hash("pareja|%s|%d" % [nat, seed_val])


	for i in range(ids.size() - 1, 0, -1):
		var j: int = rng.randi() %(i + 1)
		var tmp = ids[i]
		ids[i] = ids[j]
		ids[j] = tmp




	var dado := RandomNumberGenerator.new()
	dado.seed = hash("sorpresa|%s|%d" % [nat, seed_val])
	if ids.has(SORPRESA_ID) and dado.randf() >= SORPRESA_P:
		ids.erase(SORPRESA_ID)
		ids.append(SORPRESA_ID)
	return ids.slice(0, mini(n, ids.size()))





static func escala(id: String, delta: float) -> float:
	var p: Dictionary = by_id(id)
	if p.is_empty():
		return delta
	if delta < 0.0:
		return delta * float(p.get("celos", 1.0))
	return delta * float(p.get("paga", 1.0))








const GASTO_FRAC: float = 0.05


static func gasto_frac(id: String) -> float:
	var p: Dictionary = by_id(id)
	if p.is_empty():
		return 0.0
	return GASTO_FRAC * maxf(0.0, float(p.get("gasto", 1.0)))




static func gasto_de(id: String, wage: int) -> int:
	if wage <= 0:
		return 0
	return int(round(float(wage) * gasto_frac(id)))









const MUDANZA_BARRA: int = 65


static func mudanza_de(id: String) -> int:
	return int(by_id(id).get("mudanza", MUDANZA_BARRA))













const ARRAIGO_BARRA: int = 60
const ARRAIGO_NUNCA: int = 101
const VIAJE_SI: float = 6.0
const VIAJE_NO: float = -9.0
const DISTANCIA_JORNADA: float = 0.6


const DEDICATORIA: float = 2.0


static func arraigo_de(id: String) -> int:
	return int(by_id(id).get("arraigo", ARRAIGO_BARRA))


static func viene(id: String, barra: int) -> bool:
	return barra >= arraigo_de(id)
















const TENSION_MAX: float = 2.0
const TENSION_CALMA_MIN: int = 78



static func calma_de(id: String) -> int:
	return int(by_id(id).get("calma", 100))


static func exige_de(id: String) -> float:
	return float(by_id(id).get("exige", 0.0))




static func tension(id: String, barra: int) -> float:
	var cal: int = calma_de(id)
	if barra <= cal or cal >= 100:
		return 0.0
	return TENSION_MAX * exige_de(id) * float(barra - cal) / float(100 - cal)










const ENTORNO_BARRAS: Array[String] = ["equipo", "aficion", "prensa"]


static func entorno(id: String, key: String, delta: float) -> float:
	if delta == 0.0 or not ENTORNO_BARRAS.has(key):
		return delta
	var p: Dictionary = by_id(id)
	if p.is_empty():
		return delta
	var tabla: Dictionary = p.get("roce" if delta < 0.0 else "eco", {})
	return delta * float(tabla.get(key, 1.0))









static func rel_de_escena(id: String, e: Dictionary, rels: Dictionary) -> Dictionary:
	if id.is_empty():
		return rels
	var names: Array = e.get("names", [])
	if not names.has("pareja") or names.has("ex"):
		return rels
	var when = e.get("when", [])
	var llaves: Array = when if when is Array else [when]
	for p in PERFILES:
		if llaves.has("pareja_" + String(p["rasgo"])):
			return rels
	var out: Dictionary = rels.duplicate()
	for k in rels:
		out[k] = entorno(id, String(k), float(rels[k]))
	return out









const OUTFIT_GALA: String = "gala"



const ANIM_DIR: String = "res://assets/sprites/anim/"


















static func hoja_de(ficha: Dictionary, gala: bool = false) -> String:
	const RESPALDO: String = "mujer_casual_idle_"
	var nombre: String = OUTFIT_GALA if gala else String(ficha.get("outfit", ""))
	if nombre.is_empty():
		return RESPALDO
	var pre: String = "mujer_look_%s_idle_" % nombre
	if not ResourceLoader.exists(ANIM_DIR + pre + "south_00.png"):
		return RESPALDO
	return pre











static func retrato_cfg(ficha: Dictionary) -> Dictionary:
	if ficha.is_empty():
		return {}


	return KitRecolor.sin_pelirrojo_oscuro({
		"skin": KitRecolor.SKIN_TONES[int(ficha.get("skin", 1))
			% KitRecolor.SKIN_TONES.size()],
		"hair": KitRecolor.HAIR_COLORS[int(ficha.get("hair", 1))
			% KitRecolor.HAIR_COLORS.size()],
	})
