extends "res://ui/ceremonies/vuelta.gd"


































const FILA_Z: float = -1.62


const AL_LADO: float = 0.4

const ENTRA_DX: float = 2.0

const T_ANDA: float = 0.3
const T_LLEGA: float = 2.8
const T_DEJA: float = 3.3
const DEJA_DUR: float = 0.9
const T_LUZ: float = T_DEJA + DEJA_DUR
const LUZ_DUR: float = 0.5
const T_CHYRON_V: float = 0.6
const T_CARD_V: float = 5.6



const LUZ_HUECO: float = 1.6



var _tipo: String = ""
var _hueco: Vector3 = Vector3.ZERO
var _hueco_alto: float = 0.6
var _en_vitrina: Sprite3D = null
var _luz: OmniLight3D = null
var _llevada: CopaLlevada = null
var _dejada: bool = false


func _award() -> String:
	return String(data.get("award", "Campeón de Liga"))




func team() -> Dictionary:
	if bool((Ceremonies.TROPHIES.get(_award(), {}) as Dictionary).get("nation", false)):
		var nat: Dictionary = Nations.as_team(Career.nationality)
		if not nat.is_empty():
			return nat
	return super.team()


func _build() -> void:
	_tipo = String((Trophies.CATALOG.get(_award(), {}) as Dictionary).get("type", ""))
	_copas_tipos = _tipos()



	if not _tipo.is_empty() and not _copas_tipos.has(_tipo):
		if _copas_tipos.size() >= TROFEOS_MAX:
			_copas_tipos.pop_back()
		_copas_tipos.append(_tipo)
	_sala()
	_vitrina()
	_monta_luz()
	focus = Vector3(_foco_x(), 0.0, -1.9)
	make_camera(_keys(), 32.0)
	orbit_speed = DRIFT
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	look["number"] = shirt()
	make_player(look, "north")
	_pon_yo(Vector3(_sitio_x() + ENTRA_DX, 0.0, FILA_Z))
	_llevada = CopaLlevada.monta(self, player, _tipo if not _tipo.is_empty() else "liga")
	_ficha()




func _awards() -> Array:
	var out: Array = super._awards().duplicate()
	if not out.has(_award()):
		out.append(_award())
	return out




func _pon_copa(tipo: String, pos: Vector3, alto: float) -> Sprite3D:
	var c: Sprite3D = super._pon_copa(tipo, pos, alto)
	if tipo == _tipo and _en_vitrina == null:
		_en_vitrina = c
		_hueco = pos
		_hueco_alto = alto
		if c != null:
			c.visible = false
	return c


func _sitio_x() -> float:
	return _hueco.x + AL_LADO



func _foco_x() -> float:
	return clampf(_hueco.x * 0.6 + 0.2, -0.5, 0.6)





func _keys() -> Array:
	var fx: float = _foco_x()
	return [
		{"t": 0.0, "dist": 6.4, "h": 1.7, "yaw": 183.0, "aim_y": 1.2, "fov": 38.0,
			"focus_x": fx + 0.3, "focus_z": -1.7},
		{"t": T_DEJA, "dist": 5.3, "h": 1.62, "yaw": 181.0, "aim_y": 1.15, "fov": 34.0,
			"focus_x": fx + 0.1, "focus_z": -1.95},

		{"t": T_CARD_V, "dist": 7.4, "h": 1.9, "yaw": 183.0, "aim_y": 1.3, "fov": 38.0,
			"focus_x": fx * 0.5, "focus_z": -2.05},
	]



func _monta_luz() -> void:
	_luz = OmniLight3D.new()
	_luz.light_color = Color("ffdfa6")
	_luz.light_energy = 0.0
	_luz.omni_range = 0.9
	_luz.position = _hueco + Vector3(0.0, _hueco_alto * 0.3, 0.3)
	viewport.add_child(_luz)


func _pon_yo(at: Vector3) -> void:
	player.position = Vector3(at.x, feet_offset(player.pixel_size) - PLAYER_SINK, at.z)


func _tick(_delta: float) -> void:
	_copa_tick()
	if _luz != null:
		_luz.light_energy = LUZ_HUECO * clampf((t - T_LUZ) / LUZ_DUR, 0.0, 1.0)




func _copa_tick() -> void:
	if player == null:
		return
	var k: float = clampf((t - T_ANDA) /(T_LLEGA - T_ANDA), 0.0, 1.0)
	player.position.x = lerpf(_sitio_x() + ENTRA_DX, _sitio_x(), k)
	if _llevada == null:
		_asienta(t >= T_LUZ)
		return
	if t >= T_LUZ:
		_asienta(true)
	elif t >= T_DEJA:


		_llevada.deja(_hueco, _hueco_alto *(1.0 - 2.0 * COPA_PAD) / CopaLlevada.LIENZO_M,
			(t - T_DEJA) / DEJA_DUR)
	elif t >= T_ANDA and k < 1.0:
		_llevada.lleva(Vector3.LEFT)
	else:
		_llevada.lleva(Vector3.ZERO, Vector3.LEFT if k >= 1.0 else Vector3.ZERO)




func _asienta(si: bool) -> void:
	if not si or _dejada:
		return
	_dejada = true
	if _llevada != null:
		_llevada.copa.visible = false
		if _llevada.manos != null:
			_llevada.manos.visible = false
	if _en_vitrina != null:
		_en_vitrina.visible = true
	if player != null and player.sprite_frames.has_animation("idle"):
		player.play("idle")
	if not grabando() or t < card_at:
		sting("door_clack", -14.0)
		sting("fanfare", -12.0)


func _ficha() -> void:
	make_chyron(I18n.t("TU VITRINA"), CareerTheme.caps(Career.player_name), team(),
		T_CHYRON_V)
	make_card(T_CARD_V)
	card_title(Competitions.demarca(I18n.t(JuegosOlimpicos.pinta(_award()))).to_upper(), 40)
	card_sub(I18n.t("YA ESTÁ EN SU HUECO"), _accent_for())
	card_count(_veces(), I18n.t("EN TU VITRINA"))
	card_cta(I18n.t("SEGUIR"))



func _veces() -> int:
	var n: int = 0
	for a in _awards():
		if String(a) == _award():
			n += 1
	return maxi(n, 1)



func _skipped() -> void:
	pass




func _armar_auto_seguir() -> void:
	if _auto_tw != null and _auto_tw.is_valid():
		_auto_tw.kill()
	_auto_tw = create_tween()
	_auto_tw.tween_interval(AUTO_SEGUIR)
	_auto_tw.tween_callback(_leave)


func _on_skip() -> void:
	if t >= card_at and not grabando():
		_leave()
		return
	super._on_skip()



func _recuerdo() -> Dictionary:
	var out: Dictionary = data.duplicate(true)
	out["award"] = _award()
	out["awards"] = _awards().duplicate(true)
	return out
