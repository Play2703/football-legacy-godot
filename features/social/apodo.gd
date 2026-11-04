class_name Apodo
extends RefCounted


































const LARGO_MIN: int = 2
const LARGO_MAX: int = 16







const PINTABLES: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZÑÇŞ0123456789 .-_'"




















const DENTRO: PackedStringArray = [

	"PUTA", "PUTITO", "MIERDA", "CABRON", "PENDEJ", "VERGAZO", "CULERO", "COÑO", "JODER",
	"JODID", "CHINGA", "MARICON", "GILIPOLL", "MAMAVERGA", "CHUPAPIJA", "PANOCHA",
	"CONCHATUMA", "CONCHETUMA", "VIOLADOR", "PEDERAST", "PEDOFIL", "NEGRATA", "MALPARID",
	"HIJUEPUT", "CAGON",

	"FUCK", "SHIT", "BITCH", "CUNT", "NIGGER", "NIGGA", "FAGGOT", "WHORE", "SLUT", "PUSSY",
	"ASSHOLE", "BASTARD", "RETARD", "WANKER", "RAPIST", "PENIS", "VAGINA", "PORN", "DILDO",
	"BOOBS", "TRANNY", "BLOWJOB", "JERKOFF", "PEDOPHIL", "MOLEST",

	"MERDE", "SALOPE", "CONNARD", "CONNASSE", "ENCUL", "COUILLE", "BRANLEU", "BOUGNOUL",
	"PUTAIN", "NIQUETA",

	"CAZZO", "MINCHIA", "FANCUL", "STRONZ", "PUTTAN", "FROCIO", "COGLION", "PORCODIO",
	"DIOCANE", "DIOPORCO",

	"CARALHO", "FODASE", "FODER", "BUCETA", "ARROMBAD", "XOXOTA", "PIROCA", "VIADO",
	"FILHADAPUT", "MERDA",

	"SCHEISS", "FICKEN", "FICKDI", "FOTZE", "ARSCHLOCH", "WICHSER", "SCHLAMPE", "SCHWUCHTEL",
	"NUTTE", "MISSGEBURT", "MISTGEBURT", "HURENSOHN", "KANAKE",

	"BANGSAT", "KONTOL", "MEMEK", "NGENTOT", "BAJINGAN", "JANCOK", "JANCUK", "PEPEK",
	"NGEWE", "PELACUR", "PERECUK",

	"ORUSPU", "OROSPU", "SIKTIR", "AMCIK", "YARRAK", "YARAK", "GAVAT", "KAHPE", "PEZEVENK",
	"SIKERIM", "ANANISIK", "YAVSAK", "AMINAKO",

	"HITLER", "NAZIS", "SIEGHEIL", "WHITEPOWER", "KUKLUX", "HOLOCAUST",


	"JIHADIST", "YIHADIST",

	"KILLYOURSELF", "SUICID", "NUDES", "ONLYFANS",



	"DICK", "COCK", "NAZI",
]






const INOCENTES: PackedStringArray = [
	"DICKSON", "DICKE", "DICKINSON", "DICKIE", "BENEDICK", "COCKER", "COCKBURN", "HANCOCK",
	"PEACOCK", "HITCHCOCK", "ALCOCK", "WILCOCK", "BABCOCK", "LAYCOCK", "COCKPIT", "COCKTAIL",
	"COCKATO", "NAZION", "NAZIM", "NAZIR", "NAZIF", "NAZIH", "NAZIA",
	"NDICKA", "ADDICK", "GLASSCOCK", "IGNAZI", "NAZILLI", "ASHKENAZI", "ANAZI", "JURNAZI",
]




const REDES: PackedStringArray = [
	"INSTAGRAM", "TIKTOK", "WHATSAP", "TELEGRAM", "DISCORD", "SNAPCHAT", "FACEBOOK",
	"TWITTER", "TWITCH", "YOUTUBE", "DOTCOM", "PUNTOCOM",
]
const REDES_SUELTAS: PackedStringArray = [
	"IG", "INSTA", "SNAP", "WSP", "WASAP", "WHATS", "WWW", "HTTP", "HTTPS",
]





const DOMINIOS: PackedStringArray = [
	"COM", "NET", "ORG", "IO", "GG", "TV", "APP", "XYZ", "LINK", "INFO", "BIZ",
]
const DOMINIO_SUELTO: String = "COM"


static var _re_tel: RegEx = null
static var _re_arroba: RegEx = null
static var _re_dominio: RegEx = null
const SUELTA: PackedStringArray = [

	"PUTO", "CULO", "MARICA", "ZORRA", "PERRA", "PITO", "POLLA", "PIJA", "MAMON",
	"SUDACA", "TETAS", "PENE", "VIOLAR", "VERGA",

	"ASS", "TWAT", "RAPE", "SEX", "SEXY", "SEXO", "CUM", "TITS", "SPIC", "KIKE", "KYS", "FAGOT",
	"PAKI", "DYKE", "FAG", "FAGS", "PEDO", "CHINK", "COON", "JIZZ", "HOE",

	"NIQUE", "NTM", "PEDE", "CHATTE", "FDP", "CONNE", "NEGRE",

	"TROIA", "FIGA",

	"CU", "PORRA", "FODA", "PICA", "CORNO",

	"HURE", "NEGER", "SPAST", "FICK", "ARSCH",

	"ANJING", "ASU", "LONTE", "PECUN", "TOLOL",

	"AMK", "SIK", "SIKIM", "PIC", "IBNE", "OC", "AQ",

	"KKK", "HEIL", "SS", "ISIS", "ADMIN", "MODERADOR", "MODERATOR", "SOPORTE", "SUPPORT",
]


const LEET: Dictionary = {"0": "O", "1": "I", "3": "E", "4": "A", "5": "S", "7": "T",
	"8": "B", "@": "A", "$": "S"}




const CTX: String = "apodo"
const NUM_MAX: int = 99

const PIEZAS: Dictionary = {
	"canon": "CAÑÓN", "rayo": "RAYO", "cohete": "COHETE", "tanque": "TANQUE",
	"muro": "MURO", "tornado": "TORNADO", "titan": "TITÁN", "leon": "LEÓN",
	"tiburon": "TIBURÓN", "halcon": "HALCÓN", "lobo": "LOBO", "toro": "TORO",
	"mago": "MAGO", "condor": "CÓNDOR", "trueno": "TRUENO", "volcan": "VOLCÁN",
}

const REMATES: Dictionary = {
	"oro": "DE ORO", "acero": "DE ACERO", "fuego": "DE FUEGO", "hielo": "DE HIELO",
	"sur": "DEL SUR", "norte": "DEL NORTE", "barrio": "DEL BARRIO", "area": "DEL ÁREA",
	"plata": "DE PLATA", "leyenda": "DE LEYENDA", "imparable": "IMPARABLE", "veloz": "VELOZ",
	"letal": "LETAL", "salvaje": "SALVAJE", "sin_freno": "SIN FRENO", "medianoche": "DE MEDIANOCHE",
}



static func partes(id: Variant) -> Array:
	if not id is String or String(id).length() > 40:
		return []
	var p: PackedStringArray = String(id).split(".")
	if p.size() != 3 or not PIEZAS.has(p[0]) or not REMATES.has(p[1]) or not p[2].is_valid_int():
		return []
	var n: int = p[2].to_int()
	if n < 1 or n > NUM_MAX or str(n) != p[2]:
		return []
	return [p[0], p[1], n]



static func compacta(s: String) -> String:
	var t: String = s.strip_edges()
	while t.contains("  "):
		t = t.replace("  ", " ")
	return t




static func error(s: String) -> String:
	var t: String = compacta(s)
	if t.length() > LARGO_MAX:
		return "MÁXIMO 16 LETRAS"
	for ch in t:
		for c in CareerTheme.caps(ch):
			if not PINTABLES.contains(c):
				return "SÓLO LETRAS Y NÚMEROS"

	if _sin_signos(CareerTheme.caps(t)).length() < LARGO_MIN:
		return "MÍNIMO 2 LETRAS"
	if es_ofensivo(t):
		return "ESE NOMBRE NO SE PUEDE USAR"
	return ""





static func limpia(v: Variant) -> String:
	if not v is String:
		return ""
	if not partes(v).is_empty():
		return String(v)
	var t: String = compacta(String(v))
	return t if error(t) == "" else ""



static func texto(v: Variant) -> String:
	var p: Array = partes(v)
	if not p.is_empty():
		return I18n.t("{0} {1} {2}", CTX).replace("{0}", I18n.t(String(PIEZAS[p[0]]), CTX)) \
				.replace("{1}", I18n.t(String(REMATES[p[1]]), CTX)).replace("{2}", str(p[2]))
	return CareerTheme.caps(limpia(v))




static func apellido(v: Variant) -> String:
	var p: Array = partes(v)
	return I18n.t(String(PIEZAS[p[0]]), CTX) if not p.is_empty() else texto(v)




static func o_codigo(id: Variant, code: String) -> String:
	var t: String = texto(id)
	return t if t != "" else "#" + code












static func nombre_ajeno(v: Variant, code: String = "", tope: int = 40) -> String:
	var t: String =(str(v) if v != null else "").left(tope)
	if not es_ofensivo(t):
		return t
	return "#" + code if code != "" else ""





static func es_ofensivo(s: String) -> bool:


	var base: String = CareerTheme.deaccent(CareerTheme.caps(s))

	if _sin_signos(base).contains("1488"):
		return true
	if es_contacto(s):
		return true
	var leet: String = ""
	for ch in base:
		leet += String(LEET.get(ch, ch))
	var junto: String = _sin_signos(leet)
	var dos: String = _tacha_inocentes(_rachas(junto, 2))
	var una: String = _tacha_inocentes(_rachas(junto, 1))
	for w in DENTRO + REDES:
		if _tiene_doble(w):
			if dos.contains(w):
				return true
		elif una.contains(w):
			return true


	var trozos: Array = [junto]
	var trozo: String = ""
	for ch in leet + " ":
		if PINTABLES.contains(ch) and not " .-_'".contains(ch):
			trozo += ch
		elif trozo != "":
			trozos.append(trozo)
			trozo = ""
	for t in trozos:
		var t2: String = _rachas(t, 2)
		var t1: String = _rachas(t, 1)
		for w in SUELTA + REDES_SUELTAS:


			if t2 == w or (t1 == _rachas(w, 1) and t.length() >= w.length()):
				return true
	return false












static func es_contacto(s: String) -> bool:
	if _re_tel == null:
		_re_tel = RegEx.create_from_string("[0-9](?:[ .\\-_/]*[0-9]){5,}")
		_re_arroba = RegEx.create_from_string("@\\s*[A-Z0-9_]")
		_re_dominio = RegEx.create_from_string(
			"[A-Z0-9](?:\\.(?:" + "|".join(DOMINIOS) + ")|\\s*\\.\\s*" + DOMINIO_SUELTO
			+ ")(?![A-Z0-9])")
	var base: String = CareerTheme.deaccent(CareerTheme.caps(s))
	if _re_tel.search(base) != null or _re_arroba.search(base) != null:
		return true
	var junto: String = _sin_signos(base)
	if junto.contains("WWW") or junto.contains("HTTP"):
		return true
	return _re_dominio.search(base) != null





static func _tacha_inocentes(s: String) -> String:
	var out: String = s
	for w in INOCENTES:
		out = out.replace(w, "|").replace(_rachas(w, 1), "|")
	return out


static func _sin_signos(s: String) -> String:
	var out: String = ""
	for ch in s:
		if not " .-_'".contains(ch):
			out += ch
	return out



static func _rachas(s: String, tope: int) -> String:
	var out: String = ""
	var racha: int = 0
	for i in s.length():
		racha = racha + 1 if i > 0 and s[i] == s[i - 1] else 1
		if racha <= tope:
			out += s[i]
	return out


static func _tiene_doble(w: String) -> bool:
	for i in range(1, w.length()):
		if w[i] == w[i - 1]:
			return true
	return false
