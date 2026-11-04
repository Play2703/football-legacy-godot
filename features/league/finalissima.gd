class_name Finalissima
extends RefCounted


const CONFEDS: Array[String] = ["UEFA", "CONMEBOL"]


const RONDA: String = "finalissima"


const TITULO: String = "Campeón de la Finalísima"



const NOMBRE: String = "FINALÍSIMA"




const VENTANA: int = 3
const PASO: int = 2





static func campeon_sim(confed: String, season: int) -> String:
	var mejores: Array = Nations.of_confed(confed)
	if mejores.is_empty():
		return ""
	var rep: String = String((mejores[0] as Dictionary)["id"])


	return String(NatTeam.simulate_continental(rep, season, 0.0,
		NatTeam.cont_clasificada(rep, season)).get("winner", ""))






static func cruce(pais: String, campeon: String, season: int) -> Array:
	var mio: String = Nations.confed_of(pais) if not pais.is_empty() else ""
	var out: Array = []
	for confed in CONFEDS:
		var id: String = campeon if confed == mio and not campeon.is_empty() \
				else campeon_sim(confed, season)
		if id.is_empty() or out.has(id):
			return []



		if confed != mio and not pais.is_empty() \
				and Nations.canon_id(id) == Nations.canon_id(pais):
			return []
		out.append(id)
	return out



static func rival_de(pareja: Array, pais: String) -> String:
	if pareja.size() < 2 or pais.is_empty():
		return ""
	var canon: String = Nations.canon_id(pais)
	for i in 2:
		if Nations.canon_id(String(pareja[i])) == canon:
			return String(pareja[1 - i])
	return ""




static func ganador_sim(pareja: Array, season: int) -> Dictionary:
	if pareja.size() < 2:
		return {}
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("finalissima-%d-%s-%s" % [season, String(pareja[0]), String(pareja[1])])
	return NatTeam._play_tie(String(pareja[0]), String(pareja[1]), "", 0.0, rng)
