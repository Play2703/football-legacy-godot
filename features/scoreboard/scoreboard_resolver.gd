class_name ScoreboardResolver
extends RefCounted

## ScoreboardResolver: Mapeia competições e contextos de jogo para o layout de transmissão correspondente.
## Utiliza identificadores de features/league/competitions.gd sem modificá-lo.

const ScoreboardTheme = preload("res://features/scoreboard/scoreboard_theme.gd")
const ScoreboardLoader = preload("res://features/scoreboard/scoreboard_loader.gd")

const COMP_TO_LAYOUT_MAP: Dictionary = {
	"champions": "champions_league",
	"ucl": "champions_league",
	"libertadores": "libertadores",
	"lib": "libertadores",
	"Alemania": "bundesliga",
	"liga_de": "bundesliga",
	"bundesliga": "bundesliga",
	"Espana": "la_liga",
	"liga_es": "la_liga",
	"la_liga": "la_liga",
	"Inglaterra": "premier_league",
	"liga_en": "premier_league",
	"premier_league": "premier_league",
	"Italia": "serie_a",
	"liga_it": "serie_a",
	"serie_a": "serie_a",
	"Francia": "ligue_1",
	"liga_fr": "ligue_1",
	"ligue_1": "ligue_1",
	"Brasil": "brasileirao",
	"liga_br": "brasileirao",
	"brasileirao": "brasileirao",
	"brasileirao_serie_a": "brasileirao",
	"copa_br": "copa_do_brasil",
	"copa_do_brasil": "copa_do_brasil"
}

static func resolve_layout_id(comp_tipo: String, pais: String = "") -> String:
	var key = comp_tipo.to_lower().strip_edges()
	if key == "copa" or key == "copaliga":
		if pais.to_lower() == "brasil":
			return "copa_do_brasil"
		return "neutro"
	if COMP_TO_LAYOUT_MAP.has(key):
		return COMP_TO_LAYOUT_MAP[key]
	if COMP_TO_LAYOUT_MAP.has(comp_tipo):
		return COMP_TO_LAYOUT_MAP[comp_tipo]
	if not pais.is_empty() and COMP_TO_LAYOUT_MAP.has(pais):
		return COMP_TO_LAYOUT_MAP[pais]
	return "neutro"

static func get_theme_for_match(comp_tipo: String, pais: String = "", variant: String = "", use_local_tex: bool = true) -> ScoreboardTheme:
	var layout_id = resolve_layout_id(comp_tipo, pais)
	return ScoreboardLoader.load_theme(layout_id, variant, use_local_tex)
