extends RefCounted



























const HAIR: Dictionary = {
	"normal": "p_crew_cut_clasico", "bald": "none", "buzz": "p_high_and_tight", "mohawk": "p_cresta_punk",
	"undercut": "p_atras_con_rapado", "taper": "p_degradado_bajo", "entradas": "p_corte_ejecutivo",
	"crest_wide": "p_cresta_suave", "part": "p_gentleman_raya_clasica", "lines": "p_high_and_tight",
	"raya_medio": "p_raya_al_medio_hacia_atras", "coronilla": "p_corte_ejecutivo",
	"herradura": "p_corte_ejecutivo", "cepillo": "p_hi_top_fade",
	"lado_rapado": "p_atras_con_rapado", "mullet": "p_mullet_con_degradado",
	"caesar": "p_cesar_clasico", "crew_cut": "p_rapado_perfilado", "flequillo": "p_flequillo_recto",
	"slick_back": "p_peinado_mojado", "quiff_corto": "p_quiff_bajo",
	"coleta": "p_colita", "coleta_alta": "p_coleta_con_rapado", "bun_corto": "p_mono_bajo",
	"fade_alto": "p_taper_texturizado", "fade_bajo": "p_degradado_alto", "crop": "p_crop_frances",

	"liga_coleta": "p_colita", "banda_pelo": "p_crew_cut_clasico",
}



const ACCESORIO: Dictionary = {
	"liga_coleta": "tie", "banda_pelo": "band",
}








const PELO_VIEJO: Dictionary = {
	"afro": "p_afro_redondo", "cesar": "p_cesar_clasico", "coleta": "p_colita",
	"coleta_alta": "p_coleta_con_rapado", "coronilla": "p_corte_ejecutivo",
	"corto": "p_crew_cut_clasico", "cresta": "p_cresta_punk", "cresta_ancha": "p_cresta_suave",
	"degradado": "p_degradado_bajo", "dos_trenzas": "p_dos_coletas", "entradas": "p_corte_ejecutivo",
	"flat_top": "p_hi_top_fade", "flequillo": "p_flequillo_recto", "hongo": "p_tazon_con_rapado",
	"largo": "p_melena_surfera", "melena_corta": "p_bob", "mono": "p_mono_bajo",
	"mullet": "p_mullet_con_degradado", "mullet_rizado": "p_mullet_con_degradado",
	"peinado_atras": "p_peinado_mojado", "puntas": "p_puntas_con_degradado",
	"rapado": "p_high_and_tight", "rastas": "p_rastas_finas", "raya_lado": "p_gentleman_raya_clasica",
	"raya_medio": "p_raya_al_medio_hacia_atras", "rizado": "p_rizos_al_ras",
	"semicalvo": "p_corte_ejecutivo", "trenzas": "p_trenzas_de_caja",
	"trenzas_largas": "p_trenzas_de_caja_largas", "tupe": "p_tupe_ladeado",
	"undercut": "p_atras_con_rapado", "french_crop": "p_crop_frances",
	"crop_fade": "p_taper_texturizado", "crew_cut": "p_rapado_perfilado",
	"buzz_fade": "p_degradado_alto", "quiff_corto": "p_quiff_bajo",
	"side_part": "p_gentleman_raya_clasica", "edgar": "p_edgar", "crop_rizado": "p_rizos_con_degradado",
	"ivy_league": "p_ivy_league_peinado", "ondas_fade": "p_ondas_360", "cortina_larga": "p_cortinilla",
	"wolf_suave": "p_lobo_wolf_cut", "mullet_moderno": "p_mullet_con_degradado",
	"rizos_sueltos": "p_melena_rizada", "rastas_recogidas": "p_mono_de_rastas",
	"rastas_lado": "p_rastas_con_rapado", "trenzas_diseno": "p_trenzas_pegadas_con_rapado",
	"twists_cortos": "p_twists", "melena_ondulada": "p_melena_peinada_atras",
	"capas_despeinadas": "p_capas_medianas", "media_coleta": "p_medio_recogido",
	"rastas_cortas": "p_rastas_cortas", "rastas_fade": "p_rastas_cortas_con_volumen",
	"rastas_bob": "p_rastas_finas", "rastas_largas": "p_rastas_finas_largas",
	"rastas_gruesas": "p_rastas_finas_largas", "fleco_recto": "p_flequillo_recto",
	"fleco_dentado": "p_despeinado", "fleco_diagonal": "p_flequillo_de_lado",
	"fleco_cortina": "p_cortinilla", "fleco_ondulado": "p_rizos_con_flequillo",
	"liga_coleta": "p_colita", "banda_pelo": "p_crew_cut_clasico",


	"p_rockero_con_entradas": "p_liso_hasta_la_espalda", "p_skullet": "p_melena_hombros_lisa",
	"p_cuerno_de_unicornio": "p_mohicano_alto", "p_cuernos_de_pelo": "p_dos_monos",




	"p_calvo_en_herradura": "p_entradas_m"
}

const BARBA_VIEJA: Dictionary = {
	"barba_cuadrada": "p_barba_recortada", "barba_redonda": "p_barba_redonda_llena",
	"barba_trenzada": "p_trenzas_vikingas", "beard": "p_barba_recortada",
	"bigote_curvado": "p_bigote_manubrio", "bigote_fino": "p_bigote_lapiz",
	"chevron": "p_bigote_ingles", "chiva_larga": "p_perilla_afilada", "goatee": "p_candado_marcado",
	"horseshoe": "p_bigote_de_herradura", "long_beard": "p_barba_de_lenador",
	"morsa": "p_bigote_mexicano", "mustache": "p_bigote_ingles", "patillas_bigote": "p_wolverine",
	"perilla": "p_mosca_bajo_el_labio", "sideburns": "p_chuletas", "sin_bigote": "p_cortina_lincoln",
	"stubble": "p_sombra_de_tres_dias"
}


const PELO_POR_DEFECTO: String = "p_crew_cut_clasico"



static func pelo(id: String) -> String:
	return str(PELO_VIEJO.get(id, id))


static func barba(id: String) -> String:
	return str(BARBA_VIEJA.get(id, id))



static func trae_viejo(cfg: Dictionary) -> bool:
	return PELO_VIEJO.has(str(cfg.get("modular_hair", ""))) \
			or BARBA_VIEJA.has(str(cfg.get("modular_beard", "")))

const BEARD: Dictionary = {
	"none": "none", "beard": "p_barba_recortada", "goatee": "p_candado_marcado",
	"mustache": "p_bigote_ingles", "stubble": "p_sombra_de_tres_dias",
	"sideburns": "p_chuletas", "soul": "p_mosca_bajo_el_labio",
	"chinstrap": "p_barba_redonda_llena", "full": "p_barba_de_lenador",
	"handlebar": "p_bigote_manubrio",
}



const LLAVES_DE_CARA: Array[String] = [
	"hair", "hair_style", "facial_hair", "skin", "eyes", "brows", "mask", "headband",
]




static func es_cara(cfg: Dictionary) -> bool:
	for k in cfg.keys():
		var s: String = str(k)
		if s.begins_with("modular_") or LLAVES_DE_CARA.has(s):
			return true
	return false











static func hace_falta(cfg: Dictionary, es_persona: bool = false) -> bool:
	return ((es_persona or es_cara(cfg)) and not cfg.has("modular_hair")) or trae_viejo(cfg)





static func al_dia(cfg: Dictionary, es_persona: bool = false) -> Dictionary:
	if not hace_falta(cfg, es_persona):
		return cfg
	var out: Dictionary = cfg.duplicate(true)

	if not out.has("modular_mask") and out.get("mask", false):
		out["modular_mask"] = "mask"
	if not out.has("modular_hair_accessory") and out.has("headband"):
		out["modular_hair_accessory"] = "band"
	out.erase("mask")
	out.erase("headband")



	var viejo: String = ""
	if out.has("hair_style"):
		viejo = str(out["hair_style"])
	elif out.has("hair"):
		viejo = str(out["hair"])
	if not viejo.is_empty():


		if HAIR.has(viejo) and not out.has("modular_hair"):
			out["modular_hair"] = str(HAIR[viejo])
		if ACCESORIO.has(viejo) and not out.has("modular_hair_accessory"):
			out["modular_hair_accessory"] = str(ACCESORIO[viejo])
	if not out.has("modular_hair"):
		out["modular_hair"] = PELO_POR_DEFECTO
	out["modular_hair"] = pelo(str(out["modular_hair"]))

	if not out.has("modular_beard") and out.has("facial_hair"):
		var barba: String = str(out["facial_hair"])
		if BEARD.has(barba):
			out["modular_beard"] = str(BEARD[barba])
	if not out.has("modular_beard"):
		out["modular_beard"] = "none"
	out["modular_beard"] = barba(str(out["modular_beard"]))



	if not out.has("modular_brows"):
		out["modular_brows"] = "natural"

	return out
