extends SceneTree

const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")
const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")

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
	
	# Test 4: Replay Determinístico de Sequência Numérica (1.000 iterações)
	print("[TEST] 4. Replay Determinístico de Sequência Numérica...")
	var seed_test: int = LifeLegacyRNG.generate_seed(0, 2, 14, 1, 1)
	var rng_run1: LifeLegacyRNG = LifeLegacyRNG.new(seed_test)
	var rng_run2: LifeLegacyRNG = LifeLegacyRNG.new(seed_test)
	
	for i in range(1000):
		var u1: int = rng_run1.next_u32()
		var u2: int = rng_run2.next_u32()
		assert(u1 == u2, "Divergência na sequência pseudoaleatória na iteração %d!" % i)
	print("  -> Sequência idêntica em 1.000 amostras!")
	
	# Test 5: Replay Determinístico de Sorteio de Eventos
	print("[TEST] 5. Replay Determinístico de Rolagem de Eventos...")
	LifeLegacyEvents.clear_registry()
	LifeLegacyEvents.register_event({
		"id": "evt_replay_01",
		"title": "Entrevista Coletiva",
		"weight": 50,
		"conditions": {}
	})
	LifeLegacyEvents.register_event({
		"id": "evt_replay_02",
		"title": "Oferta de Patrocínio",
		"weight": 50,
		"conditions": {}
	})
	
	var ctx: Dictionary = {
		"season_num": 2,
		"season_day": 14
	}
	
	var rng_event1: LifeLegacyRNG = LifeLegacyRNG.new(seed_test)
	var rolled1: Dictionary = LifeLegacyEvents.roll_event(ctx, rng_event1)
	
	var rng_event2: LifeLegacyRNG = LifeLegacyRNG.new(seed_test)
	var rolled2: Dictionary = LifeLegacyEvents.roll_event(ctx, rng_event2)
	
	assert(rolled1["event_id"] == rolled2["event_id"], "Replay de evento divergiu no event_id!")
	assert(rolled1["occurrence_id"] == rolled2["occurrence_id"], "Replay de evento divergiu no occurrence_id!")
	assert(rolled1["title"] == rolled2["title"], "Replay de evento divergiu no title!")
	print("  -> Rolagem de eventos 100% determinística!")
	
	print("[PASS] Test Deterministic RNG aprovado com sucesso!")
	quit(0)
