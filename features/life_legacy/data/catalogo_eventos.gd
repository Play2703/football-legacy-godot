class_name LifeLegacyCatalogoEventos
extends RefCounted

const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")

static var _carregado: bool = false

static func registrar_todos() -> void:
	if _carregado:
		return
	_carregado = true

	# 1. Festa na Véspera do Derby (Cenário Canônico de Referência)
	LifeLegacyEvents.register_event({
		"id": "festa_vespera_derby",
		"title": "Festa VIP na Véspera do Derby",
		"category": "lifestyle",
		"description": "Você foi convidado para uma festa exclusiva de celebridades exatamente na véspera do clássico mais aguardado do ano.",
		"conditions": { "is_derby": true },
		"weight": 80,
		"choices": [
			{
				"id": "choice_1_ir",
				"text": "Ir à festa e curtir a noite toda",
				"internal_effects": { "discipline": -15.0, "popularity": 15.0, "emotional_stability": -5.0 },
				"career_effects": { "energy": -40.0 },
				"social_post": {
					"hecho": "festa_derby",
					"autor": "Prensa",
					"texto": "BOMBA: Atleta é flagrado em festa VIP na madrugada antes do clássico!"
				}
			},
			{
				"id": "choice_2_recusar",
				"text": "Recusar e descansar para a partida",
				"internal_effects": { "discipline": 10.0, "emotional_stability": 5.0, "personal_relationships": -5.0 }
			},
			{
				"id": "choice_3_sair_cedo",
				"text": "Comparecer por 1 hora e sair cedo",
				"internal_effects": { "personal_relationships": 10.0, "popularity": 5.0 },
				"career_effects": { "energy": -5.0 }
			},
			{
				"id": "choice_4_camarote",
				"text": "Pagar camarote fechado para amigos",
				"internal_effects": { "discipline": -5.0, "popularity": 5.0, "social_influence": 10.0 },
				"career_effects": { "money": -2500 }
			}
		]
	})

	# 2. Crise Conjugal
	LifeLegacyEvents.register_event({
		"id": "crise_conjugal",
		"title": "Tensão e Conflito Conjugal",
		"category": "family",
		"description": "A rotina exaustiva de treinos e viagens gerou atrito severo com seu parceiro(a).",
		"conditions": { "has_spouse": true },
		"weight": 50,
		"choices": [
			{
				"id": "choice_priorizar_casal",
				"text": "Tirar folga e priorizar o relacionamento",
				"internal_effects": { "personal_relationships": 15.0, "emotional_stability": 5.0, "discipline": -5.0 },
				"career_effects": { "money": -1000 }
			},
			{
				"id": "choice_focar_treino",
				"text": "Focar 100% no campo e ignorar atritos",
				"internal_effects": { "discipline": 10.0, "emotional_stability": -10.0, "personal_relationships": -15.0 }
			},
			{
				"id": "choice_terapia",
				"text": "Contratar terapia de casal discreta",
				"internal_effects": { "personal_relationships": 10.0, "emotional_stability": 10.0 },
				"career_effects": { "money": -2000 }
			}
		]
	})

	# 3. Compra de Carro de Luxo
	LifeLegacyEvents.register_event({
		"id": "compra_carro_luxo",
		"title": "Superesportivo na Concessionária",
		"category": "lifestyle",
		"description": "Um supercarro de edição limitada foi disponibilizado exclusivamente para você.",
		"conditions": { "min_money": 15000 },
		"weight": 60,
		"choices": [
			{
				"id": "choice_comprar_luxo",
				"text": "Comprar à vista e ostentar",
				"internal_effects": { "popularity": 15.0, "social_influence": 10.0, "discipline": -5.0 },
				"career_effects": { "money": -12000 },
				"social_post": {
					"hecho": "novo_carro",
					"autor": "Jogador",
					"texto": "Nova máquina na garagem! Foco e conquistas."
				}
			},
			{
				"id": "choice_poupar",
				"text": "Recusar e manter foco nos investimentos",
				"internal_effects": { "discipline": 10.0, "emotional_stability": 10.0 }
			},
			{
				"id": "choice_alugar_fds",
				"text": "Alugar por um fim de semana",
				"internal_effects": { "popularity": 5.0 },
				"career_effects": { "money": -1500 }
			}
		]
	})

	# 4. Investimento com Amigo de Infância
	LifeLegacyEvents.register_event({
		"id": "investimento_amigo_infancia",
		"title": "Projeto do Amigo de Infância",
		"category": "relationships",
		"description": "Seu amigo mais antigo apresentou uma ideia de negócio promissora solicitando aporte financeiro.",
		"conditions": { "min_money": 5000 },
		"weight": 40,
		"choices": [
			{
				"id": "choice_financiar_amigo",
				"text": "Financiar o projeto integralmente",
				"internal_effects": { "personal_relationships": 20.0, "discipline": -5.0 },
				"career_effects": { "money": -5000 }
			},
			{
				"id": "choice_recusar_amigo",
				"text": "Recusar para não misturar negócios",
				"internal_effects": { "discipline": 10.0, "emotional_stability": 5.0, "personal_relationships": -10.0 }
			},
			{
				"id": "choice_apresentar_investidor",
				"text": "Apresentar a um investidor profissional parceiro",
				"internal_effects": { "social_influence": 10.0, "personal_relationships": 5.0 }
			}
		]
	})

	# 5. Nascimento do Primeiro Filho
	LifeLegacyEvents.register_event({
		"id": "nascimento_primeiro_filho",
		"title": "Chegada do Primeiro Filho",
		"category": "family",
		"description": "O bebê está prestes a nascer, transformando para sempre sua vida pessoal e rotina.",
		"conditions": { "has_spouse": true },
		"weight": 45,
		"choices": [
			{
				"id": "choice_licenca_paternidade",
				"text": "Acompanhar o parto de perto e vibrar",
				"internal_effects": { "personal_relationships": 25.0, "emotional_stability": 15.0 },
				"career_effects": { "energy": -20.0 },
				"social_post": {
					"hecho": "bebe_nasceu",
					"autor": "Jogador",
					"texto": "O dia mais feliz da minha vida! Bem-vindo ao mundo."
				}
			},
			{
				"id": "choice_suporte_vip",
				"text": "Contratar suporte integral e manter treinos",
				"internal_effects": { "discipline": 10.0, "personal_relationships": 10.0 },
				"career_effects": { "money": -4000 }
			}
		]
	})

	# 6. Escândalo na Mídia
	LifeLegacyEvents.register_event({
		"id": "escandalo_midia",
		"title": "Escândalo Extracampo nos Tabloides",
		"category": "media",
		"description": "Um programa esportivo sensacionalista publicou boatos infundados sobre sua conduta pessoal.",
		"conditions": { "min_stat": { "popularity": 30.0 } },
		"weight": 55,
		"choices": [
			{
				"id": "choice_processar_tabloide",
				"text": "Acionar advogados e processar o tabloide",
				"internal_effects": { "reputation": 10.0, "emotional_stability": -5.0 },
				"career_effects": { "money": -2000 }
			},
			{
				"id": "choice_descontrair_redes",
				"text": "Ironizar o boato em vídeo nas redes",
				"internal_effects": { "popularity": 10.0, "social_influence": 10.0, "discipline": -5.0 },
				"social_post": {
					"hecho": "resposta_fofoca",
					"autor": "Jogador",
					"texto": "Fake news não me desconcentra! Foco no próximo jogo."
				}
			},
			{
				"id": "choice_silencio_campo",
				"text": "Manter silêncio absoluto e responder em campo",
				"internal_effects": { "discipline": 15.0, "emotional_stability": 10.0, "reputation": 5.0 }
			}
		]
	})

	# 7. Noivado Surpresa
	LifeLegacyEvents.register_event({
		"id": "noivado_surpresa",
		"title": "Pedido de Noivado",
		"category": "family",
		"description": "Seu relacionamento amadureceu e o momento ideal para o casamento se aproxima.",
		"conditions": { "min_money": 8000 },
		"weight": 50,
		"choices": [
			{
				"id": "choice_festa_noivado",
				"text": "Festa cinematográfica com anel exclusivo",
				"internal_effects": { "popularity": 15.0, "personal_relationships": 20.0 },
				"career_effects": { "money": -7000 },
				"social_post": {
					"hecho": "ela_disse_sim",
					"autor": "Jogador",
					"texto": "Ela disse SIM! Rumo ao altar."
				}
			},
			{
				"id": "choice_jantar_intimo",
				"text": "Jantar intimista reservado a dois",
				"internal_effects": { "personal_relationships": 15.0, "emotional_stability": 10.0 },
				"career_effects": { "money": -1500 }
			},
			{
				"id": "choice_esperar_fim_ano",
				"text": "Aguardar o término da temporada para oficializar",
				"internal_effects": { "discipline": 5.0, "emotional_stability": 5.0 }
			}
		]
	})

	# 8. Mentoria de Jovem da Base
	LifeLegacyEvents.register_event({
		"id": "mentoria_jovem_base",
		"title": "Mentoria do Garoto da Base",
		"category": "club",
		"description": "Uma promessa recém-promovida da academia pede seus conselhos no vestiário.",
		"conditions": { "min_age": 24 },
		"weight": 60,
		"choices": [
			{
				"id": "choice_mentoria_ativa",
				"text": "Treinar juntos e orientar pessoalmente",
				"internal_effects": { "reputation": 15.0, "social_influence": 15.0, "discipline": 5.0 },
				"career_effects": { "energy": -10.0 }
			},
			{
				"id": "choice_presentear_chuteira",
				"text": "Incentivar presenteando com um par de chuteiras",
				"internal_effects": { "reputation": 10.0, "popularity": 5.0 },
				"career_effects": { "money": -800 }
			},
			{
				"id": "choice_manter_distancia",
				"text": "Manter postura distante e focar em si",
				"internal_effects": { "emotional_stability": 5.0 }
			}
		]
	})
