class_name MatchPlan
extends RefCounted





















enum Style{DEFENSIVO, BALANCEADO, OFENSIVO}
enum Intensity{BAJA, MEDIA, ALTA}




const STYLE_RIVAL_MULT: Dictionary = {
	Style.DEFENSIVO: 0.82, Style.BALANCEADO: 1.0, Style.OFENSIVO: 1.18,
}




const STYLE_TEAM_MULT: Dictionary = {
	Style.DEFENSIVO: 0.9, Style.BALANCEADO: 1.0, Style.OFENSIVO: 1.1,
}

const INT_CHANCE_MULT: Dictionary = {
	Intensity.BAJA: 0.75, Intensity.MEDIA: 1.0, Intensity.ALTA: 1.25,
}













const INT_ENERGY_MULT: Dictionary = {
	Intensity.BAJA: 0.78, Intensity.MEDIA: 1.0, Intensity.ALTA: 1.45,
}



const INT_INJURY_MULT: Dictionary = {
	Intensity.BAJA: 0.8, Intensity.MEDIA: 1.0, Intensity.ALTA: 1.3,
}




const SHALLOW_Z: float = 20.0

const STYLE_LABELS: Array[String] = ["DEFENSIVO", "BALANCEADO", "OFENSIVO"]
const INTENSITY_LABELS: Array[String] = ["BAJA", "MEDIA", "ALTA"]



const STYLE_HINTS: Array[String] = [
	"Aguantas atrás: encajas menos, pero el balón te llega lejos del área.",
	"El equipo juega parejo.",
	"Vas al frente: te llega más cerca del arco, pero atrás quedas expuesto.",
]
const INTENSITY_HINTS: Array[String] = [
	"Dosificas: tocas menos el balón, pero terminas entero.",
	"Ritmo normal.",
	"Buscas cada pelota, pero acabas fundido (y más expuesto a la lesión).",
]







const STYLE_ECHO: Array[String] = [
	"ORDEN DESDE LA BANDA: TODOS ATRÁS, SE DEFIENDE EL RESULTADO",
	"ORDEN DESDE LA BANDA: EQUILIBRIO, NI ATRÁS NI ARRIBA",
	"ORDEN DESDE LA BANDA: TODOS ARRIBA, SE VA A POR EL PARTIDO",
]
const INTENSITY_ECHO: Array[String] = [
	"EL EQUIPO BAJA EL PISTÓN: A ADMINISTRAR PIERNAS",
	"EL EQUIPO VUELVE A SU RITMO NORMAL",
	"EL EQUIPO SUBE EL PISTÓN: A MORDER CADA BALÓN",
]



static func style_rival_mult(style: int) -> float:
	return float(STYLE_RIVAL_MULT.get(style, 1.0))



static func style_team_mult(style: int) -> float:
	return float(STYLE_TEAM_MULT.get(style, 1.0))



static func energy_mult(intensity: int) -> float:
	return float(INT_ENERGY_MULT.get(intensity, 1.0))



static func injury_mult(intensity: int) -> float:
	return float(INT_INJURY_MULT.get(intensity, 1.0))






const MAX_MATCH_CHANCES: int = 10











const MATCHUP_MIN_CHANCES: int = 2
















static func chances_for(base: int, intensity: int,
		cap: int = MAX_MATCH_CHANCES, suelo: int = 1) -> int:
	var mult: float = float(INT_CHANCE_MULT.get(intensity, 1.0))
	var techo: int = clampi(cap, 1, MAX_MATCH_CHANCES)





	return clampi(mini(roundi(float(base) * mult), techo) + Settings.dif_ocasiones_add(),
		suelo, techo)























const FAN_RUIN_HUNDIDO: float = 0.25
const FAN_RUIN_MALA: float = 0.15
const FAN_RUIN_MEJORA: float = 0.12
const FAN_RUIN_LIMPIO: float = 0.04
static func fan_pressure_chance(rel_aficion: int) -> float:

	if rel_aficion < 0 or rel_aficion >= 40:
		return 0.0
	if rel_aficion >= 20:
		var t: float = float(rel_aficion - 20) / 20.0
		return lerpf(FAN_RUIN_MEJORA, FAN_RUIN_LIMPIO, t)
	return lerpf(FAN_RUIN_HUNDIDO, FAN_RUIN_MALA, float(rel_aficion) / 20.0)




















static func puede_evaporar_ocasion(jugadas_reales: int, restantes: int) -> bool:
	return jugadas_reales > 0 or restantes > 0
















const FAN_AIM_BUENA: float = 0.93
const FAN_AIM_EXCELENTE: float = 0.85
static func fan_aim_mult(rel_aficion: int) -> float:
	if rel_aficion >= 80:
		return FAN_AIM_EXCELENTE
	if rel_aficion >= 60:
		return FAN_AIM_BUENA
	return 1.0













const MATCHUP_FLOOR: float = 0.45











const HOME_OPEN: float = 1.05
const AWAY_TIGHT: float = 0.9


static func matchup_factor(edge: int, opp_rating: int, round_key: String,
		is_derby: bool, local: int = 0) -> float:





















	var slope: float = 0.022 if edge > 0 else 0.026
	var f: float = clampf(1.0 + float(edge) * slope, 0.5, 1.45)


	if opp_rating >= 84:
		f *= 0.82

	if round_key == "Final":
		f *= 0.72
	elif round_key == "Semifinal":
		f *= 0.84

	if is_derby:
		f *= 0.9



	if local > 0:
		f *= HOME_OPEN
	elif local < 0:
		f *= AWAY_TIGHT














	return maxf(f, MATCHUP_FLOOR)


static func style_label(style: int) -> String:
	return STYLE_LABELS[style] if style >= 0 and style < STYLE_LABELS.size() else "BALANCEADO"


static func intensity_label(intensity: int) -> String:
	return INTENSITY_LABELS[intensity] if intensity >= 0 \
			and intensity < INTENSITY_LABELS.size() else "MEDIA"


static func style_hint(style: int) -> String:
	return STYLE_HINTS[style] if style >= 0 and style < STYLE_HINTS.size() else STYLE_HINTS[1]


static func intensity_hint(intensity: int) -> String:
	return INTENSITY_HINTS[intensity] if intensity >= 0 \
			and intensity < INTENSITY_HINTS.size() else INTENSITY_HINTS[1]

























const DIETA_VENT_K: float = 1.5
const DIETA_PESO_K: float = 1.5
const DIETA_TECHO_K: float = 1.8

















const DIETA_RONDA_K: float = 2.0

static func dieta_dial(ventaja: float, solemnidad: float) -> float:
	var techo: float = clampf(1.0 - solemnidad * DIETA_TECHO_K, 0.0, 1.0)
	return clampf(ventaja * DIETA_VENT_K - solemnidad * DIETA_PESO_K, -1.0, techo)







const DIETA_BASE: Array[int] = [8, 16, 15, 9, 14, 10]
























const DIETA_PUESTO_BASE: Dictionary = {

	"DC": [11, 12, 15, 10, 14, 10],
	"CAM": [7, 22, 17, 6, 10, 10],
	"EI": [8, 12, 11, 12, 19, 10],
	"ED": [8, 12, 11, 12, 19, 10],
	"MI": [6, 14, 18, 7, 19, 8],
	"MD": [6, 14, 18, 7, 19, 8],
	"MC": [6, 18, 24, 6, 11, 7],
	"MCD": [6, 12, 28, 6, 13, 7],
}




const DIETA_CERCA: Array[int] = [0, 3, 5]
const DIETA_LEJOS: Array[int] = [1, 2, 4]




const DIETA_SLOTS_SPAN: int = 7








const DIETA_SUELOS: Array[int] = [6, 11, 10, 6, 10, 7]



const DIETA_NSS_MIN: int = 24






const DIETA_STYLE_MOVES: Dictionary = {
	Style.OFENSIVO: [[3, 5, 2], [2, 1, 1]],
	Style.DEFENSIVO: [[5, 3, 2], [1, 2, 1]],
}


const DIETA_DENS_P: float = 0.5



static func dieta_base_de(pos: String) -> Array:
	return (DIETA_PUESTO_BASE.get(pos, DIETA_BASE) as Array)




static func _dieta_suelo(base: Array, i: int) -> int:
	return (2 * int(base[i]) + 2) / 3



static func _dieta_cede_ok(anchos: Array, i: int, base: Array = DIETA_BASE) -> bool:
	if int(anchos[i]) - 1 < _dieta_suelo(base, i):
		return false
	if (i == 2 or i == 4) and int(anchos[2]) + int(anchos[4]) - 1 < DIETA_NSS_MIN:
		return false
	return true



































static func dieta_anchos(dial: float, style: int = Style.BALANCEADO, pos: String = "",
		rasgo: Array = []) -> Array:
	var base: Array = dieta_base_de(pos)
	if dial == 0.0 and style == Style.BALANCEADO and rasgo.is_empty():
		return base.duplicate()
	var anchos: Array = base.duplicate()
	var s: int = roundi(clampf(dial, -1.0, 1.0) * float(DIETA_SLOTS_SPAN))
	if s != 0:
		var donantes: Array = DIETA_LEJOS if s > 0 else DIETA_CERCA
		var receptores: Array = DIETA_CERCA if s > 0 else DIETA_LEJOS
		for _i in absi(s):
			var d_idx: int = -1
			var d_ratio: float = -1.0
			for i in donantes:
				var r: float = float(anchos[i]) / float(base[i])
				if _dieta_cede_ok(anchos, int(i), base) and r > d_ratio:
					d_ratio = r
					d_idx = int(i)
			if d_idx < 0:
				break
			var r_idx: int = int(receptores[0])
			var r_ratio: float = INF
			for i in receptores:
				var r2: float = float(anchos[i]) / float(base[i])
				if r2 < r_ratio:
					r_ratio = r2
					r_idx = int(i)
			anchos[d_idx] -= 1
			anchos[r_idx] += 1
	for mv in (DIETA_STYLE_MOVES.get(style, []) as Array) + rasgo:
		for _i in int((mv as Array)[2]):
			if not _dieta_cede_ok(anchos, int((mv as Array)[0]), base):
				break
			anchos[int((mv as Array)[0])] -= 1
			anchos[int((mv as Array)[1])] += 1
	return anchos
