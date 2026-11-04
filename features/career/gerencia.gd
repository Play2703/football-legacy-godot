class_name Gerencia
extends RefCounted

























































const W_TECNICO: int = 35
const W_EQUIPO: int = 25
const W_ANOS: int = 25
const W_AFICION: int = 15





const ANOS_TOPE: float = 5.0





static func partes(ctx: Dictionary) -> Array:
	var anos: float = clampf(float(ctx.get("anos", 0)) / ANOS_TOPE, 0.0, 1.0)
	return [
		{"key": "tecnico", "label": "Técnico", "peso": W_TECNICO,
			"valor": clampi(int(ctx.get("tecnico", 0)), 0, 100)},
		{"key": "equipo", "label": "Vestuario", "peso": W_EQUIPO,
			"valor": clampi(int(ctx.get("equipo", 0)), 0, 100)},






		{"key": "contrato", "label": "Años en el club", "peso": W_ANOS,
			"valor": int(round(anos * 100.0)),
			"muestra": str(int(ctx.get("anos", 0)))},
		{"key": "aficion", "label": "Afición", "peso": W_AFICION,
			"valor": clampi(int(ctx.get("aficion", 0)), 0, 100)},
	]




static func relacion(ctx: Dictionary) -> int:
	var suma: float = 0.0
	for parte in partes(ctx):
		suma += float(parte["valor"]) * float(parte["peso"]) / 100.0
	return clampi(int(round(suma)) + trofeos_bono(ctx.get("trofeos", []))
		+ historia_bono(ctx.get("historia", {})), 0, 100)



















const TROFEO_PUNTOS: Dictionary = {
	"Campeón de Champions": 6,



	"Campeón de Libertadores": 6,
	"Campeón de Concacaf": 6,
	"Campeón de Liga": 5,
	"Campeón de Europa League": 4,
	"Campeón de Sudamericana": 4,



	"Campeón de Copa de Oriente": 5,
	"Campeón de Copa del Atlas": 4,
	"Campeón de Copa del Sol": 3,
	"Campeón de Copa del Baobab": 2,

	"Campeón de Copa del Coral": 2,
	"Campeón de Copa": 3,
	"Campeón de Campeones": 1,
	"Campeón de Supercopa": 1,
	"Campeón de la Copa de la Liga": 2,
	"Campeón de la Recopa": 1,
	"Campeón de la Supercopa de Europa": 1,
	"Campeón de la Supercopa de África": 1,
	"Campeón de la Copa de las Ligas": 2,
	"Campeón Intercontinental": 2,
	"Campeón de Conference": 3,
	"Campeón del Mundo de Clubes": 3,
	"Ascenso": 3,
}



const TROFEOS_TOPE: int = 15




static func trofeos_bono(titulos: Array) -> int:
	var s: int = 0
	for t in titulos:
		s += int(TROFEO_PUNTOS.get(String(t), 0))
	return mini(s, TROFEOS_TOPE)
















const HISTORIA_GOLEADOR: int = 4
const HISTORIA_PARTIDOS: int = 2


const HISTORIA_PUESTO: Array[int] = [0, 3, 2, 2, 1, 1]


const HISTORIA_TOPE: int = 8


static func historia_bono(h: Dictionary) -> int:
	var s: int = 0
	if bool(h.get("goleador", false)):
		s += HISTORIA_GOLEADOR
	if bool(h.get("partidos", false)):
		s += HISTORIA_PARTIDOS
	var puesto: int = int(h.get("puesto", 0))
	if puesto > 0 and puesto < HISTORIA_PUESTO.size():
		s += HISTORIA_PUESTO[puesto]
	return mini(s, HISTORIA_TOPE)







static func ley_club_nuevas(rows: Array, pasadas: Array) -> Array:
	var out: Array = []
	var debajo: bool = false
	for r in rows:
		var row: Dictionary = r
		if bool(row.get("user", false)):
			debajo = true
			continue
		if debajo and not pasadas.has(String(row.get("key", ""))):
			out.append(row)
	return out








static func aportes(ctx: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for parte in partes(ctx):
		out[String(parte["key"])] = float(parte["valor"]) * float(parte["peso"]) / 100.0
	out["trofeos"] = float(trofeos_bono(ctx.get("trofeos", [])))
	out["historia"] = float(historia_bono(ctx.get("historia", {})))
	return out





static func aportes_delta(antes: Dictionary, ahora: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in ahora:
		if not antes.has(k):
			continue
		var d: int = int(round(float(ahora[k]) - float(antes[k])))
		if d != 0:
			out[k] = d
	return out

















































const PELDANO_MAX: int = 6


const PELDANO_VOZ: int = 2


const PELDANO_MESA: int = 3

const PELDANO_CAPITAN: int = 4

const PELDANO_CASA: int = 5


const PELDANO_LEYENDA: int = 6






const PELDANO_UMBRAL: Array[int] = [0, 0, 35, 50, 58, 65, 70]

const PELDANO_BAJA: int = 10



const PELDANO_BAJA_LEYENDA: int = 20



const PELDANO_LEYENDA_PARTIDOS: int = 300


const PELDANO_JUGADOS: float = 0.4




const PELDANO_CAPITAN_TEMPORADAS: int = 4


const PELDANO_NOMBRE: Array[String] = ["", "RECIÉN LLEGADO", "CON VOZ", "DE CONFIANZA",
	"CAPITÁN", "HOMBRE DE LA CASA", "LEYENDA"]






static func peldano_revisa(n: int, relacion: int, puede_capitan: bool,
		puede_leyenda: bool = false) -> int:
	n = clampi(n, 1, PELDANO_MAX)
	if n < PELDANO_MAX and relacion >= PELDANO_UMBRAL[n + 1] \
			and (n + 1 != PELDANO_CAPITAN or puede_capitan) \
			and (n + 1 != PELDANO_LEYENDA or puede_leyenda):
		return n + 1
	if n > 1 and relacion < PELDANO_UMBRAL[n] - peldano_baja(n):
		return n - 1
	return n



static func peldano_baja(n: int) -> int:
	return PELDANO_BAJA_LEYENDA if n >= PELDANO_LEYENDA else PELDANO_BAJA



static func peldano_umbral(n: int) -> int:
	return PELDANO_UMBRAL[n] if n >= 1 and n <= PELDANO_MAX else 0



static func peldano_nombre(n: int) -> String:
	return PELDANO_NOMBRE[clampi(n, 1, PELDANO_MAX)]






const PELDANO_ICONO: Array[String] = ["", "puerta", "prensa", "relaciones", "capitan",
	"corona", "laurel"]


static func peldano_icono(n: int) -> String:
	return PELDANO_ICONO[clampi(n, 1, PELDANO_MAX)]








static func peldano_poderes(n: int) -> Array:
	match n:
		1:
			return [["vision", "VES LA MESA"]]
		2:
			return [["mercado", "PROPONES FICHAJES"]]
		3:
			return [["mercado", "COMPRAS Y VENTAS"], ["candado", "NO LO VENDAIS"],
				["contrato_firma", "QUE LO RENUEVEN"], ["camiseta", "OTRO DORSAL"],
				["contrato", "RENEGOCIAR"]]
		4:
			return [["capitan", "BRAZALETE"]]
		5:
			return [["tecnico", "OTRO TECNICO"], ["despacho", "TU CONTRATO"]]
		6:

			return [["moneda", "PRIMA FIDELIDAD"], ["bufanda", "GRADA FIEL"],
				["estatua", "MAS MARGEN"]]
	return []









const CONTRATO_CASA: float = 0.35







const EN_PAUSA_SI_PEDISTE: Array[String] = ["PROPONES FICHAJES", "COMPRAS Y VENTAS",
	"NO LO VENDAIS", "QUE LO RENUEVEN", "BRAZALETE", "OTRO TECNICO", "PRIMA FIDELIDAD"]


static func poder_en_pausa(clave: String, frenado: String) -> bool:
	return frenado == "pediste" and EN_PAUSA_SI_PEDISTE.has(clave)






static func peldano_tienes(n: int) -> Array:
	var mesa: Array = []
	var resto: Array = []
	for k in range(1, clampi(n, 1, PELDANO_MAX) + 1):
		var ps: Array = peldano_poderes(k)
		if k <= PELDANO_MESA:
			mesa = ps[0]
			ps = ps.slice(1)
		resto.append_array(ps)
	return [mesa] + resto









const DORSAL_P: Array[float] = [0.0, 0.0, 0.0, 0.45, 0.65, 0.85, 0.85]
const DORSAL_VETERANO_EDAD: int = 28
const DORSAL_VETERANO_P: float = 0.05


static func prob_dorsal(peldano: int, edad: int) -> float:
	var p: float = DORSAL_P[clampi(peldano, 0, PELDANO_MAX)]
	p -= DORSAL_VETERANO_P * float(maxi(edad - DORSAL_VETERANO_EDAD, 0))
	return clampf(p, 0.05, 0.95)










const LEYENDA_PRIMA_FICHAS: float = 4.0




const LEYENDA_GRADA: float = 0.5


static func prima_fidelidad(peldano: int, ficha: int) -> int:
	if peldano < PELDANO_LEYENDA:
		return 0
	return roundi(float(maxi(ficha, 0)) * LEYENDA_PRIMA_FICHAS)



static func grada_fiel(delta: float, peldano: int) -> float:
	return delta * LEYENDA_GRADA if delta < 0.0 and peldano >= PELDANO_LEYENDA else delta











const INTERES_MIN: float = 0.5













const OFERTAS_MAX: int = 3
const OFERTA_CADA: int = 1
const OFERTA_BASE: float = 0.86
const OFERTA_ENCAJE: float = 0.14
const OFERTA_RIQUEZA: float = 0.12
const OFERTA_RUIDO: float = 0.08
const OFERTA_PISO: float = 0.8






const PIDE_MAS_MAX: int = 2
const PIDE_MAS_SUBE: Array[float] = [0.6, 0.4]
const PIDE_MAS_FUERA: float = 0.25
const PIDE_MAS_MIN: float = 0.04
const PIDE_MAS_TOP: float = 0.1




static func oferta_mult(encaje: float, riqueza: float, ruido: float) -> float:
	return OFERTA_BASE + OFERTA_ENCAJE * clampf(encaje, 0.0, 1.0) \
			+ OFERTA_RIQUEZA * clampf(riqueza, 0.0, 1.0) + OFERTA_RUIDO * clampf(ruido, -1.0, 1.0)





const PLANTILLA_MIN: int = 18
const PLANTILLA_MAX: int = Squad.SQUAD_SIZE






const MESA_LISTA_MAX: int = 20
const MESA_POR_NIVEL: int = 3
const MESA_EVALUA_NIVEL: int = 8
const MESA_EVALUA_MAX: int = 600





static func interes_techo(once: int) -> int:
	return once + NIVEL_LIBRE + int(floor(NIVEL_SPAN *(1.0 - INTERES_MIN)))





static func interes_piso_margen() -> int:
	return int(floor(PUESTO_SPAN *(1.0 - INTERES_MIN) /(1.0 - PUESTO_MIN)))












const COSTE_RECOMENDACION: int = 55














const P_MIN: float = 0.03


const P_COSTE: float = 0.51
const P_MAX: float = 0.9


const P_SPAN: float = 35.0




static func prob_relacion(relacion: int) -> float:
	var sobra: float = float(relacion) - float(COSTE_RECOMENDACION)
	if sobra >= 0.0:
		return lerpf(P_COSTE, P_MAX, clampf(sobra / P_SPAN, 0.0, 1.0))
	var u: float = clampf(1.0 + sobra / P_SPAN, 0.0, 1.0)
	return P_MIN +(P_COSTE - P_MIN) * u * u







const CAPITAN_BONUS: float = 0.2









const OJO_MIN_PJ: int = 8
const OJO_MARGEN: float = 0.1
const OJO_ACIERTO: int = 3
const OJO_FALLO: int = -2
const OJO_TOPE: int = 6


const TUYOS_MAX: int = 60


const MEJOR_MIN_PJ: int = 20



const LINEA_REL: int = 3









const DT_EXTRA: int = 10


const DT_IGUAL: float = 0.3
const DT_MEJOR_BASE: float = 0.55
const DT_MEJOR_PASO: float = 0.15
















const DT_PALMARES_PASO: float = 0.01
const DT_PALMARES_MIN: float = 0.55
const DT_PALMARES_MAX: float = 1.6
const DT_IDEA_PESO: float = 1.0
const DT_IDEA_MIN: float = 0.5
const DT_IDEA_MAX: float = 1.6

const DT_SENTADO: float = 0.6



const DT_CALMA: float = 0.35
const DT_PRESION_LLENA: float = 0.25

const DT_MAX: float = 0.85

const DT_CAE_P: float = 0.75


const DT_CASTIGO: int = 15
const DT_DEBE: int = 10





const DT_CAPRICHO: int = 10



















const CESE_NIVEL: Dictionary = {3: 0.55, 4: 0.75, 5: 1.0, 6: 1.0}
const CESE_APOYOS: int = 3

const CESE_ESTRELLAS: int = 6
const CESE_VESTUARIO: float = 2.0
const CESE_VESTUARIO_REL: int = 60
const CESE_VESTUARIO_NO: int = 4
const CESE_RACHA: int = 5
const CESE_RACHA_MULT: float = 1.5
const CESE_CASTIGO_RACHA: int = 7
const CESE_REL_MALA: int = 30
const CESE_CHOQUE: float = 1.3

const CESE_MIN_PARTIDOS: int = 5








const VENDE_TOP: int = 5
const VENDE_TOP_EQUIPO: int = 6
const VENDE_TOP_SOCIO: int = 4

const INTOCABLE_SUPLENTE: int = 8

const RENUEVA_VETERANO_EDAD: int = 32
const RENUEVA_VETERANO: int = 6


const CAJA_VACIA_FRAC: float = 0.1
const CAJA_VACIA: int = 6


const LINEA_TUYA: int = 8


const DORSAL_AJENO: int = 4
const DORSAL_DUENO_VETERANO_EDAD: int = 30
const DORSAL_VETERANO: int = 8



const NO_RENUEVO_RACHA_PERF: float = 0.25
const NO_RENUEVO_RACHA: int = 10
const NO_RENUEVO_RACHA_AFICION: int = 4









const INTOCABLE_DEUDA: int = 8






const RENUEVA_MAX: int = 2
const RENUEVA_AFECTO_MAX: float = 0.6





static func afecto_renueva(equipo: int, socio: int) -> float:
	return clampf(float(equipo + socio) / 100.0, 0.0, 1.0) * RENUEVA_AFECTO_MAX



static func relacion_sin_tecnico(ctx: Dictionary) -> int:
	var suma: float = 0.0
	var pesos: float = 0.0
	for parte in partes(ctx):
		if String(parte["key"]) == "tecnico":
			continue
		suma += float(parte["valor"]) * float(parte["peso"])
		pesos += float(parte["peso"])
	return clampi(int(round(suma / pesos)), 0, 100) if pesos > 0.0 else 0







static func prob_pide_dt(relacion: int, mejora: int, sentado: bool, presion: float,
		capitan: bool, palmares: int = 0, encaje: float = 0.0) -> float:
	var p: float = prob_relacion(relacion - DT_EXTRA)
	p *= DT_IGUAL if mejora <= 0 else minf(1.0, DT_MEJOR_BASE + DT_MEJOR_PASO * mejora)
	p *= mult_palmares(palmares) * mult_idea(encaje)
	if sentado:
		p *= DT_SENTADO
	p *= lerpf(DT_CALMA, 1.0, clampf(presion / DT_PRESION_LLENA, 0.0, 1.0))
	if capitan:
		p *= 1.0 + CAPITAN_BONUS
	return clampf(p, P_MIN, DT_MAX)


static func mult_palmares(palmares: int) -> float:
	return clampf(1.0 + DT_PALMARES_PASO * palmares, DT_PALMARES_MIN, DT_PALMARES_MAX)


static func mult_idea(encaje: float) -> float:
	return clampf(1.0 + DT_IDEA_PESO * encaje, DT_IDEA_MIN, DT_IDEA_MAX)






static func prob_pide_cese(relacion: int, rel_tecnico: int, presion: float, capitan: bool,
		peldano: int, apoyos: int, racha: int) -> float:
	var p: float = prob_relacion(relacion - DT_EXTRA)
	p *= lerpf(DT_CALMA, 1.0, clampf(presion / DT_PRESION_LLENA, 0.0, 1.0))
	p *= float(CESE_NIVEL.get(mini(peldano, PELDANO_MAX), 0.0))
	if apoyos >= CESE_APOYOS:
		p *= CESE_VESTUARIO
	if racha >= CESE_RACHA:
		p *= CESE_RACHA_MULT
	if rel_tecnico < CESE_REL_MALA:
		p *= CESE_CHOQUE
	if capitan:
		p *= 1.0 + CAPITAN_BONUS
	return 0.0 if p <= 0.0 else clampf(p, P_MIN, DT_MAX)



static func ojo_veredicto(nota: float, mediana: float, gp: int) -> int:
	if gp < OJO_MIN_PJ or mediana <= 0.0:
		return 0
	if nota >= mediana + OJO_MARGEN:
		return 1
	if nota < mediana - OJO_MARGEN:
		return -1
	return 0



















const NIVEL_LIBRE: int = 4
const NIVEL_SPAN: float = 12.0





static func nivel_factor(gap: int) -> float:
	if gap <= NIVEL_LIBRE:
		return 1.0
	return clampf(1.0 -(float(gap) - float(NIVEL_LIBRE)) / NIVEL_SPAN, 0.0, 1.0)





















const ATRACTIVO_TABLA: Array = [3, 2, 1]


const ATRACTIVO_CORTES: Array = [0.15, 0.35, 0.5]
const ATRACTIVO_COPA_MAYOR: int = 3
const ATRACTIVO_COPA: int = 2

const COPAS_MAYORES: Array = ["champions", "libertadores"]
const ATRACTIVO_TITULO: int = 1
const ATRACTIVO_TITULOS_TOPE: int = 2
const ATRACTIVO_MAX: int = 8


static func atractivo_tabla(puesto: int, equipos: int) -> int:
	if puesto <= 0 or equipos <= 1:
		return 0
	var frac: float = float(puesto) / float(equipos)
	for i in ATRACTIVO_CORTES.size():
		if frac <= float(ATRACTIVO_CORTES[i]):
			return int(ATRACTIVO_TABLA[i])
	return 0



static func atractivo_copa(copa: String) -> int:
	if copa.is_empty():
		return 0
	return ATRACTIVO_COPA_MAYOR if COPAS_MAYORES.has(copa) else ATRACTIVO_COPA



static func atractivo_puntos(puesto: int, equipos: int, copa: String, titulos: int) -> int:
	return mini(atractivo_tabla(puesto, equipos) + atractivo_copa(copa)
		+ ATRACTIVO_TITULO * clampi(titulos, 0, ATRACTIVO_TITULOS_TOPE), ATRACTIVO_MAX)














const FUERZA_INTERES: float = 0.8
const FUERZA_PRIMA: float = 1.25


static func fuerza_precio(traspaso: int, clausula: int) -> int:
	return mini(int(float(traspaso) * FUERZA_PRIMA), clausula)

















const REGATEO_MAX: float = 0.25
const REGATEO_RUIDO: float = 0.05


const REGATEO_SUELO: float = 0.6
const REGATEO_INTENTOS: int = 3

const REGATEO_PASO: float = 0.01



static func regateo_piso_frac(interes: float, ruido: float) -> float:
	var t: float = clampf((interes - INTERES_MIN) /(1.0 - INTERES_MIN), 0.0, 1.0)
	return clampf(1.0 - REGATEO_MAX * t + REGATEO_RUIDO * ruido,
		REGATEO_SUELO + REGATEO_PASO, 1.0)





static func regateo_paso(precio: int) -> int:
	return maxi(1, int(float(precio) * REGATEO_PASO))




static func regateo_piso(precio: int, interes: float, ruido: float, minimo: int = 0) -> int:
	var paso: int = regateo_paso(precio)
	var p: int = ceili(float(precio) * regateo_piso_frac(interes, ruido) / float(paso)) * paso
	return clampi(maxi(p, minimo), 0, precio)




static func regateo_contra(precio: int, piso: int, n: int) -> int:
	var cede: float = 0.5 / float(maxi(1, n))
	var paso: int = regateo_paso(precio)
	return mini(precio, piso + ceili(float(precio - piso) * cede / float(paso)) * paso)














const PUESTO_SPAN: float = 10.0
const PUESTO_MIN: float = 0.4

static func puesto_factor(ventaja: int) -> float:
	if ventaja >= 0:
		return 1.0
	return lerpf(1.0, PUESTO_MIN, clampf(float(- ventaja) / PUESTO_SPAN, 0.0, 1.0))























const EX_REBAJA: float = 0.2
const EX_REBAJA_CASA: float = 0.3
const EX_CASA_TEMPORADAS: int = 3
const EX_AUSENCIA_MIN: int = 1
const EX_PUESTO_MIN: float = 0.7




static func ex_temporadas(vuelta: Dictionary) -> int:
	if vuelta.is_empty() or int(vuelta.get("ausencia", 0)) < EX_AUSENCIA_MIN:
		return 0
	return maxi(int(vuelta.get("temporadas", 0)), 0)



static func ex_rebaja(temporadas: int) -> float:
	if temporadas <= 0:
		return 0.0
	return EX_REBAJA_CASA if temporadas >= EX_CASA_TEMPORADAS else EX_REBAJA



static func ex_puesto(puesto: float, temporadas: int) -> float:
	if temporadas <= 0:
		return puesto
	return clampf(maxf(puesto, EX_PUESTO_MIN), 0.0, 1.0)

























const OJEO_FORASTERO: float = 0.85
const OJEO_CESION_ANOS: int = 4
const OJEO_CESION_LIBRES: int = 1
const OJEO_CESION_PASO: float = 0.88
const OJEO_CESION_MIN: float = 0.75
const OJEO_MIN: float = 0.65




static func ojeo_factor(probado: bool, cesiones: int) -> float:
	var base: float = 1.0 if probado else OJEO_FORASTERO
	var de_mas: int = maxi(cesiones - OJEO_CESION_LIBRES, 0)
	var por_cesiones: float = maxf(OJEO_CESION_MIN, pow(OJEO_CESION_PASO, float(de_mas)))
	return maxf(OJEO_MIN, base * por_cesiones)












static func ojeo_de(etapas: Array, pais_hoy: String, pais_club: String,
		season: int) -> Dictionary:
	var cesiones: int = TransferBook.cesiones_recientes(etapas, season, OJEO_CESION_ANOS)
	if pais_club.is_empty():
		return {"probado": true, "cesiones": cesiones}
	var probado: bool = pais_hoy == pais_club \
			or TransferBook.probado_en_pais(etapas, pais_club)
	return {"probado": probado, "cesiones": cesiones}










const BAJADA_LIBRE: int = 3
const BAJADA_PASO: float = 0.03
const BAJADA_TOPE: float = 1.3

static func bajada_mult(rating_origen: int, rating_destino: int) -> float:
	var d: int = rating_origen - rating_destino
	if d <= BAJADA_LIBRE:
		return 1.0
	return clampf(1.0 + float(d - BAJADA_LIBRE) * BAJADA_PASO, 1.0, BAJADA_TOPE)
