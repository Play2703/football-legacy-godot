extends RefCounted






































const DOMAINS: Dictionary = {



	"trueno_himno": {
		"GOLEADA": "РАЗГРОМ",
		"¡HUH!": "УХ!",
		"¡CON EL BOMBO!": "ПОД БАРАБАН!",
		"¡DESCUADRE!": "НЕ В ТАКТ!",
		"¡TRUENO!": "ГРОМ!",
		"SE DESCUADRO": "СБИЛИСЬ",
		"goleada": "разгром",
		"palmas": "хлопки",
		"La grada entera, a tu compás.": "Вся трибуна — в твоем ритме.",
		"Las palmas se fueron cada una por su lado.": "Хлопки рассыпались кто куда.",
		"EL TRUENO": "ГРОМ",
		"EL APRETON": "РУКОПОЖАТИЕ",
		"EL HIMNO": "ГИМН",
		"A TU LADO: {0}": "РЯДОМ: {0}",
		"EN DIRECTO": "В ЭФИРЕ",
		"RISA": "СМЕХ",
		"AGUANTA": "ДЕРЖИСЬ",
		"¡TE BUSCA!": "ОСТОРОЖНО!",
		"¡REVIENTAS!": "РАСКОЛОЛСЯ!",
		"¡LA TELE!": "КАМЕРА!",
		"¡JA, JA!": "ХА-ХА!",
		"¡PILLADO!": "ПОПАЛСЯ!",
		"¡AGUANTASTE!": "ВЫДЕРЖАЛ!",
		"Todo el país te ha visto reírte en pleno himno.": "Вся страна видела, как ты смеялся во время гимна.",
		"Cara de piedra con todo el país mirando.": "Каменное лицо — на глазах у всей страны.",
		"El Trueno": "Гром",
		"Llevar a la grada entera hasta el redoble tras una goleada en casa.": "Довести всю трибуну до финальной барабанной дроби после домашнего разгрома.",
		"Aguantar el himno sin reírte con la tele delante.": "Выдержать гимн и не рассмеяться перед камерой.",
		"Pillado en Directo": "Попался в эфире",
		"Que la tele te pille riéndote durante el himno.": "Попасть в кадр смеющимся во время гимна.",
		"Tras una goleada en casa, la grada espera a que alguien marque el compás.": "После домашнего разгрома трибуна ждет, кто задаст ритм.",
		"Con tu selección, el himno se canta serio... aunque el de al lado no ayude.": "В сборной гимн поют с серьезным лицом... даже если сосед не помогает.",
		"Con tu selección, ojo con quién tienes al lado cuando suena el himno.": "В сборной смотри, кто стоит рядом, когда звучит гимн.",
		"El Míster Aún Sabe": "Тренер еще в деле",
		"Que tu técnico baje de pecho un balón fuera y se la dé al que saca de banda.": "Пусть твой тренер примет на грудь мяч, ушедший в аут, и отдаст его тому, кто вбрасывает.",
		"Cuando el balón sale por tu banquillo, a veces el míster no se resiste.": "Когда мяч уходит в аут у твоей скамейки, тренер иногда не может удержаться.",
		"¡PENAL!": "ПЕНАЛЬТИ!",
		"NO ERA PENAL": "НЕ ПЕНАЛЬТИ",
		"{0} NO LO OLVIDA": "{0} ЭТО ПОМНИТ",
		"¡ESE NO ES!": "НЕ ТОТ ГИМН!",
		"EL MARACANAZO": "МАРАКАНАСО",
		"EL CABEZAZO": "ТАРАН ГОЛОВОЙ",
		"LA PRÓRROGA DE RÍO": "ДОП. ВРЕМЯ В РИО",
		"LOS PENALES DE DOHA": "ПЕНАЛЬТИ В ДОХЕ",
		"EL GOL DE ORO": "ЗОЛОТОЙ ГОЛ",
		"GOL DE ORO": "ЗОЛОТОЙ ГОЛ",
		"DOS EN EL DESCUENTO": "ДУБЛЬ В КОМПЕНС. ВРЕМЯ",
		"EL ÚLTIMO SUSPIRO": "НА ПОСЛЕДНЕЙ МИНУТЕ",
		"LA VUELTA DE ÁMSTERDAM": "ОТВЕТНЫЙ В АМСТЕРДАМЕ",
		"LA MANITA": "ПЯТЬ МЯЧЕЙ",
		"ROJA DIRECTA": "ПРЯМАЯ КРАСНАЯ",
		"EN LOS PENALES": "ПО ПЕНАЛЬТИ",
		"ESTABA ADELANTADO": "БЫЛ ОФСАЙД",
		"LA CHILENA": "УДАР ЧЕРЕЗ СЕБЯ",
		"LA GRADA APLAUDE": "ТРИБУНЫ АПЛОДИРУЮТ",
		"Cara de Piedra": "Каменное лицо",
	},


	"mando_f2": {
		"IZQUIERDA · AJUSTA EL STICK": "СЛЕВА · НАСТРОЙ СТИК",
		"DERECHA · AJUSTA EL STICK": "СПРАВА · НАСТРОЙ СТИК",
		"mandoCRUZ": "КРЕСТИК",
		"mandoCÍRCULO": "КРУЖОК",
		"mandoCUADRADO": "КВАДРАТ",
		"mandoTRIÁNGULO": "ТРЕУГОЛЬНИК",
		"Stick izquierdo para moverte · llega al balón y remata": "Левый стик — двигаться · добеги до мяча и бей",
		"Con mando se juega en horizontal: {0} > {1} > {2}": "С геймпадом игра идет горизонтально: {0} > {1} > {2}",
		"MANTÉN {0} Y SUELTA": "ЗАЖМИ {0} И ОТПУСТИ",
		"Apunta con el stick y mantén {0}. Más carga, más fuerte.": "Целься стиком и держи {0}. Чем дольше заряд, тем сильнее удар.",
		"PULSA {0} PARA CONTINUAR": "НАЖМИ {0}: ПРОДОЛЖИТЬ",
		"PULSA {0} PARA JUGAR": "НАЖМИ {0}: ИГРАТЬ",
		"El coche acelera solo. Gira con el stick y frena con {0}.": "Машина разгоняется сама. Рули стиком, тормози кнопкой {0}.",
		"Pulsa {0} para saltar": "Нажми {0}, чтобы пропустить",
		"CENTRO · apunta y pulsa {0}": "НАВЕС · целься и жми {0}",
		"Apunta con el stick · pulsa {0}": "Целься стиком · жми {0}",
		"Pulsa {0} para continuar": "Нажми {0}, чтобы продолжить",
		"Mueve un stick para seguir": "Двинь стик, чтобы продолжить",
		"PULSA {0} PARA EMPEZAR": "НАЖМИ {0}: НАЧАТЬ",
		"CABEZAZO · jala el stick derecho y suelta": "УДАР ГОЛОВОЙ · оттяни правый стик и отпусти",
		"Empuja el stick izquierdo y corres hacia donde lo empujas. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Толкни левый стик — и бежишь туда, куда толкаешь. Отпусти — и встаешь как вкопанный. Доведи мяч до красного круга: наступишь на него — он гаснет и загорается следующий, всегда на другой стороне. Вести мяч — значит выбирать направление, а не бежать напролом.",
		"Dos sticks: el izquierdo conduce y el derecho tira. Jala el derecho hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltarlo, apunta al balón con el izquierdo y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "Два стика: левый ведет мяч, правый бьет. Оттяни правый назад, как рогатку: указатель смотрит вперед. Отпустив, наведи левым на мяч и нажми {0} — и все решает, куда ты попадешь по мячу. В первый раз мяч раскрашен по зонам: сверху — низом и медленно, снизу — взлетает и падает, сбоку — с закруткой. И чем ближе к краю, тем слабее удар: пушка — по центру.",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: {2} gira la vista a la banda y te enseña a los compañeros; otra vez y vuelve.": "Кнопки паса нет: пас — это УДАР в сторону партнера, и мяч достается тому, кто успеет первым. Партнеров двое: один за пределами штрафной, другой в ней. Если пас приходится за пределы штрафной, ты переключаешься на того, кто его принял. Если в штрафную — обработки не будет: он бьет с ходу. А чтобы их увидеть: {2} поворачивает камеру к бровке и показывает партнеров; нажми еще раз — и она вернется.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con el stick izquierdo y tira con el derecho cuando lo veas.": "Соперники наседают, а впереди все поле: веди мяч и ПРОРЫВАЙСЯ на чужую половину — до светящейся линии не бьют, а обводят, и на каждом новом отрезке навстречу выходят новые игроки. Потом — один на один: веди левым стиком и бей правым, когда увидишь момент.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el botón TIRO/CENTRO de la pantalla. Para cambiar entre CENTRO (colgado) y TIRO (raso), pulsa {1} mientras apuntas. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "Это НАВЕСЫ: мяч подается в штрафную. Угловой сразу начинается с НАВЕСА — об этом говорит кнопка УДАР/НАВЕС на экране. Чтобы переключаться между НАВЕСОМ (верхом) и УДАРОМ (низом), нажимай {1}, пока целишься. Ищи голову партнера, а не ворота. А в конце — перевод на другой фланг: та же подача, но на свободного партнера на дальнем краю.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con el stick izquierdo, pásala con el derecho a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "Ты начинаешь на своей половине с мячом, а ворота далеко. Веди мяч левым стиком, отдай пас партнеру правым и беги дальше: пас бьется как удар, и ты играешь за того, кто его принял. Застрянешь сзади — соперник начнет прессинговать. Потом — один на один: бей, когда увидишь момент.",
		"Con {1} cambias entre CENTRO y TIRO.": "{1} переключает НАВЕС и УДАР.",
		"Apunta al área y aguanta el stick.": "Целься в штрафную и держи стик.",
		"Sueltas, apuntas y pulsas {0}.": "Отпускаешь, целишься и жмешь {0}.",
		"Stick izquierdo para conducir; jala el derecho y suelta para tirar": "Левый стик — вести мяч; оттяни правый и отпусти — удар",
		"Stick izquierdo para conducir; no se tira": "Левый стик — вести мяч; бить нельзя",
		"Stick izquierdo para conducir; apunta con el derecho a un compañero y suelta": "Левый стик — вести мяч; наведи правый на партнера и отпусти",
		"Mientras apuntas, {0} elige compañero y {1} cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.": "Пока целишься, {0} выбирает партнера, а {1} меняет его задачу. Голубой бежит к воротам, янтарный стоит на месте, пурпурный уводит за собой опекуна.",
		"STICK DERECHO: CÁMARA · {0}/{1}: BUSCAR · {2}/{3}: RITMO": "ПРАВЫЙ СТИК: КАМЕРА · {0}/{1}: ПОИСК · {2}/{3}: ТЕМП",
		"LB ALTERNA": "LB — СМЕНА",
		"¿SALIR DEL JUEGO?": "ВЫЙТИ ИЗ ИГРЫ?",
		"MUEVE EL STICK PARA GIRAR": "ПОВОРАЧИВАЙ СТИКОМ",
		"PULSA {0} PARA OTRA": "НАЖМИ {0}: ЕЩЕ РАЗ",
		"Mueve la pala con el stick. {0} para sacar.": "Двигай ракетку стиком. {0} — подача.",
		"Pulsa {0} para firmar": "Нажми {0}, чтобы подписать",
		"Gira el campo con el stick derecho. Los esquemas son de consulta.": "Поворачивай поле правым стиком. Схемы — только для просмотра.",
		"Apunta con WASD · pulsa {0}": "Целься клавишами WASD · жми {0}",
		"WASD para moverte · llega al balón y remata": "WASD — двигаться · добеги до мяча и бей",
		"Pulsa WASD o una flecha para seguir": "Нажми WASD или стрелку, чтобы продолжить",
		"CABEZAZO · mantén una flecha y suelta": "УДАР ГОЛОВОЙ · зажми стрелку и отпусти",
		"HAZ CLIC PARA CONTINUAR": "КЛИКНИ: ПРОДОЛЖИТЬ",
		"HAZ CLIC EN EL ARO": "КЛИКНИ ПО КОЛЬЦУ",
		"¡ARRASTRA HACIA ÉL!": "ТЯНИ К НЕМУ!",
		"Arrastra para girar el campo. Los esquemas son de consulta.": "Тяни, чтобы повернуть поле. Схемы — только для просмотра.",
		"El coche acelera solo. Gira con las flechas y frena con la de abajo.": "Машина разгоняется сама. Рули стрелками, тормози стрелкой вниз.",
		"Arrastra el balón hacia la canasta. Más rápido, más fuerte.": "Тяни мяч к корзине. Чем быстрее, тем сильнее.",
		"ARRASTRA HACIA LA CANASTA": "ТЯНИ К КОРЗИНЕ",
		"HAZ CLIC PARA OTRA": "КЛИКНИ: ЕЩЕ РАЗ",
		"USA LAS FLECHAS PARA GIRAR": "ПОВОРАЧИВАЙ СТРЕЛКАМИ",
		"Arrastra hacia el aro y suelta.": "Тяни к кольцу и отпусти.",
		"Mantén una flecha y suelta para tirar": "Зажми стрелку и отпусти — удар",
		"Mantén una flecha y suelta para centrar": "Зажми стрелку и отпусти — навес",
		"teclaESPACIO": "ПРОБЕЛ",
		"teclaMAYÚS": "SHIFT",
		"Con WASD corres hacia donde pulsas. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "С WASD ты бежишь туда, куда жмешь. Отпусти — и встаешь как вкопанный. Доведи мяч до красного круга: наступишь на него — он гаснет и загорается следующий, всегда на другой стороне. Вести мяч — значит выбирать направление, а не бежать напролом.",
		"WASD conduce y las flechas tiran. Mantén una flecha, como una resortera: la guía apunta al lado contrario. Al soltarla, apunta al balón con WASD y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "WASD ведет мяч, стрелки бьют. Зажми стрелку, как рогатку: указатель смотрит в обратную сторону. Отпустив, наведи на мяч клавишами WASD и нажми {0} — и все решает, куда ты попадешь по мячу. В первый раз мяч раскрашен по зонам: сверху — низом и медленно, снизу — взлетает и падает, сбоку — с закруткой. И чем ближе к краю, тем слабее удар: пушка — по центру.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con WASD y tira con las flechas cuando lo veas.": "Соперники наседают, а впереди все поле: веди мяч и ПРОРЫВАЙСЯ на чужую половину — до светящейся линии не бьют, а обводят, и на каждом новом отрезке навстречу выходят новые игроки. Потом — один на один: веди клавишами WASD и бей стрелками, когда увидишь момент.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con WASD, pásala con las flechas a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "Ты начинаешь на своей половине с мячом, а ворота далеко. Веди мяч клавишами WASD, отдай пас партнеру стрелками и беги дальше: пас бьется как удар, и ты играешь за того, кто его принял. Застрянешь сзади — соперник начнет прессинговать. Потом — один на один: бей, когда увидишь момент.",
		"Sueltas, apuntas con WASD y pulsas {0}.": "Отпускаешь, целишься клавишами WASD и жмешь {0}.",
		"Apunta al área y aguanta la flecha.": "Целься в штрафную и держи стрелку.",
		"WASD para conducir; mantén una flecha y suelta para tirar": "WASD — вести мяч; зажми стрелку и отпусти — удар",
		"WASD para conducir; no se tira": "WASD — вести мяч; бить нельзя",
		"WASD para conducir; mantén una flecha hacia un compañero y suelta": "WASD — вести мяч; зажми стрелку в сторону партнера и отпусти",
		"PULSA LAS TECLAS O HAZ CLIC": "НАЖИМАЙ КЛАВИШИ ИЛИ КЛИКАЙ",
		"LA PARTIDA ESTÁ GUARDADA": "ИГРА СОХРАНЕНА",
		"SE PIERDE PARA SIEMPRE": "ПРОПАДЕТ НАВСЕГДА",
		"NO HAY VUELTA ATRÁS": "ПУТИ НАЗАД НЕТ",
		"SALIR DEL PARTIDO": "ВЫЙТИ ИЗ МАТЧА",
		"¿SALIR DEL PARTIDO?": "ВЫЙТИ ИЗ МАТЧА?",
		"¿REINICIAR EL PARTIDO?": "НАЧАТЬ МАТЧ ЗАНОВО?",
		"¿{0}?": "{0}?",
		"APUNTA Y TIRA": "ЦЕЛЬСЯ И БЕЙ",
		"GOLPEA": "БЕЙ",
		"TIRO O CENTRO": "УДАР/НАВЕС",
		"CANCELA": "ОТМЕНА",
		"ORDENA": "ПРИКАЗ",
		"COMPAÑERO U OBJETIVO": "ПАРТНЕР ИЛИ ЦЕЛЬ",
		"MANTIENE": "ДЕРЖАТЬ",
		"CÁMARA": "КАМЕРА",
		"SE PIERDE LO JUGADO": "ПРОГРЕСС ПРОПАДЕТ",
		"EL PARTIDO QUEDA POR JUGAR": "МАТЧ ОСТАНЕТСЯ НЕСЫГРАННЫМ",
		"VUELVES AL 0' CON LA MISMA ENERGÍA": "НАЧНЕШЬ С 0' С ТОЙ ЖЕ ЭНЕРГИЕЙ",
		"SE PIERDEN LAS ESTRELLAS": "ЗВЕЗДЫ ПРОПАДУТ",
		"MUEVE": "БЕГ",
		"A/B NINTENDO": "A/B NINTENDO",
		"CORRE Y TIRA": "БЕГИ И БЕЙ",
		"Mantén {0} para correr · cruza al campo rival": "Держи {0}, чтобы бежать · перейди на половину соперника",
		"Mantén {0} para correr · lleva el balón a la zona roja": "Держи {0}, чтобы бежать · доведи мяч до красной зоны",
		"Empuja el stick izquierdo y vas al paso hacia donde lo empujas; mantén {3} y corres. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Толкни левый стик — и идешь шагом туда, куда толкаешь; удерживай {3} — и бежишь. Отпусти — и встаешь как вкопанный. Доведи мяч до красного круга: наступишь на него — он гаснет и загорается следующий, всегда на другой стороне. Вести мяч — значит выбирать направление, а не бежать напролом.",
		"Con WASD vas al paso hacia donde pulsas; mantén {3} y corres. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "С WASD ты идешь шагом туда, куда жмешь; удерживай {3} — и бежишь. Отпусти — и встаешь как вкопанный. Доведи мяч до красного круга: наступишь на него — он гаснет и загорается следующий, всегда на другой стороне. Вести мяч — значит выбирать направление, а не бежать напролом.",
		"Empuja este stick hacia el disco; con {3}, corres.": "Толкни этот стик к кругу; с {3} бежишь.",
		"Pulsa WASD y vas al disco; con {3}, corres.": "Нажми WASD — и идешь к кругу; с {3} бежишь.",
		"CANCELA O PAUSA": "ОТМЕНА, ПАУЗА",
		"CORRE": "БЕГИ",
	},


	"previa_pases": {
		"MÁXIMO GOLEADOR": "БОМБАРДИР",
		"MÁXIMO ASISTENTE": "ЛУЧШИЙ АССИСТЕНТ",
		"{0} EN GOLEO": "{0} ПО ГОЛАМ",
	},

	"amigos": {
		"AMIGOS": "ДРУЗЬЯ",
		"TABLA": "ТАБЛИЦА",
		"TU CÓDIGO": "ТВОЙ КОД",
		"INVITAR": "ПОЗВАТЬ",
		"TÍTULOS": "ТИТУЛЫ",
		"{0} AÑOS · TEMPORADA {1}": "ВОЗРАСТ {0} · СЕЗОН {1}",
		"HACE {0} D": "{0} Д. НАЗАД",
		"Vista previa: amigos de ejemplo": "Предпросмотр: друзья для примера",
		"AGREGAR AMIGO": "ДОБАВИТЬ ДРУГА",
		"AGREGAR": "ДОБАВИТЬ",
		"CÓDIGO NO ENCONTRADO": "КОД НЕ НАЙДЕН",
		"ES TU CÓDIGO": "ЭТО ТВОЙ КОД",
		"SIN CONEXIÓN": "НЕТ СВЯЗИ",
		"Amigo agregado.": "Друг добавлен.",
		"Juega Football Legacy conmigo: {0} · código {1}": "Играй со мной в Football Legacy: {0} · код {1}",
		"Invitación copiada.": "Приглашение скопировано.",
		"¿SALIR DE LA LIGA?": "ВЫЙТИ ИЗ ЛИГИ?",
		"Si vuelves, empiezas de 0.": "Если вернешься, начнешь с 0.",
		"No podrás volver.": "Вернуться не получится.",
		"Empieza una carrera para compararte.": "Начни карьеру, чтобы сравнить себя с другими.",
		"{0} fichó por {1}": "{0} перешел в {1}",
		"{0} ganó la liga": "{0} выиграл лигу",
		"{0} se lesionó: {1} semanas": "{0} травмирован: {1} нед.",
		"{0} subió a {1} de media": "{0}: рейтинг вырос до {1}",
		"{0} llegó a {1} goles": "{0} довел счет голов до {1}",
		"{0} ganó el premio al Jugador del Año": "{0} получил приз «Игрок года»",
		"VER CASA": "В ГОСТИ",
		"CASA DE {0}": "ДОМ: {0}",
		"AÚN NO HAY CASA": "ДОМА ПОКА НЕТ",
		"TU CALLE": "ТВОЯ УЛИЦА",
		"VECINOS": "СОСЕДИ",
		"apodoCAÑÓN": "КАНОНИР",
		"apodoRAYO": "МЕТЕОР",
		"apodoCOHETE": "СНАРЯД",
		"apodoTANQUE": "ТАНК",
		"apodoMURO": "ЗАСЛОН",
		"apodoTORNADO": "ВИХРЬ",
		"apodoTITÁN": "ТИТАН",
		"apodoLEÓN": "ЛЕВ",
		"apodoTIBURÓN": "ХИЩНИК",
		"apodoHALCÓN": "СОКОЛ",
		"apodoLOBO": "ВОЛК",
		"apodoTORO": "БЫК",
		"apodoMAGO": "МАГ",
		"apodoCÓNDOR": "КОНДОР",
		"apodoTRUENO": "ГРОМ",
		"apodoVOLCÁN": "ВУЛКАН",
		"apodoDE ORO": "ЗОЛОТОЙ",
		"apodoDE ACERO": "СТАЛЬНОЙ",
		"apodoDE FUEGO": "ОГНЕННЫЙ",
		"apodoDE HIELO": "ЛЕДЯНОЙ",
		"apodoDEL SUR": "ЮЖНЫЙ",
		"apodoDEL NORTE": "СЕВЕРНЫЙ",
		"apodoDEL BARRIO": "ДВОРОВЫЙ",
		"apodoDEL ÁREA": "ГОЛЕВОЙ",
		"apodoDE PLATA": "СЕРЕБРЯНЫЙ",
		"apodoDE LEYENDA": "ЛЕГЕНДАРНЫЙ",
		"apodoIMPARABLE": "НЕУДЕРЖИМЫЙ",
		"apodoVELOZ": "БЫСТРЫЙ",
		"apodoLETAL": "ГРОЗНЫЙ",
		"apodoSALVAJE": "ДИКИЙ",
		"apodoSIN FRENO": "НЕИСТОВЫЙ",
		"apodoDE MEDIANOCHE": "ПОЛУНОЧНЫЙ",
		"apodo{0} {1} {2}": "{1} {0} {2}",
		"ELIGE TU NOMBRE": "ВЫБЕРИ ИМЯ",
		"ESCRIBE TU NOMBRE": "ВВЕДИ ИМЯ",
		"Lo ven todos. Un nombre ofensivo se puede denunciar.": "Его видят все. На оскорбительное имя можно пожаловаться.",
		"MÁXIMO 16 LETRAS": "МАКСИМУМ 16 БУКВ",
		"SÓLO LETRAS Y NÚMEROS": "ТОЛЬКО ЛАТИНИЦА И ЦИФРЫ",
		"MÍNIMO 2 LETRAS": "МИНИМУМ 2 БУКВЫ",
		"ESE NOMBRE NO SE PUEDE USAR": "ЭТО ИМЯ НЕЛЬЗЯ ИСПОЛЬЗОВАТЬ",
		"OCULTAR SU NOMBRE": "СКРЫТЬ ИМЯ",
		"MOSTRAR SU NOMBRE": "ПОКАЗАТЬ ИМЯ",
		"DENUNCIAR": "ЖАЛОБА",
		"AMIGOS crea un perfil anónimo y sube tu carrera y tu apodo para rankings y retos.": "Раздел ДРУЗЬЯ создает анонимный профиль и выгружает твою карьеру и прозвище для рейтингов и дуэлей.",
		"Tolerancia cero con apodos ofensivos o abusivos.": "Нулевая терпимость к оскорбительным и грубым прозвищам.",
		"AHORA NO": "НЕ СЕЙЧАС",
		"BORRAR MI CUENTA": "УДАЛИТЬ АККАУНТ",
		"¿BORRAR TU CUENTA?": "УДАЛИТЬ АККАУНТ?",
		"Se borran del servidor tu perfil, amigos, retos, ligas, ranking y casa. Tu carrera en este dispositivo no se toca.": "С сервера удаляются твой профиль, друзья, дуэли, лиги, рейтинг и дом. Карьера на этом устройстве не пострадает.",
		"Cuenta borrada.": "Аккаунт удален.",
		"No se pudo borrar. Revisa tu conexión e inténtalo luego.": "Не удалось удалить. Проверь соединение и попробуй позже.",
		"QUITAR AMIGO": "УБРАТЬ ДРУГА",
		"¿QUITAR AMIGO?": "УБРАТЬ ДРУГА?",
		"¿DENUNCIAR?": "ПОЖАЛОВАТЬСЯ?",
		"Deja de ser tu amigo y se oculta su nombre.": "Он больше не твой друг, и его имя скрыто.",
		"Deja de ser tu amigo.": "Он больше не твой друг.",
		"Queda bloqueado: no vuelve a aparecer en AMIGOS.": "Он заблокирован: больше не появится в разделе ДРУЗЬЯ.",
		"BLOQUEAR": "БЛОКИРОВКА",
		"Al aceptar, aceptas estas normas: tolerancia cero con el contenido ofensivo y con los usuarios abusivos. Lo denunciado se oculta y la cuenta se expulsa.": "Принимая, ты соглашаешься с правилами: нулевая терпимость к оскорбительному контенту и грубым пользователям. Все, на что пожаловались, скрывается, а аккаунт удаляется.",
		"cocheSUBIR": "СЕСТЬ",
		"BAJAR": "ВЫЙТИ",
		"FRENO": "ТОРМОЗ",
		"KM/H": "КМ/Ч",
		"R": "R",
		"ACELERA": "ГАЗ",
	},


	"amigos_retos": {
		"RETOS": "ДУЭЛИ",
		"RETO": "ДУЭЛЬ",
		"RETAR": "ВЫЗВАТЬ",
		"RETAR A UN AMIGO": "ВЫЗВАТЬ ДРУГА",
		"JUGADAS": "УДАРЫ",
		"{0} JUGADAS": "УДАРОВ: {0}",
		"{0} · {1} JUGADAS": "{0} · УДАРОВ: {1}",
		"TE TOCA": "ТВОЙ ХОД",
		"ESPERANDO": "ОЖИДАНИЕ",
		"ENVIANDO": "ОТПРАВКА",
		"CADUCADO": "ИСТЕК",
		"QUEDAN {0} H": "ЕЩЕ {0} Ч",
		"QUEDAN {0} D": "ЕЩЕ {0} Д.",
		"Sin conexión: lo último guardado": "Нет связи: последнее сохраненное",
		"+{0} ★ por amigo que juegue 10 partidos": "+{0} ★ за каждого друга, сыгравшего 10 матчей",
		"+{0} ★ por invitar amigos": "+{0} ★ за приглашение друзей",
		"Aún no hay novedades de tus amigos.": "От друзей пока нет новостей.",
		"Reta a un amigo: mismas jugadas para los dos, gana quien marque más.": "Вызови друга: одинаковые удары для обоих, побеждает тот, кто забьет больше.",
		"Agrega un amigo para retarlo.": "Добавь друга, чтобы вызвать его на дуэль.",
		"Reto enviado.": "Вызов отправлен.",
		"Sólo vale el primer intento. Si sales, cuenta lo que lleves.": "Засчитывается только первая попытка. Если выйдешь, засчитается то, что успел.",
		"Marca guardada. El resultado sale cuando juegue tu amigo.": "Результат сохранен. Итог появится, когда сыграет твой друг.",
		"SALIR DEL RANKING": "ВЫЙТИ ИЗ РЕЙТИНГА",
		"ENTRAR EN EL RANKING": "ВОЙТИ В РЕЙТИНГ",
		"DEMASIADOS RETOS HOY": "СЛИШКОМ МНОГО ДУЭЛЕЙ",

		"EN GRUPO": "ГРУППОЙ",
		"RETO EN GRUPO": "ГРУППОВОЙ ВЫЗОВ",
		"ELIGE AL MENOS 2 AMIGOS": "НУЖНО ХОТЯ БЫ ДВА ДРУГА",
		"PUESTO {0} DE {1}": "МЕСТО {0} ИЗ {1}",
		"Las marcas de los demás se ven al terminar la tuya.": "Результаты остальных видны, когда закончишь свой.",
		"Agrega al menos dos amigos para un reto en grupo.": "Добавь хотя бы двух друзей для группового вызова.",
		"Marca guardada. El resultado sale cuando jueguen todos.": "Результат сохранен. Итог появится, когда сыграют все.",
		"YA NO ES TU AMIGO": "БОЛЬШЕ НЕ ДРУГ",
		"YA LO JUGASTE": "УЖЕ СЫГРАНО",
		"RETO CADUCADO": "ДУЭЛЬ ИСТЕКЛА",
		"{0} ganó un título": "{0} выиграл титул",
		"{0} ganó un premio individual": "{0} получил индивидуальную награду",
		"{0} colgó las botas": "{0} повесил бутсы на гвоздь",
		"Guante Lanzado": "Перчатка брошена",
		"Jugar tu primer reto contra un amigo.": "Сыграть первую дуэль с другом.",
		"El Pique": "Есть чем хвастаться",
		"Ganar un reto a un amigo.": "Выиграть дуэль у друга.",
		"Rey del Barrio": "Король района",
		"Ganar 10 retos a tus amigos.": "Выиграть 10 дуэлей у друзей.",
		"Pleno": "Без промаха",
		"Marcar todas en un reto de 10 o 15 jugadas.": "Забить все удары в дуэли на 10 или 15 ударов.",
		"Padrino": "Наставник",
		"Que un amigo que invitaste juegue 10 partidos.": "Пригласить друга, который сыграет 10 матчей.",
		"Cazatalentos": "Охотник за талантами",
		"Que 5 amigos que invitaste jueguen 10 partidos.": "Пригласить 5 друзей, которые сыграют по 10 матчей.",
	},

	"amigos_carreras": {
		"{0} CARRERAS": "КАРЬЕР: {0}",
		"SU JUGADOR": "ЕГО ИГРОК",
		"JUEGAS CON": "ИГРАЕШЬ ЗА",
	},


	"logros_hito": {
		"Oro Precoz": "Раннее золото",
		"Ganar el Balón de Oro antes de cumplir 19 años.": "Получить приз «Игрок года» до 19 лет.",
		"Triplete": "Требл",
		"Liga, copa y tu gran copa continental en la misma temporada.": "Лига, кубок и главный континентальный кубок в одном сезоне.",
		"Último Baile": "Последний танец",
		"Levantar un título en tu temporada de retiro.": "Выиграть титул в сезоне завершения карьеры.",
		"De la Nada": "Из ниоткуда",
		"Debutar en Tercera y ganar la liga de Primera en la misma carrera.": "Дебютировать в третьей лиге и выиграть высшую лигу в одной карьере.",
		"Álbum de un Continente": "Альбом континента",
		"Completar en la VITRINA todas las ligas y copas de una confederación.": "Собрать в разделе ТРОФЕИ все лиги и кубки одной конфедерации.",
		"La Vitrina Completa": "Полная витрина",
		"Completar el álbum de la VITRINA al 100 %.": "Заполнить альбом в разделе ТРОФЕИ на 100 %.",
		"Sextete": "Секстет",
		"Seis títulos con tu club en doce meses.": "Шесть титулов с клубом за двенадцать месяцев.",
		"Desde la Primera Ronda": "С первого раунда",
		"Ganar una copa de Europa entrando por la primera ronda previa.": "Выиграть еврокубок, начав с первого квалификационного раунда.",
	},


	"vitrina_album": {
		"NACIONAL": "ВНУТРЕННИЕ",
		"Ganado {0} veces.": "Побед: {0}.",
		"Trofeo por ganar. Sigue jugando tu carrera.": "Трофей еще не выигран. Продолжай карьеру.",
	},






	"grada_tifos": {
		"EL TIFO DEL DERBI": "ТИФО НА ДЕРБИ",
		"La peña está pintando las cartulinas para el derbi contra {0} y te pregunta si pones el dinero. Si lo pones, el domingo la curva levanta tu número.": "Фан-клуб готовит карточки для перформанса к дерби против {0} и спрашивает, дашь ли ты денег. Если дашь, в воскресенье фанатский сектор поднимет твой номер.",
		"PAGAR EL TIFO": "ОПЛАТИТЬ ТИФО",
		"QUE SAQUEN SU ESCUDO": "ПУСТЬ БУДЕТ ЭМБЛЕМА",
		"Premio de la Afición": "Приз болельщиков",
		"EL ESTADIO, EN PIE: APLAUDEN TU DORSAL": "СТАДИОН СТОЯ АПЛОДИРУЕТ ТВОЕМУ НОМЕРУ",
		"TU EX GRADA, EN PIE: APLAUDEN TU DORSAL": "ТВОЯ БЫВШАЯ ТРИБУНА АПЛОДИРУЕТ СТОЯ",
		"PAÑUELOS BLANCOS EN LA GRADA: VAN POR TI": "БЕЛЫЕ ПЛАТКИ НА ТРИБУНАХ: ЭТО ТЕБЕ",
		"PAÑUELOS BLANCOS CONTRA EL PALCO": "БЕЛЫЕ ПЛАТКИ ПРОТИВ РУКОВОДСТВА",
		"PAÑOLADA": "ПЛАТКИ",
		"OS VAIS A VUESTRA GRADA: OS APLAUDEN IGUAL": "К СВОИМ ФАНАТАМ: ВСЕ РАВНО АПЛОДИРУЮТ",
		"OS VAIS A VUESTRA GRADA: PITOS Y PAÑUELOS": "К СВОИМ ФАНАТАМ: СВИСТ И ПЛАТКИ",
		"APLAUSOS": "ОВАЦИЯ",
		"PITOS": "СВИСТ",
		"REGALO": "ПОДАРОК",
		"{0} le da su camiseta a un niño de la grada": "{0} дарит свою футболку юному болельщику на трибуне",
		"Goleada ante el {0}: la grada del {1} aplaude igual": "Разгром от {0}, но фанаты клуба {1} все равно аплодируют",
		"Goleada ante el {0}: pitos y pañuelos para el {1}": "Разгром от {0}: свист и платки для клуба {1}",
		"FIRMA TU CAMISETA": "ПОДПИШИ ФУТБОЛКУ",
		"Es para el niño del cartel": "Это для мальчика с плакатом",
		"Marcaste, y el niño del cartel se lleva tu camiseta.": "Ты забил, и мальчик с плакатом уносит домой твою футболку.",
		"TRIBUNA {0}": "ТРИБУНА {0}",
		"Es para tu hincha de siempre": "Это для твоего верного болельщика",
		"Tu hincha de siempre se lleva tu camiseta.": "Твой верный болельщик уносит домой твою футболку.",
		"Le negaste tu camiseta a tu hincha de siempre.": "Ты отказал в футболке своему верному болельщику.",
	},
	"ajustes_tumbado": {

		"ZURDO": "ЛЕВША",
		"TAMAÑO": "РАЗМЕР",
		"OPACIDAD": "ВИДИМОСТЬ",
		"CRT": "CRT",
		"ICONO": "ИКОНКА",
		"DATOS": "ДАННЫЕ",
		"TELÉFONO": "ТЕЛЕФОН",
		"CUMPLE": "ДАТА РОЖД.",
		"MOVIMIENTO": "ДВИЖЕНИЕ",
		"SACUDIDA": "ТРЯСКА",
		"MANDO": "ГЕЙМПАД",
		"CONECTAR": "ПОДКЛЮЧИТЬ",
		"CONECTADO": "ПОДКЛЮЧЕН",
		"ESPERANDO MANDO": "ЖДЕМ ГЕЙМПАД",
		"EN EL MANDO": "НА ГЕЙМПАДЕ",
		"EN EL TELÉFONO": "НА ТЕЛЕФОНЕ",
		"EN EL ORDENADOR": "НА КОМПЬЮТЕРЕ",
		"MANTÉN": "ЗАЖМИ",
		"HASTA QUE PARPADEE": "ПОКА НЕ ЗАМИГАЕТ",
		"EMPAREJAR": "СОПРЯЖЕНИЕ",
		"SINCRONIZAR": "СИНХРОНИЗАЦИЯ",
		"TOCA EL MANDO": "НАЖМИ КНОПКУ",
		"VINCULAR": "ПРИВЯЗАТЬ",
		"PRIVACIDAD": "ПРИВАТНОСТЬ",
		"LICENCIAS": "ЛИЦЕНЗИИ",
		"Licencia: {0}": "Лицензия: {0}",
	},






	"copas_america": {
		"COPA GLORIA": "КУБОК СЛАВЫ",
		"Copa Gloria": "Кубок Славы",
		"LIBERTADORES": "КУБОК СЛАВЫ",
		"COPA DEL SUR": "ЮЖНЫЙ КУБОК",
		"Copa del Sur": "Южный кубок",
		"SUDAMERICANA": "ЮЖНЫЙ КУБОК",
		"COPA DEL NORTE": "СЕВЕРНЫЙ КУБОК",
		"Copa del Norte": "Северный кубок",
		"CONCACAF CHAMPIONS CUP": "СЕВЕРНЫЙ КУБОК",
		"MEJOR DE LA COPA GLORIA": "ЛУЧШИЙ В КУБКЕ СЛАВЫ",
		"MEJOR DE LA COPA DEL SUR": "ЛУЧШИЙ В ЮЖНОМ КУБКЕ",
		"MEJOR DE LA COPA DEL NORTE": "ЛУЧШИЙ В СЕВЕРНОМ КУБКЕ",
		"Todo un continente soñando con esta copa. Y la levantas tú.":
			"Весь континент мечтает об этом кубке. И поднимаешь его ты.",
		"La otra copa de América. Se suda igual y se levanta igual.":
			"Второй кубок Америки. Пота столько же, радости — тоже.",
		"El norte del continente entero, a tus pies.":
			"Весь север континента — у твоих ног.",
		"El mejor de América en la copa que todo el continente mira.":
			"Лучший в Америке — в кубке, за которым следит весь континент.",
		"El mejor de la otra copa de América. Nadie la jugó como tú.":
			"Лучший во втором кубке Америки. Никто не сыграл в нем так, как ты.",
		"El mejor del norte del continente. Las noches de copa fueron tuyas.":
			"Лучший на севере континента. Кубковые вечера были твоими.",
		"Previa": "Квалификация",
		"PREVIA": "КВАЛИФИКАЦИЯ",
		"Preliminar": "Отборочный раунд",
		"PRELIMINAR": "ОТБОРОЧНЫЙ",
		"Campeón de Libertadores": "Обладатель Кубка Славы",
		"Campeón de Copa Gloria": "Обладатель Кубка Славы",
		"Campeón de Sudamericana": "Обладатель Южного кубка",
		"Campeón de Copa del Sur": "Обладатель Южного кубка",
		"Campeón de Concacaf": "Обладатель Северного кубка",
		"Campeón de Copa del Norte": "Обладатель Северного кубка",
		"Bota de la Libertadores": "Лучший бомбардир Кубка Славы",
		"Bota de la Copa Gloria": "Лучший бомбардир Кубка Славы",
		"Bota de la Sudamericana": "Лучший бомбардир Южного кубка",
		"Bota de la Copa del Sur": "Лучший бомбардир Южного кубка",
		"Bota de la Concacaf": "Лучший бомбардир Северного кубка",
		"Bota de la Copa del Norte": "Лучший бомбардир Северного кубка",
		"Máximo Asistente de la Libertadores": "Лучший ассистент Кубка Славы",
		"Máximo Asistente de la Copa Gloria": "Лучший ассистент Кубка Славы",
		"Máximo Asistente de la Sudamericana": "Лучший ассистент Южного кубка",
		"Máximo Asistente de la Copa del Sur": "Лучший ассистент Южного кубка",
		"Máximo Asistente de la Concacaf": "Лучший ассистент Северного кубка",
		"Máximo Asistente de la Copa del Norte": "Лучший ассистент Северного кубка",
		"Mejor de la Libertadores": "Лучший игрок Кубка Славы",
		"Mejor de la Copa Gloria": "Лучший игрок Кубка Славы",
		"Mejor de la Sudamericana": "Лучший игрок Южного кубка",
		"Mejor de la Copa del Sur": "Лучший игрок Южного кубка",
		"Mejor de la Concacaf": "Лучший игрок Северного кубка",
		"Mejor de la Copa del Norte": "Лучший игрок Северного кубка",
		"¡Campeón de Copa Gloria!": "Обладатели Кубка Славы!",
		"¡Campeón de Copa del Sur!": "Обладатели Южного кубка!",
		"¡Campeón de Copa del Norte!": "Обладатели Северного кубка!",
		"¡CAMPEÓN DE COPA GLORIA!": "ОБЛАДАТЕЛИ КУБКА СЛАВЫ!",
		"¡CAMPEÓN DE COPA DEL SUR!": "ОБЛАДАТЕЛИ ЮЖНОГО КУБКА!",
		"¡CAMPEÓN DE COPA DEL NORTE!": "ОБЛАДАТЕЛИ СЕВЕРНОГО КУБКА!",
		"Clasificado a Copa Gloria": "Путевка в Кубок Славы",
		"Clasificado a Copa del Sur": "Путевка в Южный кубок",
		"Clasificado a Copa del Norte": "Путевка в Северный кубок",
		"Fase final de Copa Gloria": "Плей-офф Кубка Славы",
		"Fase final de Copa del Sur": "Плей-офф Южного кубка",
		"Fase final de Copa del Norte": "Плей-офф Северного кубка",
		"Mejor (Copa Gloria)": "Лучший (Кубок Славы)",
		"Mejor (Copa del Sur)": "Лучший (Южный кубок)",
		"Mejor (Copa del Norte)": "Лучший (Северный кубок)",
		"Bota (Copa Gloria)": "Бомбардир (Кубок Славы)",
		"Bota (Copa del Sur)": "Бомбардир (Южный кубок)",
		"Bota (Copa del Norte)": "Бомбардир (Северный кубок)",
		"Asist. (Copa Gloria)": "Ассист. (Кубок Славы)",
		"Asist. (Copa del Sur)": "Ассист. (Южный кубок)",
		"Asist. (Copa del Norte)": "Ассист. (Северный кубок)",
		"Gloria Eterna": "Вечная слава",
		"Rey del Sur": "Король Юга",
		"Rey del Norte": "Король Севера",
		"Amo de América": "Хозяин Америки",
		"Dos Mundos": "Два мира",
		"Cerebro de la Libertadores": "Плеймейкер Кубка Славы",
		"Cerebro de la Copa Gloria": "Плеймейкер Кубка Славы",
		"Cerebro de la Sudamericana": "Плеймейкер Южного кубка",
		"Cerebro de la Copa del Sur": "Плеймейкер Южного кубка",
		"Cerebro de la Concacaf": "Плеймейкер Северного кубка",
		"Cerebro de la Copa del Norte": "Плеймейкер Северного кубка",
		"Ganar la Libertadores.": "Выиграть Кубок Славы.",
		"Ganar la Copa Gloria.": "Выиграть Кубок Славы.",
		"Ganar la Sudamericana.": "Выиграть Южный кубок.",
		"Ganar la Copa del Sur.": "Выиграть Южный кубок.",
		"Ganar la Concacaf Champions Cup.": "Выиграть Северный кубок.",
		"Ganar la Copa del Norte.": "Выиграть Северный кубок.",
		"Ser el máximo goleador de la Libertadores.": "Стать лучшим бомбардиром Кубка Славы.",
		"Ser el máximo goleador de la Copa Gloria.": "Стать лучшим бомбардиром Кубка Славы.",
		"Ser el máximo goleador de la Sudamericana.": "Стать лучшим бомбардиром Южного кубка.",
		"Ser el máximo goleador de la Copa del Sur.": "Стать лучшим бомбардиром Южного кубка.",
		"Ser el máximo goleador de la Concacaf Champions Cup.": "Стать лучшим бомбардиром Северного кубка.",
		"Ser el máximo goleador de la Copa del Norte.": "Стать лучшим бомбардиром Северного кубка.",
		"Máximo asistente de la Libertadores.": "Лучший ассистент Кубка Славы.",
		"Máximo asistente de la Copa Gloria.": "Лучший ассистент Кубка Славы.",
		"Máximo asistente de la Sudamericana.": "Лучший ассистент Южного кубка.",
		"Máximo asistente de la Copa del Sur.": "Лучший ассистент Южного кубка.",
		"Máximo asistente de la Concacaf Champions Cup.": "Лучший ассистент Северного кубка.",
		"Máximo asistente de la Copa del Norte.": "Лучший ассистент Северного кубка.",
		"Ganar la Libertadores con 3 clubes distintos.": "Выиграть Кубок Славы с 3 разными клубами.",
		"Ganar la Copa Gloria con 3 clubes distintos.": "Выиграть Кубок Славы с 3 разными клубами.",
		"Ganar la Champions y también la Libertadores o la Concacaf Champions Cup.": "Выиграть Кубок элиты, а также Кубок Славы или Северный кубок.",
		"Ganar la Copa de Campeones y también la Copa Gloria o la Copa del Norte.": "Выиграть Кубок элиты, а также Кубок Славы или Северный кубок.",
		"Máximo goleador de tu liga Y de tu gran copa continental en la misma temporada.": "Лучший бомбардир своей лиги И главного континентального кубка в одном сезоне.",
		"Ganar los seis grandes: liga, copa, tu gran copa continental, Mundial de Clubes, continental y Mundial.": "Выиграть большую шестерку: лигу, кубок, главный континентальный кубок, клубный мундиаль, турнир континента и мундиаль.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de esa copa.": "В ВЫСШЕЙ ЛИГЕ и за один сезон: лига, кубок и главный континентальный кубок, плюс «Игрок года», MVP и звание бомбардира лиги, а также MVP и звание бомбардира этого кубка.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Jugador del Año, MVP y goleo de la liga, y MVP y bota de esa copa.": "В ВЫСШЕЙ ЛИГЕ и за один сезон: лига, кубок и главный континентальный кубок, плюс «Игрок года», MVP и звание бомбардира лиги, а также MVP и звание бомбардира этого кубка.",
		"TORNEOS CONTINENTALES": "КОНТИНЕНТАЛЬНЫЕ КУБКИ",
		"continentales": "континентальные кубки",
		"bota_libertadoresBota de la Libertadores": "Лучший бомбардир Кубка Славы",
		"bota_sudamericanaBota de la Sudamericana": "Лучший бомбардир Южного кубка",
		"bota_concacafBota de la Concacaf": "Лучший бомбардир Северного кубка",
		"max_asist_sudCerebro de la Sudamericana": "Плеймейкер Южного кубка",
		"nombre del logro max_asist_sudCerebro de la Sudamericana": "Плеймейкер Южного кубка",



		"tabGLORIA": "СЛАВА",
		"tabSUR": "ЮГ",
		"tabNORTE": "СЕВЕР",
		"GLO": "СЛВ",
		"SUR": "ЮГ",
		"NOR": "СЕВ",
	},


	"copas_asia": {
		"COPA DE ORIENTE": "ВОСТОЧНЫЙ КУБОК",
		"Copa de Oriente": "Восточный кубок",
		"MEJOR DE LA COPA DE ORIENTE": "ЛУЧШИЙ В ВОСТОЧНОМ КУБКЕ",
		"Campeón de Copa de Oriente": "Обладатель Восточного кубка",
		"Bota de la Copa de Oriente": "Лучший бомбардир Восточного кубка",
		"Máximo Asistente de la Copa de Oriente": "Лучший ассистент Восточного кубка",
		"Mejor de la Copa de Oriente": "Лучший игрок Восточного кубка",
		"¡Campeón de Copa de Oriente!": "Обладатели Восточного кубка!",
		"¡CAMPEÓN DE COPA DE ORIENTE!": "ОБЛАДАТЕЛИ ВОСТОЧНОГО КУБКА!",
		"Clasificado a Copa de Oriente": "Путевка в Восточный кубок",
		"Fase final de Copa de Oriente": "Плей-офф Восточного кубка",
		"Mejor (Copa de Oriente)": "Лучший (Восточный кубок)",
		"Bota (Copa de Oriente)": "Бомбардир (Восточный кубок)",
		"Asist. (Copa de Oriente)": "Ассист. (Восточный кубок)",
		"Cerebro de la Copa de Oriente": "Плеймейкер Восточного кубка",
		"Ganar la Copa de Oriente.": "Выиграть Восточный кубок.",
		"Ser el máximo goleador de la Copa de Oriente.": "Стать лучшим бомбардиром Восточного кубка.",
		"Máximo asistente de la Copa de Oriente.": "Лучший ассистент Восточного кубка.",
		"COPA DEL SOL": "КУБОК ЗАРИ",
		"Copa del Sol": "Кубок Зари",
		"MEJOR DE LA COPA DEL SOL": "ЛУЧШИЙ В КУБКЕ ЗАРИ",
		"Campeón de Copa del Sol": "Обладатель Кубка Зари",
		"Bota de la Copa del Sol": "Лучший бомбардир Кубка Зари",
		"Máximo Asistente de la Copa del Sol": "Лучший ассистент Кубка Зари",
		"Mejor de la Copa del Sol": "Лучший игрок Кубка Зари",
		"¡Campeón de Copa del Sol!": "Обладатели Кубка Зари!",
		"¡CAMPEÓN DE COPA DEL SOL!": "ОБЛАДАТЕЛИ КУБКА ЗАРИ!",
		"Clasificado a Copa del Sol": "Путевка в Кубок Зари",
		"Fase final de Copa del Sol": "Плей-офф Кубка Зари",
		"Mejor (Copa del Sol)": "Лучший (Кубок Зари)",
		"Bota (Copa del Sol)": "Бомбардир (Кубок Зари)",
		"Asist. (Copa del Sol)": "Ассист. (Кубок Зари)",
		"Cerebro de la Copa del Sol": "Плеймейкер Кубка Зари",
		"Ganar la Copa del Sol.": "Выиграть Кубок Зари.",
		"Ser el máximo goleador de la Copa del Sol.": "Стать лучшим бомбардиром Кубка Зари.",
		"Máximo asistente de la Copa del Sol.": "Лучший ассистент Кубка Зари.",
		"Rey de Oriente": "Король Востока",
		"Rey del Sol": "Король Зари",
		"tabORIENTE": "ВОСТОК",
		"tabSOL": "ЗАРЯ",
		"ORI": "ВОС",
		"CSO": "ЗАР",
		"Medio mundo de distancia y una sola copa. Es tuya.": "Полмира пути и всего один кубок. Он твой.",
		"Viajes largos, noches largas. Y al final, la copa.": "Долгие перелеты, долгие ночи. А в конце — кубок.",
		"El mejor de la copa grande de Asia. Nadie brilló como tú.": "Лучший в главном кубке Азии. Никто не блистал так, как ты.",
		"El mejor de la otra copa de Asia. Cada noche fue tuya.": "Лучший во втором кубке Азии. Каждый вечер был твоим.",
	},


	"copas_africa": {
		"COPA DEL ATLAS": "КУБОК АТЛАСА",
		"Copa del Atlas": "Кубок Атласа",
		"MEJOR DE LA COPA DEL ATLAS": "ЛУЧШИЙ В КУБКЕ АТЛАСА",
		"Campeón de Copa del Atlas": "Обладатель Кубка Атласа",
		"Bota de la Copa del Atlas": "Лучший бомбардир Кубка Атласа",
		"Máximo Asistente de la Copa del Atlas": "Лучший ассистент Кубка Атласа",
		"Mejor de la Copa del Atlas": "Лучший игрок Кубка Атласа",
		"¡Campeón de Copa del Atlas!": "Обладатели Кубка Атласа!",
		"¡CAMPEÓN DE COPA DEL ATLAS!": "ОБЛАДАТЕЛИ КУБКА АТЛАСА!",
		"Clasificado a Copa del Atlas": "Путевка в Кубок Атласа",
		"Fase final de Copa del Atlas": "Плей-офф Кубка Атласа",
		"Mejor (Copa del Atlas)": "Лучший (Кубок Атласа)",
		"Bota (Copa del Atlas)": "Бомбардир (Кубок Атласа)",
		"Asist. (Copa del Atlas)": "Ассист. (Кубок Атласа)",
		"Cerebro de la Copa del Atlas": "Плеймейкер Кубка Атласа",
		"Ganar la Copa del Atlas.": "Выиграть Кубок Атласа.",
		"Ser el máximo goleador de la Copa del Atlas.": "Стать лучшим бомбардиром Кубка Атласа.",
		"Máximo asistente de la Copa del Atlas.": "Лучший ассистент Кубка Атласа.",
		"COPA DEL BAOBAB": "КУБОК БАОБАБА",
		"Copa del Baobab": "Кубок Баобаба",
		"MEJOR DE LA COPA DEL BAOBAB": "ЛУЧШИЙ В КУБКЕ БАОБАБА",
		"Campeón de Copa del Baobab": "Обладатель Кубка Баобаба",
		"Bota de la Copa del Baobab": "Лучший бомбардир Кубка Баобаба",
		"Máximo Asistente de la Copa del Baobab": "Лучший ассистент Кубка Баобаба",
		"Mejor de la Copa del Baobab": "Лучший игрок Кубка Баобаба",
		"¡Campeón de Copa del Baobab!": "Обладатели Кубка Баобаба!",
		"¡CAMPEÓN DE COPA DEL BAOBAB!": "ОБЛАДАТЕЛИ КУБКА БАОБАБА!",
		"Clasificado a Copa del Baobab": "Путевка в Кубок Баобаба",
		"Fase final de Copa del Baobab": "Плей-офф Кубка Баобаба",
		"Mejor (Copa del Baobab)": "Лучший (Кубок Баобаба)",
		"Bota (Copa del Baobab)": "Бомбардир (Кубок Баобаба)",
		"Asist. (Copa del Baobab)": "Ассист. (Кубок Баобаба)",
		"Cerebro de la Copa del Baobab": "Плеймейкер Кубка Баобаба",
		"Ganar la Copa del Baobab.": "Выиграть Кубок Баобаба.",
		"Ser el máximo goleador de la Copa del Baobab.": "Стать лучшим бомбардиром Кубка Баобаба.",
		"Máximo asistente de la Copa del Baobab.": "Лучший ассистент Кубка Баобаба.",
		"Rey del Atlas": "Король Атласа",
		"Rey del Baobab": "Король Баобаба",
		"tabATLAS": "АТЛАС",
		"tabBAOBAB": "БАОБАБ",
		"ATL": "АТЛ",
		"BAO": "БАО",
		"El mejor de la copa grande de África. Nadie brilló como tú.": "Лучший в главном кубке Африки. Никто не блистал так, как ты.",
		"El mejor de la otra copa de África. Cada noche fue tuya.": "Лучший во втором кубке Африки. Каждый вечер был твоим.",
	},




	"copas_oceania": {
		"COPA DEL CORAL": "КУБОК КОРАЛЛА",
		"Copa del Coral": "Кубок Коралла",
		"MEJOR DE LA COPA DEL CORAL": "ЛУЧШИЙ В КУБКЕ КОРАЛЛА",
		"Campeón de Copa del Coral": "Обладатель Кубка Коралла",
		"Bota de la Copa del Coral": "Лучший бомбардир Кубка Коралла",
		"Máximo Asistente de la Copa del Coral": "Лучший ассистент Кубка Коралла",
		"Mejor de la Copa del Coral": "Лучший игрок Кубка Коралла",
		"¡Campeón de Copa del Coral!": "Обладатели Кубка Коралла!",
		"¡CAMPEÓN DE COPA DEL CORAL!": "ОБЛАДАТЕЛИ КУБКА КОРАЛЛА!",
		"Clasificado a Copa del Coral": "Путевка в Кубок Коралла",
		"Fase final de Copa del Coral": "Плей-офф Кубка Коралла",
		"Mejor (Copa del Coral)": "Лучший (Кубок Коралла)",
		"Bota (Copa del Coral)": "Бомбардир (Кубок Коралла)",
		"Asist. (Copa del Coral)": "Ассист. (Кубок Коралла)",
		"Cerebro de la Copa del Coral": "Плеймейкер Кубка Коралла",
		"Ganar la Copa del Coral.": "Выиграть Кубок Коралла.",
		"Ser el máximo goleador de la Copa del Coral.": "Стать лучшим бомбардиром Кубка Коралла.",
		"Máximo asistente de la Copa del Coral.": "Лучший ассистент Кубка Коралла.",
		"Rey del Coral": "Король Коралла",
		"Señor del Arrecife": "Властелин рифа",
		"Ganar 3 veces la Copa del Coral.": "Выиграть Кубок Коралла 3 раза.",
		"Tiburón del Pacífico": "Тихоокеанская акула",
		"Ser 2 veces el máximo goleador de la Copa del Coral.": "2 раза стать лучшим бомбардиром Кубка Коралла.",
		"Ser el mejor jugador de la Copa del Coral.": "Стать лучшим игроком Кубка Коралла.",
		"tabCORAL": "КОРАЛЛ",
		"COR": "КОР",
		"Islas lejanas, un solo estadio. Y la copa del Pacífico es tuya.": "Далекие острова, один стадион. И кубок Тихого океана — твой.",
		"El mejor de la copa del Pacífico. Cada isla habló de ti.": "Лучший в кубке Тихого океана. О тебе говорил каждый остров.",
	},









	"campeon_de_campeones": {
		"CAMPEÓN DE CAMPEONES": "CAMPEON DE CAMPEONES",
		"Campeón de Campeones": "Campeón de Campeones",
		"Ganar el Campeón de Campeones.": "Выиграть Campeón de Campeones.",
		"Dos campeones y una sola copa. La tuya.": "Два чемпиона и один трофей. Твой.",
	},
	"supercopas": {
		"Campeón de la Finalísima": "Обладатель Суперфинала",
		"Finalísima": "Суперфинал",
		"FINALÍSIMA": "СУПЕРФИНАЛ",
		"FINALÍSIMA: {0} le gana a {1}": "СУПЕРФИНАЛ: {0} обыгрывает {1}",
		"Dos Continentes": "Два континента",
		"Ganar la Finalísima con tu país.": "Выиграть Суперфинал со своей сборной.",
		"Campeón de tu continente contra campeón del otro. Ganó el tuyo.": "Чемпион твоего континента против чемпиона другого. Победил твой.",
		"COPA DE LA LIGA": "КУБОК ЛИГИ",
		"Copa de la Liga": "Кубок лиги",
		"Campeón de la Copa de la Liga": "Обладатель Кубка лиги",
		"La otra copa del país. También es tuya.": "Второй кубок страны. Он тоже твой.",
		"Doble Copa": "Двойной кубок",
		"Ganar la Copa de la Liga.": "Выиграть Кубок лиги.",
		"LIGA DE NACIONES": "ЛИГА НАЦИЙ",
		"Liga de Naciones": "Лига наций",
		"Campeón de la Liga de Naciones": "Победитель Лиги наций",
		"Liga A": "Лига A",
		"Ganar la Liga de Naciones con tu país.": "Выиграть Лигу наций со своей сборной.",
		"Seis jornadas, una Final Four. La primera de tu continente.": "Шесть туров и «Финал четырех». Первая на твоем континенте.",
		"LIGA DE NACIONES: {0}": "ЛИГА НАЦИЙ: {0}",
		"SUPERCOPA DE ÁFRICA": "СУПЕРКУБОК АФРИКИ",
		"Supercopa de África": "Суперкубок Африки",
		"Campeón de la Supercopa de África": "Обладатель Суперкубка Африки",
		"Supercampeón de África": "Суперчемпион Африки",
		"Ganar la Supercopa de África.": "Выиграть Суперкубок Африки.",
		"Los dos campeones de África, y la copa es tuya.": "Два чемпиона Африки — и кубок твой.",
		"RECOPA DEL SUR": "ЮЖНЫЙ СУПЕРКУБОК",
		"Recopa del Sur": "Южный суперкубок",
		"COPA INTERCONTINENTAL": "МЕЖКОНТ. КУБОК",
		"Copa Intercontinental": "Межконтинентальный кубок",
		"DERBI DE LAS AMÉRICAS": "ДЕРБИ ДВУХ АМЕРИК",
		"COPA AFROASIÁTICA": "АФРОАЗИАТСКИЙ КУБОК",

		"PLAY-OFF ASIA-PACÍFICO": "ПЛЕЙ-ОФФ АЗИЯ-ОКЕАНИЯ",
		"COPA CHALLENGER": "КУБОК ЧЕЛЛЕНДЖЕР",
		"Campeón de la Recopa": "Обладатель Южного суперкубка",
		"Campeón Intercontinental": "Межконтинентальный чемпион",
		"Campeón contra Campeón": "Чемпион против чемпиона",
		"Rey Intercontinental": "Межконтинентальный король",
		"Ganar la Recopa del Sur.": "Выиграть Южный суперкубок.",
		"Ganar la Copa Intercontinental.": "Выиграть Межконтинентальный кубок.",
		"Campeón contra campeón. Y la copa se queda contigo.": "Чемпион против чемпиона. И кубок остается у тебя.",
		"Los campeones de cada continente, y el mejor eres tú.": "Чемпионы всех континентов, а лучший — ты.",
		"SUPERCOPA DE EUROPA": "СУПЕРКУБОК ЕВРОПЫ",
		"Supercopa de Europa": "Суперкубок Европы",
		"Campeón de la Supercopa de Europa": "Обладатель Суперкубка Европы",
		"Supercampeón de Europa": "Суперчемпион Европы",
		"Ganar la Supercopa de Europa.": "Выиграть Суперкубок Европы.",
		"Los dos campeones de Europa, y la copa es tuya.": "Два чемпиона Европы — и кубок твой.",
		"SUPERCOPA": "СУПЕРКУБОК",
		"Supercopa": "Суперкубок",
		"Campeón de Supercopa": "Обладатель Суперкубка",
		"Supercampeón": "Суперчемпион",
		"Ganar la Supercopa de tu país.": "Выиграть Суперкубок своей страны.",
		"El campeón contra el campeón. Y la copa, tuya.": "Чемпион против чемпиона. И кубок — твой.",
		"SUPERCOPA · FINAL": "СУПЕРКУБОК · ФИНАЛ",
		"COPA DE LA ASOCIACIÓN": "КУБОК АССОЦИАЦИИ",
		"Copa de la Asociación": "Кубок ассоциации",
		"COPA DE LAS LIGAS": "МЕЖЛИГОВЫЙ КУБОК",
		"Copa de las Ligas": "Межлиговый кубок",
		"Campeón de la Copa de las Ligas": "Обладатель Межлигового кубка",
		"DUELO DE CAMPEONES": "ДУЭЛЬ ЧЕМПИОНОВ",
		"Rey de las Dos Ligas": "Король двух лиг",
		"Ganar la Copa de las Ligas.": "Выиграть Межлиговый кубок.",
		"Duelo de campeones entre dos ligas. Y la copa, tuya.": "Дуэль чемпионов двух лиг. И кубок — твой.",
	},
	"apertura_clausura": {
		"APERTURA": "АПЕРТУРА",
		"CLAUSURA": "КЛАУСУРА",
		"Apertura": "Апертура",
		"Clausura": "Клаусура",
		"EN LIGUILLA": "В ЛИГИЛЬЕ",
		"IGUALADO CON LA LIGUILLA": "ВРОВЕНЬ С ЗОНОЙ ЛИГИЛЬИ",
		"A {0} PTS DE LA LIGUILLA": "{0} ОЧК. ДО ЛИГИЛЬИ",
		"{0} es bicampeón: Apertura y Clausura": "{0} выигрывает и Апертуру, и Клаусуру",
		"{0} gana el Clausura; el Apertura fue de {1}": "{0} выигрывает Клаусуру; победитель Апертуры — {1}",
		"ANUAL": "ЗА ГОД",
		"El torneo aún no arranca.": "Турнир еще не начался.",
		"{0} os deja fuera. Se acabó el Apertura; queda el Clausura.": "{0} выбивает вас. Апертура окончена; впереди Клаусура.",
	},
	"liguilla": {
		"ESTO SE VA A LOS PENALES": "ДЕЛО ИДЕТ К ПЕНАЛЬТИ",
		"GLOBAL EMPATADO: PASAS POR POSICIÓN": "ПО СУММЕ РАВНО: ПРОХОДИШЬ ПО МЕСТУ",
		"GLOBAL EMPATADO: PASA EL RIVAL POR POSICIÓN": "ПО СУММЕ РАВНО: СОПЕРНИК ПРОХОДИТ ПО МЕСТУ",
		"PASAS POR POSICIÓN": "ПРОХОДИШЬ ПО МЕСТУ",
		"FUERA POR POSICIÓN": "ВЫЛЕТ ПО МЕСТУ",
		"POR POSICIÓN": "ПО МЕСТУ",
		"SI ACABA ASÍ: PENALTIS": "ЕСЛИ ТАК: ПЕНАЛЬТИ",
		"SI ACABA ASÍ: OTRA NOCHE": "ЕСЛИ ТАК: ЕЩЕ ОДИН МАТЧ",
		"Así, nos toca otra noche. Que no haga falta.": "Если так, нас ждет еще один вечер. Лучше бы без него.",
		"Así, penaltis. Y nadie quiere penaltis.": "Если так — пенальти. А пенальти не хочет никто.",
		"LIGUILLA": "ЛИГИЛЬЯ",
		"PLAY-IN": "ПЛЕЙ-ИН",
		"Play-in": "Плей-ин",
		"FINAL DE LA LIGUILLA": "ФИНАЛ ЛИГИЛЬИ",
		"SUPERLÍDER: {0}": "ЛИДЕР ТАБЛИЦЫ: {0}",
		"Entrar a la liguilla": "Попасть в лигилью",
		"Superlíder": "Лидер таблицы",
		"No entró": "Не попал",
		"{0} en la tabla": "{0} в таблице",
		"Campeón de Liga: {0}": "Чемпион лиги: {0}",
		"Del 1º al 6º, a cuartos; del 7º al 10º, al play-in.": "С 1-го по 6-е место — в 1/4 финала; с 7-го по 10-е — в плей-ин.",
		"Así quedaría si la liga acabara hoy.": "Так выглядела бы таблица, если бы лига закончилась сегодня.",
		"Dos partidos y la liga es vuestra. En esta sala ya no habla nadie de suerte.": "Два матча — и лига ваша. В этой раздевалке про удачу уже никто не говорит.",
		"Semifinales. Dos cruces más y la liga es vuestra.": "Полуфинал. Еще два раунда — и лига ваша.",
		"Global igualado y pasa el mejor de la tabla: {0}. No hizo falta ni la tanda.": "По сумме — равенство, и проходит тот, кто выше в таблице: {0}. Даже до пенальти не дошло.",
		"A un cruce de la final. Esta sala va a tardar en olvidarlo.": "Один раунд до финала. Эта раздевалка не скоро это забудет.",
		"{0} os deja fuera. Se acabó la liguilla y con ella el año.": "{0} выбивает вас. Лигилья окончена, а вместе с ней и сезон.",
		"Una liga entera para perderla en la última noche. La vuelta al campo la dan ellos.": "Целый сезон в лиге — и проиграть его в последний вечер. Круг почета делают они.",
		"{0} gana la liguilla y la liga; {1} fue superlíder": "{0} выигрывает лигилью и лигу; лидер таблицы — {1}",
		"{0} es Campeón de Campeones": "{0} — Campeón de Campeones",
		"{0} es Campeón de Campeones ante {1}": "{0} — Campeón de Campeones, обыграв {1}",
		"Del 1º al 8º, a cuartos.": "С 1-го по 8-е место — в 1/4 финала.",
	},


	"golpeo_puntero": {
		"Jala el stick derecho y suelta para tirar": "Оттяни правый стик и отпусти — удар",
		"Jala el stick derecho y suelta para centrar": "Оттяни правый стик и отпусти — навес",

		"Jala el stick izquierdo y suelta para tirar": "Оттяни левый стик и отпусти — удар",
		"Jala el stick izquierdo y suelta para centrar": "Оттяни левый стик и отпусти — навес",


		"Apunta con el stick · pulsa el botón": "Целься стиком · жми кнопку",
		"CENTRO · apunta y pulsa el botón": "НАВЕС · целься и жми кнопку",
	},

	"pingpong_matt": {
		"pingpong_mattRETO DE MATT": "ДУЭЛЬ: MATT",
		"pingpong_mattENTRENO": "ТРЕНИРОВКА",
		"pingpong_mattDESAFIO": "ВЫЗОВ",
		"pingpong_mattLEYENDA": "ЛЕГЕНДА",
		"pingpong_mattVENCISTE A MATT": "MATT ПОВЕРЖЕН",
		"pingpong_mattGANO MATT": "ПОБЕДА MATT",
		"pingpong_mattSAQUE DE MATT": "ПОДАЕТ MATT",
		"pingpong_mattPUNTO PARA MATT": "MATT БЕРЕТ ОЧКО",
		"pingpong_mattATAQUE": "АТАКА",
		"pingpong_mattMATT ATACA": "MATT АТАКУЕТ",
		"pingpong_mattVICTORIAS": "ПОБЕДЫ",
		"pingpong_mattRECORD": "РЕКОРД",
		"pingpong_mattCAMPEON": "ЧЕМПИОН",
		"pingpong_mattINTERCAMBIO: {0}": "РОЗЫГРЫШ: {0}",
		"pingpong_mattMueve la pala. Toca para sacar.": "Двигай ракетку. Нажми, чтобы подать.",
		"pingpong_mattCentro: ataque. Lateral: colocación.": "Центр: атака. Край: точность.",
	},
	"museo_visita": {
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida se borra; su museo queda disponible para visitar. Esto no se puede deshacer.": "В зале остается табличка карьеры: цифры, трофеи и клубы. Сохранение удаляется, а ее музей остается открытым для посещения. Отменить это нельзя.",
		"MEJOR TEMPORADA": "ЛУЧШИЙ СЕЗОН",
		"Por premios, media y aportación.": "По наградам, рейтингу и вкладу.",
		"ELIGE DOS CARRERAS": "ВЫБЕРИ ДВЕ КАРЬЕРЫ",
		"ELIGE OTRA CARRERA": "ВЫБЕРИ ДРУГУЮ КАРЬЕРУ",
		"COMPARAR CARRERAS": "СРАВНИТЬ КАРЬЕРЫ",
		"CAMBIAR CARRERAS": "СМЕНИТЬ КАРЬЕРЫ",
		"DERROTAS": "ПОРАЖЕНИЯ",
		"EMPATES": "НИЧЬИ",
		"VICTORIAS": "ПОБЕДЫ",
		"RECONOCIMIENTOS": "ЗВАНИЯ",
		"LEYENDA DEL CLUB": "ЛЕГЕНДА КЛУБА",
		"LEYENDA DE LA LIGA": "ЛЕГЕНДА ЛИГИ",
		"LEYENDA DE LA SELECCIÓN": "ЛЕГЕНДА СБОРНОЙ",
		"RÉCORDS REGISTRADOS": "РЕКОРДЫ",
		"MEJOR DE LA HISTORIA": "ЛУЧШИЙ В ИСТОРИИ",
		"TROFEOS": "ТРОФЕИ",
		"PREMIOS": "НАГРАДЫ",
		"POR EQUIPO": "ПО КЛУБАМ",
		"No se conservaron las estadísticas por temporada.": "Статистика по сезонам не сохранилась.",
		"V": "В",
		"D": "П",
		"VISITAR MUSEO": "ОТКРЫТЬ МУЗЕЙ",
		"SALAS": "ЗАЛЫ",
		"VESTÍBULO": "ВЕСТИБЮЛЬ",
		"HAT-TRICKS": "ХЕТ-ТРИКИ",
		"TU MUSEO": "ТВОЙ МУЗЕЙ",
		"ESTÁS AQUÍ": "ТЫ ЗДЕСЬ",
		"VISITAR SALA": "ОСМОТРЕТЬ ЗАЛ",
		"TOCA PARA EXPLORAR": "НАЖМИ ДЛЯ ОСМОТРА",
	},
	"coleccion_pistas": {
		"TIROS LIBRES": "ШТРАФНЫЕ",
		"CÓRNERS": "УГЛОВЫЕ",
		"SAQUES DE BANDA": "АУТЫ",
		"INDIRECTAS": "СВОБОДНЫЕ УДАРЫ",
		"MANO A MANO": "ОДИН НА ОДИН",
		"TIRO FRONTAL": "УДАР ИЗ ЦЕНТРА",
		"TIRO LEJANO": "УДАР ИЗДАЛИ",
		"TIRO CRUZADO": "УДАР ПОД УГЛОМ",
		"CONTRAS": "КОНТРАТАКИ",
		"CENTROS": "НАВЕСЫ",
		"PRIMERA OCASIÓN": "ПЕРВЫЙ МОМЕНТ",
		"GOLES DE TU EQUIPO": "ГОЛЫ ТВОЕЙ КОМАНДЫ",
		"GOLES DEL RIVAL": "ГОЛЫ СОПЕРНИКА",
		"{0} GANANDO": "{0} ПРИ ПЕРЕВЕСЕ",
		"{0} SIN GANAR": "{0} БЕЗ ПЕРЕВЕСА",
		"{0} DESDE EL {1}'": "{0} С {1}'",
		"{0} HASTA EL {1}'": "{0} ДО {1}'",
		"CUÁNDO": "КОГДА",
		"EN DERBIS": "В ДЕРБИ",
		"DE VISITANTE": "В ГОСТЯХ",
		"SÓLO EN CLUB": "ТОЛЬКО В КЛУБЕ",
		"EXPULSIONES": "УДАЛЕНИЯ",
		"OCASIÓN FALLADA": "УПУЩЕННЫЙ МОМЕНТ",

		"PISTA: {0}": "НАМЕК: {0}",
		"BALONES PARA TI": "ПАСЫ НА ТЕБЯ",
		"LESIONES": "ТРАВМЫ",
		"GASTO DE ENERGÍA": "РАСХОД ЭНЕРГИИ",
		"TE SIENTA BAJO": "В ЗАПАС, ЕСЛИ НИЖЕ",
		"RECUPERACIÓN": "ВОССТАНОВЛЕНИЕ",
		"PUESTO HASTA LOS 23": "МЕСТО ДО 23 ЛЕТ",
		"PUESTO SIN SU CONFIANZA": "МЕСТО БЕЗ ЕГО ДОВЕРИЯ",
		"JORNADAS EN LA GRADA": "ТУРОВ НА ТРИБУНЕ",
		"TRAS GANAR": "ПОСЛЕ ПОБЕДЫ",
		"REPITE EL ONCE": "ТОТ ЖЕ СОСТАВ",
		"BRONCA TRAS MAL PARTIDO": "РАЗНОС ЗА ПЛОХОЙ МАТЧ",
		"AFICIÓN Y PRENSA AL PERDER": "ТРИБУНЫ И ПРЕССА ПРИ ПОРАЖЕНИИ",
		"MEJORA DE CONTRATO": "ПОВЫШЕНИЕ ЗАРПЛАТЫ",
		"CAMBIO DE DIBUJO": "СМЕНА СХЕМЫ",
		"Ser generoso desde los once metros también tiene premio.": "Щедрость на 11-метровой отметке тоже вознаграждается.",
		"En la cantera hay un chaval que necesita a alguien que crea en él.": "В академии есть парень, которому нужен кто-то, кто в него поверит.",
		"Desde los once metros, a veces el balón es sólo tuyo.": "На 11-метровой отметке мяч иногда принадлежит только тебе.",
		"Ningún partido está perdido aunque vayas dos goles abajo.": "Ни один матч не проигран, даже если уступаешь два мяча.",
		"Los de la tele graban muy pegados a la línea de fondo.": "Телевизионщики снимают вплотную к лицевой линии.",
		"No todo balón tiene que acabar en la portería rival.": "Не каждый мяч должен заканчиваться в воротах соперника.",
		"El portero deja algo para beber junto a su poste.": "Вратарь оставляет у штанги что-то попить.",
		"En una final, alguien de la grada quiere un recuerdo contigo.": "В финале кто-то на трибуне хочет сувенир на память о тебе.",
		"A veces se posan visitas con alas sobre el césped.": "Иногда на газон садятся крылатые гости.",
		"Arriba, los del palco miran el partido detrás de un cristal.": "Наверху гости в ложе смотрят матч из-за стекла.",
		"El que te devuelve los balones espera junto a la banda.": "Мальчик, который подает мячи, ждет у бровки.",
		"Al acabar un derbi, mira lo que pasa entre los dos banquillos.": "После дерби посмотри, что происходит между двумя скамейками.",
		"En el apretón del derbi, el que aprieta más gana.": "В рукопожатии на дерби побеждает тот, кто сожмет сильнее.",
		"El banquillo de enfrente también está a tiro.": "Скамейка соперника тоже в зоне досягаемости.",
		"Tu propio banquillo también está a tiro.": "Твоя собственная скамейка тоже в зоне досягаемости.",
		"El míster de enfrente grita de pie en su área técnica.": "Тренер соперника кричит стоя в своей технической зоне.",
		"Tu propio míster también está de pie en la banda.": "Твой тренер тоже стоит у бровки.",
		"A fuerza de balonazos, un banquillo se puede vaciar.": "Если долго лупить мячами, скамейку можно и опустошить.",
		"Entre la hierba asoman las cabezas del riego.": "Из травы выглядывают головки поливалок.",
		"En la grada hay vasos llenos, y los balones que se van caen en algún sitio.": "На трибуне стоят полные стаканы, а улетевшие мячи где-то приземляются.",
		"En la grada alguien pasea con una bandeja de comida.": "Кто-то на трибуне ходит с подносом еды.",
		"Si la grada te abuchea, contéstale donde más duele.": "Если трибуны тебя освистывают, ответь им там, где больнее всего.",
		"En algunos campos de barrio no hay nada detrás del arco.": "На некоторых дворовых полях за воротами нет ничего.",
		"No todas las finales acaban con la copa en tus manos.": "Не каждый финал заканчивается кубком в твоих руках.",
		"Si un club te quita una final, búscalo en otra.": "Если клуб отнял у тебя финал, встреться с ним в другом.",
		"Una Nueva Carrera+ con ventajas, jugada hasta el último día.": "Новая карьера+ с бонусами, сыгранная до самого последнего дня.",
		"En tu casa hay un volante esperando: ni frenos ni hierba.": "Дома тебя ждет руль: ни тормозов, ни травы.",
		"La maquinita de tu casa guarda un récord por batir.": "Игровой автомат у тебя дома хранит рекорд, который надо побить.",
		"La diana de tu casa premia la puntería fina.": "Мишень для дартса у тебя дома любит твердую руку.",
		"Hay balones sueltos por el banquillo, y el míster no siempre mira.": "У скамейки валяются мячи, а тренер не всегда смотрит.",
		"En el billar de tu casa, no dejes jugar al rival.": "За бильярдом у себя дома не давай сопернику играть.",
		"Si te casas, piensa bien a nombre de quién pones la casa.": "Если женишься, хорошо подумай, на чье имя оформить дом.",
		"De visita, tarde y perdiendo por la mínima, el balón tarda en volver.": "В гостях, в концовке, при проигрыше в один гол мяч долго не возвращается.",
	},
	"tapetes_formas": {
		"TAPETE OVALADO": "ОВАЛЬНЫЙ КОВЕР",
		"Lana de contorno oval, con borde tejido y centro suave.": "Овальный шерстяной ковер с тканым краем и мягкой серединой.",
		"TAPETE HEXAGONAL": "КОВЕР-ШЕСТИУГОЛЬНИК",
		"Seis lados y franjas concéntricas para vestir un rincón.": "Шесть сторон и концентрические полосы, чтобы украсить угол.",
		"TAPETE ORGÁNICO": "КОВЕР-ГАЛЬКА",
		"Curvas suaves e irregulares, como una piedra de río.": "Мягкие неровные изгибы, как у речного камня.",
		"TAPETE DE PASILLO": "КОВРОВАЯ ДОРОЖКА",
		"Tejido alargado con esquinas redondas y bandas claras.": "Вытянутое плетение со скругленными углами и светлыми полосами.",
		"el tapete no puede atravesar una pared": "ковер не может проходить сквозь стену",
	},
	"decoracion_salon": {
		"TAPETE REDONDO": "КРУГЛЫЙ КОВЕР",
		"TAPETE TEJIDO": "ТКАНЫЙ КОВЕР",
		"BOCINAS DE TORRE": "НАПОЛЬНЫЕ КОЛОНКИ",
		"BOCINAS DE ESTANTE": "ПОЛОЧНЫЕ КОЛОНКИ",
		"LIBRERO ABIERTO": "ОТКРЫТЫЙ СТЕЛЛАЖ",
		"LIBRERO MODULAR": "МОДУЛЬНЫЙ СТЕЛЛАЖ",
		"Yute trenzado en círculos. Va debajo de mesas y sillones.": "Джут, сплетенный кругами. Помещается под столы и кресла.",
		"Lana con rombos y flecos. Viste el suelo sin estorbar el paso.": "Шерсть с ромбами и бахромой. Украшает пол и не мешает ходить.",
		"Dos torres de audio con conos y puertos al frente.": "Две аудиоколонки с динамиками и фазоинверторами спереди.",
		"Dos bocinas compactas y receptor sobre un mueble bajo.": "Две компактные колонки и ресивер на низкой тумбе.",
		"Madera y tubos oscuros, con baldas abiertas para libros.": "Дерево и темные трубы, открытые полки для книг.",
		"Cubos, cajones y libros en una composición de madera.": "Кубы, ящики и книги в деревянной композиции.",
	},
	"nivel_club": {
		"TU NIVEL EN EL CLUB": "УРОВЕНЬ В КЛУБЕ",
		"CON VOZ": "ВЕСОМЫЙ",
		"DE CONFIANZA": "ДОВЕРЕННЫЙ",
		"HOMBRE DE LA CASA": "СВОЙ ЧЕЛОВЕК",
		"Subes de nivel en el club: {0}.": "Твой уровень в клубе вырос: {0}.",
		"Bajas de nivel en el club: {0}.": "Твой уровень в клубе снизился: {0}.",
		"Pierdes el brazalete del club.": "Ты теряешь капитанскую повязку.",
		"Tu peso en el club te deja pedir número sin esperar a renovar. Llevas el {0}: uno libre es tuyo; el de un compañero, depende de él.": "Твой вес в клубе позволяет попросить номер, не дожидаясь продления контракта. Сейчас у тебя номер {0}: свободный номер — твой; номер партнера — на его усмотрение.",
		"{0} no te cede el {1}. Sigues con el {2}.": "{0} не уступает тебе номер {1}. Ты остаешься с номером {2}.",
		"{0} te cede el {1}.": "{0} уступает тебе номер {1}.",
		"El club ya te dijo que no a este fichaje en esta ventana.": "Клуб уже отказал тебе в этом трансфере в это окно.",
		"Acabas de llegar: el club aún no te consulta los fichajes. Con {0} de relación pasas a {1} y puedes proponerlos.": "Ты только пришел: клуб пока не советуется с тобой по трансферам. При отношениях {0} — уровень {1}, и ты сможешь их предлагать.",
		"EN RIESGO": "РИСК",
		"ES EL NIVEL {0}: VAS EN EL {1}": "НУЖЕН УРОВЕНЬ {0}: У ТЕБЯ {1}",
		"TE FALTAN {0} DE RELACIÓN": "ОТНОШЕНИЯ: НЕ ХВАТАЕТ {0}",
		"TITULAR EL {0} %: PIDE {1} %": "В ОСНОВЕ {0} %: НУЖНО {1} %",
		"NO ERES TITULAR": "ТЫ НЕ В ОСНОВЕ",
		"Venderlo, protegerlo o pedir que lo renueven es del nivel {0}: {1} de relación con el club.": "Продать его, защитить от продажи или попросить продлить его контракт можно с уровня {0} (отношения с клубом: {1}).",
		"Vender es del nivel {0}: {1} de relación con el club.": "Продажа доступна с уровня {0} (отношения с клубом: {1}).",
		"Pedir otro técnico es del nivel {0}: {1} de relación con el club.": "Попросить другого тренера можно с уровня {0} (отношения с клубом: {1}).",
		"Ya lo pediste esta temporada.": "Ты уже просил об этом в этом сезоне.",
		"Antes, contesta lo que tienes pendiente.": "Сначала разберись с тем, что ждет ответа.",
		"PEDIR OTRO DORSAL": "ПОПРОСИТЬ НОМЕР",
		"Con tu nivel, el club decide cada fichaje al confirmar: {0} % de que diga que sí. Al que rechace no se le vuelve a proponer en esta ventana.": "С твоим уровнем клуб решает по каждому трансферу при подтверждении: шанс согласия — {0} %. Отклоненного игрока в это окно предложить снова нельзя.",
		"VENDER": "ПРОДАТЬ",
		"EL CLUB DIJO NO": "КЛУБ ОТКАЗАЛ",
		"relación": "отношения",
		"nivel": "уровень",
		"El {0} lo lleva {1}. Toca otra vez y se lo pides: hay un {2} % de que te lo ceda.": "Номер {0} у игрока {1}. Нажми еще раз, чтобы попросить: шанс, что он уступит, — {2} %.",
		"El {0} lo lleva {1}. Mantén y se lo pides: hay un {2} % de que te lo ceda.": "Номер {0} у игрока {1}. Зажми, чтобы попросить: шанс, что он уступит, — {2} %.",
		"TU NIVEL: {0}": "УРОВЕНЬ: {0}",
		"BAJAS DE NIVEL EN EL CLUB": "УРОВЕНЬ В КЛУБЕ СНИЖЕН",
		"PIDES OTRO DORSAL": "НОВЫЙ НОМЕР",
		"TU PETICIÓN": "ЗАПРОС",
		"El club te dio la voz y el vestuario la reconoce. Ahora la cinta es tuya.": "Клуб дал тебе право голоса, и раздевалка это признает. Теперь капитанская повязка — твоя.",
		"VES LA MESA": "ТЫ ЗА СТОЛОМ",
		"PROPONES FICHAJES": "ПРЕДЛАГАЙ ТРАНСФЕРЫ",
		"COMPRAS Y VENTAS": "ПОКУПКИ И ПРОДАЖИ",
		"OTRO DORSAL": "НОВЫЙ НОМЕР",
		"OTRO TECNICO": "НОВЫЙ ТРЕНЕР",
		"PRIMA FIDELIDAD": "БОНУС ВЕРНОСТИ",
		"GRADA FIEL": "ВЕРНЫЕ ФАНЫ",
		"MAS MARGEN": "БОЛЬШЕ ЗАПАСА",
		"Pediste salir: el club ya no te consulta su plantilla.": "Ты попросился уйти: клуб больше не советуется с тобой по составу.",
		"Prima de fidelidad": "Бонус за верность",
		"CEDIDO: TU NIVEL TE ESPERA": "В АРЕНДЕ: УРОВЕНЬ ЖДЕТ",
		"BAJAS EN {0}": "ПОНИЖЕНИЕ: {0}",
		"PROMETIDO AL VETERANO": "ОБЕЩАНО ВЕТЕРАНУ",
		"CLUB NUEVO": "НОВЫЙ КЛУБ",
		"Una vez por temporada.": "Раз в сезон.",
	},
	"mesa_fichajes": {
		"BUSCAR EN EL RANKING": "ПОИСК В РЕЙТИНГЕ",
		"Los fichajes se marcan con + en el ranking.": "Новички отмечены в рейтинге знаком +.",
		"VENDER ({0})": "ПРОДАТЬ ({0})",
		"CONFIRMAR ({0})": "ПОДТВЕРДИТЬ ({0})",
		"{0} SIN CONFIRMAR": "ОЖИДАЮТ: {0}",
		"Es tu último {0}: sin él no hay quien juegue ahí.": "Это твой последний {0}: без него там некому играть.",
		"Estás cedido: tu club no te pregunta por sus fichajes.": "Ты в аренде: клуб не спрашивает тебя о трансферах.",
		"FICHADOS": "КУПЛЕНЫ",
		"VENDIDOS": "ПРОДАНЫ",
		"FICHAJES ({0})": "ПОКУПКИ ({0})",
		"VENTAS ({0})": "ПРОДАЖИ ({0})",
		"FICHAR EN LA MESA": "В СПИСОК ПОКУПОК",
		"VENDER EN LA MESA": "В СПИСОК ПРОДАЖ",
		"QUITAR DE LA MESA": "УБРАТЬ ИЗ СПИСКА",
		"FICHAS": "ПРИХОД",
		"VENDES": "УХОД",
		"FIRMO ESTE AÑO": "НОВИЧОК",
		"Firmaste con otro club: la plantilla del año que viene ya no la haces tú.": "Ты подписал контракт с другим клубом: состав на следующий сезон собираешь уже не ты.",
		"Firmó esta temporada: no se vende hasta la próxima.": "Подписан в этом сезоне: продать его можно только в следующем.",
		"Juega aquí cedido: no es tuyo para venderlo.": "Он здесь в аренде: продать его ты не можешь.",
		"LA MESA": "СДЕЛКИ",
		"La plantilla quedaría en {0}: el máximo es {1}.": "В составе станет {0}: максимум — {1}.",
		"La plantilla quedaría en {0}: el mínimo es {1}.": "В составе станет {0}: минимум — {1}.",
		"Lo pide tu técnico: si llega, te lo apunta.": "Тренер просит усиление: если придет, тебе это зачтется.",
		"Si fichas a uno de esa línea, el técnico te lo apunta.": "Подпиши игрока на эту линию, и тренер тебе это зачтет.",
		"Marca a quién vendes y a quién fichas.": "Отметь, кого продаешь и кого покупаешь.",
		"Marcado ({0}). Te faltan {1}.": "Отмечено: {0}. Не хватает {1}.",
		"Marcado ({0}). Te queda {1}.": "Отмечено: {0}. Остается {1}.",
		"Mercado cerrado. La mesa abre con la próxima ventana, que dura {0} {1}.": "Трансферное окно закрыто. Сделки откроются со следующим окном, оно продлится {0} {1}.",
		"Mercado cerrado: la mesa abre con la próxima ventana.": "Трансферное окно закрыто: сделки откроются со следующим окном.",
		"NO QUIERE VENIR": "НЕ ХОЧЕТ К НАМ",
		"NO QUISO VENIR": "ОТКАЗАЛСЯ",
		"NO SALIERON": "СОРВАЛИСЬ",
		"Nada de lo marcado sale hoy: mira los avisos en rojo.": "Сегодня не пройдет ни одна отмеченная сделка: смотри предупреждения красным.",
		"Nadie lo compra hoy a ese precio.": "Сегодня за такие деньги его никто не купит.",
		"No hay vuelta atrás: se mueve todo a la vez.": "Назад пути нет: все сделки пройдут разом.",
		"No quiere venir: interés {0} % (mínimo {1} %).": "Не хочет переходить: интерес {0} % (минимум {1} %).",
		"PRESUPUESTO": "БЮДЖЕТ",
		"QUEDA": "ОСТАТОК",
		"QUEDA EN LA MESA": "ОСТАТОК БЮДЖЕТА",
		"SIN COMPRADOR": "НЕТ ПОКУПАТЕЛЯ",
		"SIN DINERO": "НЕТ ДЕНЕГ",
		"Sin club no hay mesa de fichajes.": "Нет клуба — нет и сделок.",
		"Está cedido: quien lo tiene no lo puede vender.": "Он в аренде: клуб, где он играет, не может его продать.",
		"Su club no lo vende: sólo sale pagando su cláusula.": "Клуб его не продает: уйдет только за отступные.",
		"Te faltan {0}: vende a alguien o quita un fichaje.": "Не хватает {0}: продай кого-нибудь или убери покупку.",
		"Te pagan un {0} % menos de lo que vale: el comprador sabe que tienes prisa.": "Тебе платят на {0} % меньше его стоимости: покупатель знает, что ты торопишься.",
		"ULTIMO {0}": "ОСТАЛСЯ {0}",
		"VA AL {0}": "В КЛУБ {0}",
		"Va al {0} por {1} cuando confirmes la mesa.": "Уходит в клуб {0} за {1}, когда подтвердишь сделки.",
		"Ventana abierta: {0} {1} por delante. Nada se mueve hasta que confirmes.": "Окно открыто: впереди {0} {1}. Ничего не произойдет, пока не подтвердишь.",
		"Ya juega en tu club.": "Он уже играет в твоем клубе.",
		"DEF": "ЗАЩ",
		"MED": "ПЗ",
		"DEL": "НАП",
	},
	"surf_casa": {
		"ALBERCA DE OLAS": "ВОЛНОВОЙ БАССЕЙН",
		"Alberca decorativa con olas en movimiento, agua translúcida y espuma. Incluye generador y tabla.": "Декоративный бассейн с бегущими волнами, прозрачной водой и пеной. Генератор волн и доска для серфинга в комплекте.",
	},
	"penthouse_tecnologia": {
		"SEMANA {0}": "НЕДЕЛЯ {0}",
		"SOFÁ PENTHOUSE": "ДИВАН ПЕНТХАУС",
		"Sofá modular de piel crema, nogal y latón. Recibe visitas en tu salón.": "Модульный диван из кремовой кожи с орехом и латунью. Принимай гостей в своей гостиной.",
		"COMEDOR PENTHOUSE": "СТОЛОВАЯ ПЕНТХАУС",
		"Mesa de mármol negro con seis sillas de piel y detalles de latón.": "Стол из черного мрамора, шесть кожаных стульев и латунная отделка.",
		"CAMA PENTHOUSE": "КРОВАТЬ ПЕНТХАУС",
		"Cama flotante de nogal con cabecero iluminado. Permite dormir de verdad.": "Парящая кровать из ореха с подсвеченным изголовьем. Здесь можно по-настоящему выспаться.",
		"ROBOT ASPIRADOR": "РОБОТ-ПЫЛЕСОС",
		"Robot con base de carga. Recorre el suelo libre al colocarlo en casa.": "Робот с зарядной базой. Ездит по свободному полу, когда стоит в доме.",
		"ESPEJO INTELIGENTE": "УМНОЕ ЗЕРКАЛО",
		"Espejo de pie con pantalla: consulta tu estado y los próximos partidos.": "Напольное зеркало с экраном: смотри свою форму и ближайшие матчи.",
		"MESA HOLOGRÁFICA": "СТОЛ-ГОЛОГРАММА",
		"Mesa táctica con proyección 3D. Explora cuatro formaciones y gira la vista.": "Тактический стол с 3D-проекцией. Изучай четыре схемы и вращай вид.",
		"CONSULTAR ESPEJO": "ГЛЯНУТЬ В ЗЕРКАЛО",
		"EXPLORAR TÁCTICA": "ИЗУЧИТЬ ТАКТИКУ",
		"TECNOLOGÍA": "ТЕХНОЛОГИИ",
		"Compra este objeto para usarlo.": "Купи этот предмет, чтобы им пользоваться.",
		"ENERGÍA {0}/100": "ЭНЕРГИЯ {0}/100",
		"ÁNIMO {0} · LESIÓN: {1} SEMANAS": "НАСТРОЙ {0} · ТРАВМА: {1} НЕД.",
		"PRÓXIMOS PARTIDOS": "БЛИЖАЙШИЕ МАТЧИ",
		"No hay partidos programados.": "Матчей не запланировано.",
		"FECHA POR CONFIRMAR": "ДАТА УТОЧНЯЕТСЯ",
		"Tu estado se actualiza cada vez que consultas el espejo.": "Твое состояние обновляется каждый раз, когда смотришь в зеркало.",
		"CAMBIAR ESQUEMA": "СМЕНИТЬ СХЕМУ",
		"VISTA INICIAL": "СБРОС ВИДА",
		"Gira el campo con el dedo. Los esquemas son de consulta.": "Вращай поле пальцем. Схемы — только для просмотра.",
		"FORMACIÓN {0}": "СХЕМА {0}",
		"ÁNIMO {0} · LESIÓN: {1} DÍAS": "НАСТРОЙ {0} · ТРАВМА: {1} Д.",
	},
	"basket_reloj": {
		"SEGUIDAS": "СЕРИЯ",
		"CANASTAS": "ПОПАДАНИЯ",
		"LIMPIAS": "ЧИСТЫЕ",
		"TIRO {0}/10": "БРОСОК {0}/10",
		"POSICIÓN {0}/5": "ТОЧКА {0}/5",
		"Desliza hacia el aro y suelta.": "Проведи пальцем к кольцу и отпусти.",
		"2 por canasta · 3 limpia · +1 cada 3 seguidas": "2 за попадание · 3 за чистое · +1 за каждые 3 подряд",
		"¡LIMPIA!": "ЧИСТО!",
		"CORTO · MÁS FUERZA": "НЕДОЛЕТ · СИЛЬНЕЕ",
		"LARGO · MENOS FUERZA": "ПЕРЕЛЕТ · СЛАБЕЕ",
		"IZQUIERDA · AJUSTA EL GESTO": "ЛЕВЕЕ · ПОПРАВЬ ВЗМАХ",
		"DERECHA · AJUSTA EL GESTO": "ПРАВЕЕ · ПОПРАВЬ ВЗМАХ",
		"+{0} PUNTOS": "+{0} ОЧК.",
		"{0} PUNTOS · {1}/10": "ОЧКИ: {0} · {1}/10",
		"MEJOR RACHA {0} · LIMPIAS {1}": "ЛУЧШАЯ СЕРИЯ: {0} · ЧИСТЫЕ: {1}",
		"RÉCORD DE SESIÓN": "РЕКОРД СЕССИИ",
		"TIRO FALLADO": "ПРОМАХ",
		"CANASTA DE BASKET": "БАСКЕТБОЛЬНОЕ КОЛЬЦО",
		"RELOJ DE PIE": "НАПОЛЬНЫЕ ЧАСЫ",
		"Canasta con tablero, red y balón. Diez tiros haciendo flick hacia el aro.": "Кольцо со щитом, сеткой и мячом. Десять бросков взмахом к кольцу.",
		"Reloj decorativo de madera con esfera, péndulo y pesas de latón.": "Декоративные деревянные часы с циферблатом, маятником и латунными гирями.",
		"JUGAR BASKET": "ИГРАТЬ В БАСКЕТ",
		"BASKET": "БАСКЕТБОЛ",
		"Toca el balón, haz flick hacia el aro y suelta.": "Коснись мяча, взмахни к кольцу и отпусти.",
		"TIRO {0}/10 · CANASTAS {1}": "БРОСОК {0}/10 · ПОПАДАНИЯ: {1}",
		"Compra una canasta para jugar.": "Купи кольцо, чтобы играть.",
		"DIEZ TIROS · CINCO POSICIONES": "ДЕСЯТЬ БРОСКОВ · ПЯТЬ ТОЧЕК",
		"{0}/10 CANASTAS · MEJOR RACHA {1}": "ПОПАДАНИЯ: {0}/10 · ЛУЧШАЯ СЕРИЯ: {1}",
		"OTRA RONDA": "ЕЩЕ РАУНД",
		"DESLIZA HACIA LA CANASTA": "ВЕДИ ПАЛЬЦЕМ К КОЛЬЦУ",
		"Desliza el balón hacia la canasta. Más rápido, más fuerte.": "Смахни мяч к кольцу. Чем быстрее, тем сильнее.",
		"TOCA EL BALÓN Y LANZA": "КОСНИСЬ МЯЧА И БРОСАЙ",
		"¡CANASTA!": "ПОПАЛ!",
	},
	"pingpong_dedo": {
		"Mueve la raqueta con el dedo sobre la mesa. Toca para sacar.": "Двигай ракетку пальцем по столу. Нажми, чтобы подать.",
		"La raqueta sigue tu dedo. Golpea de lado para dirigir la pelota.": "Ракетка следует за пальцем. Бей краем, чтобы направить мяч.",
	},
	"minijuegos_mandos": {
		"PARTIDA EN CURSO": "ИДЕТ ПАРТИЯ",
		"SUAVE": "ЛЕГКО",
		"EXPERTO": "ЭКСПЕРТ",
		"CONTROL": "КОНТРОЛЬ",
		"ATAQUE": "АТАКА",
		"MEJOR INTERCAMBIO: {0}": "ЛУЧШИЙ РОЗЫГРЫШ: {0}",
		"Centra la pala para atacar; de canto, bloqueas suave.": "Бей серединой ракетки, чтобы атаковать; краем — мягкий удар.",
		"La pelota tocó la red.": "Мяч задел сетку.",
		"La pelota salió de la mesa.": "Мяч не попал на стол.",
		"La pala no llegó a la pelota.": "Ракетка не достала мяч.",
		"La pelota botó dos veces.": "Мяч отскочил дважды.",
		"La pelota botó en el campo propio.": "Мяч отскочил на своей половине.",
		"El saque no botó en ambos campos.": "Подача не коснулась обеих половин.",
		"PUNTO DE PARTIDO": "МАТЧБОЛ",
		"ARRASTRA PARA GIRAR · SUELTA PARA CENTRAR": "ТЯНИ — РУЛЬ · ОТПУСТИ — ПРЯМО",
		"FUERA DEL ASFALTO: VUELVE A LA PISTA": "ВНЕ АСФАЛЬТА: ВЕРНИСЬ НА ТРАССУ",
		"CONTROL {0} · {1} s": "ЧЕКПОИНТ {0} · {1} с",
		"CONTROL PERDIDO · PUEDES REINICIAR EN PAUSA": "ЧЕКПОИНТ ПРОПУЩЕН · РЕСТАРТ В ПАУЗЕ",
		"Avance automático. Arrastra para girar y toca el freno.": "Машина едет сама. Тяни, чтобы рулить, и жми тормоз.",
		"PRÓXIMO CONTROL: {0} m": "ДО ЧЕКПОИНТА: {0} м",
		"META: {0} m": "ФИНИШ: {0} м",
	},


	"clausulas": {
		"NEGOCIAR CLÁUSULAS": "ОБСУДИТЬ УСЛОВИЯ",
		"MANTÉN PARA PRESENTAR": "ЗАЖМИ ДЛЯ ОТПРАВКИ",
		"Hasta {0}.": "До {0}.",
		"ACEPTAN": "СОГЛАСНЫ",
		"CONTRAOFERTA": "КОНТРОФЕРТА",
		"×1": "×1",
		"×1,5": "×1,5",
		"×2": "×2",
		"×3": "×3",
		"NO JUEGAN CON ESE PUESTO": "НЕТ В ИХ СХЕМЕ",
		"SU TITULAR ES MUCHO MEJOR": "ИГРОК ОСНОВЫ КУДА СИЛЬНЕЕ",
		"ESPERAS SU RESPUESTA": "ЖДЕШЬ ИХ ОТВЕТА",
		"YA NEGOCIASTE LAS CLÁUSULAS": "УСЛОВИЯ УЖЕ ОБСУЖДЕНЫ",
		"SIN MESA ABIERTA": "НЕТ ПЕРЕГОВОРОВ",
		"YA NEGOCIASTE ESTE AÑO": "ЛИМИТ НА ГОД ИСЧЕРПАН",
		"Ya negociaste tus cláusulas esta temporada.": "Ты уже обсуждал условия в этом сезоне.",
		"RENOVAR EN AGENTE": "ПРОДЛИТЬ У АГЕНТА",
		"RENEGOCIAR EN AGENTE": "ПЕРЕСМОТР У АГЕНТА",
	},


	"avisos_hoy": {
		"HOY, EL TÍTULO": "ДЕНЬ ТИТУЛА",
		"HOY, EL ASCENSO": "ДЕНЬ ПОВЫШЕНИЯ",
		"HOY, LA SALVACIÓN": "ДЕНЬ СПАСЕНИЯ",
		"GANA Y LO SELLAS": "ПОБЕДА РЕШИТ ВСЕ",
		"UN PUNTO BASTA": "ХВАТИТ НИЧЬЕЙ",
		"COMPRA UN MUEBLE": "КУПИ МЕБЕЛЬ",
		"MIRA QUIÉN TE SIGUE": "КТО ЗА ТОБОЙ СЛЕДИТ",
	},


	"alineaciones": {
		"ALINEACIONES": "СОСТАВЫ",
	},


	"radio": {
		"TEMA DEL JUEGO": "ГЛАВНАЯ ТЕМА",
		"LUCES DEL ESTADIO": "ОГНИ СТАДИОНА",
		"CAMINO A LA GLORIA": "ПУТЬ К СЛАВЕ",
		"DOMINGO DE SOL": "СОЛНЕЧНЫЙ ДЕНЬ",
		"NOCHE LARGA": "ДОЛГАЯ НОЧЬ",
		"SEMANA DE FINAL": "НЕДЕЛЯ ФИНАЛА",
		"VENTANA DE FICHAJES": "ТРАНСФЕРНОЕ ОКНО",
		"LEVANTAR LA COPA": "ПОДНЯТЬ КУБОК",
		"NOCHE DE COPA": "НОЧЬ КУБКА",
		"NOCHE DE ESTRELLAS": "ЗВЕЗДНАЯ НОЧЬ",
		"JUEVES EUROPEO": "ЕВРОЧЕТВЕРГ",
		"CAMINO EUROPEO": "ЕВРОПЕЙСКИЙ ПУТЬ",
		"RADIO": "РАДИО",
		"TOCA PARA CAMBIAR DE TEMA": "НАЖМИ — СЛЕДУЮЩИЙ ТРЕК",
		"AL AZAR": "СЛУЧАЙНО",
		"Cada título que ganes suma su himno a la música del vestuario.": "Каждый выигранный титул добавляет свой гимн в музыку раздевалки.",
		"CAMPO AL AMANECER": "ПОЛЕ НА РАССВЕТЕ",
		"LLUVIA SUAVE": "ТИХИЙ ДОЖДЬ",
		"HIERBA FRESCA": "СВЕЖАЯ ТРАВА",
	},


	"resultado": {
		"SIN GOLES": "БЕЗ ГОЛОВ",
		"PARADA": "СЕЙВ",
		"PARADAS": "СЕЙВЫ",
	},


	"promo": {
		"¿TIENES UN CODIGO?": "ЕСТЬ КОД?",
		"CANJEAR CODIGO": "ВВЕСТИ КОД",
		"Escribe el código tal cual te lo dieron. Cada código se canjea una sola vez en este teléfono.": "Введи код точно так, как его получил. Каждый код можно активировать только один раз на этом телефоне.",
		"TU CODIGO": "ТВОЙ КОД",
		"CANJEAR": "ПОЛУЧИТЬ",
		"COMPROBANDO...": "ПРОВЕРКА...",
		"Escribe un código.": "Введи код.",
		"No encontramos ese código. Si es nuevo, conéctate a internet y vuelve a probar.": "Такой код не найден. Если он новый, подключись к интернету и попробуй снова.",
		"Ese código ya no está activo.": "Этот код больше не действует.",
		"Ese código ya caducó.": "Срок действия кода истек.",
		"Ya canjeaste ese código en este teléfono.": "Ты уже активировал этот код на этом телефоне.",
		"Ese código ya lo canjeó otra persona.": "Этот код уже активировал кто-то другой.",
		"Este código va a una carrera: ábrela y canjéalo desde su tienda.": "Этот код — для карьеры: открой ее и активируй код в ее магазине.",
		"Ese código no existe. Revisa que esté bien escrito.": "Такого кода нет. Проверь, правильно ли он написан.",
		"¡CODIGO CANJEADO!": "КОД АКТИВИРОВАН!",
		"+ {0} ★ EN TU HERENCIA": "+ {0} ★ К НАСЛЕДИЮ",
		"ABIERTA EN TU HERENCIA: {0}": "ОТКРЫТО В НАСЛЕДИИ: {0}",
	},
	"simulador_conduccion": {
		"Compra el simulador en CASA > COCHERA. Incluye un compacto para jugar.": "Купи симулятор в разделе ДОМ > ГАРАЖ. Компактная машина для игры — в комплекте.",
		"Compacto incluido sólo para jugar. Tus compras desbloquean más coches.": "Малолитражка в комплекте — только для гонок. Твои покупки открывают новые машины.",
		"Incluye un compacto para jugar y permite usar tus coches comprados. No gasta dinero ni acciones semanales.": "В комплекте малолитражка для гонок, а еще можно ездить на своих купленных машинах. Не тратит ни денег, ни недельных действий.",
		"Asiento deportivo, volante y tres pantallas. Incluye un compacto virtual; tus compras desbloquean más coches. Sin mantenimiento.": "Гоночное кресло, руль и три экрана. В комплекте виртуальная малолитражка; твои покупки открывают новые машины. Без обслуживания.",
		"AUTO · A/D GIRAR · S FRENAR": "АВТО · A/D РУЛЬ · S ТОРМОЗ",
		"NUEVO RÉCORD DE TIEMPO": "НОВОЕ ЛУЧШЕЕ ВРЕМЯ",
		"Sin récord: faltaron controles.": "Без рекорда: пропущены чекпоинты.",
		"As del volante": "Ас за рулем",
		"Cruzar los tres controles del simulador y llegar antes del tiempo objetivo.": "Пройти все три чекпоинта симулятора и финишировать быстрее целевого времени.",
		"Primera Medalla": "Первая медаль",
		"Sacar el oro en el simulador con el compacto urbano.": "Взять золото в симуляторе на городском хэтчбеке.",
		"Piloto de Domingo": "Воскресный водитель",
		"Terminar 25 vueltas en el simulador.": "Проехать 25 кругов в симуляторе.",
		"Vuelta Limpia": "Чистый круг",
		"Terminar una vuelta del simulador sin salirte nunca del asfalto.": "Проехать круг в симуляторе, ни разу не съехав с асфальта.",
		"Cazamonedas": "Охотник за монетами",
		"Recoger las 72 monedas en una vuelta del simulador.": "Собрать все 72 монеты за один круг в симуляторе.",
		"Pie a Fondo": "Газ в пол",
		"Dar una vuelta con el hiperdeportivo sin tocar el freno ni salirte del asfalto.": "Проехать круг на гиперкаре, не касаясь тормоза и не съезжая с асфальта.",
		"Garaje de Oro": "Золотой гараж",
		"Sacar el oro en el simulador con los ocho coches.": "Взять золото в симуляторе на всех восьми машинах.",
		"MONEDAS {0}/{1} · {2}": "МОНЕТЫ {0}/{1} · {2}",
		"PUNTOS DE ESTA CARRERA": "ОЧКИ ЗА ЭТУ ГОНКУ",
		"CURVA CERRADA: FRENA": "КРУТОЙ ВИРАЖ: ТОРМОЗИ",
		"CONTROLES {0}/3 · OBJETIVO {1} s · MÁX. {2} km/h": "ЧЕКПОИНТЫ {0}/3 · ЦЕЛЬ {1} с · МАКС. {2} км/ч",
		"OBJETIVO CUMPLIDO": "ЦЕЛЬ ДОСТИГНУТА",
		"OBJETIVO PENDIENTE": "ЦЕЛЬ НЕ ДОСТИГНУТА",
		"El coche acelera solo. Mantén un botón para girar y los dos a la vez para frenar.": "Машина разгоняется сама. Удерживай кнопку, чтобы рулить, и обе сразу, чтобы тормозить.",
		"LOS DOS: FRENO": "ОБЕ: ТОРМОЗ",
		"CAMBIAR COCHE": "СМЕНИТЬ МАШИНУ",
		"¡META!": "ФИНИШ!",
		"¡BRONCE!": "БРОНЗА!",
		"¡PLATA!": "СЕРЕБРО!",
		"¡ORO!": "ЗОЛОТО!",
		"MONEDAS {0}/{1}": "МОНЕТЫ {0}/{1}",
		"¡YA!": "МАРШ!",
		"TU RÉCORD: {0} s": "ТВОЙ РЕКОРД: {0} с",
		"SIN RÉCORD TODAVÍA": "РЕКОРДА ПОКА НЕТ",
		"CORRES CONTRA TU FANTASMA": "ГОНКА С ПРИЗРАКОМ",
		"SIGUIENTE MEDALLA: {0} s": "СЛЕДУЮЩАЯ МЕДАЛЬ: {0} с",
		"SIN MEDALLA": "БЕЗ МЕДАЛИ",
		"MEDALLA DE BRONCE": "БРОНЗОВАЯ МЕДАЛЬ",
		"MEDALLA DE PLATA": "СЕРЕБРЯНАЯ МЕДАЛЬ",
		"MEDALLA DE ORO": "ЗОЛОТАЯ МЕДАЛЬ",
	},


	"menu": {
		"SIMULADOR DE CARRERAS": "ГОНОЧНЫЙ СИМУЛЯТОР",
		"Asiento deportivo, volante y tres pantallas. Conduce sólo los coches que has comprado. Sin mantenimiento.": "Гоночное кресло, руль и три экрана. Ездишь только на купленных машинах. Без обслуживания.",
		"Conduce los coches de tu colección. No gasta dinero ni acciones semanales.": "Катайся на машинах из своей коллекции. Не тратит ни денег, ни недельных действий.",
		"CONDUCIR": "ЗА РУЛЬ",
		"SALIR": "ВЫЙТИ",


		"ligaSALIR": "ВЫЙТИ",
		"FRENAR": "ТОРМОЗ",
		"ACELERAR": "ГАЗ",
		"SIN COCHES": "НЕТ МАШИН",
		"OTRA CARRERA": "ЕЩЕ ЗАЕЗД",
		"Sólo tus coches. Sin gastos ni acciones semanales.": "Только твои машины. Без трат и недельных действий.",
		"Compra el simulador y un coche en CASA > COCHERA.": "Купи симулятор и машину в разделе ДОМ > ГАРАЖ.",
		"Llega a la meta. Salir del asfalto te frena.": "Доберись до финиша. Вне асфальта машина теряет скорость.",
		"Mantén ACELERAR y dirige. Flechas o WASD en teclado.": "Держи ГАЗ и рули. На клавиатуре — стрелки или WASD.",
		"META: {0} s · MEJOR DE ESTA SESIÓN: {1} s": "ФИНИШ: {0} с · ЛУЧШЕЕ ЗА СЕССИЮ: {1} с",
		"COCHERA": "ГАРАЖ",
		"COCHES": "МАШИНЫ",
		"La ampliación está ocupada. No se moverá tu construcción.": "Пристройка занята. Твоя постройка останется на месте.",

		"COPIADO · PÉGALO DONDE QUIERAS": "СКОПИРОВАНО · ВСТАВЬ КУДА УГОДНО",

		"NOVEDADES": "ЧТО НОВОГО",
		"VERSIÓN {0}": "ВЕРСИЯ {0}",

		"POTENCIAL": "ПОТЕНЦИАЛ",
		"CONTACTO": "СВЯЗЬ",
		"REDES": "СОЦСЕТИ",
		"CORREO": "ПОЧТА",
		"¿Una idea, un fallo o sólo quieres saludar? Escríbeme directo.": "Есть идея, нашел баг или просто хочешь поздороваться? Пиши мне напрямую.",





		"ESTE ESTADIO NO SABE TU NOMBRE.": "ЭТОТ СТАДИОН НЕ ЗНАЕТ ТВОЕГО ИМЕНИ.",



		"¿CÓMO TE LLAMAS?": "КАК ТЕБЯ ЗОВУТ?",
		"ESO EMPIEZA HOY.": "СЕГОДНЯ УЗНАЕТ.",
		"IDIOMA": "ЯЗЫК",
		"RANURA {0}": "СЛОТ {0}",


		"HOY, DERBI": "ДЕНЬ ДЕРБИ",
		"HOY, DERBI · {0}": "ДЕНЬ ДЕРБИ · {0}",
		"ACTIVA": "АКТИВНА",
		"CONTINUAR": "ПРОДОЛЖИТЬ",
		"VER LEGADO": "НАСЛЕДИЕ",
		"Ranura libre.": "Слот свободен.",
		"+ NUEVA CARRERA": "+ НОВАЯ КАРЬЕРА",
		"{0} AÑOS": "ВОЗРАСТ {0}",
		"SIN CLUB": "БЕЗ КЛУБА",
		"Sin club": "Без клуба",
		"MÁS": "ЕЩЕ",
		"OTRAS RANURAS": "ДРУГИЕ СЛОТЫ",
		"PRÁCTICA": "ТРЕНИРОВКА",
		"AJUSTES": "НАСТРОЙКИ",
		"LOGROS": "НАГРАДЫ",
		"COLECCIÓN": "КОЛЛЕКЦИЯ",
		"EDITOR": "РЕДАКТОР",

		"CLUB Y PAIS": "КЛУБ И СТРАНА",
		"TODOS": "ВСЕ",
		"PENDIENTES": "ЗАКРЫТЫЕ",
		"LOGRADOS": "ОТКРЫТЫЕ",
		"A PUNTO DE CAER": "ПОЧТИ У ЦЕЛИ",



		"{0} % del mundo": "{0} % игроков",
		"Logro secreto. Sigue jugando para descubrirlo.":
			"Секретное достижение. Играй дальше, чтобы его открыть.",

		"Preparando el estadio…": "Готовим стадион…",
		"Cargando…": "Загрузка…",
		"RESTAURAR": "ВЕРНУТЬ",
		"RESTAURAR CARRERA": "ВЕРНУТЬ КАРЬЕРУ",
		"Copias guardadas en iCloud.": "Копии сохранены в iCloud.",
		"No se pudo restaurar la carrera.": "Не удалось восстановить карьеру.",
		"Carrera restaurada.": "Карьера восстановлена.",
		"VERSION MAS NUEVA": "БОЛЕЕ НОВАЯ ВЕРСИЯ",
		"Se jugó después en {0}.": "Позже в нее играли на устройстве {0}.",
		"Se jugó después en otro aparato.": "Позже в нее играли на другом устройстве.",
		"iCLOUD": "iCLOUD",
		"ESTE APARATO": "ЭТО УСТРОЙСТВО",
		"PARTIDO LIBRE": "БЫСТРЫЙ МАТЧ",
		"ELIGE TU EQUIPO": "ВЫБЕРИ КОМАНДУ",
		"ELIGE EL RIVAL": "ВЫБЕРИ СОПЕРНИКА",
		"ELIGE TU JUGADOR": "ВЫБЕРИ ИГРОКА",
		"Amistoso de exhibición · no cuenta para la carrera": "Показательный матч · не идет в зачет карьеры",
		"PRÁCTICA LIBRE": "ТРЕНИРОВКА",
		"RECOMIENDA": "СОВЕТУЕТ",
		"ENCARGO": "ЗАДАНИЕ",
		"DETALLE": "ПОДРОБНО",
		"QUIERE VERTE": "ЖДЕТ ТЕБЯ",
	},



	"compra": {
		"{0} PARTIDOS": "МАТЧИ: {0}",
		"{0} GOLES": "ГОЛЫ: {0}",
		"{0} ASIST": "АСС.: {0}",
		"La App Store no responde. Revisa tu conexión y vuelve a intentarlo.":
			"App Store не отвечает. Проверь подключение и попробуй снова.",
		"Google Play no responde. Revisa tu conexión y vuelve a intentarlo.":
			"Google Play не отвечает. Проверь подключение и попробуй снова.",
		"Tu pago quedó pendiente: lo recibirás en cuanto se confirme.":
			"Платеж в обработке: покупка придет, как только он подтвердится.",
		"Listo: ya recuperaste lo que habías comprado con esta cuenta de Google.":
			"Готово: ты вернул все, что покупал с этим аккаунтом Google.",
		"Esta cuenta de Google no tiene compras que recuperar en Football Legacy.":
			"У этого аккаунта Google нет покупок в Football Legacy для восстановления.",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu cuenta de Google.":
			"Это оплачивается РЕАЛЬНЫМИ ДЕНЬГАМИ, а не игровыми: сумма спишется с твоего аккаунта Google.",
		"GOOGLE PLAY":
			"GOOGLE PLAY",
		"Este aparato no tiene permitidas las compras.":
			"На этом устройстве покупки запрещены.",

		"No se pudo completar la compra.": "Не удалось завершить покупку.",
		"Apple rechazó el pago.": "Apple отклонила платеж.",
		"La compra no está disponible en tu región.":
			"Эта покупка недоступна в твоем регионе.",
		"No hay conexión con la App Store.": "Нет связи с App Store.",
		"No se pudo verificar la compra con Apple. Se reintentará al volver a abrir el juego.":
			"Apple не удалось проверить покупку. Попробуем снова, когда ты откроешь игру.",
	},










	"hub": {

		"SANCIONADO · {0} {1} DE CASTIGO": "ДИСКВАЛИФИКАЦИЯ · {0} {1}",

		"FORMA": "ФОРМА",



		"ovrMEDIA": "OVR",
		"NIVEL": "УРОВЕНЬ",
		"DINERO": "ДЕНЬГИ",
		"TEMPORADA": "СЕЗОН",
		"{0} · {1} AÑOS": "{0} · ВОЗР. {1}",
		"AGENTE LIBRE · {0} AÑOS": "БЕЗ КЛУБА · ВОЗР. {0}",
		"ENERGÍA {0}%": "ЭНЕРГИЯ {0}%",

		"NO CONVOCADO": "НЕ В ЗАЯВКЕ",
		"BANQUILLO": "В ЗАПАСЕ",
		"YA NO QUEDAN CAMBIOS": "ЗАМЕН БОЛЬШЕ НЕТ",
		"SE VA {0}": "УХОДИТ {0}",
		"¡PARADÓN DE {0}!": "ВОТ ЭТО СЕЙВ: {0}!",
		"{0} SE ESTIRA Y LA SACA": "{0} ТЯНЕТСЯ И ВЫБИВАЕТ",
		"LA ATAJA {0}": "{0} ЗАБИРАЕТ",
		"SE SALVA EL PORTERO": "ВРАТАРЬ СПАСАЕТ",
		"PARADAS EN EL PARTIDO": "СЕЙВЫ В МАТЧЕ",
		"asistA": "А",
		"PLANTILLAS": "СОСТАВЫ",
		"RELATO": "РЕПОРТАЖ",
		"OVR": "OVR",
		"ROTACIÓN": "РОТАЦИЯ",
		"TITULAR": "ОСНОВА",
		"INDISCUTIBLE": "НЕЗАМЕНИМЫЙ",

		"AGENTE LIBRE": "БЕЗ КЛУБА",
		"ELIGE CLUB": "ВЫБЕРИ КЛУБ",
		"TE VENDEN": "ТЕБЯ ПРОДАЮТ",
		"RESPONDE YA": "ЖДУТ ОТВЕТА",
		"EN VENTA": "НА ПРОДАЖЕ",
		"ESPERANDO OFERTAS": "ЖДЕМ ПРЕДЛОЖЕНИЙ",
		"CIERRA HOY": "СЕГОДНЯ КОНЕЦ",
		"CIERRA EN {0}J": "ЕЩЕ {0} ТУР.",
		"MERCADO CERRADO": "ОКНО ЗАКРЫТО",
		"ABRE EN {0}J": "ЧЕРЕЗ {0} ТУР.",
		"PRÓXIMA TEMPORADA": "СЛЕДУЮЩИЙ СЕЗОН",

		"MERCADO DE VERANO": "ЛЕТНЕЕ ОКНО",
		"MERCADO DE INVIERNO": "ЗИМНЕЕ ОКНО",
		"VERANO": "ЛЕТО",
		"INVIERNO": "ЗИМА",

		"BUZON": "ПОЧТА",
		"{0} NUEVOS": "НОВЫХ: {0}",
		"AL DIA": "ПРОЧИТАНО",
		"Elige tu próximo club": "Выбери следующий клуб",
		"¡TE BUSCAN!": "ТЕБЯ ХОТЯТ!",
		"PLANTEL": "СОСТАВ",
		"PERFIL": "ПРОФИЛЬ",
		"CONTRATO": "КОНТРАКТ",
		"MERCADO": "РЫНОК",
		"TIENDA": "МАГАЗИН",
		"ASPECTO": "ВНЕШНОСТЬ",
		"CASUAL": "КЭЖУАЛ",
		"Tu ropa de calle. La eliges tú.": "Твоя уличная одежда. Выбираешь ты.",
		"Eres el mismo con las dos ropas.": "В любой одежде ты тот же самый.",
		"{0} · el uniforme es el de tu club.":
			"{0} · форма твоего клуба.",



		"RELACIONES": "ОТНОШЕНИЯ",

		"Para el próximo: {0}, ~{1}'.": "На следующий матч: {0}, ~{1}'.",
		"El balón te llega ~{0} veces por partido.":
			"Касаний мяча за матч: ~{0}.",
		"El balón te llega ~{0} vez por partido.":
			"Касаний мяча за матч: ~{0}.",
		"Vales ${0} en el mercado.": "Твоя стоимость на рынке: ${0}.",



		"famaDESCONOCIDO": "НЕИЗВЕСТЕН",
		"famaLOCAL": "МЕСТНЫЙ",
		"famaCONOCIDO": "ИЗВЕСТЕН",
		"famaCARA CONOCIDA": "ЗНАМЕНИТ",
		"famaESTRELLA": "ЗВЕЗДА",
		"{0} de {1} marcas te pueden ofertar.": "{0} из {1} брендов могут сделать тебе предложение.",
		"Y 1 ya te queda chica.": "А одну ты уже перерос.",
		"Y {0} ya te quedan chicas.": "А {0} ты уже перерос.",
		"Estrella: esta temporada aguantas {0} partidos flojos sin que te olviden. Por debajo de {1} dejas de serlo.": "Звезда: слабых матчей, которые тебе еще простят в этом сезоне: {0}. Опустишься ниже {1} — перестанешь быть звездой.",
		"Estrella: esta temporada aguantas 1 partido flojo sin que te olviden. Por debajo de {0} dejas de serlo.": "Звезда: в этом сезоне тебе простят еще один слабый матч. Опустишься ниже {0} — перестанешь быть звездой.",
		"Estrella: esta temporada ya te están olvidando. Por debajo de {0} dejas de serlo.": "Звезда: в этом сезоне тебя уже начинают забывать. Опустишься ниже {0} — перестанешь быть звездой.",
		"Sólo te llama una: te falta nombre. Con más prensa te llaman hasta tres.": "Звонит только один: тебе не хватает имени. Чем больше прессы, тем больше звонков — до трех.",
		"PUJA CON {0}: +{1} %": "БОРЬБА С КЛУБОМ {0}: +{1} %",
		"Te saca +{0} de sueldo en cada oferta. Tócalo para darle un encargo.":
			"Выбивает тебе +{0} к зарплате в каждом предложении. Нажми на него, чтобы дать ему задание.",
		"TUS RELACIONES": "ТВОИ ЛЮДИ",
		"TORNEOS": "ТУРНИРЫ",

		"CALENDARIO": "КАЛЕНДАРЬ",


		"CLASIF {0}": "ОТБОР {0}",
		"La temporada aún no tiene calendario.":
			"У сезона пока нет календаря.",

		"RANKING": "РЕЙТИНГ",
		"RANKING DE JUGADORES": "РЕЙТИНГ ИГРОКОВ",
		"Los jugadores de 1ª división del mundo, ordenados por su media."
			+ " Tú entras en la misma lista.":
			"Игроки высших лиг со всего мира по рейтингу. Ты тоже в этом списке.",
		"Ningún jugador cumple estos filtros. Prueba a soltar alguno.":
			"Под эти фильтры никто не подходит. Попробуй снять какой-нибудь.",
		"Ahora mismo no hay nadie sin club. La bolsa se llena al cerrar cada ventana de mercado.":
			"Сейчас нет игроков без клуба. Список пополняется после закрытия каждого трансферного окна.",
		"TU SITIO: {0}° DE {1}": "ТВОЕ МЕСТО: {0} ИЗ {1}",
		"A {0} de media del {1}°": "Отставание от №{1}: {0}",
		"IR A MI FILA": "К МОЕЙ СТРОКЕ",
		"MARCADOS": "ОТМЕЧЕННЫЕ",
		"TODO": "ВСЕ",
		"PAÍS": "СТРАНА",
		"PORTEROS": "ВРАТАРИ",
		"DEFENSAS": "ЗАЩИТНИКИ",
		"MEDIOS": "ПОЛУЗАЩИТНИКИ",
		"DELANTEROS": "НАПАДАЮЩИЕ",
		"FILTRAR POR PUESTO": "ФИЛЬТР ПО ПОЗИЦИИ",
		"FILTRAR POR EDAD": "ФИЛЬТР ПО ВОЗРАСТУ",
		"FILTRAR POR VALOR": "ФИЛЬТР ПО СТОИМОСТИ",
		"DIVISIÓN": "ДИВИЗИОН",
		"FILTRAR POR LIGA": "ФИЛЬТР ПО ЛИГЕ",
		"FILTRAR POR DIVISIÓN": "ФИЛЬТР ПО ДИВИЗИОНУ",
		"Los jugadores del mundo, por liga y división, ordenados por su media. Tú entras en la misma lista.": "Игроки со всего мира по лигам и дивизионам, по рейтингу. Ты в том же списке.",
		"{0} PUESTOS": "ПОЗИЦИИ: {0}",
		"FILTRAR POR PAÍS": "ФИЛЬТР ПО СТРАНЕ",
		"FILTRAR POR BANQUILLO": "ФИЛЬТР ПО СКАМЕЙКЕ",
		"FILTRAR POR ESTRELLAS": "ФИЛЬТР ПО ЗВЕЗДАМ",
		"FILTRAR POR IDEA": "ФИЛЬТР ПО СТИЛЮ",
		"IDEA": "СТИЛЬ",
		"Ningún técnico cumple estos filtros.": "Под эти фильтры не подходит ни один тренер.",
		"{0}-{1} DE {2}": "{0}-{1} ИЗ {2}",
		"ANTERIOR": "НАЗАД",
		"PALMARÉS": "ТИТУЛЫ",
		"LEYENDAS": "ЛЕГЕНДЫ",
		"SELECCIÓN": "СБОРНАЯ",
		"VITRINA": "ТРОФЕИ",



		"HISTORIA": "ИСТОРИЯ",
		"LEGADO": "НАСЛЕДИЕ",



		"ABIERTO · {0}J": "ОТКРЫТ: {0} ТУР.",
		"EN VENTA · {0} OFERTAS": "НА ПРОДАЖЕ · {0} ПРЕДЛ.",

		"CLUBES Y LEYENDAS": "КЛУБЫ И ЛЕГЕНДЫ",
		"JUGADOR DEL ANO · {0}": "ИГРОК ГОДА · {0}",
		"{0} PUNTOS": "{0} ОЧК.",
		"TOPE {0}": "МАКС. {0}",
		"NIVEL {0}": "УРОВЕНЬ {0}",
		"SIN CONTRATO": "БЕЗ КОНТРАКТА",
		"ÚLTIMO AÑO": "ГОД ДО КОНЦА",
		"{0} TEMPORADAS": "{0} СЕЗ.",

		"1 TEMPORADA": "1 СЕЗОН",
		"{0}% SOBRE TU SUELDO": "{0}% СВЕРХ ЗАРПЛАТЫ",

		"PEDIR UN POCO": "ПРОСИТЬ НЕМНОГО",
		"PEDIR MUCHO": "ПРОСИТЬ МНОГО",
		"+{0} si acepta": "+{0}, если согласится",
		"ROMPER EL HIELO": "РАСТОПИТЬ ЛЕД",
		"YA ROMPISTE EL HIELO": "ЛЕД УЖЕ РАСТОПЛЕН",
		"Hablan de otra cosa un rato · SE RELAJA":
			"Немного болтаете о другом · ОН СМЯГЧАЕТСЯ",
		"EL DURO": "ЖЕСТКИЙ",
		"EL AMABLE": "ДОБРЯК",
		"EL SUSCEPTIBLE": "ОБИДЧИВЫЙ",
		"EL PACIENTE": "ТЕРПЕЛИВЫЙ",

		"SU HUMOR": "НАСТРОЕНИЕ",
		"DE BUENAS": "В ХОРОШЕМ ДУХЕ",
		"SE LO PIENSA": "ПРИКИДЫВАЕТ",
		"IMPACIENTE": "ТЕРЯЕТ ТЕРПЕНИЕ",
		"HARTO": "ЗЛИТСЯ",
		"TE CEDEN": "В АРЕНДУ",
		"{0} OFERTAS": "{0} ПРЕДЛ.",
		"{0} DESTINO": "{0} ВАРИАНТ",
		"{0} DESTINOS": "ВАРИАНТЫ: {0}",
		"CERRADO": "ЗАКРЫТ",
		"SIN OFERTAS · {0}J": "НЕТ ПРЕДЛ. · {0} ТУР.",
		"{0} OFERTAS · {1}J": "{0} ПРЕДЛ. · {1} ТУР.",


		"CIERRA HOY · {0} OFERTAS": "СЕГОДНЯ КОНЕЦ · {0} ПРЕДЛ.",
		"{0} OFERTAS SOBRE LA MESA": "ПРЕДЛОЖЕНИЙ НА СТОЛЕ: {0}",

		"MEJORA": "ПРИБАВКА",
		"TU CLUB TE LA OFRECE": "КЛУБ ПРЕДЛАГАЕТ",
		"TU CLUB TE MEJORA": "КЛУБ ДАЕТ БОЛЬШЕ",
		"Se adelanta a los que vienen a por ti.": "Клуб действует на опережение, пока за тобой не пришли другие.",
		"EL MEJOR QUE TRAJISTE": "ТВОЙ ЛУЧШИЙ НОВИЧОК",
		"{0} partidos · nota {1}": "Матчи: {0} · оценка {1}",
		"EL TECNICO PIDE": "ТРЕНЕР ПРОСИТ",
		"Si fichan a uno de esa línea: +{0} % de que salga y el técnico te lo apunta.": "Если подпишут игрока на эту линию: +{0} % к шансу, и тренер тебе это зачтет.",
		"Ya le trajiste uno: te lo apunta.": "Ты уже привел одного: зачтено.",
		"Lo pide el técnico: sale más fácil": "Просит тренер: подписать проще",
		"SUBIR": "ВЫШЕ",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede. SUBIR cambia el orden.": "Идут по порядку: если один подпишет, остальные торгуются на остаток. ВЫШЕ меняет порядок.",
		"PAGAR LO QUE PIDEN": "ПЛАТИТЬ ИХ ЦЕНУ",
		"REGATEAR -{0} %": "СБИТЬ ЦЕНУ -{0} %",
		"MANDAR OJEADOR ({0})": "ПОСЛАТЬ СКАУТА ({0})",
		"Ojeado: el club ya se fía de él.": "Просмотрен: теперь клуб ему доверяет.",
		"QUITAR DE LA VENTA": "СНЯТЬ С ПРОДАЖИ",
		"PONER EN VENTA": "НА ПРОДАЖУ",
		"En venta: en la próxima ventana se ofrece a un club de su nivel, un {0} % por debajo de su valor.": "На продаже: в следующее окно его предложат клубу его уровня на {0} % дешевле стоимости.",
		"Ya tienes {0} en venta.": "У тебя уже на продаже: {0}.",
		"Se ofrecen al abrir la ventana a clubes de su nivel, un {0} % por debajo de su valor. Se quitan desde su ficha.": "Их предлагают клубам их уровня при открытии окна, на {0} % дешевле стоимости. Снять можно в карточке игрока.",
		"No vendría a tu club: no casa con su categoría.": "Он не пойдет в твой клуб: не его уровень.",
		"RETIRAR LA PETICION": "ОТОЗВАТЬ ЗАПРОС",
		"SI DICE QUE NO, TU TÉCNICO LO SABE": "ЕСЛИ ОТКАЖУТ, ТРЕНЕР УЗНАЕТ",
		"PETICIONES": "ЗАПРОСЫ",
		"TODAVÍA NADA": "ПОКА НИЧЕГО",
		"TU TÉCNICO CUMPLE": "ТРЕНЕР СПРАВЛЯЕТСЯ",
		"DE TUS {0} MEJORES": "В ТОП-{0} КОМАНДЫ",
		"SUPLENTE Y CLUB EN APURO": "ЗАПАСНОЙ, КЛУБ В БЕДЕ",
		"VETERANO SUPLENTE": "ВЕТЕРАН В ЗАПАСЕ",
		"DEJAS LA CAJA VACIA": "ОПУСТОШИШЬ КАССУ",
		"NADIE PARA TU PUESTO": "НЕКЕМ ЗАМЕНИТЬ",
		"VAS EN RACHA": "ТЫ НА ПОДЪЕМЕ",
		"Si te lo cede: -{0} con el vestuario.": "Если уступит: -{0} в раздевалке.",
		"Se lo pediste al club: {0} % de que lo traiga en la próxima ventana de técnicos.": "Ты попросил клуб: шанс {0} %, что его приведут в следующее тренерское окно.",
		"El club lo decide en la próxima ventana de técnicos (invierno o final de temporada). Si dice que no, tu técnico se entera.": "Клуб решит в следующее тренерское окно (зимой или в конце сезона). Если откажет, твой тренер узнает.",
		"El club te hizo caso: llegó {0}.": "Клуб тебя послушал: пришел {0}.",
		"El club dijo que no a {0}, y tu técnico se enteró.": "Клуб отказал по кандидатуре {0}, и твой тренер об этом узнал.",
		"El club cambió de técnico, pero no trajo a {0}.": "Клуб сменил тренера, но {0} так и не пришел.",
		"{0} ya no estaba a tu alcance.": "{0} уже был недосягаем.",
		"¿Otro técnico? Pídelo desde su ficha, en {0}, pestaña {1}.": "Другой тренер? Попроси его в карточке: {0}, вкладка {1}.",
		"PEDISTE A": "ТЫ ПРОСИЛ",
		"QUE LO TRAIGAN": "ШАНС ПРИХОДА",
		"QUE LO ECHEN": "ШАНС ОТСТАВКИ",
		"ENCAJA": "ПОДХОДИТ",
		"NO ENCAJA": "НЕ ПОДХОДИТ",
		"CUMPLE SUS METAS": "ВЫПОЛНЯЕТ ЦЕЛИ",
		"PEDIR QUE LO ECHEN": "ПРОСИТЬ УВОЛЬНЕНИЯ",
		"ELEGIR QUIÉN VIENE · NIVEL {0}": "ВЫБРАТЬ ЗАМЕНУ · УРОВЕНЬ {0}",
		"{0} · FUERA": "{0} · УХОДИТ",
		"{0} SIN VICTORIA": "БЕЗ ПОБЕД: {0}",
		"El club te hace caso: destituye al técnico": "Клуб тебя послушал: тренер уволен",
		"Se decide en la próxima ventana de técnicos: la de invierno o el final de la temporada. Si dice que no, tu técnico se entera.": "Решится в следующее тренерское окно: зимой или в конце сезона. Если откажут, твой тренер узнает.",
		"El club te hace caso: llega {0} al banquillo": "Клуб тебя послушал: новый тренер — {0}",
		"NO LO VENDAIS": "НЕ ПРОДАВАТЬ",
		"QUITAR PROTECCION": "СНЯТЬ ЗАЩИТУ",
		"Protegido: el club no lo vende ni lo cede y pide el doble por él. Si lo pagan, se va igual; cada ventana en que rechace ofertas te quita {0} de relación.": "Под защитой: клуб не продает его и не отдает в аренду, а просит за него вдвое больше. Если заплатят, он все равно уйдет; каждое окно, в которое клуб отклоняет предложения, стоит тебе {0} отношений.",
		"QUE LO RENUEVEN": "ПРОДЛИТЬ ЕГО",
		"Se decide en la próxima ventana de contratos.": "Решится в следующее окно контрактов.",
		"Pedido: {0} % de que renueve en la próxima ventana de contratos.": "Запрошено: шанс {0} %, что он продлит контракт в следующее окно контрактов.",
		"Si lo pides: {0} % de que renueve.": "Если попросишь: шанс продления {0} %.",
		"Ya pides {0} renovaciones.": "Ты уже просишь продлений: {0}.",
		"INTOCABLE": "ПОД ЗАЩИТОЙ",
		"PROTEGES A": "ТЫ ЗАЩИЩАЕШЬ",
		"Pagaron el doble ({2}) y {0} se fue a {1}.": "Заплатили вдвое ({2}), и {0} ушел в клуб {1}.",
		"El club rechazó {0} de {1} por {2}.": "Клуб отклонил предложение {0} от клуба {1} за игрока {2}.",
		"Te cuesta {0} de relación hasta final de temporada.": "Это стоит тебе {0} отношений до конца сезона.",
		"RENOVACIONES": "ПРОДЛЕНИЯ",
		"{0} renovo.": "{0} продлил контракт.",
		"El club no quiso renovar a {0}.": "Клуб не захотел продлевать контракт с игроком {0}.",
		"{0} no quiso renovar.": "{0} не захотел продлевать контракт.",
		"{0} ya había firmado con otro club.": "{0} уже подписал контракт с другим клубом.",
		"PIDE UN PUESTO": "ЗАПРОСИТЬ ПОЗИЦИЮ",
		"El club busca un {0}: va a por {1}.": "Клуб ищет игрока на позицию {0}: цель — {1}.",
		"Tú pides el puesto y el club elige a quién: sale más a menudo y, si se cae, prueba con otro. Gasta una recomendación.": "Ты просишь позицию, а клуб выбирает игрока: так получается чаще, а если сорвется, пробуют другого. Тратит одну рекомендацию.",
		"No te quedan recomendaciones esta temporada.": "У тебя не осталось рекомендаций в этом сезоне.",
		"Ya hay un puesto pedido.": "Позиция уже запрошена.",
		"El club no encuentra a nadie mejor para ese puesto.": "Клуб не нашел никого лучше на эту позицию.",
		"VENTANAS ANTERIORES": "ПРОШЛЫЕ ОКНА",
		"Gastado {0} · ventas {1}": "Потрачено {0} · продажи {1}",
		"RENOVACIÓN SOBRE LA MESA": "ПРОДЛЕНИЕ НА СТОЛЕ",
		"SALDRÁS LIBRE AL CIERRE": "УЙДЕШЬ СВОБОДНЫМ АГЕНТОМ",
		"ABIERTO · {0} FICHAJES": "ОТКРЫТ · СДЕЛОК: {0}",
		"OBJETIVO": "ЦЕЛЬ",
		"VAS CORTO": "ОТСТАЕШЬ",
		"{0} DE {1} · VAS CORTO": "{0} ИЗ {1} · ОТСТАЕШЬ",
		"RÉCORD A LA VISTA": "РЕКОРД БЛИЗКО",
		"A {0} {1} DEL LIBRO": "ДО РЕКОРДА: {0} {1}",
		"GOL": "ГОЛ",


		"ESTA TEMPORADA POR TORNEO": "СЕЗОН ПО ТУРНИРАМ",
		"TORNEO": "ТУРНИР",
		"CHAMPIONS": "КУБОК ЭЛИТЫ",
		"EUROPA": "ЕВРОПА",
		"CONFERENCE": "ЧЕЛЛЕНДЖ",
		"MUNDIALITO": "КЛУБНЫЙ ЧМ",
		"{0} OFERTAS · {1} EXPIRA HOY": "{0} ПРЕДЛ. · {1} ИСТЕКАЕТ СЕГОДНЯ",
		"{0} OFERTAS · {1} EXPIRAN HOY": "{0} ПРЕДЛ. · {1} ИСТЕКАЮТ СЕГОДНЯ",
		"NEGOCIACIÓN": "ПЕРЕГОВОРЫ",
		"{0} CLUBES RESPONDIERON": "ОТВЕТИЛИ КЛУБЫ: {0}",


		"{0} TE BUSCAN · YA": "ЗОВУТ: {0} · СРОЧНО",
		"{0} MARCAS": "БРЕНДЫ: {0}",
		"SIN JUGAR": "БЕЗ ИГР",
		"{0} EN LIGA": "{0} В ЛИГЕ",
		"CONVOCADO": "ВЫЗВАН",


		"seleccionFUERA": "ВНЕ",
		"{0} TROFEOS": "ТРОФЕИ: {0}",
		"{0} GOLES": "ГОЛЫ: {0}",

		"TIENES {0} {1} SIN REPARTIR": "НЕ ПОТРАЧЕНО: {0} {1}",
		"SEMANA · {0} DE {1} ACCIONES": "НЕДЕЛЯ · ДЕЙСТВИЯ {0} ИЗ {1}",




		"previaGANAS": "ПОБЕДА",
		"previaEMPATE": "НИЧЬЯ",
		"previaPIERDES": "ПОРАЖЕНИЕ",
		"iniV": "В",
		"iniE": "Н",
		"iniD": "П",




		"SUBIR HABILIDADES · {0}": "ПРОКАЧАТЬ НАВЫКИ · {0}",
		"SIN PUNTOS": "НЕТ ОЧКОВ",
		"PERSONALIZAR": "НАСТРОИТЬ",
		"MENÚ": "МЕНЮ",

		"ELEGIR CLUB": "ВЫБРАТЬ КЛУБ",
		"LESIONADO · VER LA JORNADA": "ТРАВМА · СМОТРЕТЬ ТУР",
		"LESIONADO · {0} {1} DE BAJA": "ТРАВМА · ВЫБЫЛ НА {0} {1}",
		"YA USADA": "ИСПОЛЬЗОВАНО",
		"{0} {1} DE BAJA": "ВЫБЫЛ НА {0} {1}",

		"ALTA MÉDICA": "ДОПУЩЕН К ИГРЕ",
		"VUELVES AL EQUIPO": "СНОВА В КОМАНДЕ",
		"PARTIDOS PERDIDOS": "ПРОПУЩЕНО МАТЧЕЙ",
		"El cuerpo aguantó. El puesto no se guardó solo: ahora hay que "
		+ "ganárselo otra vez.":
			"Тело выдержало. А место в составе само не сохранилось: теперь его надо заслужить снова.",
		"LA TEMPORADA, EN EL AIRE": "СЕЗОН ПОД ВОПРОСОМ",
		"MESES FUERA": "МЕС. ВНЕ ИГРЫ",
		"BAJA LARGA": "ДОЛГИЙ ПРОСТОЙ",
		"TE PIERDES LO QUE VIENE": "ПРОПУСТИШЬ ВАЖНОЕ",
		"SEMANAS DE BAJA": "НЕДЕЛЬ ВНЕ ИГРЫ",
		"{0} SEMANAS DE BAJA": "ВНЕ ИГРЫ: {0} НЕД.",
		"Vuelves cuando el cuerpo diga. Mientras tanto el equipo juega sin ti "
		+ "y el puesto no se guarda solo.":
			"Вернешься, когда позволит тело. А пока команда играет без тебя, и место само не сохранится.",
		"Esta baja ya te costó {0} {1}": "Эта травма уже стоила тебе {0} {1}",
		"SIMULAR {0}": "СИМУЛЯЦИЯ {0}",
		"JUGAR CON TU SELECCIÓN": "ИГРАТЬ ЗА СБОРНУЮ",
		"FECHA DE SELECCIONES": "ПАУЗА НА СБОРНЫЕ",
		"FECHA DE SELECCIONES · SALES DE TITULAR": "ПАУЗА НА СБОРНЫЕ · В ОСНОВЕ",
		"FECHA DE SELECCIONES · ENTRAS DESDE LA BANCA": "ПАУЗА НА СБОРНЫЕ · СО СКАМЕЙКИ",
		"VER EL PARTIDO": "СМОТРЕТЬ МАТЧ",
		"JUGAR PARTIDO": "ИГРАТЬ МАТЧ",
		"MANTENER PARA PASAR A FIN DE TEMPORADA": "ЗАЖМИ, ЧТОБЫ ЗАВЕРШИТЬ СЕЗОН",
		"LA TEMPORADA HA TERMINADO": "СЕЗОН ЗАВЕРШЕН",

		"TE LO PERDISTE LESIONADO": "ПРОПУСТИЛ ИЗ-ЗА ТРАВМЫ",
		"TE VE FLOJO DE": "СЛАБОЕ МЕСТО",
		"NO CONVOCADO · TE VE FLOJO DE {0}": "НЕ В ЗАЯВКЕ · СЛАБОЕ МЕСТО: {0}",
		"EL MÍSTER TE PIDE ALGO": "У ТРЕНЕРА ЕСТЬ ЗАДАНИЕ",
		"NO TE CONVOCARON": "ТЕБЯ НЕ ВЫЗВАЛИ",
		"Algo es algo.": "Хоть что-то.",
		"Aprovecha para entrenar e impresionar al míster.": "Используй это время, чтобы потренироваться и впечатлить тренера.",
		"Porterías chiquitas": "Мини-ворота",
		"Métela en la portería pequeña, no en la grande. Cada balón sale de más lejos.": "Забей в маленькие ворота, а не в большие. Каждый следующий мяч — все дальше.",
		"Jala y suelta a la portería pequeña": "Оттяни и отпусти в маленькие ворота",
		"Rompe las dianas": "Разбей мишени",
		"Eslalon con rival": "Слалом с опекуном",
		"OTRO BALÓN": "ЕЩЕ МЯЧ",
		"Pisa los conos con el balón. El chico paga el triple, pero está del lado del que te marca.": "Наступи мячом на фишки. Маленькая дает втрое больше, но стоит со стороны опекуна.",
		"Arrastra para conducir; no se tira": "Тяни, чтобы вести мяч; бить нельзя",
		"Rompe las dianas del arco. La chiquita de arriba paga el triple que la gorda de abajo.": "Разбей мишени в воротах. Маленькая вверху дает втрое больше, чем большая внизу.",
		"Jala y suelta a una diana": "Оттяни и отпусти в мишень",
		"TU RÉCORD": "ТВОЙ РЕКОРД",
		"NUEVO RÉCORD": "НОВЫЙ РЕКОРД",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario distinto. Aquí no se juega nada de la carrera — el que cuenta es EL ENCARGO DEL MÍSTER, y ése sale la jornada que no te convocan. Se sale con PAUSA.": "Выбери упражнение и повторяй сколько хочешь: каждая попытка — новый сценарий. Здесь ничего не идет в зачет карьеры — в зачет идет ЗАДАНИЕ ТРЕНЕРА, а оно появляется в тот тур, когда тебя не вызвали. Выход — через ПАУЗУ.",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada de esto cuenta para la carrera — el que cuenta es EL ENCARGO DEL MÍSTER. Se sale con PAUSA.": "Выбери эпизод и повторяй сколько хочешь: каждая попытка — новый сценарий этого типа. Ничего из этого не идет в зачет карьеры — в зачет идет ЗАДАНИЕ ТРЕНЕРА. Выход — через ПАУЗУ.",
		"Ya te vio cumplir. Ahora te pide más.": "Он уже видел, что ты справляешься. Теперь хочет большего.",
		"EL MÍSTER TE MIRA EN": "ТРЕНЕР ОЦЕНИТ",
		"LA PRÓXIMA": "СЛЕДУЮЩЕЕ",
		"TE VE FLOJO DE {0}": "СЛАБОЕ МЕСТО: {0}",
		"LA META": "ЦЕЛЬ",
		"COMPLETA EL CIRCUITO": "ПРОЙДИ ТРАССУ",
		"EL PRECIO": "ЦЕНА",
		"-{0} ENERGÍA": "-{0} ЭНЕРГИИ",
		"CUMPLIR EL ENCARGO": "ВЫПОЛНИТЬ ЗАДАНИЕ",
		"SOLO SIMULAR": "СИМУЛИРОВАТЬ",
		"EL ENCARGO": "ЗАДАНИЕ",
		"NO LLEGASTE": "НЕ ДОТЯНУЛ",
		"Así sí. El sábado te veo en la lista.": "Вот это дело. В субботу ты в заявке.",
		"Otra semana igual y no.": "Еще одна такая неделя — и все.",
		"EL PRÓXIMO": "СЛЕДУЮЩИЙ",
		"SIGUES FUERA": "ЗА БОРТОМ",
		"TE DAN DESCANSO": "ДАЛИ ОТДЫХ",
		"Te llegan balones y no los defines": "Мячи до тебя доходят, а ты не реализуешь моменты",
		"Le pegas flojo": "Бьешь слабо",
		"No sabes curvarla": "Не умеешь закручивать",
		"No me das confianza desde los once": "С точки ты мне доверия не внушаешь",
		"Los balones parados los tira otro": "Стандарты бьет другой",
		"El primero que te sale te come": "Первый же защитник тебя съедает",
		"NO FUISTE CONVOCADO": "ТЕБЯ НЕ ВЫЗВАЛИ",
		"{0} ganó sin ti": "{0}: победа без тебя",
		"Tu selección": "Твоя сборная",
		"Tu equipo": "Твоя команда",
		"Empató sin ti": "Ничья без тебя",
		"Perdió sin ti": "Поражение без тебя",
		"Recuperado: vuelves el próximo partido": "Восстановился: вернешься в следующем матче",
		"Te quedan {0} {1} de baja": "До конца травмы: {0} {1}",
		"Sin goles": "Без голов",
		"TU EQUIPO": "ТВОЙ КЛУБ",
		"Gol": "Гол",


		"A puerta": "В створ",
		"Fuera del marco": "Мимо створа",
		"Tapado": "Заблокирован",

		"SIN TIEMPO ESTA SEMANA": "НА НЕДЕЛЕ НЕТ ВРЕМЕНИ",
		"NO TE ALCANZA": "НЕ ПО КАРМАНУ",
		"LO PIENSO": "ПОДУМАЮ",
		"ANTES DEL MERCADO": "ДО ОТКРЫТИЯ ОКНА",
		"DESPUÉS DEL PARTIDO": "ПОСЛЕ МАТЧА",
		"CÓMO QUEDAN LAS COSAS": "КАК ОБСТОЯТ ДЕЛА",
		"TU DECISIÓN": "ТВОЕ РЕШЕНИЕ",
		"otro club": "другой клуб",
		"Un intermediario te susurra que al {0} le gustas. Si dices que te interesaría, "
		+ "puede que oferten por ti en el mercado… pero en tu club no te lo perdonarán.":
			"Посредник шепчет, что ты нравишься клубу {0}. Скажешь, что тебе интересно, — и за тебя могут предложить деньги в трансферное окно… но в твоем клубе этого не простят.",

		"Técnico": "Тренер",
		"Vestuario": "Раздевалка",

		"SOCIEDAD": "СВЯЗКА",


		"YA JUGASTEIS JUNTOS EN {0}": "ВЫ ИГРАЛИ ВМЕСТЕ: {0}",
		"TAMBIÉN PASÓ POR {0}": "ТОЖЕ ИГРАЛ В КЛУБЕ {0}",
		"VIENE DE {0}, TU RIVAL": "ИЗ КЛУБА-СОПЕРНИКА {0}",


		"SOCIO": "ПАРТНЕР",

		"SÓLO CABE UNO": "ЛИШЬ ОДНО МЕСТО",
		"SABES DÓNDE ESTUVO": "ТЫ ЗНАЕШЬ, ГДЕ ОН БЫЛ",
		"{0} salió la víspera y lo sabes tú solo. El míster acaba de preguntar en voz alta por qué se movió como si llevara piedras en los pies.": "{0} гулял накануне, и знаешь об этом только ты. Тренер только что вслух спросил, почему он двигался так, будто у него камни в бутсах.",
		"TAPARLO": "ПРИКРЫТЬ ЕГО",
		"EL GOL ES TUYO": "ГОЛ — ТВОЙ",
		"Acabas de marcar y la grada corea tu nombre. {0} lleva un mes sin jugar y te mira desde el banquillo, aplaudiendo con las manos flojas.": "Ты только что забил, и трибуны скандируют твое имя. {0} уже месяц не играет и смотрит со скамейки, вяло хлопая.",
		"DEDICÁRSELO": "ПОСВЯТИТЬ ЕМУ",
		"CORRER A LA GRADA": "БЕЖАТЬ К ТРИБУНАМ",
		"TE PIDE DINERO": "ПРОСИТ ДЕНЕГ",
		"{0} te llama de noche y tarda un rato en llegar al punto: en su casa hay un lío y necesita una mano. No dice cuándo te lo devuelve.": "{0} звонит тебе ночью и долго не может перейти к делу: дома беда, и ему нужна помощь. Когда вернет — не говорит.",
		"PRESTÁRSELO": "ОДОЛЖИТЬ",
		"SU ÚLTIMO DÍA": "ПОСЛЕДНИЙ ДЕНЬ",
		"El traspaso de {0} está firmado y mañana ya no entrena aquí. El vestuario hará lo de siempre: un aplauso, una foto y a lo suyo.": "{0} уже подписал контракт с новым клубом, и завтра он здесь не тренируется. Раздевалка сделает как всегда: аплодисменты, фото — и за работу.",
		"ORGANIZARLE UNA DESPEDIDA": "УСТРОИТЬ ПРОВОДЫ",
		"UN ABRAZO Y YA": "ОБНЯТЬ — И ВСЕ",
		"Un programa os invita a {0} y a ti, pero la productora sólo tiene caché para uno y te lo ha ofrecido a ti primero. Él todavía no lo sabe.": "Вас двоих зовут на телешоу — тебя и {0}. Но гонорар у продюсеров только на одного, и сначала его предложили тебе. Он пока не знает.",
		"QUE VAYA ÉL": "ПУСТЬ ИДЕТ ОН",
		"IR YO": "ПОЙДУ Я",

		"LO DEJÓ FUERA": "ВНЕ ЗАЯВКИ",
		"{0} no entró en la lista y lleva media hora sin hablar con nadie. Tú sí juegas, y el míster te escucha más que a él.": "{0} не попал в заявку и уже полчаса ни с кем не разговаривает. Ты играешь, и тренер слушает тебя больше, чем его.",
		"HABLAR POR ÉL": "ЗАСТУПИТЬСЯ",
		"NO ES MI PELEA": "НЕ МОЕ ДЕЛО",
		"OS GRITASTEIS": "ССОРА НА ПОЛЕ",
		"Le pediste el balón a gritos, él te contestó peor, y el banquillo entero lo vio. En el vestuario nadie ha dicho una palabra desde entonces.": "Ты криком потребовал мяч, он ответил еще грубее, и это видела вся скамейка. С тех пор в раздевалке никто не сказал ни слова.",
		"PEDIR PERDÓN YO": "ИЗВИНИТЬСЯ ПЕРВЫМ",
		"QUE SE LE PASE": "ПУСТЬ ОСТЫНЕТ",
		"LA REHABILITACIÓN ES SOLA": "ОДИНОКАЯ РЕАБИЛИТАЦИЯ",
		"{0} se rompió y hace la recuperación por su cuenta, en un gimnasio vacío mientras los demás entrenan. Nadie va a saber si apareces o no.": "{0} получил травму и восстанавливается один, в пустом зале, пока остальные тренируются. Никто не узнает, придешь ты или нет.",
		"ACOMPAÑARLO": "ПОЙТИ С НИМ",
		"YA VOLVERÁ": "САМ ВЕРНЕТСЯ",
		"TE QUIERE DE PADRINO": "ЗОВЕТ В ШАФЕРЫ",
		"{0} se casa en pretemporada y te pide que estés a su lado. Es un fin de semana entero, y tú tenías otros planes con tu descanso.": "{0} женится в предсезонку и просит тебя быть рядом. Это целые выходные, а у тебя были другие планы на отдых.",

		"ÉL QUIERE EL PENALTI": "ОН ХОЧЕТ ПЕНАЛЬТИ",
		"{0} lleva tres partidos sin marcar y te pide el próximo penalti. Los dos sabéis que el goleo del año se decide en detalles como éste.": "{0} не забивает уже три матча и просит у тебя следующий пенальти. Вы оба знаете, что гонка бомбардиров решается в таких мелочах.",
		"SE LO DEJO": "ПУСТЬ БЬЕТ ОН",
		"LOS TIRO YO": "БЬЮ САМ",
		"TE PREGUNTAN POR ÉL": "ВОПРОС О НЕМ",
		"Un periodista quiere que valores el mal momento de {0}. La pregunta viene con la respuesta puesta y toda la sala esperando.": "Журналист просит тебя оценить неудачную полосу игрока {0}. Ответ уже заложен в вопрос, и весь зал ждет.",
		"LO DEFIENDO": "ЗАСТУПЛЮСЬ",
		"NO ME MOJO": "ПРОМОЛЧУ",
		"CENA EN SU CASA": "УЖИН У НЕГО ДОМА",
		"{0} te invita a cenar con su familia la víspera del partido. Es media noche que no duermes, y de las que se recuerdan.": "{0} зовет тебя на ужин с семьей накануне матча. Это полночи без сна — но такие вечера запоминаются.",
		"VOY": "ПОЙДУ",
		"LA SOCIEDAD": "СВЯЗКА",
		"en este partido": "в этом матче",
		"y {0} más": "и еще {0}",
		"Afición": "Болельщики",
		"Prensa": "Пресса",
		"Agente": "Агент",
		"Pareja": "Вторая половинка",
		"{0} energía": "Энергия {0}",
		"o": "или",
		"· 1 acción": "· 1 действие",
		"· posible oferta": "· возможное предложение",

		"VS": "VS",
		"GANASTE": "ПОБЕДА",
		"EMPATASTE": "НИЧЬЯ",
		"PERDISTE": "ПОРАЖЕНИЕ",
		"GOL DE {0}": "ГОЛ: {0}",
		"{0} DE {1}": "{0} — {1}",
		"EN CASA": "ДОМА",
		"XP {0} / {1} · AL NIVEL {2}": "ОПЫТ {0} / {1} · ДО УРОВНЯ {2}",
		"{0} {1} SIN ASIGNAR · REPARTELOS": "НЕ ПОТРАЧЕНО: {0} {1} · ПОТРАТЬ",
		"LA CARRERA": "ГОНКА",
		"EL CUADRO": "СЕТКА",
		"LA TABLA": "ТАБЛИЦА",


		"GOLEADORES": "БОМБАРДИРЫ",
		"GRUPO {0} · PASAN {1}": "ГРУППА {0} · ВЫХОДЯТ {1}",


		"FASE DE LIGA · {0}/{1} · {2}": "ЭТАП ЛИГИ · {0}/{1} · {2}",
		"A OCTAVOS": "В 1/8 ФИНАЛА",
		"AL PLAYOFF": "В ПЛЕЙ-ОФФ",





		"faseligaFUERA": "ВЫБЫЛ",
		"EN LISTA DE VENTA": "НА ПРОДАЖЕ",
		"EN LISTA DE CESIÓN": "В СПИСКЕ НА АРЕНДУ",
		"CESIÓN · {0} DESTINOS": "АРЕНДА · ВАРИАНТЫ: {0}",
		"VER LA JORNADA": "СМОТРЕТЬ ТУР",
		"SIMULAR PARTIDO": "СИМУЛИРОВАТЬ МАТЧ",
		"NO CONVOCADO · LO VES DESDE LA GRADA": "НЕ В ЗАЯВКЕ · СМОТРИШЬ С ТРИБУНЫ",
		"SALES DE TITULAR · ~{0} MIN": "В ОСНОВЕ · ~{0} МИН.",


		"DERBI · TITULAR · ~{0} MIN": "ДЕРБИ · В ОСНОВЕ · ~{0} МИН.",
		"DERBI · DESDE LA BANCA · ~{0} MIN": "ДЕРБИ · СО СКАМЕЙКИ · ~{0} МИН.",
		"ENTRAS DESDE LA BANCA · ~{0} MIN": "СО СКАМЕЙКИ · ~{0} МИН.",
		"SIN GASOLINA · EMPIEZAS EN LA BANCA · ~{0} MIN": "НЕТ СИЛ · НАЧИНАЕШЬ В ЗАПАСЕ · ~{0} МИН.",
		"EL MÍSTER NO TE QUIERE · DESDE LA BANCA · ~{0} MIN": "ТРЕНЕР ТОБОЙ НЕДОВОЛЕН · СО СКАМЕЙКИ · ~{0} МИН.",
		"TE CUIDAN AL VOLVER · DESDE LA BANCA · ~{0} MIN": "ПЛАВНОЕ ВОЗВРАЩЕНИЕ · СО СКАМЕЙКИ · ~{0} МИН.",
		"EL TÉCNICO TE DA UNA OPORTUNIDAD": "ТРЕНЕР ДАЕТ ТЕБЕ ШАНС",
		"EL TÉCNICO TE ESTÁ BUSCANDO HUECO": "ТРЕНЕР ИЩЕТ ТЕБЕ МЕСТО",
		"EL TÉCNICO TE DA DESCANSO": "ТРЕНЕР ДАЕТ ТЕБЕ ОТДОХНУТЬ",
		"SIN GASOLINA": "НЕТ СИЛ",
		"TE CUIDAN AL VOLVER": "ПЛАВНОЕ ВОЗВРАЩЕНИЕ",
		"DESDE LA BANCA · ~{0} MIN": "СО СКАМЕЙКИ · ~{0} МИН.",
		"MEDIA Y FAMA: {0} · EL MÉRITO LO PONES TÚ": "OVR И СЛАВА: {0} · ОСТАЛЬНОЕ ЗА ТОБОЙ",
		"Te faltan {0}: sube de nivel, marca más o gánate al seleccionador en la concentración.":
			"Не хватает {0}: подними уровень, забивай больше или убеди тренера сборной на сборах.",
		"AL CAMPO": "НА ПОЛЕ",
		"SIMULAR LA FECHA": "СИМУЛИРОВАТЬ ТУР",
		"NO ENTRASTE EN LA LISTA": "ТЕБЯ НЕТ В ЗАЯВКЕ",
		"PUESTO {0} DE {1} EN {2}": "МЕСТО {0} ИЗ {1}: {2}",
		"Debes mejorar para ser convocado: sube ~{0} de media o fama.":
			"Нужно прибавить, чтобы получить вызов: подними OVR или славу на ~{0}.",
		"Debes mejorar para ser convocado: más nivel y más nombre.":
			"Нужно прибавить, чтобы получить вызов: выше уровень и громче имя.",
		"PRÓXIMO MUNDIAL · EN {0} {1}": "СЛЕДУЮЩИЙ МУНДИАЛЬ · ЧЕРЕЗ {0} {1}",
		"{0} AÑOS · NIVEL {1}": "ВОЗР. {0} · УР. {1}",
		"AÑO {0} · SEM {1}": "ГОД {0} · НЕД. {1}",
		"LESIÓN": "ТРАВМА",
		"EL CUERPO DECIDE": "РЕШАЕТ ТЕЛО",
		"EN JUEGO": "НА КОНУ",
		"TE GUARDA PARA {0}": "БЕРЕЖЕТ ТЕБЯ: {0}",
		"TE DIO DESCANSO": "ДАЛ ТЕБЕ ОТДЫХ",
		"Para el próximo: {0}.": "На следующий матч: {0}.",
		"FECHAS": "КАЛЕНДАРЬ",
		"riel_pieSIGUIENTE": "ДАЛЕЕ",
		"riel_pieS{0}": "Н.{0}",
		"rielGENTE": "ЛЮДИ",
		"rielDESTREZA": "НАВЫКИ",
		"rielGERENCIA": "ДИРЕКЦИЯ",
		"rielFICHAJES": "ТРАНСФЕРЫ",
		"rielASPECTO": "ВНЕШНОСТЬ",
		"rielCONTRATO": "КОНТРАКТ",
		"rielTORNEOS": "ТУРНИРЫ",
		"rielRANKING": "РЕЙТИНГ",
		"rielNOTICIAS": "НОВОСТИ",
		"rielJUGADOR": "ИГРОК",
		"rielEQUIPO": "КОМАНДА",
		"· das tu palabra": "· даешь слово",
		"Diste tu palabra: si te vas esta ventana o la siguiente, tu grada te lo cobrará.": "Ты дал слово: если уйдешь в это окно или в следующее, трибуны тебе это припомнят.",
		"· empezáis a salir": "· вы начинаете встречаться",
		"J{0}/{1}": "ТУР {0}/{1}",
		"CÓMO SE VOTA": "ГОЛОСОВАНИЕ",
		"NO CUENTAS": "БЕЗ ГОЛОСА",
		"AL 1º": "ДО №1",
		"SOBRE EL 2º": "ОТРЫВ ОТ №2",
		"AL {0} · {1}": "ДО {0} · {1}",
		"HASTA {0}": "ДО {0}",
		"1 OFERTA": "1 ПРЕДЛ.",
		"SIN OFERTAS AÚN": "ПРЕДЛОЖЕНИЙ НЕТ",
		"QUITAR DE VENTA": "СНЯТЬ С ПРОДАЖИ",
		"SU VALOR": "СТОИМОСТЬ",
		"ESPERAR": "ЖДАТЬ",
		"{0} MÁS EN CAMINO": "ЕЩЕ {0} В ПУТИ",
		"{0} DE SU VALOR": "{0} ОТ СТОИМОСТИ",
		"ACEPTADA": "ПРИНЯТО",
		"¡Sube su oferta!": "Повышает предложение!",
		"Se planta: no pone más.": "Уперся: больше не даст.",
		"Se ofende y retira su oferta.": "Обиделся и отозвал предложение.",
		"Esa oferta ya no está.": "Этого предложения больше нет.",
		"Ya le pediste más: no pondrá más.": "Ты уже просил больше: больше не дадут.",
		"Ya aceptaste una oferta.": "Ты уже принял предложение.",
		"Ya no está en venta.": "Больше не продается.",
		"En venta: sus ofertas, en la lista VENDER.": "На продаже: предложения по нему — в списке ПРОДАТЬ.",
		"TU VENTANA": "ТВОЕ ОКНО",
		"TRATOS CERRADOS": "СДЕЛКИ ЗАКРЫТЫ",
		"CERRAR TRATOS": "ЗАКРЫТЬ СДЕЛКИ",
		"TE QUEDA": "ОСТАТОК",
		"VENTAS": "ПРОДАЖИ",
		"GENTE": "ЛЮДИ",
		"SECCION": "РАЗДЕЛ",
		"DECORAR": "ДЕКОР",
		"VENDER MUEBLE": "ПРОДАТЬ МЕБЕЛЬ",
		"¿Esperabas este recibimiento?": "Ожидал такой встречи?",
		"¿Qué esperas de esta nueva etapa?": "Чего ждешь от этого нового этапа?",
		"Vengo a devolverles todo este cariño en el campo.": "Я пришел, чтобы отплатить за всю эту любовь на поле.",
		"Es un sueño. Ahora toca ganarse el sitio.": "Это мечта. Теперь нужно заслужить свое место.",
		"Vengo a dejarlo todo por esta camiseta.": "Я пришел отдать все за эту футболку.",
		"Q1": "Q1",
		"Q2": "Q2",
		"Q3": "Q3",
		"PO": "PO",
		"SI PIERDES": "ПРИ ВЫЛЕТЕ",
		"CAMINO A LA FASE DE LIGA": "ПУТЬ К ЭТАПУ ЛИГИ",
		"VÍA DE LIGA": "ПУТЬ ЛИГИ",
		"VÍA DE CAMPEONES": "ПУТЬ ЧЕМПИОНОВ",
		"GANADOR DE": "ПОБЕДИТЕЛЬ",
		"PERDEDOR DE": "ПРОИГРАВШИЙ",
		"SORTEO {0}": "ЖРЕБ. {0}",
		"IDA {0}": "ПЕРВЫЙ {0}",
		"VUELTA {0}": "ОТВЕТНЫЙ {0}",
		"DESDE LA FASE DE LIGA YA NO SE BAJA": "С ЭТАПА ЛИГИ ВНИЗ НЕ ПАДАЮТ",
		"GLOBAL A FAVOR": "СУММА В ПЛЮСЕ",
		"GLOBAL EN CONTRA": "СУММА В МИНУСЕ",
		"GLOBAL IGUALADO": "СУММА РАВНА",
		"UEFA": "УЕФА",
		"COEFICIENTE DE 5 TEMPORADAS": "КОЭФФИЦИЕНТ ЗА 5 СЕЗОНОВ",
		"Tu liga no juega las copas de la UEFA.": "Твоя лига не играет в кубках УЕФА.",
		"PLAZAS {0}": "МЕСТА {0}",
		"uefaSUSPENDIDA": "ОТСТРАНЕНА",
		"uefa{0} A {1}": "{1} ДО {0}",
		"COEFICIENTE UEFA": "КОЭФФИЦИЕНТ УЕФА",
		"5 TEMPORADAS": "5 СЕЗОНОВ",
		"CABEZA DE SERIE": "ПОСЕЯН",
		"SUELO DE TU LIGA": "МИНИМУМ ЛИГИ",
		"LP": "ЛФ",
	},


	"career_pages": {
		"TUYA": "ТВОЯ",

		"¿Te la compras?": "Купишь?",
		"Va a tu clóset: te la pones en PERSONALIZAR.": "Она отправится в твой гардероб: надень ее в разделе НАСТРОИТЬ.",
		"COMPRAR ${0}": "КУПИТЬ ${0}",





		"LO QUE PIDE EL CLUB": "ЦЕЛИ КЛУБА",
		"Lo que se le exige al equipo, medido contra sus rivales de cada torneo.": "Что требуется от команды — в сравнении с соперниками в каждом турнире.",
		"{0}: {1} o mejor": "{0}: {1} или выше",
		"Pelear arriba ({0} o mejor)": "Бороться за верх ({0} или выше)",
		"Te lo suben: el año pasado diste más de lo pedido.": "Планку подняли: в прошлом сезоне ты дал больше, чем просили.",
		"Te lo bajan: el año pasado te quedaste corto.": "Планку снизили: в прошлом сезоне ты не дотянул.",
		"A este ritmo: {0} de {1}": "В таком темпе: {0} из {1}",
		"EL CLUB": "КЛУБ",
		"GRUPO": "ГРУППА",
		"{0} goles · hiciste {1}": "Голов: {0} · у тебя {1}",
		"{0} asistencias · diste {1}": "Ассистов: {0} · у тебя {1}",
		"{0} partidos · jugaste {1}": "Матчей: {0} · ты сыграл {1}",
		"nota {0} · hiciste {1}": "оценка {0} · у тебя {1}",
		"acabar {0} o mejor": "финиш: {0} или выше",
		"TE SIENTAN POR NO CUMPLIR": "В ЗАПАСЕ ЗА НЕВЫПОЛНЕНИЕ",
		"Ganar la liga": "Выиграть лигу",
		"Acabar {0} o mejor": "Финиш: {0} или выше",
		"Mantener la categoría": "Сохранить место в лиге",
		"Ascender de categoría": "Добиться повышения",
		"Pelear el ascenso ({0} o mejor)": "Бороться за повышение ({0} или выше)",
		"Levantar el título": "Поднять трофей",
		"Llegar a la final": "Дойти до финала",
		"Llegar a semifinales": "Выйти в полуфинал",
		"Llegar a cuartos": "Выйти в 1/4 финала",
		"Pasar una ronda": "Пройти раунд",
		"Pasar la fase de liga": "Пройти этап лиги",
		"Dar la cara": "Дать бой",
		"Competir": "Побороться",
		"FALLADO": "ПРОВАЛ",
		"SIN EMPEZAR": "НЕ НАЧАТО",
		"VAS {0}": "ПОКА {0}",
		"SIN DATOS": "НЕТ ДАННЫХ",
		"EN FASE DE LIGA": "НА ЭТАПЕ ЛИГИ",
		"{0}/{1} RONDAS": "РАУНДЫ {0}/{1}",
		"EL CLUB, CORTO": "КЛУБ ОТСТАЕТ",
		"{0} · PIDE {1}": "{0} · НУЖНО {1}",
		"Prima por el año del club: ${0}": "Бонус за сезон клуба: ${0}",
		"El club destituye al técnico": "Клуб увольняет тренера",
		"Las copas le salvan el puesto al técnico": "Кубки спасают тренера от увольнения",
		"El club le mantiene la confianza al técnico": "Клуб сохраняет доверие к тренеру",
		"TU OBJETIVO": "ТВОЯ ЦЕЛЬ",
		"EL AÑO DEL CLUB": "СЕЗОН КЛУБА",

		"TU JUEGO": "ТВОЯ ИГРА",

		"HABILIDAD": "НАВЫКИ",

		"CLUBES": "КЛУБЫ",
		"JUGADORES": "ИГРОКИ",
		"BALON DE ORO": "ИГРОК ГОДА",
		"TU CARRERA": "КАРЬЕРА",
		"TROFEOS": "ТРОФЕИ",

		"SONIDO": "ЗВУК",
		"MÚSICA": "МУЗЫКА",
		"EFECTOS": "ЭФФЕКТЫ",
		"PARTIDO": "МАТЧ",
		"DIFICULTAD": "СЛОЖНОСТЬ",
		"NORMAL": "СРЕДНЕ",



		"LA DIFICULTAD": "СЛОЖНОСТЬ",
		"Así de duro te lo va a poner el rival. No lo eliges para siempre.": "Вот насколько жестко с тобой будет играть соперник. Выбор не навсегда.",
		"Puedes cambiarla en cualquier momento desde PAUSA > AJUSTES, sin salir del partido.": "Ее можно поменять в любой момент через ПАУЗА > НАСТРОЙКИ, не выходя из матча.",
		"FACIL: el rival se para mientras apuntas y no te quita el balón nunca. El portero falla más.": "ЛЕГКО: соперник замирает, пока ты целишься, и никогда не отбирает мяч. Вратарь ошибается чаще.",
		"NORMAL: el rival va más lento mientras apuntas y te roba de más cerca. El portero falla algo más.": "СРЕДНЕ: соперник замедляется, пока ты целишься, и отбирает мяч только вблизи. Вратарь ошибается чуть чаще.",
		"DIFICIL: el juego completo. Te aprietan mientras apuntas, te roban el balón y el portero no regala nada.": "СЛОЖНО: игра без поблажек. Тебя прессуют, пока ты целишься, отбирают мяч, а вратарь ничего не дарит.",
		"EXTREMO: marcan a la estrella, una ocasión menos, cansado tiras peor, tapan más, roban sin aviso y todos te exigen más.": "ЭКСТРИМ: звезду плотно опекают, на один момент меньше, уставшим бьешь хуже, больше блоков, отбор без предупреждения, и все требуют больше.",
		"PERSPECTIVA": "РАКУРС",
		"TV": "ТВ",
		"CAMPO": "ПОЛЕ",
		"TV: el plano alto de siempre. Toda la cancha por delante para ver a quién pasarla.": "ТВ: привычный вид сверху. Все поле перед тобой — видно, кому отдать пас.",
		"CAMPO: la cámara baja y se acerca, casi a tu espalda. Entra el fondo del estadio y el partido se ve desde dentro.": "ПОЛЕ: камера ниже и ближе, почти за твоей спиной. В кадр попадает дальняя трибуна, и матч видно изнутри.",
		"SACUDIDA DE CÁMARA": "ТРЯСКА КАМЕРЫ",
		"DISTANCIA DE CÁMARA": "ДАЛЬНОСТЬ КАМЕРЫ",
		"GIRO DE VISTA": "ПОВОРОТ ВИДА",
		"MENOS MOVIMIENTO DE CÁMARA": "МЕНЬШЕ ДВИЖЕНИЯ КАМЕРЫ",
		"VIBRACIÓN": "ВИБРАЦИЯ",
		"TEMA CLARO": "СВЕТЛАЯ ТЕМА",
		"TEMA OSCURO": "ТЕМНАЯ ТЕМА",
		"PANTALLA": "ЭКРАН",
		"EFECTO CRT": "ЭФФЕКТ CRT",
		"AHORRO DE BATERÍA": "ЭКОНОМИЯ ЗАРЯДА",

		"CALIDAD BAJA": "НИЗКАЯ ГРАФИКА",
		"MUY BAJA": "МИНИМУМ",

		"Rayas de tele retro": "Полосы, как на старом ТВ",
		"Más fluido, menos detalle y sin CRT": "Плавнее, меньше деталей, без CRT",
		"Aún más fluido, menos nítido": "Еще плавнее, но менее четко",
		"Menús a 30 fps cuando no tocas": "Меню в 30 fps, пока не трогаешь",
		"Cambia el icono de la app": "Сменить иконку приложения",
		"Juega con el teléfono girado": "Играй, повернув телефон боком",

		"HORIZONTAL": "АЛЬБОМНАЯ",
		"EN CONSTRUCCIÓN": "В РАБОТЕ",
		"PROBAR": "ПОПРОБУЙ",
		"La vista horizontal todavía no está terminada: algunas pantallas "
		+ "pueden verse descuadradas o cortadas. Puedes volver a la vertical aquí mismo "
		+ "cuando quieras.":
			"Альбомный режим еще не доделан: некоторые экраны могут съезжать или обрезаться. Вернуться к вертикальному можно прямо здесь, когда захочешь.",
		"Para teléfonos que van lentos: menos resolución en el estadio, sin filtro "
		+ "CRT ni sombras, y la mitad de lluvia y nieve.":
			"Для медленных телефонов: ниже разрешение стадиона, без фильтра CRT и теней, и вдвое меньше дождя и снега.",
		"Tu teléfono iba lento: activamos CALIDAD BAJA. Puedes quitarla en "
		+ "AJUSTES.":
			"Твой телефон тормозил, поэтому мы включили НИЗКУЮ ГРАФИКУ. Отключить можно в НАСТРОЙКАХ.",

		"ICONO DE LA APP": "ИКОНКА ИГРЫ",
		"CLÁSICO": "КЛАССИКА",
		"NOCHE DE BRUJAS": "ХЭЛЛОУИН",
		"Cambia el icono del juego en tu pantalla de inicio.":
			"Смени иконку игры на главном экране.",
		"El teléfono no dejó cambiar el icono. Vuelve a intentarlo.":
			"Телефон не дал сменить иконку. Попробуй еще раз.",
		"Con el juego quieto baja el refresco y deja que la pantalla se apague "
		+ "sola. El partido no cambia.":
			"Когда игра простаивает, частота обновления снижается, а экран может сам погаснуть. На матчи это не влияет.",
		"CARRERAS": "КАРЬЕРЫ",
		"Borra la carrera de cualquier ranura para dejarla libre. No se puede deshacer.":
			"Удали карьеру из любого слота, чтобы освободить его. Это нельзя отменить.",
		"EMPEZAR DE CERO": "НАЧАТЬ С НУЛЯ",
		"Borra todas las carreras Y todos los logros. El juego queda como recién instalado. No se puede deshacer.":
			"Удаляет все карьеры И все достижения. Игра станет как после установки. Это нельзя отменить.",
		"REINICIAR TODO": "СБРОСИТЬ ВСЕ",
		"¿REINICIAR TODO?": "СБРОСИТЬ ВСЕ?",
		"Se pierden todas las carreras y TODOS los logros. El juego vuelve a empezar de cero. Esto no se puede deshacer.":
			"Пропадут все карьеры и ВСЕ достижения. Игра начнется с нуля. Это нельзя отменить.",
		"SÍ": "ДА",
		"BORRAR": "УДАЛИТЬ",
		"SÍ, BORRAR": "ДА, УДАЛИТЬ",
		"SÍ, BORRAR TODO": "ДА, УДАЛИТЬ ВСЕ",
		"CANCELAR": "ОТМЕНА",
		"VACÍA": "ПУСТО",
		"RETIRADO": "ЗАВЕРШЕНА",
		"T{0}": "С.{0}",
		"¿BORRAR RANURA {0}?": "УДАЛИТЬ СЛОТ {0}?",
		"Es tu carrera ACTIVA.": "Это твоя АКТИВНАЯ карьера.",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.{1}\n"
		+ "Las otras ranuras no se tocan.":
			"Карьера игрока {0} будет потеряна: уровень, деньги, контракт и трофеи.{1}\nОстальные слоты не затрагиваются.",

		"TU NOMBRE": "ТВОЕ ИМЯ",
		"NOMBRE EN LA ESPALDA": "ИМЯ НА ФУТБОЛКЕ",
		"16 AÑOS · DEBUTANTE": "16 ЛЕТ · НОВИЧОК",
		"Debutante": "Rookie",
		"TU ASPECTO": "ВНЕШНОСТЬ",
		"NUEVA CARRERA+": "НОВАЯ КАРЬЕРА+",
		"Lo que te ganaste en carreras anteriores. Elige con qué ventaja arrancas esta "
		+ "vez —o ninguna, y empieza de cero como todos.":
			"То, что ты заработал в прошлых карьерах. Выбери, с каким преимуществом начнешь в этот раз — или обойдись без него и начни с нуля, как все.",
		"QUITAR": "УБРАТЬ",
		"ELEGIR": "ВЫБРАТЬ",
		"TU NACIONALIDAD": "ТВОЯ СТРАНА",
		"ELIGE TU NACIONALIDAD": "ВЫБЕРИ СТРАНУ",
		"FALTA TU NOMBRE Y TU NACIONALIDAD": "НЕТ ИМЕНИ И СТРАНЫ",
		"FALTA ESCRIBIR TU NOMBRE": "СНАЧАЛА ВВЕДИ ИМЯ",
		"FALTA ELEGIR TU NACIONALIDAD": "СНАЧАЛА ВЫБЕРИ СТРАНУ",
		"TU CLUB": "ТВОЙ КЛУБ",
		"LEYENDAS DEL CLUB": "ЛЕГЕНДЫ КЛУБА",
		"NO EXISTEN LEYENDAS AÚN": "ЛЕГЕНД ПОКА НЕТ",
		"CREA TU JUGADOR": "СОЗДАЙ ИГРОКА",



		"PASO 1 DE 2 · NOMBRE Y ASPECTO": "ШАГ 1 ИЗ 2 · ИМЯ И ВНЕШНОСТЬ",
		"SIGUIENTE  >": "ДАЛЕЕ  >",
		"< ATRÁS": "< НАЗАД",
		"NACIONALIDAD Y CLUB": "СТРАНА И КЛУБ",
		"PASO 2 DE 2 · CON QUIÉN Y DÓNDE EMPIEZAS": "ШАГ 2 ИЗ 2 · ОТКУДА ТЫ И ГДЕ НАЧНЕШЬ",
		"EMPEZAR CARRERA": "НАЧАТЬ КАРЬЕРУ",
		"< VOLVER": "< НАЗАД",



		"Primera": "Первая",
		"Segunda": "Вторая",
		"Tercera": "Третья",
		"{0} DIVISIÓN": "{0} ЛИГА",
		"¡NUEVO!": "НОВОЕ!",
		"DESBLOQUEADA": "ОТКРЫТО",
		"BLOQUEADO": "ЗАКРЫТО",

		"< ATRAS": "< НАЗАД",



		"Piel": "Кожа",
		"Pelo": "Волосы",
		"Corte": "Стрижка",
		"Vello facial": "Борода",



		"Puntas": "Кончики",
		"Botines": "Бутсы",
		"Playera casual": "Футболка",
		"Pantalón casual": "Брюки",
		"Estampado": "Принт",
		"2º color playera": "2-й цвет футболки",
		"Manga": "Рукав",
		"Prenda": "Одежда",
		"Chamarra": "Куртка",
		"Rectangulares": "Прямоугольные",
		"Deportivos": "Спортивные",
		"Short de mezclilla": "Джинсовые шорты",
		"Short cargo": "Шорты карго",
		"Bermuda": "Бермуды",
		"Short de baño": "Пляжные шорты",
		"Diamante": "Бриллиант",
		"Doble aro": "Два кольца",
		"Colgante": "Подвеска",
		"Ear cuff": "Кафф",
		"Oxford": "Оксфорды",
		"Chelsea": "Челси",
		"Chanclas": "Шлепанцы",
		"Gala": "Вечерний",
		"Traje de gala": "Вечерний костюм",
		"Esmoquin clásico": "Классический смокинг",
		"Traje azul": "Синий костюм",
		"Esmoquin marfil": "Молочный смокинг",
		"Terciopelo granate": "Гранатовый бархат",
		"Tres piezas gris": "Серая тройка",
		"Traje cruzado": "Двубортный",
		"Oficina azul": "Офисный синий",
		"Básico grafito": "Базовый графит",
		"Lino arena": "Песочный лен",
		"Traje café": "Коричневый костюм",
		"Satén medianoche": "Полуночный атлас",
		"Terciopelo esmeralda": "Изумрудный бархат",
		"Seda perla": "Жемчужный шелк",
		"Marfil y oro": "Молочное с золотом",
		"Negro y oro": "Черное с золотом",
		"Diplomático": "Дипломат",
		"Traje sin corbata": "Костюм без галстука",
		"Saco y cuello alto": "Пиджак и водолазка",
		"Conjunto con chaleco": "Костюм с жилетом",
		"Oversize": "Оверсайз",
		"Sin mangas": "Без рукавов",
		"Cuello alto": "Водолазка",
		"Camisa abierta": "Расстегнутая рубашка",
		"Chinos": "Чиносы",
		"Mezclilla ancha": "Широкие джинсы",
		"De vestir": "Классические",
		"Short deportivo": "Спортивные шорты",
		"Bomber": "Бомбер",
		"Mezclilla": "Джинсовая",
		"Cuero": "Кожаная",
		"Rompevientos": "Ветровка",
		"Blazer": "Блейзер",
		"Cierre": "Застежка",
		"Abierta": "Расстегнута",
		"Cerrada": "Застегнута",
		"Hacia atrás": "Козырьком назад",
		"Gorro tejido": "Вязаная шапка",
		"Bucket": "Панама",
		"Redondos": "Круглые",
		"Aviador": "Авиаторы",
		"Con dije": "С кулоном",
		"Reloj": "Часы",
		"Pulsera": "Браслет",
		"Calzado": "Обувь",
		"Tenis bajos": "Низкие кеды",
		"Tenis altos": "Высокие кеды",
		"Botas": "Ботинки",
		"Mocasines": "Лоферы",
		"Sandalias": "Сандалии",
		"Color del calzado": "Цвет обуви",
		"Playeras": "Футболки",
		"Pantalones": "Брюки",
		"Chamarras": "Куртки",
		"Gorras": "Кепки",
		"Accesorios": "Аксессуары",
		"Color de playera": "Цвет футболки",
		"Prenda exterior": "Верхняя одежда",
		"Color de chamarra": "Цвет куртки",
		"Recto": "Прямые",
		"Jeans": "Джинсы",
		"Cargo": "Карго",
		"Jogger": "Джоггеры",
		"Aretes": "Серьги",
		"Broquel": "Гвоздик",
		"Aro": "Кольцо",
		"Cadena": "Цепочка",
		"Metal": "Металл",
		"Polo": "Поло",
		"Camisa": "Рубашка",
		"Suéter": "Свитер",
		"Chaleco": "Жилет",
		"Abrigo": "Пальто",
		"Hoodie": "Худи",
		"Largo del pantalón": "Длина брюк",
		"Largo": "Длинные",
		"Corto": "Короткие",
		"Gorra": "Кепка",
		"Sombrero": "Шляпа",
		"Color de la gorra": "Цвет кепки",
		"Corta": "Короткий",
		"Larga": "Длинный",
		"Gafas": "Очки",
		"De sol": "Темные",
		"Lentes": "Обычные",
		"Liso": "Однотонный",
		"Rayas": "Полоски",
		"Raya fina": "Тонкая полоска",
		"Mitad": "Наполовину",
		"Tatuajes": "Тату",

		"Tinte": "Окраска",
		"Rostro": "Лицо",
		"Mediano": "Средний",
		"Accesorio": "Аксессуар",
		"Brazos": "Руки",
		"Arriba": "Верх",
		"Abajo": "Низ",
		"Detalles": "Детали",
		"Outfits": "Образы",
		"Traje": "Костюм",
		"Cuello": "Шея",
		"Muñeca": "Запястье",
		"Brazo izq": "Левая рука",
		"Brazo der": "Правая рука",
		"Ambos": "Обе",


		"Tatuaje de cuello": "Тату на шее",
		"Tinta del cuello": "Цвет тату на шее",
		"Dibujo de la pierna": "Рисунок на ноге",
		"Tinta de la pierna": "Цвет тату на ноге",
		"Guantes de campo": "Игровые перчатки",
		"Guantes": "Перчатки",
		"Muñequeras": "Напульсники",
		"Color de la muñequera": "Цвет напульсника",
		"Manga de compresión": "Компрессионный рукав",
		"Color de la manga": "Цвет рукава",
		"Vendaje": "Повязка",
		"Medias": "Гетры",
		"Cinta de la media": "Тейп на гетрах",
		"Normales": "Обычные",
		"Con cinta": "С тейпом",
		"Bajadas": "Спущенные",
		"Piernas": "Ноги",
		"Pierna izq": "Левая нога",
		"Pierna der": "Правая нога",
		"Manga entera": "Полный рукав",
		"Antebrazo": "Предплечье",
		"Bíceps": "Бицепс",
		"Manga difuminada": "Рукав-градиент",
		"Escamas": "Чешуя",
		"Eslabones": "Звенья",
		"Ondas": "Волны",
		"Cuadros": "Клетка",
		"Aros finos": "Тонкие кольца",
		"Salpicado": "Крапинки",
		"Tres aros": "Три кольца",
		"Lágrima": "Слеза",
		"Estrella": "Звезда",
		"Barra": "Полоса",
		"Triángulo": "Треугольник",
		"Galón": "Шеврон",
		"Flecha": "Стрела",
		"Cuadro": "Квадрат",
		"Anillo": "Кольцо",
		"Gancho": "Крюк",
		"Raya corta": "Черточка",
		"Dos barras": "Две полосы",
		"Cruz": "Крест",
		"Franja": "Лента",
		"Franja ancha": "Широкая лента",
		"Tres puntos": "Три точки",
		"Rombo": "Ромб",
		"Dibujo del tatuaje": "Рисунок тату",
		"Tinta del tatuaje": "Цвет тату",
		"Punto": "Точка",
		"Dos puntos": "Две точки",
		"Línea corta": "Короткая линия",
		"Cruz pequeña": "Маленький крест",
		"Rombo pequeño": "Маленький ромб",
		"Izquierda": "Слева",
		"Derecha": "Справа",
		"Ambas": "Обе",
		"Damero": "Шахматка",
		"Aros": "Кольца",
		"Brazalete": "Обруч",
		"Tribal": "Трайбл",
		"Cepillo": "Ежик",
		"Un costado": "Выбритый висок",
		"Mullet": "Маллет",
		"Afro": "Афро",
		"Melena": "Длинные волосы",
		"Ojos": "Глаза",
		"Cejas": "Брови",
		"Accesorio de cabeza": "Аксессуар на голову",
		"Raya al medio": "Пробор посередине",
		"Coronilla": "Макушка",
		"Herradura": "Подкова",
		"Normal": "Обычная",
		"Calvo": "Лысый",
		"Rapado": "Под машинку",
		"Cresta": "Ирокез",
		"Lados": "Андеркат",
		"Degradado": "Тейпер",
		"Entradas": "Залысины",
		"Cresta ancha": "Широкий ирокез",
		"Raya": "Пробор",
		"Franjas": "Линии",
		"Nada": "Нет",
		"Barba": "Борода",
		"Candado": "Эспаньолка",
		"Bigote": "Усы",
		"Sombra": "Щетина",
		"Patillas": "Бакенбарды",
		"Mosca": "Мушка",
		"Contorno": "Шкиперская",
		"Barbón": "Густая борода",
		"Manillar": "Усы-руль",

		"CAMBIAR": "СМЕНИТЬ",
		"BUSCAR": "ПОИСК",
		"SIN RESULTADOS": "НЕ НАЙДЕНО",
		"SUGERIDAS": "ГОТОВЫЕ",
		"TODAS": "ВСЕ",
		"Color libre": "Любой цвет",


		"ANTES": "БЫЛО",
		"AHORA": "СТАЛО",
		"PAÍS DEL CLUB": "СТРАНА КЛУБА",
		"VER LOS {0} CLUBES": "ВСЕ КЛУБЫ ({0})",
		"TUS OFERTAS": "ПРЕДЛОЖЕНИЯ",
		"INICIA DESDE ABAJO": "СТАРТ С НИЗОВ",
		"INICIA DONDE QUIERAS": "НАЧНИ, ГДЕ ХОЧЕШЬ",
		"ELIGE TU CLUB": "ВЫБЕРИ КЛУБ",
		"VER LAS {0} OFERTAS": "ВСЕ ПРЕДЛОЖЕНИЯ ({0})",
		"{0} DE TU PAÍS · {1} DEL EXTRANJERO": "{0} ИЗ ТВОЕЙ СТРАНЫ · {1} ИЗ-ЗА РУБЕЖА",
		"DIVISIÓN BLOQUEADA": "ЛИГА ЗАКРЫТА",
		"TELEMETRÍA": "ТЕЛЕМЕТРИЯ",
		"Contadores de uso guardados en este teléfono. Sirven para saber qué partes del juego se usan y no hay ningún dato tuyo dentro.":
			"Счетчики использования, которые хранятся на этом телефоне. По ним видно, какими частями игры пользуются, и никаких твоих данных в них нет.",
		"COMPARTIR CONTADORES":
			"ДЕЛИТЬСЯ СЧЕТЧИКАМИ",
		"Estos mismos números se envían al desarrollador para saber qué partes del juego se usan. Nunca van tu nombre, tu partida ni nada que te identifique. Apágalo cuando quieras.":
			"Эти же цифры отправляются разработчику, чтобы понять, какими частями игры пользуются. Твое имя, сохранения и все, что может тебя опознать, никогда не передаются. Отключи, когда захочешь.",
		"VER CONTADORES": "ОТКРЫТЬ СЧЕТЧИКИ",
		"BORRAR CONTADORES": "СБРОСИТЬ СЧЕТЧИКИ",
		"PEDIR BORRADO": "ЗАПРОСИТЬ УДАЛЕНИЕ",
		"CERRAR": "ЗАКРЫТЬ",
		"NO": "НЕТ",
		"MANTEN PARA REINICIAR TODO": "ЗАЖМИ, ЧТОБЫ СБРОСИТЬ ВСЕ",
		"MANTEN PARA PEDIR CAMBIO": "ЗАЖМИ ДЛЯ ЗАМЕНЫ",
		"BORRAR TODO": "УДАЛИТЬ ВСЕ",
		"MANTÉN PULSADO PARA BORRAR TODO": "ЗАЖМИ, ЧТОБЫ УДАЛИТЬ ВСЕ",

		"REY DEL GOL": "КОРОЛЬ ГОЛОВ",
		"REY DEL PASE": "КОРОЛЬ ПАСА",
		"{0} lidera el goleo con {1}": "{0} лидирует среди бомбардиров ({1})",
		"{0} acaba de máximo goleador con {1}": "{0} — лучший бомбардир сезона ({1})",
		"{0} manda en asistencias con {1}": "{0} лидирует по ассистам ({1})",
		"{0} acaba líder de asistencias con {1}": "{0} — лучший ассистент сезона ({1})",
		"{0} es el jugador de la temporada ({1})": "{0} — лучший игрок сезона ({1})",
		"CAMPEÓN DE LIGA": "ЧЕМПИОН ЛИГИ",
		"DESCIENDE": "ВЫЛЕТ",
		"BOMBAZO": "РЕКОРД",
		"SORPRESA": "СЕНСАЦИЯ",
		"{0} se lleva la liga": "{0} — чемпион лиги",
		"{0} baja a {1}": "{0} вылетает. Новая лига: {1}",
		"{0} es el fichaje más caro de la ventana": "{0} — самый дорогой трансфер окна",
		"{0} cuelga las botas": "{0} вешает бутсы на гвоздь",
		"{0} tumba al {1}": "{0} сенсационно обыгрывает {1}",
		"{0} lleva {1} victorias seguidas": "{0}: победная серия — {1}",
		"{0} lleva {1} partidos sin ganar": "{0}: серия без побед — {1}",
		"El {0} destituye a {1}": "{0} увольняет тренера {1}",
		"{0} coge el banquillo del {1}": "{0} — новый тренер клуба {1}",
		"{0} deja el {1} y coge el {2}": "{0} меняет {1} на {2}",
		"El {0} se lleva a {1} del {2}": "{0} переманивает {1} из клуба {2}",

		"SELECCIONES": "СБОРНЫЕ",
		"{0} deja de ser seleccionador de {1}": "{1}: {0} больше не тренирует сборную",
		"{0}, nuevo seleccionador de {1}": "{1}: {0} — новый тренер сборной",
		"{0} deja el {1} para dirigir a {2}": "{2}: сборную возглавит {0}, покинувший {1}",
		"{0} deja la selección de {1} y coge la de {2}": "{2}: новый тренер сборной — {0} (ранее — {1})",
		"{0} deja la selección de {1} y coge el {2}": "{1}: {0} уходит из сборной в клуб {2}",

		"INVERSOR": "ИНВЕСТОР",
		"CRISIS": "КРИЗИС",
		"{0} cambia de dueño: llega dinero para fichar": "{0} меняет владельца: появятся деньги на трансферы",
		"{0} entra en crisis y tendrá que vender": "{0}: кризис, придется продавать игроков",
		"Se acaba el dinero del nuevo dueño del {0}": "{0}: деньги нового владельца закончились",
		"NOTICIAS": "НОВОСТИ",
		"Tu club todavía no ha sido noticia.": "О твоем клубе пока не писали.",
		"Tu liga todavía no ha sido noticia.": "О твоей лиге пока не писали.",
		"El mundo todavía no ha dado que hablar.": "В мире пока не о чем говорить.",
		"Un jeque compra el {0}: viene a ganarlo todo": "Шейх покупает {0}: цель — выиграть все",
		"Un magnate compra el {0}: llega dinero para fichar": "Магнат покупает {0}: появятся деньги на трансферы",
		"Un fondo compra el {0} para revenderlo": "Фонд покупает {0}, чтобы перепродать",
		"PRIMER PARTIDO": "ПЕРВЫЙ МАТЧ",
		"BODA": "БРАК",
		"DIVORCIO": "РАЗВОД",
		"RUPTURA": "РАЗРЫВ",
		"JUNTOS": "ВМЕСТЕ",
		"A DISTANCIA": "ПОРОЗНЬ",
		"{0} se casa": "{0} женится",
		"{0} se divorcia": "{0} разводится",
		"{0} rompe con su pareja": "{0} расстается со второй половинкой",
		"{0} llega al {1} con su pareja": "{0} переходит в {1} вместе со второй половинкой",
		"{0} llega solo al {1}: su pareja no se muda": "{0} переходит в {1} один: вторая половинка не переезжает",
		"NOTICIA": "НОВОСТЬ",
		"EL DOBLETE": "ДУБЛЬ",
		"EL TRIPLETE": "ТРЕБЛ",
		"ASCENDISTE": "ПОВЫШЕНИЕ",
		"DESCENDISTE": "ВЫЛЕТ",
		"de {0} equipos": "из {0} команд",
		"Bolsa": "Сумка",
		"Mallas": "Тайтсы",
		"Térmicas": "Термобелье",
		"Rodillera": "Наколенник",
		"Material": "Материал",
		"Neopreno": "Неопрен",
		"LEER": "ЧИТАТЬ",
		"SIN PERDER": "НЕПОБЕЖДЕН",
		"ORDEN": "ПОРЯДОК",
		"ORDENAR": "ПОРЯДОК",
		"TUS REDES": "ЛЕНТА",
		"TU POST": "МОЙ ПОСТ",
		"FUEGO": "ОГОНЬ",
		"APLAUSO": "ХЛОПКИ",
		"HINCHA": "ФАНАТ",
		"MARCA": "БРЕНД",
		"¿CONTESTAS?": "ОТВЕТИШЬ?",
		"No contestas. Pasa solo.": "Без ответа. Пусть уляжется.",
		"Toca mejorar. Y mejoraré.": "Надо стать лучше. И я стану.",
		"En el próximo hablo yo. #CALLABOCAS": "В следующем матче скажу я. #ВСЕМПОМОЛЧАТЬ",
		"SE COBRA": "ЗАРПЛАТА",
		"te ha mencionado · nota {0}": "упомянул тебя · оценка {0}",
		"Tu muro todavía está vacío.": "Твоя стена пока пуста.",
		"El Diario": "Вестник",
		"@eldiario": "@vestnik",
		"La Grada": "Трибуна",
		"@lagradafiel": "@vernaya_tribuna",
		"@el_10_del_equipo": "@desyatka_komandy",
		"Hincha rival": "Фанат соперника",
		"@ultra_norte": "@ultra_sever",
		"Tu marca": "Твой бренд",
		"@tumarca_oficial": "@tvoy_brend_official",
		"tras la {0}": "после матча: {0}",
		"SEGUIDORES": "ПОДПИСЧИКИ",
		"RESPONDER": "ОТВЕТИТЬ",
		"RESPONDIENDO A": "ОТВЕТ ДЛЯ",
		"Nos vemos en el campo. #ALLÍTEESPERO": "Увидимся на поле. #ЖДУТЕБЯТАМ",
		"¡Así se habla, capitán!": "Вот это слова, капитан!",
		"Mucho hablar...": "Много слов...",
		"TE ETIQUETAN": "УПОМИНАНИЕ",
		"Un rival te ha mencionado antes del partido. Todo el mundo mira qué contestas.": "Соперник упомянул тебя перед матчем. Все ждут, что ты ответишь.",
		"Lo dijiste en redes. Hoy te toca callar.": "Наговорил в соцсетях. Сегодня придется молчать.",
		"antes de la {0}": "до матча: {0}",
		"{0} te ha etiquetado": "{0} отметил тебя",
		"¿ENTRAS AL TRAPO?": "ПОВЕДЕШЬСЯ?",
		"Ni le contestas. Tu técnico lo agradece.": "Даже не отвечаешь. Тренер это ценит.",
		"el campo es mi casa. A ver si esta vez das la cara.": "поле — мой дом. Посмотрим, покажешься ли ты в этот раз.",
		"¿te acuerdas de la final? Yo sí. Te espero en el campo.": "помнишь финал? Я помню. Жду тебя на поле.",
		"Hablamos en el campo.": "Поговорим на поле.",
		"La final ya pasó. Ahora, otra historia.": "Финал позади. Теперь другая история.",
		"LA REVANCHA": "РЕВАНШ",
		"MENSAJES": "ЧАТЫ",
		"AGRADECER": "СПАСИБО",
		"DISTE TU PALABRA": "СЛОВО ДАНО",
		"No tienes mensajes.": "У тебя нет сообщений.",
		"{0}, de la grada": "{0}, с трибуны",
		"CADUCA EN {0}": "ОСТАЛОСЬ: {0}",
		"TU ASISTENCIA · {0}": "ТВОЙ ПАС · {0}",
		"RUMOR": "СЛУХ",
		"PALABRA": "СЛОВО",
		"Si no contestas, no pasa nada.": "Не ответишь — ничего не случится.",
		"¿Con qué festejo nos celebras el próximo gol en casa?": "Каким празднованием ты отметишь следующий гол дома?",
		"ENCUESTA": "ОПРОС",
		"{0} VOTOS": "ГОЛОСОВ: {0}",
		"Ganó {0}": "Победил: {0}",
		"Lo votó {0}": "Голос: {0}",
		"LLEVAR AL BOMBO": "В БАРАБАН",
		"Abre tu bombo de CELEBRACIONES.": "Открой свой барабан ПРАЗДНОВАНИЙ.",
		"SI SALE EN CASA": "ТОЛЬКО ДОМА",
		"Tú celebras a tu manera.": "Ты празднуешь по-своему.",
		"NO CUESTA NADA": "БЕСПЛАТНО",
		"Tu próximo gol en casa": "Твой следующий гол дома",
		"LA PEÑA LA PIDE": "ФАНАТЫ ХОТЯТ",
		"encuesta del mes · gana {0}": "опрос месяца · побеждает {0}",
		"La peña vota el festejo del mes. Gana {2}: ¡lo queremos ver en casa, {0}!": "Фанаты выбирают празднование месяца. Побеждает {2}: хотим увидеть его дома, {0}!",
		"{0} le hace caso a su peña: {2} en casa.": "{0} слушает фанатов: {2} дома.",
		"¡Lo pedimos y {0} lo hizo! {2} delante de la peña.": "Мы попросили, и {0} сделал! {2} перед фанатами.",
		"Llegar a la fase de liga": "Выйти в этап лиги",
		"Ganar el cruce de {0}": "Выиграть раунд {0}",
		"¡La selfie de mi vida con {0}! Ya es mi foto de perfil.": "Селфи всей моей жизни с {0}! Теперь это мое фото профиля.",
		"Me firmó y encima nos hicimos una selfie. Gracias, {0}.": "Он расписался, и мы еще сделали селфи. Спасибо, {0}.",
		"Salió movida, pero os juro que es {0}.": "Получилось смазано, но клянусь, это {0}.",
		"TECLAS": "КЛАВИШИ",
		"PULSA UNA TECLA": "НАЖМИ КЛАВИШУ",
		"MANTEN PARA RESTABLECER": "ЗАЖМИ, ЧТОБЫ СБРОСИТЬ",
		"FAN": "ФАНАТ",
		"Pillaron al revendedor que se colaba en la firma de {0}. ¡Bien visto!": "На автограф-сессии {0} поймали перекупщика, который лез без очереди. Хорошо заметили!",
		"A {0} no se la cuelan: seguridad saca a un revendedor de su firma.": "{0} не проведёшь: охрана вывела перекупщика с автограф-сессии.",
		"Ya hay firmas de {0} a la venta por 5 €. El de la cola se puso las botas.": "Автографы {0} уже продают по 5 €. Тот тип из очереди неплохо нажился.",
		"Nuestra tarde de firmas con {0} ya está en reventa. No era la idea.": "Нашу автограф-сессию с {0} уже перепродают. Задумка была не в этом.",
		"Esperé toda la tarde para ver a {0} y me sacó seguridad. Sólo quería su firma.": "Я весь день ждал, чтобы увидеть {0}, а охрана меня вывела. Я просто хотел автограф.",
	},

























	"match": {
		"Mejor del Mundial": "Лучший игрок мундиаля",
		"Mejor de la Copa continental": "Лучший игрок континентального турнира",
		"Bota de la Copa continental": "Лучший бомбардир континентального турнира",
		"Mejor (Mundial)": "Лучший (ЧМ)",
		"Mejor (Continental)": "Лучший (конт.)",
		"Bota (Continental)": "Бомбардир (конт.)",
		"Figura del Mundial": "Звезда мундиаля",
		"JUEGOS OLÍMPICOS": "ЛЕТНИЕ ИГРЫ",
		"Campeón Olímpico": "Чемпион Летних игр",
		"Oro olímpico": "Золото Летних игр",
		"Oro Olímpico": "Золото Летних игр",
		"Ganar el oro en los Juegos Olímpicos.": "Выиграй золото Летних игр.",
		"El oro que no se compra. Se cuelga del cuello.": "Золото, которое не купишь. Его вешают на шею.",
		"JUEGOS OLÍMPICOS: oro para {0}": "ЛЕТНИЕ ИГРЫ: золото — {0}",
		"{0}: ORO en los Juegos Olímpicos": "{0}: ЗОЛОТО Летних игр",
		"{0}: plata en los Juegos Olímpicos": "{0}: серебро Летних игр",
		"{0}: bronce en los Juegos Olímpicos": "{0}: бронза Летних игр",


		"NO SOLTÓ": "НЕ ОТПУСТИЛ",
		"SE LA APRETÓ": "ЕГО ПЕРЕЖАЛИ",
		"ÉSTA VA POR TI": "ЭТО ДЛЯ ТЕБЯ",
		"SE LA APRETARON, Y LO SABE": "ЕГО ПЕРЕЖАЛИ, И ОН ЭТО ЗНАЕТ",
		"COMO SIEMPRE: NO SOLTÓ": "КАК ВСЕГДА: НЕ ОТПУСТИЛ",
		"HOY SE LA APRETARON": "СЕГОДНЯ ЕГО ПЕРЕЖАЛИ",
		"NI UN CENTÍMETRO": "НИ САНТИМЕТРА",
		"SE DEJÓ APRETAR": "ДАЛ СЕБЯ ПЕРЕЖАТЬ",
		"NO SOLTÓ, POR UNA VEZ": "НА ЭТОТ РАЗ ВЫСТОЯЛ",
		"SE LA APRETÓ. LE DA IGUAL": "ЕГО ПЕРЕЖАЛИ. ЕМУ ВСЕ РАВНО",



		"TU EX TÉCNICO NO CONTABA CONTIGO": "БЫВШИЙ ТРЕНЕР НА ТЕБЯ НЕ СТАВИЛ",
		"TU EX TÉCNICO APLAUDE TU GOL": "БЫВШИЙ ТРЕНЕР АПЛОДИРУЕТ ГОЛУ",
		"GOL A TU EX TÉCNICO": "ГОЛ БЫВШЕМУ ТРЕНЕРУ",
		"TU EX TÉCNICO SE VA SIN MIRARTE": "БЫВШИЙ ТРЕНЕР УШЕЛ, НЕ ВЗГЛЯНУВ",
		"TU EX TÉCNICO TE APLAUDE": "ТЕБЕ ХЛОПАЕТ БЫВШИЙ ТРЕНЕР",
		"TU EX TÉCNICO FESTEJA": "БЫВШИЙ ТРЕНЕР ЛИКУЕТ",
		"APRETASTE A TU EX TÉCNICO": "ТЫ ПЕРЕЖАЛ БЫВШЕГО ТРЕНЕРА",
		"TU EX TÉCNICO PUEDE CONTIGO": "БЫВШИЙ ТРЕНЕР СИЛЬНЕЕ ТЕБЯ",
		"¡PICA RÁPIDO!": "ЖМИ БЫСТРЕЕ!",
		"LLEVA LA RAYA HASTA TU LADO": "ТЯНИ ЛИНИЮ НА СВОЮ СТОРОНУ",



		"EL VOLADO": "ЖРЕБИЙ",
		"Cara": "Орел",
		"Sol": "Решка",
		"¿Cara o sol?": "Орел или решка?",
		"Tu equipo pide {0}.": "Твоя команда выбирает: {0}.",
		"La moneda dice {0}.": "Монета показывает: {0}.",
		"¡GANAS EL VOLADO! Pateas con tu gente.": "ЖРЕБИЙ ТВОЙ! Бьешь перед своими болельщиками.",
		"Pierdes el volado: pateas ante la grada rival.": "Жребий не твой: бьешь перед трибуной соперника.",

		"¡LE DISTE AL ÁRBITRO!": "ТЫ ПОПАЛ В СУДЬЮ!",
		"ROJA DIRECTA · {0} {1} DE SANCIÓN": "ПРЯМАЯ КРАСНАЯ · ДИСКВ. {0} {1}",






		"El derbi. Fuera de casa. Aquí no se perdona nada.": "Дерби. На выезде. Здесь не прощают ничего.",
		"Derbi. Noventa minutos que se recuerdan un año.": "Дерби. Девяносто минут, о которых будут говорить весь год.",
		"Última jornada. Lo que pase aquí ya no se arregla.": "Последний тур. Что случится здесь — уже не исправить.",
		"{0}. Y tú llegas en racha.": "{0}. И ты в ударе.",

		"Te van a apretar arriba desde el primer balón. Sacúdetelos rápido.": "Тебя будут прессинговать с первого мяча. Уходи от них быстро.",
		"Hoy toca autobús: once atrás esperándote. La paciencia también juega.": "Сегодня автобус: все одиннадцать сзади и ждут тебя. Терпение тоже играет.",
		"Te marcan al hombre. Cada carrera tuya se lleva a uno puesto.": "Персональная опека. Каждый твой рывок уводит за собой одного.",
		"Línea alta y sin prisa. La espalda de esa zaga es la jugada.": "Высокая линия, без спешки. Зона за спиной защитников — вот где твой шанс.",
		"Campo de {0}. A ver quién se acuerda de ti al final.": "Стадион клуба {0}. Посмотрим, кто вспомнит тебя в конце.",

		"Enfrente, {0}. Una temporada juntos en {1}; se acuerda de ti.": "Напротив — {0}. Один сезон вместе в {1}; он тебя помнит.",
		"Enfrente, {0}: {2} temporadas juntos en {1}. Te conoce de memoria.": "Напротив — {0}: {2} сез. вместе в {1}. Знает тебя наизусть.",
		"{0} te conoce de {1}. Sabe hacia dónde vas a romper.": "{0} знает тебя по {1}. Знает, куда ты рванешь.",
		"{0} jugó contigo en {1}: te lee antes de que toques.": "{0} играл с тобой в {1}: читает тебя раньше, чем ты коснешься мяча.",
		"Lo callaste. Su estadio entero, callado.": "Ты их заткнул. Весь стадион молчит.",
		"En el 90 y en su casa. De esos que no se olvidan.": "На 90-й минуте и у них дома. Такое не забывается.",
		"Le has dado la vuelta. Tú solo.": "Ты перевернул игру. В одиночку.",
		"Tres. Te llevas el balón a casa.": "Третий. Мяч забираешь домой.",
		"Y van dos. El campo es tuyo.": "Второй. Поле твое.",
		"En el derbi. Ese lo vas a contar mucho tiempo.": "В дерби. Об этом будешь рассказывать долго.",
		"Empate. Y quedan minutos.": "Снова ничья. И время еще есть.",
		"Te lo empatan al final. Y te toca a ti arreglarlo.": "Сравняли в концовке. И исправлять тебе.",
		"{0} se pone por delante. La grada lo nota.": "{0} выходит вперед. Трибуны это чувствуют.",
		"Otro. Esto se está yendo.": "Еще один. Матч ускользает.",

		"Vuelves a {0}. Aquí jugaste {1} temporadas.": "Ты вернулся в {0}. Здесь ты провел {1} сез.",
		"Enfrente, {0}. Tu antiguo club.": "Напротив — {0}. Твой бывший клуб.",
		"{0} te cedió. Hoy le devuelves el favor.": "{0} отдавал тебя в аренду. Сегодня вернешь должок.",
		"{1} temporadas en {0}. Hoy celebras allí.": "{1} сез. в {0}. Сегодня ты празднуешь там.",
		"{0} te dejó ir hace nada. Error suyo.": "{0} отпустил тебя совсем недавно. И зря.",
		"Le marcas a {0}, tu antiguo club.": "Ты забиваешь бывшему клубу — {0}.",
		"{0} jugó contigo en {1}. Y hoy te marca.": "{0} играл с тобой в {1}. А сегодня забивает тебе.",
		"Tu club cedió a {0}. Y él se lo cobra.": "Твой клуб отдал {0} в аренду. И он мстит.",
		"{0}: {1} temporadas en tu club. Hoy, rival.": "{0}: {1} сез. в твоем клубе. Сегодня — соперник.",
		"{0}, ex de tu club. Duele el doble.": "{0} — бывший игрок твоего клуба. Больно вдвойне.",
		"El palo. Un centímetro más adentro y estabas celebrando.": "Штанга. Сантиметр в сторону — и ты бы уже праздновал.",
		"Otra vez el hierro. Hoy no te quiere.": "Снова штанга. Сегодня она против тебя.",
		"Se lo pusiste. El gol es suyo; el pase, tuyo.": "Ты выложил ему мяч на блюдечке. Гол его, пас — твой.",


		"Levanta la mano. Nadie lo mira. Otra vez.": "Он поднимает руку. Никто не смотрит. Опять.",
		"Está solo y lo ve todo el estadio menos sus compañeros.": "Он абсолютно открыт, и это видит весь стадион, кроме его партнеров.",
		"La juegan por el otro lado. Ya ni la pide.": "Играют через другой фланг. Он уже даже не просит.",
		"Se ofrece, le dan la espalda. Este equipo no es suyo.": "Открывается — ему поворачиваются спиной. Это не его команда.",
		"Había pase y eligieron el otro. Pasa mucho últimamente.": "Пас был, но выбрали другой. В последнее время такое часто.",
		"Le llega y el estadio entero silba. Se le va larga.": "Мяч приходит к нему, и весь стадион свистит. Мяч уходит у него с ноги.",
		"El balón es suyo. El abucheo también. La pierde.": "Мяч у него. И свист — ему же. Потеря.",
		"Un pito por cada toque. No controla ni la más fácil.": "Свист на каждое касание. Не может принять даже самый простой мяч.",
		"La grada le cae encima y el control se le va largo.": "Трибуны давят на него, и мяч отскакивает далеко.",



		"Uno se levanta en la tercera fila. Y no es para aplaudir.": "В третьем ряду встает один человек. И не для того, чтобы аплодировать.",
		"Ya hay quien le lleva la cuenta de los fallos desde la grada.": "На трибуне уже кто-то считает его промахи.",
		"Se oye a uno solo por encima de todos, y no dice nada bonito.": "Один голос перекрывает всех, и ничего доброго он не кричит.",
		"El estadio se levanta sólo de verlo con el balón.": "Стадион встает, стоит ему получить мяч.",
		"Corean su nombre. Y todavía no ha hecho nada.": "Скандируют его имя. А он еще ничего не сделал.",
		"Se oye el murmullo en cuanto la toca.": "Гул поднимается, как только он касается мяча.",
		"Hasta su propia gente le silba al oír su nombre.": "Даже свои свистят, когда слышат его имя.",
		"Silbidos de los suyos. Hoy lo miran con lupa.": "Свистят свои. Сегодня каждое касание под микроскопом.",
		"Su grada no le perdona una. Cada toque, con lupa.": "Свои трибуны не прощают ему ничего. Каждое касание — под лупой.",
		"Ganado en su campo. Eso vale doble.": "Победа на их поле. Это стоит вдвойне.",
		"El derbi es tuyo.": "Дерби твое.",
		"Dijiste que lo ganarías, y lo ganaste.": "Ты сказал, что выиграешь, — и выиграл.",
		"Hablaste antes del derbi. Hoy te toca callar.": "Ты болтал перед дерби. Сегодня тебе лучше помолчать.",
		"BRAVATA": "БРАВАДА",
		"{0} cumplió su palabra ante el {1}": "{0} сдержал слово в матче с {1}",
		"{0} se traga sus palabras ante el {1}": "{0} сел в лужу в матче с {1}",
		"Cumpliste tu palabra ante el {0}": "Ты сдержал слово в матче с {0}",
		"Te tragas tus palabras ante el {0}": "Ты сел в лужу в матче с {0}",
		"Se acabó. Y lo dejaste escapar.": "Все кончено. И ты упустил победу.",


		"Desde tu campo. Todo el césped por delante.": "С твоей половины. Все поле впереди.",
		"Balón tuyo en tu mitad. Ahora hay que cruzarla entera.": "Мяч твой, на своей половине. Теперь надо пройти все поле.",
		"Se la das y sigues. Así se sale de la presión.": "Отдал и пошел. Так уходят от прессинга.",
		"Un toque y a correr. La presión se queda atrás.": "Касание — и вперед. Прессинг остался позади.",
		"Se la das a {0}, que ya sabía que venía.": "Пас на {0} — тот уже знал, что мяч придет.",
		"{0} y tú, de memoria. Ni hizo falta mirar.": "Ты и {0} — на одной волне. Даже смотреть не пришлось.",
		"Medio campo cruzado sin un susto.": "Центр поля пройден — и без нервов.",
		"Ya estás en su mitad. Y con el balón.": "Ты уже на их половине. И с мячом.",
		"Se repliegan. Te dejaron llegar, no entrar.": "Они отходят назад. Дали подойти, но не войти.",
		"Cuarenta y cinco segundos de toque. Y nada que contar.": "Сорок пять секунд перепасовки. И ничего не вышло.",
		"Demasiado solo, demasiado tiempo. Te la quitaron.": "Слишком долго один. У тебя отобрали мяч.",
		"Se enamoró del balón. Y lo pagó.": "Влюбился в мяч. И поплатился.",
		"Te bajan en tu campo. Falta, y a empezar de nuevo.": "Тебя сбивают на твоей половине. Фол, и все сначала.",
		"Salió de tu área y acabó en la suya. La jugada es tuya.": "Началась в твоей штрафной, закончилась в их. Эта атака — твоя.",
		"Tú la sacaste, él la metió. Así se construye.": "Ты вывел мяч, он забил. Так и строят игру.",

		"Robo en tu campo. ¡A la contra!": "Отбор на своей половине. В контратаку!",
		"La recuperas en tu mitad. Ahora, rápido.": "Перехват на своей половине. Теперь быстро.",
		"Están todos arriba. Hay campo para correr.": "Они все в атаке. Есть где разбежаться.",
		"Se volcaron buscando el gol. Su espalda es tuya.": "Бросились отыгрываться всей командой. Пространство за спиной — твое.",
		"Con uno menos, a la contra. Es lo que toca.": "В меньшинстве — играем на контратаках. Сейчас только так.",
		"Diez contra once: se defiende y se sale rápido.": "Десять против одиннадцати: обороняемся и быстро выходим.",
		"Se la das y arrancas. Cada segundo cuenta.": "Отдал и рванул. Каждая секунда на счету.",
		"Pase y a correr. Que no les dé tiempo a volver.": "Пас и вперед. Не дай им вернуться.",
		"Tardaste. Ya volvieron todos.": "Замешкался. Все уже вернулись.",
		"La contra se enfrió. Ya están ordenados atrás.": "Контратака остыла. Сзади уже выстроились.",
		"Falta táctica. Te cortan la contra.": "Тактический фол. Контратаку прервали.",
		"Contra de manual. De tu campo a la red.": "Хрестоматийная контратака. От твоей половины до сетки.",
		"Tú la llevaste, él la metió. Contra perfecta.": "Ты провез, он добил. Идеальная контратака.",
		"Juegan con diez. Busca al que está libre.": "Они вдесятером. Найди свободного.",
		"Tres contra dos. Uno de los tuyos está solo.": "Трое против двоих. Один из твоих свободен.",

		"Contragolpe": "Контратака",
		"El hombre de más": "Игра в большинстве",
		"Te la quitaron en tu área. Ese regalo no se devuelve.": "Мяч отобрали в твоей штрафной. Такой подарок не возвращают.",
		"Perdida en tu área, gol en tu portería. Así de corto.": "Потеря в твоей штрафной — гол в твои ворота. Вот так быстро.",
		"Te la roban ahí mismo y tu portero te salva la cara.": "Мяч отбирают прямо там, и вратарь спасает тебя от позора.",
		"Se la quitaron en tu área y la tiraron fuera. Hoy sí; mañana, no.": "Мяч отобрали в твоей штрафной и пробили мимо. Сегодня повезло; завтра — нет.",
		"Desde el portero. Corta, y sin regalar.": "От вратаря. Коротко и без подарков.",
		"Le cortan el primer pase. En tu área. Malo.": "Первый пас перехвачен. В твоей штрафной. Плохо.",
		"Saque de meta. Tu portero tiene el balón y tú, la decisión.": "Удар от ворот. Мяч у твоего вратаря, решение — за тобой.",
		"Te vienen a buscar arriba. El portero no puede pensárselo.": "Тебя прессуют высоко. Вратарю некогда думать.",
		"Presión alta al saque. Corto es un riesgo; largo, una moneda al aire.": "Высокий прессинг на ударе от ворот. Короткий розыгрыш — риск, длинный — лотерея.",
		"En corto, a los pies. Salida limpia desde atrás.": "Коротко, в ноги. Чистый выход из обороны.",
		"Saque corto y balón dominado. Así empieza una jugada, no un despeje.": "Короткий розыгрыш, мяч под контролем. Так начинается атака, а не вынос.",
		"La revienta y la baja un compañero. Medio campo de un golpe.": "Он выносит далеко, и партнер обрабатывает. Полполя одним ударом.",
		"Largo y con destinatario. La gana tu jugador y sigue el juego.": "Длинная передача — и точно по адресу. Твой игрок выигрывает мяч, игра продолжается.",
		"Tu portero te busca. Ahora es tuya, con todo el campo por delante.": "Вратарь находит тебя. Теперь мяч твой, все поле впереди.",
		"Del guante a tus pies. A partir de aquí, la jugada es tuya.": "Из перчатки — тебе в ноги. Дальше атака твоя.",
		"La reventó y la ganaron ellos. Saque largo, balón perdido.": "Вынес далеко, а мяч забрали они. Длинный удар — мяч потерян.",
		"Saque largo a ninguna parte: cabeza rival y a defender.": "Длинный удар в никуда: соперник головой, и снова защищаемся.",
		"El saque no encuentra a nadie. Balón muerto y a empezar otra vez.": "Удар никого не нашел. Мяч ничей — и все сначала.",
		"Se fue sin dueño. Un saque de meta que no llegó a nadie.": "Ушел без хозяина. Удар от ворот, который никому не достался.",
		"Se la quitan al primer pase, a un paso de tu portería. Regalo.": "Перехват первого паса в шаге от твоих ворот. Подарок.",
		"Del saque de meta al fondo de la red. Toda la cancha en una jugada.": "От удара от ворот — в сетку. Все поле за одну атаку.",
		"Empezó en el guante de tu portero y acabó en gol. Así se sale.": "Началось в перчатке твоего вратаря и закончилось голом. Вот так выходят из обороны.",
		"De tu portero a la red sin pasar por ti. Lo viste de cerca.": "От твоего вратаря — в сетку, мимо тебя. Ты видел все вблизи.",
		"Gol de la salida de meta. Tú no la tocaste, pero la viste nacer.": "Гол после удара от ворот. Ты мяч не трогал, но видел, как рождается атака.",
		"Salió de tu portero y la acabaste tú. Cien metros de jugada.": "От твоего вратаря — и ты завершил. Сто метров футбола.",
		"Saque de meta, campo cruzado y gol tuyo. De área a área.": "Удар от ворот, все поле пройдено, и гол твой. От штрафной до штрафной.",
		"Saque de banda en corto, a tus pies. Ahora decides tú.": "Короткий аут, тебе в ноги. Теперь решаешь ты.",
		"Te la saca el lateral y la jugada sigue. Balón cuidado.": "Крайний защитник вбрасывает тебе, игра продолжается. Мяч сохранен.",
		"Te la saca al pecho. Bájala y a jugar.": "Вбрасывание тебе на грудь. Обработай — и играй.",
		"Saque de banda, control de pecho y la jugada viva.": "Аут, прием на грудь — атака живет.",
		"La colgaron con las manos y la metiste con la cabeza.": "Навесили руками, а ты забил головой.",
		"Saque de banda al área y cabezazo a la red. De pizarra.": "Аут в штрафную и удар головой в сетку. Как на тактической доске.",
		"La cuelgan desde la banda y la despejan ellos. A por la siguiente.": "Навес из аута, и они выносят. Ждем следующий.",
		"Saque largo al área y cabeza rival. Esta vez no.": "Длинный аут в штрафную, и защитник выбивает головой. Не в этот раз.",
		"Cabezazo tras el saque de banda y el portero lo saca.": "Удар головой после аута — вратарь отбивает.",
		"Saque largo, remate de cabeza y una parada de las buenas.": "Длинный аут, удар головой и отличный сейв.",
		"Saque de banda al área, cabezazo y fuera. Faltó dirección.": "Аут в штрафную, удар головой — мимо. Не хватило точности.",
		"La peinas tras el saque largo y se marcha. Cerca.": "Ты скидываешь мяч головой после длинного аута, и он уходит мимо. Было близко.",





		"SELECCION": "СБОРНАЯ",
		"LIBRO DE RECORDS": "КНИГА РЕКОРДОВ",




		"Campeón del Mundo": "Чемпион мира",
		"Bota de Oro del Mundial": "Лучший бомбардир мундиаля",
		"Campeón de Champions": "Обладатель Кубка элиты",
		"Campeón de Europa League": "Обладатель Кубка Европы",
		"Campeón del Mundo de Clubes": "Победитель клубного мундиаля",
		"Campeón continental": "Чемпион континента",
		"Campeón de Liga": "Чемпион лиги",
		"Campeón de Copa": "Обладатель кубка",
		"Ascenso": "Повышение",
		"Mejor Jugador de la Liga": "Лучший игрок лиги",
		"Pichichi de la Liga": "Лучший бомбардир лиги",
		"Máximo Asistente de la Liga": "Лучший ассистент лиги",
		"Mejor de la Champions": "Лучший игрок Кубка элиты",
		"Bota de la Champions": "Лучший бомбардир Кубка элиты",
		"Máximo Asistente de la Champions": "Лучший ассистент Кубка элиты",
		"Mejor de la Europa League": "Лучший игрок Кубка Европы",
		"Bota de la Europa League": "Лучший бомбардир Кубка Европы",
		"Máximo Asistente de la Europa League": "Лучший ассистент Кубка Европы",


		"Campeón de Conference": "Обладатель Кубка Челлендж",
		"Mejor de la Conference": "Лучший игрок Кубка Челлендж",
		"Bota de la Conference": "Лучший бомбардир Кубка Челлендж",
		"Máximo Asistente de la Conference": "Лучший ассистент Кубка Челлендж",
		"Mejor de la Copa": "Лучший игрок кубка",
		"Bota de la Copa": "Лучший бомбардир кубка",
		"Máximo Asistente de la Copa": "Лучший ассистент кубка",
		"Mejor del Mundial de Clubes": "Лучший игрок клубного мундиаля",
		"Bota del Mundial de Clubes": "Лучший бомбардир клубного мундиаля",
		"Máximo Asistente del Mundial de Clubes": "Лучший ассистент клубного мундиаля",
		"Jugador del Partido": "Игрок матча",
		"Jugador del Mes": "Игрок месяца",
		"Bota de Oro": "Лучший бомбардир",
		"MVP de la temporada": "Лучший игрок сезона",
		"Bota (Mundial)": "Бомбардир (ЧМ)",
		"Mundial de Clubes": "Клубный мундиаль",
		"Continental (selección)": "Континент (сборная)",
		"Liga": "Лига",
		"Copa": "Кубок",
		"Mejor (Liga)": "Лучший (лига)",
		"Pichichi (Liga)": "Бомбардир (лига)",
		"Asist. (Liga)": "Ассист. (лига)",
		"Mejor (Champions)": "Лучший (КЭ)",
		"Bota (Champions)": "Бомбардир (КЭ)",
		"Asist. (Champions)": "Ассист. (КЭ)",
		"Mejor (Europa)": "Лучший (КЕ)",
		"Bota (Europa)": "Бомбардир (КЕ)",
		"Asist. (Europa)": "Ассист. (КЕ)",


		"Mejor (Conference)": "Лучший (КЧ)",
		"Bota (Conference)": "Бомбардир (КЧ)",
		"Asist. (Conference)": "Ассист. (КЧ)",
		"Mejor (Copa)": "Лучший (кубок)",
		"Bota (Copa)": "Бомбардир (кубок)",
		"Asist. (Copa)": "Ассист. (кубок)",
		"Mejor (Mundialito)": "Лучший (клуб. ЧМ)",
		"Bota (Mundialito)": "Бомбардир (клуб. ЧМ)",
		"Asist. (Mundialito)": "Ассист. (клуб. ЧМ)",
		"MVP": "MVP",



		"PAUSA": "ПАУЗА",
		"REANUDAR": "ПРОДОЛЖИТЬ",
		"REINICIAR": "ЗАНОВО",
		"OTRO PARTIDO": "ЕЩЕ МАТЧ",
		"Toca para saltar": "Нажми, чтобы пропустить",
		"Gira la vista · suelta para volver a apuntar":
			"Поворот вида · отпусти, чтобы снова целиться",
		"Arrastra hacia atrás para apuntar": "Тяни назад, чтобы прицелиться",
		"CABEZAZO · arrastra hacia atrás para apuntar": "УДАР ГОЛОВОЙ · тяни назад, чтобы прицелиться",
		"Toca el balón · arrastra para girar": "Нажми на мяч · тяни, чтобы повернуть",


		"CENTRO · otro dedo vuelve al tiro": "НАВЕС · другой палец — снова удар",
		"CENTRO · toca el balón": "НАВЕС · нажми на мяч",



		"modoTIRO": "УДАР",
		"modoCENTRO": "НАВЕС",
		"modoREGATE": "ДРИБЛИНГ",


		"modoCORRER": "БЕГ",

		"modoDESPEJE": "ВЫНОС",

		"modoVOLEA": "С ЛЕТА",
		"modoCABEZAZO": "ГОЛОВОЙ",
		"modoCHILENA": "НОЖНИЦЫ",



		"vistaARCO": "ВОРОТА",
		"vistaCOMPAÑEROS": "ПАРТНЕРЫ",
		"Toca para continuar": "Нажми, чтобы продолжить",


		"Arrastra para seguir": "Тяни, чтобы продолжить",



		"hudNOTA": "ОЦЕНКА",
		"notaGOL": "ГОЛ",
		"notaATAJADA": "СЕЙВ",
		"notaPALO": "ШТАНГА",
		"notaFUERA": "МИМО",
		"notaBLOQUEADO": "БЛОК",
		"notaDESPEJE": "ВЫНОС",
		"notaFUERA DE JUEGO": "ОФСАЙД",
		"notaBALÓN PERDIDO": "ПОТЕРЯ",
		"notaSIN CONTACTO": "МИМО МЯЧА",
		"notaEN PROPIA": "АВТОГОЛ",
		"notaREGATE": "ДРИБЛИНГ",

		"notaROBO": "ОТБОР",
		"notaDESBORDADO": "ОБЫГРАН",
		"notaPENAL": "ПЕНАЛЬТИ",
		"notaFALTA": "ФОЛ",
		"notaPASE": "ПАС",
		"notaPASE CLAVE": "КЛЮЧЕВОЙ ПАС",
		"notaASISTENCIA": "АССИСТ",




		"notaLA ATRAPA EL PORTERO": "ВРАТАРЬ ЗАБРАЛ",



		"notaSE TE FUE FUERA": "УШЕЛ В АУТ",



		"notaFALLOS SEGUIDOS": "ПРОМАХИ ПОДРЯД",
		"notaNADA": "НИЧЕГО",

		"EJERCICIO {0} DE {1}": "УПРАЖНЕНИЕ {0} ИЗ {1}",
		"META:": "ЦЕЛЬ:",
		"EMPEZAR": "НАЧАТЬ",
		"SIGUIENTE": "ДАЛЕЕ",
		"TERMINAR": "ГОТОВО",
		"LA ACADEMIA": "АКАДЕМИЯ",
		"{0} / {1} ESTRELLAS": "ЗВЕЗДЫ: {0} / {1}",

		"Cinco ejercicios para aprender a jugar."
		+ " Cuantas más estrellas saques, mejores ofertas de club recibirás.":
			"Пять упражнений, чтобы освоить игру. Чем больше звезд соберешь, тем лучше будут предложения клубов.",
		"JUGAR LA ACADEMIA": "ПРОЙТИ АКАДЕМИЮ",
		"ÚLTIMOS 15 MINUTOS": "ПОСЛЕДНИЕ 15 МИНУТ",
		"TOCA PARA SEGUIR": "НАЖМИ — ДАЛЕЕ",
		"SALTAR TUTORIAL": "БЕЗ ОБУЧЕНИЯ",
		"Estos clubes se fijaron en ti. Elige tu oferta:":
			"Эти клубы обратили на тебя внимание. Выбери предложение:",
		"ELEGIR YO MISMO": "ВЫБЕРУ САМ",
		"FICHAR": "ПЕРЕЙТИ",
		"LA OFERTA DEL OJEADOR": "ПРЕДЛОЖЕНИЕ СКАУТА",
		"Boletín perfecto: mejor sueldo y rol, y +2 puntos de habilidad.":
			"Идеальный табель: выше зарплата и роль, плюс 2 очка навыков.",
		"Tu boletín mejora el sueldo y el rol de estas ofertas.":
			"Твой табель улучшает зарплату и роль в этих предложениях.",
		"Tu boletín mejora el sueldo de estas ofertas.":
			"Твой табель улучшает зарплату в этих предложениях.",


		"TE FICHAN COMO: {0}": "РОЛЬ: {0}",
		"EMPEZARÍAS: {0}": "НАЧНЕШЬ: {0}",
		"MUÉVETE": "ДВИГАЙСЯ",
		"PÉGALE": "ПРОБЕЙ",
		"ENCARA": "ОБЫГРАЙ",
		"SIRVE AL ÁREA": "ПОДАЙ НАВЕС",









		"Apoya el dedo dentro del círculo: ahí nace todo. Sácalo del círculo y corres hacia el lado contrario al que jalas. Suelta y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Поставь палец внутрь круга: с этого все начинается. Выведи его из круга — и побежишь в сторону, противоположную той, куда тянешь. Отпусти — и встанешь как вкопанный. Доведи мяч до красного диска: наступишь — он погаснет и загорится следующий, всегда с другой стороны. Вести мяч — значит выбирать, куда идти, а не бежать прямо.",
		"Pisa las 4 zonas rojas, en orden.": "Наступи на 4 красные зоны по порядку.",
		"Nadie te la quita y no hay reloj. Las estrellas son para quien las encadena rápido.": "Мяч никто не отберет, и таймера нет. Звезды — тому, кто быстро проходит зоны одну за другой.",
		"Jala hacia atrás y sales corriendo hacia el disco.": "Потяни назад — и побежишь к диску.",
		"Dos tiros de práctica: el primero a puerta vacía, el segundo ya con portero. Después, 2 goles en 4 intentos.": "Два тренировочных удара: первый по пустым воротам, второй уже с вратарем. Потом — 2 гола с 4 попыток.",
		"Los dos primeros no puntúan. En los otros, cuantos menos intentos gastes, más estrellas.": "Первые два не в зачет. Дальше чем меньше попыток потратишь, тем больше звезд.",
		"Las cuatro zonas": "Четыре зоны",
		"Tiro a puerta": "Удар по воротам",
		"Jala hacia atrás, como una resortera: la guía apunta hacia"
		+ " adelante. Al soltar, toca el balón — y dónde lo tocas manda."
		+ " La costura marca el centro: ahí sale tenso. Cuanto más abajo"
		+ " de ella, más lo elevas, hasta la cuchara. Y cuanto más al"
		+ " borde, menos potencia: el pepinazo va al centro. Con dos dedos"
		+ " giras la vista y apuntas desde otro ángulo.":
			"Тяни назад, как рогатку: указатель целится вперед. Отпустив, коснись мяча — и важно, где именно. Шов отмечает центр: туда — и мяч летит прямо, как струна. Чем ниже шва, тем выше полетит, вплоть до парашюта. А чем ближе к краю, тем меньше силы: пушка — точно в центр. Двумя пальцами поворачиваешь вид и целишься с другого угла.",
		"Cuantos menos intentos gastes, más estrellas.":
			"Чем меньше попыток потратишь, тем больше звезд.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "Соперники рядом, впереди поле: веди мяч и ПЕРЕЙДИ на половину соперника — до светящейся линии не бьешь, а обводишь, и на каждом отрезке навстречу выходят новые игроки. Потом — один на один: бей сразу или веди мяч и вернись в круг, чтобы встать как вкопанный и спокойно прицелиться.",
		"Primero cruza la media cancha, hasta la raya encendida. Después, el mano a mano: 1 gol en 3 intentos.": "Сначала перейди центр поля, до светящейся линии. Потом — один на один: 1 гол с 3 попыток.",
		"La salida es un ensayo y no puntúa. Cuantos menos intentos"
		+ " gastes en el mano a mano, más estrellas.":
			"Проход до линии — репетиция, он не в зачет. Чем меньше попыток потратишь один на один, тем больше звезд.",
		"Marca 1 gol en 3 intentos.": "Забей 1 гол с 3 попыток.",



		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, dos PASES — dentro del círculo pasas —: el cambio de banda, buscando al compañero libre en la otra punta, y el relevo. El relevo es la regla más rara del juego: si el pase le llega a un compañero fuera del área, pasas a jugar con él; si cae dentro del área no hay control que valga y remata de primera.": "Это НАВЕСЫ: мяч подается в штрафную. Угловой сразу начинается с НАВЕСА — это показывает индикатор справа вверху. Чтобы переключаться между НАВЕСОМ (верхом) и УДАРОМ (низом), нажми другим пальцем, пока целишься, или на сам индикатор. Ищи голову партнера, а не ворота. А в конце — два ПАСА (внутри круга ты пасуешь): перевод на другой фланг, на свободного партнера, и эстафета. Эстафета — самое странное правило игры: если пас доходит до партнера за пределами штрафной, дальше ты играешь им; если мяч падает в штрафную, принимать некогда — он бьет с ходу.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve los dos pases.": "Забей 1 гол с 6 попыток: 3 угловых и 3 навеса. И выполни оба паса.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. Los dos pases son ensayo y no puntúan.": "Забить можно с любой из шести попыток. Чем раньше, тем больше звезд. Два паса — репетиция, они не в зачет.",
		"El relevo": "Эстафета",
		"Dentro del círculo pasas · al de fuera del área lo controlas tú": "Внутри круга — пас · игрок вне штрафной становится твоим",
		"La barrera tapa el camino raso: elévalo por encima tocando el"
		+ " balón abajo. El costado lo curva, si te atreves. Y el examen"
		+ " final: el penal. Respira. Tú eliges la esquina.":
			"Стенка закрывает путь низом: подними мяч над ней, коснувшись его снизу. Удар по боку мяча закручивает его — если решишься. И финальный экзамен: пенальти. Выдохни. Угол выбираешь ты.",
		"Libre: 1 gol en 3 intentos · Penal: 1 en 2.":
			"Штрафной: 1 гол с 3 попыток · Пенальти: 1 из 2.",


		"SE ACABARON LOS INTENTOS": "ПОПЫТКИ КОНЧИЛИСЬ",
		"TE LA QUITÓ EL PORTERO": "ВРАТАРЬ ЗАБРАЛ МЯЧ",
		"EJERCICIO {0} TERMINADO": "УПРАЖНЕНИЕ {0} ГОТОВО",
		"SIN ESTRELLAS": "БЕЗ ЗВЕЗД",
		"REPETIR {0}": "ПОВТОР {0}",
		"VER MIS OFERTAS": "МОИ ПРЕДЛОЖЕНИЯ",
		"Con ellas se decide qué clubes te ofrecen contrato."
		+ " Todo esto se entrena en Práctica cuando quieras.":
			"От них зависит, какие клубы предложат тебе контракт. Все это можно отработать в режиме «Тренировка», когда захочешь.",
		"Unos diez minutos. Puedes salirte cuando quieras.":
			"Минут десять. Выйти можно в любой момент.",
		"SALTAR LA ACADEMIA": "БЕЗ АКАДЕМИИ",
		"Eligiendo tu club a mano pierdes el premio del"
		+ " boletín.":
			"Если выберешь клуб сам, потеряешь бонус за табель.",
		"< MENÚ": "< МЕНЮ",


		"TERMINAR Y VER OFERTAS": "ГОТОВО · ПРЕДЛОЖЕНИЯ",
		"EMPEZAR LA ACADEMIA DE CERO": "НАЧАТЬ АКАДЕМИЮ ЗАНОВО",
		"¿SEGURO? TOCA OTRA VEZ": "ТОЧНО? НАЖМИ ЕЩЕ РАЗ",

		"PASO 1 DE 3 · QUIÉN ERES": "ШАГ 1 ИЗ 3 · КТО ТЫ",
		"PASO 3 DE 3 · DÓNDE EMPIEZAS": "ШАГ 3 ИЗ 3 · ГДЕ НАЧНЕШЬ",


		"TUS CUALIDADES EN ESTE EJERCICIO": "ТВОИ НАВЫКИ В ЭТОМ УПРАЖНЕНИИ",


		"TOCA PARA JUGAR": "НАЖМИ И ИГРАЙ",
		"TOCA PARA EMPEZAR": "НАЖМИ ДЛЯ СТАРТА",
		"{0}: SIN ESTRELLAS": "{0}: БЕЗ ЗВЕЗД",



		"Apoya el dedo dentro de tu círculo.":
			"Поставь палец внутрь своего круга.",
		"Saca el dedo del círculo: corres al lado contrario.":
			"Выведи палец из круга — бежишь в обратную сторону.",
		"Suelta y paras en seco.":
			"Отпусти — и встанешь как вкопанный.",
		"Dentro del círculo apuntas: la guía crece.":
			"Внутри круга ты целишься: указатель растет.",
		"Sacas el dedo del círculo y regateas, sin soltar.":
			"Выводишь палец из круга и обводишь, не отпуская.",
		"Vuelves a entrar y paras en seco, apuntando.":
			"Возвращаешься внутрь — и встаешь как вкопанный, целясь.",
		"Sueltas dentro y le pegas.":
			"Отпускаешь внутри — и бьешь.",
		"Toca el pasto fuera de tu círculo y giras la vista.":
			"Нажми на газон вне своего круга — и вид повернется.",
		"Otro toque y la vista vuelve.":
			"Еще касание — и вид вернется.",
		"Fuera del círculo conduces: cruza la raya.":
			"Вне круга ты ведешь мяч: пересеки линию.",
		"Apunta al área y aguanta el dedo.":
			"Целься в штрафную и держи палец.",
		"Con otro dedo cambias entre CENTRO y TIRO.":
			"Другим пальцем переключаешь НАВЕС и УДАР.",

		"Empuja este stick y corres hacia el disco.":
			"Толкни этот стик — и побежишь к диску.",
		"Empuja este stick y conduces: cruza la raya.":
			"Толкни этот стик — и поведешь мяч: пересеки линию.",
		"Empuja este stick y conduces.":
			"Толкни этот стик — и поведешь мяч.",
		"Jala este stick hacia atrás y apuntas.":
			"Потяни этот стик назад — и прицелишься.",
		"Sueltas y le pegas.":
			"Отпускаешь — и бьешь.",
		"Con este botón cambias entre CENTRO y TIRO.":
			"Этой кнопкой переключаешь НАВЕС и УДАР.",
		"Empuja este stick y avanza hacia el arco.":
			"Толкни этот стик и иди к воротам.",
		"Jala este stick y pásala a un compañero.":
			"Потяни этот стик и отдай пас партнеру.",
		"Suelta y la cuelgas.":
			"Отпускаешь — и навешиваешь.",
		"Jala hacia atrás y suelta para pegarle.":
			"Потяни назад и отпусти, чтобы ударить.",
		"Jala hacia atrás y corre: cruza la raya de la media cancha.": "Потяни назад и беги: пересеки центральную линию.",
		"Cuélgala al área. Con otro dedo cambias entre CENTRO y TIRO.":
			"Навесь в штрафную. Другим пальцем переключаешь НАВЕС и УДАР.",
		"Jala hacia atrás para pegarle a la falta.":
			"Потяни назад, чтобы пробить штрафной.",


		"GUÍA {0}/{1}": "ШАГ {0}/{1}",
		"SALTAR": "ПРОПУСК",
		"LISTO": "ПОНЯТНО",
		"TIRO o CENTRO": "УДАР или НАВЕС",
		"Este indicador dice cómo va a salir el balón. Toca con OTRO dedo"
		+ " mientras apuntas —o toca este chip— para cambiar entre TIRO (raso)"
		+ " y CENTRO (colgado). Los córners empiezan en CENTRO.":
			"Этот индикатор показывает, как полетит мяч. Нажми ДРУГИМ пальцем, пока целишься, — или на этот чип, — чтобы переключаться между УДАРОМ (низом) и НАВЕСОМ (верхом). Угловые начинаются с НАВЕСА.",
		"ESTA ES TU CARRERA": "ЭТО ТВОЯ КАРЬЕРА",
		"Bienvenido. Aquí arriba estás tú: tu media, tu energía y tu"
		+ " dinero, en todas las pantallas.":
			"Добро пожаловать. Здесь, наверху, — ты: твой рейтинг, энергия и деньги, на всех экранах.",
		"TU PARTIDO": "ТВОЙ МАТЧ",
		"El partido de hoy sale de este botón. Y el campo del fondo es"
		+ " para entrenar cuando quieras.":
			"Сегодняшний матч начинается с этой кнопки. А поле на фоне — чтобы тренироваться, когда захочешь.",
		"Estás aquí: tu partido y lo que reclama tu atención esta"
		+ " semana.":
			"Ты здесь: твой матч и все, что требует твоего внимания на этой неделе.",
		"Tus habilidades, tu contrato, tu gente, tu tienda y tu casa.":
			"Твои навыки, контракт, люди, магазин и дом.",
		"Lo que pasa fuera y te afecta: los torneos y el mercado de"
		+ " fichajes.":
			"Что происходит вокруг и касается тебя: турниры и трансферное окно.",
		"Lo que ya no cambia: tu carrera, tus trofeos y las leyendas.":
			"То, что уже не изменится: твоя карьера, трофеи и легенды.",
		"¿REPASAR?": "ПОВТОРИТЬ?",
		"Este botón vuelve a abrir esta guía siempre que quieras.":
			"Эта кнопка снова откроет это руководство, когда захочешь.",
		"Jala hacia atrás para correr · déjalos atrás":
			"Тяни назад, чтобы бежать · оставь их позади",
		"Arrastra desde tu círculo: dentro apuntas · fuera corres":
			"Тяни от своего круга: внутри — прицел · снаружи — бег",


		"bandaFUERA": "АУТ",
		"La bajas…": "Гасишь мяч…",
		"Conduciendo · vuelve al círculo para apuntar":
			"Ведение · вернись в круг, чтобы целиться",
		"Conduciendo · toca tu círculo para apuntar": "Ведение · коснись своего круга, чтобы целиться",
		"Jala para tirar · sal del círculo para conducir":
			"Тяни для удара · выйди из круга, чтобы вести мяч",
		"Jala para centrar · sal del círculo para conducir":
			"Тяни для навеса · выйди из круга, чтобы вести мяч",
		"Arrastra dentro para apuntar · fuera conduces": "Тяни внутри — прицел · снаружи — ведение",
		"Toca tu jugador · dentro del círculo tiras, fuera conduces":
			"Коснись своего игрока · в круге — удар, снаружи — ведение",
		"¡Cabezazo de {0}!": "{0} бьет головой!",
		"¡Al rechace {0}!": "{0} на добивании!",
		"¡Al rechace!": "Добивание!",
		"¡Pase a {0}!": "Пас партнеру {0}!",
		"¡Cabezazo!": "Удар головой!",
		"¡Palomita de {0}!": "{0} бьет головой в падении!",
		"¡Palomita!": "Удар головой в падении!",
		"¡Chilena de {0}!": "{0} бьет через себя!",
		"¡Chilena!": "Удар через себя!",
		"¡El portero le saca la chilena!": "Вратарь вытаскивает удар через себя!",
		"¡Vaya chilena! Y vaya atajada": "Вот это удар через себя! И вот это сейв",
		"La chilena choca con la defensa": "Удар через себя приходится в защитника",
		"¡Chilena bloqueada!": "Удар через себя заблокирован!",
		"¡Chilena a las nubes!": "Удар через себя — в облака!",
		"La chilena se va por encima": "Удар через себя — выше ворот",
		"¡La chilena al poste!": "Удар через себя — в штангу!",
		"¡Qué chilena! Y el palo dice no": "Какой удар через себя! Но штанга против",
		"La chilena se va por poco": "Удар через себя — чуть мимо",
		"¡Casi! La chilena no entró": "Почти! Удар через себя не залетел",
		"¡CHILENA DE {0}! GOLAZO DE OTRO PLANETA": "{0} БЬЕТ ЧЕРЕЗ СЕБЯ! ГОЛ С ДРУГОЙ ПЛАНЕТЫ",
		"¡DE CHILENA! {0} FIRMA EL GOL DEL AÑO": "ЧЕРЕЗ СЕБЯ! {0} ЗАБИВАЕТ ГОЛ ГОДА",
		"¡Pase!": "Пас!",
		"¡Pase clave!": "Ключевой пас!",
		"¡Pase clave a {0}!": "Ключевой пас партнеру {0}!",
		"¡Conduce {0}!": "{0} ведет мяч!",
		"¡Conduce!": "С мячом вперед!",
		"Segunda jugada": "Второй мяч",
		"¡Bloqueado!": "Заблокировано!",
		"¡Desviado!": "Рикошет!",
		"¡Desviado a córner!": "Рикошет на угловой!",
		"¡AUTOGOL DEL RIVAL!": "АВТОГОЛ СОПЕРНИКА!",
		"AUTOGOL": "АВТОГОЛ",
		"notaDESVIADO": "РИКОШЕТ",
		"Tu tiro se iba fuera, pero el defensa la mete en su propia portería.": "Твой удар шел мимо, но защитник срезал мяч в свои ворота.",
		"Iba fuera y rebota en el defensa hasta el fondo de su red. Autogol.": "Мяч шел мимо, но отскочил от защитника прямо в сетку. Автогол.",
		"¡Le diste al camarógrafo!": "Ты попал в оператора!",
		"¡REVENTASTE EL CRISTAL DEL PALCO!": "ТЫ РАЗБИЛ СТЕКЛО ЛОЖИ!",
		"¡Agrietaste el cristal del palco!": "Ты оставил трещину на стекле ложи!",
		"¡Le diste a TU entrenador!": "Ты попал в СВОЕГО тренера!",
		"¡Le diste al entrenador rival!": "Ты попал в тренера соперника!",
		"¡Le diste a tu propio banquillo!": "Ты попал в свою скамейку!",
		"¡Balonazo al banquillo rival!": "Мячом по скамейке соперника!",
		" · EL MÍSTER TE SACA": " · ТРЕНЕР ТЕБЯ ЗАМЕНЯЕТ",
		"EL TÉCNICO RETIRA A {0} · BALONAZO A SU PROPIO BANQUILLO": "ТРЕНЕР МЕНЯЕТ ИГРОКА {0} · МЯЧОМ ПО СВОЕЙ СКАМЕЙКЕ",
		"BALONAZOS A TU PROPIO BANQUILLO": "УДАРЫ ПО СВОЕЙ СКАМЕЙКЕ",
		"Le diste un balonazo a tu propia banca. Al túnel, sin discutir.": "Ты влепил мячом в свою скамейку. В раздевалку, без разговоров.",
		"Le diste un balonazo a tu propia banca. Fuera del campo, sin discutir.": "Ты влепил мячом в свою скамейку. С поля, без разговоров.",
		"Recado a la Banca": "Привет скамейке",
		"Darle un balonazo a alguien del banquillo rival.": "Попасть мячом в кого-нибудь на скамейке соперника.",
		"Fuego Amigo": "Огонь по своим",
		"Gloria Prestada": "Слава взаймы",
		"Cederle un penal al compañero que iba por su hat-trick.": "Отдать пенальти партнеру, который шел на хет-трик.",
		"Nadie Toca Mi Balón": "Мой мяч, не трогать",
		"Quedarte el penal con un compañero pidiéndotelo para su hat-trick.": "Оставить пенальти себе, когда партнер просит его ради хет-трика.",
		"Darle un balonazo a alguien de tu propio banquillo.": "Попасть мячом в кого-нибудь на своей скамейке.",
		"Con el Míster No": "Только не тренер",
		"Tumbar al entrenador rival de un balonazo.": "Сбить тренера соперника ударом мяча.",
		"Te Vas al Banquillo": "Марш на скамейку",
		"Tumbar a tu propio entrenador de un balonazo.": "Сбить своего тренера ударом мяча.",
		"Desalojo": "Зачистка",
		"Tumbar a diez personas de los banquillos a lo largo de tu carrera.":
			"Сбить десять человек на скамейках за всю карьеру.",
		"¡Le diste al recogepelotas! La prensa no te lo perdona": "Ты попал в подающего мячи! Пресса тебе этого не простит",
		"¡Tiraste las botellas del portero!": "Ты опрокинул бутылки вратаря!",



		"¡LE DISTE AL ASPERSOR!": "ТЫ ПОПАЛ В ДОЖДЕВАЛКУ!",
		"¡LE TIRASTE LA BEBIDA A UN AFICIONADO!": "ТЫ ВЫБИЛ НАПИТОК У БОЛЕЛЬЩИКА!",
		"¡Le diste a una paloma!": "Ты попал в голубя!",
		"¡Se fue a la calle!": "Мяч улетел за стадион!",
		"¡Se quedan el balón!": "Мяч назад не вернут!",
		"¡Fuera de juego!": "Офсайд!",
		"¡GOL! (asistencia)": "ГОЛ! (ассист)",
		"¡GOOOL!": "ГОООЛ!",
		"Despeje del rival": "Соперник выносит",


		"¡EN PROPIA PUERTA!": "АВТОГОЛ!",
		"¡Se te escapó el balón!": "Мяч ускользнул!",

		"TE LA DEVUELVE EL PORTERO": "ВРАТАРЬ ВОЗВРАЩАЕТ МЯЧ",
		"EL BALÓN VUELVE A TI": "МЯЧ СНОВА У ТЕБЯ",
		"¡Atajada del portero!": "Сейв вратаря!",
		"Tiro bloqueado": "Удар заблокирован",
		"Por encima del arco": "Выше ворот",
		"¡Al poste!": "В штангу!",
		"¡Al poste y fuera!": "От штанги и мимо!",
		"¡Fuera!": "Мимо!",
		"¡Salió el portero!": "Вратарь вышел!",
		"Se te fue por la línea": "Ты вывел мяч за линию",
		"Te ganó el defensa": "Защитник отобрал мяч",


		"Te resbalaste en el charco": "Ты поскользнулся в луже",
		"¡Gran regate!": "Отличный финт!",
		"La cobra {0}": "Бьет {0}",
		"¡El portero se la ataja a {0}!": "{0} бьет — вратарь на месте!",
		"¡{0} la estrella en el palo!": "{0} попадает в штангу!",
		"¡La barrera se lo tapa a {0}!": "{0} бьет в стенку!",
		"Lo saca {0}…": "Разыгрывает {0}…",
		"Arrastra para moverte · toca el balón y remata": "Тяни, чтобы двигаться · коснись мяча и бей",
		"¡{0} la manda fuera!": "{0} бьет мимо!",
		"¡Gol de {0}!": "{0} забивает!",
		"{0} NO FALLA DESDE LOS ONCE METROS": "{0} НЕ ПРОМАХИВАЕТСЯ С ТОЧКИ",
		"{0} FALLA DESDE LOS ONCE METROS": "{0} НЕ РЕАЛИЗУЕТ ПЕНАЛЬТИ",
		"LA FALTA DE {0} SE PIERDE SIN PELIGRO": "{0} БЬЕТ ШТРАФНОЙ — БЕЗ УГРОЗЫ",
		"{0} LA CLAVA DE FALTA DIRECTA": "{0} ЗАБИВАЕТ СО ШТРАФНОГО",
		"{0} REMATA EL CÓRNER A LA RED": "{0} ЗАМЫКАЕТ УГЛОВОЙ",
		"AHORA MANDA TU EQUIPO EL {0}": "ТВОИ ВПЕРЕДИ, {0}",
		"TU EQUIPO EMPATA EL PARTIDO, {0}": "ТВОИ СРАВНИВАЮТ, {0}",
		"TU EQUIPO RECORTA, {0}": "ТВОИ СОКРАЩАЮТ, {0}",
		"SE ADELANTA EL RIVAL, {0}": "СОПЕРНИК ВПЕРЕДИ, {0}",
		"EL RIVAL EMPATA, {0}": "СОПЕРНИК СРАВНИВАЕТ, {0}",
		"EL RIVAL RECORTA, {0}": "СОПЕРНИК СОКРАЩАЕТ, {0}",
		"ENTRA {0}": "ВЫХОДИТ {0}",
		"SALE {0}": "УХОДИТ {0}",
		"EL TÉCNICO RETIRA A {0} · ACTUACIÓN DEFICIENTE": "ТРЕНЕР МЕНЯЕТ ИГРОКА {0} · СЛАБАЯ ИГРА",
		"{0} SALE LESIONADO · NO PUEDE CONTINUAR": "{0} УХОДИТ С ТРАВМОЙ · НЕ МОЖЕТ ИГРАТЬ",
		"LESIONADO EN EL {0}'": "ТРАВМА, МИНУТА {0}",
		"{0} PIDE EL CAMBIO": "{0} ПРОСИТ ЗАМЕНУ",

		"{0} PIDE EL CAMBIO · NO LE QUEDA NADA": "{0} ПРОСИТ ЗАМЕНУ · СИЛ НЕ ОСТАЛОСЬ",
		"{0} PIDE EL CAMBIO · EL BANQUILLO NO LO ENTIENDE":
			"{0} ПРОСИТ ЗАМЕНУ · СКАМЕЙКА НЕ ПОНИМАЕТ",

		"{0} PIDE EL CAMBIO AL BANQUILLO": "{0} ПРОСИТ СКАМЕЙКУ О ЗАМЕНЕ",
		"EL BANQUILLO TE DICE QUE AGUANTES: YA NO DA TIEMPO":
			"СКАМЕЙКА ПРОСИТ ПОТЕРПЕТЬ: ВРЕМЕНИ УЖЕ НЕТ",

		"PEDIR CAMBIO": "ХОЧУ ЗАМЕНУ",
		"CAMBIO PEDIDO": "ЖДУ ЗАМЕНУ",


		"VAS AL LÍMITE: MEJOR NO FORZAR": "ТЫ НА ПРЕДЕЛЕ: ЛУЧШЕ НЕ РИСКОВАТЬ",
		"EL TÉCNICO RETIRA A {0} · OVACIÓN DEL ESTADIO":
			"ТРЕНЕР МЕНЯЕТ ИГРОКА {0} · ОВАЦИЯ СТАДИОНА",
		"{0} SE VA ENTRE APLAUSOS · EL PARTIDO ESTÁ HECHO":
			"{0} УХОДИТ ПОД АПЛОДИСМЕНТЫ · МАТЧ ВЫИГРАН",
		"EL BANQUILLO PREPARA TU CAMBIO: EL PARTIDO ESTÁ HECHO":
			"СКАМЕЙКА ГОТОВИТ ТВОЮ ЗАМЕНУ: МАТЧ ВЫИГРАН",



		"EL PARTIDO ESTÁ EN JUEGO: TE VA A DECIR QUE AGUANTES":
			"МАТЧ ЕЩЕ НЕ РЕШЕН: ТЕБЕ СКАЖУТ ПОТЕРПЕТЬ",
		"YA TE DIJO QUE NO: INSISTIR SALE CARO": "ТЕБЕ УЖЕ ОТКАЗАЛИ: НАСТАИВАТЬ НАКЛАДНО",
		"EL MÍSTER TE DICE QUE AGUANTES: TE NECESITA AHÍ":
			"ТРЕНЕР ПРОСИТ ПОТЕРПЕТЬ: ТЫ НУЖЕН НА ПОЛЕ",
		"EL BANQUILLO DICE QUE AGUANTES": "СКАМЕЙКА ПРОСИТ ПОТЕРПЕТЬ",
		"SALIDA GESTIONADA": "РАЗУМНАЯ ЗАМЕНА",
		"PEDISTE EL CAMBIO": "ТЫ ПОПРОСИЛ ЗАМЕНУ",
		"{0} MIN Y {1} % DE ENERGÍA QUE NO GASTASTE":
			"{0} МИН. И {1} % СБЕРЕЖЕННОЙ ЭНЕРГИИ",



		"YA NO DA TIEMPO: IBAS A SALIR IGUAL": "ВРЕМЕНИ НЕТ: ТЕБЯ И ТАК БЫ ЗАМЕНИЛИ",
		"EL PARTIDO ESTÁ HECHO: TE LO VAN A AGRADECER":
			"МАТЧ ВЫИГРАН: ТЕБЕ СКАЖУТ СПАСИБО",
		"NO TE QUEDA NADA: EL MÍSTER LO ENTIENDE": "СИЛ НЕ ОСТАЛОСЬ: ТРЕНЕР ПОЙМЕТ",
		"QUEDA PARTIDO Y TE QUEDAN PIERNAS: ES UN DESPLANTE":
			"МАТЧ ИДЕТ, СИЛЫ ЕСТЬ: ЭТО ДЕМАРШ",
		"{0} PIDE EL CAMBIO Y EL BANQUILLO ASIENTE": "{0} ПРОСИТ ЗАМЕНУ, СКАМЕЙКА КИВАЕТ",
		"FUERA DEL CAMPO": "ВНЕ ПОЛЯ",
		"FUERA POR LESION": "УШЕЛ С ТРАВМОЙ",
		"{0} SALE JUGANDO DE LA PRESIÓN": "{0} ВЫХОДИТ ИЗ-ПОД ПРЕССИНГА",
		"{0} ROMPE LÍNEAS CON UN GRAN REGATE": "{0} ЛОМАЕТ ЛИНИЮ ОТЛИЧНЫМ ФИНТОМ",
		"{0} PIERDE EL BALÓN EN UN REGATE": "{0} ТЕРЯЕТ МЯЧ НА ДРИБЛИНГЕ",
		"DERRIBAN A {0}: FALTA PELIGROSA": "ФОЛ НА {0}: ОПАСНЫЙ ШТРАФНОЙ",
		"DERRIBAN A {0} EN EL ÁREA: ¡PENAL!": "ФОЛ НА {0} В ШТРАФНОЙ: ПЕНАЛЬТИ!",
		"CARGAN A {0} EN LA SALIDA: FALTA": "{0} ТОЛКНУЛИ НА ВЫХОДЕ: ФОЛ",
		"FRENAN A {0} EN LA SALIDA: FALTA": "{0} ПРИДЕРЖАЛИ НА ВЫХОДЕ: ФОЛ",
		"CARGAN A {0} POR LA ESPALDA: FALTA": "{0} ТОЛКНУЛИ В СПИНУ: ФОЛ",
		"MODO TIRO": "УДАР",
		"MODO CENTRO": "НАВЕС",
		"REGATEANDO": "ДРИБЛИНГ",
		"CARGAN A {0} POR LA ESPALDA EN EL ÁREA: ¡PENAL!": "{0} ТОЛКНУЛИ В СПИНУ В ШТРАФНОЙ: ПЕНАЛЬТИ!",
		"¡ROMPISTE LÍNEAS!": "ЛИНИЯ ПРОЙДЕНА!",
		"¡FALTA! Se cobra aquí mismo": "ФОЛ! Штрафной прямо отсюда",
		"¡PENAL! Se cobra en los once metros": "ПЕНАЛЬТИ! Удар с точки",
		"{0} QUIERE COBRAR EL PENAL": "{0} ХОЧЕТ БИТЬ ПЕНАЛЬТИ",
		"SE LO DAS": "ОТДАТЬ",
		"NO SE LO DAS": "ОСТАВИТЬ",
		"VA POR SU HAT-TRICK": "ОН ИДЕТ НА ХЕТ-ТРИК",
		"TE QUEDAS EL PENAL Y {0} SE APARTA": "ТЫ ОСТАВЛЯЕШЬ ПЕНАЛЬТИ СЕБЕ, {0} ОТХОДИТ",
		"EL PENAL ES TUYO": "ПЕНАЛЬТИ ТВОЙ",
		"SE LO DAS A {0}": "ПЕНАЛЬТИ БЬЕТ {0}",
		"LE CEDES EL PENAL A {0} PARA SU HAT-TRICK": "ТЫ ОТДАЛ ПЕНАЛЬТИ — У {0} ХЕТ-ТРИК",
		"LE CEDES EL PENAL A {0} Y NO ENTRA": "ТЫ ОТДАЛ ПЕНАЛЬТИ — {0} НЕ ЗАБИВАЕТ",
		"EL EQUIPO TE DEJA EL PENAL: HAT-TRICK": "КОМАНДА ДАЕТ ТЕБЕ ПЕНАЛЬТИ: ХЕТ-ТРИК",
		"EL EQUIPO TE DEJA EL PENAL Y LO FALLAS": "КОМАНДА ДАЕТ ТЕБЕ ПЕНАЛЬТИ — МИМО",
		"{0} TE DA EL PENAL": "{0} ОТДАЕТ ТЕБЕ ПЕНАЛЬТИ",
		"EL PENAL ES DE {0}": "ПЕНАЛЬТИ БЬЕТ {0}",
		"LA FALTA ES DE {0}": "ШТРАФНОЙ БЬЕТ {0}",
		"SÍ {0} % · NO {1} %": "ДА {0}% · НЕТ {1}%",
		"PÍDESELO": "ПОПРОСИТЬ",
		"DÉJASELO": "УСТУПИТЬ",
		"LE PIDES EL BALÓN A {0}": "ТЫ ПРОСИШЬ МЯЧ У {0}",
		"{0} TE DA LA FALTA": "{0} ОТДАЕТ ТЕБЕ ШТРАФНОЙ",
		"{0} SE LO QUEDA": "{0} БЬЕТ САМ",
		"{0} SE LA QUEDA": "{0} БЬЕТ САМ",
		"LE PIDES EL PENAL A {0} Y SE LO QUEDA": "ТЫ ПРОСИШЬ ПЕНАЛЬТИ, НО {0} БЬЕТ САМ",
		"LE PIDES LA FALTA A {0} Y SE LA QUEDA": "ТЫ ПРОСИШЬ ШТРАФНОЙ, НО {0} БЬЕТ САМ",
		"{0} TE DEJA EL PENAL Y RESPONDES": "{0} ОТДАЕТ ТЕБЕ ПЕНАЛЬТИ — И ТЫ НЕ ПОДВЕЛ",
		"{0} TE DEJA EL PENAL Y NO RESPONDES": "{0} ОТДАЕТ ТЕБЕ ПЕНАЛЬТИ — А ТЫ ПОДВЕЛ",
		"{0} TE DEJA LA FALTA Y RESPONDES": "{0} ОТДАЕТ ТЕБЕ ШТРАФНОЙ — И ТЫ НЕ ПОДВЕЛ",
		"{0} TE DEJA LA FALTA Y NO RESPONDES": "{0} ОТДАЕТ ТЕБЕ ШТРАФНОЙ — А ТЫ ПОДВЕЛ",
		"¡TANDA DE PENALES!": "СЕРИЯ ПЕНАЛЬТИ!",
		"TANDA {0}-{1}": "СЕРИЯ {0}-{1}",
		"TANDA {0}-{1} · TIRA TU EQUIPO...": "СЕРИЯ {0}-{1} · БЬЮТ ТВОИ...",
		"TANDA {0}-{1} · ¡TE TOCA A TI!": "СЕРИЯ {0}-{1} · ТВОЙ УДАР!",
		"TANDA {0}-{1} · Cobra {2}...": "СЕРИЯ {0}-{1} · Бьет {2}...",
		"¡GOL! Cobras con personalidad.": "ГОЛ! Удар с характером.",
		"¡FALLAS TU PENAL!": "ТВОЙ ПЕНАЛЬТИ МИМО!",
		"¡GOL!": "ГОЛ!",
		"¡FALLA TU EQUIPO!": "ТВОИ НЕ ЗАБИЛИ!",
		"TANDA {0}-{1} · TIRA EL RIVAL...": "СЕРИЯ {0}-{1} · БЬЕТ СОПЕРНИК...",
		"GOL DEL RIVAL": "ГОЛ СОПЕРНИКА",
		"¡LO ATAJA TU PORTERO!": "СЕЙВ ТВОЕГО ВРАТАРЯ!",
		"¡AL PALO!": "В ШТАНГУ!",
		"¡AL TRAVESAÑO!": "В ПЕРЕКЛАДИНУ!",
		"¡LA MANDA POR ENCIMA!": "ВЫШЕ ВОРОТ!",
		"¡LA MANDA FUERA!": "МИМО!",
		"PENALES {0}-{1}": "ПЕН. {0}-{1}",
		"¡PASAS TÚ! ({0}-{1})": "ПРОХОДИМ! ({0}-{1})",
		"ELIMINADO EN PENALES ({0}-{1})": "ВЫЛЕТ ПО ПЕНАЛЬТИ ({0}-{1})",
		"VICTORIA": "ПОБЕДА",
		"EMPATE": "НИЧЬЯ",
		"DERROTA": "ПОРАЖЕНИЕ",
		"Encarada por la banda": "Обыгрыш на фланге",
		"Disparo escorado": "Удар под острым углом",
		"Desde la banda": "С фланга",
		"Contra por la banda": "Контратака по флангу",
		"Falta lateral al área": "Штрафной с фланга",
		"Uno contra uno": "Один на один",
		"Falta a {0} m": "Штрафной с {0} м",









		"Volea al bote": "Удар с полулета",
		"Volea bombeada": "Удар с лета по дуге",
		"Volea al vuelo": "Удар с лета в прыжке",
		"Volea rasa": "Удар с лета низом",
		"balón botando": "мяч в отскоке",
		"llega bombeado": "мяч летит навесом",
		"balón al vuelo": "мяч в воздухе",
		"balón rodando": "мяч катится",
		"línea adelantada": "высокая линия",
		"bajo presión": "под прессингом",
		"con superioridad": "с численным перевесом",
		"Tras el regate": "После обводки",
		"Pared con el pivote": "Стенка с опорником",
		"Ruptura al espacio": "Рывок за спину",
		"Cabezazo al segundo palo": "Головой у дальней штанги",
		"Cabezazo en el primer palo": "Головой у ближней штанги",
		"Palomita": "Удар головой в падении",
		"El autobús": "Автобус",
		"Mano a mano franco": "Чистый один на один",
		"Falta escorada al palo corto": "Штрафной под углом, ближняя штанга",
		"Falta sobre la muralla": "Штрафной через стенку",
		"Falta a la escuadra": "Штрафной в девятку",
		"Saque de banda a la torre": "Длинный аут на таран",
		"RIVAL": "ПРОТИВ",
		"RESULTADOS": "РЕЗУЛЬТАТЫ",
		"DOMINIO": "ПЕРЕВЕС",
		"TU APUESTA": "ТВОЙ ВЫБОР",
		"ELLOS": "ОНИ",
		"FORMACIÓN": "СХЕМА",
		"FUERZA": "СИЛА",
		"SU PELIGRO": "ИХ УГРОЗА",
		"FRESCO": "СВЕЖИЙ",
		"EN FORMA": "В ФОРМЕ",
		"CARGADO": "ЗАРЯЖЕН",
		"ENERGÍA": "ЭНЕРГИЯ",
		"EN VIVO": "В ЭФИРЕ",

		"1T": "1Т",
		"2T": "2Т",
		"PR": "ДВ",
		"TOCA PARA AVANZAR  ▸": "НАЖМИ — ДАЛЕЕ  ▸",
		"ARRASTRA PARA LEER · TOCA PARA AVANZAR  ▸":
			"ТЯНИ, ЧТОБЫ ЛИСТАТЬ · НАЖМИ — ДАЛЕЕ  ▸",





		"▸ VER EL GOL": "▸ ПОВТОР ГОЛА",
		"▸ GOL": "▸ ГОЛ",
		"¡GOLAZO! {0} LA MANDA A GUARDAR": "КАКОЙ ГОЛ! {0} ВКОЛАЧИВАЕТ",
		"GOL EN CONTRA: {0} CASTIGA EL ROBO EN TU ÁREA": "ПРОПУСКАЕМ: {0} НАКАЗЫВАЕТ ЗА ПОТЕРЮ В ШТРАФНОЙ",
		"LA REPETICION": "ПОВТОР",
		"AL POSTE": "В ШТАНГУ",
		"AL LARGUERO": "В ПЕРЕКЛАДИНУ",


		"REVISION VAR": "ПРОВЕРКА VAR",
		"COMPROBANDO EL LARGUERO": "ПРОВЕРКА ПЕРЕКЛАДИНЫ",
		"EL PIQUE, BAJO EL LARGUERO": "ОТСКОК ПОД ПЕРЕКЛАДИНОЙ",
		"TECNOLOGIA DE LINEA DE GOL": "СИСТЕМА ВЗЯТИЯ ВОРОТ",
		"COMPROBANDO EL POSTE": "ПРОВЕРКА ШТАНГИ",
		"EL PIQUE, FUERA DE LA RAYA": "ОТСКОК ДО ЛИНИИ",
		"NO ES GOL": "ГОЛА НЕТ",
		"ARRASTRA PARA GIRAR LA CÁMARA": "ТЯНИ, ЧТОБЫ ПОВЕРНУТЬ КАМЕРУ",
		"ARCO": "ВОРОТА",
		"ORBITA": "ОРБИТА",
		"TU CAMARA": "ТВОЙ ВИД",


		"repeLIBRE": "ОБЗОР",





		"GUARDADO": "СОХРАНЕНО",
		"Guardado en tus fotos": "Сохранено в твоих фото",
		"Da permiso a Fotos para guardar el video": "Разреши доступ к Фото, чтобы сохранить видео",
		"No se pudo guardar en tus fotos": "Не удалось сохранить в фото",
		"Este aparato no puede guardar el video": "Это устройство не может сохранить видео",
		"No se pudo empezar a grabar": "Не удалось начать запись",
		"Se cortó la grabación": "Запись прервалась",
		"No hay jugada que guardar": "Нет момента для сохранения",
		"No hay nada grabado": "Ничего не записано",
		"No se pudo cerrar el video": "Не удалось завершить видео",
		"¡Mira mi gol en Football Legacy!": "Смотри мой гол в Football Legacy!",
		"Compartido": "Отправлено",
		"No se pudo abrir compartir": "Не удалось открыть меню «Поделиться»",
		"ENLACE COPIADO: PEGALO EN TU POST": "ССЫЛКА СКОПИРОВАНА: ВСТАВЬ В ПОСТ",
		"Listo": "Готово",





		"ORDEN DESDE LA BANDA: TODOS ATRÁS, SE DEFIENDE EL RESULTADO":
			"УКАЗАНИЕ СО СКАМЕЙКИ: ВСЕ НАЗАД, ДЕРЖИМ СЧЕТ",
		"ORDEN DESDE LA BANDA: EQUILIBRIO, NI ATRÁS NI ARRIBA":
			"УКАЗАНИЕ СО СКАМЕЙКИ: БАЛАНС, НИ НАЗАД, НИ ВПЕРЕД",
		"ORDEN DESDE LA BANDA: TODOS ARRIBA, SE VA A POR EL PARTIDO":
			"УКАЗАНИЕ СО СКАМЕЙКИ: ВСЕ ВПЕРЕД, ИДЕМ ЗА ПОБЕДОЙ",
		"EL EQUIPO BAJA EL PISTÓN: A ADMINISTRAR PIERNAS":
			"КОМАНДА СБАВЛЯЕТ ОБОРОТЫ: БЕРЕЖЕТ НОГИ",
		"EL EQUIPO VUELVE A SU RITMO NORMAL": "КОМАНДА СНОВА ИГРАЕТ В ОБЫЧНОМ ТЕМПЕ",
		"EL EQUIPO SUBE EL PISTÓN: A MORDER CADA BALÓN":
			"КОМАНДА ПРИБАВЛЯЕТ: БОРЕТСЯ ЗА КАЖДЫЙ МЯЧ",
		"PLANTEAMIENTO": "ТАКТИКА",
		"INTENSIDAD": "НАПОР",
		"planDEFENSIVO": "ОБОРОНА",
		"planBALANCEADO": "БАЛАНС",
		"planOFENSIVO": "АТАКА",
		"planBAJA": "ЛЕГКИЙ",
		"planMEDIA": "СРЕДНИЙ",
		"planALTA": "ПОЛНЫЙ",
		"Aguantas atrás: encajas menos, pero el balón te llega lejos del área.":
			"Играешь от обороны: пропускаешь меньше, но мяч приходит к тебе далеко от штрафной.",
		"El equipo juega parejo.": "Команда играет ровно.",
		"Vas al frente: te llega más cerca del arco, pero atrás quedas expuesto.":
			"Идешь вперед: мяч приходит ближе к воротам, но сзади ты открыт.",
		"Dosificas: tocas menos el balón, pero terminas entero.":
			"Экономишь силы: реже касаешься мяча, но доигрываешь свежим.",
		"Ritmo normal.": "Обычный темп.",
		"Buscas cada pelota, pero acabas fundido (y más expuesto a la lesión).":
			"Борешься за каждый мяч, но выдыхаешься (и сильнее рискуешь травмой).",
		"SE ACABO": "ЭТО КОНЕЦ",
		"HASTA AQUI": "ВОТ И ВСЕ",
		"{0} · {1} de {2}": "{0} · {1} из {2}",
		"EL ULTIMO PITIDO": "ПОСЛЕДНИЙ СВИСТОК",
		"EL ESTADIO EN PIE": "ТРИБУНЫ ВСТАЮТ",
		"AÑO A AÑO": "ПО ГОДАМ",
		"COMO CRECISTE": "КАК ТЫ РОС",
		"LA VITRINA": "ТРОФЕИ",
		"¿ERES LEYENDA?": "ТЫ ЛЕГЕНДА?",
		"LA PRENSA": "ПРЕССА",
		"LO QUE DEJAS": "ТВОЙ СЛЕД",
		"GRACIAS {0}": "СПАСИБО, {0}",
		"GRACIAS": "СПАСИБО",
		"Suena el silbato y ya no hay temporada siguiente.":
			"Звучит свисток, и следующего сезона уже не будет.",
		"{0} años. El cuerpo pidió la cuenta.":
			"Возраст: {0}. Тело сказало «хватит».",
		"Suena el silbato y esta vez lo eliges tú.":
			"Звучит свисток, и на этот раз решаешь ты.",

		"Suena el silbato y esta vez no hay vuelta.":
			"Звучит свисток, и на этот раз пути назад нет.",
		"El cuerpo pidió la cuenta antes de tiempo.":
			"Тело сказало «хватит» раньше времени.",
		"\"EL CUERPO LE PASO LA FACTURA\"": "«ТЕЛО ВЫСТАВИЛО СЧЕТ»",
		"A los {0} años, una lesión decidió por él.":
			"Ему было {0}, когда травма решила за него.",
		"Te vas cuando todavía te quedaba algo dentro.":
			"Ты уходишь, когда в тебе еще что-то оставалось.",
		"{0} temporadas · {1} partidos": "Сезонов: {0} · Матчей: {1}",
		"Las camisetas que vestiste": "Футболки, которые ты носил",
		"DE PIE": "ОВАЦИЯ",
		"El estadio entero, en pie, coreando tu nombre.":
			"Весь стадион на ногах скандирует твое имя.",
		"Muchos de los que aplauden no vieron tu debut.":
			"Многие из тех, кто аплодирует, не видели твоего дебюта.",
		"{0} veces internacional con {1}": "Матчей за сборную: {0} ({1})",
		"No hay historial que enseñar.": "Показывать пока нечего.",
		"TOTAL": "ИТОГО",
		"LA CARRERA EN CIFRAS": "КАРЬЕРА В ЦИФРАХ",
		"ASIST": "АСС",
		"De todo eso, {0} goles y {1} asistencias fueron en la elite (1ª y seleccion):"
		+ " es lo que te compara con las leyendas.":
			"Из них в элите (высшая лига и сборная) голов: {0}, ассистов: {1}. Именно это сравнивает тебя с легендами.",
		"TEMP · CLUB": "СЕЗОН · КЛУБ",
		"TITULOS": "ТИТУЛЫ",
		"T{0} {1}": "С.{0} {1}",
		"Una carrera tan corta no dibuja curva.":
			"Такая короткая карьера не рисует кривую.",
		"Lo que valias y lo que sabias, año a año":
			"Сколько ты стоил и что умел, год за годом",
		"VALOR": "ЦЕНА",
		"curvaMEDIA": "OVR",
		"Valiste más que nunca en la temporada {0}: $ {1}":
			"Дороже всего ты стоил в сезоне {0}: $ {1}",
		"Tu mejor media fue {0}, y la de hoy es {1}":
			"Твой лучший рейтинг — {0}, а сегодня — {1}",
		"El mercado dejó de creer en ti {0} temporadas antes de que se te acabara el"
		+ " fútbol.":
			"Рынок перестал в тебя верить за {0} сез. до того, как для тебя кончился футбол.",
		"LA VITRINA VACIA": "ПУСТАЯ ВИТРИНА",
		"No ganaste nada, y aun así jugaste {0} temporadas.":
			"Ты ничего не выиграл — и все же провел в футболе {0} сез.",
		"Hay carreras que no caben en una vitrina.":
			"Есть карьеры, которые не помещаются в витрину.",
		"{0} de equipo · {1} individuales": "Командных: {0} · Личных: {1}",
		"CON TU EQUIPO": "С КОМАНДОЙ",
		"TUYOS Y DE NADIE MAS": "ТОЛЬКО ТВОИ",
		"UNO POR UNO": "ПО ОДНОМУ",
		"COPA · {0}": "КУБОК · {0}",
		"MAXIMO GOLEADOR": "БОМБАРДИР",
		"MAXIMO ASISTENTE": "ЛУЧШИЙ АССИСТЕНТ",
		"PODIO DE LA LIGA": "ТОП-3 ЛИГИ",
		"MEJOR JUGADOR": "ЛУЧШИЙ ИГРОК",
		"Tu nombre por delante de {0} leyendas del fútbol":
			"Легенд футбола позади тебя: {0}",
		"Los grandes de la historia siguen todos por delante.":
			"Все великие в истории пока впереди тебя.",
		"PRODUCCION HISTORICA": "РЕЗУЛЬТАТИВНОСТЬ",
		"{0} goles y {1} asistencias en la elite":
			"{0} гол. и {1} асс. в элите",
		"Nº{0} de la historia, por delante de {1} leyendas":
			"№{0} в истории, впереди легенд: {1}",
		"Ninguna leyenda del fútbol se queda por detrás de ti.":
			"Ни одна легенда футбола не осталась позади тебя.",
		"Los récords del mundo siguen donde estaban.":
			"Мировые рекорды остаются на месте.",
		"RECORD DEL MUNDO: {0}": "МИРОВОЙ РЕКОРД: {0}",
		"Goles en una carrera": "Голы за карьеру",
		"Balones de Oro": "Награды «Игрок года»",
		"Ligas ganadas": "Выигранные лиги",
		"DONDE TE VAS SIENDO LEYENDA": "ГДЕ ТЫ УХОДИШЬ ЛЕГЕНДОЙ",
		"En ninguna parte, todavía.": "Пока нигде.",
		"Al top histórico de un club se entra ganando allí, siendo"
		+ " su máximo goleador o su récord de partidos, o con 10 temporadas seguidas; al"
		+ " de una liga, ganando o marcando goles en su primera división; al de tu"
		+ " selección, siendo uno de sus 5 máximos goleadores.":
			"В историю клуба попадают, выиграв там трофей, став его лучшим бомбардиром или рекордсменом по матчам либо отыграв 10 сезонов подряд; в историю лиги — выигрывая ее или забивая в ее высшем дивизионе; в историю твоей сборной — войдя в пятерку ее лучших бомбардиров.",
		"leyenda del club": "легенда клуба",
		"goleador histórico del club": "лучший бомбардир в истории клуба",
		"récord de partidos del club": "рекордсмен клуба по матчам",
		"leyenda de la liga": "легенда лиги",
		"leyenda de la selección": "легенда сборной",
		"Nº{0}": "№{0}",
		"\"{0} GOLES Y UNA SOLA MANERA DE ENTENDER EL JUEGO\"":
			"«ГОЛОВ — {0}, И ЛИШЬ ОДИН ВЗГЛЯД НА ИГРУ»",
		"Se retira uno de los grandes rematadores de su generación.":
			"Уходит один из великих бомбардиров своего поколения.",
		"\"{0} GOLES DESPUES, EL AREA SE QUEDA VACIA\"":
			"«ГОЛОВ — {0}. ТЕПЕРЬ ШТРАФНАЯ ОПУСТЕЛА»",
		"El delantero deja el fútbol tras {0} temporadas.":
			"Нападающий уходит из футбола. Сезонов в карьере: {0}.",
		"\"NO TODO SE MIDE EN GOLES\"": "«НЕ ВСЕ ИЗМЕРЯЕТСЯ ГОЛАМИ»",
		"{0} goles y {1} asistencias en {2} temporadas de oficio.":
			"Голы: {0}, ассисты: {1}, сезонов честной работы: {2}.",
		"\"LA VITRINA QUE DEJA: {0} TITULOS\"": "«ЕГО ВИТРИНА: ТИТУЛОВ — {0}»",
		"Pocos futbolistas se han ido con tanto ganado.":
			"Мало кто из футболистов уходил, выиграв столько.",
		"\"SE VA CON {0} TITULOS Y NINGUNA DEUDA\"":
			"«ТИТУЛОВ — {0}, ДОЛГОВ — НИ ОДНОГО»",
		"Ganó lo que pudo donde le tocó jugar.":
			"Выигрывал, что мог, там, куда забрасывала судьба.",
		"\"EL FUTBOL NO SIEMPRE PAGA LO QUE DEBE\"":
			"«ФУТБОЛ НЕ ВСЕГДА ВОЗВРАЩАЕТ ДОЛГИ»",
		"Se retira sin títulos, que no es lo mismo que sin carrera.":
			"Уходит без титулов — но это не значит, что без карьеры.",
		"\"VUELVE A CASA PARA SIEMPRE\"": "«ДОМОЙ НАВСЕГДА»",
		"Se retira en el {0}, donde empezó todo.":
			"Завершает карьеру в клубе {0}, где все начиналось.",
		"\"JUGO HASTA EL ULTIMO DIA QUE LE DEJARON\"":
			"«ИГРАЛ, ПОКА ЕМУ ПОЗВОЛЯЛИ»",
		"A los {0} años, el calendario decidio por él.":
			"Ему было {0}, и за него решил календарь.",
		"\"ME VOY AHORA QUE TODAVIA SE JUGAR\"": "«УХОЖУ, ПОКА ЕЩЕ УМЕЮ ИГРАТЬ»",
		"Anuncia su retirada a los {0} años, por decision propia.":
			"Ему {0}, и он сам объявляет о завершении карьеры.",
		"Te vas siendo": "Ты уходишь:",



		"{0} retira tu dorsal": "{0} выводит твой номер из обращения",
		"{0} temporadas con el mismo número a la espalda.":
			"Сезонов с одним номером на спине: {0}.",
		"LA CAMISETA QUE SE QUEDA": "ВЕЧНАЯ ФУТБОЛКА",
		"{0} temporadas con él": "Сезонов с ним: {0}",
		"Prestigio: {0} puntos": "Престиж: {0} очк.",
		"El vestuario se queda vacío, pero el nombre no se borra.":
			"Раздевалка пустеет, но имя не стирается.",
		"Ahora ya solo queda mirar lo que hiciste.":
			"Теперь остается лишь оглянуться на то, что ты сделал.",
		"ELIGE EL CLUB DONDE ENTRA": "ВЫБЕРИ ЕГО НОВЫЙ КЛУБ",
		"ELIGE EL CLUB DESTINO": "ВЫБЕРИ ЦЕЛЕВОЙ КЛУБ",
		"También puede ser su propio club, para cambiarlo de asiento.":
			"Можно выбрать и его собственный клуб, чтобы переставить его на другое место.",
		"Fichajes, cualidades, caras y escudos a tu gusto.\nSe guarda solo y vale para"
		+ " todas las carreras.":
			"Трансферы, характеристики, лица и эмблемы — как хочешь.\nСохраняется само и действует во всех карьерах.",
		"EDITADO": "ИЗМЕНЕН",
		"ELIGE EL ASIENTO QUE OCUPA": "ВЫБЕРИ ЕГО МЕСТО",
		"Quien tenga ese asiento hoy SALE del juego; el nuevo\nhereda su puesto y su"
		+ " dorsal.":
			"Тот, кто сейчас на этом месте, УХОДИТ из игры;\nновый наследует его позицию и номер.",
		"ELIGE CON QUIEN SE INTERCAMBIA": "ВЫБЕРИ, С КЕМ ОН МЕНЯЕТСЯ",
		"Los dos jugadores se cambian de club; el puesto y el dorsal\nson del asiento,"
		+ " no viajan.":
			"Игроки меняются клубами; позиция и номер\nпринадлежат месту и не переходят.",
		"{0} · FUERZA {1}": "{0} · СИЛА {1}",
		"SOLO SU POSICION ({0}): {1}": "ТА ЖЕ ПОЗИЦИЯ ({0}): {1}",
		"editorSI": "ДА",
		"editorNO": "НЕТ",
		"CREAR JUGADOR": "НОВЫЙ ИГРОК",
		"EDITAR CLUB": "ИЗМЕНИТЬ КЛУБ",
		"IDENTIDAD": "ПРОФИЛЬ",
		"AL TOCAR UN CLUB SE ABRE": "НАЖМИ НА КЛУБ, ЧТОБЫ ОТКРЫТЬ",
		"Nadie encaja aquí con el filtro puesto. Apágalo para ver el plantel completo.":
			"С этим фильтром здесь никто не подходит. Выключи его, чтобы увидеть весь состав.",
		"— BANCA —": "— ЗАПАС —",


		"LISTA": "СПИСОК",
		"— RESERVA —": "— РЕЗЕРВ —",
		"QUITAR EDICIONES DEL CLUB": "СБРОСИТЬ ПРАВКИ КЛУБА",
		"{0}  · TU PUESTO": "{0}  · ТВОЕ МЕСТО",
		"EDAD": "ВОЗР.",
		"POSICIÓN": "ПОЗИЦИЯ",
		"AÑOS": "ГОДЫ",
		"NACION": "СТРАНА",
		"PUESTO": "ПОЗ.",



		"POR": "GK", "DFC": "CB", "LTI": "LB", "LTD": "RB",
		"MCD": "CDM", "MC": "CM", "MI": "LM", "MD": "RM",
		"DC": "ST", "CAM": "CAM", "MCO": "CAM", "EI": "LW", "ED": "RW",


		"SABE JUGAR DE": "МОЖЕТ ИГРАТЬ",




		"AL MENOS UN PUESTO: MARCA OTRO ANTES DE QUITAR ESTE.": "ХОТЯ БЫ ОДНА ПОЗИЦИЯ: ОТМЕТЬ ДРУГУЮ, ЧТОБЫ СНЯТЬ ЭТУ.",
		"EL ARCO ES EXCLUYENTE: UN PORTERO NO JUEGA DE NADA MAS.": "ВОРОТА — ОТДЕЛЬНО: ВРАТАРЬ БОЛЬШЕ НИГДЕ НЕ ИГРАЕТ.",
		"MARCA SU PUESTO DE CAMPO: ASI SALE DEL ARCO.": "ОТМЕТЬ ЕГО ПОЗИЦИЮ В ПОЛЕ: ТАК ОН УЙДЕТ ИЗ ВОРОТ.",
		"ES EL ULTIMO {0} DEL CLUB: MARCA A OTRO PRIMERO.": "ПОСЛЕДНИЙ {0} В КЛУБЕ: СНАЧАЛА ОТМЕТЬ ДРУГОГО.",
		"El primero es su puesto (hoy {0}) y el número es su OVR ahí: quítalo y pasa al siguiente. Hasta {1}, y viajan con la persona.": "Первая — его позиция (сейчас {0}), а число — его OVR на ней: сними ее, и ее место займет следующая. До {1}, и они переходят вместе с игроком.",
		"— TITULARES · {0} —": "— ОСНОВА · {0} —",
		"EL ARCO ES EXCLUYENTE: NI ENTRA NI SALE NADIE.": "ВОРОТА — ОТДЕЛЬНО: НИ ТУДА, НИ ОТТУДА.",
		"SU PUESTO VA SIEMPRE: NO SE PUEDE QUITAR.": "ЕГО ПОЗИЦИЯ ЕСТЬ ВСЕГДА: СНЯТЬ НЕЛЬЗЯ.",
		"HASTA {0} PUESTOS: QUITA UNO PARA PONER OTRO.": "ЛИМИТ ПОЗИЦИЙ — {0}: СНИМИ ОДНУ РАДИ ДРУГОЙ.",
		"Su puesto va siempre. Hasta {0}, y viajan con la persona.": "Его позиция есть всегда. Всего до {0}, и они переходят вместе с игроком.",
		"Mientras juegues aquí, este asiento lo ocupas tú; el jugador editado vale para"
		+ " el resto del mundo.":
			"Пока ты играешь здесь, это место занимаешь ты; отредактированный игрок действует для остального мира.",
		"El puesto es del ASIENTO: en un intercambio se queda aquí.":
			"Позиция принадлежит МЕСТУ: при обмене она остается здесь.",
		"VELOCIDAD": "СКОРОСТЬ",
		"PEGADA": "МОЩЬ",
		"PUNTERIA": "ТОЧНОСТЬ",
		"ROSCA": "ДУГА",
		"CABEZA": "ГОЛОВА",
		"PENAL": "ПЕН.",
		"BALON PARADO": "СТАНДАРТЫ",
		"REFLEJOS": "РЕАКЦИЯ",
		"REFLEJOS solo cuenta en porteros. Se guarda solo.":
			"РЕАКЦИЯ учитывается только у вратарей. Сохраняется само.",
		"Cada puesto se mide por sus cualidades. Se guarda solo.":
			"Каждая позиция оценивается по своим качествам. Сохраняется само.",
		"REFLEJOS solo cuenta en porteros.": "РЕАКЦИЯ учитывается только у вратарей.",
		"TRASPASAR": "ПЕРЕВЕСТИ",
		"QUITAR EDICION (VOLVER AL DE BASE)": "СБРОСИТЬ ПРАВКУ (К ИСХОДНОМУ)",
		"ES EL ULTIMO DE SU PUESTO: NO SE PUEDE CAMBIAR.":
			"ПОСЛЕДНИЙ НА СВОЕЙ ПОЗИЦИИ: ИЗМЕНИТЬ НЕЛЬЗЯ.",

		"MIS EDICIONES": "МОИ ПРАВКИ",

		"IMPORTAR DATOS": "ИМПОРТ ДАННЫХ",
		"Catálogo completo": "Полный каталог",
		"EXPORTAR EL MUNDO ENTERO": "ЭКСПОРТ ВСЕГО МИРА",
		"IMPORTAR: ABRIR ARCHIVOS": "ИМПОРТ: ОТКРЫТЬ ФАЙЛЫ",
		"IMPORTAR UN ARCHIVO": "ИМПОРТ ФАЙЛА",
		"Exportar te da un archivo para editarlo en el ordenador; importar lo trae de vuelta. Vale .json o un .zip con la carpeta de escudos dentro.": "Экспорт дает тебе файл, чтобы изменить его на компьютере; импорт возвращает его обратно. Подойдет .json или .zip с папкой эмблем внутри.",
		"Al terminar se abre COMPARTIR: mándalo a Archivos o a tu ordenador para editarlo y volver a importarlo.": "По завершении откроется меню ПОДЕЛИТЬСЯ: отправь файл в Файлы или на компьютер, чтобы отредактировать и снова импортировать.",
		"Al terminar se abre GUARDAR: déjalo en Descargas y desde ahí pásalo al ordenador o a tu nube para editarlo y volver a importarlo.": "По завершении откроется окно СОХРАНИТЬ: положи файл в Загрузки, а оттуда перенеси на компьютер или в облако, чтобы отредактировать и снова импортировать.",
		"Si el archivo está en Drive, bájalo antes a Descargas.": "Если файл лежит в Drive, сначала скачай его в Загрузки.",
		"IMPORTANDO…": "ИМПОРТ…",
		"Guardando el catálogo y los escudos. No cierres el juego.": "Сохраняем каталог и эмблемы. Не закрывай игру.",
		"No se pudo guardar el archivo donde elegiste.": "Не удалось сохранить файл в выбранное место.",
		"El archivo es tuyo y para tu uso personal: el juego no aloja ni reparte packs.": "Файл твой и только для личного использования: игра не хранит и не раздает паки.",
		"Lo que importes es tuyo y se queda en tu dispositivo: tú respondes de lo que metas en el archivo.": "Все, что ты импортируешь, принадлежит тебе и остается на твоем устройстве: за содержимое файла отвечаешь ты.",
		"El .zip no trae ningún archivo .json dentro.": "В этом .zip нет ни одного файла .json.",
		"El archivo es demasiado grande: no se importó nada.": "Файл слишком большой: ничего не импортировано.",
		"no se pudo abrir el selector": "не удалось открыть выбор файла",
		"no se pudo copiar el archivo elegido": "не удалось скопировать выбранный файл",
		"no se encontró el archivo exportado": "экспортированный файл не найден",
		"EXPORTADO A {0}": "СОХРАНЕНО В {0}",
		"Queda en la carpeta de Football Legacy como {0}: ábrelo en el ordenador para ajustar tus plantillas y vuelve a importarlo.": "Файл лежит в папке Football Legacy под именем {0}: открой его на компьютере, поправь составы и импортируй обратно.",
		"EXPORTAR PLANTILLA": "ЭКСПОРТ ШАБЛОНА",
		"EXPORTAR": "ЭКСПОРТ",
		"NO SE PUDO ESCRIBIR": "НЕ УДАЛОСЬ ЗАПИСАТЬ",
		"Saca todos los clubes, plantillas y competiciones tal y como están ahora.": "Выгружает все клубы, составы и турниры в их нынешнем виде.",
		"Los escudos no van dentro: esos los pones tú.": "Эмблем внутри нет: их добавляешь ты сам.",
		"club": "клуб",
		"clubes": "клубов",
		"jugador": "игрок",
		"jugadores": "игроков",
		"escudo": "эмблема",
		"escudos": "эмблем",
		"competicion": "турнир",
		"competiciones": "турниров",
		"club desconocido": "неизвестный клуб",
		"competición desconocida": "неизвестный турнир",
		"marca desconocida": "неизвестный бренд",
		"id vacío": "пустой id",
		"nombre vacío": "пустое имя",
		"marca {0}: {1}": "бренд {0}: {1}",
		"marca deportiva {0}: {1}": "бренд экипировки {0}: {1}",
		"pesa {0} KB (tope {1})": "{0} КБ (лимит {1})",
		"no es un PNG válido": "некорректный PNG",
		"no es un SVG válido": "некорректный SVG",
		"{0}x{1} (tope {2}x{3})": "{0}x{1} (лимит {2}x{3})",
		"no se pudo escribir": "не удалось записать",
		"no se encontró el archivo": "файл не найден",
		"no se pudo abrir el archivo": "не удалось открыть файл",
		"el archivo pesa más de {0} MB": "файл больше {0} МБ",
		"el archivo no es un JSON válido": "файл не является корректным JSON",
		"formato {0}: este juego lee el {1}": "формат {0}: игра читает {1}",
		"{0} pide {1} asientos y el juego admite de {2} a {3}": "{0}: требуется мест — {1}, а игра допускает от {2} до {3}",
		"{0} se queda en {1} asientos: el último es su único {2}": "{0}: остается мест — {1}; последнее — единственный {2}",
		"{0}: el asiento {1} se queda de {2} (el pack lo dejaba sin ninguno)": "{0}: место {1} остается {2} (в паке у него не было позиции)",
		"no se pudo cruzar {0} con {1} (¿mismo país? ¿misma división?)": "не удалось обменять {0} и {1} (одна страна? один дивизион?)",
		"club desconocido: {0}": "неизвестный клуб: {0}",
		"formación desconocida: {0}": "неизвестная схема: {0}",
		"país desconocido: {0}": "неизвестная страна: {0}",
		"leyenda desconocida: {0}": "неизвестная легенда: {0}",
		"planta desconocida: {0}": "неизвестная форма стадиона: {0}",
		"estadio": "стадион",
		"estadios": "стадионов",
		"logo de {0}: {1}": "эмблема клуба {0}: {1}",
		"base64 ilegible": "нечитаемый base64",
		"{0} trae {1} jugadores y hay {2} asientos": "{0}: игроков — {1}, мест — {2}",
		"{0} trae {1} jugadores para {2} asientos: {3} sin cubrir": "{0}: игроков — {1}, мест — {2}, не занято: {3}",
		"{0}: {1} clubes sin jugadores en el pack (se quedan los del juego)": "{0}: клубов без игроков в паке — {1} (остаются игровые составы)",
		"{0} de {1} jugadores": "Игроки: {0} из {1}",
		"{0} sin cubrir": "Не занято: {0}",
		"{0} descartados": "Отброшено: {0}",
		"IMPORTAR": "ИМПОРТ",

		"EL MUNDO SE MOVIO": "МИР ИЗМЕНИЛСЯ",
		"Los clubes llevan {0} en esta carrera. Esos jugadores se quedan con su nombre anterior: el pack no los reescribe.":
			"Клубы уже провели в этой карьере: {0}. Эти игроки сохраняют прежние имена: пак их не переписывает.",
		"fichaje": "трансфер",
		"fichajes": "трансферов",
		"Puedes devolver el mundo al catálogo que acabas de importar. Se pierden esos fichajes, también los de tu plantilla; tu carrera, tu club y tus estadísticas no se tocan.":
			"Можно вернуть мир к каталогу, который ты только что импортировал. Эти трансферы пропадут, включая трансферы твоего состава; твоя карьера, клуб и статистика не изменятся.",
		"VOLVER AL PACK": "ВЕРНУТЬ ПАК",
		"DEJARLO ASI": "ОСТАВИТЬ",
		"QUITAR TODO LO IMPORTADO": "УДАЛИТЬ ВЕСЬ ИМПОРТ",
		"NO SE PUDO LEER": "ОШИБКА ЧТЕНИЯ",
		"Nombres, plantillas y escudos desde un archivo tuyo. Se puede deshacer entero.":
			"Имена, составы и эмблемы из твоего файла. Можно полностью отменить.",
		"No hay ningún archivo todavía. Toca IMPORTAR, deja tu .json en esa carpeta y vuelve.":
			"Файлов пока нет. Нажми ИМПОРТ, положи свой .json в эту папку и возвращайся.",
		"Pisa los nombres y las plantillas que tengas ahora.":
			"Заменяет имена и составы, которые у тебя сейчас.",
		"Vale para todas las ranuras y se puede quitar entero.":
			"Действует во всех слотах и снимается целиком.",
		"Todo lo que has tocado, para llegar de un toque y para poder deshacerlo.":
			"Все, что ты менял, — в одно касание и с возможностью отмены.",





		"CAMBIAR DE DIVISION": "СМЕНИТЬ ДИВИЗИОН",
		"La división solo se cambia con la temporada recién empezada: el calendario,"
		+ " la tabla y el bombo de copa ya están armados con las de ahora.":
			"Дивизион можно сменить только в самом начале сезона: календарь, таблица и жеребьевка кубка уже составлены по нынешним.",
		"El calendario se vuelve a sortear: liga, copa y europeas.":
			"Календарь разыгрывается заново: лига, кубок и еврокубки.",
		"EDITOR DE ESTA CARRERA": "РЕДАКТОР ЭТОЙ КАРЬЕРЫ",
		"EDITAR MI CARRERA": "ИЗМЕНИТЬ КАРЬЕРУ",
		"Retoca el plantel que tienes HOY: con sus fichajes, sus retiros y sus años"
		+ " encima. Sólo cambia esta partida; tu base de datos global no se toca.":
			"Поправь состав, который у тебя СЕЙЧАС: с его трансферами, завершениями карьер и прожитыми годами. Меняется только это сохранение; твоя общая база данных не затрагивается.",
		"EDITANDO TU CARRERA · {0} · TEMPORADA {1}":
			"РЕДАКТОР КАРЬЕРЫ · {0} · СЕЗОН {1}",
		"Lo que toques aquí cambia SOLO esta carrera.\nTu base de datos global no se"
		+ " entera.":
			"То, что ты меняешь здесь, касается ТОЛЬКО этой карьеры.\nТвоя общая база данных об этом не узнает.",
		"{0} de {1} asientos editados en esta carrera.":
			"Изменено мест в этой карьере: {0} из {1}.",
		"Todavía no has editado nada en esta carrera.":
			"Ты пока ничего не менял в этой карьере.",
		"NO CABE": "НЕТ МЕСТА",
		"Esta carrera ya tiene {0} asientos editados, que es el tope.":
			"В этой карьере уже изменено мест: {0} — это предел.",
		"Esta carrera ya tiene {0} asientos editados, que es el tope. Quita alguno en"
		+ " MIS EDICIONES.":
			"В этой карьере уже изменено мест: {0} — это предел. Убери часть в разделе МОИ ПРАВКИ.",
		"Todo lo que has tocado EN ESTA CARRERA vuelve a como estaba.":
			"Все, что ты менял В ЭТОЙ КАРЬЕРЕ, вернется как было.",
		"La base de datos global no se toca: sigue igual en todas las ranuras.":
			"Общая база данных не затрагивается: она остается прежней во всех слотах.",
		"Los fichajes que hiciste aquí NO se deshacen: son parte de la partida.":
			"Трансферы, которые ты сделал здесь, НЕ отменяются: они часть сохранения.",
		"Todavía no has editado nada.": "Ты пока ничего не менял.",
		"· IDENTIDAD DEL CLUB (NOMBRE, COLORES, ESCUDO)":
			"· ПРОФИЛЬ КЛУБА (НАЗВАНИЕ, ЦВЕТА, ЭМБЛЕМА)",
		"VER MÁS ({0})": "ЕЩЕ ({0})",
		"QUITAR TODO LO EDITADO": "СБРОСИТЬ ВСЕ ПРАВКИ",
		"Las plantillas, los traspasos, las caras y los escudos vuelven a la base de fábrica.":
			"Составы, трансферы, лица и эмблемы возвращаются к заводским настройкам.",
		"Vale para todas las ranuras de partida, no solo para esta.":
			"Действует во всех слотах сохранений, а не только в этом.",
		"Esto SI es para siempre.": "Это НЕЛЬЗЯ отменить.",
		"Ningún {0} encaja con esa búsqueda. Toca TODOS para ver el resto.":
			"Ни один {0} не подходит под этот поиск. Нажми ВСЕ, чтобы увидеть остальных.",
		"SUBIR O BAJAR TODO EL CLUB": "ПОДНЯТЬ ИЛИ СНИЗИТЬ ВЕСЬ КЛУБ",
		"AJUSTAR EL CLUB": "НАСТРОИТЬ КЛУБ",
		"Suma o resta a TODAS las cualidades de los 23 asientos.":
			"Прибавляет или отнимает у ВСЕХ характеристик всех 23 мест.",
		"Nada baja de {0} ni pasa de {1}. Se deshace entero con QUITAR EDICIONES DEL CLUB.":
			"Ничего не опустится ниже {0} и не превысит {1}. Отменяется целиком кнопкой СБРОСИТЬ ПРАВКИ КЛУБА.",
		"DUPLICAR": "КОПИЯ",
		"No es para siempre: QUITAR EDICION devuelve al de antes.":
			"Это не навсегда: СБРОСИТЬ ПРАВКУ вернет прежнего.",
		"JUGADOR NUEVO": "НОВЫЙ ИГРОК",
		"El puesto y el dorsal los da el asiento\nque elijas al final.":
			"Позицию и номер задает место,\nкоторое ты выберешь в конце.",
		"NOMBRE DEL JUGADOR": "ИМЯ ИГРОКА",
		"ELEGIR ASIENTO": "ВЫБРАТЬ МЕСТО",
		"JUGADOR NUEVO: {0}": "НОВЫЙ ИГРОК: {0}",
		"TRASPASO: {0} ({1} · {2})": "ПЕРЕХОД: {0} ({1} · {2})",
		"CANCELAR ALTA": "НЕ СОЗДАВАТЬ",
		"CANCELAR TRASPASO": "ОТМЕНИТЬ ПЕРЕХОД",
		"CONFIRMAR ALTA": "СОЗДАТЬ ИГРОКА",
		"{0} entra en {1}.": "{0} переходит в клуб {1}.",
		"SE VA SOLO (SIN CAMBIO)":
			"УХОДИТ ОДИН (БЕЗ ОБМЕНА)",
		"INTERCAMBIO CON OTRO JUGADOR":
			"ОБМЕН НА ДРУГОГО ИГРОКА",
		"Los dos jugadores cambian de club.":
			"Оба игрока меняют клубы.",
		"TRASPASO HECHO: {0} FICHA POR {1}.":
			"ГОТОВО: {0} ПЕРЕХОДИТ В {1}.",
		"Nadie vuelve a cambio: su club se queda con un jugador menos.":
			"Взамен никто не приходит: в его клубе становится на одного игрока меньше.",
		"Al tocar un club se ficha ahí mismo: no eliges asiento.":
			"Касание клуба сразу оформляет переход: место выбирать не нужно.",
		"Nadie vuelve a cambio y nadie deja su asiento.":
			"Взамен никто не приходит, и никто не теряет место.",
		"{0} se queda con {1} jugadores y {2} pasa a {3}.":
			"У {0} остается игроков: {1}, у {2} — {3}.",
		"Sigue jugando en su puesto, con un dorsal libre del club nuevo.":
			"Он остается на своей позиции и получает свободный номер в новом клубе.",
		"NO SE PUDO":
			"НЕ ВЫШЛО",
		"Ya juega en ese club.":
			"Он уже играет в этом клубе.",
		"Un club no puede bajar de {0} jugadores.":
			"Минимум игроков в клубе: {0}.",
		"Un club no puede pasar de {0} jugadores.":
			"Максимум игроков в клубе: {0}.",
		"{0} se quedaría sin ningún {1}.":
			"У {0} не останется ни одного {1}.",
		"Ese traspaso no se puede hacer.":
			"Этот переход невозможен.",
		"{0} deja su asiento y SALE del juego.":
			"{0} покидает свое место и УХОДИТ из игры.",
		"El nuevo jugará de {0} con el dorsal {1}.":
			"Новичок будет играть на позиции {0} под номером {1}.",
		"CREAR": "СОЗДАТЬ",
		"ALTA HECHA: {0} ENTRA POR {1}.": "ИГРОК СОЗДАН: {0} ВМЕСТО {1}.",
		"{0} ficha por {1}.": "{0} подписывает контракт с клубом {1}.",
		"{0} se marcha a {1}.": "{0} уходит в клуб {1}.",
		"OJO: {0} pasa a jugar de {1} y {2} de {3}.":
			"Внимание: {0} теперь играет на позиции {1}, а {2} — на {3}.",
		"CONFIRMAR TRASPASO": "ПОДТВЕРДИТЬ ПЕРЕХОД",
		"CONFIRMAR": "ПОДТВЕРДИТЬ",
		"TRASPASO HECHO: {0} LLEGA POR {1}.": "ГОТОВО: {0} ПРИХОДИТ ЗА {1}.",
		"QUITAR EDICIONES": "СБРОСИТЬ ПРАВКИ",
		"Todo el {0} vuelve a su plantilla de base.":
			"Клуб {0} целиком возвращается к исходному составу.",
		"Los traspasos hechos con este club también se deshacen aquí.":
			"Переходы с участием этого клуба тоже отменяются здесь.",
		"QUITAR TODO": "УБРАТЬ ВСЕ",


		"FISICO": "ОБЛИК",
		"FISICO (PIEL, PELO, BARBA)": "ОБЛИК (КОЖА, ВОЛОСЫ, БОРОДА)",
		"La cara viaja con la persona: si la traspasas, se la lleva. Se guarda solo.":
			"Лицо остается с человеком: переведешь его в другой клуб — оно уйдет с ним. Сохраняется само.",
		"QUITAR FISICO (VOLVER AL DE FABRICA)": "СБРОСИТЬ ОБЛИК (К ИСХОДНОМУ)",


		"Nace con esta cara. El alta no se confirma hasta elegir asiento.":
			"Он появится с этим лицом. Игрок не будет создан, пока ты не выберешь место.",

		"NOMBRE": "НАЗВАНИЕ",
		"SIGLAS (VAN EN EL ESCUDO)": "АББРЕВИАТУРА (НА ЭМБЛЕМЕ)",
		"UNIFORME": "ФОРМА",
		"UNIFORME · {0}": "ФОРМА · {0}",
		"Playera": "Футболка",
		"Shorts": "Шорты",
		"Acento del patrón": "Акцент узора",
		"PATRON": "УЗОР",
		"LOCAL": "ДОМА",
		"VISITA": "ВЫЕЗД",
		"ALTERNA": "ТРЕТЬЯ",
		"El acento solo se ve si la playera lleva patrón.":
			"Акцент виден, только если на футболке есть узор.",
		"PECHO DE LA PLAYERA": "ГРУДЬ ФУТБОЛКИ",
		"PATROCINADOR": "СПОНСОР",
		"MARCA DEPORTIVA": "БРЕНД ФОРМЫ",
		"Estas son las marcas del juego: importa un pack de logos para usar las tuyas. El club estrena lo que elijas en esta misma temporada, y desde ahí los contratos siguen rotando solos cada pocas temporadas.":
			"Это бренды самой игры: импортируй пак логотипов, чтобы использовать свои. Клуб выйдет в выбранном уже в этом сезоне, а дальше контракты сами меняются раз в несколько сезонов.",
		"Las marcas salen de tu pack. El club estrena lo que elijas en esta misma"
		+ " temporada, y desde ahí los contratos siguen rotando solos cada pocas"
		+ " temporadas.":
			"Бренды берутся из твоего пака. Клуб выйдет в выбранном уже в этом сезоне, а дальше контракты сами меняются раз в несколько сезонов.",


		"tintaAUTO": "АВТО",
		"TINTA DEL PECHO · {0}": "ЦВЕТ НА ГРУДИ · {0}",
		"Color del patrocinador": "Цвет спонсора",
		"Color de la marca deportiva": "Цвет бренда формы",
		"Con AUTO el juego elige el color que mejor se lee sobre esta playera. El color que fijes vale solo para este uniforme.":
			"В режиме АВТО игра выбирает цвет, который лучше всего читается на этой футболке. Выбранный тобой цвет действует только для этой формы.",
		"Este uniforme se genera solo cada temporada. El club lo estrena tal cual"
		+ " en la temporada en que lo elijas, y a partir de ahí sigue cambiando de"
		+ " color y dibujo cada año.":
			"Эта форма создается заново каждый сезон. Клуб выйдет в ней в точности такой, как ты выбрал, в том сезоне, когда ты ее выбрал, а дальше ее цвет и рисунок снова будут меняться каждый год.",
		"ESCUDO": "ЭМБЛЕМА",


		"escudoFORMA": "КОНТУР",
		"FONDO": "ФОН",
		"TINTA": "ЦВЕТ",
		"EMBLEMA": "СИМВОЛ",
		"BORDE": "ОБОДОК",
		"La fuerza y el país no se tocan aquí: son la estructura de la liga.":
			"Силу и страну здесь не меняют: это структура лиги.",



		"Se INTERCAMBIA con un club de otra división del mismo país: uno sube y el"
		+ " otro baja, y cada liga sigue con los mismos equipos.":
			"Клуб МЕНЯЕТСЯ местами с клубом другого дивизиона той же страны: один поднимается, другой опускается, и в каждой лиге остаются те же команды.",
		"ELIGE EL CLUB CON EL QUE SE CAMBIA": "ВЫБЕРИ КЛУБ ДЛЯ ОБМЕНА",
		"Los dos se cruzan: uno sube y el otro baja.\nTiene que ser de otra división"
		+ " del mismo país.":
			"Они меняются местами: один поднимается, другой опускается.\nКлуб должен быть из другого дивизиона той же страны.",
		"CAMBIO DE DIVISION: {0} ({1})": "СМЕНА ДИВИЗИОНА: {0} ({1})",
		"CANCELAR CAMBIO": "ОТМЕНИТЬ ОБМЕН",
		"CONFIRMAR CAMBIO DE DIVISION": "ПОДТВЕРДИТЬ СМЕНУ ДИВИЗИОНА",
		"{0} pasa a {1}.": "{0}: теперь {1}.",
		"Se cruzan los dos, así que cada división sigue con los mismos equipos.":
			"Оба меняются местами, поэтому в каждом дивизионе остается столько же команд.",
		"Su plantel y su fuerza no cambian.": "Его состав и сила не меняются.",
		"Las carreras ya empezadas siguen con la división que tengan.":
			"В уже начатых карьерах дивизионы остаются прежними.",
		"CAMBIO HECHO: {0} A {1}.": "ГОТОВО: {0} — {1}.",

		"ELIGE SU EQUIPO NUEVO": "ВЫБЕРИ ЕГО НОВЫЙ КЛУБ",
		"Se cruza con el técnico de ese club: cada uno se sienta en el banquillo del otro.":
			"Он меняется местами с тренером этого клуба: каждый садится на скамейку другого.",
		"CAMBIO DE EQUIPO: {0} ({1})": "СМЕНА КЛУБА: {0} ({1})",
		"— TÉCNICOS —": "— ТРЕНЕРЫ —",
		"SU CARA": "ЛИЦО",
		"CAMBIAR DE EQUIPO": "СМЕНИТЬ КЛУБ",
		"DEJARLO LIBRE": "ОТПУСТИТЬ",
		"{0} SE QUEDA SIN EQUIPO. EN SU BANQUILLO SE SIENTA {1}.":
			"{0} ОСТАЕТСЯ БЕЗ КЛУБА. ЕГО МЕСТО ЗАНИМАЕТ {1}.",
		"Se va al mercado de técnicos y puede volver.":
			"Он уходит на рынок тренеров и может вернуться.",
		"DEVOLVER A SU CLUB": "ВЕРНУТЬ В КЛУБ",
		"{0} VUELVE A {1}.": "{0} СНОВА В {1}.",
		"QUITAR EDICIÓN DEL TÉCNICO": "СБРОСИТЬ ПРАВКИ ТРЕНЕРА",

		"— SELECCIONES —": "— СБОРНЫЕ —",
		"Las selecciones vuelven a su uniforme y su convocatoria de fábrica.":
			"Сборные возвращаются к заводской форме и заявке.",
		"El uniforme y la convocatoria de cada selección valen para todas tus partidas.":
			"Форма и заявка каждой сборной действуют во всех твоих сохранениях.",
		"BUSCAR SELECCION": "НАЙТИ СБОРНУЮ",
		"Ninguna selección se llama así.": "Сборной с таким названием нет.",
		"EDITADO: {0}": "ИЗМЕНЕНО: {0}",
		"AUTOMATICA": "АВТО",
		"ELEGIR CONVOCADOS": "ВЫБРАТЬ ЗАЯВКУ",
		"Este uniforme se genera solo cada temporada. La selección lo estrena tal cual en la temporada en que lo elijas, y a partir de ahí sigue cambiando de color y dibujo cada año.":
			"Эта форма создается заново каждый сезон. Сборная выйдет в ней в точности такой, как ты выбрал, в том сезоне, когда ты ее выбрал, а дальше ее цвет и рисунок снова будут меняться каждый год.",
		"La bandera, el nombre y la fuerza de un país no se tocan aquí.":
			"Флаг, название и силу страны здесь не меняют.",
		"QUITAR EDICION DEL UNIFORME": "СБРОСИТЬ ПРАВКИ ФОРМЫ",
		"{0} vuelve a sus uniformes de fábrica.": "{0}: форма возвращается к заводской.",
		"Su convocatoria no se toca.": "Заявка не меняется.",
		"FIJAR: va siempre. VETAR: no va nunca. El resto de la lista la arma el juego con los mejores del país.":
			"ВЗЯТЬ: едет всегда. ВЕТО: не едет никогда. Остальной список игра составляет из лучших игроков страны.",
		"CONVOCADOS · {0}": "ЗАЯВКА · {0}",
		"A LAS PUERTAS": "НА ПОДХОДЕ",
		"VER {0} MAS": "ЕЩЕ {0}",
		"FUERA DE LA LISTA": "ВНЕ ЗАЯВКИ",
		"VETADO": "ПОД ВЕТО",
		"QUITAR VETO": "СНЯТЬ ВЕТО",
		"FIJADO, PERO YA NO ESTA EN EL PAIS": "ВЗЯТ, НО УЖЕ НЕ В ОБОЙМЕ",
		"FIJADO, SIN SITIO": "ВЗЯТ, МЕСТ НЕТ",
		"SOLTAR": "СНЯТЬ",
		"QUITAR FIJADOS Y VETOS": "СБРОСИТЬ ВЫБОР И ВЕТО",
		"{0} vuelve a convocar solo a sus mejores.": "{0} снова вызывает только лучших.",
		"Su uniforme no se toca.": "Форма не меняется.",
		"FIJADO": "ВЗЯТ",
		"FIJAR": "ВЗЯТЬ",
		"VETAR": "ВЕТО",

		"— LEYENDAS —": "— ЛЕГЕНДЫ —",
		"Los grandes de la historia no juegan en ningún club: su cara se toca aquí.":
			"Великие в истории не играют ни за один клуб: их лицо меняется здесь.",
		"Sale con esta cara donde aparezca: al conocerla, en la gala y en la cancha. Se guarda sola.":
			"С этим лицом он появится везде: при знакомстве, на гала-вечере и на поле. Сохраняется само.",
		"QUITAR CARA (VOLVER A LA SUYA)": "СБРОСИТЬ ЛИЦО (К СВОЕМУ)",
		"La cara viaja con él: si cambia de banquillo, se la lleva. Se guarda sola.":
			"Лицо остается с ним: сменит скамейку — заберет его с собой. Сохраняется само.",
		"Fija en todas tus carreras. Sus resultados la suben o la bajan.":
			"Оценка одинакова во всех твоих карьерах. Его результаты повышают или понижают ее.",
		"Sin tocar, se sortea en cada carrera alrededor de esto.":
			"Если не трогать, в каждой карьере она разыгрывается вокруг этого значения.",
		"Sus resultados la suben o la bajan hasta estrella y media.":
			"Его результаты могут поднять или опустить ее на полторы звезды.",
		"El cambio de equipo vale para las carreras nuevas.": "Смена клуба действует для новых карьер.",
		"El cambio de equipo vale desde hoy en esta carrera.":
			"Смена клуба действует в этой карьере с сегодняшнего дня.",
		"CONFIRMAR CAMBIO DE EQUIPO": "ПОДТВЕРДИТЬ СМЕНУ КЛУБА",
		"{0} pasa a entrenar al {1}.": "{0} — новый тренер клуба {1}.",
		"Cada uno se lleva su habilidad, su cara y sus trofeos.":
			"Каждый сохраняет свое мастерство, лицо и трофеи.",
		"Las carreras ya empezadas siguen con sus banquillos.":
			"В уже начатых карьерах тренеры остаются на своих местах.",
		"Tu relación con tu técnico no cambia.": "Твои отношения с тренером не меняются.",
		"CAMBIO HECHO: {0} ENTRENA AL {1}.": "ГОТОВО: {0} ТРЕНИРУЕТ {1}.",
		"· DIVISION CAMBIADA ({0})": "· ДИВИЗИОН ИЗМЕНЕН ({0})",
		"La división tampoco: se deshace intercambiando otra vez.":
			"Дивизион тоже не вернется: чтобы отменить, поменяй клубы снова.",
		"QUITAR EDICION DEL CLUB": "СБРОСИТЬ ПРАВКИ КЛУБА",
		"{0} vuelve a su nombre, uniforme y escudo de fábrica.":
			"{0}: название, форма и эмблема возвращаются к заводским.",
		"Su plantel no se toca.": "Состав не меняется.",


		"LISO": "ГЛАДКИЙ",
		"RAYAS": "ПОЛОСЫ",
		"AROS": "ОБРУЧИ",
		"MITADES": "ПОЛОВИНЫ",
		"MANGAS": "РУКАВА",
		"RAYA FINA": "ПОЛОСКА",
		"BANDA": "ЛЕНТА",
		"DIAGONAL": "НАИСКОСЬ",
		"CUADROS": "КЛЕТКА",
		"FRANJA VERTICAL": "ПРОДОЛЬНАЯ",
		"FRANJA PECHO": "НАГРУДНАЯ",
		"REDONDO": "КРУГ",
		"SCUDETTO": "СКУДЕТТО",
		"HEXAGONO": "ГЕКСАГОН",
		"BANDERIN": "ВЫМПЕЛ",
		"ROMBO": "РОМБ",
		"ESTANDARTE": "ШТАНДАРТ",
		"TRAPECIO": "ТРАПЕЦИЯ",
		"FRANCES": "ФРАНЦИЯ",
		"PICA": "ПИКА",
		"CUADRADO": "КВАДРАТ",
		"PALO": "СТОЛБ",
		"FAJA": "ПОЯС",
		"CUARTELES": "ЧЕТВЕРТИ",
		"CHEVRON": "ШЕВРОН",
		"JEFE": "ГЛАВА",
		"PIE": "НИЗ",
		"ORLA": "КАЙМА",
		"PUNTA": "ОСТРИЕ",
		"ROMBOS": "РОМБЫ",
		"TRICOLOR": "ТРИКОЛОР",
		"SEGUNDO COLOR": "ВТОРОЙ ЦВЕТ",
		"OSCURO": "ТЕМНЫЙ",
		"CLARO": "СВЕТЛЫЙ",
		"NADA": "НЕТ",
		"LETRAS": "БУКВЫ",
		"ESTRELLA": "ЗВЕЗДА",
		"DOS ESTRELLAS": "ДВЕ ЗВЕЗДЫ",
		"ARO": "КОЛЬЦО",
		"BALON": "МЯЧ",
		"AGUILA": "ОРЕЛ",
		"TORO": "БЫК",
		"CORONA": "КОРОНА",
		"RAYO": "МОЛНИЯ",
		"LUNA": "ЛУНА",
		"TORRE": "БАШНЯ",
		"ANCLA": "ЯКОРЬ",
		"ENGRANE": "ШЕСТЕРНЯ",
		"HOJA": "ЛИСТ",
		"ORO": "ЗОЛОТО",
		"BLANCO": "БЕЛЫЙ",
		"NEGRO": "ЧЕРНЫЙ",
		"TEMPORADA {0}": "СЕЗОН {0}",
		"FIN DE TEMPORADA": "КОНЕЦ СЕЗОНА",
		"TU AÑO": "ТВОЙ ГОД",
		"PROGRESION": "ПРОГРЕСС",
		"EL MUNDO": "МИР",
		"LO QUE VIENE": "ЧТО ДАЛЬШЕ",
		"LA DESPEDIDA": "ПРОЩАНИЕ",
		"IR AL MERCADO": "НА РЫНОК",
		"Objetivo del club: {0}": "Цель клуба: {0}",
		"CUMPLIDO": "ВЫПОЛНЕНА",
		"NO CUMPLIDO": "НЕ ВЫПОЛНЕНА",
		"temporadaMEDIA": "ОЦЕНКА",
		"{0} vs. el año pasado": "{0} к прошлому году",
		"TUS HABILIDADES": "ТВОИ НАВЫКИ",
		"TU SITIO EN EL MUNDO": "ТВОЕ МЕСТО В МИРЕ",
		"TU CARRERA HASTA HOY": "КАРЬЕРА НА СЕГОДНЯ",
		"Tu mejor partido: {0}": "Твой лучший матч: {0}",
		"HITOS DE CARRERA": "ВЕХИ КАРЬЕРЫ",
		"{0} partidos como profesional": "Профессиональных матчей: {0}",
		"{0} goles de carrera": "Голов за карьеру: {0}",
		"{0} asistencias de carrera": "Ассистов за карьеру: {0}",
		"{0} partidos disputados": "Сыграно матчей: {0}",
		"{0} goles marcados": "Забито голов: {0}",
		"{0} asistencias repartidas": "Отдано ассистов: {0}",
		"TÚ Y TUS COMPAÑEROS": "ТЫ И ПАРТНЕРЫ",
		"TU MEJOR PARTIDO": "ТВОЙ ЛУЧШИЙ МАТЧ",
		"OBJETIVO DEL CLUB": "ЦЕЛЬ КЛУБА",
		"vs {0}": "против {0}",
		"vs. el año pasado": "к прошлому году",
		"EL CLUB Y TÚ": "КЛУБ И ТЫ",
		"EL CLUB CUENTA CONTIGO": "КЛУБ НА ТЕБЯ РАССЧИТЫВАЕТ",
		"EL CLUB ESPERA MÁS DE TI": "КЛУБ ЖДЕТ ОТ ТЕБЯ БОЛЬШЕГО",
		"EL CLUB TE BUSCARÁ MINUTOS FUERA": "КЛУБ ПОИЩЕТ ТЕБЕ МИНУТЫ НА СТОРОНЕ",
		"EL CLUB TE PONE EN EL ESCAPARATE": "КЛУБ ВЫСТАВЛЯЕТ ТЕБЯ НА ПРОДАЖУ",
		"TU MEDIA AÑO A AÑO": "ТВОЙ OVR ПО ГОДАМ",
		"Valor de mercado": "Рыночная стоимость",
		"Dinero": "Деньги",
		"SIN TÍTULOS": "БЕЗ ТИТУЛОВ",
		"Este año no levantaste nada. Se vuelve a empezar.":
			"В этом году ты ничего не выиграл. Начинаем сначала.",
		"En color, lo que levantaste; apagado, lo que se escapó.": "В цвете — то, что ты выиграл; блеклым — то, что упустил.",
		"LO QUE GANASTE": "ТВОИ ТРОФЕИ",
		"GOLEO DE LA LIGA": "БОМБАРДИРЫ ЛИГИ",
		"CÓMO ACABÓ TU LIGA": "ИТОГИ ТВОЕЙ ЛИГИ",
		"Acabaste {0} de {1}.": "Итог: {0} из {1}.",
		"SIN NOVEDAD": "БЕЗ ПЕРЕМЕН",
		"El mundo siguió su curso sin sobresaltos.": "Мир жил своей жизнью без потрясений.",
		"LO QUE SE LLEVARON OTROS": "ЧТО ВЫИГРАЛИ ДРУГИЕ",

		"EN EL MUNDO": "В МИРЕ",
		"FICHAJE DEL AÑO": "ТРАНСФЕР ГОДА",
		"Suben de categoría: {0}": "Повысились в классе: {0}",
		"{0} pts": "{0} очк.",
		"Y HASTA AQUI": "ВОТ И ВСЕ",
		"NO HAY TEMPORADA SIGUIENTE.": "СЛЕДУЮЩЕГО СЕЗОНА НЕ БУДЕТ.",
		"Se acabó el futbol jugado. Lo que viene ahora es la despedida, y despues lo"
		+ " que dejaste.":
			"Футбол на поле для тебя закончился. Впереди прощание, а потом — то, что ты после себя оставил.",


		"{0} temporadas": "Сезонов: {0}",
		"Hiciste {0} goles el año pasado": "Голов в прошлом сезоне: {0}",
		"Diste {0} asistencias el año pasado": "Голевых передач в прошлом сезоне: {0}",
		"Jugaste {0} partidos el año pasado": "Матчей в прошлом сезоне: {0}",
		"PRIMA": "БОНУС",
		"EL AÑO EN DINERO": "ГОД В ДЕНЬГАХ",
		"GANASTE ESTE AÑO": "ТЫ ЗАРАБОТАЛ",
		"Primas por títulos": "Бонусы за титулы",
		"Prima de objetivo": "Бонус за цель сезона",
		"Prima por el año del club": "Бонус за сезон клуба",
		"Royalties de camiseta": "Роялти с футболок",
		"Premio del patrocinador": "Награда от спонсора",

		"TU SELECCIÓN": "ТВОЯ СБОРНАЯ",
		"TU CUERPO": "ТВОЕ ТЕЛО",
		"EL RESTO DEL AÑO": "ОСТАТОК ГОДА",
		"TU SITUACIÓN": "ТВОЙ СТАТУС",
		"ERES AGENTE LIBRE: tu contrato terminó.": "ТЫ СВОБОДНЫЙ АГЕНТ: твой контракт истек.",
		"Ningún club es dueño de tu pase. Elige destino en el mercado: fichas sin"
		+ " traspaso y con prima.":
			"Ни один клуб не владеет твоими правами. Выбери новый клуб на рынке: переходишь без трансферной суммы и с бонусом за подпись.",
		"Contrato: ÚLTIMO AÑO": "Контракт: ПОСЛЕДНИЙ ГОД",
		"Contrato: {0} temporadas por delante": "Контракт: осталось сезонов — {0}",
		"Renueva o escucha ofertas: si acabas el año sin firmar, te vas gratis.":
			"Продли контракт или слушай предложения: закончишь год без подписи — уйдешь бесплатно.",
		"LO QUE TE PIDEN AHORA": "ТВОЯ НОВАЯ ЦЕЛЬ",
		"QUIÉN TE QUIERE": "КТО ТЕБЯ ХОЧЕТ",
		"TE QUIERE YA": "ХОЧЕТ СЕЙЧАС",
		"MUY INTERESADO": "ОЧЕНЬ ХОЧЕТ",
		"Y {0} clubes más preguntaron por ti.": "Тобой интересовались и другие клубы: еще {0}.",
		"ÚLTIMA JUGADA": "ПОСЛЕДНИЙ ШАНС",
		"GOLEADOR": "ЗАБИЛ",
		"ASISTENCIA": "АССИСТ",
		"hudFINAL": "КОНЕЦ МАТЧА",
		"CALIFICACIÓN": "ОЦЕНКА",
		"EXPERIENCIA": "ОПЫТ",
		"¡NIVEL {0}!  +{1} puntos": "УРОВЕНЬ {0}!  +{1} очк.",
		"¡NIVEL {0}!": "УРОВЕНЬ {0}!",

		"RECUPERADAS": "ОТБОРЫ",



		"Recuperadas": "Отборы",
		"OCASIONES": "МОМЕНТЫ",
		"PASES": "ПАСЫ",
		"{0} CLAVE": "ОСТРЫХ: {0}",
		"HAT-TRICK": "ХЕТ-ТРИК",
		"HÉROE DEL DERBI": "ГЕРОЙ ДЕРБИ",
		"PARTIDAZO": "БЕНЕФИС",
		"REPARTIDOR": "ДИСПЕТЧЕР",
		"DOBLETE": "ДУБЛЬ",
		"GOL Y ASISTENCIA": "ГОЛ + АССИСТ",
		"GRAN PARTIDO": "СИЛЬНЫЙ МАТЧ",
		"LOS 90 MINUTOS": "ВСЕ 90 МИНУТ",
		"UNIFORMES PARECIDOS · EL RIVAL SALE DE VISITA":
			"ФОРМЫ ПОХОЖИ · СОПЕРНИК В ГОСТЕВОЙ",
		"JUGAR": "ИГРАТЬ",
		"SALTAR AL CAMPO": "ВЫЙТИ НА ПОЛЕ",
		"SUPLENTE": "ЗАПАС",
		"CANSADO": "УСТАЛ",
		"JORNADA {0}": "ТУР {0}",
		"Uniforme titular": "Домашняя форма",
		"Uniforme visitante": "Выездная форма",
		"Tercer uniforme": "Третья форма",
		"Uniforme conmemorativo": "Памятная форма",
		"uniformeLOCAL": "ДОМА",
		"uniformeVISITA": "ВЫЕЗД",
		"uniformeALTERNA": "ТРЕТЬЯ",
		"El balón debe estar al menos a {0} m de la línea de gol.":
			"Мяч должен быть не ближе {0} м от линии ворот.",
		"El balón está demasiado cerca del arco (mínimo {0} m).":
			"Мяч слишком близко к воротам (минимум {0} м).",
		"Con el balón tan abierto la cámara cae tras la tribuna (máx {0} m).":
			"Мяч так далеко сбоку, что камера уходит за трибуну (макс. {0} м).",
		"Hay un jugador fuera del campo.": "Один из игроков за пределами поля.",
		"Un balón en movimiento tan lento nunca sale de la pantalla de tiro.":
			"Так медленно катящийся мяч никогда не покинет экран удара.",
		"Tipo de jugada desconocido.": "Неизвестный тип розыгрыша.",
		"Un jugador de la barrera no está a los 9.15 m.":
			"Игрок в стенке стоит не на отметке 9,15 м.",
		"{0} {1} CERCA de la jugada quedan fuera del encuadre.":
			"{0} {1} РЯДОМ с эпизодом не попадают в кадр.",
		"{0} {1} tapan tu carril de tiro.": "{0} {1} перекрывают тебе линию удара.",
		"{0} {1} pegados al balón o a tu carrera.":
			"{0} {1} вплотную к мячу или к твоему разбегу.",
		"{0} {1} de jugadores encimados.": "{0} {1} игроков вплотную друг к другу.",
		"{0} {1} en fuera de juego: el pase se pitará.":
			"{0} {1} в офсайде: после паса будет свисток.",
		"Un centro sin rematadores no tiene a quién buscar.":
			"Навес без нападающих в штрафной никого не найдет.",
		"TUS MARCAS": "ЛИЧНЫЕ РЕКОРДЫ",
		"TORNEOS DE EUROPA": "ЕВРОКУБКИ",

		"BALONES DE ORO": "ИГРОК ГОДА",
		"LIGAS": "ЛИГИ",
		"RÉCORD / TÚ": "РЕКОРД / ТЫ",
		"RÉCORD / {0}": "РЕКОРД / {0}",
		"EN ACTIVO": "ЕЩЕ ИГРАЕТ",
		"a los {0}": "в возрасте {0}",

		"TUS VÍCTIMAS": "ТВОИ ЖЕРТВЫ",
		"G+A": "Г+П",
		"G+A/PJ": "Г+П/И",
		"{0} RIVALES": "КОМАНД: {0}",
		"Todavía no le has hecho daño a nadie.": "Ты пока никого не наказал.",
		"Aún no hay historia que contar: sal a jugar.":
			"Истории пока нет: выходи на поле.",
		"Mejor temporada goleadora": "Лучший голевой сезон",
		"Más asistencias en un año": "Больше всего голевых передач за год",
		"Mejor media (10+ partidos)": "Лучшая оценка (10+ матчей)",
		"Valor pico: $ {0} a los {1} años": "Пик стоимости: $ {0} в возрасте {1}",
		"Mayor presentación: {0} personas ({1}, T{2})":
			"Самая большая презентация: зрителей — {0} ({1}, сез. {2})",
		"{0}: {1} (T{2}, {3})": "{0}: {1} (СЕЗ. {2}, {3})",
		"RÉCORDS DE LA LIGA · {0}": "РЕКОРДЫ ЛИГИ · {0}",
		"EL REGISTRO DE {0}": "РЕКОРД КЛУБА {0}",
		"RÉCORDS DEL MUNDO": "МИРОВЫЕ РЕКОРДЫ",
		"★ {0}: {1} — RÉCORD TUYO": "★ {0}: {1} — ТВОЙ РЕКОРД",
		"{0}: {1} — TU RÉCORD (T{2})": "{0}: {1} — ТВОЙ РЕКОРД (СЕЗ. {2})",
		"Antes: {0} ({1}), con {2}": "Раньше: {0} ({1}), клуб {2}",
		"Tu mejor: {0}": "Твой рекорд: {0}",
		"Goles en una temporada": "Голы за сезон",
		"Asistencias en una temporada": "Голевые передачи за сезон",
		"Mejor media en una temporada": "Лучшая оценка за сезон",
		"Goles en una temporada con el club": "Голы за клуб за один сезон",
		"Goles con el club": "Голы за клуб",
		"SUPERAS A": "ТЫ ОБОШЕЛ",
		"LEYENDA Nº{0}": "ЛЕГЕНДА №{0}",
		"Partidos jugados en la liga": "Матчи в лиге",
		"Partidos jugados con el club": "Матчи за клуб",
		"Goles en una edición de Champions": "Голы за один розыгрыш Кубка элиты",
		"Asistencias en una edición de Champions": "Голевые передачи за один розыгрыш Кубка элиты",
		"Mejor media en una edición de Champions": "Лучшая оценка за один розыгрыш Кубка элиты",
		"Goles en una edición de Europa League": "Голы за один розыгрыш Кубка Европы",
		"Asistencias en una edición de Europa League": "Голевые передачи за один розыгрыш Кубка Европы",
		"Mejor media en una edición de Europa League": "Лучшая оценка за один розыгрыш Кубка Европы",
		"Goles en una edición de Conference": "Голы за один розыгрыш Кубка Челлендж",
		"Asistencias en una edición de Conference": "Голевые передачи за один розыгрыш Кубка Челлендж",
		"Mejor media en una edición de Conference": "Лучшая оценка за один розыгрыш Кубка Челлендж",
		"Goles con la selección": "Голы за сборную",
		"LA SELECCIÓN · {0}": "СБОРНАЯ · {0}",
		"Reescrito {0} veces: {1}": "Рекорд обновлялся: {0} · {1}",
		"{0} reescribió el libro: {1} ({2})": "{0} переписал историю: {1} ({2})",
		"RÉCORD": "РЕКОРД",



		"SUPERAS A UNA LEYENDA": "ТЫ ОБОШЕЛ ЛЕГЕНДУ",
		"SUPERADA": "ПОЗАДИ",
		"TE ADELANTÓ": "ОБОШЕЛ ТЕБЯ",
		"Tu palmarés sólo cuenta lo ganado en 1ª división y el Mundial: es la vara con la que se mide a los grandes.":
			"В твой список трофеев идут только победы в высшей лиге и на мундиале: этой меркой меряют великих.",
		"Superar a tu primera leyenda de la historia (sólo cuenta lo hecho en 1ª división o con la selección).":
			"Обойти первую легенду в истории игры (в зачет идут только высшая лига и сборная).",
		"SUPERADO EN TÍTULOS": "ОБОЙДЕН ПО ТРОФЕЯМ",
		"SUPERADO EN GOLES + ASISTENCIAS": "ОБОЙДЕН ПО ГОЛАМ + АССИСТАМ",
		"TUS TÍTULOS (1ª Y SELECCIÓN)": "ТВОИ ТРОФЕИ (ВЫСШ. ЛИГА И СБОРНАЯ)",
		"TUS GOLES + ASISTENCIAS DE ÉLITE": "ТВОИ ГОЛЫ + АССИСТЫ В ЭЛИТЕ",
		"la tuya": "у тебя",
		"por delante": "впереди",
		"SEGUIR": "ДАЛЕЕ",
		"lo tenía": "владелец",
		"su marca": "его результат",
		"desde": "с",
		"Tu nombre entra en los libros. Ese registro ya es tuyo.":
			"Твое имя вписано в историю. Этот рекорд теперь твой.",
		"{0}: {1}. El registro era de {2} ({3}).":
			"{0}: {1}. Прежний рекордсмен: {2} ({3}).",
		"{0} · {1} JUGADORES": "{0} · ИГРОКОВ: {1}",
		"CAPITÁN": "КАПИТАН",
		"PENALES": "ПЕН.",
		"EL GLOBAL ES TUYO: AL RIVAL NO LE SIRVE ESTE MARCADOR": "ПО СУММЕ ТЫ ВПЕРЕДИ: СОПЕРНИКУ ЭТОТ СЧЕТ НЕ ПОМОЖЕТ",
		"{0} SE VUELCA ARRIBA: LE FALTAN {1} PARA PASAR": "{0} БРОСАЕТСЯ ВПЕРЕД: ДЛЯ ПРОХОДА НУЖНО ЕЩЕ {1}",
		"EL RIVAL DEJA MEDIO EQUIPO EN TU CAMPO, ATRÁS HAY PRADERA": "СОПЕРНИК БРОСИЛ ПОЛКОМАНДЫ ВПЕРЕД, СЗАДИ — ПРОСТОР",
		"GLOBAL EMPATADO: ESTO HUELE A PRÓRROGA": "ПО СУММЕ РАВНО: ПАХНЕТ ДОП. ВРЕМЕНЕМ",
		"TE FALTAN {0} EN EL GLOBAL, HAY QUE IR A POR ELLOS": "ПО СУММЕ НЕ ХВАТАЕТ {0}, НАДО ИДТИ ВПЕРЕД",
		"TU EQUIPO SE VUELCA Y DEJA LA ESPALDA VENDIDA": "ТВОЯ КОМАНДА ИДЕТ ВПЕРЕД И ОГОЛЯЕТ ТЫЛ",
		"GLOBAL {0}-{1}": "СУММА {0}-{1}",
		"PASA {0}": "ПРОХОДИТ {0}",
		"FALTAS / CÓRNERS": "СТАНДАРТЫ",
		"Sin plantel: aún no tienes club.": "Нет состава: у тебя пока нет клуба.",
		"SUELDO": "ЗАРПЛАТА",
		"NOTA": "ОЦЕНКА",
		"Capitán": "Капитан",
		"Lanza los penales": "Бьет пенальти",
		"Lanza faltas y córners": "Бьет штрафные и угловые",
		"Aún no hay convocatoria que mostrar.": "Заявки пока нет.",
		"CONVOCATORIA": "ЗАЯВКА",


		"— banca —": "— запас —",
		"— corte de la convocatoria —": "— за бортом заявки —",

		"No tienes avisos todavía.": "Уведомлений пока нет.",
		"{0} · NUEVO": "{0} · НОВОЕ",
		"T{0} · día {1}": "Сез. {0} · день {1}",
		"buzonPREMIO": "НАГРАДА",
		"buzonCLUB Y SELECCION": "КЛУБ И СБОРНАЯ",
		"buzonMARCA Y NIVEL": "БРЕНД И УРОВЕНЬ",
		"buzonLESION": "ТРАВМА",
		"buzonAVISO": "НОВОСТЬ",
		"COMÚN": "ОБЫЧНЫЙ",
		"RARO": "РЕДКИЙ",
		"ÉPICO": "ЭПИЧНЫЙ",
		"LEGENDARIO": "ЛЕГЕНДАРНЫЙ",
		"ADIÓS A LAS CANCHAS": "ПРОЩАЙ, ФУТБОЛ",
		"{0} TEMPORADAS · SE RETIRA A LOS {1}": "СЕЗОНОВ: {0} · ВОЗРАСТ УХОДА: {1}",
		"JUGO HASTA EL FINAL": "ИГРАЛ ДО КОНЦА",
		"SE FUE CUANDO QUISO": "УШЕЛ, КОГДА ЗАХОТЕЛ",

		"EL CUERPO DIJO BASTA": "ТЕЛО СКАЗАЛО: ХВАТИТ",
		"TU LEGADO": "НАСЛЕДИЕ",
		"por rango": "по рангу",
		"Club: {0} partidos  ({1}V · {2}E · {3}D)":
			"Клуб: матчей {0}  ({1} В · {2} Н · {3} П)",
		"Goles: {0}   Asistencias: {1}   Media: {2}":
			"Голы: {0}   Ассисты: {1}   Оценка: {2}",
		"{0}: {1} partidos · {2} goles · {3} asistencias":
			"{0}: матчи {1} · голы {2} · ассисты {3}",
		"TOTAL: {0} partidos · {1} goles · {2} asistencias":
			"ВСЕГО: матчи {0} · голы {1} · ассисты {2}",
		"{0} títulos de equipo · {1} premios individuales":
			"Командных титулов: {0} · личных наград: {1}",
		"TUS CLUBES": "ТВОИ КЛУБЫ",
		"EMPEZAR OTRA CARRERA": "НОВАЯ КАРЬЕРА",
		"ENTRAR AL MUSEO": "ЗАЙТИ В МУЗЕЙ",
		"TE QUIEREN DE VUELTA": "ТЕБЯ ЖДУТ ОБРАТНО",
		"JUGASTE AQUÍ": "ТЫ ИГРАЛ ЗДЕСЬ",
		"Ya jugaste aquí, y no te han olvidado.": "Ты уже играл здесь, и тебя не забыли.",
		"Su {0} tiene {1}. Tú vuelves con {2}.": "Их {0}: {1}. Ты возвращаешься с рейтингом {2}.",
		"¿FIRMAS?": "ПО РУКАМ?",
		"{0} · {1} por temporada, {2} años.": "{0} · {1} за сезон, срок — {2} г.",
		"Vuelves como agente libre y sin traspaso. Es la única vuelta que tiene esta carrera: si la firmas, el retiro que viene después ya es el definitivo.": "Ты возвращаешься свободным агентом, без трансферной суммы. Это единственное возвращение в этой карьере: если подпишешь, следующее завершение карьеры будет окончательным.",
		"FIRMAR Y VOLVER": "ПОДПИСАТЬ И В БОЙ",
		"¿VOLVER A JUGAR?": "СНОВА ИГРАТЬ?",
		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos. Volverías con 10 puntos menos en todas tus habilidades.": "Выслушать предложения обойдется в год: мир живет без тебя, а ты стареешь без игры. Ты вернешься на 10 очков слабее во всех навыках.",
		"VER QUIÉN ME QUIERE": "КТО МЕНЯ ЗОВЕТ",


		"¿SALIR DEL RETIRO?": "ВЕРНУТЬСЯ В ФУТБОЛ?",
		"Escuchar ofertas cuesta un año, y vuelves con 10 menos en todo.": "Выслушать предложения обойдется в год, и ты вернешься на 10 очков слабее во всем.",
		"SÍ, VUELVO": "ДА, ВЕРНУСЬ",
		"YA PAGASTE EL AÑO": "ГОД УЖЕ ОПЛАЧЕН",
		"CUESTA UN AÑO · 10 MENOS EN TODO": "ЦЕНА — ГОД · МИНУС 10 ВО ВСЕМ",
		"¿CON QUIÉN VUELVES?": "С КЕМ ВЕРНЕШЬСЯ?",
		"VOLVER AL MUSEO": "НАЗАД В МУЗЕЙ",


		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos.": "Выслушать предложения обойдется в год: мир живет без тебя, а ты стареешь без игры.",
		"LO QUE CUESTA": "ЦЕНА ВОПРОСА",
		"HABILIDADES": "НАВЫКИ",
		"VUELVES": "ВЕРНЕШЬСЯ",
		"EL ÚLTIMO VISTAZO": "ПОСЛЕДНИЙ ВЗГЛЯД",
		"años": "возраст",
		"tu OVR": "твой OVR",
		"Ni una copa detrás del cristal. Por eso vuelves.": "Ни одного кубка за стеклом. Вот почему ты возвращаешься.",
		"Todo eso ya lo ganaste. Y aun así te vas a poner las botas otra vez.": "Ты уже все это выиграл. И все равно снова зашнуровываешь бутсы.",
		"Se está bien aquí dentro. Pero aquí dentro ya no pasa nada.": "Здесь, внутри, хорошо. Но здесь больше ничего не происходит.",
		"EL AÑO QUE TE PERDISTE": "ПРОПУЩЕННЫЙ ГОД",
		"La liga la ganó {0}.": "Чемпион лиги: {0}.",
		"No llamó nadie. El teléfono de un retirado de tu edad suena poco, y ese silencio también es una respuesta.": "Никто не позвонил. Телефон бывшего игрока твоих лет звонит редко, и это молчание — тоже ответ.",
		"MUSEO": "МУЗЕЙ",
		"SALIR DEL MUSEO": "ВЫЙТИ ИЗ МУЗЕЯ",
		"NO QUEDAN RANURAS": "СЛОТЫ ЗАНЯТЫ",
		"Todas las ranuras tienen carrera. Cuelga esta placa en el SALÓN DE LA FAMA o borra una desde AJUSTES para empezar otra.": "Все слоты заняты. Повесь эту табличку в ЗАЛЕ СЛАВЫ или удали одну карьеру в НАСТРОЙКАХ, чтобы начать новую.",
		"ELEGIR CARRERA": "ВЫБОР КАРЬЕРЫ",
		"Tres carreras, cada una con su propia partida.":
			"Три карьеры, у каждой свое сохранение.",
		"RETIRADO · {0} PARTIDOS · {1} GOLES": "ЗАВЕРШИЛ · МАТЧЕЙ: {0} · ГОЛОВ: {1}",
		"RETIRADO · {0} PARTIDOS": "ЗАВЕРШИЛ · МАТЧЕЙ: {0}",
		"MANTÉN PULSADO PARA BORRAR": "ЗАЖМИ, ЧТОБЫ УДАЛИТЬ",
		"TEMPORADA {0} · {1} AÑOS · {2} PJ": "СЕЗОН {0} · ВОЗРАСТ {1} · МАТЧИ {2}",
		"¿BORRAR ESTA CARRERA?": "УДАЛИТЬ ЭТУ КАРЬЕРУ?",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.\nLas otras dos"
		+ " no se tocan.":
			"Карьера игрока {0} будет потеряна: уровень, деньги, контракт и трофеи.\nДве другие не пострадают.",
		"TU JUGADOR": "ТВОЙ ИГРОК",
		"TU CLUB · SE CAMBIA EN EL MERCADO": "ТВОЙ КЛУБ · МЕНЯЕТСЯ НА РЫНКЕ",
		"Se guarda solo.": "Сохраняется автоматически.",
		"GUARDAR": "СОХРАНИТЬ",

		"¡Peina {0}!": "{0} продлевает головой!",
		"¡La peina!": "Продлил головой!",
		"¡Cambio de banda!": "Перевод на другой фланг!",
		"Te quedaste con la salida corta": "Ты выбрал короткий пас",
		"El pase no llegó": "Пас не дошел",
		"¡Saliste jugando!": "Ты выбрался из-под прессинга!",
		"Te encerraron": "Тебя заперли",
		"Toca a tu jugador para empezar": "Нажми на своего игрока, чтобы начать",
		"Te frenaron con falta": "Тебя остановили фолом",
		"¡El perro cortó la jugada!": "Собака прервала атаку!",

		"El rival se repliega": "Соперник отходит назад",
		"Falta en tu campo: se reanuda": "Фол на твоей половине: игра возобновляется",

		"SAL JUGANDO": "РОЗЫГРЫШ СЗАДИ",

		"¡DE PRIMERA! PASE DE {0}": "В ОДНО КАСАНИЕ! ПАС: {0}",
		"¡DE PRIMERA! TE LA PONEN": "В ОДНО КАСАНИЕ! ТЕБЕ ПАСУЮТ",
		"¡CABEZAZO! TE LA CUELGAN": "УДАР ГОЛОВОЙ! НАВЕС НА ТЕБЯ",
		"¡CABEZAZO! CENTRO DE {0}": "УДАР ГОЛОВОЙ! НАВЕС: {0}",
		"¡VOLEA! TE LA CUELGAN": "С ЛЕТА! НАВЕС НА ТЕБЯ",
		"¡VOLEA! CENTRO DE {0}": "С ЛЕТА! НАВЕС: {0}",
		"¡CHILENA! TE LA CUELGAN": "ЧЕРЕЗ СЕБЯ! НАВЕС НА ТЕБЯ",
		"¡CHILENA! CENTRO DE {0}": "ЧЕРЕЗ СЕБЯ! НАВЕС: {0}",
		"¡CÓRNER! TE LA CUELGAN": "УГЛОВОЙ! НАВЕС НА ТЕБЯ",
		"¡CÓRNER! LO SACA {0}": "УГЛОВОЙ! ПОДАЕТ {0}",
		"¡FALTA! TE LA CUELGAN": "ШТРАФНОЙ! НАВЕС НА ТЕБЯ",
		"¡FALTA! LA CUELGA {0}": "ШТРАФНОЙ! ПОДАЕТ {0}",

		"Salida de meta": "Удар от ворот",
		"Sacas de meta con tu portero: juégala en corto o revienta el pase largo. Luego juegas con quien la recibe.": "Бьешь от ворот своим вратарем: разыграй коротко или запусти длинный пас. Потом играешь за того, кто примет мяч.",
		"Apunta a un compañero y suelta": "Прицелься в партнера и отпусти",
		"SALIDA DE META": "УДАР ОТ ВОРОТ",
		"Te cortaron el pase": "Твой пас перехватили",
		"PASE CORTADO": "ПЕРЕХВАТ",

		"Salida jugada": "Розыгрыш сзади",
		"Naces en tu campo con el balón. Conduce, pásala y avanza: cada pase lo golpeas tú y juegas con quien la recibe.": "Начинаешь на своей половине с мячом. Веди, пасуй и продвигайся: каждый пас бьешь сам и играешь за того, кто его принял.",
		"Arrastra para conducir; apunta a un compañero y suelta": "Тяни, чтобы вести мяч; прицелься в партнера и отпусти",
		"Saque de banda corto": "Короткий аут",
		"Saque de banda al área": "Аут в штрафную",
		"Te la sacan de banda al área. No se controla: espera a que llegue y cabecea a puerta.": "Тебе вбрасывают аут в штрафную. Мяч не обработать: дождись его и бей головой в ворота.",
		"Espera el saque; luego jala y suelta": "Жди вброса; потом тяни и отпускай",
		"Un compañero te la saca de banda: la controlas solo y juegas libre. Regatea, tira o devuélvesela.": "Партнер вбрасывает тебе аут: ты принимаешь мяч автоматически и играешь свободно. Обводи, бей или отдай обратно.",
		"¡SAQUE DE BANDA!": "АУТ!",
		"¡{0} SACA DE BANDA!": "{0} ВБРАСЫВАЕТ!",
		"Naces en tu campo con el balón y el arco lejos. Conduce, pásala a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "Начинаешь на своей половине с мячом, ворота далеко. Веди мяч, отдай пас партнеру и двигайся дальше: пас бьется как удар, и ты играешь за того, кто его принял. Застрянешь сзади без продвижения — соперник усилит прессинг. Потом — один на один: бей сразу или веди мяч и вернись в круг, чтобы резко остановиться и спокойно прицелиться.",
		"Primero sal jugando desde tu campo: conduce, pasa y llega hasta el arco. Después, el mano a mano: 1 gol en 3 intentos.": "Сначала выйди из обороны: веди, пасуй и доберись до ворот. Потом — один на один: 1 гол с 3 попыток.",
		"Pásala a un compañero y avanza hacia el arco.": "Отдай пас партнеру и продвигайся к воротам.",
		"PASA Y AVANZA": "ОТДАЙ И БЕГИ",
		"ATAJADA": "СЕЙВ",
		"DESPEJE": "ВЫНОС",
		"FUERA DE JUEGO": "ОФСАЙД",
		"BALÓN PERDIDO": "ПОТЕРЯ МЯЧА",


		"TE RESBALASTE": "ПОСКОЛЬЗНУЛСЯ",
		"SIN CONTACTO": "МИМО МЯЧА",
		"CAMBIO DE BANDA": "СМЕНА ФЛАНГА",
		"PASE FALLADO": "НЕТОЧНЫЙ ПАС",
		"SALIDA LIMPIA": "ЧИСТЫЙ ВЫХОД",
		"TOCA PARA SALIR": "НАЖМИ И ВЫХОДИ",
		"ENCERRADO": "ЗАПЕРТ",
		"FALTA AL SALIR": "ФОЛ НА ВЫХОДЕ",
		"LA COBRA OTRO": "БЬЕТ ПАРТНЕР",
		"¡PRÓRROGA! Dos tiempos de 15 minutos.": "ДОП. ВРЕМЯ! Два тайма по 15 минут.",
		"Fin del primer tiempo extra.": "Первый дополнительный тайм окончен.",
		"¡TE TOCA A TI!": "ТВОЙ ХОД!",
		"Cobra tu compañero…": "Бьет твой партнер…",
		"Cobra el rival…": "Бьет соперник…",
		"Cobra {0}…": "Бьет {0}…",
		"Arrastra hacia atrás para correr · lleva el balón a la zona roja":
			"Тяни назад, чтобы бежать · доведи мяч до красной зоны",
		"Arrastra hacia atrás para correr · cruza al campo rival":
			"Тяни назад, чтобы бежать · перейди на половину соперника",
		"CAMPO RIVAL · TIRA O PASA": "ЧУЖАЯ ПОЛОВИНА · БЕЙ ИЛИ ПАСУЙ",
		"CAMPO RIVAL · TIRA": "ЧУЖАЯ ПОЛОВИНА · БЕЙ",


		"LLEVA EL BALON AL DISCO ROJO": "ДОВЕДИ МЯЧ ДО КРАСНОГО ДИСКА",




		"AL DISCO ROJO": "К КРАСНОМУ ДИСКУ",
		"RASA Y LENTA": "НИЗКО И ТИХО",
		"SUBE Y CAE": "ВВЕРХ И ВНИЗ",
		"COMBA": "ДУГА",
		"EL CENTRO PEGA MAS FUERTE": "УДАР ПО ЦЕНТРУ СИЛЬНЕЕ",
		"DENTRO TIRAS / FUERA REGATEAS": "ВНУТРИ БЬЕШЬ / СНАРУЖИ ВЕДЕШЬ",
		"IZQUIERDO CONDUCE / DERECHO TIRA": "ЛЕВЫЙ ВЕДЕТ / ПРАВЫЙ БЬЕТ",
		"PASALA": "ПАСУЙ",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: un toque en el pasto, fuera de tu círculo y sin nadie debajo, gira la vista a la banda y te enseña a los compañeros; otro toque y vuelve.":
			"Кнопки паса нет: пас — это УДАР в сторону партнера, и мяч достается тому, кто успеет первым. Партнеров двое: один за пределами штрафной, другой в ней. Если пас приходит за пределы штрафной, дальше играешь за того, кто его принял. Если в штрафную — обработки не будет: он бьет с ходу. А чтобы их увидеть, нажми на газон вне своего круга, там, где никого нет, — камера повернется к бровке и покажет партнеров; еще одно нажатие — и она вернется.",
		"Un pase de práctica. Después, 1 gol en 3 pases al área.": "Один пробный пас. Потом — 1 гол с 3 передач в штрафную.",
		"El primero no puntúa. En los otros, cuantos menos intentos gastes, más estrellas.": "Первый не идет в зачет. В остальных: чем меньше попыток, тем больше звезд.",
		"Apunta a un compañero y suelta.": "Прицелься в партнера и отпусти.",
		"FUERA LO JUEGAS TU / DENTRO REMATA": "СНАРУЖИ ИГРАЕШЬ ТЫ / ВНУТРИ БЬЕТ ОН",
		"SE ACABO EL REGATE": "ДРИБЛИНГ ОКОНЧЕН",
		"Ahora aprendes a TIRAR": "Теперь учишься БИТЬ",
		"LO TIENES": "ЕСТЬ!",
		"NO SUPERASTE LA PRUEBA": "ЗАДАНИЕ НЕ ВЫПОЛНЕНО",
		"OTRA VEZ": "ЕЩЕ РАЗ",
		"Aquí no se avanza hasta que te sale. Tómate el tiempo que necesites.": "Дальше не пройдешь, пока не получится. Не торопись.",
		"Eso es la escuela: cada ejercicio te enseña un gesto y te paga en estrellas. Quedan unos pocos, y sacan mejores ofertas de club.": "Это школа: каждое упражнение учит тебя новому приему и платит звездами. Осталось немного, и они приносят клубные предложения получше.",
		"PARA EN SECO Y APUNTA": "ЗАМРИ И ЦЕЛЬСЯ",
		"BUSCA LA OTRA BANDA": "ИЩИ ДАЛЬНИЙ ФЛАНГ",
		"Todo se decide en tu círculo: con el dedo DENTRO apuntas y tiras, y en cuanto lo sacas conduces. Es el mismo arrastre sin levantar el dedo: mira la palabra del círculo, que dice TIRO o REGATE según dónde estés. Volver a entrar te para en seco y te devuelve la puntería. Jala hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltar, toca el balón — y dónde lo tocas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro. Con dos dedos giras la vista y apuntas desde otro ángulo.":
			"Все решается в твоем круге: палец ВНУТРИ — целишься и бьешь, вывел его наружу — ведешь мяч. Это одно и то же движение, не отрывая пальца: смотри на слово в круге — там написано УДАР или ДРИБЛИНГ, смотря где ты. Вернешься внутрь — резко остановишься и снова сможешь целиться. Оттяни назад, как резинку рогатки: направляющая указывает вперед. Отпустив, коснись мяча — и место касания решает все. В первый раз мяч раскрашен по зонам: сверху — низом и медленно, снизу — вверх с падением, по бокам — дугой. И чем ближе к краю, тем слабее удар: настоящая пушка — из центра. Двумя пальцами поворачиваешь камеру и целишься с другого угла.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "Это НАВЕСЫ: мяч подается в штрафную. На угловом он сразу в режиме НАВЕС — это видно по индикатору справа вверху. Чтобы переключаться между НАВЕСОМ (верхом) и УДАРОМ (низом), нажми вторым пальцем, пока целишься, или на сам индикатор. Ищи голову партнера, а не ворота. А в конце — смена фланга: та же подача, но на свободного партнера на дальнем фланге.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve el cambio de banda.": "Забей 1 гол с 6 попыток: 3 угловых и 3 навеса. И выполни смену фланга.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. El cambio de banda es ensayo y no puntúa.": "Гол может прийти с любой из шести. Чем раньше, тем больше звезд. Смена фланга — тренировочная и в зачет не идет.",
		"METE DOS GOLES": "ЗАБЕЙ ДВА ГОЛА",
		"CRUZA Y ENCARA": "ПЕРЕЙДИ И ОБЫГРАЙ",
		"CUELGALA AL AREA": "НАВЕС В ШТРАФНУЮ",
		"SALVA LA BARRERA": "ЧЕРЕЗ СТЕНКУ",
		"REGATEA HASTA EL MEDIO CAMPO": "ДОВЕДИ ДО ЦЕНТРА ПОЛЯ",


		"Salir de atrás": "Выход из обороны",
		"Encerrado en tu banda": "Зажат у бровки",
		"Atrapado en el medio": "Зажат в центре поля",
		"Contra el bloque": "Против плотной обороны",
		"Te salta el delantero": "Нападающий идет в прессинг",
		"Desde tu área": "Из своей штрафной",
		"ZONA {0} DE {1}": "ЗОНА {0} ИЗ {1}",
		"Busca al compañero de la otra banda · dentro del círculo pasas":
			"Найди партнера на дальнем фланге · внутри круга — пас",
		"El video salió con un tamaño raro": "Видео получилось странного размера",
		"Tu gol más lejano del año: {0} m.": "Твой самый дальний гол за год: {0} м.",
		"Tu pase más largo del año: {0} m.": "Твой самый длинный пас за год: {0} м.",
		"BUSCAR CLUB O JUGADOR": "НАЙТИ КЛУБ ИЛИ ИГРОКА",
		"Escribe al menos dos letras para buscar.": "Введи хотя бы две буквы для поиска.",
		"Nada encaja con esa búsqueda.": "Ничего не найдено.",
		"{0} · {1} DE {2} — AFINA LA BUSQUEDA": "{0} · {1} ИЗ {2} — УТОЧНИ ПОИСК",
		"PAIS": "СТРАНА",
		"SI": "ДА",
		"PIDE ALIENTO": "ЗАВЕДИ ТРИБУНЫ",
		"A LO TUYO": "СОБЕРИСЬ",
		"RUGE {0} % · PITA {1} %": "РЕВ {0} % · СВИСТ {1} %",
		"LA GRADA RUGE": "ТРИБУНЫ РЕВУТ",
		"PIDES ALIENTO Y LA GRADA RUGE": "ТЫ ЗАВОДИШЬ ТРИБУНЫ — ОНИ РЕВУТ",
		"PIDES ALIENTO Y LA GRADA TE PITA": "ЗАВОДИШЬ ТРИБУНЫ, А ОНИ СВИСТЯТ",
		"¡{0}, {0}!": "{0}! {0}!",
		"¡{0}, TRAIDOR!": "{0} — ИУДА!",
		"La entrada": "Подкат",
		"Toca cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "Нажми, когда метка будет на белом: идешь в подкат и чисто отбираешь мяч. На красном — фол; на желтом — тебе покажут карточку.",
		"Toca en el blanco para barrerte": "Нажми на белом, чтобы пойти в подкат",
		"¡BALÓN LIMPIO!": "ЧИСТЫЙ ОТБОР!",
		"¡AMARILLA!": "ЖЕЛТАЯ!",
		"¡SE TE VA!": "УШЕЛ!",
		"La barrera tapa el camino raso: elévalo por encima pegándole al balón abajo. El costado lo curva, si te atreves. Y el examen final: el penal. Respira. Tú eliges la esquina.": "Стенка закрывает путь низом: подними мяч над ней, ударив по нему снизу. Удар сбоку закрутит мяч, если рискнешь. И выпускной экзамен — пенальти. Дыши. Угол выбираешь ты.",
		"WASD CONDUCE / FLECHAS TIRAN": "WASD ВЕДЕТ / СТРЕЛКИ БЬЮТ",
		"Pulsa WASD y corres hacia el disco.": "Нажми WASD — и бежишь к диску.",
		"Pulsa WASD y conduces.": "Нажми WASD — и ведешь мяч.",
		"Mantén una flecha y apuntas.": "Зажми стрелку — и целишься.",
		"Pulsa WASD y conduces: cruza la raya.": "Нажми WASD и веди мяч: пересеки линию.",
		"Pulsa WASD y avanza hacia el arco.": "Нажми WASD и иди к воротам.",
		"Mantén una flecha y pásala a un compañero.": "Зажми стрелку и отдай пас партнеру.",
		"Mantén una flecha y suelta para pegarle a la falta.": "Зажми стрелку и отпусти, чтобы пробить штрафной.",
		"Pulsa WASD para empezar": "Нажми WASD, чтобы начать",
		"WASD para correr · cruza al campo rival": "WASD — бег · перейди на половину соперника",
		"WASD para correr · lleva el balón a la zona roja": "WASD — бег · доведи мяч до красной зоны",
		"Pulsa {0} en el blanco para barrerte": "Нажми {0} на белом, чтобы пойти в подкат",
		"PULSA WASD PARA SALIR": "НАЖМИ WASD И ВЫХОДИ",
		"Pulsa {0} cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "Нажми {0}, когда метка будет на белом: идешь в подкат и чисто отбираешь мяч. На красном — фол; на желтом — тебе покажут карточку.",
		"VOLVIO, Y SE FUE POR LA PUERTA DE ATRAS": "ВЕРНУЛСЯ — И УШЕЛ ЧЕРЕЗ ЧЕРНЫЙ ХОД",
		"LA VUELTA": "КАМБЭК",
		"Bota de Oro de Europa": "Лучший бомбардир Европы",
		"BOTA DE ORO DE EUROPA": "БОМБАРДИР ЕВРОПЫ",
		"Máximo Asistente del Mundial": "Лучший ассистент мундиаля",
		"Máximo Asistente de la Copa continental": "Лучший ассистент континентального турнира",
		"Asist. (Mundial)": "Ассист. (ЧМ)",
		"Asist. (Continental)": "Ассист. (конт.)",
		"ASISTENTE DEL MUNDIAL": "ЛУЧШИЙ АССИСТЕНТ МУНДИАЛЯ",
		"Once Ideal de la Liga": "Символическая сборная лиги",
		"Once Ideal": "Символическая сборная",
		"Bota de Oro (Europa)": "Лучший бомбардир (Европа)",
		"Prometiste un gol, y lo metiste.": "Ты пообещал гол — и забил.",
		"Prometiste un gol. Hoy no llegó.": "Ты пообещал гол. Сегодня не вышло.",
		"Cumpliste tu promesa de gol ante el {0}": "Ты сдержал обещание забить. Соперник: {0}",
		"Prometiste un gol ante el {0} y no llegó": "Обещанный гол так и не случился. Соперник: {0}",
		"{0} cumplió su promesa de gol ante el {1}": "{0} сдержал обещание забить. Соперник: {1}",
		"{0} prometió un gol ante el {1} y no llegó": "{0} обещал гол, но не забил. Соперник: {1}",
		"DIBUJO DEL SHORT": "УЗОР ШОРТ",
		"Acento del short": "Отделка шорт",
		"DIBUJO DE LAS MEDIAS": "УЗОР ГЕТР",
		"Acento de las medias": "Отделка гетр",
		"Cuello polo": "Воротник-поло",
		"Fin de manga": "Манжеты",
		"FILO": "КАНТ",
		"DOBLE FILO": "ДВОЙНОЙ КАНТ",
		"RIBETE": "КАЙМА",
		"FILO Y RIBETE": "КАНТ И КАЙМА",
		"PANEL": "ВСТАВКА",
		"ABERTURA": "РАЗРЕЗ",
		"VUELTA FINA": "ТОНКИЙ ВЕРХ",
		"DOBLE VUELTA": "ДВОЙНОЙ ВЕРХ",
		"DOS RAYAS": "ДВЕ ПОЛОСЫ",
		"RAYA ALTA": "ПОЛОСА ВВЕРХУ",
		"BANDA ANCHA": "ШИРОКИЙ ПОЯС",
		"AROS ANCHOS": "ШИРОКИЕ ПОЯСА",
		"VUELTA DE COLOR": "ЦВЕТНОЙ ВЕРХ",
		"FRANJA": "ЛЕНТА",
		"DOS FRANJAS": "ДВЕ ЛЕНТЫ",
		"SHORT, MEDIAS Y CUELLO": "ШОРТЫ, ГЕТРЫ И ВОРОТНИК",
		"PICA CUANDO SE CIERRE": "НАЖМИ, КАК СОМКНЕТСЯ",
		"¡CAÑO!": "КАЛИТКА!",
		"SE LO OLIÓ": "РАСКУСИЛ",
		"YA ESTÁ EN SU HUECO": "НА СВОЕМ МЕСТЕ",
		"EN TU VITRINA": "В ТВОЕЙ ВИТРИНЕ",
		"TODAVÍA SE HABLA DEL CAÑO DE {0} A {1}": "ВСЕ ЕЩЕ ГОВОРЯТ О КАЛИТКЕ: {0} — {1}",
		"{1} YA NO SE LE ACERCA TANTO A {0} TRAS EL CAÑO": "{1} ДЕРЖИТ ДИСТАНЦИЮ: {0} ЕГО УЖЕ ПРОКИНУЛ",
		"LA GRADA PIDE OTRO CAÑO DE {0}": "ТРИБУНЫ ПРОСЯТ ЕЩЕ КАЛИТКУ. {0}, ДАВАЙ!",
		"{1} LE LEYÓ EL CAÑO A {0} Y NO SE LO PERDONA": "{0} ХОТЕЛ В КАЛИТКУ, {1} РАСКУСИЛ И НЕ ДАЕТ ЗАБЫТЬ",
		"{0} QUISO EL CAÑO Y LA GRADA AÚN SILBA": "{0} НЕ ПРОКИНУЛ В КАЛИТКУ, ТРИБУНЫ ЕЩЕ СВИСТЯТ",
		"PRESENTACIÓN DEL TÍTULO": "ЧЕСТВОВАНИЕ ЧЕМПИОНА",
		"ANTE TU AFICIÓN": "ПЕРЕД СВОЕЙ ПУБЛИКОЙ",
		"JUEGOS DE VERANO": "ЛЕТНИЕ ИГРЫ",
		"Campeón de Verano": "Чемпион Летних игр",
		"Oro de Verano": "Золото Летних игр",
		"Ganar el oro en los Juegos de Verano.": "Выиграть золото Летних игр.",
		"JUEGOS DE VERANO: oro para {0}": "ЛЕТНИЕ ИГРЫ: золото — {0}",
		"{0}: ORO en los Juegos de Verano": "{0}: ЗОЛОТО Летних игр",
		"{0}: plata en los Juegos de Verano": "{0}: серебро Летних игр",
		"{0}: bronce en los Juegos de Verano": "{0}: бронза Летних игр",
		"El juego no trae nombres, escudos ni marcas reales. Importa sólo lo que tengas derecho a usar: es responsabilidad tuya.": "В игре нет реальных имен, гербов и брендов. Импортируй только то, что имеешь право использовать: это твоя ответственность.",
		"¡El recogepelotas hace tiempo!": "Мальчик, подающий мячи, тянет время!",
		"¡BALÓN LARGO!": "ДЛИННЫЙ ПАС!",
		"¡{0} TE LA CUELGA!": "{0} ПОДАЕТ НА ТЕБЯ!",
		"¡CONTROLADA!": "ПРИНЯЛ!",
		"Primas por premios": "Бонусы за награды",
		"Prima de firma": "Бонус за подпись",
		"+${0} DE PRIMA": "+${0} БОНУС",
		"SI EL CLUB CUMPLE": "ЕСЛИ КЛУБ СМОЖЕТ",
		"GUARDANDO EN TU ALBUM...": "СОХРАНЯЮ В АЛЬБОМ...",
		"EN TU ALBUM · %d/%d": "В АЛЬБОМЕ · %d/%d",
		"ALBUM LLENO %d/%d · BORRA UNO EN COLECCION": "АЛЬБОМ ПОЛОН %d/%d · УДАЛИ ГОЛ В КОЛЛЕКЦИИ",
		"SIN ESPACIO EN EL TELEFONO": "НЕТ МЕСТА В ТЕЛЕФОНЕ",
		"NO SE PUDO GUARDAR · TOCA PARA REINTENTAR": "ОШИБКА · НАЖМИ ЕЩЕ РАЗ",
		"¡Se queda corto!": "Не долетел!",
		"Cosechas del huerto": "Урожай с огорода",
		"PLANTILLAS DE COMUNIDAD": "СОСТАВЫ СООБЩЕСТВА",
		"Packs que hace la gente. Cada uno vive en la web de quien lo hizo.": "Паки, которые делают игроки. Каждый лежит на сайте своего автора.",
		"BUSCAR PACK O CREADOR": "ПОИСК ПАКА/АВТОРА",
		"BÁJALO": "СКАЧАЙ",
		"en su web": "на сайте автора",
		"TÓCALO": "НАЖМИ",
		"en Descargas": "в Загрузках",
		"IMPORTA": "ИМПОРТ",
		"se abre en el juego": "откроется в игре",
		"CARGANDO": "ЗАГРУЗКА",
		"TODAVÍA NO HAY": "ПОКА ПУСТО",
		"Cuando alguien comparta un pack, sale aquí.": "Когда кто-нибудь поделится паком, он появится здесь.",
		"Conéctate a internet para ver la lista.": "Подключись к интернету, чтобы увидеть список.",
		"REINTENTAR": "ЕЩЕ РАЗ",
		"¡ROMPISTE UNA CUERDA DE LA RED!": "ТЫ ПОРВАЛ ТРОС СЕТКИ!",
		"¡LAS DOS CUERDAS DE LA RED!": "ОБА ТРОСА СЕТКИ!",
		"¡El staff arregla la red!": "Персонал чинит сетку!",
	},







	"sim": {




		"simFINAL DEL PARTIDO": "КОНЕЦ МАТЧА",
		"simDESCANSO": "ПЕРЕРЫВ",
		"simGOOOL": "ГОООЛ",
		"simGOLAZO": "СУПЕРГОЛ",
		"simGOLES": "ГОЛЫ",
		"simGOL": "ГОЛ",
		"simASISTENCIA": "АССИСТ",
		"simASISTE": "АССИСТ",
		"simATAJADÓN": "КАКОЙ СЕЙВ",
		"simPARADA": "СЕЙВ",
		"simPOSTE": "ШТАНГА",
		"simTRAVESAÑO": "ПЕРЕКЛАДИНА",
		"simCABECEA": "ГОЛОВОЙ",
		"simREMATA": "БЬЕТ",
		"simREMATE": "УДАР",
		"simDISPARO": "УДАР",
		"simCÓRNER": "УГЛОВОЙ",
		"simPENAL": "ПЕНАЛЬТИ",
		"simENTRA": "НА ПОЛЕ",
		"simCAMBIO": "ЗАМЕНА",
		"simTIRO LIBRE": "ШТРАФНОЙ",
		"simFUERA DE JUEGO": "ОФСАЙД",
		"simAMARILLA": "ЖЕЛТАЯ",
		"simROJA": "УДАЛЕН",
		"simEXPULSADO": "УДАЛЕН",
		"simLESIÓN": "ТРАВМА",
		"simLESIONADO": "ТРАВМА",
		"simFALTA": "ФОЛ",
		"simPÉRDIDA": "ПОТЕРЯ",
		"¡GOL DE {0}!": "ГОЛ — {0}!",
		"ASISTE {0}": "АССИСТ: {0}",
		"DESCANSO": "ПЕРЕРЫВ",
		"FINAL DEL PARTIDO": "КОНЕЦ МАТЧА",
		"TOQUE EN EL MEDIO CAMPO": "ПЕРЕПАСОВКА В ЦЕНТРЕ ПОЛЯ",
		"TU EQUIPO CONTROLA EL BALÓN": "ТВОЯ КОМАНДА ДЕРЖИТ МЯЧ",
		"EL RIVAL PRESIONA ARRIBA": "СОПЕРНИК ЖМЕТ ВЫСОКО",
		"FALTA EN MEDIA CANCHA": "ФОЛ В ЦЕНТРЕ ПОЛЯ",
		"SAQUE DE BANDA": "АУТ",
		"LA AFICIÓN ANIMA": "БОЛЕЛЬЩИКИ ПОДДЕРЖИВАЮТ",
		"DUELO FÍSICO EN EL CENTRO": "СИЛОВАЯ БОРЬБА В ЦЕНТРЕ",
		"EL ÁRBITRO DEJA SEGUIR": "СУДЬЯ ДАЕТ ПРЕИМУЩЕСТВО",
		"PASES EN CORTO, SIN PRISA": "КОРОТКИЕ ПАСЫ, БЕЗ СПЕШКИ",
		"CÓRNER SIN REMATE CLARO": "УГЛОВОЙ ВПУСТУЮ",
		"FUERA DE JUEGO SEÑALADO": "ЗАФИКСИРОВАН ОФСАЙД",
		"BALÓN LARGO SIN DUEÑO": "ДЛИННЫЙ ПАС В НИКУДА",
		"TU DEFENSA CORTA EL AVANCE": "ТВОЯ ЗАЩИТА ГАСИТ АТАКУ",
		"EL PORTERO ACHICA A TIEMPO": "ВРАТАРЬ ВОВРЕМЯ СОКРАЩАЕТ УГОЛ",
		"CAMBIO DE ORIENTACIÓN AL OTRO COSTADO": "ПЕРЕВОД НА ДРУГОЙ ФЛАНГ",
		"PRESIÓN TRAS PÉRDIDA EN CAMPO RIVAL": "КОНТРПРЕССИНГ НА ЧУЖОЙ ПОЛОВИНЕ",
		"EL BALÓN NO QUIERE ENTRAR EN EL ÁREA": "МЯЧ НИКАК НЕ ДОХОДИТ ДО ШТРАФНОЙ",
		"AMARILLA POR CORTAR EL CONTRA": "ЖЕЛТАЯ ЗА СРЫВ КОНТРАТАКИ",
		"LA GRADA PIDE MÁS RITMO": "ТРИБУНЫ ПРОСЯТ ПРИБАВИТЬ",
		"SE JUEGA A UN SOLO ARCO": "ИГРА В ОДНИ ВОРОТА",
		"PARADO EL JUEGO POR UN GOLPE": "ИГРА СТОИТ: СТОЛКНОВЕНИЕ",
		"BUEN RELEVO EN LA BANDA": "ХОРОШАЯ СТРАХОВКА НА ФЛАНГЕ",
		"CENTRO PASADO, NO HABÍA NADIE": "НАВЕС ПРОЛЕТАЕТ — В ШТРАФНОЙ НИКОГО",
		"EL MEDIOCAMPO SE PARTE EN DOS": "ЦЕНТР ПОЛЯ РАСКОЛОТ НАДВОЕ",
		"CÓRNER BOTADO EN CORTO": "УГЛОВОЙ НАКОРОТКО",
		"FALTA AL BORDE DEL ÁREA, SE ARMA LA BARRERA": "ФОЛ У ШТРАФНОЙ, ВЫСТРАИВАЕТСЯ СТЕНКА",
		"EL ÁRBITRO MIDE LOS NUEVE METROS": "СУДЬЯ ОТМЕРЯЕТ ДЕВЯТЬ МЕТРОВ",
		"SAQUE DE ESQUINA QUE DESPEJA EL PRIMER PALO": "ПОСЛЕ УГЛОВОГО ВЫНОС У БЛИЖНЕЙ ШТАНГИ",
		"TIRO LIBRE LEJANO QUE SE VA A LA GRADA": "ДАЛЬНИЙ ШТРАФНОЙ — НА ТРИБУНУ",
		"SAQUE DE PUERTA LARGO, A DISPUTAR": "ДЛИННЫЙ ОТ ВОРОТ, БОРЬБА ЗА МЯЧ",
		"SEGUNDA JUGADA DEL CÓRNER, RECHAZA LA ZAGA": "ПОДБОР ПОСЛЕ УГЛОВОГО, ЗАЩИТА ВЫНОСИТ",
		"SAQUE DE BANDA LARGO AL ÁREA": "ДЛИННЫЙ АУТ В ШТРАФНУЮ",
		"ROBO EN TRES CUARTOS Y VUELTA A EMPEZAR": "ОТБОР НА ЧУЖОЙ ТРЕТИ, И ВСЕ ЗАНОВО",
		"DOS HOMBRES AL BALÓN, NO LO DEJAN SALIR": "ДВОЕ НА МЯЧЕ, ВЫХОДА НЕТ",
		"LA ZAGA SE JUNTA Y CIERRA EL PASILLO": "ЗАЩИТА СЖИМАЕТСЯ И ЗАКРЫВАЕТ КОРИДОР",
		"DESPEJE LARGO PARA QUITARSE EL AGOBIO": "ДЛИННЫЙ ВЫНОС, ЧТОБЫ ПЕРЕДОХНУТЬ",
		"RUEDA EL BALÓN DE LADO A LADO": "МЯЧ ХОДИТ ОТ ФЛАНГА К ФЛАНГУ",
		"PAREDES EN EL CENTRO DEL CAMPO": "ИГРА В СТЕНКУ В ЦЕНТРЕ ПОЛЯ",
		"CONTRA A CAMPO ABIERTO QUE SE QUEDA EN NADA": "КОНТРАТАКА ПО ПУСТОМУ ПОЛЮ ЗАХЛЕБНУЛАСЬ",
		"TODOS CORREN, NADIE PIENSA": "ВСЕ БЕГАЮТ, НИКТО НЕ ДУМАЕТ",
		"EL RITMO BAJA Y EL PARTIDO SE ADORMECE": "ТЕМП ПАДАЕТ, МАТЧ ЗАСЫПАЕТ",
		"SE JUEGA CON EL FRENO DE MANO": "ИГРАЮТ НА РУЧНИКЕ",
		"PIDE EL CAMBIO UN JUGADOR TOCADO": "ИГРОК С УШИБОМ ПРОСИТ ЗАМЕНУ",
		"PROTESTAS AL LINIER DESDE EL BANQUILLO": "СКАМЕЙКА СПОРИТ С ЛАЙНСМЕНОМ",
		"APLAUDE LA GRADA UNA JUGADA DE OFICIO": "ТРИБУНЫ АПЛОДИРУЮТ ТОНКОЙ РАБОТЕ",
		"EL BALÓN SE VA AL FONDO SIN DUEÑO": "МЯЧ УХОДИТ ЗА ЛИЦЕВУЮ, НИКТО НЕ БЕЖИТ",
		"{0} REMATA FUERA POR POCO": "{0} БЬЕТ — ЧУТЬ МИМО",
		"¡{0} LA TUVO, GRAN PARADA!": "{0} МОГ ЗАБИТЬ! КАКОЙ СЕЙВ!",
		"{0} CABECEA ALTO": "{0} ГОЛОВОЙ — ВЫШЕ",
		"DISPARO DE {0}, ¡ATAJADÓN!": "БЬЕТ {0} — КАКОЙ СЕЙВ!",
		"{0} ESTRELLA EL POSTE": "{0} БЬЕТ — ШТАНГА!",
		"{0} REMATA DESVIADO": "{0} БЬЕТ МИМО ВОРОТ",


		"{0} DISPARA Y LO TAPA UN DEFENSA": "{0} БЬЕТ, ЗАЩИТНИК БЛОКИРУЕТ",
		"EL TIRO DE {0} TOCA EN UN DEFENSA Y SE VA A CÓRNER": "БЬЕТ {0}, МЯЧ ЗАДЕВАЕТ ЗАЩИТНИКА — УГЛОВОЙ",
		"TU DEFENSA SE TIRA Y TAPA EL DISPARO DE {0}": "БЬЕТ {0}, НО ТВОЙ ЗАЩИТНИК БРОСАЕТСЯ ПОД МЯЧ",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA, CÓRNER": "БЬЕТ {0}, РИКОШЕТ ОТ ТВОЕЙ ЗАЩИТЫ — УГЛОВОЙ",
		"¡GOL DE {0}! TOCA EN UN DEFENSA Y SE CUELA": "ГОЛ — {0}! РИКОШЕТ ОТ ЗАЩИТНИКА, И МЯЧ В СЕТКЕ",
		"¡{0} DISPARA, LA DESVÍA UN DEFENSA Y ADENTRO!": "{0} БЬЕТ, ЗАЩИТНИК МЕНЯЕТ ТРАЕКТОРИЮ — ГОЛ!",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA Y ENTRA": "БЬЕТ {0}, РИКОШЕТ ОТ ТВОЕЙ ЗАЩИТЫ — И В ВОРОТА",
		"¡AUTOGOL DE {0}!": "АВТОГОЛ: {0}!",
		"{0} LA METE EN SU PROPIA PUERTA": "{0} ЗАБИВАЕТ В СВОИ ВОРОТА",


		"¡{0} SE ELEVA Y LA CLAVA DE CABEZA!": "{0} ВЫШЕ ВСЕХ И ВКОЛАЧИВАЕТ ГОЛОВОЙ!",
		"¡CABEZAZO DE {0} AL FONDO DE LA RED!": "{0} ГОЛОВОЙ — ПРЯМО В СЕТКУ!",
		"¡{0} GANA ARRIBA Y NO PERDONA!": "{0} ВЫИГРЫВАЕТ ВЕРХ И НЕ ПРОЩАЕТ!",
		"¡{0} LA ENGANCHA DE VOLEA!": "{0} БЬЕТ С ЛЕТА — ГОЛ!",
		"¡{0} LA PRENDE AL AIRE Y ADENTRO!": "{0} С ЛЕТА — И МЯЧ В СЕТКЕ!",
		"¡SIN DEJARLA CAER! GOL DE {0}": "НЕ ДАЛ МЯЧУ УПАСТЬ! ГОЛ — {0}",
		"¡DE CHILENA! ¡{0}, INCREÍBLE!": "ЧЕРЕЗ СЕБЯ! {0}, НЕВЕРОЯТНО!",
		"¡CHILENA DE {0}! GOL PARA LA HISTORIA": "{0} ЧЕРЕЗ СЕБЯ! ГОЛ ДЛЯ ИСТОРИИ",
		"¡{0} DE CHILENA! ¡SE CAE EL ESTADIO!": "{0} ЧЕРЕЗ СЕБЯ! СТАДИОН ВЗРЫВАЕТСЯ!",
		"{0} CABECEA SOLO Y MARCA": "{0} ГОЛОВОЙ БЕЗ ОПЕКИ — ГОЛ",
		"LA VOLEA DE {0} SE CUELA": "{0} С ЛЕТА — МЯЧ В СЕТКЕ",
		"{0} MARCA DE CHILENA. QUÉ CASTIGO": "{0} ЗАБИВАЕТ ЧЕРЕЗ СЕБЯ. ЖЕСТОКО",
		"¡{0} CABECEA Y LA SACA EL PORTERO!": "{0} БЬЕТ ГОЛОВОЙ, ВРАТАРЬ ТАЩИТ!",
		"LA VOLEA DE {0} SE VA POR ENCIMA": "{0} С ЛЕТА — ВЫШЕ ВОРОТ",
		"{0} INTENTA LA CHILENA, ¡POR POCO!": "{0} ПРОБУЕТ ЧЕРЕЗ СЕБЯ — ЧУТЬ МИМО!",
		"CABEZAZO DE {0} AL POSTE": "{0} ГОЛОВОЙ — ШТАНГА!",
		"{0} LO PRUEBA DE VOLEA, DESVIADO": "{0} ПРОБУЕТ С ЛЕТА — МИМО",
		"TU EQUIPO REMATA FUERA": "ТВОЯ КОМАНДА БЬЕТ МИМО",
		"¡CASI GOL DE TU EQUIPO!": "ТВОИ ЧУТЬ НЕ ЗАБИЛИ!",
		"GRAN PARADA DEL PORTERO": "ОТЛИЧНЫЙ СЕЙВ ВРАТАРЯ",
		"DISPARO DEL RIVAL, ¡ATAJADÓN!": "УДАР СОПЕРНИКА — КАКОЙ СЕЙВ!",
		"EL RIVAL ESTRELLA EL POSTE": "СОПЕРНИК БЬЕТ — ШТАНГА!",
		"EL RIVAL REMATA FUERA": "СОПЕРНИК БЬЕТ МИМО",
		"CÓRNER PARA TU EQUIPO, LO CUELGA {0}": "УГЛОВОЙ У ТВОЕЙ КОМАНДЫ, ПОДАЕТ {0}",
		"FALTA PELIGROSA Y {0} SE PLANTA SOBRE EL BALÓN":
			"ОПАСНЫЙ ШТРАФНОЙ, К МЯЧУ ПОДХОДИТ {0}",
		"{0} SACA EL CÓRNER AL SEGUNDO PALO Y DESPEJA LA ZAGA":
			"{0} ПОДАЕТ УГЛОВОЙ НА ДАЛЬНЮЮ ШТАНГУ, ЗАЩИТА ВЫНОСИТ",
		"TIRO LIBRE DE {0}: LA BARRERA LA MANDA AL CÓRNER":
			"ШТРАФНОЙ БЬЕТ {0}: СТЕНКА ОТПРАВЛЯЕТ МЯЧ НА УГЛОВОЙ",
		"{0} LA COLGÓ AL ÁREA Y EL PORTERO LA ATRAPÓ EN EL AIRE":
			"{0} НАВЕШИВАЕТ В ШТРАФНУЮ, ВРАТАРЬ ЛОВИТ МЯЧ В ВОЗДУХЕ",
		"SAQUE DE BANDA LARGO DE {0} BUSCANDO EL SEGUNDO PALO":
			"{0} ВБРАСЫВАЕТ ДАЛЕКО, НА ДАЛЬНЮЮ ШТАНГУ",
		"FALTA LATERAL: {0} PONE EL CENTRO Y SE ARMA EL LÍO":
			"ШТРАФНОЙ С ФЛАНГА: {0} ПОДАЕТ, У ВОРОТ СВАЛКА",
		"CÓRNER EN CORTO ENTRE {0} Y SU COMPAÑERO":
			"УГЛОВОЙ РАЗЫГРЫВАЮТ КОРОТКО: {0} И ПАРТНЕР",
		"{0} ENSAYA UNA FALTA LEJANA Y SE VA ALTA":
			"{0} ПРОБУЕТ ДАЛЬНИЙ ШТРАФНОЙ — ВЫШЕ ВОРОТ",
		"OTRO CÓRNER: {0} VUELVE A COLGARLA AL ÁREA": "ЕЩЕ УГЛОВОЙ: {0} СНОВА НАВЕШИВАЕТ",
		"CÓRNER PARA EL RIVAL, LO SACA {0}": "УГЛОВОЙ У СОПЕРНИКА, ПОДАЕТ {0}",
		"FALTA AL BORDE DEL ÁREA, LA PONE {0}": "ФОЛ У САМОЙ ШТРАФНОЙ, БЬЕТ {0}",
		"{0} CUELGA EL CÓRNER Y TU DEFENSA DESPEJA DE CABEZA":
			"{0} ПОДАЕТ УГЛОВОЙ, ТВОЯ ЗАЩИТА ВЫНОСИТ ГОЛОВОЙ",
		"TIRO LIBRE DE {0} QUE SE ESTRELLA EN LA BARRERA":
			"ШТРАФНОЙ БЬЕТ {0} — ПРЯМО В СТЕНКУ",
		"{0} LA MANDA AL ÁREA Y TU PORTERO SALE A PUÑOS":
			"{0} НАВЕШИВАЕТ, ТВОЙ ВРАТАРЬ ОТБИВАЕТ КУЛАКАМИ",
		"SAQUE DE BANDA LARGO DE {0}, SIN CONSECUENCIAS":
			"{0} ДАЛЕКО ВБРАСЫВАЕТ, НО БЕЗ ПОСЛЕДСТВИЙ",
		"FALTA EN TRES CUARTOS: {0} ESPERA A QUE SUBAN LOS CENTRALES":
			"ШТРАФНОЙ НА ЧУЖОЙ ПОЛОВИНЕ: {0} ЖДЕТ ЦЕНТРАЛЬНЫХ ЗАЩИТНИКОВ",
		"{0} BOTA EL CÓRNER EN CORTO Y TU EQUIPO ACHICA":
			"{0} РАЗЫГРЫВАЕТ УГЛОВОЙ КОРОТКО, ТВОИ ВЫХОДЯТ ВПЕРЕД",
		"FALTA LEJANA DE {0} POR ENCIMA DEL TRAVESAÑO":
			"{0} БЬЕТ ДАЛЬНИЙ ШТРАФНОЙ — НАД ПЕРЕКЛАДИНОЙ",
		"OTRO CÓRNER RIVAL: {0} LO CUELGA AL PRIMER PALO":
			"ЕЩЕ УГЛОВОЙ У СОПЕРНИКА: {0} ПОДАЕТ НА БЛИЖНЮЮ",
		"CÓRNER PARA TU EQUIPO, DESPEJA LA ZAGA": "УГЛОВОЙ У ТВОЕЙ КОМАНДЫ, ЗАЩИТА ВЫНОСИТ",
		"FALTA PELIGROSA A FAVOR, SE ARMA LA BARRERA":
			"ОПАСНЫЙ ШТРАФНОЙ В ТВОЮ ПОЛЬЗУ, СТРОИТСЯ СТЕНКА",
		"TIRO LIBRE DE TU EQUIPO QUE SE VA ALTO": "ШТРАФНОЙ ТВОЕЙ КОМАНДЫ — ВЫШЕ ВОРОТ",
		"CÓRNER PARA EL RIVAL, DESPEJA TU DEFENSA":
			"УГЛОВОЙ У СОПЕРНИКА, ТВОЯ ЗАЩИТА ВЫНОСИТ",
		"FALTA PELIGROSA EN CONTRA, TU EQUIPO ARMA LA BARRERA":
			"ОПАСНЫЙ ШТРАФНОЙ У ТВОИХ ВОРОТ, СТРОИТСЯ СТЕНКА",
		"TIRO LIBRE DEL RIVAL A LAS MANOS DEL PORTERO":
			"ШТРАФНОЙ СОПЕРНИКА — ПРЯМО В РУКИ ВРАТАРЮ",

		"AMARILLA PARA {0} POR UNA ENTRADA TARDÍA": "ЖЕЛТАЯ: {0} — ЗА ПОЗДНИЙ ПОДКАТ",
		"EL ÁRBITRO AMONESTA A {0} POR PROTESTAR": "{0} ПОЛУЧАЕТ ЖЕЛТУЮ ЗА ПРОТЕСТЫ",
		"AMARILLA A {0} POR FRENAR EL CONTRA CON FALTA":
			"{0} СРЫВАЕТ КОНТРАТАКУ ФОЛОМ — ЖЕЛТАЯ",
		"AMARILLA PARA {0} POR UNA FALTA DURA": "ЖЕЛТАЯ: {0} — ЗА ГРУБЫЙ ФОЛ",
		"{0} VE LA AMARILLA POR PERDER TIEMPO": "{0} ПОЛУЧАЕТ ЖЕЛТУЮ ЗА ЗАТЯЖКУ ВРЕМЕНИ",
		"AMARILLA A {0} POR DERRIBAR AL EXTREMO": "ЖЕЛТАЯ: {0} — ЗА СНОС ФЛАНГОВОГО",
		"AMARILLA PARA TU EQUIPO": "ЖЕЛТАЯ ТВОЕЙ КОМАНДЕ",
		"AMARILLA PARA EL RIVAL": "ЖЕЛТАЯ СОПЕРНИКУ",
		"AMARILLA PARA {0}": "ЖЕЛТАЯ: {0}",
		"SEGUNDA AMARILLA PARA {0}": "ВТОРАЯ ЖЕЛТАЯ: {0}",
		"¡ROJA! {0} SE VA EXPULSADO": "КРАСНАЯ! {0} УДАЛЕН",
		"EL ÁRBITRO PERDONA A {0}": "{0} ИЗБЕГАЕТ КАРТОЧКИ",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA A TU EQUIPO CON DIEZ":
			"ВТОРАЯ ЖЕЛТАЯ — КРАСНАЯ! {0} УДАЛЕН, ТВОИ ВДЕСЯТЕРОМ",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA AL RIVAL CON DIEZ":
			"ВТОРАЯ ЖЕЛТАЯ — КРАСНАЯ! {0} УДАЛЕН, СОПЕРНИК ВДЕСЯТЕРОМ",
		"¡ROJA DIRECTA A {0}! TU EQUIPO SE QUEDA CON DIEZ":
			"ПРЯМАЯ КРАСНАЯ: {0}! ТВОЯ КОМАНДА ВДЕСЯТЕРОМ",
		"¡ROJA DIRECTA A {0}! EL RIVAL SE QUEDA CON DIEZ":
			"ПРЯМАЯ КРАСНАЯ: {0}! СОПЕРНИК ВДЕСЯТЕРОМ",
		"ROJA DIRECTA POR EL BALONAZO AL ÁRBITRO":
			"ПРЯМАЯ КРАСНАЯ ЗА УДАР МЯЧОМ В СУДЬЮ",
		"{0} SE MARCHA LESIONADO, NO PUEDE SEGUIR":
			"{0} УХОДИТ С ТРАВМОЙ, ПРОДОЛЖАТЬ НЕ МОЖЕТ",
		"LESIÓN EN EL RIVAL: {0} DEJA LA CANCHA": "ТРАВМА У СОПЕРНИКА: {0} ПОКИДАЕТ ПОЛЕ",
		"PARÓN POR LESIÓN, ENTRA LA CAMILLA": "ИГРА ОСТАНОВЛЕНА ИЗ-ЗА ТРАВМЫ, НА ПОЛЕ НОСИЛКИ",
		"BLOQUE BAJO Y SIN PRISA: EL PARTIDO SE JUEGA AL RALENTÍ":
			"НИЗКИЙ БЛОК БЕЗ СПЕШКИ: МАТЧ ИДЕТ НА ХОЛОСТЫХ",
		"TU EQUIPO CEDE EL BALÓN Y ESPERA AGAZAPADO":
			"ТВОЯ КОМАНДА ОТДАЕТ МЯЧ И ЖДЕТ В ЗАСАДЕ",
		"ONCE HOMBRES POR DETRÁS DE LA PELOTA, SIN GASTAR UNA GOTA":
			"ВСЕ ОДИННАДЦАТЬ ЗА МЯЧОМ, НИ КАПЛИ ЛИШНИХ СИЛ",
		"SE JUEGA A LO QUE QUIERE {0}, PERO NO ENTRA NADIE":
			"{0} ДИКТУЕТ, НО НИКТО НЕ ПРОХОДИТ",
		"CADA DESPEJE ES UN SEGUNDO MÁS QUE SE VA DEL RELOJ":
			"КАЖДЫЙ ВЫНОС — ЕЩЕ МИНУС СЕКУНДА",
		"EL BANQUILLO PIDE CALMA: NI UN PASO ADELANTE":
			"СКАМЕЙКА ПРОСИТ СПОКОЙСТВИЯ: НИ ШАГУ ВПЕРЕД",
		"MURO Y PACIENCIA, EL PLAN ES QUE NO PASE NADA":
			"СТЕНА И ТЕРПЕНИЕ: ПЛАН — ЧТОБЫ НИЧЕГО НЕ ПРОИЗОШЛО",
		"TU EQUIPO ADMINISTRA PIERNAS Y METROS ATRÁS":
			"ТВОИ БЕРЕГУТ НОГИ И СТЕРЕГУТ КАЖДЫЙ МЕТР",
		"REPLIEGUE ORDENADO, SIN SALIR A LA PRESIÓN":
			"ОРГАНИЗОВАННЫЙ ОТХОД, БЕЗ ВЫХОДА В ПРЕССИНГ",
		"{0} TOCA Y TOCA CONTRA UN MURO QUE NO SE MUEVE":
			"{0} ПАСУЕТ И ПАСУЕТ, НО СТЕНА НЕ ДВИГАЕТСЯ",
		"BLOQUE BAJO Y SALIDA RÁPIDA: TU EQUIPO ESPERA SU MOMENTO":
			"НИЗКИЙ БЛОК И БЫСТРЫЙ ВЫХОД: ТВОИ ЖДУТ СВОЕГО ЧАСА",
		"REPLIEGUE Y CONTRA, ASÍ SE PLANTEÓ ESTE PARTIDO":
			"ОТХОД И КОНТРАТАКА — ТАКОВ ПЛАН НА МАТЧ",
		"TU EQUIPO CEDE EL CENTRO DEL CAMPO Y CIERRA EL ÁREA":
			"ТВОЯ КОМАНДА ОТДАЕТ ЦЕНТР ПОЛЯ И ЗАПИРАЕТ ШТРАФНУЮ",
		"LÍNEAS JUNTAS, SIN UN HUECO ENTRE ELLAS": "ЛИНИИ СЖАТЫ, МЕЖДУ НИМИ НИ ЩЕЛИ",
		"SE DEFIENDE CON ORDEN Y SE SALE CON CRITERIO":
			"ОРГАНИЗОВАННАЯ ОБОРОНА И ВЫХОД С УМОМ",
		"{0} TIENE EL BALÓN; TU EQUIPO TIENE EL PLAN": "{0} ВЛАДЕЕТ МЯЧОМ, ТВОЯ КОМАНДА — ПЛАНОМ",
		"CADA ROBO SE CONVIERTE EN UN BALÓN LARGO": "КАЖДЫЙ ОТБОР ПРЕВРАЩАЕТСЯ В ДЛИННЫЙ ПАС",
		"LA ZAGA MANDA: NADA PASA POR EL MEDIO":
			"ЗАЩИТА ПРАВИТ: ЧЕРЕЗ ЦЕНТР НИЧЕГО НЕ ПРОХОДИТ",
		"TU EQUIPO JUEGA AL ERROR DEL RIVAL": "ТВОЯ КОМАНДА ЖДЕТ ОШИБКИ СОПЕРНИКА",
		"DEFENSA EN BLOQUE, SIN REGALAR LA ESPALDA":
			"ОБОРОНА БЛОКОМ, ЗА СПИНУ НИЧЕГО",
		"REPLIEGUE FEROZ: SE DEFIENDE COMO SI FUERA EL ÚLTIMO MINUTO":
			"ЯРОСТНЫЙ ОТХОД: ОБОРОНЯЮТСЯ, КАК НА ПОСЛЕДНЕЙ МИНУТЕ",
		"BLOQUE BAJO PERO A MIL POR HORA, NO SE RESPIRA NI ATRÁS":
			"НИЗКИЙ БЛОК, НО НА ВСЕХ ПАРАХ: ДАЖЕ СЗАДИ НЕ ПРОДОХНУТЬ",
		"TU EQUIPO SE PARTE EL ALMA EN CADA DESPEJE":
			"ТВОЯ КОМАНДА ВКЛАДЫВАЕТ ДУШУ В КАЖДЫЙ ВЫНОС",
		"SE DEFIENDE Y SE SALE AL CONTRAGOLPE COMO UN LATIGAZO":
			"ОБОРОНА И КОНТРАТАКА — КАК УДАР ХЛЫСТОМ",
		"TRABAJO SUCIO A TODA VELOCIDAD: DOS HOMBRES A CADA BALÓN":
			"ЧЕРНАЯ РАБОТА НА ПОЛНОЙ СКОРОСТИ: ДВОЕ НА КАЖДЫЙ МЯЧ",
		"CIERRAN ATRÁS Y ARRANCAN AL ESPACIO EN CUANTO ROBAN":
			"ЗАКРЫВАЮТСЯ СЗАДИ И РВУТ ВПЕРЕД, КАК ТОЛЬКО ОТБЕРУТ",
		"ENTREGA TOTAL EN EL REPLIEGUE, Y ESTO SE PAGA EN PIERNAS":
			"ПОЛНАЯ САМООТДАЧА В ОБОРОНЕ — И ЗА ЭТО ПЛАТЯТ НОГИ",
		"{0} SE ESTRELLA CONTRA UNA MURALLA QUE ADEMÁS CORRE":
			"{0} УПИРАЕТСЯ В СТЕНУ, КОТОРАЯ ЕЩЕ И БЕГАЕТ",
		"NI UN METRO GRATIS: PERSIGUEN AL RIVAL HASTA EL CÓRNER":
			"НИ МЕТРА ДАРОМ: ГОНЯТ СОПЕРНИКА ДО УГЛОВОГО ФЛАЖКА",
		"DEFENDER ASÍ QUEMA, PERO EL ARCO SIGUE EN PIE":
			"ТАК ОБОРОНЯТЬСЯ ТЯЖЕЛО, НО ВОРОТА ЕЩЕ НА ЗАМКЕ",
		"PARTIDO DE TRÁMITE: TU EQUIPO NO ARRIESGA NI UN PASE":
			"ПРОХОДНОЙ МАТЧ: ТВОЯ КОМАНДА НЕ РИСКУЕТ НИ ОДНИМ ПАСОМ",
		"RITMO BAJO Y POSICIONES FIJAS, NADIE SE DESCUELGA":
			"НИЗКИЙ ТЕМП, ВСЕ НА СВОИХ МЕСТАХ, СТРОЙ НЕ ЛОМАЮТ",
		"SE TOCA EN HORIZONTAL, SIN ROMPER LÍNEAS": "ПАСЫ ПОПЕРЕК ПОЛЯ, ЛИНИИ НЕ ВСКРЫВАЮТСЯ",
		"EL PARTIDO SE DUERME Y A TU EQUIPO NO LE MOLESTA":
			"МАТЧ ЗАСЫПАЕТ, И ТВОЮ КОМАНДУ ЭТО УСТРАИВАЕТ",
		"PLAN SOBRIO: NI ATRÁS NI ARRIBA, DEJAR CORRER EL RELOJ":
			"ТРЕЗВЫЙ ПЛАН: НИ НАЗАД, НИ ВПЕРЕД, ПУСТЬ ИДЕТ ВРЕМЯ",
		"TU EQUIPO DOSIFICA, GUARDANDO PIERNAS PARA EL FINAL":
			"ТВОЯ КОМАНДА БЕРЕЖЕТ СИЛЫ НА КОНЦОВКУ",
		"PASES DE SEGURIDAD Y MIRADAS AL BANQUILLO": "СТРАХОВОЧНЫЕ ПАСЫ И ВЗГЛЯДЫ НА СКАМЕЙКУ",
		"SIN PRESIÓN Y SIN PRISA, EL PARTIDO ESTÁ EN PAUSA":
			"НИ ПРЕССИНГА, НИ СПЕШКИ — МАТЧ НА ПАУЗЕ",
		"EQUILIBRIO Y CALMA, NADIE QUIERE ROMPER LA MESA":
			"БАЛАНС И СПОКОЙСТВИЕ, НИКТО НЕ ХОЧЕТ РИСКОВАТЬ",
		"SE JUEGA A MEDIO GAS, ESPERANDO UNA GRIETA":
			"ИГРАЮТ ВПОЛСИЛЫ, ЖДУТ ТРЕЩИНЫ",
		"PARTIDO PAREJO: TU EQUIPO SOSTIENE EL EQUILIBRIO":
			"РАВНЫЙ МАТЧ: ТВОЯ КОМАНДА ДЕРЖИТ БАЛАНС",
		"NI REPLIEGUE NI LOCURA, EL PLAN ES EL ORDEN":
			"НИ ОТХОДА, НИ БЕЗУМИЯ — ПЛАН: ПОРЯДОК",
		"SE JUEGA DE IGUAL A IGUAL EN EL MEDIO CAMPO": "РАВНАЯ БОРЬБА В ЦЕНТРЕ ПОЛЯ",
		"TU EQUIPO ALTERNA TOQUE Y VERTICALIDAD": "ТВОИ ЧЕРЕДУЮТ КОНТРОЛЬ И ВЕРТИКАЛЬ",
		"BLOQUE MEDIO Y PRESIÓN SÓLO CUANDO TOCA": "СРЕДНИЙ БЛОК, ПРЕССИНГ ТОЛЬКО К МЕСТУ",
		"PLAN CLÁSICO: SUJETAR ATRÁS, PROBAR ARRIBA":
			"КЛАССИКА: ДЕРЖАТЬ ТЫЛ, ПРОЩУПЫВАТЬ ВПЕРЕДИ",
		"EL PARTIDO SE JUEGA DONDE TU EQUIPO QUIERE, EN EL MEDIO":
			"ИГРА ИДЕТ ТАМ, ГДЕ ХОЧЕТ ТВОЯ КОМАНДА, — В ЦЕНТРЕ",
		"SIN DESAJUSTES, CADA UNO EN SU SITIO": "НИКАКИХ ДЫР, КАЖДЫЙ НА СВОЕМ МЕСТЕ",
		"SE ESPERA EL MOMENTO SIN REGALAR NADA":
			"ЖДУТ СВОЕГО МОМЕНТА, НИЧЕГО НЕ ОТДАВАЯ",
		"{0} NO ENCUENTRA GRIETAS EN UN EQUIPO BIEN PLANTADO":
			"{0} НЕ НАХОДИТ ЩЕЛЕЙ В ПЛОТНОЙ ОБОРОНЕ",
		"MISMO PLAN, OTRO PULSO: TU EQUIPO CORRE EL DOBLE":
			"ТОТ ЖЕ ПЛАН, ДРУГОЙ ПУЛЬС: ТВОИ БЕГАЮТ ВДВОЕ БОЛЬШЕ",
		"IDA Y VUELTA A TODO TREN, ESTO ES UN PARTIDO ROTO":
			"ОТ ВОРОТ ДО ВОРОТ НА ПОЛНОМ ХОДУ — ИГРА НА РАЗМЕНАХ",
		"PRESIÓN EN CUANTO SE PIERDE, ORDEN EN CUANTO SE TIENE":
			"ПРЕССИНГ ПРИ ПОТЕРЕ, ПОРЯДОК ПРИ ВЛАДЕНИИ",
		"RITMO ALTO SIN PERDER LA FORMA": "ВЫСОКИЙ ТЕМП БЕЗ ПОТЕРИ ФОРМЫ",
		"SE DISPUTA CADA SEGUNDA PELOTA COMO SI FUERA LA ÚLTIMA":
			"КАЖДЫЙ ПОДБОР ОСПАРИВАЮТ, КАК ПОСЛЕДНИЙ",
		"TU EQUIPO ACELERA CADA VEZ QUE PISA CAMPO CONTRARIO":
			"ТВОЯ КОМАНДА УСКОРЯЕТСЯ НА ЧУЖОЙ ПОЛОВИНЕ",
		"EL PARTIDO VUELA DE ÁREA A ÁREA": "МЯЧ ЛЕТАЕТ ОТ ВОРОТ К ВОРОТАМ",
		"INTENSIDAD ARRIBA: {0} NO ENCUENTRA UN SEGUNDO DE PAZ":
			"ИНТЕНСИВНОСТЬ ВЫСОКАЯ: {0} НИ СЕКУНДЫ НЕ ЗНАЕТ ПОКОЯ",
		"EQUILIBRIO CON EL ACELERADOR PISADO": "БАЛАНС С ГАЗОМ В ПОЛ",
		"SE CORRE MUCHO Y SE PIENSA RÁPIDO": "МНОГО БЕГАЮТ И БЫСТРО ДУМАЮТ",
		"TODOS ARRIBA, PERO SIN QUEMARSE: SE BUSCA CON CABEZA":
			"ВСЕ ВПЕРЕДИ, НО БЕЗ НАДРЫВА: ИЩУТ С УМОМ",
		"ATAQUE PACIENTE: SE RODEA EL ÁREA ESPERANDO EL HUECO":
			"ТЕРПЕЛИВАЯ АТАКА: КРУЖАТ У ШТРАФНОЙ В ОЖИДАНИИ ЩЕЛИ",
		"TU EQUIPO ADELANTA LÍNEAS Y ADMINISTRA EL ESFUERZO":
			"ТВОЯ КОМАНДА ПОДНИМАЕТ ЛИНИИ И ДОЗИРУЕТ УСИЛИЯ",
		"MUCHA GENTE ARRIBA Y NINGUNA PRISA POR LLEGAR":
			"МНОГО ЛЮДЕЙ ВПЕРЕДИ, И НИКТО НЕ СПЕШИТ",
		"SE ATACA AL PASO, CON EL BALÓN COMO ÚNICO ARGUMENTO":
			"АТАКУЮТ ШАГОМ, И ЕДИНСТВЕННЫЙ АРГУМЕНТ — МЯЧ",
		"PROPUESTA OFENSIVA SIN DESGASTE: TOQUE Y ESPERA":
			"АТАКУЮЩИЙ ПЛАН БЕЗ ИЗНОСА: ПАС И ОЖИДАНИЕ",
		"LOS LATERALES SUBEN, PERO NADIE CORRE DE MÁS":
			"КРАЙНИЕ ИДУТ ВПЕРЕД, НО БЕЗ ЛИШНЕГО БЕГА",
		"TU EQUIPO ACAMPA EN CAMPO DE {0} SIN APRETAR EL PASO":
			"{0} ЗАПЕРТ НА СВОЕЙ ПОЛОВИНЕ, ТВОЯ КОМАНДА НЕ СПЕШИТ",
		"AMBICIÓN CON LAS PIERNAS GUARDADAS PARA EL FINAL":
			"АМБИЦИИ, НО НОГИ БЕРЕГУТ НА КОНЕЦ",
		"SE INSISTE ARRIBA, AUNQUE SIN PRESIÓN TRAS PÉRDIDA":
			"ДАВЯТ ВПЕРЕДИ, НО БЕЗ КОНТРПРЕССИНГА",
		"PLANTEAMIENTO OFENSIVO: TODOS ARRIBA SOBRE {0}":
			"ВСЕ В АТАКЕ: {0} ПОД ДАВЛЕНИЕМ",
		"TU EQUIPO ADELANTA LA LÍNEA Y BUSCA EL ÁREA RIVAL":
			"ТВОИ ПОДНИМАЮТ ЛИНИЮ И ИЩУТ ЧУЖУЮ ШТРАФНУЮ",
		"LOS LATERALES VIVEN EN CAMPO CONTRARIO":
			"КРАЙНИЕ ЗАЩИТНИКИ ЖИВУТ НА ЧУЖОЙ ПОЛОВИНЕ",
		"SE ATACA CON GENTE: CINCO HOMBRES POR DELANTE DEL BALÓN":
			"АТАКА БОЛЬШИМИ СИЛАМИ: ПЯТЕРО ВПЕРЕДИ МЯЧА",
		"TU EQUIPO EMPUJA Y EL RIVAL ACUMULA GENTE ATRÁS":
			"ТВОЯ КОМАНДА ДАВИТ, А СОПЕРНИК СТЯГИВАЕТ ВСЕХ НАЗАД",
		"CENTRO TRAS CENTRO, EL PLAN ES AHOGAR EL ÁREA":
			"НАВЕС ЗА НАВЕСОМ, ПЛАН — ЗАДУШИТЬ ШТРАФНУЮ",
		"PROPUESTA VALIENTE, AUNQUE DEJE ESPACIOS A LA ESPALDA":
			"СМЕЛЫЙ ПОДХОД, ПУСТЬ ДАЖЕ ЗА СПИНОЙ ОСТАЕТСЯ МЕСТО",
		"TU EQUIPO JUEGA EN CAMPO DE {0} Y NO PIENSA SALIR":
			"{0} ЗАПЕРТ У СВОИХ ВОРОТ, ТВОЯ КОМАНДА НЕ ОТСТУПАЕТ",
		"SE ARRIESGA EN CADA SALIDA BUSCANDO AL DELANTERO":
			"РИСК ПРИ КАЖДОМ ВЫХОДЕ: ИЩУТ НАПАДАЮЩЕГО",
		"EL BLOQUE ESTÁ ALTO Y LA ZAGA, MUY SOLA":
			"БЛОК ВЫСОКО, ЗАЩИТА ОСТАЛАСЬ ОДНА",
		"ASEDIO TOTAL: TODOS ARRIBA Y A MÁXIMO PULSO": "ТОТАЛЬНАЯ ОСАДА: ВСЕ ВПЕРЕДИ НА ПРЕДЕЛЕ",
		"PRESIÓN ASFIXIANTE SOBRE {0}, NO LES DEJAN NI SACAR":
			"УДУШАЮЩИЙ ПРЕССИНГ: {0} НЕ МОЖЕТ ДАЖЕ ВЫЙТИ",
		"TU EQUIPO SE VOLCÓ Y NO HAY QUIEN LO FRENE":
			"ТВОЯ КОМАНДА БРОСИЛАСЬ ВПЕРЕД, И ЕЕ НЕ ОСТАНОВИТЬ",
		"OLA TRAS OLA SOBRE EL ÁREA RIVAL": "ВОЛНА ЗА ВОЛНОЙ НА ЧУЖУЮ ШТРАФНУЮ",
		"ROBO ARRIBA Y REMATE: ESTO ES UNA TORMENTA": "ОТБОР ВЫСОКО И УДАР: ЭТО ШТОРМ",
		"EL RIVAL NO PASA DE MEDIO CAMPO, Y ESO SE PAGA EN PIERNAS":
			"СОПЕРНИК НЕ ПЕРЕХОДИТ ЦЕНТР, И ЗА ЭТО ПЛАТЯТ НОГИ",
		"TODO EL EQUIPO METIDO EN VEINTE METROS DE CAMPO CONTRARIO":
			"ВСЯ КОМАНДА ЗАЖАТА В ДВАДЦАТИ МЕТРАХ ЧУЖОЙ ПОЛОВИНЫ",
		"RITMO ALTÍSIMO, NO DEJAN RESPIRAR A {0}": "БЕШЕНЫЙ ТЕМП, {0} НЕ МОЖЕТ ВЗДОХНУТЬ",
		"UN SOLO EQUIPO EN EL CAMPO, Y ES EL TUYO": "ИГРАЕТ ТОЛЬКО ОДНА КОМАНДА — ТВОЯ",
		"ATAQUE SIN RED: ATRÁS SÓLO QUEDAN DOS":
			"АТАКА БЕЗ СТРАХОВКИ: СЗАДИ ОСТАЛИСЬ ДВОЕ",
		"CON EL {0} ABAJO, TU EQUIPO VA AL FRENTE": "ПРОИГРЫВАЯ {0}, ТВОЯ КОМАНДА ИДЕТ ВПЕРЕД",
		"ARRANCA EL PARTIDO, PRIMEROS TANTEOS ANTE {0}": "МАТЧ НАЧАЛСЯ: ПЕРВАЯ РАЗВЕДКА, СОПЕРНИК — {0}",
		"CON EL {0} ABAJO, TU EQUIPO SE VUELCA AL FRENTE":
			"ПРОИГРЫВАЯ {0}, ТВОЯ КОМАНДА БРОСАЕТСЯ ВПЕРЕД",
		"FRÍOS: A TU EQUIPO NO LE SALE NADA": "ИГРА НЕ ИДЕТ: У ТВОИХ НИЧЕГО НЕ ВЫХОДИТ",
		"PIERNAS PESADAS: {0} ACUSA EL CANSANCIO": "ТЯЖЕЛЫЕ НОГИ: {0} УСТАЕТ",
		"{0} SE COLOCA EL BALÓN EN EL PUNTO": "{0} УСТАНАВЛИВАЕТ МЯЧ НА ТОЧКУ",
		"LA PENA MÁXIMA LA COBRA {0}": "ПЕНАЛЬТИ БЬЕТ {0}",
		"SE PREPARA {0} SOBRE LA FALTA": "{0} ГОТОВИТСЯ БИТЬ ШТРАФНОЙ",
		"SE HACE CARGO {0} DE LA FALTA": "ШТРАФНОЙ БЕРЕТ НА СЕБЯ {0}",
		"SACA EL CÓRNER {0}": "УГЛОВОЙ ПОДАЕТ {0}",
		"SAQUE DE ESQUINA, LLEGA EL CENTRO": "УГЛОВОЙ, ИДЕТ НАВЕС",
		"{0} MINUTOS AÑADIDOS": "ДОБАВЛЕНО: {0} МИН.",
		"ESTO SE VA A LA PRÓRROGA": "ДЕЛО ИДЕТ К ДОП. ВРЕМЕНИ",
		"{0} LLEGA TARDE A TODO, SIN PIERNAS": "{0} ВЕЗДЕ ОПАЗДЫВАЕТ, НОГ НЕТ",
		"{0} PIDE EL CAMBIO CON LA MIRADA": "{0} ВЗГЛЯДОМ ПРОСИТ ЗАМЕНУ",
		"SE LE ACABA LA GASOLINA A {0}": "{0} БЕЖИТ НА ПУСТОМ БАКЕ",
		"{0} ANDA ENCHUFADÍSIMO HOY": "{0} СЕГОДНЯ ЗАРЯЖЕН НА ВСЕ СТО",
		"NO PARA DE CORRER, {0}": "{0} БЕГАЕТ БЕЗ ОСТАНОВКИ",
		"{0} ESTÁ ADMINISTRANDO FUERZAS": "{0} РАСПРЕДЕЛЯЕТ СИЛЫ",
		"{0} ANDA MUY FLOJO, LE FALTA CHISPA": "{0} СОВСЕМ ВЯЛЫЙ, НЕТ ИСКРЫ",
		"{0} DEBERÍA PISAR MÁS EL ÁREA": "{0} ДОЛЖЕН ЧАЩЕ БЫВАТЬ В ШТРАФНОЙ",
		"A {0} LE FALTA AYUDAR ATRÁS": "{0} ДОЛЖЕН ПОМОГАТЬ СЗАДИ",
		"ASÍ NO LE LLEGA UN BALÓN A {0}": "ТАК {0} МЯЧА НЕ УВИДИТ",
		"{0} SE ESTÁ ADUEÑANDO DEL PARTIDO": "{0} БЕРЕТ МАТЧ В СВОИ РУКИ",
		"PARTIDAZO DE {0}": "{0} УСТРАИВАЕТ БЕНЕФИС",
		"SE LE ESTÁ ATRAGANTANDO EL PARTIDO A {0}": "{0} НИКАК НЕ МОЖЕТ ВОЙТИ В ИГРУ",
		"{0} NO APARECE": "{0} ПРОПАЛ С РАДАРОВ",
		"{0} LLEVA LA MANIJA DEL EQUIPO": "{0} ДИРИЖИРУЕТ ИГРОЙ",
		"{0} SE QUEDA SOLO ARRIBA, NADIE SUBE": "{0} ОДИН ВПЕРЕДИ, НИКТО НЕ ПОДКЛЮЧАЕТСЯ",
		"TODO PASA POR {0}": "ВСЕ ИДЕТ ЧЕРЕЗ НЕГО: {0}",
		"{0} NO PARA DE APAGAR FUEGOS ATRÁS": "{0} ПОСТОЯННО ТУШИТ ПОЖАРЫ СЗАДИ",
		"{0} SE PASA EL PARTIDO CORRIENDO DETRÁS DEL BALÓN": "{0} ВЕСЬ МАТЧ БЕГАЕТ ЗА МЯЧОМ",
		"{0} MANEJA LOS TIEMPOS DESDE EL MEDIO": "{0} ЗАДАЕТ ТЕМП ИЗ ЦЕНТРА ПОЛЯ",
		"TARDE TRANQUILA PARA {0} EN LA ZAGA": "{0}: СПОКОЙНЫЙ ДЕНЬ В ОБОРОНЕ",
		"LA GRADA CANTA TU NOMBRE, {0}": "ТРИБУНЫ СКАНДИРУЮТ ТВОЕ ИМЯ, {0}",
		"{0} BAJA A ORDENAR EL JUEGO": "{0} ОТТЯГИВАЕТСЯ И СТРОИТ ИГРУ",
		"{0} CALIENTA EN LA BANDA, PIDE ENTRAR":
			"{0} РАЗМИНАЕТСЯ У БРОВКИ, ПРОСИТСЯ НА ПОЛЕ",

		"{0} MIRA EL PARTIDO DESDE EL BANQUILLO, CABIZBAJO":
			"{0} СМОТРИТ МАТЧ СО СКАМЕЙКИ, ОПУСТИВ ГОЛОВУ",
		"{0} SE SIENTA FUNDIDO, EL BANQUILLO LE DA HIELO":
			"{0} БЕЗ СИЛ ПАДАЕТ НА СКАМЕЙКУ, ЕМУ НЕСУТ ЛЕД",
		"UNA PALMADA PARA {0} AL LLEGAR AL BANQUILLO":
			"{0} ПОЛУЧАЕТ ХЛОПОК ПО ПЛЕЧУ НА СКАМЕЙКЕ",
		"NADIE DEL BANQUILLO MIRA A {0}": "{0} НА СКАМЕЙКЕ, НА НЕГО НЕ СМОТРЯТ",
		"EN EL BANQUILLO SE COMENTA LA SALIDA DE {0}":
			"НА СКАМЕЙКЕ ОБСУЖДАЮТ, ПОЧЕМУ УШЕЛ {0}",
		"{0} SIGUE EL PARTIDO DESDE EL BANQUILLO": "{0} СЛЕДИТ ЗА МАТЧЕМ СО СКАМЕЙКИ",
		"EQUIPO ENCENDIDO, HUELE A GOL ANTE {0}":
			"ТВОЯ КОМАНДА ГОРИТ, {0} ВОТ-ВОТ ПРОПУСТИТ",
		"DUELO PAREJO, NADIE QUIERE EL ERROR": "РАВНАЯ БОРЬБА, НИКТО НЕ ХОЧЕТ ОШИБИТЬСЯ",
		"TU EQUIPO MANEJA EL {0}": "ТВОИ ДЕРЖАТ СЧЕТ {0}",
		"TU EQUIPO MANEJA EL {0} SIN PRISA": "ТВОИ СПОКОЙНО ДЕРЖАТ СЧЕТ {0}",
		"SE ACERCA EL DESCANSO CON EL {0}": "ПЕРЕРЫВ БЛИЗКО, СЧЕТ {0}",
		"RECTA FINAL, URGE EL EMPATE: TODOS ARRIBA":
			"ФИНИШНАЯ ПРЯМАЯ, НУЖНО СРАВНЯТЬ: ВСЕ ВПЕРЕД",
		"RECTA FINAL Y EL {0} SIGUE ABIERTO": "ФИНИШНАЯ ПРЯМАЯ, СЧЕТ {0}, ВСЕ ОТКРЫТО",
		"RECTA FINAL: TU EQUIPO AGUANTA EL {0} CON EL ALMA":
			"ФИНИШНАЯ ПРЯМАЯ: ТВОИ ИЗО ВСЕХ СИЛ ДЕРЖАТ {0}",
	},

	"notifications": {
		"ESA CAMISETA TIENE DUEÑO": "ЭТОТ НОМЕР ЗАНЯТ",
		"El número que quieres cuelga dos perchas más allá, con el nombre de {0} encima. Cambiarlo se hace más de lo que parece.":
			"Номер, который ты хочешь, висит через два крючка, и над ним имя: {0}. Поменять его сложнее, чем кажется.",
		"COMPRÁRSELO": "ВЫКУПИТЬ",
		"PEDIRLO AL CLUB": "ПОПРОСИТЬ КЛУБ",
		"DEJARLO ESTAR": "НЕ ТРОГАТЬ",
		"UN OJEADOR EN LA GRADA": "СКАУТ НА ТРИБУНЕ",
		"Un club grande mandó ojeador a verte y la prensa local se enteró. Todos quieren saber si sueñas con irte.":
			"Большой клуб прислал скаута посмотреть на тебя, и местная пресса об этом пронюхала. Все хотят знать, мечтаешь ли ты уйти.",
		"HABLAR DEL SUEÑO": "ПРИЗНАТЬСЯ",
		"QUITARLE HIERRO": "СБАВИТЬ ГРАДУС",
		"EL SEGUNDO TRABAJO": "ВТОРАЯ РАБОТА",
		"Un compañero reparte paquetes por las mañanas para llegar a fin de mes. Esta semana no puede y te pide cubrirle una tarde.":
			"Партнер по команде по утрам развозит посылки, чтобы сводить концы с концами. На этой неделе он не может и просит тебя подменить его после обеда.",
		"ECHARLE LA TARDE": "ПОДМЕНИТЬ ЕГО",
		"NO PUEDO": "НЕ МОГУ",
		"ESTE CAMPO ES UN PATATAL": "НЕ ПОЛЕ, А ОГОРОД",
		"El césped es un parche de tierra y bote falso. Un periodista te pregunta, sonriendo, qué te parece tu nuevo estadio.":
			"Газон — проплешины и кочки, мяч скачет как попало. Журналист с ухмылкой спрашивает, как тебе твой новый стадион.",
		"DECIR LA VERDAD": "СКАЗАТЬ ПРАВДУ",
		"'AQUÍ SE JUEGA IGUAL'": "«ПОЛЕ КАК ПОЛЕ»",
		"CÁMARAS EN EL VESTUARIO": "КАМЕРЫ В РАЗДЕВАЛКЕ",
		"Una plataforma quiere rodar tu documental: un mes de cámaras siguiéndote hasta dentro del vestuario. Pagan bien. El grupo no sonríe.":
			"Стриминговая платформа хочет снять о тебе документальный фильм: месяц камеры будут следовать за тобой до самой раздевалки. Платят хорошо. Команда не улыбается.",
		"FIRMAR EL RODAJE": "СОГЛАСИТЬСЯ",
		"PROTEGER EL GRUPO": "ЗАЩИТИТЬ КОМАНДУ",
		"TU CIFRA EN PORTADA": "ТВОЯ СУММА В ГАЗЕТЕ",
		"Un diario publica lo que pides por renovar, con cifra y todo. Es casi exacta. Confirmarla presiona al club; negarla te protege.":
			"Газета публикует, сколько ты просишь за продление, вплоть до суммы. Почти точно. Подтвердишь — надавишь на клуб; опровергнешь — прикроешь себя.",
		"CONFIRMARLA": "ПОДТВЕРДИТЬ",
		"NEGARLO TODO": "ВСЕ ОТРИЦАТЬ",
		"EL PENALTI QUE NO TIRASTE": "НЕ ТВОЙ ПЕНАЛЬТИ",
		"El designado falló el penalti que costó el partido. Tú eras el segundo de la lista y la prensa lo sabe.":
			"Штатный пенальтист промахнулся, и это стоило команде матча. Ты был вторым в списке, и пресса это знает.",
		"RESPALDARLO": "ПОДДЕРЖАТЬ",
		"'YO LO PEDÍ'": "«Я ПРОСИЛСЯ»",
		"TUS NÚMEROS EN LA PIZARRA": "ТВОЯ СТАТИСТИКА НА ДОСКЕ",
		"Un analista joven te espera con tu mala racha desmenuzada en la pizarra: mapas, flechas y todo lo que no estás haciendo.":
			"Молодой аналитик ждет тебя с твоей неудачной серией, разобранной по косточкам на доске: схемы, стрелки и все, чего ты не делаешь.",
		"TRAGARTE EL ORGULLO": "ПРОГЛОТИТЬ ГОРДОСТЬ",
		"MANDARLO A PASEO": "ПОСЛАТЬ ПОДАЛЬШЕ",
		"El siguiente partido te da la razón.": "Следующий матч доказывает твою правоту.",
		"La racha sigue y el míster no olvida.": "Неудачная серия продолжается, а тренер ничего не забывает.",
		"LA CÁMARA TE ENFOCÓ": "ПОПАЛ В КАДР",
		"Otro partido desde el banco, y la cámara te pilló con cara larga. En redes debaten si eres mal compañero.":
			"Еще один матч на скамейке, и камера поймала тебя с кислой миной. В соцсетях спорят, не плохой ли ты партнер по команде.",
		"'APOYO AL EQUIPO'": "'Я ЗА КОМАНДУ'",
		"NO ACLARAR NADA": "ПУСТЬ ГОВОРЯТ",
		"EL DISCURSO DEL NUEVO": "РЕЧЬ НОВИЧКА",
		"Primer día con el grupo entero sentado y el míster te cede la palabra. Cuarenta segundos y todo el vestuario midiéndote.":
			"Первый день, вся команда в сборе, и тренер дает тебе слово. Сорок секунд — и вся раздевалка к тебе присматривается.",
		"PROMETER TÍTULOS": "ОБЕЩАТЬ ТИТУЛЫ",
		"VENGO A APRENDER": "Я ПРИШЕЛ УЧИТЬСЯ",
		"SÓLO SALUDAR Y SENTARTE": "ПОЗДОРОВАТЬСЯ И СЕСТЬ",
		"DÓNDE VAS A VIVIR": "ГДЕ БУДЕШЬ ЖИТЬ",
		"El club te pasa tres opciones: el ático del centro que sale en las revistas, una casa pegada a la ciudad deportiva, o seguir en el hotel y no gastar.":
			"Клуб предлагает три варианта: пентхаус в центре, как из журналов, дом рядом с тренировочной базой или остаться в отеле и ничего не тратить.",
		"EL ÁTICO DEL CENTRO": "ПЕНТХАУС В ЦЕНТРЕ",
		"PEGADO AL ENTRENAMIENTO": "РЯДОМ С БАЗОЙ",
		"SEGUIR EN EL HOTEL": "ОСТАТЬСЯ В ОТЕЛЕ",
		"EL PLANTE POR LOS MINUTOS": "УЛЬТИМАТУМ: ДАЙТЕ ИГРАТЬ",
		"Otra jornada mirando desde el banco. Tu agente ya tiene el titular escrito y un periodista esperando; el míster te ha citado a solas antes de que salga.":
			"Еще один тур на скамейке. У твоего агента уже готов заголовок и ждет журналист; тренер вызвал тебя на разговор один на один, пока это не вышло.",
		"EXIGIRLO EN PÚBLICO": "ТРЕБОВАТЬ ПУБЛИЧНО",
		"TRAGAR Y CALLARTE": "ПРОГЛОТИТЬ ОБИДУ",
		"EL MOTÍN": "БУНТ",
		"El vestuario ha decidido que el míster se tiene que ir y hay una carta con firmas dando vueltas. Falta la tuya, y el despacho está a diez metros por el otro pasillo.":
			"Раздевалка решила, что тренер должен уйти, и по рукам ходит письмо с подписями. Не хватает только твоей, а его кабинет — в десяти метрах по другому коридору.",
		"FIRMAR CON EL GRUPO": "ПОДПИСАТЬ СО ВСЕМИ",
		"AVISAR AL MÍSTER": "СКАЗАТЬ ТРЕНЕРУ",
		"EL AÑO QUE TE QUEDA": "ПОСЛЕДНИЙ ГОД",
		"Tu agente tiene un periodista al teléfono y una frase preparada: que escuchas ofertas. Filtrarla te dobla el precio y te convierte, esta misma noche, en el que ya se fue.":
			"У твоего агента на телефоне журналист и готовая фраза: ты слушаешь предложения. Слей ее — и твоя цена удвоится, а сам ты уже сегодня вечером станешь тем, кто одной ногой за дверью.",
		"DEJARLA CAER": "НАМЕКНУТЬ",
		"JURAR QUE TE QUEDAS": "ПОКЛЯСТЬСЯ ОСТАТЬСЯ",
		"LO QUE SABE EL CAPITÁN": "ЧТО ЗНАЕТ КАПИТАН",
		"Tres se saltaron la concentración y tú los viste salir. El club te pregunta a la cara, como capitán, y el vestuario entero espera en el pasillo a ver qué dices.":
			"Трое нарушили режим на сборах, и ты видел, как они уходили. Клуб спрашивает тебя в лоб, как капитана, а вся раздевалка ждет в коридоре, что ты скажешь.",
		"DAR LOS NOMBRES": "НАЗВАТЬ ИМЕНА",
		"TAPARLOS": "ПРИКРЫТЬ",
		"LA OFERTA QUE NO SE RECHAZA": "НЕОТРАЗИМОЕ ПРЕДЛОЖЕНИЕ",
		"Una casa de apuestas pone medio año de sueldo por tu cara en su cartel. La grada odia esa marca —hay pancartas cada domingo— y el club firmó contra ella.":
			"Букмекерская контора предлагает полугодовую зарплату за твое лицо на своем билборде. Трибуны ненавидят этот бренд — баннеры против него висят каждое воскресенье, — а клуб подписал обязательство с ним не работать.",
		"COBRAR Y FIRMAR": "ВЗЯТЬ ДЕНЬГИ",
		"DECIR QUE NO": "ОТКАЗАТЬСЯ",
		"EL VESTUARIO YA LO SABE": "РАЗДЕВАЛКА УЖЕ ЗНАЕТ",
		"Pediste salir y la noticia llegó antes que tú al vestuario. Nadie te dice nada, que es peor. El capitán te espera apoyado en tu taquilla.":
			"Ты попросился уйти, и новость добралась до раздевалки раньше тебя. Никто ничего не говорит, и это хуже всего. Капитан ждет, прислонившись к твоему шкафчику.",
		"NO ES ASUNTO SUYO": "НЕ ИХ ДЕЛО",
		"LA GRADA TE CANTA": "ТРИБУНА ПОЕТ",
		"En el calentamiento un fondo entero te canta que te vayas ya. A la salida hay bufandas en el suelo y una cámara esperando tu cara.":
			"На разминке целая трибуна за воротами поет, чтобы ты убирался. На выходе на земле валяются шарфы, а камера ждет твоей реакции.",
		"APLAUDIR AL FONDO": "ПОХЛОПАТЬ ТРИБУНЕ",
		"SALIR SIN MIRAR": "УЙТИ, НЕ ГЛЯДЯ",
		"TE HAN PUESTO EN LA LISTA": "ТЫ ВЫСТАВЛЕН НА ПРОДАЖУ",
		"El club te metió en la lista de transferibles sin avisarte, y te enteraste por la prensa. Hay un micrófono delante y la pregunta ya está hecha.":
			"Клуб выставил тебя на продажу, не предупредив, и ты узнал об этом из прессы. Перед тобой микрофон, и вопрос уже задан.",
		"TRAGARME EL SAPO": "ПРОГЛОТИТЬ",
		"CONTAR LA VERDAD": "СКАЗАТЬ ПРАВДУ",
		"LA MEDALLA DE PLATA": "СЕРЕБРЯНАЯ МЕДАЛЬ",
		"Perdiste la final. En el círculo central te cuelgan la medalla que nadie quiere, y en el túnel hay treinta micrófonos esperando a que señales a alguien.":
			"Ты проиграл финал. В центральном круге на тебя вешают медаль, которая никому не нужна, а в туннеле тридцать микрофонов ждут, когда ты укажешь на виноватого.",
		"CULPAR AL PLANTEAMIENTO": "ВИНИТЬ ТАКТИКУ",
		"SEÑALAR AL VESTUARIO": "ВИНИТЬ КОМАНДУ",
		"PASAR DE LARGO SIN HABLAR": "ПРОЙТИ МИМО МОЛЧА",
		"LA REUNIÓN DE JUNIO": "ИЮНЬСКАЯ ВСТРЕЧА",
		"Despacho, dos directivos y una carpeta con tu temporada abierta encima de la mesa. No cumpliste, y de aquí nadie sale hasta que la culpa tenga un nombre.":
			"Кабинет, двое из руководства клуба и папка с твоим сезоном, раскрытая на столе. Ты не справился, и никто отсюда не выйдет, пока у вины не появится имя.",
		"SEÑALAR AL TÉCNICO": "ВИНИТЬ ТРЕНЕРА",
		"SEÑALAR A LA PLANTILLA": "ВИНИТЬ СОСТАВ",
		"FIRMAR QUE FUE TU CULPA": "ВЗЯТЬ ВИНУ НА СЕБЯ",
		"CUATRO EN CONTRA": "ПРОПУСТИЛИ ЧЕТЫРЕ",
		"Ridículo de los que se recuerdan. La grada se quedó de pie esperando a que alguien subiera a dar la cara, y en el vestuario nadie levanta la vista del suelo.":
			"Позор из тех, что запоминаются. Трибуны стояли и ждали, что кто-нибудь выйдет и ответит за все, а в раздевалке никто не поднимает глаз от пола.",
		"PEDIR PERDÓN EN CALIENTE": "ИЗВИНИТЬСЯ СРАЗУ",
		"DECIR QUE NO ES PARA TANTO": "ЭТО НЕ КОНЕЦ СВЕТА",
		"REVENTAR EL VESTUARIO": "УСТРОИТЬ РАЗНОС",
		"PERDISTE EL DERBI": "ПРОИГРАННОЕ ДЕРБИ",
		"La ciudad es de ellos durante un año entero. En la puerta hay gente esperando el autobús del equipo, y no vienen a pedir autógrafos.":
			"Теперь город на целый год принадлежит им. У ворот люди ждут автобус команды, и пришли они не за автографами.",
		"ENCARARTE CON LA VALLA": "СЦЕПИТЬСЯ С ФАНАТАМИ",
		"CARGAR CONTRA EL ÁRBITRO": "ОБРУШИТЬСЯ НА СУДЬЮ",
		"IRTE EN SILENCIO": "УЙТИ МОЛЧА",
		"FUERA CONTRA UN MODESTO": "ВЫЛЕТ ОТ АУТСАЙДЕРА",
		"Os echó un equipo de dos categorías más abajo, en un campo de mil personas y con el vestuario de local celebrándolo al lado del vuestro.":
			"Вас выбила команда на две лиги ниже, на стадионе на тысячу мест, а раздевалка хозяев праздновала прямо за стенкой.",
		"DECIR QUE OS SOBRÓ CONFIANZA": "ПРИЗНАТЬ, ЧТО ЗАЗНАЛИСЬ",
		"DEFENDER AL GRUPO CONTRA TODOS": "ЗАЩИТИТЬ КОМАНДУ ОТ ВСЕХ",
		"NO ABRIR LA BOCA": "НИ СЛОВА",
		"EL ESTADIO LLEVARÁ TU NOMBRE": "СТАДИОН НАЗОВУТ В ТВОЮ ЧЕСТЬ",
		"La directiva lo anuncia en la próxima junta: quiere ponerle tu nombre al estadio. Es el honor más grande que da un club, y sólo se da una vez.":
			"Руководство клуба объявит об этом на ближайшем собрании: стадион хотят назвать твоим именем. Это высшая честь, которую может оказать клуб, и оказывают ее лишь однажды.",
		"ACEPTAR EL HONOR": "ПРИНЯТЬ ЧЕСТЬ",
		"QUE SEA PARA TODO EL VESTUARIO": "В ЧЕСТЬ ВСЕЙ КОМАНДЫ",
		"DEJARLO CON SU NOMBRE DE SIEMPRE": "ОСТАВИТЬ ПРЕЖНЕЕ НАЗВАНИЕ",
		"TE PONEN EL MICRO": "МИКРОФОН У ЛИЦА",
		"Figura del partido. La cadena te para antes del vestuario y hay treinta segundos en directo. Lo que digas se repite toda la semana.":
			"Лучший игрок матча. Телеканал перехватывает тебя у раздевалки, у тебя тридцать секунд прямого эфира. Что скажешь — будут крутить всю неделю.",
		"MÉRITO DEL EQUIPO": "ЗАСЛУГА КОМАНДЫ",
		"HABLAR DE TU MOMENTO": "РАССКАЗАТЬ О ФОРМЕ",
		"DEDICÁRSELO A LA GENTE": "ПОСВЯТИТЬ БОЛЕЛЬЩИКАМ",
		"CÓMO LO CUENTAS": "КАК ПОДАТЬ",
		"El parte ya salió y el teléfono no para. Toca decir algo sobre la baja, y cada versión tiene su precio.":
			"Медицинское заключение уже вышло, телефон не умолкает. Надо что-то сказать о травме, и у каждой версии своя цена.",
		"VOLVERÉ ANTES DE TIEMPO": "ВЕРНУСЬ РАНЬШЕ СРОКА",
		"SEGUIR LOS PLAZOS": "СОБЛЮДАТЬ СРОКИ",
		"NO DECIR NADA": "ПРОМОЛЧАТЬ",
		"El médico no dice plazos: dice que a tu edad una rotura así no vuelve entera. Puedes pelear la rehabilitación y volver mermado, o parar tú antes de que te paren.":
			"Врач не называет сроков: говорит, что в твоем возрасте после такого разрыва полностью не восстанавливаются. Можно бороться на реабилитации и вернуться ослабленным — или уйти самому, пока тебя не заставили.",
		"REHABILITARME": "ВОССТАНОВИТЬСЯ",
		"MÉRITO DE {0}": "ЗАСЛУГА: {0}",
	},





	"leyenda_casa": {
		"DE LA CASA": "СТАРОЖИЛЫ",
		"Diez temporadas seguidas o más en el club. Una cesión no corta la racha.": "Десять сезонов подряд или больше в клубе. Аренда серию не прерывает.",
		"Nadie lleva aún diez temporadas seguidas en {0}.": "В клубе {0} еще никто не провел десять сезонов подряд.",

		"PASARON POR AQUÍ": "ИГРАЛИ ЗДЕСЬ",
		"Jugaron aquí y hoy están en otro club, los mejores primero.": "Играли здесь, а сейчас в другом клубе; сначала лучшие.",
		"Nadie que pasara por {0} sigue en activo en otro club.": "Никто из бывших игроков клуба {0} сейчас не играет в другом клубе.",
		"TEMP.": "СЕЗ.",
		"Bandera del Club": "Символ клуба",
		"Jugar 10 temporadas seguidas en un mismo club.": "Сыграй 10 сезонов подряд за один клуб.",
	},

	"achievements": {},





	"practice": {
		"VOLVER": "НАЗАД",
		"SALIR A MENÚ": "В МЕНЮ",
		"EMPEZAR DE NUEVO": "НАЧАТЬ ЗАНОВО",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada cuenta para la carrera. Se sale con PAUSA.": "Выбери эпизод и повторяй его сколько хочешь: каждая попытка создает новую ситуацию этого типа. В карьере ничего не учитывается. Выход — через ПАУЗУ.",
		"JUEGO ABIERTO": "С ИГРЫ",
		"BALÓN PARADO": "СТАНДАРТЫ",
		"CONDUCCIÓN": "ДРИБЛИНГ",
		"Mano a mano": "Один на один",
		"Disparo frontal": "Удар из центра",
		"Desde lejos": "Издалека",
		"Ángulo cerrado": "Острый угол",
		"Rebote en el área": "Добивание в штрафной",
		"Contraataque": "Контратака",
		"Volea": "Удар с лета",
		"Centro al área": "Навес в штрафную",
		"Centro desde el fondo": "Навес с лицевой",
		"Tiro libre": "Штрафной",
		"Tiro de esquina": "Угловой",
		"Penal": "Пенальти",
		"Saque de banda largo": "Длинный аут",
		"Falta al borde del área": "Штрафной у границы штрафной",
		"Regate 1 contra 1": "Дриблинг 1 в 1",



		"EL CAMPO": "ПОЛЕ",
		"AZOTEA": "КРЫША",
		"TU ESTADIO": "ТВОЙ СТАДИОН",
		"EL TIEMPO": "ПОГОДА",
		"SORTEO": "ЖРЕБИЙ",


		"SOL": "ЯСНО",
		"NUBES": "ОБЛАЧНО",
		"TARDE": "ЗАКАТ",
		"LLUVIA": "ДОЖДЬ",
		"NOCHE": "НОЧЬ",
		"NIEVE": "СНЕГ",
		"En la azotea siempre anochece y siempre llueve: es su hora. Juega en TU ESTADIO si quieres mandar sobre el tiempo.": "На крыше всегда сумерки и всегда дождь: такое уж там время. Выбери ТВОЙ СТАДИОН, если хочешь сам решать, какая будет погода.",
		"Se sortea como en un partido de verdad.": "Погода выпадает случайно, как в настоящем матче.",
		"Sin límite · no cuenta para la carrera": "Без ограничений · в карьере не учитывается",
		"Tu estadio con {0}.": "Твой стадион. Погода: {0}.",




		"Soleado": "Солнечно",
		"Nublado": "Облачно",
		"Atardecer": "Закат",
		"Lluvia": "Дождь",
		"Noche": "Ночь",
		"Nieve": "Снег",



		"Llovizna": "Морось",
		"Tormenta": "Гроза",
	},















	"career_screens": {

		"TRAYECTORIA": "КАРЬЕРА",
		"DESDE T{0}": "С СЕЗ. {0}",

		"DESDE {0}": "С {0}",


		"viaLIBRE": "БЕСПЛ.",
		"viaEDITOR": "РЕДАКТОР",
		"TRASPASO": "ТРАНСФЕР",
		"FIN CESION": "ИЗ АРЕНДЫ",
		"COMPRADO": "КУПЛЕН",

		"HAY UNA PARED AHI": "ТАМ СТЕНА",
		"PUERTAS Y VENTANAS": "ДВЕРИ И ОКНА",

		"PINO": "СОСНА",
		"NOGAL": "ОРЕХ",
		"NEGRO MATE": "МАТ. ЧЕРНЫЙ",
		"ALUMINIO": "АЛЮМИНИЙ",
		"LATÓN": "ЛАТУНЬ",




		"RITMO": "ТОНУС",
		"FALTO DE RITMO · SE PASA JUGANDO": "НЕТ ТОНУСА · ВЕРНЕТСЯ В ИГРЕ",
		"EL TÉCNICO TE DA DESCANSO · LO VES DESDE LA GRADA":
			"ТРЕНЕР ДАЕТ ТЕБЕ ОТДЫХ · СМОТРИШЬ С ТРИБУНЫ",
		"POR DEBAJO DE {0} EMPIEZAS EN LA BANCA": "НИЖЕ {0} — НАЧИНАЕШЬ В ЗАПАСЕ",




		"POR DEBAJO DE {0} NO TE CONVOCAN": "НИЖЕ {0} — НЕ В ЗАЯВКЕ",


		"AÑO {0} · SEM {1}/{2}": "ГОД {0} · НЕД. {1}/{2}",
		"energiaFUERA": "ТРИБУНА",
		"energiaBANCA": "ЗАПАС",
		"Aún no llevas {0} partidos: esta vez no cuenta.":
			"Для зачета нужно матчей: {0}. Пока не набралось — этот не считается.",

		"MANTENIMIENTO": "СОДЕРЖАНИЕ",
		"En segunda tu club abre tienda oficial: merch, y la tabla de las camisetas más vendidas del vestuario.":
			"Во второй лиге твой клуб открывает официальный магазин: мерч и рейтинг самых продаваемых футболок игроков команды.",
		"LAS MÁS VENDIDAS": "ХИТЫ ПРОДАЖ",
		"{0} AL AÑO": "{0} В ГОД",
		"Lo que mueve cada uno de la marca del club. Vender camisetas te hace más difícil de vender a ti.":
			"Сколько каждый приносит бренду клуба. Чем лучше продаются твои футболки, тем сложнее продать тебя самого.",
		"JUGADOR": "ИГРОК",
		"CUOTA": "ДОЛЯ",

		"TUS TEMPORADAS": "ТВОИ СЕЗОНЫ",
		"AÑO": "ГОД",
		"{0}º de {1}": "{0} из {1}",
		"Tu dorsal, el {0}, se elige al fichar o al renovar.":
			"Твой номер, {0}, выбирается при подписании или продлении контракта.",
		"A la espalda: {0}": "На спине: {0}",
		"GOL DE PENAL EN LIGA": "ГОЛ С ПЕНАЛЬТИ В ЛИГЕ",
		"GOL DE PENAL EN {0}": "ГОЛ С ПЕНАЛЬТИ: {0}",

		"Tu media es {0}. Con la vara de {1} son {2}, y ése es el número que se mide contra la lista.":
			"Твой рейтинг — {0}. С поправкой на уровень ({1}) выходит {2}, и именно это число сравнивают со списком.",
		"Y el seleccionador te apunta {0} por lo de fuera del campo, así que la lista te lee {1}.":
			"А еще тренер сборной добавляет тебе {0} за то, что ты делаешь вне поля, так что для списка ты — {1}.",
		"Tu país no tiene liga propia: eres su estrella indiscutible.":
			"В твоей стране нет своей лиги: ты ее бесспорная звезда.",
		"Te faltan {0} puntos para entrar en la convocatoria.":
			"До попадания в заявку не хватает очков: {0}.",
		"Aún no entras en la convocatoria.": "Ты пока не попадаешь в заявку.",
		"Sin nacionalidad: no hay selección que disputar.":
			"Нет гражданства — нет и сборной, за которую можно играть.",
		"{0} · {1} CANDIDATOS": "{0} · КАНДИДАТОВ: {1}",
		"DORSAL {0}": "НОМЕР {0}",
		"1-{0} ONCE": "1-{0} ОСНОВА",
		"{0}-{1} BANCA": "{0}-{1} ЗАПАС",
		"El suelo, la pared y la carpintería, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.": "Пол, стены и столярка — на твой вкус. Покупаются по отдельности и остаются у тебя: меняй когда захочешь.",
		"MUDARSE": "ПЕРЕЕХАТЬ",
		"El terreno crece a {0}×{0} m y todo lo que construiste se queda.": "Участок вырастает до {0}×{0} м, и все, что ты построил, остается.",
		"La casa más grande que se vende, y una planta hecha a la medida.": "Самый большой дом на рынке и планировка, сделанная на заказ.",
		"Todo lo que construiste se queda.": "Все, что ты построил, остается.",
		"Ya vives en la mejor casa: no hay ninguna encima.": "Ты уже живешь в лучшем доме: лучше просто нет.",
		"PRECIO": "ЦЕНА",

		"PONER VENTANA": "ДОБАВИТЬ ОКНО",
		"PUERTA DOBLE": "ДВОЙНАЯ ДВЕРЬ",
		"PONER ARCO": "СДЕЛАТЬ АРКУ",
		"PONER VENTANAL": "ПАНОРАМНОЕ ОКНО",
		"PONER OJO DE BUEY": "КРУГЛОЕ ОКНО",
		"DOBLE": "ДВОЙН.",
		"ARCADA": "АРКА",
		"VENTNL": "ПАНОР.",
		"OJO": "КРУГ",
		"QUITAR VENTANA": "УБРАТЬ ОКНО",
		"VENTAN": "ОКНО",
		"TAPIAR": "ЗАШИТЬ",

		"VACIAR": "СБРОС",
		"PUESTOS": "МЕБЕЛЬ",
		"TABIQUES": "СТЕНЫ",
		"PINTADO": "КРАСКА",
		"TIRADOS": "СНЕСЕНО",
		"DESPINTADO": "БЕЗ КРАСКИ",
		"MANTEN PARA GUARDAR TODO": "ЗАЖМИ, ЧТОБЫ УБРАТЬ ВСЕ",
		"MANTEN PARA DEJARLO LIMPIO": "ЗАЖМИ, ЧТОБЫ ОЧИСТИТЬ",
		"MANTEN PARA ARRASAR": "ЗАЖМИ, ЧТОБЫ СНЕСТИ",
		"PLANOS": "ПЛАНИРОВКИ",
		"Cuartos ya repartidos, con sus puertas puestas.": "Комнаты уже размечены, двери на месте.",
		"Este terreno es demasiado chico para repartirlo en cuartos.": "Участок слишком мал, чтобы делить его на комнаты.",
		"LO QUE SE VA": "ЧТО УЙДЕТ",
		"El plano REEMPLAZA tu casa: tira tus paredes, borra la pintura y recoge tus muebles al inventario.": "Планировка ЗАМЕНЯЕТ твой дом: стены снесут, краску сотрут, а мебель вернется в инвентарь.",
		"PAREDES QUE HAY": "ТЕКУЩИЕ СТЕНЫ",
		"Aplicar un plano las tira todas y pone las suyas.": "Новая планировка снесет их все и поставит свои.",
		"DOS AMBIENTES": "ДВЕ ЗОНЫ",
		"Un muro con puerta: día de un lado, noche del otro.": "Одна стена с дверью: с одной стороны день, с другой — ночь.",
		"DOS RECÁMARAS": "ДВЕ СПАЛЬНИ",
		"TRES CUARTOS Y BAÑO": "ТРИ КОМНАТЫ И ВАННАЯ",
		"Añade un baño en la esquina de la entrada.": "Добавляет ванную в углу у входа.",
		"Dos cuartos al fondo, con su puerta cada uno, y el salón al frente.": "Две комнаты в глубине, у каждой своя дверь, а гостиная — спереди.",
		"CUATRO CUARTOS": "ЧЕТЫРЕ КОМНАТЫ",
		"Cocina aparte, salón al frente y dos cuartos al fondo.": "Отдельная кухня, гостиная спереди и две комнаты в глубине.",
		"PASILLO Y CUATRO CUARTOS": "КОРИДОР И ЧЕТЫРЕ КОМНАТЫ",
		"Un pasillo desde la puerta, dos cuartos por lado y el salón al fondo.": "Коридор от входной двери, по две комнаты с каждой стороны и гостиная в глубине.",
		"{0} cuartos": "Комнат: {0}",
		"O YA AMUEBLADA": "ИЛИ С МЕБЕЛЬЮ",





		"rotANULAR": "ОТМЕНА",
		"rotDESHAZ": "ОТКАТ",
		"rotCERRAR": "УБРАТЬ",
		"rotGIRAR": "КРУТИ",
		"rotMOVER": "СДВИГ",
		"rotOTRO": "ДРУГОЙ",
		"rotPINTAR": "КРАСКА",
		"rotPLANOS": "ПЛАНЫ",
		"rotQUITAR": "УБРАТЬ",
		"rotTAPAR": "ЗАШИТЬ",
		"rotTAPIAR": "ЗАШИТЬ",
		"rotTAPONA": "МЕШАЕТ",
		"rotTIRAR": "СНЕСТИ",
		"rotTRAMO": "СЕКЦИЯ",
		"rotVACIAR": "СБРОС",
		"rotVENTAN": "ОКНО",
		"En este plano no cabe el juego de muebles completo.": "В эту планировку полный комплект мебели не помещается.",
		"Llega con {0} muebles ya puestos en su sitio.": "Мебель уже расставлена: {0} шт.",
		"Sueltos costarían {0}": "По отдельности: {0}",
		"AMUEBLADA": "С МЕБЕЛЬЮ",
		"Calculando la oferta…": "Считаем предложение…",
		"COMPRAR AMUEBLADA · {0}": "КУПИТЬ С МЕБЕЛЬЮ · {0}",
		"PAGASTE": "ОПЛАЧЕНО",
		"Y de paso te acomodamos {0} muebles que ya tenías guardados.": "Заодно расставили и твою мебель со склада: {0} шт.",
		"Muévelo todo si quieres: la casa ya es tuya y nada está clavado.": "Двигай все как хочешь: дом уже твой, и ничего не прибито.",
		"MANTEN PARA PONER ESTE PLANO": "ЗАЖМИ, ЧТОБЫ ВЫБРАТЬ ПЛАН",
		"Tira TAMBIÉN el cascarón y las paredes de fábrica. Queda el terreno con su piso.": "Сносит ТАКЖЕ коробку дома и заводские стены. Остается участок с полом.",
		"Ni muebles, ni paredes, ni pintura: este terreno ya está pelado.": "Ни мебели, ни стен, ни краски: участок уже голый.",
		"{0} paredes": "Стен: {0}",
		"PLANO": "ПЛАН",
		"Muévelas, tíralas o ábreles más puertas: ahora son tuyas.": "Двигай их, сноси или прорубай новые двери: теперь они твои.",
		"MARCOS DE TODA LA CASA": "РАМЫ ПО ВСЕМУ ДОМУ",
		"Puertas, ventanas, corredizas, rodapiés y remates.": "Двери, окна, раздвижные двери, плинтусы и наличники.",
		"PONER CORREDIZA": "РАЗДВИЖНАЯ ДВЕРЬ",
		"QUITAR CORREDIZA": "УБРАТЬ РАЗДВИЖНУЮ",
		"PARED CORTA": "КОРОТКАЯ СТЕНА",
		"CORRED": "РАЗДВ.",
		"CORTA": "МАЛА",
		"TAPAR": "ЗАШИТЬ",
		"YA ESTA PELADO": "УЖЕ ПУСТО",
		"TIRAR TODO EL TRAMO": "СНЕСТИ ВСЮ СЕКЦИЮ",
		"NO HAY NADA PUESTO": "НЕЧЕГО УБИРАТЬ",
		"YA ESTA LIMPIO": "УЖЕ ЧИСТО",
		"Recoge tus muebles al inventario. Las paredes y la pintura se quedan.": "Убирает мебель в инвентарь. Стены и краска остаются.",
		"Además tira tus tabiques, cierra los boquetes y borra la pintura del suelo.": "А также сносит твои перегородки, заделывает проемы и стирает краску с пола.",
		"Nada se pierde: todo lo que compraste sigue en tu inventario.": "Ничего не пропадет: все купленное остается в инвентаре.",
		"Esta planta ya está vacía: todo lo tuyo está en el inventario.": "Этот этаж уже пуст: все твое лежит в инвентаре.",
		"Ni muebles puestos, ni tabiques tuyos, ni pintura: no hay nada que quitar.": "Ни расставленной мебели, ни твоих стен, ни краски: убирать нечего.",
		"YA ESTA": "ГОТОВО",
		"A CAJAS": "В ЯЩИКИ",
		"VALOR DE MERCADO": "СТОИМОСТЬ",
		"TU SITIO EN EL EQUIPO": "ТВОЕ МЕСТО В КОМАНДЕ",
		"ROL DE CONTRATO": "РОЛЬ ПО КОНТРАКТУ",
		"PRÓXIMO PARTIDO": "СЛЕДУЮЩИЙ МАТЧ",
		"{0} · ~{1} MIN": "{0} · ~{1} МИН.",
		"ÚLTIMO PARTIDO": "ПРОШЛЫЙ МАТЧ",
		"{0} MIN · {1}": "{0} МИН. · {1}",
		"NO JUGASTE": "НЕ ИГРАЛ",
		"FORMA · {0}": "ФОРМА · {0}",
		"MEDIA TEMPORADA": "ОЦЕНКА СЕЗОНА",
		"MEDIA CARRERA": "ОЦЕНКА КАРЬЕРЫ",
		"HABILIDADES · {0} PUNTOS": "НАВЫКИ · ОЧКОВ: {0}",
		"HABILIDADES · TODO AL TOPE": "НАВЫКИ · ВСЕ НА МАКСИМУМЕ",
		"Ya no queda nada que subir: los puntos que ganes se convierten en experiencia.": "Качать больше нечего: заработанные очки превращаются в опыт.",
		"Penales": "Пенальти",
		"Tiros libres y córners": "Штрафные и угловые",
		"{0}: los lanzas TÚ": "{0}: бьешь ТЫ",
		"{0}: los lanza {1} — tú cobras ~{2} de cada 10":
			"{0}: бьет {1} — тебе достается ~{2} из 10",
		"{0}: los lanza {1} — supéralo para quitárselos":
			"{0}: бьет {1} — обойди его, чтобы бить самому",
		"SU NIVEL": "ЕГО НАВЫК",
		"TU NIVEL": "ТВОЙ НАВЫК",
		"TÚ COBRAS": "БЬЕШЬ ТЫ",
		"En racha (+{0})": "На подъеме (+{0})",
		"En baja ({0})": "Спад ({0})",
		"Estable": "Стабильно",



		"Potencia": "Сила удара",
		"Precisión": "Точность",
		"Efecto": "Подкрутка",
		"Visión": "Видение",
		"Físico": "Физика",
		"Velocidad": "Скорость",
		"Aceleración": "Ускорение",
		"Regate": "Дриблинг",
		"Balón parado": "Стандарты",


		"Pegada": "Удар",
		"Puntería": "Реализация",
		"Rosca": "Подкрутка",
		"Cabeza": "Игра головой",

		"Reflejos": "Реакция",
		"Entrada": "Отбор",
		"{0} · MEDIA {1}": "{0} · OVR {1}",
		"TE PELEA EL PUESTO": "ТВОЙ КОНКУРЕНТ",
		"VER PLANTEL": "СОСТАВ",



		"La velocidad a la que sale el balón de tu pie. Sólo la entregas entera si le pegas al empeine.":
			"Скорость, с которой мяч уходит с ноги. Полностью она достается только при чистом ударе подъемом.",
		"Cuánto respeta el balón la línea que trazaste. Cierra el abanico de error del apuntador.":
			"Насколько точно мяч следует проведенной тобой линии. Сужает разброс прицела.",
		"Cuánto comba el balón en el aire. También es el toque con el que conduces en el regate.":
			"Насколько сильно мяч закручивается в воздухе. А еще это касание, которым ты ведешь мяч в дриблинге.",
		"Desde 85 ves dibujada la línea de fuera de juego. El árbitro la pita igual sin ella.":
			"С 85 ты видишь линию офсайда на поле. Судья фиксирует офсайд и без нее.",
		"Lo rápido que corres con el balón en el regate: si eres lento te la quitan, si eres rápido no te alcanzan. No toca el tiro.":
			"Как быстро ты бежишь с мячом в дриблинге: медленного обберут, быстрого не догонят. На удар не влияет.",
		"Qué tan rápido llegas a tu velocidad máxima: el arranque, el frenazo y la marcha atrás al conducir.":
			"Как быстро ты набираешь максимальную скорость: рывок, торможение и разворот с мячом.",
		"Tu control del balón en carrera: el quiebre sin perder velocidad y a qué distancia te lo pueden robar.":
			"Контроль мяча на скорости: смена направления без потери темпа и то, с какого расстояния у тебя могут отобрать мяч.",
		"DE PARADO A TU MÁXIMA EN {0} S": "С МЕСТА ДО МАКСИМУМА ЗА {0} С",
		"TE ROBAN A {0} CM DEL BALÓN": "ОТБИРАЮТ С {0} СМ",
		"Cada punto sobre el lanzador de tu equipo te da más penales. NO cuenta para tu media.":
			"Каждое очко сверх уровня штатного пенальтиста команды дает тебе больше пенальти. На твой рейтинг НЕ влияет.",
		"Cada punto sobre el lanzador de tu equipo te da más faltas y córners. NO cuenta para tu media.":
			"Каждое очко сверх уровня штатного исполнителя команды дает тебе больше штрафных и угловых. На твой рейтинг НЕ влияет.",
		"TU TIRO: {0} KM/H": "ТВОЙ УДАР: {0} КМ/Ч",
		"TU CABEZAZO: {0} KM/H": "УДАР ГОЛОВОЙ: {0} КМ/Ч",
		"A {0} M EL BALÓN SALE DENTRO DE ±{1} CM": "НА {0} М МЯЧ ЛЕТИТ В ПРЕДЕЛАХ ±{1} СМ",
		"SIN ABANICO: EL BALÓN VA POR DONDE APUNTAS": "БЕЗ РАЗБРОСА: МЯЧ ЛЕТИТ КУДА ЦЕЛИШЬСЯ",
		"COMBA ×{0}": "ДУГА ×{0}",
		"VES LA LÍNEA DE FUERA DE JUEGO EN LA CANCHA": "ТЫ ВИДИШЬ ЛИНИЮ ОФСАЙДА НА ПОЛЕ",
		"TE FALTAN {0} PARA VER LA LÍNEA DE FUERA DE JUEGO": "ЕЩЕ {0} — И УВИДИШЬ ЛИНИЮ ОФСАЙДА",
		"CORRES A {0} M/S · EL DEFENSA MÁS RÁPIDO, {1}":
			"ТЫ: {0} М/С · БЫСТРЕЙШИЙ ЗАЩИТНИК: {1}",
		"LOS COBRAS TODOS": "БЬЕШЬ ТОЛЬКО ТЫ",
		"COBRAS {0} DE CADA 10": "БЬЕШЬ {0} ИЗ 10",
		"DESHACER": "ОТМЕНИТЬ",
		"PUNTO DEVUELTO · {0}": "ОЧКО ВЕРНУЛОСЬ · {0}",
		"Al salir del perfil, lo repartido queda firmado.":
			"Когда выйдешь из профиля, распределенные очки закрепятся.",
		"ESPORÁDICO": "РЕЗЕРВ",
		"ROTACIÓN": "РОТАЦИЯ",

		"MEDIA {0}": "ОЦЕНКА {0}",
		"MEDIA {0} EN {1} JORNADAS": "ОЦЕНКА {0} · ТУРОВ: {1}",
		"{0} de {1} · {2}/{3} jornadas": "{0} из {1} · туры: {2}/{3}",
		"JUGAR {0} JORNADAS": "СЫГРАТЬ ТУРОВ: {0}",
		"JUGAR {0} JORNADAS DE {1}' O MÁS": "ТУРОВ ПО {1}' И БОЛЕЕ: {0}",
		"{0} GOLES": "ГОЛЫ: {0}",
		"CONTRATO": "КОНТРАКТ",
		"Club: {0} ({1})": "Клуб: {0} ({1})",
		"Sueldo: ${0} por partido": "Зарплата: ${0} за матч",
		"Temporadas restantes: {0}": "Осталось сезонов: {0}",
		"tu club": "твой клуб",
		"CEDIDO · el contrato es con {0}": "В АРЕНДЕ · владелец контракта: {0}",
		"Mantenimiento del estilo de vida: -${0} por partido":
			"Расходы на образ жизни: -${0} за матч",
		"OBJETIVO DE TEMPORADA": "ЦЕЛЬ НА СЕЗОН",

		"CLÁUSULA PERSONAL": "ЛИЧНОЕ УСЛОВИЕ",
		"Sin cláusula. Una condición con dientes a cambio de renunciar a las otras.":
			"Без особого условия. Одно жесткое условие в обмен на отказ от остальных.",
		"ANTI-DESCENSO": "НА СЛУЧАЙ ВЫЛЕТА",
		"Si el club baja de categoría, quedas AGENTE LIBRE.":
			"Если клуб вылетит, ты становишься СВОБОДНЫМ АГЕНТОМ.",
		"PROMESA DE TITULARIDAD": "МЕСТО В ОСНОВЕ",
		"Si juegas pocos partidos esta temporada, quedas AGENTE LIBRE.":
			"Если сыграешь мало матчей в этом сезоне, станешь СВОБОДНЫМ АГЕНТОМ.",
		"NO A UN RIVAL": "НЕ К СОПЕРНИКУ",
		"Tu club no puede venderte a tu rival de siempre.":
			"Клуб не может продать тебя принципиальному сопернику.",
		"ELEGIR CLÁUSULA": "ВЫБРАТЬ УСЛОВИЕ",
		"CAMBIAR CLÁUSULA": "СМЕНИТЬ УСЛОВИЕ",
		"La cláusula se pacta al arranque de la temporada.":
			"Условие согласовывается в начале сезона.",
		"Sólo una a la vez. Se pacta al arranque de la temporada.":
			"Только одно за раз. Согласовывается в начале сезона.",
		"SIN CLÁUSULA": "БЕЗ УСЛОВИЯ",
		"CLÁUSULA PACTADA": "УСЛОВИЕ ПРИНЯТО",
		"ES TU RIVAL: tu CLÁUSULA impide que acabes aquí.":
			"ЭТО ТВОЙ СОПЕРНИК: твое УСЛОВИЕ в контракте не даст тебе здесь оказаться.",
		"CLÁUSULA ANTI-DESCENSO: el club bajó y quedas AGENTE LIBRE.":
			"УСЛОВИЕ НА СЛУЧАЙ ВЫЛЕТА: клуб вылетел, и ты СВОБОДНЫЙ АГЕНТ.",
		"PROMESA DE TITULARIDAD incumplida ({0} partidos): quedas AGENTE LIBRE.":
			"Условие МЕСТО В ОСНОВЕ нарушено (матчей: {0}): ты СВОБОДНЫЙ АГЕНТ.",

		"PACTAR OBJETIVO": "ОБСУДИТЬ ЦЕЛЬ",
		"PACTAR EL OBJETIVO": "ОБСУЖДЕНИЕ ЦЕЛИ",
		"Más exigente paga más prima; más cómodo, menos. Se pacta una vez, al arranque de la temporada.":
			"Чем сложнее цель, тем больше бонус; чем проще — тем меньше. Согласовывается один раз, в начале сезона.",
		"CÓMODO": "ЛЕГЧЕ",
		"COMO ESTÁ": "КАК ЕСТЬ",
		"EXIGENTE": "СЛОЖНЕЕ",
		"OBJETIVO PACTADO": "ЦЕЛЬ СОГЛАСОВАНА",
		"Ya pactaste tu objetivo esta temporada.": "Ты уже согласовал цель на этот сезон.",
		"top {0}": "топ-{0}",
		"{0} asist.": "{0} асс.",
		"{0} part.": "{0} матч.",
		"nota {0}": "оценка {0}",
		"{0} goles": "{0} гол.",
		"RENOVAR CONTRATO": "ПРОДЛИТЬ",


		"LA OFERTA DEL CLUB": "ПРЕДЛОЖЕНИЕ КЛУБА",
		"AÑOS QUE OFRECEN": "СРОК КОНТРАКТА",
		"NINGUNO": "НЕТ",
		"SUELDO NUEVO": "НОВАЯ ЗАРПЛАТА",


		"EQUILIBRIO": "БАЛАНС",
		"MÁS AÑOS": "ДОЛЬШЕ",
		"LIBERTAD": "СВОБОДА",
		"PRIMA DE FIRMA": "БОНУС ЗА ПОДПИСЬ",
		"CLÁUSULA": "ОТСТУПНЫЕ",
		"Cobras $ {0} de prima al firmar.": "Получаешь бонус за подписание: $ {0}.",
		"Cláusula baja: si un club la paga, el tuyo no puede negarse.":
			"Низкие отступные: если клуб их заплатит, твой не сможет отказать.",
		"Cláusula en $ {0}: quien la pague, te lleva.":
			"Отступные — $ {0}: кто заплатит, тот и забирает.",

		"BANDERA":
			"СИМВОЛ",
		"Tu grada frena tu venta: cobras más y el club te blinda con una cláusula un {0} % más alta.":
			"Трибуны не дают тебя продать: ты получаешь больше, а клуб защищает тебя отступными на {0} % выше.",
		"Cláusula en $ {0}: tu grada frena tu venta.":
			"Отступные — $ {0}: трибуны не дают тебя продать.",
		"Aceptaste salir: tu grada ya no te quiere y el club te ofrece a quien pregunte, más barato. Sigues jugando mientras llega tu destino.":
			"Ты согласился уйти: болельщики тебя больше не хотят, и клуб дешевле предлагает тебя всем желающим. Ты играешь, пока не определится твой новый клуб.",
		"TU GRADA TE QUIERE FUERA":
			"БОЛЕЛЬЩИКИ ПРОТИВ ТЕБЯ",
		"Negarte no te cuesta nada: el club no necesita tu dinero, necesita que dejen de pitarte. Si aceptas, te venden más barato.":
			"Отказаться тебе ничего не стоит: клубу не нужны твои деньги, ему нужно, чтобы тебя перестали освистывать. Если согласишься, тебя продадут дешевле.",
		"Te quedas, y en el vestuario nadie te lo reprocha. La grada no cambia sola: esa hay que ganársela en el campo.":
			"Ты остаешься, и в раздевалке никто тебя не упрекнет. Трибуны сами не передумают: их придется завоевывать на поле.",
		"Te sientan en el vestuario con el director deportivo. En {0} la grada ya no te quiere y el club la escucha: te ofrecen a quien pregunte, y más barato. Si te quedas, nadie aquí dentro te lo reprocha.":
			"Тебя усаживают в раздевалке вместе со спортивным директором. Болельщики клуба {0} тебя больше не хотят, и клуб к ним прислушивается: тебя предложат всем желающим, причем дешевле. Если останешься, здесь тебя никто не упрекнет.",

		"La ficha sale de: {0}": "Из чего складывается зарплата: {0}",
		"tu nivel": "твой уровень",
		"tu prestigio": "твой престиж",
		"tus títulos": "твои титулы",
		"tu afición": "твои болельщики",
		"tus récords": "твои рекорды",
		"su interés": "их интерес",
		"tu temporada": "твой сезон",
		"Quedan {0} · al firmar tendrías {1} en total":
			"Осталось лет: {0} · после подписания всего: {1}",
		"Tu sueldo {0} de $ {1} a $ {2} por partido":
			"Твоя зарплата {0} с $ {1} до $ {2} за матч",
		"sube": "вырастет",
		"baja": "снизится",
		"Te renuevan con el mismo sueldo.": "Тебе продлевают контракт на той же зарплате.",
		"Te firman como {0}": "Подписывают на роль: {0}",
		"Por tu temporada: {0}{1}% sobre el sueldo":
			"За твой сезон: {0}{1}% к зарплате",
		"Es el techo salarial del club: no pueden pagar más.":
			"Это потолок зарплат клуба: больше они платить не могут.",
		"Negocian sobre tu ficha actual: nadie da más salto en una firma.": "Торг идет от твоей нынешней зарплаты: за одно подписание никто не прыгает выше.",
		"¿RENOVAR?": "ПРОДЛИТЬ?",
		"{0} años más (tendrías {1}) y ficha de $ {2} por partido.":
			"Еще лет: {0} (всего будет {1}) и зарплата $ {2} за матч.",
		"Es MENOS de lo que cobras ahora.": "Это МЕНЬШЕ, чем ты получаешь сейчас.",


		"CONTRATO RENOVADO": "КОНТРАКТ ПРОДЛЕН",


		"SOLO EN TU ÚLTIMO AÑO": "В ПОСЛЕДНИЙ ГОД",
		"EL TÉCNICO NO RENUEVA": "ТРЕНЕР ПРОТИВ",




		"RENEGOCIAR": "ПЕРЕСМОТР",
		"PEDIR RENEGOCIACIÓN": "ПЕРЕСМОТР КОНТРАКТА",
		"LO QUE PUEDES PEDIR": "ЧТО МОЖНО ПРОСИТЬ",
		"AÑOS QUE SUMAS": "ДОП. ГОДЫ",
		"PRIMAS PACTADAS": "БОНУСЫ",
		"MESA DE CONTRATO": "ПЕРЕГОВОРЫ",
		"CONTRATO MEJORADO": "КОНТРАКТ УЛУЧШЕН",
		"Tu sueldo sube de $ {0} a $ {1} por partido":
			"Твоя зарплата вырастет с $ {0} до $ {1} за матч",
		"Te reconocen como {0}": "Твоя новая роль: {0}",
		"Por tu temporada: +{0}% sobre el sueldo": "За твой сезон: +{0}% к зарплате",
		"Sueldo: $ {0} → $ {1} (+$ {2})": "Зарплата: $ {0} → $ {1} (+$ {2})",
		"Años: +{0} (tendrías {1})": "Годы: +{0} (всего будет {1})",
		"Prima por gol: +$ {0}": "Бонус за гол: +$ {0}",
		"Prima por asistencia: +$ {0}": "Бонус за ассист: +$ {0}",
		"Rol: te reconocen como {0}": "Роль: теперь ты — {0}",
		"Para renegociar antes: {0}": "Чтобы пересмотреть раньше: {0}",


		"Eres agente libre: negocia con un club nuevo.":
			"Ты свободный агент: договаривайся с новым клубом.",
		"Estás cedido: tu contrato lo lleva el club dueño.":
			"Ты в аренде: твоим контрактом распоряжается клуб-владелец.",
		"Ya firmaste un precontrato con otro club.":
			"Ты уже подписал предварительный контракт с другим клубом.",
		"El club te dio por perdido; no hay mesa.":
			"Клуб поставил на тебе крест: переговоров не будет.",
		"Pediste salir: arréglalo con el club antes de negociar.":
			"Ты попросился уйти: сначала уладь это с клубом, потом торгуйся.",
		"Es tu último año: el club ya te ofrece renovar.":
			"Это твой последний год: клуб уже предлагает продление.",
		"Acabas de firmar: cumple una temporada antes de pedir mejora.":
			"Ты только что подписал контракт: отыграй сезон, прежде чем просить больше.",
		"Te queda mucho contrato: el club no tiene por qué moverlo.":
			"У тебя еще долгий контракт: клубу незачем его трогать.",
		"El club no negocia fichas con el mercado cerrado.":
			"Клуб не обсуждает зарплаты, пока трансферное окно закрыто.",
		"El club no se sentó contigo este año. Vuelve la temporada que viene.":
			"В этом году клуб не сел с тобой за стол. Приходи в следующем сезоне.",
		"FIRMAR LA MEJORA":
			"ПРИНЯТЬ УСЛОВИЯ",
		"El club ya cuenta con tu salida: no te convoca.":
			"Клуб уже смирился с твоим уходом: тебя не заявляют.",
		"Renueva o busca club, o no juegas.":
			"Продли контракт или найди клуб — иначе не играешь.",
		"Una bala al año. Si fallas, esperas.":
			"Один выстрел в год. Промахнешься — жди.",
		"PEDIR MESA AL CLUB":
			"ПОПРОСИТЬ ПЕРЕГОВОРЫ",
		"SE SIENTAN":
			"СЯДУТ ЗА СТОЛ",
		"Se sientan contigo un {0}% de las veces. Si dicen que no, no habrá mesa esta temporada.":
			"Клуб садится с тобой за стол в {0}% случаев. Если откажут, переговоров в этом сезоне не будет.",
		"PEDIR MESA":
			"ПЕРЕГОВОРЫ",
		"SE SIENTAN CONTIGO":
			"ПЕРЕГОВОРЫ БУДУТ",
		"NO HAY MESA ESTE AÑO":
			"ПЕРЕГОВОРОВ НЕ БУДЕТ",
		"Ya renegociaste esta temporada. Vuelve el año que viene.":
			"Ты уже пересматривал контракт в этом сезоне. Приходи в следующем году.",
		"Aún no jugaste lo suficiente esta temporada.":
			"Ты пока мало сыграл в этом сезоне.",
		"Sube tu media a {0} para sentarte a negociar.":
			"Подними среднюю оценку до {0}, чтобы сесть за стол переговоров.",
		"Gánate al técnico antes de pedir mejora.":
			"Сначала заслужи доверие тренера, потом проси больше.",
		"EN EL ESCAPARATE": "В ПРОДАЖЕ",
		"No renuevas: el club te vende y juegas menos hasta que salgas.":
			"Ты не продлеваешь: клуб тебя продает, и до ухода ты будешь играть меньше.",
		"Busca una salida en el MERCADO, o aguanta el año y quedarás AGENTE LIBRE al"
		+ " final.":
			"Найди выход на РЫНКЕ или дотерпи год и в конце уйдешь СВОБОДНЫМ АГЕНТОМ.",
		"NO RENOVAR": "НЕ ПРОДЛЕВАТЬ",
		"¿NO RENOVAR?": "НЕ ПРОДЛЕВАТЬ?",
		"El club te pondrá en venta para no perderte gratis. Si no sales, jugarás menos"
		+ " el resto del año. Si aguantas, quedarás libre al final.":
			"Клуб выставит тебя на продажу, чтобы не потерять бесплатно. Если не уйдешь, до конца года будешь играть меньше. Если дотерпишь, в конце уйдешь свободным.",
		"NO RENUEVO": "НЕ ПРОДЛЕВАЮ",
		"NO RENUEVAS · EL CLUB TE VENDE": "БЕЗ ПРОДЛЕНИЯ · КЛУБ ТЕБЯ ПРОДАЕТ",
		"EL CLUB TE VENDE": "КЛУБ ТЕБЯ ПРОДАЕТ",
		"EL FINAL": "КОНЕЦ",
		"Los años ya pesan. Puedes seguir peleando... o cerrar la carrera y entrar en"
		+ " la historia con lo que ganaste.":
			"Годы дают о себе знать. Можно бороться дальше... или завершить карьеру и войти в историю с тем, что выиграл.",
		"Juegues lo que juegues, a los {0} años se acaba: te queda {1} temporada.": "Сколько ни играй, в {0} все закончится: у тебя остался {1} сезон.",
		"Juegues lo que juegues, a los {0} años se acaba: te quedan {1} temporadas.":
			"Сколько ни играй, в {0} все закончится. Осталось сезонов: {1}.",
		"COLGAR LAS BOTAS": "ПОВЕСИТЬ БУТСЫ",
		"MEJOR NO": "ПОКА НЕТ",
		"¿COLGAR LAS BOTAS?": "ПОВЕСИТЬ БУТСЫ?",
		"Se acaba de verdad: no hay más partidos. Tu legado, tu vitrina y tu historia"
		+ " quedan guardados para siempre.":
			"Это действительно конец: матчей больше не будет. Твое наследие, витрина трофеев и история сохранятся навсегда.",
		"ME RETIRO": "ЗАВЕРШАЮ",
		"MANTÉN PARA RETIRARTE": "ЗАЖМИ, ЧТОБЫ ЗАВЕРШИТЬ",
		"AÚN ME QUEDA FÚTBOL": "Я ЕЩЕ ПОИГРАЮ",
		"Termina {0} o mejor en la liga.": "Цель: {0} в лиге или выше.",
		"La liga aún no arranca.": "Лига еще не стартовала.",
		"Vas {0}{1}": "Сейчас: {0}{1}",
		"sin clasificar": "вне зачета",
		"Da {0} asistencias  (llevas {1})": "Отдай ассистов: {0}  (сейчас {1})",
		"Marca {0} goles  (llevas {1})": "Забей голов: {0}  (сейчас {1})",
		"TU VALOR": "СТОИМОСТЬ",
		"TE PIDEN": "ПРОСЯТ",
		"EN LISTA": "ВЫСТАВЛЕН",
		"CONTRATO CORTO": "КРАТКИЙ КОНТРАКТ",
		"Tu agente está en {0}: te consigue {1} oferta(s) por ventana.":
			"Уровень агента: {0}. Он находит тебе предложений за окно: {1}.",
		"LOS OJEADORES": "СКАУТЫ",
		"Un club mira tres cosas y te juzga por la más floja. Para que te busque un"
		+ " grande, tienes que ser bueno en las tres.":
			"Клуб смотрит на три вещи и судит по самой слабой. Чтобы тобой заинтересовался гранд, нужно быть хорошим во всех трех.",
		"Fama": "Слава",
		"Que te conozcan: prensa y afición.": "Чтобы тебя знали: пресса и болельщики.",
		"Nivel": "Уровень",
		"Tus habilidades frente a la élite.": "Твои навыки в сравнении с элитой.",
		"Forma": "Форма",
		"Tu media de la temporada: {0}.": "Твоя средняя оценка за сезон: {0}.",
		"Verano: fechas 1 a {0}. Invierno: {1} a {2}. Hoy es la {3}.":
			"Летнее окно: туры с 1 по {0}. Зимнее: с {1} по {2}. Сейчас тур {3}.",
		"TU CLUB TE VENDE": "КЛУБ ТЕБЯ ПРОДАЕТ",
		"Dijiste que no renuevas: el club te ofrece para no perderte gratis. Mientras"
		+ " no salgas, juegas menos. Elige una salida:":
			"Ты сказал, что не продлеваешь, и клуб предлагает тебя другим, чтобы не потерять бесплатно. Пока не уйдешь, будешь играть меньше. Выбери выход:",
		"ESTÁS EN VENTA": "ТЫ НА ПРОДАЖЕ",
		"Aceptaste salir: el club te ofrece a quien pregunte para hacer caja. Sigues"
		+ " jugando mientras llega tu destino.":
			"Ты согласился уйти: клуб предлагает тебя всем желающим, чтобы заработать. Ты играешь, пока не определится твой новый клуб.",
		"ULTIMO DIA · mañana se cierra": "ПОСЛЕДНИЙ ДЕНЬ · завтра закрывается",
		"Cierra en {0} jornadas. Lo que hagas en el campo mueve las ofertas: hay clubes"
		+ " que entran y clubes que se van.":
			"До закрытия туров: {0}. Твоя игра на поле двигает предложения: одни клубы приходят, другие уходят.",
		"Nadie ha preguntado por ti. Rinde y hazte ver.":
			"Тобой никто не интересовался. Играй хорошо и попадись на глаза.",


		"FICHAJES": "ТРАНСФЕРЫ",
		"RECIENTES": "СВЕЖИЕ",
		"MAS CAROS": "ДОРОГИЕ",
		"MUNDO": "МИР",
		"MI JUGADOR": "МОЙ ИГРОК",
		"DIVISION": "ДИВИЗИОН",
		"TU LIGA": "ТВОЯ ЛИГА",
		"Ningún movimiento en tu liga todavía.": "В твоей лиге пока никаких переходов.",


		"Tu vestuario sigue igual: ni una alta ni una baja.":
			"В твоей раздевалке без перемен: ни одного прихода, ни одного ухода.",
		"Sin club: nadie entra ni sale de un vestuario que no tienes.":
			"Нет клуба: в раздевалку, которой у тебя нет, никто не приходит и никто не уходит.",
		"El mercado todavía no se ha movido.": "На рынке пока затишье.",
		"EN TU VESTUARIO": "В ТВОЕЙ КОМАНДЕ",
		"MANTÉN · TRASPASO": "ЗАЖМИ · ТРАНСФЕР",
		"MANTÉN · CESIÓN": "ЗАЖМИ · АРЕНДА",
		"VENDIDO": "ПРОДАН",
		"LLEGA": "ПРИХОД",
		"SE VA": "УХОД",
		"DEJA EL CLUB": "УХОДИТ",



		"{0} ALTA": "ПРИХОД: {0}",
		"{0} ALTAS": "ПРИХОДЫ: {0}",
		"{0} BAJA": "УХОД: {0}",
		"{0} BAJAS": "УХОДЫ: {0}",
		"De {0} a {1}": "{0} — {1}",
		"Cedido de {0} a {1}": "Аренда: {0} — {1}",
		"Deja {0}": "Уходит из клуба {0}",
		"LIBRE": "БЕСПЛ.",
		"ERES AGENTE LIBRE": "ТЫ СВОБОДНЫЙ АГЕНТ",
		"Tu contrato terminó. Fichas SIN traspaso (Bosman): el club se ahorra el fee y"
		+ " una parte es tu PRIMA de fichaje. El rol que te espera se dice antes de firmar"
		+ " — elige con cabeza.":
			"Твой контракт истек. Ты переходишь БЕЗ трансферной суммы (Босман): клуб экономит на трансфере, и часть этих денег достается тебе в виде БОНУСА за подписание. Роль, которая тебя ждет, называют до подписания — выбирай с умом.",
		"Tu valor: $ {0}": "Твоя стоимость: $ {0}",
		"Ningún club por ahora. Vuelve a intentarlo más tarde.":
			"Пока ни одного клуба. Попробуй позже.",
		"{0} OPCIONES A TU NIVEL": "ПОД ТВОЙ УРОВЕНЬ: {0}",
		"TU CLUB QUIERE RETENERTE": "КЛУБ ХОЧЕТ ТЕБЯ УДЕРЖАТЬ",
		"Te mejora el contrato para que te quedes:":
			"Клуб улучшает контракт, чтобы ты остался:",
		"Sueldo: ${0} por partido (ahora ${1})": "Зарплата: ${0} за матч (сейчас ${1})",
		"Contrato: {0} temporadas": "Контракт: {0} сез.",
		"Eres un ídolo de la casa: {0} temporadas aquí.":
			"Ты кумир этого клуба. Сезонов здесь: {0}.",
		"RENOVAR Y QUEDARME": "ПРОДЛИТЬ И ОСТАТЬСЯ",
		"RENOVADO · TE QUEDAS": "ПРОДЛЕН · ТЫ ОСТАЕШЬСЯ",
		"EL CLUB NECESITA VENDERTE": "КЛУБУ НУЖНО ТЕБЯ ПРОДАТЬ",


		"RIESGO DE VENTA": "РИСК ПРОДАЖИ",
		"VENTANA EN {0}J": "ДО ОКНА {0} ТУР.",
		"POR TU GRADA": "ИЗ-ЗА ТРИБУН",
		"AFICIÓN A {0}": "ТРИБУНЫ: {0}",
		"Y ESTÁS A SALVO": "И ТЫ СПАСЕН",
		"SALVO ASCENSO": "ЕСЛИ НЕ ПОВЫШЕНИЕ",
		"O EUROPA": "ИЛИ ЕВРОКУБКИ",
		"En {0} no pueden pagarte: venderte les cuadra las cuentas. Negarte tiene precio en el vestuario:":
			"Клуб {0} не тянет твою зарплату: продажа сводит им бюджет. Отказ будет стоить тебе в раздевалке:",
		"Negarte: técnico {0} · equipo {1} · afición {2}":
			"Отказ: тренер {0} · команда {1} · болельщики {2}",


		"El club te quiso vender y te plantaste. Después de este año, te lo"
			+ " reconocen: el vestuario te lo devuelve.":
			"Клуб хотел тебя продать, а ты уперся. После этого сезона это признают: раздевалка возвращает тебе должок.",
		"TENÍAS RAZÓN": "ТЫ БЫЛ ПРАВ",
		"Te querían vender y dijiste que no. El año te dio la razón, y el"
			+ " club sale a decirlo delante de todos.":
			"Тебя хотели продать, а ты сказал «нет». Сезон показал, что ты был прав, и клуб говорит об этом при всех.",
		"HAY OTRA MANERA": "ЕСТЬ ДРУГОЙ ПУТЬ",
		"ENTONCES, PON TÚ": "ТОГДА ПЛАТИ САМ",
		"El director deportivo te escucha y no dice que no. Pero el agujero"
			+ " de {0} sigue ahí, y si no sale de tu traspaso tiene que salir de tu"
			+ " contrato. Elige por dónde.":
			"Спортивный директор выслушивает тебя и не говорит «нет». Но дыра в бюджете клуба {0} никуда не делась, и если ее не закроет твой трансфер, ее закроет твой контракт. Выбирай, как.",
		"FICHA: {0}/sem": "ЗАРПЛАТА: {0}/нед.",
		"CLÁUSULA: {0}": "ОТСТУПНЫЕ: {0}",
		"O te quedas pagándolo tú: el club retira la venta dos temporadas y"
			+ " refuerza en el próximo mercado de verano. Elige por dónde pagas.":
			"Или остаешься и платишь сам: клуб снимает тебя с продажи на два сезона и усиливается в следующее летнее окно. Выбирай, чем платить.",
		"ME BAJO LA FICHA A {0}/sem": "СНИЖАЮ ЗАРПЛАТУ ДО {0}/нед.",
		"¿TE BAJAS LA FICHA?": "СНИЗИШЬ ЗАРПЛАТУ?",
		"Cobras menos lo que reste de contrato, pero el club retira la venta"
			+ " y refuerza. Sigues libre de salir cuando quieras.":
			"До конца контракта получаешь меньше, но клуб снимает тебя с продажи и усиливается. Уйти ты по-прежнему можешь когда захочешь.",
		"ME SUBO LA CLÁUSULA A {0}": "ПОДНИМАЮ ОТСТУПНЫЕ ДО {0}",
		"¿TE SUBES LA CLÁUSULA?": "ПОДНИМЕШЬ ОТСТУПНЫЕ?",
		"No cobras menos, pero te blindas: salir de aquí costará mucho más y"
			+ " firmas {0} temporada más.":
			"Зарплата не падает, но ты защищен: уйти отсюда будет стоить гораздо дороже, и ты подписываешь еще {0} сезон.",
		"ACEPTO SALIR": "СОГЛАСЕН УЙТИ",
		"¿ACEPTAS SALIR?": "СОГЛАСЕН УЙТИ?",
		"El club te ofrecerá a quien pregunte y verás más ofertas. Sigues jugando"
		+ " mientras tanto.":
			"Клуб предложит тебя всем желающим, и предложений станет больше. А пока ты продолжаешь играть.",
		"ACEPTO": "ПРИНЯТЬ",
		"ME NIEGO": "ОТКАЗ",
		"¿TE NIEGAS A SALIR?": "ОТКАЗЫВАЕШЬСЯ УЙТИ?",
		"Te quedas, pero el club contaba con ese traspaso: bajan técnico, equipo y"
		+ " afición.":
			"Ты остаешься, но клуб рассчитывал на этот трансфер: падает доверие тренера, команды и болельщиков.",
		"ME QUEDO": "ОСТАЮСЬ",
		"EL CLUB TE BUSCA MINUTOS": "КЛУБ ИЩЕТ ТЕБЕ ПРАКТИКУ",
		"En {0} no cuentan contigo para jugar y no te lo ocultan: te ofrecen salir"
		+ " CEDIDO una temporada, a un club donde seas titular. Puedes negarte, pero te"
		+ " quedas justo donde no juegas.":
			"В клубе {0} на тебя не рассчитывают и не скрывают этого: предлагают уйти В АРЕНДУ на сезон, в клуб, где ты будешь в основе. Можешь отказаться, но останешься там, где не играешь.",
		"Negarte: técnico {0} · equipo {1} · y esta temporada, ni la copa":
			"Отказ: тренер {0} · команда {1} · а в этом сезоне даже кубка не будет",
		"Destino: {0}": "Куда: {0}",
		"ME VOY CEDIDO": "УХОЖУ В АРЕНДУ",
		"¿SALIR CEDIDO?": "УЙТИ В АРЕНДУ?",
		"Una temporada jugando de titular en un club menor. Vuelves al terminar, y"
		+ " creces más rápido mientras estás fuera.":
			"Сезон в основе в клубе поскромнее. Вернешься по его окончании, а вдали будешь расти быстрее.",
		"ME VOY": "УХОЖУ",
		"¿TE QUEDAS?": "ОСТАЕШЬСЯ?",
		"Seguirás sin jugar y el técnico se lo tomará mal. Esta temporada perderás"
		+ " hasta los partidos de rotación.":
			"Ты так и не будешь играть, а тренер воспримет это плохо. В этом сезоне ты лишишься даже матчей в ротации.",
		"TU CLUB NO TE VENDE": "КЛУБ ТЕБЯ НЕ ПРОДАСТ",
		"Con contrato largo y rindiendo, tu club prefiere retenerte. Puedes forzar la"
		+ " salida, pero el técnico, el vestuario y la afición lo pagarán.":
			"С длинным контрактом и хорошей игрой ты нужен клубу, и он предпочитает тебя удержать. Можешь добиться ухода силой, но это ударит по отношениям с тренером, раздевалкой и болельщиками.",
		"PEDIR EL TRASPASO": "ПОПРОСИТЬ ТРАНСФЕР",
		"¿PEDIR EL TRASPASO?": "ПОПРОСИТЬ ТРАНСФЕР?",
		"Tu club dejará de retenerte, pero el vestuario se lo tomará como una traición:"
		+ " bajan técnico, equipo y afición.":
			"Клуб перестанет тебя удерживать, но раздевалка сочтет это предательством: падает доверие тренера, команды и болельщиков.",
		"LO PIDO": "ПРОШУ",
		"Nadie suena por ti todavía. Rinde y hazte ver.":
			"Тобой пока никто не интересуется. Играй хорошо и попадись на глаза.",
		"TE SIGUEN": "ТОБОЙ ИНТЕРЕСУЮТСЯ",
		"Rumores de cara a la próxima ventana. Puedes darle pie a uno para que apriete"
		+ " —pero tu vestuario lo notará—.":
			"Слухи перед следующим окном. Можешь подать знак одному из клубов, чтобы он надавил, — но твоя раздевалка это заметит.",
		"Te siguen de cerca": "Внимательно следят",
		"Interés serio": "Серьезный интерес",
		"Suena flojo": "Лишь слухи",
		"Va {0} de {1} en su liga · {2}": "{0} из {1} в своей лиге · {2}",
		"LE DISTE PIE": "ЗНАК ПОДАН",
		"LE DISTE PIE · APRETARÁ EN LA VENTANA":
			"ЗНАК ПОДАН · ПОДНАЖМУТ В ОКНО",
		"MOSTRAR INTERÉS": "ПРОЯВИТЬ ИНТЕРЕС",
		"¿MOSTRAR INTERÉS EN {0}?": "ИНТЕРЕС К КЛУБУ {0}?",
		"Le das pie para que apriete en la próxima ventana. Tu vestuario lo nota: bajan"
		+ " un poco técnico, equipo y afición.":
			"Ты подаешь им знак, чтобы они надавили в следующее окно. Раздевалка это замечает: доверие тренера, команды и болельщиков немного падает.",
		"LE DOY PIE": "ПОДАЮ ЗНАК",
		"NO ME INTERESA":
			"НЕ ИНТЕРЕСНО",
		"¿DESCARTAR A {0}?":
			"ВЫЧЕРКНУТЬ: {0}?",
		"DESCARTAR":
			"ВЫЧЕРКНУТЬ",
		"Dejas de verlo entre los que te siguen y su sitio lo ocupa otro club interesado. No cuesta nada: todavía no hay ninguna oferta que rechazar. Vuelven a sonar la próxima temporada.":
			"Клуб пропадает из списка следящих за тобой, а его место займет другой заинтересованный клуб. Это ничего не стоит: отклонять пока нечего. В следующем сезоне они могут вернуться.",
		"TU EX":
			"БЫВШИЙ",
		"Volver a un club TUYO es mucho más fácil: allí ya saben quién eres y tu agente entra por la puerta grande.":
			"Вернуться в СВОЙ бывший клуб гораздо проще: там уже знают, кто ты, и твоего агента встречают с распростертыми объятиями.",
		"Ya le diste pie a otro club.": "Ты уже подал знак другому клубу.",
		"CEDIDO": "В АРЕНДЕ",
		"Perteneces a {0}: vuelves al cerrar la temporada.":
			"Ты принадлежишь клубу {0}: вернешься по окончании сезона.",
		"¿QUIERES MÁS MINUTOS?": "ХОЧЕШЬ БОЛЬШЕ ИГРАТЬ?",
		"Puedes pedir salir CEDIDO a un club menor donde juegues de titular. De joven,"
		+ " además, crecerás más rápido jugando.":
			"Можно попроситься В АРЕНДУ в клуб поскромнее, где будешь играть в основе. А в молодости игра еще и ускоряет твой рост.",
		"PEDIR SALIR CEDIDO": "ПРОСИТЬСЯ В АРЕНДУ",
		"¿PEDIR SALIR CEDIDO?": "ПРОСИТЬСЯ В АРЕНДУ?",
		"Buscarás minutos en un club menor durante una temporada. El técnico lo nota un"
		+ " poco, pero entiende que quieras jugar.":
			"Целый сезон ты будешь искать игровое время в клубе поскромнее. Тренер слегка недоволен, но понимает, что ты хочешь играть.",



		"PEDISTE SALIR": "ЗАПРОС НА УХОД",
		"¿QUIERES SALIR?": "ХОЧЕШЬ УЙТИ?",
		"PEDISTE SALIR CEDIDO": "ЗАПРОС НА АРЕНДУ",
		"TE QUIEREN A PRÉSTAMO": "ТЕБЯ ХОТЯТ В АРЕНДУ",
		"Tu club no cuenta contigo. Cedido tendrías sitio en el once — y volverías con"
		+ " el crédito que te ganes.":
			"Твой клуб на тебя не рассчитывает. В аренде у тебя было бы место в основе — и вернешься ты с тем авторитетом, который заработаешь.",
		"Cesión una temporada · misma ficha · TITULAR probable":
			"Аренда на сезон · та же зарплата · скорее всего в ОСНОВЕ",
		"IRTE CEDIDO": "В АРЕНДУ",
		"MANTÉN PARA IRTE CEDIDO": "ЗАЖМИ, ЧТОБЫ УЙТИ В АРЕНДУ",
		"¿IRTE CEDIDO A {0}?": "АРЕНДА: {0}?",
		"Una temporada fuera para jugar de verdad. Tu contrato sigue siendo del club"
		+ " dueño.":
			"Сезон на стороне, чтобы по-настоящему поиграть. Твой контракт по-прежнему принадлежит клубу-владельцу.",
		"PREGUNTARON POR TI": "ТОБОЙ ИНТЕРЕСОВАЛИСЬ",


		"ES TU RIVAL · NO TE LO PERDONARÁN": "ЭТО СОПЕРНИК · НЕ ПРОСТЯТ",



		"SE ACABÓ EL TIEMPO": "ВРЕМЯ ВЫШЛО",
		"SE ENFRÍAN": "ОСТЫВАЮТ",
		"NUEVO": "НОВОЕ",
		"SUBEN EL SUELDO": "ЗАРПЛАТА ВЫШЕ",


		"TE BAJARON EL SUELDO": "ЗАРПЛАТУ СНИЗИЛИ",
		"NEGOCIAR TU SUELDO": "ОБСУДИТЬ ЗАРПЛАТУ",

		"NEGOCIAR MI SUELDO": "ОБСУДИТЬ ЗАРПЛАТУ",
		"YA NEGOCIASTE ESTA TEMPORADA": "УЖЕ ТОРГОВАЛСЯ В ЭТОМ СЕЗОНЕ",
		"Ya negociaste tu ficha esta temporada.":
			"Ты уже обсуждал свою зарплату в этом сезоне.",
		"YA NEGOCIASTE CON ELLOS": "ТЫ УЖЕ С НИМИ ТОРГОВАЛСЯ",
		"YA PAGAN SU TOPE": "ЭТО ИХ ПОТОЛОК",
		"SIN OFERTA": "НЕТ ПРЕДЛ.",
		"TE OFRECEN DE SUELDO POR PARTIDO": "ПРЕДЛАГАЮТ ЗАРПЛАТУ ЗА МАТЧ",


		"MANTÉN PARA ACEPTAR ${0}": "ЗАЖМИ, ЧТОБЫ ПРИНЯТЬ ${0}",

		"MANTÉN PARA SALIR CON ${0}": "ЗАЖМИ, ЧТОБЫ УЙТИ С ${0}",
		"MANTÉN PARA SALIR": "ЗАЖМИ, ЧТОБЫ УЙТИ",
		"MANTÉN PULSADO": "ЗАЖМИ И ДЕРЖИ",
		"RETIRAN LA OFERTA · SE ACABÓ": "ПРЕДЛОЖЕНИЕ ОТОЗВАНО · КОНЕЦ",
		"SE LEVANTAN DE LA MESA · SE ACABÓ": "ВСТАЮТ ИЗ-ЗА СТОЛА · КОНЕЦ",
		"ESTÁ A PUNTO DE CORTAR · ROMPE EL HIELO O CIERRA":
			"ВОТ-ВОТ УЙДУТ · СНИМИ НАПРЯЖЕНИЕ ИЛИ СОГЛАШАЙСЯ",
		"Si pides más, pueden subirlo… o bajarlo": "Попросишь больше — могут поднять… или опустить",
		"Pediste {0} vez(ces) · llegaste con ${1}": "Запросов: {0} · начинал с ${1}",
		"TU AGENTE TE MIRA: ES EL MOMENTO": "АГЕНТ СМОТРИТ НА ТЕБЯ: ПОРА",
		"Lo consultan…": "Совещаются…",
		"PODEMOS LLEGAR AHÍ  (+{0})": "МОЖЕМ ПОЙТИ НА ЭТО  (+{0})",
		"ENTONCES REVISAMOS LA OFERTA  (−{0})":
			"ТОГДА ПЕРЕСМОТРИМ ПРЕДЛОЖЕНИЕ  (−{0})",
		"MEJOR ROL": "РОЛЬ ВЫШЕ",
		"SE PLANTARON": "НЕ УСТУПИЛИ",
		"SE RETIRAN": "ОТКАЗАЛИСЬ",
		"LO RECHAZASTE": "ТЫ ОТКАЗАЛ",
		"NADIE OCUPÓ EL HUECO": "МЕСТО НИКТО НЕ ЗАНЯЛ",
		"VUELVE DE CESIÓN": "ИЗ АРЕНДЫ",
		"SE QUEDAN AL CEDIDO": "ВЫКУПИЛИ ИЗ АРЕНДЫ",
		"SE FUERON": "УШЛИ",

		"CIERRA": "ДО КОНЦА",
		"{0} J": "{0} ТУР.",
		"FAMA": "СЛАВА",
		"CÓMO TE FICHAN": "КАК ТЕБЯ ПОКУПАЮТ",
		"Un club mira cuatro cosas —fama, nivel, forma y PRESTIGIO— y te juzga"
		+ " por la MÁS FLOJA: para que te busque un grande tienes que ser bueno en las"
		+ " cuatro a la vez.\n\nEl PRESTIGIO es lo que hiciste el año pasado: dónde"
		+ " quedaste en el Balón de Oro, o lo más grande que levantaste. Los tres"
		+ " primeros dicen cómo juegas HOY; éste dice de quién se habló en junio, y es"
		+ " el que abre la puerta de los más grandes.\n\nDentro de la ventana, lo que"
		+ " hagas en el campo mueve las ofertas: hay clubes que entran y clubes que se"
		+ " van. Tu agente decide CUÁNTAS de las que existen llegan hasta ti.":
			"Клуб смотрит на четыре вещи — славу, уровень, форму и ПРЕСТИЖ — и судит по САМОЙ СЛАБОЙ: чтобы тобой заинтересовался гранд, нужно быть хорошим во всех четырех сразу.\n\nПРЕСТИЖ — это то, что ты сделал в прошлом году: какое место занял в голосовании «Игрок года» или самый крупный трофей, который поднял. Первые три говорят о том, как ты играешь СЕЙЧАС; этот — о том, о ком говорили в июне, и именно он открывает дверь в самые большие клубы.\n\nВо время окна твоя игра на поле двигает предложения: одни клубы приходят, другие уходят. Агент решает, СКОЛЬКО из существующих предложений дойдет до тебя.",
		"PRESTIGIO": "ПРЕСТИЖ",
		"Te falta PRESTIGIO: acaba alto en la votación del Jugador del Año o levanta algo.":
			"Тебе не хватает ПРЕСТИЖА: займи высокое место в голосовании «Игрок года» или выиграй трофей.",
		"Tu prestigio viene de haber sido {0}º del mundo.":
			"Твой престиж — место в мировом рейтинге: {0}.",
		"Tu prestigio lo sostiene lo que ganaste: {0}.":
			"Твой престиж держится на том, что ты выиграл: {0}.",
		"Quedaste {0}º en el Jugador del Año: del {1}º en adelante el puesto ya no cuenta.":
			"Твое место в голосовании «Игрок года»: {0}. Начиная с места {1}, оно уже не учитывается.",
		"No tienes prestigio: ni entraste en la gala ni levantaste nada.":
			"У тебя нет престижа: ты не попал на гала-вечер и ничего не выиграл.",
		"TRASPASO SIN PACTAR": "ЦЕНА НЕ СОГЛАСОВАНА",
		"Ofrecen {0} · tu club pide {1} · faltan {2}":
			"Предлагают {0} · твой клуб просит {1} · не хватает {2}",
		"PELEAN POR TI ({0} MÁS)": "ТОРГ ЗА ТЕБЯ (ЕЩЕ {0})",
		"EJERCEN LA RECOMPRA": "ОБРАТНЫЙ ВЫКУП",
		"LO QUE SE GUARDARON": "ИХ ОГОВОРКИ",
		"{0} se lleva el {1}% de tu próximo traspaso (hoy serían {2}).":
			"Клуб {0} получит {1}% от твоего следующего трансфера (сейчас это {2}).",
		"{0} puede recomprarte por {1}{2}.": "Клуб {0} может выкупить тебя обратно за {1}{2}.",
		" (ya caducó)": " (срок истек)",
		"AHÍ NO LLEGAS": "НЕ ТВОЙ УРОВЕНЬ",
		"DÉJALO": "ЗАБУДЬ",
		"LLAMA IGUAL": "ПОЗВОНИТЬ",
		"En NEGRITA los que hoy te ficharían si tu agente les entra. Los demás puedes"
		+ " pedirlos igual, pero te dirá que no.":
			"ЖИРНЫМ выделены те, кто подписал бы тебя сегодня, если твой агент до них достучится. Остальных тоже можно попросить, но он вернется ни с чем.",
		"ENTENDIDO": "ПОНЯТНО",
		"SE VAN MAÑANA": "ЗАВТРА УЙДУТ",

		"REBAJADO: FIN DE CONTRATO": "СКИДКА: КОНТРАКТ ИСТЕКАЕТ",

		"VINO A VERTE": "СМОТРЕЛ ТЕБЯ",
		"TE SIGUE": "СЛЕДИТ",
		"TE QUIERE": "ХОЧЕТ ТЕБЯ",
		"VA EN SERIO": "ВСЕ СЕРЬЕЗНО",
		"Ya elegiste: tu junio tiene dueño. Ningún otro club puede moverte.": "Ты уже выбрал: твой июнь занят. Никакой другой клуб тебя не переманит.",

		"SOLO LIGA Y COPA": "ЛИГА И КУБОК",

		"NEGOCIAR…": "ПЕРЕГОВОРЫ…",

		"PEDIR TRASPASO": "ПРОСИТЬ ТРАНСФЕР",
		"PEDIR CESIÓN": "ПРОСИТЬ АРЕНДУ",
		"Pedir el TRASPASO te pone en LISTA DE VENTA: tu club te ofrece a quien"
		+ " pregunte y llegan más ofertas — pero el vestuario lo paga y el técnico"
		+ " te da MENOS minutos mientras no salgas: ya dijiste que te vas.\n\nSi no"
		+ " eres titular, puedes pedir salir CEDIDO a un club menor donde juegues:"
		+ " de joven, además, creces más rápido jugando.":
			"Запрос на ТРАНСФЕР ставит тебя НА ПРОДАЖУ: клуб предлагает тебя всем желающим, и предложений становится больше — но раздевалка за это спросит, а тренер, пока ты не уйдешь, будет давать тебе МЕНЬШЕ минут: ты ведь сам сказал, что уходишь.\n\nЕсли ты не в основе, можно попроситься В АРЕНДУ в клуб поскромнее, где будешь играть: в молодости игра еще и ускоряет твой рост.",
		"Estás EN LISTA DE VENTA: tu club ya no te retiene y te ofrece a quien"
		+ " pregunte. Cada ventana te trae más ofertas."
		+ " Mientras no salgas, el técnico te da menos minutos.":
			"Ты НА ПРОДАЖЕ: клуб тебя больше не удерживает и предлагает всем желающим. Каждое окно приносит больше предложений. Пока не уйдешь, тренер дает тебе меньше минут.",
		"Te pones EN LISTA DE VENTA: el club deja de retenerte y te ofrece a"
		+ " quien pregunte. El vestuario se lo toma a mal: bajan técnico, equipo y"
		+ " afición. Y mientras no salgas, el técnico te dará MENOS MINUTOS por"
		+ " bien que juegues: ya dijiste que te vas.":
			"Ты выставляешь себя НА ПРОДАЖУ: клуб перестает тебя удерживать и предлагает всем желающим. Раздевалка воспринимает это плохо: падает доверие тренера, команды и болельщиков. А пока не уйдешь, тренер будет давать тебе МЕНЬШЕ МИНУТ, как бы хорошо ты ни играл: ты ведь сам сказал, что уходишь.",

		"DESDE VERANO": "С ЛЕТА",

		"BUSCAN DELANTERO": "НУЖЕН НАПАДАЮЩИЙ",

		"PRECIO DE ENERO": "ЯНВАРСКАЯ ЦЕНА",

		"TRAYECTORIA +{0}%": "ОПЫТ +{0}%",
		"TROTAMUNDOS −{0}%": "КОЧЕВНИК −{0}%",

		"YA FICHARON DE TU CLUB ({0})": "БРАЛИ ИЗ ТВОЕГО КЛУБА ({0})",
		"SUELEN FICHAR DE TU LIGA": "ПОКУПАЮТ В ТВОЕЙ ЛИГЕ",

		"VUELVES A CASA": "СНОВА ДОМА",
		"TU EX CLUB": "БЫВШИЙ КЛУБ",

		"VUELVE CEDIDO A CASA": "АРЕНДА В РОДНОЙ КЛУБ",

		"PAGAN LA CLÁUSULA": "ПЛАТЯТ ОТСТУПНЫЕ",
		"CLÁUSULA DE RESCISIÓN": "ОТСТУПНЫЕ",

		"TE PREGUNTAN POR EL RUMOR": "ТЕБЯ СПРАШИВАЮТ О СЛУХАХ",
		"Se sabe que {0} te sigue y la prensa te pone el micro delante. Lo que digas"
		+ " lo oyen todos: tu grada y su despacho.":
			"Все знают, что тобой интересуется клуб {0}, и пресса сует тебе микрофон. Что бы ты ни сказал, услышат все: и твои трибуны, и их руководство.",
		"NO ME CIERRO A NADA": "НИЧЕГО НЕ ИСКЛЮЧАЮ",
		"ESTOY CENTRADO AQUÍ": "ВСЕ МЫСЛИ — О КЛУБЕ",

		"RETIRAR LA PETICIÓN": "ОТОЗВАТЬ ЗАПРОС",
		"¿RETIRAR LA PETICIÓN?": "ОТОЗВАТЬ ЗАПРОС?",

		"CUMPLE LO DICHO": "ДЕРЖИШЬ СЛОВО",
		"CONTRADICE LO DICHO": "НАРУШАЕШЬ СЛОВО",
		"DIJISTE: {0}": "СКАЗАЛ: {0}",
		"TE COMPROMETE: {0}": "ТВОЕ ОБЕЩАНИЕ: {0}",
		"IR DONDE JUEGUES MÁS": "ТУДА, ГДЕ ДАДУТ ИГРАТЬ",
		"IR A UN CLUB MAYOR": "В КЛУБ ПОКРУПНЕЕ",
		"IRTE DE ESTE CLUB": "УЙТИ ОТСЮДА",

		"PIDE SALIR": "ХОЧЕТ УЙТИ",
		"{0} pide salir cedido para jugar más": "{0} просится в аренду, чтобы больше играть",
		"{0} busca una cesión donde lo vean": "{0} ищет аренду, где его заметят",

		"NO RENUEVA": "НЕ ПРОДЛИТ",
		"PRECONTRATO · {0}": "ПРЕДКОНТРАКТ · {0}",
		"EN JUNIO": "В ИЮНЕ",
		"RENUEVA": "ПРОДЛИТ",
		"SE VA LIBRE": "УХОДИТ БЕСПЛ.",
		"PRECONTRATO": "ПРЕДКОНТРАКТ",
		"{0} renueva con el {1} hasta {2}": "{0} продлевает контракт с клубом {1} до {2}",
		"{0} no renovará con el {1}: se va libre en junio": "{0} не продлит контракт с клубом {1}: в июне уйдет свободным агентом",
		"{0} firma un precontrato con el {1}": "{0} подписывает предконтракт с клубом {1}",
		"{0} pide una cesión: no ve futuro en el {1}": "{0} просится в аренду: не видит будущего в клубе {1}",
		"{0} se ofrece para salir cedido": "{0} готов уйти в аренду",
		"{0} pide salir del {1}: quiere jugar más":
			"{0} просит отпустить его из клуба {1}: хочет больше играть",
		"{0} pide salir del {1} y busca un club mayor":
			"{0} просит отпустить его из клуба {1} и ищет клуб покрупнее",
		"{0} no cree en el proyecto del {1} y pide salir":
			"{0} не верит в проект клуба {1} и просит отпустить его",
		"{0} pide salir del {1}": "{0} просит отпустить его из клуба {1}",
		"Dijiste «{0}», y te vas a donde dijiste.":
			"Ты сказал «{0}» — и уходишь именно туда.",
		"Dijiste «{0}». Acabas firmando otra cosa.":
			"Ты сказал «{0}». А в итоге подписываешь совсем другое.",

		"¿POR QUÉ TE QUIERES IR?": "ПОЧЕМУ ТЫ ХОЧЕШЬ УЙТИ?",
		"EL DIRECTOR DEPORTIVO": "СПОРТИВНЫЙ ДИРЕКТОР",
		"BUSCO MÁS MINUTOS": "ХОЧУ БОЛЬШЕ ИГРАТЬ",
		"QUIERO UN CLUB MEJOR": "ХОЧУ В КЛУБ СИЛЬНЕЕ",
		"NO CREO EN EL PROYECTO": "НЕ ВЕРЮ В ПРОЕКТ",
		"QUIERO JUGAR": "ХОЧУ ИГРАТЬ",
		"QUIERO QUE ME VEAN": "ХОЧУ БЫТЬ НА ВИДУ",
		"AQUÍ NO TENGO FUTURO": "ЗДЕСЬ НЕТ БУДУЩЕГО",
		"ME LO PIENSO": "Я ПОДУМАЮ",
		"NADA, OLVÍDELO": "НЕТ, ЗАБУДЬТЕ",
		"YA LO JUEGAS TODO": "ТЫ И ТАК ИГРАЕШЬ ВСЕ МАТЧИ",
		"TE BUSCAMOS SITIO.": "НАЙДЕМ ТЕБЕ КЛУБ.",
		"PUES QUE PAGUEN LO QUE VALES.": "ПУСТЬ ПЛАТЯТ, СКОЛЬКО ТЫ СТОИШЬ.",
		"AQUÍ NO SE REGALA A NADIE.": "ДАРОМ МЫ НИКОГО НЕ ОТДАЕМ.",
		"EL PROYECTO SIGUE, CONTIGO O SIN TI.": "ПРОЕКТ ИДЕТ ДАЛЬШЕ, С ТОБОЙ ИЛИ БЕЗ ТЕБЯ.",
		"NO TE FALTA RAZÓN.": "ТУТ ТЫ ПРАВ.",
		"ME DUELE, PERO TE ENTIENDO. VUELVE MEJOR.": "ЖАЛЬ, НО Я ПОНИМАЮ. ВОЗВРАЩАЙСЯ СИЛЬНЕЕ.",
		"JUEGA FUERA Y A LA VUELTA HABLAMOS.": "ПОИГРАЙ НА СТОРОНЕ, А ПОТОМ ПОГОВОРИМ.",
		"TE BUSCAMOS UN SITIO DONDE JUGAR.": "НАЙДЕМ ТЕБЕ МЕСТО, ГДЕ ИГРАТЬ.",
		"AQUÍ TAMBIÉN SE JUEGA SI TE LO GANAS.": "ЗДЕСЬ ТОЖЕ ИГРАЮТ, ЕСЛИ ЗАСЛУЖИШЬ.",
		"HACES BIEN.": "ПРАВИЛЬНО.",
		"Antes de ponerte en la lista quiere oírlo de tu boca. Lo que le digas decide a quién llama y cuánto pide por ti.": "Прежде чем выставить тебя на продажу, он хочет услышать это от тебя лично. От твоих слов зависит, кому он позвонит и сколько за тебя попросит.",
		"{0} te para en el pasillo, junto a la lista. Quiere saber por qué pides salir cedido.": "{0} останавливает тебя в коридоре, у доски с составом. Хочет знать, почему ты просишься в аренду.",
		"EL EQUIPO SE HUNDE": "КОМАНДА ТОНЕТ",
		"PELEÁIS ARRIBA": "БОРЕТЕСЬ ЗА ЛИДЕРСТВО",
		"ÍDOLO DE LA GRADA": "КУМИР ТРИБУН",
		"RECIÉN LLEGADO": "НОВИЧОК",
		"YA LO DIJISTE ANTES": "ТЫ УЖЕ ЭТО ГОВОРИЛ",
		"HOY NADIE MÁS GRANDE": "КЛУБА КРУПНЕЕ ПОКА НЕТ",
		"HOY NO PREGUNTA NADIE": "ПОКА НИКТО НЕ СПРОСИЛ",
		"SIN DESTINO HOY": "ВАРИАНТОВ ПОКА НЕТ",
		"PIDEN {0}": "ПРОСЯТ {0}",

		"Tu mercado ya no abre esta temporada: podrás pedir salir cuando abra el"
		+ " de verano.":
			"В этом сезоне трансферное окно для тебя больше не откроется: попросить об уходе можно будет, когда откроется летнее.",
		"Disculpa pública: sales de la lista de venta. La afición se lo cobra, y el"
		+ " técnico tardará un par de partidos en volver a contar contigo — dijiste"
		+ " que te ibas.":
			"Публичные извинения: тебя снимают с продажи. Болельщики тебе это припомнят, а тренер пару матчей не будет на тебя рассчитывать — ты же говорил, что уходишь.",
		"RETIRASTE LA PETICIÓN": "ЗАПРОС ОТОЗВАН",

		"Sube de la cantera de {0}": "Переведен из академии клуба {0}",
		"CANTERA": "АКАДЕМИЯ",

		"LA BOMBA DEL CIERRE": "БОМБА ДЕДЛАЙНА",

		"Opción de compra pactada: $ {0}": "Опция выкупа согласована: $ {0}",
		"EJECUTAN LA OPCIÓN": "ТЕБЯ ВЫКУПАЮТ",
		"{0} quiere que vuelvas: pide repetir la cesión y puja por ti": "{0} хочет вернуть тебя: просит повторить аренду и делает предложение о покупке",
		"{0} quiere que vuelvas: pide repetir la cesión": "{0} хочет вернуть тебя: просит повторить аренду",
		"{0} quiere que vuelvas: intentará comprarte": "{0} хочет вернуть тебя: попробует тебя купить",
		"{0} quería que volvieras, pero tu club cuenta contigo": "{0} хотел вернуть тебя, но твой клуб на тебя рассчитывает",
		"{0} ejecuta la opción de compra pactada":
			"{0} исполняет согласованную опцию выкупа",

		"ENCARGO AL AGENTE…": "ЗАДАНИЕ АГЕНТУ…",

		"{0} LIBRES": "ЕЩЕ {0}",

		"ENCARGOS": "ЗАДАНИЯ",
		"CONFIANZA": "ДОВЕРИЕ",
		"TU DINERO": "ДЕНЬГИ",
		"CUESTA VESTUARIO": "СТОИТ ДОВЕРИЯ РАЗДЕВАЛКИ",
		"La cifra de cada botón es LO QUE TE COBRA por ese encargo, y sale de tu bolsillo al momento. Tienes ${0}.":
			"Цифра на каждой кнопке — СТОЛЬКО ОН БЕРЕТ с тебя за это задание, и платишь ты сразу, из своего кармана. У тебя ${0}.",
		"TU AGENTE": "ТВОЙ АГЕНТ",
		"MUÉVEME POR EL MERCADO": "ПРЕДЛОЖИ МЕНЯ КЛУБАМ",
		"BUSCA EN UNA LIGA…": "ПОИЩИ В ЛИГЕ…",
		"TOCA LA PUERTA DE UN CLUB…": "ПОСТУЧИСЬ В КЛУБ…",
		"¿QUÉ LIGA?": "КАКАЯ ЛИГА?",
		"¿QUÉ CLUB?": "КАКОЙ КЛУБ?",
		"TU AGENTE SE MUEVE": "ТВОЙ АГЕНТ В ДЕЛЕ",
		"LO TRAJO TU AGENTE": "НАШЕЛ ТВОЙ АГЕНТ",
		"TU AGENTE NO PUDO": "АГЕНТУ НЕ УДАЛОСЬ",

		"TU MESA ESTÁ LLENA": "ТВОЙ СТОЛ ЗАПОЛНЕН",
		"NO TRAS TU RECHAZO": "ТЫ ИМ УЖЕ ОТКАЗАЛ",
		"FUERA DE TU ALCANCE": "ТЕБЕ НЕ ДОТЯНУТЬСЯ",
		"YA ESTABA EN TU MESA": "УЖЕ БЫЛО НА СТОЛЕ",
		"TRAJO A {0}": "НАШЕЛ: {0}",
		"El mercado cierra hoy: ya no hay tiempo para encargos.":
			"Окно закрывается сегодня: на задания времени уже нет.",
		"Tu agente trabaja la liga de {0}: sus clubes entran primero.":
			"Твой агент обрабатывает лигу {0}: ее клубы выйдут на тебя первыми.",
		"Tu agente está tocando esa puerta: se sabe en la próxima jornada.":
			"Твой агент стучится в эту дверь: ответ будет в следующем туре.",
		"Tu agente te está moviendo: esta ventana entran más clubes.":
			"Твой агент предлагает тебя клубам: в это окно появится больше вариантов.",
		"FIRMAR PRECONTRATO": "ПРЕДКОНТРАКТ",
		"¿FIRMAR PRECONTRATO CON {0}?": "ПРЕДКОНТРАКТ С КЛУБОМ {0}?",
		"Firmas para el VERANO: terminas la temporada aquí y al cierre te vas"
		+ " GRATIS, con tu prima. Tu mercado se cierra este año, no podrás renovar, y"
		+ " el técnico te dará menos minutos: ya sabe que te vas.":
			"Подписываешь на ЛЕТО: доигрываешь сезон здесь, а в конце уходишь БЕСПЛАТНО, с бонусом. Твое трансферное окно в этом году закрывается, продлить контракт не получится, а тренер будет давать тебе меньше минут: он знает, что ты уходишь.",

		"Te vas a tu RIVAL: la grada no te lo perdona. Técnico −{0}, afición −{1}; cuanto más te quieren, más duele.": "Ты уходишь к СОПЕРНИКУ: трибуны тебе этого не простят. Тренер −{0}, болельщики −{1}; чем сильнее тебя любят, тем больнее.",
		"Te vas a un club de tu LIGA: los tendrás enfrente. Técnico −{0}, afición −{1}.": "Ты уходишь в клуб из твоей ЛИГИ: будешь играть против них. Тренер −{0}, болельщики −{1}.",
		"Te vas a otra liga de tu PAÍS. Técnico −{0}, afición −{1}.": "Ты уходишь в другую лигу своей СТРАНЫ. Тренер −{0}, болельщики −{1}.",
		"Te vas al EXTRANJERO: se entiende más. Técnico −{0}, afición −{1}.": "Ты уезжаешь ЗА ГРАНИЦУ: это понять проще. Тренер −{0}, болельщики −{1}.",


		"PRECONTRATO FIRMADO": "ПРЕДКОНТРАКТ ПОДПИСАН",
		"PRECONTRATO FIRMADO · TE VAS EN VERANO": "ПРЕДКОНТРАКТ ПОДПИСАН · УХОДИШЬ ЛЕТОМ",
		"Al cerrar la temporada te vas GRATIS a {0}."
		+ " Ya elegiste destino: tu mercado está resuelto y juegas menos"
		+ " mientras tanto.":
			"В конце сезона ты БЕСПЛАТНО уходишь в клуб {0}. Выбор сделан: твой трансферный вопрос решен, а пока ты играешь меньше.",
		"Se cumple tu precontrato: llegas GRATIS a {0}":
			"Предконтракт вступает в силу: ты БЕСПЛАТНО переходишь в клуб {0}",

		"FIRMADO: {0}": "ПОДПИСАНО: {0}",
		"YA FIRMASTE CON {0}": "УЖЕ ПОДПИСАН: {0}",

		"TE CONSIGUE EL PRECONTRATO": "ДОБЫЛ ПРЕДКОНТРАКТ",
		"TE GUARDAN EL {0}": "ЗА ТОБОЙ НОМЕР {0}",
		"Ya firmaste con {0}: el técnico cuenta menos contigo.": "Ты уже подписал контракт с клубом {0}: тренер меньше на тебя рассчитывает.",

		"HITO": "ТРОФЕЙ",
		"SIN HITO": "БЕЗ ТРОФЕЕВ",
		"Tienes nivel de grande: te falta GANAR algo.":
			"Уровень для топ-клуба у тебя есть: осталось что-нибудь ВЫИГРАТЬ.",
		"ABRE": "СТАРТ",
		"EL AÑO QUE VIENE": "ЧЕРЕЗ ГОД",

		"LOS QUE TE SIGUEN": "ИНТЕРЕС К ТЕБЕ",
		"Clubes que preguntan por ti de cara a la próxima ventana. Puedes darle pie a UNO"
		+ " para que apriete cuando abra: llegará con oferta y su distintivo.\n\nNo sale"
		+ " gratis —el vestuario se entera de que miras fuera— y sólo se puede con un club"
		+ " por ventana.":
			"Клубы, которые интересуются тобой перед следующим окном. Можешь дать знак ОДНОМУ, чтобы он надавил, когда окно откроется: придет с предложением и своим значком.\n\nЭто не бесплатно — раздевалка узнает, что ты смотришь на сторону, — и только один клуб за окно.",
		"DE CERCA": "ПЛОТНО",
		"SERIO": "СЕРЬЕЗНО",
		"FLOJO": "ВЯЛО",
		"FUERA DE COPA": "ВЫЛЕТ ИЗ КУБКА",
		"OCTAVOS": "1/8",
		"CUARTOS": "1/4",
		"SEMIS": "1/2",
		"FINAL": "ФИНАЛ",

		"Sin traspaso (agente libre) · prima de fichaje: ${0}":
			"Без суммы трансфера (свободный агент) · бонус за подписание: ${0}",
		"Traspaso: ${0} · tu prima: ${1}": "Сумма трансфера: ${0} · твой бонус: ${1}",
		"Te esperan como: {0}": "Тебя ждут в роли: {0}",
		"Se retiran mañana": "Завтра они отзовут предложение",
		"Aguantan {0} jornadas más": "Туров в запасе: {0}",
		"ULTIMATUM: hoy o nunca": "УЛЬТИМАТУМ: сегодня или никогда",
		"Ahora cobras ${0}/partido · esta oferta {1}%":
			"Сейчас получаешь ${0}/матч · это предложение: {1}%",
		"Un club por encima del tuyo": "Клуб уровнем выше твоего",
		"Un club por debajo del tuyo": "Клуб уровнем ниже твоего",
		"Un club a tu nivel": "Клуб твоего уровня",
		"FICHAR (LIBRE)": "ПОДПИСАТЬ БЕСПЛ.",
		"Esperas respuesta a tu {0} (próxima jornada)":
			"Ждешь ответа: {0} (следующий тур)",
		"petición de sueldo": "запрос по зарплате",
		"petición de titular": "запрос на место в основе",
		"Ya negociaste esta oferta: sin más margen.":
			"Ты уже торговался по этому предложению: больше уступок не будет.",
		"PEDIR SER TITULAR": "ПРОСИТЬСЯ В ОСНОВУ",
		"PEDIR MÁS SUELDO": "ПРОСИТЬ ПРИБАВКУ",
		"TU CLUB NO TE DEJA SALIR": "КЛУБ ТЕБЯ НЕ ОТПУСКАЕТ",
		"FICHAR": "ПЕРЕЙТИ",
		"que suban el sueldo": "прибавку к зарплате",
		"que te fichen de titular": "место в основе",
		"¿NEGOCIAR CON {0}?": "ПЕРЕГОВОРЫ: {0}?",
		"Pides {0}. Responden la próxima jornada: pueden ceder, plantarse o RETIRAR la"
		+ " oferta.":
			"Просишь {0}. Ответ — в следующем туре: могут уступить, упереться или ОТОЗВАТЬ предложение.",
		"NEGOCIAR": "ТОРГОВАТЬСЯ",
		"NEGOCIACIÓN ABIERTA · RESPONDEN LA PRÓXIMA JORNADA":
			"ПЕРЕГОВОРЫ ИДУТ · ОТВЕТ В СЛЕДУЮЩЕМ ТУРЕ",
		"RECHAZAR": "ОТКАЗ",
		"¿RECHAZAR A {0}?": "ОТКАЗ: {0}?",
		"Se retiran de la puja para siempre en este mercado. Otros clubes pueden ocupar"
		+ " su hueco, pero no hoy: se sabe en la próxima jornada.":
			"Они выходят из борьбы до конца этого окна. Их место могут занять другие клубы, но не сегодня: узнаешь в следующем туре.",
		"RECHAZO": "ОТКАЗЫВАЮСЬ",
		"OFERTA RECHAZADA · SE BUSCA OTRO DESTINO":
			"ПРЕДЛОЖЕНИЕ ОТКЛОНЕНО · ИЩЕМ ДАЛЬШЕ",
		"¿FICHAR POR {0}?": "ПЕРЕХОД: {0}?",
		"Te esperan como {0}. Llegas al vestuario desde abajo: el puesto se gana.":
			"Тебя ждут в роли: {0}. В раздевалке начинаешь с низов: место в основе надо заработать.",
		"FIRMO": "ПОДПИШУ",
		"Fichaje libre: sin traspaso, con prima de ${0}. Te esperan como {1}; el puesto"
		+ " se gana.":
			"Свободный трансфер: без суммы трансфера, бонус за подписание ${0}. Тебя ждут в роли: {1}; место в основе надо заработать.",

		"ELIGE TU DORSAL": "ВЫБЕРИ НОМЕР",
		"HAY DORSAL LIBRE": "НОМЕР СВОБОДЕН",
		"Te fichan como un acontecimiento y el club te deja elegir. Llevas el {0}, pero"
		+ " la camiseta que quieras es tuya.":
			"Тебя подписывают как звезду, и клуб дает тебе выбрать. Твой номер — {0}, но можешь взять любой свободный.",
		"Se cerró el mercado y el club repasa los números. Llevas el {0}, y este año hay"
		+ " camiseta libre si la quieres.":
			"Окно закрылось, и клуб пересматривает номера. Твой номер — {0}, а в этом году есть свободный номер, если хочешь.",
		"PONERME EL {0}": "ВЗЯТЬ НОМЕР {0}",
		"SEGUIR CON EL {0}": "ОСТАВИТЬ {0}",
		"ELIGE OTRO": "ВЫБРАТЬ ДРУГОЙ",
		"TU DORSAL EN EL CLUB": "ТВОЙ НОМЕР В КЛУБЕ",
		"RENUEVAS: TU DORSAL": "ПРОДЛЕНИЕ: ТВОЙ НОМЕР",
		"Llegas nuevo y el club te deja escoger número. Llevas el {0}; si prefieres otro de los que están libres, es tuyo.": "Ты только пришел, и клуб дает тебе выбрать номер. Твой номер — {0}; если хочешь другой из свободных, он твой.",
		"Firmas con el club y aprovechas para repasar tu número. Llevas el {0}; si quieres otro de los que están libres, cámbialo.": "Ты подписываешь контракт и заодно можешь сменить номер. Твой номер — {0}; если хочешь другой из свободных, меняй.",
		"ELIGE TU NÚMERO": "ВЫБЕРИ НОМЕР",
		"Te pones el {0}.": "Берешь номер {0}.",
		"Sigues con el {0}.": "Остаешься с номером {0}.",
		"BOTAS": "БУТСЫ",
		"OFERTA DE LA JORNADA": "ПРЕДЛОЖЕНИЕ ТУРА",
		"OFERTA": "СКИДКА",
		"ANTES ${0}": "БЫЛО ${0}",
		"Sólo estética: pintan tus botas en el partido y en las escenas, y no cambian sus bonos. Se ponen en TIENDA, en BOTAS.": "Только внешний вид: бутсы меняют цвет в матче и в сценах, а их бонусы остаются прежними. Надеваются в МАГАЗИНЕ, раздел БУТСЫ.",
		"+ {0} PUNTOS": "+ {0} ОЧК.",
		"Sólo color, no da bonos. Es tuya hasta que empieces otra carrera.": "Только цвет, бонусов не дает. Остается у тебя, пока не начнешь новую карьеру.",
		"PINTA TUS BOTAS": "КРАСИТ ТВОИ БУТСЫ",
		"YA LA TIENES: SE PONE EN TIENDA, EN BOTAS": "УЖЕ ЕСТЬ: НАДЕТЬ В МАГАЗИНЕ, БУТСЫ",
		"SE PONE EN TIENDA, EN BOTAS": "НАДЕТЬ: МАГАЗИН, БУТСЫ",
		"Tus botas estrenan la {0}.": "На твоих бутсах теперь {0}.",
		"TUS EDICIONES": "ТВОИ СЕРИИ",
		"SIN EDICIÓN": "БЕЗ СЕРИИ",
		"EDICIÓN DEBUT": "ДЕБЮТНАЯ СЕРИЯ",
		"EDICIÓN ASCENSO": "СЕРИЯ ПОВЫШЕНИЯ",
		"EDICIÓN ORO": "ЗОЛОТАЯ СЕРИЯ",
		"EDICIÓN NOCHE": "НОЧНАЯ СЕРИЯ",
		"EDICIÓN FUEGO": "ОГНЕННАЯ СЕРИЯ",
		"EDICIÓN HIELO": "ЛЕДЯНАЯ СЕРИЯ",
		"EDICIÓN NEÓN": "НЕОНОВАЯ СЕРИЯ",
		"PACK DEBUT": "ДЕБЮТНЫЙ ПАК",
		"PACK ASCENSO": "ПАК ПОВЫШЕНИЯ",
		"PACK JUGADOR DEL AÑO": "ПАК ЛУЧШЕГО ИГРОКА",
		"EL QUE MÁS RINDE": "ВЫГОДНЕЕ ВСЕГО",
		"ALCANZA": "ХВАТАЕТ",
		"ALCANZA PARA {0}": "ХВАТИТ НА: {0}",
		"TE ALCANZARÍA PARA: {0}": "ХВАТИЛО БЫ НА: {0}",
		"QUEDARÍAS CON ${0}": "ОСТАНЕТСЯ ${0}",
		"QUEDARÍAS CON {0} PUNTOS": "ОСТАНЕТСЯ {0} ОЧК.",
		"QUEDARÍAS CON ${0} Y {1} PUNTOS": "ОСТАНЕТСЯ ${0} И {1} ОЧК.",
		"TUS HABILIDADES ESTÁN AL MÁXIMO: ENTRARÍAN COMO ≈{0} XP": "ТВОИ НАВЫКИ НА МАКСИМУМЕ: ПОЙДУТ КАК ≈{0} ОПЫТА",
		"TE FALTAN ${0} PARA {1}": "{1}: НЕ ХВАТАЕТ ${0}",
		"YA TE ALCANZA PARA {0}": "УЖЕ ХВАТАЕТ НА: {0}",
		"VOLVER A {0}": "НАЗАД: {0}",
		"REPARTIR PUNTOS": "РАСПРЕДЕЛИТЬ ОЧКИ",
		"PERSONAL": "ПЕРСОНАЛ",
		"PARA EL CUERPO": "ДЛЯ ТЕЛА",
		"PARA EL VESTUARIO": "ДЛЯ РАЗДЕВАЛКИ",
		"TU CUERPO TÉCNICO": "ТВОЙ ШТАБ",
		"ROPA": "ОДЕЖДА",
		"LUJOS": "РОСКОШЬ",
		"PELUQUERÍA": "БАРБЕРШОП",
		"Cortes y barbas de autor. Los de siempre siguen gratis en ASPECTO.": "Авторские стрижки и бороды. Обычные — по-прежнему бесплатно, в разделе ВНЕШНОСТЬ.",
		"VER MARCAS": "ВСЕ БРЕНДЫ",
		"PONÉRTELO": "НАДЕТЬ",
		"TU PUESTO: {0}º · {1} · {2}%": "ТВОЕ МЕСТО: {0} · {1} · {2}%",
		"{0} % POR TU GRADA": "{0}% ОТ ТРИБУН",
		"TE LLEVA: {0}": "ТВОЙ АГЕНТ: {0}",
		"LLEVAS PUESTAS": "НА ТЕБЕ",
		"VS LAS TUYAS": "ПРОТИВ ТВОИХ",
		"LO MISMO": "ОДИНАКОВО",
		"DURA {0} MÁS": "ДОЛЬШЕ НА {0}",
		"DURA {0} MENOS": "КОРОЧЕ НА {0}",
		"USA LO QUE TIENES": "ИСПОЛЬЗУЙ СВОЕ",

		"POTENCIA": "СИЛА",
		"EFECTO": "ЗАКРУТКА",
		"${1} POR PARTIDO · DURA {0}": "${1} ЗА МАТЧ · СРОК: {0}",
		"CON TU NETO DE HOY NO LLEGAS": "С ТЕКУЩИМ ДОХОДОМ НЕ ПОТЯНЕШЬ",
		"TE FALTAN {0} · {1}": "ОСТАЛОСЬ {0} · {1}",
		"EL MÁS CERCA": "БЛИЖЕ ВСЕГО",
		"SIN MANTENIMIENTO": "БЕЗ СОДЕРЖАНИЯ",
		"SE ESTRENA AL COMPRAR · ROTA, VUELVE EN {0}": "СРАЗУ В ДЕЛЕ · СЛОМАЕТСЯ — ВЕРНЕТСЯ ЧЕРЕЗ {0}",
		"COMISIÓN {0}% · HOY {1}%": "КОМИССИЯ {0}% · СЕЙЧАС {1}%",
		"SOBRE TU SUELDO: {0} / PARTIDO": "С ТВОЕЙ ЗАРПЛАТЫ: {0} / МАТЧ",
		"PARA SIEMPRE · SIN MANTENIMIENTO": "НАВСЕГДА · БЕЗ СОДЕРЖАНИЯ",
		"VER EN CASA": "ОТКРЫТЬ ДОМ",
		"MIENTRAS SIGAS AQUÍ · TE QUEDAN {0} {1}": "ПОКА ТЫ ЗДЕСЬ · ОСТАЛОСЬ {0} {1}",
		"TU CARTERA": "КОШЕЛЕК",
		"{0} PUNTOS LIBRES": "СВОБОДНЫХ ОЧКОВ: {0}",
		"TOCA UNA BOTA PARA PROBÁRTELA": "НАЖМИ НА БУТСЫ ДЛЯ ПРИМЕРКИ",
		"TU TREN DE VIDA": "ОБРАЗ ЖИЗНИ",
		"TOCA UNA FICHA PARA ELEGIRLA": "НАЖМИ НА КАРТОЧКУ ДЛЯ ВЫБОРА",
		"TU PERSONAL": "ПЕРСОНАЛ",
		"TIENES {0} DE {1}": "У ТЕБЯ {0} ИЗ {1}",
		"TU MERCH": "ТВОЙ МЕРЧ",
		"NO TIENES NADA GUARDADO": "В ЗАПАСЕ ПУСТО",
		"LO QUE CAMBIA": "ЧТО МЕНЯЕТСЯ",
		"PAGAS ${0} · TE QUEDAN ${1}": "ПЛАТИШЬ ${0} · ОСТАНЕТСЯ ${1}",
		"HOY NO SIRVE: {0}": "СЕЙЧАС НЕ НУЖНО: {0}",
		"-{0}% HOY": "-{0}% СЕГОДНЯ",
		"ABRIENDO": "ОТКРЫТИЕ",
		"APP STORE": "APP STORE",
		"CONSUMO": "ТОВАРЫ",
		"Lo que compras aquí te mejora MIENTRAS SIGAS EN ESTE CLUB. Si fichas por otro, se queda con este escudo.": "Купленное здесь усиливает тебя, ПОКА ТЫ ИГРАЕШЬ В ЭТОМ КЛУБЕ. Перейдешь в другой — все останется с этим гербом.",
		"El escudo en la cabeza, todos los días. Lo más barato que dice de qué eres.": "Герб на голове, каждый день. Самый дешевый способ показать, за кого ты.",
		"La que se levanta en el himno. Mientras juegues aquí, la grada te la reconoce.": "Ее поднимают во время гимна. Пока ты играешь здесь, трибуны это ценят.",
		"El del año, con el sello del club. Lo usas a diario y llegas algo más entero.": "Мяч этого года с печатью клуба. Тренируешься с ним каждый день и приходишь чуть свежее.",
		"La de este año, con tu dorsal. Sales con ella y la prensa lo nota.": "Футболка этого года с твоим номером. Выходишь в ней в город — и пресса это замечает.",
		"TIENDA DEL CLUB": "КЛУБНЫЙ МАГАЗИН",
		"En primera, la tienda saca además la playera firmada de la vitrina.": "В высшей лиге магазин выставляет еще и футболку с подписями из витрины.",
		"GORRA DEL CLUB": "КЛУБНАЯ КЕПКА",
		"BUFANDA DEL CLUB": "КЛУБНЫЙ ШАРФ",
		"BALÓN OFICIAL": "ОФИЦИАЛЬНЫЙ МЯЧ",
		"PLAYERA DE LA TEMPORADA": "ФУТБОЛКА СЕЗОНА",
		"PLAYERA FIRMADA": "МАЙКА С ПОДПИСЯМИ",
		"La de la vitrina, firmada por la plantilla. Sólo en primera.": "Та, что в витрине, с подписями всей команды. Только в высшей лиге.",
		"ESTILO": "СТИЛЬ",
		"INVERSION": "ВЛОЖЕНИЯ",
		"Toca una bota para probártela en el espejo.":
			"Нажми на бутсы, чтобы примерить их перед зеркалом.",
		"Llevas ahorrado el {0}%.": "Отложено уже {0}%.",
		"EN USO": "В ДЕЛЕ",
		"EQUIPAR": "НАДЕТЬ",
		"CON TUS BOTAS": "В ТВОИХ БУТСАХ",
		"VIDA {0}%  ·  se gastan al jugar": "РЕСУРС {0}%  ·  изнашиваются в игре",
		"SIN DESGASTE  ·  las de pago dan más": "БЕЗ ИЗНОСА  ·  платные дают больше",
		"EN USO · {0}%": "В ДЕЛЕ · {0}%",
		"Se te acabaron tus {0}. Toca otras para reponerlas.":
			"Твои {0} износились. Нажми на другие, чтобы заменить.",
		"Tu fama interesó a {0}. Míralo en PATROCINIOS.":
			"Твоя слава привлекла внимание бренда {0}. Подробности — в разделе СПОНСОРЫ.",
		"CONSUMIBLES": "РАСХОДНИКИ",
		"ESTILO DE VIDA": "ОБРАЗ ЖИЗНИ",
		"DINERO PARADO": "ДЕНЬГИ БЕЗ ДЕЛА",
		"NÓMINA": "ЗАРПЛАТА",
		"INGRESOS": "ДОХОДЫ",
		"DESCUENTOS": "ВЫЧЕТЫ",
		"VER DESGLOSE": "ПОКАЗАТЬ ДЕТАЛИ",
		"OCULTAR DESGLOSE": "СКРЫТЬ ДЕТАЛИ",
		"PRIMA DE RESULTADO": "БОНУС ЗА РЕЗУЛЬТАТ",
		"PRIMA POR GOL": "БОНУС ЗА ГОЛ",
		"PRIMA POR ASISTENCIA": "БОНУС ЗА АССИСТ",
		"PATROCINIO": "СПОНСОР",
		"COMISIÓN DEL AGENTE": "КОМИССИЯ АГЕНТА",
		"CÁMARA ROTA": "РАЗБИТАЯ КАМЕРА",
		"BALÓN A LA GRADA": "МЯЧ НА ТРИБУНУ",



		"BALÓN A LA CALLE": "МЯЧ НА УЛИЦУ",
		"RECOGEPELOTAS DERRIBADO": "ПОДАЮЩИЙ МЯЧИ СБИТ",
		"CRISTAL DEL PALCO": "СТЕКЛО ЛОЖИ",
		"EN NÚMEROS ROJOS": "В МИНУСЕ",
		"ficha $ {0} / partido": "зарплата $ {0} / матч",
		"ficha $ {0} − gastos $ {1}": "зарплата $ {0} − расходы $ {1}",
		"Te miden como {0}": "Тебя оценивают как: {0}",
		"Juega {0} partidos  (llevas {1})": "Сыграй матчей: {0}  (уже {1})",
		"Promedia {0} de nota  (llevas {1})": "Средняя оценка: {0}  (сейчас {1})",
		"Te hacen famoso, pero casi todo le sienta mal al técnico o al vestuario.":
			"Они делают тебя знаменитым, но почти все это не нравится тренеру или раздевалке.",
		"TUYO": "ТВОЕ",
		"ESTÉTICA": "ОБРАЗ",
		"Lo único que se compra y SE VE: te cambia de verdad en el hub, en la previa y"
		+ " en la cancha. No da ventaja ninguna, y por eso mismo es tuyo elegirlo. Los"
		+ " cortes y barbas de siempre siguen siendo gratis en PERSONALIZAR.":
			"Единственное, что покупается и ВИДНО: меняет тебя по-настоящему в хабе, в предматчевых сценах и на поле. Никакого преимущества не дает — потому и выбирать тебе. Обычные стрижки и бороды по-прежнему бесплатны в разделе ПЕРСОНАЛИЗАЦИЯ.",
		"INVERSIONES": "ВЛОЖЕНИЯ",
		"Para cuando el dinero sobra: mejoran tu cuerpo o tu bolsillo, para siempre y sin mantenimiento.":
			"Для тех случаев, когда денег девать некуда: улучшают твое тело или кошелек — навсегда и без содержания.",
		"PONER": "НАДЕТЬ",
		"TE QUEDA BIEN": "ТЕБЕ ИДЕТ",
		"LOGRO: {0}": "НАГРАДА: {0}",
		"MANTENIMIENTO  -${0} / PARTIDO": "СОДЕРЖАНИЕ  -${0} / МАТЧ",
		"USAR": "ВЗЯТЬ",
		"Tu míster. Convéncelo en la cancha.": "Твой тренер. Убеди его на поле.",
		"Decide si juegas y cuántos minutos.":
			"Решает, играешь ли ты и сколько минут.",
		"Decide si el balón te llega.": "Решает, дойдет ли до тебя мяч.",
		"Sube tu valor y abre las puertas de las marcas.":
			"Поднимает твою стоимость и открывает двери к брендам.",
		"Tu fama: qué marcas te buscan y qué clubes se fijan en ti.":
			"Твоя слава: какие бренды тебя ищут и какие клубы на тебя смотрят.",
		"Cuántas ofertas ves, la ficha que te sacan (hasta +15%) y qué tan bien regateas.":
			"Сколько предложений ты видишь, какую зарплату тебе выбивают (до +15%) и как хорошо ты торгуешься.",
		"Patrocinadores": "Спонсоры",
		"Cómo vas con los objetivos de tus marcas.":
			"Как ты справляешься с целями своих брендов.",
		"TUS MARCAS · {0} DE {1}": "ТВОИ БРЕНДЫ · {0} ИЗ {1}",
		"Ninguna todavía. Sal en la prensa y vendrán solas.":
			"Пока ни одного. Мелькай в прессе — и они придут сами.",
		"TE BUSCAN": "ТЕБЯ ИЩУТ",
		"La temporada ya está en marcha: las marcas cerraron sus contratos en"
		+ " pretemporada. Vuelven a buscarte cuando empiece la siguiente.":
			"Сезон уже идет: бренды закрыли свои контракты в предсезонке. Снова начнут искать тебя, когда стартует следующий.",
		"Nadie por ahora. La prensa manda aquí.": "Пока никого. Здесь все решает пресса.",
		"PRETEMPORADA: es ahora o el año que viene. En cuanto juegues la primera"
		+ " jornada se cierra, y lo que no firmes ya no vuelve esta temporada.":
			"ПРЕДСЕЗОНКА: сейчас или через год. Как только сыграешь первый тур, окно закроется, и что не подпишешь — в этом сезоне уже не вернется.",
		"OBJETIVO: {0}": "ЦЕЛЬ: {0}",
		"SIN HUECO": "НЕТ МЕСТА",
		"FIRMAR": "ПРИНЯТЬ",
		"{0}  ({1}/{2})  ·  premio ${3}": "{0}  ({1}/{2})  ·  бонус ${3}",
		"{0}  ({1})  ·  premio ${2}": "{0}  ({1})  ·  бонус ${2}",
		"Se cobra al final de la temporada.": "Выплачивается в конце сезона.",
		"ROMPER": "РАЗОРВАТЬ",
		"¿ROMPER CON {0}?": "РАЗОРВАТЬ: {0}?",
		"Pierdes el contrato, su pago por partido y el premio del objetivo. No vuelve.":
			"Ты теряешь контракт, выплаты за матч и бонус за цель. Этот бренд не вернется.",
		"TUS PATROCINADORES": "ТВОИ СПОНСОРЫ",
		"SIN MARCAS": "БЕЗ БРЕНДОВ",
		"{0}/{1} OBJETIVOS": "ЦЕЛИ: {0}/{1}",
		"Desde el banquillo no cobras: sólo cuentan (y se pagan) las jornadas de {0}' o más.":
			"Со скамейки не платят: засчитываются (и оплачиваются) только туры, где ты сыграл от {0}'.",
		"Te perdonan parte del objetivo por las {0} jornadas que te perdiste lesionado (firmaste {1}).":
			"Тебе прощают часть цели за туры, пропущенные из-за травмы: {0} (по контракту — {1}).",
		"Te piden menos jornadas por las {0} que te perdiste lesionado. La media no baja.":
			"Из-за туров, пропущенных по травме ({0}), от тебя ждут меньше матчей. Планка по оценке не снижается.",
		"{0} no te llama: le fallaste. Le quedan {1} temporada(s) de enfado.":
			"{0} не звонит: ты подвел этот бренд. Сезонов обиды впереди: {1}.",
		"INDEMNIZACIÓN: ${0} de lo que ya te pagaron.":
			"НЕУСТОЙКА: ${0} из того, что тебе уже заплатили.",
		"ROMPO EL CONTRATO": "РАЗРЫВАЮ КОНТРАКТ",
		"CLASIFICACIÓN · {0}": "ТАБЛИЦА · {0}",
		"{0} (TÚ)": "{0} (ТЫ)",
		"{0} PTS ({1} PJ)": "{0} ОЧК. ({1} И)",
		"— objetivo del club: {0} —": "— цель клуба: {0} —",
		"TU GRUPO": "ТВОЯ ГРУППА",
		"TU CUADRO": "ТВОЯ СЕТКА",
		"¡CAMPEÓN!": "ЧЕМПИОНЫ!",
		"Eliminado": "Вылет",
		"Fuera en la fase de grupos": "Вылет на групповом этапе",
		"Fuera en la fase de liga": "Вылет на этапе лиги",
		"No la juegas esta temporada — así va en el mundo.":
			"В этом сезоне ты не участвуешь — вот как идет турнир.",
		"Tu club no está esta temporada — así va en el mundo.":
			"Твоего клуба в этом сезоне нет — вот как идет турнир.",
		"Sin campo europeo esta temporada.": "В этом сезоне без еврокубков.",
		"CAMPEÓN: {0}": "ЧЕМПИОН: {0}",
		"ACTIVO": "ИДЕТ",
		"No la juegas esta temporada — mira su carrera de goleo.":
			"В этом сезоне ты не участвуешь — посмотри гонку бомбардиров.",
		"COPA NACIONAL": "КУБОК СТРАНЫ",
		"Aún no arranca.": "Еще не стартовал.",
		"¡CAMPEÓN DE COPA!": "ОБЛАДАТЕЛИ КУБКА!",




		"¡CAMPEÓN DE LIGA!": "ЧЕМПИОНЫ ЛИГИ!",
		"¡CAMPEÓN DE COPA DE CAMPEONES!": "ОБЛАДАТЕЛИ КУБКА ЭЛИТЫ!",
		"¡CAMPEÓN DE COPA EUROPA!": "ОБЛАДАТЕЛИ КУБКА ЕВРОПЫ!",
		"¡CAMPEÓN DE COPA CONFERENCIA!": "ОБЛАДАТЕЛИ КУБКА ЧЕЛЛЕНДЖ!",
		"Fase final de Copa de Campeones": "Плей-офф Кубка элиты",
		"Fase final de Copa Europa": "Плей-офф Кубка Европы",
		"Fase final de Copa Conferencia": "Плей-офф Кубка Челлендж",
		"Clasificado a Copa de Campeones": "Путевка в Кубок элиты",
		"Clasificado a Copa Europa": "Путевка в Кубок Европы",
		"Clasificado a Copa Conferencia": "Путевка в Кубок Челлендж",
		"Eliminado de la Copa": "Вылет из кубка",
		"A eliminatoria directa: sin tabla de goleadores.":
			"Сразу плей-офф: таблицы бомбардиров нет.",
		"MUNDIAL DE CLUBES": "КЛУБНЫЙ МУНДИАЛЬ",
		"Contra los mejores clubes de otras confederaciones.":
			"Против лучших клубов других конфедераций.",
		"¡CAMPEÓN DEL MUNDO DE CLUBES!": "ПОБЕДИТЕЛИ КЛУБНОГО МУНДИАЛЯ!",
		"Eliminado del Mundial de Clubes": "Вылет с клубного мундиаля",
		"Aún sin nacionalidad.": "Гражданства пока нет.",
		"El Mundial se juega cada {0} temporadas; quedar entre los {1} primeros del"
		+ " grupo clasifica.":
			"Мундиаль проходит каждые {0} сез.; путевку получают лучшие {1} в группе.",
		"Sin datos de esta competición todavía.": "По этому турниру пока нет данных.",
		"TOP 10 · GOLEO": "ТОП-10 · ГОЛЫ",
		"TOP 10 · ASISTENCIAS": "ТОП-10 · АССИСТЫ",
		"TOP 10 · MEDIA": "ТОП-10 · ОЦЕНКА",
		"{0} {1} · vs": "{0} {1} · vs",
		"Por definir": "Неизвестно",
		"Por definir.": "Неизвестно.",
		"Fase de grupos": "Групповой этап",


		"Fase de liga": "Этап лиги",



		"EL SORTEO": "ЖЕРЕБЬЕВКА",


		"GRUPO DE LA MUERTE": "ГРУППА СМЕРТИ",


		"EL MUNDIAL ES ESTE AÑO": "МУНДИАЛЬ — В ЭТОМ ГОДУ",
		"EL MUNDIAL ES EL AÑO QUE VIENE": "МУНДИАЛЬ — В СЛЕДУЮЩЕМ ГОДУ",
		"MUNDIAL EN {0} TEMPORADAS": "МУНДИАЛЬ ЧЕРЕЗ {0} СЕЗ.",
		"Lo juegas con {0} años.": "Возраст на турнире: {0}.",
		"Llegarás con {0} años.": "Возраст к турниру: {0}.",
		"No llegarás: a esa edad ya estarás retirado.": "Не успеешь: к тому времени ты уже завершишь карьеру.",
		"TUS RIVALES": "ТВОИ СОПЕРНИКИ",
		"{0} EN CASA · {1} FUERA": "ДОМА: {0} · В ГОСТЯХ: {1}",
		"Los mismos que verás en tu calendario.":
			"Те же, что ты увидишь в своем календаре.",
		"FASE DE LIGA": "ЭТАП ЛИГИ",
		"TÚ": "ТЫ",
		"{0}. {1}  {2} PTS ({3} PJ)": "{0}. {1}  {2} ОЧК. ({3} И)",
		"Aún no arranca": "Еще не стартовал",
		"¡Campeón de Copa!": "Обладатели кубка!",
		"En {0}": "Стадия: {0}",
		"En juego": "Идет",
		"¡Campeón de Copa de Campeones!": "Обладатели Кубка элиты!",
		"Fase final": "Плей-офф",
		"OCTAVOS DE FINAL": "1/8 ФИНАЛА",
		"CUARTOS DE FINAL": "1/4 ФИНАЛА",
		"SEMIFINAL": "ПОЛУФИНАЛ",



		"Playoff": "Плей-офф",
		"PLAYOFF": "ПЛЕЙ-ОФФ",
		"Octavos": "1/8 финала",
		"Cuartos": "1/4 финала",
		"Semifinal": "Полуфинал",
		"Final": "Финал",
		"LEYENDAS DEL MUNDO": "ЛЕГЕНДЫ МИРА",
		"TABLEROS MUNDIALES": "МИРОВЫЕ РЕЙТИНГИ",
		"Arriba, las leyendas de tu partida. Aquí, jugadores reales de todo el mundo: tu mejor carrera se manda al cerrar cada temporada.": "Выше — легенды твоего сохранения. Здесь — реальные игроки со всего мира: твоя лучшая карьера отправляется в конце каждого сезона.",
		"VER EN GAME CENTER": "ОТКРЫТЬ GAME CENTER",
		"FORTUNA": "СОСТОЯНИЕ",
		"LOGROS EN GAME CENTER": "ДОСТИЖЕНИЯ В GAME CENTER",
		"Arriba, tu catálogo completo. En Game Center, los que Apple conoce: se mandan solos al desbloquearse, y ahí se ve cuántos jugadores del mundo tienen cada medalla.": "Выше — весь твой каталог. В Game Center — те, о которых знает Apple: они отправляются сами при открытии, и там видно, сколько игроков в мире получили каждую медаль.",
		"TOP {0}": "ТОП-{0}",
		"MÁS TROFEOS INDIVIDUALES": "ЛИЧНЫЕ ТРОФЕИ",
		"MÁS TROFEOS DE EQUIPO": "КОМАНДНЫЕ ТРОФЕИ",
		"MÁS TROFEOS EN TOTAL": "ВСЕГО ТРОФЕЕВ",
		"Los premios que se ganan uno solo: el mejor del año y las botas de goleo.":
			"Награды, которые берешь в одиночку: игрок года и призы лучшему бомбардиру.",
		"Ligas, copas, continentales y Mundiales: lo que se levanta con once.":
			"Лиги, кубки, континентальные турниры и мундиали: то, что поднимают всей командой.",
		"La vitrina entera, sin preguntar de dónde salió cada trofeo.":
			"Вся витрина трофеев, без вопросов, откуда взялся каждый.",
		"LEYENDAS POR LIGA": "ЛЕГЕНДЫ ПО ЛИГАМ",
		"LEYENDAS POR CLUB": "ЛЕГЕНДЫ ПО КЛУБАМ",
		"No ha habido leyendas en {0}… aún.": "{0} — пока без легенд… пока что.",
		"este club": "Этот клуб",
		"INDIV.": "ЛИЧН.",
		"EQUIPO": "КОМАНДА",
		"GOLES + ASISTENCIAS": "ГОЛЫ + АССИСТЫ",
		"LA LEYENDA A TIRO": "ЛЕГЕНДА БЛИЗКО",
		"A {0} DE LA LEYENDA": "ДО ЛЕГЕНДЫ: {0}",
		"IGUALADO CON LA LEYENDA": "НАРАВНЕ С ЛЕГЕНДОЙ",
		"Máximos productores de la historia (G+A). Sólo cuenta lo hecho en 1ª división"
		+ " o con tu selección: es lo que mide a los grandes.":
			"Самые результативные игроки в истории (Г+П). Считается только сыгранное в высшей лиге и за сборную: именно этим меряют великих.",
		"TU PRODUCCIÓN · POR CATEGORÍA": "ТВОЙ ВКЛАД · ПО УРОВНЯМ",
		"ÉLITE (1ª + SELECCIÓN)": "ЭЛИТА (1-Я + СБОРНАЯ)",
		"TOTAL (TODAS LAS CATEGORÍAS)": "ВСЕГО (ВСЕ УРОВНИ)",
		"La diferencia ({0} G · {1} A) es lo hecho en 2ª y 3ª división.":
			"Разница ({0} Г · {1} А) — это сделанное во 2-й и 3-й лигах.",
		"Balón de Oro": "Игрок года",
		"Goleo": "Бомбардир",
		"Ligas": "Лиги",
		"Copas": "Кубки",
		"Continental": "Континент",
		"Mundial": "Мундиаль",
		"LOS MÁS LAUREADOS DEL MUNDO": "САМЫЕ ТИТУЛОВАННЫЕ В МИРЕ",
		"CLUBES · {0}": "КЛУБЫ · {0}",


		"TE QUIEREN": "ТЕБЯ ХОТЯТ",
		"TE MIRA": "НА ПРИМЕТЕ",
		"NADIE": "НИКТО",
		"1 CLUB": "1 КЛУБ",
		"Hoy ningún club te ficharía a tu nivel. Rinde y sube tu valor para que empiecen a mirarte.": "Сегодня ни один клуб не подписал бы тебя на твоем уровне. Играй лучше и поднимай свою стоимость, чтобы на тебя начали смотреть.",
		"{0} CLUBES": "КЛУБОВ: {0}",
		"CLUB": "КЛУБ",
		"INTERNACIONALIDADES": "МАТЧИ ЗА СБОРНУЮ",
		"GOLES": "ГОЛЫ",
		"{0} · TEMPORADA {1}{2}": "{0} · СЕЗОН {1}{2}",
		"no convocado": "не вызван",
		"RUMBO AL MUNDIAL": "ПУТЬ НА МУНДИАЛЬ",
		"El Mundial se juega cada 4 temporadas. Quedar entre los {0} primeros de tu"
		+ " grupo clasifica.":
			"Мундиаль проходит раз в 4 сезона. Путевку получают лучшие {0} в группе.",
		"HISTORIAL": "ИСТОРИЯ",
		"Aún no has cerrado una temporada con la selección.":
			"Ты еще не завершил ни одного сезона со сборной.",
		"T{0} · {1}": "С.{0} · {1}",
		"SELECCIÓN DE {0}": "СБОРНАЯ · {0}",
		"FUERA DE LA CONVOCATORIA": "ВНЕ ЗАЯВКИ",
		"SIN DORSAL": "БЕЗ НОМЕРА",
		"VER CONVOCATORIA": "СМОТРЕТЬ ЗАЯВКУ",





		"PTS": "PTS",
		"A {0} PUESTOS": "ОТСТАВАНИЕ: {0}",
		"PUESTO {0}": "МЕСТО {0}",
		"Tu media es {0}. Con la vara de {1} son {2}; {3} de fama y {4} de mérito la dejan en {5}.":
			"Твой рейтинг — {0}. По меркам сборной {1} это {2}; {3} за славу и {4} за заслуги дают в итоге {5}.",
		"CORTE LISTA": "ПОРОГ ЗАЯВКИ",
		"CORTE ONCE": "ПОРОГ ОСНОВЫ",


		"Eres el número {0} de {1} por puntuación, pero el sitio que ocuparías es el de {2} ({3}): a nadie que te saque más de {4} se le quita el puesto. Necesitas {5}.":
			"По рейтингу ты номер {0} в сборной {1}, но место, которое ты бы занял, — у игрока {2} ({3}), а того, кто опережает тебя больше чем на {4}, из состава не убирают. Нужно {5}.",
		"Entras en la lista, pero no en el once: el sitio que ocuparías es el de {0} ({1}) y a nadie que te saque más de {2} se le quita el puesto. Necesitas {3}.":
			"В заявку ты попадаешь, но не в основу: место, которое ты бы занял, — у игрока {0} ({1}), а того, кто опережает тебя больше чем на {2}, не убирают. Нужно {3}.",

		"Lo que más te acerca: ganarte al seleccionador en la concentración (hasta {0}), un título individual (hasta {1}) y tu temporada de club (hasta {2}).":
			"Сильнее всего тебя приблизят: убедить тренера сборной на сборах (до {0}), личная награда (до {1}) и твой сезон в клубе (до {2}).",




		"Tu puntuación ya es {0} y hoy daría para entrar, pero la lista de esta campaña se cerró antes de que llegaras: el seleccionador no la rehace a mitad de camino. Tu sitio se juega en la próxima.":
			"Твой рейтинг уже {0}, и сегодня этого хватило бы, но заявку на этот цикл закрыли до тебя: тренер сборной не переделывает ее на полпути. Твое место разыграют в следующей.",
		"Sigues en la lista de esta campaña: al seleccionador no le gusta cortar a nadie a mitad de camino. Pero tu puntuación cayó a {0} y el corte está en {1}: si no reaccionas, la próxima lista se hace sin ti.":
			"Ты еще в заявке на этот цикл: тренер сборной не любит отчислять кого-то на полпути. Но твой рейтинг упал до {0}, а порог — {1}: не исправишься — следующую заявку соберут без тебя.",

		"Debut: {0} años": "Возраст дебюта: {0}",
		"Temporada {0}": "Сезон {0}",
		"marcaste": "ты забил",
		"RETIRADO DE LA SELECCIÓN": "УШЕЛ ИЗ СБОРНОЙ",
		"RETIRARTE DE LA SELECCIÓN": "УЙТИ ИЗ СБОРНОЙ",
		"YA NO ENTRAS EN LA LISTA": "ТЕБЯ БОЛЬШЕ НЕ ВЫЗЫВАЮТ",
		"GOLEADORES HISTÓRICOS": "БОМБАРДИРЫ ВСЕХ ВРЕМЕН",
		"¿CUELGAS LA CAMISETA DE TU PAÍS?": "ЗАВЕРШИШЬ КАРЬЕРУ В СБОРНОЙ?",
		"El seleccionador ya no cuenta contigo. Tus {0} partidos y {1} goles quedan sellados, y las fechas de selecciones dejan de costarte energía. Sólo un Mundial podría hacerte volver.": "Тренер сборной больше на тебя не рассчитывает. Твои матчи ({0}) и голы ({1}) навсегда в истории, а паузы на сборные больше не отнимают у тебя энергию. Вернуть тебя может только мундиаль.",

		"Colgaste la camiseta de {0}. Sus torneos siguen en tu calendario, pero"
		+ " los ves desde fuera.":
			"Ты завершил карьеру в сборной {0}. Ее турниры остаются в твоем календаре, но ты смотришь их со стороны.",
		"VOLVER PARA EL MUNDIAL": "ВЕРНУТЬСЯ НА МУНДИАЛЬ",
		"¿VUELVES DEL RETIRO?": "ВЕРНЕШЬСЯ В СБОРНУЮ?",
		"{0} juega el Mundial y el seleccionador te quiere en la lista. Volver es volver de verdad: las fechas de selecciones vuelven a contar contigo.": "Сборная {0} едет на мундиаль, и тренер хочет видеть тебя в заявке. Вернуться — значит всерьез: паузы на сборные снова будут на тебе.",
		"VUELVO": "ВЕРНУСЬ",
		"{0} JUGADORES": "ИГРОКОВ: {0}",
		"Grupo por definir.": "Группа пока не определена.",
		"{0}. {1}  {2} PTS ({3})": "{0}. {1}  {2} ОЧК. ({3})",
		"— corte de clasificación —": "— черта отбора —",
		"Ahora mismo: {0}": "Прямо сейчас: {0}",
		"CLASIFICADA": "ПУТЕВКА ЕСТЬ",
		"fuera del Mundial": "вне мундиаля",
		"fuera de {0}": "вне турнира: {0}",
		"Cuadro por definir.": "Сетка пока не определена.",
		"{0} no está en {1}.": "{0} не участвует в турнире: {1}.",
		"Clasifícala la próxima vez quedando entre los tres primeros de tu grupo.":
			"Пробейся туда в следующий раз — войди в тройку лучших своей группы.",
		"¡{0}, CAMPEÓN de {1}!": "{0} — ЧЕМПИОН: {1}!",
		"Proyección de {0}: {1}": "{0}, прогноз: {1}",
		"{0} selecciones en el cuadro. Tu papel en el club mueve la aguja: rinde y"
		+ " llévala lejos.":
			"Сборных в сетке: {0}. Твоя роль в клубе влияет на исход: играй хорошо и проведи ее как можно дальше.",
		"Las clasificatorias aún no empiezan.": "Отбор еще не начался.",
		"{0}. {1}  {2} PTS ({3}, {4} PJ)": "{0}. {1}  {2} ОЧК. ({3}, {4} И)",
		"— corte de clasificación al Mundial —": "— черта отбора на мундиаль —",
		"¡{0} CLASIFICADA!": "{0}: ПУТЕВКА ЕСТЬ!",
		"{0} se quedó fuera del Mundial": "{0}: без мундиаля",
		"{0} · vs": "{0} · vs",
		"{0} quedó eliminada de {1}": "{0} выбывает из турнира: {1}",
		"LIBRO DE RÉCORDS": "КНИГА РЕКОРДОВ",
		"LIGA · CLUB · MUNDO": "ЛИГА · КЛУБ · МИР",
		"ABRIR": "ОТКРЫТЬ",
		"VITRINA": "ТРОФЕИ",
		"Aún vacía. Gana una liga, una copa o una bota y aquí lucirá tu primer trofeo.":
			"Пока пусто. Выиграй лигу, кубок или приз лучшему бомбардиру — и здесь засияет твой первый трофей.",
		"TEMPORADA A TEMPORADA": "СЕЗОН ЗА СЕЗОНОМ",
		"EN EQUIPO · {0}": "КОМАНДНЫЕ · {0}",
		"INDIVIDUALES · {0}": "ЛИЧНЫЕ · {0}",
		"Aún no has cerrado ninguna temporada.": "Ты еще не завершил ни одного сезона.",
		"* temporada en curso": "* сезон еще идет",
		"El detalle por temporada aparecerá aquí al cerrar la temporada en la que ganes"
		+ " tu próximo premio.":
			"Подробности по сезонам появятся здесь, когда завершится сезон, в котором ты выиграешь следующую награду.",
		"POR TEMPORADA": "ПО СЕЗОНАМ",
		"TRASPASOS": "ТРАНСФЕРЫ",
		"Sigues donde empezaste.": "Ты все там же, где начинал.",
		"LEGADO": "НАСЛЕДИЕ",
		"Puntos de legado: {0} — suben con goles, títulos y partidos con tu"
		+ " selección.":
			"Очки наследия: {0} — растут от голов, титулов и матчей за сборную.",
		"Vía Mundo · prestigio {0}/{1}": "Мировой путь · престиж {0}/{1}",
		"necesitas {0} puntos de legado": "нужно очков наследия: {0}",
		"Vía Club · {0}/{1} títulos": "Клубный путь · титулы: {0}/{1}",
		"{0} histórico del club": "{0} в истории клуба",
		"(pide top-2)": "(нужен топ-2)",
		"aún no figuras entre sus leyendas": "среди его легенд тебя пока нет",
		"Fuera del top {0} de la historia": "Вне топ-{0} всех времен",
		"{0} de la historia": "{0} в истории",
		"Nadie por encima: el más grande que ha pisado un campo.":
			"Выше никого: величайший из всех, кто выходил на поле.",
		"El siguiente a superar": "Следующий, кого обойти",
		"Te falta 1 trofeo": "Остался 1 трофей",
		"Te faltan {0} trofeos": "Осталось трофеев: {0}",
		"Goles por temporada": "Голы за сезон",
		"{0}T": "С.{0}",
		"COMO SE SUBE": "КАК ПОДНЯТЬСЯ",
		"Goles, asistencias y partidos con tu selección suman siempre — los"
		+ " primeros valen mucho y el volumen se aplana. Los trofeos suman entero"
		+ " lo suyo:":
			"Голы, ассисты и матчи за сборную идут в зачет всегда — первые стоят много, а дальше рост замедляется. Трофеи засчитываются полностью:",
		"{0} a los {1}": "{0}, возраст: {1}",
		"ASÍ VA LA VOTACIÓN": "ГОЛОСОВАНИЕ СЕЙЧАС",
		"Con lo jugado hasta la jornada {0} de {1}. Si la temporada cerrara hoy,"
		+ " el 1º se lo lleva: el ranking manda, sin excepciones.":
			"По итогам туров: {0} из {1}. Если бы сезон закончился сегодня, награду забрал бы первый: решает рейтинг, без исключений.",
		"Sólo votan la PRIMERA división de las ligas EUROPEAS. Y los títulos del"
		+ " año entran al cierre: una {0} son {1} puntos que hoy no lleva nadie.":
			"Голосуют только ВЫСШИЕ лиги ЕВРОПЕЙСКИХ стран. А трофеи года засчитываются в конце сезона: {0} — это {1} очк., которых сегодня нет ни у кого.",
		"Gana el que más puntos suma, sin excepciones. Los títulos no son una"
		+ " llave aparte: son la forma más rápida de sumar.":
			"Побеждает тот, у кого больше очков, без исключений. Титулы — не отдельный путь, а самый быстрый способ набрать очки.",
		"La LIGA y la COPA valen según la liga en que se ganan: las cinco grandes"
		+ " pagan el doble que las ligas pequeñas. Abajo van los puntos de TU liga.":
			"ЛИГА и КУБОК весят столько, сколько стоит лига, где их выиграли: топ-5 лиг дают вдвое больше, чем маленькие. Ниже — очки ТВОЕЙ лиги.",
		"Tú vas más abajo:": "Ты ниже:",
		"El mejor de tu equipo:": "Лучший в твоей команде:",
		"Aún no has jugado este año: sin partidos no hay votación que valga.":
			"В этом году ты еще не играл: без матчей голосовать не за что.",
		"Tu liga no vota: para entrar hay que jugar la PRIMERA división de una"
		+ " liga EUROPEA.":
			"Твоя лига не голосует: для этого нужно играть в ВЫСШЕЙ лиге ЕВРОПЕЙСКОЙ страны.",
		"{0} para {1}": "{1}: еще {0}",
		"TU RECORRIDO": "ТВОЙ ПУТЬ",


		"T{0}-T{1}": "С.{0}-{1}",
		"Llegaste CEDIDO": "Пришел В АРЕНДУ",
		"Pagaron ${0} por ti": "За тебя заплатили ${0}",
		"Aquí empezaste": "Здесь ты начинал",
		"Llegaste gratis": "Пришел бесплатно",
		"GLOBAL": "ИТОГО",
		"PARTIDOS": "МАТЧИ",
		"{0}V · {1}E · {2}D": "В {0} · Н {1} · П {2}",
		"ASISTENCIAS": "АССИСТЫ",
		"MEDIA": "ОЦЕНКА",



		"GOLEO": "ГОЛЫ",
		"mejor: {0}": "лучший: {0}",
		"TEMPORADAS": "СЕЗОНЫ",
		"en {0} {1}": "в {0} {1}",
		"INTERNACIONAL": "СБОРНАЯ",
		"{0} goles con {1}": "Голы за сборную {1}: {0}",
		"$ {0}  ·  ahora": "$ {0}  ·  сейчас",
		"La curva aparece al cerrar tu segunda temporada.":
			"График появится, когда ты завершишь второй сезон.",
		"Pico: ${0} en la temporada {1}": "Пик: ${0} в сезоне {1}",
		"T{0} · ${1}": "С.{0} · ${1}",
		"tabLIGA": "ЛИГА",
		"tabCHAMP": "ЭЛИТА",
		"tabEUROPA": "ЕВРОПА",
		"tabCOPA": "КУБОК",
		"tabCLUBES": "КЛУБЫ",
		"tabMUNDIAL": "МУНДИАЛЬ",
		"tabCONTIN.": "КОНТ.",
		"tabCLASIF": "ОТБОР",
		"palmaresLIGA": "ЛИГА",
		"palmaresCOPA": "КУБОК",
		"palmaresCONT.": "КОНТ.",
		"tablaTEMP": "СЕЗ.",
		"tablaCLUB": "КЛУБ",
		"tablaPJ": "И",
		"tablaG": "Г",
		"tablaA": "А",
		"tablaNOTA": "ОЦ.",


		"tabla_ligaEQUIPO": "КОМАНДА",
		"tabla_ligaPJ": "И",
		"tabla_ligaG": "В",
		"tabla_ligaE": "Н",
		"tabla_ligaP": "П",
		"tabla_ligaPTS": "О",
		"tabla_ligaGOLES": "МЯЧИ",
		"tabla_ligaASIST": "АССИСТЫ",

		"CED": "АРЕНДА",
		"{0}A": "{0} Г",
		"{0}S": "{0} Н",
		"{0}P": "{0} М",
		"CEDIDO · NO SE RENUEVA": "В АРЕНДЕ · БЕЗ ПРОДЛЕНИЯ",
		"TREN DE VIDA": "ОБРАЗ ЖИЗНИ",
		"NETO POR PARTIDO": "ЧИСТЫМИ ЗА МАТЧ",
		"TUS NOES": "ОТКАЗЫ",
		"SE VAN HOY": "ИСТЕКАЮТ",
		"Se hartaron de tus noes: el club contaba con esa venta. El técnico deja de contar contigo hasta el año que viene.":
			"Твои отказы им надоели: клуб рассчитывал на эту продажу. До следующего года тренер больше не видит тебя в составе.",
		"Llevas muchos noes: lo que llega ahora ya no es del nivel de lo que tumbaste.":
			"У тебя уже много отказов: то, что приходит теперь, не дотягивает до того, что ты отклонил.",
		"Tu agente sostiene esa oferta: se sabe en la próxima jornada.":
			"Твой агент придерживает это предложение: ответ будет в следующем туре.",
		"Tu agente no acepta más encargos esta ventana.":
			"В это окно твой агент больше не берет заданий.",
		"Te quedan {0} encargo(s) esta ventana (tu agente acepta más cuanto mejor te trate).":
			"Осталось заданий на это окно: {0} (чем лучше у вас отношения, тем больше берет агент).",
		"Tu agente puede llamar igual, pero volverá con las manos vacías y te costará {0}, un poco de vestuario y el trato con él.":
			"Агент все равно может позвонить, но вернется ни с чем, а это обойдется тебе в {0}, немного доверия раздевалки и отношений с ним.",
		"Tu club no te deja salir: pide el traspaso primero.":
			"Клуб тебя не отпускает: сначала подай запрос на трансфер.",
		"El mercado está cerrado: el botón de irte aparece al abrir la ventana. Negarte, puedes ya.":
			"Окно закрыто: кнопка ухода появится, когда оно откроется. Отказывать можно уже сейчас.",
		"PEDISTE EL TRASPASO": "ТЫ ПРОСИШЬ ТРАНСФЕР",
		"ESTÁS CEDIDO": "ТЫ В АРЕНДЕ",
		"Juegas en {0}, pero tu pase es de {1}.":
			"Ты играешь за клуб {0}, а владелец прав — {1}.",
		"tu club dueño": "твой основной клуб",
		"Mientras dure la cesión, aquí no hay nada que firmar ni negociar. Vuelves a {0} al cerrar la temporada.":
			"Пока длится аренда, подписывать и обсуждать здесь нечего. В конце сезона ты возвращаешься — {0} ждет тебя.",
		"Hay clubes esperándote cedido, pero el mercado está cerrado: la cesión se firma cuando abra la ventana.":
			"Клубы готовы взять тебя в аренду, но окно закрыто: аренда оформляется, когда оно откроется.",
		"Estás EN LISTA DE CESIÓN: mientras sigas en ella, cada ventana te trae destinos nuevos.":
			"Ты В АРЕНДНОМ СПИСКЕ: пока ты в нем, каждое окно приносит новые варианты.",
		"{0} · titular probable · una temporada": "{0} · вероятно, в основе · один сезон",
		"Sueldo/partido": "Зарплата/матч",
		"Prima (sin traspaso)": "Бонус (без суммы трансфера)",
		"Traspaso": "Сумма трансфера",
		"Tu prima": "Твой бонус",


		"Prima (bruta)": "Бонус (брутто)",
		"Te queda limpio": "Чистыми тебе",
		"Tu prima (limpia)": "Твой бонус (нетто)",
		"(−{0}% agente)": "(−{0}% агенту)",
		"LA SOSTIENE TU AGENTE": "ПРИДЕРЖАНО АГЕНТОМ",
		"HOY O NUNCA": "КРАЙНИЙ СРОК",
		"Va {0} de {1} en {2} · {3}": "Идет {0} из {1}: {2} · {3}",
		"RECHAZAR ESTA OFERTA": "ОТКАЗ ОТ ПРЕДЛОЖЕНИЯ",




		"MANTÉN PARA FICHAR": "ЗАЖМИ ДЛЯ ПОДПИСИ",
		"¿ENCARGAR?": "ПОРУЧИТЬ?",
		"MANTÉN PARA ENCARGAR": "ЗАЖМИ, ЧТОБЫ ПОРУЧИТЬ",
		"Tu agente trabajará {0} esta ventana. Cuesta {1}.": "Твой агент поработает в это окно: {0}. Стоит {1}.",
		"la liga de {0}": "лига {0}",
		"MANTÉN PARA FIRMAR": "ЗАЖМИ ДЛЯ ПОДПИСИ",
		"MANTÉN PARA NO RENOVAR": "ЗАЖМИ — НЕ ПРОДЛЕВАТЬ",
		"MANTÉN PARA FIRMAR EL PRECONTRATO": "ЗАЖМИ ДЛЯ ПОДПИСИ ПРЕДКОНТРАКТА",
		"MANTÉN PARA RECHAZAR": "ЗАЖМИ ДЛЯ ОТКАЗА",
		"TU CLUB NO TE VENDE: te queda contrato y cuentan contigo. Pide el traspaso ahí abajo para poder firmar.":
			"КЛУБ ТЕБЯ НЕ ПРОДАЕТ: у тебя действующий контракт, и на тебя рассчитывают. Подай запрос на трансфер ниже, чтобы подписать.",
		"QUE TU AGENTE LA SOSTENGA": "ПУСТЬ АГЕНТ ПРИДЕРЖИТ",
		"TU AGENTE LA SOSTIENE · RESPONDEN MAÑANA": "АГЕНТ ПРИДЕРЖАЛ · ОТВЕТ ЗАВТРА",
		"Se retiran de la puja para siempre en este mercado. El mercado cierra hoy: nadie ocupará su hueco.":
			"Они выходят из борьбы до конца этого окна. Окно закрывается сегодня: их место никто не займет.",
		"Tu club contaba con esta venta: con este NO se les acaba la paciencia y el técnico dejará de contar contigo.":
			"Клуб надеялся на эту продажу: после этого «НЕТ» терпение у них лопнет, и тренер перестанет на тебя рассчитывать.",
		"Tu club contaba con esta venta: te quedan {0} noes antes de que se les acabe la paciencia.":
			"Клуб надеялся на эту продажу. Отказов в запасе, пока не лопнет терпение: {0}.",
		"Y llevas muchos noes: lo que llegue en su lugar vendrá por debajo de lo que estás tumbando.":
			"И отказов у тебя уже много: то, что придет взамен, будет хуже того, от чего ты отказываешься.",
		"OFERTA RECHAZADA · EL MERCADO CIERRA HOY": "ОТКЛОНЕНО · ОКНО ЗАКРЫВАЕТСЯ СЕГОДНЯ",
		"CONCENTRADO CON {0}": "НА СБОРАХ: {0}",
		"Aquí mandan otros. Que tu club te adore no le dice nada al seleccionador: a esta gente te la ganas jugando las fechas FIFA.":
			"Здесь командуют другие. То, что тебя обожает клуб, тренеру сборной ни о чем не говорит: этих людей завоевывают игрой в паузы на сборные.",
		"Seleccionador": "Тренер сборной",
		"Es quien firma la lista. Mira tu nota cuando juegas con el país.":
			"Это он подписывает заявку. Следит за твоей оценкой, когда ты играешь за страну.",
		"Las tres suman {0} puntos a tu convocatoria.":
			"Все трое вместе дают твоему вызову {0} очк.",
		"Vestuario de la selección": "Раздевалка сборной",
		"Se gana ganando juntos. Una derrota jugando mal es lo que más resta.":
			"Завоевывается общими победами. Сильнее всего бьет поражение при плохой игре.",
		"Afición de {0}": "Болельщики сборной {0}",
		"Le enamora que marques. En casa, si te quiere te llega un balón más; si te pita, uno menos.":
			"Их покоряют твои голы. Дома, если тебя любят, ты получаешь на один мяч больше; если освистывают — на один меньше.",
		"LOS TUYOS, ESTÉS DONDE ESTÉS": "СВОИ ВСЕГДА С ТОБОЙ",
		"Te siguen a todas partes: lo que hagas con tu país también cuenta.":
			"Они следят за тобой повсюду: то, что ты делаешь в сборной, тоже идет в зачет.",
		"Sigue siendo el tuyo. Una buena fecha FIFA sube tu precio.":
			"Он по-прежнему твой человек. Удачная пауза на сборные поднимает твою цену.",
		"COPA EU": "ЭЛИТА",
		"COPA C.": "ЕВРОПА",
		"COPA 3": "ЧЕЛЛ.",
		"ASCENSO": "ПОВЫШЕНИЕ",
		"DESCENSO": "ВЫЛЕТ",
		"CUADRO": "СЕТКА",
		"Torneo en curso.": "Турнир идет.",
		"Quedar entre los {0} primeros del grupo clasifica para {1}.":
			"Лучшие {0} в группе получают путевку: {1}.",
		"Pasan los {0} primeros de cada grupo.": "Дальше проходят лучшие {0} в каждой группе.",
		"El cuadro se sortea al acabar la fase de grupos.":
			"Сетку разыграют после группового этапа.",


		"El cuadro se sortea al acabar la primera fase.":
			"Сетку разыграют после первого этапа.",
		"Del 1 al {0}, a octavos. Del {1} al {2}, al playoff. El resto, fuera.":
			"Места 1–{0} — в 1/8 финала. Места {1}–{2} — в плей-офф. Остальные выбывают.",
		"Todavía no se ha entregado ninguno. Se falla al cerrar cada temporada, con los números de todo el mundo.":
			"Ни одна награда пока не вручена. Решается в конце каждого сезона по цифрам всего мира.",
		"LA VOTACIÓN": "ГОЛОСОВАНИЕ",

		"EL ONCE IDEAL": "СБОРНАЯ СЕЗОНА",

		"{0} ligas en {1} años": "Чемпионских титулов: {0} за {1} г.",
		"Aún no se ha cerrado ninguna temporada.": "Еще ни один сезон не завершен.",
		"Antes de tu carrera, sin fechas: {0}": "До твоей карьеры, без дат: {0}",
		"Los once mejores de {0} esa temporada, por nota media.": "{0}: лучшие 11 игроков того сезона по средней оценке.",
		"Los que más cerca estuvieron, con lo que hizo cada uno. Los puntos salen del baremo de abajo.":
			"Те, кто был ближе всех, и что сделал каждый. Очки — по шкале ниже.",
		"Tú quedaste más abajo:": "Ты оказался ниже:",
		"Ese año no entraste en la votación.": "В тот год ты не попал в голосование.",
		"Una línea por temporada: goles, asistencias, media y puntos de la votación. Toca una para verla completa.":
			"По строке на сезон: голы, ассисты, оценка и очки голосования. Нажми на строку, чтобы увидеть ее целиком.",
		"ASIST.": "АСС.",
		"PUNTOS": "ОЧКИ",
		"No levantó ningún título esa temporada.": "В том сезоне трофеев не было.",
		"También: {0}": "А также: {0}",
		"COMO SE GANA": "КАК ВЫИГРАТЬ",
		"Los puntos con los que se elige al mejor del año. Los de tu selección y los de Europa pesan más.":
			"Очки, по которым выбирают игрока года. Матчи за сборную и в Европе весят больше.",
		"Sólo entran en la votación los que juegan la PRIMERA DIVISIÓN de una liga EUROPEA.":
			"В голосование попадают только игроки ВЫСШЕЙ ЛИГИ ЕВРОПЕЙСКОЙ страны.",
		"GOL EN LIGA": "ГОЛ В ЛИГЕ",
		"ASISTENCIA EN LIGA": "АССИСТ В ЛИГЕ",
		"GOL EN {0}": "ГОЛ: {0}",
		"ASISTENCIA EN {0}": "АССИСТ: {0}",
		"CADA DECIMA DE MEDIA SOBRE {0}": "КАЖДАЯ 0,1 ОЦЕНКИ ВЫШЕ {0}",
		"{0} PTS": "{0} ОЧК.",
		"{0}G {1}A  ·  {2}": "{0} Г {1} А  ·  {2}",
		"  ({0} en {1})": "  ({0} — {1})",
		"TE PIDIERON: {0}   {1}/{2}": "ТЕБЯ ПРОСИЛИ: {0}   {1}/{2}",
		"CAPITÁN DE {0}": "КАПИТАН: {0}",
		"Llevas la cinta desde hace {0} temporadas.": "Ты носишь повязку уже {0} сез.",
		"JUGAR PARA {0}": "ЗА СБОРНУЮ {0}",
		"SU ONCE CORTA EN {0}": "ПОРОГ ИХ ОСНОВЫ: {0}",
		"¿JUGAR PARA {0}?": "ЗА СБОРНУЮ {0}?",
		"Llevas {0} temporadas jugando ahí y ningún partido oficial te ata todavía a {1}. Su once corta en {2}; el de {1}, en {3}.":
			"Ты играешь там уже {0} сез., и ни один официальный матч пока не связывает тебя со сборной {1}. Их порог основы — {2}; у сборной {1} — {3}.",
		"No hay marcha atrás. Empiezas de cero con ellos: el seleccionador, el vestuario y la afición vuelven a no conocerte, y pierdes el brazalete si lo llevabas. Tus partidos y tus goles se quedan en tu historial.":
			"Пути назад нет. С ними ты начинаешь с нуля: тренер сборной, раздевалка и болельщики снова тебя не знают, а капитанскую повязку, если она была, ты теряешь. Твои матчи и голы остаются в истории.",
		"SÍ, ELIJO {0}": "ВЫБИРАЮ: {0}",
		"SEGUIR CON LOS MÍOS": "ОСТАТЬСЯ СО СВОИМИ",
		"{0} se juega al terminar la temporada de clubes; el campeón se sabrá entonces.":
			"{0} пройдет после окончания клубного сезона; тогда и станет известен чемпион.",
		"Clasifícala la próxima vez quedando entre los {0} primeros de tu grupo.":
			"Пробейся туда в следующий раз — войди в топ-{0} своей группы.",
		"Cada sello es un título: temporada · club · división.":
			"Каждая печать — титул: сезон · клуб · дивизион.",
		"LO QUE SE PUEDE GANAR": "ЧТО МОЖНО ВЫИГРАТЬ",
		"+{0} SIN REGISTRO": "+{0} БЕЗ ЗАПИСИ",

		"GRADA": "ТРИБУНА",
		"+{0} más": "+{0} еще",
		"CED = esa temporada la jugaste CEDIDO: el club de la fila te tenía prestado, no eras suyo.":
			"АРЕНДА = в тот сезон ты играл В АРЕНДЕ: клуб из этой строки взял тебя взаймы, ты не был его игроком.",
		"MAPA DE TIROS": "КАРТА УДАРОВ",
		"PEDIR EL CAMBIO": "ПРОСИТЬ ЗАМЕНУ",
		"PROGRESIÓN": "ПРОГРЕСС",
		"Aún no has rematado. Cada tiro que pegues este año queda marcado aquí, con el sitio desde el que salió.":
			"Ты еще не бил по воротам. Каждый удар в этом году отмечается здесь — с точкой, откуда он был нанесен.",
		"Ese año aún no se apuntaban los remates.":
			"В тот год удары еще не записывались.",
		"Ese año aún no se apuntaban los pases.":
			"В тот год пасы еще не записывались.",
		"Ese año aún no se apuntaba por dónde te movías.":
			"В тот год твои перемещения еще не записывались.",
		"En este partido no remataste.":
			"В этом матче ты не нанес ни одного удара.",
		"En este partido no le dejaste el balón a nadie.":
			"В этом матче ты не сделал ни одной передачи.",
		"En este partido no quedó rastro de tus movimientos.":
			"В этом матче твои перемещения не оставили следа.",
		"A PUERTA": "В СТВОР",
		"Sobre {0} remates medidos": "Учтено ударов: {0}",
		" · {0} bloqueados (no cuentan: no fue tu puntería)":
			" · заблокировано: {0} (не в счет: точность тут ни при чем)",
		"EL MARCO — dónde cruzó cada tiro": "СТВОР — куда шел каждый удар",
		"EL CAMPO — desde dónde tiraste": "ПОЛЕ — откуда ты бил",



		"DESVIADO": "МИМО",
		"TAPADO": "БЛОК",
		"ANULADO": "ОТМЕНЕН",
		"POR DÓNDE ANDUVISTE": "ТВОИ ПЕРЕМЕЩЕНИЯ",

		"REGATE GANADO": "ДРИБЛИНГ УДАЛСЯ",
		"SALISTE CON {0}": "В НАЧАЛЕ: {0}",
		"ACABAS EN {0}": "В КОНЦЕ: {0}",
		"RECUPERASTE": "ВОССТАНОВИЛ",
		"OTRAS COMPRAS": "ДРУГИЕ ПОКУПКИ",
		"DESCANSO Y FÍSICO": "ОТДЫХ И ФОРМА",
		"SIN CAMBIOS": "БЕЗ ИЗМЕНЕНИЙ",
		"EN TODA TU CARRERA": "ЗА ВСЮ КАРЬЕРУ",
		"DESDE MÁS LEJOS": "САМЫЙ ДАЛЬНИЙ",
		"TU GOL MÁS LEJANO": "САМЫЙ ДАЛЬНИЙ ГОЛ",
		"TU PASE MÁS LARGO": "САМЫЙ ДЛИННЫЙ ПАС",
		"Ese año: gol desde {0} m": "В тот год: гол с {0} м",
		"Esta temporada: gol desde {0} m": "В этом сезоне: гол с {0} м",
		"EL MÁS LARGO": "САМЫЙ ДЛИННЫЙ",
		"Ese año: pase de {0} m": "В тот год: пас на {0} м",
		"Esta temporada: pase de {0} m": "В этом сезоне: пас на {0} м",
		"MAPA": "КАРТА",
		"MAPA DE PASES": "КАРТА ПАСОВ",
		"REGATES": "ДРИБЛИНГ",
		"MAPA DE REGATES": "КАРТА ДРИБЛИНГА",
		"JUGADA ABIERTA": "С ИГРЫ",
		"TODA TU CARRERA": "ВСЯ КАРЬЕРА",
		"JUGADA": "С ИГРЫ",
		"TIRO LIBRE": "ШТРАФНОЙ",
		"CÓRNER": "УГЛОВОЙ",
		" · sólo {0}": " · только {0}",
		"Aún no has pisado el campo. Aquí va a quedar el rastro de por dónde te mueves, dónde te quitan el balón y dónde te hacen falta.":
			"Ты еще не выходил на поле. Здесь появится след того, где ты двигаешься, где у тебя отбирают мяч и где на тебе фолят.",
		"TE LA QUITARON": "ПОТЕРИ",
		"FALTAS A FAVOR": "ФОЛЫ НА ТЕБЕ",
		"LA CANCHA — atacas hacia la derecha": "ПОЛЕ — ты атакуешь вправо",
		"Toca una marca del campo para ver la jugada.": "Нажми на отметку на поле, чтобы увидеть эпизод.",
		"min {0}": "{0} мин.",
		"Viendo {0} de {1} · toca otra vez el chip para verlo todo":
			"Показано {0} из {1} · нажми на чип еще раз, чтобы увидеть все",
		"{0}: {1}": "{0}: {1}",
		"ninguno en {0}": "ни одного: {0}",
		"1 de cada {0}": "1 из {0}",
		"Tus asistencias salen sobre todo {0}: {1} de {2}":
			"Твои ассисты чаще всего рождаются {0}: {1} из {2}",
		"Donde más te la quitan: {0}, {1}.": "Чаще всего мяч у тебя отбирают: {0}, {1}.",
		"en el último tercio": "в последней трети",
		"en el medio campo": "в центре поля",
		"en tu propio campo": "на своей половине",
		"POR LA IZQUIERDA": "ПО ЛЕВОМУ КРАЮ",
		"POR EL CENTRO": "ЧЕРЕЗ ЦЕНТР",
		"POR LA DERECHA": "ПО ПРАВОМУ КРАЮ",
		"AL LADO IZQUIERDO": "ВЛЕВО",
		"AL LADO DERECHO": "ВПРАВО",
		"AL PALO": "В ШТАНГУ",
		"POR ENCIMA": "ВЫШЕ ВОРОТ",
		"DESPEJADO": "ВЫНОС",
		"REMATE": "УДАР",
		"ACABÓ EN GOL": "ИТОГ: ГОЛ",
		"ACABÓ EN REMATE": "ИТОГ: УДАР",
		"ANULADO POR FUERA DE JUEGO": "ОТМЕНЕН ИЗ-ЗА ОФСАЙДА",
		"SE QUEDÓ SIN REMATE": "ДО УДАРА НЕ ДОШЛО",
		"SE TE ESCAPÓ": "МЯЧ УСКОЛЬЗНУЛ",
		"TE GANÓ EL PORTERO": "ВРАТАРЬ ПЕРЕИГРАЛ",
		"NO LLEGASTE AL BALÓN": "НЕ ДОТЯНУЛСЯ ДО МЯЧА",
		"TE ENCERRARON": "ТЕБЯ ЗАЖАЛИ",
		"TE HICIERON FALTA": "ФОЛ НА ТЕБЕ",
		"PENAL A TU FAVOR": "ЗАРАБОТАЛ ПЕНАЛЬТИ",
		"PERDISTE EL BALÓN": "ПОТЕРЯЛ МЯЧ",
		"Y TUS REGATES": "И ТВОЙ ДРИБЛИНГ",
		"El tercer mapa: por dónde te mueves de verdad, dónde te quitan el balón y dónde te hacen falta.":
			"Третья карта: где ты на самом деле двигаешься, где у тебя отбирают мяч и где на тебе фолят.",
		"TOCA UNA MARCA": "НАЖМИ НА МЕТКУ",
		"Cada balón del campo se puede tocar: te dice contra quién fue, en qué minuto, y te dibuja el vuelo que tuvo.":
			"На любой мяч на поле можно нажать: узнаешь, против кого это было, на какой минуте, и увидишь его траекторию.",
		"A REMATE": "ДО УДАРА",
		"SIN REMATE": "БЕЗ УДАРА",
		"Sobre {0} pases que llegaron": "Точных передач: {0}",
		" · {0} pases clave": " · ключевых передач: {0}",
		" · {0} anulados por fuera de juego (no cuentan: no fue tu pase)":
			" · отменено из-за офсайда: {0} (не в счет: это не твой пас)",
		"EL CAMPO — de dónde a dónde repartes": "ПОЛЕ — откуда и куда ты пасуешь",


		"LA CANCHA — tu último pase de cada jugada": "ПОЛЕ — твой последний пас в каждой атаке",
		"LA CANCHA — desde dónde tiraste": "ПОЛЕ — откуда ты бил",
		"POR QUÉ ESA NOTA": "ПОЧЕМУ ТАКАЯ ОЦЕНКА",
		"LO QUE SUMÓ": "ЧТО ПОМОГЛО",
		"LO QUE RESTÓ": "ЧТО ПОМЕШАЛО",
		"Aún no le has dejado el balón a nadie. Cada pase que llegue a un compañero queda marcado aquí, con el viaje que hizo y en qué acabó la jugada.":
			"Ты еще никому не отдал мяч. Каждый пас, дошедший до партнера, отмечается здесь — с его траекторией и тем, чем закончилась атака.",
		"LARGO": "ДЛИНА",
		"tablaP": "П",
		"PASE CORTO": "КОРОТКИЙ ПАС",
		"PASE MEDIO": "СРЕДНИЙ ПАС",
		"PASE LARGO": "ДЛИННЫЙ ПАС",
		"Y TUS PASES": "И ТВОИ ПАСЫ",
		"Arriba se cambia a PASES: a dónde repartes, y cuántos de esos balones acaban en remate o en gol.":
			"Вверху переключись на ПАСЫ: куда ты раздаешь мяч и сколько этих передач заканчиваются ударом или голом.",
		"{0}: todavía sin marca.": "{0}: пока пусто.",
		"T{0} · CEDIDO": "СЕЗ.{0} АРЕНДА",
		"Mantenimiento: -{0} por partido": "Содержание: -{0} за матч",
		"RONDA {0}": "РАУНД {0}",
		"TU": "ТЫ",
		"EN RACHA": "В УДАРЕ",
		"PJ": "И",
		"A": "А",
		"SEMANA SIN PARTIDO": "НЕДЕЛЯ БЕЗ МАТЧА",
		"JORNADA": "ТУР",
		"Tu casillero · abre la TIENDA": "Твой шкафчик · открывает МАГАЗИН",
		"Tu playera · cambia de uniforme": "Твоя футболка · смени форму",
		"ENERO": "ЯНВАРЬ",
		"FEBRERO": "ФЕВРАЛЬ",
		"MARZO": "МАРТ",
		"ABRIL": "АПРЕЛЬ",
		"MAYO": "МАЙ",
		"JUNIO": "ИЮНЬ",
		"JULIO": "ИЮЛЬ",
		"AGOSTO": "АВГУСТ",
		"SEPTIEMBRE": "СЕНТЯБРЬ",
		"OCTUBRE": "ОКТЯБРЬ",
		"NOVIEMBRE": "НОЯБРЬ",
		"DICIEMBRE": "ДЕКАБРЬ",
		"diaLU": "ПН",
		"diaMA": "ВТ",
		"diaMI": "СР",
		"diaJU": "ЧТ",
		"diaVI": "ПТ",
		"diaSA": "СБ",
		"diaDO": "ВС",
		"DÍAS DE DESCANSO": "ДНИ ОТДЫХА",
		"{0}d": "{0} д.",
		"TU PAPEL": "ТВОЯ РОЛЬ",
		"lesionBAJA": "ТРАВМА",
		"lesionALTA": "ЗДОРОВ",
		"{0}D": "{0} Д.",
		"VER EN GOOGLE PLAY": "ОТКРЫТЬ В GOOGLE PLAY",
		"LOGROS EN GOOGLE PLAY": "ДОСТИЖЕНИЯ В GOOGLE PLAY",
		"Arriba, tu catálogo completo. En Google Play, los que Google conoce: se mandan solos al desbloquearse y se ven en tu perfil de jugador.": "Вверху — весь твой каталог. В Google Play — те, что знает Google: они отправляются сами, как только ты их получишь, и видны в твоем профиле игрока.",
		"Tu fachada {0} es de esta casa: la nueva luce la de fábrica.": "Твой фасад {0} принадлежит этому дому: новый будет в заводском виде.",
		"S{0}": "Н.{0}",
		"AYUDA": "ПОМОЩЬ",
		"tabla_ligaDG": "+/-",
		"TÚ {0}": "ТЫ {0}",
		"{0} PTS · +{1} AL {2}": "{0} ОЧК. · {2}: +{1}",
		"{0} PTS · -{1} DEL {2}": "{0} ОЧК. · {2}: -{1}",
		"{0} · {1} PTS": "{0} · {1} ОЧК.",
		"COMPETICIÓN": "ТУРНИР",
		"ZONAS": "ЗОНЫ",
		"NO LA JUEGAS": "НЕ УЧАСТВУЕШЬ",
		"GRUPOS": "ГРУППЫ",
		"EXENTO": "БЕЗ ИГРЫ",
		"POR DEFINIR": "УТОЧНЯЕТСЯ",
		"VIGENTE": "ЧЕМПИОН",
		"Pasan los {0} primeros de cada grupo y los {1} mejores terceros.": "Из каждой группы выходят первые {0}, а также лучшие команды с третьих мест: {1}.",
		"Pasan también los {0} mejores terceros.": "Проходят также лучшие команды с третьих мест: {0}.",
		"{0} MEJORES": "ЛУЧШИЕ {0}",
		"VIVOS": "В ИГРЕ",
		"cuadroGLOBAL": "ПО СУММЕ",
		"FALTAS A TU PALABRA": "ТЫ НАРУШАЕШЬ СЛОВО",
		"Dijiste que te quedabas, y te vas igual. Tu grada no lo olvida.": "Ты обещал остаться, а все равно уходишь. Трибуны этого не забудут.",
		"DT": "ТРЕН.",
		"DE {0}": "ИЗ {0}",
		"TU PAÍS": "ТВОЯ СТРАНА",
		"TU EDAD": "ВОЗРАСТ",
		"CON +1 DE MEDIA: {0}": "С +1 К OVR: {0}",
		"TOP 10 DE {0}": "ТОП-10: {0}",
		"rankingEN EL MUNDO": "В МИРЕ",
		"FILTRAR": "ФИЛЬТР",
		"{0} TÍTULOS · -{1} DEL {2}": "ТИТУЛЫ {0} · {2}: -{1}",
		"{0} TÍTULOS · +{1} AL {2}": "ТИТУЛЫ {0} · {2}: +{1}",
		"carreraLIGAS": "ЛИГИ",
		"carreraCOPAS": "КУБКИ",
		"tablaTOT": "ВСЕГО",
		"{0} PARA {1}": "{1}: {0}",
		"FUERA DEL TOP {0}": "ВНЕ ТОП-{0}",
		"-{0} TÍTULOS": "ТИТУЛЫ: -{0}",
		"PICO {0} · T{1}": "ПИК {0}, СЕЗ.{1}",
		"RECORRIDO": "ПУТЬ",
		"TEMPS.": "СЕЗ.",
		"ESTA TEMP.": "ЭТОТ СЕЗОН",
		"{0}/{1} BATIDOS": "ПОБИТО: {0}/{1}",
		"MÁS CERCA": "БЛИЖЕ ВСЕГО",
		"AÚN SIN MARCA": "ПОКА ПУСТО",
		"ambitoAMÉRICA": "АМЕРИКА",
		"REQUISITOS": "ТРЕБОВАНИЯ",
		"¿CÓMO SE CALCULA?": "КАК СЧИТАЕТСЯ?",
		"-{0} PARA ENTRAR": "ДО ЗАЯВКИ: -{0}",
		"-{0} PARA SER TITULAR": "ДО ОСНОВЫ: -{0}",
		"EN {0} TEMP.": "ЗА {0} СЕЗ.",
		"CON {0} AÑOS": "ВОЗРАСТ: {0}",
		"{0} TEMPORADAS · {1} TÍTULOS": "СЕЗОНЫ: {0} · ТИТУЛЫ: {1}",
		"OFERTAS": "ПРЕДЛ.",
		"VER CESIÓN": "АРЕНДА",
		"carreraGASTO": "ТРАТЫ",
		"SIN FICHAJES": "БЕЗ ТРАНСФЕРОВ",
		"EL MÁS CARO": "САМЫЙ ДОРОГОЙ",
		"{0} FICHAJES": "ТРАНСФЕРЫ: {0}",
		"1 FICHAJE": "1 ТРАНСФЕР",
		"TÍTULOS · -{0} DEL {1}": "ТИТУЛЫ · {1}: -{0}",
		"POR DELANTE": "ВПЕРЕДИ",
		"SELECCIONADOR": "ТРЕНЕР СБОРНОЙ",
		"-1 TÍTULO": "-1 ТИТУЛ",
		"1 TÍTULO": "1 ТИТУЛ",
		"RENOVAR": "ПРОДЛИТЬ",
		"CESIÓN": "АРЕНДА",
		"PEDIR": "ПРОСИТЬ",
		"RETIRAR": "ОТОЗВАТЬ",
		"CLÁUSULAS": "УСЛОВИЯ",
		"CAMINO": "ПУТЬ",
		"MUÉVEME": "ПЕРЕХОД",
		"UNA LIGA": "ЛИГА",
		"UN CLUB": "КЛУБ",
		"BAJAR FICHA": "ЗАРПЛАТА НИЖЕ",
		"SUBIR CLÁUSULA": "ОТСТУПНЫЕ ВЫШЕ",
		"NO VENDERME": "НЕ ПРОДАВАТЬ",
		"{0} BLOQUEADAS": "ЗАКРЫТО: {0}",
		"C. LIGA": "КУБ. ЛИГИ",
		"Patrocinador: {0}": "Спонсор: {0}",
		"{0} LIBRE": "ЕЩЕ {0}",
		"VENTA": "ПРОДАЖА",
		"C. LIGAS": "МЕЖЛИГОВЫЙ",
		"¡CAMPEÓN DE LA COPA DE LAS LIGAS!": "ОБЛАДАТЕЛИ МЕЖЛИГОВОГО КУБКА!",
		"Eliminado de la Copa de las Ligas": "Вылет из Межлигового кубка",
		"Este año no cuentas: hay que jugar la temporada ENTERA en una Primera europea.": "В этом году ты не в счет: нужно отыграть ВЕСЬ сезон в высшей лиге европейской страны.",
		"{0} SIN GUARDAR": "НЕ СОХРАНЕНО: {0}",
		"PIERNAS": "НОГИ",
		"TODO AL TOPE": "ВСЕ ПРОКАЧАНО",
		"SALARIO": "ЗАРПЛАТА",
		"ESTATUS": "СТАТУС",
		"EL CLUB DICE": "СЛОВО КЛУБА",
		"PEDIR SALIDA": "ЗАПРОС НА УХОД",
		"HASTA T{0}": "ДО СЕЗ.{0}",
		"QUEDAN {0} TEMPORADAS": "ОСТАЛОСЬ СЕЗОНОВ: {0}",
		"MANTÉN 1 S": "ЗАЖМИ 1 С",
		"Tu temporada da para pedir mejora: siéntate con el club.": "Сезон удался — можно просить прибавки: садись за стол с клубом.",
		"El club está contento con lo firmado.": "Клуб доволен подписанным контрактом.",
		"YA LO PEDISTE": "УЖЕ ПРОСИЛ",
		"CONTESTA LO PENDIENTE": "СНАЧАЛА ОТВЕТЬ",
		"AÚN NO TE ESCUCHAN": "ТЕБЯ ПОКА НЕ СЛУШАЮТ",
		"CUANDO ABRA EL MERCADO": "КОГДА ОТКРОЕТСЯ ОКНО",
		"PRÓXIMO CRUCE": "СЛЕДУЮЩИЙ МАТЧ",
		"TU TÉCNICO": "ТВОЙ ТРЕНЕР",
		"GRUPOS {0}-{1}": "ГРУППЫ {0}-{1}",
		"VER EL GOL": "СМОТРЕТЬ",
		"MANTEN PARA BORRAR": "ДЕРЖИ: УДАЛИТЬ",
		"NO SE PUEDE LEER": "НЕ ЧИТАЕТСЯ",
		"SIN GOLES TODAVIA": "ГОЛОВ ПОКА НЕТ",
		"MARCA, Y EN LA REPETICION PULSA": "ЗАБЕЙ, А В ПОВТОРЕ НАЖМИ",
		"LLENO · BORRA UNO PARA GUARDAR OTRO": "ПОЛНО · УДАЛИ ОДИН ДЛЯ НОВОГО",
		"TOCA UN GOL Y VELO. BORRAR SE MANTIENE.": "НАЖМИ НА ГОЛ. УДАЛЕНИЕ: ДЕРЖИ.",
		"{0} M/S": "{0} М/С",
		"Hasta 30 goles por carrera. Se ven con el cielo y el viento de aquel día, en tu estadio de hoy.": "До 30 голов за карьеру. Они воспроизводятся с небом и ветром того дня, на твоем нынешнем стадионе.",
		"El archivo se dañó. Sólo queda borrarlo.": "Файл поврежден. Остается только удалить его.",
		"GALAS": "ГАЛА",
		"GANADOR": "ЛАУРЕАТ",
		"La votación del año arranca con la primera jornada.": "Голосование года начнется с первого тура.",
		"ONCE IDEAL": "ЛУЧШИЕ 11",
		"VER TODOS": "ВСЕ",
		"VOTACIÓN": "ГОЛОСА",
	},










	"shop": {

		"ROPA DE CALLE": "УЛИЧНАЯ ОДЕЖДА",
		"Toca una prenda para comprarla. Lo que compres te espera en ASPECTO.": "Нажми на вещь, чтобы купить. Все купленное ждет тебя в разделе ВНЕШНОСТЬ.",

		"CAMILLA DE FISIOTERAPIA": "МАССАЖНЫЙ СТОЛ",
		"PIZARRA TÁCTICA": "ТАКТИЧЕСКАЯ ДОСКА",
		"BICICLETA ESTÁTICA": "ВЕЛОТРЕНАЖЕР",
		"MURO DE RÉCORDS": "СТЕНА РЕКОРДОВ",
		"RINCÓN DE LECTURA": "УГОЛОК ЧТЕНИЯ",
		"MESA DE RECUERDOS": "СТОЛ ВОСПОМИНАНИЙ",
		"Camilla y material de recuperación. Su sesión recupera energía, no cura lesiones.": "Кушетка и все для восстановления. Сеанс возвращает энергию, но не лечит травмы.",
		"Pizarra móvil para preparar el próximo partido. El bono se activa al usarla.": "Переносная доска для подготовки к следующему матчу. Бонус включается, когда ты ею пользуешься.",
		"Cardio suave en casa; requiere estar sin lesión para pedalear.": "Легкое кардио дома; крутить педали можно только без травмы.",
		"Tus goles, asistencias, títulos y mejores temporadas, con datos reales.": "Твои голы, ассисты, титулы и лучшие сезоны — по реальной статистике.",
		"Sillón, libro y luz cálida: lee para recuperar energía y ánimo.": "Кресло, книга и теплый свет: читай, чтобы восстановить энергию и настрой.",
		"Cartas y recuerdos de tu carrera. Consulta los momentos guardados.": "Письма и памятные вещи твоей карьеры. Пересматривай сохраненные моменты.",
		"SESIÓN DE FISIOTERAPIA": "СЕАНС ФИЗИОТЕРАПИИ",
		"PREPARAR EL PARTIDO": "ПОДГОТОВКА К МАТЧУ",
		"PEDALEAR SUAVE": "ПОКРУТИТЬ ПЕДАЛИ",
		"LEER CON CALMA": "ТИХОЕ ЧТЕНИЕ",
		"Recupera hasta 12 de energía. No acorta las lesiones. Una acción semanal.": "Восстанавливает до 12 энергии. Не сокращает травмы. Одно действие в неделю.",
		"+3 puntos de precisión efectiva para el próximo partido. Una acción semanal.": "+3 к реальной точности на следующий матч. Одно действие в неделю.",
		"Hasta +5 de energía y +1 con el técnico, sin lesión. Una acción semanal.": "До +5 энергии и +1 к отношениям с тренером, если нет травмы. Одно действие в неделю.",
		"Hasta +3 de energía y +1 de ánimo. Una acción semanal.": "До +3 энергии и +1 к настрою. Одно действие в неделю.",
		"VER RÉCORDS": "РЕКОРДЫ",
		"ABRIR RECUERDOS": "ВОСПОМИНАНИЯ",
		"VER CONDICIÓN": "СОСТОЯНИЕ",
		"de ánimo": "к настрою",
		"PRECISIÓN +3 · PRÓXIMO PARTIDO": "ТОЧНОСТЬ +3 · СЛЕДУЮЩИЙ МАТЧ",
		"Coloca este mueble para usarlo.": "Поставь эту мебель, чтобы ей пользоваться.",
		"Espera al alta médica para pedalear.": "Дождись допуска от врачей, чтобы крутить педали.",
		"La preparación táctica ya está lista para el próximo partido.": "Тактическая подготовка к следующему матчу уже готова.",
		"Ahora mismo no necesitas esta sesión.": "Сейчас тебе этот сеанс не нужен.",
		"Consultar no consume acciones ni cambia tus estadísticas.": "Просмотр не тратит действий и не меняет твою статистику.",
		"Aún no hay partidos registrados para este muro.": "Для этой стены еще нет записанных матчей.",
		"Los recuerdos aparecerán cuando tu carrera deje momentos guardados.": "Воспоминания появятся, когда в твоей карьере будут памятные моменты.",
		"TU HISTORIA EMPIEZA AQUÍ": "ТВОЯ ИСТОРИЯ НАЧНЕТСЯ ЗДЕСЬ",
		"RECUERDOS": "ПАМЯТНОЕ",
		"{0} TÍTULOS": "ТИТУЛЫ: {0}",
		"{0} / {1}": "{0} / {1}",
		"GOLES CON TUS CLUBES": "ГОЛЫ ЗА ТВОИ КЛУБЫ",
		"ASISTENCIAS CON TUS CLUBES": "АССИСТЫ ЗА ТВОИ КЛУБЫ",
		"TU MEJOR TEMPORADA GOLEADORA": "ТВОЙ ЛУЧШИЙ СЕЗОН ПО ГОЛАМ",
		"TU MEJOR TEMPORADA DE ASISTENCIAS": "ТВОЙ ЛУЧШИЙ СЕЗОН ПО АССИСТАМ",
		"TU MEJOR MEDIA DE TEMPORADA": "ЛУЧШАЯ СРЕДНЯЯ ОЦЕНКА СЕЗОНА",
		"NOTA {0} · {1} PARTIDOS": "ОЦЕНКА {0} · МАТЧИ: {1}",
		"TÍTULOS GANADOS": "ВЫИГРАННЫЕ ТИТУЛЫ",
		"TU DEBUT CON UN CLUB": "ТВОЙ ДЕБЮТ ЗА КЛУБ",
		"TU DEBUT CON LA SELECCIÓN": "ТВОЙ ДЕБЮТ ЗА СБОРНУЮ",
		"TU CESIÓN": "ТВОЯ АРЕНДА",
		"CAMISETA INTERCAMBIADA": "ОБМЕН ФУТБОЛКАМИ",
		"BALÓN DEL PARTIDO": "МЯЧ МАТЧА",
		"RESULTADO {0}–{1}": "СЧЕТ {0}–{1}",
		"Los grandes de Europa se fijan en ti.": "Гранды Европы присматриваются к тебе.",
		"Tienes con qué, pero te falta FAMA: haz ruido marcando.":
			"Талант есть, но не хватает СЛАВЫ: наделай шума голами.",
		"Gustas, pero necesitas más NIVEL: al gimnasio.":
			"Ты нравишься, но нужен УРОВЕНЬ повыше: марш в спортзал.",
		"Te siguen, pero tu MEDIA no acompaña: hay que rendir.":
			"За тобой следят, но твой РЕЙТИНГ не дотягивает: надо выдавать результат.",
		"POT": "СИЛА",
		"PRE": "ТОЧН.",
		"EFE": "ДУГА",
		"ENERGIA": "ЭНЕРГИЯ",
		"RIESGO": "РИСК",
		"SEMANAS BAJA": "ВНЕ ИГРЫ, НЕД.",
		"COMISION": "КОМИССИЯ",
		"PRENSA": "ПРЕССА",
		"AFICIÓN": "ТРИБУНЫ",
		"AGENTE": "АГЕНТ",
		"TÉCNICO": "ТРЕНЕР",


		"VESTUARIO": "РАЗДЕВАЛКА",
		"ROTO": "РАЗЛАД",
		"FRÍO": "ХОЛОД",
		"BUENO": "ДОВЕРИЕ",
		"INCONDICIONAL": "ПРЕДАННОСТЬ",
		"BARRIO 90": "ДВОР 90",
		"Tu primer salto. Un poco de todo, a tu alcance.": "Твой первый шаг вверх. Всего понемногу и по карману.",
		"ACERO PRO": "СТАЛЬ PRO",
		"Hechas para durar. Rendimiento modesto, muchos partidos.": "Сделаны на совесть. Скромная отдача, зато много матчей.",
		"ÓRBITA 10": "ОРБИТА 10",
		"Coloca y dibuja la curva. Menos fuerza, más intención.": "Клади точно и закручивай. Меньше силы, больше замысла.",
		"ECLIPSE X": "ECLIPSE X",
		"Oscuridad y neón. Potencia, puntería y una comba de élite.": "Тьма и неон. Сила, точность и подкрутка элитного уровня.",
		"NOVA PRISM": "NOVA PRISM",
		"Brillo de otro mundo. Cada disparo traza su propia curva.": "Неземной блеск. Каждый удар рисует свою кривую.",
		"ZÉNIT SUPREMA": "АБСОЛЮТНЫЙ ПИК",
		"La cima del juego. Fuerza, precisión y comba sin concesiones.": "Вершина игры. Сила, точность и подкрутка без компромиссов.",
		"+ {0} · DURAN {1} PARTIDOS": "+ {0} · РЕСУРС: {1} МАТЧ.",
		"Si ya las tienes, vuelven al 100% de vida.": "Если они у тебя уже есть, ресурс восстановится до 100%.",
		"{0} están en tu ropero con el 100% de vida.": "{0}: уже в твоем гардеробе, ресурс 100%.",
		"BOTA DE CANTERA": "БУТСЫ АКАДЕМИИ",
		"Las de siempre. Sin trucos.": "Обычная пара. Без фокусов.",
		"TRUENO XT": "ГРОМ XT",
		"Pega más fuerte, pero cuesta domarla.": "Бьют сильнее, но их надо приручить.",
		"BISTURÍ 09": "СКАЛЬПЕЛЬ 09",
		"Para quien coloca en vez de reventar.":
			"Для тех, кто кладет точно, а не лупит.",
		"COMBA CLÁSICA": "ДУГА КЛАССИК",
		"Rosca de verdad. La falta es tuya.": "Настоящая подкрутка. Штрафной — твой.",
		"CORONA DE ORO": "ЗОЛОТАЯ КОРОНА",
		"Sin peros. Si puedes pagarla.": "Без оговорок. Если потянешь по деньгам.",
		"BEBIDA ENERGÉTICA": "ЭНЕРГЕТИК",
		"+35 de energía. Ábrela entre semana o en el descanso.":
			"+35 энергии. Открывай посреди недели или в перерыве.",
		"GEL ANTIINFLAMATORIO": "ГЕЛЬ ОТ ВОСПАЛЕНИЯ",
		"Adelanta una semana tu recuperación.": "Ускоряет восстановление на неделю.",
		"SESIÓN DE VÍDEO": "ВИДЕОРАЗБОР",
		"+1 de forma. Estudias al rival.": "+1 к форме. Изучаешь соперника.",
		"CÁMARA HIPERBÁRICA": "БАРОКАМЕРА",
		"Borra cualquier lesión al instante y devuelve +20 de energía. El cuerpo sólo la aguanta una vez por temporada.":
			"Мгновенно убирает любую травму и возвращает +20 энергии. Организм выдерживает ее только раз за сезон.",
		"CORTE DE AUTOR": "АВТОРСКАЯ СТРИЖКА",
		"Sales en las fotos. Barato y sin enemigos.":
			"Ты хорошо выходишь на фото. Дешево и никого не злит.",
		"CENA CON EL VESTUARIO": "УЖИН С КОМАНДОЙ",
		"La química se compra. Se puede repetir.":
			"Химию можно купить. Можно повторить.",

		"TU AGENTE": "ТВОЙ АГЕНТ",
		"EL DE SIEMPRE": "ПРЕЖНИЙ",
		"Ahora te lleva: {0} · se queda el {1}% de lo que cobras": "Теперь ведет: {0} · берет {1}% твоих доходов",
		"No hay nadie por encima. La agencia es tuya.": "Выше никого нет. Агентство твое.",
		"VUELVE EN {0}": "СНОВА ЧЕРЕЗ {0}",
		"YA ESTE AÑO": "УЖЕ В ЭТОМ ГОДУ",
		"COMISIÓN %": "КОМИССИЯ %",
		"AGENTE CON OFICINA": "АГЕНТ С ОФИСОМ",
		"Deja de atenderte desde el coche. Comisión del 7%.": "Больше не говорит с тобой из машины. Комиссия 7%.",
		"AGENTE CON CARTERA": "АГЕНТ С КЛИЕНТАМИ",
		"Ya lleva a otros profesionales. Más clubes te miran, y cobra el 6%.": "Он уже ведет других профи. На тебя смотрит больше клубов, а берет он 6%.",
		"AGENCIA DE PRIMERA": "ТОП-АГЕНТСТВО",
		"Un equipo detrás de tu nombre: ofertas de fuera y prensa a favor. El 5%.": "Целая команда за твоим именем: предложения из-за границы и лояльная пресса. 5%.",
		"AGENTE DE ESTRELLAS": "АГЕНТ ЗВЕЗД",
		"Sólo lleva a quince jugadores en el mundo y tú eres uno. El 3,5%.": "Он ведет всего пятнадцать игроков в мире, и ты один из них. 3,5%.",
		"TU PROPIA AGENCIA": "СВОЕ АГЕНТСТВО",
		"El despacho es tuyo y él trabaja para ti. La comisión baja al 2,5%.": "Офис твой, и он работает на тебя. Комиссия падает до 2,5%.",
		"La grada corea tu nombre. Las marcas lo notan. Una vez por temporada.": "Трибуны скандируют твое имя. Бренды это замечают. Раз в сезон.",

		"CHARLA CON EL PSICÓLOGO": "БЕСЕДА С ПСИХОЛОГОМ",
		"Tu próximo partido no te bajará la forma, juegues como juegues.": "Следующий матч не уронит тебе форму, как бы ты ни сыграл.",
		"BOTELLÍN ISOTÓNICO": "ИЗОТОНИК",
		"+10 de energía, y tus botas no se gastan en el próximo partido.": "+10 энергии, и бутсы не изнашиваются в следующем матче.",

		"CENA CON EL CAPITÁN": "УЖИН С КАПИТАНОМ",
		"Invitas al vestuario y pagas tú. +7 con el equipo. No se puede repetir en 10 partidos.":
			"Зовешь всю команду и платишь сам. +7 к команде. Повторить можно не раньше чем через 10 матчей.",
		"REUNIÓN CON EL TÉCNICO": "ВСТРЕЧА С ТРЕНЕРОМ",
		"Le pides explicaciones y sales reforzado. +6 con el técnico — pero si fallas en el próximo partido, se lo cobra el doble.":
			"Просишь объяснений и выходишь окрепшим. +6 к тренеру — но если провалишь следующий матч, он спросит вдвойне.",
		"INFILTRACIÓN": "БЛОКАДА",
		"Juegas el próximo partido aunque estés lesionado. Al acabar, tu baja crece 2 semanas.":
			"Сыграешь следующий матч даже с травмой. После него восстановление растянется еще на 2 недели.",
		"SIN LESIÓN": "НЕТ ТРАВМЫ",
		"NO DISPONIBLE": "НЕДОСТУПНО",
		"EN {0} {1}": "ЕЩЕ {0} {1}",
		"JUGAR INFILTRADO": "ИГРАТЬ НА УКОЛАХ",
		"LESIONADO · TU BAJA CRECERÁ {0} SEMANAS": "ТРАВМА · ПРОПУСК +{0} НЕД.",
		"YA PUESTO": "УЖЕ НАДЕТО",
		"Te pones el atuendo {0} en ASPECTO.": "Открывает образ {0} в разделе ВНЕШНОСТЬ.",
		"Ya vistes el atuendo {0} en ASPECTO.": "Образ {0} уже на тебе (раздел ВНЕШНОСТЬ).",

		"Atuendo": "Образ",
		"DE ORO": "ЗОЛОТОЙ",
		"DEL BARRIO": "УЛИЧНЫЙ",
		"DE PISTA": "СПОРТИВНЫЙ",
		"DE OFICINA": "ОФИСНЫЙ",
		"RELOJ DE ORO": "ЗОЛОТЫЕ ЧАСЫ",
		"Todos lo ven. El técnico también.": "Все их видят. Тренер тоже.",
		"DONACIÓN AL BARRIO": "ПОМОЩЬ РАЙОНУ",
		"La grada corea tu nombre. Las marcas lo notan.":
			"Трибуны скандируют твое имя. Бренды это замечают.",
		"GIMNASIO EN CASA": "ДОМАШНИЙ ЗАЛ",
		"Cuidas el cuerpo: recuperas algo más tras cada partido.":
			"Следишь за телом: после каждого матча восстанавливаешься чуть лучше.",
		"DEPORTIVO": "СПОРТКАР",
		"MUSCLE CAR": "МАСЛКАР",
		"COMPACTO URBANO": "ГОРОДСКОЙ ХЭТЧБЕК",
		"SEDÁN CLÁSICO": "СЕДАН КЛАССИК",
		"FAMILIAR VIAJERO": "УНИВЕРСАЛ",
		"PICKUP DE CAMPO": "ЗАГОРОДНЫЙ ПИКАП",
		"Pequeño, amarillo y práctico. Tu primer coche sin presumir.": "Маленький, желтый и практичный. Первая машина без понтов.",
		"Cuatro puertas, azul discreto y espacio para el día a día.": "Четыре двери, скромный синий цвет и место на каждый день.",
		"Carrocería larga, barras de techo y maletero para todo el equipo.": "Длинный кузов, рейлинги и багажник для всей экипировки.",
		"Robusta, sencilla y con caja abierta. Para salir de la ciudad.": "Крепкий, простой, с открытым кузовом. Чтобы выбираться из города.",
		"COCHERA DE COLECCIÓN": "КОЛЛЕКЦИОННЫЙ ГАРАЖ",
		"Ocho plazas en una ampliación a la derecha de casa. Terreno incluido y coches colocados automáticamente. Sin mantenimiento.": "Восемь мест в пристройке справа от дома. Участок включен, машины расставляются сами. Без содержания.",
		"ESTACIONAR LOS CUATRO": "ПОСТАВИТЬ ВСЕ ЧЕТЫРЕ",
		"Cuatro plazas, portón abierto y paso a casa. Sin mantenimiento.": "Четыре места, открытые ворота и проход в дом. Без содержания.",
		"Primero coloca la cochera.": "Сначала поставь гараж.",
		"Necesitas tener los cuatro coches.": "Нужно иметь все четыре машины.",
		"Apártate de las plazas antes de estacionar.": "Отойди от парковочных мест, прежде чем ставить машины.",
		"Hay una plaza bloqueada. No se movió ningún coche.": "Одно место занято. Ни одна машина не сдвинулась.",
		"La cochera necesita un espacio libre de paredes.": "Гаражу нужно место без стен.",
		"Tu coche de colección. Colócalo, gíralo o guárdalo en casa.": "Твоя коллекционная машина. Поставь, поверни или убери ее дома.",
		"Tu reloj de oro, expuesto en casa.": "Твои золотые часы — на виду у тебя дома.",
		"GRAN TURISMO": "ГРАН ТУРИЗМО",
		"HIPERDEPORTIVO": "ГИПЕРКАР",
		"Franjas negras y cuatro faros. Te oyen antes de verte.": "Черные полосы и четыре фары. Тебя слышат раньше, чем видят.",
		"Capó largo y verde de lujo. Elegancia que sale en todas las fotos.": "Длинный капот и роскошный зеленый цвет. Элегантность на каждом фото.",
		"Plata, carbono y alerón. Una pieza de colección que acapara portadas.": "Серебро, карбон и антикрыло. Коллекционная машина, которая не сходит с обложек.",
		"Llegas tarde a entrenar, pero llegas.":
			"Опаздываешь на тренировку, но приезжаешь.",
		"AGENTE DE PRIMERA": "АГЕНТ ВЫСШЕГО КЛАССА",
		"Más ofertas sobre la mesa y mejor regateo.":
			"Больше предложений на столе и торг пожестче.",
		"CASA CON JARDÍN": "ДОМ С САДОМ",
		"Descansas de verdad: recuperas bastante más tras cada partido.":
			"Отдыхаешь по-настоящему: после каждого матча восстанавливаешься заметно лучше.",



		"DEPARTAMENTO": "СТУДИЯ",
		"Un cuarto, una ventana y el sitio justo para la primera copa.":
			"Одна комната, одно окно и ровно столько места, чтобы поставить первый кубок.",
		"CASA MODERNA": "КОТТЕДЖ",
		"Sala de trofeos propia y aún mejor descanso entre partidos.":
			"Своя комната трофеев и еще лучший отдых между матчами.",
		"Galería, garage y tu cancha tras la puerta del fondo.":
			"Галерея, гараж и твое поле за задней дверью.",
		"CAMPO DE ENTRENAMIENTO": "ТРЕНИРОВОЧНАЯ БАЗА",
		"TU FRASE ESTÁ EN SU GRADA": "ТВОИ СЛОВА НА ИХ ТРИБУНЕ",
		"TU CUMPLEAÑOS": "ДЕНЬ РОЖДЕНИЯ",
		"SIN PONER": "НЕ ЗАДАН",
		"¿QUÉ MES?": "КАКОЙ МЕСЯЦ?",
		"¿QUÉ DÍA DE {0}?": "{0}: КАКОЕ ЧИСЛО?",
		"HOY NO SE ENTRENA": "ТРЕНИРОВКИ НЕ БУДЕТ",
		"FELIZ CUMPLEAÑOS": "С ДНЕМ РОЖДЕНИЯ",
		"Te esperaban dentro. Alguien del vestuario se acordó, y eso en un vestuario no es poco.": "Тебя ждали внутри. Кто-то в раздевалке вспомнил, а в раздевалке это немало.",
		"ENE": "ЯНВ",
		"FEB": "ФЕВ",
		"MAR": "МАР",
		"ABR": "АПР",
		"MAY": "МАЙ",
		"JUN": "ИЮН",
		"JUL": "ИЮЛ",
		"AGO": "АВГ",
		"SEP": "СЕН",
		"OCT": "ОКТ",
		"NOV": "НОЯ",
		"DIC": "ДЕК",
		"EL MICRÓFONO ABIERTO": "ОТКРЫТЫЙ МИКРОФОН",
		"Semana de derbi y el periodista deja el micro abierto: '¿os ven por encima de {0}?'. Sabes que lo que digas va a estar en su grada el domingo.": "Неделя дерби, и журналист оставляет микрофон включенным: «Вы считаете себя сильнее, чем {0}?». Ты знаешь: все, что скажешь, в воскресенье будет на их трибуне.",
		"MEDIR LAS PALABRAS": "ПОДБИРАТЬ СЛОВА",
		"SOLTAR LA BRAVATA": "БРОСИТЬ ВЫЗОВ",

		"LLEGAN SIN SU ESTRELLA": "БЕЗ СВОЕЙ ЗВЕЗДЫ",
		"Tu próximo rival llega sin uno de sus mejores jugadores, que está lesionado. En la rueda de prensa te preguntan si es el partido para aprovecharlo.": "Твой следующий соперник приедет без одного из лучших игроков — тот травмирован. На пресс-конференции тебя спрашивают, не тот ли это матч, чтобы воспользоваться моментом.",
		"RESPETAR AL RIVAL": "УВАЖАТЬ СОПЕРНИКА",
		"HAY QUE APROVECHARLO": "ГРЕХ НЕ ВОСПОЛЬЗОВАТЬСЯ",

		"VIENEN LANZADOS": "ОНИ НА ВЗЛЕТЕ",
		"{0} llega con cinco victorias seguidas en liga. En la rueda de prensa te preguntan si os dan miedo.": "{0} подходит к матчу с пятью победами подряд в лиге. На пресс-конференции тебя спрашивают, боитесь ли вы их.",
		"RESPETO, NO MIEDO": "УВАЖЕНИЕ, НЕ СТРАХ",
		"LA RACHA SE ACABA AQUÍ": "СЕРИЯ ОБОРВЕТСЯ ЗДЕСЬ",
		"UN GRANDE HERIDO": "РАНЕНЫЙ ГИГАНТ",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Te preguntan si es el mejor momento para cruzártelos.": "{0} не побеждает уже пять туров, и трибуны требуют отставок. Тебя спрашивают, лучшее ли сейчас время для встречи с ними.",
		"UN GRANDE SIEMPRE ES UN GRANDE": "ГРАНД ВСЕГДА ОСТАЕТСЯ ГРАНДОМ",
		"HAY QUE REMATARLOS": "НАДО ИХ ДОБИТЬ",
		"BANQUILLO NUEVO ENFRENTE": "НОВЫЙ ТРЕНЕР У СОПЕРНИКА",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y la prensa quiere saber si tú sí.": "Клуб {0} в этом сезоне сменил тренера: {1}. Никто пока не знает, как играет команда, и пресса хочет понять, знаешь ли ты.",
		"ESTUDIARLO CON EL MÍSTER": "РАЗОБРАТЬ С ТРЕНЕРОМ",
		"QUE SE PREOCUPE ÉL": "ПУСТЬ ОН ПЕРЕЖИВАЕТ",
		"TU ANTIGUO TÉCNICO": "ТВОЙ БЫВШИЙ ТРЕНЕР",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Los periodistas buscan la foto del reencuentro.": "{0}, тренер, под началом которого ты играл, теперь сидит на скамейке клуба {1}. Журналисты ждут фото встречи.",
		"UN ABRAZO ANTES DEL PARTIDO": "ОБЪЯТИЯ ПЕРЕД МАТЧЕМ",
		"HOY ES UN RIVAL MÁS": "СЕГОДНЯ ОН ПРОСТО СОПЕРНИК",
		"SU GRAN FICHAJE": "ИХ ГЛАВНЫЙ НОВИЧОК",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Te preguntan si el duelo es entre vosotros dos.": "Клуб {1} подписал игрока {0} в этом сезоне, и он уже один из лучших в их составе. Тебя спрашивают, будет ли это ваша личная дуэль.",
		"ES UN PARTIDO DE EQUIPOS": "ЭТО КОМАНДНАЯ ИГРА",
		"AQUÍ LE ESPERO": "Я ЕГО ЖДУ",
		"CAMPEÓN EN CASA": "ЧЕМПИОН НА РОДИНЕ",
		"En tu país se ha coronado {0}, y la prensa de allí te pregunta si algún día te verán jugar en casa.": "На родине чемпионом стал {0}, и местная пресса спрашивает, увидят ли тебя когда-нибудь дома.",
		"ALGÚN DÍA, QUIÉN SABE": "КОГДА-НИБУДЬ, КТО ЗНАЕТ",
		"AQUÍ ESTOY A GUSTO": "МНЕ И ТУТ ХОРОШО",
		"TE PIDEN QUE LO ACLARES": "ТЕБЯ ПРОСЯТ ОБЪЯСНИТЬСЯ",
		"Tu frase lleva toda la semana en la portada y en la grada de {0}. El club te pregunta si quieres suavizarla antes del domingo.": "Твоя фраза всю неделю на первых полосах и на трибуне клуба {0}. Клуб спрашивает, не хочешь ли ты смягчить ее до воскресенья.",
		"SOSTENERLA": "НЕ ОТСТУПАТЬ",
		"SUAVIZARLA": "СМЯГЧИТЬ",
		"UN GOL EN DOS JORNADAS": "ГОЛ ЗА ДВА ТУРА",
		"Te llama al despacho y no se anda con rodeos: si no marcas en las dos próximas jornadas, te sientas.": "Он вызывает тебя в кабинет и говорит прямо: не забьешь в двух следующих турах — сядешь на скамейку.",
		"AGACHAR LA CABEZA": "СМИРИТЬСЯ",
		"DECIRLE LO QUE PIENSAS": "СКАЗАТЬ, ЧТО ДУМАЕШЬ",
		"LO MARCASTE": "ТЫ ЗАБИЛ",
		"Marcaste dentro del plazo. En el pasillo no te dijo nada, pero el lunes tu nombre volvió a la pizarra del once.": "Ты забил в срок. В коридоре он ничего не сказал, но в понедельник твое имя вернулось в состав на доске.",
		"SE ACABÓ EL PLAZO": "ВРЕМЯ ВЫШЛО",
		"Dos jornadas, ningún gol. No hizo falta que te lo dijera: el once del domingo ya no te lleva.": "Два тура — ни одного гола. Ему не пришлось ничего говорить: в воскресном составе тебя уже нет.",
		"EL CAPITÁN TE PARA": "КАПИТАН ПРЕГРАДИЛ ПУТЬ",
		"{0} te espera en la puerta del vestuario. No levanta la voz: te dice que el equipo lleva semanas jugando para ti y que eso se acaba hoy.": "{0} ждет тебя у двери раздевалки. Он не повышает голос: говорит, что команда неделями играла на тебя, и сегодня это заканчивается.",
		"CONTESTARLE": "ОТВЕТИТЬ ЕМУ",
		"TE ESPERAN EN EL TÚNEL": "ТЕБЯ ЖДУТ В ТУННЕЛЕ",
		"Un crío con tu nombre en la espalda lleva media hora esperando en la boca del túnel. Su padre le dice que no molestes, que ya vas tarde.": "Мальчишка с твоим именем на спине уже полчаса ждет у выхода из туннеля. Отец говорит ему не приставать — ты и так опаздываешь.",
		"PARARTE CON ÉL": "ОСТАНОВИТЬСЯ",
		"SALUDAR Y SEGUIR": "ПОМАХАТЬ И ИДТИ",
		"TU CASILLERO NO ESTÁ COMO LO DEJASTE": "ТВОЙ ШКАФЧИК НЕ ТАКОЙ, КАК БЫЛ",
		"Llegas al vestuario y tu hueco está lleno de espuma hasta arriba. Nadie te mira, pero nadie está haciendo nada tampoco.": "Приходишь в раздевалку, а твое место доверху забито пеной. Никто на тебя не смотрит, но и никто ничего не делает.",
		"SEGUIRLES EL JUEGO": "ПОДЫГРАТЬ ИМ",
		"LIMPIAR EN SILENCIO": "МОЛЧА УБРАТЬ",
		"TE PARA EN LA BANDA": "ОН ОСТАНАВЛИВАЕТ ТЕБЯ У БРОВКИ",
		"Te sustituye, y en vez de darte la mano y mirar al campo te para, te dice algo al oído y te abraza hasta que la grada se levanta.": "Он меняет тебя и вместо того, чтобы пожать руку и отвернуться к полю, останавливает, что-то говорит на ухо и обнимает, пока трибуна не встает.",
		"ESCUCHARLE": "ВЫСЛУШАТЬ",
		"IRTE AL BANQUILLO": "УЙТИ НА СКАМЕЙКУ",
		"EL ONCE YA ESTÁ DIBUJADO": "СОСТАВ УЖЕ НА ДОСКЕ",
		"Entras al vestuario antes que nadie y la pizarra ya tiene el once del domingo. Lo lees dos veces: tu nombre no está en ninguna de las dos.": "Ты приходишь в раздевалку раньше всех, а на доске уже воскресный состав. Читаешь дважды: твоего имени нет ни в первый раз, ни во второй.",
		"BORRARLA": "СТЕРЕТЬ",
		"AQUÍ NO TE OLVIDAN": "ЗДЕСЬ ТЕБЯ НЕ ЗАБЫЛИ",

		"EX CLUB · TITULAR · ~{0} MIN": "БЫВШИЙ КЛУБ · В ОСНОВЕ · ~{0} МИН.",
		"EX CLUB · DESDE LA BANCA · ~{0} MIN": "БЫВШИЙ КЛУБ · ИЗ ЗАПАСА · ~{0} МИН.",
		"SU GRADA NO OLVIDA TU TRASPASO": "ИХ ТРИБУНЫ НЕ ПРОСТИЛИ ТРАНСФЕР",
		"SU GRADA RECUERDA TU CESIÓN": "ИХ ТРИБУНЫ ПОМНЯТ ТВОЮ АРЕНДУ",
		"SU GRADA NI SE INMUTA": "ИХ ТРИБУНАМ ВСЕ РАВНО",
		"TU EX CLUB, DE VISITA": "ТВОЙ БЫВШИЙ КЛУБ В ГОСТЯХ",
		"TU EX CLUB, ENFRENTE": "ПРОТИВ БЫВШЕГО КЛУБА",
		"{0} · MÁRCALE: HAY PRIMA": "{0} · ЗАБЕЙ — БУДЕТ БОНУС",
		"GOL AL EX CLUB": "ГОЛ БЫВШЕМУ КЛУБУ",
		"TRAIDOR": "ПРЕДАТЕЛЬ",
		"BENGALA EN EL CÉSPED": "ФАЙЕР НА ГАЗОНЕ",
		"SE PELEAN EN TU GRADA": "ДРАКА НА ТВОЕЙ ТРИБУНЕ",
		"CANCHA DE {0}": "ПОЛЕ: {0}",
		"VISITAR MI CASA": "ЗАЙТИ ДОМОЙ",
		"SALIR DE CASA": "ВЫЙТИ ИЗ ДОМА",
		"SEGUNDO PISO": "ВТОРОЙ ЭТАЖ",
		"TERCER PISO": "ТРЕТИЙ ЭТАЖ",
		"Una planta más. Se levanta sobre lo que ya cerraste.": "Еще один этаж. Он встает над тем, что ты уже обнес стенами.",
		"La última planta, y la que se ve desde la calle.": "Последний этаж — тот, что видно с улицы.",
		"PRIMERO EL SEGUNDO PISO": "СНАЧАЛА ВТОРОЙ ЭТАЖ",
		"NO HAY NADA CERRADO DEBAJO": "ВНИЗУ НЕТ СТЕН",
		"ADICIONES": "ДОПОЛНЕНИЯ",
		"ACABADOS": "ОТДЕЛКА",
		"MATERIAL DE ESTA PARED": "МАТЕРИАЛ ЭТОЙ СТЕНЫ",
		"EL DE LA CASA": "ИСХОДНЫЙ",
		"PISO": "ПОЛ",
		"PARED": "СТЕНА",
		"El suelo y la pared, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.":
			"Пол и стены — на твой вкус. Покупаются отдельно и остаются навсегда: меняй, когда захочешь.",
		"Instaladas: {0} de {1}.": "Установлено: {0} из {1}.",
		"Muebles, mejoras y mascotas para tu casa. Se compran una vez y las colocas donde quieras desde VISITAR.": "Мебель, улучшения и питомцы для твоего дома. Покупаются один раз, а расставить их можно где угодно, когда зайдешь домой.",
		"TIENES {0}": "У ТЕБЯ {0}",
		"POR PARTIDO": "ЗА МАТЧ",
		"TE CONVIENE": "ВЫГОДНО",
		"AL ALCANCE": "ПО КАРМАНУ",
		"COLOCAR AHORA": "ПОСТАВИТЬ",
		"Compraste {0}. Está en tus cajas.": "Покупка: {0}. Лежит в твоих коробках.",
		"Así quedaría tu casa.": "Вот так будет выглядеть твой дом.",
		"Nada al alcance en este cajón.": "В этом разделе нет ничего по карману.",
		"{0} x {0} m": "{0} x {0} м",
		"OTRA MÁS": "КУПИТЬ ЕЩЕ",
		"OTRA MÁS · {0}": "КУПИТЬ ЕЩЕ · {0}",
		"Se compran en MI JUGADOR ▸ CASA.": "Покупаются в разделе МОЙ ИГРОК ▸ ДОМ.",
		"TU CASA se reinicia a 0: se vende y te devuelven el 80% de lo invertido.":
			"ТВОЙ ДОМ обнуляется: его продают, и тебе возвращают 80% вложенного.",
		"INSTALADO": "УСТАНОВЛЕНО",
		"INSTALAR · {0}": "УСТАНОВИТЬ · {0}",
		"Abre: {0}.": "Открывает: {0}.",
		"Si cambias de club la vendes y empiezas de cero: te devuelven el 80% de lo invertido.":
			"Сменишь клуб — продашь его и начнешь с нуля: тебе вернут 80% вложенного.",
		"Si cambias de club empiezas de cero: la casa se queda, y te devuelven el 80% de lo invertido.":
			"Сменишь клуб — начнешь с нуля: дом остается, а тебе вернут 80% вложенного.",



		"fuera de la cuadrícula": "за пределами сетки",
		"se sale del suelo": "не помещается на полу",
		"tapa la puerta": "загораживает дверь",

		"sin sitio para usarlo": "нет места, чтобы им пользоваться",
		"tiene que ir pegado a una pared": "нужно повесить на стену",
		"no puede mirar a la pared": "не может стоять лицом к стене",
		"a la intemperie no se cuelga nada": "на улице ничего не повесишь",
		"el helipuerto va en el jardín, sobre el pasto": "вертолетная площадка ставится в саду, на траве",
		"el helipuerto pide cielo abierto: ni una pared alrededor": "вертолетной площадке нужно открытое небо: ни одной стены вокруг",

		"TERRENO": "УЧАСТОК",
		"La casa es tuya: te la llevas contigo aunque cambies de club.":
			"Дом твой: он остается с тобой, даже если сменишь клуб.",
		"Suelo nuevo pegado a tu casa: pártelo con paredes y amuéblalo a tu gusto en el modo edición.":
			"Новая площадь вплотную к дому: раздели ее стенами и обставь как хочешь в режиме редактирования.",
		"TERRENO ESTE": "ВОСТ. УЧАСТОК",
		"TERRENO DEL FONDO": "ЗАДНИЙ УЧАСТОК",
		"TERRENO OESTE": "ЗАП. УЧАСТОК",
		"ALA NORTE": "СЕВ. КРЫЛО",
		"TERRENO DEL GARAGE": "УЧАСТОК У ГАРАЖА",
		"Suelo nuevo pegado a la sala. Tuyo para lo que quieras.":
			"Новая площадь рядом с гостиной. Твоя — под что угодно.",
		"El fondo del edificio, ganado al patio de luces.":
			"Задняя часть здания, отвоеванная у светового колодца.",
		"Suelo nuevo junto a la recámara.":
			"Новая площадь рядом со спальней.",
		"El fondo del patio, allanado y tuyo.":
			"Дальний край сада, выровненный и твой.",
		"Suelo nuevo sobre el gimnasio, con paso a la sala.":
			"Новая площадь над спортзалом, с выходом в гостиную.",
		"Del jardín a la sala de premios, todo tuyo.":
			"От сада до зала наград — все твое.",
		"Un ala entera tras el salón, pegada a la suite.":
			"Целое крыло за холлом, рядом с хозяйской спальней.",
		"El costado del garage, listo para lo que sea.":
			"Боковая часть гаража, готовая ко всему.",
		"AMPLIAR · {0}": "РАСШИРИТЬ · {0}",
		"YA ES TUYO": "УЖЕ ТВОЕ",

		"VENTANA": "ОКНО",
		"VENTANA NUEVA": "НОВОЕ ОКНО",
		"Una ventana más, en el muro que tú elijas.":
			"Еще одно окно — на стене, которую выберешь.",
		"Luz de verdad en el muro que tú elijas.":
			"Настоящий свет на стене, которую выберешь.",

		"VENTANAL": "ПАНОРАМНОЕ ОКНО",
		"OJO DE BUEY": "ИЛЛЮМИНАТОР",
		"Del suelo al techo: el muro entero se vuelve luz.":
			"От пола до потолка: вся стена превращается в свет.",
		"Un redondel alto, para el rincón que pide poco.":
			"Маленькое круглое окошко под потолком — для уголка, которому много не надо.",

		"~{0} partidos de sueldo": "зарплата за ~{0} матч.",
		"menos de un partido de sueldo": "меньше зарплаты за один матч",
		"TE CONVIENE: llegas justo de energía":
			"ВЫГОДНО: у тебя мало энергии",
		"TE CONVIENE: el vestuario anda frío":
			"ВЫГОДНО: в раздевалке холодок",
		"TE CONVIENE: la afición anda fría": "ВЫГОДНО: болельщики охладели",
		"TE CONVIENE: la prensa no habla de ti":
			"ВЫГОДНО: пресса о тебе молчит",
		"TE CONVIENE: el técnico no te ve":
			"ВЫГОДНО: тренер тебя не замечает",
		"TE CONVIENE: tu agente no se mueve":
			"ВЫГОДНО: агент сидит без дела",

		"VER": "ГДЕ?",
		"AQUI VA: {0}": "СЮДА: {0}",
		"REPISA DE PARED": "НАСТЕННАЯ ПОЛКА",
		"Una balda más para tus trofeos, donde tú digas.":
			"Еще одна полка для трофеев — где скажешь.",
		"MASCOTA": "ПИТОМЕЦ",
		"PERRO": "СОБАКА",
		"GATO": "КОТ",
		"Un perro que te espera y te sigue por los cuartos.":
			"Пес, который ждет тебя и ходит за тобой по комнатам.",
		"Un gato que pasea a lo suyo... y a veces te sigue.":
			"Кот, который гуляет сам по себе... и иногда ходит за тобой.",

		"YA TIENES {0}": "УЖЕ ЕСТЬ: {0}",



		"TECNICO": "ТРЕНЕР",
		"AFICION": "ТРИБУНЫ",


		"TU CASA": "ТВОЙ ДОМ",
		"{0} de {1} adiciones": "Дополнений: {0} из {1}",
		"PATRIMONIO": "ИМУЩЕСТВО",
		"La mejor casa de tu carrera: {0}.": "Лучший дом твоей карьеры: {0}.",
		"Se quedó atrás con un traspaso.": "Остался в прошлом после трансфера.",

		"RECIBIR VISITA": "ПРИНЯТЬ ГОСТЕЙ",


		"ESTILO NORDICO": "СТИЛЬ СКАНДИ",
		"Madera clara y paredes de leche: la casa respira.":
			"Светлое дерево и молочные стены: дом дышит.",
		"ESTILO NOCTURNO": "НОЧНОЙ СТИЛЬ",
		"Grafito, humo y madera oscura. Serio como un 0-0 fuera.":
			"Графит, дым и темное дерево. Серьезно, как 0:0 на выезде.",
		"ESTILO DEL CLUB": "СТИЛЬ КЛУБА",
		"Telas y detalles con los colores de tu escudo.":
			"Ткани и детали в цветах твоего герба.",
		"MUDANZA": "ПЕРЕЕЗД",
		"LAS LLAVES SON TUYAS": "КЛЮЧИ ТВОИ",
		"EL SOLAR CRECE": "УЧАСТОК РАСТЕТ",





		"EL DIA DESPUES": "ДЕНЬ СПУСТЯ",
		"HOY MEJOR NO SALIR": "ЛУЧШЕ ПОСИДЕТЬ ДОМА",
		"EL MARCADOR": "СЧЕТ",
		"Mañana en el barrio no se hablará de otra cosa.":
			"Завтра в районе только об этом и будут говорить.",
		"Esa bandera la ataron a tu reja de madrugada.":
			"Этот флаг привязали к твоей ограде еще до рассвета.",
		"LO QUE COSTO": "ЦЕНА ВОПРОСА",

		"Tu agente te esperaba: hay ofertas sobre la mesa.":
			"Тебя ждал агент: на столе есть предложения.",
		"Un compañero vino a revivir la goleada.":
			"Партнер по команде зашел вспомнить разгром.",
		"Un compañero pasó a saludar.": "Партнер по команде заглянул поздороваться.",
		"{0} vino a revivir la goleada.": "{0} зашел вспомнить разгром.",
		"{0} pasó a saludar.": "{0} заглянул поздороваться.",
		"{0} se queda hasta tarde. El vestuario se entera de cómo vives.":
			"{0} засиделся допоздна. Раздевалка узнает, как ты живешь.",
		"YA RECIBISTE ESTA SEMANA": "ГОСТИ УЖЕ БЫЛИ НА НЕДЕЛЕ",
		"¿A QUIÉN RECIBES?": "КОГО ПРИГЛАСИШЬ?",
		"Tu casa de hoy rinde {0} de hospitalidad.":
			"Гостеприимство твоего дома сегодня: {0}.",
		"HOY NO": "НЕ СЕГОДНЯ",
		"A UN COMPAÑERO": "ПАРТНЕРА",
		"AL TÉCNICO": "ТРЕНЕРА",
		"A TU AGENTE": "АГЕНТА",
		"Se queda hasta tarde. El vestuario se entera de cómo vives.":
			"Засиживается допоздна. Раздевалка узнает, как ты живешь.",
		"Café, vídeo y charla larga. Te ve como alguien serio.":
			"Кофе, видео и долгий разговор. Он видит в тебе серьезного игрока.",
		"Negocio en la sala de tu casa: aquí las cifras suenan mejor.":
			"Дела в твоей гостиной: здесь цифры звучат лучше.",

		"ESTA SEMANA, EN CASA": "НА ЭТОЙ НЕДЕЛЕ — ДОМА",
		"Te quedan {0} de {1} acciones.": "Осталось действий: {0} из {1}.",
		"ya, esta semana": "уже сделано на этой неделе",
		"YA LO HICISTE ESTA SEMANA": "УЖЕ СДЕЛАНО НА ЭТОЙ НЕДЕЛЕ",
		"NO TE QUEDA TIEMPO ESTA SEMANA": "НА ЭТОЙ НЕДЕЛЕ НЕТ ВРЕМЕНИ",
		"de energía": "энергии",
		"DORMIR DE VERDAD": "ВЫСПАТЬСЯ",
		"Ocho horas seguidas y el cuerpo lo agradece.":
			"Восемь часов подряд — и тело говорит спасибо.",
		"COMER BIEN": "ЗДОРОВАЯ ЕДА",
		"Cocinas tú, y comes lo que te toca comer.":
			"Готовишь сам и ешь то, что положено.",
		"ESTUDIAR AL RIVAL": "ИЗУЧИТЬ СОПЕРНИКА",
		"Te tragas el partido del rival con libreta.":
			"Смотришь матч соперника с блокнотом в руках.",
		"NADAR": "ПЛАВАТЬ",
		"Largos suaves: descarga las piernas sin cargarlas.":
			"Спокойные заплывы: разгружают ноги, не нагружая.",
		"INVITAR AL VESTUARIO": "ПОЗВАТЬ КОМАНДУ",
		"Caen dos compañeros y se hace de noche jugando.":
			"Заглядывают двое партнеров, и вы играете дотемна.",
		"SALIR A RODAR": "ПОКАТАТЬСЯ",
		"Estrenas: {0}.": "Новинка: {0}.",
		"JUGAR AL SNAKE": "ИГРАТЬ В ЗМЕЙКУ",
		"SNAKE": "ЗМЕЙКА",
		"DESLIZA PARA GIRAR": "СВАЙП — ПОВОРОТ",
		"TOCA PARA OTRA": "НАЖМИ — ЕЩЕ РАЗ",
		"SE ACABO · {0}": "КОНЕЦ ИГРЫ · {0}",
		"¡RECORD! · {0}": "РЕКОРД! · {0}",
		"PUNTOS {0}   ·   RECORD {1}": "ОЧКИ {0}   ·   РЕКОРД {1}",
		"AL VESTUARIO ENTERO": "ВСЮ КОМАНДУ",
		"Veinticinco tíos en tu casa hasta la madrugada. La química se cocina.":
			"Двадцать пять парней у тебя дома до самого утра. Химия заваривается.",
		"PIDE {0}": "НУЖНО: {0}",
		"Necesitas {0} en tu casa.": "Тебе нужно иметь дома: {0}.",
		"LEVANTAR PESAS": "ТАСКАТЬ ЖЕЛЕЗО",
		"Una hora seria de hierro. El técnico se entera.":
			"Час серьезной работы с железом. Тренер это заметит.",
		"CORRER EN LA CINTA": "БЕГАТЬ НА ДОРОЖКЕ",
		"Fondo tranquilo: llegas al domingo con otra gasolina.":
			"Спокойная работа на выносливость: к воскресенью в баке больше бензина.",
		"Una vuelta sin rumbo. La gente te saluda.":
			"Катаешься куда глаза глядят. Люди машут тебе.",
		"JUGAR CON TU MASCOTA": "ИГРАТЬ С ПИТОМЦЕМ",
		"Media hora de correr tras algo que no cuenta.":
			"Полчаса бегать за тем, что не считается.",
		"PARED DE MOMENTOS": "СТЕНА МОМЕНТОВ",
		"Tus récords, enmarcados donde se vean.":
			"Твои рекорды в рамках — на самом видном месте.",
		"MAQUETA DEL ESTADIO": "МАКЕТ СТАДИОНА",
		"Tu estadio en miniatura, con los colores de tu club.":
			"Твой стадион в миниатюре, в цветах твоего клуба.",
		"ARCADE RETRO": "РЕТРО-АВТОМАТ",
		"Partidas viejas para despejar la cabeza. El vestuario pide turno.":
			"Старые игры, чтобы проветрить голову. Раздевалка стоит в очереди.",
		"PISCINA": "БАССЕЙН",
		"Largos suaves al día siguiente: las piernas lo agradecen.":
			"Спокойные заплывы на следующий день: ноги скажут спасибо.",
		"MOTO DE COLECCIÓN": "РЕДКИЙ МОТОЦИКЛ",
		"El garage por fin parece garage.":
			"Гараж наконец-то похож на гараж.",
		"MAQUETA DE TU ESTADIO": "МАКЕТ ТВОЕГО СТАДИОНА",
		"ARCADE": "АРКАДА",
		"MOTO": "БАЙК",
		"ESTUDIO DE VIDEO": "ВИДЕОЗАЛ",
		"Estudias al rival en tu sala. El técnico lo agradece.":
			"Изучаешь соперника у себя в комнате. Тренер это ценит.",
		"ASADOR EN EL PATIO": "МАНГАЛ ВО ДВОРЕ",
		"El vestuario viene a comer. La química se cocina.":
			"Команда приходит поесть. Химия заваривается.",
		"JACUZZI": "ДЖАКУЗИ",
		"Piernas nuevas al día siguiente del partido.":
			"Свежие ноги на следующий день после матча.",
		"SALA DE CINE": "КИНОЗАЛ",
		"Desconectas de verdad. Y todos quieren venir.":
			"По-настоящему отключаешься. И все хотят прийти.",
		"SPA CON FISIO": "СПА И МАССАЖИСТ",
		"Tratamiento en casa: el mejor descanso que se compra.":
			"Процедуры дома: лучший отдых, какой можно купить.",
		"CANCHA DE ENTRENAMIENTO": "ТРЕНИРОВОЧНОЕ ПОЛЕ",
		"Sales de casa y practicas campo abierto cuando quieras.":
			"Выходишь из дома и тренируешься на открытом поле когда угодно.",
		"SALIR A ENTRENAR": "ВЫЙТИ НА ТРЕНИРОВКУ",



		"MODO EDICION": "РЕДАКТОР",



		"INVENTARIO": "ИНВЕНТАРЬ",
		"TUS COSAS": "ТВОИ ВЕЩИ",
		"EN LA CASA": "В ДОМЕ",
		"EN CAJAS": "В КОРОБКАХ",
		"Aquí no hay nada todavía.": "Здесь пока пусто.",
		"No te sobra nada: todo lo que compraste está puesto en la casa.": "Ничего лишнего: все, что ты купил, стоит в доме.",


		"EXHIBICION": "НА ВИДУ",
		"OCIO": "ДОСУГ",
		"ENTRENAR": "ТРЕНИРОВКА",
		"DECORACION": "ДЕКОР",

		"ALFOMBRA": "КОВЕР",




		"Aquí se duerme de verdad y se recupera la energía.": "Здесь спят по-настоящему и восстанавливают энергию.",
		"Donde se reciben las visitas del vestuario.": "Здесь принимают гостей из раздевалки.",
		"Un sitio más donde sentarse sin ocupar medio cuarto.": "Еще одно место, чтобы сесть, не занимая полкомнаты.",
		"Comer bien en casa cuesta menos que comer fuera.": "Нормально питаться дома дешевле, чем в ресторанах.",
		"El centro de la sala: todo lo demás se acomoda alrededor.": "Центр гостиной: все остальное расставляется вокруг.",
		"Tus copas, a la vista. Cuantas más perchas, más palmarés.": "Твои кубки на виду. Чем больше полок, тем богаче коллекция.",
		"La vitrina del que empieza: pocas copas, pero las tuyas.": "Витрина новичка: кубков мало, но они твои.",
		"Una playera enmarcada por cada club en el que jugaste.": "Футболка в рамке за каждый клуб, где ты играл.",
		"Los récords de tu carrera, colgados.": "Рекорды твоей карьеры — на стене.",
		"Lo único de la tienda que se exhibe en casa.": "Единственная покупка из магазина, которую выставляют дома.",
		"Estudiar al rival antes del partido.": "Изучить соперника перед матчем.",
		"Una partida no cuesta acción de semana. Se está por estar.": "Партия не тратит действие недели. Просто для души.",
		"Tu estadio en pequeño, con su marcador.": "Твой стадион в миниатюре, с табло.",
		"Nadar descansa y no gasta energía de entrenamiento.": "Плавание дает отдых и не тратит тренировочную энергию.",
		"Salir a rodar. No sirve para nada y por eso está.": "Покататься. Пользы никакой — в этом и смысл.",
		"El rack con la barra: levantar pesas sube tu físico.": "Стойка со штангой: работа с весами качает физику.",
		"La torre de mancuernas. Un rack solo no hace un gimnasio.": "Стойка с гантелями. Одна стойка со штангой — еще не спортзал.",
		"Correr en casa los días que no hay cancha.": "Бегать дома в дни, когда нет поля.",
		"Va debajo de todo y no estorba a nada.": "Лежит под всем и никому не мешает.",
		"Verde en un rincón. Cuesta poco y se nota.": "Зелень в углу. Стоит недорого, а разница видна.",
		"Luz propia en el rincón que quede oscuro.": "Свой свет для угла, который остался темным.",
		"Se apoya a ras de muro y llena una pared entera.": "Ставится вплотную к стене и занимает ее целиком.",
		"De cuerpo entero. Pide muro, como todo lo que cuelga.": "В полный рост. Нужна стена, как и всему, что висит.",

		"{0} EN CAJAS": "В КОРОБКАХ: {0}",
		"{0} EN CAJAS · VALEN {1}": "В КОРОБКАХ: {0} · ЦЕНА {1}",
		"VENDER {0}": "ПРОДАТЬ {0}",
		"¿SEGURO? SE VAN {0} PIEZAS": "ТОЧНО? УЙДЕТ ШТУК: {0}",
		"MANTÉN PARA VENDER": "ЗАЖМИ, ЧТОБЫ ПРОДАТЬ",
		"MANTÉN · SE VAN {0} PIEZAS": "ЗАЖМИ · УЙДЕТ ШТУК: {0}",
		"SALDO {0}": "БАЛАНС {0}",
		"{0} x {1} celdas  ·  {2} m de alto": "Клеток: {0} x {1}  ·  высота {2} м",
		"EN CAJAS · TOCA PARA SACARLO": "В КОРОБКАХ · НАЖМИ, ЧТОБЫ ДОСТАТЬ",
		"EN LA CASA · TOCA PARA GUARDARLO": "В ДОМЕ · НАЖМИ, ЧТОБЫ УБРАТЬ",


		"MASCOTAS": "ПИТОМЦЫ",


		"OTRO": "ДРУГОЙ",
		"OTRO ({0}/{1})": "ДРУГОЙ ({0}/{1})",


		"PAREDES": "СТЕНЫ",
		"MUEBLES": "МЕБЕЛЬ",
		"PONER AQUI": "СЮДА",
		"INICIAR PARED": "НАЧАТЬ СТЕНУ",
		"FIN DE PARED": "КОНЕЦ СТЕНЫ",
		"CANCELAR TRAZO": "ОТМЕНА",
		"BAÑO": "ВАННАЯ",
		"INODORO": "УНИТАЗ",
		"Cerámica, tapa y cisterna para completar el baño.":
			"Керамика, крышка и бачок — для полноценной ванной.",
		"Lavabo con espejo y grifo, listo junto al muro.":
			"Раковина с зеркалом и краном — ставится к стене.",
		"Mampara de cristal y regadera para el rincón del baño.":
			"Стеклянная перегородка и лейка для угла ванной.",
		"Una tina de baño de borde ancho.": "Ванна с широким бортиком.",
		"LAVABO": "РАКОВИНА",
		"DUCHA": "ДУШ",
		"TINA": "ВАННА",
		"Lo primero que echa en falta una casa.": "Первое, чего не хватает в доме.",
		"Con espejo, para mirarte antes de salir.": "С зеркалом — посмотреться перед выходом.",
		"Agua caliente después de entrenar.": "Горячая вода после тренировки.",
		"Para las piernas cargadas de después del partido.": "Для забитых ног после матча.",
		"AMPLIAR EL TERRENO": "РАСШИРИТЬ УЧАСТОК",
		"PARED DE CAMISETAS": "СТЕНА ФУТБОЛОК",
		"Donde van las copas que ganas.": "Сюда ставят выигранные кубки.",
		"Una playera por cada club en el que jugaste.": "Футболка за каждый клуб, где ты играл.",
		"Para los trofeos que no caben en la vitrina.": "Для трофеев, которые не помещаются в витрину.",
		"LEVANTAR PARED": "ПОСТРОИТЬ СТЕНУ",
		"TIRAR ESTA PARED": "СНЕСТИ ЭТУ СТЕНУ",
		"REHACER ESTA PARED": "ВЕРНУТЬ ЭТУ СТЕНУ",

		"PONER PUERTA": "ДОБАВИТЬ ДВЕРЬ",
		"QUITAR PUERTA": "УБРАТЬ ДВЕРЬ",
		"DEJARIA SIN PASO": "НЕ БУДЕТ ПРОХОДА",
		"las paredes van rectas": "стены идут только прямо",
		"demasiado corta": "слишком короткая",
		"ahí no hay suelo": "там нет пола",
		"te quedarías dentro": "ты окажешься взаперти",
		"dejarías {0} sin paso": "без прохода останется: {0}",
		"HOY NO SALE · TOCA PARA SACARLA": "НЕ ГУЛЯЕТ · НАЖМИ, ЧТОБЫ ВЫПУСТИТЬ",
		"ANDA POR LA CASA · TOCA PARA GUARDARLA": "ГУЛЯЕТ ПО ДОМУ · НАЖМИ, ЧТОБЫ УБРАТЬ",
		"TAPETES": "КОВРЫ",



		"CUADRO DE PARED": "КАРТИНА",
		"CUADRO GRANDE": "БОЛЬШОЙ ХОЛСТ",
		"ÓLEO DE AUTOR": "КАРТИНА МАСЛОМ",
		"BANDERINES": "ФЛАЖКИ",
		"MIS BUFANDAS": "МОИ ШАРФЫ",
		"MIS BOTINES": "МОИ БУТСЫ",

		"MUSEO DE BALONES": "МУЗЕЙ МЯЧЕЙ",
		"ESCUDO DEL CLUB": "ГЕРБ КЛУБА",
		"BANDERINES DE CAMBIO": "ОБМЕННЫЕ ВЫМПЕЛЫ",
		"TIFO ENMARCADO": "ТИФО В РАМКЕ",
		"BALONES DE TEMPORADA": "МЯЧИ СЕЗОНОВ",
		"BUTACAS DEL ESTADIO": "КРЕСЛА СТАДИОНА",
		"ALFOMBRA DEL CÍRCULO": "КОВЕР «ЦЕНТР ПОЛЯ»",
		"CASILLERO DEL VESTIDOR": "ШКАФЧИК ИЗ РАЗДЕВАЛКИ",
		"TAPIZ": "ГОБЕЛЕН",
		"PANEL DE MADERA": "ДЕРЕВЯННЫЕ ПАНЕЛИ",
		"MAPA DE GIRAS": "КАРТА ТУРНЕ",
		"CARTEL DE PARTIDO": "АФИША МАТЧА",
		"PORTADA ENMARCADA": "ГАЗЕТА В РАМКЕ",
		"PLACA DE FICHAJE": "ТАБЛИЧКА ТРАНСФЕРА",
		"AUN NO SE JUEGA": "ЕЩЕ НЕ СЫГРАН",
		"VS {0}": "VS {0}",
		"{0} GOLES · NOTA {1}": "ГОЛЫ: {0} · ОЦЕНКА {1}",
		"\"EL QUE VIENE PISANDO FUERTE\"": "«ВОСХОДЯЩАЯ ЗВЕЗДА»",
		"DE LA CANTERA": "ВОСПИТАННИК",
		"El cartel de tu mejor partido: rival, goles y nota.":
			"Афиша твоего лучшего матча: соперник, голы и оценка.",
		"La portada del día que ganaste algo. Se reescribe sola.":
			"Первая полоса дня, когда ты что-то выиграл. Обновляется сама.",
		"El club, la temporada y lo que costó tu fichaje.":
			"Клуб, сезон и сколько стоил твой трансфер.",
		"PANTALLA DE MURO": "НАСТЕННЫЙ ЭКРАН",
		"CHIMENEA": "КАМИН",
		"PLAFÓN": "ПЛАФОН",
		"ARAÑA": "ЛЮСТРА",
		"APLIQUE": "БРА",
		"LÁMPARA DE BURÓ": "НОЧНИК",
		"RÓTULO DE NEÓN": "НЕОНОВАЯ ВЫВЕСКА",
		"TIRA LED": "LED-ЛЕНТА",
		"MACETERO": "КАШПО",
		"PECERA DE PIE": "АКВАРИУМ",
		"CARRITO DE REFRESCOS": "ТЕЛЕЖКА С НАПИТКАМИ",
		"PUF": "ПУФ",
		"BAÚL": "СУНДУК",
		"PERCHERO": "ВЕШАЛКА",
		"NEVERA DE JUGOS": "ВИТРИНА С СОКАМИ",
		"TOCADISCOS": "ПРОИГРЫВАТЕЛЬ",
		"Un lienzo con marco. Lo más barato contra un muro pelado.":
			"Холст в раме. Самое дешевое средство от голой стены.",
		"Metro y medio de lienzo. Ya no es un detalle.":
			"Полтора метра холста. Это уже не мелочь.",
		"Dos metros firmados. La pared entera es él.":
			"Два метра с подписью. Вся стена — это картина.",
		"Los de tus clubes, cruzando el rincón en diagonal.":
			"Цвета твоих клубов, натянутые наискосок через угол.",
		"Una bufanda por cada afición que te cantó.":
			"Шарф за каждую трибуну, что пела твое имя.",
		"Los botines de tus noches grandes, en peanas.":
			"Бутсы твоих великих вечеров — на подставках.",
		"Treinta y dos balones tras el cristal, con luz de museo.":
			"Тридцать два мяча за стеклом, с музейной подсветкой.",
		"El escudo de tu club, retroiluminado contra el muro.":
			"Герб твоего клуба с подсветкой на стене.",
		"Un banderín de intercambio por cada club que pisaste.":
			"Обменный вымпел за каждый клуб, где ты играл.",
		"Un trozo del tifo que te dedicó tu grada, enmarcado.":
			"Кусок тифо, которое для тебя сделала твоя трибуна, — в рамке.",
		"Un balón por temporada, con los colores de aquel año.":
			"Мяч за каждый сезон, в цветах того года.",
		"Dos butacas originales de la grada, con su número.":
			"Два настоящих кресла с трибуны, с номерами.",
		"El círculo central tejido, con tu escudo en medio.":
			"Вытканный центральный круг с твоим гербом посередине.",
		"Tu taquilla del vestidor, con tu dorsal en la puerta.":
			"Твой шкафчик из раздевалки, с номером на дверце.",
		"Un tramo de muro con otra tela, de suelo a techo.":
			"Участок стены в другой ткани, от пола до потолка.",
		"Duelas de suelo a techo: el muro deja de ser pared.":
			"Рейки от пола до потолка: стена перестает быть просто стеной.",
		"Un mapamundi con una chincheta en cada país donde jugaste. Se llena solo.":
			"Карта мира с булавкой в каждой стране, где ты играл. Заполняется сама.",
		"La pantalla colgada, sin mueble que la sostenga.":
			"Экран на стене, без тумбы под ним.",
		"Fuego de verdad: da luz propia y calienta el rincón.":
			"Настоящий огонь: свой свет и тепло в углу.",
		"Luz de techo, la que hace que un cuarto deje de ser cueva.":
			"Свет на потолке — то, что превращает пещеру в комнату.",
		"Cristal colgado en medio del salón. Se nota al entrar.":
			"Хрусталь над гостиной. Замечаешь сразу, как входишь.",
		"Va en pareja, uno a cada lado del muro que enseñas.":
			"Идут парой — по одному с каждой стороны стены, которой хвастаешься.",
		"Con su buró incluido, para leer sin encender el cuarto.":
			"С тумбочкой в комплекте — читать, не включая свет в комнате.",
		"Tu nombre en neón, encendido toda la noche.":
			"Твое имя в неоне, горит всю ночь.",
		"Bordea el muro y baña el cuarto de color.":
			"Тянется вдоль стены и заливает комнату цветом.",
		"Verde de metro ochenta para el rincón que sobra.":
			"Метр восемьдесят зелени для угла, который пустует.",
		"Una columna de agua con peces. No hace nada y se mira.":
			"Столб воды с рыбками. Ничего не делает — на него просто смотришь.",
		"Refrescos a mano cuando llega la visita.":
			"Напитки под рукой, когда приходят гости.",
		"Se tira al suelo y ya hay un sitio más donde caer.":
			"Бросаешь на пол — и вот еще одно место, куда плюхнуться.",
		"Guarda lo que no se enseña, y hace de banco.":
			"Хранит то, что не выставляют, и служит скамейкой.",
		"Donde va la chamarra al entrar por la puerta.":
			"Сюда отправляется куртка, как только входишь в дом.",
		"Jugos en frío, iluminados. La compra del que presume.":
			"Соки в холоде и с подсветкой. Покупка для тех, кто любит похвастаться.",
		"Vinilo, brazo y altavoces sobre su mueble de madera.":
			"Винил, тонарм и колонки на деревянной тумбе.",
		"El suelo deja de estar desnudo.": "Пол больше не голый.",
		"PLANTAS": "РАСТЕНИЯ",
		"Algo vivo en cada cuarto.": "Что-то живое в каждой комнате.",
		"Los libros visten más que el mármol.":
			"Книги украшают лучше мрамора.",
		"LÁMPARAS DE PIE": "ТОРШЕРЫ",
		"Rincones cálidos al caer la tarde.": "Уютные уголки, когда темнеет.",
		"RECÁMARA": "СПАЛЬНЯ",
		"SUITE": "ЛЮКС",
		"SALÓN": "ХОЛЛ",
		"Camina y mira lo que has ganado": "Пройдись и посмотри, чего ты добился",
		"Por colocar: {0} en cajas": "Еще не расставлено, в коробках: {0}",
		"Lo que se compra aquí, por secciones:": "Что здесь можно купить, по разделам:",
		"ENTRAR": "ВОЙТИ",
		"LA SIGUIENTE": "СЛЕДУЮЩИЙ",
		"EL TECHO": "ВЕРШИНА",
		"No hay casa mejor. Ahora llénala.":
			"Лучше дома нет. Теперь наполни его.",
		"Descanso: +{0} de energía tras cada partido.":
			"Отдых: +{0} энергии после каждого матча.",
		"Suma +{0} de energía tras cada partido.":
			"Дает +{0} энергии после каждого матча.",
		"Sólo cabe en el jardín de un solar de {0} x {0} o más.": "Помещается только в саду участка {0} x {0} или больше.",
		"Mantenimiento: {0} por partido.": "Содержание: {0} за матч.",
		"MUDARSE · {0}": "ПЕРЕЕХАТЬ · {0}",
		"TE FALTA {0}": "НЕ ХВАТАЕТ {0}",
		"SALA": "ГОСТИНАЯ",
		"PATIO": "ДВОРИК",
		"JARDIN": "САД",
		"SALA DE TROFEOS": "КОМНАТА ТРОФЕЕВ",
		"SALA DE PREMIOS": "ЗАЛ НАГРАД",
		"GALERIA": "ГАЛЕРЕЯ",
		"GARAGE": "ГАРАЖ",
		"CANCHA": "ПОЛЕ",
		"SOFÁ": "ДИВАН",
		"MESA": "СТОЛ",
		"REPISA": "ПОЛКА",
		"CAMA": "КОЙКА",
		"VITRINA": "ВИТРИНА",
		"MARCO": "РАМКА",
		"BANCA": "СКАМЬЯ",
		"AUTO": "АВТО",
		"PORTERÍA": "ВОРОТА",




		"A PRESTAMO": "В АРЕНДЕ",
		"MESA DE POQUER": "ПОКЕРНЫЙ СТОЛ",
		"AQUI": "ЗДЕСЬ",
		"SUELO": "ПОЛ",
		"BASTA": "ГОТОВО",
		"PINTAR TODAS LAS PAREDES": "ПОКРАСИТЬ ВСЕ СТЕНЫ",
		"PINTAR SUELO": "ПОКРАСИТЬ ПОЛ",
		"DEJAR DE PINTAR": "ХВАТИТ КРАСИТЬ",
		"QUITAR PINTURA": "УБРАТЬ КРАСКУ",
		"QUITAR PISO": "УБРАТЬ ПОЛ",
		"Ancho de la brocha, en casillas.": "Ширина кисти, в клетках.",
		"PINTAR ESTE CUARTO": "ПОКРАСИТЬ КОМНАТУ",
		"Se pinta el cuarto donde tengas la mano.": "Красится комната, где сейчас твоя рука.",
		"DERRIBAR EN LINEA": "СНЕСТИ ПО ЛИНИИ",
		"DEJAR LA MAZA": "ОТЛОЖИТЬ КУВАЛДУ",
		"EMPEZAR DERRIBO": "НАЧАТЬ СНОС",
		"TIRAR LO MARCADO": "СНЕСТИ ОТМЕЧЕННОЕ",
		"DERRIBAR": "СНЕСТИ",
		"PASTO": "ТРАВА",
		"Ciegas: {0} y {1}": "Блайнды: {0} и {1}",
		"{0} se retira": "{0} сбрасывает",
		"{0} pasa": "{0}: чек",
		"{0} iguala": "{0} уравнивает",
		"{0} sube a {1}": "{0} поднимает до {1}",
		"PAREJA": "ПАРА",
		"relacionesPAREJA": "ПАРА",
		"ESCALERA": "СТРИТ",
		"COLOR": "ФЛЕШ",
		"FULL": "ФУЛЛ-ХАУС",
		"PREFLOP": "ПРЕФЛОП",
		"FLOP": "ФЛОП",
		"TURN": "ТЕРН",
		"RIVER": "РИВЕР",
		"SHOWDOWN": "ВСКРЫТИЕ",
		"SIGUENOS":
			"ПОДПИШИСЬ",
		"Síguenos y comparte el juego con tus amigos.":
			"Подписывайся на нас и делись игрой с друзьями.",
		"COMPARTIR EL JUEGO": "ПОДЕЛИТЬСЯ ИГРОЙ",
		"COMPARTIR": "ПОДЕЛИТЬСЯ",
		"ENLACE COPIADO · PÉGALO DONDE QUIERAS": "ССЫЛКА СКОПИРОВАНА · ВСТАВЬ КУДА УГОДНО",
		"PULSA OTRA VEZ PARA SALIR": "НАЖМИ ЕЩЕ РАЗ ДЛЯ ВЫХОДА",
		"VALORAR EL JUEGO": "ОЦЕНИТЬ ИГРУ",
		"GIRAR": "ПОВОРОТ",
		"CAJA": "ЯЩИК",
		"MUEBLE": "МЕБЕЛЬ",
		"GUARDA": "УБРАТЬ",
		"ANULAR": "ОТМЕНА",
		"MOVER": "ДВИГАТЬ",
		"ALZAR": "СТРОИТЬ",
		"TRAZAR": "ЧЕРТИТЬ",
		"TIRAR": "СНЕСТИ",
		"NO PASA": "НЕЛЬЗЯ",
		"PINTAR": "КРАСИТЬ",
		"GIRO": "УГОЛ",
		"COLGAR PLAYERAS": "ВЕШАТЬ ФУТБОЛКИ",
		"PLAYERA ENMARCADA": "ФУТБОЛКА В РАМКЕ",
		"COLGAR PLAYERA": "ВЕШАТЬ ФУТБОЛКУ",
		"Una playera enmarcada, la que tú elijas. Cuelga las que quieras.": "Футболка в рамке — та, что выберешь сам. Вешай сколько хочешь.",
		"MARCO {0} · VACÍO": "РАМКА {0} · ПУСТО",
		"MARCO {0}": "РАМКА {0}",
		"AUTOMÁTICO": "АВТО",
		"DORSAL": "НОМЕР",
		"Toca el número que quieras. Los que llevan tus compañeros se piden dos veces.": "Нажми на любой номер. Чтобы забрать номер партнера, нажми дважды.",
		"El {0} lo lleva {1}. Toca otra vez y te lo pones: a él le dan otro.": "Номер {0} у игрока {1}. Нажми еще раз, и он твой: ему дадут другой.",
		"El {0} lo lleva {1}. Mantén y te lo pones: a él le dan otro.": "Номер {0} у игрока {1}. Зажми, и он твой: ему дадут другой.",
		"DEJARLO AUTOMÁTICO": "ОСТАВИТЬ АВТО",
		"SILLA": "СТУЛ",
		"Para sentarse a la mesa.": "Чтобы сидеть за столом.",
		"BANCO DE BARRA": "БАРНЫЙ СТУЛ",
		"Para la barra de la cocina.": "Для кухонной стойки.",
		"SILLÓN": "КРЕСЛО",
		"Tu sitio para ver el partido.": "Твое место для просмотра матчей.",
		"Tu solar pasa a {0} x {0}. Crece por los cuatro lados.":
			"Твой участок вырастает до {0} x {0}. Он расширяется во все четыре стороны.",
		"{0} en una edición de {1}": "{0} за один розыгрыш турнира {1}",
		"Mejor media": "Лучшая средняя оценка",
		"{0} va con todo ({1})": "{0} идет ва-банк ({1})",
		"{0} se lleva {1} (los demás se fueron)":
			"{0} забирает {1} (остальные сбросили)",
		"Gana {0} con {1} ({2})": "{0} выигрывает: {1} ({2})",




		"ARCE CLARO": "СВЕТЛЫЙ КЛЕН",
		"HORMIGÓN": "БЕТОН",
		"MÁRMOL": "МРАМОР",
		"CARBÓN": "ГРАФИТ",
		"PARTIDA DE PÓQUER": "ВЕЧЕР ПОКЕРА",
		"Invitas, se reparten cartas y se juega con tu dinero.":
			"Ты зовешь гостей, сдаются карты — и игра идет на твои деньги.",
		"LOS DEL VESTUARIO": "РАЗДЕВАЛКА",
		"Tres compañeros y una noche larga.":
			"Трое партнеров по команде и долгая ночь.",
		"GENTE DE OTROS CLUBES": "ИГРОКИ ДРУГИХ КЛУБОВ",
		"Se juega más fuerte, y se cuenta por ahí.":
			"Ставки выше, и об этом потом судачат.",
		"GENTE CONOCIDA": "ЗНАМЕНИТОСТИ",
		"Apuestas de las que salen en el periódico.":
			"Ставки, о которых потом пишут в газетах.",
		"CARTA ALTA": "ВЫСШАЯ КАРТА",
		"DOBLE PAREJA": "ДВЕ ПАРЫ",
		"TRÍO": "ТРОЙКА",
		"PÓQUER": "КАРЕ",
		"ESCALERA DE COLOR": "СТРИТ-ФЛЕШ",
		"PUNTERÍA": "ТОЧНОСТЬ",
		"AQUI GIRA": "ТУТ ПОВОРОТ",
		"SIN MESA": "НЕТ СТОЛА",
		"dejarías un rincón sin paso":
			"угол останется без прохода",
		"Solo ante el portero: define el mano a mano.":
			"Один на один с вратарем: выиграй дуэль.",
		"Jala hacia atrás y suelta al arco": "Оттяни назад и отпусти в сторону ворот",
		"Disparo de frente: aprovecha el ángulo abierto.":
			"Удар из центра: используй открытый угол.",
		"Jala y suelta con fuerza al arco": "Оттяни и с силой отпусти в сторону ворот",
		"Desde lejos: la puntería pesa más que la fuerza.":
			"Издалека: точность важнее силы.",
		"Apunta fino y suelta al arco": "Прицелься точно и отпусти в сторону ворот",
		"Ángulo cerrado: mete efecto para colarla.":
			"Острый угол: закрути мяч, чтобы он проскочил.",
		"Curva el tiro hacia el palo largo": "Закрути удар в дальний угол",
		"Contragolpe: resuelve antes de que cierre la defensa.":
			"Контратака: заверши, пока не вернулась защита.",
		"Jala y suelta antes de que te tapen":
			"Оттяни и отпусти, пока тебя не закрыли",
		"El balón es TUYO y estás en la banda: cuélgalo al área o prueba el tiro escorado.":
			"Мяч ТВОЙ, и ты на фланге: навесь в штрафную или пробей с острого угла.",
		"Jala y suelta: al área o al arco":
			"Оттяни и отпусти: в штрафную или в ворота",
		"Tiro libre directo: sortea la barrera al arco.":
			"Прямой штрафной: перекинь мяч через стенку в ворота.",
		"Jala y suelta por encima de la barrera":
			"Оттяни и отпусти над стенкой",
		"Córner: coloca el centro para el remate.":
			"Угловой: подай навес под удар.",
		"Pon el balón al corazón del área":
			"Отправь мяч в самый центр штрафной",
		"Penal: tú y el portero, a sangre fría.":
			"Пенальти: ты и вратарь — только хладнокровие.",
		"Elige tu lado y suelta ajustado":
			"Выбери сторону и отпусти точно в угол",
		"Falta al borde del área: monta el disparo desde fuera.":
			"Штрафной у самой штрафной площади: готовь удар издали.",
		"Jala y suelta buscando el hueco":
			"Оттяни и отпусти в просвет",
		"Saque de banda: reanuda el ataque con un compañero.":
			"Аут: продолжи атаку через партнера.",
		"Saca rápido hacia un compañero": "Быстро вбрось мяч партнеру",
		"Cancha entera y sin reloj: siente la conducción y tira cuando quieras.":
			"Все поле и никакого таймера: почувствуй ведение мяча и бей, когда захочешь.",
		"Arrastra para conducir; suelta en el círculo para tirar":
			"Тяни, чтобы вести мяч; отпусти в круге, чтобы ударить",
		"Ganas COMPLETANDO el pase largo a la otra banda, no marcando.":
			"Побеждаешь, ДОВЕДЯ длинный пас до другого фланга, а не забивая.",
		"Apunta al compañero de la otra banda":
			"Целься в партнера на другом фланге",
		"Aquí NO se tira: llega a las zonas rojas para salir limpio.":
			"Здесь НЕ бьют: доберись до красных зон, чтобы чисто выйти из-под прессинга.",
		"Arrastra para correr y zafarte de la marca":
			"Тяни, чтобы бежать и уйти от опеки",
		"Trofeos": "Трофеи",
		"ANDA POR LA CASA · TOCA PARA RENOMBRAR O GUARDAR":
			"ХОДИТ ПО ДОМУ · НАЖМИ: ПЕРЕИМЕНОВАТЬ ИЛИ УБРАТЬ",
		"Ampliar a {0} x {0}: levanta las paredes donde quieras y amuébla­lo a tu gusto en el modo edición.":
			"Расширить до {0} x {0}: поставь стены где хочешь и обставь все по своему вкусу в режиме редактирования.",
		"Asistencias": "Ассисты",
		"Aún no hay cartas en la mesa.": "На столе пока нет карт.",
		"BOTE: {0}": "БАНК: {0}",
		"CESION": "АРЕНДА",
		"LEY BOSMAN": "БОСМАН",
		"DEADLINE DAY": "ДЕДЛАЙН",
		"División": "Дивизион",
		"EL DIARIO": "ГАЗЕТА",
		"EL TRASPASO": "ТРАНСФЕР",
		"EL VESTUARIO DEL AÑO": "КОМАНДА ГОДА",
		"EN CURSO": "ИДЕТ",
		"Edad": "Возраст",
		"El club te sube a {0}": "Клуб повышает твой статус: {0}",
		"El primero de muchos. Este no se te olvida en toda la carrera.":
			"Первый из многих. Этот ты не забудешь за всю карьеру.",
		"GANO EL DERBI": "ВЫИГРАЛ ДЕРБИ",
		"GUARDARLA (HOY NO SALE)": "УБРАТЬ (СЕГОДНЯ ОТДЫХАЕТ)",
		"Goles": "Голы",
		"Guardado": "Сохранено",
		"HOY NO SALE · TOCA PARA RENOMBRAR O SACAR":
			"СЕГОДНЯ ОТДЫХАЕТ · НАЖМИ: ИМЯ ИЛИ ВЫПУСТИТЬ",
		"Hoy la ciudad amaneció con la portada buena.": "Сегодня город проснулся с хорошей первой полосой.",
		"Hoy la ciudad amaneció con tu nombre en la portada.":
			"Сегодня город проснулся с твоим именем на первой полосе.",
		"IGUALAR": "УРАВНЯТЬ",
		"INVITADO": "ГОСТЬ",
		"JUGAR PÓQUER": "ПОКЕР",
		"FACIL": "ЛЕГКО",
		"MEDIO": "СРЕДНЕ",
		"DIFICIL": "СЛОЖНО",
		"EXTREMO": "ЭКСТРИМ",

		"MANTEN PULSADO": "ЗАЖМИ И ДЕРЖИ",
		"SUELTA PARA TIRAR": "ОТПУСТИ — БРОСОК",
		"¡SE TE FUE LA MANO!": "РУКА ДРОГНУЛА!",
		"DIANA": "ЯБЛОЧКО",
		"ANILLO": "КОЛЬЦО",
		"TRIPLE {0}": "УТРОЕНИЕ {0}",
		"DOBLE {0}": "УДВОЕНИЕ {0}",
		"VISITA {0} DE {1}": "РАУНД {0} ИЗ {1}",
		"TU {0}   ·   {1} {2}": "ТЫ {0}   ·   {1} {2}",
		"TIRA {0}": "БРОСАЕТ {0}",
		"GANAS EL RETO": "ДУЭЛЬ ВЫИГРАНА",
		"GANAS LA PARTIDA": "ПАРТИЯ ТВОЯ",
		"OTRO DIA SERA": "В ДРУГОЙ РАЗ",
		"QUIMICA +{0}": "ХИМИЯ +{0}",
		"ARRASTRA Y SUELTA": "ТЯНИ И ОТПУСТИ",
		"FALTA · BOLA EN MANO": "ФОЛ · ШАР С РУКИ",
		"MESA ABIERTA": "СТОЛ ОТКРЫТ",
		"LISAS": "СПЛОШНЫЕ",
		"RAYADAS": "ПОЛОСАТЫЕ",
		"LA NEGRA": "ЧЕРНЫЙ ШАР",
		"{0} · TE QUEDAN {1}": "{0} · ОСТАЛОСЬ {1}",
		"TIRAR DARDOS": "ДАРТС",
		"JUGAR BILLAR": "БИЛЬЯРД",
		"¿CONTRA QUIEN?": "С КЕМ?",
		"TIRAR UN RATO": "ПОБРОСАТЬ",
		"UNA PARTIDA SOLO": "ИГРАТЬ ОДНОМУ",
		"Ya ganaste química esta semana. Se juega por el récord.": "На этой неделе ты уже получил химию. Теперь игра на рекорд.",
		"EL UTILERO": "ЭКИПИРОВЩИК",
		"UN COMPAÑERO": "ПАРТНЕР",
		"EL CAPITAN": "КАПИТАН",
		"DIANA DE DARDOS": "МИШЕНЬ ДЛЯ ДАРТСА",
		"Se tira como se chuta. Reta al vestuario y gana química.": "Бросаешь так же, как бьешь по мячу. Брось вызов раздевалке и получи химию.",
		"Se tira como se chuta: tensas y sueltas. Reta a quien quieras.": "Бросаешь так же, как бьешь: натянул и отпустил. Вызывай кого хочешь.",
		"La resortera, sobre el paño. Una partida con el vestuario.": "Рогатка — теперь на сукне. Партия с ребятами из раздевалки.",
		"NOCHE DE DARDOS": "ВЕЧЕР ДАРТСА",
		"Caen dos del vestuario y se tira hasta tarde.": "Заглядывают двое партнеров, и вы бросаете до поздней ночи.",
		"NOCHE DE BILLAR": "ВЕЧЕР БИЛЬЯРДА",
		"Tacos, hielo y una mesa que no se apaga.": "Кии, лед и стол, за которым не гаснет свет.",
		"LEVANTARSE DE LA MESA": "ВСТАТЬ ИЗ-ЗА СТОЛА",
		"LOS NUEVOS UNIFORMES": "НОВАЯ ФОРМА",
		"Media (OVR)": "Рейтинг (OVR)",
		"Mejor gol": "Лучший гол",
		"Mejor pase": "Лучший пас",
		"NUEVO CLUB": "НОВЫЙ КЛУБ",
		"No se pudo crear el video": "Не удалось создать видео",
		"No se pudo escribir el video": "Не удалось записать видео",
		"No se pudo preparar la carpeta del video":
			"Не удалось подготовить папку для видео",
		"Nota media": "Средняя оценка",
		"OTRA MANO": "ЕЩЕ РАЗДАЧА",
		"PASAR": "ЧЕК",
		"PONER NOMBRE": "ДАТЬ ИМЯ",
		"PRIMER GOL": "ПЕРВЫЙ ГОЛ",
		"Partidos": "Матчи",
		"Prima de objetivo: ${0}": "Бонус за цель: ${0}",
		"Primas por títulos: ${0}": "Бонусы за титулы: ${0}",
		"Cláusula de ascenso: tu ficha sube a ${0}":
			"Условие на случай повышения: твоя зарплата вырастает до ${0}",
		"Cláusula de descenso: tu ficha baja a ${0}":
			"Условие на случай вылета: твоя зарплата падает до ${0}",
		"RETIRARSE": "СБРОСИТЬ",
		"SACARLA A LA CASA": "ВЫПУСТИТЬ В ДОМ",
		"SE RETIRÓ": "СБРОСИЛ",
		"SIN TRASPASO": "БЕЗ ТРАНСФЕРА",
		"SUBIR A {0}": "ПОДНЯТЬ ДО {0}",
		"Sin títulos esta temporada.": "В этом сезоне без титулов.",
		"TRAMO": "ОТРЕЗОК",
		"TU PRIMER GOL": "ТВОЙ ПЕРВЫЙ ГОЛ",
		"TU TURNO": "ТВОЙ ХОД",
		"PIENSA {0}…": "{0} ДУМАЕТ…",
		"TERMINA LA MANO PARA LEVANTARTE": "ДОИГРАЙ РАЗДАЧУ, ЧТОБЫ ВСТАТЬ",
		"ESTA NOCHE: {0}": "СЕГОДНЯ: {0}",
		"MANO {0}/{1} · CIEGA {2}": "РАЗДАЧА {0}/{1} · БЛАЙНД {2}",
		"ULTIMA MANO DE LA NOCHE": "ПОСЛЕДНЯЯ РАЗДАЧА ВЕЧЕРА",
		"MEJOR MANO: {0}": "ЛУЧШАЯ РУКА: {0}",
		"ARRUINASTE A {0}": "БАНКРОТ: {0}",
		"NERVIOSO": "НЕРВНЫЙ",
		"TRANQUILO": "СПОКОЙНЫЙ",
		"PRUDENTE": "ОСТОРОЖНЫЙ",
		"EQUILIBRADO": "ВЗВЕШЕННЫЙ",
		"KAMIKAZE": "КАМИКАДЗЕ",
		"FAROLERO": "БЛЕФУН",
		"TIENES: {0}": "У ТЕБЯ: {0}",
		"IGUALAR {0}": "УРАВНЯТЬ {0}",
		"TORNEO · MANO {0} · CIEGA {1}": "ТУРНИР · РАЗДАЧА {0} · БЛАЙНД {1}",
		"¡CAMPEÓN DEL TORNEO!": "ЧЕМПИОН ТУРНИРА!",
		"TORNEO DE LA TEMPORADA": "ТУРНИР СЕЗОНА",
		"TORNEO: YA JUGADO ESTA TEMPORADA": "ТУРНИР: УЖЕ СЫГРАН В ЭТОМ СЕЗОНЕ",
		"Torneo de Póquer": "Покерный турнир",
		"Campeón del Torneo de Póquer": "Чемпион покерного турнира",
		"RETO: GANA UN BOTE DE FAROL": "ВЫЗОВ: ВЫИГРАЙ БАНК НА БЛЕФЕ",
		"RETO: DEJA A UN RIVAL SIN FICHAS": "ВЫЗОВ: ОБЧИСТИ СОПЕРНИКА",
		"RETO: GANA {0} EN UNA MANO": "ВЫЗОВ: ВЫИГРАЙ {0} ЗА РАЗДАЧУ",
		"RETO: GANA CON COLOR O MEJOR": "ВЫЗОВ: ВЫИГРАЙ С ФЛЕШЕМ ИЛИ ВЫШЕ",
		"RETO: ACABA LA NOCHE GANANDO": "ВЫЗОВ: ЗАКОНЧИ ВЕЧЕР В ПЛЮСЕ",
		"RETO CUMPLIDO · QUIMICA +{0}": "ВЫЗОВ ВЫПОЛНЕН · ХИМИЯ +{0}",
		"RETO CUMPLIDO": "ВЫЗОВ ВЫПОЛНЕН",
		"RETO DE LA SEMANA: HECHO": "ВЫЗОВ НЕДЕЛИ: ВЫПОЛНЕН",
		"TE DEBE {0}": "ДОЛГ ТЕБЕ: {0}",
		"LE DEBES {0}": "ТЫ ДОЛЖЕН {0}",
		"CIEGA {0} · PARA IGUALAR {1}": "БЛАЙНД {0} · УРАВНЯТЬ: {1}",
		"OVR {0}": "OVR {0}",
		"SUBIDA MINIMA {0} · TODO DENTRO {1}": "МИН. СТАВКА {0} · ВА-БАНК {1}",
		"TODO DENTRO ({0})": "ВА-БАНК ({0})",
		"TODO {0}": "ВА-БАНК {0}",
		"½ BOTE {0}": "½ БАНКА {0}",
		"BOTE {0}": "БАНК {0}",
		"TUS FICHAS: {0}": "ТВОИ ФИШКИ: {0}",
		"Tan cerca. La medalla de plata es la que enseña lo que todavía falta.":
			"Так близко. Серебряная медаль показывает, чего еще не хватает.",
		"Te sientan en el vestuario con el director deportivo. En {0} no pueden con tu sueldo y tu traspaso les cuadra el ejercicio: contaban con ese dinero antes de decírtelo.":
			"Тебя усаживают в раздевалке вместе со спортивным директором. В клубе {0} не тянут твою зарплату, а твой трансфер закрывает им дыру в бюджете: на эти деньги рассчитывали еще до того, как сказали тебе.",
		"Toca una temporada para verla en detalle.":
			"Нажми на сезон, чтобы посмотреть подробности.",
		"Toda la ciudad amaneció con esa portada.":
			"Весь город проснулся с этой первой полосой.",
		"Toda la ciudad amaneció con tu fichaje en la portada.":
			"Весь город проснулся с твоим трансфером на первой полосе.",
		"Tres equipaciones nuevas. El club estrena piel.":
			"Три новых комплекта формы. Клуб меняет кожу.",
		"Tu solar mide {0} x {0} metros.": "Размер твоего участка: {0} x {0} м.",
		"VER TEMPORADA A TEMPORADA": "ПО СЕЗОНАМ",
		"VER RESUMEN": "ИТОГИ",
		"Valor": "Стоимость",
		"Ya no se puede ampliar más.": "Больше расширять нельзя.",
		"{0}  (liga {1})": "{0}  (лига {1})",
		"{0} m": "{0} м",
		"{0} · TEMPORADA {1}": "{0} · СЕЗОН {1}",
		"¿CON QUIÉN JUEGAS?": "КТО ИГРАЕТ?",




		"MESA DE PÓQUER": "ПОКЕРНЫЙ СТОЛ",
		"Invita a quien quieras y juégate el dinero de verdad.":
			"Зови кого хочешь и играй на настоящие деньги.",
		"CAMA SENCILLA": "ОДНОСПАЛКА",
		"Un colchón y a dormir.": "Матрас — и спать.",
		"CAMA DOBLE": "ДВУСПАЛКА",
		"De verdad se descansa.": "Здесь правда высыпаешься.",
		"CAMA KING": "КИНГ-САЙЗ",
		"La cama de alguien que ya llegó.":
			"Кровать того, кто уже всего добился.",
		"Para ver el partido sentado.": "Чтобы смотреть матч сидя.",
		"SOFÁ ESQUINERO": "УГЛОВОЙ ДИВАН",
		"Caben los amigos.": "Все друзья поместятся.",
		"SOFÁ DE PIEL": "КОЖАНЫЙ ДИВАН",
		"Piel de verdad, del color del salón de un fichaje caro.":
			"Настоящая кожа — как в гостиной у дорогого новичка.",
		"Donde se come.": "Здесь едят.",
		"MESA DE COMEDOR": "ОБЕДЕННЫЙ СТОЛ",
		"Para sentar a la familia.": "Чтобы усадить всю семью.",
		"MESA DE MÁRMOL": "МРАМОРНЫЙ СТОЛ",
		"Pesa media tonelada y se nota.": "Весит полтонны, и это заметно.",
		"COCINETA": "МИНИ-КУХНЯ",
		"Dos fuegos y un fregadero.": "Две конфорки и мойка.",
		"COCINA COMPLETA": "ПОЛНАЯ КУХНЯ",
		"Aquí ya se cocina en serio.": "Здесь уже готовят всерьез.",
		"COCINA CON ISLA": "КУХНЯ С ОСТРОВОМ",
		"Con isla en medio, como las de revista.":
			"С островом посередине, как в журналах.",
		"GALLINA": "КУРИЦА",
		"Una gallina que picotea y trota por la casa.":
			"Курица, которая клюет и бегает по дому.",
		"LORO": "ПОПУГАЙ",
		"Un loro de colores que brinca y no para quieto.":
			"Яркий попугай, который скачет и не сидит на месте.",
		"PIANO DE COLA": "РОЯЛЬ",
		"Laca negra en el salón. Suena a que llegaste.":
			"Черный лак в гостиной. Звучит как успех.",
		"MESA DE BILLAR": "БИЛЬЯРДНЫЙ СТОЛ",
		"Una partida con el vestuario. La química se juega.":
			"Партия с ребятами из раздевалки. На кону — химия.",
		"FUTBOLITO": "КИКЕР",
		"Piques rápidos en casa. Nadie se va sin revancha.":
			"Быстрые зарубы дома. Никто не уходит без реванша.",
		"ESCULTURA": "СКУЛЬПТУРА",
		"Una pieza de autor. Puro caché en el salón.":
			"Авторская работа. Чистый статус прямо в гостиной.",
		"ACUARIO": "АКВАРИУМ",
		"Un muro de agua y peces. Baja las pulsaciones.":
			"Стена воды и рыб. Пульс сразу замедляется.",
		"ESTILO CALIDO": "ТЕПЛЫЙ СТИЛЬ",
		"Terracota, roble y luz de tarde. La casa abraza.":
			"Терракота, дуб и вечерний свет. Дом обнимает.",
		"ESTILO INDUSTRIAL": "ИНДУСТРИАЛЬНЫЙ",
		"Cemento visto, acero y madera cruda. Sin adornos.":
			"Голый бетон, сталь и необработанное дерево. Без украшательств.",
		"ESTILO MARMOL": "СТИЛЬ: МРАМОР",
		"Mármol blanco y filos de oro. La casa de un campeón.":
			"Белый мрамор и золотая окантовка. Дом чемпиона.",
		"PANTALLA GRANDE": "БОЛЬШОЙ ЭКРАН",
		"Una tele más grande para ver el gol en condiciones.":
			"Телевизор побольше, чтобы смотреть голы как следует.",
		"PANTALLA MURAL": "НАСТЕННЫЙ ЭКРАН",
		"Pantalla de pared, como en el palco. Se ve desde la cocina.":
			"Экран во всю стену, как в ложе. Видно даже с кухни.",
		"MESA DE JARDÍN": "САДОВЫЙ СТОЛ",
		"BANCA DE JARDÍN": "САДОВАЯ СКАМЬЯ",
		"Un sitio donde sentarse fuera y ver pasar la temporada.": "Место, где можно посидеть на улице и смотреть, как проходит сезон.",
		"Con sombrilla. Para comer fuera cuando aprieta el calor.": "С зонтом. Чтобы есть на улице, когда жарко.",
		"Agua corriendo en el patio. Se oye antes de verse.": "Журчание воды во дворе. Его слышно раньше, чем видно.",
		"Sombra de vigas sobre el patio. Se pasa por debajo.": "Тень от балок над двором. Под ними можно пройти.",

		"ARBUSTO": "КУСТ",
		"SOMBRILLA": "ЗОНТ",
		"FAROL DE JARDÍN": "САДОВЫЙ ФОНАРЬ",
		"HAMACA": "ГАМАК",
		"CAMASTRO": "ШЕЗЛОНГ",
		"ÁRBOL": "ДЕРЕВО",
		"COLUMPIO DE TERRAZA": "КАЧЕЛИ НА ТЕРРАСЕ",
		"FOGATA": "КОСТЕР",
		"HUERTO": "ОГОРОД",
		"PORTERÍA DE ENTRENO": "ТРЕНИРОВОЧНЫЕ ВОРОТА",
		"ESTANQUE DE KOI": "ПРУД С КОИ",
		"COCINA EXTERIOR": "ЛЕТНЯЯ КУХНЯ",
		"HELICÓPTERO": "ВЕРТОЛЕТ",
		"Nada de carreteras: llegas a todo volando y el cuerpo lo nota.": "Никаких дорог: ты всюду летаешь, и тело это чувствует.",
		"HELIPUERTO": "ВЕРТОДРОМ",
		"Verde bajo para el borde del terreno. Se ponen varios.":
			"Невысокая зелень для края участка. Можно поставить несколько.",
		"Sombra donde no hay árbol. Va sola, sin mesa debajo.":
			"Тень там, где нет дерева. Стоит сам по себе, без стола под ним.",
		"Luz propia fuera: de noche el jardín deja de ser un hueco negro.":
			"Свой свет снаружи: ночью сад перестает быть черной дырой.",
		"Lona suspendida entre dos postes para descansar al aire libre.":
			"Полотно между двумя столбами, чтобы отдыхать на свежем воздухе.",
		"Tumbarse al sol. Junto a la piscina se ven de a dos.":
			"Лежать на солнце. У бассейна смотрятся парой.",
		"Tres metros de copa: lo único que da sombra de verdad.":
			"Крона в три метра: единственное, что дает настоящую тень.",
		"Un banco colgado que se mece. Para ver caer la tarde.":
			"Подвесная скамья, которая качается. Чтобы смотреть, как опускается вечер.",
		"Fuego fuera: alumbra el patio y calienta la noche.":
			"Огонь на улице: освещает двор и согревает ночь.",
		"Bancales con verdura. Se come lo que sale de tu terreno.":
			"Грядки с овощами. Ешь то, что растет на твоем участке.",
		"Portería con red: entrenar en casa deja de ser una idea.":
			"Ворота с сеткой: тренировки дома перестают быть просто идеей.",
		"Agua quieta con carpas y una cascada que no calla.":
			"Тихая вода с карпами и водопад, который не умолкает.",
		"Barra, fuegos y fregadero fuera. El asador con casa.":
			"Стойка, конфорки и мойка под открытым небом. Мангал, к которому пристроили дом.",
		"La losa con la H. No sirve para nada y se ve desde el aire.":
			"Плита с буквой H. Ни для чего не нужна, зато ее видно с воздуха.",
		"Sombra donde no hay árbol. Se planta y ya hay sitio.":
			"Тень там, где нет дерева. Поставил — и место готово.",
		"Verde bajo para el borde. Lo barato que llena metros.":
			"Невысокая зелень для края. Дешевый способ заполнить метры.",
		"Luz propia en el jardín, encendida en cuanto cae la noche.":
			"Свой свет в саду: загорается, как только опускается ночь.",
		"FUENTE": "ФОНТАН",
		"PÉRGOLA": "ПЕРГОЛА",



		"ENTRENO": "ТРЕНИРОВКА",
		"ENTRENAMIENTO": "ТРЕНИРОВКА",
		"EL CAMPO DE ATRÁS": "ПОЛЕ НА ЗАДВОРКАХ",
		"Un campo cercado, una caseta y los conos. Con eso se empieza.":
			"Огороженное поле, будка и фишки. С этого и начинают.",
		"LA CIUDAD DEPORTIVA": "ТРЕНИРОВОЧНАЯ БАЗА",
		"CIUDAD DEPORTIVA": "ТРЕНИРОВОЧНАЯ БАЗА",
		"Vallado en condiciones, vestuarios y material para el balón parado.":
			"Нормальный забор, раздевалки и инвентарь для стандартов.",
		"EL CENTRO DE ALTO RENDIMIENTO": "ЭЛИТНЫЙ ЦЕНТР ПОДГОТОВКИ",
		"Tribuna, torre de filmación y una estación para cada cosa que sabes hacer.":
			"Трибуна, вышка для съемки и своя станция для всего, что ты умеешь.",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario"
		+ " distinto. Todavía no cuenta para la carrera. Se sale con PAUSA.":
			"Выбери упражнение и повторяй сколько хочешь: каждая попытка создает новую ситуацию. В карьере это пока не учитывается. Выход — через ПАУЗУ.",
		"QUE SE ENTRENA AQUI": "ЧТО ЗДЕСЬ ТРЕНИРУЮТ",
		"SI SUBES DE CATEGORIA": "ПРИ ПОВЫШЕНИИ",
		"Se abre: {0}.": "Откроется: {0}.",
		"PREPARADOR FÍSICO": "ФИЗТРЕНЕР",
		"Alguien que cuida tu cuerpo a jornada completa: la mayor recuperación tras"
		+ " cada partido.":
			"Человек, который на полную ставку следит за твоим телом: максимальное восстановление после каждого матча.",
		"CHEF PERSONAL": "ЛИЧНЫЙ ПОВАР",
		"Cocina para ti cada semana: COMER BIEN no te gasta acción y recuperas más energía tras cada partido.":
			"Готовит для тебя каждую неделю: ЗДОРОВАЯ ЕДА не тратит действие, и после каждого матча ты восстанавливаешь больше энергии.",
		"TU CHEF COCINÓ · SIN GASTAR ACCIÓN": "ГОТОВИЛ ТВОЙ ПОВАР · БЕЗ ТРАТЫ ДЕЙСТВИЯ",
		"NUTRICIONISTA": "ДИЕТОЛОГ",
		"Te arma la dieta de cada semana: cada partido te gasta menos energía.": "Составляет тебе рацион на каждую неделю: каждый матч отнимает меньше энергии.",
		"ENTRENADOR PERSONAL": "ЛИЧНЫЙ ТРЕНЕР",
		"Te espera en tu gimnasio: LEVANTAR PESAS no te gasta acción.": "Ждет тебя в твоем спортзале: ТАСКАТЬ ЖЕЛЕЗО не тратит действие.",
		"CON TU ENTRENADOR · SIN GASTAR ACCIÓN": "С ТРЕНЕРОМ · БЕЗ ТРАТЫ ДЕЙСТВИЯ",
		"GASTO": "РАСХОД",
		"ACCIONES": "ДЕЙСТВИЯ",
		"NIVEL {0}/{1}": "УРОВЕНЬ {0}/{1}",
		"TUYO · NIVEL {0}/{1}": "КУПЛЕНО · УРОВЕНЬ {0}/{1}",
		"SUBE A NIVEL {0} · PAGO ÚNICO": "ДО УРОВНЯ {0} · РАЗОВЫЙ ПЛАТЕЖ",
		"Comes como atleta: +{0}% de experiencia en cada partido.": "Питаешься как атлет: +{0}% опыта за каждый матч.",
		"Te cuida el cuerpo: {0}% menos riesgo de lesión.": "Следит за твоим телом: риск травмы ниже на {0}%.",
		"Más exigente: LEVANTAR PESAS te da +{0} de técnico.": "Строже: ТАСКАТЬ ЖЕЛЕЗО дает +{0} к доверию тренера.",
		"CONSULTORIO DE NUTRICIÓN": "КАБИНЕТ ДИЕТОЛОГА",
		"Escritorio, báscula con tallímetro y el plato en la pared: donde trabaja tu nutricionista.": "Стол, весы с ростомером и тарелка питания на стене: здесь работает твой диетолог.",
		"El consultorio de tu nutricionista: escritorio, báscula con tallímetro y el póster del plato.": "Кабинет твоего диетолога: стол, весы с ростомером и плакат с тарелкой питания.",
		"CLÍNICA PRIVADA": "ЧАСТНАЯ КЛИНИКА",
		"Casi la mitad de riesgo de lesión, y toda baja dura la mitad.":
			"Риск травмы почти вдвое ниже, и любая травма лечится вдвое быстрее.",
		"ANALISTA DE VÍDEO": "ВИДЕОАНАЛИТИК",
		"Estudias cada partido con alguien que sabe mirar: +25% de experiencia.":
			"Разбираешь каждый матч с тем, кто умеет смотреть: +25% опыта.",
		"RENEGOCIAR CON EL AGENTE": "НОВЫЕ УСЛОВИЯ С АГЕНТОМ",
		"Su comisión baja del 8% al 3%. Cara, pero cuanto antes la firmes, más te"
		+ " devuelve.":
			"Его комиссия падает с 8% до 3%. Дорого, но чем раньше подпишешь, тем больше сэкономишь.",
		"CORTES DE PELO": "СТРИЖКИ",
		"VELLO FACIAL": "БОРОДЫ И УСЫ",
		"TINTES": "ОКРАСКА",
		"PUNTAS": "КОНЧИКИ",
		"ENTRADAS": "ЗАЛЫСИНЫ",
		"La frente que gana terreno. Asúmelo con dignidad.":
			"Лоб отвоевывает территорию. Прими это с достоинством.",
		"RAPADO A LOS LADOS": "АНДЕРКАТ",
		"Máquina en los lados, tupé arriba. El corte de vestuario.":
			"Машинка по бокам, кок сверху. Стрижка из раздевалки.",
		"RAYA AL LADO": "ПРОБОР СБОКУ",
		"Una raya rapada a navaja. Detalle de peluquería cara.":
			"Пробор, выбритый бритвой. Признак дорогого барбершопа.",
		"DEGRADADO": "ФЕЙД",
		"Se difumina hacia abajo. Nunca pasa de moda.":
			"Плавно сходит на нет книзу. Никогда не выходит из моды.",
		"FRANJAS RAPADAS": "ВЫБРИТЫЕ ЛИНИИ",
		"Rayas marcadas al ras. Para el que ya tuvo su noche perfecta.":
			"Линии, выбритые под ноль. Для того, у кого уже была идеальная ночь.",
		"CRESTA ANCHA": "ШИРОКИЙ ИРОКЕЗ",
		"El mohicano de los campeones. Se lleva con una liga en la vitrina.":
			"Ирокез чемпионов. Его носят, когда в витрине уже есть титул чемпиона лиги.",
		"PATILLAS": "БАКЕНБАРДЫ",
		"Bajan por la mandíbula y ahí se quedan.": "Спускаются по линии челюсти и там остаются.",
		"MOSCA": "МУШКА",
		"Un toque bajo el labio. Poco pelo, mucha actitud.":
			"Штрих под губой. Мало волос, много характера.",
		"CANDADO": "ШКИПЕРСКАЯ",
		"Contorno fino, mejilla limpia. Requiere pulso.":
			"Тонкий контур, чистые щеки. Нужна твердая рука.",
		"BARBÓN": "БОРОДА",
		"Barba cerrada de verdad. Diez años encima en una semana.":
			"Настоящая густая борода. Плюс десять лет за неделю.",
		"BIGOTE MANILLAR": "ГУСАРСКИЕ УСЫ",
		"Las puntas caen. Solo se lo permite quien lleva una década.":
			"Кончики свисают. Такое может себе позволить только ветеран с десятком лет за плечами.",
		"PLATINO": "ПЛАТИНА",
		"Decolorado entero. Te van a encontrar en cualquier repetición.":
			"Обесцвечен целиком. Тебя найдут на любом повторе.",
		"ROJO FUEGO": "ОГНЕННЫЙ",
		"Se ve desde el último anillo de la grada.":
			"Видно даже с верхнего яруса трибуны.",
		"AZUL ELÉCTRICO": "ЭЛЕКТРИК",
		"Para el que ya fue el mejor de un mes y quiere que se note.":
			"Для того, кто уже был лучшим игроком месяца и хочет, чтобы это видели.",
		"ROSA": "ФУКСИЯ",
		"Solo se lo puede permitir alguien con un Balón de Oro en casa.":
			"Такое может себе позволить только тот, у кого дома стоит трофей «Игрок года».",
		"PUNTAS DECOLORADAS": "СВЕТЛЫЕ КОНЧИКИ",
		"Solo las puntas. El resto se queda como estaba.":
			"Только кончики. Остальное как было.",
		"PUNTAS DORADAS": "ЗОЛОТЫЕ КОНЧИКИ",
		"Oro en las puntas. Se gana ganando Europa.":
			"Золото на кончиках. Дается за победу в Европе.",




		"RADIO COMARCAL": "РАЙОННОЕ РАДИО",
		"CERÁMICA NORTE": "КЕРАМИКА СЕВЕРА",
		"NOVA MÓVIL": "НОВА МОБАЙЛ",
		"HELIOS SEGUROS": "ГЕЛИОС СТРАХОВАНИЕ",
		"IMPERIAL": "ИМПЕРИАЛ",
		"Te conocen del barrio. Cada año que cumples, te suben el trato.":
			"Тебя знают по району. С каждым отработанным годом условия становятся лучше.",
		"Narran tus partidos y te pagan por el pase, no por el remate.":
			"Комментируют твои матчи и платят за пас, а не за удар.",
		"Casi no te pagan por venir. Te pagan por el año entero.":
			"За выход почти не платят. Платят за весь год.",
		"La valla del estadio es tuya, pero sólo cobras cuando marcas.":
			"Рекламный щит на стадионе твой, но платят, только когда забиваешь.",
		"Les gusta el balón parado. Lo demás no se lo cuentan.":
			"Им нравятся стандарты. Остальное для них не в счет.",
		"Pagan la asistencia como otros pagan el gol.":
			"Платят за ассист так, как другие платят за гол.",
		"La llevan los que deciden partidos. Les da igual cómo.":
			"Эту марку носят те, кто решает исход матчей. Как именно — неважно.",
		"Quieren regularidad, no fuegos artificiales. Y la quieren todo el año.":
			"Им нужна стабильность, а не фейерверк. И весь год.",
		"Sólo miran las noches grandes: Europa y copa. La liga no existe.":
			"Смотрят только большие вечера: Европа и кубок. Лиги для них не существует.",
		"La marca del mundo te mira, y el mundo no se conforma.":
			"На тебя смотрит мировой бренд, а мир не довольствуется малым.",
		"El contrato de una vida, y pide la temporada de una vida.":
			"Контракт всей жизни — и он требует сезона всей жизни.",
		"{0} ASISTENCIAS": "АССИСТЫ: {0}",
		"{0} ENTRE GOLES Y ASISTENCIAS": "ГОЛЫ И АССИСТЫ: {0}",
		"{0} GOLES A BALÓN PARADO": "ГОЛЫ СО СТАНДАРТОВ: {0}",
		"{0} GOLES EN EUROPA O COPA": "ГОЛЫ В ЕВРОПЕ ИЛИ КУБКЕ: {0}",
		" Y MEDIA {0}": " И ОЦЕНКА {0}",
		" · media {0}/{1}": " · оценка {0}/{1}",
		"GOL O ASISTENCIA": "ГОЛ ИЛИ АССИСТ",
		"GOL DE BALÓN PARADO": "ГОЛ СО СТАНДАРТА",
		"GOL EN EUROPA O COPA": "ГОЛ В ЕВРОПЕ ИЛИ КУБКЕ",
		"GOL DE PENAL": "ГОЛ С ПЕНАЛЬТИ",
		"{0} te sube el trato: ${1} por partido": "{0} улучшает условия: ${1} за матч",
		"${0} por partido + ${1} por {2}": "${0} за матч + ${1} за {2}",
		"${0} / PARTIDO   +${1} POR {2}": "${0} / МАТЧ   +${1} ЗА {2}",
		"PREMIO ${0}": "БОНУС ${0}",
		"TU MARCA": "ТВОЙ БРЕНД",
		"PANADERÍA DEL BARRIO": "РАЙОННАЯ ПЕКАРНЯ",
		"IRON FIT": "IRON FIT",
		"VOLT COLA": "VOLT COLA",
		"BANCO MERIDIÁN": "БАНК МЕРИДИАН",
		"Pagan por estar en el campo. Si te sientan, no cobras.":
			"Платят за то, что ты на поле. Посадят на скамейку — денег нет.",
		"KRONOS SPORT": "KRONOS SPORT",
		"MOTORES ARIA": "АРИЯ МОТОРС",
		"AEROLÍNEAS CÉNIT": "АВИАЛИНИИ АПОГЕЙ",

		"PROMESA": "ТАЛАНТ",
		"PROFESIONAL": "ПРОФЕССИОНАЛ",
		"FIGURA": "ЛИДЕР",
		"ESTRELLA MUNDIAL": "МИРОВАЯ ЗВЕЗДА",
		"LEYENDA": "ЛЕГЕНДА",
		"INMORTAL": "ТИТАН",
		"del Mundo": "мира",
		"de tu club": "твоего клуба",
		"de {0}": "клуба {0}",
		"INMORTAL {0}": "ТИТАН {0}",
		"INMORTAL ★{0}": "ТИТАН ★{0}",
		"Leyenda eterna {0}.": "Вечная легенда {0}.",
		"—a las puertas": "—на пороге",
		"Te falta prestigio de leyenda mundial (o palmarés de club) para LEYENDA.":
			"Для ЛЕГЕНДЫ не хватает престижа мировой легенды (или клубных трофеев).",
		"CLASIFICATORIAS": "ОТБОР",
		"CLASIF. MUNDIAL": "ОТБОР МУНДИАЛЯ",
		"CLASIF. EUROPA": "ОТБОР: ЕВРОПА",
		"CLASIF. SUDAMÉRICA": "ОТБОР: Ю. АМЕРИКА",
		"CLASIF. NORTEAMÉRICA": "ОТБОР: С. АМЕРИКА",
		"CLASIF. ASIA": "ОТБОР: АЗИЯ",
		"CLASIF. ÁFRICA": "ОТБОР: АФРИКА",
		"CLASIF. OCEANÍA": "ОТБОР: ОКЕАНИЯ",
		"MUNDIAL": "МУНДИАЛЬ",
		"CONTINENTAL": "КОНТИНЕНТ",


		"AMISTOSOS": "ТОВАРИЩЕСКИЕ",
		"TODA LA CARRERA POR TORNEO": "ВСЯ КАРЬЕРА ПО ТУРНИРАМ",
		"Ningún puesto de esta liga da plaza de {0}: las plazas se reparten por el"
		+ " coeficiente del país, y la última competición es la puerta de las ligas"
		+ " pequeñas.":
			"Ни одно место в этой лиге не дает путевку на турнир {0}: путевки распределяются по коэффициенту страны, а последний турнир — это дверь в Европу для маленьких лиг.",
		"De {0} temporada(s) vieja(s) sólo se guardó el total, sin repartir por"
		+ " torneo: no entran en esta tabla.":
			"Старые сезоны ({0}): сохранился только общий итог, без разбивки по турнирам, поэтому в эту таблицу они не входят.",
		"EUROCOPA": "ЕВРОТУРНИР",
		"COPA AMÉRICA": "ЮЖНОАМ. ТУРНИР",
		"COPA ORO": "СЕВЕРОАМ. ТУРНИР",
		"COPA DE ASIA": "ТУРНИР АЗИИ",
		"COPA AFRICANA": "ТУРНИР АФРИКИ",
		"COPA CONTINENTAL": "КОНТИНЕНТ. ТУРНИР",




		"COPA DE CAMPEONES": "КУБОК ЭЛИТЫ",
		"COPA EUROPA": "КУБОК ЕВРОПЫ",
		"COPA CONFERENCIA": "КУБОК ЧЕЛЛЕНДЖ",

		"Aún no hay nada que exponer": "Пока нечего выставить",
		"sin sitio · pon otra vitrina o repisa": "нет места · поставь еще витрину или полку",
		"sin sitio · pon otro estante de balones": "нет места · поставь еще полку для мячей",
		"CAMISETAS": "ФУТБОЛКИ",
		"EN EQUIPO": "КОМАНДНЫЕ",
		"INDIVIDUALES": "ЛИЧНЫЕ",
		"Sin registro del año": "Год не записан",
		"SALIR DE LA CANCHA": "УЙТИ С ПОЛЯ",
		"Pronto podrás entrenar aquí.": "Скоро здесь можно будет тренироваться.",
		"ISLA CON BARRA": "ОСТРОВ СО СТОЙКОЙ",
		"La barra exenta: se cocina de un lado y se come del otro.":
			"Отдельно стоящая стойка: с одной стороны готовят, с другой едят.",
		"TOCADOR CON ESPEJO": "БОЛЬШОЕ ТРЮМО",
		"CAMA PARA PERRO": "СОБАЧЬЯ ЛЕЖАНКА",
		"RASCADOR PARA GATO": "КОГТЕТОЧКА",
		"LAVANDERÍA": "ПРАЧЕЧНАЯ",
		"MUEBLE DE RECIBIDOR": "ТУМБА В ПРИХОЖУЮ",
		"VESTIDOR DE ROPA DE CALLE": "ШКАФ С УЛИЧНОЙ ОДЕЖДОЙ",
		"TELESCOPIO": "ТЕЛЕСКОП",
		"CAMBIAR DE ROPA": "ПЕРЕОДЕТЬСЯ",
		"VOLVER A CASA": "ДОМОЙ",
		"Cojín, manta y juguete: el perro tiene dónde descansar.":
			"Подушка, плед и игрушка: собаке есть где отдохнуть.",
		"Postes y plataformas para que el gato tenga su rincón.":
			"Столбики и площадки, чтобы у кота был свой уголок.",
		"Lavadora, cesta y toallas para la ropa de entrenamiento.":
			"Стиральная машина, корзина и полотенца для тренировочной формы.",
		"Llaves, mochila y zapatos: todo a mano junto a la entrada.":
			"Ключи, рюкзак и обувь: все под рукой у входа.",
		"Ropa de calle, tenis y espejo. Acércate para cambiarte.":
			"Уличная одежда, кроссовки и зеркало. Подойди, чтобы переодеться.",
		"Tubo óptico sobre trípode para tu rincón junto a la ventana.":
			"Оптическая труба на треноге для твоего уголка у окна.",
		"Un rincón para los dos: espejo, frascos y banqueta.":
			"Уголок на двоих: зеркало, флаконы и пуфик.",
		"TOCADOR": "ТРЮМО",
		"El rincón de arreglarse, con espejo y su banqueta.":
			"Уголок, где приводят себя в порядок: зеркало и пуфик.",
		"DESPACHO CON CAJA FUERTE": "КАБИНЕТ С СЕЙФОМ",
		"Escritorio, carpetas y caja fuerte. Aquí se firma lo que ganas.":
			"Стол, папки и сейф. Здесь ты ставишь подпись под своими заработками.",
		"REPASAR CONTRATOS": "ИЗУЧИТЬ КОНТРАКТЫ",
		"Una tarde con tu agente y los papeles sobre la mesa.":
			"Вечер с агентом и бумагами на столе.",
		"SAUNA": "САУНА",
		"Duelas, piedras calientes y media hora de calor seco.":
			"Деревянная обшивка, горячие камни и полчаса сухого жара.",
		"Calor seco en duelas de pino. Sales otro después del partido.":
			"Сухой жар среди сосновых досок. После матча выходишь другим человеком.",
		"GORRAS DE LA SELECCIÓN": "КЕПКИ СБОРНОЙ",
		"Una gorra por partido con tu país. Se llena sola.":
			"По кепке за каждый матч за сборную. Коллекция пополняется сама.",
		"BALÓN DEL PRIMER GOL": "МЯЧ ПЕРВОГО ГОЛА",
		"El balón de tu primer gol, bajo cristal y con su cartela.":
			"Мяч твоего первого гола — под стеклом и с табличкой.",
		"COCINA DEL NUTRICIONISTA": "КУХНЯ ДИЕТОЛОГА",
		"Nevera de raciones pesadas y báscula en la barra.":
			"Холодильник со взвешенными порциями и весы на стойке.",
		"Comer medido: la misma comida de casa, pero pesada.":
			"Питание по меркам: та же домашняя еда, только взвешенная.",
		"Todo pesado y a su hora: el cuerpo lo nota el domingo.":
			"Все взвешено и вовремя: в воскресенье тело это почувствует.",
		"Barra central con fregadero: aquí se cocina y se come.":
			"Центральная стойка с мойкой: здесь готовят и здесь едят.",
		"MALETAS APILADAS": "СТОПКА ЧЕМОДАНОВ",
		"Una maleta por club. La pila crece con cada traspaso.":
			"По чемодану на каждый клуб. Стопка растет с каждым трансфером.",
		"SILLÓN DE BARBERO": "БАРБЕРСКОЕ КРЕСЛО",
		"Cuero, espejo con bombillas y carrito. Aquí se hacen las portadas.":
			"Кожа, зеркало с лампочками и тележка. Здесь рождаются обложки.",
		"VITRINA ISLA": "ВИТРИНА-ОСТРОВ",
		"La isla de museo: cristal por los cuatro lados y tres baldas.":
			"Музейный остров: стекло со всех четырех сторон и три полки.",
		"ESTATUA DE BRONCE": "БРОНЗОВАЯ СТАТУЯ",
		"Tú en bronce, sobre un plinto con tu nombre y tus títulos.":
			"Ты в бронзе, на постаменте с твоим именем и титулами.",
		"SIESTA AL SOL": "СИЕСТА НА СОЛНЦЕ",
		"Media hora fuera, sin teléfono. El cuerpo lo agradece.":
			"Полчаса на улице, без телефона. Тело скажет спасибо.",


		"CABINA DE PÓDCAST": "ПОДКАСТ-СТУДИЯ",
		"TINA DE HIELO": "ЛЕДЯНАЯ КУПЕЛЬ",
		"BANCO DE BOTAS": "СКАМЬЯ ДЛЯ БУТС",
		"TOALLERO": "ВЕШАЛКА",
		"ESPEJO DE CUERPO ENTERO": "ЗЕРКАЛО В ПОЛНЫЙ РОСТ",
		"MESA DE CENTRO": "ЖУРНАЛЬНЫЙ СТОЛ",
		"RINCÓN DEL CAFÉ": "КОФЕЙНЫЙ УГОЛОК",
		"APARADOR DE VAJILLA": "БУФЕТ С ПОСУДОЙ",
		"GALLINERO": "КУРЯТНИК",
		"GRABAR UN PÓDCAST": "ЗАПИСАТЬ ПОДКАСТ",
		"BAÑO DE HIELO": "ЛЕДЯНАЯ ВАННА",
		"LIMPIAR LAS BOTAS": "ПОЧИСТИТЬ БУТСЫ",
		"MINIJUEGOS": "МИНИ-ИГРЫ",
		"Micro, cascos y panel acústico. Graba tu semana: rinde con la prensa.":
			"Микрофон, наушники и акустическая панель. Записывай свою неделю: пресса это любит.",
		"Agua a tres grados. Tres minutos que las piernas agradecen.":
			"Вода в три градуса. Три минуты, за которые ноги скажут спасибо.",
		"Balda, cepillo y hormas. Botas cuidadas se gastan la mitad.":
			"Полка, щетка и колодки. Ухоженные бутсы изнашиваются вдвое медленнее.",
		"Barra de pared con toallas limpias. Pide muro para colgarse.":
			"Настенная перекладина с чистыми полотенцами. Нужна стена, чтобы ее повесить.",
		"Luna de cuerpo entero para mirarte antes de salir.":
			"Зеркало в полный рост, чтобы оглядеть себя перед выходом.",
		"Baja, delante del sofá: ahí van el café y el mando.":
			"Низкий, перед диваном: здесь стоят кофе и пульт.",
		"Cafetera, tazas y molinillo. El primer café del día, en casa.":
			"Кофемашина, чашки и кофемолка. Первый кофе дня — дома.",
		"Vajilla a la vista tras el cristal. La mesa se pone desde aquí.":
			"Посуда на виду за стеклом. Отсюда накрывают на стол.",
		"Caseta con tejadillo y nidal: la gallina tiene dónde dormir.":
			"Домик с крышей и гнездом: курице есть где спать.",
		"Una hora de micrófono contando tu semana. Una acción semanal.":
			"Час у микрофона: рассказываешь о своей неделе. Одно действие в неделю.",
		"Cepillo, betún y cordones: el próximo partido gasta la mitad.":
			"Щетка, крем и шнурки: следующий матч износит их вдвое меньше.",
		"Con las botas de cantera no hay nada que cuidar.":
			"За бутсами из академии ухаживать незачем.",
		"Tus botas ya están listas para el próximo partido.":
			"Твои бутсы готовы к следующему матчу.",
		"Espera al alta médica para entrenar.": "Дождись допуска врачей, чтобы тренироваться.",
		"UN JEQUE": "ШЕЙХ",
		"UN MAGNATE": "МАГНАТ",
		"UN FONDO": "ФОНД",
		"LOS INGRESOS SE DOBLAN": "ДОХОДЫ УДВАИВАЮТСЯ",
		"COMPRA PARA VENDER": "НА ПЕРЕПРОДАЖУ",
		"Compra el club para ganarlo todo: el doble de presupuesto en GERENCIA, y la directiva te va a pedir mucho más arriba en la tabla.": "Покупает клуб, чтобы выигрывать все: вдвое больший бюджет в разделе ДИРЕКЦИЯ, а от тебя потребуют места гораздо выше в таблице.",
		"Un fondo de inversión compra el club para revenderlo: algo más de presupuesto, y en su último año vende lo que más vale del vestuario.": "Инвестфонд покупает клуб, чтобы перепродать: бюджет чуть больше, а в последний год он продает самого ценного игрока раздевалки.",
		"Te sientan en el vestuario con el director deportivo. El fondo que compró {0} se va este verano y quiere su beneficio: eres lo que más vale del vestuario, y tu traspaso es la plusvalía.": "Тебя усаживают в раздевалке вместе со спортивным директором. Фонд, купивший клуб {0}, уходит этим летом и хочет свою прибыль: ты самый ценный игрок в раздевалке, а твой трансфер — это их навар.",
		"FACHADA": "ФАСАД",
		"TORRE DE CRISTAL": "СТЕКЛЯННАЯ БАШНЯ",
		"Tu piso en una torre de vidrio y acero: la ciudad entera en la ventana.": "Твоя квартира в башне из стекла и стали: весь город за окном.",
		"EDIFICIO COLONIAL": "КОЛОНИАЛЬНЫЙ ДОМ",
		"Balcones de hierro, arcos y muros de color: el barrio viejo de la ciudad.": "Кованые балконы, арки и цветные стены: старый квартал города.",
		"CASA MEDITERRANEA": "ДОМ У МОРЯ",
		"Muros encalados, teja árabe y buganvilla: huele a mar.": "Беленые стены, черепица и бугенвиллея: пахнет морем.",
		"CABAÑA DE MADERA": "БРЕВЕНЧАТЫЙ ДОМ",
		"Troncos, porche con mecedora y chimenea de piedra: el bosque en tu puerta.": "Бревна, крыльцо с креслом-качалкой и каменный камин: лес у твоего порога.",
		"CUBO DE CRISTAL": "СТЕКЛЯННЫЙ КУБ",
		"Un cubo de vidrio sobre el jardín: todo luz, nada que esconder.": "Стеклянный куб над садом: сплошной свет, нечего скрывать.",
		"LOFT DE HORMIGON": "БЕТОННЫЙ ЛОФТ",
		"Hormigón visto, ventanales de taller y puerta de acero: industrial de verdad.": "Голый бетон, окна как в цеху и стальная дверь: настоящий индастриал.",
		"MANSION VICTORIANA": "ВИКТОРИАНСКИЙ ОСОБНЯК",
		"Torreón, buhardillas y balaustradas: la casa de las películas.": "Башенка, мансарды и балюстрады: дом из кино.",
		"VILLA MEDITERRANEA": "ВИЛЛА У МОРЯ",
		"Arcos, palmeras y terraza con pérgola: una villa junto al mar.": "Арки, пальмы и терраса с перголой: вилла на берегу моря.",
		"HACIENDA": "АСЬЕНДА",
		"Portón de madera, patio con arcos y campanario: la casa grande del campo.": "Деревянные ворота, двор с арками и колокольня: большой загородный дом.",
		"RANCHO": "РАНЧО",
		"Cercas de madera, granero rojo y establo: tierra tuya hasta donde alcanza la vista.": "Деревянные изгороди, красный амбар и конюшня: твоя земля до самого горизонта.",
		"Bono de relación ya estrenado: no vuelve a sumar.": "Бонус отношений уже получен: повторно не начисляется.",
		"¿VOLVER A LA DE FÁBRICA?": "ВЕРНУТЬ СТАНДАРТНЫЙ?",
		"Se quita sin reembolso y la casa vuelve a la de fábrica. Comprarla otra vez cuesta lo mismo.": "Удаляется без возврата денег, и дом возвращается к стандартному виду. Повторная покупка стоит столько же.",
		"BUZÓN": "ПОЧТА",
		"COLUMPIO": "КАЧЕЛИ",
		"UN AFICIONADO": "БОЛЕЛЬЩИК",
		"Hay {0} ofertas sobre la mesa. No las dejes enfriar.": "Предложений на столе: {0}. Не дай им остыть.",
		"Tu precontrato está firmado. En verano cambias de aires.": "Предварительный контракт подписан. Летом тебя ждет новый клуб.",
		"Te vi el último partido y no me moví del asiento. Gracias.": "Я смотрел твой последний матч и не вставал с места. Спасибо.",
		"Tu nuevo contrato ya está en vigor: {0} temporadas más con nosotros.": "Твой новый контракт уже в силе: ты с нами еще на {0} сез.",
		"Van {0} goles esta temporada. La directiva lo celebra contigo.": "Голов в этом сезоне: {0}. Руководство клуба празднует вместе с тобой.",
		"Gracias por los títulos de la temporada pasada. La vitrina también es tuya.": "Спасибо за титулы прошлого сезона. Витрина — тоже твоя.",
		"Te cortan la rueda a gritos. Esta noche el vestuario no espera a nadie.": "Пресс-конференцию обрывают криками. Сегодня раздевалка никого не ждет.",
		"El confeti del suelo es del otro. Y aun así te toca contestar.": "Конфетти на полу — чужое. И все равно отвечать тебе.",
		"Se cuela uno a gritar detrás de ti. Un derbi también se gana delante del micro.": "Кто-то пробирается тебе за спину и орет. Дерби выигрывают и у микрофона.",
		"TOCAR EL PIANO": "ИГРАТЬ НА РОЯЛЕ",
		"OCTAVA {0}": "ОКТАВА {0}",
		"TOCA LAS TECLAS": "НАЖИМАЙ КЛАВИШИ",
		"CRUCETA ELIGE · {0} TOCA": "КРЕСТОВИНА: НОТА · {0}: ИГРА",
		"INTERCAMBIADAS": "ПОМЕНЯЛИСЬ",
		"AQUÍ": "СЮДА",
		"PONER AQUÍ": "ПОСТАВИТЬ",
		"TRAER AQUÍ": "ПЕРЕНЕСТИ",
		"DEJARLA AUTOMÁTICA": "ОСТАВИТЬ АВТО",
		"PROMETER UN GOL": "ПООБЕЩАТЬ ГОЛ",
		"{0} llega con cinco victorias seguidas en liga. El de la radio local, el único que te espera a la salida, te pregunta si os dan miedo.": "У команды {0} пять побед подряд в лиге. Парень с местного радио — единственный, кто ждет тебя у выхода, — спрашивает, боитесь ли вы их.",
		"{0} llega con cinco victorias seguidas en liga. La sala de prensa está llena hasta el pasillo, y todas las cámaras te preguntan si os dan miedo.": "У команды {0} пять побед подряд в лиге. Пресс-зал забит до самого коридора, и все камеры спрашивают, боитесь ли вы их.",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Un periodista de la radio local te para en el aparcamiento: ¿es el mejor momento para cruzártelos?": "Команда {0} не побеждает пять туров подряд, и ее трибуны уже требуют отставок. Журналист местного радио ловит тебя на парковке: сейчас лучший момент, чтобы с ними встретиться?",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Con la sala llena, la primera pregunta es para ti: ¿es el mejor momento para cruzártelos?": "Команда {0} не побеждает пять туров подряд, и ее трибуны уже требуют отставок. Зал полон, и первый вопрос — тебе: сейчас лучший момент, чтобы с ними встретиться?",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y el chico de la radio local quiere saber si tú sí.": "У команды {0} в этом сезоне новый тренер: {1}. Никто пока не знает, во что они играют, и парень с местного радио хочет знать, знаешь ли ты.",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y una sala llena de cámaras quiere saber si tú sí.": "У команды {0} в этом сезоне новый тренер: {1}. Никто пока не знает, во что они играют, и зал, полный камер, хочет знать, знаешь ли ты.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Sólo el fotógrafo del periódico local busca la foto del reencuentro.": "{0}, тренер, под началом которого ты играл, теперь сидит на скамейке клуба {1}. Только фотограф местной газеты охотится за снимком вашей встречи.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Medio país quiere la foto del reencuentro, y las cámaras ya os esperan en el túnel.": "{0}, тренер, под началом которого ты играл, теперь сидит на скамейке клуба {1}. Полстраны ждет снимок вашей встречи, а камеры уже караулят вас обоих в туннеле.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. En la radio local te preguntan si podrás con él.": "Клуб {1} подписал игрока {0} в этом сезоне, и он уже один из лучших в их составе. На местном радио спрашивают, справишься ли ты с ним.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Las portadas ya venden el partido como vuestro duelo, y la sala entera te pregunta por él.": "Клуб {1} подписал игрока {0} в этом сезоне, и он уже один из лучших в их составе. Первые полосы уже продают матч как вашу дуэль, и весь зал спрашивает тебя о нем.",
		"En tu país se ha coronado {0}. Una radio de allí, de las pocas que te siguen, te pregunta si algún día te verán jugar en casa.": "На родине чемпионом стал клуб {0}. Тамошнее радио — одно из немногих, что за тобой следят, — спрашивает, увидят ли там когда-нибудь, как ты играешь дома.",
		"En tu país se ha coronado {0}, y la prensa de allí abre con tu cara: ¿algún día te verán jugar en casa?": "На родине чемпионом стал клуб {0}, а тамошняя пресса выходит с твоим лицом на первой полосе: увидят ли там когда-нибудь, как ты играешь дома?",
		"COPAS": "КУБКИ",
		"TASACIÓN": "ЭКСПЕРТИЗА",
		"AFICIONADO": "БОЛЕЛЬЩИК",
		"COLECCIONISTA": "КОЛЛЕКЦИОНЕР",
		"QUEDÁRMELA": "ОСТАВИТЬ",
		"VENDIDA": "ПРОДАНА",
		"PERCHERO DE TIENDA": "СТОЙКА С ФУТБОЛКАМИ",
		"Doce playeras en ganchos, como en la tienda: las tuyas y las que cambiaste.": "Двенадцать футболок на крючках, как в магазине: твои и те, которыми ты обменялся.",
		"Te sale a encarar: pica cuando el aro llegue a sus piernas y pásasela por el túnel.": "Он выходит на тебя: нажми, когда кольцо дойдет до его ног, и прокинь мяч ему между ног.",
		"Toca la pantalla cuando el aro se cierre": "Нажми на экран, когда кольцо сомкнется",
		"Pulsa cuando el aro se cierre": "Нажми, когда кольцо сомкнется",
		"SUBASTAR": "АУКЦИОН",
		"SALIDA": "СТАРТ",
		"PUJA": "СТАВКА",
		"PARA EL {0}": "ДЛЯ №{0}",
		"SE FUE": "ВЫБЫЛ",
		"ADJUDICAR": "ПРОДАТЬ",
		"COBRAR": "ЗАБРАТЬ",
		"¡VENDIDA!": "ПРОДАНА!",
		"DESIERTA": "НЕ ПРОДАНА",
		"DUDA": "ХМ",
		"${0} / PARTIDO": "${0} / МАТЧ",
		"+${0} POR {1}": "+${0} ЗА {1}",
		"INDEMNIZACIÓN ${0}": "НЕУСТОЙКА ${0}",
		"ROMPISTE CON {0}": "РАЗРЫВ: {0}",
		"URNA DE PLAYERAS": "ВИТРИНА ФУТБОЛОК",
		"MURAL DE PLAYERAS": "СТЕНА ФУТБОЛОК",
		"VITRINA DE ESPECIALES": "ВИТРИНА РАРИТЕТОВ",
		"Tres playeras tras el cristal, con luz de museo.": "Три футболки за стеклом, с музейной подсветкой.",
		"Seis playeras enmarcadas en dos filas: tu salón de la fama.": "Шесть футболок в рамках, в два ряда: твой личный зал славы.",
		"Se llena sola con tus cambiadas más raras y valiosas.": "Заполняется сама твоими самыми редкими и ценными футболками из обменов.",
		"CHIHUAHUA": "ЧИХУАХУА",
		"SALCHICHA": "ТАКСА",
		"GOLDEN": "РЕТРИВЕР",
		"HUSKY": "ХАСКИ",
		"GATO NEGRO": "ЧЕРНЫЙ КОТ",
		"GATO GRIS": "СЕРЫЙ КОТ",
		"SIAMES": "СИАМСКИЙ",
		"PERSA": "ПЕРС",
		"Cabe en una mano y ladra como uno grande.": "Помещается в ладони, а лает как большая.",
		"Largo, bajito y siempre detrás de ti.": "Длинная, низенькая и всегда у тебя за спиной.",
		"Dorado, bonachón y el favorito del vestuario.": "Золотистый, добродушный и любимец раздевалки.",
		"Ojos de hielo y energía para dar y regalar.": "Ледяные глаза и энергии хоть отбавляй.",
		"Dicen que da mala suerte... al rival.": "Говорят, приносит неудачу... сопернику.",
		"Tranquilo, elegante y dueño del sofá.": "Спокойный, элегантный и хозяин дивана.",
		"Ojos azules y opinión sobre todo.": "Голубые глаза и мнение обо всем.",
		"Una nube blanca que duerme donde quiere.": "Белое облако, которое спит где хочет.",
		"LUEGO": "ПОТОМ",
		"AL VECINDARIO": "НА УЛИЦУ",
		"EL COMUNICADO": "ЗАЯВЛЕНИЕ",
		"Tus palabras siguen dando vueltas y el club espera un comunicado antes del próximo partido.": "Твои слова все еще обсуждают, и клуб ждет заявления до следующего матча.",
		"Tu roja dejó al equipo con diez. El club te pide un comunicado antes del próximo partido.": "Твоя красная оставила команду вдесятером. Клуб просит заявление до следующего матча.",
		"Tu festejo le costó una multa al club y la polémica no se apaga. Esperan tu comunicado.": "Твое празднование стоило клубу штрафа, и скандал не утихает. Все ждут твоего заявления.",
		"PEDIR PERDÓN": "ИЗВИНИТЬСЯ",
		"SOSTENERLO": "НЕ ОТСТУПАТЬ",
		"HIERBAS": "ЗЕЛЕНЬ",
		"LECHUGA": "САЛАТ",
		"JITOMATE": "ПОМИДОР",
		"CHILES": "ПЕРЕЦ ЧИЛИ",
		"FRESAS": "КЛУБНИКА",
		"MAÍZ": "КУКУРУЗА",
		"AGUACATE": "АВОКАДО",
		"AGAVE": "АГАВА",
	},





	"match_strip": {
		"ULTIMO": "ПРОШЛЫЙ",
		"PROXIMO": "СЛЕДУЮЩИЙ",
		"DEBUT": "ДЕБЮТ",
		"FIN": "КОНЕЦ",
		"HOY": "СЕГОДНЯ",
		"DERBI": "ДЕРБИ",
		"CASA": "ДОМА",
		"FUERA": "ВЫЕЗД",



		"{0} DERBIS · {1}": "{0} ДЕРБИ · {1}",
		"{0} DERBIS SIN GANARLE": "{0} ДЕРБИ БЕЗ ПОБЕД",
		"{0} DERBIS GANADOS SEGUIDOS": "{0} ДЕРБИ ПОДРЯД С ПОБЕДОЙ",
		"NUNCA LE HAS GANADO": "ТЫ НИ РАЗУ ИХ НЕ ОБЫГРАЛ",
		"NO LE GANAS DESDE HACE {0} AÑOS": "ЛЕТ БЕЗ ПОБЕД НАД НИМИ: {0}",


		"G": "В",
		"E": "Н",
		"P": "П",


		"LIGA": "ЛИГА",
		"COPA": "КУБОК",
		"CLASIF": "ОТБОР",
		"MUNDIAL": "ЧМ",

		"J{0}": "ТУР {0}",
		"GRUPO {0}": "ГРУППА {0}",

		"LIGA {0}": "ЛИГА {0}",



		"DIECISEISAVOS": "1/16 ФИНАЛА",
		"OCTAVOS": "1/8",
		"CUARTOS": "1/4 ФИНАЛА",
		"SEMIFINAL": "ПОЛУФИНАЛ",



		"rondaIDA": "ПЕРВЫЙ",
		"rondaVUELTA": "ОТВЕТНЫЙ",
		"FINAL": "ФИНАЛ",
		"PRIMERA RONDA": "РАУНД 1",
		"SEGUNDA RONDA": "РАУНД 2",
		"TERCERA RONDA": "РАУНД 3",
		"CUARTA RONDA": "РАУНД 4",
		"QUINTA RONDA": "РАУНД 5",
		"SEXTA RONDA": "РАУНД 6",
		"SÉPTIMA RONDA": "РАУНД 7",
		"OCTAVA RONDA": "РАУНД 8",
		"TREINTAIDOSAVOS": "1/32 ФИНАЛА",
		"FASE DE GRUPOS": "ГРУППОВОЙ ЭТАП",
	},





















	"content": {
		"MEJOR DEL MUNDIAL": "ЛУЧШИЙ НА МУНДИАЛЕ",
		"MEJOR DE LA COPA CONTINENTAL": "ЛУЧШИЙ НА КОНТИНЕНТАЛЬНОМ ТУРНИРЕ",
		"PREMIO CONTINENTAL": "НАГРАДА КОНТИНЕНТА",
		"El mundo entero miraba. Y el mejor fuiste tú.": "Весь мир смотрел. И лучшим был ты.",
		"Tu continente tuvo un dueño este verano.": "У твоего континента этим летом был хозяин.",
		"Ser el Mejor del Mundial con tu selección.": "Стать лучшим игроком мундиаля со своей сборной.",
		"PREMIO DEL MUNDO": "МИРОВАЯ НАГРАДА",
		"CHICO DE ORO": "ЗОЛОТОЙ ПАРЕНЬ",
		"Premio del Mundo": "Мировая награда",
		"Chico de Oro": "Золотой парень",
		"El Mejor del Planeta": "Лучший на планете",
		"Ganar el Chico de Oro, la promesa del año.": "Получить «Золотого парня» — приз главному открытию года.",
		"Ganar el Premio del Mundo.": "Получить «Мировую награду».",
		"GOL DEL AÑO": "ГОЛ ГОДА",
		"Gol del Año": "Гол года",
		"GOL OLÍMPICO": "ГОЛ С УГЛОВОГО",
		"BAJO LA BARRERA": "ПОД СТЕНКОЙ",
		"DESDE LEJOS": "ИЗДАЛЕКА",
		"CON ROSCA": "КРУЧЕНЫЙ",
		"CHILENA": "НОЖНИЦЫ",
		"VOLEA": "С ЛЕТА",
		"PANENKA": "ПАНЕНКА",
		"DE FALTA": "ШТРАФНОЙ",
		"DE CABEZA": "ГОЛОВОЙ",
		"Obra de Arte": "Шедевр",
		"Ganar el Gol del Año.": "Получить награду «Гол года».",
		"EL PASILLO": "КОРИДОР",
		"Tu gol 100, 250 o 500 con el club: tus compañeros se abren en dos filas aplaudiendo y tú cruzas por el medio saludando.": "Твой 100-й, 250-й или 500-й гол за клуб: партнеры выстраиваются в две шеренги и аплодируют, а ты идешь посередине и машешь им.",
		"EL MARCADOR SIGUE PUESTO": "ТАБЛО ВСЕ ЕЩЕ ГОРИТ",
		"Tres horas después del pitido. Nadie ha venido a apagarlo.": "Три часа после свистка. Никто так и не пришел его выключить.",
		"Tres horas después del pitido. En su casa nadie ha venido a apagarlo.": "Три часа после свистка. На их стадионе никто так и не пришел его выключить.",
		"TE AGUANTAS LA MIRADA": "НЕ ОТВОДИШЬ ВЗГЛЯД",
		"NO TE AGUANTAS LA MIRADA": "ОТВОДИШЬ ВЗГЛЯД",
		"El de enfrente durmió bien. Es el mismo que juega el jueves.": "Тот, кто напротив, спал хорошо. Это он играет в четверг.",
		"El de enfrente no durmió. Y es el que juega el jueves.": "Тот, кто напротив, не спал. И это он играет в четверг.",
		"VEINTE MINUTOS DESPUÉS": "ДВАДЦАТЬ МИНУТ СПУСТЯ",
		"el marcador": "счет",
		"minutos": "мин.",
		"El escudo que amaneció clavado en tu hueco lo pisó media plantilla al salir.": "Эмблему, которую с утра прикололи у твоего шкафчика, половина состава затоптала на выходе.",
		"Nadie descolgó la hoja del rival. Tu camiseta se quedó donde la tiraste.": "Никто не снял листок с разбором соперника. Твоя футболка осталась там, где ты ее бросил.",










		"SE ABRE EL MERCADO": "ОКНО ОТКРЫВАЕТСЯ",
		"LOS QUE QUIERE": "КОГО ХОТЯТ",
		"LOS QUE SUELTA": "КОГО ОТПУСКАЮТ",
		"MERCADO DE VERANO": "ЛЕТНЕЕ ОКНО",
		"El club no busca a nadie": "Клуб никого не ищет",
		"El club no suelta a nadie": "Клуб никого не отпускает",
		"PARA CEDER": "В АРЕНДУ",
		"INTOCABLES": "НЕПРИКАСАЕМЫЕ",
		"Nadie en venta": "Никто не продается",
		"Nadie para ceder": "Некого отдать в аренду",
		"Nadie es intocable": "Неприкасаемых нет",
		"TU MEDIA": "ТВОЙ OVR",
		"TU VALOR": "СТОИМОСТЬ",
		"ENTRAN": "ПРИХОД",
		"SALEN": "УХОД",
		"CEDIDO": "В АРЕНДЕ",
		"LIBRE": "БЕСПЛ.",
		"Nadie ha visto todavía lo que haces": "Еще никто не видел, на что ты способен",
		"La temporada que hiciste te pone por encima": "Твой сезон ставит тебя выше остальных",
		"Llevas años aquí y eso pesa": "Ты здесь много лет, и это имеет вес",
		"El once no se entiende sin ti": "Без тебя основа не складывается",
		"La temporada que hiciste no te defiende": "Твой сезон тебя не защищает",
		"Casi no juegas, y eso se nota en la lista": "Ты почти не играешь, и это видно по списку",
		"El club se hundió y hay que hacer caja": "Клуб пошел ко дну, и нужны деньги",
		"El club salvó el año y no necesita vender": "Клуб спас сезон, и продавать не нужно",
		"Lo que vales hoy es dinero que el club mira": "Твоя нынешняя стоимость — это деньги, на которые клуб поглядывает",


		"Un año. Lo que le regales dice si la conociste.":
			"Год. Твой подарок покажет, узнал ли ты ее.",
		"{0} años. Lo que le regales dice si la conociste.":
			"Лет вместе: {0}. Твой подарок покажет, узнал ли ты ее.",
		"Poso de los años: {0}%":
			"Багаж лет: {0}%",
		"Se te pasó la fecha. Ella no dijo nada.":
			"Ты пропустил дату. Она ничего не сказала.",
		"Se quedó callada un momento. Era exactamente eso.":
			"Она на мгновение замолчала. Это было именно то.",
		"Poso de los años: {0}% — las malas rachas pesan menos.":
			"Багаж лет: {0}% — черные полосы даются легче.",
		"Dio las gracias y lo dejó en la mesa del recibidor.":
			"Она сказала спасибо и оставила его на столике в прихожей.",
		"Un año más, y sigues sin saber quién es.":
			"Еще один год, а ты так и не знаешь, кто она.",
		"Un fin de semana los dos solos, sin teléfono":
			"Выходные вдвоем, без телефона",
		"Una fiesta con toda la gente que quiere":
			"Праздник со всеми, кого она любит",
		"Poner su nombre en algo tuyo: el coche, la casa, la cuenta": "Записать на нее что-то свое: машину, дом, счет",
		"Algo que compraste con prisa y sin pensar":
			"Что-то, купленное наспех и не глядя",
		"Un billete abierto para que se vaya donde quiera":
			"Открытый билет, чтобы она улетела куда захочет",
		"Repetir exactamente la primera cena, mesa incluida":
			"Повторить тот самый первый ужин, вплоть до столика",
		"UN AÑO MÁS":
			"ЕЩЕ ОДИН ГОД",
		"Hoy hace justo un año de aquello, y {0} no lo ha mencionado"
		+ " ni una vez en toda la semana. Eso no significa que se le"
		+ " haya olvidado.":
			"Ровно год с того дня, а {0} за всю неделю ни разу об этом не вспомнила. Это не значит, что она забыла.",
		"PREPARARLE ALGO":
			"ПРИДУМАТЬ ЧТО-ТО",
		"DEJARLO PASAR":
			"ПРОПУСТИТЬ",



		"Le queda una noche. Aciertos: {0} de {1}":
			"У нее осталась одна ночь. Угадано: {0} из {1}",
		"Lo que digas ahora depende de quién es ella.":
			"То, что ты скажешь сейчас, зависит от того, кто она.",
		"Deshizo una maleta. Sólo una, y sin decir nada.":
			"Она разобрала один чемодан. Только один — и молча.",
		"Se queda. No es lo de antes, pero se queda.":
			"Она остается. Как раньше уже не будет, но остается.",
		"Cerró la puerta despacio, que es peor que un portazo.":
			"Она тихо закрыла дверь. Это хуже, чем хлопнуть ею.",
		"Se acabó.":
			"Все кончено.",


		"EL CUARTO DE INVITADOS":
			"ГОСТЕВАЯ КОМНАТА",
		"Llevas tres noches durmiendo solo. {0} dice que es por la espalda, y en la"
		+ " cama de al lado hay una almohada que no estaba.":
			"Ты уже три ночи спишь один. {0} говорит, что дело в спине, а на соседней кровати появилась подушка, которой раньше не было.",
		"PREGUNTARLE QUÉ PASA":
			"СПРОСИТЬ, ЧТО СЛУЧИЛОСЬ",
		"SERÁ LA ESPALDA":
			"НАВЕРНОЕ, СПИНА",
		"NO PREGUNTÓ POR EL PARTIDO":
			"ОНА НЕ СПРОСИЛА О МАТЧЕ",
		"Entras, dejas la bolsa, y {0} sigue con lo suyo. Antes preguntaba antes de que"
		+ " te quitaras el abrigo. Hoy no, y ayer tampoco.":
			"Ты входишь, бросаешь сумку, а {0} занимается своим. Раньше спрашивала еще до того, как ты снимал куртку. Сегодня нет, и вчера тоже.",
		"APAGAR EL TELÉFONO Y SENTARTE":
			"ВЫКЛЮЧИТЬ ТЕЛЕФОН И СЕСТЬ",
		"SUBIR A DUCHARTE":
			"ПОДНЯТЬСЯ В ДУШ",
		"LA MALETA PEQUEÑA":
			"МАЛЕНЬКИЙ ЧЕМОДАН",
		"La maleta de mano lleva dos semanas junto a la puerta, hecha. {0} no la ha"
		+ " deshecho ni una vez, y tampoco se ha ido.":
			"Ручная кладь уже две недели стоит у двери, собранная. {0} ни разу ее не разобрала — и не уехала.",
		"PEDIR PERMISO Y LLEVÁRTELA":
			"ВЗЯТЬ ОТГУЛ И УВЕЗТИ ЕЕ",
		"NO ABRIR ESE TEMA":
			"НЕ ПОДНИМАТЬ ЭТУ ТЕМУ",
		"PASAR LA TARDE JUNTOS":
			"ПРОВЕСТИ ВЕЧЕР ВМЕСТЕ",
		"Sin teléfono y sin prisa. Se nota más de lo que parece.":
			"Без телефона и без спешки. Это значит больше, чем кажется.",
		"En casa se descansa: +{0} de energía cada jornada.":
			"Дома хорошо отдыхается: +{0} энергии каждый тур.",
		"Así no se duerme: {0} de energía cada jornada.":
			"Так не выспишься: {0} энергии каждый тур.",
		"DEJARLA":
			"РАЗОЙТИСЬ",
		"PEDIR EL DIVORCIO":
			"ПОДАТЬ НА РАЗВОД",
		"¿DIVORCIARTE DE {0}?":
			"{0}: РАЗВОД?",
		"¿DEJAR A {0}?":
			"{0}: РАССТАТЬСЯ?",
		"El reparto se paga igual que si lo pidiera ella: ${0}.":
			"Раздел имущества стоит столько же, как если бы его потребовала она: ${0}.",
		"La separación de bienes que firmasteis sigue valiendo. Es todo lo que te"
		+ " protege.":
			"Брачный договор, который вы подписали, все еще действует. Только он тебя и защищает.",
		"No firmasteis nada, así que entra todo: el dinero y lo que tienes puesto.":
			"Вы ничего не подписывали, так что делится все: деньги и даже то, что на тебе надето.",
		"No cuesta nada. Ni dinero ni prensa.":
			"Ничего не стоит. Ни денег, ни заголовков.",
		"Y no te va a presentar nadie a nadie en una buena temporada. Estas cosas se"
		+ " cuentan.":
			"И еще долго никто ни с кем тебя знакомить не станет. Такие вещи быстро расходятся.",
		"SÍ, SE ACABÓ":
			"ДА, ВСЕ КОНЧЕНО",
		"SE LLEVA ${0}":
			"ОНА ЗАБЕРЕТ ${0}",
		"«Me quedo. Los viajes que pueda perdonar, los pierdo.»":
			"«Я остаюсь. Все поездки, которые можно пропустить, я пропущу.»",
		"«No te voy a pedir que esperes. Te pido que elijas tú.»":
			"«Я не стану просить тебя ждать. Я прошу тебя выбрать.»",
		"«Esto se arregla con tiempo. Dame la temporada.»":
			"«Это лечится временем. Дай мне сезон.»",
		"«Dime qué necesitas y lo hago mañana.»":
			"«Скажи, что тебе нужно, и завтра я это сделаю.»",
		"«No hace falta que digas nada. Me siento y te escucho.»":
			"«Ничего не говори. Я сяду и выслушаю.»",
		"«Piensa en todo lo que hemos hecho.»":
			"«Подумай обо всем, что у нас было.»",
		"«Si te vas lo entiendo. Pero prefiero que te quedes.»":
			"«Если уйдешь — я пойму. Но я бы хотел, чтобы ты осталась.»",
		"«Mañana no hay entrenamiento. Vámonos donde quieras.»":
			"«Завтра тренировки нет. Поехали куда захочешь.»",
		"«Ya está, ¿no? Pues ya está.»":
			"«Значит, все? Ну и ладно, все.»",
		"Se sienta en el brazo del sofá, sin quitarse el abrigo.":
			"Она садится на подлокотник дивана, не снимая пальто.",
		"No ha dicho que no. Sigue ahí.":
			"Она не сказала «нет». Она все еще здесь.",
		"Mira las maletas y luego te mira a ti.":
			"Она смотрит на чемоданы, потом на тебя.",
		"Las maletas de {0} llevan dos días en el recibidor y esta"
		+ " vez no las está deshaciendo. Queda una conversación, y es"
		+ " esta noche.":
			"Чемоданы стоят в прихожей уже два дня, и на этот раз {0} их не разбирает. Остался один разговор — и он сегодня вечером.",
		"HABLAR CON ELLA":
			"ПОГОВОРИТЬ",
		"DEJAR QUE SE VAYA":
			"ОТПУСТИТЬ ЕЕ",


		"TU EX HABLA":
			"СЛОВО БЫВШЕЙ",
		"Una revista le ha pagado a {1} por contar cómo eras"
		+ " entonces. No miente en nada, y eso es lo peor. {0} lo ha"
		+ " leído entero.":
			"{1} за деньги рассказала журналу, каким ты был тогда. Она ни в чем не врет, и это хуже всего. {0} прочитала все от начала до конца.",
		"NO CONTESTAR":
			"ПРОМОЛЧАТЬ",
		"DESMENTIRLO EN PÚBLICO":
			"ОПРОВЕРГНУТЬ ПУБЛИЧНО",
		"ESTABA EN LA MISMA MESA":
			"ОНА СИДЕЛА РЯДОМ",
		"Cena de gala, y en la mesa de al lado está {1}. {0} la ha"
		+ " reconocido antes de sentarse y no ha soltado tu mano en toda"
		+ " la noche.":
			"Торжественный ужин, а за соседним столиком — {1}. {0} узнала ее еще до того, как села, и весь вечер не отпускает твою руку.",
		"SALUDARLA Y VOLVER":
			"ПОЗДОРОВАТЬСЯ НА МИНУТУ",
		"HACER COMO QUE NO":
			"СДЕЛАТЬ ВИД, ЧТО НЕ ВИДЕЛ",




		"LA CENA DEL VESTUARIO":
			"КОМАНДНЫЙ УЖИН",
		"El grupo sale a cenar y alguien lo deja caer con una"
		+ " sonrisa: «esta vez, solos». {0} ya se estaba arreglando.":
			"Команда идет ужинать, и кто-то с улыбкой роняет: «в этот раз — только мы». А {0} уже собиралась.",
		"LLEVARLA IGUAL":
			"ВЗЯТЬ С СОБОЙ",
		"LA ENTRADA DEL PALCO":
			"МЕСТО В ЛОЖЕ",
		"El club te ofrece una butaca de palco para {0}. Desde ahí se"
		+ " ve el partido; desde la grada de siempre se ve a la gente.":
			"Клуб предлагает место в ложе, и {0} может его занять. Из ложи видно матч; с привычной трибуны — людей.",
		"AL PALCO":
			"В ЛОЖУ",
		"CON LA GRADA":
			"НА ТРИБУНУ",
		"LA QUIEREN EN LA CAMPAÑA":
			"ЕЕ ЗОВУТ В РЕКЛАМУ",
		"La marca ha visto una foto vuestra y quiere a {0} en el"
		+ " anuncio. Pagan por los dos y no aceptan un no fácil.":
			"Бренд увидел ваше общее фото, и теперь ему в рекламе нужна {0}. Платят обоим, и простое «нет» не принимают.",
		"QUE SALGA ELLA":
			"ПУСТЬ СНИМЕТСЯ",
		"ELLA NO SE VENDE":
			"ОНА НЕ ПРОДАЕТСЯ",
		"LA CENA DE TU AGENTE":
			"УЖИН С АГЕНТОМ",
		"Tu agente ha montado una cena con gente que decide cosas. Es"
		+ " esta noche, y esta noche ya la teníais ocupada.":
			"Твой агент устроил ужин с людьми, которые решают вопросы. Ужин сегодня вечером, а этот вечер у вас уже был занят.",
		"IR A LA CENA":
			"ПОЙТИ НА УЖИН",
		"LO QUE TENÍAIS":
			"ВАШИ ПЛАНЫ",
		"EL VÍDEO DEL MÍSTER":
			"ВИДЕО ОТ ТРЕНЕРА",
		"El técnico ha mandado dos horas de vídeo para esta noche."
		+ " {0} lleva toda la semana esperando esta noche.":
			"Тренер прислал на вечер два часа видео. А {0} всю неделю ждала именно этого вечера.",
		"VERLO ENTERO":
			"СМОТРЕТЬ ВСЕ",
		"MAÑANA LO VES":
			"ПОДОЖДЕТ",
		"OS QUIEREN A LOS DOS":
			"ЗОВУТ ВАС ОБОИХ",
		"Un programa quiere una entrevista de pareja. Sería la"
		+ " primera vez que {0} habla delante de una cámara.":
			"Одно шоу хочет интервью с вами как с парой. {0} впервые будет говорить перед камерой.",
		"IR JUNTOS":
			"ИДТИ ВМЕСТЕ",
		"IR TÚ SOLO":
			"ИДТИ ОДНОМУ",
		"EL PLAN DE NO HACER NADA":
			"ПЛАН: НИЧЕГО НЕ ДЕЛАТЬ",
		"Hay tres sitios donde deberías dejarte ver este fin de"
		+ " semana. {0} ha comprado comida para dos y no piensa moverse"
		+ " de casa.":
			"В эти выходные есть три места, где тебе стоило бы засветиться. А {0} купила еды на двоих и не собирается выходить из дома.",
		"QUEDARTE CON ELLA":
			"ОСТАТЬСЯ С НЕЙ",
		"DEJARTE VER":
			"ПОКАЗАТЬСЯ",
		"ELLA CREE QUE VALES MÁS":
			"ОНА ЦЕНИТ ТЕБЯ ВЫШЕ",
		"{0} ha leído lo que cobra el que juega en tu puesto en otro"
		+ " sitio. «Pide lo tuyo o pídelo yo por ti.»":
			"{0} прочитала, сколько получает игрок на твоей позиции в другом клубе. «Требуй свое — или я потребую за тебя.»",
		"PEDIR MÁS AL CLUB":
			"ПОПРОСИТЬ ПРИБАВКУ",
		"ESTOY BIEN AQUÍ":
			"МНЕ ТУТ ХОРОШО",
		"LA FOTO DEL PATROCINIO":
			"ФОТО ДЛЯ СПОНСОРА",
		"En la foto de la marca sales con una modelo a medio metro."
		+ " {0} la ha visto antes que tú y no ha dicho nada, que es"
		+ " peor.":
			"На фото для бренда в полуметре от тебя стоит модель. {0} увидела его раньше тебя и ничего не сказала — а это хуже.",
		"HABLARLO ESA NOCHE":
			"ПОГОВОРИТЬ ВЕЧЕРОМ",
		"ES TRABAJO, SE LE PASA":
			"ЭТО РАБОТА, ПЕРЕЖИВЕТ",
		"SE FUE SIN AVISAR":
			"УЕХАЛА, НЕ СКАЗАВ",
		"{0} se ha ido diez días con sus amigas y te has enterado por"
		+ " una foto. No es una prueba: es que no se le ocurrió que"
		+ " hubiera que pedir permiso.":
			"{0} уехала на десять дней с подругами, а ты узнал об этом из фото. Это не проверка: ей просто не пришло в голову, что нужно спрашивать разрешения.",
		"DESEARLE BUEN VIAJE":
			"ДОБРОГО ЕЙ ПУТИ",
		"PEDIRLE EXPLICACIONES":
			"ТРЕБОВАТЬ ОБЪЯСНЕНИЙ",
		"ELLA YA ERA DE AQUÍ":
			"ОНА ВСЕГДА БЫЛА НАШЕЙ",
		"{0} tiene su sitio en la grada desde antes de conocerte y no"
		+ " piensa cambiarlo por un palco. Hoy le toca cantar contigo"
		+ " abajo.":
			"{0} ходит на свое место на трибуне еще с тех пор, когда вы не были знакомы, и не променяет его на ложу. Сегодня она будет петь за тебя внизу.",
		"SALUDARLA AL GOL":
			"ПОСВЯТИТЬ ЕЙ ГОЛ",
		"ESO NO SE HACE":
			"ТАК НЕ ДЕЛАЮТ",
		"LA CAZARON EN LA PUERTA":
			"ЕЕ ПОДЛОВИЛИ У ДВЕРИ",
		"Alguien vendió una foto de {0} saliendo de tu casa. No sale"
		+ " mal; sale sin querer salir, que para ella es lo mismo.":
			"Кто-то продал фото, где {0} выходит из твоего дома. Выглядит она неплохо — просто видно, что сниматься она не хотела, а для нее это одно и то же.",
		"PARAR ESO COMO SEA":
			"ПРЕСЕЧЬ ЛЮБОЙ ЦЕНОЙ",
		"SE OLVIDA EN DOS DÍAS":
			"ЗАБУДУТ ЗА ДВА ДНЯ",
		"LA SEMANA MALA":
			"ПЛОХАЯ НЕДЕЛЯ",
		"Otra derrota, y en casa no se habla de otra"
		+ " cosa. {0} no te pregunta: te pone las botas en la puerta y"
		+ " se calla.":
			"Еще одно поражение, и дома только о нем и говорят. {0} ни о чем не спрашивает: ставит твои бутсы у двери и молчит.",
		"SALIR A CORRER CON ELLA":
			"ПОБЕГАТЬ С НЕЙ",

		"TU AGENTE · «llámame, es importante»":
			"ТВОЙ АГЕНТ · «перезвони, это важно»",
		"EL MÍSTER · vídeo del rival, para hoy":
			"ТРЕНЕР · видео соперника, к вечеру",
		"TU MARCA · quieren una foto mañana":
			"ТВОЙ СПОНСОР · завтра нужно фото",




		"Le gusta la vida tranquila. No pide focos, pide que estés.":
			"Ей нравится спокойная жизнь. Ей не нужны софиты — ей нужно, чтобы ты был рядом.",
		"Vive de noche. Contigo o sin ti, y eso es justo el problema.":
			"Она живет ночью. С тобой или без тебя — в этом-то и проблема.",
		"Tiene lo suyo y va en serio. Te quiere arriba, y lo dice.":
			"У нее свое дело, и она к нему относится всерьез. Она хочет видеть тебя на вершине — и говорит об этом.",
		"Te quiere entero. Cada foto con otra le cuesta una noche.":
			"Ей нужен ты весь. Каждое твое фото с другой стоит ей бессонной ночи.",
		"No te necesita, te eligió. Aguanta todo menos que la des por"
		+ " hecha.":
			"Ты ей не нужен — она тебя выбрала. Стерпит все, кроме одного: когда ее принимают как должное.",
		"Iba al estadio antes de conocerte. Los domingos son"
		+ " sagrados.":
			"Она ходила на стадион еще до знакомства с тобой. Воскресенья — святое.",
		"Odia la prensa. Contigo en privado lo da todo; en público,"
		+ " nada.":
			"Она ненавидит прессу. Наедине отдает тебе все, на людях — ничего.",
		"Entiende el oficio: entrena, viaja, aguanta. Y espera lo"
		+ " mismo.":
			"Она знает это ремесло: тренируется, ездит, терпит. И ждет того же от тебя.",

		"Trabaja en algo que nunca termina de explicar. Invita ella, y no deja discutirlo.":
			"Она работает где-то, о чем толком не рассказывает. Платит она, и спорить не дает.",
		"LA CUENTA YA ESTABA PAGADA":
			"СЧЕТ УЖЕ ОПЛАЧЕН",
		"{0} ha pagado la cena, el hotel y un coche nuevo para tu madre, y no entiende qué te molesta. «Tengo más de lo que me voy a gastar nunca. Déjame.»":
			"{0} оплатила ужин, отель и новую машину твоей маме и не понимает, что тебя смущает. «У меня больше, чем я когда-нибудь потрачу. Позволь мне.»",
		"DEJAR QUE PAGUE":
			"ПУСТЬ ПЛАТИТ",
		"LA PRÓXIMA PAGO YO":
			"В СЛЕДУЮЩИЙ РАЗ Я",
		"REGALO DE ELLA":
			"ЕЕ ПОДАРОК",
		"FESTEJOS":
			"ПРАЗДНОВАНИЯ",
		"FALTAN {0}": "ЕЩЕ {0}",
		"COMPLETA":
			"СОБРАНО",
		"continenteEUROPA": "ЕВРОПА",
		"continenteSUDAMÉRICA": "ЮЖНАЯ АМЕРИКА",
		"continenteNORTEAMÉRICA": "СЕВ. АМЕРИКА",
		"continenteÁFRICA": "АФРИКА",
		"continenteASIA": "АЗИЯ",
		"continenteOCEANÍA": "ОКЕАНИЯ",
		"RIVALES":
			"СОПЕРНИКИ",
		"VENCIDO":
			"ОБЫГРАН",
		"Cada rival al que le ganes un partido queda apuntado aquí para siempre, en todas tus carreras.":
			"Каждый соперник, которого ты обыграешь в матче, навсегда попадает сюда — во всех твоих карьерах.",
		"PAREJAS":
			"ПОЛОВИНКИ",
		"Las mujeres de tu vida. Cada una destapa su medalla el día que se muda contigo, te casas con ella o se acaba.":
			"Женщины твоей жизни. Каждая открывает свою медаль в тот день, когда переезжает к тебе, когда ты на ней женишься или когда все заканчивается.",
		"Pareja por descubrir. Sabrás quién es el día que se mude contigo.":
			"Пока неизвестно, кто она. Узнаешь в тот день, когда она переедет к тебе.",
		"La última: {0}":
			"Последняя: {0}",
		"LA CENA DEL CLUB":
			"КЛУБНЫЙ УЖИН",
		"EL BAR":
			"БАР",
		"LA GALERÍA":
			"ГАЛЕРЕЯ",
		"LA PUERTA DEL ESTADIO":
			"ВХОД НА СТАДИОН",
		"DÓNDE LA CONOCES":
			"МЕСТО ЗНАКОМСТВА",
		"GASTO EN CASA":
			"РАСХОДЫ НА ДОМ",
		"DESCANSO EN CASA":
			"ОТДЫХ ДОМА",
		"SE ENFADA":
			"ОБИЖАЕТСЯ",
		"SE CONTENTA":
			"РАДУЕТСЯ",
		"PIDE DINERO":
			"ПРОСИТ ДЕНЬГИ",
		"EL {0} DEL SUELDO":
			"{0} ЗАРПЛАТЫ",
		"NUNCA":
			"НИКОГДА",
		"PIDE EL DIVORCIO":
			"ПОДАЕТ НА РАЗВОД",
		"PUEDE HACERLO":
			"МОЖЕТ",
		"TU CASA O TU SUELDO":
			"ДОМ ИЛИ ЗАРПЛАТУ",
		"EL {0} DE LO TUYO":
			"{0} ВСЕГО ТВОЕГО",
		"SE LLEVA AL IRSE":
			"ЗАБЕРЕТ ПРИ УХОДЕ",
		"TE REGALA":
			"ДАРИТ",
		"HASTA EL {0} DEL SUELDO":
			"ДО {0} ЗАРПЛАТЫ",
		"SE MUDA CONTIGO":
			"ПЕРЕЕДЕТ К ТЕБЕ",
		"PRONTO":
			"СКОРО",
		"SIN PRISA":
			"НЕ СПЕШИТ",
		"BAJA SOLA DESDE":
			"ПАДАЕТ НАЧИНАЯ С",
		"{0} · RÁPIDO":
			"{0} · БЫСТРО",
		"{0} · DESPACIO":
			"{0} · МЕДЛЕННО",
		"{0} · APENAS":
			"{0} · ЕДВА",
		"VIVIR CON ELLA":
			"ЖИЗНЬ С НЕЙ",
		"INVITA ELLA":
			"ПЛАТИТ ОНА",
		"· invita ella":
			"· платит она",
		"La boda la paga ella: ${0}.":
			"Свадьбу оплачивает она: ${0}.",
		"Boda pagada por ella: ${0}.":
			"Свадьба за ее счет: ${0}.",
		"LA TASACIÓN":
			"ОЦЕНЩИК",
		"Ha venido un señor con una carpeta a medir el salón y a fotografiar la vitrina. {0} dice que es por el seguro. Nadie ha cambiado el seguro.":
			"Пришел мужчина с папкой: обмерил гостиную и сфотографировал витрину трофеев. {0} говорит, что это для страховки. Страховку никто не менял.",
		"SUBIRLE LA ASIGNACIÓN":
			"ПОДНЯТЬ ЕЙ СОДЕРЖАНИЕ",
		"NO LE DOY MÁS":
			"НИ КОПЕЙКИ",
		"CUANDO LE CONVENGA":
			"КОГДА ЕЙ ВЫГОДНО",
		"TE CUESTA MÁS":
			"СТОИТ ДОРОЖЕ",
		"TE SUMA MÁS":
			"ДАЕТ БОЛЬШЕ",
		"TE CUESTA MENOS":
			"СТОИТ ДЕШЕВЛЕ",
		"TE SUMA MENOS":
			"ДАЕТ МЕНЬШЕ",

		"LAS ESCRITURAS":
			"НА ЧЬЕ ИМЯ ДОМ",
		"Tu agente trae las escrituras de la casa y una sola pregunta: a nombre de quién. {0} ya ha preguntado dos veces si hay que firmar algo.":
			"Твой агент приносит документы на дом и один-единственный вопрос: на чье имя. {0} уже дважды спросила, нужно ли что-то подписывать.",
		"QUE DECIDA ELLA":
			"ПУСТЬ РЕШИТ ОНА",
		"Tu agente pone las escrituras sobre la mesa y pregunta sin mirarte: «¿a nombre de quién?».":
			"Твой агент кладет документы на стол и, не глядя на тебя, спрашивает: «на чье имя?».",
		"MANTÉN · A NOMBRE DE MI MADRE":
			"ЗАЖМИ · НА ИМЯ МАМЫ",
		"MANTÉN · A SU NOMBRE":
			"ЗАЖМИ · НА ЕЕ ИМЯ",
		"Tu madre firmó sin gafas y sin preguntar. Al salir te dijo: «Yo no entiendo de papeles, hijo. Pero de esa casa no me saca nadie».":
			"Мама подписала без очков и ничего не спрашивая. На выходе она сказала тебе: «Я в бумагах не разбираюсь, сынок. Но из этого дома меня никто не выгонит».",
		"Ella se enteró esa noche y pidió más asignación: el {0} de tu sueldo.":
			"Она узнала об этом в тот же вечер и потребовала больше на содержание: {0} твоей зарплаты.",
		"Leyó su nombre dos veces y sonrió. Esa noche no habló de la asignación.":
			"Она дважды прочитала свое имя и улыбнулась. В тот вечер о содержании она не заговаривала.",
		"Su abogado pidió la casa. Las escrituras dicen otra cosa.":
			"Ее адвокат потребовал дом. Но в документах написано другое.",
		"La casa está a nombre de tu madre.":
			"Дом записан на твою маму.",
		"FIRMAR Y QUE SE VAYA":
			"ПОДПИСАТЬ И ОТПУСТИТЬ",
		"Su abogado trae las escrituras con su nombre. El tuyo consigue cambiarlas por la mitad de tu cuenta.":
			"Ее адвокат приносит документы на дом с ее именем. Твой добивается, чтобы их обменяли на половину твоего счета.",
		"La casa y tu ficha se quedan.":
			"Дом и твоя зарплата остаются.",
		"LA MITAD DE TU DINERO · ${0}":
			"ПОЛОВИНА ТВОИХ ДЕНЕГ · ${0}",
		"Se fue con dos maletas, las mismas con las que llegó.":
			"Она ушла с двумя чемоданами — теми же, с которыми пришла.",
		"La casa sigue a nombre de tu madre.":
			"Дом по-прежнему записан на твою маму.",
		"Firmaste. La casa vuelve a ser tuya; la cuenta, la mitad.":
			"Ты подписал. Дом снова твой; от счета — половина.",
		"DEPENDE DE LAS ESCRITURAS":
			"ЗАВИСИТ ОТ ДОКУМЕНТОВ",
		"Todo a Nombre de Mamá":
			"Все записано на маму",
		"Que su abogado pidiera la casa y las escrituras dijeran otra cosa.":
			"Ее адвокат требует дом, а в документах написано другое.",
		"Lo pediste tú, y las escrituras están a nombre de tu madre: no hay nada que repartir.":
			"Ты сам об этом просил, и документы на дом оформлены на твою маму: делить нечего.",
		"Su abogado trae las escrituras con su nombre, pero tu cuenta está a cero: no hay mitad que llevarse.":
			"Ее адвокат приносит документы с ее именем, но на твоем счету ноль: забирать половину не из чего.",
		"Las escrituras están a nombre de tu madre: no se lleva nada.":
			"Документы оформлены на твою маму: она ничего не забирает.",
		"Las escrituras están a su nombre: se lleva la mitad de tu dinero, ${0}.":
			"Документы оформлены на нее: она забирает половину твоих денег — ${0}.",
		"La casera":
			"Домоседка",
		"La fiestera":
			"Тусовщица",
		"La ambiciosa":
			"Амбициозная",
		"La celosa":
			"Ревнивая",
		"La independiente":
			"Независимая",
		"La hincha":
			"Болельщица",
		"La reservada":
			"Скрытная",
		"La cazafortunas":
			"Меркантильная",
		"La compañera":
			"Соратница",
		"La millonaria":
			"Миллионерша",
		"Quiere tu tiempo, no tu dinero. En casa se duerme.":
			"Ей нужно твое время, а не деньги. Дома ты высыпаешься.",
		"Vive de noche, contigo o sin ti. Te cuesta sueño y dinero.":
			"Живет ночью, с тобой или без тебя. Стоит тебе сна и денег.",
		"Te quiere arriba, y te pasa la factura por subir.":
			"Хочет видеть тебя на вершине — и выставляет счет за подъем.",
		"Te quiere entero, y cada foto tuya con otra le cuesta una noche.":
			"Ей нужен ты весь, и каждое твое фото с другой стоит ей бессонной ночи.",
		"No te necesita: te eligió. Nunca acepta tu dinero.":
			"Ты ей не нужен: она тебя выбрала. Никогда не берет твоих денег.",
		"Iba al estadio antes que tú. Los domingos son sagrados.":
			"Ходила на стадион раньше тебя. Воскресенья — святое.",
		"Odia la prensa. En privado lo da todo.":
			"Ненавидит прессу. Наедине отдает все.",
		"No te quiere. Cuando le salgan las cuentas, se va con lo tuyo; con papel, tarda más y se lleva menos.":
			"Она тебя не любит. Когда расчет сойдется, уйдет с твоими деньгами; с брачным договором ждет дольше и забирает меньше.",
		"Entiende el oficio. Entrena, viaja y aguanta contigo.":
			"Понимает это ремесло. Тренируется, ездит и терпит вместе с тобой.",
		"Tiene más que tú y no te lo dice. Te regala dinero cada jornada y paga la boda.":
			"У нее больше, чем у тебя, и она об этом молчит. Каждый тур дарит тебе деньги и оплачивает свадьбу.",



		"Tu agente lo dice sin mirarte: «firma la separación de"
		+ " bienes».":
			"Твой агент говорит это, не глядя на тебя: «подпиши брачный договор».",
		"La boda cuesta ${0}.":
			"Свадьба стоит ${0}.",
		"FIRMAR EL PRENUPCIAL":
			"ПОДПИСАТЬ ДОГОВОР",
		"CASARSE SIN PAPELES":
			"БЕЗ ДОГОВОРА",
		"Firmó sin leerlo y no volvió a mencionarlo en toda la noche.":
			"Она подписала не читая и за весь вечер больше об этом не вспомнила.",
		"Rompiste el papel delante de ella. Ese gesto lo va a"
		+ " recordar.":
			"Ты порвал бумагу у нее на глазах. Этот жест она запомнит.",
		"Boda pagada: ${0}.":
			"Свадьба оплачена: ${0}.",
		"Piden ${0}: ${1} de tu dinero y ${2} de lo que tienes"
		+ " puesto.":
			"Требуют ${0}: ${1} из твоих денег и ${2} из того, чем ты владеешь.",
		"Con separación de bienes firmada":
			"С подписанным брачным договором",
		"Sin separación de bienes: entra todo":
			"Без брачного договора: на кону все",
		"FIRMAR Y ACABAR":
			"ПОДПИСАТЬ, И ВСЕ",
		"PELEAR LA CIFRA":
			"СПОРИТЬ О СУММЕ",
		"IR A JUICIO":
			"В СУД",
		"Su abogado tarda dos días en contestar. Baja un poco, y"
		+ " poco.":
			"Ее адвокат отвечает только через два дня. Немного уступает — совсем немного.",
		"El juez no le dio todo lo que pedía. Te llevas ${0} menos.":
			"Судья не дал ей всего, что она просила. Ты сохраняешь на ${0} больше.",
		"El juez no le dio lo que pedía. Tampoco había mucho que repartir.": "Судья не дал ей того, что она просила. Да и делить было особо нечего.",
		"Salió peor que el acuerdo. Los abogados también se cobran.":
			"Вышло хуже, чем по соглашению. Адвокаты тоже берут свое.",
		"Firmaste sin leerlo entero. Se acabó.":
			"Ты подписал, не дочитав. Все кончено.",
		"Se lleva ${0}. Te quedan ${1}.":
			"Она забирает ${0}. У тебя остается ${1}.",

		"Reservaste sin decirle por qué, y {0} bajó vestida para algo que no sabe qué"
		+ " es. El anillo lleva un mes pagado y lo llevas encima.":
			"Ты заказал столик, не сказав зачем, и {0} спустилась нарядной, сама не зная к чему. Кольцо оплачено месяц назад, и оно у тебя в кармане.",
		"PEDÍRSELO ESTA NOCHE":
			"СДЕЛАТЬ ПРЕДЛОЖЕНИЕ",
		"LO QUE FIRMÁIS":
			"ВАШ ДОГОВОР",
		"Tu agente lleva tres días pidiendo veinte minutos. Trae una carpeta y no la ha"
		+ " abierto delante de nadie.":
			"Твой агент уже три дня просит двадцать минут. У него папка, которую он ни при ком не открывал.",
		"ESCUCHARLE":
			"ВЫСЛУШАТЬ",
		"NO HAY NADA QUE FIRMAR":
			"НЕЧЕГО ПОДПИСЫВАТЬ",

		"UN FAVOR PARA SU HERMANO":
			"УСЛУГА ЕЕ БРАТУ",
		"El hermano de {0} tiene un negocio que va a salir seguro y le falta el"
		+ " arranque. Ella no lo pide para ella, y eso es justo lo que hace difícil decir"
		+ " que no.":
			"{0} просит за брата: у него верное дело, не хватает только денег на старт. Она просит не для себя — и именно поэтому так трудно отказать.",
		"ADELANTARLE EL DINERO":
			"ОДОЛЖИТЬ ДЕНЬГИ",
		"QUE LO PIDA AL BANCO":
			"ПУСТЬ ИДЕТ В БАНК",
		"Tranquila, cariñosa y sin dramas. Nunca te pide explicaciones.":
			"Спокойная, ласковая и без драм. Никогда не требует от тебя объяснений.",
		"Su abogado no negocia. Pone dos papeles sobre la mesa y te dice que firmes"
		+ " uno.":
			"Ее адвокат не торгуется. Кладет на стол две бумаги и говорит подписать одну.",
		"No hay tercera opción, y él lo sabe desde el día que os conocisteis.":
			"Третьего варианта нет, и он знал это с того дня, как вы познакомились.",
		"No hay tercera opción.":
			"Третьего варианта нет.",
		"Se fue con una maleta y dejó el resto. Su abogado llamará el lunes.": "Она ушла с одним чемоданом и оставила все остальное. Ее адвокат позвонит в понедельник.",
		"Todavía estáis casados. Eso se firma, no se dice.": "Вы все еще женаты. Это подписывают, а не говорят.",
		"La separación de bienes que firmasteis recorta las dos.": "Брачный договор, который вы подписали, урезает обе суммы.",
		"PAGAR Y QUEDÁRTELA · ${0}": "ВЫКУПИТЬ · ${0}",
		"Pagaste por tu propia casa. El papel valió justo eso.": "Ты заплатил за собственный дом. Ровно столько и стоила та бумага.",
		"${0}, y las llaves siguen siendo tuyas.": "${0}, а ключи по-прежнему у тебя.",
		"Firmaste el otro. Cinco años pagando lo que ya no está en tu cuenta.": "Ты подписал другую. Пять лет платить за то, чего уже нет на твоем счету.",
		"Con ella no hay reparto que negociar: su abogado te hará elegir entre la casa y cinco temporadas de tu ficha.": "С ней нечего делить по договоренности: ее адвокат заставит тебя выбрать между домом и пятью сезонами твоей зарплаты.",
		"Eliges tú, y se elige esta semana.": "Выбираешь ты, и выбрать нужно на этой неделе.",
		"SU ABOGADO YA LLAMÓ": "ЗВОНИЛ ЕЕ АДВОКАТ",
		"LA CASA · ${0}":
			"ДОМ · ${0}",
				"{0} DE TU FICHA · ${1} POR PARTIDO · {2} TEMPORADAS":
			"{0} ЗАРПЛАТЫ · ${1} ЗА МАТЧ · {2} СЕЗ.",
		"Con ella este papel es una acusación.":
			"С ней эта бумага звучит как обвинение.",
		"A ella el dinero le da igual.":
			"Ей деньги безразличны.",
		"LA CASA":
			"ДОМ",
		"EL {0}% DE TU FICHA · {1} TEMPORADAS":
			"{0}% ЗАРПЛАТЫ · {1} СЕЗ.",
		"La casa que tienes vale ${0}. La ficha, ${1} por partido.":
			"Твой дом стоит ${0}. Зарплата — ${1} за матч.",
		"Recogiste en dos cajas. La vitrina se quedó donde estaba.":
			"Ты собрал вещи в две коробки. Витрина трофеев осталась на месте.",
		"La casa es suya, y todo lo que le metiste dentro.":
			"Дом теперь ее — и все, что ты в него вложил.",
		"Firmaste el otro. Cinco años de que cada partido rinda la mitad.":
			"Ты подписал другую. Пять лет каждый матч будет приносить вдвое меньше.",
		"${0} por partido, y sube si tú subes.":
			"${0} за матч — и растет, когда растешь ты.",
		"A ella el dinero le da igual: firmar apenas le va a doler.":
			"Ей деньги безразличны: подпись ее почти не заденет.",
		"Con ella este papel es una acusación. Y es de quien más te protege.":
			"С ней эта бумага звучит как обвинение. И защищает она тебя больше всего именно от нее.",
		"Le va a doler más de lo que va a decir.":
			"Ей будет больнее, чем она покажет.",

		"Va a vibrar tres veces. Contestar es perderla a ella.":
			"Телефон завибрирует три раза. Ответить — значит потерять ее.",
		"Aguantados sin mirar: {0} de {1}":
			"Выдержал, не глядя: {0} из {1}",
		"Ella se calla y espera a que termines. Se le fue lo que iba a decir.":
			"Она замолкает и ждет, пока ты закончишь. То, что она хотела сказать, ушло.",
		"No te contó nada. Estabas en otra cosa.":
			"Она так ничего и не рассказала. Ты был мыслями где-то еще.",
		"CONTESTAR":
			"ОТВЕТИТЬ",
		"GUARDAR EL TELÉFONO":
			"УБРАТЬ ТЕЛЕФОН",
		"PEDÍRSELO":
			"ПРЕДЛОЖИТЬ",
		"Lleváis dos temporadas viviendo juntos y el anillo está"
		+ " pagado desde hace un mes. Tu agente quiere hablar contigo"
		+ " antes de que se lo pidas.":
			"Вы уже два сезона живете вместе, а кольцо оплачено месяц назад. Твой агент хочет поговорить с тобой до того, как ты сделаешь ей предложение.",
		"HABLAR CON ÉL":
			"ВЫСЛУШАТЬ",
		"¿LOS TIRAS TÚ?":
			"БУДЕШЬ БИТЬ САМ?",
		"{0} ha fallado dos penales este año y en el vestuario nadie dice nada. Llevas el brazalete: el siguiente lo decides tú.":
			"{0} в этом году не забил два пенальти, а в раздевалке все молчат. Капитанская повязка у тебя: следующий решаешь ты.",
		"LOS COBRO YO":
			"Я БУДУ БИТЬ",
		"SIGUE ÉL":
			"БЬЕТ ОН",
		"EL PUESTO QUE QUERÍAS":
			"ЖЕЛАННАЯ ПОЗИЦИЯ",
		"Tres años seguidos siendo el goleador del equipo desde donde no querías jugar. El técnico te para en el pasillo: el {0} es tuyo si lo quieres.":
			"Три года подряд ты лучший бомбардир команды — с позиции, на которой никогда не хотел играть. Тренер останавливает тебя в коридоре: позиция {0} твоя, если хочешь.",
		"ES MÍO":
			"ОНА МОЯ",
		"ME QUEDO DONDE ESTOY":
			"ОСТАНУСЬ, ГДЕ ЕСТЬ",
		"EL RIVAL DE LA DÉCADA":
			"СОПЕРНИК ДЕСЯТИЛЕТИЯ",
		"SE LLEVA TU LIGA OTRA VEZ":
			"СНОВА ЗАБИРАЕТ ТВОЮ ЛИГУ",
		"LIGAS SEGUIDAS DE ELLOS":
			"ИХ ТИТУЛЫ ПОДРЯД",
		"sus ligas":
			"их титулы",
		"las tuyas":
			"твои",
		"sus goles contra ti":
			"его голы против тебя",
		"Tres años viéndolos levantar la liga que querías. No abre la boca: la cifra habla por él, y dice que el año que viene vuelve.":
			"Три года ты смотришь, как они поднимают трофей лиги, о котором мечтал ты. Он молчит: за него говорит цифра, и она говорит, что в следующем году он вернется.",
		"EL SELECCIONADOR SE ACUERDA":
			"ТРЕНЕР СБОРНОЙ ВСПОМНИЛ",
		"TU PRIMERA CONVOCATORIA, TARDE":
			"ПЕРВЫЙ ВЫЗОВ, НО ПОЗДНО",
		"TEMPORADAS SIN LLAMARTE":
			"СЕЗОНЫ БЕЗ ВЫЗОВА",
		"goles de liga":
			"голы в лиге",
		"años sin llamada":
			"годы без вызова",
		"edad":
			"возраст",
		"Dos temporadas de goleador en primera y el teléfono sin sonar. Hoy viene en persona: no pide perdón, pero te mira a los ojos.":
			"Два сезона ты лучший бомбардир высшей лиги, а телефон молчал. Сегодня он приходит сам: не извиняется, но смотрит тебе в глаза.",
		"EL PRESIDENTE TE PIDE QUEDARTE":
			"ПРЕЗИДЕНТ ПРОСИТ ОСТАТЬСЯ",
		"HAN PAGADO TU CLÁUSULA":
			"ТВОИ ОТСТУПНЫЕ ВЫПЛАЧЕНЫ",
		"TEMPORADAS EN EL CLUB":
			"СЕЗОНЫ В КЛУБЕ",
		"la cláusula":
			"отступные",
		"balones de oro":
			"награды «Игрок года»",
		"Baja al césped sin prensa ni cámaras. No puede retener a quien paga la cláusula, y lo sabe: sólo viene a pedírtelo. La oferta sigue en MERCADO.":
			"Он спускается на газон без прессы и камер. Удержать того, за кого заплатили отступные, он не может и знает это: он пришел только попросить. Предложение все еще в разделе РЫНОК.",
		"OTRO AÑO":
			"ЕЩЕ ГОД",
		"SU ABOGADO HA LLAMADO":
			"ЗВОНИЛ ЕЕ АДВОКАТ",
		"No fue una discusión ni una noche mala: fue una carta. {0}"
		+ " quiere el divorcio, y su abogado ya ha puesto una cifra"
		+ " encima de la mesa.":
			"Это была не ссора и не плохая ночь, а письмо. {0} хочет развода, и ее адвокат уже назвал сумму.",
		"VER LA CIFRA":
			"УВИДЕТЬ СУММУ",
		"NO ABRIR ESA CARTA":
			"НЕ ОТКРЫВАТЬ ПИСЬМО",




		"Deja el teléfono boca abajo y escúchala.":
			"Положи телефон экраном вниз и слушай ее.",
		"Si vibra, no pasa nada. Es no tocarlo.":
			"Если завибрирует — ничего страшного. Главное — не трогать.",
		"Avisos ignorados: {0} de {1}":
			"Уведомлений пропущено: {0} из {1}",
		"Ella se calla y espera a que termines.":
			"Она замолкает и ждет, пока ты закончишь.",
		"No miraste el teléfono ni una vez. Ella lo notó.":
			"Ты ни разу не взглянул на телефон. Она это заметила.",
		"Contestaste alguna. La noche se salvó a medias.":
			"Ты ответил на пару звонков. Вечер спасен наполовину.",
		"Contestaste todas. Pidió la cuenta antes del postre.":
			"Ты ответил на все. Она попросила счет еще до десерта.",
		"Pregunta {0} de {1}":
			"Вопрос {0} из {1}",
		"Te acordabas de todo. No se lo esperaba.":
			"Ты все запомнил. Такого она не ожидала.",
		"Casi todo. Se rió del que fallaste.":
			"Почти все. Над тем, что ты забыл, она посмеялась.",
		"Uno de tres. «¿Me estabas escuchando?»":
			"Один из трех. «Ты меня вообще слушал?»",
		"Ni uno. Esa noche no la escuchaste.":
			"Ни одного. В тот вечер ты ее не слушал.",
		"Aciertos: {0} de {1}":
			"Верно: {0} из {1}",
		"Ronda {0} de {1}":
			"Раунд {0} из {1}",
		"DECIRLO AHORA":
			"СКАЗАТЬ",
		"Dijiste lo justo y cuando tocaba. Te presentó a los suyos.":
			"Ты сказал ровно то, что нужно, и вовремя. Она познакомила тебя со своими друзьями.",
		"Alguna la acertaste. Al salir te tomó del brazo.":
			"Пару раз ты угадал момент. На выходе она взяла тебя под руку.",
		"Hablaste siempre a destiempo. Salisteis pronto.":
			"Ты все время говорил невпопад. Вы ушли рано.",
		"Quiere el {0} de tu sueldo, todos los meses.":
			"Она хочет {0} твоей зарплаты каждый месяц.",
		"Serían ${0} por partido.":
			"Это ${0} за матч.",
		"NO OFRECERLE NADA":
			"НИЧЕГО НЕ ДАВАТЬ",
		"OFRECERLE LA MITAD":
			"ДАТЬ ПОЛОВИНУ",
		"OFRECERLE CASI TODO":
			"ДАТЬ ПОЧТИ ВСЕ",
		"DARLE LO QUE PIDE":
			"ДАТЬ, СКОЛЬКО ПРОСИТ",
		"«¿{0}? No me hagas esto.» Baja al {1}.":
			"«{0}? Не поступай так со мной.» Она снижает до {1}.",
		"Trato hecho: el {0} de tu sueldo, cada partido.":
			"Договорились: {0} твоей зарплаты каждый матч.",
		"Sube tu mantenimiento en ${0} por partido.":
			"Твои расходы растут на ${0} за матч.",
		"Se levantó de la mesa sin acabar la frase.":
			"Она встала из-за стола, не договорив.",
		"Esto no queda así.":
			"Это еще не конец.",
		"Creció en un pueblo de la costa":
			"Выросла в приморском поселке",
		"Creció en un barrio del norte":
			"Выросла в северном районе",
		"Se crió en el campo, lejos de todo":
			"Выросла в деревне, вдали от всего",
		"Es de una ciudad de montaña":
			"Она из горного городка",
		"Cambió de casa cada dos años":
			"Переезжала каждые два года",
		"Nunca ha salido de esta ciudad":
			"Никогда не уезжала из этого города",
		"Vivió un tiempo en el extranjero":
			"Какое-то время жила за границей",
		"Es del mismo barrio que tú":
			"Она из того же района, что и ты",
		"No soporta que le hablen de fútbol":
			"Терпеть не может разговоров о футболе",
		"No soporta la gente que llega tarde":
			"Терпеть не может, когда опаздывают",
		"No soporta las fotos sin avisar":
			"Терпеть не может, когда фотографируют без предупреждения",
		"No soporta el ruido de los sitios de moda":
			"Терпеть не может шума модных мест",
		"No soporta que le mientan por educación":
			"Терпеть не может вежливой лжи",
		"No soporta madrugar":
			"Терпеть не может рано вставать",
		"No soporta que le pidan permiso para todo":
			"Терпеть не может, когда на все спрашивают разрешения",
		"No soporta el mar":
			"Терпеть не может море",
		"Pidió pescado y no se lo acabó":
			"Заказала рыбу и не доела",
		"Pidió lo mismo que tú":
			"Заказала то же, что и ты",
		"Pidió sólo postre":
			"Заказала только десерт",
		"Pidió el plato más raro de la carta":
			"Заказала самое странное блюдо в меню",
		"No pidió nada, dijo que no tenía hambre":
			"Ничего не заказала, сказала, что не голодна",
		"Pidió carne muy hecha":
			"Заказала хорошо прожаренное мясо",
		"Pidió que eligieras tú":
			"Попросила, чтобы выбрал ты",
		"Pidió la sopa del día":
			"Заказала суп дня",
		"Ella habla con gente que no conoces. Espera el hueco.":
			"Она разговаривает с людьми, которых ты не знаешь. Дождись паузы.",
		"Alguien pregunta a qué te dedicas. No es el momento de"
		+ " decirlo.":
			"Кто-то спрашивает, чем ты занимаешься. Сейчас не время говорить.",
		"Se gira hacia ti. Ahora sí.":
			"Она поворачивается к тебе. Вот теперь пора.",
		"¿De dónde te dijo que era?":
			"Откуда, по ее словам, она родом?",
		"¿Qué te dijo que no soporta?":
			"Что, по ее словам, она терпеть не может?",
		"¿Qué pidió aquella noche?":
			"Что она заказала в тот вечер?",
		"LA PRIMERA CENA":
			"ПЕРВЫЙ УЖИН",
		"Mesa para dos y el teléfono boca abajo. Esta noche va de"
		+ " escucharla — y de que no te pillen mirando la pantalla.":
			"Столик на двоих и телефон экраном вниз. Сегодня главное — слушать ее и не попасться, глядя в экран.",
		"ESTA SEMANA NO":
			"НЕ СЕЙЧАС",
		"LO QUE TE CONTÓ":
			"ЕЕ РАССКАЗЫ",
		"Una copa y la conversación de la otra noche encima de la"
		+ " mesa. Vas a tener que acordarte de lo que te dijo.":
			"Бокал вина, и тот разговор снова на столе. Тебе придется вспомнить, что она тебе рассказывала.",
		"LA INAUGURACIÓN DE ELLA":
			"ЕЕ ВЕРНИСАЖ",
		"Te lleva a una exposición donde no conoces a nadie. Aquí no"
		+ " se trata de entender los cuadros: se trata de saber cuándo"
		+ " hablar.":
			"Она ведет тебя на выставку, где ты никого не знаешь. Дело не в том, чтобы понимать картины, а в том, чтобы знать, когда говорить.",
		"HABLEMOS DE DINERO":
			"ПОГОВОРИМ О ДЕНЬГАХ",
		"{0} ha esperado a que acabe la cena para decirlo, y lo dice"
		+ " sin rodeos: quiere una cantidad fija todos los meses, o esto"
		+ " no tiene sentido.":
			"{0} дождалась конца ужина, чтобы сказать это, и говорит прямо: она хочет фиксированную сумму каждый месяц — иначе во всем этом нет смысла.",
		"HABLARLO":
			"ОБСУДИТЬ",
		"NO PIENSO DISCUTIR ESO":
			"НЕ БУДУ ЭТО ОБСУЖДАТЬ",


		"PRÓRROGA": "ДОП. ВРЕМЯ",
		"DESCANSO · FINAL": "ПЕРЕРЫВ · ФИНАЛ",
		"DESCANSO · DERBI": "ПЕРЕРЫВ · ДЕРБИ",
		"SEGUNDO TIEMPO EXTRA": "ВТОРОЙ ДОП. ТАЙМ",
		"SI NADIE MARCA, PENALTIS": "БЕЗ ГОЛОВ — ПЕНАЛЬТИ",
		"QUINCE MINUTOS PARA AGUANTAR": "ПЯТНАДЦАТЬ МИНУТ ВЫСТОЯТЬ",
		"QUINCE MINUTOS PARA REMONTAR": "ПЯТНАДЦАТЬ МИНУТ ОТЫГРАТЬСЯ",
		"SI ACABA ASÍ: PRÓRROGA": "ЕСЛИ ТАК: ДОП. ВРЕМЯ",
		"SI ACABA ASÍ: CAMPEONES": "ЕСЛИ ТАК: ЧЕМПИОНЫ",
		"SI ACABA ASÍ: SUBCAMPEONES": "ЕСЛИ ТАК: СЕРЕБРО",
		"SI ACABA ASÍ: PASÁIS": "ЕСЛИ ТАК: ПРОХОДИМ",
		"SI ACABA ASÍ: FUERA": "ЕСЛИ ТАК: ВЫЛЕТАЕМ",
		"GLOBAL {0}-{1} · PRÓRROGA": "СУММА {0}-{1} · ДОП. ВРЕМЯ",
		"GLOBAL {0}-{1} · PASÁIS": "СУММА {0}-{1} · ПРОХОДИМ",
		"GLOBAL {0}-{1} · FUERA": "СУММА {0}-{1} · ВЫЛЕТ",
		"10 CONTRA 11": "10 ПРОТИВ 11",
		"11 CONTRA 10": "11 ПРОТИВ 10",
		"LÍDER": "ЛИДЕР",
		"EN ASCENSO": "ПОВЫШЕНИЕ",
		"EN DESCENSO": "ЗОНА ВЫЛЕТА",
		"IGUALADO CON EL LÍDER": "ВРОВЕНЬ С ЛИДЕРОМ",
		"IGUALADO CON EL ASCENSO": "НА ГРАНИ ПОВЫШЕНИЯ",
		"IGUALADO CON EL DESCENSO": "НА ГРАНИ ВЫЛЕТА",
		"A {0} PTS DEL LÍDER": "{0} ОЧК. ДО ЛИДЕРА",
		"A {0} PTS DEL ASCENSO": "{0} ОЧК. ДО ПОВЫШЕНИЯ",
		"A {0} PTS DEL DESCENSO": "{0} ОЧК. ОТ ЗОНЫ ВЫЛЕТА",
		"ÚLTIMA JORNADA": "ПОСЛЕДНИЙ ТУР",
		"El míster se ha ido a por {0} delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"{0} попал под раздачу: тренер отчитал его при всей раздевалке. Никто не поднимает глаз от пола. Ты сидишь рядом с ним.",
		"Lo has dicho delante de todos. El míster no lo olvidará, y {0} tampoco.":
			"Ты сказал это при всех. Тренер этого не забудет, и {0} тоже.",
		"Te has callado. {0} se ha dado cuenta.": "Ты промолчал. {0} это заметил.",
		"{0}, nos has dejado con diez. Hoy no me hables.": "{0}, ты оставил нас вдесятером. Сегодня со мной не разговаривай.",
		"{0}, {1} goles. ¿Vas a parar alguno en la segunda?":
			"{0}, пропущено: {1}. Во втором тайме хоть один отразишь?",
		"LA HA TOMADO CON ÉL": "ПОД РАЗДАЧЕЙ",
		"El míster se ha ido a por un compañero delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"Тренер отчитал партнера по команде при всей раздевалке. Никто не поднимает глаз от пола. Ты сидишь рядом с ним.",
		"DAR LA CARA POR ÉL": "ЗАСТУПИТЬСЯ",
		"QUEDARTE CALLADO": "ПРОМОЛЧАТЬ",

		"PREGUNTA DE VESTUARIO": "ВОПРОС В РАЗДЕВАЛКЕ",
		"En el banco, alguien saca el móvil y lanza una pregunta a todo el vestuario.": "На скамейке кто-то достает телефон и задает вопрос всей раздевалке.",
		"¿De dónde llegó {0} a {1}?": "Откуда {0} перешел в клуб {1}?",
		"ACIERTA Y SUMAS +{0} DE ENERGÍA AL PITIDO": "ОТВЕТЬ ВЕРНО — +{0} ЭНЕРГИИ К КОНЦУ МАТЧА",
		"¡Exacto! Llegó de {0}. +{1} de energía al pitido.": "Точно! Его прежний клуб — {0}. +{1} энергии к концу матча.",
		"No. Llegó de {0}.": "Нет. Его прежний клуб — {0}.",
		"Esto no es lo que somos. Tú tira del carro y los demás irán detrás.":
			"Это не мы. Тащи команду за собой, и остальные пойдут следом.",
		"Nos hemos salido del plan. Volved a lo de siempre y el resto llegará.":
			"Мы ушли от плана. Вернитесь к привычной игре, и остальное придет.",
		"Me dais vergüenza. A todos. Esa camiseta no se regala así.":
			"Мне стыдно за вас. За всех. Так эту футболку не позорят.",
		"Ya está. Que por lo menos no sea peor.": "Все кончено. Хотя бы не делайте еще хуже.",
		"Tú no eres éste. Te conozco: sal y demuéstramelo.":
			"Это не ты. Я тебя знаю: выйди и докажи.",
		"Haz lo sencillo. Lo que te ha traído hasta aquí, nada más.":
			"Играй просто. То, что привело тебя сюда, — и ничего больше.",
		"Así no. Si en diez minutos sigues igual, te cambio.":
			"Не так. Если через десять минут будет то же самое — заменю.",
		"Lo que esperaba de ti. Ni más ni menos.": "То, чего я от тебя ждал. Ни больше ни меньше.",
		"Un gol no es nada. Dádsela a él, que sabe qué hacer con ella.":
			"Один гол — это ничто. Давайте мяч ему, он знает, что с ним делать.",
		"Vamos bien aunque no lo parezca. Mismo plan, y el gol llegará.":
			"Мы играем лучше, чем кажется. Тот же план, и гол придет.",
		"Uno abajo y nadie se ha manchado la camiseta. Quiero verlo en la segunda.":
			"Уступаем гол, а футболку никто даже не испачкал. Во втором тайме хочу это видеть.",
		"Un gol abajo. Haré cambios.": "Уступаем гол. Будут замены.",
		"Cero a cero. La próxima que tengas, adentro. Confío en ti.":
			"Ноль-ноль. Следующий момент — забивай. Я в тебя верю.",
		"Cero a cero, como estaba pensado. Paciencia, que el gol viene solo.":
			"Ноль-ноль, как и задумано. Терпение, гол придет сам.",
		"Cero a cero y nadie ha probado al portero. Eso se acabó.":
			"Ноль-ноль, и никто даже не проверил вратаря. С этим покончено.",
		"Cero a cero. Seguid así y ya veremos.": "Ноль-ноль. Продолжайте так, а там посмотрим.",
		"Empate. Marca tú la diferencia, que para eso te traje.":
			"Ничья. Реши исход — для этого я тебя и подписал.",
		"Empate. No cambiéis nada: si seguimos así, el partido es nuestro.":
			"Ничья. Ничего не меняйте: если так пойдет, матч наш.",
		"Un empate no me vale. Quiero más de todos, y de ti el primero.":
			"Ничья меня не устраивает. Хочу больше от всех, и от тебя в первую очередь.",
		"Empate. Algo tocaremos.": "Ничья. Кое-что поменяем.",
		"Bien. Seguid buscándole, que el segundo lo lleva en las botas.":
			"Хорошо. Продолжайте искать его — второй гол у него в бутсах.",
		"Ganamos haciendo lo nuestro. Seguid igual.": "Выигрываем, играя в свой футбол. Продолжайте так же.",
		"Uno a cero no es nada. No quiero ver ni un paso atrás.":
			"Один-ноль — это ничто. Ни шагу назад.",
		"Ganamos. No toquéis nada.": "Выигрываем. Ничего не трогайте.",
		"Esto es lo que sois. Disfrutadlo, pero sin regalar nada.":
			"Вот на что вы способны. Наслаждайтесь, но ничего не отдавайте.",
		"El plan funciona. Cuarenta y cinco minutos más de lo mismo.":
			"План работает. Еще сорок пять минут того же.",
		"Bien. Y ahora no quiero ver a nadie relajándose. A nadie.":
			"Хорошо. А теперь чтобы никто не расслаблялся. Никто.",
		"Está hecho. Aprovecharé para mover el banquillo.": "Дело сделано. Дам побегать запасным.",
		"{0} no vuelve. Los demás, a correr también por él.":
			"{0} не вернется. Остальные — бегайте и за него.",
		"Nos lo han metido en el peor minuto. Olvidadlo ya, o nos come la segunda.":
			"Пропустили в самый неудачный момент. Забудьте об этом сейчас же, иначе второй тайм нас съест.",
		"Íbamos perdiendo y lo habéis levantado. Eso no os lo regala nadie.":
			"Мы проигрывали, и вы перевернули игру. Такое никто не подарит.",
		"Íbamos ganando y lo hemos regalado. Eso no vuelve a pasar.":
			"Мы выигрывали и все отдали. Больше такого не будет.",
		"El gol en el mejor momento. Ahora están tocados: a por el siguiente.":
			"Гол в самый лучший момент. Они поплыли: вперед за следующим.",
		"Con diez. Cada uno corre por dos, y sin una queja.":
			"Вдесятером. Каждый бежит за двоих, и без жалоб.",
		"Tienen uno menos. Que lo noten sus piernas, no las nuestras.":
			"У них на одного меньше. Пусть это почувствуют их ноги, а не наши.",
		"Si llegamos a los penaltis, quiero once que se tengan en pie.":
			"Если дойдет до пенальти, мне нужны одиннадцать человек на ногах.",
		"Quince minutos. Aguantadlos como si fueran noventa.":
			"Пятнадцать минут. Держитесь, как будто это девяносто.",
		"Quince minutos para darle la vuelta. Lo que os quede, ahí fuera.":
			"Пятнадцать минут, чтобы все перевернуть. Выложитесь там до конца.",
		"Así, prórroga. Y nadie quiere prórroga.": "При таком счете — дополнительное время. А его никто не хочет.",
		"Ahora mismo pasamos. Que no se os note que lo sabéis.":
			"Сейчас мы проходим. Не показывайте, что вы это знаете.",
		"Ahora mismo estamos fuera. Cuarenta y cinco minutos para cambiarlo.":
			"Сейчас мы вылетаем. Сорок пять минут, чтобы это изменить.",
		"Una final no se juega: se gana. El que se esconda, al banquillo.":
			"Финал не играют — его выигрывают. Кто спрячется, сядет на скамейку.",
		"Cuarenta y cinco minutos entre vosotros y la copa. Ni uno menos.":
			"Сорок пять минут между вами и кубком. Ни минутой меньше.",
		"Nadie se acuerda de los subcampeones. Nadie. Salid a por ella.":
			"Вторых никто не помнит. Никто. Идите и заберите кубок.",
		"¿Los oís? Pues que sea lo último que cantan hoy.": "Слышите их? Пусть это будет последняя песня, которую они сегодня споют.",
		"Esto no es un partido más y lo sabéis. Hoy no se pierde.":
			"Это не просто очередной матч, и вы это знаете. Сегодня проигрывать нельзя.",
		"Media ciudad está callada ahora mismo. Que siga así.":
			"Полгорода сейчас молчит. Пусть так и останется.",
		"Así acabado, la tabla se nos pone cuesta arriba. Hay que darle la vuelta.":
			"Если так закончится, в таблице нам придется тяжело. Надо все переломить.",
		"Un punto aquí no arregla nada. Quedan pocos partidos y éste es uno.":
			"Очко здесь ничего не решает. Матчей осталось мало, и этот — один из них.",
		"Si esto acaba así, la tabla se mueve a nuestro favor. No lo tiréis.":
			"Если так закончится, таблица сдвинется в нашу пользу. Не упустите.",


		"NO SALES": "ЗАМЕНЕН",
		"Le metiste un balonazo a tu propio banquillo. No hacía falta nada más.":
			"Ты запулил мячом в собственную скамейку. Больше ничего не требовалось.",
		"{0} ocasiones tiradas antes del descanso. Ya lo había decidido en la tercera.":
			"Упущено моментов до перерыва: {0}. Я все решил еще на третьем.",
		"Cuarenta y cinco minutos y no te he visto. Hoy se acabó aquí.":
			"Сорок пять минут — и я тебя не видел. На сегодня все.",



		"VAS POR DELANTE": "ВЫ ВЕДЕТЕ",
		"VAS POR DETRÁS": "ВЫ УСТУПАЕТЕ",
		"TODO IGUAL": "НИЧЬЯ",
		"SEGUNDA PARTE": "ВТОРОЙ ТАЙМ",

		"No la tenías: en el túnel cuesta el triple.":
			"У тебя ее не было: в туннеле она стоит втрое дороже.",
		"energía": "энергия",
		"tus minutos": "твои минуты",
		"Te están pasando por encima. Esto no se arregla solo en la segunda.":
			"Вас просто сносят. Во втором тайме само это не исправится.",
		"Desde la banca también se juega. Cuando te toque, no preguntes.":
			"Со скамейки тоже играют. Когда придет твой черед — не переспрашивай.",
		"A ti no te he visto. O apareces en la segunda, o te sientas.":
			"Тебя на поле я не видел. Либо проявишь себя во втором тайме, либо сядешь.",
		"Vas fundido. Piensa bien dónde gastas lo que te queda.":
			"Ты выжат. Хорошенько подумай, на что потратить остаток сил.",
		"Un gol. Sólo eso os separa, y quedan cuarenta y cinco minutos.":
			"Один гол. Только он вас и разделяет, а впереди еще сорок пять минут.",
		"Cero a cero. Esto lo gana el primero que acierte.":
			"Ноль-ноль. Выиграет тот, кто первым попадет.",
		"Empate. El que se canse primero, pierde.": "Ничья. Кто первым устанет, тот и проиграет.",
		"Un gol no es nada. Salid como si fuerais perdiendo.":
			"Один гол — это ничто. Выходите так, будто проигрываете.",
		"Bien. Ahora lo difícil: no regalar lo que ya es vuestro.":
			"Хорошо. Теперь самое трудное: не отдать то, что уже ваше.",

		"EL BALÓN ES TUYO": "МЯЧ ТВОЙ",
		"EL BALÓN ES DE LOS DOS": "МЯЧ НА ДВОИХ",
		"UN BALÓN PARA CADA UNO": "ПО МЯЧУ КАЖДОМУ",
		"PASES TUYOS, GOLES DE {0}": "ТВОИ ПАСЫ, ЗАБИВАЛ {0}",
		"GOLES ENTRE LOS DOS": "ГОЛЫ НА ДВОИХ",
		"Te lo dio a ti. Sabe de dónde salieron.": "Он отдал его тебе. Он знает, откуда они взялись.",
		"{0} tuyos, {1} suyos. Cada uno con el suyo.": "Твоих: {0}, его: {1}. У каждого свой мяч.",
		"DOS HAT-TRICKS": "ДВА ХЕТ-ТРИКА",
		"GOLES EN UN PARTIDO": "ГОЛЫ В ОДНОМ МАТЧЕ",
		"Firmado por todos. Ya sabes dónde va.": "Подписан всей командой. Ты знаешь, где ему место.",
		"INTERCAMBIO": "ОБМЕН",
		"SU CAMISETA": "ЕГО ФУТБОЛКА",
		"La suya se queda contigo. La tuya se va con él.": "Его футболка остается у тебя. Твоя уходит с ним.",
		"TE PIDE LA CAMISETA": "ПРОСИТ ФУТБОЛКУ",
		"{0} te espera en el círculo con la suya ya enrollada en la mano. La grada todavía no se va, y desde arriba se ve todo.": "{0} ждет тебя в центральном круге, уже свернув свою футболку в руке. Трибуны еще не опустели, и сверху все видно.",
		"CAMBIARLA": "ОБМЕНЯТЬ",
		"DÁRSELA SIN PEDIR NADA": "ОТДАТЬ ПРОСТО ТАК",
		"NO SE CAMBIA": "МОЯ ОСТАЕТСЯ",
		"BALONES": "МЯЧИ",
		"PLAYERAS": "ФУТБОЛКИ",
		"VITRINA DE BALONES": "ВИТРИНА МЯЧЕЙ",






		"VITRINA TORRE": "ВИТРИНА-БАШНЯ",
		"VITRINA GALERÍA": "ВИТРИНА-ГАЛЕРЕЯ",
		"VITRINA DE PREMIOS": "ВИТРИНА НАГРАД",
		"Tres baldas en un metro: para el rincón que no da más.":
			"Три полки на одном метре — для угла, где больше ничего не помещается.",
		"Cuatro metros de mostrador para alinear el palmarés.":
			"Четыре метра стойки, чтобы выстроить в ряд все трофеи.",
		"Solo para lo tuyo: los galardones individuales.":
			"Только твое: личные награды.",
		"Sólo para lo tuyo: los galardones individuales.":
			"Только твое: личные награды.",
		"Cada balón, con el día y el rival al que se lo metiste.": "Каждый мяч — с датой и соперником, которому ты его забил.",
		"Los balones de tus hat-tricks y las camisetas que cambiaste.": "Мячи с твоих хет-триков и футболки, которыми ты обменялся.",
		"CAMBIO EN EL BANQUILLO": "СМЕНА ТРЕНЕРА",
		"EL NUEVO": "НОВЫЙ ШЕФ",
		"TÉCNICO NUEVO": "НОВЫЙ ТРЕНЕР",
		"Destituyen a {0}. {1}": "{0} уволен. {1}",
		"TE QUERÍA A TI": "ОН ХОТЕЛ ТЕБЯ",
		"Pidió tu nombre antes de firmar. Vienes de serie en su plan.": "Он назвал твое имя еще до подписания контракта. В его плане ты идешь в базовой комплектации.",
		"NO TOCA LO QUE FUNCIONA": "РАБОТАЕТ — НЕ ТРОГАЙ",
		"Ha visto los vídeos y no piensa cambiar lo que ya andaba.": "Он посмотрел видео и не собирается менять то, что уже работало.",
		"EMPEZAMOS DE CERO": "ВСЕ С НУЛЯ",
		"No te conoce de nada. Todo el mundo parte del mismo sitio.": "Он тебя совсем не знает. Все начинают с одной точки.",
		"TE LO VAS A GANAR": "ЗАСЛУЖИ МЕСТО",
		"Dice que aquí no hay intocables, y te mira a ti al decirlo.": "Он говорит, что неприкасаемых здесь нет, — и смотрит при этом на тебя.",
		"NO CUENTA CONTIGO": "ТЫ НЕ В ЕГО ПЛАНАХ",
		"Tiene otro plan, y en su pizarra tu nombre no aparece.": "У него другой план, и на его доске твоего имени нет.",

		"TÉCNICOS": "ТРЕНЕРЫ",
		"RANKING DE TÉCNICOS": "РЕЙТИНГ ТРЕНЕРОВ",
		"Los técnicos del mundo, ordenados por sus estrellas.": "Тренеры со всего мира, по числу звезд.",
		"Los trofeos cuentan desde la temporada {0}.": "Трофеи учитываются с сезона {0}.",
		"1ª DIVISIÓN": "ВЫСШАЯ ЛИГА",
		"EN EL PARO": "БЕЗ КЛУБА",
		"Nadie en esta lista todavía. Los que echan de su club pasan aquí hasta que otro los ficha.": "В этом списке пока никого. Тренеры, которых увольняют, попадают сюда, пока их не наймет другой клуб.",
		"TU TÉCNICO: {0}° DE {1}": "ТРЕНЕР: №{0} ИЗ {1}",
		"En el cargo desde la temporada {0}.": "На посту с сезона {0}.",
		"Sin títulos todavía.": "Пока без титулов.",

		"MÍSTER": "ТРЕНЕР",
		"2ª DIVISIÓN": "ВТОРАЯ ЛИГА",
		"técnico": "тренер",
		"técnicos": "тренеры",
		"técnico sin equipo": "тренер без клуба",
		"técnicos sin equipo": "тренеры без клуба",
		"seleccionador": "тренер сборной",
		"seleccionadores": "тренеры сборных",

		"cara de leyenda": "лицо легенды",
		"caras de leyenda": "лица легенд",
		"Palmarés real, más lo que ganen desde la temporada {0}.": "Реальные трофеи плюс все, что выиграют с сезона {0}.",
		"{0} destituye a {1}. Llega {2}.": "{0}: {1} уволен, приходит {2}.",

		"BALÓN AL ÁREA": "ИГРА ВЕРХОМ",
		"No quiere elaborar: quiere el balón arriba y gente rematando.": "Не хочет строить атаки: ему нужен мяч впереди и люди в штрафной.",
		"TOQUE Y PACIENCIA": "ПАС И ТЕРПЕНИЕ",
		"Prefiere diez pases a un balonazo. Aquí se juega con la cabeza.": "Десять пасов ему милее одного длинного заброса. Здесь играют с умом.",
		"PRESIÓN ALTA": "ПРЕССИНГ",
		"Noventa minutos corriendo. El que no llega, descansa.": "Девяносто минут бега. Кто не успевает — отдыхает.",
		"OFICIO": "ОПЫТ",
		"Once fijo y partido controlado. Aquí mandan los que ya saben.": "Стабильный состав и контроль над игрой. Здесь заправляют те, кто знает.",
		"DOBLE PIVOTE": "ДВА ОПОРНИКА",
		"Dos que barren, uno que piensa y uno arriba. Primero, no perder.": "Двое чистят, один думает и один впереди. Главное — не проиграть.",
		"ATAQUE TOTAL": "ВСЕ В АТАКУ",
		"Tres atrás y tres arriba. Si nos meten dos, metemos tres.": "Трое сзади и трое впереди. Пропустим два — забьем три.",
		"AUTOBÚS": "АВТОБУС",
		"Cinco atrás y a la contra. Un 1-0 es una goleada.": "Пятеро сзади и игра на контратаках. 1-0 — уже разгром.",
		"PIZARRA": "ТАКТИКА",
		"El {0} ya juega el {1} de {2}": "{0}: теперь стиль «{1}», его принес {2}",

		"ESPECIALISTA A BALÓN PARADO": "МАСТЕР СТАНДАРТОВ",
		"Ensaya el balón parado: si eres el lanzador, te llegan muchas más faltas, córners y penales.": "Отрабатывает стандарты: если бьешь ты, тебе достается гораздо больше штрафных, угловых и пенальти.",
		"EL CÓRNER ES UN PENAL": "УГЛОВОЙ КАК ПЕНАЛЬТИ",
		"Ensaya el córner: si eres el lanzador, sacas casi el doble de córners y tiras menos faltas.": "Отрабатывает угловые: если подаешь ты, угловых почти вдвое больше, а штрафных меньше.",
		"CONTRAGOLPE": "КОНТРАТАКА",
		"Cede el balón y sale a la carrera: más contras y menos posesión.": "Отдает мяч и убегает вперед: больше контратак и меньше владения.",
		"AL ÁREA, SIEMPRE": "ВСЕГДА В ШТРАФНУЮ",
		"Todo por las bandas: llueven centros al área y hay menos disparos desde fuera.": "Все через фланги: навесы в штрафную сыплются градом, а дальних ударов меньше.",
		"JUEGO DE ESPACIOS": "ПАС В РАЗРЕЗ",
		"Busca el pase al hueco: más mano a mano con el portero.": "Ищет пас в разрез: больше выходов один на один с вратарем.",
		"PEGA DESDE FUERA": "БЬЕТ ИЗДАЛЕКА",
		"Pide el disparo desde fuera del área: más tiros lejanos.": "Требует бить из-за штрафной: больше дальних ударов.",
		"CERROJO": "НА ЗАМОК",
		"Con ventaja cierra el partido: el rival casi no remonta desde el 75'.": "При преимуществе закрывает игру: после 75' соперник почти никогда не отыгрывается.",
		"FERGIE TIME": "ФЕРГИ-ТАЙМ",
		"Sus equipos no se rinden: más goles propios en el descuento.": "Его команды не сдаются: больше ваших голов в компенсированное время.",
		"EL ÁREA ES UN CAMPO DE MINAS": "ШТРАФНАЯ — МИННОЕ ПОЛЕ",
		"Juega por dentro y lo derriban: el doble de penales a favor.": "Играет через центр и собирает фолы: вдвое больше пенальти в вашу пользу.",
		"CONFÍA EN EL CHAVAL": "ВЕРИТ В МОЛОДЫХ",
		"Apuesta por los jóvenes: hasta los 23 juegas más y antes eres titular.": "Ставит на молодежь: до 23 лет ты играешь больше и раньше попадаешь в основу.",
		"EL BALÓN ES NUESTRO": "МЯЧ НАШ",
		"Con el balón el rival no llega: encaja menos, pero el partido va más lento.": "Пока мяч у вас, соперник не доходит до ворот: пропускаете меньше, но игра медленнее.",
		"SALE A MORDER": "С МЕСТА В КАРЬЕР",
		"Empieza a mil: la primera media hora es de tu equipo, ida y vuelta.": "Начинает на полной скорости: первые полчаса за твоей командой, игра от ворот до ворот.",
		"POCAS PERO CLARAS": "МАЛО, НО ВЕРНО",
		"Menos ocasiones y mejores: llegan más cerca de la portería, y fallarlas cuesta el doble.": "Моментов меньше, но они лучше: ближе к воротам, а промах стоит вдвое дороже.",
		"HOMBRE DE DERBIS": "КОРОЛЬ ДЕРБИ",
		"Se crece en los derbis: más juego y una ocasión más contra el rival de siempre.": "Раскрывается в дерби: больше игры и на один момент больше против давнего соперника.",
		"CUIDA LAS PIERNAS": "БЕРЕЖЕТ НОГИ",
		"Menos lesiones y mejor descanso, a cambio de rotarte más.": "Меньше травм и лучше отдых — взамен он чаще тебя ротирует.",
		"EL LOCO": "БЕЗУМЕЦ",
		"Ida y vuelta sin freno: más energía por partido y más lesiones.": "Игра от ворот до ворот без тормозов: больше энергии за матч и больше травм.",
		"NO TE FÍAS DEL CHAVAL": "НЕ ВЕРИТ В МОЛОДЫХ",
		"No se fía de los jóvenes: hasta los 23 te cuesta más el puesto.": "Не доверяет молодым: до 23 лет место в составе дается тебе тяжелее.",
		"BRONCA POR TODO": "ВЕЧНО ОРЕТ",
		"Bronca por todo: cada mal partido te pesa el doble con él.": "Орет по любому поводу: каждый плохой матч при нем весит вдвое больше.",
		"CARRUSEL": "КАРУСЕЛЬ",
		"Rota sin parar: te sienta aunque llegues fresco.": "Ротирует без остановки: сажает тебя на скамейку, даже когда ты полон сил.",
		"NO SUELTA UN DURO": "СКУПЕРДЯЙ",
		"Manda en los fichajes y no suelta un duro: las mejoras de contrato cuestan más.": "Заправляет трансферами и не дает ни копейки: улучшение контракта стоит дороже.",
		"ONCE DE LA SUERTE": "СЧАСТЛИВЫЙ СОСТАВ",
		"Si el once ganó, repite: para entrar hay que esperar a que pierda.": "Если состав выиграл, он не меняется: чтобы попасть в него, жди поражения.",
		"VE ROJAS DONDE NO LAS HAY": "КРАСНЫЕ НА КАЖДОМ ШАГУ",
		"Sus equipos ven más rojas: jugarás con diez más veces.": "Его команды чаще получают красные: ты чаще будешь играть вдесятером.",
		"FUERA DE CASA SE ENCOGE": "ТЕРЯЕТСЯ В ГОСТЯХ",
		"Fuera de casa se encoge: el rival aprieta más en su campo.": "В гостях теряется: соперник сильнее давит на своем поле.",
		"SU OJITO DERECHO": "ЛЮБИМЧИКИ",
		"Tiene favoritos: hasta que te lo ganes, otro juega en tu sitio.": "У него есть любимчики: пока не завоюешь его доверие, на твоем месте играет другой.",
		"PARTIDOS LOCOS": "БЕЗУМНЫЕ МАТЧИ",
		"Sus partidos son locos: goleadas en las dos porterías.": "Его матчи — безумие: голы сыплются в обе стороны.",
		"DESPIERTA AL DESCANSO": "СОННОЕ НАЧАЛО",
		"Sale dormido: nada antes del 25', y el rival manda la primera parte.": "Выходит сонным: до 25' ничего, и соперник владеет первым таймом.",
		"ONCE DE HIERRO": "ЖЕЛЕЗНЫЙ СОСТАВ",
		"Casi no rota: repite el once mientras aguanten las piernas; el que no juega, espera.": "Почти не ротирует: выставляет один и тот же состав, пока держат ноги; кто не играет — ждет.",
		"LA CULPA ES TUYA": "ВИНОВАТ ТЫ",
		"Tras perder, la culpa es tuya: afición y prensa te lo cobran el doble.": "После поражения виноват ты: болельщики и пресса спрашивают с тебя вдвойне.",
		"REVOLUCIÓN": "РЕВОЛЮЦИЯ",
		"Llega y manda: lleva al equipo a su dibujo el doble de rápido.": "Приходит и командует: команда переходит на его схему вдвое быстрее.",
		"LO QUE FUNCIONA NO SE TOCA": "РАБОТАЕТ — НЕ ТРОГАЙ",
		"Respeta lo heredado: tarda el doble en llevar al equipo a su dibujo.": "Уважает то, что досталось от предшественника: команде нужно вдвое больше времени, чтобы перейти на его схему.",

		"RASGOS DEL MÍSTER": "ЧЕРТЫ ТРЕНЕРА",
		"RASGOS": "ЧЕРТЫ",
		"RASGO BUENO": "ДОСТОИНСТВО",
		"RASGO MALO": "НЕДОСТАТОК",
		"Juega para un técnico con este rasgo para descubrirlo.": "Сыграй у тренера с этой чертой, чтобы открыть ее.",
		"Con la selección no se descubre: juega para un técnico de club con este rasgo.": "В сборной не открывается: сыграй у клубного тренера с этой чертой.",
		"Los rasgos de los técnicos para los que has jugado. Cada uno se descubre con el primer partido a sus órdenes.": "Черты тренеров, у которых ты играл. Каждая открывается в первом матче под их руководством.",
		"Sin rasgos conocidos.": "Известных черт нет.",
		"BUENOS": "ПЛЮСЫ",
		"MALOS": "МИНУСЫ",
		"Rasgo nuevo: {0}": "Новая черта: {0}",



		"MOVER ESTO": "ПЕРЕДВИНУТЬ",
		"choca con {0}": "мешает: {0}",
		"encima de {0}": "сверху: {0}",






		"GANAS LA TANDA": "СЕРИЯ ЗА ВАМИ",
		"ELIMINADO EN PENALES": "ВЫЛЕТ ПО ПЕНАЛЬТИ",
		"La metió {0}. Los otros diez cruzaron medio campo para decírselo.":
			"Забил {0}. Остальные десять пересекли полполя, чтобы сказать ему об этом.",
		"La metiste tú. Los otros diez cruzaron medio campo para decírtelo.":
			"Забил ты. Остальные десять пересекли полполя, чтобы сказать тебе об этом.",
		"La sacó {0}. Los otros diez cruzaron medio campo para decírselo.":
			"Отбил {0}. Остальные десять пересекли полполя, чтобы сказать ему об этом.",
		"La mandaron fuera. Los otros diez cruzaron medio campo igual.":
			"Соперник пробил мимо. Остальные десять все равно пересекли полполя.",
		"La metiste tú. Hasta el banquillo saltó al campo a por ti.":
			"Забил ты. Даже скамейка выбежала на поле к тебе.",
		"La metió {0}. Hasta el banquillo saltó al campo a por él.":
			"Забил {0}. Даже скамейка выбежала на поле к нему.",
		"La sacó {0}. Hasta el banquillo saltó al campo a por él.":
			"Отбил {0}. Даже скамейка выбежала на поле к нему.",
		"La mandaron fuera. Hasta el banquillo saltó al campo.":
			"Соперник пробил мимо. Даже скамейка выбежала на поле.",
		"La fiesta la dan ellos. A ti te quedan cuarenta metros hasta el túnel.":
			"Праздник — у них. Тебе осталось сорок метров до туннеля.",
		"Subcampeón": "Второе место",

		"Campeón: {0}": "Чемпион: {0}",
		"La fiesta estaba lista. La están dando ellos, en el sitio donde ibas a estar tú.":
			"Праздник был готов. Теперь его устраивают они — там, где должен был стоять ты.",

		"ÁNGULO": "УГОЛ",

		"Presión alta": "Высокий прессинг",
		"Bloque bajo": "Низкий блок",
		"Marcaje al hombre": "Персональная опека",
		"Bloque alto paciente": "Терпеливая высокая линия",


		"Equilibrado": "Сбалансированный",

		"ÁRBITRO": "СУДЬЯ",
		"Tarjetero": "Любит карточки",
		"Permisivo": "Мягкий",
		"Deja seguir": "Дает играть",
		"Pita todo": "Свистит на все",

		"Encerrado en la banda": "Зажат у бровки",
		"El último hombre": "Последний защитник",

		"Juega la {0}": "Играет: {0}",

		"Su comisión baja del 8% al 3% en cada partido, y también en lo que"
		+ " cobras al firmar. Cara, pero cuanto antes la firmes, más te devuelve.":
			"Комиссия агента снижается с 8% до 3% с каждого матча, а также с бонуса за подписание. Дорого, но чем раньше подпишешь, тем больше вернется.",

		"EL CHAVO TE COMIÓ EL PUESTO": "ПАЦАН ЗАНЯЛ ТВОЕ МЕСТО",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la"
		+ " nómina: el tuyo. Te piden por las buenas un 20% de tu sueldo, y el"
		+ " vestuario ya sabe que te lo han pedido.":
			"Клуб уже договорился с юным феноменом, и ему не хватает только места в платежной ведомости — твоего. Тебя по-хорошему просят уступить 20% зарплаты, и раздевалка уже знает об этой просьбе.",
		"DECIR QUE LES SOBRÓ CONFIANZA": "СКАЗАТЬ, ЧТО ЗАЗНАЛИСЬ",
		"Los eliminó un equipo de dos categorías más abajo, en una cancha de mil"
		+ " personas y con el vestuario de local festejando junto al de ustedes.":
			"Вас выбила команда на две лиги ниже, на стадионе на тысячу человек, и хозяева праздновали в раздевалке прямо за стенкой.",

		"max_asist_eulCerebro de la Europa League": "Плеймейкер Кубка Европы",
		"pichichi_x5Dueño del Area": "Хозяин штрафной",
		"pichichi_3_paisesEl Gol No Entiende de Idiomas":
			"Голу не нужен переводчик",
		"doblete_ligaGoles y Pases": "Голы и пасы",
		"verdugo_paises_bajosVerdugo de Países Bajos": "Гроза Нидерландов",
		"presentacion_40kCuarenta Mil": "Сорок тысяч",
		"TE QUIEREN EN EL PLATÓ": "ТЕБЯ ЗОВУТ НА ТВ",
		"UN MICRÓFONO CALIENTE": "ОПАСНЫЙ ВОПРОС",
		"DESCANSAR EN CASA": "ОТДОХНУТЬ ДОМА",
		"SALIR CON EL EQUIPO": "ПОГУЛЯТЬ С КОМАНДОЙ",
		"¡Subiste a nivel {0}!": "Новый уровень: {0}!",
		"Tienes {0} puntos para repartir en tus habilidades.":
			"Очков для навыков: {0}.",
		"un compañero": "партнер по команде",
		"Le abriste la puerta a {0}. Atento al mercado.":
			"Ты дал понять клубу {0}, что открыт для разговора. Следи за рынком.",
		"Aún no hay ofertas. Se pueden mover fichas.":
			"Предложений пока нет. Все еще может сдвинуться.",
		"{0} {1} sobre la mesa.": "{0} {1} на столе.",
		"Marcas interesadas": "Бренды проявляют интерес",
		"{0} {1} {2} ficharte.": "{0} {1} {2} подписать тебя.",
		"Convocado con tu selección": "Вызов в сборную",
		"Entras en la lista ({0}). Jugarás las fechas FIFA.":
			"Ты в заявке ({0}). Сыграешь в паузу на сборные.",
		"Te dan el alta": "Допуск получен",
		"Recuperado. Vuelves a estar disponible para el próximo partido.":
			"Восстановился. Ты снова готов к следующему матчу.",
		"Lesión": "Травма",
		"Estarás de baja {0} {1}.": "Выбываешь на {0} {1}.",
		"Fuera de la lista": "Вне заявки",
		"El seleccionador de {0} te deja fuera de la convocatoria.":
			"Тренер сборной {0} не включил тебя в заявку.",
		"Vuelves a la selección": "Снова в сборной",
		"Regresas a la lista de {0} ({1}).": "Ты снова в заявке сборной {0} ({1}).",
		"Titular con tu selección": "В основе сборной",
		"Te ganas el puesto en el once de {0}.":
			"Ты заслужил место в основе сборной {0}.",
		"Te quedas fuera": "Ты вне заявки",
		"El técnico no te convoca para el próximo partido.":
			"Тренер не включил тебя в заявку на следующий матч.",
		"Pierdes la titularidad": "Ты теряешь место в основе",
		"Empezarás en el banquillo el próximo partido.":
			"Следующий матч начнешь на скамейке.",
		"Vuelves al once": "Снова в основе",
		"El técnico te devuelve la titularidad.": "Тренер возвращает тебе место в основе.",
		"Energía en rojo": "Энергия в красной зоне",
		"Vas al {0}%. Jugando así rindes menos y te arriesgas a lesionarte.":
			"Ты на {0}%. В таком состоянии играешь хуже и рискуешь получить травму.",
		"Semana de derbi": "Неделя дерби",
		"Toca {0}. Gana y todo cuenta doble.":
			"Впереди {0}. Победишь — и все засчитается вдвойне.",
		"Logro: {0}": "Достижение: {0}",
		"El técnico cuenta más contigo": "Тренер больше на тебя рассчитывает",
		"Tu rol en el club sube a {0}.": "Твоя роль в клубе растет: {0}.",
		"El técnico te nombra capitán": "Тренер назначает тебя капитаном",
		"Tu rendimiento manda en el vestuario: llevas el brazalete.":
			"Твоя игра ведет раздевалку: повязка у тебя.",
		"Te quitan el brazalete": "У тебя забирают повязку",
		"Otro compañero rinde por encima de ti esta temporada.":
			"В этом сезоне другой партнер играет лучше тебя.",
		", {0} goles": ", голы: {0}",
		"Fuiste la figura ({0} de nota{1}).":
			"Ты стал звездой матча (оценка {0}{1}).",
		"Media {0}: el mejor de tu liga este mes (listón {1}).":
			"Средняя оценка {0}: лучшая в твоей лиге в этом месяце (планка {1}).",
		"Premio de la temporada {0}.": "Награда сезона {0}.",
		"¡Campeón de Liga!": "Чемпион лиги!",
		"Levantaste la liga con tu club.": "Ты выиграл лигу со своим клубом.",
		"¡Ascenso!": "Повышение!",
		"Subes a {0} con tu club.": "Повышение вместе с клубом: {0}.",
		"Descenso a {0}": "Вылет: {0}",
		"Ganar la copa nacional.": "Выиграть кубок страны.",
		"Eres campeón de Europa.": "Ты — чемпион Европы.",
		"Fase final de Champions": "Плей-офф Кубка элиты",

		"Entraste en el ONCE IDEAL de la liga": "Ты попал в СИМВОЛИЧЕСКУЮ СБОРНУЮ лиги",
		"¡Campeón de Europa League!": "Обладатель Кубка Европы!",
		"Ganas Europa y con ella la plaza para la próxima Champions.":
			"Ты выигрываешь Кубок Европы, а с ним и путевку в Кубок элиты следующего сезона.",
		"Fase final de Europa League": "Плей-офф Кубка Европы",
		"¡Campeón del Mundo de Clubes!": "Победитель клубного мундиаля!",
		"El título más grande a nivel de club.": "Самый большой титул в клубном футболе.",
		"Objetivo cumplido": "Цель выполнена",
		"El club queda contento con tu temporada.": "Клуб доволен твоим сезоном.",
		"Objetivo no cumplido": "Цель не выполнена",
		"El club esperaba más. Sube la presión.":
			"Клуб ждал большего. Давление растет.",
		"El club te pone en venta por no cumplir":
			"Клуб выставляет тебя на продажу за невыполнение цели",
		"El club te pone en venta": "Клуб выставляет тебя на продажу",
		"Dos temporadas sin dar lo que firmaste. En {0} escuchan ofertas por ti.":
			"Два сезона ты не даешь того, под что подписывался, и {0} уже слушает предложения по тебе.",
		"El club te buscará minutos fuera": "Клуб найдет тебе игровое время на стороне",
		"El club te buscará sitio fuera": "Клуб найдет тебе место на стороне",
		"No cumpliste lo que te pidieron y en {0} creen que necesitas jugar. En el próximo mercado te buscarán una cesión.":
			"Ты не выполнил то, что от тебя ждали, и {0} считает, что тебе нужна игровая практика. В следующее окно тебе подыщут аренду.",
		"Contrato en el último año": "Последний год контракта",
		"Renueva o escucha ofertas antes de quedar libre.":
			"Продли контракт или слушай предложения, пока не стал свободным агентом.",
		"Se acabó: te retiras a los {0}": "Вот и все: завершаешь карьеру в {0}",
		"Mercado de verano abierto": "Летнее окно открыто",
		"{0}: OBJETIVO CUMPLIDO": "{0}: ЦЕЛЬ ВЫПОЛНЕНА",
		"{0} no renueva, y no volverá en {1} temporadas":
			"{0} не продлевает и не вернется еще {1} сез.",
		"{0} no renueva: tu club no juega en Europa": "{0} не продлевает: твой клуб не играет в Европе",
		"{0}: objetivo a {1} por tus {2} jornadas de baja":
			"{0}: цель снижена до {1} — пропущено туров: {2}",
		"{0} no renueva": "{0} не продлевает",
		"Los años pesan: -{0} en lo físico": "Годы берут свое: -{0} к физике",
		"Los años pesan: -{0} en lo físico y -{1} en lo técnico": "Годы берут свое: -{0} к физике, -{1} к технике",
		"Los años pesan: -{0} en lo técnico": "Годы берут свое: -{0} к технике",
		"Terminar {0} o mejor en la liga.": "Финиш: {0} в лиге или выше.",
		"Dar {0} asistencias.": "Отдать голевых передач: {0}.",
		"Jugar {0} partidos.": "Сыграть матчей: {0}.",
		"Promediar {0} de nota.": "Средняя оценка не ниже {0}.",
		"Marcar {0} goles.": "Забить голов: {0}.",
		"Preguntaron por ti": "Тобой интересовались",
		"{0} te ha hecho una oferta.": "{0} делает тебе предложение.",
		"Un club": "Один клуб",
		"Mercado de invierno abierto": "Зимнее окно открыто",
		"Se retiran de la puja": "Они выходят из борьбы",
		"Rechazaste una oferta": "Ты отклонил предложение",
		"Dijiste no a {0}. Se busca otro destino para la próxima jornada.":
			"Ты отказал клубу {0}. К следующему туру ищем другой вариант.",
		"Nadie ocupa el hueco": "Место никто не занял",
		"Rechazaste y de momento no ha llegado nadie más.":
			"Ты отказался, и пока больше никто не пришел.",
		"{0} ya no cuenta contigo: buscan a otro.":
			"{0} больше на тебя не рассчитывает: ищет другого.",
		"Enfrían el interés": "Интерес остывает",
		"{0} se baja tras tu último partido.": "{0} отступает после твоего последнего матча.",
		"Último día de mercado": "Последний день окна",
		"{0} {1} sobre la mesa. Mañana se cierra.":
			"{0} {1} на столе. Завтра окно закрывается.",
		"Nueva oferta": "Новое предложение",
		"{0} entra en la puja por ti.": "{0} вступает в борьбу за тебя.",
		"El club": "Клуб",
		"mejor ficha": "зарплата побольше",
		"ser titular": "место в основе",
		"Negociación abierta": "Переговоры начались",
		"Pediste {0} a {1}. Te responden en la próxima jornada.":
			"Ты попросил у клуба {1}: {0}. Ответ придет к следующему туру.",
		"sube la ficha a ${0}/partido": "поднимает тебе зарплату до ${0} за матч",
		"acepta ficharte como {0}": "соглашается подписать тебя на роль: {0}",
		"Ceden en la negociación": "Они уступают",
		"Rompen la negociación": "Переговоры сорваны",
		"{0} retira su oferta: te apretaste de más.":
			"{0} отзывает предложение: ты слишком давил.",
		"Se plantan": "Они стоят на своем",
		"{0} mantiene su oferta tal cual. No hay más margen.":
			"{0} оставляет предложение как есть. Больше уступок не будет.",
		"Rumores de mercado": "Трансферные слухи",
		"{0} pregunta por ti de cara al mercado de invierno.":
			"{0} интересуется тобой перед зимним окном.",
		"El club necesita venderte": "Клубу нужно тебя продать",
		"En {0} dicen que tu traspaso les cuadra el año. Puedes negarte, pero no te lo"
		+ " van a agradecer. Decide en MERCADO.":
			"Твой трансфер, как считает {0}, сведет бюджет года. Можешь отказаться, но спасибо тебе не скажут. Реши на РЫНКЕ.",
		"el club": "клуб",
		"Aceptas salir": "Ты согласен уйти",
		"El club te ofrece a quien pregunte. Busca destino en MERCADO.":
			"Клуб предложит тебя любому, кто спросит. Ищи вариант на РЫНКЕ.",
		"Te niegas a salir": "Ты отказываешься уходить",
		"Te quedas, pero el club contaba con ese traspaso y se nota en el vestuario.":
			"Ты остаешься, но клуб рассчитывал на эти деньги, и в раздевалке это чувствуется.",
		"El club te busca minutos": "Клуб ищет тебе игровое время",
		"En {0} no vas a jugar y lo saben: te ofrecen salir CEDIDO para que juegues."
		+ " Puedes negarte, pero te quedas donde estás. Decide en MERCADO.":
			"Играть ты не будешь, и {0} это знает: тебе предлагают уйти В АРЕНДУ, чтобы играть. Можешь отказаться, но тогда останешься на месте. Реши на РЫНКЕ.",
		"Te niegas a salir cedido": "Ты отказываешься от аренды",
		"Te quedas. El club te buscó minutos y dijiste que no: esta temporada vas a"
		+ " mirar muchos partidos desde fuera.":
			"Ты остаешься. Клуб нашел тебе игровое время, а ты отказался: в этом сезоне много матчей посмотришь со стороны.",
		"El club deja de contar contigo: buscan salida":
			"Клуб на тебя больше не рассчитывает: тебя хотят продать",
		"El club deja de esperarte": "Клуб больше не ждет",
		"Dos temporadas sin crecer y sin sitio en el equipo: {0} te pone en la puerta"
		+ " de salida y no te va a renovar.":
			"Два сезона без роста и без места в команде: {0} указывает тебе на дверь и не продлит контракт.",
		"Vuelve de su cesión": "Вернулся из аренды",
		"{0} regresa al vestuario tras un año jugando fuera.":
			"{0} возвращается в раздевалку после года на стороне.",
		"Un canterano": "Воспитанник",
		"Sale cedido": "Уходит в аренду",
		"{0} se va cedido a {1} por una temporada.":
			"{0} уходит в аренду в клуб {1} на сезон.",
		"Llega cedido": "Пришел в аренду",
		"{0} ({1}) llega cedido desde {2}.": "{0} ({1}) приходит в аренду из клуба {2}.",
		"Sube uno de la cantera": "Из академии — в основу",
		"{0} ({1}) se queda con el hueco en el primer equipo.":
			"{0} ({1}) занимает место в основной команде.",
		"Tu club ficha": "Новичок в твоем клубе",
		"Llega {0} ({1}) desde {2}.": "{0} ({1}) приходит из клуба {2}.",
		"El descenso vacía el vestuario": "Вылет опустошает раздевалку",
		"{0} ({1}) se va: el club necesita hacer caja.":
			"{0} ({1}) уходит: клубу нужны деньги.",
		"Se va un compañero": "Уходит партнер",
		"{0} deja el vestuario: firma por {1}.":
			"{0} покидает раздевалку: подписывает контракт с клубом {1}.",
		"El fichaje del mercado": "Трансфер окна",
		"{0} pasa de {1} a {2} por ${3}.": "{0} переходит из клуба {1} в клуб {2} за ${3}.",




		"Se mueve tu vestuario": "Твоя раздевалка меняется",
		"Llegan {0}. Se van {1}.": "Пришли: {0}. Ушли: {1}.",
		"Llegan {0}.": "Пришли: {0}.",
		"Se vacía tu vestuario": "Твоя раздевалка пустеет",
		"Se van {0}.": "Ушли: {0}.",
		"Cesiones en tu club": "Аренды в твоем клубе",
		"Llegan cedidos {0}. Salen cedidos {1}.":
			"Пришли в аренду: {0}. Ушли в аренду: {1}.",
		"Llegan cedidos {0}.": "Пришли в аренду: {0}.",
		"Salen cedidos {0}.": "Ушли в аренду: {0}.",
		"El mercado se movió": "Рынок кипел",
		"{0} traspasos en el mundo. Los tienes en MERCADO.":
			"Трансферов в мире: {0}. Все они — на РЫНКЕ.",
		"{0} traspasos en el mundo. El más caro: {1} a {2} por ${3}.":
			"Трансферов в мире: {0}. Самый дорогой: {1} — в клуб {2} за ${3}.",
		"Fichaste por un club nuevo": "Ты подписал контракт с новым клубом",
		"Te incorporas a {0}. Empiezas de cero en el vestuario.":
			"Ты переходишь в {0}. В раздевалке начинаешь с нуля.",
		"tu nuevo club": "твой новый клуб",
		"Tu contrato terminó: eres AGENTE LIBRE":
			"Твой контракт истек: ты СВОБОДНЫЙ АГЕНТ",
		"Eres agente libre": "Ты свободный агент",
		"Tu contrato terminó. Elige tu próximo club.":
			"Твой контракт истек. Выбери следующий клуб.",
		"Firmaste como agente libre": "Ты подписан как свободный агент",
		"Fichas por {0} sin traspaso.": "Ты переходишь в {0} бесплатно.",
		"Fin de la cesión: vuelves a {0}": "Аренда окончена: возвращаешься в клуб {0}",
		"Renovaste tu contrato": "Ты продлил контракт",
		"Sigues en {0}: {1} {2} más.": "Остаешься в клубе {0}: еще {1} {2}.",
		"No renuevas: al escaparate": "Без продления — на витрину",
		"El club te pone en venta para no perderte gratis. Si te quedas, jugarás menos.":
			"Клуб выставляет тебя на продажу, чтобы не потерять бесплатно. Если останешься, будешь играть меньше.",
		"Sin destinos de cesión": "Нет вариантов аренды",
		"Ningún club menor te quiere cedido ahora mismo.":
			"Сейчас ни один клуб поменьше не хочет взять тебя в аренду.",
		"Pediste salir cedido": "Ты попросился в аренду",
		"Clubes menores donde jugarías de titular. Elige en el MERCADO.":
			"Клубы поменьше, где ты будешь в основе. Выбирай на РЫНКЕ.",
		"Tu club quiere retenerte": "Твой клуб хочет тебя удержать",
		"{0} pone sobre la mesa una mejora de contrato para que te quedes.":
			"{0} предлагает улучшенный контракт, чтобы ты остался.",
		"Tu club": "Твой клуб",
		"Sin sitio en la selección de {0}": "Нет места в сборной: {0}",
		"Titular de {0}": "Игрок основы сборной: {0}",
		"Convocado con {0}": "Вызов в сборную: {0}",
		"¡{0} se clasificó al Mundial!": "{0} едет на мундиаль!",
		"{0} CAMPEÓN de la {1}… sin ti": "{1}: {0} — ЧЕМПИОН… без тебя",
		"{0}: {1} CAMPEÓN, y tú sin jugar un minuto": "{0}: {1} — ЧЕМПИОН, а ты не сыграл ни минуты",
		"{0} subcampeón de la {1} (sin ti)": "{1}: {0} — второе место (без тебя)",
		"{0}: {1} eliminada en {2} (sin ti)":
			"{0}: {1} выбывает на стадии «{2}» (без тебя)",
		"{0} sin ti": "{0} без тебя",
		"{0} se clasificó al Mundial (sin ti)":
			"{0} выходит на мундиаль (без тебя)",
		"¡CAMPEÓN DEL MUNDO con {0}!": "ЧЕМПИОН МИРА со сборной: {0}!",
		"¡CAMPEÓN de la {0} con {1}!": "{0}: {1} — ЧЕМПИОН, и ты в составе!",
		"Subcampeón de la {0} con {1}": "{0}: второе место со сборной ({1})",
		"{0}: eliminado en {1} con {2}": "{0}: вылет на стадии «{1}» ({2})",
		"{0} con {1}": "{0} со сборной ({1})",
		"{0} se clasificó al Mundial": "{0} выходит на мундиаль",
		"{0} no fue al Mundial": "{0}: без мундиаля",
		"Mundial sin ti: {0} de {1}": "Мундиаль без тебя: {1} — {0}",
		"{0} sin ti: {1} de {2}": "{0} без тебя: {2} — {1}",
		"{0} no se clasificó al Mundial": "{0} не выходит на мундиаль",


		"natdieciseisavos": "1/16 финала",
		"natoctavos": "1/8 финала",
		"natcuartos": "1/4 финала",
		"natsemifinal": "полуфинал",
		"natfinal": "финал",
		"natfase de grupos": "групповой этап",
		"natno clasificada": "не прошла отбор",
		"natcampeón": "чемпион",
		"natsubcampeón": "второе место",
		"natronda": "раунд",
		"calluptitular": "в основе",
		"callupconvocado": "в заявке",
		"SUENA OTRO CLUB": "ИНТЕРЕС ИЗВНЕ",
		"ME INTERESARÍA": "МНЕ ИНТЕРЕСНО",
		"ESTOY COMPROMETIDO AQUÍ": "Я ПРЕДАН КЛУБУ",
		"DOS CLUBES PREGUNTAN": "ИНТЕРЕС ДВУХ КЛУБОВ",
		"Te ponen el micro delante: {0} y {1} preguntan por ti. ¿A cuál te irías? Lo que"
		+ " digas lo oye tu técnico.":
			"Тебе суют микрофон: {0} и {1} интересуются тобой. Куда бы ты пошел? Твой тренер все слышит.",
		"ME IRÍA A {0}": "ВЫБИРАЮ {0}",
		"ME QUEDO EN {0}": "ВЕРЕН КЛУБУ {0}",
		"LESIONADO": "ТРАВМА",
		"Selección": "Сборная",
		"buzonMERCADO": "РЫНОК",
		"¡LOGRO DESBLOQUEADO!": "ДОСТИЖЕНИЕ ОТКРЫТО!",
		"¡ARQUETIPO DESBLOQUEADO!": "АРХЕТИП ОТКРЫТ!",
		"¡RASGO DESCUBIERTO!": "ЧЕРТА ОТКРЫТА!",
		"TOCA PARA CONTINUAR": "НАЖМИ — ДАЛЕЕ",
		"REGATEA Y REMATA": "ОБВОДИ И БЕЙ",
		"Puedes tirar ya. O jala desde dentro del círculo para conducir, vuelve al círculo y paras en seco: ahí apuntas con calma y tiras. Combinar regate y tiro es lo que abre a un defensa.": "Бить можно сразу. Или потяни изнутри круга, чтобы вести мяч, вернись в круг — и встанешь как вкопанный: тут спокойно целься и бей. Сочетай дриблинг и удар — так и проходят защитника.",
		"MODO PASE": "РЕЖИМ ПАСА",
		"Dentro del círculo, el mismo trazo es un pase. Jala hacia atrás y el balón sale hacia adelante, al compañero libre de la otra banda. Sin defensa encima, es la salida más segura.": "Внутри круга тот же жест — это пас. Тянешь назад, и мяч летит вперед, к свободному партнеру на другом фланге. Если защитник не висит на тебе, это самый надежный выход.",
		"EL RELEVO": "ЭСТАФЕТА",
		"Si tu pase llega a un compañero fuera del área, pasas a jugar con él. Si cae dentro del área no hay control que valga: remata de primera.": "Если пас доходит до партнера за пределами штрафной, ты начинаешь играть за него. Если мяч приходит в штрафную, принимать некогда: он бьет с ходу.",
		"LA PANTALLA DE GOLPEO": "ЭКРАН УДАРА",
		"Soltaste la resortera: ahora eliges dónde tocar el balón. La costura marca el centro: ahí sale tenso. Cuanto más abajo la toques, más lo elevas; cuanto más al borde, menos potencia.": "Ты отпустил рогатку: теперь выбираешь, в какую точку мяча бить. Шов отмечает центр: удар туда — и мяч летит прямо и хлестко. Чем ниже коснешься, тем выше полетит; чем ближе к краю, тем меньше силы.",

		"Primera Mudanza": "Первый переезд",
		"Subir de casa por primera vez.": "Впервые переехать в дом получше.",
		"Vida Acomodada": "Жизнь удалась",
		"Llegar a vivir en una casa moderna.": "Переехать в современный дом.",
		"La Mansión": "Особняк",
		"Llegar a vivir en una mansión.": "Переехать в особняк.",
		"Hogar, Dulce Hogar": "Дом, милый дом",
		"Amueblar tu casa con 10 adiciones.": "Обставить дом: 10 дополнений.",
		"La Finca": "Поместье",
		"Llegar a vivir en una finca.": "Переехать в загородное поместье.",
		"Casa Llena": "Полная чаша",
		"Amueblar tu casa con 40 adiciones.": "Обставить дом: 40 дополнений.",
		"La Casa Soñada": "Дом мечты",
		"Amueblar tu casa con 80 adiciones.": "Обставить дом: 80 дополнений.",


		"Hacer 10 puntos en la maquinita de tu casa.": "Набрать 10 очков на игровом автомате у себя дома.",
		"Serpiente Legendaria": "Легендарная змейка",
		"¡TE TOCAN LAS LISAS!": "ТВОИ — СПЛОШНЫЕ!",
		"¡TE TOCAN LAS RAYADAS!": "ТВОИ — ПОЛОСАТЫЕ!",
		"Bullseye": "В яблочко",
		"Clavar un dardo en el mero centro de la diana.": "Попасть дротиком точно в яблочко.",
		"Ganar cinco retos de billar al vestuario en tu casa.":
			"Выиграть у партнеров по команде пять бильярдных дуэлей у себя дома.",

		"Buen Pulso": "Твердая рука",
		"Hacer 200 puntos en la diana de tu casa.": "Набрать 200 очков в дартс у себя дома.",
		"Mano de Seda": "Шелковая рука",
		"Hacer 320 puntos en la diana de tu casa.": "Набрать 320 очков в дартс у себя дома.",
		"Nueve Dardos": "Девять дротиков",
		"Hacer 400 puntos en la diana de tu casa.": "Набрать 400 очков в дартс у себя дома.",
		"La Mirada del Míster": "Взгляд тренера",
		"Llegar a cien dominadas en el banquillo.": "Набить сотню чеканок у скамейки.",
		"Compañero de Vestuario": "Партнер по команде",
		"Agregar a tu primer amigo.": "Добавить первого друга.",
		"La Peña": "Своя компания",
		"Tener 5 amigos.": "Завести 5 друзей.",
		"Hinchada Propia": "Свои болельщики",
		"Tener 10 amigos.": "Завести 10 друзей.",
		"Sin Fronteras": "Без границ",
		"El Mejor del Grupo": "Лучший в компании",
		"Ser primero en LEGADO entre al menos 3 amigos.": "Стать первым по НАСЛЕДИЮ среди как минимум 3 друзей.",
		"Bola Ocho": "Восьмерка",
		"Ganar tu primera partida de billar en casa.": "Выиграть первую партию в бильярд у себя дома.",
		"Mesa Limpia": "Чистый стол",
		"Ganar una partida de billar sin que el rival meta una sola bola.":
			"Выиграть партию в бильярд, не дав сопернику забить ни одного шара.",
		"El Dueño de la Casa": "Хозяин дома",
		"Ganaste cinco retos al vestuario en tu casa, entre la diana y la mesa.": "Ты выиграл у партнеров пять дуэлей у себя дома — в дартс и на бильярде.",
		"Hacer 50 puntos en la maquinita de tu casa.": "Набрать 50 очков на игровом автомате у себя дома.",
		"Graduado de la Academia": "Выпускник Академии",
		"Completar el entrenamiento de la Academia.": "Пройти тренировку в Академии.",
		"Ocho Años":
			"Восемь лет",
		"Ocho temporadas con la misma persona.":
			"Восемь сезонов с одним и тем же человеком.",
		"Media Naranja": "Вторая половинка",
		"Formalizar una relación.": "Официально оформить отношения.",
		"Vitrina Dorada": "Золотая витрина",
		"Desbloquear todos los logros épicos.": "Открыть все эпические достижения.",
		"¡Corten!": "Стоп, снято!",
		"Tumbar a un camarógrafo de un balonazo.": "Сбить оператора шальным мячом.",


		"¡Plumas!": "Пух и перья!",
		"Alcanzar a una paloma del campo de un balonazo.": "Попасть шальным мячом в голубя на поле.",


		"¡Agua Va!": "Кругом вода!",
		"Reventar una cabeza de riego de un balonazo y que escupa torcida el resto del partido.":
			"Разбить ударом разбрызгиватель, чтобы он до конца матча брызгал вкось.",
		"¡Remojón!": "Искупались!",
		"Tirarle la bebida a diez aficionados con balones que se van a la grada.":
			"Облить напитками десять болельщиков мячами, улетевшими на трибуну.",


		"¡Ahí Va la Bandeja!": "Прощай, обед!",
		"Tumbarle la bandeja de comida al vendedor de la grada de un balonazo.":
			"Шальным мячом выбить поднос с едой у продавца на трибуне.",
		"¡LE TIRASTE LA COMIDA AL VENDEDOR!":
			"ТЫ ВЫБИЛ ЕДУ У ПРОДАВЦА!",
		"Le Callaste la Boca": "Ответ на свист",
		"Marcar después de que te abucheen desde la grada, en el mismo partido.":
			"Забить после того, как тебя освистали трибуны, в том же матче.",
		"Ese Balón No Vuelve": "Этот мяч не вернется",
		"Mandar un balón a la calle en un campo sin nada detrás del arco.":
			"Отправить мяч на улицу на стадионе, где за воротами ничего нет.",
		"Cesión al Portero": "Пас вратарю",
		"Pasarle el balón a tu propio portero en vez de tirar a puerta.":
			"Отдать мяч своему вратарю вместо удара по воротам.",
		"¡A por agua!": "Перерыв на воду!",
		"Tirar las botellas de agua del portero de un balonazo.":
			"Шальным мячом сбить бутылки с водой у вратаря.",
		"La mano del derbi": "Рукопожатие дерби",
		"Descubrir el apretón de manos de los técnicos al acabar un derbi.":
			"Увидеть рукопожатие тренеров после дерби.",
		"Mano de hierro": "Железная хватка",
		"Ganarle el apretón de manos al técnico rival al acabar un derbi.":
			"Пересилить тренера соперника в рукопожатии после дерби.",
		"¡Una foto y me voy!": "Одно фото — и ухожу!",
		"Un aficionado salta al campo en una final para tomarse una foto contigo.":
			"Болельщик выбегает на поле в финале, чтобы сфотографироваться с тобой.",
		"¡Cristales!": "Стекла вдребезги!",
		"Reventar el cristal de un palco de un balonazo.": "Разбить шальным мячом стекло ВИП-ложи.",
		"Sin Piedad con el Chaval": "Без жалости к пацану",
		"Tumbar al recogepelotas de un balonazo.": "Сбить шальным ударом мальчика, подающего мячи.",
		"De Espaldas a la Copa": "Спиной к кубку",
		"Perder una final y ver al rival levantar el título.": "Проиграть финал и смотреть, как соперник поднимает трофей.",

		"{0} decidió la final. Su nombre se queda contigo.": "{0} решил финал. Это имя ты не забудешь.",
		"{0} metió el penalti que decidió la final. Su nombre se queda contigo.":
			"{0} забил пенальти, решивший финал. Это имя ты не забудешь.",
		"{0} paró el penalti que decidió la final. Su nombre se queda contigo.":
			"{0} отразил пенальти, решивший финал. Это имя ты не забудешь.",
		"REVANCHA · TEMPORADA {0}": "РЕВАНШ · СЕЗОН {0}",
		"{0} te quitó la final de la temporada {1} ({2}). Esta noche los que miran son ellos.":
			"Финал сезона {1} ({2}) ты отдал клубу {0}. Сегодня смотреть будут они.",
		"Final vengada en la temporada {0}": "Реванш за финал в сезоне {0}",
		"Te ganó la final de la temporada {0}": "Обыграл тебя в финале сезона {0}",
		"Revancha": "Реванш",
		"Ganar una final al club que te quitó otra.":
			"Выиграть финал у клуба, который отнял у тебя другой.",
		"Tres Pases, Tres Goles": "Три паса — три гола",
		"Darle tres asistencias al mismo compañero en un partido.": "Отдать три голевые передачи одному партнеру за матч.",
		"Un Balón Cada Uno": "Каждому по мячу",
		"Hacer hat-trick en el partido en que le das tres asistencias al mismo compañero.": "Сделать хет-трик в матче, где отдаешь три голевые передачи одному партнеру.",
		"Piel Nueva": "Новая кожа",
		"Ver la presentación de las equipaciones de la temporada.": "Посмотреть презентацию формы нового сезона.",
		"Primer Gol": "Первый гол",


		"El Año Perfecto": "Идеальный год",
		"En PRIMERA y en una sola temporada: liga, copa y Champions, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de la Champions.":
			"В ВЫСШЕЙ ЛИГЕ и за один сезон: лига, кубок и Кубок элиты, плюс Игрок года, MVP и лучший бомбардир лиги, а также MVP и лучший бомбардир Кубка элиты.",
		"De la Camilla al Gol": "С носилок — в сетку",
		"Volver de una lesión grave y marcar en tu regreso.":
			"Вернуться после тяжелой травмы и забить в первом же матче.",
		"Marcar tu primer gol.": "Забить свой первый гол.",
		"Marcar rematando un córner.": "Забить после подачи углового.",
		"Marcar directo desde el córner, sin que nadie toque el balón.":
			"Забить прямым ударом с углового, чтобы мяч никто не задел.",
		"Marcar un penal picado: cambiar a modo CENTRO antes de golpear.":
			"Забить пенальти «паненкой»: перед ударом включить режим НАВЕС.",
		"Goleador": "Забивала",
		"10 goles en tu carrera.": "10 голов за карьеру.",
		"Artillero": "Снайпер",
		"50 goles en tu carrera.": "50 голов за карьеру.",
		"Centenario": "Центурион",
		"100 goles en tu carrera.": "100 голов за карьеру.",
		"Killer": "Киллер",
		"250 goles en tu carrera.": "250 голов за карьеру.",
		"Máquina de Goles": "Голевая машина",
		"500 goles en tu carrera.": "500 голов за карьеру.",
		"Asistente": "Ассистент",
		"Dar tu primera asistencia.": "Отдать первую голевую передачу.",
		"Cerebro": "Плеймейкер",
		"100 asistencias en tu carrera.": "100 голевых передач за карьеру.",
		"Doblete": "Дубль",
		"2 goles en un mismo partido.": "2 гола в одном матче.",
		"Hat-Trick": "Хет-трик",
		"3 goles en un mismo partido.": "3 гола в одном матче.",
		"4 goles en un mismo partido.": "4 гола в одном матче.",
		"Manita": "Пятерня",
		"5 goles en un mismo partido.": "5 голов в одном матче.",
		"Sangre Fría": "Хладнокровие",
		"Marcar tu primer penalti.": "Забить свой первый пенальти.",
		"Especialista de Penales": "Король пенальти",
		"25 penaltis marcados.": "25 забитых пенальти.",
		"Maestro de la Falta": "Мастер штрафных",
		"Marcar de tiro libre directo.": "Забить прямым штрафным.",
		"El Muro No Existe": "Какая стенка?",
		"10 goles de tiro libre.": "10 голов со штрафных.",
		"Jugada de Estrategia": "Стандарт по учебнику",
		"Por Debajo": "Под стенкой",
		"Marcar un tiro libre por debajo de la barrera.": "Забить штрафной под стенкой.",
		"Gol Olímpico": "Гол с углового",

		"Testarazo": "Таран",
		"Marcar de cabeza.": "Забить головой.",
		"Sin Dejarla Caer": "Не дав упасть",
		"Marcar de volea.": "Забить с лета.",
		"Chilena de Antología": "Легендарный удар через себя",
		"Marcar de chilena.": "Забить ударом через себя.",
		"Perro en la Cancha": "Собака на поле",
		"Que un perro se meta en la cancha durante un partido tuyo.":
			"Увидеть, как во время твоего матча на поле выбегает собака.",
		"Marcaste de cabeza tras un córner.": "Ты забил головой после углового.",
		"Campeón": "Чемпион",
		"Ganar tu primera liga.": "Впервые выиграть лигу.",
		"Rey de Primera": "Король высшей лиги",
		"Campeón de la máxima categoría.": "Чемпион высшей лиги.",
		"Subir de categoría.": "Подняться в лигу выше.",
		"Copa en Vitrina": "Кубок в витрине",
		"Rey de Europa": "Король Европы",
		"Ganar la Champions continental.": "Выиграть континентальный Кубок элиты.",
		"Ganar el Mundial de Clubes.": "Выиграть клубный мундиаль.",
		"Noche Europea": "Международный вечер",
		"Marcar en un partido continental.": "Забить в континентальном матче.",
		"Orgullo Nacional": "Национальная гордость",
		"Marcar con tu selección.": "Забить за свою сборную.",
		"Asistencia Internacional": "Международный ассист",
		"Dar una asistencia con tu selección.": "Отдать голевую передачу за свою сборную.",
		"Héroe Mundialista": "Герой мундиаля",
		"Marcar en el Mundial.": "Забить на мундиале.",
		"Gloria Continental": "Континентальная слава",
		"Ganar la Euro/Copa América con tu país.": "Выиграть Европейский или Южноамериканский турнир со своей сборной.",
		"Ganar el Mundial con tu selección.": "Выиграть мундиаль со своей сборной.",
		"El Mejor del Mundo": "Лучший в мире",
		"Ganar el Balón de Oro.": "Получить награду «Игрок года».",
		"Tríada Dorada": "Золотая тройка",
		"3 Balones de Oro.": "3 награды «Игрок года».",
		"El Que Te Lo Quitó": "Тот, кто отнял",
		"Quedar segundo en el Balón de Oro, justo detrás del ganador.": "Занять второе место в голосовании «Игрок года», сразу за победителем.",
		"Nivel Plata": "Серебряный уровень",
		"Llegar a ser jugador de plata: media 65 en una carrera.":
			"Стать серебряным игроком: рейтинг 65 за одну карьеру.",
		"Nivel Oro": "Золотой уровень",
		"Llegar a ser jugador de oro: media 75 en una carrera.": "Стать золотым игроком: рейтинг 75 за одну карьеру.",
		"Nivel Diamante": "Бриллиантовый уровень",
		"Llegar a ser jugador de diamante: media 85 en una carrera.":
			"Стать бриллиантовым игроком: рейтинг 85 за одну карьеру.",
		"Clase Mundial": "Мировой класс",
		"Media de habilidades de nivel élite (90).": "Средний уровень навыков — элитный (90).",
		"Actuación Perfecta": "Безупречная игра",
		"Un partido con nota 9.5 o más.": "Матч с оценкой 9.5 или выше.",
		"¿El Mejor de la Historia?": "Величайший в истории?",
		"Liga, copa, continental, Balón de Oro y goleo en una misma temporada.":
			"Лига, кубок, континентальный турнир, Игрок года и титул бомбардира в одном сезоне.",
		"Trotamundos": "Странник",
		"Ganar liga con 3 clubes distintos.": "Выиграть лигу с 3 разными клубами.",
		"El Conquistador": "Завоеватель",
		"Ganar la 1ª división de las cinco grandes: España, Inglaterra, Italia, Alemania y Francia.":
			"Выиграть высшую лигу в пяти ведущих странах: Испании, Англии, Италии, Германии и Франции.",
		"La Vuelta al Mundo": "Вокруг света",
		"Ganar la liga en 3 confederaciones distintas (Europa, América, Asia…).":
			"Выиграть лигу в 3 разных конфедерациях (Европа, Америка, Азия…).",
		"Un Solo Amor": "Одна любовь",
		"5 títulos de liga con un mismo club.": "5 титулов лиги с одним клубом.",
		"Mi Único Amor": "Человек одного клуба",
		"Diez temporadas o más en el mismo club sin fichar nunca por otro; una cesión no lo rompe.":
			"Десять сезонов и больше в одном клубе, ни разу не перейдя в другой; аренда не в счет.",
		"Uno Siempre Vuelve": "Блудный сын",
		"Volver a fichar por un club en el que ya hayas jugado antes.":
			"Снова подписать контракт с клубом, где ты уже играл.",
		"Dinastía": "Династия",
		"Ganar la liga 3 temporadas seguidas.": "Выиграть лигу 3 сезона подряд.",
		"Amo de Europa": "Властелин континента",
		"Ganar la Champions con 3 clubes distintos.": "Выиграть Кубок элиты с 3 разными клубами.",
		"Coleccionista de Títulos": "Коллекционер трофеев",







		"Ganar la Copa de Campeones continental.": "Выиграть континентальный Кубок элиты.",
		"Ganar la Euro/Torneo Sudamericano con tu país.":
			"Выиграть Европейский или Южноамериканский турнир со своей сборной.",
		"Ganar el Jugador del Año.": "Получить награду «Игрок года».",
		"3 Premios al Mejor.": "3 награды «Игрок года».",
		"Liga, copa, continental, Jugador del Año y goleo en una misma temporada.": "Лига, кубок, континентальный турнир, Игрок года и титул бомбардира в одном сезоне.",
		"Ganar la Copa de Campeones con 3 clubes distintos.": "Выиграть Кубок элиты с 3 разными клубами.",
		"Ganar los seis grandes: liga, copa, Copa de Campeones, Mundial de Clubes, continental y Mundial.":
			"Выиграть шесть главных трофеев: лигу, кубок, Кубок элиты, клубный мундиаль, континентальный турнир и мундиаль.",
		"Rey de Copa Europa": "Король Кубка Европы",
		"Ganar la Copa Europa.": "Выиграть Кубок Европы.",
		"Rey de la Copa Conferencia": "Король Кубка Челлендж",
		"Ganar la Copa Conferencia.": "Выиграть Кубок Челлендж.",
		"Ganar el Bota de la Liga.": "Стать лучшим бомбардиром лиги.",
		"Bota de la Copa de Campeones": "Лучший бомбардир Кубка элиты",
		"Ser el máximo goleador de la Copa de Campeones.": "Стать лучшим бомбардиром Кубка элиты.",
		"Bota de la Copa Europa": "Лучший бомбардир Кубка Европы",
		"Ser el máximo goleador de la Copa Europa.": "Стать лучшим бомбардиром Кубка Европы.",
		"Bota de la Copa Conferencia": "Лучший бомбардир Кубка Челлендж",
		"Ser el máximo goleador de la Copa Conferencia.": "Стать лучшим бомбардиром Кубка Челлендж.",
		"Máximo asistente de la Copa de Campeones.": "Лучший ассистент Кубка элиты.",
		"Cerebro de la Copa Europa": "Плеймейкер Кубка Европы",
		"Máximo asistente de la Copa Europa.": "Лучший ассистент Кубка Европы.",
		"Máximo goleador de tu liga Y de la Copa de Campeones en la misma temporada.": "Лучший бомбардир своей лиги И Кубка элиты в одном сезоне.",
		"Ganar los seis grandes: liga, copa, Champions, Mundial de Clubes, continental y Mundial.":
			"Выиграть шесть главных трофеев: лигу, кубок, Кубок элиты, клубный мундиаль, континентальный турнир и мундиаль.",
		"Leal de Corazón": "Верное сердце",
		"500 partidos con un mismo club.": "500 матчей за один клуб.",
		"Círculo Completo": "Полный круг",
		"Retirarte en el club donde empezaste.": "Завершить карьеру в клубе, где начинал.",
		"Hasta el Final": "До самого конца",
		"Jugar hasta el final: que el calendario te retire a ti.": "Играть до конца: пусть карьеру завершит календарь.",
		"Salir a Tiempo": "Уйти на пике",
		"El Cuerpo Dijo Basta": "Тело сказало «хватит»",
		"Que una lesión grave de veterano te retire antes de tiempo.":
			"Завершить карьеру раньше времени из-за тяжелой травмы на закате.",
		"Colgar las botas por decisión propia, antes de que te lo digan.":
			"Повесить бутсы на гвоздь по своей воле, пока тебе этого не сказали.",
		"Leyenda del Club": "Легенда клуба",
		"Entrar al top 5 de leyendas de tu club.": "Войти в топ-5 легенд своего клуба.",
		"Cara a Cara": "Лицом к лицу",
		"Entre los Grandes": "Среди великих",
		"Dejar atrás a 5 leyendas.": "Обойти 5 легенд.",
		"Nombre Propio": "Свое имя",
		"Dejar atrás a 15 leyendas.": "Обойти 15 легенд.",
		"Mejor de la Historia": "Лучший в истории",
		"Nadie en la historia hizo más goles + asistencias de élite que tú.": "Никто в истории не набрал больше элитных голов + ассистов, чем ты.",
		"Por Encima de Todos": "Выше всех",
		"En los Libros": "В анналах",
		"Batir tu primer récord histórico.": "Побить свой первый исторический рекорд.",
		"Hombre de Récords": "Рекордсмен",
		"Batir 10 récords históricos.": "Побить 10 исторических рекордов.",
		"Dejar atrás a 30 leyendas de la historia.": "Обойти 30 легенд в истории.",
		"Veterano": "Ветеран",
		"100 partidos disputados.": "100 сыгранных матчей.",
		"Inoxidable": "Несгибаемый",
		"300 partidos disputados.": "300 сыгранных матчей.",
		"Un Lustro": "Пятилетка",
		"5 temporadas completadas.": "5 завершенных сезонов.",
		"Una Década": "Десятилетие",
		"10 temporadas completadas.": "10 завершенных сезонов.",
		"Leyenda": "Легенда",
		"Alcanzar el escalón LEYENDA.": "Достичь ступени ЛЕГЕНДА.",
		"Inmortal": "Титан",
		"Alcanzar el escalón INMORTAL.": "Достичь ступени ТИТАН.",
		"Curtido en la Cantera": "Школа жизни",
		"Completar una temporada entera en Tercera División.": "Отыграть целый сезон в третьей лиге.",
		"Veterano de Segunda": "Ветеран второй лиги",
		"Completar una temporada entera en Segunda División.": "Отыграть целый сезон во второй лиге.",
		"Bautizo en Primera": "Крещение высшей лигой",
		"Completar una temporada entera en Primera División.": "Отыграть целый сезон в высшей лиге.",
		"Rey de Europa League": "Король Кубка Европы",
		"Ganar la Europa League.": "Выиграть Кубок Европы.",
		"Pichichi": "Король голов",
		"Ganar el Pichichi de la Liga.": "Стать лучшим бомбардиром лиги.",
		"bota_championsBota de la Champions": "Лучший бомбардир Кубка элиты",
		"Ser el máximo goleador de la Champions.": "Стать лучшим бомбардиром Кубка элиты.",
		"bota_europaBota de la Europa League": "Лучший бомбардир Кубка Европы",
		"Ser el máximo goleador de la Europa League.": "Стать лучшим бомбардиром Кубка Европы.",
		"Cerebro de la Liga": "Плеймейкер лиги",
		"Máximo asistente de la Liga.": "Лучший ассистент лиги.",
		"Cerebro de Europa": "Плеймейкер Кубка элиты",
		"Máximo asistente de la Champions.": "Лучший ассистент Кубка элиты.",
		"nombre del logro max_asist_eulCerebro de la Europa League": "Плеймейкер Кубка Европы",
		"Máximo asistente de la Europa League.": "Лучший ассистент Кубка Европы.",
		"COLISIÓN: misma clave ya existe en el dominio 'match' (trofeos) con este MISMO"
		+ " valor; se repite idéntica a propósitoBota de Oro del Mundial":
			"Лучший бомбардир мундиаля",
		"Máximo goleador del Mundial con tu selección.":
			"Лучший бомбардир мундиаля в составе своей сборной.",
		"Killer de la Liga": "Киллер лиги",
		"Ganar 3 veces el trofeo de máximo goleador de tu liga.": "3 раза выиграть приз лучшему бомбардиру своей лиги.",
		"'dueño del área' -> quien manda dentro del área; 'BOX' es el área en inglés"
		+ " británicoDueño del Area":
			"Хозяин штрафной",
		"Ganar 5 veces el trofeo de máximo goleador de tu liga.": "5 раз выиграть приз лучшему бомбардиру своей лиги.",
		"El Que Reparte": "Снабженец",
		"Ganar 3 veces el trofeo de máximo asistente de tu liga.": "3 раза выиграть приз лучшему ассистенту своей лиги.",
		"Goleador Sin Fronteras": "Бомбардир без границ",
		"Ser máximo goleador de la liga en 2 países distintos.":
			"Стать лучшим бомбардиром лиги в 2 разных странах.",
		"el chiste: el gol se entiende en cualquier idiomaEl Gol No Entiende de"
		+ " Idiomas":
			"Голу не нужен переводчик",
		"Ser máximo goleador de la liga en 3 países distintos.":
			"Стать лучшим бомбардиром лиги в 3 разных странах.",
		"cabeza de ambas tablas (goles y asistencias); 'Goals & Assists' no cabe en 13"
		+ " caracteresGoles y Pases":
			"Голы и пасы",
		"Máximo goleador Y máximo asistente de tu liga en la misma temporada.":
			"Лучший бомбардир И лучший ассистент своей лиги в одном сезоне.",
		"Nadie Marca Más": "Никто не забивает больше",
		"Máximo goleador de tu liga Y de la Champions en la misma temporada.":
			"Лучший бомбардир своей лиги И Кубка элиты в одном сезоне.",
		"Estrella del Partido": "Звезда матча",
		"Ser elegido Jugador del Partido.": "Стать игроком матча.",
		"jugador_mesJugador del Mes": "Игрок месяца",
		"Ganar el Jugador del Mes.": "Стать игроком месяца.",
		"Verdugo de España": "Гроза Испании",
		"Vencer a todos los clubes de España (las tres divisiones).":
			"Обыграть все клубы Испании (все три дивизиона).",
		"Verdugo de Inglaterra": "Гроза Англии",
		"Vencer a todos los clubes de Inglaterra (las tres divisiones).":
			"Обыграть все клубы Англии (все три дивизиона).",
		"Verdugo de Italia": "Гроза Италии",
		"Vencer a todos los clubes de Italia (las tres divisiones).":
			"Обыграть все клубы Италии (все три дивизиона).",
		"Verdugo de Alemania": "Гроза Германии",
		"Vencer a todos los clubes de Alemania (las tres divisiones).":
			"Обыграть все клубы Германии (все три дивизиона).",
		"Verdugo de Francia": "Гроза Франции",
		"Vencer a todos los clubes de Francia (las tres divisiones).":
			"Обыграть все клубы Франции (все три дивизиона).",
		"Verdugo de Portugal": "Гроза Португалии",
		"Vencer a todos los clubes de Portugal (las tres divisiones).":
			"Обыграть все клубы Португалии (все три дивизиона).",
		"'Holland' porque 'the Netherlands' se pasa del ancho del español en la fila"
		+ " del logroVerdugo de Países Bajos":
			"Гроза Нидерландов",
		"Vencer a todos los clubes de Países Bajos (las tres divisiones).":
			"Обыграть все клубы Нидерландов (все три дивизиона).",
		"Verdugo de Bélgica": "Гроза Бельгии",
		"Vencer a todos los clubes de Bélgica (las tres divisiones).":
			"Обыграть все клубы Бельгии (все три дивизиона).",
		"Verdugo de Turquía": "Гроза Турции",
		"Vencer a todos los clubes de Turquía (las tres divisiones).":
			"Обыграть все клубы Турции (все три дивизиона).",
		"Verdugo de Argentina": "Гроза Аргентины",
		"Vencer a todos los clubes de Argentina (las tres divisiones).":
			"Обыграть все клубы Аргентины (все три дивизиона).",
		"Verdugo de Brasil": "Гроза Бразилии",
		"Vencer a todos los clubes de Brasil (las tres divisiones).":
			"Обыграть все клубы Бразилии (все три дивизиона).",
		"Verdugo de México": "Гроза Мексики",
		"Vencer a todos los clubes de México (las tres divisiones).":
			"Обыграть все клубы Мексики (все три дивизиона).",
		"Verdugo de Estados Unidos": "Гроза США",
		"Vencer a todos los clubes de Estados Unidos (las tres divisiones).":
			"Обыграть все клубы США (все три дивизиона).",
		"Verdugo de Arabia Saudí": "Гроза Саудовской Аравии",
		"Vencer a todos los clubes de Arabia Saudí (las tres divisiones).":
			"Обыграть все клубы Саудовской Аравии (все три дивизиона).",

		"Verdugo de Escocia": "Гроза Шотландии",
		"Vencer a todos los clubes de Escocia (las tres divisiones).":
			"Обыграть все клубы Шотландии (все три дивизиона).",
		"Verdugo de Grecia": "Гроза Греции",
		"Vencer a todos los clubes de Grecia (las tres divisiones).":
			"Обыграть все клубы Греции (все три дивизиона).",
		"Verdugo de Ucrania": "Гроза Украины",
		"Vencer a todos los clubes de Ucrania (las tres divisiones).":
			"Обыграть все клубы Украины (все три дивизиона).",
		"Verdugo de Austria": "Гроза Австрии",
		"Vencer a todos los clubes de Austria (las tres divisiones).":
			"Обыграть все клубы Австрии (все три дивизиона).",
		"Verdugo de Suiza": "Гроза Швейцарии",
		"Vencer a todos los clubes de Suiza (las tres divisiones).":
			"Обыграть все клубы Швейцарии (все три дивизиона).",
		"Verdugo de Chequia": "Гроза Чехии",
		"Vencer a todos los clubes de Chequia (las tres divisiones).":
			"Обыграть все клубы Чехии (все три дивизиона).",
		"Verdugo de Croacia": "Гроза Хорватии",
		"Vencer a todos los clubes de Croacia (las tres divisiones).":
			"Обыграть все клубы Хорватии (все три дивизиона).",
		"Verdugo de Serbia": "Гроза Сербии",
		"Vencer a todos los clubes de Serbia (las tres divisiones).":
			"Обыграть все клубы Сербии (все три дивизиона).",
		"Verdugo de Dinamarca": "Гроза Дании",
		"Vencer a todos los clubes de Dinamarca (las tres divisiones).":
			"Обыграть все клубы Дании (все три дивизиона).",
		"Verdugo de Noruega": "Гроза Норвегии",
		"Vencer a todos los clubes de Noruega (las tres divisiones).":
			"Обыграть все клубы Норвегии (все три дивизиона).",
		"Verdugo de Japón": "Гроза Японии",
		"Vencer a todos los clubes de Japón (las tres divisiones).":
			"Обыграть все клубы Японии (все три дивизиона).",
		"Verdugo de Corea del Sur": "Гроза Южной Кореи",
		"Vencer a todos los clubes de Corea del Sur (las tres divisiones).":
			"Обыграть все клубы Южной Кореи (все три дивизиона).",
		"Verdugo de Colombia": "Гроза Колумбии",
		"Vencer a todos los clubes de Colombia (las tres divisiones).":
			"Обыграть все клубы Колумбии (все три дивизиона).",
		"Verdugo de Chile": "Гроза Чили",
		"Vencer a todos los clubes de Chile (las tres divisiones).":
			"Обыграть все клубы Чили (все три дивизиона).",
		"Verdugo de Uruguay": "Гроза Уругвая",
		"Vencer a todos los clubes de Uruguay (las tres divisiones).":
			"Обыграть все клубы Уругвая (все три дивизиона).",
		"Verdugo de Paraguay": "Гроза Парагвая",
		"Vencer a todos los clubes de Paraguay (las tres divisiones).":
			"Обыграть все клубы Парагвая (все три дивизиона).",
		"Verdugo de Ecuador": "Гроза Эквадора",
		"Vencer a todos los clubes de Ecuador (las tres divisiones).":
			"Обыграть все клубы Эквадора (все три дивизиона).",
		"Verdugo de Perú": "Гроза Перу",
		"Vencer a todos los clubes de Perú (las tres divisiones).":
			"Обыграть все клубы Перу (все три дивизиона).",
		"Verdugo de Bolivia": "Гроза Боливии",
		"Vencer a todos los clubes de Bolivia (las tres divisiones).":
			"Обыграть все клубы Боливии (все три дивизиона).",
		"Verdugo de Venezuela": "Гроза Венесуэлы",
		"Vencer a todos los clubes de Venezuela (las tres divisiones).":
			"Обыграть все клубы Венесуэлы (все три дивизиона).",
		"Verdugo de Egipto": "Гроза Египта",
		"Vencer a todos los clubes de Egipto (las tres divisiones).":
			"Обыграть все клубы Египта (все три дивизиона).",
		"Verdugo de Marruecos": "Гроза Марокко",
		"Vencer a todos los clubes de Marruecos (las tres divisiones).":
			"Обыграть все клубы Марокко (все три дивизиона).",
		"Verdugo de Túnez": "Гроза Туниса",
		"Vencer a todos los clubes de Túnez (las tres divisiones).":
			"Обыграть все клубы Туниса (все три дивизиона).",
		"Verdugo de Nueva Zelanda": "Гроза Новой Зеландии",
		"Vencer a todos los clubes de Nueva Zelanda (las tres divisiones).":
			"Обыграть все клубы Новой Зеландии (все три дивизиона).",
		"Némesis del Mundo": "Гроза всего мира",
		"Vencer a TODOS los clubes del juego: cada liga, cada división. La cima del hardcore.":
			"Обыграть ВСЕ клубы игры: во всех лигах и во всех дивизионах. Вершина хардкора.",
		"Nuevo Fichaje": "Новое приобретение",
		"Ser presentado ante tu nueva afición por primera vez.": "Впервые предстать перед новыми болельщиками.",
		"Diez Mil Curiosos": "Десять тысяч зевак",
		"10.000 personas fueron a tu presentación.":
			"10 000 человек пришли на твою презентацию.",
		"No Cabe Un Alma": "Яблоку негде упасть",
		"Llenar el estadio el día de tu presentación, sin haber jugado un solo minuto.":
			"Заполнить стадион в день своей презентации, не сыграв ни минуты.",
		"'Forty Thousand' (14) se pasa del español (12); el número mantiene el"
		+ " anchoCuarenta Mil":
			"Сорок тысяч",
		"40.000 personas fueron a verte firmar.": "40 000 человек пришли посмотреть, как ты подписываешь контракт.",
		"Fichaje Galáctico": "Галактический трансфер",
		"Que 65.000 personas vayan a tu presentación. Dejar de ser un jugador para ser una noticia.":
			"Собрать 65 000 человек на свою презентацию. Перестать быть просто игроком и стать главной новостью.",
		"Ochenta Mil Almas": "80 000 душ",
		"Que 80.000 personas llenen el estadio SÓLO para verte llegar. Ni un partido, ni un gol: tu nombre.":
			"Собрать полный стадион, 80 000 человек, ТОЛЬКО ради твоего приезда. Ни матча, ни гола: только твое имя.",
		"Siempre Te Esperan": "Тебя всегда ждут",
		"Llenar el estadio en TRES presentaciones distintas.": "Заполнить стадион на ТРЕХ разных презентациях.",


		"Rompelíneas": "Разрушитель линий",
		"Ganar tu primer regate.": "Провести первый успешный дриблинг.",
		"Bailarín": "Танцор",
		"25 regates ganados.": "25 успешных дриблингов.",
		"Imparable": "Неудержимый",
		"100 regates ganados.": "100 успешных дриблингов.",
		"Agónico": "На последних минутах",
		"Marcar en el minuto 85 o después.": "Забить на 85-й минуте или позже.",
		"Rey del Descuento": "Король концовок",
		"10 goles del minuto 85 en adelante.": "10 голов с 85-й минуты и позже.",
		"Noche de Remontada": "Вечер камбэка",
		"Ganar un partido en el que llegues a ir perdiendo por 2 goles.":
			"Выиграть матч, в котором твоя команда уступала в 2 мяча.",
		"Orgullo de la Ciudad": "Гордость города",
		"Ganar tu primer derbi.": "Выиграть свое первое дерби.",
		"El Gol que Vale Doble": "Гол, который стоит двух",
		"Marcar en un derbi.": "Забить в дерби.",
		"Rey del Derbi": "Король дерби",
		"Ganar 5 derbis.": "Выиграть 5 дерби.",
		"Millonario": "Миллионер",
		"Juntar 1.000.000 en el banco.": "Накопить 1 000 000 на счету.",
		"Magnate": "Магнат",
		"Juntar 10.000.000 en el banco.": "Накопить 10 000 000 на счету.",
		"Imagen de Marca": "Лицо бренда",
		"Firmar tu primer contrato de patrocinio.": "Подписать первый спонсорский контракт.",
		"Hombre Anuncio": "Человек-реклама",
		"Firmar 10 contratos de patrocinio.": "Подписать 10 спонсорских контрактов.",
		"Vida de Futbolista": "Жизнь футболиста",
		"Comprar tu primer artículo de estilo de vida.": "Сделать первую покупку для красивой жизни.",
		"Inversor": "Инвестор",
		"Hacer tu primera inversión.": "Сделать первую инвестицию.",
		"Hombre del Vestuario": "Душа раздевалки",
		"Responder 25 decisiones.": "Принять 25 решений.",
		"La Voz del Equipo": "Голос команды",
		"Responder 100 decisiones.": "Принять 100 решений.",
		"Vía Bosman": "Путь Босмана",
		"Firmar por un club siendo agente libre, sin traspaso de por medio.":
			"Перейти в клуб свободным агентом, без трансферной суммы.",
		"Nunca te Enamores de un Cedido": "Не влюбляйся в арендованного",
		"Ser elegido Mejor Jugador del Club en el equipo donde juegas cedido.": "Стать лучшим игроком сезона в клубе, где ты в аренде.",
		"Ida y Vuelta": "Туда и обратно",
		"Completar una cesión entera y volver a tu club.": "Провести в аренде весь срок и вернуться в свой клуб.",
		"Pasaporte Sellado": "Штамп в паспорте",
		"Jugar en clubes de 3 países distintos.": "Поиграть за клубы из 3 разных стран.",
		"Ciudadano del Mundo": "Гражданин мира",
		"Jugar en clubes de 5 países distintos.": "Поиграть за клубы из 5 разных стран.",
		"Segunda Vida": "Вторая жизнь",
		"Cerrar una carrera entera (hasta el retiro) con un modificador de Nueva Carrera+ activo.":
			"Пройти всю карьеру (до завершения) с активным модификатором Новой карьеры+.",
		"Primera Vitrina": "Первая витрина",
		"Desbloquear todos los logros comunes.": "Открыть все обычные достижения.",
		"Vitrina Azul": "Синяя витрина",
		"Desbloquear todos los logros raros.": "Открыть все редкие достижения.",
		"título (sale en 2 entradas: entrevista y plato_o_descanso)TE QUIEREN EN EL"
		+ " PLATÓ":
			"ТЕБЯ ЗОВУТ НА ТВ",
		"La televisión te invita a la entrevista de la semana. Media tarde de foco,"
		+ " preguntas y sonrisas.":
			"Телевидение зовет тебя на главное интервью недели. Полдня под софитами, вопросы и улыбки.",
		"ACUDIR": "ИДУ",
		"PLANTARLES": "НЕ ПРИЙТИ",
		"ACTO DE TU PATROCINADOR": "МЕРОПРИЯТИЕ СПОНСОРА",
		"Tu marca monta una firma de autógrafos y te quiere ahí. Pagan aparte, pero es"
		+ " un día entero.":
			"Твой спонсор устраивает автограф-сессию и хочет видеть тебя там. Платят отдельно, но это целый день.",
		"IR AL ACTO": "ПОЕХАТЬ",
		"también en benefico_ciudad (línea 276, fuera de mi rango)EXCUSARTE":
			"ОТКАЗ",

		"LA HUELGA DE PRIMAS": "БУНТ ИЗ-ЗА БОНУСОВ",
		"El club debe tres meses de primas y la plantilla ha decidido no salir a"
		+ " calentar. El míster está en el túnel mirando el reloj, y hay una cámara en"
		+ " la boca del vestuario.":
			"Клуб задолжал бонусы за три месяца, и команда решила не выходить на разминку. Тренер стоит в туннеле и смотрит на часы, а у входа в раздевалку — камера.",
		"SUMARTE AL PARO": "ПОДДЕРЖАТЬ БУНТ",
		"SALIR A CALENTAR SOLO": "РАЗМЯТЬСЯ ОДНОМУ",
		"LA FINAL ES EL SÁBADO": "ФИНАЛ В СУББОТУ",
		"El parte médico dice que no llegas. El míster te lo pide a la cara, delante"
		+ " del cuerpo técnico, y el doctor niega con la cabeza sin decir nada.":
			"Медики говорят, что ты не успеешь. Тренер, глядя в глаза, просит тебя сыграть при всем штабе, а доктор молча качает головой.",
		"APRETAR LOS DIENTES": "СТИСНУТЬ ЗУБЫ",
		"HACERLE CASO AL MÉDICO": "ПОСЛУШАТЬ ВРАЧА",
		"Aguantaste: estás disponible para el partido grande.":
			"Ты выдержал: готов к большому матчу.",
		"Se rompió del todo. La baja es larga.":
			"Порвалось окончательно. Выбываешь надолго.",
		"EL EQUIPO VIAJA SIN TI": "КОМАНДА ЕДЕТ БЕЗ ТЕБЯ",
		"El autobús sale a las nueve y tu nombre no está en la lista. El doctor dice"
		+ " que el viaje no te hace bien; el vestuario, que verte en el banquillo les"
		+ " hace bien a ellos.":
			"Автобус уходит в девять, а твоего имени в списке нет. Доктор говорит, что поездка тебе не на пользу; раздевалка — что им на пользу видеть тебя на скамейке.",
		"VIAJAR CON LA EXPEDICIÓN": "ЕХАТЬ С КОМАНДОЙ",
		"QUEDARTE EN REHABILITACIÓN": "ОСТАТЬСЯ НА РЕАБИЛИТАЦИИ",
		"EL PARTE QUE SE FILTRÓ": "СЛИТЫЙ ДИАГНОЗ",
		"Un diario publica tu parte médico con dos semanas de más y un titular con la"
		+ " palabra «calvario». El club no fue; alguien de dentro, sí.":
			"Газета публикует твой диагноз с двумя лишними неделями и заголовком со словом «голгофа». Слил не клуб, а кто-то изнутри.",
		"DESMENTIRLO A CÁMARA": "ОПРОВЕРГНУТЬ В ЭФИРЕ",
		"CALLAR Y RECUPERARTE": "МОЛЧАТЬ И ЛЕЧИТЬСЯ",
		"EL MÉDICO DE TU AGENTE": "ВРАЧ ТВОЕГО АГЕНТА",
		"Tu agente te manda la tarjeta de un doctor «que hace milagros» y que no es"
		+ " del club. El médico del club no sabe nada, y mejor que siga así.":
			"Агент присылает тебе визитку доктора, «который творит чудеса» и не работает на клуб. Клубный врач ничего не знает, и пусть так и остается.",
		"PROBAR EL TRATAMIENTO": "ПОПРОБОВАТЬ ЛЕЧЕНИЕ",
		"CONFIAR EN EL CLUB": "ДОВЕРИТЬСЯ КЛУБУ",
		"El milagro existe: dos semanas menos de baja.":
			"Чудо случилось: на две недели меньше вне игры.",
		"Se rompió del todo. Y el club se enteró de dónde.":
			"Порвалось окончательно. И клуб узнал, где ты лечился.",
		"CABE UNO MÁS SI TE BAJAS": "ЕЩЕ ОДИН — ЕСЛИ УРЕЖЕШЬ ЗАРПЛАТУ",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la nómina: el"
		+ " tuyo. Te piden por las buenas un 20% de tu ficha, y el vestuario ya sabe"
		+ " que te lo han pedido.":
			"Клуб почти договорился с суперзвездой, и не хватает только места в зарплатном фонде — твоего. Тебя по-хорошему просят отказаться от 20% зарплаты, а раздевалка уже знает об этой просьбе.",
		"BAJARTE EL SUELDO": "УРЕЗАТЬ ЗАРПЛАТУ",
		"NI UN PESO": "НИ КОПЕЙКИ",
		"Te bajas la ficha": "Ты урезал себе зарплату",
		"Cobrarás ${0} por partido en vez de ${1}. El club ya tiene su hueco.":
			"Будешь получать ${0} за матч вместо ${1}. Место в бюджете клуба освободилось.",
		"EL BANDO DEL BRAZALETE": "БИТВА ЗА ПОВЯЗКУ",
		"{0} está señalado y el vestuario busca relevo. Suenan dos nombres: el tuyo y"
		+ " el del veterano que lleva once años aquí.":
			"{0} под огнем критики, и раздевалка ищет замену. Звучат два имени: твое и ветерана, который здесь уже одиннадцать лет.",


		"MOVER FICHA POR EL BRAZALETE": "ПОБОРОТЬСЯ ЗА ПОВЯЗКУ",
		"LA ENTRADA EN EL ENTRENO": "ПОДКАТ НА ТРЕНИРОВКЕ",
		"Fuiste a por un balón que no era tuyo y {0}, el que te disputa el puesto, se"
		+ " ha ido al vestuario cojeando y sin mirarte. El grupo lo vio todo.":
			"Ты полез за чужим мячом, и {0}, твой конкурент за место в составе, ушел в раздевалку, прихрамывая и не глядя на тебя. Вся команда это видела.",
		"PEDIR PERDÓN DELANTE DE TODOS": "ИЗВИНИТЬСЯ ПРИ ВСЕХ",
		"NO DAR EXPLICACIONES": "НИЧЕГО НЕ ОБЪЯСНЯТЬ",
		"EL CHAVAL TE COMIÓ EL PUESTO": "ПАЦАН ЗАНЯЛ ТВОЕ МЕСТО",
		"{0} entró por ti y volvió a hacerlo bien. Te busca al acabar para que le"
		+ " corrijas dos cosas del perfil de tiro. Enseñárselas es enseñárselas.":
			"{0} вышел вместо тебя и снова сыграл хорошо. После матча он подходит, чтобы ты поправил ему пару вещей в ударе. Научить его — значит вооружить.",

		"SE ROMPIÓ EL QUE TE PELEA EL PUESTO": "ТВОЙ КОНКУРЕНТ ТРАВМИРОВАН",
		"{0} se rompió en el entreno y el puesto es tuyo hasta nuevo aviso. El vestuario mira a ver qué cara pones.":
			"{0} травмировался на тренировке, и место твое до особого распоряжения. Раздевалка смотрит, как ты на это отреагируешь.",
		"LLEVARLE LA REHABILITACIÓN": "ПОМОЧЬ ЕМУ С РЕАБИЛИТАЦИЕЙ",
		"APROVECHAR EL HUECO": "ЛОВИТЬ МОМЕНТ",
		"EL CAPITÁN TE SIENTA": "РАЗГОВОР С КАПИТАНОМ",
		"{0} te aparta antes del entreno con el brazalete en la mano: dice que el grupo"
		+ " está harto de tu forma de celebrar, y que te lo dice él antes de que te lo"
		+ " diga otro.":
			"{0} отводит тебя в сторону перед тренировкой с повязкой в руке: команде надоели твои празднования, и он хочет сказать это сам, пока не сказал кто-то другой.",
		"BAJAR LA CABEZA": "ПРИНЯТЬ КРИТИКУ",
		"CONTESTARLE DELANTE DE TODOS": "ОТВЕТИТЬ ЕМУ ПРИ ВСЕХ",

		"LA VUELTA AL CAMPO": "КРУГ ПОЧЕТА",
		"Campeón. La copa pesa de verdad y el estadio no se va a ir a ninguna parte."
		+ " Queda una vuelta al campo y todos esperan que se la des a alguien.":
			"Чемпион. Кубок по-настоящему тяжелый, а стадион никуда не уходит. Остался круг почета, и все ждут, что ты кому-то его посвятишь.",
		"LEVANTARLA ANTE EL FONDO": "ПОДНЯТЬ ПЕРЕД ФАНАМИ",
		"QUE LA LEVANTE EL GRUPO": "ПУСТЬ ПОДНИМЕТ КОМАНДА",
		"LLEVÁRSELA AL MÍSTER": "ОТНЕСТИ ТРЕНЕРУ",
		"LA CIUDAD ESTÁ EN LA CALLE": "ВЕСЬ ГОРОД НА УЛИЦАХ",
		"Ascenso. Hay gente en la avenida desde antes de que acabara el partido, un"
		+ " autobús descapotable esperando y un micrófono que va a llegar a todas"
		+ " las casas.":
			"Повышение. Люди заполнили проспект еще до финального свистка, ждет открытый автобус и микрофон, который услышат в каждом доме.",
		"PROMETER QUE TE QUEDAS": "ПООБЕЩАТЬ ОСТАТЬСЯ",
		"NOMBRAR UNO A UNO AL VESTUARIO": "НАЗВАТЬ ВСЕХ ПО ИМЕНАМ",
		"PEDIR REFUERZOS EN DIRECTO": "ПОПРОСИТЬ УСИЛЕНИЯ В ЭФИРЕ",
		"EL MEJOR DEL MUNDO": "ЛУЧШИЙ В МИРЕ",
		"Jugador del Año. Estás de pie con el trofeo en la mano, la sala en silencio y"
		+ " treinta segundos que se van a repetir el resto de tu carrera.":
			"Игрок года. Ты стоишь с трофеем в руке, в зале тишина, и эти тридцать секунд будут крутить до конца твоей карьеры.",
		"A LOS QUE TE PASAN EL BALÓN": "ТЕМ, КТО ОТДАЕТ МНЕ ПАСЫ",
		"A LA GENTE QUE TE VIO EMPEZAR": "ТЕМ, КТО ВИДЕЛ, КАК Я НАЧИНАЛ",
		"AL CAMINO QUE TE TRAJO AQUÍ": "ДОРОГЕ, ЧТО ПРИВЕЛА МЕНЯ СЮДА",
		"EL MEJOR DE LA TEMPORADA": "ЛУЧШИЙ ИГРОК СЕЗОНА",
		"Te dan el premio al mejor del año y hay que decir algo. La sala está llena"
		+ " de gente que decide cosas sobre ti: tu club, tu competición y los que"
		+ " escriben.":
			"Тебе вручают приз лучшему игроку года, и надо что-то сказать. Зал полон людей, которые решают твою судьбу: твой клуб, твой турнир и те, кто пишет.",
		"HABLAR DEL EQUIPO QUE TE SOSTUVO": "СКАЗАТЬ О СВОЕЙ КОМАНДЕ",
		"AGRADECER AL MÍSTER QUE TE PUSO": "ПОБЛАГОДАРИТЬ ТРЕНЕРА",
		"DEDICÁRSELO A LA GRADA": "ПОСВЯТИТЬ ТРИБУНАМ",

		"LA CIUDAD ES TUYA": "ГОРОД ТВОЙ",
		"Ganasteis el derbi. Hay gente esperando el autobús en la puerta, esta vez"
		+ " para llevaros en volandas, y mañana no se va a hablar de otra cosa en"
		+ " toda la ciudad.":
			"Вы выиграли дерби. У выхода люди ждут автобус, на этот раз чтобы носить вас на руках, и завтра весь город будет говорить только об этом.",
		"CELEBRARLO EN LA VALLA": "ОТПРАЗДНОВАТЬ С ФАНАМИ",
		"DECIR QUE SÓLO SON TRES PUNTOS": "ЭТО ВСЕГО ТРИ ОЧКА",
		"DEDICÁRSELO AL VESTUARIO": "ПОСВЯТИТЬ РАЗДЕВАЛКЕ",


		"selección": "сборная",
		"competidor": "конкурент",
		"TU PRIMERA VEZ CON TU PAÍS": "ПЕРВЫЙ МАТЧ ЗА СБОРНУЮ",
		"Debutaste con la selección. En el túnel te esperan la cámara de tu país y el"
		+ " utillero con la camiseta del partido, que se guarda o se regala.":
			"Ты дебютировал за сборную. В туннеле ждут камера твоей страны и администратор с игровой футболкой — оставить ее себе или подарить.",
		"ENMARCARLA PARA TU FAMILIA": "В РАМКУ ДЛЯ СЕМЬИ",
		"REGALÁRSELA AL SELECCIONADOR": "ПОДАРИТЬ ТРЕНЕРУ",
		"SUBIRLA A TUS REDES": "ВЫЛОЖИТЬ В СОЦСЕТИ",
		"EL SELECCIONADOR TE APARTA": "РАЗГОВОР С ТРЕНЕРОМ СБОРНОЙ",
		"Al acabar te lleva a un lado, lejos del grupo. Puedes escuchar lo que tenga"
		+ " que decirte, o aprovechar los dos minutos para pedirle el puesto de"
		+ " titular.":
			"После матча он отводит тебя в сторону, подальше от остальных. Можешь выслушать, что он скажет, или использовать эти две минуты, чтобы попросить место в основе.",
		"ESCUCHAR Y CALLAR": "СЛУШАТЬ И МОЛЧАТЬ",
		"PEDIRLE EL PUESTO": "ПОПРОСИТЬ МЕСТО",
		"Le gustó tu descaro: cuenta contigo.": "Ему понравилась твоя дерзость: он на тебя рассчитывает.",
		"No era el momento ni el sitio. Tomó nota.":
			"Не время и не место. Он это запомнил.",
		"TU CLUB TE RECLAMA": "КЛУБ ТРЕБУЕТ ВЕРНУТЬСЯ",
		"Tu club llamó a la federación: quieren que vuelvas en el primer vuelo y te"
		+ " saltes el segundo partido. El seleccionador te deja elegir a ti, que es la"
		+ " peor parte.":
			"Твой клуб позвонил в федерацию: тебя хотят видеть на первом же рейсе домой, без второго матча. Тренер сборной оставляет выбор за тобой, и это хуже всего.",
		"VOLVER AL CLUB": "ВЕРНУТЬСЯ В КЛУБ",
		"QUEDARTE CON TU PAÍS": "ОСТАТЬСЯ В СБОРНОЙ",
		"MARCASTE CON TU PAÍS": "ГОЛ ЗА СБОРНУЮ",
		"Gol con la camiseta de tu selección y un micrófono de tu país esperándote. Se"
		+ " puede repartir de tres maneras, y las tres se oyen en tu casa.":
			"Гол в футболке сборной, а тебя ждет микрофон с родины. Посвятить его можно тремя способами, и все три услышат у тебя дома.",
		"AL PAÍS QUE TE VIO NACER": "СТРАНЕ, ГДЕ Я РОДИЛСЯ",
		"AL SELECCIONADOR QUE TE LLAMÓ": "ТРЕНЕРУ, КОТОРЫЙ МЕНЯ ВЫЗВАЛ",
		"AL CLUB QUE TE PAGA": "КЛУБУ, КОТОРЫЙ МНЕ ПЛАТИТ",
		"LA PRENSA DE TU PAÍS": "ПРЕССА НА РОДИНЕ",
		"Perdisteis y el país entero pide explicaciones. Te esperan en zona mixta con"
		+ " la pregunta ya escrita: quién tuvo la culpa.":
			"Вы проиграли, и вся страна требует объяснений. В микст-зоне тебя ждут с уже готовым вопросом: кто виноват.",
		"DAR LA CARA POR EL GRUPO": "ЗАСТУПИТЬСЯ ЗА КОМАНДУ",
		"DECIR QUE TÚ CUMPLISTE": "Я СВОЕ СДЕЛАЛ",
		"NOVENTA MINUTOS MIRANDO": "90 МИНУТ НА СКАМЕЙКЕ",
		"Viajaste medio mundo para calentar dos veces y volver a sentarte. Tu agente"
		+ " quiere que se sepa; el segundo entrenador te ha visto la cara desde el"
		+ " banquillo.":
			"Ты пролетел полмира, чтобы дважды размяться и снова сесть. Агент хочет, чтобы об этом узнали; второй тренер со скамейки видел твое лицо.",
		"APLAUDIR DESDE EL BANCO": "ХЛОПАТЬ СО СКАМЕЙКИ",
		"QUE SE ENTERE TU AGENTE": "ПУСТЬ ГОВОРИТ АГЕНТ",
		"AYUDARLE": "ПОМОЧЬ",
		"CERRARLE LA PUERTA": "ОТКАЗАТЬ",
		"LA CAMISETA DEL RIVAL": "ФУТБОЛКА СОПЕРНИКА",
		"Su estrella se acerca en el túnel y te ofrece cambiar camisetas. Hay veinte"
		+ " cámaras esperando el gesto, y la grada de tu fondo sigue ahí arriba.":
			"Их звезда подходит к тебе в туннеле и предлагает обменяться футболками. Двадцать камер ждут этого жеста, а твой фан-сектор все еще наверху.",
		"CAMBIARLA DELANTE DE TODOS": "ОБМЕНЯТЬСЯ ПРИ ВСЕХ",
		"DEJARLE CON LA MANO TENDIDA": "ОСТАВИТЬ С ПРОТЯНУТОЙ РУКОЙ",








		"ALGUIEN EN LA MESA DE AL LADO": "КТО-ТО ЗА СОСЕДНИМ СТОЛИКОМ",
		"Cena del club, y la conversación de tu mesa lleva una hora girando"
		+ " alrededor de {0}. Te está mirando desde hace rato.":
			"Ужин в клубе, и весь твой стол уже час говорит только об одной девушке. Ее зовут {0}, и она давно поглядывает на тебя.",
		"ACERCARTE": "ПОДОЙТИ",







		"TE LA QUIEREN PRESENTAR": "ХОТЯТ ВАС ПОЗНАКОМИТЬ",
		"Un compañero insiste toda la semana: {0} es amiga de su mujer y ya le"
		+ " habló de ti. Sólo tienes que decir que sí.":
			"Партнер по команде всю неделю не отстает: {0} — подруга его жены и уже наслышана о тебе. Тебе осталось только согласиться.",
		"QUE SEA EL SÁBADO": "ДАВАЙ В СУББОТУ",
		"NO ESTÁS PARA ESO": "НЕ ДО ЭТОГО",
		"TE ESPERABA EN LA PUERTA": "ОНА ЖДАЛА У ВЫХОДА",
		"LA INAUGURACIÓN": "ВЕРНИСАЖ",
		"Tu marca te lleva a la inauguración de una exposición y no entiendes ni uno de los"
		+ " cuadros. {0} lleva veinte minutos delante del mismo, y acaba de darse cuenta"
		+ " de que la miras a ella.":
			"Спонсор ведет тебя на открытие выставки, и ты не понимаешь ни одной картины. {0} уже двадцать минут стоит перед одной и той же — и только что заметила, что ты смотришь на нее.",
		"PREGUNTARLE QUÉ VE": "СПРОСИТЬ О КАРТИНЕ",
		"VOLVER CON LOS TUYOS": "ВЕРНУТЬСЯ К СВОИМ",
		"{0} llevaba dos horas en la puerta de jugadores. No traía camiseta que"
		+ " firmar: traía su número escrito en un papel.":
			"{0} два часа простояла у выхода для игроков. Футболку на подпись она не принесла — принесла свой номер на клочке бумаги.",
		"GUARDARTE EL PAPEL": "ВЗЯТЬ ЗАПИСКУ",
		"SUBIR AL AUTOBÚS": "СЕСТЬ В АВТОБУС",
		"LA LLAVE DE TU CASA": "КЛЮЧ ОТ ТВОЕГО ДОМА",
		"{0} lleva media semana durmiendo aquí y sus cosas ya ocupan un cajón."
		+ " Alguien tiene que decirlo en voz alta.":
			"{0} уже полнедели ночует у тебя, и ее вещи заняли целый ящик. Кто-то должен сказать это вслух.",
		"PEDIRLE QUE SE MUDE": "ПОЗВАТЬ ЖИТЬ ВМЕСТЕ",
		"TODAVÍA NO": "ПОКА НЕТ",
		"LA CENA QUE LE DEBES": "ОБЕЩАННЫЙ УЖИН",
		"Reservaste hace tres semanas y hoy es la noche. También es la noche del"
		+ " vídeo del rival, que el técnico mandó a todo el plantel.":
			"Ты забронировал столик три недели назад, и вот этот вечер настал. Но сегодня же и разбор видео соперника, которое тренер разослал всему составу.",
		"IR A CENAR": "НА УЖИН",
		"VER EL VÍDEO": "СМОТРЕТЬ ВИДЕО",
		"OTRA SEMANA FUERA": "СНОВА НА СБОРАХ",
		"Cuatro días de concentración, el tercer viaje del mes. {0} ya no"
		+ " pregunta cuándo vuelves: mira el calendario y se calla.":
			"Четыре дня на сборах, третья поездка за месяц. {0} уже не спрашивает, когда ты вернешься: смотрит в календарь и молчит.",
		"LLAMARLA CADA NOCHE": "ЗВОНИТЬ КАЖДЫЙ ВЕЧЕР",
		"CONCENTRARTE EN EL PARTIDO": "ДУМАТЬ О МАТЧЕ",
		"SU CUMPLEAÑOS ES HOY": "У НЕЕ ДЕНЬ РОЖДЕНИЯ",
		"Es el cumpleaños de {0} y hay treinta personas en tu casa. Mañana a las"
		+ " nueve hay partido y el técnico avisó de que mirará las caras.":
			"{0} празднует день рождения, и у тебя дома тридцать человек. Завтра в девять матч, а тренер предупредил, что будет смотреть на лица.",
		"QUEDARTE HASTA EL FINAL": "ОСТАТЬСЯ ДО КОНЦА",
		"SUBIR A DORMIR": "ПОЙТИ СПАТЬ",
		"HAY QUE HABLAR": "НАДО ПОГОВОРИТЬ",
		"{0} apagó la televisión en mitad del resumen de la jornada y se sentó"
		+ " enfrente. Esta conversación llevaba meses pendiente.":
			"{0} выключила телевизор посреди обзора тура и села напротив. Этот разговор назревал месяцами.",
		"ESCUCHARLA ENTERA": "ВЫСЛУШАТЬ",
		"DECIRLE QUE NO ES EL MOMENTO": "СКАЗАТЬ, ЧТО НЕ ВРЕМЯ",
		"TE ESPERÓ DESPIERTA": "ОНА ТЕБЯ ДОЖДАЛАСЬ",
		"Son las dos de la mañana, perdisteis, y {0} sigue despierta en la cocina"
		+ " con dos platos servidos. No preguntó por el partido.":
			"Два часа ночи, вы проиграли, а {0} все еще сидит на кухне с двумя накрытыми тарелками. О матче она не спросила.",
		"SENTARTE A CENAR": "СЕСТЬ ПОУЖИНАТЬ",
		"IRTE DERECHO A LA CAMA": "СРАЗУ В ПОСТЕЛЬ",
		"LA FOTO DEL DOMINGO": "ВОСКРЕСНАЯ СЪЕМКА",
		"Una revista ofrece portada: tú y {0}, en casa, ocho páginas. Pagan bien"
		+ " y a ella la fotografiarían por primera vez.":
			"Журнал предлагает обложку: ты и {0}, дома, восемь страниц. Платят хорошо, и ее будут фотографировать впервые.",
		"ACEPTAR LA PORTADA": "СОГЛАСИТЬСЯ",
		"PROTEGERLA": "ЗАЩИТИТЬ ЕЕ",
		"ELLA QUIERE SALIR": "ОНА ХОЧЕТ ОТОРВАТЬСЯ",
		"Ganasteis y {0} ya tiene mesa reservada para las dos de la mañana."
		+ " Mañana hay recuperación a las nueve.":
			"Вы выиграли, и {0} уже забронировала столик на два часа ночи. А завтра в девять — восстановительная тренировка.",
		"SALIR CON ELLA": "ПОЙТИ С НЕЙ",
		"MAÑANA HAY TRABAJO": "ЗАВТРА РАБОТА",
		"LA GIRA DE PRETEMPORADA": "ПРЕДСЕЗОННОЕ ТУРНЕ",
		"Tres semanas al otro lado del mundo. El club permite acompañantes, pero"
		+ " el vestuario mira raro al que viaja con pareja.":
			"Три недели на другом конце света. Клуб разрешает брать с собой близких, но в раздевалке косо смотрят на тех, кто едет со второй половинкой.",
		"QUE VENGA CONTIGO": "ВЗЯТЬ ЕЕ С СОБОЙ",
		"IR SOLO": "БЕЗ НЕЕ",
		"SE ACABÓ": "ЭТО КОНЕЦ",
		"Las maletas de {0} llevan dos días en el recibidor y esta vez no las"
		+ " está deshaciendo. Lo que queda por decidir no es si se va: es cómo.":
			"{0} уже два дня держит чемоданы в прихожей и на этот раз не разбирает их. Решать осталось не то, уйдет ли она, а то, как.",
		"SUPLICARLE DELANTE DE TODOS": "УМОЛЯТЬ ПРИ ВСЕХ",
		"DECIRLE QUE ERA SU DECISIÓN": "СКАЗАТЬ: ЭТО ЕЕ ВЫБОР",
		"DEJAR QUE LO CUENTE ELLA": "ПУСТЬ РАССКАЖЕТ САМА",

		"Vivís juntos: ${0} por partido.": "Живете вместе: ${0} за матч.",
		"Estáis empezando. Todavía no vive contigo.":
			"Вы только начинаете. Она еще не живет с тобой.",
		"ASADO DEL VESTUARIO": "ШАШЛЫКИ С КОМАНДОЙ",
		"Los veteranos organizan un asado y te toca poner la carne. Caro, pero ahí se"
		+ " hacen los amigos.":
			"Ветераны устраивают шашлыки, а мясо — с тебя. Дорого, но именно там заводят друзей.",
		"PAGAR EL ASADO": "ОПЛАТИТЬ ВСЕ",
		"NO HAY TIEMPO": "НЕКОГДА",
		"EL TÉCNICO TE LLAMA": "ТЕБЯ ЗОВЕТ ТРЕНЕР",
		"EL MÍSTER TIENE UNA IDEA": "У ТРЕНЕРА ЕСТЬ ИДЕЯ",
		"Te enseña la pizarra con tu nombre fuera de tu sitio de siempre: te ve de {0}. Dice que ahí hay hueco y que lo llenas tú.": "Он показывает тебе доску, где твое имя стоит не на привычном месте: он видит тебя на позиции {0}. Говорит, что там дыра и закрыть ее должен ты.",
		"ACEPTAR EL CAMBIO": "СОГЛАСИТЬСЯ",
		"PEDIR GARANTÍAS": "ПОПРОСИТЬ ГАРАНТИЙ",
		"SEGUIR EN LO TUYO": "ОСТАТЬСЯ НА СВОЕМ",
		"Te promete el puesto y los minutos.": "Он обещает тебе место в составе и игровое время.",
		"No le gustó que le pusieras condiciones.": "Ему не понравилось, что ты ставишь условия.",
		"Puerta cerrada. Puedes escuchar y asentir, o jugártela y pedirle más"
		+ " protagonismo.":
			"Дверь закрыта. Можешь слушать и кивать — или рискнуть и попросить роль поважнее.",
		"ESCUCHAR": "СЛУШАТЬ",
		"PEDIR MÁS": "ТРЕБОВАТЬ",
		"¡El técnico te compra la idea!": "Тренер принял твою идею!",
		"Mala lectura: al técnico no le gustó.": "Не угадал: тренеру это не понравилось.",
		"VISITA A LA CANTERA": "ВИЗИТ В АКАДЕМИЮ",
		"El club organiza una visita a los niños de la cantera y del hospital. Nadie te"
		+ " obliga.":
			"Клуб организует визит к детям из академии и в детскую больницу. Никто не заставляет.",
		"IR": "ИДУ",
		"DESCANSAR": "ОТДОХНУТЬ",
		"título (sale en 2 entradas: polemica y micro_polemica)UN MICRÓFONO CALIENTE":
			"ОПАСНЫЙ ВОПРОС",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el equipo?'":
			"Журналист провоцирует: «Ты правда доволен своей ролью в команде?»",
		"MORDERTE LA LENGUA": "ПРИКУСИТЬ ЯЗЫК",
		"SOLTARLO": "ВЫПАЛИТЬ",
		"SALIDA DEL EQUIPO": "ВЕЧЕРИНКА КОМАНДЫ",
		"El vestuario sale esta noche. Habrá fotos, habrá risas, y mañana habrá"
		+ " entrenamiento.":
			"Раздевалка сегодня гуляет. Будут фото, будет смех, а завтра будет тренировка.",
		"IR CON ELLOS": "ПОЙТИ С НИМИ",
		"QUEDARTE": "ОСТАТЬСЯ",

		"ALBOROTO EN TU CALLE": "ШУМ НА ТВОЕЙ УЛИЦЕ",
		"Hay aficionados acampados frente a tu casa desde temprano. Los vecinos ya"
		+ " llamaron dos veces.":
			"Болельщики с самого утра стоят лагерем у твоего дома. Соседи уже дважды звонили.",
		"SALIR A FIRMAR": "ВЫЙТИ К НИМ",
		"CERRAR CORTINAS": "ЗАДЕРНУТЬ ШТОРЫ",
		"TU MASCOTA AMANECIÓ MAL": "ПИТОМЕЦ ЗАБОЛЕЛ",
		"No quiso comer y te mira raro. El veterinario bueno atiende hoy... a la"
		+ " hora del entrenamiento de recuperación.":
			"Не хочет есть и странно на тебя смотрит. Хороший ветеринар принимает сегодня... как раз во время восстановительной тренировки.",
		"LLEVARLA AL VETERINARIO": "К ВЕТЕРИНАРУ",
		"ESPERAR A MAÑANA": "ПОДОЖДАТЬ ДО ЗАВТРА",
		"Falsa alarma: por la tarde ya corría por la casa.":
			"Ложная тревога: к вечеру он уже носился по дому.",
		"Mala noche para los dos. No pegaste ojo.":
			"Тяжелая ночь для вас обоих. Ты не сомкнул глаз.",
		"ASADO EN TU JARDÍN": "ШАШЛЫКИ В САДУ",
		"Compraste el asador y el vestuario se enteró. 'El sábado en tu casa',"
		+ " dicen. No era pregunta.":
			"Ты купил гриль, и раздевалка об этом узнала. «В субботу у тебя», — говорят они. Это был не вопрос.",
		"ENCENDER EL ASADOR": "РАЗЖЕЧЬ ГРИЛЬ",


		"TARDE DE PISCINA": "ДЕНЬ У БАССЕЙНА",
		"Hace calor, tu piscina está impecable y media plantilla tiene tu"
		+ " dirección. El timbre va a sonar.":
			"Жарко, бассейн сверкает, а у половины команды есть твой адрес. Звонок в дверь не заставит себя ждать.",
		"ABRIR LA CASA": "ПРИНЯТЬ ГОСТЕЙ",
		"TARDE PARA TI": "ВРЕМЯ ДЛЯ СЕБЯ",
		"PEREGRINACIÓN A TU VITRINA": "ПАЛОМНИЧЕСТВО К ТРОФЕЯМ",
		"El club pregunta si puedes recibir a los juveniles en tu mansión: quieren"
		+ " ver la vitrina con sus propios ojos.":
			"Клуб спрашивает, можешь ли ты принять юношей в своем особняке: они хотят своими глазами увидеть твою витрину трофеев.",
		"RECIBIRLOS": "ПРИНЯТЬ ИХ",
		"OTRA SEMANA": "В ДРУГОЙ РАЗ",
		"NOCHE LIBRE": "ВЫХОДНОЙ",
		"Tus amigos te esperan para una noche de PlayStation. El técnico ofrece una"
		+ " sesión extra de vídeo y tiros a puerta. No llegas a las dos.":
			"Друзья ждут тебя на вечер с PlayStation. Тренер предлагает дополнительное занятие: видео и удары по воротам. На все сразу не успеть.",
		"PS4 CON LOS AMIGOS": "PS4 С ДРУЗЬЯМИ",
		"ENTRENAR CON EL DT": "ЗАНЯТИЕ С ТРЕНЕРОМ",
		"El programa deportivo de la noche te reserva el asiento bueno. O eso, o el"
		+ " sofá de casa con las piernas en alto.":
			"Вечерняя футбольная передача бережет для тебя лучшее место. Либо это, либо диван дома и ноги кверху.",
		"IR A LA ENTREVISTA": "ПОЙТИ НА ЭФИР",
		"sale en 2 entradas: plato_o_descanso y dia_libre_tripleDESCANSAR EN CASA":
			"ОТДОХНУТЬ ДОМА",
		"TODOS TE BUSCAN": "ТЫ НАРАСХВАТ",
		"A la salida hay dos corros: la afición con camisetas y bufandas, y los"
		+ " periodistas con micrófonos. Solo te da tiempo a uno.":
			"На выходе две толпы: болельщики с футболками и шарфами и журналисты с микрофонами. Времени хватит только на одних.",
		"FIRMAR A LA AFICIÓN": "К БОЛЕЛЬЩИКАМ",
		"ATENDER A LA PRENSA": "К ПРЕССЕ",
		"DOS CENAS, UNA NOCHE": "ДВА УЖИНА РАЗОМ",
		"Tu agente reservó mesa para hablar de tu futuro. El técnico te invitó a la"
		+ " suya para hablar del equipo. Coinciden a la misma hora.":
			"Агент забронировал столик, чтобы обсудить твое будущее. Тренер позвал тебя к себе поговорить о команде. И все в одно и то же время.",
		"CENAR CON TU AGENTE": "УЖИН С АГЕНТОМ",
		"CENAR CON EL DT": "УЖИН С ТРЕНЕРОМ",
		"LA TARDE DESPUÉS": "НАЗАВТРА",
		"El readaptador te espera en el gimnasio para soltar piernas. Tu marca, a la"
		+ " misma hora, monta una firma pagada.":
			"Реабилитолог ждет тебя в зале, чтобы размять ноги. А твой спонсор в то же самое время устраивает платную автограф-сессию.",
		"GIMNASIO": "ЗАЛ",
		"ACTO DE LA MARCA": "АКЦИЯ СПОНСОРА",
		"TERCER TIEMPO": "ТРЕТИЙ ТАЙМ",
		"El vestuario se va a celebrar (o a lamentar) el resultado hasta tarde. En casa"
		+ " te esperaban para cenar tranquilo.":
			"Команда допоздна будет праздновать (или заливать) результат. А дома тебя ждали к спокойному ужину.",
		"sale en 2 entradas: equipo_o_casa y dia_libre_tripleSALIR CON EL EQUIPO":
			"ПОГУЛЯТЬ С КОМАНДОЙ",
		"NOCHE EN CASA": "ВЕЧЕР ДОМА",
		"TE POSTULAN DE CAPITÁN": "ТЕБЯ ВИДЯТ КАПИТАНОМ",
		"El vestuario vota y tu nombre suena para el brazalete. Aceptar es echarte el"
		+ " equipo a la espalda; ceder es un gesto al veterano de siempre.":
			"Раздевалка голосует, и твое имя звучит в разговорах о повязке. Взять ее — значит взвалить команду на себя; уступить — жест уважения к вечному ветерану.",
		"ACEPTAR EL BRAZALETE": "ВЗЯТЬ ПОВЯЗКУ",
		"APOYAR AL VETERANO": "ЗА ВЕТЕРАНА",
		"QUIEREN TU VIDA PRIVADA": "ЛИЧНАЯ ЖИЗНЬ НА ПРОДАЖУ",
		"Una revista ofrece una fortuna por abrir las puertas de tu casa. Tu agente"
		+ " prefiere que sigas siendo un misterio que se cotiza.":
			"Журнал предлагает целое состояние за то, чтобы показать твой дом. Агент предпочел бы, чтобы ты оставался загадкой, которая дорого стоит.",
		"ABRIR LAS PUERTAS": "ОТКРЫТЬ ДВЕРИ",
		"MANTENER EL MISTERIO": "ОСТАТЬСЯ ЗАГАДКОЙ",
		"LOS PAPARAZZI": "ПАПАРАЦЦИ",
		"Un fotógrafo lleva días pegado a ti: el coche, el restaurante, la salida del entreno. Anoche te sacó cenando a las tantas y mañana sale en portada.":
			"Фотограф уже несколько дней не отходит от тебя: машина, ресторан, выход с тренировки. Вчера он снял тебя за ужином глубокой ночью, и завтра это будет на обложке.",
		"DENUNCIARLO": "ПОДАТЬ ИСК",
		"EL BAILE DE MODA": "МОДНЫЙ ТАНЕЦ",
		"El community manager del club te persigue para grabar el baile viral del"
		+ " momento. El míster odia esas cosas.":
			"Админ клубных соцсетей гоняется за тобой, чтобы снять вирусный танец. Тренер такое терпеть не может.",
		"GRABAR EL BAILE": "СНЯТЬ ТАНЕЦ",
		"NI DE BROMA": "НИ ЗА ЧТО",
		"EL HIJO DEL MÍSTER": "СЫН ТРЕНЕРА",
		"En el rondo te toca marcar al hijo del técnico, que anda de pruebas. Puedes"
		+ " hacerle un caño de los que duelen o dejarle lucirse.":
			"В квадрате тебе достается опекать сына тренера — он тут на просмотре. Можешь пробить ему болезненную «калитку» или дать покрасоваться.",
		"HACERLE UN CAÑO": "ПРОБИТЬ КАЛИТКУ",
		"DEJARLE LUCIRSE": "ДАТЬ БЛЕСНУТЬ",
		"UN NIÑO BAJO LA LLUVIA": "МАЛЬЧИК ПОД ДОЖДЕМ",
		"Sales muerto y llueve, pero un niño lleva dos horas esperando con tu camiseta"
		+ " y un rotulador.":
			"Ты выходишь без сил, льет как из ведра, но мальчишка уже два часа ждет с твоей футболкой и маркером.",
		"PARARTE A FIRMAR": "РАСПИСАТЬСЯ",
		"AL AUTOBÚS": "В АВТОБУС",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el"
		+ " equipo?'. Una frase gorda vende titulares, pero el míster lo verá.":
			"Журналист провоцирует: «Ты правда доволен своей ролью в команде?» Громкая фраза продает заголовки, но тренер это увидит.",
		"SOLTARLO TODO": "ВЫЛОЖИТЬ ВСЕ",
		"¿CON QUIÉN TE SIENTAS?": "С КЕМ ТЫ СЯДЕШЬ?",
		"Primer viaje con el equipo. En el autobús quedan tres sitios libres, y con quién te sientas se nota.":
			"Первая поездка с командой. В автобусе три свободных места, и с кем ты сядешь, заметят все.",
		"CON LOS VETERANOS": "С ВЕТЕРАНАМИ",
		"CON EL MÍSTER": "С ТРЕНЕРОМ",
		"GRABANDO PARA REDES": "СНИМАТЬ СТОРИС",
		"TU PRIMERA ENTREVISTA": "ТВОЕ ПЕРВОЕ ИНТЕРВЬЮ",
		"Micrófono delante y una sola pregunta abierta. Lo que digas te retrata.":
			"Микрофон перед тобой и всего один открытый вопрос. Что скажешь — таким тебя и запомнят.",
		"DEL EQUIPO": "О КОМАНДЕ",
		"DE TUS METAS": "О ЦЕЛЯХ",
		"DE LA AFICIÓN": "О БОЛЕЛЬЩИКАХ",
		"¿A QUIÉN LO DEDICAS?": "КОМУ ПОСВЯТИШЬ?",
		"Acabas de marcar y la cámara te busca. El gesto que hagas ahora lo verá todo"
		+ " el estadio.":
			"Ты только что забил, и камера ловит тебя. Любой твой жест сейчас увидит весь стадион.",
		"AL MÍSTER": "ТРЕНЕРУ",
		"A LA GRADA": "ТРИБУНАМ",
		"A CÁMARA, TU MARCA": "СПОНСОРУ В КАМЕРУ",
		"DÍA LIBRE": "ВЫХОДНОЙ",
		"Jornada sin obligaciones. Puedes desconectar en casa, salir con el grupo, o"
		+ " meter horas de gimnasio por tu cuenta.":
			"День без обязательств. Можно отключиться дома, выбраться с ребятами или самому позаниматься в зале.",
		"GIMNASIO POR TU CUENTA": "ЗАЛ В ОДИНОЧКУ",
		"LA FOTO DE EQUIPO": "КОМАНДНОЕ ФОТО",
		"El fotógrafo coloca la foto de plantilla. Hay hueco delante con el capitán, en"
		+ " el centro entre todos, o pegado al cuerpo técnico.":
			"Фотограф выстраивает состав для общего снимка. Есть место впереди рядом с капитаном, в центре со всеми или вплотную к тренерскому штабу.",
		"DELANTE, PROTAGONISTA": "ВПЕРЕДИ, ЗВЕЗДОЙ",
		"EN EL CENTRO, CON TODOS": "В ЦЕНТРЕ, СО ВСЕМИ",
		"AL LADO DEL MÍSTER": "РЯДОМ С ТРЕНЕРОМ",
		"TRES MARCAS TE TANTEAN": "ТЕБЯ ХОТЯТ ТРИ БРЕНДА",
		"Tres patrocinadores mueven ficha a la vez: la deportiva de siempre, una firma"
		+ " de moda, y la marca local de tu ciudad.":
			"Три спонсора выходят на тебя одновременно: спортивный бренд, который ты носишь всегда, модный дом и местная марка из твоего города.",
		"LA DEPORTIVA": "СПОРТИВНЫЙ",
		"LA DE MODA": "МОДНЫЙ",
		"LA LOCAL": "МЕСТНЫЙ",
		"¿QUÉ SUBES A TUS REDES?": "ЧТО ВЫЛОЖИШЬ?",
		"Foto lista para publicar tras el partido. Un gesto para la grada, un elogio al"
		+ " vestuario, o un guiño al míster.":
			"Фото после матча готово к публикации. Жест трибунам, похвала раздевалке или привет тренеру.",
		"GUIÑO A LA AFICIÓN": "ПРИВЕТ БОЛЕЛЬЩИКАМ",
		"ELOGIO AL VESTUARIO": "ХВАЛА КОМАНДЕ",
		"GRACIAS, MÍSTER": "СПАСИБО, ТРЕНЕР",
		"NOVATADA EN LA COMIDA": "ПОСВЯЩЕНИЕ НОВИЧКА",
		"Primera comida con la plantilla y toca ritual de novato: subirte a la silla a"
		+ " cantar, o marcarte un baile. Elige tu veneno y reza.":
			"Первый обед с командой — время посвящения в новички: залезть на стул и спеть или выдать танец. Выбирай, чем рискнуть, и молись.",
		"CANTAR": "ПЕСНЯ",
		"Te saliste: el vestuario te corea de pie.":
			"Ты зажег: раздевалка подпевает стоя.",
		"Desafinaste fatal. Qué vergüenza ajena.": "Ты жутко фальшивил. Испанский стыд.",
		"BAILAR": "ТАНЕЦ",
		"¡La rompiste! Hasta el utillero lo grabó.":
			"Ты порвал танцпол! Даже экипировщик снял это на видео.",
		"Bailaste terrible. No lo superan.": "Станцевал ужасно. Тебе этого не забудут.",
		"RETO VIRAL DE DOMINADAS": "ЧЕЛЛЕНДЖ С НАБИВАНИЕМ",
		"Un compañero saca el móvil: reto de toques al balón para subirlo a redes. La"
		+ " cámara ya está grabando.":
			"Партнер достает телефон: челлендж с набиванием мяча для соцсетей. Камера уже пишет.",
		"INTENTARLO": "РИСКНУТЬ",
		"¡Clip perfecto! Se hace viral.": "Идеальный ролик! Он разлетается по сети.",
		"Se te cae a la segunda. Meme asegurado.":
			"Мяч падает на втором касании. Мем обеспечен.",
		"NO ME LA JUEGO": "НЕ РИСКОВАТЬ",
		"El crack del vestuario te reta a la consola delante de todos. Ganarle da"
		+ " galones; perder, cachondeo para semanas.":
			"Звезда раздевалки вызывает тебя сыграть в приставку на глазах у всех. Победишь — заработаешь авторитет; проиграешь — над тобой будут подшучивать неделями.",
		"ACEPTAR EL DUELO": "ПРИНЯТЬ ВЫЗОВ",
		"¡Le ganas en la prórroga! Respeto total.":
			"Ты обыграл его в дополнительное время! Полное уважение.",
		"Paliza. Te lo recordarán a diario.": "Разгром. Тебе будут напоминать об этом каждый день.",
		"OTRO DÍA": "ПОТОМ",
		"NOCHE DE CASINO": "ВЕЧЕР В КАЗИНО",
		"Tu agente te lleva al casino a 'hacer contactos'. La ruleta llama y él te"
		+ " anima a mojarte.":
			"Агент ведет тебя в казино «заводить знакомства». Рулетка манит, а он подбивает тебя рискнуть.",
		"APOSTAR FUERTE": "ВА-БАНК",
		"¡Pleno! El agente te mira con otros ojos.":
			"Угадал число! Агент смотрит на тебя другими глазами.",
		"Lo dejas todo en la mesa. Ay.": "Ты спустил за столом все. Ой.",
		"SOLO MIRAR": "СМОТРЕТЬ",
		"UN PRONÓSTICO ATREVIDO": "СМЕЛЫЙ ПРОГНОЗ",
		"En directo te piden mojarte con el próximo gran partido. Acertar te hace"
		+ " profeta; fallar, el hazmerreír.":
			"В прямом эфире тебя просят дать прогноз на следующий большой матч. Угадаешь — станешь пророком; ошибешься — посмешищем.",
		"MOJARTE": "РИСКНУТЬ",
		"Clavaste el pronóstico. Portada.": "Прогноз в точку. Ты на первых полосах.",
		"Ni una. Los memes no perdonan.": "Мимо по всем пунктам. Мемы не прощают.",
		"AGUA, NI ME MOJO": "БЕЗ ПРОГНОЗОВ",
		"DUELO DE PENALTIS": "ДУЭЛЬ ПЕНАЛЬТИ",
		"ACEPTAR": "ПРИНЯТЬ",
		"Le ganas la tanda. Ovación del grupo.": "Ты выигрываешь серию. Ребята ревут от восторга.",
		"Te para tres. Sonrojo.": "Он отбивает три. Стыдоба.",
		"A LA DUCHA": "В ДУШ",
		"KARAOKE DE CONCENTRACIÓN": "КАРАОКЕ НА СБОРАХ",
		"Noche de karaoke en la concentración. Todos esperan a ver si te atreves con el"
		+ " micro.":
			"Вечер караоке на сборах. Все ждут, решишься ли ты взять микрофон.",
		"COGER EL MICRO": "ВЗЯТЬ МИКРОФОН",
		"¡Estrella de la noche! Grupo rendido.":
			"Звезда вечера! Команда покорена.",
		"Un desastre. Y alguien lo grabó.": "Провал. И кто-то это снял.",
		"PASAR EL MICRO": "ПАС",
		"ESTRENAR BAILE DE GOL": "НОВОЕ ПРАЗДНОВАНИЕ",
		"El vestuario te pincha para que te inventes una celebración nueva para el"
		+ " próximo gol. O sale icónica, o sale ridícula.":
			"Раздевалка подначивает тебя придумать новое празднование для следующего гола. Либо получится культово, либо нелепо.",
		"INVENTARME UNO": "ПРИДУМАТЬ",
		"¡Se copia en todos los patios! Icónico.": "Его повторяют во всех дворах! Культово.",
		"Ridículo total. Mejor no marcar.": "Полная нелепость. Лучше уж не забивать.",
		"CELEBRAR NORMAL": "КАК ОБЫЧНО",
		"LA CENA LA PAGAS TÚ": "УЖИН ЗА ТВОЙ СЧЕТ",
		"Victoria y el vestuario mira al recién llegado: la cena de celebración la paga el nuevo. Es tradición, y es cara.":
			"Победа, и раздевалка смотрит на новичка: праздничный ужин оплачивает новенький. Это традиция, и недешевая.",
		"PAGAR CON GUSTO": "ЗАПЛАТИТЬ",
		"ESCAQUEARTE": "ОТВЕРТЕТЬСЯ",
		"FUISTE LA FIGURA": "ТЫ ГЕРОЙ МАТЧА",
		"Ganasteis y todos preguntan por ti. La sala de prensa está llena y tienes las"
		+ " piernas fundidas.":
			"Вы выиграли, и все спрашивают о тебе. Пресс-зал забит, а ноги не держат.",
		"ATENDER A TODOS": "ОТВЕТИТЬ ВСЕМ",
		"DIRECTO A CASA": "СРАЗУ ДОМОЙ",
		"BUSCANDO CULPABLES": "ПОИСК ВИНОВАТЫХ",
		"Derrota y el vestuario arde. El míster pide explicaciones mirando a los ojos."
		+ " Puedes dar la cara o mirar al suelo.":
			"Поражение, и раздевалка кипит. Тренер требует объяснений, глядя в глаза. Можешь ответить за себя или уставиться в пол.",
		"DAR LA CARA": "ОТВЕТИТЬ",
		"MIRAR AL SUELO": "ГЛАЗА В ПОЛ",
		"BRONCA EN EL VESTUARIO": "РАЗНОС В РАЗДЕВАЛКЕ",
		"Tras perder, el capitán monta un pollo y señala a los que no corrieron. Puedes"
		+ " respaldarle o quedarte callado.":
			"После поражения капитан устраивает скандал и называет тех, кто не бегал. Можешь поддержать его или промолчать.",
		"RESPALDAR AL CAPITÁN": "ПОДДЕРЖАТЬ КАПИТАНА",
		"CALLAR Y AGUANTAR": "ПРОМОЛЧАТЬ",
		"PREGUNTA ENVENENADA": "ВОПРОС С ПОДВОХОМ",
		"Recién perdido, un periodista te empuja a cargar contra el árbitro. Un titular"
		+ " fácil, pero el técnico odia el circo.":
			"Сразу после поражения журналист подталкивает тебя наехать на судью. Легкий заголовок, но тренер терпеть не может цирк.",
		"CONTENERTE": "СДЕРЖАТЬСЯ",
		"CARGAR CONTRA TODO": "РАЗНЕСТИ ВСЕХ",
		"GANASTE EL DERBI": "ДЕРБИ ЗА ВАМИ",
		"El derbi cayó de tu lado y la ciudad es una fiesta. La grada corea tu nombre y"
		+ " te invitan a salir a celebrar hasta el amanecer.":
			"Дерби осталось за вами, и весь город гуляет. Трибуны скандируют твое имя, тебя зовут праздновать до рассвета.",
		"CELEBRAR CON LA GRADA": "ГУЛЯТЬ С БОЛЕЛЬЩИКАМИ",
		"CELEBRAR CON MODESTIA": "СКРОМНО ОТМЕТИТЬ",
		"EL RETO DEL DERBI": "ПАРИ НА ДЕРБИ",
		"Antes del derbi el vestuario se retó: el que marque, se rapa. Marcaste. Ahora toca cumplir delante de las cámaras… o rajarte.":
			"Перед дерби раздевалка заключила пари: кто забьет, тот бреется налысо. Ты забил. Теперь сдержи слово перед камерами… или дай заднюю.",
		"CUMPLIR Y RAPARTE": "ПОБРИТЬСЯ НАЛЫСО",
		"¡Leyenda del vestuario! La grada lo adora.":
			"Легенда раздевалки! Трибуны в восторге.",
		"El corte sale fatal. Cachondeo eterno.":
			"Стрижка выходит ужасной. Шуткам не будет конца.",
		"RAJARTE": "ДАТЬ ЗАДНЮЮ",
		"MOLESTIA A CUESTAS": "МИКРОТРАВМА",
		"Arrastras una molestia. El médico aconseja parar; el míster quiere verte en el"
		+ " próximo entreno fuerte, sin excusas.":
			"Тебя беспокоит микротравма. Врач советует остановиться; тренер хочет видеть тебя на следующей тяжелой тренировке, без отговорок.",
		"FORZAR POR EL MÍSTER": "ТЕРПЕТЬ РАДИ ТРЕНЕРА",
		"HACER CASO AL MÉDICO": "СЛУШАТЬ ВРАЧА",
		"TU CIUDAD TE LLAMA": "ЗОВЕТ РОДНОЙ ГОРОД",
		"Tu ciudad natal organiza un partido benéfico y quieren tu cara en el cartel."
		+ " Es un día entero fuera.":
			"Твой родной город устраивает благотворительный матч и хочет видеть тебя на афише. Это целый день вне дома.",
		"IR AL BENÉFICO": "ПОМОЧЬ ГОРОДУ",
		"EXCUSARTE": "ОТКАЗ",
		"ELIGES DORSAL": "ВЫБОР НОМЕРА",
		"El utillero te deja elegir número: el 10 mediático que todos miran, el del"
		+ " ídolo que se retiró, o uno humilde de currante.":
			"Экипировщик дает тебе выбрать номер: звездную десятку, на которую все смотрят, номер ушедшего кумира или скромный номер работяги.",
		"EL 10 MEDIÁTICO": "НОМЕР 10",
		"EL DEL ÍDOLO": "НОМЕР КУМИРА",
		"UNO DISCRETO": "СКРОМНЫЙ",
		"CAMPEONATO DE DARDOS": "ТУРНИР ПО ДАРТСУ",
		"En la concentración montan un torneo de dardos con piques de por medio. El que"
		+ " gana, manda esa semana.":
			"На сборах устраивают турнир по дартсу с подколками. Победитель всю неделю главный.",
		"APUNTARTE": "ЗАПИСАТЬСЯ",
		"¡Campeón! Mandas en el vestuario.": "Чемпион! Ты главный в раздевалке.",
		"Última ronda de vergüenza.": "Последнее место. Позорище.",
		"EL PRESIDENTE BAJA": "ПРИШЕЛ ПРЕЗИДЕНТ",
		"Tras la victoria el presidente baja eufórico al vestuario a felicitar uno por"
		+ " uno. Todos miran a quién saluda primero.":
			"После победы президент в эйфории спускается в раздевалку, чтобы поздравить каждого лично. Все смотрят, с кем он поздоровается первым.",
		"DEDICARLE LA VICTORIA": "ПОСВЯТИТЬ ЕМУ ПОБЕДУ",
		"CELEBRAR CON EL GRUPO": "ПОГУЛЯТЬ С КОМАНДОЙ",

		"El mundo": "Мир",
		"Fase final de Conference": "Плей-офф Кубка Челлендж",
		"El club te ofrece cambiar de dorsal (llevas el {0})":
			"Клуб предлагает сменить игровой номер (сейчас у тебя {0})",
		"ESTÁS EN EL ONCE DE {0}": "ТЫ В ОСНОВЕ: {0}",
		"El seleccionador te pone de salida. Tu puntuación ({0}) supera el corte del once ({1}).":
			"Тренер сборной выпускает тебя в старте. Твой балл ({0}) выше планки основы ({1}).",
		"CONVOCADO POR {0}": "В ЗАЯВКЕ: {0}",
		"Entras en la lista de 23 y empiezas en el banquillo. Para el once te faltan {0} puntos.":
			"Ты попадаешь в заявку из 23 человек и начинаешь на скамейке. До основы не хватает очков: {0}.",
		"FUERA DE LA LISTA DE {0}": "ВНЕ ЗАЯВКИ: {0}",
		"El seleccionador no te llama esta vez. Tu puntuación es {0} y el último convocado marca {1}: te faltan {2}.":
			"Тренер сборной на этот раз тебя не вызывает. Твой балл: {0}, у последнего вызванного: {1}. Не хватает: {2}.",
		"Le quitaste el sitio a {0}.": "Ты занял место игрока {0}.",
		"El once lo tiene {0}, con {1}.": "В основе играет {0}, его балл: {1}.",
		"El último de la lista es {0}, con {1}.": "Последний в заявке — {0}, балл: {1}.",
		"AMISTOSO: el seleccionador prueba gente y el corte baja {0} puntos. {1}":
			"ТОВАРИЩЕСКИЙ МАТЧ: тренер сборной пробует новых игроков, планка ниже на {0} очк. {1}",
		"TE PIDEN: {0} ({1}/{2})": "ЗАДАЧА: {0} ({1}/{2})",
		"Juega {0} partidos con tu país.": "Матчи за сборную: сыграй {0}.",
		"Marca {0} goles con tu país.": "Голы за сборную: забей {0}.",
		"Cumpliste lo que te pidió {0}": "Ты выполнил то, что просил {0}",
		"No cumpliste lo que te pidió {0}": "Ты не выполнил то, что просил {0}",
		"CAPITÁN de {0}": "КАПИТАН: {0}",
		"Perdiste el brazalete de {0}": "Ты лишился капитанской повязки: {0}",
		"PERDISTE EL BRAZALETE": "БЕЗ ПОВЯЗКИ",
		"{0} {1} · TU MEDIA {2}": "{0} {1} · ТЫ {2}",
		"EL TÉCNICO NUEVO REPARTE DE CERO": "НОВЫЙ ТРЕНЕР — С ЧИСТОГО ЛИСТА",
		"VESTUARIO NUEVO": "НОВАЯ КОМАНДА",
		"SE QUEDA EN {0}": "ОСТАЕТСЯ: {0}",
		"BRAZALETE": "ПОВЯЗКА",
		"BRAZALETE TUYO": "ТВОЯ ПОВЯЗКА",
		"SIN RIVAL": "СВОБОДНО",
		"FRENADO POR TU PALABRA": "СВЯЗАН СЛОВОМ",
		"BRAZALETE: {0}/{1} PARTIDOS · SELECCIONADOR {2}/{3} · VESTUARIO {4}/{5} · SIENDO TITULAR": "ПОВЯЗКА: МАТЧИ {0}/{1} · ТРЕНЕР {2}/{3} · РАЗДЕВАЛКА {4}/{5} · В ОСНОВЕ",
		"¡{0} se clasificó para {1}!": "Отбор пройден: {0} — {1}!",

		"Dieciseisavos": "1/16 финала",
		"Ronda": "Раунд",
		"AMISTOSO": "ТОВ. МАТЧ",
		"TUS TIROS": "УДАРЫ",
		"LOS AMISTOSOS": "ТОВАРИЩЕСКИЕ",
		"TORNEO EUROPEO": "ЕВРОТУРНИР",
		"TORNEO SUDAMERICANO": "ЮЖНОАМ. ТУРНИР",
		"TORNEO NORTEAMERICANO": "СЕВЕРОАМ. ТУРНИР",
		"TORNEO ASIÁTICO": "ТУРНИР АЗИИ",
		"TORNEO AFRICANO": "ТУРНИР АФРИКИ",
		"TORNEO DE OCEANÍA": "ТУРНИР ОКЕАНИИ",
		"TORNEO CONTINENTAL": "КОНТИНЕНТ. ТУРНИР",
		"DIF": "+/-",
		"CC": "КЭ",
		"CEU": "КЕ",
		"CCF": "КЧ",
		"Pediste salir: el club te ofrece a quien pregunte, también con el mercado cerrado. Estas ofertas no caducan con la ventana.":
			"Ты попросился уйти: клуб предлагает тебя всем желающим, даже когда трансферное окно закрыто. Эти предложения не сгорают вместе с окном.",
		"16avos": "1/16",
		"DISTANCIA": "ДИСТАНЦИЯ",
		"T": "У",
		"DENTRO DEL ÁREA": "В ШТРАФНОЙ",
		"FUERA DEL ÁREA": "ИЗ-ЗА ШТРАФНОЙ",
		"DE MUY LEJOS": "ИЗДАЛЕКА",
		"PRODIGIO": "ТАЛАНТ",
		"HEREDERO": "ПРЕЕМНИК",
		"RECOMENDADO": "ПРОТЕЖЕ",
		"KILLER NATO": "КИЛЛЕР",
		"HIJO DE LEYENDA": "СЫН ЛЕГЕНДЫ",


		"PICARDIA": "СМЕКАЛКА",
		"MANO FRIA": "ХОЛОДНАЯ ГОЛОВА",
		"CARA DE ANUNCIO": "ЛИЦО С РЕКЛАМЫ",
		"EL TELEFONO": "ТЕЛЕФОН",
		"EL NUEVE": "ДЕВЯТКА",
		"EL QUE VOLVIO": "ВЕРНУВШИЙСЯ",
		"EL DEPORTIVO": "СПОРТКАР",
		"EL PATIO DE LA FAMILIA": "СЕМЕЙНЫЙ УЧАСТОК",
		"EL PREPARADOR DE LA FAMILIA": "СЕМЕЙНЫЙ ТРЕНЕР",
		"RECUPERACION": "ВОССТАНОВЛЕНИЕ",
		"Cuarenta mil personas fueron a verte firmar y te compraste el coche. Llegas tarde a entrenar, pero llegas: la prensa te adora y el vestuario menos.":
			"Сорок тысяч человек пришли посмотреть на твое подписание, и ты купил машину. На тренировку опаздываешь, но приезжаешь: пресса тебя обожает, раздевалка — не очень.",
		"El terreno de la familia ya era tuyo antes de firmar nada. La casa la levantas tú, pero el sitio donde ponerla no lo pagas.":
			"Семейная земля была твоей еще до того, как ты что-то подписал. Дом строишь сам, но за место под него не платишь.",
		"El que puso en pie a tu padre te conoce desde niño. Te recuperas entre partidos como nadie de tu edad, y a él no hay que pagarle.":
			"Человек, который поставил на ноги твоего отца, знает тебя с детства. Ты восстанавливаешься между матчами как никто в твоем возрасте, а платить ему не нужно.",
		"EL AHIJADO": "КРЕСТНИК",
		"BOTAS DE ORO": "ЗОЛОТЫЕ БУТСЫ",
		"PIERNAS DE NIÑO": "МОЛОДЫЕ НОГИ",
		"El uno contra uno lo aprendiste en una cancha sin red: +4 de regate desde el debut.":
			"Игре один в один ты научился на площадке без сеток: +4 к дриблингу с дебюта.",
		"Cuando pitan penalti, el balón lo coges tú: +5 de penales, que es lo que decide quién lo tira en tu equipo.":
			"Когда назначают пенальти, мяч берешь ты: +5 к пенальти — именно это решает, кто бьет в твоей команде.",
		"Sales bien en foto y la prensa lo nota: empiezas con la puerta de los patrocinios abierta, no en tu segunda temporada.":
			"Ты фотогеничен, и пресса это заметила: дверь к спонсорам открыта с самого начала, а не со второго сезона.",
		"Tienes el teléfono de alguien que mueve fichas: tu agente arranca con la mesa llena y el mercado abierto desde el primer mes.":
			"У тебя есть номер человека, который устраивает трансферы: твой агент начинает с полным столом предложений, а трансферное окно открыто с первого месяца.",
		"El área es tuya: +3 de potencia, y si el 9 está libre en tu club, te lo guardan.":
			"Штрафная — твоя: +3 к силе удара, а если в клубе свободен номер 9, его придержат для тебя.",
		"Ya jugaste aquí una vez y nadie lo olvidó: la grada te espera y la prensa te da el beneficio de la duda.":
			"Ты уже играл здесь однажды, и никто не забыл: трибуны ждут тебя, а пресса дает кредит доверия.",
		"En este vestuario tu apellido ya sonaba: el técnico te conoce antes de verte jugar, y la prensa lo sabe.":
			"Твоя фамилия в этой раздевалке уже кое-что значила: тренер знает тебя еще до того, как увидит в игре, и пресса это знает.",
		"Tres trofeos de goleador vinieron con unas CORONA DE ORO. Estrenas un par, sin estrenar y sin pagar.":
			"Три трофея лучшего бомбардира принесли с собой бутсы GOLDEN CROWN. Начинаешь в новенькой паре, за которую не платил.",
		"Las piernas no se acuerdan de los años: +6 a velocidad, aceleración y regate de salida.":
			"Ноги не помнят о годах: +6 к стартовой скорости, ускорению и дриблингу.",
		"TE LLEVAS": "С СОБОЙ",
		"PASO 2 DE 3 · LO QUE TE GANASTE": "ШАГ 2 ИЗ 3 · ТВОИ ЗАСЛУГИ",
		"LIBRES": "ОТКРЫТО",
		"POR DESBLOQUEAR": "ЗАКРЫТО",
		"VIDA": "ЖИЗНЬ",
		"LESION": "ТРАВМА",
		"BANCO": "БАНК",
		"TUS VENTAJAS": "ТВОИ ПЕРКИ",
		"BOTAS HEREDADAS": "СТАРЫЕ БУТСЫ",
		"CON CARTEL": "С ИМЕНЕМ",
		"PIE EDUCADO": "ТОЧНЫЙ УДАР",
		"MANO DERECHA": "ПРАВАЯ РУКА",
		"EL DIEZ": "ДЕСЯТКА",
		"CUERPO DE HIERRO": "ЖЕЛЕЗНОЕ ТЕЛО",
		"FICHAJE DE ORO": "ТРАНСФЕР ГОДА",
		"SANGRE AZUL": "АРИСТОКРАТ",
		"SE ABRE CON": "КАК ОТКРЫТЬ",
		"Lo que te ganaste en carreras anteriores. Cada ventaja gasta puntos de legado, y no alcanzan para todas: elige con cuáles arrancas —o con ninguna, y empieza de cero como todos.": "То, что ты заработал в прошлых карьерах. Каждый перк тратит очки наследия, и на все их не хватит: выбери, с чем начнешь, — или ни с чем, и начни с нуля, как все.",
		"Te quedaste las botas de aquel año en Tercera. Estrenas unas TRUENO XT: pegan más fuerte, y duran lo que duran.": "Ты сохранил бутсы с того сезона в третьей лиге. Начинаешь в паре THUNDER XT: бьют сильнее и служат, сколько прослужат.",
		"Llegas con cartel: la grada ya coreó tu nombre una vez y te lo guarda.": "Ты приходишь с репутацией: эти трибуны однажды уже скандировали твое имя и помнят его.",
		"Los primeros diez goles no se olvidan: +3 de precisión desde el debut.": "Первые десять голов не забываются: +3 к точности с дебюта.",
		"Un agente con oficina te firma antes que ningún club: más puertas y menos comisión. Su cuota mensual, también desde el día uno.": "Агент с собственным офисом подписывает тебя раньше любого клуба: больше возможностей, меньше комиссия. Его ежемесячный гонорар — тоже с первого дня.",
		"Ya llevaste el 10 y no se te olvidó: +3 de visión, y si el 10 está libre en tu club, te lo guardan.": "Ты уже носил номер 10 и не забыл этого: +3 к видению поля, а если в клубе свободен номер 10, его придержат для тебя.",
		"Trescientos partidos enseñan a caer: 20% menos de riesgo de lesión, toda la carrera.": "Триста матчей учат правильно падать: риск травмы на 20% ниже на всю карьеру.",
		"Heredas el apellido y la casa: entras a vivir el primer día. El mantenimiento también se hereda.": "Ты наследуешь фамилию и дом: въезжаешь в первый же день. Расходы на содержание тоже переходят по наследству.",
		"No llegas a pelear un sitio: llegas a ocuparlo. Un peldaño más de rol en tu contrato de debut.": "Ты приходишь не бороться за место, а занять его. Роль в дебютном контракте на ступень выше.",
		"El seleccionador ya sabe quién eres: empiezas con crédito para entrar en la primera lista.": "Тренер сборной уже знает, кто ты: ты начинаешь с запасом доверия для первого вызова.",
		"Naciste con algo. Empiezas con 3 puntos de habilidad por repartir.":
			"Ты родился с даром. На старте у тебя 3 очка умений для распределения.",
		"La familia te respalda: +$35.000 en el banco desde el primer día.":
			"Семья поддерживает тебя: +$35 000 на счету с первого дня.",
		"El técnico ya oyó hablar de ti. Debutas con su confianza, no en la grada.":
			"Тренер уже слышал о тебе. Дебютируешь с его доверием, а не на трибуне.",
		"El gol lo llevas puesto: +6 a potencia, precisión y efecto de salida.":
			"Гол у тебя в крови: +6 к стартовой силе удара, точности и подкрутке.",
		"Cargas un apellido: +$20.000 y 2 puntos de habilidad. La sombra pesa.":
			"Ты носишь громкую фамилию: +$20 000 и 2 очка умений. Тень давит.",
		"Véncelo en un partido (con cualquier carrera) para desbloquearlo.":
			"Обыграй его в матче (в любой карьере), чтобы открыть.",
		"Completa una temporada en {0}ª división o ficha por un club de {1}ª para desbloquear.":
			"Отыграй сезон в лиге уровня {0} или перейди в клуб лиги уровня {1}, чтобы открыть.",
		"LIGA ESPAÑOLA": "ЛИГА ИСПАНИИ",
		"LIGA INGLESA": "ЛИГА АНГЛИИ",
		"LIGA ITALIANA": "ЛИГА ИТАЛИИ",
		"LIGA ALEMANA": "ЛИГА ГЕРМАНИИ",
		"LIGA MEXICANA": "ЛИГА МЕКСИКИ",
		"LIGA LUSA": "ПОРТУГАЛИЯ",
		"LIGA FRANCESA": "ЛИГА ФРАНЦИИ",
		"LIGA NEERLANDESA": "ЛИГА НИДЕРЛАНДОВ",
		"LIGA BRASILEÑA": "ЛИГА БРАЗИЛИИ",
		"LIGA ARGENTINA": "ЛИГА АРГЕНТИНЫ",
		"LIGA AMERICANA": "ЛИГА США",
		"LIGA SAUDI": "САУД. ЛИГА",
		"LIGA TURCA": "ЛИГА ТУРЦИИ",
		"LIGA BELGA": "ЛИГА БЕЛЬГИИ",
		"{0}G {1}A · {2} · {3}": "Г {0} А {1} · {2} · {3}",
		"EQUIPO ENCENDIDO": "КОМАНДА В УДАРЕ",
		"EQUIPO FRÍO": "КОМАНДА СПИТ",
		"PORTERO EN LOS NERVIOS": "ВРАТАРЬ НА НЕРВАХ",
		"PORTERO TENSO": "ВРАТАРЬ ЗАЖАТ",




		"Diagonal del extremo": "Диагональ вингера",
		"El pasillo interior": "Полуфланг",
		"El embudo": "Воронка",
		"La defensa volcada": "Смещенная защита",
		"Doblada por fuera": "Обгон по флангу",
		"Aislado en la banda": "Один на фланге",
		"La subida por fuera": "Подключение крайнего",
		"El tercer hombre": "Третий игрок",
		"Indirecta al costado del área": "Свободный сбоку от штрафной",
		"Indirecta de segunda línea": "Свободный издалека",
		"Contra el muro replegado": "Против плотной обороны",
		"Presión alta tras la pérdida": "Прессинг после потери",
		"Contra tras córner rival": "Контра после углового",
		"Ley de la ventaja": "Правило преимущества",
		"Tres contra tres": "Трое на трое",
		"Falta lejana colgada al área": "Дальний штрафной навесом",
		"Falta lejana desde la banda": "Дальний штрафной с фланга",
		"Falta desde tres cuartos": "Штрафной издалека",
		"Cambio corto": "Короткий перевод",
		"Cambio de banda": "Перевод игры",
		"Cambio largo": "Длинный перевод",
		"Salir de la presión": "Уход от прессинга",
		"Cruza el medio campo": "Пересеки центр поля",

		"¡LA RECUPERASTE! ATACA": "МЯЧ ТВОЙ! В АТАКУ",
		"GOL EN CONTRA": "ПРОПУЩЕН ГОЛ",
		"DESBORDADO": "ОБЫГРАН",
		"LA PARÓ TU PORTERO": "ВРАТАРЬ ВЫРУЧИЛ",
		"LE DEJASTE TIRAR": "ДАЛ ЕМУ УДАРИТЬ",
		"Recuperar el balón": "Отбор мяча",
		"DEFENSA": "ЗАЩИТА",
		"El balón NO es tuyo. Métete entre él y tu portería: al llegarle bien puesto, se la quitas.": "Мяч НЕ твой. Встань между соперником и своими воротами: подойдешь к нему в правильной позиции — отберешь мяч.",
		"Te la sirven": "Пас на тебя",
		"Te la traen conduciendo y te la pasan. Apunta y remátala de primera, o se te escapa.": "Партнер проходит с мячом и отдает тебе пас. Целься и бей с первого касания, иначе момент уйдет.",
		"Espera el pase; luego jala y suelta": "Жди паса; потом потяни и отпусти",
		"REMATE AÉREO": "ИГРА В ВОЗДУХЕ",
		"Cabezazos": "Удары головой",
		"Voleas": "Удары с лета",
		"Chilenas": "Удары через себя",
		"Te cuelgan el centro a la cabeza. Espera a que llegue y cabecea a puerta.": "Тебе навешивают на голову. Дождись мяча и бей головой в створ.",
		"Espera el centro; luego jala y suelta": "Жди навеса; потом потяни и отпусти",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que toque el suelo.": "Тебе дают мяч на грудь: принимаешь его и бьешь с лета, пока он не коснулся газона.",
		"Espera el control; luego jala y suelta": "Жди приема; потом потяни и отпусти",
		"Saltas de espaldas al arco: apunta a puerta aunque no la veas.": "Ты прыгаешь спиной к воротам: целься в них, даже если не видишь.",
		"Raso al pie": "Низом в ноги",
		"Te la ponen botando": "Мяч с отскоком",
		"¡De primera!": "С первого касания!",
		"Espera el momento perfecto": "Жди идеального момента",
		"¡Cabecea!": "Бей головой!",
		"Tocada a destiempo": "Удар не вовремя",
		"Tocada de refilón": "Смазанный удар",
		"¡Al primer toque!": "В одно касание!",
		"¡Al bote pronto!": "С полулета!",
		"¡Cazada al bote!": "Поймал на отскоке!",
		"El bote te ganó": "Отскок тебя обманул",
		"Bote de refilón": "Смазал после отскока",
		"¡La bajaste y pegaste!": "Опустил и пробил!",
		"¡Control y tiro!": "Прием и удар!",
		"Tiro a destiempo tras el control": "Удар не вовремя после приема",
		"De refilón tras el control": "Смазал после приема",
		"¡Cabezazo pleno!": "Чистый удар головой!",
		"¡Con toda la frente!": "Всем лбом!",
		"Saltaste a destiempo": "Прыжок не вовремя",
		"De refilón con la frente": "Вскользь головой",
		"¡Volea!": "С лета!",
		"¡De pecho y volea!": "Грудью и с лета!",
		"Volea a destiempo": "Удар с лета не вовремя",
		"Volea de refilón": "Смазанный удар с лета",
		"¡Chilena de libro!": "Удар через себя как по учебнику!",
		"Chilena a destiempo": "Удар через себя не вовремя",
		"Chilena de refilón": "Смазанный удар через себя",
		"Saltaste tarde": "Прыгнул поздно",
		"Chilena tardía": "Поздний удар через себя",
		"Te adelantaste a la volea": "Поспешил с ударом с лета",
		"Volea tardía": "Запоздал с ударом с лета",
		"Raso del lado ciego": "Низом из слепой зоны",
		"Raso a la carrera": "Низом на ход",
		"Tensa por el aire": "Сильно по воздуху",
		"Te la cuelgan": "Навес на тебя",
		"Raso con rosca": "Низом с подкруткой",
		"Raso largo": "Длинный низом",
		"Filtrado al hueco": "Пас в разрез",
		"Filtrado con rosca": "В разрез с подкруткой",
		"Con comba": "Закрученный",
		"Centro a la cabeza": "Навес на голову",
		"Centro al pecho": "Навес на грудь",
		"Centro a la chilena": "Навес под удар через себя",
		"Cambio de juego": "Перевод игры",
		"Centro de la otra banda": "Навес с дальнего фланга",
		"Al pecho desde la otra banda": "На грудь с дальнего фланга",
		"Al pecho desde la banda": "На грудь с фланга",
		"Botando desde lejos": "С отскоком издалека",
		"Chilena desde la otra banda": "Через себя с дальнего фланга",
		"A media altura": "На уровне пояса",
		"Botando de muy lejos": "С отскоком из глубины",
		"Centro con rosca": "Закрученный навес",
		"Chilena con rosca": "Закрученный под удар через себя",
		"Al pecho con rosca": "Закрученный на грудь",
		"Tras el punto penal": "За точкой пенальти",
		"Córner a la cabeza": "Угловой на голову",
		"Córner a la chilena": "Угловой под удар через себя",
		"Córner al borde del área": "Угловой на линию штрафной",
		"Falta colgada a la cabeza": "Штрафной навесом на голову",
		"Falta colgada a la chilena": "Штрафной навесом под удар через себя",
		"Falta colgada al pecho": "Штрафной навесом на грудь",
		"En la frontal": "У линии штрафной",
		"En el área": "В штрафной",
		"En el área chica": "Во вратарской",
		"Escorado en el área": "С краю штрафной",
		"Al costado del área": "Сбоку от штрафной",
		"Pegado a la banda": "У бровки",
		"Centrar por la banda": "Навес с фланга",
		"Pon el CENTRO a un compañero: se gana completándolo, no tirando a puerta.": "Сделай НАВЕС на партнера: засчитывается точная передача, а не удар по воротам.",
		"Cuelga el centro a un compañero": "Навесь на партнера",
		"Centro corto": "Короткий навес",
		"Centro largo": "Длинный навес",
		"¡Centro puesto!": "Навес дошел!",
		"El centro no llegó": "Навес не дошел",
		"notaCENTRO PUESTO": "НАВЕС ДОШЕЛ",
		"Arrastra para correr; no hay nada más que tocar": "Веди пальцем, чтобы бежать; больше ничего нажимать не нужно",
		"Ponte entre el balón y tu portería para robar. Al recuperar, sigue arrastrando y ataca.": "Встань между мячом и своими воротами, чтобы отобрать его. Отобрав, продолжай вести пальцем и атакуй.",
		"Arrastra para correr; toca con un segundo dedo para barrerte": "Веди пальцем, чтобы бежать; нажми вторым пальцем, чтобы сделать подкат",
		"FALTA": "ФОЛ",
		"RECUPERADA": "ОТОБРАЛ",
		"TE DESBORDÓ": "ОН ТЕБЯ ОБЫГРАЛ",
		"Campo abierto": "Игра в поле",
		"PASE": "ПАС",
		"Tu fondo: los minutos que aguantas —a tope juegas los 90' y llegas a la prórroga—, lo que te cuesta cada partido y lo que repones. También te hace menos propenso a lesionarte.":
			"Твоя выносливость: сколько минут ты выдерживаешь (на максимуме играешь все 90' и дотягиваешь до дополнительного времени), сколько тебе стоит каждый матч и сколько ты восстанавливаешь. А еще ты реже травмируешься.",
		"Copa de Campeones": "Кубок элиты",
		"Copa Europa": "Кубок Европы",
		"Copa Conferencia": "Кубок Челлендж",
		"Jugador del Año": "Игрок года",
		"Bota (Liga)": "Бомбардир (лига)",
		"Mejor (Copa de Campeones)": "Лучший (Кубок элиты)",
		"Bota (Copa de Campeones)": "Бомбардир (Кубок элиты)",
		"Asist. (Copa de Campeones)": "Ассист. (Кубок элиты)",
		"Mejor (Copa Europa)": "Лучший (Кубок Европы)",
		"Bota (Copa Europa)": "Бомбардир (Кубок Европы)",
		"Asist. (Copa Europa)": "Ассист. (Кубок Европы)",
		"Mejor (Copa Conferencia)": "Лучший (Кубок Челлендж)",
		"Bota (Copa Conferencia)": "Бомбардир (Кубок Челлендж)",
		"Asist. (Copa Conferencia)": "Ассист. (Кубок Челлендж)",
		"VUELVEN A LLAMAR": "ЗВОНЯТ СНОВА",
		"TU AGENTE LA SOSTIENE": "ПРЕДЛОЖЕНИЕ В СИЛЕ",
		"NO SE DEJÓ SOSTENER": "ПРЕДЛОЖЕНИЕ СГОРЕЛО",
		"SE HARTARON DE TUS NOES": "УСТАЛИ ОТ ТВОИХ ОТКАЗОВ",
		"LLEGA MENOS DE LO QUE ERA": "ПРЕДЛОЖЕНИЕ СКРОМНЕЕ",
		"MEJORAN LA OFERTA": "ДАЮТ БОЛЬШЕ",
		"TRASPASO PACTADO": "СДЕЛКА ЗАКЛЮЧЕНА",
		"NO LLEGAN A LO QUE PIDEN": "НЕ ДОТЯНУЛИ ДО ЦЕНЫ",
		"RETIRAN LA PUJA": "ЗАЯВКУ ОТОЗВАЛИ",
		"HAY PELEA POR TI": "ЗА ТЕБЯ БОРЮТСЯ",
		"APRIETA POR TI": "БЬЕТСЯ ЗА ТЕБЯ",
		"COBRAN POR TU VENTA": "ДОЛЯ С ПРОДАЖИ",
		"¡Salió bien!": "Получилось!",
		"Salió mal…": "Не вышло…",
		"No les das el perfil todavía.": "Пока ты им не подходишь.",
		"Ese club no existe.": "Такого клуба нет.",
		"Ya juegas ahí.": "Ты уже там играешь.",
		"Ya tienes su oferta sobre la mesa.": "Их предложение уже на столе.",
		"Les dijiste que no en esta ventana.": "В это окно ты им уже отказал.",
		"Es un club muy por debajo del tuyo: no bajan a por ti.":
			"Этот клуб намного ниже твоего: за тобой они не пойдут.",
		"Está demasiadas categorías por encima: se sube de una en una.":
			"Этот клуб слишком высоко: подниматься нужно по одной ступени.",
		"No pueden pagar lo que costaría sacarte.":
			"Им не по карману выкупить тебя.",
		"Tu última concentración": "Твой последний вызов",
		"{0}: {1} fuera en la fase de grupos (sin ti)": "{0}: {1} — вылет на групповом этапе (без тебя)",
		"{0} se clasificó para {1} (sin ti)": "Отбор пройден: {0} — {1} (без тебя)",
		"{0} se quedó fuera de {1}": "{0} пропускает турнир: {1}",
		"{0}: fuera en la fase de grupos con {1}": "{0}: вылет на групповом этапе (команда: {1})",
		"{0} se clasificó para {1}": "Отбор пройден: {0} — {1}",
		"{0} no se clasificó para {1}": "Отбор провален: {0} — {1}",
		"{0} sólo jugó amistosos este año": "{0}: в этом году только товарищеские матчи",
		"{0} amistosos con {1}: {2} ganados": "Товарищеские матчи ({1}): {0}, побед: {2}",
		"Tu palmarés": "Твои трофеи",
		"Tu temporada": "Твой сезон",
		"Dónde juegas": "Где ты играешь",
		"El seleccionador": "Тренер сборной",
		"Llevas el brazalete": "Ты носишь повязку",
		"Ya eres del grupo": "Ты уже свой в команде",
		"Eliminado de la copa": "Вылет из кубка",
		"En dieciseisavos de copa": "1/16 финала кубка",
		"En octavos de copa": "1/8 финала кубка",
		"En cuartos de copa": "1/4 финала кубка",
		"En semifinales de copa": "Полуфинал кубка",
		"En la final de copa": "Финал кубка",
		"Partidos con la selección": "Матчи за сборную",
		"Asistencias con la selección": "Голевые передачи за сборную",
		"El Diez": "Десятка",
		"Llegar a llevar el 10 a la espalda.": "Дорасти до номера 10 на спине.",
		"El Nueve de un Grande": "Девятка гранда",
		"Llevar el 9 en uno de los clubes más fuertes del mundo.":
			"Носить номер 9 в одном из сильнейших клубов мира.",
		"Adiós Internacional": "Прощание со сборной",
		"Colgar la camiseta de tu país por decisión propia, sin dejar el club.":
			"Повесить футболку сборной на гвоздь по своему решению, не уходя из клуба.",
		"Brazalete del País": "Повязка сборной",
		"Llevar la cinta de capitán de tu selección.": "Надеть капитанскую повязку своей сборной.",
		"Rey de la Conference": "Король Кубка Челлендж",
		"Ganar la Conference.": "Выиграть Кубок Челлендж.",
		"Ser el máximo goleador de la Conference.": "Стать лучшим бомбардиром Кубка Челлендж.",
		"Goles y Pases": "Голы и пасы",
		"Verdugo de Países Bajos": "Гроза Нидерландов",
		"Cuarenta Mil": "Сорок тысяч",
		"TELEVISIÓN": "ТЕЛЕВИЗОР",
		"MIS CAMISETAS": "МОИ ФУТБОЛКИ",
		"LÁMPARA": "ЛАМПА",
		"JARDÍN": "САД",
		"CINTA": "ДОРОЖКА",
		"COCINA": "КУХНЯ",
		"ESPEJO": "ЗЕРКАЛО",
		"LIBRERO": "СТЕЛЛАЖ",
		"MANCUERNAS": "ГАНТЕЛИ",
		"PLANTA": "РАСТЕНИЕ",
		"MANSION": "ОСОБНЯК",
		"FINCA": "ПОМЕСТЬЕ",
		"PREMIOS AL MEJOR": "НАГРАДЫ ЛУЧШИМ",
		"Premios al Mejor": "Награды лучшим",
		"JUGADOR DEL AÑO": "ИГРОК ГОДА",
		"BOTA": "БУТСА",
		"Bota": "Бутса",
		"Torneo Europeo": "Европейский турнир",
		"Torneo Sudamericano": "Южноамериканский турнир",
		"Torneo Norteamericano": "Североамериканский турнир",
		"Torneo Asiático": "Азиатский турнир",
		"Torneo Africano": "Африканский турнир",
		"Torneo de Oceanía": "Турнир Океании",
		"TODOS LOS PREMIOS AL MEJOR": "ВСЕ НАГРАДЫ ЛУЧШИМ",
		"{0} PREMIOS AL MEJOR": "НАГРАДЫ ЛУЧШИМ: {0}",
		"Falta indirecta en el área": "Свободный удар в штрафной",
		"CARRERA": "КАРЬЕРА",
		"TIROS": "УДАРЫ",
		"ACELERACION": "УСКОРЕНИЕ",
		"ENTRADA": "ОТБОР",
		"CRUZ": "КРЕСТ",
		"INICIAL": "ИНИЦИАЛ",
		"Sólido": "Сплошной",
		"Espina": "Шип",
		"Puntos": "Точки",
		"Estrellas": "Звезды",
		"Pelo 2": "Волосы 2",
		"Pelo 3": "Волосы 3",
		"Pelo 5": "Волосы 5",
		"Pelo 6": "Волосы 6",
		"Cejas 1": "Брови 1",
		"Cejas 2": "Брови 2",
		"Cejas 3": "Брови 3",
		"Cejas 4": "Брови 4",
		"Cejas 5": "Брови 5",
		"Rastas": "Дреды",
		"Peinado (pieza)": "Прическа (деталь)",
		"Ninguno": "Нет",
		"Máscara": "Маска",
		"Banda": "Повязка",
		"Banda roja": "Красная повязка",
		"Banda azul": "Синяя повязка",
		"Banda negra": "Черная повязка",
		"Banda oro": "Золотая повязка",
		"Fade alto": "Высокий фейд",
		"Fade bajo": "Низкий фейд",
		"Peinado atrás": "Зачес назад",
		"Quiff corto": "Короткий квифф",
		"Banda pelo": "Ободок",
		"Doble brazalete": "Двойной браслет",
		"Media manga": "Полрукава",
		"Banda verde": "Зеленая повязка",
		"Banda rosa": "Розовая повязка",
		"Banda naranja": "Оранжевая повязка",
		"Económicos": "Бюджетные",
		"Clásicos": "Классика",
		"Contemporáneos": "Современные",
		"Sin pelo": "Без волос",
		"Cortes cortos": "Короткие стрижки",
		"Cortes medianos": "Средние стрижки",
		"Cortes largos": "Длинные стрижки",
		"Accesorio de pelo": "Аксессуар для волос",
		"Banda deportiva": "Спортивная повязка",
		"Cinta fina": "Тонкая лента",
		"Liga para recogido": "Резинка для волос",
		"Máscara de protección": "Защитная маска",
		"Sin máscara": "Без маски",
		"Con máscara": "С маской",
		"Tipo de ceja": "Форма бровей",
		"Sin cejas": "Без бровей",
		"Tatuaje facial": "Тату на лице",
		"Lado del rostro": "Сторона лица",
		"Tinta facial": "Цвет тату на лице",
		"Conjuntos completos": "Готовые образы",
		"Clásico": "Классический",
		"Del traje": "В тон костюму",
		"Pañuelo de saco": "Нагрудный платок",
		"Cinturón": "Ремень",
		"Color del accesorio": "Цвет аксессуара",
		"Deportivo": "Спортивный",
		"De lujo": "Люксовый",
		"CLASIF J{0}": "ОТБОР ТУР {0}",
		"SIN PARTIDO": "НЕТ МАТЧА",


		"Aperturas vistas": "Показано интро",
		"· la saltaron": "· пропустили",
		"· salieron al campo": "· вышли на поле",
		"· el estadio tardó más de 3 s (el cine perdió hasta 1 s)": "· стадион грузился дольше 3 с (интро потеряло до 1 с)",
		"Apertura: décimas hasta ver el estadio (peor)": "Интро: десятые доли секунды до показа стадиона (худшее)",
		"·· sin ninguna tirada (no gastó cupo)": "·· без попыток (лимит не потрачен)",
		"·· con una tirada": "·· с одной попыткой",
		"·· con dos o más tiradas": "·· с двумя и более попытками",
		"Academias empezadas": "Академий начато",
		"· pasaron el 1 (MUEVETE)": "· прошли № 1 (ДВИГАЙСЯ)",
		"· pasaron el 2 (PEGALE)": "· прошли № 2 (ПРОБЕЙ)",
		"· pasaron el 3 (ENCARA)": "· прошли № 3 (ОБЫГРАЙ)",
		"· pasaron el 4 (SIRVE AL AREA)": "· прошли № 4 (ПОДАЙ НАВЕС)",
		"· pasaron el 5 (BALON PARADO)": "· прошли № 5 (СТАНДАРТЫ)",
		"Academias terminadas": "Академий завершено",
		"{0} espera respuesta":
			"{0} ждет ответа",
		"Tu oferta caduca. Nadie va a decidir por ti.":
			"Твое предложение истекает. Никто не решит за тебя.",
		"Hoy es tu cumpleaños":
			"Сегодня твой день рождения",
		"El vestuario te ha preparado algo.":
			"Раздевалка кое-что для тебя приготовила.",
		"Tu once te espera.":
			"Твой стартовый состав ждет.",
		"Ya casi estás en forma":
			"Ты почти в форме",
		"Una semana más y vuelves al once.":
			"Еще неделя — и ты вернешься в основу.",
		"Tu carrera sigue ahí":
			"Твоя карьера никуда не делась",
		"Tu temporada con el {0} sigue a medias.":
			"Твой сезон в клубе {0} пройден лишь наполовину.",
		"AVISOS":
			"ПУШИ",
		"AVISARME EN EL TELÉFONO":
			"УВЕДОМЛЯТЬ НА ТЕЛЕФОН",
		"Un recordatorio cuando algo te espera: una oferta que caduca, tu cumpleaños, la vuelta de una lesión. Nunca más de uno al día.":
			"Напоминание, когда тебя что-то ждет: истекающее предложение, твой день рождения, возвращение после травмы. Не больше одного в день.",
		"Los tienes bloqueados para este juego en los Ajustes de tu teléfono.":
			"Ты запретил их для этой игры в настройках телефона.",
		"Altas abiertas (NUEVA CARRERA)": "Экран регистрации открыт (НОВАЯ КАРЬЕРА)",
		"QUITARLO":
			"УБРАТЬ",
		"El día del calendario de fuera en el que el juego se acuerda de ti. Sin año: no hace falta.":
			"День во внешнем календаре, когда игра вспоминает о тебе. Без года: он не нужен.",
		"· entraron al campo":
			"· добрались до поля",
		"· escribieron un nombre (ya jugando)":
			"· ввели имя (уже в игре)",
		"SIGO":
			"ДАЛЬШЕ",
		"LO DEJO POR HOY":
			"НА СЕГОДНЯ ВСЕ",
		"Eso es el juego entero: apuntas, ajustas la fuerza y pegas. Quedan unos ejercicios más para sacarte mejores ofertas de club.":
			"Вот и вся игра: целишься, выставляешь силу и бьешь. Осталось еще несколько упражнений, чтобы получить предложения от клубов получше.",
		"· marcaron su primer gol en la escuela":
			"· забили первый гол в академии",
		"· escribieron un nombre": "· ввели имя",
		"· aceptaron jugarla": "· согласились сыграть",
		"· llegaron a marcar un gol": "· сумели забить гол",
		"Entradas a LA CAJA desde el hub": "Заходы в КОРОБКУ из хаба",
		"Carreras creadas": "Создано карьер",
		"Jornadas jugadas": "Сыграно туров",
		"Arranques del juego (en frío)": "Запуски игры (холодные)",
		"· el anterior se cerró solo (crash o memoria)": "· предыдущий закрылся сам (вылет или память)",
		"· · y fue en pleno partido": "· · и это было посреди матча",
		"· · con la app inactiva (¿cerrada desde el selector?)": "· · при неактивном приложении (закрыто из переключателя?)",
		"· · tras un aviso de memoria de iOS": "· · после предупреждения iOS о памяти",
		"Avisos de memoria de iOS": "Предупреждения iOS о памяти",
		"· en pleno partido": "· посреди матча",
		"Partidos jugados: ganados": "Сыграно матчей: победы",
		"· empatados": "· ничьи",
		"· perdidos": "· поражения",
		"Partidos abandonados desde la pausa": "Матчи, брошенные из паузы",
		"Minutos en el campo": "Минут на поле",
		"Minutos en menús": "Минут в меню",
		"Goles marcados": "Забито голов",
		"· con la selección": "· за сборную",
		"· de penal": "· с пенальти",
		"· · a lo Panenka": "· · в стиле Паненки",
		"· de tiro libre": "· со штрафных",
		"· de córner": "· с угловых",
		"· · olímpicos": "· · прямо с углового",
		"· de cabeza": "· головой",
		"· de volea": "· с лета",
		"· de chilena": "· через себя",
		"· en mano a mano": "· один на один",
		"· en disparo frontal": "· ударом из центра",
		"· desde lejos": "· издалека",
		"· desde ángulo cerrado": "· с острого угла",
		"· al contraataque": "· в контратаке",
		"· en centro al área": "· после навеса в штрафную",
		"· en rebote en el área": "· на добивании в штрафной",
		"· en la jugada de volea": "· в розыгрыше с ударом с лета",
		"· en saque de banda largo": "· после длинного аута",
		"· en falta indirecta en el área": "· со свободного удара в штрафной",
		"· tras regate libre": "· после свободного дриблинга",
		"· saliendo desde tu campo": "· начиная со своей половины",
		"· desde un saque de meta": "· после удара от ворот",
		"· en otras jugadas": "· в других розыгрышах",
		"Hat-tricks (3 goles o más en un partido)": "Хет-трики (3 гола и больше за матч)",
		"Autogoles": "Автоголы",
		"Penales fallados en el partido": "Незабитые пенальти в матчах",
		"Penales fallados en tandas": "Незабитые пенальти в сериях",
		"Tiros desviados por un defensa": "Удары с рикошетом от защитника",
		"· que acabaron en córner": "· которые ушли на угловой",
		"· que el defensa metió en su portería": "· которые защитник срезал в свои ворота",
		"· · a menos de 20 m": "· · ближе 20 м",
		"· · de 20 a 25 m": "· · с 20 до 25 м",
		"· · de 25 a 30 m": "· · с 25 до 30 м",
		"· · a 30 m o más": "· · с 30 м и дальше",
		"· · rematados de cabeza": "· · завершены ударом головой",
		"· · rematados de volea": "· · завершены ударом с лета",
		"· · rematados de chilena": "· · завершены ударом через себя",
		"· a menos de 6 m del arco": "· ближе 6 м от ворот",
		"· de 6 a 16 m": "· с 6 до 16 м",
		"· de 16 a 25 m": "· с 16 до 25 м",
		"· de 25 a 30 m": "· с 25 до 30 м",
		"· a 30 m o más": "· с 30 м и дальше",
		"Gol más lejano (m)": "Самый дальний гол (м)",
		"Tiro libre más lejano metido (m)": "Самый дальний забитый штрафной (м)",
		"Pase de gol más largo (m)": "Самая длинная голевая передача (м)",
		"Asistencias dadas": "Голевых передач",
		"Partidos jugados con el club": "Матчи за клуб",
		"Partidos jugados con la selección": "Сыграно матчей за сборную",
		"Derbis ganados": "Выиграно дерби",
		"Partidos ganados remontando": "Победы после отставания в счете",
		"Títulos de equipo ganados": "Выиграно командных титулов",
		"· ligas": "· лиги",
		"· copas": "· кубки",
		"· continentales de clubes y Mundial de Clubes": "· континентальные клубные титулы и клубные мундиали",
		"· ascensos": "· повышения",
		"· Mundiales con la selección": "· мундиали со сборной",
		"· continentales con la selección": "· континентальные титулы со сборной",
		"Premios individuales": "Индивидуальные награды",
		"· Balones de Oro": "· награды «Игрок года»",
		"Veces Jugador del Partido": "Награды «Игрок матча»",
		"Veces Jugador del Mes": "Награды «Игрок месяца»",
		"Traspasos firmados": "Подписано трансферов",
		"· millones pagados por ellos": "· миллионов заплачено за них",
		"Cargas con un técnico duplicado (se arregló solo)": "Загрузки с дублированным тренером (исправлено автоматически)",
		"· arreglos del carrusel de técnicos en ellas": "· исправления тренерской карусели в них",
		"Goles de club de antes (carreras guardadas)": "Клубные голы из прошлого (сохраненные карьеры)",
		"Asistencias de club de antes": "Клубные голевые передачи из прошлого",
		"Partidos de club de antes": "Клубные матчи из прошлого",
		"Títulos de equipo de antes": "Командные титулы из прошлого",
		"Premios individuales de antes": "Индивидуальные награды из прошлого",
		"Más goles de club en una carrera": "Больше всего клубных голов за карьеру",
		"Más asistencias de club en una carrera": "Больше всего клубных голевых передач за карьеру",
		"Más goles en un partido": "Больше всего голов за матч",
		"Más títulos de equipo en una carrera": "Больше всего командных титулов за карьеру",
		"Más Balones de Oro en una carrera": "Больше всего наград «Игрок года» за карьеру",
		"Jornadas simuladas o vistas": "Туры, симулированные или просмотренные",
		"Temporadas terminadas": "Завершенные сезоны",
		"Carreras llevadas hasta el retiro": "Карьеры, доведенные до завершения",
		"Aperturas de HABILIDAD": "Открытия раздела НАВЫКИ",
		"Aperturas de CONTRATO": "Открытия раздела КОНТРАКТ",
		"Aperturas de RELACIONES": "Открытия раздела ОТНОШЕНИЯ",
		"Aperturas de ASPECTO": "Открытия раздела ВНЕШНОСТЬ",
		"Aperturas de TIENDA": "Открытия раздела МАГАЗИН",
		"Aperturas de CASA": "Открытия раздела ДОМ",
		"Aperturas de TORNEOS": "Открытия раздела ТУРНИРЫ",
		"Aperturas de MERCADO": "Открытия раздела РЫНОК",
		"Aperturas de CARRERA": "Открытия раздела КАРЬЕРА",
		"Aperturas de CALENDARIO": "Открытия раздела КАЛЕНДАРЬ",
		"Aperturas de PLANTILLA": "Открытия раздела СОСТАВ",
		"Aperturas de RANKING": "Открытия раздела РЕЙТИНГ",
		"Aperturas de MAPA": "Открытия раздела КАРТА",
		"Aperturas de TROFEOS": "Открытия раздела ТРОФЕИ",
		"Aperturas de CLUBES": "Открытия раздела КЛУБЫ",
		"Aperturas de LEYENDAS": "Открытия раздела ЛЕГЕНДЫ",
		"Aperturas de BALON": "Открытия раздела ИГРОК ГОДА",
		"Sesiones de PRÁCTICA": "Сеансы ТРЕНИРОВКИ",
		"Sesiones de ENTRENO en el club": "Клубные ТРЕНИРОВКИ",
		"Aperturas del EDITOR de planteles": "Открытия РЕДАКТОРА составов",
		"Decisiones contestadas": "Принятые решения",
		"Semana más lejana alcanzada": "Самая дальняя достигнутая неделя",
		"Temporada más lejana alcanzada": "Самый дальний достигнутый сезон",
		"Nivel más alto alcanzado": "Наивысший достигнутый уровень",
		"+{0} PTS DE HABILIDAD": "+{0} ОЧК. НАВЫКОВ",
		"+{0} XP": "ОПЫТ +{0}",
		"AL BANQUILLO": "В ЗАПАСЕ",
		"PIERDES LA TITULARIDAD": "ТЫ ВНЕ ОСНОВЫ",


		"CAMBIO": "ЗАМЕНА",
		"TE CAMBIAN":
			"ТЕБЯ МЕНЯЮТ",
		"TU NOTA CUANDO TE CAMBIARON":
			"ТВОЯ ОЦЕНКА НА МОМЕНТ ЗАМЕНЫ",
		"Te cambian, y no por descansar. Al túnel, y nadie aplaude.":
			"Тебя меняют — и не ради отдыха. В туннель, и никто не хлопает.",
		"Te cambian, y no por descansar. Fuera del campo, y nadie aplaude.":
			"Тебя меняют — и не ради отдыха. С поля, и никто не хлопает.",
		"TE SACAN DEL CAMPO": "ТЕБЯ СНЯЛИ С ПОЛЯ",
		"OCASIONES SEGUIDAS FALLADAS": "УПУЩЕННЫЕ МОМЕНТЫ ПОДРЯД",
		"MINUTO": "МИНУТА",
		"El míster no esperó a la cuarta. Fuera del campo, y nadie aplaude.":
			"Тренер не стал ждать четвертого. С поля, и никто не хлопает.",
		"El míster no esperó a la cuarta. Al túnel, y nadie aplaude.":
			"Тренер не стал ждать четвертого. В туннель, и никто не хлопает.",
		"LA CONFIANZA DEL TÉCNICO": "ДОВЕРИЕ ТРЕНЕРА",
		"Hoy miras desde aquí. El sitio no se pierde: se deja de merecer.":
			"Сегодня смотришь отсюда. Место не теряют: его перестают заслуживать.",
		"LA FINAL": "ФИНАЛ",
		"VAMOS": "ВПЕРЕД",
		"HIMNO": "ГИМН",
		"CAMISETA DE VITRINA": "ФУТБОЛКА В РАМКУ",
		"LA FINAL DE EUROPA": "ЕВРОПЕЙСКИЙ ФИНАЛ",
		"LA FINAL DE TU SELECCION": "ФИНАЛ ТВОЕЙ СБОРНОЙ",
		"LA FINAL DEL MUNDIALITO": "ФИНАЛ КЛУБНОГО МУНДИАЛЯ",
		"LA FINAL DE COPA": "ФИНАЛ КУБКА",
		"ENFRENTE, {0}": "СОПЕРНИК: {0}",
		"NOCHE EUROPEA": "НОЧЬ В ЕВРОПЕ",
		"DESDE EL BANQUILLO": "СО СКАМЕЙКИ",



		"TU SELECCION": "ТВОЯ СБОРНАЯ",
		"RENOVACION": "ПРОДЛЕНИЕ",
		"FICHAJE": "ПЕРЕХОД",
		"SIGUES EN CASA": "ТЫ ОСТАЕШЬСЯ",
		"FIRMADO Y CERRADO": "ДЕЛО СДЕЛАНО",
		"por partido": "за матч",
		"Te quedas porque quieres. Eso, en este oficio, lo firman pocos.":
			"Ты остаешься, потому что сам этого хочешь. В нашем деле такое подписывают немногие.",



		"Pagaron por ti antes de verte jugar aquí. Ahora hay que darles la razón.":
			"За тебя заплатили, даже не увидев тебя здесь в деле. Теперь докажи, что не зря.",
		"Llegaste sin que nadie pagara un peso. Eso también hay que demostrarlo.":
			"Ты пришел, и никто не заплатил ни копейки. Это тоже нужно доказать.",
		"HOY, EN TU CASA": "СЕГОДНЯ — ДОМА",
		"HOY, EN LA SUYA": "СЕГОДНЯ — У НИХ",
		"tu puesto": "твое место",
		"el suyo": "их место",
		"tus goles": "твои голы",
		"Esa casa fue tuya. Hoy no te van a perdonar ni una.": "Здесь был твой дом. Сегодня тебе не простят ничего.",
		"tu dorsal": "твой номер",
		"No hay plan de partido que arregle un derbi. Se gana o se aguanta.":
			"Дерби не исправить никаким планом на матч. Тут или побеждаешь, или терпишь.",




		"Sois vecinos en la tabla y en la ciudad. Esto no se olvida ni ganándolo.":
			"Вы соседи и по таблице, и по городу. Такое не забудется даже после победы.",
		"Vienen a tu casa a quitarte el sitio. Perder hoy vale por tres derrotas.":
			"Они едут к тебе, чтобы отнять твое место. Проиграть сегодня — все равно что проиграть трижды.",
		"Vas a su casa de líder. No hay tarde que les guste más.":
			"Ты едешь к ним лидером. Для них нет дня приятнее.",
		"Van por delante todo el año. Hoy la tabla no cuenta.":
			"Они впереди весь сезон. Сегодня таблица не в счет.",


		"PASAS DE RONDA": "ПРОШЛИ ДАЛЬШЕ",
		"ELIMINADO": "ВЫЛЕТ",
		"el cruce": "противостояние",
		"rondas ganadas": "выигранные раунды",
		"Una noche más y hay copa. En esta sala ya no habla nadie de suerte.":
			"Еще одна ночь — и кубок наш. В этой раздевалке про везение уже никто не говорит.",
		"Semifinales. Quedan dos partidos para levantarla.":
			"Полуфинал. Осталось два матча, чтобы поднять кубок.",
		"{0} fuera. El cuadro sigue abierto y vosotros dentro.":
			"{0} — за бортом. Сетка еще открыта, и вы в ней.",
		"Fuera a la primera. El vestuario se vacía sin que nadie diga nada.":
			"Вылет на первом же этапе. Раздевалка пустеет без единого слова.",
		"A un partido de la final. Esta sala va a tardar en olvidarlo.":
			"Один матч до финала. Эта раздевалка не скоро это забудет.",
		"{0} os deja fuera. Se acabó la copa y quedan cuarenta domingos.":
			"Вас выбивает {0}. Кубок закончился, а впереди еще сорок воскресений.",
		"{0} os deja fuera. El siguiente es dentro de cuatro años.":
			"Вас выбивает {0}. Следующий — только через четыре года.",


		"Llevas {0} sin ganarles. En esta sala nadie lo ha olvidado.":
			"Без побед над ними: {0}. В этой раздевалке никто не забыл.",
		"Nunca les has ganado. Algún día tiene que ser el primero.":
			"Ты ни разу их не обыгрывал. Когда-нибудь будет первый раз.",
		"No les ganas desde hace {0} años. La gente lleva la cuenta.":
			"Лет без побед над ними: {0}. Люди ведут счет.",
		"Llevas {0} seguidos contra ellos. Hoy vienen a por eso.":
			"Побед над ними подряд: {0}. Сегодня они пришли это прервать.",


		"{0} os ha marcado {1} en estos derbis. Hoy no lo pierdas de vista.":
			"{0} забивал вам в этих дерби (голов: {1}). Сегодня не спускай с него глаз.",

		"AHORA MANDAS TÚ": "ТЕПЕРЬ ТЫ ГЛАВНЫЙ",
		"LAS ÓRDENES": "ПРИКАЗЫ",
		"EL CAMINO": "ПУТЬ",
		"Mientras apuntas, toca a un compañero: cada toque cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.":
			"Пока целишься, нажми на партнера: каждое нажатие меняет его приказ. Голубой бежит к воротам, янтарный стоит на месте, пурпурный уводит за собой опекуна.",
		"El suelo enseña a dónde irá y se borra conforme lo corre. Máximo tres órdenes, sólo duran esa jugada, y arrancan cuando tiras o regateas.":
			"На газоне видно, куда он побежит, и след стирается по мере бега. Максимум три приказа, действуют только в этом эпизоде и запускаются, когда ты бьешь или обводишь.",

		"TU TAQUILLA": "ШКАФЧИК",
		"FIN DE ETAPA": "КОНЕЦ ЭПОХИ",

		"SE VA AL RIVAL": "УШЕЛ К СОПЕРНИКУ",
		"FICHA POR EL RIVAL": "ПЕРЕШЕЛ К СОПЕРНИКУ",
		"venía de": "пришел из",
		"Se fue gratis. A ellos.": "Ушел бесплатно. К ним.",
		"Lo pagaron, y lo pagaron caro. Sigue doliendo.": "За него заплатили, и заплатили дорого. Все еще болит.",

		"CIERRA EL MERCADO": "ОКНО ЗАКРЫВАЕТСЯ",
		"PIDEN": "ПРОСЯТ",
		"SOLO PREGUNTA": "ПРОСТО ИНТЕРЕС",
		"LES FALTAN {0}": "НЕ ХВАТАЕТ {0}",

		"SE QUEDA": "ОСТАЕТСЯ",
		"Se queda. El traspaso se cae.": "Он остается. Трансфер сорвался.",
		"Ya lo tenía decidido. Al menos sabe que se lo pediste.": "Он уже все решил. Зато знает, что ты просил.",
		"Le has quitado la última duda: se va.": "Ты развеял его последние сомнения: он уходит.",
		"Le dio la vuelta: se queda igual.": "Он передумал: все-таки остается.",
		"Sin que nadie le dijera nada, se queda.": "Никто ему ничего не сказал, а он остается.",
		"Se va, y tú no tuviste nada que ver.": "Он уходит, и ты тут ни при чем.",
		"SE LO QUIEREN LLEVAR": "ЕГО ХОТЯТ ЗАБРАТЬ",
		"SUENA PARA OTRO": "ЕГО СВАТАЮТ",
		"PEDIRLE QUE SE QUEDE": "ПОПРОСИТЬ ОСТАТЬСЯ",
		"DECIRLE QUE ES SU OPORTUNIDAD": "СКАЗАТЬ: ЭТО ТВОЙ ШАНС",
		"TU VESTUARIO": "ТВОЯ КОМАНДА",
		"SE LLEVAN A {0}": "{0} УХОДИТ",
		"lo quiere": "его хочет",
		"le quedan": "осталось",
		"Un compañero tuyo tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "У твоего партнера по команде есть предложение, и он еще не сказал «да». Вы одни в раздевалке, и он вот-вот спросит, как поступил бы ты.",
		"{0} tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "{0} получил предложение, но еще не сказал «да». Вы одни в раздевалке, и он вот-вот спросит, как поступил бы ты.",
		"TU CLUB TE RETIENE": "КЛУБ НЕ ОТПУСКАЕТ",
		"No te dejan salir: pide el traspaso primero.": "Тебя не отпускают: сначала попроси о трансфере.",
		"No renuevas: te ponen en el escaparate.": "Не продлеваешь: тебя выставили на продажу.",
		"Tu club te vende. Falta tu respuesta.": "Клуб продает тебя. Ждут твоего ответа.",
		"Quieren cederte. Falta tu respuesta.": "Тебя хотят отдать в аренду. Ждут твоего ответа.",
		"Aceptaste salir: te ofrecen a quien pregunte.": "Ты согласился уйти: тебя предлагают всем желающим.",
		"Pediste salir: ya no te retienen.": "Ты попросил уйти: тебя больше не держат.",
		"Pediste cesión: llegan destinos cada ventana.": "Ты попросил аренду: варианты будут каждое окно.",
		"ULTIMA JORNADA": "ПОСЛЕДНИЙ ТУР",
		"Ultima jornada: mañana ya no hay mercado.": "Последний тур: завтра трансферного окна уже не будет.",
		"MERCADO ABIERTO": "ОКНО ОТКРЫТО",
		"QUEDAN {0}": "ЕЩЕ {0}",
		"INTERESADO": "ИНТЕРЕС",
		"Quedan {0} jornadas de mercado.": "Туров до закрытия окна: {0}.",
		"La ventana cierra esta noche.": "Окно закрывается сегодня ночью.",
		"Se cerró la ventana.": "Окно закрылось.",
		"TE VAS": "УХОДИШЬ",
		"TE QUEDAS": "ОСТАЕШЬСЯ",
		"ofertas": "предложения",
		"la mejor": "лучшее",
		"pedían": "просили",
		"Acordado en el último minuto.": "Договорились в последнюю минуту.",
		"Nadie llegó a lo que pedía tu club.": "Никто не дал столько, сколько просил твой клуб.",
		"Se cerró la ventana y no llamó nadie.": "Окно закрылось, и никто не позвонил.",

		"SE VA LA ESTRELLA": "ЗВЕЗДА УХОДИТ",
		"destino": "куда",
		"traspaso": "сумма",
		"Con ese dinero llega {0}.": "На эти деньги пришел {0}.",
		"Acabó contrato y nadie lo renovó.": "Контракт закончился, и никто его не продлил.",
		"El club todavía no ha fichado a nadie en su lugar.": "Клуб пока никого не подписал ему на замену.",
		"Ni un balón, ni una camiseta. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "Ни мяча, ни футболки. Здесь не осталось ничего твоего, и ты ничего не забираешь.",
		"Una sola cosa cabe en la maleta. Con una basta para acordarse.": "В сумку влезает только одна вещь. Одной хватит, чтобы помнить.",
		"Lo que cabe en una maleta después de todos estos años.": "Вот все, что влезает в одну сумку после стольких лет.",
		"EL DORSAL QUE DEJASTE": "ТВОЙ БЫВШИЙ НОМЕР",
		"SIGUE AHI": "ВСЕ ЕЩЕ ТАМ",
		"EL {0}": "№ {0}",
		"lo llevaste": "ты носил",
		"hoy llevas": "сейчас носишь",
		"Lo llevaste una temporada. A alguien le bastó.": "Ты носил его один сезон. Кому-то этого хватило.",
		"Tú cambiaste de número. Él no.": "Ты сменил номер. Он — нет.",
		"EL PORTERO DE ENFRENTE": "ИХ ВРАТАРЬ",
		"YA TE CONOCE": "УЖЕ ЗНАКОМЫ",
		"LE HAS METIDO {0}": "ТЫ ЗАБИЛ ЕМУ: {0}",
		"TU VILLANO": "ТВОЙ КОШМАР",
		"TE HA MARCADO {0} EN ESTE DERBI": "ГОЛОВ ТЕБЕ В ДЕРБИ: {0}",
		"TE CONOCE DE ANTES": "СТАРЫЙ ЗНАКОМЫЙ",
		"CARA A CARA": "ЛИЦОМ К ЛИЦУ",
		"TE PELEA EL GOLEO": "СОПЕРНИК ПО ГОЛАМ",
		"TE PELEA LAS ASISTENCIAS": "СОПЕРНИК ПО АССИСТАМ",
		"PRONÓSTICO": "ПРОГНОЗ",
		"FAVORITO": "ФАВОРИТ",
		"{0} TEMPORADAS JUNTOS EN {1}": "В КЛУБЕ {1} ВМЕСТЕ: {0} СЕЗ.",
		"reencuentros": "встречи",
		"Todavía no sabe por dónde le vas a entrar.": "Он все еще не знает, с какой стороны ты к нему зайдешь.",
		"Nadie le ha hecho más daño que tú.": "Никто не насолил ему больше, чем ты.",
		"LA PIZARRA DEL RIVAL": "ДОСКА СОПЕРНИКА",
		"ESE ERES TU": "ЭТО ТЫ",
		"LA CHARLA DE HOY": "ТЕМА УСТАНОВКИ",
		"TE ESPERABAN": "ТЕБЯ ЖДАЛИ",
		"EL VERDUGO": "ПАЛАЧ",
		"{0} GOLES DESPUES": "СПУСТЯ {0} ГОЛ.",
		"No se junta esta gente por un jugador cualquiera.": "Ради кого попало столько людей не собирается.",
		"De todo lo que hay en esa pizarra, la única foto es la tuya.": "Из всего, что есть на этой доске, фотография только одна — твоя.",
		"TE CANTAN": "ТЕБЕ ПОЮТ",
		"OVACION": "ОВАЦИЯ",
		"TE OVACIONAN": "ОВАЦИЯ СТОЯ",
		"Aplauden los que venían a verte perder. Eso no lo dan dos veces.":
			"Хлопают те, кто пришел посмотреть, как ты проиграешь. Такое дважды не дарят.",
		"domingos": "воскресенья",
		"tu nota": "твоя оценка",
		"afición": "болельщики",
		"No marcaste. Da igual: se aprendieron tu nombre igual.": "Ты не забил. Неважно: твое имя все равно запомнили.",
		"EMPIEZAS EN EL BANQUILLO": "ТЫ НАЧИНАЕШЬ В ЗАПАСЕ",
		"La primera vez que el once empieza sin ti. Desde aquí también se mira el partido.": "Впервые основа выходит без тебя. Отсюда тоже можно смотреть матч.",
		"división": "дивизион",
		"aforo": "вместимость",
		"Hasta aquí se sube. Ahora hay que quedarse.": "Выше подниматься некуда. Теперь надо удержаться.",
		"Un escalón más. Desde aquí se ve el de arriba.": "Еще одна ступенька. Отсюда видна следующая.",
		"Todo el mundo empieza en un campo como éste.": "Все начинают на таком поле.",
		"SE RETIRA": "ЗАВЕРШЕНИЕ",
		"La cantera del {1} no para: {0}, {2} años, ya es titular": "Академия клуба {1} не подводит: {0} ({2}) уже игрок основы",
		"{0}, {2} años, se gana un puesto en el once del {1}": "{0} ({2}) пробивается в основу клуба {1}",
		"{0}, {2} años, vuelve de su cesión en el {3} y se gana el once del {1}": "{0} ({2}) возвращается из аренды в клубе {3} и пробивается в основу клуба {1}",
		"EL ADIOS": "ПРОЩАНИЕ",
		"TEMPORADAS EN ESTA CASA": "СЕЗОНЫ В ЭТОМ КЛУБЕ",
		"Ni una copa que sacar al césped, y el estadio en pie igual.":
			"Ни одного кубка, чтобы вынести на газон, а стадион все равно аплодирует стоя.",
		"Aquí empezó todo. Y aquí se acaba, con todo lo que ganaste puesto.":
			"Здесь все началось. И здесь же заканчивается — со всем, что ты выиграл, на виду.",
		"Los que te vieron crecer se quedaron de pie hasta el final.":
			"Те, кто видел, как ты рос, стояли до самого конца.",
		"EL BRAZALETE": "ПОВЯЗКА",
		"tu media": "твой рейтинг",
		"temporada": "сезон",
		"El vestuario votó y salió tu nombre. Ahora te toca sostenerlo.":
			"Раздевалка проголосовала, и выпало твое имя. Теперь тебе его нести.",
		"Nadie regala esta cinta: la ganaste domingo a domingo. Ahora no la sueltes.":
			"Эту повязку никто не дарит: ты заработал ее воскресенье за воскресеньем. Теперь не отпускай.",
		"VISITANTE": "В ГОСТЯХ",
		"VUELTA": "ВЕРНУЛСЯ",
		"NO TE HAN PERDONADO": "ТЕБЯ НЕ ПРОСТИЛИ",
		"Te fuiste al rival. Cada vez que vuelvas a este campo la grada empezará en tu contra, y eso ya no se quita.":
			"Ты ушел к сопернику. Каждый раз, когда ты вернешься на этот стадион, трибуны будут против тебя с первой минуты, и это уже не пройдет.",
		"BALÓN DE ORO": "ИГРОК ГОДА",
		"Ningún equipo levanta esto por ti. Este se gana solo.":
			"Эту награду за тебя не поднимет никакая команда. Ее выигрывают в одиночку.",
		"Tú quedaste {0}.": "Ты — {0}.",
		"Tú quedaste {0}, detrás de {1}.": "Ты — {0}. Выше тебя: {1}.",
		"{0} GALA JUNTOS: ÉL {1}, TÚ {2}": "В {0} РАЗ НА ГАЛА: ОН {1}, ТЫ {2}",
		"{0} GALA JUNTOS: {1} {2}, {3} {4}": "В {0} РАЗ НА ГАЛА: {1} {2}, {3} {4}",
		"Este año no entraste en la votación.": "В этом году ты не попал в голосование.",
		"EL MEJOR DEL MUNDO · {0}": "ЛУЧШИЙ В МИРЕ · {0}",
		"TU PRIMER JUGADOR DEL AÑO": "ТВОЙ ПЕРВЫЙ «ИГРОК ГОДА»",
		"TU JUGADOR DEL AÑO Nº {0}": "ТВОЙ «ИГРОК ГОДА» № {0}",
		"TEMPORADAS EN EL OFICIO · CIFRAS EN PRIMERA": "СЕЗОНЫ В ПРОФЕССИИ · ЦИФРЫ В ВЫСШЕЙ ЛИГЕ",
		"LO DEJA CUANDO QUIERE": "УХОДИТ ПО СВОЕЙ ВОЛЕ",
		"{0} años. El cuerpo mandó y no hubo discusión.":
			"Возраст: {0}. Тело решило, и спорить было не о чем.",
		"Nadie te empujó a esto: te vas de pie, que es como se van los pocos.":
			"Никто тебя к этому не толкал: ты уходишь на своих ногах — так уходят немногие.",
		"FIGURA DEL PARTIDO": "ИГРОК МАТЧА",
		"RENOVACIÓN": "ПРОДЛЕНИЕ",
		"SE DESPIDE": "ПРОЩАНИЕ",
		"SE DESPIDE UNA LEYENDA": "ПРОЩАНИЕ ЛЕГЕНДЫ",
		"SE VA UNA LEYENDA": "УХОДИТ ЛЕГЕНДА",
		"VUELVE UNA LEYENDA": "ЛЕГЕНДА ВЕРНУЛАСЬ",
		"Te vas siendo leyenda de esta casa. Tu nombre se queda aquí.": "Ты уходишь легендой этого клуба. Твое имя остается здесь.",
		"Fuiste leyenda aquí. Vienes de rival y aun así se ponen de pie.": "Ты был здесь легендой. Приходишь как соперник — и все равно они встают.",

		"HOMENAJE": "ЧЕСТВОВАНИЕ",
		"Toda una etapa en el mismo club. El club te lo devuelve delante de los tuyos.":
			"Целая эпоха в одном клубе. Клуб платит тебе тем же — на глазах у твоих болельщиков.",
		"HOMENAJE en {0}: {1} temporadas de lealtad. Prima de ${2} y la grada rendida.":
			"ЧЕСТВОВАНИЕ в клубе {0}: {1} сез. верности. Бонус ${2} и трибуны у твоих ног.",
		"LA CAMISETA DEL CLUB ES LA TUYA: {0} unidades": "ФУТБОЛКА КЛУБА — ТВОЯ: {0} шт.",
		"Camisetas: {0} unidades, el nº{1} del vestuario": "Футболки: {0} шт., №{1} в команде",
		"Dos minutos de micrófono y a la ducha. Mañana no se acuerda nadie.":
			"Две минуты у микрофона — и в душ. Завтра никто и не вспомнит.",
		"Firmado. El club apuesta por ti y ahora hay que devolverlo en el campo.":
			"Подписано. Клуб делает ставку на тебя — теперь отплати на поле.",
		"Se acabó aquí. Lo que hiciste con esta camiseta ya no te lo quita nadie.":
			"Здесь все закончилось. То, что ты сделал в этой футболке, у тебя уже никто не отнимет.",
		"Te llamaron. Ahora hay que ir y quedarse.": "Тебя позвали. Теперь надо поехать и закрепиться.",
		"ÚLTIMO DÍA EN EL CLUB": "ПОСЛЕДНИЙ ДЕНЬ В КЛУБЕ",
		"TITULAR CON TU SELECCIÓN": "В ОСНОВЕ СБОРНОЙ",
		"EN LA LISTA DE TU SELECCIÓN": "В ЗАЯВКЕ СБОРНОЙ",

		"VAS AL MUNDIAL": "ТЫ ЕДЕШЬ НА МУНДИАЛЬ",
		"PIDE TU DORSAL": "ПОПРОСИ СВОЙ НОМЕР",
		"ME QUEDO EL {0}": "ОСТАВЛЮ № {0}",
		"SIGUES CON EL {0}": "ОСТАЕТСЯ № {0}",
		"CAMBIA TU DORSAL": "СМЕНИ НОМЕР",
		"EL {0} ES TUYO HASTA EL PROXIMO TORNEO": "№ {0} ТВОЙ ДО СЛЕДУЮЩЕГО ТУРНИРА",
		"PEDISTE EL {0}": "ТЫ ПОПРОСИЛ № {0}",
		"Un continente entero, y tú dentro.": "Целый континент — и ты в его числе.",
		"AÑOS AL IR AL MUNDIAL": "ВОЗРАСТ НА МУНДИАЛЕ",
		"CONVOCATORIA OFICIAL": "ОФИЦИАЛЬНЫЙ ВЫЗОВ",
		"QUEDAS CONVOCADO": "ТЫ ВЫЗВАН",
		"Una carrera cabe en tres o cuatro. Éste es uno.": "За карьеру таких бывает три-четыре. Это — один из них.",
		"RENUEVA UNA TEMPORADA MÁS": "ПРОДЛЕВАЕТ ЕЩЕ НА СЕЗОН",
		"RENUEVA HASTA {0} TEMPORADAS MÁS": "ПРОДЛЕВАЕТ ЕЩЕ НА {0} СЕЗ.",



		"SE VA EN VERANO": "УХОДИТ ЛЕТОМ",
		"FIRMA CON {0} PARA EL VERANO": "ЛЕТОМ ПЕРЕХОДИТ В КЛУБ {0}",
		"Ya está firmado y todavía quedan cinco meses de temporada. Lo que digas hoy es lo que te van a gritar hasta junio.":
			"Все уже подписано, а до конца сезона еще пять месяцев. Что ты скажешь сегодня, то тебе и будут кричать до июня.",
		"¿POR QUÉ TE VAS?": "ПОЧЕМУ ТЫ УХОДИШЬ?",
		"Treinta micrófonos y una sola pregunta. Lo que contestes decide quién carga con esto: el míster, la grada o la prensa.":
			"Тридцать микрофонов и один вопрос. От твоего ответа зависит, кому за это отдуваться: тренеру, трибунам или прессе.",
		"SE LO DIJE AL MÍSTER A LA CARA": "Я СКАЗАЛ ТРЕНЕРУ В ЛИЦО",
		"LE DEBO A ESTA GENTE HASTA JUNIO": "Я ДОЛЖЕН ЭТИМ ЛЮДЯМ ДО ИЮНЯ",
		"ES FÚTBOL, NADA PERSONAL": "ЭТО ФУТБОЛ, НИЧЕГО ЛИЧНОГО",
		"YA NO HAY NADA QUE REPARTIR": "ДЕЛИТЬ БОЛЬШЕ НЕЧЕГО",
		"EN VERANO": "ЛЕТОМ",
		"TU NUEVO SUELDO POR TEMPORADA": "НОВАЯ ЗАРПЛАТА ЗА СЕЗОН",
		"GOLES CON ESTA CAMISETA · {0} PARTIDOS": "ГОЛЫ В ЭТОЙ ФУТБОЛКЕ · МАТЧЕЙ: {0}",
		"AÑOS AL ENTRAR EN LA LISTA": "ВОЗРАСТ ПРИ ПЕРВОМ ВЫЗОВЕ",
		"TU NOTA DEL PARTIDO (×10)": "ТВОЯ ОЦЕНКА ЗА МАТЧ (×10)",
		"JUGADOR DEL PARTIDO": "ИГРОК МАТЧА",
		"{0} GOLES · JUGADOR DEL PARTIDO": "ГОЛЫ: {0} · ИГРОК МАТЧА",
		"HASTA EL AÑO QUE VIENE": "ДО СЛЕДУЮЩЕГО ГОДА",
		"PASAR PÁGINA": "ИДТИ ДАЛЬШЕ",
		"GOLES EN {0} PARTIDOS · {1} ASISTENCIAS": "ГОЛЫ · МАТЧИ: {0} · АССИСТЫ: {1}",
		"Se quedaron a aplaudir igual. Eso también se gana.":
			"Все равно остались аплодировать. Это тоже надо заслужить.",
		"Media grada de vuelta a casa. El año que viene se empieza de cero.":
			"Полстадиона уже едет домой. В следующем году все с нуля.",
		"Las gradas se vaciaron antes del pitido. Hay años así.":
			"Трибуны опустели еще до свистка. Бывают и такие годы.",
		"{0} DE {1} · SIN TÍTULOS": "{0} ИЗ {1} · БЕЗ ТИТУЛОВ",
		"YA FIRMASTE CON OTRO": "ПОДПИСАЛ С ДРУГИМИ",
		"TE VAS Y ELLOS LO SABEN": "ТЫ УХОДИШЬ, И ОНИ ЗНАЮТ",
		"SE TE ACABA EL CONTRATO": "КОНТРАКТ ИСТЕКАЕТ",
		"SE ACABA TU CESIÓN": "АРЕНДА ИСТЕКАЕТ",

		"Te vas dejando una vitrina. Esta grada va a tardar en cantarle a otro.":
			"Ты оставляешь после себя витрину трофеев. Эти трибуны не скоро будут петь кому-то другому.",
		"No siempre se gana, pero aquí ganaste. Eso ya no te lo quita nadie.":
			"Побеждать удается не всегда, но здесь ты побеждал. Этого у тебя уже никто не отнимет.",
		"Ni un título, y aun así están todos de pie. Algo hiciste bien.":
			"Ни одного титула, и все равно все стоят. Что-то ты сделал правильно.",
		"JUGADOR DEL MES": "ИГРОК МЕСЯЦА",
		"MEJOR DEL MES EN TU LIGA": "ЛУЧШИЙ В ЛИГЕ ЗА МЕСЯЦ",
		"TU MEDIA DEL MES (×10)": "СРЕДНЯЯ ЗА МЕСЯЦ (×10)",
		"EL MEJOR DEL MES DE TU LIGA": "ЛУЧШИЙ ИГРОК МЕСЯЦА В ЛИГЕ",
		"SU MEDIA DEL MES (×10)": "СРЕДНЯЯ ЗА МЕСЯЦ (×10)",
		"GOLES EN EL PARTIDO": "ГОЛЫ В МАТЧЕ",
		"goles año": "голы (год)",
		"asist. año": "ассисты (год)",
		"SU MEDIA DE LA TEMPORADA (×10)": "СРЕДНЯЯ ЗА СЕЗОН (×10)",
		"El mejor del año de tu competición, y este año no fue para ti.": "Лучший игрок года в твоем турнире — и в этом году это не ты.",
		"Este mes fue suyo. El siguiente empieza de cero para los dos.": "Этот месяц — его. Следующий для обоих начнется с нуля.",
		"Hoy el micro es suyo. La semana que viene se vuelve a repartir.": "Сегодня микрофон у него. На следующей неделе все решится заново.",
		"el listón": "планка",
		"{0} partidos por encima de todos. El mes siguiente empieza de cero.":
			"Матчей на голову выше всех: {0}. Следующий месяц начнется с нуля.",
		"MEJOR DEL AÑO": "ЛУЧШИЙ ЗА ГОД",
		"TU MEDIA DE LA TEMPORADA (×10)": "ТВОЯ СРЕДНЯЯ ЗА СЕЗОН (×10)",
		"goles": "голы",
		"asist.": "ассисты",
		"partidos": "матчи",
		"El mejor del año en tu competición.": "Лучший за год в твоем турнире.",
		"ADIÓS INTERNACIONAL": "ПРОЩАНИЕ СО СБОРНОЙ",
		"SE RETIRA DE LA SELECCIÓN": "УХОДИТ ИЗ СБОРНОЙ",
		"APARICIONES CON TU PAÍS": "МАТЧИ ЗА СБОРНУЮ",
		"títulos": "титулы",
		"La camiseta del país no se cuelga: se entrega. Que la sude otro.":
			"Футболку сборной не вешают на гвоздь — ее передают. Пусть теперь в ней потеет другой.",
		"NO SE PUDO GUARDAR": "ОШИБКА СОХРАНЕНИЯ",
		"CELEBRACIÓN DE TÍTULOS": "ПРАЗДНОВАНИЕ ТИТУЛОВ",
		"LA CIUDAD ES VUESTRA": "ГОРОД ВАШ",
		"TÍTULOS SOBRE EL AUTOBÚS": "ТРОФЕИ НА АВТОБУСЕ",
		"Hay años que se cuentan por títulos. Éste no cabe en una vitrina.":
			"Бывают годы, которые меряют титулами. Этот в одну витрину не влезет.",
		"Dos en la misma temporada. La ciudad no se lo va a callar.":
			"Два за один сезон. Город об этом молчать не станет.",
		"Un año entero cabe en esta calle, y toda esta gente vino a verlo.":
			"Целый год умещается на этой улице, и все эти люди пришли на него посмотреть.",

		"RECIBIMIENTO EN EL AYUNTAMIENTO": "ПРИЕМ В МЭРИИ",
		"LA PLAZA ES VUESTRA": "ПЛОЩАДЬ ВАША",

		"RECIBIMIENTO EN EL PALACIO": "ПРИЕМ ВО ДВОРЦЕ",
		"EL PAÍS ES VUESTRO": "СТРАНА ВАША",
		"Un país entero bajo un balcón, y una sola copa que enseñarle.":
			"Целая страна под одним балконом — и всего один кубок, чтобы ей показать.",
		"TÍTULOS EN EL BALCÓN": "ТРОФЕИ НА БАЛКОНЕ",
		"Tres títulos y un balcón. El año que nadie esperaba de vosotros.":
			"Три титула и один балкон. Сезон, которого от вас не ждал никто.",
		"Dos en la misma temporada. Abajo no cabe nadie más.":
			"Два за один сезон. Внизу яблоку негде упасть.",
		"No hizo falta cortar la avenida: vino la ciudad entera aquí.":
			"Не пришлось перекрывать проспект: весь город пришел сюда.",
		"LA PEÑA DEL CLUB": "ФАН-КЛУБ",
		"AQUÍ CABE TODO EL CLUB": "ЗДЕСЬ ПОМЕЩАЕТСЯ ВЕСЬ КЛУБ",
		"TÍTULOS SOBRE LA BARRA": "ТРОФЕИ НА СТОЙКЕ",
		"Tres copas en una barra de seis metros. Ya no caben más.":
			"Три кубка на шестиметровой стойке. Больше уже не влезет.",
		"Dos en la misma temporada, y el local se quedó pequeño.":
			"Два за один сезон — и в зале стало тесно.",
		"No vino la ciudad entera. Vinieron los que siempre vienen.":
			"Пришел не весь город. Пришли те, кто приходит всегда.",
		"SUBIMOS": "ПОВЫШЕНИЕ",
		"SALTARON AL CÉSPED · Y NO CABÍA NADIE MÁS": "ВЫБЕЖАЛИ НА ПОЛЕ · ЯБЛОКУ НЕГДЕ УПАСТЬ",
		"Subir cambia el club entero: otro presupuesto, otros rivales, otra vida.":
			"Повышение меняет весь клуб: другой бюджет, другие соперники, другая жизнь.",
		"PUESTO FINAL · DE {0} EQUIPOS": "ИТОГОВОЕ МЕСТО · КОМАНД: {0}",
		"El club entero baja contigo: menos presupuesto, otros rivales, y una temporada para volver.":
			"Весь клуб вылетает вместе с тобой: бюджет меньше, соперники другие и один сезон, чтобы вернуться.",
		"CAMPEON": "ЧЕМПИОН",
		"PASILLO DE HONOR": "КОРИДОР ПОЧЕТА",
		"EN CASA DE {0}": "В ГОСТЯХ: {0}",
		"de ventaja": "отрыв",

		"Con jornadas de sobra y ya no hay nada que discutir. Por eso te aplauden ellos.":
			"В запасе еще несколько туров, и спорить уже не о чем. Поэтому тебе аплодируют даже они.",
		"Te lo reconocen los que lo perdieron. No hay elogio mejor.":
			"Признание от тех, кто упустил титул. Лучшей похвалы не бывает.",
		"LA LISTA": "ЗАЯВКА",
		"ONCE INICIAL": "СОСТАВ НА МАТЧ",
		"TITULARES": "ОСНОВА",
		"SUPLENTES": "ЗАПАСНЫЕ",
		"ESTÁS EN EL ONCE": "ТЫ В ОСНОВЕ",
		"TE QUEDAS FUERA DEL ONCE": "ТЫ НЕ В ОСНОВЕ",
		"NO ESTÁS EN LA LISTA": "ТЕБЯ НЕТ В ЗАЯВКЕ",
		"A ENTRENAR": "НА ТРЕНИРОВКУ",
		"El míster te pone de salida. El sitio hay que sostenerlo.":
			"Тренер выпускает тебя с первых минут. Теперь место нужно удержать.",
		"Empiezas en el banco. Se recupera jugando, no discutiendo.":
			"Ты начинаешь в запасе. Место возвращают игрой, а не спорами.",
		"Esta semana ni te vistes. El lunes se vuelve a empezar.":
			"На этой неделе ты даже не переодеваешься. В понедельник все сначала.",
		"EL ESTADIO LLEVA TU NOMBRE": "СТАДИОН НОСИТ ТВОЕ ИМЯ",
		"ASÍ SE LLAMA DESDE HOY": "ОТНЫНЕ ЕГО ИМЯ",
		"TÍTULOS CON ESTE CLUB": "ТИТУЛЫ С ЭТИМ КЛУБОМ",
		"Los que vengan detrás van a jugar en un sitio que se llama como tú. Eso ya no te lo quita nadie.":
			"Все, кто придет после тебя, будут играть на стадионе, названном в твою честь. Этого у тебя уже никто не отнимет.",
		"CAMPEONES": "ЧЕМПИОНЫ",
		"TUS GOLES EN ESTE TORNEO · {0} PARTIDOS": "ТВОИ ГОЛЫ НА ТУРНИРЕ · МАТЧЕЙ: {0}",
		"CAMPEÓN DE {0}": "ЧЕМПИОН: {0}",
		"CAMPEÓN · {0}": "ЧЕМПИОН · {0}",
		"BIENVENIDO": "ТЫ С НАМИ",
		"DE VUELTA": "СНОВА ДОМА",
		"Aquí ya sabes dónde está todo. Falta que te vuelvan a ver.": "Здесь ты знаешь каждый угол. Осталось снова показать себя.",
		"LLEGAS CEDIDO": "В АРЕНДЕ",
		"FICHAJE LIBRE": "СВОБОДНЫЙ АГЕНТ",
		"NUEVO FICHAJE": "НОВИЧОК",
		"EN LAS GRADAS · AFORO {0}": "НА ТРИБУНАХ · МЕСТ: {0}",
		"En equipo": "Командные",
		"Individuales": "Личные",
		"TRASPASO ${0}": "ТРАНСФЕР ${0}",
		"AL VESTUARIO": "В РАЗДЕВАЛКУ",
		"ESTA SEMANA": "ЭТА НЕДЕЛЯ",
		"PRETEMPORADA": "ПРЕДСЕЗОНКА",
		"TU FICHAJE": "ТВОЙ ПЕРЕХОД",
		"TU RENOVACIÓN": "ПРОДЛЕНИЕ",
		"FINAL DE TEMPORADA": "КОНЕЦ СЕЗОНА",
		"CAMPEÓN": "ЧЕМПИОН",
		"LA GALA": "ГАЛА",
		"Campeón del mundo. No hay nada por encima de esto.":
			"Чемпион мира. Выше этого ничего нет.",
		"La noche que Europa se quedó mirándote a ti.": "Ночь, когда вся Европа смотрела только на тебя.",
		"El mejor club del mundo, y tú dentro.": "Лучший клуб мира — и ты в нем.",
		"Tu continente lleva tu nombre este verano.": "Этим летом твой континент носит твое имя.",
		"Europa por la puerta de atrás. Se entra igual.":
			"В Европу через черный ход. Но ты все равно там.",
		"La tercera copa de Europa también pesa al levantarla.":
			"Третий по значимости еврокубок тоже весит немало, когда его поднимаешь.",
		"Nueve meses para esta tarde. Campeones.": "Девять месяцев ради этого дня. Чемпионы.",
		"Una final, un título. Así de simple y así de difícil.":
			"Один финал — один титул. Вот так просто и вот так сложно.",
		"MEJOR DE LA CHAMPIONS": "ЛУЧШИЙ В КУБКЕ ЭЛИТЫ",
		"El mejor de Europa en la competición que todos miran.":
			"Лучший в Европе в турнире, за которым следят все.",
		"MEJOR DE LA EUROPA LEAGUE": "ЛУЧШИЙ В КУБКЕ ЕВРОПЫ",
		"El mejor de tu Europa. La otra también se gana jugando.":
			"Лучший в твоей Европе. Второй турнир тоже выигрывают игрой.",
		"MEJOR DE LA CONFERENCE": "ЛУЧШИЙ В КУБКЕ ЧЕЛЛЕНДЖ",
		"El mejor de la tercera Europa. Se juega con la misma pelota.":
			"Лучший в третьей Европе. Мяч там такой же.",
		"MEJOR JUGADOR DE LA LIGA": "ЛУЧШИЙ ИГРОК ЛИГИ",
		"Nueve meses de competición y el mejor fuiste tú.":
			"Девять месяцев борьбы — и лучшим был ты.",
		"MEJOR DEL MUNDIALITO": "ЛУЧШИЙ НА КЛУБНОМ ЧМ",
		"Dos partidos contra los campeones del mundo. Mandaste tú.":
			"Два матча против чемпионов мира. И балом правил ты.",
		"MEJOR DE LA COPA": "ЛУЧШИЙ В КУБКЕ",
		"El torneo donde un mal día te elimina. No lo tuviste.":
			"Турнир, где один плохой день — и ты за бортом. У тебя такого не было.",
		"LLENO HISTÓRICO": "РЕКОРДНЫЙ АНШЛАГ",
		"ESTADIO LLENO": "АНШЛАГ",
		"MEDIA ENTRADA": "ПОЛСТАДИОНА",
		"PRESENTACIÓN DISCRETA": "СКРОМНАЯ ПРЕЗЕНТАЦИЯ",
		"¿Última parada o retiro dorado? La grada vino a averiguarlo.":
			"Последняя остановка или золотая пенсия? Трибуны пришли это выяснить.",
		"Nadie entiende qué haces aquí. Vinieron por morbo; convéncelos.":
			"Никто не понимает, что ты здесь делаешь. Пришли из любопытства — переубеди их.",
		"Vienen a ver si eres el refuerzo que les faltaba.":
			"Пришли проверить, тот ли ты игрок, которого им не хватало.",
		"Media grada se acercó a conocer al cedido.": "Полстадиона пришло взглянуть на арендованного новичка.",
		"Una cesión más. Aquí se demuestra jugando.": "Еще одна аренда. Здесь доказывают игрой.",
		"Sin pagar un peso y el estadio no cabe. Eso es un fichajazo.":
			"Ни копейки не заплатили, а стадион трещит по швам. Вот это трансфер.",
		"Se agotaron las entradas para ver un fichaje gratis.": "Все билеты распроданы — и все ради бесплатного трансфера.",
		"Llegas libre y media grada quiso verte la cara.":
			"Ты пришел свободным агентом, и полстадиона пришло на тебя посмотреть.",
		"Sin traspaso y sin ruido. El ruido lo haces tú.":
			"Без трансферной суммы и без шума. Шуметь будешь ты.",
		"El club paró la ciudad para presentarte. No se olvida un día así.":
			"Клуб остановил весь город, чтобы тебя представить. Такой день не забывается.",
		"Lleno para ver a su fichaje. Ahora hay que responder.":
			"Аншлаг ради нового игрока. Теперь нужно ответить.",
		"Media entrada. Te conocen; falta que te quieran.":
			"Полстадиона. Тебя знают — осталось заставить себя полюбить.",
		"El mejor jugador del mundo es suyo. No cabe un alma para verlo.":
			"Лучший игрок мира теперь у них. На трибунах ни одного свободного места.",
		"Cuatro curiosos y una cámara. Aquí se empieza desde abajo.":
			"Пара зевак и одна камера. Здесь начинают с самого низа.",
		"Yo también creí que nadie me alcanzaría. Sigue así.":
			"Я тоже думал, что меня никто не догонит. Так держать.",
		"Los títulos pesan más cuando los cuentan otros. Ya son más los tuyos.":
			"Титулы весят больше, когда их считают другие. Твоих уже больше.",
		"Me costó una vida llegar ahí arriba. A ti te va a costar quedarte.":
			"Мне понадобилась целая жизнь, чтобы туда забраться. Тебе столько же будет стоить удержаться.",
		"No te acostumbres a mirar hacia abajo. Sigue ganando.":
			"Не привыкай смотреть вниз. Продолжай побеждать.",
		"Bienvenido. Aquí arriba se está solo, pero se ve todo.":
			"Добро пожаловать. Здесь, наверху, одиноко, но видно все.",
		"Cada gol mío lo llevo contado. Ahora los tuyos son más. Sigue.":
			"Я знаю наперечет все свои голы. Теперь твоих больше. Продолжай.",
		"Yo marqué hasta el último día. Tú vas más rápido que yo.":
			"Я забивал до последнего дня. Ты идешь быстрее меня.",
		"Los números se rompen para eso. Que alguien rompa los tuyos.":
			"Рекорды для того и существуют. Пусть кто-нибудь побьет и твои.",
		"No pares ahora: al que deja de marcar lo alcanzan en un año.":
			"Не останавливайся: кто перестает забивать, того догоняют за год.",
		"Me tocó verlo desde aquí. Sigue así y no te alcanza nadie.":
			"Мне пришлось смотреть на это отсюда. Продолжай в том же духе — и тебя никто не догонит.",
		"MÁS TÍTULOS DE LA HISTORIA": "РЕКОРД ТИТУЛОВ В ИСТОРИИ",
		"MÁS TÍTULOS": "БОЛЬШЕ ВСЕХ",
		"trofeos": "трофеи",



		"MEJOR JUGADOR DE LA HISTORIA": "ЛУЧШИЙ ИГРОК В ИСТОРИИ",
		"YA NO QUEDA NADIE POR DELANTE": "ВПЕРЕДИ БОЛЬШЕ НИКОГО",
		"DE LA HISTORIA": "В ИСТОРИИ",
		"Todavía no he colgado las botas. Nos vemos en el campo.":
			"Я еще не повесил бутсы на гвоздь. Увидимся на поле.",
		"Disfrútalo, que esta temporada pienso quitártelo.":
			"Наслаждайся, потому что в этом сезоне я собираюсь его у тебя отобрать.",
		"Pasarme con los dos en activo tiene mérito. Ahora aguántalo.":
			"Обойти меня, пока мы оба еще играем, — это достижение. Теперь удержи.",
		"Sigo jugando, y ya sé a quién me toca perseguir.":
			"Я еще играю и теперь знаю, за кем гнаться.",
		"Si me tenía que pasar alguien, mejor uno de casa. Sigamos ganando juntos.":
			"Если кто-то и должен был меня обойти, то лучше свой. Давай и дальше побеждать вместе.",
		"Hoy te lo celebro yo. Mañana, a entrenar como siempre.":
			"Сегодня я праздную вместе с тобой. Завтра — на тренировку, как обычно.",
		"Que se entere el vestuario: aquí jugamos dos de los grandes.":
			"Пусть раздевалка знает: здесь играют двое великих.",
		"Ya no hay nadie delante de ti. Yo sigo jugando, así que no te relajes.":
			"Впереди тебя больше никого. Я еще играю, так что не расслабляйся.",
		"Ya no hay nadie delante de ti. Ahora el nombre a batir es el tuyo.":
			"Впереди тебя больше никого. Теперь рекорд, который надо побить, — твой.",

		"{0}G {1}A": "{0} Г {1} А",
		"media": "средняя",
		"clubes": "клубы",
		"A {0}": "Куда: {0}",
		"temporadas": "сезоны",
		"Ni un balón. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "Ни одного мяча. Здесь не осталось ничего твоего, и ты ничего не забираешь.",
		"La maleta va vacía. Lo que dejaste aquí no cabe en ella: se queda en la grada.": "Сумка уходит пустой. То, что ты здесь оставил, в нее не влезет: оно остается на трибунах.",
		"dorsal": "номер",
		"{0} {1} · JUGADOR DEL PARTIDO": "{0} {1} · ИГРОК МАТЧА",
		"tiros": "удары",
		"pases": "пасы",
		"RECORD": "РЕКОРД",
		"¡A {0}!": "Повышение: {0}!",
		"puntos": "очки",
		"jornadas": "осталось туров",
		"ligas": "лиги",
		"copas": "кубки",
		"europas": "еврокубки",
		"ascensos": "повышения",
		"Este club no había ganado nada parecido en toda su historia. Lo trajiste tú, y aquí no se va a olvidar.":
			"Этот клуб за всю историю не выигрывал ничего подобного. Это принес ты, и здесь этого не забудут.",
		"MENU PRINCIPAL": "ГЛАВНОЕ МЕНЮ",
		"UN JUEGO DE": "АВТОР ИГРЫ",
		"Clubes, ligas, competiciones, estadios y jugadores son ficticios. Football Legacy no está afiliado, patrocinado ni respaldado por ninguna liga, club, federación o competición real.": "Клубы, лиги, турниры, стадионы и игроки вымышлены. Football Legacy не связана ни с одной реальной лигой, клубом, федерацией или турниром, не спонсируется и не одобряется ими.",
		"CODIGO · DISENO · ARTE · SONIDO": "КОД · ДИЗАЙН · АРТ · ЗВУК",
		"TU PRESENTACION": "ПРЕЗЕНТАЦИЯ",
		"SELECCION T{0}": "СБОРНАЯ СЕЗ.{0}",
		"TU MEJOR GOL": "ЛУЧШИЙ ГОЛ",
		"GOLES DE CARRERA": "ГОЛЫ ЗА КАРЬЕРУ",
		"Completa una temporada en {0} división o ficha por un club de {1} para desbloquear.":
			"Чтобы открыть, сыграй полный сезон ({0} лига) или перейди в клуб ({1} лига).",






















		"COMO SALE": "КАК ВЫГЛЯДИТ",
		"CELEBRACION NUEVA": "НОВОЕ ПРАЗДНОВАНИЕ",
		"CELEBRACIONES": "ПРАЗДНОВАНИЯ",
		"SITIOS": "МЕСТА",
		"GESTOS": "ЖЕСТЫ",


		"Celebración por descubrir. Sigue marcando goles.":
			"Празднование еще не открыто. Продолжай забивать.",


		"ESCENAS": "СЦЕНЫ",
		"GLORIA": "СЛАВА",
		"DUELO": "ГОРЕЧЬ",
		"MOMENTOS": "МОМЕНТЫ",
		"REVIVIR": "ПОВТОР",
		"Toca para revivir cómo fue.": "Нажми, чтобы пережить это снова.",
		"Puedes verla otra vez con el botón.": "Можешь пересмотреть ее с помощью кнопки.",
		"Escena por vivir. Sigue jugando tu carrera.": "Сцена еще впереди. Продолжай карьеру.",
		"EL ASCENSO": "ПОВЫШЕНИЕ",
		"LA VUELTA CON LA COPA": "КРУГ ПОЧЕТА С КУБКОМ",
		"LA GALA DEL JUGADOR DEL AÑO": "ГАЛА-ВЕЧЕР «ИГРОК ГОДА»",
		"LA GALA DEL CLUB": "ГАЛА-ВЕЧЕР КЛУБА",
		"LA GALA DE LA LIGA": "ГАЛА-ВЕЧЕР ЛИГИ",
		"EL RECORD": "РЕКОРД",
		"LA LEYENDA TE SALUDA": "ЛЕГЕНДА ПРИВЕТСТВУЕТ",
		"TU SITIO EN LA HISTORIA": "ТВОЕ МЕСТО В ИСТОРИИ",
		"EL ESTADIO CON TU NOMBRE": "СТАДИОН ТВОЕГО ИМЕНИ",
		"EL HOMENAJE": "ЧЕСТВОВАНИЕ",
		"EL DESFILE": "ПАРАД",
		"EL BALCON DEL AYUNTAMIENTO": "БАЛКОН МЭРИИ",
		"LA PEÑA DEL BARRIO": "РАЙОННЫЙ ФАН-КЛУБ",
		"LAS PANTALLAS DE NUEVA YORK": "ЭКРАНЫ НЬЮ-ЙОРКА",
		"LA COPA VUELVE EN AVION": "КУБОК ЛЕТИТ ДОМОЙ",
		"LA OVACION AJENA": "ОВАЦИЯ В ГОСТЯХ",
		"TU CANTO EN LA GRADA": "ТВОЯ ПЕСНЯ НА ТРИБУНАХ",
		"EL PASILLO DEL RIVAL": "КОРИДОР ПОЧЕТА ОТ СОПЕРНИКА",
		"LA PRIMERA CONVOCATORIA": "ПЕРВЫЙ ВЫЗОВ",
		"LA LISTA DEL MUNDIAL": "ЗАЯВКА НА МУНДИАЛЬ",
		"TU VIEJO DORSAL": "СТАРЫЙ НОМЕР",
		"EL BAR DEL BARRIO": "БАР ПО СОСЕДСТВУ",
		"EL DESCENSO": "ВЫЛЕТ",
		"SUBCAMPEON": "СЕРЕБРО",
		"LA FINAL PERDIDA": "ПРОИГРАННЫЙ ФИНАЛ",
		"LA ULTIMA TARDE": "ПОСЛЕДНИЙ ВЕЧЕР",
		"LA LESION": "ТРАВМА",
		"LA PRIMERA BANCA": "ВПЕРВЫЕ В ЗАПАСЕ",
		"LA PITADA": "СВИСТ",
		"EL TECNICO SE VA": "ТРЕНЕР УХОДИТ",
		"LA TAQUILLA VACIA": "ПУСТОЙ ШКАФЧИК",
		"SE FUE AL RIVAL": "УШЕЛ К СОПЕРНИКУ",
		"LA VUELTA AL CAMPO ENEMIGO": "СНОВА НА ВРАЖЕСКОМ ПОЛЕ",
		"EL RECIBIMIENTO AL VERDUGO": "ПРИЕМ ДЛЯ ПАЛАЧА",
		"LA DESPEDIDA DEL VESTUARIO": "ПРОЩАНИЕ С РАЗДЕВАЛКОЙ",
		"EL ULTIMO PARTIDO EN CASA": "ПОСЛЕДНИЙ ДОМАШНИЙ МАТЧ",
		"EL ADIOS A LA SELECCION": "ПРОЩАНИЕ СО СБОРНОЙ",
		"EL PASILLO DE HONOR": "КОРИДОР ПОЧЕТА",
		"LA PRESENTACION": "ПРЕЗЕНТАЦИЯ",
		"LA BIENVENIDA": "ПРИВЕТСТВИЕ",
		"LA FIRMA": "ПОДПИСАНИЕ",
		"LA RUEDA DE PRENSA": "ПРЕСС-КОНФЕРЕНЦИЯ",
		"LA PREGUNTA DEL PRECONTRATO": "ВОПРОС О ПРЕДКОНТРАКТЕ",
		"EL OJEADOR EN LA TRIBUNA": "СКАУТ НА ТРИБУНЕ",
		"LLEGA EL REFUERZO": "ПРИБЫЛО УСИЛЕНИЕ",
		"LOS FICHAJES DEL VERANO": "ЛЕТНИЕ НОВИЧКИ",
		"LA NOCHE DEL CIERRE": "НОЧЬ ДЕДЛАЙНА",
		"TU FICHAJE EN LA PORTADA": "ТВОЙ ПЕРЕХОД НА ПЕРВОЙ ПОЛОСЕ",
		"LA CHARLA CON EL COMPAÑERO": "РАЗГОВОР С ПАРТНЕРОМ",
		"LA LISTA DE LA SELECCION": "ЗАЯВКА СБОРНОЙ",
		"EL VESTUARIO DE COPA": "КУБКОВАЯ РАЗДЕВАЛКА",
		"EL VESTUARIO DEL DERBI": "РАЗДЕВАЛКА ДЕРБИ",
		"LA PORTADA DEL DERBI": "ПЕРВАЯ ПОЛОСА ДЕРБИ",
		"EL MARCADOR DEL DERBI": "ТАБЛО ДЕРБИ",
		"EL ESPEJO DEL DERBI": "ЗЕРКАЛО ДЕРБИ",
		"EL HUECO DEL DERBI": "ПУСТОТА ДЕРБИ",
		"EL PORTERO TE CONOCE": "ВРАТАРЬ ТЕБЯ ЗНАЕТ",
		"LA TANDA DE PENALES": "СЕРИЯ ПЕНАЛЬТИ",
		"EL RECUERDO": "НА ПАМЯТЬ",
		"LA PASARELA DE EQUIPACIONES": "ПОКАЗ ФОРМЫ",

		"LOS AUTOGRAFOS EN LA PUERTA": "АВТОГРАФЫ У ВХОДА",
		"FIRMA LA CAMISETA": "ПОДПИШИ ФУТБОЛКУ",
		"TRES CAMISETAS PARA LA GRADA": "ТРИ ФУТБОЛКИ ДЛЯ ТРИБУН",
		"CAMISETAS FIRMADAS": "ПОДПИСАНО ФУТБОЛОК",
		"Ganaste, y tres se van a casa con tu firma.": "Ты победил, и трое уйдут домой с твоим автографом.",
		"No hubo victoria, pero tres se van a casa con tu firma.": "Победы не было, но трое уйдут домой с твоим автографом.",
		"LAS FIRMAS EN LA GRADA": "АВТОГРАФЫ НА ТРИБУНЕ",
		"LA FIRMA DE FOTOS": "АВТОГРАФЫ НА ФОТО",
		"FIRMA LA FOTO": "ПОДПИШИ ФОТО",
		"FOTOS FIRMADAS": "ПОДПИСАНО ФОТО",
		"EVENTO CON LA AFICION": "ВСТРЕЧА С БОЛЕЛЬЩИКАМИ",
		"FIRMA DE FOTOS": "АВТОГРАФ-СЕССИЯ",
		"Tu primer evento con la afición: cinco fotos con tu firma.": "Твоя первая встреча с болельщиками: пять фото с твоим автографом.",
		"Y la cola seguía: {0} más esperando su foto.": "А очередь все тянулась: фото ждут еще {0}.",
		"Cinco fotos con tu firma, cinco que se van contentos.": "Пять фото с автографом — пятеро довольных.",
		"Firma con el dedo": "Распишись пальцем",
		"BORRAR FIRMA": "СТЕРЕТЬ ПОДПИСЬ",
		"AFICIÓN +{0}": "ТРИБУНЫ +{0}",
		"AFICIONADOS ESPERANDO": "БОЛЕЛЬЩИКИ ЖДУТ",
		"TU PRIMER AUTÓGRAFO": "ТВОЙ ПЕРВЫЙ АВТОГРАФ",
		"TE ESPERABAN EN LA PUERTA": "ТЕБЯ ЖДАЛИ У ВХОДА",
		"Pocos, pero vinieron por ti. Así empieza todo.": "Их немного, но они пришли ради тебя. Так все и начинается.",
		"Ya te reconocen desde lejos. Y tu coche también.": "Тебя уже узнают издалека. И твою машину тоже.",
		"Llegar a entrenar ya es un acontecimiento.": "Твой приезд на тренировку — уже событие.",
		"Primer Autógrafo": "Первый автограф",
		"Firmar una camiseta a la gente que te espera en la puerta de la ciudad deportiva.": "Расписаться на футболке для людей, которые ждут тебя у входа на тренировочную базу.",

		"La Más Vendida": "Бестселлер",
		"Que tu camiseta sea la más vendida del vestuario en una temporada.": "Продать больше всех футболок в команде за сезон.",
		"All-in": "Ва-банк",
		"Ganar el torneo de póquer de tu casa.": "Выиграть покерный турнир у себя дома.",
		"La Ley del Ex": "Закон бывшего",
		"Marcarle un gol a un club del que te fuiste.": "Забить клубу, из которого ты ушел.",
		"Una Vida Entera": "Целая жизнь",
		"Vivir 50 escenas distintas del álbum en una misma carrera.": "Пережить 50 разных сцен альбома за одну карьеру.",
		"Conquistador de Europa": "Покоритель Европы",
		"Conquistador de Sudamérica": "Покоритель Южной Америки",
		"Conquistador de Norteamérica": "Покоритель Северной Америки",
		"Conquistador de África": "Покоритель Африки",
		"Conquistador de Asia": "Покоритель Азии",
		"Conquistador de Oceanía": "Покоритель Океании",
		"Libro Completo": "Полное собрание",
		"Vencer a todos los clubes y selecciones de Europa.": "Обыграть все клубы и сборные Европы.",
		"Vencer a todos los clubes y selecciones de Sudamérica.": "Обыграть все клубы и сборные Южной Америки.",
		"Vencer a todos los clubes y selecciones de Norteamérica, Centroamérica y el Caribe.": "Обыграть все клубы и сборные Северной и Центральной Америки и Карибского бассейна.",
		"Vencer a todos los clubes y selecciones de África.": "Обыграть все клубы и сборные Африки.",
		"Vencer a todos los clubes y selecciones de Asia.": "Обыграть все клубы и сборные Азии.",
		"Vencer a todos los clubes y selecciones de Oceanía.": "Обыграть все клубы и сборные Океании.",
		"Vencer a todos los rivales del juego: cada club y cada selección del mundo.": "Обыграть всех соперников в игре: каждый клуб и каждую сборную мира.",
		"Álbum Completo": "Полный альбом",
		"Descubrir todos los arquetipos de pareja.": "Открыть все типажи вторых половинок.",
		"Rodeado": "В осаде",
		"Firmar autógrafos con 40 aficionados o más esperándote en la puerta.": "Раздать автографы, когда у входа тебя ждут 40 болельщиков или больше.",
		"Turista de Estadios": "Стадионный турист",
		"Jugar en 25 estadios distintos.": "Сыграть на 25 разных стадионах.",
		"El Brazalete": "Повязка",
		"Ser el capitán de tu club.": "Стать капитаном своего клуба.",
		"Desde los Once Metros": "С одиннадцати метров",
		"Marcar el penal que gana una tanda.": "Забить решающий пенальти в серии.",
		"Carta de Presentación": "Визитная карточка",
		"Marcar en tu debut con un club nuevo.": "Забить в дебютном матче за новый клуб.",
		"De Hierro": "Железный",
		"Jugar 20 partidos o más en una temporada sin perderte ninguno por lesión.": "Сыграть 20 матчей или больше за сезон, не пропустив ни одного из-за травмы.",
		"Niño Prodigio": "Вундеркинд",
		"Debutar en Primera División antes de cumplir 18 años.": "Дебютировать в высшей лиге до 18 лет.",
		"Roble Viejo": "Старый дуб",
		"Marcar un gol con 38 años o más.": "Забить гол в 38 лет или старше.",
		"EL ALTA MEDICA": "ДОПУСК ВРАЧЕЙ",
		"LA MUDANZA": "ПЕРЕЕЗД",
		"LAS OFERTAS DEL REGRESO": "ПРЕДЛОЖЕНИЯ НА КАМБЭК",
		"¡ALARMA!": "ТРЕВОГА!",
		"MUSEO DE {0}": "МУЗЕЙ: {0}",
		"¿ME FIRMA LA GORRA?": "РАСПИШЕШЬСЯ НА КЕПКЕ?",
		"EL MUSEO DE TU EGO": "МУЗЕЙ ТВОЕГО ЭГО",
		"CLASE DE BAILE": "УРОК ТАНЦЕВ",
		"PROFESOR: {0}": "УЧИТЕЛЬ: {0}",
		"LA CLASE DE LAS ABUELAS": "ГРУППА БАБУШЕК",
		"ESTRENO MUNDIAL": "МИРОВАЯ ПРЕМЬЕРА",
		"LA PELÍCULA DE {0}": "ФИЛЬМ «{0}»",
		"LA PELÍCULA DE TU VIDA": "ФИЛЬМ ТВОЕЙ ЖИЗНИ",
		"DURACIÓN: 4 H 38 MIN": "ИДЕТ 4 Ч 38 МИН.",
		"EL ESTRENO": "ПРЕМЬЕРА",
		"TODAS LAS ESCENAS": "ВСЕ СЦЕНЫ",
		"Tu vida, en cines. Dura cuatro horas y media y nadie se ha ido.": "Твоя жизнь в кино. Идет четыре с половиной часа, и никто не ушел.",
		"¡NO ME CUENTES EL FINAL!": "БЕЗ СПОЙЛЕРОВ!",
		"MARTES, 19:00": "ВТ, 19:00",
		"MÍSTERS ANÓNIMOS": "АНОНИМНЫЕ ТРЕНЕРЫ",
		"PASO 1: ACEPTAR QUE LO SENTASTE": "ШАГ 1: ПРИЗНАЙ, ЧТО ПОСАДИЛ ЕГО",
		"TERAPIA DE MÍSTERS": "ТРЕНЕРСКАЯ ТЕРАПИЯ",
		"TERAPIA DE MISTERS": "ТРЕНЕРСКАЯ ТЕРАПИЯ",
		"TODOS LOS TÉCNICOS": "ВСЕ ТРЕНЕРЫ",
		"Los has tenido a todos. Ahora se reúnen los martes para superarlo.": "У тебя были все они. Теперь по вторникам они собираются, чтобы это пережить.",
		"¡ES ÉL! ¡EL QUE PEDÍA SER TITULAR!": "ЭТО ОН! ТОТ, КТО ПРОСИЛСЯ В ОСНОВУ!",
		"RESERVA PARA SIETE": "СТОЛИК НА СЕМЕРЫХ",
		"LA CENA DE LAS EX": "УЖИН БЫВШИХ",
		"TODAS LAS PAREJAS": "ВСЕ ПОЛОВИНКИ",
		"Las has conocido a todas. Todas. En la misma mesa.": "Ты встречался с каждой. С каждой. И все — за одним столом.",
		"PAGA ÉL, ¿NO?": "ПЛАТИТ ОН, ДА?",
		"DOMINGO, 13:00": "ВС, 13:00",
		"LOS DERROTADOS": "ПОБЕЖДЕННЫЕ",
		"BARBACOA DE LOS DERROTADOS": "БАРБЕКЮ ПОБЕЖДЕННЫХ",
		"TODOS LOS RIVALES": "ВСЕ СОПЕРНИКИ",
		"Les ganaste a todos. Te invitaron igual. La salchicha, quemada.": "Ты обыграл всех. Тебя все равно позвали. Сосиска подгорела.",
		"BARBACOA ANUAL": "ЕЖЕГОДНОЕ БАРБЕКЮ",
		"PERDIMOS CONTRA {0}": "{0} НАС ОБЫГРАЛ",
		"TE GUARDAMOS LA SALCHICHA QUEMADA": "ОСТАВИЛИ ТЕБЕ ГОРЕЛУЮ СОСИСКУ",
		"03:12 · MUSEO CERRADO": "03:12 · МУЗЕЙ ЗАКРЫТ",
		"EL CONSERJE DEL SALÓN": "СМОТРИТЕЛЬ ЗАЛА СЛАВЫ",
		"TU PRIMERA PLACA": "ПЕРВАЯ ТАБЛИЧКА",
		"Ya estás en el Salón de la Fama. El conserje tiene la foto que lo demuestra.": "Ты уже в Зале славы. У смотрителя есть фото, которое это доказывает.",
		"PARA MI CUÑADO, QUE NO SE LO CREE": "ДЛЯ ШУРИНА — ОН НЕ ВЕРИТ",
		"INAUGURACIÓN": "ОТКРЫТИЕ",
		"TU ESTATUA": "ТВОЯ СТАТУЯ",
		"LA ESTATUA": "СТАТУЯ",
		"TODA LA COLECCIÓN": "ВСЯ КОЛЛЕКЦИЯ",
		"Lo has completado todo. Te han hecho una estatua. El pelo es del utillero.": "Ты собрал все. Тебе поставили статую. Волосы лепили с экипировщика.",
		"LEYENDA ETERNA": "ВЕЧНАЯ ЛЕГЕНДА",
		"¿ESE PELO ES DEL UTILLERO?": "ЭТО ВОЛОСЫ ЭКИПИРОВЩИКА?",
		"TODOS LOS FESTEJOS": "ВСЕ ПРАЗДНОВАНИЯ",
		"Te sabes todos los festejos. Ahora ellas también.": "Ты знаешь все празднования. Теперь и они тоже.",
		"¡AHORA LA DE QUITARSE LA CAMISETA!": "А ТЕПЕРЬ СНИМАЕМ ФУТБОЛКИ!",
		"TODOS LOS LOGROS": "ВСЕ ДОСТИЖЕНИЯ",
		"Lo tienes todo. Hasta el guardia de noche es fan tuyo.": "У тебя есть все. Даже ночной охранник — твой фанат.",
		"LA FIRMA DEL REGRESO": "КОНТРАКТ НА КАМБЭК",


		"EL BANDERIN": "К ФЛАЖКУ",
		"El clásico: todo el equipo corre al banderín del lado por donde entró el balón.":
			"Классика: вся команда бежит к угловому флажку с той стороны, откуда пришел мяч.",
		"CON LA GENTE": "К БОЛЕЛЬЩИКАМ",
		"Al fondo, detrás de la línea de gol. En casa, además, te abrazas con un aficionado.":
			"В конец поля, за линию ворот. А дома тебя еще и обнимает болельщик.",
		"LA PIÑA": "КУЧА-МАЛА",
		"Nadie se va a ningún lado: la montonera se arma justo donde marcaste.":
			"Никто никуда не бежит: куча-мала собирается прямо там, где ты забил.",
		"CON LOS SUPLENTES": "К ЗАПАСНЫМ",
		"A la banda, con los suplentes. El gol del que acaba de entrar se festeja con los que siguen en el banco.":
			"К бровке, к запасным. Гол того, кто только что вышел на замену, празднуют с теми, кто еще сидит на скамейке.",
		"AL CENTRO": "В ЦЕНТР",
		"Balón bajo el brazo y a sacar de nuevo. Todavía no hay nada que festejar.":
			"Мяч под мышку — и на розыгрыш с центра. Праздновать еще нечего.",
		"TU RINCON": "ТВОЙ СЕКТОР",
		"Sólo de visita: a la esquina donde está tu puñado de aficionados.":
			"Только в гостях: в угол, где сидит горстка твоих болельщиков.",
		"SALTAR LA VALLA": "ЧЕРЕЗ БОРТИК",
		"Sólo en casa: saltas la publicidad y te vas hasta el pie de la grada. Esa esquina se vuelve loca.":
			"Только дома: перепрыгиваешь через рекламные щиты и бежишь к самой трибуне. Этот угол сходит с ума.",
		"AL TECNICO": "К ТРЕНЕРУ",
		"Vienes de bronca con el entrenador y te vas a la raya a abrazarlo. Una sola vez por partido.":
			"Ты был в ссоре с тренером — и бежишь к бровке его обнять. Только раз за матч.",
		"EN SU CASA": "У НИХ ДОМА",
		"Gol en un derbi, de visita: lo festejas frente a su fondo. Te abuchea el estadio entero y te llueven botellas.":
			"Гол в дерби на выезде: ты празднуешь перед их фанатской трибуной. Весь стадион свистит, и на тебя летят бутылки.",
		"PARA LA TELE": "НА КАМЕРУ",
		"Te plantas delante de la cámara de televisión y el gol se ve por su visor. Sólo donde hay transmisión: en tercera no hay cámaras.":
			"Встаешь прямо перед телекамерой, и гол видно через ее видоискатель. Только там, где есть трансляция: в третьем дивизионе камер нет.",
		"ES NUESTRO": "ЭТО НАШЕ",
		"Última jornada, y el gol te pone por delante. Salta hasta el banquillo al campo.":
			"Последний тур, и твой гол выводит вас вперед. На поле выбегает даже скамейка.",


		"DE RODILLAS": "НА КОЛЕНЯХ",
		"Llegas barriéndote de rodillas. Una de cada tres veces, en los festejos con carrera de verdad.":
			"Ты подъезжаешь, скользя на коленях. Каждый третий раз — в празднованиях с настоящей пробежкой.",
		"PUÑO AL AIRE": "КУЛАК ВВЕРХ",
		"El salto con el puño cerrado, en el gol agónico que lo cambia todo.":
			"Прыжок со сжатым кулаком — после гола на последних секундах, который меняет все.",
		"BALON A LA GRADA": "МЯЧ НА ТРИБУНУ",
		"La otra cara del gol agónico: reventar el balón hacia arriba y que caiga donde caiga.":
			"Другая сторона гола на последних секундах: со всей силы выбить мяч в небо, а там пусть падает куда угодно.",
		"BANDERIN PARTIDO": "ФЛАЖОК ПОПОЛАМ",
		"Llegas al córner y le metes una patada al mástil. Se parte. Uno de cada seis córners.":
			"Подбегаешь к углу поля и пинаешь древко флажка. Оно ломается. Каждый шестой раз.",
		"MASTIL AGARRADO": "РУКА НА ФЛАЖКЕ",
		"Llegas al córner, agarras el mástil con el puño y te plantas con la mano en la cadera.": "Подбегаешь к углу, хватаешь древко кулаком и замираешь, уперев другую руку в бок.",
		"SIN CAMISETA": "БЕЗ ФУТБОЛКИ",
		"Te quitas la camiseta y les enseñas el dorsal. Siempre trae factura: abucheo y botellas.":
			"Снимаешь футболку и показываешь им номер на спине. Расплата всегда одна: свист и бутылки.",
		"EL SILENCIO": "ТИШИНА",
		"Plantarte quieto frente a su fondo mientras el estadio te abuchea. No hacer nada es el gesto.":
			"Замереть перед их трибуной, пока стадион свистит. Ничего не делать — вот и весь жест.",
		"BRAZOS ABIERTOS": "РУКИ В СТОРОНЫ",
		"Con el brazalete de tu país: brazos abiertos, pidiéndole más a tu gente.":
			"С капитанской повязкой сборной: руки в стороны, требуешь от своих еще больше.",
		"GRACIAS, SOCIO": "СПАСИБО, БРАТ",
		"El gol lo empezó otro: vino de un centro o de un córner, y lo primero que haces es señalar a quien lo puso.":
			"Гол начал другой: он пришел после навеса или углового, и первым делом ты показываешь на того, кто подал.",
		"LA REVERENCIA": "ПОКЛОН",
		"Un golazo: desde fuera del área o de falta directa. Te giras hacia la grada y te inclinas. La mitad de las veces.":
			"Шедевр: из-за штрафной или прямым штрафным. Ты поворачиваешься к трибуне и кланяешься. В половине случаев.",
		"BESO AL ESCUDO": "ПОЦЕЛУЙ ГЕРБА",
		"Tres temporadas o más en el mismo club. Ya no eres un fichaje, eres de la casa: besas el escudo y la grada lo sabe.":
			"Три сезона или больше в одном клубе. Ты уже не новичок, ты свой: целуешь герб, и трибуна это знает.",
		"TRES DEDOS": "ТРИ ПАЛЬЦА",
		"Tu tercer gol del partido. No hay nada que explicar: levantas tres dedos y que los cuenten ellos.":
			"Твой третий гол в матче. Объяснять нечего: показываешь три пальца, а считают пусть они.",
		"SIN FESTEJAR": "БЕЗ РАДОСТИ",
		"Le marcaste al club que te formó. Te quedas quieto, con la mano en alto. Los otros nueve vienen a abrazarte igual.":
			"Ты забил клубу, который тебя воспитал. Стоишь неподвижно, подняв руку. Остальные девять все равно бегут тебя обнимать.",
		"AL CIELO": "В НЕБО",
		"Tu primer gol después de una lesión larga. Señalas al cielo. Sólo cuenta ese gol, no los de después.":
			"Твой первый гол после долгой травмы. Ты показываешь в небо. Считается только этот гол, не следующие.",


		"A TU PORTERO":
			"К ВРАТАРЮ",
		"Tu portero te salvó el partido con una parada. El festejo se va hacia TU campo y él viene corriendo desde su área.":
			"Твой вратарь спас матч сейвом. Празднование уходит на ТВОЮ половину, а он бежит навстречу из своей штрафной.",
		"AL FOSO":
			"К ФОТОГРАФАМ",
		"Sólo de noche, con los focos encendidos: te plantas contra la valla del fondo y el estadio entero se te llena de flashes.":
			"Только ночью, при включенных прожекторах: ты встаешь у ограждения за воротами, и весь стадион озаряется вспышками.",
		"A LA TRIBUNA":
			"К ГЛАВНОЙ ТРИБУНЕ",
		"Hay clubes preguntando por ti. Te vas a la banda de la tribuna principal y señalas hacia el palco: que decidan ellos.":
			"Тобой интересуются клубы. Ты бежишь к бровке у главной трибуны и показываешь на ложу: пусть решают они.",
		"EN SU AREA":
			"НА ИХ ТОЧКЕ",
		"Derbi de visita: no corres a ningún lado. Te plantas en el punto de penalti, de espaldas al arco y de cara a su gente, con los brazos abiertos.":
			"Дерби на выезде: ты никуда не бежишь. Встаешь на одиннадцатиметровую отметку спиной к воротам, лицом к их болельщикам, раскинув руки.",
		"NADIE VIENE":
			"ТЫ ОДИН",
		"El vestuario no te quiere. Marcas, y ninguno de los diez va a abrazarte: se dan la vuelta y te dejan ahí.":
			"Раздевалка против тебя. Ты забиваешь, и ни один из десяти не идет обниматься: они разворачиваются и оставляют тебя одного.",
		"MAS RUIDO":
			"ГРОМЧЕ!",
		"En casa: las dos manos a las orejas, pidiéndole a tu gente que se oiga.":
			"Дома: обе ладони к ушам — просишь своих болельщиков петь громче.",
		"BESAR EL CESPED":
			"ПОЦЕЛУЙ ГАЗОНА",
		"Tu primera temporada en el club: te arrodillas y besas el césped de tu casa nueva.":
			"Твой первый сезон в клубе: ты встаешь на колени и целуешь газон своего нового дома.",
		"APLAUSO A TU GENTE":
			"АПЛОДИСМЕНТЫ СВОИМ",
		"Marcas, pero seguís perdiendo: nada de gritos, aplaudes a los que vinieron a verte.":
			"Ты забиваешь, но вы все еще проигрываете: никаких криков, ты аплодируешь тем, кто пришел на тебя посмотреть.",
		"SALUDO DE GOLEADA":
			"ПРИВЕТ ТРИБУНАМ",
		"Con tres goles o más de ventaja ya no hay nada que gritar: caminas saludando a la grada.":
			"Когда ведешь в три мяча или больше, кричать уже не о чем: идешь и машешь трибунам.",
		"SALTO DE CABEZA":
			"ПРЫЖКИ ВВЕРХ",
		"Gol por alto: saltas una y otra vez con los brazos al cielo.":
			"Гол головой или в воздухе: прыгаешь снова и снова, вскинув руки к небу.",
		"EL AVION":
			"САМОЛЕТ",
		"Corres al festejo con los brazos abiertos, planeando como un avión. Sólo en los festejos con carrera de verdad.":
			"Бежишь праздновать, раскинув руки и планируя, как самолет. Только в празднованиях с настоящей пробежкой.",
		"LA SELFIE":
			"СЕЛФИ",
		"Pegado a tu gente —tu fondo o la valla en casa, tu rincón de visita—: sacas el teléfono y te haces una foto con ellos.":
			"Вплотную к своим — у своей трибуны или ограждения дома, в своем секторе в гостях: достаешь телефон и делаешь с ними фото.",
		"ES MI HORA":
			"МОЕ ВРЕМЯ",
		"Gol del minuto 80 en adelante: te señalas la muñeca, que es tu hora. Una de cada tres veces.":
			"Гол с 80-й минуты и позже: стучишь по запястью — это твое время. Каждый третий раз.",
		"MODO ZEN":
			"ДЗЕН",
		"Con dos goles de ventaja o más: te sientas en el césped con las piernas cruzadas y meditas. Que se preocupen ellos.":
			"Когда ведешь в два мяча или больше: садишься на газон, скрестив ноги, и медитируешь. Пусть волнуются они.",
		"BESO AL ANILLO":
			"ПОЦЕЛУЙ КОЛЬЦА",
		"Tienes pareja: besas el anillo y señalas a la grada, a quien te mira desde allí. Uno de cada cinco goles.":
			"У тебя есть вторая половинка: целуешь кольцо и показываешь на трибуну — тому, кто смотрит на тебя оттуда. Каждый пятый гол.",
		"MI NOMBRE":
			"МОЕ ИМЯ",
		"Hay clubes preguntando por ti: te das la vuelta y te señalas el nombre de la espalda para que lo apunten. La mitad de las veces.":
			"Тобой интересуются клубы: ты поворачиваешься спиной и показываешь на фамилию на футболке, чтобы ее записали. В половине случаев.",
		"LA MORTAL":
			"САЛЬТО",
		"Un golazo, desde fuera del área o de falta: llegas, tomas impulso y das una mortal hacia atrás. La otra mitad de los golazos.":
			"Шедевр из-за штрафной или со штрафного: подбегаешь, разбегаешься и делаешь сальто назад. Вторая половина шедевров.",
		"EL DAB":
			"ДЭБ",
		"Se gana en el banquillo, con tus tres botellas de pie: escondes la cara en el codo y apuntas con el otro brazo. Uno de cada siete goles.":
			"Открывается на скамейке, когда все три твои бутылки стоят: прячешь лицо в локоть и указываешь другой рукой. Каждый седьмой гол.",
		"¡DAB DESBLOQUEADO! Ya sale en tus goles.":
			"ДЭБ ОТКРЫТ! Теперь он есть в твоих празднованиях.",
		"Se gana en el banquillo, con tres partidas ganadas 2-0: te plantas cara a cara con un compañero y os jugáis el gol a una mano. Uno de cada siete goles.":
			"Открывается на скамейке тремя победами со счетом 2:0: встаешь лицом к лицу с партнером, и вы разыгрываете гол одной рукой. Каждый седьмой гол.",
		"2-0: {0} de {1} para festejar tus goles con CHIN CHAN PU.":
			"2:0: {0} из {1}, чтобы праздновать голы в КАМЕНЬ-НОЖНИЦЫ-БУМАГУ.",
		"¡CHIN CHAN PU DESBLOQUEADO! Ya sale en tus goles.":
			"КАМЕНЬ-НОЖНИЦЫ-БУМАГА: ОТКРЫТО! Теперь есть в твоих празднованиях.",
		"BRAZOS CRUZADOS":
			"РУКИ НА ГРУДИ",
		"Ya habías fallado dos claras hoy. A la tercera no festejas: te cruzas de brazos y que hablen ellos.":
			"Ты уже упустил сегодня два верных момента. Третий не празднуешь: скрещиваешь руки на груди, и пусть говорят они.",


		"AL CHARCO":
			"В ЛУЖУ",
		"Sólo con lluvia y campo encharcado: todo el equipo corre al charco más cercano y se lanza de panza. Salpica hasta la valla.":
			"Только в дождь, на раскисшем поле: вся команда бежит к ближайшей луже и плюхается в нее животом. Брызги долетают до ограждения.",
		"EN LA VALLA":
			"НА ОГРАЖДЕНИИ",
		"Sólo en casa: te subes a la publicidad con los dos que llegan contigo. Los tres, sentados y de brazos cruzados, mirando al campo.":
			"Только дома: ты забираешься на рекламные щиты вместе с двумя партнерами, которые подбежали к тебе. Все трое сидят, скрестив руки, и смотрят на поле.",
		"LA BOTELLA":
			"БУТЫЛКА",
		"Festejando pegado a tu grada, alguien te tira una botella de agua: la atrapas al vuelo, te la bebes y la mandas de vuelta.":
			"Ты празднуешь у своей трибуны, и кто-то бросает тебе бутылку воды: ловишь ее на лету, пьешь и бросаешь обратно.",


		"EN TU PUESTO MANDA": "НА ТВОЕМ МЕСТЕ",
		"Empiezas en el banquillo.": "Начинаешь в запасе.",

		"JUEGAS EN {0} · PIDE {1}": "ТВОЯ ЛИГА: {0} · НУЖНА: {1}",
		"NOTA {0} · PIDE {1}": "ОЦЕНКА {0} · НУЖНО {1}",
		"{0} A {1} DE TU SITIO": "{0}: {1} ДО ТВОЕГО МЕСТА",
		"{0} A {1}": "{0}: {1} ДО",
		"DE TU SITIO": "ТВОЕГО МЕСТА",
		"TÉCNICO {0} · PIDE {1}": "ТРЕНЕР {0} · НУЖНО {1}",
		"TÉCNICO {0}": "ТРЕНЕР {0}",
		"A {0} DE {1}": "ДО {1}: {0}",
		"TE ACERCAS": "ДОГОНЯЕШЬ",
		"TE ALEJAS": "ОТСТАЕШЬ",
		"Por nivel saldrías de inicio, pero el seleccionador te tiene en {0} y sólo pone de titular a quien le tiene en {1}. Se gana con partidos de selección.": "По уровню ты бы выходил в основе, но тренер сборной оценивает тебя на {0}, а в основе ставит только тех, кого оценивает на {1}. Это зарабатывается матчами за сборную.",
		"El vestuario te tiene en {0}: hasta {1} te llegarán {2} balones como mucho.": "Раздевалка оценивает тебя на {0}: до {1} мячей тебе дадут максимум {2}.",
		"En casa la afición está contigo ({0}): un balón más.": "Дома болельщики за тебя ({0}): на один мяч больше.",
		"En casa la afición te pita ({0}): un balón menos.": "Дома трибуны тебя освистывают ({0}): на один мяч меньше.",
		"LE QUITASTE EL SITIO A": "ТЫ ВЫТЕСНИЛ ИЗ ОСНОВЫ",
		"RESERVA": "РЕЗЕРВ",
		"PLANTILLA": "СОСТАВ",
		"EL ONCE": "ОСНОВА",
		"NO CONVOCADOS": "ВНЕ ЗАЯВКИ",
		"RACHA": "ФОРМА",
		"TU PUESTO": "ПОЗИЦИЯ",
		"PEDIR JUGAR DE {0} · {1}": "ПРОСИТЬСЯ НА {0} · {1}",
		"LO VERA BIEN": "ОДОБРИТ",
		"PUEDE ESCUCHARTE": "МОЖЕТ ПОСЛУШАТЬ",
		"LO VERA DIFICIL": "УСОМНИТСЯ",
		"NI LO ESCUCHA": "НЕ ПОСЛУШАЕТ",
		"Ya le pediste un cambio de puesto en esta ventana.": "Ты уже просил сменить позицию в этом окне.",
		"El club te pasa a jugar de {0}.": "Клуб переводит тебя на позицию {0}.",
		"{0} · RINDES {1}%": "{0} · ОТДАЧА {1}%",
		"{0} · RINDES AL {1}% AQUI": "{0} · ЗДЕСЬ ОТДАЧА {1}%",
		"TUS PUESTOS": "ТВОИ ПОЗИЦИИ",
		"PUEDES APRENDERLO": "МОЖНО ОСВОИТЬ",
		"FAVORITA": "ЛЮБИМАЯ",
		"Tu FAVORITA pesa: los clubes que te quieren ahí salen antes y el técnico te escucha más si se la pides.": "Твоя ЛЮБИМАЯ позиция имеет вес: клубы, которым ты нужен там, появляются первыми, а тренер охотнее слушает, когда ты на нее просишься.",


		"¿APRENDER {0}?": "ОСВОИТЬ {0}?",
		"APRENDERLO": "ОСВОИТЬ",
		"PUESTO DEVUELTO · {0}": "ВОЗВРАТ ПОЗИЦИИ · {0}",
		"NATURAL": "РОДНАЯ",
		"COMODO": "ПРИВЫЧНАЯ",
		"PROBANDO": "ОСВОЕНИЕ",
		"AJENO": "ЧУЖАЯ",
		"Aprender un puesto hace que los clubes puedan ficharte para él. El oficio sale de jugarlo.": "Освоишь позицию — и клубы смогут подписать тебя под нее. Мастерство приходит, когда на ней играешь.",

		"En el partido: rematas dentro del área y te llegan más centros para cabecear.": "В матче: завершаешь атаки в штрафной и получаешь больше навесов под удар головой.",
		"En el partido: más disparos desde la frontal y más balones para la volea.": "В матче: больше ударов из-за штрафной и больше мячей под удар с лета.",
		"En el partido: más contras por tu banda, disparos de lejos y salidas jugadas.": "В матче: больше контратак по твоему флангу, ударов издалека и розыгрышей от своих ворот.",
		"En el partido: disparos de lejos y desde la frontal, voleas y salidas jugadas.": "В матче: удары издалека и из-за штрафной, удары с лета и розыгрыш от своих ворот.",
		"En el partido: sobre todo disparos de lejos y salidas jugadas; poca área.": "В матче: в основном удары издалека и розыгрыш от своих ворот; в штрафной бываешь мало.",
		"TE QUIEREN DE {0}": "ЗОВУТ НА {0}",
		"PAGA MÁS": "ВЫГОДНЕЕ",
		"MEJOR CLUB": "КЛУБ ВЫШЕ",
		"MÁS MINUTOS": "БОЛЬШЕ ИГРЫ",
		"OFERTA {0} DE {1}": "ПРЕДЛ. {0} ИЗ {1}",
		"SU ONCE MÁS FUERTE": "ИХ ЛУЧШИЙ СОСТАВ",
		"SI TE VAS, LO MEJOR DE LA MESA": "ЕСЛИ УЙДЕШЬ — ЛУЧШИЙ ВАРИАНТ",
		"TE HAN OFRECIDO": "ПРЕДЛОЖЕНИЯ",
		"DESTINOS": "ВАРИАНТЫ",
		"TU SALIDA": "ТВОЙ УХОД",
		"EN CESIÓN": "НА АРЕНДУ",
		"FUERA DEL PLAN": "ВНЕ ПЛАНОВ",
		"NO TE VENDEN": "НЕ ПРОДАДУТ",
		"TE ESCUCHAN": "ВЫСЛУШАЮТ",
		"Salvo cláusula: {0}": "Только через отступные: {0}",
		"Te llegan {0} ofertas más y tu club pide un {1}% menos": "Предложений больше на {0}, а твой клуб просит на {1}% меньше",
		"Te queda un año: no te retienen.": "Остался год контракта: удерживать не станут.",
		"TU SITIO · {0}": "МЕСТО · {0}",
		"TU SITIO ESTA LIBRE": "ТВОЕ МЕСТО СВОБОДНО",
		"CESIÓN {0} DE {1}": "АРЕНДА {0} ИЗ {1}",
		"SIN OPCIÓN": "БЕЗ ОПЦИИ",
		"Jugarías de": "Твоя позиция",
		"Vuelves en": "Возвращение",
		"Opción de compra": "Право выкупа",
		"Creces": "Рост",
		"Con la ventana abierta ya no se da pie: si quieren, su oferta llega a la mesa.": "При открытом окне намекать уже поздно: если ты им нужен, предложение само придет.",
		"{0} TEMP": "{0} СЕЗ.",
		"mercadoMESA": "НА СТОЛЕ",
		"MINUTOS": "МИНУТЫ",
		"Nada de lo que hay encima de la mesa te mejora: ni el club, ni la ficha, ni los minutos.":
			"Ничто из предложенного не лучше того, что есть: ни клуб, ни зарплата, ни минуты.",
		"TE PEDIRÁN GOLES": "БУДУТ ЖДАТЬ ГОЛОВ",
		"TE PEDIRÁN ASISTENCIAS": "БУДУТ ЖДАТЬ АССИСТОВ",
		"Sin club: no hay plantilla que mostrar. Ficha por un equipo y aquí verás a los tuyos.":
			"Нет клуба — нет и состава. Подпиши контракт с командой, и здесь появятся твои партнеры.",
		"Sales de inicio.": "Выходишь в основе.",
		"Viajas, pero no juegas.": "Едешь с командой, но не играешь.",
		"El torneo ya empezó y la lista está cerrada: tu sitio se juega en la próxima.":
			"Турнир уже начался, и заявка закрыта: за место поборешься в следующий раз.",
		"Ya das el nivel: te llaman en la próxima fecha FIFA.":
			"Уровень у тебя уже есть: вызовут в следующую паузу на сборные.",
		"BOTA DE LA LIGA": "БОМБАРДИР ЛИГИ",
		"Tu premio te avala: este año no te piden nota ni nivel.":
			"Твоя награда говорит за тебя: в этом году ни оценки, ни уровня от тебя не требуют.",
		"MEJOR DE LA LIGA": "ЛУЧШИЙ В ЛИГЕ",
		"PREMIO DE CAMPEONES": "НАГРАДА КУБКА ЭЛИТЫ",
		"CAMPEON DEL MUNDO": "ЧЕМПИОН МИРА",
		"CAMPEON CONTINENTAL": "ЧЕМПИОН КОНТИНЕНТА",
		"BOTA DEL MUNDIAL": "БОМБАРДИР МУНДИАЛЯ",
		"JUGAR INFILTRADO": "ИГРАТЬ НА УКОЛАХ",
		"PIDE": "НАДО",
		"TIENES": "У ТЕБЯ",
		"Decide si SALES. Si le caes mal, no pasas del banquillo. Lo que haces en las fechas FIFA te sube o te baja con él, y en amistosos rota.":
			"Решает, ВЫХОДИШЬ ли ты в основе. Если ты ему не по душе, из запаса не выберешься. Твоя игра в паузы на сборные поднимает или опускает тебя в его глазах, а в товарищеских он меняет состав.",
		"Deciden si te la PASAN: si el grupo no te quiere, te llegan dos balones. Se gana ganando juntos.":
			"Решают, ПАСУЮТ ли тебе: если команда тебя не принимает, получишь два мяча за игру. Это зарабатывается общими победами.",
		"PARA ENTRAR": "ДЛЯ ЗАЯВКИ",
		"PARA SER TITULAR": "ДЛЯ ОСНОВЫ",


		"MI EQUIPO":
			"МОЙ КЛУБ",
		"GERENCIA":
			"ДИРЕКЦИЯ",
		"DAR UNA CHARLA AL VESTUARIO":
			"СОБРАТЬ КОМАНДУ НА РАЗГОВОР",
		"Reúnes al grupo tú, sin el míster delante. Si te siguen, el equipo entero se suelta; si no eres nadie ahí dentro, se nota.":
			"Собираешь ребят сам, без тренера. Если они пойдут за тобой, вся команда раскрепостится; если ты там никто, это будет видно.",
		"PEDIR CAMBIO DE PUESTO":
			"ПРОСИТЬ СМЕНУ ПОЗИЦИИ",
		"Le dices al técnico dónde quieres jugar. Cuenta lo cómodo que estés ahí y lo que se fíe de ti.":
			"Говоришь тренеру, где хочешь играть. Важно, насколько тебе там удобно и насколько он тебе доверяет.",
		"PEDIR LOS BALONES PARADOS":
			"ПРОСИТЬ СТАНДАРТЫ",
		"Penales, faltas y córners para ti el resto de la temporada, aunque haya alguien con mejor pie en la plantilla.":
			"Пенальти, штрафные и угловые — твои до конца сезона, даже если в составе есть кто-то с ударом получше.",
		"SUGERIR UN FICHAJE":
			"ПРЕДЛОЖИТЬ ИГРОКА",
		"Señalas a un jugador de otro club. El club mira su precio y su caja, y decide.":
			"Указываешь на игрока из другого клуба. Клуб смотрит на его цену и свою кассу — и решает.",
		"AVISAR QUE TE VAS LA PROXIMA TEMPORADA":
			"ОБЪЯВИТЬ ОБ УХОДЕ ПОСЛЕ СЕЗОНА",
		"No pides permiso: avisas. Entras en la lista, bajan lo que piden por ti y llegan ofertas de verdad. La grada no lo olvida.":
			"Ты не просишь разрешения, а ставишь перед фактом. Тебя выставляют на продажу, цена на тебя падает, приходят настоящие предложения. Трибуны этого не забудут.",
		"NIVEL EN EL VESTUARIO":
			"ВЕС В РАЗДЕВАЛКЕ",
		"CONFIANZA DEL TECNICO":
			"ДОВЕРИЕ ТРЕНЕРА",
		"EL VESTUARIO":
			"РАЗДЕВАЛКА",
		"LA GRADA":
			"ТРИБУНЫ",
		"ANOS EN EL CLUB":
			"ГОДЫ В КЛУБЕ",
		"Sin club no hay nada que pedir. Ficha por un equipo y aquí decidirás con él.":
			"Без клуба просить не о чем. Подпиши контракт с командой, и здесь будешь решать вместе с ней.",
		"TU PESO EN EL CLUB":
			"ТВОЙ ВЕС В КЛУБЕ",
		"No se compra: sale de lo que eres en ese vestuario.":
			"Это не купишь: все зависит от того, кто ты в этой раздевалке.",
		"QUE LE PIDES":
			"ЧТО ПРОСИШЬ",
		"Esperas respuesta a: {0}.":
			"Ждешь ответа: {0}.",
		"Te contestan en la próxima jornada.":
			"Ответят в следующем туре.",
		"Te contestan en {0} jornadas.":
			"Туров до ответа: {0}.",
		"Acabas de pedir algo: la próxima jornada puedes volver.":
			"Ты только что о чем-то просил: возвращайся в следующем туре.",
		"Acabas de pedir algo: puedes volver en {0} jornadas.":
			"Ты только что о чем-то просил. Туров до нового запроса: {0}.",
		"Cedido no decides tu vida aquí: el club que te tiene prestado no manda, y el tuyo ya decidió tu año.":
			"В аренде свою судьбу здесь не решаешь: арендовавший клуб не главный, а твой клуб уже решил, каким будет твой год.",
		"LA RESPUESTA DEL CLUB":
			"ОТВЕТ КЛУБА",
		"Te escucharon y dijeron que no. Queda dicho.":
			"Тебя выслушали и сказали «нет». Вопрос закрыт.",
		"Hablaste tú y el grupo se soltó: el vestuario está contigo.":
			"Ты выступил, и команда раскрепостилась: раздевалка за тебя.",
		"Dijeron que sí, pero el puesto ya no estaba libre.":
			"Сказали «да», но позиция уже была занята.",
		"Desde hoy juegas de {0}.":
			"С сегодняшнего дня играешь на позиции {0}.",
		"Los penales, las faltas y los córners son tuyos el resto de la temporada.":
			"Пенальти, штрафные и угловые — твои до конца сезона.",
		"Queda dicho: te vas al acabar la temporada. Estás en la lista y van a llegar ofertas.":
			"Решено: уходишь в конце сезона. Ты на продаже, и предложения будут.",
		"Dijeron que sí, pero el fichaje se cayó: ese jugador ya no estaba donde lo viste.":
			"Сказали «да», но трансфер сорвался: этого игрока уже нет там, где ты его видел.",
		"{0} firma por tu club. Lo pediste tú.":
			"{0} подписывает контракт с твоим клубом. Это был твой запрос.",
		"Te dijeron que sí.":
			"Тебе сказали «да».",
		"Peso {0} · {1}":
			"Вес {0} · {1}",
		"Abrir la boca ya cuesta, digan lo que digan.":
			"Даже просто заговорить уже чего-то стоит, что бы ни ответили.",
		"PEDIRLO":
			"ПОПРОСИТЬ",
		"DEJARLO":
			"ЗАБЫТЬ",
		"DONDE QUIERES JUGAR":
			"ГДЕ ХОЧЕШЬ ИГРАТЬ",
		"Sólo sabes jugar en un sitio. Aprende otro y podrás pedirlo.":
			"Ты умеешь играть только на одной позиции. Освой еще одну — и сможешь на нее проситься.",
		"A QUIEN FICHAMOS":
			"КОГО ПОДПИШЕМ",
		"Lo más flojo del once es el {0} ({1}).":
			"Слабое место в составе — позиция {0} ({1}).",
		"{0} · media {1} · {2} años · {3}":
			"{0} · рейтинг {1} · возраст {2} · {3}",
		"Hoy no hay nadie que mejore tu once y esté a tiro. Vuelve otra jornada.":
			"Сегодня нет никого, кто усилил бы твой состав и был бы по карману. Загляни в другой тур.",


		"LO ESTAN VIENDO":
			"РАССМАТРИВАЮТ",
		"MIENTRAS TANTO":
			"А ПОКА",
		"Tu peso subió a {0} desde que lo pediste.":
			"С момента запроса твой вес вырос до {0}.",
		"Tu peso bajó a {0} desde que lo pediste.":
			"С момента запроса твой вес упал до {0}.",
		"Tu peso sigue en {0}.":
			"Твой вес по-прежнему {0}.",
		"Te contestan con el peso que tengas ese día, no con el de hoy: lo que hagas hasta entonces cuenta.":
			"Ответ дадут с учетом твоего веса в тот день, а не сегодня: все, что сделаешь до этого, идет в зачет.",
		"A {0} ya se lo llevaron: cuando contesten, la petición se caerá sola.":
			"{0} уже ушел в другой клуб: когда ответят, запрос отпадет сам.",
		"{0} sigue donde lo viste.":
			"{0} все еще там, где ты его видел.",
		"LO QUE PUEDE PAGAR EL CLUB":
			"ЧТО ПО КАРМАНУ КЛУБУ",
		"La raya es el más caro de la lista.":
			"Черта — самый дорогой игрок в списке.",
		"No cabe en la caja. Puedes señalarlo igual.":
			"Клубу не по карману. Но указать на него все равно можно.",
		"EL DESPACHO":
			"КАБИНЕТ",
		"TE DIJERON QUE SI":
			"ОТВЕТ: «ДА»",
		"TE DIJERON QUE NO":
			"ОТВЕТ: «НЕТ»",


		"Le quedan {0} temporadas: es un parche.":
			"Осталось сезонов: {0}. Это временная мера.",
		"Le quedan {0} temporadas.":
			"Осталось сезонов: {0}.",


		"LO QUE LES HAS PEDIDO":
			"ТВОИ ЗАПРОСЫ",
		"T{0} J{1} · {2}":
			"СЕЗ.{0} Т.{1} · {2}",
		"FICHAR A {0}":
			"ПОДПИСАТЬ {0}",
		"JUGAR DE {0}":
			"ИГРАТЬ НА {0}",
		"TE SIGUIERON":
			"ЗА ТОБОЙ ПОШЛИ",
		"TE CAMBIARON DE SITIO":
			"ПОЗИЦИЮ СМЕНИЛИ",
		"TE LOS DIERON":
			"СТАНДАРТЫ ТВОИ",
		"QUEDO DICHO":
			"РЕШЕНО",
		"LO FICHARON":
			"ПОДПИСАЛИ",


		"LO QUE MAS TE FALTA":
			"ЧЕГО НЕ ХВАТАЕТ",
		"{0}, {1} PUNTOS":
			"{0}: {1} ОЧК.",
		"Se mide contra tu vestuario, no en absoluto: sube tu media, o cámbiate a un club donde destaques.":
			"Считается относительно твоей раздевалки, а не в абсолюте: подними рейтинг или перейди в клуб, где будешь выделяться.",
		"Cada partido la mueve, arriba o abajo, según tu nota.":
			"Каждый матч двигает этот показатель вверх или вниз — в зависимости от твоей оценки.",
		"Se gana fuera del campo: la charla, los retos en casa y lo que decides con ellos.":
			"Это зарабатывается вне поля: разговор с командой, вызовы дома и твои решения по ним.",
		"Sube al cumplir tu objetivo de contrato, y con el año que haga el club.":
			"Растет, когда выполняешь цель по контракту, и вместе с успехами клуба за сезон.",
		"Se revisa al cerrar la temporada, contra la mejor media de tus compañeros.":
			"Пересматривается в конце сезона — по сравнению с лучшим рейтингом среди партнеров.",
		"Se gana quedándote: cada temporada en el mismo club suma.":
			"Зарабатывается верностью: каждый сезон в одном клубе идет в зачет.",



		"NO SE PIDE, SE AVISA":
			"НЕ ЗАПРОС, А ФАКТ",
		"Años en el club":
			"Годы в клубе",
		"DE CIEN":
			"ИЗ СТА",
		"PRESUPUESTO PARA FICHAJES":
			"ТРАНСФЕРНЫЙ БЮДЖЕТ",

		"ENTRA SIN APRETAR":
			"ПО КАРМАНУ",
		"CABE":
			"ХВАТИТ",
		"APRIETA":
			"ВПРИТЫК",
		"NO LLEGA":
			"ДОРОГО",
		"FICHAJES ESPERADOS":
			"ОЖИДАЕМЫЕ НОВИЧКИ",
		"Gastado en esta ventana: {0} de {1}.":
			"Потрачено в это окно: {0} из {1}.",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede.":
			"Порядок такой: если подпишут одного, на остальных пойдет то, что останется.",
		"1 partido con ellos":
			"1 матч с ними",
		"{0} partidos con ellos":
			"Матчей с ними: {0}",
		"Te faltan {0} de relación.":
			"До нужных отношений не хватает: {0}.",
		"TE ESCUCHA":
			"СЛУШАЕТ",
		"LO QUE HICIERON CON TU LISTA":
			"ЧТО СТАЛО С ТВОИМ СПИСКОМ",
		"Ficharon a {0}. Lo señalaste tú.":
			"{0} подписан. На него указал ты.",
		"Miraron tu lista y no ficharon a ninguno.":
			"Посмотрели твой список и никого не подписали.",
		"A QUIEN LE HAS SENALADO":
			"НА КОГО ТЫ УКАЗАЛ",
		"Marca hasta {0} jugadores en el RANKING y el club los mirará al cerrarse el mercado.":
			"Отметь в РЕЙТИНГЕ игроков (не больше {0}), и клуб присмотрится к ним при закрытии окна.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y los mirarán al cerrarse el mercado.":
			"Слабое место в составе — позиция {0} ({1}). Отметь в РЕЙТИНГЕ игроков (не больше {2}), и при закрытии окна к ним присмотрятся.",
		"Ventana abierta: {0} {1} por delante. En cada una el club decide, y un objetivo vivo puede caerse solo.":
			"Окно открыто: впереди {0} {1}. По каждому клуб решает отдельно, а живая цель может сорваться сама.",
		"Mercado cerrado. La próxima ventana dura {0} {1}: lo que marques ahora espera a que abra.":
			"Окно закрыто. Следующее продлится {0} {1}: все, что отметишь сейчас, подождет его открытия.",
		"{0} de {1} esta temporada. Toca uno para quitarlo.":
			"{0} из {1} в этом сезоне. Нажми на игрока, чтобы убрать его.",

		"RECOMENDAR AL CLUB ({0})":
			"ПОРЕКОМЕНДОВАТЬ КЛУБУ ({0})",
		"QUITAR DE TU LISTA":
			"УБРАТЬ ИЗ СПИСКА",
		"Señalado: interés {0}%, fichaje {1}%.":
			"Отмечен: интерес {0}%, трансфер {1}%.",
		"Tu once {0}": "Твой состав {0}",
		"Rival en su puesto {0}": "Соперник по позиции {0}",
		"Tu once {0} · rival en su puesto {1}": "Твой состав {0} · соперник по позиции {1}",
		"Brazalete +{0}": "Повязка +{0}",
		"Ojeo -{0}: no conoce tu liga": "Скаутинг -{0}: не знает твою лигу",
		"Ojeo -{0}: {1} cesiones": "Скаутинг -{0}: аренды ({1})",
		"Ojeo -{0}: no conoce tu liga, {1} cesiones": "Скаутинг -{0}: не знает твою лигу, аренды ({1})",
		"Viene de más arriba: precio +{0} %": "Из клуба уровнем выше: цена +{0} %",

		"Tu pasado pesa: {0} temporadas en ligas grandes, {1} cesiones, {2} clubes": "Прошлое имеет вес: сезонов в топ-лигах — {0}, аренд — {1}, клубов — {2}",
		"Trayectoria: precio +{0} % ({1} temporadas en ligas grandes)": "Послужной список: цена +{0} % (сезонов в топ-лигах: {1})",
		"Trotamundos: precio −{0} % ({1} cesiones, {2} clubes)": "Перекати-поле: цена −{0} % (аренд: {1}, клубов: {2})",

		"Jugaste aquí {0} temporadas: te dejan volver por un {1} % menos": "Сезонов здесь: {0} — тебя готовы вернуть на {1} % дешевле",
		"Te dejan volver a casa por un {0} % menos": "Тебя готовы вернуть домой на {0} % дешевле",

		"REGRESA A CASA": "СНОВА ДОМА",
		"VUELVE A CASA": "ВОЗВРАЩЕНИЕ",
		"La grada no lo olvidó: {0} con esta camiseta. Desde hoy vuelve a entrenar contigo.": "Трибуны не забыли: {0} в этой футболке. С сегодняшнего дня он снова тренируется с тобой.",
		"Jugó aquí {0} · traspaso -{1} %": "Играл здесь: {0} · трансфер -{1} %",
		"Jugó aquí {0}": "Играл здесь: {0}",
		"VUELVE": "ВОЗВРАТ",
		"INTERES": "ИНТЕРЕС",
		"LO PEDISTE TU":
			"ТВОЙ ВЫБОР",
		"TUS FICHAJES":
			"ТВОИ НОВИЧКИ",
		"YA NO ESTA":
			"УШЕЛ",
		"Tu ojo: {0} cerró el año con nota {1}":
			"Твое чутье: {0} закончил год с оценкой {1}",
		"{0} no convenció al técnico":
			"{0} не убедил тренера",
		"MARCAR EN EL RANKING ({0})":
			"ОТМЕТИТЬ В РЕЙТИНГЕ ({0})",
		"Ya has gastado tus recomendaciones de esta temporada. El año que viene vuelves a tener cinco.":
			"Ты уже израсходовал рекомендации на этот сезон. В следующем году их снова будет пять.",
		"Ya gastaste tus {0} recomendaciones de esta temporada.":
			"Ты уже израсходовал все рекомендации этого сезона ({0}).",
		"{0} de {1}. Toca uno para quitarlo.":
			"{0} из {1}. Нажми на игрока, чтобы убрать его.",
		"Ya has señalado {0}. Quita a alguno primero.":
			"Уже отмечено: {0}. Сначала убери кого-нибудь.",
		"Le dices al técnico dónde quieres jugar.":
			"Говоришь тренеру, где хочешь играть.",
		"Penales, faltas y córners para ti el resto de la temporada.":
			"Пенальти, штрафные и угловые — твои до конца сезона.",
		"No pides permiso: avisas. Entras en la lista y llegan ofertas de verdad.":
			"Ты не просишь разрешения, а ставишь перед фактом. Тебя выставляют на продажу, и приходят настоящие предложения.",



		"QUE LO FICHEN":
			"ПОДПИСАТЬ",
		"LO QUE PASO CON TUS OBJETIVOS":
			"ЧТО СТАЛО С ТВОИМИ ЦЕЛЯМИ",
		"FALLIDO":
			"СОРВАЛСЯ",
		"Marca hasta {0} jugadores en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"Отметь в РЕЙТИНГЕ игроков (не больше {0}), и клуб будет решать по ним в каждый тур трансферного окна.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"Слабое место в составе — позиция {0} ({1}). Отметь в РЕЙТИНГЕ игроков (не больше {2}), и клуб будет решать по ним в каждый тур трансферного окна.",
		"Ya lo intentaste esta temporada y se cayó. Podrás volver a señalarlo el año que viene.":
			"В этом сезоне ты уже пробовал, и сделка сорвалась. Снова указать на него можно будет в следующем году.",
		"FICHARON A {0}":
			"ПОДПИСАН: {0}",
		"SE CAYO {0}":
			"СОРВАЛСЯ: {0}",
		"TU ONCE {0}": "СОСТАВ {0}",
		"No te mira: tu once está en {0} y él en {1}.":
			"Даже не взглянет: твой состав на уровне {0}, а он — {1}.",
		"ALTAS Y BAJAS": "ПРИШЛИ И УШЛИ",
		"ALTA": "ПРИХОД",
		"BAJA": "УХОД",
		"SE CAYO SOLO": "СОРВАЛОСЬ",
		"CERRO EL MERCADO": "ОКНО ЗАКРЫТО",
		"YA NO JUGABA AHI": "УЖЕ УШЕЛ",
		"SE RETIRABA": "УХОДИЛ НА ПОКОЙ",
		"TE FUISTE DEL CLUB": "ТЫ УШЕЛ ИЗ КЛУБА",
		"Ya no le quedan jornadas: se cae al cerrar.":
			"Туров у него не осталось: отпадет при закрытии окна.",
		"Está acabando su carrera: el club no ficha a quien se retira.":
			"Он завершает карьеру: клуб не подписывает тех, кто уходит на покой.",
		"Ya no juega ahí.": "Он там больше не играет.",
		"NO CABIA NADIE": "НЕТ МЕСТА В СОСТАВЕ",
		"Tu plantilla está llena y no hay a quien soltar: aunque el club diga que sí, no cabrá.":
			"Твой состав полон, и отпустить некого: даже если клуб скажет «да», места ему не будет.",
		"El club está en apuro: solo entran los LIBRES.":
			"У клуба трудности: прийти могут только СВОБОДНЫЕ АГЕНТЫ.",
		"SE LO LLEVO {0}": "ЗАБРАЛ {0}",
		"Llegaron porque tú los señalaste":
			"Пришли, потому что ты на них указал",
		"Fichajes que le pediste al club y el club hizo.":
			"Трансферы, о которых ты просил клуб и которые клуб сделал.",
		"Un fichaje que le pediste al club y el club hizo.":
			"Трансфер, о котором ты просил клуб и который клуб сделал.",
		"CLAUSULAZO":
			"ПО ОТСТУПНЫМ",
		"Mis outfits":
			"Мои образы",
		"Nombre del outfit":
			"Название образа",
		"Escribe un nombre para guardar tu outfit.":
			"Введи название, чтобы сохранить образ.",
		"Outfit guardado.":
			"Образ сохранен.",
		"Outfit aplicado.":
			"Образ применен.",
		"Outfit actualizado con tu ropa actual.":
			"Образ обновлен: теперь в нем то, что на тебе сейчас.",
		"Outfit eliminado.":
			"Образ удален.",
		"Guarda tu combinación actual y úsala con un toque.":
			"Сохрани то, что на тебе сейчас, и надевай в одно касание.",
		"Guardar outfit":
			"Сохранить образ",
		"Playera gráfica":
			"Футболка с принтом",
		"Jersey retro":
			"Ретро-футболка",
		"Polo tejido":
			"Вязаное поло",
		"Camisa de lino":
			"Льняная рубашка",
		"Cierre corto":
			"Пуловер с молнией",
		"Polo rugby":
			"Регбийка",
		"Sobrecamisa":
			"Рубашка-куртка",
		"Parka":
			"Парка",
		"Pants deportivos":
			"Спортивные штаны",
		"Pantalón de pinzas":
			"Брюки со складками",
		"Jeans barril":
			"Джинсы баррель",
		"Cargo técnico":
			"Технические карго",
		"Tenis retro":
			"Ретро-кроссовки",
		"Tenis deportivos":
			"Беговые кроссовки",
		"Zapatos de charol":
			"Лакированные туфли",
		"Tenis gruesos":
			"Массивные кроссовки",
		"Cinturón de cuero":
			"Кожаный ремень",
		"Hebilla metálica":
			"Металлическая пряжка",
		"Pañuelo recto":
			"Прямой платок",
		"Pañuelo de pico":
			"Платок уголком",
		"Casual elegante":
			"Смарт-кэжуал",
		"Corbata de moño":
			"Галстук-бабочка",
		"Corbata, moño o bufanda":
			"Галстук, бабочка или шарф",
		"Ya no juega ahí. Quítalo y señala a otro.":
			"Он там больше не играет. Убери его и укажи на другого.",
		"Está acabando su carrera. Quítalo y señala a otro.":
			"Он завершает карьеру. Убери его и укажи на другого.",
		"Hoy no hay presupuesto. Si el club vende, vuelve a haberlo.":
			"Сегодня бюджета нет. Если клуб кого-то продаст, он появится снова.",


		"REFUERZO":
			"УСИЛЕНИЕ",
		"TE HICIERON CASO":
			"ТЕБЯ ПОСЛУШАЛИ",
		"Lo señalaste tú y el club puso el dinero. Desde hoy entrena contigo.":
			"На него указал ты, а клуб дал денег. С сегодняшнего дня он тренируется с тобой.",
		"Te Hicieron Caso":
			"Тебя послушали",
		"El club fichó a alguien que TÚ le señalaste.":
			"Клуб подписал игрока, на которого указал ТЫ.",
		"Que el club fiche a alguien que TÚ le hayas señalado.": "Добейся, чтобы клуб подписал игрока, на которого указал ТЫ.",


		"FICHAJES DE VERANO": "ЛЕТНИЕ НОВИЧКИ",
		"Y {0} MÁS": "И ЕЩЕ {0}",

		"NUEVA YORK":
			"НЬЮ-ЙОРК",
		"TU CARA EN NUEVA YORK":
			"ТВОЕ ЛИЦО В НЬЮ-ЙОРКЕ",
		"La marca compró la plaza entera. Todas las pantallas a la vez, y en todas tú.":
			"Бренд выкупил всю площадь. Все экраны разом — и на всех ты.",
		"ÚLTIMA HORA":
			"СРОЧНО",
		"{0} FIRMA CON {1}":
			"{0} ПЕРЕХОДИТ В {1}",
		"ALINEACIÓN":
			"СОСТАВ",
		"PITADA":
			"СВИСТ",
		"TU GRADA TE PITA":
			"СВОИ ОСВИСТАЛИ",
		"Te silbaron al oír tu nombre. El partido de hoy es la respuesta.":
			"Тебя освистали, едва услышав твое имя. Сегодняшний матч — твой ответ.",
		"tardes malas":
			"неудачные дни",
		"{0} veces con esta camiseta. El club te lo agradece antes del saque.":
			"Матчей в этой футболке: {0}. Клуб благодарит тебя перед стартовым свистком.",
		"asistencias":
			"ассисты",
		"OJEADOR":
			"СКАУТ",
		"Llegó una hora antes y sólo miró a uno. Su oferta llega en la próxima ventana.":
			"Пришел за час до начала и смотрел только на одного. Его предложение придет в следующее окно.",
		"A SEGUIR":
			"СЛЕДИТЬ",
		"MURAL":
			"МУРАЛ",
		"TU CARA EN EL BARRIO":
			"ТВОЕ ЛИЦО НА СТЕНЕ",
		"Nadie te pidió permiso para pintarte. Mejor así.":
			"Никто не спрашивал твоего разрешения, чтобы тебя нарисовать. Так даже лучше.",
		"ANUNCIO":
			"РЕКЛАМА",
		"TU CARA EN LA CIUDAD":
			"ТВОЕ ЛИЦО В ГОРОДЕ",
		"FIJO POR PARTIDO":
			"ЗА КАЖДЫЙ МАТЧ",
		"Pasas por debajo y te ves en grande. Los que pasan, también.":
			"Проходишь под ним и видишь себя огромным. Прохожие тоже.",
		"LLEGADA":
			"ПРИЛЕТ",
		"LA COPA VUELVE A CASA":
			"КУБОК ЕДЕТ ДОМОЙ",
		"Viajó en su propio asiento, con el cinturón puesto. Nadie la soltó en todo el vuelo.":
			"Он летел в отдельном кресле, пристегнутый ремнем. Его не выпускали из рук весь полет.",

		"TOMA {0}": "ДУБЛЬ {0}",
		"TOMA 7": "ДУБЛЬ 7",
		"REC": "REC",
		"La séptima fue la buena. El cámara estaba con el celular.":
			"Седьмой дубль оказался удачным. Оператор сидел в телефоне.",


		"LA PANCARTA CON FALTA":
			"БАННЕР С ОПЕЧАТКОЙ",
		"LA PANCARTA":
			"БАННЕР",
		"CASI":
			"ПОЧТИ",
		"ARREGLADA":
			"ИСПРАВЛЕН",
		"la tela":
			"полотно",
		"tu apellido":
			"твоя фамилия",
		"Una letra mal. La van a colgar igual todos los domingos.":
			"Одна буква не та. Его все равно будут вывешивать каждое воскресенье.",
		"Tardaron años, pero la arreglaron. Con cinta.":
			"Ушли годы, но его исправили. Скотчем.",


		"LAS PALOMAS NO OLVIDAN":
			"ГОЛУБИ НЕ ЗАБЫВАЮТ",
		"Una paloma del larguero no volvió a casa. Las demás se acuerdan.":
			"Один голубь с перекладины так и не вернулся домой. Остальные помнят.",
		"Otra vez tú. Ellas llevan la cuenta.":
			"Опять ты. Они ведут счет.",
		"SANCION": "ШТРАФ",
		"FAIR PLAY": "ФЕЙР-ПЛЕЙ",
		"{0} arranca la liga con -{1} puntos por el fair play": "{0} стартует в лиге с -{1} очк. за нарушение фейр-плей",
		"{0} incumple el fair play: si repite, perderá {1} puntos": "{0} нарушает фейр-плей: при повторе лишится {1} очк.",
		"CUENTAS DEL CLUB": "ФИНАНСЫ КЛУБА",
		"SANAS": "НОРМА",
		"EN APURO": "В ДОЛГАХ",
		"-{0} PTS": "-{0} ОЧК.",
		"AVISO {0}/{1}": "УГРОЗА {0}/{1}",
		"INGRESOS / AÑO": "ДОХОД/ГОД",
		"NOMINA / AÑO": "ЗАРПЛАТЫ/ГОД",
		"RAYA ROJA": "ЧЕРТА",
		"Cerrar la temporada con la caja bajo la raya roja es un aviso. Dos seguidas: la liga siguiente empieza con -{0} puntos.": "Закончить сезон с кассой ниже красной черты — это предупреждение. Два раза подряд — и следующий сезон в лиге начнется с -{0} очк.",
		"-{0} por fair play": "-{0} за фейр-плей",
		"SANCION DE FAIR PLAY": "ШТРАФ ЗА ФЕЙР-ПЛЕЙ",
		"-{0} PTS EN LA LIGA": "-{0} ОЧК. В ЛИГЕ",
		"AVISO DE FAIR PLAY": "УГРОЗА ШТРАФА",
		"SI REPITE: -{0} PTS": "ПОВТОР: -{0} ОЧК.",
		"EL CLUB CAMBIA DE DUEÑO": "У КЛУБА НОВЫЙ ВЛАДЕЛЕЦ",
		"DINERO DE FUERA": "ДЕНЬГИ ИЗВНЕ",
		"LOS INGRESOS SE DISPARAN": "ДОХОДЫ ВЗЛЕТАЮТ",
		"TEMPORADAS DE PROYECTO": "СРОК ПРОЕКТА",
		"ingreso de antes": "прежний доход",
		"ingreso ahora": "доход сейчас",
		"la caja": "касса",
		"Compra el club y trae dinero de fuera: habrá más presupuesto en GERENCIA, y el club va a fichar, también en tu puesto.": "Покупает клуб и приносит деньги извне: в разделе ДИРЕКЦИЯ будет больше бюджета, и клуб начнет подписывать игроков, в том числе на твою позицию.",
		"EL CLUB ENTRA EN CRISIS": "КЛУБ В КРИЗИСЕ",
		"LA CAJA EN ROJO": "КАССА В МИНУСЕ",
		"PUNTOS EN JUEGO": "НА КОНУ ОЧКИ",
		"la raya roja": "красная черта",
		"ingreso": "доход",
		"DUEÑO NUEVO": "НОВЫЙ ХОЗЯИН",
		"EN CRISIS": "КРИЗИС",
		"TOCA VENDER": "РАСПРОДАЖА",
		"Te sientan en el vestuario con el director deportivo. {0} está en crisis: si la caja sigue bajo la raya roja al cierre, la liga le quita {1} puntos. Eres lo que más vale del vestuario, y tu traspaso es el dinero que falta.": "Тебя усаживают в раздевалке вместе со спортивным директором. {0} в кризисе: если при закрытии касса будет ниже красной черты, лига снимет с клуба {1} очк. Ты самый ценный игрок в раздевалке, и твой трансфер — это недостающие деньги.",
		"EL CLUB NO PAGA": "КЛУБ НЕ ПЛАТИТ",
		"Te sientan en el vestuario con el director deportivo. {0} no tiene con qué pagarte: llevas {1} partidos sin cobrar y te deben ${2}. Si aguantas, cobras cuando llegue el dinero. Si pides la carta, en verano eres libre.": "Тебя усаживают в раздевалке вместе со спортивным директором. У клуба {0} нет денег, чтобы тебе платить: матчей без зарплаты — {1}, долг перед тобой — ${2}. Если потерпишь, получишь деньги, когда они появятся. Если попросишь расторгнуть контракт, летом станешь свободным агентом.",
		"AGUANTO": "ОСТАЮСЬ",
		"PIDO LA CARTA": "ХОЧУ УЙТИ",
		"IMPAGO DEL CLUB": "НЕВЫПЛАТЫ",
		"Lo que te debía el club": "Что тебе задолжал клуб",
		"El dueño nuevo te paga lo que te debía el club: ${0}": "Новый владелец выплачивает тебе долг клуба: ${0}",
		"El club te paga la mitad de lo que te debía: ${0} de ${1}": "Клуб выплачивает тебе половину долга: ${0} из ${1}",
		"EL CLUB TE DEBE": "ДОЛГ КЛУБА",
		"TE DEBE": "ДОЛГ",
		"caja": "касса",
		"MULTA POR LA ROJA": "ШТРАФ ЗА КРАСНУЮ",
		"MULTA DEL COMITÉ": "ШТРАФ ЛИГИ",
		"multa {0}": "штраф {0}",
		"Esta temporada pagaste ${0} en multas": "В этом сезоне ты заплатил штрафов на ${0}",
		"ELECCIONES EN EL CLUB": "ВЫБОРЫ В КЛУБЕ",
		"Hay elecciones en {0}. El candidato promete sanear la caja vendiéndote este verano y quiere saber de qué lado estás. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "В клубе {0} выборы. Кандидат обещает оздоровить финансы, продав тебя этим летом, и хочет знать, на чьей ты стороне. Твое фото приносит голоса; трибуны запомнят, кто поставил на проигравшего.",
		"Hay elecciones en {0}. El candidato promete dinero para fichar y quiere tu foto en su campaña. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "В клубе {0} выборы. Кандидат обещает деньги на трансферы и хочет твое фото для своей кампании. Твое фото приносит голоса; трибуны запомнят, кто поставил на проигравшего.",
		"CON EL PRESIDENTE": "ЗА ПРЕЗИДЕНТА",
		"CON EL CANDIDATO": "ЗА КАНДИДАТА",
		"AL MARGEN": "В СТОРОНЕ",
		"El presidente gana las elecciones y sigue": "Президент выигрывает выборы и остается",
		"Gana el candidato: el presidente nuevo quiere venderte este verano": "Побеждает кандидат: новый президент хочет продать тебя этим летом",
		"Gana el candidato: el presidente nuevo mete ${0} en la caja para fichar": "Побеждает кандидат: новый президент вкладывает ${0} в кассу на трансферы",
		"PRESIDENTE": "ПРЕЗИДЕНТ",
		"CANDIDATO": "КАНДИДАТ",
		"GANA EL CANDIDATO": "ПОБЕДА КАНДИДАТА",
		"SIGUE EL PRESIDENTE": "ПРЕЗИДЕНТ ОСТАЕТСЯ",
		"LA GRADA TE APLAUDE": "ТРИБУНЫ АПЛОДИРУЮТ",
		"LA GRADA TE PITA": "ТРИБУНЫ СВИСТЯТ",
		"EL JEQUE SE VA": "ШЕЙХ УХОДИТ",
		"El jeque deja el {0} y su nómina se queda: crisis": "Шейх уходит из клуба {0}, а зарплаты остаются: кризис",
		"El jeque se ha ido y su dinero con él, pero la nómina que firmó se queda. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "Шейх ушел, а с ним и его деньги, но подписанные им контракты остались. Этим летом клуб должен продавать, и если при закрытии касса будет ниже красной черты, лига снимет {0} очк.",
		"LA SALA DE JUNTAS": "ЗАЛ ЗАСЕДАНИЙ",
		"Sin rodeos: no hay dinero. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "Без обиняков: денег нет. Этим летом клуб должен продавать, и если при закрытии касса будет ниже красной черты, лига снимет с него {0} очк.",
		"SIN EUROPA": "БЕЗ ЕВРОПЫ",
		"TEMPORADA SIN EUROPA": "СЕЗОН БЕЗ ЕВРОКУБКОВ",
		"la plaza perdida": "потерянная путевка",
		"puntos de sanción": "штрафные очки",
		"CONTROL FINANCIERO": "ФИНКОНТРОЛЬ",
		"NO SE VENDE": "НЕ ПРОДАЕМ",
		"EL ESTADIO SE VENDE": "НАЗВАНИЕ ПРОДАНО",
		"cobra el club": "получает клуб",
		"La crisis aprieta y el club vende el nombre del campo. La grada no lo perdona: este año entra menos gente y en el muro cuelga una pancarta.": "Кризис душит, и клуб продает название стадиона. Трибуны этого не прощают: в этом году людей приходит меньше, а на стене висит баннер.",
		"El {0} vende el nombre de su estadio: ahora es el {1}": "{0} продает название стадиона: теперь он называется {1}",
		"VENDE EL ESTADIO": "ПРОДАЕТ НАЗВАНИЕ",
		"Sin rodeos: no hay dinero. Para tapar el agujero, el club vende el nombre del estadio, y aun así este verano tiene que vender.": "Без обиняков: денег нет. Чтобы заткнуть дыру, клуб продает название стадиона, но этим летом ему все равно придется продавать игроков.",
		"CONCURSO": "БАНКРОТ",
		"El {0} entra en concurso de acreedores: este verano no ficha": "{0} начинает процедуру банкротства: летом без трансферов",
		"EL CONCURSO DE ACREEDORES": "ПРОЦЕДУРА БАНКРОТСТВА",
		"CONCURSO DE ACREEDORES": "БАНКРОТСТВО",
		"EN CONCURSO": "БАНКРОТ",
		"LO LLEVA UN ADMINISTRADOR": "ПОД ВНЕШНИМ УПРАВЛЕНИЕМ",
		"FICHAJES ESTE VERANO": "ТРАНСФЕРЫ ЭТИМ ЛЕТОМ",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Lo que se pueda vender, se vende.": "Клуб не может расплатиться с долгами, и суд назначает управляющего. До зимнего окна никого не подписывают и ни один контракт не трогают — твой тоже. Все, что можно продать, продается.",
		"CONTRATOS CONGELADOS": "КОНТРАКТЫ ЗАМОРОЖЕНЫ",
		"Tu club está en concurso: hasta el mercado de invierno no se toca un contrato.": "Твой клуб проходит банкротство: до зимнего окна ни один контракт не трогают.",
		"Tu club está en concurso: hasta el mercado de invierno no ficha a nadie.": "Твой клуб проходит банкротство: до зимнего окна он никого не подписывает.",
		"EL ADMINISTRADOR TE VENDE": "УПРАВЛЯЮЩИЙ ПРОДАЕТ ТЕБЯ",
		"El juez puso a un administrador al frente de {0} y te recibe en el despacho del presidente, con las cuentas sobre la mesa. En la lista de lo que se vende, tu nombre va el primero: o sales este verano, o te quedas cobrando menos.": "Суд поставил во главе клуба {0} управляющего, и тот принимает тебя в кабинете президента, с отчетами на столе. В списке того, что идет на продажу, твое имя первое: либо уходишь этим летом, либо остаешься на меньшей зарплате.",
		"Tu club está en concurso y vas el primero de la lista. O sales este verano, o te quedas cobrando menos.": "Твой клуб проходит банкротство, и ты первый в списке на продажу. Либо уходишь этим летом, либо остаешься на меньшей зарплате.",
		"Cobras menos lo que reste de contrato y el administrador te saca de la lista. El vestuario y la grada lo ven.": "До конца контракта получаешь меньше, и управляющий вычеркивает тебя из списка. Раздевалка и трибуны это видят.",
		"LA REBAJA DEL VESTUARIO": "УРЕЗАНИЕ ЗАРПЛАТ",
		"El presidente baja al vestuario: {0} está en crisis y no llega a fin de mes. Pide a la plantilla un {1}% menos de ficha esta temporada, y quien firme cobra a tiempo. El capitán ya ha firmado; faltas tú.": "Президент спускается в раздевалку: {0} в кризисе и не дотягивает до конца месяца. Он просит команду согласиться в этом сезоне на зарплату на {1}% меньше, и кто подпишет, получит деньги вовремя. Капитан уже подписал; остался ты.",
		"FIRMO: {0}/sem": "ПОДПИШУ: {0}/нед.",
		"NO FIRMO": "ОТКАЗ",
		"LA ASAMBLEA DE SOCIOS": "СОБРАНИЕ ЧЛЕНОВ КЛУБА",
		"El juez cerró el concurso y {0} es de sus socios: la asamblea votó la compra a mano alzada, un {1}% a favor. No hay dueño que ponga dinero, así que piden a la plantilla que entre con una acción. La grada mira a sus jugadores.": "Суд закрыл дело о банкротстве, и {0} теперь принадлежит своим членам: собрание проголосовало за покупку поднятием рук, {1}% — за. Владельца, который вложил бы деньги, нет, поэтому команду просят войти в долю и купить акцию. Трибуны смотрят на своих игроков.",
		"COMPRO ACCIONES": "ПОКУПАЮ АКЦИИ",
		"SÓLO VOTO": "ГОЛОСУЮ",
		"SOCIOS": "ПАЙЩИКИ",
		"Los socios compran el {0}: un {1}% vota sí en la asamblea": "Клуб {0} переходит к своим членам: {1}% голосуют «за» на собрании",
		"DE LOS SOCIOS": "НАРОДНЫЙ КЛУБ",
		"Los socios te pagan lo que te debía el club: ${0}": "Члены клуба выплачивают тебе долг клуба: ${0}",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tienes acciones: tu voto arrastra a la grada.": "Три сезона спустя инвестор хочет купить клуб {0}, и собрание проголосует по этому вопросу в конце сезона. По опросам, {1}% за продажу. У тебя есть акции: твой голос ведет за собой трибуны.",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tu voto es uno más, pero la grada escucha a sus jugadores.": "Три сезона спустя инвестор хочет купить клуб {0}, и собрание проголосует по этому вопросу в конце сезона. По опросам, {1}% за продажу. Твой голос — лишь один из многих, но трибуны прислушиваются к своим игрокам.",
		"LA ASAMBLEA VOTA LA VENTA": "ГОЛОСОВАНИЕ О ПРОДАЖЕ",
		"VOTO VENDER": "ЗА ПРОДАЖУ",
		"VOTO SEGUIR": "ПРОТИВ",
		"Los socios venden el {0} a un inversor: un {1}% vota sí": "Члены клуба продают клуб {0} инвестору: {1}% голосуют «за»",
		"Los socios del {0} no venden: un {1}% vota seguir": "Члены клуба {0} против продажи: {1}% голосуют «против»",
		"ASAMBLEA DE SOCIOS": "СОБРАНИЕ ЧЛЕНОВ",
		"EL DUEÑO QUIERE TUS ACCIONES": "ВЛАДЕЛЕЦ ХОЧЕТ ТВОИ АКЦИИ",
		"No regatea: el dinero no es su problema.": "Не торгуется: деньги для него не проблема.",
		"Sabe lo que vale cada parte y lo paga.": "Знает, сколько стоит каждая доля, и платит эту цену.",
		"Su fondo regatea cada céntimo.": "Его фонд торгуется за каждую копейку.",
		"VENDO": "ПРОДАЮ",
		"NO VENDO": "ОСТАВЛЯЮ",
		"EN EL DESPACHO": "В КАБИНЕТЕ",
		"tus acciones": "твои акции",
		"{0} tiene dueño nuevo y lo quiere entero: te ofrece ${1} por la parte que compraste en la asamblea, que te costó ${2}.": "У клуба {0} новый владелец, и он хочет весь клуб целиком: предлагает тебе ${1} за долю, купленную на собрании, — она обошлась тебе в ${2}.",
		"HUELGA EN EL VESTUARIO": "ЗАБАСТОВКА КОМАНДЫ",
		"{0} lleva {1} partidos sin pagar a nadie y a ti te debe ${2}. El capitán os reúne antes de entrenar: nadie sale al campo hasta que el club pague. Si os plantáis todos, la directiva rasca la caja y paga ${3}. Si tú entrenas, la huelga se rompe.": "Клуб {0} не платит никому: матчей без зарплаты — {1}, тебе он должен ${2}. Капитан собирает всех перед тренировкой: никто не выходит на поле, пока клуб не заплатит. Если все выстоите, руководство наскребет денег и заплатит ${3}. Если ты выйдешь на тренировку, забастовка сорвется.",
		"ME SUMO": "Я ЗА",
		"SALGO A ENTRENAR": "НА ТРЕНИРОВКУ",
		"El {0} entra en concurso y le embargan el estadio: jugará en el campo del {1}": "{0}: банкротство и арест стадиона — домашние матчи на поле клуба {1}",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Y el estadio queda embargado: esta temporada jugáis de local en {0}, el campo del {1}.": "Клуб не может расплатиться с долгами, и суд назначает управляющего. До зимнего окна никого не подписывают и ни один контракт не трогают — твой тоже. А стадион арестован: в этом сезоне домашние матчи вы играете на стадионе {0} — поле клуба {1}.",
		"El {0} sale del concurso: pacta con sus acreedores y vuelve a fichar": "{0} выходит из банкротства: договор с кредиторами и возвращение на рынок",
		"TE PEDIRÁN GOL Y PASE": "ЖДУТ ГОЛОВ И ПАСОВ",
		"En el partido: juegas arriba y pegado a tu banda, con más ángulo, contras y balones servidos.": "В матче: играешь высоко у своей бровки — больше острых углов, контратак и мячей на тебя.",
		"EL RESBALÓN": "ПАДЕНИЕ",
		"ESTAMBUL": "СТАМБУЛ",
		"LA REMONTADA": "РЕМОНТАДА",
		"EL 92:48": "92:48",
		"EL CÓRNER RÁPIDO": "БЫСТРЫЙ УГЛОВОЙ",
		"LA FINAL EN SU CASA": "ФИНАЛ У НИХ ДОМА",
		"LA NOCHE DE LONDRES": "ЛОНДОНСКАЯ НОЧЬ",
		"EL PORTERO CABECEA": "ВРАТАРЬ ГОЛОВОЙ",
		"LA FINAL EN MADRID": "ФИНАЛ В МАДРИДЕ",
		"SE RESBALÓ": "ОСТУПИЛСЯ",
		"IBAN 3-0": "БЫЛО 3:0",
		"NADIE MIRABA": "ЗАЗЕВАЛИСЬ",
		"NI UN PENAL": "БЕЗ ПЕНАЛЬТИ",
		"FUE EL PORTERO": "ЗАБИЛ ВРАТАРЬ",
		"Juega con uno de los dos clubes contra el otro.": "Сыграй за один из двух клубов против другого.",
		"Falta una jornada para el derbi.": "До дерби остался один тур.",
		"Faltan {0} jornadas para el derbi.": "Туров до дерби: {0}.",
		"Falta una jornada para la fecha de selecciones.": "До паузы на сборные остался один тур.",
		"Faltan {0} jornadas para la fecha de selecciones.": "Туров до паузы на сборные: {0}.",
		"Te juegas el ascenso": "На кону повышение",
		"Te juegas la salvación": "На кону место в лиге",
		"Te juegas el título": "На кону титул",
		"Te espera el derbi": "Впереди дерби",
		"Derbi ante {0}": "Дерби против {0}",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que bote.": "Тебе скидывают мяч на грудь: принимаешь и бьешь с лета, не дав ему коснуться земли.",
		"Stick izquierdo para correr; pulsa {0} para barrerte": "Левый стик — бег; {0} — подкат",
		"Ponte entre el balón y tu portería para robar, o pulsa {0} para barrerte. Al recuperar, sigue con WASD y ataca.": "Встань между мячом и своими воротами, чтобы отобрать его, или нажми {0} для подката. Отобрав мяч, продолжай с WASD и атакуй.",
		"WASD para correr; pulsa {0} para barrerte": "WASD — бег; {0} — подкат",
		"TU TITULAR LLEGÓ A SU VESTUARIO": "ТВОИ СЛОВА ДОШЛИ ДО СОПЕРНИКА",
		"TRES GOLES Y EL MICRO": "ХЕТ-ТРИК И МИКРОФОН",
		"Hat-trick y el balón bajo el brazo. La cadena te para con él todavía en la mano y quiere oírtelo decir en directo.": "Хет-трик и мяч под мышкой. Телеканал перехватывает тебя, пока мяч еще в руках, и хочет услышать тебя в прямом эфире.",
		"EL GOL DEL FINAL": "ГОЛ В КОНЦОВКЕ",
		"Tu gol en el último suspiro decidió el partido. La cadena te para con el estadio aún temblando y quiere la frase de la noche.": "Твой гол на последних секундах решил исход матча. Телеканал перехватывает тебя, пока стадион еще дрожит, и ждет фразу вечера.",
		"EL PENAL FALLADO": "ПРОМАХ С ТОЧКИ",
		"Fallaste un penal y la sala de prensa sólo quiere hablar de eso. Hay cámaras, hay micro y una pregunta esperándote.": "Ты не забил пенальти, и в пресс-зале хотят говорить только об этом. Камеры, микрофон и вопрос, который тебя ждет.",
		"ASUMIRLO": "ПРИЗНАТЬ",
		"EL PRÓXIMO LO METO": "СЛЕДУЮЩИЙ ЗАБЬЮ",
		"PENAL FALLADO": "ПРОМАХ С ТОЧКИ",
		"Un penal fallado pesa más que tres metidos. Lo que digas ahora es lo que se lee mañana.": "Незабитый пенальти весит больше трех забитых. Что скажешь сейчас, то завтра и прочитают.",
		"RUEDA DE PRENSA": "ПРЕСС-ЗАЛ",
		"· te buscarán": "· за тобой придут",
		"Colgaste las botas y volviste. Esa puerta sólo se abre una vez: la próxima despedida es la última.": "Ты повесил бутсы на гвоздь и вернулся. Эта дверь открывается лишь однажды: следующие проводы станут последними.",
		"Se viene contigo.": "Она едет с тобой.",
		"No se viene. Os toca la distancia.": "Она не поедет. Придется жить на расстоянии.",
		"¿SE VIENE CONTIGO?": "ПОЕДЕТ С ТОБОЙ?",
		"El contrato nuevo está encima de la mesa de la cocina, y es en otro país. {0} lo ha leído dos veces sin decir nada. Su vida está aquí.": "Новый контракт лежит на кухонном столе, и он — в другой стране. {0} дважды перечитала его, не сказав ни слова. Ее жизнь здесь.",
		"PEDIRLE QUE VENGA": "ПОПРОСИТЬ ПОЕХАТЬ",
		"QUE SE QUEDE": "НЕ ЗВАТЬ",
		"LA CLÍNICA": "КЛИНИКА",
		"{0} se ha enterado por la tele antes que por ti. Está en la puerta de la clínica con una bolsa de ropa tuya y cara de no pensar irse.": "{0} узнала обо всем из телевизора раньше, чем от тебя. Она стоит у дверей клиники с сумкой твоих вещей, и по ее лицу видно, что уходить она не собирается.",
		"DEJAR QUE TE CUIDE": "ПРИНЯТЬ ЗАБОТУ",
		"PEDIRLE ESPACIO": "ПОБЫТЬ ОДНОМУ",
		"Ser el máximo goleador de las ligas de Europa.": "Стать лучшим бомбардиром европейских лиг.",
		"El pase del Mundial": "Пас мундиаля",
		"Ser el máximo asistente del Mundial con tu selección.": "Стать лучшим ассистентом мундиаля в составе своей сборной.",
		"Centenario Internacional": "Сотня за сборную",
		"Jugar 100 partidos con tu selección.": "Сыграть 100 матчей за свою сборную.",
		"FOTO OFICIAL": "КОМАНДНОЕ ФОТО",
		"LA FOTO OFICIAL": "КОМАНДНОЕ ФОТО",
		"La plantilla de este año ya tiene su foto. Colgará en la sede toda la temporada.": "У команды этого года уже есть свое фото. Весь сезон оно будет висеть в офисе клуба.",
		"FIRMA EL CONTRATO": "ПОДПИШИ КОНТРАКТ",
		"Tu firma queda guardada: será la de tus autógrafos.": "Твоя подпись сохранена: она будет на твоих автографах.",
		"RENOVACIÓN DE CONTRATO": "ПРОДЛЕНИЕ КОНТРАКТА",
		"CONTRATO DE JUGADOR": "КОНТРАКТ ИГРОКА",
		"FIRMA DEL JUGADOR": "ПОДПИСЬ ИГРОКА",
		"TU CAMISETA A LA GRADA": "ФУТБОЛКУ НА ТРИБУНЫ",
		"Arrastra hacia atrás y suelta": "Оттяни назад и отпусти",
		"Más fuerte": "Сильнее",
		"El niño del cartel se lleva tu camiseta.": "Мальчик с плакатом получает твою футболку.",
		"Iba para el niño, pero se la quedó el de al lado.": "Она летела мальчику, но ее забрал сосед.",
		"La atrapó el de al lado del niño.": "Ее поймал сосед мальчика.",
		"La atrapó uno del muro.": "Ее поймал кто-то у ограждения.",
		"Se la llevó la grada de arriba.": "Ее унес верхний ярус.",
		"Se quedó corta.": "Не долетела.",
		"LA PIZARRA DEL MÍSTER": "ДОСКА ТРЕНЕРА",
		"Dibuja tu jugada": "Нарисуй свою комбинацию",
		"LE GUSTÓ": "ОДОБРИЛ",
		"A SU MANERA": "ПО-СВОЕМУ",
		"El míster deja tu jugada en la pizarra.": "Тренер оставляет твою комбинацию на доске.",
		"El míster borra tus flechas y dibuja las suyas.": "Тренер стирает твои стрелки и рисует свои.",
		"PASEO DE LEYENDAS": "АЛЛЕЯ ЛЕГЕНД",
		"TU HUELLA": "ТВОЙ СЛЕД",
		"DEJA TU HUELLA": "ОСТАВЬ СЛЕД",
		"Mantén el dedo en el cemento": "Зажми палец на цементе",
		"Mantén {0} en el cemento": "Зажми {0} на цементе",
		"Bien honda: ahí se queda para siempre.": "Глубокий отпечаток: он останется здесь навсегда.",
		"La plaza ya tiene tu mano.": "Теперь на площади есть отпечаток твоей ладони.",
		"Apenas se marca: el cemento ya estaba duro.": "Едва заметно: цемент уже застыл.",
		"¡JUNTITOS, TODOS MIRANDO A LA CÁMARA!": "ПЛОТНЕЕ, ВСЕ СМОТРИМ В КАМЕРУ!",
		"¡A LA CUENTA DE TRES!": "НА СЧЕТ ТРИ!",
		"Primera ronda": "Первый раунд",
		"Segunda ronda": "Второй раунд",
		"Tercera ronda": "Третий раунд",
		"Cuarta ronda": "Четвертый раунд",
		"Quinta ronda": "Пятый раунд",
		"Sexta ronda": "Шестой раунд",
		"Séptima ronda": "Седьмой раунд",
		"Octava ronda": "Восьмой раунд",
		"Treintaidosavos": "1/32 финала",
		"32avos": "1/32",
		"1.ª ronda": "1-й раунд",
		"2.ª ronda": "2-й раунд",
		"3.ª ronda": "3-й раунд",
		"4.ª ronda": "4-й раунд",
		"5.ª ronda": "5-й раунд",
		"6.ª ronda": "6-й раунд",
		"7.ª ronda": "7-й раунд",
		"8.ª ronda": "8-й раунд",
		"¡FESTEJO DESBLOQUEADO!": "ПРАЗДНОВАНИЕ ОТКРЫТО!",
		"LA OCARINA": "ОКАРИНА",
		"Te pones el gorro verde, te salen orejas de duende y tocas la ocarina. Lo estrenas en tu próximo gol.": "Надеваешь зеленый колпак, у тебя вырастают эльфийские уши, и ты играешь на окарине. Опробуешь при следующем голе.",
		"Se gana en el piano de casa, tocando de oído una canción de la ocarina: te pones el gorro verde, te salen orejas de duende y la tocas. Uno de cada once goles.": "Открывается за домашним пианино, когда на слух играешь мелодию окарины: надеваешь зеленый колпак, у тебя вырастают эльфийские уши — и играешь. Один гол из одиннадцати.",
		"¡SEXTETE!": "СЕКСТЕТ!",
		"¡SEPTETE!": "СЕПТЕТ!",
		"¡OCTETE!": "ОКТЕТ!",
		"Esto ya no es una temporada: es la historia del club.": "Это уже не сезон, а история клуба.",
		"SUS PADRES, EL DOMINGO": "РОДИТЕЛИ В ВОСКРЕСЕНЬЕ",
		"Los padres de {0} vienen a comer el domingo, como cada mes. Tu agente te ha cerrado una sesión de fotos a la misma hora.": "{0} ждет в воскресенье своих родителей на обед, как каждый месяц. А агент назначил тебе фотосессию на то же время.",
		"PONER LA MESA": "НАКРЫТЬ СТОЛ",
		"LA SESIÓN DE FOTOS": "ФОТОСЕССИЯ",
		"LAS FIESTAS DE SU PUEBLO": "ПРАЗДНИК В ЕЕ ГОРОДКЕ",
		"{0} quiere llevarte a las fiestas de su pueblo. Medio pueblo sabe ya que vas, y el otro medio lo sabrá en cuanto aparques.": "{0} хочет взять тебя на праздник в свой родной городок. Полгорода уже знает, что ты приедешь, а другая половина узнает, как только ты припаркуешься.",
		"IR AL PUEBLO": "ПОЕХАТЬ",
		"ESTE AÑO NO": "ПРОПУСТИТЬ",
		"SU CUMPLEAÑOS, EN UNA ISLA": "ДЕНЬ РОЖДЕНИЯ НА ОСТРОВЕ",
		"{0} celebra su cumpleaños en una isla: avión fletado, cuarenta amigos y tres noches. Tú entrenas el viernes.": "{0} празднует день рождения на острове: чартерный самолет, сорок друзей и три ночи. А у тебя в пятницу тренировка.",
		"IR Y VOLVER EN EL DÍA": "СЛЕТАТЬ НА ДЕНЬ",
		"LLAMARLA A MEDIANOCHE": "ПОЗВОНИТЬ В ПОЛНОЧЬ",
		"LA FOTO DE LAS CINCO": "ФОТО В ПЯТЬ УТРА",
		"Sale una foto de {0} a las cinco de la mañana en una discoteca, la víspera de tu partido. Tú dormías en casa; en las redes nadie lo cree.": "Всплывает фото: {0} в ночном клубе в пять утра, накануне твоего матча. Ты спал дома, но в соцсетях никто в это не верит.",
		"DEFENDERLA EN PÚBLICO": "ЗАЩИТИТЬ ЕЕ ПУБЛИЧНО",
		"PEDIRLE QUE BAJE EL RITMO": "ПОПРОСИТЬ СБАВИТЬ ОБОРОТЫ",
		"LA MESA DEL PRESIDENTE": "СТОЛ ПРЕЗИДЕНТА",
		"{0} ha conseguido sentarte en la mesa del presidente en la cena del club. No te lo ha consultado: te ha dicho a qué hora pasa el coche.": "{0} добилась, чтобы на клубном ужине тебя посадили за стол президента. С тобой она не советовалась — просто сказала, во сколько приедет машина.",
		"IR Y SONREÍR": "УЛЫБАТЬСЯ",
		"NO ME MUEVAS LOS HILOS": "НЕ ДЕРГАЙ ЗА НИТОЧКИ",
		"SU MARCA, TU CARA": "ЛИЦО ЕЕ БРЕНДА",
		"{0} lanza su propia línea de ropa y quiere que la presentes tú. Dice que es un negocio de los dos; el contrato lo firma ella.": "{0} запускает собственную линию одежды и хочет, чтобы ее представил ты. Говорит, что это общее дело; контракт подписывает она.",
		"PRESENTARLA": "ПРЕДСТАВИТЬ",
		"MI CARA NO SE PRESTA": "ЛИЦО НЕ ПРОДАЕТСЯ",
		"EL MENSAJE DE LAS TRES": "СООБЩЕНИЕ В ТРИ НОЧИ",
		"A las tres de la mañana se ha encendido tu teléfono: una periodista, por un reportaje. {0} ha visto la pantalla y ya no se ha vuelto a dormir.": "В три часа ночи загорелся твой телефон: журналистка, насчет репортажа. {0} увидела экран и так и не уснула.",
		"ENSEÑARLE EL TELÉFONO": "ПОКАЗАТЬ ТЕЛЕФОН",
		"ES MI TRABAJO": "ТАКАЯ РАБОТА",
		"LA FISIO NUEVA": "МАССАЖИСТКА",
		"El club ha fichado una fisioterapeuta y {0} ya sabe cómo se llama. Pregunta, como quien no quiere la cosa, a qué hora te toca.": "Клуб взял новую массажистку, и {0} уже знает, как ее зовут. И как бы между прочим спрашивает, во сколько у тебя сеанс.",
		"CAMBIAR DE TURNO": "СМЕНИТЬ ВРЕМЯ",
		"ES MI FISIO": "ЭТО РАБОТА",
		"SU INAUGURACIÓN": "ЕЕ ВЕРНИСАЖ",
		"{0} inaugura su primera exposición el sábado, y el sábado juegas en la otra punta del país. No te ha pedido que vayas.": "{0} открывает свою первую выставку в субботу, а в субботу ты играешь на другом конце страны. Она не просила тебя приехать.",
		"LLEGAR AUNQUE SEA AL FINAL": "УСПЕТЬ ХОТЯ БЫ К КОНЦУ",
		"MANDARLE FLORES": "ПОСЛАТЬ ЦВЕТЫ",
		"TE HA DICHO QUE NO": "ОНА ОТКАЗАЛА",
		"Le pediste a {0} que viniera a la gala del club. Tiene un plan con sus amigas desde hace meses, y te ha dicho que no sin ningún drama.": "{0} получила от тебя приглашение на гала-вечер клуба. У нее уже несколько месяцев планы с подругами, и она спокойно, без драмы, отказала.",
		"IR SOLO Y CONTÁRSELO": "ПОЙТИ ОДНОМУ",
		"PEDIRLE QUE LO CAMBIE": "ПОПРОСИТЬ ПЕРЕНЕСТИ",
		"MADRINA DE LA PEÑA": "КРЕСТНАЯ ФАН-КЛУБА",
		"La peña del barrio quiere a {0} de madrina en su aniversario. Ella ya ha dicho que sí, y a ti te esperan para firmar camisetas.": "Фан-клуб из твоего района хочет, чтобы {0} стала крестной на его юбилее. Она уже согласилась, а тебя ждут подписывать футболки.",
		"IR CON ELLA": "ПОЙТИ С НЕЙ",
		"QUE VAYA ELLA": "ПУСТЬ САМА",
		"TE LO DIJO EN EL COCHE": "РАЗГОВОР В МАШИНЕ",
		"Jugaste mal y {0} te lo ha dicho en el coche, con datos y sin anestesia. Sabe de qué habla: lleva veinte años en la grada.": "Ты сыграл плохо, и {0} сказала тебе это в машине — с цифрами и без анестезии. Она знает, о чем говорит: двадцать лет на трибунах.",
		"HOY NO, POR FAVOR": "НЕ СЕГОДНЯ, ПРОШУ",
		"DIJISTE SU NOMBRE": "ТЫ НАЗВАЛ ЕЕ ИМЯ",
		"En una entrevista nombraste a {0}, de pasada y con cariño. Desde entonces le escriben desconocidos.": "В интервью ты мимоходом и с нежностью назвал имя: {0}. С тех пор ей пишут незнакомцы.",
		"PEDIRLE PERDÓN": "ИЗВИНИТЬСЯ",
		"LO DIJE CON CARIÑO": "Я ЖЕ С ЛЮБОВЬЮ",
		"UNA VALLA MÁS ALTA": "ЗАБОР ПОВЫШЕ",
		"{0} quiere una valla alta y cámaras en la entrada de tu casa. Los vecinos, que te saludan cada mañana, no lo van a entender.": "{0} хочет высокий забор и камеры у входа в твой дом. Соседи, которые здороваются с тобой каждое утро, этого не поймут.",
		"PONER LA VALLA": "СТРОИТЬ ЗАБОР",
		"AQUÍ NO HACE FALTA": "ЗДЕСЬ НЕ НУЖНО",
		"UNA CUENTA DE LOS DOS": "ОБЩИЙ СЧЕТ",
		"{0} ha encontrado un banco que os abre una cuenta conjunta con tarjeta de cristal. Dice que así no tiene que pedirte cada cosa.": "{0} нашла банк, который откроет вам общий счет со стеклянной картой. Говорит, так ей не придется просить у тебя на каждую мелочь.",
		"ABRIRLA": "ОТКРЫТЬ",
		"CADA UNO LA SUYA": "У КАЖДОГО СВОЙ",
		"EL ESCAPARATE": "ВИТРИНА",
		"Paseabais y {0} se ha parado delante de un escaparate. No ha dicho nada. Al día siguiente ha vuelto a pasar por la misma calle.": "Вы гуляли, и {0} остановилась у витрины. Ничего не сказала. А на следующий день снова прошла по той же улице.",
		"SEGUIR ANDANDO": "ИДТИ ДАЛЬШЕ",
		"SU EXAMEN": "ЭКЗАМЕН",
		"{0} tiene el lunes el examen más importante de su carrera. Lleva meses aguantando tus viajes; esta semana sólo te pide la casa en silencio.": "{0} в понедельник сдает самый важный экзамен за всю учебу. Она месяцами терпела твои разъезды; на этой неделе просит только тишины дома.",
		"DORMIR EN EL HOTEL DEL CLUB": "НОЧЕВАТЬ В КЛУБНОМ ОТЕЛЕ",
		"LA CASA ES DE LOS DOS": "ДОМ У НАС ОБЩИЙ",
		"LA CENA DE FIN DE TEMPORADA": "УЖИН В КОНЦЕ СЕЗОНА",
		"{0} se ha hecho amiga de medio vestuario, y ahora el capitán quiere hacer la cena de fin de temporada en tu casa.": "{0} подружилась с половиной раздевалки, и теперь капитан хочет устроить ужин в честь конца сезона у тебя дома.",
		"HACERLA EN CASA": "УСТРОИТЬ ДОМА",
		"MEJOR EN UN RESTAURANTE": "ЛУЧШЕ В РЕСТОРАНЕ",
		"SU AVIÓN": "ЕЕ ДЖЕТ",
		"{0} te ofrece su avión para volver del partido de fuera, en vez del autobús del equipo. Llegarías a casa tres horas antes.": "{0} предлагает тебе свой самолет, чтобы вернуться с выездного матча вместо командного автобуса. Был бы дома на три часа раньше.",
		"EL AVIÓN": "САМОЛЕТ",
		"EL AUTOBÚS": "АВТОБУС",
		"LA CENA CON SU PADRE": "УЖИН С ЕЕ ОТЦОМ",
		"El padre de {0} te ha invitado a cenar. Tiene tres empresas y una sola pregunta: qué vas a hacer cuando dejes el fútbol.": "{0} передает: ее отец зовет тебя на ужин. У него три компании и всего один вопрос: чем ты займешься, когда закончишь с футболом?",
		"TENGO UN PLAN": "ЕСТЬ ПЛАН",
		"NO LO HE PENSADO": "ЕЩЕ НЕ ДУМАЛ",
		"LA LUNA DE MIEL": "МЕДОВЫЙ МЕСЯЦ",
		"Os casasteis en plena temporada y la luna de miel sigue en un cajón. {0} ha encontrado diez días en tu calendario y ya ha mirado vuelos.": "Вы поженились посреди сезона, и медовый месяц до сих пор лежит в ящике. {0} нашла в твоем календаре десять дней и уже посмотрела рейсы.",
		"IROS LOS DIEZ DÍAS": "ВСЕ ДЕСЯТЬ ДНЕЙ",
		"EN VERANO, PROMETIDO": "ЛЕТОМ, ОБЕЩАЮ",
		"NAVIDAD, ¿EN QUÉ CASA?": "РОЖДЕСТВО: У КОГО?",
		"Tu madre y {0} se tratan con una educación que da frío. Este año hay que elegir dónde se pasa la Navidad, y las dos esperan la misma respuesta.": "Твоя мама и {0} общаются с ледяной вежливостью. В этом году нужно решить, где встречать Рождество, и обе ждут одного и того же ответа.",
		"CON SU FAMILIA": "С ЕЕ СЕМЬЕЙ",
		"CON LA TUYA": "С ТВОЕЙ",
		"LA MESA DE LA PRIMERA CENA": "СТОЛИК ПЕРВОГО СВИДАНИЯ",
		"Lleváis meses sin salir solos. {0} ha reservado el jueves en el restaurante de vuestra primera cena, sin preguntarte si tenías algo.": "Вы уже несколько месяцев никуда не выбирались вдвоем. {0} забронировала столик на четверг в ресторане, где был ваш первый ужин, не спросив, свободен ли ты.",
		"IR EL JUEVES": "В ЧЕТВЕРГ",
		"CAMBIARLO DE DÍA": "ДРУГОЙ ДЕНЬ",
		"LAS FOTOS DE LA BODA": "СВАДЕБНЫЕ ФОТО",
		"Una revista ofrece una fortuna por las fotos de vuestra boda, que nunca enseñasteis a nadie. {0} dice que decidas tú.": "Журнал предлагает целое состояние за фото с вашей свадьбы, которые вы никому не показывали. {0} говорит: решай сам.",
		"VENDERLAS": "ПРОДАТЬ",
		"SON NUESTRAS": "ОНИ НАШИ",
		"¿CUÁNTOS AÑOS MÁS?": "СКОЛЬКО ЕЩЕ ЛЕТ?",
		"{0} te ha preguntado, por primera vez, cuántos años más piensas jugar. No era un reproche: quería saber cuándo empezáis a vivir.": "{0} впервые спросила, сколько еще лет ты собираешься играть. Это был не упрек: она хотела знать, когда вы начнете жить.",
		"LOS QUE AGUANTEN LAS PIERNAS": "ПОКА НОГИ ДЕРЖАТ",
		"COMPRA": "КУПИТЬ",
		"Empezáis a salir, {0} y tú. Si no es lo tuyo, se deja en RELACIONES y no cuesta nada.": "Теперь вы встречаетесь: ты и {0}. Если это не твое, все можно закончить в разделе ОТНОШЕНИЯ — это ничего не стоит.",
		"Va a vibrar tres veces. Guarda el teléfono y escucha lo que te cuenta.": "Телефон завибрирует три раза. Убери его и слушай, что она рассказывает.",
		"En la próxima cita te lo preguntará:": "На следующем свидании она тебя об этом спросит:",
		"Lo que te contó en la cena · {0} de {1}": "Что она рассказала за ужином · {0} из {1}",
		"Pulsa con la línea dentro de la franja · {0} de {1}": "Нажми, когда линия внутри полосы · {0} из {1}",
		"Alguien te pregunta a qué te dedicas. Contesta sin presumir.": "Тебя спрашивают, чем ты занимаешься. Ответь без хвастовства.",
		"EL ROBOT": "РОБОТ",
		"Baile suelto: codos en ángulo recto y la cabeza girando a tirones, como una máquina. Pide sitio a la vista.": "Свободный танец: локти под прямым углом, голова поворачивается рывками, как у машины. Нужно свободное место рядом.",
		"Tienes pareja: meces un bebé invisible en los brazos, para quien te espera en casa.": "У тебя есть вторая половинка: ты баюкаешь на руках невидимого малыша — для того, кто ждет тебя дома.",
		"LA LLAMADA": "ЗВОНОК",
		"Hay clubes preguntando por ti: te llevas la mano a la oreja como un teléfono. Que llame tu agente.": "Тобой интересуются клубы: прикладываешь руку к уху, как телефон. Пусть звонят твоему агенту.",
		"EL SURF": "СЕРФИНГ",
		"Baile suelto: te tiras de panza y te deslizas por el césped con los brazos abiertos.": "Свободный танец: бросаешься на живот и скользишь по газону, раскинув руки.",
		"LOS BOLOS": "БОУЛИНГ",
		"Baile suelto: zancada baja y lanzas una bola invisible de bolos rasa por el césped.": "Свободный танец: низкий выпад — и ты катишь невидимый шар для боулинга по газону.",
		"EL ABRAZO": "ОБЪЯТИЯ",
		"Baile suelto: abres los brazos y le das un abrazo enorme a la grada.": "Свободный танец: раскрываешь руки и крепко обнимаешь трибуны.",
		"LA CUMBIA": "КУМБИЯ",
		"Baile suelto: pasito a un lado y al otro, cadera y brazos al ritmo.": "Свободный танец: шажок в одну сторону и в другую, бедра и руки в ритм.",
		"EL RUGIDO": "РЫК",
		"Un golazo: te agachas, sacas las garras y ruges como un león.": "Шедевральный гол: приседаешь, выпускаешь когти и рычишь, как лев.",
		"EL BEBE": "МАЛЫШ",
		"Tener un amigo que juega en otro tipo de teléfono.": "Иметь друга, который играет на телефоне другого типа.",
		"Cuatro Goles": "Четыре гола",
		"Partidos de 4 goles o más": "Матчи с 4 голами и более",
		"DUELO DE CONSOLA": "ДУЭЛЬ НА КОНСОЛИ",
		"El portero te reta a penaltis al acabar el entreno y medio vestuario se queda a mirar y a picarse.": "Вратарь вызывает тебя на пенальти после тренировки, и половина раздевалки остается посмотреть и подзадорить.",
		"El comité europeo deja al {0} sin Europa una temporada": "Европейский комитет отстраняет клуб {0} от еврокубков на сезон",
		"El comité europeo investiga el dinero del jeque del {0}": "Европейский комитет проверяет деньги шейха в клубе {0}",
		"EUROPA DICTA SENTENCIA": "ВЕРДИКТ ЕВРОПЫ",
		"FALLO EUROPEO": "РЕШЕНИЕ ЕВРОПЫ",
		"EL FALLO EUROPEO": "ЕВРОПЕЙСКИЙ ВЕРДИКТ",
		"El comité europeo ha investigado los patrocinios del jeque y los da por inflados: el club no jugará en Europa la temporada que viene. En la liga no pierde ni un punto.": "Европейский комитет проверил спонсорские контракты шейха и признал их завышенными: в следующем сезоне клуб не сыграет в еврокубках. В лиге он не теряет ни одного очка.",
		"· tienes que marcar": "· нужно забить",
		"ASÍ VA EL CHICO DE ORO": "ГОНКА ЗОЛОТОГО ПАРНЯ",
		"El mejor de {0} años o menos, con el mismo baremo que el Jugador del Año.": "Лучший молодой игрок (возраст: до {0}) — по тем же критериям, что и Игрок года.",
		"LA PROMESA DEL AÑO": "ОТКРЫТИЕ ГОДА",
		"LA PROMESA DEL AÑO · {0}": "ОТКРЫТИЕ ГОДА · {0}",
		"TU PRIMER CHICO DE ORO": "ПЕРВЫЙ ЗОЛОТОЙ ПАРЕНЬ",
		"TU CHICO DE ORO Nº {0}": "ЗОЛОТОЙ ПАРЕНЬ № {0}",
		"LA GALA DEL CHICO DE ORO": "ГАЛА «ЗОЛОТОЙ ПАРЕНЬ»",
		"¿QUIÉN ES TU ÍDOLO?": "КТО ТВОЙ КУМИР?",
		"ELEGIR A TU ÍDOLO": "ВЫБРАТЬ КУМИРА",
		"Primer premio en primera. Y la pregunta que te van a hacer toda la carrera.": "Первая награда в высшей лиге. И вопрос, который тебе будут задавать всю карьеру.",
		"MANTÉN PULSADO PARA ELEGIRLO: NO PODRÁS CAMBIARLO": "ЗАЖМИ, ЧТОБЫ ВЫБРАТЬ: ПОМЕНЯТЬ НЕЛЬЗЯ",
		"LA TERTULIA": "ЭКСПЕРТЫ",
		"EL DEBATE": "ДЕБАТЫ",
		"TE ADORAN": "ОБОЖАЮТ",
		"TE CRITICAN": "КРИТИКУЮТ",
		"OPINIONES DIVIDIDAS": "МНЕНИЯ РАЗДЕЛИЛИСЬ",
		"A FAVOR": "ЗА",
		"EN CONTRA": "ПРОТИВ",
		"CON DUDAS": "СОМНЕНИЯ",
		"¿ES PARA PRIMERA?": "ГОТОВ К ВЫСШЕЙ ЛИГЕ?",
		"¿YA ES UN CRACK?": "УЖЕ ЗВЕЗДА?",
		"¿CUMPLE O NO CUMPLE?": "ТЯНЕТ ИЛИ НЕТ?",
		"EL EXJUGADOR": "БЫВШИЙ ИГРОК",
		"LA PERIODISTA": "ЖУРНАЛИСТКА",
		"EL CRÍTICO": "КРИТИК",
		"En la tele ya hablan de ti como de los buenos.": "На ТВ о тебе уже говорят как об одном из лучших.",
		"En la tele piden más. En el campo se contesta.": "На ТВ ждут большего. Отвечать нужно на поле.",
		"En la tele no terminan de decidirse contigo.": "На ТВ никак не решат, что о тебе думать.",
		"Una media de {0}. Eso en Primera no lo firma cualquiera.": "Средняя оценка — {0}. В высшей лиге такое не каждому под силу.",
		"Cada jornada, de lo mejor del campo: {0} de media.": "Каждый тур — среди лучших на поле: в среднем {0}.",
		"Un {0} de media. Cumple, pero de él se espera más.": "Средняя оценка — {0}. Справляется, но от него ждут большего.",
		"{0} de nota. Ni para tirar cohetes ni para preocuparse.": "Оценка {0}. Ни повода для радости, ни повода для тревоги.",
		"Un {0} de media es muy poco para Primera.": "Средняя оценка {0} — это очень мало для высшей лиги.",
		"Con {0} de nota, yo me lo pensaría para el once.": "С оценкой {0} я бы еще подумал, ставить ли его в основу.",
		"Goles: {0}. Asistencias: {1}. Está decidiendo partidos.": "Голы: {0}. Ассисты: {1}. Он решает исход матчей.",
		"Los números hablan solos. Goles: {0}. Asistencias: {1}.": "Цифры говорят сами за себя. Голы: {0}. Ассисты: {1}.",
		"Goles: {0}. Asistencias: {1}. Correcto, sin más.": "Голы: {0}. Ассисты: {1}. Нормально, не более.",
		"Goles: {0}. Asistencias: {1}. Aporta, pero no basta.": "Голы: {0}. Ассисты: {1}. Польза есть, но этого мало.",
		"Goles: {0}. Asistencias: {1}. En toda la temporada. Así no.": "Голы: {0}. Ассисты: {1}. За весь сезон. Так не пойдет.",
		"Goles: {0}. Asistencias: {1}. No aparece: hay que exigirle.": "Голы: {0}. Ассисты: {1}. Его не видно: с него надо спрашивать.",
		"{0} de {1} partidos. El técnico no lo saca del once.": "Матчи: {0} из {1}. Тренер не убирает его из основы.",
		"Es fijo: {0} partidos de {1}. Eso es confianza.": "Железно в основе: {0} из {1}. Это доверие.",
		"{0} partidos de {1}. Todavía no es indiscutible.": "Матчи: {0} из {1}. Пока еще не бесспорный игрок основы.",
		"Entra y sale: {0} de {1}. Tiene que ganarse el sitio.": "То в составе, то нет: {0} из {1}. Место нужно заслужить.",
		"Sólo {0} de {1} partidos. Ni su técnico confía en él.": "Матчи: всего {0} из {1}. Даже собственный тренер ему не доверяет.",
		"{0} partidos de {1}. Así es imposible que crezca.": "Матчи: {0} из {1}. Так ему никак не вырасти.",
		"El equipo va en el puesto {0} y él tiene mucho que ver.": "Место команды в таблице: {0}, и в этом большая его заслуга.",
		"Puesto {0} en la tabla. Cuando el equipo gana, todos brillan.": "Место в таблице: {0}. Когда команда побеждает, блистают все.",
		"El equipo va en el puesto {0}, en tierra de nadie. Y él, igual.": "Место команды: {0}, болото середины таблицы. И он там же.",
		"Puesto {0}. Una temporada gris para todos.": "Место: {0}. Серый сезон для всех.",
		"El equipo va en el puesto {0} y él no ayuda a salir de ahí.": "Место команды: {0}, и он не помогает оттуда выбраться.",
		"Puesto {0} en la tabla. Alguien tiene que dar un paso al frente.": "Место в таблице: {0}. Кто-то должен взять игру на себя.",
		"MANTÉN PARA SALTAR": "ЗАЖМИ · ПРОПУСТИТЬ",
		"TU ÍDOLO": "ТВОЙ КУМИР",
		"A GANARSE EL PUESTO": "ЗАСЛУЖИ МЕСТО",
		"Ahora le toca al banquillo dar la cara.": "Теперь слово за скамейкой запасных.",
		"Ahora tiene que demostrar que es imprescindible.": "Теперь ему нужно доказать, что он незаменим.",
		"Apareció cuando nadie lo esperaba. Eso es un crack.": "Выручил, когда никто не ждал. Вот это звезда.",
		"BAJA SENSIBLE": "ВАЖНАЯ ПОТЕРЯ",
		"Buen gol, pero el partido lo jugó a ratos.": "Красивый гол, но в игре он появлялся лишь эпизодами.",
		"CON ÉL": "С НИМ",
		"CON ÉL Y SIN ÉL": "С НИМ И БЕЗ НЕГО",
		"Cada partido, su gol. Así se gana una liga.": "Каждый матч — гол. Так выигрывают лигу.",
		"Con ese penalti se escaparon los puntos.": "С этим пенальти ушли и очки.",
		"Con o sin ti, el equipo fue igual. Ahora, a marcar la diferencia.": "С тобой или без тебя — команда играла одинаково. Теперь пора делать погоду самому.",
		"Con él, {0} puntos por partido; sin él, {1}.": "Очков за матч: с ним {0}, без него {1}.",
		"Convocado, pero desde el banquillo.": "В заявке, но на скамейке.",
		"Convocado. Ahora a ganarse el once.": "В заявке. Теперь надо пробиться в основу.",
		"Dejó al equipo con diez. Eso no se hace.": "Оставил команду вдесятером. Так нельзя.",
		"EL ONCE DE LA TELE": "КОМАНДА ГОДА ОТ ТВ",
		"EL ONCE DE LA TEMPORADA": "СИМВОЛИЧЕСКАЯ СБОРНАЯ",
		"EL PARTE MÉDICO": "ВЕРДИКТ ВРАЧЕЙ",
		"EL PENALTI FALLADO": "НЕЗАБИТЫЙ ПЕНАЛЬТИ",
		"El equipo aguanta {0} semanas sin él.": "Команда выдержит без него {0} нед.",
		"El equipo ha vivido muy bien sin él.": "Команде без него было очень даже неплохо.",
		"El equipo lo ha echado mucho de menos.": "Команде его очень не хватало.",
		"El equipo ni ganó ni perdió sin él.": "Без него команда ничего не приобрела и не потеряла.",
		"El equipo sumó más sin ti. Toca demostrar en el campo.": "Без тебя команда набирала больше очков. Пора доказать свое на поле.",
		"El portero lo adivinó. Mérito suyo.": "Вратарь угадал. Его заслуга.",
		"El seleccionador cuenta contigo de inicio.": "Главный тренер сборной рассчитывает на тебя с первых минут.",
		"El seleccionador tiene otros nombres.": "У главного тренера сборной другие кандидаты.",
		"Entre los once mejores de la liga. Ahí es nada.": "В символической сборной лиги. Это дорогого стоит.",
		"Entre los once mejores de la liga. La tele te pone de ejemplo.": "В символической сборной лиги. На ТВ тебя ставят в пример.",
		"Ese gol vale puntos y vale una temporada.": "Этот гол стоит очков — и целого сезона.",
		"Ese penalti no se puede fallar.": "Такой пенальти нельзя не забить.",
		"Esta vez no entraste. El once del año que viene se gana desde ya.": "В этот раз не попал. Место в символической сборной следующего года завоевывается уже сейчас.",
		"Esta vez no estás. La próxima lista se gana con tu club.": "В этот раз тебя нет. Место в следующей заявке зарабатывается в клубе.",
		"Estuvo cerca. El año que viene, dentro.": "Был близок. В следующем году попадет.",
		"Está dentro, que es lo primero.": "Он в заявке, а это главное.",
		"Estás en la lista. El once, a ganárselo en los entrenamientos.": "Ты в заявке. Место в основе — заслужи на тренировках.",
		"Fallar un penalti le pasa a cualquiera.": "Не забить пенальти может любой.",
		"Fuera de la lista. Mensaje claro del seleccionador.": "Вне заявки. Ясный сигнал от главного тренера сборной.",
		"Hay que verla diez veces. No lo tengo claro.": "Это надо пересмотреть раз десять. Я не уверен.",
		"IMPRESCINDIBLE": "НЕЗАМЕНИМЫЙ",
		"Indiscutible en el once de la temporada.": "Бесспорный игрок символической сборной сезона.",
		"LA LISTA DE LA SELECCIÓN": "ЗАЯВКА СБОРНОЙ",
		"LA MOVIOLA": "ПОВТОР",
		"LA RACHA": "СЕРИЯ",
		"LA ROJA": "КРАСНАЯ",
		"LA SEQUÍA": "ЗАСУХА",
		"La portería se te resiste. Un gol lo cambia todo.": "Ворота тебе не поддаются. Один гол все изменит.",
		"La selección se construye a su alrededor.": "Сборную строят вокруг него.",
		"La tele lo repite una y otra vez. Al siguiente, se marca.": "На ТВ крутят этот момент снова и снова. В следующий раз — забивай.",
		"La tele no habla de otra cosa: estás en racha.": "На ТВ только об этом и говорят: ты в ударе.",
		"Le faltó regularidad para entrar.": "Ему не хватило стабильности, чтобы попасть.",
		"Le toca ganarse el puesto otra vez.": "Ему снова предстоит заслужить место.",
		"Lo decidió él, sí. Ochenta minutos discretos.": "Да, исход решил он. Но восемьдесят минут были блеклыми.",
		"Lo ha merecido, partido a partido.": "Он это заслужил, матч за матчем.",
		"MAZAZO": "ШОК",
		"Marca en {0} partidos seguidos. Está en racha.": "Матчей подряд с голом: {0}. Он в ударе.",
		"Necesita un gol, aunque sea de rebote.": "Ему нужен гол, пусть даже после рикошета.",
		"Ni rastro de él en el once. Temporada floja.": "В символической сборной его нет и близко. Слабый сезон.",
		"No hay defensa que lo pare ahora mismo.": "Сейчас его не остановит никакая защита.",
		"Otros lo hicieron mejor en su puesto.": "Другие на его позиции сыграли лучше.",
		"PARTE MÉDICO": "ВЕРДИКТ ВРАЧЕЙ",
		"PUNTOS POR PARTIDO": "ОЧКИ ЗА МАТЧ",
		"Para mí, la roja fue muy rigurosa.": "По-моему, красная была слишком строгой.",
		"Partidos que se pierde: {1}. Se notará.": "Пропустит матчей: {1}. Это скажется.",
		"Partidos que se pierde: {1}. Y de los gordos.": "Пропустит матчей: {1}. И очень важных.",
		"Poca cosa. En nada vuelves a estar disponible.": "Ничего серьезного. Скоро снова будешь в строю.",
		"SE PIERDE": "ПРОПУСТИТ",
		"SEMANAS": "НЕДЕЛИ",
		"SIN PARTIDOS A LA VISTA": "МАТЧЕЙ НЕ ПРЕДВИДИТСЯ",
		"SIN ÉL": "БЕЗ НЕГО",
		"Se le ha cerrado la portería.": "Ворота для него закрылись.",
		"Se queda fuera, pero la puerta sigue abierta.": "Остается за бортом, но дверь еще открыта.",
		"Sin marcar en {0} partidos. Un delantero vive del gol.": "Матчей без гола: {0}. Нападающий живет голами.",
		"Sin ti el equipo se resintió. Vuelve su referente.": "Без тебя команде было тяжело. Вернулся ее лидер.",
		"Sin él, el equipo se queda cojo.": "Без него команда хромает.",
		"Sin él, el equipo sumó más: {1} por partido.": "Без него команда набирала больше: {1} за матч.",
		"Sin él, {1} puntos por partido. Con él, {0}.": "Очков за матч: без него {1}, с ним {0}.",
		"Su temporada no le alcanza para la selección.": "Его сезона не хватает для сборной.",
		"TE QUEDAS FUERA": "ТЫ ВНЕ ЗАЯВКИ",
		"Te toca mirar desde la grada unas semanas.": "Несколько недель придется смотреть с трибуны.",
		"Titular con su país. Se lo ha ganado.": "В основе своей сборной. Заслужил.",
		"Tu gol del final es la jugada de la semana.": "Твой поздний гол — момент недели.",
		"Tu roja es la polémica de la semana.": "Твоя красная — главный скандал недели.",
		"UN SUSTO": "ИСПУГ",
		"Un susto y poco más: {0} semanas.": "Отделался легким испугом: {0} нед.",
		"Una roja infantil. La paga el equipo.": "Детская красная. Расплачивается команда.",
		"Va con la selección, pero no es titular.": "Едет со сборной, но не в основе.",
		"Va para largo. El equipo tendrá que apañarse sin ti.": "Это надолго. Команде придется обходиться без тебя.",
		"Vuelve el que marca la diferencia.": "Вернулся тот, кто решает исход матчей.",
		"Vuelve enseguida. Nada que lamentar.": "Скоро вернется. Ничего страшного.",
		"Ya es fijo para el seleccionador.": "У главного тренера сборной он уже твердый игрок основы.",
		"{0} PARTIDOS MARCANDO": "МАТЧЕЙ С ГОЛОМ: {0}",
		"{0} PARTIDOS SIN MARCAR": "МАТЧЕЙ БЕЗ ГОЛА: {0}",
		"{0} semanas fuera, justo cuando iba lanzado.": "Выбыл на {0} нед. — как раз когда был на подъеме.",
		"{0} semanas fuera. Mazazo para el club.": "Выбыл на {0} нед. Тяжелый удар для клуба.",
		"¿LO HAN ECHADO DE MENOS?": "ЕГО НЕ ХВАТАЛО?",
		"ÚLTIMOS PARTIDOS": "ПОСЛЕДНИЕ МАТЧИ",
		"Hay respuestas que te siguen toda la carrera.": "Есть ответы, которые идут за тобой всю карьеру.",
		"HACE {0} TEMPORADAS": "{0} СЕЗ. НАЗАД",
		"MI ÍDOLO ES {0}": "МОЙ КУМИР — {0}",
		"LA PRENSA RECUPERA AQUEL VÍDEO": "ПРЕССА ОТКОПАЛА ТО САМОЕ ВИДЕО",
		"PREMIOS DEL MES DESDE ENTONCES": "НАГРАДЫ МЕСЯЦА С ТЕХ ПОР",
		"¿SIGUE SIENDO TU ÍDOLO?": "ОН ВСЕ ЕЩЕ ТВОЙ КУМИР?",
		"La sala pone el vídeo de hace {0} temporadas. Lo que digas hoy sale mañana al lado.": "В зале включают видео, снятое {0} сез. назад. То, что скажешь сегодня, завтра выйдет рядом с ним.",
		"SIEMPRE LO SERÁ": "И ВСЕГДА БУДЕТ",
		"YA JUEGO MI PROPIA HISTORIA": "ТЕПЕРЬ Я ПИШУ СВОЮ ИСТОРИЮ",
		"EL FAN DE SIEMPRE": "ВСЕ ЕЩЕ ФАНАТ",
		"DE MANOS DE TU IDOLO": "ИЗ РУК ТВОЕГО КУМИРА",
		"Nunca lo gané. Verlo en tus manos es casi lo mismo.": "Я его так и не выиграл. Видеть его в твоих руках — почти то же самое.",
		"Yo también lo levanté una vez. Ahora es tuyo.": "Я тоже однажды его поднимал. Теперь он твой.",
		"Lo levanté {0} veces. Ninguna pesó como ésta.": "Сколько раз я его поднимал: {0}. Но таким тяжелым он не был ни разу.",
		"Te lo entregó {0}, el ídolo del que hablaste aquella noche.": "Его вручил тебе {0} — кумир, о котором ты говорил в тот вечер.",
		"Te Elijo a Ti": "Я выбираю тебя",
		"Ponerle a una mascota el nombre del ratón eléctrico más famoso.": "Назвать питомца в честь самой знаменитой электрической мыши.",
		"Hay un nombre amarillo y eléctrico que tus mascotas llevan esperando.": "Есть одно желтое электрическое имя, которого давно ждут твои питомцы.",
		"LO CONOCES": "ЗНАКОМСТВО",
		"TU IDOLO VINO A VERTE": "КУМИР ПРИШЕЛ К ТЕБЕ",
		"LA PRIMERA VEZ EN PERSONA": "ВПЕРВЫЕ ВЖИВУЮ",
		"la final": "финал",
		"el derbi": "дерби",
		"temporadas después": "сез. спустя",
		"Lo dijiste hace {0} temporadas en una rueda de prensa. Hoy bajó a buscarte.": "Ты сказал это {0} сез. назад на пресс-конференции. Сегодня он сам спустился к тебе.",
		"Te vi levantarla. Yo también temblaba la primera vez.": "Я видел, как ты его поднял. Я тоже дрожал в первый раз.",
		"Hoy duele. Guárdalo: la próxima vez te toca a ti.": "Сегодня больно. Запомни это: в следующий раз будет твой черед.",
		"Esta casa también fue la mía. Gracias por cuidarla.": "Этот дом когда-то был и моим. Спасибо, что бережешь его.",
		"Esta grada no olvida, y yo tampoco. Sigue.": "Эти трибуны не забывают, и я тоже. Вперед.",
		"PINGÜINO": "ПИНГВИН",
		"Un pingüino que anda a pasitos por la casa. Dicen que trae suerte en el próximo gol.": "Пингвин, который ковыляет по дому. Говорят, он приносит удачу перед следующим голом.",
		"EL PINGUINAZO": "ПИНГВИНАТОР",
		"Se gana comprando el pingüino de casa: en tu siguiente gol tu equipo se vuelve pingüinos y los rivales, dinosaurios. Sale una sola vez.": "Открывается покупкой пингвина для дома: после твоего следующего гола твоя команда превращается в пингвинов, а соперники — в динозавров. Срабатывает только один раз.",
		"Tu equipo se vuelve pingüinos y los rivales, dinosaurios. Lo estrenas en tu próximo gol, y sólo esa vez.": "Твоя команда превращается в пингвинов, а соперники — в динозавров. Дебют — после твоего следующего гола, и только в тот раз.",
		"SU FESTEJO": "ЕГО ПРАЗДНОВАНИЕ",
		"TU IDOLO TE ESPERABA": "КУМИР ЖДАЛ ТЕБЯ",
		"NUEVO FESTEJO": "НОВОЕ ПРАЗДНОВАНИЕ",
		"La levanté con esta misma camiseta. Ahora mi festejo es tuyo.": "Я поднял его в этой самой футболке. Теперь мое празднование — твое.",
		"Me has ganado la final. Esto ya no es mío.": "Ты обыграл меня в финале. Это больше не мое.",
		"Se lo ganaste en una final, a él.": "Ты выиграл его в финале — у него самого.",
		"Ganaste una final con su camiseta.": "Ты выиграл финал в его футболке.",
		"Lo estrenas en tu próximo gol.": "Впервые покажешь его после следующего гола.",
		"SU ULTIMO CONSEJO": "ПОСЛЕДНИЙ СОВЕТ",
		"TE INVITO A CENAR": "УЖИН ЗА МОЙ СЧЕТ",
		"LA CENA": "УЖИН",
		"La felicidad está en cada día.": "Счастье — в каждом дне.",
		"Hace {0} años dijiste en una rueda de prensa que yo era tu ídolo.": "{0} г. назад ты сказал на пресс-конференции, что я твой кумир.",
		"Y lo sigues siendo.": "И ты им остаешься.",
		"Cuando me retiré pensé que echaría de menos las finales.": "Когда я завершил карьеру, думал, что буду скучать по финалам.",
		"Pero echo de menos los martes. El autobús, el café malo, las risas del vestuario.": "А скучаю по вторникам. По автобусу, плохому кофе, смеху в раздевалке.",
		"Me he pasado la vida esperando el próximo gran día. Y la felicidad estaba en todos los demás.": "Я всю жизнь ждал следующего большого дня. А счастье было во всех остальных.",
		"¿Y ahora qué hago?": "И что мне теперь делать?",
		"Lo mismo que en el campo: un día cada vez. En el fútbol y en la vida, la felicidad está en cada día.": "То же, что и на поле: день за днем. В футболе и в жизни счастье — в каждом дне.",
		"Por cada día.": "За каждый день.",
		"Yo todavía juego, y ya sé lo que voy a echar de menos.": "Я еще играю, но уже знаю, по чему буду скучать.",
		"No serán las finales. Serán los martes: el autobús, el café malo, las risas del vestuario.": "Не по финалам. По вторникам: по автобусу, плохому кофе, смеху в раздевалке.",
		"TE ELIJO A TI": "Я ВЫБИРАЮ ТЕБЯ",
		"Se gana poniéndole a una mascota el nombre del ratón eléctrico: te calas la gorra roja y lanzas la bola. Lo estrena tu siguiente gol; luego, uno de cada trece.": "Открывается, если назвать питомца в честь электрической мыши: ты надеваешь красную кепку и бросаешь шар. Впервые — после следующего гола; потом — после одного из тринадцати.",
		"El club lo guardaba para alguien como tú.": "Клуб берег его для такого, как ты.",
		"{0} te lo cede.": "{0} уступает его тебе.",
		"¿LLEVAS SU {0}?": "БЕРЕШЬ ЕГО НОМЕР {0}?",
		"LLEVARLO": "ВЗЯТЬ",
		"Cada domingo te compararán con él.": "Каждое воскресенье тебя будут с ним сравнивать.",
		"Tu número, tu historia.": "Твой номер — твоя история.",
		"Ya llevas el {0}.": "Теперь у тебя номер {0}.",
		"La grada compara tu {0} con el de {1}": "Трибуны сравнивают твой номер {0} с тем, что был у игрока {1}",
		"Llevas el {0} a su altura": "Ты носишь номер {0} так же достойно, как он",
		"su dorsal": "его номер",
		"títulos aquí": "титулы здесь",
		"LA ENTREVISTA AL REVES": "ИНТЕРВЬЮ НАОБОРОТ",
		"¿Quién es tu ídolo?": "Кто твой кумир?",
		"{0}. Me firmó la playera cuando tenía {1} años. Todavía la tengo.": "{0}. Он подписал мне футболку, когда мне было {1}. Она до сих пор у меня.",
		"Y ahora me pasa el balón todos los fines de semana.": "А теперь он отдает мне пасы каждые выходные.",
		"Hoy lo tuve enfrente. Sigue siendo él.": "Сегодня я играл против него. Он все тот же.",
		"SU ÍDOLO ERES TÚ": "ТЫ ЕГО КУМИР",
		"TEMPORADAS DESDE QUE DIJISTE EL TUYO": "СЕЗОНОВ С ТВОЕГО ОТВЕТА",
		"Hace {0} temporadas dijiste {1}. Hoy el nombre que dicen es el tuyo.": "{0} сез. назад твой ответ был: {1}. Сегодня называют уже твое имя.",
		"CONTRA TU ÍDOLO": "ПРОТИВ КУМИРА",
		"CONTRA TU IDOLO": "ПРОТИВ КУМИРА",
		"LO ELEGISTE HACE {0} TEMPORADAS": "ТЫ ВЫБРАЛ ЕГО {0} СЕЗ. НАЗАД",
		"ranking": "рейтинг",
		"Alguien le enseñó aquella rueda de prensa. Te reconoce.": "Кто-то показал ему ту пресс-конференцию. Он тебя узнает.",
		"Hoy no eres su aficionado. Eres su rival.": "Сегодня ты не его фанат. Ты его соперник.",
		"Noventa minutos sin pedirle un autógrafo.": "Девяносто минут без просьбы об автографе.",
		"LA CAMISETA DE TU ÍDOLO": "ФУТБОЛКА КУМИРА",
		"Esta no se cambia por nada.": "Эту ни на что не обменяешь.",
		"FICHA CONTIGO": "ТЕПЕРЬ С ТОБОЙ",
		"JUGARÁS CON ÉL": "СЫГРАЕШЬ С НИМ",
		"años después": "г. спустя",
		"Hace {0} años dijiste su nombre delante de todos.": "{0} г. назад ты назвал его имя при всех.",
		"Hace un año dijiste su nombre delante de todos.": "Год назад ты назвал его имя при всех.",
		"Llegas nuevo, y el primero que viene a darte la bienvenida es él.": "Ты новичок, и первым тебя встречает он.",
		"El club lo ha fichado. Ahora entrenas cada día con el que veías por la tele.": "Клуб подписал его. Теперь ты каждый день тренируешься с тем, кого смотрел по телевизору.",
		"Lo pediste tú y el club lo trajo. Ahora te toca estar a su altura.": "Ты попросил его — и клуб его привез. Теперь тебе нужно быть на его уровне.",
		"ES TU ÍDOLO": "ТВОЙ КУМИР",
		"EN EL PALCO": "В ЛОЖЕ",
		"TU ÍDOLO, EN EL PALCO": "ТВОЙ КУМИР — В ЛОЖЕ",
		"SE LEVANTÓ POR TI": "ОН ВСТАЛ РАДИ ТЕБЯ",
		"el partido": "матч",
		"Dos en mi casa. Esta grada ya tiene otro nombre que cantar.": "Два гола в моем доме. У этих трибун появилось новое имя для песен.",
		"Un gol en el derbi, en esta casa. Eso no se olvida nunca.": "Гол в дерби, в этом доме. Такое не забывается.",
		"Lo dijiste hace {0} temporadas. Hoy, en la que fue su casa, el palco entero miró cómo te aplaudía.": "Ты сказал это {0} сез. назад. Сегодня, на его бывшем стадионе, вся ложа видела, как он тебе аплодирует.",
		"SE MIDE CON SU ÍDOLO": "ПРОТИВ СВОЕГО КУМИРА",
		"EL DISCIPULO YA ES MEJOR": "УЧЕНИК УЖЕ ЛУЧШЕ",
		"EL DISCÍPULO YA ES MEJOR": "УЧЕНИК УЖЕ ЛУЧШЕ",
		"EDICIÓN ESPECIAL": "СПЕЦВЫПУСК",
		"EL ALUMNO SUPERA AL MAESTRO": "УЧЕНИК ПРЕВЗОШЕЛ УЧИТЕЛЯ",
		"ÚLTIMA HORA: {0} SUPERA A {1} EN EL RANKING": "СРОЧНО: {0} В РЕЙТИНГЕ ВЫШЕ, ЧЕМ {1}",
		"TU RANKING": "ТВОЕ МЕСТО",
		"SU RANKING": "ЕГО МЕСТО",
		"tu ranking": "твое место",
		"su ranking": "его место",
		"El día que lo nombraste te sacaba {0} puestos.": "В день, когда ты его назвал, разница в рейтинге между вами была {0}.",
		"El día que lo nombraste lo mirabas desde muy abajo.": "В день, когда ты его назвал, ты смотрел на него снизу вверх, издалека.",
		"Hace {0} temporadas dijo en una rueda de prensa que su ídolo era {1}. Hoy el ranking los pone al revés.": "{0} сез. назад он сказал на пресс-конференции, что его кумир — {1}. Сегодня в рейтинге все наоборот.",
		"Un número no es una carrera. {1} ya tiene la suya; a {2} todavía le falta escribirla.": "Цифра — еще не карьера. {1} свою уже написал, а {2} свою еще только пишет.",
		"Hemos hablado con {1} esta mañana. Dice que alguien tenía que pasarle algún día, y que se alegra de que haya sido {2}.": "Сегодня утром на связь вышел {1}. Говорит, когда-нибудь его все равно кто-то должен был обойти, и он рад, что это оказался {2}.",
		"SU DESPEDIDA": "ЕГО ПРОВОДЫ",
		"Compartisteis vestuario. Hoy le aplaudes desde la grada.": "Вы делили раздевалку. Сегодня ты аплодируешь ему с трибуны.",
		"Te tocó enfrentarte a él. Hoy te tocó despedirlo.": "Тебе довелось играть против него. Сегодня — проводить его.",
		"Él tampoco lo olvidó: tu nombre estaba en su lista de invitados.": "Он тоже не забыл: твое имя было в списке гостей.",
		"En el borde del área": "На самой границе штрафной",
		"Abierto al segundo palo": "Открыт у дальней штанги",
		"VUELTA DE HONOR": "КРУГ ПОЧЕТА",
		"LA VUELTA DE HONOR": "КРУГ ПОЧЕТА",
		"LA ÚLTIMA DE {0}": "ПРОЩАНИЕ: {0}",
		"{0} cuelga las botas este verano. La última vuelta fue suya.": "{0} этим летом вешает бутсы на гвоздь. Последний круг почета был его.",
		"Más Premios al Mejor en una carrera": "Больше всего наград «Игрок года» за карьеру",
		"Tus amigos te esperan para una noche de videojuegos. El técnico ofrece una sesión extra de vídeo y tiros a puerta. No llegas a las dos.": "Друзья ждут тебя на вечер видеоигр. Тренер предлагает дополнительное занятие: видеоразбор и удары по воротам. Успеть и туда, и туда не выйдет.",
		"CONSOLA CON AMIGOS": "КОНСОЛЬ С ДРУЗЬЯМИ",
		"Caños": "Калитки",
		"Año redondo del club: el técnico cuenta más contigo": "Отличный год клуба: тренер больше на тебя рассчитывает",
		"Año para olvidar: el club escucharía ofertas por ti": "Год, который лучше забыть: клуб выслушает предложения по тебе",
		"DIRECTIVA": "РУКОВОДСТВО",
		"El {0} se ilusiona: la directiva pide acabar {1}": "Клуб {0} воодушевлен. Цель руководства: {1}",
		"El {0} rebaja la meta: ahora le basta acabar {1}": "Клуб {0} снижает планку. Теперь цель: {1}",
		"El {0} cae en {1} antes de lo que pedía la directiva": "Клуб {0} вылетает раньше, чем хотело руководство. Стадия: {1}",
		"Cuadrar las cuentas": "Привести финансы в порядок",
		"Salir del rojo del fair play": "Выйти из красной зоны финансового фейр-плей",
		"CAJA SANA": "БЕЗ ДОЛГОВ",
		"CUENTAS": "БЮДЖЕТ",
		"¡Que alguien le pite!": "Судья, свисти!",
		"Un recogepelotas de casa te tira el balón detrás de la valla para hacer tiempo.": "Подающий мячи у хозяев забрасывает мяч за рекламные щиты, чтобы потянуть время.",
		"Balón largo": "Длинный заброс",
		"Te cuelgan un balón largo: pica cuando el aro se cierre para bajarlo. Si te rebota, pierdes la jugada.": "Тебе навешивают длинный мяч: нажми, когда кольцо сомкнется, чтобы его обработать. Если мяч отскочит, эпизод потерян.",
		"ESA NOCHE": "ТОЙ НОЧЬЮ",
		"EN CASA DE UN COLEGA": "У ДРУГА ДОМА",
		"¡LO PUSE DE CAPITÁN!": "ОН У МЕНЯ КАПИТАН!",
		"¡Y YO LO TENÍA EN EL BANQUILLO!": "А У МЕНЯ ОН В ЗАПАСЕ!",
		"EL CAPITÁN DEL FANTASY": "КАПИТАН В ФЭНТЕЗИ",
		"FANTASY": "ФЭНТЕЗИ",
		"LOS DEL SOFÁ": "ДИВАННЫЙ КЛУБ",
		"{0} goles tuyos y un colega que no se calla: te tenía de capitán.": "Голы: {0}. А друг не умолкает — ты был у него капитаном.",
		"MÁXIMO": "РЕКОРД",
		"TU CAPITÁN SUMA {0} PTS": "ТВОЙ КАПИТАН: {0} ОЧК.",
		"FIRMADA": "ПОДПИСАНА",
		"CON BARRO": "В ГРЯЗИ",
		"SU ÚLTIMA TEMPORADA": "ЕГО ПОСЛЕДНИЙ СЕЗОН",
		"PROMESA CUMPLIDA": "ОБЕЩАНИЕ СДЕРЖАНО",
		"El mejor de su equipo te buscó a ti.": "Лучший игрок их команды подошел именно к тебе.",
		"Te la firmó antes de dártela.": "Он подписал ее, прежде чем отдать тебе.",
		"Con el barro de esta tarde todavía encima.": "На ней еще грязь сегодняшнего матча.",
		"Se retira este verano. Es de las últimas que vestirá.": "Этим летом он завершает карьеру. Это одна из последних футболок, которые он наденет.",
		"TÚ: {0} DE MEDIA": "ТЫ: {0} В СРЕДНЕМ",
		"PRIMAS": "БОНУСЫ",
		"TU CONTRATO PAGA": "ПО КОНТРАКТУ",
		"ESTA TEMPORADA": "В ЭТОМ СЕЗОНЕ",
		"FICHA": "З/П",
		"CADA PARTIDO": "ЗА МАТЧ",
		"COBRADO": "ПОЛУЧЕНО",
		"FIRMA": "ПОДПИСЬ",
		"PACTADA": "ОГОВОРЕНО",
		"BASE": "БАЗА",
		"MEJOR DEL CLUB": "ЛУЧШИЙ В КЛУБЕ",
		"Primas por goles": "Бонусы за голы",
		"Lo que llevas cobrado en primas esta temporada.": "Сколько ты уже получил бонусами в этом сезоне.",
		"Se cobra al cierre de la temporada si cumples el objetivo.": "Выплачивается в конце сезона, если ты выполнишь цель.",
		"Se cobra al cierre de la temporada si el club cumple lo que pide.": "Выплачивается в конце сезона, если клуб выполнит поставленную задачу.",
		"Se cobra al cierre de la temporada si el club gana el título.": "Выплачивается в конце сезона, если клуб выиграет титул.",
		"Se cobra en cuanto ganas el premio.": "Выплачивается сразу, как только ты получишь награду.",
		"Se cobra en el partido, por cada gol que marques.": "Выплачивается во время матча за каждый твой гол.",
		"Se cobra en el partido, por cada asistencia que des.": "Выплачивается во время матча за каждый твой ассист.",
		"TU BOMBO": "ТВОЙ ВЫБОР",
		"SU MOMENTO": "ЕГО МОМЕНТ",
		"DE VISITA": "В ГОСТЯХ",
		"EN TU BOMBO": "ВЫБРАНО",
		"AL BOMBO": "ВЫБРАТЬ",
		"Elige con la estrella cuáles salen al marcar. Lo nuevo sigue saliendo.": "Звездой отметь, какие празднования будут выпадать после гола. Новые все равно будут появляться.",
		"{0}, jugador del partido. Hoy no hay más preguntas.": "{0} — игрок матча. На сегодня вопросов больше нет.",
		"Qué partido, {0}. Hoy la cena la pagas tú.": "Вот это матч, {0}. Сегодня ужин за тобой.",
		"¡Hoy {0} lo ha bordado! Que no se vaya nunca.": "{0} сегодня просто бесподобен! Только бы никогда не ушел.",
		"{0} se ve en lo más alto. Su frase ya es la portada de la semana.": "{0} видит себя на вершине. Его фраза — уже на первой полосе недели.",
		"Mucho hablar, {0}. En el campo nos vemos.": "Много слов, {0}. Увидимся на поле.",
		"{0} contesta a la crítica. Ahora le toca demostrarlo en el campo.": "{0} отвечает критикам. Теперь это надо доказать на поле.",
		"¡Así se contesta, {0}! Ahora, a callar bocas.": "Вот так отвечают, {0}! А теперь — заткни всем рты.",
		"Lo dijo y lo cumplió. {0} es de los nuestros.": "Сказал — сделал. {0} — наш человек.",
		"Palabra de {0}. Así da gusto.": "{0} сдержал слово. Вот это по-нашему.",
		"¿Y la bravata, {0}? Seguimos esperando.": "Ну и где обещанное, {0}? Мы все еще ждем.",
		"La frase de {0} le salió cara.": "{0} дорого поплатился за громкие слова.",
		"Me firmó la camiseta {0}. Un crack también fuera del campo.": "{0} подписал мне футболку. Звезда и вне поля.",
		"Soy del otro equipo, pero {0} me firmó la camiseta. Respeto.": "Я болею за других, но {0} подписал мне футболку. Респект.",
		"Una hora esperando y {0} pasó de largo.": "Час ждал, а {0} прошел мимо.",
		"¡Me ha caído la camiseta de {0}! No me la quito en un año.": "Поймал футболку, которую бросил {0}! Год не буду снимать.",
		"El balonazo de {0} al móvil lleva todo el día dando vueltas.": "Мяч, который {0} запустил в телефон, весь день гуляет по сети.",
		"Lo de {0} ya es viral. Así se mueven unas redes.": "{0} в тренде: ролик уже завирусился. Вот как надо вести соцсети.",
		"Ese festejo de {0} no se olvida. Te esperamos en la vuelta.": "Такое празднование не забудем, {0}. Ждем тебя в ответном матче.",
		"Polémica por el festejo de {0}: el comité ya lo mira.": "Празднование, которое устроил {0}, вызвало скандал: комитет уже разбирается.",
		"Roja para {0}, y su equipo con uno menos.": "{0} получает красную, его команда в меньшинстве.",
		"A la ducha temprano, {0}.": "Раньше времени в душ, {0}.",
		"Ánimo, {0}. El vestuario te espera.": "Держись, {0}. Раздевалка тебя ждет.",
		"Recupérate pronto, {0}. Te necesitamos.": "Выздоравливай скорее, {0}. Ты нам нужен.",
		"Bienvenido a {1}, {0}. Aquí se suda la camiseta.": "Добро пожаловать в клуб {1}, {0}. Здесь за эту футболку выкладываются до конца.",
		"Es oficial: {0} ya es jugador de {1}.": "Официально: {0} — игрок клуба {1}.",
		"Partido para olvidar de {0}. ¿Dónde estuvo?": "Матч, который {0} лучше забыть. Где он был?",
		"{0} calla bocas: después del zasca, partidazo.": "{0} заткнул всех: после ответки — шикарный матч.",
		"¡Zasca y partidazo! {0} tenía razón.": "Ответка и шикарный матч! {0} был прав.",
		"Tanto zasca para esto: {0}, otra vez gris.": "Столько понтов ради этого: {0} опять никакой.",
		"Mucho móvil y poco fútbol, {0}.": "Больше телефона, чем футбола, {0}.",
		"Esto es cosa de todos. Orgulloso de este vestuario.": "Это заслуга всех. Горжусь этой раздевалкой.",
		"Trabajo, trabajo y más trabajo. Y esto sólo acaba de empezar.": "Работа, работа и еще раз работа. И это только начало.",
		"Esto es para vosotros. Sin vuestra voz no somos nada.": "Это для вас. Без вашего голоса мы ничто.",
		"¡Grande, {0}! Juntos hasta el final.": "Красавчик, {0}! Вместе до конца.",
		"Así se habla. Equipo.": "Правильные слова. Команда.",
		"{0} reparte el mérito. Gesto de capitán.": "{0} делит успех со всеми. Жест настоящего капитана.",
		"¡Ese es mi jugador!": "Вот это мой игрок!",
		"Menos postureo, {0}.": "Поменьше понтов, {0}.",
		"El fútbol es de once, {0}.": "Футбол — игра командная, {0}.",
		"¡Te queremos, {0}!": "Мы тебя любим, {0}!",
		"La grada es nuestro jugador número doce.": "Трибуны — наш двенадцатый игрок.",
		"{0} se gana a la grada otra vez.": "{0} снова покоряет трибуны.",
		"Foto lista para publicar tras el partido. Lo que subas lo verá todo el mundo, y cada mensaje tiene su público.": "Фото готово к публикации после матча. То, что выложишь, увидят все, и у каждого поста своя аудитория.",
		"FOTO CON EL VESTUARIO": "ФОТО С КОМАНДОЙ",
		"TU MOMENTO": "МОЙ МОМЕНТ",
		"PARA LA GRADA": "ДЛЯ ТРИБУН",
		"TE CRITICAN EN REDES": "КРИТИКА В СОЦСЕТЯХ",
		"Partido gris y el hashtag ya corre. Te etiquetan en cada crítica y el móvil no para de vibrar. ¿Contestas?": "Серый матч, а хештег уже разлетается. Тебя отмечают в каждом критическом посте, и телефон не перестает вибрировать. Ответишь?",
		"IGNORAR": "ИГНОР",
		"CON CLASE": "ДОСТОЙНО",
		"ZASCA": "ОТВЕТКА",
		"TU ZASCA CORRE POR LAS REDES": "ТВОЯ ОТВЕТКА В ТРЕНДЕ",
		"Verdugo de Suecia": "Гроза Швеции",
		"Verdugo de Rumanía": "Гроза Румынии",
		"Vencer a todos los clubes de Suecia (las tres divisiones).": "Обыграть все клубы Швеции (все три дивизиона).",
		"Vencer a todos los clubes de Rumanía (las tres divisiones).": "Обыграть все клубы Румынии (все три дивизиона).",
		"LLEGADAS": "ПРИЛЕТ",
		"ACABA DE ATERRIZAR": "ТОЛЬКО ПРИЗЕМЛИЛСЯ",
		"LA LLEGADA": "ПРИБЫТИЕ",
		"te esperaban en el aeropuerto": "ждали тебя в аэропорту",
		"periodistas": "журналистов",
		"LA LLEGADA AL AEROPUERTO": "ВСТРЕЧА В АЭРОПОРТУ",
		"Media ciudad vino a verte bajar del avión.": "Полгорода пришло посмотреть, как ты сходишь с трапа.",
		"En Primera, hasta el aeropuerto tiene micrófonos.": "В высшей лиге даже в аэропорту стоят микрофоны.",
		"En Segunda no se ve esto todos los días.": "Во второй лиге такое увидишь не каждый день.",
		"Pocos, pero ya se saben tu nombre.": "Немного, но твое имя они уже знают.",
		"¿CÓMO LO CELEBRAS?": "КАК ОТПРАЗДНУЕШЬ?",
		"SI NO TOCAS, A TU MANERA": "НЕ ТРОНЕШЬ — ПО-СВОЕМУ",
		"PROVOCAR": "ДРАЗНИТЬ",
		"PERDÓN": "ПРОСТИ",
		"A LOS TUYOS": "К СВОИМ",
		"MULTA": "ШТРАФ",
		"CONTRA TU EX": "БЫВШИЙ КЛУБ",
		"ROCE CON EL TÉCNICO": "ТРЕНИЯ С ТРЕНЕРОМ",
		"ROCE CON EL VESTUARIO": "РАЗЛАД В РАЗДЕВАЛКЕ",
		"RECIÉN SALIDO": "ТОЛЬКО ВЫШЕЛ",
		"{0} corrió a abrazar a su técnico. Paz en el banquillo.": "{0} побежал обнимать тренера. На скамейке мир.",
		"Ese abrazo de {0} con el míster dice mucho.": "Объятие игрока {0} с тренером говорит о многом.",
		"Gol de {0} y todos con él. Este vestuario está unido.": "Гол: {0}, и все с ним. Эта раздевалка едина.",
		"¡{0} vino a celebrarlo con nosotros!": "{0} пришел праздновать с нами!",
		"{0} no lo celebró contra nosotros. Respeto.": "{0} не праздновал гол против нас. Уважение.",
		"{0} marca a su ex y no lo celebra.": "{0} забивает бывшему клубу и не празднует.",
		"NADA QUE ARREGLAR": "НЕЧЕГО ИСПРАВЛЯТЬ",
		"Me equivoqué. Pido perdón al club, al míster y a mis compañeros.": "Я ошибся. Прошу прощения у клуба, тренера и партнеров.",
		"{0} pide perdón en un comunicado. El club da el asunto por cerrado.": "{0} извинился в заявлении. Клуб считает вопрос закрытым.",
		"Errores los tenemos todos. A seguir, {0}.": "Ошибаются все. Дальше, {0}.",
		"Disculpas aceptadas. Ahora, a darlo todo.": "Извинения приняты. Теперь выкладывайся.",
		"Mucho perdón ahora, {0}…": "Сколько извинений теперь, {0}…",
		"Dije lo que pienso y no me escondo.": "Я сказал, что думаю, и не прячусь.",
		"{0} no rectifica: ni una palabra de disculpa.": "{0} не отступает: ни слова извинений.",
		"¡Sin miedo, {0}! Con dos.": "Без страха, {0}! Смело.",
		"Así no ayudas al equipo, {0}.": "Так ты не помогаешь команде, {0}.",
		"{0} se planta. El míster toma nota.": "{0} стоит на своем. Тренер это запомнит.",
		"Ni comunicado ni disculpa: {0} guarda silencio.": "Ни заявления, ни извинений: {0} молчит.",
		"¿Y el comunicado, {0}? Seguimos esperando.": "А где заявление, {0}? Все еще ждем.",
		"¿QUÉ TE CONVENCIÓ DE VENIR?": "ЧТО ТЕБЯ УБЕДИЛО?",
		"{0} periodistas y una pregunta. Lo que contestes lo va a oír todo el club.": "Журналистов: {0}, и один вопрос. Что ответишь, услышит весь клуб.",
		"EL TÉCNICO": "ТРЕНЕР",
		"EL EQUIPO": "КОМАНДА",
		"LA AFICIÓN": "БОЛЕЛЬЩИКИ",
		"LA PROXIMA: MULTA ×2 · ROJA {0}": "В СЛЕДУЮЩИЙ РАЗ: ШТРАФ ×2 · КРАСНАЯ {0}",
		"LA PROXIMA: TECNICO {0}": "В СЛЕДУЮЩИЙ РАЗ: ТРЕНЕР {0}",
		"VIGILADO: MULTA ×2": "ПОД НАБЛЮДЕНИЕМ: ШТРАФ ×2",
		"VIGILADO: TECNICO {0}": "ПОД НАБЛЮДЕНИЕМ: ТРЕНЕР {0}",
		"{0} no cierra la puerta a {1}. ¿Se va?": "{0} не закрывает дверь перед клубом {1}. Уходит?",
		"¿{0} coqueteando con {1}? Así no.": "{0} заигрывает с клубом {1}? Так нельзя.",
		"{0} se queda. ¡Eso es compromiso!": "{0} остается. Вот это преданность!",
		"{0} corta el rumor de {1}.": "{0} пресекает слухи о клубе {1}.",
		"Gracias a {0} por el pase de hoy.": "{0}, спасибо за сегодняшний пас.",
		"Se sabe que te seguimos. Lo que digas lo oyen tu grada y nuestro despacho.": "Все знают, что мы за тобой следим. Что скажешь — услышат и твои болельщики, и наш офис.",
		"Respetamos tu palabra, {0}. La puerta sigue abierta.": "Мы уважаем твое слово, {0}. Дверь остается открытой.",
		"¡Vaya pase me diste, crack! Ese gol es medio tuyo.": "Вот это пас, красавчик! Этот гол наполовину твой.",
		"Gracias por la camiseta del túnel, {0}. Desde entonces no me pierdo un gol tuyo.": "Спасибо за футболку в туннеле, {0}. С тех пор не пропускаю ни одного твоего гола.",
		"¡Tu camiseta ya está colgada en mi cuarto, {0}!": "Твоя футболка уже висит у меня в комнате, {0}!",
		"Me alegró verte, {0}. Sigue así.": "Рад был тебя видеть, {0}. Так держать.",
		"En el fútbol nunca se sabe.": "В футболе никогда не знаешь.",
		"Mi sitio está aquí.": "Мое место здесь.",
		"El próximo te lo pongo yo.": "Следующий пас — с меня.",
		"¡Gracias por estar siempre!": "Спасибо, что всегда рядом!",
		"Verdugo de Bosnia y Herzegovina": "Гроза Боснии и Герцеговины",
		"Vencer a todos los clubes de Bosnia y Herzegovina (las tres divisiones).": "Обыграть все клубы Боснии и Герцеговины (все три дивизиона).",
		"Las copas europeas estrenan rondas previas este verano": "Еврокубки этим летом вводят квалификационные раунды",
		"El {0} jugará la ronda {1} de la {2} contra el {3}": "Клуб {0} сыграет в раунде {1} турнира {2} против клуба {3}",
		"El {0} elimina al {1} y entra en la fase de liga de la {2}": "Клуб {0} выбивает клуб {1} и выходит в этап лиги турнира {2}",
		"El {0} elimina al {1} y pasa a la ronda {2} de la {3}": "Клуб {0} выбивает клуб {1} и проходит в раунд {2} турнира {3}",
		"El {0} cae ante el {1} y se queda sin Europa": "Клуб {0} уступает клубу {1} и остается без Европы",
		"El {0} cae ante el {1} y baja a la fase de liga de la {2}": "Клуб {0} уступает клубу {1} и опускается в этап лиги турнира {2}",
		"El {0} cae ante el {1} y baja a la ronda {2} de la {3}": "Клуб {0} уступает клубу {1} и опускается в раунд {2} турнира {3}",
		"{0} gana una plaza extra en la {1} por su temporada europea": "{0} получает дополнительное место в турнире {1} за европейский сезон",
		"Mil Goles": "Тысяча голов",
		"1.000 goles en tu carrera.": "1000 голов в карьере.",
		"Hat-Trick en la Final": "Хет-трик в финале",
		"3 goles en una final.": "3 гола в одном финале.",
		"Goleador de la Patria": "Бомбардир родины",
		"50 goles con tu selección.": "50 голов за свою сборную.",
		"Bicampeón del Mundo": "Двукратный чемпион мира",
		"Ganar 2 Mundiales con tu selección.": "Выиграть мундиаль 2 раза со своей сборной.",
		"Era Dorada": "Золотая эра",
		"5 Balones de Oro.": "5 наград «Игрок года».",
		"Mr. Champions": "Мистер Кубок элиты",
		"Ganar la Champions 5 veces en tu carrera.": "Выиграть Кубок элиты 5 раз за карьеру.",
		"Tricampeón de Europa": "Трехкратный чемпион Европы",
		"Ganar la Champions 3 temporadas seguidas.": "Выиграть Кубок элиты 3 сезона подряд.",
		"Mr. Libertadores": "Мистер Кубок Славы",
		"Ganar la Libertadores 5 veces en tu carrera.": "Выиграть Кубок Славы 5 раз за карьеру.",
		"Mr. Copa del Norte": "Мистер Северный кубок",
		"Ganar la Concacaf Champions Cup 5 veces en tu carrera.": "Выиграть Северный кубок 5 раз за карьеру.",
		"Killer de Europa": "Киллер Европы",
		"Ser 3 veces el máximo goleador de la Champions.": "3 раза стать лучшим бомбардиром Кубка элиты.",
		"¡Llamen a Mantenimiento!": "Зовите техников!",
		"Romper de dos balonazos las dos cuerdas que tensan la red y que salga el staff a tenderlas.": "Двумя ударами порвать обе верёвки, натягивающие сетку, и заставить персонал выйти их натянуть.",
		"La red no se sostiene sola: algo la tensa por detrás.": "Сетка не держится сама: что-то натягивает её сзади.",
	},








	"plural": {


		"pluralTIRO": ["УДАР", "УДАРА", "УДАРОВ"],
		"pluralPASE": ["ПАС", "ПАСА", "ПАСОВ"],
		"FIRMA DE AUTÓGRAFOS": "АВТОГРАФ-СЕССИЯ",
		"AUTÓGRAFOS FIRMADOS": "АВТОГРАФЫ ГОТОВЫ",
		"FIRMA LA CAJA": "ПОДПИШИ ПАЧКУ",
		"FIRMAS EN EL SÚPER": "ПОДПИСИ В СУПЕРЕ",
		"Diez cajas firmadas. Ésas no se las come nadie.": "Десять подписанных коробок. Их никто не съест.",
		"FIRMA EL CROMO": "ПОДПИШИ КАРТУ",
		"FIRMAS EN EL BARRIO": "ПОДПИСИ ВО ДВОРЕ",
		"FIRMA EL PÓSTER": "ПОДПИШИ ПОСТЕР",
		"FIRMA LA CLAQUETA": "ПОДПИШИ ХЛОПУШКУ",
		"FIRMAS BAJO LA VALLA": "АВТОГРАФЫ У БИЛБОРДА",
		"FIRMAS EN LA PLAZA": "АВТОГРАФЫ: ПЛОЩАДЬ",
		"FIRMAS EN EL PLATÓ": "АВТОГРАФЫ: СЪЕМКА",
		"Diez pósters firmados. Ésos acaban enmarcados.": "Десять подписанных постеров. Такие оправляют в рамку.",
		"Diez fotos firmadas. Ésas brillan más que las pantallas.": "Десять подписанных фото. Они ярче любых экранов.",
		"Diez claquetas firmadas. Esta vez sí lo grabó alguien.": "Десять подписанных хлопушек. В этот раз кто-то реально снял.",
		"SELFIE": "СЕЛФИ",
		"ENCUADRA Y DISPARA": "КАДРИРУЙ И СНИМАЙ",
		"FOTO": "ФОТО",
		"ARRASTRA": "ТЯНИ",
		"MOVIDA": "СМАЗАНО",
		"SELFIES": "СЕЛФИ",
		"A TUS REDES": "В ТВОЮ ЛЕНТУ",
		"Diez cromos firmados. Ésos ya no se cambian.": "Десять подписанных карточек. Их больше не обменяют.",
		"FIRMA EL CARTEL": "ПОДПИШИ ПОСТЕР",
		"FIRMAS EN LA PARADA": "ПОДПИСИ У ОСТАНОВКИ",
		"Diez carteles firmados. Ésos no los arranca nadie.": "Десять подписанных плакатов. Их никто не сорвет.",
		"FIRMA LA PORTADA": "ПОДПИШИ ОБЛОЖКУ",
		"FIRMAS EN LA TIENDA": "ПОДПИСИ В МАГАЗИНЕ",
		"Diez portadas firmadas. Ésas no se revenden.": "Десять подписанных обложек. Их не перепродают.",
		"pluralASISTENCIA": ["АССИСТ", "АССИСТА", "АССИСТОВ"],
		"pluralA PUERTA": ["В СТВОР", "В СТВОР", "В СТВОР"],
		"pluralREGATE": ["ДРИБЛИНГ", "ДРИБЛИНГА", "ДРИБЛИНГОВ"],
		"pluralPÉRDIDA": ["ПОТЕРЯ", "ПОТЕРИ", "ПОТЕРЬ"],
		"pluralFALTA RECIBIDA": ["ФОЛ НА ТЕБЕ", "ФОЛА НА ТЕБЕ", "ФОЛОВ НА ТЕБЕ"],


		"pluralFIJADO": ["ВКЛЮЧЕН", "ВКЛЮЧЕНЫ", "ВКЛЮЧЕНО"],
		"pluralVETADO": ["УБРАН", "УБРАНЫ", "УБРАНО"],

		"pluralJORNADA": ["ТУР", "ТУРА", "ТУРОВ"],
		"pluraljornada": ["тур", "тура", "туров"],
		"pluralPUNTO": ["ОЧКО", "ОЧКА", "ОЧКОВ"],
		"pluralsemana": ["неделя", "недели", "недель"],
		"pluraldía": ["день", "дня", "дней"],
		"pluralclub": ["клуб", "клуба", "клубов"],
		"pluraloferta": ["предложение", "предложения", "предложений"],
		"pluralpatrocinador": ["спонсор", "спонсора", "спонсоров"],
		"pluralquiere": ["хочет", "хотят", "хотят"],
		"pluraltemporada": ["сезон", "сезона", "сезонов"],
		"pluraljugador": ["игрок", "игрока", "игроков"],
		"pluralrival": ["соперник", "соперника", "соперников"],
		"pluralpar": ["пара", "пары", "пар"],
		"pluralcompañero": ["партнер", "партнера", "партнеров"],
		"pluralgol": ["гол", "гола", "голов"],
		"pluralasistencia": ["ассист", "ассиста", "ассистов"],
		"pluralAÑO": ["ГОД", "ГОДА", "ЛЕТ"],
		"pluralSEMANA": ["НЕДЕЛЯ", "НЕДЕЛИ", "НЕДЕЛЬ"],
		"pluralDÍA": ["ДЕНЬ", "ДНЯ", "ДНЕЙ"],
		"pluralpartido": ["матч", "матча", "матчей"],
		"pluralPARTIDO": ["МАТЧ", "МАТЧА", "МАТЧЕЙ"],

		"pluralGOL": ["ГОЛ", "ГОЛА", "ГОЛОВ"],
		"pluralTEMPORADA": ["СЕЗОН", "СЕЗОНА", "СЕЗОНОВ"],
		"pluralPARADA": ["СЕЙВ", "СЕЙВА", "СЕЙВОВ"],
		"pluralfichaje": ["трансфер", "трансфера", "трансферов"],
		"pluralescudo": ["эмблема", "эмблемы", "эмблем"],
		"pluralcompeticion": ["турнир", "турнира", "турниров"],
		"pluralestadio": ["стадион", "стадиона", "стадионов"],
		"pluralderbi": ["дерби", "дерби", "дерби"],
		"pluraltécnico": ["тренер", "тренера", "тренеров"],
		"pluraltécnico sin equipo": ["тренер без клуба", "тренера без клуба", "тренеров без клуба"],
		"pluralseleccionador": ["тренер сборной", "тренера сборных", "тренеров сборных"],
		"pluralcara de leyenda": ["лицо легенды", "лица легенд", "лиц легенд"],
	},










	"guias": {
		"Tu equipo: quién sale hoy, quién descansa y quién te compite el puesto.": "Твоя команда: кто сегодня в основе, кто отдыхает и кто борется с тобой за место.",
		"PARA QUÉ SIRVEN": "ЗАЧЕМ ОНИ НУЖНЫ",
		"Ninguna barra es adorno. El técnico y el vestuario deciden si juegas; la afición y la prensa, cuánto vales y qué marcas te buscan; el agente, cuántas ofertas ves.": "Ни одна шкала здесь не для красоты. Тренер и раздевалка решают, играешь ли ты; болельщики и пресса — сколько ты стоишь и какие бренды тебя ищут; агент — сколько предложений ты видишь.",
		"EL VESTUARIO TE DA EL BALÓN": "РАЗДЕВАЛКА ДАЕТ ТЕБЕ МЯЧ",
		"No es simpatía: con el vestuario hundido te llegan MENOS ocasiones por partido, y con él alto, una o dos más.": "Дело не в симпатии: с раздевалкой на дне у тебя МЕНЬШЕ моментов за матч, а с раздевалкой наверху — на один-два больше.",
		"LA GRADA JUEGA": "ТРИБУНЫ ИГРАЮТ",
		"Con la afición por los suelos, el estadio te arruina jugadas. Con la afición contigo, apuntas más fino.": "Когда болельщики разочарованы, стадион портит тебе моменты. Когда болельщики за тебя — ты целишься точнее.",
		"SUBEN Y BAJAN": "МЕНЯЮТСЯ",
		"Quien te reclama esta semana mueve su barra según lo que contestes. Y todas tiran hacia el medio cada temporada: lo alto cae rápido, lo bajo sube despacio.": "Тот, кто обращается к тебе на этой неделе, двигает свою шкалу в зависимости от твоего ответа. А каждый сезон все шкалы тянутся к середине: высокое падает быстро, низкое растет медленно.",
		"Quién te quiere, cuánto pagan y qué te ofrece cada club. Sólo se mueve en sus dos ventanas: verano e invierno.": "Кто тебя хочет, сколько платит и что предлагает каждый клуб. Меняется только в два окна: летом и зимой.",
		"QUIÉN PUEDE FICHARTE": "КТО ТЕБЯ ПОДПИШЕТ",
		"Hay dos vetos: un grande no ficha a quien no le da el nivel, y un modesto no puede pagarte. Por eso no te llama todo el mundo.": "Есть два запрета: гранд не подпишет того, кто не дотягивает до его уровня, а скромный клуб не потянет твою зарплату. Поэтому звонят не все.",
		"LO QUE VALES": "ТВОЯ СТОИМОСТЬ",
		"Cuatro cosas: lo que sabes hacer, tu puesto, lo que llevas hecho esta temporada y lo que la gente sabe de ti. Y la edad manda: de joven multiplica, y desde los 28 pierdes casi un cuarto cada año.": "Четыре вещи: что ты умеешь, твоя позиция, что ты уже сделал в этом сезоне и что о тебе знают люди. И главное — возраст: в молодости стоимость растет в разы, а с 28 лет ты теряешь почти четверть каждый год.",
		"TU AGENTE ABRE PUERTAS": "АГЕНТ ОТКРЫВАЕТ ДВЕРИ",
		"Su nivel decide CUÁNTAS ofertas ves, y ayuda a arrancarle más sueldo al club. Por eso cobra.": "Его уровень решает, СКОЛЬКО предложений ты видишь, и помогает выбить у клуба зарплату побольше. За это он и берет деньги.",
		"Puedes pedir salir o irte cedido. Al club no le gusta que se lo pidan.": "Можно попросить о трансфере или об аренде. Клубу не нравится, когда его об этом просят.",
		"EL ÁRBITRO PITA": "СУДЬЯ СВИСТИТ",
		"TU PLANTEL": "СОСТАВ",
		"El once de hoy sobre la cancha y, debajo, quién descansa. Es una foto: el once lo pone el técnico, no tú.": "Сегодняшний состав на поле, а под ним — кто отдыхает. Это снимок: основу выбирает тренер, а не ты.",
		"LA ENERGÍA MANDA": "ЭНЕРГИЯ РЕШАЕТ",
		"Tus compañeros se cansan y el técnico los rota: la cancha, la banca y los que no viajan son los del PRÓXIMO partido, no una lista fija. FRESCO, EN FORMA y CARGADO dicen cómo llega cada uno.":
			"Партнеры устают, и тренер их ротирует: поле, запас и те, кто не едет, — это состав на СЛЕДУЮЩИЙ матч, а не постоянный список. СВЕЖИЙ, В ФОРМЕ и УСТАВШИЙ показывают, в каком состоянии каждый.",
		"TU COMPETENCIA": "КОНКУРЕНТ",
		"Arriba, tú contra el que juega en tu puesto: la raya blanca es lo que el club pide para ese sitio. Debajo, de qué depende que salgas — tus cualidades, el técnico y tu racha.":
			"Вверху — ты против того, кто играет на твоей позиции: белая черта — то, что клуб требует для этого места. Внизу — от чего зависит, выйдешь ли ты: твои качества, тренер и твоя форма.",
		"TU HABILIDAD": "МАСТЕРСТВО",
		"Tus diez cualidades. Las ocho de arriba deciden cómo te sale el balón; las dos de abajo son tu especialidad.": "Твои десять характеристик. Восемь верхних решают, как мяч уходит с твоей ноги; две нижние — твоя специализация.",
		"LA ESPECIALIDAD": "СПЕЦИАЛИЗАЦИЯ",
		"Penales y balón parado NO suben tu media: te hacen el lanzador del equipo. Es una elección de estilo, no un atajo.": "Пенальти и стандарты НЕ поднимают твой рейтинг: они делают тебя штатным исполнителем команды. Это выбор стиля, а не короткий путь.",
		"LOS PUNTOS": "ОЧКИ",
		"Al subir de nivel ganas puntos. Se gastan con el más de cada fila, y mientras no salgas de la pantalla puedes deshacer.": "За новый уровень ты получаешь очки. Трать их плюсом в каждой строке; пока не ушел с экрана, все можно отменить.",
		"LOS DESPACHOS": "КАБИНЕТЫ",
		"Aquí se trata con el club fuera de la cancha: cuánto te escuchan y a quién te traen.": "Здесь ты ведешь дела с клубом вне поля: насколько тебя слушают и кого тебе приводят.",
		"CUÁNTO TE ESCUCHAN": "ТВОЙ ВЕС В КЛУБЕ",
		"Seis niveles, y cada uno te deja pedir más. Los sube tu relación (técnico, vestuario, años, afición y títulos aquí) y se revisan en invierno y en verano. Toca uno: verás qué pide y qué da.": "Шесть уровней, и каждый позволяет просить больше. Их поднимают твои отношения (тренер, раздевалка, годы, болельщики и титулы здесь), а пересматриваются они зимой и летом. Нажми на любой — увидишь, что он требует и что дает.",
		"LA MESA DE FICHAJES": "ТРАНСФЕРНЫЕ СДЕЛКИ",
		"Con la ventana abierta marcas a quién vendes y a quién fichas, y el presupuesto se rehace con cada toque. Nada se mueve hasta que confirmas.": "При открытом окне ты отмечаешь, кого продаешь и кого подписываешь, и бюджет пересчитывается с каждым касанием. Ничего не меняется, пока не подтвердишь.",
		"LO QUE SE MUEVE": "ПРИХОДЫ И УХОДЫ",
		"Son fichajes de verdad del mercado, no adorno: el que entra viene de un club real y por un precio.": "Это настоящие трансферы рынка, а не декорация: новичок приходит из реального клуба и за реальные деньги.",
		"EL MERCADO DE LOS DEMÁS": "ЧУЖИЕ ТРАНСФЕРЫ",
		"Quién ficha por quién en todo el mundo, con lo que pagaron.": "Кто куда перешел по всему миру и сколько за это заплатили.",
		"ORDÉNALO": "СОРТИРУЙ",
		"Las fichas de arriba ordenan por fecha, media o precio, y recortan a tu club, tu liga o el mundo.": "Фишки сверху сортируют по дате, рейтингу или цене и сужают выбор до твоего клуба, твоей лиги или всего мира.",
		"EL MUNDO SIGUE": "МИР ЖИВЕТ",
		"Lo que pasa en los partidos que no juegas. La liga vive aunque tú no estés.": "То, что происходит в матчах, где ты не играешь. Лига живет и без тебя.",
		"CAMBIA EL RECORTE": "СМЕНИ ФИЛЬТР",
		"La etiqueta subrayada no es un título: se toca y va rotando entre tu club, tu liga y el mundo entero.": "Подчеркнутая надпись — не заголовок: нажми на нее, и она переключается между твоим клубом, твоей лигой и всем миром.",
		"LO TUYO VA MARCADO": "ТВОЕ ВЫДЕЛЕНО",
		"Las noticias que te tocan llevan el borde de color, y sólo salen las últimas: esto es una portada, no un archivo.": "Новости о тебе обведены цветной рамкой, и видны только последние: это первая полоса, а не архив.",
		"TU CONTRATO": "ТВОЙ КОНТРАКТ",
		"El trato que tienes con el club: tu rol, tu sueldo y hasta cuándo.": "Твой договор с клубом: роль, зарплата и срок.",
		"LO QUE TE PIDEN": "ТВОЯ ЗАДАЧА",
		"El club te marca una meta del año. De cómo la lleves depende lo que te ofrezcan al renovar.": "Клуб ставит тебе цель на год. От того, как ты с ней справляешься, зависит, что тебе предложат при продлении.",
		"Se pide en AGENTE, junto a las ofertas. Lo que puedes pedir sale de cómo vienes jugando, no de lo que te gustaría.": "Просить нужно в разделе АГЕНТ, рядом с предложениями. Что ты можешь попросить, зависит от твоей игры, а не от твоих желаний.",
		"Tu cara y tu pelo, lo que llevas en la cancha y la ropa de calle, en tres pestañas.": "Твое лицо и прическа, форма на поле и уличная одежда — в трех вкладках.",
		"SE GUARDA SOLO": "АВТОСОХРАНЕНИЕ",
		"Cada toque queda guardado. Y lo que compres en TIENDA aparece aquí para ponértelo.": "Каждое касание сохраняется. А то, что купишь в МАГАЗИНЕ, появится здесь — можно сразу надеть.",
		"LAS BOTAS": "БУТСЫ",
		"Dan un bono a tu golpeo, y SE GASTAN con el uso: al agotarse dejan de dártelo.": "Они дают бонус к удару и ИЗНАШИВАЮТСЯ: когда износятся, бонус пропадает.",
		"PARA LA JORNADA": "К МАТЧУ",
		"Lo que se consume: recuperarte, ponerte a punto y llegar mejor al siguiente partido.": "Расходники: восстановиться, войти в форму и подойти к следующему матчу в лучшем состоянии.",
		"Se lleva una comisión de lo que ingresas, y otra al firmar. Es el precio de que alguien te mueva.": "Он берет комиссию с твоих доходов и еще одну — при подписании. Такова цена того, что тебя кто-то продвигает.",
		"Donde vives entre partidos. Subir de casa mejora cómo llegas al siguiente.": "Где ты живешь между матчами. Дом получше — и к следующему матчу ты подходишь в лучшем состоянии.",
		"LA SEMANA": "НЕДЕЛЯ",
		"Lo que puedes hacer en casa esta semana, sin salir a ningún lado.": "Чем можно заняться дома на этой неделе, никуда не выходя.",
		"El siguiente peldaño, con lo que cuesta y lo que da. Ojo: el descanso tiene techo, no se acumula sin fin.": "Следующая ступень: сколько стоит и что дает. Внимание: у отдыха есть потолок, бесконечно он не копится.",
		"Cada competición que juegas, por dentro: su tabla, su cuadro o su grupo, y quién lleva los goles.": "Каждый турнир, в котором ты играешь, изнутри: таблица, сетка или группа и кто лидирует по голам.",
		"EL MUNDO ENTERO": "ВЕСЬ МИР",
		"En la liga puedes viajar a otro país y a otra división: las tablas del planeta están aquí.": "В разделе лиг можно перенестись в другую страну и другой дивизион: здесь все таблицы планеты.",
		"EL HISTORIAL": "ПОБЕДИТЕЛИ",
		"Quién ganó cada año. Tu nombre entra en esa lista si te lo ganas.": "Кто побеждал каждый год. Твое имя попадет в этот список, если заслужишь.",
		"EL MERCADO": "РЫНОК",
		"SI NO JUEGAS": "ЕСЛИ НЕ ИГРАЕШЬ",
		"TU TEMPORADA": "ТВОЙ СЕЗОН",
		"Todos tus partidos en el orden en que se juegan, con lo ya jugado y su resultado.": "Все твои матчи в порядке их проведения: сыгранные — с результатом.",
		"MIRA ADELANTE": "СМОТРИ ВПЕРЕД",
		"Aquí se ve cuándo se te juntan liga, copa y selección: ésas son las semanas en que el cansancio pesa.": "Здесь видно, когда у тебя накладываются лига, кубок и сборная: в эти недели усталость бьет сильнее всего.",
		"EL RANKING": "РЕЙТИНГ",
		"Los jugadores del planeta ordenados por su media, con la tuya dentro para compararte.": "Игроки всей планеты по рейтингу, и ты среди них — для сравнения.",
		"ACÓTALO": "ФИЛЬТРУЙ",
		"Se puede filtrar por puesto y por país: así se ve contra quién compites de verdad.": "Можно фильтровать по позиции и стране: так видно, с кем ты конкурируешь на самом деле.",
		"Los números de todo lo que llevas hecho: temporada a temporada y torneo por torneo.": "Цифры всего, что ты сделал: сезон за сезоном и турнир за турниром.",
		"Cada club por el que pasaste y lo que costó cada movimiento.": "Каждый клуб, в котором ты играл, и сколько стоил каждый переход.",
		"La curva de lo que vales: el termómetro de si vas subiendo o cayendo.": "Кривая твоей стоимости: градусник того, растешь ты или падаешь.",
		"TU PUNTERÍA": "ТВОЙ ПРИЦЕЛ",
		"Desde dónde tiras y desde dónde te entra. Cada marca es un remate tuyo, no una media inventada, y la curva es el vuelo que tuvo ese balón.":
			"Откуда ты бьешь и откуда забиваешь. Каждая отметка — твой настоящий удар, а не выдуманное среднее, а кривая — траектория того мяча.",
		"El gol más lejano, el mejor acierto… lo que hiciste, no lo que crees que haces.": "Самый дальний гол, лучшая точность… то, что ты сделал, а не то, что тебе кажется.",
		"AÑO POR AÑO": "ГОД ЗА ГОДОМ",
		"Con las flechas se mira cualquier temporada ya cerrada.": "Стрелками можно открыть любой завершенный сезон.",
		"TU VITRINA": "ТВОИ ТРОФЕИ",
		"Lo que ya ganaste. Se queda para siempre y se ve también dentro de tu casa.": "То, что ты уже выиграл. Это навсегда — и все это видно у тебя дома.",
		"LO QUE FALTA": "ЧТО ОСТАЛОСЬ",
		"Todo lo que existe por ganar, incluido lo que hoy te queda lejos.": "Все, что можно выиграть, включая то, что сегодня тебе еще не по силам.",
		"LA CASA POR DENTRO": "КЛУБ ИЗНУТРИ",
		"Lo que tu club ganó antes de que llegaras, y quiénes lo hicieron.": "Что твой клуб выиграл до твоего прихода и кто это сделал.",
		"LOS DE SIEMPRE": "ЛУЧШИЕ В ИСТОРИИ",
		"Los máximos goleadores de la casa. Ahí es donde hay que meterse.": "Лучшие бомбардиры в истории клуба. Вот куда нужно пробиться.",
		"LAS LEYENDAS": "ЛЕГЕНДЫ",
		"Los grandes del juego, por liga y por club. Son la vara con la que se te mide.": "Великие игроки по лигам и клубам. Это мерило, по которому судят тебя.",
		"TU SITIO": "ТВОЕ МЕСТО",
		"Con los años, tu nombre aparece en estas listas. Eso es el legado.": "С годами твое имя появляется в этих списках. Это и есть наследие.",
		"EL JUGADOR DEL AÑO": "ИГРОК ГОДА",
		"Quién lo ganó cada año y con qué números. Si no lo ganas tú, lo gana alguien.": "Кто побеждал каждый год и с какими цифрами. Если не выиграешь ты, выиграет кто-то другой.",
		"CÓMO SE GANA": "КАК ВЫИГРАТЬ",
		"Lo que pesa en la votación. Meter goles es una parte, no toda.": "Что учитывается при голосовании. Голы — это лишь часть, а не все.",
		"ESTE AÑO": "ЭТОТ ГОД",
		"Cómo va la votación ahora mismo, contigo dentro si andas cerca.": "Как идет голосование прямо сейчас — и ты в списке, если близок к вершине.",
		"EL PARTIDO": "МАТЧ",
		"Tu equipo, el rival y el minuto. Un partido no se juega de corrido: se juega por OCASIONES, y cada una es tuya.": "Твоя команда, соперник и минута. Матч не идет непрерывно: он состоит из МОМЕНТОВ, и каждый — твой.",
		"A QUIÉN LLEVAS": "КЕМ ТЫ ИГРАЕШЬ",
		"El jugador que controlas ahora. Un pase FUERA del área te pasa el mando al que lo recibe; dentro del área remata él de primera y no hay relevo.": "Игрок, которым ты сейчас управляешь. Пас, который заканчивается ЗА пределами штрафной, передает управление получившему; в штрафной он бьет сразу, и смены нет.",
		"TU NOTA": "ТВОЯ ОЦЕНКА",
		"Sube y baja con cada cosa que haces. Es la nota con la que el técnico te juzga, y la que decide tu temporada.": "Растет и падает с каждым твоим действием. По этой оценке тебя судит тренер, и она решает твой сезон.",
		"EL VIENTO": "ВЕТЕР",
		"Hacia dónde sopla y cuánto. El balón se va con él: cuéntalo al apuntar o el centro se te pasa largo.": "Куда дует и насколько сильно. Мяч сносит вместе с ним: учитывай это при прицеливании, иначе навес уйдет слишком далеко.",
		"EL PARTIDO SE INCLINA": "ПЕРЕЛОМ МАТЧА",
		"Cuando tu equipo se enciende, el rival marca menos entre tus jugadas. Cuando se enfría, aprieta él. Lo verás avisado.": "Когда твоя команда загорается, соперник забивает меньше между твоими моментами. Когда остывает — давит он. Тебя об этом предупредят.",
		"FUERA DE LUGAR": "ОФСАЙД",
		"Cuando salió el pase, el que lo recibió estaba más cerca del arco que el balón y que el penúltimo rival (el portero cuenta): el abanderado levanta y la jugada se anula. A la altura, en juego.": "В момент паса получивший его игрок был ближе к воротам, чем мяч и предпоследний соперник (вратарь считается): судья на линии поднимает флаг, и эпизод отменяется. На одной линии — не офсайд.",
		"El árbitro pita lo que ve. No siempre a tu favor: también te la pitan a ti.": "Судья свистит то, что видит. Не всегда в твою пользу: фолы свистят и против тебя.",
		"TARJETA": "КАРТОЧКА",
		"Queda anotada. La amarilla es un aviso; una roja te deja fuera de los próximos partidos de ese torneo, y ahí no se juega ni se entrena: se espera.": "Она записывается. Желтая — предупреждение; красная отстраняет тебя от ближайших матчей этого турнира, и тогда ты не играешь и не тренируешься: просто ждешь.",
		"AHORA LLEVAS A OTRO": "СМЕНА ИГРОКА",
		"Diste el pase y el mando saltó al que la recibió. Termina tú la jugada: si él vuelve a pasar, el mando se queda contigo.": "Ты отдал пас, и управление перешло к тому, кто его принял. Заверши атаку сам: если он снова отдаст пас, управление останется у тебя.",
		"Desperdiciar ocasiones SEGUIDAS con la nota por los suelos te saca del partido. Si el técnico confía en ti te compra una más, pero no muchas.": "Упустишь несколько моментов ПОДРЯД с оценкой на дне — и тебя заменят. Если тренер тебе доверяет, он даст еще один шанс, но не больше.",
		"CÓMO SE JUEGA": "КАК ИГРАТЬ",
		"TUS PASES": "ТВОИ ПАСЫ",
		"TUS REGATES": "ТВОЙ ДРИБЛИНГ",
		"Asistencia": "Ассист",
		"Acabó en remate": "Закончилось ударом",
		"Sin remate": "Без удара",
		"Por donde pisaste": "Где ты играл",
		"Te la quitaron": "Потеря мяча",
		"Falta a favor": "Фол на тебе",
		" de {0}": " из {0}",
		"EL BAR DE SIEMPRE": "ТОТ САМЫЙ БАР",

		"GALA DEL CLUB": "ГАЛА КЛУБА",
		"GALA DE LA LIGA": "ГАЛА ЛИГИ",
		"La liga te elige su mejor jugador de la temporada.": "Лига признает тебя лучшим игроком сезона.",
		"El mejor de tu línea en toda la liga. El del año fue para {0}.": "Лучший на своей линии во всей лиге. Лучшим игроком сезона стал {0}.",
		"La liga eligió a {0}. El año que viene, la gala también es tuya.": "Выбор лиги — {0}. В следующем году на гала-вечере могут чествовать и тебя.",
		"SUSPENDIDA": "ОТМЕНЕНА",
		"GALA SUSPENDIDA": "ГАЛА ОТМЕНЕНА",
		"MEJOR DEFENSA": "ЛУЧШИЙ ЗАЩИТНИК",
		"MEJOR PORTERO": "ЛУЧШИЙ ВРАТАРЬ",
		"MEJOR MEDIO": "ЛУЧШИЙ ХАВБЕК",
		"MEJOR DELANTERO": "ЛУЧШИЙ НАПАДАЮЩИЙ",
		"MEJOR JUGADOR DE LA TEMPORADA": "ЛУЧШИЙ ИГРОК СЕЗОНА",
		"TROFEOS SUSPENDIDOS": "НАГРАДЫ ОТМЕНЕНЫ",
		"puesto": "место",
		"objetivos": "цели",
		"Tu vestuario te eligió el mejor de la temporada.": "Раздевалка признала тебя лучшим в сезоне.",
		"El mejor de tu línea. El del año fue para {0}.": "Лучший на своей линии. Лучшим игроком сезона стал {0}.",
		"El vestuario eligió a {0}. La próxima gala se empieza a ganar en agosto.": "Выбор раздевалки — {0}. За следующий гала-вечер борются уже с августа.",
		"El club bajó de categoría. La directiva suspende los premios del año por el mal rendimiento del equipo.": "Клуб вылетел. Руководство отменяет награды года из-за плохой игры команды.",
		"El club no cumplió ninguno de sus objetivos. La directiva suspende los premios del año por el mal rendimiento del equipo.": "Клуб не выполнил ни одной из своих целей. Руководство отменяет награды года из-за плохой игры команды.",
		"El club suspende sus premios del año por el mal rendimiento": "Клуб отменяет свои награды года из-за плохих результатов",
		"Mejor (Club)": "Лучший (клуб)",
		"Delantero (Club)": "Нападающий (клуб)",
		"Medio (Club)": "Полузащитник (клуб)",
		"Defensa (Club)": "Защитник (клуб)",
		"Mejor Jugador del Club": "Лучший игрок клуба",
		"Mejor Delantero del Club": "Лучший нападающий клуба",
		"Mejor Medio del Club": "Лучший полузащитник клуба",
		"Mejor Defensa del Club": "Лучший защитник клуба",
		"LA GUARDARON": "ЕЕ СОХРАНИЛИ",
		"tenías": "тебе было",
		"gol": "гол",
		"Alguien la enmarcó y la colgó. Nadie te lo dijo nunca.": "Кто-то вставил ее в рамку и повесил. Тебе об этом так и не сказали.",
		"Sigue ahí. Ya casi nadie se acuerda de aquella tarde, pero sigue ahí.": "Она все еще там. Тот вечер уже почти никто не помнит, но она все еще там.",
		"TU CELULAR": "ТЕЛЕФОН",
		"Cada app es un recorte: tu club, tu liga, el mundo y tus redes, donde se contesta a quien te critica.": "Каждое приложение — отдельный срез: твой клуб, твоя лига, мир и твои соцсети, где можно ответить критикам.",
	},












	"caja": {
		"CONSEGUIR DINERO": "ПОЛУЧИТЬ ДЕНЬГИ",
		"CONSEGUIR PUNTOS": "ПОЛУЧИТЬ ОЧКИ",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu Apple ID.":
			"Это оплачивается ЖИВЫМИ ДЕНЬГАМИ, а не игровыми: списывается с твоего Apple ID.",
		"Lo que compres entra en esta carrera al instante.":
			"Купленное сразу появляется в этой карьере.",
		"DINERO REAL": "ЖИВЫЕ ДЕНЬГИ",
		"DINERO DEL JUEGO": "ИГРОВЫЕ ДЕНЬГИ",
		"LA CAJA": "КАССА",
		"PUNTOS DE HABILIDAD": "ОЧКИ НАВЫКОВ",
		"Se reparten a mano en TU JUGADOR. Un punto cuesta 1 por debajo de 80, 2 de 80 a 89 y 3 de 90 en adelante: cuanto mejor eres, menos rinde el paquete.":
			"Распределяются вручную в разделе ТВОЙ ИГРОК. Очко стоит 1 ниже 80, 2 — от 80 до 89 и 3 — от 90 и выше: чем ты лучше, тем меньше дает пакет.",
		"+ {0} PUNTOS DE HABILIDAD": "ОЧКИ НАВЫКОВ + {0}",
		"EXTRA": "БОНУС",
		"COMPRA LISTA": "ОПЛАЧЕНО",
		"Se sumaron ${0} a tu carrera.": "В твою карьеру добавлено: ${0}.",
		"Tienes {0} puntos nuevos para repartir en TU JUGADOR.":
			"Новых очков для распределения в разделе ТВОЙ ИГРОК: {0}.",
		"Ya lo tienes todo al máximo, así que los puntos entraron como {0} de experiencia.":
			"У тебя уже все на максимуме, поэтому очки превратились в опыт: {0}.",
		"Se registró tu compra. Si no ves lo que compraste, cierra y vuelve a abrir el juego.":
			"Покупка зарегистрирована. Если не видишь купленное, закрой игру и открой снова.",
		"PRIMA DE PARTIDO": "БОНУС ЗА МАТЧ",
		"Para lo que te falta hoy: unas botas, o el gel y la bebida antes del derbi.":
			"На то, чего не хватает сегодня: бутсы или гель с напитком перед дерби.",
		"BONO DE CONTRATO": "БОНУС ЗА ПОДПИСЬ",
		"El deportivo, o unas botas de las buenas con repuesto para toda la temporada.":
			"Спорткар или хорошие бутсы с запасом на весь сезон.",
		"Alcanza para el preparador físico, o para subir de escalón con tu agente.":
			"Хватит на тренера по физподготовке или на ступень выше с агентом.",
		"TRASPASO RÉCORD": "РЕКОРДНЫЙ ТРАНСФЕР",
		"La clínica y el analista de vídeo, de una sentada.":
			"Клиника и видеоаналитик — одним махом.",
		"El agente que te sienta con los grandes de Europa, pagado de golpe.":
			"Агент, который усадит тебя за стол с грандами Европы, — оплачен сразу.",
		"SESIÓN EXTRA": "ДОП. ЗАНЯТИЕ",
		"Cuatro niveles de golpe. Para rematar la habilidad que traes a medias.":
			"Четыре уровня сразу. Чтобы докачать навык, брошенный на полпути.",
		"Sube una habilidad entera de 60 a 85, o reparte donde más duela.":
			"Подними целый навык с 60 до 85 или раздай туда, где болит сильнее всего.",
		"Una habilidad de 60 a 99, y todavía sobra para empezar la siguiente.":
			"Навык с 60 до 99, и еще останется, чтобы начать следующий.",
		"TALENTO GENERACIONAL": "ТАЛАНТ ПОКОЛЕНИЯ",
		"Trescientos puntos. Casi la mitad de todo lo que se puede subir en una carrera.":
			"Триста очков. Почти половина всего, что можно прокачать за карьеру.",







		"TODAS LAS VENTAJAS": "ВСЕ ПЕРКИ",
		"Abre de golpe la vitrina entera de NUEVA CARRERA+, sin esperar a sus logros.":
			"Сразу открывает всю витрину режима НОВАЯ КАРЬЕРА+, не дожидаясь достижений.",
		"PARA SIEMPRE": "НАВСЕГДА",
		"{0} VENTAJAS": "ПЕРКИ: {0}",


		"DOBLE PAGA": "ДОХОД ×2",
		"Sueldo, primas y patrocinios ×2 en todas tus carreras, las de hoy y las que vengan.":
			"Зарплата, бонусы и спонсорские ×2 во всех твоих карьерах — нынешних и будущих.",
		"Activa: cobras el doble en cada partido y en cada cierre.":
			"Активно: ты получаешь вдвое больше за каждый матч и в конце каждого сезона.",
		"TODAS TUS CARRERAS": "ВСЕ ТВОИ КАРЬЕРЫ",
		"PAGO ÚNICO": "РАЗОВЫЙ ПЛАТЕЖ",
		"COBRA ×2": "ДОХОД ×2",


		"DOBLE XP": "ОПЫТ ×2",
		"La XP de cada partido ×2 en todas tus carreras, las de hoy y las que vengan.":
			"Опыт за каждый матч ×2 во всех твоих карьерах — нынешних и будущих.",
		"Activa: ganas el doble de XP en cada partido.":
			"Активно: ты получаешь вдвое больше опыта в каждом матче.",
		"GANA XP ×2": "ОПЫТ ×2",


		"PACK LEYENDA": "ПАК ЛЕГЕНДЫ",
		"DOBLE PAGA y DOBLE XP juntos, en todas tus carreras, las de hoy y las que vengan.":
			"ДОХОД ×2 и ОПЫТ ×2 вместе — во всех твоих карьерах, нынешних и будущих.",
		"Activa: cobras el doble y ganas el doble de XP en cada partido.":
			"Активно: ты получаешь вдвое больше денег и опыта в каждом матче.",
		"LOS DOS ×2": "ОБА ×2",
		"PAGA": "ДОХОД",
		"XP": "ОПЫТ",
		"AHORRO": "ВЫГОДА",
		"CUARTA RANURA": "4-Й СЛОТ",
		"Una cuarta ranura en la portada, para llevar otra carrera a la vez.":
			"Четвертый слот на главном экране, чтобы вести еще одну карьеру параллельно.",
		"Activa: tu portada tiene cuatro ranuras.": "Активно: на главном экране четыре слота.",
		"ABRE LA CUARTA": "ОТКРЫТЬ СЛОТ 4",
		"RANURA": "СЛОТ",
		"A LA VEZ": "СРАЗУ",
		"HITOS": "ВЕХИ",
		"Tus {0} ventajas siguen entrando en cada carrera nueva.":
			"Твои перки ({0}) по-прежнему переходят в каждую новую карьеру.",
		"Se abren todas de golpe en NUEVA CARRERA+, y también las que se añadan después.":
			"Все они сразу открываются в режиме НОВАЯ КАРЬЕРА+, включая те, что добавятся позже.",
		"No marca ningún logro: tu palmarés sigue siendo lo que jugaste.":
			"Не засчитывает никаких достижений: твой послужной список — это по-прежнему то, что ты сыграл.",
		"Se paga una vez y queda en tu Apple ID: vale para las 3 ranuras y para cada carrera nueva.":
			"Оплачивается один раз и привязывается к твоему Apple ID: действует на все 3 слота и каждую новую карьеру.",
		"Listo: ya están abiertas todas. Las eliges al empezar una carrera nueva, en TUS VENTAJAS.":
			"Готово: все уже открыто. Выбирай их в начале новой карьеры, на шаге ТВОИ ПЕРКИ.",
		"COMPRAS": "ПОКУПКИ",
		"¿Reinstalaste el juego o cambiaste de teléfono? Recupera aquí lo que ya pagaste con este Apple ID.":
			"Переустановил игру или сменил телефон? Восстанови здесь покупки, оплаченные с этим Apple ID.",
		"RESTAURAR COMPRAS": "ВОССТАНОВИТЬ ПОКУПКИ",
		"RESTAURANDO": "ПРОВЕРКА",
		"Listo: ya recuperaste lo que habías comprado con este Apple ID.":
			"Готово: покупки с этим Apple ID восстановлены.",
		"Este Apple ID no tiene compras que recuperar en Football Legacy.":
			"У этого Apple ID нет покупок в Football Legacy, которые можно восстановить.",

		"PACK DOBLE": "ДВОЙНОЙ ПАК",
		"Las dos monedas en una compra, y sale mejor que por separado.":
			"Обе валюты в одной покупке — и выгоднее, чем по отдельности.",





		"POSTE": "ШТАНГА",
		"TU {0}%": "ТЫ {0}%",
		"RIVAL {0}%": "ОНИ {0}%",
		"subMANTEN": "ОСТАВИТЬ",
		"subPEDIDO": "ЗАПРОС",
		"subAGUANTA": "ОСТАЕТСЯ",
		"subFUERA": "УХОДИТ",
		"subLESIONADO": "ТРАВМА",
		"Subirla cuesta 1 punto y tienes {0}.": "Повышение стоит 1 очко, у тебя {0}.",
		"Subirla cuesta {0} puntos y tienes {1}.": "Повышение стоит {0} очк., у тебя {1}.",
	},

	"casa_pack_2": {
		"COLCHÓN DE ESTIRAMIENTOS": "КОВРИК ДЛЯ РАСТЯЖКИ",
		"Rutina corta de movilidad: recupera energía y un punto de ánimo.": "Короткая разминка на подвижность: восстанавливает энергию и одно очко настроя.",
		"Zona de movilidad para soltar piernas. Su rutina da energía y ánimo.": "Уголок для растяжки, чтобы размять ноги. Его упражнения дают энергию и настрой.",
		"MÁQUINA DE RESPIRACIÓN": "ДЫХАТЕЛЬНЫЙ ТРЕНАЖЕР",
		"Respiración guiada para centrarte. Da ánimo y confianza con el técnico.": "Дыхательная практика, чтобы собраться. Дает настрой и доверие тренера.",
		"Cabina de respiración guiada para bajar pulsaciones antes de competir.": "Кабина для дыхательных практик, чтобы снизить пульс перед игрой.",
		"PANEL DE OBJETIVOS": "ДОСКА ЦЕЛЕЙ",
		"Metas, notas y hábitos de temporada para vestir la pared.": "Цели, заметки и привычки на сезон — украшение для стены.",
		"Panel de objetivos y hábitos. Decora la pared y ordena tu semana.": "Доска целей и привычек. Украшает стену и упорядочивает твою неделю.",
		"BAR SALUDABLE": "ЗДОРОВЫЙ БАР",
		"Jugos, agua mineral y snacks medidos: recupera energía sin salir.": "Соки, минеральная вода и выверенные перекусы: энергия восстанавливается без выхода из дома.",
		"Bar de jugos, agua mineral y snacks. Recupera un poco de energía.": "Бар с соками, минеральной водой и перекусами. Немного восстанавливает энергию.",
		"LÁMPARA SOLAR": "ЛАМПА-СОЛНЦЕ",
		"Luz cálida de ambiente para que los rincones se sientan habitados.": "Теплый рассеянный свет, с которым в углах становится уютно.",
		"Luz cálida de ambiente. No da bonus, pero levanta mucho el rincón.": "Теплый рассеянный свет. Бонуса не дает, но уголок сразу оживает.",
		"ESTIRAR EN CASA": "РАСТЯЖКА ДОМА",
		"Hasta +4 de energía y +1 de ánimo. Una acción semanal.": "До +4 к энергии и +1 к настрою. Одно действие в неделю.",
		"RESPIRAR Y ENFOCAR": "ДЫХАНИЕ И ФОКУС",
		"+1 de ánimo y +1 con el técnico si aún hay margen. Una acción semanal.": "+1 к настрою и +1 к отношениям с тренером, если еще есть запас. Одно действие в неделю.",
		"HIDRATARSE BIEN": "ПИТЬ ВОДУ",
		"Hasta +4 de energía. Una acción semanal.": "До +4 к энергии. Одно действие в неделю.",
	},




















	"aspecto": {

		"Corte César": "Стрижка «Цезарь»",
		"Coleta": "Хвост",
		"Coleta alta": "Высокий хвост",
		"Calvicie en coronilla": "Лысина на макушке",
		"Dos trenzas": "Две косички",
		"Flat top": "Площадка",
		"Flequillo": "Челка",
		"Corte hongo": "Под горшок",
		"Pelo largo": "Длинные волосы",
		"Melena a la mandíbula": "Каре до подбородка",
		"Moño": "Пучок",
		"Mullet rizado": "Кудрявый маллет",
		"Peinado hacia atrás": "Зачес назад",
		"Raya al lado": "Боковой пробор",
		"Rizado": "Кудри",
		"Semicalvo": "Залысины",
		"Trenzas pegadas": "Колоски",
		"Trenzas largas sueltas": "Длинные косички",
		"Tupé": "Кок",
		"Undercut": "Андеркат",

		"French crop texturizado": "Текстурный французский кроп",
		"Crop con degradado alto": "Кроп с высоким фейдом",
		"Crew cut": "Крю-кат",
		"Buzz con degradado": "Под машинку с фейдом",
		"Tupé corto": "Короткий кок",
		"Raya lateral corta": "Короткий боковой пробор",
		"Edgar con fleco recto": "Эдгар с прямой челкой",
		"Crop rizado": "Кудрявый кроп",
		"Ivy League": "Айви-лиг",
		"Ondas cortas con degradado": "Короткие волны с фейдом",
		"Fleco de cortina largo": "Длинная челка-шторка",
		"Wolf cut suave": "Мягкий вулф-кат",
		"Mullet moderno": "Современный маллет",
		"Rizos sueltos": "Свободные кудри",
		"Rastas recogidas arriba": "Дреды в пучке",
		"Rastas hacia un lado": "Дреды на бок",
		"Trenzas pegadas con diseños": "Колоски с узором",
		"Twists cortos": "Короткие твисты",
		"Melena ondulada": "Волнистая грива",
		"Capas despeinadas": "Небрежный каскад",
		"Media coleta": "Полухвост",
		"Rastas cortas": "Короткие дреды",
		"Rastas con degradado": "Дреды с фейдом",
		"Rastas a la mandíbula": "Дреды до подбородка",
		"Rastas largas sueltas": "Длинные распущенные дреды",
		"Rastas gruesas": "Толстые дреды",
		"Fleco recto": "Прямая челка",
		"Fleco irregular": "Рваная челка",
		"Fleco diagonal": "Косая челка",
		"Fleco de cortina": "Челка-шторка",
		"Fleco ondulado": "Волнистая челка",

		"Barba cuadrada": "Квадратная борода",
		"Barba redondeada": "Круглая борода",
		"Barba trenzada": "Борода в косичке",
		"Bigote de puntas curvadas": "Подкрученные усы",
		"Bigote fino": "Тонкие усики",
		"Bigote chevrón": "Усы-шеврон",
		"Chiva larga": "Длинная козлиная бородка",
		"Bigote herradura": "Усы-подкова",
		"Barba larga": "Длинная борода",
		"Bigote morsa": "Моржовые усы",
		"Patillas unidas al bigote": "Бакенбарды с усами",
		"Perilla": "Бородка",
		"Barba sin bigote": "Борода без усов",
		"Barba de tres días": "Трехдневная щетина",

		"Arqueadas": "Дугой",
		"Caídas": "Опущенные",
		"Con cortes": "С выбривкой",
		"Finas": "Тонкие",
		"Inclinadas": "Наклонные",
		"Naturales": "Естественные",
		"Pobladas": "Густые",

		"Altas": "Высокие",
		"Unidas": "Сросшиеся",
		"Cortas": "Короткие",
		"Largas": "Длинные",
		"Puntiagudas": "Заостренные",
		"Una levantada": "Одна приподнята",
		"Furiosas": "Сердитые",
		"Muy pobladas": "Очень густые",
		"Rectas gruesas": "Прямые широкие",
		"Despeinadas": "Растрепанные",
		"Cuadradas": "Квадратные",
		"Gruesas arqueadas": "Широкие дугой",


		"Crop": "Кроп",
		"Cesar": "Цезарь",
		"Crew": "Крю",
		"Bun": "Пучок",
		"Zigzag": "Зигзаг",
		"Rombos": "Ромбы",
		"Espiga": "Елочка",
		"Malla": "Сетка",
		"Entrenamiento": "Тренировка",
		"Lujo": "Люкс",
		"Ninguna": "Нет",
		"Varsity": "Варсити",
		"Gabardina": "Тренч",
		"Acolchada": "Пуховик",
		"Gimnasio": "Спортзал",
		"Streetwear": "Стритвир",
		"Retro": "Ретро",
		"Invierno": "Зима",
		"Vaquero": "Ковбой",
		"Playero": "Пляж",
		"Rockero": "Рокер",
		"Urbano": "Город",
		"Día de nieve": "Снежный день",
		"Festival": "Фестиваль",
		"Llegada al estadio": "Приезд на стадион",
		"Aeropuerto": "Аэропорт",
		"Rueda de prensa": "Пресс-конференция",
		"Terraza clásica": "Трибунная классика",
		"Usar": "Надеть",
		"Actualizar": "Обновить",
		"Eliminar": "Удалить",
		"Bajas": "Низкие",
		"Villano": "Злодей",
		"Doble corte": "Двойная выбривка",
		"Escalón": "Ступенька",
	},
	"paises": {
		"Afganistán": "Афганистан",
		"Albania": "Албания",
		"Alemania": "Германия",
		"Andorra": "Андорра",
		"Angola": "Ангола",
		"Anguila": "Ангилья",
		"Antigua y Barbuda": "Антигуа и Барбуда",
		"Arabia Saudí": "Саудовская Аравия",
		"Argelia": "Алжир",
		"Argentina": "Аргентина",
		"Armenia": "Армения",
		"Aruba": "Аруба",
		"Australia": "Австралия",
		"Austria": "Австрия",
		"Azerbaiyán": "Азербайджан",
		"Bahamas": "Багамы",
		"Bangladés": "Бангладеш",
		"Barbados": "Барбадос",
		"Baréin": "Бахрейн",
		"Belice": "Белиз",
		"Benín": "Бенин",
		"Bermudas": "Бермуды",
		"Bielorrusia": "Беларусь",
		"Bolivia": "Боливия",
		"Bosnia y Herzegovina": "Босния и Герцеговина",
		"Botsuana": "Ботсвана",
		"Brasil": "Бразилия",
		"Brunéi": "Бруней",
		"Bulgaria": "Болгария",
		"Burkina Faso": "Буркина-Фасо",
		"Burundi": "Бурунди",
		"Bután": "Бутан",
		"Bélgica": "Бельгия",
		"Cabo Verde": "Кабо-Верде",
		"Camboya": "Камбоджа",
		"Camerún": "Камерун",
		"Canadá": "Канада",
		"Catar": "Катар",
		"Chad": "Чад",
		"Chequia": "Чехия",
		"Chile": "Чили",
		"China": "Китай",
		"China Taipéi": "Китайский Тайбэй",
		"Chipre": "Кипр",
		"Colombia": "Колумбия",
		"Comoras": "Коморы",
		"Congo": "Конго",
		"Corea del Norte": "Северная Корея",
		"Corea del Sur": "Южная Корея",
		"Costa de Marfil": "Кот-д’Ивуар",
		"Costa Rica": "Коста-Рика",
		"Croacia": "Хорватия",
		"Cuba": "Куба",
		"Curazao": "Кюрасао",
		"Dinamarca": "Дания",
		"Dominica": "Доминика",
		"Ecuador": "Эквадор",
		"Egipto": "Египет",
		"El Salvador": "Сальвадор",
		"Emiratos Árabes": "ОАЭ",
		"Eritrea": "Эритрея",
		"Escocia": "Шотландия",
		"Eslovaquia": "Словакия",
		"Eslovenia": "Словения",
		"España": "Испания",
		"Estados Unidos": "США",
		"Estonia": "Эстония",
		"Esuatini": "Эсватини",
		"Etiopía": "Эфиопия",
		"Filipinas": "Филиппины",
		"Finlandia": "Финляндия",
		"Fiyi": "Фиджи",
		"Francia": "Франция",
		"Gabón": "Габон",
		"Gales": "Уэльс",
		"Gambia": "Гамбия",
		"Georgia": "Грузия",
		"Ghana": "Гана",
		"Gibraltar": "Гибралтар",
		"Granada": "Гренада",
		"Grecia": "Греция",
		"Guam": "Гуам",
		"Guatemala": "Гватемала",
		"Guinea": "Гвинея",
		"Guinea Ecuatorial": "Экваториальная Гвинея",
		"Guinea-Bisáu": "Гвинея-Бисау",
		"Guyana": "Гайана",
		"Haití": "Гаити",
		"Honduras": "Гондурас",
		"Hong Kong": "Гонконг",
		"Hungría": "Венгрия",
		"India": "Индия",
		"Indonesia": "Индонезия",
		"Inglaterra": "Англия",
		"Irak": "Ирак",
		"Irlanda": "Ирландия",
		"Irlanda del Norte": "Северная Ирландия",
		"Irán": "Иран",
		"Islandia": "Исландия",
		"Islas Caimán": "Каймановы острова",
		"Islas Cook": "Острова Кука",
		"Islas Feroe": "Фарерские острова",
		"Islas Marianas del Norte": "Северные Марианские острова",
		"Islas Salomón": "Соломоновы острова",
		"Islas Turcas y Caicos": "Теркс и Кайкос",
		"Islas Vírgenes Británicas": "Британские Виргинские острова",
		"Islas Vírgenes de EE.UU.": "Американские Виргинские острова",
		"Israel": "Израиль",
		"Italia": "Италия",
		"Jamaica": "Ямайка",
		"Japón": "Япония",
		"Jordania": "Иордания",
		"Kazajistán": "Казахстан",
		"Kenia": "Кения",
		"Kirguistán": "Киргизия",
		"Kosovo": "Косово",
		"Kuwait": "Кувейт",
		"Laos": "Лаос",
		"Lesoto": "Лесото",
		"Letonia": "Латвия",
		"Liberia": "Либерия",
		"Libia": "Ливия",
		"Liechtenstein": "Лихтенштейн",
		"Lituania": "Литва",
		"Luxemburgo": "Люксембург",
		"Líbano": "Ливан",
		"Macao": "Макао",
		"Macedonia del Norte": "Северная Македония",
		"Madagascar": "Мадагаскар",
		"Malasia": "Малайзия",
		"Malaui": "Малави",
		"Maldivas": "Мальдивы",
		"Malta": "Мальта",
		"Malí": "Мали",
		"Marruecos": "Марокко",
		"Mauricio": "Маврикий",
		"Mauritania": "Мавритания",
		"Moldova": "Молдова",
		"Mongolia": "Монголия",
		"Montenegro": "Черногория",
		"Montserrat": "Монтсеррат",
		"Mozambique": "Мозамбик",
		"Myanmar": "Мьянма",
		"México": "Мексика",
		"Namibia": "Намибия",
		"Nepal": "Непал",
		"Nicaragua": "Никарагуа",
		"Nigeria": "Нигерия",
		"Noruega": "Норвегия",
		"Nueva Caledonia": "Новая Каледония",
		"Nueva Zelanda": "Новая Зеландия",
		"Níger": "Нигер",
		"Omán": "Оман",
		"Pakistán": "Пакистан",
		"Palestina": "Палестина",
		"Panamá": "Панама",
		"Papúa Nueva Guinea": "Папуа — Новая Гвинея",
		"Paraguay": "Парагвай",
		"Países Bajos": "Нидерланды",
		"Perú": "Перу",
		"Polonia": "Польша",
		"Portugal": "Португалия",
		"Puerto Rico": "Пуэрто-Рико",
		"RD Congo": "ДР Конго",
		"República Centroafricana": "ЦАР",
		"República Dominicana": "Доминиканская Республика",
		"Ruanda": "Руанда",
		"Rumanía": "Румыния",
		"Rusia": "Россия",
		"Samoa": "Самоа",
		"Samoa Americana": "Американское Самоа",
		"San Cristóbal y Nieves": "Сент-Китс и Невис",
		"San Marino": "Сан-Марино",
		"San Vicente y las Granadinas": "Сент-Винсент и Гренадины",
		"Santa Lucía": "Сент-Люсия",
		"Santo Tomé y Príncipe": "Сан-Томе и Принсипи",
		"Senegal": "Сенегал",
		"Serbia": "Сербия",
		"Seychelles": "Сейшелы",
		"Sierra Leona": "Сьерра-Леоне",
		"Singapur": "Сингапур",
		"Siria": "Сирия",
		"Somalia": "Сомали",
		"Sri Lanka": "Шри-Ланка",
		"Sudáfrica": "ЮАР",
		"Sudán": "Судан",
		"Sudán del Sur": "Южный Судан",
		"Suecia": "Швеция",
		"Suiza": "Швейцария",
		"Surinam": "Суринам",
		"Tahití": "Таити",
		"Tailandia": "Таиланд",
		"Tanzania": "Танзания",
		"Tayikistán": "Таджикистан",
		"Timor Oriental": "Восточный Тимор",
		"Togo": "Того",
		"Tonga": "Тонга",
		"Trinidad y Tobago": "Тринидад и Тобаго",
		"Turkmenistán": "Туркменистан",
		"Turquía": "Турция",
		"Túnez": "Тунис",
		"Ucrania": "Украина",
		"Uganda": "Уганда",
		"Uruguay": "Уругвай",
		"Uzbekistán": "Узбекистан",
		"Vanuatu": "Вануату",
		"Venezuela": "Венесуэла",
		"Vietnam": "Вьетнам",
		"Yemen": "Йемен",
		"Yibuti": "Джибути",
		"Zambia": "Замбия",
		"Zimbabue": "Зимбабве",
	},

	"herencia": {
		"ESTRELLAS": "ЗВЕЗДЫ",
		"KITS": "СЕТЫ",
		"VENTAJAS": "ПЕРКИ",
		"COMPRAR": "КУПИТЬ",
		"ABIERTA": "ОТКРЫТО",
		"EL ALTA": "НОВАЯ ИГРА",
		"DE SALIDA": "НА СТАРТЕ",
		"DE TU HERENCIA": "ИЗ НАСЛЕДСТВА",
		"SOLAR": "УЧАСТОК",
		"TE ALCANZA": "ХВАТАЕТ",
		"TE FALTAN {0} ★": "НУЖНО ЕЩЕ {0} ★",
		"BOTAS DE BARRIO": "ДВОРОВЫЕ БУТСЫ",
		"REFUERZOS": "УСИЛЕНИЯ",
		"Vale en TODAS tus carreras, las de hoy y las que empieces.": "Действует во ВСЕХ твоих карьерах — и в нынешних, и в тех, что начнешь.",
		"Al empezar una carrera las eliges en el paso TUS VENTAJAS.": "Когда начинаешь карьеру, выбираешь их на шаге ТВОИ ПЕРКИ.",
		"Lo que se compra aquí no se gana: se hereda. Cada ventaja entra sola en toda carrera nueva, hoy y siempre.": "Купленное здесь не зарабатывают — его наследуют. Каждый перк сам попадает в любую новую карьеру — сегодня и всегда.",
		"En tu herencia: entra en toda carrera nueva.": "В твоем наследстве: попадает в любую новую карьеру.",
		"Abierta por TODAS LAS VENTAJAS: en tu herencia, en toda carrera nueva.": "Открыто паком ВСЕ ПЕРКИ: в твоем наследстве, в любой новой карьере.",
		"Estrellas y la vitrina entera, con dinero real. Son de tu cuenta, no de una carrera: sobreviven a borrar ranuras.": "Звезды и вся витрина перков — за реальные деньги. Они привязаны к аккаунту, а не к карьере: переживут удаление слотов.",
		"Elige una pieza. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "Выбери предмет. Все, что купишь здесь, будет с тобой в каждой карьере — и в нынешней, и в будущих.",
		"Desde hoy va contigo en cada carrera, las de ahora y las que vengan. No se devuelve.": "С сегодняшнего дня это с тобой в каждой карьере — и в нынешних, и в будущих. Возврата нет.",
		"La vitrina entera, en tu herencia: las veinticuatro en toda carrera nueva.": "Вся витрина перков в твоем наследстве: все двадцать четыре — в любой новой карьере.",
		"Ciento cincuenta estrellas: tu primera ventaja, la de nivel 1, sin esperar al primer retiro.": "Сто пятьдесят звезд: твой первый перк 1-го уровня, не дожидаясь первого завершения карьеры.",
		"Toca una con cadenas y cómprala aquí mismo, con estrellas o con dinero real. Son tuyas para siempre: cada una entra sola en toda carrera nueva.": "Нажми на перк в цепях и купи его прямо здесь — за звезды или реальные деньги. Они твои навсегда: каждый сам попадает в любую новую карьеру.",
		"Consigue más en LEGADO, desde el menú.": "Больше звезд — в разделе НАСЛЕДИЕ главного меню.",
		"CANTERA DE ORO": "ЗОЛОТАЯ АКАДЕМИЯ",
		"Toda carrera nueva arranca con 65 en las ocho habilidades en vez de 60. Es un año de entrenamiento antes de debutar.": "Каждая новая карьера начинается с 65 во всех восьми навыках вместо 60. Это год тренировок до дебюта.",
		"LA CARTERA DEL ABUELO": "ДЕДУШКИН КОШЕЛЕК",
		"Diez mil de salida en toda carrera nueva, encima de los cinco mil de siempre. Para no vivir al día el primer año.": "Десять тысяч на старте каждой новой карьеры сверх обычных пяти тысяч. Чтобы первый год не жить от зарплаты до зарплаты.",
		"UN AGENTE QUE TE CONOCE": "АГЕНТ, ЧТО ТЕБЯ ЗНАЕТ",
		"EL SOLAR DE LA FAMILIA": "СЕМЕЙНЫЙ УЧАСТОК",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} compradas · {3} gastadas": "Звезды даются за каждое достижение и каждое завершение карьеры: {0} за достижения · {1} за завершения · {2} куплено · {3} потрачено",
		"No marca ningún logro: LOGROS y Game Center siguen contando sólo lo jugado.": "Не открывает ни одного достижения: НАГРАДЫ и Game Center по-прежнему учитывают только сыгранное.",
		"Pagas {0} ★ · te quedan {1} ★": "Платишь {0} ★ · остается {1} ★",
		"Este retiro deja {0} ★ en tu herencia · {1} ★ por gastar en el menú": "Это завершение карьеры оставляет {0} ★ в наследстве · {1} ★ можно потратить в меню",
		"Ventajas abiertas para tu próxima carrera: {0} de {1}": "Перки, открытые для следующей карьеры: {0} из {1}",
		"Toda carrera nueva arranca con unas BARRIO 90 nuevas puestas en vez de las de cantera. Se gastan, como todas.": "Каждая новая карьера начинается в новеньких BARRIO 90 вместо бутс из академии. Они изнашиваются, как и любые другие.",
		"Tu agente empieza cada carrera creyendo en ti: llamadas y encargos desde el primer mes, no a media carrera.": "Твой агент в каждой карьере сразу верит в тебя: звонки и поручения с первого месяца, а не к середине карьеры.",
		"Un terreno donde construir, en toda carrera nueva. El terreno sin la casa: lo que levantes encima lo pagas tú.": "Участок под стройку в каждой новой карьере. Земля без дома: все, что построишь на ней, оплачиваешь сам.",
		"CONSEGUIR ESTRELLAS": "ПОЛУЧИТЬ ЗВЕЗДЫ",
		"UN PUÑADO DE ESTRELLAS": "ГОРСТЬ ЗВЕЗД",
		"REINICIAR PARTIDO": "ПЕРЕИГРАТЬ МАТЧ",
		"YA PAGADO": "УЖЕ ОПЛАЧЕНО",
		"La App Store no ha devuelto la ficha. Entra con conexión y vuelve a probar.": "App Store не вернул данные товара. Подключись к интернету и попробуй снова.",
		"BRONCE": "БРОНЗА",
		"PLATA": "СЕРЕБРО",
		"DIAMANTE": "АЛМАЗ",
		"BUEN TOQUE": "ПОДКРУТКА",
		"Le pegas con rosca desde niño: +4 de efecto desde el debut.": "Ты с детства закручиваешь мяч: +4 к подкрутке с дебюта.",
		"PULMONES": "ЛЕГКИЕ",
		"Ibas corriendo al colegio y de vuelta: +4 de físico desde el debut.": "Ты бегом бегал в школу и обратно: +4 к физике с дебюта.",
		"LOS AHORROS": "СБЕРЕЖЕНИЯ",
		"La familia guardó para tu debut: veinticinco mil de salida en toda carrera nueva.": "Семья копила на твой дебют: двадцать пять тысяч на старте каждой новой карьеры.",
		"El vestuario te sigue antes de que abras la boca: el equipo nunca por debajo de 55.": "Раздевалка идет за тобой, еще до того как ты откроешь рот: команда никогда не ниже 55.",
		"EL CEREBRO": "ПЛЕЙМЕЙКЕР",
		"Ves la jugada antes que nadie: +6 de visión y +3 de precisión y efecto.": "Ты видишь момент раньше всех: +6 к видению поля и +3 к точности и подкрутке.",
		"EL RELOJ DEL ABUELO": "ДЕДУШКИНЫ ЧАСЫ",
		"Un reloj de lujo que ya era de la familia: la prensa te mira distinto desde el primer día.": "Роскошные часы, которые давно хранятся в семье: пресса с первого дня смотрит на тебя иначе.",
		"SUPERDOTADO": "ВУНДЕРКИНД",
		"Naciste para esto: 8 puntos de habilidad por repartir antes de debutar.": "Ты рожден для этого: 8 очков навыков на распределение до дебюта.",
		"LA FORTUNA FAMILIAR": "СЕМЕЙНОЕ СОСТОЯНИЕ",
		"Doscientos cincuenta mil de salida en toda carrera nueva. Nunca vas a vivir al día.": "Двести пятьдесят тысяч на старте каждой новой карьеры. Жить от зарплаты до зарплаты не придется никогда.",
		"La vitrina entera, en tu herencia: todas en toda carrera nueva.": "Вся витрина перков в твоем наследстве: все до единого — в любой новой карьере.",

		"BAJO LOS FOCOS": "В СВЕТЕ СОФИТОВ",
		"CON PADRINO": "СО СВЯЗЯМИ",
		"LA DINASTIA": "ДИНАСТИЯ",
		"CUERPO DE ATLETA": "ТЕЛО АТЛЕТА",
		"PURO TALENTO": "ЧИСТЫЙ ТАЛАНТ",
		"Llegas ya famoso: la grada te corea, la prensa te sigue y el seleccionador sabe tu nombre.": "Ты приходишь уже знаменитым: трибуны скандируют твое имя, пресса ходит по пятам, а тренер сборной знает, кто ты.",
		"Tu agente contesta, el vestuario te respeta y firmas el debut un rol más arriba.": "Агент берет трубку, раздевалка тебя уважает, а первый контракт ты подписываешь на роль выше.",
		"Naces con herencia: un cuarto de millón en el banco, el terreno del abuelo y la casa del viejo.": "Ты родился в богатой семье: четверть миллиона в банке, дедушкин участок и отцовский дом.",
		"Un cuerpo que no se rompe: piernas de niño, 20 % menos lesiones y fisio gratis toda la carrera.": "Тело, которое не ломается: молодые ноги, на 20 % меньше травм и бесплатный физиотерапевт всю карьеру.",
		"Naces crack: 65 en todo, ocho puntos por repartir y un disparo que asusta desde el primer partido.": "Ты рожден звездой: 65 во всем, восемь очков на распределение и удар, который пугает с первого же матча.",
		"PACKS": "ПАКИ",
		"COMPRAR PACK": "КУПИТЬ ПАК",
		"TAMBIÉN TUYAS": "ТОЖЕ ТВОИ",
		"Cinco packs de tres ventajas. Cada una entra sola en toda carrera nueva, hoy y siempre.": "Пять паков по три перка. Каждый перк сам попадает в любую новую карьеру — сегодня и всегда.",
		"En tu herencia: sus tres ventajas entran en toda carrera nueva.": "В твоем наследстве: три его перка попадают в любую новую карьеру.",
		"YA TIENES {0} DE 3: con estrellas pagas sólo lo que te falta.": "У ТЕБЯ {0} ИЗ 3: звездами платишь только за недостающие.",
		"Y {0} ventajas sueltas de antes, tuyas: entran igual en cada carrera.": "И твои прежние отдельные перки: {0}. Они так же попадают в каждую карьеру.",
		"Elige un pack. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "Выбери пак. Все, что купишь здесь, будет с тобой в каждой карьере — и в нынешней, и в будущих.",
		"Toca una con cadenas y compra su pack aquí mismo, con estrellas o con dinero real. Es tuyo para siempre: sus tres ventajas entran solas en toda carrera nueva.": "Нажми на перк в цепях и купи его пак прямо здесь — за звезды или реальные деньги. Он твой навсегда: три его перка сами попадают в любую новую карьеру.",
		"Las estrellas se ganan jugando: con cada logro y con cada retiro.": "Звезды зарабатываются игрой: за каждое достижение и каждое завершение карьеры.",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} gastadas": "Даются за каждое достижение и каждое завершение карьеры: {0} за достижения · {1} за завершения · {2} потрачено",

		"¡DOBLETE DE {0}!": "{0} ДЕЛАЕТ ДУБЛЬ!",
		"¡TERCERO DE {0}: HAT-TRICK!": "{0} СНОВА: ХЕТ-ТРИК!",
		"¡CUATRO DE {0}! SÚPER HAT-TRICK": "{0} — ЧЕТЫРЕ ГОЛА! ПОКЕР",
		"¡CINCO DE {0}! LA MANITA": "{0} — ПЯТЬ ГОЛОВ! НЕУДЕРЖИМ",
		"¡{1} GOLES DE {0}! DE LEYENDA": "{0} — ГОЛОВ: {1}! ЛЕГЕНДА",
		"¡OTRA ASISTENCIA DE {0}! VAN DOS": "ЕЩЕ АССИСТ: {0}! УЖЕ ДВА",
		"¡TERCERA ASISTENCIA DE {0}!": "ТРЕТИЙ АССИСТ: {0}!",
		"¡{1} ASISTENCIAS DE {0}!": "{0} — АССИСТОВ: {1}!",
		"{0} YA LLEVA TRES PARADAS": "{0}: УЖЕ ТРИ СЕЙВА",
		"¡CINCO PARADAS DE {0}!": "{0} — ПЯТЬ СЕЙВОВ!",
		"¡{1} PARADAS! {0} ES UN MURO": "СЕЙВОВ: {1}! {0} — СТЕНА",
		"{0} YA TENÍA AMARILLA ({1}')": "{0}: УЖЕ БЫЛА ЖЕЛТАЯ ({1}')",
		"¡OTRA ROJA! TU EQUIPO SE QUEDA CON NUEVE": "ЕЩЕ КРАСНАЯ! ТВОЯ КОМАНДА ВДЕВЯТЕРОМ",
		"¡OTRA ROJA! EL RIVAL SE QUEDA CON NUEVE": "ЕЩЕ КРАСНАЯ! СОПЕРНИК ВДЕВЯТЕРОМ",
		"YA SON TRES AMARILLAS DE TU EQUIPO": "У ТВОЕЙ КОМАНДЫ УЖЕ ТРИ ЖЕЛТЫХ",
		"YA SON TRES AMARILLAS DEL RIVAL": "У СОПЕРНИКА УЖЕ ТРИ ЖЕЛТЫХ",
		"¡CINCO AMARILLAS DE TU EQUIPO!": "ПЯТЬ ЖЕЛТЫХ У ТВОЕЙ КОМАНДЫ!",
		"¡CINCO AMARILLAS DEL RIVAL!": "ПЯТЬ ЖЕЛТЫХ У СОПЕРНИКА!",
	},

	"salon_fama": {
		"SALÓN DE LA FAMA": "ЗАЛ СЛАВЫ",
		"ESPERAN SU PLACA": "ЖДУТ ТАБЛИЧКУ",
		"TUS LEYENDAS": "ТВОИ ЛЕГЕНДЫ",
		"Aún no hay placas. Cuando una carrera se retire, cuelga aquí su placa: su ranura queda libre para empezar otra y su historia se queda en este salón.": "Табличек пока нет. Когда карьера завершится, повесь здесь ее табличку: слот освободится для новой карьеры, а ее история останется в этом зале.",
		"RANURA {0} · RETIRADO": "СЛОТ {0} · ЗАВЕРШЕНА",
		"Antes de colgarla, termina su despedida: entra en su carrera desde el menú.": "Прежде чем повесить табличку, доведи до конца прощание: открой эту карьеру из меню.",
		"COLGAR SU PLACA": "ПОВЕСИТЬ ТАБЛИЧКУ",
		"¿COLGAR SU PLACA?": "ПОВЕСИТЬ ТАБЛИЧКУ?",
		"La carrera de {0} sale de la RANURA {1} y se queda en el SALÓN DE LA FAMA. La ranura queda libre para empezar otra.": "Карьера {0} покидает СЛОТ {1} и остается в ЗАЛЕ СЛАВЫ. Слот освобождается для новой карьеры.",
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida y su museo se borran. Esto no se puede deshacer.": "В зале останется табличка: цифры, трофеи и клубы. Сохранение и его музей будут удалены. Это нельзя отменить.",
		"No se pudo. La carrera sigue donde estaba.": "Не получилось. Карьера осталась на месте.",
		"COLGAR MI PLACA": "ПОВЕСИТЬ ТАБЛИЧКУ",
		"Pieza de Museo": "Музейный экспонат",
		"Entrar por primera vez al museo de tu carrera.": "Впервые зайти в музей своей карьеры.",
	},

	"casa_legado": {
		"MESA DE PING-PONG": "ТЕННИСНЫЙ СТОЛ",
		"VITRINA DEL CAPITÁN": "КАПИТАНСКАЯ ВИТРИНА",
		"POSADERO PARA LORO": "ЖЕРДЬ ДЛЯ ПОПУГАЯ",
		"Mesa con red y palas. Juega al ping-pong contra un rival.": "Стол с сеткой и ракетками. Сыграй в пинг-понг с соперником.",
		"Tu capitanía bajo cristal. Conserva los nombramientos ganados.": "Твоя капитанская повязка под стеклом. Здесь хранятся все заслуженные назначения.",
		"Rama de madera con agua y semillas. Tu loro descansa aquí.": "Деревянная ветка с водой и семечками. Здесь отдыхает твой попугай.",
		"JUGAR PING-PONG": "СЫГРАТЬ ПАРТИЮ",
		"VER BRAZALETES": "ПОВЯЗКИ",
		"TUS BRAZALETES": "ТВОИ ПОВЯЗКИ",
		"El nombramiento se gana jugando. La vitrina conserva tus brazaletes.": "Назначение зарабатывают игрой. Витрина хранит твои повязки.",
		"Tu primer brazalete aparecerá cuando te nombren capitán.": "Первая повязка появится, когда тебя назначат капитаном.",
		"CAPITÁN DE LA SELECCIÓN": "КАПИТАН СБОРНОЙ",
		"CAPITÁN DEL CLUB": "КАПИТАН КЛУБА",
		"REGISTRADO EN LA TEMPORADA {0}": "ЗАПИСАНО В СЕЗОНЕ {0}",
		"Esta partida ya tenía la capitanía. Se conserva la vigente, sin inventar fechas anteriores.": "В этом сохранении уже было капитанство. Оставлено текущее, без выдуманных прошлых дат.",
		"PING-PONG": "ПИНГ-ПОНГ",
		"A 11 puntos, con ventaja de 2. Punto decisivo en 20-20.": "До 11 очков, отрыв в 2. При 20–20 — решающее очко.",
		"ARRASTRA AQUÍ PARA MOVER LA PALA": "ТЯНИ ТУТ, ЧТОБЫ ДВИГАТЬ РАКЕТКУ",
		"IZQUIERDA": "ВЛЕВО",
		"CENTRO": "ЦЕНТР",
		"DERECHA": "ВПРАВО",
		"Mueve la pala con el dedo. El golpe es automático.": "Двигай ракетку пальцем. Удар — автоматически.",
		"Compra la mesa de ping-pong para jugar.": "Купи теннисный стол, чтобы играть.",
		"Elige dónde devolver: izquierda, centro o derecha.": "Выбери, куда отбить: влево, в центр или вправо.",
		"GANÓ EL RIVAL": "ПОРАЖЕНИЕ",
		"REVANCHA": "РЕВАНШ",
		"TU SAQUE": "ТЫ ПОДАЕШЬ",
		"SAQUE RIVAL": "ПОДАЕТ СОПЕРНИК",
		"SACAR": "ПОДАТЬ",
		"PUNTO PARA TI": "ОЧКО ТЕБЕ",
		"PUNTO PARA EL RIVAL": "ОЧКО СОПЕРНИКУ",
		"DEVOLUCIONES: {0}": "ОТБИТО: {0}",
		"AHORA ENFRENTE": "ТЕПЕРЬ СОПЕРНИК",
		"AHORA JUEGA EN {0}": "ТЕПЕРЬ В КЛУБЕ {0}",
		"DEBUTA": "ДЕБЮТ",
		"EL DEBUT DEL CHAVAL": "ДЕБЮТ МАЛЬЧИШКИ",
		"EL QUE SE FUE": "ТОТ, КТО УШЕЛ",
		"FICHA POR {0}": "УХОДИТ В {0}",
		"FIRMA SU PLAYERA": "ПОДПИСАТЬ ФУТБОЛКУ",
		"Firmó su primer contrato. Quiso que estuvieras tú a su lado.": "Он подписал первый контракт. И хотел, чтобы ты был рядом.",
		"Hoy entra por primera vez. Tú te acuerdas de lo que se siente.": "Сегодня он впервые выходит на поле. Ты помнишь, каково это.",
		"LA CANTERA": "АКАДЕМИЯ",
		"LLEGA DE LA CANTERA": "ИЗ АКАДЕМИИ",
		"La encontró colgada en su taquilla. No hizo falta decir nada.": "Он нашел ее в своем шкафчике. Слова были не нужны.",
		"Lo viste debutar a tu lado. Hoy te va a tocar marcarlo.": "Он дебютировал рядом с тобой. Сегодня тебе его держать.",
		"Lo viste debutar. Ahora lo cuentan en la tele del bar.": "Ты видел его дебют. Теперь о нем говорят по телику в баре.",
		"PRIMER CONTRATO": "ПЕРВЫЙ КОНТРАКТ",
		"PRIMER CONTRATO PROFESIONAL": "ПЕРВЫЙ ПРОФ. КОНТРАКТ",
		"Podía correr a la grada. Corrió hacia ti.": "Он мог побежать к трибунам. А побежал к тебе.",
		"SU PRIMER CONTRATO": "ЕГО ПЕРВЫЙ КОНТРАКТ",
		"SU PRIMER GOL": "ЕГО ПЕРВЫЙ ГОЛ",
		"Se quedó con la playera en blanco en las manos. No dijo nada.": "Он так и остался стоять с неподписанной футболкой в руках. Не сказал ни слова.",
		"TU DORSAL ES SUYO": "ТВОЙ НОМЕР — ЕГО",
		"{0} AÑOS · CANTERA": "ВОЗР. {0} · АКАДЕМИЯ",
		"{0} AÑOS · PRIMER GOL": "ВОЗР. {0} · ПЕРВЫЙ ГОЛ",
		"{0} AÑOS · PRIMER PARTIDO": "ВОЗР. {0} · ПЕРВЫЙ МАТЧ",
		"«Mi sueño es jugar junto a ti pronto.»": "«Моя мечта — поскорее сыграть рядом с тобой»",
		"«Mi sueño es jugar junto a ti pronto.» Ya está aquí.": "«Моя мечта — поскорее сыграть рядом с тобой». И вот он здесь.",
		"—¿Me firmas la playera?": "— Распишешься на моей футболке?",
		"PRESENTADO": "ПРЕДСТАВЛЕН",
		"Tu ahijado ya tiene dorsal. Esta temporada jugáis juntos.": "У твоего крестника уже есть номер. В этом сезоне вы играете вместе.",
		"DESPUÉS DEL ENTRENO": "ПОСЛЕ ТРЕНИРОВКИ",
		"—Me quedé para verte. ¿Me enseñas a pegarle como tú?": "— Я остался посмотреть на тебя. Научишь бить, как ты?",
		"IRTE": "УЙТИ",
		"UNA HORA MÁS": "ЕЩЕ ЧАСОК",
		"Se fue a casa ya de noche, con el balón bajo el brazo.": "Он ушел домой уже затемно, с мячом под мышкой.",
		"Recogió el balón y se quedó tirando solo.": "Он подобрал мяч и продолжил бить по воротам один.",
		"SU PADRINO": "ЕГО КРЕСТНЫЙ",
		"SUBE AL PRIMER EQUIPO": "ПЕРЕВОД В ПЕРВУЮ КОМАНДУ",
		"—Lo subimos contigo. ¿Quieres ser su padrino?": "— Мы переводим его вместе с тобой. Станешь его крестным?",
		"TU AHIJADO": "КРЕСТНИК",
		"La temporada que viene, jugará a tu lado.": "В следующем сезоне он будет играть рядом с тобой.",
		"SIGUE EN LA CANTERA": "ОСТАЕТСЯ В АКАДЕМИИ",
		"El director asintió. El niño miró al suelo.": "Директор кивнул. Мальчик опустил глаза.",
		"El Ahijado": "Крестник",
		"Apadrinar a un niño de la cantera hasta el primer equipo.": "Взять под крыло мальчишку из академии и довести его до первой команды.",
		"VER SALÓN": "ЗАЛ СЛАВЫ",
		"ESCALÓN": "УРОВЕНЬ",
		"AQUÍ EMPEZASTE": "ТУТ ТЫ НАЧИНАЛ",
		"PARED DE REFLEJOS": "СТЕНА РЕАКЦИИ",
		"MEMORAMA": "МЕМОРИ",
		"JUGAR REFLEJOS": "ИГРАТЬ В РЕАКЦИЮ",
		"JUGAR MEMORAMA": "ИГРАТЬ В МЕМОРИ",
		"¡RÉCORD!": "РЕКОРД!",
		"ANTES {0}": "БЫЛО {0}",
		"RÉCORD {0}": "РЕКОРД {0}",
		"RÉCORDS · {0}": "РЕКОРДЫ · {0}",
		"MS": "МС",
		"NO TOQUES": "НЕ ЖМИ",
		"TOCA": "ЖМИ",
		"REFLEJO": "РЕАКЦИЯ",
		"TIEMPO": "ВРЕМЯ",
		"COMPLETADO": "ГОТОВО",
		"MEMORIZA": "ЗАПОМНИ",
		"MOVIMIENTOS": "ХОДЫ",
		"TU COLECCIÓN": "ТВОЯ КОЛЛЕКЦИЯ",
		"{0} S": "{0} С",
		"memoramaEN JUEGO": "В ИГРЕ",
		"memoramaPAREJAS": "ПАРЫ",
		"reflejosRACHA": "СЕРИЯ",
		"Pared de luces: toca la que se enciende. Récord de reflejos.": "Стена огней: жми на тот, что загорается. Рекорд реакции.",
		"Mesa de cartas con tu colección: encuentra las parejas.": "Стол с картами из твоей коллекции: найди пары.",
	},


	"pique": {
		"CALMA": "СПОКОЙНО",
		"ENCÁRATE": "ОТВЕТЬ",
		"{0} TE BUSCA": "{0} ЛЕЗЕТ К ТЕБЕ",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE ENCARAN": "{0} БЬЕТ СЗАДИ, {1} ИДЕТ НА РАЗБОРКИ",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1}, QUE NO RESPONDE": "{0} БЬЕТ СЗАДИ, {1} НЕ ОТВЕЧАЕТ",
		"notaTEMPLE": "ВЫДЕРЖКА",
		"notaAMARILLA": "ЖЕЛТАЯ",
		"Otra vez le ganas a {0}. Ya no le hace ninguna gracia.": "{0} снова проигрывает тебе. Ему уже совсем не смешно.",
		"{0} ya te tiene entre ceja y ceja.": "{0} уже точит на тебя зуб.",
		"{0} va a por ti, no a por el balón. Patada por detrás.": "{0} охотится за тобой, а не за мячом. Удар сзади.",
		"Ni mira la pelota: {0} te pega por detrás.": "Даже не смотрит на мяч: {0} бьет тебя сзади.",
		"Te levantas y te vas a por {0}. Frente con frente.": "Ты встаешь и идешь прямо к обидчику. Лоб в лоб: ты и {0}.",
		"No te lo callas: cara a cara con {0}, y la grada se enciende.": "Ты не молчишь: лицом к лицу — ты и {0}, а трибуны вскипают.",
		"{0} te busca y no te encuentra. Te das la vuelta.": "{0} провоцирует, но реакции нет. Ты отворачиваешься.",
		"Ni lo miras. {0} se queda con el dedo en el aire.": "Ты на него даже не смотришь. {0} так и остается с поднятым пальцем.",
		"{1} NO LE PIERDE LA PISTA A {0}": "{1} НЕ ОТСТАЕТ: {0} ПОД ПРИСМОТРОМ",
		"{0} SE LE ESCAPA A {1} UNA Y OTRA VEZ": "{1} НЕ ПОСПЕВАЕТ: {0} ВНОВЬ УХОДИТ",
		"AMBIENTE CALDEADO ENTRE {0} Y {1}": "{0} И {1}: СТРАСТИ НАКАЛЯЮТСЯ",
		"CADA BALÓN ENTRE {0} Y {1} ES UNA GUERRA": "{0} И {1}: КАЖДЫЙ МЯЧ — ВОЙНА",
		"{0} NO ENTRA AL TRAPO Y SIGUE A LO SUYO": "{0} НЕ ВЕДЕТСЯ НА ПРОВОКАЦИИ И ИГРАЕТ СВОЕ",
		"{1} BUSCA LA REACCIÓN DE {0} Y NO LA ENCUENTRA": "{1} ПРОВОЦИРУЕТ, НО {0} НЕ РЕАГИРУЕТ",
		"SIN {1} EN EL CAMPO, {0} RESPIRA": "{1} УШЕЛ С ПОЛЯ — {0} ВЫДЫХАЕТ",
		"{1} JUEGA CON LA AMARILLA A CUESTAS": "{1} ИГРАЕТ С ЖЕЛТОЙ",
		"{0} JUEGA AL LÍMITE CON LA AMARILLA": "{0} НА ГРАНИ: УЖЕ ЕСТЬ ЖЕЛТАЯ",
		"Viven en tu casa y cobran cada jornada.": "Живут в твоем доме и получают зарплату каждый тур.",

		"¡Derribaste el dron de la tele!": "Ты сбил телевизионный дрон!",
		"Señal Perdida": "Сигнал потерян",
		"Derribar el dron de la tele de un balonazo.": "Сбить телевизионный дрон ударом мяча.",
		"Algunos partidos los graba un dron desde el cielo.": "Некоторые матчи снимает дрон с высоты.",

		"¡Balón de playa en el área!": "Пляжный мяч в штрафной!",
		"¡Desvío en el balón de playa!": "Рикошет от пляжного мяча!",
		"Gol de Playa": "Пляжный гол",
		"Marcar un gol desviado por el balón de playa.": "Забить гол после рикошета от пляжного мяча.",
		"A veces cae algo inflable desde la grada.": "Иногда с трибуны падает что-то надувное.",

		"¡Le volaste el celular a un fan!": "Ты выбил телефон у болельщика!",
		"¡Tu balonazo se hizo viral!": "Твой выстрел стал вирусным!",
		"REC": "REC",
		"{0} vistas": "Просмотры: {0}",
		"Se Hizo Viral": "Вирусный хит",
		"Tirarle el celular a un fan que te graba.": "Выбить телефон у болельщика, который тебя снимает.",
		"Hay quien graba el partido desde detrás de la valla.": "Кто-то снимает матч из-за ограждения.",
		"Tangana en pleno derbi: {0} te empuja y se forma el corro.": "Стычка посреди дерби: {0} толкает тебя, и вокруг собирается толпа.",
		"Empujones entre los dos equipos. {0} lo empezó y el árbitro tiene que meterse en medio.": "Толкотня между командами. Начал {0}, и судье приходится вставать между ними.",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE MONTA LA TANGANA": "{0} БЬЕТ СЗАДИ, {1} НА ГАЗОНЕ — НАЧИНАЕТСЯ ПОТАСОВКА",
		"LA TANGANA DEJA EL DERBI AL ROJO VIVO": "ПОТАСОВКА РАСКАЛИЛА ДЕРБИ ДОБЕЛА",
		"DESDE LA TANGANA, {1} Y {0} NO SE QUITAN LA VISTA": "ПОСЛЕ ПОТАСОВКИ {1} И {0} НЕ СВОДЯТ ДРУГ С ДРУГА ГЛАЗ",
		"{0} ARRASTRA LA AMARILLA DE LA TANGANA": "{0} С ЖЕЛТОЙ ПОСЛЕ ПОТАСОВКИ",
		"Y en los bares sólo se habla de la tangana.": "А в барах только и разговоров, что о потасовке.",
	},


	"editor_estadio_derbi": {
		"ESTADIO": "СТАДИОН",
		"estadioPLANTA": "СХЕМА",
		"VOLVER AL ESTADIO AUTOMATICO": "СТАДИОН ПО УМОЛЧАНИЮ",
		"El nombre sale en la carátula de TV y en el hub. La planta es la forma de las gradas en el partido.": "Название показывается на телезаставке и в хабе. Схема — это форма трибун в матче.",
		"SIN DERBI": "БЕЗ ДЕРБИ",
		"VOLVER AL DERBI AUTOMATICO": "ДЕРБИ ПО УМОЛЧАНИЮ",
		"Es el partido con más ambiente del año. Tiene que ser del mismo país; puede ser de otra división.": "Самый атмосферный матч года. Соперник должен быть из той же страны; может быть из другой лиги.",
		"ELIGE SU RIVAL DE DERBI": "ВЫБЕРИ СОПЕРНИКА ДЕРБИ",
		"Tiene que ser del mismo país.\nPuede ser de otra división.": "Должен быть из той же страны.\nМожет быть из другой лиги.",
		"DERBI DE: {0}": "ДЕРБИ: {0}",
		"{0} y {1} pasan a ser rivales de derbi.": "{0} и {1} становятся соперниками по дерби.",
		"Los rivales que tenían hasta hoy se quedan sin derbi, y el juego les busca otro.": "Их прежние соперники остаются без дерби, и игра подберет им новых.",
		"AÑADIR OTRO DERBI": "ДОБАВИТЬ ДЕРБИ",
		"Hasta tres rivales; el primero es el derbi principal.": "До трех соперников; первый — главное дерби.",
		"Se suma a los derbis que ya tenían elegidos.": "Добавляется к дерби, которые у них уже выбраны.",
		"Es el partido con más ambiente del año. Puede ser de cualquier confederación; sus otros rivales de siempre se quedan.": "Самый атмосферный матч года. Соперник может быть из любой конфедерации; прежние принципиальные соперники остаются.",
		"Puede ser de cualquier confederación.": "Может быть из любой конфедерации.",
		"El rival que cada una tenía elegido vuelve a los suyos de siempre.": "Соперник, выбранный каждой из сборных, возвращается к своим прежним.",
		"derbi con selección desconocida: {0}": "дерби с неизвестной сборной: {0}",
		"derbi consigo misma: {0}": "дерби с самой собой: {0}",
		"Las carreras ya empezadas lo estrenan al volver a cargar la partida.": "Уже начатые карьеры получат это при следующей загрузке сохранения.",
		"CONFIRMAR DERBI": "ПОДТВЕРДИТЬ ДЕРБИ",
		"· DERBI: {0}": "· ДЕРБИ: {0}",
		"· ESTADIO": "· СТАДИОН",
		"derbi": "дерби",
		"derbis": "дерби",
		"Su estadio y su derbi, también.": "Его стадион и дерби — тоже.",
		"derbi con club desconocido: {0}": "дерби с неизвестным клубом: {0}",
		"demasiados derbis para: {0}": "слишком много дерби у клуба: {0}",
		"derbi entre países distintos: {0}": "дерби между разными странами: {0}",
		"CUENCO CERRADO": "ЗАКРЫТАЯ ЧАША",
		"CUATRO TRIBUNAS": "ЧЕТЫРЕ ТРИБУНЫ",
		"HERRADURA": "ПОДКОВА",
		"TRIBUNA EN L": "ТРИБУНА УГЛОМ",
		"DOS TRIBUNAS": "ДВЕ ТРИБУНЫ",
		"CON PISTA": "С ДОРОЖКОЙ",
		"CUENCO REDONDO": "КРУГЛАЯ ЧАША",
		"COLISEO": "КОЛИЗЕЙ",
		"OCTAGONO": "ОКТАГОН",
		"CATEDRAL": "СОБОР",
		"VELAS": "ПАРУСА",
		"DOS ANILLOS": "ДВА КОЛЬЦА",
		"MEMBRANA": "МЕМБРАНА",
		"TRIBUNA ALTA": "ТРИБУНА-БАШНЯ",
		"CALDERA": "КОТЕЛ",
		"TRIBUNA DOBLE": "ДВА ЯРУСА",
		"TECHO DE TELA": "КРЫША-ТЕНТ",
		"FONDO ALTO": "ТОРЕЦ-СТЕНА",
		"FONDO EN BLOQUES": "ТОРЕЦ БЛОКАМИ",
		"SIN FONDO, ARBOLES": "БЕЗ ТОРЦА, ДЕРЕВЬЯ",
		"TECHO A DOS AGUAS": "ДВУСКАТНАЯ КРЫША",
		"CAMPO HUNDIDO": "ПОЛЕ В НИЗИНЕ",
		"PANTALLA GIGANTE": "ГИГАНТСКИЙ ЭКРАН",
		"ARCO AL FONDO": "АРКА НАД ТОРЦОМ",
		"TERRAPLEN": "НАСЫПЬ",
		"GRADAS TUBO": "ТРИБУНЫ-ТРУБЫ",
		"MURO DE PIE": "СТОЯЧАЯ СТЕНА",
		"TRES ANILLOS": "ТРИ КОЛЬЦА",
		"FONDO DE BANDERAS": "ТОРЕЦ С ФЛАГАМИ",
		"TRIBUNA CON POSTES": "ТРИБУНА С ОПОРАМИ",
		"TORRE DEL RELOJ": "ЧАСОВАЯ БАШНЯ",
		"CAMPO CON COCHES": "ПОЛЕ С МАШИНАМИ",
		"FONDO DE CHIMENEAS": "ТОРЕЦ С ТРУБАМИ",
		"PIEL ENVOLVENTE": "ОБОЛОЧКА ВОКРУГ",
		"LATERAL PLANO": "ПЛОСКИЙ БОК",
		"ANILLO COLGADO": "ПОДВЕСНОЕ КОЛЬЦО",
		"TECHO DE DIENTES": "ЗУБЧАТАЯ КРЫША",
		"COLUMNATA": "КОЛОННАДА",
		"TECHO FLOTANTE": "ПАРЯЩАЯ КРЫША",
		"TORRES CON RAMPA": "БАШНИ-ПАНДУСЫ",
		"CALABAZA": "ТЫКВА",
		"PUERTA MONUMENTAL": "ПАРАДНЫЕ ВОРОТА",
		"OLA DE VIDRIO": "ВОЛНА СТЕКЛА",
		"OLIMPICO DE PIEDRA": "КАМЕННАЯ АРЕНА",
		"COLOSO": "КОЛОСС",
		"CAJON VERTICAL": "ВЫСОКИЙ КОРОБ",
		"HERRADURA DE TRES PISOS": "ТРЕХЪЯРУСНАЯ ПОДКОВА",
		"TRES GRADAS ABIERTAS": "ТРИ ОТКРЫТЫХ ЯРУСА",

		"TU ESTADO": "ТВОЙ СТАТУС",
		"LO DECIDE LA DIRECTIVA": "РЕШАЕТ РУКОВОДСТВО",
		"SI PAGAN": "ЕСЛИ ЗАПЛАТЯТ",
		"La directiva te bloquea {0} ofertas": "Руководство блокирует предложения по тебе: {0}",
		"Tu club rechaza las ofertas por ti: sólo la cláusula te saca.": "Клуб отклоняет предложения по тебе: уйти можно только через отступные.",
		"Tu club no te retiene.": "Клуб тебя не держит.",
		"Si alguien paga lo que pide tu club, te vende.": "Если кто-то заплатит, сколько просит клуб, тебя продадут.",
		"Hoy tu club no negocia por ti.": "Сейчас клуб не ведет переговоров по тебе.",
		"Tu club te ofrece a quien pregunte.": "Клуб предлагает тебя всем желающим.",
		"No estás en venta.": "Ты не продаешься.",
		"La directiva dijo NO: no cuentas lo bastante. Puedes volver a pedirlo la temporada que viene.": "Руководство сказало НЕТ: ты недостаточно важен для клуба. Можешь попросить снова в следующем сезоне.",
		"PEDIR QUE NO ME VENDAN": "ПОПРОСИТЬ НЕ ПРОДАВАТЬ",
		"¿PEDIR QUE NO TE VENDAN?": "ПОПРОСИТЬ НЕ ПРОДАВАТЬ?",
		"Lo decide la directiva, una vez por temporada. Si dice que sí, rechaza las ofertas por ti este año. La cláusula sigue valiendo.": "Решает руководство, раз в сезон. Если скажет «да», в этом году клуб будет отклонять предложения по тебе. Отступные по-прежнему действуют.",
		"LA DIRECTIVA DICE SÍ": "РУКОВОДСТВО: ДА",
		"LA DIRECTIVA DICE NO": "РУКОВОДСТВО: НЕТ",
		"Pedir el traspaso te pone en venta y te quita minutos hasta que salgas. La cesión, si no eres titular.": "Запрос на трансфер выставляет тебя на продажу и урезает игровое время, пока не уйдешь. Аренда — если ты не игрок основы.",

		"Quiere venir: sale sin cláusula (+{0} %).": "Хочет перейти: уходит без отступных (+{0} %).",

		"TU OFERTA": "ТВОЯ ЦЕНА",
		"OFRECER": "ОТПРАВИТЬ",
		"INTENTOS": "ПОПЫТКИ",
		"PACTADO": "СДЕЛКА",
		"Trato cerrado ({0}). Te queda {1}.": "Сделка заключена ({0}). У тебя остается {1}.",
		"No aceptan. Piden {0}.": "Не согласны. Просят {0}.",

		"NO FIRMAR": "ОТКАЗАТЬ",
		"TE FUISTE SIN FIRMAR": "УШЕЛ, НЕ РАСПИСАВШИСЬ",
		"La valla te vio pasar. Mañana lo contará.": "Люди у ограждения видели, как ты прошел мимо. Завтра расскажут всем.",
		"Cien Firmas": "Сто автографов",
		"Firmar 100 autógrafos.": "Раздать 100 автографов.",
		"Mil Firmas": "Тысяча автографов",
		"Firmar 1.000 autógrafos.": "Раздать 1000 автографов.",
		"La Mano de Oro": "Золотая рука",
		"Firmar 10.000 autógrafos.": "Раздать 10 000 автографов.",
		"UN FAN TE PARA": "ПРОСЬБА ФАНАТА",
		"EN EL AEROPUERTO": "В АЭРОПОРТУ",
		"EN EL TÚNEL": "В ТУННЕЛЕ",
		"EN LA CENA": "ЗА УЖИНОМ",
		"SEMANA DE DERBI": "НЕДЕЛЯ ДЕРБИ",
		"{0} AUTÓGRAFOS EN TU CARRERA": "АВТОГРАФОВ ЗА КАРЬЕРУ: {0}",
		"FIRMA EN LA TERMINAL": "АВТОГРАФ В ТЕРМИНАЛЕ",
		"El grupo esperó un minuto en la puerta de embarque.": "Команда минуту ждала у выхода на посадку.",
		"DIRECTO AL AVIÓN": "СРАЗУ В САМОЛЕТ",
		"Ni lo miraste. El grupo llegó puntual.": "Ты даже не взглянул. Команда прибыла вовремя.",
		"EL NIÑO DEL TÚNEL": "МАЛЬЧИК ИЗ ТУННЕЛЯ",
		"Sale al campo de tu mano con tu firma puesta.": "Он выходит на поле, держа тебя за руку, — с твоим автографом.",
		"LO DEJASTE PLANTADO": "ТЫ ЕГО ПРОДИНАМИЛ",
		"Las cámaras del túnel lo grabaron todo.": "Камеры в туннеле все засняли.",
		"FIRMA EN LA CENA": "АВТОГРАФ ЗА УЖИНОМ",
		"A tu pareja se le enfrió el plato.": "У твоей второй половинки остыл ужин.",
		"ESTA NOCHE NO": "НЕ СЕГОДНЯ",
		"Hoy cenabas con tu pareja. Lo entendió… o casi.": "Сегодня у тебя ужин со второй половинкой. Тебя поняли… почти.",
		"FIRMASTE AL RIVAL": "ФУТБОЛКА СОПЕРНИКА",
		"Tu firma en la camiseta del rival. Mañana sale en portada.": "Твой автограф на футболке соперника. Завтра это на первой полосе.",
		"ESA CAMISETA, NO": "ТОЛЬКО НЕ ЭТУ",
		"Tu grada aplaude que no la firmaras.": "Твои болельщики аплодируют: ты не стал ее подписывать.",
		"EL HINCHA DE SIEMPRE": "ВЕРНЫЙ БОЛЕЛЬЩИК",
		"NO VOLVERÁ": "ОН НЕ ВЕРНЕТСЯ",
		"Le firmaste la primera hace {0} temporadas. Sigue aquí.": "Первый автограф ты дал ему {0} сез. назад. Он все еще здесь.",
		"Ahora trae a su hijo. Hace {0} temporadas, el niño era él.": "Теперь он приводит сына. {0} сез. назад мальчишкой был он сам.",
		"Te esperó {0} temporadas. No volverá a pedírtelo.": "Он ждал тебя {0} сез. Больше не попросит.",
		"EL FOTÓGRAFO": "ФОТОГРАФ",
		"La foto era con {0}. Tú sólo sujetabas el móvil.": "На фото — {0}. А ты только держал телефон.",
	},


	"descanso_pactado": {
		"PEDIR DESCANSO": "ПОПРОСИТЬ ОТДЫХ",
		"EL MÍSTER DICE QUE NO": "ТРЕНЕР ПРОТИВ",
		"Hoy no. Éste es de los que se juegan.": "Сегодня нет. Этот матч — из тех, что играют всерьез.",
		"Hoy te necesito. Este partido pesa demasiado.": "Ты нужен мне сегодня. Этот матч слишком важен.",
		"Aquí juegan los once de siempre. Tú también.": "Здесь играют все основные. И ты тоже.",
		"Contra éste te quiero en el campo. Juegas.": "Против них ты мне нужен на поле. Играешь.",
		"Me lo pides tú y te lo concedo. ¿Banca por si hace falta, descansas del todo, o al final juegas?": "Раз ты просишь — разрешаю. Посидишь на скамейке на всякий случай, отдохнешь полностью или все-таки сыграешь?",
		"¿JUEGAS O DESCANSAS?": "ИГРАТЬ ИЛИ ОТДЫХАТЬ?",
		"EL MÍSTER DECIDE": "РЕШАЕТ ТРЕНЕР",
		"Entonces sales de inicio. Que se note que lo querías.": "Тогда выходишь в стартовом составе. Покажи, что ты этого хотел.",
		"Te quiero fresco, pero a mano. Si se tuerce, entras.": "Ты нужен мне свежим, но под рукой. Если что-то пойдет не так — выходишь.",
		"Descansa. Te quiero entero para lo que viene.": "Отдыхай. Ты нужен мне целым для того, что впереди.",
		"Contra éste no te necesito de inicio y después viene {0}. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "С этими обойдусь без тебя в стартовом составе, а дальше — {0}. Играешь, сидишь на скамейке на всякий случай или отдыхаешь?",
		"Contra éste no te necesito de inicio. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "С этими обойдусь без тебя в стартовом составе. Играешь, сидишь на скамейке на всякий случай или отдыхаешь?",
		"BANCA, POR SI HACE FALTA": "В ЗАПАСЕ, ЕСЛИ ЧТО",
		"DECISIÓN": "РЕШЕНИЕ",
		"EL MÍSTER QUIERE HABLAR CONTIGO": "ТРЕНЕР ХОЧЕТ ПОГОВОРИТЬ",
		"DESCANSAS": "ОТДЫХАЕШЬ",
		"Te quiere entero para el partido grande que viene.": "Тренер хочет, чтобы ты был целым к большому матчу.",
		"Llegas justo de energía. Hoy no te vistes.": "У тебя на исходе энергия. Сегодня ты не в заявке.",
		"Contra este rival te guarda. Si el partido se tuerce, entras.": "Против этого соперника тебя берегут. Если матч пойдет не так — выходишь.",
		"DESPUÉS": "ДАЛЕЕ",
		"EL MÍSTER TE GUARDA": "ТРЕНЕР ТЕБЯ БЕРЕЖЕТ",
		"Hoy el partido no se juega nada. Sólo entras si se lesiona un compañero.": "Сегодня матч ничего не решает. Выйдешь, только если травмируется партнер.",
		"Se mira el global de la eliminatoria.": "Учитывается счет по сумме двух матчей.",
		"Si el partido se tuerce, el míster te llama.": "Если матч пойдет не так, тренер тебя позовет.",
		"PERDIENDO": "УСТУПАЕМ",
		"EMPATANDO": "НИЧЬЯ",
		"GANANDO POR 1": "ВЕДЕМ В 1 МЯЧ",
		"LO VES DESDE CASA": "СМОТРИШЬ ДОМА",
		"Ganaron sin ti. Llegas entero a lo que viene.": "Победили без тебя. Ты свеж к тому, что впереди.",
		"Empate sin ti. La prensa pregunta dónde estabas.": "Ничья без тебя. Пресса спрашивает, где ты был.",
		"Perdieron sin ti. La prensa pregunta dónde estabas.": "Проиграли без тебя. Пресса спрашивает, где ты был.",
		"DÍA LIBRE · LO VES DESDE CASA": "ВЫХОДНОЙ · СМОТРИШЬ ДОМА",
		"EL MÍSTER NO TE NECESITA HOY · TE QUEDAS EN LA BANCA": "СЕГОДНЯ ТЫ НЕ НУЖЕН ТРЕНЕРУ · ТЫ В ЗАПАСЕ",
		"JUEGAS O DESCANSAS": "ИГРА ИЛИ ОТДЫХ",
		"POR SI HACE FALTA": "НА ВСЯКИЙ СЛУЧАЙ",
		"DIA LIBRE": "ВЫХОДНОЙ",

		"CLASIFICADOS": "ПРОШЛИ",
		"ELIMINADOS": "ВЫБЫЛИ",
		"AL {0}": "{0}: ЕДЕМ!",
		"SIN {0}": "{0}: МИМО",
		"FUERA DEL TORNEO": "ВЫЛЕТ ИЗ ТУРНИРА",
		"Un país entero lo celebra contigo.": "Вся страна празднует вместе с тобой.",
		"Un país entero apagó la tele.": "Вся страна выключила телевизор.",
	},

	"banca_juego": {
		"CHIN CHAN PU": "КАМЕНЬ-НОЖНИЦЫ-БУМАГА",
		"BOTELLA DE PIE": "ФЛИП БУТЫЛКИ",
		"DOMINADAS": "ЧЕКАНКА",
		"CONTRA {0}": "ПРОТИВ: {0}",
		"TU COMPAÑERO": "ТВОЙ ПАРТНЕР",
		"¡ELIGE!": "ВЫБИРАЙ!",
		"CHIN": "ЦУ",
		"CHAN": "Е",
		"¡PU!": "ФА!",
		"¡TUYA!": "ТВОЯ!",
		"¡SUYA!": "ЕГО!",
		"¡OTRA!": "ЕЩЕ!",
		"¡LANZA!": "КИДАЙ!",
		"SU TURNO": "ЕГО ХОД",
		"¡DE PIE!": "СТОИТ!",
		"¡SE CAE!": "ПАДАЕТ!",
		"¡TOCA!": "ЖМИ!",
		"¡GANASTE!": "ПОБЕДА!",
		"Hoy recoge él los conos.": "Сегодня конусы собирает он.",
		"Hoy recoges tú los conos.": "Сегодня конусы собираешь ты.",
		"Los conos, a medias.": "Конусы — пополам.",
		"CREAR LIGA": "СОЗДАТЬ ЛИГУ",
		"UNIRSE": "ВСТУПИТЬ",
		"UNIRSE A UNA LIGA": "ВСТУПИТЬ В ЛИГУ",
		"TERMINADA": "ЗАВЕРШЕНА",
		"{0} D": "{0} Д",
		"LIGA NO ENCONTRADA": "ЛИГА НЕ НАЙДЕНА",
		"LIGA LLENA": "МЕСТ НЕТ",
		"DEMASIADAS LIGAS": "ЛИМИТ ЛИГ",
		"Crea una liga y pasa su código: 28 días, gana quien más sume.": "Создай лигу и поделись ее кодом: 28 дней, побеждает тот, кто наберет больше всех.",
		"Únete a mi liga de Football Legacy: código {0}": "Вступай в мою лигу в Football Legacy: код {0}",
		"Reto de {0}": "{0} бросает тебе вызов",
		"Tienes un reto": "Тебе бросили вызов",
		"Se acaba pronto: juégalo antes de que venza.": "Скоро истекает: сыграй, пока не поздно.",
		"PADRINO": "НАСТАВНИК",
		"Embajador": "Посол",
		"Que 3 amigos que invitaste jueguen 10 partidos.": "Пусть 3 приглашенных тобой друга сыграют по 10 матчей.",
		"Fundador": "Основатель",
		"Que 10 amigos que invitaste jueguen 10 partidos.": "Пусть 10 приглашенных тобой друзей сыграют по 10 матчей.",
		"~{0} BALONES": "МЯЧИ: ~{0}",
		"+{0} SUELDO": "ЗАРПЛАТА +{0}",
		"+1 BALÓN EN CASA": "+1 МЯЧ ДОМА",
		"-1 BALÓN EN CASA": "-1 МЯЧ ДОМА",
		"DESDE CERO": "С НУЛЯ",
		"CON TU CARRERA": "С ТВОЕЙ КАРЬЕРОЙ",
		"Sólo cuenta una carrera que empieces después de crearla.": "Засчитывается только карьера, начатая после создания лиги.",
		"Cuenta lo que sumes desde hoy con tu carrera.": "Засчитывается все, что ты наберешь в своей карьере с сегодняшнего дня.",
		"Empieza una carrera nueva para contar en esta liga.": "Начни новую карьеру, чтобы участвовать в этой лиге.",
		"Podio": "Пьедестал",
		"Acabar entre los 3 primeros de una liga de amigos.": "Финишировать в тройке лучших в лиге друзей.",
		"Campeón de liga": "Чемпион лиги",
		"Ganar una liga de amigos.": "Выиграть лигу друзей.",
		"Tricampeón": "Трехкратный чемпион",
		"Ganar 3 ligas de amigos.": "Выиграть 3 лиги друзей.",
		"OTRA TEMPORADA": "НОВЫЙ СЕЗОН",
		"Liga {0}: último día": "Лига {0}: последний день",
		"Vas {0}º. Aún puedes remontar.": "Твое место: {0}. Еще можно подняться.",
		"Aún puedes sumar antes del final.": "До конца еще можно набрать очки.",

		"PECHO Y VOLEA": "ГРУДЬ И С ЛЕТА",
		"¡CLAVADO!": "В ТОЧКУ!",
		"¡CONTROL!": "ПРИНЯЛ!",
		"¡SE TE ESCAPA!": "МЯЧ УХОДИТ!",
		"¡DESLIZA HACIA ÉL!": "ПРОВЕДИ К НЕМУ!",
		"TOCA EN EL ARO": "НАЖМИ НА КОЛЬЦО",
		"¡AL PIE!": "В НОГУ!",
		"¡CON ROSCA!": "КРУЧЕНЫЙ!",
		"¡CORTO!": "НЕДОЛЕТ!",
		"¡LARGO!": "ПЕРЕЛЕТ!",
		"¡DESVIADO!": "МИМО!",
		"CONTROL Y VOLEA": "ПРИЕМ И С ЛЕТА",
		"¡GLOBO!": "ПАРАШЮТ!",
		"PULSA {0} EN EL ARO": "НАЖМИ {0} НА КОЛЬЦЕ",
		"STICK: APUNTA · {0}: GLOBO": "СТИК: ЦЕЛЬ · {0}: ПАРАШЮТ",
		"EL 1-7": "1:7",
		"Juega con una de las dos selecciones contra la otra.": "Сыграй за одну из двух сборных против другой.",
		"EL TREN": "ПАРОВОЗИК",
		"Un gol en una final: te tiras en plancha y detrás de ti se tiran los cuatro más cerca, uno a uno, cada uno a los pies del de delante.": "Гол в финале: ты ныряешь на живот, а за тобой по одному ныряют четверо ближайших — каждый к ногам того, кто впереди.",
		"EL CORRO": "КРУГ",
		"Con el vestuario a tu lado: tus compañeros te rodean aplaudiendo y tú festejas en medio.": "Раздевалка за тебя горой: партнеры окружают тебя и аплодируют, а ты празднуешь в центре.",
		"LA OREJA": "УХО",
		"Tu grada te está cantando: te giras hacia ella con las manos en las orejas y la grada se viene abajo. Sólo delante de los tuyos.": "Твоя трибуна скандирует твое имя: ты поворачиваешься к ней, приложив ладони к ушам, — и трибуна взрывается. Только перед своими болельщиками.",
		"LA MANO DE DIOS": "РУКА БОГА",
		"EL GOL FANTASMA": "ГОЛ-ПРИЗРАК",
		"LA MANO EN LA LÍNEA": "РУКА НА ЛИНИИ",
		"EL PENAL AL CIELO": "ПЕНАЛЬТИ В НЕБО",
		"EL MINUTO 116": "116-Я МИНУТА",
		"FUE CON LA MANO": "ИГРА РУКОЙ",
		"NO LO DIERON": "НЕ ЗАСЧИТАЛИ",
		"ESTAMPAS LUNA": "ESTAMPAS LUNA",
		"CEREALES ALBA": "CEREALES ALBA",
		"AUTOCARES ATLAS": "AUTOCARES ATLAS",
		"PIXEL ARENA": "PIXEL ARENA",
		"Tu cara en el álbum del barrio. Cada gol, un sobre más.": "Твое лицо в дворовом альбоме наклеек. Каждый гол — еще один пакетик.",
		"Tu cara en la caja del desayuno. Pagan fijo y piden poco.": "Твое лицо на коробке с завтраком. Платят фиксированную сумму и почти ничего не просят.",
		"Tu cara recorre la ciudad en el autobús. Si no juegas, no ruedas.": "Твое лицо колесит по городу на автобусе. Не играешь — автобус стоит.",
		"La portada del videojuego del año. Cada gol tuyo vende una copia más.": "Обложка игры года. Каждый твой гол продает еще одну копию.",
		"TU ESTAMPA": "НАКЛЕЙКА",
		"TU CARA EN LA CAJA": "ЛИЦО НА КОРОБКЕ",
		"TU CARA EN LA RUTA": "ЛИЦО НА АВТОБУСЕ",
		"TU PORTADA": "ОБЛОЖКА",
		"DESAYUNO DE CAMPEÓN": "ЗАВТРАК ЧЕМПИОНА",
		"Tres sobres y ya te tenían repetido. Te cambian por dos.": "Три пакетика — и ты уже в повторках. Тебя меняют на двоих.",
		"Medio barrio desayuna contigo. El otro medio, con la competencia.": "Полрайона завтракает с тобой. Другая половина — с конкурентами.",
		"Doce metros de cara. Y para cada parada, en todas las rutas.": "Двенадцать метров лица. И на каждой остановке, на всех маршрутах.",
		"La cola da la vuelta a la manzana. Dentro del juego también eres tú.": "Очередь — вокруг квартала. А внутри игры — тоже ты.",
	},
}
