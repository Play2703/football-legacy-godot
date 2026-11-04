extends Ceremony








































































const T_CHYRON: float = 1.8
const T_MEDIO: float = 3.4
const T_TABLERO: float = 7.4
const T_CARD: float = 8.0






const DRIFT: float = -0.1















static func _aspecto() -> float:
	var l: Vector2 = UiKit.lienzo()
	return l.x / l.y





const LLENA: float = 0.94




const FOV_FIN: float = 40.0






const D_PERSONA: float = 39.0
const D_MEDIO: float = 27.8



const LADO_PERSONA: float = 1.25





const TABLERO_FALLBACK: Vector3 = Vector3(0.0, 16.15, -25.82)
const ANCHO_FALLBACK: float = 9.6






const ANCHO_MARCO: float = 10.4





















const BAJA_MIRADA: float = 7.0


















const BASURA_N: int = 26
const BASURA_LADO: float = 16.0






const BASURA_DESDE: float = 27.0
const BASURA_HASTA: float = 36.0


const BASURA_Y: float = 0.02


var _perdi: bool = false
var _actor: AnimatedSprite3D = null
var _eje: Vector3 = Vector3.BACK
var _centro: Vector3 = TABLERO_FALLBACK


var _alza: float = 0.0
var _fin_h: float = 0.0
var _fin_mira: float = 0.0





func _accent_for() -> Color:
	if int(data.get("ga", 0)) > int(data.get("gf", 0)):

		return CareerTheme.DANGER
	return CareerTheme.accent_of(team())


func _build() -> void:
	_perdi = int(data.get("ga", 0)) > int(data.get("gf", 0))
	var local: Dictionary = _local_team()
	var visita: Dictionary = _visita_team()
	var kit: Dictionary = GameState.kit_variant(local, 0)





















	make_stadium({
		"div": div(),
		"attendance": 0.0,
		"venue_empty": true,
		"home_only": true,
		"party": false,
		"flare_odds": 0.0,
		"weather": "night",
		"kickoff": 1.0,
		"home_club": String(local.get("id", "")),
		"kit": kit,








		"comp": "league",
	})



	var fin: Dictionary = _llave_tablero()
	make_camera([_llave_entrada(), _llave_medio(), fin], FOV_FIN)
	orbit_speed = DRIFT





	scrim_dim(0.55)

	_siembra_basura()
	_pinta_marcador(local, visita)
	_planta_persona()







	make_chyron(I18n.t("DERBI"),
		CareerTheme.caps(Nations.team_label(local)), local, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("EL MARCADOR SIGUE PUESTO"), 40)


	card_club(local)
	card_stats([{"v": "%d-%d" % [_goles_local(), _goles_visita()],
		"k": I18n.t("FINAL")}])
	card_note(I18n.t("Tres horas después del pitido. Nadie ha venido a apagarlo.")
		if _perdi
		else I18n.t("Tres horas después del pitido. En su casa nadie ha venido a apagarlo."))
	card_cta(I18n.t("SEGUIR"))





func _mi_team() -> Dictionary:
	return Teams.by_id(club_del_acto())







func _rival_team() -> Dictionary:
	var opp: String = String(data.get("opp", ""))
	if opp.is_empty():
		return {}
	var club: Dictionary = Teams.by_id(opp)
	return club if not club.is_empty() else Nations.as_team(opp)





func _local_team() -> Dictionary:
	return _mi_team() if bool(data.get("home", false)) else _rival_team()


func _visita_team() -> Dictionary:
	return _rival_team() if bool(data.get("home", false)) else _mi_team()






func _goles_local() -> int:
	return int(data.get("gf", 0)) if bool(data.get("home", false)) \
			else int(data.get("ga", 0))


func _goles_visita() -> int:
	return int(data.get("ga", 0)) if bool(data.get("home", false)) \
			else int(data.get("gf", 0))





















func _llave_tablero() -> Dictionary:
	var ancho: float = ANCHO_MARCO
	var yaw: float = 180.0
	var root: Node3D = stadium._scoreboard_root if stadium != null else null
	if root != null and root.is_inside_tree():
		_centro = root.global_position
		ancho = ANCHO_MARCO * float(stadium._scoreboard_cfg().get("scale", 1.0))
		var n: Vector3 = root.global_transform.basis.z
		yaw = rad_to_deg(atan2(n.x, - n.z))
	_eje = Vector3(sin(deg_to_rad(yaw)), 0.0, - cos(deg_to_rad(yaw)))
	var media: float = tan(deg_to_rad(FOV_FIN) * 0.5) * _aspecto()
	var dist: float =(ancho * 0.5) / maxf(LLENA * media, 0.001)



	var marco: Dictionary = stadium.scoreboard_frame() if stadium != null else {}
	_alza = deg_to_rad(alza_cubierta(_sobre_eje(dist) + Vector3.UP * _centro.y, dist, marco))
	_fin_h = _centro.y - dist * tan(_alza)
	var baja: float = BAJA_MIRADA * ancho / ANCHO_MARCO
	_fin_mira = _fin_h + dist * tan(_alza - atan(baja / dist))
	return {"t": T_TABLERO, "dist": dist, "h": _fin_h, "yaw": yaw,
		"aim_y": _fin_mira, "fov": FOV_FIN,
		"focus_x": _centro.x, "focus_z": _centro.z}



func _sobre_eje(d: float, lado: float = 0.0) -> Vector3:


	var lat: Vector3 = Vector3(_eje.z, 0.0, - _eje.x)
	return Vector3(_centro.x, 0.0, _centro.z) + _eje * d + lat * lado




















func _llave_entrada() -> Dictionary:
	var p: Vector3 = _sobre_eje(D_PERSONA, LADO_PERSONA)
	return {"t": 0.0, "dist": 6.2, "h": 1.45, "yaw": _yaw_fin() - 8.0,
		"aim_y": 1.35, "fov": 38.0, "focus_x": p.x, "focus_z": p.z}















func _llave_medio() -> Dictionary:
	var p: Vector3 = _sobre_eje(D_MEDIO, LADO_PERSONA * 0.4)
	var bajo: bool = _alza > 0.0
	return {"t": T_MEDIO, "dist": 18.0, "h": lerpf(1.45, _fin_h, 0.5) if bajo else 6.5,
		"yaw": _yaw_fin() - 3.0, "aim_y": lerpf(1.35, _fin_mira, 0.7) if bajo else 5.0,
		"fov": 39.0, "focus_x": p.x, "focus_z": p.z}


func _yaw_fin() -> float:
	return rad_to_deg(atan2(_eje.x, - _eje.z))























func _siembra_basura() -> void:
	if stadium == null:
		return
	var tex: Texture2D = stadium._litter_texture()
	if tex == null:
		return
	for i in BASURA_N:
		var s: Sprite3D = Sprite3D.new()
		s.texture = tex
		s.pixel_size = 0.26 / 10.0
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.shaded = true
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var p: Vector3 = _sobre_eje(
			rng.randf_range(BASURA_DESDE, BASURA_HASTA),
			rng.randf_range(- BASURA_LADO, BASURA_LADO))
		s.position = Vector3(p.x, BASURA_Y, p.z)
		s.rotation = Vector3(- PI * 0.5, rng.randf_range(0.0, TAU), 0.0)
		viewport.add_child(s)















func _planta_persona() -> void:
	_actor = make_player(KitRecolor.casual_of(GameState.team_custom), "north")
	var p: Vector3 = _sobre_eje(D_PERSONA, LADO_PERSONA)
	_actor.position = Vector3(p.x,
		feet_offset(_actor.pixel_size) - PLAYER_SINK, p.z)


















func _pinta_marcador(local: Dictionary, visita: Dictionary) -> void:
	if stadium == null:
		return
	stadium.set_scoreboard_rival(String(_rival_team().get("abbrev", "RIV")))
	if stadium._sb_crest_l != null and stadium._sb_crest_r != null:
		stadium._sb_crest_l.set_team(local)
		stadium._sb_crest_r.set_team(visita)







	var ab_l: String = String(local.get("abbrev", "TU"))
	var ab_r: String = String(visita.get("abbrev", "RIV"))
	stadium._sb_left = ab_l
	stadium._sb_right = ab_r
	stadium.set_scoreboard(int(data.get("gf", 0)), int(data.get("ga", 0)))
