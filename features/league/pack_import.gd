class_name PackImport
extends RefCounted





















































































const FORMAT: int = 1







const MAX_FILE_BYTES: int = 32 * 1024 * 1024



const MAX_AVISOS: int = 20







const DIR_PACKS: String = "user://packs"





const MAX_ZIP_BYTES: int = 64 * 1024 * 1024



















static var ultimo_corte: String = ""













const ALIAS: Dictionary = {
	"alsu": "neo", "egy_fut": "egy_mod", "sk04": "s04", "col_ftz": "col_for",
}






static func _canon(team_id: String, presentes: Dictionary) -> String:
	if not Teams.by_id(team_id).is_empty():
		return team_id
	var bueno: String = String(ALIAS.get(team_id, ""))
	if bueno.is_empty() or Teams.by_id(bueno).is_empty():
		return team_id
	return "" if presentes.has(bueno) else bueno














static func nativo() -> Object:
	if not Engine.has_singleton("PackFiles"):
		return null
	return Engine.get_singleton("PackFiles")
















static func selector_sistema() -> bool:
	return OS.get_name() == "Android" \
			and DisplayServer.has_feature(DisplayServer.FEATURE_NATIVE_DIALOG_FILE)















static func recoger_del_selector(origen: String) -> String:
	ultimo_corte = ""
	var f: FileAccess = FileAccess.open(origen, FileAccess.READ)
	if f == null:
		ultimo_corte = "no se pudo abrir %s" % origen
		return ""
	var tam: int = f.get_length()
	if tam > MAX_ZIP_BYTES:
		f.close()
		ultimo_corte = "el archivo pesa %d MB y el tope son %d MB" % [
			tam /(1024 * 1024), MAX_ZIP_BYTES /(1024 * 1024)]
		return ""





	var bytes: PackedByteArray = PackedByteArray()
	while bytes.size() <= MAX_ZIP_BYTES:
		var trozo: PackedByteArray = f.get_buffer(mini(1<<20, MAX_ZIP_BYTES + 1 - bytes.size()))
		if trozo.is_empty():
			break
		bytes.append_array(trozo)
	f.close()
	if bytes.size() > MAX_ZIP_BYTES:
		ultimo_corte = "el archivo pasa del tope de %d MB" %(MAX_ZIP_BYTES /(1024 * 1024))
		return ""
	if bytes.is_empty():
		ultimo_corte = "el archivo está vacío"
		return ""
	var nombre: String = origen.uri_decode().get_file().validate_filename()
	var ext: String = nombre.get_extension().to_lower()
	if ext != "json" and ext != "zip":
		var es_zip: bool = bytes.size() >= 2 and bytes[0] == 80 and bytes[1] == 75
		nombre = "pack_importado." +("zip" if es_zip else "json")
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(DIR_PACKS))
	var destino: String = "%s/%s" % [DIR_PACKS, nombre]
	if not copiar_bytes(bytes, destino):
		ultimo_corte = "no se pudo escribir %s" % destino
		return ""
	return destino





static func es_zip(ruta: String) -> bool:
	var f: FileAccess = FileAccess.open(ruta, FileAccess.READ)
	if f == null:
		return false
	var cab: PackedByteArray = f.get_buffer(2)
	f.close()
	return cab.size() == 2 and cab[0] == 80 and cab[1] == 75





static func copiar_a(origen: String, destino: String) -> bool:
	var bytes: PackedByteArray = FileAccess.get_file_as_bytes(origen)
	if bytes.is_empty():
		return false
	return copiar_bytes(bytes, destino)






static func copiar_bytes(bytes: PackedByteArray, destino: String) -> bool:
	var w: FileAccess = FileAccess.open(destino, FileAccess.WRITE)
	if w == null:
		return false
	var escrito: bool = w.store_buffer(bytes)
	w.close()
	return escrito



























static func unzip(zip_path: String, solo_json: bool = false) -> String:
	ultimo_corte = ""


	var fz: FileAccess = FileAccess.open(zip_path, FileAccess.READ)
	if fz != null:
		var tam: int = fz.get_length()
		fz.close()
		if tam > MAX_ZIP_BYTES:



			ultimo_corte = "El archivo pesa %d MB y el tope son %d MB." % [
				tam /(1024 * 1024), MAX_ZIP_BYTES /(1024 * 1024)]
			return ""
	var lector: ZIPReader = ZIPReader.new()
	if lector.open(zip_path) != OK:
		return ""
	var destino: String = zip_path.get_basename()
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(destino))
	var json_path: String = ""
	var escritos: int = 0



	var sub_hecha: bool = false
	for entrada in lector.get_files():
		var rel: String = String(entrada)
		if rel.ends_with("/"):
			continue



		var partes: PackedStringArray = rel.split("/", false)
		if partes.is_empty():
			continue


		var nombre: String = partes[partes.size() - 1]
		var ext: String = nombre.get_extension().to_lower()
		if ext != "json" and ext != "png":
			continue
		if solo_json and ext != "json":
			continue
		var sub: String = ""
		if partes.size() >= 2 and ext == "png":
			sub = partes[partes.size() - 2]


			if sub.to_lower() != "escudos":
				sub = "escudos"
		var salida: String = destino + "/" +(sub + "/" if not sub.is_empty() else "") + nombre


		if escritos >= MAX_ZIP_BYTES:

			ultimo_corte = "El pack pasa de %d MB: se quedó a medias." % [
				MAX_ZIP_BYTES /(1024 * 1024)]
			break
		var datos: PackedByteArray = lector.read_file(rel)
		escritos += datos.size()
		if not sub.is_empty() and not sub_hecha:
			DirAccess.make_dir_recursive_absolute(
				ProjectSettings.globalize_path(destino + "/" + sub))
			sub_hecha = true
		var f: FileAccess = FileAccess.open(salida, FileAccess.WRITE)
		if f == null:
			continue
		f.store_buffer(datos)
		f.close()


		if ext == "json" and json_path.is_empty():
			json_path = salida
	lector.close()
	return json_path
















static func unzip_en_hilo(zip_path: String, solo_json: bool = false) -> String:
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	if arbol == null:
		return unzip(zip_path, solo_json)
	var salida: Array[String] = [""]
	var tarea: int = WorkerThreadPool.add_task(func() -> void:
		salida[0] = unzip(zip_path, solo_json))
	while not WorkerThreadPool.is_task_completed(tarea):
		await arbol.process_frame


	WorkerThreadPool.wait_for_task_completion(tarea)
	return salida[0]











static func escudos_en_zip(zip_path: String) -> int:
	var lector: ZIPReader = ZIPReader.new()
	if lector.open(zip_path) != OK:
		return 0
	var n: int = 0
	for entrada in lector.get_files():
		if String(entrada).get_extension().to_lower() == "png":
			n += 1
	lector.close()
	return n




static func preview(path: String) -> Dictionary:
	return _run(path, false)








static func import_file(path: String) -> Dictionary:
	return _run(path, true)


















static func export_all(path: String, country: String = "") -> Dictionary:
	var info: Dictionary = {"ok": false, "error": "", "clubes": 0, "jugadores": 0,
		"ruta": path}
	var equipos: Dictionary = {}
	var plantillas: Dictionary = {}
	var asientos: Dictionary = {}
	var estadios: Dictionary = {}
	var formaciones: Dictionary = {}
	var derbis: Dictionary = {}
	for t in Teams.all():
		var club: Dictionary = t
		var team_id: String = String(club.get("id", ""))
		if team_id.is_empty():
			continue
		if not country.is_empty() and String(club.get("country", "")) != country:
			continue
		equipos[team_id] = _ficha_club(club)





		estadios[team_id] = {"nombre": Stadiums.of(club),
			"planta": Stadiums.footprint_of(team_id)}











		var squad: Array = Squad.home_of(team_id)
		var meta: Array = SquadMeta.seed(team_id, Teams.country_of(team_id))
		SquadEdits.apply_meta(team_id, meta)
		var filas: Array = []
		for i in squad.size():
			filas.append(_ficha_jugador(squad[i],
				meta[i] if i < meta.size() else {}, team_id))
		plantillas[team_id] = filas



		asientos[team_id] = filas.size()
		if TeamEdits.tiene(team_id, "formacion"):
			formaciones[team_id] = String(TeamEdits.of(team_id)["formacion"])




		if TeamEdits.tiene(team_id, TeamEdits.DERBI_KEY):
			var lista_d: Array = TeamEdits.derbis_of(team_id)
			derbis[team_id] = String(lista_d[0]) if lista_d.size() == 1 else lista_d
		info["clubes"] = int(info["clubes"]) + 1
		info["jugadores"] = int(info["jugadores"]) + filas.size()
	var pack: Dictionary = {
		"format": FORMAT,
		"nombre": country if not country.is_empty() else I18n.t("Catálogo completo"),
		"equipos": equipos,
		"formaciones": formaciones,
		"plantillas": plantillas,
		"asientos": asientos,
		"estadios": estadios,
		"derbis": derbis,
		"selecciones": _selecciones_de_hoy(),
		"competiciones": _comps_de_hoy(),
		"ligas": _ligas_de_hoy(),
	}



	var tecnicos: Dictionary = CoachEdits.bloque_clubes()
	if not country.is_empty():
		for tid in tecnicos.keys():
			if Teams.country_of(String(tid)) != country:
				tecnicos.erase(tid)
	if not tecnicos.is_empty():
		pack["tecnicos"] = tecnicos
	if not CoachEdits.libres().is_empty() and country.is_empty():
		pack["tecnicos_libres"] = CoachEdits.bloque_libres()


	var selec: Dictionary = CoachEdits.bloque_selecciones()
	if not selec.is_empty() and country.is_empty():
		pack["seleccionadores"] = selec


	var caras_leyenda: Dictionary = LegendEdits.bloque_pack()
	if not caras_leyenda.is_empty() and country.is_empty():
		pack["leyendas"] = caras_leyenda
	DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(path.get_base_dir()))
	var f: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	if f == null:
		info["error"] = I18n.t("no se pudo escribir")
		return info



	f.store_string(JSON.stringify(pack, "\t"))
	f.close()
	info["ok"] = true
	return info




static func _ficha_club(club: Dictionary) -> Dictionary:
	var out: Dictionary = {
		"name": String(club.get("name", "")),
		"abbrev": String(club.get("abbrev", "")),
	}
	for k in TeamEdits.COLOR_KEYS:
		if club.has(k) and club[k] is Color:
			out[k] =(club[k] as Color).to_html(false)




	var rasgos: Dictionary = CrestView.traits_of(club)
	for k in ["shape", "crest_pattern", "crest_tone", "emblem", "rim"]:
		out[k] = String(rasgos.get(k, ""))
	if club.has("pattern"):
		out["pattern"] = String(club["pattern"])



	var marca: String = String(club.get("sponsor", ""))
	if not marca.is_empty():
		out["sponsor"] = marca



	var fab: String = String(club.get("brand", ""))
	if not fab.is_empty():
		out["brand"] = fab
	return out














static func _avisa_si_medio_apartado() -> void:
	var capas: Dictionary = {
		"TeamEdits": TeamEdits.SAVE_PATH_BASE,
		"SquadEdits": SquadEdits.SAVE_PATH_BASE,
		"CompEdits": CompEdits.SAVE_PATH_BASE,
		"CrestLogos": CrestLogos.DIR_BASE,
		"CompLogos": CompLogos.DIR_BASE,
		"SponsorLogos": SponsorLogos.DIR_BASE,
		"CoachEdits": CoachEdits.SAVE_PATH_BASE,
	}
	var sueltas: Array[String] = []
	var apartadas: int = 0
	for nombre in capas:
		if ToolStash.apartada(String(capas[nombre])):
			apartadas += 1
		else:
			sueltas.append(String(nombre))
	if apartadas > 0 and not sueltas.is_empty():
		push_error(("PackImport.clear_all con %d capas apartadas y %d SUELTAS (%s): "
			+ "una herramienta va a borrar datos reales del usuario. Apártalas todas.")
			% [apartadas, sueltas.size(), ", ".join(sueltas)])





static func _ficha_jugador(p: Dictionary, meta: Dictionary = {},
		team_id: String = "") -> Dictionary:
	var out: Dictionary = {"name": String(p.get("name", "")),
		"pos": String(p.get("pos", "MC")), "number": int(p.get("number", 0))}
	for k in SquadEdits.STAT_KEYS:
		if p.has(k):
			out[k] = int(p[k])
	var age: Variant = p.get("age", meta.get("age", null))
	if age != null:
		out["age"] = int(age)
	var nation: String = String(p.get("nation", meta.get("nation", "")))
	if not nation.is_empty():
		out["nation"] = nation






	if p.has("contract"):
		out["contract"] = int(p["contract"])


	if not team_id.is_empty():
		var tray: Array = TransferBook.carrera_a_pack(p.get("carrera", null),
			int(p.get("etapa_desde", 0)), team_id)
		if not tray.is_empty():
			out["carrera"] = tray
	return out














static func _selecciones_de_hoy() -> Dictionary:
	var out: Dictionary = {}
	for n in Nations.POOL:
		var nombre: String = Nations.name_of(String((n as Dictionary).get("id", "")))
		if nombre.is_empty() or out.has(nombre):
			continue
		out[nombre] = {"nombre": Stadiums.nation_venue(nombre),
			"planta": Stadiums.nation_footprint(nombre)}




		var ders: Array = NationEdits.derbis_of(String((n as Dictionary).get("id", "")))
		if ders.size() == 1:
			(out[nombre] as Dictionary)["derbi"] = Nations.name_of(String(ders[0]))
		elif ders.size() > 1:
			var nombres: Array = []
			for d in ders:
				nombres.append(Nations.name_of(String(d)))
			(out[nombre] as Dictionary)["derbi"] = nombres
	return out


static func _comps_de_hoy() -> Dictionary:
	var out: Dictionary = {}
	for comp_id in Competitions.COMP_NAME:
		var id: String = String(comp_id)
		out[id] = _fila_comp(Competitions.comp_name(id), CompEdits.comp_color(id))




	for t in Competitions.trofeos():
		var tid: String = String(t[0])
		var fila: Variant = _fila_comp(Competitions.trofeo_nombre(String(t[1]), String(t[2])),
			CompEdits.comp_color(tid))
		var pat: String = Competitions.trofeo_patrocinador(String(t[1]), String(t[2]))
		if not pat.is_empty():
			fila = fila if fila is Dictionary else {"name": fila}
			(fila as Dictionary)["patrocinador"] = pat
		out[tid] = fila
	return out


static func _ligas_de_hoy() -> Dictionary:
	var out: Dictionary = {}
	for country in Competitions.LEAGUE_NAME:
		var c: String = String(country)
		out[c] = _fila_comp(Competitions.league_brand(c), CompEdits.league_color(c))





	for country in Competitions.LEAGUE_CODE.keys() + Competitions.TROFEO_CODIGO_EXTRA.keys():
		for div in [1, 2, 3]:
			var llave: String = Competitions.liga_llave(String(country), div)
			if not out.has(llave) and not CompEdits.league(llave).is_empty():
				out[llave] = _fila_comp(CompEdits.league(llave), CompEdits.league_color(llave))
	return out


static func _fila_comp(nombre: String, color: Color) -> Variant:
	if color.a <= 0.0:
		return nombre
	return {"name": nombre, "color": "#" + color.to_html(false)}





static func clear_all() -> void:
	_avisa_si_medio_apartado()



	Career.fija_huella_asientos()
	TeamEdits.clear_all()
	VenueEdits.clear_all()



	for nid in NationEdits.derbis().keys():
		NationEdits.clear_derbi(String(nid))
	CoachEdits.clear_all()


	LegendEdits.clear_pack()
	SquadEdits.reset_all()



	RosterDelta.clear_base()
	CrestLogos.clear_all()
	CompEdits.clear_all()
	CompLogos.clear_all()
	SponsorLogos.clear_all()








	KitBrands.clear_all()
	Career.reancla_asientos()






static func available() -> Array[String]:
	var out: Array[String] = []
	for dir in ["user://", "user://packs"]:
		var d: DirAccess = DirAccess.open(dir)
		if d == null:
			continue
		for name in d.get_files():
			if String(name).to_lower().ends_with(".json") and not _es_del_juego(String(name)):
				out.append("%s/%s" % [dir.trim_suffix("/"), name])
	out.sort()
	return out




static func _es_del_juego(name: String) -> bool:
	return name.begins_with("team_edits") or name.begins_with("squad_edits") \
			or name.begins_with("comp_edits") \
			or name.begins_with("save") or name.begins_with("settings")


static func _run(path: String, escribir: bool) -> Dictionary:
	var info: Dictionary = {"ok": false, "error": "", "nombre": "",
		"clubes": 0, "jugadores": 0, "logos": 0, "torneos": 0,
		"ignorados": 0, "avisos": [],






		"sillas": 0, "sin_cubrir": 0}
	if not FileAccess.file_exists(path):
		info["error"] = I18n.t("no se encontró el archivo")
		return info
	var f: FileAccess = FileAccess.open(path, FileAccess.READ)
	if f == null:
		info["error"] = I18n.t("no se pudo abrir el archivo")
		return info
	if f.get_length() > MAX_FILE_BYTES:
		info["error"] = I18n.tf("el archivo pesa más de {0} MB", [MAX_FILE_BYTES / 1048576])
		return info
	var parsed: Variant = JSON.parse_string(f.get_as_text())
	f.close()
	if not (parsed is Dictionary):
		info["error"] = I18n.t("el archivo no es un JSON válido")
		return info
	var pack: Dictionary = parsed
	if int(pack.get("format", 0)) != FORMAT:
		info["error"] = I18n.tf("formato {0}: este juego lee el {1}", [
			str(pack.get("format", "?")), FORMAT])
		return info
	info["nombre"] = String(pack.get("nombre", "")).substr(0, 40)






	if escribir:

		Career.fija_huella_asientos()
		TeamEdits.begin_batch()
		SquadEdits.begin_batch()



	var de_carpeta: Dictionary = {}
	_escudos_de_carpeta(path, escribir, info, de_carpeta)
	_equipos(pack.get("equipos", {}), escribir, info, de_carpeta)


	_formaciones(pack.get("formaciones", {}), escribir, info)
	_plantillas(pack.get("plantillas", {}), pack.get("asientos", {}), escribir, info)
	var vacios: Dictionary = info.get("_vacios", {})
	info.erase("_vacios")
	for pais in vacios:
		_aviso(info, I18n.tf("{0}: {1} clubes sin jugadores en el pack (se quedan los del juego)",
			[I18n.t(String(pais)), int(vacios[pais])]))
	_estadios(pack.get("estadios", {}), escribir, info)
	_derbis(pack.get("derbis", {}), escribir, info)
	_selecciones(pack.get("selecciones", {}), escribir, info)
	_tecnicos(pack.get("tecnicos", {}), pack.get("tecnicos_libres", null),
		pack.get("seleccionadores", {}), escribir, info)
	_leyendas(pack.get("leyendas", {}), escribir, info)
	_divisiones(pack.get("cambios_division", []), escribir, info)
	_competiciones(pack.get("competiciones", {}), pack.get("ligas", {}), escribir, info)



	_patrocinadores(pack.get("patrocinadores", {}), escribir, info)
	_marcas_deportivas(pack.get("marcas_deportivas", {}), escribir, info)
	if escribir:
		SquadEdits.end_batch()
		TeamEdits.end_batch()
		CrestLogos.invalidate()
		Teams.reset_cache()


		Squad.invalidate()
		CompEdits.invalidate()
		CompLogos.invalidate()
		SponsorLogos.invalidate()
		KitBrands.invalidate()






		KitDeals.invalidate()






		info["fichajes_realineados"] = TransferBook.remap_to_pack()



		Career.reancla_asientos()
	info["ok"] = true
	return info






const FORMA_DEL_EDITOR: Dictionary = {
	"4-3-3 EX": "4-1-2-3", "4-1-4-1": "4-5-1", "4-4-2 rombo": "4-3-1-2",
	"4-4-2 (2)": "4-4-2", "4-2-4": "4-4-2", "3-4-2-1": "3-4-1-2",
	"5-4-1": "5-3-2", "5-2-3": "5-3-2", "5-2-1-2": "5-3-2",
}








static func _formaciones(raw: Variant, escribir: bool, info: Dictionary) -> void:
	if not (raw is Dictionary):
		return
	for id_v in (raw as Dictionary):
		var team_id: String = _canon(String(id_v), raw as Dictionary)
		if team_id.is_empty() or Teams.by_id(team_id).is_empty():
			continue
		var nombre: String = String((raw as Dictionary)[id_v]).strip_edges()
		var forma: String = String(FORMA_DEL_EDITOR.get(nombre, nombre))
		if not Squad.FORMATIONS.has(forma):
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("formación desconocida: {0}", [nombre]))
			continue
		if escribir:
			TeamEdits.set_fields(team_id, {"formacion": forma})







static func _equipos(raw: Variant, escribir: bool, info: Dictionary,
		de_carpeta: Dictionary = {}) -> void:
	if not (raw is Dictionary):
		return
	for id_v in (raw as Dictionary):
		var team_id: String = _canon(String(id_v), raw as Dictionary)
		if team_id.is_empty():
			continue
		var fields_v: Variant =(raw as Dictionary)[id_v]
		if not (fields_v is Dictionary):
			continue
		if Teams.by_id(team_id).is_empty():
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("club desconocido: {0}", [team_id]))
			continue
		var fields: Dictionary =(fields_v as Dictionary).duplicate()
		var logo_b64: String = String(fields.get("logo_png", ""))
		fields.erase("logo_png")
		if not fields.is_empty():
			info["clubes"] = int(info["clubes"]) + 1
			if escribir:
				TeamEdits.set_fields(team_id, fields)
		if logo_b64.is_empty() or de_carpeta.has(team_id):
			continue




		var motivo: String = _logo(team_id, logo_b64, escribir)
		if motivo.is_empty():
			info["logos"] = int(info["logos"]) + 1
		else:
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("logo de {0}: {1}", [team_id, motivo]))












static func _escudos_de_carpeta(pack_path: String, escribir: bool, info: Dictionary,
		hechos: Dictionary) -> void:
	var dir_path: String = ""
	for cand in [pack_path.get_basename() + ".escudos",
			pack_path.get_base_dir().trim_suffix("/") + "/escudos"]:
		if DirAccess.dir_exists_absolute(ProjectSettings.globalize_path(cand)):
			dir_path = cand
			break
	if dir_path.is_empty():
		return
	var d: DirAccess = DirAccess.open(dir_path)
	if d == null:
		return


	var presentes: Dictionary = {}
	for nombre in d.get_files():
		presentes[String(nombre).get_basename()] = true
	for nombre in d.get_files():
		var fn: String = String(nombre)
		if not fn.to_lower().ends_with(".png"):
			continue
		var team_id: String = _canon(fn.get_basename(), presentes)
		if team_id.is_empty():
			continue










		var es_nacion: bool = team_id.begins_with(CrestLogos.NAT_PREFIJO)
		var id_real: String = team_id.substr(CrestLogos.NAT_PREFIJO.length()) \
				if es_nacion else team_id
		if (Nations.by_id(id_real).is_empty() if es_nacion
				else Teams.by_id(id_real).is_empty()):
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("club desconocido: {0}", [team_id]))
			continue
		var f: FileAccess = FileAccess.open("%s/%s" % [dir_path.trim_suffix("/"), fn],
			FileAccess.READ)
		if f == null:
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("logo de {0}: {1}", [team_id, I18n.t("no se pudo abrir el archivo")]))
			continue


		var bytes: PackedByteArray = f.get_buffer(f.get_length())
		f.close()
		var motivo: String = _guardar_logo(team_id, bytes, escribir)
		if motivo.is_empty():
			info["logos"] = int(info["logos"]) + 1
			hechos[team_id] = true
		else:
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("logo de {0}: {1}", [team_id, motivo]))








static func _guardar_logo(team_id: String, bytes: PackedByteArray,
		escribir: bool, comp: bool = false, marca: bool = false) -> String:
	if not escribir:
		if bytes.size() > CrestLogos.MAX_BYTES:
			return I18n.tf("pesa {0} KB (tope {1})", [bytes.size() / 1024,
				CrestLogos.MAX_BYTES / 1024])
		var img: Image = Image.new()
		if img.load_png_from_buffer(bytes) != OK:
			return I18n.t("no es un PNG válido")
		if img.get_width() > CrestLogos.MAX_PX or img.get_height() > CrestLogos.MAX_PX:
			return I18n.tf("{0}x{1} (tope {2}x{3})", [img.get_width(), img.get_height(),
				CrestLogos.MAX_PX, CrestLogos.MAX_PX])
		return ""
	if marca:
		return SponsorLogos.set_png(team_id, bytes)
	return CompLogos.set_png(team_id, bytes) if comp \
			else CrestLogos.set_png(team_id, bytes)







static func _b64_a_bytes(b64: String) -> PackedByteArray:


	var limpio: String = b64
	var coma: int = limpio.find(",")
	if limpio.begins_with("data:") and coma > 0:
		limpio = limpio.substr(coma + 1)
	limpio = limpio.strip_edges()




	if limpio.is_empty() or not _es_base64(limpio):
		return PackedByteArray()
	return Marshalls.base64_to_raw(limpio)


static func _logo(team_id: String, b64: String, escribir: bool,
		comp: bool = false, marca: bool = false) -> String:
	var bytes: PackedByteArray = _b64_a_bytes(b64)
	if bytes.is_empty():
		return I18n.t("base64 ilegible")


	return _guardar_logo(team_id, bytes, escribir, comp, marca)














static func _fila_completa(fila: Dictionary) -> bool:
	if not fila.has("name") or not fila.has("pos") or not fila.has("number"):
		return false
	if not fila.has("age") or not fila.has("nation"):
		return false
	for k in SquadEdits.STAT_KEYS:
		if not fila.has(k):
			return false
	return true






static func _plantillas(raw: Variant, asientos_v: Variant, escribir: bool,
		info: Dictionary) -> void:
	if not (raw is Dictionary):
		return
	var asientos: Dictionary = asientos_v if asientos_v is Dictionary else {}
	var heredadas: Dictionary = _caras_heredadas(raw as Dictionary) if escribir else {}
	for id_v in (raw as Dictionary):
		var team_id: String = _canon(String(id_v), raw as Dictionary)
		if team_id.is_empty():
			continue
		var lista_v: Variant =(raw as Dictionary)[id_v]
		if not (lista_v is Array):
			continue
		if Teams.by_id(team_id).is_empty():
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("club desconocido: {0}", [team_id]))
			continue



		var sillas: int = -1

		if escribir and asientos.has(team_id) and not (lista_v as Array).is_empty():
			sillas = _ajusta_asientos(team_id, int(asientos[team_id]), lista_v, info)








		if sillas < 0 and (escribir or not asientos.has(team_id)):
			sillas = Squad.seats_of(team_id)




		if not escribir and asientos.has(team_id):
			sillas = clampi(int(asientos[team_id]), RosterDelta.MIN_SEATS,
				RosterDelta.MAX_SEATS)














		var bases: Array = []
		var falta_alguna: bool = false
		if escribir:
			for f in (lista_v as Array):
				if not (f is Dictionary) or String((f as Dictionary).get("name", "")).is_empty():
					continue
				if not _fila_completa(f as Dictionary):
					falta_alguna = true
					break
			if falta_alguna:







				sillas = Squad.of(team_id).size()
				bases = SquadEdits.effective_full_all(team_id)
		var lista: Array = lista_v
		info["sillas"] = int(info.get("sillas", 0)) + sillas
		if lista.size() > sillas:
			_aviso(info, I18n.tf("{0} trae {1} jugadores y hay {2} asientos", [
				team_id, lista.size(), sillas]))






		elif lista.size() < sillas:
			var faltan: int = sillas - lista.size()
			info["sin_cubrir"] = int(info.get("sin_cubrir", 0)) + faltan






			if lista.is_empty():
				var vacios: Dictionary = info.get("_vacios", {})
				var pais: String = Teams.country_of(team_id)
				vacios[pais] = int(vacios.get(pais, 0)) + 1
				info["_vacios"] = vacios
			else:
				_aviso(info, I18n.tf("{0} trae {1} jugadores para {2} asientos: {3} sin cubrir",
					[team_id, lista.size(), sillas, faltan]))



		var fuerza: Dictionary = _candado_puestos(team_id, lista, sillas, info) \
				if escribir else {}
		for i in mini(lista.size(), sillas):
			var p: Variant = lista[i]
			if not (p is Dictionary) or String((p as Dictionary).get("name", "")).is_empty():



				info["sin_cubrir"] = int(info.get("sin_cubrir", 0)) + 1
				continue
			info["jugadores"] = int(info["jugadores"]) + 1
			if escribir:
				var fila: Dictionary = p as Dictionary
				if _fila_completa(fila):









					var directo: Dictionary = fila.duplicate()
					var lk: Variant = SquadEdits.raw_look(team_id, i)
					if lk != null and not directo.has("look"):
						directo["look"] = lk
					_hereda_cara(directo, heredadas, team_id, i)
					if fuerza.has(i):
						directo["pos"] = fuerza[i]
						directo.erase("poss")
					SquadEdits.set_slot(team_id, i, directo)
					continue








				var base: Dictionary =(bases[i] as Dictionary).duplicate() \
						if i < bases.size() else SquadEdits.effective_full(team_id, i)
				base.merge(fila, true)
				_hereda_cara(base, heredadas, team_id, i)
				if fuerza.has(i):
					base["pos"] = fuerza[i]
					base.erase("poss")
				SquadEdits.set_slot(team_id, i, base)
		if lista.size() > sillas:
			info["ignorados"] = int(info["ignorados"]) +(lista.size() - sillas)



















static func _caras_heredadas(raw: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	var todo_decodificado: bool = false
	for id_v in raw:
		var lista_v: Variant = raw[id_v]
		if not (lista_v is Array):
			continue
		var team_id: String = _canon(String(id_v), raw)
		if team_id.is_empty():
			continue
		for i in (lista_v as Array).size():
			var f: Variant =(lista_v as Array)[i]
			if not (f is Dictionary):
				continue
			var fila: Dictionary = f
			var origen: String = String(fila.get("cara_de", "")).strip_edges()
			if origen.is_empty() or origen == String(fila.get("name", "")):
				continue
			var lk: Variant = fila.get("look", null)
			if lk is Dictionary and not (lk as Dictionary).is_empty():
				continue
			WorldDB.asegura(team_id)





			if not PlayerLooks.es_del_mundo(origen) and not todo_decodificado:
				todo_decodificado = true
				for t in Teams.all():
					WorldDB.asegura(String((t as Dictionary).get("id", "")))
			var nat: String = String(fila.get("nation", ""))
			if not nat.is_empty():
				PlayerNations.register(origen, Nations.canon_id(nat))
			out["%s|%d" % [team_id, i]] = KitRecolor.traits_for(origen)
	return out





static func _hereda_cara(ficha: Dictionary, heredadas: Dictionary, team_id: String,
		i: int) -> void:
	var clave: String = "%s|%d" % [team_id, i]
	if not heredadas.has(clave):
		return
	var lk: Variant = ficha.get("look", null)
	if lk is Dictionary and not (lk as Dictionary).is_empty():
		return
	ficha["look"] = heredadas[clave]
















































static func _derbis(raw: Variant, escribir: bool, info: Dictionary) -> void:
	if not (raw is Dictionary):
		return






	var listas: Dictionary = {}
	for id_v in (raw as Dictionary):
		var a: String = _canon(String(id_v), raw as Dictionary)
		if a.is_empty() or Teams.by_id(a).is_empty():
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("derbi con club desconocido: {0}", [String(id_v)]))
			continue
		var v: Variant =(raw as Dictionary)[id_v]
		var crudos: Array =(v as Array) if v is Array else [v]
		var mios: Array = listas.get(a, [])
		for r in crudos:
			var b: String = _canon(String(r), {})
			if b.is_empty() or a == b or Teams.by_id(b).is_empty():
				info["ignorados"] = int(info["ignorados"]) + 1
				_aviso(info, I18n.tf("derbi con club desconocido: {0}", [String(id_v)]))
				continue
			if Teams.country_of(a) != Teams.country_of(b):
				info["ignorados"] = int(info["ignorados"]) + 1
				_aviso(info, I18n.tf("derbi entre países distintos: {0}", [String(id_v)]))
				continue
			if not mios.has(b):
				mios.append(b)
		listas[a] = mios
	var parejas: int = _reciproca_y_topa(listas, info)
	if parejas == 0:
		return
	info["derbis"] = int(info.get("derbis", 0)) + parejas
	if not escribir:
		return



	for a in listas:
		TeamEdits.clear_derbi(String(a))
	for a in listas:
		if not (listas[a] as Array).is_empty():
			TeamEdits.set_fields(String(a), {TeamEdits.DERBI_KEY: listas[a]})
	Rivalries.reset_cache()






static func _reciproca_y_topa(listas: Dictionary, info: Dictionary) -> int:
	var ids: Array = listas.keys()
	for a in ids:
		for b in (listas[a] as Array):
			var vuelta: Array = listas.get(b, [])
			if not vuelta.has(a):
				vuelta.append(a)
			listas[b] = vuelta
	var sobran: Array = []
	for a in listas:
		var lista: Array = listas[a]
		if lista.size() > TeamEdits.MAX_DERBIS:
			sobran.append(String(a))
			for b in lista.slice(TeamEdits.MAX_DERBIS):
				(listas[b] as Array).erase(a)
			listas[a] = lista.slice(0, TeamEdits.MAX_DERBIS)
	for a in sobran:
		info["ignorados"] = int(info["ignorados"]) + 1
		_aviso(info, I18n.tf("demasiados derbis para: {0}", [a]))


	var parejas: int = 0
	for a in listas:
		var limpia: Array = []
		for b in (listas[a] as Array):
			if (listas.get(b, []) as Array).has(a):
				limpia.append(b)
				if String(a) < String(b):
					parejas += 1
		listas[a] = limpia
	return parejas


static func _estadios(raw: Variant, escribir: bool, info: Dictionary) -> void:
	if not (raw is Dictionary):
		return
	for id_v in (raw as Dictionary):
		var team_id: String = _canon(String(id_v), raw as Dictionary)
		if team_id.is_empty():
			continue
		if Teams.by_id(team_id).is_empty():
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("club desconocido: {0}", [team_id]))
			continue
		var fila: Variant =(raw as Dictionary)[id_v]
		var campos: Dictionary = {}
		if fila is String:
			campos["estadio"] = String(fila)
		elif fila is Dictionary:
			if (fila as Dictionary).has("nombre"):
				campos["estadio"] = String((fila as Dictionary)["nombre"])
			var planta: String = String((fila as Dictionary).get("planta", ""))
			if not planta.is_empty():
				if Stadiums.ALL_FOOTPRINTS.has(planta):
					campos["planta"] = planta
				else:
					info["ignorados"] = int(info["ignorados"]) + 1
					_aviso(info, I18n.tf("planta desconocida: {0}", [planta]))
		if campos.is_empty():
			continue
		info["estadios"] = int(info.get("estadios", 0)) + 1
		if escribir:
			TeamEdits.set_fields(team_id, campos)































static func _tecnicos(raw_c: Variant, raw_l: Variant, raw_s: Variant, escribir: bool,
		info: Dictionary) -> void:
	var buenos: Dictionary = {}
	if raw_c is Dictionary:
		for id_v in (raw_c as Dictionary):
			var team_id: String = _canon(String(id_v), raw_c as Dictionary)
			if team_id.is_empty():
				continue
			if Teams.by_id(team_id).is_empty():
				info["ignorados"] = int(info["ignorados"]) + 1
				_aviso(info, I18n.tf("club desconocido: {0}", [team_id]))
				continue
			if CoachEdits.sanea((raw_c as Dictionary)[id_v]).is_empty():
				info["ignorados"] = int(info["ignorados"]) + 1
				continue
			buenos[team_id] =(raw_c as Dictionary)[id_v]
	var libres: Variant = null
	if raw_l is Array:
		libres = []
		for v in (raw_l as Array):
			var club: String = String((v as Dictionary).get("club", "")) if v is Dictionary else ""
			club = _canon(club, {}) if not club.is_empty() else ""
			if club.is_empty() or Teams.by_id(club).is_empty() or CoachEdits.sanea(v).is_empty():
				info["ignorados"] = int(info["ignorados"]) + 1
				continue
			var fila: Dictionary =(v as Dictionary).duplicate()
			fila["club"] = club
			(libres as Array).append(fila)
	var selec: Dictionary = {}
	if raw_s is Dictionary:
		for pais_v in (raw_s as Dictionary):


			var pais: String = Nations.canon_id(String(pais_v).strip_edges())
			if pais.is_empty() or Nations.by_id(pais).is_empty():
				info["ignorados"] = int(info["ignorados"]) + 1
				_aviso(info, I18n.tf("país desconocido: {0}", [String(pais_v)]))
				continue
			if CoachEdits.sanea((raw_s as Dictionary)[pais_v]).is_empty():
				info["ignorados"] = int(info["ignorados"]) + 1
				continue
			selec[pais] =(raw_s as Dictionary)[pais_v]
	info["tecnicos"] = buenos.size()
	info["tecnicos_libres"] = mini((libres as Array).size(), CoachEdits.LIBRES_MAX) \
			if libres is Array else 0
	info["seleccionadores"] = selec.size()
	if escribir and (not buenos.is_empty() or libres is Array or not selec.is_empty()):
		CoachEdits.aplica(buenos, libres, selec)
		Coaches.bump()























static func _leyendas(raw: Variant, escribir: bool, info: Dictionary) -> void:
	info["leyendas"] = 0
	if not (raw is Dictionary):
		return
	var buenas: Dictionary = {}
	for k in (raw as Dictionary):
		var nombre: String = String(k).strip_edges()
		if nombre.is_empty():
			continue
		if not Legends.es_clave(nombre):
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("leyenda desconocida: {0}", [nombre]))
			continue
		buenas[nombre] =(raw as Dictionary)[k]
	info["leyendas"] = buenas.size()
	if escribir:
		LegendEdits.aplica_pack(buenas)



















static func _selecciones(raw: Variant, escribir: bool, info: Dictionary) -> void:
	if not (raw is Dictionary):
		return
	var validos: Dictionary = {}
	for n in Nations.POOL:
		validos[Nations.name_of(String((n as Dictionary).get("id", "")))] = true
	var derbis_listas: Dictionary = {}
	for pais_v in (raw as Dictionary):
		var pais: String = String(pais_v)
		if not validos.has(pais):
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("club desconocido: {0}", [pais]))
			continue
		var fila: Variant =(raw as Dictionary)[pais_v]
		var campos: Dictionary = {}
		if fila is String:
			campos["nombre"] = String(fila)
		elif fila is Dictionary:
			if (fila as Dictionary).has("nombre"):
				campos["nombre"] = String((fila as Dictionary)["nombre"])
			var planta: String = String((fila as Dictionary).get("planta", ""))
			if not planta.is_empty():
				if Stadiums.ALL_FOOTPRINTS.has(planta):
					campos["planta"] = planta
				else:
					info["ignorados"] = int(info["ignorados"]) + 1
					_aviso(info, I18n.tf("planta desconocida: {0}", [planta]))



			var der_v: Variant =(fila as Dictionary).get("derbi", null)
			if der_v != null:
				var a: String = Nations.canon_id(pais)
				var crudos: Array =(der_v as Array) if der_v is Array else [der_v]
				var mios: Array = derbis_listas.get(a, [])
				for r in crudos:
					var der: String = String(r).strip_edges()
					if der.is_empty():
						continue
					var b: String = Nations.canon_id(der)
					if Nations.by_id(b).is_empty():
						info["ignorados"] = int(info["ignorados"]) + 1
						_aviso(info, I18n.tf("derbi con selección desconocida: {0}", [der]))
						continue
					if a == b:
						info["ignorados"] = int(info["ignorados"]) + 1
						_aviso(info, I18n.tf("derbi consigo misma: {0}", [pais]))
						continue
					if not mios.has(b):
						mios.append(b)
				derbis_listas[a] = mios
		if campos.is_empty():
			continue
		info["estadios"] = int(info.get("estadios", 0)) + 1
		if escribir:
			VenueEdits.set_fields(pais, campos)
	var parejas: int = _reciproca_y_topa(derbis_listas, info)
	if parejas == 0:
		return
	info["derbis"] = int(info.get("derbis", 0)) + parejas
	if not escribir:
		return
	for a in derbis_listas:
		NationEdits.clear_derbi(String(a))
	for a in derbis_listas:
		if not (derbis_listas[a] as Array).is_empty():
			NationEdits.set_fields(String(a), {NationEdits.DERBI_KEY: derbis_listas[a]})
	Rivalries.reset_cache()


static func _divisiones(raw: Variant, escribir: bool, info: Dictionary) -> void:
	if not (raw is Array):
		return
	for par_v in (raw as Array):
		if not (par_v is Array) or (par_v as Array).size() != 2:
			continue
		var par: Array = par_v
		var a: String = String(par[0])
		var b: String = String(par[1])
		if not escribir:
			info["divisiones"] = int(info.get("divisiones", 0)) + 1
			continue
		if TeamEdits.swap_div(a, b):
			info["divisiones"] = int(info.get("divisiones", 0)) + 1
		else:
			info["ignorados"] = int(info["ignorados"]) + 1
			_aviso(info, I18n.tf("no se pudo cruzar {0} con {1} (¿mismo país? ¿misma división?)", [a, b]))






static func _planta_base(team_id: String) -> Array:
	var planta: Array = Squad.factory_of(team_id)
	RosterDelta.apply(team_id, planta, true)
	SquadEdits.apply(team_id, planta)
	return planta







static func _pos_de_fila(lista: Array, k: int) -> String:
	if k < 0 or k >= lista.size() or not (lista[k] is Dictionary):
		return ""
	var f: Dictionary = lista[k]
	if String(f.get("name", "")).is_empty() or not f.has("pos"):
		return ""
	return SquadEdits.pos_canon(f["pos"])





static func _puestos_tras_pack(planta: Array, lista: Array) -> Array:
	var out: Array = []
	for k in planta.size():
		var p: String = _pos_de_fila(lista, k)
		if p.is_empty():
			p = String((planta[k] as Dictionary).get("pos", ""))
		out.append({"pos": p})
	return out



















static func _candado_puestos(team_id: String, lista: Array, sillas: int,
		info: Dictionary) -> Dictionary:
	var n: int = mini(lista.size(), sillas)
	var faltan: Array[String] = []
	for p in SquadEdits.PROTECTED_POS:
		var hay: bool = false
		for k in n:
			if _pos_de_fila(lista, k) == p:
				hay = true
				break
		if not hay:
			faltan.append(p)
	if faltan.is_empty() or n <= 0:
		return {}
	var planta: Array = _planta_base(team_id)
	var tras: Array = _puestos_tras_pack(planta, lista).slice(0, sillas)
	var out: Dictionary = {}
	for p in faltan:
		if Squad.cuenta_pos(tras, p) > 0:
			continue
		var k_fija: int = -1
		for k in mini(n, planta.size()):
			if String((planta[k] as Dictionary).get("pos", "")) == p and not out.has(k):
				k_fija = k
				break
		if k_fija < 0:
			k_fija = 0 if not out.has(0) else -1
		if k_fija < 0:
			continue
		out[k_fija] = p
		(tras[k_fija] as Dictionary)["pos"] = p
		_aviso(info, I18n.tf("{0}: el asiento {1} se queda de {2} (el pack lo dejaba sin ninguno)",
			[team_id, k_fija, p]))
	return out





















static func _ajusta_asientos(team_id: String, pedidos: int, lista_v: Variant,
		info: Dictionary) -> int:
	var lista: Array = lista_v if lista_v is Array else []
	var meta: int = clampi(pedidos, RosterDelta.MIN_SEATS, RosterDelta.MAX_SEATS)
	if meta != pedidos:
		_aviso(info, I18n.tf("{0} pide {1} asientos y el juego admite de {2} a {3}", [
			team_id, pedidos, RosterDelta.MIN_SEATS, RosterDelta.MAX_SEATS]))




	var sillas: int = Squad.seats_of(team_id)
	if sillas == meta:
		return sillas
	while sillas < meta:
		var fila: Dictionary = lista[sillas] if sillas < lista.size() \
				and lista[sillas] is Dictionary else {}
		if RosterDelta.add_seat(team_id, String(fila.get("pos", "MC")),
				int(fila.get("number", SquadEdits.NUM_MIN)), fila, true, sillas) < 0:
			break
		sillas += 1




















	var planta: Array = []
	var tras: Array = []
	if sillas > meta:
		planta = _planta_base(team_id)
		tras = _puestos_tras_pack(planta, lista)
	while sillas > meta:
		var pos_fin: String = String((planta[sillas - 1] as Dictionary).get("pos", "")) \
				if sillas - 1 < planta.size() else ""
		if SquadEdits.PROTECTED_POS.has(pos_fin) \
				and Squad.cuenta_pos(tras.slice(0, sillas - 1), pos_fin) == 0:
			_aviso(info, I18n.tf("{0} se queda en {1} asientos: el último es su único {2}", [
				team_id, sillas, pos_fin]))
			break
		if not RosterDelta.drop_seat(team_id, sillas - 1, true, sillas):
			break
		SquadEdits.drop_seat(team_id, sillas - 1)
		TransferBook.drop_seat(team_id, sillas - 1)
		CareerEdits.drop_seat(team_id, sillas - 1)
		sillas -= 1



	SquadEdits.flush()
	Squad.invalidate()


	Squad.invalidate_formaciones()
	NatTeam.invalidate_candidates()
	info["asientos"] = int(info.get("asientos", 0)) + 1
	return sillas
















static var _re_b64: RegEx = null


static func _es_base64(s: String) -> bool:
	if s.length() % 4 != 0:
		return false
	if _re_b64 == null:
		_re_b64 = RegEx.new()
		_re_b64.compile("^[A-Za-z0-9+/]*={0,2}$")
	return _re_b64.search(s) != null










static func _competiciones(comps: Variant, ligas: Variant, escribir: bool,
		info: Dictionary) -> void:
	var c: Dictionary = comps if comps is Dictionary else {}
	var l: Dictionary = ligas if ligas is Dictionary else {}
	if c.is_empty() and l.is_empty():
		return
	info["torneos"] = CompEdits.set_all(c, l) if escribir \
			else CompEdits.would_set(c, l)





	var logos: int = 0
	for par in [[c, false], [l, true]]:
		var origen: Dictionary = par[0]
		for k in origen:
			if not (origen[k] is Dictionary):
				continue
			var b64: String = String((origen[k] as Dictionary).get("logo_png", ""))
			if b64.is_empty():
				continue





			var tipo: String = Competitions.league_logo_llave(String(k)) if bool(par[1]) \
					else Competitions.comp_logo(String(k))









			var pais_ok: bool = not bool(par[1]) or Competitions.LEAGUE_CODE.has(
				String(Competitions.liga_de_llave(String(k))[0]))
			if TeamEdits.id_de_archivo(tipo) != tipo or not pais_ok:
				_aviso(info, I18n.tf("logo de {0}: {1}", [String(k),
					I18n.t("competición desconocida")]))
				continue
			var motivo: String = _logo(tipo, b64, escribir, true)
			if motivo.is_empty():
				logos += 1
			else:
				_aviso(info, I18n.tf("logo de {0}: {1}", [String(k), motivo]))
	if logos > 0:
		info["logos_comp"] = logos









static func _patrocinadores(raw: Variant, escribir: bool, info: Dictionary) -> void:
	if not (raw is Dictionary):
		return
	var marcas: Dictionary = raw
	var puestas: int = 0
	for k in marcas:
		var fila: Variant = marcas[k]
		if not (fila is Dictionary):
			continue




		var id: String = TeamEdits.id_de_archivo(String(k))
		if id.is_empty():
			_aviso(info, I18n.tf("marca {0}: {1}", [String(k), I18n.t("marca desconocida")]))
			continue






		if escribir:
			SponsorLogos.set_nombre(id,
				String((fila as Dictionary).get("name", "")))
		var b64: String = String((fila as Dictionary).get("logo_png", ""))
		if b64.is_empty():
			continue
		var motivo: String = _logo(id, b64, escribir, false, true)
		if motivo.is_empty():
			puestas += 1
		else:
			_aviso(info, I18n.tf("marca {0}: {1}", [String(k), motivo]))
	if puestas > 0:
		info["marcas"] = puestas

















static func _marcas_deportivas(raw: Variant, escribir: bool, info: Dictionary) -> void:
	if not (raw is Dictionary):
		return
	var marcas: Dictionary = raw
	var puestas: int = 0
	for k in marcas:
		var fila: Variant = marcas[k]


		var id: String = TeamEdits.id_de_archivo(String(k))
		if id.is_empty():
			_aviso(info, I18n.tf("marca deportiva {0}: {1}", [String(k),
				I18n.t("marca desconocida")]))
			continue
		var svg: String = ""
		var b64: String = ""
		if fila is Dictionary:
			svg = String((fila as Dictionary).get("svg", ""))




			b64 = String((fila as Dictionary).get("logo_png", ""))
		elif fila is String:



			svg = String(fila)
		if svg.strip_edges().is_empty() and b64.strip_edges().is_empty():
			continue


		var usa_svg: bool = not svg.strip_edges().is_empty()
		var bytes: PackedByteArray = PackedByteArray() if usa_svg else _b64_a_bytes(b64)
		var motivo: String = "" if usa_svg or not bytes.is_empty() else I18n.t("base64 ilegible")
		if not escribir and motivo.is_empty():
			puestas += 1
			continue
		if motivo.is_empty():
			motivo = KitBrands.set_svg(id, svg) if usa_svg else KitBrands.set_png(id, bytes)
		if motivo.is_empty():
			puestas += 1




			var reglas: Dictionary = {}
			if fila is Dictionary:
				for llave in KitBrands.SLOT_LLAVE.values():
					reglas[llave] = String((fila as Dictionary).get(llave, ""))
			KitBrands.set_variantes(id, reglas)
		else:
			_aviso(info, I18n.tf("marca deportiva {0}: {1}", [String(k), motivo]))
	if puestas > 0:
		info["marcas_dep"] = puestas


static func _aviso(info: Dictionary, texto: String) -> void:
	var avisos: Array = info["avisos"]
	if avisos.size() < MAX_AVISOS:
		avisos.append(texto)
