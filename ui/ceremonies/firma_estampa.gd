extends "res://ui/ceremonies/estampa.gd"



















const FirmaCola := preload("res://ui/ceremonies/firma_cola.gd")



const FS_MESA: Vector3 = Vector3(-0.1, 0.0, 5.55)
const FS_MESA_TAM: Vector3 = Vector3(1.4, 0.74, 0.6)


const FS_TU: Vector3 = Vector3(-0.1, 0.0, FS_MESA.z - FS_MESA_TAM.z * 0.5 - 0.12)
const FS_PUESTO: Vector3 = Vector3(-0.8, 0.0, 6.3)


const FS_COLA_0: Vector3 = Vector3(-1.35, 0.0, 6.4)
const FS_COLA_PASO: Vector3 = Vector3(-0.56, 0.0, 0.02)
const FS_EXTRA: int = 2

const FS_SALIDA: Array = [Vector3(-1.0, 0.0, 5.75)]



const FS_HECHOS: Array = [
	Vector3(-3.4, 0.0, 4.9), Vector3(-2.9, 0.0, 4.9), Vector3(-2.4, 0.0, 4.9),
	Vector3(-1.9, 0.0, 4.9),
	Vector3(-3.15, 0.0, 5.4), Vector3(-2.65, 0.0, 5.4), Vector3(-2.15, 0.0, 5.4),
	Vector3(-3.4, 0.0, 5.9), Vector3(-2.9, 0.0, 5.9), Vector3(-2.4, 0.0, 5.9),
]


const FS_CROMO_M: float = 0.22
const FS_EMPIEZA: float = 1.6



const FS_APERTURA: Dictionary = {"t": 0.0, "dist": 9.5, "h": 2.0, "yaw": 168.0,
	"aim_y": 1.2, "fov": 50.0, "focus_x": -2.2, "focus_z": 5.9}

var _cola: FirmaCola = FirmaCola.new()

var _vp_firma: SubViewport = null
var _vp_cuadro: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh", "rotulador_loop"])


func _build() -> void:
	_r.seed = hash("estampa_" + _marca())
	focus = Vector3(-0.5, 0.0, 5.5)
	_mundo()
	_calle()
	_barrio()
	_banco()


	_detalle()
	_vp_firma = _cromo_vp_nuevo(2)
	_vp_cuadro = Engine.get_process_frames()
	make_camera([FS_APERTURA, _fs_cerca(FS_EMPIEZA + 0.9, 0.0)], 50.0)
	orbit_speed = 0.0
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	_cola.arma(self, {
		"mesa": {"centro": FS_MESA, "tam": FS_MESA_TAM, "color": Sponsors.color_of(_marca()),
			"franja": Color(0.97, 0.96, 0.93)},
		"tu": FS_TU, "puesto": FS_PUESTO, "cola_0": FS_COLA_0, "cola_paso": FS_COLA_PASO,
		"hechos": FS_HECHOS, "salida": FS_SALIDA,
		"pieza": _vp_firma.get_texture(), "pieza_m": FS_CROMO_M,
		"base": _imagen_cromo, "fondo": Sponsors.color_of(_marca()),

		"zona": Rect2(0.06, 0.04, 0.88, 0.78),
		"titulo": I18n.t("FIRMA EL CROMO"),
		"cerca": _fs_cerca, "final": _fs_final,
		"t_empieza": FS_EMPIEZA, "suelo": ACERA_Y,
		"semilla": "%s|%s" % [_marca(), str(data.get("seed", ""))],
		"kit": GameState.kit_variant(team(), 0), "extra": FS_EXTRA,
	})

	make_chyron(I18n.t("FIRMA DE AUTÓGRAFOS"), _nombre_marca(), {}, 0.5)

	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("FIRMAS EN EL BARRIO"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	card_count(FirmaCola.N_FIRMAS, I18n.t("AUTÓGRAFOS FIRMADOS"))
	card_note(I18n.t("Diez cromos firmados. Ésos ya no se cambian."))
	card_cta(I18n.t("SEGUIR"))





func _fs_cerca(tk: float, empuje: float) -> Dictionary:
	return {"t": tk, "dist": lerpf(5.2, 4.7, empuje), "h": lerpf(1.9, 1.8, empuje),
		"yaw": lerpf(172.0, 179.0, empuje), "aim_y": 1.0, "fov": 46.0,
		"focus_x": -0.45, "focus_z": 5.8}




func _fs_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 8.4, "h": 2.4, "yaw": 178.0, "aim_y": 1.0, "fov": 50.0,
		"focus_x": -1.3, "focus_z": 5.6}





func _imagen_cromo() -> Image:
	if DisplayServer.get_name() == "headless" or _vp_firma == null \
			or Engine.get_process_frames() - _vp_cuadro < 3:
		return null
	return _vp_firma.get_texture().get_image()


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
		out.append_array(FirmaCola.zonas_lienzo(vp, Vector2(CROMO_PX * 2), I18n.t("FIRMA EL CROMO")))
	return out
