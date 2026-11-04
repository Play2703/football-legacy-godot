class_name Stadium
extends Node3D







const GOAL_HALF_W: float = 3.66
const CROSSBAR_H: float = 2.44
const StandAccess = preload("res://features/stadium/stand_access.gd")
const Particulas = preload("res://features/match/particulas.gd")
static var _box_mesh_cache: Dictionary = {}





static var sin_rotulo_torneo: bool = false






const NET_DEPTH: float = 2.1







const STAY_BACK: float = 1.05
const STAY_RISE: float = 0.35


const STAY_ROPE_R: float = 0.012


const ROPE_SAG_K: float = 0.14



const ROPE_CABO_TUBO: float = 0.42
const ROPE_CABO_RED: float = 0.5

const ROPE_CAE_S: float = 1.1



const ROPE_CABO_TIESO: float = 0.35





const ROPE_CAE_ABAJO_M: float = 1.3
const ROPE_CAE_ADELANTE_M: float = 0.4
const ROPE_CAE_UNA_K: float = 0.3
const ROPE_RED_CAE_S: float = 0.9
const FIELD_HALF_W: float = 34.0
const FIELD_DEPTH: float = 105.0
const HALF_LINE: float = 52.5
const PA_HALF_W: float = 20.16
const PA_DEPTH: float = 16.5
const GA_HALF_W: float = 9.16
const GA_DEPTH: float = 5.5
const PEN_SPOT: float = 11.0
const ARC_R: float = 9.15
const CORNER_ARC_R: float = 1.0

const TEXELS_PER_M: float = 12.0


const TEX_W: int = 1024
const TEX_H: int = 1600
const WORLD_X0: float = -42.67
const WORLD_Z0: float = -21.33

const GRASS_A: Color = Color("2f8b3c")
const GRASS_B: Color = Color("2c8438")
const GRASS_OUT: Color = Color("287a34")
const LINE_COLOR: Color = Color(0.95, 0.95, 0.95)

var _line_color: Color = LINE_COLOR



const SPONSORS: Array = [
	["PIXEL COLA", Color("c0392b"), Color(1.0, 1.0, 1.0)],
	["GOL BANK", Color("1b5e91"), Color("ffd54a")],
	["ASTRO AIR", Color("16323f"), Color("7fd4ff")],
	["NOVATEL", Color("6a2d8f"), Color(1.0, 1.0, 1.0)],
	["LEGACY SPORT", Color("1e7a3c"), Color(1.0, 1.0, 1.0)],
	["TACO EXPRESS", Color("e08a1e"), Color("3b1f0a")],
	["ROBO SODA", Color("222831"), Color("9ff09f")],
	["MEGA MOTOR", Color("8f2d2d"), Color("f0e6d0")],
]







const LOCAL_SPONSORS: Array = [
	["CARNICERIA EL TORO", Color("efe7d6"), Color("8f2d2d")],
	["FRUTERIA MANOLO", Color("2f4632"), Color("efe0b0")],
	["FERRETERIA SOL", Color("d7a441"), Color("362611")],
	["PANADERIA LUZ", Color("e6d5a4"), Color("7a4a1c")],
	["TALLER GOMEZ", Color("36414b"), Color("d7dbe0")],
	["PIZZA NONNA", Color("a83a2f"), Color("efe7d6")],
]
























const COUNTRY_SPONSORS: Dictionary = {
	"España": [
		["IBERCOLA", Color("c0392b"), Color(1.0, 1.0, 1.0)],
		["BANCO SOLAR", Color("1b5e91"), Color("ffd54a")],
		["ACEITES OLIVAR", Color("6b7d2a"), Color("f2ead0")],
		["SEGUROS TORO", Color("8f2d2d"), Color("f0e6d0")],
		["AZULEJOS RIVAS", Color("1f6f8b"), Color("f2f7fa")],
		["MOTOR HISPANO", Color("2b2f38"), Color("e8c86a")],
		["AGUA SIERRA", Color("2a7f6f"), Color("eafaf5")],
		["TELECOM IBERIA", Color("6a2d8f"), Color(1.0, 1.0, 1.0)],
	],
	"Inglaterra": [
		["ALBION CRISPS", Color("7a3b1e"), Color("f0dcae")],
		["KINGSWAY BANK", Color("14355e"), Color("dfe8f5")],
		["NORTHGATE STEEL", Color("3a4148"), Color("cfd6dc")],
		["ROYAL MOTORS", Color("6d1f2a"), Color("f0e2c8")],
		["HARBOUR TEA", Color("1d6b4a"), Color("f4f0e2")],
		["IRONBRIDGE", Color("2a2f36"), Color("e0a34a")],
		["SEASIDE AIR", Color("18506e"), Color("9fe0ff")],
		["CROWN INSURANCE", Color("4a2b6b"), Color("f2ecff")],
	],
	"Escocia": [
		["HIGHLAND OATS", Color("2f4632"), Color("efe0b0")],
		["CLYDE BANK", Color("14355e"), Color("cfe0f5")],
		["TARTAN MOTORS", Color("6d1f2a"), Color("f0e2c8")],
		["NORTH SEA GAS", Color("16323f"), Color("7fd4ff")],
		["GLEN WATER", Color("2a7f8b"), Color("eafaff")],
		["THISTLE WOOL", Color("5a3f7a"), Color("f0e8ff")],
		["FIRTH FERRY", Color("1d5b6b"), Color("dff2f7")],
		["GRANITE TOOLS", Color("3a4148"), Color("d8dde2")],
	],
	"Italia": [
		["CAFFE MILANO", Color("4a2b1a"), Color("e8d2a8")],
		["BANCA TIRRENA", Color("14406e"), Color("e6d68a")],
		["PASTA VERONA", Color("c9a227"), Color("3b2a0a")],
		["MODA LUCIANI", Color("1d1f24"), Color("e8e2d6")],
		["AUTO VELOCE", Color("9b1c1c"), Color("f4e6d0")],
		["OLIO TOSCANO", Color("6b7d2a"), Color("f2ead0")],
		["VETRO ADRIA", Color("1f6f8b"), Color("eef7fa")],
		["ASSICURA ROMA", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Alemania": [
		["BACKHAUS NORD", Color("7a4a1c"), Color("f0dcae")],
		["STAHLWERK", Color("3a4148"), Color("cfd6dc")],
		["AUTOWERK GS", Color("1d1f24"), Color("d8dde2")],
		["RHEINBANK", Color("14355e"), Color("e2ecf7")],
		["SONNENGAS", Color("d7a441"), Color("2a2210")],
		["TECHNIKHAUS", Color("1f6f8b"), Color("eef7fa")],
		["FRISCHMARKT", Color("1e7a3c"), Color("f2fbf4")],
		["VERSICHER AG", Color("5a2b6b"), Color("f0e8ff")],
	],
	"Francia": [
		["BANQUE LUMIERE", Color("14355e"), Color("e8d68a")],
		["EAU DES ALPES", Color("2a7f8b"), Color("eafaff")],
		["FROMAGE VALLEE", Color("d7a441"), Color("362611")],
		["AUTO RIVIERE", Color("1d1f24"), Color("d8dde2")],
		["MODE CLARIS", Color("6b2b52"), Color("f7e6ef")],
		["PAIN DORE", Color("e6d5a4"), Color("7a4a1c")],
		["TELECOM AZUR", Color("1f5f9b"), Color("eaf4ff")],
		["ASSURANCE COQ", Color("8f2d2d"), Color("f0e6d0")],
	],
	"Portugal": [
		["BANCO ATLANTICO", Color("14406e"), Color("e6d68a")],
		["AZULEJO REAL", Color("1f6f8b"), Color("f2f7fa")],
		["CONSERVAS MAR", Color("2a6f5a"), Color("eafaf0")],
		["CAFE LISBOA", Color("4a2b1a"), Color("e8d2a8")],
		["AUTO DOURO", Color("7a1f2a"), Color("f0e2c8")],
		["CORTICA SUL", Color("b07a3a"), Color("2a1a08")],
		["TELECOM LUSA", Color("1e7a3c"), Color("f2fbf4")],
		["SEGUROS FARO", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Países Bajos": [
		["POLDER BANK", Color("14406e"), Color("e6a34a")],
		["TULP MARKT", Color("b03a5a"), Color("f7e6ef")],
		["KAAS HOEVE", Color("d7a441"), Color("362611")],
		["FIETS WERK", Color("1e7a3c"), Color("f2fbf4")],
		["NOORDZEE OLIE", Color("16323f"), Color("7fd4ff")],
		["STROOM NL", Color("e07a1e"), Color("2a1608")],
		["HAVEN LOGIS", Color("3a4148"), Color("cfd6dc")],
		["VERZEKER NL", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Bélgica": [
		["BRUGGE WAFEL", Color("7a4a1c"), Color("f0dcae")],
		["CHOCO ARDEN", Color("3a2318"), Color("e8c78a")],
		["BANQUE MEUSE", Color("14355e"), Color("e2ecf7")],
		["FRITES DOR", Color("d7a441"), Color("362611")],
		["ACIER LIEGE", Color("3a4148"), Color("cfd6dc")],
		["PORT ANVERS", Color("1d5b6b"), Color("dff2f7")],
		["TELECOM BEL", Color("1f5f9b"), Color("eaf4ff")],
		["VERZEKER BE", Color("5a2b6b"), Color("f0e8ff")],
	],
	"Suiza": [
		["ALPENBANK", Color("14355e"), Color("e8d68a")],
		["UHREN ZEIT", Color("1d1f24"), Color("e0c17a")],
		["SCHOKO BERG", Color("3a2318"), Color("e8c78a")],
		["KASE TAL", Color("d7a441"), Color("362611")],
		["QUELLE ALPIN", Color("2a7f8b"), Color("eafaff")],
		["BAHN HELVET", Color("9b1c1c"), Color("f4e6d0")],
		["PHARMA BASEL", Color("1e7a5c"), Color("eafaf2")],
		["VERSICH CH", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Austria": [
		["ALPEN MILCH", Color("7a4a1c"), Color("f0dcae")],
		["DONAU BANK", Color("14406e"), Color("e2ecf7")],
		["SKI WERK", Color("1f6f8b"), Color("eef7fa")],
		["WIENER KAFFEE", Color("4a2b1a"), Color("e8d2a8")],
		["BERGQUELL", Color("2a7f8b"), Color("eafaff")],
		["HOLZ TIROL", Color("6b4a2a"), Color("efe0b0")],
		["STROM OST", Color("e07a1e"), Color("2a1608")],
		["VERSICH AT", Color("9b1c1c"), Color("f4e6d0")],
	],
	"Dinamarca": [
		["NORDBANK", Color("14355e"), Color("e2ecf7")],
		["FISK NORD", Color("1d5b6b"), Color("dff2f7")],
		["VIND KRAFT", Color("2a7f6f"), Color("eafaf5")],
		["SMOR GAARD", Color("d7a441"), Color("362611")],
		["DESIGN HUS", Color("1d1f24"), Color("e8e2d6")],
		["CYKEL VAERK", Color("1e7a3c"), Color("f2fbf4")],
		["OSTERSO FERGE", Color("16323f"), Color("7fd4ff")],
		["FORSIKRING DK", Color("9b1c1c"), Color("f4e6d0")],
	],
	"Noruega": [
		["FJORD BANK", Color("14406e"), Color("cfe0f5")],
		["NORDLYS KRAFT", Color("16323f"), Color("7fd4ff")],
		["LAKS HAVET", Color("b0563a"), Color("f7e2d6")],
		["SKI FJELL", Color("1f6f8b"), Color("eef7fa")],
		["TRE VERK", Color("6b4a2a"), Color("efe0b0")],
		["OLJE NORD", Color("1d1f24"), Color("d8dde2")],
		["FERGE VEST", Color("1d5b6b"), Color("dff2f7")],
		["FORSIKRING NO", Color("4a2b6b"), Color("f0e8ff")],
	],











	"Suecia": [
		["MALAR BANK", Color("14406e"), Color("e2ecf7")],
		["LINGON SAFT", Color("9b1c3a"), Color("f7e2ea")],
		["FIKA ROSTERI", Color("4a2b1a"), Color("e8d2a8")],
		["SKOG TIMMER", Color("6b4a2a"), Color("efe0b0")],
		["JARN BRUK", Color("3a4148"), Color("cfd6dc")],
		["ALV KRAFT", Color("16323f"), Color("7fd4ff")],
		["SILL OCH LAX", Color("1d5b6b"), Color("dff2f7")],
		["FORSAKRING SE", Color("9b1c1c"), Color("f4e6d0")],
	],
	"Rumanía": [
		["BANCA CARPATI", Color("14355e"), Color("e2ecf7")],
		["MIERE DE SALCAM", Color("e0a01e"), Color("2a1c08")],
		["PAINE ARDEAL", Color("e6d5a4"), Color("7a4a1c")],
		["CIMENT DOBROGEA", Color("8a8070"), Color("2a2418")],
		["OTEL DUNARE", Color("2b2f38"), Color("e8c86a")],
		["DELTA PESCARIE", Color("2a7f6f"), Color("eafaf5")],
		["DULCEATA BUNICA", Color("4b2a52"), Color("efe0f2")],
		["ASIGURARI RO", Color("5a2b6b"), Color("f0e8ff")],
	],








	"Bosnia y Herzegovina": [
		["NERETVA BANKA", Color("14355e"), Color("e2ecf7")],
		["MED BOSNE", Color("e0a01e"), Color("2a1c08")],
		["SOMUN PEKARA", Color("e6d5a4"), Color("7a4a1c")],
		["KAHVA CARSIJA", Color("4a2b1a"), Color("e8d2a8")],
		["KOVANO ZELJEZO", Color("2b2f38"), Color("e8c86a")],
		["KAMENA SO", Color("d8d2c4"), Color("3a3428")],
		["PLANINSKA VODA", Color("1f6f8b"), Color("f2f7fa")],
		["OSIGURA BH", Color("5a2b6b"), Color("f0e8ff")],
	],
	"Chequia": [
		["ZLATY MED", Color("7a4a1c"), Color("f0dcae")],
		["SKLO BOHEM", Color("1f6f8b"), Color("f2f7fa")],
		["BANKA VLTAVA", Color("14355e"), Color("e2ecf7")],
		["AUTO MORAVA", Color("1d1f24"), Color("d8dde2")],
		["OCEL PRAHA", Color("3a4148"), Color("cfd6dc")],
		["PEKARNA DEN", Color("e6d5a4"), Color("7a4a1c")],
		["ENERGIE CZ", Color("e07a1e"), Color("2a1608")],
		["POJISTKA CZ", Color("5a2b6b"), Color("f0e8ff")],
	],
	"Croacia": [
		["JADRAN BANKA", Color("14406e"), Color("e6d68a")],
		["MORE SOL", Color("1d5b6b"), Color("dff2f7")],
		["MASLINA ULJE", Color("6b7d2a"), Color("f2ead0")],
		["KAMEN GRAD", Color("8a8070"), Color("2a2418")],
		["BRODOGRAD", Color("3a4148"), Color("cfd6dc")],
		["SMOKVA DALMAT", Color("4b2a52"), Color("efe0f2")],
		["TELEKOM HR", Color("1f5f9b"), Color("eaf4ff")],
		["OSIGURA HR", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Serbia": [
		["DUNAV BANKA", Color("14355e"), Color("e2ecf7")],
		["MALINA SOK", Color("9b1c3a"), Color("f7e2ea")],
		["AJVAR DOM", Color("7a4a1c"), Color("f0dcae")],
		["CELIK BOR", Color("3a4148"), Color("cfd6dc")],
		["PEKARA ZORA", Color("e6d5a4"), Color("7a4a1c")],
		["AUTO MORAVA", Color("1d1f24"), Color("d8dde2")],
		["STRUJA RS", Color("e07a1e"), Color("2a1608")],
		["OSIGURA RS", Color("5a2b6b"), Color("f0e8ff")],
	],
	"Grecia": [
		["EGEO BANK", Color("14406e"), Color("eaf4ff")],
		["ELAIO ATTIKI", Color("6b7d2a"), Color("f2ead0")],
		["FETA HORIO", Color("f0ece0"), Color("2a5f8b")],
		["NAFTIA LINES", Color("16323f"), Color("7fd4ff")],
		["MELI NISI", Color("1f6f8b"), Color("f2f7fa")],
		["MARMARO", Color("d8d2c4"), Color("3a3428")],
		["ILIOS ENERGIA", Color("e0a01e"), Color("2a1c08")],
		["ASFALEIA GR", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Turquía": [
		["LALE BANK", Color("14406e"), Color("e6d68a")],
		["CAY KEYIF", Color("9b1c1c"), Color("f4e6d0")],
		["HALI DOKUMA", Color("6b1f3a"), Color("f2dce6")],
		["BOGAZ LINES", Color("1d5b6b"), Color("dff2f7")],
		["FINDIK KARA", Color("6b4a2a"), Color("efe0b0")],
		["OTOMOTIV EGE", Color("1d1f24"), Color("d8dde2")],
		["GUNES ENERJI", Color("e0a01e"), Color("2a1c08")],
		["SIGORTA TR", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Ucrania": [
		["DNIPRO BANK", Color("14406e"), Color("e6d68a")],
		["ZERNO POLE", Color("e0b41e"), Color("2a2008")],
		["STAL DONETS", Color("3a4148"), Color("cfd6dc")],
		["SONIASHNYK", Color("d7a441"), Color("362611")],
		["KARPATY VODA", Color("2a7f8b"), Color("eafaff")],
		["PEKARNIA DIM", Color("e6d5a4"), Color("7a4a1c")],
		["ENERGO UA", Color("e07a1e"), Color("2a1608")],
		["STRAKHUVAN UA", Color("5a2b6b"), Color("f0e8ff")],
	],
	"México": [
		["TACO EXPRESS", Color("e08a1e"), Color("3b1f0a")],
		["MIEL AGAVE", Color("d7a441"), Color("362611")],
		["BANCO SOL MAYA", Color("1b5e91"), Color("ffd54a")],
		["TORTILLAS MAIZ", Color("e6d5a4"), Color("7a4a1c")],
		["REFRESCO PALMA", Color("c0392b"), Color(1.0, 1.0, 1.0)],
		["AUTOBUS NORTE", Color("2b2f38"), Color("e8c86a")],
		["CEMENTO SIERRA", Color("8a8070"), Color("2a2418")],
		["SEGUROS NOPAL", Color("1e7a3c"), Color("f2fbf4")],
	],
	"Estados Unidos": [
		["BLUE MESA BANK", Color("14355e"), Color("e2ecf7")],
		["ROUTE 9 DINER", Color("c0392b"), Color("f7ece0")],
		["BIG SKY AIR", Color("16323f"), Color("7fd4ff")],
		["PRAIRIE OATS", Color("d7a441"), Color("362611")],
		["MOTOR CITY V8", Color("1d1f24"), Color("d8dde2")],
		["SUNSET WIRELESS", Color("6a2d8f"), Color(1.0, 1.0, 1.0)],
		["FROST SODA", Color("1e7a5c"), Color("eafaf2")],
		["EAGLE INSURANCE", Color("7a1f2a"), Color("f0e2c8")],
	],
	"Argentina": [
		["BANCO PAMPA", Color("2a7fb0"), Color("f2f9ff")],
		["MATE SERRANO", Color("1e7a3c"), Color("f2fbf4")],
		["ASADO DEL SUR", Color("7a1f2a"), Color("f0e2c8")],
		["DULCE ALFAJOR", Color("6b4a2a"), Color("efe0b0")],
		["NUEZ ANDINA", Color("5a3a1e"), Color("f0e2c8")],
		["COLECTIVO SUR", Color("2b2f38"), Color("e8c86a")],
		["TELECOM PLATA", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS PATAGON", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Brasil": [
		["CAFE TROPICAL", Color("4a2b1a"), Color("e8d2a8")],
		["BANCO VERDE", Color("1e7a3c"), Color("f2e08a")],
		["GUARANA FONTE", Color("c0392b"), Color("f7ece0")],
		["ACAI DO NORTE", Color("4a2b6b"), Color("e8d6ff")],
		["MOTOR AMAZON", Color("1d1f24"), Color("d8dde2")],
		["SANDALIA SOL", Color("e0a01e"), Color("2a1c08")],
		["TELECOM RIO", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS MATA", Color("2a6f5a"), Color("eafaf0")],
	],
	"Chile": [
		["FRUTA CORDILLERA", Color("c4561f"), Color("fbe8d4")],
		["COBRE ANDES", Color("b0563a"), Color("f7e2d6")],
		["BANCO AUSTRAL", Color("14406e"), Color("e2ecf7")],
		["SALMON DEL SUR", Color("b07a5a"), Color("2a1a08")],
		["AGUA ATACAMA", Color("2a7f8b"), Color("eafaff")],
		["PAN AMASADO", Color("e6d5a4"), Color("7a4a1c")],
		["TELECOM PACIFICO", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS ANDINO", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Colombia": [
		["CAFE MONTANA", Color("4a2b1a"), Color("e8d2a8")],
		["BANCO ANDINO", Color("14406e"), Color("e6d68a")],
		["ESMERALDA JOYAS", Color("1e7a5c"), Color("eafaf2")],
		["AREPA DEL VALLE", Color("e0b41e"), Color("2a2008")],
		["FLORES SABANA", Color("b03a5a"), Color("f7e6ef")],
		["MOTOR CARIBE", Color("2b2f38"), Color("e8c86a")],
		["TELECOM MAGDALENA", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS TROPICO", Color("2a6f5a"), Color("eafaf0")],
	],
	"Uruguay": [
		["MATE CHARRUA", Color("1e7a3c"), Color("f2fbf4")],
		["BANCO CERRITO", Color("2a7fb0"), Color("f2f9ff")],
		["CARNE RAMBLA", Color("7a1f2a"), Color("f0e2c8")],
		["LANA DEL ESTE", Color("e6d5a4"), Color("7a4a1c")],
		["QUESO COLONIA", Color("e3c04a"), Color("3a2a0a")],
		["PUERTO SUR", Color("1d5b6b"), Color("dff2f7")],
		["TELECOM ORIENTAL", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS RIO", Color("4a2b6b"), Color("f0e8ff")],
	],




	"Paraguay": [
		["YERBA TERERE", Color("1e7a3c"), Color("f2fbf4")],
		["BANCO CHACO", Color("14406e"), Color("e6d68a")],
		["CHIPA DORADA", Color("e6d5a4"), Color("7a4a1c")],
		["SOJA DEL ESTE", Color("d7a441"), Color("362611")],
		["LUZ DEL PARANA", Color("e0a01e"), Color("2a1c08")],
		["MOTOR ASUNCION", Color("2b2f38"), Color("e8c86a")],
		["TELECOM PARANA", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS LAPACHO", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Ecuador": [
		["BANANO COSTA", Color("e0b41e"), Color("2a2008")],
		["CACAO ARRIBA", Color("4a2b1a"), Color("e8d2a8")],
		["BANCO MITAD", Color("14406e"), Color("e2ecf7")],
		["ROSAS CAYAMBE", Color("b03a5a"), Color("f7e6ef")],
		["CAMARON GUAYAS", Color("b07a5a"), Color("2a1a08")],
		["MOTOR CHIMBORAZO", Color("2b2f38"), Color("e8c86a")],
		["TELECOM VOLCAN", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS GALAPAGOS", Color("2a6f5a"), Color("eafaf0")],
	],
	"Perú": [
		["LUCUMA DEL VALLE", Color("d98a2b"), Color("2e1a08")],
		["BANCO CONDOR", Color("14406e"), Color("e6d68a")],
		["CEVICHE NORTE", Color("1d5b6b"), Color("dff2f7")],
		["PAPA ANDINA", Color("6b4a2a"), Color("efe0b0")],
		["COBRE DEL SUR", Color("b0563a"), Color("f7e2d6")],
		["LANA ALPACA", Color("e6d5a4"), Color("7a4a1c")],
		["TELECOM HUASCARAN", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS MISTI", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Bolivia": [
		["QUINUA REAL", Color("e6d5a4"), Color("7a4a1c")],
		["BANCO ALTIPLANO", Color("14406e"), Color("e2ecf7")],
		["SAL DE UYUNI", Color("f0ece0"), Color("2a5f8b")],
		["MINERA POTOSI", Color("8a8070"), Color("2a2418")],
		["SALTENA DORADA", Color("e0a01e"), Color("2a1c08")],
		["MOTOR ILLIMANI", Color("2b2f38"), Color("e8c86a")],
		["TELECOM TITICACA", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS ORIENTE", Color("2a6f5a"), Color("eafaf0")],
	],
	"Venezuela": [
		["AREPA CRIOLLA", Color("e0b41e"), Color("2a2008")],
		["CACAO CHUAO", Color("4a2b1a"), Color("e8d2a8")],
		["BANCO AVILA", Color("14406e"), Color("e6d68a")],
		["CAFE DEL LLANO", Color("7a1f2a"), Color("f0e2c8")],
		["PETRO ORINOCO", Color("1d1f24"), Color("d8dde2")],
		["MALTA CARIBE", Color("6b4a2a"), Color("efe0b0")],
		["TELECOM GUAYANA", Color("1f5f9b"), Color("eaf4ff")],
		["SEGUROS MARGARITA", Color("2a6f5a"), Color("eafaf0")],
	],
	"Japón": [
		["SAKURA DENKI", Color("b03a5a"), Color("f7e6ef")],
		["YUKI GINKO", Color("14355e"), Color("e2ecf7")],
		["MIDORI CHA", Color("1e7a3c"), Color("f2fbf4")],
		["KAISEN SUSHI", Color("1d1f24"), Color("e8e2d6")],
		["HAYASHI MOTORS", Color("9b1c1c"), Color("f4e6d0")],
		["TSUKI RAMEN", Color("7a4a1c"), Color("f0dcae")],
		["SORA MOBILE", Color("1f6f8b"), Color("eef7fa")],
		["YAMA HOKEN", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Corea del Sur": [
		["HANGANG BANK", Color("14406e"), Color("e2ecf7")],
		["KIMCHI DAERO", Color("9b1c1c"), Color("f4e6d0")],
		["DAESAN MOTORS", Color("1d1f24"), Color("d8dde2")],
		["SORI ELECTRON", Color("1f6f8b"), Color("eef7fa")],
		["NOKCHA GARDEN", Color("1e7a3c"), Color("f2fbf4")],
		["BADA SEAFOOD", Color("1d5b6b"), Color("dff2f7")],
		["BYEOL TELECOM", Color("4a2b8f"), Color("eee6ff")],
		["ANJEON BOHEOM", Color("6b2b52"), Color("f7e6ef")],
	],
	"Egipto": [
		["NIL BANK", Color("14406e"), Color("e6d68a")],
		["QUTN MISR", Color("f0ece0"), Color("2a5f8b")],
		["SHAY KARKADE", Color("9b1c3a"), Color("f7e2ea")],
		["TAMR WAHA", Color("6b4a2a"), Color("efe0b0")],
		["HAJAR ASWAN", Color("c09a5a"), Color("2a1c08")],
		["BAHR SUEZ", Color("1d5b6b"), Color("dff2f7")],
		["SHAMS TAQA", Color("e0a01e"), Color("2a1c08")],
		["TAMIN MASR", Color("4a2b6b"), Color("f0e8ff")],
	],






	"Marruecos": [
		["BANQUE ATLAS", Color("14406e"), Color("e6d68a")],
		["ARGAN SOUSS", Color("e0a01e"), Color("2a1c08")],
		["ATAY NAANAA", Color("1e7a3c"), Color("f2fbf4")],
		["SARDINE SAFI", Color("1d5b6b"), Color("dff2f7")],
		["ZELLIGE FES", Color("b0563a"), Color("f7e2d6")],
		["CIMENT TADLA", Color("8a8070"), Color("2a2418")],
		["TELECOM MAGHREB", Color("1f5f9b"), Color("eaf4ff")],
		["ASSURANCES RIF", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Túnez": [
		["BANQUE CARTHAGE", Color("14406e"), Color("e2ecf7")],
		["HUILE DE SFAX", Color("6b4a2a"), Color("efe0b0")],
		["DATTES DEGLA", Color("c09a5a"), Color("2a1c08")],
		["HARISSA CAP BON", Color("9b1c3a"), Color("f7e2ea")],
		["JASMIN MOBILE", Color("f0ece0"), Color("2a5f8b")],
		["SEL DE ZARZIS", Color("1d5b6b"), Color("dff2f7")],
		["MOTEUR KAIROUAN", Color("2b2f38"), Color("e8c86a")],
		["ASSURANCES DJERBA", Color("2a6f5a"), Color("eafaf0")],
	],







	"Nueva Zelanda": [
		["AOTEA BANK", Color("14355e"), Color("dfe8f5")],
		["PUKEKO DAIRY", Color("f0ece0"), Color("2a5f8b")],
		["KOWHAI HONEY", Color("e0a01e"), Color("2a1c08")],
		["OTAGO MERINO", Color("2f4632"), Color("efe0b0")],
		["KAIKOURA CRAYFISH", Color("1d5b6b"), Color("dff2f7")],
		["GEYSER POWER", Color("16323f"), Color("7fd4ff")],
		["RIMU MOTORS", Color("2b2f38"), Color("e8c86a")],
		["TAKAHE MOBILE", Color("4a2b6b"), Color("f0e8ff")],
	],
	"Arabia Saudí": [
		["SAHRA BANK", Color("1e7a5c"), Color("f2e08a")],
		["TAMR NAJD", Color("6b4a2a"), Color("efe0b0")],
		["QAHWA DAR", Color("4a2b1a"), Color("e8d2a8")],
		["BAHR AHMAR", Color("1d5b6b"), Color("dff2f7")],
		["SAHM MOTORS", Color("1d1f24"), Color("d8dde2")],
		["NUR TAQA", Color("e0a01e"), Color("2a1c08")],
		["SAMA TELECOM", Color("1f5f9b"), Color("eaf4ff")],
		["TAMIN KHALIJ", Color("4a2b6b"), Color("f0e8ff")],
	],
}








const LOCAL_SPONSORS_BY_FAMILY: Dictionary = {
	"es": LOCAL_SPONSORS,
	"en": [
		["BUTCHER AND SON", Color("efe7d6"), Color("8f2d2d")],
		["ANCHOR FLORIST", Color("2f4632"), Color("efe0b0")],
		["HARDWARE HILL", Color("d7a441"), Color("362611")],
		["CORNER BAKERY", Color("e6d5a4"), Color("7a4a1c")],
		["DAVIES GARAGE", Color("36414b"), Color("d7dbe0")],
		["CHIP SHOP", Color("a83a2f"), Color("efe7d6")],
	],
	"it": [
		["MACELLERIA ROSSI", Color("efe7d6"), Color("8f2d2d")],
		["FIORAIO CENTRALE", Color("2f4632"), Color("efe0b0")],
		["FERRAMENTA SOLE", Color("d7a441"), Color("362611")],
		["FORNO ANTICO", Color("e6d5a4"), Color("7a4a1c")],
		["OFFICINA BRUNO", Color("36414b"), Color("d7dbe0")],
		["PIZZA NONNA", Color("a83a2f"), Color("efe7d6")],
	],
	"de": [
		["METZGEREI HOF", Color("efe7d6"), Color("8f2d2d")],
		["GARTNEREI LINDE", Color("2f4632"), Color("efe0b0")],
		["EISENWAREN", Color("d7a441"), Color("362611")],
		["BACKEREI SONNE", Color("e6d5a4"), Color("7a4a1c")],
		["WERKSTATT WEBER", Color("36414b"), Color("d7dbe0")],
		["IMBISS ECKE", Color("a83a2f"), Color("efe7d6")],
	],
	"fr": [
		["BOUCHERIE DUPONT", Color("efe7d6"), Color("8f2d2d")],
		["CAFE DU COIN", Color("2f4632"), Color("efe0b0")],
		["QUINCAILLERIE", Color("d7a441"), Color("362611")],
		["BOULANGERIE LUC", Color("e6d5a4"), Color("7a4a1c")],
		["GARAGE MOREAU", Color("36414b"), Color("d7dbe0")],
		["CREPERIE MARIE", Color("a83a2f"), Color("efe7d6")],
	],
	"pt": [
		["TALHO DO ZE", Color("efe7d6"), Color("8f2d2d")],
		["FRUTARIA ROSA", Color("2f4632"), Color("efe0b0")],
		["DROGARIA SOL", Color("d7a441"), Color("362611")],
		["PADARIA LUZ", Color("e6d5a4"), Color("7a4a1c")],
		["OFICINA SILVA", Color("36414b"), Color("d7dbe0")],
		["CHURRASCO BOM", Color("a83a2f"), Color("efe7d6")],
	],
	"nordico": [
		["KJOTT OG FISK", Color("efe7d6"), Color("8f2d2d")],
		["FRUKT OG GRONT", Color("2f4632"), Color("efe0b0")],
		["JERN OG TRE", Color("d7a441"), Color("362611")],
		["BAGERI SOL", Color("e6d5a4"), Color("7a4a1c")],
		["BILVERKSTED", Color("36414b"), Color("d7dbe0")],
		["FISKEBOD", Color("a83a2f"), Color("efe7d6")],
	],
	"eslavo": [
		["MESNICA DOM", Color("efe7d6"), Color("8f2d2d")],
		["CVECARA STARA", Color("2f4632"), Color("efe0b0")],
		["ZELEZO ALAT", Color("d7a441"), Color("362611")],
		["PEKARA ZORA", Color("e6d5a4"), Color("7a4a1c")],
		["SERVIS AUTO", Color("36414b"), Color("d7dbe0")],
		["BUREK KUTAK", Color("a83a2f"), Color("efe7d6")],
	],






	"ro": [
		["MACELARIE DOREL", Color("efe7d6"), Color("8f2d2d")],
		["FLORARIA ROZA", Color("2f4632"), Color("efe0b0")],
		["FERONERIE", Color("d7a441"), Color("362611")],
		["BRUTARIE SOARE", Color("e6d5a4"), Color("7a4a1c")],
		["SERVICE AUTO ION", Color("36414b"), Color("d7dbe0")],
		["COVRIGI CALZI", Color("a83a2f"), Color("efe7d6")],
	],
	"levante": [
		["LAHAM AL BALAD", Color("efe7d6"), Color("8f2d2d")],
		["MAQHA AL RUKN", Color("2f4632"), Color("efe0b0")],
		["HADID WA ADAD", Color("d7a441"), Color("362611")],
		["MAKHBAZ NUR", Color("e6d5a4"), Color("7a4a1c")],
		["WARSHAT SAMI", Color("36414b"), Color("d7dbe0")],
		["FALAFEL SUQ", Color("a83a2f"), Color("efe7d6")],
	],
	"asia": [
		["NIKU NO MISE", Color("efe7d6"), Color("8f2d2d")],
		["SHOKUDO KADO", Color("2f4632"), Color("efe0b0")],
		["KANAMONO YA", Color("d7a441"), Color("362611")],
		["PAN NO MISE", Color("e6d5a4"), Color("7a4a1c")],
		["JIDOSHA SEIBI", Color("36414b"), Color("d7dbe0")],
		["RAMEN YOKO", Color("a83a2f"), Color("efe7d6")],
	],
}



const LOCAL_FAMILY: Dictionary = {
	"España": "es", "México": "es", "Argentina": "es", "Chile": "es",
	"Colombia": "es", "Uruguay": "es",
	"Paraguay": "es", "Ecuador": "es", "Perú": "es", "Bolivia": "es", "Venezuela": "es",
	"Inglaterra": "en", "Escocia": "en", "Estados Unidos": "en",
	"Italia": "it",
	"Alemania": "de", "Austria": "de", "Suiza": "de", "Países Bajos": "de",
	"Francia": "fr", "Bélgica": "fr",
	"Portugal": "pt", "Brasil": "pt",
	"Dinamarca": "nordico", "Noruega": "nordico",
	"Chequia": "eslavo", "Croacia": "eslavo", "Serbia": "eslavo",
	"Ucrania": "eslavo", "Grecia": "eslavo",
	"Turquía": "levante", "Egipto": "levante", "Arabia Saudí": "levante",


	"Marruecos": "levante", "Túnez": "levante",
	"Japón": "asia", "Corea del Sur": "asia",


	"Nueva Zelanda": "en",



	"Suecia": "nordico", "Rumanía": "ro",



	"Bosnia y Herzegovina": "eslavo",
}






static func sponsors_for(country: String, local: bool) -> Array:
	if local:
		var fam: String = String(LOCAL_FAMILY.get(country, ""))
		return LOCAL_SPONSORS_BY_FAMILY.get(fam, LOCAL_SPONSORS)
	return COUNTRY_SPONSORS.get(country, SPONSORS)






















const AD_RING_X: float = 39.3



const SIDE_STAND_X: float = 41.5


const SIDE_CORNER_X: float = 44.0
const AD_H: float = 0.9


const AD_SEG_M: float = 3.6






const STAND_SLOPE_DEG: float = 32.0
const STAND_SLOPE_FOOT_Y: float = 0.99
const STAND_SLOPE_FOOT_Z: float = -1.5





const STAND_FAN_ROW_DZ: float = 0.68
const STAND_FAN_SPACING: float = 0.9





const FAN_STAND_Y: float = 0.75




















const DIV_STANDS: Dictionary = {
	1: {"slope": 26.0, "rows": 19, "roof": true, "banners": true,
		"dugout_roof": true, "catwalk": true, "net_worn": false,
		"pylons": "full", "ends": "full", "worn": false},
	2: {"slope": 17.0, "rows": 12, "roof": true, "banners": true,
		"dugout_roof": true, "catwalk": true, "net_worn": false,
		"pylons": "modest", "ends": "full", "worn": false},
	3: {"slope": 9.0, "rows": 6, "roof": false, "banners": false,
		"dugout_roof": false, "catwalk": false, "net_worn": true,




		"pylons": "poles", "ends": "open", "worn": true, "fence": true},
}





















const DIV_DUGOUT: Dictionary = {
	1: {"len": 10.6, "seats": 9, "glass": true, "bucket": true, "staff": 2,
		"props": "full", "coats": false},
	2: {"len": 9.4, "seats": 7, "glass": false, "bucket": true, "staff": 1,
		"props": "basic", "coats": false},
	3: {"len": 6.6, "seats": 5, "glass": false, "bucket": false, "staff": 0,
		"props": "crate", "coats": true},
}

































const DIV_FOOTPRINTS: Dictionary = {








	1: ["bowl_closed", "bowl_round", "horseshoe",
		"cubierta_membrana", "fondo_kop", "fondo_arco", "pantallon",
		"campo_hundido", "muro_de_pie", "tres_anillos", "fondo_banderas",
		"catedral", "velas", "coliseo"],
	2: ["bowl_closed", "rect_open", "horseshoe", "athletics", "fondo_bloques",
		"gradas_tubo", "dos_aguas", "campo_hundido", "fondo_banderas",
		"tribuna_postes", "torre_reloj", "fondo_chimeneas", "eul_principal"],
	3: ["main_L", "two_side", "rect_open", "athletics", "sin_fondo_arboles",
		"terraplen", "gradas_tubo", "campo_coches", "fondo_chimeneas"],
}






































const FOOTPRINT_TIERS: Dictionary = {
	1: {"alto": ["fondo_kop", "fondo_arco", "cubierta_membrana", "pantallon",
			"muro_de_pie", "tres_anillos", "fondo_banderas"],
		"medio": ["bowl_closed", "bowl_round", "cubierta_membrana", "pantallon",
			"catedral", "velas"],
		"bajo": ["horseshoe", "campo_hundido", "bowl_round", "coliseo"]},
	2: {"alto": ["bowl_closed", "horseshoe", "dos_aguas", "fondo_banderas",
			"tribuna_postes", "eul_principal"],
		"medio": ["rect_open", "fondo_bloques", "dos_aguas", "campo_hundido",
			"torre_reloj", "fondo_chimeneas"],
		"bajo": ["athletics", "gradas_tubo", "fondo_bloques"]},
	3: {"alto": ["main_L", "rect_open", "gradas_tubo"],
		"medio": ["main_L", "athletics", "terraplen", "rect_open",
			"fondo_chimeneas"],
		"bajo": ["two_side", "sin_fondo_arboles", "terraplen", "campo_coches"]},
}



const BAND_CUTS: Dictionary = {1: [88, 82], 2: [76, 71], 3: [65, 61]}
const DIV_R_RANGE: Dictionary = {1: [78, 99], 2: [67, 80], 3: [57, 69]}














const TRACK_INNER_HX: float = 36.5
const TRACK_STRAIGHT_HZ: float = 42.2
const TRACK_W: float = 6.6
const TRACK_LANES: int = 6
const TRACK_SURF: Color = Color("9c4a35")
const TRACK_LANE: Color = Color("d8d2c8")


const TRACK_TEX_MARGIN: float = 1.2




const TRACK_PUSH: float = 9.0
const TRACK_PUSH_Z: float = 21.0











const DIV_ADS: Dictionary = {
	1: {"brands": 8, "led": true, "scroll": true, "dull": 0.0, "pulse": 1.0},
	2: {"brands": 8, "led": false, "scroll": false, "dull": 0.14, "pulse": 0.35},

	3: {"brands": 3, "led": false, "scroll": false, "dull": 0.22, "pulse": 0.0, "local": true},
}
















const DIV_SCOREBOARD: Dictionary = {
	1: {"present": true, "scale": 1.0, "t": 0.72, "emissive": true, "emission": 0.4,
		"manual": false, "clock": false,
		"frame": Color("22262e"), "bg": Color("0d1118"), "ink": Color("ffd54a")},
	2: {"present": true, "scale": 0.58, "t": 0.74, "emissive": true, "emission": 0.22,
		"manual": false, "clock": true,
		"frame": Color("22262e"), "bg": Color("0d1118"), "ink": Color("ffd54a")},









	3: {"present": false, "scale": 0.5, "t": 0.76, "emissive": false, "emission": 0.0,
		"manual": true, "clock": false,
		"frame": Color("6b5a3e"), "bg": Color("8d9298"), "ink": Color("1a1c1f")},
}












const DIV_SKYLINE: Dictionary = {
	1: {"h_min": 34.0, "h_max": 72.0, "tier_h": 10.0, "w_min": 10.0, "w_max": 18.0,
		"count": 34, "haze": 0.7, "tint": [Color("8d9bb0"), Color("9fb0c4"), Color("b7c6d8")],





		"rich": true, "extra": 16,
		"shapes": {"box": 0.5, "cyl": 0.18, "stepped": 0.2, "twin": 0.12}},
	2: {"h_min": 15.0, "h_max": 34.0, "tier_h": 5.0, "w_min": 12.0, "w_max": 22.0,
		"count": 30, "haze": 0.6, "tint": [Color("9a9488"), Color("aca699"), Color("c2beb2")]},
	3: {"h_min": 5.0, "h_max": 12.0, "tier_h": 2.0, "w_min": 16.0, "w_max": 30.0,
		"count": 26, "haze": 0.45, "tint": [Color("8a6f5a"), Color("9c8368"), Color("b39c82")]},
}































const COUNTRY_SKYLINE: Dictionary = {

	"Inglaterra": {"squat": 1.15, "seed": 8811, "tall": 0.85, "dense": 1.05,
		"shapes": {"box": 0.74, "stepped": 0.16, "twin": 0.1},
		"tint": [Color("8a6a5f"), Color("9b7c70"), Color("b09488")]},

	"España": {"squat": 1.3, "seed": 4402, "tall": 0.92, "dense": 1.15,
		"shapes": {"box": 0.84, "stepped": 0.16},
		"tint": [Color("b0a184"), Color("c0b295"), Color("d2c6ac")]},
	"Italia": {"squat": 1.25, "seed": 5127, "tall": 0.88, "dense": 1.12,
		"shapes": {"box": 0.88, "stepped": 0.12},
		"tint": [Color("b09372"), Color("c0a484"), Color("d0b79b")]},
	"Portugal": {"squat": 1.3, "seed": 3390, "tall": 0.86, "dense": 1.1,
		"shapes": {"box": 0.9, "stepped": 0.1},
		"tint": [Color("b6ab90"), Color("c5bb9f"), Color("d6cdb4")]},

	"Alemania": {"squat": 0.95, "seed": 7714, "tall": 1.0, "dense": 1.05,
		"shapes": {"box": 0.6, "cyl": 0.14, "stepped": 0.26},
		"tint": [Color("8e97a0"), Color("a0a9b2"), Color("b8c0c8")]},
	"Países Bajos": {"squat": 0.9, "seed": 6650, "tall": 0.95, "dense": 1.0,
		"shapes": {"box": 0.78, "stepped": 0.22},
		"tint": [Color("8b7f7a"), Color("9d918b"), Color("b5aaa4")]},
	"Francia": {"squat": 1.05, "seed": 2288, "tall": 0.9, "dense": 1.08,
		"shapes": {"box": 0.86, "stepped": 0.14},
		"tint": [Color("9d9a90"), Color("aeaba1"), Color("c3c0b6")]},


	"México": {"squat": 1.2, "seed": 9903, "tall": 0.88, "dense": 1.3,
		"shapes": {"box": 0.94, "stepped": 0.06},
		"tint": [Color("a08a72"), Color("b39c82"), Color("c7b295")]},










	"Brasil": {"squat": 0.85, "seed": 1207, "tall": 1.25, "dense": 1.15,
		"shapes": {"box": 0.52, "twin": 0.3, "stepped": 0.18},
		"tint": [Color("c0a894"), Color("cdb8a4"), Color("dac8b6")]},



	"Argentina": {"squat": 1.0, "seed": 3011, "tall": 0.95, "dense": 1.25,
		"shapes": {"box": 0.88, "stepped": 0.12},
		"tint": [Color("9b8b7e"), Color("ac9c8f"), Color("c0b1a4")]},


	"Japón": {"squat": 0.78, "seed": 8102, "tall": 1.2, "dense": 1.3,
		"shapes": {"box": 0.7, "stepped": 0.24, "twin": 0.06},
		"tint": [Color("7f8a86"), Color("929c98"), Color("aab3af")]},





	"Estados Unidos": {"squat": 1.2, "seed": 7602, "tall": 1.15, "dense": 0.95,
		"shapes": {"box": 0.42, "cyl": 0.22, "stepped": 0.26, "twin": 0.1},
		"tint": [Color("7f8894"), Color("929ba7"), Color("aeb7c3")]},










	"Turquía": {"squat": 1.05, "seed": 5540, "tall": 1.0, "dense": 1.3,
		"shapes": {"box": 0.86, "stepped": 0.14},
		"tint": [Color("ab9086"), Color("bba197"), Color("cdb6ac")]},





	"Grecia": {"squat": 1.05, "seed": 6218, "tall": 0.8, "dense": 1.15,
		"shapes": {"box": 0.93, "stepped": 0.07},
		"tint": [Color("c6bfb0"), Color("d3cdc0"), Color("e0dbd0")]},



	"Escocia": {"squat": 1.1, "seed": 4173, "tall": 0.82, "dense": 1.1,
		"shapes": {"box": 0.8, "stepped": 0.2},
		"tint": [Color("83807c"), Color("95928e"), Color("aeaba7")]},




	"Noruega": {"squat": 0.95, "seed": 9086, "tall": 0.72, "dense": 0.9,
		"shapes": {"box": 0.74, "stepped": 0.26},
		"tint": [Color("96695c"), Color("a87c6d"), Color("bd9587")]},











	"Arabia Saudí": {"squat": 1.15, "seed": 2704, "tall": 1.1, "dense": 0.85,
		"shapes": {"box": 0.6, "cyl": 0.18, "stepped": 0.22},
		"tint": [Color("c3b08c"), Color("d0c09e"), Color("dccfb2")]},




	"Egipto": {"squat": 1.1, "seed": 8360, "tall": 0.95, "dense": 1.35,
		"shapes": {"box": 0.92, "stepped": 0.08},
		"tint": [Color("a8846a"), Color("b8967c"), Color("c9aa92")]},



	"Bélgica": {"squat": 0.85, "seed": 1519, "tall": 0.9, "dense": 1.2,
		"shapes": {"box": 0.84, "stepped": 0.16},
		"tint": [Color("8f7a6e"), Color("a08b7e"), Color("b5a094")]},


	"Ucrania": {"squat": 1.35, "seed": 4832, "tall": 0.85, "dense": 1.15,
		"shapes": {"box": 0.95, "stepped": 0.05},
		"tint": [Color("a19b8f"), Color("b0aa9d"), Color("c2bdb0")]},

	"Austria": {"squat": 1.1, "seed": 7091, "tall": 0.9, "dense": 1.1,
		"shapes": {"box": 0.8, "stepped": 0.2},
		"tint": [Color("bdae97"), Color("c9bca6"), Color("d8ccb9")]},



	"Suiza": {"squat": 1.05, "seed": 6377, "tall": 0.75, "dense": 0.95,
		"shapes": {"box": 0.82, "stepped": 0.18},
		"tint": [Color("aeb0a8"), Color("bcbeb6"), Color("cdcfc7")]},

	"Chequia": {"squat": 1.15, "seed": 3948, "tall": 0.85, "dense": 1.15,
		"shapes": {"box": 0.86, "stepped": 0.14},
		"tint": [Color("b09079"), Color("bfa08b"), Color("cdb39e")]},

	"Croacia": {"squat": 1.25, "seed": 5603, "tall": 0.8, "dense": 1.1,
		"shapes": {"box": 0.9, "stepped": 0.1},
		"tint": [Color("c2b69c"), Color("cec3ab"), Color("dbd2bd")]},

	"Serbia": {"squat": 1.25, "seed": 2265, "tall": 1.0, "dense": 1.0,
		"shapes": {"box": 0.7, "stepped": 0.3},
		"tint": [Color("94918c"), Color("a5a29d"), Color("bab7b2")]},

	"Dinamarca": {"squat": 1.0, "seed": 9427, "tall": 0.8, "dense": 1.15,
		"shapes": {"box": 0.85, "stepped": 0.15},
		"tint": [Color("a3806e"), Color("b3927f"), Color("c4a893")]},


	"Corea del Sur": {"squat": 0.9, "seed": 1846, "tall": 1.3, "dense": 1.25,
		"shapes": {"box": 0.8, "twin": 0.12, "stepped": 0.08},
		"tint": [Color("a8adb0"), Color("b6babd"), Color("c8ccce")]},

	"Colombia": {"squat": 1.0, "seed": 5178, "tall": 1.05, "dense": 1.2,
		"shapes": {"box": 0.78, "stepped": 0.22},
		"tint": [Color("9c6a55"), Color("ad7d67"), Color("bf947e")]},

	"Chile": {"squat": 1.05, "seed": 8714, "tall": 1.0, "dense": 1.05,
		"shapes": {"box": 0.7, "cyl": 0.1, "stepped": 0.2},
		"tint": [Color("b0a394"), Color("beb2a3"), Color("cec4b6")]},


	"Uruguay": {"squat": 1.1, "seed": 3392, "tall": 0.85, "dense": 1.15,
		"shapes": {"box": 0.88, "stepped": 0.12},
		"tint": [Color("aaa599"), Color("b8b4a7"), Color("c9c5b9")]},





	"Paraguay": {"squat": 1.15, "seed": 6104, "tall": 0.8, "dense": 0.95,
		"shapes": {"box": 0.9, "stepped": 0.1},
		"tint": [Color("b0a184"), Color("c0b295"), Color("d2c6ac")]},


	"Ecuador": {"squat": 1.05, "seed": 7238, "tall": 0.95, "dense": 1.15,
		"shapes": {"box": 0.8, "stepped": 0.2},
		"tint": [Color("b6ab90"), Color("c5bb9f"), Color("d6cdb4")]},


	"Perú": {"squat": 1.1, "seed": 2519, "tall": 0.85, "dense": 1.25,
		"shapes": {"box": 0.9, "stepped": 0.1},
		"tint": [Color("94918c"), Color("a5a29d"), Color("bab7b2")]},


	"Bolivia": {"squat": 0.95, "seed": 4766, "tall": 0.95, "dense": 1.25,
		"shapes": {"box": 0.85, "stepped": 0.15},
		"tint": [Color("9c6a55"), Color("ad7d67"), Color("bf947e")]},


	"Venezuela": {"squat": 0.9, "seed": 8425, "tall": 1.15, "dense": 1.15,
		"shapes": {"box": 0.7, "twin": 0.15, "stepped": 0.15},
		"tint": [Color("c0a894"), Color("cdb8a4"), Color("dac8b6")]},




	"Marruecos": {"squat": 1.15, "seed": 4791, "tall": 0.9, "dense": 1.3,
		"shapes": {"box": 0.82, "twin": 0.06, "stepped": 0.12},
		"tint": [Color("ab9086"), Color("bba197"), Color("cdb6ac")]},


	"Túnez": {"squat": 1.2, "seed": 9572, "tall": 0.78, "dense": 1.25,
		"shapes": {"box": 0.93, "stepped": 0.07},
		"tint": [Color("c6bfb0"), Color("d3cdc0"), Color("e0dbd0")]},





	"Nueva Zelanda": {"squat": 1.2, "seed": 5866, "tall": 0.82, "dense": 0.8,
		"shapes": {"box": 0.84, "cyl": 0.04, "stepped": 0.12},
		"tint": [Color("7f8a86"), Color("929c98"), Color("aab3af")]},





	"Suecia": {"squat": 1.05, "seed": 6931, "tall": 0.82, "dense": 0.95,
		"shapes": {"box": 0.84, "twin": 0.04, "stepped": 0.12},
		"tint": [Color("b09079"), Color("bfa08b"), Color("cdb39e")]},



	"Rumanía": {"squat": 0.95, "seed": 3457, "tall": 0.92, "dense": 1.2,
		"shapes": {"box": 0.88, "stepped": 0.12},
		"tint": [Color("94918c"), Color("a5a29d"), Color("bab7b2")]},





	"Bosnia y Herzegovina": {"squat": 1.15, "seed": 4519, "tall": 0.85, "dense": 1.1,
		"shapes": {"box": 0.86, "stepped": 0.14},
		"tint": [Color("c2b69c"), Color("cec3ab"), Color("dbd2bd")]},
}




const COUNTRY_ROOF: Dictionary = {
	"España": "campanario", "Italia": "campanario", "Portugal": "campanario",
	"Inglaterra": "chimenea",
	"Alemania": "gablete", "Países Bajos": "gablete", "Francia": "gablete",
	"México": "tinaco",
	"Brasil": "laje", "Argentina": "tanque",
	"Japón": "cartel", "Estados Unidos": "torre_agua",
	"Turquía": "minarete", "Grecia": "cupula",
	"Escocia": "canones", "Noruega": "aguja",
	"Arabia Saudí": "minarete", "Egipto": "laje",
	"Bélgica": "escalones", "Ucrania": "cupula",
	"Austria": "aguja", "Suiza": "alero",
	"Chequia": "campanario", "Croacia": "campanario",
	"Serbia": "cupula", "Dinamarca": "aguja",
	"Corea del Sur": "cartel", "Colombia": "tanque",
	"Chile": "tinaco", "Uruguay": "tanque",



	"Paraguay": "tanque", "Ecuador": "tinaco", "Perú": "laje",
	"Bolivia": "laje", "Venezuela": "tinaco",


	"Marruecos": "minarete", "Túnez": "cupula",


	"Nueva Zelanda": "gablete",



	"Suecia": "aguja", "Rumanía": "cupula",


	"Bosnia y Herzegovina": "minarete",
}

const COUNTRY_ROOF_P: Dictionary = {
	"campanario": 0.16,
	"chimenea": 0.24,
	"gablete": 0.55,
	"tinaco": 0.7,
	"laje": 0.62,
	"tanque": 0.66,
	"cartel": 0.4,
	"torre_agua": 0.14,
	"minarete": 0.13,
	"cupula": 0.09,
	"canones": 0.55,
	"aguja": 0.62,
	"escalones": 0.45,
	"alero": 0.6,
}







const COUNTRY_DRY: Array = ["España", "Italia", "Portugal", "México",
	"Argentina", "Estados Unidos", "Turquía", "Grecia",
	"Arabia Saudí", "Egipto", "Croacia", "Chile",
	"Perú", "Bolivia",
	"Marruecos", "Túnez"]
const COUNTRY_TILE: Array = ["España", "Italia", "Portugal", "México",
	"Argentina", "Brasil", "Turquía", "Grecia",
	"Croacia", "Chequia", "Austria", "Colombia", "Chile", "Uruguay",
	"Paraguay", "Ecuador",
	"Rumanía",
	"Bosnia y Herzegovina"]



const COUNTRY_CONIFER: Array = ["Noruega", "Suiza", "Austria",
	"Suecia",
	"Bosnia y Herzegovina"]













const RAIL_DIST: float = 175.0





const RAIL_Y: float = 19.0
const RAIL_HALF: float = 220.0
const RAIL_DECK: Color = Color("6f6a63")
const RAIL_SPEED: float = 26.0
const RAIL_GAP_MIN: float = 46.0
const RAIL_GAP_MAX: float = 112.0
const RAIL_CARS: int = 6
const RAIL_CAR_LEN: float = 12.5



const RAIL_CAR_H: float = 4.4






const TREN_CARROCERIA: Color = Color("c9472f")
const TREN_PUERTA: Color = Color("a83a27")
const TREN_FRANJA: Color = Color("efe9dc")
const TREN_TECHO: Color = Color("7d8187")
const TREN_BAJOS: Color = Color("24262b")
const TREN_CRISTAL: Color = Color("2b3442")
const TREN_LARGO_COCHE: float = 11.7
const TREN_MORRO: float = 0.9

var _rail_node: Node3D = null
var _rail_glow: MeshInstance3D = null

var _rail_wait: float = 0.0


var _rail_dir: float = 1.0
var _rail_x: float = 0.0
var _rail_center_x: float = 0.0















const COUNTRY_LANDMARK: Dictionary = {
	"España": "campanario", "Inglaterra": "torre_reloj", "Italia": "cupula_grande",
	"Alemania": "torre_tv", "Francia": "torre_celosia", "Portugal": "puente",
	"Países Bajos": "molino", "México": "piramide_esc", "Brasil": "montana",
	"Argentina": "obelisco", "Estados Unidos": "rascacielos", "Japón": "torre_celosia",
	"Turquía": "mezquita", "Grecia": "acropolis", "Escocia": "castillo",
	"Noruega": "montana", "Arabia Saudí": "rascacielos", "Egipto": "piramide",
	"Bélgica": "puerto", "Ucrania": "cupula_grande", "Austria": "montana",
	"Suiza": "montana", "Chequia": "castillo", "Croacia": "faro",
	"Serbia": "torre_tv", "Dinamarca": "puente", "Corea del Sur": "torre_tv",
	"Colombia": "montana", "Chile": "montana", "Uruguay": "faro",




	"Paraguay": "cupula_grande", "Ecuador": "montana", "Perú": "piramide_esc",
	"Bolivia": "montana", "Venezuela": "rascacielos",



	"Marruecos": "mezquita", "Túnez": "acropolis",


	"Nueva Zelanda": "torre_tv",




	"Suecia": "torre_tv", "Rumanía": "cupula_grande",




	"Bosnia y Herzegovina": "montana",
}








const FLARE_MAX: int = 6
const FLARE_MAX_PLAIN: int = 3










const FLARE_ODDS_DERBY: float = 0.18
const FLARE_ODDS_PLAIN: float = 0.07














var flare_cap: int = -1
var flare_odds: float = 1.0



const NAT_HEAT_MIN: float = 0.45



const FLARE_SPOTS_MAX: int = 24
const GOAL_FLARES: int = 2














const FLASH_SPOTS_MAX: int = 1000



const FLASH_DUR: Dictionary = {"kickoff": 5.5, "goal": 4.5, "spot": 3.0}


const FLASH_ON: float = 0.055
const FLASH_GAP_MIN: float = 0.15
const FLASH_GAP_MAX: float = 0.9



const FLASH_TICK: float = 0.042







const SHAFT_LEN: float = 62.0
const SHAFT_TOP_R: float = 2.6
const SHAFT_BOT_R: float = 26.0



const SHAFT_ALPHA: Dictionary = {"rain": 0.085, "snow": 0.115}




const FLOOD_ENERGY: float = 6.5
const FLOOD_PANEL_NIGHT: float = 2.2





const DUSK_UNTIL: float = 95.0
const DUSK_TILT: float = 9.0
const DUSK_SWEEP: float = 13.0
const DUSK_DIM: float = 0.55
const DUSK_AMBIENT: float = 0.72
const DUSK_SKY: float = 0.55




const DUSK_FLOOD_FROM: float = 0.3
const DUSK_FLOOD_LATE: float = 0.55









const CLOUD_SHADOW: Dictionary = {
	"day": 1.0, "sunset": 0.8, "overcast": 0.0,
	"rain": 0.0, "night": 0.0, "snow": 0.0,
}




const CLOUD_WIND_MUL: float = 2.4
const CLOUD_DRIFT_MIN: float = 1.3







const LITTER_MAX: int = 3
const LITTER_GAP_MIN: float = 9.0
const LITTER_GAP_MAX: float = 26.0



const LITTER_WIND_MIN: float = Weather.WIND_CALM





const LITTER_ENTER_R: float = 68.0
const LITTER_EXIT_R: float = 78.0




const PIGEON_MAX: int = 4
const PIGEON_Y: float = 0.16
const PIGEON_FLY_S: float = 1.5
const PIGEON_HOP_S: float = 0.25







const PIGEON_SPREAD: float = 2.2
const PIGEON_KEEP: float = 13.0












const PIGEON_Z_NEAR: float = 20.0










const PIGEON_GAP_MIN: float = 6.0
const PIGEON_GAP_MAX: float = 15.0









const PIGEON_SCARE: float = 0.22















































const PIGEON_HIT_R: float = 1.1













const PIGEON_UP_H: float = 5.5
const PIGEON_UP_Y: float = 6.5






const PIGEON_FLEE_H: float = 8.5
const PIGEON_FLEE_Y: float = 3.2













































const PIGEON_FLEE_R: float = 1.3


const PIGEON_KNOCK_H: float = 12.0
const PIGEON_KNOCK_Y: float = 4.5



const FEATHER_N: int = 24
const FEATHER_LIFE: float = 3.4






const MOTH_PER_TOWER: int = 9




const MOTH_SIZE: float = 0.3
const MOTH_R_MIN: float = 1.2
const MOTH_R_MAX: float = 3.4



const MOTH_DROP: float = 2.6
const MOTH_SPIN_MIN: float = 0.9
const MOTH_SPIN_MAX: float = 2.6
const MOTH_BOB: float = 0.5
const MOTH_TICK: float = 0.05










const SPRINK_X: float = 35.6
const SPRINK_Z_SIDE: Array[float] = [26.0, 79.0]
const SPRINK_END_Z: float = 3.5
const SPRINK_AMOUNT: int = 140
const SPRINK_LIFE: float = 1.5
const SPRINK_SWEEP_DEG: float = 96.0
const SPRINK_SWEEP_S: float = 3.2
























const SPRINK_SIDE_N: int = 4



const SPRINK_HIT_R: float = 0.45




const SPRINK_HIT_H: float = 0.9












const SPRINK_BENT_PITCH: float = -22.0
const SPRINK_BENT_ROLL: float = 26.0
const SPRINK_BENT_YAW: float = 62.0




const SPRINK_BROKEN_AMOUNT: int = 70






const SPRINK_WOBBLE_DEG: float = 7.0
const SPRINK_WOBBLE_S: float = 5.4



const SOAK_MAX: float = 0.55
const SOAK_WET_S: float = 4.0
const SOAK_DRY_S: float = 150.0







const TONGUE_MAX: int = 2
const TONGUE_AMOUNT: int = 14
const TONGUE_LIFE: float = 7.0
const TONGUE_Y_MIN: float = 3.5
const TONGUE_Y_MAX: float = 7.0
const TONGUE_SPEED_MUL: float = 0.85



const TONGUE_TOWARD_CAM: float = 0.55















const BOARD_GRIP: float = 0.1






const ADDED_BOARD_SIZE: Vector2 = Vector2(1.15, 0.77)










const SUB_BOARD_Y: float = 1.02
const ADDED_BOARD_Y: float = 2.15
const ADDED_BOARD_HOLD: float = 5.0



const ADDED_BOARD_DIP: float = 0.08
const ADDED_BOARD_SWAY: float = 22.0



const BOARD_AMBER: Color = Color("ffb020")
const BOARD_OFF: Color = Color("17110a")































const DIV_PITCH: Dictionary = {
	1: {"mow": [1, 2, 4, 6, 7, 8], "contrast": 1.0,
		"dull": 0.0, "wear": 0.0, "mud": 0.0, "bald": 0.0, "dirty_lines": 0.0},
	2: {"mow": [1, 4, 6], "contrast": 0.55,
		"dull": 0.18, "wear": 0.35, "mud": 0.12, "bald": 0.0, "dirty_lines": 0.2},
	3: {"mow": [], "contrast": 0.3,
		"dull": 0.42, "wear": 1.0, "mud": 0.62, "bald": 0.6, "dirty_lines": 0.55},
}























const MOW_CLUB: Array[int] = [1, 2, 4, 6, 7, 8]

const GRASS_DRY: Color = Color("7d8f42")
const GRASS_MUD: Color = Color("4e3b26")
const GRASS_DULL: Color = Color("5c6b3a")




var div: int = 0





var footprint: String = ""





var boxes_style: String = ""








var crowd_all_nodes: bool = false





var _box_half_x: float = -1.0










var _box_band_y: Vector2 = Vector2(INF, - INF)






var _muro_club: Array[Node3D] = []






var _side_roots: Array[Dictionary] = []












var _side_views: Array[Dictionary] = []



var _stand_roots: Array[Node3D] = []













var _roof_boxes: Array[Dictionary] = []




var _roof_low_y: float = INF










var _box_vols: Array[Dictionary] = []







var _box_main_pos: Vector3 = Vector3.INF

const BOX_SUITE_W: float = 0.72


const BOX_TOLDO: float = 2.0
const BOX_TOLDO_DEG: float = 14.0
const BOX_TOLDO_RAYA: float = 2.4


const BOX_STYLE_POOL: Dictionary = {
	1: ["glass", "glass", "suites", "vip"],
	2: ["glass", "suites", "vip", "vip"],
}


const BOX_MAIN_MIN_LEN: float = 40.0
var _box_low_y: float = INF
var _box_high_y: float = - INF


var _box_glass: Array[StandardMaterial3D] = []


var _box_people: Array[StandardMaterial3D] = []



var _box_crowd: Array[Dictionary] = []





































var _box_panes: Array[Dictionary] = []


var _box_panes_rompibles: int = 0



var _pitch_box_cands: Array[Dictionary] = []







var _box_panes_aabb: AABB = AABB()
var _box_panes_ready: bool = false






const PANE_AIM_DT: float = 0.02
const PANE_AIM_STEPS: int = 120


















const SPOOK_S: float = 1.9
const SPOOK_BLINK: float = 0.4
const SPOOK_R: float = 9.0


var _spook_gen: int = 0


var _calm_gen: int = 0





const BOX_UV_SCALE: Vector3 = Vector3(1.0, 0.164, 1.0)








const BOX_UV_POSE: Array[float] = [0.002, 0.169, 0.335, 0.502, 0.669, 0.835]










const BOX_BAND_CAIDA: Array = [
	[0.0, 0.0],
	[0.0, 0.0],
	[0.5, 0.0],
	[-1.0, 0.0],
	[-1.0, 0.5],
	[-1.0, -1.0],
]
var _spook_t: float = 0.0








var _crack_tex: Dictionary = {}




const BOX_BAND: float = 2.6


const BOX_DEPTH: float = 0.55




const BOX_SB_AIR: float = 0.35









var _near_box_top_y: float = - INF



const BOX_CANTO: Dictionary = {"glass": 0.28, "suites": 0.7, "vip": 0.25}



const BOX_PHASES: int = 4
const BOX_BLINK: float = 2.4


var _box_people_tex: ImageTexture = null





static var _box_people_cache: ImageTexture = null




var _has_near_end: bool = false







var _has_side_stand: Array[bool] = [false, false]









var _has_far_end: bool = false









var _near_end_scale: float = 1.0




var _near_end_y: float = 0.0


var weather: Dictionary = {}






var puddles: Puddles = null


var puddle_seed: int = 0









var rain_tier: int = -1




var _puddle_tier: int = -9



var _puddle_model: Puddles = null




var _puddle_tex: ImageTexture = null





var _marks_tex: ImageTexture = null
var _sweep_tex: ImageTexture = null














const TREAD_TEXELS_PER_M: float = 2.0



const TREAD_HZ: float = 6.0



const TREAD_HIT: float = 0.42
const TREAD_R_M: float = 0.34
var _tread_img: Image = null
var _tread_tex: ImageTexture = null
var _tread_dirty: bool = false
var _tread_cd: float = 0.0
























const TREAD_PRINTS: int = 2048













const TREAD_PRINT_L: float = 0.352
const TREAD_PRINT_W: float = 0.19




const TREAD_FOOT_GAP: float = 0.17


const TREAD_PRINT_Y: float = 0.018












const TREAD_FADE: Dictionary = {"rain": 40.0}
var _prints_mat: ShaderMaterial = null
var _prints_mmi: MultiMeshInstance3D = null
var _prints_mm: MultiMesh = null
var _print_turn: int = 0



var _prints_total: int = 0








var _tread_clock: float = 0.0














const BAR_SNOW_SEGS: int = 13



const BAR_SNOW_RADIO: int = 1






const BAR_SNOW_H: float = 0.085
const BAR_SNOW_VUELO: float = 0.17














var _snow_caps: Array[MeshInstance3D] = []



var _snow_cap_mat: StandardMaterial3D = null
var _bar_snow: Array[MeshInstance3D] = []



var _bar_snow_gone: Array[bool] = []
var _bar_snow_fall: GeometryInstance3D = null







var _tube_spray_p: GeometryInstance3D = null
var _net_drip_p: GeometryInstance3D = null



var _att: float = -1.0


var _att_away: float = -1.0








const NEUTRAL_FILL: float = 0.97

var _derby: bool = false



























var venue_empty: bool = false
























var dugout_views: bool = false
var att_override: float = -1.0


var home_only: bool = false

var party: bool = false









var backdrop: bool = false








var crowd_blocks: bool = false



var home_kit: Dictionary = {}


var banner_text: String = ""



var home_club: String = ""




var _league_div: int = 0





var _size_f: float = 0.0
var _club_tier_v: String = ""

















const NIGHT_POMP: Dictionary = {
	"ucl": 1.0, "cwc": 0.92, "nat": 0.88, "eul": 0.75, "conf": 0.58,





	"lib": 0.95, "cca": 0.85, "sud": 0.74,


	"ace": 0.85, "ac2": 0.74,


	"caf": 0.85, "cf2": 0.74,


	"ofc": 0.74,
}



const NIGHT_RING_EMISSION: float = 2.6


const NIGHT_SEAT: Color = Color("2a2e36")











const NIGHT_FOOTPRINT: Dictionary = {
	"ucl": "ucl_anillos",





	"eul": "principal_doble",
	"conf": "conf_caldera",
	"cwc": "octagono",
	"nat": "mundial_membrana",
}


















const RING_FOOTPRINTS: Array = ["ucl_anillos", "mundial_membrana",
	"eul_principal", "conf_caldera", "principal_doble",
	"cubierta_membrana", "fondo_kop", "fondo_arco", "campo_hundido",

	"muro_de_pie", "tres_anillos", "fondo_banderas", "cu_olimpico", "azteca_coloso",

	"bombonera", "monumental_river",


	"camp_nou"]











const OPEN_END_FOOTPRINTS: Array = ["sin_fondo_arboles", "terraplen", "campo_coches"]





















const STREET_END_FILLS: Array = ["trees", "cars"]







func _near_end_built() -> bool:


	return OPEN_END_FOOTPRINTS.has(footprint) and div >= 1 and div < 3




func _open_end_prom() -> String:
	return "low" if _near_end_built() else "absent"






func _end_fill() -> String:
	if _near_end_built():
		return ""
	return String(FOOTPRINT_CFG.get(footprint, {}).get("end_fill", ""))












func near_end_is_street() -> bool:
	if _flip:
		return false
	return STREET_END_FILLS.has(_end_fill())


const FOOTPRINT_CFG: Dictionary = {


	"cu_olimpico": {"stands": {"slope": 23.0, "rows": 17}, "boxes": "none"},
	"azteca_coloso": {"stands": {"slope": 22.0, "rows": 16, "pylons": "none"},
		"boxes": "none"},



	"bombonera": {"stands": {"slope": 16.0, "rows": 12, "pylons": "none"},
		"boxes": "none", "sb_cresta": true, "sb_scale": 1.3},


	"monumental_river": {"stands": {"slope": 15.0, "rows": 12, "pylons": "none"},
		"boxes": "none", "sb_present": false},



	"camp_nou": {"stands": {"slope": 30.0, "rows": 18, "pylons": "none"},
		"boxes": "none"},



	"ucl_anillos": {"stands": {"slope": 32.0, "rows": 23}},



	"mundial_membrana": {"stands": {"slope": 33.0, "rows": 24, "pylons": "none"},
		"roof_white": true},





	"eul_principal": {},




	"conf_caldera": {"stands": {"slope": 15.0, "rows": 11}, "ad_x": 35.8},





	"coliseo": {"arcada": true},






	"principal_doble": {"stands": {"slope": 28.0, "rows": 20}},





























	"bowl_round": {"stands": {"slope": 30.0, "rows": 22}},
	"cubierta_membrana": {"stands": {"slope": 29.0, "rows": 21}, "roof_white": true},





	"fondo_kop": {"stands": {"slope": 24.0, "rows": 17}},






	"fondo_bloques": {"city_close": 14},




	"sin_fondo_arboles": {"end_fill": "trees"},














	"fondo_arco": {"stands": {"pylons": "modest"}, "arch": true},




	"terraplen": {"end_fill": "bank"},





	"gradas_tubo": {"scaffold": true},








	"dos_aguas": {"gable": true},








	"pantallon": {"boxes": "suites", "sb_scale": 1.95, "sb_emission": 0.85},











	"campo_hundido": {"dug": 1.8},














	"muro_de_pie": {"stands": {"slope": 26.0, "rows": 19}},





	"tres_anillos": {"stands": {"slope": 21.0, "rows": 15}},





	"fondo_banderas": {"banderas": true, "malla": true},




	"tribuna_postes": {"gable": true, "postes": true},





	"torre_reloj": {"torre": true},



	"campo_coches": {"end_fill": "cars"},






	"fondo_chimeneas": {"fabrica": true},













	"piel_envolvente": {"stands": {"slope": 29.0, "rows": 21}, "piel": true},





	"lateral_plano": {"stands": {"slope": 21.0, "rows": 15}, "plancha": true},









	"anillo_colgado": {"stands": {"slope": 22.0, "rows": 15}, "celosia": true},





	"techo_dientes": {"dientes": true},




	"columnata": {"stands": {"slope": 30.0, "rows": 22}, "columnata": true},
















	"cubierta_flotante": {"stands": {"slope": 24.0, "rows": 17}, "flotante": true},















	"torres_rampa": {"stands": {"slope": 25.0, "rows": 18}, "torres_rampa": true},








	"calabaza": {"stands": {"slope": 27.0, "rows": 20}, "calabaza": true},










	"puerta_monumental": {"stands": {"slope": 24.0, "rows": 17}, "puerta": true},









	"ola_vidrio": {"stands": {"slope": 26.0, "rows": 19}, "ola": true},
}




const PROTO_FOOTPRINTS: Array = ["muro_de_pie", "tres_anillos", "fondo_banderas",
	"tribuna_postes", "torre_reloj", "campo_coches", "fondo_chimeneas"]











const COUNTRY_BIAS_ON: bool = true
const COUNTRY_FOOTPRINT_BIAS: Dictionary = {
	"Inglaterra": {"rect_open": 3.0, "dos_aguas": 2.5, "tribuna_postes": 3.0,
		"fondo_kop": 2.2, "torre_reloj": 2.0, "athletics": 0.3, "fondo_banderas": 0.2},
	"Escocia": {"rect_open": 2.5, "dos_aguas": 2.5, "tribuna_postes": 2.5,
		"terraplen": 1.8, "fondo_banderas": 0.2},
	"Alemania": {"muro_de_pie": 3.0, "athletics": 2.2, "bowl_closed": 1.6,
		"torre_reloj": 0.4, "fondo_banderas": 0.3},
	"España": {"tres_anillos": 2.6, "bowl_closed": 1.6, "campo_hundido": 1.4,
		"catedral": 1.8, "athletics": 0.5},
	"Italia": {"athletics": 2.6, "tres_anillos": 2.2, "bowl_round": 1.6,
		"coliseo": 1.6, "dos_aguas": 0.4},
	"Francia": {"bowl_round": 2.0, "cubierta_membrana": 1.8, "athletics": 1.5},
	"Portugal": {"tres_anillos": 1.8, "bowl_round": 1.6, "campo_hundido": 1.4},
	"Países Bajos": {"bowl_closed": 2.0, "cubierta_membrana": 1.8, "fondo_kop": 1.6},
	"Turquía": {"fondo_banderas": 2.6, "campo_hundido": 1.8, "muro_de_pie": 1.5},
	"Grecia": {"fondo_banderas": 2.2, "athletics": 2.0},
	"Argentina": {"fondo_banderas": 3.0, "tres_anillos": 2.0, "campo_coches": 1.6,
		"cubierta_membrana": 0.3},
	"Brasil": {"fondo_banderas": 2.6, "bowl_round": 2.0, "athletics": 1.6},
	"México": {"fondo_banderas": 2.2, "bowl_round": 1.8, "campo_hundido": 1.6},
	"Estados Unidos": {"cubierta_membrana": 2.2, "pantallon": 2.2, "rect_open": 1.5,
		"terraplen": 0.3},
	"Japón": {"athletics": 2.6, "cubierta_membrana": 1.8, "fondo_banderas": 1.4},
}











const SCAFFOLD_X: Array = [-38.0, -19.0, 0.0, 19.0, 38.0]
const SCAFFOLD_LEN: float = 15.0



















const NIGHT_MOW: Dictionary = {
	"ucl": 3,
	"eul": 2,
	"conf": 4,
	"cwc": 1,
	"nat": 3,
}















const NIGHT_STANDS: Dictionary = {
	"ucl": {"slope": 32.0, "rows": 23},
	"cwc": {"slope": 33.0, "rows": 24},
	"nat": {"slope": 31.0, "rows": 22},
	"eul": {"slope": 28.0, "rows": 20},
}


var comp_override: String = ""


var season_t_override: float = -1.0



var kickoff_override: float = -1.0

var works_override: int = -1

var _comp: String = "league"

var _night_pomp: float = 0.0


var _ring_mats: Array[StandardMaterial3D] = []
var _season_t: float = 0.0
const FinishDetail = preload("res://features/stadium/stadium_finish.gd")
const VenueIdentity = preload("res://features/stadium/stadium_identity.gd")


const SenaPueblo = preload("res://features/stadium/sena_pueblo.gd")

const SenaClub = preload("res://features/stadium/sena_club.gd")
const CuDetail = preload("res://features/stadium/cu_detail.gd")
const AztecaDetail = preload("res://features/stadium/azteca_detail.gd")
const BomboneraDetail = preload("res://features/stadium/bombonera_detail.gd")
const MonumentalDetail = preload("res://features/stadium/monumental_detail.gd")
const CampNouDetail = preload("res://features/stadium/camp_nou_detail.gd")
const RecintoSeams = preload("res://features/stadium/recinto_seams.gd")
var _caracter = preload("res://features/stadium/venue_character.gd").new()
var _vida_recinto = preload("res://features/stadium/venue_life.gd").new()
var _finish_lamps: Array[StandardMaterial3D] = []
var _dugout_lamps: Array[StandardMaterial3D] = []
var _dugout_interiors: Array[StandardMaterial3D] = []
var _finish_fan_frames: Dictionary = {}
var _kickoff: float = 0.0


var _big_night: bool = false

var _country: String = ""




var _host_id: String = ""


var _club_a: Color = Color("343a48")
var _club_b: Color = Color("2a303d")

var _club_abbrev: String = ""



var _weather_id: String = "day"








func acoustic_profile() -> Vector2:
	if _train or _roof:
		return VenueIdentity.acustica(0.0, 0.0, 0.0)
	var cierre: float = 0.0
	for wall in _bowl_walls:
		cierre += clampf((float(wall["top"]) - float(wall["base"])) / 22.0, 0.0, 1.0)
	cierre = clampf(cierre / 4.0, 0.0, 1.0)
	var techo: float = clampf(float(_finish_lamps.size()) / 4.0, 0.0, 1.0)
	return VenueIdentity.acustica(cierre, techo, attendance())


func weather_id() -> String:
	return _weather_id




var _is_final: bool = false




var _works: bool = false



var _obra_sitio: bool = false


var _track: bool = false





var _roof: bool = false





var _train: bool = false








var train_override: int = -1





var _roof_screens: Array = []
var _roof_beacon_mats: Array[StandardMaterial3D] = []
var _roof_beacon_t: float = 0.0



const BEACON_ON: Color = Color(1.8, 0.25, 0.25)
const BEACON_OFF: Color = Color(0.22, 0.04, 0.05)








var _roof_torres: Array[Array] = []


var _avion: Node3D = null
var _avion_t: float = 0.0
var _avion_estrobo: Node3D = null



var _tw: int = TEX_W
var _th: int = TEX_H
var _wx0: float = WORLD_X0
var _wz0: float = WORLD_Z0
var _seat_tex: ImageTexture


const CORDON_OUT: float = 1.8

var _mesh_mat: StandardMaterial3D
var _cordon_tex: ImageTexture

var _confetti: Array[GeometryInstance3D] = []

var _camera_ops: Array[Node3D] = []



var _ball_boys: Array[Node3D] = []



var _water_bottles: Array[Node3D] = []



var _flying_bottles: Array[Dictionary] = []



var _wet: bool = false



var _snowy: bool = false










var _fans_home: Array[AnimatedSprite3D] = []
var _fans_away: Array[AnimatedSprite3D] = []
var _fan_frames_home: SpriteFrames
var _fan_frames_away: SpriteFrames

var _fan_buckets: Array[Dictionary] = []







var _sueltos: Array[Dictionary] = []

var _salida = preload("res://features/stadium/salida_grada.gd").new()
var _react_t: float = -1.0
var _react_dur: float = 0.0
var _react_home: String = "idle"
var _react_away: String = "idle"
var _react_jump: bool = false

var _ambient: Array[Dictionary] = []
var _ambient_t: float = 2.0



var _excite: float = 0.0
var _excite_target: float = 0.0

















var _danger: float = 0.0





const DANGER_STEP: float = 0.25
var _danger_step: float = 0.0





const DANGER_STAND: float = 0.45





const DANGER_TENSE_K: float = 0.55



const DANGER_MUTE: float = 0.35



var _pending_fans: Array[Dictionary] = []
var _net_back_mat: ShaderMaterial








var _net_ropes: Array[Dictionary] = []


var _net_roof_mat: ShaderMaterial
var _net_roof_sag: float = 0.0
var _net_roof_tween: Tween


var _net_cae: Vector2 = Vector2.ZERO
var _net_cae_tween: Tween
var _net_side_mats: Array[ShaderMaterial] = []
var _net_aux_mats: Array[ShaderMaterial] = []
var _net_factors: Array[float] = [0.0, 0.0, 0.0]




























var _net_back_mat_far: ShaderMaterial
var _net_side_mats_far: Array[ShaderMaterial] = []
var _net_aux_mats_far: Array[ShaderMaterial] = []
var _net_factors_far: Array[float] = [0.0, 0.0, 0.0]
var _net_tween_far: Tween
var _net_tween: Tween



var _tubes: Array[MeshInstance3D] = []
var _tube_tweens: Array[Tween] = [null, null, null]



var _sun: DirectionalLight3D


var weak_shadow: bool = false
var _env: Environment
var _sky_mat: ProceduralSkyMaterial
var _pitch_mat: ShaderMaterial



static var _pitch_cache: Dictionary = {}









const PITCH_CACHE_MAX: int = 4


static func _pitch_cache_get(key: String) -> Dictionary:
	if not _pitch_cache.has(key):
		return {}
	var hit: Dictionary = _pitch_cache[key]
	_pitch_cache.erase(key)
	_pitch_cache[key] = hit
	return hit


static func _pitch_cache_put(key: String, entry: Dictionary) -> void:
	_pitch_cache.erase(key)
	while _pitch_cache.size() >= PITCH_CACHE_MAX:
		_pitch_cache.erase(_pitch_cache.keys()[0])
	_pitch_cache[key] = entry









var async_build: bool = false












var force_roof: bool = false



var _chunk_rows: int = 0





const CHUNK_ROWS: int = 48


signal build_progress(done: float)
















signal thunder(fuerza: float)



signal cannon_boom(fuerza: float)






signal ola_suena(nivel: float)
var _flood_panel_mat: StandardMaterial3D



var _flood_panel_copias: Array[StandardMaterial3D] = []
var _spotlights: Array[SpotLight3D] = []
var _rain: GeometryInstance3D


var _rain_pm: Resource = null
var _rain_quad: QuadMesh = null
var _snow: GeometryInstance3D






var thunder_on: bool = false


var _bolt_win: Vector2 = Vector2.ZERO

var _bolt_next: float = -1.0



var _bolt_f: float = 0.0

var _bolt_t: float = 0.0


var _boom_in: float = -1.0
var _boom_f: float = 0.0





var _bolt: DirectionalLight3D = null

var _bg_base: float = 1.0
var _ad_shader: Shader
var _ad_mats: Array[ShaderMaterial] = []





var _ad_side: Array[Dictionary] = []
var _ads_tween: Tween
var _scoreboard_mat: ShaderMaterial



var _scoreboard_root: Node3D = null
var _slope_mat: StandardMaterial3D
var _worn_wall_tex: ImageTexture
var _banner_mats: Array[StandardMaterial3D] = []
var _banner_i: int = 0

var _banner_shout: String = ""
var _flag_frames_cache: SpriteFrames




var _corner_flags: Array = []
var _skyline_mats: Array[StandardMaterial3D] = []


var _skyline_base: Array[Color] = []
var _skyline_haze: float = 0.7




var _env_mats: Array[StandardMaterial3D] = []
var _env_base: Array[Color] = []
var _ground_mat: StandardMaterial3D
var _birds: GeometryInstance3D


var _flare_n: int = 0

var _nat_heat_v: float = -1.0
var _flare_proc: Array[Resource] = [null, null]










const FLARE_MESH_SIZES: Array[float] = [0.66, 0.85, 1.06]
var _flare_meshes: Array[QuadMesh] = []


var _veil_proc: Array[Resource] = [null, null]
var _veil_mesh: QuadMesh










var _smoke_tex: ImageTexture

var _flare_spots: Array[Dictionary] = []





var _flash_spots: Array[Vector3] = []

var _flash_seen: int = 0




var _guard_tex: Array[Texture2D] = []


var _guard_n: int = 0



var _guard_sillas: Array[Vector2] = []
var _flash_mm: MultiMeshInstance3D



var _flash_lit: PackedFloat32Array = PackedFloat32Array()
var _flash_wait: PackedFloat32Array = PackedFloat32Array()
var _flash_t: float = 0.0
var _flash_acc: float = 0.0


var _shafts: Array[MeshInstance3D] = []
var _shaft_mat: StandardMaterial3D

var _litter: Array[Dictionary] = []
var _litter_next: float = 6.0
var _litter_tex: ImageTexture


var _pigeons: Array[Dictionary] = []
var _pigeon_tex: Dictionary = {}
var _pigeon_next: float = 8.0


var _feathers: GeometryInstance3D





var _pigeon_any: bool = false


var _pigeon_hold: bool = false





var _moth_mm: MultiMeshInstance3D
var _moth_spots: Array[Vector3] = []
var _moth_r: PackedFloat32Array = PackedFloat32Array()
var _moth_spin: PackedFloat32Array = PackedFloat32Array()
var _moth_ph: PackedFloat32Array = PackedFloat32Array()
var _moth_bob: PackedFloat32Array = PackedFloat32Array()
var _moth_t: float = 0.0
var _moth_acc: float = 0.0





var _flood_heads: Array[Vector3] = []



var _sprinklers: Array[Node3D] = []
var _sprink_p: Array[GeometryInstance3D] = []
var _sprink_yaw: PackedFloat32Array = PackedFloat32Array()
var _sprink_left: float = 0.0
var _sprink_t: float = 0.0




var _sprink_broken: int = -1


var _sprink_broken_yaw: float = 0.0



var _sprink_shakes: bool = false
var _sprink_bt: float = 0.0
var _soak: float = 0.0
var _soak_sent: float = -1.0



var _tongue: Array[Dictionary] = []



var _sub_board: MeshInstance3D
var _sub_board_mat: StandardMaterial3D
var _sub_board_face: ImageTexture
var _sub_board_size: Vector2 = ADDED_BOARD_SIZE
var _added_face: Dictionary = {}


var _sub_face: Dictionary = {}
var _board_tw: Tween



var _ref_man: AnimatedSprite3D






var _wind: Vector3 = Vector3.ZERO






var _dusk_base: Dictionary = {}




func net_impact(world_pos: Vector3, under_pause: bool = false,
		speed: float = 1.0, fuerza: float = 1.0, dur: float = 1.1) -> void:







	if world_pos.z > FIELD_DEPTH * 0.5:





		_net_impact_far(world_pos, fuerza, dur, under_pause, speed)
		return
	if _net_back_mat == null:
		return
	var ly: float = world_pos.y - CROSSBAR_H * 0.5

	_net_back_mat.set_shader_parameter("impact_local", Vector3(world_pos.x, ly, 0.0))
	_net_factors[0] = exp(- absf(world_pos.z + NET_DEPTH) * 1.6)





	var lz_lado: float = world_pos.z + NET_DEPTH * 0.5
	for i in 2:
		var side_x: float = - GOAL_HALF_W if i == 0 else GOAL_HALF_W
		_net_side_mats[i].set_shader_parameter("impact_local",
			Vector3(- lz_lado if i == 0 else lz_lado, ly, 0.0))
		_net_factors[i + 1] = exp(- absf(world_pos.x - side_x) * 1.6)


	for am in _net_aux_mats:
		am.set_shader_parameter("impact_local", Vector3(world_pos.x, 0.0, 0.0))
	if _net_tween and _net_tween.is_valid():
		_net_tween.kill()
	_net_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)


	if under_pause:
		_net_tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		_net_tween.set_ignore_time_scale(true)
		_net_tween.set_speed_scale(maxf(speed, 0.05))



	_net_tween.tween_method(_set_ripple, 0.62 * clampf(fuerza, 0.0, 1.0), 0.0,
		maxf(dur, 0.05))
















func post_impact(world_pos: Vector3, strength: float = 1.0, under_pause: bool = false,
		speed: float = 1.0, bar_hint: int = -1) -> void:
	if _tubes.size() < 3:
		return











	var i: int = 2 if world_pos.y > CROSSBAR_H - 0.28 \
			else (0 if world_pos.x < 0.0 else 1)
	if bar_hint >= 0:
		i = 2 if bar_hint == 1 else (0 if world_pos.x < 0.0 else 1)
	var tube: MeshInstance3D = _tubes[i]
	if tube == null or not is_instance_valid(tube):
		return












	if i == 2:
		bar_snow_knock(world_pos.x, strength, under_pause, speed)





	tube_spray(world_pos, strength, i == 2, under_pause, speed)













	net_impact(world_pos, under_pause, speed, 0.18 * clampf(strength, 0.3, 1.25), 0.55)
	var rest: Vector3 = tube.position
	if _tube_tweens[i] and _tube_tweens[i].is_valid():
		_tube_tweens[i].kill()
		rest = Vector3(tube.get_meta("rest", rest))
	tube.set_meta("rest", rest)


	var axis: Vector3 = Vector3(0.0, 1.0, 0.0) if i == 2 else Vector3(1.0, 0.0, 0.0)
	var amp: float = 0.028 * clampf(strength, 0.0, 1.25)
	var tw: Tween = create_tween()



	if under_pause:
		tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tw.set_ignore_time_scale(true)





	if not is_equal_approx(speed, 1.0):
		tw.set_speed_scale(maxf(speed, 0.05))


	for k in 3:
		var a: float = amp * pow(0.45, k)
		tw.tween_property(tube, "position", rest + axis * a, 0.07) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tw.tween_property(tube, "position", rest - axis * a * 0.7, 0.07) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(tube, "position", rest, 0.08) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	_tube_tweens[i] = tw


func _set_ripple(v: float) -> void:
	if _net_back_mat:
		_net_back_mat.set_shader_parameter("ripple", v * _net_factors[0])
	for i in 2:
		_net_side_mats[i].set_shader_parameter("ripple", v * _net_factors[i + 1])

	var aux: float = maxf(_net_factors[0], maxf(_net_factors[1], _net_factors[2])) * 0.8
	for am in _net_aux_mats:
		am.set_shader_parameter("ripple", v * aux)











func _net_impact_far(world_pos: Vector3, fuerza: float = 1.0, dur: float = 1.1,
		under_pause: bool = false, speed: float = 1.0) -> void:
	if _net_back_mat_far == null:
		return
	var lx: float = - world_pos.x
	var lz: float = FIELD_DEPTH - world_pos.z
	var ly: float = world_pos.y - CROSSBAR_H * 0.5
	_net_back_mat_far.set_shader_parameter("impact_local", Vector3(lx, ly, 0.0))
	_net_factors_far[0] = exp(- absf(lz + NET_DEPTH) * 1.6)



	var lz_lado: float = lz + NET_DEPTH * 0.5
	for i in 2:
		var side_x: float = - GOAL_HALF_W if i == 0 else GOAL_HALF_W
		_net_side_mats_far[i].set_shader_parameter("impact_local",
			Vector3(- lz_lado if i == 0 else lz_lado, ly, 0.0))
		_net_factors_far[i + 1] = exp(- absf(lx - side_x) * 1.6)
	for am in _net_aux_mats_far:
		am.set_shader_parameter("impact_local", Vector3(lx, 0.0, 0.0))
	if _net_tween_far and _net_tween_far.is_valid():
		_net_tween_far.kill()
	_net_tween_far = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)


	if under_pause:
		_net_tween_far.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		_net_tween_far.set_ignore_time_scale(true)
		_net_tween_far.set_speed_scale(maxf(speed, 0.05))



	_net_tween_far.tween_method(_set_ripple_far, 0.62 * clampf(fuerza, 0.0, 1.0), 0.0,
		maxf(dur, 0.05))


func _set_ripple_far(v: float) -> void:
	if _net_back_mat_far:
		_net_back_mat_far.set_shader_parameter("ripple", v * _net_factors_far[0])
	for i in 2:
		_net_side_mats_far[i].set_shader_parameter("ripple", v * _net_factors_far[i + 1])
	var aux: float = maxf(_net_factors_far[0],
		maxf(_net_factors_far[1], _net_factors_far[2])) * 0.8
	for am in _net_aux_mats_far:
		am.set_shader_parameter("ripple", v * aux)







var _forced_footprint: bool = false



var _venue_fp: bool = false


func _ready() -> void:


	if async_build:
		return
	_build_all()

















func _train_on() -> bool:
	if train_override >= 0:
		return train_override == 1
	return GameState.training_active and not GameState.tutorial_active

func _build_all() -> void:
	_forced_footprint = footprint != ""
	_venue_fp = false
	weather = Weather.get_preset("day")
























	var entreno: bool = _train_on()
	if entreno and div <= 0:
		div = GameState.player_div()
		_league_div = div
	elif div <= 0:
		_league_div = _home_div()
		div = _resolve_struct_div(_league_div)
	elif _league_div <= 0:


		_league_div = div
	_resolve_context()
	_sede_neutral = not _neutral_venue().is_empty()
	_casa_es_tuya = _host_stand_is_yours()









	_train = _train_on()
	if _train:
		await _build_pitch()
		_build_goal()
		_build_lighting()
		_build_training()
		await _build_skyline()
		build_progress.emit(1.0)
		return










	_roof = force_roof or GameState.tutorial_active or (not GameState.practice_kind.is_empty()
		and GameState.practice_venue != GameState.VENUE_STADIUM)
	if _roof:
		await _build_pitch()
		_build_goal()
		_build_corner_flags()
		_build_confetti()
		_build_lighting()


		_build_rain()
		_build_roof()
		_roof_dress_sky()
		build_progress.emit(1.0)
		return
	await _build_pitch()
	build_progress.emit(0.62)



	await _respira()
	_build_goal()
	await _respira()



	_fan_frames_home = _build_fan_frames("fan_blue", _crowd_kit(false))
	await _respira()



	_fan_frames_away = _fan_frames_home if home_only \
			else _build_fan_frames("fan_red", _crowd_kit(true))
	await _respira()






	for ropa in range(1, 4):
		_finish_frames(true, ropa)
		await _respira()
		_finish_frames(false, ropa)
		await _respira()
	await _breathe(0.7)
	_flare_n = 0
	_flash_spots.clear()
	_flash_seen = 0
	_panuelo_cands.clear()
	_panuelo_seen = 0
	_panuelo_rng = null



	_flood_heads.clear()
	_moth_spots.clear()
	_guard_tex.clear()
	_card_texs.clear()
	_card_n = 0
	_drape_n = 0
	_drape_n_muro = 0
	_drape_muro_xy.clear()
	_drape_muro_y.clear()
	_drape_muro_pos.clear()
	_drape_alto_xy.clear()
	_flag_xy.clear()
	_card_pos.clear()
	_card_xy.clear()
	_guard_n = 0
	_guard_sillas.clear()
	await _build_stands()




	_build_hate_banner()
	await _respira()
	_build_milestone_banner()
	await _respira()
	_build_love_banner()
	await _respira()
	_build_tribute_banner()
	await _respira()
	_build_spurn_banner()
	await _respira()
	_build_errata_banner()
	await _breathe(0.78)




	await _build_dugouts()
	await _breathe(0.82)
	_build_tv_cameras()
	await _breathe(0.86)
	await _build_camera_ops()
	await _build_photographers()
	await _breathe(0.9)
	await _build_sideline()
	_build_water_bottles()
	await _breathe(0.94)






	_build_confetti()
	await _respira()
	_build_goal_fireworks()
	await _respira()
	_build_lighting()
	await _breathe(0.95)
	await _build_skyline()
	await _breathe(0.96)
	_build_rain()
	_build_snow()
	await _breathe(0.97)
	_build_birds()
	_build_litter()
	_build_pigeons()
	await _breathe(0.98)



	_build_sprinklers()
	_build_tongue()



	_apply_flood_reflection(not _spotlights.is_empty() and _spotlights[0].visible)
	build_progress.emit(1.0)






func _breathe(done: float) -> void:
	build_progress.emit(done)
	if _chunk_rows <= 0:
		return
	if sobre_us > OBRA_SOBRE_US and Time.get_ticks_usec() - _obra_desde < sobre_us:
		return
	await _cede_cuadro()
	_obra_desde = Time.get_ticks_usec()













const OBRA_SOBRE_US: int = 5000





var sobre_us: int = OBRA_SOBRE_US
var _obra_desde: int = 0


func _respira() -> void:
	if _chunk_rows <= 0:
		return
	if Time.get_ticks_usec() - _obra_desde < sobre_us:
		return
	await _cede_cuadro()
	_obra_desde = Time.get_ticks_usec()








func _cede_cuadro() -> void:
	var arbol: SceneTree = get_tree() if is_inside_tree() else Engine.get_main_loop() as SceneTree
	if arbol == null:
		return
	await arbol.process_frame





func build_async() -> void:
	_chunk_rows = CHUNK_ROWS
	_obra_desde = Time.get_ticks_usec()
	await _build_all()
	_chunk_rows = 0












func _resolve_context() -> void:


	_tifo_esp_v = null
	var club: String = home_club if not home_club.is_empty() \
			else GameState.host_id()
	if not club.is_empty():




		var t: Dictionary = {}
		if home_club.is_empty():



			t = GameState.host_team()
		else:
			t = Teams.by_id(club)
			if t.is_empty():
				t = Nations.as_team(club)
		_country = String(t.get("country", ""))
		if t.has("kit"):
			_club_a = t["kit"]
			_club_b = t.get("kit2", t["kit"])
		_club_abbrev = String(t.get("abbrev", ""))













		var neutral: bool = not _neutral_venue().is_empty()
		if neutral:
			var acc: Color = Competitions.accent_of(GameState.current_fixture())
			_club_a = acc
			_club_b = acc.lerp(Color("f2f2f0"), 0.55)
			_club_abbrev = ""




		_host_id = "" if neutral else club














		_works = not neutral \
				and int(GameState.last_div_moves.get(club, 0)) == -1 \
				and (div > _league_div if att_override < 0.0
				else GameState.stadium_built_div(club) > GameState.div_of(club))
	if works_override >= 0:
		_works = works_override > 0
	var in_match: bool = att_override < 0.0
	if not GameState.next_weather.is_empty():
		var wx: Dictionary = Weather.get_preset(GameState.next_weather)
		_wet = bool(wx.get("rain", false))
		_snowy = bool(wx.get("snow", false))


		_weather_id = GameState.next_weather
	if not comp_override.is_empty():
		_comp = comp_override
	elif in_match:
		_comp = String(GameState.current_fixture().get("comp", "league"))







	if in_match:
		_is_final = String(GameState.current_fixture().get("round", "")) == "Final"












	_big_night =(_comp in ["ucl", "eul", "conf", "cwc", "nat"] \
			or Continental.es_americana(_comp)) and div <= 2





	_night_pomp = float(NIGHT_POMP.get(_comp, 0.0)) if _big_night else 0.0
	if season_t_override >= 0.0:
		_season_t = clampf(season_t_override, 0.0, 1.0)
	elif in_match:


		_season_t = maxf(GameState.season_progress(), 0.0)


	if kickoff_override >= 0.0:
		_kickoff = clampf(kickoff_override, 0.0, 1.0)
	else:
		var kr: RandomNumberGenerator = RandomNumberGenerator.new()
		kr.seed = hash(club) + GameState.season_day * 131
		_kickoff = kr.randf()






	_size_f = 0.0
	_club_tier_v = ""
	if _comp != "nat" and not club.is_empty() and _neutral_venue().is_empty():
		var ficha: Dictionary = Teams.by_id(club)
		if not ficha.is_empty():
			var d: int = clampi(div, 1, 3)
			var r: int = int(ficha.get("rating", 0))
			if r > 0:
				var rango: Array = DIV_R_RANGE[d]
				_size_f = clampf(inverse_lerp(float(rango[0]),
					float(rango[1]), float(r)) * 2.0 - 1.0, -1.0, 1.0)
				var cortes: Array = BAND_CUTS[d]
				_club_tier_v = "alto" if r >= int(cortes[0]) \
						else ("bajo" if r < int(cortes[1]) else "medio")

















func _pon_glow(on: bool) -> void:
	if _env != null:
		_env.glow_enabled = on and not Settings.calidad_baja




func apply_weather(id: String) -> void:
	weather = Weather.get_preset(id)




	_weather_id = id
	_tifo_wind_refresh()

	SenaClub.clima(self)
	for g in _box_glass:
		_box_glass_light(g)
	for pm in _box_people:
		_box_people_light(pm)


	var moja: bool = bool(weather.get("rain", false)) or bool(weather.get("snow", false))
	_dress_for_weather()


	_dress_bench()
	if not moja and _umbrella_frac > 0.0:
		_umbrella_open(0.0)
	elif moja and _umbrella_frac <= 0.0:
		_umbrella_open(UMBRELLA_OPEN_MIN)


	if _roof:
		return





	if _train:
		weather = Weather.get_preset("day")
	_caracter.clima(bool(weather.get("rain", false)), rain_level())







	var rot: Vector3 = weather["sun_rot"]









	var cold: float = _season_cold()
	rot.x = minf(rot.x + 26.0 * _kickoff + Weather.season_sun_tilt(cold), -8.0)

	rot.y -= 34.0 * _kickoff
	_sun.rotation_degrees = rot



	var season_light: Array = Weather.season_light(cold)
	_sun.light_energy = float(weather["sun_energy"]) * float(season_light[0])




	weak_shadow = _sun.light_energy < 0.72
	_sun.light_color = Color(weather["sun_color"]).lerp(
		Color(season_light[1]), float(season_light[2]))
	_sky_mat.sky_top_color = weather["sky_top"]
	_sky_mat.sky_horizon_color = weather["sky_horizon"]


	_stars_base = float(STARS_BY_PRESET.get(id, 0.0))
	_sky_stars(_stars_base)
	_sky_mat.ground_horizon_color = weather["ground_horizon"]
	_sky_mat.ground_bottom_color = weather["ground_bottom"]
	_env.ambient_light_energy = weather["ambient_energy"]





	var frost: float = maxf(cold, 0.0)
	var fog_on: bool = bool(weather["fog"]) or frost > 0.35
	_env.fog_enabled = fog_on
	_env.fog_light_color = weather["fog_color"]
	_env.fog_density = float(weather["fog_density"]) *(1.0 + 0.8 * frost) \
			+(0.006 * frost if not bool(weather["fog"]) else 0.0)







	if bool(weather.get("rain", false)):
		_env.fog_density *= float(Weather.rain_tier(rain_level())["fog"])


	_pon_glow(bool(weather["glow"]))


	_pitch_mat.set_shader_parameter("grass_tint", weather["grass_tint"])
	_pitch_mat.set_shader_parameter("grass_roughness", weather["grass_roughness"])
	_apply_puddles()
	_apply_snow()
	_apply_clouds()





	if is_instance_valid(_prints_mmi):
		_prints_mmi.visible = WeatherWear.marks_on(weather_id())
	_apply_tread_fade()


	_flood_emision(float(weather["flood_emission"]))




	var lights_on: bool = bool(weather["floodlights"]) or _big_night
	_finish_light(lights_on)
	_suelta_calentado()
	for spot in _spotlights:
		spot.visible = lights_on
	_apply_shafts(lights_on)

	_apply_flood_reflection(lights_on)



	if _sprink_left > 0.0 and (bool(weather.get("rain", false))
			or bool(weather.get("snow", false))):
		stop_watering()
	if _big_night:
		_pon_glow(true)

		_flood_emision(maxf(float(weather["flood_emission"]), FLOOD_PANEL_NIGHT))






		var acc: Color = _night_accent()
		_env.fog_enabled = true
		_env.fog_light_color = Color(weather["fog_color"]).lerp(acc, 0.5)
		_env.fog_density = maxf(_env.fog_density, 0.0035 + 0.004 * _night_pomp)
		_sky_mat.sky_horizon_color = Color(weather["sky_horizon"]).lerp(acc, 0.32)
		_sky_mat.sky_top_color = Color(weather["sky_top"]).lerp(acc, 0.16)


		_env.ambient_light_color = acc
		_env.ambient_light_energy = maxf(float(weather["ambient_energy"]), 0.2)

		_pitch_mat.set_shader_parameter("grass_tint",
			Color(weather["grass_tint"]).lerp(acc, 0.15))
	set_ads_led(weather["ads_led"], weather["ads_scroll"])


	if _scoreboard_mat and bool(_scoreboard_cfg()["emissive"]):
		_scoreboard_mat.set_shader_parameter("energy",
			float(_scoreboard_cfg()["emission"]) + float(weather["ads_led"]))
	if _rain:
		_rain.visible = weather["rain"]
		_rain.emitting = weather["rain"]



	_apply_rain_tier()
	if _snow:
		var snowing: bool = bool(weather.get("snow", false))
		_snow.visible = snowing
		_snow.emitting = snowing



	if _skyline_mats.size() == 3 and _skyline_base.size() == 3:
		var dim: float = clampf(weather["sun_energy"] * 0.9, 0.3, 1.0)
		for i in 3:




			var distancia_visual: float = [0.65, 0.9, 1.12][i] if not _venue_environment.is_empty() else 1.0
			_skyline_mats[i].albedo_color = _skyline_base[i].lerp(weather["sky_horizon"],
				clampf(_skyline_haze * distancia_visual, 0.0, 0.88)) * dim


		for j in _env_mats.size():


			var bruma: float = float(_env_mats[j].get_meta("paisaje_bruma", 0.5))
			_env_mats[j].albedo_color = _env_base[j].lerp(weather["sky_horizon"],
				clampf(_skyline_haze * bruma, 0.0, 0.88)) * dim






		_set_city_night(bool(weather.get("floodlights", false)))





		var fhaze: float = _skyline_haze if not _night_city else _skyline_haze * 0.5




		var fdim: float = maxf(dim, 0.62) if _night_city else dim
		for f in _facade_mats:
			var distancia_visual: float = [0.65, 0.9, 1.12][int(f["tier"])] if not _venue_environment.is_empty() else 1.0
			(f["mat"] as StandardMaterial3D).albedo_color = Color.WHITE.lerp(weather["sky_horizon"],
				clampf(fhaze * distancia_visual, 0.0, 0.88)) * fdim
	if _ground_mat:


		_ground_mat.albedo_color = _ground_color() * weather["grass_tint"]
	if _birds:
		var birds_ok: bool = not weather["rain"] and id != "night"
		_birds.visible = birds_ok
		_birds.emitting = birds_ok





	_dusk_base = {
		"rot": _sun.rotation_degrees, "sun": _sun.light_energy,
		"amb": _env.ambient_light_energy, "fog": _env.fog_density,
		"sky_top": Color(_sky_mat.sky_top_color),
		"sky_hor": Color(_sky_mat.sky_horizon_color),
		"flood":(_flood_panel_mat.emission_energy_multiplier
			if _flood_panel_mat else 0.0),
		"lights": lights_on,
	}
	_apply_dusk()




	if thunder_on and not _calienta_hecho and _luces_gl():
		calienta_luces()














func set_wind(v: Vector3) -> void:
	_wind = v
	_flags_wind()
	_net_wind()
	_apply_clouds()

















func _net_wind() -> void:
	var amp: float = 0.0 if Settings.reduce_motion else 0.07 * _wind_unit()
	if _net_back_mat:
		_net_back_mat.set_shader_parameter("wind", amp)
	for m in _net_side_mats:
		m.set_shader_parameter("wind", amp)
	for m2 in _net_aux_mats:
		m2.set_shader_parameter("wind", amp)


	if _net_back_mat_far:
		_net_back_mat_far.set_shader_parameter("wind", amp)
	for m3 in _net_side_mats_far:
		m3.set_shader_parameter("wind", amp)
	for m4 in _net_aux_mats_far:
		m4.set_shader_parameter("wind", amp)






func _wind_unit() -> float:
	var top: Array = Weather.WIND_MAX.values()
	var ref: float = float(top.max()) if not top.is_empty() else 7.0
	return clampf(Vector2(_wind.x, _wind.z).length() / maxf(ref, 0.1), 0.0, 1.0)
















func _flags_wind() -> void:
	if _corner_flags.is_empty():
		return
	var w: float = _wind_unit()



	var quieto: bool = Settings.reduce_motion


	var tilt: float = 12.0 * w
	var dir: Vector2 = Vector2(_wind.x, _wind.z)
	if dir.length() > 0.001:
		dir = dir.normalized()
	for f in _corner_flags:
		var sprite: AnimatedSprite3D = f["sprite"]
		if is_instance_valid(sprite):

			sprite.speed_scale = 0.0 if quieto else lerpf(0.35, 2.2, w)
		if bool(f.get("broken", false)):
			continue
		var pivot: Node3D = f["pivot"]
		if is_instance_valid(pivot):


			pivot.rotation_degrees = Vector3(tilt * dir.y, 0.0, - tilt * dir.x)


















func _apply_dusk() -> void:
	if _dusk_base.is_empty() or _sun == null:
		return

	var t: float = clampf(float(_clock_minute) / DUSK_UNTIL, 0.0, 1.0)


	t = t * t
	var late: float = _kickoff
	var rot: Vector3 = _dusk_base["rot"]



	rot.x = minf(rot.x + DUSK_TILT * t, -8.0)
	rot.y -= DUSK_SWEEP * t
	_sun.rotation_degrees = rot
	var dim: float = 1.0 -(1.0 - DUSK_DIM) * t * late
	_sun.light_energy = float(_dusk_base["sun"]) * dim



	weak_shadow = _sun.light_energy < 0.72
	_env.ambient_light_energy = float(_dusk_base["amb"]) \
			*(1.0 -(1.0 - DUSK_AMBIENT) * t * late)


	var night: Dictionary = Weather.get_preset("night")
	var k: float = DUSK_SKY * t * late
	_sky_mat.sky_top_color = Color(_dusk_base["sky_top"]).lerp(night["sky_top"], k)
	_sky_mat.sky_horizon_color = Color(_dusk_base["sky_hor"]).lerp(
		night["sky_horizon"], k)




	_sky_stars(maxf(_stars_base, k))

	_env.fog_density = float(_dusk_base["fog"]) *(1.0 + 0.9 * t * late)
	_dusk_floodlights(t, late)





















const STARS_BY_PRESET: Dictionary = {
	"night": 1.0, "sunset": 0.22, "day": 0.0,
	"overcast": 0.0, "rain": 0.0, "snow": 0.0,
}



const STARS_N: int = 1000


const STARS_TEX_W: int = 1024
const STARS_TEX_H: int = 512















const MOON_R: int = 5


static var _stars_tex: ImageTexture = null





var _stars_base: float = 0.0



func _sky_stars(k: float) -> void:
	if _sky_mat == null:
		return
	var q: float = clampf(k, 0.0, 1.0)
	if q <= 0.001:


		_sky_mat.sky_cover_modulate = Color(1.0, 1.0, 1.0, 0.0)

		if _sun != null:
			_sun.sky_mode = DirectionalLight3D.SKY_MODE_LIGHT_AND_SKY
		return
	if _stars_tex == null:
		_stars_tex = _stars_texture()
	if _sky_mat.sky_cover != _stars_tex:
		_sky_mat.sky_cover = _stars_tex
	_sky_mat.sky_cover_modulate = Color(1.0, 1.0, 1.0, q)









	if _sun != null:
		_sun.sky_mode =(DirectionalLight3D.SKY_MODE_LIGHT_ONLY if q > 0.5
			else DirectionalLight3D.SKY_MODE_LIGHT_AND_SKY)












func _stars_texture() -> ImageTexture:
	var w: int = STARS_TEX_W
	var h: int = STARS_TEX_H
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0.0, 0.0, 0.0, 0.0))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20260909



	var halo_y0: int = int(float(h) * 0.4)
	var halo_y1: int = int(float(h) * 0.5)
	for y in range(halo_y0, halo_y1):
		var t: float = float(y - halo_y0) / float(maxi(halo_y1 - halo_y0, 1))
		var a: float = t * t * 0.13
		for x in w:
			img.set_pixel(x, y, Color(0.62, 0.66, 0.8, a))

	for i in STARS_N:
		var u: float = rng.randf()
		var y2: int = int(pow(u, 0.62) * float(h) * 0.49)
		var x2: int = rng.randi() % w


		var brillo: float = rng.randf_range(0.45, 1.0)


		var tinte: Color = Color(1.0, 1.0, 1.0).lerp(
			Color(0.72, 0.8, 1.0) if rng.randf() < 0.6 else Color(1.0, 0.88, 0.74),
			rng.randf_range(0.0, 0.55))
		img.set_pixel(x2, y2, Color(tinte.r, tinte.g, tinte.b, brillo))
		if rng.randf() < 0.11:
			for d in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
				var px: int = posmod(x2 + d.x, w)
				var py: int = clampi(y2 + d.y, 0, h - 1)
				if img.get_pixel(px, py).a < 0.001:
					img.set_pixel(px, py, Color(tinte.r, tinte.g, tinte.b, brillo * 0.34))




	var fase: float = fposmod(_season_t * 9.0, 1.0)











	var rot: Vector3 = Weather.get_preset("night")["sun_rot"]
	var b: Basis = Basis.from_euler(Vector3(deg_to_rad(rot.x), deg_to_rad(rot.y),
		deg_to_rad(rot.z)))
	var hacia: Vector3 = b.z.normalized()
	if hacia.y < 0.0:
		hacia = - hacia
	var mu: float = fposmod(atan2(hacia.x, hacia.z) / TAU + 0.5, 1.0)
	var mv: float = acos(clampf(hacia.y, -1.0, 1.0)) / PI
	var mx: int = int(float(w) * mu)
	var my: int = int(float(h) * mv)


	var corte: float = cos(fase * TAU) * float(MOON_R) * 2.0
	for dy in range(- MOON_R - 1, MOON_R + 2):
		for dx in range(- MOON_R - 1, MOON_R + 2):
			var r: float = sqrt(float(dx * dx + dy * dy))
			if r > float(MOON_R) + 0.7:
				continue

			if sqrt(pow(float(dx) - corte, 2.0) + float(dy * dy)) <= float(MOON_R):
				continue


			var a2: float = clampf(float(MOON_R) + 0.7 - r, 0.0, 1.0)




			var mar: bool =(Vector2(float(dx) + 1.6, float(dy) - 1.4).length() < 2.2
				or Vector2(float(dx) - 1.8, float(dy) + 1.9).length() < 1.6)


			var gris: float = 0.8 if mar else 0.88
			img.set_pixel(posmod(mx + dx, w), clampi(my + dy, 0, h - 1),
				Color(gris, gris, gris * 0.97, a2))
	return ImageTexture.create_from_image(img)









func _dusk_floodlights(t: float, late: float) -> void:
	if bool(_dusk_base["lights"]) or late < DUSK_FLOOD_LATE or _spotlights.is_empty():
		return
	var up: float = clampf((t - DUSK_FLOOD_FROM) / maxf(1.0 - DUSK_FLOOD_FROM, 0.01),
		0.0, 1.0)



	var on: bool = up > 0.0
	_finish_light(on)

	_suelta_calentado()
	for spot in _spotlights:
		spot.visible = on
		spot.light_energy = FLOOD_ENERGY * up



	_apply_flood_reflection(on, up)
	if _flood_panel_mat:
		_flood_emision(lerpf(float(_dusk_base["flood"]), FLOOD_PANEL_NIGHT, up))





















var _calienta_hecho: bool = false
var _calentando: bool = false
var _calienta_gen: int = 0
var _calienta_spots: Array[SpotLight3D] = []
var _calienta_energias: Array[float] = []


static func _luces_gl() -> bool:
	return Particulas.usa_cpu() \
			or RenderingServer.get_current_rendering_method() == "gl_compatibility"


func calienta_luces() -> void:
	_calienta_hecho = true
	_calienta_gen += 1
	_calienta_spots.clear()
	_calienta_energias.clear()
	if not _spotlights.is_empty() and is_instance_valid(_spotlights[0]) \
			and not _spotlights[0].visible:
		for spot: SpotLight3D in _spotlights:
			if not is_instance_valid(spot):
				continue
			_calienta_spots.append(spot)
			_calienta_energias.append(spot.light_energy)
			spot.light_energy = 0.0
			spot.visible = true
		_calentando = true
	var omni := OmniLight3D.new()
	omni.name = "CalientaOmni"
	omni.light_energy = 0.0
	omni.omni_range = 7.5
	omni.shadow_enabled = false
	omni.position = Vector3(0.0, 0.35, HALF_LINE)
	add_child(omni)


	_calienta_espera(weakref(self), _calienta_gen, omni)




static func _calienta_espera(wr: WeakRef, gen: int, omni: OmniLight3D) -> void:


	var sin_dibujo: bool = DisplayServer.get_name() == "headless"
	for i in 2:
		if sin_dibujo:
			var arbol: SceneTree = Engine.get_main_loop() as SceneTree
			if arbol == null:
				return
			await arbol.process_frame
		else:
			await RenderingServer.frame_post_draw
	if is_instance_valid(omni):
		omni.queue_free()
	var st: Object = wr.get_ref()
	if st == null or not is_instance_valid(st) or int(st.get(&"_calienta_gen")) != gen:
		return
	(st as Stadium)._calienta_devuelve(true)



func _calienta_devuelve(apaga: bool) -> void:
	for i in _calienta_spots.size():
		var spot: SpotLight3D = _calienta_spots[i]
		if is_instance_valid(spot):
			if apaga:
				spot.visible = false
			spot.light_energy = _calienta_energias[i]
	_calienta_spots.clear()
	_calienta_energias.clear()
	_calentando = false





func _suelta_calentado() -> void:
	if _calentando:
		_calienta_devuelve(false)
		_calienta_gen += 1





func _apply_clouds() -> void:
	if _pitch_mat == null:
		return
	var amount: float = float(CLOUD_SHADOW.get(_weather_id, 0.0))


	if Settings.reduce_motion:
		_pitch_mat.set_shader_parameter("cloud_amount", amount)
		_pitch_mat.set_shader_parameter("cloud_drift", Vector2.ZERO)
		return
	var drift: Vector2 = Vector2(_wind.x, _wind.z) * CLOUD_WIND_MUL




	if drift.length() < CLOUD_DRIFT_MIN:
		var d: Vector2 = drift.normalized() if drift.length() > 0.001 else Vector2.RIGHT
		drift = d * CLOUD_DRIFT_MIN
	_pitch_mat.set_shader_parameter("cloud_amount", amount)
	_pitch_mat.set_shader_parameter("cloud_drift", drift)





func _apply_shafts(lights_on: bool) -> void:
	if _shafts.is_empty() or _shaft_mat == null:
		return
	var a: float = float(SHAFT_ALPHA.get(_weather_id, 0.0))


	if _big_night:
		a *= 1.0 + 0.45 * _night_pomp
	var on: bool = lights_on and a > 0.0
	for s in _shafts:
		s.visible = on
	if on:
		_shaft_mat.albedo_color.a = a

















func _apply_flood_reflection(lights_on: bool, energy: float = 1.0) -> void:
	if _pitch_mat == null:
		return


	_pitch_mat.set_shader_parameter("ripple_speed", 0.0 if Settings.reduce_motion else 1.0)
	var n: int = mini(_flood_heads.size(), 4)



	var pos: PackedVector3Array = PackedVector3Array()
	pos.resize(4)
	for i in 4:
		pos[i] = _wp(_flood_heads[i]) if i < n else Vector3.ZERO
	_pitch_mat.set_shader_parameter("flood_pos", pos)
	_pitch_mat.set_shader_parameter("flood_count", n if lights_on else 0)




	var sun_k: float = 1.0 if weak_shadow else 0.3
	_pitch_mat.set_shader_parameter("flood_on",
		clampf(energy, 0.0, 1.0) * sun_k if lights_on else 0.0)







var _grade_tw: Tween
func set_aim_grade(on: bool) -> void:
	if _env == null:
		return
	_env.adjustment_enabled = true
	if _grade_tw != null and _grade_tw.is_valid():
		_grade_tw.kill()
	_grade_tw = create_tween().set_parallel(true)

















	_grade_tw.tween_property(_env, "adjustment_saturation",
		0.5 if on else 1.0, 0.36 if on else 0.3)
	_grade_tw.tween_property(_env, "adjustment_brightness",
		0.84 if on else 1.0, 0.36 if on else 0.3)










var rain_ahead: float = 14.0

func rain_follow(pos: Vector3) -> void:
	if _rain and _rain.visible:
		_rain.global_position = pos
	if _snow and _snow.visible:
		_snow.global_position = pos











func precip_on() -> bool:
	return (_rain != null and _rain.visible) or (_snow != null and _snow.visible)







func set_ads_led(energy: float, scroll: float) -> void:
	var cfg: Dictionary = _ads_cfg()
	var e: float = energy if bool(cfg["led"]) else 0.0
	var s: float = scroll if bool(cfg["scroll"]) else 0.0
	for mat in _ad_mats:
		mat.set_shader_parameter("led_energy", e)
		mat.set_shader_parameter("scroll", s)




func pulse_ads(strength: float = 2.5) -> void:
	var f: float = float(_ads_cfg()["pulse"])
	if f <= 0.0:
		return
	if _ads_tween and _ads_tween.is_valid():
		_ads_tween.kill()
	_ads_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	_ads_tween.tween_method(_set_ads_pulse, strength * f, 0.0, 1.2)
	_ads_club()






var _ads_club_tween: Tween


func _ads_club() -> void:
	if not bool(_ads_cfg()["led"]) or _ad_mats.is_empty():
		return
	var tonos: Array[Color] = _cannon_tonos()
	var a: Color = tonos[0]
	var b: Color = tonos[1] if tonos.size() > 1 else tonos[0]
	if Vector3(a.r - b.r, a.g - b.g, a.b - b.b).length() < 0.35:
		b = Color(0.94, 0.94, 0.92) if a.v < 0.75 else Color(0.12, 0.13, 0.16)
	for mat in _ad_mats:
		mat.set_shader_parameter("gol_a", a)
		mat.set_shader_parameter("gol_b", b)
	if _ads_club_tween and _ads_club_tween.is_valid():
		_ads_club_tween.kill()
	_ads_club_tween = create_tween()
	_ads_club_tween.tween_method(_set_ads_club, 0.0, 1.0, 0.2)
	_ads_club_tween.tween_interval(3.6)
	_ads_club_tween.tween_method(_set_ads_club, 1.0, 0.0, 0.7)


func _set_ads_club(v: float) -> void:
	for mat in _ad_mats:
		mat.set_shader_parameter("club_mix", v)


















const SB_W: int = 288
const SB_H: int = 78
const SB_STRIP_H: int = 22






const SB_LOGO: Vector2i = Vector2i(56, 18)
const SB_CREST: int = 46

var _sb_vp: SubViewport = null
var _sb_bg: ColorRect = null
var _sb_strip: ColorRect = null
var _sb_comp_logo: CompLogo = null
var _sb_comp_name: Label = null
var _sb_minute: Label = null
var _sb_crest_l: CrestView = null
var _sb_crest_r: CrestView = null
var _sb_abbr_l: Label = null
var _sb_abbr_r: Label = null
var _sb_score: Label = null
var _sb_free: Label = null
var _scoreboard_rival: String = "RIV"



func set_scoreboard_rival(abbrev: String) -> void:
	_scoreboard_rival = abbrev



	_scoreboard_teams()









var _sb_left: String = "TU"
var _sb_right: String = "RIV"
var _you_left: bool = true
var _sb_goals: Vector2i = Vector2i.ZERO

func _scoreboard_teams() -> void:



	var you: String = String(GameState.you_of(
		GameState.current_fixture()).get("abbrev", "TU"))
	var rival: String = _scoreboard_rival


	_you_left = _is_home_ground()
	_sb_left = you if _you_left else rival
	_sb_right = rival if _you_left else you
	_scoreboard_crests(rival)
	_scoreboard_comp()
	set_scoreboard(0, 0)


func set_scoreboard(you: int, rival: int) -> void:
	_sb_goals = Vector2i(you if _you_left else rival, rival if _you_left else you)
	if _sb_vp != null:
		_sb_free.visible = false
		_sb_abbr_l.text = _sb_left
		_sb_abbr_r.text = _sb_right


		_sb_score.text = "%d-%d" % [_sb_goals.x, _sb_goals.y]
		_sb_repaint()



	crowd_stakes(you - rival, _clock_minute)







func set_scoreboard_text(text: String) -> void:
	if _sb_vp == null:
		return
	_sb_free.text = text





	var fuente: Font = _sb_free.get_theme_font("font")
	var cabe: bool = fuente == null or fuente.get_string_size(text,
		HORIZONTAL_ALIGNMENT_LEFT, -1, 34).x <= _sb_free.size.x - 8.0
	_sb_free.add_theme_font_size_override("font_size", 34 if cabe else 22)
	_sb_free.visible = true
	_sb_repaint()








func set_scoreboard_texture(tex: Texture2D) -> bool:
	if _sb_vp == null or _scoreboard_mat == null:
		return false
	_scoreboard_mat.set_shader_parameter("screen",
		tex if tex != null else _sb_vp.get_texture())
	return true





func scoreboard_frame() -> Dictionary:
	if _scoreboard_root == null or not _scoreboard_root.is_inside_tree():
		return {}
	var cfg: Dictionary = _scoreboard_cfg()
	var s: float = float(cfg.get("scale", 1.0))
	return {"center": _scoreboard_root.global_position,
		"normal": _scoreboard_root.global_transform.basis.z,
		"width": 10.4 * s, "height": 3.4 * s,
		"bg": cfg["bg"], "ink": cfg["ink"], "manual": bool(cfg.get("manual", false))}




func you_are_host() -> bool:
	return _is_home_ground()





func _scoreboard_crests(rival: String) -> void:
	if _sb_vp == null:
		return
	var home_id: String = _club_local()
	var away: Dictionary = GameState.current_rival()


	var mine: Dictionary = GameState.you_of(GameState.current_fixture())



	var host: Dictionary = Teams.by_id(home_id)
	if host.is_empty() and not home_id.is_empty():
		host = Nations.as_team(home_id)
	if host.is_empty():
		host = mine
	var visitor: Dictionary = mine if not _you_left else away
	if visitor.is_empty():


		visitor = _team_by_abbrev(rival)
	_sb_crest_l.set_team(host)
	_sb_crest_r.set_team(visitor)





func _scoreboard_comp() -> void:
	if _sb_vp == null:
		return
	var fx: Dictionary = GameState.current_fixture()
	if fx.is_empty():
		_sb_comp_logo.visible = false
		_sb_comp_name.text = ""
		return
	var acc: Color = Competitions.accent_of(fx)
	_sb_comp_logo.visible = true
	_sb_comp_logo.setup(Competitions.logo_type_of(fx), acc)




	_sb_comp_name.text = CareerTheme.caps(I18n.t(Competitions.name_of(fx)))



	_sb_comp_name.add_theme_color_override("font_color", CareerTheme.text_on_dark(acc))
	_sb_strip.color = Color(acc.r, acc.g, acc.b, 0.22)




func _scoreboard_minute(minute: int) -> void:
	if _sb_vp == null or _sb_free.visible:
		return
	var txt: String = "%d'" % minute if minute > 0 else ""
	if txt == _sb_minute.text:
		return
	_sb_minute.text = txt
	_sb_repaint()




func _sb_repaint() -> void:
	_sb_vp.render_target_update_mode = SubViewport.UPDATE_ONCE




func _team_by_abbrev(abbrev: String) -> Dictionary:
	if abbrev.is_empty():
		return {}
	for t in Teams.all():
		if String(t.get("abbrev", "")) == abbrev:
			return t
	return {}





func _sb_build_screen(cfg: Dictionary) -> void:
	_sb_vp = SubViewport.new()
	_sb_vp.size = Vector2i(SB_W, SB_H)
	_sb_vp.disable_3d = true
	_sb_vp.gui_disable_input = true
	_sb_vp.transparent_bg = false
	_sb_vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	var ink: Color = cfg["ink"]
	var white: Color = Color(0.96, 0.95, 0.93)
	_sb_bg = ColorRect.new()
	_sb_bg.color = cfg["bg"]
	_sb_bg.size = Vector2(SB_W, SB_H)
	_sb_vp.add_child(_sb_bg)
	if bool(cfg.get("manual", false)):

		for x in [SB_W * 0.5 - 35.0, SB_W * 0.5 + 3.0]:
			var placa: ColorRect = ColorRect.new()
			placa.color = Color("e0ddc7")
			placa.position = Vector2(x, SB_STRIP_H + 3)
			placa.size = Vector2(32, SB_H - SB_STRIP_H - 6)
			_sb_vp.add_child(placa)
			var junta: ColorRect = ColorRect.new()
			junta.color = Color("bbb8a6")
			junta.position = Vector2(x, SB_STRIP_H +(SB_H - SB_STRIP_H) * 0.5)
			junta.size = Vector2(32, 1)
			_sb_vp.add_child(junta)



	_sb_strip = ColorRect.new()
	_sb_strip.color = Color(1, 1, 1, 0.08)
	_sb_strip.size = Vector2(SB_W, SB_STRIP_H)
	_sb_vp.add_child(_sb_strip)
	_sb_comp_logo = CompLogo.new()
	_sb_comp_logo.custom_minimum_size = Vector2(SB_LOGO)
	_sb_comp_logo.position = Vector2(6, 2)
	_sb_comp_logo.size = Vector2(SB_LOGO)
	_sb_vp.add_child(_sb_comp_logo)


	_sb_comp_name = _sb_label(white, 11, HORIZONTAL_ALIGNMENT_CENTER,
		Vector2(68, 0), Vector2(SB_W - 68 * 2, SB_STRIP_H))
	_sb_minute = _sb_label(ink, 11, HORIZONTAL_ALIGNMENT_RIGHT,
		Vector2(SB_W - 46, 0), Vector2(40, SB_STRIP_H))

	var cy: float = SB_STRIP_H +(SB_H - SB_STRIP_H - SB_CREST) * 0.5
	_sb_crest_l = CrestView.new()
	_sb_crest_l.position = Vector2(8, cy)
	_sb_crest_l.size = Vector2(SB_CREST, SB_CREST)
	_sb_vp.add_child(_sb_crest_l)
	_sb_crest_r = CrestView.new()
	_sb_crest_r.position = Vector2(SB_W - 8 - SB_CREST, cy)
	_sb_crest_r.size = Vector2(SB_CREST, SB_CREST)
	_sb_vp.add_child(_sb_crest_r)
	var mid_x: float = 8 + SB_CREST + 4
	var mid_w: float = SB_W - mid_x * 2
	var body_y: float = SB_STRIP_H
	var body_h: float = SB_H - SB_STRIP_H



	_sb_abbr_l = _sb_label(white, 13, HORIZONTAL_ALIGNMENT_LEFT,
		Vector2(mid_x, body_y), Vector2(40, body_h))
	_sb_abbr_r = _sb_label(white, 13, HORIZONTAL_ALIGNMENT_RIGHT,
		Vector2(mid_x + mid_w - 40, body_y), Vector2(40, body_h))
	_sb_score = _sb_label(ink, 26, HORIZONTAL_ALIGNMENT_CENTER,
		Vector2(mid_x + 40, body_y), Vector2(mid_w - 80, body_h))
	_sb_free = _sb_label(ink, 34, HORIZONTAL_ALIGNMENT_CENTER,
		Vector2.ZERO, Vector2(SB_W, SB_H))
	_sb_free.visible = false

	var free_bg: ColorRect = ColorRect.new()
	free_bg.color = cfg["bg"]
	free_bg.size = Vector2(SB_W, SB_H)
	free_bg.show_behind_parent = true
	_sb_free.add_child(free_bg)


func _sb_label(col: Color, size_px: int, align: int, pos: Vector2,
		size: Vector2) -> Label:
	var l: Label = Label.new()
	l.add_theme_font_size_override("font_size", size_px)
	l.add_theme_color_override("font_color", col)
	l.horizontal_alignment = align
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.position = pos
	l.size = size
	_sb_vp.add_child(l)
	return l


func _set_ads_pulse(v: float) -> void:
	for mat in _ad_mats:
		mat.set_shader_parameter("pulse", v)












func _crowd_kit(is_rival: bool) -> Dictionary:
	var kit: Dictionary = {}



	if not is_rival and not home_kit.is_empty():
		kit = home_kit
	elif Engine.has_singleton("GameState") or GameState != null:
		kit = _visitor_kit_now() if is_rival else _host_kit_now()
	if not kit.has("kit"):
		return {}
	var cfg: Dictionary = {"kit": kit["kit"]}


	if is_rival:
		cfg["red_base"] = true
	return cfg






func fan_frames(home: bool = true) -> SpriteFrames:
	return _fan_frames_home if home else _fan_frames_away














func fan_frames_variants(home: bool = true, n: int = 5) -> Array[SpriteFrames]:
	var out: Array[SpriteFrames] = []
	var kit: Dictionary = _crowd_kit(not home)
	var prefix: String = "fan_blue" if home else "fan_red"
	var rng := RandomNumberGenerator.new()
	rng.seed = hash(prefix)
	for i in maxi(n, 1):
		var cfg: Dictionary = kit.duplicate()
		cfg["skin"] = KitRecolor.SKIN_TONES[rng.randi() % KitRecolor.SKIN_TONES.size()]
		cfg["hair"] = KitRecolor.HAIR_COLORS[rng.randi() % KitRecolor.HAIR_COLORS.size()]
		KitRecolor.sin_pelirrojo_oscuro(cfg)
		var frames: SpriteFrames = _build_fan_frames(prefix, cfg)
		if frames != null:
			out.append(frames)
	if out.is_empty():
		var fallback: SpriteFrames = fan_frames(home)
		if fallback != null:
			out.append(fallback)
	return out









static var _fan_base_cache: Dictionary = {}


static func _fan_base(prefix: String) -> Dictionary:
	if _fan_base_cache.has(prefix):
		return _fan_base_cache[prefix]
	var base: String = "res://assets/sprites/crowd/" + prefix
	var hoja: Dictionary = {}
	for anim in ["idle", "cheer", "sad", "boo"]:
		var lista: Array[Texture2D] = []
		for i in range(1, 9):
			var path: String = "%s_%s_%02d.png" % [base, anim, i]
			if not ResourceLoader.exists(path):
				continue
			var raw: Texture2D = load(path)








			if raw != null and _is_front_facing(raw):
				lista.append(raw)
		hoja[anim] = lista
	_fan_base_cache[prefix] = hoja
	return hoja


func _build_fan_frames(prefix: String, kit: Dictionary = {}) -> SpriteFrames:
	var hoja: Dictionary = _fan_base(prefix)
	var frames: SpriteFrames = SpriteFrames.new()
	var any: bool = false






	for anim in ["idle", "cheer", "sad", "boo"]:
		var added: bool = false
		for raw in (hoja[anim] as Array):
			var tex: Texture2D = KitRecolor.apply(raw, kit)
			if not added:
				frames.add_animation(anim)
				frames.set_animation_loop(anim, true)
				frames.set_animation_speed(anim, 6.0)
				added = true
			frames.add_frame(anim, tex)
		any = any or added
	if not any:
		return null
	if not frames.has_animation("idle"):
		frames.add_animation("idle")
		frames.add_frame("idle", frames.get_frame_texture("cheer", 0))
	return frames






static func _is_front_facing(tex: Texture2D) -> bool:




	var img: Image = KitRecolor.lee_imagen(tex, "afición")
	if img == null:
		return true
	var bb: Rect2i = img.get_used_rect()
	if bb.size.y <= 0:
		return true
	var head_bottom: int = bb.position.y + int(bb.size.y * 0.42)
	var eyes: int = 0
	var skin: int = 0
	for y in range(bb.position.y, mini(head_bottom, img.get_height())):
		for x in range(bb.position.x, mini(bb.end.x, img.get_width())):
			var c: Color = img.get_pixel(x, y)
			if c.a < 0.5:
				continue
			if c.v > 0.8 and c.s < 0.25:
				eyes += 1
			var deg: float = c.h * 360.0
			if deg > 3.6 and deg < 36.0 and c.s > 0.15 and c.s < 0.6 and c.v > 0.5:
				skin += 1
	return eyes >= 2 and skin >= 8







const CROWD_REACT_DUR: Dictionary = {
	"goal": 3.2,
	"save": 1.9,
	"post": 1.7,
	"close": 1.4,
	"whistle": 1.2,
}
const CROWD_FRAME_T: float = 0.16
const CROWD_JUMP_H: float = 0.26




func crowd_excite(level: float) -> void:
	_excite_target = clampf(level, 0.0, 1.0)











func crowd_danger(level: float) -> void:
	_danger = clampf(level, -1.0, 1.0)




	var step: float = roundf(_danger / DANGER_STEP) * DANGER_STEP
	if is_equal_approx(step, _danger_step):
		return
	_danger_step = step
	_apply_mood()






























const MOOD_STAND_MAX: float = 0.72


const MOOD_LIFT: float = 0.07


const MOOD_AMBIENT: float = 0.45

var _mood: float = 0.0




func crowd_mood(heat: float) -> void:
	var m: float = clampf(heat, -1.0, 1.0)
	if is_equal_approx(m, _mood):
		return
	_mood = m
	_apply_mood()






func _apply_mood() -> void:
	var home_share: float = maxf(_mood, 0.0) * MOOD_STAND_MAX
	var away_share: float = maxf(- _mood, 0.0) * MOOD_STAND_MAX











	var dp: float = absf(_danger_step) * DANGER_STAND
	if _danger_step > 0.0:
		home_share = maxf(home_share, dp)
	elif _danger_step < 0.0:
		away_share = maxf(away_share, dp)
		home_share = maxf(home_share, dp * DANGER_TENSE_K)



	home_share = maxf(home_share, _gol_pie[1])
	away_share = maxf(away_share, _gol_pie[0])


	home_share = maxf(home_share, _tramo_pie[1])
	away_share = maxf(away_share, _tramo_pie[0])




	var tense_now: bool = _danger_step < 0.0
	for b in _fan_buckets:
		var share: float = home_share if bool(b["home"]) else away_share
		var up: bool = float(b["stand_rank"]) < share




		var tense: bool = up and ((tense_now and bool(b["home"])) or _de_duelo(b)
			or _pide_hora(b))



		if up == bool(b["standing"]) and tense == bool(b.get("tense", false)):
			continue
		b["standing"] = up
		b["tense"] = tense







		b["base"] = _bucket_base(b)
		if int(b["cur"]) < 0:
			var mat: StandardMaterial3D = b["mat"]
			mat.albedo_texture = b["base"]
			var mmi: MultiMeshInstance3D = b["mmi"]
			mmi.position.y = _bucket_rest_y(b)



	for f in _fans_home:
		_set_fan_rest(f, home_share, tense_now or _gol_pena[1]
			or tramo_de(1) == LecturaGol.TRAMO_HORA)
	for f in _fans_away:
		_set_fan_rest(f, away_share, _gol_pena[0] or tramo_de(0) == LecturaGol.TRAMO_HORA)



func _bucket_rest_y(b: Dictionary) -> float:
	return MOOD_LIFT if bool(b["standing"]) else 0.0




























const DESERT_FROM: int = 70
const DESERT_TO: int = 88


const DESERT_GAP: int = 3


const DESERT_MAX: float = 0.45

var _desert: float = 0.0
var _gap: int = 0













































const DESERT_BOX_FROM: int = 62
const DESERT_BOX_TO: int = 86


const DESERT_BOX_GAP: int = 2


const DESERT_BOX_MAX: float = 0.6

const BOX_LEAVE_STEP: float = 1.6







const BOX_LEAVE_STAGGER: float = 0.9
const BOX_LEAVE_WINDOW: float = 7.0







var _box_rooms: Array[Dictionary] = []
var _box_rooms_ord: bool = false
var _desert_box: float = 0.0


var _box_gone_mat: Dictionary = {}












const ARRIVE_UNTIL: int = 15
const ARRIVE_MIN: float = 0.72
const LEAVE_FROM: int = 84
const LEAVE_MAX: float = 0.3





const BREAK_FROM: int = 45
const BREAK_BACK: int = 54
const BREAK_MAX: float = 0.34

var _arrived: float = 1.0
var _leaving: float = 0.0
var _break: float = 0.0



func _tick_gates(minute: int) -> void:
	var was_in: float = _arrived
	var was_out: float = _leaving
	var was_break: float = _break
	_arrived = 1.0
	if minute < ARRIVE_UNTIL:
		_arrived = lerpf(ARRIVE_MIN, 1.0, float(minute) / float(ARRIVE_UNTIL))


	_leaving = LEAVE_MAX * clampf(float(minute - LEAVE_FROM) / 6.0, 0.0, 1.0)



	_break = 0.0
	if minute >= BREAK_FROM and minute < BREAK_BACK:
		_break = BREAK_MAX *(1.0 - clampf(float(minute - BREAK_FROM)
			/ float(BREAK_BACK - BREAK_FROM), 0.0, 1.0))

	if _wet:
		_umbrella_open(lerpf(UMBRELLA_OPEN_MIN, 1.0,
			clampf(float(minute) / float(UMBRELLA_OPEN_UNTIL), 0.0, 1.0)))
	if not is_equal_approx(was_in, _arrived) or not is_equal_approx(was_out, _leaving) \
			or not is_equal_approx(was_break, _break):
		_apply_desert()







func crowd_stakes(gap: int, minute: int) -> void:
	_gap = gap







	_box_desert(gap, minute)
	_away_stakes(gap, minute)
	if _fan_buckets.is_empty() or minute < DESERT_FROM or gap > - DESERT_GAP:
		return
	var ramp: float = clampf(float(minute - DESERT_FROM)
		/ float(DESERT_TO - DESERT_FROM), 0.0, 1.0)

	var depth: float = clampf(float(- gap - DESERT_GAP) * 0.1 + 0.28, 0.0, DESERT_MAX)
	var target: float = depth * ramp
	if target <= _desert + 0.001:
		return
	_desert = target
	_apply_desert()






func _box_desert(gap: int, minute: int) -> void:



	if _box_rooms.is_empty() or minute < DESERT_BOX_FROM or gap > - DESERT_BOX_GAP:
		return



	if not is_inside_tree():
		return
	var ramp: float = clampf(float(minute - DESERT_BOX_FROM)
		/ float(DESERT_BOX_TO - DESERT_BOX_FROM), 0.0, 1.0)



	var depth: float = clampf(float(- gap - DESERT_BOX_GAP) * 0.14 + 0.24,
		0.0, DESERT_BOX_MAX)
	var target: float = depth * ramp
	if target <= _desert_box + 0.001:
		return
	_desert_box = target
	_box_rooms_order()



	var cuota: Dictionary = {}
	for r in _box_rooms:
		var b: String = String(r["banda"])
		cuota[b] = int(cuota.get(b, 0)) + 1
	var idos: Dictionary = {}
	var salen: Array[Dictionary] = []
	for r in _box_rooms:
		var b: String = String(r["banda"])
		var ya: int = int(idos.get(b, 0))
		if int(r["ido"]) != 0:
			idos[b] = ya + 1
			continue




		if float(ya) >= floorf(float(int(cuota[b])) * _desert_box):
			continue
		idos[b] = ya + 1
		salen.append(r)
	if salen.is_empty():
		return





	var paso: float = minf(BOX_LEAVE_STAGGER, BOX_LEAVE_WINDOW / float(salen.size()))
	for k in salen.size():
		_box_room_leave(salen[k], float(k) * paso)












func _box_rooms_order() -> void:
	if _box_rooms_ord:
		return
	_box_rooms_ord = true
	_box_rooms.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["x"]) > float(b["x"]))

















func _box_room_leave(r: Dictionary, espera: float) -> void:
	var g: MeshInstance3D = SceneFade.vivo(r["gente"]) as MeshInstance3D
	if not is_instance_valid(g):
		r["ido"] = 2
		return




	var base: StandardMaterial3D = g.material_override as StandardMaterial3D
	if g.has_meta("fase"):
		var f: StandardMaterial3D = g.get_meta("fase") as StandardMaterial3D
		if f != null:
			base = f
	if base == null:
		r["ido"] = 2
		return





	r["ido"] = 1
	var media: StandardMaterial3D = _box_gone_material(base, 3)
	var vacia: StandardMaterial3D = _box_gone_material(base, 5)
	var tw: Tween = create_tween()



	tw.tween_interval(espera + randf_range(0.0, 0.4))



	tw.tween_callback(_box_room_gone.bind(r, g, media, false))
	tw.tween_interval(BOX_LEAVE_STEP)
	tw.tween_callback(_box_room_gone.bind(r, g, vacia, true))






























func _box_room_gone(r: Dictionary, g: MeshInstance3D, m: StandardMaterial3D,
		fin: bool) -> void:
	if not is_instance_valid(g):
		r["ido"] = 2
		return
	g.set_meta("palco_ido", true)
	g.material_override = m
	if fin:
		r["ido"] = 2









func _box_gone_material(base: StandardMaterial3D, banda: int) -> StandardMaterial3D:
	if _box_gone_mat.has(banda):
		return _box_gone_mat[banda] as StandardMaterial3D
	var m: StandardMaterial3D = base.duplicate() as StandardMaterial3D
	m.uv1_offset = Vector3(0.0, BOX_UV_POSE[banda], 0.0)








	_box_people.append(m)
	_box_people_light(m)
	_box_gone_mat[banda] = m
	return m


func _apply_desert() -> void:
	for b in _fan_buckets:
		var mm: MultiMesh =(b["mmi"] as MultiMeshInstance3D).multimesh
		var total: int = int(b["seats"])





		var left: int = maxi(int(round(float(total)
			* _queda(bool(b.get("mayoria", b["home"])), float(b["seat"])))), 0)

		var antes: int = total if mm.visible_instance_count < 0 else mm.visible_instance_count
		if left != antes:
			mm.visible_instance_count = left
			_recorta_lote(b, antes, left)


	for s in _sueltos:
		var ve: bool = float(s["hueco"]) < _queda(bool(s["mio"]), float(s["seat"]))
		if ve != bool(s["ve"]):
			_pon_suelto(s, ve)





func _queda(mio: bool, seat: float) -> float:





	if not mio:
		return (1.0 - clampf((_desert_away - seat * 0.5) / 0.25, 0.0, 1.0) * 0.9) \
				*(1.0 - _salida_final_de(seat, maxf(_salida_final_away, _salida_gol[0])))




	var frac: float = clampf((_desert - seat) / 0.25, 0.0, 1.0) * 0.85








	var here: float = clampf(_arrived + seat * 0.35, 0.0, 1.0)




	var gone: float = _leaving *(1.0 - seat * 0.6)



	var bar: float = _break *(1.0 - seat * 0.3)
	return (1.0 - frac) * here *(1.0 - gone) *(1.0 - bar) \
			*(1.0 - _salida_final_de(seat, maxf(_salida_final_home, _salida_gol[1])))




func _recorta_lote(b: Dictionary, antes: int, left: int) -> void:

	if b.has("bufandas"):
		_vida_recinto.recorta(b["bufandas"], left)



	if b.has("paraguas_j"):
		var js: PackedInt32Array = b["paraguas_j"]
		var idx: PackedInt32Array = b["paraguas_i"]
		var pmm: MultiMesh = b["paraguas_mm"]
		var k: int = js.bsearch(mini(antes, left))
		while k < js.size() and js[k] < maxi(antes, left):
			var c: Color = pmm.get_instance_color(idx[k])
			c.a = 1.0 if js[k] < left else 0.0
			pmm.set_instance_color(idx[k], c)
			k += 1



	if not (_final_on or _salida_gol_viva) or left >= antes or not b.has("grada"):
		return
	var grada: Dictionary = b["grada"]
	var mmi: MultiMeshInstance3D = b["mmi"]









	if _alfa_de_tribuna(mmi) < 0.999:
		return
	var mm: MultiMesh = mmi.multimesh
	var bid: int = int(b["sec"]) * 8 + int(b["pose"]) * 2 + int(bool(b["local"]))
	for j in range(left, antes):
		if not _salida.cabe(grada):
			return
		if posmod(hash(Vector3i(j, bid, int(grada["id"])&2147483647)), SALIDA_MUESTRA) != 0:
			continue
		var asiento: Vector3 = mm.get_instance_transform(j).origin
		if not _en_plano(mmi.get_parent() as Node3D, asiento):
			continue
		var w: AnimatedSprite3D = AnimatedSprite3D.new()
		w.set_meta("occ_gente", true)
		w.sprite_frames = _finish_frames(bool(b["local"]), int(b["wardrobe"]))
		w.modulate = mm.get_instance_color(j)
		w.pixel_size = 1.5 / 32.0
		w.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		w.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		w.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		w.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		w.position = asiento
		mmi.get_parent().add_child(w)
		var paraguas: Dictionary = {}
		if b.has("paraguas_j"):
			var js: PackedInt32Array = b["paraguas_j"]
			var k: int = js.bsearch(j)
			if k < js.size() and js[k] == j:
				paraguas = {"mm": b["paraguas_mm"], "i":(b["paraguas_i"] as PackedInt32Array)[k]}
		_salida.echa(w, true, grada, asiento, paraguas)




func _alfa_de_tribuna(n: Node) -> float:
	for occ in _occluders:
		var root: Node3D = occ["root"]
		if is_instance_valid(root) and (root == n or root.is_ancestor_of(n)):
			return float(occ["applied"])
	return 1.0




func _en_plano(root: Node3D, local: Vector3) -> bool:
	var cam: Camera3D = SceneFade.camara_de(self) if is_inside_tree() else null
	if cam == null or root == null or not root.is_inside_tree():
		return true
	return cam.is_position_in_frustum(root.to_global(local))



func _pon_suelto(s: Dictionary, ve: bool) -> void:
	s["ve"] = ve



	if s.has("mm"):
		var xf: Transform3D = s["xf"]
		(s["mm"] as MultiMesh).set_instance_transform(int(s["k"]),
			xf if ve else Transform3D(Basis().scaled(Vector3.ONE * 0.0001), xf.origin))
		return





	if s.has("humo"):
		for p in s["humo"]:
			if is_instance_valid(p):
				(p as GeometryInstance3D).emitting = ve
		return
	var nodo: Node3D = s["nodo"]
	if not is_instance_valid(nodo):
		return
	var pmm: MultiMesh = s.get("paraguas_mm")
	if ve:
		_salida.suelta(nodo)
		nodo.visible = true
		if pmm != null:
			var c: Color = pmm.get_instance_color(int(s["paraguas_i"]))
			c.a = 1.0
			pmm.set_instance_color(int(s["paraguas_i"]), c)
		return



	if bool(s.get("anda", false)) and (_final_on or _salida_gol_viva) and s.has("grada") \
			and _salida.cabe(s["grada"]) and not _en_bronca(nodo) \
			and _en_plano(nodo.get_parent() as Node3D, nodo.position):
		_suelta_de_zona(nodo)
		var paraguas: Dictionary = {}
		if pmm != null:
			paraguas = {"mm": pmm, "i": int(s["paraguas_i"])}
		_salida.echa(nodo, false, s["grada"], s["pos0"], paraguas)
		return
	nodo.visible = false
	if pmm != null:
		var c: Color = pmm.get_instance_color(int(s["paraguas_i"]))
		c.a = 0.0
		pmm.set_instance_color(int(s["paraguas_i"]), c)






func _en_la_cola(cola: Dictionary, x: float, fila: int, length: float) -> Dictionary:
	var secs: Array = cola["secciones"]
	var sec_w: float = float(cola["sec_w"])
	var sc: int = clampi(int((x + length * 0.5) / sec_w), 0, secs.size() - 1)
	var info: Dictionary = secs[sc]
	var filas: Array = info["filas"]
	var total: int = int(info["total"])
	var f: int = clampi(fila, 0, filas.size() - 2)
	var f0: float = float(filas[f])
	var f1: float = float(filas[f + 1])
	var fx: float = clampf((x + length * 0.5 - sec_w * float(sc)) / sec_w, 0.0, 1.0)


	var hueco: float = 1.0 if total == 0 \
			else minf(f0 + fx *(f1 - f0), float(total) - 0.5) / float(total)
	return {"mio": info["mio"], "seat": info["seat"], "hueco": hueco, "ve": true}


func _en_bronca(f: Node3D) -> bool:
	for e in _brawl_fans:
		if e["f"] == f:
			return true
	return false




func _suelta_de_zona(f: Node3D) -> void:
	for i in range(_zone_fans.size() - 1, -1, -1):
		if _zone_fans[i]["f"] == f:
			f.position.y = float(_zone_fans[i]["y"])
			_zone_fans.remove_at(i)





func _set_fan_rest(f: AnimatedSprite3D, share: float, tense: bool = false) -> void:
	if not is_instance_valid(f):
		return
	var up: bool = float(f.get_meta("stand_rank", 1.0)) < share




	var want: String = "idle"
	if up:
		want = "sad" if tense else "cheer"
	if String(f.get_meta("rest", "idle")) == want:
		return
	f.set_meta("rest", want)
	if _react_t < 0.0:
		_play_fan(f, want)




































const CONFETTI_N: int = 420














const CONFETTI_LIFE: float = 8.0




const CANNON_FINAL_MAS: float = 1.4




const SERPENTINA: Vector2 = Vector2(0.06, 0.75)
const SERPENTINA_N: int = 40



const CANNON_KICK_M: float = 0.28
const CANNON_KICK_S: float = 0.22

const CANNON_FIRE_MAX: int = 4



const CANNON_TILT: float = 16.0





const CANNON_TUBE_LEN: float = 2.2
const CANNON_BASE_H: float = 0.8



const CANNON_X: float = 4.5





var cannons_ctx_override: Dictionary = {}











var cannon_spots_override: Array[Vector3] = []
var cannon_aim_override: Vector3 = Vector3.ZERO
var cannons_act_force: int = -1
var cannons_manual: bool = false



var _serpentinas: Array[GeometryInstance3D] = []


var _cannon_mms: Array[MultiMesh] = []
var _cannon_pose: Array = []

var _cannon_kick_ms: Array[int] = []

var _cannons_final: bool = false


var _cannon_at: Array[Dictionary] = []

var _cannon_live: Array[int] = []
var _cannon_watch: Timer = null

var _cannons_armed: bool = false


var _confetti_barrido: int = 0

var _cannons_in_replay: bool = false






func _is_home_ground() -> bool:



	if _comp == "nat":
		return _pitch_seed_club() == Nations.canon_id(Career.nationality)





	var inquilino: String = _inquilino()
	if not inquilino.is_empty():
		return inquilino == GameState.player_team_id
	return _pitch_seed_club() == GameState.player_team_id





func _en_partido() -> bool:
	if cannons_ctx_override.has("partido"):
		return bool(cannons_ctx_override["partido"])
	return not (home_only or att_override >= 0.0 or not home_club.is_empty())

















static func canones_permitidos(ctx: Dictionary) -> bool:
	if bool(ctx.get("practica", false)):
		return false
	var nat: bool = bool(ctx.get("nat", false))
	if bool(ctx.get("en_casa", false)):
		return nat or int(ctx.get("div_liga", 0)) == 1
	if bool(ctx.get("final", false)):
		return nat or int(ctx.get("div_tuya", 0)) == 1
	return false



func _cannons_ctx() -> Dictionary:
	var ctx: Dictionary = {
		"practica": _roof or _train or GameState.tutorial_active
			or GameState.training_active or not GameState.practice_kind.is_empty(),
		"en_casa": _is_home_ground(),
		"final": _is_final,
		"nat": _comp == "nat",
		"div_liga": _league_div,
		"div_tuya": GameState.player_div(),
	}
	ctx.merge(cannons_ctx_override, true)
	return ctx




func _cannons_on() -> bool:
	if not _en_partido():
		if cannons_act_force >= 0:
			return cannons_act_force == 1
		return div < 3 and _is_home_ground()
	return canones_permitidos(_cannons_ctx())




















func _host_stand_is_yours() -> bool:
	if home_only or att_override >= 0.0 or not home_club.is_empty():
		return true
	return _is_home_ground()









func _host_kit_now() -> Dictionary:


	if home_kit.has("kit"):
		return home_kit
	return GameState.player_kit() if _host_stand_is_yours() \
			else GameState.rival_kit()


func _visitor_kit_now() -> Dictionary:
	return GameState.rival_kit() if _host_stand_is_yours() \
			else GameState.player_kit()















func _club_paper_ramp(con_blanco: bool) -> Texture2D:
	return _paper_ramp(_club_a, _club_b, con_blanco)











func _paper_ramp(a: Color, b: Color, con_blanco: bool, oro: bool = false) -> Texture2D:
	var tonos: Array[Color] = [a, b]




	if a.is_equal_approx(b):
		tonos[1] = a.lerp(Color("f2f2f0"), 0.55)
	if con_blanco:
		tonos.append(Color(0.92, 0.92, 0.9))

	if oro:
		tonos.append(Color("e8b923"))
	var g: Gradient = Gradient.new()
	g.interpolation_mode = Gradient.GRADIENT_INTERPOLATE_CONSTANT
	var offs: PackedFloat32Array = PackedFloat32Array()
	var cols: PackedColorArray = PackedColorArray()
	for i in tonos.size():
		offs.append(float(i) / float(tonos.size()))
		cols.append(tonos[i])


	g.offsets = offs
	g.colors = cols
	return Particulas.rampa(g)


func _build_confetti() -> void:
	var mesh: QuadMesh = QuadMesh.new()




	mesh.size = Vector2(0.08, 0.13)
	var mat: StandardMaterial3D = StandardMaterial3D.new()


	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.vertex_color_use_as_albedo = true






	mat.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED






	mat.vertex_color_is_srgb = true
	mat.disable_fog = true
	mesh.material = mat
	_env_register(mat)




	_build_paper(mesh)
	if not _cannons_on():
		return
	var tonos: Array[Color] = _cannon_tonos()
	_build_cannon_props(_cannon_spots(), tonos[0])






	var cmesh: QuadMesh = QuadMesh.new()
	cmesh.size = CANNON_PAPER
	cmesh.material = mat


	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.15
	pm.direction = Vector3(0.0, 1.0, 0.0)


	pm.spread = 14.0





	pm.initial_velocity_min = 15.0
	pm.initial_velocity_max = 19.0
	pm.gravity = Vector3(0.0, -6.0, 0.0)
	pm.damping_min = 2.5
	pm.damping_max = 4.5

	pm.angular_velocity_min = -420.0
	pm.angular_velocity_max = 420.0
	pm.scale_min = 0.7
	pm.scale_max = 1.3




	pm.lifetime_randomness = 0.1




	pm.color_initial_ramp = _paper_ramp(tonos[0], tonos[1], false)


	pm.collision_mode = ParticleProcessMaterial.COLLISION_RIGID
	pm.collision_friction = 1.0
	pm.collision_bounce = 0.0
	pm.collision_use_scale = true

	if not Particulas.usa_cpu():
		var suelo: GPUParticlesCollisionBox3D = GPUParticlesCollisionBox3D.new()

		suelo.size = Vector3(140.0, 2.0, 160.0)
		suelo.position = Vector3(0.0, -1.0, HALF_LINE)
		add_child(suelo)





	var encoge: Curve = Curve.new()
	encoge.add_point(Vector2(0.0, 1.0))
	encoge.add_point(Vector2(0.82, 1.0))
	encoge.add_point(Vector2(1.0, 0.0))

	pm.scale_curve = Particulas.curva(encoge)


	var spm: Resource = pm.duplicate()
	spm.initial_velocity_min = 11.0
	spm.initial_velocity_max = 15.0
	spm.angular_velocity_min = -720.0
	spm.angular_velocity_max = 720.0
	spm.spread = 20.0
	for _i in CANNON_FIRE_MAX:
		var p: GeometryInstance3D = Particulas.nodo()


		p.draw_pass_1 = cmesh.duplicate()
		p.amount = CONFETTI_N
		p.lifetime = CONFETTI_LIFE
		p.one_shot = true
		p.emitting = false
		p.explosiveness = 0.92
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


		p.visibility_aabb = AABB(Vector3(-12.0, -4.0, -12.0), Vector3(24.0, 28.0, 24.0))
		p.process_material = pm


		p.process_mode = Node.PROCESS_MODE_ALWAYS
		add_child(p)
		_confetti.append(p)
		var tira: GeometryInstance3D = p.duplicate()
		var smesh: QuadMesh = cmesh.duplicate()
		smesh.size = SERPENTINA
		tira.draw_pass_1 = smesh
		tira.amount = SERPENTINA_N
		tira.process_material = spm
		add_child(tira)
		_serpentinas.append(tira)
		_cannon_kick_ms.append(0)


















func _cannon_spots() -> Array[Vector3]:
	if not cannon_spots_override.is_empty():
		return cannon_spots_override.duplicate()
	var zn: float = -4.0 - _ring_pad_z() - 0.9
	var zf: float = HALF_LINE * 2.0 - zn
	return [Vector3(- CANNON_X, 0.0, zn), Vector3(CANNON_X, 0.0, zn),
		Vector3(- CANNON_X, 0.0, zf), Vector3(CANNON_X, 0.0, zf)]




func _cannon_axis(pie: Vector3) -> Vector3:
	var zc: float = HALF_LINE * 0.35
	if pie.z > HALF_LINE:
		zc = HALF_LINE * 2.0 - zc
	var hacia: Vector3 = Vector3(0.0, 0.0, zc) - pie
	if not cannon_spots_override.is_empty():
		hacia = cannon_aim_override - pie
	hacia.y = 0.0
	return Vector3.UP.rotated(Vector3.UP.cross(hacia.normalized()).normalized(),
		deg_to_rad(CANNON_TILT))







func _build_cannon_props(spots: Array[Vector3], aro: Color) -> void:







	var zocalo_m: CylinderMesh = _cannon_cyl(0.62, 0.68, 0.16, 16)
	var cuerpo_m: CylinderMesh = _cannon_cyl(0.44, 0.48, CANNON_BASE_H - 0.16, 16)
	var tapa_m: CylinderMesh = _cannon_cyl(0.3, 0.46, 0.14, 16)
	var tubo_m: CylinderMesh = _cannon_cyl(0.26, 0.3, CANNON_TUBE_LEN, 14)
	var abraz_m: CylinderMesh = _cannon_cyl(0.34, 0.34, 0.16, 14)
	var boca_m: CylinderMesh = _cannon_cyl(0.42, 0.3, 0.34, 14)

	var piezas: Array = [
		[zocalo_m, Color("15171c"), 0.0, 0.8],
		[cuerpo_m, Color("2b2f37"), 0.35, 0.45],
		[tapa_m, Color("3a3f48"), 0.5, 0.4],
		[tubo_m, Color("9aa1ab"), 0.75, 0.28],
		[abraz_m, Color("1f2228"), 0.3, 0.5],
		[boca_m, aro, 0.2, 0.4],
	]
	var mms: Array[MultiMesh] = []
	for pieza in piezas:
		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = pieza[0]
		mm.instance_count = spots.size()
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = pieza[1]
		mat.metallic = pieza[2]
		mat.metallic_specular = 0.6
		mat.roughness = pieza[3]
		var mi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		mi.multimesh = mm
		mi.material_override = mat
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		add_child(mi)
		mms.append(mm)
	_cannon_at.clear()
	_cannon_mms = mms
	_cannon_pose.clear()
	for i in spots.size():
		var pie: Vector3 = spots[i]
		var eje: Vector3 = _cannon_axis(pie)
		var giro: Basis = Basis(Quaternion(Vector3.UP, eje))
		var arranque: Vector3 = pie + Vector3(0.0, CANNON_BASE_H, 0.0)
		var pose: Array[Transform3D] = [
			Transform3D(Basis(), pie + Vector3(0.0, 0.08, 0.0)),
			Transform3D(Basis(), pie + Vector3(0.0, 0.16 +(CANNON_BASE_H - 0.16) * 0.5, 0.0)),
			Transform3D(giro, arranque + eje * 0.07),
			Transform3D(giro, arranque + eje * CANNON_TUBE_LEN * 0.5),
			Transform3D(giro, arranque + eje * CANNON_TUBE_LEN * 0.42),
			Transform3D(giro, arranque + eje *(CANNON_TUBE_LEN - 0.17)),
		]
		for k in mms.size():
			mms[k].set_instance_transform(i, pose[k])
		_cannon_pose.append(pose)
		_cannon_at.append({"boca": arranque + eje * CANNON_TUBE_LEN, "eje": eje})


func _cannon_cyl(arriba: float, abajo: float, alto: float, lados: int) -> CylinderMesh:
	var m: CylinderMesh = CylinderMesh.new()
	m.top_radius = arriba
	m.bottom_radius = abajo
	m.height = alto
	m.radial_segments = lados
	m.rings = 1
	return m







func _cannon_tonos() -> Array[Color]:
	if _en_partido():
		var t: Dictionary = GameState.you_team()
		if t.has("kit"):
			return [t["kit"], t.get("kit2", t["kit"])]
	return [_club_a, _club_b]











const PAPER_N: int = 220
const PAPER_LIFE: float = 5.5

var _paper: Array[GeometryInstance3D] = []
var _paper_done: bool = false


func _build_paper(mesh: QuadMesh) -> void:
	if div >= 3 or not _is_home_ground():
		return









	var zn: float = -8.0
	var top_y: float = _slope_top().x * 0.62
	for k in 3:
		var p: GeometryInstance3D = Particulas.nodo()
		p.draw_pass_1 = mesh
		p.amount = PAPER_N
		p.lifetime = PAPER_LIFE
		p.one_shot = true
		p.emitting = false


		p.explosiveness = 0.15
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		p.visibility_aabb = AABB(Vector3(-24.0, -24.0, -10.0), Vector3(48.0, 32.0, 20.0))
		var pm: Resource = Particulas.proceso()
		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
		pm.emission_box_extents = Vector3(11.0, 0.5, 0.5)
		pm.direction = Vector3(0.0, 0.2, 1.0)
		pm.spread = 35.0
		pm.initial_velocity_min = 0.6
		pm.initial_velocity_max = 2.4
		pm.gravity = Vector3(0.4, -3.0, 0.0)
		pm.damping_min = 1.2
		pm.damping_max = 2.6
		pm.angular_velocity_min = -300.0
		pm.angular_velocity_max = 300.0
		pm.scale_min = 0.7
		pm.scale_max = 1.2






		pm.color_initial_ramp = _club_paper_ramp(true)
		p.process_material = pm
		p.position = Vector3(float(k - 1) * 13.0, top_y, zn)




		p.process_mode = Node.PROCESS_MODE_ALWAYS
		add_child(p)
		_paper.append(p)




func _fire_paper() -> void:
	if _paper_done:
		return
	_paper_done = true





	var mas: float = _paper_mas()
	for p in _paper:
		if mas > 1.0:
			p.amount = int(PAPER_N * mas)
			p.lifetime = PAPER_LIFE *(1.0 +(mas - 1.0) * 0.5)
		p.restart()
		p.emitting = true


const PAPEL_SUR: Array[String] = ["Argentina", "Bolivia", "Brasil", "Chile",
	"Colombia", "Ecuador", "Paraguay", "Perú", "Uruguay", "Venezuela"]




func _paper_mas() -> float:
	var m: float = 1.0
	if _derby or _is_final or _big_night:
		m += 0.6
	if _country in PAPEL_SUR:
		m += 0.4
	return minf(m, 2.0)





















func flares_at(punto: Vector3, n: int = 3, fila: int = 0, adelante: float = 0.0,
		out: Array = []) -> int:
	if div >= 3 or _flare_spots.is_empty() or n <= 0:
		return 0
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()


	var orden: Array = _flare_spots.duplicate()
	orden.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var ra: Node3D = a["root"]
		var rb: Node3D = b["root"]
		if not is_instance_valid(ra):
			return false
		if not is_instance_valid(rb):
			return true
		return (ra.transform *(a["pos"] as Vector3)).distance_squared_to(punto) \
				<(rb.transform *(b["pos"] as Vector3)).distance_squared_to(punto))
	var puestas: int = 0
	for spot: Dictionary in orden:
		if puestas >= n:
			break
		var root: Node3D = spot["root"]
		if not is_instance_valid(root):
			continue
		_flare_spots.erase(spot)
		var pos: Vector3 = spot["pos"]
		if fila > 0:



			var f: Vector2 = _fan_row_at(fila)
			pos = Vector3(pos.x, f.x + 0.7, f.y)
		pos.z += adelante
		out.append_array(_flare_smoke(root, pos, bool(spot.get("local", true)), rng))
		_flare_n += 1
		puestas += 1
	return puestas









var _goal_humo: Array[Node3D] = []






func _goal_flare(cuantas: int = GOAL_FLARES, lengua: bool = true, holgura: int = 0) -> void:
	if div >= 3 or _flare_spots.is_empty():
		return
	var tope: int = flare_cap if flare_cap > 0 else (FLARE_MAX if _derby else FLARE_MAX_PLAIN)
	var cap: int = tope + GOAL_FLARES + mini(holgura, maxi(FLARE_MAX - tope, 0))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	var primera: bool = lengua
	for _i in cuantas:
		if _flare_n >= cap:
			return



		var idx: int = rng.randi() % _flare_spots.size()
		var spot: Dictionary = _flare_spots[idx]
		_flare_spots.remove_at(idx)
		var root: Node3D = spot["root"]
		if not is_instance_valid(root):
			continue




		_goal_humo.append_array(_flare_smoke(root, spot["pos"], bool(spot.get("local", true)), rng))



		if primera:
			primera = false
			_fire_tongue(root.transform *(spot["pos"] as Vector3))
		_flare_n += 1
		if _flare_spots.is_empty():
			return


func _goal_flare_extra(n: int) -> void:
	_goal_flare(n, false, n)










func _build_flashes() -> void:





	if div >= 3:
		return
	if _flash_spots.is_empty():
		return
	var mesh: QuadMesh = QuadMesh.new()






	mesh.size = Vector2(0.32, 0.32)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED

	mat.albedo_color = Color(1.0, 1.0, 0.97)
	mesh.material = mat
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = _flash_spots.size()











	_flash_lit.resize(_flash_spots.size())
	_flash_wait.resize(_flash_spots.size())
	for i in _flash_spots.size():
		mm.set_instance_transform(i, _flash_xform(i, 0.0))
		_flash_lit[i] = -1.0



		_flash_wait[i] = randf_range(0.0, FLASH_GAP_MAX)
	_flash_mm = MultiMeshInstance3D.new()
	_flash_mm.multimesh = mm





	_flash_mm.visible = false
	_flash_mm.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


	_flash_mm.custom_aabb = AABB(Vector3(-90.0, -2.0, -60.0), Vector3(180.0, 60.0, 230.0))
	_bowl_root().add_child(_flash_mm)









func crowd_flashes(kind: String = "goal") -> void:

	if kind != "kickoff":
		press_flashes()
	if _flash_mm == null or Settings.reduce_motion:
		return
	if not (bool(weather.get("floodlights", false)) or _big_night):
		return
	_flash_t = maxf(_flash_t, float(FLASH_DUR.get(kind, 3.0)))








func _tick_flashes(delta: float) -> void:
	if _flash_t <= 0.0:
		return
	_flash_t -= delta
	_flash_acc += delta
	if _flash_acc < FLASH_TICK and _flash_t > 0.0:
		return
	var step: float = _flash_acc
	_flash_acc = 0.0
	var mm: MultiMesh = _flash_mm.multimesh
	if _flash_t <= 0.0:





		for i in mm.instance_count:
			if _flash_lit[i] > 0.0:
				_flash_lit[i] = -1.0
				mm.set_instance_transform(i, _flash_xform(i, 0.0))
		_flash_mm.visible = false
		_flash_t = 0.0
		return
	_flash_mm.visible = true



	var fade: float = clampf(_flash_t, 0.0, 1.0)
	for i in mm.instance_count:
		if _flash_lit[i] > 0.0:
			_flash_lit[i] -= step
			if _flash_lit[i] <= 0.0:
				mm.set_instance_transform(i, _flash_xform(i, 0.0))
			continue
		_flash_wait[i] -= step
		if _flash_wait[i] > 0.0:
			continue
		_flash_wait[i] = randf_range(FLASH_GAP_MIN, FLASH_GAP_MAX) / maxf(fade, 0.15)
		if randf() > fade:
			continue
		_flash_lit[i] = FLASH_ON


		mm.set_instance_transform(i, _flash_xform(i, randf_range(0.6, 1.0)))






func _flash_xform(i: int, s: float) -> Transform3D:
	return Transform3D(Basis.IDENTITY.scaled(Vector3(s, s, s)), _flash_spots[i])



















const PHONE_FROM: int = 85
const PHONE_TICK: float = 0.1
const PHONE_SIZE: float = 0.26




const PHONE_REACH: float = 0.4

var _phone_mm: MultiMeshInstance3D = null
var _phone_on: bool = false
var _phone_acc: float = 0.0
var _phone_fade: float = 0.0
var _phone_spots: Array[Vector3] = []


func _phone_xform(i: int, s: float) -> Transform3D:
	return Transform3D(Basis.IDENTITY.scaled(Vector3(s, s, s)), _phone_spots[i])


func _build_phone_lights() -> void:
	if div >= 3 or _flash_spots.is_empty() or venue_empty:
		return
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = Vector2(PHONE_SIZE, PHONE_SIZE)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED


	mat.albedo_color = Color(1.0, 0.98, 0.9, 0.9)






	mesh.material = mat
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = _flash_spots.size()
	var centre: Vector3 = Vector3(0.0, 0.0, FIELD_DEPTH * 0.5)
	for i in _flash_spots.size():
		var p: Vector3 = _flash_spots[i]
		var to_field: Vector3 =(Vector3(centre.x, p.y, centre.z) - p).normalized()


		_phone_spots.append(p + to_field * PHONE_REACH + Vector3(0.0, 0.45, 0.0))
		mm.set_instance_transform(i, _phone_xform(i, 0.0))
	_phone_mm = MultiMeshInstance3D.new()
	_phone_mm.multimesh = mm
	_phone_mm.visible = false
	_phone_mm.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_phone_mm.custom_aabb = AABB(Vector3(-90.0, -2.0, -60.0), Vector3(180.0, 60.0, 230.0))
	_bowl_root().add_child(_phone_mm)




func phone_lights(on: bool) -> void:
	if _phone_mm == null:
		return
	if on and not (bool(weather.get("floodlights", false)) or _big_night):
		return
	if on == _phone_on:
		return
	_phone_on = on
	_phone_mm.visible = true


func _tick_phone_lights(delta: float) -> void:
	if _phone_mm == null or not _phone_mm.visible:
		return
	_phone_fade = move_toward(_phone_fade, 1.0 if _phone_on else 0.0, delta * 0.25)
	_phone_acc += delta
	if _phone_acc < PHONE_TICK:
		return
	_phone_acc = 0.0
	var mm: MultiMesh = _phone_mm.multimesh
	if _phone_fade <= 0.0:
		_phone_mm.visible = false
		for i in mm.instance_count:
			mm.set_instance_transform(i, _phone_xform(i, 0.0))
		return



	var t: float = Time.get_ticks_msec() * 0.001
	var still: bool = Settings.reduce_motion
	for i in mm.instance_count:
		var thr: float = float((i * 7919) % 1000) / 1000.0
		if _phone_fade < thr:
			mm.set_instance_transform(i, _phone_xform(i, 0.0))
			continue
		var s: float = 1.0 if still else 0.75 + 0.25 * sin(t * 1.7 + float(i) * 0.37)
		mm.set_instance_transform(i, _phone_xform(i, s))























const PANUELO_SIZE: Vector2 = Vector2(0.36, 0.28)


const PANUELO_REACH: float = 0.4
const PANUELO_ALTO: float = 0.55


const PANUELO_VAIVEN: float = 0.14
const PANUELO_HZ: float = 2.4






const PANUELO_PARTE: float = 0.4
const PANUELO_SPOTS_MAX: int = 9000

var _panuelo_mm: MultiMeshInstance3D = null
var _panuelo_mat: ShaderMaterial = null
var _panuelo_shader: Shader = null
var _panuelo_on: bool = false
var _panuelo_fade: float = 0.0


var _panuelo_cands: Array[Vector3] = []
var _panuelo_seen: int = 0


var _panuelo_rng: RandomNumberGenerator = null



func _panuelo_apunta(p: Vector3) -> void:
	if _panuelo_rng == null:
		_panuelo_rng = RandomNumberGenerator.new()
		_panuelo_rng.seed = 7561
	if _panuelo_rng.randf() >= PANUELO_PARTE:
		return
	_panuelo_seen += 1
	if _panuelo_cands.size() < PANUELO_SPOTS_MAX:
		_panuelo_cands.append(p)
	elif _panuelo_rng.randi() % _panuelo_seen < PANUELO_SPOTS_MAX:
		_panuelo_cands[_panuelo_rng.randi() % PANUELO_SPOTS_MAX] = p


func _build_panuelos() -> void:
	if _panuelo_cands.is_empty() or venue_empty:
		return
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = PANUELO_SIZE
	_panuelo_mat = ShaderMaterial.new()
	_panuelo_mat.shader = _panuelo_make_shader()
	_panuelo_mat.set_shader_parameter("hz", PANUELO_HZ)
	_panuelo_mat.set_shader_parameter("vaiven", PANUELO_VAIVEN)
	mesh.material = _panuelo_mat
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.use_custom_data = true
	mm.mesh = mesh
	mm.instance_count = _panuelo_cands.size()
	var centre: Vector3 = Vector3(0.0, 0.0, FIELD_DEPTH * 0.5)
	for i in _panuelo_cands.size():
		var p: Vector3 = _panuelo_cands[i]
		var to_field: Vector3 =(Vector3(centre.x, p.y, centre.z) - p).normalized()




		var eje_x: Vector3 = Vector3.UP.cross(to_field).normalized()
		mm.set_instance_transform(i, Transform3D(Basis(eje_x, Vector3.UP, to_field),
			p + to_field * PANUELO_REACH + Vector3(0.0, PANUELO_ALTO, 0.0)))



		mm.set_instance_custom_data(i, Color(float((i * 7919) % 1000) / 1000.0,
			fposmod(float(i) * 0.218, 1.0), 0.0, 0.0))
	_panuelo_mm = MultiMeshInstance3D.new()
	_panuelo_mm.multimesh = mm
	_panuelo_mm.visible = false
	_panuelo_mm.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_panuelo_mm.custom_aabb = AABB(Vector3(-90.0, -2.0, -60.0), Vector3(180.0, 60.0, 230.0))
	_bowl_root().add_child(_panuelo_mm)




func _panuelo_make_shader() -> Shader:
	if _panuelo_shader != null:
		return _panuelo_shader
	_panuelo_shader = Shader.new()
	_panuelo_shader.code = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled, shadows_disabled;\n// Blanco roto y no #fff: con el sol de frente el blanco puro se quema y deja de leerse\n// como tela; así conserva un punto de gris que lo separa del cielo.\nuniform vec4 tela : source_color = vec4(0.95, 0.95, 0.92, 1.0);\nuniform float fuera = 0.0;    // el fundido de la tanda, 0..1\nuniform float hz = 2.4;\nuniform float vaiven = 0.14;  // metros de lado a lado\nuniform float quieto = 0.0;   // 1 = «reducir movimiento»: en alto, sin agitar\n\nvoid vertex() {\n\t// El que no ha pasado su umbral se aplasta en un punto: triángulos degenerados, la\n\t// GPU ni los pinta.\n\tfloat sale = step(INSTANCE_CUSTOM.r, fuera);\n\tfloat fase = TIME * 6.2831 * hz + INSTANCE_CUSTOM.g * 6.2831;\n\tfloat mueve = 1.0 - quieto;\n\t// El aleteo: la tela se estrecha en los extremos del recorrido, que es cuando da\n\t// la vuelta. Sólo el ancho; el alto no cambia.\n\tVERTEX.x *= mix(1.0, 0.7 + 0.3 * abs(cos(fase)), mueve);\n\tVERTEX.x += sin(fase) * vaiven * mueve;\n\tVERTEX *= sale;\n}\n\nvoid fragment() {\n\tALBEDO = tela.rgb;\n}\n"



























	return _panuelo_shader



func panolada(on: bool) -> void:
	if _panuelo_mm == null or on == _panuelo_on:
		return
	_panuelo_on = on
	_panuelo_mm.visible = true




func panolada_activa() -> bool:
	return _panuelo_on


func _tick_panuelos(delta: float) -> void:
	if _panuelo_mm == null or not _panuelo_mm.visible:
		return


	_panuelo_fade = move_toward(_panuelo_fade, 1.0 if _panuelo_on else 0.0,
		delta *(0.7 if _panuelo_on else 0.25))
	if _panuelo_fade <= 0.0 and not _panuelo_on:
		_panuelo_mm.visible = false
		return
	_panuelo_mat.set_shader_parameter("fuera", _panuelo_fade)
	_panuelo_mat.set_shader_parameter("quieto", 1.0 if Settings.reduce_motion else 0.0)


























const SWAY_MAX: float = 0.14
const SWAY_SPEED: float = 0.35

var _sway_oculto_s: float = 0.0

func _tick_sway(delta: float) -> void:
	if _fan_buckets.is_empty() or _tv_focus == Vector3.INF or Settings.reduce_motion:
		return




	if not visible:
		_sway_oculto_s += delta
		return


	if _sw_n != _fan_buckets.size():
		_sway_cachea()
	else:
		for i in _sw_raices.size():
			var bas: Basis = _sw_raices[i].global_transform.basis
			if bas != _sw_bases[i]:
				_sw_bases[i] = bas
				_sw_inv[i] = bas.inverse()
				_sw_quieto = false
	if _sw_quieto and _tv_focus == _sw_foco:
		return
	var step: float = SWAY_SPEED * delta
	var llegan: bool = true
	for i in _sw_n:
		var ri: int = _sw_ri[i]
		if ri < 0:
			continue
		var to_ball: Vector3 = _tv_focus - _sw_pos[i]
		to_ball.y = 0.0
		if to_ball.length_squared() < 1.0:
			continue



		var local_dir: Vector3 = _sw_inv[ri] * to_ball.normalized()
		var target_x: float = _sw_x0[i] + clampf(local_dir.x, -1.0, 1.0) * SWAY_MAX
		var mmi: MultiMeshInstance3D = _sw_mmi[i]
		var p: Vector3 = mmi.position


		if absf(target_x - p.x) > step:
			llegan = false
		var q: Vector3 = p
		q.x = move_toward(p.x, target_x, step)
		if q != p:
			mmi.position = q
	_sw_quieto = llegan
	_sw_foco = _tv_focus







const DESERT_AWAY_FROM: int = 65
const DESERT_AWAY_TO: int = 84
var _desert_away: float = 0.0

func _away_stakes(gap: int, minute: int) -> void:
	if _fan_buckets.is_empty() or minute < DESERT_AWAY_FROM or gap < DESERT_GAP:
		return
	var ramp: float = clampf(float(minute - DESERT_AWAY_FROM)
		/ float(DESERT_AWAY_TO - DESERT_AWAY_FROM), 0.0, 1.0)
	var depth: float = clampf(float(gap - DESERT_GAP) * 0.1 + 0.32, 0.0, DESERT_MAX + 0.1)
	var target: float = depth * ramp
	if target <= _desert_away + 0.001:
		return
	_desert_away = target
	_apply_desert()







const DRESS_RAIN: Color = Color("e0c53a")
const DRESS_SNOW: Color = Color("2b2d33")
var _dressed: String = ""


func _finish_frames(local_fan: bool, wardrobe: int) -> SpriteFrames:
	var original: SpriteFrames = _fan_frames_home if local_fan else _fan_frames_away
	if wardrobe == 0:
		return original
	var key: String = "%s_%d_%s" % [str(local_fan), wardrobe, _dressed]
	if _finish_fan_frames.has(key):
		return _finish_fan_frames[key]
	var kit: Dictionary = _crowd_kit(not local_fan)
	var ropa: Array[Color] = [Color("858177"), Color("52677f"), Color("9b8e74")]
	kit["kit"] = ropa[(wardrobe - 1) % ropa.size()]
	if not _dressed.is_empty():
		kit["kit"] = Color(kit["kit"]).lerp(DRESS_SNOW if _dressed == "snow" else DRESS_RAIN,
			0.7 if _dressed == "snow" else 0.55)
	kit["skin"] = KitRecolor.SKIN_TONES[posmod(wardrobe * 3 + int(local_fan), KitRecolor.SKIN_TONES.size())]
	kit["hair"] = KitRecolor.HAIR_COLORS[posmod(wardrobe * 2, KitRecolor.HAIR_COLORS.size())]
	KitRecolor.sin_pelirrojo_oscuro(kit)
	var vestido: SpriteFrames = _build_fan_frames("fan_blue" if local_fan else "fan_red", kit)
	_finish_fan_frames[key] = vestido if vestido != null else original
	return _finish_fan_frames[key]


func _finish_light(on: bool) -> void:
	for mat in _dugout_lamps:
		mat.emission_energy_multiplier = 1.8 if on else 0.0
	for mat in _dugout_interiors:
		mat.emission_energy_multiplier = 0.12 if on else 0.035
	var energia: float = 2.2 if on else 0.0
	for mat in _finish_lamps:
		if not is_equal_approx(mat.emission_energy_multiplier, energia):
			mat.emission_energy_multiplier = energia


func _dress_for_weather() -> void:
	var want: String = ""
	if bool(weather.get("snow", false)):
		want = "snow"
	elif bool(weather.get("rain", false)):
		want = "rain"
	if want == _dressed or _fan_buckets.is_empty():
		return
	_dressed = want
	var home_cfg: Dictionary = _crowd_kit(false)
	var away_cfg: Dictionary = _crowd_kit(true)
	if not want.is_empty():
		var coat: Color = DRESS_SNOW if want == "snow" else DRESS_RAIN


		var k: float = 0.7 if want == "snow" else 0.55
		for cfg in [home_cfg, away_cfg]:
			if cfg.has("kit"):
				cfg["kit"] = Color(cfg["kit"]).lerp(coat, k)
	var fh: SpriteFrames = _build_fan_frames("fan_blue", home_cfg)
	var fa: SpriteFrames = fh if home_only else _build_fan_frames("fan_red", away_cfg)
	if fh == null or fa == null:
		return
	_fan_frames_home = fh
	_fan_frames_away = fa
	for b in _fan_buckets:
		var frames: SpriteFrames = _finish_frames(bool(b.get("local", true)), int(b.get("wardrobe", 0)))
		var idle: Array[Texture2D] = _pose_textures(frames, "idle")
		if idle.is_empty():
			continue
		var was_standing: bool = b["base"] != b["idle"]
		var rest_tex: Texture2D = idle[int(b.get("pose", 0)) % idle.size()]
		b["idle"] = rest_tex
		b["cheer"] = _pose_textures(frames, "cheer")
		b["sad"] = _pose_textures(frames, "sad")
		b["boo"] = _pose_textures(frames, "boo")
		var cheer: Array = b["cheer"]
		b["base"] = cheer[0] if was_standing and not cheer.is_empty() else rest_tex
		b["cur"] = -1
		var mat: StandardMaterial3D = b["mat"]
		mat.albedo_texture = b["base"]





















var _bench_dressed: String = ""

func _dress_bench() -> void:
	if _dugout_people.is_empty():
		return
	var frio: float = Weather.frio01(weather_id(), _season_cold())
	var want: String = "coat" if frio >= BENCH_COAT_FRIO else ""




	if WeatherWear.marks_on(weather_id()):
		want = "chamarra"
	if want == _bench_dressed:
		return
	_bench_dressed = want
	for p in _dugout_people:
		var node: Node = p["node"]
		if not is_instance_valid(node) or not (node is AnimatedSprite3D):
			continue
		if not node.has_meta("viste"):
			continue



		var spr: AnimatedSprite3D = node as AnimatedSprite3D
		var receta: Dictionary = node.get_meta("viste")
		var kit: Dictionary =(receta["seco"] as Dictionary).duplicate()
		if want == "coat":
			kit["kit"] = BENCH_COAT
			kit["kit2"] = BENCH_COAT2



			kit.erase("pattern")
			kit.erase("bib")
		var cfg: Dictionary = KitRecolor.appearance_for(String(receta["quien"]), kit)
		if want == "chamarra":
			cfg["chamarra"] = true
		var frames: SpriteFrames = _sub_frames(cfg,
			bool(receta.get("sentado", false)))
		if frames == null:
			continue



		var anim: String = spr.animation
		var f: int = spr.frame
		var sp: float = spr.speed_scale
		spr.sprite_frames = frames
		if frames.has_animation(anim):
			spr.play(anim)
		else:
			spr.play("idle")
		spr.frame = f % maxi(1, frames.get_frame_count(spr.animation))
		spr.speed_scale = sp



















func redress_bench() -> void:
	if _dugout_people.is_empty():
		return



	var local_es_mia: bool = _host_stand_is_yours()
	for p in _dugout_people:
		if String(p.get("role", "")) != "sub":
			continue
		var node: Node = p["node"]
		if not is_instance_valid(node) or not (node is AnimatedSprite3D) \
				or not node.has_meta("viste"):
			continue
		var receta: Dictionary = node.get_meta("viste")
		if bool(receta.get("abrigo", false)):
			continue
		var is_home: bool = bool(p.get("yours", true)) == local_es_mia
		var kit: Dictionary =(_host_kit_now() if is_home \
				else _visitor_kit_now()).duplicate()


		var seco: Dictionary = receta["seco"]
		if seco.has("bib"):
			kit["bib"] = seco["bib"]
		receta["seco"] = kit.duplicate()
		node.set_meta("viste", receta)
		if _bench_dressed == "coat":
			continue
		var frames: SpriteFrames = _sub_frames(
			KitRecolor.appearance_for(String(receta["quien"]), kit),
			bool(receta.get("sentado", false)))
		if frames == null:
			continue


		var spr: AnimatedSprite3D = node as AnimatedSprite3D
		var anim: String = spr.animation
		var f: int = spr.frame
		var sp: float = spr.speed_scale
		spr.sprite_frames = frames
		if frames.has_animation(anim):
			spr.play(anim)
		else:
			spr.play("idle")
		spr.frame = f % maxi(1, frames.get_frame_count(spr.animation))
		spr.speed_scale = sp



const KID_SCALE: float = 0.55




func _spawn_kid_on_shoulders(root: Node3D, ax: float, u: float,
		rng: RandomNumberGenerator) -> void:
	var adult: AnimatedSprite3D = AnimatedSprite3D.new()
	adult.set_meta("occ_gente", true)
	adult.sprite_frames = _fan_frames_home
	adult.pixel_size = WALKER_HEIGHT / 32.0
	adult.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	adult.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	adult.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	adult.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(adult)
	adult.play("idle")
	adult.speed_scale = rng.randf_range(0.8, 1.1)
	var kid: AnimatedSprite3D = AnimatedSprite3D.new()


	var kid_cfg: Dictionary = KitRecolor.infantil(KitRecolor.appearance_for(
		"%s_nino_grada" % _pitch_seed_club(), _crowd_kit(false)))
	kid.sprite_frames = _person_frames(kid_cfg,
		"res://assets/sprites/anim/celebration_south_")
	kid.sprite_frames.set_animation_speed("cheer", 6.0)
	kid.pixel_size = WALKER_HEIGHT / PERSON_BODY_PX * KID_SCALE
	kid.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	kid.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	kid.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	kid.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	kid.position = Vector3(0.0, WALKER_HEIGHT * 0.78, 0.02)
	adult.add_child(kid)
	kid.play("cheer")
	kid.speed_scale = rng.randf_range(1.3, 1.8)
	var d: Dictionary = {



		"node": adult, "x": ax + rng.randf_range(-0.35, 0.35), "u": u,
		"floor": u, "top": u, "dir": 1.0, "speed": 0.0, "wait": 1000000000.0,
	}
	_place_walker(d)
	_walkers.append(d)



const CAPO_H: float = 1.7
const DRUM_R: float = 0.36

var _capo_drum: MeshInstance3D = null
var _capo_hz: float = 1.1
var _capo_root: Node3D = null



func _build_capo() -> void:
	if div >= 3 or venue_empty or _fan_buckets.is_empty():
		return
	var best: Dictionary = {}
	for b in _fan_buckets:
		if not bool(b.get("local", true)) or not bool(b["pogo"]):
			continue
		if best.is_empty() or float(b["seat"]) < float(best["seat"]):
			best = b
	if best.is_empty():
		return
	var mmi: MultiMeshInstance3D = best["mmi"]
	var root: Node3D = mmi.get_parent() as Node3D
	if root == null:
		return
	var local: Vector3 = root.to_local(best["pos"])
	var frames: SpriteFrames = _person_frames(KitRecolor.appearance_for(
		"%s_capo" % _pitch_seed_club(), _host_kit_now()))
	if frames == null:
		return
	_capo_root = Node3D.new()

	_capo_root.position = Vector3(local.x, BOWL_WALL_H, 0.5)
	root.add_child(_capo_root)
	var man: AnimatedSprite3D = AnimatedSprite3D.new()
	man.set_meta("occ_gente", true)
	man.sprite_frames = frames
	man.pixel_size = CAPO_H / PERSON_BODY_PX
	man.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	man.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	man.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	man.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	man.position = Vector3(0.0, _person_feet(man.pixel_size), 0.0)
	_capo_root.add_child(man)
	man.play("cheer")
	man.speed_scale = 1.6

	var horn: MeshInstance3D = MeshInstance3D.new()
	var cone: CylinderMesh = CylinderMesh.new()
	cone.top_radius = 0.13
	cone.bottom_radius = 0.04
	cone.height = 0.32
	horn.mesh = cone
	var white: StandardMaterial3D = StandardMaterial3D.new()
	white.albedo_color = Color("e8e6e0")
	white.roughness = 0.6
	horn.material_override = white
	horn.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	horn.position = Vector3(0.18, CAPO_H * 0.82, -0.2)
	horn.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_capo_root.add_child(horn)

	_capo_drum = MeshInstance3D.new()
	var drum: CylinderMesh = CylinderMesh.new()
	drum.top_radius = DRUM_R
	drum.bottom_radius = DRUM_R
	drum.height = 0.34
	_capo_drum.mesh = drum
	var skin: StandardMaterial3D = StandardMaterial3D.new()
	skin.albedo_color = _club_a.lerp(Color("d9d2c2"), 0.55)
	skin.roughness = 0.9
	_capo_drum.material_override = skin
	_capo_drum.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	_capo_drum.position = Vector3(1.1, DRUM_R, -0.1)
	_capo_drum.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_capo_root.add_child(_capo_drum)


	_capo_hz = float(best["pogo_hz"])
	for b in _fan_buckets:
		if bool(b["pogo"]) and (b["mmi"] as Node).get_parent() == root:
			b["pogo_hz"] = _capo_hz
			b["pogo_off"] = 0.0




func _tick_capo() -> void:
	if _capo_drum == null:
		return
	var w: float = absf(sin(_pogo_t * _capo_hz * PI))
	var s: float = 1.0 - 0.12 *(1.0 - w)
	_capo_drum.scale = Vector3(s, 1.0, s)








const INVADE_N: int = 36
const INVADE_SPEED: float = 4.2
var _invaders: Array[Dictionary] = []

func pitch_invasion() -> void:
	if _fan_buckets.is_empty() or _fan_frames_home == null or not _invaders.is_empty():
		return
	var pool: Array[Dictionary] = []
	for b in _fan_buckets:
		if bool(b.get("local", true)) and float(b["seat"]) < 0.45:
			pool.append(b)
	if pool.is_empty():
		return
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4242
	for i in INVADE_N:
		var b: Dictionary = pool[rng.randi() % pool.size()]
		var from: Vector3 = b["pos"]
		from.y = BOWL_WALL_H

		var to: Vector3 = Vector3(rng.randf_range(-24.0, 24.0), 0.0,
			rng.randf_range(6.0, 40.0))
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.set_meta("occ_gente", true)
		s.sprite_frames = _fan_frames_home
		s.pixel_size = WALKER_HEIGHT / 32.0
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = from + Vector3(0.0, WALKER_HEIGHT * 0.5, 0.0)
		add_child(s)
		s.play("cheer")
		s.speed_scale = rng.randf_range(1.4, 2.0)
		_invaders.append({
			"node": s, "from": from, "to": to, "t": - rng.randf_range(0.0, 3.0),
			"dur": from.distance_to(to) / INVADE_SPEED,
			"hz": rng.randf_range(1.6, 2.3), "off": rng.randf_range(0.0, TAU),
		})

	crowd_react("home", "goal")


func _tick_invasion(delta: float) -> void:
	if _invaders.is_empty():
		return
	for inv in _invaders:
		inv["t"] = float(inv["t"]) + delta
		var t: float = float(inv["t"])
		var node: AnimatedSprite3D = inv["node"]
		if t < 0.0:
			continue
		var k: float = clampf(t / float(inv["dur"]), 0.0, 1.0)
		var p: Vector3 = Vector3(inv["from"]).lerp(inv["to"], k)
		if k < 1.0:

			p.y = lerpf(float(Vector3(inv["from"]).y), 0.0, minf(k * 3.0, 1.0)) \
					+ absf(sin(t * 6.0)) * 0.12
		else:

			p.y = absf(sin(t * float(inv["hz"]) * PI + float(inv["off"]))) * 0.3
		node.position = p + Vector3(0.0, WALKER_HEIGHT * 0.5, 0.0)







func _build_litter() -> void:
	var tex: Texture2D = _litter_texture()
	for i in LITTER_MAX:
		var s: Sprite3D = Sprite3D.new()
		s.texture = tex
		s.pixel_size = 0.26 / 10.0
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.shaded = true




		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.visible = false
		add_child(s)
		_litter.append({"node": s, "vel": Vector3.ZERO, "spin": Vector3.ZERO,
			"life": 0.0, "bob": 0.0})






func _litter_texture() -> ImageTexture:
	if _litter_tex != null:
		return _litter_tex
	var img: Image = Image.create(10, 8, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))


	var rows: Array = [[3, 6], [2, 8], [1, 9], [1, 8], [0, 9], [1, 7], [2, 7], [3, 5]]
	for y in rows.size():
		var r: Array = rows[y]
		for x in range(int(r[0]), int(r[1])):
			var shade: float = 0.86 if (x + y) % 3 == 0 else 1.0
			img.set_pixel(x, y, Color(0.9 * shade, 0.89 * shade, 0.84 * shade, 1.0))
	_litter_tex = ImageTexture.create_from_image(img)
	return _litter_tex









func _tick_litter(delta: float) -> void:
	if _litter.is_empty():
		return
	var wind2: Vector2 = Vector2(_wind.x, _wind.z)
	var speed: float = wind2.length()


	var any_alive: bool = false
	for p in _litter:
		if float(p["life"]) <= 0.0:
			continue
		any_alive = true
		var s: Sprite3D = p["node"]
		p["life"] = float(p["life"]) - delta
		var v: Vector3 = p["vel"]
		s.position += v * delta



		p["bob"] = float(p["bob"]) + delta *(1.4 + speed * 0.35)
		s.position.y = 0.12 + absf(sin(float(p["bob"]))) *(0.35 + speed * 0.16)
		var spin: Vector3 = p["spin"]
		s.rotation += spin * delta






		var from_mid: Vector2 = Vector2(s.position.x, s.position.z - HALF_LINE)
		if float(p["life"]) <= 0.0 or from_mid.length() > LITTER_EXIT_R:
			p["life"] = 0.0
			s.visible = false
	if speed < LITTER_WIND_MIN or Settings.reduce_motion:
		return
	_litter_next -= delta
	if _litter_next > 0.0:
		return


	_litter_next = randf_range(LITTER_GAP_MIN, LITTER_GAP_MAX) \
			/ clampf(speed / 3.0, 0.5, 2.0)
	if any_alive and _litter.size() > 1 and randf() < 0.5:
		return
	_spawn_litter(wind2, speed)





func _spawn_litter(wind2: Vector2, speed: float) -> void:
	var free: Dictionary = {}
	for p in _litter:
		if float(p["life"]) <= 0.0:
			free = p
			break
	if free.is_empty():
		return
	var dir: Vector2 = wind2.normalized()





	var side: Vector2 = Vector2(- dir.y, dir.x) * randf_range(-22.0, 22.0)
	var enter: Vector2 = side - dir * LITTER_ENTER_R
	var s: Sprite3D = free["node"]
	s.position = Vector3(enter.x, 0.2, HALF_LINE + enter.y)
	s.rotation = Vector3(randf_range(0.0, TAU), randf_range(0.0, TAU), randf_range(0.0, TAU))
	s.visible = true





	var across: Vector2 = Vector2(- dir.y, dir.x) * randf_range(-0.5, 0.5)
	var v2: Vector2 = dir * maxf(speed * 0.75, 1.2) + across
	free["vel"] = Vector3(v2.x, 0.0, v2.y)
	free["spin"] = Vector3(randf_range(-3.0, 3.0), randf_range(-4.5, 4.5),
		randf_range(-3.0, 3.0))
	free["bob"] = randf_range(0.0, TAU)


	free["life"] = 150.0













func _build_pigeons() -> void:
	var wings: Texture2D = _pigeon_texture(true)
	var still: Texture2D = _pigeon_texture(false)
	for i in PIGEON_MAX:
		var s: Sprite3D = _pigeon_sprite(still)
		s.visible = false
		add_child(s)



		_pigeons.append({"node": s, "wings": wings, "still": still,
			"state": "off", "t": 0.0, "hop": 0.0, "hit": false,
			"from": Vector3.ZERO, "to": Vector3.ZERO})
	_build_feathers()







func _pigeon_sprite(tex: Texture2D) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = tex
	s.pixel_size = 0.34 / 12.0
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.shaded = true
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return s














func perch_pigeons(puntos: Array) -> Array[Sprite3D]:
	var out: Array[Sprite3D] = []
	var still: Texture2D = _pigeon_texture(false)
	for p in puntos:
		var s: Sprite3D = _pigeon_sprite(still)
		add_child(s)
		s.position = p
		out.append(s)
	return out




func pigeon_wings() -> Texture2D:
	return _pigeon_texture(true)





func fire_feathers(pos: Vector3) -> void:
	_fire_feathers(pos)












func _build_feathers() -> void:
	var mesh: QuadMesh = QuadMesh.new()


	mesh.size = Vector2(0.05, 0.03)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.vertex_color_use_as_albedo = true



	mat.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mesh.material = mat
	_env_register(mat)
	var p: GeometryInstance3D = Particulas.nodo()
	p.draw_pass_1 = mesh
	p.amount = FEATHER_N
	p.lifetime = FEATHER_LIFE
	p.one_shot = true
	p.emitting = false


	p.explosiveness = 0.95
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


	p.visibility_aabb = AABB(Vector3(-6.0, -6.0, -6.0), Vector3(12.0, 12.0, 12.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.12
	pm.direction = Vector3(0.0, 1.0, 0.0)
	pm.spread = 180.0
	pm.initial_velocity_min = 0.8
	pm.initial_velocity_max = 2.6



	pm.gravity = Vector3(0.0, -0.55, 0.0)
	pm.damping_min = 1.8
	pm.damping_max = 3.4
	pm.angular_velocity_min = -260.0
	pm.angular_velocity_max = 260.0
	pm.scale_min = 0.7
	pm.scale_max = 1.25
	var ramp: Gradient = Gradient.new()


	ramp.set_color(0, Color(0.86, 0.87, 0.9))
	ramp.set_color(1, Color(0.52, 0.54, 0.6))

	pm.color_ramp = Particulas.rampa(ramp)
	p.process_material = pm
	add_child(p)
	_feathers = p






func _pigeon_texture(wings: bool) -> ImageTexture:
	var key: String = "w" if wings else "s"
	if _pigeon_tex.has(key):
		return _pigeon_tex[key]






	var art: Array = []
	if wings:


		art = [
			"DD........DD",
			".BBD....DBB.",
			"..BBD..DBB..",
			"...BBDDBB...",
			"....BBBB....",
			".....DD.....",
			"............",
			"............",
			"............",
		]
	else:



		art = [
			"............",
			"..HH........",
			".PHHH.......",
			"..BBB.......",
			".BBBBBBB....",
			"BBBBBBBBBD..",
			".BBBBBBBDDD.",
			"..DBBBBD....",
			"...P..P.....",
		]
	var img: Image = Image.create(12, 9, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))


	var tone: Dictionary = {
		"B": Color(0.68, 0.7, 0.75), "D": Color(0.42, 0.44, 0.5),
		"H": Color(0.56, 0.58, 0.66), "P": Color(0.3, 0.26, 0.24),
	}
	for y in art.size():
		var row: String = art[y]
		for x in row.length():
			var c: String = row[x]
			if tone.has(c):
				img.set_pixel(x, y, tone[c])
	_pigeon_tex[key] = ImageTexture.create_from_image(img)
	return _pigeon_tex[key]






func _tick_pigeons(delta: float) -> void:
	if _pigeons.is_empty():
		return


	var quiet: bool = _excite < PIGEON_SCARE and _react_t < 0.0 \
			and not bool(weather.get("rain", false)) \
			and not bool(weather.get("snow", false)) and not Settings.reduce_motion



	var any: bool = false



	var aguanta: bool = quiet or _pigeon_hold
	for p in _pigeons:
		if String(p["state"]) != "off":
			any = true
			_tick_pigeon(p, delta, aguanta)


	_pigeon_any = any
	if any or not quiet:
		return
	_pigeon_next -= delta
	if _pigeon_next > 0.0:
		return
	_pigeon_next = randf_range(PIGEON_GAP_MIN, PIGEON_GAP_MAX)
	_land_pigeons()



func _tick_pigeon(p: Dictionary, delta: float, quiet: bool) -> void:
	var s: Sprite3D = p["node"]
	p["t"] = float(p["t"]) + delta
	var t: float = float(p["t"])
	match String(p["state"]):
		"down":
			var k: float = clampf(t / PIGEON_FLY_S, 0.0, 1.0)


			s.position = Vector3(p["from"]).lerp(p["to"], 1.0 - pow(1.0 - k, 2.4))
			if k >= 1.0:
				p["state"] = "ground"
				p["t"] = 0.0
				p["hop"] = randf_range(0.6, 2.4)
				s.texture = p["still"]
		"ground":
			if not quiet:
				_flush_pigeon(p)
				return


			p["hop"] = float(p["hop"]) - delta
			if float(p["hop"]) <= 0.0:
				p["hop"] = randf_range(0.6, 2.4)
				var d: Vector2 = Vector2(randf_range(-1.0, 1.0),
					randf_range(-1.0, 1.0)).normalized() * randf_range(0.15, 0.35)
				p["from"] = s.position
				p["to"] = s.position + Vector3(d.x, 0.0, d.y)
				p["t"] = 0.0
			elif t < PIGEON_HOP_S:
				var h: float = t / PIGEON_HOP_S
				s.position = Vector3(p["from"]).lerp(p["to"], h)
				s.position.y = PIGEON_Y + sin(h * PI) * 0.11
		"up":




			s.position += Vector3(p["to"]) * delta
			if t > PIGEON_FLY_S:
				p["state"] = "off"
				s.visible = false









func _flush_pigeon(p: Dictionary, desde: Vector3 = Vector3.INF) -> void:
	var s: Sprite3D = p["node"]
	p["state"] = "up"
	p["t"] = 0.0
	s.texture = p["wings"]
	var h: float = PIGEON_UP_H
	var alza: float = PIGEON_UP_Y
	var dir: Vector2
	if desde == Vector3.INF:
		var a: float = randf_range(0.0, TAU)
		dir = Vector2(cos(a), sin(a))
	else:
		h = PIGEON_FLEE_H
		alza = PIGEON_FLEE_Y



		var o: Vector3 = to_local(desde)
		dir = Vector2(s.position.x - o.x, s.position.z - o.z)
		if dir.length() < 0.01:


			dir = Vector2(0.0, 1.0)
		dir = dir.normalized()






	if absf(s.position.x + dir.x * h * PIGEON_FLY_S) > FIELD_HALF_W:
		dir.x = - dir.x
	p["to"] = Vector3(dir.x * h, alza, dir.y * h)





func _land_pigeons() -> void:
	var spot: Vector2 = Vector2(randf_range(-26.0, 26.0),
		randf_range(HALF_LINE - 26.0, HALF_LINE + 26.0))



	if absf(spot.y - HALF_LINE) < PIGEON_KEEP and absf(spot.x) < PIGEON_KEEP:
		spot.y +=(PIGEON_KEEP + 5.0) * signf(spot.y - HALF_LINE + 0.01)



	spot.y = maxf(spot.y, PIGEON_Z_NEAR + PIGEON_SPREAD)
	var n: int = randi_range(2, _pigeons.size())
	for i in n:
		var p: Dictionary = _pigeons[i]
		var s: Sprite3D = p["node"]
		var off: Vector2 = Vector2(randf_range(- PIGEON_SPREAD, PIGEON_SPREAD),
			randf_range(- PIGEON_SPREAD, PIGEON_SPREAD))
		p["to"] = Vector3(spot.x + off.x, PIGEON_Y, spot.y + off.y)


		p["from"] = Vector3(p["to"]) + Vector3(randf_range(-9.0, 9.0), 11.0,
			randf_range(-9.0, 9.0))
		s.position = p["from"]
		s.texture = p["wings"]
		s.visible = true
		p["state"] = "down"


		p["t"] = - randf_range(0.0, 0.5)


		p["hit"] = false


	_pigeon_any = true














func hold_pigeons(on: bool) -> void:
	_pigeon_hold = on






















func pigeon_hit_at(punto: Vector3, r: float, espanta: bool = false) -> int:
	if not _pigeon_any:
		return -1
	var r2: float = r * r
	var f2: float = PIGEON_FLEE_R * PIGEON_FLEE_R
	var golpe: int = -1
	for i in _pigeons.size():
		var p: Dictionary = _pigeons[i]



		if String(p["state"]) == "off" or bool(p.get("hit", false)):
			continue
		var s: Sprite3D = p["node"]
		var d2: float = s.global_position.distance_squared_to(punto)
		if d2 <= r2:
			if not espanta:
				return i




			golpe = i
			continue



		if espanta and d2 <= f2 and String(p["state"]) != "up":
			_flush_pigeon(p, punto)
	return golpe









func pigeon_hit(i: int, desde: Vector3) -> Vector3:
	if i < 0 or i >= _pigeons.size():
		return Vector3.INF
	var p: Dictionary = _pigeons[i]
	var s: Sprite3D = p["node"]
	var pos: Vector3 = s.global_position



	p["hit"] = true
	p["state"] = "up"
	p["t"] = 0.0
	s.texture = p["wings"]
	var away: Vector3 = pos - desde
	away.y = 0.0
	if away.length() < 0.01:


		away = Vector3(0.0, 0.0, 1.0)
	away = away.normalized()










	if absf(s.position.x + away.x * PIGEON_KNOCK_H * PIGEON_FLY_S) > FIELD_HALF_W:
		away.x = - away.x
	p["to"] = Vector3(away.x * PIGEON_KNOCK_H, PIGEON_KNOCK_Y,
		away.z * PIGEON_KNOCK_H)


















	for j in _pigeons.size():
		if j == i:
			continue
		var otra: Dictionary = _pigeons[j]
		var est: String = String(otra["state"])




		if est == "off" or est == "up":
			continue



		_flush_pigeon(otra, desde)
	_fire_feathers(pos)
	return pos





func _fire_feathers(pos: Vector3) -> void:
	if _feathers == null:
		return
	_feathers.global_position = pos
	_feathers.restart()
	_feathers.emitting = true








func _fire_confetti() -> void:
	if _en_partido() or cannons_manual:
		return
	_cannonade()



func cannons_fire() -> void:
	_cannonade()
























const FW_LIFE: float = 0.7
const FW_RISE: float = 10.0



const FW_BURST_N: int = 70
const FW_ALTO_MIN: float = 14.0

const FW_CAJA_PALMA := AABB(Vector3(-120.0, -10.0, -80.0), Vector3(240.0, 90.0, 270.0))

var _fw_bocas: Array[GeometryInstance3D] = []
var _fw_burst: GeometryInstance3D = null
var _fw_palmas: Array[GeometryInstance3D] = []
var _fw_armed: bool = false




func _fw_spots() -> Array[Vector3]:




	var top: Vector2 = _slope_top()




	var h: float = maxf(top.x + ROOF_RISE + 1.5, FW_ALTO_MIN)
	var bx: float = SIDE_STAND_X - top.y
	var zn: float = -16.0 + top.y
	var zf: float = FIELD_DEPTH - zn
	var out: Array[Vector3] = []
	var x: float = -40.0
	while x <= 40.0:
		out.append(Vector3(x, h, zn))
		out.append(Vector3(x, h, zf))
		x += 16.0
	var z: float = 4.0
	while z <= 100.0:
		out.append(Vector3(- bx, h, z))
		out.append(Vector3(bx, h, z))
		z += 16.0
	return out


func _build_goal_fireworks() -> void:
	if not _fw_bocas.is_empty() or GameState.tutorial_active:
		return





	var con_palmas: bool = not Particulas.usa_cpu()
	if con_palmas:
		_fw_burst = _fw_palmera_plantilla()
	var rpm: Resource = Particulas.proceso()
	rpm.direction = Vector3(0.0, 1.0, 0.0)
	rpm.spread = 9.0
	rpm.initial_velocity_min = FW_RISE * 0.9
	rpm.initial_velocity_max = FW_RISE * 1.1
	rpm.gravity = Vector3(0.0, -9.8, 0.0)
	if con_palmas:
		rpm.sub_emitter_mode = ParticleProcessMaterial.SUB_EMITTER_AT_END
		rpm.sub_emitter_amount_at_end = FW_BURST_N
	var cohete: QuadMesh = _fw_quad(1.1, 3.0)
	for pos in _fw_spots():
		var p: GeometryInstance3D = Particulas.nodo()
		p.amount = 1
		p.lifetime = FW_LIFE
		p.one_shot = false
		p.emitting = false
		p.local_coords = false
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		p.visibility_aabb = AABB(Vector3(-8.0, -4.0, -8.0), Vector3(16.0, 30.0, 16.0))
		p.process_material = rpm
		p.draw_pass_1 = cohete
		p.position = pos

		p.randomness = 0.35
		p.process_mode = Node.PROCESS_MODE_ALWAYS
		add_child(p)
		if con_palmas:
			_fw_palmera_de(p, pos)
		_fw_bocas.append(p)




func _fw_palmera_plantilla() -> GeometryInstance3D:
	var tonos: Array[Color] = _cannon_tonos()
	_fw_burst = Particulas.nodo()
	_fw_burst.amount = FW_BURST_N * 2
	_fw_burst.lifetime = 2.0
	_fw_burst.local_coords = false
	_fw_burst.emitting = false
	_fw_burst.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_fw_burst.visibility_aabb = FW_CAJA_PALMA
	_fw_burst.process_mode = Node.PROCESS_MODE_ALWAYS
	var bpm: Resource = Particulas.proceso()



	bpm.direction = Vector3(0.0, 1.0, 0.0)
	bpm.spread = 70.0


	bpm.initial_velocity_min = 17.0
	bpm.initial_velocity_max = 22.0
	bpm.gravity = Vector3(0.0, -4.0, 0.0)
	bpm.damping_min = 1.2
	bpm.damping_max = 1.8
	bpm.color_initial_ramp = _paper_ramp(tonos[0], tonos[1], false)

	var fade: Gradient = Gradient.new()
	fade.set_color(0, Color(1, 1, 1, 1))
	fade.set_color(1, Color(1, 1, 1, 0))
	fade.add_point(0.6, Color(1, 1, 1, 0.9))

	bpm.color_ramp = Particulas.rampa(fade)
	_fw_burst.process_material = bpm


	_fw_burst.draw_pass_1 = _fw_quad(1.3, 3.0)
	add_child(_fw_burst)
	return _fw_burst




func _fw_palmera_de(p: GeometryInstance3D, pos: Vector3) -> void:


	var caja_palma: AABB = FW_CAJA_PALMA



	var palma: GeometryInstance3D = _fw_burst if _fw_palmas.is_empty() else _fw_burst.duplicate()
	if palma != _fw_burst:
		add_child(palma)








	palma.position = pos
	palma.visibility_aabb = AABB(caja_palma.position - pos, caja_palma.size)
	_fw_palmas.append(palma)
	p.sub_emitter = p.get_path_to(palma)



func _fw_quad(lado: float, brillo: float) -> QuadMesh:
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(lado, lado)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	mat.disable_fog = true
	mat.emission_enabled = true
	mat.emission = Color(1.0, 0.95, 0.85)
	mat.emission_energy_multiplier = brillo



	var g: Gradient = Gradient.new()
	g.set_color(0, Color(1, 1, 1, 1))
	g.set_color(1, Color(1, 1, 1, 0))
	g.add_point(0.45, Color(1, 1, 1, 0.85))
	var disco: GradientTexture2D = GradientTexture2D.new()
	disco.gradient = g
	disco.fill = GradientTexture2D.FILL_RADIAL
	disco.fill_from = Vector2(0.5, 0.5)
	disco.fill_to = Vector2(1.0, 0.5)
	disco.width = 32
	disco.height = 32
	mat.albedo_texture = disco
	q.material = mat
	return q



func goal_fireworks() -> void:
	if _fw_bocas.is_empty() or Settings.reduce_motion or not is_inside_tree():
		return
	_fw_armed = true
	if not _cannons_in_replay:
		_fw_launch()


func _fw_launch() -> void:
	for i in _fw_bocas.size():
		var p: GeometryInstance3D = _fw_bocas[i]
		p.visible = true
		p.restart()

		p.emitting = false
		SceneFade.timer(0.09 * float(i), true, false, true).timeout.connect(
			_fw_boca_on.bind(i))


	for b: GeometryInstance3D in _fw_palmas:
		b.visible = true


func _fw_boca_on(i: int) -> void:
	if _fw_armed and not _cannons_in_replay and i < _fw_bocas.size():
		_fw_bocas[i].emitting = true


func _fw_off(esconder: bool) -> void:
	for p: GeometryInstance3D in _fw_bocas:
		p.emitting = false
		if esconder:
			p.visible = false
	if esconder:
		for b: GeometryInstance3D in _fw_palmas:
			b.visible = false


func confetti_cannons_fire() -> void:
	if _confetti.is_empty() or not is_inside_tree():
		return
	_cannons_armed = true
	if not _cannons_in_replay:
		_cannonade(true)





func confetti_cannons_stop() -> void:
	_fw_armed = false
	_fw_off(false)
	_cannons_armed = false
	_cannons_in_replay = false
	for p: GeometryInstance3D in _confetti + _serpentinas:
		p.emitting = false







	if _confetti.is_empty() or not is_inside_tree():
		return
	_confetti_barrido += 1
	var turno: int = _confetti_barrido


	SceneFade.timer(CONFETTI_LIFE, true, false, true).timeout.connect(
		_confetti_barre.bind(turno))


func _confetti_barre(turno: int) -> void:
	if turno == _confetti_barrido and not _cannons_armed:
		_confetti_esconde()












func confetti_cannons_clear() -> void:
	confetti_cannons_stop()
	_fw_off(true)
	_confetti_barrido += 1
	_confetti_esconde()


func _confetti_esconde() -> void:
	for p: GeometryInstance3D in _confetti + _serpentinas:
		p.emitting = false
		p.visible = false









func festejo_en_el_aire() -> Array:
	var out: Array = []
	out.append_array(_confetti + _serpentinas + _paper)
	for t in _tongue:
		out.append(t["node"])
	for n in _goal_humo:
		if is_instance_valid(n):
			out.append(n)
	return out





func confetti_cannons_replay_begin() -> void:
	_cannons_in_replay = true
	if _fw_armed:
		_fw_off(true)
	if not _cannons_armed:
		return
	for i in _confetti.size():
		for p: GeometryInstance3D in [_confetti[i], _serpentinas[i]]:
			p.emitting = false
			p.visible = false





func confetti_cannons_replay_goal() -> void:
	if not _cannons_in_replay:
		return
	_cannons_in_replay = false
	if _fw_armed:
		_fw_launch()
	if _cannons_armed:
		_cannonade(true)




func _cannon_ve(cam: Camera3D, idx: int) -> bool:
	if cam == null:
		return true
	var c: Dictionary = _cannon_at[idx]
	var boca: Vector3 = to_global(c["boca"])
	var pie: Vector3 = to_global((c["boca"] as Vector3) -(c["eje"] as Vector3) * CANNON_TUBE_LEN)
	return cam.is_position_in_frustum(boca) or cam.is_position_in_frustum(pie)






const CANNON_WATCH_S: float = 0.15


func _cannons_watch_start() -> void:
	if _cannon_watch == null:
		_cannon_watch = Timer.new()
		_cannon_watch.wait_time = CANNON_WATCH_S
		_cannon_watch.process_mode = Node.PROCESS_MODE_ALWAYS
		_cannon_watch.timeout.connect(_cannons_watch)
		add_child(_cannon_watch)
	_cannon_watch.start()


func _cannons_watch() -> void:
	if not _cannons_armed or _cannons_in_replay:
		_cannon_watch.stop()
		return
	var cam: Camera3D = SceneFade.camara_de(self)
	var ahora: int = Time.get_ticks_msec()
	for i in mini(_cannon_live.size(), _confetti.size()):
		var ve: bool = _cannon_ve(cam, _cannon_live[i])
		if _confetti[i].emitting != ve:
			_confetti[i].emitting = ve
			_serpentinas[i].emitting = ve

		if ve and ahora - _cannon_kick_ms[i] >= int(CONFETTI_LIFE * 1000.0):
			_cannon_kick(i, _cannon_live[i], cam)





func _cannon_kick(slot: int, idx: int, cam: Camera3D) -> void:
	_cannon_kick_ms[slot] = Time.get_ticks_msec()
	var lejos: float = 0.0
	if cam != null:
		lejos = cam.global_position.distance_to(to_global(_cannon_at[idx]["boca"]))
	cannon_boom.emit(clampf(1.2 - lejos / 60.0, 0.25, 1.0))
	if idx >= _cannon_pose.size() or _cannon_mms.is_empty():
		return
	var eje: Vector3 = _cannon_at[idx]["eje"]
	var pose: Array = _cannon_pose[idx]
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	var mueve: Callable = func(v: float) -> void:
		for k in range(3, mini(pose.size(), _cannon_mms.size())):
			var t: Transform3D = pose[k]
			t.origin -= eje * CANNON_KICK_M * v
			_cannon_mms[k].set_instance_transform(idx, t)
	tw.tween_method(mueve, 1.0, 0.0, CANNON_KICK_S).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)



func confetti_cannons_n() -> int:
	return _cannon_at.size()







func _cannonade(sostener: bool = false) -> void:
	if _confetti.is_empty() or _cannon_at.is_empty() or not is_inside_tree():
		return
	_confetti_barrido += 1
	var cam: Camera3D = SceneFade.camara_de(self)
	var elegidos: Array[int] = _cannon_pick(cam)
	_cannon_live.clear()



	if _en_partido():
		var cerca: Array[int] = []
		for i in elegidos:
			if (_cannon_at[i]["boca"] as Vector3).z < HALF_LINE:
				cerca.append(i)
		elegidos = cerca

	var final: bool = _en_partido() and _is_final
	if final != _cannons_final:
		_cannons_final = final
		var tonos: Array[Color] = _cannon_tonos()
		var rampa: Texture2D = _paper_ramp(tonos[0], tonos[1], false, final)
		for q: GeometryInstance3D in _confetti + _serpentinas:
			(q.process_material as Resource).color_initial_ramp = rampa
		for q: GeometryInstance3D in _confetti:
			q.amount = int(CONFETTI_N *(CANNON_FINAL_MAS if final else 1.0))
	for i in mini(elegidos.size(), _confetti.size()):
		var c: Dictionary = _cannon_at[elegidos[i]]
		var t: Transform3D = Transform3D(Basis(Quaternion(Vector3.UP, c["eje"])), c["boca"])
		var lejos: float = 0.0
		if cam != null:
			lejos = cam.global_position.distance_to(to_global(c["boca"]))
		(_confetti[i].draw_pass_1 as QuadMesh).size = CANNON_PAPER * cannon_paper_scale(lejos)



		var p: GeometryInstance3D = _confetti[i]
		p.one_shot = not sostener
		p.visible = true
		p.transform = t
		p.restart()



		p.emitting = _cannon_ve(cam, elegidos[i]) if sostener else true
		var tira: GeometryInstance3D = _serpentinas[i]
		tira.one_shot = p.one_shot
		tira.visible = true
		tira.transform = t
		tira.restart()
		tira.emitting = p.emitting
		if p.emitting:
			_cannon_kick(i, elegidos[i], cam)
		if sostener:
			_cannon_live.append(elegidos[i])
	if sostener:
		_cannons_watch_start()





const CANNON_NEAR: float = 9.0









const CANNON_PAPER: Vector2 = Vector2(0.22, 0.22)
const CANNON_PAPER_REF: float = 20.0
const CANNON_PAPER_MAX: float = 4.0


static func cannon_paper_scale(lejos: float) -> float:
	return clampf(lejos / CANNON_PAPER_REF, 1.0, CANNON_PAPER_MAX)







func _cannon_pick(cam: Camera3D) -> Array[int]:
	var filas: Array = []
	for i in _cannon_at.size():
		var c: Dictionary = _cannon_at[i]
		var boca: Vector3 = to_global(c["boca"])
		var alto: Vector3 = to_global((c["boca"] as Vector3) +(c["eje"] as Vector3) * 8.0)
		var clase: int = 0
		var d: float = 0.0
		if cam != null:
			d = cam.global_position.distance_to(boca)
			var ve: bool = cam.is_position_in_frustum(boca) or cam.is_position_in_frustum(alto)
			clase =(0 if d >= CANNON_NEAR else 1) if ve else 2
		filas.append([clase, d, i])
	filas.sort_custom(func(a: Array, b: Array) -> bool:
		return a[0] < b[0] if a[0] != b[0] else a[1] < b[1])
	var out: Array[int] = []
	for f in filas:
		out.append(int(f[2]))
	return out


func crowd_react(side: String, kind: String = "goal") -> void:


	_excite_target = 0.0
	_excite = 0.0



	_danger = 0.0
	_danger_step = 0.0
	_ambient_vacia()



	_fervor = 0.0
	_ole_on = false


	_react_jump = kind == "goal" or kind == "save"
	_react_dur = float(CROWD_REACT_DUR.get(kind, 1.6))
	_react_t = 0.0
	_react_home = "cheer" if side == "home" else "sad"
	_react_away = "sad" if side == "home" else "cheer"



	if home_only:
		_react_away = _react_home



	_pending_fans.clear()
	for f in _fans_home:
		_queue_fan(f, _react_home)
	for f in _fans_away:
		_queue_fan(f, _react_away)




	_coach_react(_react_home, _react_away)
	if kind == "close" and _tv_focus.is_finite() and _tv_focus.y < 3.0 \
			and (absf(_tv_focus.x) > FIELD_HALF_W or _tv_focus.z < 0.0 or _tv_focus.z > FIELD_DEPTH):
		_vida_recinto.devolver(_tv_focus)






	_react_hold = false




	if kind == "goal":
		crowd_flashes("goal")
	if side == "home" and kind == "goal":
		_fire_confetti()
		_goal_flare()







	if kind == "goal":
		_start_chant(CHANT_GOAL, -1 if home_only else (1 if side == "home" else 0))















func crowd_boo(dur: float = 2.4, rival_kick: bool = false) -> void:
	_excite_target = 0.0
	_excite = 0.0



	_danger = 0.0
	_danger_step = 0.0
	_ambient_vacia()
	_react_hold = false
	_react_jump = false
	_fervor = 0.0
	_ole_on = false
	_react_dur = maxf(dur, 0.1)
	_react_t = 0.0
	_react_home = "boo"
	_react_away = "cheer" if rival_kick else "boo"
	_pending_fans.clear()
	for f in _fans_home:
		_queue_fan(f, _react_home)
	for f in _fans_away:
		_queue_fan(f, _react_away)
















const CROWD_HOLD_TAIL: float = 1.2

var _react_hold: bool = false



















const SALIDA_FINAL_DUR: float = 7.0

const SALIDA_MUESTRA: int = 4
var _salida_final_home: float = 0.0
var _salida_final_away: float = 0.0
var _tw_salida: Tween = null



var _final_on: bool = false
var _final_dif: int = 0







var _sede_neutral: bool = false
var _casa_es_tuya: bool = true






func crowd_final(side: String) -> void:
	var dif: int = 0
	if side == "home" or side == "away":
		dif =(1 if side == "home" else -1) *(1 if you_are_host() else -1) \
				* maxi(absi(_gap), 1)
	crowd_final_tuyo(dif)




func crowd_final_tuyo(dif: int) -> void:
	if _final_on and dif == _final_dif:
		return
	_final_on = true
	_final_dif = dif
	if _tw_salida != null:
		_tw_salida.kill()


	_salida.limpia()
	_salida_final_home = 0.0
	_salida_final_away = 0.0
	_apply_desert()
	if dif != 0:
		crowd_react("home" if dif > 0 else "away", "goal")
		crowd_hold(true)
	else:
		crowd_hold(false)








	var casa: bool = _casa_es_tuya
	var neutral: bool = _sede_neutral
	var sale_tuya: float = _salida_de(signi(dif), casa and not neutral, absi(dif))
	var sale_rival: float = _salida_de(- signi(dif), not casa and not neutral, absi(dif))
	_tw_salida = create_tween()
	_tw_salida.tween_method(func(v: float) -> void:
		_salida_final_home = v * sale_tuya
		_salida_final_away = v * sale_rival
		_apply_desert(),
		0.0, 1.0, SALIDA_FINAL_DUR).set_delay(1.2) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)













const SALIDA_PIERDE_CASA: Vector2 = Vector2(0.38, 0.07)
const SALIDA_PIERDE_FUERA: Vector2 = Vector2(0.26, 0.05)
const SALIDA_TOPE_CASA: float = 0.6
const SALIDA_TOPE_FUERA: float = 0.42
const SALIDA_DERBI: float = 0.06
const SALIDA_EMPATE_CASA: float = 0.16
const SALIDA_EMPATE_FUERA: float = 0.07


func _salida_de(resultado: int, casa: bool, margen: int) -> float:
	if resultado > 0:
		return 0.0
	if resultado == 0:
		return SALIDA_EMPATE_CASA if casa else SALIDA_EMPATE_FUERA
	var base: Vector2 = SALIDA_PIERDE_CASA if casa else SALIDA_PIERDE_FUERA
	var v: float = minf(base.x + base.y * float(maxi(margen, 1) - 1),
		SALIDA_TOPE_CASA if casa else SALIDA_TOPE_FUERA)
	return v +(SALIDA_DERBI if _derby else 0.0)




func _salida_final_de(seat: float, v: float) -> float:
	if v <= 0.0:
		return 0.0
	return clampf(v *(1.3 - seat * 0.6), 0.0, 1.0)


func crowd_hold(on: bool) -> void:
	if on == _react_hold:
		return
	_react_hold = on
	if on or _react_t < 0.0:
		return
	_react_t = 0.0
	_react_dur = CROWD_HOLD_TAIL































const LecturaGol := preload("res://features/match/lectura_gol.gd")




const GOL_PIE_HISTORICA: float = 0.9
const GOL_PIE_SOSTENIDA: float = 0.7
const GOL_PIE_EMPUJA: float = 0.5
const GOL_PIE_PENA: float = 0.7


const GOL_DURA_SOSTENIDA: float = 45.0
const GOL_DURA_EMPUJA: float = 40.0
const GOL_DURA_LARGO: float = 25.0


const GOL_BAJA: float = 8.0

const GOL_CANTO_SOSTENIDA: float = 52.0
const GOL_CANTO_EMPUJA: float = 40.0


const GOL_BENGALAS_HISTORICA: int = 3
const GOL_BENGALAS_SOSTENIDA: int = 1


const GOL_FERVOR_HISTORICA: float = 0.75
const GOL_FERVOR_SOSTENIDA: float = 0.45



const OLE_DESDE: float = 3.2
const OLE_COMPAS: float = 1.4
const OLE_SALTO: float = 0.5
const OLE_JUMP: float = 1.5
const OLE_CUADRO: int = 2






const GOL_SALE_LARGO_CASA: float = 0.1
const GOL_SALE_LARGO_FUERA: float = 0.06
const GOL_SALE_VACIA_CASA: float = 0.34
const GOL_SALE_VACIA_FUERA: float = 0.24
const GOL_SALE_ESPERA: float = 3.0
const GOL_SALE_DUR: float = 12.0

var _gol_pie: Array[float] = [0.0, 0.0]
var _gol_pie_t: Array[float] = [0.0, 0.0]
var _gol_pena: Array[bool] = [false, false]
var _fervor: float = 0.0
var _fervor_mio: bool = true
var _ole_on: bool = false
var _salida_gol: Array[float] = [0.0, 0.0]
var _salida_gol_meta: Array[float] = [0.0, 0.0]
var _salida_gol_espera: Array[float] = [0.0, 0.0]

var _salida_gol_viva: bool = false




func crowd_lectura(tuyo: bool, marca: String, encaja: String, minuto: int = 90) -> void:
	var m: int = int(tuyo)
	var e: int = 1 - m



	if _gol_pena[m]:
		_gol_pena[m] = false
		_gol_pie[m] = 0.0
		_gol_pie_t[m] = 0.0
	_salida_gol_meta[m] = _salida_gol[m]



	if not _gol_pena[e]:
		_gol_pie[e] = 0.0
		_gol_pie_t[e] = 0.0
	_fervor = GOL_FERVOR_HISTORICA if marca == LecturaGol.GRADA_HISTORICA \
			else (GOL_FERVOR_SOSTENIDA if marca == LecturaGol.GRADA_SOSTENIDA else 0.0)
	_fervor_mio = tuyo
	_ole_on = marca == LecturaGol.GRADA_OLE
	var bando: int = -1 if home_only else m
	if marca == LecturaGol.GRADA_HISTORICA:
		_gol_de_pie(m, GOL_PIE_HISTORICA, INF)
		_start_chant(INF, bando)
		if tuyo:
			_goal_flare_extra(GOL_BENGALAS_HISTORICA)
	elif marca == LecturaGol.GRADA_SOSTENIDA:
		_gol_de_pie(m, GOL_PIE_SOSTENIDA, GOL_DURA_SOSTENIDA)
		_start_chant(GOL_CANTO_SOSTENIDA, bando)
		if tuyo:
			_goal_flare_extra(GOL_BENGALAS_SOSTENIDA)
	elif marca == LecturaGol.GRADA_EMPUJA:
		_gol_de_pie(m, GOL_PIE_EMPUJA, GOL_DURA_EMPUJA)
		_start_chant(GOL_CANTO_EMPUJA, bando)


	if not home_only and (encaja == LecturaGol.GRADA_LAMENTO_LARGO
			or encaja == LecturaGol.GRADA_SE_VACIA):
		var hasta_el_final: bool = encaja == LecturaGol.GRADA_SE_VACIA
		_gol_pena[e] = true
		_gol_de_pie(e, GOL_PIE_PENA, INF if hasta_el_final else GOL_DURA_LARGO)
		if hasta_el_final or minuto >= LecturaGol.MIN_TARDIO:
			var casa: bool =((e == 1) == _casa_es_tuya) and not _sede_neutral
			var sale: float =(GOL_SALE_VACIA_CASA if casa else GOL_SALE_VACIA_FUERA) \
					if hasta_el_final else (GOL_SALE_LARGO_CASA if casa else GOL_SALE_LARGO_FUERA)
			sale += SALIDA_DERBI if _derby else 0.0
			if sale > _salida_gol_meta[e]:
				_salida_gol_meta[e] = sale
				_salida_gol_espera[e] = GOL_SALE_ESPERA



	if marca != LecturaGol.GRADA_FIESTA:
		crowd_hold(true)
	_apply_mood()
	_refresh_bases()


func _gol_de_pie(i: int, piso: float, dura: float) -> void:
	_gol_pie[i] = maxf(_gol_pie[i], piso)
	_gol_pie_t[i] = maxf(_gol_pie_t[i], dura)



func _de_duelo(b: Dictionary) -> bool:
	return _gol_pena[int(bool(b["home"]))]





func _tick_lectura(delta: float) -> void:
	if _react_t < 0.0:
		var animo: bool = false
		for i in 2:
			if _gol_pie[i] <= 0.0:
				continue
			if _gol_pie_t[i] > 0.0:
				_gol_pie_t[i] -= delta
				continue


			var antes: float = _gol_pie[i]
			_gol_pie[i] = maxf(antes - delta / GOL_BAJA, 0.0)
			if _gol_pie[i] <= 0.0:
				_gol_pena[i] = false
				animo = true
			elif floorf(antes * 20.0) != floorf(_gol_pie[i] * 20.0):
				animo = true
		if animo:
			_apply_mood()
			_refresh_bases()
	var sale: bool = false
	for i in 2:
		if _salida_gol[i] >= _salida_gol_meta[i]:
			continue
		if _salida_gol_espera[i] > 0.0:
			_salida_gol_espera[i] -= delta
			continue
		_salida_gol[i] = minf(_salida_gol[i] + _salida_gol_meta[i] * delta / GOL_SALE_DUR,
			_salida_gol_meta[i])
		sale = true
	_salida_gol_viva = sale
	if sale:
		_apply_desert()



func _ole_pulso(t: float) -> float:
	var u: float = fposmod(t, OLE_COMPAS)
	return sin(PI * u / OLE_SALTO) if u < OLE_SALTO else 0.0






















const TRAMO_PIE: Vector2 = Vector2(0.35, 0.8)
const TRAMO_SUBE: float = 6.0
const TRAMO_CANTO: float = 8.0

var _tramo_pide: Array[String] = ["", ""]
var _tramo_meta: float = 0.0
var _tramo_pie: Array[float] = [0.0, 0.0]
var _tramo_visto: Array[String] = ["", ""]





func crowd_tramo(tuya: String, rival: String, avance: float) -> Array[String]:
	_tramo_pide = [rival, tuya]
	_tramo_meta = lerpf(TRAMO_PIE.x, TRAMO_PIE.y, clampf(avance, 0.0, 1.0))
	var vivo: Array[String] = [tramo_de(0), tramo_de(1)]
	return vivo




func tramo_de(i: int) -> String:
	if _fan_buckets.is_empty() or (home_only and i == 0):
		return ""
	if _gol_pie[i] > 0.0 or _gol_pena[i]:
		return ""
	return _tramo_pide[i]




func _pide_hora(b: Dictionary) -> bool:
	return tramo_de(int(bool(b["home"]))) == LecturaGol.TRAMO_HORA


func _tick_tramo(delta: float) -> void:
	var animo: bool = false
	for i in 2:
		var modo: String = tramo_de(i)
		if modo != _tramo_visto[i]:
			_tramo_visto[i] = modo
			animo = true
		var antes: float = _tramo_pie[i]
		var meta: float = 0.0 if modo.is_empty() else _tramo_meta
		if antes != meta:
			_tramo_pie[i] = move_toward(antes, meta, delta / TRAMO_SUBE)


			if floorf(antes * 20.0) != floorf(_tramo_pie[i] * 20.0) or _tramo_pie[i] == meta:
				animo = true




		var dueno: int = -1 if home_only else i
		if modo == LecturaGol.TRAMO_EMPUJA and _react_t < 0.0 \
				and (_chant_t <= 0.0 or _chant_bando == dueno) and _chant_t < TRAMO_CANTO * 0.5:
			_start_chant(TRAMO_CANTO, dueno)
	if animo:
		_apply_mood()
		_refresh_bases()
























const ZONE_R: float = 15.0
const ZONE_JUMP_MUL: float = 2.4
const ZONE_HZ_MUL: float = 1.4
const ZONE_FAN_HOP: float = 0.34
const ZONE_FAN_MAX: int = 48

var _zone_pos: Vector3 = Vector3.ZERO
var _zone_r: float = 0.0
var _zone_t: float = 0.0

var _zone_fans: Array[Dictionary] = []





func crowd_zone(pos: Vector3, dur: float = 5.0, radius: float = ZONE_R) -> void:




	var lp: Vector3 = _wp(pos)
	if _zone_t > 0.0 and is_equal_approx(_zone_r, maxf(radius, 1.0)) \
			and Vector2(lp.x - _zone_pos.x, lp.z - _zone_pos.z).length() < 4.0:
		_zone_t = maxf(_zone_t, dur)
		return
	_zone_pos = lp
	_zone_r = maxf(radius, 1.0)
	_zone_t = maxf(dur, 0.1)
	_zone_release_fans()
	if _fans_home.is_empty() and _fans_away.is_empty():
		return
	var r2: float = _zone_r * _zone_r
	for f in _fans_home + _fans_away:
		if _zone_fans.size() >= ZONE_FAN_MAX:
			break

		if not is_instance_valid(f) or not f.visible or f.has_meta("andando"):
			continue
		var p: Vector3 = f.global_position


		if Vector2(p.x - pos.x, p.z - pos.z).length_squared() > r2:
			continue
		_zone_fans.append({"f": f, "y": f.position.y,
			"hz": randf_range(1.9, 2.6), "off": randf_range(0.0, TAU)})

























const BRAWL_RING: float = 34.0
const BRAWL_RING_N: int = 8




const BRAWL_HUDDLE: float = 1.1
const BRAWL_PULL_MAX: float = 4.5
const BRAWL_MAX: int = 12
const BRAWL_DUR: float = 3.5
const BRAWL_SHOVE: float = 0.26
const BRAWL_FALL_P: float = 0.22


func crowd_brawl(pos: Vector3, dur: float = BRAWL_DUR) -> void:
	if _brawl_on:
		return





	var centro: Vector3 = _brawl_anchor(pos)
	if centro == Vector3.INF:
		return






	var cerca: Array[AnimatedSprite3D] = []
	for f in _fans_home + _fans_away:


		if is_instance_valid(f) and f.visible and not f.has_meta("andando") \
				and Vector2(f.global_position.x - centro.x,
					f.global_position.z - centro.z).length() <= BRAWL_RING:
			cerca.append(f)
	if cerca.size() < 4:
		return
	cerca.sort_custom(func(a: AnimatedSprite3D, b: AnimatedSprite3D) -> bool:
		return a.global_position.distance_squared_to(centro) \
				< b.global_position.distance_squared_to(centro))
	var dentro: Array[AnimatedSprite3D] = []
	var anillo: Array[AnimatedSprite3D] = []
	for i in cerca.size():
		if i < BRAWL_MAX:
			dentro.append(cerca[i])
		elif i < BRAWL_MAX + BRAWL_RING_N:
			anillo.append(cerca[i])
	_brawl_on = true






	_brawl_extras(centro, dur)
	for f in dentro:
		_brawl_shove(f, centro, dur, true)
	for f in anillo:
		_brawl_shove(f, centro, dur, false)

	crowd_boo(dur * 0.8)
	SceneFade.timer(dur + 0.6, false).timeout.connect(_brawl_end)






func _brawl_anchor(pos: Vector3) -> Vector3:
	var mejor: float = INF
	var donde: Vector3 = Vector3.INF
	for f in _fans_home + _fans_away:
		if not is_instance_valid(f) or not f.visible:
			continue
		var q: Vector3 = f.global_position
		var d: float = Vector2(q.x - pos.x, q.z - pos.z).length_squared()
		if d < mejor:
			mejor = d
			donde = q
	return donde



var _brawl_on: bool = false


var _brawl_fans: Array[Dictionary] = []


func brawl_running() -> bool:
	return _brawl_on



func brawl_count() -> int:
	return _brawl_fans.size()










func _brawl_shove(f: AnimatedSprite3D, centro: Vector3, dur: float,
		dentro: bool) -> void:
	var g0: Vector3 = f.global_position
	var rot0: float = f.rotation.z
	_brawl_fans.append({"f": f, "pos": f.position, "rot": rot0})
	var hacia: Vector3 = Vector3(centro.x - g0.x, 0.0, centro.z - g0.z)
	var dist: float = hacia.length()
	if dist < 0.05:
		hacia = Vector3(1.0, 0.0, 0.0)
		dist = 1.0
	hacia /= dist
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	if not dentro:


		var lejos: Vector3 = g0 - hacia * BRAWL_SHOVE * 1.3
		tw.tween_property(f, "global_position", lejos, 0.28)
		tw.tween_interval(dur - 0.5)
		tw.tween_property(f, "global_position", g0, 0.35)
		return



	var anda: float = minf(maxf(dist - BRAWL_HUDDLE, 0.0), BRAWL_PULL_MAX)
	var apretado: Vector3 = g0 + hacia * anda
	tw.tween_property(f, "global_position", apretado, randf_range(0.28, 0.45))



	var lateral: Vector3 = Vector3(- hacia.z, 0.0, hacia.x)
	var hz: float = randf_range(7.0, 11.0)
	var paso: float = 1.0 / hz
	var lado: float = 1.0 if randf() < 0.5 else -1.0
	var t: float = 0.0
	while t < dur:
		tw.tween_property(f, "global_position",
			apretado + lateral * BRAWL_SHOVE * lado * randf_range(0.6, 1.4), paso)
		lado = - lado
		t += paso



	if randf() < BRAWL_FALL_P:
		var tf: Tween = create_tween()
		tf.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tf.tween_interval(randf_range(0.6, 1.4))
		tf.tween_property(f, "rotation:z", rot0 + deg_to_rad(58.0 * lado), 0.22)
		tf.tween_interval(maxf(dur - 2.0, 0.3))
		tf.tween_property(f, "rotation:z", rot0, 0.3)



	tw.tween_property(f, "global_position", g0, 0.32)





const BRAWL_EXTRA: int = 10
const BRAWL_EXTRA_STEP: float = 0.62

var _brawl_props: Array[Node3D] = []










func _brawl_extras(centro: Vector3, dur: float) -> void:
	var frames: SpriteFrames = _fan_frames_home if _fan_frames_home != null \
			else _fan_frames_away
	if frames == null:
		return


	var haciacampo: Vector3 = Vector3(- centro.x, 0.0, FIELD_DEPTH * 0.5 - centro.z)
	if haciacampo.length() < 0.01:
		haciacampo = Vector3(0.0, 0.0, 1.0)
	haciacampo = haciacampo.normalized()
	var largo: Vector3 = Vector3(- haciacampo.z, 0.0, haciacampo.x)
	for i in BRAWL_EXTRA:
		var fila: int = i % 2
		var col: float = float(i / 2) - float(BRAWL_EXTRA / 2) * 0.25
		var base: Vector3 = centro \
				+ largo *(col * BRAWL_EXTRA_STEP + randf_range(-0.08, 0.08)) \
				+ haciacampo *(0.1 + float(fila) * 0.42) \
				+ Vector3(0.0, - float(fila) * 0.3, 0.0)
		var f: AnimatedSprite3D = AnimatedSprite3D.new()
		f.sprite_frames = frames
		f.pixel_size = 1.5 / 32.0
		f.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		f.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		f.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		f.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



		f.set_meta("occ_gente", true)
		add_child(f)
		f.global_position = base
		f.play("cheer" if frames.has_animation("cheer") else "idle")
		f.speed_scale = randf_range(1.2, 1.8)
		_brawl_props.append(f)
		_brawl_shove(f, centro, dur, true)






func _brawl_end() -> void:
	for e in _brawl_fans:
		var f: AnimatedSprite3D = e["f"]
		if is_instance_valid(f):
			f.position = e["pos"]
			f.rotation.z = float(e["rot"])
	_brawl_fans.clear()
	for p in _brawl_props:
		if is_instance_valid(p):
			p.queue_free()
	_brawl_props.clear()
	_brawl_on = false





func crowd_zone_off() -> void:
	if _zone_t > 0.6:
		_zone_t = 0.6





func _zone_release_fans() -> void:
	for e in _zone_fans:
		var f: AnimatedSprite3D = e["f"]
		if is_instance_valid(f):
			f.position.y = float(e["y"])
	_zone_fans.clear()





func _zone_weight(b: Dictionary) -> float:
	if _zone_t <= 0.0:
		return 0.0
	var p: Vector3 = b.get("pos", Vector3.ZERO)
	var d: float = Vector2(p.x - _zone_pos.x, p.z - _zone_pos.z).length()
	return clampf(1.0 - d / _zone_r, 0.0, 1.0)





func _tick_zone(delta: float) -> void:
	if _zone_t <= 0.0:
		return
	_zone_t -= delta
	if _zone_t <= 0.0:
		_zone_release_fans()
		return


	var fade: float = clampf(_zone_t / 0.6, 0.0, 1.0)
	for e in _zone_fans:
		var f: AnimatedSprite3D = e["f"]
		if not is_instance_valid(f):
			continue
		f.position.y = float(e["y"]) + absf(sin(_zone_t * float(e["hz"]) * PI
			+ float(e["off"]))) * ZONE_FAN_HOP * fade















func weather_under_pause(on: bool, speed: float = 1.0) -> void:
	for p in [_rain, _snow]:
		if p == null or not is_instance_valid(p):
			continue
		p.process_mode = Node.PROCESS_MODE_ALWAYS if on \
				else Node.PROCESS_MODE_INHERIT
		p.speed_scale = maxf(speed, 0.05) if on else _slow_k












func tick_crowd_manual(delta: float) -> void:
	_tick_crowd(delta)
	_tick_pending(delta)





func _tick_crowd(delta: float) -> void:
	if _react_t < 0.0:
		_tick_ambient(delta)
		return
	_react_t += delta


	if not _react_lotes(visible):
		_react_t = -1.0
		_crowd_idle()







func _react_lotes(pinta: bool) -> bool:
	var pending: bool = false
	for b in _fan_buckets:


		var zw: float = _zone_weight(b)


		var del_gol: bool = home_only or bool(b["home"]) == _fervor_mio
		if _fervor > 0.0 and del_gol:
			zw = maxf(zw, _fervor)

		var local_t: float = _react_t - float(b["delay"]) *(1.0 - zw)
		var anim: String = _react_home if bool(b["home"]) else _react_away
		var poses: Array = b.get(anim, [])
		var idx: int = -1



		var ole: float = -1.0
		if _ole_on and _react_hold and _react_t >= OLE_DESDE and del_gol \
				and anim == "cheer" and not poses.is_empty():
			ole = _ole_pulso(_react_t - OLE_DESDE)
			idx =(OLE_CUADRO if ole > 0.25 else 0) % poses.size()
			pending = true
		elif local_t < 0.0:
			pending = true
		elif (_react_hold or local_t < _react_dur) and not poses.is_empty():
			idx = int((local_t + float(b["phase"])) / CROWD_FRAME_T) % poses.size()
			pending = true
		if idx != int(b["cur"]):
			b["cur"] = idx
			var mat: StandardMaterial3D = b["mat"]


			mat.albedo_texture = b["base"] if idx < 0 else poses[idx]
		if not pinta:
			continue




		var mmi: MultiMeshInstance3D = b["mmi"]
		var hop: float = _bucket_rest_y(b)
		if ole >= 0.0:
			hop = maxf(hop, ole * CROWD_JUMP_H * OLE_JUMP)
		elif idx >= 0 and anim == "cheer" and _react_jump \
				and (bool(b["jumps"]) or zw > 0.0):
			var hz: float = float(b["hz"]) *(1.0 +(ZONE_HZ_MUL - 1.0) * zw)
			hop = absf(sin(local_t * hz * PI)) * CROWD_JUMP_H \
					*(1.0 +(ZONE_JUMP_MUL - 1.0) * zw)
		if not is_equal_approx(mmi.position.y, hop):
			mmi.position.y = hop
	return pending
















const GREET_COLD: float = 0.3
const GREET_WARM: float = 0.7
const CHANT_GOAL: float = 26.0
const CHANT_SPONT: float = 18.0

var _chant_t: float = 0.0
var _chant_next: float = 22.0





















func crowd_greet(calor: float, dur: float = 2.6) -> void:
	if calor <= GREET_COLD:
		crowd_boo(dur)
		return
	if calor < GREET_WARM:


		crowd_react("home", "close")
		return
	crowd_react("home", "goal")
	_start_chant(maxf(dur, CHANT_SPONT))
	crowd_flashes("goal")




var _chant_bando: int = -1





func _start_chant(dur: float, bando: int = -1) -> void:
	_chant_t = dur if bando >= 0 and bando != _chant_bando else maxf(_chant_t, dur)
	_chant_bando = bando
	_refresh_bases()




func _canta(b: Dictionary) -> bool:
	return not _de_duelo(b) and not _pide_hora(b) \
			and (_chant_bando < 0 or int(bool(b["home"])) == _chant_bando)




func _bucket_base(b: Dictionary) -> Texture2D:
	var cheer: Array = b["cheer"]
	if cheer.is_empty():
		return b["idle"]
	if bool(b["standing"]):










		if bool(b.get("tense", false)):
			var sad: Array = b["sad"]
			if not sad.is_empty():
				return sad[0]
		return cheer[0]
	if _chant_t > 0.0 and bool(b["pogo"]) and _canta(b):
		return cheer[0]
	return b["idle"]




func _refresh_bases() -> void:
	for b in _fan_buckets:
		var base: Texture2D = _bucket_base(b)
		if b["base"] == base:
			continue
		b["base"] = base
		if int(b["cur"]) < 0:
			var mat: StandardMaterial3D = b["mat"]
			mat.albedo_texture = base













const POGO_IDLE: float = 0.35
const POGO_HOT: float = 0.85

var _pogo_t: float = 0.0

func _tick_pogo(delta: float) -> void:
	if _fan_buckets.is_empty():
		return
	_pogo_t += delta



	if not visible:
		return
	var amp: float = CROWD_JUMP_H * lerpf(POGO_IDLE, POGO_HOT, _excite)
	for b in _fan_buckets:
		if not bool(b["pogo"]) or int(b["cur"]) >= 0:
			continue
		var mmi: MultiMeshInstance3D = b["mmi"]





		var p: Vector3 = mmi.position
		var q: Vector3 = p
		if _de_duelo(b) or _pide_hora(b):
			q.y = _bucket_rest_y(b)
		else:
			var w: float = _pogo_t * float(b["pogo_hz"]) * PI + float(b["pogo_off"])
			q.y = _bucket_rest_y(b) + absf(sin(w)) * amp
		if q != p:
			mmi.position = q






func _tick_chant(delta: float) -> void:
	if _chant_t > 0.0:
		_chant_t -= delta
		if _chant_t <= 0.0:
			_chant_t = 0.0
			_refresh_bases()
		return
	_chant_next -= delta
	if _chant_next > 0.0:
		return
	_chant_next = randf_range(30.0, 70.0) / maxf(_fiesta_factor(), 0.1)
	_start_chant(CHANT_SPONT)










const WAVE_CALM: float = 0.15









const WAVE_MPS: float = 24.0
const WAVE_FAN_T: float = 0.9
const WAVE_JITTER: float = 0.12
const WAVE_HOLGURA: float = 0.2
const OLA_SHADER: Shader = preload("res://features/stadium/grada_ola.gdshader")
var _ola_reloj: float = 0.0
var _ola_puestas: int = 0
var _ola_ref: float = 1.0
var _ola_nivel: float = 0.0

var _wave_next: float = 55.0










const WAVE_GOLEADA: int = 3
const WAVE_GOLEADA_CADA: Vector2 = Vector2(35.0, 60.0)
const WAVE_GOLEADA_PRIMERA: float = 12.0
const WAVE_GOLEADA_CUENCO: float = 0.3

func _tick_wave(delta: float) -> void:
	var golea: int = _bando_golea()

	if golea >= 0 and _wave_next > WAVE_GOLEADA_CADA.y:
		_wave_next = WAVE_GOLEADA_PRIMERA
	_wave_next -= delta
	if _wave_next > 0.0 or _fan_buckets.is_empty():
		return





	var calma: bool = _excite <= WAVE_CALM and absf(_mood) <= 0.35
	if golea >= 0:
		calma = _excite_target <= WAVE_CALM and absf(_danger) <= WAVE_CALM and not _ole_on
	if not calma or not _ambient.is_empty() or _gol_pie[0] > 0.0 or _gol_pie[1] > 0.0 \
			or _tramo_pie[0] > 0.0 or _tramo_pie[1] > 0.0:
		_wave_next = 8.0
		return


	var order: Array[Dictionary] = _fan_buckets.duplicate()
	order.sort_custom(func(a, b): return float(a["ang"]) < float(b["ang"]))
	var sentido: float = 1.0
	if randf() < 0.5:
		order.reverse()
		sentido = -1.0
	if golea < 0:
		_wave_next = randf_range(70.0, 130.0) / maxf(_fiesta_factor(), 0.1)
	else:
		_wave_next = randf_range(WAVE_GOLEADA_CADA.x, WAVE_GOLEADA_CADA.y) \
				/ maxf(_fiesta_factor(), 0.1)
		var suyas: int = 0
		for b in order:
			if _de_bando(b, golea):
				suyas += 1
		if float(suyas) < WAVE_GOLEADA_CUENCO * float(order.size()):
			return





	var radio: float = 0.0
	for b in order:
		var pos: Vector3 = b["pos"]
		radio += Vector2(pos.x, pos.z - 52.5).length()
	var vel: float = WAVE_MPS / maxf(radio / float(order.size()), 1.0)
	var inicio: float = float(order[0]["ang"]) - sentido * float(order[0].get("ang_w", 0.0))


	_ola_reloj = - WAVE_FAN_T * 0.5


	_ola_ref = 0.0
	for b in order:
		_ola_ref += float(b["seats"]) *(float(b.get("ang_w", 0.0)) / vel + WAVE_FAN_T * 0.5)
	_ola_ref = maxf(_ola_ref * vel / TAU, 1.0)
	for b in order:
		if golea >= 0 and not _de_bando(b, golea):
			continue
		var tc: float = wrapf(sentido *(float(b["ang"]) - inicio), 0.0, TAU) / vel
		var media: float = float(b.get("ang_w", 0.0)) / vel + WAVE_FAN_T * 0.5
		_ambient.append({"b": b, "t": 0.0, "wave": true, "tc": tc, "media": media,
			"monta": tc - media - WAVE_HOLGURA, "fin": tc + media + WAVE_JITTER + WAVE_HOLGURA,
			"k": sentido / vel})



func _bando_golea() -> int:
	if _gap >= WAVE_GOLEADA:
		return 1
	if _gap <= - WAVE_GOLEADA:
		return 0
	return -1



func _de_bando(b: Dictionary, bando: int) -> bool:
	return bool(b.get("mayoria", b["home"])) ==(bando == 1)






func _tick_ola(e: Dictionary) -> bool:
	var b: Dictionary = e["b"]
	if _ola_reloj >= float(e["fin"]):
		_ola_suelta(b)
		return true
	if _ola_reloj < float(e["monta"]):
		return false
	if not bool(b.get("ola", false)):
		_ola_monta(b, float(e["k"]))



	if visible:
		(b["ola_mat"] as ShaderMaterial).set_shader_parameter("ola_t", _ola_reloj - float(e["tc"]))
	return false








func _ola_monta(b: Dictionary, k: float) -> void:
	var mmi: MultiMeshInstance3D = b["mmi"]
	var base: StandardMaterial3D = b["mat"]
	var mat: ShaderMaterial = b.get("ola_mat")
	if mat == null:
		mat = ShaderMaterial.new()
		mat.shader = OLA_SHADER
		mat.set_shader_parameter("ola_dur", WAVE_FAN_T)
		mat.set_shader_parameter("ola_jit", WAVE_JITTER)
		mat.set_shader_parameter("ola_alto", CROWD_JUMP_H * 1.4)
		b["ola_mat"] = mat
	var poses: Array = b["cheer"]
	mat.set_shader_parameter("lamina_base", b["base"])
	for j in 4:
		mat.set_shader_parameter("lamina_%d" % j,
			b["base"] if poses.is_empty() else poses[j % poses.size()])


	var a_base: float = float(base.get_meta("occ_alpha", base.albedo_color.a))
	var a_occ: float = 1.0
	if base.has_meta("occ_mode") and base.transparency == BaseMaterial3D.TRANSPARENCY_ALPHA:
		a_occ = base.albedo_color.a / maxf(a_base, 0.001)
	var c: Color = base.albedo_color
	mat.set_shader_parameter("albedo", Color(c.r, c.g, c.b, a_base))
	mat.set_shader_parameter("occ_alpha", a_occ)

	var espacio: Node3D = mmi.get_parent().get_parent() as Node3D
	mat.set_shader_parameter("ola_inv", Projection(espacio.global_transform.affine_inverse()
		if espacio != null else Transform3D.IDENTITY))
	mat.set_shader_parameter("ola_ang", float(b["ang"]))
	mat.set_shader_parameter("ola_k", k)
	mat.set_shader_parameter("ola_t", -100.0)
	b["ola_prev"] = mmi.material_override
	mmi.material_override = mat
	b["ola"] = true
	b["cur"] = 0
	mmi.position.y = _bucket_rest_y(b)
	_ola_puestas += 1




func _ola_suelta(b: Dictionary) -> void:
	if not bool(b.get("ola", false)):
		return
	var mmi: MultiMeshInstance3D = b["mmi"]
	var base: StandardMaterial3D = b["mat"]
	var a_occ: float = float((b["ola_mat"] as ShaderMaterial).get_shader_parameter("occ_alpha"))
	mmi.material_override = b.get("ola_prev")
	b.erase("ola_prev")
	b["ola"] = false
	b["cur"] = -1
	base.albedo_texture = b["base"]
	if a_occ < 0.999 or base.has_meta("occ_mode"):
		_mat_alpha(base, a_occ)
	mmi.position.y = _bucket_rest_y(b)
	_ola_puestas -= 1


func _ola_suelta_todas() -> void:
	if _ola_puestas <= 0:
		return
	for b in _fan_buckets:
		_ola_suelta(b)
	_ola_puestas = 0





func _ambient_vacia() -> void:
	_ola_suelta_todas()
	_ambient.clear()
	if _ola_nivel > 0.0:
		_ola_nivel = 0.0
		ola_suena.emit(0.0)





const OLA_CERCA: float = 1.4
const OLA_LEJOS: float = 0.6

func _ola_ruge(e: Dictionary, oido: Vector3) -> float:
	var x: float = absf(_ola_reloj - float(e["tc"])) / maxf(float(e["media"]), 0.05)
	if x >= 1.0:
		return 0.0
	var b: Dictionary = e["b"]
	var cerca: float = 1.0
	if oido.is_finite():
		var pos: Vector3 = b["pos"]
		var d: float = Vector2(pos.x - oido.x, pos.z - oido.z).length()
		cerca = lerpf(OLA_CERCA, OLA_LEJOS, clampf((d - 25.0) / 90.0, 0.0, 1.0))
	return float(b["seats"]) *(1.0 - x) * cerca






func _tick_ola_rugido(delta: float, olas: int, ruge: float) -> void:
	var objetivo: float = clampf(ruge / _ola_ref, 0.0, 1.5) if olas > 0 else 0.0
	if objetivo <= 0.0 and _ola_nivel <= 0.0:
		return
	var rapidez: float = 4.0 if objetivo > _ola_nivel else 1.5
	_ola_nivel = lerpf(_ola_nivel, objetivo, 1.0 - exp(- rapidez * delta))
	if objetivo <= 0.0 and _ola_nivel < 0.01:
		_ola_nivel = 0.0
	ola_suena.emit(_ola_nivel)



















func _notification(what: int) -> void:
	if what == NOTIFICATION_VISIBILITY_CHANGED and visible and is_inside_tree():
		_grada_despierta()


func _grada_despierta() -> void:
	if _fan_buckets.is_empty():
		return


	if _sway_oculto_s > 0.0:
		var oculto: float = _sway_oculto_s
		_sway_oculto_s = 0.0
		_tick_sway(oculto)


	if _react_t >= 0.0:
		_react_lotes(true)
		return

	_tick_pogo(0.0)
	for e in _ambient:
		var b: Dictionary = e["b"]
		if e.has("tc") and bool(b.get("ola", false)):
			(b["ola_mat"] as ShaderMaterial).set_shader_parameter("ola_t",
				_ola_reloj - float(e["tc"]))





const AMBIENT_BURST: float = 0.9

func _tick_ambient(delta: float) -> void:
















	var heat: float = absf(_danger) *(DANGER_TENSE_K if _danger < 0.0 else 1.0)
	var target: float = maxf(maxf(_excite_target, absf(_mood) * MOOD_AMBIENT),
		heat)
	_excite = move_toward(_excite, target, delta * 1.8)
	_tick_pogo(delta)
	_tick_sway(delta)
	_tick_capo()
	_ola_reloj += delta
	var olas: int = 0
	var ruge: float = 0.0
	if not _ambient.is_empty():
		var cam: Camera3D = SceneFade.camara_de(self) if is_inside_tree() else null
		var oido: Vector3 = to_local(cam.global_position) if cam != null else Vector3.INF
		for i in range(_ambient.size() - 1, -1, -1):
			var e: Dictionary = _ambient[i]


			if e.has("tc"):
				olas += 1
				ruge += _ola_ruge(e, oido)
				if _tick_ola(e):
					_ambient.remove_at(i)
				continue


			if float(e["wait"]) > 0.0:
				e["wait"] = float(e["wait"]) - delta
				continue
			e["t"] = float(e["t"]) + delta
			var b: Dictionary = e["b"]
			var poses: Array = b["cheer"]
			var idx: int = -1
			if float(e["t"]) < AMBIENT_BURST and not poses.is_empty():
				idx = int(float(e["t"]) / CROWD_FRAME_T) % poses.size()
			if idx != int(b["cur"]):
				b["cur"] = idx
				var mat: StandardMaterial3D = b["mat"]
				mat.albedo_texture = b["base"] if idx < 0 else poses[idx]

			var mmi: MultiMeshInstance3D = b["mmi"]
			var hop: float = _bucket_rest_y(b)
			if idx >= 0 and bool(b["jumps"]):
				hop = absf(sin(float(e["t"]) * float(b["hz"]) * PI)) * CROWD_JUMP_H * 0.6
			if not is_equal_approx(mmi.position.y, hop):
				mmi.position.y = hop
			if idx < 0:
				_ambient.remove_at(i)


	if olas == 0 and _ola_puestas > 0:
		_ola_suelta_todas()
	_tick_ola_rugido(delta, olas, ruge)
	_tick_chant(delta)
	_tick_wave(delta)
	_ambient_t -= delta
	if _ambient_t > 0.0 or _fan_buckets.is_empty():
		return





	_ambient_t = lerpf(randf_range(1.1, 2.8), randf_range(0.3, 1.0), _excite)


	var bursts: int = 2 + int(round(_excite * 3.0))


	for e in _ambient:
		if e.has("tc"):
			return
	for _i in bursts:
		var pick: Dictionary = _fan_buckets[randi() % _fan_buckets.size()]
		if Array(pick["cheer"]).is_empty() or int(pick["cur"]) >= 0:
			continue








		if _danger < - DANGER_MUTE and bool(pick["home"]):
			continue


		if _de_duelo(pick) or _pide_hora(pick):
			continue
		_ambient.append({"b": pick, "t": 0.0, "wait": randf_range(0.0, 0.35)})


func _crowd_idle() -> void:
	_react_home = "idle"
	_react_away = "idle"
	_react_jump = false
	_fervor = 0.0
	_ole_on = false
	for b in _fan_buckets:
		var mmi: MultiMeshInstance3D = b["mmi"]
		mmi.position.y = _bucket_rest_y(b)




	_pending_fans.clear()
	for f in _fans_home + _fans_away:
		_queue_fan(f, String(f.get_meta("rest", "idle")))




func _queue_fan(f: AnimatedSprite3D, anim: String) -> void:
	var spread: float = 0.35 if anim == "cheer" else 0.6
	_pending_fans.append({"f": f, "anim": anim, "t": randf_range(0.0, spread)})




func _tick_pending(delta: float) -> void:
	if _pending_fans.is_empty():
		return
	for i in range(_pending_fans.size() - 1, -1, -1):
		var e: Dictionary = _pending_fans[i]
		e["t"] = float(e["t"]) - delta
		if float(e["t"]) <= 0.0:
			_play_fan(e["f"], String(e["anim"]))
			_pending_fans.remove_at(i)


func _play_fan(f: AnimatedSprite3D, anim: String) -> void:
	if not is_instance_valid(f) or not f.sprite_frames.has_animation(anim):
		return


	if f.has_meta("andando"):
		return
	f.play(anim)
	f.speed_scale = randf_range(0.7, 1.35)





	if anim == "cheer" and _react_t < 0.0:
		f.speed_scale *= 0.35
	f.frame = randi_range(0, maxi(f.sprite_frames.get_frame_count(anim) - 1, 0))




func _build_pitch() -> void:







	var mow: Array = _pitch_cfg().get("mow", [])
	var pattern: int = 0
	if not mow.is_empty():
		pattern = int(mow[posmod(hash(_pitch_seed_club())>>3, mow.size())])




	if _big_night and NIGHT_MOW.has(_comp):
		pattern = int(NIGHT_MOW[_comp])
	var q: Dictionary = _pitch_cfg()
	var dull: float = float(q["dull"])
	var contrast: float = float(q["contrast"])
	var wear: float = float(q["wear"])
	var mud: float = float(q["mud"])
	var bald: float = float(q["bald"])


	var g_a: Color = GRASS_A.lerp(GRASS_DULL, dull)
	var g_b: Color = GRASS_B.lerp(GRASS_DULL, dull)
	var g_out: Color = GRASS_OUT.lerp(GRASS_DULL, dull)






	if _roof:
		g_out = AZOTEA_CONCRETE
		g_a = Color("3fae4a")
		g_b = Color("36a343")



	if footprint == "":
		footprint = _pick_footprint()

















	_track = footprint in ["athletics", "cu_olimpico"]


	_pitch_tex_bounds()




















	var key: String = "%s|%d|%d|%s|%.2f|%.2f|%.2f|%.2f%s" % [
		_pitch_seed_club(), pattern, div, footprint,
		snappedf(dull, 0.05), snappedf(contrast, 0.05),
		snappedf(wear, 0.05), snappedf(mud, 0.05),
		"|roof" if _roof else ""]



	var grass: Dictionary = {



		"pattern": pattern,
		"contrast": contrast, "wear": wear, "mud": mud, "bald": bald,
		"a": g_a, "b": g_b, "out": g_out,
	}
	var hit: Dictionary = _pitch_cache_get(key)
	if not hit.is_empty():
		_line_color = hit["line"]
		_apply_pitch_material(hit["tex"], dull, grass)
		return




	var img: Image = Image.create(_tw, _th, false, Image.FORMAT_RGBA8)
	img.fill(Color(0.0, 0.0, 0.0, 0.0))







	_line_color = LINE_COLOR.lerp(g_a, float(q["dirty_lines"]) * 0.55)

	_tex_rect(img, - FIELD_HALF_W, -0.08, FIELD_HALF_W, 0.08)
	_tex_rect(img, - FIELD_HALF_W, FIELD_DEPTH - 0.08, FIELD_HALF_W, FIELD_DEPTH + 0.08)
	_tex_rect(img, - FIELD_HALF_W, 0.0, - FIELD_HALF_W + 0.16, FIELD_DEPTH)
	_tex_rect(img, FIELD_HALF_W - 0.16, 0.0, FIELD_HALF_W, FIELD_DEPTH)
	_tex_rect(img, - FIELD_HALF_W, HALF_LINE - 0.08, FIELD_HALF_W, HALF_LINE + 0.08)

	_tex_rect(img, - PA_HALF_W, 0.0, - PA_HALF_W + 0.16, PA_DEPTH)
	_tex_rect(img, PA_HALF_W - 0.16, 0.0, PA_HALF_W, PA_DEPTH)
	_tex_rect(img, - PA_HALF_W, PA_DEPTH - 0.16, PA_HALF_W, PA_DEPTH)
	_tex_rect(img, - GA_HALF_W, 0.0, - GA_HALF_W + 0.16, GA_DEPTH)
	_tex_rect(img, GA_HALF_W - 0.16, 0.0, GA_HALF_W, GA_DEPTH)
	_tex_rect(img, - GA_HALF_W, GA_DEPTH - 0.16, GA_HALF_W, GA_DEPTH)
	_tex_rect(img, -0.13, PEN_SPOT - 0.13, 0.13, PEN_SPOT + 0.13)
	_tex_arc(img, 0.0, PEN_SPOT, ARC_R, 1)

	_tex_rect(img, - PA_HALF_W, FIELD_DEPTH - PA_DEPTH, - PA_HALF_W + 0.16, FIELD_DEPTH)
	_tex_rect(img, PA_HALF_W - 0.16, FIELD_DEPTH - PA_DEPTH, PA_HALF_W, FIELD_DEPTH)
	_tex_rect(img, - PA_HALF_W, FIELD_DEPTH - PA_DEPTH, PA_HALF_W, FIELD_DEPTH - PA_DEPTH + 0.16)
	_tex_rect(img, - GA_HALF_W, FIELD_DEPTH - GA_DEPTH, - GA_HALF_W + 0.16, FIELD_DEPTH)
	_tex_rect(img, GA_HALF_W - 0.16, FIELD_DEPTH - GA_DEPTH, GA_HALF_W, FIELD_DEPTH)
	_tex_rect(img, - GA_HALF_W, FIELD_DEPTH - GA_DEPTH, GA_HALF_W, FIELD_DEPTH - GA_DEPTH + 0.16)
	_tex_rect(img, -0.13, FIELD_DEPTH - PEN_SPOT - 0.13, 0.13, FIELD_DEPTH - PEN_SPOT + 0.13)
	_tex_arc(img, 0.0, FIELD_DEPTH - PEN_SPOT, ARC_R, 2)

	_tex_arc(img, 0.0, HALF_LINE, ARC_R, 0)
	_tex_rect(img, -0.13, HALF_LINE - 0.13, 0.13, HALF_LINE + 0.13)

	for corner in [Vector2(- FIELD_HALF_W, 0.0), Vector2(FIELD_HALF_W, 0.0),
			Vector2(- FIELD_HALF_W, FIELD_DEPTH), Vector2(FIELD_HALF_W, FIELD_DEPTH)]:
		_tex_corner_arc(img, corner.x, corner.y, CORNER_ARC_R)
	var tex: ImageTexture = ImageTexture.create_from_image(img)





	_pitch_cache_put(key, {"tex": tex, "line": _line_color})



	await _breathe(0.55)
	_apply_pitch_material(tex, dull, grass)
	await _respira()









































func _build_centre_logo() -> void:
	if not _big_night:
		return
	var fixture: Dictionary = GameState.current_fixture()
	if not comp_override.is_empty():
		fixture = {"comp": comp_override}
	var px: int = 256
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(px, px)
	vp.transparent_bg = true




	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var logo: CompLogo = CompLogo.new()
	logo.set_anchors_preset(Control.PRESET_FULL_RECT)
	logo.custom_minimum_size = Vector2(px, px)
	logo.set_type(Competitions.logo_type_of(fixture))
	logo.color = Competitions.accent_of(fixture)
	vp.add_child(logo)
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()


	qm.size = Vector2(ARC_R * 0.95, ARC_R * 0.95)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED






	mat.albedo_color = Color(1.0, 1.0, 1.0, 0.38)
	quad.material_override = mat


	quad.position = Vector3(0.0, 0.02, HALF_LINE)
	quad.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	add_child(quad)






func _apply_pitch_material(tex: ImageTexture, dull: float, grass: Dictionary) -> void:
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = preload("res://features/stadium/pitch_grass.gdshader")










	mat.render_priority = Material.RENDER_PRIORITY_MAX
	mat.set_shader_parameter("marks_texture", tex)
	_marks_tex = tex


	mat.set_shader_parameter("world_origin", Vector2(_wx0, _wz0))
	mat.set_shader_parameter("world_span",
		Vector2(float(_tw) / TEXELS_PER_M, float(_th) / TEXELS_PER_M))
	mat.set_shader_parameter("noise_origin", Vector2(WORLD_X0, WORLD_Z0))
	mat.set_shader_parameter("noise_span",
		Vector2(float(TEX_W) / TEXELS_PER_M, float(TEX_H) / TEXELS_PER_M))
	mat.set_shader_parameter("field_half_w", FIELD_HALF_W)
	mat.set_shader_parameter("field_depth", FIELD_DEPTH)
	mat.set_shader_parameter("half_line", HALF_LINE)
	mat.set_shader_parameter("grass_a", grass["a"])
	mat.set_shader_parameter("grass_b", grass["b"])
	mat.set_shader_parameter("grass_out", grass["out"])
	mat.set_shader_parameter("grass_dry", GRASS_DRY)
	mat.set_shader_parameter("grass_mud", GRASS_MUD)
	mat.set_shader_parameter("mow_pattern", int(grass["pattern"]))
	mat.set_shader_parameter("mow_contrast", float(grass["contrast"]))
	mat.set_shader_parameter("wear_amount", float(grass["wear"]))
	mat.set_shader_parameter("maintenance_wear", 0.0 if _roof else FinishDetail.mantenimiento(div, _season_t))
	mat.set_shader_parameter("mud_amount", float(grass["mud"]))
	mat.set_shader_parameter("bald_amount", float(grass["bald"]))
	mat.set_shader_parameter("wear_size", Vector2(WEAR_GRID))
	mat.set_shader_parameter("mud_size", Vector2(MUD_GRID))
	mat.set_shader_parameter("wear_noise", _noise_tex(WEAR_GRID, 991))
	mat.set_shader_parameter("mud_noise", _noise_tex(MUD_GRID, 5507))
	mat.set_shader_parameter("track_on", _track)
	mat.set_shader_parameter("track_inner_hx", TRACK_INNER_HX)
	mat.set_shader_parameter("track_straight_hz", TRACK_STRAIGHT_HZ)
	mat.set_shader_parameter("track_w", TRACK_W)
	mat.set_shader_parameter("track_lane_w", TRACK_W / float(TRACK_LANES))
	mat.set_shader_parameter("track_surf", TRACK_SURF)
	mat.set_shader_parameter("track_lane", TRACK_LANE)




	mat.set_shader_parameter("wind_strength",
		lerpf(0.05, 0.012, clampf(dull / 0.42, 0.0, 1.0)))




	if _roof:
		mat.set_shader_parameter("grass_tint", Color(1.5, 1.62, 1.42))


		mat.set_shader_parameter("marks_glow", AZOTEA_CAL_BRILLO)
	_pitch_mat = mat
	var mesh: PlaneMesh = PlaneMesh.new()
	var span_x: float = float(_tw) / TEXELS_PER_M
	var span_z: float = float(_th) / TEXELS_PER_M
	mesh.size = Vector2(span_x, span_z)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = mat
	mi.position = Vector3(_wx0 + span_x * 0.5, 0.0, _wz0 + span_z * 0.5)
	add_child(mi)







func _track_dist(x_m: float, z_m: float) -> float:
	var ax: float = absf(x_m)
	var az: float = absf(z_m - FIELD_DEPTH * 0.5)
	if az <= TRACK_STRAIGHT_HZ:
		return ax - TRACK_INNER_HX
	return Vector2(ax, az - TRACK_STRAIGHT_HZ).length() - TRACK_INNER_HX





func _track_outer_hx() -> float:
	return TRACK_INNER_HX + TRACK_W


func _track_outer_hz() -> float:
	return TRACK_STRAIGHT_HZ + TRACK_INNER_HX + TRACK_W







func _pitch_tex_bounds() -> void:
	if not _track:
		_tw = TEX_W
		_th = TEX_H
		_wx0 = WORLD_X0
		_wz0 = WORLD_Z0
		return
	var hx: float = _track_outer_hx() + TRACK_TEX_MARGIN
	var hz: float = _track_outer_hz() + TRACK_TEX_MARGIN

	_tw = int(ceil(2.0 * hx * TEXELS_PER_M / 8.0)) * 8
	_th = int(ceil(2.0 * hz * TEXELS_PER_M / 8.0)) * 8
	_wx0 = - float(_tw) * 0.5 / TEXELS_PER_M
	_wz0 = FIELD_DEPTH * 0.5 - float(_th) * 0.5 / TEXELS_PER_M


















func _tex_track(img: Image) -> void:
	var lane_w: float = TRACK_W / float(TRACK_LANES)
	var w: int = img.get_width()
	var h: int = img.get_height()
	for ty in h:
		var z_m: float = _wz0 + float(ty) / TEXELS_PER_M


		if absf(z_m - FIELD_DEPTH * 0.5) > _track_outer_hz():
			continue
		for tx in w:
			var x_m: float = _wx0 + float(tx) / TEXELS_PER_M
			var d: float = _track_dist(x_m, z_m)
			if d <= 0.0 or d >= TRACK_W:
				continue
			var into: float = fposmod(d, lane_w)
			var c: Color = TRACK_SURF
			if d < 0.12 or into < 0.1:
				c = TRACK_LANE
			img.set_pixel(tx, ty, c)





const WEAR_GRID: Vector2i = Vector2i(24, 36)
const MUD_GRID: Vector2i = Vector2i(40, 60)

static var _noise_tex_cache: Dictionary = {}






static func _noise_tex(size: Vector2i, seed_v: int) -> ImageTexture:
	var key: String = "%dx%d|%d" % [size.x, size.y, seed_v]
	if _noise_tex_cache.has(key):
		return _noise_tex_cache[key]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_v
	var img: Image = Image.create(size.x, size.y, false, Image.FORMAT_RF)
	for y in size.y:
		for x in size.x:
			img.set_pixel(x, y, Color(rng.randf(), 0.0, 0.0))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_noise_tex_cache[key] = tex
	return tex




func _noise_grid(w: int, h: int, seed_v: int) -> Array:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_v
	var g: Array = []
	for _y in h:
		var row: PackedFloat32Array = PackedFloat32Array()
		for _x in w:
			row.append(rng.randf())
		g.append(row)
	return g




func _sample_noise(grid: Array, u: float, v: float) -> float:
	if grid.is_empty():
		return 0.5
	var h: int = grid.size()
	var w: int = grid[0].size()
	var fx: float = fposmod(u, 1.0) * float(w)
	var fy: float = fposmod(v, 1.0) * float(h)
	var x0: int = int(fx) % w
	var y0: int = int(fy) % h
	var x1: int =(x0 + 1) % w
	var y1: int =(y0 + 1) % h
	var tx: float = fx - floor(fx)
	var tz: float = fy - floor(fy)

	tx = tx * tx *(3.0 - 2.0 * tx)
	tz = tz * tz *(3.0 - 2.0 * tz)
	var a: float = lerpf(grid[y0][x0], grid[y0][x1], tx)
	var b: float = lerpf(grid[y1][x0], grid[y1][x1], tx)
	return lerpf(a, b, tz)












func _traffic(x_m: float, z_m: float) -> float:
	var t: float = 0.0



	t = maxf(t, clampf(1.0 - Vector2(x_m, z_m).length() / 14.0, 0.0, 1.0))
	t = maxf(t, clampf(1.0 - Vector2(x_m, z_m - FIELD_DEPTH).length() / 14.0, 0.0, 1.0))

	t = maxf(t, clampf(1.0 - Vector2(x_m, z_m - HALF_LINE).length() / 12.0, 0.0, 1.0) * 0.8)

	var edge: float = clampf((absf(x_m) -(FIELD_HALF_W - 6.0)) / 6.0, 0.0, 1.0)
	t = maxf(t, edge * 0.6)
	return t


func _tex_rect(img: Image, x1: float, z1: float, x2: float, z2: float) -> void:
	var tx1: int = clampi(int((x1 - _wx0) * TEXELS_PER_M), 0, _tw - 1)
	var tx2: int = clampi(int((x2 - _wx0) * TEXELS_PER_M) + 1, 0, _tw - 1)
	var ty1: int = clampi(int((z1 - _wz0) * TEXELS_PER_M), 0, _th - 1)
	var ty2: int = clampi(int((z2 - _wz0) * TEXELS_PER_M) + 1, 0, _th - 1)
	for ty in range(ty1, ty2 + 1):
		for tx in range(tx1, tx2 + 1):
			img.set_pixel(tx, ty, _line_color)




func _tex_arc(img: Image, cx: float, cz: float, r: float, mode: int) -> void:
	var steps: int = 360
	for i in steps:
		var a: float = TAU * float(i) / float(steps)
		var px: float = cx + cos(a) * r
		var pz: float = cz + sin(a) * r
		if mode == 1 and pz < PA_DEPTH:
			continue
		if mode == 2 and pz > FIELD_DEPTH - PA_DEPTH:
			continue
		if pz < 0.0 or pz > FIELD_DEPTH:
			continue
		var tx: int = clampi(int((px - _wx0) * TEXELS_PER_M), 1, _tw - 2)
		var ty: int = clampi(int((pz - _wz0) * TEXELS_PER_M), 1, _th - 2)
		for dy in range(-1, 2):
			for dx in range(-1, 2):
				img.set_pixel(tx + dx, ty + dy, _line_color)





func _tex_corner_arc(img: Image, cx: float, cz: float, r: float) -> void:
	var steps: int = 180
	for i in steps:
		var a: float = TAU * float(i) / float(steps)
		var px: float = cx + cos(a) * r
		var pz: float = cz + sin(a) * r
		if absf(px) > FIELD_HALF_W or pz < 0.0 or pz > FIELD_DEPTH:
			continue
		var tx: int = clampi(int((px - _wx0) * TEXELS_PER_M), 1, _tw - 2)
		var ty: int = clampi(int((pz - _wz0) * TEXELS_PER_M), 1, _th - 2)
		for dy in range(-1, 2):
			for dx in range(-1, 2):
				img.set_pixel(tx + dx, ty + dy, _line_color)




func _build_goal() -> void:

	_net_aux_mats = []
	_net_ropes = []
	_net_cae = Vector2.ZERO
	_build_goal_into(self, true)


	var far_root: Node3D = Node3D.new()
	far_root.position = Vector3(0.0, 0.0, FIELD_DEPTH)
	far_root.rotation_degrees = Vector3(0.0, 180.0, 0.0)
	add_child(far_root)













	var near_back: ShaderMaterial = _net_back_mat
	var near_sides: Array[ShaderMaterial] = _net_side_mats
	var near_aux: Array[ShaderMaterial] = _net_aux_mats
	var near_tubes: Array = _tubes.duplicate()
	_net_aux_mats = []
	_build_goal_into(far_root, true)
	_net_back_mat_far = _net_back_mat
	_net_side_mats_far = _net_side_mats
	_net_aux_mats_far = _net_aux_mats
	_net_back_mat = near_back
	_net_side_mats = near_sides
	_net_aux_mats = near_aux
	_tubes = near_tubes



















func build_mini_goal(parent: Node3D, half_w: float, alto: float) -> void:
	var white: StandardMaterial3D = StandardMaterial3D.new()
	white.albedo_color = Color(0.97, 0.97, 0.97)
	white.roughness = 0.4


	white.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED


	var r: float = maxf(0.03, 0.06 *(half_w / GOAL_HALF_W))
	for side in [-1.0, 1.0]:
		var post: MeshInstance3D = MeshInstance3D.new()
		var cyl: CylinderMesh = CylinderMesh.new()
		cyl.top_radius = r
		cyl.bottom_radius = r
		cyl.height = alto
		post.mesh = cyl
		post.material_override = white
		post.position = Vector3(side * half_w, alto * 0.5, 0.0)
		parent.add_child(post)
	var bar: MeshInstance3D = MeshInstance3D.new()
	var bar_mesh: CylinderMesh = CylinderMesh.new()
	bar_mesh.top_radius = r
	bar_mesh.bottom_radius = r
	bar_mesh.height = half_w * 2.0 + r * 2.0
	bar.mesh = bar_mesh
	bar.material_override = white
	bar.rotation_degrees = Vector3(0.0, 0.0, 90.0)
	bar.position = Vector3(0.0, alto, 0.0)
	parent.add_child(bar)


	var depth: float = maxf(0.5, NET_DEPTH *(half_w / GOAL_HALF_W))
	var net_mat: StandardMaterial3D = StandardMaterial3D.new()
	net_mat.albedo_texture = _net_texture()
	net_mat.albedo_color = _net_tint()
	net_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	net_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	net_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	net_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED

	var celda: float =(GOAL_HALF_W * 2.0) / 16.0
	net_mat.uv1_scale = Vector3((half_w * 2.0) / celda, alto / celda, 1.0)
	_net_panel(parent, net_mat, Vector2(half_w * 2.0, alto),
		Vector3(0.0, alto * 0.5, - depth), Vector3.ZERO)
	_net_panel(parent, net_mat, Vector2(half_w * 2.0, depth),
		Vector3(0.0, alto, - depth * 0.5), Vector3(90.0, 0.0, 0.0))
	for side in [-1.0, 1.0]:
		_net_panel(parent, net_mat, Vector2(depth, alto),
			Vector3(side * half_w, alto * 0.5, - depth * 0.5),
			Vector3(0.0, 90.0, 0.0))





















func _marco_sin_sombra(nodo: Node) -> void:
	var mi: MeshInstance3D = nodo as MeshInstance3D
	if mi != null and mi.material_override is StandardMaterial3D:
		(mi.material_override as StandardMaterial3D).shading_mode = \
				BaseMaterial3D.SHADING_MODE_UNSHADED
	for hijo in nodo.get_children():
		_marco_sin_sombra(hijo)


func _build_goal_into(parent: Node3D, with_ripple: bool) -> void:
	var white: StandardMaterial3D = StandardMaterial3D.new()
	white.albedo_color = Color(0.97, 0.97, 0.97)
	white.roughness = 0.4
	white.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	if with_ripple:
		_tubes.clear()
	var decorables: Array = []

	for side in [-1.0, 1.0]:
		var post: MeshInstance3D = MeshInstance3D.new()
		var cyl: CylinderMesh = CylinderMesh.new()
		cyl.top_radius = 0.06
		cyl.bottom_radius = 0.06
		cyl.height = CROSSBAR_H
		post.mesh = cyl
		post.material_override = white
		post.position = Vector3(side * GOAL_HALF_W, CROSSBAR_H * 0.5, 0.0)
		parent.add_child(post)
		decorables.append(post)
		if with_ripple:
			_tubes.append(post)

	var bar: MeshInstance3D = MeshInstance3D.new()
	var bar_mesh: CylinderMesh = CylinderMesh.new()
	bar_mesh.top_radius = 0.06
	bar_mesh.bottom_radius = 0.06
	bar_mesh.height = GOAL_HALF_W * 2.0 + 0.12
	bar.mesh = bar_mesh
	bar.material_override = white
	bar.rotation_degrees = Vector3(0.0, 0.0, 90.0)
	bar.position = Vector3(0.0, CROSSBAR_H, 0.0)
	parent.add_child(bar)
	decorables.append(bar)




	var hijos_antes: int = parent.get_child_count()
	preload("res://features/stadium/goal_detail.gd").decorar(parent, decorables,
		GOAL_HALF_W, CROSSBAR_H, NET_DEPTH, bool(_stands_cfg()["net_worn"]))
	for d in decorables:
		_marco_sin_sombra(d)
	for k in range(hijos_antes, parent.get_child_count()):
		_marco_sin_sombra(parent.get_child(k))
	if with_ripple:
		_tubes.append(bar)

	var net_mat: StandardMaterial3D = StandardMaterial3D.new()
	net_mat.albedo_texture = _net_texture()
	net_mat.albedo_color = _net_tint()
	net_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	net_mat.cull_mode = BaseMaterial3D.CULL_DISABLED


	net_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	net_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED

	net_mat.uv1_scale = Vector3(16.0, 5.5, 1.0)
	var depth: float = NET_DEPTH







	if with_ripple:


		_net_back_mat = _make_ripple_net_mat(Vector2(16.0, 5.5))
		_add_ripple_panel(parent, _net_back_mat, Vector2(GOAL_HALF_W * 2.0, CROSSBAR_H),
			Vector3(0.0, CROSSBAR_H * 0.5, - depth), Vector3.ZERO)
	else:

		_net_panel(parent, net_mat, Vector2(GOAL_HALF_W * 2.0, CROSSBAR_H),
			Vector3(0.0, CROSSBAR_H * 0.5, - depth), Vector3.ZERO)
	_build_net_stays(parent, white, depth)





	if with_ripple:
		var sag_amp: float = 0.2 if bool(_stands_cfg()["net_worn"]) else 0.12
		var top_mat: ShaderMaterial = _make_ripple_net_mat(Vector2(16.0, 2.6), sag_amp)
		_net_aux_mats.append(top_mat)
		if parent == self:
			_net_roof_mat = top_mat
			_net_roof_sag = sag_amp
		_add_ripple_panel(parent, top_mat, Vector2(GOAL_HALF_W * 2.0, depth),
			Vector3(0.0, CROSSBAR_H, - depth * 0.5), Vector3(90.0, 0.0, 0.0))
	else:
		_net_panel(parent, net_mat, Vector2(GOAL_HALF_W * 2.0, depth),
			Vector3(0.0, CROSSBAR_H, - depth * 0.5), Vector3(90.0, 0.0, 0.0))

	if with_ripple:
		_net_side_mats = []
















	for side in [-1.0, 1.0]:
		if with_ripple:
			var side_mat: ShaderMaterial = _make_ripple_net_mat(Vector2(4.0, 5.5))
			_net_side_mats.append(side_mat)
			_add_ripple_panel(parent, side_mat, Vector2(depth, CROSSBAR_H),
				Vector3(side * GOAL_HALF_W, CROSSBAR_H * 0.5, - depth * 0.5),
				Vector3(0.0, -90.0 * side, 0.0))
		else:
			_net_panel(parent, net_mat, Vector2(depth, CROSSBAR_H),
				Vector3(side * GOAL_HALF_W, CROSSBAR_H * 0.5, - depth * 0.5),
				Vector3(0.0, 90.0, 0.0))












func _build_net_stays(parent: Node3D, white: StandardMaterial3D,
		depth: float) -> void:


















	var h: float = CROSSBAR_H + STAY_RISE
	var z_stay: float = -(depth + STAY_BACK)
	for side in [-1.0, 1.0]:
		var stay: MeshInstance3D = MeshInstance3D.new()
		var cyl: CylinderMesh = CylinderMesh.new()


		cyl.top_radius = 0.05
		cyl.bottom_radius = 0.05
		cyl.height = h
		stay.mesh = cyl
		stay.material_override = white
		stay.position = Vector3(side * GOAL_HALF_W, h * 0.5, z_stay)
		parent.add_child(stay)



		var a: Vector3 = Vector3(side * GOAL_HALF_W, h, z_stay)
		var b: Vector3 = Vector3(side * GOAL_HALF_W, CROSSBAR_H, - depth)
		var rope: MeshInstance3D = MeshInstance3D.new()
		var rope_mesh: CylinderMesh = CylinderMesh.new()
		rope_mesh.top_radius = STAY_ROPE_R
		rope_mesh.bottom_radius = STAY_ROPE_R
		rope_mesh.height = a.distance_to(b)
		rope.mesh = rope_mesh
		rope.material_override = white
		rope.position =(a + b) * 0.5



		var dir: Vector3 =(b - a).normalized()
		if absf(dir.dot(Vector3.UP)) < 0.999:
			rope.look_at_from_position(rope.position, rope.position + dir, Vector3.UP)
			rope.rotate_object_local(Vector3.RIGHT, PI * 0.5)
		parent.add_child(rope)



		if parent == self:
			_net_ropes.append({"a": a, "b": b, "malla": rope, "mat": white,
				"rota": false, "cabos": []})







func net_rope_hit(a: Vector3, b: Vector3, r: float) -> int:
	if _net_ropes.is_empty():
		return -1
	if minf(a.z, b.z) > - NET_DEPTH + r or maxf(a.y, b.y) < CROSSBAR_H - r:
		return -1
	for i in _net_ropes.size():
		var c: Dictionary = _net_ropes[i]
		if bool(c["rota"]):
			continue
		var pts: PackedVector3Array = Geometry3D.get_closest_points_between_segments(
			a, b, c["a"], c["b"])
		if pts[0].distance_to(pts[1]) > r:
			continue



		var p: Vector3 = pts[0]
		if absf(p.x) < GOAL_HALF_W and p.y < CROSSBAR_H and p.z > - NET_DEPTH:
			continue
		return i
	return -1






func break_net_rope(i: int) -> bool:
	if i < 0 or i >= _net_ropes.size() or bool(_net_ropes[i]["rota"]):
		return false
	var c: Dictionary = _net_ropes[i]
	c["rota"] = true
	(c["malla"] as MeshInstance3D).visible = false
	var a: Vector3 = c["a"]
	var b: Vector3 = c["b"]
	var largo: float = a.distance_to(b)
	c["cabos"] = [_rope_cabo(a, b - a, largo * ROPE_CABO_TUBO, c["mat"]),
		_rope_cabo(b, a - b, largo * ROPE_CABO_RED, c["mat"])]
	_net_roof_afloja()
	_net_cae_va(ROPE_RED_CAE_S, true)
	return true






func repair_net_rope(i: int, dura: float = 0.0) -> void:
	if i < 0 or i >= _net_ropes.size() or not bool(_net_ropes[i]["rota"]):
		return
	var c: Dictionary = _net_ropes[i]
	c["rota"] = false
	var cabos: Array = c["cabos"]
	c["cabos"] = []
	if cabos.size() > 0 and is_instance_valid(cabos[0]):
		(cabos[0] as Node).queue_free()
	var cabo_red: Node3D = cabos[1] if cabos.size() > 1 else null
	var mi: MeshInstance3D = c["malla"]
	var a: Vector3 = c["a"]
	var medio: Vector3 =(a +(c["b"] as Vector3)) * 0.5
	mi.visible = true

	_net_cae_va(dura, false)
	if dura <= 0.0 or Settings.reduce_motion:
		mi.scale = Vector3.ONE
		mi.position = medio
		if is_instance_valid(cabo_red):
			cabo_red.queue_free()
		_net_roof_afloja()
		return


	mi.scale = Vector3(1.0, 0.001, 1.0)
	mi.position = a
	var tw: Tween = mi.create_tween()
	tw.tween_method(_rope_tiende.bind(mi, a, medio), 0.0, 1.0, dura) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_callback(_rope_tensa.bind(cabo_red))



func net_ropes_broken() -> int:
	var n: int = 0
	for c in _net_ropes:
		if bool(c["rota"]):
			n += 1
	return n




func net_rope_ends(i: int) -> PackedVector3Array:
	if i < 0 or i >= _net_ropes.size():
		return PackedVector3Array()
	return PackedVector3Array([_net_ropes[i]["a"], _net_ropes[i]["b"]])





func _rope_cabo(ancla: Vector3, hacia: Vector3, largo: float, mat: Material) -> Node3D:
	var piv: Node3D = Node3D.new()
	piv.position = ancla
	add_child(piv)
	var mi: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = STAY_ROPE_R
	cyl.bottom_radius = STAY_ROPE_R
	cyl.height = largo
	mi.mesh = cyl
	mi.material_override = mat
	mi.position = Vector3(0.0, - largo * 0.5, 0.0)
	piv.add_child(mi)
	var llano: Vector3 = Vector3(hacia.x, 0.0, hacia.z).normalized()
	var q1: Quaternion = Quaternion(Vector3.DOWN,
		(Vector3.DOWN + llano * ROPE_CABO_TIESO).normalized())
	if Settings.reduce_motion:
		piv.quaternion = q1
		return piv

	var q0: Quaternion = Quaternion(Vector3.DOWN, hacia.normalized())
	piv.quaternion = q0
	var tw: Tween = piv.create_tween()
	tw.tween_method(_cabo_cae.bind(piv, q0, q1), 0.0, 1.0, ROPE_CAE_S) \
			.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	return piv




func _cabo_cae(k: float, piv: Node3D, q0: Quaternion, q1: Quaternion) -> void:
	if is_instance_valid(piv):
		piv.quaternion = q0.slerp(q1, k)


func _rope_tiende(k: float, mi: MeshInstance3D, a: Vector3, medio: Vector3) -> void:
	if is_instance_valid(mi):
		mi.scale = Vector3(1.0, maxf(k, 0.001), 1.0)
		mi.position = a.lerp(medio, k)



func _rope_tensa(cabo_red: Node3D) -> void:
	if is_instance_valid(cabo_red):
		cabo_red.queue_free()
	_net_roof_afloja()




func _net_roof_afloja() -> void:
	if _net_roof_mat == null:
		return
	var meta: float = _net_roof_sag + ROPE_SAG_K * float(net_ropes_broken())
	if _net_roof_tween != null and _net_roof_tween.is_valid():
		_net_roof_tween.kill()
	if Settings.reduce_motion or not is_inside_tree():
		_net_roof_mat.set_shader_parameter("sag", meta)
		return
	var desde: float = float(_net_roof_mat.get_shader_parameter("sag"))
	_net_roof_tween = create_tween()
	_net_roof_tween.tween_method(_net_roof_sag_pon, desde, meta, 0.7) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


func _net_roof_sag_pon(v: float) -> void:
	if _net_roof_mat != null:
		_net_roof_mat.set_shader_parameter("sag", v)



func _net_cae_meta() -> Vector2:
	var dos: bool = net_ropes_broken() >= 2
	var v: Vector2 = Vector2.ZERO
	for i in mini(_net_ropes.size(), 2):
		if bool(_net_ropes[i]["rota"]):
			v[i] = 1.0 if dos else ROPE_CAE_UNA_K
	return v




func _net_cae_va(dura: float, rebota: bool) -> void:
	var meta: Vector2 = _net_cae_meta()
	if _net_cae_tween != null and _net_cae_tween.is_valid():
		_net_cae_tween.kill()
	if dura <= 0.0 or Settings.reduce_motion or not is_inside_tree():
		_net_cae_pon(meta)
		return
	_net_cae_tween = create_tween()
	var paso: MethodTweener = _net_cae_tween.tween_method(_net_cae_pon, _net_cae, meta, dura)
	if rebota:
		paso.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	else:
		paso.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)







func _net_cae_pon(v: Vector2) -> void:
	_net_cae = v
	var abajo: float = ROPE_CAE_ABAJO_M
	var adelante: float = ROPE_CAE_ADELANTE_M
	if _net_roof_mat != null:
		_net_roof_mat.set_shader_parameter("cae_local", Vector3(0.0, adelante, abajo))
		_net_roof_mat.set_shader_parameter("cae_esq", Vector4(0.0, 0.0, v.x, v.y))
	if _net_back_mat != null:
		_net_back_mat.set_shader_parameter("cae_local", Vector3(0.0, - abajo, adelante))
		_net_back_mat.set_shader_parameter("cae_esq", Vector4(v.x, v.y, 0.0, 0.0))
	if _net_side_mats.size() == 2:
		_net_side_mats[0].set_shader_parameter("cae_local", Vector3(- adelante, - abajo, 0.0))
		_net_side_mats[0].set_shader_parameter("cae_esq", Vector4(0.0, v.x, 0.0, 0.0))
		_net_side_mats[1].set_shader_parameter("cae_local", Vector3(adelante, - abajo, 0.0))
		_net_side_mats[1].set_shader_parameter("cae_esq", Vector4(v.y, 0.0, 0.0, 0.0))
	for i in mini(_net_ropes.size(), 2):
		var cabos: Array = _net_ropes[i]["cabos"]
		if cabos.size() > 1 and is_instance_valid(cabos[1]):
			(cabos[1] as Node3D).position =(_net_ropes[i]["b"] as Vector3) \
					+ Vector3(0.0, - abajo, adelante) * v[i]



func net_rope_cae(i: int) -> float:
	return _net_cae[i] if i >= 0 and i < 2 else 0.0









func _make_ripple_net_mat(uv_scale: Vector2, sag: float = 0.0) -> ShaderMaterial:
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = preload("res://features/stadium/goal_net.gdshader")
	mat.set_shader_parameter("net_tex", _net_texture())
	mat.set_shader_parameter("uv_scale", uv_scale)
	mat.set_shader_parameter("net_tint", _net_tint())
	mat.set_shader_parameter("sag", sag)
	return mat










func _net_tint() -> Color:
	if not _big_night:

		if String(SenaClub.red_de(self)["tinte"]) == "club":
			return SenaClub.tinte_red(self)
		return Color.WHITE
	var fixture: Dictionary = GameState.current_fixture()
	if not comp_override.is_empty():
		fixture = {"comp": comp_override}
	return Color.WHITE.lerp(Competitions.accent_of(fixture), 0.35)


func _add_ripple_panel(parent: Node3D, mat: ShaderMaterial, size: Vector2, pos: Vector3, rot_deg: Vector3) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var quad: QuadMesh = QuadMesh.new()
	quad.size = size
	quad.subdivide_width = maxi(int(size.x * 4.0), 6)
	quad.subdivide_depth = 10
	mi.mesh = quad
	mat.set_shader_parameter("panel_size", size)
	mi.material_override = mat
	mi.position = pos
	mi.rotation_degrees = rot_deg
	parent.add_child(mi)


func _net_panel(parent: Node3D, mat: StandardMaterial3D, size: Vector2, pos: Vector3, rot_deg: Vector3) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var quad: QuadMesh = QuadMesh.new()
	quad.size = size
	mi.mesh = quad


	var acabado: ShaderMaterial = ShaderMaterial.new()
	acabado.shader = preload("res://features/stadium/goal_net.gdshader")
	acabado.set_shader_parameter("net_tex", mat.albedo_texture)
	acabado.set_shader_parameter("net_tint", mat.albedo_color)
	acabado.set_shader_parameter("uv_scale", Vector2(mat.uv1_scale.x, mat.uv1_scale.y))
	acabado.set_shader_parameter("panel_size", size)
	mi.material_override = acabado
	mi.position = pos
	mi.rotation_degrees = rot_deg
	parent.add_child(mi)


func _net_texture() -> ImageTexture:














	var worn: bool = bool(_stands_cfg()["net_worn"])
	var thread: Color = Color(0.6, 0.62, 0.6, 0.6) if worn else Color(1, 1, 1, 0.92)

	var grosor: int = 1 if worn else 2
	const TILE: int = 48
	const CELL: int = 16

	if not worn and String(SenaClub.red_de(self)["malla"]) == "hexagonal":
		var hex: Image = SenaClub.textura_hex(thread, 2.0)
		hex.generate_mipmaps()
		return ImageTexture.create_from_image(hex)
	var img: Image = Image.create(TILE, TILE, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	for i in TILE:
		for c in range(0, TILE, CELL):
			for t in grosor:

				var fibra: Color = thread.darkened(0.18) if t == 0 else thread
				img.set_pixel(i,(c + t) % TILE, fibra)
				img.set_pixel((c + t) % TILE, i, fibra)


	for x in range(0, TILE, CELL):
		for y in range(0, TILE, CELL):
			for ox in range(-1, grosor + 1):
				for oy in range(-1, grosor + 1):
					if (ox == -1 or ox == grosor) and (oy == -1 or oy == grosor):
						continue
					var nudo: Color = thread.darkened(0.08 if ox > 0 else 0.23)
					img.set_pixel(posmod(x + ox, TILE), posmod(y + oy, TILE), nudo)


	img.generate_mipmaps()
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	return tex




func _build_stands() -> void:










	if footprint == "":
		footprint = _pick_footprint()
	_track = footprint in ["athletics", "cu_olimpico"]
	_has_near_end = false
	_near_end_scale = 0.0
	_near_end_y = 0.0
	_has_side_stand.fill(false)
	_has_far_end = false
	_side_roots.clear()
	_side_views.clear()
	_pitch_box_cands.clear()

	_bowl_walls.clear()
	_near_box_top_y = - INF
	var stands: Array = _footprint_stands(footprint)
	_measure_roofs(stands)
	_measure_boxes(stands)















	if _att < 0.0:
		_att = _attendance()
	var tifo_en_curva: bool = div < 3 and _tifo_allowed()
	var word_at: Vector3 = Vector3.INF
	var word_far: Vector3 = Vector3.INF
	var word_side: Vector3 = Vector3.INF
	for s in stands:
		var c0: Vector3 = s["pos"]







		if (String(s["prom"]) != "full" or float(s["len"]) < 60.0) \
				and not bool(s.get("sigla", false)):
			continue
		if c0.z < 0.0 and absf(c0.x) < 20.0 and not tifo_en_curva:
			word_at = c0
			break





		if c0.z > FIELD_DEPTH:
			word_far = c0
		elif word_side == Vector3.INF and c0.x < -20.0:
			word_side = c0
	if word_at == Vector3.INF:
		word_at = word_far if word_far != Vector3.INF else word_side














	var honor_at: Vector3 = Vector3.INF
	if not _honor_surname().is_empty():
		var honor_far: Vector3 = Vector3.INF
		var honor_east: Vector3 = Vector3.INF
		var honor_west: Vector3 = Vector3.INF
		for s in stands:
			var ch: Vector3 = s["pos"]

			if (String(s["prom"]) != "full" or float(s["len"]) < WORKS_NEAR_MIN_LEN) \
					and not bool(s.get("apellido", false)):
				continue
			if ch.z > FIELD_DEPTH and absf(ch.x) < 20.0:
				honor_far = ch
			elif ch.x > 20.0 and honor_east == Vector3.INF:
				honor_east = ch
			elif ch.x < -20.0 and honor_west == Vector3.INF:
				honor_west = ch
		for cand in [honor_far, honor_east, honor_west]:
			if cand != Vector3.INF and cand != word_at:
				honor_at = cand
				break
		if honor_at == Vector3.INF and div >= 3:
			honor_at = word_at






	var works_at: Vector3 = Vector3.INF
	var works_side: Vector3 = Vector3.INF
	_obra_sitio = false
	if _works:
		for s in stands:
			var c1: Vector3 = s["pos"]
			if String(s["prom"]) == "absent":
				continue





			if c1.z < 0.0 and absf(c1.x) < 20.0 and float(s["len"]) >= WORKS_NEAR_MIN_LEN:
				works_at = c1
				break
			if c1.x > 20.0 and works_side == Vector3.INF and float(s["len"]) >= 60.0:
				works_side = c1



		if works_at == Vector3.INF and _works_site_cabe(stands):
			_obra_sitio = true
		elif works_at == Vector3.INF:
			works_at = works_side
	for i in stands.size():
		var s: Dictionary = stands[i]
		var prom: String = String(s["prom"])
		if prom == "absent":
			continue
		var c: Vector3 = s["pos"]



		var en_sitio: bool = _obra_sitio and _es_cabecera_cercana(s) \
				and c.x + float(s["len"]) * 0.5 > 0.5
		await _stand(c, float(s["len"]), float(s["face"]), prom,
			c == word_at, c == works_at or en_sitio, int(s.get("roof", -1)),
			- c.x if en_sitio else 0.0, en_sitio, c == honor_at, s)






		if c.z < 0.0 and absf(c.x) < 20.0:






			if not _has_near_end or c.y < _near_end_y:
				_near_end_y = c.y
				_near_end_scale = _prom_scale(prom)
			elif is_equal_approx(c.y, _near_end_y):
				_near_end_scale = maxf(_near_end_scale, _prom_scale(prom))
			_has_near_end = true






		if absf(c.x) > 20.0 and c.z > 0.0 and c.z < FIELD_DEPTH:
			_has_side_stand[1 if c.x > 0.0 else 0] = true





		if c.z > FIELD_DEPTH and absf(c.x) < 20.0:
			_has_far_end = true




		await _breathe(lerpf(0.7, 0.78,
			float(i + 1) / float(maxi(stands.size(), 1))))
	_obra_x0 = 0.0
	if _obra_sitio:
		_works_site(stands)



	if not _pitch_box_cands.is_empty():
		var mejor: Dictionary = _pitch_box_cands[0]
		for c in _pitch_box_cands:
			var r: Node3D = c["root"]
			var m: Node3D = mejor["root"]






			if absf(r.position.x) < absf(m.position.x) - 0.01 \
					or (absf(absf(r.position.x) - absf(m.position.x)) < 0.01
						and r.position.z > m.position.z):
				mejor = c

		(mejor["root"] as Node3D).set_meta("palco_pista", true)
		_pitch_boxes(mejor["root"], float(mejor["len"]))
		_pitch_box_cands.clear()
		await _respira()
	_build_floodlights()
	await _respira()
	_build_ground_fence()
	await _respira()


	SenaClub.monta(self)
	SenaPueblo.monta(self)
	await _respira()



	_build_ball_stop()
	await _respira()


	var antes_replicas: Dictionary = {}
	for c in _bowl_root().get_children():
		antes_replicas[c] = true




	_build_end_arch()
	await _respira()
	_build_end_bank()
	await _respira()
	_build_scaffold_legs()
	await _respira()
	_build_end_gable()
	await _respira()


	_build_moat_fence()
	await _respira()
	_build_clock_tower()
	await _respira()
	_build_end_cars()
	await _respira()

	preload("res://features/stadium/open_ground_details.gd").construir(self)
	await _respira()
	_build_factory()
	await _respira()

	_build_skin_wrap()
	await _respira()
	_build_flat_side()
	await _respira()
	_build_hanging_truss()
	await _respira()
	_build_saw_roof()
	await _respira()
	_build_colonnade()
	await _respira()
	_build_floating_roof()
	await _respira()
	_build_spiral_towers()
	await _respira()
	_build_calabash()
	await _respira()
	_build_monumental_gate()
	await _respira()
	_build_glass_wave()
	await _respira()
	_build_arcade()
	await _respira()
	_build_palcos_bombonera()
	await _respira()
	_registra_replicas(antes_replicas)
	await _respira()
	_build_corner_flags()
	await _respira()
	_build_ad_boards()
	await _respira()
	_build_scoreboard()
	await _respira()


	_build_flashes()
	await _respira()
	_build_phone_lights()
	await _respira()
	_build_panuelos()
	await _respira()




	if is_queued_for_deletion():
		return
	_build_capo()
	await _respira()


	_build_moths()
	await _respira()





func _mundial_seed() -> String:
	if _comp != "nat" or not home_club.is_empty() or att_override >= 0.0:
		return ""
	var f: Dictionary = GameState.current_fixture()
	if Competitions.id_of(f) != "mundial":
		return ""


	return Competitions.venue_of(f)















const NEUTRAL_FINAL_FOOTPRINTS: Array[String] = ["bowl_closed", "bowl_round",
	"ucl_anillos", "cubierta_membrana", "pantallon", "fondo_arco"]








static func mundial_footprint(sede: String) -> String:
	return NEUTRAL_FINAL_FOOTPRINTS[posmod(hash(sede), NEUTRAL_FINAL_FOOTPRINTS.size())]


func _pick_footprint() -> String:
	var pool: Array = DIV_FOOTPRINTS.get(clampi(div, 1, 3), DIV_FOOTPRINTS[3])
	var sede: String = _neutral_venue()
	if not sede.is_empty() and _comp != "nat":
		return NEUTRAL_FINAL_FOOTPRINTS[posmod(hash(sede), NEUTRAL_FINAL_FOOTPRINTS.size())]








	var mundial: String = _mundial_seed()
	if not mundial.is_empty():
		_venue_fp = true
		return mundial_footprint(mundial)
	var club: String = _pitch_seed_club()
	if club.is_empty():
		return String(pool[0])











	if _neutral_venue().is_empty():
		if _comp == "nat":









			_venue_fp = true
			return Stadiums.nation_footprint(Nations.name_of(club))
		var puesta: String = Stadiums.footprint_of(club)
		if not puesta.is_empty():
			return puesta




	if not _club_tier_v.is_empty():
		var tiers: Dictionary = FOOTPRINT_TIERS.get(clampi(div, 1, 3), {})
		var sub: Array = tiers.get(_club_tier_v, [])
		if not sub.is_empty():
			pool = sub



	if COUNTRY_BIAS_ON:
		return _biased_pick(pool, club, _country)
	return String(pool[posmod(hash(club), pool.size())])







func _biased_pick(pool: Array, club: String, country: String) -> String:
	var bias: Dictionary = COUNTRY_FOOTPRINT_BIAS.get(country, {})
	if bias.is_empty():
		return String(pool[posmod(hash(club), pool.size())])
	var pesos: Array = []
	var total: float = 0.0
	for fp in pool:
		var wt: float = maxf(float(bias.get(String(fp), 1.0)), 0.0)
		pesos.append(wt)
		total += wt
	if total <= 0.0:
		return String(pool[posmod(hash(club), pool.size())])
	var roll: float = float(posmod(hash(club) * 48271 + 11, 100003)) \
			/ 100003.0 * total
	for i in pool.size():
		roll -= float(pesos[i])
		if roll <= 0.0:
			return String(pool[i])
	return String(pool[pool.size() - 1])












func _pitch_seed_club() -> String:
	if not home_club.is_empty():
		return home_club




	if GameState.training_active and not GameState.tutorial_active \
			and not GameState.player_team_id.is_empty():
		return GameState.player_team_id
	var venue: String = _neutral_venue()
	return venue if not venue.is_empty() else GameState.host_id()






func _inquilino() -> String:
	if not _en_partido() or (GameState.training_active and not GameState.tutorial_active):
		return ""
	return GameState.prestado_hoy()






func _club_local() -> String:
	var inquilino: String = _inquilino()
	return inquilino if not inquilino.is_empty() else _pitch_seed_club()






















func _neutral_venue() -> String:
	if not home_club.is_empty() or att_override >= 0.0:
		return ""
	var f: Dictionary = GameState.current_fixture()
	if not Competitions.is_neutral(f):
		return ""
	return Competitions.venue_of(f)










func _st(x: float, z: float, length: float, facing: float,
		prom: String = "full", y: float = 0.0, roof: int = -1) -> Dictionary:
	return {"pos": Vector3(x, y, z), "len": length, "face": facing, "prom": prom,
		"roof": roof}






func _footprint_stands(name: String) -> Array:
	var far_z: float = FIELD_DEPTH + 16.0
	var far_cz: float = FIELD_DEPTH + 17.0
	var w: Dictionary = _st(- SIDE_STAND_X, HALF_LINE, 130.0, 90.0)
	var e: Dictionary = _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0)
	var n: Dictionary = _st(0.0, -16.0, 96.0, 0.0)
	var s: Dictionary = _st(0.0, far_z, 96.0, 180.0)

	var cn1: Dictionary = _st(- SIDE_CORNER_X, -17.0, 18.0, 45.0)
	var cn2: Dictionary = _st(SIDE_CORNER_X, -17.0, 18.0, -45.0)
	var cs1: Dictionary = _st(- SIDE_CORNER_X, far_cz, 18.0, 135.0)
	var cs2: Dictionary = _st(SIDE_CORNER_X, far_cz, 18.0, -135.0)
	match name:
		"bowl_closed":
			return [w, e, n, s, cn1, cn2, cs1, cs2]
		"rect_open":

			return [w, e, n, s]
		"horseshoe":












			return [w, e, _st(0.0, -16.0, 96.0, 0.0, "full", 0.0, 0),
				cn1, cn2, _st(0.0, far_z, 96.0, 180.0, "open")]
		"main_L":



			return [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"),
				_st(0.0, -16.0, 96.0, 0.0, "low"),
				_st(0.0, far_z, 96.0, 180.0, "open")]
		"two_side":





			return [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"),
				_st(0.0, -16.0, 96.0, 0.0, "open"),
				_st(0.0, far_z, 96.0, 180.0, "open")]
		"athletics":







			var p: float = TRACK_PUSH
			var pz: float = TRACK_PUSH_Z
			return [
				_st(- SIDE_STAND_X - p, HALF_LINE, 150.0, 90.0),
				_st(SIDE_STAND_X + p, HALF_LINE, 150.0, -90.0),
				_st(0.0, -16.0 - pz, 108.0, 0.0),
				_st(0.0, far_z + pz, 108.0, 180.0),
				_st(- SIDE_CORNER_X - p, -17.0 - pz, 30.0, 45.0),
				_st(SIDE_CORNER_X + p, -17.0 - pz, 30.0, -45.0),
				_st(- SIDE_CORNER_X - p, far_cz + pz, 30.0, 135.0),
				_st(SIDE_CORNER_X + p, far_cz + pz, 30.0, -135.0),
			]
		"bowl_round":


			var r: Array = [w, e, n, s]
			r.append_array(_round_corners())
			return r
		"coliseo":



			return _rounded_ring(4)
		"octagono":
			return _octagono_stands()
		"catedral":
			return _catedral_stands()
		"velas":
			return _velas_stands()
		"ucl_anillos":
			return _ucl_anillos_stands()
		"mundial_membrana":
			return _mundial_stands()
		"eul_principal":
			return _eul_principal_stands()
		"conf_caldera":
			return _conf_caldera_stands()
		"principal_doble":
			return _principal_doble_stands()
		"cubierta_membrana":
			return _mundial_stands()
		"fondo_kop":
			return _fondo_kop_stands()
		"fondo_bloques":



			return [w, e, _st(0.0, -16.0, 96.0, 0.0, "low"), s]
		"sin_fondo_arboles":




			return [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"),
				_st(0.0, far_z, 96.0, 180.0, "open"),
				_st(0.0, -16.0, 96.0, 0.0, _open_end_prom())]
		"dos_aguas":



			return [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"), n,
				_st(0.0, far_z, 96.0, 180.0, "open")]
		"campo_hundido":


			return _ring(SIDE_STAND_X, 20.0, 5, {},
				- float(FOOTPRINT_CFG["campo_hundido"]["dug"]))
		"pantallon":


			return [w, e, n, s, cn1, cn2, cs1, cs2]
		"fondo_arco":



			return _mundial_stands()
		"terraplen":


			return [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"),
				_st(0.0, far_z, 96.0, 180.0, "open"),
				_st(0.0, -16.0, 96.0, 0.0, _open_end_prom())]
		"gradas_tubo":





			var out: Array = [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"),
				_st(0.0, far_z, 96.0, 180.0, "open")]
			for mx in SCAFFOLD_X:
				out.append(_st(float(mx), -16.0, SCAFFOLD_LEN, 0.0, "low"))
			return out

		"muro_de_pie":
			return _muro_stands()
		"tres_anillos":
			return _tres_anillos_stands()
		"cu_olimpico":
			return _cu_olimpico_stands()
		"azteca_coloso":
			return _azteca_coloso_stands()
		"bombonera":
			return _bombonera_stands()
		"monumental_river":
			return _monumental_river_stands()
		"camp_nou":
			return _camp_nou_stands()
		"fondo_banderas":



			return _ring(SIDE_STAND_X, 20.0, 5, {})
		"tribuna_postes":



			return [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"), n,
				_st(0.0, far_z, 96.0, 180.0, "open")]
		"torre_reloj":


			return [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"),
				_st(0.0, -16.0, 96.0, 0.0, "low"),
				_st(0.0, far_z, 96.0, 180.0, "open")]
		"campo_coches":


			return [w, _st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"),
				_st(0.0, far_z, 96.0, 180.0, "open"),
				_st(0.0, -16.0, 96.0, 0.0, _open_end_prom())]
		"piel_envolvente":


			return _ring(SIDE_STAND_X, 22.0, 5, {})
		"lateral_plano":
			return _lateral_plano_stands()
		"anillo_colgado":
			return _anillo_colgado_stands()
		"techo_dientes":



			return [w, e, n, s]
		"columnata":


			return _ring(SIDE_STAND_X, 24.0, 6, {})
		"cubierta_flotante":


			return _ring(SIDE_STAND_X, 24.0, 6, {}, 0.0, 0)
		"ola_vidrio":



			return _ring(SIDE_STAND_X, 22.0, 5, {}, 0.0, 1)
		"puerta_monumental":




			return _ring(SIDE_STAND_X, 20.0, 5, {"n": "low"}, 0.0, 1)
		"calabaza":



			return _ring(SIDE_STAND_X, 22.0, 5, {}, 0.0, 1)
		"torres_rampa":





































			return _ring(SIDE_STAND_X, 20.0, 5, {}, 0.0, 1)
		"fondo_chimeneas":


			return [w, e, _st(0.0, -16.0, 96.0, 0.0, "low"), s]
	return [w, e, n, s, cn1, cn2, cs1, cs2]







func _muro_stands() -> Array:
	var proms: Dictionary = {"w": "low", "e": "low", "n": "absent", "s": "low",
		"c": "low"}
	var out: Array = _ring(SIDE_STAND_X, 20.0, 5, proms)
	out.append(_st(0.0, -16.0, 96.0, 0.0, "giant", 0.0, 1))
	return out





func _cu_olimpico_stands() -> Array:
	var bajo: Dictionary = {"w": "low", "e": "low", "n": "low", "s": "low", "c": "low"}
	var top: Vector2 = _slope_top(_prom_scale("low"))
	var retroceso: float = - top.y + 3.2
	var out: Array = []
	for piso in 2:
		var proms: Dictionary = bajo if piso == 0 else {"w": "full", "e": "full",
			"n": "low", "s": "low", "c": "full"}
		var anillo: Array = _ring(SIDE_STAND_X + TRACK_PUSH + retroceso * piso,
			42.0 + retroceso * piso, 3, proms,(top.x + 1.0) * piso, 0)
		for i in anillo.size():
			var d: Dictionary = anillo[i]
			var p: Vector3 = d["pos"]
			if piso == 1 and i >= 4:


				var prom: String = ["full", "cu_media", "low"][(i - 4) % 3]
				var fondo: float = - _slope_top(_prom_scale(prom)).y
				var fondo_pleno: float = - _slope_top().y
				d["len"] = float(d["len"]) + 2.0 *(fondo - fondo_pleno) * tan(PI / 12.0)
				d["prom"] = prom
			if i < 2:
				d["len"] = float(d["len"]) + 2.0 *(TRACK_PUSH_Z - TRACK_PUSH)
			else:
				p.z +=(TRACK_PUSH_Z - TRACK_PUSH) *(-1.0 if p.z < HALF_LINE else 1.0)
				d["pos"] = p
			d["piso"] = piso
			if piso == 1 and i == 0: d["singular"] = "palomar"
			if piso == 1 and i == 1: d["singular"] = "pebetero"
		out.append_array(RecintoSeams.cortes(anillo))
	return out




func _azteca_coloso_stands() -> Array:
	var bajo: Dictionary = {"w": "low", "e": "low", "n": "low", "s": "low", "c": "low"}
	var top: Vector2 = _slope_top(_prom_scale("low"))
	var retroceso: float = - top.y + 3.0
	var alturas: Array[float] = [0.0, top.x + 5.4, top.x * 2.0 + 6.6]
	var out: Array = []
	for piso in 3:
		var anillo: Array = _ring(SIDE_STAND_X + retroceso * piso,
			24.0 + retroceso * piso, 3, bajo if piso < 2 else {}, alturas[piso], 1 if piso == 2 else 0)
		for d in anillo:
			d["piso"] = piso
		out.append_array(RecintoSeams.cortes(anillo))
	return out















func _pisos_argentinos(planta: String) -> Array:
	var bombonera: bool = planta == "bombonera"
	var camp_nou: bool = planta == "camp_nou"
	var proms: Array = ["open", "low", "cu_media"] if bombonera else ["low", "low", "cu_media"]
	if camp_nou:
		proms = CampNouDetail.PISOS
	var out: Array = []
	var setback: float = SIDE_STAND_X
	var y: float = 0.0

	for piso in proms.size():
		var top: Vector2 = _slope_top(_prom_scale(String(proms[piso])))
		out.append({"setback": setback, "y": y, "prom": String(proms[piso]), "top": top})
		if bombonera:
			setback += - top.y - BomboneraDetail.VUELO
			y += top.x + BomboneraDetail.HUECO
		elif camp_nou:
			setback += - top.y - CampNouDetail.VUELO
			y += top.x + CampNouDetail.HUECO
		else:
			setback += - top.y + MonumentalDetail.PASILLO
			y += top.x +(MonumentalDetail.PASILLO_ALTO if piso == 0 \
					else MonumentalDetail.PALCOS_ALTO)
	return out




func _corona_cercana() -> Vector3:
	var alto: Dictionary = _pisos_argentinos(footprint).back()
	var top: Vector2 = alto["top"]
	var zn: float = -16.0 -(float(alto["setback"]) - SIDE_STAND_X)
	return Vector3(0.0, float(alto["y"]) + top.x, zn + top.y)


const BOMBONERA_CURVA: float = 22.0
const BOMBONERA_CHAFLAN: float = 8.0










func _bombonera_stands() -> Array:
	var pisos: Array = _pisos_argentinos("bombonera")
	var out: Array = []
	for piso in 3:
		var p: Dictionary = pisos[piso]
		var s: float = float(p["setback"])
		var crece: float = s - SIDE_STAND_X
		var zn: float = -16.0 - crece
		var zf: float = FIELD_DEPTH + 16.0 + crece
		var r: float = BOMBONERA_CURVA + crece
		var prom: String = String(p["prom"])
		var proms: Dictionary = {"n": prom, "s": prom, "w": prom, "e": prom, "c": prom}
		var puntos: Array = []
		var claves: Array = []
		var cerrado: bool = piso == 0
		if cerrado:

			puntos.append_array(_arco(Vector2(- s + r, zn + r), r, 180.0, 270.0, 4))
			puntos.append(Vector2(s - BOMBONERA_CHAFLAN, zn))
			puntos.append(Vector2(s, zn + BOMBONERA_CHAFLAN))
			puntos.append(Vector2(s, zf - BOMBONERA_CHAFLAN))
			puntos.append(Vector2(s - BOMBONERA_CHAFLAN, zf))
			puntos.append_array(_arco(Vector2(- s + r, zf - r), r, 90.0, 180.0, 4))
			claves = ["c", "c", "c", "c", "n", "c", "e", "c", "s", "c", "c", "c", "c", "w"]
		else:

			puntos.append(Vector2(PALCOS_BOMBONERA_X + 1.0, zn))
			puntos.append_array(_arco(Vector2(- s + r, zn + r), r, 270.0, 180.0, 4))
			puntos.append_array(_arco(Vector2(- s + r, zf - r), r, 180.0, 90.0, 4))
			puntos.append(Vector2(PALCOS_BOMBONERA_X + 1.0, zf))
			claves = ["n", "c", "c", "c", "c", "w", "c", "c", "c", "c", "s"]
		var anillo: Array = _anillo_poligonal(puntos, cerrado, claves, proms,
			float(p["y"]), 0)
		for d in anillo:
			var clave: String = String(d["clave"])
			d["piso"] = piso
			if piso == 0 and clave == "e":
				d["singular"] = "plateas"
			if piso == 1 and clave == "n":
				d["singular"] = "doce"
			if piso == 1 and clave == "s":
				d["apellido"] = true
			if piso == 2 and clave in ["n", "s"]:
				d["sigla"] = true
		out.append_array(RecintoSeams.cortes(anillo))
	return out


const MONUMENTAL_CURVA: float = 14.0



func _monumental_river_stands() -> Array:
	var out: Array = []
	var pisos: Array = _pisos_argentinos("monumental_river")
	for piso in 3:
		var p: Dictionary = pisos[piso]
		var prom: String = String(p["prom"])
		var s: float = float(p["setback"])
		var anillo: Array = _ring(s, MONUMENTAL_CURVA + s - SIDE_STAND_X, 3,
			{"w": prom, "e": prom, "n": prom, "s": prom, "c": prom}, float(p["y"]), 0)

		for i in anillo.size():
			var d: Dictionary = anillo[i]
			d["piso"] = piso
			if piso == 0 and i == 2:
				d["singular"] = "rotulo"
			if piso == 0 and i == 3:
				d["singular"] = "ovalo"
			if piso == 1 and i == 3:
				d["apellido"] = true
			if piso == 2 and (i == 2 or i == 3):
				d["sigla"] = true
		out.append_array(RecintoSeams.cortes(anillo))
	return out









func _camp_nou_stands() -> Array:
	var out: Array = []
	var pisos: Array = _pisos_argentinos("camp_nou")
	for piso in pisos.size():
		var p: Dictionary = pisos[piso]
		var prom: String = String(p["prom"])
		var s: float = float(p["setback"])
		var anillo: Array = _ring(s, CampNouDetail.CURVA + s - SIDE_STAND_X, 4,
			{"w": prom, "e": prom, "n": prom, "s": prom, "c": prom}, float(p["y"]), 0)

		for i in anillo.size():
			var d: Dictionary = anillo[i]
			d["piso"] = piso
			if piso == 1 and (i == 2 or i == 3):
				d["sigla"] = true
			if piso == 1 and (i == 1 or i == 3):
				d["apellido"] = true
		out.append_array(RecintoSeams.cortes(anillo))
	return out



func _arco(centro: Vector2, radio: float, a0: float, a1: float, piezas: int) -> Array:
	var out: Array = []
	for i in piezas + 1:
		var t: float = deg_to_rad(lerpf(a0, a1, float(i) / float(piezas)))
		out.append(centro + Vector2(cos(t), sin(t)) * radio)
	return out








func _anillo_poligonal(puntos: Array, cerrado: bool, claves: Array,
		proms: Dictionary, y: float, roof: int) -> Array:
	var n: int = puntos.size()
	var tramos: int = n if cerrado else n - 1
	var centro_campo: Vector2 = Vector2(0.0, HALF_LINE)
	var out: Array = []
	for i in tramos:
		var a: Vector2 = puntos[i]
		var b: Vector2 = puntos[(i + 1) % n]
		var dir: Vector2 =(b - a).normalized()
		var prom: String = String(proms.get(claves[i], "full"))
		var fondo: float = - _slope_top(_prom_scale(prom)).y
		var ext_a: float = 0.0
		var ext_b: float = 0.0
		if cerrado or i > 0:
			var previo: Vector2 =(a - Vector2(puntos[posmod(i - 1, n)])).normalized()
			ext_a = fondo * tan(absf(previo.angle_to(dir)) * 0.5)
		if cerrado or i < tramos - 1:
			var siguiente: Vector2 =(Vector2(puntos[(i + 2) % n]) - b).normalized()
			ext_b = fondo * tan(absf(dir.angle_to(siguiente)) * 0.5)
		var medio: Vector2 =(a + b) * 0.5 + dir *(ext_b - ext_a) * 0.5
		var normal: Vector2 = Vector2(- dir.y, dir.x)
		if normal.dot(centro_campo - medio) < 0.0:
			normal = - normal
		var d: Dictionary = _st(medio.x, medio.y, a.distance_to(b) + ext_a + ext_b,
			rad_to_deg(atan2(normal.x, normal.y)), prom, y, roof)
		d["clave"] = String(claves[i])
		out.append(d)
	return out







func _tres_anillos_stands() -> Array:
	var proms: Dictionary = {"w": "low", "e": "low", "n": "low", "s": "low",
		"c": "low"}
	var out: Array = _ring(SIDE_STAND_X, 20.0, 5, proms, 0.0, 0)
	var top: Vector2 = _slope_top(_prom_scale("low"))


	var back: float = - top.y + 5.5
	out.append_array(_ring(SIDE_STAND_X + back, 20.0 + back, 5,
		{"w": "absent", "e": "absent", "n": "low", "s": "absent", "c": "absent"},
		top.x, 0))
	out.append_array(_ring(SIDE_STAND_X + back * 2.0, 20.0 + back * 2.0, 5,
		{"w": "absent", "e": "absent", "n": "low", "s": "absent", "c": "absent"},
		top.x * 2.0, 1))
	return out










func _lateral_plano_stands() -> Array:
	var proms: Dictionary = {"w": "low", "e": "open", "n": "low", "s": "low",
		"c": "low"}
	var out: Array = _ring(SIDE_STAND_X, 18.0, 5, proms, 0.0, 0)
	var top: Vector2 = _slope_top(_prom_scale("low"))
	var back: float = - top.y + 5.5
	for piso in [1.0, 2.0]:
		out.append_array(_ring(SIDE_STAND_X + back * piso, 18.0 + back * piso, 5,
			{"w": "low", "e": "absent", "n": "low", "s": "absent", "c": "absent"},
			top.x * piso, 1 if piso > 1.5 else 0))
	return out











func _anillo_colgado_stands() -> Array:
	var proms: Dictionary = {"w": "low", "e": "low", "n": "low", "s": "low",
		"c": "low"}
	var out: Array = _ring(SIDE_STAND_X, 20.0, 5, proms, 0.0, 0)
	var top: Vector2 = _slope_top(_prom_scale("low"))
	out.append_array(_ring(SIDE_STAND_X - HANG_OVER, 20.0 - HANG_OVER, 5,
		proms, top.x + HANG_GAP, 1))
	return out


















func _octagono_stands() -> Array:
	var fz: float = FIELD_DEPTH
	var ex: float = 29.0
	var out: Array = [
		_st(- SIDE_STAND_X, HALF_LINE, 92.0, 90.0),
		_st(SIDE_STAND_X, HALF_LINE, 92.0, -90.0),
		_st(0.0, fz + 16.0, 58.0, 180.0),
	]










	var punta: Vector2 = Vector2(0.0, -16.0 + 5.0)









	var chaflan: float = 6.0
	out.append(_st(punta.x, punta.y, chaflan * 2.0, 0.0))
	for sx in [-1.0, 1.0]:
		var a: Vector2 = Vector2(sx * ex, -16.0)

		var b: Vector2 = Vector2(sx * chaflan, punta.y)
		var medio: Vector2 =(a + b) * 0.5




		var d: Vector2 =(b - a) if b.x > a.x else (a - b)





















		out.append(_st(medio.x, medio.y, d.length() * 1.06,
			rad_to_deg(atan2(- d.y, d.x))))

	var sz_near: float = 6.5
	var sz_far: float = fz - 6.5
	out.append_array(_arc_corner(Vector2(- SIDE_STAND_X, sz_near),
		Vector2(- SIDE_STAND_X, -16.0), Vector2(- ex, -16.0), 1))
	out.append_array(_arc_corner(Vector2(SIDE_STAND_X, sz_near),
		Vector2(SIDE_STAND_X, -16.0), Vector2(ex, -16.0), 1))
	out.append_array(_arc_corner(Vector2(- SIDE_STAND_X, sz_far),
		Vector2(- SIDE_STAND_X, fz + 16.0), Vector2(- ex, fz + 16.0), 1))
	out.append_array(_arc_corner(Vector2(SIDE_STAND_X, sz_far),
		Vector2(SIDE_STAND_X, fz + 16.0), Vector2(ex, fz + 16.0), 1))
	return out


func _rounded_ring(m: int) -> Array:
	var fz: float = FIELD_DEPTH

	var out: Array = [
		_st(- SIDE_STAND_X, HALF_LINE, 92.0, 90.0),
		_st(SIDE_STAND_X, HALF_LINE, 92.0, -90.0),
		_st(0.0, -16.0, 58.0, 0.0),
		_st(0.0, fz + 16.0, 58.0, 180.0),
	]



	var ex: float = 29.0
	var sz_near: float = 6.5
	var sz_far: float = fz - 6.5
	out.append_array(_arc_corner(Vector2(- SIDE_STAND_X, sz_near),
		Vector2(- SIDE_STAND_X, -16.0), Vector2(- ex, -16.0), m))
	out.append_array(_arc_corner(Vector2(SIDE_STAND_X, sz_near),
		Vector2(SIDE_STAND_X, -16.0), Vector2(ex, -16.0), m))
	out.append_array(_arc_corner(Vector2(- SIDE_STAND_X, sz_far),
		Vector2(- SIDE_STAND_X, fz + 16.0), Vector2(- ex, fz + 16.0), m))
	out.append_array(_arc_corner(Vector2(SIDE_STAND_X, sz_far),
		Vector2(SIDE_STAND_X, fz + 16.0), Vector2(ex, fz + 16.0), m))
	return out






func _arc_corner(a: Vector2, c: Vector2, b: Vector2, m: int) -> Array:
	var out: Array = []
	for i in m:

		var t0: float = float(i) / float(m)
		var t1: float = float(i + 1) / float(m)
		var tm: float =(t0 + t1) * 0.5
		var pm: Vector2 = _bezier2(a, c, b, tm)
		var p0: Vector2 = _bezier2(a, c, b, t0)
		var p1: Vector2 = _bezier2(a, c, b, t1)
		var facing: float = rad_to_deg(atan2(- pm.x, HALF_LINE - pm.y))
		out.append(_st(pm.x, pm.y, p0.distance_to(p1) * 1.18, facing))
	return out


func _bezier2(a: Vector2, c: Vector2, b: Vector2, t: float) -> Vector2:
	var u: float = 1.0 - t
	return a *(u * u) + c *(2.0 * u * t) + b *(t * t)






func _catedral_stands() -> Array:
	var far_z: float = FIELD_DEPTH + 16.0
	return [
		_st(- SIDE_STAND_X, HALF_LINE, 150.0, 90.0),
		_st(SIDE_STAND_X, HALF_LINE, 130.0, -90.0, "low"),
		_st(0.0, -16.0, 96.0, 0.0, "low"),
		_st(0.0, far_z, 96.0, 180.0, "low"),
	]






func _velas_stands() -> Array:
	var out: Array = []

	var zs: Array = [26.0, HALF_LINE, 79.0]







	var xs: Array = [SIDE_STAND_X, SIDE_STAND_X + 5.5, SIDE_STAND_X]
	for s in [-1.0, 1.0]:
		for k in 3:
			var x: float = float(xs[k]) * s


			var length: float = 46.0 if k == 1 else 34.0







			var face: float = -90.0 * s
			if k != 1:

				face +=(8.0 if float(zs[k]) < HALF_LINE else -8.0) * s
			out.append(_st(x, float(zs[k]), length, face))



	out.append(_st(0.0, -16.0, 96.0, 0.0, "open"))
	out.append(_st(0.0, FIELD_DEPTH + 16.0, 96.0, 180.0, "open"))
	return out






















func _ring(setback: float, radius: float, per_corner: int,
		proms: Dictionary, y: float = 0.0, roof: int = -1,
		roofs: Dictionary = {}) -> Array:


	var pull: float = SIDE_STAND_X - setback
	var zn: float = -16.0 + pull
	var zf: float = FIELD_DEPTH + 16.0 - pull
	var r: float = minf(radius, minf(setback - 1.0,(zf - zn) * 0.5 - 1.0))











	var step: float = deg_to_rad(90.0 / float(per_corner))
	var out: Array = []
	var seg: Callable = func(x: float, z: float, chord: float, face: float,
			key: String) -> Dictionary:
		var prom: String = String(proms.get(key, "full"))


		var deep: float = - _slope_top(_prom_scale(prom)).y
		var ext: float = deep * tan(step * 0.5)
		return _st(x, z, chord + 2.0 * ext, face, prom, y,
			int(roofs.get(key, roof)))
	var side_len: float =(zf - r) -(zn + r)
	var end_len: float = 2.0 *(setback - r)
	var mid_z: float =(zn + zf) * 0.5
	out.append(seg.call(- setback, mid_z, side_len, 90.0, "w"))
	out.append(seg.call(setback, mid_z, side_len, -90.0, "e"))
	out.append(seg.call(0.0, zn, end_len, 0.0, "n"))
	out.append(seg.call(0.0, zf, end_len, 180.0, "s"))
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:

			var c: Vector2 = Vector2(sx *(setback - r),(zn + r) if sz < 0.0 else (zf - r))
			var a0: float = 180.0 if sx < 0.0 else 0.0
			var a1: float = a0 +(90.0 if sx * sz > 0.0 else -90.0)
			for i in per_corner:
				var t0: float = deg_to_rad(lerpf(a0, a1, float(i) / float(per_corner)))
				var t1: float = deg_to_rad(lerpf(a0, a1, float(i + 1) / float(per_corner)))
				var p0: Vector2 = c + Vector2(cos(t0), sin(t0)) * r
				var p1: Vector2 = c + Vector2(cos(t1), sin(t1)) * r
				var pm: Vector2 =(p0 + p1) * 0.5

				var dir: Vector2 =(c - pm).normalized()
				out.append(seg.call(pm.x, pm.y, p0.distance_to(p1),
					rad_to_deg(atan2(dir.x, dir.y)), "c"))
	return out






func _ucl_anillos_stands() -> Array:
	var proms: Dictionary = {"w": "low", "e": "low", "n": "low", "s": "low", "c": "low"}
	var out: Array = _ring(SIDE_STAND_X, 26.0, 6, proms, 0.0, 0)


	var top: Vector2 = _slope_top(_prom_scale("low"))
	var back: float = - top.y + 3.0
	out.append_array(_ring(SIDE_STAND_X + back, 26.0 + back, 6, proms, top.x, 1))
	return out












func _mundial_stands() -> Array:
	return _ring(SIDE_STAND_X, 20.0, 5, {})





func _eul_principal_stands() -> Array:










	return _ring(SIDE_STAND_X, 18.0, 5,
		{"w": "low", "e": "low", "n": "open", "s": "full", "c": "low"})






func _conf_caldera_stands() -> Array:
	return _ring(SIDE_STAND_X - 3.5, 12.0, 4, {})







func _principal_doble_stands() -> Array:
	var proms: Dictionary = {"w": "low", "e": "low", "n": "low", "s": "low", "c": "low"}
	var out: Array = _ring(SIDE_STAND_X, 20.0, 5, proms, 0.0, 0)
	var top: Vector2 = _slope_top(_prom_scale("low"))
	var back: float = - top.y + 3.0







	out.append_array(_ring(SIDE_STAND_X + back, 20.0 + back, 5,
		{"w": "absent", "e": "absent", "n": "low", "s": "low", "c": "absent"},
		top.x, 1))
	return out










func _fondo_kop_stands() -> Array:
	var proms: Dictionary = {"w": "low", "e": "low", "n": "low", "s": "low", "c": "low"}
	var out: Array = _ring(SIDE_STAND_X, 20.0, 5, proms, 0.0, 0)


	var top: Vector2 = _slope_top(_prom_scale("low"))
	var back: float = - top.y + 3.0
	out.append_array(_ring(SIDE_STAND_X + back, 20.0 + back, 5,
		{"w": "absent", "e": "absent", "n": "low", "s": "absent", "c": "absent"},
		top.x, 1))
	return out



































const ARCH_Z: float = -34.0
const ARCH_HALF: float = 46.0
const ARCH_H: float = 38.0
const ARCH_LEAN: float = -10.0
const ARCH_SEGS: int = 26
const ARCH_TUBE: float = 1.5
const ARCH_CABLES: int = 9
func _build_end_arch() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("arch", false)):
		return
	var steel: StandardMaterial3D = StandardMaterial3D.new()
	steel.albedo_color = Color("cdd3dc")
	steel.roughness = 0.45
	var root: Node3D = Node3D.new()
	root.position = Vector3(0.0, 0.0, ARCH_Z)


	root.rotation_degrees = Vector3(ARCH_LEAN, 0.0, 0.0)
	_bowl_root().add_child(root)



	var pts: Array[Vector2] = []
	for i in ARCH_SEGS + 1:
		var a: float = PI * float(i) / float(ARCH_SEGS)
		pts.append(Vector2(- cos(a) * ARCH_HALF, sin(a) * ARCH_H))
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = _box(Vector3(1.0, ARCH_TUBE, ARCH_TUBE))
	mm.instance_count = ARCH_SEGS
	for i in ARCH_SEGS:
		var p0: Vector2 = pts[i]
		var p1: Vector2 = pts[i + 1]
		var mid: Vector2 =(p0 + p1) * 0.5
		var d: Vector2 = p1 - p0




		var b: Basis = Basis(Vector3.BACK, atan2(d.y, d.x)).scaled_local(
			Vector3(d.length(), 1.0, 1.0))
		_mm_pon(mm, i, Transform3D(b, Vector3(mid.x, mid.y, 0.0)))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = steel


	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mmi)



	var top: Vector2 = _slope_top()


	var tie_y: float = top.x + ROOF_RISE
	var tie_z: float =(-16.0 + top.y) - ARCH_Z
	var cm: MultiMesh = MultiMesh.new()
	cm.transform_format = MultiMesh.TRANSFORM_3D
	cm.mesh = _box(Vector3(0.22, 1.0, 0.22))
	cm.instance_count = ARCH_CABLES
	for i in ARCH_CABLES:




		var t: float = lerpf(0.3, 0.7, float(i) / float(ARCH_CABLES - 1))
		var a2: float = PI * t
		var from: Vector3 = Vector3(- cos(a2) * ARCH_HALF, sin(a2) * ARCH_H, 0.0)
		var to: Vector3 = Vector3(from.x * 0.62, tie_y, tie_z)
		_mm_pon(cm, i, _tube_xf(from, to))
	var cmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	cmi.multimesh = cm
	cmi.material_override = steel
	cmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(cmi)















const GABLE_W: float = 27.0
const GABLE_H: float = 5.8
func _build_end_gable() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("gable", false)):
		return
	var scale: float = _near_end_scale if _near_end_scale > 0.0 else 1.0
	var top: Vector2 = _slope_top(scale)

	var front_y: float = top.x + ROOF_RISE - ROOF_DROP
	var front_z: float = -16.0 + top.y + _roof_depth(top)
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)


	var cream: StandardMaterial3D = StandardMaterial3D.new()
	cream.albedo_color = Color("d8d2c2")
	cream.roughness = 1.0


	var gable: MeshInstance3D = MeshInstance3D.new()
	var prism: PrismMesh = PrismMesh.new()
	prism.size = Vector3(GABLE_W, GABLE_H, 0.7)
	gable.mesh = prism
	gable.material_override = cream
	gable.position = Vector3(0.0, front_y + GABLE_H * 0.5, front_z)
	root.add_child(gable)


	var panel: StandardMaterial3D = StandardMaterial3D.new()
	panel.albedo_color = front_wall_color()
	panel.roughness = 1.0
	var sign: MeshInstance3D = MeshInstance3D.new()
	sign.mesh = _box(Vector3(GABLE_W * 0.62, GABLE_H * 0.3, 0.25))
	sign.material_override = panel
	sign.position = Vector3(0.0, front_y + GABLE_H * 0.3, front_z + 0.4)
	sign.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(sign)


	var eave: MeshInstance3D = MeshInstance3D.new()
	eave.mesh = _box(Vector3(96.0 + _roof_overhang(), 0.9, 0.5))
	eave.material_override = cream
	eave.position = Vector3(0.0, front_y - 0.2, front_z + 0.1)
	eave.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(eave)










func _mm_pon(mm: MultiMesh, i: int, xf: Transform3D) -> void:
	mm.set_instance_transform(i, xf)
	if not mm.has_meta("occ_xf"):
		var vacia: Array[Transform3D] = []
		vacia.resize(mm.instance_count)
		mm.set_meta("occ_xf", vacia)
	var copia: Array[Transform3D] = mm.get_meta("occ_xf")
	copia[i] = xf








func _tube_xf(a: Vector3, b: Vector3) -> Transform3D:
	var seg: Vector3 = b - a
	var dir: Vector3 = seg.normalized()
	var up: Vector3 = Vector3.RIGHT if absf(dir.x) < 0.9 else Vector3.UP


	var b3: Basis = Basis.looking_at(dir, up) * Basis(Vector3.RIGHT, PI * 0.5)





	return Transform3D(b3.scaled_local(Vector3(1.0, seg.length(), 1.0)),(a + b) * 0.5)





































func _build_moat_fence() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("malla", false)):
		return
	var root: Node3D = Node3D.new()
	root.position = Vector3(0.0, 0.0, -10.6)
	_bowl_root().add_child(root)




	var mesh_mat: StandardMaterial3D = StandardMaterial3D.new()
	mesh_mat.albedo_texture = _cordon_texture()
	mesh_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mesh_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mesh_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	var pano: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()


	q.size = Vector2(44.0, 3.2)
	mesh_mat.uv1_scale = Vector3(44.0 / 1.2, 3.2 / 1.2, 1.0)
	pano.mesh = q
	pano.material_override = mesh_mat
	pano.position = Vector3(0.0, 2.8, 0.0)
	pano.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(pano)
	var post_mat: StandardMaterial3D = StandardMaterial3D.new()
	post_mat.albedo_color = Color("3c434c")
	post_mat.roughness = 0.8
	for i in 7:
		var px: float = lerpf(-21.4, 21.4, float(i) / 6.0)
		var post: MeshInstance3D = MeshInstance3D.new()
		var pm: BoxMesh = BoxMesh.new()
		pm.size = Vector3(0.16, 4.6, 0.16)
		post.mesh = pm
		post.material_override = post_mat
		post.position = Vector3(px, 2.3, 0.02)
		post.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(post)






















const SKIN_SLATS: int = 14
const SKIN_RISE: float = 15.5
const SKIN_LEAN: float = 4.6
const SKIN_R: float = 22.0
func _build_skin_wrap() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("piel", false)):
		return
	var top: Vector2 = _slope_top()
	var deep: float = - top.y


	var half_x: float = SIDE_STAND_X + deep + 1.5
	var zn: float = -16.0 - deep - 1.5
	var zf: float = FIELD_DEPTH + 16.0 + deep + 1.5



	var base_y: float = top.x + ROOF_RISE - 3.0
	var paso: float = SKIN_RISE / float(SKIN_SLATS)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("c3c8ce")
	mat.metallic = 0.55
	mat.roughness = 0.32




	if bool(weather.get("floodlights", false)) or _big_night:
		mat.emission_enabled = true
		mat.emission = Color("f2e7cf")
		mat.emission_energy_multiplier = 0.22




	var fondo_mat: StandardMaterial3D = StandardMaterial3D.new()
	fondo_mat.albedo_color = Color("8f959d")
	fondo_mat.roughness = 0.6
	if bool(weather.get("floodlights", false)) or _big_night:
		fondo_mat.emission_enabled = true
		fondo_mat.emission = Color("d8c8a8")
		fondo_mat.emission_energy_multiplier = 0.12
	var fondo_segs: Array = _rect_ring_segs(half_x - SKIN_LEAN * 0.45,
		zn + SKIN_LEAN * 0.45, zf - SKIN_LEAN * 0.45, SKIN_R, 5)
	var fm: MultiMesh = MultiMesh.new()
	fm.transform_format = MultiMesh.TRANSFORM_3D
	fm.mesh = _box(Vector3(1.0, SKIN_RISE + 3.0, 0.35))
	fm.instance_count = fondo_segs.size()
	for i in fondo_segs.size():
		var sg: Dictionary = fondo_segs[i]
		var fb: Basis = Basis(Vector3.UP, deg_to_rad(float(sg["yaw"]))) \
				.scaled_local(Vector3(float(sg["len"]), 1.0, 1.0))
		_mm_pon(fm, i, Transform3D(fb, Vector3(float(sg["x"]),
			base_y + SKIN_RISE * 0.5, float(sg["z"]))))
	var fmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	fmi.multimesh = fm
	fmi.material_override = fondo_mat
	fmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bowl_root().add_child(fmi)

	var xf: Array[Transform3D] = []
	for k in SKIN_SLATS:
		var t: float = float(k) / float(SKIN_SLATS - 1)
		var dentro: float = SKIN_LEAN * t * t
		var y: float = base_y +(float(k) + 0.5) * paso
		for seg in _rect_ring_segs(half_x - dentro, zn + dentro, zf - dentro,
				SKIN_R, 5):
			var largo: float = float(seg["len"])
			var b: Basis = Basis(Vector3.UP, deg_to_rad(float(seg["yaw"]))) \
					.scaled_local(Vector3(largo, 1.0, 1.0))
			xf.append(Transform3D(b, Vector3(float(seg["x"]), y, float(seg["z"]))))
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D

	mm.mesh = _box(Vector3(1.0, paso * 0.8, 0.55))
	mm.instance_count = xf.size()
	for i in xf.size():
		_mm_pon(mm, i, xf[i])
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = mat


	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bowl_root().add_child(mmi)













const FLAT_H: float = 27.0
const FLAT_BANDS: int = 3





const FLAT_X_OFF: float = 2.0
const FLAT_THICK: float = 4.0
const PALCOS_BOMBONERA_X: float = 47.2
const PALCOS_BOMBONERA_H: float = 26.0
const PALCOS_BOMBONERA_FONDO: float = 9.0






func _build_palcos_bombonera() -> void:
	if footprint != "bombonera":
		return
	var alto: Dictionary = _pisos_argentinos(footprint)[2]
	var top: Vector2 = alto["top"]
	var zn: float = -16.0 -(float(alto["setback"]) - SIDE_STAND_X)
	var root: Node3D = Node3D.new()
	root.name = "PalcosBombonera"
	_bowl_root().add_child(root)


	var materiales: Array = BomboneraDetail.palcos(root, PALCOS_BOMBONERA_X,
		PALCOS_BOMBONERA_H, PALCOS_BOMBONERA_FONDO, zn + top.y - 1.6,
		float(alto["y"]) + top.x + 1.4, HALF_LINE)
	for mat in materiales:
		_caracter.material(mat)
		if mat.has_meta("luces_azteca"):
			_finish_lamps.append(mat)





func _focos_argentinos() -> void:

	var alto: Dictionary = _pisos_argentinos(footprint).back()
	var top: Vector2 = alto["top"]
	for lado in [-1.0, 1.0]:
		var x: float = float(alto["setback"]) - top.y
		var y: float = float(alto["y"]) + top.x + 3.6
		if footprint == "bombonera" and lado > 0.0:
			x = PALCOS_BOMBONERA_X - 2.3
			y = PALCOS_BOMBONERA_H - 0.2
		for fondo in [0.0, FIELD_DEPTH]:
			var foco: SpotLight3D = SpotLight3D.new()
			foco.position = Vector3(lado * x, y, fondo)
			foco.spot_range = 120.0
			foco.spot_angle = 58.0
			foco.light_energy = FLOOD_ENERGY
			foco.light_color = Color("eef2ff")
			foco.shadow_enabled = false
			foco.visible = false
			_bowl_root().add_child(foco)
			foco.look_at(Vector3(lado * 12.0, 0.0, lerpf(fondo, HALF_LINE, 0.65)))
			_spotlights.append(foco)


func _build_flat_side() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("plancha", false)):
		return
	var largo: float = 128.0




	var x: float = SIDE_STAND_X + FLAT_X_OFF
	var root: Node3D = Node3D.new()
	root.position = Vector3(x, 0.0, HALF_LINE)
	_bowl_root().add_child(root)
	var hormigon: StandardMaterial3D = StandardMaterial3D.new()
	hormigon.albedo_color = Color("b9b2a4")
	hormigon.roughness = 0.95
	var cuerpo: MeshInstance3D = MeshInstance3D.new()
	cuerpo.mesh = _box(Vector3(FLAT_THICK, FLAT_H, largo))
	cuerpo.material_override = hormigon
	cuerpo.position = Vector3(0.0, FLAT_H * 0.5, 0.0)
	root.add_child(cuerpo)



	var vidrio: StandardMaterial3D = StandardMaterial3D.new()
	vidrio.albedo_color = Color("2b3440")
	vidrio.roughness = 0.18
	vidrio.metallic = 0.4
	if bool(weather.get("floodlights", false)) or _big_night:
		vidrio.emission_enabled = true
		vidrio.emission = Color("ffd9a0")
		vidrio.emission_energy_multiplier = 0.55
	for i in FLAT_BANDS:
		var band: MeshInstance3D = MeshInstance3D.new()
		band.mesh = _box(Vector3(0.5, 2.6, largo - 4.0))
		band.material_override = vidrio
		band.position = Vector3(- FLAT_THICK * 0.53,
			FLAT_H *(0.3 + 0.22 * float(i)), 0.0)
		band.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(band)











const TRUSS_N: int = 13
const HANG_OVER: float = 5.0
const HANG_GAP: float = 3.0
func _build_hanging_truss() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("celosia", false)):
		return
	var top: Vector2 = _slope_top(_prom_scale("low"))
	var steel: StandardMaterial3D = StandardMaterial3D.new()
	steel.albedo_color = Color("6e7681")
	steel.roughness = 0.6
	var root: Node3D = Node3D.new()
	root.position = Vector3(0.0, 0.0, -16.0)
	_bowl_root().add_child(root)


	var atras: Vector3 = Vector3(0.0, top.x, top.y)
	var frente: Vector3 = Vector3(0.0, top.x + HANG_GAP, top.y + HANG_OVER)





	var muro: StandardMaterial3D = StandardMaterial3D.new()
	muro.albedo_color = Color("3a4149")
	muro.roughness = 0.9





	var back: MeshInstance3D = MeshInstance3D.new()
	back.mesh = _box(Vector3(110.0, 10.0, 0.5))
	back.material_override = muro
	back.position = Vector3(0.0, top.x + 2.0, top.y - 0.3)
	back.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(back)



	var sof: MeshInstance3D = MeshInstance3D.new()
	sof.mesh = _box(Vector3(110.0, 0.5, HANG_OVER + 1.5))
	sof.material_override = muro
	sof.position = Vector3(0.0, top.x + HANG_GAP,
		top.y +(HANG_OVER + 1.5) * 0.5 - 0.3)
	sof.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(sof)
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = _box(Vector3(0.34, 1.0, 0.34))
	mm.instance_count = TRUSS_N
	for i in TRUSS_N:
		var px: float = lerpf(-44.0, 44.0, float(i) / float(TRUSS_N - 1))
		_mm_pon(mm, i, _tube_xf(
			atras + Vector3(px, 0.0, 0.0), frente + Vector3(px, 0.0, 0.0)))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = steel
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mmi)












const SAW_N: int = 7
const SAW_H: float = 3.4
func _build_saw_roof() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("dientes", false)):
		return
	var scale: float = _near_end_scale if _near_end_scale > 0.0 else 1.0
	var top: Vector2 = _slope_top(scale)
	var front_y: float = top.x + ROOF_RISE - ROOF_DROP
	var front_z: float = -16.0 + top.y + _roof_depth(top)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("9aa2ac")
	mat.roughness = 0.85
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)
	var ancho: float = 96.0 / float(SAW_N)
	for i in SAW_N:
		var px: float = -48.0 + ancho *(float(i) + 0.5)
		var diente: MeshInstance3D = MeshInstance3D.new()
		var pr: PrismMesh = PrismMesh.new()
		pr.size = Vector3(ancho * 0.96, SAW_H, 0.7)
		diente.mesh = pr
		diente.material_override = mat
		diente.position = Vector3(px, front_y + SAW_H * 0.5, front_z)
		diente.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(diente)











const COL_STEP: float = 8.5




const COL_RISE: float = 17.0
func _build_colonnade() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("columnata", false)):
		return
	var top: Vector2 = _slope_top()
	var deep: float = - top.y
	var half_x: float = SIDE_STAND_X + deep + 2.5
	var zn: float = -16.0 - deep - 2.5
	var zf: float = FIELD_DEPTH + 16.0 + deep + 2.5
	var alto: float = top.x + ROOF_RISE + COL_RISE
	var piedra: StandardMaterial3D = StandardMaterial3D.new()
	piedra.albedo_color = Color("ece7dc")
	piedra.roughness = 0.85
	if bool(weather.get("floodlights", false)) or _big_night:
		piedra.emission_enabled = true
		piedra.emission = Color("fff2d8")
		piedra.emission_energy_multiplier = 0.18
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)
	var segs: Array = _rect_ring_segs(half_x, zn, zf, SKIN_R, 6)


	var vm: MultiMesh = MultiMesh.new()
	vm.transform_format = MultiMesh.TRANSFORM_3D
	vm.mesh = _box(Vector3(1.0, 2.8, 2.0))
	vm.instance_count = segs.size()
	for i in segs.size():
		var sg: Dictionary = segs[i]
		var b: Basis = Basis(Vector3.UP, deg_to_rad(float(sg["yaw"]))) \
				.scaled_local(Vector3(float(sg["len"]), 1.0, 1.0))
		_mm_pon(vm, i, Transform3D(b,
			Vector3(float(sg["x"]), alto, float(sg["z"]))))
	var vmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	vmi.multimesh = vm
	vmi.material_override = piedra
	vmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(vmi)

	var col_xf: Array[Transform3D] = []
	for sg2 in segs:
		var largo: float = float(sg2["len"])
		var n: int = maxi(int(largo / COL_STEP), 1)
		var yaw: float = deg_to_rad(float(sg2["yaw"]))
		var dir: Vector3 = Vector3(cos(yaw), 0.0, - sin(yaw))
		for j in n:
			var t: float =(float(j) + 0.5) / float(n) - 0.5
			var pos: Vector3 = Vector3(float(sg2["x"]), alto * 0.5,
				float(sg2["z"])) + dir *(t * largo)
			col_xf.append(Transform3D(Basis(Vector3.UP, yaw), pos))
	var cm: MultiMesh = MultiMesh.new()
	cm.transform_format = MultiMesh.TRANSFORM_3D
	cm.mesh = _box(Vector3(2.3, alto, 2.0))
	cm.instance_count = col_xf.size()
	for i in col_xf.size():
		_mm_pon(cm, i, col_xf[i])
	var cmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	cmi.multimesh = cm
	cmi.material_override = piedra
	cmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(cmi)























const FLOAT_GAP: float = 5.5
const FLOAT_BAND: float = 17.0
const FLOAT_MASTS: int = 14
func _build_floating_roof() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("flotante", false)):
		return
	var top: Vector2 = _slope_top()
	var deep: float = - top.y
	var alto: float = top.x + FLOAT_GAP



	var half_x: float = SIDE_STAND_X + deep * 0.5
	var zn: float = -16.0 - deep * 0.5
	var zf: float = FIELD_DEPTH + 16.0 + deep * 0.5
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)
	var losa: StandardMaterial3D = StandardMaterial3D.new()
	losa.albedo_color = Color("d9dce1")
	losa.roughness = 0.62


	if bool(weather.get("floodlights", false)) or _big_night:
		losa.emission_enabled = true
		losa.emission = Color("e8ecf2")
		losa.emission_energy_multiplier = 0.2
	var segs: Array = _rect_ring_segs(half_x, zn, zf, SKIN_R, 6)
	var rm: MultiMesh = MultiMesh.new()
	rm.transform_format = MultiMesh.TRANSFORM_3D
	rm.mesh = _box(Vector3(1.0, 0.8, FLOAT_BAND))
	rm.instance_count = segs.size()
	for i in segs.size():
		var sg: Dictionary = segs[i]
		var b: Basis = Basis(Vector3.UP, deg_to_rad(float(sg["yaw"]))) \
				.scaled_local(Vector3(float(sg["len"]), 1.0, 1.0))
		_mm_pon(rm, i, Transform3D(b,
			Vector3(float(sg["x"]), alto, float(sg["z"]))))
	var rmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	rmi.multimesh = rm
	rmi.material_override = losa


	rmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(rmi)



	var acero: StandardMaterial3D = StandardMaterial3D.new()
	acero.albedo_color = Color("9aa3ad")
	acero.roughness = 0.45
	var fuera: Array = _rect_ring_segs(half_x + FLOAT_BAND * 0.5 + 2.0,
		zn - FLOAT_BAND * 0.5 - 2.0, zf + FLOAT_BAND * 0.5 + 2.0, SKIN_R, 3)
	var mastiles: Array[Vector3] = []
	var por_tramo: int = maxi(int(round(float(FLOAT_MASTS) / float(fuera.size()))), 1)
	for sg2 in fuera:
		var largo: float = float(sg2["len"])
		var yaw: float = deg_to_rad(float(sg2["yaw"]))
		var dir: Vector3 = Vector3(cos(yaw), 0.0, - sin(yaw))
		for j in por_tramo:
			var t: float =(float(j) + 0.5) / float(por_tramo) - 0.5
			mastiles.append(Vector3(float(sg2["x"]), 0.0, float(sg2["z"]))
				+ dir *(t * largo))
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = _box(Vector3(0.9, alto + 5.0, 0.9))
	mm.instance_count = mastiles.size()
	for i in mastiles.size():
		_mm_pon(mm, i, Transform3D(Basis(),
			mastiles[i] + Vector3(0.0,(alto + 5.0) * 0.5, 0.0)))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = acero
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mmi)



	var cm: MultiMesh = MultiMesh.new()
	cm.transform_format = MultiMesh.TRANSFORM_3D
	cm.mesh = _box(Vector3(0.16, 1.0, 0.16))
	cm.instance_count = mastiles.size()
	for i in mastiles.size():
		var pie: Vector3 = mastiles[i]
		var punta: Vector3 = pie + Vector3(0.0, alto + 5.0, 0.0)

		var hacia: Vector3 =(Vector3(0.0, 0.0, HALF_LINE) - pie)
		hacia.y = 0.0
		var amarre: Vector3 = pie + hacia.normalized() *(FLOAT_BAND + 2.0) \
				+ Vector3(0.0, alto, 0.0)
		_mm_pon(cm, i, _tube_xf(punta, amarre))
	var cmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	cmi.multimesh = cm
	cmi.material_override = acero
	cmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(cmi)
















const ARC_N: int = 9
const ARC_H: float = 5.4
const ARC_PILA: float = 1.1
func _build_arcade() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("arcada", false)):
		return
	var scale: float = _near_end_scale if _near_end_scale > 0.0 else 1.0
	var top: Vector2 = _slope_top(scale)
	var y0: float = top.x + ROOF_RISE
	var z: float = -16.0 + top.y + 0.6
	var piedra: StandardMaterial3D = StandardMaterial3D.new()
	piedra.albedo_color = Color("cfc6b0")
	piedra.roughness = 0.95
	if bool(weather.get("floodlights", false)) or _big_night:
		piedra.emission_enabled = true
		piedra.emission = Color("ffeccc")
		piedra.emission_energy_multiplier = 0.14
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)
	var ancho: float = 88.0 / float(ARC_N)


	var jm: MultiMesh = MultiMesh.new()
	jm.transform_format = MultiMesh.TRANSFORM_3D
	jm.mesh = _box(Vector3(ARC_PILA, ARC_H, 1.3))
	jm.instance_count = ARC_N + 1
	for i in ARC_N + 1:
		var px: float = -44.0 + ancho * float(i)
		_mm_pon(jm, i, Transform3D(Basis(),
			Vector3(px, y0 + ARC_H * 0.5, z)))
	var jmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	jmi.multimesh = jm
	jmi.material_override = piedra
	jmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(jmi)


	var dm: MultiMesh = MultiMesh.new()
	dm.transform_format = MultiMesh.TRANSFORM_3D
	dm.mesh = _box(Vector3(ancho - ARC_PILA * 0.2, 1.5, 1.5))
	dm.instance_count = ARC_N
	for i in ARC_N:
		var cx2: float = -44.0 + ancho *(float(i) + 0.5)
		_mm_pon(dm, i, Transform3D(Basis(),
			Vector3(cx2, y0 + ARC_H - 0.4, z)))
	var dmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	dmi.multimesh = dm
	dmi.material_override = piedra
	dmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(dmi)


	var corn: MeshInstance3D = MeshInstance3D.new()
	corn.mesh = _box(Vector3(90.0, 1.2, 2.2))
	corn.material_override = piedra
	corn.position = Vector3(0.0, y0 + ARC_H + 1.0, z)
	corn.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(corn)



















const OLA_ALTA: float = 15.0
const OLA_BAJA: float = 1.5
const OLA_BANDAS: int = 4
func _build_glass_wave() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("ola", false)):
		return
	var top: Vector2 = _slope_top()
	var deep: float = - top.y
	var half_x: float = SIDE_STAND_X + deep + 1.5
	var zn: float = -16.0 - deep - 1.5
	var zf: float = FIELD_DEPTH + 16.0 + deep + 1.5
	var base_y: float = top.x + ROOF_RISE - 2.5
	var noche: bool = bool(weather.get("floodlights", false)) or _big_night
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)
	var vidrio: StandardMaterial3D = StandardMaterial3D.new()
	vidrio.albedo_color = Color(0.62, 0.72, 0.8, 0.55)
	vidrio.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	vidrio.roughness = 0.15
	vidrio.metallic = 0.25
	if noche:
		vidrio.emission_enabled = true
		vidrio.emission = Color("cfe4ff")
		vidrio.emission_energy_multiplier = 0.3
	var marco: StandardMaterial3D = StandardMaterial3D.new()
	marco.albedo_color = Color("aeb6be")
	marco.roughness = 0.45
	marco.metallic = 0.5
	var segs: Array = _rect_ring_segs(half_x, zn, zf, SKIN_R, 6)



	var alturas: Array[float] = []
	for sg in segs:
		var t: float = clampf((float(sg["z"]) - zn) /(zf - zn), 0.0, 1.0)
		alturas.append(lerpf(OLA_ALTA, OLA_BAJA, 0.5 - cos(t * PI) * 0.5))



	var pxf: Array[Transform3D] = []
	var mxf: Array[Transform3D] = []
	for i in segs.size():
		var sg2: Dictionary = segs[i]
		var h: float = alturas[i]
		var paso: float = h / float(OLA_BANDAS)
		var b: Basis = Basis(Vector3.UP, deg_to_rad(float(sg2["yaw"]))) \
				.scaled_local(Vector3(float(sg2["len"]), 1.0, 1.0))
		for k in OLA_BANDAS:
			pxf.append(Transform3D(b.scaled_local(Vector3(1.0, paso * 0.94, 1.0)),
				Vector3(float(sg2["x"]), base_y +(float(k) + 0.5) * paso,
					float(sg2["z"]))))

		mxf.append(Transform3D(b, Vector3(float(sg2["x"]), base_y + h,
			float(sg2["z"]))))
	var pm: MultiMesh = MultiMesh.new()
	pm.transform_format = MultiMesh.TRANSFORM_3D
	pm.mesh = _box(Vector3(1.0, 1.0, 0.35))
	pm.instance_count = pxf.size()
	for i in pxf.size():
		_mm_pon(pm, i, pxf[i])
	var pmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	pmi.multimesh = pm
	pmi.material_override = vidrio
	pmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(pmi)















	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = _box(Vector3(1.0, 0.55, 0.8))
	mm.instance_count = mxf.size()
	for i in mxf.size():
		_mm_pon(mm, i, mxf[i])
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = marco
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mmi)


















const GATE_HALF: float = 15.0
const GATE_W: float = 7.4
const GATE_RISE: float = 15.0
func _build_monumental_gate() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("puerta", false)):
		return
	var near: Vector2 = _slope_top(_prom_scale("low"))
	var deep: float = - near.y
	var alto: float = near.x + ROOF_RISE + GATE_RISE


	var z: float = -16.0 + near.y - GATE_W * 0.5 - 1.0
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)
	var piedra: StandardMaterial3D = StandardMaterial3D.new()
	piedra.albedo_color = Color("d5cdba")
	piedra.roughness = 0.94
	if bool(weather.get("floodlights", false)) or _big_night:
		piedra.emission_enabled = true
		piedra.emission = Color("ffeccc")
		piedra.emission_energy_multiplier = 0.16

	for sx in [-1.0, 1.0]:
		var torre: MeshInstance3D = MeshInstance3D.new()
		torre.mesh = _box(Vector3(GATE_W, alto, GATE_W))
		torre.material_override = piedra
		torre.position = Vector3(sx *(GATE_HALF + GATE_W * 0.5), alto * 0.5, z)
		root.add_child(torre)


		var corn: MeshInstance3D = MeshInstance3D.new()
		corn.mesh = _box(Vector3(GATE_W + 1.2, 1.1, GATE_W + 1.2))
		corn.material_override = piedra
		corn.position = Vector3(sx *(GATE_HALF + GATE_W * 0.5), alto - 0.55, z)
		corn.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(corn)




	var dintel: MeshInstance3D = MeshInstance3D.new()
	dintel.mesh = _box(Vector3(GATE_HALF * 2.0 + GATE_W, 3.2, GATE_W * 0.72))
	dintel.material_override = piedra
	dintel.position = Vector3(0.0, alto - 3.4, z)
	root.add_child(dintel)



	var atico: MeshInstance3D = MeshInstance3D.new()
	atico.mesh = _box(Vector3(GATE_HALF * 0.9, 2.4, GATE_W * 0.6))
	atico.material_override = piedra
	atico.position = Vector3(0.0, alto - 0.6, z)
	atico.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(atico)





















const CAL_BANDS: int = 13
const CAL_RISE: float = 16.0
const CAL_BULGE: float = 3.4
const CAL_TONOS: Array[Color] = [Color("a8703c"), Color("8a4f2c"),
	Color("c08a4e"), Color("5d3a25")]
func _build_calabash() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("calabaza", false)):
		return
	var top: Vector2 = _slope_top()
	var deep: float = - top.y
	var half_x: float = SIDE_STAND_X + deep + 1.5
	var zn: float = -16.0 - deep - 1.5
	var zf: float = FIELD_DEPTH + 16.0 + deep + 1.5
	var base_y: float = top.x + ROOF_RISE - 4.0
	var paso: float = CAL_RISE / float(CAL_BANDS)
	var noche: bool = bool(weather.get("floodlights", false)) or _big_night





	var fondo_mat: StandardMaterial3D = StandardMaterial3D.new()
	fondo_mat.albedo_color = Color("8a5a34")
	fondo_mat.roughness = 0.98
	if noche:
		fondo_mat.emission_enabled = true
		fondo_mat.emission = Color("ff9a4a")
		fondo_mat.emission_energy_multiplier = 0.1
	var fondo_segs: Array = _rect_ring_segs(half_x + CAL_BULGE * 0.5,
		zn - CAL_BULGE * 0.5, zf + CAL_BULGE * 0.5, SKIN_R, 5)
	var fm2: MultiMesh = MultiMesh.new()
	fm2.transform_format = MultiMesh.TRANSFORM_3D
	fm2.mesh = _box(Vector3(1.0, CAL_RISE + 2.0, 0.3))
	fm2.instance_count = fondo_segs.size()
	for i in fondo_segs.size():
		var fs: Dictionary = fondo_segs[i]
		var fb: Basis = Basis(Vector3.UP, deg_to_rad(float(fs["yaw"]))) \
				.scaled_local(Vector3(float(fs["len"]), 1.0, 1.0))
		_mm_pon(fm2, i, Transform3D(fb,
			Vector3(float(fs["x"]), base_y + CAL_RISE * 0.5, float(fs["z"]))))
	var fmi2: MultiMeshInstance3D = MultiMeshInstance3D.new()
	fmi2.multimesh = fm2
	fmi2.material_override = fondo_mat
	fmi2.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bowl_root().add_child(fmi2)



	var xf: Array = [[], [], [], []]
	for b in CAL_BANDS:
		var t: float = float(b) / float(CAL_BANDS - 1)


		var panza: float = sin(t * PI) * CAL_BULGE
		var y: float = base_y +(float(b) + 0.5) * paso
		var segs: Array = _rect_ring_segs(half_x + panza, zn - panza, zf + panza,
			SKIN_R, 5)
		for i in segs.size():
			var sg: Dictionary = segs[i]



			if posmod(b * 31 + i * 7, 9) == 0:
				continue
			var basis: Basis = Basis(Vector3.UP, deg_to_rad(float(sg["yaw"]))) \
					.scaled_local(Vector3(float(sg["len"]), 1.0, 1.0))
			var tono: int = posmod(b * 17 + i * 5, CAL_TONOS.size())
			(xf[tono] as Array).append(Transform3D(basis,
				Vector3(float(sg["x"]), y, float(sg["z"]))))
	for k in CAL_TONOS.size():
		var lista: Array = xf[k]
		if lista.is_empty():
			continue
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = CAL_TONOS[k]
		mat.roughness = 0.98
		if noche:
			mat.emission_enabled = true
			mat.emission = Color("ffb26b")
			mat.emission_energy_multiplier = 0.16
		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = _box(Vector3(1.0, paso * 1.02, 0.55))
		mm.instance_count = lista.size()
		for i in lista.size():
			_mm_pon(mm, i, lista[i])
		var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		mmi.multimesh = mm
		mmi.material_override = mat


		mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		_bowl_root().add_child(mmi)























const TW_N: int = 4



const TW_R: float = 4.6
const TW_TURNS: float = 2.6
const TW_STEPS: int = 48
const GIRDER_N: int = 5
const GIRDER_OUT: float = 9.0
const TRUSS_H: float = 1.9
const TRUSS_STEP: float = 6.5
const TRUSS_W: float = 0.85
func _build_spiral_towers() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("torres_rampa", false)):
		return


	var top: Vector2 = _slope_top()
	var corona: float = top.x


	var techo_y: float = corona + ROOF_RISE + 0.9
























	var alto: float = corona + ROOF_RISE - ROOF_DROP - 0.75


























	var curva: float = minf(20.0, minf(SIDE_STAND_X - 1.0,
		((FIELD_DEPTH + 16.0) -(-16.0)) * 0.5 - 1.0))
	var cx: float = SIDE_STAND_X - curva
	var czn: float = -16.0 + curva
	var czf: float = FIELD_DEPTH + 16.0 - curva























	var fuera: float = 6.0
	var bis: float =(curva + fuera) * sqrt(0.5)






	var sitios: Array[Vector3] = [
		Vector3(- cx - bis, 0.0, czn - bis), Vector3(cx + bis, 0.0, czn - bis),
		Vector3(- cx - bis, 0.0, czf + bis), Vector3(cx + bis, 0.0, czf + bis),
	]
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)
	var hormigon: StandardMaterial3D = StandardMaterial3D.new()
	hormigon.albedo_color = Color("c9c4b8")
	hormigon.roughness = 0.92

	var fm: MultiMesh = MultiMesh.new()
	fm.transform_format = MultiMesh.TRANSFORM_3D
	var cil: CylinderMesh = CylinderMesh.new()
	cil.top_radius = TW_R
	cil.bottom_radius = TW_R
	cil.height = alto
	cil.radial_segments = 12
	fm.mesh = cil
	fm.instance_count = sitios.size()
	for i in sitios.size():
		_mm_pon(fm, i, Transform3D(Basis(),
			sitios[i] + Vector3(0.0, alto * 0.5, 0.0)))
	var fmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	fmi.multimesh = fm
	fmi.material_override = hormigon
	fmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(fmi)








	var tapa_mat: StandardMaterial3D = StandardMaterial3D.new()
	tapa_mat.albedo_color = Color("0d1018") if _big_night else Color("23262e")
	tapa_mat.roughness = 0.9
	var tapa: CylinderMesh = CylinderMesh.new()
	tapa.top_radius = TW_R + 2.6
	tapa.bottom_radius = TW_R + 2.6
	tapa.height = 0.7
	tapa.radial_segments = 12
	var tm2: MultiMesh = MultiMesh.new()
	tm2.transform_format = MultiMesh.TRANSFORM_3D
	tm2.mesh = tapa
	tm2.instance_count = sitios.size()
	for i in sitios.size():
		_mm_pon(tm2, i, Transform3D(Basis(),
			sitios[i] + Vector3(0.0, alto + 0.35, 0.0)))
	var tmi2: MultiMeshInstance3D = MultiMeshInstance3D.new()
	tmi2.multimesh = tm2
	tmi2.material_override = tapa_mat
	tmi2.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(tmi2)










	var claro: StandardMaterial3D = StandardMaterial3D.new()
	claro.albedo_color = Color("cdc7ba")
	claro.roughness = 0.9
	var cornisa: CylinderMesh = CylinderMesh.new()
	cornisa.top_radius = TW_R + 1.5
	cornisa.bottom_radius = TW_R + 1.1
	cornisa.height = 0.9
	cornisa.radial_segments = 12
	var cm3: MultiMesh = MultiMesh.new()
	cm3.transform_format = MultiMesh.TRANSFORM_3D
	cm3.mesh = cornisa
	cm3.instance_count = sitios.size()
	for i in sitios.size():
		_mm_pon(cm3, i, Transform3D(Basis(),
			sitios[i] + Vector3(0.0, alto - 2.6, 0.0)))
	var cmi3: MultiMeshInstance3D = MultiMeshInstance3D.new()
	cmi3.multimesh = cm3
	cmi3.material_override = hormigon
	cmi3.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bowl_root().add_child(cmi3)


	var mnt: Array[Transform3D] = []
	for pie3 in sitios:
		for k3 in 8:
			var a3: float = TAU * float(k3) / 8.0
			mnt.append(Transform3D(Basis(Vector3.UP, - a3),
				pie3 + Vector3(cos(a3) *(TW_R + 0.5), alto - 1.1,
					sin(a3) *(TW_R + 0.5))))
	var mm3: MultiMesh = MultiMesh.new()
	mm3.transform_format = MultiMesh.TRANSFORM_3D
	mm3.mesh = _box(Vector3(0.55, 2.2, 0.55))
	mm3.instance_count = mnt.size()
	for i in mnt.size():
		_mm_pon(mm3, i, mnt[i])
	var mmi3: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi3.multimesh = mm3
	mmi3.material_override = claro
	mmi3.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bowl_root().add_child(mmi3)



	var des: CylinderMesh = CylinderMesh.new()
	des.top_radius = TW_R + 2.0
	des.bottom_radius = TW_R + 2.0
	des.height = 0.5
	des.radial_segments = 12
	var dm3: MultiMesh = MultiMesh.new()
	dm3.transform_format = MultiMesh.TRANSFORM_3D
	dm3.mesh = des
	dm3.instance_count = sitios.size()
	for i in sitios.size():
		_mm_pon(dm3, i, Transform3D(Basis(),
			sitios[i] + Vector3(0.0, alto - 3.6, 0.0)))
	var dmi3: MultiMeshInstance3D = MultiMeshInstance3D.new()
	dmi3.multimesh = dm3
	dmi3.material_override = claro
	dmi3.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bowl_root().add_child(dmi3)





	var pm2: MultiMesh = MultiMesh.new()
	pm2.transform_format = MultiMesh.TRANSFORM_3D
	pm2.mesh = _box(Vector3(TW_R * 2.4, 0.6, 1.0))
	pm2.instance_count = sitios.size()
	for i in sitios.size():
		var pie2: Vector2 = Vector2(sitios[i].x, sitios[i].z)


		var hacia2: Vector2 =(Vector2(0.0, HALF_LINE) - pie2).normalized()
		var fin2: Vector2 = pie2 + hacia2 *(fuera + TW_R)
		var mid2: Vector2 =(pie2 + fin2) * 0.5
		var b2: Basis = Basis(Vector3.UP, atan2(hacia2.x, hacia2.y)) \
				.scaled_local(Vector3(1.0, 1.0,(fin2 - pie2).length()))
		_mm_pon(pm2, i, Transform3D(b2,
			Vector3(mid2.x, alto + 0.35, mid2.y)))
	var pmi2: MultiMeshInstance3D = MultiMeshInstance3D.new()
	pmi2.multimesh = pm2
	pmi2.material_override = tapa_mat
	pmi2.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(pmi2)










	var rampa: StandardMaterial3D = StandardMaterial3D.new()
	rampa.albedo_color = Color("b3ada0")
	rampa.roughness = 0.95
	var pretil: StandardMaterial3D = StandardMaterial3D.new()
	pretil.albedo_color = Color("cdc7ba")
	pretil.roughness = 0.9
	var rr: float = TW_R + 1.6
	var xf: Array[Transform3D] = []
	var pxf: Array[Transform3D] = []
	var txf: Array[Transform3D] = []
	for pie in sitios:
		for k in TW_STEPS:
			var t0: float = float(k) / float(TW_STEPS)
			var t1: float = float(k + 1) / float(TW_STEPS)
			var a0: float = t0 * TW_TURNS * TAU
			var a1: float = t1 * TW_TURNS * TAU
			var p0: Vector3 = pie + Vector3(cos(a0) * rr, alto * t0, sin(a0) * rr)
			var p1: Vector3 = pie + Vector3(cos(a1) * rr, alto * t1, sin(a1) * rr)






			xf.append(_tube_xf(p0, p1))


			var q0: Vector3 = pie + Vector3(cos(a0) *(rr + 0.95),
				alto * t0 + 0.75, sin(a0) *(rr + 0.95))
			var q1: Vector3 = pie + Vector3(cos(a1) *(rr + 0.95),
				alto * t1 + 0.75, sin(a1) *(rr + 0.95))
			pxf.append(_tube_xf(q0, q1))



			if k % 4 == 0:
				txf.append(_tube_xf(p0, pie + Vector3(cos(a0) * TW_R * 0.9,
					alto * t0 + 2.4, sin(a0) * TW_R * 0.9)))
	var rm: MultiMesh = MultiMesh.new()
	rm.transform_format = MultiMesh.TRANSFORM_3D


	rm.mesh = _box(Vector3(3.0, 1.0, 0.45))
	rm.instance_count = xf.size()
	for i in xf.size():
		_mm_pon(rm, i, xf[i])
	var rmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	rmi.multimesh = rm
	rmi.material_override = rampa
	rmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(rmi)
	var pm: MultiMesh = MultiMesh.new()
	pm.transform_format = MultiMesh.TRANSFORM_3D
	pm.mesh = _box(Vector3(0.35, 1.0, 1.5))
	pm.instance_count = pxf.size()
	for i in pxf.size():
		_mm_pon(pm, i, pxf[i])
	var pmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	pmi.multimesh = pm
	pmi.material_override = pretil
	pmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(pmi)
	var tm: MultiMesh = MultiMesh.new()
	tm.transform_format = MultiMesh.TRANSFORM_3D
	tm.mesh = _box(Vector3(0.3, 1.0, 0.3))
	tm.instance_count = txf.size()
	for i in txf.size():
		_mm_pon(tm, i, txf[i])
	var tmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	tmi.multimesh = tm
	tmi.material_override = pretil
	tmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(tmi)























	var rojo: StandardMaterial3D = StandardMaterial3D.new()
	rojo.albedo_color = Color("a8261f")
	rojo.roughness = 0.5





	var segs3: Array = _rect_ring_segs(SIDE_STAND_X + 2.0, -18.0,
		FIELD_DEPTH + 18.0, SKIN_R, 5)

	var am: MultiMesh = MultiMesh.new()
	am.transform_format = MultiMesh.TRANSFORM_3D
	am.mesh = _box(Vector3(1.0, 0.55, 0.85))
	am.instance_count = segs3.size() * 2
	for i in segs3.size():
		var sg3: Dictionary = segs3[i]
		var b3: Basis = Basis(Vector3.UP, deg_to_rad(float(sg3["yaw"]))) \
				.scaled_local(Vector3(float(sg3["len"]), 1.0, 1.0))
		for k in 2:
			_mm_pon(am, i * 2 + k, Transform3D(b3,
				Vector3(float(sg3["x"]), techo_y +(0.0 if k == 0 else TRUSS_H),
					float(sg3["z"]))))
	var ami: MultiMeshInstance3D = MultiMeshInstance3D.new()
	ami.multimesh = am
	ami.material_override = rojo
	ami.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(ami)


	var diag_xf: Array[Transform3D] = []
	for sg4 in segs3:
		var largo4: float = float(sg4["len"])
		var yaw4: float = deg_to_rad(float(sg4["yaw"]))
		var dir4: Vector3 = Vector3(cos(yaw4), 0.0, - sin(yaw4))
		var base4: Vector3 = Vector3(float(sg4["x"]), techo_y, float(sg4["z"]))
		var n4: int = maxi(int(largo4 / TRUSS_STEP), 1)
		for j in n4:
			var t0: float = float(j) / float(n4) - 0.5
			var t1: float = float(j + 1) / float(n4) - 0.5
			var a4: Vector3 = base4 + dir4 *(t0 * largo4) \
					+ Vector3(0.0, 0.0 if j % 2 == 0 else TRUSS_H, 0.0)
			var b4: Vector3 = base4 + dir4 *(t1 * largo4) \
					+ Vector3(0.0, TRUSS_H if j % 2 == 0 else 0.0, 0.0)
			diag_xf.append(_tube_xf(a4, b4))
	var dm: MultiMesh = MultiMesh.new()
	dm.transform_format = MultiMesh.TRANSFORM_3D
	dm.mesh = _box(Vector3(0.34, 1.0, 0.34))
	dm.instance_count = diag_xf.size()
	for i in diag_xf.size():
		_mm_pon(dm, i, diag_xf[i])
	var dmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	dmi.multimesh = dm
	dmi.material_override = rojo
	dmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(dmi)




	var z_atras: float = -18.0
	var z_frente: float = -16.0 + GIRDER_OUT
	var y_frente: float = corona + ROOF_RISE - ROOF_DROP







	var vol_xf: Array[Transform3D] = []
	var prev_alto: Vector3 = Vector3.ZERO
	for i in GIRDER_N:
		var px: float = lerpf(-42.0, 42.0, float(i) / float(GIRDER_N - 1))
		var a5: Vector3 = Vector3(px, techo_y, z_atras)
		var b5: Vector3 = Vector3(px, y_frente, z_frente)
		var sep: Vector3 = Vector3(TRUSS_W, 0.0, 0.0)
		var sube: Vector3 = Vector3(0.0, TRUSS_H, 0.0)
		vol_xf.append(_tube_xf(a5 - sep, b5 - sep))
		vol_xf.append(_tube_xf(a5 + sep, b5 + sep))
		vol_xf.append(_tube_xf(a5 + sube, b5 + sube))
		for j in 6:
			var t5: float = float(j) / 6.0
			var t6: float = float(j + 1) / 6.0
			var lado: Vector3 = sep if j % 2 == 0 else - sep
			vol_xf.append(_tube_xf(a5.lerp(b5, t5) + lado,
				a5.lerp(b5, t6) + sube))



		if i > 0:
			vol_xf.append(_tube_xf(prev_alto, b5 + sube))
			vol_xf.append(_tube_xf(a5 + sube,
				prev_alto +(b5 - a5) - Vector3(0.0, 0.0, 0.0)))
		prev_alto = a5 + sube
	var vm: MultiMesh = MultiMesh.new()
	vm.transform_format = MultiMesh.TRANSFORM_3D
	vm.mesh = _box(Vector3(0.5, 1.0, 0.5))
	vm.instance_count = vol_xf.size()
	for i in vol_xf.size():
		_mm_pon(vm, i, vol_xf[i])
	var vmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	vmi.multimesh = vm
	vmi.material_override = rojo
	vmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(vmi)



	for k2 in 2:
		var tr: MeshInstance3D = MeshInstance3D.new()
		tr.mesh = _box(Vector3(86.0, 0.55, 0.85))
		tr.material_override = rojo
		tr.position = Vector3(0.0, y_frente +(0.0 if k2 == 0 else TRUSS_H), z_frente)
		tr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(tr)












func _rect_ring_segs(half_x: float, zn: float, zf: float, r: float,
		per_corner: int) -> Array:
	var rr: float = minf(r, minf(half_x - 1.0,(zf - zn) * 0.5 - 1.0))
	var out: Array = []
	var lado: float =(zf - rr) -(zn + rr)
	var punta: float = 2.0 *(half_x - rr)
	var mid_z: float =(zn + zf) * 0.5
	out.append({"x": - half_x, "z": mid_z, "len": lado * 1.04, "yaw": 90.0})
	out.append({"x": half_x, "z": mid_z, "len": lado * 1.04, "yaw": 90.0})
	out.append({"x": 0.0, "z": zn, "len": punta * 1.04, "yaw": 0.0})
	out.append({"x": 0.0, "z": zf, "len": punta * 1.04, "yaw": 0.0})
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			var c: Vector2 = Vector2(sx *(half_x - rr),
				(zn + rr) if sz < 0.0 else (zf - rr))
			var a0: float = 180.0 if sx < 0.0 else 0.0
			var a1: float = a0 +(90.0 if sx * sz > 0.0 else -90.0)
			for i in per_corner:
				var p0: Vector2 = c + Vector2.from_angle(
					deg_to_rad(lerpf(a0, a1, float(i) / float(per_corner)))) * rr
				var p1: Vector2 = c + Vector2.from_angle(
					deg_to_rad(lerpf(a0, a1, float(i + 1) / float(per_corner)))) * rr
				var pm: Vector2 =(p0 + p1) * 0.5
				var d: Vector2 = p1 - p0
				out.append({"x": pm.x, "z": pm.y, "len": d.length() * 1.06,
					"yaw": rad_to_deg(- atan2(d.y, d.x))})
	return out







func _build_clock_tower() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("torre", false)):
		return
	var root: Node3D = Node3D.new()
	root.position = Vector3(9.0, 0.0, -33.0)
	_bowl_root().add_child(root)
	var brick: StandardMaterial3D = StandardMaterial3D.new()
	brick.albedo_color = Color("8a4a38")
	brick.roughness = 1.0
	var body: MeshInstance3D = MeshInstance3D.new()
	var bb: BoxMesh = BoxMesh.new()
	bb.size = Vector3(6.2, 19.0, 6.2)
	body.mesh = bb
	body.material_override = brick
	body.position = Vector3(0.0, 9.5, 0.0)
	root.add_child(body)
	var cornice: MeshInstance3D = MeshInstance3D.new()
	var cb: BoxMesh = BoxMesh.new()
	cb.size = Vector3(7.4, 1.1, 7.4)
	cornice.mesh = cb
	var stone: StandardMaterial3D = StandardMaterial3D.new()
	stone.albedo_color = Color("cfc7b4")
	stone.roughness = 1.0
	cornice.material_override = stone
	cornice.position = Vector3(0.0, 19.4, 0.0)
	cornice.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(cornice)
	var roof_m: MeshInstance3D = MeshInstance3D.new()
	var pr: PrismMesh = PrismMesh.new()
	pr.size = Vector3(7.0, 3.0, 7.0)
	roof_m.mesh = pr
	var slate: StandardMaterial3D = StandardMaterial3D.new()
	slate.albedo_color = Color("3a4048")
	slate.roughness = 1.0
	roof_m.material_override = slate
	roof_m.position = Vector3(0.0, 21.4, 0.0)
	roof_m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(roof_m)

	var face: MeshInstance3D = MeshInstance3D.new()
	var disc: CylinderMesh = CylinderMesh.new()
	disc.top_radius = 1.9
	disc.bottom_radius = 1.9
	disc.height = 0.24
	face.mesh = disc
	var face_mat: StandardMaterial3D = StandardMaterial3D.new()
	face_mat.albedo_color = Color("e6e2d8")
	face_mat.roughness = 0.9
	face.material_override = face_mat
	face.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	face.position = Vector3(0.0, 15.6, 3.22)
	face.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(face)
	var ink: StandardMaterial3D = StandardMaterial3D.new()
	ink.albedo_color = Color("1a1c1f")
	ink.roughness = 1.0
	for i in 12:
		var a: float = TAU * float(i) / 12.0
		var tick: MeshInstance3D = MeshInstance3D.new()
		var tm: BoxMesh = BoxMesh.new()
		tm.size = Vector3(0.12, 0.32, 0.06)
		tick.mesh = tm
		tick.material_override = ink
		tick.position = Vector3(sin(a) * 1.55, 15.6 + cos(a) * 1.55, 3.4)
		tick.rotation_degrees = Vector3(0.0, 0.0, - rad_to_deg(a))
		tick.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(tick)

	for hand in [[120.0 + 5.0, 0.95, 0.16], [60.0, 1.35, 0.11]]:
		var piv: Node3D = Node3D.new()
		piv.position = Vector3(0.0, 15.6, 3.42)
		piv.rotation_degrees = Vector3(0.0, 0.0, - float(hand[0]))
		root.add_child(piv)
		var bar: MeshInstance3D = MeshInstance3D.new()
		var hm: BoxMesh = BoxMesh.new()
		hm.size = Vector3(float(hand[2]), float(hand[1]), 0.06)
		bar.mesh = hm
		bar.material_override = ink
		bar.position = Vector3(0.0, float(hand[1]) * 0.5, 0.0)
		bar.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		piv.add_child(bar)






func _build_end_cars() -> void:
	if _end_fill() != "cars":
		return
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(_pitch_seed_club()) + 77
	var root: Node3D = Node3D.new()


	root.position = Vector3(0.0, 0.55, -12.3)
	_bowl_root().add_child(root)
	var tierra: StandardMaterial3D = StandardMaterial3D.new()
	tierra.albedo_color = GRASS_DRY.lerp(GRASS_DULL, 0.5)
	tierra.roughness = 1.0
	var loma: MeshInstance3D = MeshInstance3D.new()
	var lb: BoxMesh = BoxMesh.new()


	lb.size = Vector3(36.0 if _obra_sitio else 72.0, 0.55, 7.0)
	loma.mesh = lb
	loma.material_override = tierra
	loma.position = Vector3(-18.0 if _obra_sitio else 0.0, -0.28, 0.0)
	loma.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(loma)
	var paleta: Array = ["7e8891", "8f4038", "3f5a78", "b8b2a4", "4a4f45",
		"96742f", "5b6d80", "70483f"]
	var autos: Array[Dictionary] = []
	for i in 9:
		var car: Node3D = Node3D.new()
		car.position = Vector3(lerpf(-33.0, 33.0, float(i) / 8.0)
			+ rng.randf_range(-0.7, 0.7), 0.0, rng.randf_range(-1.2, 1.2))


		if _obra_sitio and car.position.x > -3.0:
			car.free()
			continue
		car.rotation_degrees = Vector3(0.0, rng.randf_range(-9.0, 9.0), 0.0)
		root.add_child(car)


		autos.append({"transform": car.transform, "variante": i % 3,
			"color": Color(String(paleta[rng.randi() % paleta.size()]))})
	preload("res://features/stadium/stadium_cars.gd").crear(root, autos, "AutosFondo")






func _build_factory() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("fabrica", false)):
		return
	var root: Node3D = Node3D.new()
	root.position = Vector3(-6.0, 0.0, -40.0)
	_bowl_root().add_child(root)
	var brick: StandardMaterial3D = StandardMaterial3D.new()
	brick.albedo_color = Color("7e463a")
	brick.roughness = 1.0
	var nave: MeshInstance3D = MeshInstance3D.new()
	var nb: BoxMesh = BoxMesh.new()


	nb.size = Vector3(46.0, 13.0, 13.0)
	nave.mesh = nb
	nave.material_override = brick
	nave.position = Vector3(0.0, 6.5, 0.0)
	root.add_child(nave)
	var slate: StandardMaterial3D = StandardMaterial3D.new()
	slate.albedo_color = Color("46403c")
	slate.roughness = 1.0
	for i in 4:
		var tooth: MeshInstance3D = MeshInstance3D.new()
		var tp: PrismMesh = PrismMesh.new()
		tp.size = Vector3(10.4, 3.2, 13.0)
		tooth.mesh = tp
		tooth.material_override = slate
		tooth.position = Vector3(lerpf(-17.0, 17.0, float(i) / 3.0), 12.1, 0.0)
		tooth.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(tooth)
	var chim_brick: StandardMaterial3D = StandardMaterial3D.new()
	chim_brick.albedo_color = Color("6a382e")
	chim_brick.roughness = 1.0
	var alturas: Array = [24.0, 27.0, 21.0]
	var xs: Array = [-15.0, -3.0, 13.0]
	for i in 3:
		var chim: MeshInstance3D = MeshInstance3D.new()
		var cyl: CylinderMesh = CylinderMesh.new()
		cyl.top_radius = 0.95
		cyl.bottom_radius = 1.35
		cyl.height = float(alturas[i])
		chim.mesh = cyl
		chim.material_override = chim_brick
		chim.position = Vector3(float(xs[i]), float(alturas[i]) * 0.5, -3.4)
		root.add_child(chim)














const BANK_DEG: float = 58.0
const BANK_LEN: float = 13.0
const BANK_HALF_W: float = 47.0
const BANK_FOOT_Z: float = -8.6
const BANK_ROWS: int = 5
func _build_end_bank() -> void:
	if _end_fill() != "bank":
		return
	var rad: float = deg_to_rad(BANK_DEG)
	var rise: float = cos(rad)
	var run: float = sin(rad)
	var root: Node3D = Node3D.new()
	root.position = Vector3(0.0, 0.0, BANK_FOOT_Z)
	_bowl_root().add_child(root)




	var earth: StandardMaterial3D = StandardMaterial3D.new()
	earth.albedo_color = GRASS_DRY.lerp(GRASS_DULL, 0.45)
	earth.roughness = 1.0
	var ramp: MeshInstance3D = MeshInstance3D.new()
	var quad: QuadMesh = QuadMesh.new()


	var medio: bool = _obra_sitio
	quad.size = Vector2(BANK_HALF_W *(1.0 if medio else 2.0), BANK_LEN)
	ramp.mesh = quad
	ramp.material_override = earth
	ramp.position = Vector3(- BANK_HALF_W * 0.5 if medio else 0.0, rise * BANK_LEN * 0.5,
		- run * BANK_LEN * 0.5)
	ramp.rotation_degrees = Vector3(- BANK_DEG, 0.0, 0.0)
	root.add_child(ramp)



	var mud: StandardMaterial3D = StandardMaterial3D.new()
	mud.albedo_color = GRASS_MUD
	mud.roughness = 1.0
	for i in 4:
		var px: float = lerpf(- BANK_HALF_W * 0.72, BANK_HALF_W * 0.72, float(i) / 3.0)
		if medio and px > 0.0:
			continue
		var path: MeshInstance3D = MeshInstance3D.new()
		var pq: QuadMesh = QuadMesh.new()
		pq.size = Vector2(2.1, BANK_LEN)
		path.mesh = pq
		path.material_override = mud
		path.position = Vector3(px, ramp.position.y + 0.03, ramp.position.z + 0.02)
		path.rotation_degrees = ramp.rotation_degrees
		path.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(path)







	var crest_rng: RandomNumberGenerator = RandomNumberGenerator.new()
	crest_rng.seed = 7712
	var trozos: int = 13
	var tw: float = BANK_HALF_W * 2.0 / float(trozos)
	for i in trozos:

		if medio and - BANK_HALF_W + tw *(float(i) + 0.5) > 0.0:
			continue
		var crest: MeshInstance3D = MeshInstance3D.new()
		var ch: float = crest_rng.randf_range(0.55, 1.5)


		crest.mesh = _box(Vector3(tw * 1.12, ch, crest_rng.randf_range(2.1, 3.2)))
		crest.material_override = earth
		crest.position = Vector3(
			- BANK_HALF_W + tw *(float(i) + 0.5),
			rise * BANK_LEN - 0.3 +(ch - 1.1) * 0.5,
			- run * BANK_LEN - 1.0 + crest_rng.randf_range(-0.5, 0.5))
		root.add_child(crest)




	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 5501
	var gente: Array = []
	for r in BANK_ROWS:


		var f: float = lerpf(0.1, 0.88, float(r) / float(BANK_ROWS - 1))
		var y: float = rise * BANK_LEN * f
		var z: float = - run * BANK_LEN * f
		var paso: float = 1.35
		var x: float = - BANK_HALF_W + paso * 0.5
		while x <(-0.8 if medio else BANK_HALF_W):


			if rng.randf() < _att * lerpf(0.85, 0.45, f):
				gente.append(Transform3D(Basis.IDENTITY, Vector3(
					x + rng.randf_range(-0.35, 0.35),
					y + FAN_STAND_Y,
					z + rng.randf_range(-0.4, 0.4))))
			x += paso
	if gente.is_empty():
		return
	var por_pose: Array = [[], [], []]
	for i in gente.size():
		por_pose[i % 3].append(gente[i])
	for pose in 3:
		if por_pose[pose].is_empty():
			continue
		_add_static_fans(root, por_pose[pose], true, _host_stand_is_yours(),
			pose, 0, 1.0, 1.0)








func _build_scaffold_legs() -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("scaffold", false)):
		return
	var tube: StandardMaterial3D = StandardMaterial3D.new()
	tube.albedo_color = Color("8b8f96")
	tube.roughness = 0.6


	var scale: float = _prom_scale("low")
	var top: Vector2 = _slope_top(scale)
	var z_back: float = -16.0 + top.y
	var z_front: float = -16.0 + STAND_SLOPE_FOOT_Z
	var xf: Array = []
	for mx in SCAFFOLD_X:
		var x0: float = float(mx) - SCAFFOLD_LEN * 0.5
		var bays: int = 6
		var bw: float = SCAFFOLD_LEN / float(bays)
		for i in bays + 1:
			var x: float = x0 + bw * float(i)


			xf.append(_tube_xf(Vector3(x, 0.0, z_back), Vector3(x, top.x, z_back)))

			xf.append(_tube_xf(Vector3(x, 0.0, z_front),
				Vector3(x, STAND_SLOPE_FOOT_Y, z_front)))
			if i == bays:
				continue



			var xn: float = x + bw
			xf.append(_tube_xf(Vector3(x, top.x * 0.5, z_back),
				Vector3(xn, top.x * 0.5, z_back)))
			xf.append(_tube_xf(Vector3(x, 0.0, z_back), Vector3(xn, top.x, z_back)))


			xf.append(_tube_xf(Vector3(x, top.x, z_back),
				Vector3(x, STAND_SLOPE_FOOT_Y, z_front)))
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = _box(Vector3(0.16, 1.0, 0.16))
	mm.instance_count = xf.size()
	for i in xf.size():
		_mm_pon(mm, i, xf[i])
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = tube
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_bowl_root().add_child(mmi)



func _roof_white() -> bool:
	return bool(FOOTPRINT_CFG.get(footprint, {}).get("roof_white", false))




func _round_corners() -> Array:
	var fz: float = FIELD_DEPTH
	return [
		_st(-38.5, -18.5, 13.0, 22.0), _st(-41.5, -12.5, 13.0, 66.0),
		_st(38.5, -18.5, 13.0, -22.0), _st(41.5, -12.5, 13.0, -66.0),
		_st(-38.5, fz + 18.5, 13.0, 158.0), _st(-41.5, fz + 12.5, 13.0, 114.0),
		_st(38.5, fz + 18.5, 13.0, -158.0), _st(41.5, fz + 12.5, 13.0, -114.0),
	]





func _build_floodlights() -> void:
	if footprint == "azteca_coloso":


		var top_bajo: Vector2 = _slope_top(_prom_scale("low"))
		var alto: float = top_bajo.x * 2.0 + 6.6 + _slope_top().x + 2.3
		for lado in [-1.0, 1.0]:
			for fondo in [0.0, FIELD_DEPTH]:
				var foco: SpotLight3D = SpotLight3D.new()
				foco.position = Vector3(lado * 56.0, alto, fondo)
				foco.spot_range = 115.0
				foco.spot_angle = 58.0
				foco.light_energy = FLOOD_ENERGY
				foco.light_color = Color("eef2ff")
				foco.shadow_enabled = false
				foco.visible = false
				_bowl_root().add_child(foco)
				foco.look_at(Vector3(lado * 12.0, 0.0, lerpf(fondo, HALF_LINE, 0.65)))
				_spotlights.append(foco)
		return
	if footprint in ["bombonera", "monumental_river", "camp_nou"]:
		_focos_argentinos()
		return




	var mode: String = String(_stands_cfg().get("pylons", "full"))
	if mode == "none":
		return
	var modest: bool = mode == "modest"





	var rustic: bool = mode == "poles"

	var extra_h: float = 11.0
	if rustic:
		extra_h = 2.5
	elif modest:
		extra_h = 6.0
	var head_size: Vector3 = Vector3(3.4, 2.2, 0.6) if modest else Vector3(5.0, 3.2, 0.7)
	var pole_mat: StandardMaterial3D = StandardMaterial3D.new()
	pole_mat.albedo_color = Color("6b5334") if rustic else Color("6a7078")
	if rustic:


		pole_mat.roughness = 1.0
	var panel_mat: StandardMaterial3D = StandardMaterial3D.new()
	panel_mat.albedo_color = Color("dfe8f0")
	panel_mat.emission_enabled = true
	panel_mat.emission = Color(0.9, 0.92, 0.85)
	panel_mat.emission_energy_multiplier = 0.7
	_flood_panel_mat = panel_mat
	_flood_panel_copias.clear()




	var techo: Array[Vector3] = []
	if not rustic and SenaClub.focos_en_techo(self):
		techo = SenaClub.focos_techo(self, panel_mat)


	var tp: float = TRACK_PUSH if _track else 0.0


	var tpz: float =(TRACK_PUSH_Z + 3.0) if _track else 0.0
	for corner in [Vector3(-38.0 - tp, 0.0, -13.0 - tpz), Vector3(38.0 + tp, 0.0, -13.0 - tpz),
			Vector3(-38.0 - tp, 0.0, FIELD_DEPTH + 13.0 + tpz),
			Vector3(38.0 + tp, 0.0, FIELD_DEPTH + 13.0 + tpz)]:
		if not techo.is_empty():
			_foco_techo(corner, techo)
			continue
		var pole: MeshInstance3D = MeshInstance3D.new()
		var cyl: CylinderMesh = CylinderMesh.new()


		var pole_h: float = _slope_top().x + extra_h
		cyl.top_radius = 0.16 if rustic else 0.28
		cyl.bottom_radius = 0.22 if rustic else 0.45
		cyl.height = pole_h
		pole.mesh = cyl



		pole.material_override = pole_mat.duplicate()
		pole.position = corner + Vector3(0.0, pole_h * 0.5, 0.0)
		_bowl_root().add_child(pole)


		_register_occluder(pole)

		if rustic:
			SenaPueblo.poste(self, pole, pole_h)









		var panel_propio: StandardMaterial3D = panel_mat.duplicate()
		_flood_panel_copias.append(panel_propio)
		var head: Node3D
		if rustic:
			head = _rustic_head(panel_propio, pole_mat.duplicate())
		else:
			var hm: MeshInstance3D = MeshInstance3D.new()
			var head_mesh: BoxMesh = BoxMesh.new()
			head_mesh.size = head_size
			hm.mesh = head_mesh
			hm.material_override = panel_propio
			head = hm
		head.position = corner + Vector3(0.0, pole_h +(0.4 if rustic else 1.0), 0.0)









		_flood_heads.append(head.position)





		if not rustic:
			_moth_spots.append(head.position - Vector3(0.0, MOTH_DROP, 0.0))
		_bowl_root().add_child(head)


		var aim: Vector3 = Vector3(corner.x * 0.3, 1.0, lerpf(corner.z, HALF_LINE, 0.65))
		head.look_at(aim)
		_register_occluder(head)

		var spot: SpotLight3D = SpotLight3D.new()
		spot.spot_range = 85.0
		spot.spot_angle = 58.0
		spot.light_energy = FLOOD_ENERGY
		spot.light_color = Color("eef2ff")
		spot.shadow_enabled = false
		spot.visible = false
		head.add_child(spot)
		_spotlights.append(spot)












		if rustic:
			continue
		var shaft: MeshInstance3D = MeshInstance3D.new()
		shaft.mesh = _shaft_mesh()
		shaft.material_override = _shaft_material()


		shaft.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		shaft.visible = false






		shaft.set_meta("occ_fuera", true)
		head.add_child(shaft)
		_shafts.append(shaft)






func _foco_techo(corner: Vector3, puntos: Array[Vector3]) -> void:
	var p: Vector3 = puntos[0]
	for q in puntos:
		if Vector2(q.x - corner.x, q.z - corner.z).length() < Vector2(p.x - corner.x, p.z - corner.z).length():
			p = q
	var head: Node3D = Node3D.new()
	head.position = p
	_flood_heads.append(p)
	_moth_spots.append(p - Vector3(0.0, MOTH_DROP, 0.0))
	_bowl_root().add_child(head)


	head.name = "FocoTecho%d" % _flood_heads.size()
	head.look_at(_bowl_root().to_global(
		Vector3(corner.x * 0.3, 1.0, lerpf(corner.z, HALF_LINE, 0.65))))
	var spot: SpotLight3D = SpotLight3D.new()
	spot.spot_range = 95.0
	spot.spot_angle = 58.0
	spot.light_energy = FLOOD_ENERGY
	spot.light_color = Color("eef2ff")
	spot.shadow_enabled = false
	spot.visible = false
	head.add_child(spot)
	_spotlights.append(spot)
	var shaft: MeshInstance3D = MeshInstance3D.new()
	shaft.mesh = _shaft_mesh()
	shaft.material_override = _shaft_material()
	shaft.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	shaft.visible = false
	shaft.set_meta("occ_fuera", true)
	head.add_child(shaft)
	_shafts.append(shaft)





func _flood_emision(v: float) -> void:
	if _flood_panel_mat == null:
		return
	_flood_panel_mat.emission_energy_multiplier = v
	for m in _flood_panel_copias:
		m.emission_energy_multiplier = v



















func _build_moths() -> void:


	if is_instance_valid(_moth_mm):
		_moth_mm.queue_free()
		_moth_mm = null
	if _moth_spots.is_empty():
		return
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = Vector2(MOTH_SIZE, MOTH_SIZE)
	var mat: StandardMaterial3D = StandardMaterial3D.new()



	mat.albedo_color = Color(0.95, 0.9, 0.72)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	mesh.material = mat
	var total: int = _moth_spots.size() * MOTH_PER_TOWER
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = total
	_moth_r.resize(total)
	_moth_spin.resize(total)
	_moth_ph.resize(total)
	_moth_bob.resize(total)
	for i in total:
		_moth_r[i] = randf_range(MOTH_R_MIN, MOTH_R_MAX)


		_moth_spin[i] = randf_range(MOTH_SPIN_MIN, MOTH_SPIN_MAX) \
				*(1.0 if randf() < 0.5 else -1.0)
		_moth_ph[i] = randf_range(0.0, TAU)
		_moth_bob[i] = randf_range(0.0, TAU)
	_moth_mm = MultiMeshInstance3D.new()
	_moth_mm.multimesh = mm
	_moth_mm.visible = false
	_moth_mm.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



	_moth_mm.custom_aabb = AABB(Vector3(-90.0, -2.0, -60.0), Vector3(180.0, 60.0, 230.0))
	_bowl_root().add_child(_moth_mm)











func _tick_moths(delta: float) -> void:
	if _moth_mm == null:
		return
	if Settings.reduce_motion or _spotlights.is_empty() or not _spotlights[0].visible:


		if _moth_mm.visible:
			_moth_mm.visible = false
		return
	_moth_acc += delta
	if _moth_acc < MOTH_TICK:
		return
	_moth_t += _moth_acc
	_moth_acc = 0.0
	var up: float = clampf(_spotlights[0].light_energy / FLOOD_ENERGY, 0.0, 1.0)
	var mm: MultiMesh = _moth_mm.multimesh
	for t in _moth_spots.size():
		var centre: Vector3 = _moth_spots[t]
		for k in MOTH_PER_TOWER:
			var i: int = t * MOTH_PER_TOWER + k
			var a: float = _moth_t * _moth_spin[i] + _moth_ph[i]



			var r: float = _moth_r[i] + sin(_moth_t * _moth_spin[i] * 0.6 + _moth_ph[i]) * 0.35
			var pos: Vector3 = centre + Vector3(cos(a) * r,
				sin(_moth_t * 1.7 + _moth_bob[i]) * MOTH_BOB, sin(a) * r)



			var s: float =(0.7 + 0.3 * sin(_moth_t * 6.0 + _moth_ph[i] * 3.0)) * up
			mm.set_instance_transform(i, Transform3D(
				Basis.IDENTITY.scaled(Vector3(s, s, s)), pos))
	_moth_mm.visible = true

































const FENCE_X: float = 37.4
const FENCE_INSIDE_RING: float = 1.9
const FENCE_MIN_X: float = 35.0
const FENCE_H: float = 2.1



















const FENCE_GAP_PAD: float = 2.0

const FENCE_END_OUT: float = 7.5

const FENCE_CROWD_OUT: float = 1.0

const FENCE_CROWD_STEP: float = 2.6











var _valla_mats: Dictionary = {}


func _valla_mat(uv: Vector3) -> StandardMaterial3D:
	var m: StandardMaterial3D = _valla_mats.get(uv)
	if m == null:
		m = _mesh_mat.duplicate()
		m.uv1_scale = uv
		_valla_mats[uv] = m
	return m








const BALL_STOP_H: float = 8.0


const BALL_STOP_MASTS: int = 7



const BALL_STOP_IN: float = 0.5




func _fence_gap_z() -> float:
	return DUGOUT_OFFSET_Z + float(_dugout_cfg()["len"]) * 0.5 + FENCE_GAP_PAD





func _fence_x() -> float:
	return maxf(_ring_x() - FENCE_INSIDE_RING, FENCE_MIN_X)


func _build_ground_fence() -> void:
	if not bool(_stands_cfg().get("fence", false)):
		return



	var pad: float = _ring_pad_z()
	var z0: float = - FENCE_END_OUT - pad
	var z1: float = FIELD_DEPTH + FENCE_END_OUT + pad
	var gap: float = _fence_gap_z()
	var fx: float = _fence_x()


	var tramos: Array = [
		[- fx, z0, HALF_LINE - gap, true],
		[- fx, HALF_LINE + gap, z1, true],
		[fx, z0, HALF_LINE - gap, true],
		[fx, HALF_LINE + gap, z1, true],
		[z0, - fx, fx, false],
		[z1, - fx, fx, false],
	]
	var root: Node3D = Node3D.new()
	add_child(root)



	if _mesh_mat == null:
		_mesh_mat = StandardMaterial3D.new()
		_mesh_mat.albedo_texture = _cordon_texture()
		_mesh_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		_mesh_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
		_mesh_mat.alpha_scissor_threshold = 0.5
		_mesh_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		_mesh_mat.roughness = 1.0
	var post_mat: StandardMaterial3D = StandardMaterial3D.new()

	post_mat.albedo_color = SenaPueblo.color_postes(self, Color("5e6a74"))
	var postes: Array[Transform3D] = []
	var gente: Array = []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = int(absf(hash(_pitch_seed_club()))) + 8821
	if _att < 0.0:
		_att = _attendance()
	for t in tramos:
		var eje: float = float(t[0])
		var a: float = float(t[1])
		var b: float = float(t[2])
		var lateral: bool = bool(t[3])
		var largo: float = b - a
		if largo <= 0.5:
			continue
		var mid: float =(a + b) * 0.5
		var pano: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()
		q.size = Vector2(largo, FENCE_H)
		pano.mesh = q


		pano.material_override = _valla_mat(Vector3(largo / 1.2, FENCE_H / 1.2, 1.0))
		pano.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		if lateral:
			pano.position = Vector3(eje, FENCE_H * 0.5, mid)
			pano.rotation_degrees = Vector3(0.0, 90.0, 0.0)
		else:
			pano.position = Vector3(mid, FENCE_H * 0.5, eje)
		root.add_child(pano)
		SenaPueblo.valla(self, root, pano.position, largo, lateral)


		var d: float = 0.0
		while d <= largo:
			var p: Vector3
			if lateral:
				p = Vector3(eje, 0.0, a + d)
			else:
				p = Vector3(a + d, 0.0, eje)
			postes.append(Transform3D(Basis.IDENTITY,
				p + Vector3(0.0, FENCE_H * 0.5, 0.0)))
			d += 6.0
		var paso: float = FENCE_CROWD_STEP
		var fuera: float = FENCE_CROWD_OUT
		var w: float = paso * 0.5
		while w < largo - paso * 0.5:


			if rng.randf() < _att * 0.55:
				var g: Vector3
				if lateral:
					g = Vector3(eje + signf(eje) * fuera,
						0.75, a + w + rng.randf_range(-0.3, 0.3))
				else:
					g = Vector3(a + w + rng.randf_range(-0.3, 0.3),
						0.75, eje + signf(eje - HALF_LINE) * fuera)


				if not (_obra_sitio and not lateral and eje < HALF_LINE and g.x > -0.5):
					gente.append(Transform3D(Basis.IDENTITY, g))
			w += paso
	if not postes.is_empty():
		var pm: MultiMesh = MultiMesh.new()
		pm.transform_format = MultiMesh.TRANSFORM_3D
		var box: BoxMesh = BoxMesh.new()
		box.size = Vector3(0.07, FENCE_H, 0.07)
		box.material = post_mat
		pm.mesh = box
		pm.instance_count = postes.size()
		for i in postes.size():
			pm.set_instance_transform(i, postes[i])
		var pmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		pmi.multimesh = pm
		pmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(pmi)
	if not gente.is_empty():


		var por_pose: Array = [[], [], []]
		for i in gente.size():
			por_pose[i % 3].append(gente[i])
		for pose in 3:
			if por_pose[pose].is_empty():
				continue
			_add_static_fans(root, por_pose[pose], true, _host_stand_is_yours(),
				pose, 0, 1.0, 1.0)




























func _build_ball_stop() -> void:
	if not STREET_END_FILLS.has(_end_fill()):
		return
	var root: Node3D = Node3D.new()
	_bowl_root().add_child(root)



	var z: float = - FENCE_END_OUT - _ring_pad_z() + BALL_STOP_IN
	var fx: float = _fence_x()
	var metal: StandardMaterial3D = StandardMaterial3D.new()
	metal.albedo_color = Color("8d97a0")
	metal.roughness = 0.8



	for i in BALL_STOP_MASTS:
		var mast: MeshInstance3D = MeshInstance3D.new()
		var cyl: CylinderMesh = CylinderMesh.new()
		cyl.top_radius = 0.09
		cyl.bottom_radius = 0.15
		cyl.height = BALL_STOP_H
		cyl.radial_segments = 6
		mast.mesh = cyl
		mast.material_override = metal
		mast.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		mast.position = Vector3(
			lerpf(- fx, fx, float(i) / float(BALL_STOP_MASTS - 1)),
			BALL_STOP_H * 0.5, z)
		root.add_child(mast)





	if _mesh_mat == null:
		_mesh_mat = StandardMaterial3D.new()
		_mesh_mat.albedo_texture = _cordon_texture()
		_mesh_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		_mesh_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
		_mesh_mat.alpha_scissor_threshold = 0.5
		_mesh_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		_mesh_mat.roughness = 1.0
	var largo: float = fx * 2.0
	var alto: float = BALL_STOP_H - 0.3
	var pano: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(largo, alto)
	pano.mesh = q
	var inst: StandardMaterial3D = _mesh_mat.duplicate()
	inst.uv1_scale = Vector3(largo / 3.6, alto / 3.6, 1.0)



	inst.albedo_color = Color(0.16, 0.21, 0.17, 0.28)
	inst.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	inst.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	pano.material_override = inst
	pano.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	pano.position = Vector3(0.0, 0.3 + alto * 0.5, z)
	root.add_child(pano)












func _rustic_head(panel_mat: StandardMaterial3D, wood_mat: StandardMaterial3D) -> Node3D:
	var root: Node3D = Node3D.new()
	var bar: MeshInstance3D = MeshInstance3D.new()
	var bar_mesh: BoxMesh = BoxMesh.new()
	bar_mesh.size = Vector3(2.6, 0.14, 0.14)
	bar.mesh = bar_mesh
	bar.material_override = wood_mat
	root.add_child(bar)
	for i in 4:
		var lamp: MeshInstance3D = MeshInstance3D.new()
		var lamp_mesh: BoxMesh = BoxMesh.new()
		lamp_mesh.size = Vector3(0.5, 0.36, 0.22)
		lamp.mesh = lamp_mesh
		lamp.material_override = panel_mat
		lamp.position = Vector3(-0.99 + 0.66 * float(i), -0.24 + 0.06 * float(i), -0.06)
		root.add_child(lamp)
	return root












var _shaft_mesh_cache: ArrayMesh
func _shaft_mesh() -> ArrayMesh:
	if _shaft_mesh_cache != null:
		return _shaft_mesh_cache


	var segs: int = 14
	var verts: PackedVector3Array = PackedVector3Array()
	var cols: PackedColorArray = PackedColorArray()
	var idx: PackedInt32Array = PackedInt32Array()
	for i in segs + 1:
		var a: float = TAU * float(i) / float(segs)
		var c: float = cos(a)
		var s: float = sin(a)
		verts.append(Vector3(c * SHAFT_TOP_R, s * SHAFT_TOP_R, 0.0))
		verts.append(Vector3(c * SHAFT_BOT_R, s * SHAFT_BOT_R, - SHAFT_LEN))



		cols.append(Color(1.0, 1.0, 1.0, 1.0))
		cols.append(Color(1.0, 1.0, 1.0, 0.0))
	for i in segs:
		var b: int = i * 2
		idx.append_array([b, b + 1, b + 2, b + 2, b + 1, b + 3])
	var arr: Array = []
	arr.resize(Mesh.ARRAY_MAX)
	arr[Mesh.ARRAY_VERTEX] = verts
	arr[Mesh.ARRAY_COLOR] = cols
	arr[Mesh.ARRAY_INDEX] = idx
	_shaft_mesh_cache = ArrayMesh.new()
	_shaft_mesh_cache.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)
	return _shaft_mesh_cache






func _shaft_material() -> StandardMaterial3D:
	if _shaft_mat != null:
		return _shaft_mat
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.no_depth_test = false
	m.vertex_color_use_as_albedo = true


	m.albedo_color = Color(0.93, 0.95, 1.0, 0.0)
	_shaft_mat = m
	return m




func _flag_frames() -> SpriteFrames:
	if _flag_frames_cache != null:
		return _flag_frames_cache
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("wave")
	frames.set_animation_loop("wave", true)
	frames.set_animation_speed("wave", 6.0)
	var found: bool = false
	for i in range(1, 5):
		var path: String = "res://assets/sprites/objects/flag_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("wave", load(path))
			found = true
	if not found:
		return null
	_flag_frames_cache = frames
	return frames




func _build_corner_flags() -> void:

	var frames: SpriteFrames = SenaClub.banderin(self, _flag_frames())
	if frames == null:
		return
	var ps: float = CORNER_FLAG_PS




	var flag_y: float = CORNER_FLAG_CENTER_Y






	var corners: Array = [
		Vector3(- FIELD_HALF_W, 0.0, 0.0),
		Vector3(FIELD_HALF_W, 0.0, 0.0),
		Vector3(- FIELD_HALF_W, 0.0, FIELD_DEPTH),
		Vector3(FIELD_HALF_W, 0.0, FIELD_DEPTH),
	]
	_corner_flags.clear()
	for pos in corners:
		var pivot: Node3D = Node3D.new()
		pivot.position = pos
		add_child(pivot)
		var flag: AnimatedSprite3D = AnimatedSprite3D.new()
		flag.sprite_frames = frames
		flag.pixel_size = ps
		flag.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		flag.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		flag.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD

		flag.position = Vector3(0.0, flag_y, 0.0)
		flag.play("wave")
		flag.frame = randi_range(0, maxi(frames.get_frame_count("wave") - 1, 0))
		pivot.add_child(flag)


		var detalle: Dictionary = preload("res://features/stadium/corner_flag_detail.gd").montar(
			pivot, flag, ps, flag_y)
		_corner_flags.append({"pivot": pivot, "sprite": flag, "pos": pos,
			"broken": false, "detalle": detalle})



	_flags_wind()






const CORNER_FLAG_PS: float = 1.6 / 48.0
const CORNER_FLAG_BASE_PX: float = 42.0


const CORNER_FLAG_CENTER_Y: float =(CORNER_FLAG_BASE_PX - 24.0) * CORNER_FLAG_PS
const CORNER_FLAG_TOP_Y: float = CORNER_FLAG_CENTER_Y + 24.0 * CORNER_FLAG_PS
const CORNER_FLAG_BREAK_R: float = 1.1
func hit_corner_flags(ball_pos: Vector3) -> void:
	if _corner_flags.is_empty():
		return

	if ball_pos.y > CORNER_FLAG_TOP_Y + 0.6:
		return
	for f in _corner_flags:
		if bool(f["broken"]):
			continue
		var p: Vector3 = f["pos"]
		var dx: float = ball_pos.x - p.x
		var dz: float = ball_pos.z - p.z
		if dx * dx + dz * dz > CORNER_FLAG_BREAK_R * CORNER_FLAG_BREAK_R:
			continue
		_break_corner_flag(f)









func _break_corner_flag(f: Dictionary) -> void:
	f["broken"] = true
	if f.has("detalle"):
		var hacia_fuera: float = 1.0 if (f["pos"] as Vector3).z > FIELD_DEPTH * 0.5 else -1.0
		preload("res://features/stadium/corner_flag_detail.gd").romper(f["detalle"], hacia_fuera)
		return
	var sprite: AnimatedSprite3D = f["sprite"]

	var tex: Texture2D = sprite.sprite_frames.get_frame_texture("wave", sprite.frame)
	sprite.visible = false
	var pivot: Node3D = f["pivot"]
	var ps: float = CORNER_FLAG_PS



	var half_off: float = 12.0 * ps

	var bottom: Sprite3D = _flag_half(tex, Rect2(0, 24, 48, 24), ps)
	bottom.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	bottom.position = Vector3(0.0, CORNER_FLAG_CENTER_Y - half_off, 0.0)
	pivot.add_child(bottom)

	var fall_dir: float = 1.0 if (f["pos"] as Vector3).z > FIELD_DEPTH * 0.5 else -1.0
	var fell: Node3D = Node3D.new()

	fell.position = Vector3(0.0, 0.06, fall_dir * 0.45)
	fell.rotation.x = deg_to_rad(fall_dir * 90.0)
	pivot.add_child(fell)
	var top: Sprite3D = _flag_half(tex, Rect2(0, 0, 48, 24), ps)
	top.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	top.position = Vector3(0.0, half_off, 0.0)
	fell.add_child(top)




func _flag_half(tex: Texture2D, region: Rect2, ps: float) -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.texture = tex
	s.region_enabled = true
	s.region_rect = region
	s.pixel_size = ps
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	return s









func _slope_center(scale: float = 1.0) -> Vector2:
	var half: float = _slope_h(scale) * 0.5
	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	return Vector2(STAND_SLOPE_FOOT_Y + half * cos(rad),
		STAND_SLOPE_FOOT_Z - half * sin(rad))



func _slope_top(scale: float = 1.0) -> Vector2:
	var half: float = _slope_h(scale) * 0.5
	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	var c: Vector2 = _slope_center(scale)
	return Vector2(c.x + half * cos(rad), c.y - half * sin(rad))







func _stand(center: Vector3, length: float, facing_deg: float,
		prom: String = "full", with_word: bool = false,
		with_works: bool = false, roof_flag: int = -1,
		obra_x0: float = 0.0, obra_sitio: bool = false,
		with_honor: bool = false, detalle: Dictionary = {}) -> void:


	_obra_x0 = obra_x0 if with_works else 0.0
	var scale: float = _prom_scale(prom)
	var roofed: bool = prom == "full"


	_wall_trophy_half = 0.0
	var root: Node3D = Node3D.new()
	root.position = center
	root.rotation_degrees = Vector3(0.0, facing_deg, 0.0)
	root.set_meta("recinto_planta", footprint)
	root.set_meta("recinto_piso", int(detalle.get("piso", 0)))
	root.set_meta("recinto_singular", String(detalle.get("singular", "")))
	root.set_meta("recinto_cortes", detalle.get("cortes", []))
	root.set_meta("recinto_vecinos", detalle.get("vecinos", []))
	root.set_meta("recinto_escala", scale)
	root.set_meta("celu_largo", length)
	_stand_roots.append(root)
	_bowl_root().add_child(root)


	if with_works:
		root.set_meta("obra", true)
		root.set_meta("obra_x0", _obra_x0)


	_register_occluder(root)




	var inward: Vector3 = Vector3(0.0, 0.0, 1.0).rotated(
		Vector3.UP, deg_to_rad(facing_deg))













	var wall_top: float = center.y + _slope_top(scale).x + ROOF_RISE + 0.5



















	_bowl_walls.append({"p": center + inward * BOWL_WALL_FACE, "n": inward,
		"top": wall_top, "base": center.y,
		"fondo": BOWL_WALL_FACE - _slope_top(scale).y,
		"atraviesa": CUENCO_ATRAVIESA.has(footprint) and int(detalle.get("piso", 0)) >= 1})




	var worn: bool = bool(_stands_cfg().get("worn", false))
	var dark: StandardMaterial3D = StandardMaterial3D.new()
	dark.roughness = 1.0
	if worn:
		dark.albedo_texture = _worn_wall_texture()
		dark.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


		dark.uv1_scale = Vector3(maxf(length / 6.0, 1.0), 1.0, 1.0)
	else:


		dark.albedo_color = front_wall_color()
		FinishDetail.acabado(dark, "concreto", div)
		dark.uv1_scale = Vector3(maxf(length / 8.0, 1.0), 1.0, 1.0)

	var wall: MeshInstance3D = MeshInstance3D.new()
	var wall_mesh: BoxMesh = BoxMesh.new()
	wall_mesh.size = Vector3(length, 2.2, 1.0)
	wall.mesh = wall_mesh
	wall.material_override = dark
	wall.position = Vector3(0.0, 1.1, 0.5)
	root.add_child(wall)


	var slope_c: Vector2 = _slope_center(scale)
	var slope_rot: Vector3 = Vector3(- STAND_SLOPE_DEG, 0.0, 0.0)
	if _slope_mat == null:
		_slope_mat = StandardMaterial3D.new()
		_slope_mat.albedo_texture = _seat_texture()
		_slope_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		_slope_mat.roughness = 1.0
		_slope_mat.uv1_scale = Vector3(1.0, _slope_h() / 8.0, 1.0)
	var crowd: MeshInstance3D = MeshInstance3D.new()
	var crowd_mesh: QuadMesh = QuadMesh.new()
	crowd_mesh.size = Vector2(length, _slope_h(scale))
	crowd.mesh = crowd_mesh
	crowd.set_meta("recinto_superficie", "graderio")


	var slope_inst: StandardMaterial3D = _slope_mat.duplicate()
	slope_inst.uv1_scale = Vector3(length / 8.0, _slope_h(scale) / 8.0, 1.0)
	crowd.material_override = slope_inst
	crowd.position = Vector3(0.0, slope_c.x, slope_c.y)
	crowd.rotation_degrees = slope_rot
	root.add_child(crowd)

	var aisle_mat: StandardMaterial3D = StandardMaterial3D.new()
	aisle_mat.albedo_color = Color("4a505c")
	aisle_mat.roughness = 1.0

	var sections: int = maxi(int(round(length / 13.0)), 1)
	var sec_w: float = length / float(sections)
	var aisle_xs: Array[float] = []
	for s in range(1, sections):
		var ax: float = - length * 0.5 + sec_w * float(s)


		if not RecintoSeams.contiene(root, Vector3(ax, 0, STAND_SLOPE_FOOT_Z), 1.2):
			continue
		aisle_xs.append(ax)
		var aisle: MeshInstance3D = MeshInstance3D.new()
		var aq: QuadMesh = QuadMesh.new()
		aq.size = Vector2(0.9, _slope_h(scale))
		aisle.mesh = aq
		aisle.material_override = aisle_mat

		aisle.position = Vector3(ax, slope_c.x, slope_c.y) + Vector3(0.0, 0.028, 0.017)
		aisle.rotation_degrees = slope_rot
		aisle.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(aisle)




	_box_half_x = -1.0
	_box_band_y = Vector2(INF, - INF)
	if _lleva_cinta(prom, length, center):
		_stand_boxes(root, length, scale, with_works)









		await _respira()










	if root.position.z < 0.0 and absf(root.position.x) < 20.0:
		_pitch_box_cands.append({"root": root, "len": length})
	if roofed:




		var escaleras: Array[float] = []
		for ax in aisle_xs:
			if not _en_obra(with_works, ax):
				escaleras.append(ax)

		root.set_meta("escaleras_abiertas", escaleras)




	if roofed and bool(_stands_cfg()["catwalk"]):
		var walk: MeshInstance3D = MeshInstance3D.new()
		var wq: QuadMesh = QuadMesh.new()
		wq.size = Vector2(length, 1.2)
		walk.mesh = wq
		walk.material_override = aisle_mat
		walk.position = Vector3(0.0, slope_c.x, slope_c.y) + Vector3(0.0, 0.03, 0.018)
		walk.rotation_degrees = slope_rot
		walk.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(walk)

	var rail: MeshInstance3D = MeshInstance3D.new()
	var rail_mesh: BoxMesh = BoxMesh.new()
	rail_mesh.size = Vector3(length, 0.07, 0.07)
	rail.mesh = rail_mesh
	var rail_mat: StandardMaterial3D = StandardMaterial3D.new()

	rail_mat.albedo_color = Color("7c5a36") if worn else Color("d8dde6")
	rail_mat.roughness = 1.0 if worn else 0.5
	rail.material_override = rail_mat
	rail.position = Vector3(0.0, 2.28, 0.96)
	rail.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(rail)











	if _lleva_techo(roof_flag) and footprint != "azteca_coloso":
		_stand_roof(root, length, _slope_top(scale))
		await _respira()
	var mexicano: bool = footprint in ["cu_olimpico", "azteca_coloso"]


	var argentino: bool = footprint in ["bombonera", "monumental_river", "camp_nou"]
	if mexicano or argentino:
		var piso_recinto: int = int(detalle.get("piso", 0))
		var materiales: Array
		match footprint:
			"cu_olimpico":
				materiales = CuDetail.tribuna(root, length, _slope_top(scale), piso_recinto)
			"azteca_coloso":
				materiales = AztecaDetail.tribuna(root, length, _slope_top(scale),
					piso_recinto, scale)
			"bombonera":
				materiales = BomboneraDetail.tribuna(root, length, _slope_top(scale),
					piso_recinto, dark, slope_inst)
			"camp_nou":
				materiales = CampNouDetail.tribuna(root, length, _slope_top(scale),
					piso_recinto, dark, slope_inst)
			_:
				materiales = MonumentalDetail.tribuna(root, length, _slope_top(scale),
					piso_recinto, dark, slope_inst)
		for mat in materiales:
			_caracter.material(mat)
			if mat.has_meta("luces_azteca"): _finish_lamps.append(mat)
		var cubierta: MeshInstance3D = root.get_node_or_null("CubiertaAzteca")
		if cubierta != null:
			var medida: Vector3 = AztecaDetail.losa(length, _slope_top(scale))["size"]
			_snow_cap(cubierta, Vector3(0, 0.14, 0), Vector3(medida.x, 0.06, medida.z))
	else:
		VenueIdentity.fachada(root, length, _slope_top(scale), div, _club_a, _pitch_seed_club())
	var fachada: MeshInstance3D = root.get_node_or_null("FachadaRecinto")
	if fachada != null:
		_caracter.material(fachada.material_override)
	_caracter.tribuna(root, length, _slope_top(scale), div, _pitch_seed_club(),
		Teams.base_div(_pitch_seed_club()), _club_a,
		_big_night or _comp == "nat" or mexicano or argentino, dark, slope_inst)
	await _respira()


	if roofed and length >= 90.0 and bool(_stands_cfg()["banners"]):
		if _banner_mats.is_empty():
			if _att < 0.0:
				_att = _attendance()




			var ab: String = _club_abbrev
			if ab.is_empty():


				ab = "LEGACY" if _comp == "nat" else String(
					Teams.by_id(GameState.player_team_id).get("abbrev", "LEGACY"))










			var shout: String = banner_text
			if shout.is_empty():
				if _big_night:
					shout = "EUROPA"
				elif _derby:
					shout = "DERBI"
				elif not _honor_surname().is_empty():
					shout = _honor_surname()
				elif _naming_enfado_aqui():

					shout = _pixel_safe(I18n.t("NO SE VENDE"))
				else:
					shout = "VAMOS"
			_banner_shout = shout
			_banner_mats = [_make_banner_mat(shout), _make_banner_mat(ab)]
		for bp in _wall_banner_spots(root.position, length):
			await _respira()

			if _en_obra(with_works, bp.x):
				continue
			var banner: MeshInstance3D = MeshInstance3D.new()
			var bq: QuadMesh = QuadMesh.new()
			bq.size = Vector2(bp.z, bp.w)
			banner.mesh = bq








			banner.material_override = _banner_mats[_banner_i % 2].duplicate()
			_banner_i += 1
			banner.position = Vector3(bp.x, bp.y, 1.02)
			banner.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			root.add_child(banner)
	if with_word:
		_seat_word(root, length, scale, with_works)



		_build_crest(root, length)




		_build_wall_trophies(root, length)



	if with_honor:
		var x_off: float = length * 0.3 if with_word and div >= 3 else 0.0
		_seat_word(root, length, scale, with_works, _honor_surname(),
			"ApellidoButacas", x_off)



	_build_sector_numbers(root, length, with_word or with_honor)
	await _respira()


	if with_works and not obra_sitio:


		_stand_works(root, length, scale, _lleva_techo(roof_flag))

	_stand_cordon(root, length, scale)
	await _respira()








	if absf(center.x) > 30.0:
		_side_roots.append({"root": root, "len": length, "roofed": roofed,
			"scale": scale})


	if absf(center.x) > 30.0:
		_side_views.append({"side": signf(center.x), "x": absf(center.x),
			"scale": scale})

	_build_tifo(root, length, scale, with_works)
	await _respira()


	_build_stand_accesses(root, length, scale, aisle_xs, crowd, with_works)
	await _respira()
	await _build_fan_rows(root, length, scale, with_works)
	await _respira()
	_build_security(root, length, prom, with_works)
	await _respira()
	if root.has_meta("escaleras_abiertas"):
		_spawn_walkers(root, root.get_meta("escaleras_abiertas"), scale)
		_access_walker_bounds(root)




	_aisle_rails(root, aisle_xs, scale, slope_c, slope_rot)
	await _respira()


	_build_front_flags(root, length, scale, with_works)
	await _respira()



	_build_front_cards(root, length, with_works)
	await _respira()

	_build_wall_drapes(root, length, scale, with_works)
	await _respira()



	_build_serpentinas(root, length, scale, with_works)
	await _respira()


	RecintoSeams.recortar(root)






func _build_stand_accesses(root: Node3D, length: float, scale: float,
		aisles: Array[float], slope: MeshInstance3D, works: bool) -> void:
	if div > 2:
		return
	var blocked: Array[Rect2] = []
	if _box_half_x > 0.0:
		blocked.append(Rect2(- _box_half_x, _box_band_y.x,
			_box_half_x * 2, _box_band_y.y - _box_band_y.x))
	var structural: Array[Rect2] = blocked.duplicate()
	var height: float = _slope_h(scale)

	if _away_whole_stand(root.position):
		var away_w: float = minf(length * 0.3, 16.0)
		structural.append(Rect2(- away_w * 0.5, - height * 0.09, away_w, height * 0.26))
	elif root.position.z < 0.0 and absf(root.position.x) < 20.0:


		var ancho: float = length * StandAccess.TIFO_MAX_COVERAGE
		var centro: float = 0.0
		if works:
			var hasta: float = minf(_obra_x0, length * 0.5)
			ancho = minf(ancho, maxf(0.0, hasta + length * 0.5) * 0.88)
			centro =(- length * 0.5 + hasta) * 0.5
		var bajo: float = - height * 0.49
		var alto: float = minf(height * 0.29, _box_ceiling_y())
		if ancho > 0.0 and alto > bajo:
			structural.append(Rect2(centro - ancho * 0.5, bajo, ancho, alto - bajo))
	elif absf(root.position.x) > 30.0 and length >= TIFO_SIDE_MIN_LEN:

		var ancho: float = length * TIFO_SIDE_W
		var alto: float = height *(0.06 + TIFO_SIDE_H * 0.5)
		if _box_half_x > 0.0 and length * TIFO_SIDE_OFF - ancho * 0.5 < _box_half_x:
			alto = minf(alto, _box_ceiling_y())
		var bajo: float = maxf(alto - height * TIFO_SIDE_H, - height * 0.5 + 0.4)
		for lado in [-1.0, 1.0]:
			var centro: float = lado * length * TIFO_SIDE_OFF
			if not _en_obra(works, centro) and alto > bajo:
				structural.append(Rect2(centro - ancho * 0.5, bajo, ancho, alto - bajo))


	for pano in _cloth_panels:
		if not is_instance_valid(pano) or not root.is_ancestor_of(pano):
			continue
		if pano.mesh is QuadMesh:
			var sz: Vector2 =(pano.mesh as QuadMesh).size * Vector2(pano.scale.x, pano.scale.y)
			blocked.append(Rect2(pano.get_parent().position.x - sz.x * 0.5,
				pano.position.y - sz.y * 0.5, sz.x, sz.y))
	var rects: Array[Rect2] = StandAccess.plan(length, height, aisles, structural,
		_obra_x0 if works else INF)
	if rects.is_empty():
		return
	root.set_meta("accesos_grada", rects)
	root.set_meta("centro_talud", _slope_center(scale))
	root.set_meta("obstaculos_accesos", blocked)
	slope.name = "TaludConAccesos"


	slope.mesh = StandAccess.surface(Vector2(length, height), rects,
		DetalleExterior.se_corta(root))


	for child in root.get_children():
		if not child is MeshInstance3D or not (child as MeshInstance3D).mesh is QuadMesh:
			continue
		var aisle: MeshInstance3D = child
		var size: Vector2 =(aisle.mesh as QuadMesh).size
		if not is_equal_approx(size.x, 0.9) or not is_equal_approx(size.y, height):
			continue
		for rect in rects:
			if absf(aisle.position.x - rect.get_center().x) > 0.1:
				continue
			for segment in [Vector2(- height * 0.5, rect.position.y), Vector2(rect.end.y, height * 0.5)]:
				if segment.y - segment.x < 0.01:
					continue
				var part: MeshInstance3D = MeshInstance3D.new()
				var quad: QuadMesh = QuadMesh.new()
				quad.size = Vector2(0.9, segment.y - segment.x)
				part.mesh = quad
				part.material_override = aisle.material_override
				part.transform = aisle.transform
				part.position += aisle.basis.y *((segment.x + segment.y) * 0.5)
				part.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
				root.add_child(part)
			root.remove_child(aisle)
			aisle.queue_free()
			break
	StandAccess.build(root, _slope_center(scale), deg_to_rad(- STAND_SLOPE_DEG),
		rects, front_wall_color())


func _in_stand_access(root: Node3D, local: Vector3, pad: float = 0.0) -> bool:
	if not root.has_meta("accesos_grada"):
		return false
	var center: Vector2 = root.get_meta("centro_talud")
	var at: Vector3 = Basis(Vector3.RIGHT, deg_to_rad(STAND_SLOPE_DEG)) \
			*(local - Vector3(0, center.x, center.y))
	return StandAccess.contains(root.get_meta("accesos_grada"), Vector2(at.x, at.y), pad)






func _accesos_u(root: Node3D) -> Array[Vector3]:
	var out: Array[Vector3] = []
	if not root.has_meta("accesos_grada"):
		return out
	var center: Vector2 = root.get_meta("centro_talud")
	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	for rect in root.get_meta("accesos_grada"):
		var r: Rect2 = rect
		out.append(Vector3(r.get_center().x,
			(center.x + r.position.y * cos(rad) - 4.5) / 1.6,
			(center.x + r.end.y * cos(rad) - 2.5) / 1.6))
	return out




func _access_walker_bounds(root: Node3D) -> void:
	if not root.has_meta("accesos_grada"):
		return
	var accesos: Array[Vector3] = _accesos_u(root)
	for walker in _walkers:
		if (walker["node"] as Node).get_parent() != root:
			continue
		for acc in accesos:
			if absf(float(walker["x"]) - acc.x) > 1.8:
				continue
			var low: float = acc.y
			var high: float = acc.z
			var u0: float = walker["floor"]
			var u1: float = walker["top"]
			if high <= u0 or low >= u1:
				continue
			if low - u0 >= u1 - high:
				walker["top"] = maxf(u0, low)
			else:
				walker["floor"] = minf(u1, high)
			walker["u"] = clampf(walker["u"], walker["floor"], walker["top"])
		_place_walker(walker)




















func _box_band_of(length: float, scale: float) -> Dictionary:



	var span: float = length if clampi(div, 1, 3) <= 1 else minf(52.0, length)
	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	var up: Vector3 = Vector3(0.0, cos(rad), - sin(rad))
	var nrm: Vector3 = Vector3(0.0, sin(rad), cos(rad))
	var c: Vector2 = _slope_center(scale)

	var t: float =(0.635 - 0.5) * _slope_h(scale)
	var anchor: Vector3 = Vector3(0.0, c.x, c.y) + up * t + nrm * 0.06
	var half: float = BOX_BAND * 0.5
	var low: Vector3 = anchor - up * half
	var high: Vector3 = anchor + up * half
	return {
		"span": span, "t": t, "half": half, "low": low, "high": high,
		"zf": low.z,
		"yb": low.y,
		"band_h": high.y - low.y,
		"eave": low.z - high.z,
	}











func _boxes_style() -> String:
	if not boxes_style.is_empty():
		return boxes_style
	var fp: String = String(FOOTPRINT_CFG.get(footprint, {}).get("boxes", ""))
	if not fp.is_empty():
		return fp
	var d: int = clampi(div, 1, 3)
	if d >= 3:
		return "none"






	var pool: Array = BOX_STYLE_POOL[d]
	var semilla: String = _pitch_seed_club()
	if semilla.is_empty():
		return String(pool[0])
	return String(pool[absi(hash(semilla + "/palco")) % pool.size()])


func _stand_boxes(root: Node3D, length: float, scale: float,
		works: bool = false) -> void:
	var style: String = _boxes_style()
	if style == "none":
		return




	var span: float = float(_box_band_of(length, scale)["span"])
	_box_half_x = span * 0.5
	var mods: int = maxi(int(round(span / 6.5)), 1)
	var mod_w: float = span / float(mods)
	var banda: Dictionary = _box_band_of(length, scale)
	var t: float = float(banda["t"])










	var half: float = float(banda["half"])



	_box_band_y = Vector2(t - half, t + half)
	var high: Vector3 = banda["high"]
	var zf: float = float(banda["zf"])
	var yb: float = float(banda["yb"])
	var band_h: float = float(banda["band_h"])





	if root.position.z < 0.0 and absf(root.position.x) < 20.0:




		_near_box_top_y = maxf(_near_box_top_y, high.y + BOX_CANTO.get(style, 0.28))
	var eave: float = float(banda["eave"])
	var sill: float = 0.3
	var glass_h: float = band_h - sill

	var shell: StandardMaterial3D = StandardMaterial3D.new()
	shell.albedo_color = Color("c3cad6")
	shell.roughness = 0.45


	shell.cull_mode = BaseMaterial3D.CULL_DISABLED


	var inner: StandardMaterial3D = StandardMaterial3D.new()
	inner.albedo_color = Color("1b2029")
	inner.roughness = 1.0
	inner.cull_mode = BaseMaterial3D.CULL_DISABLED



	var glass: StandardMaterial3D = StandardMaterial3D.new()
	glass.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	glass.metallic = 0.7
	glass.roughness = 0.15







	if venue_empty:
		glass.albedo_color = Color("161b23")
	else:
		_box_glass.append(glass)
		_box_glass_light(glass)



	var glass_obra: StandardMaterial3D = glass
	if works:
		glass_obra = StandardMaterial3D.new()
		glass_obra.albedo_color = Color("161b23")
		glass_obra.metallic = 0.6
		glass_obra.roughness = 0.2















	var fases: Array[StandardMaterial3D] = []
	if not venue_empty:
		_box_people_fases(fases)

	var vip: StandardMaterial3D = StandardMaterial3D.new()
	vip.albedo_color = front_wall_color().lightened(0.45)
	vip.roughness = 0.9
	_box_modules(root, style, span, mods, mod_w, works, fases, vip, glass, glass_obra,
		shell, zf, yb, sill, glass_h)
	_box_shell(root, style, span, mods, mod_w, eave, zf, yb, band_h, sill, inner, shell,
		vip)




func _box_people_fases(fases: Array[StandardMaterial3D]) -> void:
	var people: StandardMaterial3D = StandardMaterial3D.new()
	people.albedo_texture = _box_people_texture()
	people.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	people.roughness = 1.0



	people.uv1_scale = BOX_UV_SCALE
	people.uv1_offset = Vector3(0.0, BOX_UV_POSE[0], 0.0)



	people.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED




	for k in range(BOX_PHASES):
		var pm: StandardMaterial3D = people.duplicate() as StandardMaterial3D
		_box_people.append(pm)
		_box_people_light(pm)
		fases.append(pm)
		_box_crowd.append({
			"mat": pm,

			"t": BOX_BLINK *(float(k) + 0.5) / float(BOX_PHASES),
			"b": false,
		})




func _box_modules(root: Node3D, style: String, span: float, mods: int, mod_w: float,
		works: bool, fases: Array[StandardMaterial3D], vip: StandardMaterial3D,
		glass: StandardMaterial3D, glass_obra: StandardMaterial3D,
		shell: StandardMaterial3D, zf: float, yb: float, sill: float,
		glass_h: float) -> void:
	for i in range(mods):
		var cx: float = - span * 0.5 + mod_w *(float(i) + 0.5)

		var w: float = mod_w *(BOX_SUITE_W if style == "suites" else 1.0)



		var cerrado: bool = _en_obra(works, cx)


		var inside: MeshInstance3D = null
		if not cerrado and not fases.is_empty():
			inside = MeshInstance3D.new()
			var iq: QuadMesh = QuadMesh.new()
			iq.size = Vector2(w * 0.99, glass_h)
			inside.mesh = iq
			inside.material_override = fases[i % BOX_PHASES]
			inside.position = Vector3(cx, yb + sill + glass_h * 0.5, zf - BOX_DEPTH)
			inside.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			root.add_child(inside)






			_box_rooms.append({"gente": inside, "banda": "alta", "x": absf(cx), "ido": 0})


		if style != "vip":
			var face: MeshInstance3D = MeshInstance3D.new()
			var fq: QuadMesh = QuadMesh.new()
			fq.size = Vector2(w, glass_h)
			face.mesh = fq
			face.material_override = glass_obra if cerrado else glass
			face.position = Vector3(cx, yb + sill + glass_h * 0.5, zf)
			face.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			root.add_child(face)










			_box_panes.append({"nodo": face, "w": w, "h": glass_h, "estado": 0,
				"gente": inside, "fondo": BOX_DEPTH, "suelo": yb,
				"rompible": false})

			var mull: MeshInstance3D = MeshInstance3D.new()
			var mq: QuadMesh = QuadMesh.new()
			mq.size = Vector2(0.35, glass_h)
			mull.mesh = mq
			mull.material_override = shell
			mull.position = Vector3(cx + w * 0.5, yb + sill + glass_h * 0.5, zf + 0.02)
			mull.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			root.add_child(mull)
		else:


			var sep: MeshInstance3D = MeshInstance3D.new()
			var sq: QuadMesh = QuadMesh.new()
			sq.size = Vector2(0.35, glass_h)
			sep.mesh = sq
			sep.material_override = vip
			sep.position = Vector3(cx + w * 0.5, yb + sill + glass_h * 0.5, zf + 0.02)
			sep.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			root.add_child(sep)














func _box_shell(root: Node3D, style: String, span: float, mods: int, mod_w: float,
		eave: float, zf: float, yb: float, band_h: float, sill: float,
		inner: StandardMaterial3D, shell: StandardMaterial3D, vip: StandardMaterial3D) -> void:


	var club: StandardMaterial3D = StandardMaterial3D.new()
	club.albedo_color = _club_a
	club.roughness = 0.8
	club.cull_mode = BaseMaterial3D.CULL_DISABLED
	var rail_h: float = sill + 0.45
	var rail_y: float = yb + sill - rail_h * 0.5
	if style == "suites":
		for i in range(mods):
			var cx: float = - span * 0.5 + mod_w *(float(i) + 0.5)
			var w: float = mod_w * BOX_SUITE_W
			_box_quad(root, Vector2(w, eave), inner,
				Vector3(cx, yb + band_h, zf - eave * 0.5), Vector3(90.0, 0.0, 0.0))

			_box_quad(root, Vector2(w + 0.3, 0.8), club,
				Vector3(cx, yb + band_h + 0.3, zf + 0.04), Vector3.ZERO)
			_box_quad(root, Vector2(w, rail_h), shell,
				Vector3(cx, rail_y, zf + 0.03), Vector3.ZERO)


			for lado in [-1.0, 1.0]:
				_box_quad(root, Vector2(eave + 0.04, band_h + 0.75), club,
					Vector3(cx + lado *(w * 0.5 + 0.15), yb + band_h * 0.5 - 0.1,
						zf - eave * 0.5 + 0.02), Vector3(0.0, 90.0, 0.0))
		return
	_box_quad(root, Vector2(span, eave), inner,
		Vector3(0.0, yb + band_h, zf - eave * 0.5), Vector3(90.0, 0.0, 0.0))
	if style == "vip":



		var rayas: StandardMaterial3D = StandardMaterial3D.new()
		var img: Image = Image.create(2, 1, false, Image.FORMAT_RGBA8)
		img.set_pixel(0, 0, _club_a)
		img.set_pixel(1, 0, _club_b if _club_b.get_luminance() > 0.35 \
				else Color(0.94, 0.93, 0.9))
		rayas.albedo_texture = ImageTexture.create_from_image(img)
		rayas.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		rayas.uv1_scale = Vector3(span / BOX_TOLDO_RAYA, 1.0, 1.0)
		rayas.roughness = 0.9
		rayas.cull_mode = BaseMaterial3D.CULL_DISABLED
		var fondo: float = eave + BOX_TOLDO
		var caida: float = deg_to_rad(BOX_TOLDO_DEG)
		_box_quad(root, Vector2(span, fondo), rayas,
			Vector3(0.0, yb + band_h + 0.25 - sin(caida) * fondo * 0.5,
				zf - eave + cos(caida) * fondo * 0.5),
			Vector3(90.0 + BOX_TOLDO_DEG, 0.0, 0.0))
		_box_quad(root, Vector2(span, 0.7), rayas,
			Vector3(0.0, yb + band_h + 0.25 - sin(caida) * fondo - 0.22,
				zf - eave + cos(caida) * fondo), Vector3.ZERO)



		_box_quad(root, Vector2(span, rail_h), club, Vector3(0.0, rail_y, zf + 0.03),
			Vector3.ZERO)
		return

	_box_quad(root, Vector2(span, 0.28), shell,
		Vector3(0.0, yb + band_h + 0.14, zf + 0.03), Vector3.ZERO)
	_box_quad(root, Vector2(span, rail_h), shell, Vector3(0.0, rail_y, zf + 0.03),
		Vector3.ZERO)



func _box_quad(root: Node3D, size: Vector2, mat: Material, pos: Vector3,
		rot: Vector3) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	m.mesh = q
	m.material_override = mat
	m.position = pos
	m.rotation_degrees = rot
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(m)













































const PITCH_BOX_SPAN: float = 26.0
const PITCH_BOX_MODS: int = 4





const PITCH_BOX_SPAN_D2: float = 13.0
const PITCH_BOX_MODS_D2: int = 2
const PITCH_BOX_SILL: float = 0.55
const PITCH_BOX_H: float = 1.45











const PITCH_BOX_Z: float = 1.55
const PITCH_BOX_BACK: float = 1.02


func _pitch_boxes(root: Node3D, length: float) -> void:


	var d: int = clampi(div, 1, 3)
	if d >= 3 or _boxes_style() == "none":
		return

	var mods: int = PITCH_BOX_MODS if d == 1 else PITCH_BOX_MODS_D2
	var span: float = minf(PITCH_BOX_SPAN if d == 1 else PITCH_BOX_SPAN_D2,
		length * 0.4)
	var mod_w: float = span / float(mods)







	var y0: float = - root.position.y
	var yc: float = y0 + PITCH_BOX_SILL + PITCH_BOX_H * 0.5


	var inner: StandardMaterial3D = StandardMaterial3D.new()
	inner.albedo_color = Color("14181f")
	inner.roughness = 1.0
	var hueco: MeshInstance3D = MeshInstance3D.new()
	var hq: QuadMesh = QuadMesh.new()
	hq.size = Vector2(span + 0.3, PITCH_BOX_H + 0.24)
	hueco.mesh = hq
	hueco.material_override = inner
	hueco.position = Vector3(0.0, yc, PITCH_BOX_BACK)
	hueco.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(hueco)



	var fases: Array[StandardMaterial3D] = []
	if not venue_empty:
		var people: StandardMaterial3D = StandardMaterial3D.new()
		people.albedo_texture = _box_people_texture()
		people.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		people.uv1_scale = BOX_UV_SCALE
		people.uv1_offset = Vector3(0.0, BOX_UV_POSE[0], 0.0)
		people.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		for k in BOX_PHASES:
			var pm: StandardMaterial3D = people.duplicate() as StandardMaterial3D
			_box_people.append(pm)
			_box_people_light(pm)
			fases.append(pm)
			_box_crowd.append({
				"mat": pm,
				"t": BOX_BLINK *(float(k) + 0.5) / float(BOX_PHASES),
				"b": false,
			})




	var glass: StandardMaterial3D = StandardMaterial3D.new()
	glass.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	glass.metallic = 0.7
	glass.roughness = 0.15
	_box_glass.append(glass)
	_box_glass_light(glass)


	var shell: StandardMaterial3D = StandardMaterial3D.new()
	shell.albedo_color = front_wall_color().lightened(0.5)
	shell.roughness = 0.5
	for i in mods:
		var cx: float = - span * 0.5 + mod_w *(float(i) + 0.5)
		var inside: MeshInstance3D = null



		if not fases.is_empty() and not (root.has_meta("obra")
				and cx > float(root.get_meta("obra_x0", 0.0))):
			inside = MeshInstance3D.new()
			var iq: QuadMesh = QuadMesh.new()
			iq.size = Vector2(mod_w * 0.96, PITCH_BOX_H)
			inside.mesh = iq
			inside.material_override = fases[i % fases.size()]
			inside.position = Vector3(cx, yc, PITCH_BOX_BACK + 0.01)
			inside.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			root.add_child(inside)





			_box_rooms.append({"gente": inside, "banda": "pista", "x": absf(cx), "ido": 0})
		var face: MeshInstance3D = MeshInstance3D.new()
		var fq: QuadMesh = QuadMesh.new()
		fq.size = Vector2(mod_w * 0.94, PITCH_BOX_H)
		face.mesh = fq
		face.material_override = glass
		face.position = Vector3(cx, yc, PITCH_BOX_Z)
		face.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(face)



		_box_panes.append({"nodo": face, "w": mod_w * 0.94, "h": PITCH_BOX_H,
			"estado": 0, "gente": inside,
			"fondo": PITCH_BOX_Z - PITCH_BOX_BACK, "suelo": y0 + PITCH_BOX_SILL,
			"rompible": true})
		if i < mods - 1:
			var mull: MeshInstance3D = MeshInstance3D.new()
			var mq: QuadMesh = QuadMesh.new()
			mq.size = Vector2(0.22, PITCH_BOX_H)
			mull.mesh = mq
			mull.material_override = shell
			mull.position = Vector3(cx + mod_w * 0.5, yc, PITCH_BOX_Z + 0.01)
			mull.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			root.add_child(mull)


	for banda in [[y0 + PITCH_BOX_SILL * 0.5, PITCH_BOX_SILL],
			[y0 + PITCH_BOX_SILL + PITCH_BOX_H + 0.09, 0.18]]:
		var cinta: MeshInstance3D = MeshInstance3D.new()
		var cq: QuadMesh = QuadMesh.new()
		cq.size = Vector2(span + 0.3, float(banda[1]))
		cinta.mesh = cq
		cinta.material_override = shell
		cinta.position = Vector3(0.0, float(banda[0]), PITCH_BOX_Z + 0.02)
		cinta.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(cinta)




	var fondo: float = PITCH_BOX_Z - PITCH_BOX_BACK
	var zc: float =(PITCH_BOX_Z + PITCH_BOX_BACK) * 0.5
	for losa in [[y0 + PITCH_BOX_SILL, 90.0, shell],
			[y0 + PITCH_BOX_SILL + PITCH_BOX_H + 0.18, 90.0, inner]]:
		var l: MeshInstance3D = MeshInstance3D.new()
		var lq: QuadMesh = QuadMesh.new()
		lq.size = Vector2(span + 0.3, fondo)
		l.mesh = lq
		l.material_override = losa[2]
		l.position = Vector3(0.0, float(losa[0]), zc)
		l.rotation_degrees = Vector3(float(losa[1]), 0.0, 0.0)
		l.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(l)
	for sx in [-1.0, 1.0]:
		var lado: MeshInstance3D = MeshInstance3D.new()
		var sq: QuadMesh = QuadMesh.new()
		sq.size = Vector2(fondo, PITCH_BOX_H + 0.18 + PITCH_BOX_SILL)
		lado.mesh = sq
		lado.material_override = shell
		lado.position = Vector3(sx *(span * 0.5 + 0.15),
			y0 +(PITCH_BOX_SILL + PITCH_BOX_H + 0.18) * 0.5, zc)
		lado.rotation_degrees = Vector3(0.0, sx * 90.0, 0.0)
		lado.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(lado)
	_muro_sobre_palcos(root, span, y0)











const MURO_SOBRE_PALCOS_AIRE: float = 0.18

func _muro_sobre_palcos(root: Node3D, span: float, y0: float) -> void:


	var techo: float = y0 + PITCH_BOX_SILL + PITCH_BOX_H + 0.18
	var grupo: Array[Node3D] = []
	var suelo: float = INF
	for n in _muro_club:
		if not is_instance_valid(n) or n.get_parent() != root:
			continue
		var media: Vector2 = n.get_meta("muro_media", Vector2.ZERO)

		if absf(n.position.x) - media.x > span * 0.5 + 0.15:
			continue
		grupo.append(n)
		suelo = minf(suelo, n.position.y - media.y)
	if grupo.is_empty() or suelo >= techo + MURO_SOBRE_PALCOS_AIRE:
		return
	var dy: float = techo + MURO_SOBRE_PALCOS_AIRE - suelo
	for n in grupo:
		n.position.y += dy






func _box_u_range(rows: int) -> Vector2:
	var top_u: float = float(rows - 1) * STAND_FAN_ROW_DZ
	if _box_half_x <= 0.0:
		return Vector2(top_u, top_u)



	return Vector2(float(rows) * 0.55 * STAND_FAN_ROW_DZ - 0.34,
		float(rows) * 0.72 * STAND_FAN_ROW_DZ + 0.34)




func _box_glass_light(g: StandardMaterial3D) -> void:
	var night: bool = _weather_id == "night"
	g.emission_enabled = night
	if night:


		g.emission = Color("ffcf8a")
		g.emission_energy_multiplier = 0.3
		g.albedo_color = Color(0.45, 0.42, 0.36, 0.18)
	else:


		g.albedo_color = Color(0.49, 0.59, 0.7, 0.26)





func _box_people_light(m: StandardMaterial3D) -> void:


	m.albedo_color = Color("ffe0b0") if _weather_id == "night" else Color.WHITE


















func _box_panes_prime() -> void:
	if _box_panes_ready or not is_inside_tree():
		return
	_box_panes_ready = true
	var inv: Transform3D = global_transform.affine_inverse()
	var primera: bool = true
	_box_panes_rompibles = 0
	for e in _box_panes:
		var n: MeshInstance3D = SceneFade.vivo(e["nodo"]) as MeshInstance3D
		if not is_instance_valid(n):
			continue
		var xf: Transform3D = inv * n.global_transform
		e["c"] = xf.origin
		e["nrm"] = xf.basis.z.normalized()
		e["bx"] = xf.basis.x.normalized()
		e["by"] = xf.basis.y.normalized()




		if not bool(e.get("rompible", true)):
			continue
		_box_panes_rompibles += 1
		var r: float = maxf(float(e["w"]), float(e["h"])) * 0.5
		var caja: AABB = AABB(xf.origin - Vector3(r, r, r), Vector3(r, r, r) * 2.0)
		_box_panes_aabb = caja if primera else _box_panes_aabb.merge(caja)
		primera = false
	if not primera:
		_box_panes_aabb = _box_panes_aabb.grow(1.0)







func _pane_cross(e: Dictionary, a: Vector3, b: Vector3) -> Vector3:
	if not e.has("c"):
		return Vector3.INF
	var c: Vector3 = e["c"]
	var n: Vector3 = e["nrm"]
	var da: float =(a - c).dot(n)
	var db: float =(b - c).dot(n)

	if (da >= 0.0) ==(db >= 0.0) or absf(da - db) < 1e-05:
		return Vector3.INF
	var pt: Vector3 = a.lerp(b, da /(da - db))
	var d: Vector3 = pt - c
	if absf(d.dot(e["bx"])) > float(e["w"]) * 0.5:
		return Vector3.INF
	if absf(d.dot(e["by"])) > float(e["h"]) * 0.5:
		return Vector3.INF
	return pt















func box_pane_aim(pos: Vector3, vel: Vector3) -> Dictionary:
	_box_panes_prime()
	if _box_panes_rompibles == 0 or not _box_panes_ready:
		return {}
	var p: Vector3 = pos
	var v: Vector3 = vel




	var ruta: PackedVector3Array = PackedVector3Array([pos])
	for k in PANE_AIM_STEPS:
		var ant: Vector3 = p
		v.y -= 9.8 * PANE_AIM_DT
		v *= 1.0 - 0.12 * PANE_AIM_DT
		p += v * PANE_AIM_DT

		if v.y < 0.0 and p.y < _box_panes_aabb.position.y:
			return {}
		ruta.append(p)
		if not _box_panes_aabb.intersects_segment(ant, p):
			continue
		for i in _box_panes.size():
			var e: Dictionary = _box_panes[i]

			if not bool(e.get("rompible", true)):
				continue

			if int(e["estado"]) >= 2:
				continue
			var golpe: Vector3 = _pane_cross(e, ant, p)
			if golpe != Vector3.INF:



				ruta[ruta.size() - 1] = golpe
				return {"i": i, "punto": golpe, "vel": v.length(), "ruta": ruta}
	return {}











func box_pane_hit(a: Vector3, b: Vector3) -> Dictionary:
	_box_panes_prime()
	if _box_panes_rompibles == 0 or not _box_panes_ready:
		return {}
	if not _box_panes_aabb.intersects_segment(a, b):
		return {}
	for i in _box_panes.size():
		var e: Dictionary = _box_panes[i]
		if not bool(e.get("rompible", true)):
			continue
		if int(e["estado"]) >= 2:
			continue
		var golpe: Vector3 = _pane_cross(e, a, b)
		if golpe != Vector3.INF:
			return {"i": i, "punto": golpe}
	return {}




func box_pane_pos(i: int) -> Vector3:
	_box_panes_prime()
	if i < 0 or i >= _box_panes.size() or not _box_panes[i].has("c"):
		return Vector3.INF
	return _box_panes[i]["c"]





func box_pane_normal(i: int) -> Vector3:
	_box_panes_prime()
	if i < 0 or i >= _box_panes.size() or not _box_panes[i].has("nrm"):
		return Vector3.FORWARD
	var n: Vector3 = _box_panes[i]["nrm"]



	var c: Vector3 = _box_panes[i]["c"]
	return - n if n.dot(- c) < 0.0 else n






func box_pane_room(i: int) -> Dictionary:
	if i < 0 or i >= _box_panes.size():
		return {"fondo": 0.5, "suelo": 0.0}
	var e: Dictionary = _box_panes[i]
	return {"fondo": float(e.get("fondo", 0.5)), "suelo": float(e.get("suelo", 0.0))}











































func spook_box(i: int) -> void:
	_box_panes_prime()
	if i < 0 or i >= _box_panes.size() or not _box_panes[i].has("c"):
		return






	if _spook_t > 0.0:
		return
	_spook_t = SPOOK_S
	_spook_gen += 1
	_calm_gen += 1
	var foco: Vector3 = _box_panes[i]["c"]
	for e in _box_panes:
		var g: MeshInstance3D = SceneFade.vivo(e.get("gente")) as MeshInstance3D
		if not is_instance_valid(g) or not e.has("c"):
			continue
		var d: float =(Vector3(e["c"]) - foco).length()
		if d > SPOOK_R:
			continue















		if g.has_meta("palco_ido"):
			continue
		if not g.has_meta("fase"):
			g.set_meta("fase", g.material_override)
		var base: StandardMaterial3D = g.get_meta("fase") as StandardMaterial3D
		if base == null:
			continue



		var pasos: Array[StandardMaterial3D] = []
		for k in range(2, BOX_BAND_CAIDA.size()):
			var m: StandardMaterial3D = base.duplicate() as StandardMaterial3D
			m.uv1_offset = Vector3(0.0, BOX_UV_POSE[k], 0.0)
			pasos.append(m)



		g.set_meta("caida", pasos)

		var t0: float =(d / SPOOK_R) * 0.16 + randf_range(0.0, 0.08)
		var tw: Tween = create_tween()
		tw.tween_interval(t0)
		var gastado: float = t0
		for k in pasos.size():
			var m: StandardMaterial3D = pasos[k]




			tw.tween_callback(_box_people_paint.bind(g, m))




			if k < pasos.size() - 1:
				var paso: float = randf_range(0.05, 0.09) if k % 2 == 0 \
						else randf_range(0.07, 0.13)
				tw.tween_interval(paso)
				gastado += paso





	calm_boxes(SPOOK_S)















func calm_boxes(retardo: float = 0.0) -> void:




	if not is_inside_tree():
		return
	_calm_gen += 1
	var gen: int = _calm_gen
	for e in _box_panes:
		var g: MeshInstance3D = SceneFade.vivo(e.get("gente")) as MeshInstance3D




		if not is_instance_valid(g) or not g.has_meta("caida") \
				or g.has_meta("palco_ido"):
			continue
		var pasos: Array = g.get_meta("caida")
		var tw: Tween = create_tween()

		tw.tween_interval(retardo + randf_range(0.0, 0.22))

		for k in range(pasos.size() - 2, -1, -1):
			var m: StandardMaterial3D = pasos[k]
			tw.tween_callback(func() -> void:
				if gen == _calm_gen:
					_box_people_paint(g, m))


			tw.tween_interval(randf_range(0.11, 0.2))
		tw.tween_callback(func() -> void:
			if gen != _calm_gen:
				return


			_box_people_paint(g, g.get_meta("fase") as StandardMaterial3D)
			_spook_t = 0.0)










	var pestillo: Tween = create_tween()
	pestillo.tween_interval(retardo + 0.22 + 0.2 * float(BOX_BAND_CAIDA.size()))
	pestillo.tween_callback(func() -> void:
		if gen == _calm_gen:
			_spook_t = 0.0)


























func _box_people_paint(g: MeshInstance3D, m: StandardMaterial3D) -> void:
	if m == null or not is_instance_valid(g) or g.has_meta("palco_ido"):
		return
	g.material_override = m



func box_pane_intact(i: int) -> bool:
	return i >= 0 and i < _box_panes.size() and int(_box_panes[i]["estado"]) < 2











func crack_box_pane(i: int, anicos: bool) -> bool:
	_box_panes_prime()
	if i < 0 or i >= _box_panes.size():
		return false
	var e: Dictionary = _box_panes[i]



	if not bool(e.get("rompible", true)):
		return false
	var estado: int = int(e["estado"])
	if estado >=(2 if anicos else 1):
		return false
	var nodo: MeshInstance3D = SceneFade.vivo(e["nodo"]) as MeshInstance3D
	if not is_instance_valid(nodo):
		return false
	e["estado"] = 2 if anicos else 1


	if e.has("marca") and is_instance_valid(e["marca"]):
		(e["marca"] as Node).queue_free()
	if anicos:





		nodo.visible = false
	var marca: MeshInstance3D = MeshInstance3D.new()
	var mq: QuadMesh = QuadMesh.new()
	mq.size = Vector2(float(e["w"]), float(e["h"]))
	marca.mesh = mq
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _pane_crack_tex(anicos, float(e["w"]), float(e["h"]))
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	marca.material_override = mat


	marca.position = nodo.position + Vector3(0.0, 0.0, 0.03)
	marca.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	nodo.get_parent().add_child(marca)
	e["marca"] = marca
	_pane_shards(i, anicos)


	spook_box(i)
	return true








func _pane_shards(i: int, anicos: bool) -> void:
	if i < 0 or i >= _box_panes.size():
		return
	var e: Dictionary = _box_panes[i]
	var nodo: MeshInstance3D = SceneFade.vivo(e["nodo"]) as MeshInstance3D
	if not is_instance_valid(nodo) or nodo.get_parent() == null:
		return
	var padre: Node = nodo.get_parent()
	var w: float = float(e["w"])
	var h: float = float(e["h"])
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.86, 0.94, 1.0, 0.85)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(nodo.get_instance_id())&2147483647
	var cuantos: int = 16 if anicos else 8
	for k in cuantos:
		var lasca: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()
		var lado: float = rng.randf_range(0.07, 0.2)
		q.size = Vector2(lado, lado * rng.randf_range(0.6, 1.6))
		lasca.mesh = q
		lasca.material_override = mat
		lasca.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var desde: Vector3 = nodo.position + Vector3(
			rng.randf_range(-0.3, 0.3) * w, rng.randf_range(-0.3, 0.3) * h, 0.04)
		lasca.position = desde
		lasca.rotation.z = rng.randf_range(0.0, TAU)
		padre.add_child(lasca)



		var cae: Vector3 = desde + Vector3(rng.randf_range(-0.7, 0.7),
			- rng.randf_range(1.6, 3.2), rng.randf_range(0.3, 1.1))
		var dur: float = rng.randf_range(0.75, 1.25)
		var tw: Tween = create_tween()
		tw.set_parallel(true)
		tw.tween_property(lasca, "position", cae, dur) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
		tw.tween_property(lasca, "rotation:z", lasca.rotation.z + rng.randf_range(-6.0, 6.0), dur)
		tw.chain().tween_callback(lasca.queue_free)




















func _pane_crack_tex(anicos: bool, w: float, h: float) -> ImageTexture:
	var key: String = "%s_%d_%d" % [anicos, roundi(w * 4.0), roundi(h * 4.0)]
	if _crack_tex.has(key):
		return _crack_tex[key]
	var px: float = 40.0
	var nw: int = clampi(roundi(w * px), 32, 256)
	var nh: int = clampi(roundi(h * px), 32, 256)
	var img: Image = Image.create(nw, nh, false, Image.FORMAT_RGBA8)
	img.fill(Color(0.0, 0.0, 0.0, 0.0))
	var luz: Color = Color(0.94, 0.98, 1.0, 0.95)
	if anicos:






		for y in nh:
			var v: float = float(y) / float(nh) * 2.0 - 1.0
			for x in nw:
				var u: float = float(x) / float(nw) * 2.0 - 1.0





				var borde: float = minf((1.0 - absf(u)) * w * 0.5,
					(1.0 - absf(v)) * h * 0.5)
				var ang: float = atan2(v, u)
				var m: float = 0.12 + 0.055 * sin(9.0 * ang) + 0.028 * sin(23.0 * ang + 1.1)
				if borde <= m:
					img.set_pixel(x, y, luz)
	else:
		var c: Vector2 = Vector2(float(nw), float(nh)) * 0.5
		var epx: float = float(nw) / maxf(w, 0.01)
		var epy: float = float(nh) / maxf(h, 0.01)
		var rng: RandomNumberGenerator = RandomNumberGenerator.new()
		rng.seed = 90210
		var aro: PackedVector2Array = PackedVector2Array()



		var picos: int = 11
		var radios: PackedFloat32Array = PackedFloat32Array()
		for k in picos:
			var a: float = TAU * float(k) / float(picos) + rng.randf_range(-0.16, 0.16)


			var rm: float = rng.randf_range(0.18, 0.42)
			radios.append(rm)
			var punta: Vector2 = c + Vector2(cos(a) * rm * epx, sin(a) * rm * epy)



			_img_line(img, c, punta, luz, 3)
			aro.append(c + Vector2(cos(a) * rm * 0.5 * epx, sin(a) * rm * 0.5 * epy))



		for k in aro.size():
			_img_line(img, aro[k], aro[(k + 1) % aro.size()],
				Color(luz.r, luz.g, luz.b, 0.8), 2)
		for k in picos:
			var a0: float = TAU * float(k) / float(picos)
			var a1: float = TAU * float((k + 1) % picos) / float(picos)
			var r0: float = radios[k] * 0.86
			var r1: float = radios[(k + 1) % picos] * 0.86
			_img_line(img, c + Vector2(cos(a0) * r0 * epx, sin(a0) * r0 * epy),
				c + Vector2(cos(a1) * r1 * epx, sin(a1) * r1 * epy),
				Color(luz.r, luz.g, luz.b, 0.55), 2)
	_crack_tex[key] = ImageTexture.create_from_image(img)
	return _crack_tex[key]





func _img_line(img: Image, a: Vector2, b: Vector2, col: Color, grosor: int = 1) -> void:
	var pasos: int = maxi(int(a.distance_to(b) * 2.0), 1)
	var r: int = maxi(grosor - 1, 0)
	for k in pasos + 1:
		var pt: Vector2 = a.lerp(b, float(k) / float(pasos))
		for dy in range(- r, r + 1):
			for dx in range(- r, r + 1):
				var x: int = clampi(int(round(pt.x)) + dx, 0, img.get_width() - 1)
				var y: int = clampi(int(round(pt.y)) + dy, 0, img.get_height() - 1)
				img.set_pixel(x, y, col)





func _box_people_texture() -> ImageTexture:
	if _box_people_tex != null:
		return _box_people_tex
	if _box_people_cache != null:
		_box_people_tex = _box_people_cache
		return _box_people_tex























	var w: int = 160
	var h: int = 44
	var img: Image = Image.create(w, h * BOX_BAND_CAIDA.size(), false,
		Image.FORMAT_RGBA8)




	img.fill(Color("6a7286"))
	for banda in range(BOX_BAND_CAIDA.size()):
		for x in range(w):
			for y in range(h - 7, h):
				img.set_pixel(x, banda * h + y, Color("39312c"))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 90210


	var trajes: Array[Color] = [Color("1a1e28"), Color("232a38"),
		Color("2b2330"), Color("14181f")]

	var laminas: Array = []
	for t in trajes:
		var fr: SpriteFrames = _build_fan_frames("fan_blue", {"kit": t})
		if fr == null or not fr.has_animation("idle"):
			continue
		var n: int = fr.get_frame_count("idle")
		if n <= 0:
			continue
		for k in n:
			laminas.append([_box_frame_img(fr, k), _box_frame_img(fr,(k + 1) % n)])
	if laminas.is_empty():


		_box_people_tex = ImageTexture.create_from_image(img)
		return _box_people_tex







	var paso: int = 18
	var x0: int = 4
	while x0 < w - 12:
		var par: Array = laminas[rng.randi() % laminas.size()]



		var bob: int = -1 if rng.randi() % 2 == 0 else 0



		var ola: int = 0 if rng.randi() % 2 == 0 else 1
		for banda in range(BOX_BAND_CAIDA.size()):
			var caida: float = float((BOX_BAND_CAIDA[banda] as Array)[ola])
			if caida < 0.0:
				continue
			var src: Image = par[mini(banda, 1)] as Image
			if src == null:
				continue
			var alto: int = int(float(src.get_height()) * 0.62)
			var busto: Image = src.get_region(Rect2i(0, 0, src.get_width(), alto))


			var dest_h: int = h - 18
			var dest_w: int = int(round(float(busto.get_width()) * float(dest_h) / float(alto)))
			busto.resize(dest_w, dest_h, Image.INTERPOLATE_NEAREST)









			var hunde: int = int(round(float(dest_h) * caida))
			var alto_v: int = dest_h - hunde
			if alto_v <= 1:
				continue
			var trozo: Image = busto if hunde == 0 \
					else busto.get_region(Rect2i(0, 0, dest_w, alto_v))
			img.blend_rect(trozo, Rect2i(0, 0, dest_w, alto_v),
				Vector2i(x0, banda * h + h - 3 - dest_h + hunde
					+(bob if banda == 1 else 0)))
		x0 += paso +(rng.randi() % 5)
	_box_people_tex = ImageTexture.create_from_image(img)
	_box_people_cache = _box_people_tex
	return _box_people_tex




func _box_frame_img(fr: SpriteFrames, k: int) -> Image:
	var tex: Texture2D = fr.get_frame_texture("idle", k)
	if tex == null:
		return null
	var fi: Image = tex.get_image()
	if fi == null:
		return null
	if fi.is_compressed():
		fi.decompress()
	if fi.get_format() != Image.FORMAT_RGBA8:
		fi.convert(Image.FORMAT_RGBA8)
	return fi







func _tick_box_people(delta: float) -> void:
	_spook_t = maxf(_spook_t - delta, 0.0)
	for e in _box_crowd:
		var t: float = float(e["t"]) - delta
		if t > 0.0:
			e["t"] = t
			continue


		e["t"] =(SPOOK_BLINK if _spook_t > 0.0 else BOX_BLINK) \
				* randf_range(0.75, 1.35)
		var b: bool = not bool(e["b"])
		e["b"] = b
		var m: StandardMaterial3D = e["mat"]
		m.uv1_offset = Vector3(0.0, BOX_UV_POSE[1 if b else 0], 0.0)
































func _stand_works(root: Node3D, length: float, scale: float, techo: bool = true) -> void:



	root.set_meta("obra", true)
	var span: float = length * 0.5
	var slope_h: float = _slope_h(scale)
	var s_nuevo: float = _works_new_slope(scale)


	var lotes: Dictionary = _works_lotes_vacios()


	_works_concrete(root, 0.0, span, slope_h * WORKS_BARE_FROM, slope_h, 0.06)

	_works_towers(root, span, _slope_top(scale), techo, lotes)


	var y_col: float = _works_frame(root, span, slope_h, s_nuevo, lotes)
	_works_crane(span, _talud_en(s_nuevo), y_col, lotes)

	_works_fence(span, lotes)
	_works_render(root, span)
	_works_lotes(root, lotes)




func _works_lotes_vacios() -> Dictionary:
	var lotes: Dictionary = {}
	for k in ["andamio", "rodapie", "tablas", "acero", "grua", "gris", "cables",
			"balizas", "malla"]:
		lotes[k] = []
	return lotes




func _works_lotes(root: Node3D, lotes: Dictionary) -> void:
	var caja: BoxMesh = _box(Vector3.ONE)
	_works_lote(root, caja, lotes["andamio"], _works_mat(Color("b9bfc7"), 0.5))
	_works_lote(root, caja, lotes["rodapie"], _works_mat(Color("e07b25")))
	_works_lote(root, caja, lotes["tablas"], _works_mat(Color("8a6a44"), 0.9))
	_works_lote(root, caja, lotes["acero"], _works_mat(Color("a8432b"), 0.7))
	_works_lote(root, caja, lotes["grua"], _works_mat(Color("e5b31d"), 0.55))
	_works_lote(root, caja, lotes["gris"], _works_mat(Color("a3a19a"), 0.9))
	_works_lote(root, caja, lotes["cables"], _works_mat(Color("33363a"), 0.6))


	var baliza: StandardMaterial3D = _works_mat(Color("ff3b2e"), 1.0)
	baliza.emission_enabled = true
	baliza.emission = Color("ff3b2e")
	baliza.emission_energy_multiplier = 2.5
	_works_lote(root, caja, lotes["balizas"], baliza)


	var malla: StandardMaterial3D = _works_mat(Color(0.17, 0.37, 0.27, 0.84), 1.0)
	malla.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	malla.cull_mode = BaseMaterial3D.CULL_DISABLED
	_works_lote(root, QuadMesh.new(), lotes["malla"], malla)















const WORKS_SITE_SPAN: float = 46.0

const WORKS_NEAR_MIN_LEN: float = 40.0

func _works_site(stands: Array) -> void:

	var prom: String = ""
	var roof_flag: int = -1
	var zc: float = -16.0
	for s in stands:
		if not _es_cabecera_cercana(s):
			continue
		zc =(s["pos"] as Vector3).z
		if String(s["prom"]) != "absent":
			prom = String(s["prom"])
			roof_flag = int(s.get("roof", -1))
			break
	var hay: bool = not prom.is_empty()
	var scale: float = _prom_scale(prom if hay else "low")
	var s_old: float = _slope_h(scale) if hay else 0.0
	var techo: bool = hay and _lleva_techo(roof_flag)
	var root: Node3D = Node3D.new()
	root.name = "ObraSitio"
	root.position = Vector3(0.0, 0.0, zc)
	root.set_meta("obra", true)
	root.set_meta("obra_x0", 0.0)
	_bowl_root().add_child(root)
	_register_occluder(root)
	var span: float = WORKS_SITE_SPAN
	var lotes: Dictionary = _works_lotes_vacios()
	if hay:
		_works_concrete(root, 0.0, span, s_old * WORKS_BARE_FROM, s_old, 0.06)
		_works_towers(root, span, _slope_top(scale), techo, lotes)
	var s_nuevo: float = _works_new_slope(scale)
	var y_col: float = _works_frame(root, span, s_old, s_nuevo, lotes)
	_works_crane(span, _talud_en(s_nuevo), y_col, lotes)


	_works_fence(span, lotes, 0.0, 2.4, 1.8)
	_works_render(root, span, 2.5, 1.2, 1.92)
	_works_lotes(root, lotes)





func _es_cabecera_cercana(s: Dictionary) -> bool:
	var c: Vector3 = s["pos"]
	return c.z < 0.0 and c.z > -25.0 and is_zero_approx(float(s["face"]))



func _works_site_cabe(stands: Array) -> bool:
	for s in stands:
		if _es_cabecera_cercana(s) and absf((s["pos"] as Vector3).x) < 20.0:
			return true
	return false




const WORKS_BARE_FROM: float = 0.42



const WORKS_STEP_M: float = 1.283

const WORKS_BAY: float = 7.5



const WORKS_CRANE_X: float = 13.0
const WORKS_JIB_L: float = 36.0
const WORKS_COUNTER_L: float = 11.0

const WORKS_TOWER_W: float = 2.6
const WORKS_TOWER_D: float = 1.6

var _works_concrete_tex: ImageTexture = null





func _talud_en(s: float) -> Vector2:
	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	return Vector2(STAND_SLOPE_FOOT_Y + s * cos(rad), STAND_SLOPE_FOOT_Z - s * sin(rad))



func _talud_y(z: float) -> float:
	return STAND_SLOPE_FOOT_Y +(STAND_SLOPE_FOOT_Z - z) / tan(deg_to_rad(STAND_SLOPE_DEG))







func _works_new_slope(scale: float) -> float:
	var arriba: int = clampi(div - 1, 1, 3)
	var s: float = float(DIV_STANDS[arriba]["slope"]) * maxf(scale, 0.6)
	return maxf(s, _slope_h(scale) + 6.0)


func _works_mat(c: Color, rough: float = 0.8) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = c
	m.roughness = rough
	return m




func _works_tube(a: Vector3, b: Vector3, grosor: float) -> Transform3D:
	var xf: Transform3D = _tube_xf(a, b)
	xf.basis = xf.basis.scaled_local(Vector3(grosor, 1.0, grosor))
	return xf




func _works_box(centro: Vector3, tam: Vector3) -> Transform3D:
	return Transform3D(Basis.IDENTITY.scaled(tam), centro)




func _works_lote(root: Node3D, mesh: Mesh, xfs: Array, mat: Material) -> void:
	if xfs.is_empty():
		return
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh


	mm.instance_count = xfs.size()
	for i in xfs.size():
		mm.set_instance_transform(i, xfs[i])
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = mat
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mmi)






func _works_concrete(root: Node3D, x0: float, x1: float, s0: float, s1: float,
		lift: float) -> void:
	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	var nrm: Vector3 = Vector3(0.0, sin(rad), cos(rad))
	var mid: Vector2 = _talud_en((s0 + s1) * 0.5)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _works_concrete_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 1.0
	mat.uv1_scale = Vector3((x1 - x0) / 4.0,(s1 - s0) / WORKS_STEP_M, 1.0)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(x1 - x0, s1 - s0)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = q
	mi.material_override = mat
	mi.position = Vector3((x0 + x1) * 0.5, mid.x, mid.y) + nrm * lift
	mi.rotation_degrees = Vector3(- STAND_SLOPE_DEG, 0.0, 0.0)
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mi)







func _works_concrete_texture() -> ImageTexture:
	if _works_concrete_tex != null:
		return _works_concrete_tex
	var w: int = 64
	var h: int = 16
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGB8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4721
	var cara: Color = Color("8e8a82")
	for y in h:
		for x in w:
			var c: Color = cara.darkened(rng.randf_range(0.0, 0.06))
			if y == 0:
				c = Color("b4b0a6")
			elif y <= 2:
				c = Color("57544f")
			img.set_pixel(x, y, c)

	for _i in 7:
		var xs: int = rng.randi_range(0, w - 1)
		for y in range(3, 3 + rng.randi_range(4, h - 3)):
			img.set_pixel(xs, y, img.get_pixel(xs, y).darkened(0.16))

	for _i in 3:
		var xr: int = rng.randi_range(2, w - 3)
		img.set_pixel(xr, 0, Color("8a4a2a"))
		img.set_pixel(xr, 1, Color("6e3a22"))
	_works_concrete_tex = ImageTexture.create_from_image(img)
	return _works_concrete_tex











func _works_towers(root: Node3D, span: float, top: Vector2, techo: bool,
		lotes: Dictionary) -> void:
	var x_min: float = 1.5
	var cfg: Dictionary = _scoreboard_cfg()
	if root.position.z < 0.0 and absf(root.position.x) < 20.0 \
			and bool(cfg["present"]) and not bool(cfg.get("manual", false)):
		x_min = 5.2 * float(cfg["scale"]) + 1.0
	var hw: float = WORKS_TOWER_W * 0.5
	var hd: float = WORKS_TOWER_D * 0.5


	var zc: float = _fan_row_at(1).y - 0.2
	var y_top: float = top.x + 1.2
	if techo:
		var t: float = clampf((zc + hd - top.y) / _roof_depth(top), 0.0, 1.0)
		y_top = lerpf(top.x + ROOF_RISE, top.x + ROOF_RISE - ROOF_DROP, t) - 1.25


	var y_first: float = _talud_y(zc - hd) + 1.6
	if y_top - y_first < 4.0:
		return
	var andamio: Array = lotes["andamio"]
	var tablas: Array = lotes["tablas"]
	var rodapie: Array = lotes["rodapie"]
	for n in 2:
		var tx: float = x_min + hw + 0.5 + float(n) * 6.0
		if tx + hw > span - 1.0:
			break

		for sx in [-1.0, 1.0]:
			for sz in [-1.0, 1.0]:
				var px: float = tx + sx * hw
				var pz: float = zc + sz * hd
				andamio.append(_works_tube(Vector3(px, _talud_y(pz), pz),
					Vector3(px, y_top + 0.9, pz), 0.11))
		var y_prev: float = _talud_y(zc + hd)
		var y_l: float = y_first
		var k: int = 0
		while y_l <= y_top:
			tablas.append(_works_box(Vector3(tx, y_l, zc),
				Vector3(WORKS_TOWER_W, 0.07, WORKS_TOWER_D)))
			rodapie.append(_works_box(Vector3(tx, y_l + 0.15, zc + hd + 0.03),
				Vector3(WORKS_TOWER_W, 0.26, 0.05)))

			for sz in [-1.0, 1.0]:
				andamio.append(_works_tube(Vector3(tx - hw, y_l + 0.9, zc + sz * hd),
					Vector3(tx + hw, y_l + 0.9, zc + sz * hd), 0.08))
			for sx in [-1.0, 1.0]:
				andamio.append(_works_tube(Vector3(tx + sx * hw, y_l, zc - hd),
					Vector3(tx + sx * hw, y_l, zc + hd), 0.08))


			var xa: float = tx - hw if k % 2 == 0 else tx + hw
			andamio.append(_works_tube(Vector3(xa, y_prev, zc + hd),
				Vector3(2.0 * tx - xa, y_l, zc + hd), 0.07))
			y_prev = y_l
			y_l += 2.0
			k += 1


		if n == 0 and k >= 3:
			var ya: float = y_first + 1.1
			var yb: float = y_top + 0.9
			lotes["malla"].append(_works_box(Vector3(tx,(ya + yb) * 0.5, zc + hd + 0.1),
				Vector3(WORKS_TOWER_W + 0.12, yb - ya, 1.0)))













func _works_frame(root: Node3D, span: float, slope_h: float, s_nuevo: float,
		lotes: Dictionary) -> float:
	var acero: Array = lotes["acero"]
	var top: Vector2 = _talud_en(slope_h)
	var nuevo: Vector2 = _talud_en(s_nuevo)
	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	var nrm: Vector3 = Vector3(0.0, sin(rad), cos(rad))
	var zb: float = nuevo.y - 0.6
	var zm: float =(top.y + nuevo.y) * 0.5
	var y_col: float = nuevo.x + 3.2
	var y_mid: float = nuevo.x * 0.5
	var xs: Array[float] = []
	var xi: float = 2.0
	while xi <= span - 1.0:
		xs.append(xi)
		xi += WORKS_BAY
	var n: int = xs.size()
	if n < 2:
		return y_col
	for i in n:
		var x: float = xs[i]

		var alzado: bool = i < n - 1
		acero.append(_works_tube(Vector3(x, 0.0, zb),
			Vector3(x, y_col if alzado else y_col * 0.55, zb), 0.5))
		if not alzado:
			continue


		var a: Vector2 = _talud_en(slope_h - 0.3)
		acero.append(_works_tube(Vector3(x, a.x, a.y) - nrm * 0.35,
			Vector3(x, nuevo.x, nuevo.y) - nrm * 0.35, 0.45))
		acero.append(_works_tube(Vector3(x, 0.0, zm),
			Vector3(x, _talud_y(zm) - 0.85, zm), 0.42))
	for i in n - 1:
		var xa: float = xs[i]
		var xb: float = xs[i + 1]
		var lleno: bool = i + 1 < n - 1
		acero.append(_works_tube(Vector3(xa, y_mid, zb), Vector3(xb, y_mid, zb), 0.36))
		if lleno:
			acero.append(_works_tube(Vector3(xa, y_col, zb), Vector3(xb, y_col, zb), 0.36))
			acero.append(_works_tube(Vector3(xa, nuevo.x, nuevo.y),
				Vector3(xb, nuevo.x, nuevo.y), 0.3))

		if i % 2 == 0:
			acero.append(_works_tube(Vector3(xa, 0.6, zb), Vector3(xb, y_mid, zb), 0.2))
			acero.append(_works_tube(Vector3(xb, 0.6, zb), Vector3(xa, y_mid, zb), 0.2))



	var d: float = _roof_depth(nuevo)
	var cerchas: int = mini(n - 1, 3)
	for i in cerchas:
		var x: float = xs[i]
		var panos: int = 4
		for k in panos:
			var f0: float = float(k) / float(panos)
			var f1: float = float(k + 1) / float(panos)
			var z0: float = zb + d * f0
			var z1: float = zb + d * f1
			var t0: float = y_col + 0.4 - 1.4 * f0
			var t1: float = y_col + 0.4 - 1.4 * f1
			var b0: float = y_col - 2.2 + 0.9 * f0
			var b1: float = y_col - 2.2 + 0.9 * f1
			acero.append(_works_tube(Vector3(x, t0, z0), Vector3(x, t1, z1), 0.3))
			acero.append(_works_tube(Vector3(x, b0, z0), Vector3(x, b1, z1), 0.26))
			acero.append(_works_tube(Vector3(x, t0, z0), Vector3(x, b1, z1), 0.16))
			acero.append(_works_tube(Vector3(x, b1, z1), Vector3(x, t1, z1), 0.16))
	if cerchas >= 2:
		var x_a: float = xs[0]
		var x_b: float = xs[cerchas - 1]
		acero.append(_works_tube(Vector3(x_a, y_col - 1.0, zb + d),
			Vector3(x_b, y_col - 1.0, zb + d), 0.3))
		acero.append(_works_tube(Vector3(x_a, y_col - 0.3, zb + d * 0.5),
			Vector3(x_b, y_col - 0.3, zb + d * 0.5), 0.22))


	var hecho: int = mini(2, n - 2)
	_works_concrete(root, 0.3, xs[hecho], slope_h, s_nuevo, 0.06)
	if hecho + 1 < n - 1:
		_works_concrete(root, xs[hecho], xs[hecho + 1], slope_h,
			slope_h +(s_nuevo - slope_h) * 0.5, 0.06)
	return y_col







func _works_crane(span: float, nuevo: Vector2, y_col: float, lotes: Dictionary) -> void:
	var grua: Array = lotes["grua"]
	var gris: Array = lotes["gris"]
	var cables: Array = lotes["cables"]
	var xc: float = clampf(WORKS_CRANE_X, 5.0, maxf(span - 3.0, 5.0))
	var zc: float = nuevo.y - 3.5
	var yj: float = y_col + 3.5
	var mw: float = 0.8


	var h_mast: float = yj - 0.9
	var tramos: int = maxi(int(round(h_mast / 1.6)), 2)
	var seg: float = h_mast / float(tramos)
	var esq: Array[Vector2] = [Vector2(- mw, - mw), Vector2(mw, - mw), Vector2(mw, mw),
		Vector2(- mw, mw)]
	for c in esq:
		grua.append(_works_tube(Vector3(xc + c.x, 0.0, zc + c.y),
			Vector3(xc + c.x, h_mast, zc + c.y), 0.2))
	for k in tramos:
		var y0: float = seg * float(k)
		var y1: float = y0 + seg
		for f in 4:
			var a: Vector2 = esq[f]
			var b: Vector2 = esq[(f + 1) % 4]
			grua.append(_works_tube(Vector3(xc + a.x, y0, zc + a.y),
				Vector3(xc + b.x, y0, zc + b.y), 0.1))
			if (k + f) % 2 == 0:
				grua.append(_works_tube(Vector3(xc + a.x, y0, zc + a.y),
					Vector3(xc + b.x, y1, zc + b.y), 0.09))
			else:
				grua.append(_works_tube(Vector3(xc + b.x, y0, zc + b.y),
					Vector3(xc + a.x, y1, zc + a.y), 0.09))

	grua.append(_works_box(Vector3(xc, yj - 0.45, zc), Vector3(2.4, 0.9, 2.4)))
	gris.append(_works_box(Vector3(xc + 0.3, yj - 1.25, zc + mw + 0.75),
		Vector3(1.3, 1.6, 1.3)))

	var hz: float = 0.6
	var ht: float = 1.3
	var x_root: float = xc - mw
	var x_tip: float = xc - WORKS_JIB_L
	var panos: int = maxi(int(round((x_root - x_tip) / 2.0)), 1)
	var paso: float =(x_root - x_tip) / float(panos)
	for s in [-1.0, 1.0]:
		grua.append(_works_tube(Vector3(x_root, yj, zc + s * hz),
			Vector3(x_tip, yj, zc + s * hz), 0.17))
	grua.append(_works_tube(Vector3(x_root, yj + ht, zc),
		Vector3(x_tip + paso * 0.5, yj + ht, zc), 0.17))
	for k in panos:
		var xa: float = x_root - paso * float(k)
		var xb: float = xa - paso
		var xm: float =(xa + xb) * 0.5
		for s in [-1.0, 1.0]:
			grua.append(_works_tube(Vector3(xa, yj, zc + s * hz),
				Vector3(xm, yj + ht, zc), 0.08))
			grua.append(_works_tube(Vector3(xm, yj + ht, zc),
				Vector3(xb, yj, zc + s * hz), 0.08))
		grua.append(_works_tube(Vector3(xb, yj, zc - hz), Vector3(xb, yj, zc + hz), 0.08))

	var x_back: float = xc + WORKS_COUNTER_L
	for s in [-1.0, 1.0]:
		grua.append(_works_tube(Vector3(xc + mw, yj + 0.1, zc + s * hz),
			Vector3(x_back, yj + 0.1, zc + s * hz), 0.17))
	var xk: float = xc + mw + 2.0
	while xk < x_back:
		grua.append(_works_tube(Vector3(xk, yj + 0.1, zc - hz),
			Vector3(xk, yj + 0.1, zc + hz), 0.08))
		xk += 2.0
	for j in 3:
		gris.append(_works_box(Vector3(x_back - 0.55 - 0.95 * float(j), yj - 0.9, zc),
			Vector3(0.85, 2.3, 1.7)))

	var apex: Vector3 = Vector3(xc, yj + 5.0, zc)
	for c in esq:
		grua.append(_works_tube(Vector3(xc + c.x * 0.9, yj + 0.1, zc + c.y * 0.9), apex,
			0.15))
	cables.append(_works_tube(apex, Vector3(xc - WORKS_JIB_L * 0.62, yj + ht, zc), 0.07))
	cables.append(_works_tube(apex, Vector3(x_back, yj + 0.1, zc), 0.07))


	var xt: float = xc - WORKS_JIB_L * 0.34
	grua.append(_works_box(Vector3(xt, yj - 0.25, zc), Vector3(1.2, 0.45, 1.5)))
	var yl: float = nuevo.x + 1.2
	var yh: float = yl + 2.6
	for s in [-1.0, 1.0]:
		cables.append(_works_tube(Vector3(xt + s * 0.25, yj - 0.5, zc),
			Vector3(xt + s * 0.25, yh + 0.45, zc), 0.06))
		cables.append(_works_tube(Vector3(xt, yh - 0.4, zc),
			Vector3(xt + s * 2.8, yl + 0.28, zc), 0.05))
	gris.append(_works_box(Vector3(xt, yh, zc), Vector3(0.6, 0.8, 0.5)))
	lotes["acero"].append(_works_box(Vector3(xt, yl, zc), Vector3(7.0, 0.5, 0.32)))
	lotes["balizas"].append(_works_box(apex + Vector3(0.0, 0.3, 0.0), Vector3.ONE * 0.45))
	lotes["balizas"].append(_works_box(Vector3(x_tip, yj + ht + 0.3, zc),
		Vector3.ONE * 0.45))






func _works_fence(span: float, lotes: Dictionary, y0: float = BOWL_WALL_H,
		alto: float = 2.0, zf: float = 0.75) -> void:
	var cables: Array = lotes["cables"]
	var fx0: float = 0.4
	var fx1: float = span - 0.4
	var tramos: int = maxi(int(ceil((fx1 - fx0) / 3.4)), 1)
	for k in tramos + 1:
		var x: float = lerpf(fx0, fx1, float(k) / float(tramos))
		cables.append(_works_tube(Vector3(x, y0, zf), Vector3(x, y0 + alto + 0.05, zf),
			0.08))
	cables.append(_works_tube(Vector3(fx0, y0 + alto, zf), Vector3(fx1, y0 + alto, zf),
		0.06))
	lotes["malla"].append(_works_box(Vector3((fx0 + fx1) * 0.5, y0 + alto * 0.5,
		zf + 0.05), Vector3(fx1 - fx0, alto - 0.1, 1.0)))













const WORKS_RENDER_PX: Vector2i = Vector2i(120, 18)

const WORKS_RENDER_CREST: Array[String] = [
	".OOOOO.",
	"OAABAAO",
	"OAABAAO",
	"OAABAAO",
	".OABAO.",
	"..OAO..",
	"...O...",
]

func _works_render(root: Node3D, span: float, x_min: float = -1.0,
		y_c: float = BOWL_WALL_H + 1.0, z: float = 0.87) -> void:
	var x0: float = maxf(2.5, _wall_trophy_half + 0.6) if x_min < 0.0 else x_min
	var x1: float = minf(x0 + 12.0, span - 1.0)
	if x1 - x0 < 5.0:
		return
	var w: float = x1 - x0
	var h: float = w * float(WORKS_RENDER_PX.y) / float(WORKS_RENDER_PX.x)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _works_render_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 1.0
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(w, h)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.name = "CartelGradaNueva"
	mi.mesh = q
	mi.material_override = mat


	mi.position = Vector3((x0 + x1) * 0.5, y_c, z)
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mi)


func _works_render_texture() -> ImageTexture:
	var w: int = WORKS_RENDER_PX.x
	var h: int = WORKS_RENDER_PX.y
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGB8)
	var seat_a: Color = _seat_tone(_club_a)
	var seat_b: Color = _seat_tone(_club_b)

	if Vector3(seat_a.r, seat_a.g, seat_a.b).distance_to(
			Vector3(seat_b.r, seat_b.g, seat_b.b)) < 0.08:
		seat_b = seat_a.darkened(0.28)

	for y in h:
		var cielo: Color = Color("5f9ed6").lerp(Color("d9eaf5"),
			clampf(float(y) / 6.0, 0.0, 1.0))
		for x in w:
			img.set_pixel(x, y, cielo)


	var gx0: int = 8
	var gx1: int = w - 8
	for x in range(gx0 - 2, gx1 + 2):
		img.set_pixel(x, 5, Color("e6e9ee"))
		img.set_pixel(x, 6, Color("3b404a"))
	for y in range(7, 14):
		for x in range(gx0, gx1):
			var c: Color = seat_a if y % 2 == 1 else seat_b
			if y == 10:
				c = Color("f2d27a") if (x * 7) % 5 == 0 else Color("222833")
			elif (x - gx0) % 12 == 11:
				c = Color("2b3038")
			img.set_pixel(x, y, c)

	var cx0: int = w / 2 - 3
	for fy in WORKS_RENDER_CREST.size():
		var fila: String = WORKS_RENDER_CREST[fy]
		for fx in fila.length():
			var ch: String = fila[fx]
			if ch == ".":
				continue
			var tinta: Color = Color("efe9dc")
			if ch == "A":
				tinta = _club_a
			elif ch == "B":
				tinta = _club_b
			img.set_pixel(cx0 + fx, 7 + fy, tinta)

	for tx in [3, w - 4]:
		for y in range(3, 14):
			img.set_pixel(tx, y, Color("8d939c"))
		for dx in range(-1, 2):
			img.set_pixel(tx + dx, 2, Color("fff3c4"))

	for x in w:
		img.set_pixel(x, 14, front_wall_color())
		for y in range(15, h):
			img.set_pixel(x, y, Color("3f8f4a") if (x / 10) % 2 == 0 else Color("4a9c54"))

	var marco: Color = Color("15181e")
	for x in w:
		img.set_pixel(x, 0, marco)
		img.set_pixel(x, h - 1, marco)
	for y in h:
		img.set_pixel(0, y, marco)
		img.set_pixel(w - 1, y, marco)
	return ImageTexture.create_from_image(img)







const ROOF_DEPTH: float = 16.0
const ROOF_DROP: float = 4.2
const ROOF_RISE: float = 1.6
const ROOF_BEAMS: int = 7

















func _roof_depth(top: Vector2) -> float:
	return clampf(1.0 - top.y, 4.0, ROOF_DEPTH)






func _lleva_techo(roof_flag: int) -> bool:
	return roof_flag == 1 or (roof_flag < 0 and bool(_stands_cfg()["roof"]))


func _roof_slab_of(length: float, top: Vector2) -> Dictionary:
	if footprint == "azteca_coloso":
		return AztecaDetail.losa(length, top)

	var back: Vector2 = Vector2(top.x + ROOF_RISE, top.y)
	var front: Vector2 = Vector2(back.x - ROOF_DROP, top.y + _roof_depth(top))
	var mid: Vector2 =(back + front) * 0.5
	return {
		"pos": Vector3(0.0, mid.x, mid.y),
		"pitch": atan2(back.x - front.x, front.y - back.y),
		"size": Vector3(length + _roof_overhang(), 0.5,(front - back).length()),

		"low": front.x - 0.26,
	}








func _roof_overhang() -> float:
	return 0.6 if RING_FOOTPRINTS.has(footprint) else 5.0


func _stand_roof(root: Node3D, length: float, top: Vector2) -> void:
	var losa: Dictionary = _roof_slab_of(length, top)
	var back: Vector2 = Vector2(top.x + ROOF_RISE, top.y)
	var front: Vector2 = Vector2(back.x - ROOF_DROP, top.y + _roof_depth(top))
	var mid: Vector2 = Vector2(losa["pos"].y, losa["pos"].z)
	var span: float = float(losa["size"].z)
	var pitch: float = float(losa["pitch"])

	var under: StandardMaterial3D = StandardMaterial3D.new()


	under.albedo_color = Color("0d1018") if _big_night else Color("23262e")



	if _roof_white():
		under.albedo_color = Color("c9ccd4")
	under.roughness = 1.0
	var slab: MeshInstance3D = MeshInstance3D.new()
	var slab_mesh: BoxMesh = BoxMesh.new()
	slab_mesh.size = Vector3(length + _roof_overhang(), 0.5, span)
	slab.mesh = slab_mesh
	slab.material_override = under
	slab.position = Vector3(0.0, mid.x, mid.y)
	slab.rotation = Vector3(pitch, 0.0, 0.0)
	root.add_child(slab)


	preload("res://features/stadium/stadium_roof_detail.gd").construir(
		root, slab, length, back, front, div, _roof_white(), _big_night,
		SenaClub.chapa(self))
	_finish_lamps.append(FinishDetail.luminarias(slab, length, span))
	if not _roof_white():
		_caracter.cubierta(root, length, back, front)
	root.set_meta("acabado_cubierta", true)





	_snow_cap(slab, Vector3(0.0, 0.28, 0.0),
		Vector3(length + _roof_overhang(), 0.06, span))


	var beam_mat: StandardMaterial3D = StandardMaterial3D.new()
	beam_mat.albedo_color = Color("32363f")
	beam_mat.roughness = 1.0
	FinishDetail.acabado(beam_mat, "metal", div)
	for i in ROOF_BEAMS:
		var t: float =(float(i) + 0.5) / float(ROOF_BEAMS)
		var beam: MeshInstance3D = MeshInstance3D.new()
		var bm: BoxMesh = BoxMesh.new()
		bm.size = Vector3(0.5, 0.5, span * 0.96)
		beam.mesh = bm
		beam.material_override = beam_mat
		beam.position = Vector3(lerpf(- length * 0.5, length * 0.5, t),
			mid.x - 0.5, mid.y)
		beam.rotation = Vector3(pitch, 0.0, 0.0)
		beam.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(beam)










	var fascia_mat: StandardMaterial3D = StandardMaterial3D.new()
	fascia_mat.albedo_color = Color("d7dde8")
	fascia_mat.roughness = 0.85
	if _big_night:




		var ring: Color = _night_accent()
		fascia_mat.albedo_color = ring.lerp(Color("f2f6ff"), 0.45)
		fascia_mat.emission_enabled = true
		fascia_mat.emission = ring
		fascia_mat.emission_energy_multiplier = NIGHT_RING_EMISSION * _night_pomp
		_ring_mats.append(fascia_mat)
	var fascia: MeshInstance3D = MeshInstance3D.new()
	var fm: BoxMesh = BoxMesh.new()
	fm.size = Vector3(length + _roof_overhang(), 1.1, 0.5)
	fascia.mesh = fm
	fascia.material_override = fascia_mat
	fascia.position = Vector3(0.0, front.x - 0.3, front.y)
	root.add_child(fascia)







	_roof_name_sign(root, length, front)


	_roof_flags(root, length, front)
	_roof_posts(root, length, front)
	_caracter.coronacion(root, length, front, _pitch_seed_club(), _club_a,
		_big_night or _comp == "nat" or _roof_white())


	var strut_mat: StandardMaterial3D = StandardMaterial3D.new()
	strut_mat.albedo_color = Color("2b2f38")
	strut_mat.roughness = 1.0
	for px in [- length * 0.5 + 1.0, 0.0, length * 0.5 - 1.0]:
		var strut: MeshInstance3D = MeshInstance3D.new()
		var sm: BoxMesh = BoxMesh.new()
		sm.size = Vector3(0.5, back.x, 0.5)
		strut.mesh = sm
		strut.material_override = strut_mat
		strut.position = Vector3(px, back.x * 0.5, back.y - 0.6)
		strut.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(strut)







func _roof_name_sign(root: Node3D, length: float, front: Vector2) -> void:









	var obligado: bool = _rotulo_obligado()
	if not obligado and (_club_tier_v != "alto" or div > 2 or _big_night):
		return



	if not obligado and bool(FOOTPRINT_CFG.get(footprint, {}).get("banderas", false)):
		return






	if absf(root.position.x) > 20.0:
		return
	if root.position.z >= 0.0 and not (obligado and root.position.z > FIELD_DEPTH):
		return
	var texto: String = _pixel_safe(_venue_name())
	if texto.length() < 4:
		return
	var px: int = 5
	var w: int = PixelText.text_width(texto, px) + px * 4
	var h: int = PixelText.GLYPH_H * px + px * 4
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	PixelText.draw_text(img, px * 2, px * 2, texto, Color(0.93, 0.92, 0.88), px)
	var tex: ImageTexture = ImageTexture.create_from_image(img)


	var sign_h: float =(1.3 if obligado else 0.9) * float(h) / float(PixelText.GLYPH_H * px)
	var sign_w: float = sign_h * float(w) / float(h)
	var w_max: float = length * 0.72
	if sign_w > w_max:
		sign_w = w_max
		sign_h = sign_w * float(h) / float(w)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.roughness = 1.0
	var sign: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(sign_w, sign_h)
	sign.mesh = q
	sign.material_override = mat
	sign.position = Vector3(0.0, front.x - 0.3 - 0.55 - sign_h * 0.5, front.y + 0.28)
	sign.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	sign.name = "NombreEstadio"
	root.add_child(sign)







func _roof_flags(root: Node3D, length: float, front: Vector2) -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("banderas", false)):
		return
	if root.position.z >= 0.0 or absf(root.position.x) > 20.0:
		return



	if _rotulo_obligado():
		return
	for i in 7:
		var fx: float = lerpf(- length * 0.38, length * 0.38, float(i) / 6.0)
		var base_c: Color = _club_a if i % 2 == 0 else _club_b
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = base_c.lerp(_seat_tone(base_c), 0.3)
		mat.roughness = 1.0
		var flag: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()
		q.size = Vector2(1.7, 7.5)
		flag.mesh = q
		flag.material_override = mat
		flag.position = Vector3(fx, front.x - 0.3 - 4.3, front.y + 0.34)
		flag.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		flag.name = "BanderaCanto%d" % i
		root.add_child(flag)








func _roof_posts(root: Node3D, length: float, front: Vector2) -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("postes", false)):
		return
	if root.position.z >= 0.0 or absf(root.position.x) > 20.0:
		return
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("ded8c8")
	mat.roughness = 0.95
	for i in 6:
		var px: float = lerpf(- length * 0.42, length * 0.42, float(i) / 5.0)
		var post: MeshInstance3D = MeshInstance3D.new()
		var bm: BoxMesh = BoxMesh.new()
		bm.size = Vector3(0.55, front.x, 0.55)
		post.mesh = bm
		post.material_override = mat
		post.position = Vector3(px, front.x * 0.5, front.y + 0.12)
		post.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		post.name = "PosteTecho%d" % i
		root.add_child(post)







func _venue_name() -> String:
	if not home_club.is_empty():



		if home_club == Career.stadium_rename_club \
				and not Career.stadium_rename.is_empty():
			return Career.stadium_rename

		var marca: String = Career.naming_de(home_club)
		if not marca.is_empty():
			return marca
		return Stadiums.of_id(home_club)
	if att_override >= 0.0:
		return ""
	return Competitions.venue_of(GameState.current_fixture())





















func _honor_surname() -> String:
	if Career.stadium_rename.is_empty() or Career.stadium_rename_club.is_empty():
		return ""
	if home_club.is_empty() and att_override >= 0.0:
		return ""
	if _comp == "nat" or not _neutral_venue().is_empty():
		return ""
	if _pitch_seed_club() != Career.stadium_rename_club:
		return ""
	var parts: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	var surname: String = parts[parts.size() - 1] if parts.size() > 0 \
			else Career.player_name
	return _pixel_safe(surname).substr(0, 12)






func _naming_aqui() -> String:
	if Career.club_naming.is_empty():
		return ""
	if home_club.is_empty() and att_override >= 0.0:
		return ""
	if _comp == "nat" or not _neutral_venue().is_empty():
		return ""
	return Career.naming_de(_pitch_seed_club())



func _naming_enfado_aqui() -> bool:
	if _naming_aqui().is_empty():
		return false
	return Career.naming_enfado(_pitch_seed_club())




func _rotulo_obligado() -> bool:
	return not _honor_surname().is_empty() or not _naming_aqui().is_empty()






func _pixel_safe(texto: String) -> String:
	var up: String = texto.to_upper()
	var mapa: Dictionary = {"Á": "A", "À": "A", "Â": "A", "Ä": "A", "Ã": "A",
		"_": " ",
		"É": "E", "È": "E", "Ê": "E", "Ë": "E", "Í": "I", "Ì": "I", "Î": "I",
		"Ï": "I", "Ó": "O", "Ò": "O", "Ô": "O", "Ö": "O", "Õ": "O", "Ú": "U",
		"Ù": "U", "Û": "U", "Ü": "U", "Ñ": "N", "Ç": "C", "ß": "SS", "-": " "}



	var out: String = ""
	for i in up.length():
		var c: String = up[i]
		if mapa.has(c):
			c = String(mapa[c])
		var u: int = c.unicode_at(0) if c.length() == 1 else 0
		if c == " " or (u >= 48 and u <= 57) or (u >= 65 and u <= 90) \
				or c.length() > 1:
			out += c

	while out.contains("  "):
		out = out.replace("  ", " ")
	return out.strip_edges()














func _seat_texture() -> ImageTexture:
	if footprint == "cu_olimpico":
		return CuDetail.graderio()

	if footprint in ["bombonera", "monumental_river", "camp_nou"]:
		return BomboneraDetail.butacas()
	if _seat_tex != null:
		return _seat_tex









	var club: String = _pitch_seed_club()
	var clave: String = "%s|%s|%s|%d|%s" % [_club_a.to_html(), _club_b.to_html(),
		_big_night, clampi(div, 1, 3), club]
	if _seat_tex_cache.has(clave):
		_seat_tex = _seat_tex_cache[clave]
		return _seat_tex
	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGB8)
	var base: Color = Color("262b36").lerp(_club_a, 0.12).darkened(0.1)
	var seat_a: Color = _seat_tone(_club_a)
	var seat_b: Color = _seat_tone(_club_b)






	if _big_night:
		base = NIGHT_SEAT.darkened(0.25)
		seat_a = NIGHT_SEAT
		seat_b = NIGHT_SEAT.darkened(0.22)



	var la: Color = seat_a.srgb_to_linear()
	var lb: Color = seat_b.srgb_to_linear()
	if Vector3(la.r, la.g, la.b).distance_to(Vector3(lb.r, lb.g, lb.b)) < 0.08:
		seat_b = seat_a.darkened(0.28)
	img.fill(base)






	var pat: int = _seat_pattern()
	for y in 64:
		for x in 64:

			if x % 16 >= 14 or y % 6 >= 3:
				continue
			var seat_i: int =(x / 4) +(y / 6)
			var second: bool = seat_i % 2 == 1






			match pat:
				SEAT_BANDS:
					second =((x / 32) % 2) == 1
				SEAT_HOOPS:
					second =((y / 32) % 2) == 1
				SEAT_DIAMOND:
					second = abs(x - 32) + abs(y - 32) < 25
				SEAT_CHEVRON:
					second = posmod(y - abs(x - 32), 32) < 16
				SEAT_SOLID:
					second = false
				_:
					pass
			var c: Color = seat_b if second else seat_a







			var wear: float = SEAT_WEAR[clampi(div, 1, 3)]
			if wear > 0.0:


				var srng: float = _seat_hash_de(club, x / 4, y / 6)
				if srng < wear * 0.42:
					c = base
				elif srng < wear:
					c = c.lerp(Color(0.62, 0.6, 0.56), 0.45)

			if c != base:
				var cambio: float = float(posmod(hash(club + str(Vector2i(x / 16, y / 24))), 5))
				if not _big_night and cambio == 0.0:
					c = c.lightened(0.1)
				if y % 6 == 0:
					c = c.lightened(0.1)
				elif y % 6 == 2:
					c = c.darkened(0.23)
				if x % 4 == 3:
					c = base
			img.set_pixel(x, y, c)
	_seat_tex = ImageTexture.create_from_image(img)


	if _seat_tex_cache.size() >= 32:
		_seat_tex_cache.clear()
	_seat_tex_cache[clave] = _seat_tex
	return _seat_tex


static var _seat_tex_cache: Dictionary = {}




const SEAT_WEAR: Array[float] = [0.0, 0.0, 0.1, 0.3]






func _seat_hash(sx: int, sy: int) -> float:
	return _seat_hash_de(_pitch_seed_club(), sx, sy)



static func _seat_hash_de(club: String, sx: int, sy: int) -> float:
	return float(posmod(hash(club + str(Vector2i(sx, sy))), 1000)) / 1000.0





enum {SEAT_CHECKER, SEAT_BANDS, SEAT_HOOPS, SEAT_SOLID, SEAT_DIAMOND, SEAT_CHEVRON}








func _seat_pattern() -> int:
	if _big_night:
		return SEAT_CHECKER
	var club: String = _pitch_seed_club()
	if club.is_empty():
		return SEAT_CHECKER


	match posmod(hash(club + "seatpat"), 8):
		0, 1, 2:
			return SEAT_CHECKER
		3:
			return SEAT_BANDS
		4:
			return SEAT_HOOPS
		5:
			return SEAT_DIAMOND
		6:
			return SEAT_CHEVRON
		_:
			return SEAT_SOLID
















func front_wall_color() -> Color:


	if _big_night:
		return Color("22262e")



	return Color("3a3f4a").lerp(_seat_tone(_club_a), 0.85)












const COMP_ACCENT_BY_STADIUM: Dictionary = {
	"ucl": Color("2e5cff"), "eul": Color("ff7a1a"),
	"conf": Color("29c2c9"), "cwc": Color("e8b53c"),
}

func _night_accent() -> Color:
	if _comp == "nat":


		var nat: Dictionary = Nations.as_team(
			Nations.id_for_country(GameState.home_country()))
		if not nat.is_empty() and (nat["kit"] as Color).v > 0.05:
			return nat["kit"]
		return Color("e8b53c")




	if Continental.es_americana(_comp):
		return Competitions.COMP_ACCENT.get(Continental.marca(_comp), Color("e8b53c"))

	if _comp == CopaLigas.COMP:
		return Competitions.COMP_ACCENT.get(CopaLigas.COMP, Color("e8b53c"))
	return COMP_ACCENT_BY_STADIUM.get(_comp, Color("e8b53c"))



func _night_banner() -> String:
	match _comp:
		"ucl": return "CHAMPIONS"
		"eul": return "EUROPA"
		"conf": return "CONFERENCE"
		"cwc": return "MUNDIAL"


		"lib", "sud", "cca", "ace", "ac2", "caf", "cf2", "ofc":

			return I18n.t(Competitions.comp_name(Continental.marca(_comp)))

		"recopa", "intercont", "supereuropa", "superafrica":
			return I18n.t(Competitions.comp_name(Supercopas.marca(_comp)))


		"ligas":
			var fx: Dictionary = GameState.current_fixture()
			if String(fx.get("comp", "")) == CopaLigas.COMP:
				return I18n.t(Competitions.name_of(fx))
			return I18n.t(Competitions.comp_name(CopaLigas.COMP))
		"nat":

			var nat: Dictionary = Nations.as_team(
				Nations.id_for_country(GameState.home_country()))
			return String(nat.get("abbrev", "MUNDIAL")) if not nat.is_empty() else "MUNDIAL"
	return "EUROPA"


func _seat_tone(c: Color) -> Color:





	var out: Color = Color.from_hsv(c.h, minf(c.s, 0.62) * 0.9,
		clampf(c.v * 0.55, 0.15, 0.45))
	return out





const WORD_SB_GAP: float = 0.5









func _seat_word_texture(text: String, paint: bool = false) -> ImageTexture:
	var px: int = 6
	var w: int = PixelText.text_width(text, px) + px * 4
	var h: int = PixelText.GLYPH_H * px + px * 4
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var ink: Color = _club_a if _club_a.v >= _club_b.v else _club_b

	ink = Color.from_hsv(ink.h, minf(ink.s, 0.5), clampf(ink.v * 1.25, 0.62, 0.9))


	if footprint == "camp_nou":
		ink = CampNouDetail.AMARILLO
	if paint:




		ink = Color(0.9, 0.89, 0.86).lerp(ink, 0.22)
	PixelText.draw_text(img, px * 2, px * 2, text, ink, px)
	return ImageTexture.create_from_image(img)




















const AISLE_RAIL_H: float = 0.95















const AISLE_RAIL_W: float = 0.09
const AISLE_RAIL_COL: Color = Color("cdd6de")
const AISLE_RAIL_METALLIC: float = 1.0
const AISLE_RAIL_ROUGH: float = 0.26



const AISLE_POST_W: float = 0.045


















const AISLE_SEG_M: float = 1.8
const AISLE_SEG_GAP: float = 1.2



const AISLE_VETO_PAD: float = 0.6













const AISLE_RAIL_X: float = 0.4


const WALKER_RAIL_OFF: float = 0.12




var _aisle_rails_n: int = 0



var _aisle_skip_palcos: int = 0
var _aisle_skip_tifo: int = 0

func aisle_rails_n() -> int:
	return _aisle_rails_n

func aisle_skips() -> Vector2i:
	return Vector2i(_aisle_skip_palcos, _aisle_skip_tifo)






func _aisle_rails(root: Node3D, aisle_xs: Array[float], scale: float,
		slope_c: Vector2, slope_rot: Vector3) -> void:
	var run: float = _slope_h(scale)
	if run < AISLE_SEG_M:
		return
	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	var nrm: Vector3 = Vector3(0.0, sin(rad), cos(rad))



	var vetos: Array[Vector2] = []





	var palcos: Array[Vector2] = []




	if _box_band_y.x < INF:
		palcos.append(Vector2(
			slope_c.x + _box_band_y.x * cos(rad) - AISLE_VETO_PAD,
			slope_c.x + _box_band_y.y * cos(rad) + AISLE_VETO_PAD))
		vetos.append(palcos[0])


	for pano in _tifo_nodes:
		if not is_instance_valid(pano) or not root.is_ancestor_of(pano):
			continue
		var alto: float = 0.0
		if pano.mesh is QuadMesh:
			alto =(pano.mesh as QuadMesh).size.y * pano.scale.y
		var py: float = root.to_local(pano.global_position).y
		vetos.append(Vector2(py - alto * 0.5 - AISLE_VETO_PAD,
			py + alto * 0.5 + AISLE_VETO_PAD))
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = AISLE_RAIL_COL


	mat.metallic = AISLE_RAIL_METALLIC
	mat.metallic_specular = 0.9
	mat.roughness = AISLE_RAIL_ROUGH



	var paso: float = AISLE_SEG_M + AISLE_SEG_GAP
	var n: int = maxi(int(run / paso), 1)

	var sobra: float = run -(float(n) * paso - AISLE_SEG_GAP)
	var y0: float = - run * 0.5 + sobra * 0.5 + AISLE_SEG_M * 0.5

	var ejes_x: Array[float] = []
	for ax in aisle_xs:
		ejes_x.append(ax - AISLE_RAIL_X)
		ejes_x.append(ax + AISLE_RAIL_X)
	for ex in ejes_x:
		var eje: Node3D = Node3D.new()
		eje.position = Vector3(ex, slope_c.x, slope_c.y) + nrm * AISLE_RAIL_H
		eje.rotation_degrees = slope_rot
		root.add_child(eje)
		var postes: Array[Transform3D] = []
		var puestos: int = 0
		for i in n:
			var ty: float = y0 + float(i) * paso
			if root.has_meta("accesos_grada"):
				var segment: Rect2 = Rect2(ex - 0.12, ty - AISLE_SEG_M * 0.5,
					0.24, AISLE_SEG_M)
				var enters: bool = false
				for opening in root.get_meta("accesos_grada"):
					if (opening as Rect2).grow(0.35).intersects(segment):
						enters = true
						break
				if enters:
					continue








			var wy: float = slope_c.x + nrm.y * AISLE_RAIL_H + ty * cos(rad)
			var media: float = AISLE_SEG_M * 0.5 * cos(rad)
			var vetado: bool = false
			for v in vetos:
				if wy + media > v.x and wy - media < v.y:
					vetado = true


					if palcos.has(v):
						_aisle_skip_palcos += 1
					else:
						_aisle_skip_tifo += 1
					break
			if vetado:
				continue
			var tramo: MeshInstance3D = MeshInstance3D.new()
			var rb: BoxMesh = BoxMesh.new()
			rb.size = Vector3(AISLE_RAIL_W, AISLE_SEG_M, AISLE_RAIL_W)
			tramo.mesh = rb
			tramo.material_override = mat
			tramo.position = Vector3(0.0, ty, 0.0)
			tramo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			eje.add_child(tramo)








			for lado in [-1.0, 1.0]:
				postes.append(Transform3D(Basis.IDENTITY, Vector3(0.0,
					ty + lado * AISLE_SEG_M * 0.44, - AISLE_RAIL_H * 0.5)))
			puestos += 1
		if puestos == 0:
			eje.queue_free()
			continue
		var pm: MultiMesh = MultiMesh.new()
		pm.transform_format = MultiMesh.TRANSFORM_3D
		var pb: BoxMesh = BoxMesh.new()
		pb.size = Vector3(AISLE_POST_W, AISLE_POST_W, AISLE_RAIL_H)
		pb.material = mat
		pm.mesh = pb

		pm.instance_count = postes.size()
		for i2 in postes.size():
			pm.set_instance_transform(i2, postes[i2])
		var pmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		pmi.multimesh = pm
		pmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		eje.add_child(pmi)
		_aisle_rails_n += puestos



































const SECTOR_H: float = 0.62
const SECTOR_Y: float = 1.82
const SECTOR_Z: float = 1.03


const SECTOR_PAD: float = 0.9

func _build_sector_numbers(root: Node3D, length: float, con_marcas: bool) -> void:
	if length < 20.0:
		return



	var sections: int = maxi(int(round(length / 13.0)), 1)
	if sections < 2:
		return



	var base: int = 1 + 10 *(int(absf(hash("%s|%d|%d" % [_pitch_seed_club(),
		int(round(root.position.x)), int(round(root.position.z))]))) % 9)

	var veto_centro: float = 0.0
	if con_marcas:

		veto_centro = maxf(_wall_trophy_half, CREST_M * 0.5)
	if div >= 3 and not _club_abbrev.is_empty():

		veto_centro = maxf(veto_centro, minf(length * 0.2, 13.0) * 0.5)
	var pancartas: Array[Vector4] = _wall_banner_spots(root.position, length)
	var puestos: int = 0
	for i in sections:
		var x: float = length *((float(i) + 0.5) / float(sections) - 0.5)
		if absf(x) < veto_centro + SECTOR_PAD:
			continue
		var tapa: bool = false
		for bp in pancartas:
			if absf(x - bp.x) < bp.z * 0.5 + SECTOR_PAD:
				tapa = true
				break
		if tapa:
			continue
		var tex: ImageTexture = _seat_word_texture(str(base + i), true)
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_texture = tex
		mat.albedo_color = Color(0.95, 0.94, 0.92)
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
		mat.alpha_scissor_threshold = 0.5
		mat.roughness = 1.0






		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		var q: QuadMesh = QuadMesh.new()
		q.size = Vector2(SECTOR_H * float(tex.get_width()) / float(tex.get_height()),
			SECTOR_H)
		var cifra: MeshInstance3D = MeshInstance3D.new()
		cifra.mesh = q
		cifra.material_override = mat
		cifra.position = Vector3(x, SECTOR_Y, SECTOR_Z)
		cifra.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(cifra)
		puestos += 1
	_sector_n += puestos











var _sector_n: int = 0

func sector_n() -> int:
	return _sector_n












func _seat_word(root: Node3D, length: float, scale: float,
		works: bool = false, texto: String = "", nombre: String = "SiglaButacas",
		x_off: float = 0.0) -> void:
	var honor: bool = not texto.is_empty()
	if texto.is_empty():
		texto = _club_abbrev
	if texto.is_empty():
		return
	if div >= 3:


		_painted_word(root, length, texto,
			"ApellidoMuro" if honor else "SiglaMuro", x_off)
		return
	var tex: ImageTexture = _seat_word_texture(texto)
	var slope_c: Vector2 = _slope_center(scale)
	var slope_h: float = _slope_h(scale)


	var word_w: float = minf(length * 0.5, 40.0) if honor else minf(length * 0.34, 26.0)


	if works:
		word_w = minf(word_w, length * 0.5 * 0.8)
	var word_h: float = word_w * float(tex.get_height()) / float(tex.get_width())
	if word_h > slope_h * 0.42:
		word_h = slope_h * 0.42
		word_w = word_h * float(tex.get_width()) / float(tex.get_height())
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.roughness = 1.0
	var word: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(word_w, word_h)
	word.mesh = q
	word.material_override = mat


	var up: float = slope_h * 0.5 - word_h * 0.6
















	var curva: bool = root.position.z < 0.0 and absf(root.position.x) < 20.0
	var techo: float = _tifo_ceiling_y() if curva else INF
	if is_finite(techo):
		var up_max: float =(techo - slope_c.x) / cos(deg_to_rad(STAND_SLOPE_DEG)) \
				- word_h * 0.5 - WORD_SB_GAP
		up = minf(up, up_max)


	var up_min: float = - slope_h * 0.5 + word_h * 0.5
	if up < up_min:
		return





	if honor and root.position.z > FIELD_DEPTH and absf(root.position.x) < 20.0:
		up = minf(up, 0.0)
	word.position = Vector3((- length * 0.25 if works else 0.0) + x_off,
			slope_c.x, slope_c.y) \
					+ Vector3(0.0, up * cos(deg_to_rad(STAND_SLOPE_DEG)) + 0.035,
			- up * sin(deg_to_rad(STAND_SLOPE_DEG)) + 0.02)
	word.rotation_degrees = Vector3(- STAND_SLOPE_DEG, 0.0, 0.0)
	word.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	word.name = nombre
	root.add_child(word)











const CREST_PX: int = 192




const CREST_M: float = 4.5

func _build_crest(root: Node3D, length: float) -> void:
	var club: String = _pitch_seed_club()
	if club.is_empty() or length < 60.0:
		return
	var team: Dictionary = Teams.by_id(club)
	if team.is_empty():
		return
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(CREST_PX, CREST_PX)
	vp.transparent_bg = true


	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(CREST_PX, CREST_PX)
	crest.set_team(team)
	vp.add_child(crest)
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(CREST_M, CREST_M)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	quad.material_override = mat
	quad.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



	quad.position = Vector3(0.0, 1.6, 1.03)
	root.add_child(quad)
	quad.set_meta("muro_media", Vector2(CREST_M, CREST_M) * 0.5)
	_muro_club.append(quad)





















const WALL_TROPHY_W: float = 1.15
const WALL_TROPHY_H: float = 1.55



const WALL_TROPHY_Y: float = 1.12



const WALL_TROPHY_X0: float = 3.05
const WALL_TROPHY_STEP: float = 1.42



const WALL_TROPHY_MAX: int = 4

















const WALL_TROPHY_ART: Dictionary = {



	"champions": [
		"..#######..", "..#######..", ".#.#####.#.", "#..#####..#", "#..#####..#",
		"#...###...#", ".#..###..#.", "..#.###.#..", "....###....", "....###....",
		"....###....", "...#####...", "..#######..",
	],



	"liga": [
		"...........", "...........", "#.........#", "###########", "###########",
		"#.#######.#", "..#######..", "...#####...", "....###....", "....###....",
		"...#####...", ".#########.", "###########",
	],


	"copa": [
		".....#.....", "....###....", "..#######..", "..#######..", "..#.....#..",
		"#.#######.#", "#.#######.#", "#..#####..#", ".#..###..#.", "....###....",
		"...#####...", "..#######..", "###########",
	],



	"clubes": [
		"...#####...", ".##.....##.", ".#.......#.", "#...###...#", "#..#####..#",
		"#..#####..#", "#...###...#", ".#.......#.", ".##.....##.", "...#####...",
		"....###....", "..#######..", "###########",
	],

	"europa": [
		"...........", "###########", "###########", ".#########.", ".#########.",
		"..#######..", "...#####...", "....###....", "....###....", "....###....",
		"...#####...", "..#######..", "###########",
	],



	"conference": [
		".#########.", ".#########.", "..#######..", "..#######..", "...#####...",
		"...#####...", "....###....", "....###....", "....###....", "....###....",
		"....###....", "...#####...", "..#######..",
	],



	"libertadores": [
		".....#.....", "....###....", ".....#.....", "....###....", "..#######..",
		".#.#####.#.", ".#.#####.#.", "...#####...", "....###....", ".....#.....",
		"....###....", "..#######..", "..#######..",
	],

	"sudamericana": [
		"...#####...", "..#######..", ".#########.", ".#########.", "..#######..",
		"...#####...", "...#...#...", "..#.....#..", "...#...#...", "..#.....#..",
		"..#.....#..", ".#########.", ".#########.",
	],


	"concacaf": [
		"..#######..", "###########", "#..#####..#", "#..#####..#", "###.###.###",
		"....###....", ".....#.....", ".....#.....", "....###....", "...#####...",
		"..#######..", ".#########.", "###########",
	],

	"oriente": [
		".....#.....", "....###....", "...#####...", "..#######..", "...#####...",
		"..#######..", ".#########.", ".#########.", "..#######..", "...#####...",
		"....###....", "...#####...", "..#######..",
	],

	"sol": [
		"#....#....#", ".#.#####.#.", "..#######..", "###########", "..#######..",
		".#.#####.#.", "#....#....#", ".....#.....", ".....#.....", "....###....",
		"....###....", "..#######..", ".#########.",
	],

	"atlas": [
		".....#.....", "....###....", ".....#.....", "....###....", "....###....",
		"...#####...", "...#####...", "..#######..", "..#######..", ".#########.",
		".#########.", "###########", "###########",
	],

	"baobab": [
		".#########.", "###########", ".#.#.#.#.#.", "..#.#.#.#..", "...#####...",
		"...#####...", "..#######..", "..#######..", "..#######..", "...#####...",
		"...#####...", "..#######..", ".#########.",
	],




	"coral": [
		".#...#..#..", "..#.#..#.#.", "#..#.#.##..", ".#.#..##..#", "..##..#..#.",
		"...#.#.##..", "....###....", "....###....", "...#####...", "#..#####..#",
		"###########", ".#########.", "..#######..",
	],
}


const WALL_TROPHY_GOLD: Color = Color("e6b83c")
const WALL_TROPHY_GOLD_D: Color = Color("a67c1e")



const WALL_TROPHY_SILVER: Color = Color("d0d5de")
const WALL_TROPHY_SILVER_D: Color = Color("878d9c")


const WALL_TROPHY_PLATA: Array[String] = ["champions", "europa", "conference",
	"libertadores", "sudamericana"]



var _wall_trophy_tex: Dictionary = {}




var _wall_trophy_half: float = 0.0


func _build_wall_trophies(root: Node3D, length: float) -> void:


	if div >= 3 or length < 60.0:
		return
	var club: String = _pitch_seed_club()



	if club.is_empty() or Teams.by_id(club).is_empty():
		return
	var kinds: Array = Career.last_titles_of(club, WALL_TROPHY_MAX)
	if kinds.is_empty():
		return






	var grande: String = ""
	var copas: Array[String] = Continental.copas_de_pais(Teams.country_of(club))
	if not copas.is_empty():
		grande = Continental.marca(copas[0])
	for i in kinds.size():
		var kind: String = String(kinds[i])
		if kind == "champions" and not grande.is_empty():
			kind = grande
		var tex: ImageTexture = _wall_trophy_texture(kind)
		if tex == null:
			continue




		var lado: float = 1.0 if i % 2 == 0 else -1.0
		var col: int = i / 2
		var x: float = lado *(WALL_TROPHY_X0 + float(col) * WALL_TROPHY_STEP)
		var placa: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()
		q.size = Vector2(WALL_TROPHY_W, WALL_TROPHY_H)
		placa.mesh = q
		var mat: StandardMaterial3D = StandardMaterial3D.new()




		mat.albedo_texture = tex
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		mat.roughness = 1.0
		placa.material_override = mat

		placa.position = Vector3(x, WALL_TROPHY_Y, 1.02)
		placa.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(placa)

		placa.set_meta("muro_media", Vector2(WALL_TROPHY_W, WALL_TROPHY_H) * 0.5)
		_muro_club.append(placa)
	var cols: int =(kinds.size() + 1) / 2
	_wall_trophy_half = WALL_TROPHY_X0 + float(cols - 1) * WALL_TROPHY_STEP \
			+ WALL_TROPHY_W * 0.5 + 0.5




func _wall_trophy_texture(kind: String) -> ImageTexture:
	if _wall_trophy_tex.has(kind):
		return _wall_trophy_tex[kind]
	var art: Array = WALL_TROPHY_ART.get(kind, [])
	if art.is_empty():
		return null
	var w: int = 30
	var h: int = 40


	var home: Dictionary = _host_kit_now()
	var kit: Color = home["kit"]



	var lona: Color = kit.darkened(0.66)
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGB8)
	for y in h:
		for x in w:
			var borde: bool = x == 0 or x == w - 1 or y == 0 or y == h - 1
			var marco: bool = x == 1 or x == w - 2 or y == 1 or y == h - 2
			if borde:
				img.set_pixel(x, y, Color("14161c"))
			elif marco:



				img.set_pixel(x, y, WALL_TROPHY_GOLD)
			else:
				img.set_pixel(x, y, lona)



	var aw: int = String(art[0]).length()
	var ah: int = art.size()
	var px: int = 2
	var x0: int =(w - aw * px) / 2
	var y0: int = 5


	var plata: bool = WALL_TROPHY_PLATA.has(kind)
	var metal: Color = WALL_TROPHY_SILVER if plata else WALL_TROPHY_GOLD
	var metal_d: Color = WALL_TROPHY_SILVER_D if plata else WALL_TROPHY_GOLD_D
	for pasada in 2:
		var tinta: Color = metal_d if pasada == 0 else metal
		var off: int = 1 if pasada == 0 else 0
		for ay in ah:
			var linea: String = String(art[ay])
			for ax in aw:
				if linea[ax] != "#":
					continue
				for dy in px:
					for dx in px:
						var xx: int = x0 + ax * px + dx + off
						var yy: int = y0 + ay * px + dy + off
						if xx < 2 or yy < 2 or xx >= w - 2 or yy >= h - 2:
							continue
						img.set_pixel(xx, yy, tinta)



	for y in range(h - 5, h - 3):
		for x in range(4, w - 4):
			img.set_pixel(x, y, WALL_TROPHY_GOLD)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_wall_trophy_tex[kind] = tex
	return tex







func _painted_word(root: Node3D, length: float, texto: String = "",
		nombre: String = "SiglaMuro", x_off: float = 0.0) -> void:
	var tex: ImageTexture = _seat_word_texture(
		texto if not texto.is_empty() else _club_abbrev, true)
	var word_w: float = minf(length * 0.2, 13.0)
	var word_h: float = word_w * float(tex.get_height()) / float(tex.get_width())

	if word_h > 1.5:
		word_h = 1.5
		word_w = word_h * float(tex.get_width()) / float(tex.get_height())
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.albedo_color = Color(0.95, 0.94, 0.92)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.roughness = 1.0
	var word: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(word_w, word_h)
	word.mesh = q

	word.position = Vector3(x_off, 1.15, 1.02)
	word.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	word.material_override = mat
	word.name = nombre
	root.add_child(word)







func _worn_wall_texture() -> ImageTexture:
	if _worn_wall_tex != null:
		return _worn_wall_tex
	var w: int = 48
	var h: int = 32
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGB8)






	var base: Color = Color("4b4e54").lerp(_seat_tone(_club_a), 0.34)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20260725

	for y in h:
		for x in w:
			var n: float = rng.randf()
			var c: Color = base.darkened(n * 0.22) if n > 0.35 else base.lightened(n * 0.1)
			img.set_pixel(x, y, c)


	var rust: Color = Color("6f4327")
	for _s in 3:
		var sx: int = rng.randi_range(3, w - 4)
		var y0: int = rng.randi_range(0, 6)
		var wob: float = 0.0
		for y in range(y0, h):
			wob += rng.randf_range(-0.5, 0.5)
			var cx: int = clampi(sx + int(round(wob)), 0, w - 1)
			var fade: float = 1.0 - float(y - y0) / float(h - y0)
			var strength: float = 0.55 * fade
			for dx in range(-1, 2):
				var px: int = clampi(cx + dx, 0, w - 1)
				var edge: float = strength *(1.0 if dx == 0 else 0.45)
				img.set_pixel(px, y, img.get_pixel(px, y).lerp(rust, edge))
	_worn_wall_tex = ImageTexture.create_from_image(img)
	return _worn_wall_tex





var _porra_frames_home: SpriteFrames
var _porra_frames_away: SpriteFrames





func _porra_flag(root: Node3D, pos: Vector3, is_home: bool,
		rng: RandomNumberGenerator) -> AnimatedSprite3D:
	var frames: SpriteFrames = _porra_frames(is_home)
	var flag: AnimatedSprite3D = AnimatedSprite3D.new()
	flag.sprite_frames = frames



	flag.pixel_size = rng.randf_range(1.34, 1.66) / 32.0
	flag.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	flag.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	flag.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	flag.position = pos + Vector3(rng.randf_range(-0.22, 0.22),
		0.3 + rng.randf_range(-0.1, 0.26), -0.06)


	var tx: Texture2D = frames.get_frame_texture("flutter", 0)
	if tx != null:
		var media: Vector2 = Vector2(float(tx.get_width()), float(tx.get_height())) \
				* flag.pixel_size * 0.5
		var puno: Vector3 = root.transform * flag.position
		for k in 3:
			if _crosses_roof(puno, root.transform *(flag.position + Vector3(
					lerpf(- media.x, media.x, float(k) * 0.5), media.y, 0.0))):
				flag.free()
				return null
	root.add_child(flag)
	flag.play("flutter")
	flag.speed_scale = rng.randf_range(0.8, 1.25)
	flag.frame = rng.randi_range(0, 3)
	return flag















func _flare_zone(pos: Vector3) -> float:
	var is_end: bool = absf(pos.x) < 20.0
	var w: float = 0.3
	if is_end:
		w = 1.0
	elif absf(pos.z - 52.5) > 45.0:
		w = 0.7
	if pos.z < 0.0:
		w *= 1.25
	return w









func _flare_smoke(root: Node3D, pos: Vector3, is_home: bool,
		rng: RandomNumberGenerator) -> Array[GeometryInstance3D]:
	if _flare_meshes.is_empty():
		for m in FLARE_MESH_SIZES:
			var q: QuadMesh = QuadMesh.new()
			q.size = Vector2(m, m)
			_flare_meshes.append(q)








	var slot: int = 1 if is_home else 0
	var pm: Resource = _flare_proc[slot]
	if pm == null:
		var spark: Color = _flare_spark(is_home)
		var humo: Color = _smoke_from_kit(spark)
		pm = Particulas.proceso()
		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
		pm.emission_sphere_radius = 0.12
		pm.direction = Vector3(0.0, 1.0, 0.0)
		pm.spread = 22.0

		pm.gravity = Vector3(0.3, 1.4, 0.0)
		pm.initial_velocity_min = 0.4
		pm.initial_velocity_max = 1.0
		pm.scale_min = 0.4
		pm.scale_max = 0.7

		var sc: Curve = Curve.new()
		sc.add_point(Vector2(0.0, 0.4))
		sc.add_point(Vector2(1.0, 1.9))



		pm.scale_curve = Particulas.curva(sc)

		var grad: Gradient = Gradient.new()
		grad.set_color(0, Color(spark.r, spark.g, spark.b, 0.8))
		grad.set_color(1, Color(0.55, 0.55, 0.58, 0.0))
		grad.add_point(0.35, Color(0.62, 0.62, 0.64, 0.42))
		pm.color_ramp = Particulas.rampa(grad)
		_flare_proc[slot] = pm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	mat.vertex_color_use_as_albedo = true


	mat.albedo_texture = _smoke_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	var smoke: GeometryInstance3D = Particulas.nodo()




	smoke.draw_pass_1 = _flare_meshes[rng.randi() % _flare_meshes.size()]
	smoke.amount = rng.randi_range(18, 34)

	smoke.lifetime = rng.randf_range(3.6, 5.6)
	smoke.fixed_fps = 18
	smoke.preprocess = 4.5
	smoke.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	smoke.visibility_aabb = AABB(Vector3(-2.0, 0.0, -1.0), Vector3(4.0, 11.0, 3.0))
	smoke.process_material = pm
	smoke.material_override = mat
	smoke.position = pos + Vector3(0.0, 0.2, -0.05)
	root.add_child(smoke)



	return [smoke, _flare_veil(root, pos, slot)]


















func _flare_spark(is_home: bool) -> Color:
	var side: Dictionary = _host_kit_now() if is_home else _visitor_kit_now()
	var spark: Color = side["kit"]
	var flag: Image = _flag_of(_side_team(is_home))
	if flag != null:
		spark = _flag_colors(flag)[0]
	return spark












func _smoke_from_kit(c: Color) -> Color:
	var lum: float = c.get_luminance()
	var t: float = clampf((0.72 - lum) / 0.72, 0.0, 0.62)
	return c.lerp(Color(0.9, 0.9, 0.92), t)




















func _smoke_texture() -> ImageTexture:
	if _smoke_tex != null:
		return _smoke_tex
	var n: int = 32
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20260905
	var c: float =(float(n) - 1.0) * 0.5
	for y in n:
		for x in n:

			var dx: float =(float(x) - c) / c
			var dy: float =(float(y) - c) / c
			var r: float = sqrt(dx * dx + dy * dy)
			var a: float = pow(clampf(1.0 - r * r, 0.0, 1.0), 1.6)
			a *= 1.0 + rng.randf_range(-0.18, 0.18)
			img.set_pixel(x, y, Color(1.0, 1.0, 1.0, clampf(a, 0.0, 1.0)))
	_smoke_tex = ImageTexture.create_from_image(img)
	return _smoke_tex


func _flare_veil(root: Node3D, pos: Vector3, slot: int) -> GeometryInstance3D:
	if _veil_mesh == null:
		_veil_mesh = QuadMesh.new()
		_veil_mesh.size = Vector2(3.6, 2.4)
	var pm: Resource = _veil_proc[slot]
	if pm == null:
		pm = Particulas.proceso()
		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
		pm.emission_box_extents = Vector3(1.6, 0.6, 0.3)
		pm.direction = Vector3(1.0, 0.35, 0.0)
		pm.spread = 12.0

		pm.gravity = Vector3(0.85, 0.1, 0.0)
		pm.initial_velocity_min = 0.1
		pm.initial_velocity_max = 0.35
		pm.scale_min = 0.9
		pm.scale_max = 1.6
		var sc: Curve = Curve.new()
		sc.add_point(Vector2(0.0, 0.7))
		sc.add_point(Vector2(1.0, 2.3))

		pm.scale_curve = Particulas.curva(sc)







		var velo: Color = _smoke_from_kit(_flare_spark(slot == 1)).lerp(
			Color(0.61, 0.61, 0.64), 0.34)
		var grad: Gradient = Gradient.new()
		grad.set_color(0, Color(0.6, 0.6, 0.63, 0.0))
		grad.set_color(1, Color(0.58, 0.58, 0.62, 0.0))
		grad.add_point(0.3, Color(0.62, 0.62, 0.65, 0.13))
		grad.add_point(0.65, Color(0.6, 0.6, 0.64, 0.09))
		pm.color_ramp = Particulas.rampa(grad)
		_veil_proc[slot] = pm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	mat.vertex_color_use_as_albedo = true


	mat.albedo_texture = _smoke_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	var veil: GeometryInstance3D = Particulas.nodo()
	veil.amount = 10
	veil.lifetime = 18.0
	veil.fixed_fps = 10
	veil.preprocess = 18.0
	veil.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	veil.visibility_aabb = AABB(Vector3(-4.0, 0.0, -2.0), Vector3(22.0, 12.0, 5.0))
	veil.process_material = pm
	veil.draw_pass_1 = _veil_mesh
	veil.material_override = mat
	veil.position = pos + Vector3(0.0, 1.6, 0.15)
	root.add_child(veil)
	return veil


func _porra_frames(is_home: bool) -> SpriteFrames:
	if is_home and _porra_frames_home != null:
		return _porra_frames_home
	if not is_home and _porra_frames_away != null:
		return _porra_frames_away



	var side: Dictionary = _host_kit_now() if is_home else _visitor_kit_now()
	var kit: Color = side["kit"]
	var kit2: Color = side["kit2"]



	var flag: Image = _flag_of(_side_team(is_home))
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("flutter")
	frames.set_animation_loop("flutter", true)
	frames.set_animation_speed("flutter", 6.0)
	for f in 4:
		var img: Image = Image.create(28, 26, false, Image.FORMAT_RGBA8)
		img.fill(Color(0, 0, 0, 0))

		for y in range(4, 26):
			img.set_pixel(2, y, Color("3b3f47"))
			img.set_pixel(3, y, Color("2a2d33"))






		var cloth_w: int = 15 if flag != null else 22
		for cx in range(4, 4 + cloth_w):
			var wave: int = int(round(sin(float(cx) * 0.55 + float(f) * PI * 0.5) * 1.6))
			for cy in range(3, 13):
				var yy: int = cy + wave
				if yy < 0 or yy >= 26:
					continue
				if flag != null:
					img.set_pixel(cx, yy, _flag_pick(flag,
						(float(cx) - 4.0 + 0.5) / float(cloth_w),
						(float(cy) - 3.0 + 0.5) / 10.0))
					continue
				var stripe: bool = cy == 6 or cy == 7
				img.set_pixel(cx, yy, kit2 if stripe else kit)
		frames.add_frame("flutter", ImageTexture.create_from_image(img))
	if is_home:
		_porra_frames_home = frames
	else:
		_porra_frames_away = frames
	return frames



func _make_banner_mat(text: String) -> StandardMaterial3D:





	var home: Dictionary = _host_kit_now()
	var kit: Color = home["kit"]
	var kit2: Color = home["kit2"]




	var flag: Image = _flag_of(_side_team(true))
	if flag != null:
		var fc: Array[Color] = _flag_colors(flag)
		kit = fc[0]
		kit2 = fc[1]
	var img: Image = Image.create(64, 16, false, Image.FORMAT_RGB8)
	for y in 16:
		for x in 64:
			if x == 0 or x == 63 or y == 0 or y == 15:
				img.set_pixel(x, y, Color("14161c"))
			elif flag != null:
				img.set_pixel(x, y, _flag_pick(flag,(float(x) - 1.0 + 0.5) / 62.0,
					(float(y) - 1.0 + 0.5) / 14.0))
			else:
				var stripe: bool =(x / 8) % 2 == 0
				img.set_pixel(x, y, kit.darkened(0.25) if stripe else kit.darkened(0.45))



	var px: int = 2
	var w: int = PixelText.text_width(text, px)
	if w > 60:
		px = 1
		w = PixelText.text_width(text, px)
	var w_y: int =(16 - PixelText.GLYPH_H * px) / 2


	if flag != null:
		for dx in [-1, 1]:
			for dy in [-1, 1]:
				PixelText.draw_text(img,(64 - w) / 2 + dx, w_y + dy, text,
					Color(0.95, 0.94, 0.9), px)
		PixelText.draw_text(img,(64 - w) / 2, w_y, text, Color(0.1, 0.1, 0.12), px)
	else:
		PixelText.draw_text(img,(64 - w) / 2, w_y, text, kit2, px)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 1.0
	return mat









func _home_div() -> int:
	return GameState.home_div()






















func _resolve_struct_div(alive: int) -> int:




	if not home_club.is_empty() or att_override >= 0.0:
		return alive
	var f: Dictionary = GameState.current_fixture()
	if String(f.get("comp", "")) == "nat" or Competitions.is_neutral(f):
		return alive
	return struct_div_for(GameState.host_id(), alive)






static func struct_div_for(club: String, alive: int) -> int:
	if club.is_empty():
		return alive
	if Teams.by_id(club).is_empty() or Teams.base_div(club) <= 0:
		return alive




	var base: int = clampi(GameState.stadium_built_div(club), 1, 3)
	if base < alive:
		return base
	if base > alive and int(GameState.last_div_moves.get(club, 0)) == -1:
		return mini(alive + 1, 3)
	return alive




func _stands_cfg() -> Dictionary:
	var base: Dictionary = DIV_STANDS.get(clampi(div, 1, 3), DIV_STANDS[3])


	var merged: Dictionary = base









	if not _big_night and absf(_size_f) > 0.001:
		var tf: float = 1.0 + 0.14 * _size_f
		merged = base.duplicate()
		merged["slope"] = float(base["slope"]) * tf
		merged["rows"] = maxi(int(round(float(base["rows"]) * tf)), 4)
	if _big_night and NIGHT_STANDS.has(_comp):
		merged = merged.duplicate() if merged != base else base.duplicate()
		for k in NIGHT_STANDS[_comp]:
			merged[k] = NIGHT_STANDS[_comp][k]



	var fp: Dictionary = FOOTPRINT_CFG.get(footprint, {})
	if fp.has("stands"):
		var out: Dictionary = merged.duplicate()
		for k in fp["stands"]:
			out[k] = fp["stands"][k]
		return out
	return merged



func _dugout_cfg() -> Dictionary:
	return DIV_DUGOUT.get(clampi(div, 1, 3), DIV_DUGOUT[3])










func _season_cold() -> float:
	return Weather.cold(_season_t) if _season_t > 0.0 else 0.0















func _pitch_cfg() -> Dictionary:
	var base: Dictionary = DIV_PITCH.get(clampi(div, 1, 3), DIV_PITCH[3])
	if _season_t <= 0.0:
		return base

	var t: float = _season_t
	var season: float =(t / 0.65) if t <= 0.65 else (1.0 -(t - 0.65) * 1.4)
	season = clampf(season, 0.0, 1.0)

	var bite: float = [0.0, 0.45, 0.75, 1.0][clampi(div, 1, 3)] * season
	var out: Dictionary = base.duplicate()
	out["wear"] = clampf(float(base["wear"]) + 0.45 * bite, 0.0, 1.0)
	out["mud"] = clampf(float(base["mud"]) + 0.4 * bite, 0.0, 1.0)
	out["dull"] = clampf(float(base["dull"]) + 0.18 * bite, 0.0, 0.6)

	out["contrast"] = clampf(float(base["contrast"]) - 0.35 * bite, 0.0, 1.0)
	out["dirty_lines"] = clampf(float(base["dirty_lines"]) + 0.25 * bite, 0.0, 1.0)




	out["bald"] = clampf(float(base["bald"]) *(1.0 + 0.45 * bite), 0.0, 1.0)
	return out









func _ads_cfg() -> Dictionary:
	var d: int = _league_div if _league_div > 0 else div
	return DIV_ADS.get(clampi(d, 1, 3), DIV_ADS[3])



func _scoreboard_cfg() -> Dictionary:


	var categoria: int = div
	if OPEN_END_FOOTPRINTS.has(footprint) and not _near_end_built() and _league_div > 0:
		categoria = mini(div, _league_div)
	var base: Dictionary = DIV_SCOREBOARD.get(clampi(categoria, 1, 3), DIV_SCOREBOARD[3])

	if categoria == 3 and footprint == "campo_coches" and not _near_end_built():
		base = base.duplicate()
		base["present"] = true
		base["scale"] = 0.55




	var fp: Dictionary = FOOTPRINT_CFG.get(footprint, {})
	if not (fp.has("sb_scale") or fp.has("sb_emission") or fp.has("sb_present")):
		return base
	var out: Dictionary = base.duplicate()

	if fp.has("sb_present"):
		out["present"] = bool(fp["sb_present"])
	if fp.has("sb_scale"):
		out["scale"] = float(fp["sb_scale"])
	if fp.has("sb_emission"):
		out["emission"] = float(fp["sb_emission"])
	return out





func _skyline_cfg() -> Dictionary:
	var categoria: int = div if _venue_environment.is_empty() else EntornoRecinto.categoria(_venue_environment)
	var base: Dictionary = DIV_SKYLINE.get(clampi(categoria, 1, 3), DIV_SKYLINE[3])
	var geo: Dictionary = COUNTRY_SKYLINE.get(_country, {})
	if geo.is_empty():
		return base
	var out: Dictionary = base.duplicate()
	out["tint"] = geo["tint"]
	var squat: float = float(geo.get("squat", 1.0))
	out["w_min"] = float(base["w_min"]) * squat
	out["w_max"] = float(base["w_max"]) * squat


	var tall: float = float(geo.get("tall", 1.0))
	out["h_min"] = float(base["h_min"]) * tall
	out["h_max"] = float(base["h_max"]) * tall
	out["count"] = maxi(int(round(float(base["count"]) * float(geo.get("dense", 1.0)))), 8)



	if geo.has("shapes"):
		out["shapes"] = geo["shapes"]
		out["rich"] = true


	if geo.has("seed"):
		out["seed"] = int(geo["seed"])







	if not out.has("extra"):



		out["extra"] = 14
	return out





func _slope_h(scale: float = 1.0) -> float:
	return float(_stands_cfg()["slope"]) * scale




func _prom_scale(prom: String) -> float:
	match prom:
		"cu_media":
			return 0.8
		"low":
			return 0.6
		"open":
			return 0.42
		"giant":




			return 1.3
		_:
			return 1.0





func attendance() -> float:
	if _att < 0.0:
		_att = _attendance()
	return _att


















func _rating_hoy(club: String, def: int = 70) -> int:
	if club.is_empty():
		return def
	return Market.effective_rating(club, GameState.div_of(club))


func _attendance() -> float:



	if att_override >= 0.0:
		_derby = party
		return clampf(att_override, 0.0, 1.0)









	if Career.closed_doors_now():
		_derby = false
		return 0.02
	var f: Dictionary = GameState.current_fixture()
	var opp: String = String(f.get("opp", ""))




	var nat: bool = String(f.get("comp", "")) == "nat"
	_derby = not opp.is_empty() and Career.is_derby(opp)








	if not _neutral_venue().is_empty():
		return NEUTRAL_FILL




	if not _inquilino().is_empty():
		return Concurso.PRESTADO_AFORO_DERBI if _derby else Concurso.PRESTADO_AFORO
	if GameState.readonly_save or _derby:
		return 1.0
	var home: bool = bool(f.get("home", true))




	if nat:







		if GameState.fixture_is_knockout(f):
			return 1.0
		var mine_n: int = Nations.strength(Career.nationality)
		var his_n: int = Nations.strength(opp) if not opp.is_empty() else mine_n
		return clampf(0.86 + float(mini(mine_n, his_n) - 60) * 0.004, 0.86, 1.0)
	var club: String = GameState.player_team_id if home else opp
	var rating: int = _rating_hoy(club)


	var base: float = clampf(0.4 +(float(rating) - 50.0) * 0.012, 0.4, 0.88)
	if home:
		base +=(float(Career.rel.get("aficion", 40)) - 40.0) * 0.005





	base += _campaign_factor(club)


	if Career.naming_enfado(club):
		base -= NombreComercial.ENFADO_ENTRADA






	var dk: int = clampi(_league_div if _league_div > 0 else div, 1, 3)
	base *= [1.0, 1.0, 0.9, 0.72][dk]
	var floor_v: float = [0.35, 0.35, 0.27, 0.18][dk]






	if div < dk:
		base -= 0.1
	elif div > dk:
		base += 0.08
		floor_v = maxf(floor_v, 0.5)














	var f_round: String = String(f.get("round", ""))



	var euro: bool = _comp in ["ucl", "eul", "conf", "cwc"] or Continental.es_americana(_comp)




	if (euro and f_round != "grupo") or _comp == "cup" or _comp == "liguilla":
		return 1.0
	elif euro:
		var rival_club: String = opp if home else GameState.player_team_id
		var rv: int = _rating_hoy(rival_club)

		var gap_n: float = clampf(float(rating - rv) / 30.0, -1.0, 1.0)
		base += lerpf(0.14, -0.1, gap_n) if gap_n >= 0.0 else lerpf(0.14, 0.3, - gap_n)




	if _season_t > 0.8 and _comp == "league":
		var pos: int = GameState.league_position()
		var teams: int = maxi(GameState.league_standings().size(), 1)
		if pos <= 4 or pos > teams - 4:
			base += 0.12
		else:
			base -= 0.08






	if _wet:
		base -= 0.06
	elif _snowy:
		base -= 0.12
	return clampf(base, floor_v, 1.0)














func _fiesta_factor() -> float:
	if att_override >= 0.0:
		return 1.45 if party else 1.0
	var f: float = 1.0

	f +=(float(Career.rel.get("aficion", 40)) - 40.0) * 0.006


	if _season_t > 0.8 and _comp == "league":
		var pos: int = GameState.league_position()
		var teams: int = maxi(GameState.league_standings().size(), 1)
		f += 0.2 if (pos <= 4 or pos > teams - 4) else -0.12





	if _comp == "liguilla":
		f += 0.3 if _is_final else 0.2

	if _derby:
		f += 0.15
	return clampf(f, 0.7, 1.5)







func _campaign_factor(club: String) -> float:
	if club.is_empty():
		return 0.0
	var key: String = GameState.YOU_KEY \
			if club == GameState.player_team_id else club
	var rows: Array = GameState.league_standings()
	var n: int = rows.size()
	if n < 2:
		return 0.0
	for i in n:
		var r: Dictionary = rows[i]
		if String(r.get("key", "")) == key:
			var pj: int = int(r.get("pj", 0))
			if pj < 3:
				return 0.0
			var pct: float = 1.0 - float(i) / float(n - 1)
			return lerpf(-0.1, 0.06, pct) * clampf(float(pj) / 8.0, 0.0, 1.0)
	return 0.0








func _away_fill() -> float:
	if _att_away >= 0.0:
		return _att_away
	var f: Dictionary = GameState.current_fixture()
	var opp: String = String(f.get("opp", ""))



	if att_override >= 0.0 or home_only or opp.is_empty():
		_att_away = 0.94 if _derby else 0.92
		return _att_away






	if not _neutral_venue().is_empty():
		_att_away = NEUTRAL_FILL
		return _att_away
	if GameState.readonly_save or _derby:
		_att_away = 0.94 if _derby else 0.92
		return _att_away



	if _comp == "nat":



		_att_away = 0.94 if GameState.fixture_is_knockout(f) else 0.88
		return _att_away

	var home_m: bool = bool(f.get("home", true))
	var away_club: String = opp if home_m else GameState.player_team_id
	var home_club_m: String = GameState.player_team_id if home_m else opp




	var f_round: String = String(f.get("round", ""))

	var euro: bool = _comp in ["ucl", "eul", "conf", "cwc"] or Continental.es_americana(_comp)

	if (euro and f_round != "grupo") or _comp == "cup" or _comp == "liguilla":
		_att_away = 0.94
		return _att_away
	if euro:
		var ar: int = _rating_hoy(away_club)
		var hr: int = _rating_hoy(home_club_m)

		var gap_a: float = clampf(float(ar - hr) / 30.0, -1.0, 1.0)
		_att_away = clampf(0.9 - gap_a * 0.45 + _viaja_contigo(home_m), 0.42, 0.96)
		return _att_away

	_att_away = clampf(0.88 + _campaign_factor(away_club) * 4.0 + _viaja_contigo(home_m),
		0.32, 0.96)
	return _att_away














const VIAJA_AFICION: float = 0.006
func _viaja_contigo(home_m: bool) -> float:
	if home_m:
		return 0.0
	return (float(Career.rel.get("aficion", 40)) - 40.0) * VIAJA_AFICION




func away_attendance() -> float:
	return _away_fill()

























func _block_fill(root_pos: Vector3, sec: int, sections: int) -> float:

	if _att >= 0.995:
		return 1.0







	if _att <= 0.0005:
		return 0.0
	return clampf((_seat_score(root_pos, sec, sections) -(1.0 - _att)) / 0.1 + 0.5,
		0.0, 1.0)








func _seat_score(root_pos: Vector3, sec: int, sections: int) -> float:
	var lo: float = 0.0
	var hi: float = 0.22
	if absf(root_pos.x) >= 20.0:
		if root_pos.x < 0.0:
			lo = 0.56
			hi = 1.0
		else:
			lo = 0.22
			hi = 0.56

	var mid: float = float(sections) * 0.5
	var d: float = absf((float(sec) + 0.5) - mid) / maxf(mid, 0.001)
	return lerpf(lo, hi, clampf(1.0 - d, 0.0, 1.0))


























func _away_whole_stand(pos: Vector3) -> bool:
	return pos.z < 0.0 and pos.x > 20.0








func away_stand_spot() -> Vector3:
	return _wp(Vector3(27.0, 0.0, -1.6))





func _away_first_section(pos: Vector3, sections: int) -> int:
	if pos.z >= 0.0 or sections < 6:
		return sections
	return sections - 2





func _cordon_section(pos: Vector3, sections: int) -> int:
	if _away_whole_stand(pos) or home_only:
		return -1
	var first: int = _away_first_section(pos, sections)
	if first >= sections or first <= 0:
		return -1
	return first















































const TIFO_CELL_M: float = 0.62

const TIFO_ROWS: int = 24
const TIFO_COLS_MAX: int = 160
const TIFO_FADE: float = 2.5
const TIFO_UNTIL: int = 4



const TIFO_SB_GAP: float = 0.6




const TIFO_BOX_GAP: float = 0.4


const TIFO_MIN_H: float = 0.34




















const TIFO_COMPOS: Array[String] = ["pleno", "orla", "franja", "mosaico", "copas"]






const TIFO_AMP_CALM: float = 0.55
const TIFO_AMP_GALE: float = 1.7
const TIFO_SPEED_GALE: float = 2.1




const TIFO_SIDE_MIN_LEN: float = 70.0
const TIFO_SIDE_W: float = 0.17
const TIFO_SIDE_H: float = 0.34
const TIFO_SIDE_OFF: float = 0.26








const TIFO_SIDE_OFF_PISO: Array[float] = [0.26, 0.12, 0.36]


const TIFO_Z: float = 0.9


const TIFO_CUP: Array[String] = [
	"#######",
	"#.###.#",
	"#.###.#",
	"..###..",
	"..###..",
	"...#...",
	"...#...",
	".#####.",
	"#######",
]


const TIFO_CUPS_MAX: int = 8



const TIFO_CUPS_WRAP: int = 5




const TIFO_CREST_PX: int = 128


const TIFO_PAT_COLS: int = 16



const TIFO_CREST_GAP: float = 0.06


const TIFO_FALLBACK: Array[String] = ["hoops", "half", "sash", "diagonal",
	"band_v", "chevron"]
const TIFO_NEI: Array[Vector2i] = [Vector2i(1, 0), Vector2i(-1, 0),
	Vector2i(0, 1), Vector2i(0, -1)]


var _tifo: MeshInstance3D
var _tifo_mat: ShaderMaterial
var _tifo_fade: float = -1.0
var _tifo_shader: Shader = null


var _tifo_nodes: Array[MeshInstance3D] = []








var _cloth_panels: Array[MeshInstance3D] = []
var _tifo_mats: Array[ShaderMaterial] = []




var _tifo_grid: Dictionary = {}


var _tifo_size: Vector2 = Vector2.ZERO
var _tifo_crest_shader: Shader = null




var _tifo_crest_pend: Array[Dictionary] = []
var _tifo_crest_asked: bool = false

















const VOLTEO_DELAY: float = 1.2
const VOLTEO_DUR: float = 2.6



const VOLTEO_W: float = 0.07
var _volteo_t: float = -1.0
var _volteo_mats: Array[ShaderMaterial] = []




const VOLTEO_GLSL: String = "\nuniform float reveal = 9.0;       // hasta dónde ha subido la ola (9 = volteo acabado)\n// EL DESPLIEGUE (ver `_tick_despliegue`): de −0,08 a 1,08 mientras la grada levanta\n// las cartulinas; 9 = todas arriba.\nuniform float despliegue = 9.0;\nuniform vec4 reverso : source_color = vec4(1.0);  // la cara lisa de las cartulinas\nfloat dado_v(vec2 p) {\n\treturn fract(sin(dot(p, vec2(41.31, 289.17))) * 15731.743);\n}\n// CUÁNDO levanta su cartulina esta persona: un poco de arriba abajo y MUCHO de azar\n// (Cesar, 2026-10-20: «no debería ser parejo, cuadritos en desorden apareciendo como en\n// la vida real»). <0 aún en el regazo, 0..1 subiéndola, >1 arriba.\nfloat desp_fase(vec2 cell, vec2 g) {\n\tfloat um = (cell.y + 0.5) / max(g.y, 1.0) * 0.35 + dado_v(cell + 7.1) * 0.65;\n\treturn (despliegue - um) / 0.07;\n}\n// CUÁNDO le toca a esta cartulina, de 0 a 1. De ABAJO ARRIBA (en un QuadMesh la UV.y\n// vale 0 arriba), con el frente ondulado a lo ancho —un seno de ~19 celdas, dos\n// jorobas en lo que ve la cámara— y un pellizco de azar por persona: un frente recto\n// se lee como una persiana, y la gracia es que son treinta mil manos.\nfloat umbral(vec2 cell, vec2 g) {\n\tfloat v = 1.0 - (cell.y + 0.5) / max(g.y, 1.0);\n\treturn v * 0.72 + (0.5 + 0.5 * sin(cell.x * 0.33)) * 0.14 + dado_v(cell) * 0.14;\n}\n// La fase del giro de esta celda: <0 todavía lisa, 0..1 girando, >1 ya dada la vuelta.\nfloat volteo_fase(vec2 cell, vec2 g) {\n\treturn (reveal - umbral(cell, g)) / VOLTEO_W;\n}\n// Cuánto de ancho le queda a la cartulina mientras gira: 1 de frente, 0 de canto.\nfloat volteo_ancho(float ph) {\n\treturn abs(cos(clamp(ph, 0.0, 1.0) * 3.14159265));\n}\n"


































func _volteo_glsl() -> String:
	return VOLTEO_GLSL.replace("VOLTEO_W", "%.4f" % VOLTEO_W)





func _volteo_add(mat: ShaderMaterial) -> void:
	if mat == null or not _tifo_volteo():
		return
	mat.set_shader_parameter("reveal", -0.2)



	mat.set_shader_parameter("reverso", _tifo_contrast())
	_volteo_mats.append(mat)
	if _volteo_t < 0.0:
		_volteo_t = 0.0





func _tick_volteo(delta: float) -> void:
	if _volteo_t < 0.0:
		return
	_volteo_t += delta
	var s: float = clampf((_volteo_t - VOLTEO_DELAY) / VOLTEO_DUR, 0.0, 1.0)
	if _volteo_t < VOLTEO_DELAY:
		return
	var r: float = lerpf(-0.01, 1.0 + VOLTEO_W + 0.01, s) if s < 1.0 else 9.0
	for mat in _volteo_mats:
		if mat != null:
			mat.set_shader_parameter("reveal", r)
	if s >= 1.0:
		_volteo_mats.clear()
		_volteo_t = -1.0















const DESPLIEGUE_DELAY: float = 0.3
const DESPLIEGUE_DUR: float = 2.4


const DESPLIEGUE_VOLTEO_PAUSA: float = 0.5
var despliegue_override: int = -1
var _desp_t: float = -1.0
var _desp_val: float = 9.0
var _desp_mats: Array[ShaderMaterial] = []


func _desp_on() -> bool:
	if Settings.reduce_motion or _tifo_volteo():
		return false
	if despliegue_override >= 0:
		return despliegue_override == 1
	return _en_partido()




func _desp_add(mat: ShaderMaterial) -> void:
	if mat == null or not _desp_on():
		return
	if _desp_t < 0.0:
		_desp_t = 0.0
		_desp_val = -0.08
	mat.set_shader_parameter("despliegue", _desp_val)
	mat.set_shader_parameter("gente_a", _club_a)
	mat.set_shader_parameter("gente_b", _club_b)
	_desp_mats.append(mat)


func _tick_despliegue(delta: float) -> void:
	if _desp_t < 0.0:
		return
	_desp_t += delta
	var s: float = clampf((_desp_t - DESPLIEGUE_DELAY) / DESPLIEGUE_DUR, 0.0, 1.0)

	var e: float = 1.0 - pow(1.0 - s, 1.6)
	_desp_val = lerpf(-0.08, 1.08, e) if s < 1.0 else 9.0
	for mat in _desp_mats:
		if mat != null:
			mat.set_shader_parameter("despliegue", _desp_val)
	if s >= 1.0:
		_desp_mats.clear()
		_desp_t = -1.0
		if _volteo_t >= 0.0:
			_volteo_t = maxf(_volteo_t, VOLTEO_DELAY - DESPLIEGUE_VOLTEO_PAUSA)
























func _nat_heat() -> float:
	if _nat_heat_v >= 0.0:
		return _nat_heat_v
	_nat_heat_v = 0.0
	if _comp == "nat":
		var f: Dictionary = GameState.current_fixture()
		if GameState.fixture_is_knockout(f):
			var total: int =(GameState.nat_state.get("ko_names", []) as Array).size()
			var idx: int = int(f.get("nat_ko", 0))
			_nat_heat_v = 1.0 if total <= 1 else clampf(NAT_HEAT_MIN
				+(1.0 - NAT_HEAT_MIN) * float(idx) / float(total - 1), 0.0, 1.0)
	return _nat_heat_v


func _tifo_allowed() -> bool:
	if tifo_override >= 0:
		return tifo_override > 0





	if div < 3 and not home_only and not _tifo_especial().is_empty():
		return true





	var att_min: float = 0.55
	match _club_tier_v:
		"alto":
			att_min = 0.5
		"bajo":
			att_min = 0.62
	if div >= 3 or home_only or _att < att_min:
		return false




	if _is_home_ground():
		return _fiesta_factor() >= 0.85
	return _att >= maxf(0.62, att_min)















func tifo_spot() -> Vector3:
	var best: MeshInstance3D = null
	var area: float = 0.0
	for pano in _tifo_nodes:
		if not is_instance_valid(pano):
			continue
		var sz: Vector3 = pano.get_aabb().size * pano.scale
		var a: float = maxf(sz.x, sz.z) * sz.y
		if a > area:
			area = a
			best = pano
	return best.global_position if best != null else Vector3.INF





func _build_tifo(root: Node3D, length: float, scale: float,
		works: bool = false) -> void:






	if _away_whole_stand(root.position):
		_build_away_banner(root, length, scale)
		return














	var inquilino: String = _inquilino()
	if (_sede_neutral or not inquilino.is_empty()) and not _tifo_prestando \
			and String(GameState.current_fixture().get("comp", "")) != "nat":
		var curva: String = inquilino if not inquilino.is_empty() else GameState.player_team_id
		var yo: Dictionary = Teams.by_id(curva)
		if not yo.is_empty() and yo.has("kit"):
			var a: Color = _club_a
			var b: Color = _club_b
			var sigla: String = _club_abbrev
			_club_a = yo["kit"]
			_club_b = yo.get("kit2", yo["kit"])
			_club_abbrev = String(yo.get("abbrev", ""))
			_tifo_club_lend = curva
			_tifo_prestando = true
			_build_tifo(root, length, scale, works)
			_tifo_prestando = false
			_club_a = a
			_club_b = b
			_club_abbrev = sigla
			return





	if div >= 3:
		if root.position.z < 0.0 and absf(root.position.x) < 20.0:
			_build_bedsheet(root, length, scale)
		return
	if not _tifo_allowed():
		return
	if root.position.z < 0.0 and absf(root.position.x) < 20.0:
		if _tifo == null:
			_build_curve_tifo(root, length, scale, works)

			_build_giant_flags(root, length, scale, works)
		return
	if absf(root.position.x) > 30.0:
		_build_side_tifos(root, length, scale, works)



func _build_curve_tifo(root: Node3D, length: float, scale: float,
		works: bool = false) -> void:
	var slope_c: Vector2 = _slope_center(scale)
	var slope_h: float = _slope_h(scale)
	var coverage: float = _tifo_coverage()
	var q_w: float = length * coverage






	var off_x: float = 0.0
	if coverage < 0.7:


		off_x = float(posmod(hash(_pitch_seed_club())>>8, 3) - 1) * length * 0.12
	if works:


		var hasta: float = minf(_obra_x0, length * 0.5)
		var libre: float = hasta + length * 0.5
		if libre < 8.0:
			return
		q_w = minf(q_w, libre * 0.88)
		off_x =(- length * 0.5 + hasta) * 0.5





	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	var y_bot: float = - slope_h * 0.49






	var mz_top: float = TIFO_Z + 1.1 * TIFO_AMP_GALE
	var y_top: float =(_tifo_ceiling_y() - slope_c.x - mz_top * sin(rad)) / cos(rad)






	y_top = minf(y_top, _box_ceiling_y())
	var q_h: float = minf(slope_h *(0.58 if coverage < 0.7 else 0.78), y_top - y_bot)
	if q_h < slope_h * TIFO_MIN_H:
		return
	_tifo_grid = _tifo_grid_of(q_w, q_h, _tifo_compo())
	_tifo_size = Vector2(q_w, q_h)
	_tifo = _tifo_panel(root, slope_c, off_x, y_bot + q_h * 0.5, q_w, q_h, _tifo_grid)




	_tifo_mat = _tifo.material_override




	if _tifo_wants_crest(String(_tifo_grid["compo"])):
		_tifo_crest_want(_tifo, _tifo_grid, _tifo_size)
	_volteo_add(_tifo_mat)












func _build_side_tifos(root: Node3D, length: float, scale: float,
		works: bool) -> void:
	if length < TIFO_SIDE_MIN_LEN:
		return
	var slope_c: Vector2 = _slope_center(scale)
	var slope_h: float = _slope_h(scale)
	var q_w: float = length * TIFO_SIDE_W
	var q_h: float = slope_h * TIFO_SIDE_H


	var y_c: float = slope_h * 0.06
	var piso: int = int(root.get_meta("recinto_piso", 0))
	var off_abs: float = length *(TIFO_SIDE_OFF if piso <= 0
		else TIFO_SIDE_OFF_PISO[posmod(piso, TIFO_SIDE_OFF_PISO.size())])







	if _box_half_x > 0.0 and off_abs - q_w * 0.5 < _box_half_x:
		var y_top: float = minf(y_c + q_h * 0.5, _box_ceiling_y())


		var y_bot: float = maxf(y_top - q_h, - slope_h * 0.5 + 0.4)
		q_h = y_top - y_bot


		if q_h < slope_h * 0.18:
			return
		y_c =(y_top + y_bot) * 0.5
	for i in 2:



		if _tifo_coverage() < 0.7 and i != posmod(hash(_pitch_seed_club())
				+ int(signf(root.position.x)) + piso, 2):
			continue
		var off: float =(-1.0 if i == 0 else 1.0) * off_abs





		if _en_obra(works, off):
			continue
		var grid: Dictionary = _tifo_grid_of(q_w, q_h, _tifo_side_compo(i))
		var pano: MeshInstance3D = _tifo_panel(root, slope_c, off, y_c,
			q_w, q_h, grid)
		if _tifo_wants_crest(String(grid["compo"])):
			_tifo_crest_want(pano, grid, Vector2(q_w, q_h))


		_volteo_add(pano.material_override as ShaderMaterial)

















func hang_side_banner(side: float, tex: Texture2D, size: Vector2,
		z: float = HALF_LINE) -> MeshInstance3D:
	if tex == null:
		return null





	var info: Dictionary = {}
	for r in _side_roots:
		if signf(float((r["root"] as Node3D).position.x)) != signf(_wx(side)):
			continue
		if info.is_empty():
			info = r
			continue
		var mejor_techo: bool = bool(info.get("roofed", true))
		var cand_techo: bool = bool(r.get("roofed", true))
		if cand_techo != mejor_techo:
			if cand_techo:
				info = r
			continue
		if float(r["len"]) > float(info["len"]):
			info = r
	if info.is_empty():
		return null
	var root: Node3D = info["root"]



	var escala: float = float(info.get("scale", 1.0))
	var slope_h: float = _slope_h(escala)








	var techo: float = slope_h *(0.635 if bool(info.get("roofed", true)) else 0.9) \
			- TIFO_BOX_GAP
	if bool(info.get("roofed", true)):
		techo -= BOX_BAND * 0.5







	var piso: float = maxf(0.4,(BOWL_WALL_H + 0.3 - STAND_SLOPE_FOOT_Y)
		/ cos(deg_to_rad(STAND_SLOPE_DEG)))
	var sitio: float = techo - piso




	if sitio < 2.2:
		return null
	if size.y > sitio:
		size *= sitio / size.y
	var slope_c: Vector2 = _slope_center(escala)
	var holder: Node3D = Node3D.new()


	var lx: float = root.to_local(Vector3(root.global_position.x, 0.0, z)).x
	var tope: float = maxf(float(info["len"]) * 0.5 - size.x * 0.5, 0.0)
	holder.position = Vector3(clampf(lx, - tope, tope), slope_c.x, slope_c.y)
	holder.rotation_degrees = Vector3(- STAND_SLOPE_DEG, 0.0, 0.0)
	root.add_child(holder)
	var pano: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = size
	pano.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	pano.material_override = mat
	pano.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	pano.position = Vector3(0.0, techo - slope_h * 0.5 - size.y * 0.5, TIFO_Z)
	holder.add_child(pano)



	_cloth_panels.append(pano)
	return pano







func _build_bedsheet(root: Node3D, length: float, scale: float) -> void:
	if home_only or _att < 0.35:
		return
	var slope_c: Vector2 = _slope_center(scale)
	var slope_h: float = _slope_h(scale)
	var q_w: float = minf(length * 0.42, 24.0)




	var q_h: float = minf(maxf(slope_h * 0.26, 1.6), slope_h * 0.9)



	var pano: MeshInstance3D = _tifo_panel(root, slope_c, 0.0,
		- slope_h * 0.5 + q_h * 0.5 + 0.1,
		q_w, q_h, _tifo_grid_of(q_w, q_h, "orla"))


	_tifo_nodes.erase(pano)
















func is_your_ground() -> bool:
	if att_override >= 0.0 or home_only or not home_club.is_empty():
		return false
	return _comp != "nat" and _is_home_ground()

























func _build_hate_banner() -> void:
	if not is_your_ground() or not Career.hate_banner_check():
		return
	var parts: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	var surname: String =(parts[parts.size() - 1] if parts.size() > 0
		else Career.player_name).to_upper()



	surname = PixelText.normalize(surname).substr(0, 10)
	if surname.strip_edges().is_empty():
		return
	var tex: ImageTexture = _hate_banner_tex(surname)







	var alto: float = 6.2
	var ancho: float = alto * float(tex.get_width()) / float(tex.get_height())








	_hate_node = hang_side_banner(-1.0, tex, Vector2(ancho, alto))



var _hate_node: MeshInstance3D = null





func hate_banner_hung() -> bool:
	return _hate_node != null and is_instance_valid(_hate_node)




















func _build_love_banner() -> void:


	if not is_your_ground() or _hate_node != null or _milestone_node != null:
		return
	if not Career.love_banner_check():
		return
	var parts: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	var surname: String =(parts[parts.size() - 1] if parts.size() > 0
		else Career.player_name).to_upper()



	surname = PixelText.normalize(surname).substr(0, 10)
	if surname.strip_edges().is_empty():
		return
	var tex: ImageTexture = _love_banner_tex(surname)


	var alto: float = 6.2
	var ancho: float = alto * float(tex.get_width()) / float(tex.get_height())
	_love_node = hang_side_banner(-1.0, tex, Vector2(ancho, alto))



var _love_node: MeshInstance3D = null






func love_banner_hung() -> bool:
	return _love_node != null and is_instance_valid(_love_node)













func _build_errata_banner() -> void:
	if not is_your_ground() or _hate_node != null:
		return
	var err: Dictionary = Career.pancarta_de_hoy()
	if err.is_empty():
		return
	var tex: ImageTexture = errata_banner_tex(String(err.get("texto", "")), err,
		bool(err.get("cinta", false)))
	if tex == null:
		return

	var alto: float = 6.2
	var ancho: float = alto * float(tex.get_width()) / float(tex.get_height())
	_errata_node = hang_side_banner(1.0, tex, Vector2(ancho, alto))



var _errata_node: MeshInstance3D = null



func errata_banner_hung() -> bool:
	return _errata_node != null and is_instance_valid(_errata_node)





const CINTA_COLOR: Color = Color("d9c98f")























func errata_banner_tex(texto: String, err: Dictionary, cinta: bool) -> ImageTexture:
	texto = PixelText.normalize(texto)
	if texto.strip_edges().is_empty():
		return null
	var px: int = 5
	var paso: int =(PixelText.GLYPH_W + 1) * px
	var tipo: String = String(err.get("tipo", ""))
	var idx: int = clampi(int(err.get("idx", 0)), 0, maxi(texto.length() - 1, 0))
	var n: int = maxi(int(err.get("n", 1)), 1)
	var pad_x: int = px * 4
	var pad_y: int = px * 2
	var foto: Image = _hate_banner_foto(px * LOVE_FOTO_MOD, false)
	var foto_w: int = 0 if foto == null else foto.get_width()
	var foto_h: int = 0 if foto == null else foto.get_height()
	var texto_h: int = PixelText.GLYPH_H * px
	var nom_w: int = PixelText.text_width(texto, px)


	var px_chica: int = px - 2
	var arriba: int = PixelText.GLYPH_H * px_chica + px_chica * 4 + 2 \
			if tipo == "falta" else 0
	var w: int = nom_w + pad_x * 2 + foto_w +(pad_x if foto != null else 0)
	var h: int = maxi(texto_h + arriba, foto_h) + pad_y * 2
	var cloth: Color = Color("ded7c4")
	var club: String = String(err.get("club", GameState.player_team_id))
	var img: Image = _cloth_base(w, h, px, cloth, hash(club + "|" + texto))
	var ink: Color = _ink_from_kit(_host_kit_now().get("kit", Color("2b3340")))
	_pegar_foto(img, foto, pad_x, ink)
	var x0: int = pad_x + foto_w +(pad_x if foto != null else 0)
	var hueco: int = w - x0 - pad_x
	var tx: int = x0 + maxi(hueco - nom_w, 0) / 2


	var ty: int =(h - texto_h - arriba) / 2 + arriba
	PixelText.draw_text(img, tx, ty, texto, ink, px)

	var lx: float = float(tx + idx * paso) + float(paso * n - px) * 0.5
	if tipo == "falta":
		lx = float(tx + idx * paso) - float(px) * 0.5
	var ly: float = float(ty) + float(texto_h) * 0.5
	if cinta:
		var x_letra: int = tx + idx * paso
		if tipo == "falta":
			ly = float(ty - arriba / 2)


			_parche_falta(img, x_letra - px / 2 - 1, ty, arriba,
				String(err.get("buena", "")), ink, px_chica)
		else:
			var buena: String = "" if tipo == "doblada" else String(err.get("buena", ""))


			var alto_c: int = texto_h + px
			_parche_cinta(img, x_letra - 3, ty - px / 2, paso * n - px + 6, alto_c)
			if not buena.is_empty():

				PixelText.draw_text(img, x_letra + int(float(alto_c) * 0.06), ty,
					buena, ink, px)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	tex.set_meta("letra_uv", Vector2(lx / float(w), ly / float(h)))
	return tex






func _parche_cinta(img: Image, x: int, y: int, ancho: int, alto: int) -> void:
	var filo: Color = CINTA_COLOR.darkened(0.15)
	for row in alto:
		var dx: int = int(float(row) * 0.12)
		for col in ancho:
			var cx: int = x + col + dx
			var cy: int = y + row
			if cx < 0 or cy < 0 or cx >= img.get_width() or cy >= img.get_height():
				continue
			var borde: bool = row == 0 or row == alto - 1 or col == 0 or col == ancho - 1
			img.set_pixel(cx, cy, filo if borde else CINTA_COLOR)





func _parche_falta(img: Image, gx: int, ty: int, arriba: int, buena: String,
		ink: Color, px: int) -> void:
	var letra_w: int = PixelText.text_width(buena, px)
	var letra_h: int = PixelText.GLYPH_H * px
	var tira_w: int = letra_w + px * 2
	var tira_h: int = letra_h + px
	var tira_x: int = gx - tira_w / 2
	var tira_y: int = ty - arriba
	_parche_cinta(img, tira_x, tira_y, tira_w, tira_h)
	PixelText.draw_text(img, tira_x + px, tira_y + px / 2 + 1, buena, ink, px)


	var fy: int = tira_y + tira_h + px
	for i in 3:
		var bx: int = gx - px * 3 / 2 + i * px
		var by: int = fy +(px if i == 1 else 0)
		for yy in px:
			for xx in px:
				var c: Vector2i = Vector2i(bx + xx, by + yy)
				if c.x >= 0 and c.y >= 0 and c.x < img.get_width() \
						and c.y < img.get_height():
					img.set_pixel(c.x, c.y, ink)












func _ink_from_kit(kit: Color) -> Color:
	var lum: float = kit.get_luminance()
	var t: float = clampf((lum - 0.18) / 0.82, 0.0, 0.88)
	return kit.lerp(Color("14120f"), t)
















func _love_banner_tex(surname: String) -> ImageTexture:
	var px: int = 5
	var px_w: int = 3



	var pad_x: int = px * 4
	var pad_y: int = px * 2
	var palabra: String = PixelText.normalize(I18n.t("GRACIAS").to_upper())
	var foto: Image = _hate_banner_foto(px * LOVE_FOTO_MOD, false)
	var foto_w: int = 0 if foto == null else foto.get_width()
	var foto_h: int = 0 if foto == null else foto.get_height()
	var pal_h: int = PixelText.GLYPH_H * px_w
	var nom_h: int = PixelText.GLYPH_H * px


	var hueco_v: int = px
	var bloque_h: int = pal_h + hueco_v + nom_h
	var pal_w: int = PixelText.text_width(palabra, px_w)
	var nom_w: int = PixelText.text_width(surname, px)
	var texto_w: int = maxi(pal_w, nom_w)
	var w: int = texto_w + pad_x * 2 + foto_w +(pad_x if foto != null else 0)
	var h: int = maxi(bloque_h, foto_h) + pad_y * 2



	var cloth: Color = Color("ded7c4")
	var img: Image = _cloth_base(w, h, px, cloth,
		hash(GameState.player_team_id + "|" + surname))
	var ink: Color = _ink_from_kit(_host_kit_now().get("kit", Color("2b3340")))
	_pegar_foto(img, foto, pad_x, ink)



	var x0: int = pad_x + foto_w +(pad_x if foto != null else 0)
	var hueco: int = w - x0 - pad_x
	var y0: int =(h - bloque_h) / 2



	PixelText.draw_text(img, x0 + maxi(hueco - pal_w, 0) / 2, y0, palabra,
		ink.lightened(0.22), px_w)
	PixelText.draw_text(img, x0 + maxi(hueco - nom_w, 0) / 2, y0 + pal_h + hueco_v,
		surname, ink, px)
	return ImageTexture.create_from_image(img)












func _build_milestone_banner() -> void:
	if not is_your_ground() or _hate_node != null:
		return
	var hito: Dictionary = Career.milestone_banner()
	if hito.is_empty():
		return
	var tex: ImageTexture = _milestone_banner_tex(int(hito["n"]),
		String(hito["kind"]))
	var alto: float = 6.2
	var ancho: float = alto * float(tex.get_width()) / float(tex.get_height())
	_milestone_node = hang_side_banner(-1.0, tex, Vector2(ancho, alto))



var _milestone_node: MeshInstance3D = null



func milestone_banner_hung() -> bool:
	return _milestone_node != null and is_instance_valid(_milestone_node)


















func _milestone_banner_tex(n: int, kind: String) -> ImageTexture:
	var px: int = 5
	var px_n: int = 9
	var px_s: int = 3





	var pad_x: int = px * 5
	var pad_y: int = px * 3
	var clave: String = "{0} GOLES" if kind == "goles" else "{0} PARTIDOS"



	var frase: String = I18n.t(clave).format([str(n)])
	var palabra: String = PixelText.normalize(
		frase.replace(str(n), "").strip_edges().to_upper())
	var num: String = str(n)
	var parts: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	var surname: String =(parts[parts.size() - 1] if parts.size() > 0
		else Career.player_name).to_upper()
	surname = PixelText.normalize(surname).substr(0, 10)
	var num_w: int = PixelText.text_width(num, px_n)
	var num_h: int = PixelText.GLYPH_H * px_n
	var pal_w: int = PixelText.text_width(palabra, px)
	var pal_h: int = PixelText.GLYPH_H * px
	var nom_w: int = PixelText.text_width(surname, px_s)
	var nom_h: int = PixelText.GLYPH_H * px_s
	var hueco_v: int = px
	var bloque_h: int = pal_h + hueco_v + nom_h
	var texto_w: int = maxi(pal_w, nom_w)
	var w: int = num_w + pad_x * 3 + texto_w
	var h: int = maxi(num_h, bloque_h) + pad_y * 2
	var cloth: Color = Color("ded7c4")


	var img: Image = _cloth_base(w, h, px, cloth,
		hash(GameState.player_team_id + "|" + kind + "|" + num))
	var ink: Color = _ink_from_kit(_host_kit_now().get("kit", Color("2b3340")))
	PixelText.draw_text(img, pad_x,(h - num_h) / 2, num, ink, px_n)
	var x0: int = pad_x * 2 + num_w
	var y0: int =(h - bloque_h) / 2
	PixelText.draw_text(img, x0, y0, palabra, ink, px)

	PixelText.draw_text(img, x0, y0 + pal_h + hueco_v, surname,
		ink.lightened(0.28), px_s)
	return ImageTexture.create_from_image(img)
















func _build_spurn_banner() -> void:
	if att_override >= 0.0 or home_only or not home_club.is_empty():
		return
	if _comp == "nat" or _is_home_ground() or _tribute_node != null:
		return
	if not Career.spurned_at(_club_local()):
		return
	var parts: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	var surname: String =(parts[parts.size() - 1] if parts.size() > 0
		else Career.player_name).to_upper()
	surname = PixelText.normalize(surname).substr(0, 10)
	if surname.strip_edges().is_empty():
		return
	var tex: ImageTexture = _spurn_banner_tex(surname)
	var alto: float = 6.2
	var ancho: float = alto * float(tex.get_width()) / float(tex.get_height())
	_spurn_node = hang_side_banner(1.0, tex, Vector2(ancho, alto))



var _spurn_node: MeshInstance3D = null



func spurn_banner_hung() -> bool:
	return _spurn_node != null and is_instance_valid(_spurn_node)

















func _spurn_banner_tex(surname: String) -> ImageTexture:
	var px: int = 7
	var px_s: int = 4
	var pad_x: int = px * 3
	var pad_y: int = px * 2
	var palabra: String = PixelText.normalize(I18n.t("TRAIDOR").to_upper())
	var pal_w: int = PixelText.text_width(palabra, px)
	var pal_h: int = PixelText.GLYPH_H * px
	var nom_w: int = PixelText.text_width(surname, px_s)
	var nom_h: int = PixelText.GLYPH_H * px_s
	var hueco_v: int = px_s
	var w: int = maxi(pal_w, nom_w) + pad_x * 2
	var h: int = pal_h + hueco_v + nom_h + pad_y * 2
	var cloth: Color = Color("ded7c4")
	var img: Image = _cloth_base(w, h, px, cloth,
		hash(_pitch_seed_club() + "|traidor|" + surname))



	var ink: Color = _ink_from_kit(_host_kit_now().get("kit", Color("2b3340")))
	PixelText.draw_text(img,(w - pal_w) / 2, pad_y, palabra, ink, px)
	PixelText.draw_text(img,(w - nom_w) / 2, pad_y + pal_h + hueco_v, surname,
		ink.lightened(0.18), px_s)
	return ImageTexture.create_from_image(img)
























func _build_tribute_banner() -> void:
	if att_override >= 0.0 or home_only or not home_club.is_empty():
		return
	if _comp == "nat" or _is_home_ground():
		return
	var anfitrion: String = _club_local()
	if not Career.honored_at(anfitrion):
		return
	var parts: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	var surname: String =(parts[parts.size() - 1] if parts.size() > 0
		else Career.player_name).to_upper()
	surname = PixelText.normalize(surname).substr(0, 10)
	if surname.strip_edges().is_empty():
		return



	var tex: ImageTexture = _tribute_banner_tex(surname,
		Career.club_number(anfitrion))
	var alto: float = 6.2
	var ancho: float = alto * float(tex.get_width()) / float(tex.get_height())



	_tribute_node = hang_side_banner(1.0, tex, Vector2(ancho, alto))



var _tribute_node: MeshInstance3D = null





func tribute_banner_hung() -> bool:
	return _tribute_node != null and is_instance_valid(_tribute_node)













func _tribute_banner_tex(surname: String, dorsal: int) -> ImageTexture:
	var px: int = 4
	var pad_x: int = px * 3
	var pad_y: int = px * 2
	var num: String = str(dorsal) if dorsal > 0 else ""


	var num_px: int = px * 2
	var num_w: int = 0 if num.is_empty() else PixelText.text_width(num, num_px)
	var num_h: int = 0 if num.is_empty() else PixelText.GLYPH_H * num_px
	var texto_h: int = PixelText.GLYPH_H * px
	var w: int = PixelText.text_width(surname, px) + pad_x * 2 + num_w \
			+(pad_x if num_w > 0 else 0)
	var h: int = maxi(texto_h, num_h) + pad_y * 2
	var cloth: Color = Color("ded7c4")
	var img: Image = _cloth_base(w, h, px, cloth,
		hash("tributo|" + surname + "|" + num))






	var ink: Color = _ink_from_kit(_host_kit_now().get("kit", Color("2b3340")))
	var x: int = pad_x
	if num_w > 0:
		PixelText.draw_text(img, x,(h - num_h) / 2, num, ink, num_px)
		x += num_w + pad_x
	var hueco: int = w - x - pad_x
	var tx: int = x + maxi(hueco - PixelText.text_width(surname, px), 0) / 2
	PixelText.draw_text(img, tx,(h - texto_h) / 2, surname, ink, px)
	return ImageTexture.create_from_image(img)





const HATE_FOTO_MOD: int = 11




const LOVE_FOTO_MOD: int = 9




const HATE_FOTO_CROP: float = 0.34






















func _hate_banner_foto(lado: int, gris: bool = true, papel: bool = true) -> Image:
	var base: String = "res://assets/sprites/players/player_south.png"
	if lado <= 0 or not ResourceLoader.exists(base):
		return null
	var tex: Texture2D = KitRecolor.apply(load(base), GameState.player_look())
	if tex == null:
		return null
	var src: Image = tex.get_image()
	if src == null:
		return null


	var usado: Rect2i = src.get_used_rect()
	if usado.size.x <= 0 or usado.size.y <= 0:
		return null
	var alto_crop: int = maxi(int(round(float(usado.size.y) * HATE_FOTO_CROP)), 1)





	var lado_src: int = maxi(alto_crop, 1)
	var hx0: int = src.get_width()
	var hx1: int = -1
	for yy in range(usado.position.y, mini(usado.position.y + alto_crop,
			src.get_height())):
		for xx in range(usado.position.x, usado.end.x):
			if src.get_pixel(xx, yy).a < 0.5:
				continue
			hx0 = mini(hx0, xx)
			hx1 = maxi(hx1, xx)
	if hx1 < hx0:
		return null
	var cx: int =(hx0 + hx1) / 2
	var x0: int = cx - lado_src / 2
	var y0: int = usado.position.y
	var out: Image = Image.create(lado, lado, false, Image.FORMAT_RGBA8)
	for oy in lado:
		for ox in lado:



			var sx: int = x0 + int(float(ox) * float(lado_src) / float(lado))
			var sy: int = y0 + int(float(oy) * float(lado_src) / float(lado))
			if sx < 0 or sy < 0 or sx >= src.get_width() or sy >= src.get_height():
				out.set_pixel(ox, oy, Color(0, 0, 0, 0))
				continue
			var c: Color = src.get_pixel(sx, sy)
			if c.a < 0.5:


				out.set_pixel(ox, oy, Color(0.87, 0.85, 0.79, 1.0) if papel
					else Color(0, 0, 0, 0))
				continue



			if not gris:
				out.set_pixel(ox, oy, c)
				continue
			var v: float = c.get_luminance()





			v = clampf((v - 0.5) * 1.22 + 0.5, 0.16, 0.9)
			out.set_pixel(ox, oy, Color(v, v, v, 1.0))
	return out















func _cloth_base(w: int, h: int, px: int, cloth: Color, semilla: int) -> Image:
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla
	img.fill(cloth)








	var borde_max: int = maxi(px / 2, 2)
	for eje in 2:
		var largo: int = w if eje == 0 else h
		var hondo: int = h if eje == 0 else w
		for lado in 2:
			var d: int = rng.randi_range(0, borde_max)
			for i in largo:
				d = clampi(d + rng.randi_range(-1, 1), 0, borde_max)
				for k in d:
					var kk: int = k if lado == 0 else hondo - 1 - k
					var cx: int = i if eje == 0 else kk
					var cy: int = kk if eje == 0 else i
					img.set_pixel(cx, cy, Color(0, 0, 0, 0))


	for _i in int(w * h / 90):
		var mx: int = rng.randi_range(0, w - 1)
		var my: int = rng.randi_range(0, h - 1)
		if img.get_pixel(mx, my).a < 0.5:
			continue
		img.set_pixel(mx, my, cloth.darkened(rng.randf_range(0.04, 0.13)))
	return img











func _pegar_foto(img: Image, foto: Image, foto_x: int, ink: Color) -> void:
	if foto == null:
		return
	var w: int = img.get_width()
	var h: int = img.get_height()
	var foto_w: int = foto.get_width()
	var foto_h: int = foto.get_height()
	var fy: int =(h - foto_h) / 2
	for fx in foto_w:
		for fyy in foto_h:
			var c: Color = foto.get_pixel(fx, fyy)
			if c.a < 0.5:
				continue
			img.set_pixel(foto_x + fx, fy + fyy, c)
	for bx in range(-1, foto_w + 1):
		for by in [-1, foto_h]:
			img.set_pixel(clampi(foto_x + bx, 0, w - 1), clampi(fy + by, 0, h - 1), ink)
	for by in range(-1, foto_h + 1):
		for bx in [-1, foto_w]:
			img.set_pixel(clampi(foto_x + bx, 0, w - 1), clampi(fy + by, 0, h - 1), ink)








func _hate_banner_tex(surname: String) -> ImageTexture:
	var px: int = 4





	var pad_x: int = px * 3
	var pad_y: int = px * 2



	var foto: Image = _hate_banner_foto(px * HATE_FOTO_MOD)
	var foto_w: int = 0 if foto == null else foto.get_width()
	var foto_h: int = 0 if foto == null else foto.get_height()
	var texto_h: int = PixelText.GLYPH_H * px
	var w: int = PixelText.text_width(surname, px) + pad_x * 2 + foto_w \
			+(pad_x if foto != null else 0)
	var h: int = maxi(texto_h, foto_h) + pad_y * 2


	var cloth: Color = Color("ded7c4")
	var img: Image = _cloth_base(w, h, px, cloth,
		hash(GameState.player_team_id + "|" + surname))
	var ink: Color = Color("221f1c")



	var foto_x: int = pad_x
	_pegar_foto(img, foto, foto_x, ink)


	var texto_x0: int = foto_x + foto_w +(pad_x if foto != null else 0)
	var hueco: int = w - texto_x0 - pad_x
	var tx: int = texto_x0 + maxi(hueco - PixelText.text_width(surname, px), 0) / 2
	var ty: int =(h - texto_h) / 2
	PixelText.draw_text(img, tx, ty, surname, ink, px)



	var rojo: Color = Color("b3312a")
	var y_mid: float = float(h) * 0.5



	var raya_x0: int = 0 if foto == null else foto_x + foto_w + pad_x / 2
	for x in range(raya_x0, w):

		var base: float = y_mid - float(px) * 0.45 + float(x) / float(w) * float(px) * 0.9
		var onda: float = sin(float(x) * 0.07) * float(px) * 0.35
		var y0: int = int(round(base + onda))
		for dy in range(- px / 2, px / 2 + 1):
			var yy: int = y0 + dy
			if yy < 0 or yy >= h or img.get_pixel(x, yy).a < 0.5:
				continue

			var borde: bool = absi(dy) >= px / 2
			img.set_pixel(x, yy, rojo.lightened(0.22) if borde else rojo)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	return tex










func _build_away_banner(root: Node3D, length: float, scale: float) -> void:
	if div >= 3 or home_only or _away_fill() < 0.45:
		return
	if _is_final and _build_duel_tifo(root, length, scale):
		return
	var team: Dictionary = _away_team()
	if team.is_empty() or not team.has("kit"):
		return
	var slope_c: Vector2 = _slope_center(scale)
	var slope_h: float = _slope_h(scale)
	var q_w: float = minf(length * 0.3, 16.0)
	var q_h: float = slope_h * 0.26
	var grid: Dictionary = _tifo_grid_of(q_w, q_h, "orla")




	var a: Color = _club_a
	var b: Color = _club_b
	_club_a = team["kit"]
	_club_b = team.get("kit2", team["kit"])




	var flag: Image = _flag_of(team)
	if flag != null:
		grid["compo"] = "bandera"
		_tifo_flag_lend = flag
	var pano: MeshInstance3D = _tifo_panel(root, slope_c, 0.0, slope_h * 0.04,
		q_w, q_h, grid)
	_tifo_flag_lend = null
	_club_a = a
	_club_b = b



	_tifo_nodes.erase(pano)

















func _build_duel_tifo(root: Node3D, length: float, scale: float) -> bool:
	if att_override >= 0.0:
		return false
	var team: Dictionary = _away_team()
	if _sede_neutral:
		var opp: String = String(GameState.current_fixture().get("opp", ""))
		team = Teams.by_id(opp) if not Teams.by_id(opp).is_empty() \
				else Nations.as_team(opp)
	if team.is_empty() or not team.has("kit"):
		return false
	var slope_c: Vector2 = _slope_center(scale)
	var slope_h: float = _slope_h(scale)
	var q_w: float = minf(length * 0.8, 34.0)



	var y_top: float = minf(slope_h * 0.24, _box_ceiling_y())
	var y_bot: float = maxf(y_top - slope_h * 0.46, - slope_h * 0.5 + 0.4)
	var q_h: float = y_top - y_bot
	if q_h < slope_h * 0.18:
		return false
	var id: String = String(team.get("id", ""))
	var a: Color = _club_a
	var b: Color = _club_b
	var sigla: String = _club_abbrev
	var lend: String = _tifo_club_lend
	_club_a = team["kit"]
	_club_b = team.get("kit2", team["kit"])
	_club_abbrev = String(team.get("abbrev", ""))
	_tifo_club_lend = id
	var compo: String = "copas" if _tifo_titles() > 0 else "sigla"
	var flag: Image = _flag_of(team)
	if flag != null:
		compo = "bandera"
		_tifo_flag_lend = flag
	var grid: Dictionary = _tifo_grid_of(q_w, q_h, compo)
	_tifo_panel(root, slope_c, 0.0,(y_top + y_bot) * 0.5, q_w, q_h, grid)
	_tifo_flag_lend = null
	_tifo_club_lend = lend
	_club_a = a
	_club_b = b
	_club_abbrev = sigla
	return true






func _tifo_panel(root: Node3D, slope_c: Vector2, off_x: float, y_c: float,
		q_w: float, q_h: float, grid: Dictionary) -> MeshInstance3D:
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _tifo_make_shader()
	mat.set_shader_parameter("cards", _tifo_texture(grid, _tifo_emblem(grid)))
	mat.set_shader_parameter("grid",
		Vector2(float(grid["cols"]), float(grid["rows"])))
	mat.set_shader_parameter("fade", 1.0)
	_desp_add(mat)
	var holder: Node3D = Node3D.new()


	holder.position = Vector3(off_x, slope_c.x, slope_c.y)
	holder.rotation_degrees = Vector3(- STAND_SLOPE_DEG, 0.0, 0.0)
	root.add_child(holder)
	var pano: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(q_w, q_h)




	q.subdivide_width = clampi(int(q_w / 3.6), 6, 24)
	q.subdivide_depth = clampi(int(q_h / 2.4), 4, 8)
	pano.mesh = q
	pano.material_override = mat



	pano.extra_cull_margin = 1.5 + TIFO_AMP_GALE




	pano.position = Vector3(0.0, y_c, TIFO_Z)
	pano.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	holder.add_child(pano)
	_tifo_nodes.append(pano)
	_tifo_mats.append(mat)



	_cloth_panels.append(pano)
	_tifo_wind_refresh()
	return pano











func _box_ceiling_y() -> float:
	if _box_band_y.x > _box_band_y.y:
		return INF
	return _box_band_y.x - TIFO_BOX_GAP











func _tifo_ceiling_y() -> float:
	var cfg: Dictionary = _scoreboard_cfg()
	if not bool(cfg["present"]) or bool(cfg.get("manual", false)):
		return INF







	var foot: Vector2 = Vector2(STAND_SLOPE_FOOT_Y, STAND_SLOPE_FOOT_Z)
	var mount: Vector2 = foot.lerp(_slope_top(), float(cfg["t"]))
	return mount.x - 1.7 * float(cfg["scale"]) - TIFO_SB_GAP






func _tifo_grid_of(q_w: float, q_h: float, compo: String) -> Dictionary:
	var rows: int = clampi(int(round(q_h / TIFO_CELL_M)), 8, TIFO_ROWS)
	var cols: int = clampi(int(round(q_w / TIFO_CELL_M)), rows, TIFO_COLS_MAX)
	return {
		"cols": cols, "rows": rows, "compo": compo,



		"aspect":(q_w / float(cols)) / maxf(q_h / float(rows), 0.001),
	}











var compo_override: String = ""




var tifo_override: int = -1





var tifo_especial: Dictionary = {}



var rival_club: String = ""



var _tifo_esp_v: Variant = null
















func _tifo_especial() -> Dictionary:
	if _tifo_esp_v != null:
		return _tifo_esp_v
	var out: Dictionary = {}
	if not tifo_especial.is_empty():
		out = tifo_especial.duplicate(true)
		out.erase("volteo")
	elif _en_partido() and _is_home_ground() and not _sede_neutral \
			and _comp != "nat":
		out = Career.tifo_especial()
	_tifo_esp_v = out
	return out



func _derby_rival_id() -> String:
	if not rival_club.is_empty():
		return rival_club
	return String(_away_team().get("id", ""))










func _tifo_copas_vs() -> Array:
	if not _derby:
		return []
	var rival: String = _derby_rival_id()
	var mio: String = _tifo_club()
	if rival.is_empty() or mio.is_empty() or Teams.by_id(rival).is_empty() \
			or Teams.by_id(mio).is_empty():
		return []
	var mias: int = Palmares.total(mio)
	var suyas: int = Palmares.total(rival)
	return [mias, suyas] if mias > suyas else []








func _tifo_volteo() -> bool:
	if Settings.reduce_motion:
		return false
	if tifo_especial.has("volteo"):
		return bool(tifo_especial["volteo"])
	var esp: String = String(_tifo_especial().get("compo", ""))
	return _derby or _is_final or _big_night or _comp == "liguilla" \
			or _nat_heat() > 0.0 or esp == "retrato" or esp == "remontada"




func _tifo_coverage() -> float:
	if _is_final:
		return StandAccess.TIFO_MAX_COVERAGE



	if _derby or _big_night or party or _comp == "liguilla":
		return 0.82


	if not _tifo_especial().is_empty():
		return 0.82
	return [0.28, 0.34, 0.4][posmod(hash(_pitch_seed_club())>>5, 3)]


func _tifo_compo() -> String:
	if not compo_override.is_empty():
		return compo_override






	if _flag_of(_tifo_team()) != null:
		return "bandera"



	var esp: String = String(_tifo_especial().get("compo", ""))
	if not esp.is_empty():
		return esp
	if _is_final:
		return "copas" if _tifo_titles() > 0 else "sigla"
	if _derby and not _tifo_copas_vs().is_empty():
		return "copas_vs"
	if _derby or _big_night or _comp == "liguilla":
		return "sigla"
	var compo: String = TIFO_COMPOS[posmod(hash(_pitch_seed_club())>>11,
		TIFO_COMPOS.size())]
	return "pleno" if compo == "copas" and _tifo_titles() <= 0 else compo






func _tifo_side_compo(i: int) -> String:


	if _flag_of(_tifo_team()) != null:
		return "bandera"



	var esp: Dictionary = _tifo_especial()
	if String(esp.get("compo", "")) == "retrato" and int(esp.get("num", 0)) > 0:
		return "dorsal"
	return "sigla" if posmod(hash(_pitch_seed_club()) + i, 2) == 0 else "orla"







var _tifo_club_lend: String = ""
var _tifo_prestando: bool = false


func _tifo_club() -> String:
	return _tifo_club_lend if not _tifo_club_lend.is_empty() else _pitch_seed_club()


func _tifo_titles() -> int:
	var club: String = _tifo_club()
	if club.is_empty() or Teams.by_id(club).is_empty():
		return 0
	var p: Dictionary = Palmares.of(club)
	var big: int = int(p.get("champions", 0)) + int(p.get("clubes", 0))
	return mini(big if big > 0 else int(p.get("liga", 0)), TIFO_CUPS_MAX)





func _tifo_wants_crest(compo: String) -> bool:




	return not (compo in ["copas", "sigla", "bandera", "dorsal", "retrato",
		"remontada", "copas_vs"])






func _tifo_emblem_rows(grid: Dictionary) -> int:
	var k: float = 0.46 if String(grid["compo"]) == "franja" else 0.76
	return int(round(float(grid["rows"]) * k))






func _tifo_wind() -> float:
	var top: Array = Weather.WIND_MAX.values()
	var ref: float = float(top.max()) if not top.is_empty() else 7.0
	return clampf(float(Weather.WIND_MAX.get(_weather_id, 2.0)) / maxf(ref, 0.1),
		0.0, 1.0)





func _tifo_wind_refresh() -> void:
	var w: float = _tifo_wind()
	var quieto: bool = Settings.reduce_motion
	var amp: float = 0.0 if quieto else lerpf(TIFO_AMP_CALM, TIFO_AMP_GALE, w)
	var speed: float = lerpf(1.0, TIFO_SPEED_GALE, w)
	for mat in _tifo_mats:
		mat.set_shader_parameter("amp", amp)
		mat.set_shader_parameter("speed", speed)





	for mat in _flag_mats:
		mat.set_shader_parameter("amp", 0.0 if quieto else FLAG_AMP *(1.0 + w * 2.2))
		mat.set_shader_parameter("speed", speed)
		mat.set_shader_parameter("sweep",
			0.0 if quieto else lerpf(FLAG_SWEEP, FLAG_SWEEP_GALE, w))





	for mat in _serp_mats:
		mat.set_shader_parameter("amp",
			0.0 if quieto else lerpf(SERP_AMP_CALM, SERP_AMP_GALE, w))
		mat.set_shader_parameter("speed", speed)


	for mat in _giant_mats:
		mat.set_shader_parameter("amp", 0.0 if quieto else 0.34 + w * 0.55)
		mat.set_shader_parameter("speed", lerpf(0.42, 0.72, w))
		mat.set_shader_parameter("sweep",
			0.0 if quieto else lerpf(0.2, 0.34, w))


	for mat in _drape_mats:
		mat.set_shader_parameter("amp", 0.0 if quieto else 0.03 + w * 0.1)
		mat.set_shader_parameter("speed", speed)
		mat.set_shader_parameter("kinds", float(DRAPE_KINDS))

	SenaClub.viento(self)






func _tifo_contrast() -> Color:
	var lum: float =(_club_a.get_luminance() + _club_b.get_luminance()) * 0.5
	return Color(0.93, 0.92, 0.88) if lum < 0.5 else Color(0.08, 0.08, 0.1)







func _tifo_make_shader() -> Shader:
	if _tifo_shader != null:
		return _tifo_shader
	_tifo_shader = Shader.new()
	_tifo_shader.code = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled;\n// `repeat_disable`: el temblor corre el muestreo un pelo, y en la columna del canto eso\n// ENVUELVE y muestrea el canto contrario. En la vertical ya lo tapaba el `clamp`; en la\n// horizontal no lo tapaba nadie.\nuniform sampler2D cards : source_color, filter_nearest, repeat_disable;\nuniform vec2 grid = vec2(100.0, 24.0);\nuniform float amp = 0.0;        // metros de bombeo (0 = lona quieta)\nuniform float speed = 1.0;      // con viento la tela no bombea más: bombea MÁS RÁPIDO\nuniform float fade = 1.0;       // la curva bajando las cartulinas\nuniform float occ_alpha = 1.0;  // ver a través del estadio (ver _mat_alpha)\n// Las camisetas de la gente que espera la tela (ver el despliegue): los dos colores del\n// club, NO el dibujo de la celda — con el dibujo, la sigla salía escrita en el público.\nuniform vec4 gente_a : source_color = vec4(0.5);\nuniform vec4 gente_b : source_color = vec4(0.5);\n//VOLTEO//\n// El dado por celda, en una función porque lo usan el temblor del muestreo y, si algún\n// día vuelve, cualquier otra cosa que necesite LA MISMA persona en esa cartulina.\nfloat dado(vec2 p) {\n\treturn fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);\n}\n\n// LA ONDA. Tres senos de periodo distinto para que el bucle no se lea, y el paño\n// ATADO ARRIBA: la amplitud crece hacia abajo (en un QuadMesh la UV.y va de 0 arriba\n// a 1 abajo), que es como cuelga una tela de una barandilla.\nfloat ola(vec2 uv, float t) {\n\tfloat w = sin(uv.x * 7.0 + t * 1.30) * 0.55\n\t\t+ sin(uv.x * 3.1 - t * 0.87 + uv.y * 2.0) * 0.35\n\t\t+ sin(uv.y * 4.0 + t * 0.61) * 0.18;\n\treturn w * mix(0.30, 1.0, uv.y);\n}\n\n// LA ALZADA. Una cresta ancha que RECORRE el paño de un canto al otro cada ~7 s: la\n// hinchada empujando las cartulinas hacia arriba por bloques, como una ola de grada.\n// Es lo que faltaba (2026-10-20): con aire quieto el bombeo de 0,55 m apenas se ve a\n// veinte metros de cámara y la curva se leía como una pancarta impresa. Dos crestas\n// a distinto paso para que no se adivine el bucle. 0..1, picos suaves.\nfloat alzada(vec2 uv, float t) {\n\tfloat a = sin(uv.x * 5.2 - t * 0.95);\n\tfloat b = sin(uv.x * 2.3 + t * 0.53 + 1.7);\n\treturn pow(clamp(a * 0.6 + b * 0.4, 0.0, 1.0), 2.0);\n}\n\nvoid vertex() {\n\tfloat w = ola(UV, TIME * speed);\n\t// HACIA FUERA Y SÓLO HACIA FUERA. La onda se rectifica a 0..1 en vez de bombear a\n\t// los dos lados porque una lona amarrada contra una grada no puede hundirse DENTRO\n\t// del talud: al valle le salían las cabezas del público por delante del tifo. Y de\n\t// paso el paño se apoya en su sitio de siempre en vez de tener que flotar media\n\t// amplitud por delante para dejarle hueco al pliegue.\n\tVERTEX.z += (w * 0.5 + 0.5) * amp;\n\t// EL EMPUJÓN (2026-10-20, Cesar: «que no se vean tan estáticos»): la ola de\n\t// `alzada` también saca la tela hacia fuera donde pasa — la gente levanta los\n\t// brazos y la lona se despega del talud medio metro. Sólo hacia fuera, como el bombeo.\n\tVERTEX.z += alzada(UV, TIME * speed) * 0.45 * step(0.001, amp);\n\t// El pliegue ENCOGE la tela. Sin esto el paño gana superficie al ondular y se\n\t// despega de los bordes del talud por los lados.\n\tVERTEX.x *= 1.0 - abs(w) * 0.010;\n}\n\nvoid fragment() {\n\t// EL TEMBLOR DE LA GENTE. Cada cartulina la sostienen dos manos y no hay dos que\n\t// se muevan igual, así que se desplaza el MUESTREO por celda —no la geometría—:\n\t// con filtro NEAREST eso corre el borde de cada cartulina un pelo, que es justo\n\t// lo que se ve desde el campo. Sin esto la lona ondula ENTERA, como una pancarta\n\t// impresa, y se pierde que son treinta mil personas sosteniéndola.\n\tfloat live = step(0.001, amp);\n\tfloat t = TIME * speed;\n\tvec2 cell = floor(UV * grid);\n\tfloat n = dado(cell);\n\tvec2 dir = vec2(sin(t * 1.7 + n * 6.2831), cos(t * 2.3 + n * 6.2831));\n\t// Bajo la alzada la cartulina sube un pelo (el muestreo baja) y tiembla el doble:\n\t// son brazos estirados, que aguantan peor que a la altura del pecho.\n\tfloat al = alzada(UV, t) * live;\n\tvec2 uv = UV + dir * (0.0022 + 0.0030 * al) * live;\n\tuv.y += al * 0.35 / grid.y;\n\t// El clamp: el temblor corre el muestreo un pelo, y en la fila del canto eso saldría\n\t// de la tela. En horizontal lo tapa el `repeat_disable` del sampler.\n\tuv.y = clamp(uv.y, 0.001, 0.999);\n\tvec4 c = texture(cards, uv);\n\t// LA CARTULINA QUE AÚN NO SE HA LEVANTADO: se ve a quien la tiene. Detrás del paño la grada\n\t// no tiene público (sus butacas las reserva el tifo), y recortar la lona a secas\n\t// dejaba un hueco negro — Cesar, 2026-10-20: «se ve mal, sale negro». Aquí se\n\t// pinta una persona por cartulina, cabeza y camiseta del color de lo que va a\n\t// sostener (el dibujo de esa celda, apagado), sobre el oscuro de la grada.\n\tfloat dph = desp_fase(cell, grid);\n\tvec2 fc = fract(UV * grid);\n\t// La cartulina SUBE desde abajo de su hueco mientras se levanta (0..1): asoma\n\t// el canto de arriba primero, como cuando alguien la alza desde el regazo.\n\tif (dph < 1.0 && fc.y < 1.0 - max(dph, 0.0)) {\n\t\tfloat r = dado(cell + 11.0);\n\t\tvec3 piel = mix(vec3(0.93, 0.76, 0.60), vec3(0.40, 0.26, 0.17), r);\n\t\tvec3 camiseta = (dado(cell + 5.3) < 0.6 ? gente_a.rgb : gente_b.rgb) * 0.70;\n\t\tfloat hx = 0.5 + (r - 0.5) * 0.25;\n\t\tfloat cabeza = step(abs(fc.x - hx), 0.17) * step(0.12, fc.y) * step(fc.y, 0.44);\n\t\tfloat torso = step(abs(fc.x - 0.5), 0.36) * step(0.50, fc.y);\n\t\tc = vec4(mix(mix(vec3(0.07, 0.07, 0.08), camiseta, torso), piel, cabeza), 1.0);\n\t}\n\t// EL VOLTEO (ver `_volteo_add`): mientras le llega la ola, la cartulina enseña su\n\t// cara lisa; al girar se estrecha hasta quedarse de canto —y por los lados asoma el\n\t// oscuro de la gente que la sostiene— y se abre ya con el dibujo. Con `reveal` a 9\n\t// (cualquier noche sin volteo) la fase pasa de 1 en todas las celdas y esto no pinta.\n\tfloat ph = volteo_fase(cell, grid);\n\tif (ph < 1.0) {\n\t\tvec3 cara = ph < 0.5 ? reverso.rgb * (0.88 + 0.24 * dado_v(cell + 3.7)) : c.rgb;\n\t\tfloat dentro = step(abs(fract(UV.x * grid.x) - 0.5) * 2.0, volteo_ancho(ph));\n\t\tc.rgb = mix(vec3(0.06, 0.06, 0.07), cara, dentro);\n\t}\n\t// La luz del pliegue: la cresta mira al cielo y se aclara, el valle se ensombrece.\n\t// Es lo que separa una TELA de un rectángulo pintado, y con viento fuerte es la\n\t// mitad de lo que se ve — la silueta se mueve poco, la sombra del pliegue mucho.\n\t// Y CADA CARTULINA CAPTA LA LUZ A SU AIRE: cada mano la inclina distinto y a\n\t// distinto ritmo, así que el brillo parpadea por celda (±7 %) — el chisporroteo que\n\t// separa treinta mil cartones de una lona. Bajo la alzada, de cara al foco, aclara.\n\tfloat brillo = sin(t * (2.1 + n * 1.9) + n * 40.0) * 0.07 * live + al * 0.10;\n\tALBEDO = c.rgb * (1.0 + ola(UV, t) * 0.22 * live + brillo);\n\tALPHA = c.a * fade * occ_alpha;\n}\n"























































































































	_tifo_shader.code = _tifo_shader.code.replace("//VOLTEO//", _volteo_glsl())
	return _tifo_shader



















func _tifo_emblem(grid: Dictionary) -> Image:
	match String(grid.get("compo", "")):
		"sigla":
			return _tifo_word_image(_club_abbrev, grid)
		"dorsal":
			return _tifo_dorsal_image(grid)
		"retrato":
			return _tifo_retrato_image(grid)
		"remontada":
			return _tifo_remontada_image(grid)
		"copas_vs":
			return _tifo_copas_vs_image(grid)
	return null



const TIFO_INK: Color = Color(0.93, 0.92, 0.88)



const TIFO_GOLD: Color = Color(0.88, 0.69, 0.21)
const TIFO_GREY: Color = Color(0.52, 0.53, 0.56)

const TIFO_TACHA: Color = Color(0.8, 0.13, 0.12)




func _tifo_px_fit(texto: String, max_w: float, max_h: float) -> int:
	var px: int = 1
	while px < 12:
		if float(PixelText.text_width(texto, px + 1)) > max_w:
			break
		if float(PixelText.GLYPH_H *(px + 1)) > max_h:
			break
		px += 1
	return px







func _tifo_dorsal_image(grid: Dictionary) -> Image:
	var num: int = int(_tifo_especial().get("num", 0))
	if num <= 0 or int(grid.get("cols", 0)) <= 0:
		return null
	var texto: String = str(mini(num, 99))
	var px: int = _tifo_px_fit(texto, minf(float(grid["cols"]) * 0.72, 34.0),
		float(grid["rows"]) * 0.84)
	var img: Image = Image.create(PixelText.text_width(texto, px),
		PixelText.GLYPH_H * px, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	PixelText.draw_text(img, 0, 0, texto, TIFO_INK, px)
	return img













func _tifo_retrato_image(grid: Dictionary) -> Image:
	var rows: int = int(grid.get("rows", 0))
	var cols: int = int(grid.get("cols", 0))

	var alto: int = int(round(float(rows) * 0.78))
	if alto < 8 or cols < 12:
		return null
	var foto: Image = _hate_banner_foto(alto, false, false)
	if foto == null:
		return null


	var ancho: int = clampi(int(round(float(alto) / maxf(float(grid["aspect"]), 0.2))),
		4, cols - 4)
	if ancho == alto:
		return foto
	var out: Image = Image.create(ancho, alto, false, Image.FORMAT_RGBA8)
	for y in alto:
		for x in ancho:
			out.set_pixel(x, y, foto.get_pixel(mini(x * alto / ancho, alto - 1), y))
	return out



















func _tifo_remontada_image(grid: Dictionary) -> Image:
	var ida: Array = _tifo_especial().get("ida", [])
	if ida.size() < 2 or int(grid.get("cols", 0)) <= 0:
		return null
	var mios: int = int(ida[0])
	var suyos: int = int(ida[1])
	if suyos <= mios:
		return null
	var marcador: String = "%d-%d" % [mios, suyos]
	var cuenta: String = "+%d" % mini(suyos - mios, 9)
	var max_w: float = minf(float(grid["cols"]) * 0.72, 34.0)
	var max_h: float = float(grid["rows"]) - 2.0
	var p1: int = 0
	var p2: int = 0
	for b in range(8, 1, -1):
		for a in range(b, 1, -1):
			if PixelText.GLYPH_H *(a + b) + a > int(max_h):
				continue
			if float(PixelText.text_width(marcador, a)) > max_w \
					or float(PixelText.text_width(cuenta, b)) > max_w:
				continue
			p1 = a
			p2 = b
			break
		if p2 > 0:
			break
	if p2 == 0:

		var px: int = _tifo_px_fit(cuenta, max_w, max_h)
		var solo: Image = Image.create(PixelText.text_width(cuenta, px),
			PixelText.GLYPH_H * px, false, Image.FORMAT_RGBA8)
		solo.fill(Color(0, 0, 0, 0))
		PixelText.draw_text(solo, 0, 0, cuenta, TIFO_INK, px)
		return solo
	var w1: int = PixelText.text_width(marcador, p1)
	var w2: int = PixelText.text_width(cuenta, p2)


	var iw: int = maxi(w1 + p1 * 2, w2)
	var ih: int = PixelText.GLYPH_H *(p1 + p2) + p1
	var img: Image = Image.create(iw, ih, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var x1: int =(iw - w1) / 2
	PixelText.draw_text(img, x1, 0, marcador, TIFO_INK, p1)
	PixelText.draw_text(img,(iw - w2) / 2, PixelText.GLYPH_H * p1 + p1, cuenta,
		TIFO_INK, p2)



	var tx0: int = maxi(x1 - p1, 0)
	var tx1: int = mini(x1 + w1 + p1, iw) - 1
	var alto1: int = PixelText.GLYPH_H * p1
	for x in range(tx0, tx1 + 1):
		var t: float = float(x - tx0) / maxf(float(tx1 - tx0), 1.0)
		var yc: int = int(round(lerpf(float(alto1 - 1), 0.0, t)))
		for g in maxi(p1, 1):
			var y: int = clampi(yc + g - p1 / 2, 0, alto1 - 1)
			img.set_pixel(x, y, TIFO_TACHA)
	return img









func _tifo_copas_vs_image(grid: Dictionary) -> Image:
	var vs: Array = _tifo_copas_vs()
	if vs.size() < 2 or int(grid.get("cols", 0)) <= 0:
		return null
	var rows: int = int(grid["rows"])
	var cw: int = String(TIFO_CUP[0]).length()
	var ch: int = TIFO_CUP.size()
	var k: int = 2 if float(ch * 2) <= float(rows) * 0.84 else 1
	var k2: int = maxi(k - 1, 1)
	var mio: String = str(mini(int(vs[0]), 99))
	var suyo: String = str(mini(int(vs[1]), 99))
	var w_mio: int = cw * k + k + PixelText.text_width(mio, k)
	var w_suyo: int = cw * k2 + k2 + PixelText.text_width(suyo, k2)
	var hueco: int = 3 * k
	var iw: int = w_mio + hueco + w_suyo
	var ih: int = ch * k
	if iw > int(grid["cols"]) or ih > rows:
		return null
	var img: Image = Image.create(iw, ih, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	_tifo_cup_at(img, 0, 0, k, TIFO_GOLD)
	PixelText.draw_text(img, cw * k + k,(ih - PixelText.GLYPH_H * k) / 2, mio,
		TIFO_GOLD, k)


	var x2: int = w_mio + hueco
	var y2: int = ih - ch * k2
	_tifo_cup_at(img, x2, y2, k2, TIFO_GREY)
	PixelText.draw_text(img, x2 + cw * k2 + k2,
		y2 +(ch * k2 - PixelText.GLYPH_H * k2) / 2, suyo, TIFO_GREY, k2)
	return img



func _tifo_cup_at(img: Image, x0: int, y0: int, px: int, tinta: Color) -> void:
	for y in TIFO_CUP.size():
		var linea: String = TIFO_CUP[y]
		for x in linea.length():
			if linea[x] != "#":
				continue
			for dy in px:
				for dx in px:
					img.set_pixel(x0 + x * px + dx, y0 + y * px + dy, tinta)






func _tifo_word_image(text: String, grid: Dictionary) -> Image:
	if text.is_empty() or int(grid.get("cols", 0)) <= 0:
		return null






	var cols: int = int(grid["cols"])
	var rows: int = int(grid["rows"])
	var max_w: float = minf(float(cols) * 0.72, 30.0)
	var px: int = 1
	while px < 12:
		if float(PixelText.text_width(text, px + 1)) > max_w:
			break
		if float(PixelText.GLYPH_H *(px + 1)) > float(rows) * 0.62:
			break
		px += 1
	var iw: int = PixelText.text_width(text, px)
	var ih: int = PixelText.GLYPH_H * px
	if iw <= 0 or ih <= 0:
		return null
	var img: Image = Image.create(iw, ih, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	PixelText.draw_text(img, 0, 0, text, Color(0.93, 0.92, 0.88), px)
	return img







func _tifo_cups_image(grid: Dictionary) -> Image:
	var n: int = _tifo_titles()
	if n <= 0:
		return null
	var cw: int = String(TIFO_CUP[0]).length()
	var ch: int = TIFO_CUP.size()
	var cols: int = int(grid["cols"])
	var rows: int = int(grid["rows"])
	var filas: int = 1 if n < TIFO_CUPS_WRAP else 2
	var por_fila: int = int(ceil(float(n) / float(filas)))




	var max_w: float = minf(float(cols) * 0.72, 34.0)
	var px: int = 1
	while px < 8:
		var k: int = px + 1
		if float(por_fila *(cw + 1) * k - k) > max_w:
			break
		if float(filas *(ch + 1) * k - k) > float(rows) * 0.84:
			break
		px += 1
	var iw: int = por_fila *(cw + 1) * px - px
	var ih: int = filas *(ch + 1) * px - px
	if iw <= 0 or ih <= 0 or iw > cols or ih > rows:
		return null
	var img: Image = Image.create(iw, ih, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var tinta: Color = Color(0.93, 0.92, 0.88)
	for c in n:
		var fila_i: int = c / por_fila
		var col_i: int = c % por_fila



		var en_esta: int = mini(n - fila_i * por_fila, por_fila)
		var x0: int = col_i *(cw + 1) * px \
				+(por_fila - en_esta) *(cw + 1) * px / 2
		var y0: int = fila_i *(ch + 1) * px
		for y in ch:
			var linea: String = TIFO_CUP[y]
			for x in cw:
				if linea[x] != "#":
					continue
				for dy in px:
					for dx in px:
						img.set_pixel(x0 + x * px + dx, y0 + y * px + dy, tinta)
	return img






















func _tifo_crest_want(pano: MeshInstance3D, grid: Dictionary,
		size: Vector2) -> void:
	if pano == null or size.y <= 0.0:
		return
	_tifo_crest_pend.append({"pano": pano, "grid": grid, "size": size})




	if _tifo_crest_asked:
		return
	_tifo_crest_asked = true
	_tifo_add_crest()


func _tifo_add_crest() -> void:
	var team: Dictionary = _tifo_team()
	if team.is_empty():
		_tifo_crest_pend.clear()
		return
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(TIFO_CREST_PX, TIFO_CREST_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(TIFO_CREST_PX, TIFO_CREST_PX)
	crest.set_team(team)
	vp.add_child(crest)



	await RenderingServer.frame_post_draw
	await RenderingServer.frame_post_draw
	if not is_inside_tree():
		return


	if not is_instance_valid(vp):
		_tifo_crest_pend.clear()
		return
	var img: Image = vp.get_texture().get_image()
	vp.queue_free()



	if img == null or img.is_empty():
		_tifo_crest_pend.clear()
		return


	if _tifo_fade >= 0.0:
		_tifo_crest_pend.clear()
		return
	var halo: Color = _crest_halo(img)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var px: float = 1.0 / float(maxi(img.get_width(), 1))
	for e in _tifo_crest_pend:
		var pano: MeshInstance3D = e["pano"]
		if pano == null or not is_instance_valid(pano):
			continue
		_build_tifo_crest(pano, e["grid"], e["size"], tex, halo, px)
	_tifo_crest_pend.clear()







func _build_tifo_crest(pano: MeshInstance3D, grid: Dictionary, size: Vector2,
		tex: ImageTexture, halo: Color, px: float) -> void:
	var rows: int = maxi(int(grid.get("rows", 0)), 1)
	var holder: Node = pano.get_parent()
	if holder == null or size.y <= 0.0:
		return
	var h: float = size.y * float(_tifo_emblem_rows(grid)) / float(rows)
	var w: float = h
	if w >= size.x:
		return
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _tifo_make_crest_shader()
	mat.set_shader_parameter("crest", tex)





	mat.set_shader_parameter("halo", halo)
	mat.set_shader_parameter("px", px)



	mat.set_shader_parameter("uv_scl", Vector2(w / size.x, h / size.y))
	mat.set_shader_parameter("uv_off",
		Vector2(0.5 - w / size.x * 0.5, 0.5 - h / size.y * 0.5))


	var mat_pano: ShaderMaterial = pano.material_override as ShaderMaterial
	if mat_pano != null:
		mat.set_shader_parameter("fade",
			float(mat_pano.get_shader_parameter("fade")))



		mat.set_shader_parameter("grid", mat_pano.get_shader_parameter("grid"))
		mat.set_shader_parameter("reveal", mat_pano.get_shader_parameter("reveal"))
		if _volteo_mats.has(mat_pano):
			_volteo_mats.append(mat)
		mat.set_shader_parameter("despliegue",
			mat_pano.get_shader_parameter("despliegue"))
		if _desp_mats.has(mat_pano):
			_desp_mats.append(mat)
	var lamina: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(w, h)


	q.subdivide_width = 8
	q.subdivide_depth = 8
	lamina.mesh = q
	lamina.material_override = mat
	lamina.position = pano.position + Vector3(0.0, 0.0, TIFO_CREST_GAP)
	lamina.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	lamina.extra_cull_margin = 1.5 + TIFO_AMP_GALE
	holder.add_child(lamina)



	_tifo_nodes.append(lamina)
	_tifo_mats.append(mat)
	_tifo_wind_refresh()





func _crest_halo(img: Image) -> Color:
	var lum: float = 0.0
	var cnt: int = 0


	var step: int = 4
	var y: int = 0
	while y < img.get_height():
		var x: int = 0
		while x < img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a >= 0.45:
				lum += c.get_luminance()
				cnt += 1
			x += step
		y += step
	if cnt == 0:
		return Color(0.93, 0.92, 0.88)
	return Color(0.93, 0.92, 0.88) if lum / float(cnt) < 0.5 \
			else Color(0.08, 0.08, 0.1)






func _tifo_make_crest_shader() -> Shader:
	if _tifo_crest_shader != null:
		return _tifo_crest_shader
	_tifo_crest_shader = Shader.new()
	_tifo_crest_shader.code = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled;\nuniform sampler2D crest : source_color, filter_linear_mipmap, repeat_disable;\nuniform vec4 halo : source_color = vec4(1.0);\nuniform float px = 0.004;          // un texel del escudo, para el contorno\nuniform vec2 uv_off = vec2(0.0);   // dónde cae esta lámina dentro de la UV del paño\nuniform vec2 uv_scl = vec2(1.0);\nuniform float amp = 0.0;\nuniform float speed = 1.0;\nuniform float fade = 1.0;\nuniform float occ_alpha = 1.0;\nuniform vec2 grid = vec2(100.0, 24.0);  // la rejilla del PAÑO, para el volteo\n//VOLTEO//\n\nfloat ola(vec2 uv, float t) {\n\tfloat w = sin(uv.x * 7.0 + t * 1.30) * 0.55\n\t\t+ sin(uv.x * 3.1 - t * 0.87 + uv.y * 2.0) * 0.35\n\t\t+ sin(uv.y * 4.0 + t * 0.61) * 0.18;\n\treturn w * mix(0.30, 1.0, uv.y);\n}\n\nvoid vertex() {\n\tfloat w = ola(uv_off + UV * uv_scl, TIME * speed);\n\tVERTEX.z += (w * 0.5 + 0.5) * amp;\n}\n\nvoid fragment() {\n\tfloat live = step(0.001, amp);\n\tvec4 c = texture(crest, UV);\n\t// EL CONTORNO: se mira el alfa del escudo a ocho vecinos a dos texeles. Donde\n\t// aquí no hay escudo pero al lado sí, se pinta el halo — que es exactamente el\n\t// borde de una cartulina, sólo que resuelto en el fragmento en vez de en la\n\t// rejilla. Va DEBAJO del propio escudo (se mezcla por alfa), así que un logo\n\t// importado con sus letras no pierde ni un píxel.\n\tfloat o = 0.0;\n\tfor (int i = 0; i < 8; i++) {\n\t\tfloat a = float(i) * 0.7853981;\n\t\to = max(o, texture(crest, UV + vec2(cos(a), sin(a)) * px * 2.0).a);\n\t}\n\tfloat ring = clamp(o - c.a, 0.0, 1.0);\n\tvec3 col = mix(halo.rgb, c.rgb, c.a);\n\tALBEDO = col * (1.0 + ola(uv_off + UV * uv_scl, TIME * speed) * 0.22 * live);\n\t// EL VOLTEO, en la celda DEL PAÑO que cae debajo de este fragmento: mientras esa\n\t// cartulina sigue lisa el escudo no existe, y al girar se abre con el mismo ancho\n\t// que la tela de detrás — el escudo sale por cartulinas, no de golpe por delante.\n\tvec2 puv = uv_off + UV * uv_scl;\n\tfloat ph = volteo_fase(floor(puv * grid), grid);\n\t// El escudo va pintado en las cartulinas: sale con ellas, cada una a su tiempo.\n\tfloat dph = desp_fase(floor(puv * grid), grid);\n\tfloat vis = dph >= 1.0 ? 1.0\n\t\t: step(1.0 - max(dph, 0.0), fract(puv.y * grid.y)) * step(0.0, dph);\n\tif (ph < 1.0) {\n\t\tvis *= ph < 0.5 ? 0.0\n\t\t\t: step(abs(fract(puv.x * grid.x) - 0.5) * 2.0, volteo_ancho(ph));\n\t}\n\tALPHA = max(c.a, ring) * fade * occ_alpha * vis;\n}\n"


























































	_tifo_crest_shader.code = _tifo_crest_shader.code.replace("//VOLTEO//",
		_volteo_glsl())
	return _tifo_crest_shader





func _away_team() -> Dictionary:
	if home_only or att_override >= 0.0:
		return {}
	var f: Dictionary = GameState.current_fixture()
	var opp: String = String(f.get("opp", ""))
	if opp.is_empty():
		return {}
	var club: String = opp if bool(f.get("home", true)) else GameState.player_team_id
	if club == _club_local():
		return {}
	var t: Dictionary = Teams.by_id(club)
	return t if not t.is_empty() else Nations.as_team(club)





func _tifo_team() -> Dictionary:
	var club: String = _tifo_club()
	if club.is_empty():
		return {}
	var team: Dictionary = Teams.by_id(club)
	return team if not team.is_empty() else Nations.as_team(club)



















const FLAG_ASPECT: float = 1.5




var _flag_imgs: Dictionary = {}



func _flag_of(team: Dictionary) -> Image:
	if team.is_empty() or not bool(team.get("is_nation", false)):
		return null
	var id: String = String(team.get("id", ""))
	if id.is_empty() or not Flags.has(id):
		return null
	if _flag_imgs.has(id):
		return _flag_imgs[id]
	var tex: Texture2D = Flags.texture(id)
	if tex == null:
		return null
	var raw: Image = tex.get_image()
	if raw == null or raw.is_empty():
		return null
	var w: int = raw.get_width()
	var h: int = raw.get_height()
	var ix: int = 1 if w > 2 else 0
	var iy: int = 1 if h > 2 else 0
	var img: Image = raw.get_region(Rect2i(ix, iy, w - ix * 2, h - iy * 2))
	_flag_imgs[id] = img
	return img





func _side_team(is_home: bool) -> Dictionary:
	return _tifo_team() if is_home else _away_team()




func _flag_pick(img: Image, u: float, v: float) -> Color:
	var x: int = clampi(int(u * float(img.get_width())), 0, img.get_width() - 1)
	var y: int = clampi(int(v * float(img.get_height())), 0, img.get_height() - 1)
	return img.get_pixel(x, y)










func _flag_colors(img: Image) -> Array[Color]:
	var tally: Dictionary = {}
	for y in img.get_height():
		for x in img.get_width():
			var c: Color = img.get_pixel(x, y)
			if c.a <= 0.0:
				continue
			var k: int =(int(c.r * 15.0)<<8)|(int(c.g * 15.0)<<4) \
					|int(c.b * 15.0)
			var e: Array = tally.get(k, [0, c])
			tally[k] = [int(e[0]) + 1, e[1]]
	var order: Array = tally.values()
	order.sort_custom(func(a, b): return int(a[0]) > int(b[0]))
	var out: Array[Color] = []
	for e in order:
		out.append(e[1] as Color)
	if out.is_empty():
		return [_club_a, _club_b]


	if out.size() > 1 and out[0].get_luminance() > 0.8:
		var sw: Color = out[0]
		out[0] = out[1]
		out[1] = sw
	if out.size() == 1:
		out.append(out[0].lerp(Color("f2f2f0"), 0.6))
	return out







var _tifo_flag_lend: Image = null






func _tifo_texture(grid: Dictionary, emblem: Image = null) -> ImageTexture:
	var cols: int = maxi(int(grid["cols"]), 1)
	var rows: int = maxi(int(grid["rows"]), 1)
	var compo: String = String(grid["compo"])
	var img: Image = Image.create(cols, rows, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(_pitch_seed_club())
	var team: Dictionary = _tifo_team()



	var flag: Image = _tifo_flag_lend if _tifo_flag_lend != null \
			else _flag_of(team)
	var pat: String = String(team.get("pattern", ""))
	if pat.is_empty() or pat == "plain":
		pat = TIFO_FALLBACK[posmod(hash(_pitch_seed_club())>>5,
			TIFO_FALLBACK.size())]
	var pat_w: int = Teams.local_pat_w(team) if not team.is_empty() else 3


	if emblem == null and compo == "copas":
		emblem = _tifo_cups_image(grid)



	var mask: PackedByteArray = PackedByteArray()
	mask.resize(cols * rows)
	var ink: PackedColorArray = PackedColorArray()
	ink.resize(cols * rows)



	var band0: int = -1
	var band1: int = -1
	if compo == "franja":
		var eh: int = _tifo_emblem_rows(grid)
		band0 = maxi((rows - eh) / 2 - 1, 0)
		band1 = mini(band0 + eh + 1, rows - 1)



	var a_color: bool = compo == "retrato" or compo == "remontada" \
			or compo == "copas_vs"
	if emblem != null:
		_tifo_stamp(emblem, mask, ink, grid, not a_color)





	if compo == "orla" or compo == "sigla" or compo == "retrato":
		var orla: Color = _tifo_contrast()
		var g: int = clampi(int(round(float(rows) * 0.09)), 1, 3)
		for y in rows:
			for x in cols:
				if y >= g and y < rows - g and x >= g and x < cols - g:
					continue
				mask[y * cols + x] = 3
				ink[y * cols + x] = orla
	var aspect: float = float(grid["aspect"])







	var fondo_liso: Color = _club_a
	if compo == "remontada" and _club_a.get_luminance() > 0.5:
		fondo_liso = _club_b if _club_b.get_luminance() < 0.4 \
				else Color(0.08, 0.08, 0.1)
	for y in rows:
		for x in cols:
			var i: int = y * cols + x
			var c: Color
			if mask[i] != 0:
				c = ink[i]
			elif y >= band0 and y <= band1:
				c = _tifo_contrast()
			elif compo == "bandera" and flag != null:














				var half: float = float(rows) * FLAG_ASPECT \
						/ maxf(float(aspect), 0.001) * 0.5
				var u: float = clampf(
					(float(x) + 0.5 - float(cols) * 0.5) / maxf(half * 2.0, 1.0)
					+ 0.5, 0.0, 1.0)
				c = _flag_pick(flag, u,(float(y) + 0.5) / float(rows))
			elif compo == "mosaico":



				var bx: int = x / 4
				var by: int = y / maxi(int(round(4.0 * aspect)), 2)
				c = _club_a if (bx + by) % 2 == 0 else _club_b
			elif compo == "remontada" or compo == "copas_vs":




				c = fondo_liso
			else:
				c = _tifo_pattern_color(pat, x, y, pat_w, grid)


			c = c.lerp(Color.WHITE if rng.randf() < 0.5 else Color.BLACK,
				rng.randf_range(0.0, 0.16))
			img.set_pixel(x, y, Color(c.r, c.g, c.b, 1.0))
	return ImageTexture.create_from_image(img)












func _tifo_pattern_color(pat: String, x: int, y: int, pat_w: int,
		grid: Dictionary) -> Color:



	var span: float = 2.0 * float(maxi(int(grid["rows"]) - 1, 1))
	var bb: Rect2i = Rect2i(0, 0, TIFO_PAT_COLS, int(round(span / 0.62)))
	var vx: int = x * TIFO_PAT_COLS / maxi(int(grid["cols"]), 1)
	var vy: int = int(round(0.48 * span)) + y
	return KitPatternGeo.pixel(pat, vx, vy, bb, _club_a, _club_b, pat_w)











func _tifo_stamp(emblem: Image, mask: PackedByteArray, ink: PackedColorArray,
		grid: Dictionary, snap: bool = true) -> void:
	var cols: int = int(grid["cols"])
	var rows: int = int(grid["rows"])
	var pal: Array[Color] = [_club_a, _club_b,
		Color(0.93, 0.92, 0.88), Color(0.08, 0.08, 0.1)]
	var ew: int = emblem.get_width()
	var eh: int = emblem.get_height()
	var ox: int =(cols - ew) / 2




	var oy: int =(rows - eh) / 2
	var lum: float = 0.0
	var cnt: int = 0
	for y in eh:
		for x in ew:
			var src: Color = emblem.get_pixel(x, y)



			if src.a < 0.45:
				continue
			var gx: int = ox + x
			var gy: int = oy + y
			if gx < 0 or gy < 0 or gx >= cols or gy >= rows:
				continue
			var q: Color = _tifo_snap(src, pal) if snap \
					else Color(src.r, src.g, src.b, 1.0)
			mask[gy * cols + gx] = 1
			ink[gy * cols + gx] = q
			lum += q.get_luminance()
			cnt += 1
	if cnt == 0:
		return


	var halo: Color = pal[2] if lum / float(cnt) < 0.5 else pal[3]
	for y in rows:
		for x in cols:
			var i: int = y * cols + x
			if mask[i] == 0 and _tifo_touches(mask, grid, x, y):
				mask[i] = 2
				ink[i] = halo


func _tifo_touches(mask: PackedByteArray, grid: Dictionary, x: int, y: int) -> bool:
	var cols: int = int(grid["cols"])
	var rows: int = int(grid["rows"])
	for d in TIFO_NEI:
		var nx: int = x + d.x
		var ny: int = y + d.y
		if nx < 0 or ny < 0 or nx >= cols or ny >= rows:
			continue
		if mask[ny * cols + nx] == 1:
			return true
	return false





func _tifo_snap(c: Color, pal: Array[Color]) -> Color:
	var best: Color = pal[0]
	var bd: float = 1000000000.0
	for p in pal:
		var d: float =(p.r - c.r) *(p.r - c.r) +(p.g - c.g) *(p.g - c.g) \
				+(p.b - c.b) *(p.b - c.b)
		if d < bd:
			bd = d
			best = p
	return best





















const FLAG_W: float = 1.05
const FLAG_H: float = 0.68
const FLAG_STEP: float = 4.6
const FLAG_UP: float = 1.15





const FLAG_ROWS_UP: int = 5




const FLAG_ROW_BIAS: float = 1.7
const FLAG_AMP: float = 0.1




const FLAG_SWEEP: float = 0.4
const FLAG_SWEEP_GALE: float = 0.62











const FLAG_TAM_MIN: float = 0.72
const FLAG_TAM_MAX: float = 1.55
const FLAG_ASP_MIN: float = 0.88
const FLAG_ASP_MAX: float = 1.15




var _flag_xy: Array[Vector2] = []
var _flag_mats: Array[ShaderMaterial] = []
var _flag_shader: Shader = null



var _giant_mats: Array[ShaderMaterial] = []







func _fan_row_at(row: int) -> Vector2:
	var z: float = -2.4 - float(row) * STAND_FAN_ROW_DZ
	return Vector2(1.0 +(- z - 1.5) * 1.6 + 0.15, z)


















func _fan_rows(scale: float = 1.0) -> int:
	var want: int = maxi(1, int(round(float(_stands_cfg()["rows"]) * scale)))


	var crown_z: float = _slope_top(scale).y
	while want > 1 and _fan_row_at(want - 1).y < crown_z:
		want -= 1
	return want










































const STAND_EYE_LIFT: float = 2.6
const STAND_VIEW_ROW_FRAC: float = 0.34








func front_row_spot(x: float, adelante: float = 0.35) -> Vector3:
	var mejor: Vector3 = Vector3.INF
	var fila: Vector2 = _fan_row_at(0)
	for root in _stand_roots:
		if not is_instance_valid(root) or not root.is_inside_tree():
			continue
		var largo: float = float(root.get_meta("celu_largo", 0.0))


		var local: Vector3 = root.to_local(Vector3(x, 0.0, 0.0))
		if absf(local.x) > largo * 0.5 - 1.2:
			continue
		var p: Vector3 = root.to_global(Vector3(local.x, fila.x, fila.y + adelante))


		if p.z >= -1.0 or absf(p.x - x) > 0.5:
			continue
		if mejor == Vector3.INF or p.y < mejor.y:
			mejor = p
	return mejor








func clear_flags_near(p: Vector3, r: float = 1.4) -> int:
	var quitadas: int = 0
	for root in _stand_roots:
		if not is_instance_valid(root):
			continue
		for n in root.get_children():
			var mmi: MultiMeshInstance3D = n as MultiMeshInstance3D
			if mmi == null or mmi.multimesh == null \
					or not _flag_mats.has(mmi.material_override):
				continue
			var mm: MultiMesh = mmi.multimesh
			var xf_g: Transform3D = mmi.global_transform
			for k in mm.visible_instance_count if mm.visible_instance_count >= 0 \
					else mm.instance_count:
				var xf: Transform3D = mm.get_instance_transform(k)
				var w: Vector3 = xf_g * xf.origin
				if Vector2(w.x - p.x, w.z - p.z).length() > r or absf(w.y - p.y) > 3.0:
					continue
				mm.set_instance_transform(k,
					Transform3D(Basis().scaled(Vector3.ONE * 0.0001), xf.origin))
				quitadas += 1
				for i in range(_sueltos.size() - 1, -1, -1):
					var s: Dictionary = _sueltos[i]
					if s.get("mm") == mm and int(s.get("k", -1)) == k:
						_sueltos.remove_at(i)
	return quitadas


func stand_view_spot(toward: Vector3) -> Vector3:


	var t: Vector3 = _wp(toward)
	var side: float = 1.0 if t.x >= 0.0 else -1.0






	var lat_x: float = SIDE_STAND_X
	var lat_scale: float = 1.0
	var visto: bool = false
	for v in _side_views:
		if signf(float(v["side"])) != side:
			continue
		if not visto or float(v["x"]) < lat_x:
			lat_x = float(v["x"])
			lat_scale = float(v["scale"])
			visto = true
	var rows: int = maxi(int(_stands_cfg().get("rows", 6)), 1)





	var techo: int = maxi(_fan_rows(lat_scale) - 1, 1)
	var row: int = clampi(int(round(float(rows) * STAND_VIEW_ROW_FRAC)), 1, techo)














	if div < 3:
		row = clampi(maxi(row, FLAG_ROWS_UP), 1, techo)


	var yz: Vector2 = _fan_row_at(row)
	return _wp(Vector3(side *(lat_x - yz.y), yz.x + STAND_EYE_LIFT, t.z))
















func _en_obra(works: bool, x: float) -> bool:
	return works and x > _obra_x0





var _obra_x0: float = 0.0


func _build_front_flags(root: Node3D, length: float, scale: float,
		works: bool = false) -> void:






	if div >= 3:
		return
	if _att < 0.3 or length < 20.0:
		return



	if _away_whole_stand(root.position):
		return
	var sections: int = maxi(int(round(length / 13.0)), 1)
	var first_away: int = _away_first_section(root.position, sections)
	var usable: float = length * float(mini(first_away, sections)) / float(sections)
	var step: float = FLAG_STEP
	var n: int = int(usable / step)
	if n < 2:
		return
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = Vector2(FLAG_W, FLAG_H)


	mesh.subdivide_width = 4
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.use_custom_data = true
	mm.mesh = mesh
	mm.instance_count = n
	var x0: float = - length * 0.5 + step * 0.5




	var filas_up: int = clampi(_fan_rows(scale) - 1, 0, FLAG_ROWS_UP)
	var puestas: int = 0


	var cola: Dictionary = root.get_meta("cola_grada", {})
	var sujetas: Array[Dictionary] = []
	for i in n:
		var x: float = x0 + float(i) * step
		if _en_obra(works, x):
			continue




		var k: int = puestas
		puestas += 1










		var h1: float = fmod(absf(x) * 0.7331 + float(i) * 0.377, 1.0)
		var h2: float = fmod(absf(x) * 0.2113 + float(i) * 0.618, 1.0)



		var h4: float = fmod(absf(x) * 0.515 + float(i) * 0.236, 1.0)
		var h5: float = fmod(absf(x) * 0.1234 + float(i) * 0.809, 1.0)



		var h3: float = fmod(absf(x) * 0.4771 + float(i) * 0.137, 1.0)
		mm.set_instance_custom_data(k,
			Color(h1, 0.75 + h2 * 0.6, 0.75 +(1.0 - h2) * 0.5, 0.0))




		var roll: float = deg_to_rad(lerpf(-26.0, 26.0, h1))
		var yaw: float = deg_to_rad(lerpf(-18.0, 18.0, h2))
		var tam: float = lerpf(FLAG_TAM_MIN, FLAG_TAM_MAX, h4)
		var asp: float = lerpf(FLAG_ASP_MIN, FLAG_ASP_MAX, h5)
		var esc_x: float = tam * asp
		var esc_y: float = tam / asp
		var b: Basis = Basis.from_euler(Vector3(0.0, yaw, roll)).scaled(
			Vector3(esc_x, esc_y, 1.0))














		var fila_i: int = int(floor(pow(h3, FLAG_ROW_BIAS) * float(filas_up + 1)))
		var fila: Vector2 = _fan_row_at(fila_i)





		var up: float = FLAG_UP +(esc_y - 1.0) * FLAG_H * 0.5
		var pie: Vector3 = Vector3(x, fila.x + up, fila.y + 1.15)


		var xf: Transform3D = Transform3D(b, pie + b * Vector3(FLAG_W * 0.5, 0.0, 0.0))
		mm.set_instance_transform(k, xf)
		_flag_xy.append(Vector2(FLAG_W * esc_x, FLAG_H * esc_y))
		if not cola.is_empty():
			var sj: Dictionary = _en_la_cola(cola, x, fila_i, length)
			sj.merge({"mm": mm, "k": k, "xf": xf})
			sujetas.append(sj)
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _flag_make_shader()
	mat.set_shader_parameter("cloth", _flag_texture())




	mat.set_shader_parameter("ancho", FLAG_W)
	if puestas == 0:
		return









	mm.visible_instance_count = puestas
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = mat
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	mmi.extra_cull_margin = 1.0
	root.add_child(mmi)
	_flag_mats.append(mat)
	_sueltos.append_array(sujetas)
	_tifo_wind_refresh()









const CARD_REL: int = 65
const CARD_FORM: int = 3
const CARD_MAX: int = 3




const CARD_W: float = 1.0
const CARD_H: float = 0.72




const CARD_UP: float = 1.1
const CARD_FWD: float = 1.25















const CARD_ESC_MIN: float = 0.88
const CARD_ESC_MAX: float = 1.45




var _card_texs: Array[ImageTexture] = []




var _card_n: int = 0





var _card_pos: Array[Vector3] = []



var _card_xy: Array[Vector2] = []



func card_positions() -> Array[Vector3]:
	return _card_pos



func cards_hung() -> int:
	return _card_n



func drapes_hung() -> Vector2i:
	return Vector2i(_drape_n, _drape_n_muro)



func drape_sizes() -> Array[Vector2]:
	return _drape_muro_xy



func drape_wall_heights() -> Array[float]:
	return _drape_muro_y



func drape_wall_positions() -> Array[Vector3]:
	return _drape_muro_pos



func drape_stand_sizes() -> Array[Vector2]:
	return _drape_alto_xy



func flag_sizes() -> Array[Vector2]:
	return _flag_xy



func card_sizes() -> Array[Vector2]:
	return _card_xy


























static func cards_wanted(rel: int, form: int) -> int:
	if rel < CARD_REL and form < CARD_FORM:
		return 0
	var n: int = 1 + int(clampf(float(rel - CARD_REL) / 12.0, 0.0, 1.0))
	if form >= CARD_FORM:
		n += 1
	return mini(n, CARD_MAX)


func _build_front_cards(root: Node3D, length: float, works: bool) -> void:
	if div >= 3 or not is_your_ground() or length < 20.0 or _att < 0.3:
		return
	if _away_whole_stand(root.position):
		return
	var n: int = cards_wanted(Career.rel_eff("aficion"), Career.form)
	if n <= 0:
		return
	var texs: Array[ImageTexture] = _card_textures()
	if texs.is_empty():
		return
	var sections: int = maxi(int(round(length / 13.0)), 1)
	var first_away: int = _away_first_section(root.position, sections)
	var usable: float = length * float(mini(first_away, sections)) / float(sections)
	if usable < 8.0:
		return
	var fila0: Vector2 = _fan_row_at(0)
	for i in n:




		var h: float = fmod(absf(root.position.x + root.position.z) * 0.3313
			+ float(i) * 0.618, 1.0)
		var tramo: float = usable / float(n)
		var x: float = - length * 0.5 + tramo *(float(i) + 0.18 + h * 0.64)
		if _en_obra(works, x):
			continue




		var g: float = fmod(absf(root.position.x - root.position.z) * 0.2748
			+ float(i) * 0.382, 1.0)
		var esc: float = lerpf(CARD_ESC_MIN, CARD_ESC_MAX, g)
		var quad: QuadMesh = QuadMesh.new()
		quad.size = Vector2(CARD_W, CARD_H)
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = quad
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_texture = texs[posmod(int(h * 10.0) + i, texs.size())]



		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		mi.material_override = mat
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



		var roll: float = deg_to_rad(lerpf(-9.0, 9.0, h))
		var yaw: float = deg_to_rad(lerpf(-14.0, 14.0, fmod(h * 3.7, 1.0)))
		mi.transform = Transform3D(Basis.from_euler(Vector3(0.0, yaw, roll)),
			Vector3(x, fila0.x + CARD_UP, fila0.y + CARD_FWD))
		root.add_child(mi)

		if root.has_meta("cola_grada"):
			var sj: Dictionary = _en_la_cola(root.get_meta("cola_grada"), x, 0, length)
			sj["nodo"] = mi
			_sueltos.append(sj)
		_card_n += 1
		_card_pos.append(mi.global_position)
		_card_xy.append(Vector2(CARD_W * esc, CARD_H * esc))









func _card_textures() -> Array[ImageTexture]:
	if not _card_texs.is_empty():
		return _card_texs
	var parts: PackedStringArray = Career.player_name.strip_edges().split(" ", false)
	var surname: String =(parts[parts.size() - 1] if parts.size() > 0
		else Career.player_name).to_upper()
	surname = PixelText.normalize(surname).substr(0, 10)
	var dorsal: int = Career.club_number(GameState.player_team_id)
	var out: Array[ImageTexture] = []
	_card_pair(Career.player_name,
		Career.club_number(GameState.player_team_id), out)












	var idolo: Dictionary = Career.fan_idol()
	if not idolo.is_empty():
		_card_pair(String(idolo.get("name", "")), int(idolo.get("number", 0)), out)
	_card_texs = out
	return _card_texs





func _card_pair(nombre: String, dorsal: int, out: Array[ImageTexture]) -> void:
	var parts: PackedStringArray = nombre.strip_edges().split(" ", false)
	var surname: String =(parts[parts.size() - 1] if parts.size() > 0
		else nombre).to_upper()
	surname = PixelText.normalize(surname).substr(0, 10)
	if not surname.strip_edges().is_empty():
		out.append(_card_tex(surname, 3, out.size()))
	if dorsal > 0:


		out.append(_card_tex(str(dorsal), 7, out.size()))





const CARD_KRAFT: Color = Color("e8e0cc")




















const CARD_STYLES: Array[String] = ["kraft", "club", "franjas", "marco", "camiseta"]







func _card_club_color() -> Color:
	var kit_d: Dictionary = _host_kit_now()
	var uno: Color = kit_d.get("kit", Color("2b3340"))
	var dos: Color = kit_d.get("kit2", uno.darkened(0.45))
	var kraft_lum: float = CARD_KRAFT.get_luminance()
	if absf(uno.get_luminance() - kraft_lum) > 0.16:
		return uno
	if absf(dos.get_luminance() - kraft_lum) > 0.16:
		return dos
	return _ink_from_kit(uno)





func _card_ink_on(fondo: Color) -> Color:
	return Color("f4eddc") if fondo.get_luminance() < 0.52 else Color("14120f")















func _card_kit_image(w: int, h: int, px: int) -> Image:
	var team: Dictionary = _tifo_team()
	var pat: String = String(team.get("pattern", ""))



	if pat.is_empty() or pat == "plain":
		pat = TIFO_FALLBACK[posmod(hash(_pitch_seed_club())>>5,
			TIFO_FALLBACK.size())]
	var pat_w: int = Teams.local_pat_w(team) if not team.is_empty() else 3
	var cols: int = maxi(w / px, 1)
	var rows: int = maxi(h / px, 1)
	var grid: Dictionary = {"cols": cols, "rows": rows, "compo": "pleno",
		"aspect": float(cols) / float(maxi(rows, 1))}
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	for cy in rows:
		for cx in cols:
			var c: Color = _tifo_pattern_color(pat, cx, cy, pat_w, grid)
			for y in range(cy * px, mini((cy + 1) * px, h)):
				for x in range(cx * px, mini((cx + 1) * px, w)):
					img.set_pixel(x, y, Color(c.r, c.g, c.b, 1.0))
	return img



func _card_tex(texto: String, px: int, idx: int) -> ImageTexture:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("carton|" + texto)
	var estilo: String = CARD_STYLES[posmod(hash(_pitch_seed_club()) + idx,
		CARD_STYLES.size())]
	var club: Color = _card_club_color()
	var tw: int = PixelText.text_width(texto, px)
	var th: int = PixelText.GLYPH_H * px



	var pad_x: int = px * 2




	var franjeado: bool = estilo == "franjas" or estilo == "camiseta"
	var pad_y: int = px * 4 if franjeado else px * 2
	var w: int = tw + pad_x * 2
	var h: int = th + pad_y * 2









	var min_w: int = int(round(float(h) * CARD_W / CARD_H))
	if w < min_w:
		pad_x +=(min_w - w) / 2
		w = tw + pad_x * 2
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	var base: Color = club if estilo == "club" else CARD_KRAFT
	img.fill(base)
	var ink: Color = _card_ink_on(base)
	if estilo == "kraft" or estilo == "marco":


		ink = _ink_from_kit(_host_kit_now().get("kit", Color("2b3340")))
	if franjeado:



		var y0: int = pad_y - px
		var y1: int = pad_y + th + px



		var kit_img: Image = _card_kit_image(w, h, px) \
				if estilo == "camiseta" else null
		for y in h:
			if y >= y0 and y < y1:
				continue
			for x in w:
				img.set_pixel(x, y, club)
	elif estilo == "marco":


		for y in h:
			for x in w:
				if x < px or y < px or x >= w - px or y >= h - px:
					img.set_pixel(x, y, club)




	var canto: Color = base if estilo == "kraft" else club
	var borde: Color = canto.darkened(0.18)
	for x in w:
		img.set_pixel(x, 0, borde)
		img.set_pixel(x, h - 1, borde)
	for y in h:
		img.set_pixel(0, y, borde)
		img.set_pixel(w - 1, y, borde)


	var ex: int = 0 if rng.randi() % 2 == 0 else w - 1
	var ey: int = 0 if rng.randi() % 2 == 0 else h - 1
	for k in rng.randi_range(2, 4):
		for j in range(0, k + 1):
			img.set_pixel(clampi(ex +(k - j) *(1 if ex == 0 else -1), 0, w - 1),
				clampi(ey + j *(1 if ey == 0 else -1), 0, h - 1),
				Color(0, 0, 0, 0))
	PixelText.draw_text(img,(w - tw) / 2,(h - th) / 2, texto, ink, px)
	return ImageTexture.create_from_image(img)






func _flag_texture() -> ImageTexture:
	var grid: Dictionary = {"cols": 9, "rows": 6, "compo": "pleno", "aspect": 1.0}
	var team: Dictionary = _tifo_team()
	var pat: String = String(team.get("pattern", ""))
	if pat.is_empty() or pat == "plain":
		pat = TIFO_FALLBACK[posmod(hash(_pitch_seed_club())>>5,
			TIFO_FALLBACK.size())]
	var pat_w: int = Teams.local_pat_w(team) if not team.is_empty() else 3
	var img: Image = Image.create(9, 6, false, Image.FORMAT_RGBA8)




	var flag: Image = _flag_of(team)
	for y in 6:
		for x in 9:
			var c: Color
			if flag != null:
				c = _flag_pick(flag,(float(maxi(x, 1)) - 1.0 + 0.5) / 8.0,
					(float(y) + 0.5) / 6.0)
			else:
				c = _tifo_pattern_color(pat, x, y, pat_w, grid)
			img.set_pixel(x, y, Color(c.r, c.g, c.b, 1.0))


	for y in 6:
		img.set_pixel(0, y, Color(0.16, 0.14, 0.12))
	return ImageTexture.create_from_image(img)





func _flag_make_shader() -> Shader:
	if _flag_shader != null:
		return _flag_shader
	_flag_shader = Shader.new()
	_flag_shader.code = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled;\nuniform sampler2D cloth : source_color, filter_nearest;\nuniform float amp = 0.0;\nuniform float speed = 1.0;\nuniform float sweep = 0.0;   // radianes de vaivén DEL BRAZO (0 = nadie la mueve)\nuniform float ancho = 1.05;  // el largo de la tela, para saber dónde cae el asta\nuniform float occ_alpha = 1.0;\n// `INSTANCE_CUSTOM` sólo existe en el vértice (en el fragmento Godot ni lo conoce y\n// el shader no compila), así que el pliegue se calcula ARRIBA y baja por aquí.\nvarying float v_pliegue;\n\nvoid vertex() {\n\t// x = fase · y = ritmo propio · z = amplitud propia (ver _build_front_flags).\n\t// El RITMO es lo que hace que no se lean como una sola animación repetida.\n\tfloat fase = INSTANCE_CUSTOM.x * 6.2831;\n\tfloat mia = amp * INSTANCE_CUSTOM.z;\n\tfloat vuelo = UV.x;   // 0 en el asta, 1 en el canto libre\n\tfloat t = TIME * speed * INSTANCE_CUSTOM.y + fase;\n\tfloat w = sin(vuelo * 6.5 - t * 6.0) + sin(vuelo * 3.0 - t * 3.7) * 0.5;\n\tvec3 p = VERTEX;\n\t// 1) LA TELA. El pliegue que recorre el trapo del asta al vuelo.\n\tp.z += w * mia * vuelo * vuelo;\n\tp.y += sin(t * 2.1) * mia * vuelo * 0.35;\n\t// 2) EL BRAZO. Esto es lo que dice que hay ALGUIEN ahí: la bandera entera gira\n\t// sobre su asta —el puño que la sujeta—, no sólo se le arruga la tela. Sin este\n\t// paso el trapo se lee como una toalla tendida al viento; con él, como una\n\t// persona ondeándola. El vaivén va en dos ejes a distinta frecuencia (el brazo\n\t// sube y baja y de paso la gira) porque un vaivén de un solo eje es un\n\t// metrónomo.\n\tvec3 puno = vec3(-ancho * 0.5, 0.0, 0.0);\n\tp -= puno;\n\tfloat a = sin(t * 1.55) * sweep;                  // el brazo, arriba y abajo\n\tfloat b = sin(t * 1.05 + 1.7) * sweep * 0.75;     // y girándola sobre el puño\n\tp = vec3(p.x * cos(a) - p.y * sin(a), p.x * sin(a) + p.y * cos(a), p.z);\n\tp = vec3(p.x * cos(b) + p.z * sin(b), p.y, -p.x * sin(b) + p.z * cos(b));\n\tVERTEX = p + puno;\n\tv_pliegue = w;\n}\n\nvoid fragment() {\n\tvec4 c = texture(cloth, UV);\n\t// Sombra del pliegue, la misma idea que en el tifo pero más marcada: a este\n\t// tamaño la silueta apenas se mueve y lo que cuenta el restallido es la luz.\n\tALBEDO = c.rgb * (1.0 + v_pliegue * 0.16 * step(0.001, amp));\n\tALPHA = c.a * occ_alpha;\n}\n"
















































	return _flag_shader












const GIANT_W: float = 5.2
const GIANT_H: float = 3.4
const GIANT_POLE: float = 5.0
const GIANT_OFF: float = 0.33










const GIANT_OFF_MIN: float = 0.27
const GIANT_OFF_MAX: float = 0.38
const GIANT_POLE_MIN: float = 0.84
const GIANT_POLE_MAX: float = 1.16
const GIANT_ESC_MIN: float = 0.78
const GIANT_ESC_MAX: float = 1.22





func _measure_roofs(stands: Array) -> void:
	_roof_boxes.clear()
	_roof_low_y = INF
	for st in stands:
		var prom: String = String(st["prom"])
		if prom == "absent":
			continue









		if not _lleva_techo(int(st.get("roof", -1))):
			continue
		var scale: float = _prom_scale(prom)
		var losa: Dictionary = _roof_slab_of(float(st["len"]), _slope_top(scale))


		var xf: Transform3D = Transform3D(
			Basis.from_euler(Vector3(0.0, deg_to_rad(float(st["face"])), 0.0)),
			st["pos"]) * Transform3D(
				Basis.from_euler(Vector3(float(losa["pitch"]), 0.0, 0.0)),
				losa["pos"])
		_roof_boxes.append({"inv": xf.affine_inverse(),
			"half":(losa["size"] as Vector3) * 0.5})
		_roof_low_y = minf(_roof_low_y, float(st["pos"].y) + float(losa["low"]))





func _lleva_cinta(prom: String, length: float, pos: Vector3) -> bool:
	if prom == "full" and length >= 90.0:
		return true
	return _box_main_pos != Vector3.INF and pos.is_equal_approx(_box_main_pos)





func _measure_boxes(stands: Array) -> void:
	_box_vols.clear()
	_box_low_y = INF
	_box_high_y = - INF
	_box_main_pos = Vector3.INF
	var style: String = _boxes_style()
	if style == "none":
		return


	var hay_plena: bool = false
	var principal: Dictionary = {}
	for st in stands:
		var pr: String = String(st["prom"])
		if pr == "full" and float(st["len"]) >= 90.0:
			hay_plena = true
		elif pr != "absent" and is_equal_approx(float(st["face"]), 90.0) \
				and float(st["len"]) >= BOX_MAIN_MIN_LEN \
				and float(st["len"]) > float(principal.get("len", 0.0)):
			principal = st
	if not hay_plena and not principal.is_empty():
		_box_main_pos = principal["pos"]
	for st in stands:
		var prom: String = String(st["prom"])
		var length: float = float(st["len"])
		if not _lleva_cinta(prom, length, st["pos"]):
			continue
		var b: Dictionary = _box_band_of(length, _prom_scale(prom))
		var alto: float = float(b["band_h"]) + 0.73
		var fondo: float = float(b["eave"]) + 0.03
		var centro: Vector3 = Vector3(0.0, float(b["yb"]) - 0.45 + alto * 0.5,
			float(b["zf"]) + 0.03 - fondo * 0.5)
		var half: Vector3 = Vector3(float(b["span"]) * 0.5, alto * 0.5, fondo * 0.5)
		var xf: Transform3D = Transform3D(
			Basis.from_euler(Vector3(0.0, deg_to_rad(float(st["face"])), 0.0)),
			st["pos"]).translated_local(centro)
		_box_vols.append({"inv": xf.affine_inverse(), "half": half, "pos": st["pos"]})
		_box_low_y = minf(_box_low_y, float(st["pos"].y) + centro.y - half.y)
		_box_high_y = maxf(_box_high_y, float(st["pos"].y) + centro.y + half.y)








func _in_other_box(p: Vector3, radio: float, media: float, quien: Vector3) -> bool:
	if p.y + media < _box_low_y or p.y - media > _box_high_y:
		return false
	for v in _box_vols:
		if v["pos"] == quien:
			continue
		var h: Vector3 = v["half"]
		var q: Vector3 =(v["inv"] as Transform3D) * p
		if absf(q.x) <= h.x + radio and absf(q.z) <= h.z + radio \
				and q.y + media >= - h.y and q.y - media <= h.y:
			return true
	return false

















func _crosses_roof(base: Vector3, punta: Vector3, asomar: bool = false) -> bool:


	if punta.y < _roof_low_y:
		return false
	for caja in _roof_boxes:
		var h: Vector3 = caja["half"]
		var inv: Transform3D = caja["inv"]




		if (inv * base).y >= - h.y:
			continue
		var q: Vector3 = inv * punta
		if q.y >(h.y if asomar else - h.y) \
				and absf(q.x) <= h.x and absf(q.z) <= h.z:
			return true
	return false












func _giant_spec(pos: Vector3, s: float) -> Vector4:
	var base: String = "asta|%s|%d|%d|%d" % [_pitch_seed_club(),
		int(round(pos.x)), int(round(pos.z)), int(s)]
	var ho: float = float(posmod(hash(base + "o"), 977)) / 977.0
	var hp: float = float(posmod(hash(base + "p"), 971)) / 971.0
	var he: float = float(posmod(hash(base + "e"), 967)) / 967.0
	var esc: float = lerpf(GIANT_ESC_MIN, GIANT_ESC_MAX, he)
	return Vector4(lerpf(GIANT_OFF_MIN, GIANT_OFF_MAX, ho),
		GIANT_POLE * lerpf(GIANT_POLE_MIN, GIANT_POLE_MAX, hp),
		GIANT_W * esc, GIANT_H * esc)






const GIANT_TOP: float = GIANT_POLE * 0.72 + GIANT_H * 0.5




func _giant_fits(root: Node3D, length: float, fila: Vector2) -> bool:
	for s in [-1.0, 1.0]:
		var spec: Vector4 = _giant_spec(root.position, s)
		var base_x: float = s * length * spec.x
		var pies: Vector3 = root.transform * Vector3(base_x, fila.x, fila.y + 0.35)
		if _crosses_roof(pies, root.transform * Vector3(base_x, fila.x + spec.y,
				fila.y + 0.35)):
			return false



		var top: float = spec.y * 0.72 + spec.w * 0.5
		for k in 5:
			if _crosses_roof(pies, root.transform * Vector3(
					base_x + s * spec.z * float(k) * 0.25,
					fila.x + top, fila.y + 0.45)):
				return false
	return true


func _build_giant_flags(root: Node3D, length: float, scale: float,
		works: bool = false) -> void:
	if div >= 3 or length < 50.0:
		return
	var slope_h: float = _slope_h(scale)


	var row: int = maxi(int(float(_stands_cfg()["rows"]) * 0.45), 1)
	var fila: Vector2 = _fan_row_at(row)






	while row > 1 and not _giant_fits(root, length, fila):
		row -= 1
		fila = _fan_row_at(row)
	if not _giant_fits(root, length, fila):
		return
	for s in [-1.0, 1.0]:
		var spec: Vector4 = _giant_spec(root.position, s)
		var base: Vector3 = Vector3(s * length * spec.x, fila.x, fila.y)



		if _en_obra(works, base.x):
			continue


		var palo: MeshInstance3D = MeshInstance3D.new()
		var pm: BoxMesh = BoxMesh.new()
		pm.size = Vector3(0.1, spec.y, 0.1)
		palo.mesh = pm
		var pmat: StandardMaterial3D = StandardMaterial3D.new()
		pmat.albedo_color = Color(0.14, 0.13, 0.12)
		pmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		palo.material_override = pmat
		palo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		palo.position = base + Vector3(0.0, spec.y * 0.5, 0.35)
		root.add_child(palo)



		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.use_custom_data = true
		var mesh: QuadMesh = QuadMesh.new()
		mesh.size = Vector2(spec.z, spec.w)
		mesh.subdivide_width = 10
		mesh.subdivide_depth = 4
		mm.mesh = mesh
		mm.instance_count = 1




		var ht: float = float(posmod(hash("asta|t|%s|%d" % [
			_pitch_seed_club(), int(s * root.position.x)]), 953)) / 953.0
		var b: Basis = Basis.from_euler(Vector3(0.0, 0.0,
			deg_to_rad(- lerpf(2.0, 8.0, ht) * s)))
		if s < 0.0:
			b = b.scaled(Vector3(-1.0, 1.0, 1.0))
		mm.set_instance_transform(0, Transform3D(b, base
			+ Vector3(s * spec.z * 0.5, spec.y * 0.72, 0.45)))
		mm.set_instance_custom_data(0, Color(0.37 if s < 0.0 else 0.81, 1.0, 1.0, 0.0))
		var mat: ShaderMaterial = ShaderMaterial.new()
		mat.shader = _flag_make_shader()
		mat.set_shader_parameter("cloth", _flag_texture())
		mat.set_shader_parameter("ancho", spec.z)
		var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		mmi.multimesh = mm
		mmi.material_override = mat
		mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		mmi.extra_cull_margin = 2.0
		root.add_child(mmi)
		_giant_mats.append(mat)
	_tifo_wind_refresh()
















const DRAPE_STEP: float = 3.8
const DRAPE_W: float = 1.35
const DRAPE_H: float = 0.6
const DRAPE_Y: float = 1.16





const DRAPE_DY: float = 0.42





const DRAPE_WALL_TOP: float = 2.2
const DRAPE_WALL_FLOOR: float = 0.1
const DRAPE_KINDS: int = 3


















const DRAPE_SIZE: Array[Vector4] = [
	Vector4(1.0, 1.55, 0.62, 0.88),
	Vector4(0.62, 0.98, 0.95, 1.3),
	Vector4(1.15, 1.75, 1.0, 1.38),
]





const DRAPE_Z_STEP: float = 0.002





const DRAPE_ROWS_UP: int = 4



const DRAPE_ROW_BIAS: float = 2.1











const DRAPE_ROW_BIAS_KIND: Array[float] = [0.0, 1.4, -0.5]






const DRAPE_UP: float = 1.2


const WALL_BANNER_W: float = 6.0
const WALL_BANNER_H: float = 1.2










const WALL_BANNER_MIN: float = 0.19
const WALL_BANNER_MAX: float = 0.31



const WALL_BANNER_Y: float = 1.15
const WALL_BANNER_DY: float = 0.09













const WALL_BANNER_MIN_ESC: float = 0.7
const WALL_BANNER_MAX_ESC: float = 1.25
















func _wall_banner_spots(pos: Vector3, length: float) -> Array[Vector4]:
	var base: String = "%s|%d|%d" % [_pitch_seed_club(),
		int(round(pos.x)), int(round(pos.z))]
	var out: Array[Vector4] = []
	for lado in [-1.0, 1.0]:
		var h: float = float(posmod(hash(base + str(lado)), 997)) / 997.0
		var g: float = float(posmod(hash(base + "y" + str(lado)), 991)) / 991.0
		var e: float = float(posmod(hash(base + "e" + str(lado)), 983)) / 983.0
		var esc: float = lerpf(WALL_BANNER_MIN_ESC, WALL_BANNER_MAX_ESC, e)
		var ancho: float = WALL_BANNER_W * esc
		var alto: float = WALL_BANNER_H * esc



		var minimo: float = PITCH_BOX_SPAN * 0.5 + ancho * 0.5 + 0.6
		var d: float = maxf(length * lerpf(WALL_BANNER_MIN, WALL_BANNER_MAX, h),
			minimo)



		var y: float = clampf(
			WALL_BANNER_Y + lerpf(- WALL_BANNER_DY, WALL_BANNER_DY, g),
			DRAPE_WALL_FLOOR + alto * 0.5, DRAPE_WALL_TOP - alto * 0.5)
		out.append(Vector4(lado * d, y, ancho, alto))
	return out






var _drape_n: int = 0
var _drape_n_muro: int = 0




var _drape_muro_xy: Array[Vector2] = []



var _drape_muro_y: Array[float] = []




var _drape_muro_pos: Array[Vector3] = []



var _drape_alto_xy: Array[Vector2] = []
var _drape_mats: Array[ShaderMaterial] = []
var _drape_shader: Shader = null


func _build_wall_drapes(root: Node3D, length: float, scale: float = 1.0,
		works: bool = false) -> void:


	if div >= 3:
		return
	if _att < 0.3 or length < 20.0:
		return

	if _away_whole_stand(root.position):
		return
	var sections: int = maxi(int(round(length / 13.0)), 1)
	var first_away: int = _away_first_section(root.position, sections)
	var usable: float = length * float(mini(first_away, sections)) / float(sections)
	var n: int = int(usable / DRAPE_STEP)
	if n < 2:
		return
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = Vector2(DRAPE_W, DRAPE_H)


	mesh.subdivide_depth = 3
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.use_custom_data = true
	mm.mesh = mesh
	mm.instance_count = n
	var x0: float = - length * 0.5 + DRAPE_STEP * 0.5


	var filas_up: int = clampi(_fan_rows(scale) - 1, 0, DRAPE_ROWS_UP)
	var puestas: int = 0
	for i in n:
		var h1: float = fmod(absf(x0 + float(i) * DRAPE_STEP) * 0.531
			+ float(i) * 0.279, 1.0)
		var h2: float = fmod(float(i) * 0.7913 + 0.37, 1.0)
		var x: float = x0 + float(i) * DRAPE_STEP + lerpf(-1.1, 1.1, h2)









		var kind: int = posmod(i * 7 + int(h1 * 5.0), DRAPE_KINDS)



		var h4: float = fmod(absf(x) * 0.618 + float(i) * 0.4142, 1.0)
		var rango: Vector4 = DRAPE_SIZE[kind]
		var esc: float = lerpf(rango.x, rango.y, h1)
		var esc_y: float = lerpf(rango.z, rango.w, h4)





		var h5: float = fmod(absf(x) * 0.809 + float(i) * 0.7071, 1.0)
		var media_h: float = DRAPE_H * esc_y * 0.5
		var y_muro: float = clampf(DRAPE_Y + lerpf(- DRAPE_DY, DRAPE_DY, h5),
			DRAPE_WALL_FLOOR + media_h, DRAPE_WALL_TOP - media_h)





		var h3: float = fmod(absf(x) * 0.3299 + float(i) * 0.541, 1.0)
		var fila_n: int = int(floor(
			pow(h3, maxf(DRAPE_ROW_BIAS + DRAPE_ROW_BIAS_KIND[kind], 1.0))
			* float(filas_up + 1)))



		if fila_n == 0:






			var tapa: bool = false
			for bp in _wall_banner_spots(root.position, length):
				if absf(x - bp.x) < bp.z * 0.5 + DRAPE_W * esc * 0.5:
					tapa = true
					break
			if tapa:
				continue


			if _wall_trophy_half > 0.0 and absf(x) < _wall_trophy_half:
				continue


		if _en_obra(works, x):
			continue
		var k: int = puestas
		puestas += 1
		_drape_n += 1
		if fila_n == 0:
			_drape_n_muro += 1
			_drape_muro_xy.append(Vector2(DRAPE_W * esc, DRAPE_H * esc_y))
			_drape_muro_y.append(y_muro)
		else:
			_drape_alto_xy.append(Vector2(DRAPE_W * esc, DRAPE_H * esc_y))
			_drape_muro_pos.append(root.to_global(
				Vector3(x, y_muro, 1.03 + float(k) * DRAPE_Z_STEP)))
		var tilt: float = deg_to_rad(lerpf(-7.0, 7.0, h2))
		var b: Basis = Basis.from_euler(Vector3(0.0, 0.0, tilt)).scaled(
			Vector3(esc, esc_y, 1.0))





		var pos: Vector3 = Vector3(x, y_muro, 1.03 + float(k) * DRAPE_Z_STEP)
		if fila_n > 0:
			var fila: Vector2 = _fan_row_at(fila_n)






			pos = Vector3(x, fila.x + DRAPE_UP + lerpf(-0.08, 0.08, h5),
				fila.y + 1.2 + float(k) * DRAPE_Z_STEP)
		mm.set_instance_transform(k, Transform3D(b, pos))


		mm.set_instance_custom_data(k, Color(h1, 0.8 + h2 * 0.5, 1.0,
			float(posmod(i * 7 + int(h1 * 5.0), DRAPE_KINDS))))
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _drape_make_shader()
	mat.set_shader_parameter("cloth", _drape_atlas())
	if puestas == 0:
		return
	mm.visible_instance_count = puestas
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = mat
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mmi.extra_cull_margin = 0.6
	root.add_child(mmi)
	_drape_mats.append(mat)
	_tifo_wind_refresh()

































const SERP_PAISES: Array[String] = ["Argentina", "Brasil", "Chile", "Uruguay",
	"Perú", "Colombia", "México", "Paraguay", "Bolivia", "Ecuador",
	"Venezuela"]



const SERP_PANEL_M: float = 9.0









const SERP_H: float = 15.0

const SERP_TIRAS: int = 26





const SERP_HUECO: float = 0.34




const SERP_LARGO_MIN: float = 0.2
const SERP_LARGO_MAX: float = 1.0













const SERP_OUT: float = 1.1









const SERP_AMP_CALM: float = 0.3
const SERP_AMP_GALE: float = 0.95


const SERP_ATT_MIN: float = 0.55
var _serp_mats: Array[ShaderMaterial] = []
var _serp_shader: Shader = null




var _serp_n: int = 0



















const SERP_FALL: float = 2.0
const SERP_HOLD: float = 26.0
const SERP_GONE: float = 5.0

var _serp_t: float = -1.0

var _serp_hold: bool = false


var _serp_nodes: Array[MeshInstance3D] = []


func _build_serpentinas(root: Node3D, length: float, scale: float,
		works: bool = false) -> void:
	if not SERP_PAISES.has(_country):
		return


	if _boxes_style() != "glass":
		return
	if _att < 0.0:
		_att = _attendance()
	if _att < SERP_ATT_MIN or length < 20.0:
		return


	if _away_whole_stand(root.position):
		return
	var band: Dictionary = _box_band_of(length, scale)
	var span: float = minf(float(band["span"]), length)
	var low: Vector3 = band["low"]


	var rad: float = deg_to_rad(STAND_SLOPE_DEG)
	var up: Vector3 = Vector3(0.0, cos(rad), - sin(rad))
	var nrm: Vector3 = Vector3(0.0, sin(rad), cos(rad))


	var sections: int = maxi(int(round(length / 13.0)), 1)
	var first_away: int = _away_first_section(root.position, sections)
	var usable: float = span * float(mini(first_away, sections)) / float(sections)
	if usable < SERP_PANEL_M:
		return
	var panels: int = maxi(int(round(usable / SERP_PANEL_M)), 1)
	var pw: float = usable / float(panels)
	var x0: float = - span * 0.5 + pw * 0.5






	var run: float = 0.635 * _slope_h(scale) - float(band["half"]) - 1.0
	var alto: float = clampf(SERP_H, 3.0, maxf(run, 3.0))
	if run < 3.0:
		return
	for p in panels:
		var x: float = x0 + float(p) * pw


		if _en_obra(works, x + pw * 0.5):
			continue
		var quad: QuadMesh = QuadMesh.new()
		quad.size = Vector2(pw, alto)


		quad.subdivide_depth = 7
		quad.subdivide_width = 6
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = quad
		var mat: ShaderMaterial = ShaderMaterial.new()
		mat.shader = _serp_make_shader()



		mat.set_shader_parameter("cortina", _serp_atlas(p))


		mat.set_shader_parameter("caida", 0.0)
		mi.material_override = mat
		mi.visible = false



		var b: Basis = Basis(Vector3.RIGHT, up, nrm)
		mi.transform = Transform3D(b, Vector3(x, low.y, low.z)
			- up *(alto * 0.5) + nrm *(SERP_OUT + float(p) * 0.002))
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


		mi.extra_cull_margin = 1.4
		root.add_child(mi)
		_serp_mats.append(mat)
		_serp_nodes.append(mi)
		_serp_n += 1
	_tifo_wind_refresh()

















func serpentinas_throw(permanente: bool = false) -> void:
	if _serp_nodes.is_empty() or _serp_t >= 0.0 or _serp_hold:
		return
	_serp_hold = permanente
	_serp_t = SERP_FALL if Settings.reduce_motion else 0.0
	for mi in _serp_nodes:
		mi.visible = true
	_tick_serp(0.0)


func _tick_serp(delta: float) -> void:
	if _serp_t < 0.0 or _serp_nodes.is_empty():
		return
	_serp_t += delta
	var caida: float = clampf(_serp_t / SERP_FALL, 0.0, 1.0)
	var fade: float = 1.0 if _serp_hold else clampf(
		1.0 -(_serp_t - SERP_FALL - SERP_HOLD) / SERP_GONE, 0.0, 1.0)
	for mat in _serp_mats:
		mat.set_shader_parameter("caida", caida)
		mat.set_shader_parameter("fade", fade)



	if _serp_hold:
		if caida >= 1.0:
			_serp_t = -1.0
		return
	if fade > 0.0:
		return

	for mi in _serp_nodes:
		mi.queue_free()
	_serp_nodes.clear()
	_serp_mats.clear()
	_serp_t = -1.0


















func _serp_make_shader() -> Shader:
	if _serp_shader != null:
		return _serp_shader
	_serp_shader = Shader.new()
	_serp_shader.code = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled;\nuniform sampler2D cortina : source_color, filter_nearest;\nuniform float amp = 0.0;\nuniform float speed = 1.0;\nuniform float occ_alpha = 1.0;\n// LA TIRADA (ver `serpentinas_throw`): `caida` va de 0 (nadie ha tirado nada) a 1\n// (cortina entera colgando) y `fade` de 1 a 0 cuando el aire se las lleva.\nuniform float caida = 1.0;\nuniform float fade = 1.0;\nvarying float v_pliegue;\n\nvoid vertex() {\n\t// Desfase POR COLUMNA: cada tira de la textura lleva su propio reloj, y por eso la\n\t// cortina ondula en vez de batir entera.\n\tfloat fase = sin(UV.x * 37.0) * 3.1416;\n\tfloat t = TIME * speed + fase;\n\t// Atada ARRIBA: UV.y va de 0 arriba a 1 abajo, así que el bajo vuela y el canto\n\t// amarrado no se mueve.\n\tfloat faldon = UV.y * UV.y;\n\t// VUELA MÁS EN LOS DOS EXTREMOS de su vida y se calma en medio, que es lo que hace\n\t// una tira de plástico de verdad: sale de la mano dando vueltas, se aquieta al\n\t// quedar colgada y vuelve a bailar cuando el aire la suelta. Sin esto la caída era\n\t// una persiana bajando y la despedida un desvanecido de fantasma.\n\tfloat vuelo = amp * (1.0 + (1.0 - caida) * 2.4 + (1.0 - fade) * 1.6);\n\tfloat w = sin(t * 2.1) + sin(t * 1.31 + 2.1) * 0.5;\n\t// Con TOPE HACIA DENTRO. El panel cuelga a `SERP_OUT` (1,10 m) del hormigón y la\n\t// amplitud de calma ya es 0,30: sin el tope, un golpe de viento mete el bajo de la\n\t// tira DENTRO de las filas de abajo y se ve gente atravesada por el plástico.\n\tVERTEX.z += max(w * vuelo * faldon, -0.55);\n\tVERTEX.x += sin(t * 1.6 + 0.6) * vuelo * faldon * 0.5;\n\tv_pliegue = w;\n}\n\nvoid fragment() {\n\tvec4 c = texture(cortina, UV);\n\t// EL FRENTE DE CAÍDA, COLUMNA A COLUMNA. `caida` recorta el panel por abajo, pero\n\t// cada tira llega a su sitio en un instante distinto (hasta un 55 % más tarde): sin\n\t// esa dispersión el borde inferior baja recto y se lee como una persiana, que es\n\t// justo el defecto que `SERP_LARGO_*` ya combate en la cortina quieta.\n\tfloat col = fract(sin(UV.x * 91.7) * 4371.0);\n\tfloat frente = caida * (1.0 + col * 0.55);\n\tALBEDO = c.rgb * (1.0 + v_pliegue * 0.10 * step(0.001, amp));\n\t// El alfa de la textura es lo que separa una tira de la siguiente: entre columnas\n\t// hay hueco, y por ahí se ve la grada. Sin esto sería un telón.\n\tALPHA = c.a * occ_alpha * fade * step(UV.y, frente);\n}\n"
















































	return _serp_shader





func serpentinas_n() -> int:
	return _serp_n




















func _serp_atlas(sem: int) -> ImageTexture:
	var w: int = 96


	var h: int = 160
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0.0, 0.0, 0.0, 0.0))
	var kit: Dictionary = _host_kit_now()
	var c1: Color = kit.get("kit", Color("2b3340"))
	var c2: Color = kit.get("kit2", c1.lightened(0.45))



	var tonos: Array[Color] = [c1, c2, c1.lightened(0.22), Color("e4e6ea")]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = int(absf(hash(_pitch_seed_club()))) + 7717 + sem * 131
	var paso: float = float(w) / float(SERP_TIRAS)
	for i in SERP_TIRAS:

		if rng.randf() < SERP_HUECO:
			continue
		var x0: int = int(round(float(i) * paso + rng.randf_range(-0.6, 0.6)))
		var ancho: int = 2 if rng.randf() < 0.72 else 3
		var largo: int = int(round(float(h)
			* rng.randf_range(SERP_LARGO_MIN, SERP_LARGO_MAX)))
		var col: Color = tonos[rng.randi() % tonos.size()]
		for y in largo:

			var t: float = float(y) / float(h - 1)
			var c: Color = col.lightened(t * 0.12)
			for dx in ancho:
				var x: int = x0 + dx
				if x < 0 or x >= w:
					continue


				img.set_pixel(x, y, c.darkened(0.14) if dx == ancho - 1 else c)
	return ImageTexture.create_from_image(img)





func _drape_atlas() -> ImageTexture:
	var w: int = 24
	var h: int = 10
	var img: Image = Image.create(w, h * DRAPE_KINDS, false, Image.FORMAT_RGBA8)
	var a: Color = _club_a
	var b: Color = _club_b





	var nat_flag: Image = _flag_of(_tifo_team())
	if nat_flag != null:
		var fc: Array[Color] = _flag_colors(nat_flag)
		a = fc[0]
		b = fc[1]


	var team: Dictionary = _tifo_team()
	var pat: String = String(team.get("pattern", ""))
	if pat.is_empty() or pat == "plain":
		pat = TIFO_FALLBACK[posmod(hash(_pitch_seed_club())>>5,
			TIFO_FALLBACK.size())]
	var pat_w: int = Teams.local_pat_w(team) if not team.is_empty() else 3
	var grid: Dictionary = {"cols": w, "rows": h, "compo": "pleno", "aspect": 1.0}











	var scarf_pat: bool = posmod(hash(_pitch_seed_club())>>3, 2) == 0
	for y in h:
		for x in w:
			var c: Color = a if (y / 2) % 2 == 0 else b
			if scarf_pat:
				c = _tifo_pattern_color(pat, x, y, pat_w, grid)
			if nat_flag != null:




				c = _flag_pick(nat_flag,(float(x) + 0.5) / float(w),
					(float(y) + 0.5) / float(h))
			if x < 2 or x >= w - 2:
				c = c.darkened(0.35)
			img.set_pixel(x, y, c)





	var drape_flag: Image = _flag_of(team)
	for y in h:
		for x in w:
			if drape_flag != null:
				img.set_pixel(x, h + y, _flag_pick(drape_flag,
					(float(x) + 0.5) / float(w),(float(y) + 0.5) / float(h)))
				continue
			img.set_pixel(x, h + y, _tifo_pattern_color(pat, x, y, pat_w, grid))

	var fondo: Color = a if a.get_luminance() < b.get_luminance() else b
	for y in h:
		for x in w:
			if nat_flag != null:
				img.set_pixel(x, h * 2 + y, _flag_pick(nat_flag,
					(float(x) + 0.5) / float(w),(float(y) + 0.5) / float(h)))
				continue
			img.set_pixel(x, h * 2 + y, fondo)
	if not _club_abbrev.is_empty():
		var px: int = 1 if PixelText.text_width(_club_abbrev, 1) > w - 4 else 2
		var tw: int = PixelText.text_width(_club_abbrev, px)


		if nat_flag != null:
			for dx in [-1, 1]:
				for dy in [-1, 1]:
					PixelText.draw_text(img,(w - tw) / 2 + dx,
						h * 2 +(h - PixelText.GLYPH_H * px) / 2 + dy,
						_club_abbrev, Color(0.95, 0.94, 0.9), px)
		PixelText.draw_text(img,(w - tw) / 2,
			h * 2 +(h - PixelText.GLYPH_H * px) / 2, _club_abbrev,
			Color(0.1, 0.1, 0.12) if nat_flag != null \
					else Color(0.93, 0.92, 0.88), px)
	return ImageTexture.create_from_image(img)





func _drape_make_shader() -> Shader:
	if _drape_shader != null:
		return _drape_shader
	_drape_shader = Shader.new()
	_drape_shader.code = "\nshader_type spatial;\nrender_mode unshaded, cull_disabled;\nuniform sampler2D cloth : source_color, filter_nearest;\nuniform float amp = 0.0;\nuniform float speed = 1.0;\nuniform float kinds = 3.0;\nuniform float occ_alpha = 1.0;\nvarying float v_fila;\nvarying float v_pliegue;\n\nvoid vertex() {\n\tfloat fase = INSTANCE_CUSTOM.x * 6.2831;\n\tfloat t = TIME * speed * INSTANCE_CUSTOM.y + fase;\n\t// Atado ARRIBA: la UV.y va de 0 arriba a 1 abajo, así que el faldón se mueve y\n\t// el canto amarrado no. Sin este reparto el trapo entero flota como si estuviera\n\t// clavado por el centro.\n\tfloat faldon = UV.y * UV.y;\n\tfloat w = sin(t * 2.3) + sin(t * 1.37 + 2.1) * 0.5;\n\tVERTEX.z += w * amp * faldon;\n\tVERTEX.x += sin(t * 1.7 + 0.6) * amp * faldon * 0.4;\n\tv_fila = INSTANCE_CUSTOM.a;\n\tv_pliegue = w;\n}\n\nvoid fragment() {\n\t// El atlas es una pila vertical: la variante de esta instancia es una franja.\n\tvec2 uv = vec2(UV.x, (UV.y + v_fila) / kinds);\n\tvec4 c = texture(cloth, uv);\n\tALBEDO = c.rgb * (1.0 + v_pliegue * 0.10 * step(0.001, amp));\n\tALPHA = c.a * occ_alpha;\n}\n"
































	return _drape_shader








func _tifo_down() -> void:
	if _tifo_nodes.is_empty() or _tifo_fade >= 0.0:
		return
	_tifo_fade = 0.0










const TIFO_FLARES: int = 4
const TIFO_FLARES_ADELANTE: float = 1.4
var _tifo_humo: Array = []
var _tifo_flares_done: bool = false


func _tifo_flares() -> void:
	if _tifo_flares_done or _tifo == null or _tifo_fade >= 0.0:
		return
	if not (_derby or _is_final or _big_night):
		return
	_tifo_flares_done = true


	var holder: Node3D = _tifo.get_parent() as Node3D
	var root: Node3D = holder.get_parent() as Node3D if holder != null else null
	if root == null:
		return
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	var fila: Vector2 = _fan_row_at(0)
	var ancho: float = _tifo_size.x * 0.42
	for k in TIFO_FLARES:

		var t: float =(float(k) + 0.5) / float(TIFO_FLARES) * 2.0 - 1.0
		var x: float = holder.position.x +(t + rng.randf_range(-0.15, 0.15)) * ancho
		var par: Array[GeometryInstance3D] = _flare_smoke(root,
			Vector3(x, fila.x, fila.y + TIFO_FLARES_ADELANTE), true, rng)






		var col: GeometryInstance3D = par[0]
		col.set("process_material", _tifo_flare_proc())
		col.set("draw_pass_1", _tifo_flare_mesh())
		col.set("amount", rng.randi_range(40, 56))
		col.set("visibility_aabb", AABB(Vector3(-3.0, 0.0, -1.5), Vector3(6.0, 16.0, 4.0)))
		_tifo_humo.append_array(par)


var _tifo_flare_pm: Resource = null
var _tifo_flare_q: QuadMesh = null




func _tifo_flare_proc() -> Resource:
	if _tifo_flare_pm != null:
		return _tifo_flare_pm
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.18
	pm.direction = Vector3(0.0, 1.0, 0.0)
	pm.spread = 18.0
	pm.gravity = Vector3(0.3, 1.9, 0.0)
	pm.initial_velocity_min = 0.6
	pm.initial_velocity_max = 1.4
	pm.scale_min = 0.6
	pm.scale_max = 1.0
	var sc: Curve = Curve.new()
	sc.add_point(Vector2(0.0, 0.45))
	sc.add_point(Vector2(1.0, 2.6))

	pm.scale_curve = Particulas.curva(sc)
	var grad: Gradient = Gradient.new()
	grad.set_color(0, Color(1.0, 0.16, 0.08, 1.0))
	grad.set_color(1, Color(0.62, 0.55, 0.56, 0.0))
	grad.add_point(0.12, Color(1.0, 0.3, 0.18, 0.95))
	grad.add_point(0.4, Color(0.88, 0.42, 0.4, 0.55))
	pm.color_ramp = Particulas.rampa(grad)
	_tifo_flare_pm = pm
	return pm


func _tifo_flare_mesh() -> QuadMesh:
	if _tifo_flare_q == null:
		_tifo_flare_q = QuadMesh.new()
		_tifo_flare_q.size = Vector2(1.5, 1.5)
	return _tifo_flare_q



func _tifo_flares_off() -> void:
	for n in _tifo_humo:
		if is_instance_valid(n) and "emitting" in n:
			n.set("emitting", false)
	var humo: Array = _tifo_humo.duplicate()
	_tifo_humo.clear()
	if humo.is_empty() or not is_inside_tree():
		return



	SceneFade.timer(7.0).timeout.connect(_tifo_humo_libera.bind(humo))



func _tifo_humo_libera(humo: Array) -> void:
	for n in humo:
		if is_instance_valid(n):
			n.queue_free()


func _tick_tifo(delta: float) -> void:

	_tick_despliegue(delta)
	if _desp_t < 0.0:
		_tick_volteo(delta)
	if _tifo_fade < 0.0:
		return
	_tifo_fade += delta
	var k: float = clampf(_tifo_fade / TIFO_FADE, 0.0, 1.0)








	for pano in _tifo_nodes:
		if is_instance_valid(pano) and pano.material_override is ShaderMaterial:
			(pano.material_override as ShaderMaterial).set_shader_parameter(
				"fade", 1.0 - k)
	if k >= 1.0:



		for pano in _tifo_nodes:
			if not is_instance_valid(pano):
				continue
			_tifo_mats.erase(pano.material_override as ShaderMaterial)
			pano.queue_free()
		_tifo_nodes.clear()
		_volteo_mats.clear()
		_volteo_t = -1.0
		_desp_mats.clear()
		_desp_t = -1.0
		_tifo_flares_off()
		_tifo = null
		_tifo_mat = null
		_tifo_fade = -1.0
		_tifo_crest_pend.clear()









func _stand_cordon(root: Node3D, length: float, scale: float) -> void:
	var sections: int = maxi(int(round(length / 13.0)), 1)
	var edge_sec: int = _cordon_section(root.position, sections)
	if edge_sec < 0:
		return
	var sec_w: float = length / float(sections)
	var slope_c: Vector2 = _slope_center(scale)
	var slope_h: float = _slope_h(scale)
	if _mesh_mat == null:
		_mesh_mat = StandardMaterial3D.new()
		_mesh_mat.albedo_texture = _cordon_texture()
		_mesh_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		_mesh_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
		_mesh_mat.alpha_scissor_threshold = 0.5
		_mesh_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		_mesh_mat.roughness = 1.0
	for edge in [edge_sec]:
		var ax: float = - length * 0.5 + sec_w * float(edge)




		var holder: Node3D = Node3D.new()
		holder.position = Vector3(ax, slope_c.x, slope_c.y)
		holder.rotation_degrees = Vector3(- STAND_SLOPE_DEG, 0.0, 0.0)
		root.add_child(holder)
		var net: MeshInstance3D = MeshInstance3D.new()
		var q: QuadMesh = QuadMesh.new()


		q.size = Vector2(CORDON_OUT, slope_h)
		net.mesh = q
		var inst: StandardMaterial3D = _mesh_mat.duplicate()
		inst.uv1_scale = Vector3(q.size.x / 1.2, q.size.y / 1.2, 1.0)
		net.material_override = inst
		net.rotation_degrees = Vector3(0.0, 90.0, 0.0)
		net.position = Vector3(0.0, 0.0, CORDON_OUT * 0.5)
		net.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		holder.add_child(net)




func _cordon_texture() -> ImageTexture:
	if _cordon_tex != null:
		return _cordon_tex
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var wire: Color = Color("9aa3ad")
	for i in 32:
		for k in [0, 8, 16, 24]:
			img.set_pixel(i, k, wire)
			img.set_pixel(k, i, wire)
	_cordon_tex = ImageTexture.create_from_image(img)
	return _cordon_tex

















































const GUARD_SHEET: String = "res://assets/sprites/anim/idle_north_"
const GUARD_H: float = 1.72



const GUARD_Z: float = 1.55



const GUARD_DETRAS: float = 0.6


const GUARD_MURO_AIRE: float = 0.25



const GUARD_GOAL_CLEAR: float = 15.0


const GUARD_CORNER_CLEAR: float = 4.0

const GUARD_TECNICA: float = 1.0

const GUARD_TRAMO_MIN: float = 4.0


const GUARD_JITTER: float = 0.35


const GUARD_STEP: Dictionary = {1: 14.0, 2: 22.0, 3: 34.0}


const GUARD_MIN_LEN: Dictionary = {1: 16.0, 2: 40.0, 3: 120.0}





const GUARD_VEST: Color = Color("e2e04b")
const GUARD_PANTS: Color = Color("23262d")



const GUARD_LOOKS: int = 2





func _guard_texture(i: int) -> Texture2D:
	while _guard_tex.size() <= i:
		_guard_tex.append(null)
	if _guard_tex[i] != null:
		return _guard_tex[i]
	var path: String = GUARD_SHEET + "00.png"
	if not ResourceLoader.exists(path):
		return null
	_guard_tex[i] = preload("res://features/stadium/staff_sprites.gd").textura("guard_sentado", 0, KitRecolor.appearance_for(
		"%s_seguridad%d" % [_pitch_seed_club(), i],
		{"kit": GUARD_VEST, "kit2": GUARD_PANTS}))
	return _guard_tex[i]




func _build_security(root: Node3D, length: float, prom: String,
		works: bool) -> void:



	if venue_empty:
		return
	var d: int = clampi(div, 1, 3)
	if length < float(GUARD_MIN_LEN[d]):
		return



	if d == 3 and prom != "full":
		return
	var tex: Texture2D = _guard_texture(_guard_n % GUARD_LOOKS)
	if tex == null:
		return
	var spots: Array[Vector3] = _guard_spots(root, length, works)
	if spots.is_empty():
		return
	_guard_n += 1
	for p in spots:
		var w: Vector3 = _guard_xf(root) * p
		_guard_sillas.append(Vector2(w.x, w.z))
	var ps: float = GUARD_H / PERSON_BODY_PX
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(tex.get_width(), tex.get_height()) * ps
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 1.0








	mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
	mat.billboard_keep_scale = true
	mat.vertex_color_use_as_albedo = true
	quad.material = mat
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = quad
	mm.use_colors = true
	mm.instance_count = spots.size()
	var tint: RandomNumberGenerator = RandomNumberGenerator.new()
	tint.seed = int(root.position.x * 53.0 + root.position.z * 11.0) + 977
	for i in spots.size():
		mm.set_instance_transform(i, Transform3D(Basis.IDENTITY, spots[i]))



		var v: float = tint.randf_range(0.86, 1.06)
		mm.set_instance_color(i, Color(v, v * tint.randf_range(0.98, 1.02), v))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm


	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



	mmi.set_meta("occ_gente", true)
	root.add_child(mmi)












func _guard_spots(root: Node3D, length: float, works: bool) -> Array[Vector3]:
	var d: int = clampi(div, 1, 3)
	if _att < 0.0:
		_att = _attendance()
	var step: float = float(GUARD_STEP[d])



	step /= clampf(_att, 0.45, 1.0)






	if _derby or _big_night or _comp in ["liguilla", "campeones", "supercopa"]:
		step *= 0.7




	var sections: int = maxi(int(round(length / 13.0)), 1)
	var sec_w: float = length / float(sections)
	var away_all: bool = _away_whole_stand(root.position)
	var away_from: int = _away_first_section(root.position, sections)
	var ps: float = GUARD_H / PERSON_BODY_PX
	var y: float = _person_feet(ps, GUARD_SHEET)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = int(root.position.x * 53.0 + root.position.z * 11.0)
	var xf: Transform3D = _guard_xf(root)
	var bz: Vector3 = Vector3(xf.basis.z.x, 0.0, xf.basis.z.z)
	var bz_len: float = bz.length()
	if bz_len < 0.001:
		return []
	var hacia: Vector3 = bz / bz_len
	var anillo: Rect2 = _guard_anillo()
	var banda: float = _guard_banda()

	var aparte: float = step * 0.5


	var palmos: Array[Vector3] = []
	var x: float = - length * 0.5
	while x <= length * 0.5:
		var z: float = NAN
		if not _en_obra(works, x):
			var t: float = _guard_valla(xf * Vector3(x, 0.0, GUARD_Z), hacia, anillo)
			if not is_nan(t):


				var valla: Vector3 = xf * Vector3(x, 0.0, GUARD_Z + t / bz_len)
				var lz: float = GUARD_Z +(t - GUARD_DETRAS) / bz_len
				var w: Vector3 = xf * Vector3(x, 0.0, lz)
				if lz >= 1.0 + GUARD_MURO_AIRE and _guard_libre(valla, banda) \
						and _guard_aparte(w, aparte):
					z = lz
		var sec: int = clampi(int((x + length * 0.5) / sec_w), 0, sections - 1)
		var away: bool = away_all or sec >= away_from
		palmos.append(Vector3(x, z, 0.5 /(step *(0.5 if away else 1.0))))
		x += 0.5


	var spots: Array[Vector3] = []
	var i: int = 0
	while i < palmos.size():
		if is_nan(palmos[i].y):
			i += 1
			continue
		var j: int = i
		var dens: float = 0.0
		while j < palmos.size() and not is_nan(palmos[j].y):
			dens += palmos[j].z
			j += 1




		var largo: float = palmos[j - 1].x - palmos[i].x
		var k: int = int(dens + 0.75) if largo >= GUARD_TRAMO_MIN else 0
		var acum: float = 0.0
		var sigue: int = 0
		for p in range(i, j):
			acum += palmos[p].z
			while sigue < k and acum >= dens *(float(sigue) + 0.5) / float(k):


				spots.append(Vector3(palmos[p].x + rng.randf_range(- GUARD_JITTER,
					GUARD_JITTER), y, palmos[p].y))
				sigue += 1
		i = j
	return spots





func _guard_xf(root: Node3D) -> Transform3D:
	var xf: Transform3D = root.transform
	var padre: Node = root.get_parent()
	while padre is Node3D and padre != self:
		xf =(padre as Node3D).transform * xf
		padre = padre.get_parent()
	return xf



func _guard_aparte(w: Vector3, r: float) -> bool:
	for s in _guard_sillas:
		if s.distance_squared_to(Vector2(w.x, w.z)) < r * r:
			return false
	return true




func _guard_anillo() -> Rect2:
	var rx: float = _ring_x()
	var pz: float = _ring_pad_z()
	return Rect2(- rx, -4.0 - pz, rx * 2.0, FIELD_DEPTH + 8.0 + pz * 2.0)





func _guard_banda() -> float:
	var seg: Vector2 = _dugout_ad_segments()[0]
	return HALF_LINE -(seg.x + seg.y * 0.5) + GUARD_TECNICA





func _guard_valla(o: Vector3, hacia: Vector3, anillo: Rect2) -> float:
	var t0: float = 0.0
	var t1: float = INF
	for k in 2:
		var p: float = o.x if k == 0 else o.z
		var v: float = hacia.x if k == 0 else hacia.z
		var a: float = anillo.position.x if k == 0 else anillo.position.y
		var b: float = anillo.end.x if k == 0 else anillo.end.y
		if absf(v) < 0.0001:
			if p < a or p > b:
				return NAN
			continue
		t0 = maxf(t0, minf((a - p) / v,(b - p) / v))
		t1 = minf(t1, maxf((a - p) / v,(b - p) / v))
	return t0 if t0 <= t1 else NAN






func _guard_libre(p: Vector3, banda: float) -> bool:
	var ax: float = absf(p.x)
	var fuera_z: bool = p.z < 0.0 or p.z > FIELD_DEPTH
	if ax <= FIELD_HALF_W + 1.0 and not fuera_z:
		return false

	if ax > FIELD_HALF_W and absf(p.z - HALF_LINE) < banda:
		return false

	if fuera_z and ax < GUARD_GOAL_CLEAR:
		return false


	if fuera_z and ax > FIELD_HALF_W:
		return false
	var cz: float = 0.0 if p.z < HALF_LINE else FIELD_DEPTH
	return Vector2(ax - FIELD_HALF_W, p.z - cz).length() >= GUARD_CORNER_CLEAR


func _build_fan_rows(root: Node3D, length: float, scale: float = 1.0,
		works: bool = false) -> void:
	if _fan_frames_home == null and _fan_frames_away == null:
		return



	var rows: int = _fan_rows(scale)
	var spacing: float = STAND_FAN_SPACING
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = int(root.position.x * 31.0 + root.position.z * 7.0)
	if _att < 0.0:
		_att = _attendance()

	var static_buckets: Dictionary = {}


	var sections: int = maxi(int(round(length / 13.0)), 1)
	var sec_w: float = length / float(sections)



	var away_corner: bool = _away_whole_stand(root.position)









	var is_end: bool = absf(root.position.x) < 20.0
	var stand_fill: float = 1.0
	if _att < 0.995:
		stand_fill = 0.72 if is_end else 1.08



	var blocks: bool = crowd_blocks or att_override >= 0.0
	if blocks:
		stand_fill = 1.0





	var fan_head: float = 1.1
	var fan_tex_any: SpriteFrames = _fan_frames_home if _fan_frames_home != null \
			else _fan_frames_away
	for fr in [_fan_frames_home, _fan_frames_away]:
		if fr == null:
			continue




		for i in (fr as SpriteFrames).get_frame_count("idle"):
			fan_head = maxf(fan_head, float((fr as SpriteFrames)
				.get_frame_texture("idle", i).get_height()) *(1.5 / 32.0) * 0.5)



	fan_head += CROWD_JUMP_H

	var fan_wide: float = 0.75
	if fan_tex_any != null and fan_tex_any.get_frame_count("idle") > 0:
		fan_wide = float(fan_tex_any.get_frame_texture("idle", 0).get_width()) \
				*(1.5 / 32.0) * 0.5
	var umbrellas: Array[Transform3D] = []



	var fiesta: float = _fiesta_factor()



	var host_is_yours: bool = _host_stand_is_yours()



	var box_r0: int = -1
	var box_r1: int = -2
	if _box_half_x > 0.0:
		box_r0 = int(floor(float(rows) * 0.55))
		box_r1 = int(ceil(float(rows) * 0.72)) - 1





	var plazas: Array[int] = []
	var mias: Array[int] = []
	var por_fila: Array[Array] = []
	for _s in sections:
		plazas.append(0)
		mias.append(0)
		por_fila.append([])
	var sueltos: Array[Dictionary] = []
	for row in rows:
		await _respira()
		for sc in sections:
			por_fila[sc].append(plazas[sc])
		var in_box_row: bool = row >= box_r0 and row <= box_r1
		var fila: Vector2 = _fan_row_at(row)
		var local_z: float = fila.y
		var local_y: float = fila.x

		var animated_p: float = 0.05 if row == 0 else (0.03 if row == 1 else 0.008)
		if crowd_all_nodes:
			animated_p = 1.0

		var x: float = - length * 0.5 + 1.2 +(spacing * 0.5 if row % 2 == 1 else 0.0)
		while x < length * 0.5 - 1.2:

			var into: float = x + length * 0.5
			var sec: int = clampi(int(into / sec_w), 0, sections - 1)
			var away_sec: bool = away_corner \
					or sec >= _away_first_section(root.position, sections)


			if _en_obra(works, x):
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue


			if in_box_row and absf(x) < _box_half_x:
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue
			var near_aisle: bool = false
			for s in range(1, sections):
				if absf(into - sec_w * float(s)) < 0.85:
					near_aisle = true
					break
			if near_aisle:
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue
			if _in_stand_access(root, Vector3(x, local_y + 0.7, local_z), 0.7):
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue



			var fill: float = _att if row < 8 else _att *(0.55 + 0.45 * _att)
			fill *= stand_fill
			if blocks:


				var bf: float = _block_fill(root.position, sec, sections)
				fill = bf *(0.94 if row < 8 else 0.78)





			if away_sec and not home_only:
				fill = _away_fill()
			if rng.randf() > fill:
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue




			var local_fan: bool =(rng.randf() > 0.06) != away_sec
			var frames: SpriteFrames = _fan_frames_home if local_fan else _fan_frames_away
			if frames == null:
				frames = _fan_frames_home if _fan_frames_home != null else _fan_frames_away
				local_fan = frames == _fan_frames_home




			var mine: bool = local_fan == host_is_yours
			var pos: Vector3 = Vector3(x + rng.randf_range(-0.18, 0.18), local_y + 0.7, local_z)


			if not RecintoSeams.contiene(root, pos, fan_wide + 0.12):
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue







			var asiento: Vector3 = root.transform * pos
			if _crosses_roof(asiento, asiento + Vector3(0.0, fan_head, 0.0), true):
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue



			if _in_other_box(asiento, fan_wide, fan_head, root.position):
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue







			_flash_seen += 1

			var fpos: Vector3 = pos + Vector3(0.0, 0.25, 0.0)
			if _flash_spots.size() < FLASH_SPOTS_MAX:
				_flash_spots.append(root.transform * fpos)
			elif rng.randi() % _flash_seen < FLASH_SPOTS_MAX:
				_flash_spots[rng.randi() % FLASH_SPOTS_MAX] = root.transform * fpos


			if mine:
				_panuelo_apunta(root.transform * fpos)









			var heat: float = _nat_heat()
			var cap_now: int = flare_cap if flare_cap > 0 \
					else (FLARE_MAX if _derby or heat >= 0.7 else FLARE_MAX_PLAIN)
			var flare_p: float =(FLARE_ODDS_DERBY if _derby \
					else FLARE_ODDS_PLAIN *(1.0 + heat)) \
					* _flare_zone(root.position) * fiesta * flare_odds
			if row == 0 and div <= 2 and flare_p > 0.0:
				if _flare_n < cap_now and rng.randf() < flare_p:



					sueltos.append({"humo": _flare_smoke(root, pos, local_fan, rng),
						"sec": sec, "antes": plazas[sec]})
					_flare_n += 1
					plazas[sec] += 1
					mias[sec] += int(mine)
					x += spacing + rng.randf_range(-0.12, 0.12)
					continue









				elif mine and _flare_spots.size() < FLARE_SPOTS_MAX \
						and rng.randf() < 0.35:
					_flare_spots.append({"root": root, "pos": pos,
						"local": local_fan})






			var flag_p: float = 0.2 if _derby else 0.11 *(1.0 + heat)
			if div == 3:
				flag_p += 0.1 if _derby else 0.06
			flag_p *= fiesta







			if row > 0:
				flag_p *= 0.42 /(1.0 + float(row) * 0.22)



			var trapo: AnimatedSprite3D = _porra_flag(root, pos, local_fan, rng) \
					if rng.randf() < flag_p else null
			if trapo != null:
				sueltos.append({"nodo": trapo, "sec": sec, "antes": plazas[sec]})
				plazas[sec] += 1
				mias[sec] += int(mine)
				x += spacing + rng.randf_range(-0.12, 0.12)
				continue


			var suelto: Dictionary = {}
			var lote: String = ""
			if rng.randf() < animated_p:
				var fan: AnimatedSprite3D = AnimatedSprite3D.new()


				fan.set_meta("occ_gente", true)
				fan.sprite_frames = frames
				fan.pixel_size = 1.5 / 32.0



				fan.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
				fan.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
				fan.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


				fan.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
				fan.position = pos



				fan.set_meta("stand_rank",
					clampf(_seat_score(root.position, sec, sections) * 0.85
						+ rng.randf_range(-0.07, 0.07), 0.0, 1.0))
				fan.set_meta("rest", "idle")
				root.add_child(fan)
				fan.play("idle")
				fan.speed_scale = rng.randf_range(0.7, 1.35)
				if fan.sprite_frames.get_frame_count("idle") > 1:
					fan.frame = rng.randi_range(0, fan.sprite_frames.get_frame_count("idle") - 1)


				if mine:
					_fans_home.append(fan)
				else:
					_fans_away.append(fan)


				suelto = {"nodo": fan, "sec": sec, "antes": plazas[sec], "anda": true,
					"pos0": pos}
				sueltos.append(suelto)
			else:


				var pose: int = rng.randi_range(0, mini(frames.get_frame_count("idle"), 2) - 1)




				var key: String = "%d_%d%d_%d" % [sec, int(local_fan), int(mine), pose]
				if not static_buckets.has(key):


					static_buckets[key] = {"local": local_fan, "mine": mine,
						"pose": pose, "sec": sec, "xf": [], "pj": [], "pi": []}
				lote = key
				static_buckets[key]["xf"].append(Transform3D(Basis(), pos))
			plazas[sec] += 1
			mias[sec] += int(mine)



			if _wet and rng.randf() < UMBRELLA_P:






				umbrellas.append(Transform3D(Basis(),
					pos + Vector3(0.0, 0.72, 0.06)))

				if not suelto.is_empty():
					suelto["paraguas_i"] = umbrellas.size() - 1
				else:
					static_buckets[lote]["pj"].append(static_buckets[lote]["xf"].size() - 1)
					static_buckets[lote]["pi"].append(umbrellas.size() - 1)
			x += spacing + rng.randf_range(-0.12, 0.12)
	_add_umbrellas(root, umbrellas)

	var paraguas_mm: MultiMesh = _umbrella_mms.back() if not umbrellas.is_empty() else null



	var mayoria: Array[bool] = []
	var secciones: Array[Dictionary] = []
	for sc in sections:
		var away_sc: bool = away_corner or sc >= _away_first_section(root.position, sections)
		var mio: bool =(not away_sc) == host_is_yours
		if mias[sc] * 2 != plazas[sc]:
			mio = mias[sc] * 2 > plazas[sc]
		mayoria.append(mio)
		var filas: Array = por_fila[sc].duplicate()
		filas.append(plazas[sc])
		secciones.append({"mio": mio, "total": plazas[sc], "filas": filas,
			"seat": _seat_score(root.position, sc, sections)})



	var escaleras: Array[float] = []
	for s in range(1, sections):
		var ax: float = - length * 0.5 + sec_w * float(s)
		if not _en_obra(works, ax):
			escaleras.append(ax)
	var grada: Dictionary = {
		"id": root.get_instance_id(), "length": length, "aisles": escaleras,
		"top_u": float(rows - 1) * STAND_FAN_ROW_DZ, "box": _box_u_range(rows),
		"accesos": _accesos_u(root),
	}


	root.set_meta("cola_grada", {"grada": grada, "secciones": secciones,
		"sec_w": sec_w})
	for s in sueltos:
		var info: Dictionary = secciones[int(s["sec"])]
		s["mio"] = info["mio"]
		s["seat"] = info["seat"]


		s["hueco"] =(float(s["antes"]) + 0.5) / float(maxi(int(info["total"]), 1))
		s["ve"] = true
		if bool(s.get("anda", false)):
			s["grada"] = grada
		if s.has("paraguas_i"):
			s["paraguas_mm"] = paraguas_mm
		_sueltos.append(s)
	for key in static_buckets:
		var b: Dictionary = static_buckets[key]
		var antes: int = _fan_buckets.size()
		_add_static_fans(root, b["xf"], bool(b["local"]), bool(b["mine"]),
			int(b["pose"]), int(b["sec"]), sec_w, length)
		if _fan_buckets.size() == antes:
			continue
		var fb: Dictionary = _fan_buckets.back()
		fb["sec"] = int(b["sec"])
		fb["mayoria"] = mayoria[int(b["sec"])]
		fb["grada"] = grada
		if paraguas_mm != null and not (b["pj"] as Array).is_empty():
			fb["paraguas_j"] = PackedInt32Array(b["pj"])
			fb["paraguas_i"] = PackedInt32Array(b["pi"])
			fb["paraguas_mm"] = paraguas_mm











const UMBRELLA_P: float = 0.34
const UMBRELLA_M: float = 0.62

var _umbrella_mesh: QuadMesh
var _umbrella_mat: StandardMaterial3D


func _add_umbrellas(root: Node3D, spots: Array[Transform3D]) -> void:
	if spots.is_empty():
		return
	if _umbrella_mesh == null:
		_umbrella_mesh = QuadMesh.new()
		_umbrella_mesh.size = Vector2(UMBRELLA_M, UMBRELLA_M * 0.72)
		_umbrella_mat = StandardMaterial3D.new()
		_umbrella_mat.albedo_texture = _umbrella_texture()
		_umbrella_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		_umbrella_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
		_umbrella_mat.alpha_scissor_threshold = 0.5





		_umbrella_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		_umbrella_mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
		_umbrella_mat.billboard_keep_scale = true
		_umbrella_mat.vertex_color_use_as_albedo = true
		_umbrella_mat.roughness = 1.0
		_umbrella_mesh.material = _umbrella_mat
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.use_colors = true
	mm.mesh = _umbrella_mesh
	mm.instance_count = spots.size()
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = int(absf(root.position.x) * 31.0 + absf(root.position.z) * 7.0) + 4409
	for i in spots.size():
		mm.set_instance_transform(i, spots[i])






		var c: Color = Color(0.42, 0.43, 0.47)
		var roll: float = rng.randf()
		if roll > 0.86:
			c = Color(0.86, 0.85, 0.82)
		elif roll > 0.68:
			c = _seat_tone(_club_a).lightened(0.35)
		elif roll > 0.52:
			c = Color(0.24, 0.25, 0.28)
		mm.set_instance_color(i, c.lightened(rng.randf_range(0.0, 0.1)))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



	mmi.set_meta("occ_gente", true)
	root.add_child(mmi)
	_umbrella_mms.append(mm)
	_umbrella_open(_umbrella_frac)
















const UMBRELLA_OPEN_UNTIL: int = 12
const UMBRELLA_OPEN_MIN: float = 0.45

var _umbrella_mms: Array[MultiMesh] = []
var _umbrella_frac: float = 1.0


func _umbrella_open(frac: float) -> void:
	_umbrella_frac = clampf(frac, 0.0, 1.0)
	for mm in _umbrella_mms:
		var n: int = int(round(float(mm.instance_count) * _umbrella_frac))
		if n != mm.visible_instance_count:
			mm.visible_instance_count = n





func _umbrella_texture() -> ImageTexture:
	var w: int = 24
	var h: int = 18
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var cx: float = float(w) * 0.5
	var rr: float = float(w) * 0.5 - 0.5
	for y in h:
		for x in w:
			var dx: float = float(x) + 0.5 - cx
			var dy: float = float(y) + 0.5

			var d: float =(dx * dx) /(rr * rr) +(dy * dy) /(rr * rr * 1.1)
			if dy <= rr * 1.05 and d <= 1.0:


				var rib: bool = int(absf(dx)) % 4 == 0
				img.set_pixel(x, y, Color(1, 1, 1, 1) if not rib
					else Color(0.72, 0.72, 0.75, 1.0))

	for y in range(int(rr * 0.95), h):
		img.set_pixel(int(cx), y, Color(0.35, 0.3, 0.28, 1.0))
	return ImageTexture.create_from_image(img)















const WALKERS_PER_AISLE_MAX: int = 2
const WALKER_HEIGHT: float = 1.5
const WALKER_SPEED_MIN: float = 0.8
const WALKER_SPEED_MAX: float = 1.4

var _walkers: Array[Dictionary] = []
























var _vendor_frames: SpriteFrames = null


func vendor_frames() -> SpriteFrames:
	if _vendor_frames != null:
		return _vendor_frames



	_vendor_frames = _build_fan_frames("vendor", {})
	if _vendor_frames == null:
		_vendor_frames = _fan_frames_home
	return _vendor_frames























const VENDOR_SCALE: float = 1.0










const VENDOR_TRAY_Y: float = 0.1 * VENDOR_SCALE




const VENDOR_CROSS_SPD: float = 1.1



func _spawn_walkers(root: Node3D, aisle_xs: Array[float], scale: float) -> void:


	if div > 2 or _fan_frames_home == null or aisle_xs.is_empty() or venue_empty:
		return
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = int(root.position.x * 17.0 + root.position.z * 5.0) + 991





	var rows: int = _fan_rows(scale)
	var top_u: float =(rows - 1) * STAND_FAN_ROW_DZ




	var box: Vector2 = _box_u_range(rows)





	var vend: AnimatedSprite3D = AnimatedSprite3D.new()
	vend.set_meta("occ_gente", true)



	var vframes: SpriteFrames = vendor_frames()
	vend.sprite_frames = vframes if vframes != null else _fan_frames_home
	vend.pixel_size = WALKER_HEIGHT * VENDOR_SCALE / 32.0
	vend.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	vend.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	vend.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	vend.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(vend)
	vend.play("idle")
	var tray: MeshInstance3D = MeshInstance3D.new()
	var tray_mesh: BoxMesh = BoxMesh.new()



	tray_mesh.size = Vector3(0.8, 0.1, 0.42)
	tray.mesh = tray_mesh
	var tray_mat: StandardMaterial3D = StandardMaterial3D.new()
	tray_mat.albedo_color = Color("c8322a")
	tray_mat.roughness = 0.8




	tray_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	tray.material_override = tray_mat
	tray.position = Vector3(0.0, VENDOR_TRAY_Y, 0.34 * VENDOR_SCALE)






	var sombrilla: Node3D = _make_parasol()
	vend.add_child(sombrilla)
	vend.set_meta("sombrilla", sombrilla)



	tray.scale = Vector3.ONE * VENDOR_SCALE
	tray.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	vend.add_child(tray)






	var carga: Node3D = _make_tray_food()
	tray.add_child(carga)



	vend.set_meta("tray", tray)
	vend.set_meta("carga", carga)
	var vtop: float = minf(box.x, top_u)
	var vd: Dictionary = {


		"node": vend, "x": aisle_xs[0], "u": rng.randf_range(0.0, vtop),
		"floor": 0.0, "top": vtop, "dir": 1.0,










		"speed": WALKER_SPEED_MIN * 0.8, "wait": rng.randf_range(0.0, 2.0),
		"vendor": true,


		"aisles": aisle_xs,






		"ring_lo": Vector2(0.0, vtop),
		"ring_hi": Vector2(box.y, top_u) if box.y < top_u - 1.0 else Vector2(0.0, vtop),


		"down": false,
	}
	_place_walker(vd)
	_walkers.append(vd)

	for _k in rng.randi_range(1, 2):
		_spawn_kid_on_shoulders(root, aisle_xs[rng.randi() % aisle_xs.size()],
			rng.randf_range(0.3, minf(3.0, vtop)), rng)

	if div != 1:
		return
	for ax in aisle_xs:
		for i in rng.randi_range(0, WALKERS_PER_AISLE_MAX):
			var w: AnimatedSprite3D = AnimatedSprite3D.new()
			w.set_meta("occ_gente", true)

			var away: bool = _fan_frames_away != null and rng.randf() < 0.25
			w.sprite_frames = _fan_frames_away if away else _fan_frames_home
			w.pixel_size = WALKER_HEIGHT / 32.0
			w.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			w.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			w.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			w.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			root.add_child(w)
			w.play("idle")
			w.speed_scale = rng.randf_range(1.2, 1.8)


			var arriba: bool = box.y < top_u and rng.randf() < 0.45
			var u0: float =(box.y if arriba else 0.0)
			var u1: float =(top_u if arriba else minf(box.x, top_u))
			var d: Dictionary = {
				"node": w,


				"x": ax + rng.randf_range(- WALKER_RAIL_OFF, WALKER_RAIL_OFF),
				"u": rng.randf_range(u0, u1),
				"floor": u0,
				"top": u1,
				"dir": 1.0 if rng.randf() < 0.5 else -1.0,
				"speed": rng.randf_range(WALKER_SPEED_MIN, WALKER_SPEED_MAX),
				"wait": rng.randf_range(0.0, 8.0),
			}
			_place_walker(d)
			_walkers.append(d)





func _place_walker(w: Dictionary) -> void:
	var u: float = w["u"]
	var local_z: float = -2.4 - u
	var local_y: float = 1.0 +(- local_z - 1.5) * 1.6 + 0.15 + 0.7
	var node: AnimatedSprite3D = w["node"]



	if bool(w.get("vendor", false)):
		local_y += WALKER_HEIGHT *(VENDOR_SCALE - 1.0) * 0.5
	node.position = Vector3(w["x"], local_y, local_z)





func _tick_walkers(delta: float) -> void:
	for w in _walkers:
		var node: AnimatedSprite3D = w["node"]
		if w["wait"] > 0.0:
			w["wait"] = w["wait"] - delta
			node.speed_scale = 0.7
			continue








		if bool(w.get("down", false)) and node.animation == "sad":
			node.play("idle")
		node.speed_scale = 1.5







		if w.has("cross_to"):
			var meta_x: float = float(w["cross_to"])
			var paso: float = VENDOR_CROSS_SPD * delta
			var dx: float = meta_x - float(w["x"])
			if absf(dx) <= paso:
				w["x"] = meta_x
				w.erase("cross_to")

				if w.has("ring_to"):
					var anillo: Vector2 = w["ring_to"]
					w["floor"] = anillo.x
					w["top"] = anillo.y
					w["u"] = anillo.x
					w.erase("ring_to")
					node.visible = true
				w["dir"] = 1.0
				w["wait"] = randf_range(0.8, 2.0)
			else:
				w["x"] = float(w["x"]) + signf(dx) * paso
			_place_walker(w)
			continue
		var u: float = w["u"] + w["dir"] * w["speed"] * delta
		var piso: float = float(w.get("floor", 0.0))
		if u <= piso or u >= w["top"]:
			u = clampf(u, piso, w["top"])
			w["dir"] = - w["dir"]



			w["wait"] = randf_range(0.8, 2.2) if bool(w.get("vendor", false)) \
					else randf_range(2.0, 7.0)





			if bool(w.get("vendor", false)) and u <= piso and randf() < 0.34:
				var xs: Array = w.get("aisles", [])
				if xs.size() > 1:
					var destino: float = float(xs[randi() % xs.size()])
					if not is_equal_approx(destino, float(w["x"])):
						w["cross_to"] = destino
						w["wait"] = randf_range(0.6, 1.6)








						var lo: Vector2 = w.get("ring_lo", Vector2(0.0, w["top"]))
						var hi: Vector2 = w.get("ring_hi", lo)
						if hi != lo and randf() < 0.5:
							var mismo: bool = is_equal_approx(
								float(w.get("floor", 0.0)), lo.x)
							w["ring_to"] = hi if mismo else lo
							node.visible = false



		elif bool(w.get("vendor", false)) and randf() < delta * 0.05:
			w["wait"] = randf_range(1.0, 2.2)
		w["u"] = u
		_place_walker(w)



































const VENDOR_HIT_R: float = 2.6



const VENDOR_DOWN_S: float = 7.0








const FOOD_FLY_S: float = 1.5
const FOOD_FLY_OUT: float = 2.2
const FOOD_FLY_ARC: float = 1.7
const FOOD_FLY_DROP: float = 2.4









func vendor_at(p: Vector3, r: float = VENDOR_HIT_R) -> int:
	if _walkers.is_empty() or not stand_seat_exists(p):
		return -1



	var seat: Vector3 = stand_catch_spot(p)
	var por_fondo: bool = _catch_by_end(p)
	var mid: float = FIELD_DEPTH * 0.5
	for i in _walkers.size():
		var w: Dictionary = _walkers[i]



		if not bool(w.get("vendor", false)) or bool(w.get("down", false)):
			continue
		var node: Node3D = SceneFade.vivo(w["node"]) as Node3D
		if not is_instance_valid(node):
			continue
		var gp: Vector3 = node.global_position
		if por_fondo:
			if signf(gp.z - mid) != signf(seat.z - mid):
				continue
			if absf(gp.x - p.x) <= r:
				return i
		else:
			if signf(gp.x) != signf(p.x):
				continue
			if absf(gp.z - p.z) <= r:
				return i
	return -1



func vendor_pos(i: int) -> Vector3:
	if i < 0 or i >= _walkers.size():
		return Vector3.INF
	var node: Node3D = SceneFade.vivo(_walkers[i]["node"]) as Node3D
	if not is_instance_valid(node):
		return Vector3.INF
	return node.global_position






func knock_vendor(i: int, from: Vector3) -> void:
	if i < 0 or i >= _walkers.size():
		return
	var w: Dictionary = _walkers[i]
	if not bool(w.get("vendor", false)) or bool(w.get("down", false)):
		return
	var node: AnimatedSprite3D = SceneFade.vivo(w["node"]) as AnimatedSprite3D
	if not is_instance_valid(node):
		return
	w["down"] = true
	w["wait"] = VENDOR_DOWN_S


	if node.sprite_frames != null and node.sprite_frames.has_animation("sad"):
		node.play("sad")





	var stand: Node3D = node.get_parent() as Node3D
	var away: Vector3 = node.global_position - from
	away.y = 0.0
	away = away.normalized() if away.length() > 0.01 else Vector3(0.0, 0.0, -1.0)
	var local: Vector3 = away
	if is_instance_valid(stand):
		local = stand.global_transform.basis.inverse() * away
		local.y = 0.0
		local = local.normalized() if local.length() > 0.01 else Vector3(0.0, 0.0, -1.0)







	var tray: Node3D = SceneFade.vivo(node.get_meta("tray", null)) as Node3D
	if is_instance_valid(tray):
		var tw0: Tween = create_tween()
		tw0.set_parallel(true)
		tw0.tween_property(tray, "rotation:z", deg_to_rad(74.0), 0.28) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
		tw0.tween_property(tray, "position",
			tray.position + Vector3(0.0, -0.18, 0.06), 0.28) \
					.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)









	var sombrilla: Node3D = SceneFade.vivo(node.get_meta("sombrilla", null)) as Node3D
	if is_instance_valid(sombrilla) and is_instance_valid(stand):
		sombrilla.reparent(stand, true)
		_fly_food(sombrilla, local)
		node.remove_meta("sombrilla")
	var carga: Node3D = SceneFade.vivo(node.get_meta("carga", null)) as Node3D
	if is_instance_valid(carga) and is_instance_valid(stand):
		for hijo in carga.get_children():
			var piv: Node3D = hijo as Node3D
			if piv == null:
				continue
			piv.reparent(stand, true)
			_fly_food(piv, local)


		node.remove_meta("carga")
		carga.queue_free()





	_spray_food(node.global_position + Vector3(0.0, VENDOR_TRAY_Y, 0.0), away)






func _fly_food(piv: Node3D, dir: Vector3) -> void:
	var desde: Vector3 = piv.position


	var lat: Vector3 = Vector3(dir.z, 0.0, - dir.x)








	var hasta: Vector3 = desde \
			+ dir * FOOD_FLY_OUT * randf_range(-0.85, 0.45) \
			+ lat * randf_range(-0.9, 0.9) \
			+ Vector3(0.0, - FOOD_FLY_DROP, 0.0)
	var eje: Vector3 = Vector3(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0)).normalized()
	var giro: float = randf_range(9.0, 16.0)
	var arc: float = randf_range(FOOD_FLY_ARC * 0.6, FOOD_FLY_ARC)
	var dur: float = FOOD_FLY_S * randf_range(0.85, 1.15)

	var esc: Vector3 = piv.scale


	var tw: Tween = create_tween()
	tw.tween_method(func(t: float) -> void:
			if not is_instance_valid(piv):
				return
			piv.position = desde.lerp(hasta, t) + Vector3(0.0, sin(t * PI) * arc, 0.0)





			piv.basis = Basis(eje, t * dur * giro).scaled(esc),
		0.0, 1.0, dur)


	tw.tween_callback(piv.queue_free)























var _food_res: Array = []


func _food_pieces() -> Array:
	if not _food_res.is_empty():
		return _food_res


	var vaso: CylinderMesh = CylinderMesh.new()
	vaso.top_radius = 0.085
	vaso.bottom_radius = 0.062
	vaso.height = 0.26
	vaso.radial_segments = 8
	vaso.rings = 1
	var vaso_min: CylinderMesh = CylinderMesh.new()
	vaso_min.top_radius = 0.072
	vaso_min.bottom_radius = 0.052
	vaso_min.height = 0.21
	vaso_min.radial_segments = 8
	vaso_min.rings = 1
	var caja: BoxMesh = BoxMesh.new()
	caja.size = Vector3(0.19, 0.26, 0.14)
	var cono: CylinderMesh = CylinderMesh.new()
	cono.top_radius = 0.094
	cono.bottom_radius = 0.036
	cono.height = 0.22
	cono.radial_segments = 8
	cono.rings = 1
	var dog: CapsuleMesh = CapsuleMesh.new()
	dog.radius = 0.048
	dog.height = 0.24
	dog.radial_segments = 6
	dog.rings = 2
	var nachos: BoxMesh = BoxMesh.new()
	nachos.size = Vector3(0.17, 0.1, 0.13)
	_food_res = [
		{"mesh": vaso, "col": Color("e8e4dc"),
			"pos": Vector3(-0.26, 0.18, -0.06), "rot": Vector3.ZERO},
		{"mesh": vaso_min, "col": Color("5a3a86"),
			"pos": Vector3(-0.26, 0.155, 0.1), "rot": Vector3.ZERO},
		{"mesh": caja, "col": Color("f0c33a"),
			"pos": Vector3(0.0, 0.18, 0.0), "rot": Vector3.ZERO},
		{"mesh": cono, "col": Color("d8452f"),
			"pos": Vector3(0.26, 0.16, -0.07), "rot": Vector3.ZERO},


		{"mesh": dog, "col": Color("caa06a"),
			"pos": Vector3(0.26, 0.1, 0.1), "rot": Vector3(0.0, 0.35, PI * 0.5)},



		{"mesh": nachos, "col": Color("e8822a"),
			"pos": Vector3(-0.02, 0.37, -0.01), "rot": Vector3(0.0, 0.25, 0.1)},
	]
	for d in _food_res:
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = d["col"]
		mat.roughness = 0.85



		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		d["mat"] = mat
	return _food_res





const PARASOL_R: float = 0.78
const PARASOL_Y: float = 1.05


func _make_parasol() -> Node3D:
	var raiz: Node3D = Node3D.new()
	raiz.name = "Sombrilla"
	var palo: MeshInstance3D = MeshInstance3D.new()
	var palo_m: CylinderMesh = CylinderMesh.new()
	palo_m.top_radius = 0.035
	palo_m.bottom_radius = 0.035
	palo_m.height = 1.0
	palo_m.radial_segments = 6
	palo_m.rings = 1
	palo.mesh = palo_m
	palo.material_override = _plano(Color("3b2f26"))
	palo.position = Vector3(0.0, PARASOL_Y - 0.5, 0.0)
	palo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	raiz.add_child(palo)
	var tela: MeshInstance3D = MeshInstance3D.new()
	var tela_m: CylinderMesh = CylinderMesh.new()
	tela_m.top_radius = 0.04
	tela_m.bottom_radius = PARASOL_R
	tela_m.height = 0.34
	tela_m.radial_segments = 10
	tela_m.rings = 1
	tela.mesh = tela_m
	tela.material_override = _plano(Color("ffd227"))
	tela.position = Vector3(0.0, PARASOL_Y + 0.17, 0.0)
	tela.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	raiz.add_child(tela)


	var ribete: MeshInstance3D = MeshInstance3D.new()
	var ribete_m: CylinderMesh = CylinderMesh.new()
	ribete_m.top_radius = PARASOL_R
	ribete_m.bottom_radius = PARASOL_R * 0.98
	ribete_m.height = 0.06
	ribete_m.radial_segments = 10
	ribete_m.rings = 1
	ribete.mesh = ribete_m
	ribete.material_override = _plano(Color("fdfdfd"))
	ribete.position = Vector3(0.0, PARASOL_Y + 0.02, 0.0)
	ribete.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	raiz.add_child(ribete)
	return raiz




func _plano(col: Color) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.9
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	return mat


func _make_tray_food() -> Node3D:
	var carga: Node3D = Node3D.new()
	carga.name = "Carga"
	for d in _food_pieces():
		var piv: Node3D = Node3D.new()
		piv.position = d["pos"]
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = d["mesh"]
		mi.material_override = d["mat"]
		mi.rotation = d["rot"]


		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		piv.add_child(mi)
		carga.add_child(piv)
	return carga










const FOOD_SPRAY_AMOUNT: int = 44
const FOOD_SPRAY_LIFE: float = 1.1
var _food_spray: GeometryInstance3D = null
var _food_bits: GeometryInstance3D = null


func _spray_food(pos: Vector3, dir: Vector3) -> void:



	if _food_spray == null:
		_food_spray = _make_food_spray(true)
		add_child(_food_spray)
	if _food_bits == null:
		_food_bits = _make_food_spray(false)
		add_child(_food_bits)
	for p in [_food_spray, _food_bits]:
		var pm: Resource = p.process_material




		pm.direction =(dir * -0.35 + Vector3.UP).normalized()
		p.global_position = pos

		p.emitting = false
		p.restart()
		p.emitting = true


func _make_food_spray(liquido: bool) -> GeometryInstance3D:
	var p: GeometryInstance3D = Particulas.nodo()
	p.amount = FOOD_SPRAY_AMOUNT
	p.one_shot = true
	p.explosiveness = 1.0
	p.lifetime = FOOD_SPRAY_LIFE if liquido else FOOD_SPRAY_LIFE * 1.35
	p.emitting = false
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	p.visibility_aabb = AABB(Vector3(-2.5, -3.5, -2.5), Vector3(5.0, 6.0, 5.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_SPHERE
	pm.emission_sphere_radius = 0.12
	pm.direction = Vector3(0.0, 1.0, 0.0)
	pm.spread = 55.0 if liquido else 40.0
	pm.gravity = Vector3(0.0, -11.0, 0.0)
	pm.initial_velocity_min = 1.0 if liquido else 0.8
	pm.initial_velocity_max = 3.4 if liquido else 2.4
	pm.scale_min = 0.5
	pm.scale_max = 1.1



	if liquido:
		var c: Curve = Curve.new()
		c.add_point(Vector2(0.0, 1.0))
		c.add_point(Vector2(0.55, 0.7))
		c.add_point(Vector2(1.0, 0.0))

		pm.scale_curve = Particulas.curva(c)
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 0.5, 1.0])
	if liquido:



		grad.colors = PackedColorArray([
			Color(0.86, 0.78, 0.66, 0.95), Color(0.42, 0.24, 0.12, 0.72),
			Color(0.36, 0.2, 0.1, 0.0)])
	else:

		grad.colors = PackedColorArray([
			Color(0.96, 0.82, 0.3, 1.0), Color(0.9, 0.52, 0.16, 0.9),
			Color(0.8, 0.26, 0.16, 0.0)])
	pm.color_ramp = Particulas.rampa(grad)
	p.process_material = pm
	var quad: QuadMesh = QuadMesh.new()





	quad.size = Vector2(0.14, 0.14) if liquido else Vector2(0.24, 0.24)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	p.draw_pass_1 = quad
	return p









func _add_static_fans(root: Node3D, transforms: Array, is_local: bool,
		is_mine: bool, pose: int, sec: int, sec_w: float, length: float) -> void:
	var frames: SpriteFrames = _fan_frames_home if is_local else _fan_frames_away
	if frames == null:
		return
	var wardrobe: int = 0 if pose == 0 else 1 + posmod(sec + int(root.position.x), 3)
	frames = _finish_frames(is_local, wardrobe)
	var tex: Texture2D = frames.get_frame_texture("idle",
		pose % maxi(frames.get_frame_count("idle"), 1))
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(tex.get_width(), tex.get_height()) *(1.5 / 32.0)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


	mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
	mat.billboard_keep_scale = true
	mat.vertex_color_use_as_albedo = true
	quad.material = mat
	mm.mesh = quad
	mm.use_colors = true
	mm.instance_count = transforms.size()
	var tint_rng: RandomNumberGenerator = RandomNumberGenerator.new()
	tint_rng.seed = int(root.position.x * 131.0 + root.position.z * 17.0) + pose











	var mosaic: bool =(_big_night \
			or (_derby and _club_tier_v == "alto" and div <= 2)) and is_local
	var mosaic_c: Color = _club_a if sec % 2 == 0 else _club_b
	for i in transforms.size():
		mm.set_instance_transform(i, transforms[i])


		var v: float = tint_rng.randf_range(0.82, 1.06)
		var c: Color = Color(v, v * tint_rng.randf_range(0.97, 1.03),
			v * tint_rng.randf_range(0.96, 1.04))
		if mosaic:



			c = c.lerp(mosaic_c * 1.6, 0.55)

		if bool(root.get_meta("acabado_cubierta", false)):
			c *= lerpf(1.0, 0.78, clampf(transforms[i].origin.y / 24.0, 0.0, 1.0))
			c.a = 1.0
		mm.set_instance_color(i, c)
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


	mmi.set_meta("occ_gente", true)
	root.add_child(mmi)





	var sec_x: float = - length * 0.5 + sec_w *(float(sec) + 0.5)
	var world: Vector3 = root.transform * Vector3(sec_x, 0.0, 0.0)
	var jump_rng: RandomNumberGenerator = RandomNumberGenerator.new()
	jump_rng.seed = int(world.x * 7.0 + world.z * 13.0) + sec * 31 + pose


	var sections: int = maxi(int(round(length / maxf(sec_w, 0.001))), 1)
	var seat: float = _seat_score(root.position, sec, sections)





	var ang_c: float = atan2(world.x, world.z - 52.5)
	var ang_w: float = 0.0
	var paso: int = maxi(1, transforms.size() / 32)
	for k in range(0, transforms.size() + paso - 1, paso):
		var wp: Vector3 = root.transform \
				*(transforms[mini(k, transforms.size() - 1)] as Transform3D).origin
		ang_w = maxf(ang_w, absf(wrapf(atan2(wp.x, wp.z - 52.5) - ang_c, - PI, PI)))
	_fan_buckets.append({
		"mat": mat,
		"mmi": mmi,
		"home": is_mine,
		"local": is_local,
		"sway_x0": mmi.position.x,
		"idle": tex,




		"base": tex,
		"standing": false,
		"seat": seat,
		"seats": transforms.size(),
		"wardrobe": wardrobe,
		"pose": pose,



		"stand_rank": clampf(seat * 0.85 + jump_rng.randf_range(-0.07, 0.07), 0.0, 1.0),
		"cheer": _pose_textures(frames, "cheer"),
		"sad": _pose_textures(frames, "sad"),



		"boo": _pose_textures(frames, "boo"),
		"delay": clampf(world.length() / 150.0, 0.0, 0.9)
			+ jump_rng.randf_range(0.0, 0.25),
		"phase": jump_rng.randf_range(0.0, 0.5),


		"jumps": jump_rng.randf() < 0.45,
		"hz": jump_rng.randf_range(1.7, 2.4),









		"ang": ang_c,
		"ang_w": ang_w + 0.02,



		"pos": world,
		"pogo": seat < 0.3 and jump_rng.randf() < 0.55,
		"pogo_hz": jump_rng.randf_range(0.9, 1.35),
		"pogo_off": jump_rng.randf_range(0.0, 6.28),
		"cur": -1,
	})
	if not backdrop and not venue_empty:
		var ropa: Dictionary = _host_kit_now() if is_local else _visitor_kit_now()
		_vida_recinto.sector(_fan_buckets.back(), transforms,
			ropa.get("kit", _club_a), ropa.get("kit2", _club_b))



func _pose_textures(frames: SpriteFrames, anim: String) -> Array[Texture2D]:
	var out: Array[Texture2D] = []
	if not frames.has_animation(anim):
		return out
	for i in frames.get_frame_count(anim):
		out.append(frames.get_frame_texture(anim, i))
	return out








const DUGOUT_X: float = -38.6




const DUGOUT_INSIDE_RING: float = 0.7





const DUGOUT_LEN: float = 9.4
const DUGOUT_OFFSET_Z: float = 13.0
const TECH_AREA_LEN: float = 14.0









const TECH_AREA_NEAR: float = 1.4
const TECH_AREA_FAR: float = 4.0




const REF4_FROM_DUGOUT: float = 3.4



const BENCH_TOP_Y: float = 0.62




const BALL_ART: String = "res://assets/sprites/objects/ball_32.png"



const BALL_ART_D: float = 0.26







var _dugout_bottles: Array = []







func _dugout_x() -> float:
	if not _track:
		return DUGOUT_X
	return -(_ring_x() - DUGOUT_INSIDE_RING)


func _build_dugouts() -> void:
	if backdrop:
		return




	_dugout_people.clear()
	_dugout_bottles.clear()
	await _dugout(HALF_LINE - DUGOUT_OFFSET_Z, true)
	await _dugout(HALF_LINE + DUGOUT_OFFSET_Z, false)




func _dugout(center_z: float, is_home: bool) -> void:
	var cfg: Dictionary = _dugout_cfg()



	var dlen: float = float(cfg["len"])
	var root: Node3D = Node3D.new()
	root.position = Vector3(_dugout_x(), 0.0, center_z)
	await _respira()
	add_child(root)





	if bool(_stands_cfg()["dugout_roof"]):


		var shell: StandardMaterial3D = StandardMaterial3D.new()
		shell.albedo_color = Color("59616e")
		shell.roughness = 1.0
		FinishDetail.acabado(shell, "metal", div)


		var back: MeshInstance3D = MeshInstance3D.new()
		var back_mesh: BoxMesh = BoxMesh.new()
		back_mesh.size = Vector3(0.25, 2.1, dlen - 0.4)
		back.mesh = back_mesh
		back.material_override = shell
		back.position = Vector3(-0.9, 1.05, 0.0)
		root.add_child(back)



		var panos: Array[MeshInstance3D] = preload("res://features/stadium/dugout_detail.gd").cubierta(root, div, dlen, shell)
		for pano in panos:
			_snow_cap(pano, Vector3(0, 0.065, 0), Vector3(pano.mesh.size.x, 0.04, dlen))
		shell.emission_enabled = true
		shell.emission = shell.albedo_color
		shell.emission_energy_multiplier = 0.035
		_dugout_interiors.append(shell)




		var glass: bool = bool(cfg["glass"])
		var wall_mat: StandardMaterial3D = shell
		if glass:
			wall_mat = StandardMaterial3D.new()
			wall_mat.albedo_color = Color(0.35, 0.42, 0.5, 0.45)
			wall_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			wall_mat.roughness = 0.15
			wall_mat.metallic = 0.2


			wall_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		for side in [-1.0, 1.0]:
			var wall: MeshInstance3D = MeshInstance3D.new()
			var wall_mesh: BoxMesh = BoxMesh.new()
			wall_mesh.size = Vector3(2.2, 2.1, 0.06 if glass else 0.2)
			wall.mesh = wall_mesh
			wall.material_override = wall_mat
			if glass:
				wall.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			wall.position = Vector3(0.1, 1.05, side *(dlen * 0.5 - 0.1))
			root.add_child(wall)

		_dugout_frame(root, is_home, cfg, shell)



	var seat_mat: StandardMaterial3D = StandardMaterial3D.new()




	seat_mat.albedo_color = Color("6b4c2f") if not bool(cfg["bucket"]) \
			else (Color("2f5fbf") if is_home else Color("bf3a35")).darkened(0.4)
	seat_mat.roughness = 1.0
	var bench: MeshInstance3D = MeshInstance3D.new()
	var bench_mesh: BoxMesh = BoxMesh.new()

	bench_mesh.size = Vector3(0.16, 0.045, dlen - 1.0)
	bench.mesh = bench_mesh
	bench.material_override = seat_mat
	bench.name = "RepisaBotellas"
	bench.position = Vector3(0.45, BENCH_TOP_Y - 0.0225, 0.0)
	root.add_child(bench)




	if bool(cfg["bucket"]):
		_dugout_seats(root, is_home, cfg)




	var free_seats: Array[int] = await _spawn_subs(root, is_home, cfg)
	_dugout_props(root, is_home, cfg)
	_dugout_clutter(root, is_home, cfg, free_seats)
	_dugout_detail(root, is_home, cfg)
	FinishDetail.banda(root, dlen, div)
	var plazas_detalle: Array[float] = []
	for i in int(cfg["seats"]):
		plazas_detalle.append(_dugout_seat_z(i, cfg))
	var uniforme_detalle: Dictionary = _host_kit_now() if is_home else _visitor_kit_now()
	var color_detalle: Color = uniforme_detalle.get("kit", _club_a)
	await _respira()
	preload("res://features/stadium/dugout_detail.gd").construir(root, cfg,
		color_detalle, div, plazas_detalle, bool(_stands_cfg()["dugout_roof"]), free_seats)



	var paint: StandardMaterial3D = StandardMaterial3D.new()
	paint.albedo_color = LINE_COLOR
	paint.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var half_len: float = TECH_AREA_LEN * 0.5

	var mid_x: float =(TECH_AREA_NEAR + TECH_AREA_FAR) * 0.5
	var span_x: float = TECH_AREA_FAR - TECH_AREA_NEAR
	for z_off in [- half_len, half_len]:
		_paint_line(root, Vector3(mid_x, 0.02, z_off),
			Vector3(span_x, 0.001, 0.12), paint)
	_paint_line(root, Vector3(TECH_AREA_FAR, 0.02, 0.0),
		Vector3(0.12, 0.001, TECH_AREA_LEN), paint)

	await _spawn_coach(root, is_home, half_len)
	await _spawn_staff(root, is_home, cfg)





















func _dugout_frame(root: Node3D, is_home: bool, cfg: Dictionary,
		shell: StandardMaterial3D) -> void:
	var dlen: float = float(cfg["len"])

	var mat_mat: StandardMaterial3D = StandardMaterial3D.new()
	mat_mat.albedo_color = Color("2b2f36")
	mat_mat.roughness = 1.0
	var floor_m: MeshInstance3D = MeshInstance3D.new()
	var floor_mesh: BoxMesh = BoxMesh.new()
	floor_mesh.size = Vector3(2.15, 0.03, dlen - 0.3)
	floor_m.mesh = floor_mesh
	floor_m.material_override = mat_mat


	floor_m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	floor_m.position = Vector3(0.1, 0.02, 0.0)
	root.add_child(floor_m)



	var post_mat: StandardMaterial3D = StandardMaterial3D.new()
	post_mat.albedo_color = shell.albedo_color.darkened(0.3)
	post_mat.roughness = 1.0
	var post_mesh: BoxMesh = BoxMesh.new()

	post_mesh.size = Vector3(0.09, 2.07, 0.09)
	for side in [-1.0, 1.0]:
		var post: MeshInstance3D = MeshInstance3D.new()
		post.mesh = post_mesh
		post.material_override = post_mat
		post.position = Vector3(1.13, 1.035, side *(dlen * 0.5 - 0.18))
		root.add_child(post)





	var side_kit: Dictionary = _host_kit_now() if is_home else _visitor_kit_now()



	var band_col: Color = Color("59616e")
	if side_kit.has("kit"):
		band_col = side_kit["kit"]
	var band: StandardMaterial3D = StandardMaterial3D.new()
	band.albedo_color = band_col.darkened(0.35)
	band.roughness = 0.9
	var fascia: MeshInstance3D = MeshInstance3D.new()
	var fascia_mesh: BoxMesh = BoxMesh.new()
	fascia_mesh.size = Vector3(0.1, 0.2, dlen)
	fascia.mesh = fascia_mesh
	fascia.material_override = band
	fascia.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	fascia.position = Vector3(1.19, 1.98, 0.0)
	root.add_child(fascia)






	if bool(cfg["glass"]):
		var led: StandardMaterial3D = StandardMaterial3D.new()
		led.albedo_color = Color("bcb8ab")
		led.emission_enabled = true
		led.emission = Color("ffeccb")
		led.emission_energy_multiplier = 0.0
		_dugout_lamps.append(led)
		var strip: MeshInstance3D = MeshInstance3D.new()
		var strip_mesh: BoxMesh = BoxMesh.new()
		strip_mesh.size = Vector3(0.11, 0.05, dlen - 0.2)
		strip.name = "LuzBanquillo"
		strip.mesh = strip_mesh
		strip.material_override = led
		strip.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		strip.position = Vector3(1.19, 1.865, 0.0)
		root.add_child(strip)





const SUB_HEIGHT: float = 1.5
const COACH_HEIGHT: float = 1.84








const COACH_SHEET: String = "res://assets/sprites/anim/coach_south_"




func _dugout_seat_z(i: int, cfg: Dictionary) -> float:
	var n: int = maxi(int(cfg["seats"]), 2)
	var usable: float = float(cfg["len"]) - 2.2
	return - usable * 0.5 + usable *(float(i) / float(n - 1))
















const PERSON_SHEET: String = "res://assets/sprites/anim/idle_south_"










const PERSON_DIRS: Array[String] = ["east", "west", "north"]
const PERSON_FRAMES: int = 4



const PERSON_BODY_PX: float = 63.0



















const SUB_SITTING_SHEET: String = "res://assets/sprites/anim/sentado_brazos_south_"

func _sub_frames(cfg: Dictionary, sentado: bool) -> SpriteFrames:
	return _person_frames(cfg, SUB_SITTING_SHEET if sentado else PERSON_SHEET,
		2, dugout_views and not sentado, 1 if sentado else 0)


func _person_frames(cfg: Dictionary, sheet: String = PERSON_SHEET,
		want: int = PERSON_FRAMES, views: bool = false, inicio: int = 0) -> SpriteFrames:
	var rutas: Array = _person_rutas(sheet, want, inicio)
	var imgs: Array[Texture2D] = []
	for path: String in rutas:
		imgs.append(KitRecolor.apply(load(path), cfg))
	var frames: SpriteFrames = _person_arma(imgs, rutas, cfg)
	if frames == null:
		return null



	if views and sheet.ends_with("south_"):
		for dir: String in PERSON_DIRS:
			_person_vista(frames, cfg, sheet, dir)
	return frames






func _person_rutas(sheet: String, want: int, inicio: int) -> Array:
	var rutas: Array = []
	for i in range(inicio, inicio + mini(want, PERSON_FRAMES)):
		var path: String = "%s%02d.png" % [sheet, i]
		if ResourceLoader.exists(path):
			rutas.append(path)
	return rutas




func _person_arma(imgs: Array[Texture2D], rutas: Array, cfg: Dictionary) -> SpriteFrames:
	if imgs.is_empty():
		var base: String = "res://assets/sprites/players/player_south.png"
		if not ResourceLoader.exists(base):
			return null
		imgs.append(KitRecolor.apply(load(base), cfg))
	var frames: SpriteFrames = SpriteFrames.new()



	for anim in ["idle", "cheer", "sad"]:
		frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, 4.5)
		for tex in imgs:
			frames.add_frame(anim, tex)
		_apunta_cara(frames, anim, rutas, cfg)
	return frames



func _person_vista(frames: SpriteFrames, cfg: Dictionary, sheet: String, dir: String) -> void:
	var raiz: String = sheet.trim_suffix("south_")
	var path: String = "%s%s_00.png" % [raiz, dir]
	if not ResourceLoader.exists(path):
		return
	var anim: String = "idle_" + dir
	frames.add_animation(anim)
	frames.set_animation_loop(anim, true)
	frames.set_animation_speed(anim, 4.5)
	frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
	_apunta_cara(frames, anim, [path], cfg)







static func _apunta_cara(frames: SpriteFrames, anim: String, rutas: Array, cfg: Dictionary) -> void:
	if rutas.size() != frames.get_frame_count(anim):
		return
	var todas: Dictionary = frames.get_meta("cara_rutas", {})
	todas[anim] = rutas.duplicate()
	frames.set_meta("cara_rutas", todas)
	frames.set_meta("anim_cfg", cfg)



func coach_cara(coach: AnimatedSprite3D, anim: String, dura_s: float) -> void:
	if coach == null or not is_instance_valid(coach) or coach.sprite_frames == null \
			or not coach.sprite_frames.has_meta("cara_rutas") or coach.get_parent() == null:
		return
	coach.set_meta("anim_cfg", coach.sprite_frames.get_meta("anim_cfg", {}))
	CaraEncima.pon(coach.get_parent(), coach, coach.sprite_frames.get_meta("cara_rutas"),
		anim, dura_s)







static var _feet_px_cache: Dictionary = {}






func _person_feet(pixel_size: float, sheet: String = PERSON_SHEET) -> float:
	if not _feet_px_cache.has(sheet):
		_feet_px_cache[sheet] = _measure_feet_px(sheet)
	return float(_feet_px_cache[sheet]) * pixel_size




func _measure_feet_px(sheet: String) -> float:
	var p: String = sheet + "00.png"
	if not ResourceLoader.exists(p):
		return 33.0
	var img: Image = SceneFade.imagen(load(p))
	if img == null:
		return 33.0
	if img.is_compressed():
		img.decompress()
	var used: Rect2i = img.get_used_rect()
	if used.size.y <= 0:
		return 33.0
	return float(img.get_height()) * 0.5 - float(img.get_height() - used.end.y)






















const SUB_STAND_H: float = 1.76
const SUB_STAND_X: float = 1.05













const BIB_COLORS: Array[Color] = [Color("ff8f1f"), Color("d9c531")]






const COAT_COLORS: Array[Color] = [
	Color("2f3b4a"), Color("36453a"), Color("3f3a44"), Color("4a4238"),
]



















const BENCH_COAT: Color = Color("36405a")
const BENCH_COAT2: Color = Color("232a3a")






const BENCH_COAT_FRIO: float = 0.55





















func _banca_nombres(is_home: bool) -> Array[String]:




	var local: String = _club_local()
	var mio: String = Nations.canon_id(Career.nationality) if _comp == "nat" \
			else GameState.player_team_id
	var club: String = local
	if not is_home:
		if local != mio:
			club = mio
		elif home_only or att_override >= 0.0:






			club = ""
		else:
			club = String(GameState.current_rival().get("id", ""))
	var out: Array[String] = []
	if club.is_empty():
		return out
	var squad: Array = Squad.of(club)
	for i in range(Squad.STARTING_XI,
			mini(Squad.STARTING_XI + Squad.BENCH_SIZE, squad.size())):
		var nm: String = String((squad[i] as Dictionary).get("name", ""))




		if nm.is_empty() or nm == Career.player_name:
			continue
		out.append(nm)
	return out





func _spawn_subs(root: Node3D, is_home: bool, cfg: Dictionary) -> Array[int]:
	var free: Array[int] = []



	if venue_empty:
		for i in int(cfg["seats"]):
			free.append(i)
		return free




	var side: Dictionary = _host_kit_now() if is_home else _visitor_kit_now()
	var seed_club: String = _pitch_seed_club() +("_h" if is_home else "_a")


	var convocados: Array[String] = _banca_nombres(is_home)


	var rng := RandomNumberGenerator.new()
	rng.seed = hash(seed_club)
	var seats: int = int(cfg["seats"])
	var coats: bool = bool(cfg["coats"])

	var stand_a: int = 0 if rng.randf() < 0.5 else seats - 1
	var stand_b: int = -1 if rng.randf() < 0.45 else (seats - 1 - stand_a)



	var empty: int = -1
	if rng.randf() < 0.4:
		empty = rng.randi_range(1, seats - 2)













	var bib_col: Color = BIB_COLORS[0 if is_home else 1]





	var k: int = 0
	for i in seats:
		var standing: bool = i == stand_a or i == stand_b



		var sin_nadie: bool = not convocados.is_empty() and k >= convocados.size()
		if sin_nadie:
			free.append(i)
			continue
		if standing or i == empty:
			free.append(i)
		if not standing and i == empty:
			continue
		var kit: Dictionary = side.duplicate()



		var abrigado: bool = coats and rng.randf() < 0.55
		if not abrigado:











			kit["bib"] = bib_col
		if abrigado:




			kit["kit"] = COAT_COLORS[rng.randi() % COAT_COLORS.size()]
			kit["kit2"] = Color("23262c")
			kit.erase("pattern")
		var h: float =(SUB_STAND_H if standing else SUB_HEIGHT) \
				* rng.randf_range(0.96, 1.04)




		var quien: String = convocados[k] if k < convocados.size() \
				else "%s_sub%d" % [seed_club, i]
		k += 1
		await _respira()
		var frames: SpriteFrames = _sub_frames(
			KitRecolor.appearance_for(quien, kit), not standing)
		if frames == null:
			return free
		var sub: AnimatedSprite3D = AnimatedSprite3D.new()
		sub.sprite_frames = frames












		sub.set_meta("viste",
			{"quien": quien, "seco": kit.duplicate(), "abrigo": abrigado, "sentado": not standing})
		sub.pixel_size = h / PERSON_BODY_PX
		sub.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		sub.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		sub.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD

		var x: float = SUB_STAND_X if standing \
				else -0.05 + rng.randf_range(-0.025, 0.025)

		var altura: float = _person_feet(sub.pixel_size) if standing else 0.54 + 23.0 * sub.pixel_size
		sub.position = Vector3(x, altura,
			_dugout_seat_z(i, cfg) + rng.randf_range(-0.08, 0.08))
		root.add_child(sub)
		_register_dugout_person(sub, root.position, is_home, "sub", standing)
		if standing and not backdrop and not dugout_views:
			_vida_recinto.suplente(sub, _dugout_people.back())
		sub.play("idle")

		sub.frame = i % maxi(1, frames.get_frame_count("idle"))
		sub.speed_scale = rng.randf_range(0.5, 0.85)
	return free









func _spawn_staff(root: Node3D, is_home: bool, cfg: Dictionary) -> void:
	var n: int = int(cfg["staff"])
	if n <= 0 or venue_empty:
		return
	var rng := RandomNumberGenerator.new()
	rng.seed = hash(_pitch_seed_club() +("_staff_h" if is_home else "_staff_a"))






	var staff_side: Dictionary = _host_kit_now() if is_home else _visitor_kit_now()
	var staff_col: Color = Color("2f3b4a")
	if staff_side.has("kit"):

		var club_col: Color = staff_side["kit"]
		staff_col = club_col.darkened(0.55)
	for i in n:
		var kit: Dictionary = {
			"kit": staff_col,
			"kit2": Color("23262c"),
		}
		var h: float = 1.74 * rng.randf_range(0.97, 1.03)
		var quien: String = "%s_staff%d" % [_pitch_seed_club(), i]
		await _respira()
		var frames: SpriteFrames = _person_frames(
			KitRecolor.appearance_for(quien, kit), PERSON_SHEET, 2, dugout_views)
		if frames == null:
			return
		var st: AnimatedSprite3D = AnimatedSprite3D.new()
		st.sprite_frames = frames




		st.set_meta("viste", {"quien": quien, "seco": kit.duplicate()})
		st.pixel_size = h / PERSON_BODY_PX
		st.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		st.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		st.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


		var side: float = -1.0 if i % 2 == 0 else 1.0
		st.position = Vector3(0.62 + rng.randf_range(-0.08, 0.08),
			_person_feet(st.pixel_size),
			side *(float(cfg["len"]) * 0.5 - rng.randf_range(0.6, 1.3)))
		root.add_child(st)
		_register_dugout_person(st, root.position, is_home, "staff", true)
		st.play("idle")
		st.frame = i % maxi(1, frames.get_frame_count("idle"))
		st.speed_scale = rng.randf_range(0.5, 0.8)




























const SEAT_BACK_W: float = 0.1
const SEAT_BACK_H: float = 0.54
const SEAT_BACK_X: float = -0.56
const SEAT_BACK_Y: float = 0.76

const SEAT_PAN_D: float = 0.44
const SEAT_PAN_Y: float = 0.5
const SEAT_PAN_T: float = 0.07

const SEAT_ARM_W: float = 0.34
const SEAT_ARM_H: float = 0.16
const SEAT_ARM_T: float = 0.035



const SEAT_W: float = 0.52





func _dugout_seats(root: Node3D, is_home: bool, cfg: Dictionary) -> void:
	var base_col: Color =(Color("2f5fbf") if is_home \
			else Color("bf3a35")).darkened(0.4)
	var mat_back: StandardMaterial3D = StandardMaterial3D.new()
	mat_back.albedo_color = base_col.darkened(0.35)
	mat_back.roughness = 1.0


	var mat_pan: StandardMaterial3D = StandardMaterial3D.new()
	mat_pan.albedo_color = base_col.darkened(0.18)
	mat_pan.roughness = 1.0
	var mat_arm: StandardMaterial3D = StandardMaterial3D.new()
	mat_arm.albedo_color = base_col.darkened(0.52)
	mat_arm.roughness = 1.0

	for material in [mat_back, mat_pan, mat_arm]:
		material.emission_enabled = true
		material.emission = material.albedo_color
		material.emission_energy_multiplier = 0.035
		_dugout_interiors.append(material)

	var n: int = int(cfg["seats"])
	for i in n:
		var z: float = _dugout_seat_z(i, cfg)
		_seat_box(root, Vector3(SEAT_BACK_W, SEAT_BACK_H, SEAT_W),
			Vector3(SEAT_BACK_X, SEAT_BACK_Y, z), mat_back)
		_seat_box(root, Vector3(SEAT_PAN_D, SEAT_PAN_T, SEAT_W - 0.04),
			Vector3(SEAT_BACK_X + SEAT_PAN_D * 0.5, SEAT_PAN_Y, z), mat_pan)



		for lado in [-1.0, 1.0]:
			if lado < 0.0 and i > 0:
				continue
			_seat_box(root, Vector3(SEAT_ARM_W, SEAT_ARM_H, SEAT_ARM_T),
				Vector3(SEAT_BACK_X + SEAT_ARM_W * 0.5 + 0.03,
					SEAT_PAN_Y + SEAT_ARM_H * 0.5, z + lado * SEAT_W * 0.5),
				mat_arm)
	_dugout_seat_crests(root, is_home, cfg)





func _seat_box(root: Node3D, size: Vector3, pos: Vector3,
		mat: StandardMaterial3D) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	m.mesh = box
	m.material_override = mat
	m.position = pos
	root.add_child(m)










const SEAT_CREST_PX: int = 96



const SEAT_CREST_F: float = 0.62
func _dugout_seat_crests(root: Node3D, is_home: bool, cfg: Dictionary) -> void:





	if not is_home:
		return
	var team: Dictionary = _tifo_team()
	if team.is_empty():
		return
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(SEAT_CREST_PX, SEAT_CREST_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(SEAT_CREST_PX, SEAT_CREST_PX)
	crest.set_team(team)
	vp.add_child(crest)
	await RenderingServer.frame_post_draw
	await RenderingServer.frame_post_draw




	if not is_inside_tree() or not is_instance_valid(root) or not is_instance_valid(vp):
		if is_instance_valid(vp):
			vp.queue_free()
		return
	var img: Image = vp.get_texture().get_image()
	vp.queue_free()
	if img == null or img.is_empty():
		return
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var lado: float = SEAT_W * SEAT_CREST_F
	for i in int(cfg["seats"]):
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = tex
		spr.pixel_size = lado / float(SEAT_CREST_PX)
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



		spr.rotation_degrees = Vector3(0.0, 90.0, 0.0)
		spr.position = Vector3(SEAT_BACK_X + SEAT_BACK_W * 0.5 + 0.015,
			SEAT_BACK_Y + 0.04, _dugout_seat_z(i, cfg))
		root.add_child(spr)


func _dugout_props(root: Node3D, is_home: bool, cfg: Dictionary) -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = hash(_pitch_seed_club() +("_props_h" if is_home else "_props_a"))
	var level: String = String(cfg["props"])
	var crate: StandardMaterial3D = StandardMaterial3D.new()



	crate.albedo_color = Color("8a8f98")
	crate.roughness = 1.0
	var box: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(0.32, 0.22, 0.48)
	box.mesh = bm
	box.material_override = crate
	box.position = Vector3(0.95, 0.11, rng.randf_range(-2.6, -1.4))
	root.add_child(box)
	if level == "crate":

		return
	var bag: StandardMaterial3D = StandardMaterial3D.new()
	bag.albedo_color = Color("2a2d34")
	bag.roughness = 1.0
	var duffel: MeshInstance3D = MeshInstance3D.new()
	var dm: BoxMesh = BoxMesh.new()
	dm.size = Vector3(0.34, 0.3, 0.8)
	duffel.mesh = dm
	duffel.material_override = bag
	duffel.position = Vector3(0.9, 0.15, rng.randf_range(1.6, 3.0))
	root.add_child(duffel)
	if level != "full":
		return




	var desk_mat: StandardMaterial3D = StandardMaterial3D.new()
	desk_mat.albedo_color = Color("3a3f4a")
	desk_mat.roughness = 0.8
	var desk_z: float = float(cfg["len"]) * 0.5 - 0.9
	var top: MeshInstance3D = MeshInstance3D.new()
	var tm: BoxMesh = BoxMesh.new()
	tm.size = Vector3(0.44, 0.06, 0.9)
	top.mesh = tm
	top.material_override = desk_mat
	top.position = Vector3(0.7, 0.72, desk_z)
	root.add_child(top)
	var screen_mat: StandardMaterial3D = StandardMaterial3D.new()
	screen_mat.albedo_color = Color("11141a")
	screen_mat.roughness = 0.25
	var screen: MeshInstance3D = MeshInstance3D.new()
	var sm: BoxMesh = BoxMesh.new()
	sm.size = Vector3(0.04, 0.26, 0.42)
	screen.mesh = sm
	screen.material_override = screen_mat
	screen.position = Vector3(0.6, 0.88, desk_z)
	root.add_child(screen)





















func _dugout_clutter(root: Node3D, is_home: bool, cfg: Dictionary,
		free_seats: Array[int]) -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = hash(_pitch_seed_club() +("_clut_h" if is_home else "_clut_a"))
	var dlen: float = float(cfg["len"])





















	var group: Array[Node3D] = []

	var n_bot: int = 6 if dlen > 8.0 else 4




	var bot_z0: float =(dlen * 0.5 - 1.2) *(1.0 if rng.randf() < 0.5 else -1.0)
	var bot_dir: float = - signf(bot_z0)




	root.set_meta("bot_side", bot_z0)
	var bot_z: float = bot_z0
	for i in n_bot:



		var at: Vector3 = root.position + Vector3(
			0.45 + rng.randf_range(-0.05, 0.05), BENCH_TOP_Y, bot_z)
		var b: Node3D = _water_bottle(at, i)
		b.rotate_y(rng.randf_range(0.0, TAU))
		group.append(b)


		bot_z += bot_dir * rng.randf_range(0.24, 0.95)
	_dugout_bottles.append(group)


	if bool(cfg["bucket"]) and not free_seats.is_empty():
		var coat_mesh: BoxMesh = BoxMesh.new()


		coat_mesh.size = Vector3(0.19, 0.34, 0.5)
		for i in mini(2, free_seats.size()):
			var coat: MeshInstance3D = MeshInstance3D.new()
			var cm: StandardMaterial3D = StandardMaterial3D.new()
			cm.albedo_color = COAT_COLORS[rng.randi() % COAT_COLORS.size()]
			cm.roughness = 1.0
			coat.mesh = coat_mesh
			coat.material_override = cm
			coat.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


			coat.position = Vector3(-0.57, 0.82,
				_dugout_seat_z(free_seats[i], cfg))
			coat.rotation.z = rng.randf_range(-0.08, 0.08)
			root.add_child(coat)













	var ball_tex: Texture2D = load(BALL_ART) if ResourceLoader.exists(BALL_ART) \
			else null
	var ball_z: float = rng.randf_range(-2.4, -1.6)
	for i in 3:
		if ball_tex == null:
			break
		var ball: Sprite3D = Sprite3D.new()
		ball.texture = ball_tex
		ball.pixel_size = BALL_ART_D / 32.0
		ball.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		ball.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		ball.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD




		ball.position = Vector3(1.25 + rng.randf_range(-0.12, 0.12),
			BALL_ART_D *(16.0 - 3.0) / 32.0,
			ball_z + float(i) * 0.24 + rng.randf_range(-0.05, 0.05))
		root.add_child(ball)



























func _dugout_detail(root: Node3D, is_home: bool, cfg: Dictionary) -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = hash(_pitch_seed_club() +("_det_h" if is_home else "_det_a"))
	var dlen: float = float(cfg["len"])
	var level: String = String(cfg["props"])




	var cone_mat: StandardMaterial3D = StandardMaterial3D.new()








	cone_mat.albedo_color = Color("ff9142")
	cone_mat.roughness = 1.0
	cone_mat.emission_enabled = true
	cone_mat.emission = Color("ff9142")
	cone_mat.emission_energy_multiplier = 0.55
	var cone_mesh: CylinderMesh = CylinderMesh.new()
	cone_mesh.top_radius = 0.02
	cone_mesh.bottom_radius = 0.13
	cone_mesh.height = 0.3

	cone_mesh.radial_segments = 8
	cone_mesh.rings = 1



	var cone_z0: float = dlen * 0.5 + 1.2
	for i in (4 if level != "crate" else 3):
		var cone: MeshInstance3D = MeshInstance3D.new()
		cone.mesh = cone_mesh
		cone.material_override = cone_mat
		cone.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF










		cone.position = Vector3(
			1.45 + float(i % 2) * 1.3 + rng.randf_range(-0.12, 0.12), 0.15,
			cone_z0 + float(i / 2) * 1.3 + rng.randf_range(-0.18, 0.18))
		root.add_child(cone)


	var bin_mat: StandardMaterial3D = StandardMaterial3D.new()
	bin_mat.albedo_color = Color("4a5058")
	bin_mat.roughness = 1.0
	var bin_mesh: CylinderMesh = CylinderMesh.new()
	bin_mesh.top_radius = 0.21
	bin_mesh.bottom_radius = 0.17
	bin_mesh.height = 0.62
	bin_mesh.radial_segments = 10
	bin_mesh.rings = 1
	var bin: MeshInstance3D = MeshInstance3D.new()
	bin.mesh = bin_mesh
	bin.material_override = bin_mat




	bin.position = Vector3(0.98, 0.31, dlen * 0.5 + 0.55)
	root.add_child(bin)


	if level == "crate":
		return




	var ice_mat: StandardMaterial3D = StandardMaterial3D.new()
	ice_mat.albedo_color = Color("d8dce2")
	ice_mat.roughness = 0.85
	var ice: MeshInstance3D = MeshInstance3D.new()
	var im: BoxMesh = BoxMesh.new()
	im.size = Vector3(0.36, 0.3, 0.56)
	ice.mesh = im
	ice.material_override = ice_mat
	var ice_z: float = rng.randf_range(0.9, 1.9)
	ice.position = Vector3(0.95, 0.15, ice_z)
	root.add_child(ice)
	var side_kit: Dictionary = _host_kit_now() if is_home else _visitor_kit_now()
	var lid_col: Color = Color("59616e")
	if side_kit.has("kit"):
		lid_col = side_kit["kit"]
	var lid_mat: StandardMaterial3D = StandardMaterial3D.new()
	lid_mat.albedo_color = lid_col.darkened(0.3)
	lid_mat.roughness = 0.9
	var lid: MeshInstance3D = MeshInstance3D.new()
	var lm: BoxMesh = BoxMesh.new()
	lm.size = Vector3(0.38, 0.06, 0.58)
	lid.mesh = lm
	lid.material_override = lid_mat
	lid.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	lid.position = Vector3(0.95, 0.33, ice_z)
	root.add_child(lid)






	var towel_mat: StandardMaterial3D = StandardMaterial3D.new()
	towel_mat.albedo_color = Color("eceff3")
	towel_mat.roughness = 1.0


	var towel_side: float = - signf(float(root.get_meta("bot_side", -1.0)))
	if towel_side == 0.0:
		towel_side = 1.0
	var towel_mesh: BoxMesh = BoxMesh.new()


	towel_mesh.size = Vector3(0.3, 0.09, 0.4)
	for i in 2:
		var towel: MeshInstance3D = MeshInstance3D.new()
		towel.mesh = towel_mesh
		towel.material_override = towel_mat
		towel.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		towel.position = Vector3(0.44 + rng.randf_range(-0.03, 0.03),
			BENCH_TOP_Y + 0.045,
			towel_side *(dlen * 0.5 - 1.35 - float(i) * rng.randf_range(0.5, 0.75)))
		towel.rotation.y = rng.randf_range(-0.12, 0.12)
		root.add_child(towel)


func _paint_line(root: Node3D, pos: Vector3, size: Vector3, mat: StandardMaterial3D) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	m.mesh = box
	m.material_override = mat
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	m.position = pos
	root.add_child(m)




func _spawn_coach(root: Node3D, is_home: bool, half_len: float) -> void:



	if venue_empty:
		return
	await _respira()
	var frames: SpriteFrames = await _coach_frames(is_home)
	if frames == null:
		return
	var coach: AnimatedSprite3D = AnimatedSprite3D.new()
	coach.sprite_frames = frames



	coach.pixel_size = COACH_HEIGHT / PERSON_BODY_PX
	coach.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	coach.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	coach.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



	coach.position = Vector3(COACH_X, _person_feet(coach.pixel_size, COACH_SHEET), 0.0)
	root.add_child(coach)
	_register_dugout_person(coach, root.position, is_home, "coach", true)
	coach.play("idle")
	_coaches.append({
		"node": coach,
		"home": is_home,


		"y0": coach.position.y,
		"range": half_len - 1.2,
		"dir": 1.0 if is_home else -1.0,
		"wait": 0.0,
		"react": 0.0,
		"hold": 0.0,
		"snap": false,
		"celeb": false,
		"gesto": "",





		"placa": PlacaNombre.cuelga(coach, _coach_nombre(is_home), false,
			is_home != _is_home_ground(), _coach_nivel(is_home)),
	})














func _coach_frames(is_home: bool) -> SpriteFrames:
	var idx: int = 0 if is_home else 1
	if _coach_frames_cache[idx] != null:
		return _coach_frames_cache[idx]












	var local: String = _club_local()
	var who: String = ""
	if _comp == "nat":






		if is_home == _is_home_ground():
			who = Career.nat_coach_face()
	else:









		var club_dt: String = _coach_club_dt(is_home, local)
		if not club_dt.is_empty():
			who = Coaches.face_of(club_dt)
	if who.is_empty():
		who = local +("_dt_h" if is_home else "_dt_a")

	var look_dt: Dictionary = Coach.look_de(who)
	await _respira()













	var rutas: Array = _person_rutas(COACH_SHEET, PERSON_FRAMES, 0)
	var imgs: Array[Texture2D] = []
	for path: String in rutas:
		imgs.append(KitRecolor.apply(load(path), look_dt))
		await _respira()
	var frames: SpriteFrames = _person_arma(imgs, rutas, look_dt)
	if frames != null and dugout_views:
		for dir: String in PERSON_DIRS:
			_person_vista(frames, look_dt, COACH_SHEET, dir)
			await _respira()











	if frames != null:






		await _add_coach_walk(frames, look_dt)
		await _respira()

		await _add_coach_celeb(frames, look_dt)
		await _respira()

		await _add_coach_gestos(frames, look_dt)
	_coach_frames_cache[idx] = frames
	return frames







func _coach_club_dt(is_home: bool, local: String) -> String:
	var rival: String = String(GameState.current_rival().get("id", ""))
	return local if is_home \
			else (GameState.player_team_id if local != GameState.player_team_id else rival)







func _coach_nombre(is_home: bool) -> String:
	if _comp == "nat":
		return Career.nat_coach_name() if is_home == _is_home_ground() else ""
	var club_dt: String = _coach_club_dt(is_home, _club_local())
	return Coaches.name_of(club_dt) if not club_dt.is_empty() else ""







func _coach_nivel(is_home: bool) -> int:
	if _comp == "nat":
		return Career.nat_coach_nivel() if is_home == _is_home_ground() else -1
	var club_dt: String = _coach_club_dt(is_home, _club_local())
	return Coaches.nivel_of(club_dt) if not club_dt.is_empty() else -1






func coach_placa(is_home: bool, on: bool) -> void:
	for c in _coaches:
		if bool(c["home"]) != is_home:
			continue
		var placa: PlacaNombre = c.get("placa", null)
		if placa != null and is_instance_valid(placa):
			placa.visible = on



func coach_placas(on: bool) -> void:
	coach_placa(true, on)
	coach_placa(false, on)






const COACH_WALK_SHEET: String = "res://assets/sprites/anim/coach_walk_south_"










const COACH_WALK_NORTH_SHEET: String = "res://assets/sprites/anim/coach_walk_north_"




const COACH_WALK_FRAMES: int = 7



const COACH_WALK_FPS: float = 9.0
func _add_coach_walk(frames: SpriteFrames, cfg: Dictionary) -> void:
	for dir: String in ["south", "north"]:
		var hoja: String = COACH_WALK_SHEET if dir == "south" else COACH_WALK_NORTH_SHEET
		var imgs: Array[Texture2D] = []
		var falta: bool = false
		for i in range(1, COACH_WALK_FRAMES + 1):
			var path: String = "%s%02d.png" % [hoja, i]
			if not ResourceLoader.exists(path):
				falta = true
				break
			imgs.append(KitRecolor.apply(load(path), cfg))
			await _respira()
		if falta:
			continue
		var anim: String = "walk_" + dir
		frames.add_animation(anim)
		frames.set_animation_loop(anim, true)
		frames.set_animation_speed(anim, COACH_WALK_FPS)
		for tex in imgs:
			frames.add_frame(anim, tex)
		_apunta_cara(frames, anim, range(1, COACH_WALK_FRAMES + 1).map(
			func(i: int) -> String: return "%s%02d.png" % [hoja, i]), cfg)
















const COACH_CELEB_SHEET: String = "res://assets/sprites/anim/coach_festeja_south_"
const COACH_CELEB_ANIM: String = "festeja"
const COACH_CELEB_FRAMES: int = 6

const COACH_CELEB_FPS: float = 8.0
func _add_coach_celeb(frames: SpriteFrames, cfg: Dictionary) -> void:
	var imgs: Array[Texture2D] = []
	for i in range(1, COACH_CELEB_FRAMES + 1):
		var path: String = "%s%02d.png" % [COACH_CELEB_SHEET, i]
		if not ResourceLoader.exists(path):
			return
		imgs.append(KitRecolor.apply(load(path), cfg))
		await _respira()
	frames.add_animation(COACH_CELEB_ANIM)
	frames.set_animation_loop(COACH_CELEB_ANIM, true)
	frames.set_animation_speed(COACH_CELEB_ANIM, COACH_CELEB_FPS)
	for tex in imgs:
		frames.add_frame(COACH_CELEB_ANIM, tex)
	_apunta_cara(frames, COACH_CELEB_ANIM, range(1, COACH_CELEB_FRAMES + 1).map(
		func(i: int) -> String: return "%s%02d.png" % [COACH_CELEB_SHEET, i]), cfg)

















static func dir_name_towards(dir: Vector3, cam: Camera3D) -> String:
	var flat: Vector2 = Vector2(dir.x, dir.z)
	if flat.length_squared() < 0.0001 or cam == null:
		return "south"
	var basis: Basis = cam.global_transform.basis
	var right: Vector2 = Vector2(basis.x.x, basis.x.z).normalized()
	var into: Vector2 = Vector2(- basis.z.x, - basis.z.z).normalized()
	if right.length_squared() < 0.0001 or into.length_squared() < 0.0001:
		return "south"
	var lateral: float = flat.dot(right)
	var depth: float = flat.dot(into)


	if absf(depth) * 1.2 >= absf(lateral):
		return "north" if depth > 0.0 else "south"
	return "east" if lateral > 0.0 else "west"









func _coach_walk_anim(spr: AnimatedSprite3D, mundo: Vector3) -> String:
	if spr == null or spr.sprite_frames == null:
		return ""
	var cam: Camera3D = null
	if spr.is_inside_tree():
		cam = SceneFade.camara_de(spr)
	var quiere: String = "walk_" + dir_name_towards(mundo, cam)
	if quiere == "walk_east" or quiere == "walk_west":
		quiere = "walk_south"
	if spr.sprite_frames.has_animation(quiere):
		return quiere
	if spr.sprite_frames.has_animation("walk_south"):
		return "walk_south"
	return ""


const COACH_SPEED: float = 1.1
const COACH_PAUSE: float = 1.6








const COACH_X: float = 2.7
const COACH_X_SWAY: float = 0.3















const COACH_STEP_LEN: float = 0.62
const COACH_BOB: float = 0.045
const COACH_LEAN: float = 1.6



const COACH_REACT_DUR: float = 2.6



const COACH_TENSION_X: float = 0.55

var _coaches: Array[Dictionary] = []
var _coach_frames_cache: Array[SpriteFrames] = [null, null]





func _coach_react(home_anim: String, away_anim: String) -> void:
	for c in _coaches:






		if float(c["hold"]) > 0.0 or not String(c.get("gesto", "")).is_empty() \
				or bool(c.get("mano", false)):
			continue
		var anim: String = home_anim if bool(c["home"]) else away_anim
		var coach: AnimatedSprite3D = c["node"]
		if not coach.sprite_frames.has_animation(anim):
			continue
		c["react"] = COACH_REACT_DUR
		c["wait"] = 0.0
		coach.play(anim)

		coach_cara(coach, "grito" if anim == "cheer" else "lamento", COACH_REACT_DUR)


		coach.speed_scale = 1.9 if anim == "cheer" else 0.8





func dugout_focus(is_home: bool = true) -> Vector3:
	var z: float = HALF_LINE - DUGOUT_OFFSET_Z if is_home \
			else HALF_LINE + DUGOUT_OFFSET_Z
	return Vector3(_dugout_x() + COACH_X, 1.25, z)

















func dugout_wait_spot(is_home: bool = true) -> Vector3:
	var dlen: float = float(_dugout_cfg()["len"])


	var out: float = dlen * 0.5 + 0.9
	var z: float = HALF_LINE - DUGOUT_OFFSET_Z + out if is_home \
			else HALF_LINE + DUGOUT_OFFSET_Z - out
	return Vector3(_dugout_x() + SUB_STAND_X, 0.0, z)












func hold_coaches(seconds: float, snap_center: bool = false) -> void:
	for c in _coaches:
		c["hold"] = maxf(float(c["hold"]), seconds)
		c["react"] = 0.0




		if not String(c.get("gesto", "")).is_empty():
			c["gesto"] = ""
			c["g_vuelve"] = false
			(c["node"] as AnimatedSprite3D).position.y = float(c["y0"])
			(c["node"] as AnimatedSprite3D).rotation_degrees.z = 0.0





		c["snap"] = snap_center
		var coach: AnimatedSprite3D = c["node"]
		if snap_center:
			coach.position.z = 0.0
			coach.flip_h = false
		coach.play("idle")
		coach.speed_scale = 1.0







func coach_aparta(is_home: bool, de: Vector3) -> void:
	for c in _coaches:
		if bool(c["home"]) != is_home:
			continue
		var coach: AnimatedSprite3D = c["node"]
		if not is_instance_valid(coach) or coach.get_parent() == null:
			continue
		var lz: float =(coach.get_parent() as Node3D).to_local(de).z
		var r: float = maxf(float(c["range"]), 0.0)
		coach.position.z = - r if lz >= 0.0 else r





func coach_node(is_home: bool = true) -> AnimatedSprite3D:
	for c in _coaches:
		if bool(c["home"]) == is_home and is_instance_valid(c["node"]):
			return c["node"]
	return null

















func coach_celebrate(is_home: bool, seconds: float) -> Vector3:
	for c in _coaches:
		if bool(c["home"]) != is_home:
			continue
		var coach: AnimatedSprite3D = c["node"]
		if not is_instance_valid(coach):
			continue
		c["hold"] = maxf(float(c["hold"]), seconds)
		c["react"] = 0.0
		c["snap"] = true
		c["celeb"] = true
		c["gesto"] = ""
		c["g_vuelve"] = false


		coach.position = Vector3(COACH_X, float(c["y0"]), 0.0)
		coach.rotation_degrees.z = 0.0
		coach.flip_h = false
		coach.speed_scale = 1.0
		coach.play(COACH_CELEB_ANIM if coach.sprite_frames.has_animation(COACH_CELEB_ANIM)
			else "idle")
		coach_cara(coach, "grito", seconds)
		return coach.global_position
	return dugout_focus(is_home)




func coach_celebrate_end() -> void:
	for c in _coaches:
		if not bool(c.get("celeb", false)):
			continue
		c["celeb"] = false
		c["hold"] = 0.0
		c["snap"] = false

		c["wait"] = COACH_PAUSE * 0.5
		var coach: AnimatedSprite3D = c["node"]
		if is_instance_valid(coach):
			coach.play(_coach_idle_anim(coach))
			coach.speed_scale = 1.0






















const GESTO_FESTEJA: String = "festeja"
const GESTO_BOTE: String = "bote"
const GESTO_PISOTON: String = "pisoton"
const GESTO_PROTESTA: String = "protesta"
const GESTO_LAMENTO: String = "lamento"
const GESTO_APLAUDE: String = "aplaude"
const GESTO_BRAZOS: String = "brazos"
const GESTO_SENALA: String = "senala"
const GESTO_ESPALDAS: String = "espaldas"
const GESTO_ENOJO: String = "enojo"
const GESTO_SE_VA: String = "se_va"















const COACH_GESTO_ARTE: Dictionary = {
	"protesta": 7.0, "lamento": 6.0, "aplaude": 6.0, "brazos": 5.0, "senala": 8.0,
	"enojo": 10.0, "enojo2": 10.0,
}

const COACH_GESTO_VARIANTES: Dictionary = {"enojo": ["enojo", "enojo2"]}





const COACH_GESTO_CARA: Dictionary = {
	"protesta": "protesta", "lamento": "lamento", "aplaude": "reir", "brazos": "muerde",
	"senala": "protesta", "enojo": "protesta", "enojo2": "protesta",
}
const COACH_GESTO_MIN: int = 2
const COACH_GESTO_MAX: int = 12






const COACH_BALON_ARTE: Dictionary = {"pecho": 9.0, "toque": 9.0, "pase": 9.0}



const GESTO_BOTE_H: float = 0.1
const GESTO_BOTE_HZ: float = 2.4
const GESTO_BOTE_DUR: float = 1.2



const GESTO_PISA_T0: float = 0.35
const GESTO_PISA_H: float = 0.07
const GESTO_PISA_SUBE: float = 0.16
const GESTO_PISA_CAE: float = 0.06
const GESTO_PISA_TIEMBLA: float = 0.5
const GESTO_PISA_GRADOS: float = 1.6



const GESTO_PROTESTA_X: float = 0.9
const GESTO_PROTESTA_PASO: float = 0.45
const GESTO_PROTESTA_HZ: float = 3.2
const GESTO_PROTESTA_GRADOS: float = 2.4



const GESTO_ESPALDAS_DIST: float = 0.7


const GESTO_SE_VA_DIST: float = 1.6
const GESTO_SE_VA_VEL: float = 0.95













func coach_gesture(is_home: bool, gesto: String, seconds: float,
		espaldas: bool = false) -> Vector3:
	for c in _coaches:
		if bool(c["home"]) != is_home:
			continue
		var coach: AnimatedSprite3D = c["node"]


		if not is_instance_valid(coach) or bool(c.get("celeb", false)) \
				or _dugout_down(coach):
			return coach_spot(is_home)
		c["gesto"] = gesto
		c["g_t"] = 0.0
		c["g_dur"] = maxf(seconds, 0.1)
		c["g_esp"] = espaldas
		c["g_vuelve"] = false


		c["g_cuerpo"] = _gesto_cuerpo(coach, gesto)
		c["react"] = 0.0
		c["wait"] = 0.0
		coach.position = Vector3(COACH_X, float(c["y0"]), 0.0)
		coach.rotation_degrees.z = 0.0
		coach.flip_h = false
		coach.speed_scale = 1.0
		coach.play(_gesto_anim(coach, gesto, espaldas))
		if not espaldas and COACH_GESTO_CARA.has(gesto):
			coach_cara(coach, String(COACH_GESTO_CARA[gesto]), c["g_dur"])
		return coach.global_position
	return dugout_focus(is_home)





func coach_gesture_end() -> void:
	for c in _coaches:
		if String(c.get("gesto", "")).is_empty():
			continue
		_gesto_suelta(c)





func coach_balon_nodo(is_home: bool) -> AnimatedSprite3D:
	for c in _coaches:
		if bool(c["home"]) != is_home:
			continue
		var coach: AnimatedSprite3D = c["node"]
		if not is_instance_valid(coach) or coach.sprite_frames == null \
				or bool(c.get("celeb", false)) or _dugout_down(coach):
			return null
		for parte: String in COACH_BALON_ARTE:
			if not coach.sprite_frames.has_animation("balon_" + parte):
				return null
		return coach
	return null






func coach_balon_empieza(is_home: bool, seconds: float) -> AnimatedSprite3D:
	var coach: AnimatedSprite3D = coach_balon_nodo(is_home)
	if coach == null:
		return null
	for c in _coaches:
		if c["node"] != coach:
			continue
		c["gesto"] = "balon"
		c["g_t"] = 0.0
		c["g_dur"] = maxf(seconds, 0.1)
		c["g_esp"] = false
		c["g_vuelve"] = false
		c["g_cuerpo"] = ""
		c["react"] = 0.0
		c["wait"] = 0.0
		coach.position = Vector3(COACH_X, float(c["y0"]), 0.0)
		coach.rotation_degrees.z = 0.0
		coach.flip_h = false
		coach.speed_scale = 1.0
		coach_balon_cuadro(coach, "pecho", 0)
	return coach




func coach_balon_suelta(coach: AnimatedSprite3D) -> void:
	for c in _coaches:
		if c["node"] == coach and String(c.get("gesto", "")) == "balon":
			_gesto_suelta(c)



func coach_balon_cuadro(coach: AnimatedSprite3D, parte: String, i: int) -> void:
	if not is_instance_valid(coach):
		return
	var anim: String = "balon_" + parte
	if coach.animation != anim:
		coach.play(anim)
		coach.pause()
	coach.frame = clampi(i, 0, coach.sprite_frames.get_frame_count(anim) - 1)























const MANO_SEP: float = 1.34

const MANO_CUADROS: int = 6
const MANO_FPS: float = 7.5



const MANO_ANDAR_FRAC: float = 0.5
const MANO_ANDAR_CUADROS: int = 8


const MANO_ANDAR_RITMO: float = 1.25
const MANO_LLEGADA: float = 1.1

var _mano_ref4_estaba: bool = false
const MANO_GRADOS: float = 6.0
const MANO_ENCOGE: float = 0.03
const MANO_TEMBLOR: float = 0.012
const MANO_EMPUJE: float = 0.06
const MANO_RETRAE: float = 0.12
const MANO_TIRON: float = 0.08
const MANO_PASO_ATRAS: float = 0.32
const MANO_SACUDE_HZ: float = 7.0







func coach_handshake(mio_home: bool) -> Vector3:
	var centro: Vector3 = Vector3(_dugout_x() + COACH_X, 0.0, HALF_LINE)



	_mano_ref4_estaba = false
	if _sub_board != null and is_instance_valid(_sub_board):
		var ref4: Node3D = _sub_board.get_parent() as Node3D
		if ref4 != null and is_instance_valid(ref4) and ref4.visible:
			_mano_ref4_estaba = true
			ref4.visible = false
	for c in _coaches:
		var coach: AnimatedSprite3D = c["node"]
		if not is_instance_valid(coach) or _dugout_down(coach):
			continue
		if not String(c.get("gesto", "")).is_empty():
			_gesto_suelta(c)
		c["mano"] = true
		c["react"] = 0.0
		c["hold"] = 0.0
		c["celeb"] = false
		var mio: bool = bool(c["home"]) == mio_home
		var lado: float = 1.0 if mio else -1.0
		c["mano_lado"] = lado
		c["mano_z0"] = centro.z + lado * MANO_SEP * 0.5
		coach.billboard = BaseMaterial3D.BILLBOARD_DISABLED
		coach.rotation_degrees = Vector3(0.0, 90.0, 0.0)
		coach.scale = Vector3.ONE
		coach.flip_h = false
		coach.speed_scale = 1.0
		c["mano_suelta"] = false
		c["mano_brazo"] = false
		var anda: String = "walk_east" if mio else "walk_west"
		if coach.sprite_frames.has_animation(anda):
			coach.speed_scale = MANO_ANDAR_RITMO
			coach.play(anda)
		else:

			var perfil: String = "mano_este" if mio else "mano_oeste"
			if coach.sprite_frames.has_animation(perfil):
				coach.frame = 0
				coach.play(perfil)
			else:
				coach.play(_coach_idle_anim(coach))
		var gp: Vector3 = coach.global_position
		coach.global_position = Vector3(centro.x, gp.y, float(c["mano_z0"]) + lado * MANO_LLEGADA)
		centro.y = gp.y
	return centro






func coach_handshake_llegan(k: float) -> void:
	var kk: float = clampf(k, 0.0, 1.0)
	var ka: float = clampf(kk / MANO_ANDAR_FRAC, 0.0, 1.0)
	for c in _coaches:
		if not bool(c.get("mano", false)):
			continue
		var coach: AnimatedSprite3D = c["node"]
		if not is_instance_valid(coach):
			continue
		var lado: float = float(c["mano_lado"])
		var mio: bool = lado > 0.0
		var andando: bool = coach.sprite_frames.has_animation("walk_east" if mio else "walk_west")
		var avance: float = ka if andando else 1.0 - pow(1.0 - ka, 2.0)
		var z: float = float(c["mano_z0"]) + lado * MANO_LLEGADA *(1.0 - avance)
		var bote: float = 0.0
		if not andando:
			bote = absf(sin(ka * PI * 3.0)) * GESTO_BOTE_H * 0.4 *(1.0 - avance)
		var gp: Vector3 = coach.global_position
		coach.global_position = Vector3(gp.x, gp.y, z)
		coach.position.y = float(c["y0"]) + bote
		if ka >= 1.0 and not bool(c.get("mano_brazo", false)):
			c["mano_brazo"] = true
			coach.speed_scale = 1.0
			var perfil: String = "mano_este" if mio else "mano_oeste"
			if coach.sprite_frames.has_animation(perfil):
				coach.frame = 0
				coach.play(perfil)
			elif andando:
				coach.play(_coach_idle_anim(coach))












func coach_handshake_pose(barra01: float, tension: float, aviso: bool, tiron: bool,
		t: float) -> void:
	var b: float = clampf(barra01, -1.0, 1.0)
	for c in _coaches:
		if not bool(c.get("mano", false)):
			continue
		var coach: AnimatedSprite3D = c["node"]
		if not is_instance_valid(coach):
			continue
		var lado: float = float(c["mano_lado"])
		var mio: bool = lado > 0.0


		var grados: float = - MANO_GRADOS * b
		var encoge: float = MANO_ENCOGE * clampf(- b if mio else b, 0.0, 1.0)
		var z: float = float(c["mano_z0"]) - MANO_EMPUJE * b
		if not mio:
			if tiron:
				z -= MANO_TIRON * lado
				grados += MANO_GRADOS * 0.6
			elif aviso:
				z += MANO_RETRAE * lado
				grados -= MANO_GRADOS * 0.4
		var temblor: float = MANO_TEMBLOR * tension
		z += sin(t * 71.0 + lado * 1.3) * temblor
		var y: float = float(c["y0"]) + absf(sin(t * 53.0)) * temblor * 0.5
		var gp: Vector3 = coach.global_position
		coach.global_position = Vector3(gp.x, gp.y, z)
		coach.position.y = y
		coach.rotation_degrees = Vector3(0.0, 90.0, grados)
		coach.scale = Vector3(1.0, 1.0 - encoge, 1.0)






func coach_handshake_suelta(ver: int, k: float) -> void:
	var kk: float = clampf(k, 0.0, 1.0)
	var ease_k: float = 1.0 - pow(1.0 - kk, 2.0)
	for c in _coaches:
		if not bool(c.get("mano", false)):
			continue
		var coach: AnimatedSprite3D = c["node"]
		if not is_instance_valid(coach):
			continue
		var lado: float = float(c["mano_lado"])
		var mio: bool = lado > 0.0
		var pierde: bool =(ver < 0 and mio) or (ver > 0 and not mio)


		if not bool(c.get("mano_suelta", false)):
			c["mano_suelta"] = true
			var perfil: String = "mano_este" if mio else "mano_oeste"
			if coach.sprite_frames.has_animation(perfil) \
					and coach.sprite_frames.get_frame_count(perfil) > 1:
				coach.play_backwards(perfil)
		var paso: float = MANO_PASO_ATRAS if pierde else (MANO_PASO_ATRAS * 0.4 if ver == 0 else 0.0)
		var z: float = float(c["mano_z0"]) + lado * paso * ease_k
		var sacude: float = 0.0
		if pierde:
			sacude = absf(sin(kk * TAU * MANO_SACUDE_HZ)) * GESTO_BOTE_H * 0.35 *(1.0 - kk)
		var gp: Vector3 = coach.global_position
		coach.global_position = Vector3(gp.x, gp.y, z)
		coach.position.y = float(c["y0"]) + sacude
		var grados: float = 0.0
		if pierde:
			grados = lado * MANO_GRADOS * 0.5 *(1.0 - ease_k)
		coach.rotation_degrees = Vector3(0.0, 90.0, grados)
		coach.scale = Vector3.ONE




func coach_handshake_end() -> void:
	if _mano_ref4_estaba and _sub_board != null and is_instance_valid(_sub_board):
		var ref4: Node3D = _sub_board.get_parent() as Node3D
		if ref4 != null and is_instance_valid(ref4):
			ref4.visible = true
	_mano_ref4_estaba = false
	for c in _coaches:
		if not bool(c.get("mano", false)):
			continue
		c["mano"] = false
		var coach: AnimatedSprite3D = c["node"]
		if not is_instance_valid(coach):
			continue
		coach.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		coach.rotation_degrees = Vector3.ZERO
		coach.scale = Vector3.ONE
		coach.position = Vector3(COACH_X, float(c["y0"]), 0.0)
		coach.speed_scale = 1.0
		coach.play(_coach_idle_anim(coach))
		c["wait"] = COACH_PAUSE * 0.5




func coach_handshaking() -> bool:
	for c in _coaches:
		if bool(c.get("mano", false)):
			return true
	return false



func _dugout_down(node: Node3D) -> bool:
	for e in _dugout_people:
		if e["node"] == node:
			return bool(e["down"])
	return false



func coach_gesturing(is_home: bool) -> bool:
	for c in _coaches:
		if bool(c["home"]) == is_home:
			return not String(c.get("gesto", "")).is_empty()
	return false




func _gesto_anim(coach: AnimatedSprite3D, gesto: String, espaldas: bool) -> String:
	var sf: SpriteFrames = coach.sprite_frames
	if sf == null:
		return "idle"


	if (gesto == GESTO_SE_VA or gesto == GESTO_ESPALDAS) and sf.has_animation("espaldas"):
		return "walk_north" if sf.has_animation("walk_north") else "espaldas"
	if espaldas or gesto == GESTO_ESPALDAS:
		return "espaldas" if sf.has_animation("espaldas") else "idle"
	var arte: String = COACH_CELEB_ANIM if gesto == GESTO_FESTEJA else gesto

	if COACH_GESTO_VARIANTES.has(gesto):
		var hay: Array[String] = []
		for v: String in COACH_GESTO_VARIANTES[gesto]:
			if sf.has_animation(v):
				hay.append(v)
		if not hay.is_empty():
			return hay[randi() % hay.size()]
	if sf.has_animation(arte):
		return arte
	return "idle"





func _gesto_cuerpo(coach: AnimatedSprite3D, gesto: String) -> String:
	var sf: SpriteFrames = coach.sprite_frames
	var tiene_espaldas: bool = sf != null and sf.has_animation("espaldas")
	match gesto:
		GESTO_FESTEJA:
			return "" if sf != null and sf.has_animation(COACH_CELEB_ANIM) else GESTO_BOTE
		GESTO_PROTESTA, GESTO_SENALA:


			return GESTO_PROTESTA
		GESTO_LAMENTO:
			if sf != null and sf.has_animation(GESTO_LAMENTO):
				return ""
			return GESTO_ESPALDAS if tiene_espaldas else GESTO_PISOTON
		GESTO_APLAUDE:
			return "" if sf != null and sf.has_animation(GESTO_APLAUDE) else GESTO_APLAUDE
		GESTO_ESPALDAS:

			return GESTO_ESPALDAS if tiene_espaldas else GESTO_PISOTON
		GESTO_SE_VA:


			return GESTO_SE_VA if tiene_espaldas and sf.has_animation("walk_north") \
					else GESTO_PISOTON
		GESTO_ENOJO:
			return "" if sf != null and sf.has_animation(GESTO_ENOJO) else GESTO_PISOTON
		GESTO_BRAZOS:


			return "" if sf != null and sf.has_animation(GESTO_BRAZOS) else GESTO_PISOTON
	return gesto



func _tick_coach_gesto(c: Dictionary, amb: float) -> bool:
	var coach: AnimatedSprite3D = c["node"]
	if not is_instance_valid(coach):
		c["gesto"] = ""
		return true


	if float(c["hold"]) > 0.0:
		c["hold"] = maxf(0.0, float(c["hold"]) - amb)
	var t: float = float(c["g_t"]) + amb
	c["g_t"] = t
	var y0: float = float(c["y0"])


	if bool(c.get("g_vuelve", false)):
		var destino: float = COACH_X + sin(coach.position.z * 0.9) * COACH_X_SWAY \
				+ _excite * COACH_TENSION_X
		var dx: float = destino - coach.position.x
		if absf(dx) <= COACH_SPEED * amb + 0.01:
			coach.position.x = destino
			_gesto_suelta(c)
			return true
		coach.position.x += signf(dx) * COACH_SPEED * amb
		var padre: Node = coach.get_parent()
		var eje: Vector3 =(padre as Node3D).global_transform.basis.x \
				if padre is Node3D else Vector3(1.0, 0.0, 0.0)
		var lamina: String = _coach_walk_anim(coach, eje * signf(dx))
		if not lamina.is_empty() and coach.animation != lamina:
			coach.play(lamina)
		return false
	if t >= float(c["g_dur"]):



		coach.position.y = y0
		coach.rotation_degrees.z = 0.0
		if absf(coach.position.x - COACH_X) > 0.05 and String(c["gesto"]) != GESTO_SE_VA:
			c["g_vuelve"] = true
			return false
		_gesto_suelta(c)
		return true
	var gesto: String = String(c["gesto"])
	var cuerpo: String = String(c.get("g_cuerpo", ""))
	var y: float = y0
	var rot: float = 0.0
	match cuerpo:
		GESTO_BOTE, GESTO_APLAUDE:

			var h: float = GESTO_BOTE_H *(0.45 if cuerpo == GESTO_APLAUDE else 1.0)
			var hz: float = GESTO_BOTE_HZ *(1.35 if cuerpo == GESTO_APLAUDE else 1.0)
			if t < GESTO_BOTE_DUR:
				y = y0 + absf(sin(t * hz * PI)) * h
		GESTO_PISOTON:
			var s: float = t - GESTO_PISA_T0
			if s >= 0.0:
				if s < GESTO_PISA_SUBE:
					y = y0 + GESTO_PISA_H * sin(s / GESTO_PISA_SUBE * PI * 0.5)
				elif s < GESTO_PISA_SUBE + GESTO_PISA_CAE:
					y = y0 + GESTO_PISA_H *(1.0 -(s - GESTO_PISA_SUBE) / GESTO_PISA_CAE)
				else:
					var q: float = s - GESTO_PISA_SUBE - GESTO_PISA_CAE
					if q < GESTO_PISA_TIEMBLA:
						rot = sin(q * 55.0) * GESTO_PISA_GRADOS \
								*(1.0 - q / GESTO_PISA_TIEMBLA)
		GESTO_PROTESTA:



			if t < GESTO_PROTESTA_PASO:
				var k: float = t / GESTO_PROTESTA_PASO
				coach.position.x = COACH_X + GESTO_PROTESTA_X *(1.0 - pow(1.0 - k, 2.0))
				if coach.sprite_frames.has_animation("walk_south") \
						and coach.animation != "walk_south":
					coach.play("walk_south")
			else:
				coach.position.x = COACH_X + GESTO_PROTESTA_X
				var quiere: String = _gesto_anim(coach, gesto, false)
				if coach.animation != quiere:
					coach.play(quiere)


				if quiere == "idle":
					var q2: float = t - GESTO_PROTESTA_PASO
					rot = sin(q2 * TAU * GESTO_PROTESTA_HZ) * GESTO_PROTESTA_GRADOS \
							* clampf(1.4 - q2, 0.0, 1.0)
					y = y0 + absf(sin(q2 * TAU * GESTO_PROTESTA_HZ)) * 0.02 \
							* clampf(1.4 - q2, 0.0, 1.0)
		GESTO_SE_VA, GESTO_ESPALDAS:



			var dist: float = GESTO_SE_VA_DIST if cuerpo == GESTO_SE_VA \
					else GESTO_ESPALDAS_DIST
			var andado: float = minf(t * GESTO_SE_VA_VEL, dist)
			coach.position.x = COACH_X - andado
			if andado < dist:
				if coach.sprite_frames.has_animation("walk_north") \
						and coach.animation != "walk_north":
					coach.play("walk_north")
			else:
				var quieto: String = "espaldas" \
						if coach.sprite_frames.has_animation("espaldas") else "idle"
				if coach.animation != quieto:
					coach.play(quieto)
	coach.position.y = y
	coach.rotation_degrees.z = rot
	return false




func _gesto_suelta(c: Dictionary) -> void:
	c["gesto"] = ""
	c["g_vuelve"] = false
	var coach: AnimatedSprite3D = c["node"]
	if not is_instance_valid(coach):
		return
	coach.position.y = float(c["y0"])
	coach.rotation_degrees.z = 0.0
	coach.speed_scale = 1.0
	coach.play(_coach_idle_anim(coach))

	var cara: CaraEncima = CaraEncima.de(coach)
	if cara != null:
		cara.quita()
	if float(c["hold"]) <= 0.0:
		c["wait"] = COACH_PAUSE * 0.5






func _add_coach_gestos(frames: SpriteFrames, cfg: Dictionary) -> void:
	var raiz: String = COACH_SHEET.trim_suffix("south_")
	var espalda: String = "%snorth_00.png" % raiz
	if not frames.has_animation("espaldas") and ResourceLoader.exists(espalda):
		frames.add_animation("espaldas")
		frames.set_animation_loop("espaldas", true)
		frames.set_animation_speed("espaldas", 4.5)
		frames.add_frame("espaldas", KitRecolor.apply(load(espalda), cfg))
		await _respira()







	for perfil in [["mano_este", "east"], ["mano_oeste", "west"]]:
		var nombre: String = String(perfil[0])


		var anda: String = "walk_" + String(perfil[1])
		if not frames.has_animation(anda):
			var imgs_anda: Array[Texture2D] = []
			for i in range(1, MANO_ANDAR_CUADROS + 1):
				var ruta_anda: String = "%swalk_%s_%02d.png" % [raiz, String(perfil[1]), i]
				if not ResourceLoader.exists(ruta_anda):
					break
				imgs_anda.append(KitRecolor.apply(load(ruta_anda), cfg))
				await _respira()
			if imgs_anda.size() == MANO_ANDAR_CUADROS:
				frames.add_animation(anda)
				frames.set_animation_loop(anda, true)
				frames.set_animation_speed(anda, COACH_WALK_FPS)
				for tex in imgs_anda:
					frames.add_frame(anda, tex)
				_apunta_cara(frames, anda, range(1, MANO_ANDAR_CUADROS + 1).map(
					func(i: int) -> String: return "%swalk_%s_%02d.png" % [raiz, String(perfil[1]), i]), cfg)
		if frames.has_animation(nombre):
			continue
		var imgs_mano: Array[Texture2D] = []
		var rutas_mano: Array = []
		for i in range(1, MANO_CUADROS + 1):
			var ruta: String = "%smano_%s_%02d.png" % [raiz, String(perfil[1]), i]
			if not ResourceLoader.exists(ruta):
				break
			imgs_mano.append(KitRecolor.apply(load(ruta), cfg))
			await _respira()
			rutas_mano.append(ruta)
		if imgs_mano.is_empty():
			var quieto: String = "%s%s_00.png" % [raiz, String(perfil[1])]
			if not ResourceLoader.exists(quieto):
				continue
			imgs_mano.append(KitRecolor.apply(load(quieto), cfg))
			await _respira()
			rutas_mano.append(quieto)
		frames.add_animation(nombre)
		frames.set_animation_loop(nombre, false)
		frames.set_animation_speed(nombre, MANO_FPS)
		for tex in imgs_mano:
			frames.add_frame(nombre, tex)
		_apunta_cara(frames, nombre, rutas_mano, cfg)
	for gesto: String in COACH_GESTO_ARTE:
		if frames.has_animation(gesto):
			continue
		var imgs: Array[Texture2D] = []
		var rutas: Array = []
		for i in range(1, COACH_GESTO_MAX + 1):
			var path: String = "%s%s_south_%02d.png" % [raiz, gesto, i]
			if not ResourceLoader.exists(path):
				break
			imgs.append(KitRecolor.apply(load(path), cfg))
			await _respira()
			rutas.append(path)
		if imgs.size() < COACH_GESTO_MIN:
			continue
		frames.add_animation(gesto)
		frames.set_animation_loop(gesto, true)
		frames.set_animation_speed(gesto, float(COACH_GESTO_ARTE[gesto]))
		for tex in imgs:
			frames.add_frame(gesto, tex)
		_apunta_cara(frames, gesto, rutas, cfg)



	for parte: String in COACH_BALON_ARTE:
		var nombre_b: String = "balon_" + parte
		if frames.has_animation(nombre_b):
			continue
		var imgs_b: Array[Texture2D] = []
		var rutas_b: Array = []
		for i in range(1, COACH_GESTO_MAX + 1):
			var ruta_b: String = "%s%s_south_%02d.png" % [raiz, parte, i]
			if not ResourceLoader.exists(ruta_b):
				break
			imgs_b.append(KitRecolor.apply(load(ruta_b), cfg))
			await _respira()
			rutas_b.append(ruta_b)
		if imgs_b.size() < COACH_GESTO_MIN:
			continue
		frames.add_animation(nombre_b)
		frames.set_animation_loop(nombre_b, false)
		frames.set_animation_speed(nombre_b, float(COACH_BALON_ARTE[parte]))
		for tex in imgs_b:
			frames.add_frame(nombre_b, tex)
		_apunta_cara(frames, nombre_b, rutas_b, cfg)






















const DUGOUT_HIT_R: float = 0.55



const DUGOUT_HIT_H_SIT: float = 1.5
const DUGOUT_HIT_H_STAND: float = 1.95








var _dugout_people: Array[Dictionary] = []




func _register_dugout_person(node: Node3D, base: Vector3, is_home: bool,
		role: String, standing: bool) -> void:
	_dugout_people.append({
		"node": node,
		"base": base,




		"yours": is_home == _host_stand_is_yours(),


		"home": is_home,
		"role": role,
		"h": DUGOUT_HIT_H_STAND if standing else DUGOUT_HIT_H_SIT,
		"down": false,




		"gaze": Vector3(1.0, 0.0, 0.0),



		"gaze_t": randf_range(GAZE_HOLD_MIN, GAZE_HOLD_MAX),
	})










const GAZE_HOLD_MIN: float = 2.5
const GAZE_HOLD_MAX: float = 7.0




const GAZE_EVERY: float = 0.2
var _gaze_t: float = 0.0













func _tick_dugout_gaze(dt: float) -> void:
	if not dugout_views or _dugout_people.is_empty():
		return
	_gaze_t -= dt
	if _gaze_t > 0.0:
		return
	_gaze_t = GAZE_EVERY
	var cam: Camera3D = SceneFade.camara_de(self)
	if cam == null:
		return
	for e in _dugout_people:
		if String(e["role"]) == "coach" or bool(e["down"]):
			continue
		var spr: AnimatedSprite3D = e["node"]
		if not is_instance_valid(spr) or spr.sprite_frames == null:
			continue
		var actual: String = spr.animation
		if actual != "idle" and not actual.begins_with("idle_"):
			continue
		e["gaze_t"] = float(e["gaze_t"]) - GAZE_EVERY
		if float(e["gaze_t"]) <= 0.0:
			e["gaze_t"] = randf_range(GAZE_HOLD_MIN, GAZE_HOLD_MAX)



			e["gaze"] = Vector3(1.0, 0.0, 0.0) if randf() < 0.8 \
					else Vector3(0.0, 0.0, 1.0 if randf() < 0.5 else -1.0)
		var quiere: String = dir_name_towards(e["gaze"], cam)
		var anim: String = "idle" if quiere == "south" else "idle_" + quiere
		if actual == anim or not spr.sprite_frames.has_animation(anim):
			continue




		var f: int = spr.frame
		spr.play(anim)
		spr.frame = f % maxi(1, spr.sprite_frames.get_frame_count(anim))












func _coach_idle_anim(coach: AnimatedSprite3D) -> String:
	if not dugout_views or coach == null or coach.sprite_frames == null:
		return "idle"
	var cam: Camera3D = SceneFade.camara_de(self)
	if cam == null:
		return "idle"

	var d: String = dir_name_towards(Vector3(1.0, 0.0, 0.0), cam)
	var anim: String = "idle" if d == "south" else "idle_" + d
	return anim if coach.sprite_frames.has_animation(anim) else "idle"



func dugout_person_hit(a: Vector3, b: Vector3) -> int:
	if _dugout_people.is_empty():
		return -1







	if maxf(absf(a.x), absf(b.x)) < FIELD_HALF_W:
		return -1
	if minf(a.y, b.y) > DUGOUT_HIT_H_STAND:
		return -1
	for i in _dugout_people.size():
		var e: Dictionary = _dugout_people[i]
		var node: Node3D = e["node"]
		if not is_instance_valid(node) or bool(e["down"]):
			continue
		if minf(a.y, b.y) > float(e["h"]):
			continue
		var p: Vector3 = Vector3(e["base"]) + node.position
		var pa: Vector2 = Vector2(a.x - p.x, a.z - p.z)
		var ab: Vector2 = Vector2(b.x - a.x, b.z - a.z)
		var len2: float = ab.length_squared()
		var t: float = 0.0 if len2 <= 0.0001 else clampf(- pa.dot(ab) / len2, 0.0, 1.0)
		if (pa + ab * t).length() <= DUGOUT_HIT_R:
			return i
	return -1










func dugout_bottle_hit(a: Vector3, b: Vector3) -> int:
	if _dugout_bottles.is_empty():
		return -1
	if maxf(absf(a.x), absf(b.x)) < FIELD_HALF_W:
		return -1
	if minf(a.y, b.y) > BENCH_TOP_Y + BOTTLE_HIT_H or maxf(a.y, b.y) < BENCH_TOP_Y:
		return -1
	for g in _dugout_bottles.size():
		for root in _dugout_bottles[g]:
			if not is_instance_valid(root) or bool(root.get_meta("down", false)):
				continue
			var p: Vector3 = root.position
			var pa: Vector2 = Vector2(a.x - p.x, a.z - p.z)
			var ab: Vector2 = Vector2(b.x - a.x, b.z - a.z)
			var len2: float = ab.length_squared()
			var t: float = 0.0 if len2 <= 0.0001 else clampf(- pa.dot(ab) / len2, 0.0, 1.0)
			if (pa + ab * t).length() <= BOTTLE_HIT_R:
				return g
	return -1





func launch_dugout_bottles(g: int, from: Vector3, ball_vel: Vector3) -> void:
	if g < 0 or g >= _dugout_bottles.size():
		return
	launch_bottle_set(_dugout_bottles[g], from, ball_vel)





func dugout_person_info(i: int) -> Dictionary:
	if i < 0 or i >= _dugout_people.size():
		return {}
	var e: Dictionary = _dugout_people[i]
	var node: Node3D = e["node"]
	var p: Vector3 = Vector3(e["base"])
	if is_instance_valid(node):
		p += node.position
	return {"yours": bool(e["yours"]), "role": String(e["role"]), "pos": p}
















func dugout_sentados(is_home: bool = true) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for e in _dugout_people:
		var node: Node3D = e["node"]
		if not is_instance_valid(node) or String(e["role"]) != "sub" \
				or bool(e.get("home", true)) != is_home or not node.has_meta("viste"):
			continue
		var receta: Dictionary = node.get_meta("viste")
		if not bool(receta.get("sentado", false)):
			continue
		out.append({"node": node, "quien": String(receta.get("quien", "")),
			"seco": receta.get("seco", {}), "pos": Vector3(e["base"]) + node.position})
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return (a["pos"] as Vector3).z <(b["pos"] as Vector3).z)
	return out





func sentado_frames(cfg: Dictionary) -> SpriteFrames:
	return _sub_frames(cfg, true)






const SENTADO_GESTO_SHEET: String = "res://assets/sprites/anim/sentado_%s_south_%02d.png"

const SENTADO_GESTO_FPS: float = 10.0






func sentado_gestos(frames: SpriteFrames, cfg: Dictionary, gestos: Array) -> void:
	if frames == null:
		return
	for g in gestos:
		var nombre: String = String(g)
		if frames.has_animation(nombre):
			continue
		var rutas: Array = []
		for i in range(1, 9):
			var path: String = SENTADO_GESTO_SHEET % [nombre, i]
			if not ResourceLoader.exists(path):
				break
			rutas.append(path)
		if rutas.is_empty():
			continue
		frames.add_animation(nombre)
		frames.set_animation_loop(nombre, false)
		frames.set_animation_speed(nombre, SENTADO_GESTO_FPS)
		for path: String in rutas:
			frames.add_frame(nombre, KitRecolor.apply(load(path), cfg))
		_apunta_cara(frames, nombre, rutas, cfg)





func knock_dugout_person(i: int, from: Vector3) -> void:
	if i < 0 or i >= _dugout_people.size():
		return
	var e: Dictionary = _dugout_people[i]
	var node: Node3D = e["node"]
	if not is_instance_valid(node) or bool(e["down"]):
		return
	e["down"] = true



	if String(e["role"]) == "coach":
		for c in _coaches:
			if c["node"] == node:
				c["hold"] = maxf(float(c["hold"]), 6.0)
				c["react"] = 0.0
	var away: Vector3 =(Vector3(e["base"]) + node.position) - from
	away.y = 0.0
	if away.length() < 0.01:
		away = Vector3(-1.0, 0.0, 0.0)
	away = away.normalized()
	var spr: AnimatedSprite3D = node as AnimatedSprite3D
	if spr == null:
		return
	spr.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	spr.rotation_degrees = Vector3(0.0, 90.0, 0.0)
	var rest: Vector3 = spr.position



	var side: float = -65.0 if away.z >= 0.0 else 65.0
	var tw: Tween = create_tween()
	tw.set_parallel(true)
	tw.tween_property(spr, "rotation_degrees:z", side, 0.38) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	tw.tween_property(spr, "position",
		Vector3(rest.x + away.x * 0.35, rest.y * 0.5, rest.z + away.z * 0.35), 0.38) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)






func coach_spot(is_home: bool = true) -> Vector3:
	for c in _coaches:
		if bool(c["home"]) != is_home:
			continue
		var coach: AnimatedSprite3D = c["node"]
		if is_instance_valid(coach):
			return coach.global_position
	return dugout_focus(is_home)






















var _slow_k: float = 1.0




func set_slow_k(k: float) -> void:
	k = clampf(k, 0.05, 1.0)
	if is_equal_approx(k, _slow_k):
		return
	_slow_k = k




	if _rain:
		_rain.speed_scale = k
	if _snow:
		_snow.speed_scale = k
	if _bar_snow_fall:
		_bar_snow_fall.speed_scale = k
	if _tube_spray_p:
		_tube_spray_p.speed_scale = k
	if _net_drip_p:
		_net_drip_p.speed_scale = k



	for sp in _sprink_p:
		sp.speed_scale = k
	for t in _tongue:
		(t["node"] as GeometryInstance3D).speed_scale = k


func _process(delta: float) -> void:


	var perf: bool = PerfContadores.activo
	if perf:
		PerfContadores.empieza()

	var amb: float = delta * _slow_k
	if _roof:
		_tick_roof(amb)
	if perf: PerfContadores.vuelta(&"s.techo")
	_tick_crowd(amb)
	if perf: PerfContadores.vuelta(&"s.grada")
	_tick_pending(amb)
	if perf: PerfContadores.vuelta(&"s.pendientes")
	_tick_lectura(amb)
	if perf: PerfContadores.vuelta(&"s.lectura")
	_tick_tramo(amb)
	if perf: PerfContadores.vuelta(&"s.tramo")


	var local: int = 1 if _casa_es_tuya else 0
	var canta_local: bool = _chant_t > 0.0 and not _gol_pena[local] \
			and tramo_de(local) != LecturaGol.TRAMO_HORA \
			and (_chant_bando < 0 or _chant_bando == local)
	_vida_recinto.tick(amb, _react_t >= 0.0, canta_local,
		_react_home, _react_away, _tv_focus, _photogs)
	if perf: PerfContadores.vuelta(&"s.vida_recinto")



	_tick_zone(amb)
	if perf: PerfContadores.vuelta(&"s.zona")


	_tick_tifo(amb)
	if perf: PerfContadores.vuelta(&"s.tifo")



	_tick_serp(amb)
	if perf: PerfContadores.vuelta(&"s.serpentinas")
	_tick_walkers(amb)
	if perf: PerfContadores.vuelta(&"s.andantes")

	_salida.tick(amb)
	if perf: PerfContadores.vuelta(&"s.salida")
	_tick_invasion(amb)
	if perf: PerfContadores.vuelta(&"s.invasion")


	_tick_tread(delta)
	if perf: PerfContadores.vuelta(&"s.huellas")
	_tick_tv_cams(amb)
	if perf: PerfContadores.vuelta(&"s.camaras_tv")
	_tick_view_clip(delta)
	if perf: PerfContadores.vuelta(&"s.view_clip")


	_tick_bottles(amb)
	if perf: PerfContadores.vuelta(&"s.botellas")


	_tick_flashes(amb)
	if perf: PerfContadores.vuelta(&"s.flashes")
	_tick_press_flashes(amb)
	if perf: PerfContadores.vuelta(&"s.flashes_prensa")
	_tick_phone_lights(amb)
	if perf: PerfContadores.vuelta(&"s.moviles")
	_tick_panuelos(amb)
	if perf: PerfContadores.vuelta(&"s.panuelos")
	_tick_litter(amb)
	if perf: PerfContadores.vuelta(&"s.papel")

	_tick_bolt(amb)
	if perf: PerfContadores.vuelta(&"s.rayos")

	_tick_pigeons(amb)
	if perf: PerfContadores.vuelta(&"s.palomas")

	_tick_train(amb)
	if perf: PerfContadores.vuelta(&"s.tren")


	_tick_moths(amb)
	if perf: PerfContadores.vuelta(&"s.polillas")
	_tick_sprinklers(amb)
	if perf: PerfContadores.vuelta(&"s.riego")

	_tick_tongue(amb)
	if perf: PerfContadores.vuelta(&"s.bengala")


	_tick_box_people(amb)
	if perf: PerfContadores.vuelta(&"s.palco")

	_tick_dugout_gaze(amb)
	if perf: PerfContadores.vuelta(&"s.mirada_banquillo")
	for c in _coaches:
		var coach: AnimatedSprite3D = c["node"]


		if bool(c.get("mano", false)):
			continue


		if not String(c.get("gesto", "")).is_empty():
			_tick_coach_gesto(c, amb)
			continue

		if c["hold"] > 0.0:
			c["hold"] = float(c["hold"]) - amb
			coach.position.x = COACH_X +(0.0 if bool(c.get("snap", false))
				else COACH_TENSION_X)
			if c["hold"] <= 0.0:
				coach.play(_coach_idle_anim(coach))
				c["snap"] = false
				c["celeb"] = false
			continue



		if c["react"] > 0.0:
			c["react"] = float(c["react"]) - amb
			if c["react"] <= 0.0:
				coach.play(_coach_idle_anim(coach))
				coach.speed_scale = 1.0
				c["wait"] = COACH_PAUSE * 0.5
			continue
		if c["wait"] > 0.0:
			c["wait"] = c["wait"] - amb
			coach.speed_scale = 0.6






			var quieto: String = _coach_idle_anim(coach)
			if coach.animation != quieto:
				coach.play(quieto)
			coach.position.y = float(c["y0"])
			coach.rotation_degrees.z = 0.0
			continue
		coach.speed_scale = 1.4
		var z: float = coach.position.z + c["dir"] * COACH_SPEED * amb
		var lim: float = c["range"]
		if absf(z) >= lim:
			z = clampf(z, - lim, lim)
			c["dir"] = - c["dir"]
			c["wait"] = COACH_PAUSE




		var eje: Vector3 = Vector3(0.0, 0.0, 1.0)
		var padre: Node = coach.get_parent()
		if padre is Node3D:
			eje =(padre as Node3D).global_transform.basis.z
		var lamina: String = _coach_walk_anim(coach, eje * signf(c["dir"]))
		coach.position.z = z




		coach.flip_h = c["dir"] < 0.0





		if not lamina.is_empty():
			if coach.animation != lamina:
				coach.play(lamina)
		else:




			var fase: float = z / COACH_STEP_LEN * PI
			coach.position.y = float(c["y0"]) + absf(sin(fase)) * COACH_BOB
			coach.rotation_degrees.z = cos(fase) * COACH_LEAN * c["dir"]




		coach.position.x = COACH_X + sin(z * 0.9) * COACH_X_SWAY \
				+ _excite * COACH_TENSION_X
	if perf: PerfContadores.vuelta(&"s.tecnicos")



















const TV_CAM_H: float = 1.65
const TV_GANTRY_H: float = 4.2
const TV_PAN_SPEED: float = 1.2
const TV_SWEEP_DEG: float = 22.0

var _tv_cams: Array[Dictionary] = []
var _tv_focus: Vector3 = Vector3.INF
var _tv_t: float = 0.0














const CAMOP_HEIGHT: float = 1.78

const CAMOP_KIT: Color = Color("2f333a")
const CAMOP_KIT2: Color = Color("1e2126")









func _build_camera_ops() -> void:
	if backdrop:
		return
	if div >= 3:
		return
	var rx: float = _ring_x() + 1.4
	var zn: float = -4.0 - _ring_pad_z() - 1.4


	var spots: Array[Vector3] = [
		Vector3(-8.5, 0.0, zn),
		Vector3(8.5, 0.0, zn),
	]
	if div == 1:
		spots.append(Vector3(rx, 0.0, 6.0))
	for i in spots.size():
		await _respira()
		_camera_op(spots[i], i)




func _camera_op(pos: Vector3, idx: int) -> void:




	if venue_empty:
		return


	var frames: SpriteFrames = preload("res://features/stadium/staff_sprites.gd").camarografo(KitRecolor.appearance_for(
		"%s_cam%d" % [_pitch_seed_club(), idx],
		{"kit": CAMOP_KIT, "kit2": CAMOP_KIT2}))
	if frames == null:
		return
	var root: Node3D = Node3D.new()
	root.position = pos


	root.rotation_degrees = Vector3(0.0, rad_to_deg(atan2(- pos.x, - pos.z)), 0.0)
	add_child(root)


	_register_occluder(root)
	_camera_ops.append(root)
	var man: AnimatedSprite3D = AnimatedSprite3D.new()
	man.sprite_frames = frames
	man.pixel_size = CAMOP_HEIGHT / PERSON_BODY_PX
	man.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	man.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	man.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	man.position = Vector3(0.0, _person_feet(man.pixel_size), 0.0)
	root.add_child(man)
	man.play("idle")
	var dark: StandardMaterial3D = StandardMaterial3D.new()
	dark.albedo_color = Color("15181d")
	dark.roughness = 0.7

	var body: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(0.3, 0.32, 0.6)
	body.mesh = bm
	body.material_override = dark
	body.position = Vector3(0.16, 1.44, 0.18)
	body.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(body)


	var lens: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = 0.11
	cm.bottom_radius = 0.13
	cm.height = 0.42
	lens.mesh = cm
	lens.material_override = dark
	lens.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	lens.position = Vector3(0.16, 1.46, 0.6)
	lens.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(lens)



	preload("res://features/stadium/tv_camera_detail.gd").camara(body, lens, 1.0)
	root.set_meta("man", man)
	root.set_meta("cam_body", body)
	root.set_meta("cam_lens", lens)
	root.set_meta("down", false)




















const PHOTOG_HEIGHT: float = 1.5
const PHOTOG_FLASH_DUR: float = 2.6
const PHOTOG_FLASH_ON: float = 0.07
const PHOTOG_GAP_MIN: float = 0.1
const PHOTOG_GAP_MAX: float = 0.45

var _photogs: Array[Node3D] = []
var _photog_flash: Array[MeshInstance3D] = []
var _photog_lit: PackedFloat32Array = PackedFloat32Array()
var _photog_wait: PackedFloat32Array = PackedFloat32Array()
var _photog_t: float = 0.0





func _build_photographers() -> void:
	if backdrop or venue_empty or div >= 3:
		return
	var zn: float = -4.0 - _ring_pad_z() - 1.1
	var xs: Array[float] = []
	if div == 1:
		xs.assign([-13.6, -11.4, -5.6, 5.6, 11.4, 13.6])
	else:
		xs.assign([-12.4, -5.6, 12.4])
	for i in xs.size():
		await _respira()
		_photographer(Vector3(xs[i], 0.0, zn), i)


func _photographer(pos: Vector3, idx: int) -> void:
	var frames: SpriteFrames = _person_frames(KitRecolor.appearance_for(
		"%s_foto%d" % [_pitch_seed_club(), idx],
		{"kit": CAMOP_KIT, "kit2": CAMOP_KIT2}))
	if frames == null:
		return
	var root: Node3D = Node3D.new()
	root.position = pos
	root.rotation_degrees = Vector3(0.0, rad_to_deg(atan2(- pos.x, - pos.z)), 0.0)
	add_child(root)
	_register_occluder(root)
	_photogs.append(root)
	FinishDetail.prensa(root)
	var man: AnimatedSprite3D = AnimatedSprite3D.new()
	man.sprite_frames = frames
	man.pixel_size = PHOTOG_HEIGHT / PERSON_BODY_PX
	man.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	man.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	man.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	man.position = Vector3(0.0, _person_feet(man.pixel_size), 0.0)
	man.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(man)
	man.play("idle")


	var dark: StandardMaterial3D = StandardMaterial3D.new()
	dark.albedo_color = Color("15181d")
	dark.roughness = 0.7
	var lens: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = 0.07
	cm.bottom_radius = 0.09
	cm.height = 0.5
	lens.mesh = cm
	lens.material_override = dark
	lens.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	lens.position = Vector3(0.1, 1.3, 0.4)
	lens.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(lens)



	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.6, 0.6)
	var fm: StandardMaterial3D = StandardMaterial3D.new()
	fm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	fm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	fm.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	fm.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	fm.albedo_color = Color(1.0, 1.0, 0.97)
	fm.albedo_texture = _vida_recinto.halo_prensa()
	quad.material = fm
	var flash: MeshInstance3D = MeshInstance3D.new()
	flash.mesh = quad
	flash.position = Vector3(0.1, 1.3, 0.75)
	flash.scale = Vector3.ONE * 0.001
	flash.visible = false
	flash.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(flash)
	_photog_flash.append(flash)
	_photog_lit.append(-1.0)
	_photog_wait.append(randf_range(0.0, PHOTOG_GAP_MAX))




func press_flashes() -> void:
	if _photog_flash.is_empty() or Settings.reduce_motion:
		return
	_photog_t = maxf(_photog_t, PHOTOG_FLASH_DUR)


func _tick_press_flashes(delta: float) -> void:
	if _photog_t <= 0.0:
		return
	_photog_t -= delta
	if _photog_t <= 0.0:
		_photog_t = 0.0
		for i in _photog_flash.size():
			_photog_lit[i] = -1.0
			_photog_flash[i].visible = false
		return

	var fade: float = clampf(_photog_t, 0.0, 1.0)
	for i in _photog_flash.size():
		var f: MeshInstance3D = _photog_flash[i]
		if _photog_lit[i] > 0.0:
			_photog_lit[i] -= delta
			if _photog_lit[i] <= 0.0:
				f.visible = false
			continue
		_photog_wait[i] -= delta
		if _photog_wait[i] > 0.0:
			continue
		_photog_wait[i] = randf_range(PHOTOG_GAP_MIN, PHOTOG_GAP_MAX) / maxf(fade, 0.15)
		if randf() > fade:
			continue
		_photog_lit[i] = PHOTOG_FLASH_ON
		f.scale = Vector3.ONE * randf_range(0.7, 1.0)
		f.visible = true

















const CAMOP_HIT_R: float = 0.55
const CAMOP_HIT_H: float = 1.95

const STAND_ROW_Y: float = 3.3






func camera_op_hit(a: Vector3, b: Vector3) -> int:
	if _camera_ops.is_empty():
		return -1
	for i in _camera_ops.size():
		var root: Node3D = _camera_ops[i]
		if not is_instance_valid(root) or bool(root.get_meta("down", false)):
			continue

		if minf(a.y, b.y) > CAMOP_HIT_H:
			continue
		var p: Vector3 = root.position

		var pa: Vector2 = Vector2(a.x - p.x, a.z - p.z)
		var ab: Vector2 = Vector2(b.x - a.x, b.z - a.z)
		var len2: float = ab.length_squared()
		var t: float = 0.0 if len2 <= 0.0001 else clampf(- pa.dot(ab) / len2, 0.0, 1.0)
		if (pa + ab * t).length() <= CAMOP_HIT_R:
			return i
	return -1










func knock_camera_op(i: int, from: Vector3) -> void:
	if i < 0 or i >= _camera_ops.size():
		return
	var root: Node3D = _camera_ops[i]
	if not is_instance_valid(root) or bool(root.get_meta("down", false)):
		return
	root.set_meta("down", true)


	var away: Vector3 = root.position - from
	away.y = 0.0
	if away.length() < 0.01:
		away = Vector3(0.0, 0.0, -1.0)
	away = away.normalized()
	var local: Vector3 = root.global_transform.basis.inverse() * away


	var man: AnimatedSprite3D = SceneFade.vivo(root.get_meta("man", null)) as AnimatedSprite3D
	if is_instance_valid(man):












		man.billboard = BaseMaterial3D.BILLBOARD_DISABLED
		man.rotation_degrees = Vector3(0.0, 180.0, 0.0)
		var rest_y: float = man.position.y




		var side: float = -60.0 if local.x >= 0.0 else 60.0
		var tw: Tween = create_tween()
		tw.set_parallel(true)
		tw.tween_property(man, "rotation_degrees:z", side, 0.45) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)

		tw.tween_property(man, "position",
			Vector3(local.x * 0.45, rest_y * 0.72, local.z * 0.45), 0.45) \
					.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)




	for key in ["cam_body", "cam_lens"]:
		var piece: MeshInstance3D = SceneFade.vivo(root.get_meta(key, null)) as MeshInstance3D
		if not is_instance_valid(piece):
			continue
		var to: Vector3 = Vector3(piece.position.x + local.x * 0.9, 0.95,
			piece.position.z - 0.75)
		var tw2: Tween = create_tween()
		tw2.set_parallel(true)
		tw2.tween_property(piece, "position", to, 0.5) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
		tw2.tween_property(piece, "rotation_degrees",
			piece.rotation_degrees + Vector3(0.0, 140.0, 95.0), 0.5) \
					.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)



func camera_op_pos(i: int) -> Vector3:
	if i < 0 or i >= _camera_ops.size():
		return Vector3.INF
	return _camera_ops[i].position


func camera_op_count() -> int:
	return _camera_ops.size()


func camera_op_down(i: int) -> bool:
	if i < 0 or i >= _camera_ops.size():
		return false
	return bool(_camera_ops[i].get_meta("down", false))












func camera_op_spot(from: Vector3) -> Vector3:
	var best: Vector3 = Vector3.INF
	var best_d: float = INF
	for i in _camera_ops.size():
		var root: Node3D = _camera_ops[i]
		if not is_instance_valid(root) or bool(root.get_meta("down", false)):
			continue
		var p: Vector3 = root.position
		var d: float = Vector2(p.x - from.x, p.z - from.z).length()
		if d < best_d:
			best_d = d
			best = p
	return best



















const BALLBOY_HIT_R: float = 0.5
const BALLBOY_HIT_H: float = 1.3





func ball_boy_hit(a: Vector3, b: Vector3) -> int:
	if _ball_boys.is_empty():
		return -1
	for i in _ball_boys.size():
		var root: Node3D = _ball_boys[i]
		if not is_instance_valid(root) or bool(root.get_meta("down", false)):
			continue
		if minf(a.y, b.y) > BALLBOY_HIT_H:
			continue
		var p: Vector3 = root.position
		var pa: Vector2 = Vector2(a.x - p.x, a.z - p.z)
		var ab: Vector2 = Vector2(b.x - a.x, b.z - a.z)
		var len2: float = ab.length_squared()
		var t: float = 0.0 if len2 <= 0.0001 else clampf(- pa.dot(ab) / len2, 0.0, 1.0)
		if (pa + ab * t).length() <= BALLBOY_HIT_R:
			return i
	return -1







func knock_ball_boy(i: int, from: Vector3) -> void:
	if i < 0 or i >= _ball_boys.size():
		return
	var root: Node3D = _ball_boys[i]
	if not is_instance_valid(root) or bool(root.get_meta("down", false)):
		return
	root.set_meta("down", true)
	var away: Vector3 = root.position - from
	away.y = 0.0
	if away.length() < 0.01:
		away = Vector3(0.0, 0.0, -1.0)
	away = away.normalized()
	var local: Vector3 = root.global_transform.basis.inverse() * away


	var man: AnimatedSprite3D = SceneFade.vivo(root.get_meta("man", null)) as AnimatedSprite3D
	if is_instance_valid(man):
		man.billboard = BaseMaterial3D.BILLBOARD_DISABLED
		man.rotation_degrees = Vector3(0.0, 180.0, 0.0)
		var rest_y: float = man.position.y
		var side: float = -65.0 if local.x >= 0.0 else 65.0
		var tw: Tween = create_tween()
		tw.set_parallel(true)
		tw.tween_property(man, "rotation_degrees:z", side, 0.4) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
		tw.tween_property(man, "position",
			Vector3(local.x * 0.5, rest_y * 0.55, local.z * 0.5), 0.4) \
					.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

	var ball: MeshInstance3D = SceneFade.vivo(root.get_meta("ball", null)) as MeshInstance3D
	if is_instance_valid(ball):
		var to: Vector3 = Vector3(ball.position.x + local.x * 1.4, 0.11,
			ball.position.z + 2.2)
		var tw2: Tween = create_tween()
		tw2.tween_property(ball, "position:z", to.z, 0.45) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		var tw3: Tween = create_tween()
		tw3.set_parallel(true)
		tw3.tween_property(ball, "position:x", to.x, 0.45) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tw3.tween_property(ball, "position:y", 0.55, 0.22) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tw3.chain().tween_property(ball, "position:y", 0.11, 0.2) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)


func ball_boy_pos(i: int) -> Vector3:
	if i < 0 or i >= _ball_boys.size():
		return Vector3.INF
	return _ball_boys[i].position


func ball_boy_count() -> int:
	return _ball_boys.size()


func ball_boy_down(i: int) -> bool:
	if i < 0 or i >= _ball_boys.size():
		return false
	return bool(_ball_boys[i].get_meta("down", false))












const BOTTLE_H: float = 0.26
const BOTTLE_R: float = 0.045
const BOTTLE_NECK_R: float = 0.019


const BOTTLE_HIT_R: float = 0.3
const BOTTLE_HIT_H: float = 0.42




const BOTTLE_WATER: Color = Color(0.68, 0.85, 0.95, 0.72)
const BOTTLE_WATER_CAP: Color = Color("1f4f7a")
const BOTTLE_BEER: Color = Color(0.88, 0.6, 0.16, 0.8)
const BOTTLE_BEER_CAP: Color = Color("46280d")

func _build_water_bottles() -> void:





	var bx: float = -(GOAL_HALF_W + 0.3)
	var spots: Array[Vector3] = [
		Vector3(bx, 0.0, -0.62),
		Vector3(bx - 0.16, 0.0, -0.46),
	]
	for i in spots.size():
		_water_bottles.append(_water_bottle(spots[i], i))







func _water_bottle(pos: Vector3, idx: int) -> Node3D:
	var root: Node3D = make_bottle()
	root.position = pos
	add_child(root)

	_register_occluder(root)
	root.set_meta("down", false)
	return root


























var _bottle_meshes: Dictionary = {}
var _bottle_mats: Dictionary = {}

func make_bottle(liquid: Color = BOTTLE_WATER,
		cap_col: Color = BOTTLE_WATER_CAP) -> Node3D:
	var root: Node3D = Node3D.new()
	var mat: StandardMaterial3D = _bottle_mat(liquid, true)

	var body: MeshInstance3D = MeshInstance3D.new()
	body.mesh = _bottle_mesh("body")
	body.material_override = mat
	body.position = Vector3(0.0, BOTTLE_H * 0.3, 0.0)
	body.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(body)


	var shoulder: MeshInstance3D = MeshInstance3D.new()
	shoulder.mesh = _bottle_mesh("shoulder")
	shoulder.material_override = mat
	shoulder.position = Vector3(0.0, BOTTLE_H * 0.71, 0.0)
	shoulder.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(shoulder)


	var neck: MeshInstance3D = MeshInstance3D.new()
	neck.mesh = _bottle_mesh("neck")
	neck.material_override = mat
	neck.position = Vector3(0.0, BOTTLE_H * 0.95, 0.0)
	neck.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(neck)

	var cap: MeshInstance3D = MeshInstance3D.new()
	cap.mesh = _bottle_mesh("cap")
	cap.material_override = _bottle_mat(cap_col, false)
	cap.position = Vector3(0.0, BOTTLE_H * 1.08, 0.0)
	cap.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(cap)
	return root






func _bottle_mesh(kind: String) -> Mesh:
	if _bottle_meshes.has(kind):
		return _bottle_meshes[kind]
	var cm: CylinderMesh = CylinderMesh.new()
	match kind:
		"body":

			cm.bottom_radius = BOTTLE_R
			cm.top_radius = BOTTLE_R
			cm.height = BOTTLE_H * 0.6
		"shoulder":
			cm.bottom_radius = BOTTLE_R
			cm.top_radius = BOTTLE_NECK_R
			cm.height = BOTTLE_H * 0.22
		"neck":
			cm.bottom_radius = BOTTLE_NECK_R
			cm.top_radius = BOTTLE_NECK_R
			cm.height = BOTTLE_H * 0.26
		_:
			cm.bottom_radius = BOTTLE_R * 0.5
			cm.top_radius = BOTTLE_R * 0.5
			cm.height = BOTTLE_H * 0.22
	cm.radial_segments = 12
	_bottle_meshes[kind] = cm
	return cm






func _bottle_mat(col: Color, liquid: bool) -> StandardMaterial3D:
	var key: String =("l" if liquid else "c") + col.to_html()
	if _bottle_mats.has(key):
		return _bottle_mats[key]
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	if liquid:
		m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		m.roughness = 0.35
	_bottle_mats[key] = m
	return m




func water_bottle_hit(a: Vector3, b: Vector3) -> int:
	if _water_bottles.is_empty():
		return -1
	for i in _water_bottles.size():
		var root: Node3D = _water_bottles[i]
		if not is_instance_valid(root) or bool(root.get_meta("down", false)):
			continue
		if minf(a.y, b.y) > BOTTLE_HIT_H:
			continue
		var p: Vector3 = root.position
		var pa: Vector2 = Vector2(a.x - p.x, a.z - p.z)
		var ab: Vector2 = Vector2(b.x - a.x, b.z - a.z)
		var len2: float = ab.length_squared()
		var t: float = 0.0 if len2 <= 0.0001 else clampf(- pa.dot(ab) / len2, 0.0, 1.0)
		if (pa + ab * t).length() <= BOTTLE_HIT_R:
			return i
	return -1





func knock_water_bottle(_i: int, from: Vector3) -> void:
	for root in _water_bottles:
		if not is_instance_valid(root) or bool(root.get_meta("down", false)):
			continue
		root.set_meta("down", true)
		var away: Vector3 = root.position - from
		away.y = 0.0
		if away.length() < 0.01:
			away = Vector3(0.0, 0.0, 1.0)
		away = away.normalized()



		var axis: Vector3 = Vector3(- away.z, 0.0, away.x)
		var tw: Tween = create_tween()
		tw.set_parallel(true)
		tw.tween_property(root, "quaternion",
			Quaternion(axis, deg_to_rad(90.0)), 0.28) \
					.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		tw.tween_property(root, "position",
			root.position + away * 0.35, 0.28) \
					.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)









const BOTTLE_FLY_FRAC: float = 0.72
const BOTTLE_FLY_MIN: float = 3.5
const BOTTLE_FLY_MAX: float = 26.0
const BOTTLE_POP_FRAC: float = 0.3
const BOTTLE_POP_MIN: float = 2.2
const BOTTLE_POP_MAX: float = 7.0
func launch_water_bottles(_i: int, from: Vector3, ball_vel: Vector3) -> void:
	launch_bottle_set(_water_bottles, from, ball_vel)
















func launch_bottle_set(list: Array, _from: Vector3, hit_vel: Vector3) -> void:
	var flat: Vector3 = Vector3(hit_vel.x, 0.0, hit_vel.z)
	var speed: float = flat.length()
	var dir: Vector3 = flat.normalized() if speed > 0.05 else Vector3(0.0, 0.0, -1.0)
	var standing: Array = []
	for root in list:
		if is_instance_valid(root) and not bool(root.get_meta("down", false)):
			standing.append(root)
	var mid: float = float(standing.size() - 1) * 0.5




	if not standing.is_empty():
		_spray_bottles(standing, dir, speed)
	for idx in standing.size():
		var root: Node3D = standing[idx]
		root.set_meta("down", true)












		var jitter: float = 1.0 + 0.12 *(float(idx) - mid) + randf_range(-0.22, 0.22)
		var fly: float = clampf(speed * BOTTLE_FLY_FRAC * jitter,
			BOTTLE_FLY_MIN, BOTTLE_FLY_MAX)
		var pop: float = clampf(speed * BOTTLE_POP_FRAC * randf_range(0.65, 1.45),
			BOTTLE_POP_MIN, BOTTLE_POP_MAX)

		var ang: float = 9.0 *(float(idx) - mid) + randf_range(-14.0, 14.0)
		var spread: Vector3 = dir.rotated(Vector3.UP, deg_to_rad(ang))
		var vel: Vector3 = spread * fly + Vector3(0.0, pop, 0.0)


		var axis: Vector3 = Vector3(- spread.z, 0.0, spread.x).normalized()
		if axis.length() < 0.01:
			axis = Vector3(1.0, 0.0, 0.0)
		var spin: float = clampf(fly * randf_range(1.0, 1.9), 6.0, 34.0)
		_flying_bottles.append({
			"node": root, "vel": vel, "axis": axis, "spin": spin, "rest_y": BOTTLE_R,
		})






func _tick_bottles(delta: float) -> void:
	if _flying_bottles.is_empty():
		return
	var d: float = minf(delta, 0.05)
	var still: Array[Dictionary] = []
	for b in _flying_bottles:
		var root: Node3D = b["node"]
		if not is_instance_valid(root):
			continue
		var vel: Vector3 = b["vel"]
		vel.y -= 9.8 * d
		vel *= 1.0 - 0.9 * d
		var rest_y: float = float(b["rest_y"])
		root.position += vel * d

		root.quaternion =(Quaternion(b["axis"], b["spin"] * d) * root.quaternion).normalized()
		if root.position.y <= rest_y:
			root.position.y = rest_y


			if vel.y < 0.0:
				vel.y = - vel.y * 0.32
			vel.x *= 0.6
			vel.z *= 0.6
			b["spin"] = float(b["spin"]) * 0.55

			if vel.length() < 1.1 and float(b["spin"]) < 2.0:
				_settle_bottle(root, vel)
				continue
		b["vel"] = vel
		still.append(b)
	_flying_bottles = still
	_bounce_bottles()



















const BOTTLE_BUMP_R: float = 0.13
const BOTTLE_BUMP_LOSS: float = 0.72
func _bounce_bottles() -> void:
	var n: int = _flying_bottles.size()
	if n < 2:
		return
	var lim: float = BOTTLE_BUMP_R * 2.0
	for i in range(n - 1):
		var a: Dictionary = _flying_bottles[i]
		var na: Node3D = a["node"]
		if not is_instance_valid(na):
			continue
		for j in range(i + 1, n):
			var b: Dictionary = _flying_bottles[j]
			var nb: Node3D = b["node"]
			if not is_instance_valid(nb):
				continue
			var sep: Vector3 = nb.position - na.position
			var d: float = sep.length()
			if d >= lim or d < 0.0001:
				continue
			var axis: Vector3 = sep / d


			var push: float =(lim - d) * 0.5
			na.position -= axis * push
			nb.position += axis * push



			var va: Vector3 = a["vel"]
			var vb: Vector3 = b["vel"]
			var closing: float =(vb - va).dot(axis)
			if closing >= 0.0:
				continue
			var swap: Vector3 = axis * closing * BOTTLE_BUMP_LOSS
			a["vel"] = va + swap
			b["vel"] = vb - swap

			a["spin"] = clampf(float(a["spin"]) * 1.25, 6.0, 34.0)
			b["spin"] = clampf(float(b["spin"]) * 1.25, 6.0, 34.0)





func _settle_bottle(root: Node3D, vel: Vector3) -> void:
	var flat: Vector3 = Vector3(vel.x, 0.0, vel.z)
	var away: Vector3 = flat.normalized() if flat.length() > 0.01 else Vector3(0.0, 0.0, -1.0)
	var axis: Vector3 = Vector3(- away.z, 0.0, away.x).normalized()
	if axis.length() < 0.01:
		axis = Vector3(1.0, 0.0, 0.0)
	var tw: Tween = create_tween()
	tw.tween_property(root, "quaternion", Quaternion(axis, deg_to_rad(90.0)), 0.14) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)





















const SPRAY_AMOUNT: int = 42
const SPRAY_LIFE: float = 0.55
var _bottle_spray: GeometryInstance3D = null
func _spray_bottles(nodes: Array, dir: Vector3, speed: float) -> void:
	if nodes.is_empty():
		return

	var mid: Vector3 = Vector3.ZERO
	var lo: Vector3 =(nodes[0] as Node3D).position
	var hi: Vector3 = lo
	for nd in nodes:
		var p: Vector3 =(nd as Node3D).position
		mid += p
		lo = Vector3(minf(lo.x, p.x), 0.0, minf(lo.z, p.z))
		hi = Vector3(maxf(hi.x, p.x), 0.0, maxf(hi.z, p.z))
	mid /= float(nodes.size())
	if _bottle_spray == null:
		_bottle_spray = _make_bottle_spray()
		add_child(_bottle_spray)
	var pm: Resource = _bottle_spray.process_material
	pm.emission_box_extents = Vector3(
		maxf((hi.x - lo.x) * 0.5, 0.1), 0.06, maxf((hi.z - lo.z) * 0.5, 0.1))


	pm.direction =(dir * 0.55 + Vector3.UP).normalized()


	var kick: float = clampf(speed * 0.16, 0.9, 3.2)
	pm.initial_velocity_min = kick * 0.55
	pm.initial_velocity_max = kick * 2.1


	_bottle_spray.position = mid + Vector3(0.0, BOTTLE_H * 0.55, 0.0)


	_bottle_spray.emitting = false
	_bottle_spray.restart()
	_bottle_spray.emitting = true


func _make_bottle_spray() -> GeometryInstance3D:
	var p: GeometryInstance3D = Particulas.nodo()
	p.amount = SPRAY_AMOUNT
	p.one_shot = true
	p.explosiveness = 1.0
	p.lifetime = SPRAY_LIFE
	p.emitting = false
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	p.visibility_aabb = AABB(Vector3(-2.0, -0.5, -2.0), Vector3(4.0, 3.0, 4.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	pm.emission_box_extents = Vector3(0.3, 0.06, 0.1)
	pm.direction = Vector3(0.0, 1.0, 0.0)
	pm.spread = 48.0
	pm.gravity = Vector3(0.0, -11.0, 0.0)
	pm.initial_velocity_min = 0.8
	pm.initial_velocity_max = 2.6
	pm.scale_min = 0.45
	pm.scale_max = 1.05
	var c: Curve = Curve.new()

	c.add_point(Vector2(0.0, 1.0))
	c.add_point(Vector2(0.55, 0.7))
	c.add_point(Vector2(1.0, 0.0))

	pm.scale_curve = Particulas.curva(c)
	var grad: Gradient = Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 0.45, 1.0])
	grad.colors = PackedColorArray([
		Color(0.9, 0.95, 1.0, 0.92), Color(0.82, 0.9, 0.98, 0.62),
		Color(0.78, 0.88, 0.98, 0.0)])
	pm.color_ramp = Particulas.rampa(grad)
	p.process_material = pm
	var quad: QuadMesh = QuadMesh.new()




	quad.size = Vector2(0.055, 0.055)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	p.draw_pass_1 = quad
	return p


func water_bottle_pos(i: int) -> Vector3:
	if i < 0 or i >= _water_bottles.size():
		return Vector3.INF
	return _water_bottles[i].position


func water_bottle_count() -> int:
	return _water_bottles.size()


func water_bottle_down(i: int) -> bool:
	if i < 0 or i >= _water_bottles.size():
		return false
	return bool(_water_bottles[i].get_meta("down", false))






















const LOOSE_BOTTLE_ROW: float = 0.26
const LOOSE_BOTTLE_JITTER: float = 0.1











func spawn_loose_bottles(at: Vector3, n: int = 5, seed_i: int = 7,
		along: Vector3 = Vector3(0.0, 0.0, 1.0)) -> Array[Node3D]:
	var out: Array[Node3D] = []
	var rnd: RandomNumberGenerator = RandomNumberGenerator.new()
	rnd.seed = seed_i
	var dir: Vector3 = Vector3(along.x, 0.0, along.z)
	dir = dir.normalized() if dir.length() > 0.01 else Vector3(0.0, 0.0, 1.0)
	var mid: float = float(n - 1) * 0.5
	for i in n:
		var pos: Vector3 = at + dir *((float(i) - mid) * LOOSE_BOTTLE_ROW)
		pos.x += rnd.randf_range(- LOOSE_BOTTLE_JITTER, LOOSE_BOTTLE_JITTER)
		pos.z += rnd.randf_range(- LOOSE_BOTTLE_JITTER, LOOSE_BOTTLE_JITTER)
		pos.y = 0.0
		var root: Node3D = _water_bottle(pos, i)


		root.rotate_y(rnd.randf_range(0.0, TAU))
		out.append(root)
	return out



























func _catch_by_end(p: Vector3) -> bool:
	return (-4.0 - _ring_pad_z() - p.z) >=(absf(p.x) - _ring_x())
































func stand_seat_exists(p: Vector3) -> bool:
	if _catch_by_end(p):
		return _has_far_end if _flip else _has_near_end
	return _has_side_stand[1 if _wx(p.x) >= 0.0 else 0]















func stand_catch_spot(p: Vector3) -> Vector3:
	var rx: float = _ring_x()
	var zn: float = -4.0 - _ring_pad_z()







	if _catch_by_end(p):
		return Vector3(clampf(p.x, -18.0, 18.0), STAND_ROW_Y, zn - 14.4)
	return Vector3(signf(p.x) *(rx + 4.6), STAND_ROW_Y,
		clampf(p.z, 2.0, FIELD_DEPTH - 2.0))
































const SEAT_CLEAR_M: float = 0.25











const SEAT_CLEAR_ROWS: int = 2




















func seat_behind_cloth(seat: Vector3) -> bool:
	if seat == Vector3.INF:
		return true
	var inward: Vector3 = Vector3(- seat.x, 0.0, - seat.z)
	inward = inward.normalized() if inward.length() > 0.01 else Vector3(0.0, 0.0, 1.0)
	var p: Vector3 = seat + inward * BEER_FAN_FRONT



	var vivos: Array[MeshInstance3D] = []
	var tapa: bool = false
	for pano in _cloth_panels:
		if not is_instance_valid(pano):
			continue
		vivos.append(pano)
		if tapa:
			continue
		var q: QuadMesh = pano.mesh as QuadMesh
		if q == null:
			continue
		var l: Vector3 = pano.global_transform.affine_inverse() * p


		if absf(l.x) > q.size.x * 0.5:
			continue
		if l.y > q.size.y * 0.5 - SEAT_CLEAR_M or l.y < - q.size.y * 0.5:
			continue







		var uv_y: float = clampf((q.size.y * 0.5 - l.y) / maxf(q.size.y, 0.01), 0.0, 1.0)
		if l.z < 1.5 * TIFO_AMP_GALE * uv_y * uv_y:
			tapa = true
	_cloth_panels = vivos
	return tapa













func stand_catch_spot_clear(p: Vector3) -> Vector3:
	if not stand_seat_exists(p):
		return Vector3.INF
	var base: Vector3 = stand_catch_spot(p)
	if not seat_behind_cloth(base):
		return base
	for row in range(1, SEAT_CLEAR_ROWS + 1):
		var arriba: Vector3 = heckler_spot(p, row)
		if arriba != Vector3.INF and not seat_behind_cloth(arriba):
			return arriba
	return Vector3.INF




















func fan_row_step() -> Vector2:
	var a: Vector2 = _fan_row_at(0)
	var b: Vector2 = _fan_row_at(1)


	return Vector2(b.x - a.x, a.y - b.y)


























func heckler_spot(p: Vector3, row: int = 2) -> Vector3:





	if not stand_seat_exists(p):
		return Vector3.INF
	var base: Vector3 = stand_catch_spot(p)
	if row <= 0:
		return base
	var step: Vector2 = fan_row_step()








	var fuera: Vector3
	if _catch_by_end(p):
		fuera = Vector3(0.0, 0.0, -1.0)
	else:
		fuera = Vector3(1.0 if p.x >= 0.0 else -1.0, 0.0, 0.0)
	return base + fuera *(step.y * float(row)) + Vector3.UP *(step.x * float(row))






















const BEER_FAN_FRONT: float = 0.45




const BEER_FAN_PIXEL: float = 1.5 / 32.0










const BEER_HAND_UP: float = 0.52
const BEER_HAND_OUT: float = 0.22




const BEER_BOTTLE_SCALE: float = 1.6














func spawn_beer_fan(p: Vector3) -> Node3D:
	var frames: SpriteFrames = fan_frames(true)
	if frames == null:
		return null









	if p == Vector3.INF:
		return null
	if not stand_seat_exists(p):
		return null
	if seat_behind_cloth(p):
		return null






	var inward: Vector3 = Vector3(- p.x, 0.0, - p.z)
	inward = inward.normalized() if inward.length() > 0.01 else Vector3(0.0, 0.0, 1.0)
	var root: Node3D = Node3D.new()
	root.name = "BeerFan"
	add_child(root)
	root.position = p + inward * BEER_FAN_FRONT
	var fan: AnimatedSprite3D = AnimatedSprite3D.new()
	fan.sprite_frames = frames
	fan.pixel_size = BEER_FAN_PIXEL




	fan.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	fan.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	fan.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	fan.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

















	root.add_child(fan)
	fan.play("cheer" if frames.has_animation("cheer") else "idle")
	root.set_meta("fan", fan)





	var bot: Node3D = make_bottle(BOTTLE_BEER, BOTTLE_BEER_CAP)
	bot.scale = Vector3.ONE * BEER_BOTTLE_SCALE










	var mano: Node3D = Node3D.new()
	bot.position = Vector3(0.0, - BOTTLE_H * 0.6 * BEER_BOTTLE_SCALE, 0.0)
	mano.add_child(bot)
	mano.position = inward * BEER_HAND_OUT + Vector3(0.0, BEER_HAND_UP, 0.0)
	root.add_child(mano)



	root.set_meta("botella", mano)
	return root


















const STREET_OUT_Z: float = 8.0
const STREET_HALF_W: float = 20.0









func street_catch_spot(p: Vector3) -> Vector3:
	return Vector3(clampf(p.x, - STREET_HALF_W, STREET_HALF_W), 0.0,
		- FENCE_END_OUT - _ring_pad_z() - STREET_OUT_Z)





























const FENCE_Z_MIN: float = 8.0
const FENCE_Z_MAX: float = 30.0
const FENCE_IN_M: float = 1.3







const FENCE_OUT_M: float = 0.5
const FENCE_HUG_M: float = 0.7











const CAM_BOWL_Z_MIN: float = -7.0
const CAM_BOWL_IN_M: float = 1.5

func camera_bowl() -> Dictionary:
	return {
		"hx": _ring_x() - CAM_BOWL_IN_M,
		"z_min": CAM_BOWL_Z_MIN - _ring_pad_z(),
		"z_max": FIELD_DEPTH - CAM_BOWL_Z_MIN + _ring_pad_z(),
	}


func fence_hug_spot(z_hint: float) -> Dictionary:
	var rx: float = _ring_x()
	var z: float = clampf(z_hint, FENCE_Z_MIN, FENCE_Z_MAX)
	var hug: Vector3 = Vector3(rx + FENCE_HUG_M, 0.0, z)



	if not _people_near(hug, 14.0):
		return {}
	return {
		"pre": Vector3(rx - FENCE_IN_M, 0.0, z),
		"fence": Vector3(rx, 0.0, z),
		"land": Vector3(rx + FENCE_OUT_M, 0.0, z),
		"hug": hug,

		"face": Vector2(1.0, 0.0),
	}





func _people_near(p: Vector3, r: float) -> bool:
	p = _wp(p)
	var r2: float = r * r
	for b in _fan_buckets:
		var q: Vector3 = b.get("pos", Vector3.ZERO)
		if Vector2(q.x - p.x, q.z - p.z).length_squared() <= r2:
			return true
	return false














const BALLBOY_KIT: Color = Color("d8862c")
const BALLBOY_KIT2: Color = Color("3a3f4a")

















func _ref4_cfg() -> Dictionary:
	return RefKit.cfg_ahora()
const MEDIC_KIT: Color = Color("d94a4a")
const MEDIC_KIT2: Color = Color("f0f0f0")
const SIDELINE_H: float = 1.72

func _build_sideline() -> void:
	if backdrop:
		return
	var rx: float = _ring_x() + 1.1
	var zn: float = -4.0 - _ring_pad_z() - 1.1


	var boys: Array[Vector3] = [
		Vector3(- rx, 0.0, 22.0), Vector3(rx, 0.0, 34.0),
		Vector3(- rx, 0.0, 58.0), Vector3(rx, 0.0, 70.0),
	]




	var behind_from: int = boys.size()
	if div <= 2:
		boys.append(Vector3(-12.0, 0.0, zn))
		boys.append(Vector3(12.0, 0.0, zn))
	for i in boys.size():
		await _respira()
		var b: Node3D = _sideline_person(boys[i], "boy%d" % i,
			BALLBOY_KIT, BALLBOY_KIT2, true)
		if b != null:
			_vida_recinto.chicos.append(b)
		if b != null and i >= behind_from:
			_ball_boys.append(b)
	if div >= 3:
		return























	var ref4: Dictionary = _ref4_cfg()
	await _respira()
	var ref: Node3D = _sideline_person(
		Vector3(_dugout_x() + REF4_FROM_DUGOUT, 0.0, HALF_LINE), "ref4",
		ref4["kit"], ref4["kit2"], false, ref4)
	if ref != null:
		_build_sub_board(ref)
		ref.visible = false
	if div >= 2:
		return


	var mx: float = rx * 0.86
	await _respira()
	_sideline_person(Vector3(- mx, 0.0, zn - 1.0), "med0", MEDIC_KIT, MEDIC_KIT2, false)
	_sideline_person(Vector3(- mx - 1.5, 0.0, zn - 1.0), "med1", MEDIC_KIT, MEDIC_KIT2, false)
	var lit: MeshInstance3D = MeshInstance3D.new()
	var lm: BoxMesh = BoxMesh.new()
	lm.size = Vector3(0.5, 1.9, 0.12)
	lit.mesh = lm
	var lmat: StandardMaterial3D = StandardMaterial3D.new()
	lmat.albedo_color = Color("2b3038")
	lit.material_override = lmat
	lit.position = Vector3(- mx - 0.75, 0.95, zn - 1.35)
	lit.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(lit)










func _sideline_person(pos: Vector3, tag: String, kit: Color, kit2: Color,
		sit: bool, extra: Dictionary = {}) -> Node3D:




	if venue_empty:
		return null
	var base: Dictionary = {"kit": kit, "kit2": kit2}
	base.merge(extra, true)
	var cfg: Dictionary = KitRecolor.appearance_for(
		"%s_%s" % [_pitch_seed_club(), tag], base)
	if tag.begins_with("boy"):
		cfg = KitRecolor.infantil(cfg)
	var frames: SpriteFrames = _person_frames(cfg)
	if frames == null:
		return null
	var root: Node3D = Node3D.new()
	root.position = pos

	root.rotation_degrees = Vector3(0.0, rad_to_deg(atan2(- pos.x, HALF_LINE - pos.z)), 0.0)
	add_child(root)

	_register_occluder(root)
	var man: AnimatedSprite3D = AnimatedSprite3D.new()
	man.sprite_frames = frames
	man.pixel_size =(SIDELINE_H * 0.72 if sit else SIDELINE_H) / PERSON_BODY_PX
	man.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	man.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	man.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	man.position = Vector3(0.0, _person_feet(man.pixel_size), 0.0)
	root.add_child(man)
	man.play("idle")


	root.set_meta("man", man)
	root.set_meta("down", false)
	if sit:


		var ball: MeshInstance3D = MeshInstance3D.new()
		var sm: SphereMesh = SphereMesh.new()
		sm.radius = 0.11
		sm.height = 0.22
		sm.radial_segments = 8
		sm.rings = 4
		ball.mesh = sm
		var bmat: StandardMaterial3D = StandardMaterial3D.new()
		bmat.albedo_color = Color("f2f2f2")
		ball.material_override = bmat
		ball.position = Vector3(0.42, 0.11, 0.12)
		ball.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(ball)
		root.set_meta("ball", ball)
	return root






func _build_sub_board(ref: Node3D) -> void:





















	var img: Image = _board_canvas()
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var board: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()







	q.size = ADDED_BOARD_SIZE
	board.mesh = q
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST












	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	board.material_override = mat

	board.position = Vector3(0.0, SUB_BOARD_Y, 0.28)
	board.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	ref.add_child(board)



	_sub_board = board
	_sub_board_mat = mat
	_sub_board_face = tex
	_sub_board_size = q.size
	_build_ref_arms(ref)




































const REF_CARTEL_SHEET: String = "res://assets/sprites/anim/ref4_cartel_south_"




const REF_CARTEL_HAND_ROW: Array[int] = [40, 32, 15, 20]








func _build_ref_arms(ref: Node3D) -> void:
	var man: AnimatedSprite3D = ref.get_meta("man", null)
	if man == null or man.sprite_frames == null:
		return
	var frames: SpriteFrames = man.sprite_frames



	var cfg: Dictionary = KitRecolor.appearance_for(
		"%s_ref4" % _pitch_seed_club(), _ref4_cfg())
	frames.add_animation("cartel")
	frames.set_animation_loop("cartel", false)
	for i in REF_CARTEL_HAND_ROW.size():
		var path: String = "%s%02d.png" % [REF_CARTEL_SHEET, i]
		if not ResourceLoader.exists(path):




			frames.remove_animation("cartel")
			return
		frames.add_frame("cartel", KitRecolor.apply(load(path), cfg))
	_ref_man = man









func _ref_pose(i: int) -> float:
	if _ref_man == null or not is_instance_valid(_ref_man):
		return SUB_BOARD_Y
	var k: int = clampi(i, 0, REF_CARTEL_HAND_ROW.size() - 1)
	if k == 0:
		_ref_man.play("idle")
	else:
		_ref_man.play("cartel")
		_ref_man.pause()
		_ref_man.frame = k
	var ps: float = _ref_man.pixel_size



	var h: float = 92.0
	var tex: Texture2D = _ref_man.sprite_frames.get_frame_texture("cartel", k)
	if tex != null:
		h = float(tex.get_height())
	var row: float = float(REF_CARTEL_HAND_ROW[k])
	return _ref_man.position.y +(h * 0.5 - row) * ps












































func show_added_time(mins: int) -> void:
	if mins <= 0:
		return
	_ensure_ref4()
	_raise_board(_added_time_face(mins))













func ref4_spot() -> Vector3:
	if _sub_board == null or not is_instance_valid(_sub_board):
		return Vector3.ZERO
	return (_sub_board.get_parent() as Node3D).global_position


func ref4_facing() -> Vector3:
	if _sub_board == null or not is_instance_valid(_sub_board):
		return Vector3.FORWARD
	return (_sub_board.get_parent() as Node3D).global_transform.basis.z.normalized()























func _ensure_ref4() -> void:
	if _sub_board == null or not is_instance_valid(_sub_board):
		return
	_ref4_gen += 1
	var ref: Node3D = _sub_board.get_parent() as Node3D
	if ref != null and is_instance_valid(ref):
		ref.visible = true






const REF4_LINGER: float = 1.2






var _ref4_gen: int = 0


func _retire_ref4_soon() -> void:
	_ref4_gen += 1
	var mine: int = _ref4_gen
	await SceneFade.timer(REF4_LINGER).timeout
	if mine != _ref4_gen:
		return
	_retire_ref4()


func _retire_ref4() -> void:
	if _sub_board == null or not is_instance_valid(_sub_board):
		return
	var ref: Node3D = _sub_board.get_parent() as Node3D
	if ref != null and is_instance_valid(ref):
		ref.visible = false








func show_sub_board(out_num: int, in_num: int) -> void:
	_ensure_ref4()
	_raise_board(_sub_num_face(out_num, in_num))






func _raise_board(face: ImageTexture) -> void:
	if _sub_board == null or not is_instance_valid(_sub_board):
		return
	_kill_board_tweens()
	var q: QuadMesh = _sub_board.mesh
	q.size = ADDED_BOARD_SIZE
	_sub_board_mat.albedo_texture = face
	_sub_board.rotation_degrees = Vector3.ZERO
	var quieto: bool = Settings.reduce_motion
	_board_tw = create_tween()
	if not quieto:


		_board_tw.tween_property(_sub_board, "position:y",
			SUB_BOARD_Y - ADDED_BOARD_DIP, 0.12) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)





	for k in range(1, REF_CARTEL_HAND_ROW.size()):
		_board_tw.tween_callback(_board_to_pose.bind(k))
		_board_tw.tween_interval(0.08 if not quieto else 0.05)
	if quieto:
		_board_tw.tween_interval(ADDED_BOARD_HOLD)
	else:


		var dim: Color = Color(0.3, 0.3, 0.34)
		for _i in 2:
			_board_tw.tween_property(_sub_board_mat, "albedo_color", dim, 0.05)
			_board_tw.tween_property(_sub_board_mat, "albedo_color", Color.WHITE, 0.05)




		var sweep: float = maxf(ADDED_BOARD_HOLD - 0.2, 0.6) / 4.0
		_board_tw.tween_property(_sub_board, "rotation_degrees:y",
			ADDED_BOARD_SWAY, sweep) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		_board_tw.tween_property(_sub_board, "rotation_degrees:y",
			- ADDED_BOARD_SWAY, sweep * 2.0) \
					.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		_board_tw.tween_property(_sub_board, "rotation_degrees:y", 0.0, sweep) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)


	for k2 in range(REF_CARTEL_HAND_ROW.size() - 2, -1, -1):
		_board_tw.tween_callback(_board_to_pose.bind(k2))
		_board_tw.tween_interval(0.07 if not quieto else 0.04)
	_board_tw.tween_callback(_restore_sub_board)






func _board_to_pose(k: int) -> void:
	if _sub_board == null or not is_instance_valid(_sub_board):
		return
	var hand_y: float = _ref_pose(k)
	if k == 0:
		_sub_board.position.y = SUB_BOARD_Y
		return





	var qm: QuadMesh = _sub_board.mesh
	_sub_board.position.y = hand_y + qm.size.y * 0.5 - BOARD_GRIP







func _kill_board_tweens() -> void:
	if _board_tw and _board_tw.is_valid():
		_board_tw.kill()










func _restore_sub_board() -> void:
	if _sub_board == null or not is_instance_valid(_sub_board):
		return
	var q: QuadMesh = _sub_board.mesh
	q.size = _sub_board_size
	_sub_board_mat.albedo_texture = _sub_board_face
	_sub_board_mat.albedo_color = Color.WHITE
	_sub_board.rotation_degrees = Vector3.ZERO
	_sub_board.position.y = SUB_BOARD_Y



	_ref_pose(0)




	_retire_ref4_soon()


























const BOARD_TEX: Vector2i = Vector2i(60, 40)
const BOARD_CELL: int = 4
const BOARD_COLS: int = 13
const BOARD_ROWS: int = 7
const BOARD_SCREEN: Vector2i = Vector2i(4, 4)

const BOARD_PLUS: Array = [0, 2, 7, 2, 0]

func _added_time_face(mins: int) -> ImageTexture:
	var key: int = clampi(mins, 1, 99)
	if _added_face.has(key):
		return _added_face[key]
	var img: Image = _board_canvas()




	var digits: String = str(key)
	var cells: int = 4 + digits.length() * 4 - 1
	var col: int =(BOARD_COLS - cells) / 2
	_board_glyph(img, BOARD_PLUS, col, 1, BOARD_AMBER)
	col += 4
	for i in digits.length():
		var bits: Array = PixelText.FONT.get(digits[i], BOARD_PLUS)
		_board_glyph(img, bits, col, 1, BOARD_AMBER)
		col += 4
	_added_face[key] = ImageTexture.create_from_image(img)
	return _added_face[key]












func _sub_num_face(out_num: int, in_num: int) -> ImageTexture:
	var key: int = clampi(out_num, 0, 99) * 100 + clampi(in_num, 0, 99)
	if _sub_face.has(key):
		return _sub_face[key]
	var img: Image = _board_canvas()
	_board_number(img, clampi(out_num, 0, 99), 0, Color("e03c3c"))
	_board_number(img, clampi(in_num, 0, 99), 7, Color("46d05a"))
	_sub_face[key] = ImageTexture.create_from_image(img)
	return _sub_face[key]





func _board_number(img: Image, n: int, col0: int, on: Color) -> void:
	var digits: String = str(n)
	var start: int = col0 +(0 if digits.length() >= 2 else 1)
	for i in digits.length():
		var bits: Array = PixelText.FONT.get(digits[i], BOARD_PLUS)
		_board_glyph(img, bits, start + i * 3, 1, on)





func _board_canvas() -> Image:
	var img: Image = Image.create(BOARD_TEX.x, BOARD_TEX.y, false, Image.FORMAT_RGB8)
	img.fill(Color("31353d"))

	for x in BOARD_TEX.x:
		img.set_pixel(x, 0, Color("4a505c"))
		img.set_pixel(x, BOARD_TEX.y - 2, Color("1b1e24"))
		img.set_pixel(x, BOARD_TEX.y - 1, Color("15171c"))


	for hx in [10, 40]:
		for x in range(hx, hx + 10):
			for y in range(BOARD_TEX.y - 6, BOARD_TEX.y - 2):
				img.set_pixel(x, y, Color("22252b"))

	for cy in BOARD_ROWS:
		for cx in BOARD_COLS:
			_board_dot(img, cx, cy, BOARD_OFF)

	for y in range(BOARD_SCREEN.y - 1, BOARD_SCREEN.y + BOARD_ROWS * BOARD_CELL + 1):
		for x in range(BOARD_SCREEN.x - 1, BOARD_SCREEN.x + BOARD_COLS * BOARD_CELL + 1):
			if (x - BOARD_SCREEN.x) % BOARD_CELL == BOARD_CELL - 1 \
					or (y - BOARD_SCREEN.y) % BOARD_CELL == BOARD_CELL - 1 \
					or x < BOARD_SCREEN.x or y < BOARD_SCREEN.y:
				img.set_pixel(x, y, Color("05060a"))

	img.set_pixel(BOARD_TEX.x - 4, BOARD_TEX.y - 4, Color("3ad06a"))
	img.set_pixel(BOARD_TEX.x - 3, BOARD_TEX.y - 4, Color("2a9850"))
	return img





func _board_dot(img: Image, cx: int, cy: int, col: Color) -> void:
	var x0: int = BOARD_SCREEN.x + cx * BOARD_CELL
	var y0: int = BOARD_SCREEN.y + cy * BOARD_CELL
	for y in 3:
		for x in 3:
			var px: int = x0 + x
			var py: int = y0 + y
			if px >= BOARD_TEX.x or py >= BOARD_TEX.y:
				continue
			var core: bool = x == 1 and y == 1
			img.set_pixel(px, py, col.lightened(0.35) if core else col)




func _board_glyph(img: Image, bits: Array, col: int, row: int, on: Color) -> void:
	for y in mini(bits.size(), BOARD_ROWS - row):
		var b: int = int(bits[y])
		for x in 3:
			if (b>>(2 - x))&1:
				_board_dot(img, col + x, row + y, on)


func _build_tv_cameras() -> void:


	var d: int = div
	if d >= 3:
		return



	var rx: float = _ring_x() + 1.2


	_tv_cam(Vector3(rx, TV_GANTRY_H, HALF_LINE), true)
	if d > 1:
		return


	var pad: float = _ring_pad_z()
	_tv_cam(Vector3(-9.0, TV_CAM_H, -5.2 - pad), false)
	_tv_cam(Vector3(9.0, TV_CAM_H, FIELD_DEPTH + 5.2 + pad), false)





func _tv_cam(pos: Vector3, gantry: bool) -> void:
	var dark: StandardMaterial3D = StandardMaterial3D.new()
	dark.albedo_color = Color("22262e")
	dark.roughness = 0.85
	var root: Node3D = Node3D.new()
	root.position = pos
	add_child(root)


	_register_occluder(root)


	var leg: MeshInstance3D = MeshInstance3D.new()
	var leg_mesh: CylinderMesh = CylinderMesh.new()
	leg_mesh.top_radius = 0.09 if gantry else 0.05
	leg_mesh.bottom_radius = 0.16 if gantry else 0.11
	leg_mesh.height = pos.y
	leg.mesh = leg_mesh
	leg.material_override = dark
	leg.position = Vector3(0.0, - pos.y * 0.5, 0.0)
	leg.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(leg)
	var deck: MeshInstance3D = null
	if gantry:

		deck = MeshInstance3D.new()
		var deck_mesh: BoxMesh = BoxMesh.new()
		deck_mesh.size = Vector3(1.5, 0.12, 1.5)
		deck.mesh = deck_mesh
		deck.material_override = dark
		deck.position = Vector3(0.0, -0.5, 0.0)
		deck.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(deck)
	var head: Node3D = Node3D.new()
	root.add_child(head)
	var body: MeshInstance3D = MeshInstance3D.new()
	var body_mesh: BoxMesh = BoxMesh.new()
	body_mesh.size = Vector3(0.34, 0.3, 0.62)
	body.mesh = body_mesh
	body.material_override = dark
	body.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	head.add_child(body)

	var lens: MeshInstance3D = MeshInstance3D.new()
	var lens_mesh: CylinderMesh = CylinderMesh.new()
	lens_mesh.top_radius = 0.11
	lens_mesh.bottom_radius = 0.13
	lens_mesh.height = 0.34
	lens.mesh = lens_mesh
	lens.material_override = dark
	lens.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	lens.position = Vector3(0.0, 0.02, -0.44)
	lens.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	head.add_child(lens)
	preload("res://features/stadium/tv_camera_detail.gd").soporte(root, leg, deck, pos.y, gantry)
	preload("res://features/stadium/tv_camera_detail.gd").camara(body, lens, -1.0)

	var home_look: Vector3 = Vector3(0.0, 1.0, HALF_LINE)
	head.look_at(home_look, Vector3.UP)
	_tv_cams.append({"head": head, "rest": home_look,
		"phase": float(_tv_cams.size()) * 1.7})





func set_tv_focus(pos: Vector3) -> void:
	_tv_focus = pos


func _tick_tv_cams(delta: float) -> void:
	if _tv_cams.is_empty():
		return
	_tv_t += delta
	for c in _tv_cams:
		var head: Node3D = c["head"]
		var target: Vector3 = _tv_focus
		if target == Vector3.INF:

			var sweep: float = sin(_tv_t * 0.25 + float(c["phase"])) \
					* deg_to_rad(TV_SWEEP_DEG)
			var rest: Vector3 = c["rest"]
			var to_rest: Vector3 = rest - head.global_position
			target = head.global_position + to_rest.rotated(Vector3.UP, sweep)



		var want: Transform3D = head.global_transform.looking_at(target, Vector3.UP)
		head.global_transform = head.global_transform.interpolate_with(
			want, minf(1.0, delta * TV_PAN_SPEED))
































const SOMBRA_MOVIL_CORTE: float = 0.3
const SOMBRA_MOVIL_SESGO: float = 4.0

static var sombra_movil: int = -1


static func sombra_barata() -> bool:
	if sombra_movil >= 0:
		return sombra_movil == 1
	return Settings.es_android()






static func sombra_sol_movil(sun: DirectionalLight3D, barata: bool, sesgo: float,
		normal: float) -> void:
	var k: float = SOMBRA_MOVIL_SESGO if barata else 1.0
	sun.shadow_bias = sesgo * k
	sun.shadow_normal_bias = normal * k
	if barata:
		sun.directional_shadow_mode = DirectionalLight3D.SHADOW_PARALLEL_2_SPLITS
		sun.directional_shadow_split_1 = SOMBRA_MOVIL_CORTE
		sun.directional_shadow_blend_splits = false
	else:
		sun.directional_shadow_mode = DirectionalLight3D.SHADOW_PARALLEL_4_SPLITS
		sun.directional_shadow_split_1 = 0.1
		sun.directional_shadow_blend_splits = true











func set_sun_shadow(on: bool) -> void:
	if _sun != null:
		_sun.shadow_enabled = on and not Settings.calidad_baja and Settings.sombra_permitida()


func _build_lighting() -> void:
	var sun: DirectionalLight3D = DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-52.0, -28.0, 0.0)
	sun.light_energy = 1.15



	sun.shadow_enabled = not Settings.calidad_baja and Settings.sombra_permitida()

	sun.shadow_bias = 0.04
	sun.shadow_normal_bias = 0.45
	sun.directional_shadow_max_distance = 140.0
	sun.directional_shadow_blend_splits = true













	if _train:
		sun.directional_shadow_max_distance = 120.0
		sun.shadow_normal_bias = 0.05
		sun.shadow_bias = 0.012
		sun.directional_shadow_blend_splits = true


	if sombra_barata() and not _train:
		sombra_sol_movil(sun, true, sun.shadow_bias, sun.shadow_normal_bias)
	_bowl_root().add_child(sun)
	_sun = sun





	var bolt: DirectionalLight3D = DirectionalLight3D.new()
	bolt.rotation_degrees = Vector3(-74.0, 46.0, 0.0)
	bolt.light_energy = 0.0
	bolt.light_color = Color(0.92, 0.95, 1.0)
	bolt.shadow_enabled = false
	bolt.visible = false
	_bowl_root().add_child(bolt)
	_bolt = bolt
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_SKY
	var sky: Sky = Sky.new()
	var sky_mat: ProceduralSkyMaterial = ProceduralSkyMaterial.new()
	sky_mat.sky_top_color = Color("3a6fb5")
	sky_mat.sky_horizon_color = Color("a8c4dd")
	sky_mat.ground_bottom_color = Color("8fa8a0")
	sky_mat.ground_horizon_color = Color("a8c4dd")




	sky_mat.sky_curve = 0.15
	sky_mat.ground_curve = 0.02
	sky_mat.sun_angle_max = 30.0
	sky_mat.sun_curve = 0.15
	sky.sky_material = sky_mat
	_sky_mat = sky_mat
	env.sky = sky
	env.ambient_light_source = Environment.AMBIENT_SOURCE_SKY
	env.ambient_light_energy = 1.0




	env.glow_enabled = false
	env.glow_bloom = 0.0
	env.glow_hdr_threshold = 1.1
	env.glow_intensity = 0.6
	for i in 7:
		env.set_glow_level(i, 1.0 if (i == 2 or i == 4) else 0.0)




	env.fog_enabled = true
	env.fog_density = 0.0015
	env.fog_light_color = Color("a8c4dd")
	env.fog_sky_affect = 0.15
	_env = env
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	add_child(we)












const AZOTEA_CONCRETE: Color = Color("70747c")
const AZOTEA_FENCE_H: float = 5.2
const AZOTEA_DROP: float = 44.0
const AZOTEA_TORII_RED: Color = Color("d8402a")



const AZOTEA_FOG_INI: float = 110.0
const AZOTEA_FOG_FIN: float = 350.0

const AZOTEA_LLUVIA_ALFA: float = 0.35

const AZOTEA_CAL_BRILLO: float = 0.6

const AZOTEA_FOCO: Color = Color(1.6, 1.65, 1.75)

const AZOTEA_VIADUCTO: Color = Color("3a3f4c")




const AZOTEA_NEON: Array = [
	Color("ee6fa5"), Color("ffb63c"), Color("35d0e0"),
	Color("e0402a"), Color("7de08a"), Color("c08cf0"),
]






func _tick_roof(delta: float) -> void:



	if not _roof_vapor_em.is_empty():
		_roof_vapor_on()
	for s in _roof_screens:
		s["t"] += delta
		if s["t"] < float(s["period"]):
			continue
		s["t"] = 0.0
		s["i"] =(int(s["i"]) + 1) %(s["frames"] as Array).size()
		var f: ImageTexture = s["frames"][s["i"]]
		var m: StandardMaterial3D = s["mat"]


		m.albedo_texture = f
	_roof_beacon_t += delta










	for i in _roof_beacon_mats.size():
		var on: bool = fmod(_roof_beacon_t * 0.8 + float(i) * 0.37, 1.0) < 0.5
		var m2: StandardMaterial3D = _roof_beacon_mats[i]
		m2.albedo_color = BEACON_ON if on else BEACON_OFF



	if _avion != null:
		_avion_t = fmod(_avion_t + delta, AVION_T + AVION_PAUSA)
		var cruzando: bool = _avion_t < AVION_T
		_avion.visible = cruzando
		if cruzando:
			_avion.position.x = lerpf(- AVION_X, AVION_X, _avion_t / AVION_T)

			_avion_estrobo.visible = fmod(_avion_t, 1.5) < 0.12




const NEON_POR_CUADRANTE: int = 4

const NEON_ANCHO_MIN: float = 11.0

var _roof_neon_cuota: Array[int] = [0, 0, 0, 0]






func _roof_cuadrante(pos2: Vector2) -> int:
	var d: Vector2 = pos2 - Vector2(0.0, HALF_LINE)
	if d.length() < 0.01:
		return 0
	var a: float = fposmod(d.angle(), TAU)
	return clampi(int(a /(TAU / 4.0)), 0, 3)













func _roof_tren() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20260906












	_build_railway(Vector2(0.0, HALF_LINE), rng, 70.0, 15.0, AZOTEA_VIADUCTO, 30.0)




	if _rail_glow != null:
		_rail_glow.visible = true




var _roof_vapor_em: Array[GeometryInstance3D] = []















func _roof_vapor(root: Node3D) -> void:
	_roof_vapor_em.clear()
	if _roof_torres.size() < 6:
		return
	for idx in [1, 4, 6]:
		var t: Array = _roof_torres[idx % _roof_torres.size()]




		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.albedo_color = Color(0.72, 0.75, 0.8, 0.16)
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED







		mat.albedo_texture = _smoke_texture()
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		mat.vertex_color_use_as_albedo = true
		var quad: QuadMesh = QuadMesh.new()
		quad.size = Vector2(2.6, 2.6)
		quad.material = mat
		var em: GeometryInstance3D = Particulas.nodo()
		var pm: Resource = Particulas.proceso()
		var rampa: Gradient = Gradient.new()
		rampa.set_color(0, Color(1.0, 1.0, 1.0, 0.0))
		rampa.set_color(1, Color(1.0, 1.0, 1.0, 0.0))
		rampa.add_point(0.18, Color(1.0, 1.0, 1.0, 1.0))
		rampa.add_point(0.6, Color(1.0, 1.0, 1.0, 0.8))

		pm.color_ramp = Particulas.rampa(rampa)
		pm.direction = Vector3(0.0, 1.0, 0.0)
		pm.spread = 6.0
		pm.initial_velocity_min = 1.4
		pm.initial_velocity_max = 2.6
		pm.gravity = Vector3(0.4, 0.5, 0.0)
		pm.scale_min = 1.0
		pm.scale_max = 2.4
		em.process_material = pm
		em.draw_pass_1 = quad
		em.amount = 12
		em.lifetime = 6.0
		em.preprocess = 6.0
		em.fixed_fps = 15
		em.emitting = false
		em.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		em.visibility_aabb = AABB(Vector3(-8.0, -2.0, -8.0), Vector3(16.0, 26.0, 16.0))
		em.position = Vector3(float(t[0]) + 2.0, float(t[3]) + 0.6, float(t[1]) + 1.5)
		root.add_child(em)




		if t.size() > 4 and t[4] is Node3D and is_instance_valid(t[4]):
			_adopt(t[4], em)
		_roof_vapor_em.append(em)




func _roof_vapor_on() -> void:
	for em in _roof_vapor_em:
		if is_instance_valid(em):
			em.emitting = true
	_roof_vapor_em.clear()



const VECINOS_N: int = 31
















func _roof_vecinos(root: Node3D) -> void:
	if _roof_torres.is_empty():
		return
	var hoja: SpriteFrames = _build_fan_frames("fan_blue", {})
	if hoja == null or not hoja.has_animation("idle") or hoja.get_frame_count("idle") == 0:
		return
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = hoja.get_frame_texture("idle", 0)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y


	mat.vertex_color_use_as_albedo = true

	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(1.4, 1.9)
	quad.material = mat

	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.use_colors = true
	mm.mesh = quad
	mm.instance_count = VECINOS_N

	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20260906
	var centro: Vector2 = Vector2(0.0, HALF_LINE)
	for i in VECINOS_N:
		var t: Array = _roof_torres[i % _roof_torres.size()]
		var tx: float = float(t[0])
		var tz: float = float(t[1])
		var tw2: float = float(t[2])
		var top: float = float(t[3])

		var hacia: Vector2 =(centro - Vector2(tx, tz)).normalized()
		var lado: Vector2 = Vector2(- hacia.y, hacia.x)
		var p: Vector2 = Vector2(tx, tz) + hacia *(tw2 * 0.5 - 0.8) \
				+ lado * rng.randf_range(- tw2 * 0.42, tw2 * 0.42)
		var tr: Transform3D = Transform3D(Basis(), Vector3(p.x, top + 0.95, p.y))
		mm.set_instance_transform(i, tr)
		mm.set_instance_color(i, AZOTEA_NEON[rng.randi() % AZOTEA_NEON.size()].darkened(0.45))

	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


	mmi.name = "OccVecinos"
	root.add_child(mmi)





	_register_occluder(mmi)



const AVION_T: float = 34.0
const AVION_PAUSA: float = 26.0
const AVION_X: float = 330.0
const AVION_Y: float = 120.0
const AVION_Z: float = -250.0
















func _roof_avion(root: Node3D) -> void:
	_avion = Node3D.new()
	root.add_child(_avion)
	_avion.position = Vector3(- AVION_X, AVION_Y, AVION_Z)
	_avion_estrobo = _avion_luz(_avion, Vector3(-7.0, 0.0, 0.0), Color(2.2, 2.2, 2.4))
	_avion_luz(_avion, Vector3.ZERO, Color(1.8, 0.3, 0.25))
	_avion.visible = false



func _avion_luz(padre: Node3D, off: Vector3, col: Color) -> Node3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	mat.disable_fog = true
	var esf: SphereMesh = SphereMesh.new()
	esf.radius = 1.1
	esf.height = 2.2
	esf.radial_segments = 6
	esf.rings = 3
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = esf
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = off
	padre.add_child(mi)
	return mi




func _roof_beacon(pos: Vector3) -> void:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = Color("ff4040")
	mat.emission_enabled = true
	mat.emission = Color("ff4040")
	mat.emission_energy_multiplier = 2.6
	var esf: SphereMesh = SphereMesh.new()
	esf.radius = 0.3
	esf.height = 0.6
	_city_mesh(pos, esf, mat)
	_roof_beacon_mats.append(mat)




















var _occ_cap_bowl: int = -1
var _occ_cap_root: int = -1
var _occ_cap_node: Node3D = null


func _roof_occ_ini(root: Node3D) -> void:
	_occ_cap_node = root
	_occ_cap_bowl = _bowl_root().get_child_count()
	_occ_cap_root = root.get_child_count() if root != null else 0







func _roof_occ_fin(nombre: String) -> Node3D:
	if _occ_cap_bowl < 0:
		return null
	var bowl: Node3D = _bowl_root()
	var nuevos: Array[Node3D] = []
	for i in range(_occ_cap_bowl, bowl.get_child_count()):
		var h: Node = bowl.get_child(i)
		if h is Node3D:
			nuevos.append(h)
	if _occ_cap_node != null and is_instance_valid(_occ_cap_node):
		for i in range(_occ_cap_root, _occ_cap_node.get_child_count()):
			var h2: Node = _occ_cap_node.get_child(i)
			if h2 is Node3D:
				nuevos.append(h2)
	_occ_cap_bowl = -1
	_occ_cap_root = -1
	_occ_cap_node = null
	if nuevos.is_empty():
		return null
	var grupo: Node3D = Node3D.new()
	grupo.name = nombre
	bowl.add_child(grupo)
	for n in nuevos:
		_adopt(grupo, n)
	_register_occluder(grupo)



	return grupo


func _build_roof() -> void:
	var root: Node3D = Node3D.new()
	root.name = "Azotea"
	add_child(root)







	_roof_occ_ini(root)
	_roof_edge(root)
	_roof_occ_fin("OccBorde")
	_roof_fence(root)
	_roof_city_below(root)
	_roof_canyon(root)
	_roof_occ_ini(root)
	_roof_crane(root)
	_roof_occ_fin("OccGrua")
	_roof_occ_ini(root)
	_roof_flag(root)
	_roof_occ_fin("OccBandera")
	_roof_occ_ini(root)
	_roof_tarp(root)
	_roof_occ_fin("OccLona")
	_roof_occ_ini(root)
	_roof_fuji(root)
	_roof_occ_fin("OccFuji")
	_roof_occ_ini(root)
	_roof_torii(root)
	_roof_occ_fin("OccTorii")
	_roof_occ_ini(root)
	_roof_props(root)
	_roof_occ_fin("OccTrastos")
	_roof_sakura(root)
	_roof_masts(root)
	_roof_occ_ini(root)
	_roof_onlookers(root)
	_roof_occ_fin("OccMirones")




	_roof_vapor(root)
	_roof_vecinos(root)
	_roof_avion(root)
	_roof_tren()










func _roof_fachada_nitida(mat: StandardMaterial3D) -> void:
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS






func _roof_edge(_root: Node3D) -> void:
	var x0: float = _wx0
	var x1: float = _wx0 + float(_tw) / TEXELS_PER_M
	var z0: float = _wz0
	var z1: float = _wz0 + float(_th) / TEXELS_PER_M
	var par: StandardMaterial3D = StandardMaterial3D.new()
	par.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	par.albedo_color = AZOTEA_CONCRETE.darkened(0.25)
	var cx: float =(x0 + x1) * 0.5
	var cz: float =(z0 + z1) * 0.5
	var wx: float = x1 - x0
	var wz: float = z1 - z0

	for e in [[Vector3(cx, 0.45, z0), Vector3(wx, 0.9, 0.5)],
			[Vector3(cx, 0.45, z1), Vector3(wx, 0.9, 0.5)],
			[Vector3(x0, 0.45, cz), Vector3(0.5, 0.9, wz)],
			[Vector3(x1, 0.45, cz), Vector3(0.5, 0.9, wz)]]:
		_city_mesh(e[0], _box(e[1]), par)


	for f in [[Vector3(cx, - AZOTEA_DROP * 0.5, z0 - 0.3), Vector3(wx, AZOTEA_DROP, 0.6)],
			[Vector3(cx, - AZOTEA_DROP * 0.5, z1 + 0.3), Vector3(wx, AZOTEA_DROP, 0.6)],
			[Vector3(x0 - 0.3, - AZOTEA_DROP * 0.5, cz), Vector3(0.6, AZOTEA_DROP, wz)],
			[Vector3(x1 + 0.3, - AZOTEA_DROP * 0.5, cz), Vector3(0.6, AZOTEA_DROP, wz)]]:
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.albedo_texture = _facade_texture(Color("3c4250"), true, 4451, true)
		_roof_fachada_nitida(mat)
		mat.uv1_scale = Vector3(maxf((f[1] as Vector3).x,(f[1] as Vector3).z) / 14.0,
			AZOTEA_DROP / 14.0, 1.0)
		_city_mesh(f[0], _box(f[1]), mat)





func _roof_fence(root: Node3D) -> void:
	var fx: float = FIELD_HALF_W + 2.6
	var fz0: float = -5.0
	var fz1: float = FIELD_DEPTH + 5.0
	var tex: ImageTexture = _roof_mesh_texture()


	var post: StandardMaterial3D = StandardMaterial3D.new()
	post.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	post.albedo_color = Color("2f9e44")
	var cz: float =(fz0 + fz1) * 0.5



	var spans: Array = [
		[Vector3(0.0, 0.0, fz0), fx * 2.0, 0.0, 0.0],
		[Vector3(0.0, 0.0, fz1), fx * 2.0, 0.0, 180.0],
		[Vector3(- fx, 0.0, cz), fz1 - fz0, 90.0, 90.0],
		[Vector3(fx, 0.0, cz), fz1 - fz0, 90.0, 270.0],
	]
	for s in spans:
		var pos: Vector3 = s[0]
		var length: float = s[1]
		var yaw: float = s[2]






		var panel: Node3D = Node3D.new()
		root.add_child(panel)


		var post_i: StandardMaterial3D = post.duplicate()
		var mesh: MeshInstance3D = MeshInstance3D.new()
		var quad: QuadMesh = QuadMesh.new()
		quad.size = Vector2(length, AZOTEA_FENCE_H)
		mesh.mesh = quad
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		mat.albedo_texture = tex
		mat.uv1_scale = Vector3(length / 2.0, AZOTEA_FENCE_H / 2.0, 1.0)
		mesh.material_override = mat
		mesh.position = pos + Vector3(0.0, AZOTEA_FENCE_H * 0.5, 0.0)
		mesh.rotation_degrees = Vector3(0.0, yaw, 0.0)
		mesh.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		panel.add_child(mesh)



		var dir: Vector3 = Vector3(cos(deg_to_rad(yaw)), 0.0, - sin(deg_to_rad(yaw)))
		_adopt(panel, _city_mesh(pos + Vector3(0.0, AZOTEA_FENCE_H, 0.0),
			_box(Vector3(0.14, 0.14, 0.14) + dir.abs() *(length - 0.14)), post_i))
		var n: int = int(length / 9.0)
		for i in n + 1:
			var t: float = float(i) / maxf(float(n), 1.0) - 0.5
			_adopt(panel, _city_mesh(pos + dir *(t * length)
				+ Vector3(0.0, AZOTEA_FENCE_H * 0.5, 0.0),
				_box(Vector3(0.16, AZOTEA_FENCE_H, 0.16)), post_i))


		var lona: MeshInstance3D = MeshInstance3D.new()
		var lq: QuadMesh = QuadMesh.new()
		lq.size = Vector2(length, 1.0)
		lona.mesh = lq
		var lmat: StandardMaterial3D = StandardMaterial3D.new()
		lmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		lmat.cull_mode = BaseMaterial3D.CULL_DISABLED
		lmat.albedo_texture = _roof_banner_texture()
		lmat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		lmat.uv1_scale = Vector3(length / 22.0, 1.0, 1.0)
		lona.material_override = lmat
		lona.position = pos + Vector3(0.0, 0.62, 0.0)
		lona.rotation_degrees = Vector3(0.0, float(s[3]), 0.0)
		lona.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		panel.add_child(lona)
		_register_occluder(panel)




func _roof_banner_texture() -> ImageTexture:


	var img: Image = Image.create(220, 10, false, Image.FORMAT_RGBA8)
	img.fill(Color("1f7a33"))
	for y in 10:
		for x in 220:
			if (x + y) % 44 < 5:
				img.set_pixel(x, y, Color("2e9344"))
	return ImageTexture.create_from_image(img)



func _roof_mesh_texture() -> ImageTexture:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var wire: Color = Color("aab2ba", 0.85)
	for i in 32:
		img.set_pixel(i, posmod(i, 32), wire)
		img.set_pixel(i, posmod(- i, 32), wire)
	return ImageTexture.create_from_image(img)





func _roof_city_below(root: Node3D) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20260731
	var neon_i: int = 0


	_roof_torres.clear()
	for i in 40:









		_roof_occ_ini(root)


		var torre_idx: int = -1
		var ang: float = TAU * float(i) / 40.0 + rng.randf_range(-0.06, 0.06)
		var dist: float = rng.randf_range(78.0, 210.0)
		var pos2: Vector2 =(Vector2(cos(ang), sin(ang)) * dist
			+ Vector2(0.0, HALF_LINE))
		var w: float = rng.randf_range(11.0, 24.0)
		var top: float = rng.randf_range(-24.0, 6.0)

		if i % 7 == 0:
			top = rng.randf_range(14.0, 30.0)




			_roof_torres.append([pos2.x, pos2.y, w, top])
			torre_idx = _roof_torres.size() - 1


		if pos2.y < 10.0 and i % 2 == 0:
			top = maxf(top, rng.randf_range(5.0, 15.0))
		var h: float = top + AZOTEA_DROP + 14.0
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.albedo_texture = _facade_texture(
			Color("343b49").lerp(Color("4a5266"), rng.randf()), true, 700 + i, true)
		_roof_fachada_nitida(mat)
		mat.uv1_scale = Vector3(w / 12.0, h / 12.0, 1.0)
		var d: float = w * rng.randf_range(0.7, 1.0)
		_city_mesh(Vector3(pos2.x, top - h * 0.5, pos2.y),
			_box(Vector3(w, h, d)), mat)


		_roof_cap(pos2, w, d, top, 500 + i, top < 4.0)



















		if top > 2.0 and w >= NEON_ANCHO_MIN:
			var cuad: int = _roof_cuadrante(pos2)
			if _roof_neon_cuota[cuad] < NEON_POR_CUADRANTE:
				var hacia: Vector2 =(Vector2(0.0, HALF_LINE) - pos2).normalized()
				var cara: Vector2 = pos2 + hacia *(w * 0.5 + 0.6)
				_roof_neon(root, Vector3(cara.x, top, cara.y), w, neon_i)
				_roof_neon_cuota[cuad] += 1
				neon_i += 1
		var grupo_torre: Node3D = _roof_occ_fin("OccCiudad%d" % i)



		if torre_idx >= 0 and grupo_torre != null:
			_roof_torres[torre_idx].append(grupo_torre)









	_roof_occ_ini(root)
	for i in 34:
		var ang2: float = TAU *(float(i) + 0.5) / 34.0 + rng.randf_range(-0.05, 0.05)
		var dist2: float = rng.randf_range(240.0, 430.0)
		var pos3: Vector2 =(Vector2(cos(ang2), sin(ang2)) * dist2
			+ Vector2(0.0, HALF_LINE))
		var w2: float = rng.randf_range(20.0, 44.0)
		var top2: float = rng.randf_range(-4.0, 52.0)
		var h2: float = top2 + AZOTEA_DROP + 20.0
		var mat2: StandardMaterial3D = StandardMaterial3D.new()
		mat2.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat2.albedo_texture = _facade_texture(
			Color("1d222e").lerp(Color("272e3d"), rng.randf()), true, 11000 + i)
		mat2.uv1_scale = Vector3(w2 / 14.0, h2 / 14.0, 1.0)
		var d2: float = w2 * rng.randf_range(0.7, 1.0)
		_city_mesh(Vector3(pos3.x, top2 - h2 * 0.5, pos3.y),
			_box(Vector3(w2, h2, d2)), mat2)

		_roof_cap(pos3, w2, d2, top2, 1500 + i, false)

		if top2 > 40.0:
			_roof_beacon(Vector3(pos3.x, top2 + 1.2, pos3.y))
	_roof_occ_fin("OccAnilloLejano")









func _roof_onlookers(root: Node3D) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20260801
	var fx: float = FIELD_HALF_W + 2.6
	var ropa: Array = [Color("8a8f98"), Color("31405e"), Color("c9a13b"),
		Color("8e3b3b"), Color("5d6b46"), Color("3e6e6a")]


	var sitios: Array = [
		[fx + 1.6, -6.4], [- fx * 0.3, -6.8],
		[fx + 1.9, 24.0], [fx + 1.5, 58.0],
		[- fx - 1.7, 38.0], [- fx - 1.4, 82.0],
	]













	var hojas: Array[SpriteFrames] = []
	for h in 2:
		hojas.append(_build_fan_frames("fan_blue", KitRecolor.sin_pelirrojo_oscuro({
			"kit": ropa[h],
			"skin": KitRecolor.SKIN_TONES[rng.randi() % KitRecolor.SKIN_TONES.size()],
			"hair": KitRecolor.HAIR_COLORS[rng.randi() % KitRecolor.HAIR_COLORS.size()]})))
	if hojas[0] == null or hojas[1] == null:
		return
	for i in sitios.size():
		var frames: SpriteFrames = hojas[i % 2]
		var fan: AnimatedSprite3D = AnimatedSprite3D.new()
		fan.sprite_frames = frames
		fan.pixel_size = 1.5 / 32.0
		fan.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		fan.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		fan.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		fan.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		fan.position = Vector3(float(sitios[i][0]), 0.75, float(sitios[i][1]))
		root.add_child(fan)
		fan.play("idle")
		fan.speed_scale = rng.randf_range(0.7, 1.3)
		if frames.get_frame_count("idle") > 1:
			fan.frame = rng.randi_range(0, frames.get_frame_count("idle") - 1)








func _roof_cap(pos2: Vector2, w: float, d: float, top: float,
		seed_v: int, props: bool) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_v
	var slab: StandardMaterial3D = StandardMaterial3D.new()
	slab.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	slab.albedo_color = Color("30343e").lerp(Color("3b404b"), rng.randf())
	_city_mesh(Vector3(pos2.x, top + 0.2, pos2.y),
		_box(Vector3(w + 0.5, 0.4, d + 0.5)), slab)
	if not props:
		return

	var hut: StandardMaterial3D = StandardMaterial3D.new()
	hut.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	hut.albedo_color = Color("434a58")
	_city_mesh(Vector3(pos2.x + w * 0.28 *(1.0 if rng.randf() < 0.5 else -1.0),
		top + 1.4, pos2.y + d * 0.28 *(1.0 if rng.randf() < 0.5 else -1.0)),
		_box(Vector3(3.2, 2.4, 2.4)), hut)

	var ac: StandardMaterial3D = StandardMaterial3D.new()
	ac.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	ac.albedo_color = Color("9aa2ac")
	for _i in rng.randi_range(1, 3):
		_city_mesh(Vector3(pos2.x + rng.randf_range(-0.3, 0.3) * w,
			top + 0.95, pos2.y + rng.randf_range(-0.3, 0.3) * d),
			_box(Vector3(1.6, 1.1, 1.2)), ac)

	if rng.randf() < 0.6:
		var tank: CylinderMesh = CylinderMesh.new()
		tank.top_radius = 1.0
		tank.bottom_radius = 1.0
		tank.height = 2.2
		var tm: StandardMaterial3D = StandardMaterial3D.new()
		tm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		tm.albedo_color = Color("c9c2b4")
		_city_mesh(Vector3(pos2.x - w * 0.3, top + 1.5, pos2.y - d * 0.25),
			tank, tm)







func _roof_neon(root: Node3D, pos: Vector3, facade_w: float, idx: int) -> void:
	var col: Color = AZOTEA_NEON[idx % AZOTEA_NEON.size()]
	var frames: Array[ImageTexture] = _scr_wave_frames(col) if idx % 2 == 0 \
			else _scr_eq_frames(col, 300 + idx)









	var wdt: float = minf(facade_w * 0.95, 26.0)
	var hgt: float = wdt / 3.2
	var y: float = maxf(pos.y - hgt * 0.5 - 1.0, hgt * 0.5 + 1.5)
	_roof_screen_add(root, frames, Vector3(pos.x, y, pos.z), Vector2(wdt, hgt),
		2.1, 0.5 if idx % 2 == 0 else 0.22)






func _roof_screen_add(root: Node3D, frames: Array[ImageTexture], pos: Vector3,
		size: Vector2, energy: float, period: float,
		sin_niebla: bool = false) -> MeshInstance3D:
	var mesh: MeshInstance3D = _roof_sign(root, frames[0], pos, size, energy, sin_niebla)
	_roof_screens.append({"mat": mesh.material_override, "frames": frames,
		"period": period, "t": randf() * period, "i": 0})
	return mesh





func _scr_wave_frames(col: Color, n: int = 6) -> Array[ImageTexture]:
	var out: Array[ImageTexture] = []
	for f in n:
		var img: Image = Image.create(48, 16, false, Image.FORMAT_RGBA8)
		img.fill(Color("101218"))
		for x in 48:
			for y in [0, 15]:
				img.set_pixel(x, y, col.darkened(0.45))
		for x in 48:
			var cy: float = 8.0 + 4.5 * sin(TAU *(float(x) / 24.0 + float(f) / float(n)))
			for y in 16:
				if absf(float(y) - cy) <= 1.4:
					img.set_pixel(x, y, col)
		out.append(ImageTexture.create_from_image(img))
	return out




func _scr_eq_frames(col: Color, seed_v: int, n: int = 6) -> Array[ImageTexture]:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_v
	var out: Array[ImageTexture] = []
	for _f in n:
		var img: Image = Image.create(48, 16, false, Image.FORMAT_RGBA8)
		img.fill(Color("101218"))
		for b in 8:
			var bh: int = rng.randi_range(3, 14)
			for x in 4:
				for y in bh:
					img.set_pixel(2 + b * 6 + x, 15 - y,
						col if y < bh - 2 else col.lightened(0.5))
		out.append(ImageTexture.create_from_image(img))
	return out




func _scr_ring_frames(n: int = 8) -> Array[ImageTexture]:
	var out: Array[ImageTexture] = []
	for f in n:
		var img: Image = Image.create(64, 64, false, Image.FORMAT_RGBA8)
		img.fill(Color(0, 0, 0, 0))
		var rr: float = 4.0 + 26.0 * float(f) / float(n)
		for y in 64:
			for x in 64:
				var d: float = Vector2(x - 32, y - 32).length()
				if d <= 30.0:
					var c: Color = Color("eef2f6") if d <= 26.0 else Color("2a5db0")
					if absf(d - rr) <= 2.2:
						c = Color("2a5db0") if d <= 26.0 else Color("64b8f0")
					img.set_pixel(x, y, c)
		out.append(ImageTexture.create_from_image(img))
	return out













const KANJI_TRAZOS: Array = [
	[[0, 2, 12, 2], [5, 0, 2, 12], [0, 8, 12, 2]],
	[[0, 0, 12, 2], [0, 5, 12, 2], [0, 10, 12, 2], [5, 0, 2, 12]],
	[[1, 0, 2, 12], [9, 0, 2, 12], [1, 5, 10, 2], [1, 10, 10, 2]],
	[[0, 1, 12, 2], [2, 4, 8, 2], [5, 1, 2, 11], [0, 9, 12, 2]],
	[[0, 0, 12, 2], [1, 4, 10, 2], [1, 8, 10, 2], [0, 4, 2, 8], [10, 4, 2, 8]],
	[[5, 0, 2, 5], [0, 4, 12, 2], [1, 7, 4, 5], [7, 7, 4, 5]],
]















func _scr_kanji_frames(col: Color, seed_v: int) -> Array[ImageTexture]:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_v
	var glifos: Array = []
	for c in 4:
		glifos.append(KANJI_TRAZOS[rng.randi() % KANJI_TRAZOS.size()])
	var tinta: Color = Color("15131a")
	var out: Array[ImageTexture] = []
	for f in 2:
		var panel: Color = col.lightened(0.35) if f == 0 else col.lightened(0.18)
		var img: Image = Image.create(16, 64, false, Image.FORMAT_RGBA8)
		img.fill(panel)


		for x in 16:
			img.set_pixel(x, 0, tinta)
			img.set_pixel(x, 63, tinta)
		for y in 64:
			img.set_pixel(0, y, tinta)
			img.set_pixel(15, y, tinta)
		for c in 4:
			var oy: int = 2 + c * 16
			for t in glifos[c]:
				for dx in int(t[2]):
					for dy in int(t[3]):
						var px: int = 2 + int(t[0]) + dx
						var py: int = oy + int(t[1]) + dy
						if px > 0 and px < 15 and py > 0 and py < 63:
							img.set_pixel(px, py, tinta)
		out.append(ImageTexture.create_from_image(img))
	return out


















func _roof_canyon(root: Node3D) -> void:
	var x1: float = _wx0 + float(_tw) / TEXELS_PER_M
	var z1: float = _wz0 + float(_th) / TEXELS_PER_M

	var towers: Array = [
		[x1 + 24.0, 18.0, 30.0, 72.0, "logo"],
		[x1 + 30.0, 68.0, 26.0, 50.0, "bill"],
		[x1 + 20.0, -48.0, 24.0, 32.0, "vsign"],
		[_wx0 - 26.0, 34.0, 28.0, 80.0, "screen"],
		[_wx0 - 30.0, 88.0, 24.0, 44.0, "bill"],
		[_wx0 - 20.0, -56.0, 26.0, 36.0, "vsign"],
		[12.0, z1 + 34.0, 36.0, 62.0, ""],
		[-30.0, z1 + 28.0, 24.0, 40.0, ""],


		[12.0, -64.0, 30.0, 50.0, "arco"],
		[-26.0, -54.0, 16.0, 34.0, "kanji"],
	]
	var ti: int = 0
	for t in towers:



		_roof_occ_ini(root)
		var tx: float = t[0]
		var tz: float = t[1]
		var tw2: float = t[2]
		var top: float = t[3]
		var kind: String = t[4]
		var h: float = top + AZOTEA_DROP + 16.0
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.albedo_texture = _facade_texture(
			Color("2b3140").lerp(Color("3d4558"), fmod(float(ti) * 0.37, 1.0)),
			true, 9100 + ti, true)
		_roof_fachada_nitida(mat)
		mat.uv1_scale = Vector3(tw2 / 12.0, h / 12.0, 1.0)
		_city_mesh(Vector3(tx, top - h * 0.5, tz),
			_box(Vector3(tw2, h, tw2 * 0.8)), mat)
		_roof_cap(Vector2(tx, tz), tw2, tw2 * 0.8, top, 2500 + ti, false)

		var hacia: Vector2 =(Vector2(0.0, HALF_LINE) - Vector2(tx, tz)).normalized()
		var cara: Vector2 = Vector2(tx, tz) + hacia *(tw2 * 0.5 + 0.8)





		match kind:
			"logo":
				_roof_screen_add(root, _scr_ring_frames(),
					Vector3(cara.x, top - 14.0, cara.y), Vector2(24.0, 24.0),
					2.0, 0.14)
			"vsign", "kanji":







				_roof_screen_add(root,
					_scr_kanji_frames(AZOTEA_NEON[ti % 6], 700 + ti),
					Vector3(cara.x, top - 18.0, cara.y), Vector2(8.0, 30.0),
					1.5, 0.9, true)
			"arco":
				var aw: float = minf(tw2 * 0.86, 26.0)
				_roof_screen_add(root, _scr_wave_frames(AZOTEA_NEON[0]),
					Vector3(cara.x, top - 9.0, cara.y), Vector2(aw, aw / 2.6),
					2.1, 0.2, true)
			"bill":
				var bw: float = minf(tw2 * 0.92, 26.0)
				_roof_screen_add(root, _scr_eq_frames(AZOTEA_NEON[ti % 6], 40 + ti),
					Vector3(cara.x, top - 8.0, cara.y), Vector2(bw, bw / 3.4),
					2.1, 0.24)
			"screen":
				var mos: Array[ImageTexture] = []
				for fs in [8181, 4242, 977, 5150]:
					mos.append(_roof_screen_texture(fs))
				_roof_screen_add(root, mos,
					Vector3(cara.x, top - 16.0, cara.y), Vector2(26.0, 17.0),
					1.8, 0.55)


		if top >= 44.0:
			var ant: StandardMaterial3D = StandardMaterial3D.new()
			ant.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
			ant.albedo_color = Color("22242a")
			_city_mesh(Vector3(tx, top + 3.0, tz), _box(Vector3(0.3, 6.0, 0.3)), ant)
			_roof_beacon(Vector3(tx, top + 6.4, tz))
		_roof_occ_fin("OccTorre%d" % ti)
		ti += 1


	var fill: Array = [
		[x1 + 18.0, 44.0, 16.0, 24.0], [x1 + 24.0, 94.0, 18.0, 18.0],
		[x1 + 16.0, -18.0, 14.0, 14.0], [_wx0 - 16.0, 6.0, 15.0, 20.0],
		[_wx0 - 22.0, 62.0, 18.0, 26.0], [_wx0 - 16.0, -28.0, 14.0, 12.0],
		[34.0, z1 + 22.0, 20.0, 20.0], [-8.0, z1 + 26.0, 16.0, 30.0],
	]
	var fi: int = 0
	for f in fill:
		_roof_occ_ini(root)
		var fh: float = float(f[3]) + AZOTEA_DROP + 16.0
		var fmat: StandardMaterial3D = StandardMaterial3D.new()
		fmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		fmat.albedo_texture = _facade_texture(
			Color("272d3a").lerp(Color("38404f"), fmod(float(fi) * 0.61, 1.0)),
			true, 9600 + fi, true)
		_roof_fachada_nitida(fmat)
		fmat.uv1_scale = Vector3(float(f[2]) / 12.0, fh / 12.0, 1.0)
		_city_mesh(Vector3(float(f[0]), float(f[3]) - fh * 0.5, float(f[1])),
			_box(Vector3(float(f[2]), fh, float(f[2]) * 0.8)), fmat)
		_roof_cap(Vector2(float(f[0]), float(f[1])), float(f[2]),
			float(f[2]) * 0.8, float(f[3]), 3500 + fi, false)
		_roof_occ_fin("OccMediana%d" % fi)
		fi += 1







func _roof_sign(root: Node3D, tex: ImageTexture, pos: Vector3, size: Vector2,
		energy: float, sin_niebla: bool = false) -> MeshInstance3D:
	var mesh: MeshInstance3D = MeshInstance3D.new()
	var quad: QuadMesh = QuadMesh.new()
	quad.size = size
	mesh.mesh = quad
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST










	var e: float = energy * 0.8
	mat.albedo_color = Color(e, e, e)
	mat.disable_fog = sin_niebla
	mesh.material_override = mat
	mesh.position = pos
	mesh.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mesh)
	mesh.look_at(Vector3(0.0, pos.y, HALF_LINE))
	mesh.rotate_object_local(Vector3.UP, PI)
	return mesh



func _roof_screen_texture(seed_v: int = 8181) -> ImageTexture:
	var img: Image = Image.create(48, 32, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_v
	var pal: Array = [Color("173a7a"), Color("2a6fd4"), Color("64b8f0"),
		Color("e8f2ff"), Color("173a7a"), Color("2a6fd4")]
	for by in 8:
		for bx in 12:
			var c: Color = pal[rng.randi_range(0, pal.size() - 1)]
			for y in 4:
				for x in 4:
					img.set_pixel(bx * 4 + x, by * 4 + y, c)
	return ImageTexture.create_from_image(img)





func _roof_crane(_root: Node3D) -> void:
	var x1: float = _wx0 + float(_tw) / TEXELS_PER_M
	var base: Vector3 = Vector3(x1 + 12.0, 0.0, 96.0)
	var rojo: StandardMaterial3D = StandardMaterial3D.new()
	rojo.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	rojo.albedo_color = Color("d0342c")
	var blanco: StandardMaterial3D = StandardMaterial3D.new()
	blanco.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	blanco.albedo_color = Color("e8e6e2")

	for i in 14:
		var y: float = -16.0 + 3.0 * float(i) + 1.5
		_city_mesh(base + Vector3(0.0, y, 0.0), _box(Vector3(1.4, 3.0, 1.4)),
			rojo if i % 2 == 0 else blanco)
	var top_y: float = -16.0 + 42.0

	for i in 6:
		_city_mesh(base + Vector3(-2.0 - 4.0 * float(i), top_y, 0.0),
			_box(Vector3(4.0, 1.1, 1.1)), rojo if i % 2 == 0 else blanco)
	_city_mesh(base + Vector3(3.4, top_y, 0.0), _box(Vector3(5.0, 1.2, 1.2)), rojo)

	var cable: StandardMaterial3D = StandardMaterial3D.new()
	cable.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	cable.albedo_color = Color("22242a")
	_city_mesh(base + Vector3(-14.0, top_y - 5.5, 0.0),
		_box(Vector3(0.09, 11.0, 0.09)), cable)
	_city_mesh(base + Vector3(-14.0, top_y - 11.3, 0.0),
		_box(Vector3(0.7, 0.7, 0.7)), rojo)

	_roof_beacon(base + Vector3(0.0, top_y + 1.4, 0.0))



func _roof_flag(_root: Node3D) -> void:
	var x1: float = _wx0 + float(_tw) / TEXELS_PER_M
	var asta: StandardMaterial3D = StandardMaterial3D.new()
	asta.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	asta.albedo_color = Color("c8ccd2")
	var base: Vector3 = Vector3(x1 - 4.0, 0.0, _wz0 + 2.0)
	_city_mesh(base + Vector3(0.0, 2.6, 0.0), _box(Vector3(0.12, 5.2, 0.12)), asta)
	var img: Image = Image.create(30, 20, false, Image.FORMAT_RGBA8)
	img.fill(Color("f4f2ee"))
	for y in 20:
		for x in 30:
			if Vector2(x - 15, y - 10).length() <= 6.0:
				img.set_pixel(x, y, Color("bc002d"))
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(2.2, 1.5)
	var flag: MeshInstance3D = MeshInstance3D.new()
	flag.mesh = q
	flag.material_override = mat
	flag.position = base + Vector3(-1.2, 4.3, 0.0)
	flag.rotation_degrees = Vector3(0.0, 18.0, 0.0)
	flag.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(flag)




func _roof_tarp(_root: Node3D) -> void:
	var azul: StandardMaterial3D = StandardMaterial3D.new()
	azul.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	azul.albedo_color = Color("3468c8")





	_city_mesh(Vector3(-(FIELD_HALF_W + 4.2), 0.05, 74.0),
		_box(Vector3(5.0, 0.1, 6.5)), azul)
	var gris: StandardMaterial3D = StandardMaterial3D.new()
	gris.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	gris.albedo_color = Color("7d838c")
	_city_mesh(Vector3(-(FIELD_HALF_W + 3.0), 0.6, 72.4), _box(Vector3(1.6, 1.1, 1.2)), gris)
	_city_mesh(Vector3(-(FIELD_HALF_W + 5.0), 0.45, 76.6), _box(Vector3(1.2, 0.8, 1.0)), gris)



func _roof_fuji(_root: Node3D) -> void:
	var monte: CylinderMesh = CylinderMesh.new()
	monte.top_radius = 26.0
	monte.bottom_radius = 190.0
	monte.height = 110.0
	monte.radial_segments = 24







	var m1: StandardMaterial3D = StandardMaterial3D.new()
	m1.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m1.albedo_color = Color("3e4866")
	m1.disable_fog = true
	_city_mesh(Vector3(-130.0, 18.0, -700.0), monte, m1)
	var nieve: CylinderMesh = CylinderMesh.new()
	nieve.top_radius = 0.0
	nieve.bottom_radius = 40.0
	nieve.height = 26.0
	nieve.radial_segments = 24
	var m2: StandardMaterial3D = StandardMaterial3D.new()
	m2.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m2.albedo_color = Color("7f8ba6")
	m2.disable_fog = true
	_city_mesh(Vector3(-130.0, 82.0, -700.0), nieve, m2)




func _roof_torii(_root: Node3D) -> void:







	var k: float = 1.5
	var red: StandardMaterial3D = StandardMaterial3D.new()
	red.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	red.albedo_color = AZOTEA_TORII_RED
	var black: StandardMaterial3D = StandardMaterial3D.new()
	black.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	black.albedo_color = Color("1c1a1a")
	var base: Vector3 = Vector3(-38.5, 0.0, -13.0)
	for sx in [-1.6, 1.6]:
		_city_mesh(base + Vector3(sx, 1.6, 0.0) * k, _box(Vector3(0.34, 3.2, 0.34) * k), red)
	_city_mesh(base + Vector3(0.0, 2.9, 0.0) * k, _box(Vector3(4.4, 0.28, 0.4) * k), red)
	_city_mesh(base + Vector3(0.0, 3.45, 0.0) * k, _box(Vector3(5.2, 0.34, 0.5) * k), red)
	_city_mesh(base + Vector3(0.0, 3.72, 0.0) * k, _box(Vector3(5.4, 0.2, 0.6) * k), black)

	var stone: StandardMaterial3D = StandardMaterial3D.new()
	stone.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	stone.albedo_color = Color("8d9298")
	_city_mesh(base + Vector3(3.4, 0.5, 0.6) * k, _box(Vector3(0.5, 1.0, 0.5) * k), stone)
	_city_mesh(base + Vector3(3.4, 1.15, 0.6) * k, _box(Vector3(0.8, 0.3, 0.8) * k), stone)








	var farol: StandardMaterial3D = StandardMaterial3D.new()
	farol.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	farol.albedo_color = Color(1.5, 0.72, 0.34)
	for i in 7:
		var fx: float = -2.1 + float(i) * 0.7
		_city_mesh(base + Vector3(fx, 2.52, 0.0) * k, _box(Vector3(0.3, 0.42, 0.3) * k), farol)




func _roof_props(_root: Node3D) -> void:
	var rust: StandardMaterial3D = StandardMaterial3D.new()
	rust.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	rust.albedo_color = Color("8a6a52")
	var tank: CylinderMesh = CylinderMesh.new()
	tank.top_radius = 2.1
	tank.bottom_radius = 2.1
	tank.height = 3.2
	_city_mesh(Vector3(34.0, 2.9, -14.5), tank, rust)
	for leg in [Vector3(32.6, 0.65, -15.9), Vector3(35.4, 0.65, -15.9),
			Vector3(32.6, 0.65, -13.1), Vector3(35.4, 0.65, -13.1)]:
		_city_mesh(leg, _box(Vector3(0.2, 1.3, 0.2)), rust)
	_roof_beacon(Vector3(34.0, 4.8, -14.5))
	var gris: StandardMaterial3D = StandardMaterial3D.new()
	gris.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	gris.albedo_color = Color("9aa0a8")
	_city_mesh(Vector3(-30.0, 0.6, 109.5), _box(Vector3(1.7, 1.2, 1.2)), gris)
	_city_mesh(Vector3(-27.6, 0.55, 109.8), _box(Vector3(1.4, 1.1, 1.1)), gris)

	var vend: StandardMaterial3D = StandardMaterial3D.new()
	vend.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	vend.albedo_color = Color("d43c50")
	_city_mesh(Vector3(38.6, 0.95, 52.0), _box(Vector3(0.9, 1.9, 1.0)), vend)
	var lit: StandardMaterial3D = StandardMaterial3D.new()
	lit.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	lit.albedo_color = Color("fff2d8")
	lit.emission_enabled = true
	lit.emission = Color("fff2d8")
	lit.emission_energy_multiplier = 1.6
	_city_mesh(Vector3(38.1, 1.15, 52.0), _box(Vector3(0.04, 1.1, 0.7)), lit)














const AZOTEA_SAKURAS: Array = [
	[Vector3(-38.0, 0.0, 108.5), "OccSakura-1"],
	[Vector3(38.0, 0.0, 108.5), "OccSakura1"],
	[Vector3(-34.0, 0.0, -9.0), "OccSakuraArco-1"],
	[Vector3(36.5, 0.0, -9.0), "OccSakuraArco1"],
]


func _roof_sakura(_root: Node3D) -> void:
	for arbol in AZOTEA_SAKURAS:
		_roof_occ_ini(_root)
		var base: Vector3 = arbol[0]


		var trunk: StandardMaterial3D = StandardMaterial3D.new()
		trunk.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		trunk.albedo_color = Color("5a4633")
		_city_mesh(base + Vector3(0.0, 0.9, 0.0), _box(Vector3(0.3, 1.8, 0.3)), trunk)
		for c in [[Vector3(0.0, 2.5, 0.0), 1.5], [Vector3(-0.9, 2.0, 0.3), 1.0],
				[Vector3(0.8, 2.1, -0.3), 1.1]]:
			var copa: SphereMesh = SphereMesh.new()
			copa.radius = c[1]
			copa.height =(c[1] as float) * 1.7
			var rosa: StandardMaterial3D = StandardMaterial3D.new()
			rosa.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
			rosa.albedo_color = Color("efa6c3").lerp(Color("f5c1d4"),
				fmod(absf((c[0] as Vector3).x) * 3.7, 1.0))
			_city_mesh(base + c[0], copa, rosa)
		_roof_occ_fin(String(arbol[1]))




func _roof_masts(_root: Node3D) -> void:
	var mi: int = 0
	for corner in [Vector2(- FIELD_HALF_W - 2.0, -4.0),
			Vector2(FIELD_HALF_W + 2.0, -4.0),
			Vector2(- FIELD_HALF_W - 2.0, FIELD_DEPTH + 4.0),
			Vector2(FIELD_HALF_W + 2.0, FIELD_DEPTH + 4.0)]:





		_roof_occ_ini(_root)




		var pole: StandardMaterial3D = StandardMaterial3D.new()
		pole.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		pole.albedo_color = Color("30343c")




		var head: StandardMaterial3D = StandardMaterial3D.new()
		head.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		head.albedo_color = AZOTEA_FOCO
		_city_mesh(Vector3(corner.x, 3.9, corner.y), _box(Vector3(0.24, 7.8, 0.24)), pole)
		_city_mesh(Vector3(corner.x, 7.9, corner.y), _box(Vector3(1.4, 0.5, 0.7)), head)












		var lamp: OmniLight3D = OmniLight3D.new()
		lamp.position = Vector3(corner.x, 9.5, corner.y)
		lamp.omni_range = 62.0
		lamp.light_energy = 1.1
		lamp.light_color = Color("eaffe6")
		lamp.shadow_enabled = false
		add_child(lamp)
		_roof_occ_fin("OccMastil%d" % mi)
		mi += 1





func _roof_dress_sky() -> void:





	if _sky_mat != null:
		_sky_mat.sky_top_color = Color("0d1128")



		_sky_mat.sky_horizon_color = Color("323a52")
		_sky_mat.ground_bottom_color = Color("070912")
		_sky_mat.ground_horizon_color = Color("2e3550")
	if _sun != null:
		_sun.rotation_degrees = Vector3(-12.0, -150.0, 0.0)
		_sun.light_color = Color("7f8cb0")
		_sun.light_energy = 0.3
	if _env != null:
		_env.ambient_light_energy = 0.55
		_pon_glow(true)





		_env.fog_enabled = true











		_env.fog_mode = Environment.FOG_MODE_DEPTH
		_env.fog_depth_begin = AZOTEA_FOG_INI
		_env.fog_depth_end = AZOTEA_FOG_FIN
		_env.fog_depth_curve = 1.0
		_env.fog_density = 1.0
		_env.fog_light_color = Color("323a52")
		_env.fog_sky_affect = 0.8














	if _rain != null:
		_rain.visible = true
		_rain.emitting = true
		var t: Dictionary = Weather.rain_tier(Weather.RAIN_LIGHT)
		_rain.amount_ratio = clampf(float(t["drops"]), 0.05, 1.0)
		if _rain_quad != null:
			_rain_quad.size = Vector2(0.04, 0.42 * float(t["drop_len"]))
			var gota: StandardMaterial3D = _rain_quad.material as StandardMaterial3D
			if gota != null:
				gota.albedo_color.a = AZOTEA_LLUVIA_ALFA
		if _rain_pm != null:
			var fall: float = maxf(float(t["fall"]), 0.05)
			_rain_pm.initial_velocity_min = 19.0 * fall
			_rain_pm.initial_velocity_max = 21.0 * fall
			_rain.lifetime = 1.0 / fall























const FACADE_CELL_M: float = 3.4
const FACADE_TEX_CELLS: int = 4
const FACADE_LIT_FRAC: float = 0.42

var _facade_mats: Array[Dictionary] = []
var _facade_day: Array[ImageTexture] = []
var _facade_night: Array[ImageTexture] = []
var _night_city: bool = false







func _facade_texture(base: Color, lit: bool, seed_v: int, mipmaps: bool = false) -> ImageTexture:
	var px: int = 8
	var n: int = FACADE_TEX_CELLS * px
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGBA8)


	var wall: Color = base.darkened(0.55) if lit else base
	img.fill(wall)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_v



	var glass_off: Color = base.darkened(0.3).lerp(Color("2b3340"), 0.35)
	if lit:
		glass_off = base.darkened(0.72)
	var glass_on: Color = Color("ffd98a")
	var glass_on_cool: Color = Color("b9d7ff")
	for cy in FACADE_TEX_CELLS:
		for cx in FACADE_TEX_CELLS:
			var on: bool = lit and rng.randf() < FACADE_LIT_FRAC


			var c: Color = glass_on_cool if on and rng.randf() < 0.18 else glass_on
			if not on:
				c = glass_off


			for y in range(2, px - 2):
				for x in range(2, px - 2):
					img.set_pixel(cx * px + x, cy * px + y, c)
	if mipmaps:
		img.generate_mipmaps()
	return ImageTexture.create_from_image(img)











var _facade_by_key: Dictionary = {}

func _facade_mat(tier: int, w: float, h: float) -> StandardMaterial3D:
	var tile: float = FACADE_CELL_M * float(FACADE_TEX_CELLS)
	var sx: float = maxf(round(w / tile), 1.0)
	var sy: float = maxf(round(h / tile), 1.0)
	var key: String = "%d|%d|%d" % [tier, int(sx), int(sy)]
	var hit: Variant = _facade_by_key.get(key)
	if hit is StandardMaterial3D:
		return hit
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.albedo_texture = _facade_day[tier]
	mat.uv1_scale = Vector3(sx, sy, 1.0)
	_facade_mats.append({"mat": mat, "tier": tier})
	_facade_by_key[key] = mat
	return mat




func _set_city_night(on: bool) -> void:
	if on == _night_city or _facade_day.size() < 3:
		return
	_night_city = on
	for f in _facade_mats:
		var mat: StandardMaterial3D = f["mat"]
		mat.albedo_texture = _facade_night[int(f["tier"])] if on \
				else _facade_day[int(f["tier"])]




	if _rail_glow != null and is_instance_valid(_rail_glow):
		_rail_glow.visible = on


const EntornoRecinto = preload("res://features/stadium/venue_surroundings.gd")
const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")
var _venue_environment: Dictionary = {}


func _build_skyline() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	var center: Vector2 = Vector2(0.0, HALF_LINE)


	var geo: Dictionary = COUNTRY_SKYLINE.get(_country, {})
	_venue_environment = EntornoRecinto.perfil(_pitch_seed_club(),
		int(geo.get("seed", 20240601))) if not _train else {}



	var radius: float = 155.0







	if _train and int(TRAIN_DIV.get(clampi(div, 1, 3), {}).get("privacy", 0)) > 0:
		radius = 320.0



	var cfg: Dictionary = _skyline_cfg()


	cfg = EntornoRecinto.skyline(cfg, _venue_environment)
	if String(_venue_environment.get("tipo", "")) == "parque":
		radius += 24.0
	elif String(_venue_environment.get("tipo", "")) == "relieve":
		radius += 12.0
	rng.seed = int(cfg.get("seed", 20240601))
	var tiers: Array = cfg["tint"]




	_skyline_base.clear()
	_skyline_mats.clear()
	for tier in 3:
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = tiers[tier]
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		_skyline_mats.append(mat)
		_skyline_base.append(tiers[tier])
	_skyline_haze = float(cfg["haze"])




	var ground: MeshInstance3D = MeshInstance3D.new()
	var ground_mesh: PlaneMesh = PlaneMesh.new()
	ground_mesh.size = Vector2(900.0, 900.0)
	ground.mesh = ground_mesh
	var ground_mat: StandardMaterial3D = StandardMaterial3D.new()


	ground_mat.albedo_color = _ground_color()
	ground_mat.roughness = 1.0
	ground.material_override = ground_mat
	_ground_mat = ground_mat
	ground.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	ground.position = Vector3(center.x, -0.35, center.y)
	_bowl_root().add_child(ground)
	await _respira()



	_facade_mats.clear()
	_facade_day.clear()
	_facade_night.clear()
	for tier in 3:
		await _respira()
		_facade_day.append(_facade_texture(tiers[tier], false, 7717 + tier))
		_facade_night.append(_facade_texture(tiers[tier], true, 7717 + tier))
	_night_city = false

	var count: int = int(cfg["count"])





	var rich: bool = bool(cfg.get("rich", false))
	for i in count:



		var angle: float =(TAU / count) * i \
				+ rng.randf_range(-0.32, 0.32) if rich else \
				(TAU / count) * i + rng.randf_range(-0.05, 0.05)
		var tier: int = i % 3
		var r: float = radius + tier * 34.0 + rng.randf_range(-10.0, 10.0)
		var h: float = rng.randf_range(float(cfg["h_min"]), float(cfg["h_max"])) + tier * float(cfg["tier_h"])
		var w: float = rng.randf_range(float(cfg["w_min"]), float(cfg["w_max"]))
		await _respira()
		_city_building(cfg, rng, center, angle, r, tier, h, w, rich)





	for i in int(cfg.get("extra", 0)):
		var angle: float = PI +(PI / float(maxi(int(cfg.get("extra", 1)), 1))) *(float(i) + 0.5) \
				+ rng.randf_range(-0.22, 0.22)
		var tier: int = i % 3
		var r: float = radius + tier * 34.0 + rng.randf_range(-16.0, 16.0)
		var h: float = rng.randf_range(float(cfg["h_min"]), float(cfg["h_max"])) + tier * float(cfg["tier_h"])
		var w: float = rng.randf_range(float(cfg["w_min"]), float(cfg["w_max"]))
		await _respira()
		_city_building(cfg, rng, center, angle, r, tier, h, w, true)









	var close: int = int(FOOTPRINT_CFG.get(footprint, {}).get("city_close", 0))
	for i in close:


		var angle: float = - PI * 0.5 + deg_to_rad(rng.randf_range(-52.0, 52.0))
		var r: float = rng.randf_range(100.0, 126.0)


		var h: float = rng.randf_range(float(cfg["h_min"]), float(cfg["h_max"])) * 1.18
		var w: float = rng.randf_range(float(cfg["w_min"]), float(cfg["w_max"]))


		await _respira()











		var antes: int = _bowl_root().get_child_count()
		_city_building(cfg, rng, center, angle, r, 0, h, w, false, false)
		_manzana_al_fundido(antes)
	await _respira()
	await _build_surroundings(center, rng)
	await _respira()
	_build_coast(center)
	var via: Dictionary = EntornoRecinto.ferrocarril(_venue_environment)
	if bool(via["activo"]):
		_build_railway(center, rng, float(via["dist"]), float(via["alto"]))





func _build_coast(center: Vector2) -> void:
	if String(_venue_environment.get("tipo", "")) != "costa":
		return
	var agua: StandardMaterial3D = _lm_mat(Color("466d7b"))
	agua.set_meta("paisaje_bruma", 0.4)
	var arena: StandardMaterial3D = _lm_mat(Color("a59675"))
	var eje: float = EntornoRecinto.eje(_venue_environment)
	for franja in 2:
		var vertices: PackedVector3Array = PackedVector3Array()
		var indices: PackedInt32Array = PackedInt32Array()
		for i in 9:
			var angulo: float = eje + lerpf(-0.39, 0.39, float(i) / 8.0)
			var orilla: float = 182.0 + sin(float(i) * 1.3) * 9.0
			var cerca: float = orilla if franja == 0 else orilla - 12.0
			var lejos: float = 880.0 if franja == 0 else orilla
			for radio in [cerca, lejos]:
				vertices.append(Vector3(center.x + cos(angulo) * radio,
					-0.29, center.y + sin(angulo) * radio))
			if i < 8:
				var n: int = i * 2
				indices.append_array(PackedInt32Array([n, n + 1, n + 2, n + 1, n + 3, n + 2]))
		var arrays: Array = []
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = vertices
		arrays[Mesh.ARRAY_INDEX] = indices
		var superficie: ArrayMesh = ArrayMesh.new()
		superficie.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		var mat: StandardMaterial3D = agua if franja == 0 else arena
		mat.cull_mode = BaseMaterial3D.CULL_DISABLED
		var pieza: MeshInstance3D = _city_mesh(Vector3.ZERO, superficie, mat)
		pieza.name = "MarExterior" if franja == 0 else "OrillaExterior"









func _manzana_al_fundido(desde: int) -> void:
	var raiz: Node3D = _bowl_root()
	var piezas: Array[Node3D] = []
	for k in range(desde, raiz.get_child_count()):
		var pieza: Node3D = raiz.get_child(k) as Node3D
		if pieza is GeometryInstance3D:
			piezas.append(pieza)
	if piezas.is_empty():
		return
	var grupo: Node3D = Node3D.new()
	grupo.name = "ManzanaPegada"
	raiz.add_child(grupo)
	var copias: Dictionary = {}
	for pieza in piezas:
		_adopt(grupo, pieza)
		var gi: GeometryInstance3D = pieza
		var original: StandardMaterial3D = gi.material_override as StandardMaterial3D
		if original == null:
			continue
		if not copias.has(original):
			var copia: StandardMaterial3D = original.duplicate()
			var fachada: int = -1
			for f in _facade_mats:
				if f["mat"] == original:
					fachada = int(f["tier"])
					break
			if fachada >= 0:
				_facade_mats.append({"mat": copia, "tier": fachada})
			else:
				var anillo: int = _skyline_mats.find(original)
				if anillo >= 0:
					copia.albedo_color = _skyline_base[anillo]


					copia.set_meta("paisaje_bruma", [0.65, 0.9, 1.12][anillo]
						if not _venue_environment.is_empty() else 1.0)
					_env_register(copia)
			copias[original] = copia
		gi.material_override = copias[original]
	_register_occluder(grupo)






func _city_building(cfg: Dictionary, rng: RandomNumberGenerator, center: Vector2,
		angle: float, r: float, tier: int, h: float, w: float, rich: bool,
		deforma: bool = true) -> void:
	if deforma and not _venue_environment.is_empty():



		var fase: float = float(_venue_environment["variante"]) * 0.73
		angle += sin(angle * 3.0 + fase) * 0.15
		r += sin(angle * 3.0 + fase) * 15.0 + float(tier) * 8.0
		h *= 0.82 + 0.18 *(0.5 + 0.5 * cos(angle * 3.0 + fase))
	if EntornoRecinto.reserva_vista(_venue_environment, angle):
		return
	var px: float = center.x + cos(angle) * r
	var pz: float = center.y + sin(angle) * r


	var d: float = w * rng.randf_range(0.6, 1.5) if rich else w
	var yaw: float = rng.randf_range(-25.0, 25.0) if rich else 0.0
	if not _venue_environment.is_empty():


		yaw = float(_venue_environment["variante"]) * 7.0 - 21.0 \
				+ float(posmod(floori((angle + PI) * 3.0), 2)) * 90.0 + yaw * 0.18
	var kind: String = _city_shape(cfg, rng) if rich else "box"
	var mat: StandardMaterial3D = _facade_mat(tier, w, h)
	match kind:
		"cyl":


			var cm: CylinderMesh = CylinderMesh.new()
			cm.top_radius = w * 0.45
			cm.bottom_radius = w * 0.45
			cm.height = h
			cm.radial_segments = 10
			_landscape_mesh(Vector3(px, h * 0.5, pz), cm, mat, yaw)
		"stepped":


			var hh: float = h * 0.52
			_landscape_mesh(Vector3(px, hh * 0.5, pz), _box(Vector3(w, hh, d)), mat, yaw)
			var h2: float = h * 0.32
			_landscape_mesh(Vector3(px, hh + h2 * 0.5, pz),
				_box(Vector3(w * 0.72, h2, d * 0.72)), _facade_mat(tier, w * 0.72, h2), yaw)
			var h3: float = h * 0.22
			_landscape_mesh(Vector3(px, hh + h2 + h3 * 0.5, pz),
				_box(Vector3(w * 0.5, h3, d * 0.5)), _facade_mat(tier, w * 0.5, h3), yaw)





			_country_roof(px, pz, h, hh + h2 + h3, w * 0.5, tier)
			return
		"twin":


			var sep: float = w * 0.62
			_landscape_mesh(Vector3(px - cos(angle + PI * 0.5) * sep, h * 0.5,
				pz - sin(angle + PI * 0.5) * sep), _box(Vector3(w * 0.8, h, d * 0.8)),
				mat, yaw)
			var h2b: float = h * rng.randf_range(0.62, 0.86)
			_landscape_mesh(Vector3(px + cos(angle + PI * 0.5) * sep, h2b * 0.5,
				pz + sin(angle + PI * 0.5) * sep),
				_box(Vector3(w * 0.8, h2b, d * 0.8)), _facade_mat(tier, w * 0.8, h2b), yaw)
		_:
			_landscape_mesh(Vector3(px, h * 0.5, pz), _box(Vector3(w, h, d)), mat, yaw)











	var top: float = h
	if h > float(cfg["h_max"]) * 0.62 and rng.randf() < 0.55:
		var sh: float = h * rng.randf_range(0.18, 0.34)
		var sw: float = w * rng.randf_range(0.5, 0.72)
		_landscape_box(Vector3(px, h + sh * 0.5, pz), Vector3(sw, sh, sw),
			_facade_mat(tier, sw, sh))
		top = h + sh
		if rng.randf() < 0.5:

			_landscape_box(Vector3(px, h + sh + 3.0, pz), Vector3(0.5, 6.0, 0.5),
				_skyline_mats[tier])
	elif rng.randf() < 0.35:
		_landscape_box(Vector3(px, h + 1.0, pz), Vector3(w * 0.35, 2.0, w * 0.35),
			_skyline_mats[tier])
		top = h + 2.0
	_country_roof(px, pz, h, top, w, tier)














func _country_roof(px: float, pz: float, h: float, top: float, w: float, tier: int) -> void:
	var kind: String = COUNTRY_ROOF.get(_country, "")
	if kind.is_empty():
		return
	var prng: RandomNumberGenerator = RandomNumberGenerator.new()
	prng.seed = hash(Vector2i(int(px * 4.0), int(pz * 4.0)))






	if prng.randf() > float(COUNTRY_ROOF_P.get(kind, 0.3)):
		return
	var mat: StandardMaterial3D = _skyline_mats[tier]
	match kind:
		"campanario":


			var th: float = maxf(h * 0.45, 7.0)
			_landscape_box(Vector3(px, top + th * 0.5, pz), Vector3(w * 0.26, th, w * 0.26), mat)
			var cone: CylinderMesh = CylinderMesh.new()
			cone.top_radius = 0.0
			cone.bottom_radius = w * 0.2
			cone.height = th * 0.42
			cone.radial_segments = 6
			_landscape_mesh(Vector3(px, top + th + cone.height * 0.5, pz), cone, mat)
		"chimenea":

			var cm: CylinderMesh = CylinderMesh.new()
			cm.top_radius = w * 0.1
			cm.bottom_radius = w * 0.15
			cm.height = maxf(h * 0.7, 10.0)
			cm.radial_segments = 8
			_landscape_mesh(Vector3(px, top + cm.height * 0.5, pz), cm, mat)
		"gablete":


			var pm: PrismMesh = PrismMesh.new()
			pm.size = Vector3(w, w * 0.42, w * 0.8)
			_landscape_mesh(Vector3(px, top + pm.size.y * 0.5, pz), pm, mat)
		"tinaco":


			var tk: CylinderMesh = CylinderMesh.new()


			tk.top_radius = clampf(w * 0.1, 1.0, 2.0)
			tk.bottom_radius = tk.top_radius
			tk.height = clampf(w * 0.16, 2.0, 4.2)
			tk.radial_segments = 8
			_landscape_mesh(Vector3(px + w * 0.22, top + tk.height * 0.5, pz), tk, mat)
			_landscape_box(Vector3(px - w * 0.2, top + 2.5, pz), Vector3(0.35, 5.0, 0.35), mat)
		"laje":




			var lh: float = maxf(h * 0.22, 5.5)
			_landscape_box(Vector3(px - w * 0.14, top + lh * 0.5, pz),
				Vector3(w * 0.26, lh, w * 0.34), mat)
			var lt: CylinderMesh = CylinderMesh.new()
			lt.top_radius = w * 0.11
			lt.bottom_radius = w * 0.11
			lt.height = w * 0.22
			lt.radial_segments = 8
			_landscape_mesh(Vector3(px + w * 0.16, top + lt.height * 0.5, pz), lt, mat)
		"tanque":




			var pat: float = maxf(h * 0.09, 3.2)
			_landscape_box(Vector3(px, top + pat * 0.5, pz), Vector3(w * 0.12, pat, w * 0.12), mat)
			var an: CylinderMesh = CylinderMesh.new()
			an.top_radius = w * 0.22
			an.bottom_radius = w * 0.22
			an.height = w * 0.2
			an.radial_segments = 8
			_landscape_mesh(Vector3(px, top + pat + an.height * 0.5, pz), an, mat)


			_landscape_box(Vector3(px + w * 0.3, top + pat * 0.9, pz - w * 0.2),
				Vector3(w * 0.24, pat * 1.8, w * 0.24), mat)
		"cartel":









			var ch: float = clampf(h * 0.24, 5.0, 14.0)
			var cwd: float = w * prng.randf_range(0.8, 1.15)












			var yaw_s: float = prng.randf_range(-35.0, 35.0)
			var cs: float = cos(deg_to_rad(yaw_s))
			var sn: float = sin(deg_to_rad(yaw_s))
			var pie: float = ch * 0.18
			for sx in [-0.3, 0.3]:
				var off: float = cwd * sx
				var leg: MeshInstance3D = _landscape_box(
					Vector3(px + off * cs, top + pie * 0.5, pz - off * sn),
					Vector3(cwd * 0.11, pie, 0.5), mat)
				leg.rotation_degrees = Vector3(0.0, yaw_s, 0.0)
			var sign: MeshInstance3D = _landscape_box(
				Vector3(px, top + pie + ch * 0.5, pz), Vector3(cwd, ch, 0.5), mat)
			sign.rotation_degrees = Vector3(0.0, yaw_s, 0.0)
		"escalones":










			var eh: float = maxf(h * 0.045, 1.1)
			for k in 4:
				var kw: float = w *(0.98 - float(k) * 0.22)
				_landscape_box(Vector3(px, top + eh *(float(k) + 0.5), pz),
					Vector3(kw, eh, w * 0.22), mat)
		"alero":




			var al: PrismMesh = PrismMesh.new()
			al.size = Vector3(w * 1.24, minf(w * 0.3, h * 0.3), w * 1.15)
			_landscape_mesh(Vector3(px, top + al.size.y * 0.5, pz), al, mat)
		"minarete":





			var mh: float = maxf(h * 0.62, 14.0)
			var mr: float = maxf(w * 0.07, 0.7)
			_landscape_box(Vector3(px, top + mh * 0.5, pz), Vector3(mr * 2.0, mh, mr * 2.0), mat)


			_landscape_box(Vector3(px, top + mh * 0.66, pz),
				Vector3(mr * 3.4, mh * 0.045, mr * 3.4), mat)
			var mcone: CylinderMesh = CylinderMesh.new()
			mcone.top_radius = 0.0
			mcone.bottom_radius = mr * 1.5
			mcone.height = mh * 0.3
			mcone.radial_segments = 6
			_landscape_mesh(Vector3(px, top + mh + mcone.height * 0.5, pz), mcone, mat)
		"cupula":






			var dr: float = w * 0.17
			var drum: CylinderMesh = CylinderMesh.new()
			drum.top_radius = dr
			drum.bottom_radius = dr
			drum.height = maxf(h * 0.14, 3.0)
			drum.radial_segments = 10
			_landscape_mesh(Vector3(px, top + drum.height * 0.5, pz), drum, mat)
			var dome: SphereMesh = SphereMesh.new()
			dome.radius = dr * 1.15
			dome.height = dr * 1.6
			dome.radial_segments = 12
			dome.rings = 5
			dome.is_hemisphere = true
			_landscape_mesh(Vector3(px, top + drum.height, pz), dome, mat)
			_landscape_box(Vector3(px, top + drum.height + dr * 1.05, pz),
				Vector3(0.3, dr * 0.9, 0.3), mat)
		"canones":





			var stack_h: float = maxf(h * 0.13, 3.0)
			for k in 3:
				_landscape_box(Vector3(px +(float(k) - 1.0) * w * 0.26,
					top + stack_h * 0.5, pz),
					Vector3(w * 0.13, stack_h, w * 0.16), mat)
		"aguja":
















			var am: PrismMesh = PrismMesh.new()
			am.size = Vector3(w * 0.78, minf(w * 0.62, h * 0.45), w * 0.7)
			_landscape_mesh(Vector3(px, top + am.size.y * 0.5, pz), am, mat)
		"torre_agua":




			var wl: float = maxf(h * 0.3, 8.0)
			_landscape_box(Vector3(px, top + wl * 0.5, pz), Vector3(w * 0.13, wl, w * 0.13), mat)
			var bowl: CylinderMesh = CylinderMesh.new()
			bowl.top_radius = w * 0.3
			bowl.bottom_radius = w * 0.22
			bowl.height = w * 0.36
			bowl.radial_segments = 10
			_landscape_mesh(Vector3(px, top + wl + bowl.height * 0.5, pz), bowl, mat)
			var cap: CylinderMesh = CylinderMesh.new()
			cap.top_radius = 0.0
			cap.bottom_radius = w * 0.3
			cap.height = w * 0.22
			cap.radial_segments = 10
			_landscape_mesh(Vector3(px, top + wl + bowl.height + cap.height * 0.5, pz), cap, mat)



func _city_shape(cfg: Dictionary, rng: RandomNumberGenerator) -> String:
	var shapes: Dictionary = cfg.get("shapes", {})
	if shapes.is_empty():
		return "box"
	var roll: float = rng.randf()
	var acc: float = 0.0
	for k in shapes:
		acc += float(shapes[k])
		if roll <= acc:
			return String(k)
	return "box"


func _box(size: Vector3) -> BoxMesh:
	var key := "%s|%s|%s" % [str(size.x), str(size.y), str(size.z)]
	if _box_mesh_cache.has(key):
		return _box_mesh_cache[key]
	var m: BoxMesh = BoxMesh.new()
	m.size = size
	_box_mesh_cache[key] = m
	return m






func _landscape_mesh(pos: Vector3, mesh: Mesh, mat: Material, yaw: float = 0.0) -> MeshInstance3D:










	var tiene_color: bool = true
	if mesh is PrimitiveMesh:
		tiene_color = false
	elif mesh is ArrayMesh:
		tiene_color =(mesh.surface_get_format(0)&Mesh.ARRAY_FORMAT_COLOR) != 0
	var variacion: float = 0.94 + 0.06 * absf(sin(pos.x * 0.17 + pos.z * 0.13))
	var visual: Mesh = mesh if tiene_color else DetalleExterior.sombrear(mesh, yaw, variacion)
	if mat is StandardMaterial3D:
		mat.vertex_color_use_as_albedo = true
		mat.vertex_color_is_srgb = true
	return _city_mesh(pos, visual, mat, yaw)


func _landscape_box(pos: Vector3, size: Vector3, mat: Material) -> MeshInstance3D:
	return _landscape_mesh(pos, _box(size), mat)


func _city_mesh(pos: Vector3, mesh: Mesh, mat: Material, yaw: float = 0.0) -> MeshInstance3D:
	var b: MeshInstance3D = MeshInstance3D.new()
	b.mesh = mesh
	b.material_override = mat
	b.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	b.position = pos
	if not is_zero_approx(yaw):
		b.rotation_degrees = Vector3(0.0, yaw, 0.0)
	_bowl_root().add_child(b)
	return b







func _adopt(parent: Node3D, node: Node3D) -> void:
	if node == null or not is_instance_valid(node):
		return
	if node.get_parent() != null:
		node.get_parent().remove_child(node)
	parent.add_child(node)



func _city_box(pos: Vector3, size: Vector3, mat: Material) -> MeshInstance3D:
	var b: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	b.mesh = box
	b.material_override = mat
	b.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	b.position = pos
	_bowl_root().add_child(b)
	return b



func _ground_color() -> Color:





	if _train and int(TRAIN_DIV.get(clampi(div, 1, 3), {}).get("privacy", 0)) > 0:
		return Color("3f5c3a")
	if not _venue_environment.is_empty():
		return EntornoRecinto.suelo(_venue_environment)
	match clampi(div, 1, 3):
		1:



			return Color("55575c")
		2:
			return Color("6b6a52")
		_:
			return Color("4c6b4a")




























func _season_env() -> Dictionary:
	var frio: float = _season_cold()
	var otonio: bool = _season_t > 0.0 and _season_t < 0.5
	var out: Dictionary = {
		"hoja": Color("8a6a2e") if otonio else Color("86a83f"),
		"vira": 0.0, "pelado": 0.0, "nieve": 0.0,
	}
	if _season_t <= 0.0:
		out["vira"] = 0.0
		return out







	out["vira"] = clampf(inverse_lerp(-0.35, 0.55, frio), 0.0, 1.0)
	out["pelado"] = clampf(inverse_lerp(0.35, 0.95, frio), 0.0, 1.0)
	out["nieve"] = clampf(inverse_lerp(0.55, 1.0, frio), 0.0, 1.0)
	return out


func _build_surroundings(center: Vector2, rng: RandomNumberGenerator) -> void:


	var est: Dictionary = _season_env()
	var foliage: StandardMaterial3D = StandardMaterial3D.new()


	var verde: Color = Color("3f5b3a").lerp(
		Color("5e6b39") if COUNTRY_DRY.has(_country)
		else Color("2f5238"), 0.55)




	foliage.albedo_color = verde.lerp(Color(est["hoja"]), float(est["vira"]) * 0.8)
	foliage.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	foliage.set_meta("paisaje_bruma", 0.25)
	var trunk: StandardMaterial3D = StandardMaterial3D.new()
	trunk.albedo_color = Color("4a3b2c")
	trunk.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var shed: StandardMaterial3D = StandardMaterial3D.new()
	shed.albedo_color = Color(_skyline_cfg()["tint"][0]).darkened(0.28)
	shed.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED


	var roof: StandardMaterial3D = StandardMaterial3D.new()



	if COUNTRY_TILE.has(_country):
		roof.albedo_color = Color("8c4a37")
	elif _country == "Japón":
		roof.albedo_color = Color("4a5560")
	else:
		roof.albedo_color = Color("5a4038")




	roof.albedo_color = roof.albedo_color.lerp(Color("e8ecf0"),
		float(est["nieve"]) * 0.62)
	roof.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED



	var rama: StandardMaterial3D = StandardMaterial3D.new()
	rama.albedo_color = Color("6b5a4a").lerp(Color("e8ecf0"), float(est["nieve"]) * 0.35)
	rama.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_env_mats = [foliage, trunk, shed, roof]
	_env_base = [foliage.albedo_color, trunk.albedo_color, shed.albedo_color,
		roof.albedo_color]
	_env_register(rama)

	var categoria: int = div if _venue_environment.is_empty() else EntornoRecinto.categoria(_venue_environment)
	var tree_frac: float = EntornoRecinto.fraccion_arboles(
		[0.35, 0.55, 0.78][clampi(categoria, 1, 3) - 1], _venue_environment)


	var mat_arbol: StandardMaterial3D = _lm_mat(Color.WHITE)
	mat_arbol.set_meta("paisaje_bruma", 0.25)
	var props: int = 46
	for i in props:
		await _respira()
		var angle: float =(TAU / props) * i + rng.randf_range(-0.08, 0.08)
		if not _venue_environment.is_empty():
			angle += sin(angle * 4.0 + float(_venue_environment["variante"])) * 0.12
		if EntornoRecinto.reserva_vista(_venue_environment, angle):
			continue
		var r: float = rng.randf_range(90.0, 138.0)
		var px: float = center.x + cos(angle) * r
		var pz: float = center.y + sin(angle) * r
		if rng.randf() < tree_frac:


			var th: float = rng.randf_range(4.5, 9.0)
			var cw: float = th * rng.randf_range(0.7, 1.0)
			var especie: String = DetalleExterior.especie(_country, i)
			if especie != "redondo":
				var follaje_perenne: Color = verde if especie in ["palmera", "cipres"] else foliage.albedo_color
				_landscape_mesh(Vector3(px, 0.0, pz),
					DetalleExterior.arbol(especie, th * 1.3, cw, follaje_perenne, i * 7919), mat_arbol)
				continue
			_landscape_box(Vector3(px, th * 0.25, pz), Vector3(0.8, th * 0.5, 0.8), trunk)





			var pelado: float = float(est["pelado"])
			var copa_mat: StandardMaterial3D = rama if pelado > 0.5 else foliage



			var cw_hoja: float = cw * lerp(1.0, 0.52, pelado)
			if COUNTRY_CONIFER.has(_country):








				var pine: CylinderMesh = CylinderMesh.new()
				pine.top_radius = 0.0
				pine.bottom_radius = cw * 0.38
				pine.height = th * 0.95
				pine.radial_segments = 6
				_landscape_mesh(Vector3(px, th * 0.5 + th * 0.4, pz), pine, foliage)
				var tip: CylinderMesh = CylinderMesh.new()
				tip.top_radius = 0.0
				tip.bottom_radius = cw * 0.24
				tip.height = th * 0.6
				tip.radial_segments = 6
				_landscape_mesh(Vector3(px, th * 0.5 + th * 0.95, pz), tip, foliage)
			else:
				var copa: SphereMesh = SphereMesh.new()
				copa.radius = cw_hoja * 0.53
				copa.height = cw_hoja *(0.85 if i % 3 == 0 else 1.3)
				copa.radial_segments = 7
				copa.rings = 3
				_landscape_mesh(Vector3(px + cw_hoja * 0.1 * sin(float(i)),
					th * 0.5 + copa.height * 0.35, pz), copa, copa_mat)
		else:

















			var bh: float = rng.randf_range(5.0, 11.0) \
					* [1.85, 1.3, 1.0][clampi(categoria, 1, 3) - 1]
			var bw: float = rng.randf_range(14.0, 28.0)
			var bd: float = rng.randf_range(10.0, 20.0)
			if not _venue_environment.is_empty():


				px = center.x + cos(angle) *(r + 24.0)
				pz = center.y + sin(angle) *(r + 24.0)
				bh *= 0.85
				bw *= 0.8
				bd *= 0.85
			var yaw: float = rad_to_deg(angle) + rng.randf_range(-25.0, 25.0)
			var b: MeshInstance3D = _landscape_box(Vector3(px, bh * 0.5, pz),
				Vector3(bw, bh, bd), _facade_mat(0, bw, bh))
			b.rotation_degrees = Vector3(0.0, yaw, 0.0)
			var base: MeshInstance3D = _landscape_box(Vector3(px, 0.7, pz),
				Vector3(bw + 0.6, 1.4, bd + 0.6), shed)
			base.rotation_degrees = Vector3(0.0, yaw, 0.0)
			var top: MeshInstance3D = _landscape_box(Vector3(px, bh + 0.28, pz),
				Vector3(bw + 0.9, 0.56, bd + 0.9), shed)
			top.rotation_degrees = Vector3(0.0, yaw, 0.0)



			if categoria >= 2 and rng.randf() <(0.75 if categoria == 3 else 0.4):
				var pr: MeshInstance3D = MeshInstance3D.new()
				var prism: PrismMesh = PrismMesh.new()
				prism.size = Vector3(bw * 1.06, bh * 0.45, bd * 1.06)
				pr.mesh = DetalleExterior.sombrear(prism, yaw)
				roof.vertex_color_use_as_albedo = true
				roof.vertex_color_is_srgb = true
				pr.material_override = roof
				pr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
				pr.position = Vector3(px, bh + bh * 0.225, pz)
				pr.rotation_degrees = Vector3(0.0, yaw, 0.0)
				_bowl_root().add_child(pr)
	await _respira()
	_end_treeline(rng, foliage, trunk)
	await _respira()
	_build_landmark(center, rng, shed, roof)











































func _end_treeline(rng: RandomNumberGenerator, foliage: StandardMaterial3D,
		trunk: StandardMaterial3D) -> void:
	if not bool(FOOTPRINT_CFG.get(footprint, {}).get("end_trees", false)):
		return










	var deep: StandardMaterial3D = StandardMaterial3D.new()
	deep.albedo_color = foliage.albedo_color.darkened(0.22)
	deep.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_env_register(deep)


	for row in 2:
		var z: float = -24.0 - float(row) * 9.0

		var half: float = 42.0 + float(row) * 11.0
		var step: float = 6.4
		var n: int = int(half * 2.0 / step)


		var phase: float = 0.5 * float(row)
		for i in n:
			var x: float = - half + step *(float(i) + phase + rng.randf_range(0.1, 0.6))
			var zz: float = z + rng.randf_range(-2.6, 2.6)
			var th: float = rng.randf_range(5.0, 9.0)
			var cw: float = th * rng.randf_range(0.42, 0.62)
			var mat: StandardMaterial3D = deep if row == 1 or rng.randf() < 0.3 \
					else foliage
			_city_box(Vector3(x, th * 0.28, zz), Vector3(0.7, th * 0.56, 0.7), trunk)
			_city_box(Vector3(x, th * 0.56 + cw * 0.45, zz), Vector3(cw, cw * 1.15, cw), mat)

			var cap: float = cw * rng.randf_range(0.5, 0.72)
			_city_box(Vector3(x + rng.randf_range(- cw, cw) * 0.3,
				th * 0.56 + cw * 1.05 + cap * 0.4,
				zz + rng.randf_range(-0.8, 0.8)),
				Vector3(cap, cap, cap), mat)






func _env_register(mat: StandardMaterial3D) -> StandardMaterial3D:
	_env_mats.append(mat)
	_env_base.append(mat.albedo_color)
	return mat























func _build_landmark(center: Vector2, rng: RandomNumberGenerator,
		shed: StandardMaterial3D, roof: StandardMaterial3D) -> void:



	if not _venue_environment.is_empty():
		var a_recinto: float = EntornoRecinto.eje(_venue_environment)
		var hojas: Color = Color("3f5b3a")
		if not _env_base.is_empty():
			hojas = _env_base[0]
		EntornoRecinto.construir_firma(_venue_environment, center, a_recinto,
			_landscape_box, _landscape_mesh, _lm_mat, hojas, _country)
		preload("res://features/stadium/neighborhood_life.gd").construir(
			_venue_environment, center, a_recinto, _club_a, _club_b,


			_derby or _big_night or _is_final or party or _comp == "liguilla",
			_landscape_mesh, _lm_mat)
		return







	var a: float = rng.randf_range(1.15, 1.95) + PI






	var r: float = rng.randf_range(190.0, 215.0)
	var px: float = center.x + cos(a) * r
	var pz: float = center.y + sin(a) * r




	var kind: String = String(COUNTRY_LANDMARK.get(_country, ""))
	if kind.is_empty():
		kind = ["grua", "silos", "campanario"][clampi(div, 1, 3) - 1]
	match kind:
		"grua":

			var steel: StandardMaterial3D = _lm_mat(Color("c8b048"))
			var mast_h: float = rng.randf_range(46.0, 62.0)
			_city_box(Vector3(px, mast_h * 0.5, pz), Vector3(1.6, mast_h, 1.6), steel)
			var jib: MeshInstance3D = _city_box(Vector3(px, mast_h, pz),
				Vector3(42.0, 1.1, 1.3), steel)
			jib.position += Vector3(cos(a + 1.57) * 13.0, 0.0, sin(a + 1.57) * 13.0)
			jib.rotation_degrees = Vector3(0.0, rad_to_deg(a + 1.57), 0.0)

			_city_box(Vector3(px + 8.0, 14.0, pz + 6.0), Vector3(20.0, 28.0, 20.0), shed)
		"silos":

			for k in 2:
				var cm: CylinderMesh = CylinderMesh.new()
				cm.top_radius = 4.2
				cm.bottom_radius = 4.2
				cm.height = 26.0
				_city_mesh(Vector3(px + k * 10.0, 13.0, pz), cm, shed)
			_city_box(Vector3(px + 5.0, 27.5, pz), Vector3(14.0, 2.0, 3.0), shed)
		"campanario":

			var stone: StandardMaterial3D = _lm_mat(Color("cfc4a8"))
			_city_box(Vector3(px, 9.0, pz), Vector3(5.0, 18.0, 5.0), stone)
			var sp: PrismMesh = PrismMesh.new()
			sp.size = Vector3(5.4, 7.0, 5.4)
			_city_mesh(Vector3(px, 21.5, pz), sp, roof)
			_city_box(Vector3(px + 8.0, 4.5, pz + 2.0), Vector3(12.0, 9.0, 8.0), stone)
		"montana":
			_lm_montana(center, a, rng)
		"piramide":



			var sand: StandardMaterial3D = _lm_mat(Color("cbb994"))
			var pyr: CylinderMesh = CylinderMesh.new()
			pyr.top_radius = 0.0
			pyr.bottom_radius = 26.0
			pyr.height = 33.0
			pyr.radial_segments = 4
			_city_mesh(Vector3(px, 21.0, pz), pyr, sand)


			var pyr2: CylinderMesh = CylinderMesh.new()
			pyr2.top_radius = 0.0
			pyr2.bottom_radius = 15.0
			pyr2.height = 19.0
			pyr2.radial_segments = 4
			_city_mesh(Vector3(px + 36.0, 9.5, pz - 14.0), pyr2, sand)
		"piramide_esc":


			var basalt: StandardMaterial3D = _lm_mat(Color("8e8578"))
			for k in 4:
				var side: float = 52.0 - float(k) * 11.0
				_city_box(Vector3(px, 4.0 + float(k) * 8.0, pz),
					Vector3(side, 8.0, side * 0.9), basalt)
		"torre_celosia":




			var iron: StandardMaterial3D = _lm_mat(Color("a1795a"))




			for sx in [-1.0, 1.0]:
				var leg2: MeshInstance3D = _city_box(
					Vector3(px + sx * 7.5, 13.0, pz), Vector3(2.4, 28.0, 3.0), iron)
				leg2.rotation_degrees = Vector3(0.0, 0.0, sx * 11.0)

			_city_box(Vector3(px, 26.0, pz), Vector3(17.0, 2.2, 8.0), iron)
			_city_box(Vector3(px, 40.0, pz), Vector3(8.0, 26.0, 5.0), iron)
			_city_box(Vector3(px, 52.0, pz), Vector3(9.0, 1.8, 6.0), iron)
			_city_box(Vector3(px, 62.0, pz), Vector3(1.2, 20.0, 1.2), iron)
		"torre_tv":


			var conc: StandardMaterial3D = _lm_mat(Color("c2c0bb"))
			var shaft: CylinderMesh = CylinderMesh.new()
			shaft.top_radius = 1.5
			shaft.bottom_radius = 3.4
			shaft.height = 64.0
			shaft.radial_segments = 8
			_city_mesh(Vector3(px, 32.0, pz), shaft, conc)



			var bulb: SphereMesh = SphereMesh.new()
			bulb.radius = 11.0
			bulb.height = 16.0
			bulb.radial_segments = 12
			bulb.rings = 6
			_city_mesh(Vector3(px, 56.0, pz), bulb, conc)
			_city_box(Vector3(px, 76.0, pz), Vector3(0.9, 26.0, 0.9), conc)
		"torre_reloj":



			var pale: StandardMaterial3D = _lm_mat(Color("cbbb92"))
			var face: StandardMaterial3D = _lm_mat(Color("efe9d8"))
			_city_box(Vector3(px, 21.0, pz), Vector3(9.0, 42.0, 9.0), pale)
			_city_box(Vector3(px, 36.0, pz + 4.7), Vector3(5.4, 5.4, 0.6), face)
			_city_box(Vector3(px + 4.7, 36.0, pz), Vector3(0.6, 5.4, 5.4), face)
			var croof: PrismMesh = PrismMesh.new()
			croof.size = Vector3(9.6, 13.0, 9.6)
			_city_mesh(Vector3(px, 48.5, pz), croof, pale)
		"obelisco":


			var white: StandardMaterial3D = _lm_mat(Color("ddd8cc"))
			var ob: CylinderMesh = CylinderMesh.new()
			ob.top_radius = 2.0
			ob.bottom_radius = 4.6
			ob.height = 46.0
			ob.radial_segments = 4
			_city_mesh(Vector3(px, 23.0, pz), ob, white)
			var tip: CylinderMesh = CylinderMesh.new()
			tip.top_radius = 0.0
			tip.bottom_radius = 2.0
			tip.height = 6.0
			tip.radial_segments = 4
			_city_mesh(Vector3(px, 49.0, pz), tip, white)
		"rascacielos":



			var glass: StandardMaterial3D = _lm_mat(Color("9fb0bd"))
			for k in 3:
				var side: float = 22.0 - float(k) * 5.0
				_city_box(Vector3(px, 15.0 + float(k) * 28.0, pz),
					Vector3(side, 30.0, side), glass)
			_city_box(Vector3(px, 96.0, pz), Vector3(1.0, 22.0, 1.0), glass)
		"molino":


			var wood: StandardMaterial3D = _lm_mat(Color("8a7059"))
			var sail: StandardMaterial3D = _lm_mat(Color("e2dccb"))
			var body: CylinderMesh = CylinderMesh.new()
			body.top_radius = 4.0
			body.bottom_radius = 7.0
			body.height = 22.0
			body.radial_segments = 8
			_city_mesh(Vector3(px, 11.0, pz), body, wood)
			_city_box(Vector3(px, 23.5, pz), Vector3(8.0, 3.0, 8.0), wood)
			for k in 2:
				var blade: MeshInstance3D = _city_box(Vector3(px, 24.0, pz - 4.5),
					Vector3(26.0, 2.2, 0.5) if k == 0 else Vector3(2.2, 26.0, 0.5), sail)
				blade.rotation_degrees = Vector3(0.0, 0.0, 22.0)
		"puente":



			var red: StandardMaterial3D = _lm_mat(Color("9a5a4a"))
			for k in 2:
				var bx: float = px + float(k) * 44.0
				_city_box(Vector3(bx - 6.0, 24.0, pz), Vector3(3.0, 48.0, 3.0), red)
				_city_box(Vector3(bx + 6.0, 24.0, pz), Vector3(3.0, 48.0, 3.0), red)
				_city_box(Vector3(bx, 42.0, pz), Vector3(15.0, 2.6, 3.0), red)
			_city_box(Vector3(px + 22.0, 15.0, pz), Vector3(78.0, 2.4, 8.0), red)
		"faro":


			var white_f: StandardMaterial3D = _lm_mat(Color("e4ddd0"))
			var band: StandardMaterial3D = _lm_mat(Color("a8564a"))
			for k in 3:
				var seg: CylinderMesh = CylinderMesh.new()
				seg.top_radius = 3.0 - float(k) * 0.35
				seg.bottom_radius = 3.6 - float(k) * 0.35
				seg.height = 9.0
				seg.radial_segments = 8
				_city_mesh(Vector3(px, 4.5 + float(k) * 9.0, pz), seg,
					white_f if k % 2 == 0 else band)
			_city_box(Vector3(px, 28.5, pz), Vector3(6.4, 1.2, 6.4), band)
			var lamp: CylinderMesh = CylinderMesh.new()
			lamp.top_radius = 2.2
			lamp.bottom_radius = 2.2
			lamp.height = 4.0
			lamp.radial_segments = 8
			_city_mesh(Vector3(px, 31.0, pz), lamp, white_f)
			var cap: CylinderMesh = CylinderMesh.new()
			cap.top_radius = 0.0
			cap.bottom_radius = 2.6
			cap.height = 2.6
			cap.radial_segments = 8
			_city_mesh(Vector3(px, 34.3, pz), cap, band)
		"castillo":



			var rock: StandardMaterial3D = _lm_mat(Color("7c7468"))
			var wall: StandardMaterial3D = _lm_mat(Color("a89e8c"))
			_city_box(Vector3(px, 5.0, pz), Vector3(58.0, 10.0, 26.0), rock)
			_city_box(Vector3(px, 17.0, pz), Vector3(44.0, 14.0, 14.0), wall)
			for k in 2:
				var tx: float = px - 20.0 + float(k) * 40.0
				var tw: CylinderMesh = CylinderMesh.new()
				tw.top_radius = 5.0
				tw.bottom_radius = 5.4
				tw.height = 26.0
				tw.radial_segments = 8
				_city_mesh(Vector3(tx, 23.0, pz), tw, wall)
				var tcap: CylinderMesh = CylinderMesh.new()
				tcap.top_radius = 0.0
				tcap.bottom_radius = 6.2
				tcap.height = 8.0
				tcap.radial_segments = 8
				_city_mesh(Vector3(tx, 40.0, pz), tcap, rock)
		"acropolis":



			var marble: StandardMaterial3D = _lm_mat(Color("ddd6c2"))
			var hill: StandardMaterial3D = _lm_mat(Color("8d8677"))
			_city_box(Vector3(px, 7.0, pz), Vector3(62.0, 14.0, 34.0), hill)
			_city_box(Vector3(px, 15.0, pz), Vector3(34.0, 2.0, 18.0), marble)
			for k in 6:
				_city_box(Vector3(px - 14.0 + float(k) * 5.6, 22.0, pz),
					Vector3(2.2, 12.0, 2.2), marble)
			_city_box(Vector3(px, 29.0, pz), Vector3(36.0, 2.4, 19.0), marble)
			var ped: PrismMesh = PrismMesh.new()
			ped.size = Vector3(36.0, 6.0, 19.0)
			_city_mesh(Vector3(px, 33.2, pz), ped, marble)
		"mezquita":



			var dome_m: StandardMaterial3D = _lm_mat(Color("bfc4c0"))
			var wall_m: StandardMaterial3D = _lm_mat(Color("d8d2c2"))
			_city_box(Vector3(px, 5.5, pz), Vector3(26.0, 11.0, 20.0), wall_m)
			var dm: SphereMesh = SphereMesh.new()
			dm.radius = 9.5
			dm.height = 13.0
			dm.radial_segments = 14
			dm.rings = 6
			dm.is_hemisphere = true
			_city_mesh(Vector3(px, 11.0, pz), dm, dome_m)
			for k in 2:
				var mx: float = px - 18.0 + float(k) * 36.0
				_city_box(Vector3(mx, 17.0, pz), Vector3(2.6, 34.0, 2.6), wall_m)
				var mc: CylinderMesh = CylinderMesh.new()
				mc.top_radius = 0.0
				mc.bottom_radius = 2.0
				mc.height = 7.0
				mc.radial_segments = 6
				_city_mesh(Vector3(mx, 37.5, pz), mc, wall_m)
		"cupula_grande":



			var stone_c: StandardMaterial3D = _lm_mat(Color("d4cbb4"))
			var lead: StandardMaterial3D = _lm_mat(Color("8f9a95"))
			_city_box(Vector3(px, 9.0, pz), Vector3(30.0, 18.0, 24.0), stone_c)
			var drum_c: CylinderMesh = CylinderMesh.new()
			drum_c.top_radius = 10.0
			drum_c.bottom_radius = 10.0
			drum_c.height = 12.0
			drum_c.radial_segments = 14
			_city_mesh(Vector3(px, 24.0, pz), drum_c, stone_c)
			var dome_c: SphereMesh = SphereMesh.new()
			dome_c.radius = 11.0
			dome_c.height = 17.0
			dome_c.radial_segments = 14
			dome_c.rings = 6
			dome_c.is_hemisphere = true
			_city_mesh(Vector3(px, 30.0, pz), dome_c, lead)
			_city_box(Vector3(px, 49.0, pz), Vector3(3.0, 8.0, 3.0), stone_c)
		"puerto":


			var crane: StandardMaterial3D = _lm_mat(Color("bdb3a0"))
			for k in 2:
				var cx: float = px + float(k) * 34.0
				for leg in [-8.0, 8.0]:
					_city_box(Vector3(cx + leg, 14.0, pz), Vector3(2.2, 28.0, 2.2), crane)
				_city_box(Vector3(cx, 29.0, pz), Vector3(22.0, 3.0, 6.0), crane)
				var boom: MeshInstance3D = _city_box(Vector3(cx - 16.0, 33.0, pz),
					Vector3(44.0, 2.0, 3.0), crane)
				boom.rotation_degrees = Vector3(0.0, 0.0, -8.0)
		_:
			push_warning("hito de país sin caso: %s" % kind)





















func _build_railway(center: Vector2, rng: RandomNumberGenerator,
		dist: float = RAIL_DIST, alto: float = RAIL_Y,
		deck_color: Color = RAIL_DECK, hueco: float = 0.0) -> void:
	var z: float = center.y - dist



	var deck: StandardMaterial3D = _lm_mat(deck_color)



	_city_box(Vector3(center.x, alto, z), Vector3(RAIL_HALF * 2.2, 1.1, 5.4), deck)
	var pilares: int = int(RAIL_HALF * 2.2 / 40.0)
	for i in pilares:
		var pxl: float = center.x - RAIL_HALF * 1.1 + float(i) * 40.0 + 20.0




		if absf(pxl - center.x) < hueco:
			continue
		_city_box(Vector3(pxl,(alto - 0.8) * 0.5, z),
			Vector3(2.6, alto - 0.8, 3.4), deck)








	_rail_node = Node3D.new()
	_rail_node.name = "Tren"






	_rail_node.position.z = z
	_rail_center_x = center.x
	_rail_node.position.x = _rail_center_x
	_bowl_root().add_child(_rail_node)
	_tren_convoy(alto + 0.8)


	_rail_wait = rng.randf_range(RAIL_GAP_MIN, RAIL_GAP_MAX)
	_rail_dir = 1.0 if rng.randf() < 0.5 else -1.0
	_rail_node.visible = false




























func _tren_convoy(y0: float) -> void:
	var lc: float = TREN_LARGO_COCHE
	var w2: float = 1.5
	var lotes: Dictionary = {}
	for c in [TREN_CARROCERIA, TREN_PUERTA, TREN_FRANJA, TREN_TECHO, TREN_BAJOS, TREN_CRISTAL]:
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		lotes[c] = st
	var ventanas: SurfaceTool = SurfaceTool.new()
	ventanas.begin(Mesh.PRIMITIVE_TRIANGLES)
	var faros: SurfaceTool = SurfaceTool.new()
	faros.begin(Mesh.PRIMITIVE_TRIANGLES)
	var pilotos: SurfaceTool = SurfaceTool.new()
	pilotos.begin(Mesh.PRIMITIVE_TRIANGLES)
	var letrero: SurfaceTool = SurfaceTool.new()
	letrero.begin(Mesh.PRIMITIVE_TRIANGLES)
	for i in RAIL_CARS + 1:
		var cx: float = - float(i) * RAIL_CAR_LEN
		var xa: float = cx - lc * 0.5
		var xb: float = cx + lc * 0.5
		var cabeza: bool = i == 0
		var cola: bool = i == RAIL_CARS



		for s in [-1.0, 1.0]:
			var bx: float = cx + s *(lc * 0.5 - 2.1)
			_tren_bloque(lotes[TREN_BAJOS], bx - 1.2, bx + 1.2, y0 - 0.25, y0 + 0.7, -1.25, 1.25)
		_tren_bloque(lotes[TREN_BAJOS], xa + 0.1, xb - 0.1, y0 + 0.55, y0 + 1.05, -1.35, 1.35)


		_tren_bloque(lotes[TREN_CARROCERIA], xa, xb, y0 + 1.0, y0 + 3.9, - w2, w2,
			Vector4(0.0, TREN_MORRO if cola else 0.0, 0.0, - TREN_MORRO if cabeza else 0.0))

		_tren_bloque(lotes[TREN_TECHO], xa +(TREN_MORRO if cola else 0.1),
			xb -(TREN_MORRO if cabeza else 0.1), y0 + 3.9, y0 + 4.4, -1.3, 1.3)
		for s in [-1.0, 1.0]:
			_tren_bloque(lotes[TREN_TECHO], cx + s * 2.6 - 0.8, cx + s * 2.6 + 0.8,
				y0 + 4.4, y0 + 4.72, -0.85, 0.85)

		_tren_bloque(lotes[TREN_FRANJA], xa +(TREN_MORRO if cola else 0.0),
			xb -(TREN_MORRO if cabeza else 0.0), y0 + 2.38, y0 + 2.62, - w2 - 0.02, w2 + 0.02)





		var x: float = xa +(2.0 if cola else 0.5)
		var fin: float = xb -(2.0 if cabeza else 0.5)
		var puertas: int = 2 if (cabeza or cola) else 3
		var ancho_v: float =(fin - x - float(puertas) * 1.3) / float(puertas + 1)
		for p in puertas + 1:
			_tren_bloque(lotes[TREN_CRISTAL], x, x + ancho_v, y0 + 2.65, y0 + 3.55,
				- w2 - 0.02, w2 + 0.02)
			_tren_bloque(ventanas, x + 0.08, x + ancho_v - 0.08, y0 + 2.72, y0 + 3.5,
				- w2 - 0.04, w2 + 0.04)
			x += ancho_v
			if p < puertas:
				_tren_bloque(lotes[TREN_PUERTA], x, x + 1.3, y0 + 1.15, y0 + 3.7,
					- w2 - 0.03, w2 + 0.03)
				_tren_bloque(lotes[TREN_CRISTAL], x + 0.15, x + 1.15, y0 + 2.75, y0 + 3.5,
					- w2 - 0.05, w2 + 0.05)
				_tren_bloque(ventanas, x + 0.2, x + 1.1, y0 + 2.8, y0 + 3.45,
					- w2 - 0.07, w2 + 0.07)
				x += 1.3


		if cabeza or cola:
			var dir: float = 1.0 if cabeza else -1.0
			var xt: float = xb if cabeza else xa
			_tren_placa_morro(lotes[TREN_CRISTAL], xt, dir, y0, y0 + 2.45, y0 + 3.65, -1.2, 1.2, 0.04)
			_tren_placa_morro(letrero, xt, dir, y0, y0 + 3.7, y0 + 3.86, -0.6, 0.6, 0.05)
			for s in [-1.0, 1.0]:
				_tren_placa_morro(faros if cabeza else pilotos, xt, dir, y0, y0 + 1.5, y0 + 1.85,
					s * 0.75 - 0.2, s * 0.75 + 0.2, 0.05)

		if i < RAIL_CARS:
			_tren_bloque(lotes[TREN_BAJOS], xa - 0.85, xa + 0.05, y0 + 1.1, y0 + 3.5, -1.0, 1.0)

		if i % 2 == 1:
			var yt: float = y0 + 4.4
			_tren_bloque(lotes[TREN_BAJOS], cx - 0.35, cx + 0.35, yt, yt + 0.12, -0.8, 0.8)
			_tren_barra(lotes[TREN_BAJOS], Vector3(cx - 0.6, yt + 0.1, 0.0), Vector3(cx + 0.1, yt + 0.75, 0.0), 0.1)
			_tren_barra(lotes[TREN_BAJOS], Vector3(cx + 0.1, yt + 0.75, 0.0), Vector3(cx + 0.6, yt + 1.12, 0.0), 0.1)
			_tren_bloque(lotes[TREN_BAJOS], cx + 0.45, cx + 0.75, yt + 1.1, yt + 1.2, -0.9, 0.9)

	var malla: ArrayMesh = ArrayMesh.new()
	for c in lotes:
		var st: SurfaceTool = lotes[c]
		var mat: StandardMaterial3D = _lm_mat(c)
		mat.vertex_color_use_as_albedo = true
		st.set_material(mat)
		malla = st.commit(malla)
	var cuerpo: MeshInstance3D = MeshInstance3D.new()
	cuerpo.name = "Cuerpo"
	cuerpo.mesh = malla
	cuerpo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_rail_node.add_child(cuerpo)


	var faro_mat: StandardMaterial3D = StandardMaterial3D.new()
	faro_mat.albedo_color = Color("fff6dc")
	faro_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	faro_mat.emission_enabled = true
	faro_mat.emission = Color("fff6dc")
	faro_mat.emission_energy_multiplier = 2.0
	var piloto_mat: StandardMaterial3D = StandardMaterial3D.new()
	piloto_mat.albedo_color = Color("ff2b2b")
	piloto_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	piloto_mat.emission_enabled = true
	piloto_mat.emission = Color("ff2b2b")
	piloto_mat.emission_energy_multiplier = 1.6
	var letrero_mat: StandardMaterial3D = StandardMaterial3D.new()
	letrero_mat.albedo_color = Color("ffb347")
	letrero_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	letrero_mat.emission_enabled = true
	letrero_mat.emission = Color("ffb347")
	letrero_mat.emission_energy_multiplier = 1.4
	var luces_malla: ArrayMesh = ArrayMesh.new()
	faros.set_material(faro_mat)
	luces_malla = faros.commit(luces_malla)
	pilotos.set_material(piloto_mat)
	luces_malla = pilotos.commit(luces_malla)
	letrero.set_material(letrero_mat)
	luces_malla = letrero.commit(luces_malla)
	var luces: MeshInstance3D = MeshInstance3D.new()
	luces.name = "Luces"
	luces.mesh = luces_malla
	luces.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_rail_node.add_child(luces)




	var lit: StandardMaterial3D = StandardMaterial3D.new()
	lit.albedo_color = Color("ffe9a8")
	lit.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	lit.emission_enabled = true
	lit.emission = Color("ffe9a8")
	lit.emission_energy_multiplier = 1.5
	ventanas.set_material(lit)
	_rail_glow = MeshInstance3D.new()
	_rail_glow.name = "Ventanas"
	_rail_glow.mesh = ventanas.commit()
	_rail_glow.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_rail_glow.visible = false
	_rail_node.add_child(_rail_glow)





func _tren_hexaedro(st: SurfaceTool, e: PackedVector3Array) -> void:
	_tren_cara(st, e[4], e[7], e[6], e[5])
	_tren_cara(st, e[0], e[1], e[2], e[3])
	_tren_cara(st, e[1], e[5], e[6], e[2])
	_tren_cara(st, e[0], e[3], e[7], e[4])
	_tren_cara(st, e[3], e[2], e[6], e[7])
	_tren_cara(st, e[0], e[4], e[5], e[1])




func _tren_cara(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3, d: Vector3) -> void:
	var n: Vector3 =(b - a).cross(c - a).normalized()


	var f: float = 0.88 * n.z * n.z + 0.7 * n.x * n.x +(1.0 if n.y > 0.0 else 0.5) * n.y * n.y
	st.set_color(Color(f, f, f))
	st.set_normal(n)
	st.add_vertex(a)
	st.add_vertex(c)
	st.add_vertex(b)
	st.add_vertex(a)
	st.add_vertex(d)
	st.add_vertex(c)





func _tren_bloque(st: SurfaceTool, x0: float, x1: float, ya: float, yb: float,
		z0: float, z1: float, des: Vector4 = Vector4.ZERO) -> void:
	_tren_hexaedro(st, PackedVector3Array([
		Vector3(x0 + des.x, ya, z0), Vector3(x1 + des.z, ya, z0),
		Vector3(x1 + des.z, ya, z1), Vector3(x0 + des.x, ya, z1),
		Vector3(x0 + des.y, yb, z0), Vector3(x1 + des.w, yb, z0),
		Vector3(x1 + des.w, yb, z1), Vector3(x0 + des.y, yb, z1)]))






func _tren_placa_morro(st: SurfaceTool, xt: float, dir: float, y_base: float,
		ya: float, yb: float, z0: float, z1: float, saliente: float) -> void:
	var fa: float = xt - dir * TREN_MORRO * clampf((ya -(y_base + 1.0)) / 2.9, 0.0, 1.0)
	var fb: float = xt - dir * TREN_MORRO * clampf((yb -(y_base + 1.0)) / 2.9, 0.0, 1.0)
	var frente_a: float = fa + dir * saliente
	var frente_b: float = fb + dir * saliente
	var fondo_a: float = fa - dir * 0.15
	var fondo_b: float = fb - dir * 0.15

	var x0a: float = fondo_a if dir > 0.0 else frente_a
	var x1a: float = frente_a if dir > 0.0 else fondo_a
	var x0b: float = fondo_b if dir > 0.0 else frente_b
	var x1b: float = frente_b if dir > 0.0 else fondo_b
	_tren_hexaedro(st, PackedVector3Array([
		Vector3(x0a, ya, z0), Vector3(x1a, ya, z0), Vector3(x1a, ya, z1), Vector3(x0a, ya, z1),
		Vector3(x0b, yb, z0), Vector3(x1b, yb, z0), Vector3(x1b, yb, z1), Vector3(x0b, yb, z1)]))





func _tren_barra(st: SurfaceTool, a: Vector3, b: Vector3, g: float) -> void:
	var d: Vector3 =(b - a).normalized()
	var u: Vector3 = Vector3(0.0, 0.0, 1.0).cross(d).normalized()
	var v: Vector3 = Vector3(0.0, 0.0, 1.0)
	var h: float = g * 0.5
	_tren_hexaedro(st, PackedVector3Array([
		a - u * h - v * h, b - u * h - v * h, b - u * h + v * h, a - u * h + v * h,
		a + u * h - v * h, b + u * h - v * h, b + u * h + v * h, a + u * h + v * h]))








func _tick_train(amb: float) -> void:
	if _rail_node == null or not is_instance_valid(_rail_node):
		return
	if _rail_wait > 0.0:
		_rail_wait -= amb
		if _rail_wait <= 0.0:

			_rail_x = - RAIL_HALF * _rail_dir - float(RAIL_CARS) * RAIL_CAR_LEN * _rail_dir
			_rail_node.position.x = _rail_center_x + _rail_x
			_rail_node.rotation_degrees.y = 0.0 if _rail_dir > 0.0 else 180.0
			_rail_node.visible = true
		return
	_rail_x += RAIL_SPEED * amb * _rail_dir
	_rail_node.position.x = _rail_center_x + _rail_x
	_rail_node.rotation_degrees.y = 0.0 if _rail_dir > 0.0 else 180.0
	if absf(_rail_x) > RAIL_HALF + float(RAIL_CARS) * RAIL_CAR_LEN:

		_rail_node.visible = false
		_rail_dir = - _rail_dir
		_rail_wait = randf_range(RAIL_GAP_MIN, RAIL_GAP_MAX)






func _lm_mat(color: Color) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	return _env_register(mat)








func _lm_montana(center: Vector2, a: float, rng: RandomNumberGenerator) -> void:
	var rock: StandardMaterial3D = _lm_mat(Color("6b7484"))
	var snow: StandardMaterial3D = _lm_mat(Color("cfd6e0"))
	for k in 2:


		var rr: float = 760.0 + float(k) * 110.0
		var aa: float = a +(0.0 if k == 0 else rng.randf_range(0.28, 0.44))
		var mx: float = center.x + cos(aa) * rr
		var mz: float = center.y + sin(aa) * rr
		var high: float =(168.0 if k == 0 else 116.0)
		var monte: CylinderMesh = CylinderMesh.new()
		monte.top_radius = 22.0
		monte.bottom_radius = 190.0
		monte.height = high
		monte.radial_segments = 16
		_city_mesh(Vector3(mx, high * 0.5 - 12.0, mz), monte, rock)

		var cap: CylinderMesh = CylinderMesh.new()
		cap.top_radius = 0.0
		cap.bottom_radius = 40.0
		cap.height = 26.0
		cap.radial_segments = 16
		_city_mesh(Vector3(mx, high - 12.0, mz), cap, snow)





func _build_birds() -> void:
	_birds = Particulas.nodo()
	_birds.amount = 10
	_birds.lifetime = 18.0
	_birds.fixed_fps = 20
	_birds.preprocess = 18.0
	_birds.emitting = false
	_birds.visible = false
	_birds.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_birds.visibility_aabb = AABB(Vector3(-140.0, -10.0, -140.0), Vector3(280.0, 60.0, 280.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	pm.emission_box_extents = Vector3(120.0, 6.0, 120.0)
	pm.direction = Vector3(1.0, 0.0, 0.3)
	pm.spread = 60.0
	pm.gravity = Vector3.ZERO
	pm.initial_velocity_min = 2.0
	pm.initial_velocity_max = 4.0
	_birds.process_material = pm
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.9, 0.35)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.15, 0.15, 0.18)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	quad.material = mat
	_birds.draw_pass_1 = quad
	_birds.position = Vector3(0.0, 42.0, HALF_LINE)
	_bowl_root().add_child(_birds)
















































func _build_sprinklers() -> void:







	if _roof or _train or div >= 2:
		return
	var z_end: float = FIELD_DEPTH + SPRINK_END_Z

	var sitios: Array = []
	for z in SPRINK_Z_SIDE:
		sitios.append([Vector3(- SPRINK_X, 0.06, z), Vector3(1.0, 0.0, 0.0)])
		sitios.append([Vector3(SPRINK_X, 0.06, z), Vector3(-1.0, 0.0, 0.0)])
	sitios.append([Vector3(0.0, 0.06, - SPRINK_END_Z), Vector3(0.0, 0.0, 1.0)])
	sitios.append([Vector3(0.0, 0.06, z_end), Vector3(0.0, 0.0, -1.0)])
	var cabeza: CylinderMesh = CylinderMesh.new()
	cabeza.top_radius = 0.09
	cabeza.bottom_radius = 0.11
	cabeza.height = 0.12
	var cab_mat: StandardMaterial3D = StandardMaterial3D.new()
	cab_mat.albedo_color = Color("2c3a2a")
	cab_mat.roughness = 0.9
	for s in sitios:
		var pos: Vector3 = s[0]
		var hacia: Vector3 = s[1]
		var root: Node3D = Node3D.new()
		root.position = pos


		var yaw: float = atan2(- hacia.x, - hacia.z)
		root.rotation.y = yaw
		_sprink_yaw.append(yaw)
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = cabeza
		mi.material_override = cab_mat
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(mi)
		var p: GeometryInstance3D = Particulas.nodo()
		p.amount = SPRINK_AMOUNT
		p.lifetime = SPRINK_LIFE
		p.emitting = false
		p.visible = false

		p.fixed_fps = 24
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



		p.visibility_aabb = AABB(Vector3(-24.0, -1.0, -24.0), Vector3(48.0, 12.0, 48.0))
		var pm: Resource = Particulas.proceso()
		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
		pm.emission_box_extents = Vector3(0.05, 0.02, 0.05)


		pm.direction = Vector3(0.0, 0.62, -1.0).normalized()
		pm.spread = 7.0



		pm.gravity = Vector3(0.0, -11.0, 0.0)





		pm.initial_velocity_min = 10.5
		pm.initial_velocity_max = 12.5
		pm.scale_min = 0.5
		pm.scale_max = 1.1
		var grad: Gradient = Gradient.new()

		grad.offsets = PackedFloat32Array([0.0, 0.45, 1.0])
		grad.colors = PackedColorArray([
			Color(0.9, 0.95, 1.0, 0.92), Color(0.82, 0.9, 0.98, 0.62),
			Color(0.78, 0.88, 0.98, 0.0)])

		pm.color_ramp = Particulas.rampa(grad)
		p.process_material = pm
		var quad: QuadMesh = QuadMesh.new()





		quad.size = Vector2(0.26, 0.26)
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.vertex_color_use_as_albedo = true
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
		quad.material = mat
		p.draw_pass_1 = quad
		root.add_child(p)
		add_child(root)
		_sprinklers.append(root)
		_sprink_p.append(p)













func water_pitch(dur: float = 6.0) -> void:
	if _sprink_p.is_empty() or Settings.reduce_motion:
		return
	if bool(weather.get("rain", false)) or bool(weather.get("snow", false)):
		return
	_sprink_left = maxf(_sprink_left, dur)
	for p in _sprink_p:
		p.visible = true
		p.emitting = true





func stop_watering() -> void:
	_sprink_left = 0.0
	for i in _sprink_p.size():






		if i == _sprink_broken:
			continue
		_sprink_p[i].emitting = false
		_sprink_p[i].visible = false





















func sprinkler_hit(a: Vector3, b: Vector3) -> int:
	if _sprink_broken >= 0 or _sprinklers.is_empty():
		return -1
	if maxf(absf(a.x), absf(b.x)) < FIELD_HALF_W:
		return -1
	if minf(a.y, b.y) > SPRINK_HIT_H:
		return -1
	for i in mini(SPRINK_SIDE_N, _sprinklers.size()):
		var p: Vector3 = _sprinklers[i].position
		var pa: Vector2 = Vector2(a.x - p.x, a.z - p.z)
		var ab: Vector2 = Vector2(b.x - a.x, b.z - a.z)
		var len2: float = ab.length_squared()
		var t: float = 0.0 if len2 <= 0.0001 else clampf(- pa.dot(ab) / len2, 0.0, 1.0)
		if (pa + ab * t).length() <= SPRINK_HIT_R:
			return i
	return -1










func break_sprinkler(i: int) -> bool:
	if _sprink_broken >= 0:
		return false
	if i < 0 or i >= mini(SPRINK_SIDE_N, _sprinklers.size()):
		return false
	_sprink_broken = i
	var root: Node3D = _sprinklers[i]






	var s: float =(-1.0 if root.position.x > 0.0 else 1.0) \
			*(1.0 if root.position.z < HALF_LINE else -1.0)
	_sprink_broken_yaw = _sprink_yaw[i] + deg_to_rad(SPRINK_BENT_YAW) * s


	root.rotation = Vector3(deg_to_rad(SPRINK_BENT_PITCH), _sprink_broken_yaw,
		deg_to_rad(SPRINK_BENT_ROLL))




	if Settings.reduce_motion:
		return true
	_sprink_shakes = true
	_sprink_bt = 0.0
	var p: GeometryInstance3D = _sprink_p[i]



	p.amount = SPRINK_BROKEN_AMOUNT





	p.visibility_aabb = AABB(Vector3(-6.0, -1.0, -6.0), Vector3(12.0, 8.0, 12.0))
	p.visible = true
	p.emitting = true
	return true





func _tick_sprinklers(delta: float) -> void:




	if _sprink_left <= 0.0 and _soak <= 0.0 and not _sprink_shakes:
		return
	if _sprink_left > 0.0:
		_sprink_left -= delta
		_sprink_t += delta


		var barrido: float = deg_to_rad(SPRINK_SWEEP_DEG * 0.5) \
				* sin(TAU * _sprink_t / SPRINK_SWEEP_S)
		for i in _sprinklers.size():





			if i == _sprink_broken:
				continue
			_sprinklers[i].rotation.y = _sprink_yaw[i] + barrido
		_soak = minf(_soak + delta / SOAK_WET_S * SOAK_MAX, SOAK_MAX)
		if _sprink_left <= 0.0:
			stop_watering()
	else:
		_soak = maxf(_soak - delta * SOAK_MAX / SOAK_DRY_S, 0.0)




	if _sprink_shakes:
		_sprink_bt += delta
		_sprinklers[_sprink_broken].rotation.y = _sprink_broken_yaw \
				+ deg_to_rad(SPRINK_WOBBLE_DEG) * sin(TAU * _sprink_bt / SPRINK_WOBBLE_S)


	if not is_equal_approx(_soak, _soak_sent):
		_soak_sent = _soak
		if _pitch_mat:
			_pitch_mat.set_shader_parameter("soak_amount", _soak)




















func _build_tongue() -> void:
	if not _tongue.is_empty():
		return
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(4.5, 3.0)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true



	mat.albedo_texture = _smoke_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	for _i in TONGUE_MAX:
		var p: GeometryInstance3D = Particulas.nodo()
		p.amount = TONGUE_AMOUNT
		p.lifetime = TONGUE_LIFE
		p.emitting = false
		p.visible = false
		p.fixed_fps = 12
		p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		p.visibility_aabb = AABB(Vector3(-12.0, -4.0, -12.0), Vector3(24.0, 14.0, 24.0))
		var pm: Resource = Particulas.proceso()
		pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
		pm.emission_box_extents = Vector3(1.2, 0.6, 1.2)
		pm.direction = Vector3(0.0, 1.0, 0.0)
		pm.spread = 22.0



		pm.gravity = Vector3(0.0, 0.22, 0.0)
		pm.initial_velocity_min = 0.1
		pm.initial_velocity_max = 0.5
		pm.scale_min = 0.8
		pm.scale_max = 1.6
		var c: Curve = Curve.new()

		c.add_point(Vector2(0.0, 0.5))
		c.add_point(Vector2(1.0, 1.6))

		pm.scale_curve = Particulas.curva(c)
		var grad: Gradient = Gradient.new()
		grad.offsets = PackedFloat32Array([0.0, 0.25, 0.62, 1.0])






		grad.colors = PackedColorArray([
			Color(1.0, 0.45, 0.14, 0.0), Color(0.98, 0.42, 0.16, 0.22),
			Color(0.82, 0.52, 0.42, 0.15), Color(0.74, 0.72, 0.72, 0.0)])
		pm.color_ramp = Particulas.rampa(grad)
		p.process_material = pm
		p.draw_pass_1 = quad
		add_child(p)
		_tongue.append({"node": p, "vel": Vector3.ZERO, "life": 0.0})





func _fire_tongue(from: Vector3) -> void:
	if _tongue.is_empty() or Settings.reduce_motion:
		return
	var wind2: Vector2 = Vector2(_wind.x, _wind.z)
	var speed: float = wind2.length()
	if speed < LITTER_WIND_MIN:
		return
	for t in _tongue:
		if float(t["life"]) > 0.0:
			continue
		var p: GeometryInstance3D = t["node"]
		p.position = Vector3(from.x, randf_range(TONGUE_Y_MIN, TONGUE_Y_MAX), from.z)
		var dir: Vector2 = wind2 / speed




		t["vel"] = Vector3(dir.x, 0.02, dir.y + TONGUE_TOWARD_CAM) \
				* speed * TONGUE_SPEED_MUL
		t["life"] = TONGUE_LIFE
		p.visible = true


		p.emitting = false
		p.restart()
		p.emitting = true
		return




func _tick_tongue(delta: float) -> void:
	for t in _tongue:
		var vida: float = t["life"]
		if vida <= 0.0:
			continue
		vida -= delta
		var p: GeometryInstance3D = t["node"]
		p.position +=(t["vel"] as Vector3) * delta



		var desde_medio: Vector2 = Vector2(p.position.x, p.position.z - HALF_LINE)
		if vida <= 0.0 or desde_medio.length() > LITTER_EXIT_R:
			vida = 0.0
			p.emitting = false
			p.visible = false
		t["life"] = vida
















func _build_rain() -> void:
	_rain = Particulas.nodo()

















	_rain.amount = Weather.particulas(950, Settings.calidad_baja)

	_rain.lifetime = 1.0
	_rain.fixed_fps = 30
	_rain.preprocess = 1.0
	_rain.emitting = false
	_rain.visible = false
	_rain.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



	_rain.visibility_aabb = AABB(Vector3(-15.0, -34.0, -15.0), Vector3(30.0, 48.0, 30.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX








	pm.emission_box_extents = Vector3(11.0, 10.0, 11.0)
	pm.direction = Vector3(0.12, -1.0, 0.03)
	pm.spread = 0.0
	pm.gravity = Vector3.ZERO
	pm.initial_velocity_min = 19.0
	pm.initial_velocity_max = 21.0
	_rain.process_material = pm
	_rain_pm = pm
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.04, 0.42)
	_rain_quad = quad
	var mat: StandardMaterial3D = StandardMaterial3D.new()










	mat.albedo_color = Color(0.62, 0.7, 0.85, 0.55)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
	quad.material = mat
	_rain.draw_pass_1 = quad
	_rain.position = Vector3(0.0, 8.0, 20.0)
	add_child(_rain)

























const BOLT_LIFE: float = 0.34





const BOLT_ENERGY: float = 2.2
const BOLT_SKY: float = 1.7


const BOLT_DIST: Vector2 = Vector2(280.0, 3600.0)

const SOUND_MPS: float = 343.0









func _tick_bolt(delta: float) -> void:



	if _boom_in >= 0.0:
		_boom_in -= delta
		if _boom_in <= 0.0:
			_boom_in = -1.0
			thunder.emit(_boom_f)
	if _bolt_t > 0.0:
		_bolt_t = maxf(_bolt_t - delta, 0.0)
		_bolt_light(_bolt_gain(1.0 - _bolt_t / BOLT_LIFE))
		if _bolt_t <= 0.0:
			_bolt_light(0.0)
	if _bolt_win.y <= 0.0 or not thunder_on:
		return
	if _bolt_next < 0.0:



		_bolt_next = randf_range(1.5, _bolt_win.x)
		return
	_bolt_next -= delta
	if _bolt_next <= 0.0:
		_bolt_next = randf_range(_bolt_win.x, _bolt_win.y)
		_strike()










func _strike() -> void:
	var dist: float = randf_range(BOLT_DIST.x, BOLT_DIST.y)
	var f: float = clampf(1.0 -(dist - BOLT_DIST.x)
		/ maxf(BOLT_DIST.y - BOLT_DIST.x, 1.0), 0.04, 1.0)
	_boom_f = f
	_boom_in = dist / SOUND_MPS
	if Settings.reduce_motion:
		return



	_bolt_f = 0.35 + 0.65 * f
	_bolt_t = BOLT_LIFE






func _bolt_gain(u: float) -> float:
	var guia: float = maxf(0.0, 1.0 - u / 0.1) * 0.55
	var retorno: float = maxf(0.0, 1.0 - absf(u - 0.28) / 0.18)
	var brasa: float = maxf(0.0, 1.0 -(u - 0.46) / 0.54) * 0.18 if u > 0.46 else 0.0
	return clampf(guia + retorno + brasa, 0.0, 1.0)





func _bolt_light(g: float) -> void:
	var k: float = g * _bolt_f
	if _bolt != null:
		_bolt.visible = k > 0.001
		_bolt.light_energy = BOLT_ENERGY * k
	if _env != null:
		_env.background_energy_multiplier = _bg_base + BOLT_SKY * k





















func rain_level() -> int:
	if rain_tier >= 0:
		return rain_tier
	if not bool(weather.get("rain", false)):
		return Weather.RAIN_MID
	if GameState.next_rain >= 0:
		return GameState.next_rain
	GameState.next_rain = Weather.roll_rain()
	return GameState.next_rain
















func _apply_rain_tier() -> void:
	if _rain == null or not _rain.visible:
		return
	var t: Dictionary = Weather.rain_tier(rain_level())
	_rain.amount_ratio = clampf(float(t["drops"]), 0.05, 1.0)
	if _rain_quad != null:
		_rain_quad.size = Vector2(0.04, 0.42 * float(t["drop_len"]))
	if _rain_pm != null:
		var fall: float = maxf(float(t["fall"]), 0.05)
		_rain_pm.initial_velocity_min = 19.0 * fall
		_rain_pm.initial_velocity_max = 21.0 * fall
		_rain.lifetime = 1.0 / fall




	_bolt_win = t["bolt"]
	if _bolt_win.y <= 0.0:
		_bolt_next = -1.0






















func _apply_puddles() -> void:
	if not bool(weather.get("rain", false)):
		puddles = null


		_pitch_mat.set_shader_parameter("puddle_amount", 0.0)
		_pitch_mat.set_shader_parameter("rain_drops", 0.0)
		return






	var lvl: int = rain_level()
	if lvl != _puddle_tier:
		_puddle_tier = lvl
		_puddle_model = null
		_puddle_tex = null
	if _puddle_model == null:
		_puddle_model = Puddles.new(puddle_seed, -1,
			Weather.rain_tier(lvl)["puddles"])
	puddles = _puddle_model
	if _puddle_tex == null:
		var origin := Vector2(_wx0, _wz0)
		var span := Vector2(float(_tw) / TEXELS_PER_M, float(_th) / TEXELS_PER_M)
		_puddle_tex = ImageTexture.create_from_image(
			_puddle_model.bake_mask(origin, span))
	_pitch_mat.set_shader_parameter("puddle_mask", _puddle_tex)
	_pitch_mat.set_shader_parameter("puddle_amount", 1.0)


	_pitch_mat.set_shader_parameter("puddle_sky", weather["sky_horizon"])













	var t: Dictionary = Weather.rain_tier(lvl)
	_pitch_mat.set_shader_parameter("rain_drops",
		0.0 if Settings.reduce_motion else float(t["rings"]))
	_pitch_mat.set_shader_parameter("rain_pick", float(t["ring_pick"]))
	_pitch_mat.set_shader_parameter("rain_rate", float(t["ring_rate"]))
	_pitch_mat.set_shader_parameter("rain_ring", float(t["ring_size"]))




	_pitch_mat.set_shader_parameter("rain_cell", float(t["ring_cell"]))











func _snow_cap(padre: Node3D, pos: Vector3, size: Vector3) -> MeshInstance3D:
	if _snow_cap_mat == null:
		_snow_cap_mat = StandardMaterial3D.new()
		_snow_cap_mat.albedo_color = Color("e6e9ef")
		_snow_cap_mat.roughness = 1.0
	var cap: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	cap.mesh = bm






	cap.material_override = _snow_cap_mat.duplicate()
	cap.position = pos
	cap.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF





	cap.visible = bool(weather.get("snow", false))
	padre.add_child(cap)
	_snow_caps.append(cap)
	return cap






















func _apply_snow() -> void:
	if _pitch_mat == null:
		return
	if not bool(weather.get("snow", false)):
		_pitch_mat.set_shader_parameter("snow_amount", 0.0)



		for seg in _bar_snow:
			if is_instance_valid(seg):
				seg.visible = false




		for cap in _snow_caps:
			if is_instance_valid(cap):
				cap.visible = false
		return




	if _sweep_tex == null and _marks_tex != null:
		_sweep_tex = ImageTexture.create_from_image(_bake_sweep_mask())
	if _sweep_tex != null:
		_pitch_mat.set_shader_parameter("sweep_mask", _sweep_tex)
	_pitch_mat.set_shader_parameter("snow_amount", 1.0)
	_build_bar_snow()
	for cap in _snow_caps:
		if is_instance_valid(cap):
			cap.visible = true

	for i in _bar_snow.size():
		if is_instance_valid(_bar_snow[i]):
			_bar_snow[i].visible = not _bar_snow_gone[i]










func _build_bar_snow() -> void:
	if not _bar_snow.is_empty() or _tubes.size() < 3:
		return
	var bar: MeshInstance3D = _tubes[2]
	if bar == null or not is_instance_valid(bar):
		return
	var nieve: StandardMaterial3D = StandardMaterial3D.new()



	nieve.albedo_color = Color(1.0, 1.0, 1.0)
	nieve.roughness = 0.95
	var ancho: float =(GOAL_HALF_W * 2.0) / float(BAR_SNOW_SEGS)
	for i in BAR_SNOW_SEGS:
		var m: MeshInstance3D = MeshInstance3D.new()
		var box: BoxMesh = BoxMesh.new()


		box.size = Vector3(ancho * 1.02, BAR_SNOW_H, BAR_SNOW_VUELO)
		m.mesh = box
		m.material_override = nieve
		m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF









		var mundo_x: float = - GOAL_HALF_W + ancho *(float(i) + 0.5)


		var alto: float = 0.048 + BAR_SNOW_H * 0.5


		m.position = Vector3(alto, - mundo_x, 0.0)
		m.rotation_degrees = Vector3(0.0, 0.0, -90.0)
		bar.add_child(m)
		_bar_snow.append(m)
		_bar_snow_gone.append(false)
	if _bar_snow_fall == null:
		_bar_snow_fall = _make_snow_fall()
		add_child(_bar_snow_fall)





func _make_snow_fall() -> GeometryInstance3D:
	var p := Particulas.nodo()
	p.amount = 26
	p.one_shot = true
	p.explosiveness = 0.85
	p.lifetime = 1.1
	p.emitting = false
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	p.visibility_aabb = AABB(Vector3(-2.0, -3.0, -2.0), Vector3(4.0, 4.0, 4.0))
	var pm := Particulas.proceso()

	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	pm.emission_box_extents = Vector3(0.55, 0.02, 0.05)
	pm.direction = Vector3(0.0, -1.0, 0.0)
	pm.spread = 18.0
	pm.gravity = Vector3(0.0, -7.5, 0.0)
	pm.initial_velocity_min = 0.2
	pm.initial_velocity_max = 1.1
	pm.scale_min = 0.5
	pm.scale_max = 1.2
	var grad := Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 0.7, 1.0])
	grad.colors = PackedColorArray([Color(1.0, 1.0, 1.0, 0.95),
		Color(0.97, 0.98, 1.0, 0.7), Color(0.95, 0.97, 1.0, 0.0)])

	pm.color_ramp = Particulas.rampa(grad)
	p.process_material = pm
	var quad := QuadMesh.new()
	quad.size = Vector2(0.08, 0.08)
	var mat := StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	p.draw_pass_1 = quad
	return p









func bar_snow_knock(x: float, strength: float = 1.0, under_pause: bool = false,
		speed: float = 1.0) -> bool:
	if _bar_snow.is_empty():
		return false
	var ancho: float =(GOAL_HALF_W * 2.0) / float(BAR_SNOW_SEGS)
	var centro: int = clampi(int((x + GOAL_HALF_W) / ancho), 0, BAR_SNOW_SEGS - 1)


	var radio: int = BAR_SNOW_RADIO if strength >= 0.7 else 0
	var cayo: bool = false
	for d in range(- radio, radio + 1):
		var i: int = centro + d
		if i < 0 or i >= BAR_SNOW_SEGS:
			continue
		var seg: MeshInstance3D = _bar_snow[i]
		if seg == null or not is_instance_valid(seg) or _bar_snow_gone[i]:
			continue
		seg.visible = false
		_bar_snow_gone[i] = true
		cayo = true
	if not cayo:
		return false
	if _bar_snow_fall != null:
		_bar_snow_fall.global_position = Vector3(
			clampf(x, - GOAL_HALF_W, GOAL_HALF_W), CROSSBAR_H - 0.06, 0.0)


		_bar_snow_fall.process_mode = Node.PROCESS_MODE_ALWAYS if under_pause \
				else Node.PROCESS_MODE_INHERIT
		_bar_snow_fall.speed_scale = maxf(speed, 0.05) if under_pause else _slow_k
		_bar_snow_fall.restart()
		_bar_snow_fall.emitting = true
	return true












func bar_snow_restore(x: float, radio: int = BAR_SNOW_RADIO) -> int:
	if _bar_snow.is_empty():
		return 0
	var ancho: float =(GOAL_HALF_W * 2.0) / float(BAR_SNOW_SEGS)
	var centro: int = clampi(int((x + GOAL_HALF_W) / ancho), 0, BAR_SNOW_SEGS - 1)
	var puestos: int = 0
	for d in range(- radio, radio + 1):
		var i: int = centro + d
		if i < 0 or i >= BAR_SNOW_SEGS or not _bar_snow_gone[i]:
			continue
		var seg: MeshInstance3D = _bar_snow[i]
		if seg == null or not is_instance_valid(seg):
			continue
		seg.visible = true
		_bar_snow_gone[i] = false
		puestos += 1
	return puestos















func tube_spray(world_pos: Vector3, strength: float = 1.0, bar: bool = false,
		under_pause: bool = false, speed: float = 1.0) -> bool:
	var lluvia: bool = bool(weather.get("rain", false))
	var nieve: bool = bool(weather.get("snow", false))
	if not lluvia and not nieve:
		return false
	if _tube_spray_p == null:
		_tube_spray_p = _make_spray()
		add_child(_tube_spray_p)
	if _net_drip_p == null:
		_net_drip_p = _make_spray()
		add_child(_net_drip_p)
	var f: float = clampf(strength, 0.0, 1.25)




	var lado: float = signf(world_pos.x) if absf(world_pos.x) > 0.1 else 1.0
	var dir: Vector3 = Vector3(0.0, -1.0, 0.0) if bar else Vector3(lado, 0.25, 0.0)
	_tune_spray(_tube_spray_p, nieve, f, dir, Vector3(0.05, 0.16, 0.05))
	_tube_spray_p.global_position = world_pos
	_fire_spray(_tube_spray_p, under_pause, speed)




	var nx: float =(lado * GOAL_HALF_W) if not bar else clampf(world_pos.x, - GOAL_HALF_W, GOAL_HALF_W)
	var caja: Vector3 = Vector3(0.04, 0.75, 0.55) if not bar else Vector3(0.85, 0.05, 0.55)
	_tune_spray(_net_drip_p, nieve, f * 0.8, Vector3(0.0, -1.0, 0.0), caja)
	_net_drip_p.global_position = Vector3(nx,
		clampf(world_pos.y +(0.0 if bar else 0.55), 0.35, CROSSBAR_H - 0.05),
		- NET_DEPTH * 0.42)
	_fire_spray(_net_drip_p, under_pause, speed)
	return true























func net_spray(world_pos: Vector3, strength: float = 1.0,
		under_pause: bool = false, speed: float = 1.0) -> bool:
	var lluvia: bool = bool(weather.get("rain", false))
	var nieve: bool = bool(weather.get("snow", false))
	if not lluvia and not nieve:
		return false
	if _net_drip_p == null:
		_net_drip_p = _make_spray()
		add_child(_net_drip_p)
	var f: float = clampf(strength, 0.0, 1.25)



	_tune_spray(_net_drip_p, nieve, f, Vector3(0.0, -1.0, 0.0),
		Vector3(0.55, 0.45, 0.1))



	_net_drip_p.global_position = Vector3(world_pos.x,
		clampf(world_pos.y, 0.35, CROSSBAR_H - 0.05), world_pos.z)
	_fire_spray(_net_drip_p, under_pause, speed)
	return true





func _fire_spray(p: GeometryInstance3D, under_pause: bool, speed: float) -> void:
	p.process_mode = Node.PROCESS_MODE_ALWAYS if under_pause else Node.PROCESS_MODE_INHERIT



	p.speed_scale = maxf(speed * 1.5, 0.05) if under_pause else _slow_k
	p.restart()
	p.emitting = true






func _tune_spray(p: GeometryInstance3D, nieve: bool, f: float, dir: Vector3,
		caja: Vector3) -> void:







	p.amount = maxi(int((16 if nieve else 28) * clampf(f, 0.35, 1.25)), 6)
	p.lifetime = 0.7 if nieve else 0.85
	var pm: Resource = p.process_material
	pm.emission_box_extents = caja
	pm.direction = dir.normalized()
	pm.spread = 62.0 if nieve else 48.0
	pm.gravity = Vector3(0.0, -8.5 if nieve else -9.8, 0.0)


	pm.initial_velocity_min =(0.55 if nieve else 0.9) * f
	pm.initial_velocity_max =(2.2 if nieve else 3.8) * f
	pm.scale_min = 0.6 if nieve else 0.4
	pm.scale_max = 1.3 if nieve else 0.9
	pm.color_ramp = _spray_rampa(nieve)
	var quad: QuadMesh = p.draw_pass_1
	quad.size = Vector2(0.048, 0.048) if nieve else Vector2(0.035, 0.055)










var _spray_rampas: Array[Texture2D] = [null, null]


func _spray_rampa(nieve: bool) -> Texture2D:
	var i: int = 1 if nieve else 0
	if _spray_rampas[i] != null:
		return _spray_rampas[i]
	var grad := Gradient.new()
	grad.offsets = PackedFloat32Array([0.0, 0.65, 1.0])
	if nieve:
		grad.colors = PackedColorArray([Color(1.0, 1.0, 1.0, 0.95),
			Color(0.97, 0.98, 1.0, 0.7), Color(0.95, 0.97, 1.0, 0.0)])
	else:


		grad.colors = PackedColorArray([Color(0.82, 0.9, 0.98, 0.85),
			Color(0.74, 0.85, 0.96, 0.55), Color(0.7, 0.82, 0.95, 0.0)])
	_spray_rampas[i] = Particulas.rampa(grad)
	return _spray_rampas[i]





func _make_spray() -> GeometryInstance3D:
	var p := Particulas.nodo()
	p.one_shot = true
	p.explosiveness = 0.9
	p.emitting = false
	p.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	p.visibility_aabb = AABB(Vector3(-2.5, -3.5, -2.5), Vector3(5.0, 5.0, 5.0))
	var pm := Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	p.process_material = pm
	var quad := QuadMesh.new()
	var mat := StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	quad.material = mat
	p.draw_pass_1 = quad
	return p























func tread_at(x: float, z: float, fuerza: float = 1.0) -> void:
	if _pitch_mat == null or not bool(weather.get("snow", false)):
		return
	if _tread_img == null:
		var w: int = maxi(int(float(_tw) / TEXELS_PER_M * TREAD_TEXELS_PER_M), 8)
		var h: int = maxi(int(float(_th) / TEXELS_PER_M * TREAD_TEXELS_PER_M), 8)


		_tread_img = Image.create(w, h, false, Image.FORMAT_R8)
		_tread_img.fill(Color(0.0, 0.0, 0.0, 1.0))
		_tread_tex = ImageTexture.create_from_image(_tread_img)
		_pitch_mat.set_shader_parameter("tread_mask", _tread_tex)
		_pitch_mat.set_shader_parameter("tread_amount", 1.0)




	var span_x: float = float(_tw) / TEXELS_PER_M
	var span_z: float = float(_th) / TEXELS_PER_M
	var u: float =(x - _wx0) / span_x
	var v: float =(z - _wz0) / span_z
	if u < 0.0 or u > 1.0 or v < 0.0 or v > 1.0:
		return
	var w2: int = _tread_img.get_width()
	var h2: int = _tread_img.get_height()
	var cx: int = int(u * float(w2))
	var cy: int = int(v * float(h2))
	var rad: int = maxi(int(TREAD_R_M * TREAD_TEXELS_PER_M), 1)
	var golpe: float = TREAD_HIT * clampf(fuerza, 0.0, 1.0)
	for dy in range(- rad, rad + 1):
		for dx in range(- rad, rad + 1):
			var px: int = cx + dx
			var py: int = cy + dy
			if px < 0 or py < 0 or px >= w2 or py >= h2:
				continue


			var d: float = sqrt(float(dx * dx + dy * dy)) / float(rad + 1)
			if d > 1.0:
				continue
			var v0: float = _tread_img.get_pixel(px, py).r



			var nv: float = minf(v0 + golpe *(1.0 - d), 1.0)
			if nv > v0:
				_tread_img.set_pixel(px, py, Color(nv, 0.0, 0.0, 1.0))
				_tread_dirty = true




func _tick_tread(delta: float) -> void:






	_tread_clock += delta
	if _prints_mat != null:


		_prints_mat.set_shader_parameter("tread_now", _tread_clock)



	if _pitch_mat != null:
		_pitch_mat.set_shader_parameter("grass_now", _tread_clock)
	if not _tread_dirty or _tread_tex == null:
		return
	_tread_cd -= delta
	if _tread_cd > 0.0:
		return
	_tread_cd = 1.0 / TREAD_HZ
	_tread_dirty = false
	_tread_tex.update(_tread_img)















func tread_print(pos: Vector3, avance: Vector3, fuerza: float, pie: int) -> void:





	if not WeatherWear.marks_on(weather_id()):
		return

	var dir: Vector3 = Vector3(avance.x, 0.0, avance.z)
	if dir.length_squared() < 1e-06:
		return
	dir = dir.normalized()
	if _prints_mm == null:
		_build_tread_prints()



	_prints_mm.set_instance_transform(_print_turn, tread_print_xform(
		pos, dir, fuerza, pie, randf_range(-0.1, 0.1)))
	_prints_mm.set_instance_color(_print_turn,
		tread_print_color(fuerza, weather_id()))



	_prints_mm.set_instance_custom_data(_print_turn,
		Color(_tread_clock, 0.0, 0.0, 0.0))
	_print_turn =(_print_turn + 1) % TREAD_PRINTS
	_prints_total += 1












static func tread_print_xform(pos: Vector3, dir: Vector3, fuerza: float,
		pie: int, jitter: float) -> Transform3D:
	var d: Vector3 = dir.rotated(Vector3.UP, jitter)



	var perp: Vector3 = Vector3(- d.z, 0.0, d.x)
	var f: float = clampf(fuerza, 0.0, 1.0)

	var largo: float = TREAD_PRINT_L *(0.85 + 0.55 * f)
	var lado: float = TREAD_FOOT_GAP *(1.0 if pie == 1 else -1.0)
	var p: Vector3 = pos + perp * lado



	var b: Basis = Basis(perp * TREAD_PRINT_W, d * largo, Vector3.UP)
	return Transform3D(b, Vector3(p.x, TREAD_PRINT_Y, p.z))































const TREAD_HONDURA: Dictionary = {
	"snow": 0.62,
	"rain": 1.9,
}
static func tread_print_color(fuerza: float, clima: String) -> Color:
	var col: Color = WeatherWear.scar_color(clima)
	var k: float = float(TREAD_HONDURA.get(clima, 1.0))
	return Color(minf(col.r * k, 1.0), minf(col.g * k, 1.0), minf(col.b * k, 1.0),
		0.8 + 0.2 * clampf(fuerza, 0.0, 1.0))







func _apply_tread_fade() -> void:
	if _prints_mat == null:
		return
	_prints_mat.set_shader_parameter("tread_fade",
		float(TREAD_FADE.get(weather_id(), 0.0)))





func _build_tread_prints() -> void:
	var quad: QuadMesh = QuadMesh.new()


	quad.size = Vector2(1.0, 1.0)







	_prints_mat = ShaderMaterial.new()
	_prints_mat.shader = load("res://features/stadium/tread_print.gdshader")
	_prints_mat.set_shader_parameter("suela", _tread_print_texture())
	quad.material = _prints_mat
	_prints_mm = MultiMesh.new()
	_prints_mm.transform_format = MultiMesh.TRANSFORM_3D
	_prints_mm.use_colors = true



	_prints_mm.use_custom_data = true
	_prints_mm.mesh = quad
	_prints_mm.instance_count = TREAD_PRINTS
	var nada: Transform3D = Transform3D(Basis().scaled(Vector3.ZERO), Vector3.ZERO)
	for i in TREAD_PRINTS:
		_prints_mm.set_instance_transform(i, nada)
	_prints_mmi = MultiMeshInstance3D.new()
	_prints_mmi.multimesh = _prints_mm
	_prints_mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(_prints_mmi)
	_apply_tread_fade()







func _tread_print_texture() -> ImageTexture:
	var w: int = 32
	var h: int = 64
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(1.0, 1.0, 1.0, 0.0))
	for y in h:
		for x in w:


			var u: float =(float(x) + 0.5) / float(w) * 2.0 - 1.0
			var v: float =(float(y) + 0.5) / float(h) * 2.0 - 1.0




			var d1: float = _oval(u, v, 0.52, 0.46, -0.34)
			var d2: float = _oval(u, v, 0.42, 0.38, 0.46)
			var d: float = minf(d1, d2)
			if d >= 1.0:
				continue





			var a: float = clampf((1.0 - d) / 0.18, 0.0, 1.0)
			img.set_pixel(x, y, Color(1.0, 1.0, 1.0, a))
	return ImageTexture.create_from_image(img)





func _oval(u: float, v: float, rx: float, ry: float, cy: float) -> float:
	var du: float = u / maxf(rx, 0.0001)
	var dv: float =(v - cy) / maxf(ry, 0.0001)
	return sqrt(du * du + dv * dv)


func _bake_sweep_mask() -> Image:


	var small: Image = Image.new()



	var cal: Image = SceneFade.imagen(_marks_tex)
	if cal == null:
		return small
	small.copy_from(cal)
	for i in 3:
		small.resize(maxi(small.get_width() / 2, 1),
			maxi(small.get_height() / 2, 1), Image.INTERPOLATE_BILINEAR)
	return small


func _build_snow() -> void:
	_snow = Particulas.nodo()


	_snow.amount = Weather.particulas(620, Settings.calidad_baja)
	_snow.lifetime = 7.0
	_snow.fixed_fps = 20
	_snow.preprocess = 7.0
	_snow.emitting = false
	_snow.visible = false
	_snow.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_snow.visibility_aabb = AABB(Vector3(-24.0, -34.0, -24.0), Vector3(48.0, 44.0, 48.0))
	var pm: Resource = Particulas.proceso()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX


	pm.emission_box_extents = Vector3(16.0, 0.5, 16.0)
	pm.direction = Vector3(0.0, -1.0, 0.0)
	pm.spread = 22.0
	pm.gravity = Vector3(0.0, -0.35, 0.0)
	pm.initial_velocity_min = 0.5
	pm.initial_velocity_max = 1.3


	pm.scale_min = 0.55
	pm.scale_max = 1.5
	pm.turbulence_enabled = true
	pm.turbulence_noise_strength = 0.28
	pm.turbulence_noise_scale = 2.2
	pm.turbulence_influence_min = 0.15
	pm.turbulence_influence_max = 0.45
	_snow.process_material = pm
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.09, 0.09)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.97, 0.98, 1.0)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED


	mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	quad.material = mat
	_snow.draw_pass_1 = quad
	_snow.position = Vector3(0.0, 10.0, 20.0)
	add_child(_snow)



func _build_ad_boards() -> void:





	var acfg: Dictionary = _ads_cfg()




	var list: Array = _sponsor_list()
	var brands: int = clampi(int(acfg["brands"]), 1, maxi(list.size(), 1))
	var atlas: ImageTexture = _ad_atlas_texture(list, brands, float(acfg["dull"]))


	var rx: float = _ring_x()
	var pad: float = rx - AD_RING_X
	var padz: float = _ring_pad_z()
	_ad_board(atlas, brands, Vector3(0.0, 0.0, -4.0 - padz), 2.0 * rx, 0.0)
	_ad_board(atlas, brands, Vector3(0.0, 0.0, FIELD_DEPTH + 4.0 + padz),
		2.0 * rx, 180.0)




	_ad_side.clear()
	for seg in _dugout_ad_segments():
		_ad_side.append({"root": _ad_board(atlas, brands, Vector3(- rx, 0.0, seg.x),
			seg.y, 90.0), "z": seg.x, "len": seg.y})
	_ad_board(atlas, brands, Vector3(rx, 0.0, HALF_LINE), 113.0 + pad * 2.0, -90.0)




func _ring_x() -> float:
	if _track:
		return _track_outer_hx() + 1.1


	return float(FOOTPRINT_CFG.get(footprint, {}).get("ad_x", AD_RING_X))






func _ring_pad_z() -> float:
	if not _track:
		return 0.0
	return _track_outer_hz() - FIELD_DEPTH * 0.5 - 4.0 + 1.1





func _dugout_ad_segments() -> Array[Vector2]:
	var z0: float = -4.0
	var z1: float = FIELD_DEPTH + 4.0







	var gap: float = float(_dugout_cfg()["len"]) * 0.5 + 1.2
	var a: float = HALF_LINE - DUGOUT_OFFSET_Z
	var b: float = HALF_LINE + DUGOUT_OFFSET_Z
	var cuts: Array[float] = [z0, a - gap, a + gap, b - gap, b + gap, z1]
	var out: Array[Vector2] = []
	for i in [0, 2, 4]:
		var from: float = cuts[i]
		var to: float = cuts[i + 1]
		out.append(Vector2((from + to) * 0.5, to - from))
	return out





func _ad_board(atlas: Texture2D, brands: int, pos: Vector3, length: float,
		yaw_deg: float) -> Node3D:
	var root: Node3D = Node3D.new()
	root.position = pos
	root.rotation_degrees = Vector3(0.0, yaw_deg, 0.0)
	add_child(root)







	_register_occluder(root)
	var base: MeshInstance3D = MeshInstance3D.new()
	var base_mesh: BoxMesh = BoxMesh.new()
	base_mesh.size = Vector3(length, 0.12, 0.3)
	base.mesh = base_mesh
	var base_mat: StandardMaterial3D = StandardMaterial3D.new()
	base_mat.albedo_color = Color("22262e")
	base.material_override = base_mat
	base.position = Vector3(0.0, 0.06, -0.08)
	base.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(base)
















	var cima_valla: float = 0.1 + AD_H * 0.5 *(1.0 + cos(deg_to_rad(12.0)))
	_snow_cap(root, Vector3(0.0, cima_valla + 0.026, -0.08), Vector3(length, 0.07, 0.3))





	var uv_len: float = length /(AD_SEG_M * float(maxi(brands, 1)))
	var mat: ShaderMaterial = _make_ad_mat(atlas, uv_len, randf_range(0.0, 8.0))
	_ad_mats.append(mat)
	var board: MeshInstance3D = MeshInstance3D.new()
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(length, AD_H)
	board.mesh = quad
	board.material_override = mat
	board.position = Vector3(0.0, 0.12 + AD_H * 0.5 - 0.02, 0.0)
	board.rotation_degrees = Vector3(-12.0, 0.0, 0.0)
	board.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(board)
	preload("res://features/stadium/ad_board_detail.gd").montar(root, board,
		length, AD_H, div, bool(_ads_cfg()["led"]))
	return root




















func drop_ad_segment_at(z: float) -> void:
	for i in range(_ad_side.size() - 1, -1, -1):
		var seg: Dictionary = _ad_side[i]
		var from: float = float(seg["z"]) - float(seg["len"]) * 0.5
		var to: float = float(seg["z"]) + float(seg["len"]) * 0.5
		if z <= from or z >= to:
			continue
		var root: Node3D = seg["root"]
		if is_instance_valid(root):




			_unregister_occluder(root)



			for child in root.get_children():
				if child is MeshInstance3D and (child as MeshInstance3D).material_override \
						is ShaderMaterial:
					_ad_mats.erase((child as MeshInstance3D).material_override)
			root.queue_free()
		_ad_side.remove_at(i)
























func _sponsor_list() -> Array:
	var mias: Array = _local_boards()
	if mias.is_empty():
		mias = _with_comp_boards(sponsors_for(_country, bool(_ads_cfg().get("local", false))))
	return _con_pagadas(mias)






func _con_pagadas(base: Array) -> Array:
	var pagadas: Array = Anuncios.vallas()
	if pagadas.is_empty():
		return base
	if att_override < 0.0:
		Telemetry.count("anuncio_valla")
	var out: Array = []
	var n: int = maxi(base.size(), pagadas.size())
	for i in n:
		out.append(pagadas[i % pagadas.size()])
		if i < base.size():
			out.append(base[i])
	return out













func _local_boards() -> Array:
	var out: Array = []
	if _host_id.is_empty():
		return out


	var fab: String = _pixel_safe(KitDeals.brand_of(_host_id))
	if not fab.is_empty():
		out.append([fab, Color("f2f2f0"), Color("14181f"),
			KitBrands.for_team(_host_id)])






	var pat_id: String = KitDeals.sponsor_of(_host_id)
	var pat_nom: String = SponsorLogos.name_of(pat_id)
	var pat: String = _pixel_safe(pat_nom if not pat_nom.is_empty() else pat_id)
	if not pat.is_empty():
		var fondo: Color = _club_a if _club_a.get_luminance() <= _club_b.get_luminance() else _club_b
		var tinta: Color = Color("12141a") if fondo.get_luminance() > 0.55 else Color("f4f1ec")
		out.append([pat, fondo, tinta, SponsorLogos.for_team(_host_id)])
	if out.is_empty():
		return out




	if sin_rotulo_torneo:
		return out
	var fx: Dictionary = _ad_fixture()
	var comp: String = _pixel_safe(I18n.t(Competitions.name_of(fx)))
	if not comp.is_empty():
		out.append([comp, Competitions.accent_of(fx), Competitions.on_accent_of(fx),
			CompLogos.texture(Competitions.logo_type_of(fx))])
	return out








func _ad_fixture() -> Dictionary:
	if att_override < 0.0:
		return GameState.current_fixture()
	return {"comp": _comp}





























func _with_comp_boards(base: Array) -> Array:
	var fixture: Dictionary = _ad_fixture()
	var label: String = _pixel_safe(I18n.t(Competitions.name_of(fixture)))
	if label.is_empty() or sin_rotulo_torneo:
		return base
	var bg: Color = Competitions.accent_of(fixture)
	var fg: Color = Competitions.on_accent_of(fixture)
	var tex: Texture2D = CompLogos.texture(Competitions.logo_type_of(fixture))
	var out: Array = []
	for i in base.size():
		out.append(base[i])
		if i % 3 == 1:
			out.append([label, bg, fg, tex])
	return out


func _ad_atlas_texture(list: Array, count: int = 8,
		dull: float = 0.0) -> ImageTexture:
	count = clampi(count, 1, maxi(list.size(), 1))



	var img: Image = Image.create(count * 128, 32, false, Image.FORMAT_RGBA8)
	for i in count:
		var x0: int = i * 128
		var bg: Color = list[i][1]
		var fg: Color = list[i][2]



		if dull > 0.0:
			bg = bg.darkened(dull)
			fg = fg.darkened(dull * 0.5)
		var border_c: Color = bg.darkened(0.45)
		for y in 32:
			for x in 128:
				var border: bool = x < 2 or x >= 126 or y < 2 or y >= 30
				img.set_pixel(x0 + x, y, border_c if border else bg)







		var real: Image = _marca_de(list[i], i, bg)
		if real != null:
			_pega_marca(img, real, x0)
			continue
		var text: String = list[i][0]

		var px: int = 3
		while px > 1 and PixelText.text_width(text, px) > 118:
			px -= 1
		PixelText.draw_text(img, x0 +(128 - PixelText.text_width(text, px)) / 2,
			(32 - PixelText.GLYPH_H * px) / 2, text, fg, px)
	return ImageTexture.create_from_image(img)










func _marca_de(entry: Array, i: int, fondo: Color) -> Image:
	if entry.size() < 4:
		return _marca_pack(i, fondo)
	var tex: Texture2D = entry[3]
	if tex == null:
		return null
	var pintada: Texture2D = Pecho.marca_para(tex, {"kit": fondo})
	return pintada.get_image() if pintada != null else null
















func _marca_pack(i: int, fondo: Color) -> Image:
	var marcas: Array = SponsorLogos.marcas()
	if marcas.is_empty():
		return null
	var salto: int = absi(_country.hash()) % marcas.size()
	var tex: Texture2D = SponsorLogos.texture(String(marcas[(i + salto) % marcas.size()]))
	if tex == null:
		return null
	var pintada: Texture2D = Pecho.marca_para(tex, {"kit": fondo})
	return pintada.get_image() if pintada != null else null






func _pega_marca(atlas: Image, marca: Image, x0: int) -> void:
	var w: int = marca.get_width()
	var h: int = marca.get_height()
	if w <= 0 or h <= 0:
		return
	var k: float = minf(118.0 / float(w), 26.0 / float(h))
	var dw: int = maxi(1, int(round(float(w) * k)))
	var dh: int = maxi(1, int(round(float(h) * k)))
	var copia: Image = marca.duplicate()
	copia.resize(dw, dh, Image.INTERPOLATE_LANCZOS)
	if copia.get_format() != Image.FORMAT_RGBA8:
		copia.convert(Image.FORMAT_RGBA8)
	atlas.blend_rect(copia, Rect2i(0, 0, dw, dh),
		Vector2i(x0 +(128 - dw) / 2,(32 - dh) / 2))




func _make_ad_mat(atlas: Texture2D, uv_len: float, uv_offset: float) -> ShaderMaterial:
	if _ad_shader == null:
		_ad_shader = Shader.new()
		_ad_shader.code = "\nshader_type spatial;\nrender_mode unshaded;\nuniform sampler2D ads : source_color, filter_nearest, repeat_enable;\nuniform float uv_len = 8.0;\nuniform float uv_offset = 0.0;\nuniform float scroll = 0.0;\nuniform float led_energy = 0.0;\nuniform float pulse = 0.0;\n// EL LED DEL GOL (2026-10-16): durante unos segundos tras el gol el anillo deja los\n// anuncios y pasa franjas de los dos colores de quien marca (ver `pulse_ads`).\nuniform float club_mix = 0.0;\nuniform vec3 gol_a : source_color = vec3(1.0);\nuniform vec3 gol_b : source_color = vec3(0.0);\n// Atenuación de VER A TRAVÉS DEL ESTADIO: 1.0 = valla opaca (lo normal),\n// baja hacia OCC_ALPHA_MIN cuando el anillo se planta entre la cámara y la\n// jugada. Es la vía del atenuador para un ShaderMaterial (ver _mat_alpha):\n// las mallas con StandardMaterial3D las funde bajando su albedo.a, pero aquí\n// el color lo pinta el shader, así que la transparencia tiene que salir de él.\nuniform float occ_alpha = 1.0;\nvoid fragment() {\n\tvec2 uv = vec2(UV.x * uv_len + uv_offset + TIME * scroll, UV.y);\n\tvec3 c = texture(ads, uv).rgb;\n\tif (club_mix > 0.0) {\n\t\t// Chevrones que corren a lo largo de la valla: la diagonal la da UV.y.\n\t\tfloat k = step(0.5, fract(UV.x * uv_len * 3.0 + abs(UV.y - 0.5) * 0.9 - TIME * 1.6));\n\t\tc = mix(c, mix(gol_a, gol_b, k), club_mix);\n\t}\n\tALBEDO = c * (1.0 + led_energy + pulse);\n\tALPHA = occ_alpha;\n}\n"































	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = _ad_shader
	mat.set_shader_parameter("ads", atlas)
	mat.set_shader_parameter("uv_len", uv_len)
	mat.set_shader_parameter("uv_offset", uv_offset)
	return mat






const MANUAL_BOARD_H: float = 4.6



var _clock_minute: int = 0
var _clock_hand_min: Node3D
var _clock_hand_hour: Node3D






func set_match_minute(minute: int) -> void:
	_clock_minute = maxi(minute, 0)



	_tick_gates(_clock_minute)
	_scoreboard_minute(_clock_minute)

	if _clock_minute >= PHONE_FROM and (_big_night or _derby):
		phone_lights(true)
	if _clock_minute <= 1:
		_fire_paper()
		_tifo_flares()


		serpentinas_throw()
	elif _clock_minute >= TIFO_UNTIL:
		_tifo_down()


	crowd_stakes(_gap, _clock_minute)




	_apply_dusk()
	if _clock_hand_min == null:
		return




	var turns: float = float(_clock_minute) / 60.0
	_clock_hand_min.rotation_degrees = Vector3(0.0, 0.0, -360.0 * turns)
	_clock_hand_hour.rotation_degrees = Vector3(0.0, 0.0, -360.0 * turns / 12.0)











const RELOJ_R: float = 1.8


func _build_stand_clock(z: float, y: float) -> void:
	var root: Node3D = Node3D.new()


	root.position = Vector3(11.5, y - 0.8, z)






	if _near_box_top_y > - INF:
		root.position.y = maxf(root.position.y, _near_box_top_y + BOX_SB_AIR + RELOJ_R)
	_bowl_root().add_child(root)
	_register_occluder(root)
	var face: MeshInstance3D = MeshInstance3D.new()
	var disc: CylinderMesh = CylinderMesh.new()
	disc.top_radius = 1.5
	disc.bottom_radius = 1.5
	disc.height = 0.22
	face.mesh = disc
	var face_mat: StandardMaterial3D = StandardMaterial3D.new()
	face_mat.albedo_color = Color("e6e2d8")
	face_mat.roughness = 0.9
	face.material_override = face_mat

	face.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	face.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(face)
	var ink: StandardMaterial3D = StandardMaterial3D.new()
	ink.albedo_color = Color("1a1c1f")
	ink.roughness = 1.0


	for i in 12:
		var a: float = TAU * float(i) / 12.0
		var tick: MeshInstance3D = MeshInstance3D.new()
		var tm: BoxMesh = BoxMesh.new()
		tm.size = Vector3(0.1, 0.26, 0.06)
		tick.mesh = tm
		tick.material_override = ink
		tick.position = Vector3(sin(a) * 1.22, cos(a) * 1.22, 0.14)
		tick.rotation_degrees = Vector3(0.0, 0.0, - rad_to_deg(a))
		tick.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(tick)



	_clock_hand_hour = _clock_hand(root, ink, 0.72, 0.13, 0.16)
	_clock_hand_min = _clock_hand(root, ink, 1.12, 0.09, 0.18)
	set_match_minute(_clock_minute)
	SenaClub.reloj(self, root)
	SenaClub.despeja(self, root)



func _clock_hand(root: Node3D, mat: StandardMaterial3D, length: float,
		width: float, z: float) -> Node3D:
	var pivot: Node3D = Node3D.new()
	pivot.position = Vector3(0.0, 0.0, z)
	root.add_child(pivot)
	var bar: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(width, length, 0.05)
	bar.mesh = bm
	bar.material_override = mat
	bar.position = Vector3(0.0, length * 0.5, 0.0)
	bar.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	pivot.add_child(bar)
	return pivot



const SB_CRESTA_AIRE: float = 2.0
func _build_scoreboard() -> void:
	var cfg: Dictionary = _scoreboard_cfg()
	if not bool(cfg["present"]):
		return
	var manual: bool = bool(cfg.get("manual", false))



	var independiente: bool = not _has_near_end and OPEN_END_FOOTPRINTS.has(footprint)
	if not _has_near_end and not manual and not independiente:
		return
	var s: float = float(cfg["scale"])











	var top: Vector2 = _slope_top(_near_end_scale if _near_end_scale > 0.0 else 1.0)
	var foot: Vector2 = Vector2(STAND_SLOPE_FOOT_Y, STAND_SLOPE_FOOT_Z)
	var mount: Vector2 = foot.lerp(top, float(cfg["t"]))







	if _near_box_top_y > - INF:
		var need: float = _near_box_top_y + BOX_SB_AIR + 1.7 * s
		if mount.x < need:
			mount = foot.lerp(top, clampf((need - foot.x) /(top.x - foot.x),
				float(cfg["t"]), 1.0))
	var root: Node3D = Node3D.new()



	var back: float = -16.0 -(TRACK_PUSH_Z if _track else 0.0)
	if manual:




		root.position = Vector3(-13.0, MANUAL_BOARD_H, back + 3.0)
		if footprint == "campo_coches":
			root.position = preload("res://features/stadium/open_ground_details.gd").CASETA_POS + Vector3(0, 6.3, 2.8)
	elif independiente:
		root.position = preload("res://features/stadium/open_ground_details.gd").posicion_marcador(footprint)
	else:


		root.position = Vector3(0.0, _near_end_y + mount.x, back + mount.y + 1.6)



	var cresta: bool = bool(FOOTPRINT_CFG.get(footprint, {}).get("sb_cresta", false)) \
			and not manual and not independiente
	if cresta:
		root.position = _corona_cercana() + Vector3(0.0, SB_CRESTA_AIRE + 1.7 * s, 0.6)
	_bowl_root().add_child(root)



	_scoreboard_root = root
	VenueIdentity.tablero(root, s, manual, div)


	_register_occluder(root)
	var frame: MeshInstance3D = MeshInstance3D.new()
	var frame_mesh: BoxMesh = BoxMesh.new()
	frame_mesh.size = Vector3(10.4 * s, 3.4 * s, 0.5)
	frame.mesh = frame_mesh
	var frame_mat: StandardMaterial3D = StandardMaterial3D.new()
	frame_mat.albedo_color = cfg["frame"]
	frame.material_override = frame_mat
	frame.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(frame)
	if manual:


		var apoyo: float = 5.02 if footprint == "campo_coches" else 0.0
		var post_h: float = root.position.y - 1.7 * s - apoyo
		for sx in [-3.9 * s, 3.9 * s]:
			var post: MeshInstance3D = MeshInstance3D.new()
			var post_mesh: BoxMesh = BoxMesh.new()
			post_mesh.size = Vector3(0.3, post_h, 0.3)
			post.mesh = post_mesh
			post.material_override = frame_mat
			post.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			post.position = Vector3(sx, -1.7 * s - post_h * 0.5, 0.0)
			root.add_child(post)

		SenaPueblo.marcador(self, root, s)
	elif independiente:
		preload("res://features/stadium/open_ground_details.gd").soportar_marcador(root, s, frame_mat)
	elif cresta:

		for sx in [-3.4 * s, 3.4 * s]:
			var pata: MeshInstance3D = MeshInstance3D.new()
			pata.mesh = _box(Vector3(0.35, SB_CRESTA_AIRE + 0.4, 0.35))
			pata.material_override = frame_mat
			pata.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			pata.position = Vector3(sx, -1.7 * s - SB_CRESTA_AIRE * 0.5 + 0.2, -0.2)
			root.add_child(pata)
	else:
		_sb_cajon(root, s)
	var screen: MeshInstance3D = MeshInstance3D.new()
	var screen_quad: QuadMesh = QuadMesh.new()
	screen_quad.size = Vector2(9.6 * s, 2.6 * s)
	screen.mesh = screen_quad



	_sb_build_screen(cfg)
	root.add_child(_sb_vp)


	_scoreboard_mat = ShaderMaterial.new()
	_scoreboard_mat.shader = load("res://features/stadium/scoreboard_screen.gdshader")
	_scoreboard_mat.set_shader_parameter("screen", _sb_vp.get_texture())

	_scoreboard_mat.set_shader_parameter("energy",
		float(cfg["emission"]) if bool(cfg["emissive"]) else 0.0)
	_scoreboard_mat.set_shader_parameter("rough", 0.6 if bool(cfg["emissive"]) else 1.0)
	screen.material_override = _scoreboard_mat
	screen.position = Vector3(0.0, 0.0, 0.26)
	screen.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(screen)
	set_scoreboard(0, 0)
	SenaClub.despeja(self, root)
	if bool(cfg.get("clock", false)) and _has_near_end and not cresta:
		_build_stand_clock(back + mount.y + 1.6, mount.x)



const SB_CAJON_ORLA: float = 0.8


const SB_CAJON_FRENTE: float = -0.55














func _sb_cajon(root: Node3D, s: float) -> void:
	var alto: float = 1.7 * s + SB_CAJON_ORLA * s


	var fondo: float = -1.6 - alto * tan(deg_to_rad(STAND_SLOPE_DEG)) - 0.4
	var obra: StandardMaterial3D = StandardMaterial3D.new()
	obra.albedo_color = front_wall_color()
	FinishDetail.acabado(obra, "concreto", div)
	var cajon: MeshInstance3D = MeshInstance3D.new()
	cajon.name = "CajonMarcador"
	cajon.mesh = _box(Vector3((10.4 + 2.0 * SB_CAJON_ORLA) * s, alto + 1.7 * s,
		SB_CAJON_FRENTE - fondo))
	cajon.material_override = obra
	cajon.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	cajon.position = Vector3(0.0,(alto - 1.7 * s) * 0.5,(SB_CAJON_FRENTE + fondo) * 0.5)
	root.add_child(cajon)









































const CUENCO_ATRAVIESA: Array = ["azteca_coloso", "monumental_river", "camp_nou"]




const BOWL_WALL_FACE: float = 1.0



const BOWL_MARGIN: float = 1.5


const BOWL_WALL_H: float = 2.2


var _bowl_walls: Array[Dictionary] = []






























var _flip: bool = false

var _bowl: Node3D = null



func ends_flipped() -> bool:
	return _flip







func set_ends_flipped(on: bool) -> void:
	if on == _flip:
		return
	_flip = on
	_apply_ends_flip()


func _apply_ends_flip() -> void:
	if _bowl == null or not is_instance_valid(_bowl):
		return
	_bowl.position = Vector3(0.0, 0.0, FIELD_DEPTH) if _flip else Vector3.ZERO
	_bowl.rotation = Vector3(0.0, PI if _flip else 0.0, 0.0)





	_box_panes_ready = false






func _bowl_root() -> Node3D:
	if _bowl == null or not is_instance_valid(_bowl):
		_bowl = Node3D.new()
		_bowl.name = "Bowl"
		add_child(_bowl)
		_apply_ends_flip()
	return _bowl



func _wp(p: Vector3) -> Vector3:
	return Vector3(- p.x, p.y, FIELD_DEPTH - p.z) if _flip else p



func _wd(d: Vector3) -> Vector3:
	return Vector3(- d.x, d.y, - d.z) if _flip else d



func _wx(x: float) -> float:
	return - x if _flip else x






func bowl_breach(p: Vector3, margen: float = BOWL_MARGIN) -> Vector3:
	var peor: float = 0.0
	var out: Vector3 = Vector3.ZERO
	var q: Vector3 = _wp(p)
	for w in _bowl_walls:


		if bool(w.get("atraviesa", false)):
			continue



		if q.y > float(w.get("top", INF)):
			continue
		var n: Vector3 = w["n"]



		var hondo: float = -(q -(w["p"] as Vector3)).dot(n)









		var corre: float = clampf(hondo, 0.0, float(w.get("fondo", INF)))
		var rampa: float = float(w.get("base", 0.0)) + BOWL_WALL_H \
				+ corre * tan(deg_to_rad(STAND_SLOPE_DEG))
		if q.y > minf(rampa, float(w.get("top", INF))):
			continue
		var d: float = margen -(q -(w["p"] as Vector3)).dot(n)
		if d > peor:
			peor = d
			out = n
	return _wd(out)




func has_bowl() -> bool:
	return not _bowl_walls.is_empty()
































const OCC_ALPHA_MIN: float = 0.0



const OCC_FADE_SPEED: float = 9.0




const OCC_MARGIN: float = 3.2








const OCC_FRAME_MIN: float = 0.04





const OCC_PLAY_R: float = 1.8







const OCC_SLICE_M: float = 8.0


const OCC_SLICE_MAX: int = 20




const OCC_FRAME_LEAD: float = 0.5



var _occluders: Array[Dictionary] = []


var _occ_targets: PackedVector3Array = PackedVector3Array()
var _occ_cam: Vector3 = Vector3.ZERO
var _occ_on: bool = false



const OCC_CUT_M: float = 8.0

var _occ_cam_prev: Vector3 = Vector3.INF



var _occ_basis: Basis = Basis.IDENTITY
var _occ_tan: Vector2 = Vector2.ONE
var _occ_frame: bool = false
















const OCC_EVAL_CAM_M: float = 0.05
const OCC_EVAL_TARGET_M: float = 0.15
var _occ_eval_cam: Vector3 = Vector3.INF
var _occ_eval_targets: PackedVector3Array = PackedVector3Array()
var _occ_eval_basis: Basis = Basis.IDENTITY
var _occ_eval_tan: Vector2 = Vector2.ONE
var _occ_eval_frame: bool = false
var _occ_eval_on: bool = false
var _occ_dirty: bool = true


var _occ_evals: int = 0





func _register_occluder(root: Node3D) -> void:
	_occluders.append({"root": root, "aabb": AABB(), "piezas": [], "measured": false,
		"a": 1.0, "want": 1.0, "applied": 1.0})
	_occ_dirty = true







func _unregister_occluder(root: Node3D) -> void:
	for i in range(_occluders.size() - 1, -1, -1):
		if _occluders[i]["root"] == root:
			_occluders.remove_at(i)
	_occ_dirty = true




























const OCC_TRAMOS_CAMPO: AABB = AABB(Vector3(- FIELD_HALF_W, -2.0, 0.0),
	Vector3(FIELD_HALF_W * 2.0, 80.0, FIELD_DEPTH))
func _registra_replicas(antes: Dictionary) -> void:
	var bowl: Node3D = _bowl_root()
	var ya: Dictionary = {}
	for occ in _occluders:
		ya[occ["root"]] = true
	var tramos: Dictionary = {}
	for c in bowl.get_children():
		if antes.has(c) or not (c is Node3D) or _cuelga_apuntado(c, ya):
			continue
		var pieza: Node3D = c
		var caja: AABB = pieza.transform * _local_aabb(pieza)
		if caja.size == Vector3.ZERO:
			continue


		if caja.grow(OCC_MARGIN).intersects(OCC_TRAMOS_CAMPO):
			_parte_en_tramos(pieza, tramos)
		else:
			_mats_propios(pieza, {})


			pieza.set_meta("occ_replica", true)
			_register_occluder(pieza)
	for k in tramos:
		var r: Node3D = tramos[k]["root"]
		r.set_meta("occ_replica", true)
		_register_occluder(r)




func _cuelga_apuntado(n: Node, ya: Dictionary) -> bool:
	if ya.has(n):
		return true
	for c in n.get_children():
		if _cuelga_apuntado(c, ya):
			return true
	return false












func _clave_tramo(p: Vector3) -> Vector2i:
	var rx: int = -1 if p.x < - FIELD_HALF_W else (1 if p.x > FIELD_HALF_W else 0)
	var rz: int = -1 if p.z < 0.0 else (1 if p.z > FIELD_DEPTH else 0)
	return Vector2i(rx, rz)






func _parte_en_tramos(pieza: Node3D, tramos: Dictionary) -> void:
	var padre: Node = pieza.get_parent()
	var pila: Array = [{"n": pieza, "xf": pieza.transform}]
	while not pila.is_empty():
		var it: Dictionary = pila.pop_back()
		var n: Node3D = it["n"]
		var xf: Transform3D = it["xf"]
		if n is MultiMeshInstance3D:
			_parte_multimesh(n, xf, tramos)
			continue


		if n is GeometryInstance3D or (n != pieza and n.get_child_count() == 0):
			var centro: Vector3 = xf.origin
			if n is GeometryInstance3D:
				centro =(xf * _geo_aabb(n)).get_center()
			var t: Dictionary = _tramo(tramos, _clave_tramo(centro))
			n.get_parent().remove_child(n)
			t["root"].add_child(n)
			n.transform = xf
			_mats_propios(n, t["mats"])
			continue
		for c in n.get_children():
			if c is Node3D:
				pila.append({"n": c, "xf": xf *(c as Node3D).transform})
	if pieza.get_parent() == padre:
		padre.remove_child(pieza)
		pieza.queue_free()





func _parte_multimesh(src: MultiMeshInstance3D, xf: Transform3D,
		tramos: Dictionary) -> void:
	var mm: MultiMesh = src.multimesh
	if mm == null or mm.mesh == null or not mm.has_meta("occ_xf"):
		var t0: Dictionary = _tramo(tramos, _clave_tramo((xf * _geo_aabb(src)).get_center()))
		src.get_parent().remove_child(src)
		t0["root"].add_child(src)
		src.transform = xf
		_mats_propios(src, t0["mats"])
		return
	var centro_malla: Vector3 = mm.mesh.get_aabb().get_center()
	var por_tramo: Dictionary = {}
	for ixf in (mm.get_meta("occ_xf") as Array):
		var k: Vector2i = _clave_tramo(xf *((ixf as Transform3D) * centro_malla))
		if not por_tramo.has(k):
			var lista: Array[Transform3D] = []
			por_tramo[k] = lista
		(por_tramo[k] as Array).append(ixf)
	for k in por_tramo:
		var lista2: Array[Transform3D] = por_tramo[k]
		var nm: MultiMesh = MultiMesh.new()
		nm.transform_format = MultiMesh.TRANSFORM_3D
		nm.mesh = mm.mesh
		nm.instance_count = lista2.size()
		for i in lista2.size():
			_mm_pon(nm, i, lista2[i])
		var nmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		nmi.multimesh = nm
		nmi.material_override = src.material_override
		nmi.cast_shadow = src.cast_shadow
		nmi.transform = xf
		var t: Dictionary = _tramo(tramos, k)
		t["root"].add_child(nmi)
		_mats_propios(nmi, t["mats"])






func _tramo(tramos: Dictionary, k: Vector2i) -> Dictionary:
	if not tramos.has(k):
		var r: Node3D = Node3D.new()
		r.name = "TramoReplica_%d_%d" % [k.x + 1, k.y + 1]
		_bowl_root().add_child(r, true)
		tramos[k] = {"root": r, "mats": {}}
	return tramos[k]






func _mats_propios(n: Node, mapa: Dictionary) -> void:
	if n is GeometryInstance3D:
		var gi: GeometryInstance3D = n
		var m: Material = _occ_material(gi)
		if m != null:
			if not mapa.has(m):
				mapa[m] = m.duplicate()
			gi.material_override = mapa[m]
	for c in n.get_children():
		_mats_propios(c, mapa)





func _geo_aabb(gi: GeometryInstance3D) -> AABB:
	if gi is MultiMeshInstance3D:
		var mm: MultiMesh =(gi as MultiMeshInstance3D).multimesh
		if mm != null and mm.mesh != null and mm.has_meta("occ_xf"):
			var mb: AABB = mm.mesh.get_aabb()
			var out: AABB = AABB()
			var any: bool = false
			for ixf in (mm.get_meta("occ_xf") as Array):
				var b: AABB =(ixf as Transform3D) * mb
				out = b if not any else out.merge(b)
				any = true
			if any:
				return out
	return gi.get_aabb()









func keep_view_clear(cam_pos: Vector3, targets: PackedVector3Array,
		cam: Camera3D = null) -> void:
	_occ_cam = cam_pos
	_occ_targets = targets
	_occ_on = targets.size() > 0
	_occ_frame = false
	if cam != null and is_instance_valid(cam) and cam.is_inside_tree():
		_occ_basis = cam.global_transform.basis
		var ty: float = tan(deg_to_rad(cam.fov * 0.5))
		var vp: Vector2 = SceneFade.rect_visible(cam).size


		if vp.x <= 0.0 or vp.y <= 0.0:
			vp = Vector2(float(ProjectSettings.get_setting(
					"display/window/size/viewport_width", 1080)),
				float(ProjectSettings.get_setting(
					"display/window/size/viewport_height", 1920)))
		var aspect: float = vp.x / maxf(vp.y, 1.0)



		if cam.keep_aspect == Camera3D.KEEP_WIDTH:
			_occ_tan = Vector2(ty, ty / maxf(aspect, 0.001))
		else:
			_occ_tan = Vector2(ty * aspect, ty)
		_occ_frame = true


























func view_clip_reset() -> void:




	_occ_targets = PackedVector3Array()
	_occ_on = false
	_occ_frame = false
	_occ_cam_prev = Vector3.INF
	for occ in _occluders:
		var root: Node3D = occ["root"]
		if not is_instance_valid(root):
			continue
		occ["want"] = 1.0
		occ["a"] = 1.0


		if absf(1.0 - float(occ["applied"])) > 0.004:
			_apply_occ_alpha(root, 1.0)
		occ["applied"] = 1.0




func es_azotea() -> bool:
	return _roof















func view_clip_now(cam: Camera3D, targets: PackedVector3Array) -> void:
	if cam == null or not is_instance_valid(cam) or not cam.is_inside_tree():
		return
	keep_view_clear(cam.global_position, targets, cam)
	_occ_cam_prev = Vector3.INF
	_tick_view_clip(0.0)
	_occ_cam_prev = Vector3.INF





func _tick_view_clip(delta: float) -> void:
	if _occluders.is_empty():
		return









	var corte: bool = is_inf(_occ_cam_prev.x) \
			or _occ_cam.distance_to(_occ_cam_prev) > OCC_CUT_M
	_occ_cam_prev = _occ_cam



	var pregunta: bool = corte or _occ_dirty or not _occ_eval_vale()
	if pregunta:
		_occ_eval_cam = _occ_cam
		_occ_eval_targets = _occ_targets.duplicate()
		_occ_eval_basis = _occ_basis
		_occ_eval_tan = _occ_tan
		_occ_eval_frame = _occ_frame
		_occ_eval_on = _occ_on
		_occ_dirty = false
		_occ_evals += 1
	for occ in _occluders:
		var root: Node3D = occ["root"]
		if not is_instance_valid(root):
			continue
		if pregunta:
			var blocks: bool = false
			if _occ_on:
				if not bool(occ["measured"]):
					occ["aabb"] = _local_aabb(root)
					occ["piezas"] = _piece_boxes(root)
					occ["measured"] = true
				blocks = _blocks_view(root, occ["aabb"], occ["piezas"])
			occ["want"] = OCC_ALPHA_MIN if blocks else 1.0
		var a: float = float(occ["a"])
		a = float(occ["want"]) if corte \
				else lerpf(a, float(occ["want"]), 1.0 - exp(- OCC_FADE_SPEED * delta))



		if absf(a - float(occ["want"])) < 0.01:
			a = float(occ["want"])
		occ["a"] = a
		if absf(a - float(occ["applied"])) > 0.004:
			occ["applied"] = a
			_apply_occ_alpha(root, a)



func _occ_eval_vale() -> bool:
	if _occ_on != _occ_eval_on or _occ_frame != _occ_eval_frame:
		return false
	if is_inf(_occ_eval_cam.x) \
			or _occ_cam.distance_squared_to(_occ_eval_cam) > OCC_EVAL_CAM_M * OCC_EVAL_CAM_M:
		return false
	if _occ_targets.size() != _occ_eval_targets.size():
		return false
	var tope2: float = OCC_EVAL_TARGET_M * OCC_EVAL_TARGET_M
	for i in _occ_targets.size():
		if _occ_targets[i].distance_squared_to(_occ_eval_targets[i]) > tope2:
			return false
	if _occ_frame and (not _occ_basis.is_equal_approx(_occ_eval_basis)
			or not _occ_tan.is_equal_approx(_occ_eval_tan)):
		return false
	return true





func _blocks_view(root: Node3D, box: AABB, piezas: Array = []) -> bool:
	if box.size == Vector3.ZERO:
		return false
	var inv: Transform3D = root.global_transform.affine_inverse()
	var from: Vector3 = inv * _occ_cam
	var grown: AABB = box.grow(OCC_MARGIN)





























	var contiene: Array = [box]
	if root.has_meta("occ_replica") and not piezas.is_empty():
		contiene = piezas
	for i in _occ_targets.size():
		var t: Vector3 = inv * _occ_targets[i]
		for caja in contiene:
			if (caja as AABB).has_point(t):
				return false













	if box.has_point(from):
		return true














	var cam_holgada: bool = grown.has_point(from)
	for i in _occ_targets.size():
		var t: Vector3 = inv * _occ_targets[i]
		var rayo: AABB = box if cam_holgada or grown.has_point(t) else grown
		if rayo.intersects_segment(from, t):















			if _hits_pieces(piezas, from, t):
				return true
	return _blocks_frame(root, box)




func _hits_pieces(piezas: Array, from: Vector3, t: Vector3) -> bool:
	if piezas.is_empty():
		return true
	for p in piezas:
		var caja: AABB =(p as AABB).grow(OCC_MARGIN)
		if caja.has_point(from):
			return true

		var rayo: AABB = p if caja.has_point(t) else caja
		if rayo.intersects_segment(from, t):
			return true
	return false







func _piece_boxes(root: Node3D) -> Array:
	var out: Array = []
	if root is GeometryInstance3D:
		out.append(_geo_aabb(root as GeometryInstance3D))
	for c in root.get_children():
		if not (c is Node3D):
			continue
		var hijo: Node3D = c
		var caja: AABB = _local_aabb(hijo)
		if caja.size == Vector3.ZERO:
			continue
		out.append(hijo.transform * caja)
	return out



















func _blocks_frame(root: Node3D, box: AABB) -> bool:
	if not _occ_frame or box.size == Vector3.ZERO:
		return false


	var fwd: Vector3 = - _occ_basis.z
	var play: float = 0.0
	for i in _occ_targets.size():
		play = maxf(play,(_occ_targets[i] - _occ_cam).dot(fwd))
	play -= OCC_FRAME_LEAD
	if play <= 0.2:
		return false










	var right: Vector3 = _occ_basis.x
	var up: Vector3 = _occ_basis.y
	var kx: float = _occ_tan.x
	var ky: float = _occ_tan.y



	var planes: Array[Plane] = [
		Plane(fwd, _occ_cam + fwd * 0.05),
		Plane(- fwd, _occ_cam + fwd * play),
		Plane((right + fwd * kx).normalized(), _occ_cam),
		Plane((- right + fwd * kx).normalized(), _occ_cam),
		Plane((up + fwd * ky).normalized(), _occ_cam),
		Plane((- up + fwd * ky).normalized(), _occ_cam),
	]
	var inv: Transform3D = root.global_transform.affine_inverse()



	var lplanes: Array[Plane] = []
	for pl in planes:
		lplanes.append(inv * pl)





	var bc: Vector3 = box.get_center()
	var be: Vector3 = box.size * 0.5
	for lp in lplanes:
		var br: float = absf(lp.normal.x) * be.x + absf(lp.normal.y) * be.y \
				+ absf(lp.normal.z) * be.z
		if lp.normal.dot(bc) - lp.d + br < 0.0:
			return false
































	var jugada: PackedFloat32Array = PackedFloat32Array()
	for i in _occ_targets.size():
		var v2: Vector3 = _occ_targets[i] - _occ_cam
		var d2: float = v2.dot(fwd)
		if d2 < 0.3:
			continue
		var cx: float = v2.dot(right) /(d2 * _occ_tan.x)
		var cy: float = v2.dot(up) /(d2 * _occ_tan.y)
		var rx: float = OCC_PLAY_R /(d2 * _occ_tan.x)
		var ry: float = OCC_PLAY_R /(d2 * _occ_tan.y)
		jugada.append(cx - rx)
		jugada.append(cx + rx)
		jugada.append(cy - ry)
		jugada.append(cy + ry)
	if jugada.is_empty():
		return false






	var x0: float = 2.0
	var x1: float = -2.0
	var y0: float = 2.0
	var y1: float = -2.0
	var eje: int = 0
	if box.size.y > box.size.x and box.size.y > box.size.z:
		eje = 1
	elif box.size.z > box.size.x and box.size.z > box.size.y:
		eje = 2
	var trozos: int = clampi(int(ceil(box.size[eje] / OCC_SLICE_M)), 1, OCC_SLICE_MAX)
	var paso: float = box.size[eje] / float(trozos)
	var xf: Transform3D = root.global_transform
	for i in trozos:
		var trozo: AABB = box
		var pos: Vector3 = trozo.position
		var tam: Vector3 = trozo.size
		pos[eje] = box.position[eje] + paso * float(i)
		tam[eje] = paso
		trozo.position = pos
		trozo.size = tam
		var c: Vector3 = trozo.get_center()
		var e: Vector3 = trozo.size * 0.5
		var dentro: bool = true
		for lp in lplanes:
			var r: float = absf(lp.normal.x) * e.x + absf(lp.normal.y) * e.y \
					+ absf(lp.normal.z) * e.z

			if lp.normal.dot(c) - lp.d + r < 0.0:
				dentro = false
				break
		if not dentro:
			continue


		var sx0: float = 2.0
		var sx1: float = -2.0
		var sy0: float = 2.0
		var sy1: float = -2.0
		for k in 8:
			var esq: Vector3 = xf *(trozo.position + Vector3(
				e.x * 2.0 * float(k&1), e.y * 2.0 * float((k>>1)&1),
				e.z * 2.0 * float((k>>2)&1)))
			var v: Vector3 = esq - _occ_cam
			var d: float = v.dot(fwd)














			if d < 0.3 or d > play:
				continue
			var nx: float = clampf(v.dot(right) /(d * _occ_tan.x), -1.0, 1.0)
			var ny: float = clampf(v.dot(up) /(d * _occ_tan.y), -1.0, 1.0)
			sx0 = minf(sx0, nx)
			sx1 = maxf(sx1, nx)
			sy0 = minf(sy0, ny)
			sy1 = maxf(sy1, ny)

		if sx1 < sx0:
			continue
		var pisa: bool = false
		for j in range(0, jugada.size(), 4):
			if sx1 >= jugada[j] and sx0 <= jugada[j + 1] \
					and sy1 >= jugada[j + 2] and sy0 <= jugada[j + 3]:
				pisa = true
				break
		if not pisa:
			continue
		x0 = minf(x0, sx0)
		x1 = maxf(x1, sx1)
		y0 = minf(y0, sy0)
		y1 = maxf(y1, sy1)


		if (x1 - x0) * 0.5 >= OCC_FRAME_MIN and (y1 - y0) * 0.5 >= OCC_FRAME_MIN:
			return true
	if x1 < x0:
		return false

	return (x1 - x0) * 0.5 >= OCC_FRAME_MIN and (y1 - y0) * 0.5 >= OCC_FRAME_MIN



func _local_aabb(root: Node3D) -> AABB:
	var out: AABB = AABB()
	var any: bool = false
	var stack: Array = [{"node": root, "xf": Transform3D.IDENTITY}]
	while not stack.is_empty():
		var it: Dictionary = stack.pop_back()
		var node: Node = it["node"]
		var xf: Transform3D = it["xf"]


		if node.has_meta("occ_fuera"):
			continue



		if node is GeometryInstance3D:
			var box: AABB = xf * _geo_aabb(node as GeometryInstance3D)
			out = box if not any else out.merge(box)
			any = true
		for c in node.get_children():
			if c is Node3D:
				stack.append({"node": c, "xf": xf *(c as Node3D).transform})
	return out if any else AABB()












func _apply_occ_alpha(root: Node3D, a: float) -> void:
	var stack: Array = [root]
	while not stack.is_empty():
		var node: Node = stack.pop_back()
		if node.has_meta("occ_fuera"):
			continue














		var na: float = a
		if node.has_meta("occ_gente"):
			na = maxf((a - OCC_ALPHA_MIN) /(1.0 - OCC_ALPHA_MIN), 0.0)
		if node is SpriteBase3D:



			var sp: SpriteBase3D = node
			if na >= 0.999:
				if sp.has_meta("occ_cut"):
					sp.alpha_cut = sp.get_meta("occ_cut")
					sp.remove_meta("occ_cut")
				sp.modulate.a = 1.0
			else:
				if not sp.has_meta("occ_cut"):
					sp.set_meta("occ_cut", sp.alpha_cut)
				sp.alpha_cut = SpriteBase3D.ALPHA_CUT_DISABLED
				sp.modulate.a = na
		elif node is GeometryInstance3D:
			var gi: GeometryInstance3D = node
			var mat: Material = _occ_material(gi)
			if mat != null:
				_mat_alpha(mat, na)
			if na < 0.999:
				if not gi.has_meta("occ_shadow"):
					gi.set_meta("occ_shadow", gi.cast_shadow)
					gi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			elif gi.has_meta("occ_shadow"):
				gi.cast_shadow = gi.get_meta("occ_shadow")
				gi.remove_meta("occ_shadow")
		for c in node.get_children():
			if c is Node3D:
				stack.append(c)








func _occ_material(gi: GeometryInstance3D) -> Material:
	if gi.material_override is BaseMaterial3D or gi.material_override is ShaderMaterial:
		return gi.material_override
	if gi is MultiMeshInstance3D:
		var mm: MultiMesh =(gi as MultiMeshInstance3D).multimesh
		if mm != null and mm.mesh != null and mm.mesh.get_surface_count() > 0:
			return mm.mesh.surface_get_material(0) as BaseMaterial3D
		return null
	if gi is MeshInstance3D and (gi as MeshInstance3D).mesh != null \
			and (gi as MeshInstance3D).mesh.get_surface_count() > 0:
		return (gi as MeshInstance3D).get_active_material(0)




	if Particulas.es(gi):
		var pasada: Mesh =(gi as GeometryInstance3D).draw_pass_1
		if pasada != null and pasada.get_surface_count() > 0:
			return pasada.surface_get_material(0)
		return null
	return null






func _mat_alpha(mat: Material, a: float) -> void:




	if mat is ShaderMaterial:
		(mat as ShaderMaterial).set_shader_parameter("occ_alpha", a)
		return
	var bm: BaseMaterial3D = mat as BaseMaterial3D
	if bm == null:
		return










	if not bm.has_meta("occ_mode"):
		bm.set_meta("occ_mode", bm.transparency)
		bm.set_meta("occ_alpha", bm.albedo_color.a)
	var base_a: float = float(bm.get_meta("occ_alpha"))
	var c: Color = bm.albedo_color
	if a >= 0.999:



		bm.transparency = bm.get_meta("occ_mode")
		c.a = base_a
		bm.albedo_color = c
		return
	bm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	c.a = a * base_a
	bm.albedo_color = c








































const TRAIN_DIV: Dictionary = {
	1: {"fence_h": 2.6, "fence": Color("8d97a0"), "huts": 3, "stand": true,
		"tower": true, "stations": true, "hedge": true, "hq": 4, "lights": 4, "privacy": 2,
		"elite": true, "ads": 3},
	2: {"fence_h": 2.1, "fence": Color("77837c"), "huts": 2, "stand": true,
		"tower": false, "stations": true, "hedge": true, "hq": 2, "lights": 2, "privacy": 1,
		"elite": false, "ads": 2},
	3: {"fence_h": 1.6, "fence": Color("6d675b"), "huts": 1, "stand": false,
		"tower": false, "stations": false, "hedge": false, "hq": 0, "lights": 0, "privacy": 0,
		"elite": false, "ads": 1},
}















const TRAIN_AD_LEN: float = 46.0
const TRAIN_AD_Z: float = 5.0


const TRAIN_AD_X: float = 36.0




const TRAIN_AD_BRANDS: int = 4

const TRAIN_AD_DULL: float = 0.12





const TRAIN_FENCE_OUT: float = 8.0
const TRAIN_STATION_X: float = 38.5


func _train_cfg() -> Dictionary:
	return TRAIN_DIV.get(clampi(div, 1, 3), TRAIN_DIV[3])


func _build_training() -> void:
	var cfg: Dictionary = _train_cfg()



	var root: Node3D = _bowl_root()
	var first: int = root.get_child_count()
	_train_fence(cfg)
	_train_huts(cfg)
	if bool(cfg["stand"]):
		_train_stand(cfg)
	if bool(cfg["tower"]):
		_train_tower(cfg)
	if int(cfg.get("privacy", 0)) > 0:
		_train_privacy(cfg)
	if int(cfg.get("hq", 0)) > 0:
		_train_hq(cfg)
	if int(cfg.get("privacy", 0)) > 0:
		_train_yard(cfg)
	_train_lights(cfg)
	_train_ads(cfg)
	_train_stations(cfg)
	if bool(cfg.get("elite", false)):
		_train_elite(cfg)
	if GameState.training_home:
		_train_home_brand(cfg)
	_train_shadows(root, first)



















const TRAIN_SHADOW_MIN: float = 3.2

func _train_shadows(root: Node3D, first: int) -> void:
	for i in range(first, root.get_child_count()):
		var mi: MeshInstance3D = root.get_child(i) as MeshInstance3D
		if mi == null or mi.mesh == null:
			continue
		var size: Vector3 = mi.mesh.get_aabb().size
		if maxf(size.x, maxf(size.y, size.z)) < TRAIN_SHADOW_MIN:
			continue


		if size.y < 0.5:
			continue



		if mi.has_meta("sin_sombra"):
			continue
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON















func _train_home_brand(cfg: Dictionary) -> void:
	var parts: PackedStringArray = Career.player_name.strip_edges() \
			.split(" ", false)
	var surname: String =(parts[parts.size() - 1] if parts.size() > 0
		else Career.player_name).to_upper()
	var label: String = I18n.tf("CANCHA DE {0}", [surname])
	if GameState.player_number > 0:
		label += " - %d" % GameState.player_number
	label = PixelText.normalize(label)
	var kit: Dictionary = GameState.player_kit()
	var cloth: Color =(kit.get("kit", Color("2b3340")) as Color).darkened(0.25)
	var ink: Color = Color("f2ead8") if cloth.get_luminance() < 0.5 \
			else Color("1d1a16")
	var px: int = 6
	var w: int = PixelText.text_width(label, px) + px * 6
	var h: int = PixelText.GLYPH_H * px + px * 6
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(cloth)

	for xx in w:
		for yy in [0, 1, h - 2, h - 1]:
			img.set_pixel(xx, yy, ink)
	for yy in h:
		for xx in [0, 1, w - 2, w - 1]:
			img.set_pixel(xx, yy, ink)
	PixelText.draw_text(img, px * 3, px * 3, label, ink, px)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var fence_h: float = float(cfg["fence_h"])
	var z0: float = - TRAIN_FENCE_OUT




	var banner_w: float = 12.0
	var banner_h: float = banner_w * float(h) / float(w)
	_train_banner(tex, Vector3(0.0, maxf(fence_h * 0.72, banner_h * 0.55 + 0.2),
		z0 - 0.12), Vector2(banner_w, banner_h), false)

	var hut_x: float = -(FIELD_HALF_W + TRAIN_FENCE_OUT - 5.0) + 1.55
	_train_banner(tex, Vector3(hut_x, 2.1, FIELD_DEPTH * 0.5),
		Vector2(banner_w * 0.45, banner_h * 0.45), true)


func _train_banner(tex: Texture2D, at: Vector3, size: Vector2,
		side: bool) -> void:
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = size
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	quad.material_override = mat
	quad.position = at


	if side:
		quad.rotate_y(deg_to_rad(90.0))
	add_child(quad)





func _train_mat(col: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.albedo_color = col
	return m















func _train_solid(col: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 0.92
	m.metallic = 0.0
	return m




func _train_glass(col: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 0.16
	m.metallic = 0.35
	return m







func _train_tree(at: Vector3, height: float, width: float, yaw: float,
		leaf: StandardMaterial3D, bark: StandardMaterial3D) -> void:
	var trunk: CylinderMesh = CylinderMesh.new()
	trunk.top_radius = 0.16
	trunk.bottom_radius = 0.28
	trunk.height = height * 0.62
	trunk.radial_segments = 6
	_city_mesh(at + Vector3(0.0, height * 0.31, 0.0), trunk, bark) \
			.set_meta("sin_sombra", true)
	_city_mesh(at + Vector3(0.0, height * 0.72, 0.0),
		_box(Vector3(width, height * 0.44, width)), leaf, yaw)
	_city_mesh(at + Vector3(width * 0.16, height * 0.94, - width * 0.12),
		_box(Vector3(width * 0.74, height * 0.32, width * 0.74)), leaf,
		yaw + 34.0).set_meta("sin_sombra", true)
	_city_mesh(at + Vector3(- width * 0.14, height * 0.58, width * 0.14),
		_box(Vector3(width * 0.78, height * 0.3, width * 0.78)), leaf,
		yaw - 27.0).set_meta("sin_sombra", true)






func _train_fence(cfg: Dictionary) -> void:
	var h: float = float(cfg["fence_h"])
	var mat: StandardMaterial3D = _train_mat(cfg["fence"])
	var x: float = FIELD_HALF_W + TRAIN_FENCE_OUT
	var z0: float = - TRAIN_FENCE_OUT
	var z1: float = FIELD_DEPTH + TRAIN_FENCE_OUT
	var cz: float =(z0 + z1) * 0.5

	for run in [[Vector3(0.0, 0.0, z0), x * 2.0, true],
			[Vector3(0.0, 0.0, z1), x * 2.0, true],
			[Vector3(- x, 0.0, cz), z1 - z0, false],
			[Vector3(x, 0.0, cz), z1 - z0, false]]:
		var at: Vector3 = run[0]
		var length: float = run[1]
		var along_x: bool = run[2]
		var span: Vector3 = Vector3(length, 0.1, 0.1) if along_x \
				else Vector3(0.1, 0.1, length)
		for y in [h, h * 0.55]:
			_city_mesh(at + Vector3(0.0, y, 0.0), _box(span), mat)
		var n: int = int(length / 6.0)
		for i in n + 1:
			var t: float = float(i) / maxf(float(n), 1.0) - 0.5
			var off: Vector3 = Vector3(t * length, 0.0, 0.0) if along_x \
					else Vector3(0.0, 0.0, t * length)
			_city_mesh(at + off + Vector3(0.0, h * 0.5, 0.0),
				_box(Vector3(0.14, h, 0.14)), mat)



	if bool(cfg.get("hedge", false)):
		var green: StandardMaterial3D = _train_mat(Color("2f4a2c"))
		for run2 in [[Vector3(0.0, 0.6, z0 - 1.4), Vector3(x * 2.0 + 3.0, 1.2, 1.2)],
				[Vector3(0.0, 0.6, z1 + 1.4), Vector3(x * 2.0 + 3.0, 1.2, 1.2)],
				[Vector3(- x - 1.4, 0.6, cz), Vector3(1.2, 1.2, z1 - z0)],
				[Vector3(x + 1.4, 0.6, cz), Vector3(1.2, 1.2, z1 - z0)]]:
			_city_mesh(run2[0], _box(run2[1]), green)














func _train_ads(cfg: Dictionary) -> void:
	var runs: int = int(cfg.get("ads", 0))
	if runs <= 0:
		return
	var list: Array = _sponsor_list()
	if list.is_empty():
		return
	var acfg: Dictionary = _ads_cfg()
	var brands: int = clampi(mini(int(acfg["brands"]), TRAIN_AD_BRANDS), 1, list.size())
	var atlas: ImageTexture = _ad_atlas_texture(list, brands,
		minf(float(acfg.get("dull", 0.0)) + TRAIN_AD_DULL, 1.0))




	_ad_board(atlas, brands, Vector3(0.0, 0.0, - TRAIN_AD_Z), TRAIN_AD_LEN, 0.0)
	if runs >= 2:
		_ad_board(atlas, brands, Vector3(0.0, 0.0, FIELD_DEPTH + TRAIN_AD_Z),
			TRAIN_AD_LEN, 180.0)
	if runs >= 3:
		_ad_board(atlas, brands, Vector3(TRAIN_AD_X, 0.0, FIELD_DEPTH * 0.5),
			FIELD_DEPTH * 0.4, -90.0)





func _train_huts(cfg: Dictionary) -> void:
	var n: int = int(cfg["huts"])
	var wall: StandardMaterial3D = _train_solid(Color("a39a89") if div <= 2
		else Color("8a8071"))
	var roof: StandardMaterial3D = _train_solid(Color("57616a") if div <= 2
		else Color("6a6055"))
	var door: StandardMaterial3D = _train_solid(Color("42474d"))
	var glass: StandardMaterial3D = _train_glass(Color("39424b"))
	var trim: StandardMaterial3D = _train_solid(Color(cfg["fence"]).lightened(0.1))
















	var x: float = -(FIELD_HALF_W + 4.0)
	for i in n:
		var z: float = FIELD_DEPTH * 0.5 + float(i - n / 2) * 14.0
		var w: float = 6.0
		var d: float = 6.0
		var h: float = 3.4
		_city_mesh(Vector3(x, h * 0.5, z), _box(Vector3(w, h, d)), wall)


		_city_mesh(Vector3(x, h + 0.2, z), _box(Vector3(w + 1.2, 0.4, d + 1.2)), roof)



		var gable: PrismMesh = PrismMesh.new()
		gable.size = Vector3(w + 1.2, 1.15, d + 1.2)
		_city_mesh(Vector3(x, h + 0.98, z), gable, roof, 90.0)

		_city_mesh(Vector3(x + w * 0.5 + 0.03, 1.1, z),
			_box(Vector3(0.06, 2.2, 1.2)), door)




		_city_mesh(Vector3(x + w * 0.5 + 0.35, 0.09, z),
			_box(Vector3(0.8, 0.18, 1.7)), trim)
		for sz2 in [-1.0, 1.0]:
			_city_mesh(Vector3(x + w * 0.5 + 0.02, 2.35, z + sz2 * 1.9),
				_box(Vector3(0.05, 0.7, 1.5)), glass)
		_city_mesh(Vector3(x +(w + 1.2) * 0.5, h + 0.02, z),
			_box(Vector3(0.16, 0.16, d + 1.2)), trim)

		var pipe: CylinderMesh = CylinderMesh.new()
		pipe.top_radius = 0.08
		pipe.bottom_radius = 0.08
		pipe.height = h
		pipe.radial_segments = 6
		_city_mesh(Vector3(x + w * 0.5 - 0.1, h * 0.5, z + d * 0.5 + 0.1),
			pipe, trim)





func _train_stand(cfg: Dictionary) -> void:
	var mat: StandardMaterial3D = _train_solid(Color("9aa0a4") if div == 1
		else Color("8b8f88"))
	var x0: float = FIELD_HALF_W + 3.0
	var length: float = FIELD_DEPTH * 0.42
	for i in 4:
		var step_h: float = 0.5 * float(i + 1)
		_city_mesh(Vector3(x0 + 1.1 * float(i), step_h * 0.5, FIELD_DEPTH * 0.5),
			_box(Vector3(1.1, step_h, length)), mat.duplicate())

	_city_mesh(Vector3(x0 + 4.4, 1.4, FIELD_DEPTH * 0.5),
		_box(Vector3(0.3, 2.8, length)), _train_mat(Color(cfg["fence"])))






func _train_tower(cfg: Dictionary) -> void:
	var mat: StandardMaterial3D = _train_solid(Color(cfg["fence"]).darkened(0.2))
	var x: float = -(FIELD_HALF_W + 4.0)
	var z: float = FIELD_DEPTH * 0.5
	var h: float = 7.5
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_city_mesh(Vector3(x + sx * 0.9, h * 0.5, z + sz * 0.9),
				_box(Vector3(0.18, h, 0.18)), mat)

	for i in 3:
		var y: float = 2.0 * float(i + 1)
		_city_mesh(Vector3(x, y, z), _box(Vector3(2.0, 0.1, 2.0)), mat)
	_city_mesh(Vector3(x, h + 0.15, z), _box(Vector3(2.6, 0.3, 2.6)), mat)
	_city_mesh(Vector3(x, h + 0.75, z), _box(Vector3(0.5, 0.5, 0.7)),
		_train_mat(Color("2b2f36")))

















const TRAIN_TREE_STEP: float = 11.0

func _train_privacy(cfg: Dictionary) -> void:
	var level: int = int(cfg.get("privacy", 0))
	var x: float = FIELD_HALF_W + TRAIN_FENCE_OUT
	var z0: float = - TRAIN_FENCE_OUT
	var z1: float = FIELD_DEPTH + TRAIN_FENCE_OUT
	var cz: float =(z0 + z1) * 0.5




	if level >= 2:
		var wall: StandardMaterial3D = _train_solid(Color(cfg["fence"]).darkened(0.35))
		var cap: StandardMaterial3D = _train_solid(Color(cfg["fence"]).lightened(0.12))
		var wh: float = 3.4
		var out: float = 2.6
		for run in [[Vector3(0.0, 0.0, z0 - out), Vector3((x + out) * 2.0, 0.0, 0.4), true],
				[Vector3(0.0, 0.0, z1 + out), Vector3((x + out) * 2.0, 0.0, 0.4), true],
				[Vector3(- x - out, 0.0, cz), Vector3(0.4, 0.0, z1 - z0 + out * 2.0), false],
				[Vector3(x + out, 0.0, cz), Vector3(0.4, 0.0, z1 - z0 + out * 2.0), false]]:
			var at: Vector3 = run[0]
			var span: Vector3 = run[1]
			var along_x: bool = run[2]
			_city_mesh(at + Vector3(0.0, wh * 0.5, 0.0),
				_box(Vector3(span.x, wh, span.z)), wall)

			_city_mesh(at + Vector3(0.0, wh + 0.12, 0.0),
				_box(Vector3(span.x + 0.5, 0.24, span.z + 0.5)), cap)

			var length: float = span.x if along_x else span.z
			var n: int = int(length / 12.0)
			for i in n + 1:
				var t: float = float(i) / maxf(float(n), 1.0) - 0.5
				var off: Vector3 = Vector3(t * length, 0.0, 0.0) if along_x \
						else Vector3(0.0, 0.0, t * length)
				_city_mesh(at + off + Vector3(0.0, wh * 0.52, 0.0),
					_box(Vector3(0.7, wh * 1.04, 0.7)), cap) \
							.set_meta("sin_sombra", true)




	var trunk: StandardMaterial3D = _train_solid(Color("4a3a2b"))
	var leaf_a: StandardMaterial3D = _train_solid(Color("2c4326"))
	var leaf_b: StandardMaterial3D = _train_solid(Color("36512c"))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 90604
	var ring: float = x +(5.2 if level >= 2 else 3.4)
	var hq_from: float = FIELD_DEPTH * 0.5 - 22.0
	var hq_to: float = FIELD_DEPTH * 0.5 + 22.0
	var lados: Array = [[-1.0, true], [1.0, true], [-1.0, false], [1.0, false]]
	for lado in lados:
		var s_dir: float = lado[0]
		var along_z: bool = lado[1]
		var length: float =(z1 - z0 + ring * 0.6) if along_z else (ring * 2.0)
		var n: int = int(length / TRAIN_TREE_STEP)
		for i in n + 1:
			var t: float = float(i) / maxf(float(n), 1.0) - 0.5
			var at: Vector3
			if along_z:
				at = Vector3(s_dir * ring, 0.0, cz + t * length)

				if s_dir > 0.0 and at.z > hq_from and at.z < hq_to:
					continue
			else:
				at = Vector3(t * length, 0.0, cz + s_dir *((z1 - z0) * 0.5 + ring * 0.35))


			at += Vector3(rng.randf_range(-1.1, 1.1), 0.0, rng.randf_range(-1.4, 1.4))
			_train_tree(at, rng.randf_range(5.5, 8.8), rng.randf_range(3.4, 5.0),
				rng.randf_range(0.0, 90.0),
				leaf_a if i % 2 == 0 else leaf_b, trunk)

















const TRAIN_HQ_D: float = 13.0
const TRAIN_HQ_FLOOR: float = 3.6


const TRAIN_HQ_GAP: float = 6.0

func _train_hq(cfg: Dictionary) -> void:
	var floors: int = int(cfg.get("hq", 0))
	var kit: Dictionary = _host_kit_now()
	var club_a: Color = kit.get("kit", Color("2b3340"))
	var club_b: Color = kit.get("kit2", club_a.lerp(Color("f2f2f0"), 0.5))


	if club_b.is_equal_approx(club_a):
		club_b = club_a.lerp(Color("f2f2f0"), 0.55)
	var wall: StandardMaterial3D = _train_solid(Color("d8d4cb") if floors >= 3
		else Color("c9c4b8"))
	var glass: StandardMaterial3D = _train_glass(Color("32404b"))
	var band_a: StandardMaterial3D = _train_solid(club_a)
	var band_b: StandardMaterial3D = _train_solid(club_b)
	var metal: StandardMaterial3D = _train_solid(Color("8f959c"))
	var shade: StandardMaterial3D = _train_solid(Color("b9b4aa"))
	var h: float = TRAIN_HQ_FLOOR * float(floors)

	var length: float = 34.0 if floors >= 3 else 22.0
	var x: float = FIELD_HALF_W + TRAIN_FENCE_OUT + TRAIN_HQ_GAP + TRAIN_HQ_D * 0.5
	var z: float = FIELD_DEPTH * 0.5
	var face: float = x - TRAIN_HQ_D * 0.5
	_city_mesh(Vector3(x, h * 0.5, z), _box(Vector3(TRAIN_HQ_D, h, length)), wall)



	for i in floors:
		var y: float = TRAIN_HQ_FLOOR * float(i) + TRAIN_HQ_FLOOR * 0.62
		_city_mesh(Vector3(face - 0.06, y, z),
			_box(Vector3(0.12, 1.25, length - 3.0)), glass)
		for sz in [-1.0, 1.0]:
			_city_mesh(Vector3(x, y, z + sz *(length * 0.5 - 0.06)),
				_box(Vector3(TRAIN_HQ_D - 3.0, 1.25, 0.12)), glass)



	_city_mesh(Vector3(face - 0.05, 0.9, z),
		_box(Vector3(0.14, 1.8, length)), band_a)
	_city_mesh(Vector3(x, h + 0.45, z),
		_box(Vector3(TRAIN_HQ_D + 0.8, 0.9, length + 0.8)), band_a)





	for sz in [-1.0, 1.0]:
		_city_mesh(Vector3(face - 0.05, h * 0.5, z + sz *(length * 0.5 - 2.2)),
			_box(Vector3(0.16, h, 2.0)), band_b)
	_city_mesh(Vector3(face - 0.05, h * 0.5, z + length * 0.16),
		_box(Vector3(0.12, h, 7.4)), band_b)





	var attic_h: float = TRAIN_HQ_FLOOR * 0.82
	var attic_d: float = TRAIN_HQ_D - 3.2
	var attic_len: float = length - 6.0
	_city_mesh(Vector3(x + 1.2, h + attic_h * 0.5 + 0.9, z),
		_box(Vector3(attic_d, attic_h, attic_len)), shade)
	_city_mesh(Vector3(x + 1.2 - attic_d * 0.5 - 0.05, h + attic_h * 0.55 + 0.9, z),
		_box(Vector3(0.1, attic_h * 0.55, attic_len - 2.0)), glass)




	_city_mesh(Vector3(face + 0.9, h + 1.65, z),
		_box(Vector3(0.35, 1.5, length - 1.0)), shade)
	for i2 in 3:

		var mz: float = z - attic_len * 0.3 + float(i2) * attic_len * 0.3
		_city_mesh(Vector3(x + 5.2, h + 1.25, mz),
			_box(Vector3(2.2, 0.25, 2.6)), metal)
		_city_mesh(Vector3(x + 5.2, h + 1.85, mz),
			_box(Vector3(1.9, 1.0, 2.2)), metal)
		_city_mesh(Vector3(x + 5.2, h + 2.4, mz),
			_box(Vector3(1.5, 0.12, 1.8)), shade)



	var pole: CylinderMesh = CylinderMesh.new()
	pole.top_radius = 0.09
	pole.bottom_radius = 0.12
	pole.height = 9.0
	pole.radial_segments = 6
	for i3 in 3:
		var fz: float = z - length * 0.34 + float(i3) * 2.6
		_city_mesh(Vector3(face - 3.2, 4.5, fz), pole, metal)
		_city_mesh(Vector3(face - 3.2, 0.12, fz),
			_box(Vector3(0.9, 0.24, 0.9)), shade)

		_city_mesh(Vector3(face - 3.2, 7.6, fz + 0.95),
			_box(Vector3(0.06, 1.5, 1.7)), band_a if i3 != 1 else band_b, 6.0)
		_city_mesh(Vector3(face - 3.15, 6.4, fz + 0.85),
			_box(Vector3(0.06, 1.0, 1.5)), band_b if i3 != 1 else band_a, -5.0)


	_city_mesh(Vector3(face - 0.07, 1.5, z - length * 0.28),
		_box(Vector3(0.16, 3.0, 4.4)), glass)
	_city_mesh(Vector3(face - 1.4, 3.3, z - length * 0.28),
		_box(Vector3(2.8, 0.28, 6.0)), band_a)


	for sz3 in [-1.0, 1.0]:
		var stay: MeshInstance3D = _city_mesh(
			Vector3(face - 1.3, 4.2, z - length * 0.28 + sz3 * 2.6),
			_box(Vector3(2.6, 0.1, 0.1)), metal)
		stay.rotation_degrees = Vector3(0.0, 0.0, -22.0)



	for i4 in 3:
		_city_mesh(Vector3(face - 0.5 - float(i4) * 0.55, 0.5 - float(i4) * 0.16,
			z - length * 0.28), _box(Vector3(1.1, 0.32, 6.4)), shade)
	_city_mesh(Vector3(face - 2.6, 0.03, z),
		_box(Vector3(5.6, 0.06, length + 4.0)), shade)

	var bush: StandardMaterial3D = _train_solid(Color("31492b"))
	for i5 in 4:
		var jz: float = z - length * 0.28 +(-1.0 if i5 % 2 == 0 else 1.0) * 4.2
		var jx: float = face - 1.6 - float(i5 / 2) * 2.2
		_city_mesh(Vector3(jx, 0.35, jz), _box(Vector3(1.3, 0.7, 1.3)), shade)
		_city_mesh(Vector3(jx, 0.92, jz), _box(Vector3(1.05, 0.6, 1.05)), bush)


	if floors >= 3:
		var gym_h: float = TRAIN_HQ_FLOOR * 1.6
		var gx: float = x + TRAIN_HQ_D * 0.5 + 5.0
		_city_mesh(Vector3(gx, gym_h * 0.5, z + 8.0),
			_box(Vector3(10.0, gym_h, 18.0)), wall)
		_city_mesh(Vector3(gx, gym_h + 0.3, z + 8.0),
			_box(Vector3(10.8, 0.6, 18.8)), band_b)



		for i6 in 4:
			var sz4: float = z + 1.5 + float(i6) * 4.2
			var saw: PrismMesh = PrismMesh.new()
			saw.size = Vector3(9.4, 1.5, 3.4)
			saw.left_to_right = 0.0
			_city_mesh(Vector3(gx, gym_h + 1.35, sz4), saw, wall, 90.0)
			_city_mesh(Vector3(gx, gym_h + 1.35, sz4 + 1.45),
				_box(Vector3(9.0, 1.4, 0.12)), glass)



	var tar: StandardMaterial3D = _train_mat(Color("4b4d51"))
	var line: StandardMaterial3D = _train_mat(Color("c9c6b8"))
	var park_x: float = x
	var park_z: float = z + length * 0.5 + 11.0
	_city_mesh(Vector3(park_x, 0.02, park_z),
		_box(Vector3(11.0, 0.04, 16.0)), tar)
	var car_rng: RandomNumberGenerator = RandomNumberGenerator.new()
	car_rng.seed = 90605
	var autos_sede: Array[Dictionary] = []
	for i in 4:
		var cz2: float = park_z - 6.0 + float(i) * 4.0
		_city_mesh(Vector3(park_x, 0.03, cz2 - 2.0),
			_box(Vector3(10.6, 0.06, 0.16)), line)
		autos_sede.append({"transform": Transform3D(Basis.IDENTITY, Vector3(park_x, 0.04, cz2)),
			"variante": i % 3,
			"color": Color.from_hsv(car_rng.randf(), 0.18, car_rng.randf_range(0.35, 0.8))})
	preload("res://features/stadium/stadium_cars.gd").crear(_bowl_root(), autos_sede, "AutosSede")



	_city_mesh(Vector3(park_x - 4.6, 1.3, park_z - 9.2),
		_box(Vector3(1.6, 2.6, 1.6)), shade)
	_city_mesh(Vector3(park_x - 4.6, 2.75, park_z - 9.2),
		_box(Vector3(2.0, 0.22, 2.0)), band_a)
	_city_mesh(Vector3(park_x - 4.6, 1.9, park_z - 8.3),
		_box(Vector3(1.1, 0.9, 0.08)), glass)
	_city_mesh(Vector3(park_x - 2.2, 1.05, park_z - 9.2),
		_box(Vector3(4.6, 0.16, 0.16)), _train_solid(Color("d84a2c")))


	for i7 in 3:
		var lz: float = park_z - 6.0 + float(i7) * 6.0
		var lamp_pole: CylinderMesh = CylinderMesh.new()
		lamp_pole.top_radius = 0.08
		lamp_pole.bottom_radius = 0.13
		lamp_pole.height = 5.4
		lamp_pole.radial_segments = 6
		_city_mesh(Vector3(park_x - 5.4, 2.7, lz), lamp_pole, metal)
		_city_mesh(Vector3(park_x - 5.0, 5.35, lz),
			_box(Vector3(1.1, 0.12, 0.12)), metal)
		_city_mesh(Vector3(park_x - 4.5, 5.22, lz),
			_box(Vector3(0.8, 0.2, 0.34)), _train_mat(Color("e8e4cf")))

	_train_crest(Vector3(face - 0.16, h * 0.66, z + length * 0.16),
		6.8 if floors >= 3 else 4.6)



	_train_sign(Vector3(face + 0.71, h + 1.65, z),(length - 1.0) * 0.82, 1.15,
		club_a)
















func _train_sign(at: Vector3, max_w: float, max_h: float, ink: Color) -> void:
	var club: String = _pitch_seed_club()
	if club.is_empty():
		return
	var raw: String = String(Teams.by_id(club).get("name", ""))
	if raw.strip_edges().is_empty():
		return
	var label: String = PixelText.normalize(raw.to_upper())
	var px: int = 5
	var w: int = PixelText.text_width(label, px) + px * 4
	var hh: int = PixelText.GLYPH_H * px + px * 4
	var img: Image = Image.create(w, hh, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	PixelText.draw_text(img, px * 2, px * 2, label, Color(0.96, 0.95, 0.92), px)
	var tex: ImageTexture = ImageTexture.create_from_image(img)



	var sw: float = max_w
	var sh: float = sw * float(hh) / float(w)
	if sh > max_h:
		sh = max_h
		sw = sh * float(w) / float(hh)
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(sw, sh)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex



	mat.albedo_color = ink
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.roughness = 1.0
	quad.material_override = mat
	quad.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	quad.position = at

	quad.rotate_y(deg_to_rad(-90.0))
	add_child(quad)






func _train_crest(at: Vector3, side: float) -> void:
	var club: String = _pitch_seed_club()
	if club.is_empty():
		return
	var team: Dictionary = Teams.by_id(club)
	if team.is_empty():
		return
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(CREST_PX, CREST_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(CREST_PX, CREST_PX)
	crest.set_team(team)
	vp.add_child(crest)
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(side, side)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	quad.material_override = mat
	quad.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	quad.position = at

	quad.rotate_y(deg_to_rad(-90.0))
	add_child(quad)






func _train_lights(cfg: Dictionary) -> void:
	var n: int = int(cfg.get("lights", 0))
	if n <= 0:
		return
	var mat: StandardMaterial3D = _train_mat(Color("6f7681"))
	var lamp: StandardMaterial3D = _train_mat(Color("e8e4cf"))
	var x: float = FIELD_HALF_W + TRAIN_FENCE_OUT + 2.2
	var h: float = 16.0 if n >= 4 else 11.0
	var spots: Array = [Vector3(- x, 0.0, - TRAIN_FENCE_OUT + 2.0),
		Vector3(- x, 0.0, FIELD_DEPTH + TRAIN_FENCE_OUT - 2.0),
		Vector3(x, 0.0, - TRAIN_FENCE_OUT + 2.0),
		Vector3(x, 0.0, FIELD_DEPTH + TRAIN_FENCE_OUT - 2.0)]
	for i in mini(n, spots.size()):
		var at: Vector3 = spots[i]
		_city_mesh(at + Vector3(0.0, h * 0.5, 0.0),
			_box(Vector3(0.42, h, 0.42)), mat)

		_city_mesh(at + Vector3(signf(- at.x) * 0.9, h + 0.6, 0.0),
			_box(Vector3(3.2, 1.1, 1.6)), lamp)

















func _train_elite(cfg: Dictionary) -> void:
	var kit: Dictionary = _host_kit_now()
	var club: Color = kit.get("kit", Color("2b3340"))
	_train_ball_machines()
	_train_wall_rig()
	_train_carts(club)
	_train_tactics_screen(cfg)
	_train_bench_kit(club)
	_train_gear(club)







func _train_yard(cfg: Dictionary) -> void:
	var metal: StandardMaterial3D = _train_solid(Color("8d97a0"))
	var wood: StandardMaterial3D = _train_solid(Color("8a6a45"))
	var dark: StandardMaterial3D = _train_solid(Color("3b4148"))



	var mesh_mat: StandardMaterial3D = StandardMaterial3D.new()
	mesh_mat.albedo_color = Color(0.13, 0.17, 0.14, 0.28)
	mesh_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mesh_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mesh_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var net_h: float = 9.0
	for zz in [- TRAIN_FENCE_OUT + 1.6, FIELD_DEPTH + TRAIN_FENCE_OUT - 1.6]:
		for i in 5:
			var px: float = -24.0 + float(i) * 12.0
			var mast: CylinderMesh = CylinderMesh.new()
			mast.top_radius = 0.1
			mast.bottom_radius = 0.16
			mast.height = net_h
			mast.radial_segments = 6
			_city_mesh(Vector3(px, net_h * 0.5, zz), mast, metal)
		var panel: MeshInstance3D = MeshInstance3D.new()
		var qm: QuadMesh = QuadMesh.new()
		qm.size = Vector2(48.0, net_h - 0.6)
		panel.mesh = qm
		panel.material_override = mesh_mat
		panel.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		panel.position = Vector3(0.0, net_h * 0.5 + 0.3, zz)
		add_child(panel)

	for i2 in 3:
		var bz: float = FIELD_DEPTH * 0.34 + float(i2) * 14.0
		var bx: float = FIELD_HALF_W + 5.6
		for sx in [-1.0, 1.0]:
			_city_mesh(Vector3(bx + sx * 0.6, 0.22, bz),
				_box(Vector3(0.5, 0.44, 0.12)), dark)
		_city_mesh(Vector3(bx, 0.46, bz), _box(Vector3(1.5, 0.1, 1.7)), wood)
		_city_mesh(Vector3(bx + 0.6, 0.85, bz), _box(Vector3(0.12, 0.7, 1.7)), wood)
		if i2 < 2:
			var bin_mesh: CylinderMesh = CylinderMesh.new()
			bin_mesh.top_radius = 0.28
			bin_mesh.bottom_radius = 0.22
			bin_mesh.height = 0.8
			bin_mesh.radial_segments = 8
			_city_mesh(Vector3(bx + 0.2, 0.4, bz + 2.2), bin_mesh, dark)



	var head_mat: StandardMaterial3D = _train_solid(Color("2f3a33"))
	var cap: CylinderMesh = CylinderMesh.new()
	cap.top_radius = 0.13
	cap.bottom_radius = 0.13
	cap.height = 0.06
	cap.radial_segments = 8
	for i3 in 8:
		var sz: float = 6.0 + float(i3) * 13.0
		for sx2 in [-1.0, 1.0]:
			_city_mesh(Vector3(sx2 *(FIELD_HALF_W + 1.4), 0.03, sz), cap, head_mat)






func _train_gear(club: Color) -> void:
	var metal: StandardMaterial3D = _train_solid(Color("b8bcc2"))
	var dark: StandardMaterial3D = _train_solid(Color("2b3036"))
	var cone: StandardMaterial3D = _train_solid(Color("d96b2c"))
	var body: StandardMaterial3D = _train_solid(club)

	var bar: StandardMaterial3D = _train_solid(Color("e0d24a"))
	for i in 6:
		var at: Vector3 = Vector3(TRAIN_STATION_X - 1.4, 0.0, 58.0 + float(i) * 1.6)
		for sx in [-1.0, 1.0]:
			_city_mesh(at + Vector3(sx * 0.55, 0.25, 0.0),
				_box(Vector3(0.08, 0.5, 0.08)), metal)
			_city_mesh(at + Vector3(sx * 0.55, 0.03, 0.0),
				_box(Vector3(0.12, 0.06, 0.5)), metal)
		_city_mesh(at + Vector3(0.0, 0.48, 0.0), _box(Vector3(1.2, 0.07, 0.07)), bar)


	for i2 in 2:
		var sx3: float = - TRAIN_STATION_X + 1.2 + float(i2) * 0.9
		for k in 7:
			var stack: CylinderMesh = CylinderMesh.new()
			stack.top_radius = 0.03
			stack.bottom_radius = 0.2
			stack.height = 0.36
			stack.radial_segments = 7
			_city_mesh(Vector3(sx3, 0.1 + float(k) * 0.075, 48.0 + float(i2) * 1.1),
				stack, cone)


	var t: Vector3 = Vector3(-(FIELD_HALF_W + 2.2), 0.0, FIELD_DEPTH * 0.5 + 8.0)
	_city_mesh(t + Vector3(0.0, 0.62, 0.0), _box(Vector3(1.15, 0.5, 2.1)), body)
	_city_mesh(t + Vector3(0.0, 0.95, -0.75), _box(Vector3(1.0, 0.5, 0.7)), body)
	_city_mesh(t + Vector3(0.0, 1.0, 0.55), _box(Vector3(0.85, 0.12, 0.6)), dark)
	_city_mesh(t + Vector3(0.0, 1.42, 0.75), _box(Vector3(0.8, 0.75, 0.12)), dark)
	_city_mesh(t + Vector3(0.0, 1.15, 0.05), _box(Vector3(0.5, 0.06, 0.5)), dark)
	_city_mesh(t + Vector3(0.0, 0.3, -1.35), _box(Vector3(1.3, 0.3, 0.9)), metal)
	var wheel_b: CylinderMesh = CylinderMesh.new()
	wheel_b.top_radius = 0.42
	wheel_b.bottom_radius = 0.42
	wheel_b.height = 0.3
	wheel_b.radial_segments = 10
	var wheel_s: CylinderMesh = CylinderMesh.new()
	wheel_s.top_radius = 0.26
	wheel_s.bottom_radius = 0.26
	wheel_s.height = 0.24
	wheel_s.radial_segments = 10
	for sx4 in [-1.0, 1.0]:
		var wb: MeshInstance3D = _city_mesh(t + Vector3(sx4 * 0.62, 0.42, 0.75),
			wheel_b, dark)
		wb.rotation_degrees = Vector3(0.0, 0.0, 90.0)
		var ws: MeshInstance3D = _city_mesh(t + Vector3(sx4 * 0.55, 0.26, -0.9),
			wheel_s, dark)
		ws.rotation_degrees = Vector3(0.0, 0.0, 90.0)





func _train_ball_machines() -> void:
	var shell: StandardMaterial3D = _train_solid(Color("b8bcc2"))
	var dark: StandardMaterial3D = _train_solid(Color("32383f"))
	var ball: StandardMaterial3D = _train_solid(Color("f0f0ec"))
	for i in 2:
		var at: Vector3 = Vector3(TRAIN_STATION_X, 0.0, 9.0 + float(i) * 7.0)

		_city_mesh(at + Vector3(0.0, 0.62, 0.0),
			_box(Vector3(1.15, 0.75, 0.95)), shell)
		for sz in [-1.0, 1.0]:
			_city_mesh(at + Vector3(0.0, 0.25, sz * 0.5),
				_box(Vector3(0.5, 0.5, 0.14)), dark)


		var tube: MeshInstance3D = _city_mesh(at + Vector3(-0.75, 1.15, 0.0),
			_box(Vector3(1.3, 0.42, 0.42)), dark)
		tube.rotation_degrees = Vector3(0.0, 0.0, 22.0)

		_city_mesh(at + Vector3(0.15, 1.35, 0.0),
			_box(Vector3(0.95, 0.5, 0.9)), shell)
		var sphere: SphereMesh = SphereMesh.new()
		sphere.radius = 0.16
		sphere.height = 0.32
		sphere.radial_segments = 8
		sphere.rings = 4
		for b in 3:
			_city_mesh(at + Vector3(0.15 + float(b % 2) * 0.28, 1.68,
				-0.24 + float(b) * 0.24), sphere, ball)

		_city_mesh(at + Vector3(0.6, 0.28, 1.5),
			_box(Vector3(1.1, 0.55, 1.1)), _train_mat(Color("6d7480")))
		for b2 in 4:
			_city_mesh(at + Vector3(0.35 + float(b2 % 2) * 0.5, 0.66,
				1.25 + float(b2 / 2) * 0.5), sphere, ball)






func _train_wall_rig() -> void:
	var frame: StandardMaterial3D = _train_solid(Color("8d97a0"))
	var wheel: StandardMaterial3D = _train_solid(Color("2b3036"))
	var body: StandardMaterial3D = _train_solid(Color("d4552f"))
	var head: StandardMaterial3D = _train_solid(Color("caa87e"))
	var at: Vector3 = Vector3(- TRAIN_STATION_X, 0.0, 15.0)

	_city_mesh(at + Vector3(0.0, 0.22, 0.0), _box(Vector3(0.7, 0.22, 5.0)), frame)
	for i in 4:
		_city_mesh(at + Vector3(0.0, 0.11, -2.1 + float(i) * 1.4),
			_box(Vector3(0.85, 0.22, 0.18)), wheel)
	var rig_torso: CylinderMesh = CylinderMesh.new()
	rig_torso.top_radius = 0.19
	rig_torso.bottom_radius = 0.23
	rig_torso.height = 1.75
	rig_torso.radial_segments = 8
	var rig_head: SphereMesh = SphereMesh.new()
	rig_head.radius = 0.16
	rig_head.height = 0.32
	rig_head.radial_segments = 8
	rig_head.rings = 4
	for i in 5:
		var z: float = -2.0 + float(i)
		_city_mesh(at + Vector3(0.0, 1.25, z), rig_torso, body)
		_city_mesh(at + Vector3(0.0, 2.28, z), rig_head, head)

	_city_mesh(at + Vector3(0.0, 1.0, 2.9), _box(Vector3(0.12, 1.6, 0.12)), frame)
	_city_mesh(at + Vector3(0.0, 1.75, 3.15), _box(Vector3(0.7, 0.12, 0.6)), frame)





func _train_carts(club: Color) -> void:
	var body: StandardMaterial3D = _train_solid(club)
	var roof: StandardMaterial3D = _train_solid(Color("e8e6df"))
	var dark: StandardMaterial3D = _train_solid(Color("2b3036"))
	for i in 2:
		var at: Vector3 = Vector3(-(FIELD_HALF_W + 1.6), 0.0,
			FIELD_DEPTH * 0.5 - 26.0 + float(i) * 4.2)
		_city_mesh(at + Vector3(0.0, 0.75, 0.0), _box(Vector3(1.5, 0.6, 2.8)), body)

		_city_mesh(at + Vector3(0.0, 1.35, 0.55), _box(Vector3(1.4, 0.8, 0.16)), body)
		for sx in [-1.0, 1.0]:
			for sz in [-1.0, 1.0]:
				_city_mesh(at + Vector3(sx * 0.65, 1.5, sz * 1.2),
					_box(Vector3(0.1, 1.5, 0.1)), dark)
		_city_mesh(at + Vector3(0.0, 2.3, 0.0), _box(Vector3(1.7, 0.12, 3.0)), roof)
		for sx2 in [-1.0, 1.0]:
			for sz2 in [-1.0, 1.0]:
				_city_mesh(at + Vector3(sx2 * 0.78, 0.3, sz2 * 1.0),
					_box(Vector3(0.14, 0.6, 0.6)), dark)










const TRAIN_SCREEN_W: float = 10.0
const TRAIN_SCREEN_PX: int = 192

func _train_tactics_screen(cfg: Dictionary) -> void:
	var kit: Dictionary = _host_kit_now()
	var club: Color = kit.get("kit", Color("2b3340"))

	var w: int = TRAIN_SCREEN_PX
	var h: int = int(float(TRAIN_SCREEN_PX) * 0.56)
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color("13351f"))
	var cal: Color = Color("cfe3d2")
	for xx in w:
		for yy in [2, 3, h - 4, h - 3]:
			img.set_pixel(xx, yy, cal)
		img.set_pixel(xx, h / 2, cal)
	for yy2 in h:
		for xx2 in [2, 3, w - 4, w - 3]:
			img.set_pixel(xx2, yy2, cal)

	var cx: int = w / 2
	var cy: int = h / 2
	for a in 72:
		var ang: float = TAU * float(a) / 72.0
		img.set_pixel(cx + int(cos(ang) * 16.0), cy + int(sin(ang) * 16.0), cal)

	var spots: Array = [Vector2(0.1, 0.5), Vector2(0.24, 0.18),
		Vector2(0.24, 0.4), Vector2(0.24, 0.6), Vector2(0.24, 0.82),
		Vector2(0.42, 0.3), Vector2(0.42, 0.5), Vector2(0.42, 0.7),
		Vector2(0.62, 0.2), Vector2(0.62, 0.5), Vector2(0.62, 0.8)]
	for sp in spots:
		var px: int = int(float(w) * float(sp.x))
		var py: int = int(float(h) * float(sp.y))
		for dx in range(-3, 4):
			for dy in range(-3, 4):
				if dx * dx + dy * dy <= 9:
					img.set_pixel(clampi(px + dx, 0, w - 1),
						clampi(py + dy, 0, h - 1), club)

	var mark: Color = Color("e8d24a")
	for i in 34:
		var t: float = float(i) / 33.0
		var ax: int = int(float(w) *(0.62 + t * 0.26))
		var ay: int = int(float(h) *(0.2 + t * 0.12))
		img.set_pixel(clampi(ax, 0, w - 1), clampi(ay, 0, h - 1), mark)
		img.set_pixel(clampi(ax, 0, w - 1), clampi(ay + 1, 0, h - 1), mark)
		var bx: int = int(float(w) *(0.42 + t * 0.3))
		var by: int = int(float(h) *(0.5 - t * 0.22))
		img.set_pixel(clampi(bx, 0, w - 1), clampi(by, 0, h - 1), mark)
		img.set_pixel(clampi(bx, 0, w - 1), clampi(by + 1, 0, h - 1), mark)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	var sw: float = TRAIN_SCREEN_W
	var sh: float = sw * float(h) / float(w)
	var x: float = FIELD_HALF_W + TRAIN_FENCE_OUT + 1.6
	var z: float = FIELD_DEPTH * 0.82
	var base_y: float = 3.2
	var frame: StandardMaterial3D = _train_mat(Color(cfg["fence"]).darkened(0.35))

	for sz in [-1.0, 1.0]:
		_city_mesh(Vector3(x + 0.34, base_y * 0.5, z + sz *(sw * 0.4)),
			_box(Vector3(0.35, base_y + sh * 0.5, 0.35)), frame)
	_city_mesh(Vector3(x + 0.3, base_y + sh * 0.5, z),
		_box(Vector3(0.5, sh + 0.6, sw + 0.6)), frame)
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(sw, sh)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	quad.material_override = mat
	quad.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	quad.position = Vector3(x + 0.02, base_y + sh * 0.5, z)


	quad.rotate_y(deg_to_rad(-90.0))
	add_child(quad)







func _train_bench_kit(club: Color) -> void:
	var post: StandardMaterial3D = _train_solid(Color("9aa0a4"))
	var canvas: StandardMaterial3D = _train_solid(club)
	var dark: StandardMaterial3D = _train_solid(Color("2f3740"))
	var white: StandardMaterial3D = _train_solid(Color("f0f0ec"))




	var tent: Vector3 = Vector3(-(FIELD_HALF_W + 3.4), 0.0, FIELD_DEPTH * 0.5 + 26.0)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_city_mesh(tent + Vector3(sx * 1.6, 1.25, sz * 2.6),
				_box(Vector3(0.12, 2.5, 0.12)), post)
	_city_mesh(tent + Vector3(0.0, 2.62, 0.0), _box(Vector3(4.0, 0.24, 6.4)), canvas)

	_city_mesh(tent + Vector3(0.0, 0.75, -1.6), _box(Vector3(1.1, 0.1, 2.2)), white)
	_city_mesh(tent + Vector3(0.0, 0.62, 1.8), _box(Vector3(1.4, 0.14, 2.6)), dark)

	for i in 2:
		_city_mesh(tent + Vector3(1.9, 0.45, -2.4 + float(i) * 1.1),
			_box(Vector3(0.7, 0.9, 0.8)), white)
		_city_mesh(tent + Vector3(1.9, 0.94, -2.4 + float(i) * 1.1),
			_box(Vector3(0.78, 0.12, 0.88)), canvas)

	var sphere: SphereMesh = SphereMesh.new()
	sphere.radius = 0.16
	sphere.height = 0.32
	sphere.radial_segments = 8
	sphere.rings = 4
	for i2 in 6:
		_city_mesh(Vector3(- TRAIN_STATION_X + 1.6, 0.16,
			20.0 + float(i2) * 0.8), sphere, white)

	for i3 in 2:
		var mz: float = FIELD_DEPTH + 3.2
		var mx: float = -8.0 + float(i3) * 16.0
		for sx2 in [-1.0, 1.0]:
			_city_mesh(Vector3(mx + sx2 * 1.5, 0.55, mz),
				_box(Vector3(0.12, 1.1, 0.12)), white)
		_city_mesh(Vector3(mx, 1.1, mz), _box(Vector3(3.12, 0.12, 0.12)), white)
		_city_mesh(Vector3(mx, 0.55, mz + 0.6),
			_box(Vector3(3.0, 1.1, 0.06)), _train_mat(Color(1, 1, 1, 0.35)))







func _train_stations(cfg: Dictionary) -> void:

	var cone: StandardMaterial3D = _train_solid(Color("d96b2c"))



	var cone_mesh: CylinderMesh = CylinderMesh.new()
	cone_mesh.top_radius = 0.02
	cone_mesh.bottom_radius = 0.2
	cone_mesh.height = 0.36
	cone_mesh.radial_segments = 7
	for i in 8:
		var z: float = FIELD_DEPTH * 0.28 + float(i) * 2.2
		_city_mesh(Vector3(- TRAIN_STATION_X, 0.2, z), cone_mesh, cone)
		_city_mesh(Vector3(- TRAIN_STATION_X, 0.03, z),
			_box(Vector3(0.46, 0.06, 0.46)), cone)
	if not bool(cfg["stations"]):
		return

	var dummy: StandardMaterial3D = _train_solid(Color("caa87e"))
	var dummy_base: StandardMaterial3D = _train_solid(Color("3b4148"))
	var head: SphereMesh = SphereMesh.new()
	head.radius = 0.15
	head.height = 0.3
	head.radial_segments = 8
	head.rings = 4
	var torso: CylinderMesh = CylinderMesh.new()
	torso.top_radius = 0.15
	torso.bottom_radius = 0.19
	torso.height = 1.7
	torso.radial_segments = 8
	for i in 4:
		var x: float = TRAIN_STATION_X + float(i) * 0.9
		_city_mesh(Vector3(x, 0.95, FIELD_DEPTH * 0.34), torso, dummy)
		_city_mesh(Vector3(x, 1.9, FIELD_DEPTH * 0.34), head, dummy)
		_city_mesh(Vector3(x, 0.07, FIELD_DEPTH * 0.34),
			_box(Vector3(0.62, 0.14, 0.62)), dummy_base)


	var lad: StandardMaterial3D = _train_mat(Color("e0d24a"))
	for i in 10:
		_city_mesh(Vector3(TRAIN_STATION_X, 0.03,
			FIELD_DEPTH * 0.52 + float(i) * 0.5),
			_box(Vector3(0.9, 0.06, 0.08)), lad)

	var ring: StandardMaterial3D = _train_mat(Color("d9542c"))
	var post: StandardMaterial3D = _train_mat(Color("8d97a0"))
	var az: float = FIELD_DEPTH * 0.72
	for sx in [-1.0, 1.0]:
		_city_mesh(Vector3(- TRAIN_STATION_X + sx * 2.2, 1.3, az),
			_box(Vector3(0.14, 2.6, 0.14)), post)
	_city_mesh(Vector3(- TRAIN_STATION_X, 2.6, az),
		_box(Vector3(4.6, 0.14, 0.14)), post)
	for i in 3:
		var rx: float = - TRAIN_STATION_X - 1.5 + float(i) * 1.5
		var torus: TorusMesh = TorusMesh.new()
		torus.inner_radius = 0.32
		torus.outer_radius = 0.4
		var m: MeshInstance3D = _city_mesh(Vector3(rx, 1.95, az), torus, ring)
		m.rotation_degrees = Vector3(90.0, 0.0, 0.0)

















var _sw_n: int = -1
var _sw_mmi: Array[MultiMeshInstance3D] = []
var _sw_ri: PackedInt32Array = PackedInt32Array()
var _sw_pos: PackedVector3Array = PackedVector3Array()
var _sw_x0: PackedFloat64Array = PackedFloat64Array()
var _sw_raices: Array[Node3D] = []
var _sw_bases: Array[Basis] = []
var _sw_inv: Array[Basis] = []
var _sw_quieto: bool = false
var _sw_foco: Vector3 = Vector3.INF




func _sway_suelta() -> void:
	_sw_n = -1
	_sw_quieto = false


func _sway_cachea() -> void:
	_sw_mmi.clear()
	_sw_ri.clear()
	_sw_pos.clear()
	_sw_x0.clear()
	_sw_raices.clear()
	_sw_bases.clear()
	_sw_inv.clear()
	var de_raiz: Dictionary = {}
	for b in _fan_buckets:
		var mmi: MultiMeshInstance3D = b["mmi"]
		if not mmi.tree_entered.is_connected(_sway_suelta):
			mmi.tree_entered.connect(_sway_suelta)
			mmi.tree_exited.connect(_sway_suelta)
		var root: Node3D = mmi.get_parent() as Node3D
		var ri: int = -1
		if root != null:
			ri = int(de_raiz.get(root, -1))
			if ri < 0:
				ri = _sw_raices.size()
				de_raiz[root] = ri
				var bas: Basis = root.global_transform.basis
				_sw_raices.append(root)
				_sw_bases.append(bas)
				_sw_inv.append(bas.inverse())
		_sw_mmi.append(mmi)
		_sw_ri.append(ri)
		_sw_pos.append(b["pos"])
		_sw_x0.append(float(b["sway_x0"]))
	_sw_n = _fan_buckets.size()
	_sw_quieto = false
