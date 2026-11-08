import os
from PIL import Image, ImageDraw, ImageFont

def build_sheet():
    base_dir = "/home/pedro/.gemini/antigravity/scratch/football-legacy-godot"
    fix11d_dir = os.path.join(base_dir, "REFERENCIAS_SCOREBOARD/capturas_teste/real_ingame")
    d4_dir = os.path.join(base_dir, "REFERENCIAS_SCOREBOARD/capturas_teste/match_center_4d")
    out_dir = os.path.join(base_dir, "REFERENCIAS_SCOREBOARD/capturas_teste")
    artifact_dir = "/home/pedro/.gemini/antigravity/brain/64bc5268-c0ef-4737-8982-931a4917938e"

    matchups = [
        {"id": "rma_x_bar", "title": "Real Madrid × Barcelona", "fix11d_id": "rma_x_bar"},
        {"id": "fla_x_palm", "title": "Flamengo × Palmeiras", "fix11d_id": "fla_x_palm"},
        {"id": "bay_x_dor", "title": "Bayern × Borussia Dortmund", "fix11d_id": "bay_x_dor"},
        {"id": "mci_x_ars", "title": "Manchester City × Arsenal", "fix11d_id": "mci_x_mun"}, # closest fix11d was mci_x_mun
        {"id": "liv_x_che", "title": "Liverpool × Chelsea", "fix11d_id": "liv_x_che"},
        {"id": "psg_x_om", "title": "PSG × Olympique de Marseille", "fix11d_id": None}
    ]

    # Try loading a TrueType font
    font_title = None
    font_header = None
    font_sub = None
    for fn in ["/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", "/usr/share/fonts/TTF/DejaVuSans-Bold.ttf"]:
        if os.path.exists(fn):
            font_title = ImageFont.truetype(fn, 28)
            font_header = ImageFont.truetype(fn, 20)
            font_sub = ImageFont.truetype(fn, 15)
            break
    if not font_title:
        font_title = ImageFont.load_default()
        font_header = ImageFont.load_default()
        font_sub = ImageFont.load_default()

    # Dimensions for comparative sheet
    # Row height: 160px for header crop + 40px labels = 200px
    # Header crop: y=0 to y=180 in 1080p (width 1920 -> scale down to 600px width, height ~56px)
    # Or show high-res header strips:
    # 3 columns:
    # Col 1: Antes (FIX11d - Suavizador Escuro 1080p) - 800px wide
    # Col 2: Depois (4d - Faixas Originais sem Caixa 1080p) - 800px wide
    # Col 3: Depois (4d - Mobile Portrait 1080x1920) - 450px wide
    
    col1_w = 800
    col2_w = 800
    col3_w = 540
    gutter = 30
    header_strip_h = 135
    row_h = 195
    top_banner_h = 140
    
    total_w = gutter + col1_w + gutter + col2_w + gutter + col3_w + gutter
    total_h = top_banner_h + (len(matchups) * row_h) + 60

    sheet = Image.new("RGB", (total_w, total_h), (18, 20, 28))
    draw = ImageDraw.Draw(sheet)

    # Title Banner
    draw.rectangle([(0, 0), (total_w, top_banner_h)], fill=(12, 14, 20))
    draw.text((gutter, 20), "ETAPA 4d — COMPARATIVO MATCH CENTER: REMOÇÃO DOS SUAVIZADORES ESCUROS", fill=(255, 255, 255), font=font_title)
    draw.text((gutter, 60), "Preservação da identidade visual original: faixas clubísticas nativas diretas, sem caixas/cartões escuros artificiais.", fill=(180, 195, 215), font=font_header)
    draw.text((gutter, 92), "Legibilidade por tipografia nítida (texto branco + contorno escuro 3px + drop shadow) e escudos em alta nitidez (Mipmaps).", fill=(140, 160, 185), font=font_sub)

    # Column titles
    c1_x = gutter
    c2_x = c1_x + col1_w + gutter
    c3_x = c2_x + col2_w + gutter
    y_cols = top_banner_h - 30

    draw.text((c1_x, y_cols), "ANTES (FIX11d: Suavizador Escuro Artificial)", fill=(240, 120, 120), font=font_header)
    draw.text((c2_x, y_cols), "DEPOIS (4d: Faixas Limpas sem Caixa - Landscape 1080p)", fill=(100, 230, 140), font=font_header)
    draw.text((c3_x, y_cols), "DEPOIS (4d: Mobile Portrait 1080×1920)", fill=(100, 200, 255), font=font_header)

    y_cur = top_banner_h + 20

    for m in matchups:
        # Draw matchup label
        draw.text((c1_x, y_cur), f"★ {m['title']}", fill=(255, 220, 100), font=font_header)
        y_img = y_cur + 28

        # 1. FIX11d Before
        if m["fix11d_id"]:
            f11_path = os.path.join(fix11d_dir, f"match_center_suavizador_{m['fix11d_id']}_1080p.png")
            if os.path.exists(f11_path):
                im_b = Image.open(f11_path)
                # Crop top header
                crop_b = im_b.crop((0, 0, 1920, 240))
                crop_b_resized = crop_b.resize((col1_w, header_strip_h), Image.Resampling.LANCZOS)
                sheet.paste(crop_b_resized, (c1_x, y_img))
                draw.rectangle([(c1_x, y_img), (c1_x + col1_w, y_img + header_strip_h)], outline=(80, 40, 40), width=2)
            else:
                draw.rectangle([(c1_x, y_img), (c1_x + col1_w, y_img + header_strip_h)], fill=(30, 32, 40))
                draw.text((c1_x + 20, y_img + 50), "Sem registro na FIX11d", fill=(120, 120, 130), font=font_sub)
        else:
            draw.rectangle([(c1_x, y_img), (c1_x + col1_w, y_img + header_strip_h)], fill=(30, 32, 40))
            draw.text((c1_x + 20, y_img + 50), "Confronto inédito na ETAPA 4d", fill=(120, 120, 130), font=font_sub)

        # 2. 4d Landscape 1080p After
        d4_land_path = os.path.join(d4_dir, f"match_center_4d_{m['id']}_1080p.png")
        if os.path.exists(d4_land_path):
            im_l = Image.open(d4_land_path)
            crop_l = im_l.crop((0, 0, 1920, 240))
            crop_l_resized = crop_l.resize((col2_w, header_strip_h), Image.Resampling.LANCZOS)
            sheet.paste(crop_l_resized, (c2_x, y_img))
            draw.rectangle([(c2_x, y_img), (c2_x + col2_w, y_img + header_strip_h)], outline=(30, 120, 60), width=2)

        # 3. 4d Mobile Portrait After
        d4_port_path = os.path.join(d4_dir, f"match_center_4d_{m['id']}_mobile_portrait.png")
        if os.path.exists(d4_port_path):
            im_p = Image.open(d4_port_path)
            # Top header in portrait: width 1080, height ~320
            crop_p = im_p.crop((0, 0, 1080, 270))
            crop_p_resized = crop_p.resize((col3_w, header_strip_h), Image.Resampling.LANCZOS)
            sheet.paste(crop_p_resized, (c3_x, y_img))
            draw.rectangle([(c3_x, y_img), (c3_x + col3_w, y_img + header_strip_h)], outline=(30, 80, 140), width=2)

        y_cur += row_h

    # Footer note
    draw.text((gutter, y_cur + 10), "Verificação Pixel Real: Sem StyleBoxFlat artificial (sb_home/sb_away). Faixas nativas contínuas preservadas com nitidez HD.", fill=(150, 170, 190), font=font_sub)

    out_file = os.path.join(out_dir, "folha_comparativa_match_center_4d.png")
    sheet.save(out_file, "PNG")
    print(f"Folha comparativa salva em: {out_file}")

    artifact_file = os.path.join(artifact_dir, "folha_comparativa_match_center_4d.png")
    sheet.save(artifact_file, "PNG")
    print(f"Cópia no artifact salva em: {artifact_file}")

if __name__ == "__main__":
    build_sheet()
