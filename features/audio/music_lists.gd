class_name MusicLists
extends RefCounted























const VUELTAS_POR_TEMA: int = 2








const FAMILIAS: Dictionary = {
	"menu": {




		"": ["menu", "hub_alba", "menu_luces", "hub_lluvia", "menu_gloria", "hub_hierba"],
	},
	"hub": {


		"": ["hub", "hub_alba", "hub_sol", "hub_brisa", "hub_lluvia", "hub_mercado",
			"hub_noche", "hub_hierba"],
		"final": ["hub_final", "hub"],
		"pretemporada": ["hub_brisa", "hub_sol", "hub_hierba", "hub"],
		"bache": ["hub_noche", "hub", "hub_lluvia", "hub_brisa"],
		"racha": ["hub_sol", "hub_mercado", "hub"],
		"mercado": ["hub_mercado", "hub_sol", "hub", "hub_brisa"],
	},
}



const ANIMOS_CON_HIMNOS: Array[String] = ["", "racha", "mercado"]





const HIMNO_DE_PREMIO: Dictionary = {
	"Campeón de Liga": "gloria",
	"Campeón de Copa": "copa",

	"Campeón de Campeones": "gloria",
	"Campeón de Supercopa": "gloria",
	"Campeón de la Copa de la Liga": "gloria",

	"Campeón de la Recopa": "libertadores",
	"Campeón Intercontinental": "mundial",
	"Campeón de la Supercopa de Europa": "champions",
	"Campeón de la Supercopa de África": "champions",

	"Campeón de la Copa de las Ligas": "concacaf",
	"Campeón de Champions": "champions",
	"Campeón de Europa League": "europa",
	"Campeón de Conference": "conference",
	"Campeón del Mundo": "mundial",
	"Campeón de la Finalísima": "mundial",
	"Campeón de la Liga de Naciones": "mundial",
	"Campeón Olímpico": "mundial",
	"Campeón del Mundo de Clubes": "mundial",



	"Campeón de Libertadores": "libertadores",
	"Campeón de Sudamericana": "sudamericana",
	"Campeón de Concacaf": "concacaf",

	"Campeón de Copa de Oriente": "champions",
	"Campeón de Copa del Sol": "europa",

	"Campeón de Copa del Atlas": "champions",
	"Campeón de Copa del Baobab": "europa",

	"Campeón de Copa del Coral": "europa",
}


const RACHA_N: int = 3



static func es_familia(id: String) -> bool:
	return FAMILIAS.has(id)




static func lista(familia: String, animo: String = "", himnos: Array = []) -> Array[String]:
	var out: Array[String] = []
	if not FAMILIAS.has(familia):
		return out
	var por_animo: Dictionary = FAMILIAS[familia]
	var a: String = animo if por_animo.has(animo) else ""
	for id in por_animo[a]:
		out.append(String(id))
	if familia == "hub" and ANIMOS_CON_HIMNOS.has(a):
		for h in himnos:
			if not out.has(String(h)):
				out.append(String(h))
	return out




static func siguiente(l: Array, actual: String) -> String:
	if l.is_empty():
		return ""
	var i: int = l.find(actual)
	if i < 0:
		return String(l[0])
	return String(l[(i + 1) % l.size()])





static func al_azar(l: Array, actual: String, rng: RandomNumberGenerator = null) -> String:
	if l.is_empty():
		return ""
	var otros: Array = l.filter(func(t: Variant) -> bool: return String(t) != actual)
	if otros.is_empty():
		return String(l[0])
	var i: int = rng.randi_range(0, otros.size() - 1) if rng != null else randi() % otros.size()
	return String(otros[i])









static func animo_hub(fixture: Dictionary, forma: Array, pretemporada: bool,
		mercado: bool) -> String:
	if Competitions.stage_of(fixture) == "FINAL":
		return "final"
	if pretemporada:
		return "pretemporada"
	var ult: Array = forma.slice(maxi(forma.size() - RACHA_N, 0))
	if ult.size() >= RACHA_N:
		if not ult.has("G") and ult.count("P") >= 2:
			return "bache"
		if ult.count("G") == RACHA_N:
			return "racha"
	if mercado:
		return "mercado"
	return ""



static func himnos_de(awards: Array) -> Array[String]:
	var out: Array[String] = []
	for a in awards:
		var h: String = String(HIMNO_DE_PREMIO.get(String(a), ""))
		if not h.is_empty() and not out.has(h):
			out.append(h)
	return out





static func nombre(id: String) -> String:
	match id:
		"menu":
			return I18n.t("TEMA DEL JUEGO")
		"menu_luces":
			return I18n.t("LUCES DEL ESTADIO")
		"menu_gloria":
			return I18n.t("CAMINO A LA GLORIA")
		"hub":
			return I18n.t("VESTUARIO")
		"hub_sol":
			return I18n.t("DOMINGO DE SOL")
		"hub_noche":
			return I18n.t("NOCHE LARGA")
		"hub_final":
			return I18n.t("SEMANA DE FINAL")
		"hub_mercado":
			return I18n.t("VENTANA DE FICHAJES")
		"hub_brisa":
			return I18n.t("PRETEMPORADA")
		"hub_alba":
			return I18n.t("CAMPO AL AMANECER")
		"hub_lluvia":
			return I18n.t("LLUVIA SUAVE")
		"hub_hierba":
			return I18n.t("HIERBA FRESCA")
		"gloria":
			return I18n.t("LEVANTAR LA COPA")
		"copa":
			return I18n.t("NOCHE DE COPA")
		"champions":
			return I18n.t("NOCHE DE ESTRELLAS")
		"europa":
			return I18n.t("JUEVES EUROPEO")
		"conference":
			return I18n.t("CAMINO EUROPEO")
		"mundial":
			return I18n.t("MUNDIAL")



		"libertadores":
			return I18n.t("COPA GLORIA")
		"sudamericana":
			return I18n.t("COPA DEL SUR")
		"concacaf":
			return I18n.t("COPA DEL NORTE")
	return ""
