class_name Cesped
extends RefCounted

























const DIV_Q: Dictionary = {1: 0.85, 2: 0.5, 3: 0.2}




const SEED_SPAN: float = 0.08



const DRAG_SPAN: float = 0.2
const BOTE_SPAN: float = 0.12




const JITTER_MAX: float = 0.25




const BOTE_HOY: float = 0.5
const DRAG_HOY: float = 1.4




static func calidad01(div: int, dueno_id: String) -> float:
	var base: float = float(DIV_Q.get(div, 0.5))
	var s: float = float(abs(hash(dueno_id + "cesped")) % 1000) / 999.0
	return clampf(base +(s - 0.5) * 2.0 * SEED_SPAN, 0.0, 1.0)




static func drag(q: float) -> float:
	return DRAG_HOY *(1.0 +(0.5 - clampf(q, 0.0, 1.0)) * DRAG_SPAN)




static func bote(q: float) -> float:
	return BOTE_HOY *(1.0 +(clampf(q, 0.0, 1.0) - 0.5) * BOTE_SPAN)




static func jitter(q: float) -> float:
	return maxf(0.0, 0.5 - clampf(q, 0.0, 1.0)) * 2.0 * JITTER_MAX * 0.5











const HELADA_BOTE_SPAN: float = 0.08
const HELADA_DRAG_SPAN: float = 0.08


static func helada_bote_mult(frio: float) -> float:
	return 1.0 + clampf(frio, 0.0, 1.0) * HELADA_BOTE_SPAN


static func helada_drag_mult(frio: float) -> float:
	return 1.0 - clampf(frio, 0.0, 1.0) * HELADA_DRAG_SPAN
