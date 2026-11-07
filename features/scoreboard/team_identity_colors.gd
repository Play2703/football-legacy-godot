class_name TeamIdentityColors
extends RefCounted

## ETAPA 4e.3 — SISTEMA CENTRALIZADO DE IDENTIDADE CROMÁTICA OFICIAL DOS CLUBES
## Mapeia e gerencia as cores oficiais dos clubes para exibição consistente e autêntica no Match HUD,
## independentemente da liga, torneio ou competição disputada.

const PALETAS_OFICIAIS: Dictionary = {
	"rma": {
		"name": "Real Madrid",
		"primary_color": Color("#FFFFFF"),
		"secondary_color": Color("#FEBE10"),
		"accent_color": Color("#00529F"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#FEBE10"),
		"pattern": "solid"
	},
	"bar": {
		"name": "Barcelona",
		"primary_color": Color("#A50044"),
		"secondary_color": Color("#004D98"),
		"accent_color": Color("#EDBB00"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#004D98"),
		"pattern": "stripes_v",
		"colors": [Color("#004D98"), Color("#A50044")]
	},
	"fla": {
		"name": "Flamengo",
		"primary_color": Color("#C8102E"),
		"secondary_color": Color("#111111"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#111111"),
		"pattern": "stripes_h",
		"colors": [Color("#C8102E"), Color("#111111")]
	},
	"palm": {
		"name": "Palmeiras",
		"primary_color": Color("#006437"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#007A33"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"bay": {
		"name": "Bayern Munich",
		"primary_color": Color("#DC052D"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#0066B2"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"dor": {
		"name": "Borussia Dortmund",
		"primary_color": Color("#FDE100"),
		"secondary_color": Color("#111111"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#111111"),
		"pattern": "solid"
	},
	"mci": {
		"name": "Manchester City",
		"primary_color": Color("#6CABDD"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#1C2C5B"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"ars": {
		"name": "Arsenal",
		"primary_color": Color("#EF0107"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#063672"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"liv": {
		"name": "Liverpool",
		"primary_color": Color("#C8102E"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#00B2A9"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"che": {
		"name": "Chelsea",
		"primary_color": Color("#034694"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#DBA111"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"pari": {
		"name": "Paris Saint-Germain",
		"primary_color": Color("#004170"),
		"secondary_color": Color("#DA291C"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#DA291C"),
		"pattern": "solid"
	},
	"mars": {
		"name": "Olympique de Marseille",
		"primary_color": Color("#00AEEF"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#0095C8"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"atm": {
		"name": "Atlético de Madrid",
		"primary_color": Color("#CB3524"),
		"secondary_color": Color("#1B2A55"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "stripes_v",
		"colors": [Color("#CB3524"), Color("#FFFFFF")]
	},
	"ath": {
		"name": "Athletic Club",
		"primary_color": Color("#D11F2D"),
		"secondary_color": Color("#14161A"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "stripes_v",
		"colors": [Color("#D11F2D"), Color("#FFFFFF")]
	},
	"rso": {
		"name": "Real Sociedad",
		"primary_color": Color("#0A3F8C"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "stripes_v",
		"colors": [Color("#0A3F8C"), Color("#FFFFFF")]
	},
	"bet": {
		"name": "Real Betis",
		"primary_color": Color("#008040"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "stripes_v",
		"colors": [Color("#008040"), Color("#FFFFFF")]
	},
	"mil": {
		"name": "Milan",
		"primary_color": Color("#FB090B"),
		"secondary_color": Color("#000000"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#000000"),
		"pattern": "stripes_v",
		"colors": [Color("#FB090B"), Color("#000000")]
	},
	"int": {
		"name": "Inter",
		"primary_color": Color("#001CA8"),
		"secondary_color": Color("#000000"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#000000"),
		"pattern": "stripes_v",
		"colors": [Color("#001CA8"), Color("#000000")]
	},
	"juv": {
		"name": "Juventus",
		"primary_color": Color("#101015"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#C89B3C"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "stripes_v",
		"colors": [Color("#101015"), Color("#FFFFFF")]
	},
	"ben": {
		"name": "Benfica",
		"primary_color": Color("#E11B22"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#000000"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"por": {
		"name": "Porto",
		"primary_color": Color("#003882"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#D29B38"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "stripes_v",
		"colors": [Color("#003882"), Color("#FFFFFF")]
	},
	"spo": {
		"name": "Sporting CP",
		"primary_color": Color("#008050"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#E8B124"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "stripes_h",
		"colors": [Color("#008050"), Color("#FFFFFF")]
	},
	"tot": {
		"name": "Tottenham",
		"primary_color": Color("#FFFFFF"),
		"secondary_color": Color("#132257"),
		"accent_color": Color("#132257"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#132257"),
		"pattern": "solid"
	},
	"utd": {
		"name": "Manchester United",
		"primary_color": Color("#DA291C"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#FFE500"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"cor": {
		"name": "Corinthians",
		"primary_color": Color("#FFFFFF"),
		"secondary_color": Color("#101015"),
		"accent_color": Color("#C8102E"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#101015"),
		"pattern": "solid"
	},
	"sao": {
		"name": "São Paulo",
		"primary_color": Color("#FFFFFF"),
		"secondary_color": Color("#C8102E"),
		"accent_color": Color("#101015"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#C8102E"),
		"pattern": "solid"
	},
	"san": {
		"name": "Santos",
		"primary_color": Color("#FFFFFF"),
		"secondary_color": Color("#101015"),
		"accent_color": Color("#C89B3C"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#101015"),
		"pattern": "solid"
	},
	"grem": {
		"name": "Grêmio",
		"primary_color": Color("#0D80BF"),
		"secondary_color": Color("#101015"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#101015"),
		"pattern": "stripes_v",
		"colors": [Color("#0D80BF"), Color("#101015")]
	},
	"int_rs": {
		"name": "Internacional",
		"primary_color": Color("#E50000"),
		"secondary_color": Color("#FFFFFF"),
		"accent_color": Color("#FFFFFF"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FFFFFF"),
		"pattern": "solid"
	},
	"boca": {
		"name": "Boca Juniors",
		"primary_color": Color("#003087"),
		"secondary_color": Color("#FEDD00"),
		"accent_color": Color("#FEDD00"),
		"text_color": Color("#FFFFFF"),
		"stripe_color": Color("#FEDD00"),
		"pattern": "stripes_h",
		"colors": [Color("#003087"), Color("#FEDD00")]
	},
	"rive": {
		"name": "River Plate",
		"primary_color": Color("#FFFFFF"),
		"secondary_color": Color("#EB1923"),
		"accent_color": Color("#101015"),
		"text_color": Color("#101015"),
		"stripe_color": Color("#EB1923"),
		"pattern": "solid"
	}
}

const ALIASES: Dictionary = {
	"pal": "palm",
	"psg": "pari",
	"om": "mars",
	"bvb": "dor",
	"fcb": "bar",
	"bayern": "bay",
	"dortmund": "dor",
	"city": "mci",
	"arsenal": "ars",
	"river": "rive",
	"sant": "san",
	"cori": "cor"
}

## Cache de identidades adicionadas dinamicamente
static var _dynamic_palettes: Dictionary = {}

## Calcula a luminância relativa sRGB (padrão WCAG 2.1)
static func get_relative_luminance(c: Color) -> float:
	var r_lin: float = c.r / 12.92 if c.r <= 0.04045 else pow((c.r + 0.055) / 1.055, 2.4)
	var g_lin: float = c.g / 12.92 if c.g <= 0.04045 else pow((c.g + 0.055) / 1.055, 2.4)
	var b_lin: float = c.b / 12.92 if c.b <= 0.04045 else pow((c.b + 0.055) / 1.055, 2.4)
	return 0.2126 * r_lin + 0.7152 * g_lin + 0.0722 * b_lin

## Calcula a taxa de contraste exata entre duas cores (WCAG 2.1)
static func get_contrast_ratio(c1: Color, c2: Color) -> float:
	var l1: float = get_relative_luminance(c1)
	var l2: float = get_relative_luminance(c2)
	var lighter: float = maxf(l1, l2)
	var darker: float = minf(l1, l2)
	return (lighter + 0.05) / (darker + 0.05)

## Calcula automaticamente a melhor cor de texto (#101015 ou #FFFFFF) para maximizar o contraste WCAG
static func calculate_contrast_text_color(bg: Color) -> Color:
	var cr_white: float = get_contrast_ratio(Color.WHITE, bg)
	var cr_dark: float = get_contrast_ratio(Color("#101015"), bg)
	if cr_white >= cr_dark:
		return Color.WHITE
	return Color("#101015")

## Retorna a paleta completa de identidade cromática para um determinado team_id.
## Se o clube não constar na lista oficial, extrai com segurança os dados de team_data/Teams.gd,
## garantindo que as cores do torneio/liga NUNCA substituam a identidade do clube.
static func get_team_identity_colors(team_id: String, team_data: Dictionary = {}) -> Dictionary:
	var tid: String = team_id.to_lower().strip_edges()
	if ALIASES.has(tid):
		tid = ALIASES[tid]
	
	# 1. Consulta ao cadastro de paletas oficiais
	if PALETAS_OFICIAIS.has(tid):
		var base: Dictionary = (PALETAS_OFICIAIS[tid] as Dictionary).duplicate()
		base["team_id"] = tid
		if not base.has("colors"):
			base["colors"] = [base["primary_color"]]
		if not base.has("pattern"):
			base["pattern"] = "solid"
		return base
		
	# 2. Consulta ao cache de paletas dinâmicas
	if _dynamic_palettes.has(tid):
		var dyn: Dictionary = (_dynamic_palettes[tid] as Dictionary).duplicate()
		dyn["team_id"] = tid
		if not dyn.has("colors"):
			dyn["colors"] = [dyn["primary_color"]]
		if not dyn.has("pattern"):
			dyn["pattern"] = "solid"
		return dyn

	# 3. Fallback gracioso: extração a partir de team_data ou da base de dados de Teams
	var t: Dictionary = team_data
	if t.is_empty():
		var teams_res = load("res://features/league/teams.gd")
		if teams_res != null and teams_res.has_method("by_id"):
			var by_id = teams_res.call("by_id", tid)
			if by_id is Dictionary:
				t = by_id

	var name_str = String(t.get("name", tid.to_upper()))
	var pri: Color = Color("#1F2430")
	var sec: Color = Color.WHITE
	var acc: Color = Color("#4DF7F7")

	var raw_kit = t.get("kit", null)
	if raw_kit is Color and raw_kit.a > 0.0:
		pri = raw_kit
	elif raw_kit is String and Color.html_is_valid(raw_kit):
		pri = Color(raw_kit)

	var raw_kit2 = t.get("kit2", null)
	if raw_kit2 is Color and raw_kit2.a > 0.0:
		sec = raw_kit2
	elif raw_kit2 is String and Color.html_is_valid(raw_kit2):
		sec = Color(raw_kit2)

	var raw_kitb = t.get("kit_b", null)
	if raw_kitb is Color and raw_kitb.a > 0.0:
		acc = raw_kitb
	elif raw_kitb is String and Color.html_is_valid(raw_kitb):
		acc = Color(raw_kitb)
	else:
		acc = sec

	var raw_pat: String = String(t.get("pattern", "solid")).to_lower()
	var pattern: String = "solid"
	var stripe_col: Color = sec

	if raw_pat in ["stripes", "pinstripes", "band_v", "vstripes", "tri_stripes"]:
		pattern = "stripes_v"
		stripe_col = acc if (acc != pri and acc.a > 0.0) else sec
	elif raw_pat in ["hoops", "band_h"]:
		pattern = "stripes_h"
		stripe_col = acc if (acc != pri and acc.a > 0.0) else sec
	elif raw_pat in ["sash", "sash_r", "diagonal"]:
		pattern = "sash"
		stripe_col = acc if (acc != pri and acc.a > 0.0) else sec
	elif raw_pat in ["half", "halves"]:
		pattern = "half"
		stripe_col = acc if (acc != pri and acc.a > 0.0) else sec
	else:
		pattern = "solid"
		stripe_col = sec

	var colors: Array = [pri]
	if pattern in ["stripes_v", "stripes_h"] and not stripe_col.is_equal_approx(pri):
		colors = [pri, stripe_col]
	else:
		if pattern in ["stripes_v", "stripes_h"]:
			pattern = "solid"

	var txt = calculate_contrast_text_color(pri)

	return {
		"team_id": tid,
		"name": name_str,
		"primary_color": pri,
		"secondary_color": sec,
		"accent_color": acc,
		"text_color": txt,
		"stripe_color": stripe_col,
		"pattern": pattern,
		"colors": colors
	}

## Permite registrar dinamicamente novos clubes na base em tempo de execução
static func register_team_identity(team_id: String, primary: Color, secondary: Color, accent: Color, text_col: Color = Color(0, 0, 0, 0), stripe: Color = Color(0, 0, 0, 0), team_name: String = "", pattern: String = "solid", colors: Array = []) -> void:
	var tid: String = team_id.to_lower().strip_edges()
	var final_txt: Color = text_col if text_col.a > 0.0 else calculate_contrast_text_color(primary)
	var final_stripe: Color = stripe if stripe.a > 0.0 else secondary
	var final_colors: Array = colors if not colors.is_empty() else [primary]
	_dynamic_palettes[tid] = {
		"team_id": tid,
		"name": team_name if not team_name.is_empty() else tid.to_upper(),
		"primary_color": primary,
		"secondary_color": secondary,
		"accent_color": accent,
		"text_color": final_txt,
		"stripe_color": final_stripe,
		"pattern": pattern,
		"colors": final_colors
	}

static func is_team_registered(team_id: String) -> bool:
	var tid: String = team_id.to_lower().strip_edges()
	if ALIASES.has(tid):
		tid = ALIASES[tid]
	return PALETAS_OFICIAIS.has(tid) or _dynamic_palettes.has(tid)

## ETAPA 4e.4 — Retorna a configuração de estilo e padrão geométrico para cabeçalhos e telas de apresentação
static func get_team_header_style(team_id: String, team_data: Dictionary = {}) -> Dictionary:
	var pal: Dictionary = get_team_identity_colors(team_id, team_data)
	var pattern: String = String(pal.get("pattern", "solid"))
	var pri: Color = pal["primary_color"]
	var sec: Color = pal["secondary_color"]
	var colors: Array = pal.get("colors", [pri])
	if colors.is_empty():
		colors = [pri]
	return {
		"colors": colors,
		"pattern": pattern,
		"primary": pri,
		"secondary": sec,
		"accent": pal.get("accent_color", sec),
		"text": pal.get("text_color", Color.WHITE),
		"stripe": pal.get("stripe_color", sec),
		"source": "TeamIdentityColors"
	}

static func get_all_registered_teams() -> Array[String]:
	var arr: Array[String] = []
	for k in PALETAS_OFICIAIS.keys():
		arr.append(String(k))
	return arr
