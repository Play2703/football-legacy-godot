class_name MuroRedes
extends RefCounted



























const VERSION: int = 1


const MAX: int = 30



const HINCHA: String = "hincha"

const RIVAL: String = "rival"
const PRENSA: String = "prensa"
const COMPANERO: String = "companero"
const MARCA: String = "marca"

const YO: String = "yo"




const JUGADOR: String = "jugador"





const FAN: String = "fan"


const APLAUSO: String = "aplauso"
const PITADA: String = "pitada"
const FUEGO: String = "fuego"
const RISA: String = "risa"











const HECHOS: Dictionary = {

	"mvp": [
		[PRENSA, FUEGO, "{0}, jugador del partido. Hoy no hay más preguntas."],
		[COMPANERO, APLAUSO, "Qué partido, {0}. Hoy la cena la pagas tú."],
		[HINCHA, FUEGO, "¡Hoy {0} lo ha bordado! Que no se vaya nunca."],
	],


	"titular_crecido": [
		[PRENSA, FUEGO, "{0} se ve en lo más alto. Su frase ya es la portada de la semana."],
		[RIVAL, RISA, "Mucho hablar, {0}. En el campo nos vemos."],
	],

	"titular_zasca": [
		[PRENSA, FUEGO, "{0} contesta a la crítica. Ahora le toca demostrarlo en el campo."],
		[HINCHA, FUEGO, "¡Así se contesta, {0}! Ahora, a callar bocas."],
	],

	"bravata_ok": [
		[HINCHA, FUEGO, "Lo dijo y lo cumplió. {0} es de los nuestros."],
		[COMPANERO, APLAUSO, "Palabra de {0}. Así da gusto."],
	],
	"bravata_ko": [
		[RIVAL, RISA, "¿Y la bravata, {0}? Seguimos esperando."],
		[PRENSA, PITADA, "La frase de {0} le salió cara."],
	],

	"firma": [
		[HINCHA, APLAUSO, "Me firmó la camiseta {0}. Un crack también fuera del campo."],
	],
	"firma_rival": [
		[RIVAL, APLAUSO, "Soy del otro equipo, pero {0} me firmó la camiseta. Respeto."],
	],
	"no_firma": [
		[HINCHA, PITADA, "Una hora esperando y {0} pasó de largo."],
	],

	"camiseta": [
		[HINCHA, FUEGO, "¡Me ha caído la camiseta de {0}! No me la quito en un año."],
	],

	"viral": [
		[HINCHA, RISA, "El balonazo de {0} al móvil lleva todo el día dando vueltas."],
		[MARCA, FUEGO, "Lo de {0} ya es viral. Así se mueven unas redes."],
	],

	"provoco": [
		[RIVAL, PITADA, "Ese festejo de {0} no se olvida. Te esperamos en la vuelta."],
		[PRENSA, PITADA, "Polémica por el festejo de {0}: el comité ya lo mira."],
	],

	"roja": [
		[PRENSA, PITADA, "Roja para {0}, y su equipo con uno menos."],
		[RIVAL, RISA, "A la ducha temprano, {0}."],
	],

	"lesion": [
		[COMPANERO, APLAUSO, "Ánimo, {0}. El vestuario te espera."],
		[HINCHA, APLAUSO, "Recupérate pronto, {0}. Te necesitamos."],
	],

	"fichaje": [
		[HINCHA, APLAUSO, "Bienvenido a {1}, {0}. Aquí se suda la camiseta."],
		[PRENSA, FUEGO, "Es oficial: {0} ya es jugador de {1}."],
	],

	"critica": [
		[PRENSA, PITADA, "Partido para olvidar de {0}. ¿Dónde estuvo?"],
	],
	"zasca_ok": [
		[PRENSA, FUEGO, "{0} calla bocas: después del zasca, partidazo."],
		[HINCHA, FUEGO, "¡Zasca y partidazo! {0} tenía razón."],
	],
	"zasca_ko": [
		[PRENSA, RISA, "Tanto zasca para esto: {0}, otra vez gris."],
		[RIVAL, RISA, "Mucho móvil y poco fútbol, {0}."],
	],

	"post_equipo": [
		[YO, APLAUSO, "Esto es cosa de todos. Orgulloso de este vestuario."],
	],
	"post_yo": [
		[YO, FUEGO, "Trabajo, trabajo y más trabajo. Y esto sólo acaba de empezar."],
	],
	"post_gente": [
		[YO, APLAUSO, "Esto es para vosotros. Sin vuestra voz no somos nada."],
	],









	"pique": [
		[JUGADOR, FUEGO, "el campo es mi casa. A ver si esta vez das la cara."],
	],

	"post_pique": [
		[YO, FUEGO, "Nos vemos en el campo. #ALLÍTEESPERO"],
	],



	"festejo_tecnico": [
		[PRENSA, APLAUSO, "{0} corrió a abrazar a su técnico. Paz en el banquillo."],
		[COMPANERO, APLAUSO, "Ese abrazo de {0} con el míster dice mucho."],
	],
	"festejo_corro": [
		[COMPANERO, FUEGO, "Gol de {0} y todos con él. Este vestuario está unido."],
	],
	"festejo_grada": [
		[HINCHA, FUEGO, "¡{0} vino a celebrarlo con nosotros!"],
	],
	"festejo_perdon": [
		[RIVAL, APLAUSO, "{0} no lo celebró contra nosotros. Respeto."],
		[PRENSA, APLAUSO, "{0} marca a su ex y no lo celebra."],
	],





	"comunicado_perdon": [
		[YO, APLAUSO, "Me equivoqué. Pido perdón al club, al míster y a mis compañeros."],
		[PRENSA, APLAUSO, "{0} pide perdón en un comunicado. El club da el asunto por cerrado."],
	],
	"comunicado_sostiene": [
		[YO, FUEGO, "Dije lo que pienso y no me escondo."],
		[PRENSA, PITADA, "{0} no rectifica: ni una palabra de disculpa."],
	],
	"comunicado_silencio": [
		[PRENSA, PITADA, "Ni comunicado ni disculpa: {0} guarda silencio."],
		[RIVAL, RISA, "¿Y el comunicado, {0}? Seguimos esperando."],
	],



	"rumor_abre": [
		[PRENSA, FUEGO, "{0} no cierra la puerta a {1}. ¿Se va?"],
		[HINCHA, PITADA, "¿{0} coqueteando con {1}? Así no."],
	],
	"rumor_corta": [
		[HINCHA, APLAUSO, "{0} se queda. ¡Eso es compromiso!"],
		[PRENSA, APLAUSO, "{0} corta el rumor de {1}."],
	],

	"gracias_pase": [
		[COMPANERO, APLAUSO, "Gracias a {0} por el pase de hoy."],
	],




	"pena_encuesta": [
		[HINCHA, APLAUSO, "La peña vota el festejo del mes. Gana {2}: ¡lo queremos ver en casa, {0}!"],
	],



	"pena_cumplida": [
		[PRENSA, APLAUSO, "{0} le hace caso a su peña: {2} en casa."],
		[HINCHA, FUEGO, "¡Lo pedimos y {0} lo hizo! {2} delante de la peña."],
	],



	"selfie_3": [
		[FAN, FUEGO, "¡La selfie de mi vida con {0}! Ya es mi foto de perfil."],
	],
	"selfie_2": [
		[FAN, APLAUSO, "Me firmó y encima nos hicimos una selfie. Gracias, {0}."],
	],
	"selfie_1": [
		[FAN, RISA, "Salió movida, pero os juro que es {0}."],
	],


	"revendedor": [
		[HINCHA, APLAUSO, "Pillaron al revendedor que se colaba en la firma de {0}. ¡Bien visto!"],
		[PRENSA, APLAUSO, "A {0} no se la cuelan: seguridad saca a un revendedor de su firma."],
	],

	"reventa": [
		[HINCHA, RISA, "Ya hay firmas de {0} a la venta por 5 €. El de la cola se puso las botas."],
		[MARCA, PITADA, "Nuestra tarde de firmas con {0} ya está en reventa. No era la idea."],
	],

	"echado": [
		[FAN, PITADA, "Esperé toda la tarde para ver a {0} y me sacó seguridad. Sólo quería su firma."],
	],
}



const PIQUE_FINAL: String = "¿te acuerdas de la final? Yo sí. Te espero en el campo."






const RESPUESTAS: Dictionary = {
	"post_equipo": [
		[COMPANERO, APLAUSO, "¡Grande, {0}! Juntos hasta el final."],
		[HINCHA, APLAUSO, "Así se habla. Equipo."],
		[PRENSA, APLAUSO, "{0} reparte el mérito. Gesto de capitán."],
	],
	"post_yo": [
		[HINCHA, FUEGO, "¡Ese es mi jugador!"],
		[RIVAL, RISA, "Menos postureo, {0}."],
		[COMPANERO, PITADA, "El fútbol es de once, {0}."],
	],
	"post_gente": [
		[HINCHA, FUEGO, "¡Te queremos, {0}!"],
		[COMPANERO, APLAUSO, "La grada es nuestro jugador número doce."],
		[PRENSA, APLAUSO, "{0} se gana a la grada otra vez."],
	],


	"post_pique": [
		[HINCHA, FUEGO, "¡Así se habla, capitán!"],
		[RIVAL, RISA, "Mucho hablar..."],
	],
	"comunicado_perdon": [
		[COMPANERO, APLAUSO, "Errores los tenemos todos. A seguir, {0}."],
		[HINCHA, APLAUSO, "Disculpas aceptadas. Ahora, a darlo todo."],
		[RIVAL, RISA, "Mucho perdón ahora, {0}…"],
	],
	"comunicado_sostiene": [
		[HINCHA, FUEGO, "¡Sin miedo, {0}! Con dos."],
		[COMPANERO, PITADA, "Así no ayudas al equipo, {0}."],
		[PRENSA, PITADA, "{0} se planta. El míster toma nota."],
	],
}









const SEGUIDORES_NIVEL: Array[int] = [800, 12000, 150000, 1200000, 9000000]

const SEGUIDORES_TECHO: int = 40000000


const ESCALON_DESDE: Array[int] = [0, 20, 45, 65, 85]





static func elige_autor(muro: Array, hecho: String, season: int, day: int) -> String:
	if not HECHOS.has(hecho):
		return ""
	var usados: Dictionary = {}
	for f in muro:
		if f is Dictionary and int(f.get("season", -1)) == season \
				and int(f.get("day", -1)) == day:
			usados[String(f.get("autor", ""))] = true
	for voz in HECHOS[hecho]:
		if not usados.has(String(voz[0])):
			return String(voz[0])
	return ""















static func fila(season: int, day: int, hecho: String, autor: String, club: String,
		n: int = 0, partido: int = -1, quien: String = "", nombre: String = "",
		otro: String = "", celeb: String = "", foto: String = "") -> Dictionary:
	var f: Dictionary = {
		"season": season, "day": day, "hecho": hecho, "autor": autor,
		"club": club, "n": n, "partido": partido,


		"semilla": hash("%s|%s|%d|%d%s" % [hecho, autor, season, day, foto])&2147483647,
	}

	if not foto.is_empty():
		f["foto"] = foto
	if not quien.is_empty():
		f["quien"] = quien
	if not nombre.is_empty():
		f["nombre"] = nombre

	if not otro.is_empty():
		f["otro"] = otro


	if not celeb.is_empty():
		f["celeb"] = celeb
	return f






static func nombre_fan(semilla: String, ella: bool, pool: String = "España") -> String:
	var tabla: Dictionary = Pareja.FIRST_NAMES if ella else Squad.FIRST_NAMES
	var pilas: Array = tabla.get(pool, tabla["España"])
	var apellidos: Array = Squad.SURNAMES.get(pool, Squad.SURNAMES["España"])
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("fan|" + semilla)
	var pila: String = String(pilas[dado.randi() % pilas.size()])
	var apellido: String = String(apellidos[dado.randi() % apellidos.size()])
	return "%s %s." % [pila, apellido.left(1).to_upper()]




static func empuja(muro: Array, f: Dictionary) -> Array:
	var out: Array = [f]
	out.append_array(muro)
	return out.slice(0, MAX)





static func sanea(v: Variant) -> Array:
	var out: Array = []
	if not v is Array:
		return out
	for f in (v as Array):
		if not f is Dictionary:
			continue
		var hecho: String = String(f.get("hecho", ""))
		var autor: String = String(f.get("autor", ""))
		if _voz(hecho, autor).is_empty():
			continue
		var limpia: Dictionary = {
			"season": int(f.get("season", 0)), "day": int(f.get("day", 0)),
			"hecho": hecho, "autor": autor, "club": String(f.get("club", "")),
			"n": int(f.get("n", 0)), "semilla": int(f.get("semilla", 0)),
			"partido": int(f.get("partido", -1)),
		}


		for k in ["quien", "nombre", "otro", "foto"]:
			if f.get(k) is String and not String(f[k]).is_empty():
				limpia[k] = String(f[k])

		if f.get("celeb") is String and not Celebs.by_id(String(f["celeb"])).is_empty():
			limpia["celeb"] = String(f["celeb"])


		var cara: Variant = f.get("cara")
		if cara is Array and (cara as Array).size() == 2 \
				and (cara[0] is float or cara[0] is int) and (cara[1] is float or cara[1] is int):
			limpia["cara"] = [clampf(float(cara[0]), 0.0, 1.0), clampf(float(cara[1]), 0.0, 1.0)]
		out.append(limpia)
		if out.size() >= MAX:
			break
	return out



static func tono(f: Dictionary) -> String:
	var voz: Array = _voz(String(f.get("hecho", "")), String(f.get("autor", "")))
	return "" if voz.is_empty() else String(voz[1])




static func plantilla(f: Dictionary) -> String:
	var voz: Array = _voz(String(f.get("hecho", "")), String(f.get("autor", "")))




	if not voz.is_empty() and String(f.get("hecho", "")) == "pique" and int(f.get("n", 0)) == 1:
		return PIQUE_FINAL
	return "" if voz.is_empty() else String(voz[2])





static func respuestas(f: Dictionary) -> Array:
	var lista: Array = RESPUESTAS.get(String(f.get("hecho", "")), [])
	if lista.is_empty():
		return []
	var semilla: int = absi(int(f.get("semilla", 0)))
	var cuantas: int = mini(2 + semilla % 2, lista.size())
	var out: Array = []
	for i in cuantas:
		var r: Array = lista[(semilla + i) % lista.size()]
		out.append({"autor": String(r[0]), "tono": String(r[1]), "plantilla": String(r[2])})
	return out






static func seguidores(escalon: int, prensa: int) -> int:
	var e: int = clampi(escalon, 0, SEGUIDORES_NIVEL.size() - 1)
	var bajo: float = float(SEGUIDORES_NIVEL[e])
	var alto: float = float(SEGUIDORES_NIVEL[e + 1]) if e + 1 < SEGUIDORES_NIVEL.size() \
			else float(SEGUIDORES_TECHO)
	return _tres_cifras(bajo * pow(alto / bajo, progreso(e, prensa)))






static func progreso(escalon: int, prensa: int) -> float:
	var e: int = clampi(escalon, 0, ESCALON_DESDE.size() - 1)
	var desde: int = ESCALON_DESDE[e]
	var hasta: int = ESCALON_DESDE[e + 1] if e + 1 < ESCALON_DESDE.size() else 100
	return clampf(float(prensa - desde) / float(maxi(hasta - desde, 1)), 0.0, 1.0)





static func reacciones(seguidores_hoy: int, aficion: int, semilla: int) -> int:
	var tasa: float = 0.01 + 0.03 * clampf(float(aficion) / 100.0, 0.0, 1.0)
	var suerte: float = 0.5 + float(absi(semilla) % 1000) / 1000.0
	return maxi(1, _tres_cifras(float(seguidores_hoy) * tasa * suerte))


static func _voz(hecho: String, autor: String) -> Array:
	for voz in HECHOS.get(hecho, []):
		if String(voz[0]) == autor:
			return voz
	return []


static func _tres_cifras(x: float) -> int:
	if x < 1000.0:
		return int(round(x))
	var paso: float = pow(10.0, floorf(log(x) / log(10.0)) - 2.0)
	return int(round(x / paso) * paso)
