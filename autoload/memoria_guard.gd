extends Node






































const CACHES: Array = [
	["res://features/match/match.gd", "_frames_cache"],
	["res://features/match/match.gd", "_frames_full"],
	["res://features/match/match.gd", "_chip_cache"],
	["res://features/match/match.gd", "_medal_cache"],
	["res://features/match/kit_recolor.gd", "_cache"],
	["res://features/match/modular_appearance.gd", "_composed"],
	["res://features/match/modular_appearance.gd", "_tintadas"],
	["res://features/match/modular_appearance.gd", "_textures"],


	["res://features/match/espalda.gd", "_cache"],
	["res://features/match/short_num.gd", "_cache"],
	["res://features/match/pecho.gd", "_tenidas"],
	["res://features/stadium/stadium.gd", "_pitch_cache"],




	["res://features/stadium/exterior_detail.gd", "_arrays_cache"],
	["res://features/league/crest_logos.gd", "_cache"],
	["res://features/league/sponsor_logos.gd", "_cache"],
	["res://features/league/kit_brands.gd", "_cache"],


	["res://ui/house/house.gd", "_foto_mem"],
	["res://ui/house/house.gd", "_fan_frames_mem"],
	["res://ui/house_stage.gd", "_snap"],


	["res://ui/shop_photo.gd", "_fotos"],
	["res://ui/career_page.gd", "_merch_fotos"],



	["res://features/match/cara_encima.gd", "_parches"],
	["res://features/match/gorro_duende.gd", "_parches"],
	["res://features/match/chamarra.gd", "_cache"],
]








const CACHES_MENU: Array = [
	["res://ui/house/house.gd", "_foto_mem"],
	["res://ui/house/house.gd", "_fan_frames_mem"],
	["res://ui/house_stage.gd", "_snap"],
	["res://ui/shop_photo.gd", "_fotos"],
	["res://ui/career_page.gd", "_merch_fotos"],




	["res://features/stadium/exterior_detail.gd", "_arrays_cache"],
]









const LLAMADAS: Array = [
	["res://ui/hub_training.gd", "olvida_fotos"],






	["res://ui/house/casa_barrio.gd", "olvida"],



	["res://ui/house/pet_frames.gd", "olvida"],
]




var avisos: int = 0





var telemetria_path: NodePath = ^"root/Telemetry"


static var simula_android: bool = false



















const TECHO_TEX_MB: int = 256



const HOLGURA_TEX_MB: int = 64
const ESCENA_PARTIDO: String = "res://features/match/match.tscn"











const TECHO_VIDEO_IOS_MB: int = 640
const TECHO_VIDEO_IOS_HOLGADO_MB: int = 1024


const RAM_JUSTA_MB: int = 4608

static var simula_ios: bool = false
static var ram_fingida: int = -1


var _tex_tras_soltar: int = -1

static var tex_fingida: int = -1

































const MAPAS_SUELTA_PCT: int = 60
const MAPAS_ALTOS_PCT: int = 80
const HOLGURA_MAPAS_PCT: int = 3



const LIMITE_MAPAS_DEFECTO: int = 65530
const CENSO_CADA_S: float = 60.0


var ultimo_censo: Dictionary = {}

var _mapas_tras_soltar: int = -1


static var censo_fingido: Dictionary = {}







static func censo() -> Dictionary:
	if not censo_fingido.is_empty():
		return censo_fingido.duplicate()
	var c: Dictionary = {"maps": -1, "maps_kgsl": -1, "maps_sec": -1, "maps_pri": -1,
		"maps_dalvik": -1, "rss": -1, "vsz": -1, "lim": -1, "tex_n": -1}
	if not (simula_android or OS.has_feature("android")):
		return c
	c.merge(_lee_maps("/proc/self/maps"), true)
	var st: String = _lee_proc("/proc/self/status", 1<<16)
	c["rss"] = _vmrss_de(st)
	c["vsz"] = _vm_de(st, "VmSize")
	c["lim"] = _limite_mapas()



	c["tex_n"] = int(Performance.get_monitor(Performance.OBJECT_RESOURCE_COUNT))
	return c






static var _lim: int = 0


static func _limite_mapas() -> int:
	if _lim <= 0:
		var t: String = _lee_proc("/proc/sys/vm/max_map_count", 64).strip_edges()
		_lim = int(t) if t.is_valid_int() and int(t) > 0 else LIMITE_MAPAS_DEFECTO
	return _lim



const PISOS_DE_SOBRA: int = 8
















static func _abre_proc(ruta: String) -> FileAccess:
	return FileAccess.open(por_user(ruta) if ruta.begins_with("/") else ruta, FileAccess.READ)






static func por_user(ruta: String, carpeta: String = "") -> String:
	if carpeta == "":
		carpeta = OS.get_user_data_dir()
	var pisos: int = carpeta.simplify_path().split("/", false).size() + PISOS_DE_SOBRA
	return "user://" + "../".repeat(pisos) + ruta.trim_prefix("/")





static func _lee_proc(ruta: String, tope: int) -> String:
	var f: FileAccess = _abre_proc(ruta)
	if f == null:
		return ""
	var datos: PackedByteArray = PackedByteArray()
	while not f.eof_reached() and datos.size() < tope:
		var trozo: PackedByteArray = f.get_buffer(4096)
		if trozo.is_empty():
			break
		datos.append_array(trozo)
	return datos.get_string_from_ascii()






static func _lee_maps(ruta: String) -> Dictionary:
	var f: FileAccess = _abre_proc(ruta)
	if f == null:
		return {}
	var total: Dictionary = {}
	var resto: PackedByteArray = PackedByteArray()
	while not f.eof_reached():
		var trozo: PackedByteArray = f.get_buffer(1<<20)
		if trozo.is_empty():
			break
		resto.append_array(trozo)
		var corte: int = resto.rfind(10)
		if corte < 0:
			continue
		_suma_censo(total, _censa_maps(resto.slice(0, corte + 1).get_string_from_ascii()))
		resto = resto.slice(corte + 1)
	if not resto.is_empty():
		_suma_censo(total, _censa_maps(resto.get_string_from_ascii()))
	return total


static func _suma_censo(total: Dictionary, parte: Dictionary) -> void:
	for k in parte:
		total[k] = int(total.get(k, 0)) + int(parte[k])





static func _censa_maps(texto: String) -> Dictionary:
	var lineas: int = texto.count("\n")
	if not texto.is_empty() and not texto.ends_with("\n"):
		lineas += 1
	return {"maps": lineas, "maps_kgsl": texto.count("kgsl"),
		"maps_sec": texto.count("scudo:secondary"), "maps_pri": texto.count("scudo:primary"),
		"maps_dalvik": texto.count("dalvik")}



static func _vmrss_de(texto: String) -> int:
	return _vm_de(texto, "VmRSS")



static func _vm_de(texto: String, llave: String) -> int:
	for linea in texto.split("\n", false):
		if not linea.begins_with(llave + ":"):
			continue
		var cifra: String = linea.substr(llave.length() + 1).strip_edges().get_slice(" ", 0)
		return int(cifra) / 1024 if cifra.is_valid_int() else -1
	return -1




func _censa_y_decide(escena: String, cambio_de_escena: bool) -> bool:
	var c: Dictionary = censo()
	ultimo_censo = c
	var t: Node = get_node_or_null(telemetria_path)
	if t != null and t.has_method("anota_censo"):
		t.call("anota_censo", c)
	return _decide_mapas(c, escena, cambio_de_escena)



func _decide_mapas(c: Dictionary, escena: String, cambio_de_escena: bool) -> bool:
	var maps: int = int(c.get("maps", -1))
	var lim: int = int(c.get("lim", -1))
	if maps < 0 or lim <= 0 or maps * 100 < lim * MAPAS_SUELTA_PCT:
		return false
	if _mapas_tras_soltar >= 0 and maps < _mapas_tras_soltar + lim * HOLGURA_MAPAS_PCT / 100:
		return false
	var partido: bool = escena == ESCENA_PARTIDO
	if maps * 100 >= lim * MAPAS_ALTOS_PCT:
		var t: Node = get_node_or_null(telemetria_path)
		if t != null and t.has_method("count"):
			t.call("count", "mapas_altos")
		if partido:


			suelta_lista("mapas altos partido %d/%d" % [maps, lim], CACHES_MENU)
			return true

		suelta_lista("mapas altos %d/%d" % [maps, lim], CACHES, LLAMADAS)
	elif cambio_de_escena and not partido:

		suelta_lista("mapas %d/%d" % [maps, lim], CACHES)
	else:
		return false
	_mapas_tras_soltar = maps
	_mide_mapas_tras_soltar.call_deferred()
	return true




func _mide_mapas_tras_soltar() -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	var m: int = int(censo().get("maps", -1))
	if m >= 0:
		_mapas_tras_soltar = m







func _cadencia_censo() -> void:
	var sf: Node = get_node_or_null(scene_fade_path)
	if sf == null:
		return
	while is_inside_tree():
		var reloj: SceneTreeTimer = sf.call("timer", CENSO_CADA_S, false) as SceneTreeTimer
		if reloj == null:
			return
		await reloj.timeout
		if not is_inside_tree():
			return
		var actual: Node = get_tree().current_scene
		var escena: String = actual.scene_file_path if actual != null else ""
		if escena != ESCENA_PARTIDO:
			_censa_y_decide(escena, false)




var _medido_antes: String = ""

var scene_fade_path: NodePath = ^"root/SceneFade"


func _ready() -> void:

	get_tree().scene_changed.connect(_al_cambiar_escena)


	_engancha_scene_fade.call_deferred()


	if OS.has_feature("android"):
		_cadencia_censo.call_deferred()











func _engancha_scene_fade() -> void:
	var sf: Node = get_node_or_null(scene_fade_path)
	if sf != null and sf.has_method("antes_de_saltar_add"):
		sf.call("antes_de_saltar_add", antes_de_cambiar)




func antes_de_cambiar(path: String) -> bool:
	if path == "":
		return false
	_medido_antes = path
	return _al_cambiar_escena(path)




func _tex_mb() -> int:
	if tex_fingida >= 0:
		return tex_fingida
	var que: int = RenderingServer.RENDERING_INFO_VIDEO_MEM_USED if _es_ios() \
			else RenderingServer.RENDERING_INFO_TEXTURE_MEM_USED
	return int(RenderingServer.get_rendering_info(que) / 1048576)



func _techo_mb() -> int:
	if not _es_ios():
		return TECHO_TEX_MB
	var ram: int = ram_fingida
	if ram < 0:
		ram = int(OS.get_memory_info().get("physical", 0)) / 1048576
	return TECHO_VIDEO_IOS_MB if ram <= RAM_JUSTA_MB else TECHO_VIDEO_IOS_HOLGADO_MB




func _al_cambiar_escena(escena: String = "") -> bool:
	if not _tiene_techo():
		return false
	var techo: int = _techo_mb()
	if escena == "":
		var actual: Node = get_tree().current_scene
		escena = actual.scene_file_path if actual != null else ""

		var ya: bool = _medido_antes != "" and escena == _medido_antes
		_medido_antes = ""
		if ya:
			return false


	var por_mapas: bool = _censa_y_decide(escena, true)
	var tex: int = _tex_mb()



	if escena == ESCENA_PARTIDO:
		if tex < techo:
			return por_mapas

		suelta_lista("techo entrada partido %d MB" % tex, CACHES_MENU, LLAMADAS)
		return true
	return _suelta_sobre_techo(tex, techo, "") or por_mapas





func _suelta_sobre_techo(tex: int, techo: int, donde: String) -> bool:
	if tex < techo or (_tex_tras_soltar >= 0 and tex < _tex_tras_soltar + HOLGURA_TEX_MB):
		return false

	suelta("techo%s %s %d MB" % [donde, "ios" if _es_ios() else "android", tex])

	_tex_tras_soltar = tex
	_mide_tras_soltar.call_deferred()
	return true




static var llamadas_3d: int = 0











func antes_de_3d(escena: String = "") -> bool:
	llamadas_3d += 1
	if not _tiene_techo():
		return false
	if escena == "":
		var actual: Node = get_tree().current_scene if is_inside_tree() else null
		escena = actual.scene_file_path if actual != null else ""
	if escena == ESCENA_PARTIDO:
		return false


	var por_mapas: bool = _censa_y_decide(escena, false)
	return _suelta_sobre_techo(_tex_mb(), _techo_mb(), " 3d") or por_mapas


func _mide_tras_soltar() -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	_tex_tras_soltar = _tex_mb()












func _es_android() -> bool:
	return simula_android or OS.has_feature("android")


func _es_ios() -> bool:
	return simula_ios or OS.has_feature("ios")



func _tiene_techo() -> bool:
	return _es_android() or _es_ios()


func _notification(what: int) -> void:
	if what == NOTIFICATION_OS_MEMORY_WARNING:
		recibe_aviso()
	elif what == NOTIFICATION_APPLICATION_PAUSED and _es_android():
		al_pasar_a_fondo()










func al_pasar_a_fondo(escena: String = "") -> float:
	if escena == "":
		var actual: Node = get_tree().current_scene if is_inside_tree() else null
		escena = actual.scene_file_path if actual != null else ""
	if escena == ESCENA_PARTIDO:

		return suelta_lista("fondo android partido", CACHES_MENU, LLAMADAS)

	return suelta("fondo android")







func recibe_aviso() -> void:
	var t: Node = get_node_or_null(telemetria_path)
	if t != null and t.has_method("aviso_memoria"):
		t.call("aviso_memoria")

	suelta("aviso de iOS")





func suelta(motivo: String) -> float:
	return suelta_lista(motivo, CACHES, LLAMADAS)




func suelta_lista(motivo: String, lista: Array, llamadas: Array = []) -> float:
	avisos += 1
	var antes: float = Performance.get_monitor(Performance.MEMORY_STATIC) / 1048576.0
	var vaciadas: int = 0



	var candado: GDScript = null
	if ResourceLoader.has_cached("res://features/match/kit_recolor.gd"):
		candado = load("res://features/match/kit_recolor.gd") as GDScript
	if candado != null:
		candado.call("candado_toma")
	for par in lista:





		if not ResourceLoader.has_cached(str(par[0])):
			continue
		var sc: GDScript = load(str(par[0])) as GDScript
		if sc == null:
			continue
		var v: Variant = sc.get(str(par[1]))
		if v is Dictionary:
			(v as Dictionary).clear()
			vaciadas += 1
		elif v is Array:
			(v as Array).clear()
			vaciadas += 1
	if candado != null:
		candado.call("candado_suelta")
	for par in llamadas:

		if not ResourceLoader.has_cached(str(par[0])):
			continue
		var sc: GDScript = load(str(par[0])) as GDScript
		if sc == null:
			continue

		for m in sc.get_script_method_list():
			if String(m.get("name", "")) == str(par[1]):
				sc.call(str(par[1]))
				vaciadas += 1
				break
	var despues: float = Performance.get_monitor(Performance.MEMORY_STATIC) / 1048576.0
	push_warning("MemoriaGuard (%s): %d cachés vaciadas · %.0f MB → %.0f MB"
		% [motivo, vaciadas, antes, despues])
	return antes - despues
