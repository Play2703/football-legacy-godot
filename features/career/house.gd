class_name House
extends RefCounted

























const BODY_R: float = 0.24










const CELDA: float = 0.5















const SOFT_KINDS: Array = ["cochera", "alfombra", "camisetas", "momentos", "espejo", "reloj",
	"tapete_redondo", "tapete_tejido", "tapete_ovalado", "tapete_hexagonal",
	"tapete_organico", "tapete_pasillo",
	"muro_records", "vision_board", "pared_reflejos",
	"ventana", "ventanal", "ojo_buey", "repisa_pared", "playera",

	"mural_playeras", "vitrina_especiales",




	"cuadro", "banderines", "bufandas", "botines_muro", "tapiz", "panel_madera",
	"mapa_giras", "tv_muro", "aplique", "neon", "tira_led", "plafon", "arana",



	"cartel_partido", "placa_fichaje", "portada_prensa",



	"dardos",




	"escudo_muro", "banderin_vitrina", "tifo_enmarcado", "balones_temporada",
	"alfombra_circulo",

	"toallero", "espejo_cuerpo"]


const STAND_KINDS: Array = ["vitrina", "repisa", "cocina", "arcade",
	"simulador",
	"camilla_fisio", "pizarra_tactica", "bici_estatica", "rincon_lectura", "mesa_recuerdos",
	"colchon_estiramientos", "maquina_respiracion", "vinoteca_saludable",


	"consultorio_nutri",
	"gimnasio", "pesas", "cinta", "moto", "piscina", "maqueta", "balones",

	"balones_museo",



	"vitrina_torre", "vitrina_galeria", "vitrina_premios",











	"estatua_bronce",
	"gorras_seleccion",




	"porteria", "cocina_ext",










	"cocina_dieta",
	"casillero", "despacho",





	"vitrina_isla",


	"perchero_tienda",


	"urna_playeras",





	"sauna",

	"vestidor",


	"cabina_podcast", "pingpong", "brazalete_capitan", "canasta_basket", "reloj_pie", "comedor_penthouse",

	"memorama",
	"robot_aspirador", "espejo_inteligente", "mesa_holografica"]


const FRONT_KINDS: Array = ["vitrina", "repisa", "arcade", "cama", "gimnasio",
	"camilla_fisio", "pizarra_tactica", "bici_estatica", "rincon_lectura", "mesa_recuerdos", "muro_records",
	"colchon_estiramientos", "maquina_respiracion", "vinoteca_saludable", "vision_board",
	"consultorio_nutri",
	"pesas", "cinta", "camisetas", "momentos", "espejo", "reloj", "tele",
	"maqueta", "balones", "balones_museo", "playera", "perchero_tienda",
	"urna_playeras", "mural_playeras", "vitrina_especiales",
	"vitrina_torre", "vitrina_galeria", "vitrina_premios",






	"estatua_bronce",
	"gorras_seleccion",


	"porteria", "casillero", "despacho", "vestidor",


	"espejo_cuerpo", "cabina_podcast", "pingpong", "brazalete_capitan", "canasta_basket", "reloj_pie", "sofa_penthouse", "comedor_penthouse",

	"memorama", "pared_reflejos",
	"cama_penthouse", "robot_aspirador", "espejo_inteligente", "mesa_holografica"]








const HANG_KINDS: Array = ["camisetas", "momentos", "espejo", "reloj", "ventana",
	"muro_records", "vision_board", "pared_reflejos",
	"ventanal", "ojo_buey", "repisa_pared",



	"dardos",





	"playera",


	"mural_playeras", "vitrina_especiales",






	"cuadro", "banderines", "bufandas", "botines_muro", "tapiz", "panel_madera",
	"mapa_giras", "tv_muro", "aplique", "neon", "tira_led",
	"cartel_partido", "placa_fichaje", "portada_prensa",



	"escudo_muro", "banderin_vitrina", "tifo_enmarcado", "balones_temporada",


	"toallero", "espejo_cuerpo"]









const CIELO_KINDS: Array = ["plafon", "arana"]

const OUTDOOR_ROOMS: Array = ["patio", "jardin"]









const PROP_ALTO: Dictionary = {
	"tapete_redondo": 0.008,
	"tapete_tejido": 0.008,
	"tapete_ovalado": 0.008,
	"tapete_hexagonal": 0.008,
	"tapete_organico": 0.008,
	"tapete_pasillo": 0.008,
	"bocinas_torre": 1.1,
	"bocinas_estante": 0.8,
	"librero_abierto": 1.9,
	"librero_modular": 1.8,
	"alberca_surf": 1.35,
	"mesa_holografica": 1.22,
	"espejo_inteligente": 1.95,
	"robot_aspirador": 0.25,
	"cama_penthouse": 1.3,
	"comedor_penthouse": 1.05,
	"sofa_penthouse": 0.92,
	"canasta_basket": 2.23, "reloj_pie": 2.23,
	"pingpong": 0.94, "brazalete_capitan": 1.25, "posadero_loro": 1.33,
	"camilla_fisio": 0.9, "pizarra_tactica": 1.75, "bici_estatica": 1.25,
	"muro_records": 1.0, "rincon_lectura": 1.65, "mesa_recuerdos": 1.15,

	"pared_reflejos": 1.2, "memorama": 0.9,
	"colchon_estiramientos": 0.22, "maquina_respiracion": 1.45,
	"vision_board": 1.05, "vinoteca_saludable": 1.2, "lampara_sol": 0.35,

	"consultorio_nutri": 1.95,




	"silla": 0.92, "silla_alta": 1.1, "sillon": 0.8,
	"sofa": 0.72, "mesa": 0.76, "repisa": 1.15, "cama": 0.55,






	"tocador": 1.6,







	"vitrina": 1.65, "camisetas": 2.0, "banca": 0.8, "alfombra": 0.03,




	"balones": 1.45,


	"balones_museo": 2.1,













	"playera": 1.6,


	"perchero_tienda": 2.1,

	"urna_playeras": 2.2,


	"mural_playeras": 1.9,
	"vitrina_especiales": 1.25,






	"vitrina_torre": 1.12, "vitrina_galeria": 1.15, "vitrina_premios": 1.65,






	"vitrina_isla": 1.12,






	"gorras_seleccion": 1.9,




	"balon_debut": 1.15,













	"estatua_bronce": 2.05,
	"tele": 1.15, "cocina": 0.92, "librero": 1.9, "planta": 1.05,







	"cocina_isla": 0.92,






	"cocina_dieta": 1.9,
	"lampara": 1.55, "momentos": 1.9, "maqueta": 0.86, "arcade": 1.7,
	"simulador": 1.55,
	"piscina": 0.28, "moto": 1.1, "gimnasio": 1.15, "pesas": 0.78,
	"cinta": 1.25, "espejo": 1.2, "reloj": 0.42, "ventana": 0.95,





	"ventanal": 1.9, "ojo_buey": 0.5,


	"repisa_pared": 0.14,


	"piano": 1.0,


	"billar": 0.82, "futbolin": 0.9, "escultura": 1.45,





	"dardos": 0.5,

	"jacuzzi": 0.75,






	"sauna": 2.0,


	"inodoro": 0.78, "lavabo": 1.8, "ducha": 2.12, "tina": 0.74,

	"acuario": 1.3,


	"mesa_jardin": 2.0, "fuente": 0.6, "pergola": 2.2,

















	"camastro": 0.45, "sombrilla": 2.2, "hamaca": 1.4, "arbusto": 0.9,
	"arbol": 3.2, "farol": 2.0, "fogata": 0.45, "huerto": 0.5,
	"columpio": 2.0, "porteria": 2.44, "estanque": 0.4, "cocina_ext": 1.1,



	"helipuerto": 0.15,







	"cuadro": 0.7, "banderines": 0.35, "bufandas": 0.55, "botines_muro": 0.5,
	"tapiz": 2.1, "panel_madera": 2.1, "mapa_giras": 1.1, "tv_muro": 0.9,






	"cartel_partido": 1.5, "portada_prensa": 0.8, "placa_fichaje": 0.55,





	"escudo_muro": 1.1, "banderin_vitrina": 0.7, "tifo_enmarcado": 1.2,
	"balones_temporada": 0.45,



	"butaca_estadio": 0.95, "casillero": 2.0, "alfombra_circulo": 0.03,



	"chimenea": 1.6,




	"plafon": 0.18, "arana": 0.6, "aplique": 0.35, "lampara_mesa": 0.95,
	"neon": 0.45, "tira_led": 0.12,




	"macetero": 1.8, "pecera_pie": 1.6, "bar_carrito": 0.85, "puf": 0.45,
	"baul": 0.55, "percha": 1.8, "vinoteca": 1.8, "tocadiscos": 0.9,








	"maletas": 0.9,





	"despacho": 1.5,








	"barbero": 2.05,


	"cama_perro": 0.3, "rascador_gato": 1.65, "lavanderia": 1.1,
	"recibidor": 1.25, "vestidor": 2.0, "telescopio": 1.6,














	"cabina_podcast": 1.7, "tina_hielo": 0.74, "banco_botas": 1.25,
	"toallero": 0.7, "espejo_cuerpo": 1.7, "mesa_centro": 0.42, "rincon_cafe": 1.05,
	"aparador": 1.75, "gallinero": 0.95,
}
const ALTO_POR_DEFECTO: float = 0.8




const BAJO_TODO: Array = ["alfombra", "alfombra_circulo", "tapete_redondo", "tapete_tejido",
	"tapete_ovalado", "tapete_hexagonal", "tapete_organico", "tapete_pasillo"]





























const CATEGORIAS: Dictionary = {
	"tapete_ovalado": "DECORACION",
	"tapete_hexagonal": "DECORACION",
	"tapete_organico": "DECORACION",
	"tapete_pasillo": "DECORACION",
	"tapete_redondo": "DECORACION",
	"tapete_tejido": "DECORACION",
	"bocinas_torre": "OCIO",
	"bocinas_estante": "OCIO",
	"librero_abierto": "DECORACION",
	"librero_modular": "DECORACION",

	"alberca_surf": "DECORACION",
	"mesa_holografica": "OCIO",
	"espejo_inteligente": "OCIO",
	"robot_aspirador": "OCIO",
	"cama_penthouse": "DESCANSAR",
	"comedor_penthouse": "COCINA",
	"sofa_penthouse": "DESCANSAR",
	"canasta_basket": "MINIJUEGOS", "reloj_pie": "DECORACION",
	"pingpong": "MINIJUEGOS", "brazalete_capitan": "EXHIBICION",
	"pared_reflejos": "MINIJUEGOS", "memorama": "MINIJUEGOS",
	"posadero_loro": "MASCOTAS",
	"cochera": "EXHIBICION",
	"coche": "EXHIBICION", "coche_muscle": "EXHIBICION",
	"coche_gt": "EXHIBICION", "coche_hiper": "EXHIBICION",
	"coche_compacto": "EXHIBICION", "coche_sedan": "EXHIBICION",
	"coche_familiar": "EXHIBICION", "coche_pickup": "EXHIBICION",




	"camilla_fisio": "RECUPERACION", "pizarra_tactica": "ENTRENAR",
	"bici_estatica": "RECUPERACION",
	"colchon_estiramientos": "RECUPERACION", "maquina_respiracion": "RECUPERACION",
	"rincon_lectura": "DESCANSAR", "muro_records": "EXHIBICION", "mesa_recuerdos": "EXHIBICION",
	"vision_board": "DESCANSAR", "vinoteca_saludable": "COCINA", "lampara_sol": "DECORACION",


	"consultorio_nutri": "RECUPERACION",
	"cama": "DESCANSAR", "sofa": "DESCANSAR", "banca": "DESCANSAR",


	"sillon": "DESCANSAR",



	"tocador": "DESCANSAR",
	"vestidor": "DESCANSAR",





	"cama_perro": "MASCOTAS", "rascador_gato": "MASCOTAS", "gallinero": "MASCOTAS",


	"recibidor": "PUERTAS Y VENTANAS", "lavanderia": "BAÑO", "telescopio": "OCIO",
	"cocina": "COCINA", "mesa": "COCINA",

	"silla": "COCINA", "silla_alta": "COCINA",



	"rincon_cafe": "COCINA", "aparador": "COCINA", "mesa_centro": "DESCANSAR",






	"cocina_isla": "COCINA",



	"cocina_dieta": "COCINA",
	"vitrina": "EXHIBICION", "repisa": "EXHIBICION", "camisetas": "EXHIBICION",



	"balones": "EXHIBICION", "balones_museo": "EXHIBICION", "playera": "EXHIBICION",
	"perchero_tienda": "EXHIBICION",
	"urna_playeras": "EXHIBICION", "mural_playeras": "EXHIBICION",
	"vitrina_especiales": "EXHIBICION",
	"vitrina_torre": "EXHIBICION", "vitrina_galeria": "EXHIBICION",
	"vitrina_premios": "EXHIBICION",



	"vitrina_isla": "EXHIBICION",



	"gorras_seleccion": "EXHIBICION",
	"balon_debut": "EXHIBICION",





	"estatua_bronce": "EXHIBICION",
	"momentos": "EXHIBICION", "reloj": "EXHIBICION",


	"tele": "OCIO", "maqueta": "OCIO", "moto": "EXHIBICION", "piano": "OCIO",
	"futbolin": "OCIO",




	"arcade": "MINIJUEGOS", "poker": "MINIJUEGOS", "billar": "MINIJUEGOS",
	"dardos": "MINIJUEGOS", "simulador": "MINIJUEGOS",
	"escultura": "EXHIBICION", "acuario": "OCIO",



	"jacuzzi": "RECUPERACION", "piscina": "RECUPERACION",


	"tina_hielo": "RECUPERACION",














	"mesa_jardin": "JARDIN", "fuente": "JARDIN", "pergola": "JARDIN",
	"camastro": "JARDIN", "hamaca": "JARDIN", "columpio": "JARDIN",
	"sombrilla": "JARDIN", "arbusto": "JARDIN", "arbol": "JARDIN",
	"farol": "JARDIN", "huerto": "JARDIN", "estanque": "JARDIN",
	"fogata": "JARDIN", "helipuerto": "EXHIBICION", "helicoptero": "EXHIBICION",
	"porteria": "ENTRENAR", "cocina_ext": "JARDIN",


	"gimnasio": "ENTRENAR", "pesas": "ENTRENAR", "cinta": "ENTRENAR",
	"banco_botas": "ENTRENAR",



	"inodoro": "BAÑO", "lavabo": "BAÑO", "ducha": "BAÑO", "tina": "BAÑO",
	"toallero": "BAÑO",







	"sauna": "RECUPERACION",






	"alfombra": "DECORACION", "planta": "DECORACION", "lampara": "DECORACION",
	"librero": "DECORACION", "espejo": "ENTRENAR", "espejo_cuerpo": "DESCANSAR",
	"ventana": "PUERTAS Y VENTANAS", "ventanal": "PUERTAS Y VENTANAS",
	"ojo_buey": "PUERTAS Y VENTANAS",
	"repisa_pared": "EXHIBICION",






	"cuadro": "DECORACION", "banderines": "DECORACION",
	"bufandas": "EXHIBICION", "botines_muro": "EXHIBICION",
	"tapiz": "DECORACION", "panel_madera": "DECORACION",


	"mapa_giras": "EXHIBICION", "tv_muro": "OCIO", "chimenea": "DESCANSAR",
	"cartel_partido": "EXHIBICION", "portada_prensa": "EXHIBICION",
	"placa_fichaje": "EXHIBICION",




	"escudo_muro": "EXHIBICION", "banderin_vitrina": "EXHIBICION",
	"tifo_enmarcado": "EXHIBICION", "balones_temporada": "EXHIBICION",
	"casillero": "EXHIBICION", "butaca_estadio": "DESCANSAR",
	"alfombra_circulo": "DECORACION",
	"plafon": "DECORACION", "arana": "DECORACION", "aplique": "DECORACION",

	"lampara_mesa": "DESCANSAR", "neon": "DECORACION", "tira_led": "DECORACION",
	"macetero": "DECORACION", "percha": "DECORACION", "baul": "DECORACION",







	"maletas": "DECORACION",
	"puf": "DESCANSAR",


	"pecera_pie": "OCIO", "bar_carrito": "COCINA", "vinoteca": "OCIO",
	"tocadiscos": "OCIO",



	"cabina_podcast": "OCIO",




	"despacho": "OCIO",




	"barbero": "OCIO",














	"spa": "RECUPERACION", "cine": "OCIO", "video": "ENTRENAR",
	"asador": "JARDIN",





	"estilo_nordico": "ESTILO", "estilo_noche": "ESTILO", "estilo_club": "ESTILO",
	"estilo_calido": "ESTILO", "estilo_industrial": "ESTILO",
	"estilo_marmol": "ESTILO",




	"fachada_torre": "FACHADA", "fachada_colonial": "FACHADA",
	"fachada_mediterranea": "FACHADA", "fachada_cabana": "FACHADA",
	"fachada_cubo": "FACHADA", "fachada_loft": "FACHADA",
	"fachada_victoriana": "FACHADA", "fachada_villa": "FACHADA",
	"fachada_hacienda": "FACHADA", "fachada_rancho": "FACHADA",
}















const CATEGORIA_ORDEN: Array = ["DESCANSAR", "COCINA", "BAÑO", "RECUPERACION",
	"ENTRENAR", "MINIJUEGOS", "OCIO", "EXHIBICION", "JARDIN", "PUERTAS Y VENTANAS",
	"DECORACION", "FACHADA", "ESTILO", "MASCOTAS"]




const CAT_MASCOTAS: String = "MASCOTAS"


static func categoria_of(kind: String) -> String:
	return String(CATEGORIAS.get(kind, "DECORACION"))









const KIND_DESC: Dictionary = {
	"tapete_ovalado": "Lana de contorno oval, con borde tejido y centro suave.",
	"tapete_hexagonal": "Seis lados y franjas concéntricas para vestir un rincón.",
	"tapete_organico": "Curvas suaves e irregulares, como una piedra de río.",
	"tapete_pasillo": "Tejido alargado con esquinas redondas y bandas claras.",
	"tapete_redondo": "Yute trenzado en círculos. Va debajo de mesas y sillones.",
	"tapete_tejido": "Lana con rombos y flecos. Viste el suelo sin estorbar el paso.",
	"bocinas_torre": "Dos torres de audio con conos y puertos al frente.",
	"bocinas_estante": "Dos bocinas compactas y receptor sobre un mueble bajo.",
	"librero_abierto": "Madera y tubos oscuros, con baldas abiertas para libros.",
	"librero_modular": "Cubos, cajones y libros en una composición de madera.",
	"alberca_surf": "Alberca decorativa con olas en movimiento, agua translúcida y espuma. Incluye generador y tabla.",
	"mesa_holografica": "Mesa táctica con proyección 3D. Explora cuatro formaciones y gira la vista.",
	"espejo_inteligente": "Espejo de pie con pantalla: consulta tu estado y los próximos partidos.",
	"robot_aspirador": "Robot con base de carga. Recorre el suelo libre al colocarlo en casa.",
	"cama_penthouse": "Cama flotante de nogal con cabecero iluminado. Permite dormir de verdad.",
	"comedor_penthouse": "Mesa de mármol negro con seis sillas de piel y detalles de latón.",
	"sofa_penthouse": "Sofá modular de piel crema, nogal y latón. Recibe visitas en tu salón.",
	"canasta_basket": "Canasta con tablero, red y balón. Diez tiros haciendo flick hacia el aro.",
	"reloj_pie": "Reloj decorativo de madera con esfera, péndulo y pesas de latón.",
	"pingpong": "Mesa con red y palas. Juega al ping-pong contra un rival.",
	"pared_reflejos": "Pared de luces: toca la que se enciende. Récord de reflejos.",
	"memorama": "Mesa de cartas con tu colección: encuentra las parejas.",
	"brazalete_capitan": "Tu capitanía bajo cristal. Conserva los nombramientos ganados.",
	"posadero_loro": "Rama de madera con agua y semillas. Tu loro descansa aquí.",
	"cochera": "Ocho plazas en una ampliación a la derecha de casa. Terreno incluido y coches colocados automáticamente. Sin mantenimiento.",
	"coche": "Tu coche de colección. Colócalo, gíralo o guárdalo en casa.",
	"coche_muscle": "Tu coche de colección. Colócalo, gíralo o guárdalo en casa.",
	"coche_gt": "Tu coche de colección. Colócalo, gíralo o guárdalo en casa.",
	"coche_hiper": "Tu coche de colección. Colócalo, gíralo o guárdalo en casa.",
	"coche_compacto": "Tu coche de colección. Colócalo, gíralo o guárdalo en casa.",
	"coche_sedan": "Tu coche de colección. Colócalo, gíralo o guárdalo en casa.",
	"coche_familiar": "Tu coche de colección. Colócalo, gíralo o guárdalo en casa.",
	"coche_pickup": "Tu coche de colección. Colócalo, gíralo o guárdalo en casa.",
	"camilla_fisio": "Camilla y material de recuperación. Su sesión recupera energía, no cura lesiones.",
	"pizarra_tactica": "Pizarra móvil para preparar el próximo partido. El bono se activa al usarla.",
	"bici_estatica": "Cardio suave en casa; requiere estar sin lesión para pedalear.",
	"colchon_estiramientos": "Zona de movilidad para soltar piernas. Su rutina da energía y ánimo.",
	"maquina_respiracion": "Cabina de respiración guiada para bajar pulsaciones antes de competir.",
	"vision_board": "Panel de objetivos y hábitos. Decora la pared y ordena tu semana.",
	"vinoteca_saludable": "Bar de jugos, agua mineral y snacks. Recupera un poco de energía.",
	"lampara_sol": "Luz cálida de ambiente. No da bonus, pero levanta mucho el rincón.",
	"consultorio_nutri": "El consultorio de tu nutricionista: escritorio, báscula con tallímetro y el póster del plato.",
	"muro_records": "Tus goles, asistencias, títulos y mejores temporadas, con datos reales.",
	"rincon_lectura": "Sillón, libro y luz cálida: lee para recuperar energía y ánimo.",
	"mesa_recuerdos": "Cartas y recuerdos de tu carrera. Consulta los momentos guardados.",
	"cama": "Aquí se duerme de verdad y se recupera la energía.",
	"tocador": "El rincón de arreglarse, con espejo y su banqueta.",
	"cama_perro": "Cojín, manta y juguete: el perro tiene dónde descansar.",
	"rascador_gato": "Postes y plataformas para que el gato tenga su rincón.",
	"lavanderia": "Lavadora, cesta y toallas para la ropa de entrenamiento.",
	"recibidor": "Llaves, mochila y zapatos: todo a mano junto a la entrada.",
	"vestidor": "Ropa de calle, tenis y espejo. Acércate para cambiarte.",
	"telescopio": "Tubo óptico sobre trípode para tu rincón junto a la ventana.",



	"cabina_podcast": "Micro, cascos y panel acústico. Graba tu semana: rinde con la prensa.",
	"tina_hielo": "Agua a tres grados. Tres minutos que las piernas agradecen.",
	"banco_botas": "Balda, cepillo y hormas. Botas cuidadas se gastan la mitad.",
	"toallero": "Barra de pared con toallas limpias. Pide muro para colgarse.",
	"espejo_cuerpo": "Luna de cuerpo entero para mirarte antes de salir.",
	"mesa_centro": "Baja, delante del sofá: ahí van el café y el mando.",
	"rincon_cafe": "Cafetera, tazas y molinillo. El primer café del día, en casa.",
	"aparador": "Vajilla a la vista tras el cristal. La mesa se pone desde aquí.",
	"gallinero": "Caseta con tejadillo y nidal: la gallina tiene dónde dormir.",
	"sofa": "Donde se reciben las visitas del vestuario.",
	"banca": "Un sitio más donde sentarse sin ocupar medio cuarto.",
	"cocina": "Comer bien en casa cuesta menos que comer fuera.",



	"cocina_isla": "La barra exenta: se cocina de un lado y se come del otro.",

	"cocina_dieta": "Comer medido: la misma comida de casa, pero pesada.",
	"mesa": "El centro de la sala: todo lo demás se acomoda alrededor.",
	"vitrina": "Tus copas, a la vista. Cuantas más perchas, más palmarés.",
	"balones": "Los balones de tus hat-tricks y las camisetas que cambiaste.",
	"balones_museo": "Treinta y dos balones tras el cristal, con luz de museo.",
	"playera": "Una playera enmarcada, la que tú elijas. Cuelga las que quieras.",
	"perchero_tienda": "Doce playeras en ganchos, como en la tienda: las tuyas y las que cambiaste.",
	"urna_playeras": "Tres playeras tras el cristal, con luz de museo.",
	"mural_playeras": "Seis playeras enmarcadas en dos filas: tu salón de la fama.",
	"vitrina_especiales": "Se llena sola con tus cambiadas más raras y valiosas.",
	"vitrina_torre": "Tres baldas en un metro: para el rincón que no da más.",
	"vitrina_galeria": "Cuatro metros de mostrador para alinear el palmarés.",
	"vitrina_premios": "Sólo para lo tuyo: los galardones individuales.",




	"vitrina_isla": "La isla de museo: cristal por los cuatro lados y tres baldas.",
	"gorras_seleccion": "Una gorra por partido con tu país. Se llena sola.",




	"balon_debut": "El balón de tu primer gol, bajo cristal y con su cartela.",




	"estatua_bronce": "Tú en bronce, sobre un plinto con tu nombre y tus títulos.",
	"repisa": "La vitrina del que empieza: pocas copas, pero las tuyas.",
	"camisetas": "Una playera enmarcada por cada club en el que jugaste.",
	"momentos": "Los récords de tu carrera, colgados.",
	"reloj": "Tu reloj de oro, expuesto en casa.",
	"tele": "Estudiar al rival antes del partido.",
	"arcade": "Una partida no cuesta acción de semana. Se está por estar.",
	"simulador": "Incluye un compacto para jugar y permite usar tus coches comprados. No gasta dinero ni acciones semanales.",



	"dardos": "Se tira como se chuta: tensas y sueltas. Reta a quien quieras.",
	"billar": "La resortera, sobre el paño. Una partida con el vestuario.",
	"maqueta": "Tu estadio en pequeño, con su marcador.",
	"piscina": "Nadar descansa y no gasta energía de entrenamiento.",
	"inodoro": "Cerámica, tapa y cisterna para completar el baño.",
	"lavabo": "Lavabo con espejo y grifo, listo junto al muro.",
	"ducha": "Mampara de cristal y regadera para el rincón del baño.",
	"tina": "Una tina de baño de borde ancho.",

	"sauna": "Calor seco en duelas de pino. Sales otro después del partido.",
	"moto": "Salir a rodar. No sirve para nada y por eso está.",
	"gimnasio": "El rack con la barra: levantar pesas sube tu físico.",
	"pesas": "La torre de mancuernas. Un rack solo no hace un gimnasio.",
	"cinta": "Correr en casa los días que no hay cancha.",
	"alfombra": "Va debajo de todo y no estorba a nada.",
	"planta": "Verde en un rincón. Cuesta poco y se nota.",
	"lampara": "Luz propia en el rincón que quede oscuro.",
	"librero": "Se apoya a ras de muro y llena una pared entera.",
	"espejo": "De cuerpo entero. Pide muro, como todo lo que cuelga.",
	"ventana": "Luz de verdad en el muro que tú elijas.",
	"ventanal": "Del suelo al techo: el muro entero se vuelve luz.",
	"ojo_buey": "Un redondel alto, para el rincón que pide poco.",
	"repisa_pared": "Una balda más para tus trofeos, donde tú digas.",

	"cuadro": "Un lienzo con marco. Lo más barato contra un muro pelado.",
	"banderines": "Los de tus clubes, cruzando el rincón en diagonal.",
	"bufandas": "Una bufanda por cada afición que te cantó.",
	"botines_muro": "Los botines de tus noches grandes, en peanas.",
	"tapiz": "Un tramo de muro con otra tela, de suelo a techo.",
	"panel_madera": "Duelas de suelo a techo: el muro deja de ser pared.",
	"mapa_giras": "Un mapamundi con una chincheta en cada país donde jugaste. Se llena solo.",
	"cartel_partido": "El cartel de tu mejor partido: rival, goles y nota.",
	"portada_prensa": "La portada del día que ganaste algo. Se reescribe sola.",
	"placa_fichaje": "El club, la temporada y lo que costó tu fichaje.",
	"tv_muro": "La pantalla colgada, sin mueble que la sostenga.",

	"escudo_muro": "El escudo de tu club, retroiluminado contra el muro.",
	"banderin_vitrina": "Un banderín de intercambio por cada club que pisaste.",
	"tifo_enmarcado": "Un trozo del tifo que te dedicó tu grada, enmarcado.",
	"balones_temporada": "Un balón por temporada, con los colores de aquel año.",
	"butaca_estadio": "Dos butacas originales de la grada, con su número.",
	"alfombra_circulo": "El círculo central tejido, con tu escudo en medio.",
	"casillero": "Tu taquilla del vestidor, con tu dorsal en la puerta.",
	"chimenea": "Fuego de verdad: da luz propia y calienta el rincón.",
	"plafon": "Luz de techo, la que hace que un cuarto deje de ser cueva.",
	"arana": "Cristal colgado en medio del salón. Se nota al entrar.",
	"aplique": "Va en pareja, uno a cada lado del muro que enseñas.",
	"lampara_mesa": "Con su buró incluido, para leer sin encender el cuarto.",
	"neon": "Tu nombre en neón, encendido toda la noche.",
	"tira_led": "Bordea el muro y baña el cuarto de color.",
	"macetero": "Verde de metro ochenta para el rincón que sobra.",
	"pecera_pie": "Una columna de agua con peces. No hace nada y se mira.",
	"bar_carrito": "Refrescos a mano cuando llega la visita.",
	"puf": "Se tira al suelo y ya hay un sitio más donde caer.",
	"baul": "Guarda lo que no se enseña, y hace de banco.",
	"percha": "Donde va la chamarra al entrar por la puerta.",



	"maletas": "Una maleta por club. La pila crece con cada traspaso.",
	"vinoteca": "Jugos en frío, iluminados. La compra del que presume.",
	"tocadiscos": "Vinilo, brazo y altavoces sobre su mueble de madera.",
	"despacho": "Escritorio, carpetas y caja fuerte. Aquí se firma lo que ganas.",
	"barbero": "Cuero, espejo con bombillas y carrito. Aquí se hacen las portadas.",

	"camastro": "Tumbarse al sol. Junto a la piscina se ven de a dos.",
	"sombrilla": "Sombra donde no hay árbol. Se planta y ya hay sitio.",
	"hamaca": "Lona suspendida entre dos postes para descansar al aire libre.",
	"arbusto": "Verde bajo para el borde. Lo barato que llena metros.",
	"arbol": "Tres metros de copa: lo único que da sombra de verdad.",
	"farol": "Luz propia en el jardín, encendida en cuanto cae la noche.",
	"fogata": "Fuego fuera: alumbra el patio y calienta la noche.",
	"huerto": "Bancales con verdura. Se come lo que sale de tu terreno.",
	"columpio": "Un banco colgado que se mece. Para ver caer la tarde.",
	"porteria": "Portería con red: entrenar en casa deja de ser una idea.",
	"estanque": "Agua quieta con carpas y una cascada que no calla.",
	"cocina_ext": "Barra, fuegos y fregadero fuera. El asador con casa.",
	"helipuerto": "La losa con la H. No sirve para nada y se ve desde el aire.",
}


static func kind_desc(kind: String) -> String:
	return String(KIND_DESC.get(kind, ""))


static func prop_alto(kind: String) -> float:
	if kind == "cochera":
		return 2.3
	if COCHES.has(kind):
		return 1.75
	return float(PROP_ALTO.get(kind, ALTO_POR_DEFECTO))








static func prop_span(prop: Dictionary) -> Vector2:
	var kind: String = String(prop.get("kind", ""))
	var alto: float = prop_alto(kind)





	if CIELO_KINDS.has(kind):
		var techo: float = float(prop.get("y", 2.2))
		return Vector2(techo - alto * 0.5, techo + alto * 0.5)
	if not HANG_KINDS.has(kind):
		return Vector2(0.0, alto)











	var marco: float = alto if kind in ["espejo", "reloj", "playera", "muro_records",
		"espejo_cuerpo", "toallero", "mural_playeras", "vitrina_especiales", "pared_reflejos"] else 0.5
	var centro: float = float(prop.get("y", 1.5))
	return Vector2(centro - marco * 0.5, centro + marco * 0.5)



const WALK_SPEED: float = 1.9





























































































const LEVELS: Array = [
	{
		"id": "depa",
		"name": "DEPARTAMENTO",
		"desc": "Un cuarto, una ventana y el sitio justo para la primera copa.",
		"price": 0, "upkeep": 0, "rest_raw": 0.0,
		"rel": {},

		"rooms": [
			{"id": "sala", "label": "SALA", "rect": Rect2(-2.5, 0.0, 5.0, 5.5)},
		],
		"props": [



			{"id": "sofa", "kind": "sofa", "rect": Rect2(-2.5, 2.0, 1.0, 2.0),
				"slot": ""},
			{"id": "mesa", "kind": "mesa", "rect": Rect2(-0.5, 2.0, 1.0, 1.0),
				"slot": ""},
			{"id": "repisa", "kind": "repisa", "rect": Rect2(-1.5, 5.0, 3.0, 0.5),
				"slot": "trofeos", "tiers": 2},
			{"id": "cama", "kind": "cama", "rect": Rect2(1.0, 1.0, 1.5, 2.0),
				"slot": ""},
			{"id": "alfombra", "kind": "alfombra", "pass": true,
				"rect": Rect2(-1.5, 1.5, 2.5, 2.0), "slot": "", "req": "deco_tapetes"},
			{"id": "tele", "kind": "tele", "rect": Rect2(1.5, 5.0, 1.0, 0.5),
				"slot": ""},
			{"id": "cocineta", "kind": "cocina", "rect": Rect2(1.0, 4.5, 1.5, 0.5),
				"slot": ""},
			{"id": "planta", "kind": "planta", "rect": Rect2(2.0, 3.5, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},




			{"id": "lampara", "kind": "lampara", "rect": Rect2(-2.5, 1.0, 0.5, 0.5),
				"slot": ""},





			{"id": "reloj", "kind": "reloj", "y": 1.45, "pass": true,
				"rect": Rect2(-2.5, 5.25, 0.5, 0.25), "slot": "", "req_life": "reloj"},







			{"id": "ventana", "kind": "ventana", "y": 1.45, "pass": true, "face": 3,
				"rect": Rect2(-2.5, 3.0, 0.25, 1.5), "slot": "",
				"req": "deco_ventana"},





			{"id": "repisa_muro", "kind": "repisa_pared", "y": 1.45, "pass": true,
				"tiers": 1, "rect": Rect2(1.5, 5.25, 1.0, 0.25),
				"slot": "trofeos", "req": "repisa_pared"},
		],


		"palette": {
			"floor": Color("9c8a70"), "wall": Color("8d8578"),
			"trim": Color("6b5540"), "wood": Color("6b5540"),
			"fabric": Color("7a5a4a"), "metal": Color("8a8a86"),
			"rug": Color("7a4040"),
		},
		"light": {
			"amb": Color("d0b795"), "amb_e": 0.42,
			"sun": Color("ffdcae"), "sun_e": 0.55, "bg": Color("15130f"),
		},
	},
	{
		"id": "casa",
		"name": "CASA CON JARDÍN",
		"desc": "Descansas de verdad: recuperas bastante más tras cada partido.",
		"price": 1260000, "upkeep": 6000, "rest_raw": 8.0,
		"rel": {"prensa": 12, "aficion": 6, "agente": 8, "tecnico": 4, "equipo": 2},


		"rooms": [
			{"id": "sala", "label": "SALA", "rect": Rect2(-4.5, 0.0, 9.0, 7.0)},
			{"id": "cuarto", "label": "RECÁMARA", "rect": Rect2(4.0, 1.0, 4.5, 4.5)},
			{"id": "patio", "label": "PATIO", "rect": Rect2(-3.0, 6.5, 6.0, 5.0)},






			{"id": "gimnasio", "label": "GIMNASIO",
				"rect": Rect2(-10.0, 0.0, 6.5, 4.5)},
		],
		"props": [
			{"id": "sofa", "kind": "sofa", "rect": Rect2(-4.5, 3.0, 1.0, 2.5),
				"slot": ""},
			{"id": "mesa", "kind": "mesa", "rect": Rect2(-2.5, 3.0, 2.0, 1.0),
				"slot": ""},




			{"id": "vitrina", "kind": "vitrina", "rect": Rect2(0.5, 6.5, 3.0, 0.5),
				"slot": "trofeos", "tiers": 2},




			{"id": "cama", "kind": "cama", "rect": Rect2(6.5, 3.5, 1.5, 2.0),
				"slot": ""},
			{"id": "librero", "kind": "librero", "rect": Rect2(8.0, 1.5, 0.5, 2.5),
				"slot": "", "req": "deco_libros", "pass": true},
			{"id": "alfombra", "kind": "alfombra", "pass": true,
				"rect": Rect2(-3.5, 2.5, 3.5, 2.5), "slot": "", "req": "deco_tapetes"},
			{"id": "tele", "kind": "tele", "rect": Rect2(-3.0, 6.5, 2.0, 0.5),
				"slot": ""},







			{"id": "cocina", "kind": "cocina", "rect": Rect2(1.5, 1.5, 2.0, 1.0),
				"slot": ""},
			{"id": "planta_1", "kind": "planta", "rect": Rect2(3.5, 3.0, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},
			{"id": "lampara", "kind": "lampara", "rect": Rect2(-4.0, 6.0, 0.5, 0.5),
				"slot": ""},
			{"id": "banca", "kind": "banca", "rect": Rect2(-2.5, 10.0, 2.0, 0.5),
				"slot": ""},
			{"id": "planta_2", "kind": "planta", "rect": Rect2(2.0, 9.5, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},



			{"id": "momentos", "kind": "momentos", "y": 1.5, "pass": true,



				"rect": Rect2(-4.5, 6.7, 1.5, 0.3), "slot": "", "req": "momentos"},
			{"id": "maqueta", "kind": "maqueta", "rect": Rect2(2.5, 5.0, 1.0, 0.5),
				"slot": "", "req": "maqueta"},



			{"id": "reloj", "kind": "reloj", "y": 1.45, "pass": true,
				"rect": Rect2(4.0, 6.75, 0.5, 0.25), "slot": "", "req_life": "reloj"},






			{"id": "gimnasio", "kind": "gimnasio", "rect": Rect2(-10.0, 1.5, 2.5, 1.0),
				"slot": "", "req": "gimnasio"},
			{"id": "pesas", "kind": "pesas", "rect": Rect2(-6.0, 2.5, 1.5, 0.5),
				"slot": "", "req": "gimnasio"},
			{"id": "espejo", "kind": "espejo", "y": 1.35, "pass": true,
				"rect": Rect2(-10.0, 4.28, 2.5, 0.22), "slot": "", "req": "gimnasio"},





			{"id": "ventana", "kind": "ventana", "y": 1.45, "pass": true,
				"rect": Rect2(4.25, 5.5, 0.25, 1.0), "slot": "",
				"req": "deco_ventana"},



			{"id": "repisa_muro", "kind": "repisa_pared", "y": 1.35, "pass": true,
				"tiers": 1, "rect": Rect2(3.5, 6.75, 0.5, 0.25),
				"slot": "trofeos", "req": "repisa_pared"},
		],

		"palette": {
			"floor": Color("b3a188"), "wall": Color("a89d8c"),
			"trim": Color("7d6247"), "wood": Color("8a6a45"),
			"fabric": Color("7a4a32"), "metal": Color("9a9086"),
			"rug": Color("8a4a4a"),
		},
		"light": {
			"amb": Color("d8c6a8"), "amb_e": 0.58,
			"sun": Color("ffe9c9"), "sun_e": 0.95, "bg": Color("1d1a16"),
		},
	},
	{
		"id": "moderna",
		"name": "CASA MODERNA",
		"desc": "Sala de trofeos propia y aún mejor descanso entre partidos.",
		"price": 4600000, "upkeep": 12000, "rest_raw": 14.0,
		"rel": {"prensa": 16, "aficion": 8, "agente": 10, "tecnico": 4, "equipo": 2},
















		"rooms": [
			{"id": "sala", "label": "SALA", "rect": Rect2(-6.0, 0.0, 12.0, 8.0)},
			{"id": "trofeos", "label": "SALA DE TROFEOS",
				"rect": Rect2(5.5, 1.5, 6.5, 5.5)},







			{"id": "premios", "label": "SALA DE PREMIOS",
				"rect": Rect2(11.0, 5.5, 5.5, 5.0)},






			{"id": "cuarto", "label": "RECÁMARA", "rect": Rect2(-6.0, 7.5, 4.0, 4.5)},
			{"id": "jardin", "label": "JARDÍN", "rect": Rect2(2.0, 7.5, 4.0, 6.0)},

			{"id": "gimnasio", "label": "GIMNASIO",
				"rect": Rect2(-12.0, 0.5, 7.0, 4.5)},
		],
		"props": [



			{"id": "sofa", "kind": "sofa", "rect": Rect2(-6.0, 5.0, 1.0, 2.0),
				"slot": ""},
			{"id": "mesa", "kind": "mesa", "rect": Rect2(-4.0, 3.5, 2.0, 1.0),
				"slot": ""},



			{"id": "vitrina_a", "kind": "vitrina", "rect": Rect2(6.0, 6.5, 4.5, 0.5),
				"slot": "trofeos", "tiers": 2},




			{"id": "vitrina_b", "kind": "vitrina", "rect": Rect2(11.5, 10.0, 5.0, 0.5),
				"slot": "premios", "tiers": 2},




















			{"id": "banca_p", "kind": "banca", "rect": Rect2(12.5, 8.0, 2.5, 0.5),
				"slot": ""},
			{"id": "alfombra_p", "kind": "alfombra", "pass": true,
				"rect": Rect2(12.0, 7.5, 3.5, 2.0), "slot": "", "req": "deco_tapetes"},
			{"id": "lampara_3", "kind": "lampara", "rect": Rect2(16.0, 6.0, 0.5, 0.5),
				"slot": "", "req": "deco_luz", "pass": true},
			{"id": "planta_3", "kind": "planta", "rect": Rect2(12.0, 5.5, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},


			{"id": "cama", "kind": "cama", "rect": Rect2(-5.5, 9.5, 2.0, 2.5),
				"slot": ""},


			{"id": "librero", "kind": "librero", "rect": Rect2(-3.0, 8.5, 0.5, 2.5),
				"slot": "", "req": "deco_libros", "pass": true},
			{"id": "alfombra", "kind": "alfombra", "pass": true,
				"rect": Rect2(-5.0, 2.5, 4.0, 3.0), "slot": "", "req": "deco_tapetes"},
			{"id": "alfombra_t", "kind": "alfombra", "pass": true,
				"rect": Rect2(6.5, 2.5, 4.5, 3.0), "slot": "", "req": "deco_tapetes"},



			{"id": "tele", "kind": "tele", "rect": Rect2(-1.0, 7.5, 2.0, 0.5),
				"slot": ""},




			{"id": "cocina", "kind": "cocina", "rect": Rect2(1.0, 2.0, 3.5, 1.0),
				"slot": ""},
			{"id": "planta_1", "kind": "planta", "rect": Rect2(4.5, 0.5, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},
			{"id": "planta_2", "kind": "planta", "rect": Rect2(-3.0, 7.0, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},
			{"id": "lampara_1", "kind": "lampara", "rect": Rect2(-5.5, 7.0, 0.5, 0.5),
				"slot": ""},


			{"id": "lampara_2", "kind": "lampara", "rect": Rect2(5.5, 1.5, 0.5, 0.5),
				"slot": "", "req": "deco_luz", "pass": true},
			{"id": "banca", "kind": "banca", "rect": Rect2(2.5, 12.0, 2.0, 0.5),
				"slot": ""},




			{"id": "momentos", "kind": "momentos", "y": 1.5, "pass": true,



				"rect": Rect2(-2.5, 7.7, 1.5, 0.3), "slot": "", "req": "momentos"},
			{"id": "maqueta", "kind": "maqueta", "rect": Rect2(8.0, 3.5, 1.5, 1.0),
				"slot": "", "req": "maqueta"},



			{"id": "arcade", "kind": "arcade", "rect": Rect2(1.0, 7.5, 1.0, 0.5),
				"slot": "", "req": "arcade"},


			{"id": "reloj", "kind": "reloj", "y": 1.45, "pass": true,
				"rect": Rect2(10.5, 6.75, 0.5, 0.25), "slot": "", "req_life": "reloj"},


			{"id": "piscina", "kind": "piscina", "rect": Rect2(2.5, 9.0, 2.5, 2.0),
				"slot": "", "req": "piscina"},
			{"id": "jacuzzi", "kind": "jacuzzi", "rect": Rect2(2.5, 11.0, 1.5, 1.0),
				"slot": "", "req": "jacuzzi"},


			{"id": "fuente", "kind": "fuente", "rect": Rect2(2.5, 12.5, 1.5, 1.0),
				"slot": ""},











			{"id": "gimnasio", "kind": "gimnasio", "rect": Rect2(-11.5, 2.0, 3.0, 1.0),
				"slot": "", "req": "gimnasio"},
			{"id": "pesas", "kind": "pesas", "rect": Rect2(-8.0, 2.0, 1.5, 0.5),
				"slot": "", "req": "gimnasio"},
			{"id": "cinta", "kind": "cinta", "rect": Rect2(-6.5, 2.0, 1.0, 2.0),
				"slot": "", "req": "gimnasio"},
			{"id": "espejo", "kind": "espejo", "y": 1.35, "pass": true,
				"rect": Rect2(-11.5, 4.78, 2.5, 0.22), "slot": "", "req": "gimnasio"},


			{"id": "ventana", "kind": "ventana", "y": 1.45, "pass": true,
				"rect": Rect2(5.75, 0.0, 0.25, 1.5), "slot": "",
				"req": "deco_ventana"},






			{"id": "repisa_muro", "kind": "repisa_pared", "y": 1.35, "pass": true,
				"tiers": 1, "rect": Rect2(-2.5, 11.75, 0.5, 0.25),
				"slot": "trofeos", "req": "repisa_pared"},
		],


		"palette": {
			"floor": Color("c9c2b6"), "wall": Color("d5d0c6"),
			"trim": Color("9a9288"), "wood": Color("a5875c"),
			"fabric": Color("5f6b74"), "metal": Color("b6bcc0"),
			"rug": Color("6b6f7a"),
		},
		"light": {
			"amb": Color("e2e0d8"), "amb_e": 0.78,
			"sun": Color("fff4e2"), "sun_e": 1.15, "bg": Color("232219"),
		},
	},
	{
		"id": "mansion",
		"name": "MANSION",
		"desc": "Galería, garage y tu cancha tras la puerta del fondo.",
		"price": 9000000, "upkeep": 20000, "rest_raw": 20.0,
		"rel": {"prensa": 22, "aficion": 10, "agente": 12, "tecnico": 4, "equipo": 2},


		"rooms": [
			{"id": "sala", "label": "SALÓN", "rect": Rect2(-8.0, 0.0, 16.0, 9.0)},
			{"id": "galeria", "label": "GALERIA", "rect": Rect2(7.5, 1.5, 7.0, 6.5)},
			{"id": "garage", "label": "GARAGE", "rect": Rect2(-14.5, 1.5, 7.0, 5.0)},
			{"id": "suite", "label": "SUITE", "rect": Rect2(-7.0, 8.5, 6.5, 5.5)},



			{"id": "gimnasio", "label": "GIMNASIO",
				"rect": Rect2(13.5, 2.0, 5.5, 5.0)},
		],
		"props": [
			{"id": "sofa", "kind": "sofa", "rect": Rect2(-8.0, 3.5, 1.0, 3.5),
				"slot": ""},
			{"id": "mesa", "kind": "mesa", "rect": Rect2(-5.5, 3.0, 2.5, 1.0),
				"slot": ""},






			{"id": "vitrina_a", "kind": "vitrina", "rect": Rect2(8.0, 7.5, 5.5, 0.5),
				"slot": "trofeos", "tiers": 1},




			{"id": "vitrina_c", "kind": "vitrina", "rect": Rect2(8.0, 5.5, 5.5, 0.5),
				"slot": "trofeos", "tiers": 2},


























			{"id": "vitrina_b", "kind": "vitrina", "rect": Rect2(8.5, 3.0, 5.0, 0.5),
				"slot": "premios", "tiers": 2},


			{"id": "vitrina_d", "kind": "vitrina", "rect": Rect2(1.0, 5.5, 7.0, 0.5),
				"slot": "premios", "tiers": 2},
			{"id": "vitrina_e", "kind": "vitrina", "rect": Rect2(5.5, 8.5, 2.0, 0.5),
				"slot": "premios", "tiers": 2},




			{"id": "vitrina_f", "kind": "vitrina", "rect": Rect2(-14.5, 4.0, 5.0, 0.5),
				"slot": "premios", "tiers": 2},













			{"id": "cama", "kind": "cama", "rect": Rect2(-6.5, 11.5, 2.0, 2.5),
				"slot": ""},
			{"id": "librero", "kind": "librero", "rect": Rect2(-2.0, 8.5, 2.5, 0.5),
				"slot": "", "req": "deco_libros", "pass": true},
			{"id": "alfombra", "kind": "alfombra", "pass": true,
				"rect": Rect2(-6.5, 2.5, 5.0, 3.0), "slot": "", "req": "deco_tapetes"},
			{"id": "alfombra_g", "kind": "alfombra", "pass": true,
				"rect": Rect2(8.5, 3.0, 5.0, 3.5), "slot": "", "req": "deco_tapetes"},
			{"id": "tele", "kind": "tele", "rect": Rect2(-4.0, 8.5, 1.5, 0.5),
				"slot": ""},






			{"id": "cocina", "kind": "cocina", "rect": Rect2(-8.0, 7.5, 3.5, 1.0),
				"slot": ""},
			{"id": "planta_1", "kind": "planta", "rect": Rect2(7.5, 0.5, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},


			{"id": "piano", "kind": "piano", "rect": Rect2(1.5, 1.0, 1.5, 2.0),
				"slot": "", "req": "piano"},


			{"id": "billar", "kind": "billar", "rect": Rect2(4.0, 3.5, 2.0, 1.0),
				"slot": "", "req": "billar"},
			{"id": "escultura", "kind": "escultura", "rect": Rect2(6.0, 4.0, 1.0, 1.0),
				"slot": "", "req": "escultura"},






			{"id": "acuario", "kind": "acuario", "rect": Rect2(-1.5, 1.5, 1.5, 0.5),
				"slot": "", "req": "acuario"},
			{"id": "planta_2", "kind": "planta", "rect": Rect2(-2.5, 6.5, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},



			{"id": "planta_3", "kind": "planta", "rect": Rect2(18.5, 2.5, 0.5, 0.5),
				"slot": "", "req": "deco_plantas", "pass": true},



			{"id": "lampara_1", "kind": "lampara", "rect": Rect2(-3.0, 7.5, 0.5, 0.5),
				"slot": ""},
			{"id": "lampara_2", "kind": "lampara", "rect": Rect2(8.0, 4.5, 0.5, 0.5),
				"slot": "", "req": "deco_luz", "pass": true},
			{"id": "lampara_3", "kind": "lampara", "rect": Rect2(-8.0, 0.5, 0.5, 0.5),
				"slot": "", "req": "deco_luz", "pass": true},






			{"id": "momentos", "kind": "momentos", "y": 1.5, "pass": true,
				"rect": Rect2(1.0, 8.7, 1.5, 0.3), "slot": "", "req": "momentos"},
			{"id": "arcade", "kind": "arcade", "rect": Rect2(2.5, 8.5, 1.0, 0.5),
				"slot": "", "req": "arcade"},



			{"id": "maqueta", "kind": "maqueta", "rect": Rect2(-1.5, 6.0, 1.0, 1.0),
				"slot": "", "req": "maqueta"},
			{"id": "piscina", "kind": "piscina", "rect": Rect2(-3.5, 10.5, 2.5, 2.0),
				"slot": "", "req": "piscina"},
			{"id": "jacuzzi", "kind": "jacuzzi", "rect": Rect2(-3.5, 12.5, 1.5, 1.5),
				"slot": "", "req": "jacuzzi"},








			{"id": "moto", "kind": "moto", "rect": Rect2(-14.0, 3.0, 1.5, 0.5),
				"slot": "", "req": "moto"},


			{"id": "reloj", "kind": "reloj", "y": 1.45, "pass": true,
				"rect": Rect2(14.0, 7.75, 0.5, 0.25), "slot": "", "req_life": "reloj"},





			{"id": "gimnasio", "kind": "gimnasio", "rect": Rect2(14.0, 3.0, 2.5, 1.0),
				"slot": "", "req": "gimnasio"},
			{"id": "pesas", "kind": "pesas", "rect": Rect2(17.0, 5.5, 1.5, 0.5),
				"slot": "", "req": "gimnasio"},





			{"id": "cinta", "kind": "cinta", "rect": Rect2(15.0, 5.0, 1.0, 1.5),
				"slot": "", "req": "gimnasio"},
			{"id": "espejo", "kind": "espejo", "y": 1.35, "pass": true,
				"rect": Rect2(15.5, 6.78, 3.0, 0.22), "slot": "", "req": "gimnasio"},




			{"id": "ventana", "kind": "ventana", "y": 1.45, "pass": true, "face": 3,
				"rect": Rect2(-8.0, 7.0, 0.25, 1.5), "slot": "",
				"req": "deco_ventana"},





			{"id": "repisa_muro", "kind": "repisa_pared", "y": 1.35, "pass": true,
				"tiers": 1, "rect": Rect2(13.5, 7.75, 0.5, 0.25),
				"slot": "trofeos", "req": "repisa_pared"},
		],



		"palette": {
			"floor": Color("d6c8ad"), "wall": Color("ddd5c4"),
			"trim": Color("b08a4a"), "wood": Color("6b4a2e"),
			"fabric": Color("6a3f4a"), "metal": Color("c9a961"),
			"rug": Color("8a3f42"),
		},
		"light": {
			"amb": Color("f0e2c8"), "amb_e": 0.86,
			"sun": Color("fff0d4"), "sun_e": 1.25, "bg": Color("241f18"),
		},
	},













	{
		"id": "finca",
		"name": "FINCA",
		"desc": "La casa más grande que se vende, y una planta hecha a la medida.",
		"price": 19500000, "upkeep": 34000, "rest_raw": 26.0,
		"rel": {"prensa": 28, "aficion": 14, "agente": 16, "tecnico": 6, "equipo": 4},
		"rooms": [
			{"id": "sala", "label": "SALÓN", "rect": Rect2(-10.0, 0.0, 20.0, 20.0)},
		],
		"props": [],
		"palette": {
			"floor": Color("cfc0a2"), "wall": Color("e4dccb"),
			"trim": Color("8a6f4a"), "wood": Color("5a4029"),
			"fabric": Color("5a6a62"), "metal": Color("b8b2a6"),
			"rug": Color("6a5a4a"),
		},
		"light": {
			"amb": Color("f2e8d2"), "amb_e": 0.9,
			"sun": Color("fff2dc"), "sun_e": 1.3, "bg": Color("20241f"),
		},
	},
]



















const PARCELAS: Array = [


	{"id": "terreno_e0", "level": 0, "name": "TERRENO ESTE",
		"desc": "Suelo nuevo pegado a la sala. Tuyo para lo que quieras.",
		"price": 120000, "rect": Rect2(2.5, 0.5, 3.0, 5.0)},
	{"id": "terreno_n0", "level": 0, "name": "TERRENO DEL FONDO",
		"desc": "El fondo del edificio, ganado al patio de luces.",
		"price": 180000, "rect": Rect2(-2.5, 5.5, 5.0, 3.5)},

	{"id": "terreno_e1", "level": 1, "name": "TERRENO ESTE",
		"desc": "Suelo nuevo junto a la recámara.",
		"price": 360000, "rect": Rect2(8.5, 1.0, 4.0, 4.5)},
	{"id": "terreno_n1", "level": 1, "name": "TERRENO DEL FONDO",
		"desc": "El fondo del patio, allanado y tuyo.",
		"price": 450000, "rect": Rect2(-3.0, 11.5, 6.0, 4.0)},

	{"id": "terreno_o2", "level": 2, "name": "TERRENO OESTE",
		"desc": "Suelo nuevo sobre el gimnasio, con paso a la sala.",
		"price": 1050000, "rect": Rect2(-12.0, 5.0, 6.0, 2.5)},
	{"id": "terreno_n2", "level": 2, "name": "TERRENO DEL FONDO",
		"desc": "Del jardín a la sala de premios, todo tuyo.",
		"price": 1200000, "rect": Rect2(6.0, 10.5, 6.5, 4.0)},

	{"id": "terreno_n3", "level": 3, "name": "ALA NORTE",
		"desc": "Un ala entera tras el salón, pegada a la suite.",
		"price": 2100000, "rect": Rect2(-0.5, 9.0, 7.0, 5.0)},






	{"id": "terreno_o3", "level": 3, "name": "TERRENO DEL GARAGE",
		"desc": "El costado del garage, listo para lo que sea.",
		"price": 2400000, "rect": Rect2(-18.0, 1.5, 3.5, 5.0)},
]




static func parcels_for(level: int) -> Array:
	var out: Array = []
	for p in PARCELAS:
		if int(p["level"]) == clamp_level(level):
			out.append(p)
	return out


static func parcel_by_id(id: String) -> Dictionary:
	for p in PARCELAS:
		if String(p["id"]) == id:
			return p
	return {}





static func parcel_rooms(level: int, owned: Array) -> Array:
	var out: Array = []
	for p in parcels_for(level):
		if owned.has(String(p["id"])):
			out.append({"id": String(p["id"]), "label": "TERRENO",
				"rect": p["rect"], "parcela": true})
	return out




static func count() -> int:
	return LEVELS.size()




static func clamp_level(level: int) -> int:
	return clampi(level, 0, LEVELS.size() - 1)


static func level_data(level: int) -> Dictionary:
	return LEVELS[clamp_level(level)]























const TERRENOS: Array = [
	{"id": "t8", "lado": 8.0, "price": 0},
	{"id": "t12", "lado": 12.0, "price": 900000},
	{"id": "t16", "lado": 16.0, "price": 2500000},





	{"id": "t20", "lado": 20.0, "price": 4100000},













	{"id": "t24", "lado": 24.0, "price": 4700000},





























	{"id": "t28", "lado": 28.0, "price": 5300000},
	{"id": "t32", "lado": 32.0, "price": 5900000},
	{"id": "t36", "lado": 36.0, "price": 6500000},
]






const TIER_TOPE_REGALO: int = 3





static func tier_tras_mudanza(tier: int) -> int:
	return clamp_tier(maxi(tier, mini(tier + 1, TIER_TOPE_REGALO)))




static func tier_migrado(parcelas: int) -> int:
	return clamp_tier(mini(parcelas, TIER_TOPE_REGALO))


static func clamp_tier(tier: int) -> int:
	return clampi(tier, 0, TERRENOS.size() - 1)


static func lado_of(tier: int) -> float:
	return float(TERRENOS[clamp_tier(tier)]["lado"])













static func solar_invested(tier: int) -> int:
	var total: int = 0
	for i in range(0, clamp_tier(tier) + 1):
		total += int(TERRENOS[i].get("price", 0))
	return total


static func tier_next(tier: int) -> Dictionary:
	var n: int = tier + 1
	return TERRENOS[n] if n >= 0 and n < TERRENOS.size() else {}





























static func crece_capa(capa: Dictionary, pl_viejo: Dictionary,
		pl_nuevo: Dictionary) -> Dictionary:
	var out: Dictionary = capa.duplicate(true)
	var tabiques: Array =(capa.get("tabiques", pl_viejo.get("tabiques", [])) as Array) \
			.duplicate(true)
	var nuevos: Array = []
	var puerta: Vector2 = plan_door(pl_viejo)
	for run in plan_cascaron(pl_viejo):
		var a: Vector2 = run[0]
		var b: Vector2 = run[1]
		var n: int = int(round(a.distance_to(b) / CELDA))
		if n <= 0:
			continue
		var paso: Vector2 =(b - a) / float(n)


		var tipos: Array = []
		for i in n:
			var mid: Vector2 = a + paso *(float(i) + 0.5)
			if in_opening(pl_viejo, mid) or _en_tabique_cualquiera(tabiques, mid):
				tipos.append("x")
			elif in_window(pl_viejo, mid):
				tipos.append("ventana")
			else:
				tipos.append("")

		var i0: int = 0
		while i0 < n:
			var i1: int = i0
			while i1 + 1 < n and tipos[i1 + 1] == tipos[i0]:
				i1 += 1
			if tipos[i0] != "x":
				var seg: Array = [a + paso * float(i0), a + paso * float(i1 + 1),
					String(tipos[i0]), ""]
				if tipos[i0] == "":
					nuevos.append_array(_con_ventana_auto(seg, pl_viejo, tabiques))
				else:
					nuevos.append(seg)
			i0 = i1 + 1








	var flanco: Vector2 = Vector2(PUERTA_ANCHO * 0.5 + CELDA * 0.5, 0.0)
	if _hay_pared(pl_viejo, tabiques, puerta - flanco) \
			and _hay_pared(pl_viejo, tabiques, puerta + flanco) \
			and not _en_tabique_cualquiera(tabiques, puerta):
		nuevos.append([puerta - Vector2(PUERTA_ANCHO * 0.5, 0.0),
			puerta + Vector2(PUERTA_ANCHO * 0.5, 0.0), "puerta", ""])
	out["tabiques"] = tabiques + nuevos
	out["aberturas"] = plan_cascaron(pl_nuevo)


	out["ventanas"] = []
	return out





static func _en_tabique_cualquiera(tabiques: Array, p: Vector2) -> bool:
	for t in tabiques:
		if not (t is Array) or (t as Array).size() < 2:
			continue
		if tabique_rect(t[0], t[1]).grow(0.01).has_point(p):
			return true
	return false




static func _hay_pared(pl: Dictionary, tabiques: Array, p: Vector2) -> bool:
	return not in_opening(pl, p) or _en_tabique_cualquiera(tabiques, p)











static func _con_ventana_auto(seg: Array, pl: Dictionary, tabiques: Array = []) -> Array:
	var a: Vector2 = seg[0]
	var b: Vector2 = seg[1]
	var largo: float = a.distance_to(b)
	var n: int = int(round(largo / CELDA))
	var dir: Vector2 =(b - a) / largo



	var fuera: Vector2 = Vector2(- dir.y, dir.x)
	if plan_in_floor(pl,(a + b) * 0.5 + fuera * 0.3):
		fuera = - fuera
	if largo < 1.5 - 0.001 or not muro_libre(pl,(a + b) * 0.5 + fuera * 0.125):
		return [seg]


	var meta: float = minf(largo * 0.45, 1.6) / CELDA
	var k: int = -1
	for c in range(2, n - 1):
		if (n - c) % 2 == 0 and (k < 0 or absf(float(c) - meta) < absf(float(k) - meta)):
			k = c
	if k < 2:
		return [seg]

	var v0: Vector2 = a + dir *(CELDA * float(n - k) * 0.5)
	var v1: Vector2 = v0 + dir *(CELDA * float(k))
	var vano: Rect2 = tabique_rect(v0, v1).grow(TABIQUE_T)
	for t in tabiques:
		if not (t is Array) or (t as Array).size() < 2:
			continue
		if vano.has_point(t[0]) or vano.has_point(t[1]):
			return [seg]
	return [[a, v0, "", ""], [v0, v1, "ventana", ""], [v1, b, "", ""]]






static func muro_libre(pl: Dictionary, at: Vector2, clear: float = 0.85) -> bool:
	for prop in (pl.get("props", []) as Array):
		if bool(prop.get("guardado", false)):
			continue
		var req: String = String(prop.get("req", ""))
		if not req.is_empty() and not Career.house_extras.has(req):
			continue
		var life: String = String(prop.get("req_life", ""))
		if not life.is_empty() and not Career.lifestyle.has(life):
			continue
		var kind: String = String(prop.get("kind", ""))
		var cuelga: bool = HANG_KINDS.has(kind)
		if bool(prop.get("pass", false)) and not cuelga:
			continue
		if not cuelga and prop_alto(kind) < 1.0:
			continue
		var r: Rect2 = prop["rect"]
		var closest: Vector2 = Vector2(
			clampf(at.x, r.position.x, r.end.x),
			clampf(at.y, r.position.y, r.end.y))
		if at.distance_to(closest) < clear:
			return false
	return true







static func anillo_de_pasto(pintura: Dictionary, viejo: Rect2,
		nuevo: Rect2) -> Dictionary:
	var out: Dictionary = pintura.duplicate()
	var i0: int = int(floorf(nuevo.position.x / CELDA))
	var j0: int = int(floorf(nuevo.position.y / CELDA))
	var i1: int = int(ceilf(nuevo.end.x / CELDA)) - 1
	var j1: int = int(ceilf(nuevo.end.y / CELDA)) - 1
	for i in range(i0, i1 + 1):
		for j in range(j0, j1 + 1):
			var centro: Vector2 = Vector2((float(i) + 0.5) * CELDA,
				(float(j) + 0.5) * CELDA)
			if viejo.has_point(centro):
				continue



			out["%d|%d" % [i, j]] = PISO_PASTO
	return out





static func celdas_pintadas(pintura: Dictionary) -> int:
	var n: int = 0
	for k in pintura:
		if String(pintura[k]) != PISO_PASTO:
			n += 1
	return n





static func square_plan(tier: int) -> Dictionary:
	var l: float = lado_of(tier)
	return {
		"rooms": [{"id": "terreno", "label": "",
			"rect": Rect2(- l * 0.5, - l * 0.5, l, l)}],
		"props": [],
		"tabiques": [],



		"aberturas": [],


		"ventanas": [],










		"puerta": Vector2(0.0, - l * 0.5),
	}










static var _bp_mem: Dictionary = {}


















const KIND_SIZE: Dictionary = {
	"tapete_ovalado": Vector2(2.5, 1.5),
	"tapete_hexagonal": Vector2(2, 2),
	"tapete_organico": Vector2(2.5, 2),
	"tapete_pasillo": Vector2(3.5, 1),
	"tapete_redondo": Vector2(1.5, 1.5),
	"tapete_tejido": Vector2(2.5, 1.5),
	"bocinas_torre": Vector2(1.5, 0.5),
	"bocinas_estante": Vector2(1.5, 0.5),
	"librero_abierto": Vector2(2, 0.5),
	"librero_modular": Vector2(1.5, 0.5),
	"alberca_surf": Vector2(5, 3.5),
	"mesa_holografica": Vector2(2, 1.5),
	"espejo_inteligente": Vector2(1, 0.5),
	"robot_aspirador": Vector2(0.5, 0.5),
	"cama_penthouse": Vector2(3, 2.5),
	"comedor_penthouse": Vector2(3, 2),
	"sofa_penthouse": Vector2(3, 1.5),
	"canasta_basket": Vector2(1.5, 1.5), "reloj_pie": Vector2(1.0, 0.5),
	"pingpong": Vector2(3.0, 1.5), "brazalete_capitan": Vector2(1.0, 0.5),

	"pared_reflejos": Vector2(2.0, 0.25), "memorama": Vector2(1.5, 1.0),
	"posadero_loro": Vector2(0.5, 0.5),
	"simulador": Vector2(2.5, 2.0),
	"cochera": Vector2(14, 18),

	"coche": Vector2(5.0, 2.5), "coche_muscle": Vector2(5.0, 2.5),
	"coche_gt": Vector2(5.0, 2.5), "coche_hiper": Vector2(5.0, 2.5),
	"coche_compacto": Vector2(5.0, 2.5), "coche_sedan": Vector2(5.0, 2.5),
	"coche_familiar": Vector2(5.0, 2.5), "coche_pickup": Vector2(5.0, 2.5),
	"camilla_fisio": Vector2(2.0, 1.0), "pizarra_tactica": Vector2(1.5, 0.5),
	"bici_estatica": Vector2(1.0, 1.5), "muro_records": Vector2(2.0, 0.25),
	"rincon_lectura": Vector2(2.0, 1.5), "mesa_recuerdos": Vector2(1.5, 0.5),
	"colchon_estiramientos": Vector2(2.0, 1.0),
	"maquina_respiracion": Vector2(1.0, 1.0),
	"vision_board": Vector2(1.5, 0.25),
	"vinoteca_saludable": Vector2(1.5, 0.5),
	"lampara_sol": Vector2(1.0, 1.0),
	"consultorio_nutri": Vector2(2.0, 1.0),


	"cama_perro": Vector2(1.0, 1.0),
	"rascador_gato": Vector2(1.0, 1.0),
	"lavanderia": Vector2(1.5, 0.5),
	"recibidor": Vector2(1.5, 0.5),
	"vestidor": Vector2(2.0, 0.5),
	"telescopio": Vector2(1.0, 1.0),





	"cabina_podcast": Vector2(1.5, 1.0),
	"tina_hielo": Vector2(1.5, 1.0),
	"banco_botas": Vector2(1.5, 0.5),
	"toallero": Vector2(1.0, 0.25),
	"espejo_cuerpo": Vector2(0.5, 0.25),
	"mesa_centro": Vector2(1.0, 0.5),
	"rincon_cafe": Vector2(1.0, 0.5),
	"aparador": Vector2(1.5, 0.5),
	"gallinero": Vector2(1.0, 1.0),
	"inodoro": Vector2(0.5, 1.0),
	"lavabo": Vector2(1.0, 0.5),
	"ducha": Vector2(1.0, 1.0),
	"tina": Vector2(1.5, 1.0),





	"sauna": Vector2(2.0, 1.5),



	"poker": Vector2(2.0, 1.5),










	"dardos": Vector2(1.0, 0.25),




	"silla": Vector2(0.5, 0.5),
	"silla_alta": Vector2(0.5, 0.5),









	"tocador": Vector2(1.5, 1.0),
















	"cocina_isla": Vector2(2.0, 1.0),
	"sillon": Vector2(1.0, 1.0),




	"balones": Vector2(1.5, 0.5),


	"balones_museo": Vector2(3.0, 1.0),








	"playera": Vector2(1.5, 0.25),








	"vitrina_torre": Vector2(1.0, 0.5),
	"vitrina_galeria": Vector2(4.0, 0.5),


	"vitrina_premios": Vector2(1.5, 0.5),




















	"vitrina_isla": Vector2(2.0, 1.0),


	"perchero_tienda": Vector2(3.5, 0.5),


	"urna_playeras": Vector2(2.5, 0.5),


	"mural_playeras": Vector2(2.5, 0.3),

	"vitrina_especiales": Vector2(3.5, 0.4),





	"gorras_seleccion": Vector2(1.5, 0.5),





	"balon_debut": Vector2(1.0, 0.5),














	"estatua_bronce": Vector2(1.0, 1.0),









	"mesa_jardin": Vector2(2.0, 2.0),


	"pergola": Vector2(3.0, 2.5),





	"ventana": Vector2(1.5, 0.25),
	"ventanal": Vector2(2.5, 0.25),
	"ojo_buey": Vector2(0.5, 0.25),







	"cuadro": Vector2(1.0, 0.25),





	"camisetas": Vector2(2.0, 0.3),
	"banderines": Vector2(2.0, 0.2),
	"bufandas": Vector2(2.0, 0.3),
	"botines_muro": Vector2(1.5, 0.3),
	"tapiz": Vector2(2.0, 0.15),
	"panel_madera": Vector2(2.0, 0.15),
	"mapa_giras": Vector2(2.0, 0.25),
	"cartel_partido": Vector2(1.5, 0.25),
	"portada_prensa": Vector2(1.0, 0.2),
	"placa_fichaje": Vector2(1.0, 0.2),
	"tv_muro": Vector2(1.5, 0.25),



	"escudo_muro": Vector2(1.5, 0.2),
	"banderin_vitrina": Vector2(1.5, 0.3),
	"tifo_enmarcado": Vector2(2.0, 0.2),
	"balones_temporada": Vector2(1.5, 0.3),
	"aplique": Vector2(0.5, 0.25),
	"neon": Vector2(1.0, 0.25),
	"tira_led": Vector2(1.5, 0.15),


	"chimenea": Vector2(1.5, 0.5),

	"butaca_estadio": Vector2(1.5, 1.0),
	"casillero": Vector2(1.0, 0.5),
	"alfombra_circulo": Vector2(3.0, 2.5),
	"plafon": Vector2(0.5, 0.5),
	"arana": Vector2(1.0, 1.0),
	"lampara_mesa": Vector2(0.5, 0.5),
	"macetero": Vector2(0.5, 0.5),
	"pecera_pie": Vector2(0.5, 0.5),
	"bar_carrito": Vector2(1.0, 0.5),
	"puf": Vector2(1.0, 1.0),
	"baul": Vector2(1.0, 0.5),
	"percha": Vector2(0.5, 0.5),





	"maletas": Vector2(1.0, 0.5),
	"vinoteca": Vector2(1.0, 0.5),
	"tocadiscos": Vector2(1.0, 0.5),




	"despacho": Vector2(1.5, 1.0),










	"barbero": Vector2(1.5, 1.0),











	"camastro": Vector2(2.0, 1.0),
	"sombrilla": Vector2(1.5, 1.5),
	"hamaca": Vector2(2.5, 1.0),
	"arbusto": Vector2(1.0, 1.0),
	"arbol": Vector2(1.5, 1.5),
	"farol": Vector2(0.5, 0.5),
	"fogata": Vector2(1.5, 1.5),
	"huerto": Vector2(2.0, 1.5),
	"columpio": Vector2(2.0, 1.0),
	"porteria": Vector2(3.0, 1.0),
	"estanque": Vector2(3.0, 2.0),
	"cocina_ext": Vector2(3.0, 1.0),







	"cocina_dieta": Vector2(2.0, 0.5),



	"helipuerto": Vector2(5.0, 5.0),
}










const KIND_TPL: Dictionary = {


	"alfombra_circulo": {"pass": true},
	"tapete_ovalado": {"pass": true},
	"tapete_hexagonal": {"pass": true},
	"tapete_organico": {"pass": true},
	"tapete_pasillo": {"pass": true},
	"tapete_redondo": {"pass": true},
	"tapete_tejido": {"pass": true},

	"posadero_loro": {"pass": true},
	"cochera": {"pass": true},
	"muro_records": {"y": 1.5, "pass": true},

	"pared_reflejos": {"y": 1.4, "pass": true},



	"cama_perro": {"pass": true},
	"rascador_gato": {"pass": true},

	"gallinero": {"pass": true},



	"toallero": {"y": 1.1, "pass": true},
	"espejo_cuerpo": {"y": 0.95, "pass": true},








	"pergola": {"pass": true},
	"ventana": {"y": 1.45, "pass": true},



	"ventanal": {"y": 1.2, "pass": true},



	"ojo_buey": {"y": 1.75, "pass": true},








	"cuadro": {"y": 1.55, "pass": true},







	"dardos": {"y": 1.73, "pass": true},
	"banderines": {"y": 1.95, "pass": true},
	"bufandas": {"y": 1.5, "pass": true},
	"botines_muro": {"y": 1.45, "pass": true},
	"tapiz": {"y": 1.15, "pass": true},
	"panel_madera": {"y": 1.15, "pass": true},
	"mapa_giras": {"y": 1.5, "pass": true},
	"cartel_partido": {"y": 1.35, "pass": true},
	"portada_prensa": {"y": 1.5, "pass": true},
	"placa_fichaje": {"y": 1.55, "pass": true},
	"tv_muro": {"y": 1.5, "pass": true},



	"escudo_muro": {"y": 1.65, "pass": true},
	"banderin_vitrina": {"y": 1.5, "pass": true},
	"tifo_enmarcado": {"y": 1.45, "pass": true},
	"balones_temporada": {"y": 1.3, "pass": true},
	"aplique": {"y": 1.75, "pass": true},
	"neon": {"y": 1.8, "pass": true},
	"tira_led": {"y": 2.05, "pass": true},


	"plafon": {"y": 2.2, "pass": true},
	"arana": {"y": 1.95, "pass": true},




	"lampara_mesa": {"pass": true},
	"macetero": {"pass": true},
	"percha": {"pass": true},









	"sombrilla": {"pass": true},
	"arbol": {"pass": true},
	"arbusto": {"pass": true},
	"farol": {"pass": true},
	"huerto": {"pass": true},
	"helipuerto": {"pass": true},












	"playera": {"slot": "camisetas", "cap": 1, "y": 1.3, "pass": true},


	"camisetas": {"slot": "camisetas", "cap": 2, "y": 1.55},
	"vitrina_torre": {"slot": "trofeos", "tiers": 3},
	"vitrina_galeria": {"slot": "trofeos", "tiers": 1},
	"vitrina_premios": {"slot": "premios", "tiers": 2},




	"vitrina_isla": {"slot": "trofeos", "tiers": 3},





	"perchero_tienda": {"slot": "camisetas", "cap": 12, "y": 1.7},





	"urna_playeras": {"slot": "camisetas", "cap": 3, "y": 1.42},
	"mural_playeras": {"slot": "camisetas", "cap": 6, "y": 1.27},
	"vitrina_especiales": {"slot": "camisetas", "cap": 4, "y": 1.4},
}
















const KIND_SIZE_COLOCADA: Dictionary = {
	"vitrina": Vector2(2.5, 0.5),
}















const KIND_SLOT_COLOCADA: Dictionary = {
	"vitrina": "trofeos",
}







const JERSEY_PITCH: float = 1.0


static func blueprint_prop(kind: String) -> Dictionary:
	if kind.is_empty():
		return {}
	if _bp_mem.has(kind):
		return _bp_mem[kind]
	if KIND_SIZE.has(kind):
		var extra: Dictionary = KIND_TPL.get(kind, {})




		var t: Dictionary = {"size": KIND_SIZE[kind],
			"slot": String(extra.get("slot", "")),
			"tiers": int(extra.get("tiers", 0)),
			"cap": int(extra.get("cap", 1)),
			"y": float(extra.get("y", 0.0)),
			"pass": bool(extra.get("pass", false))}
		_bp_mem[kind] = t
		return t
	var best: Dictionary = {}
	var best_area: float = -1.0
	var cap_max: int = 0
	for lv in LEVELS:
		for p in lv.get("props", []):
			if String(p.get("kind", "")) != kind:
				continue
			cap_max = maxi(cap_max, int(p.get("cap", 0)))
			var s: Vector2 =(p["rect"] as Rect2).size
			var area: float = s.x * s.y
			if area > best_area:
				best_area = area
				best = p
	cap_max = maxi(cap_max, 1)
	var tpl: Dictionary = {}
	if not best.is_empty():
		tpl = {"size":(best["rect"] as Rect2).size,
			"slot": String(best.get("slot", "")),
			"tiers": int(best.get("tiers", 0)),
			"y": float(best.get("y", 0.0)),















			"cap": cap_max,
			"pass": bool(best.get("pass", false))}


	if not tpl.is_empty() and KIND_SLOT_COLOCADA.has(kind):
		tpl["slot"] = String(KIND_SLOT_COLOCADA[kind])
	if not tpl.is_empty() and KIND_SIZE_COLOCADA.has(kind):
		tpl["size"] = KIND_SIZE_COLOCADA[kind]
	_bp_mem[kind] = tpl
	return tpl


static func blueprint_of(kind: String) -> Vector2:
	var tpl: Dictionary = blueprint_prop(kind)
	return tpl.get("size", Vector2.ZERO) if not tpl.is_empty() else Vector2.ZERO









static var colocar_al_entrar: String = ""
















static var planos_prueba: Dictionary = {}


static func plan_base(_level: int) -> Dictionary:
	if not planos_prueba.is_empty():
		return planos_prueba.duplicate(true)
	return square_plan(Career.land_tier)


















static var _plan_key: String = ""
static var _plan_mem: Dictionary = {}










static func item_puesto(iid: String) -> bool:
	if Career.house_extras.has("cochera"):
		for it in Career.house_items:
			if it.get("iid") == iid and (it.get("kind") == "cochera" \
					or (COCHES.has(String(it.get("kind", ""))) and Career.has_lifestyle(String(it["kind"])))):
				return true
	for level in count():
		var capa: Dictionary = Career.house_layout.get(layout_key(level), {})
		var ov: Variant = capa.get(iid, null)
		if ov is Dictionary and not bool((ov as Dictionary).get("guardado", false)):
			return true
	return false






static func extra_items(extra_id: String) -> Array:
	var out: Array = []
	for it in Career.house_items:
		var d: Dictionary = it
		if String(d.get("extra", "")) == extra_id and not bool(d.get("copia", false)):
			out.append(String(d.get("iid", "")))
	return out












static func copy_blueprint(_level: int, extra_id: String) -> Dictionary:
	var kind: String = extra_kind(extra_id)
	if kind.is_empty():
		return {}
	var size: Vector2 = blueprint_of(kind)
	if size == Vector2.ZERO:
		return {}
	return {"kind": kind, "size": size}











static func extra_kinds(extra_id: String) -> Array:
	var e: Dictionary = extra_by_id(extra_id)
	var suyo: String = String(e.get("kind", ""))
	if not suyo.is_empty():
		return [suyo]
	var out: Array = []
	for lv in LEVELS:
		for p in lv.get("props", []):
			if String(p.get("req", "")) != extra_id:
				continue
			var k: String = String(p.get("kind", ""))
			if not k.is_empty() and not out.has(k):
				out.append(k)
	return out











const COCHES: Array[String] = ["coche", "coche_muscle", "coche_gt", "coche_hiper",
	"coche_compacto", "coche_sedan", "coche_familiar", "coche_pickup"]


static func lifestyle_kind(life_id: String) -> String:
	if life_id.is_empty():
		return ""
	if COCHES.has(life_id):
		return life_id
	for lv in LEVELS:
		for p in lv.get("props", []):
			if String(p.get("req_life", "")) == life_id:
				return String(p.get("kind", ""))
	return ""


static func extra_kind(extra_id: String) -> String:
	var e: Dictionary = extra_by_id(extra_id)
	var kind: String = String(e.get("kind", ""))
	if not kind.is_empty():
		return kind
	for lv in LEVELS:
		for p in lv.get("props", []):
			if String(p.get("req", "")) == extra_id:
				return String(p.get("kind", ""))
	return ""


























const PUERTA_ANCHO: float = CELDA * 2.0














const PUERTA_ALTO: float = 1.95



const CORREDIZA_ANCHO: float = CELDA * 4.0
















static func split_wall(t: Array, celda: Vector2, tipo: String = "puerta",
		ancho: float = -1.0) -> Array:
	if ancho <= 0.0:
		ancho = PUERTA_ANCHO
	var a: Vector2 = t[0]
	var b: Vector2 = t[1]
	var vert: bool = absf(b.x - a.x) < 0.01
	var eje_a: float = a.y if vert else a.x
	var eje_b: float = b.y if vert else b.x
	var lo: float = minf(eje_a, eje_b)
	var hi: float = maxf(eje_a, eje_b)
	var c: float = celda.y if vert else celda.x
	if c < lo - 0.01 or c > hi + 0.01:
		return [t]

	if hi - lo < ancho - 0.01:
		return [[t[0], t[1], tipo, wall_finish(t)]]


	c = clampf(c, lo, hi - ancho)
	var fijo: float = a.x if vert else a.y



	var acab: String = wall_finish(t)
	var out: Array = []
	var punto := func(v: float) -> Vector2:
		return Vector2(fijo, v) if vert else Vector2(v, fijo)
	if c - lo > 0.01:
		out.append([punto.call(lo), punto.call(c), "", acab])
	out.append([punto.call(c), punto.call(c + ancho), tipo, acab])
	if hi -(c + ancho) > 0.01:
		out.append([punto.call(c + ancho), punto.call(hi), "", acab])
	return out


static func item_props() -> Array:
	var out: Array = []
	for it in Career.house_items:
		var kind: String = String(it.get("kind", ""))
		if kind.is_empty():
			continue

		if COCHES.has(kind) and not Career.has_lifestyle(kind):
			continue
		var size: Variant = it.get("size", null)
		if kind == "cochera":
			size = blueprint_of(kind)
		if not (size is Vector2):
			continue
		var tpl: Dictionary = blueprint_prop(kind)
		var p: Dictionary = {
			"id": String(it.get("iid", "")),
			"kind": kind,
			"rect": Rect2(Vector2.ZERO, size as Vector2),
			"slot": String(tpl.get("slot", "")),
			"guardado": true,
			"copia": true,
		}




		var de: Dictionary = extra_by_id(String(it.get("extra", "")))
		if de.has("col") and de["col"] is Color:
			p["col"] = de["col"]
		if int(tpl.get("tiers", 0)) > 0:
			p["tiers"] = int(tpl["tiers"])
		if float(tpl.get("y", 0.0)) > 0.0:
			p["y"] = float(tpl["y"])
		if bool(tpl.get("pass", false)):
			p["pass"] = true


		if int(tpl.get("cap", 0)) > 0:
			p["cap"] = int(tpl["cap"])
		out.append(p)
	return out





















static func layout_key(_level: int) -> String:
	return "0|0"





static func layout_key_vieja(k: String) -> bool:
	return not k.contains("|")


static func plan_of(level: int) -> Dictionary:
	var capa: Dictionary = Career.house_layout.get(layout_key(level), {})







	var key: String = "%d|%d|%d|%d|%d|%d|%d" % [clamp_level(level),
		hash(capa), Career.land_tier, hash(Career.house_items),
		hash(planos_prueba), hash(Career.house_extras),
		hash(Career.floor_paint_of()) if Career.house_extras.has("cochera") else 0]
	if key == _plan_key and not _plan_mem.is_empty():
		return _plan_mem
	var out: Dictionary = _plan_calc(level, capa)
	_plan_key = key
	_plan_mem = out
	return out





static func _plan_calc(level: int, capa: Dictionary) -> Dictionary:
	var base: Dictionary = plan_base(level)















	var copias: Array = item_props()
	if not copias.is_empty():





		var con_copias: Dictionary = base.duplicate()
		con_copias["props"] =(base["props"] as Array) + copias
		base = con_copias








	preload("res://features/career/cochera.gd").integrar(base)
	var tabiques: Array = capa.get("tabiques", base.get("tabiques", []))




	var aberturas: Array = capa.get("aberturas", base.get("aberturas", []))


	var ventanas: Array = capa.get("ventanas", base.get("ventanas", []))
	if capa.is_empty():
		preload("res://features/career/cochera.gd").conectar(base)
		return base
	base["tabiques"] = tabiques
	base["aberturas"] = aberturas
	base["ventanas"] = ventanas
	var props: Array = []
	var sucio: bool = false
	for prop in base["props"]:
		if prop.get("fijo", false):
			props.append(prop)
			continue
		var ov: Dictionary = capa.get(String(prop.get("id", "")), {})
		if ov.is_empty():
			props.append(prop)
			continue
		var nuevo: Dictionary = prop.duplicate(true)






		var fab: int = base_face(prop)
		var face: int = int(ov.get("face", fab))&3
		nuevo["face_fab"] = fab
		nuevo["face"] = face
		nuevo["rect"] = prop_rect(prop, face, ov.get("pos",(prop["rect"] as Rect2).position))
		nuevo["guardado"] = bool(ov.get("guardado", false))
		props.append(nuevo)
		sucio = true
	if not sucio:
		preload("res://features/career/cochera.gd").conectar(base)
		return base




	var pl: Dictionary = {"rooms": base["rooms"], "props": props,
		"tabiques": tabiques, "aberturas": aberturas, "ventanas": ventanas,
		"puerta": base.get("puerta", door_pos(0))}
	preload("res://features/career/cochera.gd").conectar(pl)





	for _vuelta in 2:
		for i in props.size():
			if props[i].get("fijo", false):
				continue
			if bool(props[i].get("guardado", false)):
				continue
			if capa.has(String(props[i].get("id", ""))) \
					and not plan_place_ok(pl, i).is_empty():
				props[i] = base["props"][i]
	return pl






















const HP_AIRE: float = 0.3


static func plan_place_ok(pl: Dictionary, i: int,
		quien: Variant = null) -> PackedStringArray:
	var props: Array = pl["props"]
	var prop: Dictionary = props[i]
	var r: Rect2 = prop["rect"]
	var kind: String = String(prop.get("kind", ""))
	var cuelga: bool = HANG_KINDS.has(kind)
	var mal: PackedStringArray = []





	var f_cuelga: int = int(prop.get("face", base_face(prop)))&3
	var espalda: Vector2 = - FACE_DIR[f_cuelga]
	if cuelga:
		if absf(espalda.y) > 0.5:
			if not _en_celda(r.position.x) or not _en_celda(r.size.x) \
					or not _en_celda(r.end.y if espalda.y > 0.0 else r.position.y):
				mal.append("fuera de la cuadrícula")
		elif not _en_celda(r.position.y) or not _en_celda(r.size.y) \
				or not _en_celda(r.end.x if espalda.x > 0.0 else r.position.x):
			mal.append("fuera de la cuadrícula")
	elif not _en_celda(r.position.x) or not _en_celda(r.size.x) \
			or not _en_celda(r.position.y) or not _en_celda(r.size.y):
		mal.append("fuera de la cuadrícula")













	if not cuelga and not plan_rect_on_floor(pl, r):
		mal.append("se sale del suelo")




	if BAJO_TODO.has(kind):
		var tapete_muro: bool = false
		for pared in pl.get("tabiques", []):
			if not is_pass(pared) and tabique_rect(pared[0], pared[1]).intersects(r):
				tapete_muro = true
				break


		for garaje in props:
			if garaje.get("kind") != "cochera" or garaje.get("guardado", false):
				continue
			for pared in load("res://features/career/cochera.gd").solidos(garaje):
				if (pared as Rect2).intersects(r):
					tapete_muro = true
					break
		if tapete_muro:
			mal.append("el tapete no puede atravesar una pared")
	elif kind == "cochera":


		var tapete_muro: bool = false
		for tejido in props:
			if tejido.get("guardado", false) or not BAJO_TODO.has(String(tejido.get("kind", ""))):
				continue
			for pared in load("res://features/career/cochera.gd").solidos(prop):
				if (pared as Rect2).intersects(tejido["rect"] as Rect2):
					tapete_muro = true
					break
		if tapete_muro:
			mal.append("el tapete no puede atravesar una pared")













	if not BAJO_TODO.has(kind):
		var mi: Vector2 = prop_span(prop)
		for j in props.size():
			if j == i or BAJO_TODO.has(String(props[j].get("kind", ""))):
				continue
			if bool(props[j].get("guardado", false)):
				continue
			if not (props[j]["rect"] as Rect2).intersects(r):
				continue
			if kind == "cochera" or props[j].get("kind") == "cochera":
				if not load("res://features/career/cochera.gd").choca(prop, props[j]):
					continue
			var otro: Vector2 = prop_span(props[j])
			if mi.x < otro.y - 0.001 and otro.x < mi.y - 0.001:


				mal.append(I18n.tf("choca con {0}",
					[I18n.t(kind_name(props[j]))]))
				break







	if r.grow(BODY_R).has_point(plan_door(pl) + Vector2(0.0, BODY_R + 0.1)):
		mal.append("tapa la puerta")











	if kind != "cochera" and not BAJO_TODO.has(kind) and quien is Vector2 \
			and r.grow(BODY_R).has_point(quien as Vector2):
		mal.append("te quedarías dentro")
	if kind == "cochera":
		for muro in pl.get("tabiques", []):
			if tabique_rect(muro[0], muro[1]).intersects(r.grow(- 0.01)):
				mal.append("La cochera necesita un espacio libre de paredes.")
				break
		if quien is Vector2:
			for pared in load("res://features/career/cochera.gd").solidos(prop):
				if (pared as Rect2).grow(BODY_R).has_point(quien):
					mal.append("te quedarías dentro")


	if STAND_KINDS.has(kind) and plan_front_gap(pl, r) < 1.0 - 0.001:
		mal.append("sin sitio para usarlo")









	if cuelga:
		var c_h: Vector2 = r.get_center()
		var medio: float =(r.size.x if absf(espalda.x) > 0.5 else r.size.y) * 0.5




		var puntas: Array = [0.0]
		if CUELGA_PUNTAS.has(kind):
			var mitad: float =(r.size.y if absf(espalda.x) > 0.5 else r.size.x) * 0.5 - 0.1
			puntas = [- mitad, 0.0, mitad]
		var a_lo_largo: Vector2 = Vector2(absf(espalda.y), absf(espalda.x))
		var sin_muro: bool = false
		var a_la_pared: bool = false
		for o in puntas:
			var c_o: Vector2 = c_h + a_lo_largo * float(o)
			var atras: Vector2 = c_o + espalda *(medio + 0.05)
			if plan_in_floor(pl, atras) and not _en_tabique(pl, atras):
				sin_muro = true
			var frente_s: Vector2 = c_o - espalda *(medio + 0.05)
			if not plan_in_floor(pl, frente_s) or _en_tabique(pl, frente_s):
				a_la_pared = true
		if sin_muro:
			mal.append("tiene que ir pegado a una pared")
		if a_la_pared:
			mal.append("no puede mirar a la pared")
		var cuarto: String = ""
		for room in pl["rooms"]:
			if (room["rect"] as Rect2).has_point(c_h):
				cuarto = String(room["id"])
				break
		if OUTDOOR_ROOMS.has(cuarto):
			mal.append("a la intemperie no se cuelga nada")







	if CIELO_KINDS.has(kind):
		for room in pl["rooms"]:
			if not (room["rect"] as Rect2).has_point(r.get_center()):
				continue
			if OUTDOOR_ROOMS.has(String(room["id"])):
				mal.append("a la intemperie no se cuelga nada")
			break





















	if kind == "helipuerto":
		var hp_base: String = String(Career.house_finish.get("floor",
			ACABADO_BASE["floor"]))
		var hp_capa: Dictionary = Career.floor_paint_of()
		for hp_p in [r.get_center(),
				r.position + Vector2(0.1, 0.1),
				Vector2(r.end.x - 0.1, r.position.y + 0.1),
				Vector2(r.position.x + 0.1, r.end.y - 0.1),
				r.end - Vector2(0.1, 0.1)]:
			var hp_room: String = String(plan_room_at(pl,
				Vector2(hp_p)).get("id", ""))
			if OUTDOOR_ROOMS.has(hp_room):
				continue
			if floor_finish_at(Vector2(hp_p), hp_capa, hp_base) == PISO_PASTO:
				continue
			mal.append("el helipuerto va en el jardín, sobre el pasto")
			break
		var hp_zona: Rect2 = r.grow(HP_AIRE)
		var hp_muro: bool = false
		for t in pl.get("tabiques", []):
			if tabique_rect(t[0], t[1]).intersects(hp_zona):
				hp_muro = true
				break



		if not hp_muro:




			var hp_lados: Array = [
				[Vector2(0.0, -1.0), Vector2(1.0, 0.0), r.position.y + 0.05,
					r.position.x, r.end.x],
				[Vector2(0.0, 1.0), Vector2(1.0, 0.0), r.end.y - 0.05,
					r.position.x, r.end.x],
				[Vector2(-1.0, 0.0), Vector2(0.0, 1.0), r.position.x + 0.05,
					r.position.y, r.end.y],
				[Vector2(1.0, 0.0), Vector2(0.0, 1.0), r.end.x - 0.05,
					r.position.y, r.end.y]]
			for hp_l in hp_lados:
				var hp_n: Vector2 = hp_l[0]
				var hp_t2: Vector2 = hp_l[1]
				var hp_fijo: float = hp_l[2]
				var hp_s: float = float(hp_l[3])
				while hp_s <= float(hp_l[4]) and not hp_muro:


					var hp_pie: Vector2 = Vector2(hp_fijo, hp_s) \
							if absf(hp_n.x) > 0.5 else Vector2(hp_s, hp_fijo)
					var hp_prev: Vector2 = hp_pie
					for hp_k in range(1, int(ceilf((HP_AIRE + 0.05) / 0.1)) + 1):
						var hp_q: Vector2 = hp_pie + hp_n *(0.1 * float(hp_k))
						if not plan_in_floor(pl, hp_q):
							var hp_borde: Vector2 =(hp_prev + hp_q) * 0.5
							if not in_opening(pl, hp_borde):
								hp_muro = true
							break
						hp_prev = hp_q
					hp_s += CELDA
				if hp_muro:
					break
		if hp_muro:
			mal.append("el helipuerto pide cielo abierto: ni una pared alrededor")
	return mal




static func _en_tabique(pl: Dictionary, p: Vector2) -> bool:
	for t in pl.get("tabiques", []):
		if is_pass(t):
			continue
		if tabique_rect(t[0], t[1]).grow(0.01).has_point(p):
			return true
	return false












static func plan_wall_ok(pl: Dictionary, a: Vector2, b: Vector2,
		extras: Variant = null, quien: Variant = null,
		reach_antes: int = -1) -> PackedStringArray:
	var mal: PackedStringArray = []
	if absf(a.x - b.x) > 0.001 and absf(a.y - b.y) > 0.001:
		mal.append("las paredes van rectas")
		return mal
	if a.distance_to(b) < CELDA - 0.001:
		mal.append("demasiado corta")
		return mal
	for v in [a.x, a.y, b.x, b.y]:
		if not _en_celda(v):
			mal.append("fuera de la cuadrícula")
			return mal
	var r: Rect2 = tabique_rect(a, b)










	if not plan_rect_on_floor(pl, r):
		var t: float = TABIQUE_T * 0.5
		var lados: Array = []
		if absf(a.x - b.x) < 0.001:
			lados = [Rect2(Vector2(a.x - t, r.position.y), Vector2(t, r.size.y)),
				Rect2(Vector2(a.x, r.position.y), Vector2(t, r.size.y))]
		else:
			lados = [Rect2(Vector2(r.position.x, a.y - t), Vector2(r.size.x, t)),
				Rect2(Vector2(r.position.x, a.y), Vector2(r.size.x, t))]
		if not (plan_rect_on_floor(pl, lados[0] as Rect2)
				or plan_rect_on_floor(pl, lados[1] as Rect2)):
			mal.append("ahí no hay suelo")

	for prop in pl["props"]:


		if bool(prop.get("guardado", false)):
			continue
		if (prop["rect"] as Rect2).intersects(r):

			mal.append(I18n.tf("encima de {0}", [I18n.t(kind_name(prop))]))
			break



	for cuarto in pl["rooms"]:
		if cuarto.get("paso_cochera", false):
			var paso: Rect2 = cuarto["rect"]
			var libre := Rect2(paso.position + Vector2(0, 0.25), paso.size - Vector2(0, 0.5))
			if r.intersects(libre):
				mal.append("tapa la puerta")
				break






	var pta: Vector2 = plan_door(pl)
	if r.grow(BODY_R).has_point(pta + Vector2(0.0, BODY_R + 0.1)) \
			or r.grow(BODY_R).has_point(pta):
		mal.append("tapa la puerta")

	if quien is Vector2 and r.grow(BODY_R).has_point(quien as Vector2):
		mal.append("te quedarías dentro")


















	return mal


static func _en_celda(v: float) -> bool:
	return absf(v / CELDA - roundf(v / CELDA)) < 0.001













enum {FACE_S = 0, FACE_W = 1, FACE_N = 2, FACE_E = 3}


const FACE_DIR: Array[Vector2] = [
	Vector2(0.0, -1.0),
	Vector2(-1.0, 0.0),
	Vector2(0.0, 1.0),
	Vector2(1.0, 0.0),
]






static func base_face(prop: Dictionary) -> int:
	if prop.has("face"):
		return int(prop["face"])&3

	if prop.get("kind") == "cochera":
		return FACE_S
	var r: Rect2 = prop["rect"]
	return FACE_S if r.size.x >= r.size.y else FACE_W




static func face_axis(face: int) -> int:
	return face&1







static func prop_rect(prop: Dictionary, face: int, pos: Vector2) -> Rect2:
	var s: Vector2 =(prop["rect"] as Rect2).size
	if face_axis(face) != face_axis(base_face(prop)):
		s = Vector2(s.y, s.x)
	return Rect2(pos, s)








static func rotate_pos(prop: Dictionary, face_ini: int, face_fin: int,
		pos: Vector2) -> Vector2:
	var c: Vector2 = prop_rect(prop, face_ini, pos).get_center()
	var s: Vector2 = prop_rect(prop, face_fin, Vector2.ZERO).size
	return snap_pos(c - s * 0.5, prop, face_fin)








static func snap_pos(pos: Vector2, prop: Dictionary, face: int = -1) -> Vector2:
	var q: Vector2 = Vector2(snappedf(pos.x, CELDA), snappedf(pos.y, CELDA))
	if not SOFT_KINDS.has(String(prop.get("kind", ""))):
		return q
	var f: int =(face if face >= 0 else base_face(prop))&3
	var d: Vector2 = prop_rect(prop, f, Vector2.ZERO).size
	var espalda: Vector2 = - FACE_DIR[f]
	if espalda.y > 0.5:
		return Vector2(q.x, snappedf(pos.y + d.y, CELDA) - d.y)
	if espalda.y < -0.5:
		return Vector2(q.x, snappedf(pos.y, CELDA))
	if espalda.x > 0.5:
		return Vector2(snappedf(pos.x + d.x, CELDA) - d.x, q.y)
	return Vector2(snappedf(pos.x, CELDA), q.y)


static func rooms_of(level: int) -> Array:
	return plan_of(level)["rooms"]


static func props_of(level: int) -> Array:
	return plan_of(level)["props"]




static func slots_of(level: int, slot: String) -> Array:
	return plan_slots(plan_of(level), slot)





static func plan_slots(pl: Dictionary, slot: String) -> Array:
	var out: Array = []
	for p in (pl["props"] as Array):



		if bool(p.get("guardado", false)):
			continue
		if String(p.get("slot", "")) == slot:
			out.append(p)
	return out





static func has_next(level: int) -> bool:
	return clamp_level(level) < LEVELS.size() - 1



static func next_data(level: int) -> Dictionary:
	if not has_next(level):
		return {}
	return LEVELS[clamp_level(level) + 1]




static func upgrade_price(level: int) -> int:
	var nxt: Dictionary = next_data(level)
	return int(nxt.get("price", -1)) if not nxt.is_empty() else -1




static func rest_raw(level: int) -> float:
	return float(level_data(level).get("rest_raw", 0.0))



static func upkeep(level: int) -> int:
	return int(level_data(level).get("upkeep", 0))








static func invested(level: int, extras: Array) -> int:
	var total: int = 0
	for i in range(1, clamp_level(level) + 1):
		total += int(LEVELS[i].get("price", 0))
	for e in EXTRAS:
		if extras.has(String(e["id"])):
			total += int(e["price"])








	for it in Career.house_items:
		if not bool(it.get("copia", false)):
			continue
		var e2: Dictionary = extra_by_id(String(it.get("extra", "")))
		if not e2.is_empty():
			total += int(e2.get("price", 0))
	return total





































































static func bounds(level: int) -> Rect2:
	return plan_bounds(plan_of(level))







































const PLT_CUARTO_MIN: float = 2.5


const PLT_BANO: float = 2.5


const PLT_PASILLO: float = 2.0


const PLT_FONDO_MAX: float = 5.0





























const PLT_CASA_ANCHO_MAX: float = 25.0
const PLT_CASA_FONDO_MAX: float = 20.0


















const PLT_JARDIN_FRENTE: float = 0.1
const PLT_JARDIN_FRENTE_MAX: float = 2.0
const PLT_JARDIN_FONDO: float = 0.3
const PLT_JARDIN_FONDO_MAX: float = 6.0
const PLT_JARDIN_LADO: float = 0.09
const PLT_JARDIN_LADO_MAX: float = 1.5





const PLT_JARDIN_DESDE: float = 12.0



const PLT_JARDIN_MIN: float = 1.0






const PLT_CASA_CUATRO: float = 9.0
const PLT_CASA_PASILLO: float = 12.0















const PLT_ESQUEMAS: Dictionary = {
	"dos": {"pared": "muro_cal", "pisos": {
		"salon": "piso_roble", "recamara": "piso_roble", "jardin": PISO_PASTO}},
	"dos_rec": {"pared": "muro_arena", "pisos": {
		"salon": "piso_roble", "recamara": "piso_claro", "jardin": PISO_PASTO}},
	"tres": {"pared": "muro_niebla", "pisos": {
		"salon": "piso_claro", "recamara": "piso_claro", "bano": "piso_pizarra",
		"jardin": PISO_PASTO}},
	"cuatro": {"pared": "muro_arena", "pisos": {
		"salon": "piso_nogal", "recamara": "piso_roble", "cocina": "piso_ajedrez",
		"bano": "piso_pizarra", "jardin": PISO_PASTO}},
	"pasillo": {"pared": "muro_ladrillo", "pisos": {
		"salon": "piso_nogal", "recamara": "piso_claro", "cocina": "piso_ajedrez",
		"bano": "piso_pizarra", "pasillo": "piso_hormigon", "jardin": PISO_PASTO}},
}




static var _plt_key: String = ""
static var _plt_mem: Array = []


static func plantillas(pl: Dictionary) -> Array:

	pl = pl.duplicate()
	pl["rooms"] =(pl["rooms"] as Array).filter(func(r): return not r.get("anexo_cochera", false))
	var b: Rect2 = plan_bounds(pl)
	var pta: Vector2 = plan_door(pl)
	var key: String = "%.2f|%.2f|%.2f|%.2f|%.2f|%.2f" % [b.position.x, b.position.y,
		b.size.x, b.size.y, pta.x, pta.y]
	if key == _plt_key and not _plt_mem.is_empty():
		return _plt_mem
	var out: Array = _plantillas_calc(b, pta, plan_cascaron(pl))
	_plt_key = key
	_plt_mem = out
	return out





static func _plantillas_calc(b: Rect2, pta: Vector2, cascaron: Array) -> Array:
	var out: Array = []
	var x0: float = snappedf(b.position.x, CELDA)
	var x1: float = snappedf(b.end.x, CELDA)
	var z0: float = snappedf(b.position.y, CELDA)
	var z1: float = snappedf(b.end.y, CELDA)
	var w: float = x1 - x0
	var h: float = z1 - z0




	var zin: float = z0 if absf(pta.y - z0) <= absf(pta.y - z1) else z1
	var dir: float = 1.0 if is_equal_approx(zin, z0) else -1.0
	var zfar: float = _zz(zin, dir, h)
	var px: float = snappedf(pta.x, CELDA)








	var sx0: float = x0
	var sx1: float = x1
	var szin: float = zin
	var szfar: float = zfar
	var m_frente: float = 0.0
	var m_fondo: float = 0.0
	var m_lado: float = 0.0
	var hay_jardin: bool = minf(w, h) >= PLT_JARDIN_DESDE
	if hay_jardin:
		m_frente = _plt_margen(h * PLT_JARDIN_FRENTE, PLT_JARDIN_FRENTE_MAX)
		m_fondo = _plt_margen(h * PLT_JARDIN_FONDO, PLT_JARDIN_FONDO_MAX)
		m_lado = _plt_margen(w * PLT_JARDIN_LADO, PLT_JARDIN_LADO_MAX)








		if w - m_lado * 2.0 > PLT_CASA_ANCHO_MAX:
			m_lado = _plt_margen((w - PLT_CASA_ANCHO_MAX) * 0.5, w)
		if h - m_frente - m_fondo > PLT_CASA_FONDO_MAX:
			m_fondo = _plt_margen(h - m_frente - PLT_CASA_FONDO_MAX, h)
		x0 += m_lado
		x1 -= m_lado
		zin = _zz(szin, dir, m_frente)
		zfar = _zz(szin, dir, h - m_fondo)
		w = x1 - x0
		h = absf(zfar - zin)


	if minf(w, h) < PLT_CUARTO_MIN * 2.0 + CELDA:
		return out










	var rec1: float = clampf(h * 0.5, PLT_CUARTO_MIN, PLT_FONDO_MAX)
	var zm: float = _zz(zin, dir, h - rec1)
	out.append({"id": "dos", "name": "DOS AMBIENTES",
		"hint": "Un muro con puerta: día de un lado, noche del otro.",
		"cuartos": 2,
		"tabiques": _muro_vanos(Vector2(x0, zm), Vector2(x1, zm),
			[px - PUERTA_ANCHO * 0.5]),
		"zonas": [_zona(x0, x1, zin, zm, "salon"),
			_zona(x0, x1, zm, zfar, "recamara")]})




	var fondo: float = clampf(h * 0.45, PLT_CUARTO_MIN, PLT_FONDO_MAX)
	var zr: float = _zz(zin, dir, h - fondo)
	var xm: float = _eje_libre((x0 + x1) * 0.5, px, x0, x1)
	var t2: Array = []
	var hay2: bool = minf(xm - x0, x1 - xm) >= PLT_CUARTO_MIN \
			and (h - fondo) >= PLT_CUARTO_MIN
	if hay2:
		t2 += _muro_vanos(Vector2(x0, zr), Vector2(xm, zr), [_centrado(x0, xm)])
		t2 += _muro_vanos(Vector2(xm, zr), Vector2(x1, zr), [_centrado(xm, x1)])
		t2.append([Vector2(xm, zr), Vector2(xm, zfar), "", ""])
		out.append({"id": "dos_rec", "name": "DOS RECÁMARAS",
			"hint": "Dos cuartos al fondo, con su puerta cada uno, y el salón al frente.",
			"cuartos": 3, "tabiques": t2,
			"zonas": [_zona(x0, x1, zin, zr, "salon"),
				_zona(x0, xm, zr, zfar, "recamara"),
				_zona(xm, x1, zr, zfar, "recamara")]})





	var este: bool =(x1 - px) >=(px - x0)
	var esq: float = x1 if este else x0
	var bx: float = esq - PLT_BANO if este else esq + PLT_BANO
	var bz: float = _zz(zin, dir, PLT_BANO)




	if hay2 and absf(bx - px) >= PUERTA_ANCHO + CELDA \
			and (h - fondo) >= PLT_BANO + PUERTA_ANCHO + CELDA \
			and w >= PLT_BANO + PLT_CUARTO_MIN * 2.0:
		var t3: Array = t2.duplicate(true)
		t3.append([Vector2(bx, zin), Vector2(bx, bz), "", ""])
		t3 += _muro_vanos(Vector2(minf(bx, esq), bz), Vector2(maxf(bx, esq), bz),
			[_centrado(bx, esq)])



		out.append({"id": "tres", "name": "TRES CUARTOS Y BAÑO",
			"hint": "Añade un baño en la esquina de la entrada.",
			"cuartos": 4, "tabiques": t3,
			"zonas": [_zona(minf(bx, esq), maxf(bx, esq), zin, bz, "bano"),
				_zona(x0 if este else bx, bx if este else x1, zin, zr, "salon"),
				_zona(bx if este else x0, x1 if este else bx, bz, zr, "salon"),
				_zona(x0, xm, zr, zfar, "recamara"),
				_zona(xm, x1, zr, zfar, "recamara")]})






	var xc: float = x0 +(px - x0) * 0.5
	if not este:
		xc = x1 -(x1 - px) * 0.5
	var xf: float = _eje_libre(xc, px, x0, x1)
	if hay2 and w >= PLT_CASA_CUATRO and minf(xf - x0, x1 - xf) >= PLT_CUARTO_MIN:
		var t4: Array = t2.duplicate(true)
		t4 += _muro_vanos(Vector2(xf, zin), Vector2(xf, zr), [_centrado(zin, zr)])
		out.append({"id": "cuatro", "name": "CUATRO CUARTOS",
			"hint": "Cocina aparte, salón al frente y dos cuartos al fondo.",
			"cuartos": 4, "tabiques": t4,
			"zonas": [_zona(x0 if este else xf, xf if este else x1, zin, zr,
					"cocina"),
				_zona(xf if este else x0, x1 if este else xf, zin, zr, "salon"),
				_zona(x0, xm, zr, zfar, "recamara"),
				_zona(xm, x1, zr, zfar, "recamara")]})





	var xa: float = snappedf(px - PLT_PASILLO * 0.5, CELDA)
	var xb: float = snappedf(px + PLT_PASILLO * 0.5, CELDA)
	var fondo5: float = clampf(h * 0.3, PLT_CUARTO_MIN, PLT_FONDO_MAX)
	var zc: float = _zz(zin, dir, h - fondo5)
	var zt: float = _zz(zin, dir,(h - fondo5) * 0.5)
	if w >= PLT_CASA_PASILLO and minf(xa - x0, x1 - xb) >= PLT_CUARTO_MIN \
			and (h - fondo5) * 0.5 >= PLT_CUARTO_MIN:
		var t5: Array = []
		t5 += _muro_vanos(Vector2(xa, zin), Vector2(xa, zc),
			[_centrado(zin, zt), _centrado(zt, zc)])
		t5 += _muro_vanos(Vector2(xb, zin), Vector2(xb, zc),
			[_centrado(zin, zt), _centrado(zt, zc)])
		t5.append([Vector2(x0, zt), Vector2(xa, zt), "", ""])
		t5.append([Vector2(xb, zt), Vector2(x1, zt), "", ""])



		out.append({"id": "pasillo", "name": "PASILLO Y CUATRO CUARTOS",
			"hint": "Un pasillo desde la puerta, dos cuartos por lado y el salón al fondo.",
			"cuartos": 5, "tabiques": t5,
			"zonas": [_zona(xa, xb, zin, zc, "pasillo"),
				_zona(x0, xa, zin, zt, "cocina"),
				_zona(xb, x1, zin, zt, "bano"),
				_zona(x0, xa, zt, zc, "recamara"),
				_zona(xb, x1, zt, zc, "recamara"),
				_zona(x0, x1, zc, zfar, "salon")]})





	for pt in out:
		var d: Dictionary = pt as Dictionary
		var eq: Dictionary = PLT_ESQUEMAS.get(String(d["id"]), PLT_ESQUEMAS["dos"])









		var cascara: Array = _plt_cascara(x0, x1, zin, zfar, px, true) \
				if hay_jardin else []
		d["tabiques"] = _plt_pinta(cascara +(d["tabiques"] as Array),
			String(eq["pared"]))





		if hay_jardin:
			d["aberturas"] = cascaron.duplicate(true)


		for z in _plt_jardines(sx0, sx1, szin, szfar, x0, x1, zin, zfar):
			(d["zonas"] as Array).append(z)




		d["pisos"] =(eq["pisos"] as Dictionary).duplicate()
		d["pared"] = String(eq["pared"])

	return out






static func _zona(xa: float, xb: float, za: float, zb: float,
		oficio: String) -> Dictionary:
	return {"z": oficio, "rect": Rect2(minf(xa, xb), minf(za, zb),
		absf(xb - xa), absf(zb - za))}






static func _plt_margen(m: float, tope: float) -> float:
	return floorf(minf(m, tope) / CELDA) * CELDA














static func _plt_cascara(x0: float, x1: float, zin: float, zfar: float,
		px: float, lados: bool) -> Array:
	var out: Array = []
	out += _muro_vanos(Vector2(x0, zin), Vector2(x1, zin),
		[px - PUERTA_ANCHO * 0.5])







	var vx: float = snappedf((x0 + x1) * 0.5 - CORREDIZA_ANCHO * 0.5, CELDA)
	out += _muro_vanos(Vector2(x0, zfar), Vector2(x1, zfar), [vx],
		CORREDIZA_ANCHO, "corrediza")
	var vz: float = snappedf((zin + zfar) * 0.5 - PUERTA_ANCHO * 0.5, CELDA)
	if lados:
		out += _muro_vanos(Vector2(x0, zin), Vector2(x0, zfar), [vz],
			PUERTA_ANCHO, "ventana")
		out += _muro_vanos(Vector2(x1, zin), Vector2(x1, zfar), [vz],
			PUERTA_ANCHO, "ventana")
	else:
		out.append([Vector2(x0, zin), Vector2(x0, zfar), "", ""])
		out.append([Vector2(x1, zin), Vector2(x1, zfar), "", ""])
	return out










static func _plt_jardines(sx0: float, sx1: float, szin: float, szfar: float,
		x0: float, x1: float, zin: float, zfar: float) -> Array:
	var out: Array = []
	var zlo: float = minf(szin, szfar)
	var zhi: float = maxf(szin, szfar)
	var clo: float = minf(zin, zfar)
	var chi: float = maxf(zin, zfar)
	for f in [[sx0, sx1, zlo, clo], [sx0, sx1, chi, zhi],
			[sx0, x0, clo, chi], [x1, sx1, clo, chi]]:
		var r: Rect2 = Rect2(minf(f[0], f[1]), minf(f[2], f[3]),
			absf(f[1] - f[0]), absf(f[3] - f[2])).grow(- CELDA)
		if minf(r.size.x, r.size.y) < PLT_JARDIN_MIN:
			continue
		out.append({"z": "jardin", "rect": r})
	return out






static func _plt_pinta(tabs: Array, acabado: String) -> Array:
	var out: Array = []
	for t in tabs:
		out.append(with_finish(t as Array, acabado))
	return out




static func _zz(zin: float, dir: float, m: float) -> float:
	return snappedf(zin + dir * m, CELDA)





static func _centrado(a: float, b: float) -> float:
	return snappedf((a + b) * 0.5 - PUERTA_ANCHO * 0.5, CELDA)






static func _eje_libre(x: float, px: float, x0: float, x1: float) -> float:
	var r: float = snappedf(x, CELDA)
	var sep: float = PUERTA_ANCHO + CELDA
	if absf(r - px) >= sep:
		return r
	var der: float = snappedf(px + sep, CELDA)
	var izq: float = snappedf(px - sep, CELDA)
	return der if (x1 - der) >=(izq - x0) else izq














static func _muro_vanos(a: Vector2, b: Vector2, vanos: Array,
		ancho: float = -1.0, tipo: String = "puerta") -> Array:
	if ancho <= 0.0:
		ancho = PUERTA_ANCHO
	var vert: bool = absf(b.x - a.x) < 0.01
	var fijo: float = a.x if vert else a.y
	var lo: float = minf(a.y, b.y) if vert else minf(a.x, b.x)
	var hi: float = maxf(a.y, b.y) if vert else maxf(a.x, b.x)

	if hi - lo < ancho - 0.01:
		return [[a, b, tipo, ""]]
	var orden: Array = vanos.duplicate()
	orden.sort()
	var out: Array = []
	var cur: float = lo
	for v in orden:
		if hi - ancho < cur - 0.01:
			break
		var c: float = clampf(float(v), cur, hi - ancho)
		if c - cur > 0.01:
			out.append([_pto(fijo, cur, vert), _pto(fijo, c, vert), "", ""])
		out.append([_pto(fijo, c, vert), _pto(fijo, c + ancho, vert), tipo, ""])
		cur = c + ancho
	if hi - cur > 0.01:
		out.append([_pto(fijo, cur, vert), _pto(fijo, hi, vert), "", ""])
	return out


static func _pto(fijo: float, v: float, vert: bool) -> Vector2:
	return Vector2(fijo, v) if vert else Vector2(v, fijo)





static func plantilla_paredes(tabiques: Array) -> int:
	var n: int = 0
	for t in tabiques:
		if not is_pass(t):
			n += 1
	return n


















const PACK_RECARGO: float = 0.25


const PACK_REDONDEO: int = 25000




const PACK_AJUAR: Dictionary = {
	"salon": ["mueble_sofa_2", "mueble_mesa_2", "mueble_silla", "mueble_silla",
		"deco_macetero", "deco_cuadro_1"],
	"recamara": ["mueble_cama_2", "deco_baul", "luz_buro", "deco_percha"],
	"bano": ["bano_ducha", "bano_lavabo", "bano_inodoro"],
	"cocina": ["mueble_cocina_2", "mueble_silla_alta", "mueble_silla_alta"],
	"pasillo": ["deco_cuadro_1"],









	"jardin": ["jardin_porteria", "jardin_arbol", "jardin_camastro",
		"jardin_sombrilla", "jardin_arbusto", "jardin_farol"],
}





const PACK_AJUAR_JARDIN_CHICO: Array = ["jardin_arbusto", "jardin_farol"]






const PACK_AJUAR_SALON_CHICO: Array = ["deco_cuadro_1", "deco_macetero"]












const PACK_LUJO: Dictionary = {
	"dos": ["mueble_vitrina_torre"],
	"dos_rec": ["mueble_vitrina_torre", "ocio_tocadiscos"],
	"tres": ["mueble_vitrina", "ocio_tocadiscos"],
	"cuatro": ["mueble_vitrina", "deco_chimenea", "ocio_tocadiscos"],
	"pasillo": ["mueble_vitrina_premios", "mueble_vitrina", "deco_chimenea",
		"ocio_vinoteca"],
}

















static func pack_acabados(plt: Dictionary) -> Dictionary:
	var pisos: Dictionary = plt.get("pisos", {})
	if pisos.is_empty():
		return {}








	var area: Dictionary = {}
	for z in plt.get("zonas", []):
		var zd: Dictionary = z
		if String(zd.get("z", "")) == "jardin":
			continue
		var id: String = String(pisos.get(String(zd.get("z", "")), ""))
		if id.is_empty():
			continue
		var r: Rect2 = zd["rect"]
		area[id] = float(area.get(id, 0.0)) + r.size.x * r.size.y
	if area.is_empty():
		return {}
	var base: String = ""
	var mejor: float = -1.0
	for id in area:
		if float(area[id]) > mejor:
			mejor = float(area[id])
			base = String(id)
	var pintura: Dictionary = {}
	for z in plt.get("zonas", []):
		var zd2: Dictionary = z
		var id2: String = String(pisos.get(String(zd2.get("z", "")), ""))
		if id2.is_empty() or id2 == base:
			continue
		pintura = floor_paint_rect(pintura, zd2["rect"] as Rect2, id2, base)
	return {"base": base, "pintura": pintura, "pared": String(plt.get("pared", ""))}





















static func plt_gratis(plt: Dictionary, finishes: Array) -> Array:
	var tabs: Array =(plt.get("tabiques", []) as Array).duplicate(true)
	var pared: String = String(plt.get("pared", ""))
	if pared.is_empty() or acabado_owned(pared, finishes):
		return tabs
	var out: Array = []
	for t in tabs:
		out.append(with_finish(t as Array, ""))
	return out





static func pack_acabados_ids(plt: Dictionary) -> Array:
	var out: Array = []
	var ids: Array =(plt.get("pisos", {}) as Dictionary).values().duplicate()
	ids.append(String(plt.get("pared", "")))
	for id in ids:
		var sid: String = String(id)
		if sid.is_empty() or sid == PISO_PASTO or out.has(sid):
			continue
		out.append(sid)
	return out


static func pack_acabados_precio(plt: Dictionary, finishes: Array) -> int:
	var total: int = 0
	for id in pack_acabados_ids(plt):

		if acabado_owned(String(id), finishes):
			continue
		total += int(acabado_by_id(String(id)).get("price", 0))
	return total








static func pack_lista(plt: Dictionary) -> Array:
	var zonas: Array = plt.get("zonas", [])
	var gate: int = catalog_gate()
	var hay_cocina: bool = false
	for z in zonas:
		if String((z as Dictionary).get("z", "")) == "cocina":
			hay_cocina = true
	var out: Array = []
	var lujo_puesto: bool = false



	var mayor: Dictionary = {}
	var mayor_area: Dictionary = {}
	for i in zonas.size():
		var zd: Dictionary = zonas[i] as Dictionary
		var of: String = String(zd.get("z", ""))
		var rz: Rect2 = zd["rect"]
		if rz.size.x * rz.size.y > float(mayor_area.get(of, 0.0)):
			mayor_area[of] = rz.size.x * rz.size.y
			mayor[of] = i
	for i in zonas.size():
		var oficio: String = String((zonas[i] as Dictionary).get("z", ""))
		var ids: Array =(PACK_AJUAR.get(oficio, []) as Array).duplicate()
		var es_mayor: bool = int(mayor.get(oficio, i)) == i
		if oficio == "jardin" and not es_mayor:
			ids = PACK_AJUAR_JARDIN_CHICO.duplicate()
		if oficio == "salon" and not es_mayor:
			ids = PACK_AJUAR_SALON_CHICO.duplicate()
		if oficio == "salon" and es_mayor and not hay_cocina:
			ids += PACK_AJUAR["cocina"] as Array
			hay_cocina = true

		if oficio == "salon" and es_mayor and not lujo_puesto:
			ids += PACK_LUJO.get(String(plt.get("id", "")), []) as Array
			lujo_puesto = true
		for id in ids:
			var e: Dictionary = extra_by_id(String(id))
			if e.is_empty() or int(e.get("level", 0)) > gate:
				continue
			out.append({"zona": i, "extra": String(id)})
	return out






static func pack_prop(extra_id: String, iid: String) -> Dictionary:
	var e: Dictionary = extra_by_id(extra_id)
	var kind: String = String(e.get("kind", ""))
	if kind.is_empty():
		return {}
	var med: Variant = e.get("size", null)
	var size: Vector2 =(med as Vector2) if med is Vector2 else blueprint_of(kind)
	if size == Vector2.ZERO:
		return {}
	var tpl: Dictionary = blueprint_prop(kind)
	var p: Dictionary = {"id": iid, "kind": kind,
		"rect": Rect2(Vector2.ZERO, size), "slot": String(tpl.get("slot", ""))}
	if e.has("col") and e["col"] is Color:
		p["col"] = e["col"]
	if int(tpl.get("tiers", 0)) > 0:
		p["tiers"] = int(tpl["tiers"])
	if float(tpl.get("y", 0.0)) > 0.0:
		p["y"] = float(tpl["y"])
	if bool(tpl.get("pass", false)):
		p["pass"] = true
	if int(tpl.get("cap", 0)) > 0:
		p["cap"] = int(tpl["cap"])
	return p

















static func pack_quote(pl: Dictionary, plt: Dictionary) -> Dictionary:
	var est: Dictionary = _pack_arranque(pl, plt)
	if est.is_empty():
		return {}
	for fila in pack_lista(plt):
		_pack_pieza(est, fila as Dictionary)
	for it in item_props():
		_pack_propina_uno(est, it as Dictionary)
	return _pack_cierra(plt, est)


















static func pack_quote_async(pl: Dictionary, plt: Dictionary) -> Dictionary:
	var est: Dictionary = await _pack_arranque_async(pl, plt)
	if est.is_empty():
		return {}
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	for fila in pack_lista(plt):
		_pack_pieza(est, fila as Dictionary)
		await arbol.process_frame
	for it in item_props():
		_pack_propina_uno(est, it as Dictionary)
		await arbol.process_frame
	return _pack_cierra(plt, est)





static func _pack_arranque(pl: Dictionary, plt: Dictionary) -> Dictionary:
	var prueba: Dictionary = _pack_prueba(pl, plt)
	if prueba.is_empty():
		return {}
	return _pack_estado(plt, prueba, plan_stand_mask(prueba, BODY_R, null))








static func _pack_arranque_async(pl: Dictionary, plt: Dictionary) -> Dictionary:
	var prueba: Dictionary = _pack_prueba(pl, plt)
	if prueba.is_empty():
		return {}
	var m: Dictionary = await plan_stand_mask_async(prueba, BODY_R, null)
	return _pack_estado(plt, prueba, m)







static func _pack_prueba(pl: Dictionary, plt: Dictionary) -> Dictionary:
	if (plt.get("zonas", []) as Array).is_empty():
		return {}
	return {"rooms": pl["rooms"], "props": [],
		"tabiques":(plt["tabiques"] as Array).duplicate(true),
		"aberturas": [], "ventanas": [],
		"puerta": pl.get("puerta", door_pos(0))}








static func _pack_estado(plt: Dictionary, prueba: Dictionary,
		mask: Dictionary) -> Dictionary:
	return {
		"mask": mask,
		"zonas": plt.get("zonas", []),
		"desde": plan_spawn(prueba),
		"prueba": prueba,
		"pone": [], "acomoda": {}, "valor": 0, "n": 0,





		"no_cabe": {},
	}




static func _pack_pieza(est: Dictionary, fila: Dictionary) -> void:
	var prueba: Dictionary = est["prueba"]
	var zonas: Array = est["zonas"]
	var extra_id: String = String(fila["extra"])
	var prop: Dictionary = pack_prop(extra_id, "pack#%d" % int(est["n"]))
	if prop.is_empty():
		return
	var zr: Rect2 =((zonas[int(fila["zona"])] as Dictionary)["rect"] as Rect2)
	var junto: Dictionary = _pack_junto(prueba, zr, prop)
	if bool(junto.get("skip", false)):
		return
	var sitio: Dictionary = _pack_coloca(prueba, zr, prop, est,
		junto.get("antes", []), int(junto.get("i", -1)))
	if sitio.is_empty():
		return
	var e: Dictionary = extra_by_id(extra_id)
	(est["pone"] as Array).append({"extra": extra_id, "kind": String(prop["kind"]),
		"size":(prop["rect"] as Rect2).size, "pos": sitio["pos"],
		"face": int(sitio["face"]), "precio": int(e.get("price", 0))})
	est["valor"] = int(est["valor"]) + int(e.get("price", 0))
	est["n"] = int(est["n"]) + 1






static func _pack_propina_uno(est: Dictionary, it: Dictionary) -> void:
	var kind: String = String(it.get("kind", ""))
	if CIELO_KINDS.has(kind):
		return
	var prueba: Dictionary = est["prueba"]
	var zonas: Array = est["zonas"]
	var quiere: Array = _pack_oficios(kind)
	for i in zonas.size():
		var z: Dictionary = zonas[i] as Dictionary
		if not quiere.has(String(z.get("z", ""))):
			continue
		var zr_p: Rect2 = z["rect"]
		var junto_p: Dictionary = _pack_junto(prueba, zr_p, it)
		if bool(junto_p.get("skip", false)):
			continue
		var s: Dictionary = _pack_coloca(prueba, zr_p, it, est,
			junto_p.get("antes", []), int(junto_p.get("i", -1)))
		if not s.is_empty():
			(est["acomoda"] as Dictionary)[String(it["id"])] = s
			return




static func _pack_cierra(plt: Dictionary, est: Dictionary) -> Dictionary:
	var pone: Array = est["pone"]
	if pone.is_empty():
		return {}





	var valor: int = int(est["valor"])
	var mat: int = pack_acabados_precio(plt, Career.house_finishes)
	valor += mat
	var precio: int = int(ceilf(float(valor) *(1.0 + PACK_RECARGO)
		/ float(PACK_REDONDEO))) * PACK_REDONDEO






	return {"plt": String(plt.get("id", "")),
		"pone": pone, "acomoda": est["acomoda"], "valor": valor,
		"precio": precio, "material": mat, "acabados": pack_acabados(plt)}





static func _pack_oficios(kind: String) -> Array:
	if kind in ["cama", "cama_penthouse"]:
		return ["recamara"]
	if ["inodoro", "lavabo", "ducha", "tina"].has(kind):
		return ["bano"]
	if ["cocina", "silla_alta"].has(kind):
		return ["cocina", "salon"]




	if ["porteria", "arbol", "arbusto", "camastro", "sombrilla", "farol",
			"fogata", "huerto", "columpio"].has(kind):
		return ["jardin"]
	return ["salon"]








static func _pack_coloca(prueba: Dictionary, zona: Rect2,
		prop: Dictionary, est: Dictionary = {}, antes: Array = [],
		obj_i: int = -1) -> Dictionary:
	var cuelga: bool = HANG_KINDS.has(String(prop.get("kind", "")))






	var llave: String = ""
	if antes.is_empty() and est.has("no_cabe"):
		llave = "%s|%s|%s" % [str(zona), String(prop.get("kind", "")),
			str((prop["rect"] as Rect2).size)]
		if (est["no_cabe"] as Dictionary).has(llave):
			return {}




	var puesto: Dictionary = prop.duplicate(true)
	puesto["face_fab"] = base_face(prop)


	for s in antes + _pack_sitios(zona, prop, cuelga):
		var cara: int = int(s["face"])
		puesto["face"] = cara
		puesto["rect"] = prop_rect(prop, cara, s["pos"] as Vector2)



		puesto["guardado"] = false
		(prueba["props"] as Array).append(puesto)
		var i: int =(prueba["props"] as Array).size() - 1
		var mal: bool = not plan_place_ok(prueba, i).is_empty()


		var nueva: Dictionary = {}
		if not mal and not cuelga and not bool(puesto.get("pass", false)):
			mal = _pack_tapa_vano(prueba, puesto["rect"] as Rect2)
			if not mal and est.has("mask"):




				nueva = pack_mask_menos(est["mask"] as Dictionary,
					puesto["rect"] as Rect2)






				if pack_mask_corta(est["mask"] as Dictionary,
						puesto["rect"] as Rect2):
					mal = not pack_zonas_ok(nueva, est["zonas"] as Array,
						est["desde"] as Vector2)










		if not mal:
			for j in (prueba["props"] as Array).size() - 1:
				var otro: Dictionary =(prueba["props"] as Array)[j]
				if bool(otro.get("guardado", false)):
					continue
				if not STAND_KINDS.has(String(otro.get("kind", ""))):
					continue








				if not (otro["rect"] as Rect2).grow(1.15).intersects(
						puesto["rect"] as Rect2):
					continue
				if not plan_place_ok(prueba, j).is_empty():
					mal = true
					break
		if not mal and obj_i >= 0:
			mal = not plan_place_ok(prueba, obj_i).is_empty()
		if mal:
			(prueba["props"] as Array).pop_back()
			continue


		if not nueva.is_empty():
			est["mask"] = nueva
		return {"pos": s["pos"], "face": cara}


	if not llave.is_empty():
		(est["no_cabe"] as Dictionary)[llave] = true
	return {}
















static func pack_mask_menos(m: Dictionary, r: Rect2) -> Dictionary:
	var w: int = int(m["w"])
	var h: int = int(m["h"])
	var o: Vector2 = m["o"]
	var bits: PackedByteArray =(m["bits"] as PackedByteArray).duplicate()
	var q: Rect2 = r.grow(BODY_R)



	var qx0: int = maxi(0, int(ceil((q.position.x - o.x) / REACH_GRID - 0.001)))
	var qx1: int = mini(w - 1, int(floor((q.end.x - o.x) / REACH_GRID + 0.001)))
	var qy0: int = maxi(0, int(ceil((q.position.y - o.y) / REACH_GRID - 0.001)))
	var qy1: int = mini(h - 1, int(floor((q.end.y - o.y) / REACH_GRID + 0.001)))
	for iy in range(qy0, qy1 + 1):
		var fila: int = iy * w
		for ix in range(qx0, qx1 + 1):
			bits[fila + ix] = 0
	return {"w": w, "h": h, "o": o, "bits": bits}















static func pack_mask_corta(m: Dictionary, r: Rect2) -> bool:
	var w: int = int(m["w"])
	var h: int = int(m["h"])
	var o: Vector2 = m["o"]
	var bits: PackedByteArray = m["bits"]
	var q: Rect2 = r.grow(BODY_R)
	var qx0: int = maxi(0, int(ceil((q.position.x - o.x) / REACH_GRID - 0.001)))
	var qx1: int = mini(w - 1, int(floor((q.end.x - o.x) / REACH_GRID + 0.001)))
	var qy0: int = maxi(0, int(ceil((q.position.y - o.y) / REACH_GRID - 0.001)))
	var qy1: int = mini(h - 1, int(floor((q.end.y - o.y) / REACH_GRID + 0.001)))


	var anillo: Array[bool] = []
	for ix in range(qx0 - 1, qx1 + 2):
		anillo.append(_mask_libre(bits, w, h, ix, qy0 - 1))
	for iy in range(qy0, qy1 + 1):
		anillo.append(_mask_libre(bits, w, h, qx1 + 1, iy))
	for ix in range(qx1 + 1, qx0 - 2, -1):
		anillo.append(_mask_libre(bits, w, h, ix, qy1 + 1))
	for iy in range(qy1, qy0 - 1, -1):
		anillo.append(_mask_libre(bits, w, h, qx0 - 1, iy))



	var arcos: int = 0
	for i in anillo.size():
		if anillo[i] and not anillo[(i - 1 + anillo.size()) % anillo.size()]:
			arcos += 1
	return arcos >= 2


static func _mask_libre(bits: PackedByteArray, w: int, h: int,
		ix: int, iy: int) -> bool:
	if ix < 0 or iy < 0 or ix >= w or iy >= h:
		return false
	return bits[iy * w + ix] != 0








static func pack_zonas_ok(m: Dictionary, zonas: Array, desde: Vector2) -> bool:






	var w: int = int(m["w"])
	var h: int = int(m["h"])
	var o: Vector2 = m["o"]
	var bits: PackedByteArray = m["bits"]
	var ix0: int = roundi((desde.x - o.x) / REACH_GRID)
	var iy0: int = roundi((desde.y - o.y) / REACH_GRID)
	if ix0 < 0 or iy0 < 0 or ix0 >= w or iy0 >= h or bits[iy0 * w + ix0] == 0:
		return false


	var rangos: Array = []
	for z in zonas:
		var r: Rect2 =((z as Dictionary)["rect"] as Rect2).grow(- BODY_R)
		rangos.append([int(ceil((r.position.x - o.x) / REACH_GRID - 1e-06)),
			int(floor((r.end.x - o.x) / REACH_GRID - 1e-06)),
			int(ceil((r.position.y - o.y) / REACH_GRID - 1e-06)),
			int(floor((r.end.y - o.y) / REACH_GRID - 1e-06))])




	var visto: PackedByteArray = PackedByteArray()
	visto.resize(w * h)
	var pila: PackedInt32Array = PackedInt32Array([iy0 * w + ix0])
	visto[iy0 * w + ix0] = 1
	while not pila.is_empty():
		var at: int = pila[pila.size() - 1]
		pila.remove_at(pila.size() - 1)
		var ax: int = at % w
		var ay: int = at / w
		if ax + 1 < w and visto[at + 1] == 0 and bits[at + 1] != 0:
			visto[at + 1] = 1
			pila.append(at + 1)
		if ax > 0 and visto[at - 1] == 0 and bits[at - 1] != 0:
			visto[at - 1] = 1
			pila.append(at - 1)
		if ay + 1 < h and visto[at + w] == 0 and bits[at + w] != 0:
			visto[at + w] = 1
			pila.append(at + w)
		if ay > 0 and visto[at - w] == 0 and bits[at - w] != 0:
			visto[at - w] = 1
			pila.append(at - w)
	for rg_v in rangos:
		var rg: Array = rg_v as Array
		var toca: bool = false
		for iy in range(maxi(0, int(rg[2])), mini(h - 1, int(rg[3])) + 1):
			var fila: int = iy * w
			for ix in range(maxi(0, int(rg[0])), mini(w - 1, int(rg[1])) + 1):
				if visto[fila + ix] == 1:
					toca = true
					break
			if toca:
				break
		if not toca:
			return false
	return true






static func _pack_tapa_vano(prueba: Dictionary, r: Rect2) -> bool:
	for t in prueba["tabiques"]:
		if not is_pass(t as Array):
			continue
		var seg: Array = t as Array
		if door_corridor(seg[0] as Vector2, seg[1] as Vector2).intersects(r):
			return true
	return false












const PACK_SIENTA: Dictionary = {"silla": "mesa", "silla_alta": "cocina"}













static func _pack_junto(prueba: Dictionary, zona: Rect2,
		prop: Dictionary) -> Dictionary:
	var obj_kind: String = String(PACK_SIENTA.get(String(prop.get("kind", "")), ""))
	if obj_kind.is_empty():
		return {}





	var props: Array = prueba["props"]
	var mejor: int = -1
	var mejor_d: float = INF
	for vuelta in 2:
		for i in props.size():
			var pr: Dictionary = props[i]
			if bool(pr.get("guardado", false)):
				continue
			if String(pr.get("kind", "")) != obj_kind:
				continue
			var rc: Rect2 = pr["rect"]
			if vuelta == 0 and not zona.has_point(rc.get_center()):
				continue
			var d: float = rc.get_center().distance_squared_to(zona.get_center())
			if d < mejor_d:
				mejor_d = d
				mejor = i
		if mejor >= 0:
			break
	if mejor >= 0:
		return {"antes": _pack_sitios_junto((props[mejor] as Dictionary)["rect"] as Rect2,
			prop), "i": mejor}


	return {"skip": true}


static func _pack_sitios_junto(obj: Rect2, prop: Dictionary) -> Array:
	var lados: Array = []
	for c in [
			[Vector2(obj.position.x, obj.end.y), Vector2(CELDA, 0.0), FACE_S,
				obj.size.x],
			[Vector2(obj.position.x, 0.0), Vector2(CELDA, 0.0), FACE_N, obj.size.x],
			[Vector2(obj.end.x, obj.position.y), Vector2(0.0, CELDA), FACE_W,
				obj.size.y],
			[Vector2(0.0, obj.position.y), Vector2(0.0, CELDA), FACE_E, obj.size.y]]:
		var cara: int = int(c[2])
		var sz: Vector2 = prop_rect(prop, cara, Vector2.ZERO).size
		var arr: Vector2 = c[0]

		if cara == FACE_N:
			arr.y = obj.position.y - sz.y
		elif cara == FACE_E:
			arr.x = obj.position.x - sz.x
		var pasos: int = maxi(0, int(((c[3] as float) -(sz.x if cara == FACE_S
			or cara == FACE_N else sz.y)) / CELDA))
		var fila: Array = []
		for k in pasos + 1:
			fila.append({"pos": arr +(c[1] as Vector2) * k, "face": cara})
		lados.append(fila)

	var out: Array = []
	var vuelta: int = 0
	var quedan: bool = true
	while quedan:
		quedan = false
		for fila in lados:
			if vuelta <(fila as Array).size():
				out.append((fila as Array)[vuelta])
				quedan = true
		vuelta += 1
	return out


static func _pack_sitios(zona: Rect2, prop: Dictionary, cuelga: bool) -> Array:
	var out: Array = []


	var s_n: Vector2 = prop_rect(prop, FACE_S, Vector2.ZERO).size
	var s_e: Vector2 = prop_rect(prop, FACE_E, Vector2.ZERO).size
	var cantos: Array = [
		[FACE_S, Vector2(zona.position.x, zona.end.y - s_n.y),
			Vector2(CELDA, 0.0), maxi(0, int((zona.size.x - s_n.x) / CELDA))],
		[FACE_N, Vector2(zona.position.x, zona.position.y),
			Vector2(CELDA, 0.0), maxi(0, int((zona.size.x - s_n.x) / CELDA))],
		[FACE_E, Vector2(zona.position.x, zona.position.y),
			Vector2(0.0, CELDA), maxi(0, int((zona.size.y - s_e.y) / CELDA))],
		[FACE_W, Vector2(zona.end.x - s_e.x, zona.position.y),
			Vector2(0.0, CELDA), maxi(0, int((zona.size.y - s_e.y) / CELDA))],
	]
	for c in cantos:
		var arr: Array = c as Array
		for k in int(arr[3]) + 1:
			out.append({"pos":(arr[1] as Vector2) +(arr[2] as Vector2) * k,
				"face": int(arr[0])})
	if cuelga:
		return out


	var s0: Vector2 =(prop["rect"] as Rect2).size
	var pasos_x: int = maxi(0, int((zona.size.x - s0.x) / CELDA))
	var pasos_z: int = maxi(0, int((zona.size.y - s0.y) / CELDA))
	for j in range(pasos_z, -1, -1):
		for k in pasos_x + 1:
			out.append({"pos": zona.position + Vector2(CELDA * k, CELDA * j),
				"face": base_face(prop)})
	return out


static func plan_bounds(pl: Dictionary) -> Rect2:
	var r: Rect2 = Rect2()
	var first: bool = true
	for room in pl["rooms"]:
		var rr: Rect2 = room["rect"]
		r = rr if first else r.merge(rr)
		first = false
	return r




static func in_floor(level: int, p: Vector2) -> bool:
	return plan_in_floor(plan_of(level), p)


static func plan_in_floor(pl: Dictionary, p: Vector2) -> bool:
	for room in pl["rooms"]:
		if (room["rect"] as Rect2).has_point(p):
			return true
	return false









static func fits_floor(level: int, p: Vector2, r: float = BODY_R) -> bool:
	return plan_fits_floor(plan_of(level), p, r)


static func plan_fits_floor(pl: Dictionary, p: Vector2, r: float = BODY_R) -> bool:
	return plan_in_floor(pl, p) \
			and plan_in_floor(pl, p + Vector2(r, 0.0)) \
			and plan_in_floor(pl, p + Vector2(- r, 0.0)) \
			and plan_in_floor(pl, p + Vector2(0.0, r)) \
			and plan_in_floor(pl, p + Vector2(0.0, - r))












static func hits_prop(level: int, p: Vector2, r: float = BODY_R,
		extras: Variant = null) -> bool:
	return plan_hits_prop(plan_of(level), p, r, extras)


static func plan_hits_prop(pl: Dictionary, p: Vector2, r: float = BODY_R,
		extras: Variant = null) -> bool:











	var filtra: bool = extras is Array
	for prop in pl["props"]:


		if prop.get("kind") == "cochera" and not prop.get("guardado", false):
			for pared in load("res://features/career/cochera.gd").solidos(prop):
				if (pared as Rect2).grow(r).has_point(p):
					return true
		if bool(prop.get("pass", false)):
			continue



		if bool(prop.get("guardado", false)):
			continue



		if filtra:
			var req: String = String(prop.get("req", ""))
			if not req.is_empty() and not (extras as Array).has(req):
				continue
		if (prop["rect"] as Rect2).grow(r).has_point(p):
			return true









	var en_vano: bool = false
	for t in pl.get("tabiques", []):
		if is_pass(t) and door_corridor(t[0], t[1]).has_point(p):
			en_vano = true
			break
	for t in pl.get("tabiques", []):
		if is_pass(t):
			continue
		if tabique_rect(t[0], t[1]).grow(r).has_point(p):
			if en_vano:
				continue
			return true
	return false


























const TABIQUE_T: float = 0.16


static func tabique_rect(a: Vector2, b: Vector2) -> Rect2:
	var t: float = TABIQUE_T
	var mn: Vector2 = Vector2(minf(a.x, b.x), minf(a.y, b.y))
	var mx: Vector2 = Vector2(maxf(a.x, b.x), maxf(a.y, b.y))
	if absf(mx.x - mn.x) < 0.001:
		return Rect2(Vector2(mn.x - t * 0.5, mn.y), Vector2(t, mx.y - mn.y))
	return Rect2(Vector2(mn.x, mn.y - t * 0.5), Vector2(mx.x - mn.x, t))













static func door_spot_ok(tabiques: Array, a: Vector2, b: Vector2) -> bool:
	var horiz: bool = absf(b.y - a.y) < 0.01
	for o in tabiques:
		var t: Array = o
		if t.size() < 2:
			continue
		var oa: Vector2 = t[0]
		var ob: Vector2 = t[1]
		if (absf(ob.y - oa.y) < 0.01) == horiz:
			continue
		for punta in [oa, ob]:
			var p: Vector2 = punta
			if horiz:
				if absf(p.y - a.y) < 0.01 and p.x > minf(a.x, b.x) - 0.01 \
						and p.x < maxf(a.x, b.x) + 0.01:
					return false
			elif absf(p.x - a.x) < 0.01 and p.y > minf(a.y, b.y) - 0.01 \
					and p.y < maxf(a.y, b.y) + 0.01:
				return false
	return true







static func is_door(t: Array) -> bool:
	return DOOR_KINDS.has(wall_kind(t))















const DOOR_KINDS: Array[String] = ["puerta", "doble", "arco"]





const WIN_KINDS: Array[String] = ["ventana", "ventanal", "ojo_buey"]




static func wall_kind(t: Array) -> String:
	return String(t[2]) if t.size() >= 3 else ""








static func next_kind(ciclo: Array, actual: String) -> String:
	var i: int = ciclo.find(actual)
	if i < 0:
		return String(ciclo[0])
	return "" if i + 1 >= ciclo.size() else String(ciclo[i + 1])














static func is_window(t: Array) -> bool:
	return WIN_KINDS.has(wall_kind(t))











static func is_slide(t: Array) -> bool:
	return t.size() >= 3 and String(t[2]) == "corrediza"







static func is_pass(t: Array) -> bool:
	return is_door(t) or is_slide(t)














static func wall_finish(t: Array) -> String:
	return String(t[3]) if t.size() >= 4 else ""





static func with_finish(t: Array, id: String) -> Array:
	var kind: String = String(t[2]) if t.size() >= 3 else ""
	return [t[0], t[1], kind, id]






static func wall_color(t: Array, base: Color) -> Color:
	var id: String = wall_finish(t)
	if id.is_empty():
		return base
	var a: Dictionary = acabado_by_id(id)
	return a.get("color", base) if not a.is_empty() else base








static func door_corridor(a: Vector2, b: Vector2) -> Rect2:
	var r: Rect2 = tabique_rect(a, b)
	var g: float = BODY_R + 0.06
	if r.size.x > r.size.y:
		return r.grow_individual(0.0, g, 0.0, g)
	return r.grow_individual(g, 0.0, g, 0.0)




















static func openings_of(pl: Dictionary) -> Array:
	return pl.get("aberturas", []) as Array







static func windows_of(pl: Dictionary) -> Array:
	return pl.get("ventanas", []) as Array




static func in_window(pl: Dictionary, p: Vector2) -> bool:
	for o in windows_of(pl):
		var a2: Array = o
		if a2.size() < 2:
			continue
		if tabique_rect(a2[0], a2[1]).grow(0.01).has_point(p):
			return true
	return false





static func in_opening(pl: Dictionary, p: Vector2) -> bool:
	for o in openings_of(pl):
		var a: Array = o
		if a.size() < 2:
			continue
		if tabique_rect(a[0], a[1]).grow(0.01).has_point(p):
			return true
	return false













static func is_perimeter_wall(pl: Dictionary, a: Vector2, b: Vector2,
		level: int = 0) -> bool:
	var mid: Vector2 =(a + b) * 0.5


	for cuarto in pl["rooms"]:
		if cuarto.get("pavimento_cochera", false) and (cuarto["rect"] as Rect2).grow(0.01).has_point(mid):
			return false
	var vert: bool = absf(b.x - a.x) < 0.01
	var n: Vector2 = Vector2(1, 0) if vert else Vector2(0, 1)
	var d: float = CELDA * 0.75
	var dentro: bool = plan_in_floor(pl, mid - n * d)
	var fuera: bool = plan_in_floor(pl, mid + n * d)
	if dentro == fuera:
		return false
	if plan_in_doorway(pl, mid):
		return false
	return true















static func plan_cascaron(pl: Dictionary, level: int = 0) -> Array:
	var out: Array = []
	for room in pl["rooms"]:
		var r: Rect2 = room["rect"]

		var cantos: Array = [
			[r.position, Vector2(CELDA, 0.0), r.size.x],
			[Vector2(r.position.x, r.end.y), Vector2(CELDA, 0.0), r.size.x],
			[r.position, Vector2(0.0, CELDA), r.size.y],
			[Vector2(r.end.x, r.position.y), Vector2(0.0, CELDA), r.size.y],
		]
		for c in cantos:
			var ini: Vector2 = c[0]
			var paso: Vector2 = c[1]
			var n: int = int(round(float(c[2]) / CELDA))
			var desde: Variant = null
			for i in n:
				var a: Vector2 = ini + paso * float(i)
				var b: Vector2 = a + paso
				if is_perimeter_wall(pl, a, b, level):
					if desde == null:
						desde = a
					continue
				if desde != null:
					out.append([desde as Vector2, a, "", ""])
					desde = null
			if desde != null:
				out.append([desde as Vector2, ini + paso * float(n), "", ""])
	return out









static func seg_index(lista: Array, a: Vector2, b: Vector2) -> int:
	for i in lista.size():
		var t: Array = lista[i]
		if t.size() < 2:
			continue
		var t0: Vector2 = t[0]
		var t1: Vector2 = t[1]
		var vert_t: bool = absf(t1.x - t0.x) < 0.01
		var vert_a: bool = absf(b.x - a.x) < 0.01
		if vert_t != vert_a:
			continue
		if vert_t:
			if absf(t0.x - a.x) > 0.01:
				continue
			if minf(a.y, b.y) >= minf(t0.y, t1.y) - 0.01 \
					and maxf(a.y, b.y) <= maxf(t0.y, t1.y) + 0.01:
				return i
		else:
			if absf(t0.y - a.y) > 0.01:
				continue
			if minf(a.x, b.x) >= minf(t0.x, t1.x) - 0.01 \
					and maxf(a.x, b.x) <= maxf(t0.x, t1.x) + 0.01:
				return i
	return -1



static func can_stand(level: int, p: Vector2, r: float = BODY_R,
		extras: Variant = null) -> bool:
	return plan_can_stand(plan_of(level), p, r, extras)


static func plan_can_stand(pl: Dictionary, p: Vector2, r: float = BODY_R,
		extras: Variant = null) -> bool:
	return plan_fits_floor(pl, p, r) and not plan_hits_prop(pl, p, r, extras)







static func spawn(level: int, r: float = BODY_R) -> Vector2:
	return plan_spawn(plan_of(level), r)


static func plan_spawn(pl: Dictionary, r: float = BODY_R) -> Vector2:



	var door: Vector2 = plan_door(pl) + Vector2(0.0, r + 0.1)
	if plan_can_stand(pl, door, r):
		return door
	var step: float = 0.25
	for ring in range(1, 40):
		for k in 8:
			var a: float = TAU * float(k) / 8.0
			var q: Vector2 = door + Vector2(cos(a), sin(a)) *(step * float(ring))
			if plan_can_stand(pl, q, r):
				return q
	return door

















static func move(level: int, from: Vector2, delta: Vector2,
		r: float = BODY_R, extras: Variant = null) -> Vector2:



	return plan_move(plan_of(level), from, delta, r, extras)


static func plan_move(pl: Dictionary, from: Vector2, delta: Vector2,
		r: float = BODY_R, extras: Variant = null) -> Vector2:
	var p: Vector2 = from
	p = _slide_axis(pl, p, Vector2(delta.x, 0.0), r, extras)
	p = _slide_axis(pl, p, Vector2(0.0, delta.y), r, extras)
	return p


static func _slide_axis(pl: Dictionary, from: Vector2, step: Vector2,
		r: float, extras: Variant = null) -> Vector2:
	var dist: float = step.length()
	if dist < 1e-05:
		return from
	var max_step: float = maxf(r * 0.5, 0.01)
	var n: int = int(ceil(dist / max_step))
	var unit: Vector2 = step / float(n)
	var p: Vector2 = from
	for i in n:
		var q: Vector2 = p + unit
		if not plan_can_stand(pl, q, r, extras):
			break
		p = q
	return p





















static func plan_rect_on_floor(pl: Dictionary, r: Rect2) -> bool:

	var cuts: Array[float] = [r.position.x, r.end.x]
	for room in pl["rooms"]:
		var rr: Rect2 = room["rect"]
		if not rr.intersects(r):
			continue
		for x in [rr.position.x, rr.end.x]:
			if x > r.position.x + 0.0001 and x < r.end.x - 0.0001:
				cuts.append(x)
	cuts.sort()
	for i in cuts.size() - 1:





		if cuts[i + 1] - cuts[i] < 0.0001:
			continue
		var mid_x: float =(cuts[i] + cuts[i + 1]) * 0.5


		var spans: Array = []
		for room2 in pl["rooms"]:
			var r2: Rect2 = room2["rect"]
			if mid_x <= r2.position.x or mid_x >= r2.end.x:
				continue
			spans.append([r2.position.y, r2.end.y])
		spans.sort_custom(func(a, b): return float(a[0]) < float(b[0]))
		var reach: float = r.position.y
		for sp in spans:
			if float(sp[0]) > reach + 0.0001:
				break
			reach = maxf(reach, float(sp[1]))
			if reach >= r.end.y - 0.0001:
				break
		if reach < r.end.y - 0.0001:
			return false
	return true















static func plan_front_gap(pl: Dictionary, r: Rect2, tope: float = 1.6,
		face: int = FACE_S) -> float:
	const PASO: float = 0.05
	var dir: Vector2 = FACE_DIR[face&3]

	var borde: Vector2 = r.get_center() + Vector2(
		dir.x * r.size.x * 0.5, dir.y * r.size.y * 0.5)
	var d: float = 0.0
	while d < tope:
		var p: Vector2 = borde + dir *(d + PASO * 0.5)
		if not plan_in_floor(pl, p):
			return d
		for other in pl["props"]:
			if bool(other.get("pass", false)):
				continue









			if bool(other.get("guardado", false)):
				continue
			if (other["rect"] as Rect2).has_point(p):
				return d
		d += PASO
	return tope





const REACH_GRID: float = 0.2




const REACH_DIRS: Array[Vector2] = [Vector2(REACH_GRID, 0.0), Vector2(- REACH_GRID, 0.0),
	Vector2(0.0, REACH_GRID), Vector2(0.0, - REACH_GRID)]


















static var _mask_key: String = ""
static var _mask_mem: Dictionary = {}























static func plan_stand_mask(pl: Dictionary, r: float = BODY_R,
		extras: Variant = null) -> Dictionary:
	var st: Dictionary = _mask_arranque(pl, r, extras)
	if st.has("listo"):
		return st["listo"]
	while _mask_tanda(st, 0):
		pass
	return _mask_cierra(st)




static func plan_stand_mask_async(pl: Dictionary, r: float = BODY_R,
		extras: Variant = null) -> Dictionary:
	var st: Dictionary = _mask_arranque(pl, r, extras)
	if st.has("listo"):
		return st["listo"]
	var arbol: SceneTree = Engine.get_main_loop() as SceneTree
	while _mask_tanda(st, MASK_TANDA_US):
		await arbol.process_frame
	return _mask_cierra(st)














const MASK_TANDA_US: int = 12000



static func _mask_arranque(pl: Dictionary, r: float, extras: Variant) -> Dictionary:
	var key: String = "%d|%.2f|%d" % [hash(pl), r, hash(extras)]
	if key == _mask_key and not _mask_mem.is_empty():
		return {"listo": _mask_mem}
	var b: Rect2 = plan_bounds(pl).grow(0.5)
	var w: int = int(ceil(b.size.x / REACH_GRID)) + 1
	var h: int = int(ceil(b.size.y / REACH_GRID)) + 1
	var bits: PackedByteArray = PackedByteArray()
	bits.resize(w * h)
	return {"key": key, "pl": pl, "r": r, "extras": extras,
		"w": w, "h": h, "o": b.position, "bits": bits, "iy": 0, "ix": 0}















static func _mask_tanda(st: Dictionary, us_max: int) -> bool:
	var pl: Dictionary = st["pl"]
	var r: float = float(st["r"])
	var extras: Variant = st["extras"]
	var w: int = int(st["w"])
	var h: int = int(st["h"])
	var o: Vector2 = st["o"]
	var bits: PackedByteArray = st["bits"]
	var iy: int = int(st["iy"])
	var ix: int = int(st["ix"])
	var t0: int = Time.get_ticks_usec()
	while iy < h:
		var y: float = o.y + float(iy) * REACH_GRID
		var fila: int = iy * w
		var tope: int = mini(ix + MASK_TROZO, w)
		while ix < tope:
			if plan_can_stand(pl, Vector2(o.x + float(ix) * REACH_GRID, y), r, extras):
				bits[fila + ix] = 1
			ix += 1
		if ix >= w:
			ix = 0
			iy += 1
		if us_max > 0 and Time.get_ticks_usec() - t0 >= us_max:
			break
	st["iy"] = iy
	st["ix"] = ix
	st["bits"] = bits
	return iy < h





const MASK_TROZO: int = 32


static func _mask_cierra(st: Dictionary) -> Dictionary:
	_mask_key = String(st["key"])
	_mask_mem = {"w": st["w"], "h": st["h"], "o": st["o"], "bits": st["bits"]}
	return _mask_mem








static func mask_reach(m: Dictionary, from: Vector2, apaga: Variant = null) -> Dictionary:
	var w: int = int(m["w"])
	var h: int = int(m["h"])
	var o: Vector2 = m["o"]
	var bits: PackedByteArray = m["bits"]
	var out: Dictionary = {}
	var ix0: int = roundi((from.x - o.x) / REACH_GRID)
	var iy0: int = roundi((from.y - o.y) / REACH_GRID)
	if ix0 < 0 or iy0 < 0 or ix0 >= w or iy0 >= h:
		return out



	var qx0: int = 1
	var qx1: int = 0
	var qy0: int = 1
	var qy1: int = 0






	if apaga is Rect2:
		var q: Rect2 = apaga as Rect2
		qx0 = int(ceil((q.position.x - o.x) / REACH_GRID - 0.001))
		qx1 = int(floor((q.end.x - o.x) / REACH_GRID + 0.001))
		qy0 = int(ceil((q.position.y - o.y) / REACH_GRID - 0.001))
		qy1 = int(floor((q.end.y - o.y) / REACH_GRID + 0.001))
	var i0: int = iy0 * w + ix0
	if bits[i0] == 0 or (ix0 >= qx0 and ix0 <= qx1 and iy0 >= qy0 and iy0 <= qy1):
		return out
	var pila: PackedInt32Array = PackedInt32Array([i0])
	out[i0] = from
	while not pila.is_empty():
		var at: int = pila[pila.size() - 1]
		pila.remove_at(pila.size() - 1)
		var ax: int = at % w
		var ay: int = at / w
		for k in 4:
			var nx: int = ax +(1 if k == 0 else (-1 if k == 1 else 0))
			var ny: int = ay +(1 if k == 2 else (-1 if k == 3 else 0))
			if nx < 0 or ny < 0 or nx >= w or ny >= h:
				continue
			var ni: int = ny * w + nx
			if out.has(ni) or bits[ni] == 0:
				continue
			if nx >= qx0 and nx <= qx1 and ny >= qy0 and ny <= qy1:
				continue
			out[ni] = Vector2(o.x + float(nx) * REACH_GRID, o.y + float(ny) * REACH_GRID)
			pila.append(ni)
	return out










static func plan_reach(pl: Dictionary, from: Vector2, r: float = BODY_R,
		extras: Variant = null) -> Dictionary:
	var out: Dictionary = {}
	var b: Rect2 = plan_bounds(pl).grow(0.5)













	var queue: Array[Vector2] = [from]
	out[(roundi(from.x / REACH_GRID) + 4096) * 8192 + roundi(from.y / REACH_GRID) + 4096] = from
	while not queue.is_empty():
		var at: Vector2 = queue.pop_back()
		for d in REACH_DIRS:
			var to: Vector2 = at + d
			if not b.has_point(to):
				continue
			var k: int =(roundi(to.x / REACH_GRID) + 4096) * 8192 \
					+ roundi(to.y / REACH_GRID) + 4096
			if out.has(k):
				continue
			if not plan_can_stand(pl, to, r, extras):
				continue
			out[k] = to
			queue.append(to)
	return out



static func reach_in(reach: Dictionary, area: Rect2) -> bool:
	for p in reach.values():
		if area.has_point(p as Vector2):
			return true
	return false







static func plan_all_reachable(pl: Dictionary, extras: Variant = null) -> bool:
	var alcance: Dictionary = plan_reach(pl, plan_spawn(pl), BODY_R, extras)
	for room in pl["rooms"]:
		if not reach_in(alcance,(room["rect"] as Rect2).grow(- BODY_R)):
			return false
	return true



static func plan_reach_area(pl: Dictionary, extras: Variant = null) -> int:


	return mask_reach(plan_stand_mask(pl, BODY_R, extras), plan_spawn(pl)).size()





















static func wall_leaves_island(pl: Dictionary, a: Vector2, b: Vector2,
		extras: Variant = null, antes: int = -1, luego_ya: int = -1) -> bool:
	var previo: int = antes if antes >= 0 else plan_reach_area(pl, extras)
	if previo <= 0:
		return false






	var luego: int = luego_ya
	if luego < 0:
		var cand0: Dictionary = {"rooms": pl["rooms"], "props": pl["props"],
			"tabiques":(pl.get("tabiques", []) as Array) + [[a, b]]}
		luego = plan_reach_area(cand0, extras)





	var r: Rect2 = tabique_rect(a, b).grow(BODY_R)
	var celdas_muro: float =(r.size.x * r.size.y) /(REACH_GRID * REACH_GRID)

	var margen: float = celdas_muro + maxf(r.size.x, r.size.y) / REACH_GRID + 8.0
	return float(previo - luego) > margen













static func plan_connected(pl: Dictionary) -> bool:
	var rooms: Array = pl["rooms"]
	if rooms.size() <= 1:
		return true
	var seen: Dictionary = {0: true}
	var stack: Array[int] = [0]
	while not stack.is_empty():
		var i: int = stack.pop_back()
		for j in rooms.size():
			if seen.has(j):
				continue
			if (rooms[i]["rect"] as Rect2).intersects(rooms[j]["rect"] as Rect2):
				seen[j] = true
				stack.append(j)
	return seen.size() == rooms.size()






static func rooms_overlap(a: Rect2, b: Rect2) -> Rect2:
	return a.intersection(b)





static func step_delta(dir: Vector2, dt: float,
		speed: float = WALK_SPEED) -> Vector2:
	var push: float = minf(dir.length(), 1.0)
	if push < 0.001:
		return Vector2.ZERO
	return dir.normalized() * push * speed * dt





















const EXTRAS: Array = [

	{"id": "deco_tapete_ovalado", "icon": "tapete", "level": 0, "price": 85000,
		"name": "TAPETE OVALADO", "kind": "tapete_ovalado", "multi": true,
		"size": Vector2(2.5, 1.5), "col": Color("859697"),
		"desc": "Lana de contorno oval, con borde tejido y centro suave.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_tapete_hexagonal", "icon": "tapete", "level": 0, "price": 95000,
		"name": "TAPETE HEXAGONAL", "kind": "tapete_hexagonal", "multi": true,
		"size": Vector2(2, 2), "col": Color("b9925d"),
		"desc": "Seis lados y franjas concéntricas para vestir un rincón.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_tapete_organico", "icon": "tapete", "level": 0, "price": 135000,
		"name": "TAPETE ORGÁNICO", "kind": "tapete_organico", "multi": true,
		"size": Vector2(2.5, 2), "col": Color("9a9b86"),
		"desc": "Curvas suaves e irregulares, como una piedra de río.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_tapete_pasillo", "icon": "tapete", "level": 0, "price": 120000,
		"name": "TAPETE DE PASILLO", "kind": "tapete_pasillo", "multi": true,
		"size": Vector2(3.5, 1), "col": Color("69796b"),
		"desc": "Tejido alargado con esquinas redondas y bandas claras.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},

	{"id": "deco_tapete_redondo", "icon": "tapete", "level": 0, "price": 65000,
		"name": "TAPETE REDONDO", "kind": "tapete_redondo", "multi": true,
		"size": Vector2(1.5, 1.5), "col": Color("c9af82"),
		"desc": "Yute trenzado en círculos. Va debajo de mesas y sillones.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_tapete_tejido", "icon": "tapete", "level": 0, "price": 110000,
		"name": "TAPETE TEJIDO", "kind": "tapete_tejido", "multi": true,
		"size": Vector2(2.5, 1.5), "col": Color("aa6549"),
		"desc": "Lana con rombos y flecos. Viste el suelo sin estorbar el paso.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_bocinas_torre", "icon": "music", "level": 0, "price": 260000,
		"name": "BOCINAS DE TORRE", "kind": "bocinas_torre", "multi": true,
		"size": Vector2(1.5, 0.5), "col": Color("71563e"),
		"desc": "Dos torres de audio con conos y puertos al frente.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_bocinas_estante", "icon": "music", "level": 0, "price": 180000,
		"name": "BOCINAS DE ESTANTE", "kind": "bocinas_estante", "multi": true,
		"size": Vector2(1.5, 0.5), "col": Color("80664b"),
		"desc": "Dos bocinas compactas y receptor sobre un mueble bajo.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_librero_abierto", "icon": "libros", "level": 0, "price": 210000,
		"name": "LIBRERO ABIERTO", "kind": "librero_abierto", "multi": true,
		"size": Vector2(2, 0.5), "col": Color("80664b"),
		"desc": "Madera y tubos oscuros, con baldas abiertas para libros.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_librero_modular", "icon": "libros", "level": 0, "price": 280000,
		"name": "LIBRERO MODULAR", "kind": "librero_modular", "multi": true,
		"size": Vector2(1.5, 0.5), "col": Color("73513b"),
		"desc": "Cubos, cajones y libros en una composición de madera.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "alberca_surf", "icon": "alberca_surf", "level": 0, "price": 2800000,
		"name": "ALBERCA DE OLAS", "kind": "alberca_surf", "multi": true,
		"desc": "Alberca decorativa con olas en movimiento, agua translúcida y espuma. Incluye generador y tabla.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "mesa_holografica", "icon": "mesa_holografica", "level": 0, "price": 2200000,
		"name": "MESA HOLOGRÁFICA", "kind": "mesa_holografica", "multi": true,
		"desc": "Mesa táctica con proyección 3D. Explora cuatro formaciones y gira la vista.", "rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "espejo_inteligente", "icon": "espejo", "level": 0, "price": 650000,
		"name": "ESPEJO INTELIGENTE", "kind": "espejo_inteligente", "multi": true,
		"desc": "Espejo de pie con pantalla: consulta tu estado y los próximos partidos.", "rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "robot_aspirador", "icon": "robot_aspirador", "level": 0, "price": 250000,
		"name": "ROBOT ASPIRADOR", "kind": "robot_aspirador", "multi": true,
		"desc": "Robot con base de carga. Recorre el suelo libre al colocarlo en casa.", "rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "cama_penthouse", "icon": "cama", "level": 0, "price": 2100000,
		"name": "CAMA PENTHOUSE", "kind": "cama_penthouse", "multi": true,
		"desc": "Cama flotante de nogal con cabecero iluminado. Permite dormir de verdad.", "rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "comedor_penthouse", "icon": "mesa", "level": 0, "price": 2100000,
		"name": "COMEDOR PENTHOUSE", "kind": "comedor_penthouse", "multi": true,
		"desc": "Mesa de mármol negro con seis sillas de piel y detalles de latón.", "rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "sofa_penthouse", "icon": "sofa", "level": 0, "price": 1800000,
		"name": "SOFÁ PENTHOUSE", "kind": "sofa_penthouse", "multi": true,
		"desc": "Sofá modular de piel crema, nogal y latón. Recibe visitas en tu salón.", "rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "canasta_basket", "icon": "canasta_basket", "level": 0, "price": 480000,
		"name": "CANASTA DE BASKET", "kind": "canasta_basket", "multi": true,
		"desc": "Canasta con tablero, red y balón. Diez tiros haciendo flick hacia el aro.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "reloj_pie", "icon": "reloj_pie", "level": 0, "price": 420000,
		"name": "RELOJ DE PIE", "kind": "reloj_pie", "multi": true,
		"desc": "Reloj decorativo de madera con esfera, péndulo y pesas de latón.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},


	{"id": "mesa_pingpong", "icon": "pingpong", "level": 1, "price": 580000,
		"name": "MESA DE PING-PONG", "kind": "pingpong", "multi": true,
		"desc": "Mesa con red y palas. Juega al ping-pong contra un rival.",
		"rest_raw": 0.0, "rel": {}},



	{"id": "pared_reflejos", "icon": "pared_reflejos", "level": 1, "price": 650000,
		"name": "PARED DE REFLEJOS", "kind": "pared_reflejos", "multi": true,
		"desc": "Pared de luces: toca la que se enciende. Récord de reflejos.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "memorama", "icon": "memorama", "level": 0, "price": 340000,
		"name": "MEMORAMA", "kind": "memorama", "multi": true,
		"desc": "Mesa de cartas con tu colección: encuentra las parejas.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "vitrina_brazalete", "icon": "capitan", "level": 0, "price": 160000,
		"name": "VITRINA DEL CAPITÁN", "kind": "brazalete_capitan", "multi": true,
		"desc": "Tu capitanía bajo cristal. Conserva los nombramientos ganados.",
		"rest_raw": 0.0, "rel": {}},
	{"id": "posadero_loro", "icon": "posadero_loro", "level": 0, "price": 65000,
		"name": "POSADERO PARA LORO", "kind": "posadero_loro", "multi": true,
		"desc": "Rama de madera con agua y semillas. Tu loro descansa aquí.",
		"rest_raw": 0.0, "rel": {}},
	{"id": "simulador", "kind": "simulador", "icon": "coche", "level": 0,
		"price": 1500000, "upkeep": 0, "multi": false,
		"name": "SIMULADOR DE CARRERAS",
		"desc": "Asiento deportivo, volante y tres pantallas. Incluye un compacto virtual; tus compras desbloquean más coches. Sin mantenimiento.",
		"rest_raw": 0.0, "rel": {}},
	{"id": "cochera", "kind": "cochera", "icon": "coche", "level": 0,
		"price": 1800000, "upkeep": 0, "multi": false,
		"name": "COCHERA DE COLECCIÓN",
		"desc": "Ocho plazas en una ampliación a la derecha de casa. Terreno incluido y coches colocados automáticamente. Sin mantenimiento.",
		"rest_raw": 0.0, "rel": {}},


	{"id": "camilla_fisio", "icon": "camilla_fisio", "level": 1, "price": 650000,
		"name": "CAMILLA DE FISIOTERAPIA", "kind": "camilla_fisio", "multi": true,
		"desc": "Camilla y material de recuperación. Su sesión recupera energía, no cura lesiones.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "pizarra_tactica", "icon": "pizarra_tactica", "level": 1, "price": 480000,
		"name": "PIZARRA TÁCTICA", "kind": "pizarra_tactica", "multi": true,
		"desc": "Pizarra móvil para preparar el próximo partido. El bono se activa al usarla.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "bici_estatica", "icon": "bici_estatica", "level": 0, "price": 320000,
		"name": "BICICLETA ESTÁTICA", "kind": "bici_estatica", "multi": true,
		"desc": "Cardio suave en casa; requiere estar sin lesión para pedalear.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "colchon_estiramientos", "icon": "colchon_estiramientos", "level": 0,
		"price": 210000, "name": "COLCHÓN DE ESTIRAMIENTOS",
		"kind": "colchon_estiramientos", "multi": true,
		"desc": "Rutina corta de movilidad: recupera energía y un punto de ánimo.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "maquina_respiracion", "icon": "maquina_respiracion", "level": 1,
		"price": 420000, "name": "MÁQUINA DE RESPIRACIÓN",
		"kind": "maquina_respiracion", "multi": true,
		"desc": "Respiración guiada para centrarte. Da ánimo y confianza con el técnico.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "vision_board", "icon": "vision_board", "level": 0, "price": 150000,
		"name": "PANEL DE OBJETIVOS", "kind": "vision_board", "multi": true,
		"desc": "Metas, notas y hábitos de temporada para vestir la pared.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "vinoteca_saludable", "icon": "vinoteca_saludable", "level": 1,
		"price": 390000, "name": "BAR SALUDABLE",
		"kind": "vinoteca_saludable", "multi": true,
		"desc": "Jugos, agua mineral y snacks medidos: recupera energía sin salir.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "lampara_sol", "icon": "lampara_sol", "level": 0, "price": 95000,
		"name": "LÁMPARA SOLAR", "kind": "lampara_sol", "multi": true,
		"desc": "Luz cálida de ambiente para que los rincones se sientan habitados.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},





	{"id": "consultorio_nutri", "icon": "consultorio_nutri", "level": 1, "price": 900000,
		"name": "CONSULTORIO DE NUTRICIÓN", "kind": "consultorio_nutri", "multi": true,
		"desc": "Escritorio, báscula con tallímetro y el plato en la pared: donde trabaja tu nutricionista.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "muro_records", "icon": "muro_records", "level": 1, "price": 350000,
		"name": "MURO DE RÉCORDS", "kind": "muro_records", "multi": true,
		"desc": "Tus goles, asistencias, títulos y mejores temporadas, con datos reales.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "rincon_lectura", "icon": "rincon_lectura", "level": 0, "price": 280000,
		"name": "RINCÓN DE LECTURA", "kind": "rincon_lectura", "multi": true,
		"desc": "Sillón, libro y luz cálida: lee para recuperar energía y ánimo.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "mesa_recuerdos", "icon": "mesa_recuerdos", "level": 0, "price": 185000,
		"name": "MESA DE RECUERDOS", "kind": "mesa_recuerdos", "multi": true,
		"desc": "Cartas y recuerdos de tu carrera. Consulta los momentos guardados.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},



	{"id": "cama_perro", "icon": "cama_perro", "level": 0, "price": 65000,
		"name": "CAMA PARA PERRO", "kind": "cama_perro", "multi": true,
		"desc": "Cojín, manta y juguete: el perro tiene dónde descansar.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "rascador_gato", "icon": "rascador_gato", "level": 0, "price": 110000,
		"name": "RASCADOR PARA GATO", "kind": "rascador_gato", "multi": true,
		"desc": "Postes y plataformas para que el gato tenga su rincón.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "lavanderia", "icon": "lavanderia", "level": 1, "price": 240000,
		"name": "LAVANDERÍA", "kind": "lavanderia", "multi": true,
		"desc": "Lavadora, cesta y toallas para la ropa de entrenamiento.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "recibidor", "icon": "recibidor", "level": 0, "price": 135000,
		"name": "MUEBLE DE RECIBIDOR", "kind": "recibidor", "multi": true,
		"desc": "Llaves, mochila y zapatos: todo a mano junto a la entrada.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},













	{"id": "cabina_podcast", "icon": "cabina_podcast", "level": 1, "price": 560000,
		"name": "CABINA DE PÓDCAST", "kind": "cabina_podcast", "multi": false,
		"desc": "Micro, cascos y panel acústico. Graba tu semana: rinde con la prensa.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "bano_hielo", "icon": "tina_hielo", "level": 1, "price": 180000,
		"name": "TINA DE HIELO", "kind": "tina_hielo", "multi": false,
		"desc": "Agua a tres grados. Tres minutos que las piernas agradecen.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "banco_botas", "icon": "banco_botas", "level": 0, "price": 300000,
		"name": "BANCO DE BOTAS", "kind": "banco_botas", "multi": false,
		"desc": "Balda, cepillo y hormas. Botas cuidadas se gastan la mitad.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "bano_toallero", "icon": "toallero", "level": 0, "price": 25000,
		"name": "TOALLERO", "kind": "toallero", "multi": true,
		"desc": "Barra de pared con toallas limpias. Pide muro para colgarse.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "deco_espejo", "icon": "espejo", "level": 0, "price": 70000,
		"name": "ESPEJO DE CUERPO ENTERO", "kind": "espejo_cuerpo", "multi": true,
		"desc": "Luna de cuerpo entero para mirarte antes de salir.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "mueble_mesa_centro", "icon": "mesa_centro", "level": 0, "price": 50000,
		"name": "MESA DE CENTRO", "kind": "mesa_centro", "multi": true,
		"desc": "Baja, delante del sofá: ahí van el café y el mando.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "cocina_cafe", "icon": "rincon_cafe", "level": 0, "price": 120000,
		"name": "RINCÓN DEL CAFÉ", "kind": "rincon_cafe", "multi": true,
		"desc": "Cafetera, tazas y molinillo. El primer café del día, en casa.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "mueble_aparador", "icon": "aparador", "level": 1, "price": 150000,
		"name": "APARADOR DE VAJILLA", "kind": "aparador", "multi": true,
		"desc": "Vajilla a la vista tras el cristal. La mesa se pone desde aquí.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},



	{"id": "gallinero", "icon": "gallinero", "level": 0, "price": 90000,
		"name": "GALLINERO", "kind": "gallinero", "multi": true,
		"desc": "Caseta con tejadillo y nidal: la gallina tiene dónde dormir.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "vestidor", "icon": "vestidor", "level": 1, "price": 580000,
		"name": "VESTIDOR DE ROPA DE CALLE", "kind": "vestidor", "multi": true,
		"desc": "Ropa de calle, tenis y espejo. Acércate para cambiarte.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},
	{"id": "telescopio", "icon": "telescopio", "level": 2, "price": 1250000,
		"name": "TELESCOPIO", "kind": "telescopio", "multi": true,
		"desc": "Tubo óptico sobre trípode para tu rincón junto a la ventana.",
		"rest_raw": 0.0, "rel": {}, "upkeep": 0},























	{"id": "mesa_poker", "icon": "dice", "level": 1, "price": 900000,
		"name": "MESA DE PÓQUER", "kind": "poker",
		"desc": "Invita a quien quieras y juégate el dinero de verdad.",
		"rest_raw": 0.0, "rel": {"equipo": 3, "prensa": 2}, "upkeep": 4000},





















































	{"id": "mueble_cama_2", "icon": "cama", "level": 1, "price": 340000,
		"name": "CAMA DOBLE", "kind": "cama", "multi": true,
		"size": Vector2(2.0, 2.0), "col": Color("6b4a2f"),
		"desc": "De verdad se descansa.", "rest_raw": 1.0, "rel": {}},
	{"id": "mueble_sofa_2", "icon": "sofa", "level": 1, "price": 420000,
		"name": "SOFÁ ESQUINERO", "kind": "sofa", "multi": true,
		"size": Vector2(2.5, 1.5), "col": Color("4a5560"),
		"desc": "Caben los amigos.", "rest_raw": 1.0, "rel": {"equipo": 2}},







	{"id": "mueble_silla", "icon": "mesa", "level": 0, "price": 9000,
		"name": "SILLA", "kind": "silla", "multi": true,
		"size": Vector2(0.5, 0.5), "col": Color("9a7a52"),
		"desc": "Para sentarse a la mesa.", "rest_raw": 0.0, "rel": {}},
	{"id": "mueble_silla_alta", "icon": "mesa", "level": 1, "price": 22000,
		"name": "BANCO DE BARRA", "kind": "silla_alta", "multi": true,
		"size": Vector2(0.5, 0.5), "col": Color("7d6440"),
		"desc": "Para la barra de la cocina.", "rest_raw": 0.0,
		"rel": {"equipo": 1}},























	{"id": "mueble_tocador", "icon": "tocador", "level": 1, "price": 190000,
		"name": "TOCADOR CON ESPEJO", "kind": "tocador", "multi": true,
		"desc": "Un rincón para los dos: espejo, frascos y banqueta.",
		"rest_raw": 0.0, "rel": {"pareja": 4}},














	{"id": "mueble_mesa_jardin", "icon": "mesa", "level": 1, "price": 320000,
		"name": "MESA DE JARDÍN", "kind": "mesa_jardin", "multi": true,
		"col": Color("9a7a52"),
		"desc": "Con sombrilla. Para comer fuera cuando aprieta el calor.",
		"rest_raw": 1.0, "rel": {"equipo": 3}},
	{"id": "mueble_fuente", "icon": "piscina", "level": 2, "price": 680000,
		"name": "FUENTE", "kind": "fuente", "multi": false,
		"col": Color("9aa4a8"),
		"desc": "Agua corriendo en el patio. Se oye antes de verse.",
		"rest_raw": 1.0, "rel": {"prensa": 4}, "upkeep": 1200},
	{"id": "mueble_pergola", "icon": "planta_deco", "level": 2, "price": 900000,
		"name": "PÉRGOLA", "kind": "pergola", "multi": false,
		"col": Color("7c5f3c"),
		"desc": "Sombra de vigas sobre el patio. Se pasa por debajo.",
		"rest_raw": 2.0, "rel": {"prensa": 3}, "upkeep": 1500},































	{"id": "jardin_arbusto", "icon": "planta_deco", "level": 0, "price": 50000,
		"name": "ARBUSTO", "kind": "arbusto", "multi": true,
		"col": Color("4a6b38"),
		"desc": "Verde bajo para el borde del terreno. Se ponen varios.",
		"rest_raw": 0.0, "rel": {}},
	{"id": "jardin_sombrilla", "icon": "sombrilla", "level": 0, "price": 80000,
		"name": "SOMBRILLA", "kind": "sombrilla", "multi": true,
		"col": Color("c05545"),
		"desc": "Sombra donde no hay árbol. Va sola, sin mesa debajo.",
		"rest_raw": 0.5, "rel": {}},
	{"id": "jardin_farol", "icon": "farol", "level": 0, "price": 90000,
		"name": "FAROL DE JARDÍN", "kind": "farol", "multi": true,
		"col": Color("e8d8b4"),
		"desc": "Luz propia fuera: de noche el jardín deja de ser un hueco negro.",
		"rest_raw": 0.0, "rel": {}},



	{"id": "jardin_camastro", "icon": "camastro", "level": 0, "price": 110000,
		"name": "CAMASTRO", "kind": "camastro", "multi": true,
		"col": Color("d8cbb0"),
		"desc": "Tumbarse al sol. Junto a la piscina se ven de a dos.",
		"rest_raw": 1.0, "rel": {}},



















	{"id": "jardin_hamaca", "icon": "hamaca", "level": 0, "price": 150000,
		"name": "HAMACA", "kind": "hamaca", "multi": true,
		"desc": "Lona suspendida entre dos postes para descansar al aire libre.",
		"rest_raw": 0.5, "rel": {}},
	{"id": "jardin_arbol", "icon": "arbol", "level": 0, "price": 130000,
		"name": "ÁRBOL", "kind": "arbol", "multi": true,
		"col": Color("3f6033"),
		"desc": "Tres metros de copa: lo único que da sombra de verdad.",
		"rest_raw": 0.5, "rel": {"prensa": 1}},
	{"id": "jardin_columpio", "icon": "columpio", "level": 1, "price": 260000,
		"name": "COLUMPIO DE TERRAZA", "kind": "columpio", "multi": true,
		"col": Color("8a6a44"),
		"desc": "Un banco colgado que se mece. Para ver caer la tarde.",
		"rest_raw": 1.2, "rel": {"equipo": 1}},


	{"id": "jardin_fogata", "icon": "fogata", "level": 1, "price": 280000,
		"name": "FOGATA", "kind": "fogata", "multi": false,
		"col": Color("8a7f74"),
		"desc": "Fuego fuera: alumbra el patio y calienta la noche.",
		"rest_raw": 1.5, "rel": {"equipo": 3, "prensa": 2}},
	{"id": "jardin_huerto", "icon": "cantera", "level": 1, "price": 320000,
		"name": "HUERTO", "kind": "huerto", "multi": true,
		"col": Color("6b4a2f"),
		"desc": "Bancales con verdura. Se come lo que sale de tu terreno.",
		"rest_raw": 1.0, "rel": {"prensa": 2}, "upkeep": 600},





	{"id": "jardin_porteria", "icon": "gol", "level": 1, "price": 450000,
		"name": "PORTERÍA DE ENTRENO", "kind": "porteria", "multi": false,
		"col": Color("e8e4dc"),
		"desc": "Portería con red: entrenar en casa deja de ser una idea.",
		"rest_raw": 0.0, "rel": {"equipo": 4, "aficion": 3}, "upkeep": 900},
	{"id": "jardin_estanque", "icon": "acuario", "level": 2, "price": 1100000,
		"name": "ESTANQUE DE KOI", "kind": "estanque", "multi": false,
		"col": Color("6f7d6a"),
		"desc": "Agua quieta con carpas y una cascada que no calla.",
		"rest_raw": 2.5, "rel": {"prensa": 5}, "upkeep": 2200},
	{"id": "jardin_cocina_ext", "icon": "asador", "level": 2, "price": 1400000,
		"name": "COCINA EXTERIOR", "kind": "cocina_ext", "multi": false,
		"col": Color("8e9298"),
		"desc": "Barra, fuegos y fregadero fuera. El asador con casa.",
		"rest_raw": 2.0, "rel": {"equipo": 4, "prensa": 3}, "upkeep": 2600},





	{"id": "jardin_helipuerto", "icon": "helipuerto", "level": 2, "price": 2400000,
		"name": "HELIPUERTO", "kind": "helipuerto", "multi": false,
		"col": Color("3c4148"),



		"lado_min": 20.0,
		"desc": "La losa con la H. No sirve para nada y se ve desde el aire.",
		"rest_raw": 0.0, "rel": {"prensa": 6, "aficion": 4}, "upkeep": 5000},













	{"id": "helicoptero", "icon": "helipuerto", "level": 2, "price": 10500000,
		"name": "HELICÓPTERO", "multi": false, "req_extra": "jardin_helipuerto",
		"desc": "Nada de carreteras: llegas a todo volando y el cuerpo lo nota.",
		"rest_raw": 6.0, "rel": {"prensa": 5, "aficion": 3}, "upkeep": 40000},
	{"id": "mueble_sillon", "icon": "sofa", "level": 1, "price": 120000,
		"name": "SILLÓN", "kind": "sillon", "multi": true,
		"size": Vector2(1.0, 1.0), "col": Color("6a5a72"),
		"desc": "Tu sitio para ver el partido.", "rest_raw": 1.0,
		"rel": {}},
	{"id": "mueble_mesa_2", "icon": "mesa", "level": 1, "price": 290000,
		"name": "MESA DE COMEDOR", "kind": "mesa", "multi": true,
		"size": Vector2(2.0, 1.0), "col": Color("6b4a2f"),
		"desc": "Para sentar a la familia.", "rest_raw": 0.0,
		"rel": {"equipo": 2}},
	{"id": "mueble_cocina_2", "icon": "cocina", "level": 1, "price": 620000,
		"name": "COCINA COMPLETA", "kind": "cocina", "multi": true,
		"size": Vector2(2.5, 0.5), "col": Color("7c8286"),
		"desc": "Aquí ya se cocina en serio.", "rest_raw": 1.0,





		"rel": {"equipo": 2}, "excl": "cocina", "swap": true},
























	{"id": "cocina_dieta", "icon": "nevera", "level": 1, "price": 1100000,
		"name": "COCINA DEL NUTRICIONISTA", "kind": "cocina_dieta", "multi": true,
		"size": Vector2(2.0, 0.5), "col": Color("8e9aa2"),
		"desc": "Nevera de raciones pesadas y báscula en la barra.",
		"rest_raw": 2.0, "rel": {"tecnico": 3}, "excl": "cocina", "swap": true},






















	{"id": "cocina_isla", "icon": "isla", "level": 1, "price": 420000,
		"name": "ISLA CON BARRA", "kind": "cocina_isla", "multi": true,
		"size": Vector2(2.0, 1.0), "col": Color("6e6258"),
		"desc": "Barra central con fregadero: aquí se cocina y se come.",
		"rest_raw": 0.5, "rel": {"equipo": 2}},









	{"id": "mueble_vitrina", "icon": "vitrina", "level": 0, "price": 240000,
		"name": "VITRINA", "kind": "vitrina", "multi": true,
		"desc": "Donde van las copas que ganas.",
		"rest_raw": 0.0, "rel": {"prensa": 2}},









	{"id": "mueble_vitrina_torre", "icon": "vitrina", "level": 0, "price": 190000,
		"name": "VITRINA TORRE", "kind": "vitrina_torre", "multi": true,
		"desc": "Tres baldas en un metro: para el rincón que no da más.",
		"rest_raw": 0.0, "rel": {"prensa": 2}},



	{"id": "mueble_vitrina_premios", "icon": "vitrina", "level": 1, "price": 260000,
		"name": "VITRINA DE PREMIOS", "kind": "vitrina_premios", "multi": true,
		"desc": "Solo para lo tuyo: los galardones individuales.",
		"rest_raw": 0.0, "rel": {"prensa": 4}},







































	{"id": "mueble_vitrina_isla", "icon": "vitrina_isla", "level": 2,
		"price": 1800000, "name": "VITRINA ISLA", "kind": "vitrina_isla",
		"multi": false,
		"desc": "La isla de museo: cristal por los cuatro lados y tres baldas.",
		"rest_raw": 0.0, "rel": {"prensa": 11, "aficion": 7}},




















	{"id": "nat_gorras", "icon": "gorra", "level": 1, "price": 420000,
		"name": "GORRAS DE LA SELECCIÓN", "kind": "gorras_seleccion", "multi": true,
		"desc": "Una gorra por partido con tu país. Se llena sola.",
		"rest_raw": 0.0, "rel": {"prensa": 3, "aficion": 2}},





























	{"id": "balon_debut", "icon": "balon_urna", "level": 0, "price": 120000,
		"name": "BALÓN DEL PRIMER GOL", "kind": "balon_debut", "multi": true,
		"desc": "El balón de tu primer gol, bajo cristal y con su cartela.",
		"rest_raw": 0.0, "rel": {"aficion": 2, "prensa": 1}},






































	{"id": "estatua_bronce", "icon": "estatua", "level": 3, "price": 2400000,
		"name": "ESTATUA DE BRONCE", "kind": "estatua_bronce", "multi": false,
		"desc": "Tú en bronce, sobre un plinto con tu nombre y tus títulos.",
		"rest_raw": 0.0, "rel": {"aficion": 12, "prensa": 10}},





















	{"id": "bano_inodoro", "icon": "bano", "level": 0, "price": 120000,
		"name": "INODORO", "kind": "inodoro", "multi": true,
		"desc": "Lo primero que echa en falta una casa.",
		"rest_raw": 0.0, "rel": {"equipo": 1}},
	{"id": "bano_lavabo", "icon": "bano", "level": 0, "price": 150000,
		"name": "LAVABO", "kind": "lavabo", "multi": true,
		"desc": "Con espejo, para mirarte antes de salir.",
		"rest_raw": 0.0, "rel": {"prensa": 1}},
	{"id": "bano_ducha", "icon": "bano", "level": 1, "price": 330000,
		"name": "DUCHA", "kind": "ducha", "multi": true,
		"desc": "Agua caliente después de entrenar.",
		"rest_raw": 1.0, "rel": {"equipo": 2}},
	{"id": "bano_tina", "icon": "bano", "level": 2, "price": 720000,
		"name": "TINA", "kind": "tina", "multi": true,
		"desc": "Para las piernas cargadas de después del partido.",
		"rest_raw": 2.0, "rel": {"equipo": 2, "prensa": 1}},






















	{"id": "bano_sauna", "icon": "sauna", "level": 2, "price": 950000,
		"name": "SAUNA", "kind": "sauna", "multi": false,
		"desc": "Duelas, piedras calientes y media hora de calor seco.",
		"rest_raw": 3.0, "rel": {}},
	{"id": "deco_tapetes", "icon": "tapete", "level": 0, "price": 90000, "name": "TAPETES", "multi": true,
		"desc": "El suelo deja de estar desnudo.",
		"rest_raw": 0.0, "rel": {"equipo": 3}},
	{"id": "deco_plantas", "icon": "planta_deco", "level": 0, "price": 120000, "name": "PLANTAS", "multi": true,
		"desc": "Algo vivo en cada cuarto.",
		"rest_raw": 0.0, "rel": {"prensa": 2}},










	{"id": "mascota", "icon": "mascota", "level": 0, "price": 180000, "name": "PERRO",
		"desc": "Un perro que te espera y te sigue por los cuartos.",
		"rest_raw": 0.0, "rel": {"equipo": 4, "aficion": 3}, "pet": true},
	{"id": "mascota_gato", "icon": "mascota", "level": 0, "price": 180000, "name": "GATO",
		"desc": "Un gato que pasea a lo suyo... y a veces te sigue.",
		"rest_raw": 0.0, "rel": {"equipo": 4, "aficion": 3}, "pet": true},








	{"id": "mascota_chihuahua", "icon": "mascota", "level": 0, "price": 160000,
		"name": "CHIHUAHUA", "familia": "mascota",
		"desc": "Cabe en una mano y ladra como uno grande.",
		"rest_raw": 0.0, "rel": {"equipo": 3, "aficion": 4}, "pet": true},
	{"id": "mascota_salchicha", "icon": "mascota", "level": 0, "price": 170000,
		"name": "SALCHICHA", "familia": "mascota",
		"desc": "Largo, bajito y siempre detrás de ti.",
		"rest_raw": 0.0, "rel": {"equipo": 4, "aficion": 3}, "pet": true},
	{"id": "mascota_golden", "icon": "mascota", "level": 0, "price": 210000,
		"name": "GOLDEN", "familia": "mascota",
		"desc": "Dorado, bonachón y el favorito del vestuario.",
		"rest_raw": 0.0, "rel": {"equipo": 5, "aficion": 3}, "pet": true},
	{"id": "mascota_husky", "icon": "mascota", "level": 0, "price": 240000,
		"name": "HUSKY", "familia": "mascota",
		"desc": "Ojos de hielo y energía para dar y regalar.",
		"rest_raw": 0.0, "rel": {"equipo": 3, "aficion": 5}, "pet": true},
	{"id": "mascota_gato_negro", "icon": "mascota", "level": 0, "price": 170000,
		"name": "GATO NEGRO", "familia": "mascota_gato",
		"desc": "Dicen que da mala suerte... al rival.",
		"rest_raw": 0.0, "rel": {"equipo": 3, "aficion": 4}, "pet": true},
	{"id": "mascota_gato_gris", "icon": "mascota", "level": 0, "price": 180000,
		"name": "GATO GRIS", "familia": "mascota_gato",
		"desc": "Tranquilo, elegante y dueño del sofá.",
		"rest_raw": 0.0, "rel": {"equipo": 4, "aficion": 3}, "pet": true},
	{"id": "mascota_siames", "icon": "mascota", "level": 0, "price": 200000,
		"name": "SIAMES", "familia": "mascota_gato",
		"desc": "Ojos azules y opinión sobre todo.",
		"rest_raw": 0.0, "rel": {"equipo": 3, "aficion": 4, "prensa": 1}, "pet": true},
	{"id": "mascota_persa", "icon": "mascota", "level": 0, "price": 230000,
		"name": "PERSA", "familia": "mascota_gato",
		"desc": "Una nube blanca que duerme donde quiere.",
		"rest_raw": 0.0, "rel": {"aficion": 3, "prensa": 3}, "pet": true},



	{"id": "mascota_gallina", "icon": "mascota", "level": 0, "price": 135000, "name": "GALLINA",
		"desc": "Una gallina que picotea y trota por la casa.",
		"rest_raw": 0.0, "rel": {"aficion": 3}, "pet": true},
	{"id": "mascota_loro", "icon": "mascota", "level": 0, "price": 165000, "name": "LORO",
		"desc": "Un loro de colores que brinca y no para quieto.",
		"rest_raw": 0.0, "rel": {"aficion": 4, "prensa": 2}, "pet": true},





	{"id": "mascota_pinguino", "icon": "mascota", "level": 0, "price": 220000, "name": "PINGÜINO",
		"desc": "Un pingüino que anda a pasitos por la casa. Dicen que trae suerte en el próximo gol.",
		"rest_raw": 0.0, "rel": {"aficion": 4, "equipo": 2}, "pet": true,
		"festejo": "g_pinguinazo"},
	{"id": "deco_libros", "icon": "libros", "level": 1, "price": 240000, "name": "LIBRERO", "multi": true,
		"desc": "Los libros visten más que el mármol.",
		"rest_raw": 0.0, "rel": {"tecnico": 4}},
	{"id": "deco_luz", "icon": "lampara_pie", "level": 1, "price": 300000, "name": "LÁMPARAS DE PIE", "multi": true,
		"desc": "Rincones cálidos al caer la tarde.",
		"rest_raw": 0.0, "rel": {"prensa": 3}},






















	{"id": "deco_ventana", "icon": "estilo", "level": 0, "price": 150000,
		"name": "VENTANA", "kind": "ventana", "multi": true,
		"desc": "Una ventana más, en el muro que tú elijas.",
		"rest_raw": 0.0, "rel": {"prensa": 2}},
	{"id": "deco_ventanal", "icon": "estilo", "level": 1, "price": 480000,
		"name": "VENTANAL", "kind": "ventanal", "multi": true,
		"desc": "Del suelo al techo: el muro entero se vuelve luz.",
		"rest_raw": 1.0, "rel": {"prensa": 4}},



	{"id": "repisa_pared", "icon": "vitrina", "level": 0, "price": 210000,
		"name": "REPISA DE PARED", "multi": true,
		"desc": "Una balda más para tus trofeos, donde tú digas.",
		"rest_raw": 0.0, "rel": {"aficion": 2}},



















	{"id": "deco_cuadro_1", "icon": "cuadro", "level": 0, "price": 60000,
		"name": "CUADRO DE PARED", "kind": "cuadro", "multi": true,
		"size": Vector2(1.0, 0.25),
		"desc": "Un lienzo con marco. Lo más barato contra un muro pelado.",
		"rest_raw": 0.0, "rel": {}},
	{"id": "deco_banderines", "icon": "banderines", "level": 0, "price": 45000,
		"name": "BANDERINES", "kind": "banderines", "multi": true,
		"desc": "Los de tus clubes, cruzando el rincón en diagonal.",
		"rest_raw": 0.0, "rel": {"aficion": 2}},
	{"id": "deco_tapiz", "icon": "tapiz", "level": 0, "price": 150000,
		"name": "TAPIZ", "kind": "tapiz", "multi": true,
		"desc": "Un tramo de muro con otra tela, de suelo a techo.",
		"rest_raw": 0.0, "rel": {}},
	{"id": "deco_panel", "icon": "material", "level": 1, "price": 380000,
		"name": "PANEL DE MADERA", "kind": "panel_madera", "multi": true,
		"desc": "Duelas de suelo a techo: el muro deja de ser pared.",
		"rest_raw": 1.0, "rel": {"prensa": 2}},
	{"id": "muro_botines", "icon": "tienda", "level": 1, "price": 420000,
		"name": "MIS BOTINES", "kind": "botines_muro", "multi": true,
		"desc": "Los botines de tus noches grandes, en peanas.",
		"rest_raw": 0.0, "rel": {"aficion": 3, "prensa": 2}},
	{"id": "muro_mapa", "icon": "mundo", "level": 1, "price": 340000,
		"name": "MAPA DE GIRAS", "kind": "mapa_giras", "multi": true,
		"desc": "Un mapamundi con una chincheta en cada país donde jugaste. Se llena solo.",
		"rest_raw": 0.0, "rel": {"prensa": 3}},










	{"id": "club_escudo", "icon": "palmares", "level": 0, "price": 220000,
		"name": "ESCUDO DEL CLUB", "kind": "escudo_muro", "multi": true,
		"desc": "El escudo de tu club, retroiluminado contra el muro.",
		"rest_raw": 0.0, "rel": {"aficion": 3}},
	{"id": "club_banderines", "icon": "seleccion", "level": 0, "price": 180000,
		"name": "BANDERINES DE CAMBIO", "kind": "banderin_vitrina", "multi": true,
		"desc": "Un banderín de intercambio por cada club que pisaste.",
		"rest_raw": 0.0, "rel": {"aficion": 2, "prensa": 1}},
	{"id": "club_tifo", "icon": "aficion", "level": 1, "price": 480000,
		"name": "TIFO ENMARCADO", "kind": "tifo_enmarcado", "multi": true,
		"desc": "Un trozo del tifo que te dedicó tu grada, enmarcado.",
		"rest_raw": 0.0, "rel": {"aficion": 4}},
	{"id": "club_balones", "icon": "balon", "level": 1, "price": 300000,
		"name": "BALONES DE TEMPORADA", "kind": "balones_temporada", "multi": true,
		"desc": "Un balón por temporada, con los colores de aquel año.",
		"rest_raw": 0.0, "rel": {"prensa": 2}},
	{"id": "club_butacas", "icon": "maqueta", "level": 0, "price": 260000,
		"name": "BUTACAS DEL ESTADIO", "kind": "butaca_estadio", "multi": true,
		"desc": "Dos butacas originales de la grada, con su número.",
		"rest_raw": 0.5, "rel": {"aficion": 3}},
	{"id": "club_alfombra", "icon": "cancha", "level": 1, "price": 400000,
		"name": "ALFOMBRA DEL CÍRCULO", "kind": "alfombra_circulo", "multi": true,
		"desc": "El círculo central tejido, con tu escudo en medio.",
		"rest_raw": 0.5, "rel": {"aficion": 2}},
	{"id": "club_casillero", "icon": "camiseta", "level": 1, "price": 350000,
		"name": "CASILLERO DEL VESTIDOR", "kind": "casillero", "multi": true,
		"desc": "Tu taquilla del vestidor, con tu dorsal en la puerta.",
		"rest_raw": 0.0, "rel": {"aficion": 1, "prensa": 1}},












	{"id": "muro_cartel", "icon": "balon", "level": 1, "price": 360000,
		"name": "CARTEL DE PARTIDO", "kind": "cartel_partido", "multi": true,
		"desc": "El cartel de tu mejor partido: rival, goles y nota.",
		"rest_raw": 0.0, "rel": {"aficion": 3, "prensa": 2}},





	{"id": "muro_tv", "icon": "tv", "level": 1, "price": 780000,
		"name": "PANTALLA DE MURO", "kind": "tv_muro", "multi": true,
		"desc": "La pantalla colgada, sin mueble que la sostenga.",
		"rest_raw": 1.0, "rel": {"equipo": 2}, "excl": "tele", "swap": true},



	{"id": "deco_chimenea", "icon": "chimenea", "level": 1, "price": 960000,
		"upkeep": 2200,
		"name": "CHIMENEA", "kind": "chimenea", "multi": true,
		"desc": "Fuego de verdad: da luz propia y calienta el rincón.",
		"rest_raw": 2.0, "rel": {"equipo": 3, "prensa": 2}},






	{"id": "luz_buro", "icon": "lampara_pie", "level": 0, "price": 95000,
		"name": "LÁMPARA DE BURÓ", "kind": "lampara_mesa", "multi": true,
		"desc": "Con su buró incluido, para leer sin encender el cuarto.",
		"rest_raw": 1.0, "rel": {}},
	{"id": "luz_tira", "icon": "led", "level": 0, "price": 190000,
		"name": "TIRA LED", "kind": "tira_led", "multi": true,
		"desc": "Bordea el muro y baña el cuarto de color.",
		"rest_raw": 0.0, "rel": {"equipo": 1}},
	{"id": "luz_neon", "icon": "neon", "level": 1, "price": 320000,
		"name": "RÓTULO DE NEÓN", "kind": "neon", "multi": true,
		"desc": "Tu nombre en neón, encendido toda la noche.",
		"rest_raw": 0.0, "rel": {"aficion": 3, "prensa": 2}},

	{"id": "deco_percha", "icon": "percha", "level": 0, "price": 40000,
		"name": "PERCHERO", "kind": "percha", "multi": true,
		"desc": "Donde va la chamarra al entrar por la puerta.",
		"rest_raw": 0.0, "rel": {}},
	{"id": "deco_puf", "icon": "sofa", "level": 0, "price": 55000,
		"name": "PUF", "kind": "puf", "multi": true,
		"desc": "Se tira al suelo y ya hay un sitio más donde caer.",
		"rest_raw": 1.0, "rel": {"equipo": 1}},
	{"id": "deco_macetero", "icon": "macetero", "level": 0, "price": 70000,
		"name": "MACETERO", "kind": "macetero", "multi": true,
		"desc": "Verde de metro ochenta para el rincón que sobra.",
		"rest_raw": 0.0, "rel": {}},
	{"id": "deco_baul", "icon": "caja", "level": 0, "price": 85000,
		"name": "BAÚL", "kind": "baul", "multi": true,
		"desc": "Guarda lo que no se enseña, y hace de banco.",
		"rest_raw": 0.0, "rel": {}},







































	{"id": "deco_maletas", "icon": "maletas", "level": 0, "price": 150000,
		"name": "MALETAS APILADAS", "kind": "maletas", "multi": true,
		"desc": "Una maleta por club. La pila crece con cada traspaso.",
		"rest_raw": 0.0, "rel": {"prensa": 2}},
	{"id": "ocio_carrito", "icon": "carrito", "level": 1, "price": 230000,
		"name": "CARRITO DE REFRESCOS", "kind": "bar_carrito", "multi": true,
		"desc": "Refrescos a mano cuando llega la visita.",
		"rest_raw": 0.0, "rel": {"equipo": 3}},
	{"id": "ocio_tocadiscos", "icon": "music", "level": 1, "price": 410000,
		"name": "TOCADISCOS", "kind": "tocadiscos", "multi": true,
		"desc": "Vinilo, brazo y altavoces sobre su mueble de madera.",
		"rest_raw": 1.0, "rel": {"equipo": 2, "prensa": 1}},
	{"id": "ocio_pecera", "icon": "acuario", "level": 2, "price": 690000,
		"name": "PECERA DE PIE", "kind": "pecera_pie", "multi": true,
		"desc": "Una columna de agua con peces. No hace nada y se mira.",
		"rest_raw": 1.0, "rel": {"prensa": 2}},
	{"id": "ocio_vinoteca", "icon": "vinoteca", "level": 2, "price": 880000,
		"name": "NEVERA DE JUGOS", "kind": "vinoteca", "multi": true,
		"desc": "Jugos en frío, iluminados. La compra del que presume.",
		"rest_raw": 0.0, "rel": {"prensa": 4}},



















	{"id": "ocio_despacho", "icon": "despacho", "level": 1, "price": 380000,
		"name": "DESPACHO CON CAJA FUERTE", "kind": "despacho", "multi": false,
		"desc": "Escritorio, carpetas y caja fuerte. Aquí se firma lo que ganas.",
		"rest_raw": 0.0, "rel": {}},




































	{"id": "ocio_barbero", "icon": "barbero", "level": 1, "price": 480000,
		"name": "SILLÓN DE BARBERO", "kind": "barbero", "multi": false,
		"desc": "Cuero, espejo con bombillas y carrito. Aquí se hacen las portadas.",
		"rest_raw": 0.0, "rel": {"prensa": 3, "aficion": 2}},











	{"id": "gimnasio", "icon": "fisico", "level": 1, "price": 390000,
		"upkeep": 1800, "name": "GIMNASIO EN CASA",
		"desc": "Cuidas el cuerpo: recuperas algo más tras cada partido.",
		"rest_raw": Shop.GIMNASIO_REST_BONUS, "rel": {"tecnico": 6}},




	{"id": "video", "icon": "tv", "level": 1, "price": 1200000, "name": "ESTUDIO DE VIDEO",
		"desc": "Estudias al rival en tu sala. El técnico lo agradece.",
		"rest_raw": 0.0, "rel": {"tecnico": 12, "prensa": 2}},
	{"id": "asador", "icon": "asador", "level": 1, "price": 900000, "name": "ASADOR EN EL PATIO",
		"desc": "El vestuario viene a comer. La química se cocina.",
		"rest_raw": 0.0, "rel": {"equipo": 14, "prensa": 3}},




	{"id": "momentos", "icon": "momentos", "level": 1, "price": 780000, "name": "PARED DE MOMENTOS",
		"desc": "Tus récords, enmarcados donde se vean.",
		"rest_raw": 0.0, "rel": {"prensa": 5}},
	{"id": "maqueta", "icon": "maqueta", "level": 1, "price": 1020000, "name": "MAQUETA DEL ESTADIO",
		"desc": "Tu estadio en miniatura, con los colores de tu club.",
		"rest_raw": 0.0, "rel": {"aficion": 6}},


	{"id": "arcade", "icon": "arcade", "level": 2, "price": 1440000, "name": "ARCADE RETRO",
		"desc": "Partidas viejas para despejar la cabeza. El vestuario pide turno.",
		"rest_raw": 1.0, "rel": {"equipo": 6}},
	{"id": "piscina", "icon": "piscina", "level": 2, "price": 2100000, "name": "PISCINA",
		"desc": "Largos suaves al día siguiente: las piernas lo agradecen.",
		"rest_raw": 5.0, "rel": {"prensa": 4}},
	{"id": "jacuzzi", "icon": "jacuzzi", "level": 2, "price": 1800000, "name": "JACUZZI",
		"desc": "Piernas nuevas al día siguiente del partido.",
		"rest_raw": 7.0, "rel": {}},
	{"id": "cine", "icon": "cine", "level": 2, "price": 2200000, "name": "SALA DE CINE",
		"desc": "Desconectas de verdad. Y todos quieren venir.",
		"rest_raw": 3.0, "rel": {"equipo": 10, "prensa": 8}},
	{"id": "spa", "icon": "spa", "level": 3, "price": 3600000, "name": "SPA CON FISIO",
		"desc": "Tratamiento en casa: el mejor descanso que se compra.",
		"rest_raw": 10.0, "rel": {"tecnico": 6}},








	{"id": "moto", "icon": "moto", "level": 3, "price": 2200000, "name": "MOTO DE COLECCIÓN",
		"desc": "El garage por fin parece garage.",
		"rest_raw": 0.0, "rel": {"prensa": 6, "aficion": 4}},



	{"id": "piano", "icon": "piano", "level": 3, "price": 1800000,
		"name": "PIANO DE COLA",
		"desc": "Laca negra en el salón. Suena a que llegaste.",
		"rest_raw": 0.0, "rel": {"prensa": 10, "aficion": 6}},



















	{"id": "dardos", "icon": "dardos", "level": 0, "price": 220000,
		"name": "DIANA DE DARDOS", "kind": "dardos",
		"desc": "Se tira como se chuta. Reta al vestuario y gana química.",
		"rest_raw": 0.5, "rel": {"equipo": 5}},
	{"id": "billar", "icon": "billar", "level": 3, "price": 1350000,
		"name": "MESA DE BILLAR",
		"desc": "Una partida con el vestuario. La química se juega.",
		"rest_raw": 1.0, "rel": {"equipo": 12, "prensa": 3}},
	{"id": "escultura", "icon": "escultura", "level": 3, "price": 1650000,
		"name": "ESCULTURA", "multi": true,
		"desc": "Una pieza de autor. Puro caché en el salón.",
		"rest_raw": 0.0, "rel": {"prensa": 8, "aficion": 4}},


















	{"id": "balones", "icon": "balon", "level": 1, "price": 420000,
		"name": "VITRINA DE BALONES", "kind": "balones", "multi": true,
		"desc": "Cada balón, con el día y el rival al que se lo metiste.",
		"rest_raw": 0.0, "rel": {"prensa": 3, "aficion": 2}},





	{"id": "balones_museo", "icon": "vitrina", "level": 2, "price": 1600000,
		"name": "MUSEO DE BALONES", "kind": "balones_museo", "multi": true,
		"desc": "Treinta y dos balones tras el cristal, con luz de museo.",
		"rest_raw": 0.0, "rel": {"prensa": 10, "aficion": 7}},














	{"id": "mueble_playera", "icon": "camiseta", "level": 0, "price": 120000,
		"name": "PLAYERA ENMARCADA", "kind": "playera", "multi": true,
		"desc": "Una playera enmarcada, la que tú elijas. Cuelga las que quieras.",
		"rest_raw": 0.0, "rel": {"aficion": 2}},



	{"id": "mueble_perchero_tienda", "icon": "camiseta", "level": 1, "price": 450000,
		"name": "PERCHERO DE TIENDA", "kind": "perchero_tienda", "multi": true,
		"desc": "Doce playeras en ganchos, como en la tienda: las tuyas y las que cambiaste.",
		"rest_raw": 0.0, "rel": {"aficion": 4, "prensa": 2}},




	{"id": "mueble_urna_playeras", "icon": "camiseta", "level": 1, "price": 600000,
		"name": "URNA DE PLAYERAS", "kind": "urna_playeras", "multi": true,
		"desc": "Tres playeras tras el cristal, con luz de museo.",
		"rest_raw": 0.0, "rel": {"aficion": 3, "prensa": 3}},
	{"id": "mueble_mural_playeras", "icon": "camiseta", "level": 1, "price": 540000,
		"name": "MURAL DE PLAYERAS", "kind": "mural_playeras", "multi": true,
		"desc": "Seis playeras enmarcadas en dos filas: tu salón de la fama.",
		"rest_raw": 0.0, "rel": {"aficion": 5}},
	{"id": "mueble_vitrina_especiales", "icon": "camiseta", "level": 2, "price": 900000,
		"name": "VITRINA DE ESPECIALES", "kind": "vitrina_especiales", "multi": true,
		"desc": "Se llena sola con tus cambiadas más raras y valiosas.",
		"rest_raw": 0.0, "rel": {"prensa": 5, "aficion": 3}},


	{"id": "acuario", "icon": "acuario", "level": 3, "price": 2200000,
		"name": "ACUARIO", "multi": true,
		"desc": "Un muro de agua y peces. Baja las pulsaciones.",
		"rest_raw": 3.0, "rel": {"prensa": 6, "aficion": 4}},





	{"id": "estilo_nordico", "icon": "estilo", "level": 1, "price": 750000,
		"name": "ESTILO NORDICO",
		"desc": "Madera clara y paredes de leche: la casa respira.",
		"rest_raw": 0.0, "rel": {"prensa": 3}, "excl": "estilo", "swap": true},





















	{"id": "estilo_noche", "icon": "estilo", "level": 2, "price": 1050000,
		"name": "ESTILO NOCTURNO",
		"desc": "Grafito, humo y madera oscura. Serio como un 0-0 fuera.",
		"rest_raw": 0.0, "rel": {"pareja": 5}, "excl": "estilo", "swap": true},
	{"id": "estilo_club", "icon": "estilo", "level": 2, "price": 1200000,
		"name": "ESTILO DEL CLUB",
		"desc": "Telas y detalles con los colores de tu escudo.",
		"rest_raw": 0.0, "rel": {"aficion": 5}, "excl": "estilo", "swap": true},







	{"id": "estilo_calido", "icon": "estilo", "level": 1, "price": 660000,
		"name": "ESTILO CALIDO",
		"desc": "Terracota, roble y luz de tarde. La casa abraza.",
		"rest_raw": 0.0, "rel": {"equipo": 4}, "excl": "estilo", "swap": true},
	{"id": "estilo_industrial", "icon": "estilo", "level": 2, "price": 1140000,
		"name": "ESTILO INDUSTRIAL",
		"desc": "Cemento visto, acero y madera cruda. Sin adornos.",
		"rest_raw": 0.0, "rel": {"tecnico": 4}, "excl": "estilo", "swap": true},
	{"id": "estilo_marmol", "icon": "estilo", "level": 3, "price": 2500000,
		"name": "ESTILO MARMOL",
		"desc": "Mármol blanco y filos de oro. La casa de un campeón.",
		"rest_raw": 0.0, "rel": {"prensa": 8, "aficion": 6}, "excl": "estilo", "swap": true},













	{"id": "fachada_torre", "icon": "fachada", "level": 0, "fachada_de": 0, "price": 600000,
		"name": "TORRE DE CRISTAL",
		"desc": "Tu piso en una torre de vidrio y acero: la ciudad entera en la ventana.",
		"rest_raw": 0.0, "rel": {"prensa": 3}, "excl": "fachada", "swap": true},
	{"id": "fachada_colonial", "icon": "fachada", "level": 0, "fachada_de": 0, "price": 750000,
		"name": "EDIFICIO COLONIAL",
		"desc": "Balcones de hierro, arcos y muros de color: el barrio viejo de la ciudad.",
		"rest_raw": 0.0, "rel": {"aficion": 3}, "excl": "fachada", "swap": true},
	{"id": "fachada_mediterranea", "icon": "fachada", "level": 1, "fachada_de": 1,
		"price": 1200000, "name": "CASA MEDITERRANEA",
		"desc": "Muros encalados, teja árabe y buganvilla: huele a mar.",
		"rest_raw": 0.0, "rel": {"pareja": 4}, "excl": "fachada", "swap": true},
	{"id": "fachada_cabana", "icon": "fachada", "level": 1, "fachada_de": 1, "price": 1500000,
		"name": "CABAÑA DE MADERA",
		"desc": "Troncos, porche con mecedora y chimenea de piedra: el bosque en tu puerta.",
		"rest_raw": 0.0, "rel": {"equipo": 4}, "excl": "fachada", "swap": true},
	{"id": "fachada_cubo", "icon": "fachada", "level": 2, "fachada_de": 2, "price": 2200000,
		"name": "CUBO DE CRISTAL",
		"desc": "Un cubo de vidrio sobre el jardín: todo luz, nada que esconder.",
		"rest_raw": 0.0, "rel": {"prensa": 5}, "excl": "fachada", "swap": true},
	{"id": "fachada_loft", "icon": "fachada", "level": 2, "fachada_de": 2, "price": 2300000,
		"name": "LOFT DE HORMIGON",
		"desc": "Hormigón visto, ventanales de taller y puerta de acero: industrial de verdad.",
		"rest_raw": 0.0, "rel": {"tecnico": 5}, "excl": "fachada", "swap": true},
	{"id": "fachada_victoriana", "icon": "fachada", "level": 3, "fachada_de": 3,
		"price": 2900000, "name": "MANSION VICTORIANA",
		"desc": "Torreón, buhardillas y balaustradas: la casa de las películas.",
		"rest_raw": 0.0, "rel": {"aficion": 6}, "excl": "fachada", "swap": true},
	{"id": "fachada_villa", "icon": "fachada", "level": 3, "fachada_de": 3, "price": 3200000,
		"name": "VILLA MEDITERRANEA",
		"desc": "Arcos, palmeras y terraza con pérgola: una villa junto al mar.",
		"rest_raw": 0.0, "rel": {"pareja": 6}, "excl": "fachada", "swap": true},
	{"id": "fachada_hacienda", "icon": "fachada", "level": 4, "fachada_de": 4, "price": 3800000,
		"name": "HACIENDA",
		"desc": "Portón de madera, patio con arcos y campanario: la casa grande del campo.",
		"rest_raw": 0.0, "rel": {"equipo": 8}, "excl": "fachada", "swap": true},
	{"id": "fachada_rancho", "icon": "fachada", "level": 4, "fachada_de": 4, "price": 4400000,
		"name": "RANCHO",
		"desc": "Cercas de madera, granero rojo y establo: tierra tuya hasta donde alcanza la vista.",
		"rest_raw": 0.0, "rel": {"tecnico": 8}, "excl": "fachada", "swap": true},













	{"id": "tele_grande", "icon": "tv", "level": 1, "price": 450000,
		"name": "PANTALLA GRANDE", "kind": "tele", "multi": true,
		"desc": "Una tele más grande para ver el gol en condiciones.",
		"rest_raw": 0.0, "rel": {"prensa": 3}, "excl": "tele", "swap": true},
	{"id": "tele_mural", "icon": "tv", "level": 2, "price": 1500000,
		"name": "PANTALLA MURAL", "kind": "tele", "multi": true,
		"desc": "Pantalla de pared, como en el palco. Se ve desde la cocina.",
		"rest_raw": 0.0, "rel": {"prensa": 6, "aficion": 3}, "excl": "tele", "swap": true},
]






const STYLE_TV: Dictionary = {
	"tele_grande": {"k": 1.35, "tier": 1},
	"tele_mural": {"k": 1.85, "tier": 2},
}





static func tv_scale(extras: Array) -> float:
	var k: float = 1.0
	for e in EXTRAS:
		if String(e.get("excl", "")) != "tele" \
				or not extras.has(String(e["id"])):
			continue
		var info: Dictionary = STYLE_TV.get(String(e["id"]), {})
		k = maxf(k, float(info.get("k", 1.0)))
	return k




static func tv_tier(extras: Array) -> int:
	var t: int = 0
	for e in EXTRAS:
		if String(e.get("excl", "")) != "tele" \
				or not extras.has(String(e["id"])):
			continue
		var info: Dictionary = STYLE_TV.get(String(e["id"]), {})
		t = maxi(t, int(info.get("tier", 0)))
	return t













const STYLE_PAL: Dictionary = {
	"estilo_nordico": {"wall": Color("e8e0d0"), "wood": Color("c9ad82"),
		"trim": Color("b89a6f"), "fabric": Color("aab4ae"), "floor": Color("d9ccb2")},
	"estilo_noche": {"wall": Color("55565c"), "wood": Color("4a3e36"),
		"trim": Color("3a3a40"), "fabric": Color("3e4a58"), "floor": Color("41424a")},



	"estilo_club": {"fabric": "accent", "rug": "accent", "trim": "accent_dark",
		"floor": "accent_dark"},



	"estilo_calido": {"wall": Color("e6d5b8"), "wood": Color("9a6a3c"),
		"trim": Color("7c4a28"), "fabric": Color("b06a4a"), "rug": Color("9a5238"),
		"floor": Color("c19a6b")},
	"estilo_industrial": {"wall": Color("8b8e91"), "wood": Color("45464b"),
		"trim": Color("2f3033"), "fabric": Color("4a5560"), "rug": Color("3a4048"),
		"floor": Color("6f7378")},
	"estilo_marmol": {"wall": Color("efe9e0"), "wood": Color("d8cdb8"),
		"trim": Color("c9a24a"), "fabric": Color("e2dac9"), "rug": Color("cbb06a"),
		"floor": Color("e6e0d4")},
}














const PISOS: Array = [
	{"id": "piso_roble", "name": "ROBLE", "price": 0, "color": Color("c19a6b")},
	{"id": "piso_claro", "name": "ARCE CLARO", "price": 180000, "color": Color("d9ccb2")},
	{"id": "piso_nogal", "name": "NOGAL", "price": 240000, "color": Color("6b4a2f")},
	{"id": "piso_pizarra", "name": "PIZARRA", "price": 300000, "color": Color("4a4d52")},
	{"id": "piso_hormigon", "name": "HORMIGÓN", "price": 300000, "color": Color("6f7378")},
	{"id": "piso_marmol", "name": "MÁRMOL", "price": 900000, "color": Color("e6e0d4")},
	{"id": "piso_ajedrez", "name": "DAMERO", "price": 660000, "color": Color("cfc6b6")},
]















const PISO_PASTO: String = "piso_pasto"
const PASTO_ACABADO: Dictionary = {"id": PISO_PASTO, "name": "PASTO", "price": 0,
	"color": Color("47603c")}
const PAREDES: Array = [
	{"id": "muro_cal", "name": "CAL", "price": 0, "color": Color("e8e0d0")},
	{"id": "muro_arena", "name": "ARENA", "price": 150000, "color": Color("e6d5b8")},
	{"id": "muro_niebla", "name": "NIEBLA", "price": 210000, "color": Color("b9bcc0")},
	{"id": "muro_carbon", "name": "CARBÓN", "price": 300000, "color": Color("55565c")},
	{"id": "muro_ladrillo", "name": "LADRILLO", "price": 390000, "color": Color("9a5a44")},
	{"id": "muro_leche", "name": "LECHE", "price": 780000, "color": Color("efe9e0")},
]

















const CARPINTERIAS: Array = [
	{"id": "carp_pino", "name": "PINO", "price": 0, "color": Color("8a6f4a")},
	{"id": "carp_nogal", "name": "NOGAL", "price": 0, "color": Color("5a4029")},
	{"id": "carp_blanco", "name": "BLANCO", "price": 180000, "color": Color("e4ded2")},
	{"id": "carp_negro", "name": "NEGRO MATE", "price": 330000, "color": Color("2f3034")},
	{"id": "carp_aluminio", "name": "ALUMINIO", "price": 480000, "color": Color("9aa2a8")},
	{"id": "carp_laton", "name": "LATÓN", "price": 900000, "color": Color("b08d3f")},
]




const ACABADO_BASE: Dictionary = {"floor": "piso_roble", "wall": "muro_cal",
	"trim": "carp_pino"}

















static func celda_clave(p: Vector2) -> String:
	return "%d|%d" % [int(floorf(p.x / CELDA)), int(floorf(p.y / CELDA))]



static func floor_finish_at(p: Vector2, pintura: Dictionary,
		base: String) -> String:
	return String(pintura.get(celda_clave(p), base))















static func floor_patches(zona: Rect2, pintura: Dictionary,
		base: String) -> Array:
	var out: Array = []
	if pintura.is_empty():
		return out
	var x0: int = int(floorf(zona.position.x / CELDA))
	var z0: int = int(floorf(zona.position.y / CELDA))
	var nx: int = int(ceilf(zona.size.x / CELDA))
	var nz: int = int(ceilf(zona.size.y / CELDA))
	if nx <= 0 or nz <= 0:
		return out






	var grid: PackedInt32Array = PackedInt32Array()
	grid.resize(nx * nz)
	grid.fill(-1)
	var ids: Array = []
	var idx: Dictionary = {}
	var hay: bool = false
	for k in pintura:
		var s: String = String(k)
		var c: int = s.find("|")
		if c < 0:
			continue
		var ci: int = s.substr(0, c).to_int() - x0
		if ci < 0 or ci >= nx:
			continue
		var cj: int = s.substr(c + 1).to_int() - z0
		if cj < 0 or cj >= nz:
			continue

		var cid: String = String(pintura[k])
		if cid == base:
			continue
		var ni: int = int(idx.get(cid, -1))
		if ni < 0:
			ni = ids.size()
			ids.append(cid)
			idx[cid] = ni
		grid[cj * nx + ci] = ni
		hay = true

	if not hay:
		return out


	var usada: PackedByteArray = PackedByteArray()
	usada.resize(nx * nz)
	for j in nz:
		var fila: int = j * nx
		for i in nx:
			if usada[fila + i] != 0:
				continue
			var id_n: int = grid[fila + i]
			if id_n < 0:
				continue

			var w: int = 1
			while i + w < nx and usada[fila + i + w] == 0 \
					and grid[fila + i + w] == id_n:
				w += 1

			var h: int = 1
			while j + h < nz:
				var cabe: bool = true
				var f2: int =(j + h) * nx
				for k2 in w:
					if usada[f2 + i + k2] != 0 or grid[f2 + i + k2] != id_n:
						cabe = false
						break
				if not cabe:
					break
				h += 1
			for jj in h:
				var f3: int =(j + jj) * nx
				for ii in w:
					usada[f3 + i + ii] = 1
			out.append({"id": String(ids[id_n]), "rect": Rect2(
				float(x0 + i) * CELDA, float(z0 + j) * CELDA,
				float(w) * CELDA, float(h) * CELDA)})
	return out





















static func pintura_a_lista(pintura: Dictionary) -> PackedStringArray:
	var out: PackedStringArray = PackedStringArray()
	if pintura.is_empty():
		return out


	var i0: int = 0
	var j0: int = 0
	var i1: int = 0
	var j1: int = 0
	var primero: bool = true
	for k in pintura:
		var s: String = String(k)
		var c: int = s.find("|")
		if c < 0:
			continue
		var ci: int = s.substr(0, c).to_int()
		var cj: int = s.substr(c + 1).to_int()
		if primero:
			i0 = ci
			i1 = ci
			j0 = cj
			j1 = cj
			primero = false
			continue
		i0 = mini(i0, ci)
		i1 = maxi(i1, ci)
		j0 = mini(j0, cj)
		j1 = maxi(j1, cj)
	if primero:
		return out


	for m in floor_patches(Rect2(float(i0) * CELDA, float(j0) * CELDA,
			float(i1 - i0 + 1) * CELDA, float(j1 - j0 + 1) * CELDA), pintura, ""):
		var r: Rect2 =(m as Dictionary)["rect"]
		out.append("%s %d %d %d %d" % [String((m as Dictionary)["id"]),
			int(roundf(r.position.x / CELDA)), int(roundf(r.position.y / CELDA)),
			int(roundf(r.size.x / CELDA)), int(roundf(r.size.y / CELDA))])
	return out






static func pintura_de_lista(lista: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not (lista is PackedStringArray or lista is Array):
		return out
	for e in lista:
		var campos: PackedStringArray = String(e).rsplit(" ", true, 4)
		if campos.size() != 5:
			continue
		var id: String = campos[0]
		if id.is_empty():
			continue
		var i0: int = campos[1].to_int()
		var j0: int = campos[2].to_int()
		var w: int = campos[3].to_int()
		var h: int = campos[4].to_int()
		if w <= 0 or h <= 0:
			continue
		for i in range(i0, i0 + w):
			for j in range(j0, j0 + h):
				out["%d|%d" % [i, j]] = id
	return out








static func floor_paint(pintura: Dictionary, p: Vector2, id: String,
		base: String) -> Dictionary:
	var out: Dictionary = pintura.duplicate()
	var k: String = celda_clave(p)
	if id == base or id.is_empty():
		out.erase(k)
	else:
		out[k] = id
	return out
















static func floor_paint_rect(pintura: Dictionary, r: Rect2, id: String,
		base: String) -> Dictionary:
	var out: Dictionary = pintura.duplicate()
	var i0: int = int(floorf(r.position.x / CELDA))
	var j0: int = int(floorf(r.position.y / CELDA))
	var i1: int = int(ceilf(r.end.x / CELDA)) - 1
	var j1: int = int(ceilf(r.end.y / CELDA)) - 1
	var borra: bool = id == base or id.is_empty()
	for i in range(i0, i1 + 1):
		for j in range(j0, j1 + 1):
			var k: String = "%d|%d" % [i, j]
			if borra:
				out.erase(k)
			else:
				out[k] = id
	return out












static func acabado_zona(id: String) -> String:
	for a in PAREDES:
		if String(a["id"]) == id:
			return "wall"
	for a in CARPINTERIAS:
		if String(a["id"]) == id:
			return "trim"
	return "floor"














const FLOOR_GRANO: Dictionary = {
	"piso_roble": 1, "piso_claro": 1, "piso_nogal": 1,
	"piso_marmol": 2, "piso_pizarra": 3, "piso_hormigon": 4,
	"piso_ajedrez": 5, PISO_PASTO: 6,
}


static func floor_grano(id: String) -> int:
	return int(FLOOR_GRANO.get(id, 0))





const WALL_GRANO: Dictionary = {
	"muro_cal": 1, "muro_arena": 2, "muro_niebla": 3,
	"muro_carbon": 4, "muro_ladrillo": 5, "muro_leche": 6,
}


static func wall_grano(id: String) -> int:
	return int(WALL_GRANO.get(id, 0))


static func acabado_by_id(id: String) -> Dictionary:

	if id == PISO_PASTO:
		return PASTO_ACABADO
	for a in PISOS:
		if String(a["id"]) == id:
			return a
	for a in PAREDES:
		if String(a["id"]) == id:
			return a



	for a in CARPINTERIAS:
		if String(a["id"]) == id:
			return a
	return {}



static func acabado_owned(id: String, finishes: Array) -> bool:
	if id.is_empty():
		return false
	var a: Dictionary = acabado_by_id(id)
	if a.is_empty():
		return false
	return int(a.get("price", 0)) <= 0 or finishes.has(id)







static func paleta_tuya(extras: Array, accent: Color = Color(0, 0, 0, 0),
		finish: Dictionary = {}, finishes: Array = []) -> Dictionary:
	var tuya: Dictionary = {}
	for e in EXTRAS:
		if String(e.get("excl", "")) != "estilo" \
				or not extras.has(String(e["id"])):
			continue
		var over: Dictionary = STYLE_PAL.get(String(e["id"]), {})
		for k in over:
			var v: Variant = over[k]
			if v is Color:
				tuya[k] = v
			elif String(v) == "accent" and accent.a > 0.0:
				tuya[k] = accent
			elif String(v) == "accent_dark" and accent.a > 0.0:
				tuya[k] = accent.darkened(0.35)







	for zona in ["floor", "wall", "trim"]:
		var id: String = String(finish.get(zona, ""))
		if not acabado_owned(id, finishes):
			continue
		var col: Variant = acabado_by_id(id).get("color", null)
		if col is Color:
			tuya[zona] = col
	return tuya








static func palette_for(level: int, extras: Array,
		accent: Color = Color(0, 0, 0, 0),
		finish: Dictionary = {}, finishes: Array = []) -> Dictionary:
	var pal: Dictionary =(level_data(level).get("palette", {}) as Dictionary) \
			.duplicate()
	pal.merge(paleta_tuya(extras, accent, finish, finishes), true)
	return pal















static func catalog_gate() -> int:
	return clamp_level(clamp_tier(Career.land_tier) + 1)


static func extras_for(_level: int) -> Array:
	var out: Array = []
	var gate: int = catalog_gate()
	var mi_nivel: int = clamp_level(Career.house_level)
	for e in EXTRAS:
		if int(e["level"]) > gate:
			continue











		if CIELO_KINDS.has(String(e.get("kind", ""))):
			continue




		if kind_vetado(String(e.get("kind", ""))):
			continue







		if String(e.get("excl", "")) == "fachada" \
				and clamp_level(int(e.get("fachada_de", 0))) != mi_nivel:
			continue
		out.append(e)
	return out




static func es_fachada(id: String) -> bool:
	return String(extra_by_id(id).get("excl", "")) == "fachada"



static func fachada_nivel(id: String) -> int:
	var e: Dictionary = extra_by_id(id)
	if String(e.get("excl", "")) != "fachada":
		return -1
	return clamp_level(int(e.get("fachada_de", 0)))






static func fachada_elegida(level: int, extras: Array) -> String:
	var n: int = clamp_level(level)
	for e in EXTRAS:
		var id: String = String(e["id"])
		if String(e.get("excl", "")) == "fachada" and extras.has(id) \
				and clamp_level(int(e.get("fachada_de", 0))) == n:
			return id
	return ""







static func fachada_ruta(id: String) -> String:
	if id != "finca" and not es_fachada(id):
		return ""
	return "res://ui/house/fachadas/%s.gd" % id.trim_prefix("fachada_")






static func kind_vetado(kind: String) -> bool:
	return kind == "poker" and Settings.sin_apuestas()














static func extra_pitch(extra: Dictionary, energy: float,
		rel: Dictionary) -> String:
	if float(extra.get("rest_raw", 0.0)) > 0.0 and energy < 60.0:
		return "TE CONVIENE: llegas justo de energía"

	var peor: String = ""
	var peor_v: float = 40.0
	for k in (extra.get("rel", {}) as Dictionary):
		var v: float = float(rel.get(String(k), 100))
		if v < peor_v:
			peor_v = v
			peor = String(k)
	if peor.is_empty():
		return ""
	match peor:
		"equipo": return "TE CONVIENE: el vestuario anda frío"
		"aficion": return "TE CONVIENE: la afición anda fría"
		"prensa": return "TE CONVIENE: la prensa no habla de ti"
		"tecnico": return "TE CONVIENE: el técnico no te ve"
		"agente": return "TE CONVIENE: tu agente no se mueve"
	return ""










static func extra_hero_prop(_level: int, extra_id: String) -> Dictionary:











	var kinds: Array = extra_kinds(extra_id)
	if kinds.is_empty():
		return {}


	var best: Dictionary = {}
	var best_area: float = -1.0
	for k in kinds:
		var tpl: Dictionary = blueprint_prop(String(k))
		if tpl.is_empty():
			continue
		var s: Vector2 = tpl["size"]
		var area: float = s.x * s.y
		if area <= best_area:
			continue
		best_area = area


		best = {
			"id": "thumb_%s" % String(k),
			"kind": String(k),
			"rect": Rect2(Vector2.ZERO, s),
			"slot": String(tpl.get("slot", "")),
		}
		if int(tpl.get("tiers", 0)) > 0:
			best["tiers"] = int(tpl["tiers"])
		if float(tpl.get("y", 0.0)) > 0.0:
			best["y"] = float(tpl["y"])
		if bool(tpl.get("pass", false)):
			best["pass"] = true


		var de: Dictionary = extra_by_id(extra_id)
		if de.has("col") and de["col"] is Color:
			best["col"] = de["col"]
	return best


static func extra_by_id(id: String) -> Dictionary:
	for e in EXTRAS:
		if String(e["id"]) == id:
			return e
	return {}




static func excl_conflict(id: String, owned: Array) -> Dictionary:
	var group: String = String(extra_by_id(id).get("excl", ""))
	if group.is_empty():
		return {}
	for e in EXTRAS:
		if String(e["id"]) != id and String(e.get("excl", "")) == group \
				and owned.has(String(e["id"])):
			return e
	return {}





static func pets_owned(owned: Array) -> Array:
	var out: Array = []
	for e in EXTRAS:
		if bool(e.get("pet", false)) and owned.has(String(e["id"])):
			out.append(String(e["id"]))
	return out





static func pet_name(id: String, names: Dictionary) -> String:
	var custom: String = String(names.get(id, ""))
	if not custom.is_empty():
		return custom
	return I18n.t(String(extra_by_id(id).get("name", "MASCOTA")))






static func pet_familia(id: String) -> String:
	return String(extra_by_id(id).get("familia", id))





static func pet_owned(owned: Array) -> String:
	var all: Array = pets_owned(owned)
	return String(all[0]) if not all.is_empty() else ""













static func rooms_unlocked_by(level: int) -> Array:
	var out: Array = []
	if not has_next(level):
		return out
	var ya: Dictionary = {}
	for r in rooms_of(clamp_level(level)):
		ya[String(r.get("id", ""))] = true
	for r2 in rooms_of(clamp_level(level) + 1):
		if ya.has(String(r2.get("id", ""))):
			continue
		var lab: String = String(r2.get("label", ""))
		if not lab.is_empty() and not out.has(lab):
			out.append(lab)
	return out






static func extras_unlocked_by(level: int) -> Array:
	var out: Array = []
	if not has_next(level):
		return out
	for e in EXTRAS:
		if int(e["level"]) == clamp_level(level) + 1:
			out.append(e)
	return out





static func extras_rest(level: int, owned: Array) -> float:
	var total: float = 0.0
	for e in extras_for(level):
		if owned.has(String(e["id"])):
			total += float(e.get("rest_raw", 0.0))
	return total












static func extras_upkeep(level: int, owned: Array) -> int:
	var total: int = 0
	for e in extras_for(level):
		if owned.has(String(e["id"])):
			total += int(e.get("upkeep", 0))






	for it in Career.house_items:
		if not bool(it.get("copia", false)):
			continue
		var e2: Dictionary = extra_by_id(String(it.get("extra", "")))
		if not e2.is_empty():
			total += int(e2.get("upkeep", 0))
	return total























const USES: Array = [
	{"id": "dormir_penthouse", "kind": "cama_penthouse", "name": "DORMIR DE VERDAD",
		"desc": "Ocho horas seguidas y el cuerpo lo agradece.",
		"energy": 10.0, "rel": {}, "sello": "dormir"},
	{"id": "fisio_casa", "kind": "camilla_fisio", "name": "SESIÓN DE FISIOTERAPIA",
		"desc": "Recupera hasta 12 de energía. No acorta las lesiones. Una acción semanal.",
		"energy": 12.0, "rel": {}, "sello": "fisio_casa"},
	{"id": "tactica_casa", "kind": "pizarra_tactica", "name": "PREPARAR EL PARTIDO",
		"desc": "+3 puntos de precisión efectiva para el próximo partido. Una acción semanal.",
		"energy": 0.0, "rel": {}, "next_match": "casa_tactica", "sello": "tactica_casa"},
	{"id": "bici_suave", "kind": "bici_estatica", "name": "PEDALEAR SUAVE",
		"desc": "Hasta +5 de energía y +1 con el técnico, sin lesión. Una acción semanal.",
		"energy": 5.0, "rel": {"tecnico": 1.0}, "sello": "bici_suave"},
	{"id": "leer_casa", "kind": "rincon_lectura", "name": "LEER CON CALMA",
		"desc": "Hasta +3 de energía y +1 de ánimo. Una acción semanal.",
		"energy": 3.0, "form": 1.0, "rel": {}, "sello": "leer_casa"},
	{"id": "estirar_casa", "kind": "colchon_estiramientos", "name": "ESTIRAR EN CASA",
		"desc": "Hasta +4 de energía y +1 de ánimo. Una acción semanal.",
		"energy": 4.0, "form": 1.0, "rel": {}, "sello": "estirar_casa"},
	{"id": "respirar_casa", "kind": "maquina_respiracion", "name": "RESPIRAR Y ENFOCAR",
		"desc": "+1 de ánimo y +1 con el técnico si aún hay margen. Una acción semanal.",
		"energy": 0.0, "form": 1.0, "rel": {"tecnico": 1.0}, "sello": "respirar_casa"},
	{"id": "hidratar_casa", "kind": "vinoteca_saludable", "name": "HIDRATARSE BIEN",
		"desc": "Hasta +4 de energía. Una acción semanal.",
		"energy": 4.0, "rel": {}, "sello": "hidratar_casa"},
	{"id": "dormir", "kind": "cama", "name": "DORMIR DE VERDAD",
		"desc": "Ocho horas seguidas y el cuerpo lo agradece.",
		"energy": 10.0, "rel": {}},




















	{"id": "comer_dieta", "kind": "cocina_dieta", "name": "COMER BIEN",
		"sello": "comer",
		"desc": "Todo pesado y a su hora: el cuerpo lo nota el domingo.",
		"energy": 9.0, "rel": {}},
	{"id": "comer", "kind": "cocina", "name": "COMER BIEN",
		"desc": "Cocinas tú, y comes lo que te toca comer.",
		"energy": 6.0, "rel": {}},
	{"id": "video", "kind": "tele", "name": "ESTUDIAR AL RIVAL",
		"desc": "Te tragas el partido del rival con libreta.",
		"energy": 0.0, "rel": {"tecnico": 3.0}},















	{"id": "contratos", "kind": "despacho", "name": "REPASAR CONTRATOS",
		"desc": "Una tarde con tu agente y los papeles sobre la mesa.",
		"energy": 0.0, "rel": {"agente": 4.0}},







	{"id": "podcast_casa", "kind": "cabina_podcast", "name": "GRABAR UN PÓDCAST",
		"desc": "Una hora de micrófono contando tu semana. Una acción semanal.",
		"energy": 0.0, "rel": {"prensa": 4.0}, "sello": "podcast_casa"},




	{"id": "hielo_casa", "kind": "tina_hielo", "name": "BAÑO DE HIELO",
		"desc": "Hasta +4 de energía y +1 de ánimo. Una acción semanal.",
		"energy": 4.0, "form": 1.0, "rel": {}, "sello": "hielo_casa"},





	{"id": "botas_casa", "kind": "banco_botas", "name": "LIMPIAR LAS BOTAS",
		"desc": "Cepillo, betún y cordones: el próximo partido gasta la mitad.",
		"energy": 0.0, "rel": {}, "next_match": "boot_polish", "sello": "botas_casa"},



	{"id": "poker", "kind": "poker", "name": "PARTIDA DE PÓQUER",
		"desc": "Invitas, se reparten cartas y se juega con tu dinero.",
		"energy": -2.0, "rel": {"equipo": 2.0}},
	{"id": "nadar", "kind": "piscina", "name": "NADAR",
		"desc": "Largos suaves: descarga las piernas sin cargarlas.",
		"energy": 7.0, "rel": {}},














	{"id": "siesta", "kind": "hamaca", "name": "SIESTA AL SOL",
		"desc": "Media hora fuera, sin teléfono. El cuerpo lo agradece.",
		"energy": 4.0, "rel": {}},
	{"id": "arcade", "kind": "arcade", "name": "INVITAR AL VESTUARIO",
		"desc": "Caen dos compañeros y se hace de noche jugando.",
		"energy": 3.0, "rel": {"equipo": 3.0}},









	{"id": "dardos", "kind": "dardos", "name": "NOCHE DE DARDOS",
		"desc": "Caen dos del vestuario y se tira hasta tarde.",
		"energy": 2.0, "rel": {"equipo": 2.0}},
	{"id": "billar", "kind": "billar", "name": "NOCHE DE BILLAR",
		"desc": "Tacos, hielo y una mesa que no se apaga.",
		"energy": 2.0, "rel": {"equipo": 3.0}},


















	{"id": "pesas", "kind": "gimnasio", "name": "LEVANTAR PESAS",
		"desc": "Una hora seria de hierro. El técnico se entera.",
		"energy": 3.0, "rel": {"tecnico": 3.0}},
	{"id": "cinta", "kind": "cinta", "name": "CORRER EN LA CINTA",
		"desc": "Fondo tranquilo: llegas al domingo con otra gasolina.",
		"energy": 5.0, "rel": {}},



	{"id": "perro", "kind": "", "name": "JUGAR CON TU MASCOTA",
		"desc": "Media hora de correr tras algo que no cuenta.",
		"energy": 5.0, "rel": {}},















	{"id": "pareja", "kind": "", "name": "PASAR LA TARDE JUNTOS",
		"desc": "Sin teléfono y sin prisa. Se nota más de lo que parece.",
		"energy": 3.0, "rel": {"pareja": 9.0}},
]









static var _uso_kinds: Dictionary = {}


const CONSULTA_KINDS: Array[String] = ["muro_records", "mesa_recuerdos", "brazalete_capitan"]



const JUEGO_COLGADO_KINDS: Array[String] = ["pared_reflejos"]
static func kind_con_uso(kind: String) -> bool:
	if kind in CONSULTA_KINDS or kind in JUEGO_COLGADO_KINDS:
		return true
	if _uso_kinds.is_empty():
		for u in USES:
			_uso_kinds[String(u["kind"])] = true
	return not kind.is_empty() and _uso_kinds.has(kind)


static func use_for_kind(kind: String) -> Dictionary:
	if kind.is_empty() or kind_vetado(kind):
		return {}
	for u in USES:
		if String(u["kind"]) == kind:
			return u
	return {}






static func uses_for(level: int, extras: Array) -> Array:
	var out: Array = []






	var sellos: Dictionary = {}
	for u in USES:
		var sello: String = String(u.get("sello", u["id"]))
		if sellos.has(sello):
			continue
		var kind: String = String(u["kind"])
		if kind_vetado(kind):
			continue
		if kind.is_empty():


			if String(u["id"]) == "perro" and not pet_owned(extras).is_empty():
				out.append(u)
				sellos[sello] = true
			continue
		for prop in props_of(level):
			if String(prop.get("kind", "")) != kind:
				continue










			if bool(prop.get("guardado", false)):
				continue
			var req: String = String(prop.get("req", ""))
			if req.is_empty() or extras.has(req):
				out.append(u)
				sellos[sello] = true
				break
	return out















static func night_after(comp: String, div: int) -> bool:
	return (comp in ["ucl", "eul", "conf", "cwc", "nat"] or Continental.es_americana(comp)) \
			and div <= 2






const WINTER_FROM: float = 0.35
const WINTER_TO: float = 0.62


static func is_winter(season_ratio: float) -> bool:
	return season_ratio >= WINTER_FROM and season_ratio <= WINTER_TO







static func estacion(season_ratio: float) -> String:
	if season_ratio < 0.0:
		return ""
	if is_winter(season_ratio):
		return "invierno"
	if season_ratio >= 0.08 and season_ratio < WINTER_FROM:
		return "otono"
	if season_ratio > WINTER_TO and season_ratio <= 0.85:
		return "primavera"
	return "verano"











const GUESTS: Array = [
	{"id": "companero", "rel": "equipo", "name": "A UN COMPAÑERO",
		"line": "Se queda hasta tarde. El vestuario se entera de cómo vives."},
	{"id": "tecnico", "rel": "tecnico", "name": "AL TÉCNICO",
		"line": "Café, vídeo y charla larga. Te ve como alguien serio."},
	{"id": "agente", "rel": "agente", "name": "A TU AGENTE",
		"line": "Negocio en la sala de tu casa: aquí las cifras suenan mejor."},













	{"id": "vestuario", "rel": "equipo", "name": "AL VESTUARIO ENTERO",
		"price": 22000, "mult": 2.2, "level": 1,
		"line": "Veinticinco tíos en tu casa hasta la madrugada. La química se cocina."},
]





const VISIT_BASE: float = 3.0
const VISIT_PER_LEVEL: float = 1.5
const VISIT_PER_EXTRA: float = 0.4
const VISIT_MAX: float = 10.0


static func hospitality(level: int, extras: Array) -> float:
	var owned: int = 0
	for e in extras_for(level):
		if extras.has(String(e["id"])):
			owned += 1
	return minf(VISIT_MAX, VISIT_BASE + VISIT_PER_LEVEL * float(clamp_level(level))
		+ VISIT_PER_EXTRA * float(owned))







static func guest_value(guest_id: String, level: int, extras: Array) -> float:
	var g: Dictionary = guest_by_id(guest_id)
	if g.is_empty():
		return 0.0
	return hospitality(level, extras) * float(g.get("mult", 1.0))



static func guests_for(level: int) -> Array:
	var out: Array = []
	for g in GUESTS:
		if int(g.get("level", 0)) <= clamp_level(level):
			out.append(g)
	return out









const POKER_MESAS: Array = [
	{"id": "vestuario", "name": "LOS DEL VESTUARIO", "level": 1, "fichas": 100,
		"desc": "Tres compañeros y una noche larga.",
		"caracteres": ["normal", "loco", "roca"],
		"rel": "equipo", "prensa": 0},
	{"id": "rivales", "name": "GENTE DE OTROS CLUBES", "level": 1, "fichas": 300,
		"desc": "Se juega más fuerte, y se cuenta por ahí.",
		"caracteres": ["roca", "farol", "normal"],
		"rel": "equipo", "prensa": 1},
	{"id": "famosos", "name": "GENTE CONOCIDA", "level": 2, "fichas": 900,
		"desc": "Apuestas de las que salen en el periódico.",
		"caracteres": ["farol", "roca", "loco"],
		"rel": "prensa", "prensa": 2},
]


static func poker_mesas(level: int) -> Array:
	var out: Array = []
	for m in POKER_MESAS:
		if int(m.get("level", 0)) <= clamp_level(level):
			out.append(m)
	return out


static func poker_mesa_by_id(id: String) -> Dictionary:
	for m in POKER_MESAS:
		if String(m["id"]) == id:
			return m
	return {}


static func guest_by_id(id: String) -> Dictionary:
	for g in GUESTS:
		if String(g["id"]) == id:
			return g
	return {}














static func companero_de_visita(plantel: Array, socios: Array, season: int) -> Dictionary:
	for s in socios:
		if int((s as Dictionary).get("v", 0)) <= 0:
			continue
		var nm: String = String((s as Dictionary).get("name", ""))
		for row in plantel:
			if String((row as Dictionary).get("name", "")) == nm:
				return {"name": nm, "number": int((row as Dictionary).get("number", 0)),
					"idx": int((row as Dictionary).get("idx", 0)), "socio": true}
	if plantel.is_empty():
		return {"name": "", "number": 0, "idx": 0, "socio": false}
	var quien: Dictionary =(plantel[season % plantel.size()] as Dictionary).duplicate()
	quien["socio"] = false
	return quien


static func use_by_id(id: String) -> Dictionary:
	for u in USES:
		if String(u["id"]) == id:
			return u
	return {}













static func use_sello(id: String) -> String:
	var u: Dictionary = use_by_id(id)
	return String(u.get("sello", id)) if not u.is_empty() else id










const JERSEY_PASO: float = 1.0



const PERCHERO_FILAS: int = 2
const PERCHERO_PASO: float = 0.55
const PERCHERO_FILA_DY: float = 0.8






const CUELGA_PUNTAS: Array = ["mural_playeras", "vitrina_especiales"]
const URNA_PASO: float = 0.78
const MURAL_FILAS: int = 2
const MURAL_PASO: float = 0.8
const MURAL_FILA_DY: float = 0.9
const MURAL_FR: Vector2 = Vector2(0.7, 0.84)
const ESPECIALES_PASO: float = 0.85





const PERCHA_REJILLA: Dictionary = {
	"perchero_tienda": [PERCHERO_FILAS, PERCHERO_PASO, false],
	"urna_playeras": [1, URNA_PASO, false],
	"mural_playeras": [MURAL_FILAS, MURAL_PASO, false],
	"vitrina_especiales": [1, ESPECIALES_PASO, true],
}








static func cola_camisetas(clubs: Array, keepsakes: Array) -> Array:
	var out: Array = clubs.duplicate()
	for k in Keepsakes.of_kind(keepsakes, Keepsakes.SHIRT):
		var kd: Dictionary = k
		out.append({"club": String(kd.get("rival", "")),
			"number": int(kd.get("who_num", 0)),
			"trade": {"who": String(kd.get("who", "")),
				"legend_key": Keepsakes.legend_key_of(kd),
				"season": int(kd.get("season", 0))},
			"especial": maxf(float(Keepsakes.precio_playera(kd, int(kd.get("season", 0)))), 1.0)
				if Keepsakes.es_especial(kd) else 0.0})
	return out









static func jersey_plan(level: int, clubs: Array) -> Array:
	return plan_jerseys(plan_of(level), clubs)



static func plan_jerseys(pl: Dictionary, clubs: Array) -> Array:
	var out: Array = []
	var queue: Array = clubs.duplicate()




	var desplazadas: Array = []



	var esp_cola: Array = []
	var esp_cap: int = 0
	for prop in plan_slots(pl, "camisetas"):
		if String(prop.get("kind", "")) == "vitrina_especiales":
			esp_cap += int(prop.get("cap", 1))
	if esp_cap > 0:
		var a_mano_ya: Dictionary = {}
		for pid in Career.jersey_picks:
			var pks: Dictionary = Career.jersey_picks[pid]
			for pk in pks.values():
				a_mano_ya[clave_playera(pk)] = true
		var raras: Array = []
		for q in queue:
			if q is Dictionary and float((q as Dictionary).get("especial", 0.0)) > 0.0 \
					and not a_mano_ya.has(clave_playera(q)):
				raras.append(q)
		raras.sort_custom(func(x: Dictionary, y: Dictionary) -> bool:
			return float(x["especial"]) > float(y["especial"]))
		esp_cola = raras.slice(0, esp_cap)
		var resto: Array = []
		for q in queue:
			if not esp_cola.has(q):
				resto.append(q)
		queue = resto
	for prop in plan_slots(pl, "camisetas"):
		var cola_p: Array = esp_cola \
				if String(prop.get("kind", "")) == "vitrina_especiales" else queue


		var r: Rect2 = prop["rect"]
		var along_x: bool = r.size.x >= r.size.y
		var span: float = r.size.x if along_x else r.size.y






















		var picks: Dictionary = Career.jersey_picks.get(String(prop["id"]), {})
		var tope: int = int(prop.get("cap", 1))
		var elegido_max: int = 0
		for k in picks:
			elegido_max = maxi(elegido_max, int(String(k)) + 1)
		var n: int = mini(tope, maxi(cola_p.size(), mini(elegido_max, tope)))



		var rej: Array = PERCHA_REJILLA.get(String(prop.get("kind", "")), [1, JERSEY_PASO, false])
		var filas: int = int(rej[0])
		var fijo: bool = bool(rej[2])



		var por_fila: int = maxi(ceili(float(tope if fijo else n) / float(filas)), 1)
		for i in n:
			var fila: int = i / por_fila
			var en_fila: int = por_fila if fijo else mini(por_fila, n - fila * por_fila)
			var paso: float = minf(float(rej[1]), span / float(maxi(en_fila, 1)))
			var d: float = - paso * float(en_fila - 1) * 0.5 + paso * float(i % por_fila)
			var pick: Dictionary = picks.get(str(i), {})
			var auto: bool = pick.is_empty()



			if not auto and i < cola_p.size():
				desplazadas.append(cola_p[i])
			if auto and i < cola_p.size() and cola_p[i] is Dictionary:
				pick = cola_p[i]
			var club: String = String(pick.get("club", "")) if not pick.is_empty() \
					else (String(cola_p[i]) if auto and i < cola_p.size() else "")
			if club.is_empty():
				continue
			out.append({"club": club,
				"prop_id": String(prop["id"]),
				"idx": i,
				"fila": fila,





				"number": int(pick.get("number", CasaFoto.dorsal(club))),


				"trade": pick.get("trade", {}),
				"auto": auto,
				"pos": Vector2(
					r.get_center().x +(d if along_x else 0.0),
					r.get_center().y +(0.0 if along_x else d))})
		for i in mini(n, cola_p.size()):
			cola_p.pop_front()



	var reserva: Array = desplazadas + queue
	var a_mano: Dictionary = {}
	for e in out:
		if not bool(e["auto"]):
			a_mano[clave_playera(e)] = true
	var limpio: Array = []
	var puestas: Dictionary = a_mano.duplicate()
	for e in out:
		if bool(e["auto"]) and puestas.has(clave_playera(e)):
			var hallada: bool = false
			while not reserva.is_empty() and not hallada:
				var q: Variant = reserva.pop_front()
				var qd: Dictionary = q if q is Dictionary else {"club": String(q)}
				var nuevo: Dictionary = e.duplicate()
				nuevo["club"] = String(qd.get("club", ""))
				nuevo["number"] = int(qd.get("number", CasaFoto.dorsal(nuevo["club"])))
				nuevo["trade"] = qd.get("trade", {})
				if not puestas.has(clave_playera(nuevo)):
					e = nuevo
					hallada = true
			if not hallada:
				continue
		puestas[clave_playera(e)] = true
		limpio.append(e)
	return limpio





static func clave_playera(j: Dictionary) -> String:
	var tr: Dictionary = j.get("trade", {})
	if not tr.is_empty():
		return "t:%s:%s:%s" % [String(j.get("club", "")), String(tr.get("who", "")),
			String(tr.get("legend_key", ""))]
	return "c:%s:%d" % [String(j.get("club", "")), int(j.get("number", 0))]










static func back_door_pos(level: int) -> Vector2:
	for e in extras_for(level):
		if String(e["id"]) == "pista":
			return Vector2(4.0, 9.0)
	return Vector2.INF


static func at_train_door(level: int, p: Vector2) -> bool:
	var d: Vector2 = back_door_pos(level)
	return d != Vector2.INF and p.distance_to(d) <= DOOR_ZONE




static func can_train(level: int, extras: Array) -> bool:
	return back_door_pos(level) != Vector2.INF and extras.has("pista")











const DOOR_W: float = PUERTA_ANCHO
const DOOR_ZONE: float = 1.3













static func plan_door(pl: Dictionary) -> Vector2:
	var d: Variant = pl.get("puerta", null)
	return d if d is Vector2 else door_pos(0)




static func plan_in_doorway(pl: Dictionary, p: Vector2) -> bool:
	var d: Vector2 = plan_door(pl)
	return absf(p.x - d.x) <= DOOR_W * 0.5 and absf(p.y - d.y) <= 0.6





static func door_pos(_level: int) -> Vector2:
	return Vector2(0.0, - lado_of(Career.land_tier) * 0.5)



static func at_door(level: int, p: Vector2) -> bool:
	return p.distance_to(door_pos(level)) <= DOOR_ZONE





static func in_doorway(level: int, p: Vector2) -> bool:
	var d: Vector2 = door_pos(level)
	return absf(p.x - d.x) <= DOOR_W * 0.5 and absf(p.y - d.y) <= 0.6









const MAX_COPIES: int = 5


const COPY_GAP: float = 0.26


const MUSEO_COPY_GAP: float = 0.48
const MUSEO_TROPHY_H: float = 0.42














const GROUP_PAD: float = 0.26









const TROPHY_SEMI: Dictionary = {
	"champions": 0.25, "europa": 0.169, "conference": 0.11, "clubes": 0.175, "copa": 0.163,
	"liga": 0.238, "ascenso": 0.166, "bota": 0.182, "bota_ucl": 0.247, "asist": 0.182,
	"asist_ucl": 0.247, "mvp": 0.141, "mvp_ucl": 0.247, "balon_oro": 0.144, "mundial": 0.182,
	"continental": 0.11, "bota_cup": 0.235, "asist_cup": 0.235, "mvp_cup": 0.235,
	"bota_cwc": 0.235, "asist_cwc": 0.235, "mvp_cwc": 0.235, "balon_historia": 0.188,
	"partido": 0.222, "mes": 0.169, "poker": 0.15, "club_mejor": 0.138, "club_def": 0.16,
	"aficion": 0.172, "club_med": 0.16, "club_del": 0.16, "libertadores": 0.138,
	"sudamericana": 0.169, "concacaf": 0.172, "bota_lib": 0.238, "asist_lib": 0.238,
	"mvp_lib": 0.238, "bota_sud": 0.241, "asist_sud": 0.241, "mvp_sud": 0.241,
	"bota_cca": 0.222, "asist_cca": 0.222, "mvp_cca": 0.222, "supereuropa": 0.107,
	"supercopa": 0.16, "copa_liga": 0.2, "campeones": 0.163, "recopa": 0.15,
	"superafrica": 0.194, "ligas": 0.182, "finalissima": 0.191, "naciones": 0.191, "olimpico": 0.125,
	"chico_oro": 0.232, "premio_mundo": 0.15, "gol_ano": 0.21, "bota_eur": 0.147,
	"bota_wc": 0.229, "asist_wc": 0.229, "mvp_wc": 0.229, "bota_cont": 0.204,
	"asist_cont": 0.204, "mvp_cont": 0.204, "oriente": 0.107, "sol": 0.141, "atlas": 0.11,
	"baobab": 0.135, "coral": 0.21, "mvp_ace": 0.238, "bota_ace": 0.238, "asist_ace": 0.238,
	"mvp_ac2": 0.238, "bota_ac2": 0.238, "asist_ac2": 0.238, "mvp_caf": 0.232,
	"bota_caf": 0.232, "asist_caf": 0.232, "mvp_cf2": 0.229, "bota_cf2": 0.229,
	"asist_cf2": 0.229, "mvp_ofc": 0.25, "bota_ofc": 0.25, "asist_ofc": 0.25,
	"camiseta": 0.21,
}


const SEMI_DEFECTO: float = 0.25

const EDGE_PAD: float = 0.02


const GROUP_GAP: float = 0.04


const POSTE_SEMI: float = 0.02

const POSTE_CADA: float = 1.4





const MAX_TIERS: int = 3



const WALL_HEIGHT: float = 2.3

const TIER_H: float = 0.58
















static func display_plan(level: int, cab: Dictionary,
		pins: Array = [], elegidas: Dictionary = {}) -> Array:
	return plan_display(plan_of(level), cab, pins, elegidas)







static func _pinned_first(queue: Array, pins: Array) -> Array:
	if pins.is_empty():
		return queue
	var fijados: Array = []
	var resto: Array = []
	for it in queue:
		if pins.has(String((it as Dictionary).get("name", ""))):
			fijados.append(it)
		else:
			resto.append(it)


	fijados.sort_custom(func(a, b) -> bool:
		return pins.find(String(a.get("name", ""))) \
				< pins.find(String(b.get("name", ""))))
	fijados.append_array(resto)
	return fijados













const LIGA_Y_COPA: Array = ["Campeón de Liga", "Campeón de Copa", "Campeón de la Copa de la Liga"]
const UN_PARTIDO: Array = ["Campeón de la Finalísima", "Campeón de la Supercopa de Europa",
	"Campeón de la Supercopa de África", "Campeón de la Recopa", "Campeón de Campeones",
	"Campeón de Supercopa"]


static func _liga_y_copa_antes(queue: Array) -> Array:
	var ultima: int = -1
	for i in queue.size():
		if _de_la_familia(queue[i], LIGA_Y_COPA):
			ultima = i
	if ultima < 0:
		return queue
	var out: Array = []
	var aplazadas: Array = []
	for i in queue.size():
		if i < ultima and _de_la_familia(queue[i], UN_PARTIDO):
			aplazadas.append(queue[i])
			continue
		out.append(queue[i])
		if i == ultima:
			out.append_array(aplazadas)
	return out


static func plan_display(pl: Dictionary, cab: Dictionary,
		pins: Array = [], elegidas: Dictionary = {}) -> Array:
	var placements: Array = []
	var team_slots: Array = plan_slots(pl, "trofeos")
	var indiv_slots: Array = plan_slots(pl, "premios")
	var team_q: Array = _pinned_first(
		_liga_y_copa_antes((cab.get("team", []) as Array).duplicate()), pins)
	var indiv_q: Array = _pinned_first(
		(cab.get("individual", []) as Array).duplicate(), pins)


	var sobra: Array = []
	team_slots = _sirve_elegidas(team_slots, elegidas, [team_q, indiv_q], placements, sobra)
	indiv_slots = _sirve_elegidas(indiv_slots, elegidas, [team_q, indiv_q], placements, sobra)







	team_slots = _sirve_familias(team_slots, team_q, placements, sobra)
	indiv_slots = _sirve_familias(indiv_slots, indiv_q, placements, sobra)
	if indiv_slots.is_empty():
		team_q.append_array(indiv_q)
		indiv_q = []
	_fill_slots(team_slots, team_q, placements)
	_fill_slots(indiv_slots, indiv_q, placements)
	return placements





static func vitrina_elegible(prop: Dictionary) -> bool:
	var slot: String = String(prop.get("slot", ""))
	return (slot == "trofeos" or slot == "premios") \
			and (prop.get("acepta", []) as Array).is_empty() \
			and not bool(prop.get("exhibicion_museo", false))












static func _sirve_elegidas(slots: Array, elegidas: Dictionary, colas: Array,
		out: Array, sobra: Array) -> Array:
	if elegidas.is_empty():
		return slots
	var libres: Array = []
	for prop in slots:
		var nombres: Variant = elegidas.get(String(prop.get("id", "")), [])
		var mios: Array = []
		if nombres is Array and vitrina_elegible(prop):
			for nm in nombres:
				var it: Dictionary = _saca_titulo(colas, String(nm))
				if not it.is_empty():
					mios.append(it)
		if mios.is_empty():
			libres.append(prop)
			continue
		_fill_slots([prop], mios, out)
		sobra.append_array(mios)
	return libres



static func _saca_titulo(colas: Array, nm: String) -> Dictionary:
	for cola in colas:
		for i in (cola as Array).size():
			if String((cola[i] as Dictionary).get("name", "")) == nm:
				var it: Dictionary = cola[i]
				(cola as Array).remove_at(i)
				return it
	return {}






static func _sirve_familias(slots: Array, queue: Array, out: Array,
		sobra: Array) -> Array:
	var genericas: Array = []
	var familias: Dictionary = {}
	for prop in slots:
		var acepta: Array = prop.get("acepta", []) as Array
		if acepta.is_empty():
			genericas.append(prop)
			continue
		var firma: String = "|".join(PackedStringArray(acepta))
		if not familias.has(firma):
			familias[firma] = {"acepta": acepta, "slots": []}
		(familias[firma]["slots"] as Array).append(prop)
	for firma in familias:
		var g: Dictionary = familias[firma]
		var mios: Array = []
		var resto: Array = []
		for it in queue:
			if _de_la_familia(it as Dictionary, g["acepta"] as Array):
				mios.append(it)
			else:
				resto.append(it)
		queue.clear()
		queue.append_array(resto)
		var perchas: Array = g["slots"] as Array
		if perchas.all(func(p: Dictionary) -> bool: return bool(p.get("exhibicion_museo", false))):
			_fill_museo_slots(perchas, mios, out)
		else:
			_fill_slots(perchas, mios, out)
		sobra.append_array(mios)
	return genericas




static func _fill_museo_slots(slots: Array, queue: Array, out: Array) -> void:
	for prop in slots:
		if queue.is_empty():
			break
		var item: Dictionary = queue[0]
		var r: Rect2 = prop["rect"]
		var along_x: bool = face_axis(int(prop.get("face", base_face(prop)))) == 0
		var span: float = r.size.x if along_x else r.size.y
		var n: int = mini(int(item["count"]), MAX_COPIES)
		while n > 1 and GROUP_PAD * 2.0 + MUSEO_COPY_GAP * float(n - 1) > span:
			n -= 1
		if GROUP_PAD * 2.0 + MUSEO_COPY_GAP * float(n - 1) > span:
			continue
		var inicio: float =(span - MUSEO_COPY_GAP * float(n - 1)) * 0.5
		for i in n:
			var t: float = inicio + MUSEO_COPY_GAP * float(i)
			out.append({"type": item["type"], "name": item["name"],
				"count": int(item["count"]), "prop_id": String(prop["id"]),
				"pos": Vector2(r.position.x + t if along_x else r.get_center().x,
					r.get_center().y if along_x else r.position.y + t),
				"tier": 0, "copia": i, "trophy_h": MUSEO_TROPHY_H})
		queue.pop_front()





static func _de_la_familia(item: Dictionary, acepta: Array) -> bool:
	for k in item.get("keys", []):
		if acepta.has(String(k)):
			return true
	return false












static func plan_display_unplaced(pl: Dictionary, cab: Dictionary,
		pins: Array = [], elegidas: Dictionary = {}) -> int:
	var team_slots: Array = plan_slots(pl, "trofeos")
	var indiv_slots: Array = plan_slots(pl, "premios")


	var team_q: Array = _pinned_first(
		_liga_y_copa_antes((cab.get("team", []) as Array).duplicate(true)), pins)
	var indiv_q: Array = _pinned_first(
		(cab.get("individual", []) as Array).duplicate(true), pins)
	var dump: Array = []


	var sobra: Array = []
	team_slots = _sirve_elegidas(team_slots, elegidas, [team_q, indiv_q], dump, sobra)
	indiv_slots = _sirve_elegidas(indiv_slots, elegidas, [team_q, indiv_q], dump, sobra)
	if indiv_slots.is_empty():
		team_q.append_array(indiv_q)
		indiv_q = []
	team_slots = _sirve_familias(team_slots, team_q, dump, sobra)
	indiv_slots = _sirve_familias(indiv_slots, indiv_q, dump, sobra)
	if indiv_slots.is_empty():
		team_q.append_array(indiv_q)
		indiv_q = []
	_fill_slots(team_slots, team_q, dump)
	_fill_slots(indiv_slots, indiv_q, dump)
	var left: int = 0
	for it in team_q:
		left += int((it as Dictionary).get("count", 1))
	for it in indiv_q:
		left += int((it as Dictionary).get("count", 1))
	for it in sobra:
		left += int((it as Dictionary).get("count", 1))
	return left



static func semi_of(type: String) -> float:
	return float(TROPHY_SEMI.get(type, SEMI_DEFECTO))




static func group_width(n: int, type: String = "") -> float:
	var semi: float = semi_of(type) if type != "" else SEMI_DEFECTO
	return semi * 2.0 + COPY_GAP * float(maxi(n, 1) - 1)


static func _fill_slots(slots: Array, queue: Array, out: Array) -> void:
	if slots.is_empty() or queue.is_empty():
		return










	var lanes: Array = []
	var max_t: int = 0
	for prop in slots:
		max_t = maxi(max_t, mini(MAX_TIERS, int(prop.get("tiers", MAX_TIERS))))
	for tier in max_t:
		for prop in slots:
			if tier >= mini(MAX_TIERS, int(prop.get("tiers", MAX_TIERS))):
				continue
			var r0: Rect2 = prop["rect"]
			var ax: bool = r0.size.x >= r0.size.y
			lanes.append({"prop": prop, "tier": tier, "cursor": 0.0,
				"along_x": ax, "span": r0.size.x if ax else r0.size.y, "puestos": []})
	if lanes.is_empty():
		return


	var li: int = 0




	var sobra: Array = []
	while not queue.is_empty():
		var item: Dictionary = queue[0]




		var n: int = mini(int(item["count"]), MAX_COPIES)
		var tipo: String = String(item["type"])
		var semi: float = semi_of(tipo)
		var w: float = group_width(n, tipo)
		var puesto: bool = false
		for k in lanes.size():
			var idx: int =(li + k) % lanes.size()
			var lane: Dictionary = lanes[idx]
			var cursor: float = float(lane["cursor"])



			var aire: float = EDGE_PAD if cursor <= 0.0 else GROUP_GAP
			var libre: float = float(lane["span"]) - EDGE_PAD - cursor - aire

			while n > 1 and w > libre:
				n -= 1
				w = group_width(n, tipo)
			if w > libre:
				continue
			var prop: Dictionary = lane["prop"]
			var r: Rect2 = prop["rect"]
			var along_x: bool = bool(lane["along_x"])
			for i in n:
				var t: float = cursor + aire + semi + COPY_GAP * float(i)
				var pos: Vector2 = Vector2(
					r.position.x + t if along_x else r.get_center().x,
					r.get_center().y if along_x else r.position.y + t)




				(lane["puestos"] as Array).append(out.size())
				out.append({"type": item["type"], "name": item["name"],
					"count": int(item["count"]), "prop_id": String(prop["id"]),
					"pos": pos, "tier": int(lane["tier"]), "copia": i})
			lane["cursor"] = cursor + aire + w
			li =(idx + 1) % lanes.size()
			puesto = true
			break


		if not puesto:
			sobra.append(item)
		queue.pop_front()





	for lane in lanes:
		var sobrante: float = float(lane["span"]) - EDGE_PAD - float(lane["cursor"])
		if not (lane["puestos"] as Array).is_empty() and sobrante > 0.0:
			_centrar_balda(lane, out, sobrante)


	queue.append_array(sobra)






static func postes_frente(span: float) -> Array[float]:
	var vanos: int = maxi(1, int(round(span / POSTE_CADA)))
	var postes: Array[float] = []
	for b in range(1, vanos):
		postes.append(span * float(b) / float(vanos))
	return postes









static func _centrar_balda(lane: Dictionary, out: Array, sobrante: float) -> void:
	var centrado: float = sobrante * 0.5
	var ax: bool = bool(lane["along_x"])
	var span: float = float(lane["span"])
	var r: Rect2 =(lane["prop"] as Dictionary)["rect"]


	var postes: Array[float] = []
	if ax:
		postes = postes_frente(span)


	var grupos: Array = []
	for j in lane["puestos"]:
		var o: Dictionary = out[j]
		var pos: Vector2 = o["pos"]
		var t: float = pos.x - r.position.x if ax else pos.y - r.position.y
		var semi: float = semi_of(String(o["type"]))
		if grupos.is_empty() or int(o.get("copia", 0)) == 0:
			grupos.append({"js": [], "izq": t - semi})
		(grupos[-1]["js"] as Array).append(j)
		grupos[-1]["der"] = t + semi
	var desde: Array[float] = []
	if postes.is_empty() or not _tapa_alguno(postes, grupos, centrado):
		for g in grupos:
			desde.append(float(g["izq"]) + centrado)
	elif grupos.size() == 1:


		var g: Dictionary = grupos[0]
		var w: float = float(g["der"]) - float(g["izq"])
		var vanos: int = postes.size() + 1
		var mejor: float = INF
		var s_mejor: float = float(g["izq"]) + centrado
		for b in vanos:
			var s: float = span *(float(b) + 0.5) / float(vanos) - w * 0.5
			if s < EDGE_PAD - 0.0005 or s + w > span - EDGE_PAD + 0.0005 \
					or _poste_en(postes, s, w) >= 0.0:
				continue
			var dist: float = absf(s -(float(g["izq"]) + centrado))
			if dist < mejor:
				mejor = dist
				s_mejor = s

		desde = [s_mejor] as Array[float] if mejor < INF \
				else _esquivar_postes(grupos, postes, span, centrado)
	else:
		desde = _esquivar_postes(grupos, postes, span, centrado)
	for gi in grupos.size():
		var d: float = desde[gi] - float(grupos[gi]["izq"])
		var paso: Vector2 = Vector2(d, 0.0) if ax else Vector2(0.0, d)
		for j in grupos[gi]["js"]:
			out[j]["pos"] =(out[j]["pos"] as Vector2) + paso




static func _poste_en(postes: Array[float], s: float, w: float) -> float:
	for p in postes:
		if p + POSTE_SEMI > s + 0.001 and p - POSTE_SEMI < s + w - 0.001:
			return p
	return -1.0


static func _tapa_alguno(postes: Array[float], grupos: Array, d: float) -> bool:
	for g in grupos:
		if _poste_en(postes, float(g["izq"]) + d, float(g["der"]) - float(g["izq"])) >= 0.0:
			return true
	return false










static func _esquivar_postes(grupos: Array, postes: Array[float], span: float,
		centrado: float) -> Array[float]:
	var lo: Array[float] = []
	var hi: Array[float] = []
	for b in postes.size() + 1:
		lo.append(EDGE_PAD if b == 0 else postes[b - 1] + POSTE_SEMI)
		hi.append(span - EDGE_PAD if b == postes.size() else postes[b] - POSTE_SEMI)
	var desde: Array[float] = []
	desde.resize(grupos.size())
	var mejor: Dictionary = {"coste": INF, "desde": []}
	_cortar_vanos(grupos, lo, hi, centrado, 0, 0, desde, 0.0, mejor)
	if float(mejor["coste"]) < INF:
		return mejor["desde"] as Array[float]

	var sobrante: float = centrado * 2.0
	var d_mejor: float = centrado
	var h_mejor: float = - INF
	for k in int(floor(sobrante / 0.01)) + 1:
		var d: float = minf(float(k) * 0.01, sobrante)
		var h: float = INF
		for g in grupos:
			for q in postes:
				h = minf(h, maxf(float(g["izq"]) + d - q - POSTE_SEMI,
					q - POSTE_SEMI - float(g["der"]) - d))
		h = minf(h, 0.0)
		if h > h_mejor or (h == h_mejor and absf(d - centrado) < absf(d_mejor - centrado)):
			d_mejor = d
			h_mejor = h
	for gi in grupos.size():
		desde[gi] = float(grupos[gi]["izq"]) + d_mejor
	return desde




static func _cortar_vanos(grupos: Array, lo: Array[float], hi: Array[float], centrado: float,
		b: int, primero: int, desde: Array[float], coste: float, mejor: Dictionary) -> void:
	var n: int = grupos.size()
	if b == lo.size():
		if primero == n and coste < float(mejor["coste"]):
			mejor["coste"] = coste
			mejor["desde"] = desde.duplicate()
		return

	for ultimo in range(n if b == lo.size() - 1 else primero, n + 1):
		if ultimo == primero:
			_cortar_vanos(grupos, lo, hi, centrado, b + 1, primero, desde, coste, mejor)
			continue
		var izq: float = float(grupos[primero]["izq"])
		var ancho: float = float(grupos[ultimo - 1]["der"]) - izq
		if ancho > hi[b] - lo[b] + 0.0005:
			break
		var s: float = clampf(izq + centrado, lo[b], hi[b] - ancho)
		var c: float = coste + absf(s - izq - centrado) * float(ultimo - primero)
		if c >= float(mejor["coste"]):
			continue
		for gi in range(primero, ultimo):
			desde[gi] = float(grupos[gi]["izq"]) + s - izq
		_cortar_vanos(grupos, lo, hi, centrado, b + 1, ultimo, desde, c, mejor)



static func shelf_of(plan: Array, prop_id: String) -> Array:
	var out: Array = []
	for p in plan:
		if String(p["prop_id"]) == prop_id:
			out.append(p)
	return out









static func nearest_prop(level: int, p: Vector2, reach: float = 1.1) -> Dictionary:
	return plan_nearest_prop(plan_of(level), p, reach)





static func plan_nearest_prop(pl: Dictionary, p: Vector2,
		reach: float = 1.1) -> Dictionary:
	var best: Dictionary = {}
	var best_d: float = reach
	for prop in (pl["props"] as Array):
























		if bool(prop.get("pass", false)) \
				and String(prop.get("slot", "")).is_empty() \
				and prop.get("kind") != "cochera" \
				and not kind_con_uso(String(prop.get("kind", ""))):
			continue








		if bool(prop.get("guardado", false)):
			continue








		if bool(prop.get("pass", false)) and HANG_KINDS.has(String(prop.get("kind", ""))) \
				and kind_con_uso(String(prop.get("kind", ""))) \
				and not _delante_de_colgado(pl, prop["rect"], p, int(prop.get("face", -1))):
			continue
		var d: float = _dist_to_rect(p, prop["rect"])
		if d < best_d:
			best_d = d
			best = prop
	return best






static func _delante_de_colgado(pl: Dictionary, r: Rect2, p: Vector2,
		face: int = -1) -> bool:
	if face >= 0:
		return (p - r.get_center()).dot(FACE_DIR[face&3]) > 0.0


	if not pl.has("rooms"):
		return true
	var lx: bool = r.size.x >= r.size.y
	var paso: Vector2 = Vector2(0, 1) if lx else Vector2(1, 0)
	var mas: Dictionary = plan_room_at(pl, r.get_center() + paso)
	var menos: Dictionary = plan_room_at(pl, r.get_center() - paso)
	var sg: float = 1.0 if not mas.is_empty() and menos.is_empty() else -1.0
	return (p - r.get_center()).dot(paso * sg) > 0.0


static func _dist_to_rect(p: Vector2, rect: Rect2) -> float:
	var closest: Vector2 = Vector2(
		clampf(p.x, rect.position.x, rect.end.x),
		clampf(p.y, rect.position.y, rect.end.y))
	return p.distance_to(closest)




const KIND_NAMES: Dictionary = {
	"tapete_ovalado": "TAPETE OVALADO",
	"tapete_hexagonal": "TAPETE HEXAGONAL",
	"tapete_organico": "TAPETE ORGÁNICO",
	"tapete_pasillo": "TAPETE DE PASILLO",
	"tapete_redondo": "TAPETE REDONDO",
	"tapete_tejido": "TAPETE TEJIDO",
	"bocinas_torre": "BOCINAS DE TORRE",
	"bocinas_estante": "BOCINAS DE ESTANTE",
	"librero_abierto": "LIBRERO ABIERTO",
	"librero_modular": "LIBRERO MODULAR",
	"alberca_surf": "ALBERCA DE OLAS",
	"mesa_holografica": "MESA HOLOGRÁFICA",
	"espejo_inteligente": "ESPEJO INTELIGENTE",
	"robot_aspirador": "ROBOT ASPIRADOR",
	"cama_penthouse": "CAMA PENTHOUSE",
	"comedor_penthouse": "COMEDOR PENTHOUSE",
	"sofa_penthouse": "SOFÁ PENTHOUSE",
	"canasta_basket": "CANASTA DE BASKET", "reloj_pie": "RELOJ DE PIE",
	"pingpong": "MESA DE PING-PONG", "brazalete_capitan": "VITRINA DEL CAPITÁN",
	"pared_reflejos": "PARED DE REFLEJOS", "memorama": "MEMORAMA",
	"posadero_loro": "POSADERO PARA LORO",
	"cochera": "COCHERA DE COLECCIÓN",
	"coche": "DEPORTIVO", "coche_muscle": "MUSCLE CAR",
	"coche_gt": "GRAN TURISMO", "coche_hiper": "HIPERDEPORTIVO",
	"coche_compacto": "COMPACTO URBANO", "coche_sedan": "SEDÁN CLÁSICO",
	"coche_familiar": "FAMILIAR VIAJERO", "coche_pickup": "PICKUP DE CAMPO",
	"camilla_fisio": "CAMILLA DE FISIOTERAPIA", "pizarra_tactica": "PIZARRA TÁCTICA",
	"bici_estatica": "BICICLETA ESTÁTICA", "muro_records": "MURO DE RÉCORDS",
	"rincon_lectura": "RINCÓN DE LECTURA", "mesa_recuerdos": "MESA DE RECUERDOS",
	"colchon_estiramientos": "COLCHÓN DE ESTIRAMIENTOS",
	"maquina_respiracion": "MÁQUINA DE RESPIRACIÓN", "vision_board": "PANEL DE OBJETIVOS",
	"vinoteca_saludable": "BAR SALUDABLE", "lampara_sol": "LÁMPARA SOLAR",
	"consultorio_nutri": "CONSULTORIO DE NUTRICIÓN",
	"cama_perro": "CAMA PARA PERRO", "rascador_gato": "RASCADOR PARA GATO",
	"lavanderia": "LAVANDERÍA", "recibidor": "MUEBLE DE RECIBIDOR",
	"cabina_podcast": "CABINA DE PÓDCAST", "tina_hielo": "TINA DE HIELO",
	"banco_botas": "BANCO DE BOTAS", "toallero": "TOALLERO",
	"espejo_cuerpo": "ESPEJO DE CUERPO ENTERO", "mesa_centro": "MESA DE CENTRO",
	"rincon_cafe": "RINCÓN DEL CAFÉ", "aparador": "APARADOR DE VAJILLA",
	"gallinero": "GALLINERO",
	"vestidor": "VESTIDOR DE ROPA DE CALLE", "telescopio": "TELESCOPIO",
	"sofa": "SOFÁ", "mesa": "MESA", "repisa": "REPISA", "cama": "CAMA",
	"vitrina": "VITRINA", "marco": "MARCO", "banca": "BANCA",
	"playera": "PLAYERA ENMARCADA",
	"perchero_tienda": "PERCHERO DE TIENDA",
	"urna_playeras": "URNA DE PLAYERAS", "mural_playeras": "MURAL DE PLAYERAS",
	"vitrina_especiales": "VITRINA DE ESPECIALES",
	"vitrina_torre": "VITRINA TORRE", "vitrina_galeria": "VITRINA GALERÍA",
	"vitrina_premios": "VITRINA DE PREMIOS",
	"vitrina_isla": "VITRINA ISLA",
	"gorras_seleccion": "GORRAS DE LA SELECCIÓN",
	"balon_debut": "BALÓN DEL PRIMER GOL",



	"estatua_bronce": "ESTATUA DE BRONCE",
	"tele": "TELEVISIÓN", "camisetas": "MIS CAMISETAS",
	"cocina": "COCINA", "librero": "LIBRERO", "planta": "PLANTA",
	"cocina_isla": "ISLA CON BARRA",



	"cocina_dieta": "COCINA DEL NUTRICIONISTA",
	"lampara": "LÁMPARA", "maqueta": "MAQUETA DE TU ESTADIO",
	"arcade": "ARCADE", "piscina": "PISCINA", "moto": "MOTO",
	"simulador": "SIMULADOR DE CARRERAS",
	"balones_museo": "MUSEO DE BALONES",
	"piano": "PIANO DE COLA", "billar": "MESA DE BILLAR",
	"dardos": "DIANA DE DARDOS",
	"futbolin": "FUTBOLITO", "escultura": "ESCULTURA", "acuario": "ACUARIO",
	"jacuzzi": "JACUZZI",
	"inodoro": "INODORO", "lavabo": "LAVABO", "ducha": "DUCHA", "tina": "TINA",
	"sauna": "SAUNA",
	"mesa_jardin": "MESA DE JARDÍN", "fuente": "FUENTE", "pergola": "PÉRGOLA",
	"gimnasio": "GIMNASIO", "pesas": "MANCUERNAS", "cinta": "CINTA",
	"espejo": "ESPEJO", "reloj": "RELOJ DE ORO",
	"tocador": "TOCADOR",





	"alfombra": "ALFOMBRA", "momentos": "PARED DE MOMENTOS",
	"ventana": "VENTANA", "ventanal": "VENTANAL", "ojo_buey": "OJO DE BUEY",
	"repisa_pared": "REPISA DE PARED",

	"cuadro": "CUADRO DE PARED", "banderines": "BANDERINES", "bufandas": "MIS BUFANDAS",
	"botines_muro": "MIS BOTINES", "tapiz": "TAPIZ",

	"escudo_muro": "ESCUDO DEL CLUB", "banderin_vitrina": "BANDERINES DE CAMBIO",
	"tifo_enmarcado": "TIFO ENMARCADO", "balones_temporada": "BALONES DE TEMPORADA",
	"butaca_estadio": "BUTACAS DEL ESTADIO", "alfombra_circulo": "ALFOMBRA DEL CÍRCULO",
	"casillero": "CASILLERO DEL VESTIDOR",
	"panel_madera": "PANEL DE MADERA", "mapa_giras": "MAPA DE GIRAS",
	"tv_muro": "PANTALLA DE MURO", "chimenea": "CHIMENEA",
	"cartel_partido": "CARTEL DE PARTIDO", "portada_prensa": "PORTADA ENMARCADA",
	"placa_fichaje": "PLACA DE FICHAJE",
	"plafon": "PLAFÓN", "arana": "ARAÑA", "aplique": "APLIQUE",
	"lampara_mesa": "LÁMPARA DE BURÓ", "neon": "RÓTULO DE NEÓN",
	"tira_led": "TIRA LED",
	"macetero": "MACETERO", "pecera_pie": "PECERA DE PIE",
	"bar_carrito": "CARRITO DE REFRESCOS", "puf": "PUF", "baul": "BAÚL",
	"percha": "PERCHERO", "vinoteca": "NEVERA DE JUGOS", "tocadiscos": "TOCADISCOS",


	"maletas": "MALETAS APILADAS",



	"despacho": "DESPACHO CON CAJA FUERTE",





	"barbero": "SILLÓN DE BARBERO",

	"camastro": "CAMASTRO", "sombrilla": "SOMBRILLA", "hamaca": "HAMACA",
	"arbusto": "ARBUSTO", "arbol": "ÁRBOL", "farol": "FAROL DE JARDÍN",
	"fogata": "FOGATA", "huerto": "HUERTO", "columpio": "COLUMPIO DE TERRAZA",
	"porteria": "PORTERÍA DE ENTRENO", "estanque": "ESTANQUE DE KOI",
	"cocina_ext": "COCINA EXTERIOR", "helipuerto": "HELIPUERTO",
}


static func kind_name(prop: Dictionary) -> String:
	return String(KIND_NAMES.get(String(prop.get("kind", "")), ""))






static func room_at(level: int, p: Vector2) -> Dictionary:
	return plan_room_at(plan_of(level), p)





static func plan_room_at(pl: Dictionary, p: Vector2) -> Dictionary:
	for room in (pl["rooms"] as Array):
		if (room["rect"] as Rect2).has_point(p):
			return room
	return {}
