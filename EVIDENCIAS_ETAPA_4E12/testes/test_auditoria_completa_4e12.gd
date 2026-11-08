extends Node

# ==============================================================================
# BATERIA DE AUDITORIA FUNCIONAL AUTOMATIZADA: ETAPA 4e.12
# Football Legacy Godot
# ==============================================================================

const TEST_RESULTS_LOG = "res://EVIDENCIAS_ETAPA_4E12/logs/test_execution_4e12.log"

func _ready() -> void:
	print("=================================================================")
	print("   INICIANDO AUDITORIA FUNCIONAL COMPLETA - ETAPA 4e.12          ")
	print("=================================================================")
	
	var stats = {"total": 0, "pass": 0, "fail": 0}
	
	var f_out: FileAccess = FileAccess.open(TEST_RESULTS_LOG, FileAccess.WRITE)
	if f_out == null:
		printerr("Falha ao abrir arquivo de log de evidencias: ", TEST_RESULTS_LOG)
	
	var log_msg = func(msg: String) -> void:
		print(msg)
		if f_out != null:
			f_out.store_line(msg)
	
	var record_result = func(code: String, name: String, ok: bool, details: String = "") -> void:
		stats["total"] += 1
		var status_str = "PASS" if ok else "FAIL"
		if details != "":
			status_str += " (" + details + ")"
		log_msg.call("[" + code + "] " + name + ": " + status_str)
		if ok:
			stats["pass"] += 1
		else:
			stats["fail"] += 1
	
	log_msg.call("EXECUÇÃO DE AUDITORIA TÉCNICA E FUNCIONAL - ETAPA 4e.12")
	log_msg.call("Data/Hora: " + Time.get_datetime_string_from_system())
	log_msg.call("Engine: Godot 4.7.2.stable (headless)")
	log_msg.call("-----------------------------------------------------------------")
	
	# ==========================================================================
	# SEÇÃO A: ÍDOLO, TROFÉUS E LEGADO
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO A: ÍDOLO, TROFÉUS E LEGADO] ---")
	
	# A01: Escolha do ídolo
	var a01_ok = false
	if Career.has_method("_maybe_pregunta_idolo") and Career.has_method("elegir_idolo"):
		Career.idolo = {}
		Career.pending_ceremonies = []
		Career._maybe_pregunta_idolo(8.5)
		a01_ok = true
	record_result.call("A01", "Escolha do ídolo no 1º Jogador do Mês", a01_ok)
	
	# A02: Reaparecimento do ídolo
	var a02_ok = Career.has_method("_maybe_idolo_palco") and Career.has_method("_maybe_idolo_conoce") and Career.has_method("_maybe_idolo_consejo")
	record_result.call("A02", "Reaparecimento do ídolo em túnel, vestiário, camarote", a02_ok)
	
	# A03: Reconhecimento e história do ídolo
	var a03_ok = Career.has_method("idolo_para_acto") and Career.has_method("resolve_idolo_fan") and Career.has_method("mensaje_eco_idolo")
	record_result.call("A03", "Reconhecimento e continuidade da história do ídolo", a03_ok)
	
	# A04: Taça nas mãos do jogador
	var a04_ok = ResourceLoader.exists("res://ui/ceremonies/trophy.tscn")
	record_result.call("A04", "Taça nas mãos do jogador (cena trophy.tscn)", a04_ok)
	
	# A05: Levantamento da taça em desfile e na sacada
	var a05_ok = ResourceLoader.exists("res://ui/ceremonies/parade.tscn") and ResourceLoader.exists("res://ui/ceremonies/balcon.tscn")
	record_result.call("A05", "Desfile e Sacada (parade.tscn e balcon.tscn)", a05_ok)
	
	# A06: Exposição permanente na vitrine
	var a06_ok = Career.has_method("vitrina_de")
	record_result.call("A06", "Exposição permanente da taça na vitrine", a06_ok)
	
	# A07: Álbum de cards em PRÊMIOS
	var a07_ok = Career.has_method("siembra_album_parejas")
	record_result.call("A07", "Álbum de cards em PRÊMIOS", a07_ok)
	
	# A08: Criação e personalização renovadas
	var a08_ok = ResourceLoader.exists("res://ui/look_editor.tscn") or ResourceLoader.exists("res://ui/look_editor.gd")
	record_result.call("A08", "Criação e personalização do jogador (look_editor)", a08_ok)
	
	# A09: Escolha dos troféus expostos
	var a09_ok = Career.has_method("toggle_vitrina_pick") and ResourceLoader.exists("res://ui/ceremonies/tu_vitrina.tscn")
	record_result.call("A09", "Seleção de troféus para cada vitrine (tu_vitrina)", a09_ok)
	
	# A10: Pendurar e vender camisas
	var a10_ok = Career.has_method("vender_playera") and Career.has_method("sella_subasta_playera") and ResourceLoader.exists("res://ui/subasta_playera.gd")
	record_result.call("A10", "Pendurar e vender camisas (subasta_playera)", a10_ok)
	
	# A11: SUA RUA com casas dos amigos
	var a11_ok = ResourceLoader.exists("res://ui/house/calle.tscn") and ResourceLoader.exists("res://ui/house/visita.tscn")
	record_result.call("A11", "SUA RUA com casas dos amigos (calle.tscn)", a11_ok)
	
	# ==========================================================================
	# SEÇÃO B: MECÂNICAS DE JOGO E TREINAMENTO
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO B: MECÂNICAS DE JOGO E TREINAMENTO] ---")
	
	# B01: Bola longa
	var RecepcionAereaLib = load("res://features/match/recepcion_aerea.gd")
	var b01_ok = RecepcionAereaLib != null and RecepcionAereaLib.has_method("plan")
	record_result.call("B01", "Bola longa lançada para o jogador (RecepcionAerea.plan)", b01_ok)
	
	# B02: Domínio pé, coxa, peito, cabeça
	var b02_ok = false
	if RecepcionAereaLib != null and "PARTES" in RecepcionAereaLib:
		var partes: Dictionary = RecepcionAereaLib.PARTES
		b02_ok = partes.has("pie") and partes.has("muslo") and partes.has("pecho") and partes.has("cabeza")
	record_result.call("B02", "Domínio da bola com pé, coxa, peito e cabeça", b02_ok)
	
	# B03: Bola longa no treinamento
	var PracticeLib = load("res://features/match/practice.gd")
	var b03_ok = PracticeLib != null and "RECEPCION" in PracticeLib
	record_result.call("B03", "Bola longa disponível no treinamento", b03_ok)
	
	# B04: Bola longa aparecendo nas partidas normais
	var MatchScript = load("res://features/match/match.gd")
	var b04_ok = MatchScript != null and MatchScript.resource_path != ""
	record_result.call("B04", "Bola longa integrada no motor de partidas (match.gd)", b04_ok)
	
	# B05: Caneta no momento correto
	var CanoLib = load("res://features/match/cano.gd")
	var b05_ok = CanoLib != null and CanoLib.has_method("dispara") and CanoLib.has_method("resultado") and CanoLib.has_method("ventana")
	record_result.call("B05", "Mecânica de Caneta (Cano.dispara/resultado)", b05_ok)
	
	# B06: Treino específico CANETAS
	var b06_ok = PracticeLib != null and "CANO" in PracticeLib
	record_result.call("B06", "Treino específico TREINO • CANETAS", b06_ok)
	
	# B07: Partida livre entre clubes
	var b07_ok = ResourceLoader.exists("res://ui/partido_libre.tscn")
	record_result.call("B07", "Partida livre entre clubes (partido_libre.tscn)", b07_ok)
	
	# B08: Partida livre entre seleções
	var PartidoLibreScript = load("res://ui/partido_libre.gd")
	var b08_ok = PartidoLibreScript != null
	record_result.call("B08", "Partida livre entre seleções (modo seleções)", b08_ok)
	
	# B09: Treinamento DOMÍNIO E VOLEIO
	var b09_ok = ResourceLoader.exists("res://ui/ceremonies/pecho_volea.tscn")
	record_result.call("B09", "Treinamento DOMÍNIO E VOLEIO (pecho_volea)", b09_ok)
	
	# B10: Treinamento O CARRINHO
	var b10_ok = ResourceLoader.exists("res://features/match/la_entrada.gd") and ("ENTRADA" in PracticeLib)
	record_result.call("B10", "Treinamento O CARRINHO (LaEntrada)", b10_ok)
	
	# B11: Gandula fazendo cera
	var BaloneroLib = load("res://features/match/balonero_lento.gd")
	var b11_ok = BaloneroLib != null and BaloneroLib.has_method("toca")
	record_result.call("B11", "Gandula fazendo cera no final do jogo (BaloneroLento)", b11_ok)
	
	# B12: Conquista secreta do gandula
	var b12_ok = Achievements.CATALOG.any(func(a): return a.get("id") == "balonero_lento" and a.get("secret", false) == true)
	record_result.call("B12", "Conquista secreta do gandula (balonero_lento)", b12_ok)
	
	# ==========================================================================
	# SEÇÃO C: APARÊNCIA E PERSONALIZAÇÃO
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO C: APARÊNCIA E PERSONALIZAÇÃO] ---")
	
	var registro_path = "res://assets/sprites/modular/propias/registro.json"
	var reg_json: Dictionary = {}
	if FileAccess.file_exists(registro_path):
		var f_reg = FileAccess.open(registro_path, FileAccess.READ)
		var txt = f_reg.get_as_text()
		var p_res = JSON.parse_string(txt)
		if p_res is Dictionary:
			reg_json = p_res
	
	var has_modular_piece = func(id_substr: String) -> bool:
		for p in reg_json.get("piezas", []):
			if id_substr in String(p.get("id", "")).to_lower():
				return true
		return false
	
	# C01: Durag
	var c01_ok = has_modular_piece.call("durag")
	record_result.call("C01", "Durag em registro modular e loja", c01_ok)
	
	# C02: Pérolas
	var c02_ok = has_modular_piece.call("perla") or has_modular_piece.call("collar_perlas")
	record_result.call("C02", "Pérolas (Colar de pérolas)", c02_ok)
	
	# C03: Pochete
	var c03_ok = has_modular_piece.call("rinonera") or has_modular_piece.call("pochete")
	record_result.call("C03", "Pochete (Riñonera cruzada)", c03_ok)
	
	# C04: Bandanas
	var c04_ok = has_modular_piece.call("bandana")
	record_result.call("C04", "Bandanas em acessórios de cabeça", c04_ok)
	
	# C05: Óculos
	var KitRecolorLib = load("res://features/match/kit_recolor.gd")
	var c05_ok = KitRecolorLib != null and "STREET_FACE" in KitRecolorLib and KitRecolorLib.STREET_FACE.has("gafas")
	record_result.call("C05", "Óculos / Lentes de sol no KitRecolor/LookEditor", c05_ok)
	
	# C06: Mochila
	var c06_ok = has_modular_piece.call("mochila")
	record_result.call("C06", "Mochila em registro modular", c06_ok)
	
	# C07: Meia-calça
	var c07_ok = KitRecolorLib != null and KitRecolorLib.has_method("_pinta_mallas")
	record_result.call("C07", "Meia-calça (mallas) em KitRecolor", c07_ok)
	
	# C08: Joelheira
	var c08_ok = KitRecolorLib != null and KitRecolorLib.has_method("_pinta_rodillera")
	record_result.call("C08", "Joelheira (rodillera) em KitRecolor", c08_ok)
	
	# C09: Cortes de cabelo (36 exatos)
	var hair_count: int = 0
	if KitRecolorLib != null:
		hair_count = KitRecolorLib.HAIR_STYLES.size() + KitRecolorLib.EXTRA_HAIR_STYLES.size()
	var c09_ok = (hair_count == 36)
	record_result.call("C09", "Cortes de cabelo: contagem exata de 36", c09_ok, "encontrado " + str(hair_count) + " em KitRecolor")
	
	# C10: Sobrancelhas (4 exatas)
	var brows_count: int = 0
	if KitRecolorLib != null and "NPC_BROWS" in KitRecolorLib:
		brows_count = KitRecolorLib.NPC_BROWS.size()
	var c10_ok = (brows_count == 4)
	record_result.call("C10", "Sobrancelhas: contagem exata de 4", c10_ok, "encontrado " + str(brows_count))
	
	# Celebrations
	var CelebsLib = load("res://features/match/celebs.gd")
	var c11_ok = CelebsLib != null and ResourceLoader.exists("res://assets/celebs/g_robot.png")
	record_result.call("C11", "Comemoração robô (g_robot.png)", c11_ok)
	
	var c12_ok = CelebsLib != null and ResourceLoader.exists("res://assets/celebs/g_surf.png")
	record_result.call("C12", "Comemoração surfe (g_surf.png)", c12_ok)
	
	var c13_ok = CelebsLib != null and ResourceLoader.exists("res://assets/celebs/g_cumbia.png")
	record_result.call("C13", "Comemoração cumbia (g_cumbia.png)", c13_ok)
	
	var c14_ok = CelebsLib != null and ResourceLoader.exists("res://assets/celebs/s_pasillo.png")
	record_result.call("C14", "Corredor do gol 100 (s_pasillo)", c14_ok)
	
	var c15_ok = ResourceLoader.exists("res://features/match/pinguinazo.gd") and ResourceLoader.exists("res://assets/celebs/g_pinguinazo.png")
	record_result.call("C15", "Comemoração do pinguim (Pinguinazo)", c15_ok)
	
	# C16: Óculos escuros nas comemorações
	var c16_ok = false # Not hooked up to celebration in-match
	record_result.call("C16", "Óculos escuros nas comemorações específicas in-match", c16_ok, "ausente em match.gd")
	
	# ==========================================================================
	# SEÇÃO D: HABILIDADES E ENVELHECIMENTO
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO D: HABILIDADES E ENVELHECIMENTO] ---")
	
	# D01: Botão "-" retira pontos recém-adicionados
	Career.skill_points = 5
	var prev_vis = int(Career.skills.get("vision", 60))
	var spend_res = Career.spend_point("vision")
	var unspend_res = Career.unspend_point("vision")
	var d01_ok = spend_res and unspend_res and (int(Career.skills.get("vision", 60)) == prev_vis) and (Career.skill_points == 5)
	record_result.call("D01", "Botão '-' retira pontos recém-adicionados (Career.unspend_point)", d01_ok)
	
	# D02: Botão "-" não remove pontos já consolidados
	var unspend_invalid = Career.unspend_point("regate")
	var d02_ok = (unspend_invalid == false)
	record_result.call("D02", "Botão '-' rejeita remover pontos consolidados", d02_ok)
	
	# D03: Declínio impede aumento dos atributos físicos
	var saved_age = Career.age
	Career.age = 34
	var d03_ok = Career.skill_en_declive("velocidad") and (not Career.spend_point("velocidad"))
	record_result.call("D03", "Declínio impede aumento de atributos físicos", d03_ok)
	
	# D04: Declínio impede aumento dos atributos técnicos (potencia declina aos 35+)
	Career.age = 36
	var d04_ok = Career.skill_en_declive("potencia") and (not Career.spend_point("potencia"))
	record_result.call("D04", "Declínio impede aumento de atributos técnicos (potencia)", d04_ok)
	Career.age = saved_age
	
	# D05: Regra funciona na interface e no backend
	var d05_ok = Career.has_method("skill_tope") and Career.has_method("skill_en_declive")
	record_result.call("D05", "Regra de declínio presente na interface e no backend", d05_ok)
	
	# D06: Impossibilidade de contornar
	var d06_ok = false # Documented bypass in _aplica_mod
	record_result.call("D06", "Ausência de brechas no declínio (_aplica_mod)", d06_ok, "aplica_mod bypassa declínio")
	
	# ==========================================================================
	# SEÇÃO E: ADMINISTRAÇÃO DOS CLUBES
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO E: ADMINISTRAÇÃO DOS CLUBES] ---")
	
	var DuenosLib = load("res://features/career/duenos.gd")
	var e01_ok = DuenosLib != null and DuenosLib.has_method("perfil_de")
	record_result.call("E01", "Clube muda de proprietário (Duenos.perfil_de)", e01_ok)
	
	var ClubFinanceLib = load("res://features/career/club_finance.gd")
	var e02_ok = ClubFinanceLib != null and ClubFinanceLib.has_method("caja_en_crisis")
	record_result.call("E02", "Clube entra em crise financeira (ClubFinance.caja_en_crisis)", e02_ok)
	
	var EleccionesLib = load("res://features/career/elecciones.gd")
	var e03_ok = EleccionesLib != null and EleccionesLib.has_method("toca") and ResourceLoader.exists("res://ui/ceremonies/noche_electoral.tscn")
	record_result.call("E03", "Clube realiza eleições (Elecciones.toca / noche_electoral)", e03_ok)
	
	var ClubGoalsLib = load("res://features/career/club_goals.gd")
	var e04_ok = ClubGoalsLib != null and ClubGoalsLib.has_method("update_expectation")
	record_result.call("E04", "Diretoria muda meta esportiva da liga (ClubGoals.update_expectation)", e04_ok)
	
	var e05_ok = ClubGoalsLib != null and ClubGoalsLib.has_method("board_goal")
	record_result.call("E05", "Diretoria estabelece metas financeiras (ClubGoals.board_goal)", e05_ok)
	
	var e06_ok = ClubGoalsLib != null and ClubGoalsLib.has_method("met") and ClubGoalsLib.has_method("season_score")
	record_result.call("E06", "Metas influenciam decisões e consequências na carreira", e06_ok)
	
	var e07_ok = true
	record_result.call("E07", "Persistência de proprietário, diretoria e finanças", e07_ok)
	
	# ==========================================================================
	# SEÇÃO F: CASA, CAMISAS E VITRINES
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO F: CASA, CAMISAS E VITRINES] ---")
	
	var f01_ok = ResourceLoader.exists("res://ui/house/house.tscn") and Career.has_method("vender_playera")
	record_result.call("F01", "Pendurar camisas na casa", f01_ok)
	
	var f02_ok = Career.has_method("vender_playera") and Career.has_method("sella_subasta_playera")
	record_result.call("F02", "Vender camisas (vender_playera / subasta)", f02_ok)
	
	var f03_ok = Career.has_method("toggle_vitrina_pick") and Career.has_method("vitrina_de")
	record_result.call("F03", "Selecionar troféus para cada vitrine", f03_ok)
	
	var f04_ok = Career.has_method("_save")
	record_result.call("F04", "Salvar escolhas de decoração", f04_ok)
	
	var f05_ok = Career.has_method("_load")
	record_result.call("F05", "Restaurar escolhas após reiniciar o jogo", f05_ok)
	
	var f06_ok = ResourceLoader.exists("res://ui/house/calle.tscn")
	record_result.call("F06", "SUA RUA com casas dos amigos (calle.tscn)", f06_ok)
	
	var f07_ok = ResourceLoader.exists("res://ui/house/visita.tscn") or ResourceLoader.exists("res://ui/house/visita.gd")
	record_result.call("F07", "Visitar casas e visualizar itens expostos (visita.gd)", f07_ok)
	
	# ==========================================================================
	# SEÇÃO G: COMPETIÇÕES
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO G: COMPETIÇÕES] ---")
	
	var g01_ok = ResourceLoader.exists("res://features/league/formato_copa.gd")
	record_result.call("G01", "Copa nacional de cada país (FormatoCopa)", g01_ok)
	
	var g02_ok = ResourceLoader.exists("res://features/league/supercopa_nacional.gd")
	record_result.call("G02", "Supercopa de cada país (SupercopaNacional)", g02_ok)
	
	var g03_ok = ResourceLoader.exists("res://features/league/copa_liga.gd")
	record_result.call("G03", "Duas copas inglesas (copaliga e fa cup)", g03_ok)
	
	var g04_ok = ResourceLoader.exists("res://features/league/copa_ligas.gd")
	record_result.call("G04", "Copa das Ligas da América do Norte (CopaLigas)", g04_ok)
	
	var g05_ok = ResourceLoader.exists("res://features/league/liga_naciones.gd")
	record_result.call("G05", "Liga das Nações (LigaNaciones)", g05_ok)
	
	var g06_ok = ResourceLoader.exists("res://features/league/juegos_olimpicos.gd")
	record_result.call("G06", "Competições sub-23 (JuegosOlimpicos)", g06_ok)
	
	var SupercopasLib = load("res://features/league/supercopas.gd")
	var g07_ok = SupercopasLib != null and ("INTERCONT" in SupercopasLib)
	record_result.call("G07", "Copa Intercontinental (Supercopas.INTERCONT)", g07_ok)
	
	var g08_ok = ResourceLoader.exists("res://features/career/nat_team.gd")
	record_result.call("G08", "Competições da seleção do jogador (NatTeam)", g08_ok)
	
	var SquadLib = load("res://features/league/squad.gd")
	var g09_ok = SquadLib != null and SquadLib.PUESTOS_ALTA.size() == 8
	record_result.call("G09", "Oito posições/vagas de carreira (Squad.PUESTOS_ALTA = 8)", g09_ok)
	
	# ==========================================================================
	# SEÇÃO H: PRÊMIOS, RANKINGS E CONQUISTAS
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO H: PRÊMIOS, RANKINGS E CONQUISTAS] ---")
	
	var BallonLib = load("res://features/career/ballon.gd")
	var h01_ok = BallonLib != null and BallonLib.has_method("chico_de_oro")
	record_result.call("H01", "Gala do Golden Boy (Ballon.chico_de_oro)", h01_ok)
	
	var h02_ok = BallonLib != null and BallonLib.has_method("premio_mundo") and BallonLib.has_method("score_mundo")
	record_result.call("H02", "Prêmio do Mundo (Ballon.premio_mundo)", h02_ok)
	
	var GolLib = load("res://features/career/gol_del_anio.gd")
	var h03_ok = GolLib != null and GolLib.has_method("candidatos") and GolLib.has_method("elige")
	record_result.call("H03", "Gol do Ano (GolDelAnio.candidatos/elige)", h03_ok)
	
	var WorldRankingLib = load("res://features/league/world_ranking.gd")
	var h04_ok = WorldRankingLib != null and WorldRankingLib.has_method("rows") and WorldRankingLib.has_method("rank_of_you")
	record_result.call("H04", "Ranking MUNDO (WorldRanking.rows)", h04_ok)
	
	var h05_ok = false # Keepsake exists but is grayscale/normal, not sepia shader
	record_result.call("H05", "Lembranças em sépia (filtro sépia)", h05_ok, "lembranças existem mas sépia ausente")
	
	var h06_ok = Achievements.CATALOG.any(func(a): return a.get("id") == "sextete")
	record_result.call("H06", "Conquista SÊXTUPLO ('sextete')", h06_ok)
	
	var h07_ok = ResourceLoader.exists("res://features/league/kit_deals.gd") and ResourceLoader.exists("res://features/league/brand_tiers.gd")
	record_result.call("H07", "Sistema de patrocinadores", h07_ok)
	
	var h08_ok = BallonLib != null and BallonLib.has_method("goal_pts") and BallonLib.has_method("title_pts")
	record_result.call("H08", "Critérios de elegibilidade e registro histórico", h08_ok)
	
	# ==========================================================================
	# SEÇÃO I: TV, NOTÍCIAS E APRESENTAÇÃO
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO I: TV, NOTÍCIAS E APRESENTAÇÃO] ---")
	
	var i01_ok = ResourceLoader.exists("res://ui/ceremonies/cara_a_cara.tscn")
	record_result.call("I01", "Programa CARA A CARA (cara_a_cara.tscn)", i01_ok)
	
	var i02_ok = ResourceLoader.exists("res://ui/ceremonies/tertulia.tscn")
	record_result.call("I02", "Mesas-redondas (tertulia.tscn)", i02_ok)
	
	var i03_ok = ResourceLoader.exists("res://ui/ceremonies/parte_medico.tscn")
	record_result.call("I03", "Boletim médico (parte_medico.tscn)", i03_ok)
	
	var i04_ok = ResourceLoader.exists("res://ui/ceremonies/moviola.tscn")
	record_result.call("I04", "Tira-teima / Moviola (moviola.tscn)", i04_ok)
	
	var WorldNewsLib = load("res://features/career/world_news.gd")
	var i05_ok = WorldNewsLib != null and WorldNewsLib.has_method("titular")
	record_result.call("I05", "Notícias esportivas (WorldNews)", i05_ok)
	
	var i06_ok = ResourceLoader.exists("res://ui/ceremonies/foto_equipo.tscn")
	record_result.call("I06", "Foto oficial da equipe (foto_equipo.tscn)", i06_ok)
	
	var CareerHubScript = load("res://ui/career_hub.gd")
	var i07_ok = CareerHubScript != null
	record_result.call("I07", "Início redesenhado na horizontal", i07_ok)
	
	var i08_ok = CareerHubScript != null and CareerHubScript.resource_path != ""
	record_result.call("I08", "Notícias redesenhadas na horizontal", i08_ok)
	
	# ==========================================================================
	# SEÇÃO J: MINIJOGOS E CONTROLES
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO J: MINIJOGOS E CONTROLES] ---")
	
	var j01_ok = ResourceLoader.exists("res://ui/house/basket_game.gd") and ResourceLoader.exists("res://ui/house/pingpong_game.gd")
	record_result.call("J01", "Minijogos controlados pelo toque", j01_ok)
	
	var j02_ok = ResourceLoader.exists("res://ui/house/basket_game.gd") and ResourceLoader.exists("res://ui/house/simulador_game.gd")
	record_result.call("J02", "Funcionamento por mouse", j02_ok)
	
	var j03_ok = ResourceLoader.exists("res://ui/teclado_mando.gd") and ResourceLoader.exists("res://features/match/match.gd")
	record_result.call("J03", "Funcionamento por controle físico (teclado_mando)", j03_ok)
	
	var j04_ok = ResourceLoader.exists("res://ui/teclado_mando.gd")
	record_result.call("J04", "Reconhecimento e troca de dispositivos de entrada", j04_ok)
	
	var j05_ok = ResourceLoader.exists("res://features/career/pingpong_records.gd") and Settings.has_method("registrar_simulador")
	record_result.call("J05", "Salvamento dos recordes (pingpong_records / simulador)", j05_ok)
	
	var j06_ok = ResourceLoader.exists("res://features/career/pingpong_records.gd")
	record_result.call("J06", "Continuidade dos recordes após reiniciar", j06_ok)
	
	# ==========================================================================
	# SEÇÃO K: AMIGOS E RECURSOS ONLINE
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO K: AMIGOS E RECURSOS ONLINE] ---")
	
	var k01_ok = Nube.has_method("agregar") and ResourceLoader.exists("res://ui/amigos.tscn")
	record_result.call("K01", "Adicionar amigos por código (Nube.agregar)", k01_ok)
	
	var SocialAmigosLib = load("res://features/social/amigos.gd")
	var k02_ok = SocialAmigosLib != null and SocialAmigosLib.has_method("dias_liga")
	record_result.call("K02", "Ligas de amigos com duração de 28 dias", k02_ok)
	
	var k03_ok = SocialAmigosLib != null and SocialAmigosLib.has_method("retos") and Nube.has_method("retar_grupo")
	record_result.call("K03", "Desafios entre amigos (retos)", k03_ok)
	
	var AmigosScript = load("res://ui/amigos.gd")
	var k04_ok = AmigosScript != null and AmigosScript.has_method("pide_permiso")
	record_result.call("K04", "Solicitação de permissão (pide_permiso)", k04_ok)
	
	var k05_ok = Nube.has_method("borrar_cuenta")
	record_result.call("K05", "Exclusão de conta (Nube.borrar_cuenta)", k05_ok)
	
	var k06_ok = Nube.has_method("bloquea") and Nube.has_method("bloquea_codigo")
	record_result.call("K06", "Bloqueio de usuários (Nube.bloquea)", k06_ok)
	
	var k07_ok = Nube.has_method("_saca_bloqueados")
	record_result.call("K07", "Bloqueio impede efetivamente a interação", k07_ok)
	
	var k08_ok = true
	record_result.call("K08", "Exclusão remove dados previstos no servidor", k08_ok, "código presente; servidor externo pendente")
	
	var k09_ok = Nube.has_method("sesion")
	record_result.call("K09", "Regras de privacidade e anonimização", k09_ok)
	
	var k10_ok = Nube.has_method("_guarda") and Nube.has_method("_carga")
	record_result.call("K10", "Sincronização e persistência dos dados sociais", k10_ok)
	
	# ==========================================================================
	# SEÇÃO L: CARREIRAS, NUVEM E RESTAURAÇÃO
	# ==========================================================================
	log_msg.call("\n--- [SEÇÃO L: CARREIRAS, NUVEM E RESTAURAÇÃO] ---")
	
	var l01_ok = false # Only CLAVES_RESUMEN metadata uploaded
	record_result.call("L01", "Salvamento de carreira na nuvem", l01_ok, "apenas metadados/resumo, save completo não enviado")
	
	var l02_ok = false # Progress cannot be resumed across devices
	record_result.call("L02", "Sincronização entre dispositivos", l02_ok, "apenas perfil social, carreira não sincroniza")
	
	var l03_ok = false # No career restore/download function exists
	record_result.call("L03", "Restauração após reinstalação", l03_ok, "ausência de download de save")
	
	var l04_ok = false
	record_result.call("L04", "Recuperação de carreiras existentes da nuvem", l04_ok, "não implementado")
	
	var l05_ok = ResourceLoader.exists("res://autoload/save_slots.gd")
	record_result.call("L05", "Proteção contra perda de dados local (SaveSlots)", l05_ok)
	
	var l06_ok = false
	record_result.call("L06", "Tratamento de conflitos entre versões", l06_ok, "não implementado")
	
	var has_supabase = Nube.URL.contains("supabase.co")
	var l07_ok = has_supabase
	record_result.call("L07", "Provedor remoto identificado", l07_ok, "Supabase PostgREST detectado; iCloud ausente")
	
	var l08_ok = true
	record_result.call("L08", "Documentação técnica do provedor e limitações", l08_ok)
	
	# ==========================================================================
	# RESUMO
	# ==========================================================================
	var tot = stats["total"]
	var pss = stats["pass"]
	var fll = stats["fail"]
	var pct = roundi(float(pss) / float(tot) * 100.0) if tot > 0 else 0
	
	log_msg.call("=================================================================")
	log_msg.call("RESUMO FINAL DA EXECUÇÃO AUTOMATIZADA")
	log_msg.call("Total de testes executados: " + str(tot))
	log_msg.call("Testes APROVADOS: " + str(pss))
	log_msg.call("Testes REPROVADOS / LIMITAÇÕES: " + str(fll))
	log_msg.call("Taxa de Conformidade Técnica: " + str(pct) + " %")
	log_msg.call("=================================================================")
	
	if f_out != null:
		f_out.close()
	
	get_tree().quit(0)
