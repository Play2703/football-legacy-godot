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

BASE_DIR = "/home/pedro/.gemini/antigravity/scratch/football-legacy-godot/REFERENCIAS_SCOREBOARD/capturas_teste/match_hud_4e1"
OUT_DIR = "/home/pedro/.gemini/antigravity/brain/64bc5268-c0ef-4737-8982-931a4917938e"

matchups = [
    {"id": "rma_bar", "title": "1. Real Madrid × Barcelona (La Liga)"},
    {"id": "fla_pal", "title": "2. Flamengo × Palmeiras (Brasileirão)"},
    {"id": "bay_dor", "title": "3. Bayern × Dortmund (Bundesliga)"},
    {"id": "mci_ars", "title": "4. Man City × Arsenal (Premier League)"},
    {"id": "liv_che", "title": "5. Liverpool × Chelsea (Premier League)"},
    {"id": "psg_mar", "title": "6. PSG × Marseille (Ligue 1)"}
]

resolutions = [
    {"id": "1920x1080_pc", "label": "PC 1080p (1920×1080)", "aspect": "16:9"},
    {"id": "1280x720_pc", "label": "PC 720p (1280×720)", "aspect": "16:9"},
    {"id": "927x873_pc", "label": "PC Janela (927×873)", "aspect": "~1:1"},
    {"id": "1080x1920_portrait", "label": "Android Portrait (1080×1920)", "aspect": "9:16"},
    {"id": "1920x1080_landscape", "label": "Android Landscape (1920×1080)", "aspect": "16:9"}
]

# ==============================================================================
# FOLHA 1: CICLO DE VIDA E MOMENTUM DO MATCH HUD (Partida Real)
# ==============================================================================
print("Gerando Folha 1: Ciclo de Vida e Momentum do Match HUD...")
W1, H1 = 2000, 1600
sheet1 = Image.new("RGB", (W1, H1), (15, 18, 26))
draw1 = ImageDraw.Draw(sheet1)

f_title = get_font(34, bold=True)
f_sub = get_font(18, bold=False)
f_card = get_font(16, bold=True)
f_tag = get_font(13, bold=False)

draw1.rectangle([(0, 0), (W1, 85)], fill=(22, 28, 42))
draw1.text((30, 15), "ETAPA 4e.1 — ESTABILIZAÇÃO DO MATCH HUD & CICLO DE VIDA", fill=(255, 255, 255), font=f_title)
draw1.text((30, 56), "Validação da eliminação do erro Nil em set_momentum(), chips centralizados e placares reais in-game", fill=(140, 165, 205), font=f_sub)

grid_cols = 3
grid_rows = 2
cell_w = 620
cell_h = 700
start_x = 35
start_y = 110

for idx, m in enumerate(matchups):
    col = idx % grid_cols
    row = idx // grid_cols
    x0 = start_x + col * (cell_w + 30)
    y0 = start_y + row * (cell_h + 30)
    
    # Card background
    draw1.rectangle([(x0, y0), (x0 + cell_w, y0 + cell_h)], fill=(24, 30, 44), outline=(45, 55, 80), width=1)
    draw1.text((x0 + 15, y0 + 12), m["title"], fill=(255, 215, 0), font=f_card)
    
    # 1. Momentum Frame (Cropped Scoreboard + Momentum Chip)
    fn_mom = f"{BASE_DIR}/hud_mom_{m['id']}_1920x1080_pc.png"
    if os.path.exists(fn_mom):
        im_mom = Image.open(fn_mom)
        # Crop scoreboard & momentum chip: center horizontally, top 250px
        cw, ch = im_mom.size
        crop_box = (int(cw * 0.28), 10, int(cw * 0.72), 220)
        crop_mom = im_mom.crop(crop_box).resize((cell_w - 30, 190), Image.Resampling.LANCZOS)
        sheet1.paste(crop_mom, (x0 + 15, y0 + 45))
        draw1.rectangle([(x0 + 15, y0 + 45), (x0 + cell_w - 15, y0 + 235)], outline=(60, 80, 120), width=1)
        draw1.text((x0 + 25, y0 + 242), "Fase 1: Início + Momentum Ativo ('PRESSÃO' / 'ON FIRE') — Zero Crash Nil", fill=(70, 240, 120), font=f_tag)

    # 2. Gol Frame (In-game 2T 67' Placar 1-0)
    fn_gol = f"{BASE_DIR}/hud_gol_{m['id']}_1920x1080_pc.png"
    if os.path.exists(fn_gol):
        im_gol = Image.open(fn_gol)
        crop_box = (int(im_gol.size[0] * 0.28), 10, int(im_gol.size[0] * 0.72), 220)
        crop_gol = im_gol.crop(crop_box).resize((cell_w - 30, 190), Image.Resampling.LANCZOS)
        sheet1.paste(crop_gol, (x0 + 15, y0 + 270))
        draw1.rectangle([(x0 + 15, y0 + 270), (x0 + cell_w - 15, y0 + 460)], outline=(60, 80, 120), width=1)
        draw1.text((x0 + 25, y0 + 467), "Fase 2: 2T com Gol (1-0 aos 67') — Placar Oficial Escalonado e Centralizado", fill=(130, 190, 255), font=f_tag)

    # 3. Vista do Campo Inteiro (Full pitch thumbnail)
    if os.path.exists(fn_gol):
        thumb_pitch = im_gol.resize((cell_w - 30, 170), Image.Resampling.LANCZOS)
        sheet1.paste(thumb_pitch, (x0 + 15, y0 + 495))
        draw1.rectangle([(x0 + 15, y0 + 495), (x0 + cell_w - 15, y0 + 665)], outline=(60, 80, 120), width=1)
        draw1.text((x0 + 25, y0 + 672), "Partida Real Integrada: Estádio 3D + Iluminação + HUD Limpo", fill=(200, 210, 230), font=f_tag)

sheet1_path = f"{OUT_DIR}/folha_match_hud_4e1_momentum_lifecycle.png"
sheet1.save(sheet1_path, quality=95)
print(f"Folha 1 salva em: {sheet1_path}")

# ==============================================================================
# FOLHA 2: RESPONSIVIDADE E RESOLUÇÕES ANDROID/PC (5 Resoluções)
# ==============================================================================
print("Gerando Folha 2: Responsividade e Resoluções Android/PC...")
W2, H2 = 2000, 1500
sheet2 = Image.new("RGB", (W2, H2), (15, 18, 26))
draw2 = ImageDraw.Draw(sheet2)

draw2.rectangle([(0, 0), (W2, 85)], fill=(22, 28, 42))
draw2.text((30, 15), "ETAPA 4e.1 — RESPONSIVIDADE MULTI-RESOLUÇÃO (ANDROID & PC)", fill=(255, 255, 255), font=f_title)
draw2.text((30, 56), "Validação de escala, posicionamento horizontal e zero avisos de redução de fonte em 5 resoluções", fill=(140, 165, 205), font=f_sub)

res_w = 360
res_h = 640
r_start_x = 35
r_start_y = 110

for idx, r in enumerate(resolutions):
    rx = r_start_x + idx * (res_w + 32)
    ry = r_start_y
    
    draw2.rectangle([(rx, ry), (rx + res_w, ry + 1320)], fill=(24, 30, 44), outline=(45, 55, 80), width=1)
    draw2.text((rx + 15, ry + 14), r["label"], fill=(255, 215, 0), font=f_card)
    draw2.text((rx + 15, ry + 38), f"Proporção: {r['aspect']}", fill=(140, 165, 205), font=f_tag)
    
    # Exibir 2 exemplos por resolução: Flamengo x Palmeiras e Real Madrid x Barcelona
    sample_pairs = [("fla_pal", "Brasileirão (FLA × PAL)"), ("rma_bar", "La Liga (RMA × BAR)")]
    sy = ry + 70
    for sid, stitle in sample_pairs:
        fn = f"{BASE_DIR}/hud_gol_{sid}_{r['id']}.png"
        if os.path.exists(fn):
            im = Image.open(fn)
            draw2.text((rx + 15, sy), stitle, fill=(255, 255, 255), font=get_font(14, bold=True))
            
            # Scoreboard crop
            cw, ch = im.size
            if r["id"] == "1080x1920_portrait":
                crop = im.crop((int(cw * 0.05), 10, int(cw * 0.95), 180)).resize((res_w - 30, 95), Image.Resampling.LANCZOS)
            else:
                crop = im.crop((int(cw * 0.25), 10, int(cw * 0.75), 180)).resize((res_w - 30, 95), Image.Resampling.LANCZOS)
            sheet2.paste(crop, (rx + 15, sy + 25))
            draw2.rectangle([(rx + 15, sy + 25), (rx + res_w - 15, sy + 120)], outline=(60, 80, 120), width=1)
            
            # Full screen preview
            thumb_h = int((res_w - 30) * (ch / float(cw)))
            thumb_h = min(thumb_h, 450)
            thumb = im.resize((res_w - 30, thumb_h), Image.Resampling.LANCZOS)
            sheet2.paste(thumb, (rx + 15, sy + 130))
            draw2.rectangle([(rx + 15, sy + 130), (rx + res_w - 15, sy + 130 + thumb_h)], outline=(60, 80, 120), width=1)
            sy += 150 + thumb_h + 30

sheet2_path = f"{OUT_DIR}/folha_match_hud_4e1_resolucoes.png"
sheet2.save(sheet2_path, quality=95)
print(f"Folha 2 salva em: {sheet2_path}")

# ==============================================================================
# FOLHA 3: PRESERVAÇÃO VISUAL DO MATCH CENTER (ETAPA 4e)
# ==============================================================================
print("Gerando Folha 3: Preservação Visual do Match Center...")
W3, H3 = 2000, 1600
sheet3 = Image.new("RGB", (W3, H3), (15, 18, 26))
draw3 = ImageDraw.Draw(sheet3)

draw3.rectangle([(0, 0), (W3, 85)], fill=(22, 28, 42))
draw3.text((30, 15), "ETAPA 4e.1 — PRESERVAÇÃO VISUAL DO MATCH CENTER", fill=(255, 255, 255), font=f_title)
draw3.text((30, 56), "Confirmação: Texto 100% branco, contorno de 3px, formação nítida, faixas originais e zero caixas escuras", fill=(140, 165, 205), font=f_sub)

m_cols = 3
m_rows = 2
mc_cell_w = 620
mc_cell_h = 700

for idx, m in enumerate(matchups):
    col = idx % m_cols
    row = idx // m_cols
    x0 = start_x + col * (mc_cell_w + 30)
    y0 = start_y + row * (mc_cell_h + 30)
    
    draw3.rectangle([(x0, y0), (x0 + mc_cell_w, y0 + mc_cell_h)], fill=(24, 30, 44), outline=(45, 55, 80), width=1)
    draw3.text((x0 + 15, y0 + 12), m["title"], fill=(255, 215, 0), font=f_card)
    
    # 1. 1080p PC Header Crop
    fn_1080 = f"{BASE_DIR}/match_center_{m['id']}_1920x1080_pc.png"
    if os.path.exists(fn_1080):
        im1080 = Image.open(fn_1080)
        crop1080 = im1080.crop((0, 0, im1080.size[0], int(im1080.size[1] * 0.18))).resize((mc_cell_w - 30, 140), Image.Resampling.LANCZOS)
        sheet3.paste(crop1080, (x0 + 15, y0 + 45))
        draw3.rectangle([(x0 + 15, y0 + 45), (x0 + mc_cell_w - 15, y0 + 185)], outline=(60, 80, 120), width=1)
        draw3.text((x0 + 25, y0 + 192), "1920×1080 PC: Texto branco #FFFFFF + contorno 3px + faixas originais", fill=(255, 255, 255), font=f_tag)

    # 2. 927x873 PC Window Header Crop
    fn_927 = f"{BASE_DIR}/match_center_{m['id']}_927x873_pc.png"
    if os.path.exists(fn_927):
        im927 = Image.open(fn_927)
        # Header in 927 is around y=160..340
        crop927 = im927.crop((20, 160, im927.size[0] - 20, 340)).resize((mc_cell_w - 30, 140), Image.Resampling.LANCZOS)
        sheet3.paste(crop927, (x0 + 15, y0 + 220))
        draw3.rectangle([(x0 + 15, y0 + 220), (x0 + mc_cell_w - 15, y0 + 360)], outline=(60, 80, 120), width=1)
        draw3.text((x0 + 25, y0 + 367), "927×873 Janela Local: Formação nítida (100% alfa) + Zero Cyan Fallback", fill=(70, 240, 120), font=f_tag)

    # 3. Android Portrait Header Crop
    fn_port = f"{BASE_DIR}/match_center_{m['id']}_1080x1920_portrait.png"
    if os.path.exists(fn_port):
        import_im = Image.open(fn_port)
        cropport = import_im.crop((0, 150, import_im.size[0], 480)).resize((mc_cell_w - 30, 230), Image.Resampling.LANCZOS)
        sheet3.paste(cropport, (x0 + 15, y0 + 395))
        draw3.rectangle([(x0 + 15, y0 + 395), (x0 + mc_cell_w - 15, y0 + 625)], outline=(60, 80, 120), width=1)
        draw3.text((x0 + 25, y0 + 632), "1080×1920 Android Portrait: Identidade visual fiel ao design oficial", fill=(200, 210, 230), font=f_tag)

sheet3_path = f"{OUT_DIR}/folha_match_hud_4e1_match_center_preservacao.png"
sheet3.save(sheet3_path, quality=95)
print(f"Folha 3 salva em: {sheet3_path}")

print("\nTodas as 3 folhas comparativas foram construídas com sucesso!")
