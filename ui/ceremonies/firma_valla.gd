extends "res://ui/ceremonies/ciudad.gd"















const FirmaCola := preload("res://ui/ceremonies/firma_cola.gd")



const FV_MESA: Vector3 = Vector3(-0.1, 0.0, 5.55)
const FV_MESA_TAM: Vector3 = Vector3(1.4, 0.74, 0.6)
const FV_TU: Vector3 = Vector3(-0.1, 0.0, FV_MESA.z - FV_MESA_TAM.z * 0.5 - 0.12)
const FV_PUESTO: Vector3 = Vector3(-0.8, 0.0, 6.3)

const FV_COLA_0: Vector3 = Vector3(-1.35, 0.0, 6.4)
const FV_COLA_PASO: Vector3 = Vector3(-0.56, 0.0, 0.02)
const FV_EXTRA: int = 2
const FV_SALIDA: Array = [Vector3(-1.0, 0.0, 5.75)]


const FV_HECHOS: Array = [
	Vector3(-3.4, 0.0, 4.6), Vector3(-2.9, 0.0, 4.6), Vector3(-2.4, 0.0, 4.6),
	Vector3(-1.9, 0.0, 4.6),
	Vector3(-3.15, 0.0, 5.1), Vector3(-2.65, 0.0, 5.1), Vector3(-2.15, 0.0, 5.1),
	Vector3(-3.4, 0.0, 5.6), Vector3(-2.9, 0.0, 5.6), Vector3(-2.4, 0.0, 5.6),
]


const FV_POSTER_M: float = 0.5
const FV_EMPIEZA: float = 1.6




const FV_APERTURA: Dictionary = {"t": 0.0, "dist": 11.0, "h": 1.2, "yaw": 186.0,
	"aim_y": 4.6, "fov": 58.0, "focus_x": -1.2, "focus_z": 5.4}

var _cola: FirmaCola = FirmaCola.new()

var _poster: Texture2D = null
var _vp_cuadro: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh", "rotulador_loop"])


func _build() -> void:

	_r.seed = hash("ciudad_" + VALLA)
	focus = Vector3(-0.5, 0.0, 5.5)
	_mundo(false)
	_calle(false)
	_manzana()
	_calle_viva()
	_valla()

	_golpe = true
	_enciende_focos()
	if _valla_mat != null:
		_valla_mat.albedo_color = Color.WHITE
		_poster = _valla_mat.albedo_texture


	var brillo: OmniLight3D = OmniLight3D.new()
	brillo.light_color = Color(1.0, 1.0, 1.0).lerp(Sponsors.color_of(_marca()), 0.25)
	brillo.light_energy = 1.1
	brillo.omni_range = 9.0
	brillo.position = Vector3(0.0, VALLA_Y - VALLA_H * 0.5 - 1.0, FACHADA_Z + 2.0)
	viewport.add_child(brillo)
	_vp_cuadro = Engine.get_process_frames()
	make_camera([FV_APERTURA, _fv_cerca(FV_EMPIEZA + 0.9, 0.0)], 50.0)
	orbit_speed = 0.0
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	_cola.arma(self, {
		"mesa": {"centro": FV_MESA, "tam": FV_MESA_TAM, "color": Sponsors.color_of(_marca()),
			"franja": Color(0.97, 0.96, 0.93)},
		"tu": FV_TU, "puesto": FV_PUESTO, "cola_0": FV_COLA_0, "cola_paso": FV_COLA_PASO,
		"hechos": FV_HECHOS, "salida": FV_SALIDA,
		"pieza": _poster, "pieza_m": FV_POSTER_M,
		"base": _imagen_poster, "fondo": Sponsors.color_of(_marca()),


		"zona": Rect2(0.03, 0.05, 0.6, 0.9),
		"titulo": I18n.t("FIRMA EL PÓSTER"),
		"cerca": _fv_cerca, "final": _fv_final,
		"t_empieza": FV_EMPIEZA, "suelo": ACERA_Y,
		"semilla": "%s|%s" % [_marca(), str(data.get("seed", ""))],
		"kit": GameState.kit_variant(team(), 0), "extra": FV_EXTRA,
		"montaje": {"marca": _marca(), "nombre": _nombre_marca()},
	})

	make_chyron(I18n.t("FIRMA DE AUTÓGRAFOS"), _nombre_marca(), {}, 0.5)

	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("FIRMAS BAJO LA VALLA"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	card_count(FirmaCola.N_FIRMAS, I18n.t("AUTÓGRAFOS FIRMADOS"))
	card_note(I18n.t("Diez pósters firmados. Ésos acaban enmarcados."))
	card_cta(I18n.t("SEGUIR"))





func _fv_cerca(tk: float, empuje: float) -> Dictionary:
	return {"t": tk, "dist": lerpf(5.2, 4.7, empuje), "h": lerpf(1.9, 1.8, empuje),
		"yaw": lerpf(172.0, 179.0, empuje), "aim_y": 1.0, "fov": 46.0,
		"focus_x": -0.45, "focus_z": 5.8}




func _fv_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 10.5, "h": 1.3, "yaw": 182.0, "aim_y": 4.0, "fov": 58.0,
		"focus_x": -1.3, "focus_z": 5.4}





func _imagen_poster() -> Image:
	if DisplayServer.get_name() == "headless" or _poster == null \
			or Engine.get_process_frames() - _vp_cuadro < 3:
		return null
	return _poster.get_image()


func _tick(delta: float) -> void:
	_cola.tick(delta)


func _on_skip() -> void:
	if _cola.salta():
		return
	super._on_skip()


func _skipped() -> void:
	_cola.al_saltar()


func _vigia_ficha() -> void:
	if _leaving or ficha_puesta:
		return
	if _cola.retiene_ficha():
		SceneFade.timer(5.0, true, false, true).timeout.connect(_vigia_ficha)
		return
	super._vigia_ficha()


func zonas_sello() -> Array[Rect2]:
	var out: Array[Rect2] = super()
	var vp: Viewport = get_viewport()
	if vp != null:
		out.append_array(FirmaCola.zonas_lienzo(vp, Vector2(VALLA_PX), I18n.t("FIRMA EL PÓSTER")))
	return out
