extends SceneTree

const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")

func _init() -> void:
	print("--- TEST: LifeLegacy Deterministic RNG (KnuthLCG64) ---")
	
	# Test 1: Exact Test Vectors for seed = 12345
	var rng: LifeLegacyRNG = LifeLegacyRNG.new(12345)
	var v1: int = rng.next_u32()
	var v2: int = rng.next_u32()
	var v3: int = rng.next_u32()
	
	print("V1:", v1, "Expected: 470636529")
	print("V2:", v2, "Expected: 1139821166")
	print("V3:", v3, "Expected: 3803726085")
	
	assert(v1 == 470636529, "Vector 1 mismatch!")
	assert(v2 == 1139821166, "Vector 2 mismatch!")
	assert(v3 == 3803726085, "Vector 3 mismatch!")
	
	# Test 2: Bounded range and zero guard
	assert(rng.next_int_bounded(0) == 0, "Guard for max_val <= 0 failed")
	assert(rng.next_int_bounded(-10) == 0, "Guard for negative max_val failed")
	assert(rng.next_int_bounded(1) == 0, "Guard for max_val == 1 failed")
	
	for i in range(100):
		var b: int = rng.next_int_bounded(10)
		assert(b >= 0 and b < 10, "Bounded int out of range [0, 9]!")
	
	# Test 3: Float normal range
	for i in range(100):
		var f: float = rng.next_float()
		assert(f >= 0.0 and f < 1.0, "Float out of range [0.0, 1.0)!")
	
	print("[PASS] Test Deterministic RNG aprovado com sucesso!")
	quit(0)
