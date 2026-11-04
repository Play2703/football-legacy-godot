class_name WeatherWear
extends RefCounted






































const DIRT_TARGET: Dictionary = {
	"rain": Color(0.8, 0.74, 0.62),
	"snow": Color(0.88, 0.91, 0.96),
	"overcast": Color(0.93, 0.91, 0.87),
	"day": Color(0.97, 0.96, 0.94),
	"sunset": Color(0.97, 0.96, 0.94),
	"night": Color(0.96, 0.95, 0.93),
}


const DIRT_CLEAN: Color = Color(1.0, 1.0, 1.0)








const DIRT_CURVE: float = 0.55





const DIRT_MAX: float = 0.85






static func ball_dirt(weather_id: String, t: float) -> Color:
	var target: Color = DIRT_TARGET.get(weather_id, DIRT_CLEAN)
	var k: float = pow(clampf(t, 0.0, 1.0), DIRT_CURVE) * DIRT_MAX
	return DIRT_CLEAN.lerp(target, k)





















const MARK_COLOR: Dictionary = {
	"rain": Color(0.2, 0.16, 0.11, 0.34),
	"snow": Color(0.28, 0.3, 0.34, 0.46),
}



static func marks_on(weather_id: String) -> bool:
	return MARK_COLOR.has(weather_id)


static func mark_color(weather_id: String) -> Color:
	return MARK_COLOR.get(weather_id, Color(0.2, 0.18, 0.14, 0.3))






const MARK_D_MIN: float = 0.22
const MARK_D_MAX: float = 0.75

static func mark_size(vy: float) -> float:
	return lerpf(MARK_D_MIN, MARK_D_MAX, clampf((absf(vy) - 2.0) / 12.0, 0.0, 1.0))















const SCAR_COLOR: Dictionary = {
	"rain": Color(0.13, 0.1, 0.07, 0.74),
	"snow": Color(0.2, 0.22, 0.19, 0.82),
}









static func scar_color(weather_id: String) -> Color:
	return SCAR_COLOR.get(weather_id, Color(0.34, 0.23, 0.11, 0.88))





















const BREATH_COLD: float = 0.45






static func breath_on(weather_id: String, cold: float) -> bool:
	if weather_id == "snow":
		return true
	return cold >= BREATH_COLD







const BREATH_EVERY: Vector2 = Vector2(3.4, 1.5)

static func breath_period(esfuerzo: float) -> float:
	return lerpf(BREATH_EVERY.x, BREATH_EVERY.y, clampf(esfuerzo, 0.0, 1.0))
