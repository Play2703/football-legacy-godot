class_name OvrCap
extends RefCounted


































































































const _HORNEADO = preload("res://features/league/ovr_cap_base.gd")



const PACK_PATH: String = "user://ovr_cap_pack.cfg"


const CAP: int = 95


const ELITE: int = 90
const ELITE_MAX: int = 15




const ANCLA: float = 85.0







const ELITE_LO: float = 90.5
const ELITE_HI: float = 95.4
const SUB_HI: float = 89.4





const CENSO_RATING: int = 80



static var _corte: float = -1.0
static var _tope: float = -1.0



static var _censo_seed: int = -1
static var _censo_season: int = -1

static var _enabled: bool = true




static var _censando: bool = false




static var _fabrica_vale: bool = true











static func escala(crudo: float) -> int:
	if not _enabled or _censando:
		return clampi(int(round(crudo)), 25, 99)
	var c: float = corte()





	if c < float(ELITE) - 0.5:
		return mini(clampi(int(round(crudo)), 25, 99), CAP)
	if crudo >= c:












		var pico: float = maxf(_tope, crudo)
		var hi: float = minf(ELITE_HI, maxf(pico, ELITE_LO))
		var span: float = maxf(pico - c, 0.001)
		var t: float = clampf((crudo - c) / span, 0.0, 1.0)
		return mini(int(round(ELITE_LO +(hi - ELITE_LO) * t)), CAP)
	if crudo <= ANCLA:
		return clampi(int(round(crudo)), 25, 99)
	var u: float =(crudo - ANCLA) / maxf(c - ANCLA, 0.001)
	return int(round(ANCLA +(SUB_HI - ANCLA) * u))







static func corte() -> float:
	if _corte >= 0.0 and _censo_seed == WorldAging.world_seed() \
			and _censo_season == WorldAging.season():
		return _corte
	_censar_o_fabrica()
	return _corte






static func tope() -> float:
	if _tope >= 0.0 and _censo_seed == WorldAging.world_seed() \
			and _censo_season == WorldAging.season():
		return _tope
	_censar_o_fabrica()
	return _tope





static func set_corte(corte_val: float, tope_val: float) -> void:
	_corte = corte_val
	_tope = maxf(tope_val, corte_val)
	_censo_seed = WorldAging.world_seed()
	_censo_season = WorldAging.season()
	_fabrica_vale = false





static func _censar_o_fabrica() -> void:
	if _censando or not _sin_carrera():
		_censar()
		return
	if _sin_capas():
		_pon(_HORNEADO.CORTE, _HORNEADO.TOPE)
		return
	var huella: String = _huella_pack()
	var cfg: ConfigFile = ConfigFile.new()
	if huella != "" and cfg.load(ToolStash.activa(PACK_PATH)) == OK \
			and str(cfg.get_value("censo", "huella", "")) == huella:
		_pon(_de_bits(cfg.get_value("censo", "corte", 0)), _de_bits(cfg.get_value("censo", "tope", 0)))
		return
	var crudos: Array[float] = _censar()

	if huella == "" or crudos.size() < ELITE_MAX:
		return
	cfg = ConfigFile.new()
	cfg.set_value("censo", "huella", huella)
	cfg.set_value("censo", "corte", _a_bits(_corte))
	cfg.set_value("censo", "tope", _a_bits(_tope))
	cfg.save(ToolStash.activa(PACK_PATH))




static func _pon(corte_val: float, tope_val: float) -> void:
	_corte = corte_val
	_tope = tope_val
	_censo_seed = WorldAging.world_seed()
	_censo_season = WorldAging.season()





static func _a_bits(x: float) -> int:
	var b: PackedByteArray = PackedByteArray()
	b.resize(8)
	b.encode_double(0, x)
	return b.decode_s64(0)


static func _de_bits(v: Variant) -> float:
	var b: PackedByteArray = PackedByteArray()
	b.resize(8)
	b.encode_s64(0, int(v))
	return b.decode_double(0)











static func _huella_pack() -> String:
	if SquadEdits.pendiente() or SquadEdits._lote > 0 or TeamEdits._lote > 0:
		return ""
	var partes: PackedStringArray = []
	for ruta in [SquadEdits.save_path(), TeamEdits.save_path()]:
		partes.append(FileAccess.get_md5(ruta) if FileAccess.file_exists(ruta) else "-")
	if partes[0] == "-" and partes[1] == "-":
		return ""
	partes.append(str(_HORNEADO.HUELLA))
	partes.append("%d:%d" % [CENSO_RATING, ELITE_MAX])
	partes.append(Telemetry.version())
	return "|".join(partes)





static func _de_fabrica() -> bool:
	return _sin_carrera() and _sin_capas()





static func _sin_capas() -> bool:
	if SquadEdits.edited_team_count() > 0 or TeamEdits.edited_count() > 0:
		return false
	return RosterDelta._base.is_empty()





static func _sin_carrera() -> bool:
	if not _fabrica_vale or Career.has_save():
		return false
	if not WorldAging.is_enabled() or WorldAging.season() > 1:
		return false
	if not (ClubForm._pyramid.is_empty() and ClubForm._dev.is_empty() and ClubForm._perf.is_empty()):
		return false
	if not (TransferBook._data.is_empty() and TransferBook._loans.is_empty()):
		return false
	if CareerEdits.edited_team_count() > 0 or EuroCrown.crowned_clubs() > 0:
		return false
	if not (Squad.coach_plan.is_empty() and Squad._forma_dia.is_empty() and Squad._lineups.is_empty()):
		return false
	return RosterDelta._career.is_empty()





static func censar() -> Array[float]:
	return _censar()


static func _censar() -> Array[float]:
	var crudos: Array[float] = []
	if _censando:
		return crudos
	_censando = true
	for t in Teams.all():
		var id: String = String(t.get("id", ""))
		if Teams.rating(id) < CENSO_RATING:
			continue
		for p in Squad.of(id):
			var ficha: Dictionary = p
			crudos.append(SquadMeta.ovr_raw_of(ficha,
				String(ficha.get("pos", "MC"))))
	_censando = false
	crudos.sort()
	crudos.reverse()

	_tope = crudos[0] if crudos.size() > 0 else 0.0
	_corte = crudos[ELITE_MAX - 1] if crudos.size() >= ELITE_MAX else 0.0
	_censo_seed = WorldAging.world_seed()
	_censo_season = WorldAging.season()
	return crudos






static func invalidate() -> void:
	_corte = -1.0
	_tope = -1.0
	_censo_seed = -1
	_censo_season = -1
	_fabrica_vale = false






static func suspend() -> void:
	_enabled = false


static func resume() -> void:
	_enabled = true


static func is_enabled() -> bool:
	return _enabled
