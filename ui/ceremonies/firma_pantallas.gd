extends "res://ui/ceremonies/pantallas.gd"


















const FirmaCola := preload("res://ui/ceremonies/firma_cola.gd")


const FP_SUELO: float = 0.02


const FP_MESA: Vector3 = Vector3(-0.1, 0.0, -12.0)
const FP_MESA_TAM: Vector3 = Vector3(1.4, 0.74, 0.6)
const FP_TU: Vector3 = Vector3(-0.1, 0.0, FP_MESA.z - FP_MESA_TAM.z * 0.5 - 0.12)
const FP_PUESTO: Vector3 = Vector3(-0.8, 0.0, FP_MESA.z + 0.75)

const FP_COLA_0: Vector3 = Vector3(-1.35, 0.0, FP_MESA.z + 0.85)
const FP_COLA_PASO: Vector3 = Vector3(-0.56, 0.0, 0.02)
const FP_EXTRA: int = 2
const FP_SALIDA: Array = [Vector3(-1.0, 0.0, FP_MESA.z + 0.2)]


const FP_HECHOS: Array = [
	Vector3(-3.4, 0.0, FP_MESA.z - 0.65), Vector3(-2.9, 0.0, FP_MESA.z - 0.65),
	Vector3(-2.4, 0.0, FP_MESA.z - 0.65), Vector3(-1.9, 0.0, FP_MESA.z - 0.65),
	Vector3(-3.15, 0.0, FP_MESA.z - 0.15), Vector3(-2.65, 0.0, FP_MESA.z - 0.15),
	Vector3(-2.15, 0.0, FP_MESA.z - 0.15),
	Vector3(-3.4, 0.0, FP_MESA.z + 0.35), Vector3(-2.9, 0.0, FP_MESA.z + 0.35),
	Vector3(-2.4, 0.0, FP_MESA.z + 0.35),
]


const FP_GENTE_DETRAS_Z: float = FP_MESA.z - 2.4

const FP_FOTO_M: float = 0.24
const FP_EMPIEZA: float = 1.6




const FP_APERTURA: Dictionary = {"t": 0.0, "dist": 13.5, "h": 2.2, "yaw": 184.0,
	"aim_y": 6.5, "fov": 62.0, "focus_x": -1.4, "focus_z": FP_MESA.z - 0.5}

var _cola: FirmaCola = FirmaCola.new()

var _foto: Texture2D = null
var _vp_cuadro: int = 0


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["lone_shout", "ui_whoosh", "rotulador_loop"])


func _build() -> void:
	_r.seed = hash("pantallas_" + _marca())
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	focus = Vector3(-0.5, 0.0, FP_MESA.z + 0.5)
	_mundo()
	_suelo()
	_escalinata()
	_edificios()
	_catalogo()
	_campanas()
	_pantallas_de_la_plaza()
	_torre()
	_calle()
	_taxis_de_la_calle()
	_gente(kit)
	_paseantes_de_la_plaza()


	_golpe = true
	for p in _pantallas:
		_cambia(p)
		p["flash"] = -1.0
		(p["mat"] as StandardMaterial3D).albedo_color = Color(BRILLO, BRILLO, BRILLO)
	_despeja_la_plaza()
	for m in _moviles:
		m.visible = true
	_foto = _campana.get(ALTA, null)
	_vp_cuadro = Engine.get_process_frames()
	make_camera([FP_APERTURA, _fp_cerca(FP_EMPIEZA + 0.9, 0.0)], 58.0)
	orbit_speed = 0.0
	make_audio(0.0, false)
	var ropa: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(ropa, "south")
	_cola.arma(self, {
		"mesa": {"centro": FP_MESA, "tam": FP_MESA_TAM, "color": Sponsors.color_of(_marca()),
			"franja": Color(0.97, 0.96, 0.93)},
		"tu": FP_TU, "puesto": FP_PUESTO, "cola_0": FP_COLA_0, "cola_paso": FP_COLA_PASO,
		"hechos": FP_HECHOS, "salida": FP_SALIDA,
		"pieza": _foto, "pieza_m": FP_FOTO_M,
		"base": _imagen_foto, "fondo": Sponsors.color_of(_marca()),


		"zona": Rect2(0.05, 0.02, 0.9, 0.44),
		"titulo": I18n.t("FIRMA LA FOTO"),
		"cerca": _fp_cerca, "final": _fp_final,
		"t_empieza": FP_EMPIEZA, "suelo": FP_SUELO,
		"semilla": "%s|%s" % [_marca(), str(data.get("seed", ""))],
		"kit": kit, "extra": FP_EXTRA,
		"montaje": {"marca": _marca(), "nombre": _nombre_marca()},
	})

	make_chyron(I18n.t("FIRMA DE AUTÓGRAFOS"), _nombre_marca(), {}, 0.5)

	make_card(60.0)
	if _card_tw != null and _card_tw.is_valid():
		_card_tw.kill()
	card_title(I18n.t("FIRMAS EN LA PLAZA"), 40)
	card_sub(_nombre_marca(), Sponsors.color_of(_marca()))
	card_count(FirmaCola.N_FIRMAS, I18n.t("AUTÓGRAFOS FIRMADOS"))
	card_note(I18n.t("Diez fotos firmadas. Ésas brillan más que las pantallas."))
	card_cta(I18n.t("SEGUIR"))





func _despeja_la_plaza() -> void:
	var fans: Array[AnimatedSprite3D] = []
	var ys: Array[float] = []
	var saltos: Array[float] = []
	var ritmos: Array[float] = []
	for i in _fans.size():
		var s: AnimatedSprite3D = _fans[i]
		if s.position.z > FP_GENTE_DETRAS_Z and s.position.z < 3.0:
			s.queue_free()
			continue
		fans.append(s)
		ys.append(_fans_y[i])
		saltos.append(_fans_salto[i])
		ritmos.append(_fans_ritmo[i])
	_fans = fans
	_fans_y = ys
	_fans_salto = saltos
	_fans_ritmo = ritmos
	var moviles: Array[MeshInstance3D] = []
	for m in _moviles:
		if not (m.get_parent() as AnimatedSprite3D).is_queued_for_deletion():
			moviles.append(m)
	_moviles = moviles





func _fp_cerca(tk: float, empuje: float) -> Dictionary:
	return {"t": tk, "dist": lerpf(5.2, 4.7, empuje), "h": lerpf(1.9, 1.8, empuje),
		"yaw": lerpf(172.0, 179.0, empuje), "aim_y": 1.0, "fov": 46.0,
		"focus_x": -0.45, "focus_z": FP_MESA.z + 0.25}




func _fp_final(tk: float) -> Dictionary:
	return {"t": tk, "dist": 11.0, "h": 2.0, "yaw": 182.0, "aim_y": 4.2, "fov": 60.0,
		"focus_x": -1.3, "focus_z": FP_MESA.z - 0.4}





func _imagen_foto() -> Image:
	if DisplayServer.get_name() == "headless" or _foto == null \
			or Engine.get_process_frames() - _vp_cuadro < 3:
		return null
	return _foto.get_image()


func _tick(delta: float) -> void:
	_vive_la_plaza(delta)
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
		out.append_array(FirmaCola.zonas_lienzo(vp, Vector2(160, 320), I18n.t("FIRMA LA FOTO")))
	return out
