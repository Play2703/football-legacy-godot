#!/usr/bin/env python3
"""
ETAPA 4e.5 — AUDITORIA CROMÁTICA PROGRAMÁTICA DE TODOS OS CLUBES
Audita todos os clubes cadastrados em features/league/teams.gd
Gera estatísticas completas de contraste WCAG, padrões, cores e integridade dos dados.
"""

import re
import sys
import os

def srgb_to_linear(c):
    if c <= 0.04045:
        return c / 12.92
    else:
        return ((c + 0.055) / 1.055) ** 2.4

def relative_luminance(r, g, b):
    r_lin = srgb_to_linear(r)
    g_lin = srgb_to_linear(g)
    b_lin = srgb_to_linear(b)
    return 0.2126 * r_lin + 0.7152 * g_lin + 0.0722 * b_lin

def contrast_ratio(l1, l2):
    lighter = max(l1, l2)
    darker = min(l1, l2)
    return (lighter + 0.05) / (darker + 0.05)

def parse_hex_color(hex_str):
    hex_str = hex_str.strip().strip('"').strip("'")
    if hex_str.startswith("#"):
        hex_str = hex_str[1:]
    if len(hex_str) == 6:
        r = int(hex_str[0:2], 16) / 255.0
        g = int(hex_str[2:4], 16) / 255.0
        b = int(hex_str[4:6], 16) / 255.0
        return (r, g, b)
    elif len(hex_str) == 8:
        r = int(hex_str[0:2], 16) / 255.0
        g = int(hex_str[2:4], 16) / 255.0
        b = int(hex_str[4:6], 16) / 255.0
        return (r, g, b)
    return (0.5, 0.5, 0.5)

def main():
    teams_path = "features/league/teams.gd"
    if not os.path.exists(teams_path):
        print(f"Erro: Arquivo {teams_path} não encontrado.")
        sys.exit(1)

    with open(teams_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Find the POOL array
    pool_idx = content.find("const POOL: Array = [")
    if pool_idx == -1:
        print("Erro: const POOL não encontrada.")
        sys.exit(1)

    pool_content = content[pool_idx:]
    # Match each dict entry: starts with { and ends with }
    # Since entries may span multiple lines:
    raw_entries = re.findall(r"\{\s*\"id\":\s*\"([^\"]+)\"([^}]+)\}", pool_content)
    print(f"Total de clubes encontrados na POOL: {len(raw_entries)}")

    clubs = []
    ids = set()
    duplicates = []
    incomplete = []
    
    # Text colors
    l_white = relative_luminance(1.0, 1.0, 1.0)
    l_dark = relative_luminance(16/255.0, 16/255.0, 21/255.0) # #101015

    patterns_count = {}
    countries_count = {}
    low_contrast_clubs = []

    for tid, rest in raw_entries:
        if tid in ids:
            duplicates.append(tid)
        ids.add(tid)

        full_str = f'"id": "{tid}"' + rest
        
        name_m = re.search(r"\"name\":\s*\"([^\"]+)\"", full_str)
        country_m = re.search(r"\"country\":\s*\"([^\"]+)\"", full_str)
        div_m = re.search(r"\"div\":\s*([0-9]+)", full_str)
        abbrev_m = re.search(r"\"abbrev\":\s*\"([^\"]+)\"", full_str)
        kit_m = re.search(r"\"kit\":\s*Color\(\"([^\"]+)\"\)", full_str)
        kit2_m = re.search(r"\"kit2\":\s*Color\(\"([^\"]+)\"\)", full_str)
        kitb_m = re.search(r"\"kit_b\":\s*Color\(\"([^\"]+)\"\)", full_str)
        pat_m = re.search(r"\"pattern\":\s*\"([^\"]+)\"", full_str)

        name = name_m.group(1) if name_m else tid.upper()
        country = country_m.group(1) if country_m else "Desconhecido"
        div = int(div_m.group(1)) if div_m else 1
        abbrev = abbrev_m.group(1) if abbrev_m else tid.upper()[:3]
        kit = kit_m.group(1) if kit_m else None
        kit2 = kit2_m.group(1) if kit2_m else None
        kit_b = kitb_m.group(1) if kitb_m else None
        pat = pat_m.group(1) if pat_m else "solid"

        if not kit or not kit2:
            incomplete.append({"id": tid, "name": name, "missing": "kit/kit2"})
            continue

        countries_count[country] = countries_count.get(country, 0) + 1
        patterns_count[pat] = patterns_count.get(pat, 0) + 1

        # Calculate luminance and contrast
        r, g, b = parse_hex_color(kit)
        l_bg = relative_luminance(r, g, b)
        cr_w = contrast_ratio(l_white, l_bg)
        cr_d = contrast_ratio(l_dark, l_bg)
        best_cr = max(cr_w, cr_d)
        chosen_text = "white" if cr_w >= cr_d else "dark"

        if best_cr < 4.5:
            low_contrast_clubs.append({
                "id": tid, "name": name, "kit": kit, "best_cr": best_cr, "chosen": chosen_text
            })

        clubs.append({
            "id": tid,
            "name": name,
            "abbrev": abbrev,
            "country": country,
            "div": div,
            "kit": kit,
            "kit2": kit2,
            "kit_b": kit_b,
            "pattern": pat,
            "best_cr": best_cr,
            "chosen_text": chosen_text
        })

    print("=" * 70)
    print("RELATÓRIO PROGRAMÁTICO DA AUDITORIA DE CLUBES (ETAPA 4e.5)")
    print("=" * 70)
    print(f"Total de clubes analisados:           {len(clubs)}")
    print(f"Clubes com dados completos e válidos: {len(clubs)}")
    print(f"Clubes incompletos:                   {len(incomplete)}")
    print(f"IDs duplicados:                       {len(duplicates)}")
    print(f"Total de países cobertos:             {len(countries_count)}")
    print(f"Clubes com contraste WCAG >= 4.5:1:   {len(clubs) - len(low_contrast_clubs)} ({((len(clubs)-len(low_contrast_clubs))/len(clubs)*100):.1f}%)")
    print(f"Clubes na zona limítrofe (CR < 4.5:1):{len(low_contrast_clubs)}")
    
    print("\nDistribuição de padrões geométricos:")
    for p, c in sorted(patterns_count.items(), key=lambda x: -x[1]):
        print(f"  - {p:15s}: {c:4d} clubes")

    print("\nTop 10 países com mais clubes:")
    for country, count in sorted(countries_count.items(), key=lambda x: -x[1])[:10]:
        print(f"  - {country:20s}: {count:4d} clubes")

    if low_contrast_clubs:
        print(f"\nExemplo de clubes na zona limítrofe ({len(low_contrast_clubs)} no total):")
        for lc in low_contrast_clubs[:5]:
            print(f"  - [{lc['id']}] {lc['name']}: kit #{lc['kit']} -> Max CR {lc['best_cr']:.2f}:1 ({lc['chosen']})")

if __name__ == "__main__":
    main()
