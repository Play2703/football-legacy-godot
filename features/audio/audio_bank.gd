class_name AudioBank




























const DIR: String = "res://assets/audio/"







const FUENTE: Dictionary = {

	"crowd_loop_d1": "crowd_bed_big",
	"crowd_loop_big": "crowd_bed_big",
	"crowd_loop_d2": "crowd_bed_mid",
	"crowd_loop": "crowd_bed_mid",
	"crowd_loop_d3": "crowd_bed_small",
	"crowd_loop_small": "crowd_bed_small",

	"crowd_roar": "crowd_roar",
	"crowd_boo": "crowd_boo",






	"crowd_whistles": "crowd_whistles",
	"chant_loop": "chant_loop",




	"crowd_angry": "crowd_angry",


	"crowd_happy": "crowd_happy",




	"goal_roar": "goal_roar",




	"crowd_ovation": "crowd_ovation",


	"crowd_ole": "crowd_ole",



	"ola_rugido": "ola_rugido",


	"prematch_bed": "prematch_bed",




	"applause_loop": "applause_loop",


	"camera_storm": "camera_storm",






	"whistle": "whistle",



	"whistle_long": "whistle_long",
	"post_hit": "post_hit",




	"net_swish": "net_swish",





	"keeper_save": "keeper_save",
	"keeper_catch": "keeper_catch",




	"dolor_queja_1": "dolor_queja_1",
	"dolor_queja_2": "dolor_queja_2",
	"dolor_queja_3": "dolor_queja_3",
	"dolor_queja_4": "dolor_queja_4",
	"dolor_queja_5": "dolor_queja_5",
	"dolor_queja_6": "dolor_queja_6",
	"dolor_grito_1": "dolor_grito_1",
	"dolor_grito_2": "dolor_grito_2",
	"dolor_grito_3": "dolor_grito_3",
	"dolor_grito_4": "dolor_grito_4",
	"dolor_grito_5": "dolor_grito_5",
	"dolor_grito_6": "dolor_grito_6",
	"dolor_grito_7": "dolor_grito_7",




	"barrida_1": "barrida_1",
	"barrida_2": "barrida_2",
	"barrida_3": "barrida_3",
	"barrida_4": "barrida_4",
	"barrida_5": "barrida_5",















	"voz_pide_1": "voz_pide_1",
	"voz_pide_2": "voz_pide_2",
	"voz_pide_3": "voz_pide_3",
	"voz_pide_4": "voz_pide_4",
	"voz_cele_1": "voz_cele_1",
	"voz_cele_2": "voz_cele_2",
	"voz_cele_3": "voz_cele_3",
	"voz_cele_4": "voz_cele_4",
	"voz_protesta_1": "voz_protesta_1",
	"voz_protesta_2": "voz_protesta_2",
	"voz_protesta_3": "voz_protesta_3",
	"voz_animo_1": "voz_animo_1",
	"voz_animo_2": "voz_animo_2",
	"voz_animo_3": "voz_animo_3",

	"locker_murmur": "locker_murmur",




	"ocarina": "ocarina",
}





const BUCLES: PackedStringArray = ["crowd_bed_big", "crowd_bed_mid",
	"crowd_bed_small", "chant_loop", "applause_loop", "camera_storm",
	"locker_murmur", "crowd_angry", "crowd_happy", "prematch_bed", "ola_rugido"]

static var _cache: Dictionary = {}




static func stream(id: String) -> AudioStream:
	if _cache.has(id):
		return _cache[id]
	var s: AudioStream = _sample(id)
	if s == null:
		s = AudioSynth.get_stream(id)
	_cache[id] = s
	return s




static func tiene_sample(id: String) -> bool:
	return FUENTE.has(id) and ResourceLoader.exists(ruta(id))


static func ruta(id: String) -> String:
	return DIR + String(FUENTE.get(id, id)) + ".ogg"






static func _sample(id: String) -> AudioStream:
	if not FUENTE.has(id):
		return null
	var path: String = ruta(id)
	if not ResourceLoader.exists(path):



		push_warning("AudioBank: falta %s (el cue '%s' cae al sintetizador)" % [path, id])
		return null
	var s: AudioStream = load(path)
	var ogg: AudioStreamOggVorbis = s as AudioStreamOggVorbis
	if ogg != null:
		ogg.loop = String(FUENTE[id]) in BUCLES
	return s
