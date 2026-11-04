class_name TrophyIcon
extends Control













const GOLD: Color = Color("e6b83c")
const GOLD_D: Color = Color("a67c1e")
const SILVER: Color = Color("d0d5de")
const SILVER_D: Color = Color("878d9c")
const BRONZE: Color = Color("cd7f32")
const BRONZE_D: Color = Color("8a5322")
const BASE: Color = Color("3a3d44")
const BALL_W: Color = Color("f0f0f0")
const BALL_K: Color = Color("1a1c22")

var _type: String = "liga"








var _logo_type: String = ""




var _country: String = ""








var _generico: bool = false







const MEDALLON: Dictionary = {
	"champions": [Vector2(0.0, -0.14), 0.09],
	"copa": [Vector2(0.0, -0.02), 0.11],
	"europa": [Vector2(0.0, -0.2), 0.08],
	"conference": [Vector2(0.0, -0.22), 0.07],
	"clubes": [Vector2(0.0, -0.12), 0.15],
	"liga": [Vector2(0.0, 0.0), 0.185],
	"mundial": [Vector2(0.0, -0.14), 0.18],
	"continental": [Vector2(0.0, -0.06), 0.08],
	"copa_historia": [Vector2(0.0, -0.26), 0.075],




	"libertadores": [Vector2(0.0, -0.02), 0.075],
	"sudamericana": [Vector2(0.0, -0.17), 0.11],
	"concacaf": [Vector2(0.0, -0.2), 0.09],


	"oriente": [Vector2(0.0, -0.04), 0.08],
	"sol": [Vector2(0.0, -0.16), 0.11],


	"atlas": [Vector2(0.0, 0.14), 0.075],
	"baobab": [Vector2(0.0, 0.14), 0.085],


	"coral": [Vector2(0.0, 0.12), 0.08],




	"supereuropa": [Vector2(0.0, -0.15), 0.1],
	"supercopa": [Vector2(0.0, -0.08), 0.13],
	"copa_liga": [Vector2(0.0, -0.08), 0.11],
	"campeones": [Vector2(0.0, 0.0), 0.095],
	"recopa": [Vector2(0.0, -0.02), 0.09],
	"superafrica": [Vector2(0.0, 0.04), 0.09],


	"ligas": [Vector2(0.0, 0.08), 0.07],
}


const MEDALLON_LOGO: Dictionary = {
	"champions": "champions", "copa": "copa", "europa": "europa",
	"conference": "conference", "clubes": "clubes", "mundial": "mundial",
	"continental": "mundial", "copa_historia": "champions",
	"libertadores": "libertadores", "sudamericana": "sudamericana",
	"concacaf": "concacaf", "oriente": "oriente", "sol": "sol",
	"atlas": "atlas", "baobab": "baobab", "coral": "coral",
	"supereuropa": "supereuropa", "recopa": "recopa", "superafrica": "superafrica",
	"ligas": "ligas",
}





const MEDALLON_MIN: float = 24.0


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)





static func partido_de(comp: String) -> String:
	match comp:



		"ucl", "eul", "conf", "lib", "sud", "cca", "ace", "ac2", "caf", "cf2", "ofc", "recopa", "intercont", \
				"supereuropa", "superafrica", "ligas":
			return "partido_ucl"
		"cup":
			return "partido_cup"
		"cwc":
			return "partido_cwc"
	return "partido"


func set_type(t: String) -> void:



	_type = "clubes" if t == "intercontinental" else t
	queue_redraw()



func set_logo_type(t: String) -> void:
	_logo_type = t
	queue_redraw()



func set_country(c: String) -> void:
	_country = c
	queue_redraw()



func set_generico(v: bool) -> void:
	_generico = v
	queue_redraw()


func _draw() -> void:
	var s: float = minf(size.x, size.y)
	var c: Vector2 = size * 0.5
	match _type:

		"champions":
			_orejona(c, s)
		"europa":
			_uel_real(c, s)
		"conference":
			_uecl_real(c, s)
		"clubes":
			_aro_clubes(c, s)
		"copa":
			_copa_tapa(c, s)
		"liga":
			_plate(c, s)
		"ascenso":
			_rosette(c, s)





		"libertadores":
			_libertadores(c, s)
		"sudamericana":
			_sudamericana(c, s)
		"concacaf":
			_concacaf(c, s)




		"oriente":
			_oriente(c, s)
		"sol":
			_sol(c, s)




		"atlas":
			_atlas(c, s)
		"baobab":
			_baobab(c, s)



		"coral":
			_coral(c, s)




		"supereuropa":
			_supereuropa(c, s)
		"supercopa":
			_supercopa(c, s)
		"copa_liga":
			_copa_liga(c, s)
		"campeones":
			_campeones(c, s)
		"recopa":
			_recopa(c, s)
		"superafrica":
			_superafrica(c, s)
		"ligas":
			_ligas(c, s)
		"finalissima":
			_finalissima(c, s)
		"naciones":
			_naciones(c, s)
		"olimpico":
			_olimpico(c, s)

		"amo_america":
			_amo_america(c, s)
		"dos_mundos":
			_dos_mundos(c, s)





		"bota", "bota_ucl", "bota_cup", "bota_cwc", \
				"asist", "asist_ucl", "asist_cup", "asist_cwc", \
				"mvp", "mvp_ucl", "mvp_cup", "mvp_cwc", \
				"bota_lib", "bota_sud", "bota_cca", "bota_ace", "bota_ac2", "bota_caf", "bota_cf2", \
				"asist_lib", "asist_sud", "asist_cca", "asist_ace", "asist_ac2", "asist_caf", "asist_cf2", \
				"mvp_lib", "mvp_sud", "mvp_cca", "mvp_ace", "mvp_ac2", "mvp_caf", "mvp_cf2", \
				"bota_ofc", "asist_ofc", "mvp_ofc", \
				"bota_wc", "asist_wc", "mvp_wc", "bota_cont", "asist_cont", "mvp_cont":
			var partes: PackedStringArray = _type.split("_")
			var torneo: String = partes[1] if partes.size() > 1 else ""
			var col: Color = GOLD
			var dark: Color = GOLD_D
			if Continental.es_americana(torneo):





				col = Competitions.COMP_ACCENT.get(Continental.marca(torneo), GOLD)
				dark = col.darkened(0.38)
			elif torneo == "ucl" or torneo == "cont":


				col = SILVER
				dark = SILVER_D
			elif torneo == "cup":
				col = BRONZE
				dark = BRONZE_D
			var k: float = 1.0 if torneo.is_empty() else 0.78
			_marco(c, s, torneo, false)
			match partes[0]:
				"bota":
					_boot(c, s * k, col, dark)
				"asist":
					_assist(c, s * k, col, dark)
				_:
					_medal(c, s * k, col, dark)
			_marco(c, s, torneo, true)
		"balon_oro":
			_ball(c, s)



		"chico_oro":
			_chico_oro(c, s)
		"premio_mundo":
			_premio_mundo(c, s)
		"gol_ano":
			_gol_ano(c, s)


		"bota_eur":
			_bota_eur(c, s)






		"balon_historia":
			_ball(c, s, CareerTheme.HISTORIA, CareerTheme.HISTORIA_D, true)






		"copa_historia":
			var b: Vector2 = c + Vector2(0.0, -0.1 * s)
			draw_arc(b, 0.4 * s, 0.58 * PI, 1.32 * PI, 24, GOLD_D,
				maxf(0.05 * s, 2.0))
			draw_arc(b, 0.4 * s, -0.32 * PI, 0.42 * PI, 24, GOLD_D,
				maxf(0.05 * s, 2.0))
			_cup(c, s, GOLD, GOLD_D, 0.25, 0.1, 0.19, true)




		"mundial":
			_globe(c, s)
		"continental":
			_jarron(c, s)

		"grada":
			_stand(c, s)






		"partido":
			_matchball(c, s, GOLD, GOLD_D)
		"partido_ucl":
			_pm_estrellas(c, s)
		"partido_cup":
			_pm_laurel(c, s)
		"partido_cwc":
			_pm_orbita(c, s)
		"mes":
			_month(c, s)





		"club_mejor":
			_club_star(c, s)
		"club_def":
			_plaque(c, s, "def")
		"club_med":
			_plaque(c, s, "med")
		"club_del":
			_plaque(c, s, "del")


		"aficion":
			_pennant(c, s)

		"placa_gol":
			_plaque(c, s, "gol")
		"placa_asist":
			_plaque(c, s, "asist")
		"placa_partidos":
			_plaque(c, s, "partidos")








		"casa":
			_house(c, s)
		"mueble":
			_armchair(c, s)
		"academia":
			_cap(c, s)
		"serpiente":
			_snake(c, s)
		"corazon":
			_heart(c, s)
		"camiseta":
			_shirt(c, s)
		"reloj":
			_hourglass(c, s)
		"guante":
			_glove(c, s)
		"botella":
			_bottle(c, s)
		"pluma":
			_feather(c, s)
		"camara":
			_camera(c, s)
		"cristal":
			_glass_pane(c, s)

		"aspersor":
			_sprinkler(c, s)
		"vaso":
			_beer_cup(c, s)
		"bandeja":
			_food_tray(c, s)
		"dron":
			_drone(c, s)
		"playa":
			_beach_ball(c, s)
		"viral":
			_viral_phone(c, s)
		"silbato":
			_whistle(c, s)
		"muro":
			_wall_out(c, s)
		"apreton":
			_handshake(c, s)
		"banquillo":
			_dugout(c, s)
		"marcador":
			_scoreboard(c, s)








		"retiro":
			_hung_boots(c, s)
		"lesion":
			_cross(c, s)
		"estatua":
			_statue(c, s)
		"gema":
			_gem(c, s)
		"llama":
			_flame(c, s)
		"corona":
			_crown(c, s)
		"dinero":
			_money(c, s)
		"contrato":
			_contract(c, s)
		"dialogo":
			_bubble(c, s)
		"coche":
			_car(c, s)
		"maletin":
			_briefcase(c, s)
		"fenix":
			_phoenix(c, s)
		"poker":
			_poker_cup(c, s)
		_:
			_unknown(c, s)

	_comp_medal(c, s)










func _comp_medal(c: Vector2, s: float) -> void:
	if not MEDALLON.has(_type) or s < MEDALLON_MIN:
		return
	var spec: Array = MEDALLON[_type]
	var b: Vector2 = c + Vector2(spec[0]) * s
	var r: float = float(spec[1]) * s
	var tipo: String = _logo_auto()
	if not tipo.is_empty() and CompLogos.has(tipo):
		var tex: Texture2D = CompLogos.texture(tipo)
		if tex != null:
			var ts: Vector2 = tex.get_size()
			if ts.x > 0.0 and ts.y > 0.0:
				var claro: bool = CompLogos.luma(tipo) < CompLogo.LUMA_BASE
				_disco(b, r, s, claro)



				var caja: float = r * 1.3
				var k: float = minf(caja / ts.x, caja / ts.y)
				var dst: Vector2 = ts * k
				draw_texture_rect(tex, Rect2(b - dst * 0.5, dst), false)
				return






	if _generico or not NACIONALES.has(_type):
		return
	var pais: String = _pais()
	if pais.is_empty() or not Flags.has(pais):
		return
	var flag: Texture2D = Flags.texture(pais)
	if flag == null:
		return


	_disco(b, r, s, false)
	var fw: float = r * 1.44
	var fh: float = fw * float(Flags.H) / float(Flags.W)


	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	draw_texture_rect(flag, Rect2(b - Vector2(fw, fh) * 0.5, Vector2(fw, fh)), false)





const NACIONALES: Dictionary = {"liga": true, "copa": true, "supercopa": true,
	"copa_liga": true, "campeones": true}





func _disco(b: Vector2, r: float, s: float, claro: bool) -> void:
	draw_circle(b, r, CareerTheme.TEXT if claro else BASE)
	draw_arc(b, r, 0.0, TAU, 24, BASE.darkened(0.3) if claro else BALL_K,
		maxf(0.012 * s, 1.0))



func _pais() -> String:
	if not _country.is_empty():
		return _country
	if GameState.player_team_id.is_empty():
		return ""
	return Teams.country_of(GameState.player_team_id)





func _logo_auto() -> String:
	if not _logo_type.is_empty():
		return _logo_type
	if _type == "liga":



		var pais: String = _pais()
		return "" if pais.is_empty() else Competitions.league_logo(pais)
	return String(MEDALLON_LOGO.get(_type, ""))




func _cup(c: Vector2, s: float, col: Color, dark: Color,
		bowl_top: float, bowl_bot: float, ear_r: float, rounded: bool) -> void:
	_trap(c + Vector2(0.0, 0.4 * s), 0.22 * s, 0.15 * s, 0.09 * s, dark)
	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.12 * s, 0.1 * s, 0.2 * s), dark)









	var ec: float =(bowl_top - 0.06) * s
	draw_arc(c + Vector2(- ec, -0.16 * s), ear_r * s, 0.3 * PI, 1.7 * PI, 20,
		col, maxf(0.05 * s, 2.0))
	draw_arc(c + Vector2(ec, -0.16 * s), ear_r * s, -0.7 * PI, 0.7 * PI, 20,
		col, maxf(0.05 * s, 2.0))
	_trap(c + Vector2(0.0, -0.16 * s), bowl_top * s, bowl_bot * s, 0.18 * s, col)
	if rounded:
		draw_circle(c + Vector2(0.0, 0.02 * s), maxf(bowl_bot, 0.08) * s, col)
	draw_rect(Rect2(c.x - bowl_top * s, c.y - 0.35 * s, 2.0 * bowl_top * s, 0.05 * s),
		col.lightened(0.25))







	_poly(PackedVector2Array([
		c + Vector2(0.0, -0.34 * s), c + Vector2(bowl_top * s, -0.34 * s),
		c + Vector2(bowl_bot * s, 0.02 * s), c + Vector2(0.0, 0.02 * s)]),
		col.darkened(0.14))
	draw_rect(Rect2(c.x - bowl_top * 0.63 * s, c.y - 0.3 * s, 0.05 * s, 0.13 * s),
		Color(1, 1, 1, 0.18))














func _orejona(c: Vector2, s: float) -> void:


	_trap(c + Vector2(0.0, 0.42 * s), 0.14 * s, 0.17 * s, 0.05 * s, SILVER_D)
	_trap(c + Vector2(0.0, 0.33 * s), 0.06 * s, 0.11 * s, 0.05 * s, SILVER_D)
	var w: float = maxf(0.055 * s, 2.0)
	for sx in [-1.0, 1.0]:
		var pts: PackedVector2Array = []
		for i in 17:
			var t: float = float(i) / 16.0
			var y: float = lerpf(-0.36, 0.2, t)
			var x: float = 0.15 + 0.29 * sin(t * PI) + 0.04 *(1.0 - t)
			pts.append(c + Vector2(sx * x, y) * s)
		draw_polyline(pts, SILVER_D, w + maxf(0.03 * s, 1.0))
		draw_polyline(pts, SILVER, w)
	var cuenco: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.2, -0.4) * s, c + Vector2(0.2, -0.4) * s,
		c + Vector2(0.17, -0.22) * s, c + Vector2(0.19, -0.02) * s,
		c + Vector2(0.1, 0.16) * s, c + Vector2(0.04, 0.3) * s,
		c + Vector2(-0.04, 0.3) * s, c + Vector2(-0.1, 0.16) * s,
		c + Vector2(-0.19, -0.02) * s, c + Vector2(-0.17, -0.22) * s])
	_poly(cuenco, SILVER)
	_poly(PackedVector2Array([c + Vector2(0.0, -0.4) * s, c + Vector2(0.2, -0.4) * s,
		c + Vector2(0.17, -0.22) * s, c + Vector2(0.19, -0.02) * s,
		c + Vector2(0.1, 0.16) * s, c + Vector2(0.0, 0.3) * s]), SILVER.darkened(0.14))
	draw_rect(Rect2(c.x - 0.21 * s, c.y - 0.44 * s, 0.42 * s, 0.05 * s), SILVER.lightened(0.25))





func _uel_real(c: Vector2, s: float) -> void:
	var marmol: Color = Color("e0c35a")
	_trap(c + Vector2(0.0, 0.4 * s), 0.2 * s, 0.2 * s, 0.08 * s, marmol.darkened(0.35))
	_trap(c + Vector2(0.0, 0.39 * s), 0.17 * s, 0.17 * s, 0.05 * s, marmol)
	_trap(c + Vector2(0.0, 0.27 * s), 0.07 * s, 0.12 * s, 0.05 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.045 * s, c.y + 0.02 * s, 0.09 * s, 0.22 * s), SILVER_D)
	draw_circle(c + Vector2(0.0, 0.12 * s), 0.07 * s, SILVER)
	var cuenco: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.34, -0.38) * s, c + Vector2(0.34, -0.38) * s,
		c + Vector2(0.27, -0.3) * s, c + Vector2(0.25, -0.14) * s,
		c + Vector2(0.14, 0.0) * s, c + Vector2(0.06, 0.04) * s,
		c + Vector2(-0.06, 0.04) * s, c + Vector2(-0.14, 0.0) * s,
		c + Vector2(-0.25, -0.14) * s, c + Vector2(-0.27, -0.3) * s])
	_poly(cuenco, SILVER)
	_poly(PackedVector2Array([c + Vector2(0.0, -0.38) * s, c + Vector2(0.34, -0.38) * s,
		c + Vector2(0.27, -0.3) * s, c + Vector2(0.25, -0.14) * s,
		c + Vector2(0.14, 0.0) * s, c + Vector2(0.0, 0.04) * s]), SILVER.darkened(0.14))
	draw_rect(Rect2(c.x - 0.34 * s, c.y - 0.42 * s, 0.68 * s, 0.05 * s), SILVER.lightened(0.25))





func _uecl_real(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.43 * s), 0.14 * s, 0.14 * s, 0.04 * s, SILVER_D)
	var cuerpo: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.22, -0.44) * s, c + Vector2(0.22, -0.44) * s,
		c + Vector2(0.15, -0.2) * s, c + Vector2(0.08, 0.1) * s,
		c + Vector2(0.1, 0.4) * s, c + Vector2(-0.1, 0.4) * s,
		c + Vector2(-0.08, 0.1) * s, c + Vector2(-0.15, -0.2) * s])
	_poly(cuerpo, SILVER)
	var w: float = maxf(0.025 * s, 1.0)
	for i in 7:
		var y: float = -0.38 + 0.11 * float(i)
		var hw: float = 0.2 - 0.05 * float(i) if i < 4 else 0.08
		draw_line(c + Vector2(- hw, y + 0.05) * s, c + Vector2(hw, y - 0.03) * s, SILVER_D, w)
	draw_rect(Rect2(c.x - 0.22 * s, c.y - 0.46 * s, 0.44 * s, 0.04 * s), SILVER.lightened(0.25))


func _copa_tapa(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.41 * s), 0.24 * s, 0.18 * s, 0.07 * s, GOLD_D)
	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.16 * s, 0.1 * s, 0.2 * s), GOLD_D)
	for sx in [-1.0, 1.0]:
		draw_arc(c + Vector2(sx * 0.2 * s, 0.0), 0.1 * s,
			(-0.5 if sx > 0 else 0.5) * PI,(0.5 if sx > 0 else 1.5) * PI, 16, GOLD_D,
			maxf(0.05 * s, 2.0))
	draw_circle(c + Vector2(0.0, 0.0), 0.21 * s, GOLD_D)
	draw_circle(c + Vector2(0.0, 0.0), 0.18 * s, GOLD)

	_trap(c + Vector2(0.0, -0.22 * s), 0.12 * s, 0.22 * s, 0.05 * s, GOLD_D)
	draw_circle(c + Vector2(0.0, -0.29 * s), 0.1 * s, GOLD)
	draw_rect(Rect2(c.x - 0.1 * s, c.y - 0.29 * s, 0.2 * s, 0.05 * s), GOLD)
	draw_circle(c + Vector2(0.0, -0.42 * s), 0.05 * s, GOLD_D)
	draw_rect(Rect2(c.x - 0.02 * s, c.y - 0.42 * s, 0.04 * s, 0.05 * s), GOLD_D)


func _jarron(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.22 * s, 0.17 * s, 0.06 * s, SILVER_D)
	_trap(c + Vector2(0.0, 0.26 * s), 0.1 * s, 0.14 * s, 0.1 * s, SILVER)
	_trap(c + Vector2(0.0, 0.06 * s), 0.19 * s, 0.1 * s, 0.1 * s, SILVER)
	_trap(c + Vector2(0.0, -0.2 * s), 0.09 * s, 0.19 * s, 0.16 * s, SILVER)
	_trap(c + Vector2(0.0, -0.4 * s), 0.2 * s, 0.09 * s, 0.05 * s, SILVER)
	draw_rect(Rect2(c.x - 0.2 * s, c.y - 0.46 * s, 0.4 * s, 0.04 * s), SILVER.lightened(0.25))
	draw_rect(Rect2(c.x + 0.02 * s, c.y - 0.44 * s, 0.07 * s, 0.84 * s), Color(0, 0, 0, 0.14))


func _aro_clubes(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.41 * s), 0.22 * s, 0.16 * s, 0.07 * s, GOLD_D)
	_trap(c + Vector2(0.0, 0.29 * s), 0.1 * s, 0.14 * s, 0.05 * s, GOLD)
	var b: Vector2 = c + Vector2(0.0, -0.12 * s)
	draw_arc(b, 0.3 * s, 0.0, TAU, 32, GOLD_D, maxf(0.1 * s, 3.0))
	draw_arc(b, 0.3 * s, 0.0, TAU, 32, GOLD, maxf(0.06 * s, 2.0))
	_pm_balon(b, 0.15 * s)















const MADERA: Color = Color("7a4a26")
const MADERA_D: Color = Color("4a2c16")


func _libertadores(c: Vector2, s: float) -> void:



	_trap(c + Vector2(0.0, 0.4 * s), 0.19 * s, 0.22 * s, 0.07 * s, MADERA)
	draw_rect(Rect2(c.x - 0.19 * s, c.y + 0.33 * s, 0.38 * s, 0.03 * s), MADERA_D)
	for px in [-0.12, 0.0, 0.12]:
		draw_rect(Rect2(c.x +(px - 0.03) * s, c.y + 0.385 * s, 0.06 * s, 0.04 * s), GOLD)

	_trap(c + Vector2(0.0, 0.29 * s), 0.07 * s, 0.12 * s, 0.04 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.04 * s, c.y + 0.12 * s, 0.08 * s, 0.15 * s), SILVER_D)
	draw_circle(c + Vector2(0.0, 0.18 * s), 0.055 * s, SILVER)


	for sx in [-1.0, 1.0]:
		draw_arc(c + Vector2(sx * 0.18 * s, -0.06 * s), 0.07 * s,
			(-0.55 if sx > 0 else 0.45) * PI,(0.55 if sx > 0 else 1.55) * PI, 14,
			SILVER_D, maxf(0.045 * s, 1.5))

	_poly(PackedVector2Array([
		c + Vector2(-0.19, -0.16) * s, c + Vector2(0.19, -0.16) * s,
		c + Vector2(0.17, 0.02) * s, c + Vector2(0.08, 0.13) * s,
		c + Vector2(-0.08, 0.13) * s, c + Vector2(-0.17, 0.02) * s]), SILVER)
	_poly(PackedVector2Array([
		c + Vector2(0.0, -0.16) * s, c + Vector2(0.19, -0.16) * s,
		c + Vector2(0.17, 0.02) * s, c + Vector2(0.08, 0.13) * s,
		c + Vector2(0.0, 0.13) * s]), SILVER.darkened(0.14))
	draw_rect(Rect2(c.x - 0.2 * s, c.y - 0.2 * s, 0.4 * s, 0.05 * s), SILVER.lightened(0.25))



	var esf: Vector2 = c + Vector2(0.0, -0.255 * s)
	draw_circle(esf, 0.065 * s, SILVER_D)
	draw_circle(esf, 0.05 * s, SILVER)
	var w: float = maxf(0.035 * s, 1.5)
	var cad: Vector2 = c + Vector2(0.0, -0.355 * s)
	draw_line(cad + Vector2(-0.012, 0.0) * s, esf + Vector2(-0.025, -0.05) * s, SILVER, w)
	draw_line(cad + Vector2(0.012, 0.0) * s, c + Vector2(0.075, -0.33) * s, SILVER, w)
	_poly(PackedVector2Array([
		c + Vector2(-0.04, -0.415) * s, c + Vector2(0.04, -0.415) * s,
		c + Vector2(0.025, -0.35) * s, c + Vector2(-0.025, -0.35) * s]), SILVER)
	draw_line(c + Vector2(-0.035, -0.41) * s, c + Vector2(-0.085, -0.375) * s, SILVER, w)
	draw_line(c + Vector2(0.035, -0.41) * s, c + Vector2(0.075, -0.45) * s, SILVER, w)
	draw_circle(c + Vector2(0.0, -0.445) * s, 0.032 * s, SILVER)


func _sudamericana(c: Vector2, s: float) -> void:


	_trap(c + Vector2(0.0, 0.405 * s), 0.2 * s, 0.22 * s, 0.065 * s, SILVER_D)
	_trap(c + Vector2(0.0, 0.41 * s), 0.18 * s, 0.2 * s, 0.05 * s, BALL_K)



	var w: float = maxf(0.06 * s, 2.0)
	for sx in [-1.0, 1.0]:
		var pts: PackedVector2Array = []
		for i in 13:
			var t: float = float(i) / 12.0
			var y: float = lerpf(0.35, 0.0, t)
			var x: float = 0.16 - 0.05 * t + 0.045 * sin(t * TAU * 1.5)
			pts.append(c + Vector2(sx * x, y) * s)
		draw_polyline(pts, SILVER_D, w + maxf(0.025 * s, 1.0))
		draw_polyline(pts, SILVER, w)


	var b: Vector2 = c + Vector2(0.0, -0.17 * s)
	draw_circle(b, 0.25 * s, SILVER_D)
	draw_circle(b, 0.22 * s, SILVER)
	_poly(_ngon(b, 0.075 * s, 5, - PI * 0.5), SILVER_D)

	for i in 5:
		var a: float = lerpf(-0.92, -0.08, float(i) / 4.0) * PI
		_poly(_star(b + Vector2(cos(a), sin(a)) * 0.165 * s, 0.05 * s, 0.022 * s), GOLD)


	var cinta_a: PackedVector2Array = []
	var cinta_b: PackedVector2Array = []
	for i in 13:
		var t: float = float(i) / 12.0
		var x: float = lerpf(-0.27, 0.27, t)
		var y: float = 0.03 + 0.05 *(1.0 - pow(2.0 * t - 1.0, 2.0))
		cinta_a.append(b + Vector2(x, y - 0.03) * s)
		cinta_b.append(b + Vector2(x, y + 0.03) * s)
	cinta_b.reverse()
	_poly(cinta_a + cinta_b, GOLD)
	draw_polyline(cinta_a, GOLD_D, maxf(0.012 * s, 1.0))
	for sx in [-1.0, 1.0]:
		var e: Vector2 = b + Vector2(sx * 0.27, 0.03) * s
		_poly(PackedVector2Array([e + Vector2(0.0, -0.03) * s, e + Vector2(0.0, 0.03) * s,
			e + Vector2(sx * 0.04, 0.12) * s, e + Vector2(sx * 0.07, 0.07) * s]), GOLD_D)


func _concacaf(c: Vector2, s: float) -> void:



	var peld: Color = BASE.lightened(0.12)
	for k in 3:
		var hw: float = 0.24 - 0.05 * float(k)
		var y0: float = 0.4 - 0.06 * float(k)
		draw_rect(Rect2(c.x - hw * s, c.y + y0 * s, 2.0 * hw * s, 0.06 * s), peld)
		draw_rect(Rect2(c.x - hw * s, c.y + y0 * s, 2.0 * hw * s, 0.015 * s), SILVER_D)

	draw_rect(Rect2(c.x - 0.04 * s, c.y - 0.01 * s, 0.08 * s, 0.3 * s), GOLD_D)
	draw_rect(Rect2(c.x - 0.07 * s, c.y + 0.1 * s, 0.14 * s, 0.035 * s), GOLD)


	var w: float = maxf(0.05 * s, 2.0)
	for sx in [-1.0, 1.0]:
		draw_polyline(PackedVector2Array([
			c + Vector2(sx * 0.16, -0.34) * s, c + Vector2(sx * 0.32, -0.34) * s,
			c + Vector2(sx * 0.32, -0.13) * s, c + Vector2(sx * 0.13, -0.13) * s]),
			GOLD_D, w)


	_trap(c + Vector2(0.0, -0.2 * s), 0.19 * s, 0.11 * s, 0.2 * s, GOLD)
	_poly(PackedVector2Array([
		c + Vector2(0.0, -0.4) * s, c + Vector2(0.19, -0.4) * s,
		c + Vector2(0.11, 0.0) * s, c + Vector2(0.0, 0.0) * s]), GOLD.darkened(0.14))
	draw_rect(Rect2(c.x - 0.21 * s, c.y - 0.44 * s, 0.42 * s, 0.05 * s), GOLD.lightened(0.25))


func _oriente(c: Vector2, s: float) -> void:


	var jade: Color = Color("3f8f6e")
	_trap(c + Vector2(0.0, 0.41 * s), 0.18 * s, 0.21 * s, 0.05 * s, jade.darkened(0.35))
	_trap(c + Vector2(0.0, 0.35 * s), 0.13 * s, 0.16 * s, 0.03 * s, jade)

	_trap(c + Vector2(0.0, 0.27 * s), 0.05 * s, 0.09 * s, 0.05 * s, GOLD_D)
	_poly(PackedVector2Array([
		c + Vector2(-0.07, 0.22) * s, c + Vector2(0.07, 0.22) * s,
		c + Vector2(0.18, 0.08) * s, c + Vector2(0.19, -0.06) * s,
		c + Vector2(0.12, -0.18) * s, c + Vector2(0.08, -0.22) * s,
		c + Vector2(-0.08, -0.22) * s, c + Vector2(-0.12, -0.18) * s,
		c + Vector2(-0.19, -0.06) * s, c + Vector2(-0.18, 0.08) * s]), GOLD)

	_poly(PackedVector2Array([
		c + Vector2(0.0, 0.22) * s, c + Vector2(0.07, 0.22) * s,
		c + Vector2(0.18, 0.08) * s, c + Vector2(0.19, -0.06) * s,
		c + Vector2(0.12, -0.18) * s, c + Vector2(0.08, -0.22) * s,
		c + Vector2(0.0, -0.22) * s]), GOLD.darkened(0.14))
	draw_rect(Rect2(c.x - 0.11 * s, c.y - 0.25 * s, 0.22 * s, 0.04 * s), GOLD.lightened(0.25))

	draw_circle(c + Vector2(0.0, -0.27 * s), 0.09 * s, GOLD_D)
	draw_rect(Rect2(c.x - 0.1 * s, c.y - 0.27 * s, 0.2 * s, 0.03 * s), GOLD_D)
	_poly(PackedVector2Array([
		c + Vector2(-0.035, -0.34) * s, c + Vector2(0.035, -0.34) * s,
		c + Vector2(0.0, -0.47) * s]), GOLD)


func _sol(c: Vector2, s: float) -> void:

	_trap(c + Vector2(0.0, 0.41 * s), 0.17 * s, 0.21 * s, 0.05 * s, BASE.lightened(0.1))
	draw_rect(Rect2(c.x - 0.21 * s, c.y + 0.36 * s, 0.42 * s, 0.015 * s), GOLD_D)
	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.08 * s, 0.1 * s, 0.28 * s), SILVER_D)
	draw_rect(Rect2(c.x - 0.08 * s, c.y + 0.08 * s, 0.16 * s, 0.03 * s), SILVER)


	var d: Vector2 = c + Vector2(0.0, -0.16 * s)
	for i in 12:
		var a: float = float(i) / 12.0 * TAU - PI * 0.5
		var rad: Vector2 = Vector2(cos(a), sin(a))
		var lado: Vector2 = rad.orthogonal() * 0.05 * s
		var base: Vector2 = d + rad * 0.2 * s
		var largo: float = 0.33 if i % 2 == 0 else 0.28
		_poly(PackedVector2Array([base - lado, d + rad * largo * s, base + lado]),
			GOLD_D if i % 2 == 0 else GOLD)
	draw_circle(d, 0.22 * s, GOLD_D)
	draw_circle(d, 0.19 * s, GOLD)


func _atlas(c: Vector2, s: float) -> void:


	var arena: Color = Color("b08a5a")
	_trap(c + Vector2(0.0, 0.41 * s), 0.2 * s, 0.22 * s, 0.05 * s, arena.darkened(0.35))
	_trap(c + Vector2(0.0, 0.35 * s), 0.17 * s, 0.19 * s, 0.03 * s, arena)

	for k in 4:
		var y0: float = 0.32 - float(k) * 0.12
		var ancho: float = 0.17 - float(k) * 0.04
		draw_rect(Rect2(c.x - ancho * s, c.y +(y0 - 0.12) * s, ancho * 2.0 * s, 0.12 * s), GOLD)

		draw_rect(Rect2(c.x, c.y +(y0 - 0.12) * s, ancho * s, 0.12 * s), GOLD.darkened(0.14))
		draw_rect(Rect2(c.x - ancho * s, c.y +(y0 - 0.12) * s, ancho * 2.0 * s, 0.015 * s),
			GOLD.lightened(0.25))

	_pm_balon(c + Vector2(0.0, -0.27 * s), 0.08 * s)


func _baobab(c: Vector2, s: float) -> void:

	_trap(c + Vector2(0.0, 0.41 * s), 0.17 * s, 0.21 * s, 0.05 * s, BASE.lightened(0.1))
	draw_rect(Rect2(c.x - 0.21 * s, c.y + 0.36 * s, 0.42 * s, 0.015 * s), GOLD_D)


	_poly(PackedVector2Array([
		c + Vector2(-0.1, 0.36) * s, c + Vector2(0.1, 0.36) * s,
		c + Vector2(0.14, 0.18) * s, c + Vector2(0.12, 0.0) * s,
		c + Vector2(0.07, -0.12) * s, c + Vector2(-0.07, -0.12) * s,
		c + Vector2(-0.12, 0.0) * s, c + Vector2(-0.14, 0.18) * s]), GOLD)
	_poly(PackedVector2Array([
		c + Vector2(0.0, 0.36) * s, c + Vector2(0.1, 0.36) * s,
		c + Vector2(0.14, 0.18) * s, c + Vector2(0.12, 0.0) * s,
		c + Vector2(0.07, -0.12) * s, c + Vector2(0.0, -0.12) * s]), GOLD.darkened(0.14))

	var w: float = maxf(0.035 * s, 1.5)
	for dx in [-0.22, -0.11, 0.11, 0.22]:
		draw_line(c + Vector2(dx * 0.3, -0.12) * s, c + Vector2(dx, -0.26) * s, GOLD_D, w)
	_ellipse(c + Vector2(0.0, -0.3 * s), 0.27 * s, 0.07 * s, GOLD_D)
	_ellipse(c + Vector2(0.0, -0.31 * s), 0.24 * s, 0.05 * s, GOLD)


func _coral(c: Vector2, s: float) -> void:




	var laguna: Color = Color("1fa3a8")
	var hueso: Color = Color("efe6d2")
	var casco: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.42, 0.22) * s, c + Vector2(-0.31, 0.31) * s,
		c + Vector2(0.31, 0.31) * s, c + Vector2(0.42, 0.22) * s,
		c + Vector2(0.33, 0.41) * s, c + Vector2(0.16, 0.46) * s,
		c + Vector2(-0.16, 0.46) * s, c + Vector2(-0.33, 0.41) * s])
	_poly(casco, laguna)

	_poly(PackedVector2Array([
		c + Vector2(-0.34, 0.38) * s, c + Vector2(0.34, 0.38) * s,
		c + Vector2(0.33, 0.41) * s, c + Vector2(0.16, 0.46) * s,
		c + Vector2(-0.16, 0.46) * s, c + Vector2(-0.33, 0.41) * s]), laguna.darkened(0.35))
	draw_rect(Rect2(c.x - 0.31 * s, c.y + 0.29 * s, 0.62 * s, 0.035 * s), hueso)


	_poly(PackedVector2Array([
		c + Vector2(-0.13, 0.29) * s, c + Vector2(0.13, 0.29) * s,
		c + Vector2(0.14, 0.17) * s, c + Vector2(0.1, 0.05) * s,
		c + Vector2(0.05, -0.01) * s, c + Vector2(-0.05, -0.01) * s,
		c + Vector2(-0.1, 0.05) * s, c + Vector2(-0.14, 0.17) * s]), GOLD)

	_poly(PackedVector2Array([
		c + Vector2(0.0, 0.29) * s, c + Vector2(0.13, 0.29) * s,
		c + Vector2(0.14, 0.17) * s, c + Vector2(0.1, 0.05) * s,
		c + Vector2(0.05, -0.01) * s, c + Vector2(0.0, -0.01) * s]), GOLD.darkened(0.14))



	var ramas: Array = [
		[Vector2(-0.03, 0.02), Vector2(-0.13, -0.1), Vector2(-0.23, -0.22), Vector2(-0.29, -0.36)],
		[Vector2(-0.13, -0.1), Vector2(-0.27, -0.14), Vector2(-0.37, -0.22)],
		[Vector2(0.0, 0.0), Vector2(0.0, -0.16), Vector2(0.02, -0.3), Vector2(0.0, -0.45)],
		[Vector2(0.0, -0.18), Vector2(-0.09, -0.31)],
		[Vector2(0.03, 0.02), Vector2(0.13, -0.1), Vector2(0.23, -0.22), Vector2(0.29, -0.36)],
		[Vector2(0.13, -0.1), Vector2(0.27, -0.14), Vector2(0.37, -0.22)],
	]
	var grueso: float = maxf(0.075 * s, 2.5)
	var fino: float = maxf(0.045 * s, 1.5)
	for pasada in 2:
		var col: Color = GOLD_D if pasada == 0 else GOLD
		var w: float = grueso if pasada == 0 else fino
		for rama in ramas:
			var pts: PackedVector2Array = PackedVector2Array()
			for v in rama:
				pts.append(c + Vector2(v) * s)
			draw_polyline(pts, col, w)

			for p in pts:
				draw_circle(p, w * 0.5, col)


	for rama in ramas:
		draw_circle(c + Vector2(rama[rama.size() - 1]) * s, maxf(0.035 * s, 1.2), hueso)







func _amo_america(c: Vector2, s: float) -> void:
	_libertadores(c + Vector2(0.0, -0.1 * s), s * 0.74)
	var tonos: Array = [[BRONZE, BRONZE_D], [GOLD, GOLD_D], [SILVER, SILVER_D]]
	for i in 3:
		var p: Vector2 = c + Vector2((float(i) - 1.0) * 0.28 * s, 0.3 * s)
		var r: float =(0.15 if i == 1 else 0.13) * s
		_poly(_escudo(p, r * 1.18), tonos[i][1])
		_poly(_escudo(p, r), tonos[i][0])





func _dos_mundos(c: Vector2, s: float) -> void:
	_globe(c + Vector2(0.0, 0.14 * s), s * 0.64)
	_orejona(c + Vector2(-0.27 * s, -0.22 * s), s * 0.5)
	_libertadores(c + Vector2(0.27 * s, -0.22 * s), s * 0.5)



func _escudo(p: Vector2, r: float) -> PackedVector2Array:
	return PackedVector2Array([
		p + Vector2(-0.8, -0.85) * r, p + Vector2(0.8, -0.85) * r,
		p + Vector2(0.8, 0.15) * r, p + Vector2(0.0, 1.0) * r,
		p + Vector2(-0.8, 0.15) * r])















func _supereuropa(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.15 * s, 0.19 * s, 0.04 * s, SILVER_D)
	_trap(c + Vector2(0.0, 0.34 * s), 0.04 * s, 0.11 * s, 0.05 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.035 * s, c.y + 0.08 * s, 0.07 * s, 0.24 * s), SILVER_D)
	draw_circle(c + Vector2(0.0, 0.17 * s), 0.055 * s, SILVER)
	var e: Vector2 = c + Vector2(0.0, -0.15 * s)
	_ellipse(e, 0.215 * s, 0.31 * s, SILVER_D)
	_ellipse(e, 0.19 * s, 0.285 * s, SILVER)


	var mc: PackedVector2Array = PackedVector2Array()
	for i in 17:
		var a: float = - PI * 0.5 + float(i) / 16.0 * PI
		mc.append(e + Vector2(cos(a) * 0.19, sin(a) * 0.285) * s)
	_poly(mc, SILVER.darkened(0.14))

	draw_rect(Rect2(e.x - 0.155 * s, e.y - 0.12 * s, 0.045 * s, 0.14 * s), Color(1, 1, 1, 0.18))





func _supercopa(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.2 * s, 0.24 * s, 0.04 * s, BASE)
	_trap(c + Vector2(0.0, 0.35 * s), 0.07 * s, 0.13 * s, 0.04 * s, GOLD_D)
	draw_rect(Rect2(c.x - 0.03 * s, c.y + 0.18 * s, 0.06 * s, 0.14 * s), GOLD_D)
	var p: Vector2 = c + Vector2(0.0, -0.08 * s)
	var r: float = 0.345 * s
	_poly(_escudo(p, 0.4 * s), GOLD_D)
	_poly(_escudo(p, r), GOLD)
	_poly(PackedVector2Array([p + Vector2(0.0, -0.85) * r, p + Vector2(0.8, -0.85) * r,
		p + Vector2(0.8, 0.15) * r, p + Vector2(0.0, 1.0) * r]), GOLD.darkened(0.14))
	draw_rect(Rect2(p.x - 0.8 * r, p.y - 0.85 * r, 1.6 * r, 0.04 * s), GOLD.lightened(0.25))
	draw_rect(Rect2(p.x - 0.23 * s, p.y - 0.22 * s, 0.045 * s, 0.16 * s), Color(1, 1, 1, 0.18))





func _copa_liga(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.2 * s, 0.24 * s, 0.04 * s, SILVER_D)
	_trap(c + Vector2(0.0, 0.31 * s), 0.06 * s, 0.14 * s, 0.07 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.14 * s, 0.1 * s, 0.12 * s), SILVER_D)
	var w: float = maxf(0.05 * s, 2.0)
	for sx in [-1.0, 1.0]:

		var o: Vector2 = c + Vector2(sx * 0.27 * s, -0.2 * s)
		draw_arc(o, 0.09 * s, 0.0, TAU, 20, SILVER_D, w + maxf(0.025 * s, 1.0))
		draw_arc(o, 0.09 * s, 0.0, TAU, 20, SILVER, w)
	_trap(c + Vector2(0.0, -0.1 * s), 0.21 * s, 0.17 * s, 0.25 * s, SILVER_D)
	_trap(c + Vector2(0.0, -0.1 * s), 0.18 * s, 0.145 * s, 0.22 * s, SILVER)
	_poly(PackedVector2Array([c + Vector2(0.0, -0.32) * s, c + Vector2(0.18, -0.32) * s,
		c + Vector2(0.145, 0.12) * s, c + Vector2(0.0, 0.12) * s]), SILVER.darkened(0.14))
	draw_rect(Rect2(c.x - 0.23 * s, c.y - 0.38 * s, 0.46 * s, 0.05 * s), SILVER.lightened(0.25))
	draw_rect(Rect2(c.x - 0.14 * s, c.y - 0.29 * s, 0.04 * s, 0.1 * s), Color(1, 1, 1, 0.18))




func _campeones(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.18 * s, 0.24 * s, 0.04 * s, GOLD_D)
	_trap(c + Vector2(0.0, 0.33 * s), 0.05 * s, 0.12 * s, 0.05 * s, GOLD_D)
	draw_rect(Rect2(c.x - 0.045 * s, c.y + 0.12 * s, 0.09 * s, 0.18 * s), GOLD_D)

	draw_rect(Rect2(c.x - 0.03 * s, c.y - 0.26 * s, 0.06 * s, 0.16 * s), GOLD_D)
	_trap(c + Vector2(0.0, -0.33 * s), 0.16 * s, 0.07 * s, 0.08 * s, GOLD)
	_poly(PackedVector2Array([c + Vector2(0.0, -0.41) * s, c + Vector2(0.16, -0.41) * s,
		c + Vector2(0.07, -0.25) * s, c + Vector2(0.0, -0.25) * s]), GOLD.darkened(0.14))
	draw_rect(Rect2(c.x - 0.17 * s, c.y - 0.45 * s, 0.34 * s, 0.045 * s), GOLD.lightened(0.25))


	var w: float = maxf(0.05 * s, 2.0)
	draw_arc(c + Vector2(-0.22 * s, -0.05 * s), 0.08 * s, 0.3 * PI, 1.7 * PI, 16, GOLD_D, w)
	draw_arc(c + Vector2(0.22 * s, -0.05 * s), 0.08 * s, -0.7 * PI, 0.7 * PI, 16, GOLD_D, w)
	_trap(c + Vector2(0.0, 0.01 * s), 0.27 * s, 0.12 * s, 0.13 * s, GOLD)
	_poly(PackedVector2Array([c + Vector2(0.0, -0.12) * s, c + Vector2(0.27, -0.12) * s,
		c + Vector2(0.12, 0.14) * s, c + Vector2(0.0, 0.14) * s]), GOLD.darkened(0.14))
	draw_rect(Rect2(c.x - 0.28 * s, c.y - 0.15 * s, 0.56 * s, 0.045 * s), GOLD.lightened(0.25))
	draw_rect(Rect2(c.x - 0.22 * s, c.y - 0.09 * s, 0.04 * s, 0.07 * s), Color(1, 1, 1, 0.18))





func _recopa(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.18 * s, 0.22 * s, 0.04 * s, SILVER_D)
	_trap(c + Vector2(0.0, 0.33 * s), 0.05 * s, 0.12 * s, 0.05 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.045 * s, c.y + 0.12 * s, 0.09 * s, 0.18 * s), SILVER_D)

	var w: float = maxf(0.06 * s, 2.0)
	var ac: Vector2 = c + Vector2(0.0, -0.16 * s)
	draw_arc(ac, 0.25 * s, PI, TAU, 24, SILVER_D, w + maxf(0.03 * s, 1.0))
	draw_arc(ac, 0.25 * s, PI, TAU, 24, SILVER, w)
	_trap(c + Vector2(0.0, -0.04 * s), 0.29 * s, 0.15 * s, 0.12 * s, SILVER)
	var fondo: Vector2 = c + Vector2(0.0, 0.06 * s)
	draw_circle(fondo, 0.15 * s, SILVER)
	var mc: PackedVector2Array = PackedVector2Array([c + Vector2(0.0, -0.16) * s,
		c + Vector2(0.29, -0.16) * s, c + Vector2(0.15, 0.08) * s])
	for i in 9:
		var a: float = float(i) / 8.0 * PI * 0.5
		mc.append(fondo + Vector2(cos(a), sin(a)) * 0.15 * s)
	_poly(mc, SILVER.darkened(0.14))
	draw_rect(Rect2(c.x - 0.3 * s, c.y - 0.19 * s, 0.6 * s, 0.045 * s), SILVER.lightened(0.25))
	draw_rect(Rect2(c.x - 0.22 * s, c.y - 0.13 * s, 0.045 * s, 0.1 * s), Color(1, 1, 1, 0.18))






func _superafrica(c: Vector2, s: float) -> void:
	var wp: float = maxf(0.05 * s, 2.0)
	for pata in [[Vector2(-0.14, 0.1), Vector2(-0.3, 0.42)],
			[Vector2(0.0, 0.14), Vector2(0.0, 0.42)], [Vector2(0.14, 0.1), Vector2(0.3, 0.42)]]:
		var pie: Vector2 = c + Vector2(pata[1]) * s
		draw_line(c + Vector2(pata[0]) * s, pie, GOLD_D, wp)
		draw_circle(pie, maxf(0.035 * s, 1.5), GOLD_D)

	for sx in [-1.0, 1.0]:
		draw_arc(c + Vector2(sx * 0.32 * s, -0.06 * s), 0.05 * s, 0.0, TAU, 14, GOLD_D,
			maxf(0.035 * s, 1.5))

	_pm_balon(c + Vector2(0.0, -0.12 * s), 0.16 * s)
	var o: Vector2 = c + Vector2(0.0, -0.08 * s)
	var fuera: PackedVector2Array = PackedVector2Array()
	var dentro: PackedVector2Array = PackedVector2Array()
	var media: PackedVector2Array = PackedVector2Array([o])
	for i in 17:
		var a: float = float(i) / 16.0 * PI
		fuera.append(o + Vector2(cos(a), sin(a)) * 0.31 * s)
		dentro.append(o + Vector2(cos(a), sin(a)) * 0.27 * s)
		if i <= 8:
			media.append(o + Vector2(cos(a), sin(a)) * 0.27 * s)
	_poly(fuera, GOLD_D)
	_poly(dentro, GOLD)
	_poly(media, GOLD.darkened(0.14))
	draw_rect(Rect2(o.x - 0.31 * s, o.y - 0.04 * s, 0.62 * s, 0.05 * s), GOLD.lightened(0.25))
	draw_rect(Rect2(o.x - 0.21 * s, o.y + 0.04 * s, 0.045 * s, 0.09 * s), Color(1, 1, 1, 0.18))






func _ligas(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.18 * s, 0.22 * s, 0.04 * s, SILVER_D)
	_trap(c + Vector2(0.0, 0.33 * s), 0.05 * s, 0.12 * s, 0.05 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.04 * s, c.y + 0.1 * s, 0.08 * s, 0.2 * s), SILVER_D)


	var nudo: Vector2 = c + Vector2(0.0, 0.08 * s)
	var wb: float = maxf(0.06 * s, 2.0)
	for sx in [-1.0, 1.0]:
		draw_line(nudo, c + Vector2(sx * 0.22 * s, -0.18 * s), SILVER_D, wb)
	draw_circle(nudo, 0.095 * s, SILVER_D)
	draw_circle(nudo, 0.07 * s, SILVER)


	for sx in [-1.0, 1.0]:
		var b: Vector2 = c + Vector2(sx * 0.22 * s, -0.24 * s)
		_trap(b, 0.13 * s, 0.06 * s, 0.1 * s, SILVER)
		_poly(PackedVector2Array([b + Vector2(0.0, -0.1) * s, b + Vector2(0.13, -0.1) * s,
			b + Vector2(0.06, 0.1) * s, b + Vector2(0.0, 0.1) * s]), SILVER.darkened(0.14))
		draw_rect(Rect2(b.x - 0.14 * s, b.y - 0.13 * s, 0.28 * s, 0.045 * s),
			SILVER.lightened(0.25))
		draw_rect(Rect2(b.x - 0.09 * s, b.y - 0.07 * s, 0.035 * s, 0.09 * s), Color(1, 1, 1, 0.18))





func _finalissima(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.22 * s, 0.26 * s, 0.04 * s, BASE)
	_trap(c + Vector2(0.0, 0.34 * s), 0.08 * s, 0.15 * s, 0.05 * s, GOLD_D)
	draw_rect(Rect2(c.x - 0.04 * s, c.y - 0.04 * s, 0.08 * s, 0.34 * s), GOLD_D)
	var w: float = maxf(0.07 * s, 2.5)
	var wb: float = w + maxf(0.03 * s, 1.0)
	var r: float = 0.19 * s
	var a: Vector2 = c + Vector2(-0.14 * s, -0.16 * s)
	var b: Vector2 = c + Vector2(0.14 * s, -0.16 * s)
	draw_arc(a, r, 0.0, TAU, 32, GOLD_D, wb)
	draw_arc(a, r, 0.0, TAU, 32, GOLD, w)
	draw_arc(b, r, 0.0, TAU, 32, SILVER_D, wb)
	draw_arc(b, r, 0.0, TAU, 32, SILVER, w)



	draw_arc(a, r, -0.36 * PI, -0.11 * PI, 8, GOLD_D, wb)
	draw_arc(a, r, -0.36 * PI, -0.11 * PI, 8, GOLD, w)





func _naciones(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.18 * s, 0.22 * s, 0.04 * s, SILVER_D)
	_trap(c + Vector2(0.0, 0.33 * s), 0.05 * s, 0.12 * s, 0.05 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.045 * s, c.y + 0.12 * s, 0.09 * s, 0.18 * s), SILVER_D)

	var pie: Vector2 = c + Vector2(0.0, -0.02 * s)
	var wa: float = maxf(0.03 * s, 1.2)
	var banderas: Array = [[Vector2(-0.26, -0.4), -1.0, Color("2e6fd6")],
		[Vector2(0.0, -0.46), 1.0, BALL_W], [Vector2(0.26, -0.4), 1.0, Color("c0392b")]]
	for bd in banderas:
		var punta: Vector2 = c + Vector2(bd[0]) * s
		var lado: float = float(bd[1])
		var u: Vector2 =(pie - punta).normalized()
		var n: Vector2 = u.orthogonal()
		if signf(n.x) != lado:
			n = - n
		draw_line(pie, punta, SILVER_D, wa)
		_poly(PackedVector2Array([punta, punta + n * 0.15 * s,
			punta + n * 0.15 * s + u * 0.11 * s, punta + u * 0.11 * s]), Color(bd[2]))
	_trap(c + Vector2(0.0, -0.02 * s), 0.22 * s, 0.08 * s, 0.14 * s, SILVER)
	draw_circle(c + Vector2(0.0, 0.06 * s), 0.09 * s, SILVER)
	_poly(PackedVector2Array([c + Vector2(0.0, -0.16) * s, c + Vector2(0.22, -0.16) * s,
		c + Vector2(0.08, 0.12) * s, c + Vector2(0.0, 0.12) * s]), SILVER.darkened(0.14))
	draw_rect(Rect2(c.x - 0.23 * s, c.y - 0.19 * s, 0.46 * s, 0.045 * s), SILVER.lightened(0.25))
	draw_rect(Rect2(c.x - 0.15 * s, c.y - 0.13 * s, 0.04 * s, 0.09 * s), Color(1, 1, 1, 0.18))





func _olimpico(c: Vector2, s: float) -> void:
	var cinta: Color = Color("2e6fd6")
	var lazo: PackedVector2Array = PackedVector2Array([c + Vector2(-0.07, 0.04) * s])
	for i in 17:
		var a: float = PI + float(i) / 16.0 * PI
		lazo.append(c + Vector2(cos(a) * 0.2, -0.22 + sin(a) * 0.2) * s)
	lazo.append(c + Vector2(0.07, 0.04) * s)
	draw_polyline(lazo, cinta.darkened(0.35), maxf(0.1 * s, 3.0))
	draw_polyline(lazo, cinta, maxf(0.07 * s, 2.0))
	draw_circle(c + Vector2(0.0, 0.02 * s), 0.045 * s, GOLD_D)
	var disco: Vector2 = c + Vector2(0.0, 0.22 * s)
	draw_circle(disco, 0.22 * s, GOLD_D)
	draw_circle(disco, 0.185 * s, GOLD)


	var wl: float = maxf(0.02 * s, 1.0)
	draw_arc(disco, 0.125 * s, 0.55 * PI, 1.3 * PI, 14, GOLD_D, wl)
	draw_arc(disco, 0.125 * s, -0.3 * PI, 0.45 * PI, 14, GOLD_D, wl)
	for i in 4:
		var t: float = 0.65 + 0.18 * float(i)
		for lado in [-1.0, 1.0]:
			var al: float = PI * 0.5 + lado * t * PI * 0.5
			draw_circle(disco + Vector2(cos(al), sin(al)) * 0.125 * s, maxf(0.022 * s, 1.0), GOLD_D)
	_pm_balon(disco, 0.06 * s)
	draw_arc(disco, 0.16 * s, 0.78 * PI, 1.22 * PI, 14, Color(1, 1, 1, 0.22), maxf(0.03 * s, 1.0))





func _chico_oro(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.38 * s), 0.16 * s, 0.11 * s, 0.07 * s, BASE)
	draw_rect(Rect2(c.x - 0.03 * s, c.y + 0.12 * s, 0.06 * s, 0.2 * s), BASE)


	var plumas: Array = [[Vector2(0.29, -0.2), 0.17, 0.055, 0.55],
		[Vector2(0.3, -0.08), 0.15, 0.05, 0.3], [Vector2(0.28, 0.03), 0.12, 0.045, 0.1]]
	for sx in [-1.0, 1.0]:
		for pl in plumas:
			var pv: Vector2 = pl[0]
			var pc: Vector2 = c + Vector2(sx * pv.x, pv.y) * s
			var rot: float = - float(sx) * float(pl[3])
			var rx: float = float(pl[1]) * s
			var ry: float = float(pl[2]) * s
			_poly(_ellipse_pts(pc, rx + 0.02 * s, ry + 0.018 * s, rot), GOLD_D)
			_poly(_ellipse_pts(pc, rx, ry, rot), GOLD)
	var b: Vector2 = c + Vector2(0.0, -0.06 * s)
	draw_circle(b, 0.22 * s, GOLD_D)
	draw_circle(b, 0.185 * s, GOLD)
	_poly(_ngon(b, 0.075 * s, 5, - PI * 0.5), GOLD_D)
	for i in 5:
		var a: float = - PI * 0.5 + float(i) / 5.0 * TAU
		_poly(_ngon(b + Vector2(cos(a), sin(a)) * 0.135 * s, 0.035 * s, 5, a), GOLD_D)
	draw_circle(b - Vector2(0.07 * s, 0.07 * s), 0.04 * s, Color(1, 1, 1, 0.22))





func _premio_mundo(c: Vector2, s: float) -> void:

	_trap(c + Vector2(0.0, 0.43 * s), 0.28 * s, 0.3 * s, 0.03 * s, BASE)
	var g: Vector2 = c + Vector2(0.0, 0.4 * s)
	var cupula: PackedVector2Array = PackedVector2Array()
	for i in 17:
		var a: float = PI + float(i) / 16.0 * PI
		cupula.append(g + Vector2(cos(a), sin(a)) * 0.22 * s)
	_poly(cupula, GOLD_D)
	var wm: float = maxf(0.018 * s, 1.0)
	var meridiano: PackedVector2Array = PackedVector2Array()
	for i in 9:
		var a2: float = PI + float(i) / 8.0 * PI
		meridiano.append(g + Vector2(cos(a2) * 0.1, sin(a2) * 0.22) * s)
	draw_polyline(meridiano, GOLD, wm)
	draw_line(g + Vector2(-0.19, -0.11) * s, g + Vector2(0.19, -0.11) * s, GOLD, wm)


	var wl: float = maxf(0.065 * s, 2.0)
	draw_line(c + Vector2(-0.04, 0.02) * s, c + Vector2(-0.09, 0.21) * s, GOLD, wl)
	draw_line(c + Vector2(0.04, 0.02) * s, c + Vector2(0.09, 0.21) * s, GOLD.darkened(0.14), wl)
	_trap(c + Vector2(0.0, -0.06 * s), 0.1 * s, 0.065 * s, 0.09 * s, GOLD)
	draw_line(c + Vector2(-0.08, -0.13) * s, c + Vector2(-0.085, -0.34) * s, GOLD, wl * 0.85)
	draw_line(c + Vector2(0.08, -0.13) * s, c + Vector2(0.085, -0.34) * s,
		GOLD.darkened(0.14), wl * 0.85)
	draw_circle(c + Vector2(0.0, -0.22 * s), 0.06 * s, GOLD)
	var b: Vector2 = c + Vector2(0.0, -0.37 * s)
	draw_circle(b, 0.085 * s, GOLD_D)
	draw_circle(b, 0.065 * s, GOLD.lightened(0.2))
	_poly(_ngon(b, 0.03 * s, 5, - PI * 0.5), GOLD_D)




func _gol_ano(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.38 * s, 0.42 * s, 0.04 * s, BASE)


	var red: Color = Color(GOLD_D, 0.55)
	var wr: float = maxf(0.015 * s, 1.0)
	for i in 6:
		var x: float = -0.3 + 0.12 * float(i)
		draw_line(c + Vector2(x, -0.27) * s, c + Vector2(x, 0.38) * s, red, wr)
	for j in 6:
		var y: float = -0.22 + 0.12 * float(j)
		draw_line(c + Vector2(-0.34, y) * s, c + Vector2(0.34, y) * s, red, wr)
	draw_rect(Rect2(c.x - 0.41 * s, c.y - 0.34 * s, 0.07 * s, 0.72 * s), GOLD)
	draw_rect(Rect2(c.x + 0.34 * s, c.y - 0.34 * s, 0.07 * s, 0.72 * s), GOLD)
	draw_rect(Rect2(c.x - 0.41 * s, c.y - 0.34 * s, 0.82 * s, 0.07 * s), GOLD)
	draw_rect(Rect2(c.x + 0.375 * s, c.y - 0.27 * s, 0.035 * s, 0.65 * s), GOLD.darkened(0.14))
	draw_rect(Rect2(c.x - 0.41 * s, c.y - 0.34 * s, 0.82 * s, 0.025 * s), GOLD.lightened(0.25))

	var b: Vector2 = c + Vector2(0.17 * s, -0.12 * s)
	for k in 3:
		var y0: float = b.y +(-0.05 + 0.05 * float(k)) * s
		draw_line(Vector2(b.x - 0.32 * s, y0 + 0.07 * s), Vector2(b.x - 0.14 * s, y0),
			Color(1, 1, 1, 0.3), maxf(0.025 * s, 1.0))
	_pm_balon(b, 0.11 * s)





func _bota_eur(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.43 * s), 0.27 * s, 0.29 * s, 0.03 * s, BASE.darkened(0.3))
	draw_rect(Rect2(c.x - 0.25 * s, c.y + 0.1 * s, 0.5 * s, 0.3 * s), BASE)
	draw_rect(Rect2(c.x - 0.25 * s, c.y + 0.1 * s, 0.5 * s, 0.035 * s), GOLD_D)
	for i in 5:
		_poly(_star(c + Vector2(-0.16 + 0.08 * float(i), 0.25) * s, 0.04 * s, 0.017 * s), GOLD)


	var k: float = 0.9 * s
	var o: Vector2 = c + Vector2(-0.03 * s, -0.1 * s)
	draw_rect(Rect2(o.x - 0.26 * k, o.y - 0.24 * k, 0.2 * k, 0.36 * k), GOLD)
	draw_rect(Rect2(o.x - 0.26 * k, o.y - 0.02 * k, 0.54 * k, 0.16 * k), GOLD)
	draw_circle(o + Vector2(0.28, 0.06) * k, 0.08 * k, GOLD)
	draw_rect(Rect2(o.x - 0.28 * k, o.y + 0.13 * k, 0.62 * k, 0.05 * k), GOLD_D)
	for i in 3:
		draw_circle(o + Vector2(-0.16 + float(i) * 0.15, 0.2) * k, 0.026 * k, GOLD_D)
	draw_rect(Rect2(o.x - 0.22 * k, o.y - 0.21 * k, 0.05 * k, 0.14 * k), Color(1, 1, 1, 0.18))









func _unknown(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.38 * s), 0.22 * s, 0.15 * s, 0.09 * s, BASE)
	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.12 * s, 0.1 * s, 0.2 * s), BASE)
	_trap(c + Vector2(0.0, -0.14 * s), 0.24 * s, 0.1 * s, 0.2 * s, BASE)


	var col: Color = SILVER
	draw_arc(c + Vector2(0.0, -0.2 * s), 0.09 * s, PI, TAU + 0.35 * PI, 18, col,
		maxf(0.045 * s, 1.8))
	draw_rect(Rect2(c.x - 0.022 * s, c.y - 0.13 * s, 0.045 * s, 0.09 * s), col)
	draw_rect(Rect2(c.x - 0.028 * s, c.y - 0.01 * s, 0.056 * s, 0.05 * s), col)









func _plate(c: Vector2, s: float) -> void:
	for sx in [-1.0, 1.0]:
		draw_arc(c + Vector2(sx * 0.34 * s, 0.0), 0.11 * s, 0.0, TAU, 20, GOLD,
			maxf(0.05 * s, 2.0))
	_ellipse(c, 0.32 * s, 0.3 * s, GOLD_D)
	_ellipse(c, 0.27 * s, 0.25 * s, GOLD)





	draw_arc(c, 0.225 * s, 0.0, TAU, 32, GOLD_D, maxf(0.03 * s, 1.5))
	draw_arc(c, 0.217 * s, 0.75 * PI, 1.25 * PI, 14, Color(1, 1, 1, 0.18),
		maxf(0.04 * s, 1.5))









func _rosette(c: Vector2, s: float) -> void:














	for sx in [-1.0, 1.0]:
		draw_colored_polygon(PackedVector2Array([
			c + Vector2(sx * 0.03 * s, 0.15 * s), c + Vector2(sx * 0.16 * s, 0.1 * s),
			c + Vector2(sx * 0.27 * s, 0.45 * s), c + Vector2(sx * 0.13 * s, 0.42 * s)]),
			GOLD_D)
	draw_circle(c, 0.33 * s, GOLD_D)
	draw_circle(c, 0.27 * s, GOLD)



	draw_arc(c, 0.235 * s, 0.75 * PI, 1.25 * PI, 14, Color(1, 1, 1, 0.18),
		maxf(0.035 * s, 1.0))
	for sx in [-1.0, 1.0]:
		draw_colored_polygon(PackedVector2Array([
			c + Vector2(sx * 0.19 * s, 0.09 * s), c + Vector2(0.0, -0.1 * s),
			c + Vector2(0.0, -0.21 * s), c + Vector2(sx * 0.19 * s, -0.02 * s)]),
			GOLD_D)




func _boot(c: Vector2, s: float, col: Color, dark: Color) -> void:





	_trap(c + Vector2(0.0, 0.41 * s), 0.22 * s, 0.15 * s, 0.08 * s, BASE)



	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.14 * s, 0.1 * s, 0.22 * s), dark)
	draw_rect(Rect2(c.x - 0.26 * s, c.y - 0.24 * s, 0.2 * s, 0.36 * s), col)
	draw_rect(Rect2(c.x - 0.26 * s, c.y - 0.02 * s, 0.54 * s, 0.16 * s), col)
	draw_circle(c + Vector2(0.28 * s, 0.06 * s), 0.08 * s, col)
	draw_rect(Rect2(c.x - 0.28 * s, c.y + 0.13 * s, 0.62 * s, 0.05 * s), dark)
	for i in 3:
		draw_circle(c + Vector2(-0.16 * s + float(i) * 0.15 * s, 0.2 * s),
			0.026 * s, dark)
	draw_rect(Rect2(c.x - 0.22 * s, c.y - 0.21 * s, 0.05 * s, 0.14 * s),
		Color(1, 1, 1, 0.18))




func _assist(c: Vector2, s: float, col: Color, dark: Color) -> void:


	_trap(c + Vector2(0.0, 0.41 * s), 0.18 * s, 0.12 * s, 0.08 * s, BASE)
	draw_rect(Rect2(c.x + 0.07 * s, c.y + 0.11 * s, 0.1 * s, 0.22 * s), dark)
	for i in 3:
		var y: float = c.y - 0.23 * s + float(i) * 0.13 * s
		draw_line(Vector2(c.x - 0.36 * s, y), Vector2(c.x - 0.1 * s, y),
			col, maxf(0.045 * s, 2.0))
	var b: Vector2 = c + Vector2(0.12 * s, -0.1 * s)
	draw_circle(b, 0.21 * s, BALL_W)
	draw_arc(b, 0.21 * s, 0.0, TAU, 24, dark, maxf(0.025 * s, 1.0))
	_poly(_ngon(b, 0.08 * s, 5, - PI * 0.5), BALL_K)




func _medal(c: Vector2, s: float, col: Color, dark: Color) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.16 * s, -0.4 * s), c + Vector2(0.0, -0.4 * s),
		c + Vector2(0.02 * s, -0.04 * s), c + Vector2(-0.14 * s, -0.04 * s)]),
		Color("c0392b"))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.16 * s, -0.4 * s), c + Vector2(0.0, -0.4 * s),
		c + Vector2(-0.02 * s, -0.04 * s), c + Vector2(0.14 * s, -0.04 * s)]),
		Color("2e6fd6"))
	var disc: Vector2 = c + Vector2(0.0, 0.12 * s)
	draw_circle(disc, 0.28 * s, dark)
	draw_circle(disc, 0.23 * s, col)



	draw_arc(disc, 0.205 * s, 0.78 * PI, 1.22 * PI, 14, Color(1, 1, 1, 0.22),
		maxf(0.035 * s, 1.0))
	_poly(_star(disc, 0.17 * s, 0.075 * s), dark)




func _ball(c: Vector2, s: float, main: Color = GOLD, dark: Color = GOLD_D,
		laurel: bool = false) -> void:
	_trap(c + Vector2(0.0, 0.37 * s), 0.16 * s, 0.11 * s, 0.08 * s, BASE)
	draw_rect(Rect2(c.x - 0.03 * s, c.y + 0.16 * s, 0.06 * s, 0.14 * s), BASE)
	var b: Vector2 = c + Vector2(0.0, -0.07 * s)





	if laurel:
		draw_arc(b, 0.35 * s, 0.58 * PI, 1.32 * PI, 24, dark, maxf(0.05 * s, 2.0))
		draw_arc(b, 0.35 * s, -0.32 * PI, 0.42 * PI, 24, dark, maxf(0.05 * s, 2.0))
	draw_circle(b, 0.29 * s, dark)
	draw_circle(b, 0.25 * s, main)
	_poly(_ngon(b, 0.11 * s, 5, - PI * 0.5), dark)
	for i in 5:
		var a: float = - PI * 0.5 + float(i) / 5.0 * TAU
		_poly(_ngon(b + Vector2(cos(a), sin(a)) * 0.18 * s, 0.045 * s, 5, a), dark)
	draw_circle(b - Vector2(0.09 * s, 0.09 * s), 0.05 * s, Color(1, 1, 1, 0.22))




func _globe(c: Vector2, s: float) -> void:




	_trap(c + Vector2(0.0, 0.4 * s), 0.22 * s, 0.16 * s, 0.07 * s, GOLD_D)
	_trap(c + Vector2(0.0, 0.4 * s), 0.21 * s, 0.15 * s, 0.045 * s, Color("2e8b57"))
	_trap(c + Vector2(0.0, 0.3 * s), 0.14 * s, 0.1 * s, 0.05 * s, GOLD_D)
	_trap(c + Vector2(0.0, 0.3 * s), 0.135 * s, 0.095 * s, 0.035 * s, Color("2e8b57"))
	draw_rect(Rect2(c.x - 0.045 * s, c.y + 0.08 * s, 0.09 * s, 0.2 * s), GOLD)

	var b: Vector2 = c + Vector2(0.0, -0.14 * s)





	draw_arc(b, 0.34 * s, 0.55 * PI, 1.35 * PI, 24, GOLD_D, maxf(0.05 * s, 2.0))
	draw_arc(b, 0.34 * s, -0.35 * PI, 0.45 * PI, 24, GOLD_D, maxf(0.05 * s, 2.0))
	draw_circle(b, 0.29 * s, GOLD_D)
	draw_circle(b, 0.25 * s, GOLD)

	draw_arc(b, 0.25 * s, 0.0, TAU, 32, GOLD_D, maxf(0.02 * s, 1.0))
	draw_line(b + Vector2(-0.25 * s, 0.0), Vector2(b.x + 0.25 * s, b.y),
		GOLD_D, maxf(0.02 * s, 1.0))
	for f in [-0.12, 0.12]:
		draw_line(b + Vector2(-0.229 * s, f * s), Vector2(b.x + 0.229 * s, b.y + f * s),
			GOLD_D, maxf(0.015 * s, 1.0))
	for e in [0.42, 0.72]:
		draw_arc(b, 0.25 * s, PI *(0.5 - e), PI *(0.5 + e), 20, GOLD_D,
			maxf(0.015 * s, 1.0))
		draw_arc(b, 0.25 * s, PI *(1.5 - e), PI *(1.5 + e), 20, GOLD_D,
			maxf(0.015 * s, 1.0))


	draw_arc(b, 0.215 * s, 0.75 * PI, 1.25 * PI, 14, Color(1, 1, 1, 0.22),
		maxf(0.04 * s, 1.5))









const PITCH_G: Color = Color("2f8b3c")

func _stand(c: Vector2, s: float) -> void:
	_ellipse(c, 0.46 * s, 0.36 * s, GOLD_D)
	_ellipse(c, 0.41 * s, 0.31 * s, GOLD)


	for i in 8:
		var a: float = float(i) / 8.0 * TAU + PI / 16.0
		var d: Vector2 = Vector2(cos(a), sin(a) * 0.76)
		draw_line(c + d * 0.16 * s, c + d * 0.44 * s, GOLD_D, maxf(0.035 * s, 1.0))
	_ellipse(c, 0.26 * s, 0.18 * s, PITCH_G)

	draw_arc(c, 0.07 * s, 0.0, TAU, 16, Color(1, 1, 1, 0.75), maxf(0.02 * s, 1.0))




func _ellipse(c: Vector2, rx: float, ry: float, color: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 32:
		var a: float = float(i) / 32.0 * TAU
		pts.append(c + Vector2(cos(a) * rx, sin(a) * ry))
	draw_colored_polygon(pts, color)










func _pm_balon(c: Vector2, r: float) -> void:
	draw_circle(c, r, BALL_W)
	draw_arc(c, r, 0.0, TAU, 24, Color(0.35, 0.36, 0.4), maxf(r * 0.12, 1.0))
	_poly(_ngon(c, r * 0.42, 5, - PI * 0.5), BALL_K)




func _pm_estrellas(c: Vector2, s: float) -> void:
	draw_circle(c, 0.3 * s, GOLD_D)
	draw_circle(c, 0.25 * s, BASE)
	for i in 8:
		var a: float = float(i) / 8.0 * TAU - PI * 0.5
		var p: Vector2 = c + Vector2(cos(a), sin(a)) * 0.34 * s
		_poly(_star(p, 0.13 * s, 0.055 * s), GOLD_D)
		_poly(_star(p, 0.1 * s, 0.045 * s), GOLD)
	_pm_balon(c, 0.19 * s)



func _pm_laurel(c: Vector2, s: float) -> void:
	var w: float = maxf(0.04 * s, 2.0)
	draw_arc(c, 0.33 * s, 0.6 * PI, 1.3 * PI, 20, GOLD_D, w)
	draw_arc(c, 0.33 * s, -0.3 * PI, 0.4 * PI, 20, GOLD_D, w)


	for k in 5:
		for lado in [-1.0, 1.0]:
			var a: float = PI * 0.5 + lado *(0.14 + 0.15 * float(k)) * PI
			var rad: Vector2 = Vector2(cos(a), sin(a))
			var tan_v: Vector2 = Vector2(- rad.y, rad.x) * lado
			for sal in [0.07, -0.05]:
				var m: Vector2 = c + rad *(0.33 + sal) * s
				var punta: Vector2 = m +(tan_v * 0.9 + rad * sign(sal) * 0.4).normalized() * 0.08 * s
				var cola: Vector2 = m -(tan_v * 0.9 + rad * sign(sal) * 0.4).normalized() * 0.05 * s
				var n: Vector2 =(punta - cola).normalized().orthogonal() * 0.035 * s
				_poly(PackedVector2Array([cola, m + n, punta, m - n]), GOLD if sal > 0 else GOLD_D)
	_trap(c + Vector2(0.0, 0.37 * s), 0.05 * s, 0.09 * s, 0.045 * s, GOLD_D)
	_pm_balon(c, 0.21 * s)




func _pm_orbita(c: Vector2, s: float) -> void:
	var w: float = maxf(0.06 * s, 2.0)
	var back: PackedVector2Array = []
	var front: PackedVector2Array = []
	for i in 33:
		var a: float = float(i) / 32.0 * TAU
		var p: Vector2 = c + Vector2(cos(a) * 0.46 * s, sin(a) * 0.15 * s).rotated(-0.35)
		if sin(a) < 0.0:
			back.append(p)
		else:
			front.append(p)
	if back.size() > 1:
		draw_polyline(back, GOLD_D, w)
	_pm_balon(c, 0.25 * s)
	if front.size() > 1:
		draw_polyline(front, GOLD, w)
	_poly(_star(c + Vector2(0.3, -0.3) * s, 0.1 * s, 0.045 * s), GOLD)





func _marco(c: Vector2, s: float, torneo: String, delante: bool) -> void:
	match torneo:
		"ucl":
			if delante:
				return
			for i in 8:
				var a: float = float(i) / 8.0 * TAU - PI * 0.5
				var p: Vector2 = c + Vector2(cos(a), sin(a)) * 0.4 * s
				_poly(_star(p, 0.1 * s, 0.042 * s), GOLD_D)
				_poly(_star(p, 0.075 * s, 0.034 * s), GOLD)
		"cup":
			if delante:
				return
			var w: float = maxf(0.035 * s, 1.5)
			draw_arc(c, 0.4 * s, 0.62 * PI, 1.3 * PI, 20, GOLD_D, w)
			draw_arc(c, 0.4 * s, -0.3 * PI, 0.38 * PI, 20, GOLD_D, w)
			for k in 4:
				for lado in [-1.0, 1.0]:
					var a: float = PI * 0.5 + lado *(0.16 + 0.17 * float(k)) * PI
					var rad: Vector2 = Vector2(cos(a), sin(a))
					var tan_v: Vector2 = Vector2(- rad.y, rad.x) * lado
					var m: Vector2 = c + rad * 0.44 * s
					var dir: Vector2 =(tan_v * 0.9 + rad * 0.4).normalized()
					var n: Vector2 = dir.orthogonal() * 0.03 * s
					_poly(PackedVector2Array([m - dir * 0.045 * s, m + n,
						m + dir * 0.07 * s, m - n]), GOLD)
		"cwc":
			var pts: PackedVector2Array = []
			for i in 33:
				var a: float = float(i) / 32.0 * TAU
				if (sin(a) >= 0.0) == delante:
					pts.append(c + Vector2(cos(a) * 0.47 * s, sin(a) * 0.14 * s).rotated(-0.35))
			if pts.size() > 1:
				draw_polyline(pts, GOLD if delante else GOLD_D, maxf(0.05 * s, 2.0))




		"lib":
			if delante:
				return
			for i in 16:
				var a: float = float(i) / 16.0 * TAU - PI * 0.5
				var rad: Vector2 = Vector2(cos(a), sin(a))
				var lado: Vector2 = rad.orthogonal() * 0.045 * s
				var base: Vector2 = c + rad * 0.37 * s
				var largo: float = 0.48 if i % 2 == 0 else 0.44
				_poly(PackedVector2Array([base - lado, c + rad * largo * s, base + lado]),
					GOLD_D if i % 2 == 0 else GOLD)


		"sud":
			if delante:
				return
			var puntas: Array = [[Vector2(0.0, -0.42), 0.12], [Vector2(0.4, -0.06), 0.09],
				[Vector2(0.0, 0.4), 0.11], [Vector2(-0.38, -0.12), 0.08]]
			for pt in puntas:
				var p: Vector2 = c + Vector2(pt[0]) * s
				var r: float = float(pt[1])
				_poly(_star(p, r * s, r * 0.42 * s), GOLD_D)
				_poly(_star(p, r * 0.76 * s, r * 0.34 * s), GOLD)


		"cca":
			if delante:
				return
			var w2: float = maxf(0.05 * s, 2.0)
			for sx in [-1.0, 1.0]:
				for sy in [-1.0, 1.0]:
					var k: Vector2 = c + Vector2(sx, sy) * 0.42 * s
					draw_line(k, k - Vector2(sx * 0.16 * s, 0.0), GOLD_D, w2)
					draw_line(k, k - Vector2(0.0, sy * 0.16 * s), GOLD_D, w2)
					draw_circle(k, w2 * 0.5, GOLD)


		"ace":
			if delante:
				return
			var w3: float = maxf(0.05 * s, 2.0)
			for sy in [-1.0, 1.0]:
				draw_polyline(PackedVector2Array([
					c + Vector2(-0.46, sy * 0.3) * s, c + Vector2(-0.36, sy * 0.38) * s,
					c + Vector2(0.0, sy * 0.46) * s, c + Vector2(0.36, sy * 0.38) * s,
					c + Vector2(0.46, sy * 0.3) * s]), GOLD_D, w3)
				draw_circle(c + Vector2(0.0, sy * 0.46) * s, w3 * 0.7, GOLD)


		"ac2":
			if delante:
				return
			for i in 12:
				var a2: float = float(i) / 12.0 * TAU
				var p2: Vector2 = c + Vector2(cos(a2), sin(a2)) * 0.43 * s
				draw_circle(p2, maxf(0.045 * s, 1.5), GOLD_D)
				draw_circle(p2, maxf(0.028 * s, 1.0), GOLD)


		"caf":
			if delante:
				return
			for sx in [-1.0, 1.0]:
				_poly(PackedVector2Array([
					c + Vector2(sx * 0.4, 0.4) * s, c + Vector2(sx * 0.46, 0.4) * s,
					c + Vector2(sx * 0.45, -0.3) * s, c + Vector2(sx * 0.43, -0.4) * s,
					c + Vector2(sx * 0.41, -0.3) * s]), GOLD_D)


		"cf2":
			if delante:
				return
			var w4: float = maxf(0.035 * s, 1.5)
			var pts: PackedVector2Array = PackedVector2Array()
			for i in 13:
				var a4: float = PI + float(i) / 12.0 * PI
				pts.append(c + Vector2(cos(a4) * 0.44, sin(a4) * 0.44 - 0.02) * s)
			draw_polyline(pts, GOLD_D, w4)
			for i in 5:
				var a5: float = PI +(float(i) + 0.5) / 5.0 * PI
				draw_circle(c + Vector2(cos(a5) * 0.44, sin(a5) * 0.44 - 0.02) * s,
					maxf(0.04 * s, 1.5), GOLD)




		"ofc":
			if delante:
				return
			var w5: float = maxf(0.04 * s, 1.5)
			for sx in [-1.0, 1.0]:
				var ola: PackedVector2Array = PackedVector2Array()
				for i in 17:
					var t: float = float(i) / 16.0
					var y5: float = 0.4 - t * 0.76
					var x5: float = 0.41 + sin(t * TAU * 1.5) * 0.03
					ola.append(c + Vector2(sx * x5, y5) * s)
				draw_polyline(ola, GOLD_D, w5)

				var top: Vector2 = c + Vector2(sx * 0.41, -0.36) * s
				draw_arc(top + Vector2(sx * 0.035 * s, 0.0), 0.035 * s,
					PI if sx > 0.0 else 0.0,(PI if sx > 0.0 else 0.0) + sx * PI, 10,
					GOLD_D, w5)
				draw_circle(top + Vector2(sx * 0.07 * s, 0.0), maxf(0.025 * s, 1.2), GOLD)



		"wc":
			if delante:
				return
			var w6: float = maxf(0.022 * s, 1.0)
			draw_polyline(_ellipse_pts(c, 0.2 * s, 0.44 * s, 0.0), GOLD_D, w6)
			draw_line(c + Vector2(-0.44 * s, 0.0), c + Vector2(0.44 * s, 0.0), GOLD_D, w6)
			for f in [-0.25, 0.25]:
				var hw6: float = sqrt(0.44 * 0.44 - float(f) * float(f))
				draw_line(c + Vector2(- hw6, f) * s, c + Vector2(hw6, f) * s, GOLD_D, w6)
			draw_arc(c, 0.44 * s, 0.0, TAU, 40, GOLD, maxf(0.035 * s, 1.5))


		"cont":
			if delante:
				return
			var esc: PackedVector2Array = _escudo(c + Vector2(0.0, -0.03 * s), 0.47 * s)
			esc.append(esc[0])
			draw_polyline(esc, SILVER_D, maxf(0.06 * s, 2.2))
			draw_polyline(esc, SILVER, maxf(0.03 * s, 1.2))


func _matchball(c: Vector2, s: float, col: Color, dark: Color) -> void:
	_poly(_star(c, 0.47 * s, 0.21 * s), dark)
	_poly(_star(c, 0.42 * s, 0.185 * s), col)
	draw_circle(c, 0.17 * s, BALL_W)
	draw_arc(c, 0.17 * s, 0.0, TAU, 24, Color(0.35, 0.36, 0.4), maxf(0.02 * s, 1.0))
	_poly(_ngon(c, 0.07 * s, 5, - PI * 0.5), BALL_K)











func _month(c: Vector2, s: float) -> void:
	for sx in [-0.16, 0.16]:
		draw_rect(Rect2(c.x + sx * s - 0.022 * s, c.y - 0.42 * s,
			0.044 * s, 0.1 * s), Color("6f7381"))
	draw_rect(Rect2(c.x - 0.34 * s, c.y - 0.36 * s, 0.68 * s, 0.72 * s),
		Color("e8e9ee"))
	draw_rect(Rect2(c.x - 0.34 * s, c.y - 0.36 * s, 0.68 * s, 0.2 * s), GOLD_D)
	_poly(_star(c + Vector2(0.0, 0.06 * s), 0.2 * s, 0.09 * s), GOLD)

















func _plaque(c: Vector2, s: float, motif: String) -> void:

	_trap(c + Vector2(0.0, 0.44 * s), 0.26 * s, 0.32 * s, 0.06 * s, BASE)
	var w: float = 0.54 * s
	var h: float = 0.8 * s
	var r: Rect2 = Rect2(c.x - w * 0.5, c.y - h * 0.5 - 0.04 * s, w, h)
	draw_rect(r, Color("2b2e36"))
	draw_rect(r.grow(-0.035 * s), GOLD_D)
	var inner: Rect2 = r.grow(-0.065 * s)
	draw_rect(inner, Color("1d1f26"))

	for i in 3:
		var y: float = inner.position.y + inner.size.y *(0.62 + float(i) * 0.13)
		draw_rect(Rect2(inner.position.x + 0.05 * s, y,
			inner.size.x - 0.1 * s, 0.035 * s), GOLD)
	var mc: Vector2 = Vector2(c.x, inner.position.y + inner.size.y * 0.3)
	match motif:
		"gol":
			draw_circle(mc, 0.13 * s, BALL_W)
			_poly(_ngon(mc, 0.055 * s, 5, - PI * 0.5), BALL_K)
		"asist":
			draw_circle(mc - Vector2(0.09 * s, 0.0), 0.075 * s, BALL_W)
			draw_circle(mc + Vector2(0.09 * s, 0.0), 0.075 * s, GOLD)
			draw_rect(Rect2(mc.x - 0.09 * s, mc.y - 0.018 * s, 0.18 * s,
				0.036 * s), GOLD_D)

		"def":

			_poly(PackedVector2Array([
				mc + Vector2(-0.12 * s, -0.12 * s), mc + Vector2(0.12 * s, -0.12 * s),
				mc + Vector2(0.12 * s, 0.02 * s), mc + Vector2(0.0, 0.15 * s),
				mc + Vector2(-0.12 * s, 0.02 * s)]), SILVER)
			draw_rect(Rect2(mc.x - 0.12 * s, mc.y - 0.03 * s, 0.24 * s, 0.045 * s),
				SILVER_D)
		"med":


			_poly(_ngon(mc, 0.14 * s, 4, - PI * 0.5), GOLD)
			draw_circle(mc, 0.055 * s, BALL_W)
		"del":

			var arco: Rect2 = Rect2(mc.x - 0.14 * s, mc.y - 0.1 * s, 0.28 * s, 0.2 * s)
			draw_rect(arco, Color("2b2e36"))
			for k in 3:
				var gx: float = arco.position.x + arco.size.x *(0.25 + 0.25 * float(k))
				draw_line(Vector2(gx, arco.position.y), Vector2(gx, arco.end.y),
					GOLD_D, maxf(0.012 * s, 1.0))
			draw_rect(Rect2(arco.position.x, arco.position.y, arco.size.x, 0.03 * s), GOLD)
			draw_rect(Rect2(arco.position.x, arco.position.y, 0.03 * s, arco.size.y), GOLD)
			draw_rect(Rect2(arco.end.x - 0.03 * s, arco.position.y, 0.03 * s,
				arco.size.y), GOLD)
			draw_circle(Vector2(mc.x, arco.end.y - 0.06 * s), 0.05 * s, BALL_W)
		_:

			draw_rect(Rect2(mc.x - 0.09 * s, mc.y - 0.1 * s, 0.18 * s, 0.2 * s), GOLD)
			draw_rect(Rect2(mc.x - 0.15 * s, mc.y - 0.1 * s, 0.06 * s, 0.09 * s), GOLD_D)
			draw_rect(Rect2(mc.x + 0.09 * s, mc.y - 0.1 * s, 0.06 * s, 0.09 * s), GOLD_D)






func _club_star(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.42 * s), 0.22 * s, 0.28 * s, 0.07 * s, BASE)
	_trap(c + Vector2(0.0, 0.31 * s), 0.14 * s, 0.18 * s, 0.05 * s, GOLD_D)
	draw_rect(Rect2(c.x - 0.04 * s, c.y - 0.06 * s, 0.08 * s, 0.33 * s), GOLD_D)
	draw_rect(Rect2(c.x - 0.015 * s, c.y - 0.06 * s, 0.03 * s, 0.33 * s), GOLD)
	var sc: Vector2 = c + Vector2(0.0, -0.2 * s)
	_poly(_star(sc, 0.26 * s, 0.11 * s), GOLD_D)
	_poly(_star(sc, 0.21 * s, 0.09 * s), GOLD)
	draw_circle(sc, 0.05 * s, Color("fff0b8"))










func _pennant(c: Vector2, s: float) -> void:

	_trap(c + Vector2(0.0, 0.44 * s), 0.18 * s, 0.24 * s, 0.06 * s, BASE)
	draw_rect(Rect2(c.x - 0.025 * s, c.y - 0.4 * s, 0.05 * s, 0.8 * s), BASE)
	draw_rect(Rect2(c.x - 0.31 * s, c.y - 0.43 * s, 0.62 * s, 0.05 * s), GOLD_D)
	draw_circle(Vector2(c.x - 0.31 * s, c.y - 0.405 * s), 0.035 * s, GOLD_D)
	draw_circle(Vector2(c.x + 0.31 * s, c.y - 0.405 * s), 0.035 * s, GOLD_D)


	var arriba: float = c.y - 0.38 * s
	var alto: float = 0.64 * s
	var media: float = 0.28 * s
	_poly(PackedVector2Array([Vector2(c.x - media, arriba),
		Vector2(c.x + media, arriba), Vector2(c.x, arriba + alto)]), GOLD)
	var y0: float = arriba + 0.07 * s
	var y1: float = arriba + 0.15 * s
	var m0: float = media *(1.0 -(y0 - arriba) / alto)
	var m1: float = media *(1.0 -(y1 - arriba) / alto)
	_poly(PackedVector2Array([Vector2(c.x - m0, y0), Vector2(c.x + m0, y0),
		Vector2(c.x + m1, y1), Vector2(c.x - m1, y1)]), GOLD_D)

	var o: Vector2 = Vector2(c.x, arriba + 0.27 * s)
	draw_circle(o + Vector2(-0.045 * s, -0.02 * s), 0.05 * s, BALL_W)
	draw_circle(o + Vector2(0.045 * s, -0.02 * s), 0.05 * s, BALL_W)
	_poly(PackedVector2Array([o + Vector2(-0.092 * s, 0.0),
		o + Vector2(0.092 * s, 0.0), o + Vector2(0.0, 0.1 * s)]), BALL_W)

	draw_circle(Vector2(c.x, arriba + alto + 0.02 * s), 0.045 * s, GOLD_D)


















func _house(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.3 * s, c.y - 0.06 * s, 0.6 * s, 0.42 * s), BASE)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.4 * s), c + Vector2(0.42 * s, -0.04 * s),
		c + Vector2(-0.42 * s, -0.04 * s)]), GOLD)

	draw_rect(Rect2(c.x - 0.09 * s, c.y + 0.12 * s, 0.18 * s, 0.24 * s), GOLD_D)
	draw_rect(Rect2(c.x + 0.12 * s, c.y + 0.04 * s, 0.13 * s, 0.13 * s), GOLD_D)








func _armchair(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.26 * s, c.y - 0.28 * s, 0.52 * s, 0.34 * s), GOLD)
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * 0.36 * s - 0.1 * s, c.y - 0.08 * s,
			0.2 * s, 0.3 * s), GOLD_D)
	draw_rect(Rect2(c.x - 0.3 * s, c.y + 0.02 * s, 0.6 * s, 0.2 * s), GOLD)
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * 0.22 * s - 0.04 * s, c.y + 0.22 * s,
			0.08 * s, 0.14 * s), BASE)






func _cap(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.2 * s, c.y - 0.06 * s, 0.4 * s, 0.24 * s), GOLD_D)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.34 * s), c + Vector2(0.46 * s, -0.1 * s),
		c + Vector2(0.0, 0.14 * s), c + Vector2(-0.46 * s, -0.1 * s)]), GOLD)

	draw_rect(Rect2(c.x + 0.3 * s, c.y - 0.1 * s, 0.04 * s, 0.26 * s), GOLD_D)
	draw_circle(c + Vector2(0.32 * s, 0.2 * s), 0.07 * s, GOLD_D)








func _snake(c: Vector2, s: float) -> void:
	var u: float = 0.17 * s
	var cuerpo: Array = [Vector2(-1.5, 0.5), Vector2(-0.5, 0.5), Vector2(-0.5, -0.5),
		Vector2(0.5, -0.5), Vector2(1.5, -0.5)]
	for i in cuerpo.size():
		var p: Vector2 = c +(cuerpo[i] as Vector2) * u * 1.6
		var col: Color = PITCH_G if i < cuerpo.size() - 1 else PITCH_G.lightened(0.35)
		draw_rect(Rect2(p.x - u * 0.72, p.y - u * 0.72, u * 1.44, u * 1.44), col)

	var cab: Vector2 = c + Vector2(1.5, -0.5) * u * 1.6
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(cab.x + sx * 0.32 * u - 0.09 * u, cab.y - 0.34 * u,
			0.18 * u, 0.18 * u), BALL_K)








func _heart(c: Vector2, s: float) -> void:
	var o: Vector2 = c + Vector2(0.0, -0.06 * s)
	draw_circle(o + Vector2(-0.17 * s, -0.1 * s), 0.2 * s, GOLD)
	draw_circle(o + Vector2(0.17 * s, -0.1 * s), 0.2 * s, GOLD)
	draw_colored_polygon(PackedVector2Array([
		o + Vector2(-0.35 * s, -0.02 * s), o + Vector2(0.35 * s, -0.02 * s),
		o + Vector2(0.0, 0.42 * s)]), GOLD)
	draw_circle(o + Vector2(-0.2 * s, -0.16 * s), 0.06 * s, Color(1, 1, 1, 0.22))








func _shirt(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.22 * s, c.y - 0.28 * s, 0.44 * s, 0.62 * s), GOLD)
	for sx in [-1.0, 1.0]:
		draw_colored_polygon(PackedVector2Array([
			c + Vector2(sx * 0.22 * s, -0.28 * s), c + Vector2(sx * 0.42 * s, -0.16 * s),
			c + Vector2(sx * 0.42 * s, 0.06 * s), c + Vector2(sx * 0.22 * s, 0.02 * s)]),
			GOLD_D)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.11 * s, -0.28 * s), c + Vector2(0.11 * s, -0.28 * s),
		c + Vector2(0.0, -0.15 * s)]), BASE)







func _hourglass(c: Vector2, s: float) -> void:
	for sy in [-1.0, 1.0]:
		draw_rect(Rect2(c.x - 0.3 * s, c.y + sy * 0.38 * s - 0.06 * s,
			0.6 * s, 0.12 * s), GOLD_D)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.24 * s, -0.32 * s), c + Vector2(0.24 * s, -0.32 * s),
		c + Vector2(0.0, 0.0)]), GOLD)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.24 * s, 0.32 * s), c + Vector2(0.24 * s, 0.32 * s),
		c + Vector2(0.0, 0.0)]), GOLD)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.15 * s, 0.32 * s), c + Vector2(0.15 * s, 0.32 * s),
		c + Vector2(0.0, 0.12 * s)]), GOLD_D)




func _glove(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.26 * s, c.y - 0.14 * s, 0.52 * s, 0.36 * s), GOLD)

	for i in 4:
		var x: float = c.x - 0.26 * s + float(i) * 0.135 * s
		draw_rect(Rect2(x, c.y - 0.34 * s, 0.1 * s, 0.22 * s), GOLD)
		draw_circle(Vector2(x + 0.05 * s, c.y - 0.34 * s), 0.05 * s, GOLD)

	draw_rect(Rect2(c.x + 0.24 * s, c.y - 0.06 * s, 0.16 * s, 0.11 * s), GOLD_D)

	draw_rect(Rect2(c.x - 0.22 * s, c.y + 0.22 * s, 0.44 * s, 0.14 * s), GOLD_D)




func _bottle(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.07 * s, c.y - 0.44 * s, 0.14 * s, 0.1 * s), GOLD_D)
	draw_rect(Rect2(c.x - 0.05 * s, c.y - 0.34 * s, 0.1 * s, 0.12 * s), SILVER)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.05 * s, -0.22 * s), c + Vector2(0.05 * s, -0.22 * s),
		c + Vector2(0.19 * s, -0.06 * s), c + Vector2(-0.19 * s, -0.06 * s)]), SILVER)
	draw_rect(Rect2(c.x - 0.19 * s, c.y - 0.06 * s, 0.38 * s, 0.44 * s), SILVER)

	draw_rect(Rect2(c.x - 0.19 * s, c.y + 0.1 * s, 0.38 * s, 0.28 * s), Color("5aa9e6"))
	draw_rect(Rect2(c.x - 0.13 * s, c.y - 0.01 * s, 0.05 * s, 0.3 * s),
		Color(1, 1, 1, 0.25))









func _feather(c: Vector2, s: float) -> void:

	var punta: Vector2 = c + Vector2(0.3 * s, 0.36 * s)
	var alto: Vector2 = c + Vector2(-0.26 * s, -0.4 * s)


	draw_colored_polygon(PackedVector2Array([
		alto, c + Vector2(0.1 * s, -0.22 * s), c + Vector2(0.2 * s, 0.16 * s),
		punta]), SILVER)
	draw_colored_polygon(PackedVector2Array([
		alto, c + Vector2(-0.34 * s, 0.04 * s), c + Vector2(-0.02 * s, 0.22 * s),
		punta]), SILVER_D)


	draw_line(alto, punta, BASE, maxf(0.035 * s, 1.0))
	draw_line(punta, c + Vector2(0.38 * s, 0.46 * s), SILVER, maxf(0.03 * s, 1.0))




func _camera(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.36 * s, c.y - 0.2 * s, 0.6 * s, 0.4 * s), BASE)

	draw_rect(Rect2(c.x + 0.24 * s, c.y - 0.11 * s, 0.14 * s, 0.22 * s), SILVER_D)
	draw_circle(c + Vector2(-0.08 * s, 0.0), 0.13 * s, SILVER)
	draw_circle(c + Vector2(-0.08 * s, 0.0), 0.07 * s, BALL_K)

	draw_circle(c + Vector2(-0.14 * s, -0.28 * s), 0.11 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.2 * s, 0.1 * s, 0.1 * s), SILVER_D)
	for sx in [-1.0, 1.0]:
		draw_colored_polygon(PackedVector2Array([
			c + Vector2(sx * 0.03 * s, 0.3 * s), c + Vector2(sx * 0.24 * s, 0.44 * s),
			c + Vector2(sx * 0.14 * s, 0.44 * s), c + Vector2(0.0, 0.32 * s)]), SILVER_D)









func _glass_pane(c: Vector2, s: float) -> void:

	draw_rect(Rect2(c.x - 0.34 * s, c.y - 0.38 * s, 0.68 * s, 0.76 * s),
		Color("7fa6c8"))


	draw_rect(Rect2(c.x - 0.38 * s, c.y - 0.44 * s, 0.76 * s, 0.08 * s), SILVER_D)
	draw_rect(Rect2(c.x - 0.38 * s, c.y + 0.36 * s, 0.76 * s, 0.08 * s), SILVER_D)

	var h: Vector2 = c + Vector2(0.06 * s, -0.04 * s)
	draw_circle(h, 0.13 * s, BALL_K)

	for k in 8:
		var ang: float = TAU * float(k) / 8.0 + 0.22
		var dir: Vector2 = Vector2(cos(ang), sin(ang))
		draw_line(h + dir * 0.13 * s, h + dir * 0.34 * s, Color("dbeaf6"), 0.035 * s)

	draw_rect(Rect2(c.x - 0.28 * s, c.y - 0.32 * s, 0.07 * s, 0.24 * s),
		Color(1, 1, 1, 0.3))














func _sprinkler(c: Vector2, s: float) -> void:



	draw_rect(Rect2(c.x - 0.42 * s, c.y + 0.4 * s, 0.56 * s, 0.07 * s), BASE)
	_trap(c + Vector2(-0.1 * s, 0.29 * s), 0.1 * s, 0.19 * s, 0.13 * s, BASE)
	draw_rect(Rect2(c.x - 0.14 * s, c.y + 0.1 * s, 0.08 * s, 0.09 * s), BASE)



	var boca: Vector2 = c + Vector2(-0.1 * s, 0.11 * s)
	var dir: Vector2 = Vector2(0.766, -0.643)
	var perp: Vector2 = Vector2(0.643, 0.766)
	var fin: Vector2 = boca + dir * 0.58 * s
	draw_colored_polygon(PackedVector2Array([
		boca - perp * 0.05 * s, boca + perp * 0.05 * s,
		fin + perp * 0.17 * s, fin - perp * 0.17 * s]), SILVER_D)
	draw_colored_polygon(PackedVector2Array([
		boca - perp * 0.025 * s, boca + perp * 0.025 * s,
		fin + perp * 0.09 * s, fin - perp * 0.09 * s]), SILVER)


	draw_circle(fin + dir * 0.1 * s + perp * 0.12 * s, 0.045 * s, SILVER)
	draw_circle(fin + dir * 0.13 * s - perp * 0.1 * s, 0.035 * s, SILVER_D)



















func _food_tray(c: Vector2, s: float) -> void:
	var piv: Vector2 = c + Vector2(-0.02 * s, -0.08 * s)
	var rot: float = -0.42

	var pts: PackedVector2Array = PackedVector2Array()
	for v in [Vector2(-0.34, -0.05), Vector2(0.34, -0.05),
			Vector2(0.34, 0.05), Vector2(-0.34, 0.05)]:
		pts.append(piv +(v as Vector2).rotated(rot) * s)
	draw_colored_polygon(pts, GOLD)

	var canto: PackedVector2Array = PackedVector2Array()
	for v in [Vector2(-0.34, 0.02), Vector2(0.34, 0.02),
			Vector2(0.34, 0.05), Vector2(-0.34, 0.05)]:
		canto.append(piv +(v as Vector2).rotated(rot) * s)
	draw_colored_polygon(canto, GOLD_D)


	var vaso: PackedVector2Array = PackedVector2Array()
	for v in [Vector2(-0.26, -0.28), Vector2(-0.08, -0.28),
			Vector2(-0.11, -0.05), Vector2(-0.23, -0.05)]:
		vaso.append(piv +(v as Vector2).rotated(rot) * s)
	draw_colored_polygon(vaso, SILVER)


	_ellipse(c + Vector2(0.24 * s, 0.2 * s), 0.11 * s, 0.09 * s, SILVER)
	_ellipse(c + Vector2(0.06 * s, 0.34 * s), 0.07 * s, 0.06 * s, GOLD_D)









func _drone(c: Vector2, s: float) -> void:
	var piv: Vector2 = c + Vector2(-0.04 * s, 0.04 * s)
	var rot: float = 0.3


	_ellipse(c + Vector2(0.2 * s, -0.2 * s), 0.09 * s, 0.08 * s, SILVER_D)
	_ellipse(c + Vector2(0.28 * s, -0.31 * s), 0.11 * s, 0.1 * s, SILVER_D)
	_ellipse(c + Vector2(0.34 * s, -0.43 * s), 0.08 * s, 0.07 * s, SILVER_D)

	for a in [PI * 0.25, - PI * 0.25]:
		var d: Vector2 = Vector2(cos(float(a) + rot), sin(float(a) + rot)) * 0.3 * s
		draw_line(piv - d, piv + d, BASE, 0.09 * s)


	for i in 4:
		var a2: float = PI * 0.25 + float(i) * PI * 0.5 + rot
		var e: Vector2 = piv + Vector2(cos(a2), sin(a2)) * 0.3 * s
		if i == 3:
			draw_circle(e, 0.05 * s, BASE)
			continue
		draw_circle(e, 0.15 * s, SILVER)
		draw_circle(e, 0.05 * s, BASE)

	draw_circle(piv, 0.12 * s, SILVER)
	draw_circle(piv, 0.07 * s, BASE)

	var h: Vector2 = c + Vector2(0.3 * s, 0.34 * s)
	var pala: Vector2 = Vector2(cos(0.6), sin(0.6)) * 0.12 * s
	draw_line(h - pala, h + pala, GOLD, 0.05 * s)
	draw_circle(h, 0.03 * s, GOLD_D)











const BEACH_B: Color = Color("2e74c9")


func _beach_ball(c: Vector2, s: float) -> void:
	var b: Vector2 = c + Vector2(-0.06 * s, -0.05 * s)
	var r: float = 0.31 * s
	draw_circle(b, r + 0.035 * s, BASE)
	var cols: Array[Color] = [BAD_R, BALL_W, GOLD, BALL_W, BEACH_B, BALL_W]
	for i in 6:

		var a0: float = - PI * 0.5 + float(i) * TAU / 6.0 + 0.35
		var pts: PackedVector2Array = PackedVector2Array([b])
		for k in 7:
			var a: float = a0 + float(k) / 6.0 * TAU / 6.0
			pts.append(b + Vector2(cos(a), sin(a)) * r)
		_poly(pts, cols[i])


	draw_circle(b, 0.07 * s, BALL_W)
	draw_arc(b, 0.07 * s, 0.0, TAU, 16, BASE, maxf(0.02 * s, 1.0))
	draw_circle(b - Vector2(0.12 * s, 0.13 * s), 0.05 * s, Color(1, 1, 1, 0.22))

	var f: Vector2 = b + Vector2(cos(0.75), sin(0.75)) *(r + 0.13 * s)
	draw_circle(f, 0.13 * s, BASE)
	draw_circle(f, 0.1 * s, BALL_W)
	_poly(_ngon(f, 0.045 * s, 5, - PI * 0.5), BALL_K)




func _viral_phone(c: Vector2, s: float) -> void:
	var w: float = 0.36 * s
	var h: float = 0.62 * s
	var o: Vector2 = c + Vector2(-0.07 * s, 0.0) - Vector2(w, h) * 0.5
	draw_rect(Rect2(o - Vector2(0.03, 0.03) * s, Vector2(w, h) + Vector2(0.06, 0.06) * s), BASE)
	var m: float = 0.035 * s
	var pant: Rect2 = Rect2(o + Vector2(m, m * 2.0), Vector2(w - m * 2.0, h - m * 4.0))
	draw_rect(pant, BEACH_B)
	draw_circle(pant.position + Vector2(0.06 * s, 0.06 * s), 0.03 * s, BAD_R)

	var g: Vector2 = pant.position + pant.size * Vector2(0.78, 0.62)
	var grosor: float = maxf(0.018 * s, 1.0)
	for a in [-2.6, -1.7, 2.4]:
		draw_line(g, g + Vector2(cos(a), sin(a)) * 0.16 * s, BALL_W, grosor)
	var f: Vector2 = c + Vector2(0.2 * s, 0.14 * s)
	draw_circle(f, 0.13 * s, BASE)
	draw_circle(f, 0.1 * s, BALL_W)
	_poly(_ngon(f, 0.045 * s, 5, - PI * 0.5), BALL_K)


func _beer_cup(c: Vector2, s: float) -> void:


	_ellipse(c + Vector2(-0.06 * s, 0.34 * s), 0.32 * s, 0.09 * s, GOLD_D)



	var piv: Vector2 = c + Vector2(0.02 * s, 0.1 * s)
	var rot: float = -2.36
	var pts: PackedVector2Array = PackedVector2Array()
	for v in [Vector2(-0.17, -0.3), Vector2(0.17, -0.3),
			Vector2(0.12, 0.3), Vector2(-0.12, 0.3)]:
		pts.append(piv +(v as Vector2).rotated(rot) * s)
	draw_colored_polygon(pts, GOLD)

	var esp: PackedVector2Array = PackedVector2Array()
	for v in [Vector2(-0.17, -0.3), Vector2(0.17, -0.3),
			Vector2(0.16, -0.17), Vector2(-0.16, -0.17)]:
		esp.append(piv +(v as Vector2).rotated(rot) * s)
	draw_colored_polygon(esp, SILVER)


	var fon: PackedVector2Array = PackedVector2Array()
	for v in [Vector2(-0.12, 0.22), Vector2(0.12, 0.22),
			Vector2(0.12, 0.3), Vector2(-0.12, 0.3)]:
		fon.append(piv +(v as Vector2).rotated(rot) * s)
	draw_colored_polygon(fon, GOLD_D)












func _whistle(c: Vector2, s: float) -> void:
	var b: Vector2 = c + Vector2(-0.1 * s, 0.06 * s)
	var ini: Vector2 = b + Vector2(0.16 * s, -0.17 * s)
	var fin: Vector2 = b + Vector2(0.48 * s, -0.31 * s)
	var perp: Vector2 = Vector2(0.4, 0.92)



	draw_circle(b, 0.29 * s, BASE)
	draw_colored_polygon(PackedVector2Array([
		ini - perp * 0.15 * s, ini + perp * 0.15 * s,
		fin + perp * 0.11 * s, fin - perp * 0.11 * s]), BASE)
	draw_circle(b, 0.235 * s, SILVER)
	draw_colored_polygon(PackedVector2Array([
		ini - perp * 0.105 * s, ini + perp * 0.105 * s,
		fin + perp * 0.07 * s, fin - perp * 0.07 * s]), SILVER)


	draw_rect(Rect2(b.x - 0.13 * s, b.y - 0.2 * s, 0.19 * s, 0.07 * s), BASE)








func _handshake(c: Vector2, s: float) -> void:
	var y: float = c.y + 0.02 * s
	draw_rect(Rect2(c.x - 0.5 * s, y - 0.12 * s, 0.42 * s, 0.24 * s), BASE)
	draw_rect(Rect2(c.x + 0.08 * s, y - 0.12 * s, 0.42 * s, 0.24 * s), BASE)
	draw_circle(c + Vector2(-0.07 * s, y - c.y), 0.21 * s, BASE)
	draw_circle(c + Vector2(0.07 * s, y - c.y), 0.21 * s, BASE)
	draw_rect(Rect2(c.x - 0.46 * s, y - 0.08 * s, 0.3 * s, 0.16 * s), SILVER)
	draw_rect(Rect2(c.x + 0.16 * s, y - 0.08 * s, 0.3 * s, 0.16 * s), SILVER)
	draw_circle(c + Vector2(-0.07 * s, y - c.y), 0.16 * s, SILVER)
	draw_circle(c + Vector2(0.07 * s, y - c.y), 0.16 * s, SILVER)
	draw_rect(Rect2(c.x - 0.025 * s, y - 0.15 * s, 0.05 * s, 0.3 * s), BASE)













func _wall_out(c: Vector2, s: float) -> void:

	draw_rect(Rect2(c.x - 0.46 * s, c.y + 0.12 * s, 0.92 * s, 0.32 * s), BRONZE_D)


	for fila in 2:
		var y: float = c.y + 0.145 * s + float(fila) * 0.155 * s
		var off: float = 0.0 if fila == 0 else -0.1 * s
		for k in 5:
			var x: float = c.x - 0.44 * s + float(k) * 0.22 * s + off
			var x0: float = maxf(x, c.x - 0.44 * s)
			var x1: float = minf(x + 0.2 * s, c.x + 0.44 * s)
			if x1 - x0 > 0.02 * s:
				draw_rect(Rect2(x0, y, x1 - x0, 0.125 * s), BRONZE)


	var bola: Vector2 = c + Vector2(0.29 * s, -0.29 * s)
	draw_circle(bola, 0.135 * s, BALL_W)
	_poly(_ngon(bola, 0.06 * s, 5, - PI * 0.5), BALL_K)







	var salida: Vector2 = c + Vector2(-0.18 * s, 0.1 * s)
	for k in 4:
		var u: float = float(k) / 4.0

		var pt: Vector2 = salida.lerp(bola, u) - Vector2(0.0, sin(u * PI) * 0.07 * s)
		draw_circle(pt,(0.025 + 0.022 * u) * s, SILVER_D)












func _dugout(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.46 * s, c.y - 0.3 * s, 0.92 * s, 0.12 * s), GOLD)
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * 0.4 * s - 0.04 * s, c.y - 0.18 * s,
			0.08 * s, 0.44 * s), GOLD_D)
	draw_rect(Rect2(c.x - 0.4 * s, c.y - 0.18 * s, 0.8 * s, 0.2 * s), BASE)
	draw_rect(Rect2(c.x - 0.34 * s, c.y + 0.06 * s, 0.68 * s, 0.1 * s), GOLD)
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * 0.24 * s - 0.03 * s, c.y + 0.16 * s,
			0.06 * s, 0.16 * s), GOLD_D)








func _scoreboard(c: Vector2, s: float) -> void:
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * 0.22 * s - 0.04 * s, c.y + 0.2 * s,
			0.08 * s, 0.22 * s), BASE)
	var r: Rect2 = Rect2(c.x - 0.44 * s, c.y - 0.34 * s, 0.88 * s, 0.56 * s)
	draw_rect(r, GOLD_D)
	draw_rect(r.grow(-0.05 * s), Color("1d1f26"))


	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * 0.22 * s - 0.11 * s, c.y - 0.22 * s,
			0.22 * s, 0.32 * s), GOLD)
	for dy in [-0.11, 0.03]:
		draw_rect(Rect2(c.x - 0.03 * s, c.y + dy * s, 0.06 * s, 0.06 * s), GOLD)













const BAD_R: Color = Color("c0392b")









func _hung_boots(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.44 * s, c.y - 0.4 * s, 0.88 * s, 0.07 * s), BASE)
	for sx in [-1.0, 1.0]:
		var bx: float = c.x + sx * 0.24 * s
		draw_rect(Rect2(bx - 0.02 * s, c.y - 0.34 * s, 0.04 * s, 0.22 * s), GOLD_D)



		draw_rect(Rect2(bx - 0.08 * s, c.y - 0.12 * s, 0.16 * s, 0.22 * s), GOLD)
		var fx: float = bx - 0.2 * s if sx < 0.0 else bx - 0.08 * s
		draw_rect(Rect2(fx, c.y + 0.06 * s, 0.28 * s, 0.13 * s), GOLD)
		draw_rect(Rect2(fx - 0.02 * s, c.y + 0.19 * s, 0.32 * s, 0.05 * s), GOLD_D)









func _cross(c: Vector2, s: float) -> void:
	var arm: float = 0.15 * s
	var rad: float = 0.42 * s
	draw_rect(Rect2(c.x - arm, c.y - rad, arm * 2.0, rad * 2.0), BAD_R.darkened(0.35))
	draw_rect(Rect2(c.x - rad, c.y - arm, rad * 2.0, arm * 2.0), BAD_R.darkened(0.35))
	draw_rect(Rect2(c.x - arm * 0.78, c.y - rad * 0.88, arm * 1.56, rad * 1.76), BAD_R)
	draw_rect(Rect2(c.x - rad * 0.88, c.y - arm * 0.78, rad * 1.76, arm * 1.56), BAD_R)








func _statue(c: Vector2, s: float) -> void:
	_trap(c + Vector2(0.0, 0.4 * s), 0.3 * s, 0.36 * s, 0.09 * s, BASE)
	draw_rect(Rect2(c.x - 0.22 * s, c.y + 0.16 * s, 0.44 * s, 0.16 * s), BASE)



	_trap(c + Vector2(0.0, 0.12 * s), 0.12 * s, 0.32 * s, 0.12 * s, GOLD)
	draw_rect(Rect2(c.x - 0.05 * s, c.y - 0.1 * s, 0.1 * s, 0.1 * s), GOLD_D)
	draw_circle(c + Vector2(0.0, -0.22 * s), 0.13 * s, GOLD)
	draw_circle(c + Vector2(-0.05 * s, -0.26 * s), 0.045 * s, Color(1, 1, 1, 0.2))










func _gem(c: Vector2, s: float) -> void:
	var top: float = -0.22 * s
	var w: float = 0.38 * s
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(- w, top), c + Vector2(w, top), c + Vector2(0.0, 0.42 * s)]), GOLD)


	draw_colored_polygon(PackedVector2Array([
		c + Vector2(- w, top), c + Vector2(w, top),
		c + Vector2(w * 0.62, top - 0.16 * s), c + Vector2(- w * 0.62, top - 0.16 * s)]),
		GOLD.lightened(0.28))
	for sx in [-1.0, 1.0]:
		draw_line(c + Vector2(sx * w * 0.62, top), c + Vector2(0.0, 0.42 * s),
			GOLD_D, maxf(0.025 * s, 1.0))
	draw_line(c + Vector2(- w, top), c + Vector2(w, top), GOLD_D, maxf(0.025 * s, 1.0))




func _flame(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.44 * s), c + Vector2(0.26 * s, -0.02 * s),
		c + Vector2(0.3 * s, 0.2 * s), c + Vector2(0.0, 0.44 * s),
		c + Vector2(-0.3 * s, 0.2 * s), c + Vector2(-0.26 * s, -0.02 * s)]),
		Color("e2622a"))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.14 * s), c + Vector2(0.17 * s, 0.14 * s),
		c + Vector2(0.0, 0.4 * s), c + Vector2(-0.17 * s, 0.14 * s)]), GOLD)









func _poker_cup(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c + Vector2(-0.26 * s, 0.3 * s), Vector2(0.52 * s, 0.12 * s)), GOLD_D)
	draw_rect(Rect2(c + Vector2(-0.18 * s, 0.22 * s), Vector2(0.36 * s, 0.09 * s)), GOLD)
	for k in [-1.0, 1.0]:
		var ang: float = k * 0.26
		var ctr: Vector2 = c + Vector2(k * 0.08 * s, -0.06 * s)
		var hw: float = 0.15 * s
		var hh: float = 0.23 * s
		var pts: PackedVector2Array = PackedVector2Array()
		for v in [Vector2(- hw, - hh), Vector2(hw, - hh), Vector2(hw, hh), Vector2(- hw, hh)]:
			pts.append(ctr +(v as Vector2).rotated(ang))
		draw_colored_polygon(pts, BALL_W)
		pts.append(pts[0])
		draw_polyline(pts, GOLD_D, maxf(0.025 * s, 1.0))

	var p: Vector2 = c + Vector2(0.08 * s, -0.08 * s)
	draw_circle(p + Vector2(-0.045 * s, 0.01 * s), 0.05 * s, BALL_K)
	draw_circle(p + Vector2(0.045 * s, 0.01 * s), 0.05 * s, BALL_K)
	draw_colored_polygon(PackedVector2Array([p + Vector2(-0.092 * s, 0.0),
		p + Vector2(0.0, -0.11 * s), p + Vector2(0.092 * s, 0.0)]), BALL_K)
	draw_colored_polygon(PackedVector2Array([p + Vector2(0.0, 0.02 * s),
		p + Vector2(-0.04 * s, 0.1 * s), p + Vector2(0.04 * s, 0.1 * s)]), BALL_K)




func _crown(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.4 * s, -0.3 * s), c + Vector2(-0.22 * s, 0.02 * s),
		c + Vector2(0.0, -0.34 * s), c + Vector2(0.22 * s, 0.02 * s),
		c + Vector2(0.4 * s, -0.3 * s), c + Vector2(0.34 * s, 0.2 * s),
		c + Vector2(-0.34 * s, 0.2 * s)]), GOLD)
	draw_rect(Rect2(c.x - 0.36 * s, c.y + 0.2 * s, 0.72 * s, 0.14 * s), GOLD_D)
	for px in [-0.4, 0.0, 0.4]:
		draw_circle(c + Vector2(px * s, -0.32 * s), 0.06 * s, GOLD.lightened(0.3))







func _money(c: Vector2, s: float) -> void:
	for i in 3:
		var y: float = c.y + 0.16 * s - float(i) * 0.13 * s
		var w: float = 0.4 * s - float(i) * 0.02 * s
		draw_rect(Rect2(c.x - w, y, w * 2.0, 0.13 * s), GOLD_D)
		draw_rect(Rect2(c.x - w, y, w * 2.0, 0.1 * s), GOLD)

	draw_rect(Rect2(c.x - 0.09 * s, c.y - 0.13 * s, 0.18 * s, 0.42 * s), BASE)
	draw_rect(Rect2(c.x - 0.09 * s, c.y - 0.13 * s, 0.18 * s, 0.42 * s).grow(-0.025 * s),
		GOLD_D)







func _contract(c: Vector2, s: float) -> void:
	var w: float = 0.3 * s
	var cut: float = 0.16 * s
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(- w, -0.42 * s), c + Vector2(w - cut, -0.42 * s),
		c + Vector2(w, -0.42 * s + cut), c + Vector2(w, 0.42 * s),
		c + Vector2(- w, 0.42 * s)]), Color("e8e9ee"))

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(w - cut, -0.42 * s), c + Vector2(w, -0.42 * s + cut),
		c + Vector2(w - cut, -0.42 * s + cut)]), Color("9aa0a6"))
	for i in 3:
		draw_rect(Rect2(c.x - 0.2 * s, c.y - 0.24 * s + float(i) * 0.12 * s,
			0.4 * s, 0.045 * s), Color("9aa0a6"))

	draw_rect(Rect2(c.x - 0.2 * s, c.y + 0.24 * s, 0.4 * s, 0.05 * s), GOLD_D)
	draw_line(c + Vector2(-0.16 * s, 0.2 * s), c + Vector2(0.02 * s, 0.08 * s),
		GOLD, maxf(0.045 * s, 2.0))
	draw_line(c + Vector2(0.02 * s, 0.08 * s), c + Vector2(0.18 * s, 0.2 * s),
		GOLD, maxf(0.045 * s, 2.0))







func _bubble(c: Vector2, s: float) -> void:
	var r: Rect2 = Rect2(c.x - 0.42 * s, c.y - 0.36 * s, 0.84 * s, 0.56 * s)
	draw_rect(r, GOLD)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.24 * s, 0.2 * s), c + Vector2(-0.04 * s, 0.2 * s),
		c + Vector2(-0.2 * s, 0.44 * s)]), GOLD)
	for px in [-0.22, 0.0, 0.22]:
		draw_circle(c + Vector2(px * s, -0.08 * s), 0.07 * s, BASE)








func _car(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.24 * s, -0.1 * s), c + Vector2(-0.08 * s, -0.3 * s),
		c + Vector2(0.14 * s, -0.3 * s), c + Vector2(0.28 * s, -0.1 * s)]), GOLD_D)
	draw_rect(Rect2(c.x - 0.46 * s, c.y - 0.1 * s, 0.92 * s, 0.24 * s), GOLD)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.46 * s, -0.1 * s), c + Vector2(-0.3 * s, -0.1 * s),
		c + Vector2(-0.46 * s, 0.02 * s)]), GOLD)
	for sx in [-1.0, 1.0]:
		draw_circle(c + Vector2(sx * 0.26 * s, 0.18 * s), 0.14 * s, BASE)
		draw_circle(c + Vector2(sx * 0.26 * s, 0.18 * s), 0.06 * s, SILVER_D)
	draw_rect(Rect2(c.x - 0.06 * s, c.y - 0.28 * s, 0.04 * s, 0.18 * s), BASE)







func _briefcase(c: Vector2, s: float) -> void:
	draw_arc(c + Vector2(0.0, -0.2 * s), 0.15 * s, PI, TAU, 18, GOLD_D,
		maxf(0.05 * s, 2.0))
	draw_rect(Rect2(c.x - 0.44 * s, c.y - 0.22 * s, 0.88 * s, 0.56 * s), GOLD)
	draw_rect(Rect2(c.x - 0.44 * s, c.y - 0.04 * s, 0.88 * s, 0.06 * s), GOLD_D)
	draw_rect(Rect2(c.x - 0.08 * s, c.y - 0.09 * s, 0.16 * s, 0.16 * s), BASE)








func _phoenix(c: Vector2, s: float) -> void:



	for sx in [-1.0, 1.0]:
		draw_colored_polygon(PackedVector2Array([
			c + Vector2(sx * 0.04 * s, 0.06 * s), c + Vector2(sx * 0.18 * s, -0.38 * s),
			c + Vector2(sx * 0.5 * s, -0.02 * s), c + Vector2(sx * 0.2 * s, 0.14 * s)]),
			GOLD)


	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.12 * s, -0.12 * s), c + Vector2(0.12 * s, -0.12 * s),
		c + Vector2(0.0, 0.44 * s)]), GOLD_D)
	draw_circle(c + Vector2(0.0, -0.24 * s), 0.12 * s, GOLD)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.1 * s, -0.28 * s), c + Vector2(0.24 * s, -0.22 * s),
		c + Vector2(0.1 * s, -0.16 * s)]), GOLD_D)






func _ellipse_pts(c: Vector2, rx: float, ry: float, rot: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 33:
		var a: float = float(i) / 32.0 * TAU
		pts.append(c + Vector2(cos(a) * rx, sin(a) * ry).rotated(rot))
	return pts


func _trap(center: Vector2, hw_top: float, hw_bot: float, hh: float, color: Color) -> void:
	draw_colored_polygon(PackedVector2Array([
		center + Vector2(- hw_top, - hh), center + Vector2(hw_top, - hh),
		center + Vector2(hw_bot, hh), center + Vector2(- hw_bot, hh)]), color)


func _poly(points: PackedVector2Array, color: Color) -> void:
	draw_colored_polygon(points, color)


func _ngon(c: Vector2, r: float, n: int, start: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in n:
		var a: float = start + float(i) / float(n) * TAU
		pts.append(c + Vector2(cos(a), sin(a)) * r)
	return pts


func _star(c: Vector2, outer: float, inner: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 10:
		var rad: float = outer if i % 2 == 0 else inner
		var ang: float = - PI * 0.5 + float(i) * PI / 5.0
		pts.append(c + Vector2(cos(ang), sin(ang)) * rad)
	return pts
