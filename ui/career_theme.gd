class_name CareerTheme
extends RefCounted






































static var BG_DEEP: Color = Color("0c0c0e")
static var SURFACE: Color = Color("212128")




static var SURFACE_HI: Color = Color("30303a")
static var SURFACE_LINE: Color = Color("41414d")
static var TEXT: Color = Color("f4f1ec")




static var TEXT_MID: Color = Color(0.957, 0.945, 0.925, 0.78)
static var TEXT_DIM: Color = Color(0.957, 0.945, 0.925, 0.58)



static var PLATE_BG: Color = Color(0.137, 0.137, 0.165, 0.94)
static var GHOST_BG: Color = Color(1, 1, 1, 0.03)
static var GHOST_EDGE: Color = Color(0, 0, 0, 0.33)
static var DISABLED_INK: Color = Color(1, 1, 1, 0.45)





const TIER_COLORS: Array = [Color("b3703a"), Color("c6ccd6"), Color("e3b23c"), Color("7fe3f0")]




static var MONEY: Color = Color("e3b23c")




static var DANGER: Color = Color("e05c52")

















const PELIGRO_META: String = "fl_peligro"



static func marca_peligro(btn: Control, peligro: bool) -> void:
	if peligro:
		btn.set_meta(PELIGRO_META, true)
	elif btn.has_meta(PELIGRO_META):
		btn.remove_meta(PELIGRO_META)






const _THEME_DARK: Dictionary = {
	"BG_DEEP": Color("0c0c0e"), "SURFACE": Color("212128"),
	"SURFACE_HI": Color("30303a"), "SURFACE_LINE": Color("41414d"),
	"TEXT": Color("f4f1ec"),
	"TEXT_MID": Color(0.957, 0.945, 0.925, 0.78),
	"TEXT_DIM": Color(0.957, 0.945, 0.925, 0.58),
	"PLATE_BG": Color(0.137, 0.137, 0.165, 0.94),
	"GHOST_BG": Color(1, 1, 1, 0.03), "GHOST_EDGE": Color(0, 0, 0, 0.33),
	"DISABLED_INK": Color(1, 1, 1, 0.45),
	"MONEY": Color("e3b23c"), "DANGER": Color("e05c52"),
	"MODAL_SCRIM": Color(0.047, 0.047, 0.055, 0.78),
	"GOOD": Color("9ff09f"), "ENERGY_FULL": Color("4ec98a"),
	"CAUTION": Color("e8d44d"), "STAT_ASSIST": Color("79c0ff"),
	"STAT_AVG": Color("d0d5de"), "HISTORIA": Color("9b74f3"),
	"EXTREMO": Color("e0468f"),
	"SCRIM": Color(0.047, 0.047, 0.055, 0.78),

	"REDES_BG": Color("160f1b"), "REDES_CARD": Color("241a2c"),
	"REDES_INK": Color("f4f1ec"), "REDES_DIM": Color("bdb5c6"),
	"REDES_LINE": Color("3a2d45"), "REDES_SOFT": Color("2e2238"),
	"REDES_BAD_BG": Color("4a1f22"), "REDES_BAD_INK": Color("ff8f86"),
	"REDES_GOOD_INK": Color("7fd0ef"), "REDES_RISA_INK": Color("c4a8ff"),
	"REDES_FUEGO_INK": Color("ffa95e"), "REDES_SOMBRA": Color("0c0810"),
	"REDES_MARCA_INK": Color("ef89db"), "REDES_MARCA_SOFT": Color("5a2758"),


	"REDES_FUEGO_BG": Color("4a2a14"),
}
const _THEME_LIGHT: Dictionary = {




































	"BG_DEEP": Color("cac0ac"), "SURFACE": Color("dbd4c5"),
	"SURFACE_HI": Color("e8e3da"), "SURFACE_LINE": Color("b6aa92"),


	"TEXT": Color("2a2117"),








	"TEXT_MID": Color(0.165, 0.129, 0.09, 0.84),
	"TEXT_DIM": Color(0.165, 0.129, 0.09, 0.72),
	"PLATE_BG": Color(0.859, 0.831, 0.773, 0.96),



	"GHOST_BG": Color(0.165, 0.129, 0.09, 0.045),
	"GHOST_EDGE": Color(0.165, 0.129, 0.09, 0.26),
	"DISABLED_INK": Color(0.165, 0.129, 0.09, 0.64),














	"MONEY": Color("985d00"), "DANGER": Color("b04039"),
	"GOOD": Color("187e2d"), "ENERGY_FULL": Color("0b7f4f"),
	"CAUTION": Color("9b5803"), "STAT_ASSIST": Color("146cbc"),
	"STAT_AVG": Color("6c6861"),


	"HISTORIA": Color("7f50ae"),


	"EXTREMO": Color("a8306a"),












	"SCRIM": Color(0.825, 0.792, 0.724, 0.88),





	"MODAL_SCRIM": Color(0.165, 0.129, 0.09, 0.42),




	"REDES_BG": Color("f2eee8"), "REDES_CARD": Color("ffffff"),
	"REDES_INK": Color("17151c"), "REDES_DIM": Color("5e5a66"),
	"REDES_LINE": Color("e4ded5"), "REDES_SOFT": Color("f5f1eb"),
	"REDES_BAD_BG": Color("fde6e3"), "REDES_BAD_INK": Color("b3302a"),
	"REDES_GOOD_INK": Color("1a6f8f"), "REDES_RISA_INK": Color("6b47c2"),


	"REDES_FUEGO_INK": Color("a84a0c"), "REDES_SOMBRA": Color("e2dbd0"),
	"REDES_MARCA_INK": Color("a1348c"), "REDES_MARCA_SOFT": Color("fce9f8"),
	"REDES_FUEGO_BG": Color("ffe9d6"),
}



static var light_theme: bool = false







static func crt_paper(rect: ColorRect) -> void:
	if rect == null:
		return
	var mat: ShaderMaterial = rect.material as ShaderMaterial
	if mat == null:
		return
	mat.set_shader_parameter("paper", 1.0 if light_theme else 0.0)





static func set_light(on: bool) -> void:
	light_theme = on
	var t: Dictionary = _THEME_LIGHT if on else _THEME_DARK
	BG_DEEP = t["BG_DEEP"]
	SURFACE = t["SURFACE"]
	SURFACE_HI = t["SURFACE_HI"]
	SURFACE_LINE = t["SURFACE_LINE"]
	TEXT = t["TEXT"]
	TEXT_MID = t["TEXT_MID"]
	TEXT_DIM = t["TEXT_DIM"]
	PLATE_BG = t["PLATE_BG"]
	GHOST_BG = t["GHOST_BG"]
	GHOST_EDGE = t["GHOST_EDGE"]
	DISABLED_INK = t["DISABLED_INK"]
	MONEY = t["MONEY"]
	DANGER = t["DANGER"]
	GOOD = t["GOOD"]
	ENERGY_FULL = t["ENERGY_FULL"]
	CAUTION = t["CAUTION"]
	STAT_ASSIST = t["STAT_ASSIST"]
	STAT_AVG = t["STAT_AVG"]
	HISTORIA = t["HISTORIA"]
	EXTREMO = t["EXTREMO"]


	STAT_GOAL = GOOD

	STAT_MOVE = HISTORIA
	SCRIM = t["SCRIM"]
	MODAL_SCRIM = t["MODAL_SCRIM"]
	REDES_BG = t["REDES_BG"]
	REDES_CARD = t["REDES_CARD"]
	REDES_INK = t["REDES_INK"]
	REDES_DIM = t["REDES_DIM"]
	REDES_LINE = t["REDES_LINE"]
	REDES_SOFT = t["REDES_SOFT"]
	REDES_BAD_BG = t["REDES_BAD_BG"]
	REDES_BAD_INK = t["REDES_BAD_INK"]
	REDES_GOOD_INK = t["REDES_GOOD_INK"]
	REDES_RISA_INK = t["REDES_RISA_INK"]
	REDES_FUEGO_INK = t["REDES_FUEGO_INK"]
	REDES_FUEGO_BG = t["REDES_FUEGO_BG"]
	REDES_SOMBRA = t["REDES_SOMBRA"]
	REDES_MARCA_INK = t["REDES_MARCA_INK"]
	REDES_MARCA_SOFT = t["REDES_MARCA_SOFT"]





























































static var GOOD: Color = Color("9ff09f")














const PITCH_GRASS_A: Color = Color("2f8b3c")
const PITCH_GRASS_B: Color = Color("2c8438")
const PITCH_CHALK: Color = Color("ffffff")






const PITCH_SKY_A: Color = Color("1b2a38")
const PITCH_SKY_B: Color = Color("0e151d")















static var ENERGY_FULL: Color = Color("4ec98a")







const BENCH: Color = Color("d07a2f")




















static var CAUTION: Color = Color("e8d44d")









static var EXTREMO: Color = Color("e0468f")













const FUEGO_NUCLEO: Color = Color("ffe58a")
const FUEGO_MEDIO: Color = Color("ff9636")
const FUEGO_BORDE: Color = Color("e8412b")















static var HISTORIA: Color = Color("9b74f3")
const HISTORIA_D: Color = Color("5a33a8")





















static var STAT_GOAL: Color = GOOD
static var STAT_ASSIST: Color = Color("79c0ff")
static var STAT_AVG: Color = Color("d0d5de")













static var STAT_MOVE: Color = HISTORIA






static var SCRIM: Color = Color(0.047, 0.047, 0.055, 0.78)



static var MODAL_SCRIM: Color = Color(0.047, 0.047, 0.055, 0.78)




const SHADOW: Color = Color(0, 0, 0, 0.5)



const SHADOW_HARD: Color = Color(0, 0, 0, 0.85)









const MUTED: Color = Color(1, 1, 1, 0.8)



const FLASH: Color = Color(2.2, 2.2, 2.2)















static var REDES_BG: Color = Color("160f1b")
static var REDES_CARD: Color = Color("241a2c")
static var REDES_INK: Color = Color("f4f1ec")
static var REDES_DIM: Color = Color("bdb5c6")
static var REDES_LINE: Color = Color("3a2d45")
static var REDES_SOFT: Color = Color("2e2238")
static var REDES_BAD_BG: Color = Color("4a1f22")
static var REDES_BAD_INK: Color = Color("ff8f86")
static var REDES_GOOD_INK: Color = Color("7fd0ef")
static var REDES_RISA_INK: Color = Color("c4a8ff")
static var REDES_FUEGO_INK: Color = Color("ffa95e")
static var REDES_FUEGO_BG: Color = Color("4a2a14")
static var REDES_SOMBRA: Color = Color("0c0810")
static var REDES_MARCA_INK: Color = Color("ef89db")
static var REDES_MARCA_SOFT: Color = Color("5a2758")





const REDES_MARCA: Color = Color("e64ac8")
const REDES_MARCA_SOMBRA: Color = Color("7f296e")


const REDES_MEDIA: Color = Color("13202c")
const APP_LIGA: Color = Color("1fa3c4")
const APP_LIGA_SOMBRA: Color = Color("11607a")
const APP_MUNDO: Color = Color("8a5fe0")
const APP_MUNDO_SOMBRA: Color = Color("4f3191")


const APP_MENSAJES: Color = Color("ef7d2d")
const APP_MENSAJES_SOMBRA: Color = Color("834418")
const CELULAR_BISEL: Color = Color("0c0c0e")
const CELULAR_CANTO: Color = Color("2a2a33")
const CELULAR_RIEL: Color = Color("121217")
const CELULAR_ROTULO: Color = Color("b9b5c2")
const CELULAR_TINTA: Color = Color("f4f1ec")
const VOZ_PRENSA: Color = Color("8a5fe0")
const VOZ_RIVAL: Color = Color("a8354f")
















const NAV_YO: Color = Color("3aa7c9")
const NAV_MUNDO: Color = Color("9a72e0")


const NAV_LEGADO: Color = Color("d9862f")
const NAV_PLANTILLA: Color = Color("4a86a8")
const NAV_PAPEL: Color = Color("a9b6c2")
const NAV_GENTE: Color = Color("d46a9e")
const NAV_CASA: Color = Color("6a8fd6")






const LUZ_REFLEJOS: Color = Color("39c0ff")










const CONTACTO_WHATSAPP: Color = Color("25d366")
const CONTACTO_CORREO: Color = Color("f5d547")













static var SKILL: Color = NAV_YO











static var RASGO: Dictionary = {

	"balon_parado": STAT_ASSIST,
	"corners": NAV_YO,
	"contras": BENCH,
	"centros": NAV_MUNDO,
	"mano_a_mano": NAV_GENTE,
	"tiro_lejano": MONEY,
	"cerrojo": NAV_PAPEL,
	"fergie": CAUTION,

	"loco": DANGER,
	"calienta_banquillos": DIV_COLOR_DEEP,
	"griton": NAV_LEGADO,
	"carrusel": NAV_CASA,
	"avaro": HISTORIA_D,
	"supersticioso": ENERGY_FULL,

	"penales": NAV_PLANTILLA,
	"cantera": PITCH_GRASS_A,
	"posesion": TEXT,
	"tarjetero": CONTACTO_CORREO,
	"visitante_flojo": RASGO_PETROLEO,
	"favoritismo": RASGO_OLIVA,

	"arranque": RASGO_FUCSIA,
	"claras": RASGO_LIMA,
	"derbis": RASGO_GRANATE,
	"fisio": GOOD,
	"ida_y_vuelta": RASGO_CIELO,
	"se_despierta_tarde": RASGO_NOCHE,
	"once_de_hierro": RASGO_HIERRO,
	"culpa_tuya": RASGO_FRAMBUESA,

	"revolucion": RASGO_RAYO,
	"paciente": RASGO_ARENA,


	"rol_capitan": MONEY,
	"rol_penal": STAT_ASSIST,
	"rol_parado": STAT_ASSIST,





	"pareja_casera": NAV_CASA,
	"pareja_companera": NAV_PLANTILLA,
	"pareja_independiente": RASGO_CIELO,
	"pareja_hincha": BENCH,
	"pareja_reservada": RASGO_NOCHE,
	"pareja_millonaria": MONEY,
	"pareja_celosa": RASGO_GRANATE,
	"pareja_fiestera": RASGO_FUCSIA,
	"pareja_ambiciosa": NAV_LEGADO,
	"pareja_cazafortunas": DANGER,
}



const RASGO_PETROLEO: Color = Color("1f8a7a")
const RASGO_OLIVA: Color = Color("a8a43c")
const RASGO_FUCSIA: Color = Color("e64ac8")
const RASGO_LIMA: Color = Color("c8e04a")
const RASGO_GRANATE: Color = Color("a8354f")
const RASGO_CIELO: Color = Color("5ec8f2")
const RASGO_NOCHE: Color = Color("5566b3")
const RASGO_HIERRO: Color = Color("56667a")
const RASGO_FRAMBUESA: Color = Color("e0407a")



const RASGO_RAYO: Color = Color("36e0c0")
const RASGO_ARENA: Color = Color("c9a26b")







const NAV_DINERO: Color = Color("e3b23c")







const RADIUS: int = UiKit.BTN_RADIUS

const SINK: int = UiKit.BTN_BORDER
const SINK_PRESSED: int = UiKit.BTN_BORDER_PRESSED









enum Kind{PRIMARY, NEUTRAL, WARN, GHOST, REAL}




const BTN_PITCH: Dictionary = {
	Kind.PRIMARY: 0.9, Kind.NEUTRAL: 1.0, Kind.WARN: 0.82, Kind.GHOST: 1.14,
	Kind.REAL: 0.9,
}











const T_SCORE: int = 72
const T_TITLE: int = 46
const T_TITLE_MODAL: int = 40






const T_HEAD: int = 24
const T_CARD: int = 24
const T_BODY: int = 22
const T_DIM: int = 18
const T_VALUE: int = 22
const T_MONEY: int = 26





const T_CAPTION: int = 16








const T_HUD_VS: int = 64
const T_HUD_SCORE: int = 52
const T_HUD_ROTULO: int = 34





const T_HUD_DORSAL: int = 31













const T_CAP_TUMBADO: int = 16
const T_LEE_TUMBADO: int = 24
const T_DATO_TUMBADO: int = 32
const T_TITULO_TUMBADO: int = 48
const T_HEROE_TUMBADO: int = 72






const TOQUE_TUMBADO: float = 88.0
const TOQUE_PRINCIPAL_TUMBADO: float = 121.0



const BARRA_TUMBADA_H: float = 88.0




const BTN_CTA_H: int = 110
const BTN_CTA_FONT: int = 40
const BTN_SECONDARY_H: int = 100
const BTN_SECONDARY_FONT: int = 34
const BTN_ROW_H: int = 84
const BTN_ROW_FONT: int = 24
const TOGGLE_SIZE: Vector2 = Vector2(180, 84)
const SLIDER_H: int = 56


const ACCENT_MIN_LUM: float = 0.16




const ACCENT_TEXT_LUM: float = 0.4



const TEXT_CONTRAST: float = 4.5
const FILL_CONTRAST: float = 1.35










static var accent_ctx: Variant = null




static func clear_ctx() -> void:
	accent_ctx = null










static func accent() -> Color:
	if accent_ctx is Color:
		return accent_ctx
	return accent_of(GameState.you_team())






static func accent_of(team: Dictionary) -> Color:
	var tid: String = String(team.get("id", "")).to_lower().strip_edges()
	if not tid.is_empty():
		var id_script = load("res://features/scoreboard/team_identity_colors.gd")
		if id_script != null and id_script.is_team_registered(tid):
			var pal: Dictionary = id_script.get_team_identity_colors(tid, team)
			if pal["primary_color"].get_luminance() > 0.85:
				return pal["accent_color"]
			return pal["primary_color"]

	var best: Color = MONEY
	var best_sat: float = -1.0
	for key in ["kit", "kit2"]:
		var c: Variant = team.get(key)
		if c is Color and (c as Color).get_luminance() >= ACCENT_MIN_LUM \
				and (c as Color).s > best_sat:
			best = c
			best_sat =(c as Color).s
	return best













static func accent_text() -> Color:
	return text_on_dark(accent())



const INK_MIN_SAT: float = 0.1


























static func accent_ink() -> Color:
	if accent_ctx is Color or accent().s >= INK_MIN_SAT:
		return text_on_dark(accent())
	var best: Color = Color(0, 0, 0, 0)
	for key in ["kit", "kit2"]:
		var c: Variant =(GameState.you_team() as Dictionary).get(key)
		if c is Color and (c as Color).s > best.s:
			best = c
	return text_on_dark(best if best.s >= INK_MIN_SAT else STAT_ASSIST)
















static func text_on_dark(c: Color) -> Color:
	var out: Color = c
	for _i in range(24):
		if contrast(out, BG_DEEP) >= TEXT_CONTRAST:
			return out
		out = out.darkened(0.08) if light_theme else out.lightened(0.08)
	return out









static func accent_fill(dark: float = 0.62) -> Color:
	return fill_on_dark(accent(), dark)



static func fill_on_dark(c: Color, dark: float = 0.62) -> Color:
	var out: Color = c.darkened(clampf(dark, 0.0, 1.0))
	for _i in range(24):
		if contrast(out, BG_DEEP) >= FILL_CONTRAST:
			return out
		out = out.lightened(0.05)
	return out





static func _rel_lum(c: Color) -> float:
	var out: float = 0.0
	var pesos: Array = [0.2126, 0.7152, 0.0722]
	var canales: Array = [c.r, c.g, c.b]
	for i in 3:
		var ch: float = canales[i]
		var lin: float = ch / 12.92 if ch <= 0.04045 else pow((ch + 0.055) / 1.055, 2.4)
		out += pesos[i] * lin
	return out




static func contrast(a: Color, b: Color) -> float:
	var la: float = _rel_lum(a)
	var lb: float = _rel_lum(b)
	return (maxf(la, lb) + 0.05) /(minf(la, lb) + 0.05)






const INK_DARK: Color = Color("0c0c0e")
const INK_LIGHT: Color = Color("f4f1ec")






const INK_VEIL: Color = Color(0.04, 0.04, 0.06, 0.72)






const HUD_SURFACE: Color = Color("212128")
const HUD_DEEP: Color = Color("0c0c0e")



static func on_accent() -> Color:
	return INK_DARK if accent().get_luminance() > 0.5 else INK_LIGHT






static func on_color(c: Color) -> Color:
	return INK_DARK if c.get_luminance() > 0.5 else INK_LIGHT





















static func energy_color(energy: float) -> Color:
	var t: float = clampf(energy / 100.0, 0.0, 1.0)
	var mid: float = ENERGY_MID_AT / 100.0
	if t <= mid:
		return mix_hsv(DANGER, BENCH, t / mid)
	return mix_hsv(BENCH, ENERGY_FULL,(t - mid) /(1.0 - mid))













const ENERGY_MID_AT: float = 45.0








static func mix_hsv(a: Color, b: Color, t: float) -> Color:
	var f: float = clampf(t, 0.0, 1.0)
	var dh: float = fposmod(b.h - a.h + 0.5, 1.0) - 0.5
	return Color.from_hsv(fposmod(a.h + dh * f, 1.0),
		lerpf(a.s, b.s, f), lerpf(a.v, b.v, f), lerpf(a.a, b.a, f))









const FOCO: Color = Color("ffffff")
const FOCO_GROSOR: int = 6








const FOCO_RELLENO: Color = Color(1.0, 1.0, 1.0, 0.18)
const FOCO_DESTELLO: Color = Color(1.0, 1.0, 1.0, 0.5)






static func focus_ring() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.draw_center = true
	sb.bg_color = FOCO_RELLENO
	sb.border_color = FOCO
	sb.set_border_width_all(FOCO_GROSOR)
	sb.set_expand_margin_all(float(FOCO_GROSOR))
	sb.set_corner_radius_all(10)
	sb.anti_aliasing = false
	return sb











static func estilo_seleccion(acento: Color, borde: int = 0) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SURFACE_HI
	sb.border_color = acento
	sb.border_width_left = 8
	sb.border_width_top = borde
	sb.border_width_right = borde
	sb.border_width_bottom = borde
	sb.set_corner_radius_all(3)
	sb.anti_aliasing = false




	return sb




static func modal_scrim() -> ColorRect:
	var r: ColorRect = scrim()
	r.color = MODAL_SCRIM
	return r


static func scrim() -> ColorRect:
	var r: ColorRect = ColorRect.new()
	r.color = SCRIM
	r.set_anchors_preset(Control.PRESET_FULL_RECT)
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return r




static func _button_sb(bg: Color, edge: Color, bottom: int) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = bg
	sb.border_color = edge
	sb.set_corner_radius_all(RADIUS)
	sb.border_width_left = 1
	sb.border_width_right = 1
	sb.border_width_top = 1
	sb.border_width_bottom = bottom
	sb.content_margin_left = 24.0
	sb.content_margin_right = 24.0

	sb.content_margin_top = 16.0 + float(SINK - bottom)
	sb.content_margin_bottom = 16.0 + float(bottom)
	return sb





static func apply_button(btn: Button, kind: Kind = Kind.NEUTRAL,
		font_size: int = 0) -> void:
	style_button(btn, kind, font_size)
	UiKit.add_feedback(btn)




	UiKit.set_cue(btn, "ui_click", BTN_PITCH.get(kind, 1.0))





static func apply_button_accent(btn: Button, col: Color, font_size: int = 0) -> void:
	var bg: Color = col
	var edge: Color = col.darkened(0.45)


	var fg: Color = on_color(col)
	marca_peligro(btn, col.is_equal_approx(DANGER))
	var normal: StyleBoxFlat = _button_sb(bg, edge, SINK)
	var pressed: StyleBoxFlat = _button_sb(bg.darkened(0.18), edge, SINK_PRESSED)
	btn.add_theme_stylebox_override("normal", normal)
	btn.add_theme_stylebox_override("hover", normal)
	btn.add_theme_stylebox_override("focus", normal)
	btn.add_theme_stylebox_override("pressed", pressed)
	btn.add_theme_stylebox_override("hover_pressed", pressed)
	for slot in ["font_color", "font_hover_color", "font_pressed_color", "font_focus_color"]:
		btn.add_theme_color_override(slot, fg)
	btn.add_theme_constant_override("outline_size", 0)
	if font_size > 0:
		btn.add_theme_font_size_override("font_size", font_size)
	UiKit.add_feedback(btn)
	UiKit.set_cue(btn, "ui_click", BTN_PITCH[Kind.PRIMARY])













static func apply_button_tinted(btn: Button, col: Color, font_size: int = 0,
		mezcla: float = 0.2) -> void:
	var bg: Color = SURFACE.lerp(col, mezcla)
	var edge: Color = bg.darkened(0.55)
	marca_peligro(btn, col.is_equal_approx(DANGER))
	var normal: StyleBoxFlat = _button_sb(bg, edge, SINK)
	var pressed: StyleBoxFlat = _button_sb(bg.darkened(0.18), edge, SINK_PRESSED)
	btn.add_theme_stylebox_override("normal", normal)
	btn.add_theme_stylebox_override("hover", normal)
	btn.add_theme_stylebox_override("focus", normal)
	btn.add_theme_stylebox_override("pressed", pressed)
	btn.add_theme_stylebox_override("hover_pressed", pressed)
	for slot in ["font_color", "font_hover_color", "font_pressed_color", "font_focus_color"]:
		btn.add_theme_color_override(slot, TEXT)
	btn.add_theme_constant_override("outline_size", 0)
	if font_size > 0:
		btn.add_theme_font_size_override("font_size", font_size)
	UiKit.add_feedback(btn)
	UiKit.set_cue(btn, "ui_click", BTN_PITCH[Kind.NEUTRAL])









const PELDANO_TINTE: float = 0.26
const PELDANO_FILO: int = 2
const PELDANO_HALO: int = 10
static func apply_button_peldano(btn: Button, col: Color, puesto: bool,
		font_size: int = 0) -> void:
	if puesto:
		apply_button_accent(btn, col, font_size)
		for slot in ["normal", "hover", "focus", "pressed", "hover_pressed"]:
			var sb: StyleBoxFlat = btn.get_theme_stylebox(slot)
			sb.shadow_color = Color(col.r, col.g, col.b, 0.45)
			sb.shadow_size = PELDANO_HALO
		return
	apply_button_tinted(btn, col, font_size, PELDANO_TINTE)
	for slot in ["normal", "hover", "focus", "pressed", "hover_pressed"]:
		var sb: StyleBoxFlat = btn.get_theme_stylebox(slot)
		sb.border_color = col.darkened(0.3)
		sb.border_width_left = PELDANO_FILO
		sb.border_width_right = PELDANO_FILO
		sb.border_width_top = PELDANO_FILO


	for slot in ["font_color", "font_hover_color", "font_pressed_color", "font_focus_color"]:
		btn.add_theme_color_override(slot, col)





static func plate_tinted(col: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = plate()
	sb.border_color = Color(col.r, col.g, col.b, 0.55)
	sb.border_width_left = 6
	sb.bg_color = Color(col.r, col.g, col.b, 1.0).darkened(0.72)
	sb.bg_color.a = 0.94
	return sb




















const DIV_COLORS: Dictionary = {
	1: Color("e3b23c"),
	2: Color("c2cbd6"),
	3: Color("c07a45"),
}
const DIV_COLOR_DEEP: Color = Color("8b909a")


static func div_color(div: int) -> Color:
	return DIV_COLORS.get(div, DIV_COLOR_DEEP)


static func plate_edged(col: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = plate()
	sb.border_color = Color(col.r, col.g, col.b, 0.75)
	sb.border_width_left = 8
	sb.border_width_top = 2
	sb.border_width_right = 2
	sb.border_width_bottom = 2
	sb.bg_color = SURFACE.lerp(col, 0.07)
	sb.bg_color.a = 0.94
	return sb


static func style_button(btn: Button, kind: Kind = Kind.NEUTRAL,
		font_size: int = 0) -> void:





	var bg: Color = SURFACE
	var edge: Color = SURFACE.darkened(0.55)
	var fg: Color = TEXT
	marca_peligro(btn, kind == Kind.WARN)
	match kind:
		Kind.PRIMARY:
			bg = accent()
			edge = accent().darkened(0.45)
			fg = on_accent()
		Kind.WARN:
			bg = DANGER
			edge = DANGER.darkened(0.45)
			fg = TEXT
		Kind.GHOST:
			bg = GHOST_BG


			edge = GHOST_EDGE
			fg = TEXT_DIM
		Kind.REAL:
			bg = MONEY
			edge = MONEY.darkened(0.5)
			fg = INK_DARK
		_:
			bg = SURFACE
			edge = SURFACE.darkened(0.55)
			fg = TEXT
	var normal: StyleBoxFlat = _button_sb(bg, edge, SINK)
	var pressed: StyleBoxFlat = _button_sb(bg.darkened(0.18), edge, SINK_PRESSED)



	if kind == Kind.REAL:
		for sb in [normal, pressed]:
			(sb as StyleBoxFlat).border_width_left = 3
			(sb as StyleBoxFlat).border_width_right = 3
			(sb as StyleBoxFlat).border_width_top = 3
	var off: StyleBoxFlat = _button_sb(SURFACE.darkened(0.3), SURFACE_LINE, 1)
	btn.add_theme_stylebox_override("normal", normal)
	btn.add_theme_stylebox_override("hover", normal)
	btn.add_theme_stylebox_override("focus", normal)
	btn.add_theme_stylebox_override("pressed", pressed)
	btn.add_theme_stylebox_override("hover_pressed", pressed)
	btn.add_theme_stylebox_override("disabled", off)
	btn.add_theme_color_override("font_color", fg)
	btn.add_theme_color_override("font_hover_color", fg)
	btn.add_theme_color_override("font_pressed_color", fg)
	btn.add_theme_color_override("font_focus_color", fg)


	btn.add_theme_color_override("font_disabled_color", DISABLED_INK)


	btn.add_theme_constant_override("outline_size", 0)
	if font_size > 0:
		btn.add_theme_font_size_override("font_size", font_size)








static func plate() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = PLATE_BG
	sb.border_color = SURFACE_LINE
	sb.set_corner_radius_all(3)
	sb.set_border_width_all(1)
	sb.set_content_margin_all(28.0)
	return sb


static func chip() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SURFACE
	sb.border_color = SURFACE_LINE
	sb.set_corner_radius_all(3)
	sb.set_border_width_all(1)
	sb.content_margin_left = 22.0
	sb.content_margin_right = 22.0
	sb.content_margin_top = 12.0
	sb.content_margin_bottom = 12.0
	return sb



static func tag(bg: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = bg
	sb.set_corner_radius_all(2)
	sb.content_margin_left = 14.0
	sb.content_margin_right = 14.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	return sb



























const DEACCENT: Dictionary = {

	"Á": "A", "À": "A", "Â": "A", "Ä": "A", "Ã": "A", "Å": "A", "Æ": "AE",
	"É": "E", "È": "E", "Ê": "E", "Ë": "E",
	"Í": "I", "Ì": "I", "Î": "I", "Ï": "I",
	"Ó": "O", "Ò": "O", "Ô": "O", "Ö": "O", "Õ": "O", "Ø": "O", "Œ": "OE",
	"Ú": "U", "Ù": "U", "Û": "U", "Ü": "U",
	"Ç": "C", "Ý": "Y", "Ÿ": "Y",

	"Č": "C", "Ć": "C", "Ď": "D", "Đ": "D", "Ě": "E", "Ľ": "L", "Ĺ": "L",
	"Ň": "N", "Ŕ": "R", "Ř": "R", "Š": "S", "Ť": "T", "Ů": "U", "Ž": "Z",

	"Ş": "S", "Ğ": "G", "İ": "I", "İ": "I",


	"Ё": "Е",

	"ß": "SS", "ẞ": "SS",





	"Ą": "A", "Ę": "E", "Ł": "L", "Ń": "N", "Ś": "S", "Ź": "Z",
	"Ż": "Z",




	"Ă": "A", "Ĕ": "E", "Ĭ": "I", "Ŏ": "O", "Ŭ": "U",
	"Ő": "O", "Ű": "U", "Ș": "S", "Ț": "T", "Ā": "A", "Ē": "E", "Ī": "I",
	"Ū": "U", "Ģ": "G", "Ķ": "K", "Ļ": "L", "Ņ": "N", "Ð": "D", "Þ": "TH",



	"Ō": "O",



	"Ŵ": "W", "Ŷ": "Y",




	"’": "'", "‘": "'", "‚": "'", "′": "'",
	"‐": "-", "‑": "-", "−": "-",
	"“": "\"", "”": "\"", "…": "...",
}



static func deaccent(s: String) -> String:
	var out: String = ""
	for ch in s:
		out += String(DEACCENT.get(ch, ch))
	return out










const GRITO_CONSERVA: String = "ÇŞ"



static func deaccent_grito(s: String) -> String:
	var out: String = ""
	for ch in s:
		out += ch if GRITO_CONSERVA.contains(ch) else String(DEACCENT.get(ch, ch))
	return out



static func caps(s: String) -> String:
	return deaccent_grito(s.to_upper())









static func llave(s: String) -> String:
	return deaccent(s.to_upper()).replace("\u200f", "")




const _CHOSEONG: String = "ㄱㄱㄴㄷㄷㄹㅁㅂㅂㅅㅅㅇㅈㅈㅊㅋㅌㅍㅎ"






static func inicial(s: String) -> String:
	var c: String = llave(s).left(1)
	if c.is_empty():
		return c
	var u: int = c.unicode_at(0)
	if u >= 44032 and u <= 55203:
		return _CHOSEONG[floori(float(u - 44032) / 588.0)]
	return c




static func empieza_por(s: String, prefijo: String) -> bool:
	if prefijo.length() == 1 and _CHOSEONG.contains(prefijo):
		return inicial(s) == prefijo
	return llave(s).begins_with(prefijo)




static func title(label: Label, size: int) -> void:
	label.add_theme_font_size_override("font_size", size)
	label.add_theme_color_override("font_color", TEXT)
	label.add_theme_constant_override("outline_size", 0)



static func rule(parent: Container, width: float = 0.0) -> ColorRect:
	var r: ColorRect = ColorRect.new()
	r.color = accent()
	r.custom_minimum_size = Vector2(width, 3)
	if width <= 0.0:
		r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(r)
	return r
