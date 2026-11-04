class_name GolDelAnio
extends RefCounted


const TITULO: String = "Gol del Año"


const NOMBRE: String = "GOL DEL AÑO"



const TIPO_PTS: Dictionary = {
	"chilena": 6.0, "olimpico": 5.5, "volea": 4.0, "panenka": 3.0,
	"bajo_muro": 2.5, "libre": 2.5, "cabeza": 1.5,
}


const TIPO_NOMBRE: Dictionary = {
	"chilena": "CHILENA", "olimpico": "GOL OLÍMPICO", "volea": "VOLEA", "panenka": "PANENKA",
	"bajo_muro": "BAJO LA BARRERA", "libre": "DE FALTA", "cabeza": "DE CABEZA",
	"lejos": "DESDE LEJOS", "rosca": "CON ROSCA", "jugada": "JUGADA",
}


const DIST_DESDE: float = 16.0
const DIST_PTS_M: float = 0.25
const DIST_TOPE: float = 5.0



const ROSCA_MIN: float = 0.5
const ROSCA_PTS_M: float = 0.8
const ROSCA_TOPE: float = 3.0


const FINAL_PTS: float = 2.0
const DERBI_PTS: float = 1.0
const TARDE_PTS: float = 1.0
const TARDE_MIN: int = 85


const MUNDO_MIN: float = 7.0
const MUNDO_MAX: float = 12.5
const MARGEN: float = 1.0
const CANDIDATOS: int = 3


const PUESTOS_MUNDO: Array[String] = ["DC", "CAM", "MCO", "EI", "ED", "SD"]




static func rosca(t: Variant) -> float:
	if not FlightPath.valid(t):
		return 0.0
	var a: Array = t
	var p0: Vector2 = Vector2(float(a[0]), float(a[2]))
	var pm: Vector2 = Vector2(float(a[3]), float(a[5]))
	var p1: Vector2 = Vector2(float(a[6]), float(a[8]))
	var cuerda: Vector2 = p1 - p0
	if cuerda.length() < 0.01:
		return 0.0
	return absf(cuerda.normalized().cross(pm - p0))




static func tipo(g: Dictionary) -> String:
	var mejor: String = ""
	for k in _tipos_de(g):
		if mejor.is_empty() or float(TIPO_PTS[k]) > float(TIPO_PTS[mejor]):
			mejor = k
	if not mejor.is_empty():
		return mejor
	if float(g.get("dist_m", 0.0)) >= DIST_DESDE + 8.0:
		return "lejos"
	if rosca(g.get("t", [])) >= ROSCA_MIN + 1.0:
		return "rosca"
	return "jugada"



static func _tipos_de(g: Dictionary) -> Array[String]:
	var out: Array[String] = []
	var gesto: String = String(g.get("gesto", ""))
	if TIPO_PTS.has(gesto):
		out.append(gesto)
	for k in ["olimpico", "panenka", "bajo_muro"]:
		if bool(g.get(k, false)):
			out.append(k)
	if String(g.get("kind", "")) == "libre":
		out.append("libre")
	return out




static func nota(g: Dictionary, final: bool = false, derbi: bool = false) -> float:
	var n: float = 1.0
	var t: String = tipo(g)
	n += float(TIPO_PTS.get(t, 0.0))
	n += clampf((float(g.get("dist_m", 0.0)) - DIST_DESDE) * DIST_PTS_M, 0.0, DIST_TOPE)
	var r: float = rosca(g.get("t", []))
	if r >= ROSCA_MIN:
		n += minf(r * ROSCA_PTS_M, ROSCA_TOPE)
	if final:
		n += FINAL_PTS
	if derbi:
		n += DERBI_PTS
	if int(g.get("min", 0)) >= TARDE_MIN:
		n += TARDE_PTS
	return snappedf(n, 0.01)





static func candidatos(season: int, censo: Array) -> Array:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("gol-del-anio-%d" % season)
	var out: Array = []
	var tipos: Array = ["chilena", "volea", "lejos", "rosca", "libre", "olimpico"]
	var intentos: int = 0
	while out.size() < CANDIDATOS and not censo.is_empty() and intentos < 40:
		intentos += 1


		var e: Variant = censo[rng.randi_range(0, censo.size() - 1)]
		var club: String = String((e as Dictionary).get("id", "")) if e is Dictionary else str(e)
		var plantel: Array = Squad.of(club)
		var vale: Array = []
		for p in plantel:
			if PUESTOS_MUNDO.has(String((p as Dictionary).get("pos", ""))):
				vale.append(p)
		if vale.is_empty():
			continue
		var ficha: Dictionary = vale[rng.randi_range(0, vale.size() - 1)]
		var nombre: String = String(ficha.get("name", ""))
		if nombre.is_empty() or out.any(func(c): return String(c["name"]) == nombre):
			continue
		out.append({"name": nombre, "club": club,
			"tipo": String(tipos[rng.randi_range(0, tipos.size() - 1)]),
			"nota": snappedf(rng.randf_range(MUNDO_MIN, MUNDO_MAX), 0.01)})
	out.sort_custom(func(a, b): return float(a["nota"]) > float(b["nota"]))
	return out





static func elige(season: int, mio: Dictionary, censo: Array) -> Dictionary:
	var cands: Array = candidatos(season, censo)
	var mejor_mundo: float = float((cands[0] as Dictionary)["nota"]) if not cands.is_empty() \
			else 0.0
	var gana: bool = not mio.is_empty() and float(mio.get("nota", 0.0)) > mejor_mundo + MARGEN
	var winner: Dictionary = {}
	if gana:
		winner = mio.duplicate()
		winner["you"] = true
	elif not cands.is_empty():
		winner =(cands[0] as Dictionary).duplicate()
	return {"season": season, "you_win": gana, "mio": mio, "cands": cands, "winner": winner}
