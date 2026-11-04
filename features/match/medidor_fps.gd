class_name MedidorFps
extends RefCounted













































const ARRANQUE_S: float = 5.0
const VENTANA_S: float = 5.0
const TOPE_FOTOGRAMA_S: float = 0.5


const LENTO_S: float = 0.02


const MIN_VENTANAS: int = 12




const CORTES_MS: Array[float] = [12.5, 20.8, 29.2, 37.5]

const TIRON_MS: float = 50.0
const TIRON_GORDO_MS: float = 100.0



const TOPE_TIRON_S: float = 2.0

var _arranque: float = 0.0
var _v_seg: float = 0.0
var _v_fot: int = 0

var ventanas: PackedFloat32Array = PackedFloat32Array()

var hist: PackedInt32Array = PackedInt32Array([0, 0, 0, 0, 0])
var _t50: int = 0
var _t100: int = 0
var _ta: int = 0
var _dtx: float = 0.0




var _c_suma: PackedFloat32Array = PackedFloat32Array([0.0, 0.0, 0.0, 0.0, 0.0])
var _c_n: PackedInt32Array = PackedInt32Array([0, 0, 0, 0, 0])
var _c_vent: Array[PackedFloat32Array] = [PackedFloat32Array(), PackedFloat32Array(),
	PackedFloat32Array(), PackedFloat32Array(), PackedFloat32Array()]





var hf: PackedInt32Array = PackedInt32Array([0, 0, 0, 0])
var _hz_min: int = -1
var _hz_max: int = -1



var _mem_min: int = -1
var _vram_max: int = -1
var _pc0: int = -1
var _pc_arr: int = -1
var _pc_ult: int = -1











func muestra(dt: float, pausado: bool, cs_ms: float = -1.0, cr_ms: float = -1.0,
		cg_ms: float = -1.0, ticks: int = -1, cf_ms: float = -1.0, cft_ms: float = -1.0) -> void:
	if pausado or dt <= 0.0 or dt > TOPE_TIRON_S:
		return
	var ms: float = dt * 1000.0
	if _arranque < ARRANQUE_S:
		if ms > TIRON_MS:
			_ta += 1
		if dt <= TOPE_FOTOGRAMA_S:
			_arranque += dt
		return
	if ms > TIRON_MS:
		_t50 += 1
		if ms > TIRON_GORDO_MS:
			_t100 += 1
	_dtx = maxf(_dtx, dt)
	if dt > TOPE_FOTOGRAMA_S:
		return
	hist[cubo(ms)] += 1
	_suma_coste(0, cs_ms)
	_suma_coste(1, cr_ms)
	_suma_coste(2, cg_ms)
	_suma_coste(3, cf_ms)
	_suma_coste(4, cft_ms)
	if ticks >= 0:
		hf[mini(ticks, 3)] += 1
	_v_seg += dt
	_v_fot += 1
	if _v_seg >= VENTANA_S:
		ventanas.append(_v_seg / float(_v_fot))
		_v_seg = 0.0
		_v_fot = 0
		for i in _c_n.size():
			if _c_n[i] > 0:
				_c_vent[i].append(_c_suma[i] / float(_c_n[i]))
			_c_suma[i] = 0.0
			_c_n[i] = 0



func _suma_coste(i: int, v: float) -> void:
	if v > 0.0:
		_c_suma[i] += v
		_c_n[i] += 1



static func cubo(ms: float) -> int:
	for i in CORTES_MS.size():
		if ms < CORTES_MS[i]:
			return i
	return CORTES_MS.size()





func nota_hz(hz: float) -> void:
	if hz <= 0.0:
		return
	var h: int = roundi(hz)
	_hz_min = h if _hz_min < 0 else mini(_hz_min, h)
	_hz_max = maxi(_hz_max, h)






func nota_memoria(libre_b: int, vram_b: int) -> void:
	if libre_b > 0:
		_mem_min = libre_b if _mem_min < 0 else mini(_mem_min, libre_b)
	if vram_b > 0:
		_vram_max = maxi(_vram_max, vram_b)





func nota_pipelines(total: int) -> void:
	if _pc0 < 0:
		_pc0 = total
	if _arranque < ARRANQUE_S:
		_pc_arr = total
	_pc_ult = total







func resultado() -> Dictionary:
	var n: int = ventanas.size()
	if n == 0:
		return {"ventanas": 0, "med": 0, "p10": 0, "lento": false}
	var orden: PackedFloat32Array = ventanas.duplicate()
	orden.sort()
	var med_dt: float = _mediana(orden)

	var p10_dt: float = orden[clampi(int(ceil(0.9 * n)) - 1, 0, n - 1)]

	var k: int = maxi(1, n / 4)
	var ini: float = 0.0
	var fin: float = 0.0
	for i in k:
		ini += ventanas[i]
		fin += ventanas[n - 1 - i]
	var pc: int = -1
	var pca: int = -1
	if _pc0 >= 0:
		pca = maxi(_pc_arr - _pc0, 0)
		pc = maxi(_pc_ult - _pc_arr, 0)
	return {
		"ventanas": n,
		"med": roundi(1.0 / maxf(med_dt, 0.001)),
		"p10": roundi(1.0 / maxf(p10_dt, 0.001)),
		"lento": n >= MIN_VENTANAS and med_dt > LENTO_S,
		"b": Array(hist),
		"t50": _t50,
		"t100": _t100,
		"ta": _ta,
		"dtx": roundi(_dtx * 1000.0),
		"v1": roundi(float(k) / maxf(ini, 0.001)),
		"vn": roundi(float(k) / maxf(fin, 0.001)),
		"cs": _decimas(_c_vent[0]),
		"cr": _decimas(_c_vent[1]),
		"cg": _decimas(_c_vent[2]),
		"cf": _decimas(_c_vent[3]),
		"cft": _decimas(_c_vent[4]),
		"hf": Array(hf),
		"hz": [_hz_min, _hz_max],
		"pc": pc,
		"pca": pca,
		"memd": _mb(_mem_min),
		"vram": _mb(_vram_max),
	}



static func _mb(b: int) -> int:
	return -1 if b < 0 else int(b / 1048576)


static func _mediana(orden: PackedFloat32Array) -> float:
	var n: int = orden.size()
	return orden[n / 2] if n % 2 == 1 else (orden[n / 2 - 1] + orden[n / 2]) * 0.5



static func _decimas(v: PackedFloat32Array) -> int:
	if v.is_empty():
		return -1
	var orden: PackedFloat32Array = v.duplicate()
	orden.sort()
	return roundi(_mediana(orden) * 10.0)
