extends RefCounted





























const _CPU = preload("res://features/match/particulas_cpu.gd")
const _PROCESO = preload("res://features/match/proceso_particulas.gd")
const _RAMPA = preload("res://features/match/rampa_cpu.gd")


static var forzar_cpu: bool = false
static var _cpu: int = -1


static func usa_cpu() -> bool:
	if forzar_cpu:
		return true
	if _cpu < 0:
		var gl: bool = RenderingServer.get_current_rendering_method() == "gl_compatibility"
		_cpu = 1 if OS.get_name() == "Android" and gl else 0
	return _cpu == 1



static func nodo() -> GeometryInstance3D:
	if usa_cpu():
		return _CPU.new()
	return GPUParticles3D.new()



static func proceso() -> Resource:
	if usa_cpu():
		return _PROCESO.new()
	return ParticleProcessMaterial.new()








static func rampa(g: Gradient) -> Texture2D:
	if usa_cpu():
		var r: Resource = _RAMPA.new()
		r.set(&"gradient", g)
		return r as Texture2D
	var t := GradientTexture1D.new()
	t.gradient = g
	return t




static func curva(c: Curve) -> Texture2D:
	if usa_cpu():
		var r: Resource = _RAMPA.new()
		r.set(&"curve", c)
		return r as Texture2D
	var t := CurveTexture.new()
	t.curve = c
	return t



static func es(n: Object) -> bool:
	return n is GPUParticles3D or n is CPUParticles3D
