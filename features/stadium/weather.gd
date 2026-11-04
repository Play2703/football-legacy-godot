class_name Weather
extends RefCounted









const PRESETS: Dictionary = {
	"day": {
		"sun_rot": Vector3(-52.0, -28.0, 0.0),
		"sun_energy": 1.15,
		"sun_color": Color(1.0, 0.985, 0.94),
		"sky_top": Color("3a6fb5"),
		"sky_horizon": Color("a8c4dd"),
		"ground_horizon": Color("a8c4dd"),
		"ground_bottom": Color("8fa8a0"),
		"ambient_energy": 1.0,
		"fog": true,
		"fog_color": Color("a8c4dd"),
		"fog_density": 0.0018,
		"grass_tint": Color(1.0, 1.0, 1.0),
		"grass_roughness": 1.0,
		"rain": false,
		"snow": false,
		"floodlights": false,
		"glow": false,
		"flood_emission": 0.7,
		"ads_led": 0.0,
		"ads_scroll": 0.0,
	},
	"overcast": {
		"sun_rot": Vector3(-62.0, -10.0, 0.0),
		"sun_energy": 0.55,
		"sun_color": Color(0.92, 0.94, 0.98),
		"sky_top": Color("6d7787"),
		"sky_horizon": Color("aab2bd"),
		"ground_horizon": Color("7b8489"),
		"ground_bottom": Color("3a4145"),
		"ambient_energy": 1.25,
		"fog": true,
		"fog_color": Color("9aa3ae"),
		"fog_density": 0.004,
		"grass_tint": Color(0.82, 0.86, 0.84),
		"grass_roughness": 1.0,
		"rain": false,
		"snow": false,
		"floodlights": false,
		"glow": false,
		"flood_emission": 0.7,
		"ads_led": 0.0,
		"ads_scroll": 0.0,
	},
	"sunset": {
		"sun_rot": Vector3(-13.0, -65.0, 0.0),
		"sun_energy": 1.0,
		"sun_color": Color(1.0, 0.72, 0.45),
		"sky_top": Color("4a4e8f"),
		"sky_horizon": Color("f2a15c"),
		"ground_horizon": Color("b0714a"),
		"ground_bottom": Color("2a4a33"),
		"ambient_energy": 0.85,
		"fog": true,
		"fog_color": Color("f2a15c"),
		"fog_density": 0.0025,
		"grass_tint": Color(1.0, 0.88, 0.75),
		"grass_roughness": 1.0,
		"rain": false,
		"snow": false,
		"floodlights": false,
		"glow": true,
		"flood_emission": 1.6,
		"ads_led": 0.8,
		"ads_scroll": 0.0,
	},
	"rain": {
		"sun_rot": Vector3(-62.0, -10.0, 0.0),
		"sun_energy": 0.4,
		"sun_color": Color(0.85, 0.9, 0.97),
		"sky_top": Color("59626e"),
		"sky_horizon": Color("8d97a2"),
		"ground_horizon": Color("6f7880"),
		"ground_bottom": Color("323a40"),
		"ambient_energy": 1.1,
		"fog": true,
		"fog_color": Color("8a939e"),






		"fog_density": 0.005,
		"grass_tint": Color(0.62, 0.7, 0.66),
		"grass_roughness": 0.55,
		"rain": true,
		"snow": false,
		"floodlights": false,
		"glow": false,
		"flood_emission": 1.0,
		"ads_led": 0.5,
		"ads_scroll": 0.0,
	},
	"night": {
		"sun_rot": Vector3(-55.0, 20.0, 0.0),
		"sun_energy": 0.5,
		"sun_color": Color(0.78, 0.85, 1.0),
		"sky_top": Color("0b1026"),
		"sky_horizon": Color("1d2a4a"),
		"ground_horizon": Color("16203a"),
		"ground_bottom": Color("0a1420"),
		"ambient_energy": 1.0,
		"fog": false,
		"fog_color": Color("101830"),
		"fog_density": 0.0,
		"grass_tint": Color(0.9, 0.94, 1.02),
		"grass_roughness": 1.0,
		"rain": false,
		"snow": false,
		"floodlights": true,
		"glow": true,
		"flood_emission": 3.0,
		"ads_led": 1.6,
		"ads_scroll": 0.02,
	},















	"snow": {
		"sun_rot": Vector3(-58.0, -16.0, 0.0),
		"sun_energy": 0.62,
		"sun_color": Color(0.93, 0.95, 1.0),





		"sky_top": Color("6a7688"),
		"sky_horizon": Color("a9b3c0"),
		"ground_horizon": Color("9fa9b4"),
		"ground_bottom": Color("7c8791"),




		"ambient_energy": 1.25,
		"fog": true,



		"fog_color": Color("c4ccd6"),
		"fog_density": 0.006,


		"grass_tint": Color(0.97, 0.98, 1.0),



		"grass_roughness": 0.9,
		"rain": false,
		"snow": true,
		"floodlights": false,
		"glow": false,
		"flood_emission": 1.2,
		"ads_led": 0.6,
		"ads_scroll": 0.0,
	},
}





const WEIGHTS: Dictionary = {
	"day": 30,
	"overcast": 20,
	"sunset": 20,
	"rain": 15,
	"night": 15,
	"snow": 7,
}















const WEIGHTS_BY_DIV: Dictionary = {
	1: {"day": 22, "overcast": 16, "sunset": 20, "rain": 12, "night": 30, "snow": 7},
	2: {"day": 30, "overcast": 20, "sunset": 18, "rain": 15, "night": 17, "snow": 8},
	3: {"day": 40, "overcast": 30, "sunset": 0, "rain": 22, "night": 0, "snow": 9},
}






















const CLIMATE_BY_COUNTRY: Dictionary = {
	"Inglaterra": {"overcast": 1.7, "rain": 2.0, "day": 0.5, "sunset": 0.7, "snow": 0.7},
	"Alemania": {"overcast": 1.5, "rain": 1.5, "day": 0.7, "snow": 1.8},
	"Países Bajos": {"overcast": 1.5, "rain": 1.7, "day": 0.6, "snow": 0.8},
	"Bélgica": {"overcast": 1.5, "rain": 1.6, "day": 0.6, "snow": 0.8},
	"España": {"day": 1.7, "sunset": 1.3, "rain": 0.4, "overcast": 0.5, "snow": 0.2},
	"Italia": {"day": 1.5, "sunset": 1.3, "rain": 0.5, "overcast": 0.7, "snow": 0.5},
	"Portugal": {"day": 1.6, "sunset": 1.2, "rain": 0.6, "overcast": 0.6, "snow": 0.05},
	"México": {"day": 1.6, "sunset": 1.2, "rain": 0.8, "overcast": 0.6, "snow": 0.05},
	"Francia": {"day": 1.1, "rain": 1.1, "snow": 0.9},

	"Noruega": {"snow": 3.4},
	"Suecia": {"snow": 2.6},
	"Chequia": {"snow": 2.6},
	"Ucrania": {"snow": 2.6},
	"Austria": {"snow": 2.5},
	"Suiza": {"snow": 2.4},
	"Escocia": {"snow": 1.9},
	"Rumanía": {"snow": 1.8},
	"Serbia": {"snow": 1.7},
	"Bosnia y Herzegovina": {"snow": 1.9},
	"Dinamarca": {"snow": 1.6},
	"Corea del Sur": {"snow": 1.5},
	"Estados Unidos": {"snow": 1.3},
	"Japón": {"snow": 1.2},
	"Turquía": {"snow": 1.1},
	"Croacia": {"snow": 1.0},
	"Grecia": {"snow": 0.3},
}








const GEO_DEFAULT: Dictionary = {"snow": 0.0}








const DATE_DEFAULT: Dictionary = {"snow": 0.0}








const NIGHT_COMPS: Array[String] = ["ucl", "eul", "conf", "cwc", "lib", "sud", "cca",
	"ace", "ac2", "caf", "cf2", "recopa", "intercont",

	"supereuropa",

	"superafrica",

	"ligas",

	"ofc"]
























static func cold(t: float) -> float:
	return - cos(TAU * clampf(t, 0.0, 1.0))



















const SNOW_COLD_FLOOR: float = 0.4
const SNOW_COLD_GAIN: float = 3.6

static func season_mult(t: float) -> Dictionary:
	var c: float = cold(t)
	return {
		"night": maxf(1.0 + 0.9 * c, 0.05),
		"rain": maxf(1.0 + 0.6 * c, 0.05),
		"overcast": maxf(1.0 + 0.5 * c, 0.05),
		"day": maxf(1.0 - 0.55 * c, 0.05),
		"sunset": maxf(1.35 - 0.7 * absf(c), 0.05),
		"snow": maxf((c - SNOW_COLD_FLOOR) * SNOW_COLD_GAIN, 0.0),
	}















const SEASON_TILT: float = 14.0

static func season_sun_tilt(c: float) -> float:
	return SEASON_TILT * c





const SEASON_COOL: Color = Color(0.86, 0.92, 1.06)
const SEASON_WARM: Color = Color(1.06, 1.0, 0.9)





static func season_light(c: float) -> Array:
	var energy: float = 1.0 -(0.14 * c if c >= 0.0 else 0.05 * c)
	var tone: Color = SEASON_COOL if c >= 0.0 else SEASON_WARM
	return [energy, tone, absf(c) * 0.55]










const WIND_MAX: Dictionary = {
	"day": 1.5, "overcast": 4.0, "sunset": 2.0, "rain": 7.0, "night": 3.0,
	"snow": 3.5,
}


const WIND_CALM: float = 0.8







































































const RAIN_LIGHT: int = 0
const RAIN_MID: int = 1
const RAIN_STORM: int = 2

const RAIN_TIERS: Array[Dictionary] = [
	{
		"id": "drizzle",
		"weight": 38,
		"fog": 0.42,








		"drops": 0.26,
		"drop_len": 0.55,
		"fall": 0.72,
		"gust": 0.4,



		"rings": 0.55,
		"ring_pick": 0.16,
		"ring_rate": 0.6,
		"ring_size": 0.78,

		"ring_cell": 1.25,
		"bolt": Vector2.ZERO,
		"puddles": {
			"count_min": 2, "count_max": 4,
			"r_min": 1.0, "r_max": 2.2,
			"depth_min": 0.22, "depth_max": 0.55,
		},
	},
	{
		"id": "rain",
		"weight": 40,
		"fog": 0.72,
		"drops": 0.55,
		"drop_len": 0.78,
		"fall": 0.88,
		"gust": 0.75,
		"rings": 0.8,
		"ring_pick": 0.42,
		"ring_rate": 0.9,
		"ring_size": 1.0,
		"ring_cell": 1.0,
		"bolt": Vector2.ZERO,
		"puddles": {
			"count_min": 4, "count_max": 7,
			"r_min": 1.5, "r_max": 3.4,
			"depth_min": 0.32, "depth_max": 0.85,
		},
	},
	{
		"id": "storm",
		"weight": 22,






		"fog": 0.95,
		"drops": 1.0,
		"drop_len": 1.1,
		"fall": 1.1,
		"gust": 1.0,
		"rings": 1.0,



		"ring_pick": 0.8,
		"ring_rate": 1.45,
		"ring_size": 1.15,





		"ring_cell": 0.6,



		"bolt": Vector2(11.0, 34.0),
		"puddles": {
			"count_min": 8, "count_max": 11,



			"r_min": 2.2, "r_max": 4.8,
			"depth_min": 0.45, "depth_max": 1.0,
		},
	},
]


















const CALIDAD_BAJA_PARTICULAS: float = 0.5


static func particulas(base: int, calidad_baja: bool) -> int:
	if not calidad_baja:
		return base
	return maxi(1, roundi(float(base) * CALIDAD_BAJA_PARTICULAS))






static func roll_rain() -> int:
	var total: int = 0
	for t in RAIN_TIERS:
		total += maxi(0, int(t["weight"]))
	var roll: int = randi_range(1, maxi(total, 1))
	for i in RAIN_TIERS.size():
		roll -= maxi(0, int(RAIN_TIERS[i]["weight"]))
		if roll <= 0:
			return i
	return RAIN_MID





static func rain_tier(level: int) -> Dictionary:
	return RAIN_TIERS[clampi(level, 0, RAIN_TIERS.size() - 1)]











const FRIO_PRESET: Dictionary = {
	"day": 0.55, "sunset": 0.75, "overcast": 0.8,
	"night": 1.0, "rain": 0.85, "snow": 1.0,
}
const FRIO_SNOW_FLOOR: float = 0.85


static func frio01(id: String, cold_v: float) -> float:
	var f: float = clampf(maxf(0.0, cold_v)
		* float(FRIO_PRESET.get(id, 0.8)), 0.0, 1.0)
	if id == "snow":
		f = maxf(f, FRIO_SNOW_FLOOR)
	return f








const LLUVIA01_TIERS: Array[float] = [0.35, 0.7, 1.0]
const LLUVIA01_SNOW: float = 0.8


static func lluvia01(preset: Dictionary, level: int) -> float:
	if bool(preset.get("snow", false)):
		return LLUVIA01_SNOW
	if bool(preset.get("rain", false)):
		return LLUVIA01_TIERS[clampi(level, 0, LLUVIA01_TIERS.size() - 1)]
	return 0.0




static func rain_gust(id: String, level: int) -> float:
	if id != "rain" or level < 0:
		return 1.0
	return float(rain_tier(level)["gust"])

































static func roll_wind(id: String, gust: float = 1.0) -> Vector3:
	var techo: float = float(WIND_MAX.get(id, 2.0)) * maxf(gust, 0.0)
	if GameState.readonly_save:
		var side0: float = -1.0 if randf() < 0.5 else 1.0
		var sp0: float = randf_range(0.0, techo)
		return Vector3(side0 * sp0, 0.0, randf_range(-0.35, 0.35) * sp0)
	if GameState.next_wind_seed == 0:


		GameState.next_wind_seed = maxi(int(randi()), 1)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("wind|%d|%s" % [GameState.next_wind_seed, id])
	var speed: float = rng.randf_range(0.0, techo)
	var side: float = -1.0 if rng.randf() < 0.5 else 1.0
	return Vector3(side * speed, 0.0, rng.randf_range(-0.35, 0.35) * speed)





static func _pick_from(weights: Dictionary) -> String:
	var total: int = 0
	for id in weights:
		total += maxi(0, int(weights[id]))
	if total <= 0:
		return "day"
	var roll: int = randi_range(1, total)
	for id in weights:
		var w: int = maxi(0, int(weights[id]))
		if w <= 0:
			continue
		roll -= w
		if roll <= 0:
			return id
	return "day"










static func _blend(base: Dictionary, geo: Dictionary, date: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for id in base:




		var w: float = float(base[id]) \
				* float(geo.get(id, GEO_DEFAULT.get(id, 1.0))) \
				* float(date.get(id, DATE_DEFAULT.get(id, 1.0)))
		out[id] = maxi(int(round(w)), 1) if w > 0.0 else 0
	return out



static func pick_random() -> String:
	return _pick_from(_blend(WEIGHTS, {}, {}))




static func pick_for_div(div: int) -> String:
	return _pick_from(_blend(WEIGHTS_BY_DIV.get(clampi(div, 1, 3), WEIGHTS), {}, {}))





















static func pick_for(div: int, country: String = "", comp: String = "",
		season: float = -1.0) -> String:
	var d: int = clampi(div, 1, 3)
	var base: Dictionary = WEIGHTS_BY_DIV.get(d, WEIGHTS)
	if comp in NIGHT_COMPS and int(base.get("night", 0)) > 0:
		return "night"
	var geo: Dictionary = CLIMATE_BY_COUNTRY.get(country, {})
	var date: Dictionary = season_mult(season) if season >= 0.0 else {}
	return _pick_from(_blend(base, geo, date))


static func get_preset(id: String) -> Dictionary:
	return PRESETS.get(id, PRESETS["day"])



const NAMES: Dictionary = {
	"day": "Soleado",
	"overcast": "Nublado",
	"sunset": "Atardecer",
	"rain": "Lluvia",
	"night": "Noche",
	"snow": "Nieve",
}


const TINTS: Dictionary = {
	"day": Color("6fc3f0"),
	"overcast": Color("9aa6b4"),
	"sunset": Color("f0a25a"),
	"rain": Color("6d8fa8"),
	"night": Color("5f6ea8"),
	"snow": Color("cfe3f2"),
}










const RAIN_NAMES: Array[String] = ["Llovizna", "Lluvia", "Tormenta"]





static func display_name(id: String, level: int = -1) -> String:
	if id == "rain" and level >= 0:
		return RAIN_NAMES[clampi(level, 0, RAIN_NAMES.size() - 1)]
	return String(NAMES.get(id, NAMES["day"]))


static func tint(id: String) -> Color:
	return TINTS.get(id, TINTS["day"])













const HORA_NOCHE: int = 21
const HORA_ALBA: int = 6
const HORA_MANANA: int = 8
const HORA_TARDE: int = 19

static func franja_por_hora() -> String:
	var h: int = int(Time.get_datetime_dict_from_system().get("hour", 12))
	if h >= HORA_NOCHE or h < HORA_ALBA:
		return "night"
	if h < HORA_MANANA or h >= HORA_TARDE:
		return "sunset"
	return "day"










static func pick_por_hora(div: int, country: String = "", season: float = -1.0) -> String:
	var franja: String = franja_por_hora()
	if franja != "day":
		return franja
	for i in 8:
		var id: String = pick_for(div, country, "", season)
		if id != "night" and id != "sunset":
			return id
	return "day"
