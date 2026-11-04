class_name VeranoUefa
extends RefCounted
























const RONDAS: Array[String] = ["Q1", "Q2", "Q3", "PO"]



const FECHAS: Dictionary = {
	"ucl": {
		"Q1": [[7, 7], [7, 14]],
		"Q2": [[7, 21], [7, 28]],
		"Q3": [[8, 4], [8, 11]],
		"PO": [[8, 18], [8, 25]],
	},
	"eul": {
		"Q1": [[7, 9], [7, 16]],
		"Q2": [[7, 23], [7, 30]],
		"Q3": [[8, 6], [8, 13]],
		"PO": [[8, 20], [8, 27]],
	},
	"conf": {
		"Q1": [[7, 9], [7, 16]],
		"Q2": [[7, 23], [7, 30]],
		"Q3": [[8, 6], [8, 13]],
		"PO": [[8, 20], [8, 27]],
	},
}







const TORNEOS: Dictionary = {
	"mundial": {"inicio": [6, 11], "fases": {"grupos": [6, 27], "r32": [7, 3], "r16": [7, 7],
		"qf": [7, 11], "sf": [7, 15], "final": [7, 19]}},
	"continental": {"inicio": [6, 14], "fases": {"grupos": [6, 26], "r16": [7, 2], "qf": [7, 6],
		"sf": [7, 10], "final": [7, 14]}},
	"olimpicos": {"inicio": [7, 12], "fases": {"grupos": [7, 18], "qf": [7, 21], "sf": [7, 25],
		"final": [7, 29]}},
	"cwc": {"inicio": [6, 14], "fases": {"grupos": [6, 26], "r16": [7, 1], "qf": [7, 5],
		"sf": [7, 9], "final": [7, 13]}},
}




static func _mes(md: Array) -> float:
	return float(md[0]) + float(int(md[1]) - 1) / 31.0




static func mes_decimal(comp: String, ronda: String, leg: int) -> float:
	var r: Array =(FECHAS.get(comp, {}) as Dictionary).get(ronda, [])
	if r.is_empty():
		return -1.0
	return _mes(r[clampi(leg, 0, 1)])



static func es_julio(comp: String, ronda: String, leg: int) -> bool:
	var m: float = mes_decimal(comp, ronda, leg)
	return m >= 7.0 and m < 8.0





static func fraccion(comp: String, ronda: String, leg: int) -> float:
	return (mes_decimal(comp, ronda, leg) - 8.0) / 10.0







static func semana(comp: String, ronda: String, leg: int) -> int:
	var m: float = mes_decimal(comp, ronda, leg)
	if m < 0.0:
		return int(CalendarioMundo.SIN_SEMANA)

	var dia: float = roundf((m - 8.0) * 31.0) + 1.0
	return floori((dia - float(CalendarioMundo.DIA_SEMANA_0)) / 7.0)







static func torneos_del_verano(season: int) -> Array:
	var s: int = season - 1
	var out: Array = []
	if NatTeam.is_wc_season(s):
		out.append("mundial")
	if NatTeam.is_cont_season(s):
		out.append("continental")
	if JuegosOlimpicos.es_temporada(s):
		out.append("olimpicos")
	if GameState.is_cwc_season(s):
		out.append("cwc")
	return out




static func ocupado_hasta(kind: String, fase: String) -> float:
	var fases: Dictionary =(TORNEOS.get(kind, {}) as Dictionary).get("fases", {})
	if not fases.has(fase):
		return -1.0
	return _mes(fases[fase])





static func rondas_sin_jugador(comp: String, kind: String, fase: String) -> Array:
	var fin: float = ocupado_hasta(kind, fase)
	var out: Array = []
	if fin < 0.0:
		return out
	for ronda in RONDAS:
		for leg in 2:
			var m: float = mes_decimal(comp, ronda, leg)
			if m >= 0.0 and m <= fin + 0.001:
				out.append([ronda, leg])
	return out




static func q3_y_po_libres() -> bool:
	var fin: float = 0.0
	for kind in TORNEOS:
		for fase in (TORNEOS[kind]["fases"] as Dictionary):
			fin = maxf(fin, ocupado_hasta(kind, fase))
	for comp in FECHAS:
		for ronda in ["Q3", "PO"]:
			if mes_decimal(comp, ronda, 0) <= fin:
				return false
	return true
