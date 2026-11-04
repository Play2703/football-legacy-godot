class_name Dardos








































const SECTORES: Array = [20, 1, 18, 4, 13, 6, 10, 15, 2, 17,
	3, 19, 7, 16, 8, 11, 14, 9, 12, 5]







const DOBLE_DE: float = 0.953
const TRIPLE_DE: float = 0.582
const TRIPLE_A: float = 0.629
const BULL_FUERA: float = 0.0935
const BULL_DENTRO: float = 0.0374





const DARDOS_VISITA: int = 3
const VISITAS: int = 3
const TIROS: int = DARDOS_VISITA * VISITAS



const MAXIMO: int = TIROS * 60







static func puntos(p: Vector2) -> int:
	var r: float = p.length()
	if r > 1.0:
		return 0
	if r <= BULL_DENTRO:
		return 50
	if r <= BULL_FUERA:
		return 25
	var base: int = int(SECTORES[sector(p)])
	if r >= TRIPLE_DE and r <= TRIPLE_A:
		return base * 3
	if r >= DOBLE_DE:
		return base * 2
	return base








static func sector(p: Vector2) -> int:
	var paso: float = TAU / float(SECTORES.size())
	var ang: float = fposmod(atan2(p.x, - p.y) + paso * 0.5, TAU)
	return int(floorf(ang / paso)) % SECTORES.size()





static func etiqueta(p: Vector2) -> Dictionary:
	var r: float = p.length()
	if r > 1.0:
		return {"clave": "FUERA", "n": 0, "puntos": 0}
	if r <= BULL_DENTRO:
		return {"clave": "DIANA", "n": 0, "puntos": 50}
	if r <= BULL_FUERA:
		return {"clave": "ANILLO", "n": 0, "puntos": 25}
	var base: int = int(SECTORES[sector(p)])
	if r >= TRIPLE_DE and r <= TRIPLE_A:
		return {"clave": "TRIPLE {0}", "n": base, "puntos": base * 3}
	if r >= DOBLE_DE:
		return {"clave": "DOBLE {0}", "n": base, "puntos": base * 2}
	return {"clave": "{0}", "n": base, "puntos": base}








const CARGA_SEG: float = 0.75




const AGUANTE_SEG: float = 0.85



const TEMBLOR_POR_SEG: float = 0.42
const DISPERSION_MAX: float = 0.34




const DISPERSION_BASE: float = 0.035







const AMP: float = 0.735
const RAZON_Y: float = 0.82


const RADIO_MAX: float = AMP * 1.29341





const FREC_X: float = 1.0
const FREC_Y: float = 1.37
const FASE_Y: float = 1.1


const VEL_LIBRE: float = 2.6



const RECORRIDO_FRENADA: float = VEL_LIBRE * CARGA_SEG * 0.5




static func mira(f: float) -> Vector2:
	return Vector2(sin(f * FREC_X), sin(f * FREC_Y + FASE_Y) * RAZON_Y) * AMP





static func frenado(t: float) -> float:
	return clampf(1.0 - t / CARGA_SEG, 0.0, 1.0)








static func fase_tras(f0: float, t: float) -> float:
	var tc: float = minf(t, CARGA_SEG)
	return f0 + VEL_LIBRE *(tc - tc * tc /(2.0 * CARGA_SEG))





static func dispersion(t: float) -> float:
	var sobra: float = t -(CARGA_SEG + AGUANTE_SEG)
	if sobra <= 0.0:
		return DISPERSION_BASE
	return minf(DISPERSION_BASE + sobra * TEMBLOR_POR_SEG, DISPERSION_MAX)





static func temblando(t: float) -> bool:
	return t > CARGA_SEG + AGUANTE_SEG







static func tiro(centro: Vector2, disp: float, rng: RandomNumberGenerator) -> Vector2:
	var ang: float = rng.randf() * TAU
	var rad: float = sqrt(rng.randf()) * disp
	return centro + Vector2(cos(ang), sin(ang)) * rad




















static func es_diana(p: Vector2) -> bool:
	return p.length() <= BULL_DENTRO
