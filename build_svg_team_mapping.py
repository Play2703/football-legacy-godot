import json, re, unicodedata, os

project_root = '/home/pedro/.gemini/antigravity/scratch/football-legacy-godot'

with open(os.path.join(project_root, 'INVENTARIO_PACKS_SVG.json'), 'r') as f:
    inv = json.load(f)

with open(os.path.join(project_root, 'features/league/teams.gd'), 'r') as f:
    content = f.read()

# Parse all teams in POOL
pool_match = re.search(r'const POOL: Array = \[(.*?)\]\s*const', content, re.DOTALL)
if not pool_match:
    pool_match = re.search(r'const POOL: Array = \[(.*)\]', content, re.DOTALL)
pool_str = pool_match.group(1)

team_blocks = re.findall(r'\{([^{}]+)\}', pool_str)
teams_by_id = {}
teams_by_country = {}

for b in team_blocks:
    id_m = re.search(r'\"id\":\s*\"([^\"]+)\"', b)
    name_m = re.search(r'\"name\":\s*\"([^\"]+)\"', b)
    country_m = re.search(r'\"country\":\s*\"([^\"]+)\"', b)
    div_m = re.search(r'\"div\":\s*([0-9]+)', b)
    abbrev_m = re.search(r'\"abbrev\":\s*\"([^\"]+)\"', b)
    if id_m and name_m:
        t = {
            'id': id_m.group(1),
            'name': name_m.group(1),
            'country': country_m.group(1) if country_m else '',
            'div': int(div_m.group(1)) if div_m else 1,
            'abbrev': abbrev_m.group(1) if abbrev_m else ''
        }
        teams_by_id[t['id']] = t
        c = t['country']
        if c not in teams_by_country:
            teams_by_country[c] = []
        teams_by_country[c].append(t)

pack_country_map = {
    'brasileirao-serie-a-2026': 'Brasil',
    'brasileirao-serie-b-2026': 'Brasil',
    'brasileirao-serie-c-2026': 'Brasil',
    'bundesliga-2026-27': 'Alemania',
    'laliga-2026-27': 'España',
    'liga-portugal-2026-27': 'Portugal',
    'liga-profesional-2026': 'Argentina',
    'ligue-1-2026-27': 'Francia',
    'mls-2026': 'Estados Unidos',
    'premier-league-2026-27': 'Inglaterra',
    'serie-a-2026-27': 'Italia'
}

def norm_str(s):
    s = unicodedata.normalize('NFKD', s).encode('ASCII', 'ignore').decode('utf-8').lower()
    s = re.sub(r'[^a-z0-9\s]', ' ', s)
    return re.sub(r'\s+', ' ', s).strip()

def extract_meaningful_tokens(s):
    s_norm = norm_str(s)
    stop = {'fc', 'cf', 'ac', 'ud', 'cd', 'sc', 'cr', 'ca', 'afc', 'rb', 'de', 'do', 'da', 'del', 'la', 'el', 'the', 'club', 'calcio', 'deportivo', 'atletico', 'esporte', 'futebol', 'sport', 'real', 'as', 'ss', 'us', 'sp', 'pb', 'se', 'lp', 'om', 'hsc', 'osc', 'sco', 'fbpa', 'ec', 'clube', 'regatas', 'paulista'}
    tokens = [t for t in s_norm.split() if t not in stop and len(t) > 1]
    return set(tokens), s_norm

# Explicit high-fidelity manual dictionary for all packs
verified_matches = {
    # La Liga
    ('laliga-2026-27', 'real-madrid'): 'rma',
    ('laliga-2026-27', 'fc-barcelona'): 'bar',
    ('laliga-2026-27', 'atletico-madrid'): 'atm',
    ('laliga-2026-27', 'athletic-club-bilbao'): 'ath',
    ('laliga-2026-27', 'celta-vigo'): 'cel',
    ('laliga-2026-27', 'deportivo-alaves'): 'ala',
    ('laliga-2026-27', 'elche-cf'): 'elc',
    ('laliga-2026-27', 'getafe-cf'): 'get',
    ('laliga-2026-27', 'levante-ud'): 'lev',
    ('laliga-2026-27', 'osasuna'): 'osa',
    ('laliga-2026-27', 'rcd-espanyol-barcelona'): 'esp',
    ('laliga-2026-27', 'racing-santander'): 'rcs',
    ('laliga-2026-27', 'rayo-vallecano'): 'ray',
    ('laliga-2026-27', 'real-betis-balompie'): 'bet',
    ('laliga-2026-27', 'real-sociedad'): 'rso',
    ('laliga-2026-27', 'sevilla-fc'): 'sev',
    ('laliga-2026-27', 'valencia-cf'): 'val',
    ('laliga-2026-27', 'villarreal-cf'): 'vil',
    ('laliga-2026-27', 'deportivo-la-coruna'): 'dep',
    ('laliga-2026-27', 'malaga-cf'): 'mal',

    # Premier League
    ('premier-league-2026-27', 'manchester-city'): 'mci',
    ('premier-league-2026-27', 'arsenal-fc'): 'ars',
    ('premier-league-2026-27', 'liverpool-fc'): 'liv',
    ('premier-league-2026-27', 'chelsea-fc'): 'che',
    ('premier-league-2026-27', 'manchester-united'): 'mun',
    ('premier-league-2026-27', 'tottenham-hotspur'): 'tot',
    ('premier-league-2026-27', 'newcastle-united'): 'new',
    ('premier-league-2026-27', 'aston-villa'): 'avl',
    ('premier-league-2026-27', 'brighton-hove-albion'): 'bhi',
    ('premier-league-2026-27', 'west-ham-united'): 'whu',
    ('premier-league-2026-27', 'wolverhampton-wanderers'): 'wol',
    ('premier-league-2026-27', 'crystal-palace'): 'cry',
    ('premier-league-2026-27', 'everton-fc'): 'eve',
    ('premier-league-2026-27', 'fulham-fc'): 'ful',
    ('premier-league-2026-27', 'brentford-fc'): 'bre',
    ('premier-league-2026-27', 'nottingham-forest'): 'nfo',
    ('premier-league-2026-27', 'afc-bournemouth'): 'bou',
    ('premier-league-2026-27', 'leicester-city'): 'lce',
    ('premier-league-2026-27', 'ipswich-town'): 'ips',
    ('premier-league-2026-27', 'southampton-fc'): 'sou',

    # Bundesliga
    ('bundesliga-2026-27', 'bayern-munchen'): 'bay',
    ('bundesliga-2026-27', 'borussia-dortmund'): 'dor',
    ('bundesliga-2026-27', 'bayer-04-leverkusen'): 'lev',
    ('bundesliga-2026-27', 'rb-leipzig'): 'lei',
    ('bundesliga-2026-27', 'vfb-stuttgart'): 'stu',
    ('bundesliga-2026-27', 'eintracht-frankfurt'): 'fra',
    ('bundesliga-2026-27', 'vfl-wolfsburg'): 'wob',
    ('bundesliga-2026-27', 'sc-freiburg'): 'fbg',
    ('bundesliga-2026-27', 'tsg-1899-hoffenheim'): 'hof',
    ('bundesliga-2026-27', 'borussia-monchengladbach'): 'bmg',
    ('bundesliga-2026-27', '1-fc-union-berlin'): 'fcu',
    ('bundesliga-2026-27', 'werder-bremen'): 'svw',
    ('bundesliga-2026-27', '1-fsv-mainz-05'): 'm05',
    ('bundesliga-2026-27', 'fc-augsburg'): 'fca',
    ('bundesliga-2026-27', 'vfl-bochum-1848'): 'boc',
    ('bundesliga-2026-27', 'fc-st-pauli'): 'stpl',
    ('bundesliga-2026-27', 'holstein-kiel'): 'ksv',
    ('bundesliga-2026-27', '1-fc-heidenheim-1846'): 'hei',
    ('bundesliga-2026-27', 'hamburger-sv'): 'hsv',

    # Ligue 1
    ('ligue-1-2026-27', 'paris-saint-germain'): 'pari',
    ('ligue-1-2026-27', 'olympique-marseille'): 'mars',
    ('ligue-1-2026-27', 'olympique-de-marseille-om'): 'mars',
    ('ligue-1-2026-27', 'as-monaco'): 'mon',
    ('ligue-1-2026-27', 'olympique-lyonnais'): 'lyo',
    ('ligue-1-2026-27', 'lille-osc'): 'lil',
    ('ligue-1-2026-27', 'ogc-nice'): 'niz',
    ('ligue-1-2026-27', 'stade-rennais'): 'ren',
    ('ligue-1-2026-27', 'rc-lens'): 'len',
    ('ligue-1-2026-27', 'rc-strasbourg-alsace'): 'estr',
    ('ligue-1-2026-27', 'fc-nantes'): 'nan',
    ('ligue-1-2026-27', 'montpellier-hsc'): 'mont',
    ('ligue-1-2026-27', 'toulouse-fc'): 'tou',
    ('ligue-1-2026-27', 'stade-brestois-29'): 'bres',
    ('ligue-1-2026-27', 'stade-de-reims'): 'rei',
    ('ligue-1-2026-27', 'le-havre-ac'): 'leh',
    ('ligue-1-2026-27', 'aj-auxerre'): 'aux',
    ('ligue-1-2026-27', 'angers-sco'): 'ang',
    ('ligue-1-2026-27', 'as-saint-etienne'): 'sai',

    # Serie A
    ('serie-a-2026-27', 'inter-milan'): 'int',
    ('serie-a-2026-27', 'juventus-fc'): 'juv',
    ('serie-a-2026-27', 'ac-milan'): 'mil',
    ('serie-a-2026-27', 'ssc-napoli'): 'nap',
    ('serie-a-2026-27', 'atalanta-bc'): 'ata',
    ('serie-a-2026-27', 'as-roma'): 'rom',
    ('serie-a-2026-27', 'ss-lazio'): 'laz',
    ('serie-a-2026-27', 'acf-fiorentina'): 'fio',
    ('serie-a-2026-27', 'bologna-fc-1909'): 'bol',
    ('serie-a-2026-27', 'torino-fc'): 'tor',
    ('serie-a-2026-27', 'udinese-calcio'): 'udi',
    ('serie-a-2026-27', 'ac-monza'): 'mnz',
    ('serie-a-2026-27', 'genoa-cfc'): 'gen',
    ('serie-a-2026-27', 'cagliari-calcio'): 'cag',
    ('serie-a-2026-27', 'us-lecce'): 'lec',
    ('serie-a-2026-27', 'hellas-verona'): 'ver_it',
    ('serie-a-2026-27', 'empoli-fc'): 'emp',
    ('serie-a-2026-27', 'parma-calcio-1913'): 'par',
    ('serie-a-2026-27', 'como-1907'): 'com',
    ('serie-a-2026-27', 'venezia-fc'): 'ven',

    # Brasileirão Série A
    ('brasileirao-serie-a-2026', 'flamengo'): 'fla',
    ('brasileirao-serie-a-2026', 'palmeiras'): 'palm',
    ('brasileirao-serie-a-2026', 'corinthians'): 'cori',
    ('brasileirao-serie-a-2026', 'sao-paulo'): 'sao',
    ('brasileirao-serie-a-2026', 'fluminense'): 'flu',
    ('brasileirao-serie-a-2026', 'botafogo'): 'bot',
    ('brasileirao-serie-a-2026', 'gremio'): 'grem',
    ('brasileirao-serie-a-2026', 'internacional'): 'inte',
    ('brasileirao-serie-a-2026', 'atletico-mineiro'): 'atle',
    ('brasileirao-serie-a-2026', 'cruzeiro'): 'cru',
    ('brasileirao-serie-a-2026', 'vasco-da-gama'): 'vas',
    ('brasileirao-serie-a-2026', 'santos'): 'sant',
    ('brasileirao-serie-a-2026', 'bahia'): 'bah',
    ('brasileirao-serie-a-2026', 'fortaleza'): 'fort',
    ('brasileirao-serie-a-2026', 'athletico-paranaense'): 'athl',
    ('brasileirao-serie-a-2026', 'bragantino'): 'rbb',
    ('brasileirao-serie-a-2026', 'red-bull-bragantino'): 'rbb',
    ('brasileirao-serie-a-2026', 'vitoria'): 'vito',
    ('brasileirao-serie-a-2026', 'juventude'): 'juv2',
    ('brasileirao-serie-a-2026', 'criciuma'): 'cri',
    ('brasileirao-serie-a-2026', 'cuiaba'): 'cui',
    ('brasileirao-serie-a-2026', 'atletico-goianiense'): 'atgo',

    # Brasileirão Série B & C
    ('brasileirao-serie-b-2026', 'america-mineiro'): 'ame',
    ('brasileirao-serie-b-2026', 'ceara-sc'): 'cea',
    ('brasileirao-serie-b-2026', 'goias'): 'goi',
    ('brasileirao-serie-b-2026', 'coritiba'): 'cor',
    ('brasileirao-serie-b-2026', 'sport-recife'): 'spo',
    ('brasileirao-serie-b-2026', 'avai-fc'): 'ava',
    ('brasileirao-serie-b-2026', 'ponte-preta'): 'pon',
    ('brasileirao-serie-b-2026', 'vila-nova'): 'vil_br',
    ('brasileirao-serie-b-2026', 'guarani'): 'gua',
    ('brasileirao-serie-b-2026', 'operario-pr'): 'ope',
    ('brasileirao-serie-b-2026', 'crb'): 'crb',
    ('brasileirao-serie-b-2026', 'novorizontino'): 'nov',
    ('brasileirao-serie-b-2026', 'mirassol'): 'mir',
    ('brasileirao-serie-b-2026', 'chapecoense'): 'cha_br',
    ('brasileirao-serie-b-2026', 'ituano'): 'itu',
    ('brasileirao-serie-b-2026', 'botafogo-sp'): 'bsp',
    ('brasileirao-serie-b-2026', 'paysandu'): 'pay',
    ('brasileirao-serie-b-2026', 'amazonas'): 'ama',
    ('brasileirao-serie-b-2026', 'brusque'): 'bru',
    ('brasileirao-serie-c-2026', 'nautico'): 'nau',
    ('brasileirao-serie-c-2026', 'figueirense'): 'fig',
    ('brasileirao-serie-c-2026', 'csa'): 'csa',
    ('brasileirao-serie-c-2026', 'remo'): 'rem',
    ('brasileirao-serie-c-2026', 'londrina'): 'lon',
    ('brasileirao-serie-c-2026', 'sampaio-correa'): 'sam',
    ('brasileirao-serie-c-2026', 'abc'): 'abc',
    ('brasileirao-serie-c-2026', 'confianca'): 'cnf',
    ('brasileirao-serie-c-2026', 'volta-redonda'): 'vre',
    ('brasileirao-serie-c-2026', 'ferroviario'): 'fer',
    ('brasileirao-serie-c-2026', 'sao-jose-rs'): 'sjo',
    ('brasileirao-serie-c-2026', 'floresta'): 'flo',
    ('brasileirao-serie-c-2026', 'botafogo-pb'): 'bpb',
    ('brasileirao-serie-c-2026', 'tombense'): 'tom',
    ('brasileirao-serie-c-2026', 'aparecidense'): 'apa',

    # Liga Portugal
    ('liga-portugal-2026-27', 'sl-benfica'): 'ben',
    ('liga-portugal-2026-27', 'fc-porto'): 'por',
    ('liga-portugal-2026-27', 'sporting-cp'): 'spo',
    ('liga-portugal-2026-27', 'sc-braga'): 'bra',
    ('liga-portugal-2026-27', 'vitoria-guimaraes'): 'vit',
    ('liga-portugal-2026-27', 'fc-famalicao'): 'fam',
    ('liga-portugal-2026-27', 'fc-arouca'): 'aro',
    ('liga-portugal-2026-27', 'moreirense'): 'mor',
    ('liga-portugal-2026-27', 'rio-ave'): 'riv',
    ('liga-portugal-2026-27', 'gil-vicente'): 'gil',
    ('liga-portugal-2026-27', 'estoril-praia'): 'est',
    ('liga-portugal-2026-27', 'boavista-fc'): 'boa',
    ('liga-portugal-2026-27', 'casa-pia'): 'cpa',
    ('liga-portugal-2026-27', 'sc-farense'): 'far',
    ('liga-portugal-2026-27', 'cd-nacional'): 'nac',
    ('liga-portugal-2026-27', 'cd-santa-clara'): 'scl',
    ('liga-portugal-2026-27', 'avs-futebol-sad'): 'avs',
    ('liga-portugal-2026-27', 'estrela-amadora'): 'eam',

    # Liga Profesional (Argentina)
    ('liga-profesional-2026', 'boca-juniors'): 'boca',
    ('liga-profesional-2026', 'river-plate'): 'rive',
    ('liga-profesional-2026', 'racing-club'): 'raci',
    ('liga-profesional-2026', 'independiente'): 'ind',
    ('liga-profesional-2026', 'san-lorenzo'): 'sanl',
    ('liga-profesional-2026', 'estudiantes-de-la-plata'): 'estu',
    ('liga-profesional-2026', 'velez-sarsfield'): 'vel',
    ('liga-profesional-2026', 'talleres'): 'tal',
    ('liga-profesional-2026', 'rosario-central'): 'ros',
    ('liga-profesional-2026', 'newells-old-boys'): 'newe',
    ('liga-profesional-2026', 'argentinos-juniors'): 'arge',
    ('liga-profesional-2026', 'lanus'): 'lan',
    ('liga-profesional-2026', 'defensa-y-justicia'): 'def',
    ('liga-profesional-2026', 'huracan'): 'hur',
    ('liga-profesional-2026', 'banfield'): 'ban',
    ('liga-profesional-2026', 'belgrano'): 'bel',
    ('liga-profesional-2026', 'instituto-cordoba'): 'ins',
    ('liga-profesional-2026', 'godoy-cruz'): 'god',
    ('liga-profesional-2026', 'union-santa-fe'): 'uni_ar',
    ('liga-profesional-2026', 'colon'): 'col',
    ('liga-profesional-2026', 'gimnasia-esgrima-lp'): 'gim',
    ('liga-profesional-2026', 'gimnasia-y-esgrima-lp'): 'gim',
    ('liga-profesional-2026', 'gimnasia-y-esgrima'): 'gim',
    ('liga-profesional-2026', 'platense'): 'pla',
    ('liga-profesional-2026', 'atletico-platense'): 'pla',
    ('liga-profesional-2026', 'central-cordoba-se'): 'cco',
    ('liga-profesional-2026', 'barracas-central'): 'barr',
    ('liga-profesional-2026', 'tigre'): 'tig',
    ('liga-profesional-2026', 'sarmiento'): 'sar',
    ('liga-profesional-2026', 'atletico-tucuman'): 'tuc',
    ('liga-profesional-2026', 'deportivo-riestra'): 'rie',
    ('liga-profesional-2026', 'independiente-rivadavia'): 'iriv',

    # MLS
    ('mls-2026', 'inter-miami'): 'ntr',
    ('mls-2026', 'la-galaxy'): 'lag',
    ('mls-2026', 'los-angeles-fc'): 'losa',
    ('mls-2026', 'seattle-sounders'): 'sea',
    ('mls-2026', 'atlanta-united'): 'tln',
    ('mls-2026', 'portland-timbers'): 'port',
    ('mls-2026', 'new-york-city-fc'): 'newy',
    ('mls-2026', 'new-york-red-bulls'): 'nwy',
    ('mls-2026', 'columbus-crew'): 'colu',
    ('mls-2026', 'philadelphia-union'): 'phi',
    ('mls-2026', 'fc-cincinnati'): 'fcc',
    ('mls-2026', 'nashville-sc'): 'nas',
    ('mls-2026', 'austin-fc'): 'aust',
    ('mls-2026', 'sporting-kansas-city'): 'spr',
    ('mls-2026', 'real-salt-lake'): 'rea',
    ('mls-2026', 'orlando-city'): 'orl',
    ('mls-2026', 'houston-dynamo'): 'hou',
    ('mls-2026', 'minnesota-united'): 'min',
    ('mls-2026', 'fc-dallas'): 'dal',
    ('mls-2026', 'colorado-rapids'): 'col_us',
    ('mls-2026', 'san-jose-earthquakes'): 'sj',
    ('mls-2026', 'chicago-fire'): 'chi',
    ('mls-2026', 'dc-united'): 'dc',
    ('mls-2026', 'toronto-fc'): 'tor_us',
    ('mls-2026', 'cf-montreal'): 'mtl',
    ('mls-2026', 'vancouver-whitecaps'): 'van',
    ('mls-2026', 'charlotte-fc'): 'cha_us',
    ('mls-2026', 'st-louis-city-sc'): 'stl',
    ('mls-2026', 'new-england-revolution'): 'ne',
    ('mls-2026', 'san-diego-fc'): 'sd',
    ('bundesliga-2026-27', 'bayer-leverkusen'): 'lev',
    ('bundesliga-2026-27', 'bayern-munich'): 'bay',
    ('bundesliga-2026-27', 'mainz-05'): 'm05',
    ('bundesliga-2026-27', 'sc-paderborn-07'): 'pad',
    ('bundesliga-2026-27', 'sv-elversberg'): 'elv',
    ('bundesliga-2026-27', 'schalke-04'): 's04',
    ('bundesliga-2026-27', 'tsg-hoffenheim'): 'hof',
    ('laliga-2026-27', 'racing-santander'): 'rac',
    ('liga-portugal-2026-27', 'cd-nacional-madeira'): 'ncl',
    ('ligue-1-2026-27', 'losc-lille'): 'lil',
    ('premier-league-2026-27', 'brighton-and-hove-albion'): 'bhi',
    ('premier-league-2026-27', 'coventry-city'): 'covc',
    ('premier-league-2026-27', 'leeds-united'): 'lee',
    ('brasileirao-serie-b-2026', 'gremio-novorizontino'): 'nvz',
    ('brasileirao-serie-b-2026', 'athletic'): 'atc',

}

# Run through all 234 SVGs
mapping_by_club_id = {}
mapping_by_svg_filename = {}
pending_validation = []
unmatched_svgs = []
successful_mappings = 0

for pack in inv['packs']:
    pname = pack['pack_name']
    country = pack_country_map.get(pname, '')
    country_teams = teams_by_country.get(country, [])
    
    for logo in pack.get('logos_meta', []):
        svg_name = logo.get('name', '')
        slug = logo.get('slug', '')
        filename = logo.get('filename', '')
        svg_path = f'res://assets/logos/svg/{filename}'
        
        # 1. Check explicit verified table
        matched_team_id = verified_matches.get((pname, slug))
        if matched_team_id and matched_team_id in teams_by_id:
            team_info = teams_by_id[matched_team_id]
            entry = {
                'club_id': matched_team_id,
                'club_name': team_info['name'],
                'country': team_info['country'],
                'pack_name': pname,
                'svg_filename': filename,
                'svg_path': svg_path,
                'confidence': 'VERIFIED_ALIAS',
                'confidence_score': 1.0,
                'rationale': f'Verified official match: {svg_name} ({slug}) -> {team_info["name"]} ({matched_team_id})'
            }
            mapping_by_club_id[matched_team_id] = entry
            mapping_by_svg_filename[filename] = entry
            successful_mappings += 1
            continue
            
        # 2. Automated match against country teams
        svg_tokens, norm_svg = extract_meaningful_tokens(svg_name)
        slug_tokens, norm_slug = extract_meaningful_tokens(slug.replace('-', ' '))
        all_tokens = svg_tokens.union(slug_tokens)
        
        cand = None
        for t in country_teams:
            t_tokens, norm_t = extract_meaningful_tokens(t['name'])
            if norm_svg == norm_t or norm_slug == norm_t:
                cand = (t, 'EXACT', 1.0, f'Exact normalized name match: {norm_svg} == {norm_t}')
                break
            elif t_tokens and t_tokens == all_tokens:
                cand = (t, 'EXACT', 1.0, f'Exact token set match: {t_tokens}')
                break
            elif t_tokens and t_tokens.issubset(all_tokens) and len(t_tokens) >= 2:
                cand = (t, 'HIGH', 0.95, f'Strong multi-token subset match: {t_tokens} in {all_tokens}')
                break
                
        if cand:
            team_info, conf, score, rat = cand
            entry = {
                'club_id': team_info['id'],
                'club_name': team_info['name'],
                'country': team_info['country'],
                'pack_name': pname,
                'svg_filename': filename,
                'svg_path': svg_path,
                'confidence': conf,
                'confidence_score': score,
                'rationale': rat
            }
            mapping_by_club_id[team_info['id']] = entry
            mapping_by_svg_filename[filename] = entry
            successful_mappings += 1
        else:
            # Check if any partial match exists
            partials = []
            for t in country_teams:
                t_tokens, norm_t = extract_meaningful_tokens(t['name'])
                if t_tokens.intersection(all_tokens):
                    partials.append(t)
            if partials:
                pending_validation.append({
                    'pack_name': pname,
                    'svg_name': svg_name,
                    'slug': slug,
                    'filename': filename,
                    'candidates': [p['name'] + ' (' + p['id'] + ')' for p in partials[:3]]
                })
            else:
                unmatched_svgs.append({
                    'pack_name': pname,
                    'svg_name': svg_name,
                    'slug': slug,
                    'filename': filename,
                    'reason': f'No club in teams.gd found for country {country}'
                })

print(f'Successful mappings: {successful_mappings} / 234')
print(f'Pending validation: {len(pending_validation)}')
print(f'Unmatched SVGs (clubs not present in teams.gd): {len(unmatched_svgs)}')

# Save to assets/logos/svg_team_mapping.json
out_data = {
    'total_svgs': 234,
    'successfully_mapped': successful_mappings,
    'pending_validation_count': len(pending_validation),
    'unmatched_count': len(unmatched_svgs),
    'total_clubs_in_game': len(teams_by_id),
    'clubs_without_svg_badge': len(teams_by_id) - len(mapping_by_club_id),
    'mapping_by_club_id': mapping_by_club_id,
    'mapping_by_svg_filename': mapping_by_svg_filename,
    'pending_validation': pending_validation,
    'unmatched_svgs': unmatched_svgs
}

out_path = os.path.join(project_root, 'assets', 'logos', 'svg_team_mapping.json')
with open(out_path, 'w', encoding='utf-8') as f:
    json.dump(out_data, f, indent=2, ensure_ascii=False)

print(f'Saved mapping to {out_path}')
