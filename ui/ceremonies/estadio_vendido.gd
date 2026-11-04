extends "res://ui/ceremonies/stadium_name.gd"

















const V_ATT: float = 0.62

const V_BOO: float = 7.0

const V_CARD: float = 9.4


const V_ABRE_T: float = 7.6






const P_TELA: Color = Color("e6e1d4")
const P_ANCHO: float = 13.0


const P_ALTURA: float = 0.52
const P_AVANCE: float = 1.35

var _silbando: bool = false




func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:
	var club: Dictionary = team()
	var nombre: String = String(data.get("stadium", ""))
	var grito: String = CareerTheme.caps(I18n.t("NO SE VENDE"))



	make_stadium({
		"div": div(),
		"attendance": V_ATT,
		"party": false,
		"weather": "overcast",
		"kit": GameState.kit_variant(club, 0),
		"banner": grito,
		"board": board_fit(nombre),
		"home_club": club_del_acto(),
		"comp": "liga",
	})
	focus = Vector3(0.0, 0.0, CENTER_Z)
	var rotulo: MeshInstance3D = _rotulo_a_desvelar()
	_con_rotulo = rotulo != null
	if _con_rotulo:
		_ilumina(rotulo)
		_build_lona_del_club(rotulo)
		_build_pancarta(rotulo, grito)
		make_camera(_keys_vendido(rotulo))
	else:
		make_camera(KEYS_SIN_ROTULO.slice(0, 2))
	orbit_speed = DRIFT * 0.5
	make_audio(V_ATT, false)
	stadium.crowd_excite(0.3)


	flash_rate = 0.0
	flash_burst_at = -1.0
	_burst2_puesta = true
	if not _con_rotulo:
		_silbar()

	make_chyron(I18n.t("EL ESTADIO SE VENDE"), String(club.get("name", "?")).to_upper(),
		club, T_REVEAL + 0.7 if _con_rotulo else 0.8)
	make_card(V_CARD if _con_rotulo else T_CARD_CORTO)
	card_title(nombre.to_upper(), 40)
	card_sub(I18n.t("ASÍ SE LLAMA DESDE HOY"), CareerTheme.DANGER)
	var pago: int = int(data.get("pago", 0))
	var fila: HBoxContainer = card_stats([
		{"v": CareerUi.short_money(pago), "k": I18n.t("cobra el club"), "c": CareerTheme.MONEY},
		{"v": str(int(data.get("temporadas", NombreComercial.TEMPORADAS))),
			"k": I18n.t("temporadas"), "c": CareerTheme.TEXT},
	])
	fila.name = "CifrasVenta"
	card_note(I18n.t("La crisis aprieta y el club vende el nombre del campo. La grada no lo perdona: este año entra menos gente y en el muro cuelga una pancarta."))
	card_cta(I18n.t("SEGUIR"))




func _build_lona_del_club(rotulo: MeshInstance3D) -> void:
	var rojo: Color = accent
	accent = CareerTheme.accent_of(team())
	_build_lona(rotulo)
	accent = rojo




func _build_pancarta(rotulo: MeshInstance3D, grito: String) -> void:
	var texto: String = grito.to_upper()
	var px: int = 2
	var tw: int = PixelText.text_width(texto, px)
	var iw: int = tw + 10
	var ih: int = PixelText.GLYPH_H * px + 8
	var img: Image = Image.create(iw, ih, false, Image.FORMAT_RGBA8)
	img.fill(P_TELA)
	for x in iw:
		img.set_pixel(x, 0, P_TELA.darkened(0.6))
		img.set_pixel(x, ih - 1, P_TELA.darkened(0.6))
	for y in ih:
		img.set_pixel(0, y, P_TELA.darkened(0.6))
		img.set_pixel(iw - 1, y, P_TELA.darkened(0.6))
	PixelText.draw_text(img, 5 + 1, 4 + 1, texto, P_TELA.darkened(0.35), px)
	PixelText.draw_text(img, 5, 4, texto, accent.darkened(0.15), px)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	var tela: MeshInstance3D = MeshInstance3D.new()
	tela.name = "PancartaProtesta"
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(P_ANCHO, P_ANCHO * float(ih) / float(iw))
	tela.mesh = q
	tela.material_override = mat
	tela.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(tela)
	var c: Vector3 = rotulo.global_position
	var f: Vector3 = _cara(rotulo)
	var baja: float = c.y *(1.0 - P_ALTURA)
	tela.global_transform = rotulo.global_transform
	tela.global_position = Vector3(c.x, c.y - baja, c.z) + f *(baja * P_AVANCE)




func _keys_vendido(rotulo: MeshInstance3D) -> Array:
	var keys: Array = _keys_for(rotulo).slice(0, 3)
	var c: Vector3 = rotulo.global_position
	var f: Vector3 = _cara(rotulo)
	var yaw: float = rad_to_deg(atan2(f.x, - f.z))
	keys.append({"t": V_ABRE_T, "dist": D_SIGN * 1.25, "h": maxf(c.y * 0.7, 6.0),
		"yaw": yaw + 14.0, "aim_y": maxf(c.y - 9.0, 2.0), "fov": 50.0,
		"focus_x": c.x, "focus_z": c.z})
	return keys


func _tick(delta: float) -> void:
	super._tick(delta)


	if _con_rotulo and not _silbando and t >= T_REVEAL:
		_silbar()


func _silbar() -> void:
	_silbando = true
	stadium.crowd_boo(V_BOO)
	if audio != null:
		audio.boo(V_BOO)
