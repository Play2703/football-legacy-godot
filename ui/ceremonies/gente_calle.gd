extends RefCounted















const PeloEspaldas := preload("res://features/match/pelo_espaldas.gd")



const CORTES: Array[String] = ["normal", "buzz", "normal", "bald", "normal"]


const ELLAS_LOOKS: Array[String] = ["sudadera", "camisa", "rojo", "jersey", "traje",
	"blusa"]





static func ellos(c: Ceremony, kit: Dictionary, n: int, hojas: Array[String],
		aficion: bool = true) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for i in n:
		var hoja: String = hojas[i % hojas.size()]
		out.append({"frames": c.player_frames(KitRecolor.casual_of(_ropa(i, kit, aficion)),
			"north", hoja), "px": Ceremony.PLAYER_HEIGHT_M / Ceremony.PLAYER_METRICS.x,
			"hoja": hoja})
	return out












static func _ropa(i: int, kit: Dictionary, aficion: bool) -> Dictionary:
	var camisas: Array[Color] = KitRecolor.CASUAL_SHIRTS
	var pantalones: Array[Color] = KitRecolor.CASUAL_PANTS
	var cara: Dictionary = {
		"skin": KitRecolor.SKIN_TONES[(i * 5 + 1) % KitRecolor.SKIN_TONES.size()],
		"hair": KitRecolor.HAIR_COLORS[(i * 3 + 2) % KitRecolor.HAIR_COLORS.size()],
		"hair_style": CORTES[i % CORTES.size()],
		"casual_shirt": camisas[(i * 4 + 1) % camisas.size()],

		"casual_pants": pantalones[(i * 5 + 1) %(pantalones.size() - 1)],
	}
	if aficion:
		cara["casual_pants"] = pantalones[(i * 3 + 1) % pantalones.size()]
		if i % 3 == 0:
			cara["casual_shirt"] = Color(kit.get("kit", camisas[0]))
		if i % 5 == 4:
			cara["casual_print"] = "hoops"
			cara["casual_shirt2"] = camisas[0]


	return KitRecolor.sin_pelirrojo_oscuro(cara)









static func clave_persona(q: Dictionary) -> String:
	match String(q.get("tipo", "el")):
		"ella":
			return "ella|%s|%s" % [String(q.get("atuendo", "")), var_to_str(q.get("cfg", {}))]
		"nino":
			return "nino|" + String(q.get("semilla", ""))
	return "el|" + var_to_str(_ropa(int(q.get("ropa", 13)), {"kit": Color(1, 0, 1)}, true))








static func caminante(i: int, mujer: bool, rumbo: String) -> Dictionary:
	if mujer:
		var o: String = ELLAS_LOOKS[i % ELLAS_LOOKS.size()]
		var pre: String = Pareja.ANIM_DIR + "mujer_look_%s_walk_%s_" % [o, rumbo]
		var cfg: Dictionary = KitRecolor.sin_pelirrojo_oscuro({
			"skin": KitRecolor.SKIN_TONES[(i * 5 + 2) % KitRecolor.SKIN_TONES.size()],
			"hair": KitRecolor.HAIR_COLORS[Pareja.PELOS[(i * 5 + 3) % Pareja.PELOS.size()]],
		})
		return {"frames": _paso(cfg, pre, 0), "px": Ceremony.PAREJA_PIXEL,
			"pie": pre + "00.png"}

	var pre_h: String = "res://assets/sprites/anim/walk_player_%s_" % rumbo
	return {"frames": _paso(KitRecolor.casual_of(_ropa(i + 3, {}, false)), pre_h, 1),
		"px": Ceremony.PLAYER_HEIGHT_M / Ceremony.PLAYER_METRICS.x, "pie": pre_h + "01.png"}



static func _paso(cfg: Dictionary, pre: String, desde: int) -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 10.0)
	for k in 8:
		var path: String = "%s%02d.png" % [pre, k + desde]
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
	return frames












static func ellas(c: Ceremony, n: int) -> Array[Dictionary]:
	var looks: Array[String] = []
	for o in ELLAS_LOOKS:
		if ResourceLoader.exists(Pareja.ANIM_DIR + "mujer_look_%s_idle_north_00.png" % o):
			looks.append(o)
	var out: Array[Dictionary] = []
	if looks.is_empty():
		return out
	for i in n:


		var vuelta: int = i / looks.size()
		var o: String = looks[i % looks.size()]
		var gesto: String = Pareja.ANIM_DIR + "mujer_look_%s_clap_north_" % o
		var hoja: String = gesto if ResourceLoader.exists(gesto + "00.png") \
				else Pareja.ANIM_DIR + "mujer_look_%s_idle_north_" % o
		var cfg: Dictionary = KitRecolor.sin_pelirrojo_oscuro({
			"skin": KitRecolor.SKIN_TONES[(i * 5 + 2 + vuelta * 3)
				% KitRecolor.SKIN_TONES.size()],
			"hair": KitRecolor.HAIR_COLORS[Pareja.PELOS[(i * 5 + 3 + vuelta)
				% Pareja.PELOS.size()]],
		})
		var frames: SpriteFrames = c.player_frames(cfg, "north", hoja, true)


		PeloEspaldas.arregla(frames, "idle", hoja, frames.get_meta("look_cfg", cfg))
		out.append({"frames": frames, "px": Ceremony.PAREJA_PIXEL, "hoja": hoja})
	return out
