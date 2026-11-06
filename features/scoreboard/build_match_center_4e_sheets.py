import os
from PIL import Image, ImageDraw, ImageFont
import numpy as np

def build_sheets():
    base_dir = "/home/pedro/.gemini/antigravity/scratch/football-legacy-godot"
    d4e_dir = os.path.join(base_dir, "REFERENCIAS_SCOREBOARD/capturas_teste/match_center_4e")
    audit_dir = os.path.join(base_dir, "REFERENCIAS_SCOREBOARD/capturas_teste/auditoria_4d")
    out_dir = os.path.join(base_dir, "REFERENCIAS_SCOREBOARD/capturas_teste")
    artifact_dir = "/home/pedro/.gemini/antigravity/brain/64bc5268-c0ef-4737-8982-931a4917938e"

    font_title = None
    font_header = None
    font_sub = None
    for fn in ["/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", "/usr/share/fonts/TTF/DejaVuSans-Bold.ttf"]:
        if os.path.exists(fn):
            font_title = ImageFont.truetype(fn, 26)
            font_header = ImageFont.truetype(fn, 18)
            font_sub = ImageFont.truetype(fn, 13)
            break
    if not font_title:
        font_title = ImageFont.load_default()
        font_header = ImageFont.load_default()
        font_sub = ImageFont.load_default()

    # 1. VERIFICACAO DE CONTRASTE E PIXELS
    print("=== VERIFICAÇÃO DE PIXELS ETAPA 4e ===")
    matchups = [
        {"id": "rma_x_bar", "title": "Real Madrid × Barcelona"},
        {"id": "fla_x_palm", "title": "Flamengo × Palmeiras"},
        {"id": "bay_x_dor", "title": "Bayern × Borussia Dortmund"},
        {"id": "mci_x_ars", "title": "Manchester City × Arsenal"},
        {"id": "liv_x_che", "title": "Liverpool × Chelsea"},
        {"id": "psg_x_om", "title": "PSG × Olympique de Marseille"}
    ]

    for m in matchups:
        fn_927 = os.path.join(d4e_dir, f"{m['id']}_927x873_pc.png")
        fn_1080 = os.path.join(d4e_dir, f"{m['id']}_1920x1080_pc.png")
        fn_port = os.path.join(d4e_dir, f"{m['id']}_1080x1920_android_portrait.png")

        im_927 = Image.open(fn_927)
        im_1080 = Image.open(fn_1080)
        im_port = Image.open(fn_port)

        arr_927 = np.array(im_927)
        arr_1080 = np.array(im_1080)

        # Contar pixels brancos no topo (nomes e formação)
        white_927 = np.count_nonzero((arr_927[:300, :, 0] > 230) & (arr_927[:300, :, 1] > 230) & (arr_927[:300, :, 2] > 230))
        white_1080 = np.count_nonzero((arr_1080[:300, :, 0] > 230) & (arr_1080[:300, :, 1] > 230) & (arr_1080[:300, :, 2] > 230))

        # Verificar ausência de ciano no Real Madrid (anteriormente > 600 pixels)
        cyan_count = np.count_nonzero((arr_1080[:300, 100:600, 0] < 100) & (arr_1080[:300, 100:600, 1] > 220) & (arr_1080[:300, 100:600, 2] > 220))

        print(f"[{m['title']}] 927x873: {white_927} px brancos | 1080p: {white_1080} px brancos | Ciano residual RMA: {cyan_count}")

    # 2. CONSTRUÇÃO DA FOLHA COMPARATIVA ANTES X DEPOIS E 6 CONFRONTOS
    # Formato da folha:
    # Cabeçalho informativo
    # Painel 1: Real Madrid × Barcelona (Destaque Antes x Depois no PC 927x873 e 1080p)
    # Painel 2: Os 6 confrontos no fluxo real (Colunas: PC Full HD, PC Janela 927x873, Android Portrait)
    
    col1_w = 640
    col2_w = 640
    col3_w = 420
    gutter = 25
    strip_h = 135
    row_h = 185
    top_h = 150

    total_w = gutter + col1_w + gutter + col2_w + gutter + col3_w + gutter
    total_h = top_h + (len(matchups) * row_h) + 60

    sheet = Image.new("RGB", (total_w, total_h), (16, 18, 25))
    draw = ImageDraw.Draw(sheet)

    # Banner topo
    draw.rectangle([(0, 0), (total_w, top_h)], fill=(10, 12, 18))
    draw.text((gutter, 20), "ETAPA 4e — VALIDAÇÃO TÉCNICA DEFINITIVA DO MATCH CENTER (FLUXO REAL DE PARTIDA)", fill=(255, 255, 255), font=font_title)
    draw.text((gutter, 58), "Correção de legibilidade no fluxo real de match.gd: Tipografia em branco puro (Color.WHITE), contorno escuro 3px e sombra 2px.", fill=(200, 215, 235), font=font_header)
    draw.text((gutter, 90), "Formações em branco sólido com contorno 2px (sem dependência de transparência 78%). Faixas originais e escudos mipmapped 100% preservados.", fill=(160, 240, 180), font=font_sub)

    c1_x = gutter
    c2_x = c1_x + col1_w + gutter
    c3_x = c2_x + col2_w + gutter
    y_cols = top_h - 26

    draw.text((c1_x, y_cols), "PC FULL HD (1920×1080 Landscape)", fill=(100, 220, 255), font=font_header)
    draw.text((c2_x, y_cols), "PC JANELA REAL (927×873 — Sem desbotamento)", fill=(100, 255, 160), font=font_header)
    draw.text((c3_x, y_cols), "ANDROID (1080×1920 Portrait)", fill=(255, 220, 100), font=font_header)

    y_cur = top_h + 20

    for m in matchups:
        draw.text((c1_x, y_cur), f"★ {m['title']}", fill=(255, 240, 120), font=font_header)
        y_img = y_cur + 26

        # Col 1: 1920x1080 PC
        fn_1080 = os.path.join(d4e_dir, f"{m['id']}_1920x1080_pc.png")
        if os.path.exists(fn_1080):
            im_1 = Image.open(fn_1080)
            crop_1 = im_1.crop((0, 0, 1920, 240))
            crop_1_res = crop_1.resize((col1_w, strip_h), Image.Resampling.LANCZOS)
            sheet.paste(crop_1_res, (c1_x, y_img))
            draw.rectangle([(c1_x, y_img), (c1_x + col1_w, y_img + strip_h)], outline=(40, 100, 160), width=2)

        # Col 2: 927x873 PC Janela
        fn_927 = os.path.join(d4e_dir, f"{m['id']}_927x873_pc.png")
        if os.path.exists(fn_927):
            im_2 = Image.open(fn_927)
            crop_2 = im_2.crop((0, 0, 927, 200))
            crop_2_res = crop_2.resize((col2_w, strip_h), Image.Resampling.LANCZOS)
            sheet.paste(crop_2_res, (c2_x, y_img))
            draw.rectangle([(c2_x, y_img), (c2_x + col2_w, y_img + strip_h)], outline=(30, 160, 80), width=2)

        # Col 3: 1080x1920 Android Portrait
        fn_port = os.path.join(d4e_dir, f"{m['id']}_1080x1920_android_portrait.png")
        if os.path.exists(fn_port):
            im_3 = Image.open(fn_port)
            crop_3 = im_3.crop((0, 0, 1080, 270))
            crop_3_res = crop_3.resize((col3_w, strip_h), Image.Resampling.LANCZOS)
            sheet.paste(crop_3_res, (c3_x, y_img))
            draw.rectangle([(c3_x, y_img), (c3_x + col3_w, y_img + strip_h)], outline=(180, 140, 40), width=2)

        y_cur += row_h

    out_file = os.path.join(out_dir, "folha_comparativa_match_center_4e.png")
    sheet.save(out_file, "PNG")
    print(f"Folha comparativa 4e salva em: {out_file}")

    art_file = os.path.join(artifact_dir, "folha_comparativa_match_center_4e.png")
    sheet.save(art_file, "PNG")
    print(f"Cópia salva no artifact: {art_file}")

    # 3. FOLHA ANTES X DEPOIS ESPECÍFICA DO REAL MADRID EM 927x873
    sheet_comp = Image.new("RGB", (1600, 600), (16, 18, 25))
    draw_c = ImageDraw.Draw(sheet_comp)
    draw_c.rectangle([(0, 0), (1600, 100)], fill=(10, 12, 18))
    draw_c.text((30, 20), "COMPARATIVO ANTES × DEPOIS: REAL MADRID × BARCELONA NA JANELA PC (927×873)", fill=(255, 255, 255), font=font_title)
    draw_c.text((30, 60), "Fluxo Real de Partida: Eliminação do fallback ciano e restauração da tipografia branca com contorno 3px e formação sólida.", fill=(200, 215, 235), font=font_header)

    fn_before = os.path.join(audit_dir, "audit_realgame_927x873.png")
    fn_after = os.path.join(d4e_dir, "rma_x_bar_927x873_pc.png")

    if os.path.exists(fn_before) and os.path.exists(fn_after):
        im_bef = Image.open(fn_before).crop((0, 0, 927, 240)).resize((730, 360), Image.Resampling.LANCZOS)
        im_aft = Image.open(fn_after).crop((0, 0, 927, 240)).resize((730, 360), Image.Resampling.LANCZOS)

        sheet_comp.paste(im_bef, (50, 160))
        draw_c.rectangle([(50, 160), (780, 520)], outline=(220, 60, 60), width=3)
        draw_c.text((50, 125), "ANTES (sim_screen.gd:1205 sobrescrevendo em Ciano — Ilegível)", fill=(255, 120, 120), font=font_header)

        sheet_comp.paste(im_aft, (820, 160))
        draw_c.rectangle([(820, 160), (1550, 520)], outline=(50, 200, 80), width=3)
        draw_c.text((820, 125), "DEPOIS (ETAPA 4e: Branco Puro + Contorno 3px + Formação Sólida)", fill=(120, 255, 140), font=font_header)

        comp_file = os.path.join(out_dir, "comparativo_antes_depois_match_center_4e.png")
        sheet_comp.save(comp_file, "PNG")
        art_comp_file = os.path.join(artifact_dir, "comparativo_antes_depois_match_center_4e.png")
        sheet_comp.save(art_comp_file, "PNG")
        print(f"Comparativo antes x depois salvo em: {comp_file}")

if __name__ == "__main__":
    build_sheets()
