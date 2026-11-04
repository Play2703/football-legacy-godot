class_name Presentation
extends RefCounted




































const KIND_BUY: String = "buy"
const KIND_FREE: String = "free"
const KIND_LOAN: String = "loan"













const BUY_FEE_FLOOR: float = 0.85
const FREE_FEE_FACTOR: float = 0.7
const LOAN_FEE_FACTOR: float = 0.3




const LOAN_HYPE_MULT: float = 0.62




const W_PRICE: float = 0.62
const W_UPGRADE: float = 0.38



























const PRICE_FULL: float = 1.4
const PRICE_EXP: float = 0.55

















const UPGRADE_LO: float = -8.0
const UPGRADE_HI: float = 12.0






















const UPGRADE_FADE_START: float = 25.0
const UPGRADE_FADE_END: float = 37.0
const UPGRADE_FADE_FLOOR: float = 0.45


const FAME_LO: float = 20.0
const FAME_HI: float = 85.0






const FAME_GATE_FLOOR: float = 0.55





const AGE_YOUNG: float = 23.0


const AGE_YOUNG_FROM: float = 16.0
const AGE_YOUNG_MULT: float = 1.06
const AGE_PRIME_END: float = 31.0
const AGE_OLD: float = 37.0
const AGE_OLD_MULT: float = 0.72







const ATT_FLOOR: Dictionary = {1: 0.3, 2: 0.22, 3: 0.12}
const ATT_CEIL: Dictionary = {1: 1.0, 2: 0.9, 3: 0.76}











const CAP_ANCHOR: float = 55.0
const CAP_GROWTH: float = 1.042
const CAP_BASE: Dictionary = {1: 25000.0, 2: 12000.0, 3: 3200.0}
const CAP_MIN: Dictionary = {1: 18000, 2: 7000, 3: 1500}
const CAP_MAX: Dictionary = {1: 98000, 2: 38000, 3: 12000}





const TIER_TIBIO: float = 0.38
const TIER_LLENO: float = 0.62
const TIER_HISTORICO: float = 0.86




















const BALLON_ATT: float = 1.0


const BALLON_HEADLINE: String = \
		"El mejor jugador del mundo es suyo. No cabe un alma para verlo."




















static func evaluate(ctx: Dictionary) -> Dictionary:
	var kind: String = String(ctx.get("kind", KIND_BUY))
	var div: int = clampi(int(ctx.get("div", 1)), 1, 3)
	var value: float = maxf(float(ctx.get("value", 0)), 0.0)
	var budget: float = maxf(float(ctx.get("club_budget", 0)), 1.0)


	var eff_fee: float = _effective_fee(kind, maxf(float(ctx.get("fee", 0)), 0.0), value)
	var price: float = clampf(pow(clampf(eff_fee / budget, 0.0, PRICE_FULL) / PRICE_FULL,
		PRICE_EXP), 0.0, 1.0)



	var gap: float = float(ctx.get("ovr", 0)) - float(ctx.get("squad_strength", 0))
	var upgrade: float = clampf((gap - UPGRADE_LO) /(UPGRADE_HI - UPGRADE_LO), 0.0, 1.0)
	var overqualified: bool = gap > UPGRADE_FADE_START
	if overqualified:
		upgrade = lerpf(1.0, UPGRADE_FADE_FLOOR,
			clampf((gap - UPGRADE_FADE_START) /(UPGRADE_FADE_END - UPGRADE_FADE_START),
				0.0, 1.0))



	var fame: float = clampf((float(ctx.get("fame", 0)) - FAME_LO) /(FAME_HI - FAME_LO),
		0.0, 1.0)

	var hype: float =(price * W_PRICE + upgrade * W_UPGRADE) \
			* lerpf(FAME_GATE_FLOOR, 1.0, fame)


	var age: float = float(ctx.get("age", 26))
	var veteran: bool = age > AGE_PRIME_END + 2.0






	if age <= AGE_YOUNG:
		hype *= lerpf(AGE_YOUNG_MULT, 1.0,
			clampf((age - AGE_YOUNG_FROM) /(AGE_YOUNG - AGE_YOUNG_FROM), 0.0, 1.0))
	elif age > AGE_PRIME_END:
		hype *= lerpf(1.0, AGE_OLD_MULT,
			clampf((age - AGE_PRIME_END) /(AGE_OLD - AGE_PRIME_END), 0.0, 1.0))

	if kind == KIND_LOAN:
		hype *= LOAN_HYPE_MULT
	hype = clampf(hype, 0.0, 1.0)




	var ballon: bool = bool(ctx.get("ballon", false))
	var att: float = BALLON_ATT if ballon else attendance_for(hype, div)
	var cap: int = capacity(int(ctx.get("club_rating", 60)), div,
		String(ctx.get("club_id", "")))


	var fans: int = int(round(float(cap) * att / 100.0)) * 100
	var tier: String = tier_of(att)
	return {
		"kind": kind,
		"hype": hype,
		"price": price,
		"upgrade": upgrade,
		"fame": fame,
		"attendance": att,
		"capacity": cap,
		"fans": fans,
		"tier": tier,
		"tier_name": tier_name(tier),
		"headline": headline(tier, kind, overqualified, veteran, ballon),
		"overqualified": overqualified,
		"ballon": ballon,
		"div": div,
	}




static func _effective_fee(kind: String, fee: float, value: float) -> float:
	match kind:
		KIND_FREE:
			return value * FREE_FEE_FACTOR
		KIND_LOAN:
			return value * LOAN_FEE_FACTOR
		_:
			return maxf(fee, value * BUY_FEE_FLOOR)



static func attendance_for(hype: float, div: int) -> float:
	var d: int = clampi(div, 1, 3)
	var lo: float = float(ATT_FLOOR[d])
	var hi: float = float(ATT_CEIL[d])
	return clampf(lo +(hi - lo) * clampf(hype, 0.0, 1.0), 0.0, 1.0)




















static func capacity(club_rating: int, div: int, club_id: String = "") -> int:
	var real: int = Stadiums.capacity_of(club_id) if not club_id.is_empty() else 0
	if real > 0:
		return real
	var d: int = clampi(div, 1, 3)
	var raw: float = float(CAP_BASE[d]) * pow(CAP_GROWTH, float(club_rating) - CAP_ANCHOR)
	return clampi(int(round(raw)), int(CAP_MIN[d]), int(CAP_MAX[d]))



static func tier_of(attendance: float) -> String:
	if attendance >= TIER_HISTORICO:
		return "historico"
	if attendance >= TIER_LLENO:
		return "lleno"
	if attendance >= TIER_TIBIO:
		return "tibio"
	return "frio"


static func tier_name(tier: String) -> String:
	match tier:
		"historico":
			return "LLENO HISTÓRICO"
		"lleno":
			return "ESTADIO LLENO"
		"tibio":
			return "MEDIA ENTRADA"
		_:
			return "PRESENTACIÓN DISCRETA"







static func headline(tier: String, kind: String, overqualified: bool = false,
		veteran: bool = false, ballon: bool = false) -> String:
	if ballon:
		return BALLON_HEADLINE
	if overqualified and kind != KIND_LOAN:
		if veteran:
			return "¿Última parada o retiro dorado? La grada vino a averiguarlo."
		return "Nadie entiende qué haces aquí. Vinieron por morbo; convéncelos."
	if kind == KIND_LOAN:
		match tier:
			"historico", "lleno":
				return "Vienen a ver si eres el refuerzo que les faltaba."
			"tibio":
				return "Media grada se acercó a conocer al cedido."
			_:
				return "Una cesión más. Aquí se demuestra jugando."
	if kind == KIND_FREE:
		match tier:
			"historico":
				return "Sin pagar un peso y el estadio no cabe. Eso es un fichajazo."
			"lleno":
				return "Se agotaron las entradas para ver un fichaje gratis."
			"tibio":
				return "Llegas libre y media grada quiso verte la cara."
			_:
				return "Sin traspaso y sin ruido. El ruido lo haces tú."
	match tier:
		"historico":
			return "El club paró la ciudad para presentarte. No se olvida un día así."
		"lleno":
			return "Lleno para ver a su fichaje. Ahora hay que responder."
		"tibio":
			return "Media entrada. Te conocen; falta que te quieran."
		_:
			return "Cuatro curiosos y una cámara. Aquí se empieza desde abajo."
