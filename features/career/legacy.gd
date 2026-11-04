class_name Legacy
extends RefCounted


































const TIERS: Array[Dictionary] = [
	{"min": 0, "name": "PROMESA"},
	{"min": 100, "name": "PROFESIONAL"},
	{"min": 300, "name": "FIGURA"},
	{"min": 650, "name": "ESTRELLA MUNDIAL"},
	{"min": -1, "name": "LEYENDA"},
	{"min": -1, "name": "INMORTAL"},
]




const SUMMIT_FLOOR: int = 650




const WORLD_LEYENDA: float = 45.0
const WORLD_INMORTAL: float = 67.0




const STAR_SPAN_PREST: float = 15.0





const CLUB_LEYENDA_TOTAL: int = 8
const CLUB_INMORTAL_TOTAL: int = 14
const CLUB_INMORTAL_TOTAL_CONT: int = 12












const AWARD_POINTS: Dictionary = {
















	"Mejor Jugador de la Historia": 200,
	"Balón de Oro": 60,
	"Premio del Mundo": 40,
	"Chico de Oro": 20,
	"Gol del Año": 15,


	"Bota de Oro de Europa": 12,
	"Campeón del Mundo": 55,
	"Campeón continental": 30,
	"Campeón de la Finalísima": 10,
	"Campeón de la Liga de Naciones": 12,
	"Campeón Olímpico": 18,
	"Bota de Oro del Mundial": 25,
	"Mejor del Mundial": 25,
	"Mejor de la Copa continental": 15,
	"Bota de la Copa continental": 15,
	"Máximo Asistente del Mundial": 20,
	"Máximo Asistente de la Copa continental": 12,

	"Campeón de Champions": 40,
	"Mejor de la Champions": 22,
	"Bota de la Champions": 20,
	"Máximo Asistente de la Champions": 16,

	"Campeón de Europa League": 22,
	"Mejor de la Europa League": 13,
	"Bota de la Europa League": 12,
	"Máximo Asistente de la Europa League": 9,




	"Campeón de Libertadores": 40,
	"Mejor de la Libertadores": 22,
	"Bota de la Libertadores": 20,
	"Máximo Asistente de la Libertadores": 16,
	"Campeón de Concacaf": 40,
	"Mejor de la Concacaf": 22,
	"Bota de la Concacaf": 20,
	"Máximo Asistente de la Concacaf": 16,
	"Campeón de Sudamericana": 22,
	"Mejor de la Sudamericana": 13,
	"Bota de la Sudamericana": 12,
	"Máximo Asistente de la Sudamericana": 9,

	"Campeón de Copa de Oriente": 40,
	"Mejor de la Copa de Oriente": 22,
	"Bota de la Copa de Oriente": 20,
	"Máximo Asistente de la Copa de Oriente": 16,
	"Campeón de Copa del Sol": 22,
	"Mejor de la Copa del Sol": 13,
	"Bota de la Copa del Sol": 12,
	"Máximo Asistente de la Copa del Sol": 9,

	"Campeón de Copa del Atlas": 40,
	"Mejor de la Copa del Atlas": 22,
	"Bota de la Copa del Atlas": 20,
	"Máximo Asistente de la Copa del Atlas": 16,
	"Campeón de Copa del Baobab": 22,
	"Mejor de la Copa del Baobab": 13,
	"Bota de la Copa del Baobab": 12,
	"Máximo Asistente de la Copa del Baobab": 9,


	"Campeón de Copa del Coral": 22,
	"Mejor de la Copa del Coral": 13,
	"Bota de la Copa del Coral": 12,
	"Máximo Asistente de la Copa del Coral": 9,

	"Campeón de Conference": 12,
	"Mejor de la Conference": 8,
	"Bota de la Conference": 7,
	"Máximo Asistente de la Conference": 5,

	"Campeón del Mundo de Clubes": 18,
	"Mejor del Mundial de Clubes": 12,
	"Bota del Mundial de Clubes": 11,
	"Máximo Asistente del Mundial de Clubes": 8,

	"Campeón de Liga": 20,
	"Mejor Jugador de la Liga": 15,
	"Pichichi de la Liga": 12,
	"Máximo Asistente de la Liga": 10,

	"Campeón de Copa": 12,
	"Campeón de Campeones": 5,

	"Campeón de Supercopa": 5,
	"Campeón de la Copa de la Liga": 7,


	"Campeón de la Recopa": 5,

	"Campeón de la Supercopa de Europa": 5,

	"Campeón de la Supercopa de África": 5,

	"Campeón de la Copa de las Ligas": 7,
	"Campeón Intercontinental": 9,
	"Mejor de la Copa": 9,
	"Bota de la Copa": 8,
	"Máximo Asistente de la Copa": 6,

	"Ascenso": 6,
	"Jugador del Mes": 3,
	"Jugador del Partido": 1,




	"Mejor Jugador del Club": 3,
	"Mejor Delantero del Club": 1,
	"Mejor Medio del Club": 1,
	"Mejor Defensa del Club": 1,

	"Bota de Oro": 12,
	"MVP de la temporada": 15,
}






const FLAVOR_ONLY: Array = ["Jugador del Partido"]
const REPEATABLE: Array = ["Jugador del Mes", "Ascenso", "Mejor Jugador del Club",
	"Mejor Delantero del Club", "Mejor Medio del Club", "Mejor Defensa del Club"]
const REPEATABLE_CAP: int = 30





























static func score(career_goals: int, career_assists: int, awards: Array,
		nat_caps: int, nat_goals: int = 0, nat_assists: int = 0) -> int:
	var s: int = int(round(34.0 * sqrt(float(maxi(career_goals, 0) + maxi(nat_goals, 0)))
		+ 12.0 * sqrt(float(maxi(career_assists, 0) + maxi(nat_assists, 0)))
		+ 4.0 * sqrt(float(maxi(nat_caps, 0)))))
	var repeatable: int = 0
	for a in awards:
		var key: String = String(a)
		if key in FLAVOR_ONLY:
			continue
		var pts: int = int(AWARD_POINTS.get(key, 0))
		if key in REPEATABLE:
			repeatable += pts
		else:
			s += pts
	return s + mini(repeatable, REPEATABLE_CAP)



static func _rk(name: String) -> int:
	if name == "INMORTAL":
		return 2
	if name == "LEYENDA":
		return 1
	return 0







static func is_club_immortal(club_total: int, club_rank: int, club_cont: int) -> bool:
	return club_rank == 1 and (club_total >= CLUB_INMORTAL_TOTAL
		or (club_total >= CLUB_INMORTAL_TOTAL_CONT and club_cont >= 1))














static func tier(score_value: int, world_prestige: float = 0.0,
		club_total: int = 0, club_rank: int = 0, club_cont: int = 0,
		club_name: String = "") -> Dictionary:

	var w_name: String = ""
	var w_star: int = 0
	if score_value >= SUMMIT_FLOOR and world_prestige >= WORLD_INMORTAL:
		w_name = "INMORTAL"
		w_star = int(floor((world_prestige - WORLD_INMORTAL) / STAR_SPAN_PREST)) + 1
	elif score_value >= SUMMIT_FLOOR and world_prestige >= WORLD_LEYENDA:
		w_name = "LEYENDA"

	var c_name: String = ""
	if is_club_immortal(club_total, club_rank, club_cont):
		c_name = "INMORTAL"
	elif club_rank >= 1 and club_rank <= 2 and club_total >= CLUB_LEYENDA_TOTAL:
		c_name = "LEYENDA"
	var res: Dictionary

	if _rk(w_name) > 0 and _rk(w_name) >= _rk(c_name):
		res = _summit_world(w_name, w_star, world_prestige)
	elif _rk(c_name) > 0:
		res = _summit_club(c_name, club_total, club_cont, club_name)
	else:

		res = _band(score_value, world_prestige, club_total, club_rank)
	res["vias"] = _vias(score_value, world_prestige, club_total, club_rank,
		club_cont, w_name, w_star, c_name)
	return res











static func _vias(score_value: int, wp: float, ct: int, rank: int, cont: int,
		w_name: String, w_star: int, c_name: String) -> Dictionary:
	var world: Dictionary
	if w_name == "INMORTAL":
		var into: float =(wp - WORLD_INMORTAL) - float(w_star - 1) * STAR_SPAN_PREST
		world = {"prestige": wp, "target": WORLD_INMORTAL + float(w_star) * STAR_SPAN_PREST,
			"next": I18n.tf("INMORTAL ★{0}", [w_star + 1]),
			"ratio": clampf(into / STAR_SPAN_PREST, 0.0, 1.0), "floor_ok": true}
	elif w_name == "LEYENDA":
		world = {"prestige": wp, "target": WORLD_INMORTAL, "next": "INMORTAL",
			"ratio": clampf((wp - WORLD_LEYENDA) /(WORLD_INMORTAL - WORLD_LEYENDA),
				0.0, 1.0), "floor_ok": true}
	else:
		world = {"prestige": wp, "target": WORLD_LEYENDA, "next": "LEYENDA",
			"ratio": clampf(wp / WORLD_LEYENDA, 0.0, 1.0),
			"floor_ok": score_value >= SUMMIT_FLOOR}
	var club: Dictionary
	if c_name == "INMORTAL":
		club = {"total": ct, "target": ct, "rank": rank, "next": "",
			"ratio": 1.0, "rank_ok": true}
	elif c_name == "LEYENDA":
		var target: int = CLUB_INMORTAL_TOTAL_CONT if cont >= 1 else CLUB_INMORTAL_TOTAL
		club = {"total": ct, "target": target, "rank": rank, "next": "INMORTAL",
			"ratio": clampf(float(ct - CLUB_LEYENDA_TOTAL)
				/ float(maxi(target - CLUB_LEYENDA_TOTAL, 1)), 0.0, 1.0),
			"rank_ok": true}
	else:
		club = {"total": ct, "target": CLUB_LEYENDA_TOTAL, "rank": rank,
			"next": "LEYENDA",
			"ratio": clampf(float(ct) / float(CLUB_LEYENDA_TOTAL), 0.0, 1.0),
			"rank_ok": rank >= 1 and rank <= 2}
	return {"world": world, "club": club}




static func _summit_world(name: String, star: int, wp: float) -> Dictionary:
	if name == "INMORTAL":
		var over: float = wp - WORLD_INMORTAL
		var into: float = over - float(star - 1) * STAR_SPAN_PREST
		return {
			"name": "INMORTAL", "via": "Mundo", "sub": "del Mundo", "star": star,
			"next": I18n.tf("INMORTAL ★{0}", [star + 1]),
			"ratio": clampf(into / STAR_SPAN_PREST, 0.0, 1.0),
			"to_next": int(ceil(STAR_SPAN_PREST - into)), "gate_hint": "",
		}
	var span: float = WORLD_INMORTAL - WORLD_LEYENDA
	return {
		"name": "LEYENDA", "via": "Mundo", "sub": "del Mundo", "star": 0,
		"next": "INMORTAL",
		"ratio": clampf((wp - WORLD_LEYENDA) / span, 0.0, 1.0),
		"to_next": int(ceil(WORLD_INMORTAL - wp)), "gate_hint": "",
	}




static func _summit_club(name: String, ct: int, cont: int, club: String) -> Dictionary:



	var sub: String = I18n.tf("de {0}", [club]) if not club.is_empty() \
			else I18n.t("de tu club")
	if name == "INMORTAL":
		return {
			"name": "INMORTAL", "via": "Club", "sub": sub, "star": 0,
			"next": "", "ratio": 1.0, "to_next": 0,
			"gate_hint": I18n.tf("Leyenda eterna {0}.", [sub]),
		}
	var target: int = CLUB_INMORTAL_TOTAL_CONT if cont >= 1 else CLUB_INMORTAL_TOTAL
	var span: int = maxi(target - CLUB_LEYENDA_TOTAL, 1)
	return {
		"name": "LEYENDA", "via": "Club", "sub": sub, "star": 0,
		"next": I18n.tf("INMORTAL {0}", [sub]),
		"ratio": clampf(float(ct - CLUB_LEYENDA_TOTAL) / float(span), 0.0, 1.0),
		"to_next": maxi(0, target - ct), "gate_hint": "",
	}





static func _band(score_value: int, wp: float, club_total: int,
		club_rank: int) -> Dictionary:
	var idx: int = 0
	for i in 4:
		if score_value >= int(TIERS[i]["min"]):
			idx = i
	var cur: Dictionary = TIERS[idx]
	if idx < 3:
		var nxt: Dictionary = TIERS[idx + 1]
		var span: int = int(nxt["min"]) - int(cur["min"])
		return {
			"name": String(cur["name"]), "via": "", "sub": "", "star": 0,
			"next": String(nxt["name"]),
			"ratio": clampf(float(score_value - int(cur["min"])) / float(maxi(span, 1)), 0.0, 1.0),
			"to_next": maxi(0, int(nxt["min"]) - score_value), "gate_hint": "",
		}

	var w_prog: float = clampf(wp / WORLD_LEYENDA, 0.0, 1.0)
	var c_prog: float = 0.0
	if club_rank >= 1 and club_rank <= 2:
		c_prog = clampf(float(club_total) / float(CLUB_LEYENDA_TOTAL), 0.0, 1.0)
	var sub: String = "—a las puertas" if score_value >= 900 else ""
	return {
		"name": "ESTRELLA MUNDIAL", "via": "", "sub": sub, "star": 0,
		"next": "LEYENDA",

		"ratio": clampf(maxf(w_prog, c_prog), 0.0, 0.99), "to_next": 0,
		"gate_hint": "Te falta prestigio de leyenda mundial (o palmarés de club) para LEYENDA.",
	}
