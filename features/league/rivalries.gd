class_name Rivalries
extends RefCounted













































































const PAIRS: Array = [











	["rma", "atm"],
	["bar", "esp"],
	["sev", "bet"],
	["ath", "rso"],
	["val", "vil"],

	["mci", "mun"],
	["liv", "eve"],
	["ars", "tot"],
	["che", "ful"],
	["new", "sun"],
	["avl", "wol"],






	["lce", "der"],

	["int", "mil"],
	["rom", "laz"],
	["juv", "tor"],
	["bol", "fio"],

	["dor", "s04"],
	["fcu", "bsc"],
	["koe", "bmg"],
	["m05", "fra"],

	["ame", "gdl"],
	["tig", "mty"],
	["caz", "pum"],

	["ben", "spo"],
	["por", "boa"],
	["bra", "vit"],

	["pari", "mars"],
	["lyo", "sai"],
	["lil", "len"],
	["niz", "mon"],
	["nan", "ren"],

	["ajax", "fey"],
	["psv", "wil"],
	["gro", "hee"],

	["fla", "flu"],
	["cori", "palm"],
	["grem", "inte"],
	["atle", "cru"],
	["sao", "sant"],
	["bot", "vas"],

	["boca", "rive"],
	["raci", "ind"],
	["ros", "newe"],
	["estu", "gim"],
	["sanl", "hur"],

	["lag", "losa"],
	["newy", "nwy"],
	["sea", "port"],
	["colu", "fcc"],
	["ntr", "orla"],

	["alh", "aln"],
	["ali", "ala"],

	["gal", "fen"],
	["bes", "basa"],

	["clu", "cer"],
	["and", "sta"],

	["sco_cel", "sco_ran"],
	["sco_hea", "sco_hib"],
	["sco_dun", "sco_dut"],

	["gre_oly", "gre_pan"],
	["gre_paok", "gre_ari"],

	["ukr_shk", "ukr_dyn"],
	["ukr_kar", "ukr_ruk"],

	["aut_rap", "aut_auw"],
	["aut_stu", "aut_gak"],

	["sui_gra", "sui_zur"],
	["sui_ybb", "sui_bas"],
	["sui_lau", "sui_ser"],

	["cze_slv", "cze_spa"],
	["cze_boh", "cze_duk"],

	["cro_din", "cro_haj"],

	["srb_czv", "srb_par"],

	["den_fck", "den_bif"],
	["den_fcm", "den_agf"],

	["nor_val", "nor_lsk"],
	["nor_rbk", "nor_mol"],
	["nor_bra", "nor_vik"],

	["jpn_gam", "jpn_cer"],
	["jpn_yfm", "jpn_kaw"],
	["jpn_fct", "jpn_ver"],

	["kor_uls", "kor_poh"],

	["col_mil", "col_sfe"],
	["col_nac", "col_dim"],
	["col_ame", "col_cali"],

	["chi_col", "chi_uch"],

	["uru_pen", "uru_nac"],

	["egy_ahl", "egy_zam"],




	["rsa_kai", "rsa_orl"],
	["rsa_amz", "rsa_arr"],

	["qat_sad", "qat_ray"],

	["irn_per", "irn_est"],

	["uzb_pak", "uzb_bun"],

	["jor_fai", "jor_weh"],
	["jor_hus", "jor_ram"],









	["par_oli", "par_cer"],
	["par_lib", "par_gua"],
	["par_nac", "par_rec"],
	["par_tri", "par_rub"],
	["par_luq", "par_slo"],
	["par_gcm", "par_car"],
	["par_djv", "par_bea"],
	["par_tem", "par_pgi"],
	["par_ind", "par_res"],
	["par_cap", "par_doi"],
	["par_tno", "par_atl"],
	["par_tac", "par_riv"],
	["par_tfe", "par_rit"],
	["par_vse", "par_gdz"],
	["par_mle", "par_cco"],
	["par_vps", "par_lim"],
	["par_oit", "par_ite"],
	["par_gzc", "par_pma"],
	["par_pha", "par_spe"],
	["par_tfb", "par_dsd"],
	["par_cgl", "par_fye"],
	["par_cho", "par_pat"],

	["ecu_ldu", "ecu_auc"],
	["ecu_idv", "ecu_cat"],
	["ecu_bsc", "ecu_eme"],
	["ecu_mac", "ecu_tec"],
	["ecu_lib", "ecu_ore"],
	["ecu_cue", "ecu_mus"],
	["ecu_del", "ecu_man"],
	["ecu_ind", "ecu_cum"],
	["ecu_oct", "ecu_pat"],
	["ecu_cjr", "ecu_gua"],
	["ecu_san", "ecu_imb"],
	["ecu_ldp", "ecu_ins"],
	["ecu_std", "ecu_jul"],
	["ecu_nac", "ecu_sdq"],
	["ecu_ast", "ecu_buh"],
	["ecu_avi", "ecu_ldc"],
	["ecu_esp", "ecu_ame"],
	["ecu_pel", "ecu_bcf"],
	["ecu_gre", "ecu_juv"],
	["ecu_olm", "ecu_lun"],
	["ecu_nor", "ecu_utc"],
	["ecu_eve", "ecu_pan"],
	["ecu_aud", "ecu_que"],
	["ecu_dun", "ecu_tra"],

	["per_uni", "per_ali"],
	["per_cri", "per_spb"],
	["per_cus", "per_cha"],
	["per_mel", "per_moq"],
	["per_gar", "per_cie"],
	["per_aat", "per_gra"],
	["per_hua", "per_adt"],
	["per_cun", "per_jpc"],
	["per_caj", "per_utc"],
	["per_uco", "per_usd"],
	["per_man", "per_ucv"],
	["per_aya", "per_san"],
	["per_auh", "per_umi"],
	["per_cfc", "per_cni"],
	["per_lla", "per_sma"],
	["per_ben", "per_bin"],
	["per_pir", "per_ada"],
	["per_usm", "per_can"],
	["per_aur", "per_lut"],
	["per_cau", "per_par"],
	["per_spc", "per_nac"],
	["per_pac", "per_mun"],
	["per_vsa", "per_anb"],
	["per_eco", "per_pan"],
	["per_ucr", "per_vol"],
	["per_hrl", "per_jhu"],
	["per_jsd", "per_uda"],

	["bol_bol", "bol_str"],
	["bol_alw", "bol_abb"],
	["bol_blo", "bol_ori"],
	["bol_nap", "bol_rpo"],
	["bol_gvs", "bol_rto"],
	["bol_ipe", "bol_tom"],
	["bol_sab", "bol_uvi"],
	["bol_usf", "bol_asu"],
	["bol_hua", "bol_feb"],
	["bol_vir", "bol_cnu"],
	["bol_ain", "bol_tig"],
	["bol_pmy", "bol_chf"],
	["bol_uta", "bol_smy"],
	["bol_fat", "bol_his"],
	["bol_min", "bol_dnw"],
	["bol_rpa", "bol_rsc"],
	["bol_oro", "bol_gdl"],
	["bol_chp", "bol_inf"],
	["bol_gag", "bol_utj"],
	["bol_upa", "bol_lfp"],
	["bol_fla", "bol_fan"],
	["bol_ube", "bol_kiv"],
	["bol_hpl", "bol_aju"],
	["bol_oly", "bol_lqu"],

	["ven_tac", "ven_car"],
	["ven_ucv", "ven_met"],
	["ven_cbo", "ven_apc"],
	["ven_por", "ven_zam"],
	["ven_esm", "ven_tru"],
	["ven_mon", "ven_anz"],
	["ven_lar", "ven_bqs"],
	["ven_yar", "ven_ula"],
	["ven_ara", "ven_pcl"],
	["ven_mob", "ven_dyp"],
	["ven_zmb", "ven_aba"],
	["ven_bol", "ven_gua"],
	["ven_rfr", "ven_aev"],
	["ven_mdg", "ven_mnv"],
	["ven_ufc", "ven_eme"],
	["ven_chv", "ven_dza"],
	["ven_mnt", "ven_vbr"],
	["ven_rey", "ven_yfc"],
	["ven_gmo", "ven_mrr"],
	["ven_jye", "ven_jgd"],
	["ven_aeo", "ven_ccv"],
	["ven_tdp", "ven_opt"],
	["ven_ane", "ven_aji"],











	["mar_wac", "mar_rca"],
	["mar_far", "mar_fus"],
	["mar_mas", "mar_cod"],
	["mar_dhj", "mar_rcz"],
	["mar_kcm", "mar_ocs"],
	["mar_hus", "mar_odc"],
	["mar_rsb", "mar_uts"],
	["mar_mco", "mar_usm"],
	["mar_rac", "mar_jss"],
	["mar_stm", "mar_ken"],
	["mar_ock", "mar_roz"],
	["mar_usb", "mar_cjb"],
	["mar_cak", "mar_rbm"],
	["mar_waf", "mar_izk"],
	["mar_tiz", "mar_jsm"],
	["mar_frn", "mar_han"],
	["mar_crb", "mar_tas"],
	["mar_cww", "mar_ejs"],
	["mar_sal", "mar_ust"],
	["mar_jsk", "mar_irf"],
	["mar_wse", "mar_olm"],
	["mar_cay", "mar_oly"],
	["mar_mol", "mar_cch"],
	["mar_crh", "mar_usk"],

	["tun_est", "tun_caf"],
	["tun_ess", "tun_usm"],
	["tun_esz", "tun_ubg"],
	["tun_stu", "tun_jso"],
	["tun_asm", "tun_sol"],
	["tun_cab", "tun_obj"],
	["tun_esm", "tun_asg"],
	["tun_csh", "tun_scb"],
	["tun_srs", "tun_ock"],
	["tun_gaf", "tun_red"],
	["tun_stg", "tun_bou"],
	["tun_csc", "tun_kse"],
	["tun_msk", "tun_bsb"],
	["tun_kor", "tun_jen"],
	["tun_ust", "tun_ask"],
	["tun_sso", "tun_kal"],
	["tun_nab", "tun_bkh"],
	["tun_med", "tun_jer"],
	["tun_sbz", "tun_jil"],
	["tun_cot", "tun_rad"],
	["tun_mok", "tun_mah"],
	["tun_kef", "tun_ubs"],
	["tun_oel", "tun_smb"],
	["tun_aga", "tun_rog"],








	["swe_aik", "swe_dif"],
	["swe_ham", "swe_bro"],
	["swe_gbg", "swe_gai"],
	["swe_org", "swe_hac"],
	["swe_mff", "swe_mja"],
	["swe_kal", "swe_deg"],
	["swe_elf", "swe_hal"],
	["swe_sir", "swe_vas"],
	["swe_hel", "swe_lan"],
	["swe_fal", "swe_vbo"],
	["swe_var", "swe_ost"],
	["swe_odd", "swe_lju"],
	["swe_gif", "swe_ofk"],
	["swe_bra", "swe_san"],
	["swe_nkp", "swe_ore"],
	["swe_nby", "swe_nun"],
	["swe_oly", "swe_ros"],
	["swe_ari", "swe_lbk"],
	["swe_esk", "swe_ang"],
	["swe_vsl", "swe_kar"],
	["swe_sol", "swe_sto"],
	["swe_enk", "swe_afc"],
	["swe_tro", "swe_sko"],
	["swe_kst", "swe_fbk"],
	["swe_htf", "swe_sti"],
	["swe_jar", "swe_arl"],
	["swe_has", "swe_kri"],
	["swe_tva", "swe_lah"],
	["swe_ume", "swe_pit"],
	["swe_jso", "swe_atv"],
	["swe_tff", "swe_uts"],
	["swe_gef", "swe_ass"],

	["rou_fcs", "rou_din"],
	["rou_rap", "rou_met"],
	["rou_cfr", "rou_ucj"],
	["rou_arg", "rou_ucv"],
	["rou_pet", "rou_uns"],
	["rou_ote", "rou_far"],
	["rou_uta", "rou_her"],
	["rou_bot", "rou_csi"],
	["rou_cea", "rou_bac"],
	["rou_asa", "rou_sep"],
	["rou_cor", "rou_res"],
	["rou_bih", "rou_oli"],
	["rou_chi", "rou_cam"],
	["rou_ste", "rou_csd"],
	["rou_con", "rou_vol"],
	["rou_tun", "rou_afu"],
	["rou_sla", "rou_mbz"],
	["rou_glb", "rou_pol"],
	["rou_sel", "rou_dum"],
	["rou_lup", "rou_jiu"],
	["rou_alb", "rou_cug"],
	["rou_via", "rou_pec"],
	["rou_dej", "rou_san"],
	["rou_spa", "rou_mog"],
	["rou_fun", "rou_dac"],
	["rou_min", "rou_suc"],
	["rou_tam", "rou_vlc"],



	["bih_zri", "bih_vel"],
	["bih_sar", "bih_zel"],
	["bih_bor", "bih_bsk"],
	["bih_rad", "bih_slo"],
	["bih_sir", "bih_cel"],
	["bih_pos", "bih_tom"],
	["bih_gos", "bih_igm"],
	["bih_leo", "bih_sla"],
	["bih_slb", "bih_bud"],
	["bih_dri", "bih_zvi"],
	["bih_lak", "bih_koz"],
	["bih_rud", "bih_jed"],
	["bih_stu", "bih_rha"],
	["bih_tra", "bih_tos"],
	["bih_fam", "bih_rom"],
	["bih_rka", "bih_bos"],
	["bih_bra", "bih_zgr"],
	["bih_oma", "bih_pot"],
	["bih_cap", "bih_bro"],
	["bih_tuz", "bih_maj"],
	["bih_vne", "bih_sut"],
	["bih_lju", "bih_tro"],
	["bih_vit", "bih_kra"],









	["nzl_akc", "nzl_eas"],
	["nzl_afr", "nzl_wpr"],
	["nzl_wol", "nzl_mir"],
	["nzl_wsp", "nzl_bay"],
	["nzl_mel", "nzl_ham"],
	["nzl_iby", "nzl_wka"],
	["nzl_uhc", "nzl_pet"],
	["nzl_mku", "nzl_man"],
	["nzl_wcr", "nzl_nsu"],
	["nzl_tau", "nzl_fcw"],
	["nzl_uca", "nzl_hal"],
	["nzl_mos", "nzl_gri"],
	["nzl_lhc", "nzl_sto"],
	["nzl_nwe", "nzl_wun"],
	["nzl_cam", "nzl_tpo"],
	["nzl_tak", "nzl_hib"],
	["nzl_ell", "nzl_omu"],
	["nzl_hnw", "nzl_wai"],
	["nzl_map", "nzl_nro"],

	["fij_baf", "fij_lau"],
	["fij_suv", "fij_rew"],
	["fij_nad", "fij_ndr"],
	["fij_nas", "fij_nav"],
	["fij_lab", "fij_tav"],

	["tah_cen", "tah_dra"],
	["tah_pir", "tah_ajt"],
	["tah_tef", "tah_tpu"],
	["tah_pue", "tah_tai"],
	["tah_ven", "tah_mir"],

	["ncl_mag", "ncl_tig"],
	["ncl_mdo", "ncl_csl"],
	["ncl_los", "ncl_gai"],
	["ncl_ned", "ncl_pat"],
	["ncl_hie", "ncl_kun"],
]









const EXTRA: Dictionary = {

	"rma": ["bar"],
	"bar": ["rma"],
	"ath": ["osa", "alv"],
	"rso": ["osa", "alv"],
	"osa": ["ath", "rso"],
	"alv": ["ath", "rso"],
	"ray": ["atm", "get"],
	"get": ["ray", "atm"],

	"che": ["whu", "ars", "mun"],
	"ars": ["che", "mun"],
	"tot": ["che", "whu"],
	"whu": ["che", "tot"],
	"mun": ["liv", "lee", "ars", "che"],
	"liv": ["mun"],
	"lee": ["mun", "che"],
	"cry": ["bhi"],
	"bhi": ["cry"],
	"ful": ["bre"],
	"bre": ["ful"],

	"juv": ["int", "mil", "nap"],
	"int": ["juv"],
	"mil": ["juv", "nap"],
	"nap": ["rom", "juv", "mil"],
	"rom": ["nap"],
	"laz": ["nap"],
	"fio": ["juv"],

	"bay": ["dor"],
	"dor": ["bay", "bmg"],
	"bmg": ["dor"],
	"koe": ["lev"],
	"lev": ["koe"],

	"pari": ["mon"],
	"mon": ["pari"],
	"mars": ["niz", "lyo"],
	"lyo": ["mars"],
	"niz": ["mars"],

	"ben": ["por"],
	"por": ["ben", "spo"],
	"spo": ["por"],

	"ame": ["pum", "caz", "tol"],
	"caz": ["ame"],
	"pum": ["ame"],
	"tol": ["ame"],
	"gdl": ["atl"],
	"atl": ["gdl"],
	"pac": ["leo"],
	"leo": ["pac"],

	"fla": ["vas", "bot"],
	"flu": ["vas", "bot"],
	"bot": ["fla", "flu"],
	"vas": ["fla", "flu"],
	"cori": ["sao", "sant"],
	"palm": ["sao", "sant"],
	"sao": ["cori", "palm"],
	"sant": ["cori", "palm"],

	"boca": ["sanl", "raci"],
	"sanl": ["boca"],
	"raci": ["boca"],

	"ajax": ["psv"],
	"psv": ["ajax", "fey"],
	"fey": ["psv", "spa"],
	"spa": ["fey"],
	"twe": ["her"],
	"her": ["twe"],
	"vite": ["necn"],
	"necn": ["vite"],

	"tln": ["orla", "ntr"],
	"orla": ["tln"],
	"ntr": ["tln"],
	"phi": ["nwy"],
	"nwy": ["phi"],

	"alh": ["ali"],
	"ali": ["alh"],
	"aln": ["als"],
	"als": ["aln"],

	"gal": ["bes"],
	"fen": ["bes", "tra"],
	"bes": ["gal", "fen"],
	"tra": ["fen"],

	"clu": ["and", "gan"],
	"and": ["clu", "genk", "gan"],
	"genk": ["sta", "and"],
	"sta": ["genk"],
	"gan": ["clu", "and"],

	"sco_abe": ["sco_dut", "sco_ran"],
	"sco_dut": ["sco_abe"],
	"sco_ran": ["sco_abe"],
	"sco_fal": ["sco_dfl"],
	"sco_dfl": ["sco_fal"],

	"gre_oly": ["gre_aek", "gre_paok"],
	"gre_pan": ["gre_aek", "gre_paok"],
	"gre_aek": ["gre_oly", "gre_pan", "gre_paok"],
	"gre_paok": ["gre_oly", "gre_pan", "gre_aek"],

	"ukr_shk": ["ukr_zor"],
	"ukr_zor": ["ukr_shk"],

	"aut_sal": ["aut_rap", "aut_stu"],
	"aut_rap": ["aut_sal"],
	"aut_stu": ["aut_sal"],
	"aut_las": ["aut_bwl"],
	"aut_bwl": ["aut_las"],

	"sui_bas": ["sui_zur"],
	"sui_zur": ["sui_bas"],
	"sui_sio": ["sui_lau", "sui_ser"],
	"sui_lau": ["sui_sio"],
	"sui_ser": ["sui_sio"],

	"cze_plz": ["cze_spa", "cze_slv"],
	"cze_spa": ["cze_plz"],
	"cze_slv": ["cze_plz"],
	"cze_ost": ["cze_olo"],
	"cze_olo": ["cze_ost"],

	"cro_din": ["cro_rij", "cro_osi"],
	"cro_haj": ["cro_rij"],
	"cro_rij": ["cro_din", "cro_haj"],
	"cro_osi": ["cro_din"],

	"srb_czv": ["srb_voj"],
	"srb_par": ["srb_voj"],
	"srb_voj": ["srb_czv", "srb_par"],

	"den_fck": ["den_fcm"],
	"den_fcm": ["den_fck"],
	"den_aab": ["den_agf"],
	"den_agf": ["den_aab"],

	"nor_gli": ["nor_til", "nor_rbk"],
	"nor_til": ["nor_gli"],
	"nor_rbk": ["nor_gli"],
	"nor_mol": ["nor_aaf"],
	"nor_aaf": ["nor_mol"],

	"jpn_ura": ["jpn_kas"],
	"jpn_kas": ["jpn_ura"],
	"jpn_fct": ["jpn_kaw"],
	"jpn_vis": ["jpn_gam", "jpn_cer"],
	"jpn_gam": ["jpn_vis", "jpn_kyo"],
	"jpn_cer": ["jpn_vis"],
	"jpn_kyo": ["jpn_gam"],

	"kor_sel": ["kor_inc"],
	"kor_inc": ["kor_sel"],
	"kor_jbk": ["kor_uls"],
	"kor_uls": ["kor_jbk"],
	"kor_suw": ["kor_swf"],
	"kor_swf": ["kor_suw"],

	"col_nac": ["col_mil"],
	"col_mil": ["col_nac"],

	"chi_col": ["chi_uca"],
	"chi_uch": ["chi_uca"],
	"chi_uca": ["chi_col", "chi_uch"],
	"chi_ues": ["chi_aud"],
	"chi_aud": ["chi_ues"],

	"uru_pen": ["uru_def"],
	"uru_nac": ["uru_def"],
	"uru_def": ["uru_pen", "uru_nac"],

	"egy_ahl": ["egy_pyr"],
	"egy_zam": ["egy_pyr"],
	"egy_pyr": ["egy_ahl", "egy_zam"],
	"egy_itt": ["egy_smo"],
	"egy_smo": ["egy_itt"],
	"egy_ism": ["egy_msr"],
	"egy_msr": ["egy_ism"],

	"rsa_sun": ["rsa_kai", "rsa_orl", "rsa_sup"],
	"rsa_kai": ["rsa_sun"],
	"rsa_orl": ["rsa_sun"],
	"rsa_sup": ["rsa_sun"],

	"qat_sad": ["qat_duh", "qat_ara"],
	"qat_duh": ["qat_sad"],
	"qat_ara": ["qat_sad"],
	"qat_ray": ["qat_gha"],
	"qat_gha": ["qat_ray"],

	"irn_sep": ["irn_zob"],
	"irn_zob": ["irn_sep"],
	"irn_tra": ["irn_per"],
	"irn_per": ["irn_tra"],
	"irn_foo": ["irn_snf"],
	"irn_snf": ["irn_foo"],

	"uzb_pak": ["uzb_nas", "uzb_loc"],
	"uzb_nas": ["uzb_pak"],
	"uzb_loc": ["uzb_pak", "uzb_bun"],
	"uzb_bun": ["uzb_loc"],
	"uzb_nef": ["uzb_nav"],
	"uzb_nav": ["uzb_nef"],

	"jor_fai": ["jor_ahl"],
	"jor_ahl": ["jor_fai"],
	"jor_hus": ["jor_arb"],
	"jor_arb": ["jor_hus"],






	"par_oli": ["par_gua", "par_lib"],
	"par_cer": ["par_lib", "par_gua"],
	"par_lib": ["par_oli", "par_cer"],
	"par_gua": ["par_oli", "par_cer"],

	"ecu_ldu": ["ecu_bsc", "ecu_idv", "ecu_nac", "ecu_sdq"],
	"ecu_bsc": ["ecu_ldu"],
	"ecu_idv": ["ecu_ldu"],
	"ecu_nac": ["ecu_ldu", "ecu_auc"],
	"ecu_sdq": ["ecu_ldu", "ecu_auc"],
	"ecu_auc": ["ecu_nac", "ecu_sdq"],

	"per_cri": ["per_ali", "per_uni"],
	"per_ali": ["per_cri"],
	"per_uni": ["per_cri"],
	"per_mel": ["per_cie"],
	"per_cie": ["per_mel"],

	"bol_alw": ["bol_bol", "bol_str"],
	"bol_bol": ["bol_alw"],
	"bol_str": ["bol_alw"],
	"bol_wil": ["bol_bol", "bol_str"],

	"ven_tac": ["ven_esm"],
	"ven_esm": ["ven_tac"],
	"ven_car": ["ven_ucv", "ven_dlg", "ven_met"],
	"ven_mon": ["ven_mdg"],
	"ven_mdg": ["ven_mon"],
	"ven_cbo": ["ven_ara"],
	"ven_ara": ["ven_cbo"],




	"mar_far": ["mar_wac", "mar_rca"],
	"mar_wac": ["mar_far"],
	"mar_rca": ["mar_far"],
	"mar_rsb": ["mar_mco"],
	"mar_mco": ["mar_rsb"],
	"mar_mas": ["mar_waf"],
	"mar_waf": ["mar_mas"],
	"mar_cay": ["mar_jss"],

	"tun_est": ["tun_ess", "tun_css"],
	"tun_caf": ["tun_ess", "tun_css"],
	"tun_ess": ["tun_est", "tun_caf", "tun_css"],
	"tun_css": ["tun_est", "tun_caf", "tun_ess", "tun_srs"],
	"tun_srs": ["tun_css"],
	"tun_asg": ["tun_stg"],
	"tun_stg": ["tun_asg"],




	"swe_aik": ["swe_ham", "swe_mff", "swe_gbg"],
	"swe_dif": ["swe_ham", "swe_mff"],
	"swe_ham": ["swe_dif", "swe_aik"],
	"swe_bro": ["swe_aik", "swe_dif"],
	"swe_vsl": ["swe_aik"],
	"swe_gbg": ["swe_org", "swe_mff", "swe_elf", "swe_hac"],
	"swe_gai": ["swe_org", "swe_hac"],
	"swe_mff": ["swe_hel", "swe_gbg", "swe_aik"],
	"swe_hel": ["swe_mff", "swe_esk"],
	"swe_elf": ["swe_nby", "swe_gbg"],
	"swe_kal": ["swe_ost"],
	"swe_hal": ["swe_fal", "swe_vbo"],
	"swe_deg": ["swe_ore", "swe_kst"],
	"swe_gif": ["swe_gef"],
	"swe_nun": ["swe_ass"],

	"rou_fcs": ["rou_rap", "rou_ste", "rou_cfr", "rou_ucv"],
	"rou_din": ["rou_rap", "rou_ste", "rou_ucv"],
	"rou_rap": ["rou_fcs", "rou_din", "rou_ste"],
	"rou_ste": ["rou_fcs", "rou_din", "rou_rap"],
	"rou_cfr": ["rou_fcs"],
	"rou_ucv": ["rou_din", "rou_fcs", "rou_sla"],
	"rou_ucj": ["rou_ucv"],
	"rou_uta": ["rou_pti", "rou_via"],
	"rou_bot": ["rou_pol"],
	"rou_her": ["rou_sel"],
	"rou_csi": ["rou_sep"],

	"bih_sar": ["bih_bor", "bih_zri"],
	"bih_zel": ["bih_bor", "bih_zri", "bih_cel"],
	"bih_bor": ["bih_zri", "bih_rud", "bih_koz"],
	"bih_zri": ["bih_sir"],
	"bih_sir": ["bih_pos", "bih_lju"],
	"bih_vel": ["bih_vne"],
	"bih_slb": ["bih_tuz", "bih_zel"],
	"bih_rad": ["bih_zvi"],
	"bih_cel": ["bih_tra"],



	"nzl_akc": ["nzl_afr", "nzl_bir"],
	"nzl_wpr": ["nzl_wol", "nzl_mir"],
	"nzl_wol": ["nzl_iby"],
	"nzl_npr": ["nzl_hnw"],
	"nzl_cas": ["nzl_cos", "nzl_nom"],
	"nzl_nsu": ["nzl_bir", "nzl_ecb"],
	"nzl_chu": ["nzl_uca", "nzl_hal"],

	"fij_baf": ["fij_nad", "fij_tav"],
	"fij_lau": ["fij_nad"],
	"fij_rew": ["fij_nas"],

	"tah_pir": ["tah_tef", "tah_cen", "tah_ven"],
	"tah_tef": ["tah_ven", "tah_cen"],

	"ncl_mag": ["ncl_hie"],
	"ncl_hie": ["ncl_mag", "ncl_tig"],
}






const NATIONS: Dictionary = {

	"México": ["usa", "crc", "can", "hon"],
	"usa": ["México", "can", "crc", "irn"],
	"can": ["usa", "México"],
	"crc": ["México", "usa", "hon", "pan", "nca"],
	"hon": ["slv", "crc", "México", "nca"],
	"slv": ["hon", "gtm"],
	"gtm": ["slv", "hon", "crc"],
	"pan": ["crc", "hon"],
	"nca": ["crc", "hon"],
	"jam": ["tto", "usa", "hai"],
	"tto": ["jam", "guy"],
	"hai": ["dom", "jam"],
	"dom": ["hai", "pur"],
	"pur": ["dom"],
	"guy": ["tto", "sur"],
	"sur": ["guy"],
	"cub": ["jam"],

	"arg": ["BRA", "uru", "chi", "Inglaterra"],
	"BRA": ["arg", "uru", "Alemania"],
	"uru": ["arg", "BRA"],
	"chi": ["arg", "per", "bov"],
	"per": ["chi", "ecu", "bov", "col"],
	"ecu": ["per", "col"],
	"col": ["ecu", "VEN", "per"],
	"VEN": ["col", "bov"],
	"bov": ["chi", "per", "PAR", "VEN"],
	"PAR": ["uru", "arg", "bov"],

	"Inglaterra": ["Alemania", "sco", "arg", "FRA", "irl", "wal", "Italia"],
	"Alemania": ["Inglaterra", "ned", "Italia", "aut", "pol", "arg"],
	"ned": ["Alemania", "bel", "arg", "España"],
	"España": ["Portugal", "Italia", "Inglaterra", "ned", "MAR"],
	"Portugal": ["España", "BRA"],
	"Italia": ["Alemania", "España", "FRA", "Inglaterra"],
	"FRA": ["Italia", "Inglaterra", "Alemania", "alg", "BRA", "MAR"],
	"bel": ["ned", "FRA"],
	"sco": ["Inglaterra"],
	"wal": ["Inglaterra"],
	"irl": ["Inglaterra", "nir"],
	"nir": ["irl"],
	"pol": ["Alemania", "rus", "ukr", "cze"],
	"rus": ["ukr", "pol", "geo"],
	"ukr": ["rus", "pol"],
	"blr": ["ukr", "ltu"],
	"geo": ["rus", "arm"],
	"arm": ["aze", "tur"],
	"aze": ["arm"],
	"srb": ["cro", "alba", "bih", "mne"],
	"cro": ["srb", "svn", "bih"],
	"alba": ["srb", "gre"],
	"bih": ["srb", "cro"],
	"mne": ["srb"],
	"mkd": ["gre", "alba"],
	"kos": ["srb"],
	"gre": ["tur", "alba", "mkd", "cyp"],
	"tur": ["gre", "arm", "cyp"],
	"cyp": ["tur", "gre"],
	"aut": ["Alemania", "sui", "hun"],
	"sui": ["aut", "Italia"],
	"cze": ["svk", "pol"],
	"svk": ["cze", "hun"],
	"hun": ["rou", "svk", "aut"],
	"rou": ["hun", "mda", "bul"],
	"bul": ["rou"],
	"mda": ["rou"],
	"svn": ["cro"],
	"ltu": ["lva", "blr"],
	"lva": ["ltu", "esto"],
	"esto": ["lva", "fin"],
	"swe": ["din", "NOR", "fin"],
	"din": ["swe", "NOR"],
	"NOR": ["swe", "din", "isl"],
	"fin": ["swe", "esto"],
	"isl": ["NOR"],

	"egy": ["alg", "MAR", "sdn"],
	"alg": ["egy", "MAR", "tun", "FRA"],
	"MAR": ["alg", "egy", "tun", "España", "FRA", "mtn"],
	"tun": ["alg", "MAR", "lby"],
	"lby": ["tun", "egy"],
	"mtn": ["MAR", "sen"],
	"nga": ["gha", "cmr", "rsa", "civ"],
	"gha": ["nga", "civ", "tog", "bfa"],
	"civ": ["gha", "cmr", "nga"],
	"cmr": ["nga", "civ", "gab", "eqg"],
	"rsa": ["nga", "bots", "zim"],
	"sen": ["mli", "gin", "mtn", "gam"],
	"mli": ["sen", "bfa", "gin"],
	"bfa": ["mli", "gha", "civ"],
	"gin": ["sen", "mli", "gnb"],
	"gam": ["sen"],
	"gnb": ["gin"],
	"tog": ["gha", "bni"],
	"bni": ["tog", "nga"],
	"cod": ["cog", "agl", "rwa"],
	"cog": ["cod"],
	"agl": ["cod", "moz"],
	"moz": ["agl", "zam"],
	"rwa": ["bdi", "cod", "uga"],
	"bdi": ["rwa"],
	"ken": ["uga", "tan", "eth"],
	"uga": ["ken", "rwa", "tan"],
	"tan": ["ken", "uga"],
	"eth": ["eri", "ken", "sdn"],
	"eri": ["eth"],
	"sdn": ["ssd", "egy", "eth"],
	"ssd": ["sdn"],
	"zam": ["zim", "moz", "mwi"],
	"zim": ["zam", "rsa"],
	"mwi": ["zam"],
	"bots": ["rsa", "nam"],
	"nam": ["bots", "rsa"],
	"gab": ["cmr", "eqg"],
	"eqg": ["cmr", "gab"],
	"cpv": ["gnb"],
	"nig": ["nga", "bfa"],

	"jpn": ["kor", "chn", "aus", "irn", "prk"],
	"kor": ["jpn", "prk", "chn"],
	"prk": ["kor", "jpn"],
	"chn": ["jpn", "kor", "tpe", "hkg"],
	"hkg": ["chn"],
	"tpe": ["chn"],
	"aus": ["jpn", "kor", "nzl"],
	"ksa": ["irn", "qat", "uae", "irq"],
	"irn": ["ksa", "irq", "usa", "jpn"],
	"irq": ["irn", "ksa", "kuw"],
	"qat": ["ksa", "uae", "bhr"],
	"uae": ["qat", "ksa", "omn"],
	"bhr": ["qat", "kuw"],
	"kuw": ["irq", "bhr", "ksa"],
	"omn": ["uae", "yem"],
	"yem": ["omn"],
	"jor": ["pse", "syr"],
	"pse": ["jor", "isr"],
	"syr": ["lbn", "jor"],
	"lbn": ["syr"],
	"idi": ["pak", "bang", "sri", "nep"],
	"pak": ["idi", "afg"],
	"bang": ["idi", "nep"],
	"sri": ["idi"],
	"nep": ["idi", "bang"],
	"afg": ["pak"],
	"idn": ["mas", "sgp", "vie", "tha"],
	"mas": ["idn", "sgp", "tha"],
	"sgp": ["mas", "idn"],
	"tha": ["vie", "mas", "idn"],
	"vie": ["tha", "idn", "chn"],
	"mya": ["tha"],
	"camb": ["vie", "tha"],
	"uzb": ["kgz", "tjk", "tkm"],
	"kgz": ["uzb", "tjk"],
	"tjk": ["uzb", "kgz"],
	"tkm": ["uzb"],
	"kaz": ["uzb"],

	"nzl": ["aus", "sol", "fij"],
	"sol": ["nzl", "van", "png"],
	"fij": ["nzl", "van", "tah"],
	"van": ["sol", "fij", "ncal"],
	"tah": ["ncal", "fij"],
	"ncal": ["tah", "van"],
	"png": ["sol"],
	"samo": ["tga", "asa"],
	"tga": ["samo", "asa"],
	"asa": ["samo", "tga"],
	"cok": ["tah"],
}


static var _map: Dictionary = {}


static var _nat: Dictionary = {}


static var _extra: Dictionary = {}



static func rival_of(team_id: String) -> String:
	if team_id == "":
		return ""
	return String(_all().get(team_id, ""))



static func extras_of(team_id: String) -> Array:
	if team_id == "":
		return []
	return (_all_extra().get(team_id, []) as Array).duplicate()




static func rivals_of(team_id: String) -> Array:
	var out: Array = []
	var canon: String = rival_of(team_id)
	if canon != "":
		out.append(canon)
	for e in extras_of(team_id):
		if not out.has(e):
			out.append(e)
	return out







static func are_rivals(a: String, b: String) -> bool:
	if a == "" or b == "" or a == b:
		return false
	if rival_of(a) == b or rival_of(b) == a:
		return true
	return (_all_extra().get(a, []) as Array).has(b) \
			or (_all_extra().get(b, []) as Array).has(a)



static func nation_rivals_of(nation_id: String) -> Array:
	if nation_id == "":
		return []
	return (_all_nat().get(Nations.canon_id(nation_id), []) as Array).duplicate()




static func nations_are_rivals(a: String, b: String) -> bool:
	if a == "" or b == "":
		return false
	var ca: String = Nations.canon_id(a)
	var cb: String = Nations.canon_id(b)
	if ca == cb:
		return false
	return (_all_nat().get(ca, []) as Array).has(cb) \
			or (_all_nat().get(cb, []) as Array).has(ca)




static func is_main_derby(a: String, b: String) -> bool:
	if a == "" or b == "" or a == b:
		return false
	return rival_of(a) == b or rival_of(b) == a




static func is_handmade(team_id: String) -> bool:


	var mios: Array = TeamEdits.derbis_of(team_id)
	if not mios.is_empty() and mios.has(String(_all().get(team_id, ""))):
		return true
	for p in PAIRS:
		if String(p[0]) == team_id or String(p[1]) == team_id:
			return _all().get(team_id, "") ==(p[1] if String(p[0]) == team_id else p[0])
	return false



static func map() -> Dictionary:
	return _all().duplicate()



static func extra_map() -> Dictionary:
	var out: Dictionary = {}
	for k in _all_extra().keys():
		out[k] =(_all_extra()[k] as Array).duplicate()
	return out



static func nation_map() -> Dictionary:
	var out: Dictionary = {}
	for k in _all_nat().keys():
		out[k] =(_all_nat()[k] as Array).duplicate()
	return out


static func reset_cache() -> void:
	_map = {}
	_extra = {}
	_nat = {}


static func _all() -> Dictionary:
	if _map.is_empty():
		_map = _build()
	return _map


static func _all_extra() -> Dictionary:
	if _extra.is_empty():
		_extra = _build_extra()
	return _extra


static func _all_nat() -> Dictionary:
	if _nat.is_empty():
		_nat = _build_nations()
	return _nat






static func _build_nations() -> Dictionary:
	var out: Dictionary = {}











	var a_mano: Dictionary = NationEdits.derbis()
	var ids_mano: Array = a_mano.keys()
	ids_mano.sort()
	for a0 in ids_mano:
		var a1: String = Nations.canon_id(String(a0))
		if a1 == "" or Nations.by_id(a1).is_empty():
			continue
		for b0 in (a_mano[a0] as Array):
			var b1: String = Nations.canon_id(String(b0))
			if b1 == "" or a1 == b1 or Nations.by_id(b1).is_empty():
				continue
			var vuelta: Array = a_mano.get(b1, []) as Array
			if not vuelta.is_empty() and not vuelta.has(a1):
				continue
			for pair in [[a1, b1], [b1, a1]]:
				var x: String = String(pair[0])
				var y: String = String(pair[1])
				if not out.has(x):
					out[x] = []
				if not (out[x] as Array).has(y):
					(out[x] as Array).append(y)
	for k in NATIONS.keys():
		var a: String = Nations.canon_id(String(k))
		if a == "" or Nations.by_id(a).is_empty():
			continue
		for v in (NATIONS[k] as Array):
			var b: String = Nations.canon_id(String(v))
			if b == "" or a == b or Nations.by_id(b).is_empty():
				continue
			for pair in [[a, b], [b, a]]:
				var x: String = String(pair[0])
				var y: String = String(pair[1])
				if not out.has(x):
					out[x] = []
				if not (out[x] as Array).has(y):
					(out[x] as Array).append(y)
	return out






static func _build_extra() -> Dictionary:
	var out: Dictionary = {}






	var a_mano: Dictionary = TeamEdits.derbis()
	var ids_mano: Array = a_mano.keys()
	ids_mano.sort()
	for a0 in ids_mano:
		var a1: String = String(a0)
		if Teams.by_id(a1).is_empty():
			continue
		for b0 in (a_mano[a0] as Array):
			var b1: String = String(b0)
			if b1 == "" or a1 == b1 or Teams.by_id(b1).is_empty():
				continue
			if Teams.country_of(a1) != Teams.country_of(b1):
				continue
			var vuelta: Array = a_mano.get(b1, []) as Array
			if not vuelta.is_empty() and not vuelta.has(a1):
				continue
			if _all().get(a1, "") == b1 or _all().get(b1, "") == a1:
				continue
			for pair in [[a1, b1], [b1, a1]]:
				var x: String = String(pair[0])
				var y: String = String(pair[1])
				if not out.has(x):
					out[x] = []
				if not (out[x] as Array).has(y):
					(out[x] as Array).append(y)
	for k in EXTRA.keys():
		var a: String = String(k)
		if a == "" or Teams.by_id(a).is_empty():
			continue
		for v in (EXTRA[k] as Array):
			var b: String = String(v)
			if b == "" or a == b or Teams.by_id(b).is_empty():
				continue
			if Teams.country_of(a) != Teams.country_of(b):
				continue


			if _all().get(a, "") == b:
				continue
			for pair in [[a, b], [b, a]]:
				var x: String = String(pair[0])
				var y: String = String(pair[1])
				if not out.has(x):
					out[x] = []
				if not (out[x] as Array).has(y):
					(out[x] as Array).append(y)
	return out




static func _build() -> Dictionary:
	var out: Dictionary = {}










	var div_cruda: Dictionary = {}
	for t in Teams.POOL:
		div_cruda[String(t["id"])] = int(t.get("div", 2))

















	var a_mano: Dictionary = TeamEdits.derbis()
	var ids_mano: Array = a_mano.keys()
	ids_mano.sort()
	for pasada in [0, 1]:
		for a0 in ids_mano:
			var a1: String = String(a0)
			if out.has(a1) or Teams.by_id(a1).is_empty():
				continue
			for b0 in (a_mano[a0] as Array):
				var b1: String = String(b0)
				if b1 == "" or a1 == b1 or out.has(b1) or Teams.by_id(b1).is_empty():
					continue
				if Teams.country_of(a1) != Teams.country_of(b1):
					continue
				var vuelta: Array = a_mano.get(b1, []) as Array
				if not vuelta.is_empty() and not vuelta.has(a1):
					continue

				if pasada == 0 and (vuelta.is_empty() or String(vuelta[0]) != a1):
					continue
				out[a1] = b1
				out[b1] = a1
				break
	for p in PAIRS:
		var a: String = String(p[0])
		var b: String = String(p[1])



		if a == "" or b == "" or a == b or out.has(a) or out.has(b):
			continue
		if Teams.by_id(a).is_empty() or Teams.by_id(b).is_empty():
			continue
		if Teams.country_of(a) != Teams.country_of(b):
			continue
		if int(div_cruda.get(a, -1)) != int(div_cruda.get(b, -2)):
			continue
		out[a] = b
		out[b] = a


	var buckets: Dictionary = {}
	for t in Teams.POOL:
		var key: String = "%s|%d" % [String(t.get("country", "")), int(t.get("div", 2))]
		if not buckets.has(key):
			buckets[key] = []
		buckets[key].append(t)
	for key in buckets.keys():
		var free: Array =(buckets[key] as Array).filter(
			func(t: Dictionary) -> bool: return not out.has(String(t["id"])))



		free.sort_custom(func(x: Dictionary, y: Dictionary) -> bool:
			var rx: int = int(x.get("rating", 62))
			var ry: int = int(y.get("rating", 62))
			if rx != ry:
				return rx > ry
			return String(x["id"]) < String(y["id"]))
		var i: int = 0
		while i + 1 < free.size():
			var a2: String = String(free[i]["id"])
			var b2: String = String(free[i + 1]["id"])
			out[a2] = b2
			out[b2] = a2
			i += 2














		if i < free.size():
			var solo: Dictionary = free[i]
			if free.size() >= 2:
				out[String(solo["id"])] = String(free[i - 1]["id"])
			else:
				var mejor: String = ""
				var dmin: int = 1<<30
				for t2 in (buckets[key] as Array):
					var id2: String = String((t2 as Dictionary)["id"])
					if id2 == String(solo["id"]):
						continue
					var d2: int = absi(int((t2 as Dictionary).get("rating", 62))
						- int(solo.get("rating", 62)))
					if d2 < dmin or (d2 == dmin and id2 < mejor):
						dmin = d2
						mejor = id2
				if mejor != "":
					out[String(solo["id"])] = mejor
	return out
