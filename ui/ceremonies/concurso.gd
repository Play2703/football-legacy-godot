extends "res://ui/ceremonies/sala_juntas.gd"



















const C_CARTON: Color = Color("a8865a")



const C_CAJA: Vector3 = Vector3(0.4, 0.26, 0.3)
const C_CAJAS: Array = [
	[-1.68, -0.62, 0], [-1.68, -0.62, 1], [-0.92, -0.5, 0],
	[0.86, -0.64, 0], [1.62, -0.48, 0], [1.62, -0.48, 1],
]



func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:


	focus = Vector3.ZERO
	var wall: Color = _wall_color()
	_build_sala(wall)
	_build_crest(_ink_color(wall))
	_build_mesa(wall)
	_build_cajas()
	_build_sillones()
	_build_administrador()
	_build_tu()
	_camara_junta()
	orbit_speed = DRIFT
	make_card(J_CARD)
	_ficha_concurso()
	card_cta(I18n.t("SEGUIR"))






func _build_cajas() -> void:
	var cuerpo: StandardMaterial3D = _flat(C_CARTON)
	var tapa: StandardMaterial3D = _flat(C_CARTON.lightened(0.18))
	for c in C_CAJAS:
		var x: float = float((c as Array)[0])
		var z: float = float((c as Array)[1])
		var y: float = DESK_H + C_CAJA.y * float(int((c as Array)[2]))
		_slab(Vector3(C_CAJA.x, C_CAJA.y - 0.03, C_CAJA.z),
			Vector3(x, y +(C_CAJA.y - 0.03) * 0.5, z), cuerpo)
		_slab(Vector3(C_CAJA.x + 0.02, 0.03, C_CAJA.z + 0.02),
			Vector3(x, y + C_CAJA.y - 0.015, z), tapa)







func _build_administrador() -> void:
	var cara: Dictionary = Coach.look_de("administrador_%s" % String(team().get("id", "")))
	_seat(player_frames(cara, "south", BOSS_SHEET, true), 0.0)






func _ficha_concurso() -> void:
	make_chyron(I18n.t("CONCURSO DE ACREEDORES"), team_name().to_upper(), team(), J_CHYRON)
	card_title(I18n.t("EN CONCURSO"), 40)
	card_sub(I18n.t("LO LLEVA UN ADMINISTRADOR"), CareerTheme.DANGER)
	card_count(0, I18n.t("FICHAJES ESTE VERANO"))
	var stats: Array = [
		{"v": _dinero(int(data.get("caja", 0))), "k": I18n.t("la caja"), "c": CareerTheme.DANGER},
		{"v": _dinero(int(data.get("ingreso", 0))), "k": I18n.t("ingreso"), "c": CareerTheme.MONEY},
	]


	if data.has("acciones"):
		stats.append({"v": _dinero(- int(data["acciones"])), "k": I18n.t("tus acciones"),
			"c": CareerTheme.DANGER})
	card_stats(stats)


	var casero: String = str(data.get("prestado", ""))
	if not casero.is_empty():
		var marca: String = Career.naming_de(casero)
		var estadio: String = marca if not marca.is_empty() else Stadiums.of(Teams.by_id(casero))
		card_note(I18n.tf("El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Y el estadio queda embargado: esta temporada jugáis de local en {0}, el campo del {1}.",
			[estadio, Nations.team_label(Teams.by_id(casero))]))
		return
	card_note(I18n.t("El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Lo que se pueda vender, se vende."))
