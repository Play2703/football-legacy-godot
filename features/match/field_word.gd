class_name FieldWord
extends Node3D








































const ALTO_PX: float = 38.0








const DIST_M: float = 12.0







const DIST_MIN: float = 4.0
const DIST_MAX: float = 16.0















const DIST_MAX_FONDO: float = 28.0











const LADOS_M: Array[float] = [0.0, -7.0, 7.0]
const PASOS: int = 13



const Y_OBJETIVO: float = 0.68


const ALTURA: float = 0.045
const FADE_IN: float = 0.35
const FADE_OUT: float = 0.5










const ARO_PX_REF: float = 220.0 * 1.311
const REF_H: float = 1920.0






const ARO_AIRE_PX: float = 110.0










const META_AIRE_Y_PX: float = 90.0
const META_AIRE_X_PX: float = 320.0




var solo_centro: bool = false
var _quad: MeshInstance3D = null
var _mat: StandardMaterial3D = null
var _tw: Tween = null





func pinta(cam: Camera3D, pies: Vector3, texto: String,
		evitar: Vector3 = Vector3.INF) -> bool:
	if cam == null or texto.strip_edges().is_empty():
		return false
	var txt: String = PixelText.normalize(texto)
	if txt.strip_edges().is_empty():
		return false
	limpia()




	var w: int = PixelText.text_width(txt, 1)
	var img: Image = Image.create(w + 2, 9, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	for d in [Vector2i(0, 1), Vector2i(2, 1), Vector2i(1, 0), Vector2i(1, 2)]:
		PixelText.draw_text(img, d.x, d.y, txt, CareerTheme.INK_DARK, 1)
	PixelText.draw_text(img, 1, 1, txt, CareerTheme.INK_LIGHT, 1)

	_mat = StandardMaterial3D.new()
	_mat.albedo_texture = ImageTexture.create_from_image(img)
	_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED

	_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	_mat.albedo_color = Color(1, 1, 1, 0)






	var media_px: float =(ALTO_PX / 7.0) * float(img.get_width()) * 0.5
	var p: Vector3 = _punto(cam, pies, evitar, media_px, img.get_width())
	var d2: float = cam.global_position.distance_to(p)
	var f_px: float = _alto_ref(cam) /(2.0 * tan(deg_to_rad(cam.fov) * 0.5))



	var sen: float = clampf((cam.global_position.y - p.y) / maxf(d2, 0.001), 0.08, 1.0)
	var m_texel: float =(ALTO_PX / 7.0) * d2 / f_px

	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(m_texel * float(img.get_width()),
		m_texel * float(img.get_height()) / sen)
	_quad = MeshInstance3D.new()
	_quad.mesh = quad
	_quad.material_override = _mat
	_quad.rotation.x = - PI * 0.5
	var hacia: Vector3 = cam.global_position - p
	hacia.y = 0.0
	_quad.rotation.y = atan2(hacia.x, hacia.z)
	_quad.position = p
	_quad.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(_quad)

	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_property(_mat, "albedo_color:a", 0.95, FADE_IN).set_trans(Tween.TRANS_SINE)
	return true




func apaga() -> void:
	if _mat == null:
		return
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_property(_mat, "albedo_color:a", 0.0, FADE_OUT).set_trans(Tween.TRANS_SINE)
	_tw.tween_callback(limpia)




















func _alto_ref(cam: Camera3D) -> float:
	if not UiKit.es_horizontal():
		return REF_H
	var vp: Vector2 = SceneFade.rect_visible(cam).size
	return maxf(vp.x if cam.keep_aspect == Camera3D.KEEP_WIDTH else vp.y, 1.0)













func _tapas_mando(cam: Camera3D) -> Array[Vector3]:
	var out: Array[Vector3] = []
	var raiz: Node = get_parent() if get_parent() != null else self
	var ancho: float = SceneFade.rect_visible(cam).size.x
	for n in raiz.find_children("*", "Control", true, false):
		if not (n is JoystickTactil) or not n.is_visible_in_tree():
			continue
		var j: JoystickTactil = n
		var c: Vector2 = j.esquina()
		var r: float = j.base_r()
		out.append(Vector3(c.x, c.y, r))
		out.append(Vector3(ancho - c.x, c.y, r))
		break
	return out











func _renglon_pisa(cam: Camera3D, cand: Vector3, ancho_tx: int, f_px: float,
		sp_pies: Vector2, aro_h: float, veto: float, tapas: Array[Vector3],
		alto: float, ancho: float, lado_seguro: float) -> bool:
	var hacia: Vector3 = cam.global_position - cand
	hacia.y = 0.0
	var th: float = atan2(hacia.x, hacia.z)

	var eje: Vector3 = Vector3(cos(th), 0.0, - sin(th))
	var m_texel: float =(ALTO_PX / 7.0) * cam.global_position.distance_to(cand) / f_px
	var media_m: float = m_texel * float(ancho_tx) * 0.5


	var media_h: float = ALTO_PX * 9.0 / 14.0 * alto / _alto_ref(cam)
	const N: int = 17
	for i in N:
		var q: Vector3 = cand + eje * lerpf(- media_m, media_m, float(i) / float(N - 1))
		if cam.is_position_behind(q):
			return true
		var sp: Vector2 = cam.unproject_position(q)
		if sp.x < lado_seguro + media_h or sp.x > ancho - lado_seguro - media_h:
			return true
		if sp.y < alto * 0.08 or sp.y > alto * 0.94:
			return true
		var dx: float =(sp.x - sp_pies.x) / maxf(aro_h, 1.0)
		var dy: float =(sp.y - sp_pies.y) / maxf(veto, 1.0)
		if dx * dx + dy * dy < 1.0:
			return true
		for t in tapas:
			if sp.distance_to(Vector2(t.x, t.y)) < t.z + media_h:
				return true
	return false


func limpia() -> void:
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = null
	if _quad != null:
		_quad.queue_free()
		_quad = null
	_mat = null































func _punto(cam: Camera3D, pies: Vector3, evitar: Vector3 = Vector3.INF,
		media_px: float = 0.0, ancho_tx: int = 0) -> Vector3:
	var hacia: Vector3 = cam.global_position - pies
	hacia.y = 0.0
	if hacia.length() < 0.01:
		hacia = Vector3.BACK
	hacia = hacia.normalized()





	var alto: float = maxf(float(SceneFade.rect_visible(cam).size.y), 1.0)
	var ancho: float = maxf(float(SceneFade.rect_visible(cam).size.x), 1.0)











	var margen: float = clampf(maxf(ancho * 0.1, media_px), 0.0, ancho * 0.45)
	var esc: float = alto / REF_H








	var esc_txt: float = esc
	var aire_aro: float = ARO_AIRE_PX * esc
	if UiKit.es_horizontal():
		esc_txt = alto / _alto_ref(cam)


		aire_aro += ALTO_PX * 9.0 / 14.0 *(esc_txt - esc)
	var meta: float = alto * Y_OBJETIVO
	var sp_pies: Vector2 = cam.unproject_position(pies)



	var d_pies: float = maxf(cam.global_position.distance_to(pies), 0.001)
	var sen: float = clampf((cam.global_position.y - pies.y) / d_pies, 0.08, 1.0)

	var aro_h: float = ARO_PX_REF * esc + aire_aro
	var veto: float = ARO_PX_REF * esc * sen + aire_aro
	var sp_meta: Vector2 = Vector2.INF
	if evitar.is_finite():
		sp_meta = cam.unproject_position(evitar)




	var entero: bool = UiKit.es_horizontal() and ancho_tx > 0 and not solo_centro
	var tapas: Array[Vector3] = []
	var f_px: float = 1.0
	var lado_seguro: float = 0.0
	if entero:
		tapas = _tapas_mando(cam)
		f_px = _alto_ref(cam) /(2.0 * tan(deg_to_rad(cam.fov) * 0.5))
		lado_seguro = UiKit.side_safe_inset(cam.get_viewport())
	var laxo: Vector3 = Vector3.INF
	var laxo_err: float = INF


	var costado: Vector3 = hacia.cross(Vector3.UP).normalized()

	var mejor: Vector3 = Vector3.INF
	var mejor_err: float = INF

	for lado in [1.0, -1.0]:
		var tope: float = DIST_MAX if lado > 0.0 else DIST_MAX_FONDO
		for i in PASOS:
			var d: float = lerpf(DIST_MIN, tope, float(i) / float(PASOS - 1))
			for off in LADOS_M:
				var cand: Vector3 = pies + hacia *(d * lado) \
						+ costado * off + Vector3(0.0, ALTURA, 0.0)
				if cam.is_position_behind(cand):
					continue
				var sp: Vector2 = cam.unproject_position(cand)




				if sp.x < margen or sp.x > ancho - margen:
					continue


				if sp.y < alto * 0.08 or sp.y > alto * 0.94:
					continue





				var dx: float =(sp.x - sp_pies.x) / maxf(aro_h, 1.0)
				var dy: float =(sp.y - sp_pies.y) / maxf(veto, 1.0)
				if dx * dx + dy * dy < 1.0:
					continue


				if sp_meta.is_finite() \
						and absf(sp.y - sp_meta.y) < META_AIRE_Y_PX * esc_txt \
						and absf(sp.x - sp_meta.x) < META_AIRE_X_PX * esc_txt:
					continue



				var err: float = absf(sp.y - meta) + absf(off) * 4.0
				if entero:
					if err < laxo_err:
						laxo_err = err
						laxo = cand
					if _renglon_pisa(cam, cand, ancho_tx, f_px, sp_pies, aro_h, veto,
							tapas, alto, ancho, lado_seguro):
						continue
				if err < mejor_err:
					mejor_err = err
					mejor = cand



	if not mejor.is_finite() and laxo.is_finite():
		mejor = laxo
	if not mejor.is_finite():
		mejor = pies + hacia * DIST_M + Vector3(0.0, ALTURA, 0.0)
	return mejor
