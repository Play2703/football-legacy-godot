# ETAPA 4e.11 — RESTAURAÇÃO DA NITIDEZ E QUALIDADE DE RENDERIZAÇÃO DA HUD

## 1. OBJETIVO GERAL ALCANÇADO

Na **ETAPA 4e.10**, a escala responsiva e a centralização do placar da La Liga foram corrigidas com uma fórmula matemática contínua e universal. Contudo, foi constatada uma perda de nitidez e definição visual na HUD decorrente de upscaling bilinear fracionário de fontes e subpixels não alinhados.

O objetivo da **ETAPA 4e.11** foi recuperar a nitidez cristalina, definição das fontes tipográficas e fidelidade gráfica dos escudos oficiais SVG, **mantendo 100% da fórmula de layout responsivo, posicionamento, geometria e proporções aprovadas na 4e.10**.

---

## 2. DIAGNÓSTICO DA CAUSA-RAIZ DA PERDA DE NITIDEZ

Uma auditoria minuciosa do pipeline de renderização 2D do Godot 4 identificou as três causas-raiz da degradação visual:

1. **Escala Fracionária de CanvasItem (`scale = Vector2.ONE * scale_factor`)**:
   - Em 4e.10, o nó `_new_scoreboard` mantinha suas dimensões internas fixas no espaço base de 530 × 56 px, enquanto o container `hud.gd` aplicava uma matriz de transformação `scale = Vector2.ONE * scale_factor` (ex: `1.59396` em 1920×1080 FHD, ou `1.793` em 1080×1920 Mobile FHD).
   - O TextServer do Godot alocava e rasterizava os caracteres da fonte (Bebas Neue) em tamanhos pequenos de 22 a 24 px no atlas de glifos.
   - Ao desenhar na tela, a GPU aplicava amostragem bilinear linear contínua para esticar os glifos de 22 px para 36 px, gerando **bordas desfocadas, letras borradas e perda do contraste tipográfico**.
2. **Subpixels Fracionários e Ausência de Pixel Snapping**:
   - Coordenadas multiplicadas por fatores não-inteiros faziam com que linhas divisoras e caixas de `StyleBoxFlat` caíssem em posições subpixel (ex: `x = 151.42 px`), resultando em antialiasing espúrio e linhas cinzentas semitransparentes.
3. **Amostragem de Textura e Duplo Mipmap nos Escudos SVG**:
   - Os escudos SVG originais de 512 px eram reduzidos para o espaço base de 38 px e depois sofriam novo upscaling bilinear pela matriz do nó, causando perda de micro-detalhes.

---

## 3. SOLUÇÃO ARQUITETURAL IMPLEMENTADA

### 3.1. Renderização Nativa 1:1 no Display (`scale = Vector2.ONE`)
- O `ScoreboardView` agora desenha diretamente nas dimensões nativas do display calculadas por `ScoreboardView.calculate_la_liga_layout()`:
  - `_new_scoreboard.scale = Vector2.ONE` (eliminação total de escala na matriz do nó).
  - `_new_scoreboard.la_liga_scale_override = scale_factor`.
  - `_new_scoreboard.size = scaled_sz`.
  - `_new_scoreboard.custom_minimum_size = scaled_sz`.
- **Efeito Imediato**: O TextServer do Godot rasteriza os caracteres das siglas, relógio e números de gols diretamente na resolução final de saída (ex: 37 px para relógio, 36 px para siglas, 52 px para gols em 1920×1080), gerando **acutância e nitidez máximas de cada pixel**.

### 3.2. Tratamento Diferenciado por Elemento
- **Fontes e Tipografia (Pixel Definition)**:
  - Fontes dinâmicas (`FontFile`) configuradas com `antialiasing = FONT_ANTIALIASING_GRAY`, `hinting = HINTING_LIGHT` e `subpixel_positioning = SUBPIXEL_POSITIONING_AUTO`.
  - Alinhamento pixel-perfect: todas as posições em `_draw_auto_text()` e `_draw_clock_tabular()` utilizam `roundf(x)` e `roundf(y)`.
  - Outline dinâmico ajustado à escala nativa (`maxi(1, int(round(2.0 * maxf(1.0, float(font_size) / 24.0))))`).
- **Escudos SVG Oficiais e Logotipos (HD Vetorial)**:
  - Texturas SVG rasterizadas em alta resolução (512 px) com mipmaps de hardware.
  - Amostragem com filtragem `TEXTURE_FILTER_LINEAR_WITH_MIPMAPS` direto para o diâmetro proporcional `roundf(total_h * 0.68)`, garantindo curvas suaves sem serrilhado e sem perda de traços finos.
- **Caixas, Linhas e Divisores**:
  - `rendering/2d/snap/snap_2d_transforms_to_pixel = true` e `rendering/2d/snap/snap_2d_vertices_to_pixel = true` habilitados em `project.godot`.
  - Raio de cantos e filetes arredondados proporcionalmente à altura nativa: `r_radius = maxi(3, int(round(6.0 * scale_k)))`.

### 3.3. Proteção de Reentrância e Estabilidade
- Implementação de guard-flag booleana `_is_centering_marcador` em `ui/hud.gd`, eliminando qualquer risco de recursão ou instabilidade em redimensionamentos dinâmicos contínuos.

---

## 4. MÉTRICAS MATEMÁTICAS DE GANHO DE NITIDEZ

A avaliação quantitativa via recortes 1:1 sem compressão comprovou o ganho:

| Métrica de Imagem | ETAPA 4e.10 (Anterior) | ETAPA 4e.11 (Atual) | Variação / Ganho |
| :--- | :---: | :---: | :---: |
| **Gradiente Médio de Bordas (Acutância)** | 2.597 | **5.279** | **+103.2% de definição** |
| **Desvio Padrão de Contraste (Tipografia)** | 95.82 | **102.54** | **+7.0% maior pureza** |
| **Escala 2D de Matriz do Nó (`scale`)** | 1.594 (Fracionário) | **1.000 (Nativo 1:1)** | **Zero distorção** |
| **Tamanho Rasterizado da Sigla RMA** | 22 px (esticada) | **36 px (nativa)** | **+63.6% de resolução** |
| **Tamanho Rasterizado do Relógio** | 24 px (esticada) | **37 px (nativa)** | **+54.2% de resolução** |
| **Tamanho Rasterizado do Placar de Gols** | 32 px (esticada) | **52 px (nativa)** | **+62.5% de resolução** |

---

## 5. AUDITORIA DAS 8 RESOLUÇÕES OBRIGATÓRIAS

Todas as 8 resoluções foram auditadas e aprovadas pelo runner automatizado `runner_etapa_4e11.tscn`:

| Resolução | Proporção | % Largura Tela | Dimensões Efetivas | Proporção Scoreboard | Desvio Centro | Status |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **1920 × 1080 (Desktop FHD)** | 1.778 | 44.0% | 845.0 × 89.0 px | 9.494:1 | 0.00 px | **APROVADO** |
| **1280 × 720 (Desktop HD)** | 1.778 | 44.0% | 563.0 × 60.0 px | 9.383:1 | 0.00 px | **APROVADO** |
| **936 × 950 (Quase Quadrada)** | 0.985 | 72.3% | 677.0 × 72.0 px | 9.403:1 | 0.00 px | **APROVADO** |
| **806 × 962 (Nova Resolução)** | 0.838 | 80.4% | 648.0 × 68.0 px | 9.529:1 | 0.00 px | **APROVADO** |
| **547 × 956 (Mobile Portrait)** | 0.572 | 87.9% | 481.0 × 51.0 px | 9.431:1 | 0.00 px | **APROVADO** |
| **530 × 965 (Mobile Portrait)** | 0.549 | 87.9% | 466.0 × 49.0 px | 9.510:1 | 0.00 px | **APROVADO** |
| **1080 × 1920 (Mobile Portrait FHD)** | 0.562 | 88.0% | 950.0 × 100.0 px | 9.500:1 | 0.00 px | **APROVADO** |
| **844 × 390 (Mobile Landscape)** | 2.164 | 44.0% | 371.0 × 39.0 px | 9.513:1 | 0.00 px | **APROVADO** |

- **Consistência 547×956 vs 530×965**: Ambas a exatamente 87.9% da tela, sem saltos abruptos.
- **Não-Sobreposição do Botão de Pausa**: 0% de intersecção em todas as 8 resoluções.
- **Centralização Matemática**: Desvio absoluto de 0.00 px em todas as telas.

---

## 6. NÃO-REGRESSÃO E PRESERVAÇÃO INTEGRAL DO JOGO

1. **Campo 3D, Iluminação e Câmera**: 100% inalterados.
2. **Sprites e Animações dos Jogadores**: Arte pixel art e materiais 100% preservados sem filtros indesejados.
3. **Outras Competições (Brasileirão, Premier League, Bundesliga)**:
   - Match HUD 100% funcional e aprovado nos testes.
   - Match Center (SimScreen) 100% funcional e aprovado nos testes.

---

## 7. PAINÉIS DE EVIDÊNCIAS VISUAIS GERADOS

- **Painel 1**: `painel_comparativo_nitidez_hud_4e11.png` — Comparação microscópica 1:1 e zoom 300% de antes vs depois.
- **Painel 2**: `painel_responsividade_8_resolucoes_4e11.png` — Grade completa das 8 resoluções em jogo real.
- **Painel 3**: `painel_regressao_competicoes_hud_4e11.png` — Validação de não-regressão do Brasileirão, Premier League e Bundesliga.
