class_name LifeLegacyState
extends RefCounted

const CURRENT_SUPPORTED_SCHEMA: int = 5
const DEFAULT_CATALOG_VERSION: int = 2
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
		"total_ticks_processed": 0,
		"season_calendar_lengths": {},
		"stats": STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"active_modifiers": [],
		"story_arcs": {
			"active_arcs": {},
			"completed_arcs": []
		},
		"family": {
			"spouse": {},
			"children": []
		},
		"dynasty": {
			"current_generation": 1,
			"ancestors": [],
			"heir_candidates": [],
			"next_dynasty_tx_seq": 1
		},
		"active_event": {},
		"outbox": {
			"pending_dispatches": []
		},
		"history": {
			"resolved_events": [],
			"milestones": []
		},
		"annual_history": [],
		"processed_annual_rollovers": [],
		"expired_modifiers_log": [],
		"recovery_log": [],
		"social_reputation": {
			"scandal_heat": 0.0,
			"press_agent_level": 0,
			"press_agent_ticks_remaining": 0,
			"active_campaigns": [],
			"cooldowns": {},
			"history": [],
			"last_processed_tick": 0
		}
	}

static func clamp_stat(stat_name: String, val: float) -> float:
	return clampf(val, 0.0, 100.0)

static func validate_schema(data: Dictionary) -> bool:
	if not data.has("schema_version"):
		return false
	if not (data["schema_version"] is int or (data["schema_version"] is float and data["schema_version"] == int(data["schema_version"]))):
		return false
	var sv: int = int(data["schema_version"])
	if sv < 1 or sv > CURRENT_SUPPORTED_SCHEMA:
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

	if sv == 2:
		if data.has("active_modifiers") and not (data["active_modifiers"] is Array):
			return false
		if data.has("story_arcs") and not (data["story_arcs"] is Dictionary):
			return false
		if data.has("total_ticks_processed") and not (data["total_ticks_processed"] is int or (data["total_ticks_processed"] is float and data["total_ticks_processed"] == int(data["total_ticks_processed"]))):
			return false

	if sv >= 3:
		if not data.has("active_modifiers") or not (data["active_modifiers"] is Array):
			return false
		if not data.has("story_arcs") or not (data["story_arcs"] is Dictionary):
			return false
		var story_arcs: Dictionary = data["story_arcs"]
		if not story_arcs.has("active_arcs") or not (story_arcs["active_arcs"] is Dictionary):
			return false
		if not story_arcs.has("completed_arcs") or not (story_arcs["completed_arcs"] is Array):
			return false
		var active_arcs: Dictionary = story_arcs["active_arcs"]
		for aid in active_arcs:
			var ainfo = active_arcs[aid]
			if not (ainfo is Dictionary):
				return false
			if not ainfo.has("last_act_resolved_ticks") or not (ainfo["last_act_resolved_ticks"] is int or (ainfo["last_act_resolved_ticks"] is float and ainfo["last_act_resolved_ticks"] == int(ainfo["last_act_resolved_ticks"]))):
				return false
		if not data.has("total_ticks_processed") or not (data["total_ticks_processed"] is int or (data["total_ticks_processed"] is float and data["total_ticks_processed"] == int(data["total_ticks_processed"]))):
			return false
		if int(data["total_ticks_processed"]) < 0:
			return false
		if data.has("season_calendar_lengths") and not (data["season_calendar_lengths"] is Dictionary):
			return false

	if sv >= 4:
		if not data.has("social_reputation") or not (data["social_reputation"] is Dictionary):
			return false
		var sr: Dictionary = data["social_reputation"]
		if not sr.has("scandal_heat") or not (sr["scandal_heat"] is float or sr["scandal_heat"] is int):
			return false
		var sh: float = float(sr["scandal_heat"])
		if sh < 0.0 or sh > 100.0:
			return false
		if not sr.has("press_agent_level") or not (sr["press_agent_level"] is int or (sr["press_agent_level"] is float and sr["press_agent_level"] == int(sr["press_agent_level"]))):
			return false
		if not sr.has("active_campaigns") or not (sr["active_campaigns"] is Array):
			return false
		if not sr.has("cooldowns") or not (sr["cooldowns"] is Dictionary):
			return false
		if not sr.has("history") or not (sr["history"] is Array):
			return false

	if sv >= 5:
		if not data.has("family") or not (data["family"] is Dictionary):
			return false
		var fam: Dictionary = data["family"]
		if not fam.has("spouse") or not (fam["spouse"] is Dictionary):
			return false
		if not fam.has("children") or not (fam["children"] is Array):
			return false
		for ch in fam["children"]:
			if not (ch is Dictionary):
				return false
			if not ch.has("id") or not ch.has("name"):
				return false
			if not ch.has("formation_path") or not (ch["formation_path"] is String):
				return false
			var fp: String = String(ch["formation_path"])
			if fp != "basic" and fp != "elite" and fp != "football":
				return false
			if ch.has("affinity") and not (ch["affinity"] is float or ch["affinity"] is int):
				return false

	return true
