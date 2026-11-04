class_name PechoRig
extends RefCounted































var mundo: Node = null







var cam: Camera3D = null


var _filas: Dictionary = {}


func _init(mundo_: Node = null, cam_: Camera3D = null) -> void:
	mundo = mundo_
	cam = cam_

















static func con_escudo(cfg: Dictionary, team: Dictionary) -> Dictionary:
	if cfg.has("street_garment") or cfg.get("_gala_preview", false):
		return cfg
	if cfg.has("crest_logo") or team.is_empty():
		return cfg
	var clave: String = CrestLogos.key_of(team)
	if clave.is_empty() or not CrestLogos.has(clave):
		return cfg
	if CrestLogos.texture(clave) == null:
		return cfg
	var out: Dictionary = cfg.duplicate()
	out["crest_logo"] = clave
	return out






















func vestir(spr: AnimatedSprite3D, cfg: Dictionary, team: Dictionary) -> void:
	quitar(spr)

	if cfg.has("street_garment") or cfg.get("_gala_preview", false):
		return
	if spr == null or mundo == null or not is_instance_valid(mundo):
		return
	var fila: Dictionary = {}





	var num: int = int(cfg.get("number", 0))
	if num > 0:
		var frame: Image = null
		var sf: SpriteFrames = spr.sprite_frames
		if sf != null and sf.has_animation(spr.animation) \
				and sf.get_frame_count(spr.animation) > 0:
			var t: Texture2D = sf.get_frame_texture(spr.animation, 0)
			if t != null:
				frame = t.get_image()
		var rec: Dictionary = ShortNum.receta_para(cfg, frame,
			ShortNum.caja_fichero(base_de(spr)))
		var stex: ImageTexture = ShortNum.textura(num, rec)
		if stex != null:
			var shn: Sprite3D = ShortNum.nodo(stex)
			mundo.add_child(shn)
			fila["shn"] = shn










	if cfg.has("bib"):
		if not fila.is_empty():
			_filas[spr] = fila
		return















	if not cfg.has("crest_logo") and not cfg.has("crest_fill") \
			and not cfg.has("crest_flag"):
		if not fila.is_empty():
			_filas[spr] = fila
		return





	var epoca: bool = bool(cfg.get("retro", false))
	if cfg.has("crest_logo"):
		var logo: Texture2D = CrestLogos.texture(String(cfg["crest_logo"]), epoca)
		if logo != null:
			var esc: Sprite3D = Pecho.nodo(logo)
			mundo.add_child(esc)
			fila["esc"] = esc








	var marca: Texture2D = SponsorLogos.for_team(String(team.get("id", "")), epoca)
	if marca != null and not cfg.has("crest_flag"):
		var pat: Sprite3D = Pecho.nodo(Pecho.marca_para(marca, cfg, "pat"))
		mundo.add_child(pat)
		fila["pat"] = pat





	var fab_tex: Texture2D = KitBrands.for_team(String(team.get("id", "")), epoca,
		int(cfg.get("kit_slot", 0)))
	if fab_tex != null:
		var fab: Sprite3D = Pecho.nodo(Pecho.marca_para(fab_tex, cfg, "fab"))
		mundo.add_child(fab)
		fila["fab"] = fab

	var cmp_tex: Texture2D = Pecho.campeon_textura(cfg, String(team.get("id", "")))
	if cmp_tex != null:
		var cmp: Sprite3D = Pecho.nodo(cmp_tex)
		cmp.alpha_scissor_threshold = 0.12
		mundo.add_child(cmp)
		fila["cmp"] = cmp
	_filas[spr] = fila




func quitar(spr: AnimatedSprite3D) -> void:
	if spr == null or not _filas.has(spr):
		return
	var fila: Dictionary = _filas[spr]
	for k in ["esc", "pat", "fab", "cmp", "shn"]:



		var n: Variant = fila.get(k)
		if is_instance_valid(n):
			(n as Node).queue_free()
	_filas.erase(spr)




func vacio() -> bool:
	return _filas.is_empty()













func seguir() -> void:
	if _filas.is_empty():
		return
	var muertos: Array = []
	for k in _filas:


		if not is_instance_valid(k):
			muertos.append(k)
			continue
		var spr: AnimatedSprite3D = k as AnimatedSprite3D
		if spr == null:
			muertos.append(k)
			continue
		var fila: Dictionary = _filas[k]
		var base: String = base_de(spr)
		var r: Dictionary = Pecho.rects_base(base)
		var c: Camera3D = _camara()
		var esc: Sprite3D = SceneFade.vivo(fila.get("esc")) as Sprite3D
		if is_instance_valid(esc):
			Pecho.seguir(esc, spr, r.get("esc", Rect2()), spr.pixel_size, c)
		var pat: Sprite3D = SceneFade.vivo(fila.get("pat")) as Sprite3D
		if is_instance_valid(pat):
			Pecho.seguir(pat, spr, r.get("pat", Rect2()), spr.pixel_size, c)
		var fab: Sprite3D = SceneFade.vivo(fila.get("fab")) as Sprite3D
		if is_instance_valid(fab):
			Pecho.seguir(fab, spr, r.get("fab", Rect2()), spr.pixel_size, c)
		var cmp: Sprite3D = SceneFade.vivo(fila.get("cmp")) as Sprite3D
		if is_instance_valid(cmp):
			Pecho.seguir(cmp, spr, r.get("cmp", Rect2()), spr.pixel_size, c)
		var shn: Sprite3D = SceneFade.vivo(fila.get("shn")) as Sprite3D
		if is_instance_valid(shn):
			ShortNum.seguir(shn, spr, ShortNum.caja_fichero(base),
				spr.pixel_size, c)
	for m in muertos:
		var fila: Dictionary = _filas[m]
		for kk in ["esc", "pat", "fab", "cmp", "shn"]:











			var n: Variant = fila.get(kk)
			if is_instance_valid(n):
				(n as Node).queue_free()
		_filas.erase(m)








static func apunta(frames: SpriteFrames, bases: PackedStringArray,
		anim: String = "") -> void:
	if frames == null:
		return
	frames.set_meta("pecho_bases" if anim.is_empty() else "pecho_bases_%s" % anim,
		bases)
















static func base_de(spr: AnimatedSprite3D, cuadro: int = -1) -> String:
	if spr == null or spr.sprite_frames == null:
		return ""
	var sf: SpriteFrames = spr.sprite_frames
	var por_anim: String = "pecho_bases_%s" % spr.animation
	var v: Variant = sf.get_meta(por_anim) if sf.has_meta(por_anim) \
			else sf.get_meta("pecho_bases", PackedStringArray())
	if not (v is PackedStringArray):
		return ""
	var lista: PackedStringArray = v
	var i: int = spr.frame if cuadro < 0 else cuadro
	return lista[i] if i >= 0 and i < lista.size() else ""






func _camara() -> Camera3D:
	if is_instance_valid(cam):
		return cam
	if mundo is Viewport:
		return (mundo as Viewport).get_camera_3d()
	if mundo is Node and (mundo as Node).is_inside_tree():
		return SceneFade.camara_de(mundo)
	return null
