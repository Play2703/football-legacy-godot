class_name ReplayDisco
extends RefCounted






































































const MAGIA: String = "FLRP"
const VERSION_MAYOR: int = 1
const VERSION_MENOR: int = 0
const CABECERA: int = 40
const RESUMEN_B: int = 8

const CUERPO_MAX: int = 256 * 1024 * 1024
const META_MAX: int = 1024 * 1024
const SLOTS_MAX: int = 512
const MUESTRAS_MAX: int = 100000
const AUDIO_RATE_MIN: int = 4000
const AUDIO_RATE_MAX: int = 384000


const IMG_LADO_MAX: int = 4096
const PIXELES_MAX: int = 64 * 1024 * 1024

const AUDIO_ESCALA: float = 32767.0
const AUDIO_PICO_MAX: float = 1024.0


const PRESUPUESTO_US: int = 4000

const META_FIJOS: StringName = &"repe_fijos"

const FORMATOS_PNG: Array[int] = [Image.FORMAT_L8, Image.FORMAT_LA8, Image.FORMAT_RGB8,
	Image.FORMAT_RGBA8]
const _PNG_FIRMA: Array[int] = [137, 80, 78, 71, 13, 10, 26, 10]



class _Fijos extends RefCounted:
	var tag: String = ""

	func _notification(what: int) -> void:
		if what == NOTIFICATION_PREDELETE and not tag.is_empty():
			CaraEncima.suelta_fijos(tag)





static func a_bytes(clip: ReplayRec.Clip, meta: Dictionary = {}) -> PackedByteArray:
	var prep: Dictionary = prepara(clip, meta)
	return empaqueta(prep) if not prep.is_empty() else PackedByteArray()



static func prepara(clip: ReplayRec.Clip, meta: Dictionary = {}) -> Dictionary:
	var prep: Dictionary = empieza(clip, meta)
	if not prep.is_empty():
		avanza(prep, -1)
	return prep






static func empieza(clip: ReplayRec.Clip, meta: Dictionary = {}) -> Dictionary:
	var t0: int = Time.get_ticks_usec()
	if clip == null or clip.times.size() < 2 or clip.slots <= 0 \
			or clip.stride != clip.slots * ReplayRec.STRIDE \
			or clip.data.size() != clip.times.size() * clip.stride:
		push_warning("ReplayDisco: clip vacío o incoherente, no se guarda")
		return {}
	if not es_plano(meta):
		push_warning("ReplayDisco: la meta lleva objetos, no se guarda")
		return {}
	var ctx: Dictionary = {"imgs": [], "img_mm": {}, "texs": [], "tex_de": {}, "sfs": [],
		"sf_de": {}, "pags": {}, "celda_de": {}, "suelta_de": {}, "lect": [], "lect_i": 0,
		"parches": [], "parches_i": 0, "parches_us": 0, "lect_us": 0, "ini_de": {},
		"cuadros_fuera": 0, "celdas": 0}
	ctx["usa"] = _anims_usadas(clip, ctx)
	var recetas: Array = []
	for i in clip.slots:
		var r: Dictionary = clip.recipes[i] if i < clip.recipes.size() \
				and clip.recipes[i] is Dictionary else {}
		recetas.append(_receta_a_plano(clip, i, r, ctx))
	var cuerpo: Dictionary = {
		"label": clip.label, "ajeno": clip.ajeno, "mini": sin_objetos(clip.mini),
		"cano_t": clip.cano_t, "stride": clip.stride, "slots": clip.slots,
		"data": clip.data, "times": clip.times, "cam": clip.cam_data, "ring": clip.ring_data,
		"ring_words": PackedStringArray(clip.ring_words.map(func(w) -> String: return String(w))),
		"anims": PackedStringArray(clip.anims.map(func(a) -> String: return String(a))),
		"caras": PackedStringArray(clip.caras.map(func(c) -> String: return String(c))),
		"walls": clip.walls, "audio_us0": clip.audio_us0, "audio_rate": clip.audio_rate,
		"texs": ctx["texs"], "sfs": ctx["sfs"], "recetas": recetas,
	}
	var dt: int = Time.get_ticks_usec() - t0
	return {"cuerpo": cuerpo, "meta": meta.duplicate(true), "ctx": ctx, "audio": clip.audio,
		"medida": {"empieza_us": dt, "prepara_us": dt, "pasos": 0, "paso_max_us": dt}}





static func avanza(prep: Dictionary, presupuesto_us: int = PRESUPUESTO_US) -> bool:
	if not prep.has("ctx"):
		return true
	var ctx: Dictionary = prep["ctx"]
	var med: Dictionary = prep["medida"]
	var t0: int = Time.get_ticks_usec()
	var hecho: bool = false
	var parches: Array = ctx["parches"]
	var lect: Array = ctx["lect"]
	while true:
		var tu: int = Time.get_ticks_usec()
		if int(ctx["parches_i"]) < parches.size():
			var i: int = ctx["parches_i"]
			_compone_parche(ctx, parches[i])
			parches[i] = null
			ctx["parches_i"] = i + 1
			ctx["parches_us"] = int(ctx["parches_us"]) + Time.get_ticks_usec() - tu
		elif int(ctx["lect_i"]) < lect.size():
			var i: int = ctx["lect_i"]
			_lee_fuente(ctx, lect[i])
			(lect[i] as Dictionary)["tex"] = null
			lect[i] = null
			ctx["lect_i"] = i + 1
			ctx["lect_us"] = int(ctx["lect_us"]) + Time.get_ticks_usec() - tu
		else:
			hecho = true
			break
		if presupuesto_us >= 0 and Time.get_ticks_usec() - t0 >= presupuesto_us:
			break
	var dt: int = Time.get_ticks_usec() - t0
	med["prepara_us"] = int(med["prepara_us"]) + dt
	med["pasos"] = int(med["pasos"]) + 1
	med["paso_max_us"] = maxi(int(med["paso_max_us"]), dt)
	if hecho:
		prep["imgs"] = ctx["imgs"]
		prep["img_mm"] = ctx["img_mm"]
		med["parches"] = parches.size()
		med["parches_us"] = ctx["parches_us"]
		med["lecturas"] = lect.size()
		med["lect_us"] = ctx["lect_us"]
		med["imagenes"] =(ctx["imgs"] as Array).size()
		var img_b: int = 0
		for im in ctx["imgs"]:
			img_b +=(im as Image).get_data().size() if im != null else 0
		med["img_bytes"] = img_b
		med["celdas"] = ctx["celdas"]
		med["texturas"] =(ctx["texs"] as Array).size()
		med["repertorios"] =(ctx["sfs"] as Array).size()
		med["cuadros_fuera"] = ctx["cuadros_fuera"]
		prep.erase("ctx")
	return hecho






static func empaqueta(prep: Dictionary) -> PackedByteArray:
	if prep.is_empty() or prep.has("ctx") or not prep.has("imgs"):
		if not prep.is_empty():
			push_warning("ReplayDisco: empaqueta sin avanza terminado o por segunda vez")
		return PackedByteArray()
	var t0: int = Time.get_ticks_usec()
	var med: Dictionary = prep.get("medida", {})
	var imgs: Array = prep["imgs"]
	prep.erase("imgs")
	var mm_de: Dictionary = prep.get("img_mm", {})
	var cuerpo: Dictionary =(prep["cuerpo"] as Dictionary).duplicate()


	var uni: Array = []
	var remap: PackedInt32Array = PackedInt32Array()
	remap.resize(imgs.size())
	var por_hash: Dictionary = {}
	for i in imgs.size():
		var img: Image = imgs[i]
		imgs[i] = null
		if img == null:
			remap[i] = -1
			continue
		var dat: PackedByteArray = img.get_data()
		var h: int = hash(dat)
		var cual: int = -1
		for u in por_hash.get(h, []):
			var o: Image = uni[u]
			if o.get_size() == img.get_size() and o.get_format() == img.get_format() \
					and o.get_data() == dat:
				cual = u
				break
		if cual < 0:
			cual = uni.size()
			uni.append(img)
			if not por_hash.has(h):
				por_hash[h] = []
			por_hash[h].append(cual)
		remap[i] = cual
	imgs = []
	var uni_b: int = 0
	for im in uni:
		uni_b +=(im as Image).get_data().size()
	med["unicas_bytes"] = uni_b



	var texs: Array = []
	var junta: PackedByteArray = PackedByteArray()
	junta.resize(uni.size())
	junta.fill(1)
	for t in cuerpo["texs"]:
		var d: Dictionary =(t as Dictionary).duplicate()
		var i: int = int(d["i"])
		var u: int = remap[i] if i >= 0 else -1
		if u < 0:
			d = {"k": 0, "i": -1}
		else:
			if mm_de.has(i):
				d["mm"] = true
			d["i"] = u
			if not (d.has("celda") or d.has("cuadro")) or d.has("meta") or d.has("mm"):
				junta[u] = 0
		texs.append(d)

	var fin: Array = []
	var en_pag: Dictionary = {}
	var grupos: Dictionary = {}
	for u in uni.size():
		var im: Image = uni[u]
		if junta[u] == 1 and im.get_format() == Image.FORMAT_RGBA8:
			var tam: Vector2i = im.get_size()
			if not grupos.has(tam):
				grupos[tam] = []
			grupos[tam].append(u)
	var paginas: int = 0
	for tam in grupos:
		var lista: Array = grupos[tam]
		var rej: Vector2i = CuadroAtlas._rejilla(tam.x, tam.y) if lista.size() >= 2 \
				else Vector2i.ZERO
		if rej == Vector2i.ZERO:
			continue
		var cap: int = rej.x * rej.y
		var k: int = 0
		while lista.size() - k >= 2:
			var toma: int = mini(cap, lista.size() - k)
			var cols: int = mini(rej.x, toma)
			var filas: int = ceili(float(toma) / float(cols))
			var pag: Image = Image.create(cols * tam.x, filas * tam.y, false, Image.FORMAT_RGBA8)
			for j in toma:
				var u: int = lista[k + j]
				var off: Vector2i = Vector2i((j % cols) * tam.x, floori(float(j) / float(cols)) * tam.y)
				pag.blit_rect(uni[u], Rect2i(Vector2i.ZERO, tam), off)
				en_pag[u] = [fin.size(), off, tam]
				uni[u] = null
			fin.append(pag)
			paginas += 1
			k += toma
	var fin_de: PackedInt32Array = PackedInt32Array()
	fin_de.resize(uni.size())
	for u in uni.size():
		fin_de[u] = -1
		if uni[u] != null:
			fin_de[u] = fin.size()
			fin.append(uni[u])
			uni[u] = null
	for d in texs:
		var u: int = d["i"]
		if u < 0:
			continue
		if en_pag.has(u):
			var e: Array = en_pag[u]
			var off: Vector2 = Vector2(e[1])
			if d.has("cuadro"):
				d["k"] = 1
				d["r"] = Rect2(off, Vector2(e[2] as Vector2i))
				d["m"] = Rect2()
				d["fc"] = false
			else:
				d["r"] = Rect2((d["r"] as Rect2).position + off,(d["r"] as Rect2).size)
			d["i"] = e[0]
		else:
			d["i"] = fin_de[u]
		d.erase("celda")
		d.erase("cuadro")

	var pngs: Array = []
	var png_b: int = 0
	for j in fin.size():
		var png: PackedByteArray =(fin[j] as Image).save_png_to_buffer()
		fin[j] = null
		pngs.append(png)
		png_b += png.size()
	cuerpo["texs"] = texs
	cuerpo["imgs"] = pngs
	var t_png: int = Time.get_ticks_usec()
	var audio: PackedVector2Array = prep.get("audio", PackedVector2Array())
	var a16: Array = _audio_a_s16(audio)
	cuerpo["audio"] = a16[0]
	cuerpo["audio_esc"] = a16[1]
	cuerpo["audio_n"] = audio.size()
	var t_audio: int = Time.get_ticks_usec()
	var crudo: PackedByteArray = var_to_bytes(cuerpo)
	var comp: PackedByteArray = crudo.compress(FileAccess.COMPRESSION_ZSTD)
	var crudo_n: int = crudo.size()
	crudo = PackedByteArray()
	var meta_b: PackedByteArray = var_to_bytes(prep.get("meta", {}))
	var cab: PackedByteArray = PackedByteArray()
	cab.resize(CABECERA)
	cab.fill(0)
	var magia: PackedByteArray = MAGIA.to_ascii_buffer()
	for k in 4:
		cab[k] = magia[k]
	cab.encode_u16(4, VERSION_MAYOR)
	cab.encode_u16(6, VERSION_MENOR)
	cab.encode_u32(8, meta_b.size())
	cab.encode_u64(16, crudo_n)
	cab.encode_u64(24, comp.size())
	var res: PackedByteArray = _resumen(cab, meta_b, comp)
	for k in RESUMEN_B:
		cab[32 + k] = res[k]
	var out: PackedByteArray = cab
	out.append_array(meta_b)
	out.append_array(comp)

	var datos_b: int = 0
	for k in ["data", "times", "cam", "ring", "walls"]:
		datos_b += var_to_bytes(cuerpo[k]).size()
	med["png_bytes"] = png_b
	med["png_unicas"] = pngs.size()
	med["paginas_nuevas"] = paginas
	med["audio_bytes"] =(cuerpo["audio"] as PackedByteArray).size()
	med["datos_bytes"] = datos_b
	med["crudo_bytes"] = crudo_n
	med["fichero_bytes"] = out.size()
	med["png_us"] = t_png - t0
	med["audio_us"] = t_audio - t_png
	med["empaqueta_us"] = Time.get_ticks_usec() - t0
	prep["medida"] = med
	return out





static func de_bytes(bytes: PackedByteArray) -> Dictionary:
	var plano: Dictionary = lee(bytes)
	return monta(plano) if not plano.is_empty() else {}



static func lee_meta(bytes: PackedByteArray) -> Dictionary:
	var cab: Dictionary = _cabecera(bytes)
	if cab.is_empty():
		return {}
	return cab["meta"]






static func lee_meta_fichero(ruta: String) -> Dictionary:
	var f: FileAccess = FileAccess.open(ruta, FileAccess.READ)
	if f == null:
		return {}
	var largo: int = f.get_length()
	var cab: PackedByteArray = f.get_buffer(CABECERA)
	var k: Dictionary = _campos(cab, largo)
	if k.is_empty():
		return {}
	var meta_n: int = k["meta_n"]
	var meta_b: PackedByteArray = f.get_buffer(meta_n)
	f.close()
	if meta_b.size() != meta_n:
		return _mal("meta cortada")
	var meta: Variant = bytes_to_var(meta_b) if meta_n > 0 else {}
	if not (meta is Dictionary) or not es_plano(meta):
		return _mal("la meta no es un Dictionary plano")
	return meta





static func lee(bytes: PackedByteArray) -> Dictionary:
	var t0: int = Time.get_ticks_usec()
	var cab: Dictionary = _cabecera(bytes)
	if cab.is_empty():
		return {}
	var crudo: PackedByteArray = bytes.slice(CABECERA + int(cab["meta_n"])).decompress(
		int(cab["crudo_n"]), FileAccess.COMPRESSION_ZSTD)
	if crudo.size() != int(cab["crudo_n"]):
		return _mal("el cuerpo no descomprime a su tamaño")
	var v: Variant = bytes_to_var(crudo)
	crudo = PackedByteArray()
	if not (v is Dictionary):
		return _mal("el cuerpo no es un Dictionary")
	var c: Dictionary = v
	var err: String = _valida(c)
	if not err.is_empty():
		return _mal(err)

	var pngs: Array = c["imgs"]
	var tams: Array = []
	var px: int = 0
	for png in pngs:
		if not (png is PackedByteArray):
			return _mal("una imagen no es PNG")
		var tam: Vector2i = _tam_png(png)
		if tam.x <= 0 or tam.y <= 0 or tam.x > IMG_LADO_MAX or tam.y > IMG_LADO_MAX:
			return _mal("una imagen no es PNG o es demasiado grande")
		px += tam.x * tam.y
		if px > PIXELES_MAX:
			return _mal("demasiados píxeles")
		tams.append(tam)
	err = _valida_texturas(c, tams)
	if not err.is_empty():
		return _mal(err)


	var texs_d: Array = c["texs"]
	var pide: PackedByteArray = PackedByteArray()
	pide.resize(pngs.size())
	pide.fill(0)
	var propias_de: Dictionary = {}
	for ti in texs_d.size():
		var t: Dictionary = texs_d[ti]
		var i: int = t["i"]
		if i < 0:
			continue
		if int(t["k"]) == 0 and t.has("meta"):
			if not propias_de.has(i):
				propias_de[i] = []
			propias_de[i].append(ti)
		else:
			pide[i] = pide[i]|(2 if bool(t.get("mm", false)) else 1)
	var compartidas: Array = []
	var propias: Dictionary = {}
	for i in pngs.size():
		var img: Image = Image.new()
		if img.load_png_from_buffer(pngs[i]) != OK or img.get_size() != tams[i]:
			return _mal("una PNG no se decodifica")
		pngs[i] = PackedByteArray()
		var con_mm: Image = null
		var quiere_mm: bool =(pide[i]&2) != 0
		for ti in propias_de.get(i, []):
			quiere_mm = quiere_mm or bool((texs_d[ti] as Dictionary).get("mm", false))
		if quiere_mm:
			con_mm = img.duplicate()
			con_mm.generate_mipmaps()
		compartidas.append([
			ImageTexture.create_from_image(img) if (pide[i]&1) != 0 else null,
			ImageTexture.create_from_image(con_mm) if (pide[i]&2) != 0 else null])
		for ti in propias_de.get(i, []):
			propias[ti] = ImageTexture.create_from_image(
				con_mm if bool((texs_d[ti] as Dictionary).get("mm", false)) else img)
	c.erase("imgs")
	var texs: Array = []
	for ti in texs_d.size():
		texs.append(_monta_tex(texs_d[ti], compartidas, propias.get(ti)))
	var sfs: Array = []
	for d in c["sfs"]:
		sfs.append(_monta_sf(d, texs))
	c["texs_obj"] = texs
	c["sfs_obj"] = sfs
	c["audio_dec"] = _audio_de_s16(c["audio"], int(c["audio_n"]), float(c.get("audio_esc", 1.0)))
	c.erase("audio")
	c["meta"] = cab["meta"]
	c["tag"] =(cab["resumen"] as PackedByteArray).hex_encode()
	c["lee_us"] = Time.get_ticks_usec() - t0
	return c




static func monta(c: Dictionary) -> Dictionary:
	if c.is_empty() or not c.has("texs_obj"):
		return {}
	var texs: Array = c["texs_obj"]
	var sfs: Array = c["sfs_obj"]
	var clip: ReplayRec.Clip = ReplayRec.Clip.new()
	clip.label = c["label"]
	clip.ajeno = c["ajeno"]
	clip.mini = c["mini"]
	clip.cano_t = c["cano_t"]
	clip.stride = c["stride"]
	clip.slots = c["slots"]
	clip.data = c["data"]
	clip.times = c["times"]
	clip.cam_data = c["cam"]
	clip.ring_data = c["ring"]
	clip.walls = c["walls"]
	clip.audio = c["audio_dec"]
	clip.audio_us0 = c["audio_us0"]
	clip.audio_rate = c["audio_rate"]
	clip.anims = []
	for a in c["anims"]:
		clip.anims.append(StringName(a))
	clip.caras = []
	for e in c["caras"]:
		clip.caras.append(String(e))
	clip.ring_words = []
	for w in c["ring_words"]:
		clip.ring_words.append(String(w))
	var tag: String = "repe:" + String(c["tag"])
	var fijos: Dictionary = {}
	for rp in c["recetas"]:
		var r: Dictionary =(rp["v"] as Dictionary).duplicate(true)
		for k in rp["sf"]:
			var i: int = int(rp["sf"][k])
			r[k] = sfs[i] if i >= 0 else null
		for k in rp["tx"]:
			var i: int = int(rp["tx"][k])
			r[k] = texs[i] if i >= 0 else null
		var parches: Dictionary = rp["parches"]
		if r.has("cara_rutas"):


			var cfg: Dictionary =(r["cara_cfg"] as Dictionary).duplicate(true) \
					if r.get("cara_cfg") is Dictionary else {}
			cfg["_repe"] = tag
			r["cara_cfg"] = cfg
			var cfg_str: String = var_to_str(cfg)
			for k in parches:
				var partes: PackedStringArray = String(k).split("\n")
				var i: int = int(parches[k])
				fijos[partes[0] + "|" + cfg_str + "|" + partes[1]] = texs[i] if i >= 0 else null
		clip.recipes.append(r)
	if not fijos.is_empty():
		CaraEncima.fija(tag, fijos)
		var testigo: _Fijos = _Fijos.new()
		testigo.tag = tag
		clip.set_meta(META_FIJOS, testigo)
	return {"clip": clip, "meta": c["meta"]}





static func es_plano(v: Variant, prof: int = 0) -> bool:
	if prof > 32:
		return false
	match typeof(v):
		TYPE_OBJECT, TYPE_RID, TYPE_CALLABLE, TYPE_SIGNAL:
			return false
		TYPE_DICTIONARY:
			for k in v:
				if not es_plano(k, prof + 1) or not es_plano(v[k], prof + 1):
					return false
		TYPE_ARRAY:
			for x in v:
				if not es_plano(x, prof + 1):
					return false
	return true





static func sin_objetos(v: Variant, prof: int = 0) -> Variant:
	if prof > 32:
		return null
	match typeof(v):
		TYPE_OBJECT, TYPE_RID, TYPE_CALLABLE, TYPE_SIGNAL:
			return null
		TYPE_DICTIONARY:
			var d: Dictionary = {}
			for k in v:
				if es_plano(k) and es_plano(v[k], prof + 1):
					d[k] = v[k]
				elif es_plano(k) and typeof(v[k]) in [TYPE_DICTIONARY, TYPE_ARRAY]:
					d[k] = sin_objetos(v[k], prof + 1)
			return d
		TYPE_ARRAY:
			var a: Array = []
			for x in v:
				a.append(sin_objetos(x, prof + 1))
			return a
	return v




static func _receta_a_plano(clip: ReplayRec.Clip, slot: int, r: Dictionary,
		ctx: Dictionary) -> Dictionary:
	var out: Dictionary = {"v": {}, "tx": {}, "sf": {}, "parches": {}}
	for k in r:
		var v: Variant = r[k]
		if v is SpriteFrames:
			out["sf"][k] = _sf_id(v, ctx)
		elif v is Texture2D:
			out["tx"][k] = _tex_id(v, ctx, true, false)
		elif es_plano(v):
			out["v"][k] = v
		elif typeof(v) in [TYPE_DICTIONARY, TYPE_ARRAY]:
			out["v"][k] = sin_objetos(v)
	if r.has("cara_rutas") and r["cara_rutas"] is Dictionary:
		out["parches"] = _parches(clip, slot, r, ctx)
	return out







static func _sf_id(sf: SpriteFrames, ctx: Dictionary) -> int:
	var k: int = sf.get_instance_id()
	if ctx["sf_de"].has(k):
		return ctx["sf_de"][k]

	var pinta: Variant =(ctx["usa"] as Dictionary).get(k)
	var anims: Array = []
	for nombre in sf.get_animation_names():
		var n: int = sf.get_frame_count(nombre)
		var tx: PackedInt32Array = PackedInt32Array()
		tx.resize(n)
		var du: PackedFloat64Array = PackedFloat64Array()
		du.resize(n)
		var con_pixeles: bool = pinta == null or (pinta as Dictionary).has(String(nombre))
		for f in n:
			var t: Texture2D = sf.get_frame_texture(nombre, f) if con_pixeles else null
			if not con_pixeles:
				ctx["cuadros_fuera"] = int(ctx["cuadros_fuera"]) + 1
			tx[f] = _tex_id(t, ctx, false, true) if t != null else -1
			du[f] = sf.get_frame_duration(nombre, f)
		anims.append({"n": String(nombre), "v": sf.get_animation_speed(nombre),
			"l": sf.get_animation_loop(nombre), "t": tx, "d": du})
	var id: int =(ctx["sfs"] as Array).size()
	ctx["sfs"].append({"a": anims, "meta": _metas(sf), "ini": _inicial(sf, ctx)})
	ctx["sf_de"][k] = id
	return id





static func _inicial(sf: SpriteFrames, ctx: Dictionary) -> String:
	var k: int = sf.get_instance_id()
	if not ctx["ini_de"].has(k):
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = sf
		ctx["ini_de"][k] = String(s.animation)
		s.free()
	return ctx["ini_de"][k]







static func _tex_id(t: Texture2D, ctx: Dictionary, metas: bool, cuadro: bool) -> int:
	var k: int = t.get_instance_id()
	if ctx["tex_de"].has(k):
		return ctx["tex_de"][k]
	var d: Dictionary = {}
	var at: AtlasTexture = t as AtlasTexture
	if at != null and at.atlas != null and _region_vale(at):
		var r: Rect2 = at.region
		if _entero(r):
			d = {"k": 1, "i": _celda_id(at.atlas, Rect2i(r), ctx), "r": Rect2(Vector2.ZERO, r.size),
				"m": at.margin, "fc": at.filter_clip, "celda": true}
		else:
			d = {"k": 1, "i": _pagina_id(at.atlas, ctx), "r": r, "m": at.margin,
				"fc": at.filter_clip}
	else:
		d = {"k": 0, "i": _suelta_id(t, ctx)}
		if cuadro:
			d["cuadro"] = true
	if metas:
		var m: Dictionary = _metas(t)
		if not m.is_empty():
			d["meta"] = m
	var id: int =(ctx["texs"] as Array).size()
	ctx["texs"].append(d)
	ctx["tex_de"][k] = id
	return id




static func _region_vale(at: AtlasTexture) -> bool:
	var s: Vector2 = Vector2(at.atlas.get_size())
	var r: Rect2 = at.region
	return r.size.x > 0.0 and r.size.y > 0.0 and r.position.x >= 0.0 and r.position.y >= 0.0 \
			and r.end.x <= s.x and r.end.y <= s.y and _rect_finito(at.margin)


static func _entero(r: Rect2) -> bool:
	return r.position.x == floorf(r.position.x) and r.position.y == floorf(r.position.y) \
			and r.size.x == floorf(r.size.x) and r.size.y == floorf(r.size.y)


static func _nueva_img(ctx: Dictionary) -> int:
	ctx["imgs"].append(null)
	return (ctx["imgs"] as Array).size() - 1




static func _job_pagina(pag: Texture2D, ctx: Dictionary) -> Dictionary:
	var k: int = pag.get_instance_id()
	if not ctx["pags"].has(k):
		var job: Dictionary = {"tipo": 1, "tex": pag, "celdas": [], "entera": -1}
		ctx["pags"][k] = job
		ctx["lect"].append(job)
	return ctx["pags"][k]


static func _celda_id(pag: Texture2D, r: Rect2i, ctx: Dictionary) -> int:
	var llave: String = "%d|%s" % [pag.get_instance_id(), r]
	if ctx["celda_de"].has(llave):
		return ctx["celda_de"][llave]
	var id: int = _nueva_img(ctx)
	_job_pagina(pag, ctx)["celdas"].append([id, r])
	ctx["celda_de"][llave] = id
	ctx["celdas"] = int(ctx["celdas"]) + 1
	return id


static func _pagina_id(pag: Texture2D, ctx: Dictionary) -> int:
	var job: Dictionary = _job_pagina(pag, ctx)
	if int(job["entera"]) < 0:
		job["entera"] = _nueva_img(ctx)
	return job["entera"]


static func _suelta_id(t: Texture2D, ctx: Dictionary) -> int:
	var k: int = t.get_instance_id()
	if not ctx["suelta_de"].has(k):
		var id: int = _nueva_img(ctx)
		ctx["lect"].append({"tipo": 0, "tex": t, "id": id})
		ctx["suelta_de"][k] = id
	return ctx["suelta_de"][k]




static func _lee_fuente(ctx: Dictionary, job: Dictionary) -> void:
	var leida: Array = _imagen_de(job["tex"])
	var img: Image = leida[0]
	if img == null:
		return
	var mm: bool = leida[1]
	if int(job["tipo"]) == 0:
		_pon_img(ctx, int(job["id"]), img, mm)
		return
	var s: Vector2i = img.get_size()
	for c in job["celdas"]:
		var r: Rect2i = c[1]
		if r.position.x >= 0 and r.position.y >= 0 and r.end.x <= s.x and r.end.y <= s.y:


			_pon_img(ctx, int(c[0]), img.get_region(r), mm)
	if int(job["entera"]) >= 0:
		_pon_img(ctx, int(job["entera"]), img, mm)


static func _pon_img(ctx: Dictionary, id: int, img: Image, mm: bool) -> void:
	ctx["imgs"][id] = img
	if mm:
		ctx["img_mm"][id] = true









static func _imagen_de(t: Texture2D) -> Array:
	var img: Image = null
	var propia: bool = false
	if t.has_meta(CuadroAtlas.META_IMG) and t.get_meta(CuadroAtlas.META_IMG) is Image:
		img = t.get_meta(CuadroAtlas.META_IMG)
	if img == null or img.is_empty():
		img = t.get_image()
	if img == null or img.is_empty():
		return [null, false]
	if img.is_compressed():
		img = img.duplicate() if not propia else img
		propia = true
		img.decompress()
	var mm: bool = img.has_mipmaps()
	if mm:
		img = img.duplicate() if not propia else img
		propia = true
		img.clear_mipmaps()
	if not FORMATOS_PNG.has(img.get_format()):
		img = img.duplicate() if not propia else img
		img.convert(Image.FORMAT_RGBA8)
	return [img, mm]





const META_CARA_RUTAS: String = "cara_rutas_juntas"

static func _metas(o: Object) -> Dictionary:
	var out: Dictionary = {}
	for k in o.get_meta_list():
		if String(k) == CuadroAtlas.META or String(k) == CuadroAtlas.META_IMG \
				or String(k) == META_CARA_RUTAS:
			continue
		var v: Variant = o.get_meta(k)
		if es_plano(v):
			out[String(k)] = v
		elif typeof(v) in [TYPE_DICTIONARY, TYPE_ARRAY]:
			out[String(k)] = sin_objetos(v)
	return out





static func _parches(clip: ReplayRec.Clip, slot: int, r: Dictionary, ctx: Dictionary) -> Dictionary:
	var rutas_d: Dictionary = r["cara_rutas"]
	var cfg: Dictionary = r.get("cara_cfg", {}) if r.get("cara_cfg", {}) is Dictionary else {}
	var cfg_str: String = var_to_str(cfg)
	var sf: SpriteFrames = r.get("frames") as SpriteFrames

	var pedidos: Dictionary = {}
	var n: int = clip.times.size()
	for s in n:
		var a: int = s * clip.stride + slot * ReplayRec.STRIDE
		var flags: int = int(clip.data[a + 5])
		var cid: int = flags>>ReplayRec.CARA_SHIFT
		if cid <= 0 or cid >= clip.caras.size() or (flags&ReplayRec.F_VISIBLE) == 0:
			continue
		var estado: String = String(clip.caras[cid])
		if estado.is_empty():
			continue
		var nombre: String = String(clip.anim_name(int(clip.data[a + 3])))
		var f0: int = int(clip.data[a + 4])
		var f1: int = f0
		if s + 1 < n:
			var b: int =(s + 1) * clip.stride + slot * ReplayRec.STRIDE
			if int(clip.data[b + 3]) == int(clip.data[a + 3]):
				f1 = int(clip.data[b + 4])
		var total: int = sf.get_frame_count(nombre) if sf != null and sf.has_animation(nombre) \
				else (rutas_d.get(nombre, []) as Array).size()
		var cuadros: Array[int] = [f0]
		if f1 > f0:
			for f in range(f0 + 1, f1 + 1):
				cuadros.append(f)
		elif f1 < f0 and total > 0:
			for f in range(f0 + 1, f1 + total + 1):
				cuadros.append(f % total)
		for fam in _familia(nombre):
			var rutas: Array = rutas_d.get(fam, [])
			if rutas.is_empty():
				continue
			for f in cuadros:

				pedidos[String(rutas[mini(f, rutas.size() - 1)]) + "\n" + estado] = true
	var out: Dictionary = {}
	for k in pedidos:
		var p: PackedStringArray = String(k).split("\n")
		out[k] = -1
		ctx["parches"].append([out, k, p[0], p[1], cfg, cfg_str])
	return out


static func _compone_parche(ctx: Dictionary, p: Array) -> void:
	var tex: Texture2D = CaraEncima.parche(p[2], p[4], p[3], p[5])
	(p[0] as Dictionary)[p[1]] = _tex_id(tex, ctx, true, false) if tex != null else -1








static func _anims_usadas(clip: ReplayRec.Clip, ctx: Dictionary) -> Dictionary:
	var usa: Dictionary = {}
	var fam_de: Dictionary = {}
	for i in mini(clip.slots, clip.recipes.size()):
		var r: Variant = clip.recipes[i]
		if not (r is Dictionary) or not ((r as Dictionary).get("frames") is SpriteFrames):
			continue
		var sf: SpriteFrames =(r as Dictionary)["frames"]
		var k: int = sf.get_instance_id()
		var set_k: Dictionary = usa.get(k, {})
		var vistos: Dictionary = {}
		var falta: bool = false
		for s in clip.times.size():
			var a: int = int(clip.data[s * clip.stride + i * ReplayRec.STRIDE + 3])
			if vistos.has(a):
				continue
			vistos[a] = true
			var nombre: String = String(clip.anim_name(a))
			if not sf.has_animation(nombre):
				falta = true
			if not fam_de.has(nombre):
				fam_de[nombre] = _familia(nombre)
			for f in fam_de[nombre]:
				set_k[String(f)] = true
		if falta:
			for f in _familia(_inicial(sf, ctx)):
				set_k[String(f)] = true
		usa[k] = set_k
	return usa





static func _familia(nombre: String) -> Array:
	var fam: Dictionary = {nombre: true}
	for vuelta in 2:
		for a in fam.keys():
			var s: String = String(a)
			for rumbo in PostReplay.RUMBOS:
				var q: String = _hacia(s, rumbo)
				if not q.is_empty():
					fam[q] = true
			fam[_espejo(s)] = true
	return fam.keys()




static func _hacia(n: String, rumbo: String) -> String:
	if n.begins_with("idle"):
		return String(PostReplay.IDLE_POR_RUMBO.get(rumbo, &""))
	for par in PostReplay.RUMBOS:
		if n.ends_with("_" + par):
			return n.substr(0, n.length() - par.length()) + rumbo
	return ""




static func _espejo(n: String) -> String:
	var sn: StringName = StringName(n)
	if PostReplay.MIRROR.has(sn):
		return String(PostReplay.MIRROR[sn])
	for par in [["south", "north"], ["north", "south"], ["east", "west"], ["west", "east"]]:
		if n.ends_with("_" + par[0]):
			return n.substr(0, n.length() - String(par[0]).length()) + String(par[1])
	return n




static func _audio_a_s16(a: PackedVector2Array) -> Array:
	var pico: float = 1.0
	for v in a:
		if is_finite(v.x) and is_finite(v.y):
			pico = maxf(pico, maxf(absf(v.x), absf(v.y)))
	pico = minf(pico, AUDIO_PICO_MAX)
	var k: float = AUDIO_ESCALA / pico
	var out: PackedByteArray = PackedByteArray()
	out.resize(a.size() * 4)
	var o: int = 0
	for v in a:
		var x: float = v.x if is_finite(v.x) else 0.0
		var y: float = v.y if is_finite(v.y) else 0.0
		out.encode_s16(o, int(clampf(roundf(x * k), - AUDIO_ESCALA, AUDIO_ESCALA)))
		out.encode_s16(o + 2, int(clampf(roundf(y * k), - AUDIO_ESCALA, AUDIO_ESCALA)))
		o += 4
	return [out, pico]


static func _audio_de_s16(b: PackedByteArray, n: int, pico: float) -> PackedVector2Array:
	var out: PackedVector2Array = PackedVector2Array()
	out.resize(n)
	var k: float = pico / AUDIO_ESCALA
	for i in n:
		out[i] = Vector2(float(b.decode_s16(i * 4)) * k, float(b.decode_s16(i * 4 + 2)) * k)
	return out


static func _resumen(cab: PackedByteArray, meta_b: PackedByteArray,
		comp: PackedByteArray) -> PackedByteArray:
	var h: HashingContext = HashingContext.new()
	h.start(HashingContext.HASH_SHA256)
	h.update(cab.slice(0, 32))
	if not meta_b.is_empty():
		h.update(meta_b)
	if not comp.is_empty():
		h.update(comp)
	return h.finish().slice(0, RESUMEN_B)




static func _mal(por_que: String) -> Dictionary:
	push_warning("ReplayDisco: fichero no válido (%s)" % por_que)
	return {}



static func _campos(cab: PackedByteArray, largo: int) -> Dictionary:
	if cab.size() < CABECERA or largo < CABECERA:
		return _mal("más corto que la cabecera")
	if cab.slice(0, 4).get_string_from_ascii() != MAGIA:
		return _mal("no empieza por " + MAGIA)
	var mayor: int = cab.decode_u16(4)
	if mayor < 1 or mayor > VERSION_MAYOR:
		return _mal("versión %d desconocida" % mayor)
	var meta_n: int = cab.decode_u32(8)
	var crudo_n: int = cab.decode_s64(16)
	var comp_n: int = cab.decode_s64(24)
	if meta_n > META_MAX or crudo_n <= 0 or crudo_n > CUERPO_MAX or comp_n <= 0 \
			or comp_n > CUERPO_MAX:
		return _mal("tamaños fuera de rango")
	if largo != CABECERA + meta_n + comp_n:
		return _mal("mide %d y la cabecera dice %d" % [largo, CABECERA + meta_n + comp_n])
	return {"meta_n": meta_n, "crudo_n": crudo_n, "comp_n": comp_n}



static func _cabecera(bytes: PackedByteArray) -> Dictionary:
	var k: Dictionary = _campos(bytes, bytes.size())
	if k.is_empty():
		return {}
	var meta_n: int = k["meta_n"]
	var meta_b: PackedByteArray = bytes.slice(CABECERA, CABECERA + meta_n)
	var res: PackedByteArray = _resumen(bytes, meta_b, bytes.slice(CABECERA + meta_n))
	if res != bytes.slice(32, 32 + RESUMEN_B):
		return _mal("el resumen no coincide")
	var meta: Variant = bytes_to_var(meta_b) if meta_n > 0 else {}
	if not (meta is Dictionary) or not es_plano(meta):
		return _mal("la meta no es un Dictionary plano")
	return {"meta": meta, "meta_n": meta_n, "crudo_n": k["crudo_n"], "resumen": res}



static func _tam_png(png: PackedByteArray) -> Vector2i:
	if png.size() < 33:
		return Vector2i.ZERO
	for i in _PNG_FIRMA.size():
		if png[i] != _PNG_FIRMA[i]:
			return Vector2i.ZERO
	if png.slice(12, 16).get_string_from_ascii() != "IHDR":
		return Vector2i.ZERO
	var w: int =(png[16]<<24)|(png[17]<<16)|(png[18]<<8)|png[19]
	var h: int =(png[20]<<24)|(png[21]<<16)|(png[22]<<8)|png[23]
	return Vector2i(w, h)



static func _valida(c: Dictionary) -> String:
	var tipos: Dictionary = {
		"label": TYPE_STRING, "ajeno": TYPE_BOOL, "mini": TYPE_DICTIONARY, "cano_t": TYPE_FLOAT,
		"stride": TYPE_INT, "slots": TYPE_INT, "data": TYPE_PACKED_FLOAT32_ARRAY,
		"times": TYPE_PACKED_FLOAT32_ARRAY, "cam": TYPE_PACKED_FLOAT32_ARRAY,
		"ring": TYPE_PACKED_FLOAT32_ARRAY, "ring_words": TYPE_PACKED_STRING_ARRAY,
		"anims": TYPE_PACKED_STRING_ARRAY, "caras": TYPE_PACKED_STRING_ARRAY,
		"walls": TYPE_PACKED_INT64_ARRAY, "audio": TYPE_PACKED_BYTE_ARRAY, "audio_n": TYPE_INT,
		"audio_us0": TYPE_INT, "audio_rate": TYPE_INT, "imgs": TYPE_ARRAY, "texs": TYPE_ARRAY,
		"sfs": TYPE_ARRAY, "recetas": TYPE_ARRAY,
	}
	for k in tipos:
		if not c.has(k) or typeof(c[k]) != int(tipos[k]):
			return "falta o no es del tipo: " + String(k)
	if not es_plano(c["mini"]):
		return "mini no es plano"
	var slots: int = c["slots"]
	var n: int =(c["times"] as PackedFloat32Array).size()
	if slots <= 0 or slots > SLOTS_MAX or int(c["stride"]) != slots * ReplayRec.STRIDE:
		return "ranuras o zancada"
	if n < 2 or n > MUESTRAS_MAX:
		return "muestras fuera de rango"
	if (c["data"] as PackedFloat32Array).size() != n * int(c["stride"]):
		return "data no mide muestras × zancada"
	var cam_n: int =(c["cam"] as PackedFloat32Array).size()
	if cam_n != 0 and cam_n != n * ReplayRec.CAM_STRIDE:
		return "pista de cámara"
	var ring_n: int =(c["ring"] as PackedFloat32Array).size()
	if ring_n != 0 and ring_n != n * ReplayRec.RING_STRIDE:
		return "pista del aro"
	var walls_n: int =(c["walls"] as PackedInt64Array).size()
	if walls_n != 0 and walls_n != n:
		return "reloj de pared"
	if not is_finite(float(c["cano_t"])):
		return "cano_t"
	for k in ["data", "times", "cam", "ring"]:
		if not _finitos(c[k]):
			return "floats no finitos en " + k
	var times: PackedFloat32Array = c["times"]
	if times[0] < 0.0:
		return "tiempo negativo"
	for i in range(1, n):
		if times[i] < times[i - 1]:
			return "tiempos no monótonos"
	var walls: PackedInt64Array = c["walls"]
	for i in range(1, walls_n):
		if walls[i] < walls[i - 1]:
			return "reloj de pared no monótono"

	var data: PackedFloat32Array = c["data"]
	var anims_n: int = maxi((c["anims"] as PackedStringArray).size(), 1)
	var caras_n: int =(c["caras"] as PackedStringArray).size()
	for s in n:
		for slot in slots:
			var a: int = s * int(c["stride"]) + slot * ReplayRec.STRIDE
			var id: float = data[a + 3]
			var fl: float = data[a + 5]
			if id != floorf(id) or id < 0.0 or int(id) >= anims_n:
				return "id de animación fuera de rango"
			if fl != floorf(fl) or fl < 0.0 or fl > 16777216.0 \
					or (int(fl)>>ReplayRec.CARA_SHIFT) >= maxi(caras_n, 1):
				return "banderas o id de cara fuera de rango"
			if data[a + 4] < 0.0:
				return "fase negativa"
	if ring_n > 0:
		var ring: PackedFloat32Array = c["ring"]
		var words_n: int =(c["ring_words"] as PackedStringArray).size()
		for s in n:
			var w: float = ring[s * ReplayRec.RING_STRIDE + 4]
			if w != floorf(w) or w < -1.0 or int(w) >= words_n:
				return "palabra del aro fuera de rango"

	var an: int = c["audio_n"]
	var rate: int = c["audio_rate"]
	if an < 0 or (c["audio"] as PackedByteArray).size() != an * 4:
		return "audio no mide cuadros × 4"
	if an > 0 and (rate < AUDIO_RATE_MIN or rate > AUDIO_RATE_MAX):
		return "tasa de audio"
	if c.has("audio_esc") and (typeof(c["audio_esc"]) != TYPE_FLOAT
			or not is_finite(float(c["audio_esc"])) or float(c["audio_esc"]) < 1.0
			or float(c["audio_esc"]) > AUDIO_PICO_MAX):
		return "escala del audio"

	var recetas: Array = c["recetas"]
	if recetas.size() != slots:
		return "recetas ≠ ranuras"
	var tex_n: int =(c["texs"] as Array).size()
	var sf_n: int =(c["sfs"] as Array).size()
	for rp in recetas:
		if not (rp is Dictionary):
			return "receta no es Dictionary"
		for k in ["v", "tx", "sf", "parches"]:
			if not (rp.get(k) is Dictionary):
				return "receta sin " + k
		if not es_plano(rp["v"]):
			return "receta con objetos"
		for k in rp["tx"]:
			if not _id_en(rp["tx"][k], tex_n):
				return "textura de receta fuera de rango"
		for k in rp["sf"]:
			if not _id_en(rp["sf"][k], sf_n):
				return "repertorio fuera de rango"
		for k in rp["parches"]:
			if String(k).split("\n").size() != 2 or not _id_en(rp["parches"][k], tex_n):
				return "parche de cara mal formado"
		var err: String = _valida_cara(rp["v"])
		if not err.is_empty():
			return err

	for d in c["sfs"]:
		if not (d is Dictionary) or not (d.get("a") is Array) or not (d.get("meta") is Dictionary):
			return "repertorio mal formado"
		if not es_plano(d["meta"]):
			return "metas del repertorio"
		if d.has("ini") and typeof(d["ini"]) != TYPE_STRING:
			return "animación inicial"
		for an_d in d["a"]:
			if not (an_d is Dictionary) or typeof(an_d.get("n")) != TYPE_STRING \
					or typeof(an_d.get("v")) != TYPE_FLOAT or typeof(an_d.get("l")) != TYPE_BOOL \
					or typeof(an_d.get("t")) != TYPE_PACKED_INT32_ARRAY \
					or typeof(an_d.get("d")) != TYPE_PACKED_FLOAT64_ARRAY:
				return "animación mal formada"
			if (an_d["t"] as PackedInt32Array).size() !=(an_d["d"] as PackedFloat64Array).size():
				return "cuadros y duraciones no casan"
			if not is_finite(float(an_d["v"])):
				return "velocidad no finita"
			for i in an_d["t"]:
				if not _id_en(i, tex_n):
					return "cuadro fuera de rango"
			for du in an_d["d"]:
				if not is_finite(du) or du < 0.0:
					return "duración de cuadro"
	return ""







static func _valida_cara(v: Dictionary) -> String:
	if v.has("cara_cfg") and not (v["cara_cfg"] is Dictionary):
		return "cara_cfg"
	if not v.has("cara_rutas"):
		return ""
	if not (v["cara_rutas"] is Dictionary):
		return "cara_rutas"
	for an in v["cara_rutas"]:
		if typeof(an) != TYPE_STRING and typeof(an) != TYPE_STRING_NAME:
			return "cara_rutas: animación"
		var rutas: Variant = v["cara_rutas"][an]
		if not (rutas is Array):
			return "cara_rutas: no es Array"
		for ruta in rutas:
			if typeof(ruta) != TYPE_STRING and typeof(ruta) != TYPE_STRING_NAME:
				return "cara_rutas: ruta"
			var s: String = String(ruta)
			if not s.is_empty() and (not s.begins_with("res://") or s.contains("..")):
				return "cara_rutas: ruta fuera de res://"
	return ""



static func _valida_texturas(c: Dictionary, tams: Array) -> String:
	for t in c["texs"]:
		if not (t is Dictionary) or typeof(t.get("k")) != TYPE_INT \
				or typeof(t.get("i")) != TYPE_INT:
			return "textura mal formada"
		var i: int = t["i"]
		if i < -1 or i >= tams.size():
			return "imagen fuera de rango"
		if t.has("meta") and (not (t["meta"] is Dictionary) or not es_plano(t["meta"])):
			return "metas de textura"
		if t.has("mm") and typeof(t["mm"]) != TYPE_BOOL:
			return "mipmaps de textura"
		if int(t["k"]) == 1:
			if i < 0 or typeof(t.get("r")) != TYPE_RECT2 or typeof(t.get("m")) != TYPE_RECT2 \
					or typeof(t.get("fc")) != TYPE_BOOL:
				return "cuadro de atlas mal formado"
			var s: Vector2 = Vector2(tams[i])
			var r: Rect2 = t["r"]
			if not _rect_finito(r) or not _rect_finito(t["m"]) or r.size.x <= 0.0 \
					or r.size.y <= 0.0 or r.position.x < 0.0 or r.position.y < 0.0 \
					or r.end.x > s.x or r.end.y > s.y:
				return "región fuera de su página"
		elif int(t["k"]) != 0:
			return "tipo de textura desconocido"
	return ""


static func _id_en(v: Variant, n: int) -> bool:
	return typeof(v) == TYPE_INT and int(v) >= -1 and int(v) < n


static func _rect_finito(r: Rect2) -> bool:
	return is_finite(r.position.x) and is_finite(r.position.y) and is_finite(r.size.x) \
			and is_finite(r.size.y)


static func _finitos(a: PackedFloat32Array) -> bool:
	for x in a:
		if not is_finite(x):
			return false
	return true




static func _monta_tex(t: Dictionary, compartidas: Array, propia: Variant) -> Texture2D:
	var i: int = t["i"]
	if i < 0:
		return null
	var base: Texture2D =(compartidas[i] as Array)[1 if bool(t.get("mm", false)) else 0]
	var out: Texture2D = null
	if int(t["k"]) == 1:
		var at: AtlasTexture = AtlasTexture.new()
		at.atlas = base
		at.region = t["r"]
		at.margin = t["m"]
		at.filter_clip = t["fc"]
		out = at
	elif propia is Texture2D:
		out = propia
	else:
		out = base
	for k in t.get("meta", {}):
		out.set_meta(k, t["meta"][k])
	return out


static func _monta_sf(d: Dictionary, texs: Array) -> SpriteFrames:
	var sf: SpriteFrames = SpriteFrames.new()
	var tiene_default: bool = false

	var ini: String = String(d.get("ini", ""))
	var orden: Array = []
	for a in d["a"]:
		if String(a["n"]) == ini:
			orden.push_front(a)
		else:
			orden.append(a)
	for a in orden:
		var nombre: StringName = StringName(a["n"])
		if nombre == &"default":
			tiene_default = true
		if not sf.has_animation(nombre):
			sf.add_animation(nombre)
		sf.set_animation_speed(nombre, a["v"])
		sf.set_animation_loop(nombre, a["l"])
		var tx: PackedInt32Array = a["t"]
		var du: PackedFloat64Array = a["d"]
		for f in tx.size():
			sf.add_frame(nombre, texs[tx[f]] if tx[f] >= 0 else null, du[f])

	if not tiene_default and sf.has_animation(&"default"):
		sf.remove_animation(&"default")
	for k in d["meta"]:
		sf.set_meta(k, d["meta"][k])
	return sf
