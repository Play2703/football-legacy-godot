class_name CrestView
extends Control






















const FONT: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")


const SHAPES: Array[String] = ["shield", "round", "scudetto", "hex", "pennant",
	"diamond", "banner", "keystone", "french", "spade", "rounded_square",
	"heater", "swallowtail", "oval", "arch", "trapeze", "pentagon"]


const PATTERNS: Array[String] = ["solid", "solid", "solid", "halved", "pale",
	"fess", "vstripes", "hoops", "quartered", "sash", "cross", "chevron",
	"chief", "base", "bordure", "per_bend", "pile", "lozenge", "tri_stripes"]


const TONES: Array[String] = ["alt", "alt", "alt", "alt", "dark", "light"]

const EMBLEMS: Array[String] = ["none", "none", "none", "none",
	"letters", "letters", "monogram", "monogram",
	"star", "double_star", "ring", "ball",
	"eagle", "bull", "crown", "bolt", "crescent", "tower", "anchor", "gear",
	"leaf", "lion", "wolf", "rooster", "fleur", "ship", "sun", "heart",
	"trident", "cannon",
	"horse", "dragon", "tree", "fish", "swords", "key", "mountain", "flame"]

const RIMS: Array[String] = ["dark", "dark", "dark", "dark", "gold", "white",
	"black"]
















const HALO_EDGE: float = 1.05
const HALO_SHADOW: float = 1.11
const HALO_DROP: float = 0.035



const KIT_TO_CREST: Dictionary = {
	"half": "halved", "diagonal": "sash", "checkers": "quartered",
	"hoops": "hoops", "sash": "sash",
	"quarters": "quartered", "chevron": "chevron",
}

var _kit: Color = Color("1d74d0")
var _kit2: Color = Color("f5f5f5")
var _abbrev: String = "?"



var _letter: String = ""
var _shape: String = "shield"
var _pattern: String = "solid"
var _tone: String = "alt"
var _emblem: String = "none"



var _emblem_tone: String = ""
var _rim: String = "dark"





var _nation_id: String = ""




var _logo_id: String = ""
















var _logo_tex: Texture2D = null
var _logo_ver: int = -1
















var _c_escudo: Vector2 = Vector2.ZERO
var _r_escudo: float = 1.0
var _halo: bool = false


func set_halo(on: bool) -> void:
	_halo = on
	queue_redraw()


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE



	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	resized.connect(queue_redraw)




func set_team(team: Dictionary) -> void:
	_kit = team.get("kit", _kit)
	_kit2 = team.get("kit2", _kit2)
	_abbrev = String(team.get("abbrev", "?"))
	_letter = String(team.get("letter", ""))


	_nation_id = String(team.get("id", "")) if bool(team.get("is_nation", false)) \
			and Flags.has(String(team.get("id", ""))) else ""


	var _id: String = String(team.get("id", ""))



	var clave: String = CrestLogos.key_of(team)
	_logo_id = clave if CrestLogos.has(clave) else ""


	_logo_tex = null
	var t: Dictionary = traits_of(team)
	_shape = String(t["shape"])
	_pattern = String(t["crest_pattern"])
	_tone = String(t["crest_tone"])
	_emblem = String(t["emblem"])
	_emblem_tone = String(t["emblem_tone"])
	_rim = String(t["rim"])
	queue_redraw()





func is_nation() -> bool:
	return not _nation_id.is_empty()





func is_logo() -> bool:
	return not _logo_id.is_empty() and CrestLogos.texture(_logo_id) != null









func tinta_en(tam: Vector2) -> Rect2:
	if not _logo_id.is_empty():
		var tex: Texture2D = CrestLogos.texture(_logo_id)
		if tex != null and tex.get_width() > 0 and tex.get_height() > 0:
			var ts: Vector2 = tex.get_size()
			var k: float = minf(tam.x / ts.x, tam.y / ts.y)
			return Rect2((tam - ts * k) * 0.5, ts * k)
	var forma: String = _shape
	if not _nation_id.is_empty() and Flags.texture(_nation_id) != null:
		forma = "shield"
	var r: float = minf(tam.x, tam.y) * 0.5 *(HALO_EDGE if _halo else 1.0)
	var pts: PackedVector2Array = _shape_poly(tam * 0.5, r, forma)
	if pts.is_empty():
		return Rect2(Vector2.ZERO, tam)
	var caja: Rect2 = Rect2(pts[0], Vector2.ZERO)
	for p in pts:
		caja = caja.expand(p)
	return caja








static func traits_of(team: Dictionary) -> Dictionary:


	var s: int = absi(hash(String(team.get("abbrev", "?"))))
	var kit_pat: String = String(team.get("pattern", ""))
	var out: Dictionary = {
		"shape": String(team.get("shape", SHAPES[s % SHAPES.size()])),
		"crest_pattern": String(team.get("crest_pattern",
			KIT_TO_CREST.get(kit_pat, PATTERNS[(s / 11) % PATTERNS.size()]))),
		"crest_tone": String(team.get("crest_tone", TONES[(s / 29) % TONES.size()])),
		"emblem": String(team.get("emblem", EMBLEMS[(s / 131) % EMBLEMS.size()])),

		"emblem_tone": String(team.get("emblem_tone", "")),
		"rim": String(team.get("rim", RIMS[(s / 271) % RIMS.size()])),
	}
	return out











func _draw() -> void:
	_draw_cuerpo()
	if lleva_estrella():
		_draw_estrella()





const ESTRELLA_MIN_PX: float = 32.0




func lleva_estrella() -> bool:
	return estrella_visible(_nation_id, minf(size.x, size.y))







static func estrella_visible(nation_id: String, lado: float) -> bool:
	if nation_id.is_empty() or lado < ESTRELLA_MIN_PX:
		return false
	return Pecho.es_campeon_mundial(nation_id)







func _draw_estrella() -> void:
	var c: Vector2 = size * 0.5
	var r: float = minf(size.x, size.y) * 0.5
	var centro: Vector2 = c - Vector2(0.0, r * 0.74)
	var radio: float = r * 0.24
	_poly(_star(centro, radio * 1.32, radio * 0.62), CareerTheme.SHADOW_HARD)
	_poly(_star(centro, radio, radio * 0.42), CareerTheme.MONEY)




func _draw_cuerpo() -> void:








	if not _logo_id.is_empty():
		if _logo_tex == null or _logo_ver != CrestLogos.version:
			_logo_tex = CrestLogos.texture(_logo_id)
			_logo_ver = CrestLogos.version
		if _logo_tex != null:
			texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
			_draw_logo(_logo_tex)
			return
	if not _nation_id.is_empty():
		var tex: Texture2D = Flags.texture(_nation_id)
		if tex != null:
			texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
			_draw_nation(tex)
			return
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	var c: Vector2 = size * 0.5
	var r: float = minf(size.x, size.y) * 0.5
	var border: Color = _rim_color()
	var ink: Color = _pattern_color()
	var inner_r: float = r * 0.9
	var outer: PackedVector2Array = _shape_poly(c, r, _shape)
	var inner: PackedVector2Array = _shape_poly(c, inner_r, _shape)
	if _halo:




		_poly(_shape_poly(c + Vector2(0.0, r * HALO_DROP), r * HALO_SHADOW, _shape),
			Color(0.03, 0.04, 0.06, 0.55))
		_poly(_shape_poly(c, r * HALO_EDGE, _shape), Color(0.94, 0.95, 0.97, 0.9))
	_poly(outer, border)
	_poly(inner, _kit)
	if _pattern == "bordure":


		_poly(inner, ink)
		_poly(_shape_poly(c, inner_r * 0.78, _shape), _kit)
	else:

		for piece in _pattern_pieces(c, inner_r, _pattern):
			for clipped in Geometry2D.intersect_polygons(piece, inner):
				_poly(clipped, ink)
	_draw_emblem(c, inner_r, _emblem, border)




	for brillo in Geometry2D.intersect_polygons(
			_ngon(c - Vector2(0.0, r * 0.42), r * 0.5, 28, 0.0), outer):
		_poly(brillo, Color(1.0, 1.0, 1.0, 0.06))




func _rim_color() -> Color:
	return rim_col(_rim, _kit)





static func rim_col(rim: String, kit: Color) -> Color:
	match rim:
		"gold":
			return contrast_to(Color("d8a629"), kit)
		"white":
			return contrast_to(Color("eceff3"), kit)
		"black":
			return contrast_to(Color("14161a"), kit)
		_:
			return contrast_to(kit.darkened(0.55), kit)



func _pattern_color() -> Color:
	return pattern_col(_tone, _kit, _kit2)


static func pattern_col(tone: String, kit: Color, kit2: Color) -> Color:
	match tone:
		"dark":
			return contrast_to(kit.darkened(0.35), kit)
		"light":
			return contrast_to(kit.lightened(0.35), kit)
		_:
			return contrast_to(kit2, kit)





func _contrast(col: Color) -> Color:
	return contrast_to(col, _kit)


static func contrast_to(col: Color, kit: Color) -> Color:
	const MIN_DELTA: float = 0.22





	const MIN_RGB: float = 0.2
	var lk: float = lum(kit)
	if absf(lum(col) - lk) >= MIN_DELTA and rgb_dist(col, kit) >= MIN_RGB:
		return col

	var out: Color = col.lightened(0.55) if lk < 0.5 else col.darkened(0.55)
	if absf(lum(out) - lk) >= MIN_DELTA and rgb_dist(out, kit) >= MIN_RGB:
		return out


	return Color("14161a") if lk >= 0.5 else Color("f2f4f7")




static func rgb_dist(a: Color, b: Color) -> float:
	return (absf(a.r - b.r) + absf(a.g - b.g) + absf(a.b - b.b)) / 3.0


func _lum(c: Color) -> float:
	return lum(c)


static func lum(c: Color) -> float:
	return 0.2126 * c.r + 0.7152 * c.g + 0.0722 * c.b






const SHAPE_TO_PATCH: Dictionary = {
	"round": "round", "hex": "round",
	"diamond": "diamond", "lozenge": "diamond",
	"banner": "square", "keystone": "square", "french": "square",
	"rounded_square": "square",
	"shield": "shield", "scudetto": "shield", "pennant": "shield",
	"spade": "shield", "octagon": "round",
	"heater": "shield", "swallowtail": "square", "oval": "round",
	"arch": "round", "trapeze": "square", "pentagon": "round",
}













static func patch_for(team: Dictionary) -> Dictionary:


	if bool(team.get("is_nation", false)) and Flags.has(String(team.get("id", ""))):
		return {"crest_flag": String(team.get("id", ""))}
	var kit: Color = team.get("kit", Color("1d74d0"))
	var kit2: Color = team.get("kit2", Color("f5f5f5"))
	var t: Dictionary = traits_of(team)
	var out: Dictionary = {
		"crest_rim": rim_col(String(t["rim"]), kit),
		"crest_fill": pattern_col(String(t["crest_tone"]), kit, kit2),
		"crest_shape": String(SHAPE_TO_PATCH.get(String(t["shape"]), "shield")),
	}




	if String(t["emblem"]) in ["monogram", "letters"]:
		var ch: String = String(team.get("letter", ""))
		if ch.is_empty():
			ch = String(team.get("abbrev", ""))
		if not ch.is_empty():
			out["crest_letter"] = ch.substr(0, 1).to_upper()
	return out




func _shape_poly(c: Vector2, r: float, shape: String) -> PackedVector2Array:
	match shape:
		"round":
			return _ngon(c, r, 48, - PI * 0.5)
		"octagon":
			return _ngon(c, r, 8, - PI / 8.0)
		"hex":
			return _ngon(c, r, 6, - PI * 0.5)
		"diamond":
			return PackedVector2Array([
				c + Vector2(0.0, - r), c + Vector2(r * 0.82, 0.0),
				c + Vector2(0.0, r), c + Vector2(- r * 0.82, 0.0)])
		"pennant":

			return PackedVector2Array([
				c + Vector2(- r * 0.82, - r * 0.86), c + Vector2(r * 0.82, - r * 0.86),
				c + Vector2(0.0, r)])
		"banner":

			return PackedVector2Array([
				c + Vector2(- r * 0.72, - r * 0.95), c + Vector2(r * 0.72, - r * 0.95),
				c + Vector2(r * 0.72, r * 0.95), c + Vector2(0.0, r * 0.42),
				c + Vector2(- r * 0.72, r * 0.95)])
		"keystone":


			return PackedVector2Array([
				c + Vector2(- r * 0.92, - r * 0.8), c + Vector2(r * 0.92, - r * 0.8),
				c + Vector2(r * 0.52, r * 0.9), c + Vector2(- r * 0.52, r * 0.9)])
		"french":

			var fr: PackedVector2Array = PackedVector2Array([
				c + Vector2(- r * 0.8, - r * 0.9), c + Vector2(r * 0.8, - r * 0.9),
				c + Vector2(r * 0.8, r * 0.3)])
			for i in 13:
				var fa: float = float(i) / 12.0 * PI
				fr.append(c + Vector2(cos(fa) * r * 0.8, r * 0.3 + sin(fa) * r * 0.68))
			fr.append(c + Vector2(- r * 0.8, r * 0.3))
			return fr
		"spade":

			var sp: PackedVector2Array = PackedVector2Array()
			for i in 21:
				var sa: float = PI + float(i) / 20.0 * PI
				sp.append(c + Vector2(cos(sa) * r * 0.84, sin(sa) * r * 0.9 - r * 0.05))
			sp.append(c + Vector2(r * 0.62, r * 0.3))
			sp.append(c + Vector2(0.0, r))
			sp.append(c + Vector2(- r * 0.62, r * 0.3))
			return sp
		"rounded_square":

			var rs: PackedVector2Array = PackedVector2Array()
			var k: float = r * 0.78
			var rad: float = r * 0.34
			var corners: Array[Vector2] = [Vector2(k - rad, - k + rad),
				Vector2(k - rad, k - rad), Vector2(- k + rad, k - rad),
				Vector2(- k + rad, - k + rad)]
			for ci in 4:
				var base: float = - PI * 0.5 + float(ci) * PI * 0.5
				for j in 7:
					var ra: float = base + float(j) / 6.0 * PI * 0.5
					rs.append(c + corners[ci] + Vector2(cos(ra), sin(ra)) * rad)
			return rs
		"scudetto":

			var pts: PackedVector2Array = PackedVector2Array()
			for i in 17:
				var a: float = PI + float(i) / 16.0 * PI
				pts.append(c + Vector2(cos(a) * r * 0.86, sin(a) * r * 0.72 - r * 0.02))
			pts.append(c + Vector2(r * 0.5, r * 0.42))
			pts.append(c + Vector2(0.0, r))
			pts.append(c + Vector2(- r * 0.5, r * 0.42))
			return pts
		"heater":



			var ht: PackedVector2Array = PackedVector2Array([
				c + Vector2(- r * 0.8, - r * 0.9), c + Vector2(r * 0.8, - r * 0.9)])
			for i in 15:
				var t2: float = float(i) / 14.0

				ht.append(c + Vector2(r * 0.8 *(1.0 - t2 * t2 * t2),
					- r * 0.9 + t2 * r * 1.9))
			for i in 15:
				var t3: float = 1.0 - float(i) / 14.0
				ht.append(c + Vector2(- r * 0.8 *(1.0 - t3 * t3 * t3),
					- r * 0.9 + t3 * r * 1.9))
			return ht
		"swallowtail":


			return PackedVector2Array([
				c + Vector2(- r * 0.92, - r * 0.72), c + Vector2(r * 0.92, - r * 0.72),
				c + Vector2(r * 0.42, 0.0), c + Vector2(r * 0.92, r * 0.72),
				c + Vector2(- r * 0.92, r * 0.72)])
		"oval":


			var ov: PackedVector2Array = PackedVector2Array()
			for i in 40:
				var oa: float = float(i) / 40.0 * TAU
				ov.append(c + Vector2(cos(oa) * r * 0.74, sin(oa) * r * 0.98))
			return ov
		"arch":


			var ar: PackedVector2Array = PackedVector2Array()
			for i in 21:
				var aa: float = PI + float(i) / 20.0 * PI
				ar.append(c + Vector2(cos(aa) * r * 0.82, sin(aa) * r * 0.86 + r * 0.1))
			ar.append(c + Vector2(r * 0.82, r * 0.9))
			ar.append(c + Vector2(- r * 0.82, r * 0.9))
			return ar
		"trapeze":



			return PackedVector2Array([
				c + Vector2(- r * 0.54, - r * 0.86), c + Vector2(r * 0.54, - r * 0.86),
				c + Vector2(r * 0.94, r * 0.82), c + Vector2(- r * 0.94, r * 0.82)])
		"pentagon":
			return _ngon(c, r * 0.98, 5, - PI * 0.5)
		_:
			return PackedVector2Array([
				c + Vector2(- r * 0.82, - r * 0.86), c + Vector2(r * 0.82, - r * 0.86),
				c + Vector2(r * 0.82, r * 0.1), c + Vector2(0.0, r),
				c + Vector2(- r * 0.82, r * 0.1)])


func _ngon(c: Vector2, r: float, n: int, start: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in n:
		var a: float = start + float(i) / float(n) * TAU
		pts.append(c + Vector2(cos(a), sin(a)) * r)
	return pts




func _pattern_pieces(c: Vector2, r: float, pattern: String) -> Array:
	match pattern:
		"halved":
			return [_rect(c + Vector2(r * 0.5, 0.0), r, r * 1.4)]
		"pale":
			return [_band(c, - PI * 0.5, r * 0.24, r * 1.4)]
		"fess":
			return [_band(c, 0.0, r * 0.24, r * 1.4)]
		"cross":
			return [_band(c, - PI * 0.5, r * 0.18, r * 1.4),
				_band(c, 0.0, r * 0.18, r * 1.4)]
		"sash":
			return [_band(c, - PI * 0.25, r * 0.2, r * 1.7)]
		"vstripes":
			return [_band(c + Vector2(- r * 0.44, 0.0), - PI * 0.5, r * 0.14, r * 1.4),
				_band(c + Vector2(r * 0.44, 0.0), - PI * 0.5, r * 0.14, r * 1.4)]
		"tri_stripes":
			return [_band(c + Vector2(- r * 0.58, 0.0), - PI * 0.5, r * 0.12, r * 1.4),
				_band(c, - PI * 0.5, r * 0.12, r * 1.4),
				_band(c + Vector2(r * 0.58, 0.0), - PI * 0.5, r * 0.12, r * 1.4)]
		"hoops":
			return [_band(c + Vector2(0.0, - r * 0.4), 0.0, r * 0.14, r * 1.4),
				_band(c + Vector2(0.0, r * 0.24), 0.0, r * 0.14, r * 1.4)]
		"quartered":






			return [_rect(c + Vector2(r * 0.75, - r * 0.75), r * 0.75, r * 0.75),
				_rect(c + Vector2(- r * 0.75, r * 0.75), r * 0.75, r * 0.75)]
		"chevron":

			return [_band(c + Vector2(- r * 0.4, - r * 0.1), - PI * 0.3, r * 0.16, r * 0.9),
				_band(c + Vector2(r * 0.4, - r * 0.1), PI * 0.3, r * 0.16, r * 0.9)]
		"chief":

			return [_rect(c + Vector2(0.0, - r * 1.05), r * 1.4, r * 0.42)]
		"base":
			return [_rect(c + Vector2(0.0, r * 1.0), r * 1.4, r * 0.42)]
		"per_bend":


			var dir: Vector2 = Vector2(cos(PI * 0.25), sin(PI * 0.25))
			var perp: Vector2 = Vector2(- dir.y, dir.x)
			return [_band(c - perp * r, PI * 0.25, r, r * 2.0)]
		"pile":

			return [PackedVector2Array([
				c + Vector2(- r * 0.45, - r * 1.2), c + Vector2(r * 0.45, - r * 1.2),
				c + Vector2(0.0, r * 0.9)])]
		"lozenge":
			return [PackedVector2Array([
				c + Vector2(0.0, - r * 0.62), c + Vector2(r * 0.44, 0.0),
				c + Vector2(0.0, r * 0.62), c + Vector2(- r * 0.44, 0.0)])]
		_:
			return []




func _band(center: Vector2, angle: float, half_w: float, half_len: float) -> PackedVector2Array:
	var dir: Vector2 = Vector2(cos(angle), sin(angle))
	var perp: Vector2 = Vector2(- dir.y, dir.x)
	return PackedVector2Array([
		center + dir * half_len + perp * half_w,
		center + dir * half_len - perp * half_w,
		center - dir * half_len - perp * half_w,
		center - dir * half_len + perp * half_w])



func _rect(center: Vector2, hw: float, hh: float) -> PackedVector2Array:
	return PackedVector2Array([
		center + Vector2(- hw, - hh), center + Vector2(hw, - hh),
		center + Vector2(hw, hh), center + Vector2(- hw, hh)])









const EMBLEM_SHAPES: Dictionary = {








	"eagle": [[Vector2(0, -0.98), Vector2(0.16, -0.72), Vector2(0.3, -0.55),
		Vector2(0.62, -0.62), Vector2(0.98, -0.42), Vector2(0.74, -0.3),
		Vector2(0.92, -0.1), Vector2(0.62, -0.04), Vector2(0.74, 0.16),
		Vector2(0.4, 0.14), Vector2(0.26, 0.34), Vector2(0.16, 0.3),
		Vector2(0.14, 0.62), Vector2(0, 0.95), Vector2(-0.14, 0.62),
		Vector2(-0.16, 0.3), Vector2(-0.26, 0.34), Vector2(-0.4, 0.14),
		Vector2(-0.74, 0.16), Vector2(-0.62, -0.04), Vector2(-0.92, -0.1),
		Vector2(-0.74, -0.3), Vector2(-0.98, -0.42), Vector2(-0.62, -0.62),
		Vector2(-0.3, -0.55), Vector2(-0.16, -0.72)]],



	"bull": [[Vector2(-0.98, -0.34), Vector2(-0.92, -0.72), Vector2(-0.62, -0.6),
		Vector2(-0.44, -0.4), Vector2(-0.3, -0.7), Vector2(-0.1, -0.84),
		Vector2(0.1, -0.84), Vector2(0.3, -0.7), Vector2(0.44, -0.4),
		Vector2(0.62, -0.6), Vector2(0.92, -0.72), Vector2(0.98, -0.34),
		Vector2(0.74, -0.2), Vector2(0.52, -0.3), Vector2(0.46, 0.1),
		Vector2(0.3, 0.48), Vector2(0.16, 0.76), Vector2(0.0, 0.88),
		Vector2(-0.16, 0.76), Vector2(-0.3, 0.48), Vector2(-0.46, 0.1),
		Vector2(-0.52, -0.3), Vector2(-0.74, -0.2)]],
	"crown": [[Vector2(-0.85, 0.45), Vector2(-0.85, -0.55), Vector2(-0.45, -0.1),
		Vector2(0, -0.72), Vector2(0.45, -0.1), Vector2(0.85, -0.55),
		Vector2(0.85, 0.45)]],
	"bolt": [[Vector2(0.15, -0.85), Vector2(-0.55, 0.1), Vector2(-0.05, 0.1),
		Vector2(-0.25, 0.85), Vector2(0.5, -0.15), Vector2(0.0, -0.15)]],


	"tower": [[Vector2(-0.52, 0.9), Vector2(-0.52, -0.85), Vector2(-0.26, -0.85),
		Vector2(-0.26, -0.42), Vector2(-0.1, -0.42), Vector2(-0.1, -0.85),
		Vector2(0.1, -0.85), Vector2(0.1, -0.42), Vector2(0.26, -0.42),
		Vector2(0.26, -0.85), Vector2(0.52, -0.85), Vector2(0.52, 0.9)]],
	"leaf": [[Vector2(0, -0.95), Vector2(0.45, -0.3), Vector2(0.5, 0.25),
		Vector2(0, 0.95), Vector2(-0.5, 0.25), Vector2(-0.45, -0.3)]],












	"lion": [[Vector2(0.0, -0.72), Vector2(0.22, -0.86), Vector2(0.3, -0.62),
		Vector2(0.6, -0.92), Vector2(0.58, -0.55), Vector2(0.92, -0.6),
		Vector2(0.78, -0.26), Vector2(0.98, -0.02), Vector2(0.74, 0.16),
		Vector2(0.86, 0.46), Vector2(0.48, 0.44), Vector2(0.44, 0.78),
		Vector2(0.14, 0.62), Vector2(0.0, 0.95), Vector2(-0.14, 0.62),
		Vector2(-0.44, 0.78), Vector2(-0.48, 0.44), Vector2(-0.86, 0.46),
		Vector2(-0.74, 0.16), Vector2(-0.98, -0.02), Vector2(-0.78, -0.26),
		Vector2(-0.92, -0.6), Vector2(-0.58, -0.55), Vector2(-0.6, -0.92),
		Vector2(-0.3, -0.62), Vector2(-0.22, -0.86)]],


	"wolf": [[Vector2(-0.98, 0.1), Vector2(-0.6, -0.05), Vector2(-0.52, -0.35),
		Vector2(-0.62, -0.72), Vector2(-0.25, -0.42), Vector2(0.2, -0.45),
		Vector2(0.42, -0.92), Vector2(0.55, -0.4), Vector2(0.9, -0.12),
		Vector2(0.72, 0.5), Vector2(0.25, 0.8), Vector2(-0.3, 0.6),
		Vector2(-0.62, 0.35)]],






	"rooster": [[Vector2(-0.78, -0.62), Vector2(-0.7, -0.86), Vector2(-0.56, -0.7),
		Vector2(-0.46, -0.96), Vector2(-0.32, -0.68), Vector2(-0.2, -0.8),
		Vector2(-0.14, -0.48), Vector2(-0.26, -0.3), Vector2(0.06, -0.26),
		Vector2(0.36, -0.3), Vector2(0.62, -0.52), Vector2(0.92, -0.86), Vector2(0.86, -0.34),
		Vector2(0.98, 0.02), Vector2(0.62, 0.1), Vector2(0.46, 0.42),
		Vector2(0.34, 0.6), Vector2(0.4, 0.88), Vector2(0.24, 0.88),
		Vector2(0.2, 0.56), Vector2(-0.02, 0.6), Vector2(-0.06, 0.9),
		Vector2(-0.22, 0.9), Vector2(-0.2, 0.52), Vector2(-0.4, 0.28),
		Vector2(-0.52, -0.02), Vector2(-0.6, -0.02), Vector2(-0.74, -0.12),
		Vector2(-0.7, -0.28), Vector2(-1.0, -0.36), Vector2(-0.74, -0.52)]],


	"fleur": [[Vector2(0, -0.98), Vector2(0.22, -0.35), Vector2(0.9, -0.25),
		Vector2(0.42, 0.12), Vector2(0.2, 0.12), Vector2(0.2, 0.35),
		Vector2(0.62, 0.62), Vector2(0.14, 0.5), Vector2(0.14, 0.95),
		Vector2(-0.14, 0.95), Vector2(-0.14, 0.5), Vector2(-0.62, 0.62),
		Vector2(-0.2, 0.35), Vector2(-0.2, 0.12), Vector2(-0.42, 0.12),
		Vector2(-0.9, -0.25), Vector2(-0.22, -0.35)]],


	"ship": [
		[Vector2(-0.06, -0.95), Vector2(0.06, -0.95), Vector2(0.06, 0.1),
			Vector2(-0.06, 0.1)],
		[Vector2(0.12, -0.85), Vector2(0.72, -0.05), Vector2(0.12, -0.05)],
		[Vector2(-0.12, -0.7), Vector2(-0.12, -0.05), Vector2(-0.6, -0.05)],
		[Vector2(-0.95, 0.18), Vector2(0.95, 0.18), Vector2(0.62, 0.8),
			Vector2(-0.62, 0.8)]],


	"heart": [[Vector2(0, -0.5), Vector2(0.3, -0.9), Vector2(0.72, -0.78),
		Vector2(0.92, -0.38), Vector2(0.78, 0.1), Vector2(0, 0.92),
		Vector2(-0.78, 0.1), Vector2(-0.92, -0.38), Vector2(-0.72, -0.78),
		Vector2(-0.3, -0.9)]],


	"trident": [
		[Vector2(-0.09, -0.35), Vector2(0.09, -0.35), Vector2(0.09, 0.95),
			Vector2(-0.09, 0.95)],
		[Vector2(-0.72, -0.35), Vector2(0.72, -0.35), Vector2(0.72, -0.12),
			Vector2(-0.72, -0.12)],
		[Vector2(-0.78, -0.3), Vector2(-0.56, -0.3), Vector2(-0.67, -0.92)],
		[Vector2(-0.11, -0.3), Vector2(0.11, -0.3), Vector2(0, -0.98)],
		[Vector2(0.56, -0.3), Vector2(0.78, -0.3), Vector2(0.67, -0.92)]],


	"cannon": [
		[Vector2(-0.9, -0.42), Vector2(0.62, -0.42), Vector2(0.62, -0.66),
			Vector2(0.95, -0.66), Vector2(0.95, 0.08), Vector2(0.62, 0.08),
			Vector2(0.62, -0.12), Vector2(-0.9, -0.12)],
		[Vector2(0.1, 0.42), Vector2(-0.05, 0.77), Vector2(-0.4, 0.92),
			Vector2(-0.75, 0.77), Vector2(-0.9, 0.42), Vector2(-0.75, 0.07),
			Vector2(-0.4, -0.08), Vector2(-0.05, 0.07)]],
	"anchor": [
		[Vector2(-0.1, -0.55), Vector2(0.1, -0.55), Vector2(0.1, 0.75),
			Vector2(-0.1, 0.75)],
		[Vector2(-0.58, -0.5), Vector2(0.58, -0.5), Vector2(0.58, -0.28),
			Vector2(-0.58, -0.28)],
		[Vector2(-0.8, 0.15), Vector2(-0.55, 0.15), Vector2(-0.4, 0.5),
			Vector2(0, 0.72), Vector2(0.4, 0.5), Vector2(0.55, 0.15),
			Vector2(0.8, 0.15), Vector2(0.62, 0.62), Vector2(0, 0.95),
			Vector2(-0.62, 0.62)]],



	"horse": [[Vector2(-0.62, -0.52), Vector2(-0.42, -0.72), Vector2(-0.3, -0.62),
		Vector2(-0.24, -0.92), Vector2(-0.1, -0.62), Vector2(-0.02, -0.88),
		Vector2(0.06, -0.54), Vector2(0.3, -0.28), Vector2(0.46, 0.1),
		Vector2(0.58, 0.52), Vector2(0.62, 0.92), Vector2(-0.1, 0.92),
		Vector2(-0.22, 0.52), Vector2(-0.34, 0.16), Vector2(-0.56, -0.06),
		Vector2(-0.86, -0.14), Vector2(-0.92, -0.34), Vector2(-0.78, -0.44)]],






	"dragon": [[Vector2(-0.96, -0.3), Vector2(-0.74, -0.52), Vector2(-0.48, -0.6),
		Vector2(-0.34, -0.86), Vector2(-0.16, -0.6), Vector2(0.06, -0.92),
		Vector2(0.14, -0.52), Vector2(0.42, -0.44), Vector2(0.58, -0.72),
		Vector2(0.62, -0.3), Vector2(0.86, -0.4), Vector2(0.78, 0.06),
		Vector2(0.66, 0.52), Vector2(0.72, 0.92), Vector2(0.06, 0.92),
		Vector2(0.02, 0.44), Vector2(-0.14, 0.1), Vector2(-0.42, 0.02),
		Vector2(-0.52, 0.26), Vector2(-0.92, 0.18), Vector2(-0.7, -0.06)]],


	"tree": [[Vector2(0.0, -0.98), Vector2(0.34, -0.8), Vector2(0.52, -0.86),
		Vector2(0.6, -0.58), Vector2(0.86, -0.44), Vector2(0.74, -0.16),
		Vector2(0.88, 0.06), Vector2(0.56, 0.2), Vector2(0.34, 0.16),
		Vector2(0.16, 0.26), Vector2(0.14, 0.62), Vector2(0.34, 0.92),
		Vector2(-0.34, 0.92), Vector2(-0.14, 0.62), Vector2(-0.16, 0.26),
		Vector2(-0.34, 0.16), Vector2(-0.56, 0.2), Vector2(-0.88, 0.06),
		Vector2(-0.74, -0.16), Vector2(-0.86, -0.44), Vector2(-0.6, -0.58),
		Vector2(-0.52, -0.86), Vector2(-0.34, -0.8)]],


	"fish": [[Vector2(-0.95, 0.0), Vector2(-0.6, -0.34), Vector2(-0.1, -0.44),
		Vector2(0.1, -0.72), Vector2(0.3, -0.36), Vector2(0.52, -0.16),
		Vector2(0.62, 0.0), Vector2(0.92, -0.36), Vector2(0.98, 0.42),
		Vector2(0.62, 0.12), Vector2(0.4, 0.34), Vector2(0.0, 0.46),
		Vector2(-0.34, 0.38), Vector2(-0.7, 0.2)]],


	"swords": [
		[Vector2(-0.8, 0.9), Vector2(-0.9, 0.8), Vector2(0.7, -0.8),
			Vector2(0.88, -0.88), Vector2(0.8, -0.7)],
		[Vector2(-0.3, 0.7), Vector2(-0.7, 0.3), Vector2(-0.8, 0.4),
			Vector2(-0.4, 0.8)],
		[Vector2(0.8, 0.9), Vector2(0.9, 0.8), Vector2(-0.7, -0.8),
			Vector2(-0.88, -0.88), Vector2(-0.8, -0.7)],
		[Vector2(0.3, 0.7), Vector2(0.7, 0.3), Vector2(0.8, 0.4),
			Vector2(0.4, 0.8)]],


	"key": [
		[Vector2(0.34, -0.62), Vector2(0.29, -0.79), Vector2(0.17, -0.91),
			Vector2(0.0, -0.96), Vector2(-0.17, -0.91), Vector2(-0.29, -0.79),
			Vector2(-0.34, -0.62), Vector2(-0.29, -0.45), Vector2(-0.17, -0.33),
			Vector2(0.0, -0.28), Vector2(0.17, -0.33), Vector2(0.29, -0.45)],
		[Vector2(-0.09, -0.34), Vector2(0.09, -0.34), Vector2(0.09, 0.92),
			Vector2(-0.09, 0.92)],
		[Vector2(0.09, 0.34), Vector2(0.46, 0.34), Vector2(0.46, 0.52),
			Vector2(0.09, 0.52)],
		[Vector2(0.09, 0.62), Vector2(0.36, 0.62), Vector2(0.36, 0.8),
			Vector2(0.09, 0.8)]],


	"mountain": [[Vector2(-0.98, 0.72), Vector2(-0.46, -0.2), Vector2(-0.16, 0.14),
		Vector2(0.16, -0.82), Vector2(0.48, -0.06), Vector2(0.66, -0.36),
		Vector2(0.98, 0.72)]],


	"flame": [
		[Vector2(0.0, -0.98), Vector2(0.24, -0.6), Vector2(0.34, -0.72),
			Vector2(0.4, -0.3), Vector2(0.3, 0.06), Vector2(0.0, 0.3),
			Vector2(-0.3, 0.06), Vector2(-0.4, -0.3), Vector2(-0.34, -0.72),
			Vector2(-0.24, -0.6)],
		[Vector2(-0.3, 0.2), Vector2(0.3, 0.2), Vector2(0.3, 0.38),
			Vector2(-0.3, 0.38)],
		[Vector2(-0.14, 0.34), Vector2(0.14, 0.34), Vector2(0.14, 0.94),
			Vector2(-0.14, 0.94)]],
}








const EMBLEM_DETAIL: Dictionary = {
	"lion": [
		[Vector2(-0.38, -0.22), Vector2(-0.14, -0.14), Vector2(-0.16, 0.04),
			Vector2(-0.38, -0.02)],
		[Vector2(0.38, -0.22), Vector2(0.14, -0.14), Vector2(0.16, 0.04),
			Vector2(0.38, -0.02)],
		[Vector2(0.0, 0.1), Vector2(0.2, 0.34), Vector2(-0.2, 0.34)],
		[Vector2(-0.26, 0.42), Vector2(0.26, 0.42), Vector2(0.26, 0.52),
			Vector2(-0.26, 0.52)]],
	"rooster": [
		[Vector2(-0.56, -0.62), Vector2(-0.4, -0.62), Vector2(-0.4, -0.46),
			Vector2(-0.56, -0.46)],
		[Vector2(0.02, -0.04), Vector2(0.44, 0.0), Vector2(0.34, 0.32),
			Vector2(0.04, 0.26)]],
	"bull": [
		[Vector2(-0.36, -0.2), Vector2(-0.14, -0.14), Vector2(-0.16, 0.0),
			Vector2(-0.36, -0.06)],
		[Vector2(0.36, -0.2), Vector2(0.14, -0.14), Vector2(0.16, 0.0),
			Vector2(0.36, -0.06)],
		[Vector2(-0.22, 0.34), Vector2(-0.06, 0.34), Vector2(-0.06, 0.5),
			Vector2(-0.22, 0.5)],
		[Vector2(0.22, 0.34), Vector2(0.06, 0.34), Vector2(0.06, 0.5),
			Vector2(0.22, 0.5)]],
	"wolf": [
		[Vector2(-0.46, -0.26), Vector2(-0.28, -0.26), Vector2(-0.28, -0.1),
			Vector2(-0.46, -0.1)],
		[Vector2(-0.92, 0.06), Vector2(-0.58, -0.02), Vector2(-0.58, 0.08),
			Vector2(-0.9, 0.14)]],
	"eagle": [
		[Vector2(-0.1, -0.74), Vector2(-0.03, -0.74), Vector2(-0.03, -0.62),
			Vector2(-0.1, -0.62)],
		[Vector2(0.1, -0.74), Vector2(0.03, -0.74), Vector2(0.03, -0.62),
			Vector2(0.1, -0.62)]],
	"horse": [
		[Vector2(-0.4, -0.46), Vector2(-0.24, -0.42), Vector2(-0.24, -0.28),
			Vector2(-0.4, -0.32)],
		[Vector2(-0.86, -0.32), Vector2(-0.74, -0.3), Vector2(-0.74, -0.2),
			Vector2(-0.86, -0.22)]],
	"dragon": [
		[Vector2(-0.32, -0.42), Vector2(-0.14, -0.38), Vector2(-0.14, -0.24),
			Vector2(-0.32, -0.28)],
		[Vector2(-0.88, -0.28), Vector2(-0.76, -0.26), Vector2(-0.76, -0.16),
			Vector2(-0.88, -0.18)]],

	"key": [
		[Vector2(0.15, -0.62), Vector2(0.13, -0.7), Vector2(0.08, -0.75),
			Vector2(0.0, -0.77), Vector2(-0.08, -0.75), Vector2(-0.13, -0.7),
			Vector2(-0.15, -0.62), Vector2(-0.13, -0.55), Vector2(-0.08, -0.49),
			Vector2(0.0, -0.47), Vector2(0.08, -0.49), Vector2(0.13, -0.55)]],
	"fish": [
		[Vector2(-0.7, -0.14), Vector2(-0.54, -0.14), Vector2(-0.54, 0.0),
			Vector2(-0.7, 0.0)]],

	"mountain": [
		[Vector2(0.16, -0.82), Vector2(0.38, -0.42), Vector2(0.26, -0.5),
			Vector2(0.16, -0.4), Vector2(0.04, -0.52), Vector2(-0.04, -0.44)]],

	"flame": [
		[Vector2(0.0, -0.5), Vector2(0.16, -0.14), Vector2(0.0, 0.1),
			Vector2(-0.16, -0.14)]],

	"tree": [
		[Vector2(-0.06, 0.28), Vector2(0.06, 0.28), Vector2(0.06, 0.86),
			Vector2(-0.06, 0.86)]],
}




















func _campo_bajo(partes: Array) -> void:
	if _pattern == "solid" or _pattern == "bordure" or partes.is_empty():
		return
	var min_p: Vector2 = Vector2.INF
	var max_p: Vector2 = - Vector2.INF
	for pts in partes:
		for punto in pts:
			min_p = min_p.min(punto)
			max_p = max_p.max(punto)
	if min_p.x > max_p.x:
		return
	var margen: float = maxf(_r_escudo * 0.075, 3.0)
	var centro: Vector2 =(min_p + max_p) * 0.5
	var media: Vector2 =(max_p - min_p) * 0.5 + Vector2(margen, margen)
	var ch: float = minf(media.x, media.y) * 0.42
	var campo: PackedVector2Array = PackedVector2Array([
		centro + Vector2(- media.x + ch, - media.y), centro + Vector2(media.x - ch, - media.y),
		centro + Vector2(media.x, - media.y + ch), centro + Vector2(media.x, media.y - ch),
		centro + Vector2(media.x - ch, media.y), centro + Vector2(- media.x + ch, media.y),
		centro + Vector2(- media.x, media.y - ch), centro + Vector2(- media.x, - media.y + ch)])
	for pieza in Geometry2D.intersect_polygons(campo,
			_shape_poly(_c_escudo, _r_escudo, _shape)):
		_poly(pieza, _kit)














const SHAPE_EMBLEM: Dictionary = {
	"pennant": [0.7, -0.2], "diamond": [0.76, 0.0], "spade": [0.9, -0.08],
	"scudetto": [0.92, -0.06], "shield": [0.95, -0.05], "heater": [0.88, -0.09],
	"french": [0.96, -0.03], "keystone": [0.9, -0.04], "banner": [0.94, -0.05],
	"swallowtail": [0.88, 0.0], "trapeze": [0.9, 0.07], "arch": [0.94, 0.03],
	"oval": [0.82, 0.0], "pentagon": [0.88, 0.06], "hex": [0.94, 0.0],
}


func _draw_emblem(c: Vector2, r: float, emblem: String, border: Color) -> void:
	var ink: Color = _pattern_color()





	if rgb_dist(border, ink) < 0.2:
		border = Color("14161a") if _lum(ink) >= 0.5 else Color("f2f4f7")





	if _emblem_tone == "gold":




		ink = Color("e9c65a")
		border = Color("7a5410")




	var aj: Array = SHAPE_EMBLEM.get(_shape, [1.0, 0.0])





	_c_escudo = c
	_r_escudo = r
	var c0: Vector2 = c
	var r0: float = r
	c += Vector2(0.0, r * float(aj[1]))
	r *= float(aj[0])
	match emblem:
		"star":
			_draw_device([_star(c, r * 0.5, r * 0.23)], ink, border, r)
		"double_star":
			_draw_device([_star(c - Vector2(r * 0.3, 0.0), r * 0.3, r * 0.14),
				_star(c + Vector2(r * 0.3, 0.0), r * 0.3, r * 0.14)], ink, border, r)
		"ring":





			_campo_bajo([_ngon(c, r * 0.4 + maxf(r * 0.07, 2.0), 28, 0.0)])
			var ow_ring: float = maxf(r * 0.05, 1.0)
			var grosor: float = maxf(r * 0.07, 2.0)
			draw_arc(c, r * 0.4, 0.0, TAU, 40, border, grosor + ow_ring * 2.0, true)
			draw_arc(c, r * 0.4, 0.0, TAU, 40, ink, grosor, true)
		"ball":

			_draw_device([_ngon(c, r * 0.4, 28, 0.0)], ink, border, r,
				[_ngon(c, r * 0.19, 5, - PI * 0.5)])
		"gear":

			_draw_device([_toothed(c, r * 0.52, r * 0.33, 8, true)], ink, border, r,
				[_ngon(c, r * 0.2, 14, 0.0)])
		"crescent":
			_draw_device([_crescent(c, r * 0.46)], ink, border, r)
		"letters":


			var txt: String = _abbrev.substr(0, 3).to_upper()
			var fs: int = int(maxf(r * 0.42, 6.0))
			var w: float = FONT.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT,
				-1, fs).x
			var pos: Vector2 = c + Vector2(- w * 0.5, float(fs) * 0.36)
			_plate_texto(c, w * 0.5, float(fs) * 0.5, c0, r0)








			_texto_perfilado(txt, pos, fs, ink, _edge_for(ink, border),
				maxf(r * 0.035, 1.0))
		"monogram":




			var ch: String = _letter.substr(0, 1).to_upper()
			if ch.is_empty():
				ch = _abbrev.substr(0, 1).to_upper()


			var fs2: int = int(maxf(r * 0.95, 8.0))
			var w2: float = FONT.get_string_size(ch, HORIZONTAL_ALIGNMENT_LEFT,
				-1, fs2).x


			var base: Vector2 = c + Vector2(- w2 * 0.5,
				FONT.get_ascent(fs2) * 0.5)



			_plate_texto(c, w2 * 0.5, FONT.get_ascent(fs2) * 0.5, c0, r0)
			_texto_perfilado(ch, base, fs2, ink, _edge_for(ink, border),
				maxf(r * 0.07, 1.0))
		"sun":


			_draw_device([_toothed(c, r * 0.58, r * 0.36, 14)], ink, border, r,
				[_ngon(c, r * 0.24, 18, 0.0)])
		"none":
			pass
		_:

			if not EMBLEM_SHAPES.has(emblem):
				return
			var k: float = r * 0.52
			var partes: Array = []
			for raw in EMBLEM_SHAPES[emblem]:
				partes.append(_emblem_pts(raw, c, k))




			var detalle: Array = []
			if k >= 20.0:
				for raw in EMBLEM_DETAIL.get(emblem, []):
					detalle.append(_emblem_pts(raw, c, k))
			_draw_device(partes, ink, border, r, detalle)












func _plate_texto(centro: Vector2, hw: float, hh: float, c0: Vector2,
		r0: float) -> void:
	if _pattern == "solid":
		return
	var mx: float = maxf(hw * 0.14, 2.0)
	var x: float = hw + mx
	var y: float = hh + mx
	var ch: float = minf(x, y) * 0.34
	var placa: PackedVector2Array = PackedVector2Array([
		centro + Vector2(- x + ch, - y), centro + Vector2(x - ch, - y),
		centro + Vector2(x, - y + ch), centro + Vector2(x, y - ch),
		centro + Vector2(x - ch, y), centro + Vector2(- x + ch, y),
		centro + Vector2(- x, y - ch), centro + Vector2(- x, - y + ch)])
	for pieza in Geometry2D.intersect_polygons(placa, _shape_poly(c0, r0, _shape)):
		_poly(pieza, _kit)







func _edge_for(ink: Color, border: Color) -> Color:
	if absf(_lum(border) - _lum(ink)) >= 0.22:
		return border
	if absf(_lum(_kit) - _lum(ink)) >= 0.22:
		return _kit
	return Color("f2f4f7") if _lum(ink) < 0.5 else Color("14161a")






func _texto_perfilado(txt: String, base: Vector2, fs: int, ink: Color,
		edge: Color, ow: float) -> void:
	for d in [Vector2(- ow, 0.0), Vector2(ow, 0.0), Vector2(0.0, - ow),
			Vector2(0.0, ow)]:
		draw_string(FONT, base + d, txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, edge)
	draw_string(FONT, base, txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs, ink)














func _draw_device(partes: Array, ink: Color, border: Color, r: float,
		detalle: Array = []) -> void:
	_campo_bajo(partes)
	var ow: float = maxf(r * 0.05, 1.0)
	for i in 8:
		var off: Vector2 = Vector2(cos(float(i) * PI * 0.25),
			sin(float(i) * PI * 0.25)) * ow
		for pts in partes:
			_poly(_movido(pts, off), border)
	for pts in partes:
		_poly(pts, ink)
	for pts in detalle:
		_poly(pts, border)


func _movido(pts: PackedVector2Array, off: Vector2) -> PackedVector2Array:
	var out: PackedVector2Array = PackedVector2Array()
	for p in pts:
		out.append(p + off)
	return out



func _emblem_pts(raw: Array, c: Vector2, k: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for p in raw:
		pts.append(c +(p as Vector2) * k)
	return pts











func _toothed(c: Vector2, outer: float, inner: float, dientes: int = 8,
		plano: bool = false) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	if plano:
		var w: float = TAU / float(dientes)
		for i in dientes:
			var a0: float = float(i) * w
			for par in [[0.0, inner], [0.18, outer], [0.5, outer], [0.68, inner]]:
				var ang2: float = a0 + w * float(par[0])
				pts.append(c + Vector2(cos(ang2), sin(ang2)) * float(par[1]))
		return pts
	var n: int = dientes * 2
	for i in n:
		var rad: float = outer if i % 2 == 0 else inner
		var ang: float = float(i) / float(n) * TAU
		pts.append(c + Vector2(cos(ang), sin(ang)) * rad)
	return pts







func _crescent(c: Vector2, r: float) -> PackedVector2Array:
	var disco: PackedVector2Array = _ngon(c, r, 28, 0.0)
	var bocado: PackedVector2Array = _ngon(c + Vector2(r * 0.42, 0.0), r * 0.86,
		28, 0.0)
	var lunas: Array = Geometry2D.clip_polygons(disco, bocado)


	var best: PackedVector2Array = disco
	var best_a: float = 0.0
	for piece in lunas:
		var a: float = absf(_shoelace(piece))
		if a > best_a and piece.size() >= 3:
			best_a = a
			best = piece
	return best





























func _draw_logo(tex: Texture2D) -> void:
	var ts: Vector2 = tex.get_size()
	if ts.x <= 0.0 or ts.y <= 0.0:
		return
	var k: float = minf(size.x / ts.x, size.y / ts.y)
	var dst: Vector2 = ts * k
	var pos: Vector2 =(size - dst) * 0.5
	if _halo:
		draw_texture_rect(tex, Rect2(pos + Vector2(0.0, size.y * HALO_DROP), dst),
			false, Color(0.03, 0.04, 0.06, 0.55))
	draw_texture_rect(tex, Rect2(pos, dst), false)


func _draw_nation(tex: Texture2D) -> void:
	var c: Vector2 = size * 0.5
	var r: float = minf(size.x, size.y) * 0.5
	var outer: PackedVector2Array = _shape_poly(c, r, "shield")
	if _halo:
		_poly(_shape_poly(c + Vector2(0.0, r * HALO_DROP), r * HALO_SHADOW,
			"shield"), Color(0.03, 0.04, 0.06, 0.55))
		_poly(_shape_poly(c, r * HALO_EDGE, "shield"), Color(0.94, 0.95, 0.97, 0.9))


	_poly(outer, _rim_color())
	var inner: PackedVector2Array = _shape_poly(c, r * 0.9, "shield")



	_poly_tex(inner, tex, Rect2(c - Vector2(r, r), Vector2(r, r) * 2.0), 1.0)










func _poly_tex(points: PackedVector2Array, tex: Texture2D, rect: Rect2,
		inset_px: float = 0.0) -> void:
	if points.size() < 3 or tex == null or rect.size.x <= 0.0 or rect.size.y <= 0.0:
		return
	var ts: Vector2 = tex.get_size()
	var uv0: Vector2 = Vector2.ZERO
	var uv1: Vector2 = Vector2.ONE
	if inset_px > 0.0 and ts.x > inset_px * 2.0 and ts.y > inset_px * 2.0:
		uv0 = Vector2(inset_px, inset_px) / ts
		uv1 = Vector2.ONE - uv0
	var uvs: PackedVector2Array = PackedVector2Array()
	for p in points:
		uvs.append(uv0 +(p - rect.position) / rect.size *(uv1 - uv0))
	var idx: PackedInt32Array = Geometry2D.triangulate_polygon(points)
	if idx.is_empty():
		if absf(_shoelace(points)) < 1.0:
			return
		draw_colored_polygon(points, Color.WHITE, uvs, tex)
		return
	var i: int = 0
	while i + 2 < idx.size():
		draw_colored_polygon(
			PackedVector2Array([points[idx[i]], points[idx[i + 1]],
				points[idx[i + 2]]]),
			Color.WHITE,
			PackedVector2Array([uvs[idx[i]], uvs[idx[i + 1]], uvs[idx[i + 2]]]),
			tex)
		i += 3





func _poly(points: PackedVector2Array, color: Color) -> void:
	if points.size() < 3:
		return
	var idx: PackedInt32Array = Geometry2D.triangulate_polygon(points)
	if idx.is_empty():








		if absf(_shoelace(points)) < 1.0:
			return
		draw_colored_polygon(points, color)
		return
	var i: int = 0
	while i + 2 < idx.size():
		var a: Vector2 = points[idx[i]]
		var b: Vector2 = points[idx[i + 1]]
		var d: Vector2 = points[idx[i + 2]]
		i += 3





		if absf((b - a).cross(d - a)) < 1.0:
			continue
		draw_colored_polygon(PackedVector2Array([a, b, d]), color)



func _shoelace(pts: PackedVector2Array) -> float:
	var a: float = 0.0
	for i in pts.size():
		var p: Vector2 = pts[i]
		var q: Vector2 = pts[(i + 1) % pts.size()]
		a += p.x * q.y - q.x * p.y
	return a * 0.5



func _star(c: Vector2, outer: float, inner: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 10:
		var rad: float = outer if i % 2 == 0 else inner
		var ang: float = - PI * 0.5 + float(i) * PI / 5.0
		pts.append(c + Vector2(cos(ang), sin(ang)) * rad)
	return pts
