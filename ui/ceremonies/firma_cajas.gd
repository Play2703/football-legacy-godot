extends "res://ui/ceremonies/cajas.gd"






















const FirmaCola := preload("res://ui/ceremonies/firma_cola.gd")



const FS_MESA: Vector3 = Vector3(1.0, 0.0, 1.05)
const FS_MESA_TAM: Vector3 = Vector3(1.4, 0.74, 0.6)


const FS_TU: Vector3 = Vector3(1.0, 0.0, FS_MESA.z - FS_MESA_TAM.z * 0.5 - 0.12)
const FS_PUESTO: Vector3 = Vector3(0.4, 0.0, 1.8)


const FS_COLA: Array = [
	Vector3(-0.08, 0.0, 1.98), Vector3(-0.6, 0.0, 1.98), Vector3(-1.12, 0.0, 1.98),
	Vector3(-1.64, 0.0, 1.98),
	Vector3(-1.64, 0.0, 2.56), Vector3(-1.12, 0.0, 2.56), Vector3(-0.6, 0.0, 2.56),
	Vector3(-0.08, 0.0, 2.56),
	Vector3(-0.08, 0.0, 3.14), Vector3(-0.6, 0.0, 3.14), Vector3(-1.12, 0.0, 3.14),
	Vector3(-1.64, 0.0, 3.14),
]
const FS_EXTRA: int = 2



const FS_CINTAS: Array = [[0.2, -1.32, 2.27], [-1.92, -0.4, 2.85], [0.2, -1.32, 3.43]]
const FS_CINTA_DCHA: Array = [0.2, 2.27, 3.43]
const FS_CINTA_Y: float = 0.88

const FS_SALIDA: Array = [Vector3(0.05, 0.0, 1.42)]



const FS_HECHOS: Array = [
	Vector3(-1.7, 0.0, -0.25), Vector3(-1.25, 0.0, -0.25), Vector3(-0.8, 0.0, -0.25),
	Vector3(-0.35, 0.0, -0.25),
	Vector3(-1.5, 0.0, 0.35), Vector3(-1.05, 0.0, 0.35), Vector3(-0.6, 0.0, 0.35),
	Vector3(-1.7, 0.0, 0.95), Vector3(-1.25, 0.0, 0.95), Vector3(-0.8, 0.0, 0.95),
]


const FS_CAJA_M: float = 0.26
const FS_EMPIEZA: float = 1.6



const FS_APERTURA: Dictionary = {"t": 0.0, "dist": 8.6, "h": 2.9, "yaw": 184.0,
	"aim_y": 1.0, "fov": 50.0, "focus_x": 0.0, "focus_z": 1.6}

var _cola: FirmaCola = FirmaCola.new()

var _vp_firma: SubViewport = null
var _vp_cuadro: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh", "rotulador_loop"])


func _build() -> void:
	_r.seed = hash("pasillo_" + _marca())
	focus = Vector3(0.0, 0.0, 1.0)
	_mundo()
	_suelo()
	for s: float in [-1.0, 1.0]:
		_lineal(s)
	_build_cajas_tuyas()



	_r.randf_range(0.85, 1.1)
	_r.randf_range(0.85, 1.1)
	_detalle()
	_vp_firma = _caja_vp_nueva(2)
	_vp_cuadro = Engine.get_process_frames()
	make_camera([FS_APERTURA, _fs_cerca(FS_EMPIEZA + 0.9, 0.0)], 50.0)
	orbit_speed = 0.0
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	_cola.arma(self, {
		"mesa": {"centro": FS_MESA, "tam": FS_MESA_TAM, "color": Sponsors.color_of(_marca()),
			"franja": Color(0.97, 0.96, 0.93)},
		"tu": FS_TU, "puesto": FS_PUESTO, "cola": FS_COLA,
		"hechos": FS_HECHOS, "salida": FS_SALIDA,
		"pieza": _vp_firma.get_texture(), "pieza_m": FS_CAJA_M,
		"base": _imagen_caja, "fondo": Sponsors.color_of(_marca()),

		"zona": Rect2(0.04, 0.22, 0.92, 0.72),
		"titulo": I18n.t("FIRMA LA CAJA"),
		"cerca": _fs_cerca, "final": _fs_final,
		"t_empieza": FS_EMPIEZA,
		"semilla": "%s|%s" % [_marca(), str(data.get("seed", ""))],
		"kit": GameState.kit_variant(team(), 0), "extra": FS_EXTRA,
	})
	_serpentina()

	make_chyron(I18n.t("FIRMA DE AUTÓGRAFOS"), _nombre_marca(), {}, 0.5)

	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("FIRMAS EN EL SÚPER"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	card_count(FirmaCola.N_FIRMAS, I18n.t("AUTÓGRAFOS FIRMADOS"))
	card_note(I18n.t("Diez cajas firmadas. Ésas no se las come nadie."))
	card_cta(I18n.t("SEGUIR"))




func _serpentina() -> void:
	var col: Color = Sponsors.color_of(_marca())
	var postes: Array[Vector2] = []
	for cinta in FS_CINTAS:
		var x0: float = float(cinta[0])
		var x1: float = float(cinta[1])
		var z: float = float(cinta[2])
		_caja(Vector3((x0 + x1) * 0.5, FS_CINTA_Y, z), Vector3(absf(x1 - x0), 0.05, 0.012), col)
		postes.append(Vector2(x0, z))
		postes.append(Vector2(x1, z))
	var d: Array = FS_CINTA_DCHA
	_caja(Vector3(float(d[0]), FS_CINTA_Y,(float(d[1]) + float(d[2])) * 0.5),
		Vector3(0.012, 0.05, float(d[2]) - float(d[1])), col)
	for p in postes:
		_poste(Vector3(p.x, 0.0, p.y))


func _poste(pie: Vector3) -> void:
	_cilindro(pie + Vector3(0.0, 0.015, 0.0), 0.15, 0.16, 0.03, Color("6e737a"))
	_cilindro(pie + Vector3(0.0, 0.47, 0.0), 0.028, 0.028, 0.92, Color("b8bdc4"))
	_cilindro(pie + Vector3(0.0, 0.95, 0.0), 0.04, 0.04, 0.05, Color("8a8f96"))








func _fs_cerca(tk: float, empuje: float) -> Dictionary:
	return {"t": tk, "dist": lerpf(7.6, 7.0, empuje), "h": lerpf(2.6, 2.5, empuje),
		"yaw": lerpf(174.0, 178.0, empuje), "aim_y": 1.0, "fov": 34.0,
		"focus_x": 0.5, "focus_z": 1.25}




func _fs_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 7.6, "h": 2.8, "yaw": 182.0, "aim_y": 1.0, "fov": 50.0,
		"focus_x": -0.2, "focus_z": 0.9}





func _imagen_caja() -> Image:
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
		out.append_array(FirmaCola.zonas_lienzo(vp, Vector2(CAJA_PX * 2), I18n.t("FIRMA LA CAJA")))
	return out
