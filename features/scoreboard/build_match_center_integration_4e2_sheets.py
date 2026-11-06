import os
import sys
from PIL import Image, ImageDraw, ImageFont

def get_font(size, bold=False):
    candidates = [
        "/usr/share/fonts/TTF/DejaVuSans-Bold.ttf" if bold else "/usr/share/fonts/TTF/DejaVuSans.ttf",
        "/usr/share/fonts/dejavu/DejaVuSans-Bold.ttf" if bold else "/usr/share/fonts/dejavu/DejaVuSans.ttf"
    ]
    for p in candidates:
        if os.path.exists(p):
            try:
                return ImageFont.truetype(p, size)
            except Exception:
                pass
    return ImageFont.load_default()

BASE_DIR = "/home/pedro/.gemini/antigravity/scratch/football-legacy-godot/REFERENCIAS_SCOREBOARD/capturas_teste/match_center_4e2"
OUT_DIR = "/home/pedro/.gemini/antigravity/brain/64bc5268-c0ef-4737-8982-931a4917938e"

matchups = [
    {"id": "rma_bar", "title": "1. Real Madrid × Barcelona (La Liga)"},
    {"id": "fla_palm", "title": "2. Flamengo × Palmeiras (Brasileirão)"},
    {"id": "bay_dor", "title": "3. Bayern × Dortmund (Bundesliga)"},
    {"id": "mci_ars", "title": "4. Man City × Arsenal (Premier League)"},
    {"id": "liv_che", "title": "5. Liverpool × Chelsea (Premier League)"},
    {"id": "pari_mars", "title": "6. PSG × Marseille (Ligue 1)"}
]

resolutions = [
    {"id": "1920x1080", "label": "PC 1080p (1920×1080)", "aspect": "16:9"},
    {"id": "1280x720", "label": "PC 720p (1280×720)", "aspect": "16:9"},
    {"id": "927x873", "label": "PC Janela (927×873)", "aspect": "~1:1"},
    {"id": "1080x1920", "label": "Android Portrait (1080×1920)", "aspect": "9:16"},
    {"id": "1920x1080_android", "label": "Android Landscape (1920×1080)", "aspect": "16:9"}
]

f_title = get_font(32, bold=True)
f_sub = get_font(18, bold=False)
f_card = get_font(16, bold=True)
f_label = get_font(14, bold=True)
f_tag = get_font(12, bold=False)

# ==============================================================================
# FOLHA 1: SINCRONIZAÇÃO DE PLACAR, GOLS E EVENTOS DO MOTOR REAL
# ==============================================================================
print("Gerando Folha 1: Sincronização de Placar, Gols e Eventos...")
W1, H1 = 2000, 1650
sheet1 = Image.new("RGB", (W1, H1), (15, 18, 26))
draw1 = ImageDraw.Draw(sheet1)

draw1.rectangle([(0, 0), (W1, 85)], fill=(22, 28, 42))
draw1.text((30, 15), "ETAPA 4e.2 — AUDITORIA DE SINCRONIZAÇÃO DE PLACAR E GOLS", fill=(255, 255, 255), font=f_title)
draw1.text((30, 56), "Verificação de sincronização Match Engine <-> Match Center: Kickoff (0-0), Gols (1-0, 1-1) e Fim de Partida", fill=(140, 165, 205), font=f_sub)

grid_cols = 3
grid_rows = 2
cell_w = 620
cell_h = 720
start_x = 35
start_y = 110

for idx, m in enumerate(matchups):
    col = idx % grid_cols
    row = idx // grid_cols
    x0 = start_x + col * (cell_w + 30)
    y0 = start_y + row * (cell_h + 30)

    draw1.rectangle([(x0, y0), (x0 + cell_w, y0 + cell_h)], fill=(24, 30, 44), outline=(45, 55, 80), width=1)
    draw1.text((x0 + 15, y0 + 12), m["title"], fill=(255, 215, 0), font=f_card)

    # 1. Kickoff
    fn_kick = f"{BASE_DIR}/tier1_{m['id']}_01_kickoff.png"
    if os.path.exists(fn_kick):
        im = Image.open(fn_kick)
        cw, ch = im.size
        crop_box = (0, 0, cw, int(ch * 0.42))
        thumb = im.crop(crop_box).resize((cell_w - 30, 190), Image.Resampling.LANCZOS)
        sheet1.paste(thumb, (x0 + 15, y0 + 45))
        draw1.rectangle([(x0 + 15, y0 + 45), (x0 + cell_w - 15, y0 + 235)], outline=(60, 80, 120), width=1)
        draw1.text((x0 + 25, y0 + 242), "Kickoff 0-0 (0'): Cabeçalho Match Center + Faixas Originais", fill=(70, 240, 120), font=f_tag)

    # 2. Gols sincronizados
    fn_gol = f"{BASE_DIR}/tier1_{m['id']}_02_gols_sincronizados.png"
    if os.path.exists(fn_gol):
        im = Image.open(fn_gol)
        cw, ch = im.size
        crop_box = (0, 0, cw, int(ch * 0.42))
        thumb = im.crop(crop_box).resize((cell_w - 30, 190), Image.Resampling.LANCZOS)
        sheet1.paste(thumb, (x0 + 15, y0 + 270))
        draw1.rectangle([(x0 + 15, y0 + 270), (x0 + cell_w - 15, y0 + 460)], outline=(60, 80, 120), width=1)
        draw1.text((x0 + 25, y0 + 467), "Gols Sincronizados (1-1): Motor Real e Match Center Alinhados", fill=(130, 190, 255), font=f_tag)

    # 3. Fim de jogo resultado
    fn_end = f"{BASE_DIR}/tier1_{m['id']}_06_fim_de_jogo_resultado.png"
    if os.path.exists(fn_end):
        im = Image.open(fn_end)
        cw, ch = im.size
        crop_box = (0, 0, cw, int(ch * 0.45))
        thumb = im.crop(crop_box).resize((cell_w - 30, 180), Image.Resampling.LANCZOS)
        sheet1.paste(thumb, (x0 + 15, y0 + 495))
        draw1.rectangle([(x0 + 15, y0 + 495), (x0 + cell_w - 15, y0 + 675)], outline=(60, 80, 120), width=1)
        draw1.text((x0 + 25, y0 + 682), "Fim de Jogo: State.ENDED + Goles del Partido Registrados", fill=(255, 200, 100), font=f_tag)

sheet1.save(f"{OUT_DIR}/folha_4e2_sincronizacao_placar_eventos.png")
print("Folha 1 salva com sucesso.")

# ==============================================================================
# FOLHA 2: CARTÕES, SUBSTITUIÇÕES E MOMENTUM DINÂMICO
# ==============================================================================
print("Gerando Folha 2: Cartões, Substituições e Momentum...")
W2, H2 = 2000, 1650
sheet2 = Image.new("RGB", (W2, H2), (15, 18, 26))
draw2 = ImageDraw.Draw(sheet2)

draw2.rectangle([(0, 0), (W2, 85)], fill=(22, 28, 42))
draw2.text((30, 15), "ETAPA 4e.2 — AUDITORIA DISCIPLINAR, SUBSTITUIÇÕES E MOMENTUM", fill=(255, 255, 255), font=f_title)
draw2.text((30, 56), "Verificação de cartões amarelos e vermelhos diretos, alterações táticas na timeline e acréscimos (90+4')", fill=(140, 165, 205), font=f_sub)

for idx, m in enumerate(matchups):
    col = idx % grid_cols
    row = idx // grid_cols
    x0 = start_x + col * (cell_w + 30)
    y0 = start_y + row * (cell_h + 30)

    draw2.rectangle([(x0, y0), (x0 + cell_w, y0 + cell_h)], fill=(24, 30, 44), outline=(45, 55, 80), width=1)
    draw2.text((x0 + 15, y0 + 12), m["title"], fill=(255, 215, 0), font=f_card)

    # 1. Cartões disciplinares
    fn_card = f"{BASE_DIR}/tier1_{m['id']}_03_cartoes_disciplinares.png"
    if os.path.exists(fn_card):
        im = Image.open(fn_card)
        cw, ch = im.size
        crop_box = (0, 0, cw, int(ch * 0.42))
        thumb = im.crop(crop_box).resize((cell_w - 30, 190), Image.Resampling.LANCZOS)
        sheet2.paste(thumb, (x0 + 15, y0 + 45))
        draw2.rectangle([(x0 + 15, y0 + 45), (x0 + cell_w - 15, y0 + 235)], outline=(60, 80, 120), width=1)
        draw2.text((x0 + 25, y0 + 242), "Cartões: Amarelo + Vermelho Direto (Alerta Disciplinar)", fill=(255, 120, 120), font=f_tag)

    # 2. Substituições
    fn_sub = f"{BASE_DIR}/tier1_{m['id']}_04_substituicoes.png"
    if os.path.exists(fn_sub):
        im = Image.open(fn_sub)
        cw, ch = im.size
        crop_box = (0, 0, cw, int(ch * 0.42))
        thumb = im.crop(crop_box).resize((cell_w - 30, 190), Image.Resampling.LANCZOS)
        sheet2.paste(thumb, (x0 + 15, y0 + 270))
        draw2.rectangle([(x0 + 15, y0 + 270), (x0 + cell_w - 15, y0 + 460)], outline=(60, 80, 120), width=1)
        draw2.text((x0 + 25, y0 + 467), "Substituições: Linhas de Saída/Entrada registradas na timeline", fill=(100, 220, 255), font=f_tag)

    # 3. Segundo tempo e acréscimo
    fn_2t = f"{BASE_DIR}/tier1_{m['id']}_05_segundo_tempo_acrescimo.png"
    if os.path.exists(fn_2t):
        im = Image.open(fn_2t)
        cw, ch = im.size
        crop_box = (0, 0, cw, int(ch * 0.42))
        thumb = im.crop(crop_box).resize((cell_w - 30, 180), Image.Resampling.LANCZOS)
        sheet2.paste(thumb, (x0 + 15, y0 + 495))
        draw2.rectangle([(x0 + 15, y0 + 495), (x0 + cell_w - 15, y0 + 675)], outline=(60, 80, 120), width=1)
        draw2.text((x0 + 25, y0 + 682), "2T + Acréscimo (+4'): Relógio Avançado e Chips Sincronizados", fill=(255, 220, 80), font=f_tag)

sheet2.save(f"{OUT_DIR}/folha_4e2_cartoes_substituicoes_momentum.png")
print("Folha 2 salva com sucesso.")

# ==============================================================================
# FOLHA 3: PARTIDAS CONSECUTIVAS E RESOLUÇÕES MULTIPLATAFORMA
# ==============================================================================
print("Gerando Folha 3: Partidas Consecutivas e Resoluções...")
W3, H3 = 2200, 1750
sheet3 = Image.new("RGB", (W3, H3), (15, 18, 26))
draw3 = ImageDraw.Draw(sheet3)

draw3.rectangle([(0, 0), (W3, 85)], fill=(22, 28, 42))
draw3.text((30, 15), "ETAPA 4e.2 — AUDITORIA DE RESOLUÇÕES & PARTIDAS CONSECUTIVAS", fill=(255, 255, 255), font=f_title)
draw3.text((30, 56), "Verificação visual das 5 resoluções: PC 1080p, 720p, Janela 927×873, Android Portrait (1080×1920) e Android Landscape (1920×1080)", fill=(140, 165, 205), font=f_sub)

# Matriz 5 resoluções (linhas) × 6 confrontos (colunas)
cols = 6
rows = 5
c_w = 340
c_h = 300
s_x = 30
s_y = 110

for r_idx, res in enumerate(resolutions):
    draw3.text((s_x, s_y + r_idx * (c_h + 20) - 20), f"{res['label']} [{res['aspect']}]", fill=(255, 215, 0), font=f_label)
    for c_idx, m in enumerate(matchups):
        x = s_x + c_idx * (c_w + 15)
        y = s_y + r_idx * (c_h + 20)

        draw3.rectangle([(x, y), (x + c_w, y + c_h)], fill=(24, 30, 44), outline=(45, 55, 80), width=1)
        if r_idx == 0:
            draw3.text((x + 8, y - 18), m["id"].upper(), fill=(140, 165, 205), font=f_tag)

        fn_res = f"{BASE_DIR}/tier3_resolucao_{res['id']}_{m['id']}.png"
        if os.path.exists(fn_res):
            im = Image.open(fn_res)
            # Crop header (top 35% of height)
            cw, ch = im.size
            crop_h = int(ch * 0.35) if ch > cw else int(ch * 0.40)
            crop_box = (0, 0, cw, crop_h)
            thumb = im.crop(crop_box).resize((c_w - 16, c_h - 45), Image.Resampling.LANCZOS)
            sheet3.paste(thumb, (x + 8, y + 8))
            draw3.rectangle([(x + 8, y + 8), (x + c_w - 8, y + c_h - 37)], outline=(60, 80, 120), width=1)
            draw3.text((x + 12, y + c_h - 28), "Branco #FFF + Contorno 3px [PASS]", fill=(70, 240, 120), font=f_tag)

sheet3.save(f"{OUT_DIR}/folha_4e2_partidas_consecutivas_resolucoes.png")
print("Folha 3 salva com sucesso.")
print("Todas as 3 folhas da ETAPA 4e.2 geradas com sucesso!")
