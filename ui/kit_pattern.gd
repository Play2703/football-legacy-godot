class_name KitPattern
extends RefCounted













const W: int = 240
const H: int = 140
const STRIPE_PX: int = 20
const HOOP_PX: int = 18


const FALLBACK_A: Color = Color("2f6fd0")
const FALLBACK_B: Color = Color("f5f5f5")













static var _tex_cache: Dictionary = {}


static func stylebox(team: Dictionary, season: int = 1) -> StyleBoxTexture:
	var ck: String = "%s|%d|%s|%s|%s|%d" % [String(team.get("id", team.get("name", "?"))),
		season, str(team.get("kit")), str(team.get("kit_b", team.get("kit2"))),
		String(team.get("pattern", "solid")), Teams.local_pat_w(team)]
	var tex: ImageTexture = _tex_cache.get(ck)
	if tex == null:
		tex = ImageTexture.create_from_image(_paint(team, season))
		_tex_cache[ck] = tex
	var sb: StyleBoxTexture = StyleBoxTexture.new()
	sb.texture = tex
	sb.set_content_margin_all(26.0)
	return sb













static func _paint(team: Dictionary, season: int) -> Image:




	var t_kit: int = Teams.drift_season(team, season)

	var kit0: Color = Teams.local_shade(team, t_kit, _col(team, "kit", FALLBACK_A))
	var accent: Color = _col(team, "kit_b", _col(team, "kit2", FALLBACK_B))
	var a: Color = _mute(kit0)
	var b: Color = _mute(accent)

	var pat: String = Teams.local_pattern(team, t_kit)

	var pat_w: int = maxi(Teams.local_pat_w(team) * 6, STRIPE_PX)
	var trim: String = Teams.local_trim(team, t_kit)
	var trim_col: Color = _mute(accent).lightened(0.1)
	var bb: Rect2i = Rect2i(0, 0, W, H)
	var img: Image = Image.create(W, H, false, Image.FORMAT_RGBA8)


	for y in H:
		for x in W:
			var col: Color = KitPatternGeo.pixel(pat, x, y, bb, a, b, pat_w)
			if trim != "none" and KitPatternGeo.trim_hit(trim, x, y, bb):
				col = trim_col
			img.set_pixel(x, y, col)
	return img





static func _mute(c: Color) -> Color:
	var m: Color = c.lerp(CareerTheme.BG_DEEP, 0.68)
	while m.get_luminance() > 0.28:
		m = m.darkened(0.12)
	return m


static func _col(team: Dictionary, key: String, fallback: Color) -> Color:
	var c: Variant = team.get(key)
	return c if c is Color else fallback
