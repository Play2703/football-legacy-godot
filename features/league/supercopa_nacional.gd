class_name SupercopaNacional
extends RefCounted



const COMP: String = "supercopa"



const TITULO: String = "Campeón de Supercopa"



const NOMBRE: String = "SUPERCOPA"


const SEMI: String = "Semifinal"
const FINAL: String = "Final"




const F4_DEFECTO: Array = ["liga1", "liga2", "copa2", "copa1"]




const SEDE_FUERA: Dictionary = {"España": "Arabia Saudí", "Italia": "Arabia Saudí",
	"Francia": "Kuwait", "Arabia Saudí": "Hong Kong", "Egipto": "Emiratos Árabes"}



const TOP: int = 6














const SEMILLA_T0: Dictionary = {

	"Inglaterra": {"top": ["liv", "ars"], "copa": "cry"},


	"España": {"top": ["bar", "rma", "atm", "ath", "vil", "bet"], "copa": "bar",
		"copa_sub": "rma"},

	"Italia": {"top": ["nap", "int", "ata", "juv", "rom", "fio"], "copa": "bol",
		"copa_sub": "mil"},

	"Alemania": {"top": ["bay", "lev"], "copa": "stu"},

	"Francia": {"top": ["pari", "mars"], "copa": "pari"},

	"Portugal": {"top": ["spo", "ben"], "copa": "spo"},

	"Países Bajos": {"top": ["psv", "ajax"], "copa": "goa"},

	"Bélgica": {"top": ["unio", "clu"], "copa": "clu"},

	"Croacia": {"top": ["cro_rij"], "copa": "cro_rij"},


	"Turquía": {"top": ["gal", "fen", "sams", "bes"], "copa": "gal", "copa_sub": "tra"},



	"Arabia Saudí": {"top": ["ali", "alh", "aln", "alq", "ala"], "copa": "ali",
		"copa_sub": "alq", "entran": ["ali", "ala", "aln", "alq"]},


	"Egipto": {"top": ["egy_ahl", "egy_pyr"], "copa": "egy_zam", "copaliga": "egy_cer"},

	"Irán": {"top": ["irn_tra"], "copa": "irn_est"},


	"Túnez": {"top": ["tun_est", "tun_usm"], "copa": "tun_est", "copa_sub": "tun_stu",
		"entran": ["tun_est", "tun_stu"]},


	"Rumanía": {"top": ["rou_fcs", "rou_cfr"], "copa": "rou_cfr", "copa_sub": "rou_her"},

	"Jordania": {"top": ["jor_hus"], "copa": "jor_weh"},


	"Brasil": {"top": ["fla", "palm"], "copa": "cori"},


	"Argentina": {"top": ["estu", "arg_pla"], "copa": "arg_ivr"},


	"Chile": {"top": ["chi_coq", "chi_uca"], "copa": "chi_hua", "copa_sub": "chi_lmc"},


	"Colombia": {"top": ["col_sfe", "col_jun"]},


	"Uruguay": {"top": ["uru_nac", "uru_pen"], "copaliga": "uru_pen"},


	"Ecuador": {"top": ["ecu_idv"], "copa": "ecu_cat"},

	"Uzbekistán": {"top": ["uzb_nef"], "copa": "uzb_pak"},


	"Venezuela": {"top": ["ven_ucv"], "copa": "ven_ucv"},

	"Corea del Sur": {"top": ["kor_jbk", "kor_djn"], "copa": "kor_jbk"},

	"Japón": {"top": ["jpn_kas"], "copa": "jpn_mac"},


	"Fiyi": {"top": ["fij_rew", "fij_lab"], "copa": "fij_lab"},


	"Tahití": {"top": ["tah_ven"], "copa": "tah_pir"},
}



static func formato(pais: String) -> Dictionary:
	return FormatoCopa.supercopa(pais)





static func aplica(pais: String, div: int = 1) -> bool:
	return div == 1 and not pais.is_empty() and not Liguilla.aplica(pais, 1) \
			and not formato(pais).is_empty()


static func tipo(pais: String) -> String:
	return String(formato(pais).get("t", "final"))



static func es_f4(pais: String) -> bool:
	return aplica(pais) and tipo(pais) == "f4"



static func es_neutral(pais: String) -> bool:
	return String(formato(pais).get("sede", "neutral")) in ["neutral", "fuera"]



static func pais_sede(pais: String) -> String:
	if String(formato(pais).get("sede", "")) != "fuera":
		return ""
	return String(SEDE_FUERA.get(pais, ""))




static func misma(pais: String) -> bool:
	return bool(formato(pais).get("misma", false))








static func desde(pais: String, league_len: int, vuelta: bool = false) -> float:
	var f: Dictionary = formato(pais)
	var mes: float = float(f.get("mes2" if vuelta and f.has("mes2") else "mes", 8.0))
	var w: float = FormatoCopa.semana(pais, mes, league_len)
	if misma(pais):
		w = maxf(w, float(league_len) + 1.0 + FormatoCopa.OFF_SEMANA)
	return w














static func entrantes(pais: String, top: Array, copa1: String, copa2: String = "",
		liga_cup1: String = "") -> Array:
	var f: Dictionary = formato(pais)
	if f.is_empty() or top.is_empty() or String(top[0]).is_empty():
		return []
	var liga1: String = String(top[0])
	var liga2: String = String(top[1]) if top.size() > 1 else ""
	if String(f.get("entran", "")) == "liga":
		return [] if liga2.is_empty() or liga2 == liga1 else [liga1, liga2]
	if String(f.get("rival", "")) == "liga_cup1" and not liga_cup1.is_empty():
		copa1 = liga_cup1
	if copa1.is_empty():
		return []
	if String(f.get("t", "final")) != "f4":
		if copa1 != liga1:
			return [liga1, copa1]
		if String(f.get("doblete", "")) == "no" or liga2.is_empty() or liga2 == liga1:
			return []
		return [liga1, liga2]
	var val: Dictionary = {"copa1": copa1, "copa2": copa2, "liga_cup1": liga_cup1}
	for i in top.size():
		val["liga%d" %(i + 1)] = String(top[i])
	var out: Array = []
	for clave in f.get("f4", F4_DEFECTO):
		var id: String = String(val.get(String(clave), ""))
		out.append("" if id.is_empty() or out.has(id) else id)
	var k: int = 0
	for i in range(out.size() - 1, -1, -1):
		if not String(out[i]).is_empty():
			continue
		while k < top.size() and (String(top[k]).is_empty() or out.has(String(top[k]))):
			k += 1
		if k >= top.size():
			return []
		out[i] = String(top[k])
	return out




static func semilla_t0(pais: String) -> Array:
	if not aplica(pais) or misma(pais) or not SEMILLA_T0.has(pais):
		return []
	var s: Dictionary = SEMILLA_T0[pais]
	var entran: Array =(s["entran"] as Array).duplicate() if s.has("entran") \
			else entrantes(pais, s.get("top", []), String(s.get("copa", "")),
			String(s.get("copa_sub", "")), String(s.get("copaliga", "")))
	for id in entran:
		if Teams.by_id(String(id)).is_empty():
			return []
	return entran




static func semis(entran: Array) -> Array:
	if entran.size() < 4:
		return []
	return [[entran[0], entran[2]], [entran[1], entran[3]]]



static func semi_de(entran: Array, id: String) -> Array:
	var s: Array = semis(entran)
	if s.is_empty():
		return []
	if (s[0] as Array).has(id):
		return [s[0], s[1]]
	if (s[1] as Array).has(id):
		return [s[1], s[0]]
	return []




static func es_local(pais: String, entran: Array, id: String, rival: String,
		vuelta: bool = false) -> bool:
	var mejor: bool = entran.find(id) < entran.find(rival)
	match String(formato(pais).get("sede", "neutral")):
		"copa":

			return not mejor
		"cabeza":


			return mejor == vuelta
	return mejor





static func simula(pais: String, entran: Array, season: int) -> String:
	if entran.size() < 2:
		return ""
	if entran.size() >= 4:
		var s: Array = semis(entran)
		var w1: String = semi_sim(pais, s[0], season)
		var w2: String = semi_sim(pais, s[1], season)
		return SimLeague.partido_unico(w1, w2, season, "supercopa|" + pais)
	return SimLeague.partido_unico(String(entran[0]), String(entran[1]), season,
		"supercopa|" + pais)


static func semi_sim(pais: String, par: Array, season: int) -> String:
	return SimLeague.partido_unico(String(par[0]), String(par[1]), season,
		"supercopa|semi|" + pais)
