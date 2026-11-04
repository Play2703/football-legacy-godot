extends Node
















































signal locale_changed(locale)

















































const LOCALES: PackedStringArray = ["es", "en", "fr", "it", "pt", "pt_PT", "de", "id", "tr", "ar", "ko", "ru"]
const BASE_LOCALE: String = "es"

















const LOCALE_FLAG: Dictionary = {
	"es": "México", "en": "Inglaterra", "pt": "Brasil", "pt_PT": "Portugal", "de": "Alemania",
	"fr": "Francia", "it": "Italia", "id": "idn", "tr": "Turquía", "ar": "Arabia Saudí",
	"ko": "Corea del Sur", "ru": "rus",
}



















const LOCALE_WORD: Dictionary = {
	"es": "Español", "en": "English", "pt": "Português", "pt_PT": "Português", "de": "Deutsch",
	"fr": "Français", "it": "Italiano", "id": "Indonesia", "tr": "Türkçe", "ar": "العربية",
	"ko": "한국어", "ru": "Русский",
}











const RUTAS: Dictionary = {
	"en": "res://assets/i18n/strings_en.gd",
	"pt": "res://assets/i18n/strings_pt.gd",
	"pt_PT": "res://assets/i18n/strings_pt_PT.gd",
	"de": "res://assets/i18n/strings_de.gd",
	"fr": "res://assets/i18n/strings_fr.gd",
	"it": "res://assets/i18n/strings_it.gd",
	"id": "res://assets/i18n/strings_id.gd",
	"tr": "res://assets/i18n/strings_tr.gd",
	"ar": "res://assets/i18n/strings_ar.gd",
	"ko": "res://assets/i18n/strings_ko.gd",
	"ru": "res://assets/i18n/strings_ru.gd",
}




static func tabla(code: String) -> GDScript:
	if not RUTAS.has(code):
		return null
	return load(RUTAS[code]) as GDScript




static func tablas() -> Dictionary:
	var out: Dictionary = {}
	for c in RUTAS:
		var t: GDScript = tabla(c)
		if t != null:
			out[c] = t
	return out



const CTX_SEP: String = ""


const PLURAL_PREFIX: String = "plural"

var locale: String = BASE_LOCALE




var _flat: Dictionary = {}


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS












	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load("user://settings.cfg") == OK:
		var saved: String = String(cfg.get_value("content", "locale", BASE_LOCALE))
		if LOCALES.has(saved):
			locale = saved
	else:



















		locale = idioma_del_sistema(OS.get_locale())
	_flatten(locale)
	_fuente_del_idioma(locale)






const LOCALES_RTL: PackedStringArray = ["ar"]
const FUENTE_JUEGO: String = "res://assets/fonts/PressStart2P-Regular.ttf"
const FUENTE_ARABE: String = "res://assets/fonts/NotoKufiArabic-Bold.ttf"


const FUENTE_COREANA: String = "res://assets/fonts/Galmuri11-Bold.ttf"

const LOCALE_FUENTE: Dictionary = {"ar": FUENTE_ARABE, "ko": FUENTE_COREANA}


var _fuente: FontFile = null
var _fuente_datos: PackedByteArray = PackedByteArray()
var _fuente_latina: FontFile = null













func _fuente_del_idioma(code: String) -> void:
	var propia: bool = LOCALE_FUENTE.has(code)
	if _fuente == null:
		if not propia:
			return
		_fuente = load(FUENTE_JUEGO) as FontFile
		_fuente_datos = _fuente.data








	var datos: PackedByteArray = _fuente_datos
	var respaldos: Array[Font] = []
	if propia:
		if _fuente_latina == null:
			_fuente_latina = _fuente.duplicate() as FontFile
		datos =(load(String(LOCALE_FUENTE[code])) as FontFile).data
		respaldos = [_fuente_latina]
	elif _fuente.fallbacks.is_empty():
		return
	_fuente.set_block_signals(true)
	_fuente.data = datos
	_fuente.clear_cache()
	_fuente.set_block_signals(false)
	_fuente.fallbacks = respaldos












func _rtl_valor(v: Variant) -> Variant:
	if v is Array:
		var out: Array = []
		for x in v:
			out.append(_rtl_valor(x))
		return out
	var s: String = String(v)
	if not _LETRA_RTL.search(s):
		return s
	return "\u200f" + s.replace("\n", "\n\u200f")



static var _LETRA_RTL: RegEx = RegEx.create_from_string("[\\x{0600}-\\x{06FF}\\x{0750}-\\x{077F}\\x{08A0}-\\x{08FF}]")






func fuente_de_palabra(code: String) -> Font:
	if LOCALE_FUENTE.has(code) and code != locale:
		return load(String(LOCALE_FUENTE[code])) as Font
	return null











const ALIAS_SISTEMA: Dictionary = {
	"ca": "es", "gl": "es", "eu": "es", "ast": "es", "an": "es", "gn": "es", "qu": "es",
	"in": "id", "ms": "id",
	"az": "tr",
	"lb": "de", "gsw": "de",
	"ht": "fr", "br": "fr", "co": "fr",
	"be": "ru", "kk": "ru", "ky": "ru", "tg": "ru", "tt": "ru", "ba": "ru",
}




const REGIONES_PT_PT: PackedStringArray = ["PT", "AO", "MZ", "CV", "GW", "ST", "TL", "MO"]







static func idioma_del_sistema(sys: String) -> String:
	if LOCALES.has(sys):
		return sys
	var partes: PackedStringArray = sys.replace("-", "_").split("_")
	var lengua: String = partes[0].to_lower()
	if lengua == "pt":
		for p in partes.slice(1):
			if REGIONES_PT_PT.has(p.to_upper()):
				return "pt_PT"
		return "pt"
	if LOCALES.has(lengua):
		return lengua
	return String(ALIAS_SISTEMA.get(lengua, "en"))






func _flatten(code: String = "") -> void:
	for c in RUTAS:
		if not code.is_empty() and c != code:
			continue
		var t: GDScript = tabla(c)
		if t == null:
			continue
		var flat: Dictionary = {}
		var doms: Dictionary = t.DOMAINS
		var rtl: bool = LOCALES_RTL.has(c)
		for domain in doms:
			for key in doms[domain]:
				flat[key] = _rtl_valor(doms[domain][key]) if rtl else doms[domain][key]
		_flat[c] = flat
		_funde_propias(c)







const Propias = preload("res://features/match/piezas_propias.gd")
var _claves_propias: Dictionary = {}






const RESPALDO: Dictionary = {"pt_PT": "pt"}


func _funde_propias(code: String) -> void:
	var tabla: Dictionary = _flat.get(code, {})
	var puestas: Array = []
	var trad: Dictionary = Propias.i18n(code)
	if trad.is_empty() and RESPALDO.has(code):
		trad = Propias.i18n(String(RESPALDO[code]))
	for k in trad:
		if not tabla.has(k):
			tabla[k] = _rtl_valor(str(trad[k])) if LOCALES_RTL.has(code) else str(trad[k])
			puestas.append(k)
	_claves_propias[code] = puestas






func refunde_piezas_propias() -> void:
	for code in _flat:
		var tabla: Dictionary = _flat[code]
		for k in _claves_propias.get(code, []):
			tabla.erase(k)
		_funde_propias(code)



func _ensure_flat(code: String) -> void:
	if code == BASE_LOCALE or _flat.has(code) or not RUTAS.has(code):
		return
	_flatten(code)












const IMPINTABLES_CAPS: String = "ÁÀÂÄÃÅÉÈÊËÍÌÎÏÓÒÔÖÕØÚÙÛÜÝŸĞİЁ"





var _gritado: Dictionary = {}




















func gritado_seguro(s: String) -> String:
	if s.is_empty():
		return s
	if _gritado.has(s):
		return String(_gritado[s])
	var out: String = _gritado_calcula(s)
	_gritado[s] = out
	return out



func _gritado_calcula(s: String) -> String:
	var sospechoso: bool = false
	for ch in s:
		if IMPINTABLES_CAPS.contains(ch):
			sospechoso = true
			break
	if not sospechoso:
		return s
	var entera: bool = s == s.to_upper()
	var out: String = ""
	var pal: String = ""
	for ch in s:
		if ch.to_upper() != ch.to_lower():
			pal += ch
			continue
		out += _gritado_palabra(pal, entera) + ch
		pal = ""
	return out + _gritado_palabra(pal, entera)




func _gritado_palabra(pal: String, entera: bool) -> String:
	if pal.is_empty():
		return pal
	if not entera and (pal.length() < 2 or pal != pal.to_upper()):
		return pal
	return CareerTheme.deaccent(pal)











func t(src: String, ctx: String = "") -> String:
	if locale == BASE_LOCALE or src.is_empty():
		return gritado_seguro(src)
	var table: Dictionary = _flat.get(locale, {})
	if not ctx.is_empty():
		var keyed: String = ctx + CTX_SEP + src
		if table.has(keyed):
			return gritado_seguro(String(table[keyed]))
	return gritado_seguro(String(table.get(src, src)))








func tf(src: String, args: Array) -> String:
	var out: String = t(src)
	for i in args.size():


		out = out.replace("{%d}" % i, str(args[i]))
	return out









func plural(n: int, one: String, other: String) -> String:
	if locale == BASE_LOCALE:
		return gritado_seguro(one if n == 1 else other)
	var table: Dictionary = _flat.get(locale, {})


	var forms: Variant = table.get(PLURAL_PREFIX + one, null)
	if forms is Array and (forms as Array).size() == 2:
		return String((forms as Array)[0] if n == 1 else (forms as Array)[1])



	if locale == "ru" and forms is Array and (forms as Array).size() == 3:
		var m10: int = absi(n) % 10
		var m100: int = absi(n) % 100
		if m10 == 1 and m100 != 11:
			return String((forms as Array)[0])
		if m10 >= 2 and m10 <= 4 and (m100 < 12 or m100 > 14):
			return String((forms as Array)[1])
		return String((forms as Array)[2])



	if forms is Array and (forms as Array).size() == 3:
		var c: int = absi(n) % 100
		var i: int = 0
		if n == 2:
			i = 1
		elif n == 0 or (c >= 3 and c <= 10):
			i = 2
		return String((forms as Array)[i])


	return t(one) if n == 1 else t(other)



















func ordinal(n: int) -> String:
	match locale:
		"en":

			var c: int = n % 100
			if c >= 11 and c <= 13:
				return "%dth" % n
			match n % 10:
				1: return "%dst" % n
				2: return "%dnd" % n
				3: return "%drd" % n
			return "%dth" % n
		"de", "tr":
			return "%d." % n
		"fr":


			return "1er" if n == 1 else ("%de" % n)
		"id":
			return "ke-%d" % n
		"ar":
			return "الـ%d" % n
		"ko":
			return "%d위" % n
		"ru":
			return "%d-й" % n
		_:
			return "%dº" % n







func ordinal_f(n: int) -> String:
	match locale:
		"es", "pt", "pt_PT", "it":
			return "%dª" % n
		"fr":

			return "1re" if n == 1 else ("%de" % n)
		"ko":


			return "%d부" % n
		"ru":

			return "%d-я" % n
		_:
			return ordinal(n)





func ordinal_vez(n: int) -> String:
	if locale == "ko":
		return "%d번째" % n
	if locale == "ru":
		return "%d-й" % n
	return ordinal_f(n)














const SEPARADORES: Dictionary = {
	"en": [",", "."],
	"ar": [",", "."],
	"ko": [",", "."],
	"fr": [" ", ","],
	"ru": [" ", ","],
}
const SEPARADORES_BASE: Array = [".", ","]








func num(valor: Variant, decimales: int = 0, code: String = "") -> String:
	var sep: Array = SEPARADORES.get(locale if code.is_empty() else code, SEPARADORES_BASE)
	var entero: String
	var frac: String = ""
	if decimales <= 0:


		entero = str(absi(valor if valor is int else roundi(float(valor))))
	else:
		var s: String =("%." + str(decimales) + "f") % absf(float(valor))
		var punto: int = s.find(".")
		entero = s.substr(0, punto)
		frac = s.substr(punto + 1)


	var negativo: bool = float(valor) < 0.0 and (entero + frac).lstrip("0") != ""
	var out: String = ""
	var c: int = 0
	for i in range(entero.length() - 1, -1, -1):
		out = entero[i] + out
		c += 1
		if c % 3 == 0 and i > 0:
			out = String(sep[0]) + out
	if not frac.is_empty():
		out += String(sep[1]) + frac
	return ("-" if negativo else "") + out





func num_signo(valor: Variant, decimales: int = 0, code: String = "") -> String:
	var s: String = num(valor, decimales, code)
	return s if s.begins_with("-") else "+" + s






func set_locale(code: String) -> void:



	var forzado: String = OS.get_environment("FL_LOCALE")
	if forzado != "" and LOCALES.has(forzado):
		code = forzado
	if not LOCALES.has(code) or code == locale:
		return


	_ensure_flat(code)
	locale = code
	_fuente_del_idioma(code)
	locale_changed.emit(code)



func has_key(src: String) -> bool:
	if locale == BASE_LOCALE:
		return true
	return _flat.get(locale, {}).has(src)



func table_of(code: String) -> Dictionary:



	_ensure_flat(code)
	return _flat.get(code, {})
