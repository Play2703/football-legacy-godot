extends Node























































signal cambio

const SAVE_PATH: String = "user://herencia.cfg"



const SaveSlotsScript = preload("res://autoload/save_slots.gd")


const VAL_RAREZA: Dictionary = {1: 1, 2: 2, 3: 4, 4: 8}





const HITOS_VITRINA: Array = [[25, 10], [50, 20], [75, 40], [100, 80]]


const BONO_RETIRO: Array = [5, 10, 20, 40, 80, 150]















const PRECIO_VENTAJA: Dictionary = {1: 150, 2: 350, 3: 700, 4: 1200}















const PACKS: Array = [

	{"id": "pack_focos", "icon": "aficion", "name": "BAJO LOS FOCOS", "tier": 1,
		"precio": 150, "mxn": 39, "ids": ["el_que_volvio", "sangre_azul", "reloj_abuelo"],
		"desc": "Llegas ya famoso: la grada te corea, la prensa te sigue y el seleccionador sabe tu nombre."},

	{"id": "pack_padrino", "icon": "agente", "name": "CON PADRINO", "tier": 2,
		"precio": 200, "mxn": 59, "ids": ["el_telefono", "el_capitan", "fichaje_oro"],
		"desc": "Tu agente contesta, el vestuario te respeta y firmas el debut un rol más arriba."},

	{"id": "pack_dinastia", "icon": "leyendas", "name": "LA DINASTIA", "tier": 3,
		"precio": 300, "mxn": 79, "ids": ["la_fortuna", "patio_familia", "hijo_leyenda"],
		"desc": "Naces con herencia: un cuarto de millón en el banco, el terreno del abuelo y la casa del viejo."},

	{"id": "pack_atleta", "icon": "fisico", "name": "CUERPO DE ATLETA", "tier": 4,
		"precio": 400, "mxn": 99, "ids": ["piernas_de_nino", "cuerpo_hierro", "preparador_familia"],
		"desc": "Un cuerpo que no se rompe: piernas de niño, 20 % menos lesiones y fisio gratis toda la carrera."},

	{"id": "pack_talento", "icon": "potencia", "name": "PURO TALENTO", "tier": 4,
		"precio": 500, "mxn": 129, "ids": ["kit_cantera", "superdotado", "killer_nato"],
		"desc": "Naces crack: 65 en todo, ocho puntos por repartir y un disparo que asusta desde el primer partido."},
]

const ID_PRESUPUESTO: String = "presupuesto_7"
const PRECIO_PRESUPUESTO: int = 700





const KITS: Array = [




	{"id": "kit_cantera", "icon": "potencia", "name": "CANTERA DE ORO",
		"tier": 4, "precio": 1200, "skill_bonus": {"potencia": 5, "precision": 5, "efecto": 5,
			"vision": 5, "fisico": 5, "velocidad": 5, "aceleracion": 5, "regate": 5},
		"desc": "Toda carrera nueva arranca con 65 en las ocho habilidades en vez de 60. Es un año de entrenamiento antes de debutar."},
	{"id": "kit_cartera", "icon": "material", "name": "LA CARTERA DEL ABUELO",
		"tier": 1, "precio": 150, "money_bonus": 10000,
		"desc": "Diez mil de salida en toda carrera nueva, encima de los cinco mil de siempre. Para no vivir al día el primer año."},
	{"id": "kit_botas", "icon": "bota_precision", "name": "BOTAS DE BARRIO",
		"tier": 1, "precio": 150, "boots": "barrio",
		"desc": "Toda carrera nueva arranca con unas BARRIO 90 nuevas puestas en vez de las de cantera. Se gastan, como todas."},
	{"id": "kit_agente", "icon": "agente", "name": "UN AGENTE QUE TE CONOCE",
		"tier": 2, "precio": 350, "rel_floor": {"agente": 55},
		"desc": "Tu agente empieza cada carrera creyendo en ti: llamadas y encargos desde el primer mes, no a media carrera."},
	{"id": "kit_solar", "icon": "material", "name": "EL SOLAR DE LA FAMILIA",
		"tier": 2, "precio": 350, "land_tier": 1,
		"desc": "Un terreno donde construir, en toda carrera nueva. El terreno sin la casa: lo que levantes encima lo pagas tú."},
]


var _compradas: PackedStringArray = PackedStringArray()
var _gastadas: int = 0
var _bonos_retiro: int = 0
var _retiros: int = 0


var _compradas_estrellas: int = 0



var _regaladas_estrellas: int = 0

var save_path: String = SAVE_PATH



var _vitrina: Dictionary = {}





var _vitrina_hitos: int = -1


func _ready() -> void:
	_cargar()

	Achievements.unlocked.connect(func(_id: String) -> void: cambio.emit())





func ganadas_por_logros() -> int:
	var total: int = 0
	for id in Achievements.unlocked_ids():
		var meta: Dictionary = Achievements.meta_of(String(id))
		total += int(VAL_RAREZA.get(int(meta.get("rare", 1)), 1))
	return total




func ganadas_por_vitrina() -> int:
	var total: int = 0
	for i in vitrina_hitos_cobrados():
		total += int(HITOS_VITRINA[i][1])
	return total




func vitrina_hitos_cobrados() -> int:
	if _vitrina_hitos < 0:
		_vitrina_hitos = _hitos_de(_vitrina_pct_sin(["copas"]))
	return maxi(_hitos_de(vitrina_pct()), _vitrina_hitos)


static func _hitos_de(pct: float) -> int:
	var n: int = 0
	for h in HITOS_VITRINA:
		if pct >= float(h[0]):
			n += 1
	return n


func ganadas() -> int:
	return ganadas_por_logros() + ganadas_por_vitrina() + _bonos_retiro + _compradas_estrellas + _regaladas_estrellas


func compradas_estrellas() -> int:
	return _compradas_estrellas





func abonar_compra(n: int) -> void:
	if n <= 0:
		return
	_compradas_estrellas += n
	_guardar()
	cambio.emit()



func abonar_regalo(n: int) -> void:
	if n <= 0:
		return
	_regaladas_estrellas += n
	_guardar()
	cambio.emit()


func gastadas() -> int:
	return _gastadas


func disponibles() -> int:
	return maxi(0, ganadas() - _gastadas)


func retiros() -> int:
	return _retiros




func tier_idx(name: String) -> int:
	for i in Legacy.TIERS.size():
		if String(Legacy.TIERS[i]["name"]) == name:
			return i
	return 0



func bono_de(tier_idx: int) -> int:
	return int(BONO_RETIRO[clampi(tier_idx, 0, BONO_RETIRO.size() - 1)])




func abonar_retiro(tier_idx: int) -> int:
	var bono: int = bono_de(tier_idx)
	_bonos_retiro += bono
	_retiros += 1
	_guardar()
	cambio.emit()
	return bono








func tiene(id: String) -> bool:
	if _compradas.has(id):
		return true
	var p: Dictionary = pack_by_id(id)
	if not p.is_empty():
		if _todas_las_ventajas():
			return true
		for f in p["ids"]:
			if not tiene(String(f)):
				return false
		return true
	var suyo: Dictionary = pack_de(id)
	if suyo.is_empty():
		return false
	return _compradas.has(String(suyo["id"])) or _todas_las_ventajas()


func _todas_las_ventajas() -> bool:
	return Store.tiene_derecho(String(Iap.DERECHO_VENTAJAS["id"]))


func pack_by_id(id: String) -> Dictionary:
	for p in PACKS:
		if String(p["id"]) == id:
			return p
	return {}



func pack_de(id: String) -> Dictionary:
	for p in PACKS:
		if (p["ids"] as Array).has(id):
			return p
	return {}



func del_pack_ya_tienes(pack_id: String) -> int:
	var p: Dictionary = pack_by_id(pack_id)
	var n: int = 0
	for f in p.get("ids", []):
		if tiene(String(f)):
			n += 1
	return n







func precio_de(id: String) -> int:
	var p: Dictionary = pack_by_id(id)
	if p.is_empty() or tiene(id):
		return 0
	var total: int =(p["ids"] as Array).size()
	var faltan: int = total - del_pack_ya_tienes(id)
	var bruto: float = float(p["precio"]) * float(faltan) / float(total)
	return int(ceil(bruto / 50.0)) * 50




func existe(id: String) -> bool:
	return not pack_by_id(id).is_empty() or not kit_by_id(id).is_empty() \
			or not Rebirth.by_id(id).is_empty()


func kit_by_id(id: String) -> Dictionary:
	for k in KITS:
		if String(k["id"]) == id:
			return k
	return {}







const KITS_ELEGIDOS: String = "__kits_elegidos"



func kits_de(t: int) -> Array:
	var out: Array = []
	for k in KITS:
		if int(k.get("tier", 1)) == t:
			out.append(k)
	return out


func kits_activos() -> Array:
	var out: Array = []
	for k in KITS:
		if tiene(String(k["id"])):
			out.append(k)
	return out



func presupuesto_extra() -> int:
	return 1 if _compradas.has(ID_PRESUPUESTO) else 0




func se_puede_comprar(id: String) -> bool:
	if pack_by_id(id).is_empty() or tiene(id):
		return false
	return disponibles() >= precio_de(id)




func comprar(id: String) -> bool:
	if not se_puede_comprar(id):
		return false
	_gastadas += precio_de(id)
	_compradas.append(id)
	_guardar()
	cambio.emit()
	return true





func otorgar(id: String) -> void:
	if not existe(id) or _compradas.has(id):
		return
	_compradas.append(id)
	_guardar()
	cambio.emit()





func vitrina_veces(key: String) -> int:
	return int(_vitrina.get(key, 0))



func vitrina_count() -> int:
	var validas: Dictionary = {}
	for g in Trophies.album_grupos():
		for it in g["items"]:
			validas[String(it["key"])] = true
	var n: int = 0
	for k in _vitrina:
		if validas.has(k) and int(_vitrina[k]) > 0:
			n += 1
	return n


func vitrina_pct() -> float:
	return _vitrina_pct_sin([])




func _vitrina_pct_sin(fuera: Array) -> float:
	var tot: int = 0
	var n: int = 0
	for g in Trophies.album_grupos():
		if fuera.has(String(g["id"])):
			continue
		for it in g["items"]:
			tot += 1
			if int(_vitrina.get(String(it["key"]), 0)) > 0:
				n += 1
	return 100.0 * float(n) / float(maxi(tot, 1))













func vitrina_vuelca(con_salon: bool = false) -> void:
	var fuentes: Array[Dictionary] = []
	if not Career.awards.is_empty():
		fuentes.append(Trophies.album_ganadas(Career.awards,
			Career.season_history, Career.current_season_awards(),
			GameState.player_team_id, GameState.player_div()))
	if con_salon:
		for p in SalonFama.placas():
			var awards: Array = p.get("awards", []) as Array
			if awards.is_empty():
				continue
			var foto: Dictionary = p.get("museo", {}) as Dictionary

			fuentes.append(Trophies.album_ganadas(awards,
				foto.get("season_history", []) as Array, [], "", 1))
	var cambio_algo: bool = false
	for ganadas_ya in fuentes:
		for k in ganadas_ya:
			var n: int = int(ganadas_ya[k])
			if n > int(_vitrina.get(k, 0)):
				_vitrina[k] = n
				cambio_algo = true



	var antes: int = _vitrina_hitos
	var hitos: int = vitrina_hitos_cobrados()
	if hitos != antes:
		_vitrina_hitos = hitos
		cambio_algo = true
	if cambio_algo:
		_guardar()
		cambio.emit()




func _cargar() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(save_path) != OK:
		return
	_compradas = PackedStringArray(cfg.get_value("herencia", "compradas", PackedStringArray()))
	_gastadas = int(cfg.get_value("herencia", "gastadas", 0))
	_bonos_retiro = int(cfg.get_value("herencia", "bonos_retiro", 0))
	_retiros = int(cfg.get_value("herencia", "retiros", 0))
	_compradas_estrellas = int(cfg.get_value("herencia", "compradas_estrellas", 0))
	_regaladas_estrellas = int(cfg.get_value("herencia", "regaladas_estrellas", 0))
	_vitrina = Dictionary(cfg.get_value("herencia", "vitrina", {}))
	_vitrina_hitos = int(cfg.get_value("herencia", "vitrina_hitos", -1))


func _guardar() -> void:

	if GameState.readonly_save and save_path == SAVE_PATH:
		return
	var cfg: ConfigFile = ConfigFile.new()
	cfg.set_value("herencia", "compradas", _compradas)
	cfg.set_value("herencia", "gastadas", _gastadas)
	cfg.set_value("herencia", "bonos_retiro", _bonos_retiro)
	cfg.set_value("herencia", "retiros", _retiros)
	cfg.set_value("herencia", "compradas_estrellas", _compradas_estrellas)
	cfg.set_value("herencia", "regaladas_estrellas", _regaladas_estrellas)
	cfg.set_value("herencia", "vitrina", _vitrina)
	cfg.set_value("herencia", "vitrina_hitos", _vitrina_hitos)
	SaveSlotsScript.escribe_atomico(save_path, cfg.encode_to_text())





func _test_limpiar() -> void:
	_compradas = PackedStringArray()
	_gastadas = 0
	_bonos_retiro = 0
	_retiros = 0
	_compradas_estrellas = 0
	_regaladas_estrellas = 0
	_vitrina = {}
	_vitrina_hitos = -1
	cambio.emit()



func _test_regalar(n: int) -> void:
	_bonos_retiro += n
	cambio.emit()
