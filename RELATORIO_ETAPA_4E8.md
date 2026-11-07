# RELATÓRIO TÉCNICO DE AUDITORIA E REFINAMENTO VISUAL — ETAPA 4e.8
**Projeto**: Football Legacy (Godot 4.3 Engine)  
**Branch**: `etapa-4e8-visual-refinement`  
**Data**: 06/11/2026  
**Status**: **100% APROVADO (137/137 CHECKS VERIFICADOS)**  

---

## 1. RESUMO EXECUTIVO

A **ETAPA 4e.8** realizou o refinamento pontual e cirúrgico da identidade visual, dos escudos SVG oficiais e do scoreboard da La Liga, preservando integralmente todas as conquistas das etapas anteriores (4e.6 e 4e.7).

### Objetivos Alcançados:
1. **Correção Crítica dos Botafogos**: Identificação da causa-raiz da colisão de escudos, cadastro do Botafogo-PB (`bot_pb`) na base oficial de clubes `teams.gd`, correção do algoritmo de tokenização e mapeamento definitivo:
   - **Botafogo-RJ (`bot`)**: Escudo oficial alvinegro com a **Estrela Solitária** (`botafogo-logo-footylogos.svg`).
   - **Botafogo-PB (`bot_pb`)**: Escudo oficial com a **Estrela Vermelha** e monograma B-P-B (`botafogo-pb-logo-footylogos.svg`).
   - **Botafogo-SP (`bota`)**: Escudo tricolor paulista BFC (`botafogo-sp-logo-footylogos.svg`).
   - **Teste de Carga Dupla**: Aprovado com 100% de separação e buffers visuais distintos.
2. **Nitidez e Resolução SVG (512px com Cache Multi-Resolução)**:
   - Resolução de rasterização elevada de 256px para **512px** (`MAX_PX = 512`).
   - Assinatura estendida: `CrestLogos.texture(team_id, retro, target_px = 512)`.
   - Cache em memória indexado por tupla `team_id|target_px|retro`, garantindo reuso sem processamento repetitivo.
   - Geração automática de mipmaps e interpolação linear para os escudos vetoriais, mantendo inalterados os elementos em pixel art (`nearest neighbour`).
3. **Ampliação Responsiva e Centralização do Placar La Liga**:
   - Fator de escala ampliado em 1.30x no desktop (largura de 530px para ~689px em 1920×1080).
   - Dimensionamento inteligente em portrait (ocupando 88% da largura da tela, ~950px em 1080×1920).
   - Otimização para mobile landscape (844×390) com altura contida (39px) e zero clipping.
   - Centralização horizontal absoluta (`anchor_left = 0.5`, `anchor_right = 0.5`, `offset_left = -half_w`, diferença `<= 0.5px`).

---

## 2. AUDITORIA DA CORREÇÃO BOTAFOGO-RJ vs BOTAFOGO-PB

### Diagnóstico da Causa-Raiz:
Na ETAPA 4e.7, o algoritmo de cruzamento em `build_svg_team_mapping.py` possuía uma lista de palavras irrelevantes (`stop words`) que incluía `'pb'` e `'sp'`. Como consequência, o escudo `botafogo-pb-logo-footylogos.svg` da Série C foi normalizado para o token singular `{'botafogo'}`, colidindo com o `botafogo-logo-footylogos.svg` da Série A e sobrescrevendo o clube `bot`.

### Correções Implementadas:
1. `features/league/teams.gd`: Adicionado o clube oficial **Botafogo-PB** (`bot_pb`) na divisão 3 (Série C) ao lado do Botafogo-SP (`bota`), com cores alvinegras e estrela vermelha.
2. `build_svg_team_mapping.py`:
   - Remoção dos identificadores de estado (`pb`, `sp`, `rj`) da lista de stop words.
   - Mapeamento explícito nos `verified_matches`:
     * `('brasileirao-serie-a-2026', 'botafogo'): 'bot'`
     * `('brasileirao-serie-b-2026', 'botafogo-sp'): 'bota'`
     * `('brasileirao-serie-c-2026', 'botafogo-pb'): 'bot_pb'`
   - Proteção de colisão com verificação de precedência e score de confiança.
3. Validação por teste automatizado comprovando que carregar simultaneamente `bot` e `bot_pb` resulta em duas texturas independentes e com dados binários distintos.

---

## 3. NITIDEZ DOS ESCUDOS SVG E CARREGAMENTO EM MEMÓRIA

| Parâmetro | Implementação ETAPA 4e.7 | Implementação Refinada ETAPA 4e.8 | Benefício Visual |
|---|---|---|---|
| **Resolução Base** | 256 × 256 px | **512 × 512 px** | Fidelidade absoluta dos detalhes e curvas vetoriais |
| **Chave do Cache** | `team_id` | `team_id\|target_px[\|retro]` | Suporte multi-resolução sem colisões |
| **Mipmaps** | Presentes | **Presentes e validados em 512px** | Sem cintilação (anti-aliasing de textura suave) |
| **Transparência** | Canal alfa preservado | **Canal alfa RGBA8 integral** | Sem artefatos de contorno escuro ou branco |
| **Pixel Art (Jogadores/Campo)** | Nearest Neighbour | **Inalterado (Nearest Neighbour)** | Preservação do estilo visual do jogo |

---

## 4. RESPONSIVIDADE DO PLACAR DA LA LIGA (5 RESOLUÇÕES)

| Resolução | Tipo de Tela | Largura do Placar | Altura | Centralização Horizontal | Margens Laterais |
|---|---|---|---|---|---|
| **1920 × 1080** | Desktop FHD | **689.0 px** | 73.0 px | **Perfeita (0.0 px diff)** | L: 615.5 px \| R: 615.5 px |
| **1280 × 720** | Desktop HD | **459.3 px** | 49.0 px | **Perfeita (0.0 px diff)** | L: 410.3 px \| R: 410.3 px |
| **927 × 873** | Janela Local | **644.1 px** | 68.0 px | **Perfeita (0.0 px diff)** | L: 141.4 px \| R: 141.4 px |
| **1080 × 1920** | Mobile Portrait | **950.4 px** | 100.0 px | **Perfeita (0.0 px diff)** | L: 64.8 px \| R: 64.8 px |
| **844 × 390** | Mobile Landscape | **371.4 px** | 39.0 px | **Perfeita (0.0 px diff)** | L: 236.3 px \| R: 236.3 px |

---

## 5. RESULTADOS DO TESTE RUNNER (`runner_etapa_4e8.gd`)

```
================================================================================
RESUMO DA AUDITORIA ETAPA 4e.8:
  TOTAL DE CHECKS: 137
  CHECKS APROVADOS: 137
  CHECKS FALHADOS:  0
  TOTAL DE CAPTURAS GERADAS: 24
================================================================================
>>> ETAPA 4e.8 APROVADA COM SUCESSO TOTAL (100%) <<<
```

### Capturas Geradas:
- `crest_botafogo_rj_512px.png`: Escudo oficial Botafogo-RJ com a Estrela Solitária.
- `crest_botafogo_pb_512px.png`: Escudo oficial Botafogo-PB com a Estrela Vermelha.
- `crest_botafogo_sp_512px.png`: Escudo oficial Botafogo-SP tricolor.
- `painel_botafogos_comparativo_4e8.png`: Painel comparativo de escudos e confrontos in-game.
- `painel_responsividade_la_liga_ampliado_4e8.png`: Painel das 5 resoluções do placar La Liga ampliado.
- `painel_match_center_confrontos_4e8.png`: Match HUD e Match Center nos 8 confrontos testados.
- 5 capturas do Match HUD da La Liga nas 5 resoluções.
- 16 capturas de Match HUD e Match Center dos confrontos.
