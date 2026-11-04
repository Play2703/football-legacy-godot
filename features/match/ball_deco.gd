class_name BallDeco
extends RefCounted















const BASE_STYLE: String = "classic"















const AXIS_FRAMES: int = 24






const AXIS_FPS: float = 10.0 * float(AXIS_FRAMES) / 4.0




const DARK_CUT: float = 0.35







const OUTLINE_CUT: float = 0.13



const REF_LIGHT: float = 0.93




const D_MIN: float = 0.15
const D_MAX: float = 0.32

















const PATTERNS: Array[String] = ["plain", "stars", "spiral", "band",
	"stripes", "chevron", "cross", "dots", "ring", "wave", "tri"]






const COMP_BALL: Dictionary = {
	"copa": {"panel": Color("f2f0ea"), "accent": Color("c62b2b"), "pattern": "band"},
	"champions": {"panel": Color("eef2ff"), "accent": Color("1b2f8f"), "pattern": "stars"},


	"europa": {"panel": Color("fff1e6"), "accent": Color("ff7a1a"), "pattern": "wave"},
	"conference": {"panel": Color("e8fbfb"), "accent": Color("29c2c9"), "pattern": "tri"},
	"cwc": {"panel": Color("f6e9c8"), "accent": Color("9a7318"), "pattern": "ring"},
	"clasif": {"panel": Color("eef5f0"), "accent": Color("1f7a58"), "pattern": "dots"},
	"mundial": {"panel": Color("f7e6a8"), "accent": Color("8a6410"), "pattern": "spiral"},








	"libertadores": {"panel": Color("f8eef2"), "accent": Color("8c0d3e"), "pattern": "chevron"},
	"sudamericana": {"panel": Color("eaf5fc"), "accent": Color("1477b0"), "pattern": "stripes"},
	"concacaf": {"panel": Color("fbeefa"), "accent": Color("b02ea2"), "pattern": "cross"},


	"oriente": {"panel": Color("fdeef2"), "accent": Color("b8325a"), "pattern": "dots"},
	"sol": {"panel": Color("eef0ff"), "accent": Color("3646b0"), "pattern": "ring"},



	"atlas": {"panel": Color("f6efe4"), "accent": Color("8c6a3c"), "pattern": "tri"},
	"baobab": {"panel": Color("f3ebe2"), "accent": Color("6b4220"), "pattern": "chevron"},



	"coral": {"panel": Color("f0f6f7"), "accent": Color("12808f"), "pattern": "band"},
}







const CONFED_BALL: Dictionary = {
	"UEFA": {"panel": Color("f4f4f2"), "accent": Color("1b3f9a"), "pattern": "chevron"},
	"CONMEBOL": {"panel": Color("f4f4f2"), "accent": Color("1f8a4a"), "pattern": "stripes"},
	"CONCACAF": {"panel": Color("f4f4f2"), "accent": Color("c62b2b"), "pattern": "cross"},
	"AFC": {"panel": Color("f4f4f2"), "accent": Color("d0342c"), "pattern": "dots"},
	"CAF": {"panel": Color("f4f4f2"), "accent": Color("1f7a58"), "pattern": "ring"},
	"OFC": {"panel": Color("f4f4f2"), "accent": Color("2b8fb0"), "pattern": "wave"},
}

const CONFED_DEFAULT: Dictionary = {"panel": Color("f4f4f2"), "accent": Color("8a6410"),
	"pattern": "cross"}








const LEAGUE_DECO: Dictionary = {
	"España": {"pattern": "chevron", "accent2": Color("c62b2b")},
	"Inglaterra": {"pattern": "stripes"},
	"Italia": {"pattern": "ring", "accent2": Color("2e9e5a")},
	"Alemania": {"pattern": "cross", "accent2": Color("222222")},
	"Francia": {"pattern": "wave", "accent2": Color("c62b2b")},
	"Portugal": {"pattern": "dots", "accent2": Color("c62b2b")},
	"Países Bajos": {"pattern": "band"},
	"Bélgica": {"pattern": "tri", "accent2": Color("c62b2b")},
	"México": {"pattern": "stars", "accent2": Color("c62b2b")},
	"Brasil": {"pattern": "wave", "accent2": Color("1f8a4a")},
	"Argentina": {"pattern": "stripes"},
	"Estados Unidos": {"pattern": "dots", "accent2": Color("c62b2b")},
	"Arabia Saudí": {"pattern": "ring"},
	"Turquía": {"pattern": "chevron"},
	"Escocia": {"pattern": "stripes"},
	"Grecia": {"pattern": "band"},
	"Ucrania": {"pattern": "wave", "accent2": Color("1a5fd0")},
	"Austria": {"pattern": "cross"},
	"Suiza": {"pattern": "cross", "accent2": Color("f4f4f2")},
	"Chequia": {"pattern": "chevron"},
	"Croacia": {"pattern": "cross", "accent2": Color("1a3fb0")},
	"Serbia": {"pattern": "ring"},
	"Dinamarca": {"pattern": "stripes"},
	"Noruega": {"pattern": "chevron"},
	"Japón": {"pattern": "dots"},
	"Corea del Sur": {"pattern": "ring", "accent2": Color("1a3fb0")},
	"Colombia": {"pattern": "band", "accent2": Color("1a3fb0")},
	"Chile": {"pattern": "stars"},
	"Uruguay": {"pattern": "wave"},
	"Egipto": {"pattern": "tri"},



	"Paraguay": {"pattern": "tri", "accent2": Color("c62b2b")},
	"Ecuador": {"pattern": "chevron", "accent2": Color("8a6410")},
	"Perú": {"pattern": "ring"},
	"Bolivia": {"pattern": "dots", "accent2": Color("c62b2b")},
	"Venezuela": {"pattern": "cross", "accent2": Color("1a3fb0")},





	"Marruecos": {"pattern": "band", "accent2": Color("c62b2b")},
	"Túnez": {"pattern": "spiral"},




	"Nueva Zelanda": {"pattern": "stars", "accent2": Color("1a3fb0")},












	"Suecia": {"pattern": "cross", "accent2": Color("c9a227")},
	"Rumanía": {"pattern": "chevron", "accent2": Color("1a3fb0")},






	"Bosnia y Herzegovina": {"pattern": "tri", "accent2": Color("c9a227")},
}




const LEAGUE_PANEL: Color = Color("f4f4f2")



static var _cache: Dictionary = {}




static func deco_for(fixture: Dictionary) -> Dictionary:
	var id: String = _comp_id(fixture)
	if id == "mundial" and String(GameState.nat_state.get("comp", "")) == "cont":
		var confed: String = Nations.confed_of(Career.nationality)
		var c: Dictionary = CONFED_BALL.get(confed, CONFED_DEFAULT).duplicate()
		c["key"] = "continental_%s" % confed
		return c
	if COMP_BALL.has(id):
		var d: Dictionary = COMP_BALL[id].duplicate()
		d["key"] = id
		return d


	var country: String = Teams.country_of(GameState.player_team_id)
	var extra: Dictionary = LEAGUE_DECO.get(country, {})
	var out: Dictionary = {
		"panel": LEAGUE_PANEL,
		"accent": Teams.accent(country),
		"pattern": String(extra.get("pattern", "plain")),
		"key": "liga_%s" % country,
	}
	if extra.has("accent2"):
		out["accent2"] = extra["accent2"]
	return out




static func _comp_id(fixture: Dictionary) -> String:
	if String(fixture.get("comp", "")) == "cwc":
		return "cwc"
	return Competitions.id_of(fixture)

















static func frames_for(fixture: Dictionary, solo_idle: bool = false) -> SpriteFrames:
	var deco: Dictionary = deco_for(fixture)
	var key: String = String(deco["key"]) +("|idle" if solo_idle else "")
	if _cache.has(key):
		return _cache[key]
	var base: String = "res://assets/sprites/objects/ball_%s_" % BASE_STYLE
	var idle_path: String = base + "idle.png"
	var idle_img: Image = _img(idle_path)
	if idle_img == null:
		return null
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.add_frame("idle", _recolor(idle_img, deco))
	if solo_idle:
		_cache[key] = frames
		return frames
	frames.add_animation("roll")
	frames.set_animation_loop("roll", true)
	frames.set_animation_speed("roll", 10.0)
	for i in 4:
		var path: String = "%s%d.png" % [base, i]
		var im: Image = _img(path)
		if im == null:
			im = _img("res://assets/sprites/objects/ball_roll_%d.png" % i)
		if im != null:
			frames.add_frame("roll", _recolor(im, deco))





	for eje in ["rollfwd", "rollside"]:
		var puestos: int = 0
		frames.add_animation(eje)
		frames.set_animation_loop(eje, true)
		frames.set_animation_speed(eje, AXIS_FPS)
		for i in AXIS_FRAMES:
			var ruta: String = "res://assets/sprites/objects/ball_%s_%d.png" % [eje, i]
			var im2: Image = _img(ruta)
			if im2 != null:
				frames.add_frame(eje, _recolor(im2, deco))
				puestos += 1
		if puestos == 0:
			frames.remove_animation(eje)
	_cache[key] = frames
	return frames













static var _imgs: Dictionary = {}



static func _img(ruta: String) -> Image:
	if _imgs.has(ruta):
		return _imgs[ruta]
	if not ResourceLoader.exists(ruta):
		return null
	var tex: Texture2D = load(ruta)
	if tex == null:
		return null
	var im: Image = tex.get_image()
	if im != null and im.is_compressed():
		im.decompress()
	_imgs[ruta] = im
	return im





static func _recolor(src: Image, deco: Dictionary) -> ImageTexture:
	var img: Image = Image.create(src.get_width(), src.get_height(), false, Image.FORMAT_RGBA8)
	var panel: Color = deco["panel"]
	var accent: Color = deco["accent"]

	var accent2: Color = deco.get("accent2", accent)
	var pattern: String = String(deco.get("pattern", "plain"))
	var liso: bool = pattern == "plain"
	var w: int = src.get_width()
	var h: int = src.get_height()
	var cx: float = float(w) * 0.5
	var cy: float = float(h) * 0.5
	var r: float = minf(cx, cy)
	for y in h:
		for x in w:
			var p: Color = src.get_pixel(x, y)
			if p.a <= 0.01:
				img.set_pixel(x, y, Color(0, 0, 0, 0))
				continue
			var lum: float = p.get_luminance()
			var out: Color
			if lum < OUTLINE_CUT:

				img.set_pixel(x, y, p)
				continue
			elif lum < DARK_CUT:


				out = accent * clampf(
					0.62 +(lum - D_MIN) /(D_MAX - D_MIN) * 0.5, 0.5, 1.2)
			else:


				out = panel * clampf(lum / REF_LIGHT, 0.4, 1.1)
				if not liso and _in_pattern(pattern, float(x) - cx, float(y) - cy, r):
					out = accent2.lerp(out, 0.25)
			out.a = p.a
			img.set_pixel(x, y, out)
	return ImageTexture.create_from_image(img)




static func _in_pattern(pattern: String, dx: float, dy: float, r: float) -> bool:
	match pattern:
		"stars":


			for c in [Vector2(-0.4, -0.06), Vector2(0.1, -0.42), Vector2(0.4, 0.26)]:
				var sx: float = dx - c.x * r
				var sy: float = dy - c.y * r
				if absf(sx) + absf(sy) <= r * 0.13:
					return true
			return false
		"spiral":

			var d: float = sqrt(dx * dx + dy * dy) / maxf(r, 0.001)
			var a: float = atan2(dy, dx) + d * 2.4
			return fposmod(a, PI * 0.5) < 0.34
		"band":


			var t: float = dy + dx * 0.22
			return absf(absf(t) - r * 0.3) < r * 0.075
		"stripes":


			var t: float = dx - dy * 0.6
			return fposmod(t, r * 0.36) < r * 0.07
		"chevron":

			var t: float = absf(dx) * 0.7 + dy
			return absf(t) < r * 0.09 or absf(t - r * 0.45) < r * 0.09
		"cross":

			return (absf(dx) < r * 0.07 or absf(dy) < r * 0.07) \
					and sqrt(dx * dx + dy * dy) < r * 0.75
		"dots":

			for k in 6:
				var a: float = float(k) * PI / 3.0 + 0.3
				var sx: float = dx - cos(a) * r * 0.55
				var sy: float = dy - sin(a) * r * 0.55
				if sqrt(sx * sx + sy * sy) < r * 0.15:
					return true
			return false
		"ring":
			var d: float = sqrt(dx * dx + dy * dy)
			return absf(d - r * 0.58) < r * 0.07
		"wave":

			var t: float = dy - sin(dx / r * 3.2) * r * 0.16
			return absf(t) < r * 0.09
		"tri":

			for c in [Vector2(-0.35, 0.35), Vector2(0.35, -0.35), Vector2(0.4, 0.4)]:
				var sx: float = dx - c.x * r
				var sy: float = dy - c.y * r
				if sy > - r * 0.16 and sy < r * 0.16 and absf(sx) <(sy + r * 0.16):
					return true
			return false
		_:
			return false
