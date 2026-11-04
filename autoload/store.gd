extends Node











































signal intento_listo(ok: bool, motivo: String)



signal caja_lista()




signal entrega(pid: String)






signal restauracion_lista(tenia: bool)



const SINGLETON: String = "StoreKitBridge"

const SAVE_PATH: String = "user://store.cfg"



const SaveSlotsScript = preload("res://autoload/save_slots.gd")

const PuentePlay = preload("res://autoload/puente_play.gd")




var save_path: String = SAVE_PATH













const IAP_ACTIVA: bool = true


var _puente: Object = null




var _precios_caja: Dictionary = {}



var _fichas_pedidas_ms: int = 0








var _pendientes: PackedStringArray = PackedStringArray()













var _derechos: PackedStringArray = PackedStringArray()








var _reinicios: int = 0


func _ready() -> void:
	_cargar()
	_puente = _puente_de_la_plataforma()
	if _puente == null:
		return
	_ata()







func _puente_de_la_plataforma() -> Object:
	if Engine.has_singleton(SINGLETON):
		return Engine.get_singleton(SINGLETON)
	if Engine.has_singleton(PuentePlay.SINGLETON):
		var clave: CryptoKey = PuentePlay.clave_de(PuentePlay.CLAVE_PLAY)
		if clave == null:
			push_warning("Store: Android sin CLAVE_PLAY — tienda apagada")
			return null
		return PuentePlay.new(Engine.get_singleton(PuentePlay.SINGLETON), clave)
	return null




func _ata() -> void:



	if not _puente.has_signal("comprado_id"):
		return
	_puente.connect("comprado_id", _on_comprado_id)
	_puente.connect("compra_falla", _on_compra_falla)
	_puente.connect("compra_cancelada", _on_compra_cancelada)



	if _puente.has_signal("restauracion_lista"):
		_puente.connect("restauracion_lista", _on_restauracion_lista)








	_puente.call("arrancar", "")




	if IAP_ACTIVA and _puente.has_method("pedir_fichas"):
		_puente.connect("producto_caja_listo", _on_producto_caja_listo)
		_puente.call("pedir_fichas", Iap.product_ids())
		_fichas_pedidas_ms = Time.get_ticks_msec()





	reclamar_pendientes.call_deferred()















func repide_fichas() -> void:
	if not IAP_ACTIVA or _puente == null or not _puente.has_method("pedir_fichas"):
		return
	if not _precios_caja.is_empty():
		return
	var ahora: int = Time.get_ticks_msec()
	if ahora - _fichas_pedidas_ms < 30000:
		return
	_fichas_pedidas_ms = ahora
	_puente.call("pedir_fichas", Iap.product_ids())




func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_RESUMED:
		repide_fichas()




func se_puede_pagar() -> bool:
	if _pagos_test:
		return true
	if _puente == null:
		return false
	return bool(_puente.call("se_puede_pagar"))


















func caja_disponible() -> bool:
	return IAP_ACTIVA and not _precios_caja.is_empty() and not SteamPuente.es_steam()








func precio_de(pid: String) -> String:
	return String(_precios_caja.get(pid, ""))




func comprar_pack(pid: String) -> bool:
	if _puente == null or not IAP_ACTIVA:
		return false
	if not _puente.has_method("comprar_id"):
		return false
	if String(_precios_caja.get(pid, "")).is_empty():
		return false
	return bool(_puente.call("comprar_id", pid))




func pendientes() -> PackedStringArray:
	return _pendientes.duplicate()






func reclamar_pendientes() -> void:
	for pid in _pendientes.duplicate():
		entrega.emit(String(pid))






func consumir(pid: String) -> void:
	var i: int = _pendientes.find(pid)
	if i < 0:
		return
	_pendientes.remove_at(i)
	_guardar()












func combo_disponible() -> bool:
	return caja_disponible() \
			and not precio_de(String(Iap.COMBO["pid"])).is_empty()















func reinicio_de_pago() -> bool:
	if _pagos_test:
		return IAP_ACTIVA
	return IAP_ACTIVA and _puente != null and _puente.has_method("comprar_id")



func reinicio_precio() -> String:
	return precio_de(String(Iap.REINICIO["pid"]))



func comprar_reinicio() -> bool:
	return comprar_pack(String(Iap.REINICIO["pid"]))




func reinicios_pagados() -> int:
	return _reinicios







func gastar_reinicio() -> bool:
	if _reinicios <= 0:
		return false
	_reinicios -= 1
	_guardar()
	return true
























func tiene_derecho(id: String) -> bool:
	if SteamPuente.es_steam():
		return false
	if _derechos.has(id):
		return true
	for d in Iap.DERECHOS_LEGADO:
		if (d.get("incluye", []) as Array).has(id) and _derechos.has(String(d["id"])):
			return true
	return false







func derecho_ventajas_disponible() -> bool:
	return caja_disponible() \
			and not precio_de(String(Iap.DERECHO_VENTAJAS["pid"])).is_empty()







func derecho_disponible(d: Dictionary) -> bool:
	return caja_disponible() and not precio_de(String(d["pid"])).is_empty()








func se_puede_restaurar() -> bool:
	return _puente != null and _puente.has_method("restaurar")










func restaurar_compras() -> bool:
	if _puente == null or not _puente.has_method("restaurar"):
		return false
	return bool(_puente.call("restaurar"))







func es_play() -> bool:
	return _puente is PuentePlay



func texto_no_responde() -> String:
	if es_play():
		return I18n.t(PuentePlay.NO_RESPONDE)
	return I18n.t("La App Store no responde. Revisa tu conexión y vuelve a intentarlo.")



func texto_restaurado(tenia: bool) -> String:
	if es_play():
		return I18n.t("Listo: ya recuperaste lo que habías comprado con esta cuenta de Google.") \
				if tenia else I18n.t("Esta cuenta de Google no tiene compras que recuperar en Football Legacy.")
	return I18n.t("Listo: ya recuperaste lo que habías comprado con este Apple ID.") if tenia \
			else I18n.t("Este Apple ID no tiene compras que recuperar en Football Legacy.")



func texto_dinero_real() -> String:
	if es_play():
		return I18n.t("Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu cuenta de Google.")
	return I18n.t("Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu Apple ID.")



func nombre_tienda() -> String:
	return I18n.t("GOOGLE PLAY") if es_play() else I18n.t("APP STORE")





func _anotar_derecho(id: String) -> void:
	if _derechos.has(id):
		return
	_derechos.append(id)
	_guardar()





func _anotar_pendiente(pid: String) -> void:
	_pendientes.append(pid)
	_guardar()


func _on_producto_caja_listo(pid: String, texto: String) -> void:
	if texto.is_empty():
		return
	_precios_caja[pid] = texto
	caja_lista.emit()













func _on_comprado_id(pid: String) -> void:
	if Iap.by_product(pid).is_empty():
		push_warning("Store: llegó un producto desconocido (%s)" % pid)
		intento_listo.emit(false, "")
		return
	if Iap.es_derecho(pid):
		var d: Dictionary = Iap.by_product(pid)
		_anotar_derecho(String(d["id"]))


		if d.has("herencia"):
			Herencia.otorgar(String(d["herencia"]))




		intento_listo.emit(true, "")
		return
	if Iap.es_reinicio(pid):





		_reinicios += 1
		_guardar()
		intento_listo.emit(true, "")
		return
	if Iap.es_estrellas(pid):





		Herencia.abonar_compra(int(Iap.by_product(pid).get("cuanto", 0)))
		intento_listo.emit(true, "")
		return
	_anotar_pendiente(pid)
	entrega.emit(pid)
	intento_listo.emit(true, "")





func _on_restauracion_lista(tenia: bool) -> void:
	restauracion_lista.emit(tenia)




func _on_compra_falla(motivo: String) -> void:
	intento_listo.emit(false, motivo)


func _on_compra_cancelada() -> void:
	intento_listo.emit(false, "")









func evento_sin_cobro(motivo: String) -> String:
	if motivo.is_empty():
		return "caja_cancelada"
	if motivo == PuentePlay.PENDIENTE or motivo == I18n.t(PuentePlay.PENDIENTE):
		return "caja_pendiente"
	return "caja_fallo"




func _cargar() -> void:
	var cfg := ConfigFile.new()
	if cfg.load(save_path) != OK:
		return




	_pendientes = PackedStringArray(
		cfg.get_value("compra", "pendientes", PackedStringArray()))




	_derechos = PackedStringArray(
		cfg.get_value("derechos", "comprados", PackedStringArray()))


	_reinicios = int(cfg.get_value("reinicio", "pagados", 0))


func _guardar() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("compra", "pendientes", _pendientes)
	cfg.set_value("derechos", "comprados", _derechos)
	cfg.set_value("reinicio", "pagados", _reinicios)
	SaveSlotsScript.escribe_atomico(save_path, cfg.encode_to_text())







var _pagos_test: bool = false


func _test_pagos(v: bool) -> void:
	_pagos_test = v








func _test_caja(precios: Dictionary) -> void:
	_precios_caja = precios.duplicate()
	caja_lista.emit()





func _test_comprado(pid: String) -> void:
	_on_comprado_id(pid)




func _test_limpiar_pendientes() -> void:
	_pendientes = PackedStringArray()
	_guardar()











func _test_atar(p: Object) -> void:
	_puente = p
	_ata()


func _test_puente(p: Object) -> void:
	_puente = p



func _test_cancelada() -> void:
	_on_compra_cancelada()




func _test_limpiar_reinicios() -> void:
	_reinicios = 0
	_guardar()





func _test_quitar_derechos() -> void:
	_derechos = PackedStringArray()
	_guardar()




func _test_restauracion(tenia: bool) -> void:
	_on_restauracion_lista(tenia)
