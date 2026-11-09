extends Node


























signal unlocked(id: String)

const SAVE_PATH: String = "user://achievements.cfg"



const SaveSlotsScript = preload("res://autoload/save_slots.gd")


const TIER_LEYENDA: int = 4
const TIER_INMORTAL: int = 5



const RARE_COMMON: int = 1
const RARE_RARE: int = 2
const RARE_EPIC: int = 3
const RARE_LEGEND: int = 4


const CLUB_LEGEND_TOP: int = 5





const ELITE_MIN_RATING: int = 74
const ELITE_TOP_FRACTION: float = 1.0 / 3.0

























const BEATABLE_COUNTRIES: Array[String] = [
	"España", "Inglaterra", "Italia", "Alemania", "Francia", "Portugal",
	"Países Bajos", "Bélgica", "Turquía", "Argentina", "Brasil", "México",
	"Estados Unidos", "Arabia Saudí",

	"Escocia", "Grecia", "Ucrania", "Austria", "Suiza", "Chequia", "Croacia", "Serbia",
	"Dinamarca", "Noruega", "Japón", "Corea del Sur", "Colombia", "Chile", "Uruguay", "Egipto",



	"Paraguay", "Ecuador", "Perú", "Bolivia", "Venezuela",




	"Marruecos", "Túnez",





	"Nueva Zelanda",




	"Suecia", "Rumanía",




	"Bosnia y Herzegovina",
]



const TOP5_LEAGUES: Array[String] = ["España", "Inglaterra", "Italia", "Alemania", "Francia"]





const COLLECTOR_TROPHIES: Array[String] = [
	"Campeón de Liga", "Campeón de Copa", "Campeón de Champions",
	"Campeón del Mundo de Clubes", "Campeón continental", "Campeón del Mundo",
]





const CATALOG: Array[Dictionary] = [

	{"id": "primer_gol", "name": "Primer Gol", "desc": "Marcar tu primer gol.", "kind": "goals", "n": 1, "rare": RARE_COMMON},
	{"id": "goleador_10", "name": "Goleador", "desc": "10 goles en tu carrera.", "kind": "goals", "n": 10, "rare": RARE_COMMON},
	{"id": "goleador_50", "name": "Artillero", "desc": "50 goles en tu carrera.", "kind": "goals", "n": 50, "rare": RARE_RARE},
	{"id": "goleador_100", "name": "Centenario", "desc": "100 goles en tu carrera.", "kind": "goals", "n": 100, "rare": RARE_RARE},
	{"id": "goleador_250", "name": "Killer", "desc": "250 goles en tu carrera.", "kind": "goals", "n": 250, "rare": RARE_EPIC},
	{"id": "goleador_500", "name": "Máquina de Goles", "desc": "500 goles en tu carrera.", "kind": "goals", "n": 500, "rare": RARE_LEGEND},




	{"id": "goleador_1000", "name": "Mil Goles", "desc": "1.000 goles en tu carrera.", "kind": "goals", "n": 1000, "rare": RARE_LEGEND},

	{"id": "primera_asistencia", "name": "Asistente", "desc": "Dar tu primera asistencia.", "kind": "assists", "n": 1, "rare": RARE_COMMON},
	{"id": "cerebro_100", "name": "Cerebro", "desc": "100 asistencias en tu carrera.", "kind": "assists", "n": 100, "rare": RARE_EPIC},





	{"id": "tres_pases_tres_goles", "name": "Tres Pases, Tres Goles", "desc": "Darle tres asistencias al mismo compañero en un partido.", "kind": "socio_hat_tricks", "n": 1, "rare": RARE_LEGEND},
	{"id": "un_balon_cada_uno", "name": "Un Balón Cada Uno", "desc": "Hacer hat-trick en el partido en que le das tres asistencias al mismo compañero.", "kind": "socio_double_hat_tricks", "n": 1, "rare": RARE_LEGEND},

	{"id": "doblete", "name": "Doblete", "desc": "2 goles en un mismo partido.", "kind": "best_match_goals", "n": 2, "rare": RARE_COMMON},
	{"id": "primer_hat_trick", "name": "Hat-Trick", "desc": "3 goles en un mismo partido.", "kind": "best_match_goals", "n": 3, "rare": RARE_RARE},



	{"id": "poker", "name": "Cuatro Goles", "desc": "4 goles en un mismo partido.", "kind": "best_match_goals", "n": 4, "rare": RARE_EPIC},
	{"id": "manita", "name": "Manita", "desc": "5 goles en un mismo partido.", "kind": "best_match_goals", "n": 5, "rare": RARE_LEGEND},




	{"id": "hat_trick_final", "name": "Hat-Trick en la Final", "desc": "3 goles en una final.", "kind": "best_final_goals", "n": 3, "rare": RARE_EPIC},







	{"id": "gol_cabeza", "name": "Testarazo", "desc": "Marcar de cabeza.", "kind": "header_goals", "n": 1, "rare": RARE_RARE},
	{"id": "gol_volea", "name": "Sin Dejarla Caer", "desc": "Marcar de volea.", "kind": "volley_goals", "n": 1, "rare": RARE_RARE},
	{"id": "gol_chilena", "name": "Chilena de Antología", "desc": "Marcar de chilena.", "kind": "bicycle_goals", "n": 1, "rare": RARE_EPIC},

	{"id": "penal_gol", "name": "Sangre Fría", "desc": "Marcar tu primer penalti.", "kind": "penalty_goals", "n": 1, "rare": RARE_COMMON},
	{"id": "penal_maestro", "name": "Especialista de Penales", "desc": "25 penaltis marcados.", "kind": "penalty_goals", "n": 25, "rare": RARE_EPIC},
	{"id": "tiro_libre", "name": "Maestro de la Falta", "desc": "Marcar de tiro libre directo.", "kind": "freekick_goals", "n": 1, "rare": RARE_RARE},



	{"id": "bajo_barrera", "name": "Por Debajo", "desc": "Marcar un tiro libre por debajo de la barrera.", "kind": "freekick_under_goals", "n": 1, "rare": RARE_EPIC},
	{"id": "tiro_libre_10", "name": "El Muro No Existe", "desc": "10 goles de tiro libre.", "kind": "freekick_goals", "n": 10, "rare": RARE_EPIC},
	{"id": "corner_gol", "name": "Jugada de Estrategia", "desc": "Marcar rematando un córner.", "kind": "corner_goals", "n": 1, "rare": RARE_RARE},











	{"id": "cesion_dada", "name": "Gloria Prestada", "desc": "Cederle un penal al compañero que iba por su hat-trick.", "kind": "cesion_dada", "n": 1, "rare": RARE_EPIC, "secret": true},


	{"id": "ahijado", "name": "El Ahijado", "desc": "Apadrinar a un niño de la cantera hasta el primer equipo.", "kind": "ahijado", "n": 1, "rare": RARE_LEGEND, "secret": true},
	{"id": "cesion_negada", "name": "Nadie Toca Mi Balón", "desc": "Quedarte el penal con un compañero pidiéndotelo para su hat-trick.", "kind": "cesion_negada", "n": 1, "rare": RARE_EPIC, "secret": true},




	{"id": "gol_olimpico", "name": "Gol Olímpico", "desc": "Marcar directo desde el córner, sin que nadie toque el balón.", "kind": "olympic_goals", "n": 1, "rare": RARE_LEGEND},











	{"id": "perro_cancha", "name": "Perro en la Cancha", "desc": "Que un perro se meta en la cancha durante un partido tuyo.", "kind": "dog_seen", "n": 1, "rare": RARE_LEGEND},






	{"id": "te_elijo", "name": "Te Elijo a Ti", "desc": "Ponerle a una mascota el nombre del ratón eléctrico más famoso.", "kind": "pet_pika", "n": 1, "rare": RARE_EPIC, "secret": true},
	{"id": "gol_panenka", "name": "Panenka", "desc": "Marcar un penal picado: cambiar a modo CENTRO antes de golpear.", "kind": "panenka_goals", "n": 1, "rare": RARE_EPIC},

	{"id": "primer_titulo_liga", "name": "Campeón", "desc": "Ganar tu primera liga.", "kind": "award", "award": "Campeón de Liga", "n": 1, "rare": RARE_RARE},
	{"id": "campeon_primera", "name": "Rey de Primera", "desc": "Campeón de la máxima categoría.", "kind": "top_league", "n": 1, "rare": RARE_EPIC},
	{"id": "ascenso", "name": "Ascenso", "desc": "Subir de categoría.", "kind": "award", "award": "Ascenso", "n": 1, "rare": RARE_COMMON},
	{"id": "campeon_campeones", "name": "Campeón de Campeones", "desc": "Ganar el Campeón de Campeones.", "kind": "award", "award": "Campeón de Campeones", "n": 1, "rare": RARE_RARE},
	{"id": "supercopa", "name": "Supercampeón", "desc": "Ganar la Supercopa de tu país.", "kind": "award", "award": "Campeón de Supercopa", "n": 1, "rare": RARE_RARE},
	{"id": "copaliga", "name": "Doble Copa", "desc": "Ganar la Copa de la Liga.", "kind": "award", "award": "Campeón de la Copa de la Liga", "n": 1, "rare": RARE_RARE},
	{"id": "copa_nacional", "name": "Copa en Vitrina", "desc": "Ganar la copa nacional.", "kind": "award", "award": "Campeón de Copa", "n": 1, "rare": RARE_RARE},
	{"id": "champions", "name": "Rey de Europa", "desc": "Ganar la Champions continental.", "kind": "award", "award": "Campeón de Champions", "n": 1, "rare": RARE_EPIC},

	{"id": "recopa", "name": "Campeón contra Campeón", "desc": "Ganar la Recopa del Sur.", "kind": "award", "award": "Campeón de la Recopa", "n": 1, "rare": RARE_RARE},
	{"id": "supereuropa", "name": "Supercampeón de Europa", "desc": "Ganar la Supercopa de Europa.", "kind": "award", "award": "Campeón de la Supercopa de Europa", "n": 1, "rare": RARE_RARE},
	{"id": "superafrica", "name": "Supercampeón de África", "desc": "Ganar la Supercopa de África.", "kind": "award", "award": "Campeón de la Supercopa de África", "n": 1, "rare": RARE_RARE},

	{"id": "ligas", "name": "Rey de las Dos Ligas", "desc": "Ganar la Copa de las Ligas.", "kind": "award", "award": "Campeón de la Copa de las Ligas", "n": 1, "rare": RARE_RARE},
	{"id": "intercontinental", "name": "Rey Intercontinental", "desc": "Ganar la Copa Intercontinental.", "kind": "award", "award": "Campeón Intercontinental", "n": 1, "rare": RARE_EPIC},
	{"id": "mundial_clubes", "name": "Campeón del Mundo de Clubes", "desc": "Ganar el Mundial de Clubes.", "kind": "award", "award": "Campeón del Mundo de Clubes", "n": 1, "rare": RARE_LEGEND},
	{"id": "gol_continental", "name": "Noche Europea", "desc": "Marcar en un partido continental.", "kind": "scored_cont", "n": 1, "rare": RARE_RARE},
	{"id": "vuelta_gol", "name": "De la Camilla al Gol", "desc": "Volver de una lesión grave y marcar en tu regreso.", "kind": "comeback_goal", "n": 1, "rare": RARE_RARE},

	{"id": "gol_seleccion", "name": "Orgullo Nacional", "desc": "Marcar con tu selección.", "kind": "nat_goals", "n": 1, "rare": RARE_RARE},
	{"id": "goleador_patria", "name": "Goleador de la Patria", "desc": "50 goles con tu selección.", "kind": "nat_goals", "n": 50, "rare": RARE_EPIC},
	{"id": "asist_seleccion", "name": "Asistencia Internacional", "desc": "Dar una asistencia con tu selección.", "kind": "nat_assists", "n": 1, "rare": RARE_RARE},




	{"id": "centenario_internacional", "name": "Centenario Internacional", "desc": "Jugar 100 partidos con tu selección.", "kind": "nat_caps", "n": 100, "rare": RARE_EPIC},
	{"id": "gol_mundial", "name": "Héroe Mundialista", "desc": "Marcar en el Mundial.", "kind": "scored_wc", "n": 1, "rare": RARE_EPIC},
	{"id": "copa_continental", "name": "Gloria Continental", "desc": "Ganar la Euro/Copa América con tu país.", "kind": "award", "award": "Campeón continental", "n": 1, "rare": RARE_EPIC},

	{"id": "finalissima", "name": "Dos Continentes", "desc": "Ganar la Finalísima con tu país.", "kind": "award", "award": "Campeón de la Finalísima", "n": 1, "rare": RARE_EPIC},
	{"id": "liga_naciones", "name": "Liga A", "desc": "Ganar la Liga de Naciones con tu país.", "kind": "award", "award": "Campeón de la Liga de Naciones", "n": 1, "rare": RARE_EPIC},
	{"id": "oro_olimpico", "name": "Oro Olímpico", "desc": "Ganar el oro en los Juegos Olímpicos.", "kind": "award", "award": "Campeón Olímpico", "n": 1, "rare": RARE_LEGEND},
	{"id": "campeon_del_mundo", "name": "Campeón del Mundo", "desc": "Ganar el Mundial con tu selección.", "kind": "award", "award": "Campeón del Mundo", "n": 1, "rare": RARE_LEGEND},
	{"id": "bicampeon_mundo", "name": "Bicampeón del Mundo", "desc": "Ganar 2 Mundiales con tu selección.", "kind": "award", "award": "Campeón del Mundo", "n": 2, "rare": RARE_LEGEND},

	{"id": "balon_de_oro", "name": "El Mejor del Mundo", "desc": "Ganar el Balón de Oro.", "kind": "balon", "n": 1, "rare": RARE_EPIC},
	{"id": "triple_balon_oro", "name": "Tríada Dorada", "desc": "3 Balones de Oro.", "kind": "balon", "n": 3, "rare": RARE_LEGEND},
	{"id": "era_dorada", "name": "Era Dorada", "desc": "5 Balones de Oro.", "kind": "balon", "n": 5, "rare": RARE_LEGEND},





	{"id": "el_que_te_lo_quito", "name": "El Que Te Lo Quitó", "desc": "Quedar segundo en el Balón de Oro, justo detrás del ganador.", "kind": "ballon_segundo", "n": 1, "rare": RARE_RARE},









	{"id": "ovr_plata", "name": "Nivel Plata", "desc": "Llegar a ser jugador de plata: media 65 en una carrera.", "kind": "skills_avg", "n": 65, "rare": RARE_RARE},
	{"id": "ovr_oro", "name": "Nivel Oro", "desc": "Llegar a ser jugador de oro: media 75 en una carrera.", "kind": "skills_avg", "n": 75, "rare": RARE_EPIC},
	{"id": "ovr_diamante", "name": "Nivel Diamante", "desc": "Llegar a ser jugador de diamante: media 85 en una carrera.", "kind": "skills_avg", "n": 85, "rare": RARE_LEGEND},
	{"id": "clase_mundial", "name": "Clase Mundial", "desc": "Media de habilidades de nivel élite (90).", "kind": "skills_avg", "n": 90, "rare": RARE_LEGEND},
	{"id": "partido_perfecto", "name": "Actuación Perfecta", "desc": "Un partido con nota 9.5 o más.", "kind": "best_rating", "n": 95, "rare": RARE_RARE},
	{"id": "mejor_historia", "name": "¿El Mejor de la Historia?", "desc": "Liga, copa, continental, Balón de Oro y goleo en una misma temporada.", "kind": "history_best", "n": 1, "rare": RARE_LEGEND},







	{"id": "ano_perfecto", "name": "El Año Perfecto", "desc": "En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de esa copa.", "kind": "perfect_season", "n": 1, "rare": RARE_LEGEND},

	{"id": "trotamundos", "name": "Trotamundos", "desc": "Ganar liga con 3 clubes distintos.", "kind": "distinct_league_clubs", "n": 3, "rare": RARE_EPIC},
	{"id": "conquistador", "name": "El Conquistador", "desc": "Ganar la 1ª división de las cinco grandes: España, Inglaterra, Italia, Alemania y Francia.", "kind": "top5_leagues", "n": 5, "rare": RARE_LEGEND},
	{"id": "vuelta_al_mundo", "name": "La Vuelta al Mundo", "desc": "Ganar la liga en 3 confederaciones distintas (Europa, América, Asia…).", "kind": "confeds", "n": 3, "rare": RARE_LEGEND},
	{"id": "un_solo_amor", "name": "Un Solo Amor", "desc": "5 títulos de liga con un mismo club.", "kind": "club_league_max", "n": 5, "rare": RARE_LEGEND},
	{"id": "mi_unico_amor", "name": "Mi Único Amor", "desc": "Diez temporadas o más en el mismo club sin fichar nunca por otro; una cesión no lo rompe.", "kind": "one_club_career", "n": 1, "rare": RARE_LEGEND},



	{"id": "el_diez", "name": "El Diez", "desc": "Llegar a llevar el 10 a la espalda.", "kind": "shirt_ten", "n": 1, "rare": RARE_RARE},
	{"id": "nueve_de_grande", "name": "El Nueve de un Grande", "desc": "Llevar el 9 en uno de los clubes más fuertes del mundo.", "kind": "shirt_nine_elite", "n": 1, "rare": RARE_EPIC},
	{"id": "vuelve_donde_fue_feliz", "name": "Uno Siempre Vuelve", "desc": "Volver a fichar por un club en el que ya hayas jugado antes.", "kind": "returned_club", "n": 1, "rare": RARE_RARE},
	{"id": "dinastia", "name": "Dinastía", "desc": "Ganar la liga 3 temporadas seguidas.", "kind": "league_streak", "n": 3, "rare": RARE_EPIC},
	{"id": "amo_de_europa", "name": "Amo de Europa", "desc": "Ganar la Champions con 3 clubes distintos.", "kind": "champions_clubs", "n": 3, "rare": RARE_EPIC},






	{"id": "mr_champions", "name": "Mr. Champions", "desc": "Ganar la Champions 5 veces en tu carrera.", "kind": "award", "award": "Campeón de Champions", "n": 5, "rare": RARE_LEGEND},
	{"id": "tri_champions", "name": "Tricampeón de Europa", "desc": "Ganar la Champions 3 temporadas seguidas.", "kind": "award_streak", "award": "Campeón de Champions", "n": 3, "rare": RARE_LEGEND},
	{"id": "coleccionista", "name": "Coleccionista de Títulos", "desc": "Ganar los seis grandes: liga, copa, tu gran copa continental, Mundial de Clubes, continental y Mundial.", "kind": "trophy_types", "n": 6, "rare": RARE_LEGEND},



	{"id": "oro_precoz", "name": "Oro Precoz", "desc": "Ganar el Balón de Oro antes de cumplir 19 años.", "kind": "balon_joven", "n": 1, "rare": RARE_LEGEND},
	{"id": "triplete", "name": "Triplete", "desc": "Liga, copa y tu gran copa continental en la misma temporada.", "kind": "triplete", "n": 1, "rare": RARE_LEGEND},





	{"id": "desde_q1", "name": "Desde la Primera Ronda", "desc": "Ganar una copa de Europa entrando por la primera ronda previa.", "kind": "desde_q1", "n": 1, "rare": RARE_EPIC},







	{"id": "sextete", "name": "Sextete", "desc": "Seis títulos con tu club en doce meses.", "kind": "sextete", "n": 1, "rare": RARE_LEGEND},
	{"id": "ultimo_baile", "name": "Último Baile", "desc": "Levantar un título en tu temporada de retiro.", "kind": "ultimo_baile", "n": 1, "rare": RARE_EPIC},
	{"id": "de_la_nada", "name": "De la Nada", "desc": "Debutar en Tercera y ganar la liga de Primera en la misma carrera.", "kind": "de_la_nada", "n": 1, "rare": RARE_LEGEND},
	{"id": "album_continente", "name": "Álbum de un Continente", "desc": "Completar en la VITRINA todas las ligas y copas de una confederación.", "kind": "album_confed", "n": 1, "rare": RARE_EPIC},
	{"id": "vitrina_completa", "name": "La Vitrina Completa", "desc": "Completar el álbum de la VITRINA al 100 %.", "kind": "album_total", "n": 1, "rare": RARE_LEGEND},
	{"id": "leal_corazon", "name": "Leal de Corazón", "desc": "500 partidos con un mismo club.", "kind": "club_matches", "n": 500, "rare": RARE_LEGEND},
	{"id": "circulo_completo", "name": "Círculo Completo", "desc": "Retirarte en el club donde empezaste.", "kind": "circle", "n": 1, "rare": RARE_RARE},



	{"id": "hasta_el_final", "name": "Hasta el Final", "desc": "Jugar hasta el final: que el calendario te retire a ti.", "kind": "retire_age", "n": 1, "rare": RARE_LEGEND},
	{"id": "salir_a_tiempo", "name": "Salir a Tiempo", "desc": "Colgar las botas por decisión propia, antes de que te lo digan.", "kind": "retire_early", "n": 1, "rare": RARE_EPIC},
	{"id": "cuerpo_dijo_basta", "name": "El Cuerpo Dijo Basta", "desc": "Que una lesión grave de veterano te retire antes de tiempo.", "kind": "retire_injury", "n": 1, "rare": RARE_EPIC},

	{"id": "adios_internacional", "name": "Adiós Internacional", "desc": "Colgar la camiseta de tu país por decisión propia, sin dejar el club.", "kind": "nat_retire", "n": 1, "rare": RARE_RARE},







	{"id": "pieza_de_museo", "name": "Pieza de Museo", "desc": "Entrar por primera vez al museo de tu carrera.", "kind": "museo_visitas", "n": 1, "rare": RARE_RARE},



	{"id": "brazalete_del_pais", "name": "Brazalete del País", "desc": "Llevar la cinta de capitán de tu selección.", "kind": "nat_captain", "n": 1, "rare": RARE_EPIC},
	{"id": "leyenda_club", "name": "Leyenda del Club", "desc": "Entrar al top 5 de leyendas de tu club.", "kind": "club_legend", "n": 1, "rare": RARE_LEGEND},






	{"id": "bandera_del_club", "name": "Bandera del Club", "desc": "Jugar 10 temporadas seguidas en un mismo club.", "kind": "club_streak", "n": 10, "rare": RARE_EPIC},






	{"id": "cara_a_cara", "name": "Cara a Cara", "desc": "Superar a tu primera leyenda de la historia (sólo cuenta lo hecho en 1ª división o con la selección).", "kind": "legends_passed", "n": 1, "rare": RARE_RARE},
	{"id": "entre_grandes", "name": "Entre los Grandes", "desc": "Dejar atrás a 5 leyendas.", "kind": "legends_passed", "n": 5, "rare": RARE_EPIC},
	{"id": "nombre_propio", "name": "Nombre Propio", "desc": "Dejar atrás a 15 leyendas.", "kind": "legends_passed", "n": 15, "rare": RARE_LEGEND},
	{"id": "por_encima_de_todos", "name": "Por Encima de Todos", "desc": "Dejar atrás a 30 leyendas de la historia.", "kind": "legends_passed", "n": 30, "rare": RARE_LEGEND},



	{"id": "mejor_de_la_historia", "name": "Mejor de la Historia", "desc": "Nadie en la historia hizo más goles + asistencias de élite que tú.", "kind": "award", "award": "Mejor Jugador de la Historia", "n": 1, "rare": RARE_LEGEND},




	{"id": "en_los_libros", "name": "En los Libros", "desc": "Batir tu primer récord histórico.", "kind": "records_broken", "n": 1, "rare": RARE_RARE},
	{"id": "hombre_de_records", "name": "Hombre de Récords", "desc": "Batir 10 récords históricos.", "kind": "records_broken", "n": 10, "rare": RARE_EPIC},

	{"id": "veterano_100", "name": "Veterano", "desc": "100 partidos disputados.", "kind": "matches", "n": 100, "rare": RARE_COMMON},
	{"id": "veterano_300", "name": "Inoxidable", "desc": "300 partidos disputados.", "kind": "matches", "n": 300, "rare": RARE_EPIC},
	{"id": "un_lustro", "name": "Un Lustro", "desc": "5 temporadas completadas.", "kind": "seasons", "n": 5, "rare": RARE_RARE},
	{"id": "una_decada", "name": "Una Década", "desc": "10 temporadas completadas.", "kind": "seasons", "n": 10, "rare": RARE_EPIC},
	{"id": "leyenda", "name": "Leyenda", "desc": "Alcanzar el escalón LEYENDA.", "kind": "tier", "n": TIER_LEYENDA, "rare": RARE_LEGEND},
	{"id": "inmortal", "name": "Inmortal", "desc": "Alcanzar el escalón INMORTAL.", "kind": "tier", "n": TIER_INMORTAL, "rare": RARE_LEGEND},


	{"id": "temporada_div3", "name": "Curtido en la Cantera", "desc": "Completar una temporada entera en Tercera División.", "kind": "season_div", "n": 3, "rare": RARE_COMMON},
	{"id": "temporada_div2", "name": "Veterano de Segunda", "desc": "Completar una temporada entera en Segunda División.", "kind": "season_div", "n": 2, "rare": RARE_RARE},
	{"id": "temporada_div1", "name": "Bautizo en Primera", "desc": "Completar una temporada entera en Primera División.", "kind": "season_div", "n": 1, "rare": RARE_RARE},

	{"id": "europa_league", "name": "Rey de Europa League", "desc": "Ganar la Europa League.", "kind": "award", "award": "Campeón de Europa League", "n": 1, "rare": RARE_EPIC},
	{"id": "conference", "name": "Rey de la Conference", "desc": "Ganar la Conference.", "kind": "award", "award": "Campeón de Conference", "n": 1, "rare": RARE_RARE},
	{"id": "pichichi_liga", "name": "Pichichi", "desc": "Ganar el Pichichi de la Liga.", "kind": "award", "award": "Pichichi de la Liga", "n": 1, "rare": RARE_EPIC},
	{"id": "bota_champions", "name": "Bota de la Champions", "desc": "Ser el máximo goleador de la Champions.", "kind": "award", "award": "Bota de la Champions", "n": 1, "rare": RARE_EPIC},
	{"id": "bota_europa", "name": "Bota de la Europa League", "desc": "Ser el máximo goleador de la Europa League.", "kind": "award", "award": "Bota de la Europa League", "n": 1, "rare": RARE_RARE},
	{"id": "bota_conference", "name": "Bota de la Conference", "desc": "Ser el máximo goleador de la Conference.", "kind": "award", "award": "Bota de la Conference", "n": 1, "rare": RARE_RARE},
	{"id": "max_asist_liga", "name": "Cerebro de la Liga", "desc": "Máximo asistente de la Liga.", "kind": "award", "award": "Máximo Asistente de la Liga", "n": 1, "rare": RARE_RARE},
	{"id": "max_asist_ucl", "name": "Cerebro de Europa", "desc": "Máximo asistente de la Champions.", "kind": "award", "award": "Máximo Asistente de la Champions", "n": 1, "rare": RARE_EPIC},
	{"id": "max_asist_eul", "name": "Cerebro de la Europa League", "desc": "Máximo asistente de la Europa League.", "kind": "award", "award": "Máximo Asistente de la Europa League", "n": 1, "rare": RARE_RARE},
	{"id": "bota_mundial", "name": "Bota de Oro del Mundial", "desc": "Máximo goleador del Mundial con tu selección.", "kind": "award", "award": "Bota de Oro del Mundial", "n": 1, "rare": RARE_LEGEND},

	{"id": "mejor_mundial", "name": "Figura del Mundial", "desc": "Ser el Mejor del Mundial con tu selección.", "kind": "award", "award": "Mejor del Mundial", "n": 1, "rare": RARE_LEGEND},

	{"id": "asist_mundial", "name": "El pase del Mundial", "desc": "Ser el máximo asistente del Mundial con tu selección.", "kind": "award", "award": "Máximo Asistente del Mundial", "n": 1, "rare": RARE_EPIC},

	{"id": "chico_oro", "name": "Chico de Oro", "desc": "Ganar el Chico de Oro, la promesa del año.", "kind": "award", "award": "Chico de Oro", "n": 1, "rare": RARE_EPIC},
	{"id": "gol_del_anio", "name": "Obra de Arte", "desc": "Ganar el Gol del Año.", "kind": "award", "award": "Gol del Año", "n": 1, "rare": RARE_EPIC},


	{"id": "bota_oro_europa", "name": "Bota de Oro de Europa", "desc": "Ser el máximo goleador de las ligas de Europa.", "kind": "award", "award": "Bota de Oro de Europa", "n": 1, "rare": RARE_EPIC},
	{"id": "premio_mundo", "name": "El Mejor del Planeta", "desc": "Ganar el Premio del Mundo.", "kind": "award", "award": "Premio del Mundo", "n": 1, "rare": RARE_LEGEND},










	{"id": "gloria_eterna", "name": "Gloria Eterna", "desc": "Ganar la Libertadores.", "kind": "award", "award": "Campeón de Libertadores", "n": 1, "rare": RARE_EPIC},
	{"id": "rey_del_sur", "name": "Rey del Sur", "desc": "Ganar la Sudamericana.", "kind": "award", "award": "Campeón de Sudamericana", "n": 1, "rare": RARE_EPIC},
	{"id": "rey_del_norte", "name": "Rey del Norte", "desc": "Ganar la Concacaf Champions Cup.", "kind": "award", "award": "Campeón de Concacaf", "n": 1, "rare": RARE_EPIC},
	{"id": "bota_libertadores", "name": "Bota de la Libertadores", "desc": "Ser el máximo goleador de la Libertadores.", "kind": "award", "award": "Bota de la Libertadores", "n": 1, "rare": RARE_EPIC},
	{"id": "bota_sudamericana", "name": "Bota de la Sudamericana", "desc": "Ser el máximo goleador de la Sudamericana.", "kind": "award", "award": "Bota de la Sudamericana", "n": 1, "rare": RARE_RARE},
	{"id": "bota_concacaf", "name": "Bota de la Concacaf", "desc": "Ser el máximo goleador de la Concacaf Champions Cup.", "kind": "award", "award": "Bota de la Concacaf", "n": 1, "rare": RARE_EPIC},
	{"id": "max_asist_lib", "name": "Cerebro de la Libertadores", "desc": "Máximo asistente de la Libertadores.", "kind": "award", "award": "Máximo Asistente de la Libertadores", "n": 1, "rare": RARE_EPIC},
	{"id": "max_asist_sud", "name": "Cerebro de la Sudamericana", "desc": "Máximo asistente de la Sudamericana.", "kind": "award", "award": "Máximo Asistente de la Sudamericana", "n": 1, "rare": RARE_RARE},
	{"id": "max_asist_cca", "name": "Cerebro de la Concacaf", "desc": "Máximo asistente de la Concacaf Champions Cup.", "kind": "award", "award": "Máximo Asistente de la Concacaf", "n": 1, "rare": RARE_EPIC},



	{"id": "rey_de_oriente", "name": "Rey de Oriente", "desc": "Ganar la Copa de Oriente.", "kind": "award", "award": "Campeón de Copa de Oriente", "n": 1, "rare": RARE_EPIC},
	{"id": "rey_del_sol", "name": "Rey del Sol", "desc": "Ganar la Copa del Sol.", "kind": "award", "award": "Campeón de Copa del Sol", "n": 1, "rare": RARE_RARE},
	{"id": "bota_oriente", "name": "Bota de la Copa de Oriente", "desc": "Ser el máximo goleador de la Copa de Oriente.", "kind": "award", "award": "Bota de la Copa de Oriente", "n": 1, "rare": RARE_EPIC},
	{"id": "bota_sol", "name": "Bota de la Copa del Sol", "desc": "Ser el máximo goleador de la Copa del Sol.", "kind": "award", "award": "Bota de la Copa del Sol", "n": 1, "rare": RARE_RARE},
	{"id": "max_asist_ace", "name": "Cerebro de la Copa de Oriente", "desc": "Máximo asistente de la Copa de Oriente.", "kind": "award", "award": "Máximo Asistente de la Copa de Oriente", "n": 1, "rare": RARE_EPIC},
	{"id": "max_asist_ac2", "name": "Cerebro de la Copa del Sol", "desc": "Máximo asistente de la Copa del Sol.", "kind": "award", "award": "Máximo Asistente de la Copa del Sol", "n": 1, "rare": RARE_RARE},



	{"id": "rey_del_atlas", "name": "Rey del Atlas", "desc": "Ganar la Copa del Atlas.", "kind": "award", "award": "Campeón de Copa del Atlas", "n": 1, "rare": RARE_EPIC},
	{"id": "rey_del_baobab", "name": "Rey del Baobab", "desc": "Ganar la Copa del Baobab.", "kind": "award", "award": "Campeón de Copa del Baobab", "n": 1, "rare": RARE_RARE},
	{"id": "bota_atlas", "name": "Bota de la Copa del Atlas", "desc": "Ser el máximo goleador de la Copa del Atlas.", "kind": "award", "award": "Bota de la Copa del Atlas", "n": 1, "rare": RARE_EPIC},
	{"id": "bota_baobab", "name": "Bota de la Copa del Baobab", "desc": "Ser el máximo goleador de la Copa del Baobab.", "kind": "award", "award": "Bota de la Copa del Baobab", "n": 1, "rare": RARE_RARE},
	{"id": "max_asist_caf", "name": "Cerebro de la Copa del Atlas", "desc": "Máximo asistente de la Copa del Atlas.", "kind": "award", "award": "Máximo Asistente de la Copa del Atlas", "n": 1, "rare": RARE_EPIC},
	{"id": "max_asist_cf2", "name": "Cerebro de la Copa del Baobab", "desc": "Máximo asistente de la Copa del Baobab.", "kind": "award", "award": "Máximo Asistente de la Copa del Baobab", "n": 1, "rare": RARE_RARE},







	{"id": "rey_del_coral", "name": "Rey del Coral", "desc": "Ganar la Copa del Coral.", "kind": "award", "award": "Campeón de Copa del Coral", "n": 1, "rare": RARE_RARE},
	{"id": "senor_del_coral", "name": "Señor del Arrecife", "desc": "Ganar 3 veces la Copa del Coral.", "kind": "award", "award": "Campeón de Copa del Coral", "n": 3, "rare": RARE_EPIC},
	{"id": "bota_coral", "name": "Bota de la Copa del Coral", "desc": "Ser el máximo goleador de la Copa del Coral.", "kind": "award", "award": "Bota de la Copa del Coral", "n": 1, "rare": RARE_RARE},
	{"id": "tiburon_del_pacifico", "name": "Tiburón del Pacífico", "desc": "Ser 2 veces el máximo goleador de la Copa del Coral.", "kind": "award", "award": "Bota de la Copa del Coral", "n": 2, "rare": RARE_EPIC},
	{"id": "max_asist_ofc", "name": "Cerebro de la Copa del Coral", "desc": "Máximo asistente de la Copa del Coral.", "kind": "award", "award": "Máximo Asistente de la Copa del Coral", "n": 1, "rare": RARE_RARE},
	{"id": "mejor_coral", "name": "Mejor de la Copa del Coral", "desc": "Ser el mejor jugador de la Copa del Coral.", "kind": "award", "award": "Mejor de la Copa del Coral", "n": 1, "rare": RARE_RARE},



	{"id": "amo_de_america", "name": "Amo de América", "desc": "Ganar la Libertadores con 3 clubes distintos.", "kind": "cont_clubs", "awards": ["Campeón de Libertadores"], "n": 3, "rare": RARE_EPIC},



	{"id": "mr_libertadores", "name": "Mr. Libertadores", "desc": "Ganar la Libertadores 5 veces en tu carrera.", "kind": "award", "award": "Campeón de Libertadores", "n": 5, "rare": RARE_LEGEND},
	{"id": "mr_concacaf", "name": "Mr. Copa del Norte", "desc": "Ganar la Concacaf Champions Cup 5 veces en tu carrera.", "kind": "award", "award": "Campeón de Concacaf", "n": 5, "rare": RARE_LEGEND},



	{"id": "dos_mundos", "name": "Dos Mundos", "desc": "Ganar la Champions y también la Libertadores o la Concacaf Champions Cup.", "kind": "dos_mundos", "n": 1, "rare": RARE_LEGEND},




	{"id": "pichichi_x3", "name": "Killer de la Liga", "desc": "Ganar 3 veces el trofeo de máximo goleador de tu liga.", "kind": "award", "award": "Pichichi de la Liga", "n": 3, "rare": RARE_EPIC},
	{"id": "pichichi_x5", "name": "Dueño del Area", "desc": "Ganar 5 veces el trofeo de máximo goleador de tu liga.", "kind": "award", "award": "Pichichi de la Liga", "n": 5, "rare": RARE_LEGEND},
	{"id": "asist_x3", "name": "El Que Reparte", "desc": "Ganar 3 veces el trofeo de máximo asistente de tu liga.", "kind": "award", "award": "Máximo Asistente de la Liga", "n": 3, "rare": RARE_EPIC},
	{"id": "bota_champions_x3", "name": "Killer de Europa", "desc": "Ser 3 veces el máximo goleador de la Champions.", "kind": "award", "award": "Bota de la Champions", "n": 3, "rare": RARE_LEGEND},
	{"id": "pichichi_2_paises", "name": "Goleador Sin Fronteras", "desc": "Ser máximo goleador de la liga en 2 países distintos.", "kind": "scorer_countries", "n": 2, "rare": RARE_EPIC},
	{"id": "pichichi_3_paises", "name": "El Gol No Entiende de Idiomas", "desc": "Ser máximo goleador de la liga en 3 países distintos.", "kind": "scorer_countries", "n": 3, "rare": RARE_LEGEND},

	{"id": "doblete_liga", "name": "Goles y Pases", "desc": "Máximo goleador Y máximo asistente de tu liga en la misma temporada.", "kind": "scorer_assist_double", "n": 1, "rare": RARE_LEGEND},
	{"id": "bota_doble", "name": "Nadie Marca Más", "desc": "Máximo goleador de tu liga Y de tu gran copa continental en la misma temporada.", "kind": "boot_double", "n": 1, "rare": RARE_LEGEND},
	{"id": "jugador_partido", "name": "Estrella del Partido", "desc": "Ser elegido Jugador del Partido.", "kind": "award", "award": "Jugador del Partido", "n": 1, "rare": RARE_COMMON},
	{"id": "jugador_mes", "name": "Jugador del Mes", "desc": "Ganar el Jugador del Mes.", "kind": "award", "award": "Jugador del Mes", "n": 1, "rare": RARE_RARE},





	{"id": "verdugo_espana", "name": "Verdugo de España", "desc": "Vencer a todos los clubes de España (las tres divisiones).", "kind": "beat_country", "country": "España", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_inglaterra", "name": "Verdugo de Inglaterra", "desc": "Vencer a todos los clubes de Inglaterra (las tres divisiones).", "kind": "beat_country", "country": "Inglaterra", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_italia", "name": "Verdugo de Italia", "desc": "Vencer a todos los clubes de Italia (las tres divisiones).", "kind": "beat_country", "country": "Italia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_alemania", "name": "Verdugo de Alemania", "desc": "Vencer a todos los clubes de Alemania (las tres divisiones).", "kind": "beat_country", "country": "Alemania", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_francia", "name": "Verdugo de Francia", "desc": "Vencer a todos los clubes de Francia (las tres divisiones).", "kind": "beat_country", "country": "Francia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_portugal", "name": "Verdugo de Portugal", "desc": "Vencer a todos los clubes de Portugal (las tres divisiones).", "kind": "beat_country", "country": "Portugal", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_paises_bajos", "name": "Verdugo de Países Bajos", "desc": "Vencer a todos los clubes de Países Bajos (las tres divisiones).", "kind": "beat_country", "country": "Países Bajos", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_belgica", "name": "Verdugo de Bélgica", "desc": "Vencer a todos los clubes de Bélgica (las tres divisiones).", "kind": "beat_country", "country": "Bélgica", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_turquia", "name": "Verdugo de Turquía", "desc": "Vencer a todos los clubes de Turquía (las tres divisiones).", "kind": "beat_country", "country": "Turquía", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_argentina", "name": "Verdugo de Argentina", "desc": "Vencer a todos los clubes de Argentina (las tres divisiones).", "kind": "beat_country", "country": "Argentina", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_brasil", "name": "Verdugo de Brasil", "desc": "Vencer a todos los clubes de Brasil (las tres divisiones).", "kind": "beat_country", "country": "Brasil", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_mexico", "name": "Verdugo de México", "desc": "Vencer a todos los clubes de México (las tres divisiones).", "kind": "beat_country", "country": "México", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_estados_unidos", "name": "Verdugo de Estados Unidos", "desc": "Vencer a todos los clubes de Estados Unidos (las tres divisiones).", "kind": "beat_country", "country": "Estados Unidos", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_arabia", "name": "Verdugo de Arabia Saudí", "desc": "Vencer a todos los clubes de Arabia Saudí (las tres divisiones).", "kind": "beat_country", "country": "Arabia Saudí", "n": 1, "rare": RARE_EPIC},

	{"id": "verdugo_escocia", "name": "Verdugo de Escocia", "desc": "Vencer a todos los clubes de Escocia (las tres divisiones).", "kind": "beat_country", "country": "Escocia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_grecia", "name": "Verdugo de Grecia", "desc": "Vencer a todos los clubes de Grecia (las tres divisiones).", "kind": "beat_country", "country": "Grecia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_ucrania", "name": "Verdugo de Ucrania", "desc": "Vencer a todos los clubes de Ucrania (las tres divisiones).", "kind": "beat_country", "country": "Ucrania", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_austria", "name": "Verdugo de Austria", "desc": "Vencer a todos los clubes de Austria (las tres divisiones).", "kind": "beat_country", "country": "Austria", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_suiza", "name": "Verdugo de Suiza", "desc": "Vencer a todos los clubes de Suiza (las tres divisiones).", "kind": "beat_country", "country": "Suiza", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_chequia", "name": "Verdugo de Chequia", "desc": "Vencer a todos los clubes de Chequia (las tres divisiones).", "kind": "beat_country", "country": "Chequia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_croacia", "name": "Verdugo de Croacia", "desc": "Vencer a todos los clubes de Croacia (las tres divisiones).", "kind": "beat_country", "country": "Croacia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_serbia", "name": "Verdugo de Serbia", "desc": "Vencer a todos los clubes de Serbia (las tres divisiones).", "kind": "beat_country", "country": "Serbia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_dinamarca", "name": "Verdugo de Dinamarca", "desc": "Vencer a todos los clubes de Dinamarca (las tres divisiones).", "kind": "beat_country", "country": "Dinamarca", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_noruega", "name": "Verdugo de Noruega", "desc": "Vencer a todos los clubes de Noruega (las tres divisiones).", "kind": "beat_country", "country": "Noruega", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_japon", "name": "Verdugo de Japón", "desc": "Vencer a todos los clubes de Japón (las tres divisiones).", "kind": "beat_country", "country": "Japón", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_corea", "name": "Verdugo de Corea del Sur", "desc": "Vencer a todos los clubes de Corea del Sur (las tres divisiones).", "kind": "beat_country", "country": "Corea del Sur", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_colombia", "name": "Verdugo de Colombia", "desc": "Vencer a todos los clubes de Colombia (las tres divisiones).", "kind": "beat_country", "country": "Colombia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_chile", "name": "Verdugo de Chile", "desc": "Vencer a todos los clubes de Chile (las tres divisiones).", "kind": "beat_country", "country": "Chile", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_uruguay", "name": "Verdugo de Uruguay", "desc": "Vencer a todos los clubes de Uruguay (las tres divisiones).", "kind": "beat_country", "country": "Uruguay", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_egipto", "name": "Verdugo de Egipto", "desc": "Vencer a todos los clubes de Egipto (las tres divisiones).", "kind": "beat_country", "country": "Egipto", "n": 1, "rare": RARE_EPIC},



	{"id": "verdugo_paraguay", "name": "Verdugo de Paraguay", "desc": "Vencer a todos los clubes de Paraguay (las tres divisiones).", "kind": "beat_country", "country": "Paraguay", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_ecuador", "name": "Verdugo de Ecuador", "desc": "Vencer a todos los clubes de Ecuador (las tres divisiones).", "kind": "beat_country", "country": "Ecuador", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_peru", "name": "Verdugo de Perú", "desc": "Vencer a todos los clubes de Perú (las tres divisiones).", "kind": "beat_country", "country": "Perú", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_bolivia", "name": "Verdugo de Bolivia", "desc": "Vencer a todos los clubes de Bolivia (las tres divisiones).", "kind": "beat_country", "country": "Bolivia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_venezuela", "name": "Verdugo de Venezuela", "desc": "Vencer a todos los clubes de Venezuela (las tres divisiones).", "kind": "beat_country", "country": "Venezuela", "n": 1, "rare": RARE_EPIC},



	{"id": "verdugo_marruecos", "name": "Verdugo de Marruecos", "desc": "Vencer a todos los clubes de Marruecos (las tres divisiones).", "kind": "beat_country", "country": "Marruecos", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_tunez", "name": "Verdugo de Túnez", "desc": "Vencer a todos los clubes de Túnez (las tres divisiones).", "kind": "beat_country", "country": "Túnez", "n": 1, "rare": RARE_EPIC},



	{"id": "verdugo_nueva_zelanda", "name": "Verdugo de Nueva Zelanda", "desc": "Vencer a todos los clubes de Nueva Zelanda (las tres divisiones).", "kind": "beat_country", "country": "Nueva Zelanda", "n": 1, "rare": RARE_EPIC},



	{"id": "verdugo_suecia", "name": "Verdugo de Suecia", "desc": "Vencer a todos los clubes de Suecia (las tres divisiones).", "kind": "beat_country", "country": "Suecia", "n": 1, "rare": RARE_EPIC},
	{"id": "verdugo_rumania", "name": "Verdugo de Rumanía", "desc": "Vencer a todos los clubes de Rumanía (las tres divisiones).", "kind": "beat_country", "country": "Rumanía", "n": 1, "rare": RARE_EPIC},




	{"id": "verdugo_bosnia", "name": "Verdugo de Bosnia y Herzegovina", "desc": "Vencer a todos los clubes de Bosnia y Herzegovina (las tres divisiones).", "kind": "beat_country", "country": "Bosnia y Herzegovina", "n": 1, "rare": RARE_EPIC},




	{"id": "libro_europa", "name": "Conquistador de Europa", "desc": "Vencer a todos los clubes y selecciones de Europa.", "kind": "libro_continente", "confed": "UEFA", "n": 1, "rare": RARE_LEGEND},
	{"id": "libro_sudamerica", "name": "Conquistador de Sudamérica", "desc": "Vencer a todos los clubes y selecciones de Sudamérica.", "kind": "libro_continente", "confed": "CONMEBOL", "n": 1, "rare": RARE_LEGEND},
	{"id": "libro_norteamerica", "name": "Conquistador de Norteamérica", "desc": "Vencer a todos los clubes y selecciones de Norteamérica, Centroamérica y el Caribe.", "kind": "libro_continente", "confed": "CONCACAF", "n": 1, "rare": RARE_LEGEND},
	{"id": "libro_africa", "name": "Conquistador de África", "desc": "Vencer a todos los clubes y selecciones de África.", "kind": "libro_continente", "confed": "CAF", "n": 1, "rare": RARE_LEGEND},
	{"id": "libro_asia", "name": "Conquistador de Asia", "desc": "Vencer a todos los clubes y selecciones de Asia.", "kind": "libro_continente", "confed": "AFC", "n": 1, "rare": RARE_LEGEND},
	{"id": "libro_oceania", "name": "Conquistador de Oceanía", "desc": "Vencer a todos los clubes y selecciones de Oceanía.", "kind": "libro_continente", "confed": "OFC", "n": 1, "rare": RARE_LEGEND},
	{"id": "libro_completo", "name": "Libro Completo", "desc": "Vencer a todos los rivales del juego: cada club y cada selección del mundo.", "kind": "libro_todo", "n": 1, "rare": RARE_LEGEND},
	{"id": "verdugo_mundo", "name": "Némesis del Mundo", "desc": "Vencer a TODOS los clubes del juego: cada liga, cada división. La cima del hardcore.", "kind": "beat_all", "n": 1, "rare": RARE_LEGEND},










	{"id": "presentado", "name": "Nuevo Fichaje", "desc": "Ser presentado ante tu nueva afición por primera vez.", "kind": "presentations", "n": 1, "rare": RARE_COMMON},
	{"id": "presentacion_10k", "name": "Diez Mil Curiosos", "desc": "10.000 personas fueron a tu presentación.", "kind": "presentation_fans", "n": 10000, "rare": RARE_COMMON},
	{"id": "presentacion_llena", "name": "No Cabe Un Alma", "desc": "Llenar el estadio el día de tu presentación, sin haber jugado un solo minuto.", "kind": "presentations_full", "n": 1, "rare": RARE_RARE},
	{"id": "presentacion_40k", "name": "Cuarenta Mil", "desc": "40.000 personas fueron a verte firmar.", "kind": "presentation_fans", "n": 40000, "rare": RARE_RARE},
	{"id": "presentacion_65k", "name": "Fichaje Galáctico", "desc": "Que 65.000 personas vayan a tu presentación. Dejar de ser un jugador para ser una noticia.", "kind": "presentation_fans", "n": 65000, "rare": RARE_EPIC},


















	{"id": "presentacion_90k", "name": "Ochenta Mil Almas", "desc": "Que 80.000 personas llenen el estadio SÓLO para verte llegar. Ni un partido, ni un gol: tu nombre.", "kind": "presentation_fans", "n": 80000, "rare": RARE_LEGEND},
	{"id": "presentacion_llena_x3", "name": "Siempre Te Esperan", "desc": "Llenar el estadio en TRES presentaciones distintas.", "kind": "presentations_full", "n": 3, "rare": RARE_LEGEND},


	{"id": "primer_regate", "name": "Rompelíneas", "desc": "Ganar tu primer regate.", "kind": "duel_wins", "n": 1, "rare": RARE_COMMON},
	{"id": "regateador_25", "name": "Bailarín", "desc": "25 regates ganados.", "kind": "duel_wins", "n": 25, "rare": RARE_RARE},
	{"id": "regateador_100", "name": "Imparable", "desc": "100 regates ganados.", "kind": "duel_wins", "n": 100, "rare": RARE_EPIC},


	{"id": "gol_agonico", "name": "Agónico", "desc": "Marcar en el minuto 85 o después.", "kind": "late_goals", "n": 1, "rare": RARE_RARE},
	{"id": "rey_descuento", "name": "Rey del Descuento", "desc": "10 goles del minuto 85 en adelante.", "kind": "late_goals", "n": 10, "rare": RARE_EPIC},

	{"id": "remontada", "name": "Noche de Remontada", "desc": "Ganar un partido en el que llegues a ir perdiendo por 2 goles.", "kind": "comeback_wins", "n": 1, "rare": RARE_EPIC, "secret": true},





	{"id": "camarografo", "name": "¡Corten!", "desc": "Tumbar a un camarógrafo de un balonazo.", "kind": "cams_hit", "n": 1, "rare": RARE_LEGEND, "secret": true},




	{"id": "cesion_portero", "name": "Cesión al Portero", "desc": "Pasarle el balón a tu propio portero en vez de tirar a puerta.", "kind": "keeper_passes", "n": 1, "rare": RARE_RARE, "secret": true},




	{"id": "botellas_portero", "name": "¡A por agua!", "desc": "Tirar las botellas de agua del portero de un balonazo.", "kind": "bottles_hit", "n": 1, "rare": RARE_RARE, "secret": true},






	{"id": "foto_aficionado", "name": "¡Una foto y me voy!", "desc": "Un aficionado salta al campo en una final para tomarse una foto contigo.", "kind": "fan_photos", "n": 1, "rare": RARE_LEGEND, "secret": true},


	{"id": "balonero_lento", "name": "¡Que alguien le pite!", "desc": "Un recogepelotas de casa te tira el balón detrás de la valla para hacer tiempo.", "kind": "ballboy_stalls", "n": 1, "rare": RARE_RARE, "secret": true},





	{"id": "cuerdas_red", "name": "¡Llamen a Mantenimiento!", "desc": "Romper de dos balonazos las dos cuerdas que tensan la red y que salga el staff a tenderlas.", "kind": "net_ropes_staff", "n": 1, "rare": RARE_EPIC, "secret": true},











	{"id": "paloma", "name": "¡Plumas!", "desc": "Alcanzar a una paloma del campo de un balonazo.", "kind": "pigeons_hit", "n": 1, "rare": RARE_LEGEND, "secret": true},





	{"id": "cristal_palco", "name": "¡Cristales!", "desc": "Reventar el cristal de un palco de un balonazo.", "kind": "glass_broken", "n": 1, "rare": RARE_LEGEND, "secret": true},





	{"id": "nino_balonero", "name": "Sin Piedad con el Chaval", "desc": "Tumbar al recogepelotas de un balonazo.", "kind": "ball_boy_hit", "n": 1, "rare": RARE_EPIC, "secret": true},






	{"id": "apreton_derbi", "name": "La mano del derbi", "desc": "Descubrir el apretón de manos de los técnicos al acabar un derbi.", "kind": "apretones", "n": 1, "rare": RARE_RARE, "secret": true},





	{"id": "apreton_ganado", "name": "Mano de hierro", "desc": "Ganarle el apretón de manos al técnico rival al acabar un derbi.", "kind": "apretones_ganados", "n": 1, "rare": RARE_EPIC, "secret": true},







	{"id": "banca_rival", "name": "Recado a la Banca", "desc": "Darle un balonazo a alguien del banquillo rival.", "kind": "dugout_rival", "n": 1, "rare": RARE_RARE, "secret": true},
	{"id": "banca_propia", "name": "Fuego Amigo", "desc": "Darle un balonazo a alguien de tu propio banquillo.", "kind": "dugout_own", "n": 1, "rare": RARE_EPIC, "secret": true},
	{"id": "dt_rival", "name": "Con el Míster No", "desc": "Tumbar al entrenador rival de un balonazo.", "kind": "dugout_coach_rival", "n": 1, "rare": RARE_EPIC, "secret": true},
	{"id": "dt_propio", "name": "Te Vas al Banquillo", "desc": "Tumbar a tu propio entrenador de un balonazo.", "kind": "dugout_coach_own", "n": 1, "rare": RARE_LEGEND, "secret": true},



	{"id": "banca_desalojo", "name": "Desalojo", "desc": "Tumbar a diez personas de los banquillos a lo largo de tu carrera.", "kind": "dugout_hits", "n": 10, "rare": RARE_LEGEND, "secret": true},


























	{"id": "aspersor_roto", "name": "¡Agua Va!", "desc": "Reventar una cabeza de riego de un balonazo y que escupa torcida el resto del partido.", "kind": "sprinklers_broken", "n": 1, "rare": RARE_EPIC, "secret": true},









	{"id": "cerveza_ronda", "name": "¡Remojón!", "desc": "Tirarle la bebida a diez aficionados con balones que se van a la grada.", "kind": "beers_spilled", "n": 10, "rare": RARE_EPIC, "secret": true},








	{"id": "vendedor_bandeja", "name": "¡Ahí Va la Bandeja!", "desc": "Tumbarle la bandeja de comida al vendedor de la grada de un balonazo.", "kind": "vendor_hits", "n": 1, "rare": RARE_LEGEND, "secret": true},





	{"id": "dron_derribado", "name": "Señal Perdida", "desc": "Derribar el dron de la tele de un balonazo.", "kind": "drone_hits", "n": 1, "rare": RARE_LEGEND, "secret": true},





	{"id": "gol_playa", "name": "Gol de Playa", "desc": "Marcar un gol desviado por el balón de playa.", "kind": "beach_goals", "n": 1, "rare": RARE_LEGEND, "secret": true},
	{"id": "celular_viral", "name": "Se Hizo Viral", "desc": "Tirarle el celular a un fan que te graba.", "kind": "viral_videos", "n": 1, "rare": RARE_LEGEND, "secret": true},










	{"id": "abucheo_callado", "name": "Le Callaste la Boca", "desc": "Marcar después de que te abucheen desde la grada, en el mismo partido.", "kind": "heckler_answered", "n": 1, "rare": RARE_RARE, "secret": true},










	{"id": "balon_calle", "name": "Ese Balón No Vuelve", "desc": "Mandar un balón a la calle en un campo sin nada detrás del arco.", "kind": "street_balls_out", "n": 1, "rare": RARE_RARE, "secret": true},




	{"id": "final_perdida", "name": "De Espaldas a la Copa", "desc": "Perder una final y ver al rival levantar el título.", "kind": "finals_lost", "n": 1, "rare": RARE_COMMON, "secret": true},





	{"id": "revancha", "name": "Revancha", "desc": "Ganar una final al club que te quitó otra.", "kind": "revanchas", "n": 1, "rare": RARE_RARE, "secret": true},



	{"id": "piel_nueva", "name": "Piel Nueva", "desc": "Ver la presentación de las equipaciones de la temporada.", "kind": "kit_reveals", "n": 1, "rare": RARE_COMMON},
	{"id": "primer_autografo", "name": "Primer Autógrafo", "desc": "Firmar una camiseta a la gente que te espera en la puerta de la ciudad deportiva.", "kind": "autografos", "n": 1, "rare": RARE_RARE},




	{"id": "firmas_100", "name": "Cien Firmas", "desc": "Firmar 100 autógrafos.", "kind": "firmas", "n": 100, "rare": RARE_COMMON},
	{"id": "firmas_1000", "name": "Mil Firmas", "desc": "Firmar 1.000 autógrafos.", "kind": "firmas", "n": 1000, "rare": RARE_RARE},
	{"id": "firmas_10000", "name": "La Mano de Oro", "desc": "Firmar 10.000 autógrafos.", "kind": "firmas", "n": 10000, "rare": RARE_EPIC},

	{"id": "derbi_ganado", "name": "Orgullo de la Ciudad", "desc": "Ganar tu primer derbi.", "kind": "derby_wins", "n": 1, "rare": RARE_COMMON},
	{"id": "derbi_gol", "name": "El Gol que Vale Doble", "desc": "Marcar en un derbi.", "kind": "derby_goals", "n": 1, "rare": RARE_RARE},
	{"id": "rey_derbi", "name": "Rey del Derbi", "desc": "Ganar 5 derbis.", "kind": "derby_wins", "n": 5, "rare": RARE_EPIC},


	{"id": "millonario", "name": "Millonario", "desc": "Juntar 1.000.000 en el banco.", "kind": "best_money", "n": 1000000, "rare": RARE_RARE},
	{"id": "magnate", "name": "Magnate", "desc": "Juntar 10.000.000 en el banco.", "kind": "best_money", "n": 10000000, "rare": RARE_EPIC},
	{"id": "primer_sponsor", "name": "Imagen de Marca", "desc": "Firmar tu primer contrato de patrocinio.", "kind": "sponsors_signed", "n": 1, "rare": RARE_COMMON},
	{"id": "hombre_anuncio", "name": "Hombre Anuncio", "desc": "Firmar 10 contratos de patrocinio.", "kind": "sponsors_signed", "n": 10, "rare": RARE_RARE},
	{"id": "vida_futbolista", "name": "Vida de Futbolista", "desc": "Comprar tu primer artículo de estilo de vida.", "kind": "lifestyle_items", "n": 1, "rare": RARE_COMMON},
	{"id": "inversor", "name": "Inversor", "desc": "Hacer tu primera inversión.", "kind": "investments", "n": 1, "rare": RARE_COMMON},

	{"id": "decisiones_25", "name": "Hombre del Vestuario", "desc": "Responder 25 decisiones.", "kind": "decisions", "n": 25, "rare": RARE_COMMON},
	{"id": "decisiones_100", "name": "La Voz del Equipo", "desc": "Responder 100 decisiones.", "kind": "decisions", "n": 100, "rare": RARE_RARE},

	{"id": "via_bosman", "name": "Vía Bosman", "desc": "Firmar por un club siendo agente libre, sin traspaso de por medio.", "kind": "bosman", "n": 1, "rare": RARE_RARE},
	{"id": "ida_y_vuelta", "name": "Ida y Vuelta", "desc": "Completar una cesión entera y volver a tu club.", "kind": "loan_done", "n": 1, "rare": RARE_RARE},





	{"id": "enamorado_cedido", "name": "Nunca te Enamores de un Cedido", "desc": "Ser elegido Mejor Jugador del Club en el equipo donde juegas cedido.", "kind": "loan_club_best", "n": 1, "rare": RARE_EPIC},
	{"id": "tres_paises", "name": "Pasaporte Sellado", "desc": "Jugar en clubes de 3 países distintos.", "kind": "countries_played", "n": 3, "rare": RARE_RARE},
	{"id": "cinco_paises", "name": "Ciudadano del Mundo", "desc": "Jugar en clubes de 5 países distintos.", "kind": "countries_played", "n": 5, "rare": RARE_LEGEND},


	{"id": "segunda_vida", "name": "Segunda Vida", "desc": "Cerrar una carrera entera (hasta el retiro) con un modificador de Nueva Carrera+ activo.", "kind": "rebirth_done", "n": 1, "rare": RARE_EPIC, "secret": true},









	{"id": "mudanza", "name": "Primera Mudanza", "desc": "Subir de casa por primera vez.", "kind": "house_level", "n": 1, "rare": RARE_COMMON},
	{"id": "casa_moderna", "name": "Vida Acomodada", "desc": "Llegar a vivir en una casa moderna.", "kind": "house_level", "n": 2, "rare": RARE_RARE},
	{"id": "mansion", "name": "La Mansión", "desc": "Llegar a vivir en una mansión.", "kind": "house_level", "n": 3, "rare": RARE_EPIC},


	{"id": "la_finca", "name": "La Finca", "desc": "Llegar a vivir en una finca.", "kind": "house_level", "n": 4, "rare": RARE_LEGEND},






	{"id": "hogar_completo", "name": "Hogar, Dulce Hogar", "desc": "Amueblar tu casa con 10 adiciones.", "kind": "house_extras", "n": 10, "rare": RARE_RARE},
	{"id": "casa_llena", "name": "Casa Llena", "desc": "Amueblar tu casa con 40 adiciones.", "kind": "house_extras", "n": 40, "rare": RARE_EPIC},
	{"id": "casa_sonada", "name": "La Casa Soñada", "desc": "Amueblar tu casa con 80 adiciones.", "kind": "house_extras", "n": 80, "rare": RARE_LEGEND},



	{"id": "snake_10", "name": "Reflejos", "desc": "Hacer 10 puntos en la maquinita de tu casa.", "kind": "snake", "n": 10, "rare": RARE_COMMON},
	{"id": "simulador_as", "name": "As del volante", "desc": "Cruzar los tres controles del simulador y llegar antes del tiempo objetivo.", "kind": "simulador", "n": 1, "rare": RARE_RARE},









	{"id": "simulador_compacto", "name": "Primera Medalla", "desc": "Sacar el oro en el simulador con el compacto urbano.", "kind": "simulador_compacto", "n": 1, "rare": RARE_COMMON},
	{"id": "simulador_carreras", "name": "Piloto de Domingo", "desc": "Terminar 25 vueltas en el simulador.", "kind": "simulador_carreras", "n": 25, "rare": RARE_COMMON},
	{"id": "simulador_limpia", "name": "Vuelta Limpia", "desc": "Terminar una vuelta del simulador sin salirte nunca del asfalto.", "kind": "simulador_limpia", "n": 1, "rare": RARE_RARE},
	{"id": "simulador_monedas", "name": "Cazamonedas", "desc": "Recoger las 72 monedas en una vuelta del simulador.", "kind": "simulador_monedas", "n": 72, "rare": RARE_EPIC},
	{"id": "simulador_pie", "name": "Pie a Fondo", "desc": "Dar una vuelta con el hiperdeportivo sin tocar el freno ni salirte del asfalto.", "kind": "simulador_pie", "n": 1, "rare": RARE_EPIC, "secret": true},
	{"id": "simulador_garaje", "name": "Garaje de Oro", "desc": "Sacar el oro en el simulador con los ocho coches.", "kind": "simulador_garaje", "n": 8, "rare": RARE_LEGEND},
	{"id": "snake_50", "name": "Serpiente Legendaria", "desc": "Hacer 50 puntos en la maquinita de tu casa.", "kind": "snake", "n": 50, "rare": RARE_EPIC, "secret": true},








	{"id": "dardos_200", "name": "Buen Pulso", "desc": "Hacer 200 puntos en la diana de tu casa.", "kind": "dardos", "n": 200, "rare": RARE_COMMON},
	{"id": "dardos_320", "name": "Mano de Seda", "desc": "Hacer 320 puntos en la diana de tu casa.", "kind": "dardos", "n": 320, "rare": RARE_RARE},
	{"id": "dardos_400", "name": "Nueve Dardos", "desc": "Hacer 400 puntos en la diana de tu casa.", "kind": "dardos", "n": 400, "rare": RARE_EPIC, "secret": true},




	{"id": "bullseye", "name": "Bullseye", "desc": "Clavar un dardo en el mero centro de la diana.", "kind": "bullseye", "n": 1, "rare": RARE_RARE},




	{"id": "billar_gana", "name": "Bola Ocho", "desc": "Ganar tu primera partida de billar en casa.", "kind": "billar_wins", "n": 1, "rare": RARE_COMMON},
	{"id": "billar_mesa", "name": "Mesa Limpia", "desc": "Ganar una partida de billar sin que el rival meta una sola bola.", "kind": "billar", "n": 7, "rare": RARE_EPIC, "secret": true},













	{"id": "refuerzo_pedido", "name": "Te Hicieron Caso", "desc": "Que el club fiche a alguien que TÚ le hayas señalado.", "kind": "refuerzos", "n": 1, "rare": RARE_RARE},
	{"id": "retos_casa", "name": "El Dueño de la Casa", "desc": "Ganar cinco retos de billar al vestuario en tu casa.", "kind": "retos_casa", "n": 5, "rare": RARE_RARE},






	{"id": "dominadas_100", "name": "La Mirada del Míster", "desc": "Llegar a cien dominadas en el banquillo.", "kind": "dominadas", "n": 100, "rare": RARE_EPIC, "secret": true},







	{"id": "trueno", "name": "El Trueno", "desc": "Llevar a la grada entera hasta el redoble tras una goleada en casa.", "kind": "truenos", "n": 1, "rare": RARE_RARE, "secret": true},
	{"id": "dt_pecho", "name": "El Míster Aún Sabe", "desc": "Que tu técnico baje de pecho un balón fuera y se la dé al que saca de banda.", "kind": "dt_pechos", "n": 1, "rare": RARE_RARE, "secret": true},

	{"id": "himno_serio", "name": "Cara de Piedra", "desc": "Aguantar el himno sin reírte con la tele delante.", "kind": "himnos_serios", "n": 1, "rare": RARE_EPIC, "secret": true},
	{"id": "himno_pillado", "name": "Pillado en Directo", "desc": "Que la tele te pille riéndote durante el himno.", "kind": "himnos_pillados", "n": 1, "rare": RARE_RARE, "secret": true},


	{"id": "graduado", "name": "Graduado de la Academia", "desc": "Completar el entrenamiento de la Academia.", "kind": "academia", "n": 1, "rare": RARE_COMMON},


	{"id": "media_naranja", "name": "Media Naranja", "desc": "Formalizar una relación.", "kind": "pareja_formal", "n": 1, "rare": RARE_COMMON},



	{"id": "ocho_anios", "name": "Ocho Años", "desc": "Ocho temporadas con la misma persona.", "kind": "pareja_anios", "n": 8, "rare": RARE_EPIC},



	{"id": "ley_de_mama", "name": "Todo a Nombre de Mamá", "desc": "Que su abogado pidiera la casa y las escrituras dijeran otra cosa.", "kind": "ley_de_mama", "n": 1, "rare": RARE_EPIC, "secret": true},











	{"id": "la_mas_vendida", "name": "La Más Vendida", "desc": "Que tu camiseta sea la más vendida del vestuario en una temporada.", "kind": "jersey_top", "n": 1, "rare": RARE_RARE},


	{"id": "all_in", "name": "All-in", "desc": "Ganar el torneo de póquer de tu casa.", "kind": "award", "award": "Campeón del Torneo de Póquer", "n": 1, "rare": RARE_RARE},


	{"id": "ley_del_ex", "name": "La Ley del Ex", "desc": "Marcarle un gol a un club del que te fuiste.", "kind": "ex_club_goals", "n": 1, "rare": RARE_RARE},




	{"id": "una_vida_entera", "name": "Una Vida Entera", "desc": "Vivir 50 escenas distintas del álbum en una misma carrera.", "kind": "escenas", "n": 50, "rare": RARE_EPIC},


	{"id": "album_completo", "name": "Álbum Completo", "desc": "Descubrir todos los arquetipos de pareja.", "kind": "parejas_album", "n": 1, "rare": RARE_LEGEND},



	{"id": "rodeado", "name": "Rodeado", "desc": "Firmar autógrafos con 40 aficionados o más esperándote en la puerta.", "kind": "autografos_fans", "n": 40, "rare": RARE_EPIC},


	{"id": "turista_estadios", "name": "Turista de Estadios", "desc": "Jugar en 25 estadios distintos.", "kind": "stadiums", "n": 25, "rare": RARE_RARE},

	{"id": "el_brazalete", "name": "El Brazalete", "desc": "Ser el capitán de tu club.", "kind": "club_captain", "n": 1, "rare": RARE_RARE},

	{"id": "desde_los_once", "name": "Desde los Once Metros", "desc": "Marcar el penal que gana una tanda.", "kind": "shootout_winners", "n": 1, "rare": RARE_EPIC},


	{"id": "carta_presentacion", "name": "Carta de Presentación", "desc": "Marcar en tu debut con un club nuevo.", "kind": "debut_goals", "n": 1, "rare": RARE_RARE},


	{"id": "de_hierro", "name": "De Hierro", "desc": "Jugar 20 partidos o más en una temporada sin perderte ninguno por lesión.", "kind": "iron_seasons", "n": 1, "rare": RARE_RARE},


	{"id": "nino_prodigio", "name": "Niño Prodigio", "desc": "Debutar en Primera División antes de cumplir 18 años.", "kind": "prodigy_debut", "n": 1, "rare": RARE_RARE},
	{"id": "vino_viejo", "name": "Roble Viejo", "desc": "Marcar un gol con 38 años o más.", "kind": "veteran_goals", "n": 1, "rare": RARE_EPIC},






	{"id": "amigo_primero", "name": "Compañero de Vestuario", "desc": "Agregar a tu primer amigo.", "kind": "amigos", "n": 1, "rare": RARE_COMMON, "social": true},
	{"id": "amigo_pena", "name": "La Peña", "desc": "Tener 5 amigos.", "kind": "amigos", "n": 5, "rare": RARE_RARE, "social": true},
	{"id": "amigo_hinchada", "name": "Hinchada Propia", "desc": "Tener 10 amigos.", "kind": "amigos", "n": 10, "rare": RARE_EPIC, "social": true},

	{"id": "amigo_fronteras", "name": "Sin Fronteras", "desc": "Tener un amigo que juega en otro tipo de teléfono.", "kind": "amigos_cross", "n": 1, "rare": RARE_RARE, "social": true},
	{"id": "amigo_lider", "name": "El Mejor del Grupo", "desc": "Ser primero en LEGADO entre al menos 3 amigos.", "kind": "amigos_lider", "n": 1, "rare": RARE_EPIC, "social": true},



	{"id": "reto_primero", "name": "Guante Lanzado", "desc": "Jugar tu primer reto contra un amigo.", "kind": "reto_amigo", "n": 1, "rare": RARE_COMMON, "social": true},
	{"id": "reto_gana1", "name": "El Pique", "desc": "Ganar un reto a un amigo.", "kind": "reto_amigo_gana", "n": 1, "rare": RARE_RARE, "social": true},
	{"id": "reto_gana10", "name": "Rey del Barrio", "desc": "Ganar 10 retos a tus amigos.", "kind": "reto_amigo_gana", "n": 10, "rare": RARE_EPIC, "social": true},
	{"id": "reto_pleno", "name": "Pleno", "desc": "Marcar todas en un reto de 10 o 15 jugadas.", "kind": "reto_amigo_pleno", "n": 1, "rare": RARE_EPIC, "social": true},


	{"id": "padrino_1", "name": "Padrino", "desc": "Que un amigo que invitaste juegue 10 partidos.", "kind": "padrino", "n": 1, "rare": RARE_RARE, "social": true},


	{"id": "padrino_3", "name": "Embajador", "desc": "Que 3 amigos que invitaste jueguen 10 partidos.", "kind": "padrino", "n": 3, "rare": RARE_RARE, "social": true},
	{"id": "padrino_5", "name": "Cazatalentos", "desc": "Que 5 amigos que invitaste jueguen 10 partidos.", "kind": "padrino", "n": 5, "rare": RARE_EPIC, "social": true},


	{"id": "liga_podio", "name": "Podio", "desc": "Acabar entre los 3 primeros de una liga de amigos.", "kind": "liga_podio", "n": 1, "rare": RARE_RARE, "social": true},
	{"id": "liga_campeon", "name": "Campeón de liga", "desc": "Ganar una liga de amigos.", "kind": "liga_campeon", "n": 1, "rare": RARE_EPIC, "social": true},
	{"id": "liga_tri", "name": "Tricampeón", "desc": "Ganar 3 ligas de amigos.", "kind": "liga_campeon", "n": 3, "rare": RARE_LEGEND, "social": true},
	{"id": "padrino_10", "name": "Fundador", "desc": "Que 10 amigos que invitaste jueguen 10 partidos.", "kind": "padrino", "n": 10, "rare": RARE_LEGEND, "social": true},


	{"id": "vitrina_comun", "name": "Primera Vitrina", "desc": "Desbloquear todos los logros comunes.", "kind": "rare_complete", "tier": RARE_COMMON, "n": 1, "rare": RARE_RARE},
	{"id": "vitrina_rara", "name": "Vitrina Azul", "desc": "Desbloquear todos los logros raros.", "kind": "rare_complete", "tier": RARE_RARE, "n": 1, "rare": RARE_EPIC},
	{"id": "vitrina_epica", "name": "Vitrina Dorada", "desc": "Desbloquear todos los logros épicos.", "kind": "rare_complete", "tier": RARE_EPIC, "n": 1, "rare": RARE_LEGEND},
]



var _unlocked: Dictionary = {}




var rasgos_vistos: Dictionary = {}










var parejas_vistas: Dictionary = {}

var fault_inject_save: bool = false
var fault_inject_save_once: bool = false
var fault_inject_save_count: int = 0
var last_save_ok: bool = true


var _bulk: bool = false



var pending: Array = []

var progress: Dictionary = {


	"lifetime_goals": 0, "lifetime_assists": 0, "lifetime_matches": 0,
	"lifetime_seasons": 0,
	"top_league_titles": 0,

	"revision_20261012": false,






	"logros_unseen": {},
	"best_match_goals": 0,

	"best_final_goals": 0,


	"penalty_goals": 0, "freekick_goals": 0, "corner_goals": 0, "olympic_goals": 0, "freekick_under_goals": 0,


	"panenka_goals": 0,


	"header_goals": 0, "volley_goals": 0, "bicycle_goals": 0,

	"dog_seen": false,



	"pet_pika": false,




	"heckler_answered": false,
	"lifetime_nat_goals": 0, "lifetime_nat_assists": 0,

	"scored_cont": false, "scored_wc": false, "history_best": false,


	"perfect_season": false,
	"circle_complete": false,


	"comeback_goal": false,



	"scorer_assist_double": false, "boot_double": false,

	"retired_by_age": false, "retired_early": false, "retired_injury": false,

	"balon_joven": false, "triplete": false, "ultimo_baile": false,
	"desde_q1": false,
	"sextete": false,

	"nat_retired_early": false,


	"nat_captain": false,
	"one_club_career": false, "returned_club": false,


	"shirt_ten": false, "shirt_nine_elite": false,


	"divs_completed": {},





	"divs_signed": {},



	"clubs_beaten": {},


	"divs_unlock_seen": {},



	"best_presentation_fans": 0,
	"presentations": 0,
	"presentations_full": 0,


	"duel_wins": 0, "late_goals": 0, "comeback_wins": 0,
	"derby_goals": 0, "derby_wins": 0,


	"sponsors_signed": 0, "decisions_taken": 0,


	"lifestyle_bought": false, "invested": false,

	"bosman_signed": false, "loan_completed": false,

	"loan_club_best": false,

	"countries_played": {},

	"rebirth_done": false,



	"best_house_level": 0, "best_house_extras": 0,

	"pareja_formalized": false,
	"best_pareja_anios": 0,

	"ley_de_mama": 0,



	"cams_hit": 0,


	"keeper_passes": 0,


	"bottles_hit": 0,


	"vendor_hits": 0,


	"drone_hits": 0,


	"beach_goals": 0,
	"viral_videos": 0,




	"fan_photos": 0,


	"ballboy_stalls": 0,


	"net_ropes_staff": 0,



	"pigeons_hit": 0,



	"glass_broken": 0,




	"sprinklers_broken": 0,




	"beers_spilled": 0,




	"street_balls_out": 0,



	"billar_wins": 0, "retos_casa": 0, "bullseye": 0,


	"dominadas": 0,


	"amigos_max": 0, "amigos_cross": 0, "amigos_lider": 0,
	"reto_amigo": 0, "reto_amigo_gana": 0, "reto_amigo_pleno": 0, "padrino": 0,
	"liga_podio": 0, "liga_campeon": 0,




	"refuerzos": 0,


	"ball_boy_hit": 0,


	"apretones": 0,


	"truenos": 0, "dt_pechos": 0, "himnos_serios": 0, "himnos_pillados": 0,




	"cesion_dada": 0, "cesion_negada": 0, "ahijado": 0,





	"dugout_hits": 0,
	"dugout_own": 0,
	"dugout_rival": 0,
	"dugout_coach_own": 0,
	"dugout_coach_rival": 0,


	"finals_lost": 0,


	"revanchas": 0,


	"kit_reveals": 0,


	"museo_visitas": 0,

	"museo_ego": false,

	"clase_baile": false,

	"estreno": false,

	"terapia": false,

	"cena_ex": false,

	"barbacoa": false,

	"conserje": false,

	"estatua": false,


	"autografos": 0,

	"firmas": 0,

	"autografos_max_fans": 0,
	"stadiums_played": {},
	"ex_club_goals": 0, "debut_goals": 0, "veteran_goals": 0,
	"prodigy_debut": false,
	"shootout_winners": 0,
	"iron_seasons": 0,



	"socio_hat_tricks": 0,
	"socio_double_hat_tricks": 0,







	"career_counters": {},
}

var _seen: Dictionary = {}

var save_path: String = SAVE_PATH





var _cargado: bool = false


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_load()

	_sembrar_libro.call_deferred()





func _sembrar_libro() -> void:
	Settings.sembrar_rivales((progress["clubs_beaten"] as Dictionary).keys())







var _libro_cache: Dictionary = {}
var _libro_cache_n: int = -1
func libro_cuenta() -> Dictionary:
	if _libro_cache_n == Settings.rivales_vencidos.size() and not _libro_cache.is_empty():
		return _libro_cache
	var vencidos: Dictionary = {}
	for k in Settings.rivales_vencidos:
		vencidos[k] = true
	var got: Dictionary = {}
	var tot: Dictionary = {}
	var confed_de: Dictionary = {}
	for t in Teams.all():
		var c: String = String(t.get("country", ""))
		if not confed_de.has(c):
			confed_de[c] = String(Nations.by_id(Nations.id_for_country(c)).get("confed", ""))
		_libro_suma(got, tot, String(confed_de[c]), vencidos.has(String(t["id"])))
	for n in Nations.POOL:
		_libro_suma(got, tot, String(n.get("confed", "")), vencidos.has("nat:" + String(n["id"])))
	_libro_cache = {"got": got, "tot": tot}
	_libro_cache_n = Settings.rivales_vencidos.size()
	return _libro_cache


static func _libro_suma(got: Dictionary, tot: Dictionary, k: String, vencido: bool) -> void:
	for clave in ["*", k]:
		if String(clave).is_empty():
			continue
		tot[clave] = int(tot.get(clave, 0)) + 1
		if vencido:
			got[clave] = int(got.get(clave, 0)) + 1




func is_unlocked(id: String) -> bool:
	return _unlocked.has(id)


func unlocked_count() -> int:
	if Settings.sin_apuestas() and _unlocked.has(ID_POKER):
		return _unlocked.size() - 1
	return _unlocked.size()


func rasgo_visto(id: String) -> bool:
	return rasgos_vistos.has(id)


func rasgos_vistos_count() -> int:
	return rasgos_vistos.size()










func ingest_rasgos(ids: Array) -> Array:
	var nuevos: Array = []
	if _en_la_escuela():
		return nuevos
	for id in ids:
		var s: String = String(id)
		if rasgos_vistos.has(s) or Coach.rasgo_of(s).is_empty():
			continue
		rasgos_vistos[s] = {"season": GameState.season_num,
			"ts": int(Time.get_unix_time_from_system())}
		nuevos.append(s)

		(progress["logros_unseen"] as Dictionary)[RASGO_PENDIENTE + s] = true
		pending.append(RASGO_PENDIENTE + s)


	if not nuevos.is_empty() and not bool(progress.get("terapia", false)) \
			and Coach.RASGOS.all(func(r): return rasgos_vistos.has(String(r["id"]))):
		progress["terapia"] = true
		Career.queue_ceremony(Ceremonies.TERAPIA)
	if not nuevos.is_empty():
		_save()
	return nuevos




const RASGO_PENDIENTE: String = "rasgo:"








func _row_rasgo(id: String) -> Dictionary:
	var r: Dictionary = Coach.rasgo_of(id)
	var bueno: bool = bool(r.get("bueno", true))
	return {"id": RASGO_PENDIENTE + id, "name": String(r.get("label", id)),
		"desc": String(r.get("desc", "")),
		"rare": RARE_RARE if bueno else RARE_COMMON, "unlocked": true,
		"rasgo": id, "bueno": bueno, "secret": false}


func pareja_vista(id: String) -> bool:
	return parejas_vistas.has(id)




func parejas_vistas_count() -> int:
	var n: int = 0
	for p in Pareja.all():
		if parejas_vistas.has(String(p["id"])):
			n += 1
	return n










func ingest_pareja(id: String, nombre: String) -> bool:
	if _en_la_escuela() or Pareja.by_id(id).is_empty():
		return false
	var nueva: bool = not parejas_vistas.has(id)
	parejas_vistas[id] = {"nombre": nombre, "season": GameState.season_num,
		"ts": int(Time.get_unix_time_from_system())}
	if nueva:
		(progress["logros_unseen"] as Dictionary)[PAREJA_PENDIENTE + id] = true
		pending.append(PAREJA_PENDIENTE + id)


		check()


		if not bool(progress.get("cena_ex", false)) \
				and parejas_vistas_count() >= Pareja.all().size():
			progress["cena_ex"] = true
			Career.queue_ceremony(Ceremonies.CENA_EX)
	_save()
	return nueva




const PAREJA_PENDIENTE: String = "pareja:"





func pareja_rare(id: String) -> int:
	match id:
		"millonaria":
			return RARE_LEGEND
		"companera", "cazafortunas":
			return RARE_EPIC
	return RARE_COMMON if Pareja.divorcio_p(id) > 0.0 else RARE_RARE






func _row_pareja(id: String) -> Dictionary:
	var album: Array = Pareja.ALBUM.get(id, [id, ""])
	return {"id": PAREJA_PENDIENTE + id, "name": String(album[0]),
		"desc": String(album[1]), "rare": pareja_rare(id), "unlocked": true,
		"medalla": id, "secret": false}





func unlocked_ids() -> Array:
	return _unlocked.keys().duplicate()










func can_start_in_div(div: int) -> bool:
	if div <= 0:
		return false

	if div >= 3:
		return true


	if (progress["divs_completed"] as Dictionary).has(div + 1):
		return true

	for d in (progress["divs_signed"] as Dictionary).keys():
		if int(d) <= div:
			return true
	return false





func lock_reason_for_div(div: int) -> String:
	if can_start_in_div(div):
		return ""
	return I18n.tf(
		"Completa una temporada en {0} división o ficha por un club de {1} para desbloquear.",
		[I18n.ordinal_f(div + 1), I18n.ordinal_f(div)])




func div_is_earned_unlock(div: int, lowest_div: int) -> bool:
	return div < lowest_div and can_start_in_div(div)





func div_newly_unlocked(div: int, lowest_div: int) -> bool:
	return div_is_earned_unlock(div, lowest_div) \
			and not (progress["divs_unlock_seen"] as Dictionary).has(div)




func mark_divs_seen() -> void:
	var seen: Dictionary = progress["divs_unlock_seen"]
	var changed: bool = false



	for opened in range(1, 3):
		if can_start_in_div(opened) and not seen.has(opened):
			seen[opened] = true
			changed = true
	if changed:
		_save()







func ingest_beaten(club_id: String) -> void:
	if club_id.is_empty():
		return
	var beaten: Dictionary = progress["clubs_beaten"]
	if beaten.has(club_id):
		return
	beaten[club_id] = true
	_save()



func club_beaten(club_id: String) -> bool:
	return (progress["clubs_beaten"] as Dictionary).has(club_id)





func club_is_elite(club: Dictionary) -> bool:
	var country: String = String(club.get("country", ""))
	var div: int = int(club.get("div", 3))
	if div >= Teams.max_div(country):
		return false
	if int(club.get("rating", 60)) < ELITE_MIN_RATING:
		return false
	var teams: Array = Teams.teams_in(country, div)
	var n: int = teams.size()
	if n <= 0:
		return false
	var idx: int = -1
	var cid: String = String(club.get("id", ""))
	for i in n:
		if String(teams[i].get("id", "")) == cid:
			idx = i
			break

	var cutoff: int = maxi(1, int(ceil(float(n) * ELITE_TOP_FRACTION)))
	return idx >= 0 and idx < cutoff




func club_startable(club: Dictionary) -> bool:
	if club.is_empty():
		return false
	if not can_start_in_div(int(club.get("div", 3))):
		return false
	if not club_is_elite(club):
		return true
	return club_beaten(String(club.get("id", "")))




func club_lock_reason(club: Dictionary) -> String:
	if club_startable(club):
		return ""
	if not can_start_in_div(int(club.get("div", 3))):
		return lock_reason_for_div(int(club.get("div", 3)))
	return "Véncelo en un partido (con cualquier carrera) para desbloquearlo."


func total() -> int:
	return CATALOG.size() -(1 if Settings.sin_apuestas() else 0)







const ID_POKER: String = "all_in"






func meta_of(id: String) -> Dictionary:
	return _by_id(id)




func all() -> Array:
	var out: Array = []
	var sin_poker: bool = Settings.sin_apuestas()
	for e in CATALOG:
		if sin_poker and String(e["id"]) == ID_POKER:
			continue
		out.append(_row(e))
	return out




func take_pending() -> Array:
	if pending.is_empty():
		return []
	var out: Array = []
	for id in pending:
		var sid: String = String(id)
		if sid.begins_with(PAREJA_PENDIENTE):
			var arq: String = sid.substr(PAREJA_PENDIENTE.length())
			if not Pareja.by_id(arq).is_empty():
				out.append(_row_pareja(arq))
			continue
		if sid.begins_with(RASGO_PENDIENTE):
			var rid: String = sid.substr(RASGO_PENDIENTE.length())
			if not Coach.rasgo_of(rid).is_empty():
				out.append(_row_rasgo(rid))
			continue
		var e: Dictionary = _by_id(sid)
		if not e.is_empty():
			out.append(_row(e))
	pending = []
	_save()
	return out






func unseen_count() -> int:
	return (progress["logros_unseen"] as Dictionary).size()





func mark_logros_seen() -> void:
	var unseen: Dictionary = progress["logros_unseen"]
	if unseen.is_empty():
		return
	unseen.clear()
	_save()



func rarity_name(r: int) -> String:
	match r:
		RARE_LEGEND: return "LEGENDARIO"
		RARE_EPIC: return "ÉPICO"
		RARE_RARE: return "RARO"
		_: return "COMÚN"


func rarity_color(r: int) -> Color:








	match r:
		RARE_LEGEND: return CareerTheme.MONEY
		RARE_EPIC: return CareerTheme.HISTORIA
		RARE_RARE: return CareerTheme.STAT_ASSIST
		_: return CareerTheme.STAT_AVG














func rarity_confetti(r: int) -> Array:
	match r:
		RARE_LEGEND:
			return [rarity_color(r), Color("f4d06a"), Color("fff3c4"), Color("ffffff")]
		RARE_EPIC:
			return [rarity_color(r), Color("e3b23c"), Color("d9a7ff"), Color("ffffff")]
		RARE_RARE:
			return [rarity_color(r), Color("9ad0ff"), Color("e3b23c"), Color("ffffff")]
		_:
			return [Color("5aa9e6"), Color("e3b23c"), Color("d4483f"), Color("ffffff")]




func icon_for(a: Dictionary) -> String:
	match String(a.get("kind", "")):
		"goals", "best_match_goals", "best_final_goals", "penalty_goals", "freekick_goals", "olympic_goals", "freekick_under_goals", \
				"panenka_goals", "header_goals", "volley_goals", "bicycle_goals":
			return "bota"
		"assists", "nat_assists":
			return "asist"
		"nat_goals", "nat_caps", "scored_wc", "confeds":
			return "mundial"
		"corner_goals", "club_matches", "circle", "one_club_career", "returned_club", \
				"shirt_ten", "shirt_nine_elite":
			return "partido"



		"retire_age", "retire_early":
			return "retiro"
		"retire_injury":
			return "lesion"
		"nat_retire", "nat_captain":
			return "mundial"
		"scorer_countries", "scorer_assist_double", "boot_double":
			return "bota"
		"balon", "history_best", "legends_passed", "perfect_season", "ballon_segundo":
			return "balon_oro"
		"records_broken":
			return "placa_gol"
		"top_league", "distinct_league_clubs", "top5_leagues", "club_league_max", "league_streak", "season_div":
			return "liga"
		"scored_cont", "champions_clubs", "trophy_types":
			return "champions"
		"triplete", "desde_q1":
			return "champions"
		"sextete":
			return "corona"
		"ultimo_baile":
			return "retiro"
		"balon_joven":
			return "balon_oro"
		"de_la_nada":
			return "liga"
		"album_confed", "album_total":
			return "corona"



		"cont_clubs":
			return "amo_america"
		"dos_mundos":
			return "dos_mundos"
		"club_legend", "club_streak", "museo_visitas":
			return "estatua"
		"skills_avg":
			return "gema"
		"best_rating":
			return "llama"
		"tier":
			return "corona"
		"beat_country":
			return "liga"
		"beat_all":
			return "mundial"
		"libro_continente":
			return "continental"
		"libro_todo":
			return "mundial"
		"presentations", "presentations_full", "presentation_fans", "kit_reveals", \
				"autografos", "autografos_fans", "firmas":
			return "grada"


		"jersey_top":
			return "camiseta"



		"ex_club_goals":
			return "bota"
		"escenas":
			return "camara"
		"parejas_album":
			return "corazon"
		"stadiums":
			return "partido"
		"club_captain", "revanchas":
			return "corona"
		"shootout_winners":
			return "bota"
		"debut_goals":
			return "contrato"
		"iron_seasons":
			return "lesion"
		"prodigy_debut":
			return "gema"
		"veteran_goals":
			return "reloj"
		"ball_boy_hit", "finals_lost", "dog_seen":
			return "partido"
		"pet_pika":
			return "mascota"
		"apretones", "apretones_ganados":
			return "apreton"
		"truenos", "dt_pechos":
			return "grada"
		"himnos_serios", "himnos_pillados":
			return "camara"


		"socio_hat_tricks":
			return "asist"
		"socio_double_hat_tricks":
			return "gol"
		"cesion_dada", "cesion_negada", "ahijado":
			return "partido"
		"duel_wins", "derby_wins", "bosman", "loan_done":
			return "partido"


		"loan_club_best":
			return "corazon"
		"late_goals", "derby_goals":
			return "bota"


		"comeback_wins":
			return "marcador"
		"best_money":
			return "dinero"
		"sponsors_signed":
			return "contrato"
		"decisions":
			return "dialogo"
		"lifestyle_items":
			return "coche"
		"investments":
			return "maletin"
		"rebirth_done":
			return "fenix"
		"countries_played":
			return "mundial"
		"rare_complete":
			return "balon_oro"
		"amigos", "amigos_cross", "amigos_lider", "padrino":
			return "relaciones"
		"liga_podio", "liga_campeon":
			return "torneos"
		"reto_amigo", "reto_amigo_gana", "reto_amigo_pleno":
			return "penal"








		"house_level":
			return "casa"
		"house_extras":
			return "mueble"
		"academia":
			return "academia"
		"snake":
			return "serpiente"
		"simulador", "simulador_compacto", "simulador_carreras", "simulador_limpia", \
				"simulador_monedas", "simulador_pie", "simulador_garaje":
			return "coche"
		"pareja_formal", "pareja_anios", "ley_de_mama":
			return "corazon"
		"matches":
			return "camiseta"
		"seasons":
			return "reloj"
		"keeper_passes":
			return "guante"
		"bottles_hit":
			return "botella"



		"pigeons_hit":
			return "pluma"
		"glass_broken":
			return "cristal"
		"cams_hit":
			return "camara"



		"fan_photos":
			return "camara"

		"ballboy_stalls":
			return "reloj"


		"net_ropes_staff":
			return "gol_ano"




		"sprinklers_broken":
			return "aspersor"
		"beers_spilled":
			return "vaso"



		"vendor_hits":
			return "bandeja"


		"drone_hits":
			return "dron"


		"beach_goals":
			return "playa"
		"viral_videos":
			return "viral"
		"heckler_answered":
			return "silbato"
		"street_balls_out":
			return "muro"


		"dugout_hits", "dugout_own", "dugout_rival", "dugout_coach_own", \
				"dugout_coach_rival":
			return "banquillo"
		"comeback_goal":
			return "marcador"

		"award", "award_streak":






			var e: Dictionary = Trophies.CATALOG.get(String(a.get("award", "")), {})
			if not e.is_empty():
				return String(e.get("type", "desconocido"))






	return "desconocido"



func progress_ratio(id: String) -> float:
	var e: Dictionary = _by_id(id)
	if e.is_empty():
		return 0.0
	var t: int = _target(e)
	if t <= 0:
		return 0.0
	return clampf(float(_measure(e)) / float(t), 0.0, 1.0)





func progreso(id: String) -> Vector2i:
	var e: Dictionary = _by_id(id)
	if e.is_empty():
		return Vector2i.ZERO
	return Vector2i(_measure(e), _target(e))


































func _en_la_escuela() -> bool:
	return GameState.tutorial_active or GameState.practica_en_curso



func unlock(id: String) -> bool:
	if _en_la_escuela():
		return false
	if _unlocked.has(id):
		return false
	_unlocked[id] = {"season": GameState.season_num,
		"ts": int(Time.get_unix_time_from_system())}
	pending.append(id)

	(progress["logros_unseen"] as Dictionary)[id] = true







	if id == "libro_completo" and not bool(progress.get("barbacoa", false)):
		progress["barbacoa"] = true
		Career.queue_ceremony(Ceremonies.BARBACOA)
	_quiza_museo_ego()
	if not _bulk:
		_save()
	unlocked.emit(id)
	return true







func _quiza_museo_ego() -> void:
	if bool(progress.get("museo_ego", false)):
		return
	for e in CATALOG:
		if not _unlocked.has(String(e["id"])):
			return
	progress["museo_ego"] = true
	Career.queue_ceremony(Ceremonies.MUSEO_EGO)






func revisar_simulador() -> Array[String]:
	var nuevos: Array[String] = []
	if _en_la_escuela():
		return nuevos
	_bulk = true
	for e in CATALOG:
		var id: String = String(e["id"])
		if String(e.get("kind", "")).begins_with("simulador") and not _unlocked.has(id) \
				and _meets(e) and unlock(id):
			nuevos.append(id)
	_bulk = false
	if not nuevos.is_empty():
		_save()
	return nuevos




func check() -> Array:
	if _en_la_escuela():
		return []
	_ingest()
	var fresh: Array = []


	_bulk = true
	for e in CATALOG:
		var id: String = String(e["id"])
		if not _unlocked.has(id) and _meets(e):
			if unlock(id):
				fresh.append(id)
	_bulk = false
	if not fresh.is_empty():
		_save()
	return fresh





func _cbucket() -> Dictionary:
	var all: Dictionary = progress["career_counters"]
	var k: String = "s%d" % SaveSlots.active
	if not all.has(k):
		all[k] = {}
	return all[k]


func _cget(key: String) -> int:
	return int(_cbucket().get(key, 0))


func _cbump(key: String, n: int = 1) -> void:
	if n <= 0:
		return
	var b: Dictionary = _cbucket()
	b[key] = int(b.get(key, 0)) + n


func _cmax(key: String, v: int) -> void:
	var b: Dictionary = _cbucket()
	b[key] = maxi(int(b.get(key, 0)), v)






func reset_career() -> void:
	(progress["career_counters"] as Dictionary)["s%d" % SaveSlots.active] = {}
	_save()





















func _played_div() -> int:
	if Career.season_history.is_empty():
		return GameState.player_div()
	return int(Career.season_history.back().get("div", GameState.player_div()))





func ingest_season_result(result: Dictionary, season_awards: Array = []) -> void:









	var coronas: int = 0
	if Career.season_history.is_empty():
		var torneos: Array = result.get("torneos_coronados", result.get("ligas_ganadas", []))
		if _played_div() == 1:
			coronas = torneos.size()
			if bool(result.get("won_league", false)) \
					and bool(result.get("liga_entera", torneos.is_empty())):
				coronas += 1
	else:
		var temporada: int = int(Career.season_history.back().get("season", 0))
		for row in Career.season_history:
			if int(row.get("season", 0)) == temporada and int(row.get("div", 0)) == 1:
				coronas +=(row.get("awards", []) as Array).count("Campeón de Liga")
	if coronas > 0:
		progress["top_league_titles"] = int(progress["top_league_titles"]) + coronas
	if _is_history_sweep(season_awards):
		progress["history_best"] = true



	if _is_perfect_season(season_awards) and not Career.season_history.is_empty() \
			and _played_div() == 1:
		progress["perfect_season"] = true






	if season_awards.has("Pichichi de la Liga"):
		if season_awards.has("Máximo Asistente de la Liga"):
			progress["scorer_assist_double"] = true
		for bota in _botas_top():
			if season_awards.has(bota):
				progress["boot_double"] = true
				break




	if season_awards.has(ClubGala.AWARD_BEST) and not Career.season_history.is_empty() \
			and bool(Career.season_history.back().get("loan", false)):
		progress["loan_club_best"] = true



	if season_awards.has("Balón de Oro") and Career.age - 1 < 19:
		progress["balon_joven"] = true


	if season_awards.has("Campeón de Liga") and season_awards.has("Campeón de Copa") \
			and _played_div() == 1:
		for top in Continental.titulos_top():
			if season_awards.has(top):
				progress["triplete"] = true
				break



	if String(result.get("euro_entrada", "")) == "Q1":
		for copa in ["Campeón de Champions", "Campeón de Europa League", "Campeón de Conference"]:
			if season_awards.has(copa):
				progress["desde_q1"] = true
				break


	if not Career.season_history.is_empty():
		var div: int = _played_div()
		if div > 0:
			(progress["divs_completed"] as Dictionary)[div] = true
	_save()




func ingest_match(goals: int, es_final: bool = false) -> void:
	if _en_la_escuela():
		return
	progress["best_match_goals"] = maxi(int(progress["best_match_goals"]), goals)
	if es_final:
		progress["best_final_goals"] = maxi(int(progress.get("best_final_goals", 0)), goals)
	_save()




func ingest_camera_hit() -> void:
	if _en_la_escuela():
		return
	progress["cams_hit"] = int(progress.get("cams_hit", 0)) + 1
	check()
	_save()




func ingest_vendor_hit() -> void:
	if _en_la_escuela():
		return
	progress["vendor_hits"] = int(progress.get("vendor_hits", 0)) + 1
	check()
	_save()




func ingest_drone_hit() -> void:
	if _en_la_escuela():
		return
	progress["drone_hits"] = int(progress.get("drone_hits", 0)) + 1
	check()
	_save()




func ingest_beach_goal() -> void:
	if _en_la_escuela():
		return
	progress["beach_goals"] = int(progress.get("beach_goals", 0)) + 1
	check()
	_save()




func ingest_viral_video() -> void:
	if _en_la_escuela():
		return
	progress["viral_videos"] = int(progress.get("viral_videos", 0)) + 1
	check()
	_save()




func ingest_bottle_hit() -> void:
	if _en_la_escuela():
		return
	progress["bottles_hit"] = int(progress.get("bottles_hit", 0)) + 1
	check()
	_save()





func ingest_fan_photo() -> void:
	if _en_la_escuela():
		return
	progress["fan_photos"] = int(progress.get("fan_photos", 0)) + 1
	check()
	_save()




func ingest_balonero_lento() -> void:
	if _en_la_escuela():
		return
	progress["ballboy_stalls"] = int(progress.get("ballboy_stalls", 0)) + 1
	check()
	_save()




func ingest_cuerdas_red() -> void:
	if _en_la_escuela():
		return
	progress["net_ropes_staff"] = int(progress.get("net_ropes_staff", 0)) + 1
	check()
	_save()




func ingest_pigeon_hit() -> void:
	if _en_la_escuela():
		return
	progress["pigeons_hit"] = int(progress.get("pigeons_hit", 0)) + 1
	check()
	_save()





func ingest_box_glass() -> void:
	if _en_la_escuela():
		return
	progress["glass_broken"] = int(progress.get("glass_broken", 0)) + 1
	check()
	_save()






func ingest_sprinkler_break() -> void:
	if _en_la_escuela():
		return
	progress["sprinklers_broken"] = int(progress.get("sprinklers_broken", 0)) + 1
	check()
	_save()







func ingest_beer_spill() -> void:
	if _en_la_escuela():
		return
	progress["beers_spilled"] = int(progress.get("beers_spilled", 0)) + 1
	check()
	_save()





func ingest_street_ball() -> void:
	if _en_la_escuela():
		return
	progress["street_balls_out"] = int(progress.get("street_balls_out", 0)) + 1
	check()
	_save()





func ingest_bullseye() -> void:
	if _en_la_escuela():
		return
	progress["bullseye"] = int(progress.get("bullseye", 0)) + 1
	check()
	_save()





const ID_DOMINADAS: String = "dominadas_100"


func ingest_dominadas(toques: int) -> bool:
	if _en_la_escuela() or toques <= int(progress.get("dominadas", 0)):
		return false
	progress["dominadas"] = toques
	var antes: bool = is_unlocked(ID_DOMINADAS)
	check()
	_save()
	return not antes and is_unlocked(ID_DOMINADAS)





func ingest_amigos(amigos: Array, mi_plataforma: String, mi_legado: int) -> void:
	progress["amigos_max"] = maxi(int(progress.get("amigos_max", 0)), amigos.size())
	var con_carrera: int = 0
	var por_delante: bool = true
	for a in amigos:
		var pf: String = String(a.get("plataforma", ""))
		if mi_plataforma != "" and pf != "" and pf != mi_plataforma:
			progress["amigos_cross"] = 1
		if int(a.get("legacy", 0)) > 0:
			con_carrera += 1
		if int(a.get("legacy", 0)) >= mi_legado:
			por_delante = false
	if con_carrera >= 3 and por_delante and mi_legado > 0:
		progress["amigos_lider"] = 1
	check()
	_save()




func ingest_reto_jugado(marca: int, jugadas: int) -> void:
	progress["reto_amigo"] = int(progress.get("reto_amigo", 0)) + 1
	if jugadas >= 10 and marca >= jugadas:
		progress["reto_amigo_pleno"] = 1
	check()
	_save()


func ingest_reto_ganado() -> void:
	progress["reto_amigo_gana"] = int(progress.get("reto_amigo_gana", 0)) + 1
	check()
	_save()



func ingest_padrino(cumplidos: int) -> void:
	progress["padrino"] = maxi(int(progress.get("padrino", 0)), cumplidos)
	check()
	_save()




func ingest_liga(puesto: int) -> void:
	if puesto >= 1 and puesto <= 3:
		progress["liga_podio"] = int(progress.get("liga_podio", 0)) + 1
	if puesto == 1:
		progress["liga_campeon"] = int(progress.get("liga_campeon", 0)) + 1
	check()
	_save()







func ingest_billar_win() -> void:
	progress["billar_wins"] = int(progress.get("billar_wins", 0)) + 1
	check()
	_save()








func ingest_refuerzo() -> void:
	progress["refuerzos"] = int(progress.get("refuerzos", 0)) + 1
	check()
	_save()










func revisa_logros_regalados(solo: Array = []) -> void:
	if not _cargado:
		revisa_logros_regalados.call_deferred(solo)
		return
	if bool(progress.get("revision_20261012", false)):
		return
	var historiales: Array = solo if not solo.is_empty() else [Career.season_history]
	for slot in (0 if not solo.is_empty() else SaveSlots.count()):
		if slot == SaveSlots.active or not SaveSlots.has_career(slot):
			continue
		var cfg: ConfigFile = ConfigFile.new()
		if SaveSlots.load_cfg(cfg, SaveSlots.slot_path("career_meta.cfg", slot)) == OK:
			var h: Variant = cfg.get_value("season", "history", [])
			if h is Array:
				historiales.append(h)
	for placa in ([] if not solo.is_empty() else SalonFama.placas()):
		var h2: Variant =(placa.get("museo", {}) as Dictionary).get("season_history", [])
		if h2 is Array:
			historiales.append(h2)
	var titulos_primera: int = 0
	var trotamundos: bool = false
	for h in historiales:
		var clubes: Dictionary = {}
		for row in h:
			if not row is Dictionary:
				continue
			var aw: Array =(row as Dictionary).get("awards", []) as Array
			var ligas: int = aw.count("Campeón de Liga")
			if ligas == 0:
				continue
			clubes[String(row.get("club", ""))] = true
			if int(row.get("div", 0)) == 1:
				titulos_primera += ligas
		if clubes.size() >= 3:
			trotamundos = true

	progress["top_league_titles"] = mini(int(progress["top_league_titles"]), titulos_primera)
	for par in [["campeon_primera", titulos_primera > 0], ["trotamundos", trotamundos]]:
		if not bool(par[1]) and _unlocked.has(par[0]):
			_unlocked.erase(par[0])
			_seen.erase(par[0])
			pending.erase(par[0])
	progress["revision_20261012"] = true
	_save()








func resync_refuerzos(n: int) -> void:



	if not _cargado:
		resync_refuerzos.call_deferred(n)
		return
	if n <= int(progress.get("refuerzos", 0)):
		return
	progress["refuerzos"] = n
	check()
	_save()


func ingest_reto_casa() -> void:
	progress["retos_casa"] = int(progress.get("retos_casa", 0)) + 1
	check()
	_save()











func ingest_cesion_penal(dio: bool) -> void:
	if _en_la_escuela():
		return
	var key: String = "cesion_dada" if dio else "cesion_negada"
	progress[key] = int(progress.get(key, 0)) + 1
	check()
	_save()




func ingest_ahijado() -> void:
	if _en_la_escuela():
		return
	progress["ahijado"] = int(progress.get("ahijado", 0)) + 1
	check()
	_save()







func ingest_sextete() -> void:
	if _en_la_escuela():
		return
	progress["sextete"] = true
	check()
	_save()




func ingest_ley_de_mama() -> void:
	if _en_la_escuela():
		return
	progress["ley_de_mama"] = int(progress.get("ley_de_mama", 0)) + 1
	check()
	_save()







const PIKA_NOMBRES: Array[String] = ["pikachu", "ピカチュウ"]

const PIKA_CELEB: String = "g_pika"


static func es_nombre_pika(nombre: String) -> bool:
	return PIKA_NOMBRES.has(nombre.strip_edges().to_lower())


func ingest_pet_name(nombre: String) -> void:
	if _en_la_escuela() or not es_nombre_pika(nombre):
		return
	if bool(progress.get("pet_pika", false)):
		return
	progress["pet_pika"] = true


	Settings.desbloquea_celeb(PIKA_CELEB)
	check()
	_save()


func ingest_ball_boy_hit() -> void:
	if _en_la_escuela():
		return
	progress["ball_boy_hit"] = int(progress.get("ball_boy_hit", 0)) + 1
	check()
	_save()









func ingest_trueno() -> void:
	if _en_la_escuela():
		return
	progress["truenos"] = int(progress.get("truenos", 0)) + 1
	check()
	_save()





func ingest_dt_pecho() -> void:
	if _en_la_escuela():
		return
	progress["dt_pechos"] = int(progress.get("dt_pechos", 0)) + 1
	check()
	_save()




func ingest_himno(serio: bool) -> void:
	if _en_la_escuela():
		return
	var k: String = "himnos_serios" if serio else "himnos_pillados"
	progress[k] = int(progress.get(k, 0)) + 1
	check()
	_save()


func ingest_apreton(ganado: bool = false) -> void:
	if _en_la_escuela():
		return
	progress["apretones"] = int(progress.get("apretones", 0)) + 1
	if ganado:
		progress["apretones_ganados"] = int(progress.get("apretones_ganados", 0)) + 1
	check()
	_save()












func ingest_dugout_hit(yours: bool, role: String) -> void:
	if _en_la_escuela():
		return
	progress["dugout_hits"] = int(progress.get("dugout_hits", 0)) + 1
	_cbump("dugout_hits")
	var key: String = ""
	if role == "coach":
		key = "dugout_coach_own" if yours else "dugout_coach_rival"
	elif role == "sub":
		key = "dugout_own" if yours else "dugout_rival"
	if not key.is_empty():
		progress[key] = int(progress.get(key, 0)) + 1
	check()
	_save()





func ingest_final_lost() -> void:
	progress["finals_lost"] = int(progress.get("finals_lost", 0)) + 1
	check()
	_save()





func ingest_revancha() -> void:
	progress["revanchas"] = int(progress.get("revanchas", 0)) + 1
	check()
	_save()






func ingest_socio_hat_trick(both: bool) -> void:
	progress["socio_hat_tricks"] = int(progress.get("socio_hat_tricks", 0)) + 1
	if both:
		progress["socio_double_hat_tricks"] = \
				int(progress.get("socio_double_hat_tricks", 0)) + 1
	check()
	_save()




func ingest_kit_reveal() -> void:
	progress["kit_reveals"] = int(progress.get("kit_reveals", 0)) + 1
	check()
	_save()




func ingest_museo() -> void:
	progress["museo_visitas"] = int(progress.get("museo_visitas", 0)) + 1
	check()
	_save()







func ingest_autografo(fans: int = 0) -> void:
	progress["autografos"] = int(progress.get("autografos", 0)) + 1
	progress["autografos_max_fans"] = maxi(int(progress.get("autografos_max_fans", 0)), fans)
	check()
	_save()




func ingest_firmas(n: int = 1) -> void:
	progress["firmas"] = int(progress.get("firmas", 0)) + maxi(n, 0)
	check()
	_save()








func ingest_club_match(ctx: Dictionary) -> void:
	if _en_la_escuela() or int(ctx.get("minutes", 0)) <= 0:
		return
	var goals: int = int(ctx.get("goals", 0))
	var host: String = String(ctx.get("host", ""))
	if not host.is_empty():
		(progress["stadiums_played"] as Dictionary)[host] = true
	if goals > 0 and bool(ctx.get("ex", false)):
		progress["ex_club_goals"] = int(progress.get("ex_club_goals", 0)) + goals
	if goals > 0 and bool(ctx.get("debut", false)):
		progress["debut_goals"] = int(progress.get("debut_goals", 0)) + goals
	var age: int = int(ctx.get("age", 0))
	if int(ctx.get("div", 0)) == 1 and age > 0 and age < 18:
		progress["prodigy_debut"] = true
	if goals > 0 and age >= 38:
		progress["veteran_goals"] = int(progress.get("veteran_goals", 0)) + goals
	_save()




func ingest_shootout_winner() -> void:
	if _en_la_escuela():
		return
	progress["shootout_winners"] = int(progress.get("shootout_winners", 0)) + 1
	check()
	_save()




func ingest_iron_season() -> void:
	if _en_la_escuela():
		return
	progress["iron_seasons"] = int(progress.get("iron_seasons", 0)) + 1
	_save()





func ingest_keeper_pass() -> void:
	if _en_la_escuela():
		return
	progress["keeper_passes"] = int(progress.get("keeper_passes", 0)) + 1
	check()
	_save()





func ingest_match_detail(detail: Dictionary) -> void:
	if detail.is_empty():
		return
	progress["penalty_goals"] = int(progress["penalty_goals"]) + int(detail.get("penal_goals", 0))
	progress["freekick_goals"] = int(progress["freekick_goals"]) + int(detail.get("freekick_goals", 0))
	_cbump("penalty_goals", int(detail.get("penal_goals", 0)))
	_cbump("freekick_goals", int(detail.get("freekick_goals", 0)))
	progress["corner_goals"] = int(progress["corner_goals"]) + int(detail.get("corner_goals", 0))


	progress["olympic_goals"] = int(progress["olympic_goals"]) + int(detail.get("olympic_goals", 0))
	progress["freekick_under_goals"] = int(progress.get("freekick_under_goals", 0)) \
			+ int(detail.get("freekick_under_goals", 0))


	progress["panenka_goals"] = int(progress["panenka_goals"]) + int(detail.get("panenka_goals", 0))

	for k in ["header_goals", "volley_goals", "bicycle_goals"]:
		progress[k] = int(progress.get(k, 0)) + int(detail.get(k, 0))


	if bool(detail.get("dog_seen", false)):
		progress["dog_seen"] = true



	if bool(detail.get("heckler_answered", false)):
		progress["heckler_answered"] = true
	var g: int = int(detail.get("goals", 0))
	var a: int = int(detail.get("assists", 0))
	if bool(detail.get("is_nat", false)):
		progress["lifetime_nat_goals"] = int(progress["lifetime_nat_goals"]) + g
		progress["lifetime_nat_assists"] = int(progress["lifetime_nat_assists"]) + a
	var comp: String = String(detail.get("comp", ""))









	if g > 0 and (comp in ["ucl", "eul", "conf", "cwc", "nat_cont"] \
			or Continental.es_americana(comp)):
		progress["scored_cont"] = true
	if g > 0 and comp == "nat_wc":
		progress["scored_wc"] = true


	progress["duel_wins"] = int(progress["duel_wins"]) + int(detail.get("duel_wins", 0))
	progress["late_goals"] = int(progress["late_goals"]) + int(detail.get("late_goals", 0))
	progress["derby_goals"] = int(progress["derby_goals"]) + int(detail.get("derby_goals", 0))
	_cbump("duel_wins", int(detail.get("duel_wins", 0)))
	_cbump("late_goals", int(detail.get("late_goals", 0)))
	if bool(detail.get("derby_win", false)):
		progress["derby_wins"] = int(progress["derby_wins"]) + 1
		_cbump("derby_wins")
	if bool(detail.get("comeback_win", false)):
		progress["comeback_wins"] = int(progress["comeback_wins"]) + 1
	_save()










func ingest_comeback_goal() -> void:
	if _en_la_escuela():
		return
	if bool(progress["comeback_goal"]):
		return
	progress["comeback_goal"] = true
	_save()


func ingest_retire(reason: String = "eleccion") -> void:
	if not Career.start_club.is_empty() and Career.start_club == GameState.player_team_id:
		progress["circle_complete"] = true


	if Career.pareja_activa():
		ingest_pareja(String(Career.pareja.get("id", "")), Career.pareja_nombre())


	if carrera_de_un_club():
		progress["one_club_career"] = true





	match reason:
		"edad":
			progress["retired_by_age"] = true


		"lesion":
			progress["retired_injury"] = true
		_:
			progress["retired_early"] = true



	if _titulo_en(Career.current_season_awards()) or (not Career.season_history.is_empty() \
			and _titulo_en(Career.season_history.back().get("awards", []) as Array)):
		progress["ultimo_baile"] = true


	if not Career.active_mods.is_empty():
		progress["rebirth_done"] = true
	_save()







func ingest_nat_captain() -> void:
	if bool(progress.get("nat_captain", false)):
		return
	progress["nat_captain"] = true
	_save()
	check()


func ingest_nat_retire() -> void:
	progress["nat_retired_early"] = true
	_save()






func ingest_transfer(club_id: String) -> void:
	if int(GameState.club_matches.get(club_id, 0)) > 0:
		progress["returned_club"] = true



	var div: int = GameState.div_of(club_id)
	if div > 0:
		(progress["divs_signed"] as Dictionary)[div] = true
	_save()









const NINE_ELITE_RATING: int = 82


func ingest_shirt(number: int, club_id: String) -> void:
	if number == 10:
		progress["shirt_ten"] = true
	if number == 9 and Teams.rating(club_id) >= NINE_ELITE_RATING:
		progress["shirt_nine_elite"] = true
	_save()










func ingest_presentation(data: Dictionary) -> void:
	if data.is_empty():
		return
	progress["presentations"] = int(progress["presentations"]) + 1
	progress["best_presentation_fans"] = maxi(
		int(progress["best_presentation_fans"]), int(data.get("fans", 0)))
	if String(data.get("tier", "")) == "historico":
		progress["presentations_full"] = int(progress["presentations_full"]) + 1
		_cbump("presentations_full")
	_save()
	check()




func ingest_sponsor() -> void:
	progress["sponsors_signed"] = int(progress["sponsors_signed"]) + 1
	_cbump("sponsors_signed")
	_save()
	check()




func ingest_decision() -> void:
	progress["decisions_taken"] = int(progress["decisions_taken"]) + 1
	_cbump("decisions_taken")
	_save()
	check()



func ingest_bosman() -> void:
	progress["bosman_signed"] = true
	_save()
	check()



func ingest_loan_end() -> void:
	progress["loan_completed"] = true
	_save()
	check()




func _meets(e: Dictionary) -> bool:
	var t: int = _target(e)
	return t > 0 and _measure(e) >= t





func _target(e: Dictionary) -> int:
	match String(e["kind"]):
		"beat_country":
			return _total_in_country(String(e.get("country", "")))
		"beat_all":
			return _beatable_ids().size()
		"libro_continente":
			return int(libro_cuenta()["tot"].get(String(e.get("confed", "")), 0))
		"libro_todo":
			return int(libro_cuenta()["tot"].get("*", 0))
		"rare_complete":
			return _rare_total(int(e.get("tier", RARE_COMMON)))
		"parejas_album":
			return Pareja.all().size()
		"album_total":
			return Trophies.album_total()
	return int(e.get("n", 1))



func _measure(e: Dictionary) -> int:
	match String(e["kind"]):
		"goals":
			return GameState.career_goals
		"assists":
			return GameState.career_assists
		"matches":
			return GameState.matches_played
		"seasons":
			return Career.seasons_played()
		"balon":
			return Career.awards.count("Balón de Oro")
		"ballon_segundo":
			return _galas_de_segundo()
		"top_league":
			return int(progress["top_league_titles"])
		"best_match_goals":
			return int(progress["best_match_goals"])
		"best_final_goals":
			return int(progress.get("best_final_goals", 0))
		"distinct_league_clubs":
			return _career_league_clubs()
		"top5_leagues":
			return _career_top5_leagues()
		"confeds":
			return _career_confeds()
		"trophy_types":
			return _career_trophy_types()
		"club_league_max":
			return _max_league_titles_one_club()
		"league_streak":
			return _longest_league_streak()
		"award_streak":
			return _longest_award_streak(String(e.get("award", "")))
		"champions_clubs":




			return _distinct_clubs_with(["Campeón de Champions"])
		"cont_clubs":



			return _distinct_clubs_with(e.get("awards", []) as Array)
		"dos_mundos":


			var aw: Array = Career.awards
			var europa: bool = aw.has(Continental.titulo("ucl"))
			var america: bool = aw.has(Continental.titulo("lib")) \
					or aw.has(Continental.titulo("cca"))
			return 1 if europa and america else 0
		"penalty_goals":
			return _cget("penalty_goals")
		"freekick_goals":
			return _cget("freekick_goals")
		"corner_goals":
			return int(progress["corner_goals"])
		"olympic_goals":
			return int(progress["olympic_goals"])
		"freekick_under_goals":
			return int(progress.get("freekick_under_goals", 0))
		"panenka_goals":
			return int(progress["panenka_goals"])
		"header_goals":
			return int(progress.get("header_goals", 0))
		"volley_goals":
			return int(progress.get("volley_goals", 0))
		"bicycle_goals":
			return int(progress.get("bicycle_goals", 0))
		"dog_seen":
			return 1 if bool(progress.get("dog_seen", false)) else 0
		"pet_pika":
			return 1 if bool(progress.get("pet_pika", false)) else 0
		"nat_goals":
			return int(progress["lifetime_nat_goals"])
		"nat_assists":
			return int(progress["lifetime_nat_assists"])
		"nat_caps":

			return Career.nat_caps
		"club_matches":
			return _max_club_matches()
		"comeback_goal":
			return 1 if bool(progress.get("comeback_goal", false)) else 0
		"scored_cont":
			return 1 if bool(progress["scored_cont"]) else 0
		"scored_wc":
			return 1 if bool(progress["scored_wc"]) else 0
		"history_best":
			return 1 if bool(progress["history_best"]) else 0
		"perfect_season":
			return 1 if bool(progress.get("perfect_season", false)) else 0
		"circle":
			return 1 if bool(progress["circle_complete"]) else 0
		"scorer_countries":
			return _career_scorer_countries()
		"scorer_assist_double":
			return 1 if bool(progress["scorer_assist_double"]) else 0
		"boot_double":
			return 1 if bool(progress["boot_double"]) else 0
		"retire_age":
			return 1 if bool(progress["retired_by_age"]) else 0
		"retire_early":
			return 1 if bool(progress["retired_early"]) else 0
		"balon_joven":
			return 1 if bool(progress.get("balon_joven", false)) else 0
		"triplete":
			return 1 if bool(progress.get("triplete", false)) else 0
		"desde_q1":
			return 1 if bool(progress.get("desde_q1", false)) else 0
		"sextete":
			return 1 if bool(progress.get("sextete", false)) else 0
		"ultimo_baile":
			return 1 if bool(progress.get("ultimo_baile", false)) else 0
		"de_la_nada":
			return 1 if _de_la_nada() else 0
		"album_confed":
			return 1 if _album_confed_completo() else 0
		"album_total":
			return Herencia.vitrina_count()
		"retire_injury":


			return 1 if bool(progress.get("retired_injury", false)) else 0
		"nat_retire":
			return 1 if bool(progress["nat_retired_early"]) else 0
		"nat_captain":
			return 1 if bool(progress.get("nat_captain", false)) else 0
		"one_club_career":
			return 1 if bool(progress["one_club_career"]) else 0
		"returned_club":
			return 1 if bool(progress["returned_club"]) else 0
		"shirt_ten":
			return 1 if bool(progress["shirt_ten"]) else 0
		"shirt_nine_elite":
			return 1 if bool(progress["shirt_nine_elite"]) else 0
		"season_div":




			var d: int = int(e.get("n", 0))
			return d if (progress["divs_completed"] as Dictionary).has(d) else 0
		"club_legend":
			return 1 if _user_in_club_top() else 0
		"club_streak":


			return _mejor_racha_propia()
		"legends_passed":


			return Career.legends_passed.size()
		"records_broken":

			return Career.records_broken.size()
		"award":
			return Career.awards.count(String(e["award"]))
		"skills_avg":
			return int(Career.skills_avg())
		"best_rating":
			return int(GameState.best_rating * 10.0)
		"tier":
			return _tier_index(String(Career.legacy_tier().get("name", "")))
		"beat_country":
			return _beaten_in_country(String(e.get("country", "")))
		"beat_all":



			var pool: Dictionary = _beatable_ids()
			var n: int = 0
			for id in (progress["clubs_beaten"] as Dictionary):
				if pool.has(String(id)):
					n += 1
			return n
		"presentations":
			return int(progress["presentations"])
		"presentations_full":
			return _cget("presentations_full")
		"presentation_fans":
			return int(progress["best_presentation_fans"])
		"duel_wins":
			return _cget("duel_wins")
		"late_goals":
			return _cget("late_goals")
		"comeback_wins":
			return int(progress["comeback_wins"])
		"derby_goals":
			return int(progress["derby_goals"])
		"derby_wins":
			return _cget("derby_wins")
		"best_money":
			return _cget("money_peak")
		"sponsors_signed":
			return _cget("sponsors_signed")
		"decisions":
			return _cget("decisions_taken")
		"lifestyle_items":
			return 1 if bool(progress["lifestyle_bought"]) else 0
		"investments":
			return 1 if bool(progress["invested"]) else 0
		"bosman":
			return 1 if bool(progress["bosman_signed"]) else 0
		"loan_done":
			return 1 if bool(progress["loan_completed"]) else 0
		"loan_club_best":
			return 1 if bool(progress["loan_club_best"]) else 0
		"countries_played":
			return _career_countries_played()
		"rebirth_done":
			return 1 if bool(progress["rebirth_done"]) else 0
		"rare_complete":
			return _rare_unlocked(int(e.get("tier", RARE_COMMON)))
		"house_level":
			return int(progress.get("best_house_level", 0))
		"house_extras":
			return int(progress.get("best_house_extras", 0))
		"snake":


			return int(Settings.snake_best)
		"simulador":
			return 1 if Settings.simulador_reto else 0
		"simulador_compacto":
			return 1 if Settings.simulador_oro(preload("res://features/career/simulador.gd").COCHE_INCLUIDO) else 0
		"simulador_carreras":
			return Settings.simulador_carreras
		"simulador_limpia":
			return 1 if Settings.simulador_limpia else 0
		"simulador_monedas":
			return Settings.simulador_monedas
		"simulador_pie":
			return 1 if Settings.simulador_pie else 0
		"simulador_garaje":
			return Settings.simulador_oros()
		"dardos":
			return int(Settings.dardos_best)
		"billar":
			return int(Settings.billar_best)
		"billar_wins":
			return int(progress.get("billar_wins", 0))
		"amigos":
			return int(progress.get("amigos_max", 0))
		"amigos_cross":
			return int(progress.get("amigos_cross", 0))
		"amigos_lider":
			return int(progress.get("amigos_lider", 0))
		"reto_amigo", "reto_amigo_gana", "reto_amigo_pleno", "padrino", "liga_podio", "liga_campeon":
			return int(progress.get(String(e["kind"]), 0))
		"retos_casa":
			return int(progress.get("retos_casa", 0))






		"refuerzos":
			return int(progress.get("refuerzos", 0))
		"bullseye":
			return int(progress.get("bullseye", 0))
		"dominadas":
			return int(progress.get("dominadas", 0))
		"academia":
			return 1 if bool(Settings.academia_done) else 0
		"pareja_formal":
			return 1 if bool(progress.get("pareja_formalized", false)) else 0
		"pareja_anios":
			return int(progress.get("best_pareja_anios", 0))
		"ley_de_mama":
			return int(progress.get("ley_de_mama", 0))
		"cams_hit":
			return int(progress.get("cams_hit", 0))
		"bottles_hit":
			return int(progress.get("bottles_hit", 0))
		"vendor_hits":
			return int(progress.get("vendor_hits", 0))
		"drone_hits":
			return int(progress.get("drone_hits", 0))
		"beach_goals":
			return int(progress.get("beach_goals", 0))
		"viral_videos":
			return int(progress.get("viral_videos", 0))
		"fan_photos":
			return int(progress.get("fan_photos", 0))
		"ballboy_stalls":
			return int(progress.get("ballboy_stalls", 0))
		"net_ropes_staff":
			return int(progress.get("net_ropes_staff", 0))
		"pigeons_hit":
			return int(progress.get("pigeons_hit", 0))
		"glass_broken":
			return int(progress.get("glass_broken", 0))
		"sprinklers_broken":
			return int(progress.get("sprinklers_broken", 0))
		"beers_spilled":
			return int(progress.get("beers_spilled", 0))
		"street_balls_out":
			return int(progress.get("street_balls_out", 0))

		"heckler_answered":
			return 1 if bool(progress.get("heckler_answered", false)) else 0
		"ball_boy_hit":
			return int(progress.get("ball_boy_hit", 0))
		"apretones":
			return int(progress.get("apretones", 0))
		"apretones_ganados":
			return int(progress.get("apretones_ganados", 0))
		"truenos", "dt_pechos", "himnos_serios", "himnos_pillados":
			return int(progress.get(String(e["kind"]), 0))
		"cesion_dada", "cesion_negada", "ahijado":
			return int(progress.get(String(e["kind"]), 0))
		"dugout_hits":
			return _cget("dugout_hits")
		"dugout_own":
			return int(progress.get("dugout_own", 0))
		"dugout_rival":
			return int(progress.get("dugout_rival", 0))
		"dugout_coach_own":
			return int(progress.get("dugout_coach_own", 0))
		"dugout_coach_rival":
			return int(progress.get("dugout_coach_rival", 0))
		"finals_lost":
			return int(progress.get("finals_lost", 0))
		"revanchas":
			return int(progress.get("revanchas", 0))
		"socio_hat_tricks":
			return int(progress.get("socio_hat_tricks", 0))
		"socio_double_hat_tricks":
			return int(progress.get("socio_double_hat_tricks", 0))
		"kit_reveals":
			return int(progress.get("kit_reveals", 0))
		"autografos":
			return int(progress.get("autografos", 0))
		"firmas":
			return int(progress.get("firmas", 0))
		"keeper_passes":
			return int(progress.get("keeper_passes", 0))


		"jersey_top":
			var tops: int = 0
			for row in Career.jersey_history:
				if int((row as Dictionary).get("rank", 0)) == 1:
					tops += 1
			return tops
		"club_captain":
			return 1 if Career.is_captain else 0
		"escenas":
			return Escenas.vividas_count()
		"parejas_album":
			return parejas_vistas_count()
		"libro_continente":
			return int(libro_cuenta()["got"].get(String(e.get("confed", "")), 0))
		"libro_todo":
			return int(libro_cuenta()["got"].get("*", 0))
		"autografos_fans":
			return int(progress.get("autografos_max_fans", 0))
		"stadiums":
			return (progress.get("stadiums_played", {}) as Dictionary).size()
		"prodigy_debut":
			return 1 if bool(progress.get("prodigy_debut", false)) else 0
		"ex_club_goals", "debut_goals", "veteran_goals", "shootout_winners", "iron_seasons", \
				"museo_visitas":
			return int(progress.get(String(e["kind"]), 0))
	return 0








func _galas_de_segundo() -> int:
	var n: int = 0
	for g in Career.ballon_history:
		if not (g is Dictionary):
			continue
		var gd: Dictionary = g
		if int(gd.get("you_rank", 0)) != 2:
			continue
		var podio: Array = gd.get("podium", [])
		if podio.size() >= 2 and bool((podio[1] as Dictionary).get("you", false)):
			n += 1
	return n





func _rare_unlocked(tier: int) -> int:
	var n: int = 0
	for e in CATALOG:
		if int(e.get("rare", RARE_COMMON)) == tier and not e.get("social", false) \
				and String(e["kind"]) != "rare_complete" and _unlocked.has(e["id"]):
			n += 1
	return n


func _rare_total(tier: int) -> int:
	var n: int = 0
	for e in CATALOG:
		if int(e.get("rare", RARE_COMMON)) == tier and String(e["kind"]) != "rare_complete" \
				and not e.get("social", false):
			n += 1
	return n




func _beaten_in_country(country: String) -> int:
	if country.is_empty():
		return 0
	var beaten: Dictionary = progress["clubs_beaten"]
	var n: int = 0
	for t in Teams.teams_of_country(country):
		if beaten.has(String(t.get("id", ""))):
			n += 1
	return n








var _beatable_ids_cache: Dictionary = {}
func _beatable_ids() -> Dictionary:
	if _beatable_ids_cache.is_empty():
		for country in BEATABLE_COUNTRIES:
			for t in Teams.teams_of_country(country):
				_beatable_ids_cache[String(t.get("id", ""))] = true
	return _beatable_ids_cache




var _country_totals: Dictionary = {}
func _total_in_country(country: String) -> int:
	if not _country_totals.has(country):
		_country_totals[country] = Teams.teams_of_country(country).size()
	return int(_country_totals[country])




func _user_in_club_top() -> bool:
	var rows: Array = Legends.for_club(GameState.player_team_id)
	for i in mini(rows.size(), CLUB_LEGEND_TOP):
		if bool((rows[i] as Dictionary).get("user", false)):
			return true
	return false







func _mejor_racha_propia() -> int:
	var hoy: String = GameState.player_team_id
	if hoy.is_empty():
		return 0
	var t: Dictionary = TransferBook.trayectoria_propia(Career.start_club, Career.transfers,
		hoy, not Career.loan.is_empty())
	var etapas: Array = t.get("etapas", [])
	var desde: int = int(t.get("desde", 1))
	var clubes: Array = TransferBook.clubes_de(etapas)
	if not clubes.has(hoy):
		clubes.append(hoy)
	var mejor: int = 0
	for c in clubes:
		var r: Dictionary = TransferBook.racha_max_en(etapas, desde, hoy,
			GameState.season_num, String(c))
		mejor = maxi(mejor, int(r.get("temporadas", 0)))
	return mejor






func carrera_de_un_club() -> bool:
	var hoy: String = GameState.player_team_id
	if hoy.is_empty() or Career.start_club.is_empty():
		return false
	var t: Dictionary = TransferBook.trayectoria_propia(Career.start_club, Career.transfers,
		hoy, not Career.loan.is_empty())
	var etapas: Array = t.get("etapas", [])
	if not TransferBook.club_unico(etapas, hoy):
		return false
	var r: Dictionary = TransferBook.racha_max_en(etapas, int(t.get("desde", 1)), hoy,
		GameState.season_num, hoy)
	return int(r.get("temporadas", 0)) >= Legends.FIEL_TEMPORADAS







func _max_league_titles_one_club() -> int:
	var by_club: Dictionary = {}
	var best: int = 0
	for row in Career.season_history:
		if (row.get("awards", []) as Array).has("Campeón de Liga"):
			var c: String = String(row.get("club", ""))
			by_club[c] = int(by_club.get(c, 0)) + 1
			best = maxi(best, int(by_club[c]))
	return best



func _longest_league_streak() -> int:
	return _longest_award_streak("Campeón de Liga")




func _longest_award_streak(award: String) -> int:
	var cur: int = 0
	var best: int = 0
	for row in Career.season_history:


		if bool(row.get("partial", false)):
			continue
		if (row.get("awards", []) as Array).has(award):
			cur += 1
			best = maxi(best, cur)
		else:
			cur = 0
	return best




func _distinct_clubs_with(any_of: Array) -> int:
	var clubs: Dictionary = {}
	for row in Career.season_history:
		var aw: Array = row.get("awards", [])
		for a in any_of:
			if aw.has(a):
				clubs[String(row.get("club", ""))] = true
				break
	return clubs.size()




func _is_history_sweep(aw: Array) -> bool:
	var liga: bool = aw.has("Campeón de Liga")
	var copa: bool = aw.has("Campeón de Copa")



	var cont: bool = aw.has("Campeón del Mundo de Clubes")
	for t in Continental.titulos_top():
		cont = cont or aw.has(t)
	var balon: bool = aw.has("Balón de Oro")
	var bota: bool = aw.has("Pichichi de la Liga")
	for b in _botas_top():
		bota = bota or aw.has(b)
	return liga and copa and cont and balon and bota




















func _is_perfect_season(aw: Array) -> bool:
	for a in ["Campeón de Liga", "Campeón de Copa",
			"Balón de Oro", "Mejor Jugador de la Liga", "Pichichi de la Liga"]:
		if not aw.has(a):
			return false
	for trio in _trios_top():
		if aw.has(trio[0]) and aw.has(trio[1]) and aw.has(trio[2]):
			return true
	return false






func _trios_top() -> Array:
	var out: Array = [["Campeón de Champions", "Mejor de la Champions", "Bota de la Champions"]]
	for c in Continental.AMER_COMPS:
		if int(Continental.info(c).get("tier", 1)) == 0:
			out.append([Continental.titulo(c), Continental.mejor(c), Continental.bota(c)])
	return out



func _botas_top() -> Array:
	var out: Array = []
	for trio in _trios_top():
		out.append(trio[2])
	return out


func _tier_index(name: String) -> int:
	for i in Legacy.TIERS.size():
		if String(Legacy.TIERS[i]["name"]) == name:
			return i
	return 0








const PISTAS: Dictionary = {
	"cesion_dada": "Ser generoso desde los once metros también tiene premio.",
	"ahijado": "En la cantera hay un chaval que necesita a alguien que crea en él.",
	"cesion_negada": "Desde los once metros, a veces el balón es sólo tuyo.",
	"remontada": "Ningún partido está perdido aunque vayas dos goles abajo.",
	"camarografo": "Los de la tele graban muy pegados a la línea de fondo.",
	"cesion_portero": "No todo balón tiene que acabar en la portería rival.",
	"botellas_portero": "El portero deja algo para beber junto a su poste.",
	"foto_aficionado": "En una final, alguien de la grada quiere un recuerdo contigo.",
	"balonero_lento": "De visita, tarde y perdiendo por la mínima, el balón tarda en volver.",
	"cuerdas_red": "La red no se sostiene sola: algo la tensa por detrás.",
	"paloma": "A veces se posan visitas con alas sobre el césped.",
	"cristal_palco": "Arriba, los del palco miran el partido detrás de un cristal.",
	"nino_balonero": "El que te devuelve los balones espera junto a la banda.",
	"te_elijo": "Hay un nombre amarillo y eléctrico que tus mascotas llevan esperando.",
	"apreton_derbi": "Al acabar un derbi, mira lo que pasa entre los dos banquillos.",
	"apreton_ganado": "En el apretón del derbi, el que aprieta más gana.",
	"banca_rival": "El banquillo de enfrente también está a tiro.",
	"banca_propia": "Tu propio banquillo también está a tiro.",
	"dt_rival": "El míster de enfrente grita de pie en su área técnica.",
	"dt_propio": "Tu propio míster también está de pie en la banda.",
	"banca_desalojo": "A fuerza de balonazos, un banquillo se puede vaciar.",
	"aspersor_roto": "Entre la hierba asoman las cabezas del riego.",
	"cerveza_ronda": "En la grada hay vasos llenos, y los balones que se van caen en algún sitio.",
	"vendedor_bandeja": "En la grada alguien pasea con una bandeja de comida.",
	"dron_derribado": "Algunos partidos los graba un dron desde el cielo.",
	"gol_playa": "A veces cae algo inflable desde la grada.",
	"celular_viral": "Hay quien graba el partido desde detrás de la valla.",
	"abucheo_callado": "Si la grada te abuchea, contéstale donde más duele.",
	"balon_calle": "En algunos campos de barrio no hay nada detrás del arco.",
	"final_perdida": "No todas las finales acaban con la copa en tus manos.",
	"revancha": "Si un club te quita una final, búscalo en otra.",
	"segunda_vida": "Una Nueva Carrera+ con ventajas, jugada hasta el último día.",
	"simulador_pie": "En tu casa hay un volante esperando: ni frenos ni hierba.",
	"snake_50": "La maquinita de tu casa guarda un récord por batir.",
	"dardos_400": "La diana de tu casa premia la puntería fina.",
	"dominadas_100": "Hay balones sueltos por el banquillo, y el míster no siempre mira.",
	"billar_mesa": "En el billar de tu casa, no dejes jugar al rival.",
	"ley_de_mama": "Si te casas, piensa bien a nombre de quién pones la casa.",
	"trueno": "Tras una goleada en casa, la grada espera a que alguien marque el compás.",
	"dt_pecho": "Cuando el balón sale por tu banquillo, a veces el míster no se resiste.",
	"himno_serio": "Con tu selección, el himno se canta serio... aunque el de al lado no ayude.",
	"himno_pillado": "Con tu selección, ojo con quién tienes al lado cuando suena el himno.",
}



func pista(id: String) -> String:
	return String(PISTAS.get(id, ""))



func _row(e: Dictionary) -> Dictionary:
	var row: Dictionary = e.duplicate()
	row["unlocked"] = _unlocked.has(e["id"])
	row["at"] = _unlocked.get(e["id"], {})
	row["ratio"] = progress_ratio(String(e["id"]))
	row["rare"] = int(e.get("rare", RARE_COMMON))


	row["value"] = _measure(e)
	row["target"] = _target(e)
	row["secret"] = bool(e.get("secret", false))
	return row



func by_id(id: String) -> Dictionary:
	return _by_id(id)


func _by_id(id: String) -> Dictionary:
	for e in CATALOG:
		if String(e["id"]) == id:
			return e
	return {}




func _ingest() -> void:
	_accrue("goals", GameState.career_goals)
	_accrue("assists", GameState.career_assists)
	_accrue("matches", GameState.matches_played)



	_accrue("seasons", Career.seasons_played())





	_cmax("money_peak", Career.money)
	if not Career.lifestyle.is_empty():
		progress["lifestyle_bought"] = true
	if not Career.investments.is_empty():
		progress["invested"] = true



	progress["best_house_level"] = maxi(int(progress.get("best_house_level", 0)),
		int(Career.house_level))
	progress["best_house_extras"] = maxi(int(progress.get("best_house_extras", 0)),
		(Career.house_extras as Array).size())



	if String((Career.pareja as Dictionary).get("estado", "")) in ["pareja", "casado"]:
		progress["pareja_formalized"] = true



	progress["best_pareja_anios"] = maxi(
		int(progress.get("best_pareja_anios", 0)), Career.pareja_anios())

	var countries: Dictionary = progress["countries_played"]
	for club in GameState.club_matches:
		if int(GameState.club_matches[club]) > 0:
			var pais: String = Teams.country_of(String(club))
			if not pais.is_empty():
				countries[pais] = true















func _career_countries_played() -> int:
	var paises: Dictionary = {}
	for club in GameState.club_matches:
		if int(GameState.club_matches[club]) > 0:
			var pais: String = Teams.country_of(String(club))
			if not pais.is_empty():
				paises[pais] = true
	return paises.size()





func _career_league_clubs() -> int:
	return _distinct_clubs_with(["Campeón de Liga"])






func _career_trophy_types() -> int:
	var n: int = 0
	for t in COLLECTOR_TROPHIES:
		if t == "Campeón de Champions":
			for top in Continental.titulos_top():
				if Career.awards.has(top):
					n += 1
					break
		elif Career.awards.has(t):
			n += 1
	return n





func _career_scorer_countries() -> int:
	var paises: Dictionary = {}
	for row in Career.season_history:
		var awards: Array =(row as Dictionary).get("awards", []) as Array
		if not awards.has("Pichichi de la Liga"):
			continue
		var pais: String = Teams.country_of(String((row as Dictionary).get("club", "")))
		if not pais.is_empty():
			paises[pais] = true
	return paises.size()






func _career_league_countries(pool: Array = []) -> Dictionary:
	var paises: Dictionary = {}
	for row in Career.season_history:
		var awards: Array =(row as Dictionary).get("awards", []) as Array
		if not awards.has("Campeón de Liga"):
			continue
		if int((row as Dictionary).get("div", 0)) != 1:
			continue
		var pais: String = Teams.country_of(String((row as Dictionary).get("club", "")))
		if pais.is_empty():
			continue
		if pool.is_empty() or pool.has(pais):
			paises[pais] = true
	return paises


func _career_top5_leagues() -> int:
	return _career_league_countries(TOP5_LEAGUES).size()

















func _confed_of(country: String) -> String:
	if country.is_empty():
		return ""
	var c: String = Teams.confed_of_country(country)
	return "" if c == "OTROS" else c




func _titulo_en(awards: Array) -> bool:
	for a in awards:
		var key: String = String(a)
		if key != "Ascenso" and Trophies.CATALOG.has(key) \
				and String(Trophies.CATALOG[key]["kind"]) == "team":
			return true
	return false





func _de_la_nada() -> bool:
	var rows: Array = Career.season_history
	if rows.is_empty() or int((rows[0] as Dictionary).get("div", 1)) < 3:
		return false
	for r in rows:
		if int((r as Dictionary).get("div", 0)) == 1 \
				and ((r as Dictionary).get("awards", []) as Array).has("Campeón de Liga"):
			return true
	return false





func _album_confed_completo() -> bool:
	var por: Dictionary = Trophies.album_por_confed()
	for c in por:
		var claves: Array = por[c]
		var con_copa: bool = false
		var todas: bool = true
		for k in claves:
			if not String(k).begins_with(Trophies.ALBUM_LIGA):
				con_copa = true
			if Herencia.vitrina_veces(String(k)) <= 0:
				todas = false
				break
		if con_copa and todas:
			return true
	return false



func _career_confeds() -> int:
	var confeds: Dictionary = {}
	for pais in _career_league_countries():
		var c: String = _confed_of(pais)
		if not c.is_empty():
			confeds[c] = true
	return confeds.size()



func _max_club_matches() -> int:
	var best: int = 0
	for club in GameState.club_matches:
		best = maxi(best, int(GameState.club_matches[club]))
	return best




func _accrue(key: String, current: int) -> void:







	var sk: String = "s%d:%s" % [SaveSlots.active, key]




	if not _seen.has(sk) and _seen.has(key):
		_seen[sk] = _seen[key]
	var seen: int = int(_seen.get(sk, 0))
	var lk: String = "lifetime_" + key
	if current >= seen:
		progress[lk] = int(progress[lk]) +(current - seen)
	else:
		progress[lk] = int(progress[lk]) + current
	_seen[sk] = current









func reset_all() -> void:
	_unlocked.clear()
	pending.clear()
	_seen.clear()
	for k in progress.keys():
		var v: Variant = progress[k]
		if v is Dictionary:
			(v as Dictionary).clear()
		elif v is bool:
			progress[k] = false
		else:
			progress[k] = 0
	_save()








const SECRETAS_DE_SECCION: Array[String] = ["museo_ego", "clase_baile", "estreno",
	"terapia", "cena_ex", "barbacoa"]


func quiza_estatua() -> void:
	if bool(progress.get("estatua", false)):
		return
	for k in SECRETAS_DE_SECCION:
		if not bool(progress.get(k, false)):
			return
	progress["estatua"] = true
	Career.queue_ceremony(Ceremonies.ESTATUA)


func _save() -> bool:
	quiza_estatua()
	return save_raw()

func save_raw() -> bool:
	if fault_inject_save:
		last_save_ok = false
		return false
	if fault_inject_save_once:
		fault_inject_save_once = false
		last_save_ok = false
		return false
	if fault_inject_save_count > 0:
		fault_inject_save_count -= 1
		last_save_ok = false
		return false

	if GameState.readonly_save and save_path == SAVE_PATH:
		last_save_ok = false
		return false

	if not _cargado:
		last_save_ok = false
		return false
	var cfg: ConfigFile = ConfigFile.new()
	cfg.set_value("logros", "unlocked", _unlocked)
	cfg.set_value("logros", "progress", progress)
	cfg.set_value("logros", "seen", _seen)
	cfg.set_value("logros", "pending", pending)
	cfg.set_value("logros", "rasgos", rasgos_vistos)
	cfg.set_value("logros", "parejas", parejas_vistas)
	var ok: bool = SaveSlotsScript.escribe_atomico(save_path, cfg.encode_to_text())
	if not ok:
		last_save_ok = false
	return ok


func _load() -> void:
	_cargado = true
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(save_path) != OK:
		return
	var u: Variant = cfg.get_value("logros", "unlocked", {})
	if u is Dictionary:
		_unlocked = u
	var p: Variant = cfg.get_value("logros", "progress", {})
	if p is Dictionary:
		for k in progress.keys():
			if p.has(k):
				progress[k] = p[k]
	var s: Variant = cfg.get_value("logros", "seen", {})
	if s is Dictionary:
		_seen = s
	var pend: Variant = cfg.get_value("logros", "pending", [])
	if pend is Array:
		pending = pend

	var rv: Variant = cfg.get_value("logros", "rasgos", {})
	if rv is Dictionary:
		rasgos_vistos = rv

	var pv: Variant = cfg.get_value("logros", "parejas", {})
	if pv is Dictionary:
		parejas_vistas = pv
