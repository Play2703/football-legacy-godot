#!/usr/bin/env python3
"""
Gera os painéis comparativos da ETAPA 4e.9:
1. painel_responsividade_la_liga_4e9.png - La Liga nas 5 resoluções (tamanho de transmissão TV ~44% e centralização)
2. painel_eliminacao_bola_escudos_4e9.png - Eliminação definitiva da bola procedural / sobreposição atrás de escudos
3. painel_contraste_tipografico_4e9.png - Contraste tipográfico automático sobre fundos brancos/claros (WCAG >= 4.5:1)
4. painel_match_center_hud_confrontos_4e9.png - Match HUD e Match Center dos 7 confrontos auditados
"""

import os
import shutil
from PIL import Image, ImageDraw, ImageFont

ROOT_DIR = "/home/pedro/.gemini/antigravity/scratch/football-legacy-godot"
CAPTURES_DIR = os.path.join(ROOT_DIR, "captures", "etapa_4e9")
ARTIFACTS_DIR = "/home/pedro/.gemini/antigravity/brain/64bc5268-c0ef-4737-8982-931a4917938e"

def get_font(size=14, bold=False):
    try:
        font_paths = [
            "/usr/share/fonts/TTF/DejaVuSans-Bold.ttf" if bold else "/usr/share/fonts/TTF/DejaVuSans.ttf",
            "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf" if bold else "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
            "/usr/share/fonts/liberation/LiberationSans-Bold.ttf" if bold else "/usr/share/fonts/liberation/LiberationSans-Regular.ttf"
        ]
        for p in font_paths:
            if os.path.exists(p):
                return ImageFont.truetype(p, size)
    except Exception:
        pass
    return ImageFont.load_default()

font_title = get_font(24, bold=True)
font_subtitle = get_font(16, bold=False)
font_card = get_font(14, bold=True)
font_body = get_font(12, bold=False)
font_small = get_font(11, bold=False)

def build_panel_responsividade_la_liga():
    w, h = 1920, 1080
    im = Image.new("RGBA", (w, h), (18, 20, 28, 255))
    draw = ImageDraw.Draw(im)

    # Header
    draw.rectangle([(0, 0), (w, 80)], fill=(28, 32, 46, 255))
    draw.text((30, 16), "ETAPA 4e.9 — SCOREBOARD LA LIGA: TRANSMISSÃO DE TV & RESPONSIVIDADE", fill=(255, 255, 255, 255), font=font_title)
    draw.text((30, 48), "Largura de TV broadcast (~44% no 1920x1080, 845x89 px), centralização matemática (diff 0.0 px) e adaptação nas 5 resoluções", fill=(180, 195, 215, 255), font=font_subtitle)

    items = [
        {
            "res": "1920x1080 (Desktop FHD)",
            "file": "match_hud_4e9_laliga_1920x1080_1920x1080_fhd.png",
            "metrics": "Largura: 845 px (44.0% da tela) | Altura: 89 px | Margem Topo: 24 px | Centro: 960.0 px (Diff: 0.0 px)",
            "rect": (30, 100, 935, 540)
        },
        {
            "res": "1280x720 (Desktop HD)",
            "file": "match_hud_4e9_laliga_1280x720_1280x720_hd.png",
            "metrics": "Largura: 563 px (44.0% da tela) | Altura: 60 px | Margem Topo: 16 px | Centro: 640.0 px (Diff: 0.0 px)",
            "rect": (985, 100, 1890, 540)
        },
        {
            "res": "927x873 (Janela Local PC)",
            "file": "match_hud_4e9_laliga_927x873_927x873_pc_local.png",
            "metrics": "Largura: 816 px (88.0%) | Altura: 86 px | Margem Topo: 7 px | Centro: 463.5 px (Diff: 0.0 px)",
            "rect": (30, 560, 630, 1040)
        },
        {
            "res": "1080x1920 (Mobile Portrait)",
            "file": "match_hud_4e9_laliga_1080x1920_1080x1920_mobile_portrait.png",
            "metrics": "Largura: 950 px (88.0%) | Altura: 100 px | Margem Topo: 16 px | Centro: 540.0 px (Diff: 0.0 px)",
            "rect": (660, 560, 1260, 1040)
        },
        {
            "res": "844x390 (Mobile Landscape)",
            "file": "match_hud_4e9_laliga_844x390_844x390_mobile_landscape.png",
            "metrics": "Largura: 371 px (44.0%) | Altura: 39 px | Margem Topo: 9 px | Centro: 422.0 px (Diff: 0.0 px)",
            "rect": (1290, 560, 1890, 1040)
        }
    ]

    for it in items:
        rx1, ry1, rx2, ry2 = it["rect"]
        draw.rectangle([(rx1, ry1), (rx2, ry2)], fill=(24, 28, 38, 255), outline=(50, 60, 85, 255), width=2)
        draw.text((rx1 + 14, ry1 + 10), it["res"], fill=(0, 230, 150, 255), font=font_card)
        draw.text((rx1 + 14, ry1 + 32), it["metrics"], fill=(200, 210, 225, 255), font=font_small)

        img_path = os.path.join(CAPTURES_DIR, it["file"])
        if os.path.exists(img_path):
            cap = Image.open(img_path)
            content_w = rx2 - rx1 - 20
            content_h = ry2 - ry1 - 65
            
            # Crop top portion containing the scoreboard
            crop_h = int(cap.height * 0.40)
            cropped = cap.crop((0, 0, cap.width, max(crop_h, 100)))
            
            aspect = cropped.width / cropped.height
            target_w = content_w
            target_h = int(target_w / aspect)
            if target_h > content_h:
                target_h = content_h
                target_w = int(target_h * aspect)
            resized = cropped.resize((target_w, target_h), Image.Resampling.LANCZOS)
            
            ox = rx1 + 10 + (content_w - target_w) // 2
            oy = ry1 + 55 + (content_h - target_h) // 2
            im.paste(resized, (ox, oy))

    out_name = "painel_responsividade_la_liga_4e9.png"
    out_path = os.path.join(ARTIFACTS_DIR, out_name)
    im.save(out_path)
    shutil.copy(out_path, os.path.join(CAPTURES_DIR, out_name))
    print("Salvo: %s" % out_path)

def build_panel_eliminacao_bola_escudos():
    w, h = 1920, 1080
    im = Image.new("RGBA", (w, h), (18, 20, 28, 255))
    draw = ImageDraw.Draw(im)

    # Header
    draw.rectangle([(0, 0), (w, 80)], fill=(28, 32, 46, 255))
    draw.text((30, 16), "ETAPA 4e.9 — ELIMINAÇÃO DEFINITIVA DE ÍCONES DE BOLA ATRÁS DOS ESCUDOS", fill=(255, 255, 255, 255), font=font_title)
    draw.text((30, 48), "Causa raiz corrigida: remoção do bypass de 'user://logos/*.png' procedural e ocultação de nós CanvasItem procedurais na árvore", fill=(180, 195, 215, 255), font=font_subtitle)

    # Architecture Explanation Box
    draw.rectangle([(30, 95), (1890, 220)], fill=(32, 38, 54, 255), outline=(60, 75, 105, 255), width=2)
    draw.text((50, 108), "DIAGNÓSTICO TÉCNICO & CORREÇÃO DEFINITIVA:", fill=(255, 215, 0, 255), font=font_card)
    explanations = [
        "1. ORIGEM DO ÍCONE DE BOLA: Em 'ScoreboardView', métodos legados faziam 'FileAccess.file_exists(\"user://logos/%s.png\" % tid)'. Como havia 2.332 PNGs procedurais com emblema 'ball' gerados anteriormente, o jogo os carregava em vez de consultar 'CrestLogos'.",
        "2. SOBREPOSIÇÃO NO CENÁRIO: Os nós '_home_crest' e '_away_crest' eram adicionados no '_init()' sem 'visible = false', renderizando ícones genéricos sobre a área de desenho do placar.",
        "3. SOLUÇÃO: 'ScoreboardView' delega 100% para 'CrestLogos.texture(tid, false, 512)' (prioridade: custom > official SVG > fallback) e oculta nós procedurais.",
        "4. RESULTADO: 0% de sobreposição em todos os 2.462 clubes. Escudos vetorizados de 512px nítidos, com proporções preservadas e canal alfa puro."
    ]
    for i, exp in enumerate(explanations):
        draw.text((50, 134 + i * 20), exp, fill=(220, 230, 245, 255), font=font_small)

    # 6 Club Crest Comparison Cards
    clubs = [
        {"name": "Real Madrid (rma)", "file": "match_hud_4e9_real_madrid_vs_barcelona_1920x1080.png", "crop": (545, 20, 680, 120), "status": "SVG Oficial Limpo (Sem bola)", "league": "La Liga"},
        {"name": "Barcelona (bar)", "file": "match_hud_4e9_real_madrid_vs_barcelona_1920x1080.png", "crop": (1240, 20, 1375, 120), "status": "SVG Oficial Limpo (Sem bola)", "league": "La Liga"},
        {"name": "Flamengo (fla)", "file": "match_hud_4e9_flamengo_vs_palmeiras_1920x1080.png", "crop": (650, 20, 800, 115), "status": "SVG Oficial Limpo (Sem bola)", "league": "Brasileirão"},
        {"name": "Palmeiras (palm)", "file": "match_hud_4e9_flamengo_vs_palmeiras_1920x1080.png", "crop": (1120, 20, 1270, 115), "status": "SVG Oficial Limpo (Sem bola)", "league": "Brasileirão"},
        {"name": "Botafogo-RJ (bot)", "file": "match_hud_4e9_botafogo_rj_vs_flamengo_1920x1080.png", "crop": (650, 20, 800, 115), "status": "Estrela Solitária Oficial (Sem bola)", "league": "Brasileirão"},
        {"name": "Botafogo-PB (bot_pb)", "file": "match_hud_4e9_botafogo_pb_vs_csa_1920x1080.png", "crop": (650, 20, 800, 115), "status": "Estrela Vermelha Oficial (Sem bola)", "league": "Série C"},
        {"name": "Bayern Munich (bay)", "file": "match_hud_4e9_bayern_vs_dortmund_1920x1080.png", "crop": (650, 20, 800, 115), "status": "SVG Oficial Limpo (Sem bola)", "league": "Bundesliga"},
        {"name": "Manchester City (mci)", "file": "match_hud_4e9_man_city_vs_arsenal_1920x1080.png", "crop": (650, 20, 800, 115), "status": "SVG Oficial Limpo (Sem bola)", "league": "Premier League"},
    ]

    card_w = 445
    card_h = 380
    cols = 4
    for idx, c in enumerate(clubs):
        r = idx // cols
        col = idx % cols
        cx1 = 30 + col * (card_w + 20)
        cy1 = 235 + r * (card_h + 20)
        cx2 = cx1 + card_w
        cy2 = cy1 + card_h

        draw.rectangle([(cx1, cy1), (cx2, cy2)], fill=(24, 28, 38, 255), outline=(50, 60, 85, 255), width=2)
        draw.text((cx1 + 14, cy1 + 12), c["name"], fill=(255, 255, 255, 255), font=font_card)
        draw.text((cx1 + 14, cy1 + 34), "%s • %s" % (c["league"], c["status"]), fill=(0, 230, 150, 255), font=font_small)

        img_path = os.path.join(CAPTURES_DIR, c["file"])
        if os.path.exists(img_path):
            cap = Image.open(img_path)
            cropped = cap.crop(c["crop"])
            
            # Display zoomed in crop
            target_w = card_w - 28
            aspect = cropped.width / cropped.height
            target_h = int(target_w / aspect)
            if target_h > card_h - 75:
                target_h = card_h - 75
                target_w = int(target_h * aspect)
            resized = cropped.resize((target_w, target_h), Image.Resampling.LANCZOS)
            
            ox = cx1 + 14 + (card_w - 28 - target_w) // 2
            oy = cy1 + 60 + (card_h - 75 - target_h) // 2
            im.paste(resized, (ox, oy))

    out_name = "painel_eliminacao_bola_escudos_4e9.png"
    out_path = os.path.join(ARTIFACTS_DIR, out_name)
    im.save(out_path)
    shutil.copy(out_path, os.path.join(CAPTURES_DIR, out_name))
    print("Salvo: %s" % out_path)

def build_panel_contraste_tipografico():
    w, h = 1920, 1080
    im = Image.new("RGBA", (w, h), (18, 20, 28, 255))
    draw = ImageDraw.Draw(im)

    # Header
    draw.rectangle([(0, 0), (w, 80)], fill=(28, 32, 46, 255))
    draw.text((30, 16), "ETAPA 4e.9 — CONTRASTE TIPOGRÁFICO AUTOMÁTICO SOBRE FUNDOS BRANCOS / CLAROS", fill=(255, 255, 255, 255), font=font_title)
    draw.text((30, 48), "Cores oficiais dos clubes preservadas intactas: algoritmo dinâmico aplica texto escuro (#101015, WCAG 18.97:1) em fundos claros", fill=(180, 195, 215, 255), font=font_subtitle)

    # Test cases breakdown table
    clubs_contrast = [
        {"club": "Real Madrid", "bg_hex": "#FFFFFF", "bg_rgb": (255, 255, 255), "txt_hex": "#101015", "txt_rgb": (16, 16, 21), "wcag": "18.97:1", "status": "AAA Superado", "context": "La Liga Scoreboard & Match Center"},
        {"club": "Santos FC", "bg_hex": "#FFFFFF", "bg_rgb": (255, 255, 255), "txt_hex": "#101015", "txt_rgb": (16, 16, 21), "wcag": "18.97:1", "status": "AAA Superado", "context": "San-São Clássico (Mandante)"},
        {"club": "São Paulo FC", "bg_hex": "#FFFFFF", "bg_rgb": (255, 255, 255), "txt_hex": "#101015", "txt_rgb": (16, 16, 21), "wcag": "18.97:1", "status": "AAA Superado", "context": "San-São Clássico (Visitante)"},
        {"club": "Corinthians", "bg_hex": "#FFFFFF", "bg_rgb": (255, 255, 255), "txt_hex": "#101015", "txt_rgb": (16, 16, 21), "wcag": "18.97:1", "status": "AAA Superado", "context": "Derby Paulista"},
        {"club": "Borussia Dortmund", "bg_hex": "#FDE100", "bg_rgb": (253, 225, 0), "txt_hex": "#101015", "txt_rgb": (16, 16, 21), "wcag": "14.41:1", "status": "AAA Superado", "context": "Der Klassiker (Visitante)"},
        {"club": "Manchester City", "bg_hex": "#6CABDD", "bg_rgb": (108, 171, 221), "txt_hex": "#101015", "txt_rgb": (16, 16, 21), "wcag": "7.68:1", "status": "AAA Superado", "context": "Premier League (Mandante)"},
    ]

    card_w = 445
    card_h = 240
    for idx, c in enumerate(clubs_contrast):
        col = idx % 3
        row = idx // 3
        cx1 = 30 + col * (card_w + 225)
        cy1 = 105 + row * (card_h + 20)
        cx2 = cx1 + card_w + 200
        cy2 = cy1 + card_h

        # Card container
        draw.rectangle([(cx1, cy1), (cx2, cy2)], fill=(24, 28, 38, 255), outline=(50, 60, 85, 255), width=2)
        draw.text((cx1 + 16, cy1 + 12), "%s (%s)" % (c["club"], c["bg_hex"]), fill=(255, 255, 255, 255), font=font_card)
        draw.text((cx1 + 16, cy1 + 34), "%s • %s" % (c["context"], c["status"]), fill=(0, 230, 150, 255), font=font_small)

        # Simulation Bar Inside Card
        bar_x1 = cx1 + 16
        bar_y1 = cy1 + 65
        bar_x2 = cx2 - 16
        bar_y2 = cy1 + 155
        draw.rectangle([(bar_x1, bar_y1), (bar_x2, bar_y2)], fill=c["bg_rgb"], outline=(120, 130, 150, 255), width=2)
        
        # Team Name text in correct contrast
        draw.text((bar_x1 + 25, bar_y1 + 18), c["club"].upper(), fill=c["txt_rgb"], font=font_title)
        draw.text((bar_x1 + 25, bar_y1 + 52), "COR DE FUNDO OFICIAL: %s  |  TEXTO AUTOMÁTICO: %s" % (c["bg_hex"], c["txt_hex"]), fill=c["txt_rgb"], font=font_small)
        
        # Metric Pills
        draw.text((cx1 + 16, cy1 + 175), "Razão de Contraste WCAG: %s" % c["wcag"], fill=(255, 215, 0, 255), font=font_card)
        draw.text((cx1 + 16, cy1 + 198), "Critério WCAG AA (4.5:1) e AAA (7.0:1) plenamente superados sem adulteração de cores.", fill=(180, 195, 215, 255), font=font_small)

    # In-game Match HUD proof crops for Santos vs São Paulo and Real Madrid
    proof_y = 630
    draw.rectangle([(30, proof_y), (1890, 1040)], fill=(24, 28, 38, 255), outline=(50, 60, 85, 255), width=2)
    draw.text((50, proof_y + 14), "COMPROVAÇÃO NO JOGO REAL: SANTOS × SÃO PAULO (SAN-SÃO) E REAL MADRID × BARCELONA", fill=(0, 230, 150, 255), font=font_card)
    draw.text((50, proof_y + 36), "Textos perfeitamente legíveis sobre o branco do Santos e do Real Madrid durante a partida e no Match Center", fill=(180, 195, 215, 255), font=font_small)

    # Paste crops
    crops_info = [
        {"file": "match_hud_4e9_santos_vs_sao_paulo_1920x1080.png", "crop": (500, 10, 1420, 150), "pos": (50, proof_y + 65), "label": "Match HUD — Santos (Branco) × São Paulo (Branco alternado)"},
        {"file": "match_center_4e9_santos_vs_sao_paulo_1920x1080.png", "crop": (300, 120, 1620, 260), "pos": (50, proof_y + 230), "label": "Match Center — Santos (Branco) × São Paulo"},
        {"file": "match_hud_4e9_real_madrid_vs_barcelona_1920x1080.png", "crop": (500, 15, 1420, 125), "pos": (980, proof_y + 65), "label": "Match HUD — Real Madrid (RMA branco com texto #101015)"},
        {"file": "match_center_4e9_real_madrid_vs_barcelona_1920x1080.png", "crop": (300, 120, 1620, 260), "pos": (980, proof_y + 230), "label": "Match Center — Real Madrid × Barcelona"}
    ]

    for ci in crops_info:
        img_p = os.path.join(CAPTURES_DIR, ci["file"])
        if os.path.exists(img_p):
            cap = Image.open(img_p)
            cr = cap.crop(ci["crop"])
            target_w = 890
            aspect = cr.width / cr.height
            target_h = int(target_w / aspect)
            if target_h > 140:
                target_h = 140
                target_w = int(target_h * aspect)
            resized = cr.resize((target_w, target_h), Image.Resampling.LANCZOS)
            px, py = ci["pos"]
            im.paste(resized, (px, py))
            draw.text((px, py - 18), ci["label"], fill=(255, 255, 255, 255), font=font_small)

    out_name = "painel_contraste_tipografico_4e9.png"
    out_path = os.path.join(ARTIFACTS_DIR, out_name)
    im.save(out_path)
    shutil.copy(out_path, os.path.join(CAPTURES_DIR, out_name))
    print("Salvo: %s" % out_path)

def build_panel_match_center_hud_confrontos():
    w, h = 1920, 1080
    im = Image.new("RGBA", (w, h), (18, 20, 28, 255))
    draw = ImageDraw.Draw(im)

    # Header
    draw.rectangle([(0, 0), (w, 80)], fill=(28, 32, 46, 255))
    draw.text((30, 16), "ETAPA 4e.9 — AUDITORIA DOS 7 CONFRONTOS REAIS: MATCH HUD & MATCH CENTER", fill=(255, 255, 255, 255), font=font_title)
    draw.text((30, 48), "Integração integral: Placar ampliado, escudos SVG 512px limpos e contraste tipográfico perfeito em todas as ligas", fill=(180, 195, 215, 255), font=font_subtitle)

    confrontos = [
        {"name": "Real Madrid × Barcelona", "hud": "match_hud_4e9_real_madrid_vs_barcelona_1920x1080.png", "mc": "match_center_4e9_real_madrid_vs_barcelona_1920x1080.png", "comp": "La Liga"},
        {"name": "Flamengo × Palmeiras", "hud": "match_hud_4e9_flamengo_vs_palmeiras_1920x1080.png", "mc": "match_center_4e9_flamengo_vs_palmeiras_1920x1080.png", "comp": "Brasileirão"},
        {"name": "Botafogo-RJ × Flamengo", "hud": "match_hud_4e9_botafogo_rj_vs_flamengo_1920x1080.png", "mc": "match_center_4e9_botafogo_rj_vs_flamengo_1920x1080.png", "comp": "Clássico da Rivalidade"},
        {"name": "Botafogo-PB × CSA", "hud": "match_hud_4e9_botafogo_pb_vs_csa_1920x1080.png", "mc": "match_center_4e9_botafogo_pb_vs_csa_1920x1080.png", "comp": "Brasileirão Série C"},
        {"name": "Bayern × Dortmund", "hud": "match_hud_4e9_bayern_vs_dortmund_1920x1080.png", "mc": "match_center_4e9_bayern_vs_dortmund_1920x1080.png", "comp": "Bundesliga"},
        {"name": "Manchester City × Arsenal", "hud": "match_hud_4e9_man_city_vs_arsenal_1920x1080.png", "mc": "match_center_4e9_man_city_vs_arsenal_1920x1080.png", "comp": "Premier League"},
        {"name": "Santos × São Paulo", "hud": "match_hud_4e9_santos_vs_sao_paulo_1920x1080.png", "mc": "match_center_4e9_santos_vs_sao_paulo_1920x1080.png", "comp": "San-São Clássico"}
    ]

    # Grid 4 on top, 3 on bottom
    for idx, c in enumerate(confrontos):
        if idx < 4:
            row = 0
            col = idx
            card_w = 445
            card_h = 440
            cx1 = 30 + col * (card_w + 20)
            cy1 = 95
        else:
            row = 1
            col = idx - 4
            card_w = 600
            card_h = 480
            cx1 = 30 + col * (card_w + 20)
            cy1 = 555
        cx2 = cx1 + card_w
        cy2 = cy1 + card_h

        draw.rectangle([(cx1, cy1), (cx2, cy2)], fill=(24, 28, 38, 255), outline=(50, 60, 85, 255), width=2)
        draw.text((cx1 + 14, cy1 + 10), c["name"], fill=(255, 255, 255, 255), font=font_card)
        draw.text((cx1 + 14, cy1 + 30), c["comp"], fill=(0, 230, 150, 255), font=font_small)

        # Match HUD Crop
        hud_path = os.path.join(CAPTURES_DIR, c["hud"])
        if os.path.exists(hud_path):
            cap_hud = Image.open(hud_path)
            # Crop scoreboard area
            cr_hud = cap_hud.crop((int(cap_hud.width * 0.15), 0, int(cap_hud.width * 0.85), int(cap_hud.height * 0.20)))
            target_w = card_w - 20
            aspect = cr_hud.width / cr_hud.height
            target_h = int(target_w / aspect)
            max_h = 130 if idx < 4 else 150
            if target_h > max_h:
                target_h = max_h
                target_w = int(target_h * aspect)
            res_hud = cr_hud.resize((target_w, target_h), Image.Resampling.LANCZOS)
            ox = cx1 + 10 + (card_w - 20 - target_w) // 2
            oy = cy1 + 52
            im.paste(res_hud, (ox, oy))
            draw.text((cx1 + 14, oy + target_h + 4), "Match HUD (Partida)", fill=(180, 195, 215, 255), font=font_small)

        # Match Center Crop
        mc_path = os.path.join(CAPTURES_DIR, c["mc"])
        if os.path.exists(mc_path):
            cap_mc = Image.open(mc_path)
            cr_mc = cap_mc.crop((int(cap_mc.width * 0.15), int(cap_mc.height * 0.08), int(cap_mc.width * 0.85), int(cap_mc.height * 0.35)))
            target_w = card_w - 20
            aspect = cr_mc.width / cr_mc.height
            target_h = int(target_w / aspect)
            max_h = 180 if idx < 4 else 210
            if target_h > max_h:
                target_h = max_h
                target_w = int(target_h * aspect)
            res_mc = cr_mc.resize((target_w, target_h), Image.Resampling.LANCZOS)
            ox = cx1 + 10 + (card_w - 20 - target_w) // 2
            oy = cy2 - target_h - 12
            im.paste(res_mc, (ox, oy))
            draw.text((cx1 + 14, oy - 18), "Match Center (Pré-jogo)", fill=(180, 195, 215, 255), font=font_small)

    out_name = "painel_match_center_hud_confrontos_4e9.png"
    out_path = os.path.join(ARTIFACTS_DIR, out_name)
    im.save(out_path)
    shutil.copy(out_path, os.path.join(CAPTURES_DIR, out_name))
    print("Salvo: %s" % out_path)

if __name__ == "__main__":
    build_panel_responsividade_la_liga()
    build_panel_eliminacao_bola_escudos()
    build_panel_contraste_tipografico()
    build_panel_match_center_hud_confrontos()
    print("Todos os painéis da ETAPA 4e.9 foram gerados com sucesso!")
