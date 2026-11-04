class_name Apreton
extends RefCounted

































































































const DUR_PITIDO: float = 1.6
const DUR_TOPE: float = 15.0
const DUR_DESENLACE: float = 1.0



const ARRANQUE_S: float = 0.5


const ESCALADA_T0: float = 6.0
const ESCALADA_K: float = 0.2

const ESPERA_TOPE: float = 8.0







const CAD_MEDIA: int = 3
const CAD_CALAMBRE: float = 0.08
const CAD_PLENA_MIN: float = 0.1
const CAD_PLENA_MAX: float = 0.2
const CAD_LENTA: float = 0.35
const EFF_LENTA: float = 0.4
const EFF_CALAMBRE: float = 0.15

const ARDOR_S: float = 0.4






const R_BASE: float = 2.5
const R_POR_NIVEL: float = 0.33


const MULT_RABIA: float = 1.1
const MULT_SOBRADO: float = 0.9


const K_TOQUE: float = 0.05

const BARRA_MAX: float = 0.4


const TIRON_T1: float = 2.2
const TIRON_T2: float = 3.3
const TIRON_T3: float = 4.4




const TIRON_NIVEL_2: int = 5
const TIRON_NIVEL_3: int = 9
const TIRON_DUR: float = 0.35

const TIRON_AVISO: float = 0.3
const TIRON_RIVAL: float = 2.0
const TIRON_TOQUE: float = 1.5

const TIRON_SEMILLA: float = 0.15


const GANAS: int = 1


const EMPATE: int = 0
const PIERDES: int = -1



const PROB_SALE: float = 0.4





const NIVEL_SELECCION: int = 6







static func procede(mi_club: String, opp: String, comp: String) -> bool:
	if comp == "nat" or mi_club.is_empty() or opp.is_empty() or mi_club == opp:
		return false
	return Rivalries.are_rivals(mi_club, opp)






static func sale(semilla: int) -> bool:
	return (_desvio(semilla, 9) + 1.0) * 0.5 < PROB_SALE





static func nivel_rival(opp: String, comp: String) -> int:
	if comp == "nat":
		return NIVEL_SELECCION
	var n: int = Coaches.nivel_of(opp)
	return Coach.NIV_REF if n <= Coach.NIV_MIN else n





static func semilla_de(season: int, day: int, opp: String) -> int:
	return ("%d|%d|%s" % [season, day, opp]).hash()





static func _desvio(semilla: int, i: int) -> float:
	var h: int =(semilla^(i * 2654435761))&2147483647
	h =(h * 1103515245 + 12345)&2147483647
	h =(h^(h>>13))&2147483647
	return float(h % 20011) / 20010.0 * 2.0 - 1.0










static func rival_de(nivel: int, resultado: int, semilla: int, ex: bool = false) -> Dictionary:
	var n: int = clampi(nivel, Coach.NIV_MIN, Coach.NIV_MAX)
	var mult: float = 1.0
	if resultado > 0 or ex:
		mult = MULT_RABIA
	elif resultado < 0:
		mult = MULT_SOBRADO
	var tirones: Array = [TIRON_T1 + _desvio(semilla, 0) * TIRON_SEMILLA]
	if n >= TIRON_NIVEL_2:
		tirones.append(TIRON_T2 + _desvio(semilla, 1) * TIRON_SEMILLA)
	if n >= TIRON_NIVEL_3:
		tirones.append(TIRON_T3 + _desvio(semilla, 2) * TIRON_SEMILLA)
	return {"R":(R_BASE + R_POR_NIVEL * float(n)) * mult, "tirones": tirones,
		"mult": mult, "nivel": n}




static func fuerza_en(rival: Dictionary, t: float) -> float:
	var f: float = float(rival.get("R", R_BASE)) * clampf(t / ARRANQUE_S, 0.0, 1.0)
	return f *(1.0 + ESCALADA_K * maxf(0.0, t - ESCALADA_T0))



static func tiron_en(rival: Dictionary, t: float) -> int:
	var tirones: Array = rival.get("tirones", [])
	for i in tirones.size():
		var t0: float = float(tirones[i])
		if t >= t0 and t < t0 + TIRON_DUR:
			return i
	return -1




static func aviso_tiron(rival: Dictionary, t: float) -> bool:
	for t0 in rival.get("tirones", []):
		if t >= float(t0) - TIRON_AVISO and t < float(t0):
			return true
	return false






static func eficiencia(dt: float, ardor: float) -> float:
	if dt < 0.0:
		return 1.0
	if ardor > 0.0 or dt < CAD_CALAMBRE:
		return EFF_CALAMBRE
	if dt < CAD_PLENA_MIN:
		return lerpf(EFF_CALAMBRE, 1.0,
			(dt - CAD_CALAMBRE) /(CAD_PLENA_MIN - CAD_CALAMBRE))
	if dt <= CAD_PLENA_MAX:
		return 1.0
	if dt >= CAD_LENTA:
		return EFF_LENTA
	return lerpf(1.0, EFF_LENTA,(dt - CAD_PLENA_MAX) /(CAD_LENTA - CAD_PLENA_MAX))













static func nuevo(rival: Dictionary) -> Dictionary:
	return {"t": 0.0, "barra": 0.0, "ultimo": -1.0, "ardor": 0.0, "toques": 0,
		"eff": 0.0, "calambre": false, "tension": 0.0, "aviso": false, "tiron": -1,
		"escalada": false, "fin": false, "no_jugado": false, "armado": false,
		"espera": 0.0, "dts": [], "rival": rival}















static func paso(estado: Dictionary, delta: float, toques: Array) -> Dictionary:
	var e: Dictionary = estado.duplicate(true)
	if bool(e["fin"]):
		return e
	if not bool(e.get("armado", true)):
		if toques.is_empty():
			e["espera"] = float(e.get("espera", 0.0)) + maxf(delta, 0.0)
			if float(e["espera"]) < ESPERA_TOPE:
				return e
		e["armado"] = true
	var rival: Dictionary = e["rival"]
	var t0: float = float(e["t"])
	var t1: float = t0 + maxf(delta, 0.0)
	var barra: float = float(e["barra"])

	var tm: float =(t0 + t1) * 0.5
	var fuerza: float = fuerza_en(rival, tm)
	if tiron_en(rival, tm) >= 0:
		fuerza *= TIRON_RIVAL
	barra -= fuerza * K_TOQUE *(t1 - t0)

	e["ardor"] = maxf(0.0, float(e["ardor"]) -(t1 - t0))
	for tt in toques:
		var t_toque: float = clampf(float(tt), t0, t1)
		var ultimo: float = float(e["ultimo"])
		var dt: float = t_toque - ultimo if ultimo >= 0.0 else -1.0

		var cad: float = -1.0
		if dt >= 0.0:
			var dts: Array = e.get("dts", [])
			dts.append(dt)
			while dts.size() > CAD_MEDIA:
				dts.pop_front()
			e["dts"] = dts
			var suma: float = 0.0
			for d in dts:
				suma += float(d)
			cad = suma / float(dts.size())
		var eff: float = eficiencia(cad, float(e["ardor"]))
		if cad >= 0.0 and cad < CAD_CALAMBRE:
			e["ardor"] = ARDOR_S
		var mult: float = TIRON_TOQUE if tiron_en(rival, t_toque) >= 0 else 1.0
		barra += eff * mult * K_TOQUE
		e["ultimo"] = t_toque
		e["toques"] = int(e["toques"]) + 1
		e["eff"] = eff
	e["calambre"] = float(e["ardor"]) > 0.0

	e["t"] = t1
	e["barra"] = clampf(barra, - BARRA_MAX, BARRA_MAX)
	e["tiron"] = tiron_en(rival, t1)
	e["aviso"] = aviso_tiron(rival, t1)
	e["escalada"] = t1 >= ESCALADA_T0
	var apretando: float = 1.0 if int(e["toques"]) > 0 else 0.0
	e["tension"] =(1.0 - absf(float(e["barra"])) / BARRA_MAX) * apretando \
			* clampf(t1 / ARRANQUE_S, 0.0, 1.0)


	if absf(float(e["barra"])) >= BARRA_MAX:
		e["fin"] = true
	elif t1 >= DUR_TOPE:
		e["fin"] = true
		e["barra"] = BARRA_MAX if float(e["barra"]) > 0.0 else - BARRA_MAX
	if bool(e["fin"]):
		e["no_jugado"] = int(e["toques"]) == 0
		e["tension"] = 0.0
	return e





static func veredicto(barra: float) -> int:
	if barra >= BARRA_MAX:
		return GANAS
	if barra <= - BARRA_MAX:
		return PIERDES
	return EMPATE






const ROTULOS: Dictionary = {
	"neutral": {
		GANAS: "NO SOLTÓ",
		PIERDES: "SE LA APRETÓ",
	},
	"padrino": {
		GANAS: "ÉSTA VA POR TI",
		PIERDES: "SE LA APRETARON, Y LO SABE",
	},
	"continuista": {
		GANAS: "COMO SIEMPRE: NO SOLTÓ",
		PIERDES: "HOY SE LA APRETARON",
	},
	"exigente": {
		GANAS: "NI UN CENTÍMETRO",
		PIERDES: "SE DEJÓ APRETAR",
	},
	"descarte": {
		GANAS: "NO SOLTÓ, POR UNA VEZ",
		PIERDES: "SE LA APRETÓ. LE DA IGUAL",
	},
}

const ROTULO_PICA: String = "¡PICA RÁPIDO!"
const ROTULO_META: String = "LLEVA LA RAYA HASTA TU LADO"
const ROTULO_RIVAL: String = "RIVAL"




static func rotulo_yo() -> String:
	return CareerUi.you_name()





const ROTULOS_EX: Dictionary = {
	GANAS: "APRETASTE A TU EX TÉCNICO",
	PIERDES: "TU EX TÉCNICO PUEDE CONTIGO",
}





static func rotulo(caracter: String, ver: int, ex: bool = false) -> String:
	if ex:
		return String(ROTULOS_EX.get(ver, ROTULOS_EX[PIERDES]))
	var tabla: Dictionary = ROTULOS.get(caracter, ROTULOS["neutral"])
	return String(tabla.get(ver, tabla[PIERDES]))
