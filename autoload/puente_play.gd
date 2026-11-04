extends RefCounted




































signal comprado_id(pid: String)
signal compra_falla(motivo: String)
signal compra_cancelada()
signal restauracion_lista(tenia: bool)
signal producto_caja_listo(pid: String, texto: String)

const SINGLETON: String = "GodotGooglePlayBilling"






const CLAVE_PLAY: String = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk1LDKewwG0R5knmtWVKDblm8Jo4XCSple7+WHPGrnOcPLove1h9XXCNqrSPfH0af6QSicDveldU43RR8Xb9yAhruwX2h2ZELR6Itid6YLvUi1g/2+YkPaHWz4sZ7C5Al9XE+2Y/OPp+aXCfsPYm8SmtL+2yASs/Oi7KnJ9FeDno2ZJAdnYNJfvM8/WtBCs6Z6LK1AC63/Iq0rGxAxMJoyDszW86ho0Ko0tubSA+PT+26/LXrDbySCy6dW9szneSLBPLgJz4vLjn2LuDAR0KPbZK2ZtA+xhQbEhaUkHx4lxxHoDXQXgVH54xaVGfaZPt1fqOu+ta4rvu4FufL4p46vwIDAQAB"





const TOKENS_PATH: String = "user://play_tokens.cfg"


const R_OK: int = 0
const USER_CANCELED: int = 1
const ITEM_ALREADY_OWNED: int = 7
const PURCHASED: int = 1
const PENDING: int = 2




const NO_RESPONDE: String = "Google Play no responde. Revisa tu conexión y vuelve a intentarlo."
const PENDIENTE: String = "Tu pago quedó pendiente: lo recibirás en cuanto se confirme."

var tokens_path: String = TOKENS_PATH

var _cliente: Object = null
var _clave: CryptoKey = null
var _crypto := Crypto.new()
var _conectado: bool = false
var _fichas_pedidas: PackedStringArray = PackedStringArray()



var _opciones: Dictionary = {}
var _entregados: Dictionary = {}


var _restaurando: bool = false


var _reclamo: String = ""


var _ultimo_pid: String = ""




func _init(cliente: Object, clave: CryptoKey, ruta: String = TOKENS_PATH) -> void:
	_cliente = cliente
	_clave = clave
	tokens_path = ruta
	_cargar()









	_cliente.call("initPlugin")
	_cliente.connect("connected", _on_conectado)
	_cliente.connect("disconnected", _on_desconectado)
	_cliente.connect("query_product_details_response", _on_fichas)
	_cliente.connect("query_purchases_response", _on_compras)
	_cliente.connect("on_purchase_updated", _on_compra_actualizada)





static func clave_de(b64: String) -> CryptoKey:
	var limpio: String = b64.strip_edges().replace("\n", "").replace(" ", "")
	if limpio.is_empty():
		return null
	var pem: String = "-----BEGIN PUBLIC KEY-----\n"
	for i in range(0, limpio.length(), 64):
		pem += limpio.substr(i, 64) + "\n"
	pem += "-----END PUBLIC KEY-----\n"
	var k := CryptoKey.new()
	if k.load_from_string(pem, true) != OK:
		return null
	return k






func arrancar(_pid: String) -> void:
	_cliente.call("startConnection")




func se_puede_pagar() -> bool:
	return _conectado


func pedir_fichas(ids: PackedStringArray) -> void:
	_fichas_pedidas = ids
	if _conectado:
		_cliente.call("queryProductDetails", ids, "inapp")


func comprar_id(pid: String) -> bool:
	if not _conectado:
		return false
	_ultimo_pid = pid
	var r: Variant = _cliente.call("purchase", pid, String(_opciones.get(pid, "")), "", false)
	return r is Dictionary and int((r as Dictionary).get("response_code", -99)) == R_OK



func restaurar() -> bool:
	if not _conectado or _restaurando:
		return false
	_restaurando = true
	_cliente.call("queryPurchases", "inapp", false)
	return true




func _on_conectado() -> void:
	_conectado = true
	if not _fichas_pedidas.is_empty():
		_cliente.call("queryProductDetails", _fichas_pedidas, "inapp")



	_cliente.call("queryPurchases", "inapp", false)



func _on_desconectado() -> void:
	_conectado = false


func _on_fichas(r: Dictionary) -> void:
	if int(r.get("response_code", -99)) != R_OK:
		return
	for d in r.get("product_details", []):
		var pid: String = String(d.get("product_id", ""))
		for o in d.get("one_time_purchase_offer_details_list", []):

			if o.get("offer_id") != null and not String(o.get("offer_id")).is_empty():
				continue
			_opciones[pid] = String(o.get("purchase_option_id", ""))
			producto_caja_listo.emit(pid, String(o.get("formatted_price", "")))
			break


func _on_compras(r: Dictionary) -> void:
	var restaurando: bool = _restaurando
	_restaurando = false
	var tenia: bool = false
	if int(r.get("response_code", -99)) == R_OK:
		for c in r.get("purchases", []):
			if _procesa(c, restaurando):
				tenia = true



	if not _reclamo.is_empty():
		var pid: String = _reclamo
		_reclamo = ""
		if Iap.es_derecho(pid):
			comprado_id.emit(pid)
		else:
			compra_falla.emit(I18n.t(NO_RESPONDE))
	if restaurando:
		restauracion_lista.emit(tenia)


func _on_compra_actualizada(r: Dictionary) -> void:
	var codigo: int = int(r.get("response_code", -99))
	if codigo == USER_CANCELED:
		compra_cancelada.emit()
		return
	if codigo == ITEM_ALREADY_OWNED:


		_reclamo = _ultimo_pid
		_cliente.call("queryPurchases", "inapp", false)
		return
	if codigo != R_OK:
		compra_falla.emit(I18n.t(NO_RESPONDE))
		return
	var alguna: bool = false
	for c in r.get("purchases", []):
		if int(c.get("purchase_state", 0)) == PENDING:
			compra_falla.emit(I18n.t(PENDIENTE))
			alguna = true
		elif _procesa(c, false):
			alguna = true


	if not alguna:
		compra_falla.emit(I18n.t(NO_RESPONDE))




func _procesa(c: Dictionary, restaurando: bool) -> bool:
	if int(c.get("purchase_state", 0)) != PURCHASED:
		return false
	if not _firma_buena(String(c.get("original_json", "")), String(c.get("signature", ""))):

		push_warning("PuentePlay: compra con firma inválida (%s)" % str(c.get("product_ids", [])))
		return false
	var token: String = String(c.get("purchase_token", ""))
	if token.is_empty():
		return false
	var hubo: bool = false
	for p in c.get("product_ids", []):
		var pid: String = String(p)
		if Iap.by_product(pid).is_empty():


			push_warning("PuentePlay: producto desconocido (%s)" % pid)
			continue
		hubo = true
		var nueva: bool = not _entregados.has(token)
		if nueva or (restaurando and Iap.es_derecho(pid)):
			comprado_id.emit(pid)







			if pid == _reclamo:
				_reclamo = ""
		if nueva:
			_entregados[token] = pid
			_guardar()
		if Iap.es_derecho(pid):
			if not bool(c.get("is_acknowledged", false)):
				_cliente.call("acknowledgePurchase", token)
		else:
			_cliente.call("consumePurchase", token)
	return hubo


func _firma_buena(json: String, firma_b64: String) -> bool:
	if _clave == null or json.is_empty() or firma_b64.is_empty():
		return false
	var firma: PackedByteArray = Marshalls.base64_to_raw(firma_b64)
	if firma.is_empty():
		return false
	var h := HashingContext.new()
	h.start(HashingContext.HASH_SHA1)
	h.update(json.to_utf8_buffer())
	return _crypto.verify(HashingContext.HASH_SHA1, h.finish(), firma, _clave)




func _cargar() -> void:
	var cfg := ConfigFile.new()
	if cfg.load(tokens_path) == OK:
		_entregados = cfg.get_value("play", "entregados", {})


func _guardar() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("play", "entregados", _entregados)
	cfg.save(tokens_path)
