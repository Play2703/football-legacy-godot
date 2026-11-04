extends RefCounted






























const CLIMAS: Array[String] = ["despejado", "nublado", "lluvia", "nieve"]


const PESOS: Dictionary = {"despejado": 58.0, "nublado": 20.0, "lluvia": 15.0, "nieve": 7.0}

const DE_WEATHER: Dictionary = {"despejado": "day", "nublado": "overcast", "lluvia": "rain",
	"nieve": "snow"}

const TRAMO_H: int = 8



const ISO_PAIS: Dictionary = {"GB": "Inglaterra", "DE": "Alemania", "NL": "Países Bajos",
	"BE": "Bélgica", "ES": "España", "IT": "Italia", "PT": "Portugal", "MX": "México",
	"FR": "Francia", "NO": "Noruega", "CZ": "Chequia", "UA": "Ucrania", "AT": "Austria",
	"CH": "Suiza", "RS": "Serbia", "DK": "Dinamarca", "KR": "Corea del Sur",
	"US": "Estados Unidos", "JP": "Japón", "TR": "Turquía", "HR": "Croacia", "GR": "Grecia",
	"SE": "Suecia", "RO": "Rumanía", "BA": "Bosnia y Herzegovina"}


const NIEVE_EXTRA: Dictionary = {"CA": {"snow": 3.0}, "RU": {"snow": 3.2},
	"FI": {"snow": 3.0}, "PL": {"snow": 1.8}, "IS": {"snow": 2.5},
	"CN": {"snow": 1.0}, "AR": {"snow": 0.4}, "CL": {"snow": 0.5}, "NZ": {"snow": 0.6}}

const SUR: Array[String] = ["AR", "CL", "UY", "PY", "BO", "PE", "BR", "ZA", "AU", "NZ"]


static var reloj: Dictionary = {}
static var pais_forzado: String = ""
static var clima_forzado: String = ""





static func ahora() -> Dictionary:
	var d: Dictionary = Time.get_datetime_dict_from_system()
	d.merge(reloj, true)
	return d



static func region(locale: String) -> String:
	var partes: PackedStringArray = locale.get_slice("@", 0).get_slice(".", 0) \
			.replace("-", "_").split("_")
	for i in range(partes.size() - 1, 0, -1):
		if partes[i].length() == 2:
			return partes[i].to_upper()
	return ""


static func pais() -> String:
	return pais_forzado if pais_forzado != "" else region(OS.get_locale())



static func franja(h: int) -> String:
	if h >= Weather.HORA_NOCHE or h < Weather.HORA_ALBA:
		return "night"
	if h < Weather.HORA_MANANA or h >= Weather.HORA_TARDE:
		return "sunset"
	return "day"





static func frio(mes: int, dia: int, iso: String) -> float:
	var t: float =(float(mes - 1) + float(dia - 1) / 30.0 - 0.5) / 12.0
	var c: float = cos(TAU * t)
	return - c if SUR.has(iso) else c



static func geo(iso: String) -> Dictionary:
	if ISO_PAIS.has(iso):
		return Weather.CLIMATE_BY_COUNTRY.get(String(ISO_PAIS[iso]), {})
	return NIEVE_EXTRA.get(iso, {})




static func pesos(c: float, iso: String) -> Dictionary:
	var g: Dictionary = geo(iso)
	var fecha: Dictionary = {
		"day": maxf(1.0 - 0.55 * c, 0.05), "overcast": maxf(1.0 + 0.5 * c, 0.05),
		"rain": maxf(1.0 + 0.6 * c, 0.05),
		"snow": maxf((c - Weather.SNOW_COLD_FLOOR) * Weather.SNOW_COLD_GAIN, 0.0)}
	var out: Dictionary = {}
	for k in CLIMAS:
		var w: String = String(DE_WEATHER[k])
		out[k] = float(PESOS[k]) * float(fecha[w]) \
				* float(g.get(w, 0.0 if w == "snow" else 1.0))
	return out



static func clima(d: Dictionary, iso: String) -> String:
	var c: float = frio(int(d.get("month", 1)), int(d.get("day", 1)), iso)
	var w: Dictionary = pesos(c, iso)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("calle|%04d-%02d-%02d|%d|%s" % [int(d.get("year", 2026)),
		int(d.get("month", 1)), int(d.get("day", 1)), int(d.get("hour", 12)) / TRAMO_H, iso])
	var total: float = 0.0
	for k in CLIMAS:
		total += float(w[k])
	var r: float = rng.randf() * total
	for k in CLIMAS:
		r -= float(w[k])
		if r < 0.0 and float(w[k]) > 0.0:
			return k
	return "despejado"



static func estado() -> Dictionary:
	var d: Dictionary = ahora()
	var iso: String = pais()
	var h: int = int(d.get("hour", 12))
	return {"franja": franja(h), "clima": clima_forzado if clima_forzado != "" else clima(d, iso),
		"frio": frio(int(d.get("month", 1)), int(d.get("day", 1)), iso), "alba": h < 12,
		"hora": h, "pais": iso}










static func de_casa() -> Dictionary:
	if reloj.is_empty() and clima_forzado == "" \
			and (DisplayServer.get_name() == "headless" or _de_herramienta()):
		return {}
	return estado()










static func nevado(e: Dictionary) -> bool:
	return String(e.get("clima", "")) == "nieve" \
			or House.is_winter(GameState.season_progress())


static var _herramienta: int = -1





static func _de_herramienta() -> bool:
	if _herramienta < 0:
		_herramienta = 0
		for a in OS.get_cmdline_args():
			if a.trim_prefix("res://").begins_with("tools/"):
				_herramienta = 1
	return _herramienta == 1









static func paleta(e: Dictionary) -> Dictionary:
	var p: Dictionary
	match String(e.get("franja", "day")):
		"night":
			p = {"cielo": Color("0b1428"), "horizonte": Color("23314f"), "suelo": Color("1a2230"),
				"ambiente": Color("52628f"), "amb_e": 0.55, "niebla": Color("1c2742"),
				"niebla_d": 0.009, "sol": Color("a9bcff"), "sol_e": 0.3,
				"sol_rot": Vector3(-58.0, -25.0, 0.0), "farol": 1.0,
				"tinte": Color(0.62, 0.68, 0.86)}
		"sunset":
			p = {"cielo": Color("5b6fa8"), "horizonte": Color("f0b98e"), "suelo": Color("6a6a48"),
				"ambiente": Color("d8c0b0"), "amb_e": 0.5, "niebla": Color("e8b994"),
				"niebla_d": 0.0065, "sol": Color("ffb57a"), "sol_e": 0.95,
				"sol_rot": Vector3(-14.0, -70.0 if bool(e.get("alba", false)) else 70.0, 0.0),
				"farol": 0.5, "tinte": Color(1.0, 0.92, 0.85)}
		_:
			p = {"cielo": Color("5f97c4"), "horizonte": Color("d6e3e2"), "suelo": Color("6f8a4c"),
				"ambiente": Color("c9d8e6"), "amb_e": 0.62, "niebla": Color("d6e3e2"),
				"niebla_d": 0.0055, "sol": Color("fff0d8"), "sol_e": 1.15,
				"sol_rot": Vector3(-46.0, 40.0, 0.0), "farol": 0.0, "tinte": Color.WHITE}
	p["sombra"] = 1.0
	p["cae"] = ""
	var gris: float = 0.0
	var luz: float = 0.0
	match String(e.get("clima", "despejado")):
		"nublado":
			gris = 0.65
			p.sol_e *= 0.45
			p.amb_e *= 1.3
			p.niebla_d *= 1.7
			p.sombra = 0.45
		"lluvia":
			gris = 0.8
			luz = -0.22
			p.sol_e *= 0.3
			p.amb_e *= 1.15
			p.niebla_d *= 2.6
			p.sombra = 0.25
			p.cae = "lluvia"
			p.tinte =(p.tinte as Color).darkened(0.1)
		"nieve":
			gris = 0.75
			luz = 0.18
			p.sol_e *= 0.55
			p.amb_e *= 1.35
			p.niebla_d *= 2.2
			p.sombra = 0.5
			p.cae = "nieve"
	if gris > 0.0:
		for k in ["cielo", "horizonte", "niebla", "ambiente"]:
			p[k] = agrisa(p[k], gris, luz)
	return p




static func agrisa(c: Color, k: float, luz: float) -> Color:
	var l: float = c.get_luminance()
	var g: Color = Color(l, l, l).lerp(Color("8a94a3"), 0.25)
	g = g.lightened(luz) if luz > 0.0 else g.darkened(- luz)
	return c.lerp(g, k)





static func monta(padre: Node, p: Dictionary, sombra: bool) -> void:
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_SKY
	e.sky = cielo(p)
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = p.ambiente
	e.ambient_light_energy = float(p.amb_e)
	e.fog_enabled = true
	e.fog_light_color = p.niebla
	e.fog_density = float(p.niebla_d)
	e.fog_sky_affect = 0.0
	var env: WorldEnvironment = WorldEnvironment.new()
	env.environment = e
	padre.add_child(env)
	var sun: DirectionalLight3D = DirectionalLight3D.new()
	sun.rotation_degrees = p.sol_rot
	sun.light_energy = float(p.sol_e)
	sun.light_color = p.sol



	sun.shadow_enabled = sombra and Settings.sombra_permitida()
	sun.shadow_opacity = float(p.sombra)
	sun.directional_shadow_mode = DirectionalLight3D.SHADOW_PARALLEL_2_SPLITS
	sun.directional_shadow_max_distance = 55.0
	padre.add_child(sun)




static func cielo(p: Dictionary) -> Sky:
	var m: ProceduralSkyMaterial = ProceduralSkyMaterial.new()
	m.sky_top_color = p.cielo
	m.sky_horizon_color = p.horizonte
	m.ground_bottom_color = p.suelo
	m.ground_horizon_color = p.horizonte
	var sky: Sky = Sky.new()
	sky.sky_material = m
	return sky



static func cae(padre: Node, p: Dictionary, baja: bool, foco: Vector2) -> Node3D:
	if String(p.get("cae", "")) == "":
		return null
	var c: CPUParticles3D = _cae(String(p.cae) == "lluvia", baja)
	sigue(c, foco)
	padre.add_child(c)
	return c









const CAE_CAJA: Vector3 = Vector3(13.0, 0.6, 20.0)
const CAE_ALTO: float = 13.0
const CAE_DELANTE: float = 15.0


static func _cae(lluvia: bool, baja: bool) -> CPUParticles3D:
	var c: CPUParticles3D = CPUParticles3D.new()
	c.amount = Weather.particulas(1100 if lluvia else 900, baja)
	c.lifetime = 0.75 if lluvia else 6.5
	c.preprocess = c.lifetime
	c.local_coords = false
	c.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
	c.emission_box_extents = CAE_CAJA
	c.direction = Vector3(0.08, -1.0, 0.0) if lluvia else Vector3.DOWN
	c.spread = 2.0 if lluvia else 25.0
	c.initial_velocity_min = 14.0 if lluvia else 1.2
	c.initial_velocity_max = 17.0 if lluvia else 1.8
	c.gravity = Vector3(0.0, -9.8, 0.0) if lluvia else Vector3(0.0, -0.25, 0.0)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.022, 0.55) if lluvia else Vector2(0.22, 0.22)
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED

	m.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y if lluvia \
			else BaseMaterial3D.BILLBOARD_ENABLED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = Color(0.78, 0.85, 0.95, 0.45) if lluvia else Color(1.0, 1.0, 1.0, 0.95)

	if not lluvia:
		m.albedo_texture = _punto()
	q.material = m
	c.mesh = q
	c.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return c



















const CAE_PUNTOS: int = 4096
const CAE_ABANICO: float = 5.0
const CAE_TOPE: int = 2


static func cae_fuera(padre: Node, p: Dictionary, baja: bool, zona: Rect2, hueco: Rect2) -> Node3D:
	if String(p.get("cae", "")) == "":
		return null
	var lluvia: bool = String(p.cae) == "lluvia"
	var c: CPUParticles3D = _cae(lluvia, baja)
	c.direction = Vector3.DOWN
	c.spread = 0.0 if lluvia else CAE_ABANICO

	var techo: float = House.WALL_HEIGHT
	var v: float = c.initial_velocity_min
	var g: float = - c.gravity.y
	c.lifetime =(sqrt(v * v + 2.0 * g * techo) - v) / g
	c.preprocess = c.lifetime
	var fundido: Gradient = Gradient.new()
	fundido.set_color(0, Color(1.0, 1.0, 1.0, 0.0))
	fundido.set_color(1, Color.WHITE)
	fundido.add_point(0.25, Color.WHITE)
	c.color_ramp = fundido
	((c.mesh as QuadMesh).material as StandardMaterial3D).vertex_color_use_as_albedo = true
	hueco = hueco.grow(deriva(c))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20261026
	var pts: PackedVector3Array = PackedVector3Array()
	var tope: int = CAE_PUNTOS * 4
	while pts.size() < CAE_PUNTOS and tope > 0:
		tope -= 1
		var x: float = rng.randf_range(zona.position.x, zona.end.x)
		var z: float = rng.randf_range(zona.position.y, zona.end.y)
		if not hueco.has_point(Vector2(x, z)):
			pts.append(Vector3(x, rng.randf_range(- CAE_CAJA.y, 0.0), z))
	c.emission_shape = CPUParticles3D.EMISSION_SHAPE_POINTS
	c.emission_points = pts
	c.position = Vector3(0.0, techo, 0.0)
	var calle_m2: float = 4.0 * CAE_CAJA.x * CAE_CAJA.z
	var fuera_m2: float = zona.get_area() - zona.intersection(hueco).get_area()
	c.amount = clampi(roundi(c.amount * fuera_m2 / calle_m2), 1, c.amount * CAE_TOPE)
	padre.add_child(c)
	return c




static func deriva(c: CPUParticles3D) -> float:
	var lado: float = Vector2(c.direction.x, c.direction.z).length() / maxf(c.direction.length(), 0.001)
	return c.lifetime * c.initial_velocity_max * minf(1.0, lado + sin(deg_to_rad(c.spread)))



static func sigue(cae: Node3D, foco: Vector2) -> void:
	if cae != null:
		cae.position = Vector3(foco.x, CAE_ALTO, foco.y - CAE_DELANTE)





const META_PUNTOS: StringName = &"faroles_puntos"
















static func faroles(padre: Node3D, focos: Array, fuerza: float) -> void:
	if fuerza <= 0.0 or focos.is_empty():
		return
	var tex: GradientTexture2D = _punto()
	var charco: StandardMaterial3D = _suma(tex, Color(1.0, 0.82, 0.52, 0.55 * fuerza))
	var halo: StandardMaterial3D = _suma(tex, Color(1.0, 0.9, 0.65, 0.85 * fuerza))
	halo.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	var suelo: PlaneMesh = PlaneMesh.new()
	suelo.size = Vector2(6.4, 6.4)
	suelo.material = charco
	var bola: QuadMesh = QuadMesh.new()
	bola.size = Vector2(1.3, 1.3)
	bola.material = halo
	var charcos: MultiMeshInstance3D = _tanda(suelo, focos.size())
	var halos: MultiMeshInstance3D = _tanda(bola, focos.size())
	var caja: AABB = AABB(focos[0] as Vector3, Vector3.ZERO)
	var en_suelo: PackedVector3Array = PackedVector3Array()
	for i in focos.size():
		var b: Vector3 = focos[i]

		en_suelo.append(Vector3(b.x, 0.14, b.z))
		charcos.multimesh.set_instance_transform(i, Transform3D(Basis.IDENTITY, en_suelo[i]))
		halos.multimesh.set_instance_transform(i, Transform3D(Basis.IDENTITY, b))
		caja = caja.expand(b)
	charcos.set_meta(META_PUNTOS, en_suelo)
	halos.set_meta(META_PUNTOS, PackedVector3Array(focos))





	halos.custom_aabb = caja.grow(0.95)
	padre.add_child(charcos)
	padre.add_child(halos)



static func _tanda(malla: Mesh, n: int) -> MultiMeshInstance3D:
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = malla
	mm.instance_count = n
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return mmi



static func _punto() -> GradientTexture2D:
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	var gr: Gradient = Gradient.new()
	gr.set_color(0, Color.WHITE)
	gr.set_color(1, Color(1.0, 1.0, 1.0, 0.0))
	gr.add_point(0.45, Color(1.0, 1.0, 1.0, 0.42))
	tex.gradient = gr
	return tex


static func _suma(tex: Texture2D, col: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
	m.albedo_texture = tex
	m.albedo_color = col
	m.disable_fog = true
	return m
