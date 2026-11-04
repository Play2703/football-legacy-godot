class_name Subasta
extends RefCounted

























const SALIDA_K: float = 0.5
const PASO_K: float = 0.08
const REDONDEO: float = 500.0


const VENTANA_S: float = 1.4

const RETRASO_BASE: float = 0.45
const RETRASO_VAR: float = 0.35

const DUDA_DESDE: float = 0.84
const DUDA_EXTRA: float = 1.7



const ROLES: Dictionary = {
	"AFICIONADO": [0.8, 1.0],
	"COLECCIONISTA": [0.95, 1.3],
	"MUSEO": [1.25, 1.7],
}


const SALA: Array = ["AFICIONADO", "AFICIONADO", "COLECCIONISTA", "COLECCIONISTA"]
const SALA_MUSEO: Array = ["AFICIONADO", "COLECCIONISTA", "COLECCIONISTA", "MUSEO"]




static func sello_hoy() -> String:
	return "%d|%d" % [GameState.season_num, GameState.season_day]



static func cerrada(k: Dictionary, sello: String = "") -> bool:
	var s: String = sello if not sello.is_empty() else sello_hoy()
	return String(k.get("subasta", "")) == s


static func _redondea(v: float) -> int:
	return maxi(int(round(v / REDONDEO)) * int(REDONDEO), int(REDONDEO))




static func monta(k: Dictionary, temporada: int, derbi: bool = false,
		sello: String = "") -> Dictionary:
	var tasa: int = Keepsakes.precio_playera(k, temporada, derbi)
	var semilla: int = hash("%s|%s|%s|%d|%s" % [k.get("rival", ""), k.get("who", ""),
		Keepsakes.legend_key_of(k), int(k.get("season", 0)), sello])
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla
	var roles: Array = SALA_MUSEO if Keepsakes.es_pieza_de_museo(k) else SALA
	var postores: Array = []
	var usados: Array = []
	for r in roles:

		var num: int = rng.randi_range(2, 48)
		while usados.has(num):
			num = rng.randi_range(2, 48)
		usados.append(num)
		var rango: Array = ROLES[String(r)]
		var techo: int = _redondea(float(tasa) * rng.randf_range(float(rango[0]), float(rango[1])))
		postores.append({"num": num, "rol": String(r), "techo": techo, "fuera": false})
	return {
		"tasa": tasa,
		"salida": _redondea(float(tasa) * SALIDA_K),
		"paso": _redondea(float(tasa) * PASO_K),
		"semilla": semilla,
		"postores": postores,
	}








static func turno(st: Dictionary, precio: int, lider: int) -> Dictionary:
	var postores: Array = st.get("postores", [])
	var quien: int = -1
	var mejor: float = INF
	var piensan: Array = []
	var caen: Array = []
	for i in postores.size():
		var p: Dictionary = postores[i]
		if bool(p["fuera"]) or i == lider:
			continue
		var techo: int = int(p["techo"])
		if techo < precio:
			p["fuera"] = true
			caen.append(i)
			continue
		var r: float = retraso(st, i, precio)
		if float(precio) / float(techo) > DUDA_DESDE:
			piensan.append(i)
		if r < mejor:
			mejor = r
			quien = i
	return {"quien": quien, "retraso": mejor if quien >= 0 else 0.0,
		"piensan": piensan, "caen": caen}



static func retraso(st: Dictionary, i: int, precio: int) -> float:
	var p: Dictionary =(st.get("postores", []) as Array)[i]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%d|%d|%d" % [int(st.get("semilla", 0)), i, precio])
	var r: float = RETRASO_BASE + rng.randf() * RETRASO_VAR
	var frac: float = float(precio) / float(maxi(int(p["techo"]), 1))
	if frac > DUDA_DESDE:
		r += clampf((frac - DUDA_DESDE) /(1.0 - DUDA_DESDE), 0.0, 1.0) * DUDA_EXTRA
	return r





static func pujas_posibles(st: Dictionary) -> Array:
	var copia: Dictionary = st.duplicate(true)
	var out: Array = []
	var precio: int = int(copia["salida"])
	var lider: int = -1
	for _vuelta in 200:
		var t: Dictionary = turno(copia, precio, lider)
		if int(t["quien"]) < 0:
			break
		lider = int(t["quien"])
		out.append({"precio": precio, "quien": lider})
		precio += int(copia["paso"])
	return out
