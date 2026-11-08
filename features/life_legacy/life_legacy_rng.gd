class_name LifeLegacyRNG
extends RefCounted

# Gerador Congruencial Linear (Knuth 64-bit LCG / MMIX)
# Recorrência canônica: S_{n+1} = (a * S_n + c) mod 2^64
const ALGO_VERSION: int = 1
const MULTIPLIER: int = 6364136223846793005
const INCREMENT: int = 1442695040888963407

var state: int = 0

func _init(seed_val: int = 0) -> void:
	state = seed_val

# Avança o estado e extrai os 32 bits mais significativos
func next_u32() -> int:
	state = (state * MULTIPLIER + INCREMENT)
	# Extrai bits 63..32 com máscara para garantir valor inteiro positivo de 32 bits em GDScript (int64)
	return (state >> 32) & 0xFFFFFFFF

# Gera um número inteiro no intervalo [0, max_val - 1] com rejeição de viés de módulo
func next_int_bounded(max_val: int) -> int:
	if max_val <= 0:
		return 0
	if max_val == 1:
		return 0
	# Rejection sampling para eliminar modulo bias quando 2^32 não é múltiplo de max_val
	var limit: int = 0x100000000 - (0x100000000 % max_val)
	var raw: int = next_u32()
	while raw >= limit:
		raw = next_u32()
	return raw % max_val

# Gera um número inteiro no intervalo fechado [min_val, max_val]
func rand_range(min_val: int, max_val: int) -> int:
	if min_val >= max_val:
		return min_val
	var count: int = max_val - min_val + 1
	return min_val + next_int_bounded(count)

# Gera um ponto flutuante normalizado no intervalo [0.0, 1.0)
func next_float() -> float:
	return float(next_u32()) / 4294967296.0

# Gera semente determinística estável e livre de colisões incorporando slot, temporada, dia, versão de catálogo e PRNG
static func generate_seed(slot: int, season: int, day: int, catalog_ver: int = 1, rng_ver: int = 1) -> int:
	var s_slot: int = clampi(slot, 0, 15) & 0xF
	var s_season: int = (season & 0xFFFF)
	var s_day: int = (day & 0xFFF)
	var s_cat: int = (catalog_ver & 0xFF)
	var s_rng: int = (rng_ver & 0xFF)
	var combined: int = s_slot | (s_season << 4) | (s_day << 20) | (s_cat << 32) | (s_rng << 40)
	var state_seed: int = (combined * MULTIPLIER + INCREMENT) & 0x7FFFFFFFFFFFFFFF
	state_seed = (state_seed * MULTIPLIER + INCREMENT) & 0x7FFFFFFFFFFFFFFF
	return state_seed

