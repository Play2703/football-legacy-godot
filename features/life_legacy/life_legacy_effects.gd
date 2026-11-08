class_name LifeLegacyEffects
extends RefCounted

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")

# Taxas de decaimento natural semanal em direção ao valor baseline
const DRIFT_RATES: Dictionary = {
	"popularity": -0.15,
	"reputation": -0.05,
	"discipline": -0.10,
	"emotional_stability": 0.0,
	"personal_relationships": -0.10,
	"social_influence": -0.10
}

# Calcula o drift natural semanal dos indicadores
static func compute_weekly_drift(current_stats: Dictionary) -> Dictionary:
	var deltas: Dictionary = {}
	for k in LifeLegacyState.STAT_KEYS:
		var cur: float = float(current_stats.get(k, LifeLegacyState.STAT_DEFAULTS.get(k, 50.0)))
		var target: float = float(LifeLegacyState.STAT_DEFAULTS.get(k, 50.0))
		var rate: float = float(DRIFT_RATES.get(k, -0.1))
		
		if cur > target:
			var step: float = maxf(rate, target - cur)
			deltas[k] = step
		elif cur < target and rate >= 0.0:
			var step: float = minf(0.1, target - cur)
			deltas[k] = step
		else:
			deltas[k] = 0.0
	return deltas

# Circuit breaker / amortização para saltos analíticos superiores a 2 temporadas
static func compute_amortized_stats(current_stats: Dictionary, seasons_gap: int) -> Dictionary:
	var result: Dictionary = {}
	var decay_factor: float = pow(0.75, seasons_gap) # Aproxima-se 25% da baseline por temporada omitida
	for k in LifeLegacyState.STAT_KEYS:
		var cur: float = float(current_stats.get(k, LifeLegacyState.STAT_DEFAULTS.get(k, 50.0)))
		var target: float = float(LifeLegacyState.STAT_DEFAULTS.get(k, 50.0))
		var new_val: float = target + (cur - target) * decay_factor
		result[k] = LifeLegacyState.clamp_stat(k, new_val)
	return result
