extends RefCounted
























const EV_FALLO_TRAS_PASE: String = "fallo_tras_pase"

const EV_RELEVO: String = "relevo"


const EV_GOL_A_TU_PASE: String = "gol_a_tu_pase"




const SOCIO_MAX: int = 40





const SOCIO_TE_ANIMA: int = 20


const AF_SOCIO: float = float(SOCIO_TE_ANIMA) / float(SOCIO_MAX)



const SOCIO_TE_PROTESTA: int = -12




const VOCES_MAX: int = 3



const VOZ_PROTESTA: String = "protesta"





const GESTO_SOCIO: String = "socio"

















static func elegir(ev: String, ctx: Dictionary) -> Dictionary:
	match ev:
		EV_FALLO_TRAS_PASE:



			if int(ctx.get("voces", 0)) >= VOCES_MAX:
				return {}
			if int(ctx.get("v", 0)) <= SOCIO_TE_PROTESTA:
				return {"voz": VOZ_PROTESTA}
			return {}
		EV_RELEVO:


			if float(ctx.get("af", 0.0)) >= AF_SOCIO:
				return {"placa": true}
			return {}
		EV_GOL_A_TU_PASE:




			if int(ctx.get("v", 0)) >= SOCIO_TE_ANIMA:
				return {"gesto": GESTO_SOCIO}
			return {}
	return {}
