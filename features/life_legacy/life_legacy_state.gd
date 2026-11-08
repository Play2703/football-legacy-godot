class_name LifeLegacyState
extends RefCounted

const CURRENT_SUPPORTED_SCHEMA: int = 1
const DEFAULT_CATALOG_VERSION: int = 1
const RNG_VERSION: int = 1

# Os 6 Indicadores Independentes do Life & Legacy
const STAT_KEYS: Array[String] = [
	"popularity",
	"reputation",
	"discipline",
	"emotional_stability",
	"personal_relationships",
	"social_influence"
]

const STAT_DEFAULTS: Dictionary = {
	"popularity": 40.0,
	"reputation": 50.0,
	"discipline": 70.0,
	"emotional_stability": 60.0,
	"personal_relationships": 50.0,
	"social_influence": 20.0
}

static func get_default_profile(season_num: int = 1, season_day: int = 0) -> Dictionary:
	return {
		"schema_version": CURRENT_SUPPORTED_SCHEMA,
		"catalog_version": DEFAULT_CATALOG_VERSION,
		"rng_version": RNG_VERSION,
		"save_revision": 1,
		"last_processed_time": {
			"season_num": season_num,
			"season_day": season_day
		},
		"stats": STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": {
			"spouse": {},
			"children": []
		},
		"dynasty": {
			"ancestors": [],
			"heir_candidates": []
		},
		"active_event": {},
		"outbox": {
			"pending_dispatches": []
		},
		"history": {
			"resolved_events": [],
			"milestones": []
		},
		"recovery_log": []
	}

static func clamp_stat(stat_name: String, val: float) -> float:
	return clampf(val, 0.0, 100.0)

static func validate_schema(data: Dictionary) -> bool:
	if not data.has("schema_version"):
		return false
	if not (data["schema_version"] is int or (data["schema_version"] is float and data["schema_version"] == int(data["schema_version"]))):
		return false
	if not data.has("stats") or not (data["stats"] is Dictionary):
		return false
	for k in STAT_KEYS:
		if not data["stats"].has(k):
			return false
	if not data.has("last_processed_time") or not (data["last_processed_time"] is Dictionary):
		return false
	var pt: Dictionary = data["last_processed_time"]
	if not pt.has("season_num") or not pt.has("season_day"):
		return false
	return true
