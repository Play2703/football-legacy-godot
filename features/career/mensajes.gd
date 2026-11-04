class_name Mensajes
extends RefCounted
























const VERSION: int = 1
const MAX_VIVOS: int = 3
const NUEVOS_NOCHE: int = 2
const VIDA: int = 2




const RUMOR: String = "rumor"
const RUMOR_PALABRA: String = "rumor_palabra"
const COMPANERO: String = "companero"
const HINCHA: String = "hincha"
const NINO: String = "nino"
const IDOLO: String = "idolo"
const TIPOS: Array = [RUMOR, RUMOR_PALABRA, COMPANERO, HINCHA, NINO, IDOLO]





const PLANTILLA: Dictionary = {
	RUMOR: "Se sabe que te seguimos. Lo que digas lo oyen tu grada y nuestro despacho.",
	RUMOR_PALABRA: "Respetamos tu palabra, {0}. La puerta sigue abierta.",
	COMPANERO: "¡Vaya pase me diste, crack! Ese gol es medio tuyo.",
	HINCHA: "Gracias por la camiseta del túnel, {0}. Desde entonces no me pierdo un gol tuyo.",
	NINO: "¡Tu camiseta ya está colgada en mi cuarto, {0}!",
	IDOLO: "Me alegró verte, {0}. Sigue así.",
}




const RESPUESTAS: Dictionary = {
	RUMOR: {"a": "NO ME CIERRO A NADA", "b": "ESTOY CENTRADO AQUÍ"},
	COMPANERO: {"a": "AGRADECER"},
	HINCHA: {"a": "RESPONDER"},
}


const TU_RESPUESTA: Dictionary = {
	RUMOR: {"a": "En el fútbol nunca se sabe.", "b": "Mi sitio está aquí."},
	COMPANERO: {"a": "El próximo te lo pongo yo."},
	HINCHA: {"a": "¡Gracias por estar siempre!"},
}






static func fila(tipo: String, quien: String, club: String, nace: int, semilla: int) -> Dictionary:
	return {"tipo": tipo, "quien": quien, "club": club, "nace": nace, "visto": false,
		"resp": "", "semilla": semilla&2147483647}



static func con_botones(f: Dictionary) -> bool:
	return RESPUESTAS.has(String(f.get("tipo", "")))




static func pendiente(f: Dictionary) -> bool:
	return con_botones(f) and String(f.get("resp", "")).is_empty()









static func cabe(lista: Array, f: Dictionary, noche: int = 0, vivo: Callable = Callable()) -> bool:
	if lista.size() < MAX_VIVOS:
		return not con_botones(f) or noche < NUEVOS_NOCHE
	if con_botones(f):
		return false
	return _mas_vieja_libre(lista, vivo) >= 0




static func empuja(lista: Array, f: Dictionary, noche: int = 0, vivo: Callable = Callable()) -> Array:
	var out: Array = lista.duplicate(true)
	if not cabe(lista, f, noche, vivo):
		return out
	if out.size() >= MAX_VIVOS:
		out.remove_at(_mas_vieja_libre(out, vivo))
	out.push_front(f.duplicate(true))
	return out





static func _mas_vieja_libre(lista: Array, vivo: Callable = Callable()) -> int:
	for i in range(lista.size() - 1, -1, -1):
		var f: Dictionary = lista[i] as Dictionary
		if not (pendiente(f) and (not vivo.is_valid() or bool(vivo.call(f)))):
			return i
	return -1




static func caduca(lista: Array, reloj: int) -> Array:
	var out: Array = []
	for f in lista:
		if reloj - int((f as Dictionary).get("nace", reloj)) < VIDA:
			out.append(f)
	return out






static func quedan(f: Dictionary, reloj: int) -> int:
	return clampi(VIDA -(reloj - int(f.get("nace", reloj))), 0, VIDA)



static func vivos(lista: Array) -> int:
	return lista.size()





static func sin_ver(lista: Array, vivo: Callable = Callable()) -> int:
	var n: int = 0
	for f in lista:
		if bool((f as Dictionary).get("visto", false)):
			continue
		if vivo.is_valid() and not bool(vivo.call(f)):
			continue
		n += 1
	return n





static func sanea(v: Variant) -> Array:
	var out: Array = []
	if not v is Array:
		return out
	for f in (v as Array):
		if not f is Dictionary:
			continue
		var d: Dictionary = f as Dictionary
		var tipo: String = str(d.get("tipo", ""))
		if not TIPOS.has(tipo):
			continue
		var nace: Variant = d.get("nace")
		if not (nace is int or nace is float):
			continue
		var resp: String = str(d.get("resp", ""))
		if not (RESPUESTAS.get(tipo, {}) as Dictionary).has(resp):
			resp = ""
		var limpia: Dictionary = fila(tipo, str(d.get("quien", "")), str(d.get("club", "")),
			int(nace), int(d.get("semilla", 0)))
		limpia["visto"] = bool(d.get("visto", false))
		limpia["resp"] = resp

		for k in ["season", "partido", "gf", "ga"]:
			if d.get(k) is int or d.get(k) is float:
				limpia[k] = int(d[k])

		if d.get("nombre") is String and not String(d["nombre"]).is_empty():
			limpia["nombre"] = String(d["nombre"])
		out.append(limpia)
		if out.size() >= MAX_VIVOS:
			break
	return out
