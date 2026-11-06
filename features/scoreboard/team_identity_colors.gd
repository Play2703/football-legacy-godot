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
	"arsenal": "ars"
}

## Cache de identidades adicionadas dinamicamente
static var _dynamic_palettes: Dictionary = {}

## Calcula automaticamente a cor do texto com base na luminância WCAG:
## Fundo claro (L > 0.50): texto escuro (#101015).
## Fundo escuro (L <= 0.50): texto branco (#FFFFFF).
static func calculate_contrast_text_color(bg: Color) -> Color:
	if bg.get_luminance() > 0.50:
		return Color("#101015")
	return Color("#FFFFFF")

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
		return base
		
	# 2. Consulta ao cache de paletas dinâmicas
	if _dynamic_palettes.has(tid):
		var dyn: Dictionary = (_dynamic_palettes[tid] as Dictionary).duplicate()
		dyn["team_id"] = tid
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

	var txt = calculate_contrast_text_color(pri)

	return {
		"team_id": tid,
		"name": name_str,
		"primary_color": pri,
		"secondary_color": sec,
		"accent_color": acc,
		"text_color": txt,
		"stripe_color": sec
	}

## Permite registrar dinamicamente novos clubes na base em tempo de execução
static func register_team_identity(team_id: String, primary: Color, secondary: Color, accent: Color, text_col: Color = Color(0, 0, 0, 0), stripe: Color = Color(0, 0, 0, 0), team_name: String = "") -> void:
	var tid: String = team_id.to_lower().strip_edges()
	var final_txt: Color = text_col if text_col.a > 0.0 else calculate_contrast_text_color(primary)
	var final_stripe: Color = stripe if stripe.a > 0.0 else secondary
	_dynamic_palettes[tid] = {
		"team_id": tid,
		"name": team_name if not team_name.is_empty() else tid.to_upper(),
		"primary_color": primary,
		"secondary_color": secondary,
		"accent_color": accent,
		"text_color": final_txt,
		"stripe_color": final_stripe
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
		"source": "TeamIdentityColors"
	}

static func get_all_registered_teams() -> Array[String]:
	var arr: Array[String] = []
	for k in PALETAS_OFICIAIS.keys():
		arr.append(String(k))
	return arr
