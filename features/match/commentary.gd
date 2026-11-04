class_name Commentary
extends RefCounted






































const MAX_LINES: int = 8


const MIN_GAP_MIN: int = 7





const LATE_MIN: int = 85

var _used: Dictionary = {}
var _said: int = 0
var _last_min: int = -99






























const SIN_PRESUPUESTO: Array[String] = ["sin_pase", "pifia_grada", "abucheo", "ex_te_lee",
	"grada_en_contra"]















const EXPLICAN_LA_JUGADA: Array[String] = [
	"salida_arranca", "salida_relevo", "salida_relevo_socio", "salida_medio",
	"salida_repliegue",
	"salida_robo", "salida_falta", "salida_gol_receptor",


	"contra_arranca", "contra_volcado", "contra_diez", "contra_relevo",
	"contra_repliegue", "contra_falta", "contra_gol_receptor", "hombre_de_mas",
	"robo_area_gol", "robo_area_parada", "robo_area_fuera",
	"meta_arranca", "meta_arranca_presion", "meta_corto", "meta_largo", "meta_a_ti",
	"meta_largo_perdido", "meta_fuera", "meta_corte", "meta_gol", "meta_gol_sin_ti",
	"meta_gol_tuyo",
	"saque_corto", "saque_pecho", "saque_largo_gol", "saque_largo_despeje",
	"saque_largo_parada", "saque_largo_fuera",
	"autogol_rival",




	"pique_patada", "pique_encara", "pique_calma",

	"pique_tangana",
]

func say(kind: String, ctx: Dictionary) -> Dictionary:
	var libre: bool = kind in SIN_PRESUPUESTO or kind in EXPLICAN_LA_JUGADA
	if _said >= MAX_LINES and not libre:
		return {}
	var minute: int = int(ctx.get("minute", 0))

	if kind != "gol" and not libre and minute - _last_min < MIN_GAP_MIN:
		return {}
	var hit: Dictionary = _pick(kind, ctx)
	if hit.is_empty():
		return {}
	_used[String(hit["key"])] = true
	if libre:
		return hit
	_said += 1
	_last_min = minute
	return hit




func used(key: String) -> bool:
	return _used.has(key)


func spent() -> int:
	return _said





















func _pick(kind: String, ctx: Dictionary) -> Dictionary:
	for row in bank().get(kind, []):
		var key: String = String(row[0])
		if _used.has(key):
			continue
		var cond: Callable = row[1]
		if not cond.call(ctx):
			continue
		var args: Callable = row[2]
		return {"key": key, "args": args.call(ctx)}
	return {}

















static func _i(c: Dictionary, k: String) -> int:
	return int(c.get(k, 0))

static func _b(c: Dictionary, k: String) -> bool:
	return bool(c.get(k, false))

static func _s(c: Dictionary, k: String) -> String:
	return String(c.get(k, ""))



static func _none(_c: Dictionary) -> Array:
	return []

static func _siempre(_c: Dictionary) -> bool:
	return true


static func _derbi_fuera(c: Dictionary) -> bool:
	return _b(c, "derby") and _b(c, "away")

static func _derbi(c: Dictionary) -> bool:
	return _b(c, "derby")

static func _ultima_jornada(c: Dictionary) -> bool:
	return _b(c, "final_liga")

static func _en_racha(c: Dictionary) -> bool:
	return _i(c, "forma") >= 3




static func _ex_una(c: Dictionary) -> bool:
	return _s(c, "ex") != "" and _i(c, "ex_t") == 1

static func _ex_varias(c: Dictionary) -> bool:
	return _s(c, "ex") != "" and _i(c, "ex_t") >= 2





static func _pressing(c: Dictionary) -> bool:
	return _s(c, "estilo") == "Presión alta"


static func _autobus(c: Dictionary) -> bool:
	return _s(c, "estilo") == "Bloque bajo"


static func _al_hombre(c: Dictionary) -> bool:
	return _s(c, "estilo") == "Marcaje al hombre"


static func _linea_alta(c: Dictionary) -> bool:
	return _s(c, "estilo") == "Bloque alto paciente"


static func _de_visita(c: Dictionary) -> bool:
	return _b(c, "away")



static func _gol_que_calla(c: Dictionary) -> bool:
	var tarde: bool = _i(c, "minute") >= LATE_MIN
	return _b(c, "away") and _i(c, "lead") > 0 and tarde

static func _gol_tardio_fuera(c: Dictionary) -> bool:
	return _b(c, "away") and _i(c, "minute") >= LATE_MIN


static func _gol_remontada_propia(c: Dictionary) -> bool:
	return _i(c, "lead") == 1 and _i(c, "tuyos") >= 2

static func _hat_trick(c: Dictionary) -> bool:
	return _i(c, "tuyos") >= 3

static func _doblete(c: Dictionary) -> bool:
	return _i(c, "tuyos") == 2

static func _gol_empata_pronto(c: Dictionary) -> bool:
	return _i(c, "lead") == 0 and _i(c, "minute") < LATE_MIN


static func _te_empatan_al_final(c: Dictionary) -> bool:
	return _i(c, "lead") == 0 and _i(c, "minute") >= LATE_MIN

static func _se_ponen_delante_en_casa(c: Dictionary) -> bool:
	return _i(c, "lead") < 0 and not _b(c, "away")

static func _goleada_en_contra(c: Dictionary) -> bool:
	return _i(c, "lead") <= -2














const VIA_CESION: String = "cesion"
const VIA_FICHAJE: String = "fichaje"
const VIA_LIBRE: String = "libre"



const HIST_TEMPS_MIN: int = 2



const HIST_HACE_MAX: int = 1

static func _hist_saque_fuera(c: Dictionary) -> bool:
	return _b(c, "hist_saque") and _b(c, "away") and _i(c, "hist_temps") >= HIST_TEMPS_MIN

static func _hist_saque(c: Dictionary) -> bool:
	return _b(c, "hist_saque")

static func _hist_te_cedio(c: Dictionary) -> bool:
	return _b(c, "hist_gol") and _s(c, "hist_via") == VIA_CESION

static func _hist_su_casa(c: Dictionary) -> bool:
	return _b(c, "hist_gol") and _b(c, "away") and _i(c, "hist_temps") >= HIST_TEMPS_MIN

static func _hist_te_dejo_ir(c: Dictionary) -> bool:
	var via: String = _s(c, "hist_via")
	return _b(c, "hist_gol") and (via == VIA_FICHAJE or via == VIA_LIBRE) \
			and _i(c, "hist_hace") <= HIST_HACE_MAX

static func _hist_ex_club(c: Dictionary) -> bool:
	return _b(c, "hist_gol")

static func _npc_excompa(c: Dictionary) -> bool:
	return _b(c, "npc_libre") and not _s(c, "npc_compa").is_empty()

static func _npc_cedido(c: Dictionary) -> bool:
	return _b(c, "npc_libre") and _b(c, "npc_en_club") and _s(c, "npc_via") == VIA_CESION

static func _npc_ex_casa(c: Dictionary) -> bool:
	return _b(c, "npc_libre") and _b(c, "npc_en_club") \
			and _i(c, "npc_temps") >= HIST_TEMPS_MIN

static func _npc_ex(c: Dictionary) -> bool:
	return _b(c, "npc_libre") and _b(c, "npc_en_club")


static func _ganado_fuera(c: Dictionary) -> bool:
	return _b(c, "away") and _i(c, "lead") > 0

static func _derbi_ganado(c: Dictionary) -> bool:
	return _b(c, "derby") and _i(c, "lead") > 0



static func _bravata_cumplida(c: Dictionary) -> bool:
	return _b(c, "bravata") and not _b(c, "bravata_gol") and _i(c, "lead") > 0

static func _bravata_tragada(c: Dictionary) -> bool:
	return _b(c, "bravata") and not _b(c, "bravata_gol") and _i(c, "lead") < 0




static func _bravata_tragada_derbi(c: Dictionary) -> bool:
	return _bravata_tragada(c) and _b(c, "derby")

static func _bravata_tragada_red(c: Dictionary) -> bool:
	return _bravata_tragada(c) and not _b(c, "derby")



static func _promesa_cumplida(c: Dictionary) -> bool:
	return _b(c, "bravata_gol") and _i(c, "tuyos") > 0

static func _promesa_tragada(c: Dictionary) -> bool:
	return _b(c, "bravata_gol") and _i(c, "tuyos") <= 0

static func _perdido_habiendo_marcado(c: Dictionary) -> bool:
	return _i(c, "lead") < 0 and _i(c, "tuyos") >= 1






static func _vestuario_hundido(c: Dictionary) -> bool:
	return _i(c, "rel_equipo") < 10

static func _vestuario_malo(c: Dictionary) -> bool:
	return _i(c, "rel_equipo") < 20

static func _grada_hundida(c: Dictionary) -> bool:
	return _i(c, "rel_aficion") >= 0 and _i(c, "rel_aficion") < 10

static func _grada_mala(c: Dictionary) -> bool:
	return _i(c, "rel_aficion") >= 0 and _i(c, "rel_aficion") < 20

static func _grada_buena(c: Dictionary) -> bool:
	return _i(c, "rel_aficion") >= 60

static func _grada_excelente(c: Dictionary) -> bool:
	return _i(c, "rel_aficion") >= 80


static func _args_comp(c: Dictionary) -> Array:
	return [_s(c, "comp")]

static func _args_rival(c: Dictionary) -> Array:
	return [_s(c, "rival")]



static func _args_socio(c: Dictionary) -> Array:
	return [_s(c, "socio")]




static func _args_ex(c: Dictionary) -> Array:
	return [_s(c, "ex"), _s(c, "ex_club")]

static func _args_ex_t(c: Dictionary) -> Array:
	return [_s(c, "ex"), _s(c, "ex_club"), _i(c, "ex_t")]


static func _args_hist_club(c: Dictionary) -> Array:
	return [_s(c, "hist_club")]

static func _args_hist_club_temps(c: Dictionary) -> Array:
	return [_s(c, "hist_club"), _i(c, "hist_temps")]

static func _args_npc(c: Dictionary) -> Array:
	return [_s(c, "npc")]

static func _args_npc_compa(c: Dictionary) -> Array:
	return [_s(c, "npc"), _s(c, "npc_compa")]

static func _args_npc_temps(c: Dictionary) -> Array:
	return [_s(c, "npc"), _i(c, "npc_temps")]



static func _args_picado(c: Dictionary) -> Array:
	return [_s(c, "picado")]






const CLAVES_HISTORIA: Array[String] = [
	"Vuelves a {0}. Aquí jugaste {1} temporadas.",
	"Enfrente, {0}. Tu antiguo club.",
	"{0} te cedió. Hoy le devuelves el favor.",
	"{1} temporadas en {0}. Hoy celebras allí.",
	"{0} te dejó ir hace nada. Error suyo.",
	"Le marcas a {0}, tu antiguo club.",
	"{0} jugó contigo en {1}. Y hoy te marca.",
	"Tu club cedió a {0}. Y él se lo cobra.",
	"{0}: {1} temporadas en tu club. Hoy, rival.",
	"{0}, ex de tu club. Duele el doble.",
]









static func historia(etapas: Array, club: String, season_hoy: int) -> Dictionary:
	var salida: Dictionary = TransferBook.salida_de(etapas, club)
	if salida.is_empty():
		return {}
	return {"via": String(salida.get("via", "")),
		"temps": TransferBook.temporadas_en(etapas, club),
		"hace": TransferBook.salida_hace(etapas, club, season_hoy)}






static var _bank: Dictionary = {}

static func bank() -> Dictionary:
	if _bank.is_empty():
		_bank = _build_bank()
	return _bank





static func _build_bank() -> Dictionary:
	return {


		"saque": [
			["El derbi. Fuera de casa. Aquí no se perdona nada.",
				_derbi_fuera, _none],
			["Derbi. Noventa minutos que se recuerdan un año.",
				_derbi, _none],
			["Última jornada. Lo que pase aquí ya no se arregla.",
				_ultima_jornada, _none],





			["Vuelves a {0}. Aquí jugaste {1} temporadas.",
				_hist_saque_fuera, _args_hist_club_temps],
			["Enfrente, {0}. Tu antiguo club.",
				_hist_saque, _args_hist_club],




			["Enfrente, {0}. Una temporada juntos en {1}; se acuerda de ti.",
				_ex_una, _args_ex],
			["Enfrente, {0}: {2} temporadas juntos en {1}. Te conoce de memoria.",
				_ex_varias, _args_ex_t],
			["{0}. Y tú llegas en racha.",
				_en_racha, _args_comp],








			["Te van a apretar arriba desde el primer balón. Sacúdetelos rápido.",
				_pressing, _none],
			["Hoy toca autobús: once atrás esperándote. La paciencia también juega.",
				_autobus, _none],
			["Te marcan al hombre. Cada carrera tuya se lleva a uno puesto.",
				_al_hombre, _none],
			["Línea alta y sin prisa. La espalda de esa zaga es la jugada.",
				_linea_alta, _none],
			["Campo de {0}. A ver quién se acuerda de ti al final.",
				_de_visita, _args_rival],
		],


		"gol": [
			["Lo callaste. Su estadio entero, callado.",
				_gol_que_calla, _none],
			["En el 90 y en su casa. De esos que no se olvidan.",
				_gol_tardio_fuera, _none],




			["{0} te cedió. Hoy le devuelves el favor.",
				_hist_te_cedio, _args_hist_club],
			["{1} temporadas en {0}. Hoy celebras allí.",
				_hist_su_casa, _args_hist_club_temps],
			["{0} te dejó ir hace nada. Error suyo.",
				_hist_te_dejo_ir, _args_hist_club],
			["Le marcas a {0}, tu antiguo club.",
				_hist_ex_club, _args_hist_club],
			["Le has dado la vuelta. Tú solo.",
				_gol_remontada_propia, _none],
			["Tres. Te llevas el balón a casa.",
				_hat_trick, _none],
			["Y van dos. El campo es tuyo.",
				_doblete, _none],
			["En el derbi. Ese lo vas a contar mucho tiempo.",
				_derbi, _none],
			["Empate. Y quedan minutos.",
				_gol_empata_pronto, _none],
		],

		"gol_rival": [



			["{0} jugó contigo en {1}. Y hoy te marca.",
				_npc_excompa, _args_npc_compa],
			["Tu club cedió a {0}. Y él se lo cobra.",
				_npc_cedido, _args_npc],
			["{0}: {1} temporadas en tu club. Hoy, rival.",
				_npc_ex_casa, _args_npc_temps],
			["{0}, ex de tu club. Duele el doble.",
				_npc_ex, _args_npc],
			["Te lo empatan al final. Y te toca a ti arreglarlo.",
				_te_empatan_al_final, _none],
			["{0} se pone por delante. La grada lo nota.",
				_se_ponen_delante_en_casa, _args_rival],
			["Otro. Esto se está yendo.",
				_goleada_en_contra, _none],
		],


		"poste": [
			["El palo. Un centímetro más adentro y estabas celebrando.",
				_siempre, _none],
			["Otra vez el hierro. Hoy no te quiere.",
				_siempre, _none],
		],

		"asistencia": [
			["Se lo pusiste. El gol es suyo; el pase, tuyo.",
				_siempre, _none],
		],





		"sin_pase": [
			["Levanta la mano. Nadie lo mira. Otra vez.",
				_vestuario_hundido, _none],
			["Está solo y lo ve todo el estadio menos sus compañeros.",
				_vestuario_hundido, _none],
			["La juegan por el otro lado. Ya ni la pide.",
				_vestuario_malo, _none],
			["Se ofrece, le dan la espalda. Este equipo no es suyo.",
				_vestuario_malo, _none],
			["Había pase y eligieron el otro. Pasa mucho últimamente.",
				_siempre, _none],
		],


		"pifia_grada": [
			["Le llega y el estadio entero silba. Se le va larga.",
				_grada_hundida, _none],
			["El balón es suyo. El abucheo también. La pierde.",
				_grada_hundida, _none],
			["Un pito por cada toque. No controla ni la más fácil.",
				_grada_mala, _none],
			["La grada le cae encima y el control se le va largo.",
				_siempre, _none],
		],




		"ex_te_lee": [
			["{0} te conoce de {1}. Sabe hacia dónde vas a romper.",
				_siempre, _args_ex],
			["{0} jugó contigo en {1}: te lee antes de que toques.",
				_siempre, _args_ex],
		],










		"abucheo": [
			["Uno se levanta en la tercera fila. Y no es para aplaudir.",
				_siempre, _none],
			["Ya hay quien le lleva la cuenta de los fallos desde la grada.",
				_siempre, _none],
			["Se oye a uno solo por encima de todos, y no dice nada bonito.",
				_siempre, _none],
		],


		"grada_a_favor": [
			["El estadio se levanta sólo de verlo con el balón.",
				_grada_excelente, _none],
			["Corean su nombre. Y todavía no ha hecho nada.",
				_grada_excelente, _none],
			["Se oye el murmullo en cuanto la toca.",
				_grada_buena, _none],
		],








		"grada_en_contra": [
			["Hasta su propia gente le silba al oír su nombre.",
				_grada_hundida, _none],
			["Silbidos de los suyos. Hoy lo miran con lupa.",
				_grada_mala, _none],
			["Su grada no le perdona una. Cada toque, con lupa.",
				_siempre, _none],
		],






		"salida_arranca": [
			["Desde tu campo. Todo el césped por delante.",
				_siempre, _none],
			["Balón tuyo en tu mitad. Ahora hay que cruzarla entera.",
				_siempre, _none],
		],

		"salida_relevo": [
			["Se la das y sigues. Así se sale de la presión.",
				_siempre, _none],
			["Un toque y a correr. La presión se queda atrás.",
				_siempre, _none],
		],



		"salida_relevo_socio": [
			["Se la das a {0}, que ya sabía que venía.",
				_siempre, _args_socio],
			["{0} y tú, de memoria. Ni hizo falta mirar.",
				_siempre, _args_socio],
		],

		"salida_medio": [
			["Medio campo cruzado sin un susto.",
				_siempre, _none],
			["Ya estás en su mitad. Y con el balón.",
				_siempre, _none],
		],

		"salida_repliegue": [
			["Se repliegan. Te dejaron llegar, no entrar.",
				_siempre, _none],
			["Cuarenta y cinco segundos de toque. Y nada que contar.",
				_siempre, _none],
		],

		"salida_robo": [
			["Demasiado solo, demasiado tiempo. Te la quitaron.",
				_siempre, _none],
			["Se enamoró del balón. Y lo pagó.",
				_siempre, _none],
		],

		"salida_falta": [
			["Te bajan en tu campo. Falta, y a empezar de nuevo.",
				_siempre, _none],
		],


		"salida_gol_receptor": [
			["Salió de tu área y acabó en la suya. La jugada es tuya.",
				_siempre, _none],
			["Tú la sacaste, él la metió. Así se construye.",
				_siempre, _none],
		],



		"contra_arranca": [
			["Robo en tu campo. ¡A la contra!",
				_siempre, _none],
			["La recuperas en tu mitad. Ahora, rápido.",
				_siempre, _none],
		],
		"contra_volcado": [
			["Están todos arriba. Hay campo para correr.",
				_siempre, _none],
			["Se volcaron buscando el gol. Su espalda es tuya.",
				_siempre, _none],
		],
		"contra_diez": [
			["Con uno menos, a la contra. Es lo que toca.",
				_siempre, _none],
			["Diez contra once: se defiende y se sale rápido.",
				_siempre, _none],
		],
		"contra_relevo": [
			["Se la das y arrancas. Cada segundo cuenta.",
				_siempre, _none],
			["Pase y a correr. Que no les dé tiempo a volver.",
				_siempre, _none],
		],

		"contra_repliegue": [
			["Tardaste. Ya volvieron todos.",
				_siempre, _none],
			["La contra se enfrió. Ya están ordenados atrás.",
				_siempre, _none],
		],
		"contra_falta": [
			["Falta táctica. Te cortan la contra.",
				_siempre, _none],
		],
		"contra_gol_receptor": [
			["Contra de manual. De tu campo a la red.",
				_siempre, _none],
			["Tú la llevaste, él la metió. Contra perfecta.",
				_siempre, _none],
		],

		"hombre_de_mas": [
			["Juegan con diez. Busca al que está libre.",
				_siempre, _none],
			["Tres contra dos. Uno de los tuyos está solo.",
				_siempre, _none],
		],



		"robo_area_gol": [
			["Te la quitaron en tu área. Ese regalo no se devuelve.",
				_siempre, _none],
			["Perdida en tu área, gol en tu portería. Así de corto.",
				_siempre, _none],
		],
		"robo_area_parada": [
			["Te la roban ahí mismo y tu portero te salva la cara.",
				_siempre, _none],
		],
		"robo_area_fuera": [
			["Se la quitaron en tu área y la tiraron fuera. Hoy sí; mañana, no.",
				_siempre, _none],
		],




		"meta_arranca": [
			["Desde el portero. Corta, y sin regalar.",
				_siempre, _none],
			["Saque de meta. Tu portero tiene el balón y tú, la decisión.",
				_siempre, _none],
		],
		"meta_arranca_presion": [
			["Te vienen a buscar arriba. El portero no puede pensárselo.",
				_siempre, _none],
			["Presión alta al saque. Corto es un riesgo; largo, una moneda al aire.",
				_siempre, _none],
		],


		"meta_corto": [
			["En corto, a los pies. Salida limpia desde atrás.",
				_siempre, _none],
			["Saque corto y balón dominado. Así empieza una jugada, no un despeje.",
				_siempre, _none],
		],
		"meta_largo": [
			["La revienta y la baja un compañero. Medio campo de un golpe.",
				_siempre, _none],
			["Largo y con destinatario. La gana tu jugador y sigue el juego.",
				_siempre, _none],
		],
		"meta_a_ti": [
			["Tu portero te busca. Ahora es tuya, con todo el campo por delante.",
				_siempre, _none],
			["Del guante a tus pies. A partir de aquí, la jugada es tuya.",
				_siempre, _none],
		],


		"meta_largo_perdido": [
			["La reventó y la ganaron ellos. Saque largo, balón perdido.",
				_siempre, _none],
			["Saque largo a ninguna parte: cabeza rival y a defender.",
				_siempre, _none],
		],
		"meta_fuera": [
			["El saque no encuentra a nadie. Balón muerto y a empezar otra vez.",
				_siempre, _none],
			["Se fue sin dueño. Un saque de meta que no llegó a nadie.",
				_siempre, _none],
		],

		"meta_corte": [
			["Le cortan el primer pase. En tu área. Malo.",
				_siempre, _none],
			["Se la quitan al primer pase, a un paso de tu portería. Regalo.",
				_siempre, _none],
		],



		"meta_gol": [
			["Del saque de meta al fondo de la red. Toda la cancha en una jugada.",
				_siempre, _none],
			["Empezó en el guante de tu portero y acabó en gol. Así se sale.",
				_siempre, _none],
		],
		"meta_gol_sin_ti": [
			["De tu portero a la red sin pasar por ti. Lo viste de cerca.",
				_siempre, _none],
			["Gol de la salida de meta. Tú no la tocaste, pero la viste nacer.",
				_siempre, _none],
		],
		"meta_gol_tuyo": [
			["Salió de tu portero y la acabaste tú. Cien metros de jugada.",
				_siempre, _none],
			["Saque de meta, campo cruzado y gol tuyo. De área a área.",
				_siempre, _none],
		],




		"saque_corto": [
			["Saque de banda en corto, a tus pies. Ahora decides tú.",
				_siempre, _none],
			["Te la saca el lateral y la jugada sigue. Balón cuidado.",
				_siempre, _none],
		],
		"saque_pecho": [
			["Te la saca al pecho. Bájala y a jugar.",
				_siempre, _none],
			["Saque de banda, control de pecho y la jugada viva.",
				_siempre, _none],
		],


		"autogol_rival": [
			["Tu tiro se iba fuera, pero el defensa la mete en su propia portería.",
				_siempre, _none],
			["Iba fuera y rebota en el defensa hasta el fondo de su red. Autogol.",
				_siempre, _none],
		],
		"saque_largo_gol": [
			["La colgaron con las manos y la metiste con la cabeza.",
				_siempre, _none],
			["Saque de banda al área y cabezazo a la red. De pizarra.",
				_siempre, _none],
		],
		"saque_largo_despeje": [
			["La cuelgan desde la banda y la despejan ellos. A por la siguiente.",
				_siempre, _none],
			["Saque largo al área y cabeza rival. Esta vez no.",
				_siempre, _none],
		],
		"saque_largo_parada": [
			["Cabezazo tras el saque de banda y el portero lo saca.",
				_siempre, _none],
			["Saque largo, remate de cabeza y una parada de las buenas.",
				_siempre, _none],
		],
		"saque_largo_fuera": [
			["Saque de banda al área, cabezazo y fuera. Faltó dirección.",
				_siempre, _none],
			["La peinas tras el saque largo y se marcha. Cerca.",
				_siempre, _none],
		],


		"pique_calor": [
			["Otra vez le ganas a {0}. Ya no le hace ninguna gracia.",
				_siempre, _args_picado],
			["{0} ya te tiene entre ceja y ceja.",
				_siempre, _args_picado],
		],
		"pique_patada": [
			["{0} va a por ti, no a por el balón. Patada por detrás.",
				_siempre, _args_picado],
			["Ni mira la pelota: {0} te pega por detrás.",
				_siempre, _args_picado],
		],
		"pique_encara": [
			["Te levantas y te vas a por {0}. Frente con frente.",
				_siempre, _args_picado],
			["No te lo callas: cara a cara con {0}, y la grada se enciende.",
				_siempre, _args_picado],
		],



		"pique_tangana": [
			["Tangana en pleno derbi: {0} te empuja y se forma el corro.",
				_siempre, _args_picado],
			["Empujones entre los dos equipos. {0} lo empezó y el árbitro tiene que meterse en medio.",
				_siempre, _args_picado],
		],
		"pique_calma": [
			["{0} te busca y no te encuentra. Te das la vuelta.",
				_siempre, _args_picado],
			["Ni lo miras. {0} se queda con el dedo en el aire.",
				_siempre, _args_picado],
		],

		"final": [




			["Prometiste un gol, y lo metiste.",
				_promesa_cumplida, _none],
			["Prometiste un gol. Hoy no llegó.",
				_promesa_tragada, _none],
			["Dijiste que lo ganarías, y lo ganaste.",
				_bravata_cumplida, _none],
			["Hablaste antes del derbi. Hoy te toca callar.",
				_bravata_tragada_derbi, _none],
			["Lo dijiste en redes. Hoy te toca callar.",
				_bravata_tragada_red, _none],
			["Ganado en su campo. Eso vale doble.",
				_ganado_fuera, _none],
			["El derbi es tuyo.",
				_derbi_ganado, _none],
			["Se acabó. Y lo dejaste escapar.",
				_perdido_habiendo_marcado, _none],
		],
	}
