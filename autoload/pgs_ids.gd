extends RefCounted


















const TABLEROS: Dictionary = {
	"fl.lb.legado": "CgkI6KLq0N8QEAIQWw",
	"fl.lb.goles": "CgkI6KLq0N8QEAIQXA",
	"fl.lb.asistencias": "CgkI6KLq0N8QEAIQXQ",
	"fl.lb.contribuciones": "CgkI6KLq0N8QEAIQXg",
	"fl.lb.trofeos_ind": "CgkI6KLq0N8QEAIQXw",
	"fl.lb.trofeos_equipo": "CgkI6KLq0N8QEAIQYA",
	"fl.lb.trofeos_total": "CgkI6KLq0N8QEAIQYQ",
	"fl.lb.fortuna": "CgkI6KLq0N8QEAIQYg",
}

const GAME_ID: String = "575426695528"

const LOGROS: Dictionary = {
	"album_continente": "CgkI6KLq0N8QEAIQAA",
	"amo_de_europa": "CgkI6KLq0N8QEAIQAQ",
	"ascenso": "CgkI6KLq0N8QEAIQAg",
	"asist_seleccion": "CgkI6KLq0N8QEAIQAw",
	"asist_x3": "CgkI6KLq0N8QEAIQBA",
	"balon_de_oro": "CgkI6KLq0N8QEAIQBQ",
	"bota_champions": "CgkI6KLq0N8QEAIQBg",
	"bota_doble": "CgkI6KLq0N8QEAIQBw",
	"bota_mundial": "CgkI6KLq0N8QEAIQCA",
	"campeon_del_mundo": "CgkI6KLq0N8QEAIQCQ",
	"campeon_primera": "CgkI6KLq0N8QEAIQCg",
	"cerebro_100": "CgkI6KLq0N8QEAIQCw",
	"champions": "CgkI6KLq0N8QEAIQDA",
	"circulo_completo": "CgkI6KLq0N8QEAIQDQ",
	"clase_mundial": "CgkI6KLq0N8QEAIQDg",
	"coleccionista": "CgkI6KLq0N8QEAIQDw",
	"conference": "CgkI6KLq0N8QEAIQEA",
	"conquistador": "CgkI6KLq0N8QEAIQEQ",
	"copa_continental": "CgkI6KLq0N8QEAIQEg",
	"copa_nacional": "CgkI6KLq0N8QEAIQEw",
	"corner_gol": "CgkI6KLq0N8QEAIQFA",
	"de_la_nada": "CgkI6KLq0N8QEAIQFQ",
	"dinastia": "CgkI6KLq0N8QEAIQFg",
	"doblete": "CgkI6KLq0N8QEAIQFw",
	"doblete_liga": "CgkI6KLq0N8QEAIQGA",
	"el_diez": "CgkI6KLq0N8QEAIQGQ",
	"europa_league": "CgkI6KLq0N8QEAIQGg",
	"gol_continental": "CgkI6KLq0N8QEAIQGw",
	"gol_mundial": "CgkI6KLq0N8QEAIQHA",
	"gol_seleccion": "CgkI6KLq0N8QEAIQHQ",
	"goleador_10": "CgkI6KLq0N8QEAIQHg",
	"goleador_100": "CgkI6KLq0N8QEAIQHw",
	"goleador_250": "CgkI6KLq0N8QEAIQIA",
	"goleador_50": "CgkI6KLq0N8QEAIQIQ",
	"goleador_500": "CgkI6KLq0N8QEAIQIg",
	"hasta_el_final": "CgkI6KLq0N8QEAIQIw",
	"inmortal": "CgkI6KLq0N8QEAIQJA",
	"jugador_mes": "CgkI6KLq0N8QEAIQJQ",
	"jugador_partido": "CgkI6KLq0N8QEAIQJg",
	"leal_corazon": "CgkI6KLq0N8QEAIQJw",
	"leyenda": "CgkI6KLq0N8QEAIQKA",
	"leyenda_club": "CgkI6KLq0N8QEAIQKQ",
	"manita": "CgkI6KLq0N8QEAIQKg",
	"max_asist_liga": "CgkI6KLq0N8QEAIQKw",
	"max_asist_ucl": "CgkI6KLq0N8QEAIQLA",
	"mejor_historia": "CgkI6KLq0N8QEAIQLQ",
	"mi_unico_amor": "CgkI6KLq0N8QEAIQLg",
	"mundial_clubes": "CgkI6KLq0N8QEAIQLw",
	"nueve_de_grande": "CgkI6KLq0N8QEAIQMQ",
	"oro_precoz": "CgkI6KLq0N8QEAIQMA",
	"ovr_diamante": "CgkI6KLq0N8QEAIQMg",
	"ovr_oro": "CgkI6KLq0N8QEAIQMw",
	"ovr_plata": "CgkI6KLq0N8QEAIQNA",
	"partido_perfecto": "CgkI6KLq0N8QEAIQNQ",
	"penal_gol": "CgkI6KLq0N8QEAIQNg",
	"penal_maestro": "CgkI6KLq0N8QEAIQNw",
	"pichichi_2_paises": "CgkI6KLq0N8QEAIQOA",
	"pichichi_3_paises": "CgkI6KLq0N8QEAIQOQ",
	"pichichi_liga": "CgkI6KLq0N8QEAIQOg",
	"pichichi_x3": "CgkI6KLq0N8QEAIQOw",
	"pichichi_x5": "CgkI6KLq0N8QEAIQPA",
	"poker": "CgkI6KLq0N8QEAIQPQ",
	"presentacion_10k": "CgkI6KLq0N8QEAIQPg",
	"presentacion_65k": "CgkI6KLq0N8QEAIQPw",
	"presentacion_90k": "CgkI6KLq0N8QEAIQQA",
	"presentacion_llena": "CgkI6KLq0N8QEAIQQQ",
	"presentacion_llena_x3": "CgkI6KLq0N8QEAIQQg",
	"presentado": "CgkI6KLq0N8QEAIQQw",
	"primer_gol": "CgkI6KLq0N8QEAIQRA",
	"primer_hat_trick": "CgkI6KLq0N8QEAIQRQ",
	"primer_titulo_liga": "CgkI6KLq0N8QEAIQRg",
	"primera_asistencia": "CgkI6KLq0N8QEAIQRw",
	"salir_a_tiempo": "CgkI6KLq0N8QEAIQSA",
	"temporada_div1": "CgkI6KLq0N8QEAIQSQ",
	"temporada_div2": "CgkI6KLq0N8QEAIQSg",
	"temporada_div3": "CgkI6KLq0N8QEAIQSw",
	"tiro_libre": "CgkI6KLq0N8QEAIQTA",
	"tiro_libre_10": "CgkI6KLq0N8QEAIQTQ",
	"triple_balon_oro": "CgkI6KLq0N8QEAIQTg",
	"triplete": "CgkI6KLq0N8QEAIQTw",
	"trotamundos": "CgkI6KLq0N8QEAIQUA",
	"ultimo_baile": "CgkI6KLq0N8QEAIQUQ",
	"un_lustro": "CgkI6KLq0N8QEAIQUg",
	"un_solo_amor": "CgkI6KLq0N8QEAIQUw",
	"una_decada": "CgkI6KLq0N8QEAIQVA",
	"veterano_100": "CgkI6KLq0N8QEAIQVQ",
	"veterano_300": "CgkI6KLq0N8QEAIQVg",
	"vitrina_completa": "CgkI6KLq0N8QEAIQVw",
	"vuelta_al_mundo": "CgkI6KLq0N8QEAIQWA",
	"vuelve_donde_fue_feliz": "CgkI6KLq0N8QEAIQWQ",
}
