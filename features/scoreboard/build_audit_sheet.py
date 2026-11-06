import os
from PIL import Image, ImageDraw, ImageFont

def build_audit_sheet():
    base_dir = "/home/pedro/.gemini/antigravity/scratch/football-legacy-godot"
    audit_dir = os.path.join(base_dir, "REFERENCIAS_SCOREBOARD/capturas_teste/auditoria_4d")
    out_dir = os.path.join(base_dir, "REFERENCIAS_SCOREBOARD/capturas_teste")
    artifact_dir = "/home/pedro/.gemini/antigravity/brain/64bc5268-c0ef-4737-8982-931a4917938e"

    resolutions = [
        {"name": "1920x1080", "label": "1920×1080 (Landscape HD Referência)", "w": 1920, "h": 1080, "crop_y": 240},
        {"name": "1280x720", "label": "1280×720 (Landscape 720p)", "w": 1280, "h": 720, "crop_y": 180},
        {"name": "927x873", "label": "927×873 (Janela PC Reportada)", "w": 927, "h": 873, "crop_y": 200},
        {"name": "1080x1920", "label": "1080×1920 (Mobile Portrait)", "w": 1080, "h": 1920, "crop_y": 270}
    ]

    font_title = None
    font_header = None
    font_sub = None
    for fn in ["/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", "/usr/share/fonts/TTF/DejaVuSans-Bold.ttf"]:
        if os.path.exists(fn):
            font_title = ImageFont.truetype(fn, 26)
            font_header = ImageFont.truetype(fn, 18)
            font_sub = ImageFont.truetype(fn, 14)
            break
    if not font_title:
        font_title = ImageFont.load_default()
        font_header = ImageFont.load_default()
        font_sub = ImageFont.load_default()

    col_w = 900
    strip_h = 150
    row_h = 220
    gutter = 30
    top_h = 150

    total_w = gutter + col_w + gutter + col_w + gutter
    total_h = top_h + (len(resolutions) * row_h) + 60

    sheet = Image.new("RGB", (total_w, total_h), (16, 18, 24))
    draw = ImageDraw.Draw(sheet)

    # Header
    draw.rectangle([(0, 0), (total_w, top_h)], fill=(10, 12, 18))
    draw.text((gutter, 20), "AUDITORIA DE RENDERIZAÇÃO: DIVERGÊNCIA LOCAL vs CAPTURA OFICIAL (ETAPA 4d)", fill=(255, 255, 255), font=font_title)
    draw.text((gutter, 58), "Diagnóstico controlado em 4 resoluções (1920×1080, 1280×720, 927×873, 1080×1920) — Real Madrid × Barcelona", fill=(200, 210, 230), font=font_header)
    draw.text((gutter, 90), "CAUSA RAIZ IDENTIFICADA: No fluxo do jogo real, sim_screen.gd:1205 sobrescreve _you_name com _tinta(_you_accent) [CYAN],\nmascarando a tipografia branca sobre o fundo claro do Real Madrid.", fill=(255, 140, 140), font=font_sub)

    c1_x = gutter
    c2_x = c1_x + col_w + gutter
    y_cols = top_h - 26

    draw.text((c1_x, y_cols), "COLUNA A: EXECUÇÃO DO JOGO REAL (sim_screen.gd:1205 sobrescrevendo font_color)", fill=(255, 100, 100), font=font_header)
    draw.text((c2_x, y_cols), "COLUNA B: CAPTURA OFICIAL / CABEÇALHO CORRETO (font_color = Color.WHITE)", fill=(100, 255, 150), font=font_header)

    y_cur = top_h + 20

    for r in resolutions:
        draw.text((c1_x, y_cur), f"▶ Resolução: {r['label']}", fill=(255, 230, 100), font=font_header)
        y_img = y_cur + 26

        # Col A: Real game
        fn_a = os.path.join(audit_dir, f"audit_realgame_{r['name']}.png")
        if os.path.exists(fn_a):
            im_a = Image.open(fn_a)
            crop_a = im_a.crop((0, 0, r["w"], r["crop_y"]))
            crop_a_resized = crop_a.resize((col_w, strip_h), Image.Resampling.LANCZOS)
            sheet.paste(crop_a_resized, (c1_x, y_img))
            draw.rectangle([(c1_x, y_img), (c1_x + col_w, y_img + strip_h)], outline=(180, 60, 60), width=2)
            draw.text((c1_x + 10, y_img + strip_h - 24), "Texto 'REAL MADRID' = Cyan (#4DF7F7) sem contraste sobre branco", fill=(255, 150, 150), font=font_sub)

        # Col B: Forced header (White font)
        fn_b = os.path.join(audit_dir, f"audit_forced_header_{r['name']}.png")
        if os.path.exists(fn_b):
            im_b = Image.open(fn_b)
            crop_b = im_b.crop((0, 0, r["w"], r["crop_y"]))
            crop_b_resized = crop_b.resize((col_w, strip_h), Image.Resampling.LANCZOS)
            sheet.paste(crop_b_resized, (c2_x, y_img))
            draw.rectangle([(c2_x, y_img), (c2_x + col_w, y_img + strip_h)], outline=(50, 180, 80), width=2)
            draw.text((c2_x + 10, y_img + strip_h - 24), "Texto 'REAL MADRID' = Branco (#FFFFFF) com contorno 3px e sombra", fill=(150, 255, 180), font=font_sub)

        y_cur += row_h

    out_file = os.path.join(out_dir, "folha_auditoria_resolucoes_4d.png")
    sheet.save(out_file, "PNG")
    print(f"Salvo em: {out_file}")

    art_file = os.path.join(artifact_dir, "folha_auditoria_resolucoes_4d.png")
    sheet.save(art_file, "PNG")
    print(f"Salvo no artifact em: {art_file}")

if __name__ == "__main__":
    build_audit_sheet()
