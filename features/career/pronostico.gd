class_name Pronostico
extends RefCounted





















const CADA: int = 3
const TURNO: int = 1



const MIN_PJ: int = 5



const VECINOS: int = 3





static func toca(jugados: int) -> bool:
	return jugados % CADA == TURNO



static func vecinos(puesto_tu: int, puesto_el: int) -> bool:
	return puesto_tu > 0 and puesto_el > 0 and absi(puesto_tu - puesto_el) <= VECINOS





static func orienta(win: float, draw: float, loss: float, home: bool) -> Array:
	return [win, draw, loss] if home else [loss, draw, win]





static func goleador(race: Array, team: String, tuyo_g: int = -1,
		tuyo_nombre: String = "") -> Dictionary:
	var mejor: Dictionary = {}
	if tuyo_g > 0:
		mejor = {"name": tuyo_nombre, "goals": tuyo_g, "tu": true}
	for e in race:
		var r: Dictionary = e as Dictionary
		if String(r.get("team", "")) != team:
			continue
		var g: int = int(r.get("goals", 0))
		if g > int(mejor.get("goals", 0)):
			mejor = {"name": String(r.get("name", "")), "goals": g, "tu": false}
	return mejor








static func para_previa(fx: Dictionary, jugados: int) -> Dictionary:
	if String(fx.get("comp", "")) != "league" or not toca(jugados):
		return {}
	var opp: String = String(fx.get("opp", ""))
	var mio: String = GameState.player_team_id
	if opp.is_empty() or mio.is_empty():
		return {}
	var pj: int = int(Dictionary(GameState.league_table.get(
		GameState.YOU_KEY, {})).get("pj", 0))
	if pj < MIN_PJ:
		return {}
	var puesto_tu: int = 0
	var puesto_el: int = 0
	var filas: Array = GameState.league_standings()
	for i in filas.size():
		var key: String = String((filas[i] as Dictionary).get("key", ""))
		if key == GameState.YOU_KEY:
			puesto_tu = i + 1
		elif key == opp:
			puesto_el = i + 1
	if not vecinos(puesto_tu, puesto_el):
		return {}
	var o: Dictionary = GameState.odds_fixture(fx)
	if o.is_empty():
		return {}
	var home: bool = bool(fx.get("home", true))
	var race: Array = GoleoVivo._carrera("league")
	var tu: Dictionary = {"team": mio, "tuyo": true, "puesto": puesto_tu,
		"forma": GameState.form_of_any(mio, "league"),
		"goleador": goleador(race, mio, Career.league_here("g"), Career.player_name)}
	var el: Dictionary = {"team": opp, "tuyo": false, "puesto": puesto_el,
		"forma": GameState.form_of_any(opp, "league"),
		"goleador": goleador(race, opp)}
	return {"home": home,
		"odds": orienta(float(o["win"]), float(o["draw"]), float(o["loss"]), home),
		"lados": [tu, el] if home else [el, tu]}
