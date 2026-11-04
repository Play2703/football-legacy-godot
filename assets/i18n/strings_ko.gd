extends RefCounted




































const DOMAINS: Dictionary = {



	"trueno_himno": {
		"GOLEADA": "대승",
		"¡HUH!": "후!",
		"¡CON EL BOMBO!": "북에 맞춰!",
		"¡DESCUADRE!": "박자 놓침!",
		"¡TRUENO!": "천둥!",
		"SE DESCUADRO": "박자 엇갈림",
		"goleada": "대승",
		"palmas": "박수",
		"La grada entera, a tu compás.": "관중석 전체가 당신의 박자에 맞춰요.",
		"Las palmas se fueron cada una por su lado.": "박수가 제각각 따로 놀았어요.",
		"EL TRUENO": "천둥",
		"EL APRETON": "악수",
		"EL HIMNO": "국가",
		"A TU LADO: {0}": "옆자리: {0}",
		"EN DIRECTO": "생중계",
		"RISA": "웃음",
		"AGUANTA": "참아!",
		"¡TE BUSCA!": "조심!",
		"¡REVIENTAS!": "웃음 폭발!",
		"¡LA TELE!": "카메라!",
		"¡JA, JA!": "하하!",
		"¡PILLADO!": "딱 걸렸다!",
		"¡AGUANTASTE!": "참아냈다!",
		"Todo el país te ha visto reírte en pleno himno.": "온 나라가 국가 연주 중에 웃는 당신을 봤어요.",
		"Cara de piedra con todo el país mirando.": "온 나라가 지켜보는 앞에서 포커페이스.",
		"El Trueno": "천둥",
		"Llevar a la grada entera hasta el redoble tras una goleada en casa.": "홈 대승 후 관중석 전체를 마지막 북소리까지 이끌기.",
		"Aguantar el himno sin reírte con la tele delante.": "카메라 앞에서 웃지 않고 국가 연주 버티기.",
		"Pillado en Directo": "생방송에 딱 걸림",
		"Que la tele te pille riéndote durante el himno.": "국가 연주 중에 웃는 모습을 TV에 들키기.",
		"Tras una goleada en casa, la grada espera a que alguien marque el compás.": "홈 대승 후, 관중석은 누군가 박자를 잡아주길 기다려요.",
		"Con tu selección, el himno se canta serio... aunque el de al lado no ayude.": "국가대표팀에선 국가를 진지하게 불러요... 옆 사람이 도와주지 않더라도.",
		"Con tu selección, ojo con quién tienes al lado cuando suena el himno.": "국가대표팀에선 국가가 울릴 때 옆에 누가 있는지 조심하세요.",
		"El Míster Aún Sabe": "감독님 아직 살아있네",
		"Que tu técnico baje de pecho un balón fuera y se la dé al que saca de banda.": "감독이 밖으로 나간 공을 가슴으로 받아 스로인할 선수에게 건네게 하기.",
		"Cuando el balón sale por tu banquillo, a veces el míster no se resiste.": "공이 벤치 쪽으로 나가면, 감독도 가끔 참지 못해요.",
		"¡PENAL!": "페널티킥!",
		"NO ERA PENAL": "PK 아님",
		"{0} NO LO OLVIDA": "{0}, 잊지 않는다",
		"¡ESE NO ES!": "그 노래 아냐!",
		"EL MARACANAZO": "마라카낭의 비극",
		"EL CABEZAZO": "박치기",
		"LA PRÓRROGA DE RÍO": "리우의 연장전",
		"LOS PENALES DE DOHA": "도하의 승부차기",
		"EL GOL DE ORO": "골든골",
		"GOL DE ORO": "골든골",
		"DOS EN EL DESCUENTO": "추가시간 두 골",
		"EL ÚLTIMO SUSPIRO": "극장골",
		"LA VUELTA DE ÁMSTERDAM": "암스테르담 2차전",
		"LA MANITA": "5골 잔치",
		"ROJA DIRECTA": "다이렉트 퇴장",
		"EN LOS PENALES": "승부차기 끝에",
		"ESTABA ADELANTADO": "오프사이드였다",
		"LA CHILENA": "바이시클 킥",
		"LA GRADA APLAUDE": "관중석의 박수",
		"Cara de Piedra": "포커페이스",
	},


	"mando_f2": {
		"IZQUIERDA · AJUSTA EL STICK": "왼쪽 · 스틱 조정",
		"DERECHA · AJUSTA EL STICK": "오른쪽 · 스틱 조정",
		"mandoCRUZ": "엑스",
		"mandoCÍRCULO": "동그라미",
		"mandoCUADRADO": "네모",
		"mandoTRIÁNGULO": "세모",
		"Stick izquierdo para moverte · llega al balón y remata": "왼쪽 스틱으로 이동 · 공에 닿으면 슈팅",
		"Con mando se juega en horizontal: {0} > {1} > {2}": "컨트롤러는 가로 화면으로 플레이: {0} > {1} > {2}",
		"MANTÉN {0} Y SUELTA": "{0} 누르고 떼기",
		"Apunta con el stick y mantén {0}. Más carga, más fuerte.": "스틱으로 조준하고 {0} 버튼을 누른 채 유지하세요. 오래 모을수록 더 세게.",
		"PULSA {0} PARA CONTINUAR": "{0} 눌러 계속",
		"PULSA {0} PARA JUGAR": "{0} 눌러 플레이",
		"El coche acelera solo. Gira con el stick y frena con {0}.": "차는 저절로 가속해요. 스틱으로 방향을 틀고 {0} 버튼으로 브레이크.",
		"Pulsa {0} para saltar": "{0} 눌러 건너뛰기",
		"CENTRO · apunta y pulsa {0}": "크로스 · 조준하고 {0} 누르기",
		"Apunta con el stick · pulsa {0}": "스틱으로 조준 · {0} 누르기",
		"Pulsa {0} para continuar": "{0} 눌러 계속",
		"Mueve un stick para seguir": "스틱을 움직여 계속",
		"PULSA {0} PARA EMPEZAR": "{0} 눌러 시작",
		"CABEZAZO · jala el stick derecho y suelta": "헤더 · 오른쪽 스틱을 당겼다 놓기",
		"Empuja el stick izquierdo y corres hacia donde lo empujas. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "왼쪽 스틱을 밀면 민 방향으로 달려요. 놓으면 그 자리에 딱 멈춰요. 공을 빨간 원판까지 몰고 가세요: 밟으면 꺼지고 다음 원판이 켜져요, 늘 반대편에요. 드리블은 앞만 보고 달리는 게 아니라 방향을 고르는 거예요.",
		"Dos sticks: el izquierdo conduce y el derecho tira. Jala el derecho hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltarlo, apunta al balón con el izquierdo y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "스틱 두 개: 왼쪽은 드리블, 오른쪽은 슈팅. 오른쪽 스틱을 새총처럼 뒤로 당기면 가이드가 앞을 가리켜요. 놓은 뒤 왼쪽 스틱으로 공을 조준하고 {0} 버튼을 누르세요 — 어디를 차느냐가 전부예요. 처음엔 공이 구역별로 칠해져 있어요: 위쪽은 낮고 느리게, 아래쪽은 떴다가 떨어지고, 옆쪽은 휘어요. 그리고 가장자리일수록 파워가 약해요: 대포알 슈팅은 한가운데서 나와요.",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: {2} gira la vista a la banda y te enseña a los compañeros; otra vez y vuelve.": "패스 버튼은 없어요: 패스는 동료를 향해 슈팅하는 거고, 먼저 닿는 쪽이 공을 가져요. 동료는 둘이에요: 박스 밖에 한 명, 박스 안에 한 명. 패스가 박스 밖에 떨어지면 받은 선수로 조작이 바뀌어요. 박스 안에 떨어지면 컨트롤은 없어요: 바로 원터치 슈팅. 동료를 보려면 {2} 버튼: 시점이 터치라인 쪽으로 돌아가 동료를 보여줘요. 한 번 더 누르면 돌아와요.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con el stick izquierdo y tira con el derecho cuando lo veas.": "수비수가 붙어 있고 앞엔 경기장이 펼쳐져 있어요: 드리블로 상대 진영까지 건너가세요 — 빛나는 선까지는 슈팅 금지, 드리블만. 한 구간 나아갈 때마다 새 수비가 막아서요. 그다음은 일대일: 왼쪽 스틱으로 드리블하고, 기회다 싶으면 오른쪽 스틱으로 슈팅하세요.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el botón TIRO/CENTRO de la pantalla. Para cambiar entre CENTRO (colgado) y TIRO (raso), pulsa {1} mientras apuntas. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "이건 크로스예요: 공을 박스 안으로 띄워 보내요. 코너킥은 처음부터 크로스예요; 화면의 슈팅/크로스 버튼이 알려줘요. 크로스(띄우기)와 슈팅(낮게)을 바꾸려면 조준 중에 {1} 버튼을 누르세요. 골대가 아니라 동료의 머리를 노리세요. 마지막은 방향 전환: 같은 킥으로 반대편의 빈 동료를 찾아요.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con el stick izquierdo, pásala con el derecho a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "공을 갖고 내 진영에서 시작하고, 골대는 멀어요. 왼쪽 스틱으로 드리블하고, 오른쪽 스틱으로 동료에게 패스하며 계속 나아가세요: 패스도 슈팅처럼 차고, 받은 선수로 플레이해요. 앞으로 못 나가고 뒤에 머물면 상대가 더 강하게 압박해요. 그다음은 일대일: 기회다 싶으면 슈팅하세요.",
		"Con {1} cambias entre CENTRO y TIRO.": "{1} 버튼으로 크로스/슈팅 전환.",
		"Apunta al área y aguanta el stick.": "박스 안을 조준하고 스틱을 유지하세요.",
		"Sueltas, apuntas y pulsas {0}.": "놓고, 조준하고, {0} 버튼을 눌러요.",
		"Stick izquierdo para conducir; jala el derecho y suelta para tirar": "왼쪽 스틱으로 드리블; 오른쪽을 당겼다 놓으면 슈팅",
		"Stick izquierdo para conducir; no se tira": "왼쪽 스틱으로 드리블; 슈팅 금지",
		"Stick izquierdo para conducir; apunta con el derecho a un compañero y suelta": "왼쪽 스틱으로 드리블; 오른쪽으로 동료를 조준하고 놓기",
		"Mientras apuntas, {0} elige compañero y {1} cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.": "조준 중에 {0} 버튼으로 동료를 고르고 {1} 버튼으로 지시를 바꿔요. 하늘색은 골문으로 침투, 주황색은 대기, 자홍색은 마커를 끌고 가요.",
		"STICK DERECHO: CÁMARA · {0}/{1}: BUSCAR · {2}/{3}: RITMO": "오른쪽 스틱: 카메라 · {0}/{1}: 탐색 · {2}/{3}: 속도",
		"LB ALTERNA": "LB 전환",
		"¿SALIR DEL JUEGO?": "게임을 종료할까요?",
		"MUEVE EL STICK PARA GIRAR": "스틱을 움직여 회전",
		"PULSA {0} PARA OTRA": "{0} 눌러 다시 하기",
		"Mueve la pala con el stick. {0} para sacar.": "스틱으로 라켓을 움직여요. {0} 버튼으로 서브.",
		"Pulsa {0} para firmar": "{0} 눌러 서명",
		"Gira el campo con el stick derecho. Los esquemas son de consulta.": "오른쪽 스틱으로 경기장을 돌려요. 전술 도식은 보기 전용이에요.",
		"Apunta con WASD · pulsa {0}": "WASD로 조준 · {0} 누르기",
		"WASD para moverte · llega al balón y remata": "WASD로 이동 · 공에 닿으면 슈팅",
		"Pulsa WASD o una flecha para seguir": "WASD나 화살표 키를 눌러 계속",
		"CABEZAZO · mantén una flecha y suelta": "헤더 · 화살표 키를 누르고 있다 떼기",
		"HAZ CLIC PARA CONTINUAR": "클릭해서 계속",
		"HAZ CLIC EN EL ARO": "림을 클릭",
		"¡ARRASTRA HACIA ÉL!": "그쪽으로 드래그!",
		"Arrastra para girar el campo. Los esquemas son de consulta.": "드래그해서 경기장을 돌려요. 전술 도식은 참고용이에요.",
		"El coche acelera solo. Gira con las flechas y frena con la de abajo.": "차는 저절로 가속해요. 화살표 키로 방향을 틀고 아래 키로 브레이크.",
		"Arrastra el balón hacia la canasta. Más rápido, más fuerte.": "공을 림 쪽으로 드래그하세요. 빠를수록 세게.",
		"ARRASTRA HACIA LA CANASTA": "림 쪽으로 드래그",
		"HAZ CLIC PARA OTRA": "클릭해서 한 번 더",
		"USA LAS FLECHAS PARA GIRAR": "화살표 키로 회전",
		"Arrastra hacia el aro y suelta.": "림 쪽으로 드래그하고 놓으세요.",
		"Mantén una flecha y suelta para tirar": "화살표 키를 누르고 있다 떼면 슈팅",
		"Mantén una flecha y suelta para centrar": "화살표 키를 누르고 있다 떼면 크로스",
		"teclaESPACIO": "스페이스",
		"teclaMAYÚS": "시프트",
		"Con WASD corres hacia donde pulsas. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "WASD를 누르는 방향으로 달려요. 놓으면 그 자리에 딱 멈춰요. 공을 빨간 원판까지 몰고 가세요: 밟으면 꺼지고 다음 원판이 켜져요, 늘 반대편에요. 드리블은 앞만 보고 달리는 게 아니라 방향을 고르는 거예요.",
		"WASD conduce y las flechas tiran. Mantén una flecha, como una resortera: la guía apunta al lado contrario. Al soltarla, apunta al balón con WASD y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "WASD로 드리블, 화살표 키로 슈팅. 화살표 키를 새총처럼 누르고 있으면 가이드가 반대쪽을 가리켜요. 뗀 뒤 WASD로 공을 조준하고 {0} 버튼을 누르세요 — 어디를 차느냐가 전부예요. 처음엔 공이 구역별로 칠해져 있어요: 위쪽은 낮고 느리게, 아래쪽은 떴다가 떨어지고, 옆쪽은 휘어요. 그리고 가장자리일수록 파워가 약해요: 대포알 슈팅은 한가운데서 나와요.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con WASD y tira con las flechas cuando lo veas.": "수비수가 붙어 있고 앞엔 경기장이 펼쳐져 있어요: 드리블로 상대 진영까지 건너가세요 — 빛나는 선까지는 슈팅 금지, 드리블만. 한 구간 나아갈 때마다 새 수비가 막아서요. 그다음은 일대일: WASD로 드리블하고, 기회다 싶으면 화살표 키로 슈팅하세요.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con WASD, pásala con las flechas a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "공을 갖고 내 진영에서 시작하고, 골대는 멀어요. WASD로 드리블하고, 화살표 키로 동료에게 패스하며 계속 나아가세요: 패스도 슈팅처럼 차고, 받은 선수로 플레이해요. 앞으로 못 나가고 뒤에 머물면 상대가 더 강하게 압박해요. 그다음은 일대일: 기회다 싶으면 슈팅하세요.",
		"Sueltas, apuntas con WASD y pulsas {0}.": "놓고, WASD로 조준하고, {0} 버튼을 눌러요.",
		"Apunta al área y aguanta la flecha.": "박스 안을 조준하고 화살표 키를 유지하세요.",
		"WASD para conducir; mantén una flecha y suelta para tirar": "WASD로 드리블; 화살표 키를 누르고 있다 떼면 슈팅",
		"WASD para conducir; no se tira": "WASD로 드리블; 슈팅 금지",
		"WASD para conducir; mantén una flecha hacia un compañero y suelta": "WASD로 드리블; 동료 쪽 화살표 키를 누르고 있다 떼기",
		"PULSA LAS TECLAS O HAZ CLIC": "키를 누르거나 클릭",
		"LA PARTIDA ESTÁ GUARDADA": "게임이 저장됐어요",
		"SE PIERDE PARA SIEMPRE": "영원히 사라져요",
		"NO HAY VUELTA ATRÁS": "되돌릴 수 없어요",
		"SALIR DEL PARTIDO": "경기 나가기",
		"¿SALIR DEL PARTIDO?": "경기에서 나갈까요?",
		"¿REINICIAR EL PARTIDO?": "경기를 다시 시작할까요?",
		"¿{0}?": "{0}?",
		"APUNTA Y TIRA": "조준하고 슈팅",
		"GOLPEA": "킥",
		"TIRO O CENTRO": "슈팅/크로스",
		"CANCELA": "취소",
		"ORDENA": "지시",
		"COMPAÑERO U OBJETIVO": "동료/목표",
		"MANTIENE": "유지",
		"CÁMARA": "카메라",
		"SE PIERDE LO JUGADO": "진행 상황이 사라져요",
		"EL PARTIDO QUEDA POR JUGAR": "경기는 치르지 않은 상태로 남아요",
		"VUELVES AL 0' CON LA MISMA ENERGÍA": "같은 에너지로 0'부터 다시",
		"SE PIERDEN LAS ESTRELLAS": "별을 잃어요",
		"MUEVE": "이동",
		"A/B NINTENDO": "닌텐도 A/B",
		"CORRE Y TIRA": "달리고 슈팅",
		"Mantén {0} para correr · cruza al campo rival": "{0} 버튼을 누른 채로 달리기 · 상대 진영으로 넘어가세요",
		"Mantén {0} para correr · lleva el balón a la zona roja": "{0} 버튼을 누른 채로 달리기 · 공을 빨간 구역으로",
		"Empuja el stick izquierdo y vas al paso hacia donde lo empujas; mantén {3} y corres. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "왼쪽 스틱을 밀면 민 방향으로 걸어가요. {3} 버튼을 누르고 있으면 달려요. 놓으면 그 자리에 딱 멈춰요. 공을 빨간 원판까지 몰고 가세요: 밟으면 꺼지고 다음 원판이 켜져요, 늘 반대편에요. 드리블은 앞만 보고 달리는 게 아니라 방향을 고르는 거예요.",
		"Con WASD vas al paso hacia donde pulsas; mantén {3} y corres. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "WASD를 누르는 방향으로 걸어가요. {3} 버튼을 누르고 있으면 달려요. 놓으면 그 자리에 딱 멈춰요. 공을 빨간 원판까지 몰고 가세요: 밟으면 꺼지고 다음 원판이 켜져요, 늘 반대편에요. 드리블은 앞만 보고 달리는 게 아니라 방향을 고르는 거예요.",
		"Empuja este stick hacia el disco; con {3}, corres.": "이 스틱을 원판 쪽으로 밀어요. {3} 버튼을 누르면 달려요.",
		"Pulsa WASD y vas al disco; con {3}, corres.": "WASD를 누르면 원판으로 가요. {3} 버튼을 누르면 달려요.",
		"CANCELA O PAUSA": "취소·일시정지",
		"CORRE": "달리기",
	},


	"previa_pases": {
		"MÁXIMO GOLEADOR": "득점왕",
		"MÁXIMO ASISTENTE": "도움왕",
		"{0} EN GOLEO": "득점 순위 {0}",
	},

	"amigos": {
		"AMIGOS": "친구",
		"TABLA": "순위",
		"TU CÓDIGO": "내 코드",
		"INVITAR": "초대",
		"TÍTULOS": "타이틀",
		"{0} AÑOS · TEMPORADA {1}": "{0}세 · {1} 시즌",
		"HACE {0} D": "{0}일 전",
		"Vista previa: amigos de ejemplo": "미리보기: 예시 친구",
		"AGREGAR AMIGO": "친구 추가",
		"AGREGAR": "추가",
		"CÓDIGO NO ENCONTRADO": "코드를 찾을 수 없음",
		"ES TU CÓDIGO": "내 코드예요",
		"SIN CONEXIÓN": "오프라인",
		"Amigo agregado.": "친구를 추가했어요.",
		"Juega Football Legacy conmigo: {0} · código {1}": "Football Legacy 같이 해요: {0} · 코드 {1}",
		"Invitación copiada.": "초대 문구를 복사했어요.",
		"¿SALIR DE LA LIGA?": "리그에서 나갈까요?",
		"Si vuelves, empiezas de 0.": "돌아오면 0부터 다시 시작해요.",
		"No podrás volver.": "다시 돌아올 수 없어요.",
		"Empieza una carrera para compararte.": "커리어를 시작해서 비교해 보세요.",
		"{0} fichó por {1}": "{0}, {1}에 입단",
		"{0} ganó la liga": "{0}, 리그 우승",
		"{0} se lesionó: {1} semanas": "{0}, 부상: {1}주",
		"{0} subió a {1} de media": "{0}, OVR {1} 달성",
		"{0} llegó a {1} goles": "{0}, {1}골 달성",
		"{0} ganó el premio al Jugador del Año": "{0}, 올해의 선수 수상",
		"VER CASA": "집 구경",
		"CASA DE {0}": "{0}의 집",
		"AÚN NO HAY CASA": "아직 집이 없어요",
		"TU CALLE": "내 거리",
		"VECINOS": "이웃",
		"apodoCAÑÓN": "대포",
		"apodoRAYO": "번개",
		"apodoCOHETE": "로켓",
		"apodoTANQUE": "탱크",
		"apodoMURO": "철벽",
		"apodoTORNADO": "토네이도",
		"apodoTITÁN": "타이탄",
		"apodoLEÓN": "사자",
		"apodoTIBURÓN": "상어",
		"apodoHALCÓN": "매",
		"apodoLOBO": "늑대",
		"apodoTORO": "황소",
		"apodoMAGO": "마법사",
		"apodoCÓNDOR": "콘도르",
		"apodoTRUENO": "천둥",
		"apodoVOLCÁN": "화산",
		"apodoDE ORO": "황금",
		"apodoDE ACERO": "강철",
		"apodoDE FUEGO": "불꽃",
		"apodoDE HIELO": "얼음",
		"apodoDEL SUR": "남쪽",
		"apodoDEL NORTE": "북쪽",
		"apodoDEL BARRIO": "동네",
		"apodoDEL ÁREA": "박스",
		"apodoDE PLATA": "은빛",
		"apodoDE LEYENDA": "전설의",
		"apodoIMPARABLE": "무적의",
		"apodoVELOZ": "쾌속",
		"apodoLETAL": "치명적인",
		"apodoSALVAJE": "야생의",
		"apodoSIN FRENO": "폭주하는",
		"apodoDE MEDIANOCHE": "한밤의",
		"apodo{0} {1} {2}": "{1} {0} {2}",
		"ELIGE TU NOMBRE": "이름 선택",
		"ESCRIBE TU NOMBRE": "이름 입력",
		"Lo ven todos. Un nombre ofensivo se puede denunciar.": "모두가 볼 수 있어요. 불쾌한 이름은 신고될 수 있어요.",
		"MÁXIMO 16 LETRAS": "최대 16글자",
		"SÓLO LETRAS Y NÚMEROS": "영문과 숫자만",
		"MÍNIMO 2 LETRAS": "최소 2글자",
		"ESE NOMBRE NO SE PUEDE USAR": "사용할 수 없는 이름",
		"OCULTAR SU NOMBRE": "이름 숨기기",
		"MOSTRAR SU NOMBRE": "이름 표시",
		"DENUNCIAR": "신고",
		"AMIGOS crea un perfil anónimo y sube tu carrera y tu apodo para rankings y retos.": "친구 모드는 익명 프로필을 만들고, 랭킹과 대결을 위해 내 커리어와 별명을 업로드해요.",
		"Tolerancia cero con apodos ofensivos o abusivos.": "불쾌하거나 악의적인 별명은 절대 용납하지 않아요.",
		"AHORA NO": "나중에",
		"BORRAR MI CUENTA": "내 계정 삭제",
		"¿BORRAR TU CUENTA?": "계정을 삭제할까요?",
		"Se borran del servidor tu perfil, amigos, retos, ligas, ranking y casa. Tu carrera en este dispositivo no se toca.": "서버에서 프로필, 친구, 대결, 리그, 랭킹, 집이 삭제돼요. 이 기기의 커리어는 그대로예요.",
		"Cuenta borrada.": "계정이 삭제됐어요.",
		"No se pudo borrar. Revisa tu conexión e inténtalo luego.": "삭제하지 못했어요. 연결을 확인하고 나중에 다시 시도하세요.",
		"QUITAR AMIGO": "친구 삭제",
		"¿QUITAR AMIGO?": "친구를 삭제할까요?",
		"¿DENUNCIAR?": "신고할까요?",
		"Deja de ser tu amigo y se oculta su nombre.": "친구 관계가 끊기고 이름이 숨겨져요.",
		"Deja de ser tu amigo.": "친구 관계가 끊겨요.",
		"Queda bloqueado: no vuelve a aparecer en AMIGOS.": "차단돼요: 친구 목록에 다시 나타나지 않아요.",
		"BLOQUEAR": "차단",
		"Al aceptar, aceptas estas normas: tolerancia cero con el contenido ofensivo y con los usuarios abusivos. Lo denunciado se oculta y la cuenta se expulsa.": "수락하면 다음 규칙에 동의하게 돼요: 불쾌한 콘텐츠와 악의적인 사용자는 절대 용납하지 않아요. 신고된 콘텐츠는 숨겨지고 해당 계정은 퇴출돼요.",
		"cocheSUBIR": "탑승",
		"BAJAR": "하차",
		"FRENO": "브레이크",
		"KM/H": "KM/H",
		"R": "R",
		"ACELERA": "가속",
	},


	"amigos_retos": {
		"RETOS": "대결",
		"RETO": "대결",
		"RETAR": "도전하기",
		"RETAR A UN AMIGO": "친구에게 도전",
		"JUGADAS": "슈팅",
		"{0} JUGADAS": "슈팅 {0}회",
		"{0} · {1} JUGADAS": "{0} · 슈팅 {1}회",
		"TE TOCA": "내 차례",
		"ESPERANDO": "대기 중",
		"ENVIANDO": "전송 중",
		"CADUCADO": "만료",
		"QUEDAN {0} H": "{0}시간 남음",
		"QUEDAN {0} D": "{0}일 남음",
		"Sin conexión: lo último guardado": "오프라인: 마지막 저장 내용",
		"+{0} ★ por amigo que juegue 10 partidos": "10경기 뛴 친구 1명당 +{0} ★",
		"+{0} ★ por invitar amigos": "친구 초대 시 +{0} ★",
		"Aún no hay novedades de tus amigos.": "아직 친구 소식이 없어요.",
		"Reta a un amigo: mismas jugadas para los dos, gana quien marque más.": "친구에게 도전하세요: 둘 다 같은 슈팅, 더 많이 넣는 쪽이 승리.",
		"Agrega un amigo para retarlo.": "대결하려면 친구를 추가하세요.",
		"Reto enviado.": "도전장을 보냈어요.",
		"Sólo vale el primer intento. Si sales, cuenta lo que lleves.": "첫 시도만 인정돼요. 나가면 그때까지의 기록이 반영돼요.",
		"Marca guardada. El resultado sale cuando juegue tu amigo.": "기록이 저장됐어요. 친구가 플레이하면 결과가 나와요.",
		"SALIR DEL RANKING": "랭킹 나가기",
		"ENTRAR EN EL RANKING": "랭킹 참가",
		"DEMASIADOS RETOS HOY": "오늘 대결 한도 초과",

		"EN GRUPO": "그룹",
		"RETO EN GRUPO": "그룹 대결",
		"ELIGE AL MENOS 2 AMIGOS": "친구를 2명 이상 선택",
		"PUESTO {0} DE {1}": "{1}명 중 {0}위",
		"Las marcas de los demás se ven al terminar la tuya.": "내 기록을 마치면 다른 사람의 기록이 보여요.",
		"Agrega al menos dos amigos para un reto en grupo.": "그룹 대결을 하려면 친구를 2명 이상 추가하세요.",
		"Marca guardada. El resultado sale cuando jueguen todos.": "기록이 저장됐어요. 모두 플레이하면 결과가 나와요.",
		"YA NO ES TU AMIGO": "더 이상 친구 아님",
		"YA LO JUGASTE": "이미 플레이함",
		"RETO CADUCADO": "대결 만료",
		"{0} ganó un título": "{0}, 우승 트로피 획득",
		"{0} ganó un premio individual": "{0}, 개인상 수상",
		"{0} colgó las botas": "{0}, 현역 은퇴",
		"Guante Lanzado": "도전장 투척",
		"Jugar tu primer reto contra un amigo.": "친구와 첫 대결하기.",
		"El Pique": "자존심 대결",
		"Ganar un reto a un amigo.": "친구와의 대결에서 승리하기.",
		"Rey del Barrio": "동네의 왕",
		"Ganar 10 retos a tus amigos.": "친구와의 대결에서 10번 승리하기.",
		"Pleno": "퍼펙트",
		"Marcar todas en un reto de 10 o 15 jugadas.": "10회 또는 15회 슈팅 대결에서 전부 성공하기.",
		"Padrino": "멘토",
		"Que un amigo que invitaste juegue 10 partidos.": "초대한 친구 1명이 10경기 플레이하기.",
		"Cazatalentos": "스카우터",
		"Que 5 amigos que invitaste jueguen 10 partidos.": "초대한 친구 5명이 10경기 플레이하기.",
	},

	"amigos_carreras": {
		"{0} CARRERAS": "커리어 {0}개",
		"SU JUGADOR": "친구의 선수",
		"JUEGAS CON": "조작 선수",
	},


	"logros_hito": {
		"Oro Precoz": "이른 영광",
		"Ganar el Balón de Oro antes de cumplir 19 años.": "19세가 되기 전에 올해의 선수 수상하기.",
		"Triplete": "트레블",
		"Liga, copa y tu gran copa continental en la misma temporada.": "리그, 컵, 최고 대륙컵을 한 시즌에 모두 우승하기.",
		"Último Baile": "라스트 댄스",
		"Levantar un título en tu temporada de retiro.": "은퇴 시즌에 우승 트로피 들어 올리기.",
		"De la Nada": "밑바닥부터",
		"Debutar en Tercera y ganar la liga de Primera en la misma carrera.": "3부에서 데뷔하고 같은 커리어에서 1부 리그 우승하기.",
		"Álbum de un Continente": "한 대륙의 앨범",
		"Completar en la VITRINA todas las ligas y copas de una confederación.": "진열장에서 한 대륙 연맹의 모든 리그와 컵 채우기.",
		"La Vitrina Completa": "진열장 완성",
		"Completar el álbum de la VITRINA al 100 %.": "진열장 앨범 100% 완성하기.",
		"Sextete": "6관왕",
		"Seis títulos con tu club en doce meses.": "12개월 안에 클럽과 함께 6관왕 달성하기.",
		"Desde la Primera Ronda": "1라운드부터",
		"Ganar una copa de Europa entrando por la primera ronda previa.": "1차 예선부터 출발해 유럽 컵 대회에서 우승하기.",
	},


	"vitrina_album": {
		"NACIONAL": "국내",
		"Ganado {0} veces.": "{0}회 우승.",
		"Trofeo por ganar. Sigue jugando tu carrera.": "아직 따지 못한 트로피예요. 커리어를 계속 플레이하세요.",
	},






	"grada_tifos": {
		"EL TIFO DEL DERBI": "더비 카드섹션",
		"La peña está pintando las cartulinas para el derbi contra {0} y te pregunta si pones el dinero. Si lo pones, el domingo la curva levanta tu número.": "서포터즈가 {0} 상대 더비를 위해 카드섹션을 칠하고 있어요. 비용을 대줄 수 있냐고 물어요. 대주면 일요일에 관중석이 당신의 등번호를 펼쳐요.",
		"PAGAR EL TIFO": "카드섹션 후원",
		"QUE SAQUEN SU ESCUDO": "엠블럼으로 충분해",
		"Premio de la Afición": "팬 선정 상",
		"EL ESTADIO, EN PIE: APLAUDEN TU DORSAL": "경기장 기립: 당신의 등번호에 박수",
		"TU EX GRADA, EN PIE: APLAUDEN TU DORSAL": "옛 홈 팬들 기립: 당신의 등번호에 박수",
		"PAÑUELOS BLANCOS EN LA GRADA: VAN POR TI": "관중석에 흰 손수건: 당신을 향한 항의",
		"PAÑUELOS BLANCOS CONTRA EL PALCO": "흰 손수건, 이사회를 향해",
		"PAÑOLADA": "손수건",
		"OS VAIS A VUESTRA GRADA: OS APLAUDEN IGUAL": "팬들에게 가니 그래도 박수",
		"OS VAIS A VUESTRA GRADA: PITOS Y PAÑUELOS": "팬들에게 가니 야유와 손수건",
		"APLAUSOS": "박수",
		"PITOS": "야유",
		"REGALO": "선물",
		"{0} le da su camiseta a un niño de la grada": "{0}, 관중석의 어린 팬에게 유니폼 선물",
		"Goleada ante el {0}: la grada del {1} aplaude igual": "{0} 상대로 대패: {1} 팬들은 그래도 박수",
		"Goleada ante el {0}: pitos y pañuelos para el {1}": "{0} 상대로 대패: {1} 팬들은 야유와 손수건",
		"FIRMA TU CAMISETA": "유니폼에 사인",
		"Es para el niño del cartel": "피켓 든 아이에게 줄 거예요",
		"Marcaste, y el niño del cartel se lleva tu camiseta.": "골을 넣었고, 피켓 든 아이가 당신의 유니폼을 가져가요.",
		"TRIBUNA {0}": "{0} 스탠드",
		"Es para tu hincha de siempre": "오랜 팬에게 줄 거예요",
		"Tu hincha de siempre se lleva tu camiseta.": "오랜 팬이 당신의 유니폼을 가져가요.",
		"Le negaste tu camiseta a tu hincha de siempre.": "오랜 팬에게 유니폼을 주지 않았어요.",
	},
	"ajustes_tumbado": {

		"ZURDO": "왼손",
		"TAMAÑO": "크기",
		"OPACIDAD": "투명도",
		"CRT": "CRT",
		"ICONO": "아이콘",
		"DATOS": "데이터",
		"TELÉFONO": "휴대폰",
		"CUMPLE": "생일",
		"MOVIMIENTO": "모션",
		"SACUDIDA": "흔들림",
		"MANDO": "패드",
		"CONECTAR": "연결",
		"CONECTADO": "연결됨",
		"ESPERANDO MANDO": "패드 대기 중",
		"EN EL MANDO": "패드에서",
		"EN EL TELÉFONO": "휴대폰에서",
		"EN EL ORDENADOR": "PC에서",
		"MANTÉN": "유지",
		"HASTA QUE PARPADEE": "깜빡일 때까지",
		"EMPAREJAR": "페어링",
		"SINCRONIZAR": "동기화",
		"TOCA EL MANDO": "패드를 터치",
		"VINCULAR": "새로 연결",
		"PRIVACIDAD": "개인정보",
		"LICENCIAS": "라이선스",
		"Licencia: {0}": "라이선스: {0}",
	},






	"copas_america": {
		"COPA GLORIA": "글로리컵",
		"Copa Gloria": "글로리컵",
		"LIBERTADORES": "글로리컵",
		"COPA DEL SUR": "남부컵",
		"Copa del Sur": "남부컵",
		"SUDAMERICANA": "남부컵",
		"COPA DEL NORTE": "북부컵",
		"Copa del Norte": "북부컵",
		"CONCACAF CHAMPIONS CUP": "북부컵",
		"MEJOR DE LA COPA GLORIA": "글로리컵 최우수 선수",
		"MEJOR DE LA COPA DEL SUR": "남부컵 최우수 선수",
		"MEJOR DE LA COPA DEL NORTE": "북부컵 최우수 선수",
		"Todo un continente soñando con esta copa. Y la levantas tú.":
			"대륙 전체가 꿈꾸는 컵. 그걸 당신이 들어 올려요.",
		"La otra copa de América. Se suda igual y se levanta igual.":
			"아메리카의 또 다른 컵. 땀도 똑같고, 들어 올리는 맛도 똑같아요.",
		"El norte del continente entero, a tus pies.":
			"대륙 북부 전체가 당신의 발아래에.",
		"El mejor de América en la copa que todo el continente mira.":
			"대륙 전체가 지켜보는 컵에서 아메리카 최고의 선수.",
		"El mejor de la otra copa de América. Nadie la jugó como tú.":
			"아메리카의 또 다른 컵 최고의 선수. 누구도 당신처럼 뛰지 못했어요.",
		"El mejor del norte del continente. Las noches de copa fueron tuyas.":
			"대륙 북부 최고의 선수. 컵 대회의 밤은 당신의 것이었어요.",
		"Previa": "예선",
		"PREVIA": "예선",
		"Preliminar": "예비 라운드",
		"PRELIMINAR": "예비 라운드",
		"Campeón de Libertadores": "글로리컵 우승",
		"Campeón de Copa Gloria": "글로리컵 우승",
		"Campeón de Sudamericana": "남부컵 우승",
		"Campeón de Copa del Sur": "남부컵 우승",
		"Campeón de Concacaf": "북부컵 우승",
		"Campeón de Copa del Norte": "북부컵 우승",
		"Bota de la Libertadores": "글로리컵 득점왕",
		"Bota de la Copa Gloria": "글로리컵 득점왕",
		"Bota de la Sudamericana": "남부컵 득점왕",
		"Bota de la Copa del Sur": "남부컵 득점왕",
		"Bota de la Concacaf": "북부컵 득점왕",
		"Bota de la Copa del Norte": "북부컵 득점왕",
		"Máximo Asistente de la Libertadores": "글로리컵 도움왕",
		"Máximo Asistente de la Copa Gloria": "글로리컵 도움왕",
		"Máximo Asistente de la Sudamericana": "남부컵 도움왕",
		"Máximo Asistente de la Copa del Sur": "남부컵 도움왕",
		"Máximo Asistente de la Concacaf": "북부컵 도움왕",
		"Máximo Asistente de la Copa del Norte": "북부컵 도움왕",
		"Mejor de la Libertadores": "글로리컵 시즌 최우수 선수",
		"Mejor de la Copa Gloria": "글로리컵 시즌 최우수 선수",
		"Mejor de la Sudamericana": "남부컵 시즌 최우수 선수",
		"Mejor de la Copa del Sur": "남부컵 시즌 최우수 선수",
		"Mejor de la Concacaf": "북부컵 시즌 최우수 선수",
		"Mejor de la Copa del Norte": "북부컵 시즌 최우수 선수",
		"¡Campeón de Copa Gloria!": "글로리컵 우승!",
		"¡Campeón de Copa del Sur!": "남부컵 우승!",
		"¡Campeón de Copa del Norte!": "북부컵 우승!",
		"¡CAMPEÓN DE COPA GLORIA!": "글로리컵 우승!",
		"¡CAMPEÓN DE COPA DEL SUR!": "남부컵 우승!",
		"¡CAMPEÓN DE COPA DEL NORTE!": "북부컵 우승!",
		"Clasificado a Copa Gloria": "글로리컵 진출",
		"Clasificado a Copa del Sur": "남부컵 진출",
		"Clasificado a Copa del Norte": "북부컵 진출",
		"Fase final de Copa Gloria": "글로리컵 토너먼트",
		"Fase final de Copa del Sur": "남부컵 토너먼트",
		"Fase final de Copa del Norte": "북부컵 토너먼트",
		"Mejor (Copa Gloria)": "MVP (글로리컵)",
		"Mejor (Copa del Sur)": "MVP (남부컵)",
		"Mejor (Copa del Norte)": "MVP (북부컵)",
		"Bota (Copa Gloria)": "득점왕 (글로리컵)",
		"Bota (Copa del Sur)": "득점왕 (남부컵)",
		"Bota (Copa del Norte)": "득점왕 (북부컵)",
		"Asist. (Copa Gloria)": "도움왕 (글로리컵)",
		"Asist. (Copa del Sur)": "도움왕 (남부컵)",
		"Asist. (Copa del Norte)": "도움왕 (북부컵)",
		"Gloria Eterna": "영원한 영광",
		"Rey del Sur": "남부의 왕",
		"Rey del Norte": "북부의 왕",
		"Amo de América": "아메리카의 지배자",
		"Dos Mundos": "두 세계",
		"Cerebro de la Libertadores": "글로리컵 플레이메이커",
		"Cerebro de la Copa Gloria": "글로리컵 플레이메이커",
		"Cerebro de la Sudamericana": "남부컵 플레이메이커",
		"Cerebro de la Copa del Sur": "남부컵 플레이메이커",
		"Cerebro de la Concacaf": "북부컵 플레이메이커",
		"Cerebro de la Copa del Norte": "북부컵 플레이메이커",
		"Ganar la Libertadores.": "글로리컵 우승하기.",
		"Ganar la Copa Gloria.": "글로리컵 우승하기.",
		"Ganar la Sudamericana.": "남부컵 우승하기.",
		"Ganar la Copa del Sur.": "남부컵 우승하기.",
		"Ganar la Concacaf Champions Cup.": "북부컵 우승하기.",
		"Ganar la Copa del Norte.": "북부컵 우승하기.",
		"Ser el máximo goleador de la Libertadores.": "글로리컵 득점왕 되기.",
		"Ser el máximo goleador de la Copa Gloria.": "글로리컵 득점왕 되기.",
		"Ser el máximo goleador de la Sudamericana.": "남부컵 득점왕 되기.",
		"Ser el máximo goleador de la Copa del Sur.": "남부컵 득점왕 되기.",
		"Ser el máximo goleador de la Concacaf Champions Cup.": "북부컵 득점왕 되기.",
		"Ser el máximo goleador de la Copa del Norte.": "북부컵 득점왕 되기.",
		"Máximo asistente de la Libertadores.": "글로리컵 도움왕.",
		"Máximo asistente de la Copa Gloria.": "글로리컵 도움왕.",
		"Máximo asistente de la Sudamericana.": "남부컵 도움왕.",
		"Máximo asistente de la Copa del Sur.": "남부컵 도움왕.",
		"Máximo asistente de la Concacaf Champions Cup.": "북부컵 도움왕.",
		"Máximo asistente de la Copa del Norte.": "북부컵 도움왕.",
		"Ganar la Libertadores con 3 clubes distintos.": "서로 다른 3개 클럽에서 글로리컵 우승하기.",
		"Ganar la Copa Gloria con 3 clubes distintos.": "서로 다른 3개 클럽에서 글로리컵 우승하기.",
		"Ganar la Champions y también la Libertadores o la Concacaf Champions Cup.": "엘리트컵과 함께 글로리컵 또는 북부컵도 우승하기.",
		"Ganar la Copa de Campeones y también la Copa Gloria o la Copa del Norte.": "엘리트컵과 함께 글로리컵 또는 북부컵도 우승하기.",
		"Máximo goleador de tu liga Y de tu gran copa continental en la misma temporada.": "한 시즌에 리그와 최고 대륙컵에서 모두 득점왕 차지하기.",
		"Ganar los seis grandes: liga, copa, tu gran copa continental, Mundial de Clubes, continental y Mundial.": "빅 6 우승하기: 리그, 컵, 최고 대륙컵, 클럽 세계 대회, 대륙 대회, 세계 대회.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de esa copa.": "1부 리그에서 한 시즌에: 리그, 컵, 최고 대륙컵 우승에 더해 올해의 선수, 리그 MVP와 득점왕, 그 컵의 MVP와 득점왕까지.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Jugador del Año, MVP y goleo de la liga, y MVP y bota de esa copa.": "1부 리그에서 한 시즌에: 리그, 컵, 최고 대륙컵 우승에 더해 올해의 선수, 리그 MVP와 득점왕, 그 컵의 MVP와 득점왕까지.",
		"TORNEOS CONTINENTALES": "대륙 대회",
		"continentales": "대륙 대회",
		"bota_libertadoresBota de la Libertadores": "글로리컵 득점왕",
		"bota_sudamericanaBota de la Sudamericana": "남부컵 득점왕",
		"bota_concacafBota de la Concacaf": "북부컵 득점왕",
		"max_asist_sudCerebro de la Sudamericana": "남부컵 플레이메이커",
		"nombre del logro max_asist_sudCerebro de la Sudamericana": "남부컵 플레이메이커",



		"tabGLORIA": "글로리",
		"tabSUR": "남부",
		"tabNORTE": "북부",
		"GLO": "글로",
		"SUR": "남부",
		"NOR": "북부",
	},


	"copas_asia": {
		"COPA DE ORIENTE": "동방컵",
		"Copa de Oriente": "동방컵",
		"MEJOR DE LA COPA DE ORIENTE": "동방컵 최우수 선수",
		"Campeón de Copa de Oriente": "동방컵 우승",
		"Bota de la Copa de Oriente": "동방컵 득점왕",
		"Máximo Asistente de la Copa de Oriente": "동방컵 도움왕",
		"Mejor de la Copa de Oriente": "동방컵 시즌 최우수 선수",
		"¡Campeón de Copa de Oriente!": "동방컵 우승!",
		"¡CAMPEÓN DE COPA DE ORIENTE!": "동방컵 우승!",
		"Clasificado a Copa de Oriente": "동방컵 진출",
		"Fase final de Copa de Oriente": "동방컵 토너먼트",
		"Mejor (Copa de Oriente)": "MVP (동방컵)",
		"Bota (Copa de Oriente)": "득점왕 (동방컵)",
		"Asist. (Copa de Oriente)": "도움왕 (동방컵)",
		"Cerebro de la Copa de Oriente": "동방컵 플레이메이커",
		"Ganar la Copa de Oriente.": "동방컵 우승하기.",
		"Ser el máximo goleador de la Copa de Oriente.": "동방컵 득점왕 되기.",
		"Máximo asistente de la Copa de Oriente.": "동방컵 도움왕.",
		"COPA DEL SOL": "태양컵",
		"Copa del Sol": "태양컵",
		"MEJOR DE LA COPA DEL SOL": "태양컵 최우수 선수",
		"Campeón de Copa del Sol": "태양컵 우승",
		"Bota de la Copa del Sol": "태양컵 득점왕",
		"Máximo Asistente de la Copa del Sol": "태양컵 도움왕",
		"Mejor de la Copa del Sol": "태양컵 시즌 최우수 선수",
		"¡Campeón de Copa del Sol!": "태양컵 우승!",
		"¡CAMPEÓN DE COPA DEL SOL!": "태양컵 우승!",
		"Clasificado a Copa del Sol": "태양컵 진출",
		"Fase final de Copa del Sol": "태양컵 토너먼트",
		"Mejor (Copa del Sol)": "MVP (태양컵)",
		"Bota (Copa del Sol)": "득점왕 (태양컵)",
		"Asist. (Copa del Sol)": "도움왕 (태양컵)",
		"Cerebro de la Copa del Sol": "태양컵 플레이메이커",
		"Ganar la Copa del Sol.": "태양컵 우승하기.",
		"Ser el máximo goleador de la Copa del Sol.": "태양컵 득점왕 되기.",
		"Máximo asistente de la Copa del Sol.": "태양컵 도움왕.",
		"Rey de Oriente": "동방의 왕",
		"Rey del Sol": "태양의 왕",
		"tabORIENTE": "동방",
		"tabSOL": "태양",
		"ORI": "동방",
		"CSO": "태양",
		"Medio mundo de distancia y una sola copa. Es tuya.": "세상 반 바퀴 거리, 단 하나의 컵. 당신 거예요.",
		"Viajes largos, noches largas. Y al final, la copa.": "긴 원정, 긴 밤. 그리고 마지막엔 컵.",
		"El mejor de la copa grande de Asia. Nadie brilló como tú.": "아시아 최고 컵의 최고 선수. 누구도 당신만큼 빛나지 못했어요.",
		"El mejor de la otra copa de Asia. Cada noche fue tuya.": "아시아의 또 다른 컵 최고 선수. 모든 밤이 당신 것이었어요.",
	},


	"copas_africa": {
		"COPA DEL ATLAS": "아틀라스컵",
		"Copa del Atlas": "아틀라스컵",
		"MEJOR DE LA COPA DEL ATLAS": "아틀라스컵 최우수 선수",
		"Campeón de Copa del Atlas": "아틀라스컵 우승",
		"Bota de la Copa del Atlas": "아틀라스컵 득점왕",
		"Máximo Asistente de la Copa del Atlas": "아틀라스컵 도움왕",
		"Mejor de la Copa del Atlas": "아틀라스컵 시즌 최우수 선수",
		"¡Campeón de Copa del Atlas!": "아틀라스컵 우승!",
		"¡CAMPEÓN DE COPA DEL ATLAS!": "아틀라스컵 우승!",
		"Clasificado a Copa del Atlas": "아틀라스컵 진출",
		"Fase final de Copa del Atlas": "아틀라스컵 토너먼트",
		"Mejor (Copa del Atlas)": "MVP (아틀라스컵)",
		"Bota (Copa del Atlas)": "득점왕 (아틀라스컵)",
		"Asist. (Copa del Atlas)": "도움왕 (아틀라스컵)",
		"Cerebro de la Copa del Atlas": "아틀라스컵 플레이메이커",
		"Ganar la Copa del Atlas.": "아틀라스컵 우승하기.",
		"Ser el máximo goleador de la Copa del Atlas.": "아틀라스컵 득점왕 되기.",
		"Máximo asistente de la Copa del Atlas.": "아틀라스컵 도움왕.",
		"COPA DEL BAOBAB": "바오밥컵",
		"Copa del Baobab": "바오밥컵",
		"MEJOR DE LA COPA DEL BAOBAB": "바오밥컵 최우수 선수",
		"Campeón de Copa del Baobab": "바오밥컵 우승",
		"Bota de la Copa del Baobab": "바오밥컵 득점왕",
		"Máximo Asistente de la Copa del Baobab": "바오밥컵 도움왕",
		"Mejor de la Copa del Baobab": "바오밥컵 시즌 최우수 선수",
		"¡Campeón de Copa del Baobab!": "바오밥컵 우승!",
		"¡CAMPEÓN DE COPA DEL BAOBAB!": "바오밥컵 우승!",
		"Clasificado a Copa del Baobab": "바오밥컵 진출",
		"Fase final de Copa del Baobab": "바오밥컵 토너먼트",
		"Mejor (Copa del Baobab)": "MVP (바오밥컵)",
		"Bota (Copa del Baobab)": "득점왕 (바오밥컵)",
		"Asist. (Copa del Baobab)": "도움왕 (바오밥컵)",
		"Cerebro de la Copa del Baobab": "바오밥컵 플레이메이커",
		"Ganar la Copa del Baobab.": "바오밥컵 우승하기.",
		"Ser el máximo goleador de la Copa del Baobab.": "바오밥컵 득점왕 되기.",
		"Máximo asistente de la Copa del Baobab.": "바오밥컵 도움왕.",
		"Rey del Atlas": "아틀라스의 왕",
		"Rey del Baobab": "바오밥의 왕",
		"tabATLAS": "ATLAS",
		"tabBAOBAB": "바오밥",
		"ATL": "ATL",
		"BAO": "BAO",
		"El mejor de la copa grande de África. Nadie brilló como tú.": "아프리카 최고 컵의 최고 선수. 누구도 당신만큼 빛나지 못했어요.",
		"El mejor de la otra copa de África. Cada noche fue tuya.": "아프리카의 또 다른 컵 최고 선수. 모든 밤이 당신 것이었어요.",
	},




	"copas_oceania": {
		"COPA DEL CORAL": "산호컵",
		"Copa del Coral": "산호컵",
		"MEJOR DE LA COPA DEL CORAL": "산호컵 최우수 선수",
		"Campeón de Copa del Coral": "산호컵 우승",
		"Bota de la Copa del Coral": "산호컵 득점왕",
		"Máximo Asistente de la Copa del Coral": "산호컵 도움왕",
		"Mejor de la Copa del Coral": "산호컵 시즌 최우수 선수",
		"¡Campeón de Copa del Coral!": "산호컵 우승!",
		"¡CAMPEÓN DE COPA DEL CORAL!": "산호컵 우승!",
		"Clasificado a Copa del Coral": "산호컵 진출",
		"Fase final de Copa del Coral": "산호컵 토너먼트",
		"Mejor (Copa del Coral)": "MVP (산호컵)",
		"Bota (Copa del Coral)": "득점왕 (산호컵)",
		"Asist. (Copa del Coral)": "도움왕 (산호컵)",
		"Cerebro de la Copa del Coral": "산호컵 플레이메이커",
		"Ganar la Copa del Coral.": "산호컵 우승하기.",
		"Ser el máximo goleador de la Copa del Coral.": "산호컵 득점왕 되기.",
		"Máximo asistente de la Copa del Coral.": "산호컵 도움왕.",
		"Rey del Coral": "산호의 왕",
		"Señor del Arrecife": "산호초의 군주",
		"Ganar 3 veces la Copa del Coral.": "산호컵 3회 우승하기.",
		"Tiburón del Pacífico": "태평양의 상어",
		"Ser 2 veces el máximo goleador de la Copa del Coral.": "산호컵 득점왕 2회 차지하기.",
		"Ser el mejor jugador de la Copa del Coral.": "산호컵 최고의 선수 되기.",
		"tabCORAL": "산호",
		"COR": "산호",
		"Islas lejanas, un solo estadio. Y la copa del Pacífico es tuya.": "머나먼 섬들, 단 하나의 경기장. 그리고 태평양의 컵은 당신 것.",
		"El mejor de la copa del Pacífico. Cada isla habló de ti.": "태평양 컵 최고의 선수. 모든 섬이 당신 이야기를 했어요.",
	},









	"campeon_de_campeones": {
		"CAMPEÓN DE CAMPEONES": "챔피언 중의 챔피언",
		"Campeón de Campeones": "챔피언 중의 챔피언",
		"Ganar el Campeón de Campeones.": "챔피언 중의 챔피언 우승하기.",
		"Dos campeones y una sola copa. La tuya.": "두 챔피언, 단 하나의 트로피. 당신 거예요.",
	},
	"supercopas": {
		"Campeón de la Finalísima": "슈퍼파이널 우승",
		"Finalísima": "슈퍼파이널",
		"FINALÍSIMA": "슈퍼파이널",
		"FINALÍSIMA: {0} le gana a {1}": "슈퍼파이널: {0}, {1} 상대로 승리",
		"Dos Continentes": "두 대륙",
		"Ganar la Finalísima con tu país.": "조국과 함께 슈퍼파이널 우승하기.",
		"Campeón de tu continente contra campeón del otro. Ganó el tuyo.": "당신 대륙의 챔피언 대 다른 대륙의 챔피언. 당신 쪽이 이겼어요.",
		"COPA DE LA LIGA": "리그컵",
		"Copa de la Liga": "리그컵",
		"Campeón de la Copa de la Liga": "리그컵 우승",
		"La otra copa del país. También es tuya.": "이 나라의 또 다른 컵. 이것도 당신 거예요.",
		"Doble Copa": "컵 더블",
		"Ganar la Copa de la Liga.": "리그컵 우승하기.",
		"LIGA DE NACIONES": "네이션스리그",
		"Liga de Naciones": "네이션스리그",
		"Campeón de la Liga de Naciones": "네이션스리그 우승",
		"Liga A": "리그 A",
		"Ganar la Liga de Naciones con tu país.": "조국과 함께 네이션스리그 우승하기.",
		"Seis jornadas, una Final Four. La primera de tu continente.": "6라운드, 그리고 파이널 포. 당신 대륙에서 처음 생긴 대회.",
		"LIGA DE NACIONES: {0}": "네이션스리그: {0}",
		"SUPERCOPA DE ÁFRICA": "아프리카 슈퍼컵",
		"Supercopa de África": "아프리카 슈퍼컵",
		"Campeón de la Supercopa de África": "아프리카 슈퍼컵 우승",
		"Supercampeón de África": "아프리카의 슈퍼 챔피언",
		"Ganar la Supercopa de África.": "아프리카 슈퍼컵 우승하기.",
		"Los dos campeones de África, y la copa es tuya.": "아프리카의 두 챔피언, 그리고 컵은 당신 것.",
		"RECOPA DEL SUR": "남부 슈퍼컵",
		"Recopa del Sur": "남부 슈퍼컵",
		"COPA INTERCONTINENTAL": "인터콘티넨탈컵",
		"Copa Intercontinental": "인터콘티넨탈컵",
		"DERBI DE LAS AMÉRICAS": "아메리카 더비",
		"COPA AFROASIÁTICA": "아프로아시아컵",

		"PLAY-OFF ASIA-PACÍFICO": "아시아·태평양 플레이오프",
		"COPA CHALLENGER": "챌린저컵",
		"Campeón de la Recopa": "남부 슈퍼컵 우승",
		"Campeón Intercontinental": "인터콘티넨탈 챔피언",
		"Campeón contra Campeón": "챔피언 대 챔피언",
		"Rey Intercontinental": "인터콘티넨탈의 왕",
		"Ganar la Recopa del Sur.": "남부 슈퍼컵 우승하기.",
		"Ganar la Copa Intercontinental.": "인터콘티넨탈컵 우승하기.",
		"Campeón contra campeón. Y la copa se queda contigo.": "챔피언 대 챔피언. 그리고 컵은 당신 곁에.",
		"Los campeones de cada continente, y el mejor eres tú.": "각 대륙의 챔피언들, 그리고 최고는 당신.",
		"SUPERCOPA DE EUROPA": "유럽 슈퍼컵",
		"Supercopa de Europa": "유럽 슈퍼컵",
		"Campeón de la Supercopa de Europa": "유럽 슈퍼컵 우승",
		"Supercampeón de Europa": "유럽의 슈퍼 챔피언",
		"Ganar la Supercopa de Europa.": "유럽 슈퍼컵 우승하기.",
		"Los dos campeones de Europa, y la copa es tuya.": "유럽의 두 챔피언, 그리고 컵은 당신 것.",
		"SUPERCOPA": "슈퍼컵",
		"Supercopa": "슈퍼컵",
		"Campeón de Supercopa": "슈퍼컵 우승",
		"Supercampeón": "슈퍼 챔피언",
		"Ganar la Supercopa de tu país.": "자국 슈퍼컵 우승하기.",
		"El campeón contra el campeón. Y la copa, tuya.": "챔피언 대 챔피언. 그리고 컵은 당신 것.",
		"SUPERCOPA · FINAL": "슈퍼컵 · 결승",
		"COPA DE LA ASOCIACIÓN": "협회컵",
		"Copa de la Asociación": "협회컵",
		"COPA DE LAS LIGAS": "인터리그컵",
		"Copa de las Ligas": "인터리그컵",
		"Campeón de la Copa de las Ligas": "인터리그컵 우승",
		"DUELO DE CAMPEONES": "챔피언 맞대결",
		"Rey de las Dos Ligas": "두 리그의 왕",
		"Ganar la Copa de las Ligas.": "인터리그컵 우승하기.",
		"Duelo de campeones entre dos ligas. Y la copa, tuya.": "두 리그 챔피언의 맞대결. 그리고 컵은 당신 것.",
	},
	"apertura_clausura": {
		"APERTURA": "아페르투라",
		"CLAUSURA": "클라우수라",
		"Apertura": "아페르투라",
		"Clausura": "클라우수라",
		"EN LIGUILLA": "리기야 진출권",
		"IGUALADO CON LA LIGUILLA": "리기야권과 동률",
		"A {0} PTS DE LA LIGUILLA": "리기야권까지 {0}점",
		"{0} es bicampeón: Apertura y Clausura": "{0}, 아페르투라·클라우수라 동시 석권",
		"{0} gana el Clausura; el Apertura fue de {1}": "{0}, 클라우수라 우승; 아페르투라는 {1} 차지",
		"ANUAL": "연간",
		"El torneo aún no arranca.": "아직 대회가 시작되지 않았어요.",
		"{0} os deja fuera. Se acabó el Apertura; queda el Clausura.": "{0}에게 탈락. 아페르투라는 끝났고, 클라우수라가 남았어요.",
	},
	"liguilla": {
		"ESTO SE VA A LOS PENALES": "승부차기로 간다",
		"GLOBAL EMPATADO: PASAS POR POSICIÓN": "합계 동점: 순위로 진출",
		"GLOBAL EMPATADO: PASA EL RIVAL POR POSICIÓN": "합계 동점: 상대가 순위로 진출",
		"PASAS POR POSICIÓN": "순위로 진출",
		"FUERA POR POSICIÓN": "순위로 탈락",
		"POR POSICIÓN": "순위로",
		"SI ACABA ASÍ: PENALTIS": "이대로면: 승부차기",
		"SI ACABA ASÍ: OTRA NOCHE": "이대로면: 한 경기 더",
		"Así, nos toca otra noche. Que no haga falta.": "이대로면 하룻밤 더 싸워야 해요. 그럴 일 없게 하죠.",
		"Así, penaltis. Y nadie quiere penaltis.": "이대로면 승부차기. 아무도 승부차기는 원하지 않아요.",
		"LIGUILLA": "리기야",
		"PLAY-IN": "플레이인",
		"Play-in": "플레이인",
		"FINAL DE LA LIGUILLA": "리기야 결승",
		"SUPERLÍDER: {0}": "정규리그 1위: {0}",
		"Entrar a la liguilla": "리기야 진출하기",
		"Superlíder": "정규리그 1위",
		"No entró": "진출 실패",
		"{0} en la tabla": "순위표 {0}",
		"Campeón de Liga: {0}": "리그 우승: {0}",
		"Del 1º al 6º, a cuartos; del 7º al 10º, al play-in.": "1~6위는 8강, 7~10위는 플레이인 진출.",
		"Así quedaría si la liga acabara hoy.": "오늘 리그가 끝난다면 이렇게 돼요.",
		"Dos partidos y la liga es vuestra. En esta sala ya no habla nadie de suerte.": "두 경기면 리그는 여러분 거예요. 이 방에서 이제 운을 말하는 사람은 없어요.",
		"Semifinales. Dos cruces más y la liga es vuestra.": "준결승. 두 번만 더 넘으면 리그는 여러분 거예요.",
		"Global igualado y pasa el mejor de la tabla: {0}. No hizo falta ni la tanda.": "합계 동점, 순위가 높은 팀이 진출: {0}. 승부차기도 필요 없었어요.",
		"A un cruce de la final. Esta sala va a tardar en olvidarlo.": "결승까지 한 고비. 이 방은 오래도록 잊지 못할 거예요.",
		"{0} os deja fuera. Se acabó la liguilla y con ella el año.": "{0}에게 탈락. 리기야가 끝났고, 시즌도 함께 끝났어요.",
		"Una liga entera para perderla en la última noche. La vuelta al campo la dan ellos.": "리그 한 시즌을 통째로 마지막 밤에 잃었어요. 경기장을 도는 건 저들이에요.",
		"{0} gana la liguilla y la liga; {1} fue superlíder": "{0}, 리기야와 리그 석권; 정규리그 1위는 {1}",
		"{0} es Campeón de Campeones": "{0}, 챔피언 중의 챔피언",
		"{0} es Campeón de Campeones ante {1}": "{0}, {1} 꺾고 챔피언 중의 챔피언",
		"Del 1º al 8º, a cuartos.": "1~8위는 8강 진출.",
	},


	"golpeo_puntero": {
		"Jala el stick derecho y suelta para tirar": "오른쪽 스틱을 당겼다 놓으면 슈팅",
		"Jala el stick derecho y suelta para centrar": "오른쪽 스틱을 당겼다 놓으면 크로스",

		"Jala el stick izquierdo y suelta para tirar": "왼쪽 스틱을 당겼다 놓으면 슈팅",
		"Jala el stick izquierdo y suelta para centrar": "왼쪽 스틱을 당겼다 놓으면 크로스",


		"Apunta con el stick · pulsa el botón": "스틱으로 조준 · 버튼 누르기",
		"CENTRO · apunta y pulsa el botón": "크로스 · 조준하고 버튼 누르기",
	},

	"pingpong_matt": {
		"pingpong_mattRETO DE MATT": "MATT 대결",
		"pingpong_mattENTRENO": "연습",
		"pingpong_mattDESAFIO": "도전",
		"pingpong_mattLEYENDA": "레전드",
		"pingpong_mattVENCISTE A MATT": "MATT 격파",
		"pingpong_mattGANO MATT": "MATT 승리",
		"pingpong_mattSAQUE DE MATT": "MATT 서브",
		"pingpong_mattPUNTO PARA MATT": "MATT 득점",
		"pingpong_mattATAQUE": "공격",
		"pingpong_mattMATT ATACA": "MATT 공격",
		"pingpong_mattVICTORIAS": "승리",
		"pingpong_mattRECORD": "기록",
		"pingpong_mattCAMPEON": "챔피언",
		"pingpong_mattINTERCAMBIO: {0}": "랠리: {0}",
		"pingpong_mattMueve la pala. Toca para sacar.": "라켓을 움직여요. 탭해서 서브.",
		"pingpong_mattCentro: ataque. Lateral: colocación.": "가운데: 공격. 가장자리: 코스 조절.",
	},
	"museo_visita": {
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida se borra; su museo queda disponible para visitar. Esto no se puede deshacer.": "홀에는 그 명판이 남아요: 기록, 트로피, 클럽. 세이브는 삭제되지만, 그 박물관은 계속 방문할 수 있어요. 되돌릴 수 없어요.",
		"MEJOR TEMPORADA": "최고의 시즌",
		"Por premios, media y aportación.": "수상, 능력치, 기여도 기준.",
		"ELIGE DOS CARRERAS": "커리어 2개 선택",
		"ELIGE OTRA CARRERA": "다른 커리어 선택",
		"COMPARAR CARRERAS": "커리어 비교",
		"CAMBIAR CARRERAS": "커리어 변경",
		"DERROTAS": "패배",
		"EMPATES": "무승부",
		"VICTORIAS": "승리",
		"RECONOCIMIENTOS": "영예",
		"LEYENDA DEL CLUB": "클럽 레전드",
		"LEYENDA DE LA LIGA": "리그 레전드",
		"LEYENDA DE LA SELECCIÓN": "대표팀 레전드",
		"RÉCORDS REGISTRADOS": "세운 기록",
		"MEJOR DE LA HISTORIA": "역대 최고",
		"TROFEOS": "트로피",
		"PREMIOS": "수상 내역",
		"POR EQUIPO": "팀별",
		"No se conservaron las estadísticas por temporada.": "시즌별 기록이 보존되지 않았어요.",
		"V": "W",
		"D": "L",
		"VISITAR MUSEO": "박물관 방문",
		"SALAS": "전시실",
		"VESTÍBULO": "로비",
		"HAT-TRICKS": "해트트릭",
		"TU MUSEO": "내 박물관",
		"ESTÁS AQUÍ": "현재 위치",
		"VISITAR SALA": "전시실 방문",
		"TOCA PARA EXPLORAR": "탭해서 둘러보기",
	},
	"coleccion_pistas": {
		"TIROS LIBRES": "프리킥",
		"CÓRNERS": "코너킥",
		"SAQUES DE BANDA": "스로인",
		"INDIRECTAS": "간접 프리킥",
		"MANO A MANO": "일대일",
		"TIRO FRONTAL": "정면 슈팅",
		"TIRO LEJANO": "중거리 슈팅",
		"TIRO CRUZADO": "사선 슈팅",
		"CONTRAS": "역습",
		"CENTROS": "크로스",
		"PRIMERA OCASIÓN": "첫 기회",
		"GOLES DE TU EQUIPO": "우리 팀 골",
		"GOLES DEL RIVAL": "상대 골",
		"{0} GANANDO": "이기고 있을 때 {0}",
		"{0} SIN GANAR": "이기지 못할 때 {0}",
		"{0} DESDE EL {1}'": "{1}' 이후 {0}",
		"{0} HASTA EL {1}'": "{1}' 이전 {0}",
		"CUÁNDO": "언제",
		"EN DERBIS": "더비에서",
		"DE VISITANTE": "원정에서",
		"SÓLO EN CLUB": "클럽 경기만",
		"EXPULSIONES": "퇴장",
		"OCASIÓN FALLADA": "놓친 기회",

		"PISTA: {0}": "힌트: {0}",
		"BALONES PARA TI": "받은 공",
		"LESIONES": "부상",
		"GASTO DE ENERGÍA": "에너지 소모",
		"TE SIENTA BAJO": "이하면 벤치행",
		"RECUPERACIÓN": "회복",
		"PUESTO HASTA LOS 23": "23세까지 입지",
		"PUESTO SIN SU CONFIANZA": "신뢰 전 입지",
		"JORNADAS EN LA GRADA": "명단 제외 라운드",
		"TRAS GANAR": "승리 후",
		"REPITE EL ONCE": "같은 선발 유지",
		"BRONCA TRAS MAL PARTIDO": "부진 후 질책",
		"AFICIÓN Y PRENSA AL PERDER": "패배 후 팬과 언론",
		"MEJORA DE CONTRATO": "계약 개선",
		"CAMBIO DE DIBUJO": "포메이션 변경",
		"Ser generoso desde los once metros también tiene premio.": "11미터 거리에서 너그러워지는 것도 보상이 있어요.",
		"En la cantera hay un chaval que necesita a alguien que crea en él.": "유스팀에 자신을 믿어줄 사람이 필요한 아이가 있어요.",
		"Desde los once metros, a veces el balón es sólo tuyo.": "11미터 거리에선, 가끔 공은 오직 당신 거예요.",
		"Ningún partido está perdido aunque vayas dos goles abajo.": "두 골 뒤져도 끝난 경기는 없어요.",
		"Los de la tele graban muy pegados a la línea de fondo.": "TV 중계진은 엔드라인에 바짝 붙어 촬영해요.",
		"No todo balón tiene que acabar en la portería rival.": "모든 공이 상대 골문으로 가야 하는 건 아니에요.",
		"El portero deja algo para beber junto a su poste.": "골키퍼는 골대 옆에 마실 걸 놔둬요.",
		"En una final, alguien de la grada quiere un recuerdo contigo.": "결승전에서, 관중석의 누군가가 당신과의 기념품을 원해요.",
		"A veces se posan visitas con alas sobre el césped.": "가끔 날개 달린 손님이 잔디에 내려앉아요.",
		"Arriba, los del palco miran el partido detrás de un cristal.": "높은 곳, VIP석 손님들은 유리창 너머로 경기를 봐요.",
		"El que te devuelve los balones espera junto a la banda.": "볼보이는 터치라인 옆에서 기다려요.",
		"Al acabar un derbi, mira lo que pasa entre los dos banquillos.": "더비가 끝나면, 두 벤치 사이에서 무슨 일이 벌어지는지 보세요.",
		"En el apretón del derbi, el que aprieta más gana.": "더비 악수에선 더 세게 쥐는 쪽이 이겨요.",
		"El banquillo de enfrente también está a tiro.": "상대 벤치도 사정권이에요.",
		"Tu propio banquillo también está a tiro.": "우리 벤치도 사정권이에요.",
		"El míster de enfrente grita de pie en su área técnica.": "상대 감독은 기술 지역에 서서 소리쳐요.",
		"Tu propio míster también está de pie en la banda.": "우리 감독도 터치라인에 서 있어요.",
		"A fuerza de balonazos, un banquillo se puede vaciar.": "공을 계속 날리다 보면 벤치가 텅 빌 수도 있어요.",
		"Entre la hierba asoman las cabezas del riego.": "잔디 사이로 스프링클러 머리가 삐죽 나와 있어요.",
		"En la grada hay vasos llenos, y los balones que se van caen en algún sitio.": "관중석엔 가득 찬 컵들이 있고, 빗나간 공은 어딘가에 떨어지죠.",
		"En la grada alguien pasea con una bandeja de comida.": "관중석에서 누군가 음식 쟁반을 들고 돌아다녀요.",
		"Si la grada te abuchea, contéstale donde más duele.": "관중이 야유하면, 가장 아픈 곳으로 답해 주세요.",
		"En algunos campos de barrio no hay nada detrás del arco.": "어떤 동네 경기장은 골대 뒤에 아무것도 없어요.",
		"No todas las finales acaban con la copa en tus manos.": "모든 결승이 컵을 손에 쥐고 끝나는 건 아니에요.",
		"Si un club te quita una final, búscalo en otra.": "어떤 클럽이 결승을 빼앗아 갔다면, 다른 결승에서 다시 만나세요.",
		"Una Nueva Carrera+ con ventajas, jugada hasta el último día.": "혜택이 있는 새 커리어+, 마지막 날까지 플레이.",
		"En tu casa hay un volante esperando: ni frenos ni hierba.": "집에 핸들이 기다리고 있어요: 브레이크도 잔디도 없어요.",
		"La maquinita de tu casa guarda un récord por batir.": "집의 오락기에 깨야 할 기록이 남아 있어요.",
		"La diana de tu casa premia la puntería fina.": "집의 다트판은 정교한 조준에 보상해요.",
		"Hay balones sueltos por el banquillo, y el míster no siempre mira.": "벤치 주변에 굴러다니는 공이 있고, 감독이 늘 보고 있는 건 아니에요.",
		"En el billar de tu casa, no dejes jugar al rival.": "집 당구대에선 상대에게 칠 기회를 주지 마세요.",
		"Si te casas, piensa bien a nombre de quién pones la casa.": "결혼한다면, 집 명의를 누구로 할지 잘 생각하세요.",
		"De visita, tarde y perdiendo por la mínima, el balón tarda en volver.": "원정에서, 경기 막판 한 골 차로 지고 있으면 공이 좀처럼 돌아오지 않아요.",
	},
	"tapetes_formas": {
		"TAPETE OVALADO": "타원형 러그",
		"Lana de contorno oval, con borde tejido y centro suave.": "짜인 테두리와 부드러운 가운데의 타원형 울 러그.",
		"TAPETE HEXAGONAL": "육각형 러그",
		"Seis lados y franjas concéntricas para vestir un rincón.": "여섯 변과 동심원 줄무늬로 구석을 꾸며요.",
		"TAPETE ORGÁNICO": "오가닉 러그",
		"Curvas suaves e irregulares, como una piedra de río.": "강돌처럼 부드럽고 불규칙한 곡선.",
		"TAPETE DE PASILLO": "러너 러그",
		"Tejido alargado con esquinas redondas y bandas claras.": "둥근 모서리와 밝은 줄무늬의 긴 직물.",
		"el tapete no puede atravesar una pared": "러그는 벽을 넘을 수 없어요",
	},
	"decoracion_salon": {
		"TAPETE REDONDO": "원형 러그",
		"TAPETE TEJIDO": "직조 러그",
		"BOCINAS DE TORRE": "타워 스피커",
		"BOCINAS DE ESTANTE": "북쉘프 스피커",
		"LIBRERO ABIERTO": "오픈 책장",
		"LIBRERO MODULAR": "모듈형 책장",
		"Yute trenzado en círculos. Va debajo de mesas y sillones.": "원형으로 짠 황마. 테이블과 안락의자 밑에 깔아요.",
		"Lana con rombos y flecos. Viste el suelo sin estorbar el paso.": "마름모 무늬와 술 장식의 울. 통행을 방해하지 않고 바닥을 꾸며요.",
		"Dos torres de audio con conos y puertos al frente.": "앞쪽에 유닛과 덕트가 달린 타워 스피커 두 대.",
		"Dos bocinas compactas y receptor sobre un mueble bajo.": "낮은 장 위에 놓인 소형 스피커 두 개와 리시버.",
		"Madera y tubos oscuros, con baldas abiertas para libros.": "원목과 어두운 파이프, 책을 꽂는 오픈 선반.",
		"Cubos, cajones y libros en una composición de madera.": "큐브, 서랍, 책으로 꾸민 원목 구성.",
	},
	"nivel_club": {
		"TU NIVEL EN EL CLUB": "내 클럽 레벨",
		"CON VOZ": "발언권",
		"DE CONFIANZA": "신뢰",
		"HOMBRE DE LA CASA": "클럽의 기둥",
		"Subes de nivel en el club: {0}.": "클럽 레벨이 올랐어요: {0}.",
		"Bajas de nivel en el club: {0}.": "클럽 레벨이 내려갔어요: {0}.",
		"Pierdes el brazalete del club.": "클럽 주장 완장을 잃었어요.",
		"Tu peso en el club te deja pedir número sin esperar a renovar. Llevas el {0}: uno libre es tuyo; el de un compañero, depende de él.": "클럽 내 입지 덕분에 재계약을 기다리지 않고도 등번호를 요청할 수 있어요. 지금 등번호는 {0}번: 비어 있는 번호는 바로 내 것, 동료의 번호는 그 선수에게 달렸어요.",
		"{0} no te cede el {1}. Sigues con el {2}.": "{0} 선수가 {1}번을 양보하지 않았어요. {2}번을 계속 달아요.",
		"{0} te cede el {1}.": "{0} 선수가 {1}번 양보.",
		"El club ya te dijo que no a este fichaje en esta ventana.": "이번 이적 시장에서 클럽이 이미 이 영입을 거절했어요.",
		"Acabas de llegar: el club aún no te consulta los fichajes. Con {0} de relación pasas a {1} y puedes proponerlos.": "막 입단했어요: 클럽이 아직 영입에 대해 의견을 묻지 않아요. 관계 {0}에 도달하면 {1} 단계가 되어 영입을 제안할 수 있어요.",
		"EN RIESGO": "위험",
		"ES EL NIVEL {0}: VAS EN EL {1}": "레벨 {0} 필요: 현재 {1}",
		"TE FALTAN {0} DE RELACIÓN": "관계 {0} 부족",
		"TITULAR EL {0} %: PIDE {1} %": "선발 {0} %: 필요 {1} %",
		"NO ERES TITULAR": "선발 아님",
		"Venderlo, protegerlo o pedir que lo renueven es del nivel {0}: {1} de relación con el club.": "판매, 보호, 재계약 요청은 레벨 {0}부터: 클럽과의 관계 {1}.",
		"Vender es del nivel {0}: {1} de relación con el club.": "판매는 레벨 {0}부터: 클럽과의 관계 {1}.",
		"Pedir otro técnico es del nivel {0}: {1} de relación con el club.": "감독 교체 요청은 레벨 {0}부터: 클럽과의 관계 {1}.",
		"Ya lo pediste esta temporada.": "이번 시즌엔 이미 요청했어요.",
		"Antes, contesta lo que tienes pendiente.": "먼저 대기 중인 일에 답하세요.",
		"PEDIR OTRO DORSAL": "등번호 변경 요청",
		"Con tu nivel, el club decide cada fichaje al confirmar: {0} % de que diga que sí. Al que rechace no se le vuelve a proponer en esta ventana.": "내 레벨에서는 확정할 때 클럽이 영입마다 결정해요: 수락 확률 {0} %. 거절당한 선수는 이번 이적 시장에서 다시 제안할 수 없어요.",
		"VENDER": "판매",
		"EL CLUB DIJO NO": "클럽이 거절",
		"relación": "관계",
		"nivel": "레벨",
		"El {0} lo lleva {1}. Toca otra vez y se lo pides: hay un {2} % de que te lo ceda.": "{0}번은 {1} 선수가 달고 있어요. 한 번 더 탭하면 요청해요: 양보할 확률 {2} %.",
		"El {0} lo lleva {1}. Mantén y se lo pides: hay un {2} % de que te lo ceda.": "{0}번은 {1} 선수가 달고 있어요. 길게 누르면 요청해요: 양보할 확률 {2} %.",
		"TU NIVEL: {0}": "내 레벨: {0}",
		"BAJAS DE NIVEL EN EL CLUB": "클럽 레벨 하락",
		"PIDES OTRO DORSAL": "등번호 변경",
		"TU PETICIÓN": "요청",
		"El club te dio la voz y el vestuario la reconoce. Ahora la cinta es tuya.": "클럽이 발언권을 주었고 라커룸도 인정해요. 이제 주장 완장은 내 거예요.",
		"VES LA MESA": "테이블 열람",
		"PROPONES FICHAJES": "영입 제안",
		"COMPRAS Y VENTAS": "영입과 판매",
		"OTRO DORSAL": "등번호 변경",
		"OTRO TECNICO": "감독 교체",
		"PRIMA FIDELIDAD": "충성 보너스",
		"GRADA FIEL": "충성 팬",
		"MAS MARGEN": "여유 확대",
		"Pediste salir: el club ya no te consulta su plantilla.": "이적을 요청했어요: 클럽이 더 이상 스쿼드에 대해 의견을 묻지 않아요.",
		"Prima de fidelidad": "충성 보너스",
		"CEDIDO: TU NIVEL TE ESPERA": "임대 중: 레벨 유지",
		"BAJAS EN {0}": "하락까지 {0}",
		"PROMETIDO AL VETERANO": "베테랑에게 약속됨",
		"CLUB NUEVO": "새 클럽",
		"Una vez por temporada.": "시즌당 한 번.",
	},
	"mesa_fichajes": {
		"BUSCAR EN EL RANKING": "랭킹에서 찾기",
		"Los fichajes se marcan con + en el ranking.": "영입 대상은 랭킹에 +로 표시돼요.",
		"VENDER ({0})": "판매 ({0})",
		"CONFIRMAR ({0})": "확정 ({0})",
		"{0} SIN CONFIRMAR": "미확정 {0}",
		"Es tu último {0}: sin él no hay quien juegue ahí.": "마지막 {0} 선수예요: 그가 없으면 그 자리에서 뛸 선수가 없어요.",
		"Estás cedido: tu club no te pregunta por sus fichajes.": "임대 중이에요: 소속 클럽이 영입에 대해 묻지 않아요.",
		"FICHADOS": "영입됨",
		"VENDIDOS": "판매됨",
		"FICHAJES ({0})": "영입 ({0})",
		"VENTAS ({0})": "판매 ({0})",
		"FICHAR EN LA MESA": "영입 표시",
		"VENDER EN LA MESA": "판매 표시",
		"QUITAR DE LA MESA": "표시 해제",
		"FICHAS": "영입",
		"VENDES": "판매",
		"FIRMO ESTE AÑO": "올해 영입",
		"Firmaste con otro club: la plantilla del año que viene ya no la haces tú.": "다른 클럽과 계약했어요: 다음 시즌 스쿼드는 더 이상 내가 짜지 않아요.",
		"Firmó esta temporada: no se vende hasta la próxima.": "이번 시즌에 계약했어요: 다음 시즌까지 판매할 수 없어요.",
		"Juega aquí cedido: no es tuyo para venderlo.": "임대로 뛰고 있어요: 내가 팔 수 있는 선수가 아니에요.",
		"LA MESA": "이적 협상",
		"La plantilla quedaría en {0}: el máximo es {1}.": "스쿼드가 {0}명이 돼요: 최대 {1}명이에요.",
		"La plantilla quedaría en {0}: el mínimo es {1}.": "스쿼드가 {0}명이 돼요: 최소 {1}명이에요.",
		"Lo pide tu técnico: si llega, te lo apunta.": "감독이 원하는 자리예요: 영입하면 감독이 기억해 줘요.",
		"Si fichas a uno de esa línea, el técnico te lo apunta.": "그 라인의 선수를 영입하면 감독이 기억해 줘요.",
		"Marca a quién vendes y a quién fichas.": "판매할 선수와 영입할 선수를 표시하세요.",
		"Marcado ({0}). Te faltan {1}.": "표시됨 ({0}). {1} 부족해요.",
		"Marcado ({0}). Te queda {1}.": "표시됨 ({0}). {1} 남았어요.",
		"Mercado cerrado. La mesa abre con la próxima ventana, que dura {0} {1}.": "이적 시장 마감. 테이블은 다음 이적 시장과 함께 열려요. 기간은 {0} {1}.",
		"Mercado cerrado: la mesa abre con la próxima ventana.": "이적 시장 마감: 테이블은 다음 이적 시장과 함께 열려요.",
		"NO QUIERE VENIR": "이적 거부",
		"NO QUISO VENIR": "제안 거절",
		"NO SALIERON": "무산",
		"Nada de lo marcado sale hoy: mira los avisos en rojo.": "표시한 거래 중 오늘 성사되는 게 없어요: 빨간 경고를 확인하세요.",
		"Nadie lo compra hoy a ese precio.": "오늘은 그 가격에 사려는 곳이 없어요.",
		"No hay vuelta atrás: se mueve todo a la vez.": "되돌릴 수 없어요: 모든 거래가 한꺼번에 진행돼요.",
		"No quiere venir: interés {0} % (mínimo {1} %).": "오고 싶어 하지 않아요: 관심도 {0}% (최소 {1}%).",
		"PRESUPUESTO": "예산",
		"QUEDA": "잔액",
		"QUEDA EN LA MESA": "남은 예산",
		"SIN COMPRADOR": "구매자 없음",
		"SIN DINERO": "자금 부족",
		"Sin club no hay mesa de fichajes.": "클럽이 없으면 이적 테이블도 없어요.",
		"Está cedido: quien lo tiene no lo puede vender.": "임대 중이에요: 데리고 있는 클럽이 팔 수 없어요.",
		"Su club no lo vende: sólo sale pagando su cláusula.": "소속 클럽이 팔지 않아요: 바이아웃 조항을 지불해야만 떠나요.",
		"Te faltan {0}: vende a alguien o quita un fichaje.": "{0} 부족해요: 누군가를 팔거나 영입을 하나 빼세요.",
		"Te pagan un {0} % menos de lo que vale: el comprador sabe que tienes prisa.": "제값보다 {0}% 덜 받아요: 구매자가 내가 급한 걸 알고 있어요.",
		"ULTIMO {0}": "마지막 {0}",
		"VA AL {0}": "{0} 이적",
		"Va al {0} por {1} cuando confirmes la mesa.": "테이블을 확정하면 {1}에 {0} 클럽으로 이적해요.",
		"Ventana abierta: {0} {1} por delante. Nada se mueve hasta que confirmes.": "이적 시장 오픈: 앞으로 {0} {1}. 확정할 때까지 아무것도 진행되지 않아요.",
		"Ya juega en tu club.": "이미 우리 클럽에서 뛰고 있어요.",
		"DEF": "DEF",
		"MED": "MID",
		"DEL": "FWD",
	},
	"surf_casa": {
		"ALBERCA DE OLAS": "파도 풀장",
		"Alberca decorativa con olas en movimiento, agua translúcida y espuma. Incluye generador y tabla.": "파도가 움직이는 장식용 풀장. 반투명한 물과 물거품. 파도 생성기와 서핑보드 포함.",
	},
	"penthouse_tecnologia": {
		"SEMANA {0}": "{0}주차",
		"SOFÁ PENTHOUSE": "펜트하우스 소파",
		"Sofá modular de piel crema, nogal y latón. Recibe visitas en tu salón.": "크림색 가죽, 호두나무, 황동으로 만든 모듈형 소파. 거실에서 손님을 맞이해요.",
		"COMEDOR PENTHOUSE": "펜트하우스 식탁",
		"Mesa de mármol negro con seis sillas de piel y detalles de latón.": "검은 대리석 테이블과 가죽 의자 여섯 개, 황동 장식.",
		"CAMA PENTHOUSE": "펜트하우스 침대",
		"Cama flotante de nogal con cabecero iluminado. Permite dormir de verdad.": "조명 헤드보드가 달린 호두나무 플로팅 침대. 진짜로 잠을 잘 수 있어요.",
		"ROBOT ASPIRADOR": "로봇 청소기",
		"Robot con base de carga. Recorre el suelo libre al colocarlo en casa.": "충전 스테이션 포함. 집에 놓으면 빈 바닥을 돌아다녀요.",
		"ESPEJO INTELIGENTE": "스마트 미러",
		"Espejo de pie con pantalla: consulta tu estado y los próximos partidos.": "화면이 달린 전신 거울: 내 상태와 다음 경기를 확인해요.",
		"MESA HOLOGRÁFICA": "홀로그램 테이블",
		"Mesa táctica con proyección 3D. Explora cuatro formaciones y gira la vista.": "3D 투영 전술 테이블. 네 가지 포메이션을 살펴보고 시점을 돌려요.",
		"CONSULTAR ESPEJO": "거울 보기",
		"EXPLORAR TÁCTICA": "전술 살펴보기",
		"TECNOLOGÍA": "테크놀로지",
		"Compra este objeto para usarlo.": "사용하려면 이 아이템을 구매하세요.",
		"ENERGÍA {0}/100": "에너지 {0}/100",
		"ÁNIMO {0} · LESIÓN: {1} SEMANAS": "사기 {0} · 부상: {1}주",
		"PRÓXIMOS PARTIDOS": "다음 경기",
		"No hay partidos programados.": "예정된 경기가 없어요.",
		"FECHA POR CONFIRMAR": "날짜 미정",
		"Tu estado se actualiza cada vez que consultas el espejo.": "거울을 볼 때마다 상태가 업데이트돼요.",
		"CAMBIAR ESQUEMA": "포메이션 변경",
		"VISTA INICIAL": "시점 초기화",
		"Gira el campo con el dedo. Los esquemas son de consulta.": "손가락으로 경기장을 돌려 보세요. 포메이션은 보기 전용이에요.",
		"FORMACIÓN {0}": "포메이션 {0}",
		"ÁNIMO {0} · LESIÓN: {1} DÍAS": "사기 {0} · 부상: {1}일",
	},
	"basket_reloj": {
		"SEGUIDAS": "연속",
		"CANASTAS": "성공",
		"LIMPIAS": "클린샷",
		"TIRO {0}/10": "슛 {0}/10",
		"POSICIÓN {0}/5": "위치 {0}/5",
		"Desliza hacia el aro y suelta.": "링을 향해 스와이프하고 손을 떼세요.",
		"2 por canasta · 3 limpia · +1 cada 3 seguidas": "성공 2점 · 클린샷 3점 · 3연속마다 +1",
		"¡LIMPIA!": "클린샷!",
		"CORTO · MÁS FUERZA": "짧아요 · 더 세게",
		"LARGO · MENOS FUERZA": "길어요 · 더 약하게",
		"IZQUIERDA · AJUSTA EL GESTO": "왼쪽 · 동작 조절",
		"DERECHA · AJUSTA EL GESTO": "오른쪽 · 동작 조절",
		"+{0} PUNTOS": "+{0}점",
		"{0} PUNTOS · {1}/10": "{0}점 · {1}/10",
		"MEJOR RACHA {0} · LIMPIAS {1}": "최고 연속 {0} · 클린샷 {1}",
		"RÉCORD DE SESIÓN": "세션 최고 기록",
		"TIRO FALLADO": "슛 실패",
		"CANASTA DE BASKET": "농구 골대",
		"RELOJ DE PIE": "괘종시계",
		"Canasta con tablero, red y balón. Diez tiros haciendo flick hacia el aro.": "백보드, 그물, 공이 달린 농구 골대. 링을 향해 플릭해서 슛 10번.",
		"Reloj decorativo de madera con esfera, péndulo y pesas de latón.": "문자판, 진자, 황동 추가 달린 장식용 원목 시계.",
		"JUGAR BASKET": "농구 하기",
		"BASKET": "농구",
		"Toca el balón, haz flick hacia el aro y suelta.": "공을 터치하고 링을 향해 플릭한 뒤 손을 떼세요.",
		"TIRO {0}/10 · CANASTAS {1}": "슛 {0}/10 · 성공 {1}",
		"Compra una canasta para jugar.": "농구 골대를 사야 플레이할 수 있어요.",
		"DIEZ TIROS · CINCO POSICIONES": "슛 10번 · 위치 5곳",
		"{0}/10 CANASTAS · MEJOR RACHA {1}": "{0}/10 성공 · 최고 연속 {1}",
		"OTRA RONDA": "한 판 더",
		"DESLIZA HACIA LA CANASTA": "골대를 향해 스와이프",
		"Desliza el balón hacia la canasta. Más rápido, más fuerte.": "공을 골대 쪽으로 스와이프하세요. 빠를수록 강해요.",
		"TOCA EL BALÓN Y LANZA": "공을 터치하고 플릭",
		"¡CANASTA!": "골인!",
	},
	"pingpong_dedo": {
		"Mueve la raqueta con el dedo sobre la mesa. Toca para sacar.": "테이블 위에서 손가락으로 라켓을 움직이세요. 탭하면 서브해요.",
		"La raqueta sigue tu dedo. Golpea de lado para dirigir la pelota.": "라켓이 손가락을 따라가요. 가장자리로 치면 공 방향을 바꿀 수 있어요.",
	},
	"minijuegos_mandos": {
		"PARTIDA EN CURSO": "경기 진행 중",
		"SUAVE": "쉬움",
		"EXPERTO": "전문가",
		"CONTROL": "컨트롤",
		"ATAQUE": "공격",
		"MEJOR INTERCAMBIO: {0}": "최고 랠리: {0}",
		"Centra la pala para atacar; de canto, bloqueas suave.": "라켓 중앙으로 치면 공격, 가장자리로 치면 약하게 막아요.",
		"La pelota tocó la red.": "공이 네트에 걸렸어요.",
		"La pelota salió de la mesa.": "공이 테이블 밖으로 나갔어요.",
		"La pala no llegó a la pelota.": "라켓이 공을 놓쳤어요.",
		"La pelota botó dos veces.": "공이 두 번 튀었어요.",
		"La pelota botó en el campo propio.": "공이 친 사람 쪽 코트에 튀었어요.",
		"El saque no botó en ambos campos.": "서브가 양쪽 코트에 튀지 않았어요.",
		"PUNTO DE PARTIDO": "매치 포인트",
		"ARRASTRA PARA GIRAR · SUELTA PARA CENTRAR": "드래그로 조향 · 떼면 중앙",
		"FUERA DEL ASFALTO: VUELVE A LA PISTA": "도로 이탈: 트랙으로 복귀",
		"CONTROL {0} · {1} s": "체크포인트 {0} · {1} s",
		"CONTROL PERDIDO · PUEDES REINICIAR EN PAUSA": "체크포인트 놓침 · 일시정지에서 재시작 가능",
		"Avance automático. Arrastra para girar y toca el freno.": "자동 주행. 드래그로 방향을 바꾸고 브레이크를 탭하세요.",
		"PRÓXIMO CONTROL: {0} m": "다음 체크포인트: {0} m",
		"META: {0} m": "결승선: {0} m",
	},


	"clausulas": {
		"NEGOCIAR CLÁUSULAS": "조항 협상",
		"MANTÉN PARA PRESENTAR": "길게 눌러 제출",
		"Hasta {0}.": "최대 {0}.",
		"ACEPTAN": "수락",
		"CONTRAOFERTA": "역제안",
		"×1": "×1",
		"×1,5": "×1.5",
		"×2": "×2",
		"×3": "×3",
		"NO JUEGAN CON ESE PUESTO": "전술에 없는 포지션",
		"SU TITULAR ES MUCHO MEJOR": "주전이 훨씬 나음",
		"ESPERAS SU RESPUESTA": "답변 대기 중",
		"YA NEGOCIASTE LAS CLÁUSULAS": "조항 협상 완료",
		"SIN MESA ABIERTA": "열린 협상 없음",
		"YA NEGOCIASTE ESTE AÑO": "올해 협상 완료",
		"Ya negociaste tus cláusulas esta temporada.": "이번 시즌엔 이미 조항을 협상했어요.",
		"RENOVAR EN AGENTE": "에이전트로 재계약",
		"RENEGOCIAR EN AGENTE": "에이전트로 재협상",
	},


	"avisos_hoy": {
		"HOY, EL TÍTULO": "오늘, 우승 결정",
		"HOY, EL ASCENSO": "오늘, 승격 결정",
		"HOY, LA SALVACIÓN": "오늘, 잔류 결정",
		"GANA Y LO SELLAS": "이기면 확정",
		"UN PUNTO BASTA": "비겨도 충분",
		"COMPRA UN MUEBLE": "가구 구매",
		"MIRA QUIÉN TE SIGUE": "누가 지켜보나 확인",
	},


	"alineaciones": {
		"ALINEACIONES": "선발 명단",
	},


	"radio": {
		"TEMA DEL JUEGO": "메인 테마",
		"LUCES DEL ESTADIO": "경기장의 불빛",
		"CAMINO A LA GLORIA": "영광으로 가는 길",
		"DOMINGO DE SOL": "화창한 일요일",
		"NOCHE LARGA": "긴 밤",
		"SEMANA DE FINAL": "결승 주간",
		"VENTANA DE FICHAJES": "이적 시장",
		"LEVANTAR LA COPA": "컵을 들어 올려라",
		"NOCHE DE COPA": "컵 대회의 밤",
		"NOCHE DE ESTRELLAS": "별들의 밤",
		"JUEVES EUROPEO": "유럽의 목요일",
		"CAMINO EUROPEO": "유럽으로 가는 길",
		"RADIO": "라디오",
		"TOCA PARA CAMBIAR DE TEMA": "탭해서 곡 변경",
		"AL AZAR": "랜덤 재생",
		"Cada título que ganes suma su himno a la música del vestuario.": "우승할 때마다 그 대회의 주제가가 라커룸 음악에 추가돼요.",
		"CAMPO AL AMANECER": "새벽의 경기장",
		"LLUVIA SUAVE": "보슬비",
		"HIERBA FRESCA": "싱그러운 잔디",
	},


	"resultado": {
		"SIN GOLES": "무득점",
		"PARADA": "선방",
		"PARADAS": "선방",
	},


	"promo": {
		"¿TIENES UN CODIGO?": "코드가 있나요?",
		"CANJEAR CODIGO": "코드 사용",
		"Escribe el código tal cual te lo dieron. Cada código se canjea una sola vez en este teléfono.": "받은 코드를 그대로 입력하세요. 코드는 이 휴대폰에서 한 번만 사용할 수 있어요.",
		"TU CODIGO": "내 코드",
		"CANJEAR": "사용",
		"COMPROBANDO...": "확인 중...",
		"Escribe un código.": "코드를 입력하세요.",
		"No encontramos ese código. Si es nuevo, conéctate a internet y vuelve a probar.": "그 코드를 찾을 수 없어요. 새 코드라면 인터넷에 연결하고 다시 시도하세요.",
		"Ese código ya no está activo.": "더 이상 사용할 수 없는 코드예요.",
		"Ese código ya caducó.": "기간이 만료된 코드예요.",
		"Ya canjeaste ese código en este teléfono.": "이 휴대폰에서 이미 사용한 코드예요.",
		"Ese código ya lo canjeó otra persona.": "다른 사람이 이미 사용한 코드예요.",
		"Este código va a una carrera: ábrela y canjéalo desde su tienda.": "커리어용 코드예요: 커리어를 열고 그 상점에서 사용하세요.",
		"Ese código no existe. Revisa que esté bien escrito.": "존재하지 않는 코드예요. 철자를 확인하세요.",
		"¡CODIGO CANJEADO!": "코드 사용 완료!",
		"+ {0} ★ EN TU HERENCIA": "+ {0} ★ 레거시에 추가",
		"ABIERTA EN TU HERENCIA: {0}": "레거시에서 해금: {0}",
	},
	"simulador_conduccion": {
		"Compra el simulador en CASA > COCHERA. Incluye un compacto para jugar.": "시뮬레이터는 집 > 차고에서 구매하세요. 플레이용 소형차 포함.",
		"Compacto incluido sólo para jugar. Tus compras desbloquean más coches.": "레이스 전용 소형차 포함. 차를 구매하면 더 많은 차가 해금돼요.",
		"Incluye un compacto para jugar y permite usar tus coches comprados. No gasta dinero ni acciones semanales.": "플레이용 소형차가 포함되고 구매한 차도 쓸 수 있어요. 돈도 주간 행동도 쓰지 않아요.",
		"Asiento deportivo, volante y tres pantallas. Incluye un compacto virtual; tus compras desbloquean más coches. Sin mantenimiento.": "레이싱 시트, 핸들, 스크린 세 개. 가상 소형차 포함, 차를 구매하면 더 많은 차가 해금돼요. 유지비 없음.",
		"AUTO · A/D GIRAR · S FRENAR": "자동 · A/D 조향 · S 브레이크",
		"NUEVO RÉCORD DE TIEMPO": "최고 기록 경신",
		"Sin récord: faltaron controles.": "기록 없음: 체크포인트를 놓쳤어요.",
		"As del volante": "운전의 달인",
		"Cruzar los tres controles del simulador y llegar antes del tiempo objetivo.": "시뮬레이터의 체크포인트 세 곳을 모두 통과하고 목표 시간 안에 완주하기.",
		"Primera Medalla": "첫 메달",
		"Sacar el oro en el simulador con el compacto urbano.": "시뮬레이터에서 시티 해치백으로 금메달 따기.",
		"Piloto de Domingo": "일요일 드라이버",
		"Terminar 25 vueltas en el simulador.": "시뮬레이터에서 25바퀴 완주하기.",
		"Vuelta Limpia": "클린 랩",
		"Terminar una vuelta del simulador sin salirte nunca del asfalto.": "시뮬레이터에서 한 번도 도로를 벗어나지 않고 한 바퀴 완주하기.",
		"Cazamonedas": "코인 헌터",
		"Recoger las 72 monedas en una vuelta del simulador.": "시뮬레이터 한 바퀴에서 코인 72개 모두 모으기.",
		"Pie a Fondo": "풀 스로틀",
		"Dar una vuelta con el hiperdeportivo sin tocar el freno ni salirte del asfalto.": "하이퍼카로 브레이크를 밟지도, 도로를 벗어나지도 않고 한 바퀴 돌기.",
		"Garaje de Oro": "황금 차고",
		"Sacar el oro en el simulador con los ocho coches.": "시뮬레이터에서 차 여덟 대 모두로 금메달 따기.",
		"MONEDAS {0}/{1} · {2}": "코인 {0}/{1} · {2}",
		"PUNTOS DE ESTA CARRERA": "이번 레이스 포인트",
		"CURVA CERRADA: FRENA": "급커브: 브레이크",
		"CONTROLES {0}/3 · OBJETIVO {1} s · MÁX. {2} km/h": "체크포인트 {0}/3 · 목표 {1} s · 최고 {2} km/h",
		"OBJETIVO CUMPLIDO": "목표 달성",
		"OBJETIVO PENDIENTE": "목표 미달성",
		"El coche acelera solo. Mantén un botón para girar y los dos a la vez para frenar.": "차가 알아서 가속해요. 버튼 하나를 누르고 있으면 방향을 바꾸고, 두 개를 동시에 누르면 브레이크예요.",
		"LOS DOS: FRENO": "둘 다: 브레이크",
		"CAMBIAR COCHE": "차 변경",
		"¡META!": "완주!",
		"¡BRONCE!": "브론즈!",
		"¡PLATA!": "실버!",
		"¡ORO!": "골드!",
		"MONEDAS {0}/{1}": "코인 {0}/{1}",
		"¡YA!": "출발!",
		"TU RÉCORD: {0} s": "내 기록: {0} s",
		"SIN RÉCORD TODAVÍA": "아직 기록 없음",
		"CORRES CONTRA TU FANTASMA": "고스트와 레이스 중",
		"SIGUIENTE MEDALLA: {0} s": "다음 메달: {0} s",
		"SIN MEDALLA": "메달 없음",
		"MEDALLA DE BRONCE": "동메달",
		"MEDALLA DE PLATA": "은메달",
		"MEDALLA DE ORO": "금메달",
	},


	"menu": {
		"SIMULADOR DE CARRERAS": "레이싱 시뮬레이터",
		"Asiento deportivo, volante y tres pantallas. Conduce sólo los coches que has comprado. Sin mantenimiento.": "레이싱 시트, 핸들, 스크린 세 개. 구매한 차만 운전할 수 있어요. 유지비 없음.",
		"Conduce los coches de tu colección. No gasta dinero ni acciones semanales.": "내 컬렉션의 차를 운전해요. 돈도 주간 행동도 쓰지 않아요.",
		"CONDUCIR": "운전",
		"SALIR": "나가기",


		"ligaSALIR": "탈퇴",
		"FRENAR": "브레이크",
		"ACELERAR": "가속",
		"SIN COCHES": "차 없음",
		"OTRA CARRERA": "다시 레이스",
		"Sólo tus coches. Sin gastos ni acciones semanales.": "내 차만. 비용도 주간 행동도 없어요.",
		"Compra el simulador y un coche en CASA > COCHERA.": "시뮬레이터와 차는 집 > 차고에서 구매하세요.",
		"Llega a la meta. Salir del asfalto te frena.": "결승선까지 달리세요. 도로를 벗어나면 느려져요.",
		"Mantén ACELERAR y dirige. Flechas o WASD en teclado.": "가속을 누르고 방향을 조종하세요. 키보드는 방향키나 WASD.",
		"META: {0} s · MEJOR DE ESTA SESIÓN: {1} s": "결승: {0} s · 세션 최고: {1} s",
		"COCHERA": "차고",
		"COCHES": "차량",
		"La ampliación está ocupada. No se moverá tu construcción.": "확장 공간이 사용 중이에요. 건물은 옮겨지지 않아요.",

		"COPIADO · PÉGALO DONDE QUIERAS": "복사됨 · 원하는 곳에 붙여넣기",

		"NOVEDADES": "새 소식",
		"VERSIÓN {0}": "버전 {0}",

		"POTENCIAL": "잠재력",
		"CONTACTO": "연락처",
		"REDES": "SNS",
		"CORREO": "이메일",
		"¿Una idea, un fallo o sólo quieres saludar? Escríbeme directo.": "아이디어가 있거나, 버그를 찾았거나, 그냥 인사하고 싶나요? 직접 메시지 보내 주세요.",





		"ESTE ESTADIO NO SABE TU NOMBRE.": "이 경기장은 아직 내 이름을 몰라요.",



		"¿CÓMO TE LLAMAS?": "이름이 뭐예요?",
		"ESO EMPIEZA HOY.": "오늘부터 알게 될 거예요.",
		"IDIOMA": "언어",
		"RANURA {0}": "슬롯 {0}",


		"HOY, DERBI": "더비 데이",
		"HOY, DERBI · {0}": "더비 데이 · {0}",
		"ACTIVA": "진행 중",
		"CONTINUAR": "계속",
		"VER LEGADO": "레거시 보기",
		"Ranura libre.": "빈 슬롯.",
		"+ NUEVA CARRERA": "+ 새 커리어",
		"{0} AÑOS": "{0}세",
		"SIN CLUB": "클럽 없음",
		"Sin club": "클럽 없음",
		"MÁS": "기타",
		"OTRAS RANURAS": "다른 슬롯",
		"PRÁCTICA": "연습",
		"AJUSTES": "설정",
		"LOGROS": "업적",
		"COLECCIÓN": "컬렉션",
		"EDITOR": "에디터",

		"CLUB Y PAIS": "클럽과 국가",
		"TODOS": "전체",
		"PENDIENTES": "미달성",
		"LOGRADOS": "달성",
		"A PUNTO DE CAER": "달성 임박",



		"{0} % del mundo": "플레이어 {0}% 달성",
		"Logro secreto. Sigue jugando para descubrirlo.":
			"비밀 업적. 계속 플레이하면 공개돼요.",

		"Preparando el estadio…": "경기장 준비 중…",
		"Cargando…": "로딩 중…",
		"RESTAURAR": "복원",
		"RESTAURAR CARRERA": "커리어 복원",
		"Copias guardadas en iCloud.": "iCloud에 저장된 사본.",
		"No se pudo restaurar la carrera.": "커리어를 복원하지 못했어요.",
		"Carrera restaurada.": "커리어를 복원했어요.",
		"VERSION MAS NUEVA": "최신 버전",
		"Se jugó después en {0}.": "나중에 {0}에서 플레이됐어요.",
		"Se jugó después en otro aparato.": "나중에 다른 기기에서 플레이됐어요.",
		"iCLOUD": "iCLOUD",
		"ESTE APARATO": "이 기기",
		"PARTIDO LIBRE": "자유 경기",
		"ELIGE TU EQUIPO": "내 팀 선택",
		"ELIGE EL RIVAL": "상대 선택",
		"ELIGE TU JUGADOR": "내 선수 선택",
		"Amistoso de exhibición · no cuenta para la carrera": "친선 시범 경기 · 커리어에 반영되지 않아요",
		"PRÁCTICA LIBRE": "자유 연습",
		"RECOMIENDA": "추천",
		"ENCARGO": "과제",
		"DETALLE": "상세",
		"QUIERE VERTE": "만나고 싶어 해요",
	},



	"compra": {
		"{0} PARTIDOS": "{0}경기",
		"{0} GOLES": "{0}골",
		"{0} ASIST": "{0}도움",
		"La App Store no responde. Revisa tu conexión y vuelve a intentarlo.":
			"App Store에 연결할 수 없어요. 연결 상태를 확인하고 다시 시도하세요.",
		"Google Play no responde. Revisa tu conexión y vuelve a intentarlo.":
			"Google Play에 연결할 수 없어요. 연결 상태를 확인하고 다시 시도하세요.",
		"Tu pago quedó pendiente: lo recibirás en cuanto se confirme.":
			"결제가 보류 중이에요: 확인되는 대로 받게 돼요.",
		"Listo: ya recuperaste lo que habías comprado con esta cuenta de Google.":
			"완료: 이 Google 계정으로 구매한 항목을 복원했어요.",
		"Esta cuenta de Google no tiene compras que recuperar en Football Legacy.":
			"이 Google 계정에는 Football Legacy에서 복원할 구매 내역이 없어요.",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu cuenta de Google.":
			"게임 머니가 아니라 실제 돈으로 결제돼요: Google 계정으로 청구돼요.",
		"GOOGLE PLAY":
			"GOOGLE PLAY",
		"Este aparato no tiene permitidas las compras.":
			"이 기기에서는 구매가 허용되지 않아요.",

		"No se pudo completar la compra.": "구매를 완료하지 못했어요.",
		"Apple rechazó el pago.": "Apple에서 결제를 거절했어요.",
		"La compra no está disponible en tu región.":
			"내 지역에서는 이용할 수 없는 구매예요.",
		"No hay conexión con la App Store.": "App Store에 연결할 수 없어요.",
		"No se pudo verificar la compra con Apple. Se reintentará al volver a abrir el juego.":
			"Apple에서 구매를 확인하지 못했어요. 다음에 게임을 열 때 다시 시도해요.",
	},










	"hub": {

		"SANCIONADO · {0} {1} DE CASTIGO": "출장 정지 · {0} {1}",

		"FORMA": "폼",



		"ovrMEDIA": "OVR",
		"NIVEL": "레벨",
		"DINERO": "돈",
		"TEMPORADA": "시즌",
		"{0} · {1} AÑOS": "{0} · {1}세",
		"AGENTE LIBRE · {0} AÑOS": "자유계약 · {0}세",
		"ENERGÍA {0}%": "에너지 {0}%",

		"NO CONVOCADO": "명단 제외",
		"BANQUILLO": "벤치",
		"YA NO QUEDAN CAMBIOS": "교체 카드 소진",
		"SE VA {0}": "{0} 교체 아웃",
		"¡PARADÓN DE {0}!": "{0}의 슈퍼 세이브!",
		"{0} SE ESTIRA Y LA SACA": "{0}, 몸을 날려 쳐낸다",
		"LA ATAJA {0}": "{0}, 잡아낸다",
		"SE SALVA EL PORTERO": "골키퍼 선방",
		"PARADAS EN EL PARTIDO": "이번 경기 선방",
		"asistA": "A",
		"PLANTILLAS": "스쿼드",
		"RELATO": "중계",
		"OVR": "OVR",
		"ROTACIÓN": "로테이션",
		"TITULAR": "선발",
		"INDISCUTIBLE": "붙박이 주전",

		"AGENTE LIBRE": "자유계약",
		"ELIGE CLUB": "클럽 선택",
		"TE VENDEN": "방출 대상",
		"RESPONDE YA": "즉시 답변",
		"EN VENTA": "판매 중",
		"ESPERANDO OFERTAS": "제안 대기 중",
		"CIERRA HOY": "오늘 마감",
		"CIERRA EN {0}J": "{0}라운드 후 마감",
		"MERCADO CERRADO": "이적 시장 마감",
		"ABRE EN {0}J": "{0}라운드 후 오픈",
		"PRÓXIMA TEMPORADA": "다음 시즌",

		"MERCADO DE VERANO": "여름 이적 시장",
		"MERCADO DE INVIERNO": "겨울 이적 시장",
		"VERANO": "여름",
		"INVIERNO": "겨울",

		"BUZON": "우편함",
		"{0} NUEVOS": "신규 {0}",
		"AL DIA": "모두 읽음",
		"Elige tu próximo club": "다음 클럽을 선택하세요",
		"¡TE BUSCAN!": "러브콜!",
		"PLANTEL": "스쿼드",
		"PERFIL": "프로필",
		"CONTRATO": "계약",
		"MERCADO": "이적 시장",
		"TIENDA": "상점",
		"ASPECTO": "외모",
		"CASUAL": "캐주얼",
		"Tu ropa de calle. La eliges tú.": "내 평상복. 내가 골라요.",
		"Eres el mismo con las dos ropas.": "어떤 옷을 입어도 나는 나예요.",
		"{0} · el uniforme es el de tu club.":
			"{0} · 유니폼은 소속 클럽 것이에요.",



		"RELACIONES": "관계",

		"Para el próximo: {0}, ~{1}'.": "다음 경기: {0}, ~{1}'.",
		"El balón te llega ~{0} veces por partido.":
			"경기당 공이 ~{0}번 와요.",
		"El balón te llega ~{0} vez por partido.":
			"경기당 공이 ~{0}번 와요.",
		"Vales ${0} en el mercado.": "이적 시장 가치: ${0}.",



		"famaDESCONOCIDO": "무명",
		"famaLOCAL": "지역구",
		"famaCONOCIDO": "알려짐",
		"famaCARA CONOCIDA": "유명인",
		"famaESTRELLA": "스타",
		"{0} de {1} marcas te pueden ofertar.": "브랜드 {1}곳 중 {0}곳이 제안할 수 있어요.",
		"Y 1 ya te queda chica.": "그리고 1곳은 이미 내게 너무 작아요.",
		"Y {0} ya te quedan chicas.": "그리고 {0}곳은 이미 내게 너무 작아요.",
		"Estrella: esta temporada aguantas {0} partidos flojos sin que te olviden. Por debajo de {1} dejas de serlo.": "스타: 이번 시즌엔 부진한 경기 {0}번까지는 잊히지 않아요. {1} 아래로 떨어지면 스타가 아니에요.",
		"Estrella: esta temporada aguantas 1 partido flojo sin que te olviden. Por debajo de {0} dejas de serlo.": "스타: 이번 시즌엔 부진한 경기 1번까지는 잊히지 않아요. {0} 아래로 떨어지면 스타가 아니에요.",
		"Estrella: esta temporada ya te están olvidando. Por debajo de {0} dejas de serlo.": "스타: 이번 시즌엔 벌써 잊혀 가고 있어요. {0} 아래로 떨어지면 스타가 아니에요.",
		"Sólo te llama una: te falta nombre. Con más prensa te llaman hasta tres.": "한 곳만 연락해요: 이름값이 부족해요. 언론 노출이 늘면 세 곳까지 연락해요.",
		"PUJA CON {0}: +{1} %": "{0} 클럽과 경쟁: +{1} %",
		"Te saca +{0} de sueldo en cada oferta. Tócalo para darle un encargo.":
			"제안마다 주급을 +{0} 더 받아 줘요. 탭해서 일을 맡기세요.",
		"TUS RELACIONES": "내 인맥",
		"TORNEOS": "대회",

		"CALENDARIO": "일정",


		"CLASIF {0}": "예선 {0}",
		"La temporada aún no tiene calendario.":
			"이번 시즌 일정이 아직 없어요.",

		"RANKING": "랭킹",
		"RANKING DE JUGADORES": "선수 랭킹",
		"Los jugadores de 1ª división del mundo, ordenados por su media."
			+ " Tú entras en la misma lista.":
			"전 세계 1부 리그 선수들을 능력치 순으로 정렬했어요. 나도 같은 목록에 있어요.",
		"Ningún jugador cumple estos filtros. Prueba a soltar alguno.":
			"조건에 맞는 선수가 없어요. 필터를 하나 해제해 보세요.",
		"Ahora mismo no hay nadie sin club. La bolsa se llena al cerrar cada ventana de mercado.":
			"지금은 무소속 선수가 없어요. 이적 시장이 닫힐 때마다 채워져요.",
		"TU SITIO: {0}° DE {1}": "내 순위: {1}명 중 {0}위",
		"A {0} de media del {1}°": "{1}위와 능력치 {0} 차이",
		"IR A MI FILA": "내 위치로",
		"MARCADOS": "관심 선수",
		"TODO": "전체",
		"PAÍS": "국가",
		"PORTEROS": "골키퍼",
		"DEFENSAS": "수비수",
		"MEDIOS": "미드필더",
		"DELANTEROS": "공격수",
		"FILTRAR POR PUESTO": "포지션 필터",
		"FILTRAR POR EDAD": "나이 필터",
		"FILTRAR POR VALOR": "가치 필터",
		"DIVISIÓN": "디비전",
		"FILTRAR POR LIGA": "리그 필터",
		"FILTRAR POR DIVISIÓN": "디비전 필터",
		"Los jugadores del mundo, por liga y división, ordenados por su media. Tú entras en la misma lista.": "전 세계 선수들을 리그와 디비전별로, 능력치 순으로 정렬했어요. 나도 같은 목록에 있어요.",
		"{0} PUESTOS": "{0}개 포지션",
		"FILTRAR POR PAÍS": "국가 필터",
		"FILTRAR POR BANQUILLO": "벤치 필터",
		"FILTRAR POR ESTRELLAS": "별점 필터",
		"FILTRAR POR IDEA": "스타일 필터",
		"IDEA": "스타일",
		"Ningún técnico cumple estos filtros.": "조건에 맞는 감독이 없어요.",
		"{0}-{1} DE {2}": "{2} 중 {0}-{1}",
		"ANTERIOR": "이전",
		"PALMARÉS": "우승 기록",
		"LEYENDAS": "레전드",
		"SELECCIÓN": "대표팀",
		"VITRINA": "진열장",



		"HISTORIA": "역사",
		"LEGADO": "레거시",



		"ABIERTO · {0}J": "오픈 · {0}라운드",
		"EN VENTA · {0} OFERTAS": "판매 중 · 제안 {0}건",

		"CLUBES Y LEYENDAS": "클럽과 레전드",
		"JUGADOR DEL ANO · {0}": "올해의 선수 · {0}",
		"{0} PUNTOS": "{0}점",
		"TOPE {0}": "상한 {0}",
		"NIVEL {0}": "레벨 {0}",
		"SIN CONTRATO": "계약 없음",
		"ÚLTIMO AÑO": "마지막 해",
		"{0} TEMPORADAS": "{0}시즌",

		"1 TEMPORADA": "1시즌",
		"{0}% SOBRE TU SUELDO": "현재 주급 대비 {0}%",

		"PEDIR UN POCO": "조금 요구",
		"PEDIR MUCHO": "많이 요구",
		"+{0} si acepta": "수락하면 +{0}",
		"ROMPER EL HIELO": "분위기 풀기",
		"YA ROMPISTE EL HIELO": "이미 분위기 풀림",
		"Hablan de otra cosa un rato · SE RELAJA":
			"잠시 다른 이야기를 나눠요 · 긴장이 풀려요",
		"EL DURO": "강경파",
		"EL AMABLE": "친절파",
		"EL SUSCEPTIBLE": "예민파",
		"EL PACIENTE": "인내파",

		"SU HUMOR": "기분",
		"DE BUENAS": "기분 좋음",
		"SE LO PIENSA": "고민 중",
		"IMPACIENTE": "조급해짐",
		"HARTO": "질림",
		"TE CEDEN": "임대 이적",
		"{0} OFERTAS": "제안 {0}건",
		"{0} DESTINO": "임대처 {0}곳",
		"{0} DESTINOS": "임대처 {0}곳",
		"CERRADO": "마감",
		"SIN OFERTAS · {0}J": "제안 없음 · {0}라운드",
		"{0} OFERTAS · {1}J": "제안 {0} · {1}라운드",


		"CIERRA HOY · {0} OFERTAS": "오늘 마감 · 제안 {0}건",
		"{0} OFERTAS SOBRE LA MESA": "테이블 위 제안 {0}건",

		"MEJORA": "인상",
		"TU CLUB TE LA OFRECE": "소속 클럽 제안",
		"TU CLUB TE MEJORA": "클럽 조건 인상",
		"Se adelanta a los que vienen a por ti.": "다른 클럽이 오기 전에 먼저 움직이고 있어요.",
		"EL MEJOR QUE TRAJISTE": "내가 데려온 최고 선수",
		"{0} partidos · nota {1}": "{0}경기 · 평점 {1}",
		"EL TECNICO PIDE": "감독 요청",
		"Si fichan a uno de esa línea: +{0} % de que salga y el técnico te lo apunta.": "그 라인의 선수를 영입하면 성사 확률 +{0} %, 감독도 기억해 줘요.",
		"Ya le trajiste uno: te lo apunta.": "이미 한 명 데려왔어요: 감독이 기억해요.",
		"Lo pide el técnico: sale más fácil": "감독이 원하는 선수: 영입이 쉬워요",
		"SUBIR": "위로",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede. SUBIR cambia el orden.": "이 순서대로 진행돼요: 한 명이 계약하면 나머지는 남은 돈으로 입찰해요. 위로 버튼으로 순서를 바꿔요.",
		"PAGAR LO QUE PIDEN": "요구액 지불",
		"REGATEAR -{0} %": "흥정 -{0} %",
		"MANDAR OJEADOR ({0})": "스카우트 파견 ({0})",
		"Ojeado: el club ya se fía de él.": "스카우팅 완료: 이제 클럽이 그를 믿어요.",
		"QUITAR DE LA VENTA": "판매 취소",
		"PONER EN VENTA": "판매 등록",
		"En venta: en la próxima ventana se ofrece a un club de su nivel, un {0} % por debajo de su valor.": "판매 중: 다음 이적 시장에 비슷한 수준의 클럽에 가치보다 {0} % 낮게 제안돼요.",
		"Ya tienes {0} en venta.": "이미 {0}명을 판매 중이에요.",
		"Se ofrecen al abrir la ventana a clubes de su nivel, un {0} % por debajo de su valor. Se quitan desde su ficha.": "이적 시장이 열리면 비슷한 수준의 클럽에 가치보다 {0} % 낮게 제안돼요. 선수 카드에서 취소할 수 있어요.",
		"No vendría a tu club: no casa con su categoría.": "우리 클럽엔 오지 않을 거예요: 수준이 맞지 않아요.",
		"RETIRAR LA PETICION": "요청 철회",
		"SI DICE QUE NO, TU TÉCNICO LO SABE": "거절되면 감독이 알게 돼요",
		"PETICIONES": "요청",
		"TODAVÍA NADA": "아직 없음",
		"TU TÉCNICO CUMPLE": "감독이 성과를 내요",
		"DE TUS {0} MEJORES": "팀 내 상위 {0}명",
		"SUPLENTE Y CLUB EN APURO": "벤치 선수, 클럽 위기",
		"VETERANO SUPLENTE": "벤치의 베테랑",
		"DEJAS LA CAJA VACIA": "금고가 바닥나요",
		"NADIE PARA TU PUESTO": "내 포지션에 대체자 없음",
		"VAS EN RACHA": "상승세",
		"Si te lo cede: -{0} con el vestuario.": "양보하면: 라커룸 관계 -{0}.",
		"Se lo pediste al club: {0} % de que lo traiga en la próxima ventana de técnicos.": "클럽에 요청했어요: 다음 감독 교체 시기에 데려올 확률 {0} %.",
		"El club lo decide en la próxima ventana de técnicos (invierno o final de temporada). Si dice que no, tu técnico se entera.": "클럽은 다음 감독 교체 시기(겨울 또는 시즌 종료)에 결정해요. 거절되면 감독이 알게 돼요.",
		"El club te hizo caso: llegó {0}.": "클럽이 내 말을 들었어요: {0} 감독이 왔어요.",
		"El club dijo que no a {0}, y tu técnico se enteró.": "클럽이 {0} 감독 영입을 거절했고, 감독이 그걸 알게 됐어요.",
		"El club cambió de técnico, pero no trajo a {0}.": "클럽이 감독을 바꿨지만 {0} 감독은 데려오지 않았어요.",
		"{0} ya no estaba a tu alcance.": "{0} 감독은 이제 데려올 수 없었어요.",
		"¿Otro técnico? Pídelo desde su ficha, en {0}, pestaña {1}.": "다른 감독을 원하나요? {0}의 {1} 탭에서 감독 카드로 요청하세요.",
		"PEDISTE A": "요청한 감독",
		"QUE LO TRAIGAN": "영입 확률",
		"QUE LO ECHEN": "경질 확률",
		"ENCAJA": "적합",
		"NO ENCAJA": "부적합",
		"CUMPLE SUS METAS": "목표 달성 중",
		"PEDIR QUE LO ECHEN": "경질 요청",
		"ELEGIR QUIÉN VIENE · NIVEL {0}": "후임 선택 · 레벨 {0}",
		"{0} · FUERA": "{0} · 아웃",
		"{0} SIN VICTORIA": "{0}경기 무승",
		"El club te hace caso: destituye al técnico": "클럽이 내 말을 들었어요: 감독 경질",
		"Se decide en la próxima ventana de técnicos: la de invierno o el final de la temporada. Si dice que no, tu técnico se entera.": "다음 감독 교체 시기에 결정돼요: 겨울 또는 시즌 종료. 거절되면 감독이 알게 돼요.",
		"El club te hace caso: llega {0} al banquillo": "클럽이 내 말을 들었어요: {0} 감독 부임",
		"NO LO VENDAIS": "팔지 마세요",
		"QUITAR PROTECCION": "보호 해제",
		"Protegido: el club no lo vende ni lo cede y pide el doble por él. Si lo pagan, se va igual; cada ventana en que rechace ofertas te quita {0} de relación.": "보호 중: 클럽이 판매도 임대도 하지 않고 이적료를 두 배로 요구해요. 그 돈을 내면 그래도 떠나요. 클럽이 제안을 거절하는 이적 시장마다 관계가 {0} 줄어요.",
		"QUE LO RENUEVEN": "재계약 요청",
		"Se decide en la próxima ventana de contratos.": "다음 계약 시기에 결정돼요.",
		"Pedido: {0} % de que renueve en la próxima ventana de contratos.": "요청함: 다음 계약 시기에 재계약할 확률 {0} %.",
		"Si lo pides: {0} % de que renueve.": "요청하면: 재계약할 확률 {0} %.",
		"Ya pides {0} renovaciones.": "이미 재계약 {0}건을 요청 중이에요.",
		"INTOCABLE": "보호 중",
		"PROTEGES A": "보호 대상",
		"Pagaron el doble ({2}) y {0} se fue a {1}.": "두 배({2})를 지불받고 {0} 선수가 {1} 클럽으로 떠났어요.",
		"El club rechazó {0} de {1} por {2}.": "클럽이 {2} 선수에 대한 {1} 클럽의 {0} 제안을 거절했어요.",
		"Te cuesta {0} de relación hasta final de temporada.": "시즌이 끝날 때까지 관계가 {0} 줄어요.",
		"RENOVACIONES": "재계약",
		"{0} renovo.": "{0} 재계약.",
		"El club no quiso renovar a {0}.": "클럽이 {0} 선수와 재계약하지 않으려 했어요.",
		"{0} no quiso renovar.": "{0} 선수, 재계약 거부.",
		"{0} ya había firmado con otro club.": "{0} 선수는 이미 다른 클럽과 계약했어요.",
		"PIDE UN PUESTO": "포지션 요청",
		"El club busca un {0}: va a por {1}.": "클럽이 {0} 포지션을 찾고 있어요: {1} 선수를 노려요.",
		"Tú pides el puesto y el club elige a quién: sale más a menudo y, si se cae, prueba con otro. Gasta una recomendación.": "내가 포지션을 요청하면 클럽이 선수를 골라요: 성공률이 더 높고, 무산되면 다른 선수를 시도해요. 추천 1회를 사용해요.",
		"No te quedan recomendaciones esta temporada.": "이번 시즌 남은 추천이 없어요.",
		"Ya hay un puesto pedido.": "이미 요청한 포지션이 있어요.",
		"El club no encuentra a nadie mejor para ese puesto.": "클럽이 그 포지션에 더 나은 선수를 찾지 못했어요.",
		"VENTANAS ANTERIORES": "이전 이적 시장",
		"Gastado {0} · ventas {1}": "지출 {0} · 판매 {1}",
		"RENOVACIÓN SOBRE LA MESA": "재계약 제안 대기",
		"SALDRÁS LIBRE AL CIERRE": "계약 만료 후 자유계약",
		"ABIERTO · {0} FICHAJES": "오픈 · 영입 {0}건",
		"OBJETIVO": "목표",
		"VAS CORTO": "부족",
		"{0} DE {1} · VAS CORTO": "{1} 중 {0} · 부족",
		"RÉCORD A LA VISTA": "기록 임박",
		"A {0} {1} DEL LIBRO": "기록까지 {0} {1}",
		"GOL": "골",


		"ESTA TEMPORADA POR TORNEO": "이번 시즌 대회별",
		"TORNEO": "대회",
		"CHAMPIONS": "엘리트컵",
		"EUROPA": "유로파컵",
		"CONFERENCE": "챌린지컵",
		"MUNDIALITO": "클럽 세계",
		"{0} OFERTAS · {1} EXPIRA HOY": "제안 {0}건 · 오늘 {1}건 만료",
		"{0} OFERTAS · {1} EXPIRAN HOY": "제안 {0}건 · 오늘 {1}건 만료",
		"NEGOCIACIÓN": "협상",
		"{0} CLUBES RESPONDIERON": "{0}개 클럽 응답",


		"{0} TE BUSCAN · YA": "러브콜 {0}곳 · 지금",
		"{0} MARCAS": "브랜드 {0}곳",
		"SIN JUGAR": "출전 없음",
		"{0} EN LIGA": "리그 {0}",
		"CONVOCADO": "소집",


		"seleccionFUERA": "탈락",
		"{0} TROFEOS": "트로피 {0}개",
		"{0} GOLES": "{0}골",

		"TIENES {0} {1} SIN REPARTIR": "사용 안 한 {1}: {0}",
		"SEMANA · {0} DE {1} ACCIONES": "주간 · 행동 {1} 중 {0}",




		"previaGANAS": "승리",
		"previaEMPATE": "무승부",
		"previaPIERDES": "패배",
		"iniV": "W",
		"iniE": "D",
		"iniD": "L",




		"SUBIR HABILIDADES · {0}": "능력 올리기 · {0}",
		"SIN PUNTOS": "포인트 없음",
		"PERSONALIZAR": "꾸미기",
		"MENÚ": "메뉴",

		"ELEGIR CLUB": "클럽 선택",
		"LESIONADO · VER LA JORNADA": "부상 · 라운드 관전",
		"LESIONADO · {0} {1} DE BAJA": "부상 · {0} {1} 결장",
		"YA USADA": "사용됨",
		"{0} {1} DE BAJA": "{0} {1} 결장",

		"ALTA MÉDICA": "출전 가능",
		"VUELVES AL EQUIPO": "팀 복귀",
		"PARTIDOS PERDIDOS": "결장 경기",
		"El cuerpo aguantó. El puesto no se guardó solo: ahora hay que "
		+ "ganárselo otra vez.":
			"몸은 버텼어요. 하지만 자리는 저절로 지켜지지 않아요: 이제 다시 따내야 해요.",
		"LA TEMPORADA, EN EL AIRE": "불투명해진 시즌",
		"MESES FUERA": "몇 달 결장",
		"BAJA LARGA": "장기 결장",
		"TE PIERDES LO QUE VIENE": "다가올 경기 결장",
		"SEMANAS DE BAJA": "몇 주 결장",
		"{0} SEMANAS DE BAJA": "{0}주 결장",
		"Vuelves cuando el cuerpo diga. Mientras tanto el equipo juega sin ti "
		+ "y el puesto no se guarda solo.":
			"몸이 허락할 때 돌아와요. 그동안 팀은 나 없이 뛰고, 자리는 저절로 지켜지지 않아요.",
		"Esta baja ya te costó {0} {1}": "이번 부상으로 잃은 것: {0} {1}",
		"SIMULAR {0}": "{0} 시뮬레이션",
		"JUGAR CON TU SELECCIÓN": "대표팀으로 출전",
		"FECHA DE SELECCIONES": "A매치 기간",
		"FECHA DE SELECCIONES · SALES DE TITULAR": "A매치 기간 · 선발 출전",
		"FECHA DE SELECCIONES · ENTRAS DESDE LA BANCA": "A매치 기간 · 교체 출전",
		"VER EL PARTIDO": "경기 관전",
		"JUGAR PARTIDO": "경기 시작",
		"MANTENER PARA PASAR A FIN DE TEMPORADA": "길게 눌러 시즌 종료로",
		"LA TEMPORADA HA TERMINADO": "시즌 종료",

		"TE LO PERDISTE LESIONADO": "부상으로 놓쳤어요",
		"TE VE FLOJO DE": "약점:",
		"NO CONVOCADO · TE VE FLOJO DE {0}": "명단 제외 · 약점: {0}",
		"EL MÍSTER TE PIDE ALGO": "감독의 과제",
		"NO TE CONVOCARON": "명단 제외",
		"Algo es algo.": "없는 것보단 낫죠.",
		"Aprovecha para entrenar e impresionar al míster.": "이 기회에 훈련해서 감독에게 눈도장을 찍으세요.",
		"Porterías chiquitas": "미니 골대",
		"Métela en la portería pequeña, no en la grande. Cada balón sale de más lejos.": "큰 골대 말고 작은 골대에 넣으세요. 공은 매번 더 멀리서 시작해요.",
		"Jala y suelta a la portería pequeña": "당겼다가 놓아서 작은 골대로",
		"Rompe las dianas": "과녁 깨기",
		"Eslalon con rival": "수비수 슬라럼",
		"OTRO BALÓN": "공 하나 더",
		"Pisa los conos con el balón. El chico paga el triple, pero está del lado del que te marca.": "공으로 콘을 밟으세요. 작은 콘은 세 배 점수지만 마크맨 쪽에 있어요.",
		"Arrastra para conducir; no se tira": "드래그로 드리블; 슈팅 불가",
		"Rompe las dianas del arco. La chiquita de arriba paga el triple que la gorda de abajo.": "골대의 과녁을 깨세요. 위쪽 작은 과녁은 아래쪽 큰 과녁의 세 배 점수예요.",
		"Jala y suelta a una diana": "당겼다가 놓아서 과녁으로",
		"TU RÉCORD": "내 기록",
		"NUEVO RÉCORD": "신기록",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario distinto. Aquí no se juega nada de la carrera — el que cuenta es EL ENCARGO DEL MÍSTER, y ése sale la jornada que no te convocan. Se sale con PAUSA.": "훈련을 골라 원하는 만큼 반복하세요: 시도할 때마다 다른 상황이 만들어져요. 여기서는 커리어에 아무 영향이 없어요 — 중요한 건 감독의 과제이고, 명단에서 빠진 라운드에 나와요. 일시정지로 나가요.",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada de esto cuenta para la carrera — el que cuenta es EL ENCARGO DEL MÍSTER. Se sale con PAUSA.": "플레이를 골라 원하는 만큼 반복하세요: 시도할 때마다 그 유형 안에서 다른 상황이 만들어져요. 이건 커리어에 반영되지 않아요 — 중요한 건 감독의 과제예요. 일시정지로 나가요.",
		"Ya te vio cumplir. Ahora te pide más.": "해내는 걸 봤어요. 이제 더 많이 원해요.",
		"EL MÍSTER TE MIRA EN": "감독이 보는 부분",
		"LA PRÓXIMA": "다음",
		"TE VE FLOJO DE {0}": "약점: {0}",
		"LA META": "목표",
		"COMPLETA EL CIRCUITO": "코스 완주",
		"EL PRECIO": "대가",
		"-{0} ENERGÍA": "에너지 -{0}",
		"CUMPLIR EL ENCARGO": "과제 수행",
		"SOLO SIMULAR": "시뮬레이션만",
		"EL ENCARGO": "과제",
		"NO LLEGASTE": "미달성",
		"Así sí. El sábado te veo en la lista.": "그렇지. 토요일 명단에서 보자.",
		"Otra semana igual y no.": "한 주 더 이러면 끝이야.",
		"EL PRÓXIMO": "다음",
		"SIGUES FUERA": "계속 제외",
		"TE DAN DESCANSO": "휴식 부여",
		"Te llegan balones y no los defines": "공이 와도 마무리를 못 하네",
		"Le pegas flojo": "슈팅이 약해",
		"No sabes curvarla": "감아 차질 못하네",
		"No me das confianza desde los once": "페널티킥은 못 믿겠어",
		"Los balones parados los tira otro": "세트피스는 다른 선수가 차",
		"El primero que te sale te come": "첫 수비수한테 바로 막히네",
		"NO FUISTE CONVOCADO": "소집되지 않았어요",
		"{0} ganó sin ti": "{0}, 나 없이 승리",
		"Tu selección": "내 대표팀",
		"Tu equipo": "내 팀",
		"Empató sin ti": "나 없이 무승부",
		"Perdió sin ti": "나 없이 패배",
		"Recuperado: vuelves el próximo partido": "회복 완료: 다음 경기에 복귀해요",
		"Te quedan {0} {1} de baja": "결장 {0} {1} 남음",
		"Sin goles": "무득점",
		"TU EQUIPO": "내 팀",
		"Gol": "골",


		"A puerta": "유효 슈팅",
		"Fuera del marco": "골문 벗어남",
		"Tapado": "블록",

		"SIN TIEMPO ESTA SEMANA": "이번 주 시간 없음",
		"NO TE ALCANZA": "비용 부족",
		"LO PIENSO": "고민해 볼게",
		"ANTES DEL MERCADO": "이적 시장 전",
		"DESPUÉS DEL PARTIDO": "경기 후",
		"CÓMO QUEDAN LAS COSAS": "현재 상황",
		"TU DECISIÓN": "내 선택",
		"otro club": "다른 클럽",
		"Un intermediario te susurra que al {0} le gustas. Si dices que te interesaría, "
		+ "puede que oferten por ti en el mercado… pero en tu club no te lo perdonarán.":
			"한 중개인이 {0} 쪽에서 나를 마음에 들어 한다고 귀띔해요. 관심 있다고 하면 이적 시장에서 제안이 올 수도 있지만… 소속 클럽은 절대 용서하지 않을 거예요.",

		"Técnico": "감독",
		"Vestuario": "라커룸",

		"SOCIEDAD": "파트너십",


		"YA JUGASTEIS JUNTOS EN {0}": "{0}에서 함께 뛴 사이",
		"TAMBIÉN PASÓ POR {0}": "{0}에서도 뛰었음",
		"VIENE DE {0}, TU RIVAL": "라이벌 {0} 출신",


		"SOCIO": "파트너",

		"SÓLO CABE UNO": "자리는 하나뿐",
		"SABES DÓNDE ESTUVO": "그가 어디 있었는지 알아요",
		"{0} salió la víspera y lo sabes tú solo. El míster acaba de preguntar en voz alta por qué se movió como si llevara piedras en los pies.": "{0} 선수가 경기 전날 밤 외출했고, 그걸 아는 건 나뿐이에요. 감독이 방금 큰 소리로 왜 발에 돌이라도 단 것처럼 움직였냐고 물었어요.",
		"TAPARLO": "감싸 주기",
		"EL GOL ES TUYO": "이 골은 내 거",
		"Acabas de marcar y la grada corea tu nombre. {0} lleva un mes sin jugar y te mira desde el banquillo, aplaudiendo con las manos flojas.": "방금 골을 넣었고 관중석이 내 이름을 외쳐요. 한 달째 못 뛴 {0} 선수가 벤치에서 힘없이 박수 치며 나를 봐요.",
		"DEDICÁRSELO": "그에게 바치기",
		"CORRER A LA GRADA": "관중석으로 달려가기",
		"TE PIDE DINERO": "돈을 빌려 달래요",
		"{0} te llama de noche y tarda un rato en llegar al punto: en su casa hay un lío y necesita una mano. No dice cuándo te lo devuelve.": "{0} 선수가 밤에 전화해서 한참 뜸을 들이다 본론을 꺼내요: 집에 문제가 생겨서 도움이 필요하대요. 언제 갚겠다는 말은 없어요.",
		"PRESTÁRSELO": "빌려주기",
		"SU ÚLTIMO DÍA": "그의 마지막 날",
		"El traspaso de {0} está firmado y mañana ya no entrena aquí. El vestuario hará lo de siempre: un aplauso, una foto y a lo suyo.": "{0} 선수의 이적이 확정돼서 내일부터는 여기서 훈련하지 않아요. 라커룸은 늘 하던 대로 하겠죠: 박수 한 번, 사진 한 장, 그리고 각자 일로.",
		"ORGANIZARLE UNA DESPEDIDA": "송별회 열어 주기",
		"UN ABRAZO Y YA": "포옹 한 번이면 끝",
		"Un programa os invita a {0} y a ti, pero la productora sólo tiene caché para uno y te lo ha ofrecido a ti primero. Él todavía no lo sabe.": "한 방송이 {0} 선수와 나를 초대했지만 제작진은 출연료를 한 명분만 줄 수 있고, 나에게 먼저 제안했어요. 그는 아직 몰라요.",
		"QUE VAYA ÉL": "그를 보내기",
		"IR YO": "내가 가기",

		"LO DEJÓ FUERA": "명단 제외",
		"{0} no entró en la lista y lleva media hora sin hablar con nadie. Tú sí juegas, y el míster te escucha más que a él.": "{0} 선수가 소집 명단에 들지 못해 30분째 아무와도 말을 안 해요. 나는 출전하고, 감독은 그보다 내 말을 더 들어요.",
		"HABLAR POR ÉL": "그를 변호하기",
		"NO ES MI PELEA": "내 싸움 아님",
		"OS GRITASTEIS": "서로 소리쳤어요",
		"Le pediste el balón a gritos, él te contestó peor, y el banquillo entero lo vio. En el vestuario nadie ha dicho una palabra desde entonces.": "내가 소리치며 공을 달라고 했더니 그가 더 심하게 받아쳤고, 벤치 전체가 그걸 봤어요. 그 뒤로 라커룸에선 아무도 말 한마디 안 했어요.",
		"PEDIR PERDÓN YO": "내가 먼저 사과",
		"QUE SE LE PASE": "진정될 때까지 두기",
		"LA REHABILITACIÓN ES SOLA": "재활은 외로워요",
		"{0} se rompió y hace la recuperación por su cuenta, en un gimnasio vacío mientras los demás entrenan. Nadie va a saber si apareces o no.": "{0} 선수가 부상당해서 다른 선수들이 훈련하는 동안 텅 빈 체육관에서 혼자 재활 중이에요. 내가 가든 안 가든 아무도 모를 거예요.",
		"ACOMPAÑARLO": "함께 가기",
		"YA VOLVERÁ": "알아서 돌아오겠지",
		"TE QUIERE DE PADRINO": "들러리 부탁",
		"{0} se casa en pretemporada y te pide que estés a su lado. Es un fin de semana entero, y tú tenías otros planes con tu descanso.": "{0} 선수가 프리시즌에 결혼하는데 곁에 있어 달라고 부탁해요. 주말 내내 걸리고, 나는 휴식 동안 다른 계획이 있었어요.",

		"ÉL QUIERE EL PENALTI": "그가 PK를 원해",
		"{0} lleva tres partidos sin marcar y te pide el próximo penalti. Los dos sabéis que el goleo del año se decide en detalles como éste.": "{0} 선수가 세 경기째 골이 없어서 다음 페널티킥을 차게 해 달라고 해요. 둘 다 알아요, 올해 득점왕 경쟁은 이런 작은 차이로 갈린다는 걸.",
		"SE LO DEJO": "양보하기",
		"LOS TIRO YO": "내가 찬다",
		"TE PREGUNTAN POR ÉL": "그에 대한 질문",
		"Un periodista quiere que valores el mal momento de {0}. La pregunta viene con la respuesta puesta y toda la sala esperando.": "한 기자가 {0} 선수의 부진에 대해 평가해 달래요. 답이 정해진 질문이고, 회견장 전체가 기다리고 있어요.",
		"LO DEFIENDO": "옹호하기",
		"NO ME MOJO": "중립 지키기",
		"CENA EN SU CASA": "그의 집에서 저녁",
		"{0} te invita a cenar con su familia la víspera del partido. Es media noche que no duermes, y de las que se recuerdan.": "{0} 선수가 경기 전날 밤 가족과 함께 저녁을 먹자고 초대해요. 잠을 반쯤 못 자겠지만, 오래 기억에 남을 밤이에요.",
		"VOY": "갈게",
		"LA SOCIEDAD": "파트너십",
		"en este partido": "이번 경기에서",
		"y {0} más": "외 {0}",
		"Afición": "팬",
		"Prensa": "언론",
		"Agente": "에이전트",
		"Pareja": "연인",
		"{0} energía": "에너지 {0}",
		"o": "/",
		"· 1 acción": "· 행동 1회",
		"· posible oferta": "· 제안 가능성",

		"VS": "VS",
		"GANASTE": "승리",
		"EMPATASTE": "무승부",
		"PERDISTE": "패배",
		"GOL DE {0}": "{0} 득점",
		"{0} DE {1}": "{1}의 {0}",
		"EN CASA": "홈",
		"XP {0} / {1} · AL NIVEL {2}": "XP {0} / {1} · 레벨 {2}까지",
		"{0} {1} SIN ASIGNAR · REPARTELOS": "{1} {0} 미사용 · 배분하기",
		"LA CARRERA": "레이스",
		"EL CUADRO": "대진표",
		"LA TABLA": "순위표",


		"GOLEADORES": "득점 순위",
		"GRUPO {0} · PASAN {1}": "{0}조 · 상위 {1}팀 진출",


		"FASE DE LIGA · {0}/{1} · {2}": "리그 페이즈 · {0}/{1} · {2}",
		"A OCTAVOS": "16강행",
		"AL PLAYOFF": "플레이오프행",





		"faseligaFUERA": "탈락",
		"EN LISTA DE VENTA": "이적 명단",
		"EN LISTA DE CESIÓN": "임대 명단",
		"CESIÓN · {0} DESTINOS": "임대 · 행선지 {0}곳",
		"VER LA JORNADA": "라운드 관전",
		"SIMULAR PARTIDO": "경기 시뮬레이션",
		"NO CONVOCADO · LO VES DESDE LA GRADA": "명단 제외 · 관중석에서 관전",
		"SALES DE TITULAR · ~{0} MIN": "선발 출전 · ~{0}분",


		"DERBI · TITULAR · ~{0} MIN": "더비 · 선발 · ~{0}분",
		"DERBI · DESDE LA BANCA · ~{0} MIN": "더비 · 교체 출전 · ~{0}분",
		"ENTRAS DESDE LA BANCA · ~{0} MIN": "교체 출전 · ~{0}분",
		"SIN GASOLINA · EMPIEZAS EN LA BANCA · ~{0} MIN": "체력 바닥 · 벤치 대기 · ~{0}분",
		"EL MÍSTER NO TE QUIERE · DESDE LA BANCA · ~{0} MIN": "감독의 신뢰 부족 · 교체 출전 · ~{0}분",
		"TE CUIDAN AL VOLVER · DESDE LA BANCA · ~{0} MIN": "복귀 관리 · 교체 출전 · ~{0}분",
		"EL TÉCNICO TE DA UNA OPORTUNIDAD": "감독이 기회를 줘요",
		"EL TÉCNICO TE ESTÁ BUSCANDO HUECO": "감독이 자리를 찾는 중",
		"EL TÉCNICO TE DA DESCANSO": "감독이 휴식을 줘요",
		"SIN GASOLINA": "체력 바닥",
		"TE CUIDAN AL VOLVER": "복귀 관리 중",
		"DESDE LA BANCA · ~{0} MIN": "교체 출전 · ~{0}분",
		"MEDIA Y FAMA: {0} · EL MÉRITO LO PONES TÚ": "OVR + 명성: {0} · 나머지는 내 몫",
		"Te faltan {0}: sube de nivel, marca más o gánate al seleccionador en la concentración.":
			"{0} 부족해요: 레벨을 올리거나, 골을 더 넣거나, 소집 훈련에서 대표팀 감독의 마음을 사로잡으세요.",
		"AL CAMPO": "킥오프",
		"SIMULAR LA FECHA": "A매치 시뮬레이션",
		"NO ENTRASTE EN LA LISTA": "명단에 못 들었어요",
		"PUESTO {0} DE {1} EN {2}": "{2} {1}명 중 {0}위",
		"Debes mejorar para ser convocado: sube ~{0} de media o fama.":
			"소집되려면 더 성장해야 해요: 능력치나 명성을 ~{0} 올리세요.",
		"Debes mejorar para ser convocado: más nivel y más nombre.":
			"소집되려면 더 성장해야 해요: 더 높은 레벨과 더 큰 이름값이 필요해요.",
		"PRÓXIMO MUNDIAL · EN {0} {1}": "다음 세계 대회 · {0} {1} 후",
		"{0} AÑOS · NIVEL {1}": "{0}세 · 레벨 {1}",
		"AÑO {0} · SEM {1}": "{0}년차 · {1}주",
		"LESIÓN": "부상",
		"EL CUERPO DECIDE": "몸이 결정해요",
		"EN JUEGO": "걸린 것",
		"TE GUARDA PARA {0}": "{0} 대비 아껴 둠",
		"TE DIO DESCANSO": "감독이 휴식을 줬어요",
		"Para el próximo: {0}.": "다음 경기: {0}.",
		"FECHAS": "일정",
		"riel_pieSIGUIENTE": "다음",
		"riel_pieS{0}": "W{0}",
		"rielGENTE": "사람들",
		"rielDESTREZA": "능력",
		"rielGERENCIA": "이사회",
		"rielFICHAJES": "영입",
		"rielASPECTO": "외모",
		"rielCONTRATO": "계약",
		"rielTORNEOS": "대회",
		"rielRANKING": "랭킹",
		"rielNOTICIAS": "뉴스",
		"rielJUGADOR": "선수",
		"rielEQUIPO": "내 팀",
		"· das tu palabra": "· 약속하기",
		"Diste tu palabra: si te vas esta ventana o la siguiente, tu grada te lo cobrará.": "약속했어요: 이번 이적 시장이나 다음 이적 시장에 떠나면 팬들이 대가를 치르게 할 거예요.",
		"· empezáis a salir": "· 연애 시작",
		"J{0}/{1}": "R{0}/{1}",
		"CÓMO SE VOTA": "투표 방식",
		"NO CUENTAS": "집계 제외",
		"AL 1º": "1위와",
		"SOBRE EL 2º": "2위보다 앞섬",
		"AL {0} · {1}": "{0}까지 · {1}",
		"HASTA {0}": "최대 {0}",
		"1 OFERTA": "제안 1건",
		"SIN OFERTAS AÚN": "아직 제안 없음",
		"QUITAR DE VENTA": "판매 취소",
		"SU VALOR": "가치",
		"ESPERAR": "대기",
		"{0} MÁS EN CAMINO": "{0}건 더 오는 중",
		"{0} DE SU VALOR": "가치 대비 {0}",
		"ACEPTADA": "수락됨",
		"¡Sube su oferta!": "제안 금액을 올렸어요!",
		"Se planta: no pone más.": "버티네요: 더는 안 올려요.",
		"Se ofende y retira su oferta.": "기분이 상해서 제안을 철회했어요.",
		"Esa oferta ya no está.": "그 제안은 사라졌어요.",
		"Ya le pediste más: no pondrá más.": "이미 더 요구했어요: 더 올리지 않을 거예요.",
		"Ya aceptaste una oferta.": "이미 제안을 하나 수락했어요.",
		"Ya no está en venta.": "더 이상 판매 중이 아니에요.",
		"En venta: sus ofertas, en la lista VENDER.": "판매 중: 제안은 판매 목록에 있어요.",
		"TU VENTANA": "이적 시장",
		"TRATOS CERRADOS": "거래 완료",
		"CERRAR TRATOS": "거래 확정",
		"TE QUEDA": "잔액",
		"VENTAS": "판매",
		"GENTE": "사람들",
		"SECCION": "구역",
		"DECORAR": "꾸미기",
		"VENDER MUEBLE": "가구 판매",
		"¿Esperabas este recibimiento?": "이런 환영을 예상했나요?",
		"¿Qué esperas de esta nueva etapa?": "이번 새 도전에 무엇을 기대하나요?",
		"Vengo a devolverles todo este cariño en el campo.": "이 사랑, 경기장에서 모두 보답할게요.",
		"Es un sueño. Ahora toca ganarse el sitio.": "꿈만 같아요. 이제 제 자리를 따내야죠.",
		"Vengo a dejarlo todo por esta camiseta.": "이 유니폼을 위해 모든 걸 쏟아부을게요.",
		"Q1": "Q1",
		"Q2": "Q2",
		"Q3": "Q3",
		"PO": "PO",
		"SI PIERDES": "패배 시",
		"CAMINO A LA FASE DE LIGA": "리그 페이즈 가는 길",
		"VÍA DE LIGA": "리그 경로",
		"VÍA DE CAMPEONES": "챔피언 경로",
		"GANADOR DE": "승자",
		"PERDEDOR DE": "패자",
		"SORTEO {0}": "추첨 {0}",
		"IDA {0}": "1차전 {0}",
		"VUELTA {0}": "2차전 {0}",
		"DESDE LA FASE DE LIGA YA NO SE BAJA": "리그 페이즈부터는 강등 없음",
		"GLOBAL A FAVOR": "합계 우세",
		"GLOBAL EN CONTRA": "합계 열세",
		"GLOBAL IGUALADO": "합계 동점",
		"UEFA": "UEFA",
		"COEFICIENTE DE 5 TEMPORADAS": "5시즌 계수",
		"Tu liga no juega las copas de la UEFA.": "내 리그는 UEFA 대회에 나가지 않아요.",
		"PLAZAS {0}": "{0} 출전권",
		"uefaSUSPENDIDA": "정지",
		"uefa{0} A {1}": "{0}까지 {1}",
		"COEFICIENTE UEFA": "UEFA 계수",
		"5 TEMPORADAS": "5시즌",
		"CABEZA DE SERIE": "시드",
		"SUELO DE TU LIGA": "리그 최저치",
		"LP": "리그",
	},


	"career_pages": {
		"TUYA": "보유",

		"¿Te la compras?": "살까요?",
		"Va a tu clóset: te la pones en PERSONALIZAR.": "옷장으로 가요: 꾸미기에서 입을 수 있어요.",
		"COMPRAR ${0}": "구매 ${0}",





		"LO QUE PIDE EL CLUB": "클럽의 요구",
		"Lo que se le exige al equipo, medido contra sus rivales de cada torneo.": "대회마다 상대 팀들과 비교해 팀에 요구되는 목표예요.",
		"{0}: {1} o mejor": "{0}: {1} 이상",
		"Pelear arriba ({0} o mejor)": "상위권 경쟁 ({0} 이상)",
		"Te lo suben: el año pasado diste más de lo pedido.": "목표 상향: 지난 시즌 요구 이상을 해냈어요.",
		"Te lo bajan: el año pasado te quedaste corto.": "목표 하향: 지난 시즌 기대에 못 미쳤어요.",
		"A este ritmo: {0} de {1}": "이 페이스면: {1} 중 {0}",
		"EL CLUB": "클럽",
		"GRUPO": "그룹",
		"{0} goles · hiciste {1}": "{0}골 · 내 기록 {1}",
		"{0} asistencias · diste {1}": "도움 {0} · 내 기록 {1}",
		"{0} partidos · jugaste {1}": "{0}경기 · 내 기록 {1}",
		"nota {0} · hiciste {1}": "평점 {0} · 내 기록 {1}",
		"acabar {0} o mejor": "{0} 이상으로 마치기",
		"TE SIENTAN POR NO CUMPLIR": "목표 미달로 벤치행",
		"Ganar la liga": "리그 우승",
		"Acabar {0} o mejor": "{0} 이상으로 시즌 마치기",
		"Mantener la categoría": "잔류",
		"Ascender de categoría": "승격",
		"Pelear el ascenso ({0} o mejor)": "승격 경쟁 ({0} 이상)",
		"Levantar el título": "우승 트로피 들기",
		"Llegar a la final": "결승 진출",
		"Llegar a semifinales": "준결승 진출",
		"Llegar a cuartos": "8강 진출",
		"Pasar una ronda": "한 라운드 통과",
		"Pasar la fase de liga": "리그 페이즈 통과",
		"Dar la cara": "맞서 싸우기",
		"Competir": "경쟁하기",
		"FALLADO": "실패",
		"SIN EMPEZAR": "시작 전",
		"VAS {0}": "현재 {0}",
		"SIN DATOS": "데이터 없음",
		"EN FASE DE LIGA": "리그 페이즈 진행 중",
		"{0}/{1} RONDAS": "{0}/{1} 라운드",
		"EL CLUB, CORTO": "클럽 페이스 부족",
		"{0} · PIDE {1}": "{0} · 요구 {1}",
		"Prima por el año del club: ${0}": "클럽 시즌 보너스: ${0}",
		"El club destituye al técnico": "클럽이 감독을 경질해요",
		"Las copas le salvan el puesto al técnico": "컵 대회 성적 덕에 감독이 자리를 지켜요",
		"El club le mantiene la confianza al técnico": "클럽이 감독에 대한 신뢰를 유지해요",
		"TU OBJETIVO": "내 목표",
		"EL AÑO DEL CLUB": "클럽의 한 해",

		"TU JUEGO": "내 플레이",

		"HABILIDAD": "능력",

		"CLUBES": "클럽",
		"JUGADORES": "선수",
		"BALON DE ORO": "올해의 선수",
		"TU CARRERA": "내 커리어",
		"TROFEOS": "트로피",

		"SONIDO": "사운드",
		"MÚSICA": "음악",
		"EFECTOS": "효과음",
		"PARTIDO": "경기",
		"DIFICULTAD": "난이도",
		"NORMAL": "보통",



		"LA DIFICULTAD": "난이도",
		"Así de duro te lo va a poner el rival. No lo eliges para siempre.": "상대가 얼마나 어렵게 나올지 정해요. 언제든 바꿀 수 있어요.",
		"Puedes cambiarla en cualquier momento desde PAUSA > AJUSTES, sin salir del partido.": "경기 중에도 일시정지 > 설정에서 언제든 바꿀 수 있어요.",
		"FACIL: el rival se para mientras apuntas y no te quita el balón nunca. El portero falla más.": "쉬움: 조준하는 동안 상대가 멈추고 절대 공을 뺏지 않아요. 골키퍼 실수가 많아요.",
		"NORMAL: el rival va más lento mientras apuntas y te roba de más cerca. El portero falla algo más.": "보통: 조준하는 동안 상대가 느려지고 더 가까이 와야 공을 뺏어요. 골키퍼 실수가 조금 더 많아요.",
		"DIFICIL: el juego completo. Te aprietan mientras apuntas, te roban el balón y el portero no regala nada.": "어려움: 진짜 게임. 조준하는 동안 압박하고 공을 뺏으며, 골키퍼는 아무것도 내주지 않아요.",
		"EXTREMO: marcan a la estrella, una ocasión menos, cansado tiras peor, tapan más, roban sin aviso y todos te exigen más.": "익스트림: 에이스는 집중 마크, 찬스 하나 감소, 지치면 슈팅이 빗나가고, 블록 증가, 예고 없는 가로채기, 모두가 더 많은 걸 요구해요.",
		"PERSPECTIVA": "시점",
		"TV": "TV",
		"CAMPO": "필드",
		"TV: el plano alto de siempre. Toda la cancha por delante para ver a quién pasarla.": "TV: 늘 보던 높은 시점. 경기장 전체가 앞에 보여서 누구에게 패스할지 볼 수 있어요.",
		"CAMPO: la cámara baja y se acerca, casi a tu espalda. Entra el fondo del estadio y el partido se ve desde dentro.": "필드: 카메라가 낮고 가까워져서 거의 등 뒤에서 봐요. 경기장 반대편까지 화면에 들어오고, 경기 안에서 보는 느낌이에요.",
		"SACUDIDA DE CÁMARA": "카메라 흔들림",
		"DISTANCIA DE CÁMARA": "카메라 거리",
		"GIRO DE VISTA": "시점 회전",
		"MENOS MOVIMIENTO DE CÁMARA": "카메라 움직임 줄이기",
		"VIBRACIÓN": "진동",
		"TEMA CLARO": "라이트 테마",
		"TEMA OSCURO": "다크 테마",
		"PANTALLA": "화면",
		"EFECTO CRT": "CRT 효과",
		"AHORRO DE BATERÍA": "배터리 절약",

		"CALIDAD BAJA": "저화질",
		"MUY BAJA": "최저",

		"Rayas de tele retro": "레트로 TV 주사선",
		"Más fluido, menos detalle y sin CRT": "더 부드럽게, 디테일 감소, CRT 없음",
		"Aún más fluido, menos nítido": "훨씬 부드럽게, 선명도 감소",
		"Menús a 30 fps cuando no tocas": "조작이 없으면 메뉴 30fps",
		"Cambia el icono de la app": "앱 아이콘 변경",
		"Juega con el teléfono girado": "폰을 가로로 들고 플레이",

		"HORIZONTAL": "가로 화면",
		"EN CONSTRUCCIÓN": "작업 중",
		"PROBAR": "체험",
		"La vista horizontal todavía no está terminada: algunas pantallas "
		+ "pueden verse descuadradas o cortadas. Puedes volver a la vertical aquí mismo "
		+ "cuando quieras.":
			"가로 화면은 아직 완성되지 않았어요. 일부 화면이 어긋나거나 잘려 보일 수 있어요. 언제든 여기서 세로 화면으로 돌아갈 수 있어요.",
		"Para teléfonos que van lentos: menos resolución en el estadio, sin filtro "
		+ "CRT ni sombras, y la mitad de lluvia y nieve.":
			"느린 폰을 위한 옵션: 경기장 해상도를 낮추고, CRT 필터와 그림자를 끄고, 비와 눈을 절반으로 줄여요.",
		"Tu teléfono iba lento: activamos CALIDAD BAJA. Puedes quitarla en "
		+ "AJUSTES.":
			"폰이 느려서 저화질을 켰어요. 설정에서 끌 수 있어요.",

		"ICONO DE LA APP": "앱 아이콘",
		"CLÁSICO": "클래식",
		"NOCHE DE BRUJAS": "핼러윈",
		"Cambia el icono del juego en tu pantalla de inicio.":
			"홈 화면의 게임 아이콘을 바꿔요.",
		"El teléfono no dejó cambiar el icono. Vuelve a intentarlo.":
			"폰에서 아이콘을 바꾸지 못했어요. 다시 시도해 주세요.",
		"Con el juego quieto baja el refresco y deja que la pantalla se apague "
		+ "sola. El partido no cambia.":
			"게임이 멈춰 있으면 화면 주사율을 낮추고 화면이 저절로 꺼지게 해요. 경기에는 영향이 없어요.",
		"CARRERAS": "커리어",
		"Borra la carrera de cualquier ranura para dejarla libre. No se puede deshacer.":
			"슬롯의 커리어를 삭제해서 비워요. 되돌릴 수 없어요.",
		"EMPEZAR DE CERO": "전부 초기화",
		"Borra todas las carreras Y todos los logros. El juego queda como recién instalado. No se puede deshacer.":
			"모든 커리어와 모든 업적을 삭제해요. 게임이 처음 설치한 상태로 돌아가요. 되돌릴 수 없어요.",
		"REINICIAR TODO": "모두 초기화",
		"¿REINICIAR TODO?": "모두 초기화?",
		"Se pierden todas las carreras y TODOS los logros. El juego vuelve a empezar de cero. Esto no se puede deshacer.":
			"모든 커리어와 모든 업적이 사라져요. 게임이 처음부터 다시 시작돼요. 되돌릴 수 없어요.",
		"SÍ": "네",
		"BORRAR": "삭제",
		"SÍ, BORRAR": "네, 삭제",
		"SÍ, BORRAR TODO": "네, 모두 삭제",
		"CANCELAR": "취소",
		"VACÍA": "비었음",
		"RETIRADO": "은퇴",
		"T{0}": "S{0}",
		"¿BORRAR RANURA {0}?": "슬롯 {0} 삭제?",
		"Es tu carrera ACTIVA.": "현재 진행 중인 커리어예요.",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.{1}\n"
		+ "Las otras ranuras no se tocan.":
			"{0}의 커리어가 사라져요: 레벨, 돈, 계약, 우승 기록.{1}\n다른 슬롯은 그대로예요.",

		"TU NOMBRE": "이름",
		"NOMBRE EN LA ESPALDA": "등 이름",
		"16 AÑOS · DEBUTANTE": "16세 · 신인",
		"Debutante": "Rookie",
		"TU ASPECTO": "내 외모",
		"NUEVA CARRERA+": "새 커리어+",
		"Lo que te ganaste en carreras anteriores. Elige con qué ventaja arrancas esta "
		+ "vez —o ninguna, y empieza de cero como todos.":
			"이전 커리어에서 얻은 것들이에요. 이번에 가지고 시작할 혜택을 고르세요. 아니면 아무것도 없이 다른 모두처럼 처음부터 시작해도 돼요.",
		"QUITAR": "해제",
		"ELEGIR": "선택",
		"TU NACIONALIDAD": "내 국적",
		"ELIGE TU NACIONALIDAD": "국적 선택",
		"FALTA TU NOMBRE Y TU NACIONALIDAD": "이름과 국적 없음",
		"FALTA ESCRIBIR TU NOMBRE": "이름을 입력하세요",
		"FALTA ELEGIR TU NACIONALIDAD": "국적을 고르세요",
		"TU CLUB": "내 클럽",
		"LEYENDAS DEL CLUB": "클럽 레전드",
		"NO EXISTEN LEYENDAS AÚN": "아직 레전드 없음",
		"CREA TU JUGADOR": "선수 만들기",



		"PASO 1 DE 2 · NOMBRE Y ASPECTO": "1/2단계 · 이름과 외모",
		"SIGUIENTE  >": "다음  >",
		"< ATRÁS": "< 뒤로",
		"NACIONALIDAD Y CLUB": "국적과 클럽",
		"PASO 2 DE 2 · CON QUIÉN Y DÓNDE EMPIEZAS": "2/2단계 · 국적과 클럽",
		"EMPEZAR CARRERA": "커리어 시작",
		"< VOLVER": "< 뒤로",



		"Primera": "1부",
		"Segunda": "2부",
		"Tercera": "3부",
		"{0} DIVISIÓN": "{0} 리그",
		"¡NUEVO!": "NEW!",
		"DESBLOQUEADA": "해금",
		"BLOQUEADO": "잠김",

		"< ATRAS": "< 뒤로",



		"Piel": "피부",
		"Pelo": "머리",
		"Corte": "헤어컷",
		"Vello facial": "수염",



		"Puntas": "끝부분",
		"Botines": "축구화",
		"Playera casual": "캐주얼 셔츠",
		"Pantalón casual": "캐주얼 바지",
		"Estampado": "프린트",
		"2º color playera": "셔츠 보조색",
		"Manga": "소매",
		"Prenda": "의류",
		"Chamarra": "재킷",
		"Rectangulares": "사각형",
		"Deportivos": "스포츠",
		"Short de mezclilla": "데님 반바지",
		"Short cargo": "카고 반바지",
		"Bermuda": "버뮤다",
		"Short de baño": "수영 반바지",
		"Diamante": "다이아몬드",
		"Doble aro": "더블 링",
		"Colgante": "드롭",
		"Ear cuff": "이어 커프",
		"Oxford": "옥스퍼드",
		"Chelsea": "첼시 부츠",
		"Chanclas": "슬리퍼",
		"Gala": "갈라",
		"Traje de gala": "갈라 정장",
		"Esmoquin clásico": "클래식 턱시도",
		"Traje azul": "블루 정장",
		"Esmoquin marfil": "아이보리 턱시도",
		"Terciopelo granate": "가넷 벨벳",
		"Tres piezas gris": "그레이 스리피스",
		"Traje cruzado": "더블 브레스트",
		"Oficina azul": "오피스 블루",
		"Básico grafito": "그래파이트 베이직",
		"Lino arena": "샌드 린넨",
		"Traje café": "브라운 정장",
		"Satén medianoche": "미드나잇 새틴",
		"Terciopelo esmeralda": "에메랄드 벨벳",
		"Seda perla": "펄 실크",
		"Marfil y oro": "아이보리 골드",
		"Negro y oro": "블랙 골드",
		"Diplomático": "외교관",
		"Traje sin corbata": "노타이 정장",
		"Saco y cuello alto": "블레이저와 터틀넥",
		"Conjunto con chaleco": "조끼 정장",
		"Oversize": "오버사이즈",
		"Sin mangas": "민소매",
		"Cuello alto": "터틀넥",
		"Camisa abierta": "오픈 셔츠",
		"Chinos": "치노",
		"Mezclilla ancha": "와이드 진",
		"De vestir": "포멀",
		"Short deportivo": "스포츠 반바지",
		"Bomber": "봄버",
		"Mezclilla": "데님",
		"Cuero": "가죽",
		"Rompevientos": "바람막이",
		"Blazer": "블레이저",
		"Cierre": "여밈",
		"Abierta": "열림",
		"Cerrada": "닫힘",
		"Hacia atrás": "뒤로 쓰기",
		"Gorro tejido": "비니",
		"Bucket": "버킷햇",
		"Redondos": "원형",
		"Aviador": "보잉",
		"Con dije": "펜던트",
		"Reloj": "시계",
		"Pulsera": "팔찌",
		"Calzado": "신발",
		"Tenis bajos": "로우탑",
		"Tenis altos": "하이탑",
		"Botas": "부츠",
		"Mocasines": "로퍼",
		"Sandalias": "샌들",
		"Color del calzado": "신발 색상",
		"Playeras": "셔츠",
		"Pantalones": "바지",
		"Chamarras": "재킷",
		"Gorras": "모자",
		"Accesorios": "액세서리",
		"Color de playera": "셔츠 색상",
		"Prenda exterior": "아우터",
		"Color de chamarra": "재킷 색상",
		"Recto": "스트레이트",
		"Jeans": "청바지",
		"Cargo": "카고",
		"Jogger": "조거",
		"Aretes": "귀걸이",
		"Broquel": "스터드",
		"Aro": "링",
		"Cadena": "체인",
		"Metal": "메탈",
		"Polo": "폴로",
		"Camisa": "셔츠",
		"Suéter": "스웨터",
		"Chaleco": "조끼",
		"Abrigo": "코트",
		"Hoodie": "후디",
		"Largo del pantalón": "바지 길이",
		"Largo": "긴",
		"Corto": "짧은",
		"Gorra": "캡",
		"Sombrero": "모자",
		"Color de la gorra": "모자 색상",
		"Corta": "짧은",
		"Larga": "긴",
		"Gafas": "안경",
		"De sol": "선글라스",
		"Lentes": "안경",
		"Liso": "무지",
		"Rayas": "줄무늬",
		"Raya fina": "핀스트라이프",
		"Mitad": "반반",
		"Tatuajes": "타투",

		"Tinte": "염색",
		"Rostro": "얼굴",
		"Mediano": "중간",
		"Accesorio": "액세서리",
		"Brazos": "팔",
		"Arriba": "상의",
		"Abajo": "하의",
		"Detalles": "디테일",
		"Outfits": "코디",
		"Traje": "정장",
		"Cuello": "목",
		"Muñeca": "손목",
		"Brazo izq": "왼팔",
		"Brazo der": "오른팔",
		"Ambos": "양쪽",


		"Tatuaje de cuello": "목 타투",
		"Tinta del cuello": "목 잉크",
		"Dibujo de la pierna": "다리 문양",
		"Tinta de la pierna": "다리 잉크",
		"Guantes de campo": "필드 장갑",
		"Guantes": "장갑",
		"Muñequeras": "손목 밴드",
		"Color de la muñequera": "손목 밴드 색상",
		"Manga de compresión": "압박 슬리브",
		"Color de la manga": "슬리브 색상",
		"Vendaje": "붕대",
		"Medias": "양말",
		"Cinta de la media": "양말 테이프",
		"Normales": "기본",
		"Con cinta": "테이핑",
		"Bajadas": "내려 신기",
		"Piernas": "다리",
		"Pierna izq": "왼다리",
		"Pierna der": "오른다리",
		"Manga entera": "풀 슬리브",
		"Antebrazo": "아래팔",
		"Bíceps": "이두",
		"Manga difuminada": "그러데이션",
		"Escamas": "비늘",
		"Eslabones": "체인",
		"Ondas": "물결",
		"Cuadros": "체크",
		"Aros finos": "얇은 링",
		"Salpicado": "점박이",
		"Tres aros": "링 세 개",
		"Lágrima": "눈물",
		"Estrella": "별",
		"Barra": "바",
		"Triángulo": "삼각형",
		"Galón": "갈매기",
		"Flecha": "화살표",
		"Cuadro": "사각형",
		"Anillo": "링",
		"Gancho": "갈고리",
		"Raya corta": "줄",
		"Dos barras": "바 두 개",
		"Cruz": "십자",
		"Franja": "띠",
		"Franja ancha": "넓은 띠",
		"Tres puntos": "점 세 개",
		"Rombo": "마름모",
		"Dibujo del tatuaje": "타투 문양",
		"Tinta del tatuaje": "타투 잉크",
		"Punto": "점",
		"Dos puntos": "점 두 개",
		"Línea corta": "짧은 선",
		"Cruz pequeña": "작은 십자",
		"Rombo pequeño": "작은 마름모",
		"Izquierda": "왼쪽",
		"Derecha": "오른쪽",
		"Ambas": "양쪽",
		"Damero": "바둑판",
		"Aros": "링",
		"Brazalete": "완장",
		"Tribal": "트라이벌",
		"Cepillo": "크루컷",
		"Un costado": "사이드 삭발",
		"Mullet": "멀릿",
		"Afro": "뽀글",
		"Melena": "장발",
		"Ojos": "눈",
		"Cejas": "눈썹",
		"Accesorio de cabeza": "머리 장식",
		"Raya al medio": "가르마",
		"Coronilla": "정수리",
		"Herradura": "말굽",
		"Normal": "기본",
		"Calvo": "대머리",
		"Rapado": "버즈컷",
		"Cresta": "모히칸",
		"Lados": "투블럭",
		"Degradado": "테이퍼",
		"Entradas": "M자",
		"Cresta ancha": "넓은 모히칸",
		"Raya": "가르마",
		"Franjas": "라인",
		"Nada": "없음",
		"Barba": "턱수염",
		"Candado": "염소수염",
		"Bigote": "콧수염",
		"Sombra": "까칠수염",
		"Patillas": "구레나룻",
		"Mosca": "아랫입술수염",
		"Contorno": "턱선 수염",
		"Barbón": "풀 수염",
		"Manillar": "핸들바",

		"CAMBIAR": "변경",
		"BUSCAR": "검색",
		"SIN RESULTADOS": "결과 없음",
		"SUGERIDAS": "추천",
		"TODAS": "전체",
		"Color libre": "자유 색상",


		"ANTES": "이전",
		"AHORA": "현재",
		"PAÍS DEL CLUB": "클럽 국가",
		"VER LOS {0} CLUBES": "클럽 {0}개 모두 보기",
		"TUS OFERTAS": "내 제안",
		"INICIA DESDE ABAJO": "밑바닥부터 시작",
		"INICIA DONDE QUIERAS": "원하는 곳에서 시작",
		"ELIGE TU CLUB": "클럽 선택",
		"VER LAS {0} OFERTAS": "제안 {0}개 모두 보기",
		"{0} DE TU PAÍS · {1} DEL EXTRANJERO": "국내 {0} · 해외 {1}",
		"DIVISIÓN BLOQUEADA": "잠긴 리그",
		"TELEMETRÍA": "텔레메트리",
		"Contadores de uso guardados en este teléfono. Sirven para saber qué partes del juego se usan y no hay ningún dato tuyo dentro.":
			"이 폰에 저장된 사용 횟수 기록이에요. 게임의 어떤 부분이 쓰이는지 알기 위한 것이고, 개인 정보는 전혀 들어 있지 않아요.",
		"COMPARTIR CONTADORES":
			"기록 공유",
		"Estos mismos números se envían al desarrollador para saber qué partes del juego se usan. Nunca van tu nombre, tu partida ni nada que te identifique. Apágalo cuando quieras.":
			"이 숫자들은 게임의 어떤 부분이 쓰이는지 알기 위해 개발자에게 전송돼요. 이름, 세이브 데이터, 나를 식별할 수 있는 정보는 절대 포함되지 않아요. 언제든 끌 수 있어요.",
		"VER CONTADORES": "기록 보기",
		"BORRAR CONTADORES": "기록 지우기",
		"PEDIR BORRADO": "삭제 요청",
		"CERRAR": "닫기",
		"NO": "NO",
		"MANTEN PARA REINICIAR TODO": "길게 눌러 모두 초기화",
		"MANTEN PARA PEDIR CAMBIO": "길게 눌러 교체 요청",
		"BORRAR TODO": "모두 삭제",
		"MANTÉN PULSADO PARA BORRAR TODO": "길게 눌러 모두 삭제",

		"REY DEL GOL": "득점왕",
		"REY DEL PASE": "도움왕",
		"{0} lidera el goleo con {1}": "{0}, {1}골로 득점 선두",
		"{0} acaba de máximo goleador con {1}": "{0}, {1}골로 득점왕 확정",
		"{0} manda en asistencias con {1}": "{0}, 도움 {1}개로 도움 선두",
		"{0} acaba líder de asistencias con {1}": "{0}, 도움 {1}개로 도움왕 확정",
		"{0} es el jugador de la temporada ({1})": "{0}, 시즌 최우수 선수 ({1})",
		"CAMPEÓN DE LIGA": "리그 우승",
		"DESCIENDE": "강등",
		"BOMBAZO": "최고 이적료",
		"SORPRESA": "이변",
		"{0} se lleva la liga": "{0}, 리그 우승",
		"{0} baja a {1}": "{0}, 강등 확정: {1}",
		"{0} es el fichaje más caro de la ventana": "{0}, 이번 이적 시장 최고액 영입",
		"{0} cuelga las botas": "{0}, 현역 은퇴",
		"{0} tumba al {1}": "{0}, {1} 격파",
		"{0} lleva {1} victorias seguidas": "{0}, {1}연승 행진",
		"{0} lleva {1} partidos sin ganar": "{0}, {1}경기 무승",
		"El {0} destituye a {1}": "{0}, {1} 감독 경질",
		"{0} coge el banquillo del {1}": "{0}, {1} 감독 부임",
		"{0} deja el {1} y coge el {2}": "{0}, {1} 떠나 {2} 감독으로",
		"El {0} se lleva a {1} del {2}": "{0}, {2}의 {1} 감독 빼 와",

		"SELECCIONES": "대표팀",
		"{0} deja de ser seleccionador de {1}": "{0}, {1} 대표팀 감독 사임",
		"{0}, nuevo seleccionador de {1}": "{0}, {1} 대표팀 신임 감독",
		"{0} deja el {1} para dirigir a {2}": "{0}, {1} 떠나 {2} 지휘봉",
		"{0} deja la selección de {1} y coge la de {2}": "{2} 신임 감독 {0}, 전 {1} 감독",
		"{0} deja la selección de {1} y coge el {2}": "{0}, {1} 대표팀 떠나 {2} 감독으로",

		"INVERSOR": "투자자",
		"CRISIS": "위기",
		"{0} cambia de dueño: llega dinero para fichar": "{0} 구단주 교체: 영입 자금 확보",
		"{0} entra en crisis y tendrá que vender": "{0}, 재정 위기로 선수 판매 불가피",
		"Se acaba el dinero del nuevo dueño del {0}": "{0} 새 구단주의 자금 바닥나",
		"NOTICIAS": "뉴스",
		"Tu club todavía no ha sido noticia.": "내 클럽은 아직 뉴스에 나온 적이 없어요.",
		"Tu liga todavía no ha sido noticia.": "내 리그는 아직 뉴스에 나온 적이 없어요.",
		"El mundo todavía no ha dado que hablar.": "아직 세상은 조용해요.",
		"Un jeque compra el {0}: viene a ganarlo todo": "중동 부호, {0} 인수: 모든 우승 노린다",
		"Un magnate compra el {0}: llega dinero para fichar": "거물 사업가, {0} 인수: 영입 자금 확보",
		"Un fondo compra el {0} para revenderlo": "투자 펀드, 되팔 목적으로 {0} 인수",
		"PRIMER PARTIDO": "첫 경기",
		"BODA": "결혼",
		"DIVORCIO": "이혼",
		"RUPTURA": "결별",
		"JUNTOS": "함께",
		"A DISTANCIA": "장거리 연애",
		"{0} se casa": "{0}, 결혼",
		"{0} se divorcia": "{0}, 이혼",
		"{0} rompe con su pareja": "{0}, 연인과 결별",
		"{0} llega al {1} con su pareja": "{0}, 연인과 함께 {1} 입단",
		"{0} llega solo al {1}: su pareja no se muda": "{0}, 홀로 {1} 입단: 연인은 이사 안 해",
		"NOTICIA": "뉴스",
		"EL DOBLETE": "더블",
		"EL TRIPLETE": "트레블",
		"ASCENDISTE": "승격",
		"DESCENDISTE": "강등",
		"de {0} equipos": "{0}팀 중",
		"Bolsa": "가방",
		"Mallas": "타이츠",
		"Térmicas": "보온",
		"Rodillera": "무릎 보호대",
		"Material": "소재",
		"Neopreno": "네오프렌",
		"LEER": "읽기",
		"SIN PERDER": "무패",
		"ORDEN": "순서",
		"ORDENAR": "정렬",
		"TUS REDES": "내 SNS",
		"TU POST": "내 게시글",
		"FUEGO": "불꽃",
		"APLAUSO": "박수",
		"HINCHA": "팬",
		"MARCA": "브랜드",
		"¿CONTESTAS?": "답글?",
		"No contestas. Pasa solo.": "답 안 해요. 저절로 지나가요.",
		"Toca mejorar. Y mejoraré.": "더 나아져야죠. 나아질게요.",
		"En el próximo hablo yo. #CALLABOCAS": "다음엔 내가 말해요. #조용",
		"SE COBRA": "정산",
		"te ha mencionado · nota {0}": "언급했어요 · 평점 {0}",
		"Tu muro todavía está vacío.": "내 담벼락이 아직 비어 있어요.",
		"El Diario": "더 데일리",
		"@eldiario": "@daily_news",
		"La Grada": "서포터즈",
		"@lagradafiel": "@supporters_fl",
		"@el_10_del_equipo": "@team_no10",
		"Hincha rival": "라이벌 팬",
		"@ultra_norte": "@ultra_north",
		"Tu marca": "내 브랜드",
		"@tumarca_oficial": "@mybrand_official",
		"tras la {0}": "{0} 이후",
		"SEGUIDORES": "팔로워",
		"RESPONDER": "답글",
		"RESPONDIENDO A": "답글 대상",
		"Nos vemos en el campo. #ALLÍTEESPERO": "경기장에서 봐요. #거기서기다릴게",
		"¡Así se habla, capitán!": "그렇게 말해야죠, 캡틴!",
		"Mucho hablar...": "말만 많네요...",
		"TE ETIQUETAN": "태그됨",
		"Un rival te ha mencionado antes del partido. Todo el mundo mira qué contestas.": "라이벌이 경기 전에 당신을 언급했어요. 모두가 어떻게 답할지 지켜보고 있어요.",
		"Lo dijiste en redes. Hoy te toca callar.": "SNS에 올렸죠. 오늘은 입을 다물 차례예요.",
		"antes de la {0}": "{0} 전에",
		"{0} te ha etiquetado": "{0}님이 당신을 태그했어요",
		"¿ENTRAS AL TRAPO?": "맞받아칠래요?",
		"Ni le contestas. Tu técnico lo agradece.": "답장조차 안 했어요. 감독님이 고마워해요.",
		"el campo es mi casa. A ver si esta vez das la cara.": "경기장은 제 집이에요. 이번엔 얼굴 좀 보여줄지 두고 봐요.",
		"¿te acuerdas de la final? Yo sí. Te espero en el campo.": "결승 기억나요? 저는 기억해요. 경기장에서 기다릴게요.",
		"Hablamos en el campo.": "경기장에서 얘기해요.",
		"La final ya pasó. Ahora, otra historia.": "결승은 끝났어요. 이제는 또 다른 이야기예요.",
		"LA REVANCHA": "설욕전",
		"MENSAJES": "메시지",
		"AGRADECER": "감사",
		"DISTE TU PALABRA": "약속했어요",
		"No tienes mensajes.": "메시지가 없어요.",
		"{0}, de la grada": "관중석 팬 {0}",
		"CADUCA EN {0}": "{0}경기 남음",
		"TU ASISTENCIA · {0}": "내 도움 · {0}",
		"RUMOR": "루머",
		"PALABRA": "약속",
		"Si no contestas, no pasa nada.": "답장하지 않아도 괜찮아요.",
		"¿Con qué festejo nos celebras el próximo gol en casa?": "다음 홈 골은 어떤 세리머니로 축하해 줄 거예요?",
		"ENCUESTA": "투표",
		"{0} VOTOS": "{0}표",
		"Ganó {0}": "우승: {0}",
		"Lo votó {0}": "투표: {0}",
		"LLEVAR AL BOMBO": "추첨기로",
		"Abre tu bombo de CELEBRACIONES.": "내 세리머니 추첨기를 열어 보세요.",
		"SI SALE EN CASA": "홈에서만",
		"Tú celebras a tu manera.": "내 방식대로 세리머니해요.",
		"NO CUESTA NADA": "무료",
		"Tu próximo gol en casa": "다음 홈 골",
		"LA PEÑA LA PIDE": "팬들의 요청",
		"encuesta del mes · gana {0}": "이달의 투표 · {0} 우승",
		"La peña vota el festejo del mes. Gana {2}: ¡lo queremos ver en casa, {0}!": "팬들이 이달의 세리머니를 뽑았어요. {2} 우승: 홈에서 보고 싶어요, {0}!",
		"{0} le hace caso a su peña: {2} en casa.": "{0} 선수가 팬들의 말을 들었어요: 홈에서 {2}.",
		"¡Lo pedimos y {0} lo hizo! {2} delante de la peña.": "우리가 부탁했더니 {0} 선수가 해냈어요! 팬들 앞에서 {2}.",
		"Llegar a la fase de liga": "리그 페이즈 진출",
		"Ganar el cruce de {0}": "{0} 라운드 승리",
		"¡La selfie de mi vida con {0}! Ya es mi foto de perfil.": "{0} 선수와 인생 셀카! 이제 내 프로필 사진이에요.",
		"Me firmó y encima nos hicimos una selfie. Gracias, {0}.": "사인도 받고 셀카도 찍었어요. 고마워요, {0}.",
		"Salió movida, pero os juro que es {0}.": "흔들렸지만 맹세코 {0} 선수예요.",
		"TECLAS": "키",
		"PULSA UNA TECLA": "키를 누르세요",
		"MANTEN PARA RESTABLECER": "길게 눌러 초기화",
		"FAN": "팬",
		"Pillaron al revendedor que se colaba en la firma de {0}. ¡Bien visto!": "{0} 선수 사인회에 몰래 끼어들던 되팔이꾼이 잡혔대요. 눈썰미 좋네요!",
		"A {0} no se la cuelan: seguridad saca a un revendedor de su firma.": "{0} 선수는 못 속여요: 경호원이 사인회에서 되팔이꾼을 내보냈어요.",
		"Ya hay firmas de {0} a la venta por 5 €. El de la cola se puso las botas.": "{0} 선수 사인이 벌써 5유로에 팔리고 있어요. 줄 서 있던 그 사람, 한몫 챙겼네요.",
		"Nuestra tarde de firmas con {0} ya está en reventa. No era la idea.": "{0} 선수와 함께한 저희 사인회가 벌써 되팔리고 있네요. 이러려던 게 아니었는데요.",
		"Esperé toda la tarde para ver a {0} y me sacó seguridad. Sólo quería su firma.": "{0} 선수를 보려고 오후 내내 기다렸는데 경호원이 저를 내보냈어요. 사인만 받고 싶었는데.",
	},

























	"match": {
		"Mejor del Mundial": "세계 대회 MVP",
		"Mejor de la Copa continental": "대륙컵 MVP",
		"Bota de la Copa continental": "대륙컵 득점왕",
		"Mejor (Mundial)": "MVP (세계)",
		"Mejor (Continental)": "MVP (대륙)",
		"Bota (Continental)": "득점왕 (대륙)",
		"Figura del Mundial": "세계 대회 스타",
		"JUEGOS OLÍMPICOS": "종합 대회",
		"Campeón Olímpico": "종합 대회 우승",
		"Oro olímpico": "종합 대회 금메달",
		"Oro Olímpico": "종합 대회 금메달",
		"Ganar el oro en los Juegos Olímpicos.": "종합 대회에서 금메달 획득.",
		"El oro que no se compra. Se cuelga del cuello.": "돈으로는 살 수 없는 금메달. 목에 걸어야 해요.",
		"JUEGOS OLÍMPICOS: oro para {0}": "종합 대회: {0} 금메달",
		"{0}: ORO en los Juegos Olímpicos": "{0}: 종합 대회 금메달",
		"{0}: plata en los Juegos Olímpicos": "{0}: 종합 대회 은메달",
		"{0}: bronce en los Juegos Olímpicos": "{0}: 종합 대회 동메달",


		"NO SOLTÓ": "끝까지 버텼다",
		"SE LA APRETÓ": "힘에서 밀렸다",
		"ÉSTA VA POR TI": "이건 널 위한 거야",
		"SE LA APRETARON, Y LO SABE": "밀렸다, 본인도 알아",
		"COMO SIEMPRE: NO SOLTÓ": "역시나 끝까지 버텼다",
		"HOY SE LA APRETARON": "오늘은 밀렸다",
		"NI UN CENTÍMETRO": "한 치도 안 밀려",
		"SE DEJÓ APRETAR": "순순히 밀려 줬다",
		"NO SOLTÓ, POR UNA VEZ": "이번만은 버텼다",
		"SE LA APRETÓ. LE DA IGUAL": "밀렸다. 신경 안 써",



		"TU EX TÉCNICO NO CONTABA CONTIGO": "나를 안 쓰던 옛 감독",
		"TU EX TÉCNICO APLAUDE TU GOL": "옛 감독이 내 골에 박수",
		"GOL A TU EX TÉCNICO": "옛 감독 상대로 골",
		"TU EX TÉCNICO SE VA SIN MIRARTE": "옛 감독, 눈길도 안 주고 퇴장",
		"TU EX TÉCNICO TE APLAUDE": "옛 감독이 박수를 보내요",
		"TU EX TÉCNICO FESTEJA": "옛 감독의 세리머니",
		"APRETASTE A TU EX TÉCNICO": "옛 감독을 제압했다",
		"TU EX TÉCNICO PUEDE CONTIGO": "옛 감독이 한 수 위",
		"¡PICA RÁPIDO!": "빠르게 탭!",
		"LLEVA LA RAYA HASTA TU LADO": "선을 내 쪽으로 끌어와요",



		"EL VOLADO": "동전 던지기",
		"Cara": "앞면",
		"Sol": "뒷면",
		"¿Cara o sol?": "앞면? 뒷면?",
		"Tu equipo pide {0}.": "우리 팀 선택: {0}.",
		"La moneda dice {0}.": "동전 결과: {0}.",
		"¡GANAS EL VOLADO! Pateas con tu gente.": "동전 던지기 승리! 내 팬들 앞에서 차요.",
		"Pierdes el volado: pateas ante la grada rival.": "동전 던지기 패배: 상대 관중석 앞에서 차요.",

		"¡LE DISTE AL ÁRBITRO!": "심판을 맞혔어요!",
		"ROJA DIRECTA · {0} {1} DE SANCIÓN": "다이렉트 퇴장 · 출전 정지 {0} {1}",






		"El derbi. Fuera de casa. Aquí no se perdona nada.": "더비. 원정 경기. 여기선 아무것도 용서되지 않아요.",
		"Derbi. Noventa minutos que se recuerdan un año.": "더비 데이. 1년 내내 회자될 90분.",
		"Última jornada. Lo que pase aquí ya no se arregla.": "최종 라운드. 여기서 벌어진 일은 되돌릴 수 없어요.",
		"{0}. Y tú llegas en racha.": "{0}. 게다가 폼도 최고예요.",

		"Te van a apretar arriba desde el primer balón. Sacúdetelos rápido.": "첫 볼부터 높은 압박이 들어와요. 빨리 떨쳐 내세요.",
		"Hoy toca autobús: once atrás esperándote. La paciencia también juega.": "오늘은 버스 수비예요: 11명이 내려앉아 기다려요. 인내심도 실력이에요.",
		"Te marcan al hombre. Cada carrera tuya se lleva a uno puesto.": "맨투맨 마크예요. 내가 뛸 때마다 한 명씩 따라붙어요.",
		"Línea alta y sin prisa. La espalda de esa zaga es la jugada.": "높은 라인에 서두르지 않는 팀. 저 수비 라인 뒤 공간이 해법이에요.",
		"Campo de {0}. A ver quién se acuerda de ti al final.": "{0}의 홈구장. 경기가 끝날 때 누가 내 이름을 기억할까요.",

		"Enfrente, {0}. Una temporada juntos en {1}; se acuerda de ti.": "맞은편에 {0} 선수. {1}에서 한 시즌을 함께했죠. 나를 기억해요.",
		"Enfrente, {0}: {2} temporadas juntos en {1}. Te conoce de memoria.": "맞은편에 {0} 선수: {1}에서 {2}시즌을 함께했어요. 나를 훤히 꿰고 있어요.",
		"{0} te conoce de {1}. Sabe hacia dónde vas a romper.": "{0} 선수는 {1} 시절부터 나를 알아요. 내가 어느 쪽으로 파고들지 알고 있어요.",
		"{0} jugó contigo en {1}: te lee antes de que toques.": "{0} 선수는 {1}에서 함께 뛰었어요: 공을 잡기 전부터 나를 읽어요.",
		"Lo callaste. Su estadio entero, callado.": "잠재웠어요. 상대 경기장 전체가 조용해요.",
		"En el 90 y en su casa. De esos que no se olvidan.": "90분에, 그것도 원정에서. 잊지 못할 골이에요.",
		"Le has dado la vuelta. Tú solo.": "혼자서 경기를 뒤집었어요.",
		"Tres. Te llevas el balón a casa.": "세 골. 매치볼은 내 거예요.",
		"Y van dos. El campo es tuyo.": "두 골째. 경기장은 내 무대예요.",
		"En el derbi. Ese lo vas a contar mucho tiempo.": "더비에서. 두고두고 이야기할 골이에요.",
		"Empate. Y quedan minutos.": "동점. 시간은 아직 남았어요.",
		"Te lo empatan al final. Y te toca a ti arreglarlo.": "막판에 동점을 허용했어요. 이제 내가 해결해야 해요.",
		"{0} se pone por delante. La grada lo nota.": "{0}, 앞서 나가요. 관중석도 느끼고 있어요.",
		"Otro. Esto se está yendo.": "또 먹혔어요. 경기가 빠져나가고 있어요.",

		"Vuelves a {0}. Aquí jugaste {1} temporadas.": "{0}에 돌아왔어요. 여기서 {1}시즌을 뛰었죠.",
		"Enfrente, {0}. Tu antiguo club.": "맞은편에 {0}. 내 친정 클럽이에요.",
		"{0} te cedió. Hoy le devuelves el favor.": "{0}에서 나를 임대 보냈어요. 오늘 그 빚을 갚아 줄 차례예요.",
		"{1} temporadas en {0}. Hoy celebras allí.": "{0}에서 {1}시즌. 오늘은 거기서 세리머니를 해요.",
		"{0} te dejó ir hace nada. Error suyo.": "{0}에서 얼마 전에 나를 내보냈어요. 그쪽 실수죠.",
		"Le marcas a {0}, tu antiguo club.": "친정 클럽 {0} 상대로 골이에요.",
		"{0} jugó contigo en {1}. Y hoy te marca.": "{0} 선수는 {1}에서 나와 함께 뛰었어요. 그런데 오늘 우리에게 골을 넣네요.",
		"Tu club cedió a {0}. Y él se lo cobra.": "우리 클럽이 임대 보냈던 {0} 선수. 제대로 갚아 주네요.",
		"{0}: {1} temporadas en tu club. Hoy, rival.": "{0} 선수: 우리 클럽에서 {1}시즌. 오늘은 적이에요.",
		"{0}, ex de tu club. Duele el doble.": "{0} 선수, 우리 클럽 출신이에요. 두 배로 아프네요.",
		"El palo. Un centímetro más adentro y estabas celebrando.": "골대. 1cm만 안쪽이었으면 세리머니 중이었을 거예요.",
		"Otra vez el hierro. Hoy no te quiere.": "또 골대예요. 오늘은 운이 안 따라 줘요.",
		"Se lo pusiste. El gol es suyo; el pase, tuyo.": "떠먹여 줬어요. 골은 동료 몫, 패스는 내 몫.",


		"Levanta la mano. Nadie lo mira. Otra vez.": "손을 들어요. 아무도 안 봐요. 또요.",
		"Está solo y lo ve todo el estadio menos sus compañeros.": "완전히 비어 있는데, 경기장 전체가 다 보는데 동료들만 못 봐요.",
		"La juegan por el otro lado. Ya ni la pide.": "반대쪽으로만 공이 가요. 이제 달라고도 안 해요.",
		"Se ofrece, le dan la espalda. Este equipo no es suyo.": "받으러 가도 등을 돌려요. 이 팀은 그의 팀이 아니에요.",
		"Había pase y eligieron el otro. Pasa mucho últimamente.": "패스 길이 있었는데 다른 쪽을 골랐어요. 요즘 자주 그래요.",
		"Le llega y el estadio entero silba. Se le va larga.": "공이 오자 경기장 전체가 야유해요. 볼 컨트롤이 길어져요.",
		"El balón es suyo. El abucheo también. La pierde.": "공도 그의 것, 야유도 그의 것. 결국 뺏겨요.",
		"Un pito por cada toque. No controla ni la más fácil.": "터치할 때마다 야유. 쉬운 공도 컨트롤을 못 해요.",
		"La grada le cae encima y el control se le va largo.": "관중석의 압박에 볼 컨트롤이 길어져요.",



		"Uno se levanta en la tercera fila. Y no es para aplaudir.": "세 번째 줄에서 한 명이 일어서요. 박수 치려는 건 아니에요.",
		"Ya hay quien le lleva la cuenta de los fallos desde la grada.": "관중석에선 벌써 그의 실수를 세는 사람이 있어요.",
		"Se oye a uno solo por encima de todos, y no dice nada bonito.": "한 목소리가 모두를 뚫고 들려요. 좋은 말은 아니에요.",
		"El estadio se levanta sólo de verlo con el balón.": "공을 잡는 것만 봐도 경기장이 들썩여요.",
		"Corean su nombre. Y todavía no ha hecho nada.": "그의 이름을 연호해요. 아직 아무것도 안 했는데요.",
		"Se oye el murmullo en cuanto la toca.": "공을 잡는 순간 웅성거림이 들려요.",
		"Hasta su propia gente le silba al oír su nombre.": "홈 팬들마저 그의 이름에 야유를 보내요.",
		"Silbidos de los suyos. Hoy lo miran con lupa.": "자기 팬들의 휘파람. 오늘은 터치 하나하나가 도마 위에 올라요.",
		"Su grada no le perdona una. Cada toque, con lupa.": "홈 관중이 하나도 용서하지 않아요. 터치마다 현미경 검사.",
		"Ganado en su campo. Eso vale doble.": "원정에서 승리. 두 배의 가치예요.",
		"El derbi es tuyo.": "더비는 내 거예요.",
		"Dijiste que lo ganarías, y lo ganaste.": "이긴다고 했고, 진짜 이겼어요.",
		"Hablaste antes del derbi. Hoy te toca callar.": "더비 전에 큰소리쳤죠. 오늘은 입 다물 차례예요.",
		"BRAVATA": "큰소리",
		"{0} cumplió su palabra ante el {1}": "{0}, {1} 상대로 약속 지켜",
		"{0} se traga sus palabras ante el {1}": "{0}, {1} 상대로 큰소리치더니 망신",
		"Cumpliste tu palabra ante el {0}": "{0} 상대로 약속을 지켰어요",
		"Te tragas tus palabras ante el {0}": "{0} 상대로 큰소리친 게 무색해졌어요",
		"Se acabó. Y lo dejaste escapar.": "끝났어요. 다 잡은 경기를 놓쳤어요.",


		"Desde tu campo. Todo el césped por delante.": "우리 진영에서 시작. 경기장 전체가 앞에 있어요.",
		"Balón tuyo en tu mitad. Ahora hay que cruzarla entera.": "우리 진영에서 내 공. 이제 경기장을 다 가로질러야 해요.",
		"Se la das y sigues. Así se sale de la presión.": "주고 달리기. 이렇게 압박을 벗겨 내요.",
		"Un toque y a correr. La presión se queda atrás.": "원터치 후 질주. 압박은 뒤에 남겨져요.",
		"Se la das a {0}, que ya sabía que venía.": "{0} 선수에게 패스. 올 줄 알고 있었어요.",
		"{0} y tú, de memoria. Ni hizo falta mirar.": "{0} 선수와 나, 눈 감고도 통해요. 볼 필요도 없었어요.",
		"Medio campo cruzado sin un susto.": "하프라인을 무사히 넘었어요.",
		"Ya estás en su mitad. Y con el balón.": "이제 상대 진영이에요. 공도 가지고 있어요.",
		"Se repliegan. Te dejaron llegar, no entrar.": "물러서요. 오게는 해 주지만 들어가게는 안 해 줘요.",
		"Cuarenta y cinco segundos de toque. Y nada que contar.": "45초 동안 패스만. 그리고 남은 게 없어요.",
		"Demasiado solo, demasiado tiempo. Te la quitaron.": "너무 혼자, 너무 오래. 뺏겼어요.",
		"Se enamoró del balón. Y lo pagó.": "공과 사랑에 빠졌어요. 그리고 대가를 치렀어요.",
		"Te bajan en tu campo. Falta, y a empezar de nuevo.": "우리 진영에서 넘어뜨려요. 파울, 다시 시작이에요.",
		"Salió de tu área y acabó en la suya. La jugada es tuya.": "우리 박스에서 나와 상대 박스에서 끝났어요. 내가 만든 공격이에요.",
		"Tú la sacaste, él la metió. Así se construye.": "내가 빌드업하고, 동료가 넣었어요. 이게 빌드업이에요.",

		"Robo en tu campo. ¡A la contra!": "우리 진영에서 볼 탈취. 역습!",
		"La recuperas en tu mitad. Ahora, rápido.": "우리 진영에서 되찾았어요. 이제 빠르게.",
		"Están todos arriba. Hay campo para correr.": "상대가 전부 올라왔어요. 달릴 공간이 있어요.",
		"Se volcaron buscando el gol. Su espalda es tuya.": "골을 노리고 전원 공격이에요. 뒷공간은 내 거예요.",
		"Con uno menos, a la contra. Es lo que toca.": "한 명이 적으니 역습으로. 지금은 그게 답이에요.",
		"Diez contra once: se defiende y se sale rápido.": "10 대 11: 수비하고 빠르게 역습.",
		"Se la das y arrancas. Cada segundo cuenta.": "패스하고 출발. 1초가 아까워요.",
		"Pase y a correr. Que no les dé tiempo a volver.": "패스하고 질주. 상대가 돌아올 시간을 주지 마세요.",
		"Tardaste. Ya volvieron todos.": "너무 느렸어요. 벌써 다 돌아왔어요.",
		"La contra se enfrió. Ya están ordenados atrás.": "역습이 식었어요. 상대 수비가 정돈됐어요.",
		"Falta táctica. Te cortan la contra.": "전술적 파울. 역습이 끊겼어요.",
		"Contra de manual. De tu campo a la red.": "교과서 같은 역습. 우리 진영에서 골망까지.",
		"Tú la llevaste, él la metió. Contra perfecta.": "내가 몰고 가고, 동료가 마무리. 완벽한 역습이에요.",
		"Juegan con diez. Busca al que está libre.": "상대가 10명이에요. 빈 동료를 찾으세요.",
		"Tres contra dos. Uno de los tuyos está solo.": "3 대 2. 우리 편 한 명이 비어 있어요.",

		"Contragolpe": "역습",
		"El hombre de más": "수적 우위",
		"Te la quitaron en tu área. Ese regalo no se devuelve.": "우리 박스에서 뺏겼어요. 그 선물은 돌아오지 않아요.",
		"Perdida en tu área, gol en tu portería. Así de corto.": "우리 박스에서 뺏기고, 우리 골문에 골. 그만큼 짧아요.",
		"Te la roban ahí mismo y tu portero te salva la cara.": "바로 거기서 뺏기고, 골키퍼가 체면을 살려 줘요.",
		"Se la quitaron en tu área y la tiraron fuera. Hoy sí; mañana, no.": "우리 박스에서 뺏겼는데 상대가 빗나갔어요. 오늘은 운이 좋았지만, 다음엔 없어요.",
		"Desde el portero. Corta, y sin regalar.": "골키퍼부터. 짧게, 아무것도 내주지 말고.",
		"Le cortan el primer pase. En tu área. Malo.": "첫 패스가 끊겨요. 그것도 우리 박스에서. 위험해요.",
		"Saque de meta. Tu portero tiene el balón y tú, la decisión.": "골킥. 공은 골키퍼에게, 결정은 나에게.",
		"Te vienen a buscar arriba. El portero no puede pensárselo.": "상대가 높이 올라와 압박해요. 골키퍼는 고민할 시간이 없어요.",
		"Presión alta al saque. Corto es un riesgo; largo, una moneda al aire.": "골킥에 높은 압박. 짧게는 위험하고, 길게는 운에 맡기는 거예요.",
		"En corto, a los pies. Salida limpia desde atrás.": "짧게, 발밑으로. 깔끔한 빌드업 시작.",
		"Saque corto y balón dominado. Así empieza una jugada, no un despeje.": "짧은 골킥에 안정된 볼 컨트롤. 걷어 내기가 아니라 공격의 시작이에요.",
		"La revienta y la baja un compañero. Medio campo de un golpe.": "길게 차고 동료가 받아 내요. 한 번에 경기장 절반.",
		"Largo y con destinatario. La gana tu jugador y sigue el juego.": "받을 사람이 정해진 롱볼. 우리 선수가 따내고 플레이가 이어져요.",
		"Tu portero te busca. Ahora es tuya, con todo el campo por delante.": "골키퍼가 나를 찾았어요. 이제 내 공, 경기장 전체가 앞에 있어요.",
		"Del guante a tus pies. A partir de aquí, la jugada es tuya.": "장갑에서 내 발로. 여기서부턴 내가 만드는 공격이에요.",
		"La reventó y la ganaron ellos. Saque largo, balón perdido.": "길게 찼는데 상대가 따냈어요. 롱킥, 볼 소유권 상실.",
		"Saque largo a ninguna parte: cabeza rival y a defender.": "허공으로 간 롱킥: 상대 헤더, 다시 수비.",
		"El saque no encuentra a nadie. Balón muerto y a empezar otra vez.": "골킥이 아무에게도 안 갔어요. 볼이 죽고, 다시 시작.",
		"Se fue sin dueño. Un saque de meta que no llegó a nadie.": "주인 없이 사라졌어요. 아무에게도 닿지 않은 골킥.",
		"Se la quitan al primer pase, a un paso de tu portería. Regalo.": "골문 바로 앞에서 첫 패스를 뺏겼어요. 선물이에요.",
		"Del saque de meta al fondo de la red. Toda la cancha en una jugada.": "골킥에서 골망까지. 한 번의 공격으로 경기장 전체를.",
		"Empezó en el guante de tu portero y acabó en gol. Así se sale.": "골키퍼 장갑에서 시작해 골로 끝났어요. 이게 빌드업이에요.",
		"De tu portero a la red sin pasar por ti. Lo viste de cerca.": "나를 거치지 않고 골키퍼부터 골망까지. 가까이서 지켜봤어요.",
		"Gol de la salida de meta. Tú no la tocaste, pero la viste nacer.": "골킥에서 나온 골. 공은 안 만졌지만 그 시작을 봤어요.",
		"Salió de tu portero y la acabaste tú. Cien metros de jugada.": "골키퍼에게서 나와 내가 마무리했어요. 100m짜리 공격이에요.",
		"Saque de meta, campo cruzado y gol tuyo. De área a área.": "골킥, 경기장 가로지르고, 내 골. 박스 투 박스.",
		"Saque de banda en corto, a tus pies. Ahora decides tú.": "짧은 스로인, 내 발밑으로. 이제 내가 결정해요.",
		"Te la saca el lateral y la jugada sigue. Balón cuidado.": "풀백의 스로인, 플레이가 이어져요. 공을 지켰어요.",
		"Te la saca al pecho. Bájala y a jugar.": "가슴으로 오는 스로인. 떨어뜨리고 플레이.",
		"Saque de banda, control de pecho y la jugada viva.": "스로인, 가슴 트래핑, 공격은 계속돼요.",
		"La colgaron con las manos y la metiste con la cabeza.": "손으로 던져 주고, 내가 머리로 넣었어요.",
		"Saque de banda al área y cabezazo a la red. De pizarra.": "박스 안으로 롱 스로인, 헤더로 골망. 작전판 그대로예요.",
		"La cuelgan desde la banda y la despejan ellos. A por la siguiente.": "터치라인에서 던져 넣었지만 상대가 걷어 냈어요. 다음 기회로.",
		"Saque largo al área y cabeza rival. Esta vez no.": "박스로 롱 스로인, 상대 수비 머리. 이번엔 아니에요.",
		"Cabezazo tras el saque de banda y el portero lo saca.": "스로인 후 헤더, 골키퍼가 막아 내요.",
		"Saque largo, remate de cabeza y una parada de las buenas.": "롱 스로인, 헤더, 그리고 엄청난 선방.",
		"Saque de banda al área, cabezazo y fuera. Faltó dirección.": "박스로 스로인, 헤더, 빗나가요. 방향이 아쉬웠어요.",
		"La peinas tras el saque largo y se marcha. Cerca.": "롱 스로인을 머리로 돌려놨는데 빗나가요. 아까워요.",





		"SELECCION": "대표팀",
		"LIBRO DE RECORDS": "기록집",




		"Campeón del Mundo": "세계 대회 우승",
		"Bota de Oro del Mundial": "세계 대회 득점왕",
		"Campeón de Champions": "엘리트컵 우승",
		"Campeón de Europa League": "유로파컵 우승",
		"Campeón del Mundo de Clubes": "클럽 세계 대회 우승",
		"Campeón continental": "대륙 대회 우승",
		"Campeón de Liga": "리그 우승",
		"Campeón de Copa": "컵 우승",
		"Ascenso": "승격",
		"Mejor Jugador de la Liga": "리그 시즌 최우수 선수",
		"Pichichi de la Liga": "리그 득점왕",
		"Máximo Asistente de la Liga": "리그 도움왕",
		"Mejor de la Champions": "엘리트컵 시즌 최우수 선수",
		"Bota de la Champions": "엘리트컵 득점왕",
		"Máximo Asistente de la Champions": "엘리트컵 도움왕",
		"Mejor de la Europa League": "유로파컵 시즌 최우수 선수",
		"Bota de la Europa League": "유로파컵 득점왕",
		"Máximo Asistente de la Europa League": "유로파컵 도움왕",


		"Campeón de Conference": "챌린지컵 우승",
		"Mejor de la Conference": "챌린지컵 시즌 최우수 선수",
		"Bota de la Conference": "챌린지컵 득점왕",
		"Máximo Asistente de la Conference": "챌린지컵 도움왕",
		"Mejor de la Copa": "컵 대회 시즌 최우수 선수",
		"Bota de la Copa": "컵 대회 득점왕",
		"Máximo Asistente de la Copa": "컵 대회 도움왕",
		"Mejor del Mundial de Clubes": "클럽 세계 대회 시즌 최우수 선수",
		"Bota del Mundial de Clubes": "클럽 세계 대회 득점왕",
		"Máximo Asistente del Mundial de Clubes": "클럽 세계 대회 도움왕",
		"Jugador del Partido": "경기 최우수 선수",
		"Jugador del Mes": "이달의 선수",
		"Bota de Oro": "득점왕",
		"MVP de la temporada": "시즌 최우수 선수",
		"Bota (Mundial)": "득점왕 (세계)",
		"Mundial de Clubes": "클럽 세계 대회",
		"Continental (selección)": "대륙 (대표팀)",
		"Liga": "리그",
		"Copa": "컵",
		"Mejor (Liga)": "MVP (리그)",
		"Pichichi (Liga)": "득점왕 (리그)",
		"Asist. (Liga)": "도움왕 (리그)",
		"Mejor (Champions)": "MVP (엘리트)",
		"Bota (Champions)": "득점왕 (엘리트)",
		"Asist. (Champions)": "도움왕 (엘리트)",
		"Mejor (Europa)": "MVP (유로파)",
		"Bota (Europa)": "득점왕 (유로파)",
		"Asist. (Europa)": "도움왕 (유로파)",


		"Mejor (Conference)": "MVP (챌린지)",
		"Bota (Conference)": "득점왕 (챌린지)",
		"Asist. (Conference)": "도움왕 (챌린지)",
		"Mejor (Copa)": "MVP (컵)",
		"Bota (Copa)": "득점왕 (컵)",
		"Asist. (Copa)": "도움왕 (컵)",
		"Mejor (Mundialito)": "MVP (클럽 세계)",
		"Bota (Mundialito)": "득점왕 (클럽 세계)",
		"Asist. (Mundialito)": "도움왕 (클럽 세계)",
		"MVP": "MVP",



		"PAUSA": "일시정지",
		"REANUDAR": "재개",
		"REINICIAR": "재시작",
		"OTRO PARTIDO": "다시 하기",
		"Toca para saltar": "탭해서 건너뛰기",
		"Gira la vista · suelta para volver a apuntar":
			"시점 회전 · 손을 떼면 다시 조준",
		"Arrastra hacia atrás para apuntar": "뒤로 끌어서 조준",
		"CABEZAZO · arrastra hacia atrás para apuntar": "헤더 · 뒤로 끌어서 조준",
		"Toca el balón · arrastra para girar": "공을 탭 · 끌어서 회전",


		"CENTRO · otro dedo vuelve al tiro": "크로스 · 다른 손가락: 슈팅으로",
		"CENTRO · toca el balón": "크로스 · 공을 탭",



		"modoTIRO": "슈팅",
		"modoCENTRO": "크로스",
		"modoREGATE": "드리블",


		"modoCORRER": "달리기",

		"modoDESPEJE": "걷어내기",

		"modoVOLEA": "발리",
		"modoCABEZAZO": "헤더",
		"modoCHILENA": "바이시클",



		"vistaARCO": "골문",
		"vistaCOMPAÑEROS": "동료",
		"Toca para continuar": "탭해서 계속",


		"Arrastra para seguir": "끌어서 계속",



		"hudNOTA": "평점",
		"notaGOL": "골",
		"notaATAJADA": "선방",
		"notaPALO": "골대",
		"notaFUERA": "빗나감",
		"notaBLOQUEADO": "블록",
		"notaDESPEJE": "걷어냄",
		"notaFUERA DE JUEGO": "오프사이드",
		"notaBALÓN PERDIDO": "볼 뺏김",
		"notaSIN CONTACTO": "헛발질",
		"notaEN PROPIA": "자책골",
		"notaREGATE": "드리블",

		"notaROBO": "탈취",
		"notaDESBORDADO": "돌파당함",
		"notaPENAL": "PK",
		"notaFALTA": "파울",
		"notaPASE": "패스",
		"notaPASE CLAVE": "키패스",
		"notaASISTENCIA": "도움",




		"notaLA ATRAPA EL PORTERO": "골키퍼 캐치",



		"notaSE TE FUE FUERA": "아웃",



		"notaFALLOS SEGUIDOS": "연속 실패",
		"notaNADA": "없음",

		"EJERCICIO {0} DE {1}": "훈련 {0} / {1}",
		"META:": "목표:",
		"EMPEZAR": "시작",
		"SIGUIENTE": "다음",
		"TERMINAR": "종료",
		"LA ACADEMIA": "아카데미",
		"{0} / {1} ESTRELLAS": "별 {0} / {1}",

		"Cinco ejercicios para aprender a jugar."
		+ " Cuantas más estrellas saques, mejores ofertas de club recibirás.":
			"게임을 배우는 다섯 가지 훈련이에요. 별을 많이 딸수록 더 좋은 클럽 제안을 받아요.",
		"JUGAR LA ACADEMIA": "아카데미 플레이",
		"ÚLTIMOS 15 MINUTOS": "마지막 15분",
		"TOCA PARA SEGUIR": "탭해서 계속",
		"SALTAR TUTORIAL": "튜토리얼 건너뛰기",
		"Estos clubes se fijaron en ti. Elige tu oferta:":
			"이 클럽들이 나를 주목했어요. 제안을 고르세요:",
		"ELEGIR YO MISMO": "직접 고르기",
		"FICHAR": "영입",
		"LA OFERTA DEL OJEADOR": "스카우트의 제안",
		"Boletín perfecto: mejor sueldo y rol, y +2 puntos de habilidad.":
			"완벽한 성적표: 더 좋은 주급과 역할, 그리고 스킬 포인트 +2.",
		"Tu boletín mejora el sueldo y el rol de estas ofertas.":
			"성적표 덕분에 이 제안들의 주급과 역할이 좋아져요.",
		"Tu boletín mejora el sueldo de estas ofertas.":
			"성적표 덕분에 이 제안들의 주급이 좋아져요.",


		"TE FICHAN COMO: {0}": "역할: {0}",
		"EMPEZARÍAS: {0}": "시작: {0}",
		"MUÉVETE": "움직여",
		"PÉGALE": "차 봐",
		"ENCARA": "돌파해",
		"SIRVE AL ÁREA": "박스로 배달",









		"Apoya el dedo dentro del círculo: ahí nace todo. Sácalo del círculo y corres hacia el lado contrario al que jalas. Suelta y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "원 안에 손가락을 올려요: 모든 게 거기서 시작돼요. 손가락을 원 밖으로 끌면 당긴 반대 방향으로 달려요. 손을 떼면 그 자리에 딱 멈춰요. 공을 빨간 원판까지 몰고 가세요: 밟으면 꺼지고 다음 원판이 켜져요, 항상 반대편에요. 드리블은 앞으로만 달리는 게 아니라 어디로 갈지 고르는 거예요.",
		"Pisa las 4 zonas rojas, en orden.": "빨간 구역 4곳을 순서대로 밟으세요.",
		"Nadie te la quita y no hay reloj. Las estrellas son para quien las encadena rápido.": "아무도 공을 뺏지 않고 시간 제한도 없어요. 별은 빠르게 이어 가는 사람의 몫이에요.",
		"Jala hacia atrás y sales corriendo hacia el disco.": "뒤로 당기면 원판을 향해 달려 나가요.",
		"Dos tiros de práctica: el primero a puerta vacía, el segundo ya con portero. Después, 2 goles en 4 intentos.": "연습 슈팅 두 번: 첫 번째는 빈 골문, 두 번째는 골키퍼가 있어요. 그다음 4번 시도에 2골.",
		"Los dos primeros no puntúan. En los otros, cuantos menos intentos gastes, más estrellas.": "처음 두 번은 점수에 안 들어가요. 나머지는 시도를 적게 쓸수록 별이 많아요.",
		"Las cuatro zonas": "네 구역",
		"Tiro a puerta": "슈팅 연습",
		"Jala hacia atrás, como una resortera: la guía apunta hacia"
		+ " adelante. Al soltar, toca el balón — y dónde lo tocas manda."
		+ " La costura marca el centro: ahí sale tenso. Cuanto más abajo"
		+ " de ella, más lo elevas, hasta la cuchara. Y cuanto más al"
		+ " borde, menos potencia: el pepinazo va al centro. Con dos dedos"
		+ " giras la vista y apuntas desde otro ángulo.":
			"새총처럼 뒤로 당기세요: 가이드가 앞을 조준해요. 손을 떼면 공을 터치해요. 어디를 터치하느냐가 전부예요. 솔기가 중심이에요: 거기를 차면 낮고 빠르게 날아가요. 아래로 갈수록 더 높이 떠서 칩슛까지 돼요. 가장자리로 갈수록 파워가 줄어요: 대포알 슈팅은 정중앙이에요. 두 손가락으로 시점을 돌려 다른 각도에서 조준할 수 있어요.",
		"Cuantos menos intentos gastes, más estrellas.":
			"시도를 적게 쓸수록 별이 많아요.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "수비수가 붙어 있고 앞에는 경기장이 펼쳐져요: 드리블해서 상대 진영으로 넘어가세요. 빛나는 선까지는 슈팅 없이 드리블만 하고, 전진할 때마다 새 수비수가 막아서요. 그다음은 일대일: 바로 슈팅하거나, 몰고 가다 원으로 돌아와 딱 멈추고 차분히 조준하세요.",
		"Primero cruza la media cancha, hasta la raya encendida. Después, el mano a mano: 1 gol en 3 intentos.": "먼저 하프라인을 넘어 빛나는 선까지 가세요. 그다음 일대일: 3번 시도에 1골.",
		"La salida es un ensayo y no puntúa. Cuantos menos intentos"
		+ " gastes en el mano a mano, más estrellas.":
			"빌드업은 리허설이라 점수에 안 들어가요. 일대일에서 시도를 적게 쓸수록 별이 많아요.",
		"Marca 1 gol en 3 intentos.": "3번 시도에 1골을 넣으세요.",



		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, dos PASES — dentro del círculo pasas —: el cambio de banda, buscando al compañero libre en la otra punta, y el relevo. El relevo es la regla más rara del juego: si el pase le llega a un compañero fuera del área, pasas a jugar con él; si cae dentro del área no hay control que valga y remata de primera.": "이건 크로스예요: 공을 박스 안으로 띄워 보내요. 코너킥은 처음부터 크로스예요. 오른쪽 위 표시가 알려 줘요. 크로스(띄우기)와 슈팅(낮게)을 바꾸려면 조준하는 동안 다른 손가락으로 탭하거나 그 표시를 탭하세요. 골문이 아니라 동료의 머리를 노리세요. 마지막으로 패스 두 번 (원 안에서는 패스예요): 반대편의 빈 동료를 찾는 전환 패스, 그리고 교대. 교대는 이 게임에서 가장 특이한 규칙이에요: 패스가 박스 밖의 동료에게 가면 그 선수로 계속 플레이해요. 박스 안에 떨어지면 컨트롤할 틈 없이 그 선수가 바로 슈팅해요.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve los dos pases.": "6번 시도에 1골: 코너킥 3번, 크로스 3번. 그리고 패스 두 번을 배달하세요.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. Los dos pases son ensayo y no puntúan.": "골은 여섯 번 중 언제 나와도 돼요. 빠를수록 별이 많아요. 패스 두 번은 연습이라 점수에 안 들어가요.",
		"El relevo": "교대",
		"Dentro del círculo pasas · al de fuera del área lo controlas tú": "원 안에서는 패스 · 박스 밖 동료는 내가 조종",
		"La barrera tapa el camino raso: elévalo por encima tocando el"
		+ " balón abajo. El costado lo curva, si te atreves. Y el examen"
		+ " final: el penal. Respira. Tú eliges la esquina.":
			"수비벽이 낮은 길을 막아요: 공 아래쪽을 터치해서 벽을 넘기세요. 옆을 차면 휘어져요, 자신 있다면요. 그리고 최종 시험: 페널티킥. 숨 고르세요. 구석은 내가 정해요.",
		"Libre: 1 gol en 3 intentos · Penal: 1 en 2.":
			"프리킥: 3번 시도에 1골 · PK: 2번에 1골.",


		"SE ACABARON LOS INTENTOS": "시도 횟수 소진",
		"TE LA QUITÓ EL PORTERO": "골키퍼에게 뺏겼어요",
		"EJERCICIO {0} TERMINADO": "훈련 {0} 완료",
		"SIN ESTRELLAS": "별 없음",
		"REPETIR {0}": "{0} 다시 하기",
		"VER MIS OFERTAS": "내 제안 보기",
		"Con ellas se decide qué clubes te ofrecen contrato."
		+ " Todo esto se entrena en Práctica cuando quieras.":
			"별에 따라 어떤 클럽이 계약을 제안할지 정해져요. 이 모든 건 언제든 연습에서 훈련할 수 있어요.",
		"Unos diez minutos. Puedes salirte cuando quieras.":
			"10분 정도 걸려요. 언제든 나갈 수 있어요.",
		"SALTAR LA ACADEMIA": "아카데미 건너뛰기",
		"Eligiendo tu club a mano pierdes el premio del"
		+ " boletín.":
			"클럽을 직접 고르면 성적표 보너스를 잃어요.",
		"< MENÚ": "< 메뉴",


		"TERMINAR Y VER OFERTAS": "종료 · 제안 보기",
		"EMPEZAR LA ACADEMIA DE CERO": "아카데미 처음부터",
		"¿SEGURO? TOCA OTRA VEZ": "정말요? 다시 탭",

		"PASO 1 DE 3 · QUIÉN ERES": "1/3단계 · 나는 누구",
		"PASO 3 DE 3 · DÓNDE EMPIEZAS": "3/3단계 · 시작할 곳",


		"TUS CUALIDADES EN ESTE EJERCICIO": "이 훈련의 내 능력",


		"TOCA PARA JUGAR": "탭해서 플레이",
		"TOCA PARA EMPEZAR": "탭해서 시작",
		"{0}: SIN ESTRELLAS": "{0}: 별 없음",



		"Apoya el dedo dentro de tu círculo.":
			"내 원 안에 손가락을 올려요.",
		"Saca el dedo del círculo: corres al lado contrario.":
			"원 밖으로 끌면 반대 방향으로 달려요.",
		"Suelta y paras en seco.":
			"손을 떼면 딱 멈춰요.",
		"Dentro del círculo apuntas: la guía crece.":
			"원 안에서는 조준: 가이드가 커져요.",
		"Sacas el dedo del círculo y regateas, sin soltar.":
			"손을 떼지 않고 원 밖으로 끌면 드리블해요.",
		"Vuelves a entrar y paras en seco, apuntando.":
			"다시 들어오면 딱 멈추고 조준해요.",
		"Sueltas dentro y le pegas.":
			"안에서 손을 떼면 슈팅해요.",
		"Toca el pasto fuera de tu círculo y giras la vista.":
			"원 밖의 잔디를 탭하면 시점이 돌아가요.",
		"Otro toque y la vista vuelve.":
			"한 번 더 탭하면 시점이 돌아와요.",
		"Fuera del círculo conduces: cruza la raya.":
			"원 밖에서는 드리블: 선을 넘으세요.",
		"Apunta al área y aguanta el dedo.":
			"박스를 조준하고 손가락을 유지하세요.",
		"Con otro dedo cambias entre CENTRO y TIRO.":
			"다른 손가락으로 크로스와 슈팅을 바꿔요.",

		"Empuja este stick y corres hacia el disco.":
			"이 스틱을 밀면 원판으로 달려요.",
		"Empuja este stick y conduces: cruza la raya.":
			"이 스틱을 밀면 드리블: 선을 넘으세요.",
		"Empuja este stick y conduces.":
			"이 스틱을 밀면 드리블해요.",
		"Jala este stick hacia atrás y apuntas.":
			"이 스틱을 뒤로 당기면 조준해요.",
		"Sueltas y le pegas.":
			"놓으면 슈팅해요.",
		"Con este botón cambias entre CENTRO y TIRO.":
			"이 버튼으로 크로스와 슈팅을 바꿔요.",
		"Empuja este stick y avanza hacia el arco.":
			"이 스틱을 밀어 골문으로 전진하세요.",
		"Jala este stick y pásala a un compañero.":
			"이 스틱을 당겨 동료에게 패스하세요.",
		"Suelta y la cuelgas.":
			"놓으면 크로스를 올려요.",
		"Jala hacia atrás y suelta para pegarle.":
			"뒤로 당겼다 놓으면 슈팅해요.",
		"Jala hacia atrás y corre: cruza la raya de la media cancha.": "뒤로 당겨 달리세요: 하프라인을 넘으세요.",
		"Cuélgala al área. Con otro dedo cambias entre CENTRO y TIRO.":
			"박스로 올리세요. 다른 손가락으로 크로스와 슈팅을 바꿔요.",
		"Jala hacia atrás para pegarle a la falta.":
			"뒤로 당겨 프리킥을 차세요.",


		"GUÍA {0}/{1}": "가이드 {0}/{1}",
		"SALTAR": "건너뛰기",
		"LISTO": "확인",
		"TIRO o CENTRO": "슈팅 / 크로스",
		"Este indicador dice cómo va a salir el balón. Toca con OTRO dedo"
		+ " mientras apuntas —o toca este chip— para cambiar entre TIRO (raso)"
		+ " y CENTRO (colgado). Los córners empiezan en CENTRO.":
			"이 표시는 공이 어떻게 나갈지 알려 줘요. 조준하는 동안 다른 손가락으로 탭하거나 이 칩을 탭해서 슈팅(낮게)과 크로스(띄우기)를 바꾸세요. 코너킥은 크로스로 시작해요.",
		"ESTA ES TU CARRERA": "이게 내 커리어",
		"Bienvenido. Aquí arriba estás tú: tu media, tu energía y tu"
		+ " dinero, en todas las pantallas.":
			"환영해요. 여기 위가 나예요: 능력치, 에너지, 돈이 모든 화면에 보여요.",
		"TU PARTIDO": "내 경기",
		"El partido de hoy sale de este botón. Y el campo del fondo es"
		+ " para entrenar cuando quieras.":
			"오늘 경기는 이 버튼에서 시작해요. 뒤쪽 경기장에서는 언제든 훈련할 수 있어요.",
		"Estás aquí: tu partido y lo que reclama tu atención esta"
		+ " semana.":
			"지금 여기: 내 경기와 이번 주에 챙겨야 할 것들.",
		"Tus habilidades, tu contrato, tu gente, tu tienda y tu casa.":
			"내 능력, 계약, 사람들, 상점, 그리고 집.",
		"Lo que pasa fuera y te afecta: los torneos y el mercado de"
		+ " fichajes.":
			"밖에서 일어나 나에게 영향을 주는 것: 대회와 이적 시장.",
		"Lo que ya no cambia: tu carrera, tus trofeos y las leyendas.":
			"이제 바뀌지 않는 것: 내 커리어, 트로피, 그리고 레전드.",
		"¿REPASAR?": "다시 볼까요?",
		"Este botón vuelve a abrir esta guía siempre que quieras.":
			"이 버튼으로 언제든 이 가이드를 다시 열 수 있어요.",
		"Jala hacia atrás para correr · déjalos atrás":
			"뒤로 끌어 달리기 · 따돌리세요",
		"Arrastra desde tu círculo: dentro apuntas · fuera corres":
			"내 원에서 끌기: 안은 조준 · 밖은 달리기",


		"bandaFUERA": "아웃",
		"La bajas…": "볼 컨트롤 중…",
		"Conduciendo · vuelve al círculo para apuntar":
			"드리블 중 · 원 안으로 돌아오면 조준",
		"Conduciendo · toca tu círculo para apuntar": "드리블 중 · 내 원을 탭하면 조준",
		"Jala para tirar · sal del círculo para conducir":
			"당겨서 슈팅 · 원 밖으로 나가면 드리블",
		"Jala para centrar · sal del círculo para conducir":
			"당겨서 크로스 · 원 밖으로 나가면 드리블",
		"Arrastra dentro para apuntar · fuera conduces": "안에서 끌면 조준 · 밖이면 드리블",
		"Toca tu jugador · dentro del círculo tiras, fuera conduces":
			"내 선수를 터치 · 원 안은 슈팅, 밖은 드리블",
		"¡Cabezazo de {0}!": "{0}의 헤더!",
		"¡Al rechace {0}!": "{0}, 리바운드!",
		"¡Al rechace!": "리바운드!",
		"¡Pase a {0}!": "{0}에게 패스!",
		"¡Cabezazo!": "헤더!",
		"¡Palomita de {0}!": "{0}의 다이빙 헤더!",
		"¡Palomita!": "다이빙 헤더!",
		"¡Chilena de {0}!": "{0}의 바이시클 킥!",
		"¡Chilena!": "바이시클 킥!",
		"¡El portero le saca la chilena!": "골키퍼가 바이시클 킥을 쳐 내요!",
		"¡Vaya chilena! Y vaya atajada": "엄청난 바이시클 킥! 그리고 엄청난 선방",
		"La chilena choca con la defensa": "바이시클 킥이 수비에 막혀요",
		"¡Chilena bloqueada!": "바이시클 킥 블록!",
		"¡Chilena a las nubes!": "바이시클 킥이 하늘로!",
		"La chilena se va por encima": "바이시클 킥이 크로스바를 넘어가요",
		"¡La chilena al poste!": "바이시클 킥, 골대 강타!",
		"¡Qué chilena! Y el palo dice no": "멋진 바이시클 킥! 골대가 거부해요",
		"La chilena se va por poco": "바이시클 킥이 살짝 빗나가요",
		"¡Casi! La chilena no entró": "아깝다! 바이시클 킥이 안 들어가요",
		"¡CHILENA DE {0}! GOLAZO DE OTRO PLANETA": "{0}의 바이시클 킥! 다른 행성에서 온 원더골",
		"¡DE CHILENA! {0} FIRMA EL GOL DEL AÑO": "바이시클 킥! {0}, 올해의 골 예약",
		"¡Pase!": "패스!",
		"¡Pase clave!": "키패스!",
		"¡Pase clave a {0}!": "{0}에게 키패스!",
		"¡Conduce {0}!": "{0}, 치고 나가요!",
		"¡Conduce!": "드리블!",
		"Segunda jugada": "세컨드 볼",
		"¡Bloqueado!": "블록!",
		"¡Desviado!": "굴절!",
		"¡Desviado a córner!": "굴절돼 코너킥!",
		"¡AUTOGOL DEL RIVAL!": "상대 자책골!",
		"AUTOGOL": "자책골",
		"notaDESVIADO": "굴절",
		"Tu tiro se iba fuera, pero el defensa la mete en su propia portería.": "슈팅이 빗나가고 있었는데, 수비수가 자기 골문에 넣어 버려요.",
		"Iba fuera y rebota en el defensa hasta el fondo de su red. Autogol.": "빗나가던 공이 수비수 맞고 그대로 골망으로. 자책골이에요.",
		"¡Le diste al camarógrafo!": "카메라맨을 맞혔어요!",
		"¡REVENTASTE EL CRISTAL DEL PALCO!": "VIP석 유리를 박살 냈어요!",
		"¡Agrietaste el cristal del palco!": "VIP석 유리에 금이 갔어요!",
		"¡Le diste a TU entrenador!": "우리 팀 감독을 맞혔어요!",
		"¡Le diste al entrenador rival!": "상대 감독을 맞혔어요!",
		"¡Le diste a tu propio banquillo!": "우리 벤치를 맞혔어요!",
		"¡Balonazo al banquillo rival!": "상대 벤치에 강타!",
		" · EL MÍSTER TE SACA": " · 감독이 교체 지시",
		"EL TÉCNICO RETIRA A {0} · BALONAZO A SU PROPIO BANQUILLO": "감독, {0} 교체 · 자기 팀 벤치에 강슛",
		"BALONAZOS A TU PROPIO BANQUILLO": "우리 벤치를 향한 슈팅",
		"Le diste un balonazo a tu propia banca. Al túnel, sin discutir.": "우리 벤치에 강슛을 날렸어요. 군말 없이 터널로.",
		"Le diste un balonazo a tu propia banca. Fuera del campo, sin discutir.": "우리 벤치에 강슛을 날렸어요. 군말 없이 경기장 밖으로.",
		"Recado a la Banca": "벤치에 보내는 메시지",
		"Darle un balonazo a alguien del banquillo rival.": "상대 벤치에 있는 사람을 슈팅으로 맞히기.",
		"Fuego Amigo": "팀킬",
		"Gloria Prestada": "빌린 영광",
		"Cederle un penal al compañero que iba por su hat-trick.": "해트트릭을 노리던 동료에게 PK 양보하기.",
		"Nadie Toca Mi Balón": "내 공 건드리지 마",
		"Quedarte el penal con un compañero pidiéndotelo para su hat-trick.": "해트트릭을 노리는 동료가 졸라도 PK 직접 차기.",
		"Darle un balonazo a alguien de tu propio banquillo.": "우리 벤치에 있는 사람을 슈팅으로 맞히기.",
		"Con el Míster No": "감독님은 안 돼",
		"Tumbar al entrenador rival de un balonazo.": "슈팅으로 상대 감독 쓰러뜨리기.",
		"Te Vas al Banquillo": "너 교체야",
		"Tumbar a tu propio entrenador de un balonazo.": "슈팅으로 우리 감독 쓰러뜨리기.",
		"Desalojo": "벤치 비우기",
		"Tumbar a diez personas de los banquillos a lo largo de tu carrera.":
			"커리어 동안 벤치에 있는 사람 10명 쓰러뜨리기.",
		"¡Le diste al recogepelotas! La prensa no te lo perdona": "볼보이를 맞혔어요! 언론이 가만두지 않을 거예요",
		"¡Tiraste las botellas del portero!": "골키퍼 물병을 쓰러뜨렸어요!",



		"¡LE DISTE AL ASPERSOR!": "스프링클러를 맞혔어요!",
		"¡LE TIRASTE LA BEBIDA A UN AFICIONADO!": "팬의 음료를 날려 버렸어요!",
		"¡Le diste a una paloma!": "비둘기를 맞혔어요!",
		"¡Se fue a la calle!": "경기장 밖으로 날아갔어요!",
		"¡Se quedan el balón!": "공을 안 돌려줘요!",
		"¡Fuera de juego!": "오프사이드!",
		"¡GOL! (asistencia)": "골! (도움)",
		"¡GOOOL!": "고오올!",
		"Despeje del rival": "상대 걷어내기",


		"¡EN PROPIA PUERTA!": "자책골!",
		"¡Se te escapó el balón!": "공이 빠져나갔어요!",

		"TE LA DEVUELVE EL PORTERO": "골키퍼가 굴려 줘요",
		"EL BALÓN VUELVE A TI": "공이 다시 나에게",
		"¡Atajada del portero!": "골키퍼 선방!",
		"Tiro bloqueado": "슈팅 블록",
		"Por encima del arco": "크로스바 위로",
		"¡Al poste!": "골대!",
		"¡Al poste y fuera!": "골대 맞고 아웃!",
		"¡Fuera!": "빗나가요!",
		"¡Salió el portero!": "골키퍼가 나왔어요!",
		"Se te fue por la línea": "라인 밖으로 나갔어요",
		"Te ganó el defensa": "수비수가 따냈어요",


		"Te resbalaste en el charco": "물웅덩이에서 미끄러졌어요",
		"¡Gran regate!": "멋진 개인기!",
		"La cobra {0}": "키커: {0}",
		"¡El portero se la ataja a {0}!": "골키퍼가 {0}의 슈팅을 막아요!",
		"¡{0} la estrella en el palo!": "{0}, 골대 강타!",
		"¡La barrera se lo tapa a {0}!": "수비벽이 {0}의 슈팅을 막아요!",
		"Lo saca {0}…": "키커는 {0}…",
		"Arrastra para moverte · toca el balón y remata": "끌어서 이동 · 공을 터치해 슈팅",
		"¡{0} la manda fuera!": "{0}, 크게 빗나가요!",
		"¡Gol de {0}!": "{0}의 골!",
		"{0} NO FALLA DESDE LOS ONCE METROS": "{0}, PK 성공",
		"{0} FALLA DESDE LOS ONCE METROS": "{0}, PK 실축",
		"LA FALTA DE {0} SE PIERDE SIN PELIGRO": "{0}의 프리킥, 위협 없이 사라져요",
		"{0} LA CLAVA DE FALTA DIRECTA": "{0}, 직접 프리킥 골",
		"{0} REMATA EL CÓRNER A LA RED": "{0}, 코너킥을 골로 연결",
		"AHORA MANDA TU EQUIPO EL {0}": "우리 팀 리드, {0}",
		"TU EQUIPO EMPATA EL PARTIDO, {0}": "우리 팀 동점, {0}",
		"TU EQUIPO RECORTA, {0}": "우리 팀 추격골, {0}",
		"SE ADELANTA EL RIVAL, {0}": "상대 리드, {0}",
		"EL RIVAL EMPATA, {0}": "상대 동점, {0}",
		"EL RIVAL RECORTA, {0}": "상대 추격골, {0}",
		"ENTRA {0}": "{0} 투입",
		"SALE {0}": "{0} 아웃",
		"EL TÉCNICO RETIRA A {0} · ACTUACIÓN DEFICIENTE": "감독, {0} 교체 · 부진한 경기력",
		"{0} SALE LESIONADO · NO PUEDE CONTINUAR": "{0} 부상 아웃 · 경기 불가",
		"LESIONADO EN EL {0}'": "{0}분 부상",
		"{0} PIDE EL CAMBIO": "{0}, 교체 요청",

		"{0} PIDE EL CAMBIO · NO LE QUEDA NADA": "{0}, 교체 요청 · 체력 바닥",
		"{0} PIDE EL CAMBIO · EL BANQUILLO NO LO ENTIENDE":
			"{0}, 교체 요청 · 벤치는 이해 못 해",

		"{0} PIDE EL CAMBIO AL BANQUILLO": "{0}, 벤치에 교체 신호",
		"EL BANQUILLO TE DICE QUE AGUANTES: YA NO DA TIEMPO":
			"벤치: 버텨라, 시간이 없다",

		"PEDIR CAMBIO": "교체 요청",
		"CAMBIO PEDIDO": "교체 요청함",


		"VAS AL LÍMITE: MEJOR NO FORZAR": "한계 직전: 무리하지 마세요",
		"EL TÉCNICO RETIRA A {0} · OVACIÓN DEL ESTADIO":
			"감독, {0} 교체 · 기립 박수",
		"{0} SE VA ENTRE APLAUSOS · EL PARTIDO ESTÁ HECHO":
			"{0}, 박수 속에 퇴장 · 승부는 끝났다",
		"EL BANQUILLO PREPARA TU CAMBIO: EL PARTIDO ESTÁ HECHO":
			"벤치가 교체 준비 중: 승부는 끝났다",



		"EL PARTIDO ESTÁ EN JUEGO: TE VA A DECIR QUE AGUANTES":
			"아직 승부 중: 버티라고 할 거예요",
		"YA TE DIJO QUE NO: INSISTIR SALE CARO": "이미 안 된다고 했어요: 고집부리면 대가가 커요",
		"EL MÍSTER TE DICE QUE AGUANTES: TE NECESITA AHÍ":
			"감독: 버텨라, 네가 필요하다",
		"EL BANQUILLO DICE QUE AGUANTES": "벤치: 버텨라",
		"SALIDA GESTIONADA": "관리 교체",
		"PEDISTE EL CAMBIO": "교체를 요청했어요",
		"{0} MIN Y {1} % DE ENERGÍA QUE NO GASTASTE":
			"남은 {0}분, 쓰지 않은 에너지 {1}%",



		"YA NO DA TIEMPO: IBAS A SALIR IGUAL": "시간이 없어요: 어차피 교체될 참이었어요",
		"EL PARTIDO ESTÁ HECHO: TE LO VAN A AGRADECER":
			"승부는 났어요: 다들 고마워할 거예요",
		"NO TE QUEDA NADA: EL MÍSTER LO ENTIENDE": "다 쏟아냈어요: 감독도 이해해요",
		"QUEDA PARTIDO Y TE QUEDAN PIERNAS: ES UN DESPLANTE":
			"시간도 남고 다리도 멀쩡해요: 이건 항명이에요",
		"{0} PIDE EL CAMBIO Y EL BANQUILLO ASIENTE": "{0} 선수 교체 요청, 벤치도 수긍",
		"FUERA DEL CAMPO": "그라운드 밖",
		"FUERA POR LESION": "부상 아웃",
		"{0} SALE JUGANDO DE LA PRESIÓN": "{0}, 압박을 풀어내며 전진",
		"{0} ROMPE LÍNEAS CON UN GRAN REGATE": "{0}, 멋진 드리블로 라인 돌파",
		"{0} PIERDE EL BALÓN EN UN REGATE": "{0}, 드리블하다 볼을 뺏김",
		"DERRIBAN A {0}: FALTA PELIGROSA": "{0} 파울 당함: 위험한 프리킥",
		"DERRIBAN A {0} EN EL ÁREA: ¡PENAL!": "{0}, 박스 안에서 넘어짐: 페널티킥!",
		"CARGAN A {0} EN LA SALIDA: FALTA": "{0}, 빌드업 중 밀려 넘어짐: 파울",
		"FRENAN A {0} EN LA SALIDA: FALTA": "{0}, 빌드업 중 저지당함: 파울",
		"CARGAN A {0} POR LA ESPALDA: FALTA": "{0}, 뒤에서 밀림: 파울",
		"MODO TIRO": "슈팅 모드",
		"MODO CENTRO": "크로스 모드",
		"REGATEANDO": "드리블 중",
		"CARGAN A {0} POR LA ESPALDA EN EL ÁREA: ¡PENAL!": "{0}, 박스 안에서 뒤에서 밀림: 페널티킥!",
		"¡ROMPISTE LÍNEAS!": "라인 돌파!",
		"¡FALTA! Se cobra aquí mismo": "프리킥! 바로 이 자리에서 차요",
		"¡PENAL! Se cobra en los once metros": "페널티킥! 페널티 스폿에서 차요",
		"{0} QUIERE COBRAR EL PENAL": "{0} 선수가 PK를 차고 싶어해요",
		"SE LO DAS": "양보하기",
		"NO SE LO DAS": "직접 차기",
		"VA POR SU HAT-TRICK": "해트트릭 도전 중",
		"TE QUEDAS EL PENAL Y {0} SE APARTA": "PK는 내가, {0} 선수는 물러섬",
		"EL PENAL ES TUYO": "PK는 내 차지",
		"SE LO DAS A {0}": "{0} 선수에게 양보",
		"LE CEDES EL PENAL A {0} PARA SU HAT-TRICK": "{0} 선수에게 해트트릭 PK 양보",
		"LE CEDES EL PENAL A {0} Y NO ENTRA": "{0} 선수에게 PK 양보, 하지만 실축",
		"EL EQUIPO TE DEJA EL PENAL: HAT-TRICK": "팀이 PK를 양보: 해트트릭",
		"EL EQUIPO TE DEJA EL PENAL Y LO FALLAS": "팀이 PK를 양보했지만 실축",
		"{0} TE DA EL PENAL": "{0} 선수가 PK 양보",
		"EL PENAL ES DE {0}": "PK 키커: {0}",
		"LA FALTA ES DE {0}": "프리킥 키커: {0}",
		"SÍ {0} % · NO {1} %": "예 {0}% · 아니오 {1}%",
		"PÍDESELO": "요청하기",
		"DÉJASELO": "맡기기",
		"LE PIDES EL BALÓN A {0}": "{0} 선수에게 볼을 달라고 해요",
		"{0} TE DA LA FALTA": "{0} 선수가 프리킥 양보",
		"{0} SE LO QUEDA": "{0} 선수가 직접 킥",
		"{0} SE LA QUEDA": "{0} 선수가 직접 킥",
		"LE PIDES EL PENAL A {0} Y SE LO QUEDA": "{0} 선수에게 PK를 요청했지만 거절",
		"LE PIDES LA FALTA A {0} Y SE LA QUEDA": "{0} 선수에게 프리킥을 요청했지만 거절",
		"{0} TE DEJA EL PENAL Y RESPONDES": "{0} 선수가 PK 양보, 보답 성공",
		"{0} TE DEJA EL PENAL Y NO RESPONDES": "{0} 선수가 PK 양보, 보답 실패",
		"{0} TE DEJA LA FALTA Y RESPONDES": "{0} 선수가 프리킥 양보, 보답 성공",
		"{0} TE DEJA LA FALTA Y NO RESPONDES": "{0} 선수가 프리킥 양보, 보답 실패",
		"¡TANDA DE PENALES!": "승부차기!",
		"TANDA {0}-{1}": "PK전 {0}-{1}",
		"TANDA {0}-{1} · TIRA TU EQUIPO...": "승부차기 {0}-{1} · 우리 팀 차례...",
		"TANDA {0}-{1} · ¡TE TOCA A TI!": "승부차기 {0}-{1} · 내 차례!",
		"TANDA {0}-{1} · Cobra {2}...": "승부차기 {0}-{1} · {2} 키커 등장...",
		"¡GOL! Cobras con personalidad.": "골! 자신감 넘치는 킥.",
		"¡FALLAS TU PENAL!": "PK 실축!",
		"¡GOL!": "골!",
		"¡FALLA TU EQUIPO!": "우리 팀 실축!",
		"TANDA {0}-{1} · TIRA EL RIVAL...": "승부차기 {0}-{1} · 상대 차례...",
		"GOL DEL RIVAL": "상대 골",
		"¡LO ATAJA TU PORTERO!": "우리 골키퍼 선방!",
		"¡AL PALO!": "골대 강타!",
		"¡AL TRAVESAÑO!": "크로스바 강타!",
		"¡LA MANDA POR ENCIMA!": "크로스바 위로!",
		"¡LA MANDA FUERA!": "빗나감!",
		"PENALES {0}-{1}": "승부차기 {0}-{1}",
		"¡PASAS TÚ! ({0}-{1})": "통과! ({0}-{1})",
		"ELIMINADO EN PENALES ({0}-{1})": "승부차기 탈락 ({0}-{1})",
		"VICTORIA": "승리",
		"EMPATE": "무승부",
		"DERROTA": "패배",
		"Encarada por la banda": "측면 돌파",
		"Disparo escorado": "각도 없는 슈팅",
		"Desde la banda": "측면에서",
		"Contra por la banda": "측면 역습",
		"Falta lateral al área": "측면 프리킥",
		"Uno contra uno": "일대일",
		"Falta a {0} m": "{0}m 프리킥",









		"Volea al bote": "하프 발리",
		"Volea bombeada": "루프 발리",
		"Volea al vuelo": "다이렉트 발리",
		"Volea rasa": "낮은 발리",
		"balón botando": "튀는 볼",
		"llega bombeado": "떨어지는 볼",
		"balón al vuelo": "공중 볼",
		"balón rodando": "굴러오는 볼",
		"línea adelantada": "높은 수비 라인",
		"bajo presión": "압박 속에서",
		"con superioridad": "수적 우위로",
		"Tras el regate": "드리블 후",
		"Pared con el pivote": "피벗과 원투 패스",
		"Ruptura al espacio": "뒷공간 침투",
		"Cabezazo al segundo palo": "먼 포스트 헤더",
		"Cabezazo en el primer palo": "가까운 포스트 헤더",
		"Palomita": "다이빙 헤더",
		"El autobús": "버스 세우기",
		"Mano a mano franco": "완벽한 일대일",
		"Falta escorada al palo corto": "각도 있는 프리킥, 가까운 포스트",
		"Falta sobre la muralla": "수비벽 넘기는 프리킥",
		"Falta a la escuadra": "골문 구석 프리킥",
		"Saque de banda a la torre": "장신 공격수 향한 롱 스로인",
		"RIVAL": "상대",
		"RESULTADOS": "결과",
		"DOMINIO": "주도권",
		"TU APUESTA": "내 예상",
		"ELLOS": "상대",
		"FORMACIÓN": "포메이션",
		"FUERZA": "전력",
		"SU PELIGRO": "상대 위협",
		"FRESCO": "쌩쌩",
		"EN FORMA": "폼 좋음",
		"CARGADO": "피로 누적",
		"ENERGÍA": "에너지",
		"EN VIVO": "생중계",

		"1T": "전",
		"2T": "후",
		"PR": "연",
		"TOCA PARA AVANZAR  ▸": "탭해서 넘기기  ▸",
		"ARRASTRA PARA LEER · TOCA PARA AVANZAR  ▸":
			"드래그해서 다시 읽기 · 탭해서 넘기기  ▸",





		"▸ VER EL GOL": "▸ 골 다시 보기",
		"▸ GOL": "▸ 골",
		"¡GOLAZO! {0} LA MANDA A GUARDAR": "원더골! {0}, 골망을 흔들다",
		"GOL EN CONTRA: {0} CASTIGA EL ROBO EN TU ÁREA": "실점: {0}, 박스 안 볼 탈취를 골로 응징",
		"LA REPETICION": "리플레이",
		"AL POSTE": "골대 강타",
		"AL LARGUERO": "크로스바 강타",


		"REVISION VAR": "VAR 판독",
		"COMPROBANDO EL LARGUERO": "크로스바 확인 중",
		"EL PIQUE, BAJO EL LARGUERO": "바운드 지점, 크로스바 아래",
		"TECNOLOGIA DE LINEA DE GOL": "골라인 판독 기술",
		"COMPROBANDO EL POSTE": "골대 확인 중",
		"EL PIQUE, FUERA DE LA RAYA": "바운드 지점, 라인 밖",
		"NO ES GOL": "노골",
		"ARRASTRA PARA GIRAR LA CÁMARA": "드래그해서 카메라 회전",
		"ARCO": "골대",
		"ORBITA": "회전",
		"TU CAMARA": "내 카메라",


		"repeLIBRE": "자유",





		"GUARDADO": "저장됨",
		"Guardado en tus fotos": "사진 앱에 저장했어요",
		"Da permiso a Fotos para guardar el video": "영상을 저장하려면 사진 접근을 허용해 주세요",
		"No se pudo guardar en tus fotos": "사진 앱에 저장하지 못했어요",
		"Este aparato no puede guardar el video": "이 기기에서는 영상을 저장할 수 없어요",
		"No se pudo empezar a grabar": "녹화를 시작하지 못했어요",
		"Se cortó la grabación": "녹화가 중단됐어요",
		"No hay jugada que guardar": "저장할 플레이가 없어요",
		"No hay nada grabado": "녹화된 게 없어요",
		"No se pudo cerrar el video": "영상을 완성하지 못했어요",
		"¡Mira mi gol en Football Legacy!": "Football Legacy에서 내 골을 봐 주세요!",
		"Compartido": "공유 완료",
		"No se pudo abrir compartir": "공유 창을 열지 못했어요",
		"ENLACE COPIADO: PEGALO EN TU POST": "링크 복사됨: 게시물에 붙여 넣으세요",
		"Listo": "완료",





		"ORDEN DESDE LA BANDA: TODOS ATRÁS, SE DEFIENDE EL RESULTADO":
			"벤치의 지시: 전원 수비, 결과를 지켜라",
		"ORDEN DESDE LA BANDA: EQUILIBRIO, NI ATRÁS NI ARRIBA":
			"벤치의 지시: 균형 유지, 내려서지도 올라가지도 말 것",
		"ORDEN DESDE LA BANDA: TODOS ARRIBA, SE VA A POR EL PARTIDO":
			"벤치의 지시: 전원 공격, 승부를 걸어라",
		"EL EQUIPO BAJA EL PISTÓN: A ADMINISTRAR PIERNAS":
			"팀이 속도를 늦춰요: 체력 안배",
		"EL EQUIPO VUELVE A SU RITMO NORMAL": "팀이 평소 리듬으로 돌아와요",
		"EL EQUIPO SUBE EL PISTÓN: A MORDER CADA BALÓN":
			"팀이 속도를 올려요: 모든 볼에 달려들기",
		"PLANTEAMIENTO": "전술",
		"INTENSIDAD": "강도",
		"planDEFENSIVO": "수비적",
		"planBALANCEADO": "균형",
		"planOFENSIVO": "공격적",
		"planBAJA": "낮음",
		"planMEDIA": "보통",
		"planALTA": "높음",
		"Aguantas atrás: encajas menos, pero el balón te llega lejos del área.":
			"내려앉아요: 실점은 줄지만, 볼이 박스에서 먼 곳에서 와요.",
		"El equipo juega parejo.": "팀이 균형 있게 뛰어요.",
		"Vas al frente: te llega más cerca del arco, pero atrás quedas expuesto.":
			"앞으로 나가요: 볼이 골문 가까이 오지만, 뒷공간이 비어요.",
		"Dosificas: tocas menos el balón, pero terminas entero.":
			"체력을 아껴요: 볼 터치는 줄지만, 끝까지 쌩쌩해요.",
		"Ritmo normal.": "보통 템포.",
		"Buscas cada pelota, pero acabas fundido (y más expuesto a la lesión).":
			"모든 볼을 쫓지만, 녹초가 돼요(부상 위험도 커져요).",
		"SE ACABO": "끝났어요",
		"HASTA AQUI": "여기까지",
		"{0} · {1} de {2}": "{0} · {2} 중 {1}",
		"EL ULTIMO PITIDO": "마지막 휘슬",
		"EL ESTADIO EN PIE": "기립 박수",
		"AÑO A AÑO": "한 해 한 해",
		"COMO CRECISTE": "성장 과정",
		"LA VITRINA": "진열장",
		"¿ERES LEYENDA?": "레전드일까?",
		"LA PRENSA": "언론",
		"LO QUE DEJAS": "남기는 것",
		"GRACIAS {0}": "고마워요, {0}",
		"GRACIAS": "고마워요",
		"Suena el silbato y ya no hay temporada siguiente.":
			"휘슬이 울리고, 이제 다음 시즌은 없어요.",
		"{0} años. El cuerpo pidió la cuenta.":
			"{0}세. 몸이 그만하자고 했어요.",
		"Suena el silbato y esta vez lo eliges tú.":
			"휘슬이 울리고, 이번엔 내가 결정했어요.",

		"Suena el silbato y esta vez no hay vuelta.":
			"휘슬이 울리고, 이번엔 돌아갈 길이 없어요.",
		"El cuerpo pidió la cuenta antes de tiempo.":
			"몸이 너무 일찍 그만하자고 했어요.",
		"\"EL CUERPO LE PASO LA FACTURA\"": "\"몸이 대가를 치르게 했다\"",
		"A los {0} años, una lesión decidió por él.":
			"{0}세, 부상이 그를 대신해 결정했다.",
		"Te vas cuando todavía te quedaba algo dentro.":
			"아직 남은 게 있을 때 떠나요.",
		"{0} temporadas · {1} partidos": "{0}시즌 · {1}경기",
		"Las camisetas que vestiste": "입었던 유니폼들",
		"DE PIE": "기립",
		"El estadio entero, en pie, coreando tu nombre.":
			"경기장 전체가 일어나 내 이름을 연호해요.",
		"Muchos de los que aplauden no vieron tu debut.":
			"박수 치는 사람 중 많은 이가 내 데뷔를 못 봤어요.",
		"{0} veces internacional con {1}": "{1} 대표로 A매치 {0}경기",
		"No hay historial que enseñar.": "보여 줄 기록이 없어요.",
		"TOTAL": "합계",
		"LA CARRERA EN CIFRAS": "숫자로 본 커리어",
		"ASIST": "도움",
		"De todo eso, {0} goles y {1} asistencias fueron en la elite (1ª y seleccion):"
		+ " es lo que te compara con las leyendas.":
			"그중 {0}골, 도움 {1}개가 최상위 무대(1부와 국가대표)에서 나왔어요: 레전드와 비교하는 기준이에요.",
		"TEMP · CLUB": "시즌 · 클럽",
		"TITULOS": "우승",
		"T{0} {1}": "S{0} {1}",
		"Una carrera tan corta no dibuja curva.":
			"이렇게 짧은 커리어로는 곡선이 안 그려져요.",
		"Lo que valias y lo que sabias, año a año":
			"해마다 내 몸값과 실력",
		"VALOR": "가치",
		"curvaMEDIA": "OVR",
		"Valiste más que nunca en la temporada {0}: $ {1}":
			"{0}시즌에 몸값이 가장 높았어요: $ {1}",
		"Tu mejor media fue {0}, y la de hoy es {1}":
			"최고 능력치는 {0}, 지금은 {1}",
		"El mercado dejó de creer en ti {0} temporadas antes de que se te acabara el"
		+ " fútbol.":
			"축구를 그만두기 {0}시즌 전에 시장이 먼저 등을 돌렸어요.",
		"LA VITRINA VACIA": "텅 빈 진열장",
		"No ganaste nada, y aun así jugaste {0} temporadas.":
			"우승은 없었지만, 그래도 {0}시즌을 뛰었어요.",
		"Hay carreras que no caben en una vitrina.":
			"진열장에 다 담을 수 없는 커리어도 있어요.",
		"{0} de equipo · {1} individuales": "팀 {0} · 개인 {1}",
		"CON TU EQUIPO": "팀과 함께",
		"TUYOS Y DE NADIE MAS": "오직 나만의 것",
		"UNO POR UNO": "하나씩",
		"COPA · {0}": "컵 · {0}",
		"MAXIMO GOLEADOR": "득점왕",
		"MAXIMO ASISTENTE": "도움왕",
		"PODIO DE LA LIGA": "리그 톱3",
		"MEJOR JUGADOR": "최고의 선수",
		"Tu nombre por delante de {0} leyendas del fútbol":
			"축구 레전드 {0}명보다 앞선 내 이름",
		"Los grandes de la historia siguen todos por delante.":
			"역사 속 위대한 선수들은 모두 아직 앞에 있어요.",
		"PRODUCCION HISTORICA": "역대 공격 포인트",
		"{0} goles y {1} asistencias en la elite":
			"최상위 무대 {0}골, 도움 {1}",
		"Nº{0} de la historia, por delante de {1} leyendas":
			"역대 {0}위, 레전드 {1}명보다 앞서요",
		"Ninguna leyenda del fútbol se queda por detrás de ti.":
			"내 뒤에 남은 축구 레전드는 한 명도 없어요.",
		"Los récords del mundo siguen donde estaban.":
			"세계 기록은 그대로예요.",
		"RECORD DEL MUNDO: {0}": "세계 기록: {0}",
		"Goles en una carrera": "커리어 통산 골",
		"Balones de Oro": "올해의 선수 수상",
		"Ligas ganadas": "리그 우승",
		"DONDE TE VAS SIENDO LEYENDA": "레전드로 남는 곳",
		"En ninguna parte, todavía.": "아직은 어디에도 없어요.",
		"Al top histórico de un club se entra ganando allí, siendo"
		+ " su máximo goleador o su récord de partidos, o con 10 temporadas seguidas; al"
		+ " de una liga, ganando o marcando goles en su primera división; al de tu"
		+ " selección, siendo uno de sus 5 máximos goleadores.":
			"클럽 역대 명단에 들려면 그곳에서 우승하거나, 최다 득점자나 최다 출장 기록 보유자가 되거나, 10시즌 연속으로 뛰어야 해요. 리그 명단은 그 리그 1부에서 우승하거나 골을 넣으면, 대표팀 명단은 역대 최다 득점자 5위 안에 들면 돼요.",
		"leyenda del club": "클럽 레전드",
		"goleador histórico del club": "클럽 역대 최다 득점자",
		"récord de partidos del club": "클럽 최다 출장 기록",
		"leyenda de la liga": "리그 레전드",
		"leyenda de la selección": "국가대표팀 레전드",
		"Nº{0}": "{0}위",
		"\"{0} GOLES Y UNA SOLA MANERA DE ENTENDER EL JUEGO\"":
			"\"{0}골, 그리고 축구를 보는 단 하나의 방식\"",
		"Se retira uno de los grandes rematadores de su generación.":
			"한 세대를 대표하는 골잡이가 은퇴한다.",
		"\"{0} GOLES DESPUES, EL AREA SE QUEDA VACIA\"":
			"\"{0}골 이후, 페널티 박스가 텅 비다\"",
		"El delantero deja el fútbol tras {0} temporadas.":
			"공격수, {0}시즌 만에 축구화를 벗다.",
		"\"NO TODO SE MIDE EN GOLES\"": "\"모든 걸 골로 잴 수는 없다\"",
		"{0} goles y {1} asistencias en {2} temporadas de oficio.":
			"묵묵히 뛴 {2}시즌 동안 {0}골, 도움 {1}.",
		"\"LA VITRINA QUE DEJA: {0} TITULOS\"": "\"그가 남긴 진열장: 우승 {0}회\"",
		"Pocos futbolistas se han ido con tanto ganado.":
			"이만큼 많이 우승하고 떠난 선수는 드물다.",
		"\"SE VA CON {0} TITULOS Y NINGUNA DEUDA\"":
			"\"우승 {0}회, 빚 없이 떠나다\"",
		"Ganó lo que pudo donde le tocó jugar.":
			"어디서 뛰든 할 수 있는 만큼 우승했다.",
		"\"EL FUTBOL NO SIEMPRE PAGA LO QUE DEBE\"":
			"\"축구가 늘 빚을 갚지는 않는다\"",
		"Se retira sin títulos, que no es lo mismo que sin carrera.":
			"우승 없이 은퇴하지만, 커리어가 없었던 건 아니다.",
		"\"VUELVE A CASA PARA SIEMPRE\"": "\"영원히 집으로\"",
		"Se retira en el {0}, donde empezó todo.":
			"모든 것이 시작된 {0}에서 은퇴한다.",
		"\"JUGO HASTA EL ULTIMO DIA QUE LE DEJARON\"":
			"\"허락된 마지막 날까지 뛰었다\"",
		"A los {0} años, el calendario decidio por él.":
			"{0}세, 세월이 그를 대신해 결정했다.",
		"\"ME VOY AHORA QUE TODAVIA SE JUGAR\"": "\"아직 뛸 수 있을 때 떠난다\"",
		"Anuncia su retirada a los {0} años, por decision propia.":
			"{0}세에 스스로 은퇴를 발표했다.",
		"Te vas siendo": "이렇게 떠나요",



		"{0} retira tu dorsal": "{0}, 내 등번호 영구 결번",
		"{0} temporadas con el mismo número a la espalda.":
			"같은 등번호로 {0}시즌.",
		"LA CAMISETA QUE SE QUEDA": "남는 유니폼",
		"{0} temporadas con él": "함께한 {0}시즌",
		"Prestigio: {0} puntos": "명성: {0}점",
		"El vestuario se queda vacío, pero el nombre no se borra.":
			"라커룸은 비어도, 이름은 지워지지 않아요.",
		"Ahora ya solo queda mirar lo que hiciste.":
			"이제 남은 건 내가 해낸 걸 돌아보는 일뿐이에요.",
		"ELIGE EL CLUB DONDE ENTRA": "합류할 클럽 선택",
		"ELIGE EL CLUB DESTINO": "목적지 클럽 선택",
		"También puede ser su propio club, para cambiarlo de asiento.":
			"같은 클럽을 골라 자리를 바꿀 수도 있어요.",
		"Fichajes, cualidades, caras y escudos a tu gusto.\nSe guarda solo y vale para"
		+ " todas las carreras.":
			"이적, 능력치, 얼굴, 엠블럼을 마음대로.\n자동 저장되고 모든 커리어에 적용돼요.",
		"EDITADO": "편집됨",
		"ELIGE EL ASIENTO QUE OCUPA": "들어갈 자리 선택",
		"Quien tenga ese asiento hoy SALE del juego; el nuevo\nhereda su puesto y su"
		+ " dorsal.":
			"지금 그 자리에 있는 선수는 게임에서 빠져요.\n새 선수가 포지션과 등번호를 물려받아요.",
		"ELIGE CON QUIEN SE INTERCAMBIA": "맞바꿀 선수 선택",
		"Los dos jugadores se cambian de club; el puesto y el dorsal\nson del asiento,"
		+ " no viajan.":
			"두 선수가 클럽을 맞바꿔요. 포지션과 등번호는\n자리에 딸린 것이라 따라가지 않아요.",
		"{0} · FUERZA {1}": "{0} · 전력 {1}",
		"SOLO SU POSICION ({0}): {1}": "같은 포지션({0}): {1}",
		"editorSI": "O",
		"editorNO": "X",
		"CREAR JUGADOR": "선수 생성",
		"EDITAR CLUB": "클럽 편집",
		"IDENTIDAD": "기본 정보",
		"AL TOCAR UN CLUB SE ABRE": "클럽 탭 시 열기",
		"Nadie encaja aquí con el filtro puesto. Apágalo para ver el plantel completo.":
			"이 필터로는 맞는 선수가 없어요. 필터를 끄면 전체 스쿼드가 보여요.",
		"— BANCA —": "— 벤치 —",


		"LISTA": "목록",
		"— RESERVA —": "— 리저브 —",
		"QUITAR EDICIONES DEL CLUB": "이 클럽 편집 되돌리기",
		"{0}  · TU PUESTO": "{0}  · 내 자리",
		"EDAD": "나이",
		"POSICIÓN": "포지션",
		"AÑOS": "세",
		"NACION": "국적",
		"PUESTO": "포지션",



		"POR": "GK", "DFC": "CB", "LTI": "LB", "LTD": "RB",
		"MCD": "CDM", "MC": "CM", "MI": "LM", "MD": "RM",
		"DC": "ST", "CAM": "CAM", "MCO": "CAM", "EI": "LW", "ED": "RW",


		"SABE JUGAR DE": "가능 포지션",




		"AL MENOS UN PUESTO: MARCA OTRO ANTES DE QUITAR ESTE.": "포지션은 최소 하나: 다른 걸 먼저 체크하세요.",
		"EL ARCO ES EXCLUYENTE: UN PORTERO NO JUEGA DE NADA MAS.": "골키퍼는 전용: 다른 포지션은 못 뛰어요.",
		"MARCA SU PUESTO DE CAMPO: ASI SALE DEL ARCO.": "필드 포지션을 체크하세요: 그러면 골키퍼에서 빠져요.",
		"ES EL ULTIMO {0} DEL CLUB: MARCA A OTRO PRIMERO.": "클럽의 마지막 {0}: 다른 선수를 먼저 체크하세요.",
		"El primero es su puesto (hoy {0}) y el número es su OVR ahí: quítalo y pasa al siguiente. Hasta {1}, y viajan con la persona.": "첫 번째가 주 포지션(지금은 {0})이고 숫자는 그 자리의 OVR이에요. 지우면 다음 것이 이어받아요. 최대 {1}개, 선수와 함께 따라가요.",
		"— TITULARES · {0} —": "— 선발 · {0} —",
		"EL ARCO ES EXCLUYENTE: NI ENTRA NI SALE NADIE.": "골키퍼는 전용: 들어오는 사람도 나가는 사람도 없어요.",
		"SU PUESTO VA SIEMPRE: NO SE PUEDE QUITAR.": "주 포지션은 항상 포함: 지울 수 없어요.",
		"HASTA {0} PUESTOS: QUITA UNO PARA PONER OTRO.": "최대 {0}개: 하나를 지워야 추가할 수 있어요.",
		"Su puesto va siempre. Hasta {0}, y viajan con la persona.": "주 포지션은 항상 포함돼요. 최대 {0}개, 선수와 함께 따라가요.",
		"Mientras juegues aquí, este asiento lo ocupas tú; el jugador editado vale para"
		+ " el resto del mundo.":
			"내가 여기서 뛰는 동안 이 자리는 내 차지예요. 편집한 선수는 나머지 세계에 적용돼요.",
		"El puesto es del ASIENTO: en un intercambio se queda aquí.":
			"포지션은 자리에 딸려요: 맞바꿔도 여기 남아요.",
		"VELOCIDAD": "속도",
		"PEGADA": "파워",
		"PUNTERIA": "정확도",
		"ROSCA": "회전",
		"CABEZA": "헤더",
		"PENAL": "PK",
		"BALON PARADO": "세트피스",
		"REFLEJOS": "반사신경",
		"REFLEJOS solo cuenta en porteros. Se guarda solo.":
			"반사신경은 골키퍼에게만 적용돼요. 자동 저장돼요.",
		"Cada puesto se mide por sus cualidades. Se guarda solo.":
			"포지션마다 보는 능력치가 달라요. 자동 저장돼요.",
		"REFLEJOS solo cuenta en porteros.": "반사신경은 골키퍼에게만 적용돼요.",
		"TRASPASAR": "이적",
		"QUITAR EDICION (VOLVER AL DE BASE)": "편집 취소(기본값으로)",
		"ES EL ULTIMO DE SU PUESTO: NO SE PUEDE CAMBIAR.":
			"그 포지션의 마지막 선수: 바꿀 수 없어요.",

		"MIS EDICIONES": "내 편집",

		"IMPORTAR DATOS": "데이터 가져오기",
		"Catálogo completo": "전체 카탈로그",
		"EXPORTAR EL MUNDO ENTERO": "세계 전체 내보내기",
		"IMPORTAR: ABRIR ARCHIVOS": "가져오기: 파일 열기",
		"IMPORTAR UN ARCHIVO": "파일 하나 가져오기",
		"Exportar te da un archivo para editarlo en el ordenador; importar lo trae de vuelta. Vale .json o un .zip con la carpeta de escudos dentro.": "내보내면 컴퓨터에서 편집할 파일이 생기고, 가져오면 다시 들여와요. .json 파일이나 엠블럼 폴더가 든 .zip 파일을 쓸 수 있어요.",
		"Al terminar se abre COMPARTIR: mándalo a Archivos o a tu ordenador para editarlo y volver a importarlo.": "끝나면 공유 창이 열려요: 파일 앱이나 컴퓨터로 보내서 편집한 뒤 다시 가져오세요.",
		"Al terminar se abre GUARDAR: déjalo en Descargas y desde ahí pásalo al ordenador o a tu nube para editarlo y volver a importarlo.": "끝나면 저장 창이 열려요: 다운로드에 저장한 뒤 컴퓨터나 클라우드로 옮겨 편집하고 다시 가져오세요.",
		"Si el archivo está en Drive, bájalo antes a Descargas.": "파일이 드라이브에 있다면 먼저 다운로드로 내려받으세요.",
		"IMPORTANDO…": "가져오는 중…",
		"Guardando el catálogo y los escudos. No cierres el juego.": "카탈로그와 엠블럼을 저장하는 중이에요. 게임을 끄지 마세요.",
		"No se pudo guardar el archivo donde elegiste.": "선택한 위치에 파일을 저장하지 못했어요.",
		"El archivo es tuyo y para tu uso personal: el juego no aloja ni reparte packs.": "이 파일은 개인 용도의 내 파일이에요: 게임은 팩을 호스팅하거나 배포하지 않아요.",
		"Lo que importes es tuyo y se queda en tu dispositivo: tú respondes de lo que metas en el archivo.": "가져온 것은 내 것이고 내 기기에만 남아요: 파일에 넣은 내용은 본인이 책임져요.",
		"El .zip no trae ningún archivo .json dentro.": "그 .zip 안에 .json 파일이 없어요.",
		"El archivo es demasiado grande: no se importó nada.": "파일이 너무 커요: 아무것도 가져오지 않았어요.",
		"no se pudo abrir el selector": "파일 선택 창을 열 수 없음",
		"no se pudo copiar el archivo elegido": "선택한 파일을 복사할 수 없음",
		"no se encontró el archivo exportado": "내보낸 파일을 찾을 수 없음",
		"EXPORTADO A {0}": "내보낸 위치: {0}",
		"Queda en la carpeta de Football Legacy como {0}: ábrelo en el ordenador para ajustar tus plantillas y vuelve a importarlo.": "Football Legacy 폴더에 {0} 파일로 저장돼요: 컴퓨터에서 열어 스쿼드를 손본 뒤 다시 가져오세요.",
		"EXPORTAR PLANTILLA": "템플릿 내보내기",
		"EXPORTAR": "내보내기",
		"NO SE PUDO ESCRIBIR": "쓰기 실패",
		"Saca todos los clubes, plantillas y competiciones tal y como están ahora.": "모든 클럽, 스쿼드, 대회를 지금 상태 그대로 내보내요.",
		"Los escudos no van dentro: esos los pones tú.": "엠블럼은 포함되지 않아요: 직접 넣으세요.",
		"club": "클럽",
		"clubes": "클럽",
		"jugador": "선수",
		"jugadores": "선수",
		"escudo": "엠블럼",
		"escudos": "엠블럼",
		"competicion": "대회",
		"competiciones": "대회",
		"club desconocido": "알 수 없는 클럽",
		"competición desconocida": "알 수 없는 대회",
		"marca desconocida": "알 수 없는 브랜드",
		"id vacío": "빈 ID",
		"nombre vacío": "빈 이름",
		"marca {0}: {1}": "브랜드 {0}: {1}",
		"marca deportiva {0}: {1}": "용품 브랜드 {0}: {1}",
		"pesa {0} KB (tope {1})": "{0}KB (한도 {1})",
		"no es un PNG válido": "올바른 PNG가 아님",
		"no es un SVG válido": "올바른 SVG가 아님",
		"{0}x{1} (tope {2}x{3})": "{0}x{1} (한도 {2}x{3})",
		"no se pudo escribir": "쓸 수 없음",
		"no se encontró el archivo": "파일을 찾을 수 없음",
		"no se pudo abrir el archivo": "파일을 열 수 없음",
		"el archivo pesa más de {0} MB": "파일이 {0}MB보다 큼",
		"el archivo no es un JSON válido": "올바른 JSON 파일이 아님",
		"formato {0}: este juego lee el {1}": "형식 {0}: 이 게임은 {1} 형식을 읽음",
		"{0} pide {1} asientos y el juego admite de {2} a {3}": "{0}: 자리 {1}개 요청, 허용 범위는 {2}~{3}개",
		"{0} se queda en {1} asientos: el último es su único {2}": "{0}: 자리 {1}개 유지, 마지막 자리가 유일한 {2}",
		"{0}: el asiento {1} se queda de {2} (el pack lo dejaba sin ninguno)": "{0}: {1}번 자리는 {2} 유지(팩에 해당 선수 없음)",
		"no se pudo cruzar {0} con {1} (¿mismo país? ¿misma división?)": "{0}, {1} 맞교환 실패(같은 국가? 같은 부?)",
		"club desconocido: {0}": "알 수 없는 클럽: {0}",
		"formación desconocida: {0}": "알 수 없는 포메이션: {0}",
		"país desconocido: {0}": "알 수 없는 국가: {0}",
		"leyenda desconocida: {0}": "알 수 없는 레전드: {0}",
		"planta desconocida: {0}": "알 수 없는 경기장 형태: {0}",
		"estadio": "경기장",
		"estadios": "경기장",
		"logo de {0}: {1}": "{0} 엠블럼: {1}",
		"base64 ilegible": "읽을 수 없는 base64",
		"{0} trae {1} jugadores y hay {2} asientos": "{0}: 선수 {1}명, 자리 {2}개",
		"{0} trae {1} jugadores para {2} asientos: {3} sin cubrir": "{0}: 자리 {2}개에 선수 {1}명, 공석 {3}",
		"{0}: {1} clubes sin jugadores en el pack (se quedan los del juego)": "{0}: 팩에 선수가 없는 클럽 {1}개(게임 기본 선수 유지)",
		"{0} de {1} jugadores": "선수 {1}명 중 {0}명",
		"{0} sin cubrir": "공석 {0}",
		"{0} descartados": "제외 {0}",
		"IMPORTAR": "가져오기",

		"EL MUNDO SE MOVIO": "세계가 움직였어요",
		"Los clubes llevan {0} en esta carrera. Esos jugadores se quedan con su nombre anterior: el pack no los reescribe.":
			"이 커리어에서 진행된 클럽 이적: {0}. 그 선수들은 예전 이름을 유지해요: 팩이 덮어쓰지 않아요.",
		"fichaje": "이적",
		"fichajes": "이적",
		"Puedes devolver el mundo al catálogo que acabas de importar. Se pierden esos fichajes, también los de tu plantilla; tu carrera, tu club y tus estadísticas no se tocan.":
			"방금 가져온 카탈로그로 세계를 되돌릴 수 있어요. 그 이적들은 사라지고 내 스쿼드의 이적도 마찬가지예요. 내 커리어, 클럽, 기록은 그대로예요.",
		"VOLVER AL PACK": "팩으로 되돌리기",
		"DEJARLO ASI": "그대로 두기",
		"QUITAR TODO LO IMPORTADO": "가져온 것 모두 삭제",
		"NO SE PUDO LEER": "읽기 실패",
		"Nombres, plantillas y escudos desde un archivo tuyo. Se puede deshacer entero.":
			"내 파일에서 이름, 스쿼드, 엠블럼을 가져와요. 전부 되돌릴 수 있어요.",
		"No hay ningún archivo todavía. Toca IMPORTAR, deja tu .json en esa carpeta y vuelve.":
			"아직 파일이 없어요. 가져오기를 탭하고 그 폴더에 .json 파일을 넣은 뒤 돌아오세요.",
		"Pisa los nombres y las plantillas que tengas ahora.":
			"지금 가진 이름과 스쿼드를 덮어써요.",
		"Vale para todas las ranuras y se puede quitar entero.":
			"모든 슬롯에 적용되고 한 번에 지울 수 있어요.",
		"Todo lo que has tocado, para llegar de un toque y para poder deshacerlo.":
			"내가 손댄 모든 것, 한 번에 찾아가고 되돌릴 수 있어요.",





		"CAMBIAR DE DIVISION": "디비전 변경",
		"La división solo se cambia con la temporada recién empezada: el calendario,"
		+ " la tabla y el bombo de copa ya están armados con las de ahora.":
			"디비전은 시즌이 막 시작됐을 때만 바꿀 수 있어요: 일정, 순위표, 컵 대진이 이미 지금 디비전 기준으로 짜여 있어요.",
		"El calendario se vuelve a sortear: liga, copa y europeas.":
			"일정을 다시 추첨해요: 리그, 컵, 유럽 대회.",
		"EDITOR DE ESTA CARRERA": "이 커리어 편집",
		"EDITAR MI CARRERA": "내 커리어 편집",
		"Retoca el plantel que tienes HOY: con sus fichajes, sus retiros y sus años"
		+ " encima. Sólo cambia esta partida; tu base de datos global no se toca.":
			"지금 내 스쿼드를 손봐요: 이적, 은퇴, 나이까지 반영돼요. 이 세이브만 바뀌고 전체 데이터베이스는 그대로예요.",
		"EDITANDO TU CARRERA · {0} · TEMPORADA {1}":
			"내 커리어 편집 중 · {0} · {1}시즌",
		"Lo que toques aquí cambia SOLO esta carrera.\nTu base de datos global no se"
		+ " entera.":
			"여기서 바꾼 건 이 커리어에만 적용돼요.\n전체 데이터베이스는 전혀 몰라요.",
		"{0} de {1} asientos editados en esta carrera.":
			"이 커리어에서 스쿼드 자리 {1}개 중 {0}개 편집됨.",
		"Todavía no has editado nada en esta carrera.":
			"이 커리어에서 아직 아무것도 편집하지 않았어요.",
		"NO CABE": "자리 없음",
		"Esta carrera ya tiene {0} asientos editados, que es el tope.":
			"이 커리어는 이미 자리 {0}개를 편집했어요. 그게 한도예요.",
		"Esta carrera ya tiene {0} asientos editados, que es el tope. Quita alguno en"
		+ " MIS EDICIONES.":
			"이 커리어는 이미 자리 {0}개를 편집했어요. 그게 한도예요. 내 편집에서 몇 개 지우세요.",
		"Todo lo que has tocado EN ESTA CARRERA vuelve a como estaba.":
			"이 커리어에서 손댄 모든 것이 원래대로 돌아가요.",
		"La base de datos global no se toca: sigue igual en todas las ranuras.":
			"전체 데이터베이스는 건드리지 않아요: 모든 슬롯에서 그대로예요.",
		"Los fichajes que hiciste aquí NO se deshacen: son parte de la partida.":
			"여기서 한 영입은 되돌리지 않아요: 세이브의 일부예요.",
		"Todavía no has editado nada.": "아직 아무것도 편집하지 않았어요.",
		"· IDENTIDAD DEL CLUB (NOMBRE, COLORES, ESCUDO)":
			"· 클럽 정보(이름, 색상, 엠블럼)",
		"VER MÁS ({0})": "더 보기({0})",
		"QUITAR TODO LO EDITADO": "편집 모두 삭제",
		"Las plantillas, los traspasos, las caras y los escudos vuelven a la base de fábrica.":
			"스쿼드, 이적, 얼굴, 엠블럼이 모두 기본 설정으로 돌아가요.",
		"Vale para todas las ranuras de partida, no solo para esta.":
			"이 세이브만이 아니라 모든 세이브 슬롯에 적용돼요.",
		"Esto SI es para siempre.": "이건 되돌릴 수 없어요.",
		"Ningún {0} encaja con esa búsqueda. Toca TODOS para ver el resto.":
			"검색과 맞는 {0} 없음. 전체를 탭하면 나머지가 보여요.",
		"SUBIR O BAJAR TODO EL CLUB": "클럽 전체 올리기/내리기",
		"AJUSTAR EL CLUB": "클럽 조정",
		"Suma o resta a TODAS las cualidades de los 23 asientos.":
			"23개 자리의 모든 능력치에 더하거나 빼요.",
		"Nada baja de {0} ni pasa de {1}. Se deshace entero con QUITAR EDICIONES DEL CLUB.":
			"{0} 아래로 내려가거나 {1} 위로 올라가지 않아요. 클럽 편집 되돌리기로 전부 취소돼요.",
		"DUPLICAR": "복제",
		"No es para siempre: QUITAR EDICION devuelve al de antes.":
			"영구적이지 않아요: 편집 취소로 예전 선수가 돌아와요.",
		"JUGADOR NUEVO": "새 선수",
		"El puesto y el dorsal los da el asiento\nque elijas al final.":
			"포지션과 등번호는 마지막에\n고르는 자리가 정해요.",
		"NOMBRE DEL JUGADOR": "선수 이름",
		"ELEGIR ASIENTO": "자리 선택",
		"JUGADOR NUEVO: {0}": "새 선수: {0}",
		"TRASPASO: {0} ({1} · {2})": "이적: {0}({1} · {2})",
		"CANCELAR ALTA": "생성 취소",
		"CANCELAR TRASPASO": "이적 취소",
		"CONFIRMAR ALTA": "생성 확인",
		"{0} entra en {1}.": "{0}, {1} 합류.",
		"SE VA SOLO (SIN CAMBIO)":
			"단독 이적(교환 없음)",
		"INTERCAMBIO CON OTRO JUGADOR":
			"다른 선수와 맞교환",
		"Los dos jugadores cambian de club.":
			"두 선수가 클럽을 맞바꿔요.",
		"TRASPASO HECHO: {0} FICHA POR {1}.":
			"이적 완료: {0}, {1} 이적.",
		"Nadie vuelve a cambio: su club se queda con un jugador menos.":
			"대신 오는 선수는 없어요: 원래 클럽은 선수가 한 명 줄어요.",
		"Al tocar un club se ficha ahí mismo: no eliges asiento.":
			"클럽을 탭하면 바로 그 클럽에 영입돼요: 자리를 고르지 않아요.",
		"Nadie vuelve a cambio y nadie deja su asiento.":
			"대신 오는 선수도, 자리를 잃는 선수도 없어요.",
		"{0} se queda con {1} jugadores y {2} pasa a {3}.":
			"{0}: 선수 {1}명으로 줄고, {2}: {3}명으로 늘어요.",
		"Sigue jugando en su puesto, con un dorsal libre del club nuevo.":
			"포지션은 그대로, 새 클럽의 빈 등번호를 달아요.",
		"NO SE PUDO":
			"할 수 없어요",
		"Ya juega en ese club.":
			"이미 그 클럽에서 뛰고 있어요.",
		"Un club no puede bajar de {0} jugadores.":
			"클럽 선수는 {0}명 아래로 줄 수 없어요.",
		"Un club no puede pasar de {0} jugadores.":
			"클럽 선수는 {0}명을 넘을 수 없어요.",
		"{0} se quedaría sin ningún {1}.":
			"{0}에 {1} 포지션 선수가 한 명도 안 남게 돼요.",
		"Ese traspaso no se puede hacer.":
			"그 이적은 할 수 없어요.",
		"{0} deja su asiento y SALE del juego.":
			"{0} 선수가 자리를 비우고 게임에서 빠져요.",
		"El nuevo jugará de {0} con el dorsal {1}.":
			"새 선수는 {0} 포지션, 등번호 {1}번으로 뛰어요.",
		"CREAR": "생성",
		"ALTA HECHA: {0} ENTRA POR {1}.": "추가 완료: {0} 선수가 {1} 선수 자리에.",
		"{0} ficha por {1}.": "{0}, {1} 이적.",
		"{0} se marcha a {1}.": "{0}, {1} 클럽으로 이적.",
		"OJO: {0} pasa a jugar de {1} y {2} de {3}.":
			"참고: {0} 선수는 {1}, {2} 선수는 {3} 포지션으로 바뀌어요.",
		"CONFIRMAR TRASPASO": "이적 확인",
		"CONFIRMAR": "확인",
		"TRASPASO HECHO: {0} LLEGA POR {1}.": "이적 완료: {0} 영입 ({1})",
		"QUITAR EDICIONES": "편집 모두 취소",
		"Todo el {0} vuelve a su plantilla de base.":
			"{0} 전체가 기본 스쿼드로 돌아가요.",
		"Los traspasos hechos con este club también se deshacen aquí.":
			"이 클럽과 한 이적도 여기서 되돌려요.",
		"QUITAR TODO": "모두 삭제",


		"FISICO": "외모",
		"FISICO (PIEL, PELO, BARBA)": "외모(피부, 머리, 수염)",
		"La cara viaja con la persona: si la traspasas, se la lleva. Se guarda solo.":
			"얼굴은 선수와 함께 따라가요: 이적시키면 얼굴도 같이 가요. 자동 저장돼요.",
		"QUITAR FISICO (VOLVER AL DE FABRICA)": "외모 취소(기본값으로)",


		"Nace con esta cara. El alta no se confirma hasta elegir asiento.":
			"이 얼굴로 태어나요. 자리를 골라야 영입이 확정돼요.",

		"NOMBRE": "이름",
		"SIGLAS (VAN EN EL ESCUDO)": "약칭(엠블럼에 표시)",
		"UNIFORME": "유니폼",
		"UNIFORME · {0}": "유니폼 · {0}",
		"Playera": "상의",
		"Shorts": "하의",
		"Acento del patrón": "패턴 포인트 색",
		"PATRON": "패턴",
		"LOCAL": "홈",
		"VISITA": "원정",
		"ALTERNA": "서드",
		"El acento solo se ve si la playera lleva patrón.":
			"포인트 색은 상의에 패턴이 있을 때만 보여요.",
		"PECHO DE LA PLAYERA": "상의 앞면",
		"PATROCINADOR": "스폰서",
		"MARCA DEPORTIVA": "용품 브랜드",
		"Estas son las marcas del juego: importa un pack de logos para usar las tuyas. El club estrena lo que elijas en esta misma temporada, y desde ahí los contratos siguen rotando solos cada pocas temporadas.":
			"게임 자체 브랜드예요: 내 브랜드를 쓰려면 로고 팩을 가져오세요. 고른 브랜드는 이번 시즌부터 바로 적용되고, 그 뒤로는 몇 시즌마다 계약이 알아서 바뀌어요.",
		"Las marcas salen de tu pack. El club estrena lo que elijas en esta misma"
		+ " temporada, y desde ahí los contratos siguen rotando solos cada pocas"
		+ " temporadas.":
			"브랜드는 내 팩에서 가져와요. 고른 브랜드는 이번 시즌부터 바로 적용되고, 그 뒤로는 몇 시즌마다 계약이 알아서 바뀌어요.",


		"tintaAUTO": "자동",
		"TINTA DEL PECHO · {0}": "가슴 로고 색 · {0}",
		"Color del patrocinador": "스폰서 색",
		"Color de la marca deportiva": "용품 브랜드 색",
		"Con AUTO el juego elige el color que mejor se lee sobre esta playera. El color que fijes vale solo para este uniforme.":
			"자동이면 게임이 이 상의에서 가장 잘 보이는 색을 골라요. 직접 정한 색은 이 유니폼에만 적용돼요.",
		"Este uniforme se genera solo cada temporada. El club lo estrena tal cual"
		+ " en la temporada en que lo elijas, y a partir de ahí sigue cambiando de"
		+ " color y dibujo cada año.":
			"이 유니폼은 매 시즌 새로 만들어져요. 고른 시즌에는 그대로 입고, 그 뒤로는 해마다 색과 디자인이 바뀌어요.",
		"ESCUDO": "엠블럼",


		"escudoFORMA": "모양",
		"FONDO": "바탕",
		"TINTA": "잉크",
		"EMBLEMA": "문양",
		"BORDE": "테두리",
		"La fuerza y el país no se tocan aquí: son la estructura de la liga.":
			"전력과 국가는 여기서 못 바꿔요: 리그 구조의 일부예요.",



		"Se INTERCAMBIA con un club de otra división del mismo país: uno sube y el"
		+ " otro baja, y cada liga sigue con los mismos equipos.":
			"같은 나라의 다른 디비전 클럽과 맞바꿔요: 하나는 올라가고 하나는 내려가서, 각 리그의 팀 수는 그대로예요.",
		"ELIGE EL CLUB CON EL QUE SE CAMBIA": "맞바꿀 클럽 선택",
		"Los dos se cruzan: uno sube y el otro baja.\nTiene que ser de otra división"
		+ " del mismo país.":
			"두 클럽이 맞바뀌어요: 하나는 올라가고 하나는 내려가요.\n같은 나라의 다른 디비전 클럽이어야 해요.",
		"CAMBIO DE DIVISION: {0} ({1})": "디비전 변경: {0}({1})",
		"CANCELAR CAMBIO": "변경 취소",
		"CONFIRMAR CAMBIO DE DIVISION": "디비전 변경 확인",
		"{0} pasa a {1}.": "{0}, {1} 소속으로.",
		"Se cruzan los dos, así que cada división sigue con los mismos equipos.":
			"두 클럽이 맞바뀌니 각 디비전의 팀 수는 그대로예요.",
		"Su plantel y su fuerza no cambian.": "스쿼드와 전력은 바뀌지 않아요.",
		"Las carreras ya empezadas siguen con la división que tengan.":
			"이미 시작한 커리어는 원래 디비전 그대로예요.",
		"CAMBIO HECHO: {0} A {1}.": "변경 완료: {0}, 이제 {1}.",

		"ELIGE SU EQUIPO NUEVO": "새 클럽 선택",
		"Se cruza con el técnico de ese club: cada uno se sienta en el banquillo del otro.":
			"그 클럽 감독과 맞바꿔요: 서로 상대 벤치에 앉아요.",
		"CAMBIO DE EQUIPO: {0} ({1})": "클럽 변경: {0}({1})",
		"— TÉCNICOS —": "— 감독 —",
		"SU CARA": "얼굴",
		"CAMBIAR DE EQUIPO": "클럽 변경",
		"DEJARLO LIBRE": "무소속으로",
		"{0} SE QUEDA SIN EQUIPO. EN SU BANQUILLO SE SIENTA {1}.":
			"{0}, 감독직에서 물러남. {1} 감독이 벤치를 맡아요.",
		"Se va al mercado de técnicos y puede volver.":
			"감독 시장에 나가고, 다시 돌아올 수 있어요.",
		"DEVOLVER A SU CLUB": "원래 클럽으로",
		"{0} VUELVE A {1}.": "{0}, {1} 복귀.",
		"QUITAR EDICIÓN DEL TÉCNICO": "감독 편집 취소",

		"— SELECCIONES —": "— 대표팀 —",
		"Las selecciones vuelven a su uniforme y su convocatoria de fábrica.":
			"대표팀이 기본 유니폼과 기본 소집 명단으로 돌아가요.",
		"El uniforme y la convocatoria de cada selección valen para todas tus partidas.":
			"각 대표팀의 유니폼과 소집 명단은 모든 세이브에 적용돼요.",
		"BUSCAR SELECCION": "대표팀 검색",
		"Ninguna selección se llama así.": "그런 이름의 대표팀은 없어요.",
		"EDITADO: {0}": "편집됨: {0}",
		"AUTOMATICA": "자동",
		"ELEGIR CONVOCADOS": "소집 선수 선택",
		"Este uniforme se genera solo cada temporada. La selección lo estrena tal cual en la temporada en que lo elijas, y a partir de ahí sigue cambiando de color y dibujo cada año.":
			"이 유니폼은 매 시즌 새로 만들어져요. 대표팀은 고른 시즌에 그대로 입고, 그 뒤로는 해마다 색과 디자인이 바뀌어요.",
		"La bandera, el nombre y la fuerza de un país no se tocan aquí.":
			"국기, 이름, 전력은 여기서 못 바꿔요.",
		"QUITAR EDICION DEL UNIFORME": "유니폼 편집 취소",
		"{0} vuelve a sus uniformes de fábrica.": "{0}, 기본 유니폼으로 돌아가요.",
		"Su convocatoria no se toca.": "소집 명단은 그대로예요.",
		"FIJAR: va siempre. VETAR: no va nunca. El resto de la lista la arma el juego con los mejores del país.":
			"고정: 항상 소집. 제외: 절대 소집 안 함. 나머지는 게임이 그 나라 최고 선수들로 채워요.",
		"CONVOCADOS · {0}": "소집 명단 · {0}",
		"A LAS PUERTAS": "발탁 후보",
		"VER {0} MAS": "{0}명 더 보기",
		"FUERA DE LA LISTA": "명단 외",
		"VETADO": "제외됨",
		"QUITAR VETO": "제외 해제",
		"FIJADO, PERO YA NO ESTA EN EL PAIS": "고정됨, 하지만 더 이상 후보군에 없음",
		"FIJADO, SIN SITIO": "고정됨, 자리 없음",
		"SOLTAR": "해제",
		"QUITAR FIJADOS Y VETOS": "고정·제외 모두 해제",
		"{0} vuelve a convocar solo a sus mejores.": "{0}, 다시 최고 선수들만 소집해요.",
		"Su uniforme no se toca.": "유니폼은 그대로예요.",
		"FIJADO": "고정됨",
		"FIJAR": "고정",
		"VETAR": "제외",

		"— LEYENDAS —": "— 레전드 —",
		"Los grandes de la historia no juegan en ningún club: su cara se toca aquí.":
			"역사 속 위대한 선수들은 클럽 소속이 없어요: 얼굴은 여기서 바꿔요.",
		"Sale con esta cara donde aparezca: al conocerla, en la gala y en la cancha. Se guarda sola.":
			"이 얼굴은 어디서나 나와요: 만날 때, 시상식, 그라운드에서도요. 자동 저장돼요.",
		"QUITAR CARA (VOLVER A LA SUYA)": "얼굴 취소(원래 얼굴로)",
		"La cara viaja con él: si cambia de banquillo, se la lleva. Se guarda sola.":
			"얼굴은 감독과 함께 따라가요: 벤치를 옮기면 같이 가요. 자동 저장돼요.",
		"Fija en todas tus carreras. Sus resultados la suben o la bajan.":
			"모든 커리어에 고정. 성적에 따라 오르내려요.",
		"Sin tocar, se sortea en cada carrera alrededor de esto.":
			"그대로 두면 커리어마다 이 값 근처로 정해져요.",
		"Sus resultados la suben o la bajan hasta estrella y media.":
			"성적에 따라 별 한 개 반까지 오르내려요.",
		"El cambio de equipo vale para las carreras nuevas.": "클럽 변경은 새 커리어에 적용돼요.",
		"El cambio de equipo vale desde hoy en esta carrera.":
			"클럽 변경은 이 커리어에서 오늘부터 적용돼요.",
		"CONFIRMAR CAMBIO DE EQUIPO": "클럽 변경 확인",
		"{0} pasa a entrenar al {1}.": "{0}, {1} 감독으로 부임.",
		"Cada uno se lleva su habilidad, su cara y sus trofeos.":
			"각자 능력, 얼굴, 트로피를 그대로 가져가요.",
		"Las carreras ya empezadas siguen con sus banquillos.":
			"이미 시작한 커리어는 벤치가 그대로예요.",
		"Tu relación con tu técnico no cambia.": "내 감독과의 관계는 그대로예요.",
		"CAMBIO HECHO: {0} ENTRENA AL {1}.": "변경 완료: {0}, {1} 감독 부임.",
		"· DIVISION CAMBIADA ({0})": "· 디비전 변경됨({0})",
		"La división tampoco: se deshace intercambiando otra vez.":
			"디비전도 마찬가지예요: 다시 맞바꿔야 되돌릴 수 있어요.",
		"QUITAR EDICION DEL CLUB": "클럽 편집 취소",
		"{0} vuelve a su nombre, uniforme y escudo de fábrica.":
			"{0}, 기본 이름·유니폼·엠블럼으로 돌아가요.",
		"Su plantel no se toca.": "스쿼드는 그대로예요.",


		"LISO": "민무늬",
		"RAYAS": "세로줄",
		"AROS": "가로줄",
		"MITADES": "반반",
		"MANGAS": "소매",
		"RAYA FINA": "핀스트라이프",
		"BANDA": "사선띠",
		"DIAGONAL": "대각선",
		"CUADROS": "체크",
		"FRANJA VERTICAL": "중앙 세로띠",
		"FRANJA PECHO": "가슴 띠",
		"REDONDO": "원형",
		"SCUDETTO": "스쿠데토",
		"HEXAGONO": "육각형",
		"BANDERIN": "페넌트",
		"ROMBO": "마름모",
		"ESTANDARTE": "깃발",
		"TRAPECIO": "사다리꼴",
		"FRANCES": "프렌치",
		"PICA": "창끝형",
		"CUADRADO": "사각형",
		"PALO": "세로",
		"FAJA": "가로",
		"CUARTELES": "4분할",
		"CHEVRON": "셰브런",
		"JEFE": "상단",
		"PIE": "하단",
		"ORLA": "테두리",
		"PUNTA": "쐐기",
		"ROMBOS": "마름모꼴",
		"TRICOLOR": "삼색",
		"SEGUNDO COLOR": "보조 색상",
		"OSCURO": "어둡게",
		"CLARO": "밝게",
		"NADA": "없음",
		"LETRAS": "글자",
		"ESTRELLA": "별",
		"DOS ESTRELLAS": "별 두 개",
		"ARO": "고리",
		"BALON": "공",
		"AGUILA": "독수리",
		"TORO": "황소",
		"CORONA": "왕관",
		"RAYO": "번개",
		"LUNA": "초승달",
		"TORRE": "탑",
		"ANCLA": "닻",
		"ENGRANE": "톱니",
		"HOJA": "잎",
		"ORO": "금색",
		"BLANCO": "흰색",
		"NEGRO": "검정",
		"TEMPORADA {0}": "{0}시즌",
		"FIN DE TEMPORADA": "시즌 종료",
		"TU AÑO": "내 한 해",
		"PROGRESION": "성장",
		"EL MUNDO": "세계",
		"LO QUE VIENE": "앞으로",
		"LA DESPEDIDA": "작별",
		"IR AL MERCADO": "이적 시장으로",
		"Objetivo del club: {0}": "클럽 목표: {0}",
		"CUMPLIDO": "달성",
		"NO CUMPLIDO": "미달성",
		"temporadaMEDIA": "평점",
		"{0} vs. el año pasado": "작년 대비 {0}",
		"TUS HABILIDADES": "내 능력",
		"TU SITIO EN EL MUNDO": "세계 속 내 위치",
		"TU CARRERA HASTA HOY": "지금까지 내 커리어",
		"Tu mejor partido: {0}": "내 최고의 경기: {0}",
		"HITOS DE CARRERA": "커리어 이정표",
		"{0} partidos como profesional": "프로 통산 {0}경기",
		"{0} goles de carrera": "커리어 통산 {0}골",
		"{0} asistencias de carrera": "커리어 통산 도움 {0}",
		"{0} partidos disputados": "{0}경기 출전",
		"{0} goles marcados": "{0}골 기록",
		"{0} asistencias repartidas": "도움 {0}개 기록",
		"TÚ Y TUS COMPAÑEROS": "나와 동료들",
		"TU MEJOR PARTIDO": "내 최고의 경기",
		"OBJETIVO DEL CLUB": "클럽 목표",
		"vs {0}": "vs {0}",
		"vs. el año pasado": "작년 대비",
		"EL CLUB Y TÚ": "클럽과 나",
		"EL CLUB CUENTA CONTIGO": "클럽이 나를 믿어요",
		"EL CLUB ESPERA MÁS DE TI": "클럽은 더 많은 걸 기대해요",
		"EL CLUB TE BUSCARÁ MINUTOS FUERA": "클럽이 다른 곳에서 뛸 기회를 찾아 줄 거예요",
		"EL CLUB TE PONE EN EL ESCAPARATE": "클럽이 나를 매물로 내놓았어요",
		"TU MEDIA AÑO A AÑO": "해마다 내 능력치",
		"Valor de mercado": "시장 가치",
		"Dinero": "돈",
		"SIN TÍTULOS": "무관",
		"Este año no levantaste nada. Se vuelve a empezar.":
			"올해는 아무것도 들어 올리지 못했어요. 다시 처음부터.",
		"En color, lo que levantaste; apagado, lo que se escapó.": "컬러는 들어 올린 것, 흐린 건 놓친 것.",
		"LO QUE GANASTE": "내가 딴 것",
		"GOLEO DE LA LIGA": "리그 득점 순위",
		"CÓMO ACABÓ TU LIGA": "내 리그 최종 순위",
		"Acabaste {0} de {1}.": "최종 순위: {1}팀 중 {0}.",
		"SIN NOVEDAD": "특별한 일 없음",
		"El mundo siguió su curso sin sobresaltos.": "세상은 별일 없이 흘러갔어요.",
		"LO QUE SE LLEVARON OTROS": "다른 이들이 가져간 것",

		"EN EL MUNDO": "전 세계",
		"FICHAJE DEL AÑO": "올해의 영입",
		"Suben de categoría: {0}": "승격: {0}",
		"{0} pts": "{0}점",
		"Y HASTA AQUI": "여기까지",
		"NO HAY TEMPORADA SIGUIENTE.": "다음 시즌은 없어요.",
		"Se acabó el futbol jugado. Lo que viene ahora es la despedida, y despues lo"
		+ " que dejaste.":
			"선수로 뛰는 날은 끝났어요. 이제 남은 건 작별, 그리고 내가 남긴 것이에요.",


		"{0} temporadas": "{0}시즌",
		"Hiciste {0} goles el año pasado": "지난 시즌 {0}골을 넣었어요",
		"Diste {0} asistencias el año pasado": "지난 시즌 도움 {0}개를 기록했어요",
		"Jugaste {0} partidos el año pasado": "지난 시즌 {0}경기를 뛰었어요",
		"PRIMA": "보너스",
		"EL AÑO EN DINERO": "돈으로 본 한 해",
		"GANASTE ESTE AÑO": "올해 번 돈",
		"Primas por títulos": "우승 보너스",
		"Prima de objetivo": "목표 보너스",
		"Prima por el año del club": "클럽 시즌 보너스",
		"Royalties de camiseta": "유니폼 로열티",
		"Premio del patrocinador": "스폰서 보상",

		"TU SELECCIÓN": "내 대표팀",
		"TU CUERPO": "내 몸",
		"EL RESTO DEL AÑO": "올해의 나머지",
		"TU SITUACIÓN": "내 상황",
		"ERES AGENTE LIBRE: tu contrato terminó.": "FA 신분이에요: 계약이 끝났어요.",
		"Ningún club es dueño de tu pase. Elige destino en el mercado: fichas sin"
		+ " traspaso y con prima.":
			"내 소유권을 가진 클럽은 없어요. 이적 시장에서 행선지를 고르세요: 이적료 없이, 입단 보너스를 받고 계약해요.",
		"Contrato: ÚLTIMO AÑO": "계약: 마지막 해",
		"Contrato: {0} temporadas por delante": "계약: {0}시즌 남음",
		"Renueva o escucha ofertas: si acabas el año sin firmar, te vas gratis.":
			"재계약하거나 제안을 들어 보세요: 사인 없이 시즌이 끝나면 공짜로 떠나요.",
		"LO QUE TE PIDEN AHORA": "새 목표",
		"QUIÉN TE QUIERE": "나를 원하는 클럽",
		"TE QUIERE YA": "당장 원함",
		"MUY INTERESADO": "큰 관심",
		"Y {0} clubes más preguntaron por ti.": "그 밖에 {0}개 클럽이 문의했어요.",
		"ÚLTIMA JUGADA": "마지막 기회",
		"GOLEADOR": "득점",
		"ASISTENCIA": "도움",
		"hudFINAL": "경기 종료",
		"CALIFICACIÓN": "평점",
		"EXPERIENCIA": "경험치",
		"¡NIVEL {0}!  +{1} puntos": "레벨 {0}!  +{1}포인트",
		"¡NIVEL {0}!": "레벨 {0}!",

		"RECUPERADAS": "볼 회수",



		"Recuperadas": "볼 회수",
		"OCASIONES": "찬스",
		"PASES": "패스",
		"{0} CLAVE": "키패스 {0}",
		"HAT-TRICK": "해트트릭",
		"HÉROE DEL DERBI": "더비 영웅",
		"PARTIDAZO": "인생 경기",
		"REPARTIDOR": "플레이메이커",
		"DOBLETE": "멀티골",
		"GOL Y ASISTENCIA": "골+도움",
		"GRAN PARTIDO": "맹활약",
		"LOS 90 MINUTOS": "풀타임",
		"UNIFORMES PARECIDOS · EL RIVAL SALE DE VISITA":
			"유니폼이 비슷함 · 상대는 원정 유니폼",
		"JUGAR": "플레이",
		"SALTAR AL CAMPO": "그라운드로",
		"SUPLENTE": "교체",
		"CANSADO": "지침",
		"JORNADA {0}": "{0}라운드",
		"Uniforme titular": "홈 유니폼",
		"Uniforme visitante": "원정 유니폼",
		"Tercer uniforme": "서드 유니폼",
		"Uniforme conmemorativo": "기념 유니폼",
		"uniformeLOCAL": "홈",
		"uniformeVISITA": "원정",
		"uniformeALTERNA": "서드",
		"El balón debe estar al menos a {0} m de la línea de gol.":
			"볼은 골라인에서 최소 {0}m 떨어져야 해요.",
		"El balón está demasiado cerca del arco (mínimo {0} m).":
			"볼이 골문에 너무 가까워요(최소 {0}m).",
		"Con el balón tan abierto la cámara cae tras la tribuna (máx {0} m).":
			"볼이 이렇게 측면에 있으면 카메라가 관중석 뒤로 가요(최대 {0}m).",
		"Hay un jugador fuera del campo.": "그라운드 밖에 선수가 있어요.",
		"Un balón en movimiento tan lento nunca sale de la pantalla de tiro.":
			"이렇게 느리게 움직이는 볼은 슈팅 화면을 벗어나지 못해요.",
		"Tipo de jugada desconocido.": "알 수 없는 플레이 유형.",
		"Un jugador de la barrera no está a los 9.15 m.":
			"수비벽 선수 한 명이 9.15m 위치에 없어요.",
		"{0} {1} CERCA de la jugada quedan fuera del encuadre.":
			"{0} {1}: 플레이 근처인데 화면 밖에 있어요.",
		"{0} {1} tapan tu carril de tiro.": "{0} {1}: 슈팅 길을 막고 있어요.",
		"{0} {1} pegados al balón o a tu carrera.":
			"{0} {1}: 볼이나 도움닫기 위치에 바짝 붙어 있어요.",
		"{0} {1} de jugadores encimados.": "{0} {1}: 선수끼리 겹쳐 있어요.",
		"{0} {1} en fuera de juego: el pase se pitará.":
			"{0} {1}: 오프사이드, 패스가 반칙 판정돼요.",
		"Un centro sin rematadores no tiene a quién buscar.":
			"공격수가 없는 크로스는 받을 사람이 없어요.",
		"TUS MARCAS": "내 기록",
		"TORNEOS DE EUROPA": "유럽 클럽 대회",

		"BALONES DE ORO": "올해의 선수",
		"LIGAS": "리그",
		"RÉCORD / TÚ": "기록 / 나",
		"RÉCORD / {0}": "기록 / {0}",
		"EN ACTIVO": "현역",
		"a los {0}": "{0}세",

		"TUS VÍCTIMAS": "내 희생양",
		"G+A": "G+A",
		"G+A/PJ": "G+A/P",
		"{0} RIVALES": "상대 {0}팀",
		"Todavía no le has hecho daño a nadie.": "아직 아무도 울리지 않았어요.",
		"Aún no hay historia que contar: sal a jugar.":
			"아직 들려줄 이야기가 없어요: 나가서 뛰세요.",
		"Mejor temporada goleadora": "최고 득점 시즌",
		"Más asistencias en un año": "한 해 최다 도움",
		"Mejor media (10+ partidos)": "최고 평점(10경기 이상)",
		"Valor pico: $ {0} a los {1} años": "최고 몸값: {1}세에 $ {0}",
		"Mayor presentación: {0} personas ({1}, T{2})":
			"최대 입단식: {0}명 ({1}, S{2})",
		"{0}: {1} (T{2}, {3})": "{0}: {1} (S{2}, {3})",
		"RÉCORDS DE LA LIGA · {0}": "리그 기록 · {0}",
		"EL REGISTRO DE {0}": "{0} 클럽 기록",
		"RÉCORDS DEL MUNDO": "세계 기록",
		"★ {0}: {1} — RÉCORD TUYO": "★ {0}: {1} — 내 기록",
		"{0}: {1} — TU RÉCORD (T{2})": "{0}: {1} — 내 기록(S{2})",
		"Antes: {0} ({1}), con {2}": "이전: {0}({1}), {2} 소속",
		"Tu mejor: {0}": "내 최고: {0}",
		"Goles en una temporada": "한 시즌 골",
		"Asistencias en una temporada": "한 시즌 도움",
		"Mejor media en una temporada": "한 시즌 최고 평점",
		"Goles en una temporada con el club": "클럽 소속 한 시즌 골",
		"Goles con el club": "클럽 통산 골",
		"SUPERAS A": "추월",
		"LEYENDA Nº{0}": "레전드 {0}위",
		"Partidos jugados en la liga": "리그 출장 경기",
		"Partidos jugados con el club": "클럽 출장 경기",
		"Goles en una edición de Champions": "엘리트컵 단일 대회 골",
		"Asistencias en una edición de Champions": "엘리트컵 단일 대회 도움",
		"Mejor media en una edición de Champions": "엘리트컵 단일 대회 최고 평점",
		"Goles en una edición de Europa League": "유로파컵 단일 대회 골",
		"Asistencias en una edición de Europa League": "유로파컵 단일 대회 도움",
		"Mejor media en una edición de Europa League": "유로파컵 단일 대회 최고 평점",
		"Goles en una edición de Conference": "챌린지컵 단일 대회 골",
		"Asistencias en una edición de Conference": "챌린지컵 단일 대회 도움",
		"Mejor media en una edición de Conference": "챌린지컵 단일 대회 최고 평점",
		"Goles con la selección": "대표팀 통산 골",
		"LA SELECCIÓN · {0}": "국가대표팀 · {0}",
		"Reescrito {0} veces: {1}": "{0}번 경신: {1}",
		"{0} reescribió el libro: {1} ({2})": "{0}, 기록 경신: {1}({2})",
		"RÉCORD": "기록",



		"SUPERAS A UNA LEYENDA": "레전드 추월",
		"SUPERADA": "추월 완료",
		"TE ADELANTÓ": "나를 추월",
		"Tu palmarés sólo cuenta lo ganado en 1ª división y el Mundial: es la vara con la que se mide a los grandes.":
			"내 커리어 기록은 1부와 세계 대회에서 딴 것만 쳐요: 레전드를 재는 기준이에요.",
		"Superar a tu primera leyenda de la historia (sólo cuenta lo hecho en 1ª división o con la selección).":
			"역사 속 레전드를 처음으로 추월하기(1부나 대표팀 기록만 인정).",
		"SUPERADO EN TÍTULOS": "트로피에서 추월당함",
		"SUPERADO EN GOLES + ASISTENCIAS": "골+도움에서 추월당함",
		"TUS TÍTULOS (1ª Y SELECCIÓN)": "내 트로피(1부·대표팀)",
		"TUS GOLES + ASISTENCIAS DE ÉLITE": "최상위 무대 골+도움",
		"la tuya": "내 것",
		"por delante": "앞서 있음",
		"SEGUIR": "계속",
		"lo tenía": "보유자",
		"su marca": "그 기록",
		"desde": "이후",
		"Tu nombre entra en los libros. Ese registro ya es tuyo.":
			"내 이름이 기록에 남아요. 이제 그 기록은 내 거예요.",
		"{0}: {1}. El registro era de {2} ({3}).":
			"{0}: {1}. 이전 기록 보유자는 {2}({3}).",
		"{0} · {1} JUGADORES": "{0} · 선수 {1}명",
		"CAPITÁN": "주장",
		"PENALES": "PK",
		"EL GLOBAL ES TUYO: AL RIVAL NO LE SIRVE ESTE MARCADOR": "합계 스코어 우위: 상대에겐 이 스코어로는 소용없어요",
		"{0} SE VUELCA ARRIBA: LE FALTAN {1} PARA PASAR": "{0}, 총공격: 통과까지 {1}골 더 필요",
		"EL RIVAL DEJA MEDIO EQUIPO EN TU CAMPO, ATRÁS HAY PRADERA": "상대가 절반을 우리 진영에 올렸어요, 뒷공간이 텅 비었어요",
		"GLOBAL EMPATADO: ESTO HUELE A PRÓRROGA": "합계 동점: 연장전 냄새가 나요",
		"TE FALTAN {0} EN EL GLOBAL, HAY QUE IR A POR ELLOS": "합계에서 {0}골 부족, 골을 넣으러 가야 해요",
		"TU EQUIPO SE VUELCA Y DEJA LA ESPALDA VENDIDA": "우리 팀이 총공격, 뒷공간이 활짝 열렸어요",
		"GLOBAL {0}-{1}": "합계 {0}-{1}",
		"PASA {0}": "{0} 진출",
		"FALTAS / CÓRNERS": "프리킥 / 코너킥",
		"Sin plantel: aún no tienes club.": "스쿼드 없음: 아직 소속 클럽이 없어요.",
		"SUELDO": "주급",
		"NOTA": "평점",
		"Capitán": "주장",
		"Lanza los penales": "PK 키커",
		"Lanza faltas y córners": "프리킥·코너킥 키커",
		"Aún no hay convocatoria que mostrar.": "아직 보여 줄 소집 명단이 없어요.",
		"CONVOCATORIA": "소집 명단",


		"— banca —": "— 벤치 —",
		"— corte de la convocatoria —": "— 소집 명단 컷 —",

		"No tienes avisos todavía.": "아직 알림이 없어요.",
		"{0} · NUEVO": "{0} · 신규",
		"T{0} · día {1}": "{0}시즌 {1}일차",
		"buzonPREMIO": "수상",
		"buzonCLUB Y SELECCION": "클럽·대표팀",
		"buzonMARCA Y NIVEL": "브랜드·레벨",
		"buzonLESION": "부상",
		"buzonAVISO": "소식",
		"COMÚN": "일반",
		"RARO": "레어",
		"ÉPICO": "에픽",
		"LEGENDARIO": "레전더리",
		"ADIÓS A LAS CANCHAS": "그라운드와 작별",
		"{0} TEMPORADAS · SE RETIRA A LOS {1}": "{0}시즌 · {1}세에 은퇴",
		"JUGO HASTA EL FINAL": "끝까지 뛰었다",
		"SE FUE CUANDO QUISO": "원할 때 떠났다",

		"EL CUERPO DIJO BASTA": "몸이 한계에 다다랐다",
		"TU LEGADO": "내 레거시",
		"por rango": "등급순",
		"Club: {0} partidos  ({1}V · {2}E · {3}D)":
			"클럽: {0}경기  ({1}승 · {2}무 · {3}패)",
		"Goles: {0}   Asistencias: {1}   Media: {2}":
			"골: {0}   도움: {1}   평점: {2}",
		"{0}: {1} partidos · {2} goles · {3} asistencias":
			"{0}: {1}경기 · {2}골 · 도움 {3}",
		"TOTAL: {0} partidos · {1} goles · {2} asistencias":
			"합계: {0}경기 · {1}골 · 도움 {2}",
		"{0} títulos de equipo · {1} premios individuales":
			"팀 우승 {0}회 · 개인상 {1}회",
		"TUS CLUBES": "내 클럽",
		"EMPEZAR OTRA CARRERA": "새 커리어 시작",
		"ENTRAR AL MUSEO": "박물관 입장",
		"TE QUIEREN DE VUELTA": "복귀 러브콜",
		"JUGASTE AQUÍ": "뛰었던 곳",
		"Ya jugaste aquí, y no te han olvidado.": "예전에 여기서 뛰었고, 아직 다들 잊지 않았어요.",
		"Su {0} tiene {1}. Tú vuelves con {2}.": "그 팀 {0} 포지션: {1}. 내 복귀 능력치: {2}.",
		"¿FIRMAS?": "계약?",
		"{0} · {1} por temporada, {2} años.": "{0} · 시즌당 {1}, {2}년.",
		"Vuelves como agente libre y sin traspaso. Es la única vuelta que tiene esta carrera: si la firmas, el retiro que viene después ya es el definitivo.": "이적료 없이 FA로 복귀해요. 이 커리어의 단 한 번뿐인 복귀예요: 계약하면 그다음 은퇴가 마지막이에요.",
		"FIRMAR Y VOLVER": "계약하고 복귀",
		"¿VOLVER A JUGAR?": "다시 뛸까요?",
		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos. Volverías con 10 puntos menos en todas tus habilidades.": "제안을 듣는 데 1년이 걸려요: 세상은 나 없이 흘러가고 나는 뛰지 못한 채 나이를 먹어요. 모든 능력이 10 낮아진 채 복귀해요.",
		"VER QUIÉN ME QUIERE": "나를 원하는 곳 보기",


		"¿SALIR DEL RETIRO?": "은퇴 번복?",
		"Escuchar ofertas cuesta un año, y vuelves con 10 menos en todo.": "제안을 듣는 데 1년이 걸리고, 모든 능력이 10 낮아진 채 복귀해요.",
		"SÍ, VUELVO": "네, 복귀할게요",
		"YA PAGASTE EL AÑO": "1년은 이미 지불함",
		"CUESTA UN AÑO · 10 MENOS EN TODO": "1년 소요 · 모든 능력 -10",
		"¿CON QUIÉN VUELVES?": "누구와 복귀할까요?",
		"VOLVER AL MUSEO": "박물관으로 돌아가기",


		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos.": "제안을 듣는 데는 1년이 걸려요. 세상은 당신 없이 흘러가고, 당신은 뛰지도 못한 채 나이를 먹어요.",
		"LO QUE CUESTA": "치러야 할 대가",
		"HABILIDADES": "능력",
		"VUELVES": "복귀",
		"EL ÚLTIMO VISTAZO": "마지막 한 번",
		"años": "나이",
		"tu OVR": "내 OVR",
		"Ni una copa detrás del cristal. Por eso vuelves.": "진열장에 트로피가 하나도 없어요. 그래서 돌아가는 거예요.",
		"Todo eso ya lo ganaste. Y aun así te vas a poner las botas otra vez.": "이미 다 이뤄냈죠. 그런데도 또 축구화 끈을 묶네요.",
		"Se está bien aquí dentro. Pero aquí dentro ya no pasa nada.": "여기 안은 편해요. 하지만 여기선 이제 아무 일도 일어나지 않아요.",
		"EL AÑO QUE TE PERDISTE": "당신이 놓친 한 해",
		"La liga la ganó {0}.": "리그 우승팀: {0}.",
		"No llamó nadie. El teléfono de un retirado de tu edad suena poco, y ese silencio también es una respuesta.": "아무도 연락하지 않았어요. 당신 나이의 은퇴 선수에게 전화는 잘 오지 않고, 그 침묵 역시 하나의 대답이에요.",
		"MUSEO": "박물관",
		"SALIR DEL MUSEO": "박물관 나가기",
		"NO QUEDAN RANURAS": "남은 슬롯 없음",
		"Todas las ranuras tienen carrera. Cuelga esta placa en el SALÓN DE LA FAMA o borra una desde AJUSTES para empezar otra.": "모든 슬롯에 커리어가 있어요. 이 명판을 명예의 전당에 걸거나, 설정에서 하나를 지우고 새로 시작하세요.",
		"ELEGIR CARRERA": "커리어 선택",
		"Tres carreras, cada una con su propia partida.":
			"커리어 3개, 각각 따로 저장돼요.",
		"RETIRADO · {0} PARTIDOS · {1} GOLES": "은퇴 · {0}경기 · {1}골",
		"RETIRADO · {0} PARTIDOS": "은퇴 · {0}경기",
		"MANTÉN PULSADO PARA BORRAR": "길게 눌러 삭제",
		"TEMPORADA {0} · {1} AÑOS · {2} PJ": "시즌 {0} · {1}세 · {2}경기",
		"¿BORRAR ESTA CARRERA?": "이 커리어를 삭제할까요?",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.\nLas otras dos"
		+ " no se tocan.":
			"{0}의 커리어가 사라져요: 레벨, 돈, 계약, 우승 기록.\n나머지 두 개는 그대로예요.",
		"TU JUGADOR": "내 선수",
		"TU CLUB · SE CAMBIA EN EL MERCADO": "내 클럽 · 이적 시장에서 변경",
		"Se guarda solo.": "자동 저장돼요.",
		"GUARDAR": "저장",

		"¡Peina {0}!": "{0}, 머리로 연결!",
		"¡La peina!": "머리로 연결!",
		"¡Cambio de banda!": "방향 전환!",
		"Te quedaste con la salida corta": "짧게 내주는 데 그쳤어요",
		"El pase no llegó": "패스가 짧았어요",
		"¡Saliste jugando!": "빌드업 성공!",
		"Te encerraron": "상대에게 갇혔어요",
		"Toca a tu jugador para empezar": "내 선수를 탭해서 시작하세요",
		"Te frenaron con falta": "파울로 끊겼어요",
		"¡El perro cortó la jugada!": "강아지가 경기를 끊었어요!",

		"El rival se repliega": "상대가 내려앉아요",
		"Falta en tu campo: se reanuda": "우리 진영 파울: 경기 재개",

		"SAL JUGANDO": "후방 빌드업",

		"¡DE PRIMERA! PASE DE {0}": "원터치! {0}의 패스",
		"¡DE PRIMERA! TE LA PONEN": "원터치! 패스가 와요",
		"¡CABEZAZO! TE LA CUELGAN": "헤더! 크로스가 와요",
		"¡CABEZAZO! CENTRO DE {0}": "헤더! {0}의 크로스",
		"¡VOLEA! TE LA CUELGAN": "발리! 크로스가 와요",
		"¡VOLEA! CENTRO DE {0}": "발리! {0}의 크로스",
		"¡CHILENA! TE LA CUELGAN": "바이시클 킥! 크로스가 와요",
		"¡CHILENA! CENTRO DE {0}": "바이시클 킥! {0}의 크로스",
		"¡CÓRNER! TE LA CUELGAN": "코너킥! 크로스가 와요",
		"¡CÓRNER! LO SACA {0}": "코너킥! 키커 {0}",
		"¡FALTA! TE LA CUELGAN": "프리킥! 크로스가 와요",
		"¡FALTA! LA CUELGA {0}": "프리킥! {0}의 크로스",

		"Salida de meta": "골킥",
		"Sacas de meta con tu portero: juégala en corto o revienta el pase largo. Luego juegas con quien la recibe.": "골키퍼로 골킥을 차요. 짧게 연결하거나 길게 차세요. 그다음엔 공을 받은 선수로 플레이해요.",
		"Apunta a un compañero y suelta": "동료를 조준하고 놓으세요",
		"SALIDA DE META": "골킥",
		"Te cortaron el pase": "패스가 끊겼어요",
		"PASE CORTADO": "패스 차단",

		"Salida jugada": "빌드업",
		"Naces en tu campo con el balón. Conduce, pásala y avanza: cada pase lo golpeas tú y juegas con quien la recibe.": "내 진영에서 공을 갖고 시작해요. 드리블하고, 패스하고, 전진하세요. 모든 패스는 직접 차고, 받은 선수로 플레이해요.",
		"Arrastra para conducir; apunta a un compañero y suelta": "드래그로 드리블; 동료를 조준하고 놓으세요",
		"Saque de banda corto": "짧은 스로인",
		"Saque de banda al área": "박스 안으로 스로인",
		"Te la sacan de banda al área. No se controla: espera a que llegue y cabecea a puerta.": "박스 안으로 스로인이 와요. 컨트롤은 안 돼요. 공이 올 때까지 기다렸다가 골문으로 헤더하세요.",
		"Espera el saque; luego jala y suelta": "스로인을 기다렸다가 당기고 놓으세요",
		"Un compañero te la saca de banda: la controlas solo y juegas libre. Regatea, tira o devuélvesela.": "동료가 스로인해 줘요. 컨트롤은 자동이고 자유롭게 플레이해요. 드리블, 슈팅, 아니면 다시 내주세요.",
		"¡SAQUE DE BANDA!": "스로인!",
		"¡{0} SACA DE BANDA!": "{0}의 스로인!",
		"Naces en tu campo con el balón y el arco lejos. Conduce, pásala a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "내 진영에서 공을 갖고 시작하고, 골문은 멀리 있어요. 드리블하고, 동료에게 패스하고, 계속 나아가세요. 패스는 슈팅처럼 차고, 받은 선수로 플레이해요. 전진하지 않고 뒤에 머물면 상대가 더 세게 압박해요. 그다음은 1대1: 바로 슈팅하거나, 공을 몰고 원으로 돌아와 멈춘 뒤 침착하게 조준하세요.",
		"Primero sal jugando desde tu campo: conduce, pasa y llega hasta el arco. Después, el mano a mano: 1 gol en 3 intentos.": "먼저 내 진영에서 빌드업하세요: 드리블하고, 패스하고, 골문까지 가세요. 그다음은 1대1: 3번 시도에 1골.",
		"Pásala a un compañero y avanza hacia el arco.": "동료에게 패스하고 골문 쪽으로 전진하세요.",
		"PASA Y AVANZA": "패스하고 전진",
		"ATAJADA": "선방",
		"DESPEJE": "걷어냄",
		"FUERA DE JUEGO": "오프사이드",
		"BALÓN PERDIDO": "볼 뺏김",


		"TE RESBALASTE": "미끄러짐",
		"SIN CONTACTO": "헛발질",
		"CAMBIO DE BANDA": "방향 전환",
		"PASE FALLADO": "패스 실패",
		"SALIDA LIMPIA": "빌드업 성공",
		"TOCA PARA SALIR": "탭해서 빌드업",
		"ENCERRADO": "갇힘",
		"FALTA AL SALIR": "빌드업 중 파울",
		"LA COBRA OTRO": "동료가 차요",
		"¡PRÓRROGA! Dos tiempos de 15 minutos.": "연장전! 전후반 15분씩.",
		"Fin del primer tiempo extra.": "연장 전반 종료.",
		"¡TE TOCA A TI!": "내 차례!",
		"Cobra tu compañero…": "동료가 나서요…",
		"Cobra el rival…": "상대 키커가 나서요…",
		"Cobra {0}…": "키커 {0}…",
		"Arrastra hacia atrás para correr · lleva el balón a la zona roja":
			"뒤로 드래그해서 달리기 · 공을 빨간 구역으로",
		"Arrastra hacia atrás para correr · cruza al campo rival":
			"뒤로 드래그해서 달리기 · 상대 진영으로 넘어가세요",
		"CAMPO RIVAL · TIRA O PASA": "상대 진영 · 슈팅 또는 패스",
		"CAMPO RIVAL · TIRA": "상대 진영 · 슈팅",


		"LLEVA EL BALON AL DISCO ROJO": "공을 빨간 원으로",




		"AL DISCO ROJO": "빨간 원으로",
		"RASA Y LENTA": "낮고 느리게",
		"SUBE Y CAE": "뜨고 떨어짐",
		"COMBA": "커브",
		"EL CENTRO PEGA MAS FUERTE": "중앙이 가장 강해요",
		"DENTRO TIRAS / FUERA REGATEAS": "안: 슈팅 / 밖: 드리블",
		"IZQUIERDO CONDUCE / DERECHO TIRA": "왼쪽 드리블 / 오른쪽 슈팅",
		"PASALA": "패스",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: un toque en el pasto, fuera de tu círculo y sin nadie debajo, gira la vista a la banda y te enseña a los compañeros; otro toque y vuelve.":
			"패스 버튼은 없어요. 패스는 동료를 향해 슈팅하는 거고, 먼저 도착한 선수가 공을 가져요. 동료는 둘이에요: 박스 밖에 한 명, 안에 한 명. 패스가 박스 밖에 떨어지면 받은 선수로 플레이해요. 안에 떨어지면 컨트롤은 없어요: 원터치로 마무리해요. 그리고 동료를 보려면: 내 원 밖, 아무도 없는 잔디를 한 번 탭하세요. 시점이 측면으로 돌아가 동료를 보여 줘요. 한 번 더 탭하면 돌아와요.",
		"Un pase de práctica. Después, 1 gol en 3 pases al área.": "연습 패스 1번. 그다음, 박스 안 패스 3번에 1골.",
		"El primero no puntúa. En los otros, cuantos menos intentos gastes, más estrellas.": "첫 번째는 점수에 안 들어가요. 나머지는 시도를 적게 쓸수록 별이 많아요.",
		"Apunta a un compañero y suelta.": "동료를 조준하고 놓으세요.",
		"FUERA LO JUEGAS TU / DENTRO REMATA": "밖: 내가 플레이 / 안: 동료가 마무리",
		"SE ACABO EL REGATE": "드리블은 끝",
		"Ahora aprendes a TIRAR": "이제 슈팅을 배워요",
		"LO TIENES": "성공!",
		"NO SUPERASTE LA PRUEBA": "테스트 실패",
		"OTRA VEZ": "한 번 더",
		"Aquí no se avanza hasta que te sale. Tómate el tiempo que necesites.": "성공할 때까지 넘어가지 않아요. 필요한 만큼 시간을 가지세요.",
		"Eso es la escuela: cada ejercicio te enseña un gesto y te paga en estrellas. Quedan unos pocos, y sacan mejores ofertas de club.": "이게 바로 학교예요. 연습마다 동작 하나를 가르쳐 주고 별로 보상해요. 몇 개 안 남았고, 더 좋은 클럽 제안을 불러와요.",
		"PARA EN SECO Y APUNTA": "멈추고 조준",
		"BUSCA LA OTRA BANDA": "반대쪽 측면으로",
		"Todo se decide en tu círculo: con el dedo DENTRO apuntas y tiras, y en cuanto lo sacas conduces. Es el mismo arrastre sin levantar el dedo: mira la palabra del círculo, que dice TIRO o REGATE según dónde estés. Volver a entrar te para en seco y te devuelve la puntería. Jala hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltar, toca el balón — y dónde lo tocas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro. Con dos dedos giras la vista y apuntas desde otro ángulo.":
			"모든 건 내 원에서 결정돼요: 손가락이 원 안에 있으면 조준하고 슈팅하고, 밖으로 빼는 순간 드리블해요. 손가락을 떼지 않는 같은 드래그예요. 원에 적힌 단어를 보세요. 위치에 따라 슈팅 또는 드리블이라고 나와요. 다시 들어오면 그 자리에 멈추고 조준이 돌아와요. 새총처럼 뒤로 당기세요: 가이드는 앞을 가리켜요. 놓을 때 공을 터치하세요. 어디를 터치하느냐가 결정해요. 처음에는 공이 구역별로 칠해져 있어요: 위는 낮고 느리게, 아래는 떴다가 떨어지고, 양옆은 휘어져요. 가장자리로 갈수록 파워는 약해져요: 대포알 슈팅은 중앙에서 나와요. 두 손가락으로 시점을 돌려 다른 각도에서 조준하세요.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "이건 크로스예요: 공을 박스 안으로 띄워요. 코너킥은 처음부터 크로스로 시작해요. 오른쪽 위 표시가 알려 줘요. 크로스(띄우기)와 슈팅(낮게)을 바꾸려면 조준하면서 다른 손가락으로 탭하거나, 그 표시를 탭하세요. 골문이 아니라 동료의 머리를 노리세요. 마지막은 방향 전환: 같은 킥이지만 반대편의 빈 동료를 노려요.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve el cambio de banda.": "6번 시도에 1골을 넣으세요: 코너킥 3번, 크로스 3번. 그리고 방향 전환 패스도 해 보세요.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. El cambio de banda es ensayo y no puntúa.": "골은 6번 중 언제든 나올 수 있어요. 빠를수록 별이 많아요. 방향 전환은 연습이라 점수에 안 들어가요.",
		"METE DOS GOLES": "2골 넣기",
		"CRUZA Y ENCARA": "건너가서 1대1",
		"CUELGALA AL AREA": "박스로 크로스",
		"SALVA LA BARRERA": "수비벽 넘기기",
		"REGATEA HASTA EL MEDIO CAMPO": "하프라인까지 드리블",


		"Salir de atrás": "후방 빌드업",
		"Encerrado en tu banda": "측면에 갇힘",
		"Atrapado en el medio": "중원에서 고립",
		"Contra el bloque": "밀집 수비 상대",
		"Te salta el delantero": "공격수가 달려들어요",
		"Desde tu área": "내 박스에서",
		"ZONA {0} DE {1}": "구역 {0}/{1}",
		"Busca al compañero de la otra banda · dentro del círculo pasas":
			"반대쪽 동료를 찾으세요 · 원 안에서 패스",
		"El video salió con un tamaño raro": "영상 크기가 이상하게 나왔어요",
		"Tu gol más lejano del año: {0} m.": "올해 가장 먼 골: {0} m.",
		"Tu pase más largo del año: {0} m.": "올해 가장 긴 패스: {0} m.",
		"BUSCAR CLUB O JUGADOR": "클럽 또는 선수 검색",
		"Escribe al menos dos letras para buscar.": "검색하려면 두 글자 이상 입력하세요.",
		"Nada encaja con esa búsqueda.": "검색 결과가 없어요.",
		"{0} · {1} DE {2} — AFINA LA BUSQUEDA": "{0} · {2}개 중 {1}개 — 검색어를 좁히세요",
		"PAIS": "국가",
		"SI": "네",
		"PIDE ALIENTO": "응원 요청",
		"A LO TUYO": "집중",
		"RUGE {0} % · PITA {1} %": "함성 {0}% · 야유 {1}%",
		"LA GRADA RUGE": "관중 함성",
		"PIDES ALIENTO Y LA GRADA RUGE": "응원 요청, 관중이 열광해요",
		"PIDES ALIENTO Y LA GRADA TE PITA": "응원 요청, 관중의 야유",
		"¡{0}, {0}!": "{0}! {0}!",
		"¡{0}, TRAIDOR!": "{0}, 배신자!",
		"La entrada": "태클",
		"Toca cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "표시가 흰색을 지날 때 탭하세요: 슬라이딩으로 공을 깨끗하게 빼앗아요. 빨간색이면 파울, 노란색이면 경고를 받아요.",
		"Toca en el blanco para barrerte": "흰색에서 탭해서 슬라이딩",
		"¡BALÓN LIMPIO!": "깔끔한 태클!",
		"¡AMARILLA!": "경고!",
		"¡SE TE VA!": "놓쳤다!",
		"La barrera tapa el camino raso: elévalo por encima pegándole al balón abajo. El costado lo curva, si te atreves. Y el examen final: el penal. Respira. Tú eliges la esquina.": "수비벽이 낮은 길을 막고 있어요: 공 아래쪽을 차서 위로 넘기세요. 옆을 차면 휘어요, 자신 있다면. 그리고 마지막 시험: 페널티킥. 숨을 고르세요. 구석은 당신이 정해요.",
		"WASD CONDUCE / FLECHAS TIRAN": "WASD 드리블 / 방향키 슈팅",
		"Pulsa WASD y corres hacia el disco.": "WASD를 누르면 원으로 달려가요.",
		"Pulsa WASD y conduces.": "WASD를 누르면 드리블해요.",
		"Mantén una flecha y apuntas.": "방향키를 누르고 있으면 조준해요.",
		"Pulsa WASD y conduces: cruza la raya.": "WASD를 누르면 드리블해요: 선을 넘으세요.",
		"Pulsa WASD y avanza hacia el arco.": "WASD를 누르고 골문으로 전진하세요.",
		"Mantén una flecha y pásala a un compañero.": "방향키를 누른 채 동료에게 패스하세요.",
		"Mantén una flecha y suelta para pegarle a la falta.": "방향키를 누르고 있다가 놓으면 프리킥을 차요.",
		"Pulsa WASD para empezar": "WASD를 눌러 시작",
		"WASD para correr · cruza al campo rival": "WASD로 달리기 · 상대 진영으로 넘어가세요",
		"WASD para correr · lleva el balón a la zona roja": "WASD로 달리기 · 공을 빨간 구역으로",
		"Pulsa {0} en el blanco para barrerte": "흰색에서 {0} 버튼을 눌러 슬라이딩",
		"PULSA WASD PARA SALIR": "WASD로 빌드업",
		"Pulsa {0} cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "표시가 흰색을 지날 때 {0} 버튼을 누르세요: 슬라이딩으로 공을 깨끗하게 빼앗아요. 빨간색이면 파울, 노란색이면 경고를 받아요.",
		"VOLVIO, Y SE FUE POR LA PUERTA DE ATRAS": "돌아왔지만, 뒷문으로 떠났다",
		"LA VUELTA": "복귀",
		"Bota de Oro de Europa": "유럽 득점왕",
		"BOTA DE ORO DE EUROPA": "유럽 득점왕",
		"Máximo Asistente del Mundial": "세계 대회 도움왕",
		"Máximo Asistente de la Copa continental": "대륙컵 도움왕",
		"Asist. (Mundial)": "도움 (세계)",
		"Asist. (Continental)": "도움 (대륙)",
		"ASISTENTE DEL MUNDIAL": "세계 대회 플레이메이커",
		"Once Ideal de la Liga": "리그 시즌 베스트 11",
		"Once Ideal": "베스트 11",
		"Bota de Oro (Europa)": "득점왕 (유럽)",
		"Prometiste un gol, y lo metiste.": "골을 약속했고, 해냈어요.",
		"Prometiste un gol. Hoy no llegó.": "골을 약속했지만, 오늘은 터지지 않았어요.",
		"Cumpliste tu promesa de gol ante el {0}": "{0} 상대로 골 약속을 지켰어요",
		"Prometiste un gol ante el {0} y no llegó": "{0} 상대로 골을 약속했지만 끝내 터지지 않았어요",
		"{0} cumplió su promesa de gol ante el {1}": "{0} 선수, {1} 상대로 골 약속 지켜",
		"{0} prometió un gol ante el {1} y no llegó": "{0} 선수, {1} 상대로 골 약속 못 지켜",
		"DIBUJO DEL SHORT": "반바지 디자인",
		"Acento del short": "반바지 포인트",
		"DIBUJO DE LAS MEDIAS": "양말 디자인",
		"Acento de las medias": "양말 포인트",
		"Cuello polo": "폴로 칼라",
		"Fin de manga": "소매 끝단",
		"FILO": "파이핑",
		"DOBLE FILO": "더블 파이핑",
		"RIBETE": "밑단",
		"FILO Y RIBETE": "파이핑+밑단",
		"PANEL": "옆 패널",
		"ABERTURA": "트임 밑단",
		"VUELTA FINA": "얇은 상단",
		"DOBLE VUELTA": "이중 상단",
		"DOS RAYAS": "두 줄",
		"RAYA ALTA": "높은 줄",
		"BANDA ANCHA": "넓은 밴드",
		"AROS ANCHOS": "굵은 가로줄",
		"VUELTA DE COLOR": "컬러 상단",
		"FRANJA": "줄무늬",
		"DOS FRANJAS": "띠 두 개",
		"SHORT, MEDIAS Y CUELLO": "반바지, 양말, 칼라",
		"PICA CUANDO SE CIERRE": "닫힐 때 탭",
		"¡CAÑO!": "알까기!",
		"SE LO OLIÓ": "읽혔다",
		"YA ESTÁ EN SU HUECO": "이미 제자리에",
		"EN TU VITRINA": "내 진열장에",
		"TODAVÍA SE HABLA DEL CAÑO DE {0} A {1}": "{0}의 {1} 상대 알까기, 아직도 화제",
		"{1} YA NO SE LE ACERCA TANTO A {0} TRAS EL CAÑO": "알까기 이후 {1} 선수, {0} 선수에게 못 다가가",
		"LA GRADA PIDE OTRO CAÑO DE {0}": "관중은 {0}의 알까기를 또 원해",
		"{1} LE LEYÓ EL CAÑO A {0} Y NO SE LO PERDONA": "{1} 선수, {0}의 알까기 간파하고 두고두고 잊지 않아",
		"{0} QUISO EL CAÑO Y LA GRADA AÚN SILBA": "{0}의 알까기 시도, 관중은 아직도 휘파람",
		"PRESENTACIÓN DEL TÍTULO": "우승 기념식",
		"ANTE TU AFICIÓN": "홈 팬들 앞에서",
		"JUEGOS DE VERANO": "여름 대회",
		"Campeón de Verano": "여름 대회 우승",
		"Oro de Verano": "여름 대회 금메달",
		"Ganar el oro en los Juegos de Verano.": "여름 대회에서 금메달 획득.",
		"JUEGOS DE VERANO: oro para {0}": "여름 대회: {0}, 금메달",
		"{0}: ORO en los Juegos de Verano": "{0}: 여름 대회 금메달",
		"{0}: plata en los Juegos de Verano": "{0}: 여름 대회 은메달",
		"{0}: bronce en los Juegos de Verano": "{0}: 여름 대회 동메달",
		"El juego no trae nombres, escudos ni marcas reales. Importa sólo lo que tengas derecho a usar: es responsabilidad tuya.": "이 게임에는 실제 이름, 엠블럼, 브랜드가 없어요. 사용할 권리가 있는 것만 가져오세요: 책임은 본인에게 있어요.",
		"¡El recogepelotas hace tiempo!": "볼보이의 시간 끌기!",
		"¡BALÓN LARGO!": "롱볼!",
		"¡{0} TE LA CUELGA!": "{0}의 띄운 패스!",
		"¡CONTROLADA!": "컨트롤 성공!",
		"Primas por premios": "수상 보너스",
		"Prima de firma": "사이닝 보너스",
		"+${0} DE PRIMA": "+${0} 보너스",
		"SI EL CLUB CUMPLE": "클럽이 이행하면",
		"GUARDANDO EN TU ALBUM...": "앨범에 저장 중...",
		"EN TU ALBUM · %d/%d": "앨범 · %d/%d",
		"ALBUM LLENO %d/%d · BORRA UNO EN COLECCION": "앨범 가득 %d/%d · 컬렉션에서 삭제",
		"SIN ESPACIO EN EL TELEFONO": "휴대폰 저장 공간 부족",
		"NO SE PUDO GUARDAR · TOCA PARA REINTENTAR": "저장 실패 · 눌러서 재시도",
		"¡Se queda corto!": "짧았어요!",
		"Cosechas del huerto": "텃밭 수확",
		"PLANTILLAS DE COMUNIDAD": "커뮤니티 스쿼드",
		"Packs que hace la gente. Cada uno vive en la web de quien lo hizo.": "유저들이 만든 팩이에요. 각 팩은 만든 사람의 웹사이트에 있어요.",
		"BUSCAR PACK O CREADOR": "팩·제작자 검색",
		"BÁJALO": "다운로드",
		"en su web": "제작자 웹사이트에서",
		"TÓCALO": "탭",
		"en Descargas": "다운로드 폴더에서",
		"IMPORTA": "가져오기",
		"se abre en el juego": "게임에서 열려요",
		"CARGANDO": "로딩 중",
		"TODAVÍA NO HAY": "아직 없음",
		"Cuando alguien comparta un pack, sale aquí.": "누군가 팩을 공유하면 여기에 나와요.",
		"Conéctate a internet para ver la lista.": "인터넷에 연결하면 목록을 볼 수 있어요.",
		"REINTENTAR": "재시도",
		"¡ROMPISTE UNA CUERDA DE LA RED!": "골망 줄을 끊었어요!",
		"¡LAS DOS CUERDAS DE LA RED!": "골망 줄 두 개 다!",
		"¡El staff arregla la red!": "경기장 스태프가 골망을 고쳐요!",
	},







	"sim": {




		"simFINAL DEL PARTIDO": "경기 종료",
		"simDESCANSO": "하프타임",
		"simGOOOL": "골!!",
		"simGOLAZO": "원더골",
		"simGOLES": "골",
		"simGOL": "골",
		"simASISTENCIA": "도움",
		"simASISTE": "도움",
		"simATAJADÓN": "슈퍼 세이브",
		"simPARADA": "선방",
		"simPOSTE": "골대",
		"simTRAVESAÑO": "크로스바",
		"simCABECEA": "헤더",
		"simREMATA": "슈팅",
		"simREMATE": "슈팅",
		"simDISPARO": "슈팅",
		"simCÓRNER": "코너킥",
		"simPENAL": "PK",
		"simENTRA": "투입",
		"simCAMBIO": "교체",
		"simTIRO LIBRE": "프리킥",
		"simFUERA DE JUEGO": "오프사이드",
		"simAMARILLA": "경고",
		"simROJA": "퇴장",
		"simEXPULSADO": "퇴장",
		"simLESIÓN": "부상",
		"simLESIONADO": "부상",
		"simFALTA": "파울",
		"simPÉRDIDA": "볼 뺏김",
		"¡GOL DE {0}!": "{0}의 골!",
		"ASISTE {0}": "도움: {0}",
		"DESCANSO": "하프타임",
		"FINAL DEL PARTIDO": "경기 종료",
		"TOQUE EN EL MEDIO CAMPO": "중원에서 공을 돌려",
		"TU EQUIPO CONTROLA EL BALÓN": "우리 팀이 공을 지배",
		"EL RIVAL PRESIONA ARRIBA": "상대의 전방 압박",
		"FALTA EN MEDIA CANCHA": "중원에서 파울",
		"SAQUE DE BANDA": "스로인",
		"LA AFICIÓN ANIMA": "관중의 응원",
		"DUELO FÍSICO EN EL CENTRO": "중원에서 치열한 몸싸움",
		"EL ÁRBITRO DEJA SEGUIR": "주심, 경기 속행",
		"PASES EN CORTO, SIN PRISA": "짧은 패스, 서두르지 않아",
		"CÓRNER SIN REMATE CLARO": "코너킥, 슈팅으로 못 이어져",
		"FUERA DE JUEGO SEÑALADO": "오프사이드 선언",
		"BALÓN LARGO SIN DUEÑO": "주인 없는 롱볼",
		"TU DEFENSA CORTA EL AVANCE": "우리 수비가 전진 차단",
		"EL PORTERO ACHICA A TIEMPO": "골키퍼, 제때 각도 좁혀",
		"CAMBIO DE ORIENTACIÓN AL OTRO COSTADO": "반대쪽 측면으로 전환",
		"PRESIÓN TRAS PÉRDIDA EN CAMPO RIVAL": "상대 진영에서 역압박",
		"EL BALÓN NO QUIERE ENTRAR EN EL ÁREA": "박스 안으로 공이 안 들어가",
		"AMARILLA POR CORTAR EL CONTRA": "역습 저지로 경고",
		"LA GRADA PIDE MÁS RITMO": "관중석, 더 빠른 템포 요구",
		"SE JUEGA A UN SOLO ARCO": "한쪽으로 기운 일방적인 경기",
		"PARADO EL JUEGO POR UN GOLPE": "충돌로 경기 중단",
		"BUEN RELEVO EN LA BANDA": "측면에서 좋은 커버",
		"CENTRO PASADO, NO HABÍA NADIE": "길었던 크로스, 아무도 없어",
		"EL MEDIOCAMPO SE PARTE EN DOS": "중원이 둘로 갈라져",
		"CÓRNER BOTADO EN CORTO": "짧게 처리한 코너킥",
		"FALTA AL BORDE DEL ÁREA, SE ARMA LA BARRERA": "박스 앞 프리킥, 수비벽 세워",
		"EL ÁRBITRO MIDE LOS NUEVE METROS": "주심이 9미터 거리 측정",
		"SAQUE DE ESQUINA QUE DESPEJA EL PRIMER PALO": "코너킥, 니어 포스트에서 걷어내",
		"TIRO LIBRE LEJANO QUE SE VA A LA GRADA": "먼 거리 프리킥, 관중석으로",
		"SAQUE DE PUERTA LARGO, A DISPUTAR": "긴 골킥, 볼 경합",
		"SEGUNDA JUGADA DEL CÓRNER, RECHAZA LA ZAGA": "코너킥 세컨드 볼, 수비가 걷어내",
		"SAQUE DE BANDA LARGO AL ÁREA": "박스 안으로 롱 스로인",
		"ROBO EN TRES CUARTOS Y VUELTA A EMPEZAR": "높은 위치에서 탈취, 다시 처음부터",
		"DOS HOMBRES AL BALÓN, NO LO DEJAN SALIR": "두 명이 압박, 빠져나갈 곳 없어",
		"LA ZAGA SE JUNTA Y CIERRA EL PASILLO": "수비 라인이 좁혀 길을 막아",
		"DESPEJE LARGO PARA QUITARSE EL AGOBIO": "압박을 피해 길게 걷어내",
		"RUEDA EL BALÓN DE LADO A LADO": "좌우로 공을 돌려",
		"PAREDES EN EL CENTRO DEL CAMPO": "중원에서 2대1 패스",
		"CONTRA A CAMPO ABIERTO QUE SE QUEDA EN NADA": "오픈 찬스 역습, 무위로 끝나",
		"TODOS CORREN, NADIE PIENSA": "모두 뛰지만, 생각하는 선수는 없어",
		"EL RITMO BAJA Y EL PARTIDO SE ADORMECE": "템포가 떨어지고 경기가 졸려",
		"SE JUEGA CON EL FRENO DE MANO": "사이드 브레이크 걸린 경기",
		"PIDE EL CAMBIO UN JUGADOR TOCADO": "부상 선수가 교체 요청",
		"PROTESTAS AL LINIER DESDE EL BANQUILLO": "벤치에서 부심에게 항의",
		"APLAUDE LA GRADA UNA JUGADA DE OFICIO": "관중이 노련한 플레이에 박수",
		"EL BALÓN SE VA AL FONDO SIN DUEÑO": "아무도 쫓지 않은 공, 골라인 밖으로",
		"{0} REMATA FUERA POR POCO": "{0}의 슈팅, 살짝 빗나가",
		"¡{0} LA TUVO, GRAN PARADA!": "{0}의 결정적 찬스, 슈퍼 세이브!",
		"{0} CABECEA ALTO": "{0}의 헤더, 높이 떠",
		"DISPARO DE {0}, ¡ATAJADÓN!": "{0}의 슈팅, 슈퍼 세이브!",
		"{0} ESTRELLA EL POSTE": "{0}의 슈팅, 골대 강타",
		"{0} REMATA DESVIADO": "{0}의 슈팅, 빗나가",


		"{0} DISPARA Y LO TAPA UN DEFENSA": "{0}의 슈팅, 수비수가 막아내",
		"EL TIRO DE {0} TOCA EN UN DEFENSA Y SE VA A CÓRNER": "{0}의 슈팅, 수비 맞고 코너킥",
		"TU DEFENSA SE TIRA Y TAPA EL DISPARO DE {0}": "우리 수비수가 몸을 던져 {0}의 슈팅 차단",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA, CÓRNER": "{0}의 슈팅, 우리 수비 맞고 코너킥",
		"¡GOL DE {0}! TOCA EN UN DEFENSA Y SE CUELA": "{0}의 골! 수비 맞고 굴절돼 들어가",
		"¡{0} DISPARA, LA DESVÍA UN DEFENSA Y ADENTRO!": "{0}의 슈팅, 수비 맞고 굴절, 골!",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA Y ENTRA": "{0}의 슈팅, 우리 수비 맞고 굴절돼 골",
		"¡AUTOGOL DE {0}!": "{0}의 자책골!",
		"{0} LA METE EN SU PROPIA PUERTA": "{0}, 자기 골문에 넣어",


		"¡{0} SE ELEVA Y LA CLAVA DE CABEZA!": "{0}, 높이 솟아 헤더 골!",
		"¡CABEZAZO DE {0} AL FONDO DE LA RED!": "{0}의 헤더, 골망을 갈라!",
		"¡{0} GANA ARRIBA Y NO PERDONA!": "{0}, 공중볼 따내 놓치지 않아!",
		"¡{0} LA ENGANCHA DE VOLEA!": "{0}의 발리 슈팅!",
		"¡{0} LA PRENDE AL AIRE Y ADENTRO!": "{0}, 공중에서 때려 골!",
		"¡SIN DEJARLA CAER! GOL DE {0}": "떨어뜨리지 않고! {0}의 골",
		"¡DE CHILENA! ¡{0}, INCREÍBLE!": "바이시클 킥! {0}, 믿을 수 없어!",
		"¡CHILENA DE {0}! GOL PARA LA HISTORIA": "{0}의 바이시클 킥! 역사에 남을 골",
		"¡{0} DE CHILENA! ¡SE CAE EL ESTADIO!": "{0}의 바이시클 킥! 경기장이 터져!",
		"{0} CABECEA SOLO Y MARCA": "{0}, 노마크 헤더 골",
		"LA VOLEA DE {0} SE CUELA": "{0}의 발리, 골문 안으로",
		"{0} MARCA DE CHILENA. QUÉ CASTIGO": "{0}의 바이시클 킥 골. 무자비해",
		"¡{0} CABECEA Y LA SACA EL PORTERO!": "{0}의 헤더, 골키퍼가 막아내!",
		"LA VOLEA DE {0} SE VA POR ENCIMA": "{0}의 발리, 크로스바 위로",
		"{0} INTENTA LA CHILENA, ¡POR POCO!": "{0}의 바이시클 킥, 아깝다!",
		"CABEZAZO DE {0} AL POSTE": "{0}의 헤더, 골대 강타",
		"{0} LO PRUEBA DE VOLEA, DESVIADO": "{0}의 발리 시도, 빗나가",
		"TU EQUIPO REMATA FUERA": "우리 팀 슈팅, 빗나가",
		"¡CASI GOL DE TU EQUIPO!": "우리 팀, 골이나 다름없었어!",
		"GRAN PARADA DEL PORTERO": "골키퍼의 슈퍼 세이브",
		"DISPARO DEL RIVAL, ¡ATAJADÓN!": "상대의 슈팅, 슈퍼 세이브!",
		"EL RIVAL ESTRELLA EL POSTE": "상대 슈팅, 골대 강타",
		"EL RIVAL REMATA FUERA": "상대 슈팅, 빗나가",
		"CÓRNER PARA TU EQUIPO, LO CUELGA {0}": "우리 팀 코너킥, 키커 {0}",
		"FALTA PELIGROSA Y {0} SE PLANTA SOBRE EL BALÓN":
			"위험 지역 프리킥, 키커 {0}",
		"{0} SACA EL CÓRNER AL SEGUNDO PALO Y DESPEJA LA ZAGA":
			"{0}의 코너킥, 먼 쪽 골대로, 수비가 걷어내",
		"TIRO LIBRE DE {0}: LA BARRERA LA MANDA AL CÓRNER":
			"{0}의 프리킥, 수비벽 맞고 코너킥",
		"{0} LA COLGÓ AL ÁREA Y EL PORTERO LA ATRAPÓ EN EL AIRE":
			"{0}의 크로스, 골키퍼가 공중에서 잡아",
		"SAQUE DE BANDA LARGO DE {0} BUSCANDO EL SEGUNDO PALO":
			"{0}의 롱 스로인, 먼 쪽 골대 노려",
		"FALTA LATERAL: {0} PONE EL CENTRO Y SE ARMA EL LÍO":
			"측면 프리킥: {0}의 크로스, 문전 혼전",
		"CÓRNER EN CORTO ENTRE {0} Y SU COMPAÑERO":
			"{0}, 동료와 짧은 코너킥",
		"{0} ENSAYA UNA FALTA LEJANA Y SE VA ALTA":
			"{0}의 먼 거리 프리킥, 높이 떠",
		"OTRO CÓRNER: {0} VUELVE A COLGARLA AL ÁREA": "또 코너킥: {0}, 다시 박스로 크로스",
		"CÓRNER PARA EL RIVAL, LO SACA {0}": "상대 코너킥, 키커 {0}",
		"FALTA AL BORDE DEL ÁREA, LA PONE {0}": "박스 앞 프리킥, 키커 {0}",
		"{0} CUELGA EL CÓRNER Y TU DEFENSA DESPEJA DE CABEZA":
			"{0}의 코너킥, 우리 수비가 헤더로 걷어내",
		"TIRO LIBRE DE {0} QUE SE ESTRELLA EN LA BARRERA":
			"{0}의 프리킥, 수비벽에 막혀",
		"{0} LA MANDA AL ÁREA Y TU PORTERO SALE A PUÑOS":
			"{0}의 크로스, 우리 골키퍼가 펀칭",
		"SAQUE DE BANDA LARGO DE {0}, SIN CONSECUENCIAS":
			"{0}의 롱 스로인, 무위로 끝나",
		"FALTA EN TRES CUARTOS: {0} ESPERA A QUE SUBAN LOS CENTRALES":
			"상대 진영 프리킥: {0}, 센터백 올라오길 기다려",
		"{0} BOTA EL CÓRNER EN CORTO Y TU EQUIPO ACHICA":
			"{0}의 짧은 코너킥, 우리 팀 라인 올려",
		"FALTA LEJANA DE {0} POR ENCIMA DEL TRAVESAÑO":
			"{0}의 먼 거리 프리킥, 크로스바 위로",
		"OTRO CÓRNER RIVAL: {0} LO CUELGA AL PRIMER PALO":
			"또 상대 코너킥: {0}, 니어 포스트로",
		"CÓRNER PARA TU EQUIPO, DESPEJA LA ZAGA": "우리 팀 코너킥, 수비가 걷어내",
		"FALTA PELIGROSA A FAVOR, SE ARMA LA BARRERA":
			"위험 지역 프리킥 획득, 수비벽 세워",
		"TIRO LIBRE DE TU EQUIPO QUE SE VA ALTO": "우리 팀 프리킥, 높이 떠",
		"CÓRNER PARA EL RIVAL, DESPEJA TU DEFENSA":
			"상대 코너킥, 우리 수비가 걷어내",
		"FALTA PELIGROSA EN CONTRA, TU EQUIPO ARMA LA BARRERA":
			"위험 지역 프리킥 허용, 우리 팀 수비벽 세워",
		"TIRO LIBRE DEL RIVAL A LAS MANOS DEL PORTERO":
			"상대 프리킥, 골키퍼 정면",

		"AMARILLA PARA {0} POR UNA ENTRADA TARDÍA": "{0}, 늦은 태클로 경고",
		"EL ÁRBITRO AMONESTA A {0} POR PROTESTAR": "주심, {0}에게 항의로 경고",
		"AMARILLA A {0} POR FRENAR EL CONTRA CON FALTA":
			"{0}, 역습 끊는 파울로 경고",
		"AMARILLA PARA {0} POR UNA FALTA DURA": "{0}, 거친 파울로 경고",
		"{0} VE LA AMARILLA POR PERDER TIEMPO": "{0}, 시간 끌기로 경고",
		"AMARILLA A {0} POR DERRIBAR AL EXTREMO": "{0}, 윙어 넘어뜨려 경고",
		"AMARILLA PARA TU EQUIPO": "우리 팀 경고",
		"AMARILLA PARA EL RIVAL": "상대 경고",
		"AMARILLA PARA {0}": "{0} 경고",
		"SEGUNDA AMARILLA PARA {0}": "{0} 두 번째 경고",
		"¡ROJA! {0} SE VA EXPULSADO": "퇴장! {0} 레드카드",
		"EL ÁRBITRO PERDONA A {0}": "주심, {0}에게 관대한 판정",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA A TU EQUIPO CON DIEZ":
			"경고 누적 퇴장! {0}, 우리 팀 10명",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA AL RIVAL CON DIEZ":
			"경고 누적 퇴장! {0}, 상대 10명",
		"¡ROJA DIRECTA A {0}! TU EQUIPO SE QUEDA CON DIEZ":
			"{0} 다이렉트 퇴장! 우리 팀 10명",
		"¡ROJA DIRECTA A {0}! EL RIVAL SE QUEDA CON DIEZ":
			"{0} 다이렉트 퇴장! 상대 10명",
		"ROJA DIRECTA POR EL BALONAZO AL ÁRBITRO":
			"주심에게 공을 차 다이렉트 퇴장",
		"{0} SE MARCHA LESIONADO, NO PUEDE SEGUIR":
			"{0}, 부상으로 더 못 뛰고 교체",
		"LESIÓN EN EL RIVAL: {0} DEJA LA CANCHA": "상대 부상: {0}, 그라운드 떠나",
		"PARÓN POR LESIÓN, ENTRA LA CAMILLA": "부상으로 경기 중단, 들것 투입",
		"BLOQUE BAJO Y SIN PRISA: EL PARTIDO SE JUEGA AL RALENTÍ":
			"내려앉은 블록, 서두르지 않아: 슬로모션 같은 경기",
		"TU EQUIPO CEDE EL BALÓN Y ESPERA AGAZAPADO":
			"우리 팀, 공을 내주고 웅크린 채 기다려",
		"ONCE HOMBRES POR DETRÁS DE LA PELOTA, SIN GASTAR UNA GOTA":
			"11명 모두 공 뒤에, 체력은 한 방울도 안 써",
		"SE JUEGA A LO QUE QUIERE {0}, PERO NO ENTRA NADIE":
			"{0}의 뜻대로 흘러가지만, 아무도 못 뚫어",
		"CADA DESPEJE ES UN SEGUNDO MÁS QUE SE VA DEL RELOJ":
			"걷어낼 때마다 시계가 1초씩 흘러",
		"EL BANQUILLO PIDE CALMA: NI UN PASO ADELANTE":
			"벤치는 침착하라고 주문: 한 발짝도 전진 금지",
		"MURO Y PACIENCIA, EL PLAN ES QUE NO PASE NADA":
			"벽과 인내, 아무 일도 없게 하는 게 계획",
		"TU EQUIPO ADMINISTRA PIERNAS Y METROS ATRÁS":
			"우리 팀, 후방에서 체력과 거리 아껴",
		"REPLIEGUE ORDENADO, SIN SALIR A LA PRESIÓN":
			"질서 있는 후퇴, 압박하러 나가지 않아",
		"{0} TOCA Y TOCA CONTRA UN MURO QUE NO SE MUEVE":
			"{0}, 패스를 돌리지만 꿈쩍 않는 벽",
		"BLOQUE BAJO Y SALIDA RÁPIDA: TU EQUIPO ESPERA SU MOMENTO":
			"내려앉은 블록과 빠른 역습: 우리 팀, 때를 기다려",
		"REPLIEGUE Y CONTRA, ASÍ SE PLANTEÓ ESTE PARTIDO":
			"내려앉아 역습, 이 경기의 계획",
		"TU EQUIPO CEDE EL CENTRO DEL CAMPO Y CIERRA EL ÁREA":
			"우리 팀, 중원을 내주고 박스를 잠가",
		"LÍNEAS JUNTAS, SIN UN HUECO ENTRE ELLAS": "촘촘한 라인, 틈 하나 없어",
		"SE DEFIENDE CON ORDEN Y SE SALE CON CRITERIO":
			"질서 있게 막고, 영리하게 나가",
		"{0} TIENE EL BALÓN; TU EQUIPO TIENE EL PLAN": "공은 {0}에게, 계획은 우리 팀에게",
		"CADA ROBO SE CONVIERTE EN UN BALÓN LARGO": "공을 뺏을 때마다 롱볼로",
		"LA ZAGA MANDA: NADA PASA POR EL MEDIO":
			"수비 라인이 지배: 중앙으로는 아무것도 못 지나가",
		"TU EQUIPO JUEGA AL ERROR DEL RIVAL": "우리 팀, 상대 실수를 노려",
		"DEFENSA EN BLOQUE, SIN REGALAR LA ESPALDA":
			"블록 수비, 뒷공간을 내주지 않아",
		"REPLIEGUE FEROZ: SE DEFIENDE COMO SI FUERA EL ÚLTIMO MINUTO":
			"맹렬한 후퇴: 마지막 1분처럼 수비해",
		"BLOQUE BAJO PERO A MIL POR HORA, NO SE RESPIRA NI ATRÁS":
			"내려앉았지만 전속력, 뒤에서도 숨 돌릴 틈 없어",
		"TU EQUIPO SE PARTE EL ALMA EN CADA DESPEJE":
			"우리 팀, 걷어낼 때마다 혼신의 힘",
		"SE DEFIENDE Y SE SALE AL CONTRAGOLPE COMO UN LATIGAZO":
			"막고 나서 채찍처럼 역습",
		"TRABAJO SUCIO A TODA VELOCIDAD: DOS HOMBRES A CADA BALÓN":
			"전속력의 궂은일: 공마다 두 명씩",
		"CIERRAN ATRÁS Y ARRANCAN AL ESPACIO EN CUANTO ROBAN":
			"뒤를 잠그고, 뺏는 순간 공간으로 질주",
		"ENTREGA TOTAL EN EL REPLIEGUE, Y ESTO SE PAGA EN PIERNAS":
			"후퇴에 전부를 걸어, 대가는 다리로 치러",
		"{0} SE ESTRELLA CONTRA UNA MURALLA QUE ADEMÁS CORRE":
			"{0}, 달리기까지 하는 성벽에 막혀",
		"NI UN METRO GRATIS: PERSIGUEN AL RIVAL HASTA EL CÓRNER":
			"공짜 거리는 없다: 코너 깃발까지 쫓아가",
		"DEFENDER ASÍ QUEMA, PERO EL ARCO SIGUE EN PIE":
			"이렇게 막으면 지치지만, 골문은 여전히 건재",
		"PARTIDO DE TRÁMITE: TU EQUIPO NO ARRIESGA NI UN PASE":
			"형식적인 경기: 우리 팀, 패스 하나도 모험 안 해",
		"RITMO BAJO Y POSICIONES FIJAS, NADIE SE DESCUELGA":
			"낮은 템포, 고정된 위치, 아무도 이탈 안 해",
		"SE TOCA EN HORIZONTAL, SIN ROMPER LÍNEAS": "옆으로만 패스, 라인을 깨지 않아",
		"EL PARTIDO SE DUERME Y A TU EQUIPO NO LE MOLESTA":
			"경기가 잠들어가고, 우리 팀은 개의치 않아",
		"PLAN SOBRIO: NI ATRÁS NI ARRIBA, DEJAR CORRER EL RELOJ":
			"담백한 계획: 물러서지도 나서지도 않고 시간 흘려보내기",
		"TU EQUIPO DOSIFICA, GUARDANDO PIERNAS PARA EL FINAL":
			"우리 팀, 체력 안배하며 막판을 위해 아껴",
		"PASES DE SEGURIDAD Y MIRADAS AL BANQUILLO": "안전한 패스, 그리고 벤치 쪽 눈치",
		"SIN PRESIÓN Y SIN PRISA, EL PARTIDO ESTÁ EN PAUSA":
			"압박도 서두름도 없이, 경기는 일시 정지",
		"EQUILIBRIO Y CALMA, NADIE QUIERE ROMPER LA MESA":
			"균형과 침착, 아무도 판을 깨고 싶지 않아",
		"SE JUEGA A MEDIO GAS, ESPERANDO UNA GRIETA":
			"절반의 힘으로, 틈이 생기길 기다려",
		"PARTIDO PAREJO: TU EQUIPO SOSTIENE EL EQUILIBRIO":
			"팽팽한 경기: 우리 팀이 균형 유지",
		"NI REPLIEGUE NI LOCURA, EL PLAN ES EL ORDEN":
			"후퇴도 광기도 아닌, 질서가 계획",
		"SE JUEGA DE IGUAL A IGUAL EN EL MEDIO CAMPO": "중원에서 대등한 싸움",
		"TU EQUIPO ALTERNA TOQUE Y VERTICALIDAD": "우리 팀, 짧은 패스와 직선 공격을 섞어",
		"BLOQUE MEDIO Y PRESIÓN SÓLO CUANDO TOCA": "중간 블록, 압박은 필요할 때만",
		"PLAN CLÁSICO: SUJETAR ATRÁS, PROBAR ARRIBA":
			"고전적인 계획: 뒤는 지키고, 앞은 두드려",
		"EL PARTIDO SE JUEGA DONDE TU EQUIPO QUIERE, EN EL MEDIO":
			"경기는 우리 팀이 원하는 곳, 중원에서",
		"SIN DESAJUSTES, CADA UNO EN SU SITIO": "빈틈없이, 모두 제자리에",
		"SE ESPERA EL MOMENTO SIN REGALAR NADA":
			"아무것도 내주지 않고 때를 기다려",
		"{0} NO ENCUENTRA GRIETAS EN UN EQUIPO BIEN PLANTADO":
			"{0}, 잘 정비된 상대에서 틈을 못 찾아",
		"MISMO PLAN, OTRO PULSO: TU EQUIPO CORRE EL DOBLE":
			"같은 계획, 다른 맥박: 우리 팀이 두 배로 뛰어",
		"IDA Y VUELTA A TODO TREN, ESTO ES UN PARTIDO ROTO":
			"전속력으로 오가는, 활짝 열린 경기",
		"PRESIÓN EN CUANTO SE PIERDE, ORDEN EN CUANTO SE TIENE":
			"잃는 순간 압박, 얻는 순간 정렬",
		"RITMO ALTO SIN PERDER LA FORMA": "형태를 잃지 않는 빠른 템포",
		"SE DISPUTA CADA SEGUNDA PELOTA COMO SI FUERA LA ÚLTIMA":
			"세컨드 볼 하나하나를 마지막처럼 다퉈",
		"TU EQUIPO ACELERA CADA VEZ QUE PISA CAMPO CONTRARIO":
			"우리 팀, 상대 진영에 들어설 때마다 가속",
		"EL PARTIDO VUELA DE ÁREA A ÁREA": "박스에서 박스로 날아다니는 경기",
		"INTENSIDAD ARRIBA: {0} NO ENCUENTRA UN SEGUNDO DE PAZ":
			"강도 상승: {0}, 1초도 쉴 틈 없어",
		"EQUILIBRIO CON EL ACELERADOR PISADO": "가속 페달을 밟은 채 균형 유지",
		"SE CORRE MUCHO Y SE PIENSA RÁPIDO": "많이 뛰고 빠르게 생각해",
		"TODOS ARRIBA, PERO SIN QUEMARSE: SE BUSCA CON CABEZA":
			"모두 전진, 하지만 지치지 않게: 머리로 풀어가",
		"ATAQUE PACIENTE: SE RODEA EL ÁREA ESPERANDO EL HUECO":
			"인내하는 공격: 박스 주변을 돌며 틈을 기다려",
		"TU EQUIPO ADELANTA LÍNEAS Y ADMINISTRA EL ESFUERZO":
			"우리 팀, 라인을 올리고 체력 안배",
		"MUCHA GENTE ARRIBA Y NINGUNA PRISA POR LLEGAR":
			"앞에 사람은 많고, 서두름은 없어",
		"SE ATACA AL PASO, CON EL BALÓN COMO ÚNICO ARGUMENTO":
			"걷는 속도의 공격, 공이 유일한 무기",
		"PROPUESTA OFENSIVA SIN DESGASTE: TOQUE Y ESPERA":
			"체력 소모 없는 공격 계획: 패스하고 기다려",
		"LOS LATERALES SUBEN, PERO NADIE CORRE DE MÁS":
			"풀백은 올라가지만, 무리하는 선수는 없어",
		"TU EQUIPO ACAMPA EN CAMPO DE {0} SIN APRETAR EL PASO":
			"우리 팀, {0} 진영에 자리 잡고 천천히",
		"AMBICIÓN CON LAS PIERNAS GUARDADAS PARA EL FINAL":
			"막판을 위해 다리를 아낀 야망",
		"SE INSISTE ARRIBA, AUNQUE SIN PRESIÓN TRAS PÉRDIDA":
			"계속 두드리지만, 역압박은 없어",
		"PLANTEAMIENTO OFENSIVO: TODOS ARRIBA SOBRE {0}":
			"공격적인 전술: 모두 {0} 쪽으로 전진",
		"TU EQUIPO ADELANTA LA LÍNEA Y BUSCA EL ÁREA RIVAL":
			"우리 팀, 라인 올려 상대 박스 노려",
		"LOS LATERALES VIVEN EN CAMPO CONTRARIO":
			"풀백이 상대 진영에서 살아",
		"SE ATACA CON GENTE: CINCO HOMBRES POR DELANTE DEL BALÓN":
			"숫자로 공격: 공 앞에 다섯 명",
		"TU EQUIPO EMPUJA Y EL RIVAL ACUMULA GENTE ATRÁS":
			"우리 팀이 밀어붙이고, 상대는 뒤에 사람을 쌓아",
		"CENTRO TRAS CENTRO, EL PLAN ES AHOGAR EL ÁREA":
			"크로스, 또 크로스, 박스를 질식시키는 계획",
		"PROPUESTA VALIENTE, AUNQUE DEJE ESPACIOS A LA ESPALDA":
			"용감한 전술, 뒷공간이 생기더라도",
		"TU EQUIPO JUEGA EN CAMPO DE {0} Y NO PIENSA SALIR":
			"우리 팀, {0} 진영에서 나올 생각 없어",
		"SE ARRIESGA EN CADA SALIDA BUSCANDO AL DELANTERO":
			"빌드업마다 공격수에게 모험 패스",
		"EL BLOQUE ESTÁ ALTO Y LA ZAGA, MUY SOLA":
			"블록은 높고, 수비 라인은 외로워",
		"ASEDIO TOTAL: TODOS ARRIBA Y A MÁXIMO PULSO": "총공세: 모두 전진, 최고 강도로",
		"PRESIÓN ASFIXIANTE SOBRE {0}, NO LES DEJAN NI SACAR":
			"{0}에게 숨 막히는 압박, 빌드업조차 못 해",
		"TU EQUIPO SE VOLCÓ Y NO HAY QUIEN LO FRENE":
			"우리 팀이 총공세, 아무도 못 막아",
		"OLA TRAS OLA SOBRE EL ÁREA RIVAL": "상대 박스에 파도처럼 몰아쳐",
		"ROBO ARRIBA Y REMATE: ESTO ES UNA TORMENTA": "높은 곳에서 뺏고 슈팅: 이건 폭풍이야",
		"EL RIVAL NO PASA DE MEDIO CAMPO, Y ESO SE PAGA EN PIERNAS":
			"상대는 하프라인도 못 넘고, 대가는 다리로",
		"TODO EL EQUIPO METIDO EN VEINTE METROS DE CAMPO CONTRARIO":
			"팀 전체가 상대 진영 20미터 안에",
		"RITMO ALTÍSIMO, NO DEJAN RESPIRAR A {0}": "엄청난 템포, {0}에게 숨 쉴 틈도 안 줘",
		"UN SOLO EQUIPO EN EL CAMPO, Y ES EL TUYO": "그라운드엔 한 팀뿐, 바로 우리 팀",
		"ATAQUE SIN RED: ATRÁS SÓLO QUEDAN DOS":
			"안전망 없는 공격: 뒤에는 두 명뿐",
		"CON EL {0} ABAJO, TU EQUIPO VA AL FRENTE": "{0} 열세, 우리 팀 전진",
		"ARRANCA EL PARTIDO, PRIMEROS TANTEOS ANTE {0}": "킥오프, {0} 상대로 탐색전",
		"CON EL {0} ABAJO, TU EQUIPO SE VUELCA AL FRENTE":
			"{0} 열세, 우리 팀 총공세",
		"FRÍOS: A TU EQUIPO NO LE SALE NADA": "차가운 발끝: 우리 팀, 뭘 해도 안 풀려",
		"PIERNAS PESADAS: {0} ACUSA EL CANSANCIO": "무거운 다리: {0}, 지친 기색",
		"{0} SE COLOCA EL BALÓN EN EL PUNTO": "{0}, 페널티 스폿에 공을 놓아",
		"LA PENA MÁXIMA LA COBRA {0}": "페널티킥 키커는 {0}",
		"SE PREPARA {0} SOBRE LA FALTA": "{0}, 프리킥 준비",
		"SE HACE CARGO {0} DE LA FALTA": "{0}, 프리킥 키커로 나서",
		"SACA EL CÓRNER {0}": "코너킥 키커 {0}",
		"SAQUE DE ESQUINA, LLEGA EL CENTRO": "코너킥, 크로스가 올라와",
		"{0} MINUTOS AÑADIDOS": "추가 시간 {0}분",
		"ESTO SE VA A LA PRÓRROGA": "연장전으로 간다",
		"{0} LLEGA TARDE A TODO, SIN PIERNAS": "{0}, 한 발씩 늦어, 다리가 풀렸어",
		"{0} PIDE EL CAMBIO CON LA MIRADA": "{0}, 눈빛으로 교체 요청",
		"SE LE ACABA LA GASOLINA A {0}": "{0}, 연료가 바닥나",
		"{0} ANDA ENCHUFADÍSIMO HOY": "{0}, 오늘 제대로 불붙었어",
		"NO PARA DE CORRER, {0}": "{0}, 쉬지 않고 뛰어",
		"{0} ESTÁ ADMINISTRANDO FUERZAS": "{0}, 체력 안배 중",
		"{0} ANDA MUY FLOJO, LE FALTA CHISPA": "{0}, 무기력해, 번뜩임이 없어",
		"{0} DEBERÍA PISAR MÁS EL ÁREA": "{0}, 박스 안에 더 들어가야 해",
		"A {0} LE FALTA AYUDAR ATRÁS": "{0}, 수비 가담이 부족해",
		"ASÍ NO LE LLEGA UN BALÓN A {0}": "이대로면 {0}에게 공이 안 가",
		"{0} SE ESTÁ ADUEÑANDO DEL PARTIDO": "{0}, 경기를 장악해 가",
		"PARTIDAZO DE {0}": "{0}의 엄청난 경기력",
		"SE LE ESTÁ ATRAGANTANDO EL PARTIDO A {0}": "{0}, 경기가 안 풀려",
		"{0} NO APARECE": "{0}, 존재감 제로",
		"{0} LLEVA LA MANIJA DEL EQUIPO": "{0}, 팀의 키를 쥐고 있어",
		"{0} SE QUEDA SOLO ARRIBA, NADIE SUBE": "{0}, 최전방에 고립, 아무도 안 올라와",
		"TODO PASA POR {0}": "모든 공이 {0}에게로",
		"{0} NO PARA DE APAGAR FUEGOS ATRÁS": "{0}, 뒤에서 쉴 새 없이 불 끄는 중",
		"{0} SE PASA EL PARTIDO CORRIENDO DETRÁS DEL BALÓN": "{0}, 경기 내내 공만 쫓아다녀",
		"{0} MANEJA LOS TIEMPOS DESDE EL MEDIO": "{0}, 중원에서 템포 조율",
		"TARDE TRANQUILA PARA {0} EN LA ZAGA": "{0}, 수비에서 한가한 오후",
		"LA GRADA CANTA TU NOMBRE, {0}": "관중이 이름을 연호해, {0}",
		"{0} BAJA A ORDENAR EL JUEGO": "{0}, 내려와서 경기 조율",
		"{0} CALIENTA EN LA BANDA, PIDE ENTRAR":
			"{0}, 터치라인에서 몸 풀며 투입 요청",

		"{0} MIRA EL PARTIDO DESDE EL BANQUILLO, CABIZBAJO":
			"{0}, 고개 숙인 채 벤치에서 지켜봐",
		"{0} SE SIENTA FUNDIDO, EL BANQUILLO LE DA HIELO":
			"{0}, 녹초가 돼 앉아, 벤치가 얼음 건네",
		"UNA PALMADA PARA {0} AL LLEGAR AL BANQUILLO":
			"벤치로 돌아온 {0}에게 격려의 손길",
		"NADIE DEL BANQUILLO MIRA A {0}": "벤치의 누구도 {0} 쪽을 안 봐",
		"EN EL BANQUILLO SE COMENTA LA SALIDA DE {0}":
			"벤치에서 {0}의 교체가 화제",
		"{0} SIGUE EL PARTIDO DESDE EL BANQUILLO": "{0}, 벤치에서 경기 지켜봐",
		"EQUIPO ENCENDIDO, HUELE A GOL ANTE {0}":
			"불붙은 우리 팀, {0} 상대로 골 냄새",
		"DUELO PAREJO, NADIE QUIERE EL ERROR": "팽팽한 승부, 아무도 실수하기 싫어",
		"TU EQUIPO MANEJA EL {0}": "우리 팀, {0} 스코어 관리",
		"TU EQUIPO MANEJA EL {0} SIN PRISA": "우리 팀, 여유 있게 {0} 스코어 관리",
		"SE ACERCA EL DESCANSO CON EL {0}": "{0} 스코어로 하프타임 임박",
		"RECTA FINAL, URGE EL EMPATE: TODOS ARRIBA":
			"막판, 동점골이 급해: 모두 전진",
		"RECTA FINAL Y EL {0} SIGUE ABIERTO": "막판, {0} 스코어로 승부는 아직 몰라",
		"RECTA FINAL: TU EQUIPO AGUANTA EL {0} CON EL ALMA":
			"막판: 우리 팀, 혼신을 다해 {0} 스코어 지켜",
	},

	"notifications": {
		"ESA CAMISETA TIENE DUEÑO": "그 등번호는 주인이 있어요",
		"El número que quieres cuelga dos perchas más allá, con el nombre de {0} encima. Cambiarlo se hace más de lo que parece.":
			"원하는 등번호는 두 칸 옆 옷걸이에 걸려 있어요. 위에는 {0}의 이름이 적혀 있죠. 바꾸는 건 생각보다 쉽지 않아요.",
		"COMPRÁRSELO": "돈 주고 사기",
		"PEDIRLO AL CLUB": "클럽에 요청",
		"DEJARLO ESTAR": "그냥 두기",
		"UN OJEADOR EN LA GRADA": "관중석의 스카우트",
		"Un club grande mandó ojeador a verte y la prensa local se enteró. Todos quieren saber si sueñas con irte.":
			"빅클럽이 당신을 보러 스카우트를 보냈고, 지역 언론이 그걸 알아챘어요. 모두가 당신이 떠나길 꿈꾸는지 궁금해해요.",
		"HABLAR DEL SUEÑO": "꿈을 인정",
		"QUITARLE HIERRO": "별일 아니라고",
		"EL SEGUNDO TRABAJO": "두 번째 직업",
		"Un compañero reparte paquetes por las mañanas para llegar a fin de mes. Esta semana no puede y te pide cubrirle una tarde.":
			"한 동료가 생활비를 벌려고 아침마다 택배를 날라요. 이번 주엔 못 한다며 오후 한 번만 대신해 달라고 부탁해요.",
		"ECHARLE LA TARDE": "대신 일하기",
		"NO PUEDO": "못 해요",
		"ESTE CAMPO ES UN PATATAL": "이 그라운드는 엉망이에요",
		"El césped es un parche de tierra y bote falso. Un periodista te pregunta, sonriendo, qué te parece tu nuevo estadio.":
			"잔디는 흙투성이에 공이 엉뚱하게 튀어요. 한 기자가 웃으며 새 경기장이 어떠냐고 물어요.",
		"DECIR LA VERDAD": "솔직하게 말하기",
		"'AQUÍ SE JUEGA IGUAL'": "'여기도 똑같아요'",
		"CÁMARAS EN EL VESTUARIO": "라커룸 카메라",
		"Una plataforma quiere rodar tu documental: un mes de cámaras siguiéndote hasta dentro del vestuario. Pagan bien. El grupo no sonríe.":
			"한 스트리밍 플랫폼이 당신의 다큐멘터리를 찍고 싶어 해요: 한 달 동안 카메라가 라커룸 안까지 따라다녀요. 보수는 좋아요. 동료들은 웃지 않아요.",
		"FIRMAR EL RODAJE": "촬영 계약",
		"PROTEGER EL GRUPO": "동료들 지키기",
		"TU CIFRA EN PORTADA": "1면에 실린 내 몸값",
		"Un diario publica lo que pides por renovar, con cifra y todo. Es casi exacta. Confirmarla presiona al club; negarla te protege.":
			"한 신문이 당신이 재계약 조건으로 원하는 금액을 그대로 실었어요. 거의 정확해요. 인정하면 클럽을 압박하고, 부인하면 당신을 지켜요.",
		"CONFIRMARLA": "인정하기",
		"NEGARLO TODO": "전부 부인",
		"EL PENALTI QUE NO TIRASTE": "차지 못한 페널티킥",
		"El designado falló el penalti que costó el partido. Tú eras el segundo de la lista y la prensa lo sabe.":
			"전담 키커가 실축한 페널티킥 때문에 경기를 졌어요. 당신은 명단 두 번째였고, 언론도 그걸 알아요.",
		"RESPALDARLO": "감싸 주기",
		"'YO LO PEDÍ'": "'내가 나섰어요'",
		"TUS NÚMEROS EN LA PIZARRA": "보드 위의 내 기록",
		"Un analista joven te espera con tu mala racha desmenuzada en la pizarra: mapas, flechas y todo lo que no estás haciendo.":
			"젊은 분석관이 당신의 부진을 보드 위에 낱낱이 펼쳐 놓고 기다려요: 지도, 화살표, 그리고 당신이 못 하고 있는 모든 것.",
		"TRAGARTE EL ORGULLO": "자존심 굽히기",
		"MANDARLO A PASEO": "쫓아내기",
		"El siguiente partido te da la razón.": "다음 경기가 당신이 옳았음을 증명해요.",
		"La racha sigue y el míster no olvida.": "부진은 계속되고, 감독은 잊지 않아요.",
		"LA CÁMARA TE ENFOCÓ": "카메라에 잡혔어요",
		"Otro partido desde el banco, y la cámara te pilló con cara larga. En redes debaten si eres mal compañero.":
			"또 벤치에서 본 경기, 카메라에 시무룩한 얼굴이 잡혔어요. SNS에선 당신이 나쁜 동료인지 논쟁 중이에요.",
		"'APOYO AL EQUIPO'": "'팀을 응원해요'",
		"NO ACLARAR NADA": "해명 안 하기",
		"EL DISCURSO DEL NUEVO": "신입의 연설",
		"Primer día con el grupo entero sentado y el míster te cede la palabra. Cuarenta segundos y todo el vestuario midiéndote.":
			"첫날, 선수단이 모두 앉아 있고 감독이 당신에게 발언권을 넘겨요. 40초, 라커룸 전체가 당신을 저울질해요.",
		"PROMETER TÍTULOS": "우승 약속",
		"VENGO A APRENDER": "배우러 왔어요",
		"SÓLO SALUDAR Y SENTARTE": "인사만 하고 앉기",
		"DÓNDE VAS A VIVIR": "어디서 살까",
		"El club te pasa tres opciones: el ático del centro que sale en las revistas, una casa pegada a la ciudad deportiva, o seguir en el hotel y no gastar.":
			"클럽이 세 가지 선택지를 줘요: 잡지에 나오는 도심 펜트하우스, 훈련장 바로 옆 집, 아니면 돈 안 쓰고 호텔에 계속 머물기.",
		"EL ÁTICO DEL CENTRO": "도심 펜트하우스",
		"PEGADO AL ENTRENAMIENTO": "훈련장 바로 옆",
		"SEGUIR EN EL HOTEL": "호텔에 머물기",
		"EL PLANTE POR LOS MINUTOS": "출전 시간 최후통첩",
		"Otra jornada mirando desde el banco. Tu agente ya tiene el titular escrito y un periodista esperando; el míster te ha citado a solas antes de que salga.":
			"또 벤치에서 지켜본 라운드. 에이전트는 이미 헤드라인을 써 놓고 기자를 대기시켰어요. 기사가 나가기 전에 감독이 당신을 따로 불렀어요.",
		"EXIGIRLO EN PÚBLICO": "공개적으로 요구",
		"TRAGAR Y CALLARTE": "꾹 참고 침묵",
		"EL MOTÍN": "반란",
		"El vestuario ha decidido que el míster se tiene que ir y hay una carta con firmas dando vueltas. Falta la tuya, y el despacho está a diez metros por el otro pasillo.":
			"라커룸은 감독이 떠나야 한다고 결정했고, 서명이 담긴 편지가 돌고 있어요. 당신 서명만 없어요. 감독실은 반대편 복도로 10미터 거리에 있어요.",
		"FIRMAR CON EL GRUPO": "동료들과 서명",
		"AVISAR AL MÍSTER": "감독에게 알리기",
		"EL AÑO QUE TE QUEDA": "남은 마지막 1년",
		"Tu agente tiene un periodista al teléfono y una frase preparada: que escuchas ofertas. Filtrarla te dobla el precio y te convierte, esta misma noche, en el que ya se fue.":
			"에이전트가 기자와 통화 중이고, 할 말도 준비돼 있어요: 당신이 제안을 듣고 있다고요. 흘리면 몸값이 두 배가 되지만, 바로 오늘 밤부터 당신은 이미 떠난 사람이 돼요.",
		"DEJARLA CAER": "슬쩍 흘리기",
		"JURAR QUE TE QUEDAS": "남겠다고 맹세",
		"LO QUE SABE EL CAPITÁN": "주장이 아는 것",
		"Tres se saltaron la concentración y tú los viste salir. El club te pregunta a la cara, como capitán, y el vestuario entero espera en el pasillo a ver qué dices.":
			"세 명이 합숙을 빠져나갔고 당신은 그들이 나가는 걸 봤어요. 클럽이 주장인 당신에게 대놓고 물어요. 라커룸 전체가 복도에서 당신의 대답을 기다려요.",
		"DAR LOS NOMBRES": "이름 대기",
		"TAPARLOS": "감싸기",
		"LA OFERTA QUE NO SE RECHAZA": "거절할 수 없는 제안",
		"Una casa de apuestas pone medio año de sueldo por tu cara en su cartel. La grada odia esa marca —hay pancartas cada domingo— y el club firmó contra ella.":
			"한 베팅 회사가 광고판에 당신 얼굴을 쓰는 대가로 반년 치 연봉을 제시해요. 관중은 그 브랜드를 싫어하고 —매주 일요일 현수막이 걸려요— 클럽은 반대 서약에 서명했어요.",
		"COBRAR Y FIRMAR": "돈 받고 계약",
		"DECIR QUE NO": "거절",
		"EL VESTUARIO YA LO SABE": "라커룸은 이미 알아요",
		"Pediste salir y la noticia llegó antes que tú al vestuario. Nadie te dice nada, que es peor. El capitán te espera apoyado en tu taquilla.":
			"이적을 요청했더니 소식이 당신보다 먼저 라커룸에 도착했어요. 아무도 아무 말 안 해요. 그게 더 나빠요. 주장이 당신 사물함에 기대어 기다리고 있어요.",
		"NO ES ASUNTO SUYO": "남의 일 아니야",
		"LA GRADA TE CANTA": "관중의 노래",
		"En el calentamiento un fondo entero te canta que te vayas ya. A la salida hay bufandas en el suelo y una cámara esperando tu cara.":
			"몸을 풀 때 한쪽 관중석 전체가 당장 떠나라고 노래해요. 경기장 밖엔 머플러가 바닥에 버려져 있고, 카메라가 당신 얼굴을 기다려요.",
		"APLAUDIR AL FONDO": "박수로 답하기",
		"SALIR SIN MIRAR": "고개 숙이고 퇴장",
		"TE HAN PUESTO EN LA LISTA": "명단에 올랐어요",
		"El club te metió en la lista de transferibles sin avisarte, y te enteraste por la prensa. Hay un micrófono delante y la pregunta ya está hecha.":
			"클럽이 말도 없이 당신을 이적 명단에 올렸고, 당신은 언론을 통해 알았어요. 눈앞에 마이크가 있고, 질문은 이미 나왔어요.",
		"TRAGARME EL SAPO": "꾹 삼키기",
		"CONTAR LA VERDAD": "솔직하게 말하기",
		"LA MEDALLA DE PLATA": "은메달",
		"Perdiste la final. En el círculo central te cuelgan la medalla que nadie quiere, y en el túnel hay treinta micrófonos esperando a que señales a alguien.":
			"결승에서 졌어요. 센터 서클에서 아무도 원치 않는 메달이 목에 걸리고, 터널에선 마이크 30개가 당신이 누군가를 지목하길 기다려요.",
		"CULPAR AL PLANTEAMIENTO": "전술 탓하기",
		"SEÑALAR AL VESTUARIO": "선수단 탓하기",
		"PASAR DE LARGO SIN HABLAR": "말없이 지나치기",
		"LA REUNIÓN DE JUNIO": "6월의 면담",
		"Despacho, dos directivos y una carpeta con tu temporada abierta encima de la mesa. No cumpliste, y de aquí nadie sale hasta que la culpa tenga un nombre.":
			"사무실, 이사 두 명, 그리고 책상 위에 펼쳐진 당신의 시즌 파일. 목표를 못 채웠고, 책임질 사람의 이름이 나오기 전엔 아무도 이 방을 못 나가요.",
		"SEÑALAR AL TÉCNICO": "감독 탓하기",
		"SEÑALAR A LA PLANTILLA": "선수단 탓하기",
		"FIRMAR QUE FUE TU CULPA": "내 탓이라고 서명",
		"CUATRO EN CONTRA": "4실점",
		"Ridículo de los que se recuerdan. La grada se quedó de pie esperando a que alguien subiera a dar la cara, y en el vestuario nadie levanta la vista del suelo.":
			"두고두고 기억될 망신이에요. 관중은 누군가 올라와 책임지길 기다리며 서 있었고, 라커룸에선 아무도 바닥에서 눈을 들지 못해요.",
		"PEDIR PERDÓN EN CALIENTE": "그 자리에서 사과",
		"DECIR QUE NO ES PARA TANTO": "과장됐다고 말하기",
		"REVENTAR EL VESTUARIO": "선수단 질타",
		"PERDISTE EL DERBI": "더비 패배",
		"La ciudad es de ellos durante un año entero. En la puerta hay gente esperando el autobús del equipo, y no vienen a pedir autógrafos.":
			"1년 내내 이 도시는 그들 차지예요. 문 앞에 팀 버스를 기다리는 사람들이 있는데, 사인을 받으러 온 게 아니에요.",
		"ENCARARTE CON LA VALLA": "펜스 앞에서 맞서기",
		"CARGAR CONTRA EL ÁRBITRO": "주심 탓하기",
		"IRTE EN SILENCIO": "조용히 떠나기",
		"FUERA CONTRA UN MODESTO": "약팀에게 탈락",
		"Os echó un equipo de dos categorías más abajo, en un campo de mil personas y con el vestuario de local celebrándolo al lado del vuestro.":
			"두 단계 아래 팀에게 탈락했어요. 1,000석짜리 경기장에서, 바로 옆 홈 라커룸은 축제 분위기예요.",
		"DECIR QUE OS SOBRÓ CONFIANZA": "자만했다고 인정",
		"DEFENDER AL GRUPO CONTRA TODOS": "모두로부터 동료 감싸기",
		"NO ABRIR LA BOCA": "입 다물기",
		"EL ESTADIO LLEVARÁ TU NOMBRE": "경기장에 내 이름을",
		"La directiva lo anuncia en la próxima junta: quiere ponerle tu nombre al estadio. Es el honor más grande que da un club, y sólo se da una vez.":
			"다음 이사회에서 발표할 거래요: 경기장에 당신 이름을 붙이고 싶대요. 클럽이 줄 수 있는 가장 큰 영예이고, 단 한 번뿐이에요.",
		"ACEPTAR EL HONOR": "영예 받아들이기",
		"QUE SEA PARA TODO EL VESTUARIO": "선수단 모두를 위해",
		"DEJARLO CON SU NOMBRE DE SIEMPRE": "원래 이름 그대로",
		"TE PONEN EL MICRO": "눈앞의 마이크",
		"Figura del partido. La cadena te para antes del vestuario y hay treinta segundos en directo. Lo que digas se repite toda la semana.":
			"경기 최우수 선수. 방송사가 라커룸 앞에서 당신을 붙잡았고, 30초 생방송이에요. 무슨 말을 하든 일주일 내내 반복돼요.",
		"MÉRITO DEL EQUIPO": "팀의 공으로",
		"HABLAR DE TU MOMENTO": "내 폼 자랑",
		"DEDICÁRSELO A LA GENTE": "팬들에게 바치기",
		"CÓMO LO CUENTAS": "어떻게 말할까",
		"El parte ya salió y el teléfono no para. Toca decir algo sobre la baja, y cada versión tiene su precio.":
			"부상 소식이 이미 나갔고 전화가 멈추지 않아요. 결장에 대해 뭔가 말해야 하는데, 어떤 말이든 대가가 있어요.",
		"VOLVERÉ ANTES DE TIEMPO": "일찍 돌아올게요",
		"SEGUIR LOS PLAZOS": "일정대로 회복",
		"NO DECIR NADA": "아무 말 안 하기",
		"El médico no dice plazos: dice que a tu edad una rotura así no vuelve entera. Puedes pelear la rehabilitación y volver mermado, o parar tú antes de que te paren.":
			"의사는 기간을 말하지 않아요: 당신 나이에 이런 파열은 완전히 회복되지 않는대요. 재활과 싸워 약해진 채 돌아오거나, 멈춰지기 전에 스스로 멈출 수 있어요.",
		"REHABILITARME": "재활하기",
		"MÉRITO DE {0}": "{0}의 공으로",
	},





	"leyenda_casa": {
		"DE LA CASA": "원클럽맨",
		"Diez temporadas seguidas o más en el club. Una cesión no corta la racha.": "한 클럽에서 10시즌 이상 연속. 임대는 기록을 끊지 않아요.",
		"Nadie lleva aún diez temporadas seguidas en {0}.": "아직 {0}에서 10시즌 연속 뛴 선수는 없어요.",

		"PASARON POR AQUÍ": "이곳을 거쳐 간 선수들",
		"Jugaron aquí y hoy están en otro club, los mejores primero.": "이곳에서 뛰었고 지금은 다른 클럽에 있는 선수들, 잘하는 순서로.",
		"Nadie que pasara por {0} sigue en activo en otro club.": "{0} 클럽을 거쳐 간 선수 중 다른 클럽에서 현역인 선수는 없어요.",
		"TEMP.": "시즌",
		"Bandera del Club": "클럽의 기둥",
		"Jugar 10 temporadas seguidas en un mismo club.": "한 클럽에서 10시즌 연속으로 뛰기.",
	},

	"achievements": {},





	"practice": {
		"VOLVER": "뒤로",
		"SALIR A MENÚ": "메뉴로 나가기",
		"EMPEZAR DE NUEVO": "처음부터",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada cuenta para la carrera. Se sale con PAUSA.": "플레이를 하나 골라 무제한으로 반복하세요. 시도할 때마다 같은 유형 안에서 다른 상황이 만들어져요. 커리어에는 전혀 반영되지 않아요. 나가려면 일시정지.",
		"JUEGO ABIERTO": "오픈 플레이",
		"BALÓN PARADO": "세트피스",
		"CONDUCCIÓN": "드리블",
		"Mano a mano": "일대일",
		"Disparo frontal": "정면 슈팅",
		"Desde lejos": "중거리",
		"Ángulo cerrado": "좁은 각도",
		"Rebote en el área": "박스 안 세컨드볼",
		"Contraataque": "역습",
		"Volea": "발리",
		"Centro al área": "박스로 크로스",
		"Centro desde el fondo": "엔드라인 크로스",
		"Tiro libre": "프리킥",
		"Tiro de esquina": "코너킥",
		"Penal": "페널티킥",
		"Saque de banda largo": "롱 스로인",
		"Falta al borde del área": "박스 앞 프리킥",
		"Regate 1 contra 1": "1대1 드리블",



		"EL CAMPO": "경기장",
		"AZOTEA": "옥상",
		"TU ESTADIO": "내 경기장",
		"EL TIEMPO": "날씨",
		"SORTEO": "랜덤",


		"SOL": "맑음",
		"NUBES": "흐림",
		"TARDE": "노을",
		"LLUVIA": "비",
		"NOCHE": "밤",
		"NIEVE": "눈",
		"En la azotea siempre anochece y siempre llueve: es su hora. Juega en TU ESTADIO si quieres mandar sobre el tiempo.": "옥상은 늘 해 질 녘이고 늘 비가 와요. 그게 그곳의 시간이에요. 날씨를 마음대로 하고 싶다면 내 경기장에서 플레이하세요.",
		"Se sortea como en un partido de verdad.": "실제 경기처럼 랜덤으로 정해져요.",
		"Sin límite · no cuenta para la carrera": "무제한 · 커리어에 반영 안 됨",
		"Tu estadio con {0}.": "내 경기장, {0}.",




		"Soleado": "맑음",
		"Nublado": "흐림",
		"Atardecer": "노을",
		"Lluvia": "비",
		"Noche": "밤",
		"Nieve": "눈",



		"Llovizna": "이슬비",
		"Tormenta": "폭풍우",
	},















	"career_screens": {

		"TRAYECTORIA": "커리어",
		"DESDE T{0}": "S{0}부터",

		"DESDE {0}": "{0}부터",


		"viaLIBRE": "자유",
		"viaEDITOR": "에디터",
		"TRASPASO": "이적",
		"FIN CESION": "임대 종료",
		"COMPRADO": "구매",

		"HAY UNA PARED AHI": "벽에 막혔어요",
		"PUERTAS Y VENTANAS": "문과 창문",

		"PINO": "파인",
		"NOGAL": "호두나무",
		"NEGRO MATE": "무광 블랙",
		"ALUMINIO": "알루미늄",
		"LATÓN": "황동",




		"RITMO": "경기 감각",
		"FALTO DE RITMO · SE PASA JUGANDO": "경기 감각 부족 · 뛰면 회복돼요",
		"EL TÉCNICO TE DA DESCANSO · LO VES DESDE LA GRADA":
			"감독이 휴식을 줬어요 · 관중석에서 관전",
		"POR DEBAJO DE {0} EMPIEZAS EN LA BANCA": "{0} 미만이면 벤치에서 시작",




		"POR DEBAJO DE {0} NO TE CONVOCAN": "{0} 미만이면 소집 제외",


		"AÑO {0} · SEM {1}/{2}": "{0}년차 · {1}/{2}주",
		"energiaFUERA": "제외",
		"energiaBANCA": "벤치",
		"Aún no llevas {0} partidos: esta vez no cuenta.":
			"아직 {0}경기를 뛰지 않았어요. 이번엔 반영되지 않아요.",

		"MANTENIMIENTO": "유지비",
		"En segunda tu club abre tienda oficial: merch, y la tabla de las camisetas más vendidas del vestuario.":
			"2부 리그에 오르면 클럽이 공식 스토어를 열어요. 굿즈와 라커룸 유니폼 판매 순위표가 생겨요.",
		"LAS MÁS VENDIDAS": "베스트셀러",
		"{0} AL AÑO": "연 {0}",
		"Lo que mueve cada uno de la marca del club. Vender camisetas te hace más difícil de vender a ti.":
			"각 선수가 클럽 브랜드에서 차지하는 몫이에요. 유니폼이 잘 팔릴수록 당신을 팔기 어려워져요.",
		"JUGADOR": "선수",
		"CUOTA": "점유율",

		"TUS TEMPORADAS": "내 시즌",
		"AÑO": "연도",
		"{0}º de {1}": "{1} 중 {0}위",
		"Tu dorsal, el {0}, se elige al fichar o al renovar.":
			"등번호 {0}번은 영입이나 재계약 때 정해요.",
		"A la espalda: {0}": "등번호: {0}",
		"GOL DE PENAL EN LIGA": "리그 PK 골",
		"GOL DE PENAL EN {0}": "{0} PK 골",

		"Tu media es {0}. Con la vara de {1} son {2}, y ése es el número que se mide contra la lista.":
			"평균 능력치: {0}. {1}의 기준으로는 {2}, 이 숫자가 명단과 비교돼요.",
		"Y el seleccionador te apunta {0} por lo de fuera del campo, así que la lista te lee {1}.":
			"그리고 대표팀 감독이 경기장 밖 활동으로 {0}점을 더 쳐줘서, 명단 기준 수치는 {1}.",
		"Tu país no tiene liga propia: eres su estrella indiscutible.":
			"당신의 나라엔 자체 리그가 없어요. 당신이 확고한 에이스예요.",
		"Te faltan {0} puntos para entrar en la convocatoria.":
			"소집 명단에 들려면 {0}점이 더 필요해요.",
		"Aún no entras en la convocatoria.": "아직 소집 명단에 들지 못했어요.",
		"Sin nacionalidad: no hay selección que disputar.":
			"국적 없음: 뛸 국가대표팀이 없어요.",
		"{0} · {1} CANDIDATOS": "{0} · 후보 {1}명",
		"DORSAL {0}": "등번호 {0}",
		"1-{0} ONCE": "1-{0} 선발",
		"{0}-{1} BANCA": "{0}-{1} 벤치",
		"El suelo, la pared y la carpintería, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.": "바닥, 벽, 문틀까지 내 취향대로. 따로 구매하고 계속 내 것이에요. 언제든 바꿀 수 있어요.",
		"MUDARSE": "이사",
		"El terreno crece a {0}×{0} m y todo lo que construiste se queda.": "부지가 {0}×{0} m로 넓어지고 지어 둔 건 모두 그대로예요.",
		"La casa más grande que se vende, y una planta hecha a la medida.": "판매 중인 가장 큰 집, 그리고 맞춤 평면도.",
		"Todo lo que construiste se queda.": "지어 둔 건 모두 그대로예요.",
		"Ya vives en la mejor casa: no hay ninguna encima.": "이미 최고의 집에 살고 있어요. 더 위는 없어요.",
		"PRECIO": "가격",

		"PONER VENTANA": "창문 추가",
		"PUERTA DOBLE": "양문",
		"PONER ARCO": "아치 추가",
		"PONER VENTANAL": "통창 추가",
		"PONER OJO DE BUEY": "둥근 창 추가",
		"DOBLE": "양문",
		"ARCADA": "아치",
		"VENTNL": "통창",
		"OJO": "원창",
		"QUITAR VENTANA": "창문 막기",
		"VENTAN": "창문",
		"TAPIAR": "벽 막기",

		"VACIAR": "비우기",
		"PUESTOS": "배치",
		"TABIQUES": "벽",
		"PINTADO": "칠함",
		"TIRADOS": "철거",
		"DESPINTADO": "칠 지움",
		"MANTEN PARA GUARDAR TODO": "길게 눌러 모두 보관",
		"MANTEN PARA DEJARLO LIMPIO": "길게 눌러 모두 치우기",
		"MANTEN PARA ARRASAR": "길게 눌러 철거",
		"PLANOS": "평면도",
		"Cuartos ya repartidos, con sus puertas puestas.": "방이 이미 나뉘어 있고 문도 달려 있어요.",
		"Este terreno es demasiado chico para repartirlo en cuartos.": "부지가 너무 작아서 방으로 나눌 수 없어요.",
		"LO QUE SE VA": "사라지는 것",
		"El plano REEMPLAZA tu casa: tira tus paredes, borra la pintura y recoge tus muebles al inventario.": "평면도는 집을 통째로 바꿔요. 벽이 철거되고 페인트가 지워지며 가구는 보관함으로 돌아가요.",
		"PAREDES QUE HAY": "현재 벽",
		"Aplicar un plano las tira todas y pone las suyas.": "평면도를 적용하면 벽을 모두 허물고 새로 세워요.",
		"DOS AMBIENTES": "두 공간",
		"Un muro con puerta: día de un lado, noche del otro.": "문이 있는 벽 하나: 한쪽은 낮, 다른 쪽은 밤.",
		"DOS RECÁMARAS": "침실 두 개",
		"TRES CUARTOS Y BAÑO": "방 셋과 욕실",
		"Añade un baño en la esquina de la entrada.": "현관 모서리에 욕실을 추가해요.",
		"Dos cuartos al fondo, con su puerta cada uno, y el salón al frente.": "안쪽에 각자 문이 있는 방 두 개, 앞쪽엔 거실.",
		"CUATRO CUARTOS": "방 넷",
		"Cocina aparte, salón al frente y dos cuartos al fondo.": "독립된 주방, 앞쪽엔 거실, 안쪽엔 방 두 개.",
		"PASILLO Y CUATRO CUARTOS": "복도와 방 넷",
		"Un pasillo desde la puerta, dos cuartos por lado y el salón al fondo.": "현관에서 이어지는 복도, 양쪽에 방 두 개씩, 안쪽엔 거실.",
		"{0} cuartos": "방 {0}개",
		"O YA AMUEBLADA": "또는 가구 완비",





		"rotANULAR": "취소",
		"rotDESHAZ": "되돌리기",
		"rotCERRAR": "닫기",
		"rotGIRAR": "회전",
		"rotMOVER": "이동",
		"rotOTRO": "다음",
		"rotPINTAR": "칠하기",
		"rotPLANOS": "평면도",
		"rotQUITAR": "제거",
		"rotTAPAR": "막기",
		"rotTAPIAR": "막기",
		"rotTAPONA": "막힘",
		"rotTIRAR": "철거",
		"rotTRAMO": "구간",
		"rotVACIAR": "비우기",
		"rotVENTAN": "창문",
		"En este plano no cabe el juego de muebles completo.": "이 평면도에는 가구 세트 전체가 들어가지 않아요.",
		"Llega con {0} muebles ya puestos en su sitio.": "가구 {0}개가 제자리에 배치된 채로 와요.",
		"Sueltos costarían {0}": "따로 사면 {0}",
		"AMUEBLADA": "가구 완비",
		"Calculando la oferta…": "제안 계산 중…",
		"COMPRAR AMUEBLADA · {0}": "가구 완비로 구매 · {0}",
		"PAGASTE": "지불액",
		"Y de paso te acomodamos {0} muebles que ya tenías guardados.": "보관함에 있던 가구 {0}개도 함께 정리해 뒀어요.",
		"Muévelo todo si quieres: la casa ya es tuya y nada está clavado.": "원하면 다 옮겨도 돼요. 집은 이제 당신 거고 고정된 건 하나도 없어요.",
		"MANTEN PARA PONER ESTE PLANO": "길게 눌러 이 평면도 적용",
		"Tira TAMBIÉN el cascarón y las paredes de fábrica. Queda el terreno con su piso.": "외벽과 기본 벽까지 모두 허물어요. 부지와 바닥만 남아요.",
		"Ni muebles, ni paredes, ni pintura: este terreno ya está pelado.": "가구도, 벽도, 페인트도 없어요. 이 부지는 이미 텅 비었어요.",
		"{0} paredes": "벽 {0}개",
		"PLANO": "평면도",
		"Muévelas, tíralas o ábreles más puertas: ahora son tuyas.": "옮기든 허물든 문을 더 내든 마음대로. 이제 당신 거예요.",
		"MARCOS DE TODA LA CASA": "집 전체 문틀",
		"Puertas, ventanas, corredizas, rodapiés y remates.": "문, 창문, 미닫이문, 걸레받이, 마감재.",
		"PONER CORREDIZA": "미닫이문 추가",
		"QUITAR CORREDIZA": "미닫이문 제거",
		"PARED CORTA": "벽이 짧아요",
		"CORRED": "미닫이",
		"CORTA": "짧음",
		"TAPAR": "막기",
		"YA ESTA PELADO": "이미 텅 빔",
		"TIRAR TODO EL TRAMO": "구간 전체 철거",
		"NO HAY NADA PUESTO": "배치된 것 없음",
		"YA ESTA LIMPIO": "이미 깨끗함",
		"Recoge tus muebles al inventario. Las paredes y la pintura se quedan.": "가구를 보관함으로 돌려놔요. 벽과 페인트는 그대로예요.",
		"Además tira tus tabiques, cierra los boquetes y borra la pintura del suelo.": "직접 세운 벽도 허물고, 구멍을 막고, 바닥 페인트도 지워요.",
		"Nada se pierde: todo lo que compraste sigue en tu inventario.": "잃는 건 없어요. 구매한 건 모두 보관함에 남아요.",
		"Esta planta ya está vacía: todo lo tuyo está en el inventario.": "이 층은 이미 비어 있어요. 당신 물건은 모두 보관함에 있어요.",
		"Ni muebles puestos, ni tabiques tuyos, ni pintura: no hay nada que quitar.": "배치된 가구도, 직접 세운 벽도, 페인트도 없어요. 치울 게 없어요.",
		"YA ESTA": "완료",
		"A CAJAS": "포장",
		"VALOR DE MERCADO": "시장 가치",
		"TU SITIO EN EL EQUIPO": "팀 내 내 위치",
		"ROL DE CONTRATO": "계약 역할",
		"PRÓXIMO PARTIDO": "다음 경기",
		"{0} · ~{1} MIN": "{0} · 약 {1}분",
		"ÚLTIMO PARTIDO": "지난 경기",
		"{0} MIN · {1}": "{0}분 · {1}",
		"NO JUGASTE": "결장",
		"FORMA · {0}": "폼 · {0}",
		"MEDIA TEMPORADA": "시즌 평점",
		"MEDIA CARRERA": "커리어 평점",
		"HABILIDADES · {0} PUNTOS": "능력 · {0}포인트",
		"HABILIDADES · TODO AL TOPE": "능력 · 모두 최대",
		"Ya no queda nada que subir: los puntos que ganes se convierten en experiencia.": "더 올릴 능력이 없어요. 얻는 포인트는 경험치로 바뀌어요.",
		"Penales": "페널티킥",
		"Tiros libres y córners": "프리킥과 코너킥",
		"{0}: los lanzas TÚ": "{0}: 당신이 전담 키커",
		"{0}: los lanza {1} — tú cobras ~{2} de cada 10":
			"{0}: 전담은 {1} — 당신은 10번 중 약 {2}번",
		"{0}: los lanza {1} — supéralo para quitárselos":
			"{0}: 전담은 {1} — 그를 넘어서면 당신 차지",
		"SU NIVEL": "그의 레벨",
		"TU NIVEL": "내 레벨",
		"TÚ COBRAS": "내 몫",
		"En racha (+{0})": "상승세 (+{0})",
		"En baja ({0})": "하락세 ({0})",
		"Estable": "안정",



		"Potencia": "파워",
		"Precisión": "정확도",
		"Efecto": "회전",
		"Visión": "시야",
		"Físico": "체력",
		"Velocidad": "속도",
		"Aceleración": "가속력",
		"Regate": "드리블",
		"Balón parado": "세트피스",


		"Pegada": "킥력",
		"Puntería": "결정력",
		"Rosca": "커브",
		"Cabeza": "헤더",

		"Reflejos": "반사신경",
		"Entrada": "태클",
		"{0} · MEDIA {1}": "{0} · OVR {1}",
		"TE PELEA EL PUESTO": "내 자리를 노림",
		"VER PLANTEL": "스쿼드 보기",



		"La velocidad a la que sale el balón de tu pie. Sólo la entregas entera si le pegas al empeine.":
			"공이 발을 떠나는 속도. 인스텝에 정확히 맞혀야 전부 실을 수 있어요.",
		"Cuánto respeta el balón la línea que trazaste. Cierra el abanico de error del apuntador.":
			"공이 그린 선을 얼마나 잘 따라가는지. 조준의 오차 범위를 좁혀 줘요.",
		"Cuánto comba el balón en el aire. También es el toque con el que conduces en el regate.":
			"공중에서 공이 얼마나 휘는지. 드리블할 때 공을 다루는 터치이기도 해요.",
		"Desde 85 ves dibujada la línea de fuera de juego. El árbitro la pita igual sin ella.":
			"85부터 경기장에 오프사이드 라인이 그려져 보여요. 안 보여도 판정은 똑같아요.",
		"Lo rápido que corres con el balón en el regate: si eres lento te la quitan, si eres rápido no te alcanzan. No toca el tiro.":
			"드리블할 때 공을 몰고 달리는 속도. 느리면 빼앗기고, 빠르면 아무도 못 따라와요. 슈팅에는 영향이 없어요.",
		"Qué tan rápido llegas a tu velocidad máxima: el arranque, el frenazo y la marcha atrás al conducir.":
			"최고 속도에 도달하는 빠르기. 공을 몰 때의 출발, 정지, 방향 전환이에요.",
		"Tu control del balón en carrera: el quiebre sin perder velocidad y a qué distancia te lo pueden robar.":
			"달리면서의 볼 컨트롤. 속도를 잃지 않고 꺾는 능력과, 상대가 얼마나 가까이 와야 빼앗을 수 있는지.",
		"DE PARADO A TU MÁXIMA EN {0} S": "정지에서 최고 속도까지 {0}초",
		"TE ROBAN A {0} CM DEL BALÓN": "공에서 {0}CM 거리에서 빼앗김",
		"Cada punto sobre el lanzador de tu equipo te da más penales. NO cuenta para tu media.":
			"팀 전담 키커보다 1포인트 높을수록 PK를 더 많이 차요. 능력치에는 반영되지 않아요.",
		"Cada punto sobre el lanzador de tu equipo te da más faltas y córners. NO cuenta para tu media.":
			"팀 전담 키커보다 1포인트 높을수록 프리킥과 코너킥을 더 많이 차요. 능력치에는 반영되지 않아요.",
		"TU TIRO: {0} KM/H": "내 슈팅: {0}KM/H",
		"TU CABEZAZO: {0} KM/H": "내 헤더: {0}KM/H",
		"A {0} M EL BALÓN SALE DENTRO DE ±{1} CM": "{0}M에서 공이 ±{1}CM 안에 떨어짐",
		"SIN ABANICO: EL BALÓN VA POR DONDE APUNTAS": "오차 없음: 조준한 곳으로 공이 감",
		"COMBA ×{0}": "회전 ×{0}",
		"VES LA LÍNEA DE FUERA DE JUEGO EN LA CANCHA": "경기장에 오프사이드 라인이 보여요",
		"TE FALTAN {0} PARA VER LA LÍNEA DE FUERA DE JUEGO": "오프사이드 라인까지 {0} 남음",
		"CORRES A {0} M/S · EL DEFENSA MÁS RÁPIDO, {1}":
			"내 속도 {0}M/S · 가장 빠른 수비수 {1}",
		"LOS COBRAS TODOS": "전부 내가 참",
		"COBRAS {0} DE CADA 10": "10번 중 {0}번 참",
		"DESHACER": "되돌리기",
		"PUNTO DEVUELTO · {0}": "포인트 환불 · {0}",
		"Al salir del perfil, lo repartido queda firmado.":
			"프로필을 나가면 배분한 포인트가 확정돼요.",
		"ESPORÁDICO": "후보 자원",
		"ROTACIÓN": "로테이션",

		"MEDIA {0}": "평점 {0}",
		"MEDIA {0} EN {1} JORNADAS": "{1}라운드 평점 {0}",
		"{0} de {1} · {2}/{3} jornadas": "{1} 중 {0} · {2}/{3}라운드",
		"JUGAR {0} JORNADAS": "{0}라운드 출전",
		"JUGAR {0} JORNADAS DE {1}' O MÁS": "{1}분 이상 {0}라운드 출전",
		"{0} GOLES": "{0}골",
		"CONTRATO": "계약",
		"Club: {0} ({1})": "클럽: {0} ({1})",
		"Sueldo: ${0} por partido": "주급: 경기당 ${0}",
		"Temporadas restantes: {0}": "남은 시즌: {0}",
		"tu club": "내 클럽",
		"CEDIDO · el contrato es con {0}": "임대 중 · 계약 클럽: {0}",
		"Mantenimiento del estilo de vida: -${0} por partido":
			"생활 유지비: 경기당 -${0}",
		"OBJETIVO DE TEMPORADA": "시즌 목표",

		"CLÁUSULA PERSONAL": "개인 조항",
		"Sin cláusula. Una condición con dientes a cambio de renunciar a las otras.":
			"조항 없음. 다른 조건을 포기하는 대신 확실한 조건 하나를 걸 수 있어요.",
		"ANTI-DESCENSO": "강등 시 해지",
		"Si el club baja de categoría, quedas AGENTE LIBRE.":
			"클럽이 강등되면 FA로 풀려요.",
		"PROMESA DE TITULARIDAD": "선발 보장",
		"Si juegas pocos partidos esta temporada, quedas AGENTE LIBRE.":
			"이번 시즌 출전 경기가 적으면 FA로 풀려요.",
		"NO A UN RIVAL": "라이벌 이적 금지",
		"Tu club no puede venderte a tu rival de siempre.":
			"클럽은 당신을 숙명의 라이벌에게 팔 수 없어요.",
		"ELEGIR CLÁUSULA": "조항 선택",
		"CAMBIAR CLÁUSULA": "조항 변경",
		"La cláusula se pacta al arranque de la temporada.":
			"조항은 시즌 시작 때 합의해요.",
		"Sólo una a la vez. Se pacta al arranque de la temporada.":
			"한 번에 하나만. 시즌 시작 때 합의해요.",
		"SIN CLÁUSULA": "조항 없음",
		"CLÁUSULA PACTADA": "조항 합의됨",
		"ES TU RIVAL: tu CLÁUSULA impide que acabes aquí.":
			"라이벌 클럽: 당신의 조항 때문에 이곳으로 갈 수 없어요.",
		"CLÁUSULA ANTI-DESCENSO: el club bajó y quedas AGENTE LIBRE.":
			"강등 시 해지 조항: 클럽이 강등돼 FA가 됐어요.",
		"PROMESA DE TITULARIDAD incumplida ({0} partidos): quedas AGENTE LIBRE.":
			"선발 보장 불이행 ({0}경기): FA가 됐어요.",

		"PACTAR OBJETIVO": "목표 합의",
		"PACTAR EL OBJETIVO": "목표 합의하기",
		"Más exigente paga más prima; más cómodo, menos. Se pacta una vez, al arranque de la temporada.":
			"어려울수록 보너스가 크고, 쉬울수록 작아요. 시즌 시작 때 한 번만 합의해요.",
		"CÓMODO": "쉽게",
		"COMO ESTÁ": "그대로",
		"EXIGENTE": "어렵게",
		"OBJETIVO PACTADO": "목표 합의됨",
		"Ya pactaste tu objetivo esta temporada.": "이번 시즌 목표는 이미 합의했어요.",
		"top {0}": "상위 {0}",
		"{0} asist.": "도움 {0}",
		"{0} part.": "{0}경기",
		"nota {0}": "평점 {0}",
		"{0} goles": "{0}골",
		"RENOVAR CONTRATO": "재계약",


		"LA OFERTA DEL CLUB": "클럽의 제안",
		"AÑOS QUE OFRECEN": "제안 기간",
		"NINGUNO": "없음",
		"SUELDO NUEVO": "새 주급",


		"EQUILIBRIO": "균형",
		"MÁS AÑOS": "장기",
		"LIBERTAD": "자유",
		"PRIMA DE FIRMA": "사이닝 보너스",
		"CLÁUSULA": "조항",
		"Cobras $ {0} de prima al firmar.": "계약 시 보너스 $ {0} 지급.",
		"Cláusula baja: si un club la paga, el tuyo no puede negarse.":
			"낮은 바이아웃: 어떤 클럽이 지불하면 소속 클럽은 거절할 수 없어요.",
		"Cláusula en $ {0}: quien la pague, te lleva.":
			"바이아웃 $ {0}: 지불하는 클럽이 당신을 데려가요.",

		"BANDERA":
			"상징",
		"Tu grada frena tu venta: cobras más y el club te blinda con una cláusula un {0} % más alta.":
			"팬들이 당신의 이적을 막아요. 주급이 오르고 클럽은 바이아웃을 {0} % 높여 당신을 묶어 둬요.",
		"Cláusula en $ {0}: tu grada frena tu venta.":
			"바이아웃 $ {0}: 팬들이 당신의 이적을 막아요.",
		"Aceptaste salir: tu grada ya no te quiere y el club te ofrece a quien pregunte, más barato. Sigues jugando mientras llega tu destino.":
			"떠나기로 했어요. 팬들은 더 이상 당신을 원하지 않고, 클럽은 문의하는 누구에게든 더 싸게 내놓아요. 새 팀이 정해질 때까지는 계속 뛰어요.",
		"TU GRADA TE QUIERE FUERA":
			"팬들이 당신을 원하지 않아요",
		"Negarte no te cuesta nada: el club no necesita tu dinero, necesita que dejen de pitarte. Si aceptas, te venden más barato.":
			"거절해도 잃는 건 없어요. 클럽은 당신의 돈이 아니라 야유가 멈추길 바랄 뿐이에요. 수락하면 더 싸게 팔려요.",
		"Te quedas, y en el vestuario nadie te lo reprocha. La grada no cambia sola: esa hay que ganársela en el campo.":
			"남기로 했고, 라커룸에선 아무도 탓하지 않아요. 팬심은 저절로 돌아오지 않아요. 경기장에서 되찾아야 해요.",
		"Te sientan en el vestuario con el director deportivo. En {0} la grada ya no te quiere y el club la escucha: te ofrecen a quien pregunte, y más barato. Si te quedas, nadie aquí dentro te lo reprocha.":
			"라커룸에서 단장과 마주 앉았어요. {0}의 팬들은 더 이상 당신을 원하지 않고 클럽도 그 목소리를 듣고 있어요. 문의하는 누구에게든 더 싸게 내놓을 거예요. 남는다면 이 안의 누구도 탓하지 않아요.",

		"La ficha sale de: {0}": "주급의 근거: {0}",
		"tu nivel": "내 레벨",
		"tu prestigio": "내 명성",
		"tus títulos": "내 우승 경력",
		"tu afición": "내 팬",
		"tus récords": "내 기록",
		"su interés": "그들의 관심",
		"tu temporada": "내 시즌",
		"Quedan {0} · al firmar tendrías {1} en total":
			"{0} 남음 · 계약하면 총 {1}",
		"Tu sueldo {0} de $ {1} a $ {2} por partido":
			"주급 {0}: 경기당 $ {1} → $ {2}",
		"sube": "인상",
		"baja": "인하",
		"Te renuevan con el mismo sueldo.": "같은 주급으로 재계약해요.",
		"Te firman como {0}": "역할: {0}",
		"Por tu temporada: {0}{1}% sobre el sueldo":
			"시즌 성적: 주급의 {0}{1}%",
		"Es el techo salarial del club: no pueden pagar más.":
			"클럽의 주급 상한이에요. 더는 줄 수 없어요.",
		"Negocian sobre tu ficha actual: nadie da más salto en una firma.": "현재 주급을 기준으로 협상해요. 한 번의 계약으로 이보다 크게 오르는 경우는 없어요.",
		"¿RENOVAR?": "재계약?",
		"{0} años más (tendrías {1}) y ficha de $ {2} por partido.":
			"{0}년 연장 (총 {1}), 경기당 $ {2}.",
		"Es MENOS de lo que cobras ahora.": "지금 받는 것보다 적어요.",


		"CONTRATO RENOVADO": "재계약 완료",


		"SOLO EN TU ÚLTIMO AÑO": "마지막 해에만",
		"EL TÉCNICO NO RENUEVA": "감독이 재계약 거부",




		"RENEGOCIAR": "재협상",
		"PEDIR RENEGOCIACIÓN": "재협상 요청",
		"LO QUE PUEDES PEDIR": "요구할 수 있는 것",
		"AÑOS QUE SUMAS": "추가 연수",
		"PRIMAS PACTADAS": "합의된 보너스",
		"MESA DE CONTRATO": "계약 협상",
		"CONTRATO MEJORADO": "계약 개선",
		"Tu sueldo sube de $ {0} a $ {1} por partido":
			"주급 인상: 경기당 $ {0} → $ {1}",
		"Te reconocen como {0}": "인정받은 역할: {0}",
		"Por tu temporada: +{0}% sobre el sueldo": "시즌 성적: 주급의 +{0}%",
		"Sueldo: $ {0} → $ {1} (+$ {2})": "주급: $ {0} → $ {1} (+$ {2})",
		"Años: +{0} (tendrías {1})": "기간: +{0}년 (총 {1})",
		"Prima por gol: +$ {0}": "골 보너스: +$ {0}",
		"Prima por asistencia: +$ {0}": "도움 보너스: +$ {0}",
		"Rol: te reconocen como {0}": "인정받은 역할: {0}",
		"Para renegociar antes: {0}": "더 빨리 재협상하려면: {0}",


		"Eres agente libre: negocia con un club nuevo.":
			"FA 신분이에요. 새 클럽과 협상하세요.",
		"Estás cedido: tu contrato lo lleva el club dueño.":
			"임대 중이에요. 계약은 원소속 클럽이 갖고 있어요.",
		"Ya firmaste un precontrato con otro club.":
			"이미 다른 클럽과 사전 계약을 했어요.",
		"El club te dio por perdido; no hay mesa.":
			"클럽이 당신을 포기했어요. 협상은 없어요.",
		"Pediste salir: arréglalo con el club antes de negociar.":
			"이적을 요청했어요. 협상 전에 클럽과 먼저 정리하세요.",
		"Es tu último año: el club ya te ofrece renovar.":
			"계약 마지막 해예요. 클럽이 이미 재계약을 제안하고 있어요.",
		"Acabas de firmar: cumple una temporada antes de pedir mejora.":
			"막 계약했어요. 개선을 요구하기 전에 한 시즌을 채우세요.",
		"Te queda mucho contrato: el club no tiene por qué moverlo.":
			"계약 기간이 넉넉해요. 클럽이 손댈 이유가 없어요.",
		"El club no negocia fichas con el mercado cerrado.":
			"이적 시장이 닫혀 있으면 클럽은 주급 협상을 하지 않아요.",
		"El club no se sentó contigo este año. Vuelve la temporada que viene.":
			"올해는 클럽이 협상에 응하지 않았어요. 다음 시즌에 다시 오세요.",
		"FIRMAR LA MEJORA":
			"개선안 서명",
		"El club ya cuenta con tu salida: no te convoca.":
			"클럽은 이미 당신이 떠날 거라 보고 소집하지 않아요.",
		"Renueva o busca club, o no juegas.":
			"재계약하거나 클럽을 찾으세요. 아니면 못 뛰어요.",
		"Una bala al año. Si fallas, esperas.":
			"기회는 1년에 한 번. 실패하면 기다려야 해요.",
		"PEDIR MESA AL CLUB":
			"클럽에 협상 요청",
		"SE SIENTAN":
			"협상 응함",
		"Se sientan contigo un {0}% de las veces. Si dicen que no, no habrá mesa esta temporada.":
			"클럽이 협상에 응할 확률은 {0}%예요. 거절하면 이번 시즌엔 협상이 없어요.",
		"PEDIR MESA":
			"협상 요청",
		"SE SIENTAN CONTIGO":
			"협상에 응해요",
		"NO HAY MESA ESTE AÑO":
			"올해는 협상 없음",
		"Ya renegociaste esta temporada. Vuelve el año que viene.":
			"이번 시즌엔 이미 재협상했어요. 내년에 다시 오세요.",
		"Aún no jugaste lo suficiente esta temporada.":
			"이번 시즌 아직 충분히 뛰지 않았어요.",
		"Sube tu media a {0} para sentarte a negociar.":
			"협상하려면 평점을 {0}까지 올리세요.",
		"Gánate al técnico antes de pedir mejora.":
			"개선을 요구하기 전에 감독의 신뢰부터 얻으세요.",
		"EN EL ESCAPARATE": "이적 매물",
		"No renuevas: el club te vende y juegas menos hasta que salgas.":
			"재계약 안 함: 클럽이 당신을 팔려 하고, 떠날 때까지 출전이 줄어요.",
		"Busca una salida en el MERCADO, o aguanta el año y quedarás AGENTE LIBRE al"
		+ " final.":
			"이적 시장에서 길을 찾거나, 한 해를 버티고 FA로 떠나세요.",
		"NO RENOVAR": "재계약 안 함",
		"¿NO RENOVAR?": "재계약 안 해요?",
		"El club te pondrá en venta para no perderte gratis. Si no sales, jugarás menos"
		+ " el resto del año. Si aguantas, quedarás libre al final.":
			"클럽은 당신을 공짜로 잃느니 이적 시장에 내놓을 거예요. 남으면 남은 한 해 동안 출전이 줄고, 끝나면 FA로 떠나요.",
		"NO RENUEVO": "재계약 안 해요",
		"NO RENUEVAS · EL CLUB TE VENDE": "재계약 거부 · 클럽이 매각 추진",
		"EL CLUB TE VENDE": "클럽이 매각 추진",
		"EL FINAL": "마지막",
		"Los años ya pesan. Puedes seguir peleando... o cerrar la carrera y entrar en"
		+ " la historia con lo que ganaste.":
			"세월이 느껴져요. 계속 싸울 수도 있고... 커리어를 마치고 이룬 것들과 함께 역사에 남을 수도 있어요.",
		"Juegues lo que juegues, a los {0} años se acaba: te queda {1} temporada.": "얼마나 뛰든 {0}세에 끝나요. 남은 시즌은 {1}시즌이에요.",
		"Juegues lo que juegues, a los {0} años se acaba: te quedan {1} temporadas.":
			"얼마나 뛰든 {0}세에 끝나요. 남은 시즌은 {1}시즌이에요.",
		"COLGAR LAS BOTAS": "축구화를 벗다",
		"MEJOR NO": "아직은 아니야",
		"¿COLGAR LAS BOTAS?": "축구화를 벗을까요?",
		"Se acaba de verdad: no hay más partidos. Tu legado, tu vitrina y tu historia"
		+ " quedan guardados para siempre.":
			"정말 끝이에요. 더 이상 경기는 없어요. 당신의 레거시, 트로피 진열장, 이야기는 영원히 남아요.",
		"ME RETIRO": "은퇴할게요",
		"MANTÉN PARA RETIRARTE": "길게 눌러 은퇴",
		"AÚN ME QUEDA FÚTBOL": "아직 더 뛸 수 있어",
		"Termina {0} o mejor en la liga.": "리그에서 {0} 이상으로 마치세요.",
		"La liga aún no arranca.": "리그가 아직 시작하지 않았어요.",
		"Vas {0}{1}": "현재 {0}{1}",
		"sin clasificar": "순위 없음",
		"Da {0} asistencias  (llevas {1})": "도움 {0}개 기록  (현재 {1})",
		"Marca {0} goles  (llevas {1})": "{0}골 기록  (현재 {1})",
		"TU VALOR": "내 가치",
		"TE PIDEN": "요구액",
		"EN LISTA": "매물",
		"CONTRATO CORTO": "단기 계약",
		"Tu agente está en {0}: te consigue {1} oferta(s) por ventana.":
			"에이전트 등급 {0}: 이적 시장마다 제안 {1}건을 가져와요.",
		"LOS OJEADORES": "스카우트",
		"Un club mira tres cosas y te juzga por la más floja. Para que te busque un"
		+ " grande, tienes que ser bueno en las tres.":
			"클럽은 세 가지를 보고 가장 약한 것으로 당신을 평가해요. 빅클럽의 관심을 받으려면 세 가지 모두 좋아야 해요.",
		"Fama": "명성",
		"Que te conozcan: prensa y afición.": "알려지는 것: 언론과 팬.",
		"Nivel": "레벨",
		"Tus habilidades frente a la élite.": "엘리트 대비 내 능력.",
		"Forma": "폼",
		"Tu media de la temporada: {0}.": "내 시즌 평점: {0}.",
		"Verano: fechas 1 a {0}. Invierno: {1} a {2}. Hoy es la {3}.":
			"여름: 1~{0}라운드. 겨울: {1}~{2}라운드. 오늘은 {3}라운드.",
		"TU CLUB TE VENDE": "클럽이 당신을 팔아요",
		"Dijiste que no renuevas: el club te ofrece para no perderte gratis. Mientras"
		+ " no salgas, juegas menos. Elige una salida:":
			"재계약하지 않겠다고 해서, 클럽은 당신을 공짜로 잃느니 여기저기 내놓고 있어요. 떠날 때까지 출전이 줄어요. 출구를 고르세요:",
		"ESTÁS EN VENTA": "이적 매물 등록",
		"Aceptaste salir: el club te ofrece a quien pregunte para hacer caja. Sigues"
		+ " jugando mientras llega tu destino.":
			"떠나기로 했어요. 클럽은 돈을 마련하려고 문의하는 누구에게든 당신을 내놓아요. 새 팀이 정해질 때까지는 계속 뛰어요.",
		"ULTIMO DIA · mañana se cierra": "마지막 날 · 내일 닫혀요",
		"Cierra en {0} jornadas. Lo que hagas en el campo mueve las ofertas: hay clubes"
		+ " que entran y clubes que se van.":
			"{0}라운드 후 닫혀요. 경기장에서의 활약이 제안을 바꿔요. 새로 오는 클럽도, 떠나는 클럽도 있어요.",
		"Nadie ha preguntado por ti. Rinde y hazte ver.":
			"아무도 당신에 대해 묻지 않았어요. 활약해서 눈에 띄세요.",


		"FICHAJES": "이적",
		"RECIENTES": "최근",
		"MAS CAROS": "최고가",
		"MUNDO": "세계",
		"MI JUGADOR": "내 선수",
		"DIVISION": "디비전",
		"TU LIGA": "내 리그",
		"Ningún movimiento en tu liga todavía.": "아직 내 리그에 이적이 없어요.",


		"Tu vestuario sigue igual: ni una alta ni una baja.":
			"라커룸에 변화가 없어요. 영입도, 방출도 없어요.",
		"Sin club: nadie entra ni sale de un vestuario que no tienes.":
			"소속 클럽 없음: 없는 라커룸엔 오가는 사람도 없어요.",
		"El mercado todavía no se ha movido.": "이적 시장이 아직 움직이지 않았어요.",
		"EN TU VESTUARIO": "내 라커룸",
		"MANTÉN · TRASPASO": "길게 · 이적",
		"MANTÉN · CESIÓN": "길게 · 임대",
		"VENDIDO": "판매됨",
		"LLEGA": "합류",
		"SE VA": "떠남",
		"DEJA EL CLUB": "클럽 떠남",



		"{0} ALTA": "영입 {0}",
		"{0} ALTAS": "영입 {0}",
		"{0} BAJA": "방출 {0}",
		"{0} BAJAS": "방출 {0}",
		"De {0} a {1}": "{0} → {1}",
		"Cedido de {0} a {1}": "임대: {0} → {1}",
		"Deja {0}": "{0} 떠남",
		"LIBRE": "자유",
		"ERES AGENTE LIBRE": "FA 신분이에요",
		"Tu contrato terminó. Fichas SIN traspaso (Bosman): el club se ahorra el fee y"
		+ " una parte es tu PRIMA de fichaje. El rol que te espera se dice antes de firmar"
		+ " — elige con cabeza.":
			"계약이 끝났어요. 이적료 없이 계약해요 (보스만). 클럽은 이적료를 아끼고 그 일부가 당신의 사이닝 보너스가 돼요. 맡게 될 역할은 계약 전에 알려 줘요. 잘 고르세요.",
		"Tu valor: $ {0}": "내 가치: $ {0}",
		"Ningún club por ahora. Vuelve a intentarlo más tarde.":
			"아직 관심 있는 클럽이 없어요. 나중에 다시 시도하세요.",
		"{0} OPCIONES A TU NIVEL": "내 레벨에 맞는 선택지 {0}개",
		"TU CLUB QUIERE RETENERTE": "클럽이 당신을 붙잡고 싶어 해요",
		"Te mejora el contrato para que te quedes:":
			"남도록 계약 조건을 올려 줬어요:",
		"Sueldo: ${0} por partido (ahora ${1})": "주급: 경기당 ${0} (현재 ${1})",
		"Contrato: {0} temporadas": "계약: {0}시즌",
		"Eres un ídolo de la casa: {0} temporadas aquí.":
			"원클럽맨 아이돌이에요: 이곳에서 {0}시즌.",
		"RENOVAR Y QUEDARME": "재계약하고 잔류",
		"RENOVADO · TE QUEDAS": "재계약 완료 · 잔류",
		"EL CLUB NECESITA VENDERTE": "클럽이 당신을 팔아야 해요",


		"RIESGO DE VENTA": "매각 위험",
		"VENTANA EN {0}J": "이적 시장까지 {0}R",
		"POR TU GRADA": "팬들의 판단",
		"AFICIÓN A {0}": "팬심 {0}",
		"Y ESTÁS A SALVO": "그러면 안전",
		"SALVO ASCENSO": "승격 제외",
		"O EUROPA": "또는 유럽 대회",
		"En {0} no pueden pagarte: venderte les cuadra las cuentas. Negarte tiene precio en el vestuario:":
			"{0} 클럽은 당신의 주급을 감당할 수 없어요. 당신을 팔아야 장부가 맞아요. 거절하면 라커룸에서 대가를 치러요:",
		"Negarte: técnico {0} · equipo {1} · afición {2}":
			"거절 시: 감독 {0} · 팀 {1} · 팬 {2}",


		"El club te quiso vender y te plantaste. Después de este año, te lo"
			+ " reconocen: el vestuario te lo devuelve.":
			"클럽이 당신을 팔려 했지만 당신은 버텼어요. 이번 시즌이 끝나고 클럽이 그걸 인정해요. 라커룸이 보답해요.",
		"TENÍAS RAZÓN": "당신이 옳았어요",
		"Te querían vender y dijiste que no. El año te dio la razón, y el"
			+ " club sale a decirlo delante de todos.":
			"클럽이 당신을 팔려 했고 당신은 거절했어요. 시즌이 당신이 옳았음을 증명했고, 클럽은 모두 앞에서 그렇게 말해요.",
		"HAY OTRA MANERA": "다른 방법이 있어요",
		"ENTONCES, PON TÚ": "그럼 당신이 내요",
		"El director deportivo te escucha y no dice que no. Pero el agujero"
			+ " de {0} sigue ahí, y si no sale de tu traspaso tiene que salir de tu"
			+ " contrato. Elige por dónde.":
			"단장은 이야기를 듣고 거절하지 않아요. 하지만 {0}의 재정 구멍은 그대로고, 이적료로 메우지 못하면 당신의 계약에서 메워야 해요. 어디서 낼지 고르세요.",
		"FICHA: {0}/sem": "주급: {0}/주",
		"CLÁUSULA: {0}": "바이아웃: {0}",
		"O te quedas pagándolo tú: el club retira la venta dos temporadas y"
			+ " refuerza en el próximo mercado de verano. Elige por dónde pagas.":
			"아니면 남아서 직접 부담하세요. 클럽은 두 시즌 동안 매각을 철회하고 다음 여름 이적 시장에서 보강해요. 어떻게 낼지 고르세요.",
		"ME BAJO LA FICHA A {0}/sem": "주급을 {0}/주로 삭감",
		"¿TE BAJAS LA FICHA?": "주급을 삭감할까요?",
		"Cobras menos lo que reste de contrato, pero el club retira la venta"
			+ " y refuerza. Sigues libre de salir cuando quieras.":
			"남은 계약 기간 동안 덜 받지만, 클럽은 매각을 철회하고 보강해요. 원할 때 떠날 자유는 그대로예요.",
		"ME SUBO LA CLÁUSULA A {0}": "바이아웃을 {0}까지 인상",
		"¿TE SUBES LA CLÁUSULA?": "바이아웃을 올릴까요?",
		"No cobras menos, pero te blindas: salir de aquí costará mucho más y"
			+ " firmas {0} temporada más.":
			"덜 받진 않지만 묶이게 돼요. 떠나는 비용이 훨씬 커지고 계약이 {0}시즌 늘어나요.",
		"ACEPTO SALIR": "떠날게요",
		"¿ACEPTAS SALIR?": "떠나는 데 동의해요?",
		"El club te ofrecerá a quien pregunte y verás más ofertas. Sigues jugando"
		+ " mientras tanto.":
			"클럽이 문의하는 누구에게든 당신을 내놓고 제안이 더 많이 와요. 그동안은 계속 뛰어요.",
		"ACEPTO": "동의",
		"ME NIEGO": "거절",
		"¿TE NIEGAS A SALIR?": "떠나길 거부해요?",
		"Te quedas, pero el club contaba con ese traspaso: bajan técnico, equipo y"
		+ " afición.":
			"남지만, 클럽은 그 이적료를 믿고 있었어요. 감독, 팀, 팬 모두 떨어져요.",
		"ME QUEDO": "남을게요",
		"EL CLUB TE BUSCA MINUTOS": "클럽이 출전 기회를 찾아 줘요",
		"En {0} no cuentan contigo para jugar y no te lo ocultan: te ofrecen salir"
		+ " CEDIDO una temporada, a un club donde seas titular. Puedes negarte, pero te"
		+ " quedas justo donde no juegas.":
			"{0} 클럽은 당신을 쓸 생각이 없고 숨기지도 않아요. 선발로 뛸 수 있는 클럽으로 한 시즌 임대를 제안해요. 거절할 수 있지만, 그러면 못 뛰는 자리에 그대로 남아요.",
		"Negarte: técnico {0} · equipo {1} · y esta temporada, ni la copa":
			"거절 시: 감독 {0} · 팀 {1} · 이번 시즌엔 컵 대회도 못 뜀",
		"Destino: {0}": "행선지: {0}",
		"ME VOY CEDIDO": "임대 갈게요",
		"¿SALIR CEDIDO?": "임대 갈까요?",
		"Una temporada jugando de titular en un club menor. Vuelves al terminar, y"
		+ " creces más rápido mientras estás fuera.":
			"작은 클럽에서 한 시즌 선발로 뛰어요. 끝나면 돌아오고, 나가 있는 동안 더 빨리 성장해요.",
		"ME VOY": "갈게요",
		"¿TE QUEDAS?": "남을까요?",
		"Seguirás sin jugar y el técnico se lo tomará mal. Esta temporada perderás"
		+ " hasta los partidos de rotación.":
			"계속 못 뛰고 감독은 기분 나빠할 거예요. 이번 시즌엔 로테이션 경기마저 잃어요.",
		"TU CLUB NO TE VENDE": "클럽이 당신을 안 팔아요",
		"Con contrato largo y rindiendo, tu club prefiere retenerte. Puedes forzar la"
		+ " salida, pero el técnico, el vestuario y la afición lo pagarán.":
			"계약 기간이 길고 활약 중이라 클럽은 당신을 붙잡으려 해요. 이적을 강행할 수 있지만 감독, 라커룸, 팬이 대가를 치러요.",
		"PEDIR EL TRASPASO": "이적 요청서 제출",
		"¿PEDIR EL TRASPASO?": "이적 요청서를 낼까요?",
		"Tu club dejará de retenerte, pero el vestuario se lo tomará como una traición:"
		+ " bajan técnico, equipo y afición.":
			"클럽은 더 이상 이적을 막지 않지만 라커룸은 배신으로 받아들여요. 감독, 팀, 팬 모두 떨어져요.",
		"LO PIDO": "요청할게요",
		"Nadie suena por ti todavía. Rinde y hazte ver.":
			"아직 당신과 연결된 클럽이 없어요. 활약해서 눈에 띄세요.",
		"TE SIGUEN": "당신을 주시 중",
		"Rumores de cara a la próxima ventana. Puedes darle pie a uno para que apriete"
		+ " —pero tu vestuario lo notará—.":
			"다음 이적 시장을 앞둔 루머예요. 그중 한 곳에 힘을 실어 줄 수 있지만, 라커룸이 눈치챌 거예요.",
		"Te siguen de cerca": "가까이서 주시 중",
		"Interés serio": "진지한 관심",
		"Suena flojo": "소문 수준",
		"Va {0} de {1} en su liga · {2}": "리그 {1} 중 {0} · {2}",
		"LE DISTE PIE": "신호 보냄",
		"LE DISTE PIE · APRETARÁ EN LA VENTANA":
			"신호 보냄 · 이적 시장에서 밀어붙일 것",
		"MOSTRAR INTERÉS": "관심 표시",
		"¿MOSTRAR INTERÉS EN {0}?": "{0}에 관심 표시?",
		"Le das pie para que apriete en la próxima ventana. Tu vestuario lo nota: bajan"
		+ " un poco técnico, equipo y afición.":
			"다음 이적 시장에서 밀어붙이도록 신호를 줘요. 라커룸이 눈치채요: 감독, 팀, 팬이 조금 떨어져요.",
		"LE DOY PIE": "신호 보낼게요",
		"NO ME INTERESA":
			"관심 없어요",
		"¿DESCARTAR A {0}?":
			"{0} 클럽 제외?",
		"DESCARTAR":
			"제외",
		"Dejas de verlo entre los que te siguen y su sitio lo ocupa otro club interesado. No cuesta nada: todavía no hay ninguna oferta que rechazar. Vuelven a sonar la próxima temporada.":
			"주시 중인 클럽 목록에서 빠지고 다른 관심 클럽이 그 자리를 채워요. 비용은 없어요. 아직 거절할 제안도 없으니까요. 다음 시즌에 다시 관심을 보일 수도 있어요.",
		"TU EX":
			"친정",
		"Volver a un club TUYO es mucho más fácil: allí ya saben quién eres y tu agente entra por la puerta grande.":
			"뛰었던 클럽으로 돌아가는 건 훨씬 쉬워요. 그들은 이미 당신을 알고, 에이전트도 문을 활짝 열고 들어가요.",
		"Ya le diste pie a otro club.": "이미 다른 클럽에 신호를 보냈어요.",
		"CEDIDO": "임대 중",
		"Perteneces a {0}: vuelves al cerrar la temporada.":
			"소속: {0}. 시즌이 끝나면 돌아가요.",
		"¿QUIERES MÁS MINUTOS?": "출전 시간이 더 필요해요?",
		"Puedes pedir salir CEDIDO a un club menor donde juegues de titular. De joven,"
		+ " además, crecerás más rápido jugando.":
			"선발로 뛸 수 있는 작은 클럽으로 임대를 요청할 수 있어요. 어릴 때는 뛰면서 더 빨리 성장해요.",
		"PEDIR SALIR CEDIDO": "임대 요청",
		"¿PEDIR SALIR CEDIDO?": "임대를 요청할까요?",
		"Buscarás minutos en un club menor durante una temporada. El técnico lo nota un"
		+ " poco, pero entiende que quieras jugar.":
			"한 시즌 동안 작은 클럽에서 출전 시간을 찾아요. 감독은 조금 신경 쓰지만, 뛰고 싶은 마음은 이해해요.",



		"PEDISTE SALIR": "이적 요청함",
		"¿QUIERES SALIR?": "떠나고 싶어요?",
		"PEDISTE SALIR CEDIDO": "임대 요청함",
		"TE QUIEREN A PRÉSTAMO": "임대 영입 제안",
		"Tu club no cuenta contigo. Cedido tendrías sitio en el once — y volverías con"
		+ " el crédito que te ganes.":
			"클럽은 당신을 쓸 생각이 없어요. 임대 가면 선발 자리가 있고, 쌓은 신뢰를 안고 돌아올 수 있어요.",
		"Cesión una temporada · misma ficha · TITULAR probable":
			"1시즌 임대 · 같은 주급 · 선발 유력",
		"IRTE CEDIDO": "임대 가기",
		"MANTÉN PARA IRTE CEDIDO": "길게 눌러 임대 가기",
		"¿IRTE CEDIDO A {0}?": "{0}에 임대 갈까요?",
		"Una temporada fuera para jugar de verdad. Tu contrato sigue siendo del club"
		+ " dueño.":
			"제대로 뛰기 위해 한 시즌 떠나요. 계약은 여전히 원소속 클럽에 있어요.",
		"PREGUNTARON POR TI": "당신을 문의했어요",


		"ES TU RIVAL · NO TE LO PERDONARÁN": "라이벌 클럽 · 절대 용서 못 받음",



		"SE ACABÓ EL TIEMPO": "시간 종료",
		"SE ENFRÍAN": "관심 식는 중",
		"NUEVO": "신규",
		"SUBEN EL SUELDO": "주급 인상",


		"TE BAJARON EL SUELDO": "주급 삭감됨",
		"NEGOCIAR TU SUELDO": "주급 협상하기",

		"NEGOCIAR MI SUELDO": "내 주급 협상",
		"YA NEGOCIASTE ESTA TEMPORADA": "이번 시즌 이미 협상함",
		"Ya negociaste tu ficha esta temporada.":
			"이번 시즌엔 이미 주급을 협상했어요.",
		"YA NEGOCIASTE CON ELLOS": "이미 이 클럽과 흥정했어요",
		"YA PAGAN SU TOPE": "이미 상한선까지 줘요",
		"SIN OFERTA": "제안 없음",
		"TE OFRECEN DE SUELDO POR PARTIDO": "경기당 주급 제안",


		"MANTÉN PARA ACEPTAR ${0}": "길게 눌러 ${0} 수락",

		"MANTÉN PARA SALIR CON ${0}": "길게 눌러 ${0} 받고 퇴장",
		"MANTÉN PARA SALIR": "길게 눌러 퇴장",
		"MANTÉN PULSADO": "길게 눌러 확인",
		"RETIRAN LA OFERTA · SE ACABÓ": "제안 철회 · 끝났어요",
		"SE LEVANTAN DE LA MESA · SE ACABÓ": "협상 결렬 · 끝났어요",
		"ESTÁ A PUNTO DE CORTAR · ROMPE EL HIELO O CIERRA":
			"곧 협상 결렬 · 분위기를 풀거나 마무리하세요",
		"Si pides más, pueden subirlo… o bajarlo": "더 요구하면 올려 줄 수도… 내릴 수도 있어요",
		"Pediste {0} vez(ces) · llegaste con ${1}": "인상 요구 {0}회 · 처음 제안 ${1}",
		"TU AGENTE TE MIRA: ES EL MOMENTO": "에이전트의 눈짓: 지금이에요",
		"Lo consultan…": "논의 중…",
		"PODEMOS LLEGAR AHÍ  (+{0})": "거기까지 맞춰 드리죠  (+{0})",
		"ENTONCES REVISAMOS LA OFERTA  (−{0})":
			"그럼 제안을 다시 검토하죠  (−{0})",
		"MEJOR ROL": "더 나은 역할",
		"SE PLANTARON": "버팀",
		"SE RETIRAN": "철회",
		"LO RECHAZASTE": "거절함",
		"NADIE OCUPÓ EL HUECO": "아무도 빈자리 못 채움",
		"VUELVE DE CESIÓN": "임대 복귀",
		"SE QUEDAN AL CEDIDO": "완전 이적 전환",
		"SE FUERON": "떠남",

		"CIERRA": "마감",
		"{0} J": "{0}R",
		"FAMA": "명성",
		"CÓMO TE FICHAN": "클럽이 영입하는 기준",
		"Un club mira cuatro cosas —fama, nivel, forma y PRESTIGIO— y te juzga"
		+ " por la MÁS FLOJA: para que te busque un grande tienes que ser bueno en las"
		+ " cuatro a la vez.\n\nEl PRESTIGIO es lo que hiciste el año pasado: dónde"
		+ " quedaste en el Balón de Oro, o lo más grande que levantaste. Los tres"
		+ " primeros dicen cómo juegas HOY; éste dice de quién se habló en junio, y es"
		+ " el que abre la puerta de los más grandes.\n\nDentro de la ventana, lo que"
		+ " hagas en el campo mueve las ofertas: hay clubes que entran y clubes que se"
		+ " van. Tu agente decide CUÁNTAS de las que existen llegan hasta ti.":
			"클럽은 네 가지(명성, 레벨, 폼, 위상)를 보고 가장 약한 것으로 당신을 평가해요. 빅클럽의 관심을 받으려면 네 가지 모두 동시에 좋아야 해요.\n\n위상은 지난해의 성과예요. 올해의 선수 투표에서 몇 위였는지, 또는 들어 올린 가장 큰 트로피. 앞의 세 가지는 지금 어떻게 뛰는지를 말하고, 위상은 6월에 누가 화제였는지를 말해요. 최고의 빅클럽 문을 여는 건 바로 이것이에요.\n\n이적 시장 동안 경기장에서의 활약이 제안을 바꿔요. 새로 오는 클럽도, 떠나는 클럽도 있어요. 그중 몇 개가 당신에게 닿을지는 에이전트가 정해요.",
		"PRESTIGIO": "위상",
		"Te falta PRESTIGIO: acaba alto en la votación del Jugador del Año o levanta algo.":
			"위상이 부족해요. 올해의 선수 투표에서 높은 순위에 들거나 트로피를 들어 올리세요.",
		"Tu prestigio viene de haber sido {0}º del mundo.":
			"당신의 위상은 세계 {0}위에 올랐던 데서 나와요.",
		"Tu prestigio lo sostiene lo que ganaste: {0}.":
			"당신의 위상은 우승 실적에서 나와요: {0}.",
		"Quedaste {0}º en el Jugador del Año: del {1}º en adelante el puesto ya no cuenta.":
			"올해의 선수 투표 {0}위: {1}위부터는 순위가 반영되지 않아요.",
		"No tienes prestigio: ni entraste en la gala ni levantaste nada.":
			"위상이 없어요. 시상식에도 못 갔고 들어 올린 트로피도 없어요.",
		"TRASPASO SIN PACTAR": "이적료 미합의",
		"Ofrecen {0} · tu club pide {1} · faltan {2}":
			"제안 {0} · 소속 클럽 요구 {1} · 부족 {2}",
		"PELEAN POR TI ({0} MÁS)": "영입 경쟁 ({0}곳 추가)",
		"EJERCEN LA RECOMPRA": "바이백 발동",
		"LO QUE SE GUARDARON": "남겨 둔 조건",
		"{0} se lleva el {1}% de tu próximo traspaso (hoy serían {2}).":
			"{0} 클럽이 다음 이적료의 {1}%를 가져가요 (지금 기준 {2}).",
		"{0} puede recomprarte por {1}{2}.": "{0} 클럽은 {1}에 당신을 되사올 수 있어요{2}.",
		" (ya caducó)": " (만료됨)",
		"AHÍ NO LLEGAS": "닿을 수 없음",
		"DÉJALO": "그만",
		"LLAMA IGUAL": "그래도 연락",
		"En NEGRITA los que hoy te ficharían si tu agente les entra. Los demás puedes"
		+ " pedirlos igual, pero te dirá que no.":
			"굵은 글씨는 에이전트가 연결되면 지금 당장 당신을 영입할 클럽이에요. 나머지도 요청할 순 있지만 빈손으로 돌아올 거예요.",
		"ENTENDIDO": "알겠어요",
		"SE VAN MAÑANA": "내일 떠남",

		"REBAJADO: FIN DE CONTRATO": "할인: 계약 만료 임박",

		"VINO A VERTE": "직접 보러 왔음",
		"TE SIGUE": "주시 중",
		"TE QUIERE": "원함",
		"VA EN SERIO": "진심",
		"Ya elegiste: tu junio tiene dueño. Ningún otro club puede moverte.": "이미 선택했어요. 6월 행선지는 정해졌고 다른 클럽은 당신을 데려갈 수 없어요.",

		"SOLO LIGA Y COPA": "리그와 컵만",

		"NEGOCIAR…": "협상…",

		"PEDIR TRASPASO": "이적 요청",
		"PEDIR CESIÓN": "임대 요청",
		"Pedir el TRASPASO te pone en LISTA DE VENTA: tu club te ofrece a quien"
		+ " pregunte y llegan más ofertas — pero el vestuario lo paga y el técnico"
		+ " te da MENOS minutos mientras no salgas: ya dijiste que te vas.\n\nSi no"
		+ " eres titular, puedes pedir salir CEDIDO a un club menor donde juegues:"
		+ " de joven, además, creces más rápido jugando.":
			"이적을 요청하면 이적 명단에 올라가요. 클럽은 당신을 여기저기 내놓고 제안이 더 많이 오지만, 라커룸이 대가를 치르고 떠날 때까지 감독은 출전 시간을 줄여요. 떠나겠다고 했으니까요.\n\n선발이 아니라면, 뛸 수 있는 작은 클럽으로 임대를 요청할 수 있어요. 어릴 때는 뛰면서 더 빨리 성장해요.",
		"Estás EN LISTA DE VENTA: tu club ya no te retiene y te ofrece a quien"
		+ " pregunte. Cada ventana te trae más ofertas."
		+ " Mientras no salgas, el técnico te da menos minutos.":
			"이적 명단에 올라 있어요. 클럽은 더 이상 당신을 붙잡지 않고 여기저기 내놓아요. 이적 시장마다 제안이 더 와요. 떠날 때까지 감독은 출전 시간을 줄여요.",
		"Te pones EN LISTA DE VENTA: el club deja de retenerte y te ofrece a"
		+ " quien pregunte. El vestuario se lo toma a mal: bajan técnico, equipo y"
		+ " afición. Y mientras no salgas, el técnico te dará MENOS MINUTOS por"
		+ " bien que juegues: ya dijiste que te vas.":
			"이적 명단에 올라가요. 클럽은 더 이상 붙잡지 않고 당신을 여기저기 내놓아요. 라커룸은 안 좋게 받아들여서 감독, 팀, 팬 모두 떨어져요. 그리고 떠날 때까지 아무리 잘 뛰어도 감독은 출전 시간을 줄여요. 떠나겠다고 했으니까요.",

		"DESDE VERANO": "여름부터",

		"BUSCAN DELANTERO": "공격수 구함",

		"PRECIO DE ENERO": "1월 가격",

		"TRAYECTORIA +{0}%": "경력 +{0}%",
		"TROTAMUNDOS −{0}%": "저니맨 −{0}%",

		"YA FICHARON DE TU CLUB ({0})": "내 클럽에서 영입한 적 있음 ({0})",
		"SUELEN FICHAR DE TU LIGA": "내 리그에서 자주 영입",

		"VUELVES A CASA": "고향 복귀",
		"TU EX CLUB": "친정 클럽",

		"VUELVE CEDIDO A CASA": "고향으로 임대 복귀",

		"PAGAN LA CLÁUSULA": "바이아웃 지불",
		"CLÁUSULA DE RESCISIÓN": "바이아웃 조항",

		"TE PREGUNTAN POR EL RUMOR": "루머에 대해 질문받아요",
		"Se sabe que {0} te sigue y la prensa te pone el micro delante. Lo que digas"
		+ " lo oyen todos: tu grada y su despacho.":
			"{0} 클럽이 당신을 주시한다는 소문이 퍼졌고 기자들이 마이크를 들이밀어요. 무슨 말을 하든 모두가 들어요. 당신의 팬도, 그쪽 수뇌부도.",
		"NO ME CIERRO A NADA": "가능성은 열어 둘게요",
		"ESTOY CENTRADO AQUÍ": "여기에 집중할게요",

		"RETIRAR LA PETICIÓN": "요청 철회",
		"¿RETIRAR LA PETICIÓN?": "요청을 철회할까요?",

		"CUMPLE LO DICHO": "약속을 지킴",
		"CONTRADICE LO DICHO": "약속을 어김",
		"DIJISTE: {0}": "당신의 말: {0}",
		"TE COMPROMETE: {0}": "약속: {0}",
		"IR DONDE JUEGUES MÁS": "더 많이 뛸 곳으로",
		"IR A UN CLUB MAYOR": "더 큰 클럽으로",
		"IRTE DE ESTE CLUB": "이 클럽을 떠나기",

		"PIDE SALIR": "이적 요청",
		"{0} pide salir cedido para jugar más": "{0}, 더 뛰기 위해 임대 요청",
		"{0} busca una cesión donde lo vean": "{0}, 눈에 띌 곳으로 임대 희망",

		"NO RENUEVA": "재계약 거부",
		"PRECONTRATO · {0}": "사전 계약 · {0}",
		"EN JUNIO": "6월에",
		"RENUEVA": "재계약",
		"SE VA LIBRE": "자유 이적",
		"PRECONTRATO": "사전 계약",
		"{0} renueva con el {1} hasta {2}": "{0}, {1} 클럽과 {2}까지 재계약",
		"{0} no renovará con el {1}: se va libre en junio": "{0}, {1} 클럽과 재계약 안 해… 6월 자유 이적",
		"{0} firma un precontrato con el {1}": "{0}, {1} 클럽과 사전 계약",
		"{0} pide una cesión: no ve futuro en el {1}": "{0}, 임대 요청… {1}에선 미래가 없다",
		"{0} se ofrece para salir cedido": "{0}, 임대 이적 자청",
		"{0} pide salir del {1}: quiere jugar más":
			"{0}, {1} 떠나길 요청… 더 뛰고 싶다",
		"{0} pide salir del {1} y busca un club mayor":
			"{0}, {1} 떠나 더 큰 클럽 원해",
		"{0} no cree en el proyecto del {1} y pide salir":
			"{0}, {1}의 프로젝트에 불신… 이적 요청",
		"{0} pide salir del {1}": "{0}, {1}에 이적 요청",
		"Dijiste «{0}», y te vas a donde dijiste.":
			"«{0}»라고 했고, 정말 그곳으로 가요.",
		"Dijiste «{0}». Acabas firmando otra cosa.":
			"«{0}»라고 했지만, 결국 다른 계약을 하게 돼요.",

		"¿POR QUÉ TE QUIERES IR?": "왜 떠나고 싶나요?",
		"EL DIRECTOR DEPORTIVO": "단장",
		"BUSCO MÁS MINUTOS": "더 많이 뛰고 싶어요",
		"QUIERO UN CLUB MEJOR": "더 큰 클럽을 원해요",
		"NO CREO EN EL PROYECTO": "프로젝트를 못 믿겠어요",
		"QUIERO JUGAR": "뛰고 싶어요",
		"QUIERO QUE ME VEAN": "주목받고 싶어요",
		"AQUÍ NO TENGO FUTURO": "여기엔 미래가 없어요",
		"ME LO PIENSO": "생각해 볼게요",
		"NADA, OLVÍDELO": "아뇨, 잊어 주세요",
		"YA LO JUEGAS TODO": "이미 다 뛰고 있잖아.",
		"TE BUSCAMOS SITIO.": "자리를 찾아 주지.",
		"PUES QUE PAGUEN LO QUE VALES.": "그럼 네 몸값만큼 내라고 해야지.",
		"AQUÍ NO SE REGALA A NADIE.": "여기선 누구도 공짜로 안 내줘.",
		"EL PROYECTO SIGUE, CONTIGO O SIN TI.": "프로젝트는 계속돼. 너와 함께든 아니든.",
		"NO TE FALTA RAZÓN.": "틀린 말은 아니군.",
		"ME DUELE, PERO TE ENTIENDO. VUELVE MEJOR.": "아프지만 이해해. 더 성장해서 돌아와.",
		"JUEGA FUERA Y A LA VUELTA HABLAMOS.": "가서 뛰고, 돌아오면 얘기하자.",
		"TE BUSCAMOS UN SITIO DONDE JUGAR.": "뛸 곳을 찾아 주지.",
		"AQUÍ TAMBIÉN SE JUEGA SI TE LO GANAS.": "여기서도 실력으로 따내면 뛸 수 있어.",
		"HACES BIEN.": "잘 생각했어.",
		"Antes de ponerte en la lista quiere oírlo de tu boca. Lo que le digas decide a quién llama y cuánto pide por ti.": "명단에 올리기 전에 당신 입으로 직접 듣고 싶어 해요. 당신의 말에 따라 누구에게 연락하고 얼마를 부를지가 정해져요.",
		"{0} te para en el pasillo, junto a la lista. Quiere saber por qué pides salir cedido.": "{0} 단장이 선발 명단 옆 복도에서 당신을 불러 세워요. 왜 임대를 요청하는지 알고 싶어 해요.",
		"EL EQUIPO SE HUNDE": "팀이 가라앉는 중",
		"PELEÁIS ARRIBA": "선두 경쟁 중",
		"ÍDOLO DE LA GRADA": "팬들의 우상",
		"RECIÉN LLEGADO": "새로 온 선수",
		"YA LO DIJISTE ANTES": "전에도 했던 말",
		"HOY NADIE MÁS GRANDE": "오늘은 더 큰 곳 없음",
		"HOY NO PREGUNTA NADIE": "오늘은 문의 없음",
		"SIN DESTINO HOY": "오늘은 행선지 없음",
		"PIDEN {0}": "요구액 {0}",

		"Tu mercado ya no abre esta temporada: podrás pedir salir cuando abra el"
		+ " de verano.":
			"이번 시즌엔 이적 시장이 더 열리지 않아요. 여름 이적 시장이 열리면 이적을 요청할 수 있어요.",
		"Disculpa pública: sales de la lista de venta. La afición se lo cobra, y el"
		+ " técnico tardará un par de partidos en volver a contar contigo — dijiste"
		+ " que te ibas.":
			"공개 사과: 이적 명단에서 빠져요. 팬들은 그 대가를 묻고, 감독은 몇 경기 지나야 다시 당신을 믿어 줄 거예요. 떠나겠다고 했으니까요.",
		"RETIRASTE LA PETICIÓN": "요청 철회함",

		"Sube de la cantera de {0}": "{0} 유스 출신 승격",
		"CANTERA": "유스",

		"LA BOMBA DEL CIERRE": "마감일 깜짝 이적",

		"Opción de compra pactada: $ {0}": "합의된 완전 이적 옵션: $ {0}",
		"EJECUTAN LA OPCIÓN": "완전 이적 옵션 발동",
		"{0} quiere que vuelvas: pide repetir la cesión y puja por ti": "{0} 클럽이 당신을 원해요: 임대 연장을 요청하고 영입 제안도 해요",
		"{0} quiere que vuelvas: pide repetir la cesión": "{0} 클럽이 당신을 원해요: 임대 연장을 요청해요",
		"{0} quiere que vuelvas: intentará comprarte": "{0} 클럽이 당신을 원해요: 영입을 시도할 거예요",
		"{0} quería que volvieras, pero tu club cuenta contigo": "{0} 클럽이 당신을 원했지만, 소속 클럽이 당신을 필요로 해요",
		"{0} ejecuta la opción de compra pactada":
			"{0} 클럽이 합의된 완전 이적 옵션을 발동",

		"ENCARGO AL AGENTE…": "에이전트에게 의뢰…",

		"{0} LIBRES": "남음 {0}",

		"ENCARGOS": "의뢰",
		"CONFIANZA": "신뢰",
		"TU DINERO": "내 돈",
		"CUESTA VESTUARIO": "라커룸 신뢰 하락",
		"La cifra de cada botón es LO QUE TE COBRA por ese encargo, y sale de tu bolsillo al momento. Tienes ${0}.":
			"각 버튼의 금액은 그 의뢰에 에이전트가 받는 수수료로, 즉시 당신 돈에서 나가요. 보유: ${0}.",
		"TU AGENTE": "내 에이전트",
		"MUÉVEME POR EL MERCADO": "시장에 날 알려 줘",
		"BUSCA EN UNA LIGA…": "특정 리그 탐색…",
		"TOCA LA PUERTA DE UN CLUB…": "특정 클럽에 문의…",
		"¿QUÉ LIGA?": "어느 리그?",
		"¿QUÉ CLUB?": "어느 클럽?",
		"TU AGENTE SE MUEVE": "에이전트가 움직여요",
		"LO TRAJO TU AGENTE": "에이전트가 해냈어요",
		"TU AGENTE NO PUDO": "에이전트가 실패했어요",

		"TU MESA ESTÁ LLENA": "협상 테이블이 꽉 찼어요",
		"NO TRAS TU RECHAZO": "거절한 뒤라 불가",
		"FUERA DE TU ALCANCE": "닿을 수 없음",
		"YA ESTABA EN TU MESA": "이미 협상 테이블에 있음",
		"TRAJO A {0}": "영입 제안: {0}",
		"El mercado cierra hoy: ya no hay tiempo para encargos.":
			"이적 시장이 오늘 닫혀요. 의뢰할 시간이 없어요.",
		"Tu agente trabaja la liga de {0}: sus clubes entran primero.":
			"에이전트가 {0} 리그를 공략 중이에요. 그 리그 클럽들이 먼저 와요.",
		"Tu agente está tocando esa puerta: se sabe en la próxima jornada.":
			"에이전트가 그 클럽에 문의 중이에요. 다음 라운드에 알 수 있어요.",
		"Tu agente te está moviendo: esta ventana entran más clubes.":
			"에이전트가 당신을 시장에 알리고 있어요. 이번 이적 시장엔 더 많은 클럽이 와요.",
		"FIRMAR PRECONTRATO": "사전 계약 서명",
		"¿FIRMAR PRECONTRATO CON {0}?": "{0} 클럽과 사전 계약?",
		"Firmas para el VERANO: terminas la temporada aquí y al cierre te vas"
		+ " GRATIS, con tu prima. Tu mercado se cierra este año, no podrás renovar, y"
		+ " el técnico te dará menos minutos: ya sabe que te vas.":
			"여름 이적을 계약해요. 이번 시즌은 여기서 마치고 끝나면 보너스와 함께 자유 이적으로 떠나요. 올해 이적 시장은 닫히고, 재계약은 못 하며, 감독은 출전 시간을 줄여요. 떠날 걸 아니까요.",

		"Te vas a tu RIVAL: la grada no te lo perdona. Técnico −{0}, afición −{1}; cuanto más te quieren, más duele.": "라이벌로 가요. 팬들은 절대 용서하지 않아요. 감독 −{0}, 팬 −{1}. 사랑받을수록 더 아파요.",
		"Te vas a un club de tu LIGA: los tendrás enfrente. Técnico −{0}, afición −{1}.": "같은 리그 클럽으로 가요. 그들과 맞붙게 돼요. 감독 −{0}, 팬 −{1}.",
		"Te vas a otra liga de tu PAÍS. Técnico −{0}, afición −{1}.": "같은 나라의 다른 리그로 가요. 감독 −{0}, 팬 −{1}.",
		"Te vas al EXTRANJERO: se entiende más. Técnico −{0}, afición −{1}.": "해외로 가요. 더 쉽게 받아들여져요. 감독 −{0}, 팬 −{1}.",


		"PRECONTRATO FIRMADO": "사전 계약 완료",
		"PRECONTRATO FIRMADO · TE VAS EN VERANO": "사전 계약 완료 · 여름에 떠나요",
		"Al cerrar la temporada te vas GRATIS a {0}."
		+ " Ya elegiste destino: tu mercado está resuelto y juegas menos"
		+ " mientras tanto.":
			"시즌이 끝나면 자유 이적으로 {0}에 가요. 행선지는 정해졌고 이적 시장은 마무리됐어요. 그동안은 출전이 줄어요.",
		"Se cumple tu precontrato: llegas GRATIS a {0}":
			"사전 계약 발효: 자유 이적으로 {0} 합류",

		"FIRMADO: {0}": "계약: {0}",
		"YA FIRMASTE CON {0}": "{0} 클럽과 계약함",

		"TE CONSIGUE EL PRECONTRATO": "사전 계약 확보",
		"TE GUARDAN EL {0}": "{0} 유지",
		"Ya firmaste con {0}: el técnico cuenta menos contigo.": "이미 {0} 클럽과 계약했어요. 감독이 당신을 덜 써요.",

		"HITO": "우승 실적",
		"SIN HITO": "우승 실적 없음",
		"Tienes nivel de grande: te falta GANAR algo.":
			"빅클럽 수준이에요. 이제 뭔가를 우승하세요.",
		"ABRE": "오픈",
		"EL AÑO QUE VIENE": "다음 시즌",

		"LOS QUE TE SIGUEN": "나를 주시하는 클럽",
		"Clubes que preguntan por ti de cara a la próxima ventana. Puedes darle pie a UNO"
		+ " para que apriete cuando abra: llegará con oferta y su distintivo.\n\nNo sale"
		+ " gratis —el vestuario se entera de que miras fuera— y sólo se puede con un club"
		+ " por ventana.":
			"다음 이적 시장을 앞두고 당신을 문의하는 클럽들이에요. 이적 시장이 열리면 밀어붙이도록 한 곳에 신호를 줄 수 있어요. 제안과 함께 그 클럽의 엠블럼이 붙어서 와요.\n\n공짜는 아니에요. 다른 곳을 본다는 걸 라커룸이 알게 되고, 이적 시장마다 한 클럽만 가능해요.",
		"DE CERCA": "밀착",
		"SERIO": "진지",
		"FLOJO": "미지근",
		"FUERA DE COPA": "컵 탈락",
		"OCTAVOS": "16강",
		"CUARTOS": "8강",
		"SEMIS": "4강",
		"FINAL": "결승",

		"Sin traspaso (agente libre) · prima de fichaje: ${0}":
			"이적료 없음 (FA) · 사이닝 보너스: ${0}",
		"Traspaso: ${0} · tu prima: ${1}": "이적료: ${0} · 내 몫: ${1}",
		"Te esperan como: {0}": "기대 역할: {0}",
		"Se retiran mañana": "내일 철회해요",
		"Aguantan {0} jornadas más": "{0}라운드 더 기다려요",
		"ULTIMATUM: hoy o nunca": "최후통첩: 오늘 아니면 끝",
		"Ahora cobras ${0}/partido · esta oferta {1}%":
			"현재 경기당 ${0} · 이 제안 {1}%",
		"Un club por encima del tuyo": "내 클럽보다 위 클럽",
		"Un club por debajo del tuyo": "내 클럽보다 아래 클럽",
		"Un club a tu nivel": "내 클럽과 같은 수준",
		"FICHAR (LIBRE)": "영입 (자유)",
		"Esperas respuesta a tu {0} (próxima jornada)":
			"{0}에 대한 답변 대기 (다음 라운드)",
		"petición de sueldo": "주급 요청",
		"petición de titular": "선발 요청",
		"Ya negociaste esta oferta: sin más margen.":
			"이미 이 제안은 협상했어요. 더는 여지가 없어요.",
		"PEDIR SER TITULAR": "선발 요구",
		"PEDIR MÁS SUELDO": "주급 인상 요구",
		"TU CLUB NO TE DEJA SALIR": "클럽이 이적을 막고 있어요",
		"FICHAR": "영입",
		"que suban el sueldo": "주급 인상",
		"que te fichen de titular": "선발 보장 영입",
		"¿NEGOCIAR CON {0}?": "{0} 클럽과 협상?",
		"Pides {0}. Responden la próxima jornada: pueden ceder, plantarse o RETIRAR la"
		+ " oferta.":
			"요구 조건: {0}. 다음 라운드에 답이 와요. 양보하거나, 버티거나, 제안을 철회할 수도 있어요.",
		"NEGOCIAR": "협상",
		"NEGOCIACIÓN ABIERTA · RESPONDEN LA PRÓXIMA JORNADA":
			"협상 진행 중 · 다음 라운드에 답변",
		"RECHAZAR": "거절",
		"¿RECHAZAR A {0}?": "{0} 제안 거절?",
		"Se retiran de la puja para siempre en este mercado. Otros clubes pueden ocupar"
		+ " su hueco, pero no hoy: se sabe en la próxima jornada.":
			"이번 이적 시장에서는 영영 손을 떼요. 다른 클럽이 빈자리를 채울 수 있지만 오늘은 아니에요. 다음 라운드에 알 수 있어요.",
		"RECHAZO": "거절할게요",
		"OFERTA RECHAZADA · SE BUSCA OTRO DESTINO":
			"제안 거절 · 다른 행선지 물색 중",
		"¿FICHAR POR {0}?": "{0} 이적?",
		"Te esperan como {0}. Llegas al vestuario desde abajo: el puesto se gana.":
			"역할: {0}. 라커룸 막내부터 시작이에요. 자리는 실력으로 따내야 해요.",
		"FIRMO": "서명",
		"Fichaje libre: sin traspaso, con prima de ${0}. Te esperan como {1}; el puesto"
		+ " se gana.":
			"자유 이적: 이적료 없음, 사이닝 보너스 ${0}. 역할: {1}. 자리는 실력으로 따내야 해요.",

		"ELIGE TU DORSAL": "등번호 선택",
		"HAY DORSAL LIBRE": "빈 등번호 있음",
		"Te fichan como un acontecimiento y el club te deja elegir. Llevas el {0}, pero"
		+ " la camiseta que quieras es tuya.":
			"초대형 영입으로 대접받아 클럽이 등번호를 고르게 해 줘요. 지금은 {0}번이지만, 원하는 번호를 가져도 돼요.",
		"Se cerró el mercado y el club repasa los números. Llevas el {0}, y este año hay"
		+ " camiseta libre si la quieres.":
			"이적 시장이 닫히고 클럽이 번호를 정리해요. 지금은 {0}번이고, 올해는 원하면 빈 번호가 있어요.",
		"PONERME EL {0}": "{0}번 달기",
		"SEGUIR CON EL {0}": "{0}번 유지",
		"ELIGE OTRO": "다른 번호",
		"TU DORSAL EN EL CLUB": "클럽 내 등번호",
		"RENUEVAS: TU DORSAL": "재계약: 내 등번호",
		"Llegas nuevo y el club te deja escoger número. Llevas el {0}; si prefieres otro de los que están libres, es tuyo.": "새로 온 선수에게 클럽이 번호를 고르게 해 줘요. 지금은 {0}번이에요. 빈 번호 중 다른 게 좋으면 가져가세요.",
		"Firmas con el club y aprovechas para repasar tu número. Llevas el {0}; si quieres otro de los que están libres, cámbialo.": "클럽과 계약하면서 번호도 다시 살펴봐요. 지금은 {0}번이에요. 빈 번호 중 다른 게 좋으면 바꾸세요.",
		"ELIGE TU NÚMERO": "번호 선택",
		"Te pones el {0}.": "{0}번을 달아요.",
		"Sigues con el {0}.": "{0}번을 유지해요.",
		"BOTAS": "축구화",
		"OFERTA DE LA JORNADA": "라운드 특가",
		"OFERTA": "할인",
		"ANTES ${0}": "정가 ${0}",
		"Sólo estética: pintan tus botas en el partido y en las escenas, y no cambian sus bonos. Se ponen en TIENDA, en BOTAS.": "외형 전용: 경기와 장면에서 축구화 색만 바뀌고 보너스는 그대로예요. 상점의 축구화에서 착용하세요.",
		"+ {0} PUNTOS": "+ {0} 포인트",
		"Sólo color, no da bonos. Es tuya hasta que empieces otra carrera.": "색만 바뀌고 보너스는 없어요. 새 커리어를 시작할 때까지 내 거예요.",
		"PINTA TUS BOTAS": "축구화 색칠",
		"YA LA TIENES: SE PONE EN TIENDA, EN BOTAS": "보유 중: 상점 > 축구화에서 착용",
		"SE PONE EN TIENDA, EN BOTAS": "상점 > 축구화에서 착용",
		"Tus botas estrenan la {0}.": "축구화에 {0} 적용 완료.",
		"TUS EDICIONES": "내 에디션",
		"SIN EDICIÓN": "에디션 없음",
		"EDICIÓN DEBUT": "데뷔 에디션",
		"EDICIÓN ASCENSO": "승격 에디션",
		"EDICIÓN ORO": "골드 에디션",
		"EDICIÓN NOCHE": "나이트 에디션",
		"EDICIÓN FUEGO": "파이어 에디션",
		"EDICIÓN HIELO": "아이스 에디션",
		"EDICIÓN NEÓN": "네온 에디션",
		"PACK DEBUT": "데뷔 팩",
		"PACK ASCENSO": "승격 팩",
		"PACK JUGADOR DEL AÑO": "톱 플레이어 팩",
		"EL QUE MÁS RINDE": "최고 가성비",
		"ALCANZA": "충분",
		"ALCANZA PARA {0}": "{0}까지 가능",
		"TE ALCANZARÍA PARA: {0}": "살 수 있는 것: {0}",
		"QUEDARÍAS CON ${0}": "남는 돈 ${0}",
		"QUEDARÍAS CON {0} PUNTOS": "남는 포인트 {0}",
		"QUEDARÍAS CON ${0} Y {1} PUNTOS": "남는 돈 ${0}, 포인트 {1}",
		"TUS HABILIDADES ESTÁN AL MÁXIMO: ENTRARÍAN COMO ≈{0} XP": "능력이 최대치예요: 약 ≈{0} XP로 들어가요",
		"TE FALTAN ${0} PARA {1}": "{1}까지 ${0} 부족",
		"YA TE ALCANZA PARA {0}": "이제 {0} 가능",
		"VOLVER A {0}": "뒤로: {0}",
		"REPARTIR PUNTOS": "포인트 분배",
		"PERSONAL": "스태프",
		"PARA EL CUERPO": "몸 관리",
		"PARA EL VESTUARIO": "라커룸용",
		"TU CUERPO TÉCNICO": "내 코칭 스태프",
		"ROPA": "의류",
		"LUJOS": "사치품",
		"PELUQUERÍA": "이발소",
		"Cortes y barbas de autor. Los de siempre siguen gratis en ASPECTO.": "디자이너 헤어와 수염. 기본 스타일은 외모에서 계속 무료예요.",
		"VER MARCAS": "브랜드 보기",
		"PONÉRTELO": "착용",
		"TU PUESTO: {0}º · {1} · {2}%": "내 순위: {0}위 · {1} · {2}%",
		"{0} % POR TU GRADA": "팬 덕분 {0}%",
		"TE LLEVA: {0}": "에이전트: {0}",
		"LLEVAS PUESTAS": "착용 중",
		"VS LAS TUYAS": "내 것과 비교",
		"LO MISMO": "동일",
		"DURA {0} MÁS": "{0} 더 오래감",
		"DURA {0} MENOS": "{0} 덜 감",
		"USA LO QUE TIENES": "가진 걸로",

		"POTENCIA": "파워",
		"EFECTO": "회전",
		"${1} POR PARTIDO · DURA {0}": "경기당 ${1} · {0} 지속",
		"CON TU NETO DE HOY NO LLEGAS": "지금 실수령액으론 부족",
		"TE FALTAN {0} · {1}": "{0} 남음 · {1}",
		"EL MÁS CERCA": "가장 근접",
		"SIN MANTENIMIENTO": "유지비 없음",
		"SE ESTRENA AL COMPRAR · ROTA, VUELVE EN {0}": "구매 즉시 착용 · 고장 시 {0} 후 복귀",
		"COMISIÓN {0}% · HOY {1}%": "수수료 {0}% · 현재 {1}%",
		"SOBRE TU SUELDO: {0} / PARTIDO": "내 주급 기준: 경기당 {0}",
		"PARA SIEMPRE · SIN MANTENIMIENTO": "영구 · 유지비 없음",
		"VER EN CASA": "집에서 보기",
		"MIENTRAS SIGAS AQUÍ · TE QUEDAN {0} {1}": "재적 중 · {0} {1} 남음",
		"TU CARTERA": "내 지갑",
		"{0} PUNTOS LIBRES": "남은 포인트 {0}",
		"TOCA UNA BOTA PARA PROBÁRTELA": "축구화를 눌러 착용해 보세요",
		"TU TREN DE VIDA": "내 라이프스타일",
		"TOCA UNA FICHA PARA ELEGIRLA": "카드를 눌러 선택",
		"TU PERSONAL": "내 스태프",
		"TIENES {0} DE {1}": "{1}개 중 {0}개 보유",
		"TU MERCH": "내 굿즈",
		"NO TIENES NADA GUARDADO": "보관함이 비었어요",
		"LO QUE CAMBIA": "변화",
		"PAGAS ${0} · TE QUEDAN ${1}": "결제 ${0} · 잔액 ${1}",
		"HOY NO SIRVE: {0}": "오늘은 소용없음: {0}",
		"-{0}% HOY": "오늘 -{0}%",
		"ABRIENDO": "여는 중",
		"APP STORE": "APP STORE",
		"CONSUMO": "소모품",
		"Lo que compras aquí te mejora MIENTRAS SIGAS EN ESTE CLUB. Si fichas por otro, se queda con este escudo.": "여기서 산 건 이 클럽에 있는 동안만 효과가 있어요. 다른 클럽으로 가면 이 엠블럼과 함께 남아요.",
		"El escudo en la cabeza, todos los días. Lo más barato que dice de qué eres.": "매일 머리에 쓰는 엠블럼. 어느 팀 팬인지 가장 싸게 보여 주는 방법이에요.",
		"La que se levanta en el himno. Mientras juegues aquí, la grada te la reconoce.": "국가가 울릴 때 높이 드는 그것. 여기서 뛰는 동안 관중석이 알아봐요.",
		"El del año, con el sello del club. Lo usas a diario y llegas algo más entero.": "클럽 로고가 박힌 올해 공. 매일 쓰면 컨디션이 조금 더 좋아져요.",
		"La de este año, con tu dorsal. Sales con ella y la prensa lo nota.": "내 등번호가 새겨진 올해 유니폼. 입고 나가면 언론이 주목해요.",
		"TIENDA DEL CLUB": "클럽 스토어",
		"En primera, la tienda saca además la playera firmada de la vitrina.": "1부에서는 진열장의 사인 유니폼도 판매해요.",
		"GORRA DEL CLUB": "클럽 모자",
		"BUFANDA DEL CLUB": "클럽 머플러",
		"BALÓN OFICIAL": "공식 공",
		"PLAYERA DE LA TEMPORADA": "시즌 유니폼",
		"PLAYERA FIRMADA": "사인 유니폼",
		"La de la vitrina, firmada por la plantilla. Sólo en primera.": "진열장에 있는 그것, 스쿼드 전원의 사인이 있어요. 1부 전용.",
		"ESTILO": "스타일",
		"INVERSION": "투자",
		"Toca una bota para probártela en el espejo.":
			"축구화를 눌러 거울 앞에서 신어 보세요.",
		"Llevas ahorrado el {0}%.": "{0}% 모았어요.",
		"EN USO": "사용 중",
		"EQUIPAR": "장착",
		"CON TUS BOTAS": "내 축구화로",
		"VIDA {0}%  ·  se gastan al jugar": "수명 {0}%  ·  경기마다 닳아요",
		"SIN DESGASTE  ·  las de pago dan más": "마모 없음  ·  유료가 더 좋아요",
		"EN USO · {0}%": "사용 중 · {0}%",
		"Se te acabaron tus {0}. Toca otras para reponerlas.":
			"{0} 다 닳았어요. 다른 걸 눌러 교체하세요.",
		"Tu fama interesó a {0}. Míralo en PATROCINIOS.":
			"내 명성이 {0}의 눈에 띄었어요. 스폰서에서 확인하세요.",
		"CONSUMIBLES": "소모품",
		"ESTILO DE VIDA": "라이프스타일",
		"DINERO PARADO": "놀고 있는 돈",
		"NÓMINA": "급여",
		"INGRESOS": "수입",
		"DESCUENTOS": "공제",
		"VER DESGLOSE": "내역 보기",
		"OCULTAR DESGLOSE": "내역 숨기기",
		"PRIMA DE RESULTADO": "결과 보너스",
		"PRIMA POR GOL": "골 보너스",
		"PRIMA POR ASISTENCIA": "도움 보너스",
		"PATROCINIO": "스폰서",
		"COMISIÓN DEL AGENTE": "에이전트 수수료",
		"CÁMARA ROTA": "카메라 파손",
		"BALÓN A LA GRADA": "관중석으로 공",



		"BALÓN A LA CALLE": "길거리로 공",
		"RECOGEPELOTAS DERRIBADO": "볼보이 넘어뜨림",
		"CRISTAL DEL PALCO": "귀빈석 유리",
		"EN NÚMEROS ROJOS": "적자",
		"ficha $ {0} / partido": "주급 $ {0} / 경기",
		"ficha $ {0} − gastos $ {1}": "주급 $ {0} − 지출 $ {1}",
		"Te miden como {0}": "평가 기준: {0}",
		"Juega {0} partidos  (llevas {1})": "{0}경기 출전  (현재 {1})",
		"Promedia {0} de nota  (llevas {1})": "평균 평점 {0}  (현재 {1})",
		"Te hacen famoso, pero casi todo le sienta mal al técnico o al vestuario.":
			"유명해지긴 하지만, 대부분 감독이나 라커룸이 싫어해요.",
		"TUYO": "내 것",
		"ESTÉTICA": "외형",
		"Lo único que se compra y SE VE: te cambia de verdad en el hub, en la previa y"
		+ " en la cancha. No da ventaja ninguna, y por eso mismo es tuyo elegirlo. Los"
		+ " cortes y barbas de siempre siguen siendo gratis en PERSONALIZAR.":
			"사는 것 중 유일하게 눈에 보이는 거예요. 허브, 경기 전, 그라운드에서 진짜로 모습이 바뀌어요. 아무런 이점도 없기에 선택은 온전히 내 몫이에요. 기본 헤어와 수염은 꾸미기에서 계속 무료예요.",
		"INVERSIONES": "투자",
		"Para cuando el dinero sobra: mejoran tu cuerpo o tu bolsillo, para siempre y sin mantenimiento.":
			"돈이 더는 문제가 아닐 때: 몸이나 지갑을 영구히, 유지비 없이 업그레이드해 줘요.",
		"PONER": "착용",
		"TE QUEDA BIEN": "잘 어울려요",
		"LOGRO: {0}": "업적: {0}",
		"MANTENIMIENTO  -${0} / PARTIDO": "유지비  경기당 -${0}",
		"USAR": "사용",
		"Tu míster. Convéncelo en la cancha.": "내 감독이에요. 그라운드에서 설득하세요.",
		"Decide si juegas y cuántos minutos.":
			"출전 여부와 출전 시간을 정해요.",
		"Decide si el balón te llega.": "공이 나한테 올지 정해요.",
		"Sube tu valor y abre las puertas de las marcas.":
			"몸값을 올리고 브랜드의 문을 열어 줘요.",
		"Tu fama: qué marcas te buscan y qué clubes se fijan en ti.":
			"내 명성: 어떤 브랜드가 찾고, 어떤 클럽이 주목하는지.",
		"Cuántas ofertas ves, la ficha que te sacan (hasta +15%) y qué tan bien regateas.":
			"보이는 제안 수, 짜내는 주급(최대 +15%), 그리고 협상 실력.",
		"Patrocinadores": "스폰서",
		"Cómo vas con los objetivos de tus marcas.":
			"브랜드 목표 달성 현황.",
		"TUS MARCAS · {0} DE {1}": "내 브랜드 · {1}개 중 {0}개",
		"Ninguna todavía. Sal en la prensa y vendrán solas.":
			"아직 없어요. 언론에 나오면 알아서 찾아와요.",
		"TE BUSCAN": "러브콜",
		"La temporada ya está en marcha: las marcas cerraron sus contratos en"
		+ " pretemporada. Vuelven a buscarte cuando empiece la siguiente.":
			"시즌이 이미 시작됐어요. 브랜드들은 프리시즌에 계약을 마쳤어요. 다음 시즌이 시작되면 다시 찾아와요.",
		"Nadie por ahora. La prensa manda aquí.": "아직 아무도 없어요. 여기선 언론이 좌우해요.",
		"PRETEMPORADA: es ahora o el año que viene. En cuanto juegues la primera"
		+ " jornada se cierra, y lo que no firmes ya no vuelve esta temporada.":
			"프리시즌: 지금 아니면 내년이에요. 첫 라운드를 치르는 순간 마감되고, 서명하지 않은 건 이번 시즌에 다시 오지 않아요.",
		"OBJETIVO: {0}": "목표: {0}",
		"SIN HUECO": "자리 없음",
		"FIRMAR": "서명",
		"{0}  ({1}/{2})  ·  premio ${3}": "{0}  ({1}/{2})  ·  보너스 ${3}",
		"{0}  ({1})  ·  premio ${2}": "{0}  ({1})  ·  보너스 ${2}",
		"Se cobra al final de la temporada.": "시즌 종료 시 지급돼요.",
		"ROMPER": "파기",
		"¿ROMPER CON {0}?": "{0} 계약 파기?",
		"Pierdes el contrato, su pago por partido y el premio del objetivo. No vuelve.":
			"계약, 경기당 수당, 목표 보너스를 모두 잃어요. 다시 오지 않아요.",
		"TUS PATROCINADORES": "내 스폰서",
		"SIN MARCAS": "브랜드 없음",
		"{0}/{1} OBJETIVOS": "목표 {0}/{1}",
		"Desde el banquillo no cobras: sólo cuentan (y se pagan) las jornadas de {0}' o más.":
			"벤치에선 수당이 없어요. {0}' 이상 뛴 라운드만 인정(및 지급)돼요.",
		"Te perdonan parte del objetivo por las {0} jornadas que te perdiste lesionado (firmaste {1}).":
			"부상으로 빠진 {0}라운드만큼 목표를 일부 줄여 줘요({1} 기준 계약).",
		"Te piden menos jornadas por las {0} que te perdiste lesionado. La media no baja.":
			"부상으로 빠진 {0}라운드만큼 요구 라운드를 줄여 줘요. 평균 평점은 그대로예요.",
		"{0} no te llama: le fallaste. Le quedan {1} temporada(s) de enfado.":
			"{0}에게서 연락이 없어요. 실망시켰거든요. 앞으로 {1}시즌 더 삐져 있을 거예요.",
		"INDEMNIZACIÓN: ${0} de lo que ya te pagaron.":
			"위약금: 이미 받은 돈 중 ${0}.",
		"ROMPO EL CONTRATO": "계약 파기할게요",
		"CLASIFICACIÓN · {0}": "순위표 · {0}",
		"{0} (TÚ)": "{0} (나)",
		"{0} PTS ({1} PJ)": "{0}점 ({1}경기)",
		"— objetivo del club: {0} —": "— 클럽 목표: {0} —",
		"TU GRUPO": "내 조",
		"TU CUADRO": "내 대진표",
		"¡CAMPEÓN!": "우승!",
		"Eliminado": "탈락",
		"Fuera en la fase de grupos": "조별 리그 탈락",
		"Fuera en la fase de liga": "리그 페이즈 탈락",
		"No la juegas esta temporada — así va en el mundo.":
			"이번 시즌엔 출전하지 않아요 — 세계 판도는 이래요.",
		"Tu club no está esta temporada — así va en el mundo.":
			"이번 시즌 내 클럽은 불참해요 — 세계 판도는 이래요.",
		"Sin campo europeo esta temporada.": "이번 시즌엔 유럽 대항전이 없어요.",
		"CAMPEÓN: {0}": "우승: {0}",
		"ACTIVO": "진행 중",
		"No la juegas esta temporada — mira su carrera de goleo.":
			"이번 시즌엔 출전하지 않아요 — 득점 경쟁을 확인하세요.",
		"COPA NACIONAL": "국내 컵",
		"Aún no arranca.": "아직 시작 전이에요.",
		"¡CAMPEÓN DE COPA!": "컵 우승!",




		"¡CAMPEÓN DE LIGA!": "리그 우승!",
		"¡CAMPEÓN DE COPA DE CAMPEONES!": "엘리트컵 우승!",
		"¡CAMPEÓN DE COPA EUROPA!": "유로파컵 우승!",
		"¡CAMPEÓN DE COPA CONFERENCIA!": "챌린지컵 우승!",
		"Fase final de Copa de Campeones": "엘리트컵 토너먼트",
		"Fase final de Copa Europa": "유로파컵 토너먼트",
		"Fase final de Copa Conferencia": "챌린지컵 토너먼트",
		"Clasificado a Copa de Campeones": "엘리트컵 진출",
		"Clasificado a Copa Europa": "유로파컵 진출",
		"Clasificado a Copa Conferencia": "챌린지컵 진출",
		"Eliminado de la Copa": "컵 탈락",
		"A eliminatoria directa: sin tabla de goleadores.":
			"단판 토너먼트: 득점 순위 없음.",
		"MUNDIAL DE CLUBES": "클럽 세계 대회",
		"Contra los mejores clubes de otras confederaciones.":
			"다른 대륙 연맹 최강 클럽들과 맞붙어요.",
		"¡CAMPEÓN DEL MUNDO DE CLUBES!": "클럽 세계 챔피언!",
		"Eliminado del Mundial de Clubes": "클럽 세계 대회 탈락",
		"Aún sin nacionalidad.": "아직 국적이 없어요.",
		"El Mundial se juega cada {0} temporadas; quedar entre los {1} primeros del"
		+ " grupo clasifica.":
			"세계 대회는 {0}시즌마다 열려요. 조 상위 {1}위 안에 들면 진출해요.",
		"Sin datos de esta competición todavía.": "아직 이 대회 데이터가 없어요.",
		"TOP 10 · GOLEO": "TOP 10 · 득점",
		"TOP 10 · ASISTENCIAS": "TOP 10 · 도움",
		"TOP 10 · MEDIA": "TOP 10 · 평점",
		"{0} {1} · vs": "{0} {1} · vs",
		"Por definir": "미정",
		"Por definir.": "미정.",
		"Fase de grupos": "조별 리그",


		"Fase de liga": "리그 페이즈",



		"EL SORTEO": "조 추첨",


		"GRUPO DE LA MUERTE": "죽음의 조",


		"EL MUNDIAL ES ESTE AÑO": "올해 세계 대회 개최",
		"EL MUNDIAL ES EL AÑO QUE VIENE": "내년 세계 대회 개최",
		"MUNDIAL EN {0} TEMPORADAS": "{0}시즌 후 세계 대회",
		"Lo juegas con {0} años.": "{0}세에 출전해요.",
		"Llegarás con {0} años.": "{0}세에 맞이해요.",
		"No llegarás: a esa edad ya estarás retirado.": "못 나가요: 그때는 이미 은퇴했을 거예요.",
		"TUS RIVALES": "상대 팀",
		"{0} EN CASA · {1} FUERA": "홈 {0} · 원정 {1}",
		"Los mismos que verás en tu calendario.":
			"일정표에서 보게 될 팀들이에요.",
		"FASE DE LIGA": "리그 페이즈",
		"TÚ": "나",
		"{0}. {1}  {2} PTS ({3} PJ)": "{0}. {1}  {2}점 ({3}경기)",
		"Aún no arranca": "아직 시작 전",
		"¡Campeón de Copa!": "컵 우승!",
		"En {0}": "{0} 진행 중",
		"En juego": "진행 중",
		"¡Campeón de Copa de Campeones!": "엘리트컵 우승!",
		"Fase final": "토너먼트",
		"OCTAVOS DE FINAL": "16강",
		"CUARTOS DE FINAL": "8강",
		"SEMIFINAL": "준결승",



		"Playoff": "플레이오프",
		"PLAYOFF": "플레이오프",
		"Octavos": "16강",
		"Cuartos": "8강",
		"Semifinal": "준결승",
		"Final": "결승",
		"LEYENDAS DEL MUNDO": "세계의 레전드",
		"TABLEROS MUNDIALES": "세계 순위표",
		"Arriba, las leyendas de tu partida. Aquí, jugadores reales de todo el mundo: tu mejor carrera se manda al cerrar cada temporada.": "위는 내 세이브의 레전드. 여기는 전 세계 실제 플레이어들이에요. 시즌이 끝날 때마다 내 최고 커리어가 등록돼요.",
		"VER EN GAME CENTER": "GAME CENTER에서 보기",
		"FORTUNA": "재산",
		"LOGROS EN GAME CENTER": "GAME CENTER 업적",
		"Arriba, tu catálogo completo. En Game Center, los que Apple conoce: se mandan solos al desbloquearse, y ahí se ve cuántos jugadores del mundo tienen cada medalla.": "위는 내 전체 목록. Game Center에는 Apple이 아는 업적만 있어요. 달성하면 자동으로 전송되고, 거기서 전 세계 몇 명이 각 메달을 가졌는지 볼 수 있어요.",
		"TOP {0}": "TOP {0}",
		"MÁS TROFEOS INDIVIDUALES": "개인 트로피 최다",
		"MÁS TROFEOS DE EQUIPO": "팀 트로피 최다",
		"MÁS TROFEOS EN TOTAL": "통산 트로피 최다",
		"Los premios que se ganan uno solo: el mejor del año y las botas de goleo.":
			"혼자 받는 상: 올해의 선수와 득점왕.",
		"Ligas, copas, continentales y Mundiales: lo que se levanta con once.":
			"리그, 컵, 대륙 대회, 세계 대회: 11명이 함께 드는 트로피.",
		"La vitrina entera, sin preguntar de dónde salió cada trofeo.":
			"진열장 전체, 어디서 온 트로피인지는 묻지 않아요.",
		"LEYENDAS POR LIGA": "리그별 레전드",
		"LEYENDAS POR CLUB": "클럽별 레전드",
		"No ha habido leyendas en {0}… aún.": "{0}에는 레전드가 없었어요… 아직은.",
		"este club": "이 클럽",
		"INDIV.": "개인",
		"EQUIPO": "팀",
		"GOLES + ASISTENCIAS": "골 + 도움",
		"LA LEYENDA A TIRO": "레전드 사정권",
		"A {0} DE LA LEYENDA": "레전드까지 {0}",
		"IGUALADO CON LA LEYENDA": "레전드와 동률",
		"Máximos productores de la historia (G+A). Sólo cuenta lo hecho en 1ª división"
		+ " o con tu selección: es lo que mide a los grandes.":
			"역대 최다 공격 포인트(G+A). 1부와 국가대표 기록만 인정돼요. 그게 위대함의 척도예요.",
		"TU PRODUCCIÓN · POR CATEGORÍA": "내 기록 · 등급별",
		"ÉLITE (1ª + SELECCIÓN)": "엘리트 (1부 + 대표팀)",
		"TOTAL (TODAS LAS CATEGORÍAS)": "합계 (전체 등급)",
		"La diferencia ({0} G · {1} A) es lo hecho en 2ª y 3ª división.":
			"차이({0} G · {1} A)는 2부와 3부에서 올린 기록이에요.",
		"Balón de Oro": "올해의 선수",
		"Goleo": "득점왕",
		"Ligas": "리그",
		"Copas": "컵",
		"Continental": "대륙 대회",
		"Mundial": "세계 대회",
		"LOS MÁS LAUREADOS DEL MUNDO": "세계 최다 수상자",
		"CLUBES · {0}": "클럽 · {0}",


		"TE QUIEREN": "영입 희망",
		"TE MIRA": "주시 중",
		"NADIE": "없음",
		"1 CLUB": "1곳",
		"Hoy ningún club te ficharía a tu nivel. Rinde y sube tu valor para que empiecen a mirarte.": "지금 실력으론 영입할 클럽이 없어요. 활약해서 몸값을 올리면 관심을 보이기 시작해요.",
		"{0} CLUBES": "{0}곳",
		"CLUB": "클럽",
		"INTERNACIONALIDADES": "A매치",
		"GOLES": "골",
		"{0} · TEMPORADA {1}{2}": "{0} · 시즌 {1}{2}",
		"no convocado": "미소집",
		"RUMBO AL MUNDIAL": "세계 대회로 가는 길",
		"El Mundial se juega cada 4 temporadas. Quedar entre los {0} primeros de tu"
		+ " grupo clasifica.":
			"세계 대회는 4시즌마다 열려요. 조 상위 {0}위 안에 들면 진출해요.",
		"HISTORIAL": "전적",
		"Aún no has cerrado una temporada con la selección.":
			"아직 대표팀에서 시즌을 마친 적이 없어요.",
		"T{0} · {1}": "S{0} · {1}",
		"SELECCIÓN DE {0}": "{0} 대표팀",
		"FUERA DE LA CONVOCATORIA": "소집 명단 제외",
		"SIN DORSAL": "등번호 없음",
		"VER CONVOCATORIA": "소집 명단 보기",





		"PTS": "승점",
		"A {0} PUESTOS": "{0}계단 차이",
		"PUESTO {0}": "순위 {0}",
		"Tu media es {0}. Con la vara de {1} son {2}; {3} de fama y {4} de mérito la dejan en {5}.":
			"내 능력치는 {0}. {1}의 기준으론 {2}점이고, 명성 {3}점과 공적 {4}점을 더해 {5}점이 돼요.",
		"CORTE LISTA": "명단 기준",
		"CORTE ONCE": "선발 기준",


		"Eres el número {0} de {1} por puntuación, pero el sitio que ocuparías es el de {2} ({3}): a nadie que te saque más de {4} se le quita el puesto. Necesitas {5}.":
			"점수로는 {1}에서 {0}위지만, 들어갈 자리는 {2} 선수({3})의 자리예요. 나보다 {4}점 넘게 앞선 선수는 자리를 내주지 않아요. {5}점이 필요해요.",
		"Entras en la lista, pero no en el once: el sitio que ocuparías es el de {0} ({1}) y a nadie que te saque más de {2} se le quita el puesto. Necesitas {3}.":
			"명단엔 들었지만 선발 11명엔 못 들어요. 들어갈 자리는 {0} 선수({1})의 자리이고, 나보다 {2}점 넘게 앞선 선수는 자리를 내주지 않아요. {3}점이 필요해요.",

		"Lo que más te acerca: ganarte al seleccionador en la concentración (hasta {0}), un título individual (hasta {1}) y tu temporada de club (hasta {2}).":
			"가장 효과가 큰 것: 대표팀 소집 때 감독의 마음 얻기(최대 {0}), 개인상(최대 {1}), 그리고 클럽 시즌 성적(최대 {2}).",




		"Tu puntuación ya es {0} y hoy daría para entrar, pero la lista de esta campaña se cerró antes de que llegaras: el seleccionador no la rehace a mitad de camino. Tu sitio se juega en la próxima.":
			"점수가 이제 {0}점이라 오늘이라면 들어갈 수 있지만, 이번 대회 명단은 그 전에 발표됐어요. 감독은 중간에 명단을 다시 짜지 않아요. 다음 대회에서 자리를 노리세요.",
		"Sigues en la lista de esta campaña: al seleccionador no le gusta cortar a nadie a mitad de camino. Pero tu puntuación cayó a {0} y el corte está en {1}: si no reaccionas, la próxima lista se hace sin ti.":
			"이번 대회 명단엔 아직 있어요. 감독은 중간에 누굴 빼는 걸 싫어하거든요. 하지만 점수가 {0}점으로 떨어졌고 커트라인은 {1}점이에요. 반등하지 못하면 다음 명단은 나 없이 발표돼요.",

		"Debut: {0} años": "데뷔: {0}세",
		"Temporada {0}": "{0}시즌",
		"marcaste": "득점",
		"RETIRADO DE LA SELECCIÓN": "대표팀 은퇴",
		"RETIRARTE DE LA SELECCIÓN": "대표팀 은퇴하기",
		"YA NO ENTRAS EN LA LISTA": "명단 제외",
		"GOLEADORES HISTÓRICOS": "역대 득점자",
		"¿CUELGAS LA CAMISETA DE TU PAÍS?": "대표팀 유니폼을 벗을까요?",
		"El seleccionador ya no cuenta contigo. Tus {0} partidos y {1} goles quedan sellados, y las fechas de selecciones dejan de costarte energía. Sólo un Mundial podría hacerte volver.": "대표팀 감독은 더 이상 나를 부르지 않아요. A매치 {0}경기와 {1}골은 기록으로 남고, A매치 기간에 에너지를 쓰지 않아도 돼요. 세계 대회만이 다시 불러낼 수 있어요.",

		"Colgaste la camiseta de {0}. Sus torneos siguen en tu calendario, pero"
		+ " los ves desde fuera.":
			"{0} 대표팀 유니폼을 벗었어요. 대회는 일정표에 남지만, 밖에서 지켜보게 돼요.",
		"VOLVER PARA EL MUNDIAL": "세계 대회로 복귀",
		"¿VUELVES DEL RETIRO?": "대표팀 은퇴 번복?",
		"{0} juega el Mundial y el seleccionador te quiere en la lista. Volver es volver de verdad: las fechas de selecciones vuelven a contar contigo.": "{0} 대표팀이 세계 대회에 나가고, 감독이 나를 명단에 원해요. 복귀는 진짜 복귀예요. 모든 A매치 기간에 다시 소집돼요.",
		"VUELVO": "복귀할게요",
		"{0} JUGADORES": "{0}명",
		"Grupo por definir.": "조 미정.",
		"{0}. {1}  {2} PTS ({3})": "{0}. {1}  {2}점 ({3})",
		"— corte de clasificación —": "— 진출 커트라인 —",
		"Ahora mismo: {0}": "현재: {0}",
		"CLASIFICADA": "진출 확정",
		"fuera del Mundial": "세계 대회 탈락",
		"fuera de {0}": "{0} 탈락",
		"Cuadro por definir.": "대진 미정.",
		"{0} no está en {1}.": "{0}, {1} 불참.",
		"Clasifícala la próxima vez quedando entre los tres primeros de tu grupo.":
			"다음엔 조 3위 안에 들어 진출하세요.",
		"¡{0}, CAMPEÓN de {1}!": "{0}, {1} 우승!",
		"Proyección de {0}: {1}": "{0} 예상 성적: {1}",
		"{0} selecciones en el cuadro. Tu papel en el club mueve la aguja: rinde y"
		+ " llévala lejos.":
			"대진표에 {0}개국. 클럽에서의 역할이 판도를 바꿔요. 활약해서 멀리 이끄세요.",
		"Las clasificatorias aún no empiezan.": "예선은 아직 시작 전이에요.",
		"{0}. {1}  {2} PTS ({3}, {4} PJ)": "{0}. {1}  {2}점 ({3}, {4}경기)",
		"— corte de clasificación al Mundial —": "— 세계 대회 진출 커트라인 —",
		"¡{0} CLASIFICADA!": "{0} 진출 확정!",
		"{0} se quedó fuera del Mundial": "{0}, 세계 대회 진출 실패",
		"{0} · vs": "{0} · vs",
		"{0} quedó eliminada de {1}": "{0}, {1} 탈락",
		"LIBRO DE RÉCORDS": "기록집",
		"LIGA · CLUB · MUNDO": "리그 · 클럽 · 세계",
		"ABRIR": "열기",
		"VITRINA": "진열장",
		"Aún vacía. Gana una liga, una copa o una bota y aquí lucirá tu primer trofeo.":
			"아직 비었어요. 리그, 컵, 득점왕을 차지하면 첫 트로피가 여기 놓여요.",
		"TEMPORADA A TEMPORADA": "시즌별 기록",
		"EN EQUIPO · {0}": "팀 · {0}",
		"INDIVIDUALES · {0}": "개인 · {0}",
		"Aún no has cerrado ninguna temporada.": "아직 마친 시즌이 없어요.",
		"* temporada en curso": "* 진행 중인 시즌",
		"El detalle por temporada aparecerá aquí al cerrar la temporada en la que ganes"
		+ " tu próximo premio.":
			"다음 상을 받은 시즌을 마치면 시즌별 상세가 여기 나타나요.",
		"POR TEMPORADA": "시즌별",
		"TRASPASOS": "이적",
		"Sigues donde empezaste.": "아직 처음 그 클럽이에요.",
		"LEGADO": "레거시",
		"Puntos de legado: {0} — suben con goles, títulos y partidos con tu"
		+ " selección.":
			"레거시 포인트: {0} — 골, 우승, 대표팀 출전으로 올라가요.",
		"Vía Mundo · prestigio {0}/{1}": "월드 루트 · 위상 {0}/{1}",
		"necesitas {0} puntos de legado": "레거시 포인트 {0} 필요",
		"Vía Club · {0}/{1} títulos": "클럽 루트 · 우승 {0}/{1}",
		"{0} histórico del club": "클럽 역대 {0}",
		"(pide top-2)": "(2위 이내 필요)",
		"aún no figuras entre sus leyendas": "아직 클럽 레전드에 없어요",
		"Fuera del top {0} de la historia": "역대 TOP {0} 밖",
		"{0} de la historia": "역대 {0}",
		"Nadie por encima: el más grande que ha pisado un campo.":
			"위엔 아무도 없어요: 그라운드를 밟은 역대 최고 선수.",
		"El siguiente a superar": "다음 추월 대상",
		"Te falta 1 trofeo": "트로피 1개 남음",
		"Te faltan {0} trofeos": "트로피 {0}개 남음",
		"Goles por temporada": "시즌별 골",
		"{0}T": "{0}S",
		"COMO SE SUBE": "올라가는 법",
		"Goles, asistencias y partidos con tu selección suman siempre — los"
		+ " primeros valen mucho y el volumen se aplana. Los trofeos suman entero"
		+ " lo suyo:":
			"골, 도움, 대표팀 출전은 언제나 쌓여요 — 처음 것일수록 가치가 크고, 많아질수록 완만해져요. 트로피는 제 몫을 통째로 더해요:",
		"{0} a los {1}": "{1}세에 {0}",
		"ASÍ VA LA VOTACIÓN": "투표 현황",
		"Con lo jugado hasta la jornada {0} de {1}. Si la temporada cerrara hoy,"
		+ " el 1º se lo lleva: el ranking manda, sin excepciones.":
			"{1}라운드 중 {0}라운드까지의 활약 기준. 오늘 시즌이 끝나면 1위가 가져가요. 순위가 전부예요, 예외 없이.",
		"Sólo votan la PRIMERA división de las ligas EUROPEAS. Y los títulos del"
		+ " año entran al cierre: una {0} son {1} puntos que hoy no lleva nadie.":
			"유럽 리그의 1부만 투표 대상이에요. 그리고 올해 우승은 시즌 종료 때 반영돼요. {0} 우승은 {1}점인데, 지금은 아무도 갖고 있지 않아요.",
		"Gana el que más puntos suma, sin excepciones. Los títulos no son una"
		+ " llave aparte: son la forma más rápida de sumar.":
			"가장 많은 점수를 모은 선수가 이겨요, 예외 없이. 우승은 별도 조건이 아니라 점수를 가장 빨리 모으는 방법이에요.",
		"La LIGA y la COPA valen según la liga en que se ganan: las cinco grandes"
		+ " pagan el doble que las ligas pequeñas. Abajo van los puntos de TU liga.":
			"리그와 컵은 우승한 리그의 가치만큼 인정돼요. 5대 리그는 작은 리그의 두 배예요. 아래는 내 리그의 점수예요.",
		"Tú vas más abajo:": "나는 더 아래:",
		"El mejor de tu equipo:": "팀 내 최고:",
		"Aún no has jugado este año: sin partidos no hay votación que valga.":
			"올해 아직 안 뛰었어요. 경기가 없으면 투표도 없어요.",
		"Tu liga no vota: para entrar hay que jugar la PRIMERA división de una"
		+ " liga EUROPEA.":
			"내 리그는 투표 대상이 아니에요. 들어가려면 유럽 리그 1부에서 뛰어야 해요.",
		"{0} para {1}": "{1}까지 {0}",
		"TU RECORRIDO": "내 여정",


		"T{0}-T{1}": "S{0}-S{1}",
		"Llegaste CEDIDO": "임대로 합류",
		"Pagaron ${0} por ti": "이적료 ${0}",
		"Aquí empezaste": "커리어의 시작",
		"Llegaste gratis": "자유 이적으로 합류",
		"GLOBAL": "통산",
		"PARTIDOS": "경기",
		"{0}V · {1}E · {2}D": "{0}승 {1}무 {2}패",
		"ASISTENCIAS": "도움",
		"MEDIA": "평점",



		"GOLEO": "득점",
		"mejor: {0}": "최고: {0}",
		"TEMPORADAS": "시즌",
		"en {0} {1}": "{0} {1}에서",
		"INTERNACIONAL": "국가대표",
		"{0} goles con {1}": "{1}에서 {0}골",
		"$ {0}  ·  ahora": "$ {0}  ·  현재",
		"La curva aparece al cerrar tu segunda temporada.":
			"두 번째 시즌을 마치면 그래프가 나타나요.",
		"Pico: ${0} en la temporada {1}": "최고치: {1}시즌 ${0}",
		"T{0} · ${1}": "S{0} · ${1}",
		"tabLIGA": "리그",
		"tabCHAMP": "엘리트",
		"tabEUROPA": "유로파",
		"tabCOPA": "컵",
		"tabCLUBES": "클럽",
		"tabMUNDIAL": "세계",
		"tabCONTIN.": "대륙",
		"tabCLASIF": "예선",
		"palmaresLIGA": "리그",
		"palmaresCOPA": "컵",
		"palmaresCONT.": "대륙",
		"tablaTEMP": "시즌",
		"tablaCLUB": "클럽",
		"tablaPJ": "P",
		"tablaG": "G",
		"tablaA": "A",
		"tablaNOTA": "평점",


		"tabla_ligaEQUIPO": "팀",
		"tabla_ligaPJ": "P",
		"tabla_ligaG": "W",
		"tabla_ligaE": "D",
		"tabla_ligaP": "L",
		"tabla_ligaPTS": "승점",
		"tabla_ligaGOLES": "골",
		"tabla_ligaASIST": "도움",

		"CED": "임대",
		"{0}A": "{0}Y",
		"{0}S": "{0}W",
		"{0}P": "{0}M",
		"CEDIDO · NO SE RENUEVA": "임대 중 · 재계약 불가",
		"TREN DE VIDA": "라이프스타일",
		"NETO POR PARTIDO": "경기당 실수령액",
		"TUS NOES": "거절 횟수",
		"SE VAN HOY": "오늘 떠남",
		"Se hartaron de tus noes: el club contaba con esa venta. El técnico deja de contar contigo hasta el año que viene.":
			"거절이 쌓여 클럽이 지쳤어요. 그 판매를 기대하고 있었거든요. 감독은 내년까지 나를 쓰지 않아요.",
		"Llevas muchos noes: lo que llega ahora ya no es del nivel de lo que tumbaste.":
			"거절을 너무 많이 했어요. 이제 들어오는 제안은 거절했던 것만 못해요.",
		"Tu agente sostiene esa oferta: se sabe en la próxima jornada.":
			"에이전트가 그 제안을 붙잡고 있어요. 다음 라운드에 결과가 나와요.",
		"Tu agente no acepta más encargos esta ventana.":
			"에이전트가 이번 이적 시장엔 더 이상 의뢰를 받지 않아요.",
		"Te quedan {0} encargo(s) esta ventana (tu agente acepta más cuanto mejor te trate).":
			"이번 이적 시장 남은 의뢰: {0}회 (에이전트와 사이가 좋을수록 더 받아 줘요).",
		"Tu agente puede llamar igual, pero volverá con las manos vacías y te costará {0}, un poco de vestuario y el trato con él.":
			"에이전트가 연락은 해 보겠지만 빈손으로 돌아올 거고, {0}, 약간의 라커룸 평판, 그리고 에이전트와의 관계를 잃게 돼요.",
		"Tu club no te deja salir: pide el traspaso primero.":
			"클럽이 이적을 막고 있어요. 먼저 이적을 요청하세요.",
		"El mercado está cerrado: el botón de irte aparece al abrir la ventana. Negarte, puedes ya.":
			"이적 시장이 닫혀 있어요. 떠나기 버튼은 이적 시장이 열리면 나타나요. 거절은 지금도 할 수 있어요.",
		"PEDISTE EL TRASPASO": "이적 요청함",
		"ESTÁS CEDIDO": "임대 중",
		"Juegas en {0}, pero tu pase es de {1}.":
			"{0}에서 뛰지만, 등록 소속은 {1} 클럽이에요.",
		"tu club dueño": "원소속 클럽",
		"Mientras dure la cesión, aquí no hay nada que firmar ni negociar. Vuelves a {0} al cerrar la temporada.":
			"임대 기간 동안 여기선 서명할 것도 협상할 것도 없어요. 시즌이 끝나면 {0} 클럽으로 돌아가요.",
		"Hay clubes esperándote cedido, pero el mercado está cerrado: la cesión se firma cuando abra la ventana.":
			"임대로 데려가려는 클럽이 있지만 이적 시장이 닫혀 있어요. 임대는 이적 시장이 열리면 계약돼요.",
		"Estás EN LISTA DE CESIÓN: mientras sigas en ella, cada ventana te trae destinos nuevos.":
			"임대 명단에 올라 있어요: 명단에 있는 동안 이적 시장마다 새 행선지가 생겨요.",
		"{0} · titular probable · una temporada": "{0} · 선발 유력 · 1시즌",
		"Sueldo/partido": "경기당 급여",
		"Prima (sin traspaso)": "보너스 (이적료 없음)",
		"Traspaso": "이적료",
		"Tu prima": "내 몫",


		"Prima (bruta)": "보너스 (세전)",
		"Te queda limpio": "실수령",
		"Tu prima (limpia)": "내 몫 (실수령)",
		"(−{0}% agente)": "(−{0}% 에이전트)",
		"LA SOSTIENE TU AGENTE": "에이전트가 보류 중",
		"HOY O NUNCA": "마지막 기회",
		"Va {0} de {1} en {2} · {3}": "{2}: {1}팀 중 {0} · {3}",
		"RECHAZAR ESTA OFERTA": "이 제안 거절",




		"MANTÉN PARA FICHAR": "길게 눌러 영입",
		"¿ENCARGAR?": "의뢰할까요?",
		"MANTÉN PARA ENCARGAR": "길게 눌러 의뢰",
		"Tu agente trabajará {0} esta ventana. Cuesta {1}.": "에이전트가 이번 이적 시장 동안 {0} 쪽을 알아봐요. 비용 {1}.",
		"la liga de {0}": "{0} 리그",
		"MANTÉN PARA FIRMAR": "길게 눌러 서명",
		"MANTÉN PARA NO RENOVAR": "길게 눌러 재계약 거부",
		"MANTÉN PARA FIRMAR EL PRECONTRATO": "길게 눌러 사전 계약 서명",
		"MANTÉN PARA RECHAZAR": "길게 눌러 거절",
		"TU CLUB NO TE VENDE: te queda contrato y cuentan contigo. Pide el traspaso ahí abajo para poder firmar.":
			"클럽이 팔지 않아요: 계약이 남아 있고 나를 필요로 해요. 서명하려면 아래에서 이적을 요청하세요.",
		"QUE TU AGENTE LA SOSTENGA": "에이전트에게 보류 맡기기",
		"TU AGENTE LA SOSTIENE · RESPONDEN MAÑANA": "에이전트가 보류 중 · 내일 답변",
		"Se retiran de la puja para siempre en este mercado. El mercado cierra hoy: nadie ocupará su hueco.":
			"이번 이적 시장에서 영영 손을 떼요. 이적 시장은 오늘 마감이라 빈자리를 채울 클럽도 없어요.",
		"Tu club contaba con esta venta: con este NO se les acaba la paciencia y el técnico dejará de contar contigo.":
			"클럽은 이 판매를 기대하고 있었어요. 이번 거절로 인내심이 바닥나고 감독은 나를 쓰지 않게 돼요.",
		"Tu club contaba con esta venta: te quedan {0} noes antes de que se les acabe la paciencia.":
			"클럽은 이 판매를 기대하고 있었어요. 인내심이 바닥나기 전까지 거절은 {0}번 남았어요.",
		"Y llevas muchos noes: lo que llegue en su lugar vendrá por debajo de lo que estás tumbando.":
			"게다가 거절이 쌓였어요. 대신 들어오는 제안은 지금 거절하는 것보다 못할 거예요.",
		"OFERTA RECHAZADA · EL MERCADO CIERRA HOY": "제안 거절 · 이적 시장 오늘 마감",
		"CONCENTRADO CON {0}": "{0} 대표팀 소집 중",
		"Aquí mandan otros. Que tu club te adore no le dice nada al seleccionador: a esta gente te la ganas jugando las fechas FIFA.":
			"여기선 다른 사람들이 결정해요. 클럽에서 사랑받는다고 대표팀 감독이 알아주진 않아요. 이 사람들은 A매치 기간에 뛰어서 사로잡아야 해요.",
		"Seleccionador": "대표팀 감독",
		"Es quien firma la lista. Mira tu nota cuando juegas con el país.":
			"소집 명단에 서명하는 사람. 대표팀에서 뛸 때 평점을 지켜봐요.",
		"Las tres suman {0} puntos a tu convocatoria.":
			"셋이 합쳐 소집 점수에 {0}점을 더해 줘요.",
		"Vestuario de la selección": "대표팀 라커룸",
		"Se gana ganando juntos. Una derrota jugando mal es lo que más resta.":
			"함께 이겨야 얻어요. 못 뛰고 지는 게 가장 크게 깎여요.",
		"Afición de {0}": "{0} 팬",
		"Le enamora que marques. En casa, si te quiere te llega un balón más; si te pita, uno menos.":
			"골을 넣으면 반해요. 홈에서 사랑받으면 공이 한 번 더 오고, 야유받으면 한 번 덜 와요.",
		"LOS TUYOS, ESTÉS DONDE ESTÉS": "어디서나 내 편",
		"Te siguen a todas partes: lo que hagas con tu país también cuenta.":
			"어디든 따라와요. 대표팀에서 하는 일도 중요해요.",
		"Sigue siendo el tuyo. Una buena fecha FIFA sube tu precio.":
			"여전히 내 사람이에요. A매치에서 활약하면 몸값이 올라요.",
		"COPA EU": "엘리트",
		"COPA C.": "유로파",
		"COPA 3": "챌린지",
		"ASCENSO": "승격",
		"DESCENSO": "강등",
		"CUADRO": "대진표",
		"Torneo en curso.": "대회 진행 중.",
		"Quedar entre los {0} primeros del grupo clasifica para {1}.":
			"조 상위 {0}위 안에 들면 {1} 진출.",
		"Pasan los {0} primeros de cada grupo.": "각 조 상위 {0}팀이 올라가요.",
		"El cuadro se sortea al acabar la fase de grupos.":
			"대진표는 조별 리그가 끝나면 추첨해요.",


		"El cuadro se sortea al acabar la primera fase.":
			"대진표는 1차 단계가 끝나면 추첨해요.",
		"Del 1 al {0}, a octavos. Del {1} al {2}, al playoff. El resto, fuera.":
			"1~{0}위는 16강, {1}~{2}위는 플레이오프. 나머지는 탈락.",
		"Todavía no se ha entregado ninguno. Se falla al cerrar cada temporada, con los números de todo el mundo.":
			"아직 수상자가 없어요. 매 시즌 종료 때 전 세계 기록으로 결정돼요.",
		"LA VOTACIÓN": "투표",

		"EL ONCE IDEAL": "베스트 11",

		"{0} ligas en {1} años": "{1}년간 리그 우승 {0}회",
		"Aún no se ha cerrado ninguna temporada.": "아직 마친 시즌이 없어요.",
		"Antes de tu carrera, sin fechas: {0}": "커리어 이전, 날짜 없음: {0}",
		"Los once mejores de {0} esa temporada, por nota media.": "그 시즌 {0}의 평균 평점 베스트 11.",
		"Los que más cerca estuvieron, con lo que hizo cada uno. Los puntos salen del baremo de abajo.":
			"가장 근접했던 선수들과 각자의 기록이에요. 점수는 아래 기준표로 매겨요.",
		"Tú quedaste más abajo:": "나는 더 아래:",
		"Ese año no entraste en la votación.": "그해엔 투표 대상에 못 들었어요.",
		"Una línea por temporada: goles, asistencias, media y puntos de la votación. Toca una para verla completa.":
			"시즌마다 한 줄: 골, 도움, 평점, 투표 점수. 눌러서 전체를 보세요.",
		"ASIST.": "도움",
		"PUNTOS": "점수",
		"No levantó ningún título esa temporada.": "그 시즌엔 우승이 없었어요.",
		"También: {0}": "그 밖에: {0}",
		"COMO SE GANA": "선정 방식",
		"Los puntos con los que se elige al mejor del año. Los de tu selección y los de Europa pesan más.":
			"올해의 선수를 뽑는 점수예요. 대표팀과 유럽 대회 점수가 더 무거워요.",
		"Sólo entran en la votación los que juegan la PRIMERA DIVISIÓN de una liga EUROPEA.":
			"유럽 리그 1부에서 뛰는 선수만 투표 대상이에요.",
		"GOL EN LIGA": "리그 골",
		"ASISTENCIA EN LIGA": "리그 도움",
		"GOL EN {0}": "{0} 골",
		"ASISTENCIA EN {0}": "{0} 도움",
		"CADA DECIMA DE MEDIA SOBRE {0}": "평점 {0} 초과 0.1마다",
		"{0} PTS": "{0}점",
		"{0}G {1}A  ·  {2}": "{0}G {1}A  ·  {2}",
		"  ({0} en {1})": "  ({1}에서 {0})",
		"TE PIDIERON: {0}   {1}/{2}": "요청: {0}   {1}/{2}",
		"CAPITÁN DE {0}": "{0} 주장",
		"Llevas la cinta desde hace {0} temporadas.": "{0}시즌째 주장 완장을 차고 있어요.",
		"JUGAR PARA {0}": "{0} 대표로 뛰기",
		"SU ONCE CORTA EN {0}": "선발 기준 {0}",
		"¿JUGAR PARA {0}?": "{0} 대표로 뛸까요?",
		"Llevas {0} temporadas jugando ahí y ningún partido oficial te ata todavía a {1}. Su once corta en {2}; el de {1}, en {3}.":
			"그곳에서 {0}시즌을 뛰었고, 아직 {1} 대표팀 공식 경기 출전 기록이 없어요. 그쪽 선발 기준은 {2}, {1} 쪽은 {3}.",
		"No hay marcha atrás. Empiezas de cero con ellos: el seleccionador, el vestuario y la afición vuelven a no conocerte, y pierdes el brazalete si lo llevabas. Tus partidos y tus goles se quedan en tu historial.":
			"되돌릴 수 없어요. 처음부터 다시 시작해요: 대표팀 감독, 라커룸, 팬 모두 나를 모르는 상태로 돌아가고, 주장 완장도 잃어요. 출전 기록과 골은 기록에 남아요.",
		"SÍ, ELIJO {0}": "네, {0} 선택",
		"SEGUIR CON LOS MÍOS": "원래 나라에 남기",
		"{0} se juega al terminar la temporada de clubes; el campeón se sabrá entonces.":
			"{0} 대회는 클럽 시즌이 끝난 뒤 열려요. 우승팀은 그때 정해져요.",
		"Clasifícala la próxima vez quedando entre los {0} primeros de tu grupo.":
			"다음엔 조 상위 {0}위 안에 들어 진출하세요.",
		"Cada sello es un título: temporada · club · división.":
			"도장 하나가 우승 하나: 시즌 · 클럽 · 리그.",
		"LO QUE SE PUEDE GANAR": "획득 가능한 것",
		"+{0} SIN REGISTRO": "+{0} 기록 없음",

		"GRADA": "관중석",
		"+{0} más": "+{0} 더",
		"CED = esa temporada la jugaste CEDIDO: el club de la fila te tenía prestado, no eras suyo.":
			"임대 = 그 시즌은 임대로 뛰었어요. 그 줄의 클럽이 빌려 간 거라, 소속은 아니었어요.",
		"MAPA DE TIROS": "슈팅 맵",
		"PEDIR EL CAMBIO": "교체 요청",
		"PROGRESIÓN": "성장",
		"Aún no has rematado. Cada tiro que pegues este año queda marcado aquí, con el sitio desde el que salió.":
			"아직 슈팅이 없어요. 올해 때리는 슈팅은 전부 시작 위치와 함께 여기 표시돼요.",
		"Ese año aún no se apuntaban los remates.":
			"그해엔 아직 슈팅을 기록하지 않았어요.",
		"Ese año aún no se apuntaban los pases.":
			"그해엔 아직 패스를 기록하지 않았어요.",
		"Ese año aún no se apuntaba por dónde te movías.":
			"그해엔 아직 이동 경로를 기록하지 않았어요.",
		"En este partido no remataste.":
			"이 경기에선 슈팅이 하나도 없었어요.",
		"En este partido no le dejaste el balón a nadie.":
			"이 경기에선 누구에게도 패스를 내주지 않았어요.",
		"En este partido no quedó rastro de tus movimientos.":
			"이 경기에선 움직임 기록이 남지 않았어요.",
		"A PUERTA": "유효 슈팅",
		"Sobre {0} remates medidos": "측정된 슈팅 {0}개 기준",
		" · {0} bloqueados (no cuentan: no fue tu puntería)":
			" · 블록 {0}개 (조준 탓이 아니라 제외)",
		"EL MARCO — dónde cruzó cada tiro": "골문 — 슈팅이 지나간 위치",
		"EL CAMPO — desde dónde tiraste": "그라운드 — 슈팅한 위치",



		"DESVIADO": "빗나감",
		"TAPADO": "블록",
		"ANULADO": "무효",
		"POR DÓNDE ANDUVISTE": "내 활동 범위",

		"REGATE GANADO": "드리블 성공",
		"SALISTE CON {0}": "시작: {0}",
		"ACABAS EN {0}": "종료: {0}",
		"RECUPERASTE": "회복",
		"OTRAS COMPRAS": "기타 구매",
		"DESCANSO Y FÍSICO": "휴식과 체력",
		"SIN CAMBIOS": "변화 없음",
		"EN TODA TU CARRERA": "커리어 전체",
		"DESDE MÁS LEJOS": "최장거리",
		"TU GOL MÁS LEJANO": "내 최장거리 골",
		"TU PASE MÁS LARGO": "내 최장거리 패스",
		"Ese año: gol desde {0} m": "그해: {0} m 골",
		"Esta temporada: gol desde {0} m": "이번 시즌: {0} m 골",
		"EL MÁS LARGO": "최장거리",
		"Ese año: pase de {0} m": "그해: {0} m 패스",
		"Esta temporada: pase de {0} m": "이번 시즌: {0} m 패스",
		"MAPA": "맵",
		"MAPA DE PASES": "패스 맵",
		"REGATES": "드리블",
		"MAPA DE REGATES": "드리블 맵",
		"JUGADA ABIERTA": "오픈 플레이",
		"TODA TU CARRERA": "커리어 전체",
		"JUGADA": "플레이",
		"TIRO LIBRE": "프리킥",
		"CÓRNER": "코너킥",
		" · sólo {0}": " · {0}만",
		"Aún no has pisado el campo. Aquí va a quedar el rastro de por dónde te mueves, dónde te quitan el balón y dónde te hacen falta.":
			"아직 그라운드를 밟지 않았어요. 여기에 내 움직임, 공을 뺏긴 곳, 파울을 당한 곳이 기록될 거예요.",
		"TE LA QUITARON": "공 뺏김",
		"FALTAS A FAVOR": "얻은 파울",
		"LA CANCHA — atacas hacia la derecha": "그라운드 — 오른쪽으로 공격",
		"Toca una marca del campo para ver la jugada.": "그라운드의 표시를 누르면 그 장면을 볼 수 있어요.",
		"min {0}": "{0}분",
		"Viendo {0} de {1} · toca otra vez el chip para verlo todo":
			"{1}개 중 {0}개 표시 · 칩을 다시 누르면 전체 보기",
		"{0}: {1}": "{0}: {1}",
		"ninguno en {0}": "{0}에서 없음",
		"1 de cada {0}": "{0}번 중 1번",
		"Tus asistencias salen sobre todo {0}: {1} de {2}":
			"도움은 주로 {0}에서 나와요: {2}개 중 {1}개",
		"Donde más te la quitan: {0}, {1}.": "가장 많이 뺏기는 곳: {0}, {1}.",
		"en el último tercio": "파이널 서드",
		"en el medio campo": "중원",
		"en tu propio campo": "우리 진영",
		"POR LA IZQUIERDA": "왼쪽 측면",
		"POR EL CENTRO": "중앙",
		"POR LA DERECHA": "오른쪽 측면",
		"AL LADO IZQUIERDO": "왼쪽으로",
		"AL LADO DERECHO": "오른쪽으로",
		"AL PALO": "골대 맞음",
		"POR ENCIMA": "크로스바 위로",
		"DESPEJADO": "걷어냄",
		"REMATE": "슈팅",
		"ACABÓ EN GOL": "골로 연결",
		"ACABÓ EN REMATE": "슈팅으로 연결",
		"ANULADO POR FUERA DE JUEGO": "오프사이드로 취소",
		"SE QUEDÓ SIN REMATE": "슈팅으로 못 이어짐",
		"SE TE ESCAPÓ": "놓쳤어요",
		"TE GANÓ EL PORTERO": "골키퍼에게 막힘",
		"NO LLEGASTE AL BALÓN": "공에 못 닿음",
		"TE ENCERRARON": "고립됨",
		"TE HICIERON FALTA": "파울 얻음",
		"PENAL A TU FAVOR": "PK 획득",
		"PERDISTE EL BALÓN": "공 뺏김",
		"Y TUS REGATES": "그리고 드리블",
		"El tercer mapa: por dónde te mueves de verdad, dónde te quitan el balón y dónde te hacen falta.":
			"세 번째 맵: 실제 움직임, 공을 뺏긴 곳, 파울을 당한 곳.",
		"TOCA UNA MARCA": "표시를 눌러요",
		"Cada balón del campo se puede tocar: te dice contra quién fue, en qué minuto, y te dibuja el vuelo que tuvo.":
			"그라운드의 공은 전부 누를 수 있어요. 어느 팀 상대였는지, 몇 분이었는지 알려 주고 궤적을 그려 줘요.",
		"A REMATE": "슈팅 연결",
		"SIN REMATE": "슈팅 없음",
		"Sobre {0} pases que llegaron": "성공한 패스 {0}개 기준",
		" · {0} pases clave": " · 키 패스 {0}개",
		" · {0} anulados por fuera de juego (no cuentan: no fue tu pase)":
			" · 오프사이드 취소 {0}개 (내 패스 탓이 아니라 제외)",
		"EL CAMPO — de dónde a dónde repartes": "그라운드 — 패스의 출발과 도착",


		"LA CANCHA — tu último pase de cada jugada": "그라운드 — 공격마다 내 마지막 패스",
		"LA CANCHA — desde dónde tiraste": "그라운드 — 슈팅한 위치",
		"POR QUÉ ESA NOTA": "평점의 이유",
		"LO QUE SUMÓ": "플러스 요인",
		"LO QUE RESTÓ": "마이너스 요인",
		"Aún no le has dejado el balón a nadie. Cada pase que llegue a un compañero queda marcado aquí, con el viaje que hizo y en qué acabó la jugada.":
			"아직 누구에게도 패스를 내주지 않았어요. 동료에게 닿은 패스는 전부 그 경로와 공격의 결말과 함께 여기 표시돼요.",
		"LARGO": "거리",
		"tablaP": "P",
		"PASE CORTO": "짧은 패스",
		"PASE MEDIO": "중거리 패스",
		"PASE LARGO": "롱 패스",
		"Y TUS PASES": "그리고 패스",
		"Arriba se cambia a PASES: a dónde repartes, y cuántos de esos balones acaban en remate o en gol.":
			"위에서 패스로 바꿔 보세요: 공을 어디로 뿌리는지, 그중 몇 개가 슈팅이나 골로 끝나는지.",
		"{0}: todavía sin marca.": "{0}: 아직 표시 없음.",
		"T{0} · CEDIDO": "S{0} · 임대",
		"Mantenimiento: -{0} por partido": "유지비: 경기당 -{0}",
		"RONDA {0}": "{0}라운드",
		"TU": "나",
		"EN RACHA": "상승세",
		"PJ": "P",
		"A": "A",
		"SEMANA SIN PARTIDO": "경기 없는 주",
		"JORNADA": "라운드",
		"Tu casillero · abre la TIENDA": "내 사물함 · 상점 열기",
		"Tu playera · cambia de uniforme": "내 유니폼 · 유니폼 변경",
		"ENERO": "1월",
		"FEBRERO": "2월",
		"MARZO": "3월",
		"ABRIL": "4월",
		"MAYO": "5월",
		"JUNIO": "6월",
		"JULIO": "7월",
		"AGOSTO": "8월",
		"SEPTIEMBRE": "9월",
		"OCTUBRE": "10월",
		"NOVIEMBRE": "11월",
		"DICIEMBRE": "12월",
		"diaLU": "월",
		"diaMA": "화",
		"diaMI": "수",
		"diaJU": "목",
		"diaVI": "금",
		"diaSA": "토",
		"diaDO": "일",
		"DÍAS DE DESCANSO": "휴식일",
		"{0}d": "{0}d",
		"TU PAPEL": "내 역할",
		"lesionBAJA": "부상",
		"lesionALTA": "복귀",
		"{0}D": "{0}D",
		"VER EN GOOGLE PLAY": "GOOGLE PLAY에서 보기",
		"LOGROS EN GOOGLE PLAY": "GOOGLE PLAY 업적",
		"Arriba, tu catálogo completo. En Google Play, los que Google conoce: se mandan solos al desbloquearse y se ven en tu perfil de jugador.": "위는 내 전체 목록. Google Play에는 Google이 아는 업적만 있어요. 달성하면 자동으로 전송되고 게이머 프로필에 표시돼요.",
		"Tu fachada {0} es de esta casa: la nueva luce la de fábrica.": "{0} 외관은 이 집 전용이에요. 새 집은 기본 외관으로 나와요.",
		"S{0}": "W{0}",
		"AYUDA": "도움말",
		"tabla_ligaDG": "GD",
		"TÚ {0}": "나 {0}",
		"{0} PTS · +{1} AL {2}": "{0}점 · {2}보다 +{1}",
		"{0} PTS · -{1} DEL {2}": "{0}점 · {2}까지 -{1}",
		"{0} · {1} PTS": "{0} · {1}점",
		"COMPETICIÓN": "대회",
		"ZONAS": "구역",
		"NO LA JUEGAS": "불참",
		"GRUPOS": "조",
		"EXENTO": "부전승",
		"POR DEFINIR": "미정",
		"VIGENTE": "디펜딩",
		"Pasan los {0} primeros de cada grupo y los {1} mejores terceros.": "각 조 상위 {0}팀과 3위 중 상위 {1}팀이 올라가요.",
		"Pasan también los {0} mejores terceros.": "3위 중 상위 {0}팀도 올라가요.",
		"{0} MEJORES": "상위 {0}",
		"VIVOS": "생존",
		"cuadroGLOBAL": "합계",
		"FALTAS A TU PALABRA": "약속 위반",
		"Dijiste que te quedabas, y te vas igual. Tu grada no lo olvida.": "남겠다고 해 놓고 결국 떠나요. 팬들은 잊지 않아요.",
		"DT": "감독",
		"DE {0}": "{0} 중",
		"TU PAÍS": "내 국가",
		"TU EDAD": "내 나이",
		"CON +1 DE MEDIA: {0}": "평점 +1 시: {0}",
		"TOP 10 DE {0}": "{0} TOP 10",
		"rankingEN EL MUNDO": "세계",
		"FILTRAR": "필터",
		"{0} TÍTULOS · -{1} DEL {2}": "우승 {0}회 · {2}까지 -{1}",
		"{0} TÍTULOS · +{1} AL {2}": "우승 {0}회 · {2}보다 +{1}",
		"carreraLIGAS": "리그",
		"carreraCOPAS": "컵",
		"tablaTOT": "합계",
		"{0} PARA {1}": "{1}까지 {0}",
		"FUERA DEL TOP {0}": "TOP {0} 밖",
		"-{0} TÍTULOS": "우승 -{0}",
		"PICO {0} · T{1}": "최고 {0} · S{1}",
		"RECORRIDO": "여정",
		"TEMPS.": "시즌",
		"ESTA TEMP.": "이번 시즌",
		"{0}/{1} BATIDOS": "{0}/{1} 경신",
		"MÁS CERCA": "근접",
		"AÚN SIN MARCA": "기록 없음",
		"ambitoAMÉRICA": "아메리카",
		"REQUISITOS": "조건",
		"¿CÓMO SE CALCULA?": "계산 방법",
		"-{0} PARA ENTRAR": "진입까지 -{0}",
		"-{0} PARA SER TITULAR": "선발까지 -{0}",
		"EN {0} TEMP.": "{0}시즌 만에",
		"CON {0} AÑOS": "{0}세",
		"{0} TEMPORADAS · {1} TÍTULOS": "{0}시즌 · 우승 {1}회",
		"OFERTAS": "제안",
		"VER CESIÓN": "임대 보기",
		"carreraGASTO": "지출",
		"SIN FICHAJES": "영입 없음",
		"EL MÁS CARO": "최고가",
		"{0} FICHAJES": "영입 {0}건",
		"1 FICHAJE": "영입 1건",
		"TÍTULOS · -{0} DEL {1}": "우승 · {1}까지 -{0}",
		"POR DELANTE": "앞선 선수",
		"SELECCIONADOR": "대표팀 감독",
		"-1 TÍTULO": "우승 -1",
		"1 TÍTULO": "우승 1회",
		"RENOVAR": "재계약",
		"CESIÓN": "임대",
		"PEDIR": "요청",
		"RETIRAR": "철회",
		"CLÁUSULAS": "조항",
		"CAMINO": "루트",
		"MUÉVEME": "이적 희망",
		"UNA LIGA": "특정 리그",
		"UN CLUB": "특정 클럽",
		"BAJAR FICHA": "주급 삭감",
		"SUBIR CLÁUSULA": "바이아웃 인상",
		"NO VENDERME": "판매 금지",
		"{0} BLOQUEADAS": "{0}개 잠김",
		"C. LIGA": "리그컵",
		"Patrocinador: {0}": "스폰서: {0}",
		"{0} LIBRE": "{0} 남음",
		"VENTA": "판매",
		"Este año no cuentas: hay que jugar la temporada ENTERA en una Primera europea.": "올해는 대상이 아니에요: 유럽 1부에서 시즌 전체를 뛰어야 해요.",
		"C. LIGAS": "인터리그컵",
		"¡CAMPEÓN DE LA COPA DE LAS LIGAS!": "인터리그컵 우승!",
		"Eliminado de la Copa de las Ligas": "인터리그컵 탈락",
		"{0} SIN GUARDAR": "미저장 {0}",
		"PIERNAS": "다리",
		"TODO AL TOPE": "전부 최대",
		"SALARIO": "급여",
		"ESTATUS": "지위",
		"EL CLUB DICE": "클럽 입장",
		"PEDIR SALIDA": "이적 요청",
		"HASTA T{0}": "S{0}까지",
		"QUEDAN {0} TEMPORADAS": "{0}시즌 남음",
		"MANTÉN 1 S": "1초 누르기",
		"Tu temporada da para pedir mejora: siéntate con el club.": "이번 시즌 활약이면 조건 개선을 요구할 만해요. 클럽과 마주 앉으세요.",
		"El club está contento con lo firmado.": "클럽은 지금 계약에 만족해요.",
		"YA LO PEDISTE": "이미 요청함",
		"CONTESTA LO PENDIENTE": "대기 중인 건부터",
		"AÚN NO TE ESCUCHAN": "아직 안 들어 줘요",
		"CUANDO ABRA EL MERCADO": "이적 시장 열리면",
		"PRÓXIMO CRUCE": "다음 상대",
		"TU TÉCNICO": "내 감독",
		"GRUPOS {0}-{1}": "{0}-{1}조",
		"VER EL GOL": "골 보기",
		"MANTEN PARA BORRAR": "길게 눌러 삭제",
		"NO SE PUEDE LEER": "읽을 수 없음",
		"SIN GOLES TODAVIA": "아직 골 없음",
		"MARCA, Y EN LA REPETICION PULSA": "골을 넣고 리플레이에서 누르세요",
		"LLENO · BORRA UNO PARA GUARDAR OTRO": "가득 참 · 하나 삭제 후 저장",
		"TOCA UN GOL Y VELO. BORRAR SE MANTIENE.": "골을 눌러 보세요. 삭제는 길게 누르세요.",
		"{0} M/S": "{0} M/S",
		"Hasta 30 goles por carrera. Se ven con el cielo y el viento de aquel día, en tu estadio de hoy.": "커리어당 최대 30골. 그날의 하늘과 바람 그대로, 지금의 내 경기장에서 볼 수 있어요.",
		"El archivo se dañó. Sólo queda borrarlo.": "파일이 손상됐어요. 삭제하는 수밖에 없어요.",
		"GALAS": "시상식",
		"GANADOR": "수상자",
		"La votación del año arranca con la primera jornada.": "올해의 투표는 첫 라운드와 함께 시작돼요.",
		"ONCE IDEAL": "베스트 11",
		"VER TODOS": "전체 보기",
		"VOTACIÓN": "투표",
	},










	"shop": {

		"ROPA DE CALLE": "사복",
		"Toca una prenda para comprarla. Lo que compres te espera en ASPECTO.": "옷을 눌러 구매하세요. 산 옷은 외모에서 기다리고 있어요.",

		"CAMILLA DE FISIOTERAPIA": "물리치료 베드",
		"PIZARRA TÁCTICA": "전술 보드",
		"BICICLETA ESTÁTICA": "실내 자전거",
		"MURO DE RÉCORDS": "기록의 벽",
		"RINCÓN DE LECTURA": "독서 공간",
		"MESA DE RECUERDOS": "추억 테이블",
		"Camilla y material de recuperación. Su sesión recupera energía, no cura lesiones.": "치료 베드와 회복 장비. 세션으로 에너지를 회복하지만, 부상은 치료하지 않아요.",
		"Pizarra móvil para preparar el próximo partido. El bono se activa al usarla.": "다음 경기를 준비하는 이동식 보드. 사용하면 보너스가 활성화돼요.",
		"Cardio suave en casa; requiere estar sin lesión para pedalear.": "집에서 하는 가벼운 유산소. 부상이 없어야 페달을 밟을 수 있어요.",
		"Tus goles, asistencias, títulos y mejores temporadas, con datos reales.": "내 골, 도움, 우승, 최고 시즌을 실제 기록으로.",
		"Sillón, libro y luz cálida: lee para recuperar energía y ánimo.": "안락의자, 책, 따뜻한 조명: 책을 읽으며 에너지와 사기를 회복해요.",
		"Cartas y recuerdos de tu carrera. Consulta los momentos guardados.": "커리어의 편지와 추억. 저장된 순간을 둘러보세요.",
		"SESIÓN DE FISIOTERAPIA": "물리치료",
		"PREPARAR EL PARTIDO": "경기 준비",
		"PEDALEAR SUAVE": "가벼운 사이클",
		"LEER CON CALMA": "차분한 독서",
		"Recupera hasta 12 de energía. No acorta las lesiones. Una acción semanal.": "에너지를 최대 12 회복해요. 부상 기간은 줄지 않아요. 주 1회 행동.",
		"+3 puntos de precisión efectiva para el próximo partido. Una acción semanal.": "다음 경기 실질 정확도 +3. 주 1회 행동.",
		"Hasta +5 de energía y +1 con el técnico, sin lesión. Una acción semanal.": "부상이 없을 때 에너지 최대 +5, 감독 +1. 주 1회 행동.",
		"Hasta +3 de energía y +1 de ánimo. Una acción semanal.": "에너지 최대 +3, 사기 +1. 주 1회 행동.",
		"VER RÉCORDS": "기록 보기",
		"ABRIR RECUERDOS": "추억 열기",
		"VER CONDICIÓN": "컨디션",
		"de ánimo": "사기",
		"PRECISIÓN +3 · PRÓXIMO PARTIDO": "정확도 +3 · 다음 경기",
		"Coloca este mueble para usarlo.": "이 가구를 배치해야 쓸 수 있어요.",
		"Espera al alta médica para pedalear.": "의료진 복귀 승인이 나야 페달을 밟을 수 있어요.",
		"La preparación táctica ya está lista para el próximo partido.": "다음 경기 전술 준비가 끝났어요.",
		"Ahora mismo no necesitas esta sesión.": "지금은 이 세션이 필요 없어요.",
		"Consultar no consume acciones ni cambia tus estadísticas.": "둘러보기는 행동을 쓰지 않고 능력도 바뀌지 않아요.",
		"Aún no hay partidos registrados para este muro.": "아직 이 벽에 기록된 경기가 없어요.",
		"Los recuerdos aparecerán cuando tu carrera deje momentos guardados.": "커리어에 특별한 순간이 쌓이면 추억이 나타나요.",
		"TU HISTORIA EMPIEZA AQUÍ": "내 이야기는 여기서부터",
		"RECUERDOS": "추억",
		"{0} TÍTULOS": "우승 {0}회",
		"{0} / {1}": "{0} / {1}",
		"GOLES CON TUS CLUBES": "클럽 통산 골",
		"ASISTENCIAS CON TUS CLUBES": "클럽 통산 도움",
		"TU MEJOR TEMPORADA GOLEADORA": "내 최고 득점 시즌",
		"TU MEJOR TEMPORADA DE ASISTENCIAS": "내 최고 도움 시즌",
		"TU MEJOR MEDIA DE TEMPORADA": "내 최고 시즌 평점",
		"NOTA {0} · {1} PARTIDOS": "평점 {0} · {1}경기",
		"TÍTULOS GANADOS": "획득 우승",
		"TU DEBUT CON UN CLUB": "클럽 데뷔",
		"TU DEBUT CON LA SELECCIÓN": "대표팀 데뷔",
		"TU CESIÓN": "내 임대",
		"CAMISETA INTERCAMBIADA": "교환한 유니폼",
		"BALÓN DEL PARTIDO": "경기 공",
		"RESULTADO {0}–{1}": "결과 {0}–{1}",
		"Los grandes de Europa se fijan en ti.": "유럽 빅클럽들이 주목하고 있어요.",
		"Tienes con qué, pero te falta FAMA: haz ruido marcando.":
			"능력은 있지만 명성이 부족해요: 골로 이름을 알리세요.",
		"Gustas, pero necesitas más NIVEL: al gimnasio.":
			"관심은 있지만 실력이 더 필요해요: 체육관으로 가세요.",
		"Te siguen, pero tu MEDIA no acompaña: hay que rendir.":
			"주목은 받지만 능력치가 따라주지 않아요. 실력으로 보여줘야 해요.",
		"POT": "파워",
		"PRE": "정확",
		"EFE": "회전",
		"ENERGIA": "에너지",
		"RIESGO": "위험",
		"SEMANAS BAJA": "결장 기간",
		"COMISION": "수수료",
		"PRENSA": "언론",
		"AFICIÓN": "팬",
		"AGENTE": "에이전트",
		"TÉCNICO": "감독",


		"VESTUARIO": "라커룸",
		"ROTO": "파탄",
		"FRÍO": "냉랭",
		"BUENO": "좋음",
		"INCONDICIONAL": "열성",
		"BARRIO 90": "스트리트 90",
		"Tu primer salto. Un poco de todo, a tu alcance.": "첫 번째 도약. 모든 게 조금씩, 손 닿는 가격에.",
		"ACERO PRO": "스틸 프로",
		"Hechas para durar. Rendimiento modesto, muchos partidos.": "오래가도록 만들었어요. 성능은 평범해도 많은 경기를 버텨요.",
		"ÓRBITA 10": "오빗 10",
		"Coloca y dibuja la curva. Menos fuerza, más intención.": "정확히 놓고 휘어 차세요. 힘은 덜, 의도는 더.",
		"ECLIPSE X": "이클립스 X",
		"Oscuridad y neón. Potencia, puntería y una comba de élite.": "어둠과 네온. 엘리트급 파워, 정확도, 회전.",
		"NOVA PRISM": "노바 프리즘",
		"Brillo de otro mundo. Cada disparo traza su propia curva.": "다른 세상의 광채. 모든 슈팅이 자기만의 궤적을 그려요.",
		"ZÉNIT SUPREMA": "슈프림 제니스",
		"La cima del juego. Fuerza, precisión y comba sin concesiones.": "최정점. 타협 없는 파워, 정확도, 회전.",
		"+ {0} · DURAN {1} PARTIDOS": "+ {0} · {1}경기 지속",
		"Si ya las tienes, vuelven al 100% de vida.": "이미 갖고 있다면 내구도가 100%로 돌아와요.",
		"{0} están en tu ropero con el 100% de vida.": "{0}: 내구도 100%로 옷장에 있어요.",
		"BOTA DE CANTERA": "유스 축구화",
		"Las de siempre. Sin trucos.": "늘 신던 그 축구화. 꼼수는 없어요.",
		"TRUENO XT": "썬더 XT",
		"Pega más fuerte, pero cuesta domarla.": "더 세게 차지지만, 길들이기 어려워요.",
		"BISTURÍ 09": "메스 09",
		"Para quien coloca en vez de reventar.":
			"세게 차기보다 정확히 꽂는 선수를 위해.",
		"COMBA CLÁSICA": "클래식 커브",
		"Rosca de verdad. La falta es tuya.": "진짜 감아차기. 프리킥은 맡겨 두세요.",
		"CORONA DE ORO": "골든 크라운",
		"Sin peros. Si puedes pagarla.": "단점 없음. 살 돈만 있다면.",
		"BEBIDA ENERGÉTICA": "에너지 드링크",
		"+35 de energía. Ábrela entre semana o en el descanso.":
			"에너지 +35. 주중이나 하프타임에 따세요.",
		"GEL ANTIINFLAMATORIO": "소염 젤",
		"Adelanta una semana tu recuperación.": "회복이 1주 빨라져요.",
		"SESIÓN DE VÍDEO": "영상 분석",
		"+1 de forma. Estudias al rival.": "폼 +1. 상대를 연구해요.",
		"CÁMARA HIPERBÁRICA": "고압 산소 캡슐",
		"Borra cualquier lesión al instante y devuelve +20 de energía. El cuerpo sólo la aguanta una vez por temporada.":
			"어떤 부상이든 즉시 없애고 에너지 +20을 회복해요. 몸이 시즌에 한 번만 버틸 수 있어요.",
		"CORTE DE AUTOR": "디자이너 헤어컷",
		"Sales en las fotos. Barato y sin enemigos.":
			"사진에 잘 나와요. 저렴하고 아무도 불편해하지 않아요.",
		"CENA CON EL VESTUARIO": "동료들과 회식",
		"La química se compra. Se puede repetir.":
			"케미는 돈으로 살 수 있어요. 반복 가능해요.",

		"TU AGENTE": "내 에이전트",
		"EL DE SIEMPRE": "늘 그 사람",
		"Ahora te lleva: {0} · se queda el {1}% de lo que cobras": "현재 담당: {0} · 수입의 {1}% 수수료",
		"No hay nadie por encima. La agencia es tuya.": "위에는 아무도 없어요. 이제 에이전시는 내 거예요.",
		"VUELVE EN {0}": "{0} 후 복귀",
		"YA ESTE AÑO": "올해 완료",
		"COMISIÓN %": "수수료 %",
		"AGENTE CON OFICINA": "사무실 있는 에이전트",
		"Deja de atenderte desde el coche. Comisión del 7%.": "이제 차 안에서 전화하지 않아요. 수수료 7%.",
		"AGENTE CON CARTERA": "고객 많은 에이전트",
		"Ya lleva a otros profesionales. Más clubes te miran, y cobra el 6%.": "다른 프로 선수들도 맡고 있어요. 더 많은 클럽이 지켜보고, 수수료는 6%.",
		"AGENCIA DE PRIMERA": "일류 에이전시",
		"Un equipo detrás de tu nombre: ofertas de fuera y prensa a favor. El 5%.": "내 이름 뒤에 팀이 생겨요: 해외 제안과 우호적인 언론. 5%.",
		"AGENTE DE ESTRELLAS": "스타 전문 에이전트",
		"Sólo lleva a quince jugadores en el mundo y tú eres uno. El 3,5%.": "전 세계 15명만 맡는데 그중 한 명이 나예요. 3.5%.",
		"TU PROPIA AGENCIA": "나만의 에이전시",
		"El despacho es tuyo y él trabaja para ti. La comisión baja al 2,5%.": "회사는 내 것이고 그가 나를 위해 일해요. 수수료가 2.5%로 내려가요.",
		"La grada corea tu nombre. Las marcas lo notan. Una vez por temporada.": "관중석이 내 이름을 연호해요. 브랜드들도 알아봐요. 시즌당 한 번.",

		"CHARLA CON EL PSICÓLOGO": "스포츠 심리 상담",
		"Tu próximo partido no te bajará la forma, juegues como juegues.": "다음 경기에서는 어떻게 뛰든 폼이 떨어지지 않아요.",
		"BOTELLÍN ISOTÓNICO": "이온 음료",
		"+10 de energía, y tus botas no se gastan en el próximo partido.": "에너지 +10, 다음 경기에서 축구화가 닳지 않아요.",

		"CENA CON EL CAPITÁN": "주장과 저녁 식사",
		"Invitas al vestuario y pagas tú. +7 con el equipo. No se puede repetir en 10 partidos.":
			"동료들을 초대하고 계산은 내가 해요. 팀과의 관계 +7. 10경기 동안 다시 할 수 없어요.",
		"REUNIÓN CON EL TÉCNICO": "감독과 면담",
		"Le pides explicaciones y sales reforzado. +6 con el técnico — pero si fallas en el próximo partido, se lo cobra el doble.":
			"해명을 요구하고 더 당당해져서 나와요. 감독과의 관계 +6 — 하지만 다음 경기에서 부진하면 두 배로 갚아야 해요.",
		"INFILTRACIÓN": "진통 주사",
		"Juegas el próximo partido aunque estés lesionado. Al acabar, tu baja crece 2 semanas.":
			"부상 중이어도 다음 경기에 뛰어요. 끝나면 결장 기간이 2주 늘어나요.",
		"SIN LESIÓN": "부상 없음",
		"NO DISPONIBLE": "이용 불가",
		"EN {0} {1}": "{0} {1} 후",
		"JUGAR INFILTRADO": "부상 투혼",
		"LESIONADO · TU BAJA CRECERÁ {0} SEMANAS": "부상 · 결장 {0}주 연장",
		"YA PUESTO": "착용 중",
		"Te pones el atuendo {0} en ASPECTO.": "외형에서 {0} 의상이 열려요.",
		"Ya vistes el atuendo {0} en ASPECTO.": "외형에서 {0} 의상을 입고 있어요.",

		"Atuendo": "의상",
		"DE ORO": "골드",
		"DEL BARRIO": "스트리트",
		"DE PISTA": "트랙",
		"DE OFICINA": "오피스",
		"RELOJ DE ORO": "금시계",
		"Todos lo ven. El técnico también.": "모두가 봐요. 감독도요.",
		"DONACIÓN AL BARRIO": "동네 기부",
		"La grada corea tu nombre. Las marcas lo notan.":
			"관중석이 내 이름을 연호해요. 브랜드들도 알아봐요.",
		"GIMNASIO EN CASA": "홈짐",
		"Cuidas el cuerpo: recuperas algo más tras cada partido.":
			"몸 관리를 해요: 경기마다 조금 더 회복해요.",
		"DEPORTIVO": "스포츠카",
		"MUSCLE CAR": "머슬카",
		"COMPACTO URBANO": "시티 해치백",
		"SEDÁN CLÁSICO": "클래식 세단",
		"FAMILIAR VIAJERO": "투어링 왜건",
		"PICKUP DE CAMPO": "시골 픽업트럭",
		"Pequeño, amarillo y práctico. Tu primer coche sin presumir.": "작고 노랗고 실용적이에요. 뽐내지 않는 첫 차.",
		"Cuatro puertas, azul discreto y espacio para el día a día.": "문 네 개, 차분한 파란색, 일상에 넉넉한 공간.",
		"Carrocería larga, barras de techo y maletero para todo el equipo.": "긴 차체, 루프랙, 장비가 다 들어가는 트렁크.",
		"Robusta, sencilla y con caja abierta. Para salir de la ciudad.": "튼튼하고 단순한 오픈 적재함. 도시를 벗어날 때 딱이에요.",
		"COCHERA DE COLECCIÓN": "컬렉션 차고",
		"Ocho plazas en una ampliación a la derecha de casa. Terreno incluido y coches colocados automáticamente. Sin mantenimiento.": "집 오른쪽 증축 공간에 여덟 자리. 부지 포함, 차는 자동으로 배치. 유지비 없음.",
		"ESTACIONAR LOS CUATRO": "네 대 주차",
		"Cuatro plazas, portón abierto y paso a casa. Sin mantenimiento.": "네 자리, 열린 차고 문, 집으로 이어지는 통로. 유지비 없음.",
		"Primero coloca la cochera.": "차고를 먼저 배치하세요.",
		"Necesitas tener los cuatro coches.": "차 네 대를 모두 갖고 있어야 해요.",
		"Apártate de las plazas antes de estacionar.": "주차하기 전에 주차 칸에서 비켜 주세요.",
		"Hay una plaza bloqueada. No se movió ningún coche.": "주차 칸 하나가 막혀 있어요. 아무 차도 옮기지 않았어요.",
		"La cochera necesita un espacio libre de paredes.": "차고를 놓으려면 벽이 없는 공간이 필요해요.",
		"Tu coche de colección. Colócalo, gíralo o guárdalo en casa.": "내 컬렉션 카예요. 배치하거나 회전하거나 집에 보관하세요.",
		"Tu reloj de oro, expuesto en casa.": "내 금시계, 집에 전시 중.",
		"GRAN TURISMO": "그랜드 투어러",
		"HIPERDEPORTIVO": "하이퍼카",
		"Franjas negras y cuatro faros. Te oyen antes de verte.": "검은 줄무늬와 네 개의 헤드라이트. 보기도 전에 소리부터 들려요.",
		"Capó largo y verde de lujo. Elegancia que sale en todas las fotos.": "럭셔리 그린의 긴 보닛. 모든 사진에 담기는 우아함.",
		"Plata, carbono y alerón. Una pieza de colección que acapara portadas.": "은색, 카본, 리어 윙. 헤드라인을 장식하는 컬렉션 카.",
		"Llegas tarde a entrenar, pero llegas.":
			"훈련에 늦긴 해도, 가긴 가요.",
		"AGENTE DE PRIMERA": "일류 에이전트",
		"Más ofertas sobre la mesa y mejor regateo.":
			"테이블 위에 더 많은 제안, 더 나은 협상.",
		"CASA CON JARDÍN": "정원 있는 집",
		"Descansas de verdad: recuperas bastante más tras cada partido.":
			"제대로 쉬어요: 경기마다 훨씬 더 많이 회복해요.",



		"DEPARTAMENTO": "원룸",
		"Un cuarto, una ventana y el sitio justo para la primera copa.":
			"방 하나, 창문 하나, 첫 트로피를 둘 딱 맞는 공간.",
		"CASA MODERNA": "모던 하우스",
		"Sala de trofeos propia y aún mejor descanso entre partidos.":
			"전용 트로피 룸, 경기 사이 휴식은 더 좋아져요.",
		"Galería, garage y tu cancha tras la puerta del fondo.":
			"갤러리, 차고, 그리고 뒷문 너머 내 구장.",
		"CAMPO DE ENTRENAMIENTO": "훈련장",
		"TU FRASE ESTÁ EN SU GRADA": "내 말이 상대 관중석에",
		"TU CUMPLEAÑOS": "내 생일",
		"SIN PONER": "미설정",
		"¿QUÉ MES?": "몇 월?",
		"¿QUÉ DÍA DE {0}?": "{0} 며칠?",
		"HOY NO SE ENTRENA": "오늘은 훈련 없음",
		"FELIZ CUMPLEAÑOS": "생일 축하해요",
		"Te esperaban dentro. Alguien del vestuario se acordó, y eso en un vestuario no es poco.": "다들 안에서 기다리고 있었어요. 라커룸의 누군가가 기억해 줬고, 라커룸에서 그건 작은 일이 아니에요.",
		"ENE": "1월",
		"FEB": "2월",
		"MAR": "3월",
		"ABR": "4월",
		"MAY": "5월",
		"JUN": "6월",
		"JUL": "7월",
		"AGO": "8월",
		"SEP": "9월",
		"OCT": "10",
		"NOV": "11",
		"DIC": "12",
		"EL MICRÓFONO ABIERTO": "열린 마이크",
		"Semana de derbi y el periodista deja el micro abierto: '¿os ven por encima de {0}?'. Sabes que lo que digas va a estar en su grada el domingo.": "더비 주간, 기자가 마이크를 켜 둔 채 물어요: '{0}보다 너희가 위라고 보나요?' 내가 한 말이 일요일에 상대 관중석에 걸릴 거예요.",
		"MEDIR LAS PALABRAS": "말 아끼기",
		"SOLTAR LA BRAVATA": "큰소리치기",

		"LLEGAN SIN SU ESTRELLA": "에이스 없는 상대",
		"Tu próximo rival llega sin uno de sus mejores jugadores, que está lesionado. En la rueda de prensa te preguntan si es el partido para aprovecharlo.": "다음 상대는 최고의 선수 한 명이 부상으로 빠진 채 와요. 기자회견에서 이번이 기회를 살릴 경기냐고 물어요.",
		"RESPETAR AL RIVAL": "상대 존중",
		"HAY QUE APROVECHARLO": "기회를 살려야죠",

		"VIENEN LANZADOS": "상승세",
		"{0} llega con cinco victorias seguidas en liga. En la rueda de prensa te preguntan si os dan miedo.": "{0} 클럽은 리그 5연승 중이에요. 기자회견에서 그들이 두렵냐고 물어요.",
		"RESPETO, NO MIEDO": "두려움 아닌 존중",
		"LA RACHA SE ACABA AQUÍ": "연승은 여기서 끝",
		"UN GRANDE HERIDO": "흔들리는 거인",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Te preguntan si es el mejor momento para cruzártelos.": "{0} 클럽은 5경기째 승리가 없고 팬들은 경질을 외치고 있어요. 지금이 그들을 만나기 가장 좋은 때냐고 물어요.",
		"UN GRANDE SIEMPRE ES UN GRANDE": "거인은 언제나 거인",
		"HAY QUE REMATARLOS": "확실히 끝내야죠",
		"BANQUILLO NUEVO ENFRENTE": "상대 벤치에 새 감독",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y la prensa quiere saber si tú sí.": "{0} 클럽은 이번 시즌 새 감독 {1} 체제예요. 아직 아무도 그 전술을 몰라요. 언론은 나는 아는지 궁금해해요.",
		"ESTUDIARLO CON EL MÍSTER": "감독님과 분석하기",
		"QUE SE PREOCUPE ÉL": "그쪽이 걱정할 일",
		"TU ANTIGUO TÉCNICO": "옛 감독",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Los periodistas buscan la foto del reencuentro.": "나를 지도했던 {0} 감독이 이제 {1} 벤치에 앉아 있어요. 기자들은 재회 사진을 노려요.",
		"UN ABRAZO ANTES DEL PARTIDO": "킥오프 전 포옹",
		"HOY ES UN RIVAL MÁS": "오늘은 그냥 상대일 뿐",
		"SU GRAN FICHAJE": "그들의 대형 영입",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Te preguntan si el duelo es entre vosotros dos.": "{1} 클럽이 이번 시즌 {0} 선수를 영입했고, 벌써 베스트 11 핵심이에요. 둘의 맞대결이냐고 물어요.",
		"ES UN PARTIDO DE EQUIPOS": "팀 대 팀의 경기",
		"AQUÍ LE ESPERO": "기다리고 있을게요",
		"CAMPEÓN EN CASA": "고국의 우승팀",
		"En tu país se ha coronado {0}, y la prensa de allí te pregunta si algún día te verán jugar en casa.": "고국에서 {0} 클럽이 우승했어요. 그곳 언론이 언젠가 고국에서 뛰는 모습을 볼 수 있냐고 물어요.",
		"ALGÚN DÍA, QUIÉN SABE": "언젠가, 누가 알아요",
		"AQUÍ ESTOY A GUSTO": "여기서 행복해요",
		"TE PIDEN QUE LO ACLARES": "해명 요청",
		"Tu frase lleva toda la semana en la portada y en la grada de {0}. El club te pregunta si quieres suavizarla antes del domingo.": "내 발언이 일주일 내내 1면과 {0}의 관중석을 장식했어요. 클럽은 일요일 전에 수위를 낮출지 물어요.",
		"SOSTENERLA": "밀고 나가기",
		"SUAVIZARLA": "수위 낮추기",
		"UN GOL EN DOS JORNADAS": "두 경기에 한 골",
		"Te llama al despacho y no se anda con rodeos: si no marcas en las dos próximas jornadas, te sientas.": "감독이 사무실로 불러 돌려 말하지 않아요: 다음 두 경기에서 골을 못 넣으면 벤치행이에요.",
		"AGACHAR LA CABEZA": "받아들이기",
		"DECIRLE LO QUE PIENSAS": "생각 말하기",
		"LO MARCASTE": "해냈어요",
		"Marcaste dentro del plazo. En el pasillo no te dijo nada, pero el lunes tu nombre volvió a la pizarra del once.": "기한 안에 골을 넣었어요. 복도에서는 아무 말 없었지만, 월요일에 내 이름이 다시 선발 명단에 올라갔어요.",
		"SE ACABÓ EL PLAZO": "시간 종료",
		"Dos jornadas, ningún gol. No hizo falta que te lo dijera: el once del domingo ya no te lleva.": "두 경기, 무득점. 말할 필요도 없었어요: 일요일 선발 명단에 내 이름은 없어요.",
		"EL CAPITÁN TE PARA": "주장이 붙잡아요",
		"{0} te espera en la puerta del vestuario. No levanta la voz: te dice que el equipo lleva semanas jugando para ti y que eso se acaba hoy.": "{0} 선수가 라커룸 문 앞에서 기다려요. 목소리를 높이지 않아요: 팀이 몇 주째 나만 위해 뛰고 있었고, 그건 오늘로 끝이래요.",
		"CONTESTARLE": "맞받아치기",
		"TE ESPERAN EN EL TÚNEL": "터널에서 누가 기다려요",
		"Un crío con tu nombre en la espalda lleva media hora esperando en la boca del túnel. Su padre le dice que no molestes, que ya vas tarde.": "등에 내 이름을 단 꼬마가 터널 입구에서 30분째 기다리고 있어요. 아빠는 방해하지 말라고, 이미 늦었다고 말해요.",
		"PARARTE CON ÉL": "멈춰서 챙겨 주기",
		"SALUDAR Y SEGUIR": "손 흔들고 지나가기",
		"TU CASILLERO NO ESTÁ COMO LO DEJASTE": "사물함이 떠날 때와 달라요",
		"Llegas al vestuario y tu hueco está lleno de espuma hasta arriba. Nadie te mira, pero nadie está haciendo nada tampoco.": "라커룸에 들어가니 내 자리가 거품으로 꽉 차 있어요. 아무도 나를 보지 않지만, 아무도 뭘 하지도 않아요.",
		"SEGUIRLES EL JUEGO": "장단 맞추기",
		"LIMPIAR EN SILENCIO": "조용히 치우기",
		"TE PARA EN LA BANDA": "터치라인에서 붙잡아요",
		"Te sustituye, y en vez de darte la mano y mirar al campo te para, te dice algo al oído y te abraza hasta que la grada se levanta.": "감독이 나를 교체하는데, 악수하고 경기장으로 돌아서는 대신 나를 붙잡고 귓속말을 한 뒤 관중석이 일어설 때까지 안아 줘요.",
		"ESCUCHARLE": "귀 기울이기",
		"IRTE AL BANQUILLO": "벤치로 가기",
		"EL ONCE YA ESTÁ DIBUJADO": "선발 11명은 이미 정해졌어요",
		"Entras al vestuario antes que nadie y la pizarra ya tiene el once del domingo. Lo lees dos veces: tu nombre no está en ninguna de las dos.": "누구보다 먼저 라커룸에 들어가니 화이트보드에 일요일 선발 11명이 이미 적혀 있어요. 두 번 읽어 봐요: 두 번 다 내 이름은 없어요.",
		"BORRARLA": "지워 버리기",
		"AQUÍ NO TE OLVIDAN": "여긴 나를 잊지 않았어요",

		"EX CLUB · TITULAR · ~{0} MIN": "친정 · 선발 · ~{0}분",
		"EX CLUB · DESDE LA BANCA · ~{0} MIN": "친정 · 교체 출전 · ~{0}분",
		"SU GRADA NO OLVIDA TU TRASPASO": "이적을 아직 원망해요",
		"SU GRADA RECUERDA TU CESIÓN": "임대 시절을 기억해요",
		"SU GRADA NI SE INMUTA": "팬들은 관심 없어요",
		"TU EX CLUB, DE VISITA": "친정팀이 왔어요",
		"TU EX CLUB, ENFRENTE": "친정팀과 맞대결",
		"{0} · MÁRCALE: HAY PRIMA": "{0} · 골 넣으면 보너스",
		"GOL AL EX CLUB": "친정팀 상대 골",
		"TRAIDOR": "배신자",
		"BENGALA EN EL CÉSPED": "그라운드에 홍염",
		"SE PELEAN EN TU GRADA": "우리 관중석에서 싸움",
		"CANCHA DE {0}": "{0}의 구장",
		"VISITAR MI CASA": "내 집 방문",
		"SALIR DE CASA": "집에서 나가기",
		"SEGUNDO PISO": "2층",
		"TERCER PISO": "3층",
		"Una planta más. Se levanta sobre lo que ya cerraste.": "한 층 더. 이미 벽을 세운 곳 위에 올라가요.",
		"La última planta, y la que se ve desde la calle.": "꼭대기 층, 거리에서 보이는 바로 그 층이에요.",
		"PRIMERO EL SEGUNDO PISO": "2층 먼저",
		"NO HAY NADA CERRADO DEBAJO": "아래에 막힌 공간이 없어요",
		"ADICIONES": "추가 시설",
		"ACABADOS": "마감재",
		"MATERIAL DE ESTA PARED": "이 벽의 재질",
		"EL DE LA CASA": "기본",
		"PISO": "바닥",
		"PARED": "벽",
		"El suelo y la pared, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.":
			"바닥과 벽을 마음대로. 따로 사서 계속 가져요: 언제든 바꿀 수 있어요.",
		"Instaladas: {0} de {1}.": "설치: {0}/{1}.",
		"Muebles, mejoras y mascotas para tu casa. Se compran una vez y las colocas donde quieras desde VISITAR.": "집을 위한 가구, 개선 시설, 반려동물. 한 번 사면 방문에서 원하는 곳에 배치할 수 있어요.",
		"TIENES {0}": "보유: {0}",
		"POR PARTIDO": "경기당",
		"TE CONVIENE": "추천",
		"AL ALCANCE": "구매 가능",
		"COLOCAR AHORA": "지금 배치",
		"Compraste {0}. Está en tus cajas.": "{0} 구매 완료. 상자에 들어 있어요.",
		"Así quedaría tu casa.": "집이 이렇게 바뀌어요.",
		"Nada al alcance en este cajón.": "이 칸에는 살 수 있는 게 없어요.",
		"{0} x {0} m": "{0} x {0} m",
		"OTRA MÁS": "하나 더",
		"OTRA MÁS · {0}": "하나 더 · {0}",
		"Se compran en MI JUGADOR ▸ CASA.": "내 선수 ▸ 집에서 구매해요.",
		"TU CASA se reinicia a 0: se vende y te devuelven el 80% de lo invertido.":
			"내 집이 0으로 초기화돼요: 팔리고 투자액의 80%를 돌려받아요.",
		"INSTALADO": "설치됨",
		"INSTALAR · {0}": "설치 · {0}",
		"Abre: {0}.": "해금: {0}.",
		"Si cambias de club la vendes y empiezas de cero: te devuelven el 80% de lo invertido.":
			"클럽을 옮기면 팔고 처음부터 시작해요: 투자액의 80%를 돌려받아요.",
		"Si cambias de club empiezas de cero: la casa se queda, y te devuelven el 80% de lo invertido.":
			"클럽을 옮기면 처음부터 시작해요: 집은 남고, 투자액의 80%를 돌려받아요.",



		"fuera de la cuadrícula": "격자 밖",
		"se sale del suelo": "바닥 밖",
		"tapa la puerta": "문을 막아요",

		"sin sitio para usarlo": "사용할 공간 없음",
		"tiene que ir pegado a una pared": "벽에 붙여야 해요",
		"no puede mirar a la pared": "벽을 향할 수 없어요",
		"a la intemperie no se cuelga nada": "야외에는 걸 수 없어요",
		"el helipuerto va en el jardín, sobre el pasto": "헬리패드는 정원 잔디 위에 놓아요",
		"el helipuerto pide cielo abierto: ni una pared alrededor": "헬리패드는 탁 트인 하늘이 필요해요: 주변에 벽이 하나도 없어야 해요",

		"TERRENO": "부지",
		"La casa es tuya: te la llevas contigo aunque cambies de club.":
			"집은 내 거예요: 클럽을 옮겨도 함께 가져가요.",
		"Suelo nuevo pegado a tu casa: pártelo con paredes y amuéblalo a tu gusto en el modo edición.":
			"집에 붙은 새 바닥: 편집 모드에서 벽으로 나누고 마음대로 꾸미세요.",
		"TERRENO ESTE": "동쪽 부지",
		"TERRENO DEL FONDO": "뒤쪽 부지",
		"TERRENO OESTE": "서쪽 부지",
		"ALA NORTE": "북쪽 별관",
		"TERRENO DEL GARAGE": "차고 부지",
		"Suelo nuevo pegado a la sala. Tuyo para lo que quieras.":
			"거실에 붙은 새 바닥. 무엇이든 마음대로.",
		"El fondo del edificio, ganado al patio de luces.":
			"채광 마당을 메워 얻은 건물 뒤쪽.",
		"Suelo nuevo junto a la recámara.":
			"침실 옆 새 바닥.",
		"El fondo del patio, allanado y tuyo.":
			"평평하게 다진 정원 뒤쪽, 이제 내 땅.",
		"Suelo nuevo sobre el gimnasio, con paso a la sala.":
			"체육관 위 새 바닥, 거실로 이어져요.",
		"Del jardín a la sala de premios, todo tuyo.":
			"정원부터 트로피 룸까지, 전부 내 거.",
		"Un ala entera tras el salón, pegada a la suite.":
			"홀 뒤의 별관 전체, 스위트룸 바로 옆.",
		"El costado del garage, listo para lo que sea.":
			"차고 옆 공간, 무엇이든 준비 완료.",
		"AMPLIAR · {0}": "확장 · {0}",
		"YA ES TUYO": "이미 보유",

		"VENTANA": "창문",
		"VENTANA NUEVA": "새 창문",
		"Una ventana más, en el muro que tú elijas.":
			"원하는 벽에 창문 하나 더.",
		"Luz de verdad en el muro que tú elijas.":
			"원하는 벽에 진짜 햇살을.",

		"VENTANAL": "통창",
		"OJO DE BUEY": "둥근 창",
		"Del suelo al techo: el muro entero se vuelve luz.":
			"바닥부터 천장까지: 벽 전체가 빛이 돼요.",
		"Un redondel alto, para el rincón que pide poco.":
			"높이 달린 작고 둥근 창, 소박한 구석을 위해.",

		"~{0} partidos de sueldo": "주급 ~{0}경기분",
		"menos de un partido de sueldo": "1경기 주급 미만",
		"TE CONVIENE: llegas justo de energía":
			"추천: 에너지가 부족해요",
		"TE CONVIENE: el vestuario anda frío":
			"추천: 라커룸 분위기가 냉랭해요",
		"TE CONVIENE: la afición anda fría": "추천: 팬들 반응이 냉랭해요",
		"TE CONVIENE: la prensa no habla de ti":
			"추천: 언론이 나를 다루지 않아요",
		"TE CONVIENE: el técnico no te ve":
			"추천: 감독이 나를 눈여겨보지 않아요",
		"TE CONVIENE: tu agente no se mueve":
			"추천: 에이전트가 움직이지 않아요",

		"VER": "보기",
		"AQUI VA: {0}": "여기에: {0}",
		"REPISA DE PARED": "벽 선반",
		"Una balda más para tus trofeos, donde tú digas.":
			"트로피를 올릴 선반 하나 더, 원하는 곳에.",
		"MASCOTA": "반려동물",
		"PERRO": "강아지",
		"GATO": "냥이",
		"Un perro que te espera y te sigue por los cuartos.":
			"나를 기다리고 방마다 따라다니는 강아지.",
		"Un gato que pasea a lo suyo... y a veces te sigue.":
			"제멋대로 돌아다니는 고양이... 가끔은 따라와요.",

		"YA TIENES {0}": "보유: {0}",



		"TECNICO": "감독",
		"AFICION": "팬",


		"TU CASA": "내 집",
		"{0} de {1} adiciones": "추가 시설 {0}/{1}",
		"PATRIMONIO": "재산",
		"La mejor casa de tu carrera: {0}.": "커리어 최고의 집: {0}.",
		"Se quedó atrás con un traspaso.": "이적하면서 두고 왔어요.",

		"RECIBIR VISITA": "손님 초대",


		"ESTILO NORDICO": "노르딕 스타일",
		"Madera clara y paredes de leche: la casa respira.":
			"밝은 원목과 우유빛 벽: 집이 숨을 쉬어요.",
		"ESTILO NOCTURNO": "나이트 스타일",
		"Grafito, humo y madera oscura. Serio como un 0-0 fuera.":
			"흑연, 연기, 어두운 원목. 원정 0-0처럼 진지해요.",
		"ESTILO DEL CLUB": "클럽 스타일",
		"Telas y detalles con los colores de tu escudo.":
			"엠블럼 색으로 꾸민 패브릭과 소품.",
		"MUDANZA": "이사",
		"LAS LLAVES SON TUYAS": "열쇠는 이제 내 거",
		"EL SOLAR CRECE": "부지가 넓어져요",





		"EL DIA DESPUES": "그다음 날",
		"HOY MEJOR NO SALIR": "오늘은 외출 금지",
		"EL MARCADOR": "스코어",
		"Mañana en el barrio no se hablará de otra cosa.":
			"내일 동네에선 이 얘기뿐일 거예요.",
		"Esa bandera la ataron a tu reja de madrugada.":
			"새벽에 누군가 그 깃발을 우리 집 울타리에 묶어 놨어요.",
		"LO QUE COSTO": "치른 대가",

		"Tu agente te esperaba: hay ofertas sobre la mesa.":
			"에이전트가 기다리고 있었어요: 제안이 들어와 있어요.",
		"Un compañero vino a revivir la goleada.":
			"동료가 대승을 다시 곱씹으러 왔어요.",
		"Un compañero pasó a saludar.": "동료가 인사하러 들렀어요.",
		"{0} vino a revivir la goleada.": "{0} 선수가 대승을 다시 곱씹으러 왔어요.",
		"{0} pasó a saludar.": "{0} 선수가 인사하러 들렀어요.",
		"{0} se queda hasta tarde. El vestuario se entera de cómo vives.":
			"{0} 선수가 늦게까지 머물러요. 라커룸에 내가 사는 모습이 소문나요.",
		"YA RECIBISTE ESTA SEMANA": "이번 주 이미 초대함",
		"¿A QUIÉN RECIBES?": "누구를 초대할까요?",
		"Tu casa de hoy rinde {0} de hospitalidad.":
			"오늘 내 집의 접대 점수: {0}.",
		"HOY NO": "오늘은 패스",
		"A UN COMPAÑERO": "동료",
		"AL TÉCNICO": "감독",
		"A TU AGENTE": "내 에이전트",
		"Se queda hasta tarde. El vestuario se entera de cómo vives.":
			"늦게까지 머물러요. 라커룸에 내가 사는 모습이 소문나요.",
		"Café, vídeo y charla larga. Te ve como alguien serio.":
			"커피, 영상, 긴 대화. 나를 진지한 선수로 봐요.",
		"Negocio en la sala de tu casa: aquí las cifras suenan mejor.":
			"우리 집 거실에서 하는 비즈니스: 여기선 숫자가 더 좋게 들려요.",

		"ESTA SEMANA, EN CASA": "이번 주, 집에서",
		"Te quedan {0} de {1} acciones.": "남은 행동: {0}/{1}.",
		"ya, esta semana": "이번 주 완료",
		"YA LO HICISTE ESTA SEMANA": "이번 주 이미 했어요",
		"NO TE QUEDA TIEMPO ESTA SEMANA": "이번 주 남은 시간 없음",
		"de energía": "에너지",
		"DORMIR DE VERDAD": "푹 자기",
		"Ocho horas seguidas y el cuerpo lo agradece.":
			"8시간 내리 자면 몸이 고마워해요.",
		"COMER BIEN": "잘 먹기",
		"Cocinas tú, y comes lo que te toca comer.":
			"직접 요리하고, 먹어야 할 걸 먹어요.",
		"ESTUDIAR AL RIVAL": "상대 분석",
		"Te tragas el partido del rival con libreta.":
			"노트를 펴고 상대 경기를 끝까지 봐요.",
		"NADAR": "수영",
		"Largos suaves: descarga las piernas sin cargarlas.":
			"가볍게 몇 바퀴: 다리에 부담 없이 피로를 풀어요.",
		"INVITAR AL VESTUARIO": "동료 초대",
		"Caen dos compañeros y se hace de noche jugando.":
			"동료 두 명이 놀러 와서 밤늦게까지 게임해요.",
		"SALIR A RODAR": "드라이브",
		"Estrenas: {0}.": "새로운 공간: {0}.",
		"JUGAR AL SNAKE": "스네이크 게임",
		"SNAKE": "SNAKE",
		"DESLIZA PARA GIRAR": "밀어서 방향 전환",
		"TOCA PARA OTRA": "터치해서 다시",
		"SE ACABO · {0}": "게임 오버 · {0}",
		"¡RECORD! · {0}": "최고 기록! · {0}",
		"PUNTOS {0}   ·   RECORD {1}": "점수 {0}   ·   최고 {1}",
		"AL VESTUARIO ENTERO": "선수단 전체",
		"Veinticinco tíos en tu casa hasta la madrugada. La química se cocina.":
			"스물다섯 명이 새벽까지 우리 집에. 케미가 무르익어요.",
		"PIDE {0}": "필요: {0}",
		"Necesitas {0} en tu casa.": "집에 {0} 필요해요.",
		"LEVANTAR PESAS": "웨이트",
		"Una hora seria de hierro. El técnico se entera.":
			"제대로 한 시간 쇠질. 감독도 알아봐요.",
		"CORRER EN LA CINTA": "러닝머신 달리기",
		"Fondo tranquilo: llegas al domingo con otra gasolina.":
			"꾸준한 유산소: 일요일에 연료가 더 남아 있어요.",
		"Una vuelta sin rumbo. La gente te saluda.":
			"목적지 없는 드라이브. 사람들이 손을 흔들어요.",
		"JUGAR CON TU MASCOTA": "반려동물과 놀기",
		"Media hora de correr tras algo que no cuenta.":
			"점수에 안 들어가는 걸 30분 동안 쫓아다녀요.",
		"PARED DE MOMENTOS": "추억의 벽",
		"Tus récords, enmarcados donde se vean.":
			"내 기록들, 잘 보이는 곳에 액자로.",
		"MAQUETA DEL ESTADIO": "경기장 모형",
		"Tu estadio en miniatura, con los colores de tu club.":
			"내 클럽 색으로 칠한 미니어처 경기장.",
		"ARCADE RETRO": "레트로 오락기",
		"Partidas viejas para despejar la cabeza. El vestuario pide turno.":
			"머리를 식히는 고전 게임. 라커룸이 줄을 서요.",
		"PISCINA": "수영장",
		"Largos suaves al día siguiente: las piernas lo agradecen.":
			"다음 날 가볍게 몇 바퀴: 다리가 고마워해요.",
		"MOTO DE COLECCIÓN": "컬렉션 바이크",
		"El garage por fin parece garage.":
			"차고가 드디어 차고다워요.",
		"MAQUETA DE TU ESTADIO": "내 경기장 모형",
		"ARCADE": "오락기",
		"MOTO": "모토",
		"ESTUDIO DE VIDEO": "영상 분석실",
		"Estudias al rival en tu sala. El técnico lo agradece.":
			"내 방에서 상대를 분석해요. 감독이 좋아해요.",
		"ASADOR EN EL PATIO": "마당 바비큐",
		"El vestuario viene a comer. La química se cocina.":
			"동료들이 밥 먹으러 와요. 케미가 무르익어요.",
		"JACUZZI": "자쿠지",
		"Piernas nuevas al día siguiente del partido.":
			"경기 다음 날 다리가 새것처럼.",
		"SALA DE CINE": "홈시어터",
		"Desconectas de verdad. Y todos quieren venir.":
			"제대로 쉬어요. 그리고 다들 놀러 오고 싶어 해요.",
		"SPA CON FISIO": "물리치료 스파",
		"Tratamiento en casa: el mejor descanso que se compra.":
			"집에서 받는 치료: 돈으로 살 수 있는 최고의 휴식.",
		"CANCHA DE ENTRENAMIENTO": "훈련 구장",
		"Sales de casa y practicas campo abierto cuando quieras.":
			"밖으로 나가 언제든 오픈 필드 연습을 해요.",
		"SALIR A ENTRENAR": "훈련하러 나가기",



		"MODO EDICION": "편집 모드",



		"INVENTARIO": "인벤토리",
		"TUS COSAS": "내 물건",
		"EN LA CASA": "집 안",
		"EN CAJAS": "보관 중",
		"Aquí no hay nada todavía.": "아직 아무것도 없어요.",
		"No te sobra nada: todo lo que compraste está puesto en la casa.": "남는 게 없어요: 산 물건이 전부 집에 배치돼 있어요.",


		"EXHIBICION": "전시",
		"OCIO": "여가",
		"ENTRENAR": "훈련",
		"DECORACION": "장식",

		"ALFOMBRA": "러그",




		"Aquí se duerme de verdad y se recupera la energía.": "푹 자고, 에너지를 되찾아요.",
		"Donde se reciben las visitas del vestuario.": "라커룸 동료들을 맞이하는 곳.",
		"Un sitio más donde sentarse sin ocupar medio cuarto.": "방 절반을 차지하지 않는 앉을 자리 하나 더.",
		"Comer bien en casa cuesta menos que comer fuera.": "집에서 잘 먹는 게 외식보다 싸요.",
		"El centro de la sala: todo lo demás se acomoda alrededor.": "거실의 중심: 나머지는 전부 그 주위로.",
		"Tus copas, a la vista. Cuantas más perchas, más palmarés.": "내 트로피를 한눈에. 선반이 늘수록 우승 경력도 늘어요.",
		"La vitrina del que empieza: pocas copas, pero las tuyas.": "초보의 진열장: 트로피는 적어도, 전부 내 거.",
		"Una playera enmarcada por cada club en el que jugaste.": "뛰었던 클럽마다 액자에 넣은 유니폼 한 벌.",
		"Los récords de tu carrera, colgados.": "벽에 걸린 내 커리어 기록.",
		"Lo único de la tienda que se exhibe en casa.": "상점에서 산 것 중 집에 전시하는 유일한 물건.",
		"Estudiar al rival antes del partido.": "킥오프 전에 상대를 분석해요.",
		"Una partida no cuesta acción de semana. Se está por estar.": "한 판은 주간 행동을 쓰지 않아요. 그냥 재미로.",
		"Tu estadio en pequeño, con su marcador.": "전광판까지 갖춘 미니 경기장.",
		"Nadar descansa y no gasta energía de entrenamiento.": "수영은 훈련 에너지를 쓰지 않고 쉬게 해 줘요.",
		"Salir a rodar. No sirve para nada y por eso está.": "드라이브. 아무 쓸모 없는 게 바로 포인트예요.",
		"El rack con la barra: levantar pesas sube tu físico.": "랙과 바벨: 웨이트로 피지컬이 올라가요.",
		"La torre de mancuernas. Un rack solo no hace un gimnasio.": "덤벨 타워. 랙 하나로는 헬스장이 안 돼요.",
		"Correr en casa los días que no hay cancha.": "구장이 없는 날엔 집에서 달려요.",
		"Va debajo de todo y no estorba a nada.": "모든 것 아래에 깔려서 아무것도 방해하지 않아요.",
		"Verde en un rincón. Cuesta poco y se nota.": "구석에 초록빛. 싸지만 티가 나요.",
		"Luz propia en el rincón que quede oscuro.": "어두운 구석을 밝히는 조명.",
		"Se apoya a ras de muro y llena una pared entera.": "벽에 딱 붙어서 벽 하나를 꽉 채워요.",
		"De cuerpo entero. Pide muro, como todo lo que cuelga.": "전신 거울. 걸어 두는 건 모두 벽이 필요해요.",

		"{0} EN CAJAS": "보관 중 {0}",
		"{0} EN CAJAS · VALEN {1}": "보관 중 {0} · 가치 {1}",
		"VENDER {0}": "판매 {0}",
		"¿SEGURO? SE VAN {0} PIEZAS": "정말요? {0}개가 사라져요",
		"MANTÉN PARA VENDER": "길게 눌러 판매",
		"MANTÉN · SE VAN {0} PIEZAS": "길게 누르기 · {0}개 판매",
		"SALDO {0}": "잔액 {0}",
		"{0} x {1} celdas  ·  {2} m de alto": "{0} x {1}칸  ·  높이 {2} m",
		"EN CAJAS · TOCA PARA SACARLO": "보관 중 · 터치해서 꺼내기",
		"EN LA CASA · TOCA PARA GUARDARLO": "집 안 · 터치해서 보관",


		"MASCOTAS": "반려동물",


		"OTRO": "다음",
		"OTRO ({0}/{1})": "다음 ({0}/{1})",


		"PAREDES": "벽",
		"MUEBLES": "가구",
		"PONER AQUI": "여기 배치",
		"INICIAR PARED": "벽 시작",
		"FIN DE PARED": "벽 끝",
		"CANCELAR TRAZO": "취소",
		"BAÑO": "욕실",
		"INODORO": "변기",
		"Cerámica, tapa y cisterna para completar el baño.":
			"도기, 뚜껑, 물탱크로 욕실을 완성해요.",
		"Lavabo con espejo y grifo, listo junto al muro.":
			"거울과 수도꼭지가 달린 세면대, 벽에 바로 설치.",
		"Mampara de cristal y regadera para el rincón del baño.":
			"욕실 구석에 놓는 유리 칸막이와 샤워기.",
		"Una tina de baño de borde ancho.": "테두리가 넓은 욕조.",
		"LAVABO": "세면대",
		"DUCHA": "샤워",
		"TINA": "욕조",
		"Lo primero que echa en falta una casa.": "집에서 가장 먼저 아쉬운 것.",
		"Con espejo, para mirarte antes de salir.": "거울 달림, 나가기 전에 한 번 확인.",
		"Agua caliente después de entrenar.": "훈련 후의 뜨거운 물.",
		"Para las piernas cargadas de después del partido.": "경기 후 무거운 다리를 위해.",
		"AMPLIAR EL TERRENO": "부지 확장",
		"PARED DE CAMISETAS": "유니폼 벽",
		"Donde van las copas que ganas.": "따낸 트로피가 놓이는 곳.",
		"Una playera por cada club en el que jugaste.": "뛰었던 클럽마다 유니폼 한 벌.",
		"Para los trofeos que no caben en la vitrina.": "진열장에 다 안 들어가는 트로피를 위해.",
		"LEVANTAR PARED": "벽 세우기",
		"TIRAR ESTA PARED": "이 벽 허물기",
		"REHACER ESTA PARED": "이 벽 다시 세우기",

		"PONER PUERTA": "문 달기",
		"QUITAR PUERTA": "문 떼기",
		"DEJARIA SIN PASO": "통로가 막혀요",
		"las paredes van rectas": "벽은 직선으로만",
		"demasiado corta": "너무 짧아요",
		"ahí no hay suelo": "거긴 바닥이 없어요",
		"te quedarías dentro": "안에 갇히게 돼요",
		"dejarías {0} sin paso": "{0}의 통로가 막혀요",
		"HOY NO SALE · TOCA PARA SACARLA": "오늘은 안 나옴 · 터치해서 꺼내기",
		"ANDA POR LA CASA · TOCA PARA GUARDARLA": "집 안을 돌아다니는 중 · 터치해서 넣기",
		"TAPETES": "러그",



		"CUADRO DE PARED": "벽 그림",
		"CUADRO GRANDE": "대형 캔버스",
		"ÓLEO DE AUTOR": "사인 유화",
		"BANDERINES": "가랜드",
		"MIS BUFANDAS": "내 머플러",
		"MIS BOTINES": "내 축구화",

		"MUSEO DE BALONES": "축구공 박물관",
		"ESCUDO DEL CLUB": "클럽 엠블럼",
		"BANDERINES DE CAMBIO": "교환 페넌트",
		"TIFO ENMARCADO": "액자 속 티포",
		"BALONES DE TEMPORADA": "시즌 공인구",
		"BUTACAS DEL ESTADIO": "경기장 좌석",
		"ALFOMBRA DEL CÍRCULO": "센터서클 러그",
		"CASILLERO DEL VESTIDOR": "라커룸 사물함",
		"TAPIZ": "태피스트리",
		"PANEL DE MADERA": "원목 패널",
		"MAPA DE GIRAS": "투어 지도",
		"CARTEL DE PARTIDO": "경기 포스터",
		"PORTADA ENMARCADA": "액자 속 헤드라인",
		"PLACA DE FICHAJE": "이적 기념패",
		"AUN NO SE JUEGA": "아직 경기 전",
		"VS {0}": "VS {0}",
		"{0} GOLES · NOTA {1}": "{0}골 · 평점 {1}",
		"\"EL QUE VIENE PISANDO FUERTE\"": "\"주목할 신예\"",
		"DE LA CANTERA": "유스 출신",
		"El cartel de tu mejor partido: rival, goles y nota.":
			"최고의 경기 포스터: 상대, 골, 평점.",
		"La portada del día que ganaste algo. Se reescribe sola.":
			"무언가를 우승한 날의 신문 1면. 저절로 다시 쓰여요.",
		"El club, la temporada y lo que costó tu fichaje.":
			"클럽, 시즌, 그리고 내 이적료.",
		"PANTALLA DE MURO": "벽걸이 스크린",
		"CHIMENEA": "벽난로",
		"PLAFÓN": "천장등",
		"ARAÑA": "샹들리에",
		"APLIQUE": "벽등",
		"LÁMPARA DE BURÓ": "침대 옆 스탠드",
		"RÓTULO DE NEÓN": "네온 사인",
		"TIRA LED": "LED 스트립",
		"MACETERO": "대형 화분",
		"PECERA DE PIE": "스탠드 수족관",
		"CARRITO DE REFRESCOS": "음료 카트",
		"PUF": "푸프",
		"BAÚL": "수납함",
		"PERCHERO": "옷걸이",
		"NEVERA DE JUGOS": "주스 냉장고",
		"TOCADISCOS": "턴테이블",
		"Un lienzo con marco. Lo más barato contra un muro pelado.":
			"액자에 넣은 캔버스. 휑한 벽을 가장 싸게 채우는 방법.",
		"Metro y medio de lienzo. Ya no es un detalle.":
			"1.5미터짜리 캔버스. 더 이상 소품이 아니에요.",
		"Dos metros firmados. La pared entera es él.":
			"사인이 들어간 2미터. 벽 전체가 그림이 돼요.",
		"Los de tus clubes, cruzando el rincón en diagonal.":
			"거쳐 온 클럽들의 색, 구석을 가로질러 걸려 있어요.",
		"Una bufanda por cada afición que te cantó.":
			"내 이름을 불러 준 팬들마다 머플러 하나씩.",
		"Los botines de tus noches grandes, en peanas.":
			"빅매치의 밤에 신었던 축구화, 받침대 위에.",
		"Treinta y dos balones tras el cristal, con luz de museo.":
			"유리 너머 축구공 32개, 박물관 조명까지.",
		"El escudo de tu club, retroiluminado contra el muro.":
			"벽에 붙은 백라이트 클럽 엠블럼.",
		"Un banderín de intercambio por cada club que pisaste.":
			"뛰었던 클럽마다 교환 페넌트 하나씩.",
		"Un trozo del tifo que te dedicó tu grada, enmarcado.":
			"우리 관중석이 나를 위해 만든 티포 한 조각, 액자에 담아.",
		"Un balón por temporada, con los colores de aquel año.":
			"시즌마다 공 하나, 그해의 색으로.",
		"Dos butacas originales de la grada, con su número.":
			"관중석의 진짜 좌석 두 개, 번호까지 그대로.",
		"El círculo central tejido, con tu escudo en medio.":
			"센터서클을 짜 넣고 가운데에 엠블럼을.",
		"Tu taquilla del vestidor, con tu dorsal en la puerta.":
			"라커룸 내 사물함, 문에는 내 등번호.",
		"Un tramo de muro con otra tela, de suelo a techo.":
			"바닥부터 천장까지 다른 천을 두른 벽 한 구간.",
		"Duelas de suelo a techo: el muro deja de ser pared.":
			"바닥부터 천장까지 원목 루버: 벽이 벽이 아니게 돼요.",
		"Un mapamundi con una chincheta en cada país donde jugaste. Se llena solo.":
			"뛰어 본 나라마다 핀을 꽂은 세계 지도. 저절로 채워져요.",
		"La pantalla colgada, sin mueble que la sostenga.":
			"받침대 없이 벽에 건 스크린.",
		"Fuego de verdad: da luz propia y calienta el rincón.":
			"진짜 불: 스스로 빛나고 구석을 데워 줘요.",
		"Luz de techo, la que hace que un cuarto deje de ser cueva.":
			"천장 조명 — 방이 동굴이 되지 않게 해 줘요.",
		"Cristal colgado en medio del salón. Se nota al entrar.":
			"거실 한가운데 매달린 크리스털. 들어서자마자 눈에 띄어요.",
		"Va en pareja, uno a cada lado del muro que enseñas.":
			"두 개 한 쌍으로, 자랑하는 벽 양쪽에 하나씩.",
		"Con su buró incluido, para leer sin encender el cuarto.":
			"협탁 포함, 방 불을 켜지 않고도 책을 읽어요.",
		"Tu nombre en neón, encendido toda la noche.":
			"밤새 빛나는 네온 속 내 이름.",
		"Bordea el muro y baña el cuarto de color.":
			"벽을 따라 둘러 방을 색으로 물들여요.",
		"Verde de metro ochenta para el rincón que sobra.":
			"아무도 안 쓰는 구석에 1.8미터 초록.",
		"Una columna de agua con peces. No hace nada y se mira.":
			"물고기가 사는 물기둥. 하는 일은 없지만 계속 보게 돼요.",
		"Refrescos a mano cuando llega la visita.":
			"손님이 오면 바로 꺼내는 음료.",
		"Se tira al suelo y ya hay un sitio más donde caer.":
			"바닥에 툭 두면 털썩 앉을 자리가 하나 더.",
		"Guarda lo que no se enseña, y hace de banco.":
			"전시하지 않는 물건을 넣고, 벤치로도 써요.",
		"Donde va la chamarra al entrar por la puerta.":
			"들어오자마자 재킷을 거는 곳.",
		"Jugos en frío, iluminados. La compra del que presume.":
			"조명 아래 시원한 주스. 자랑하고 싶은 사람의 선택.",
		"Vinilo, brazo y altavoces sobre su mueble de madera.":
			"원목 장 위에 바이닐, 톤암, 스피커.",
		"El suelo deja de estar desnudo.": "바닥이 더는 휑하지 않아요.",
		"PLANTAS": "식물",
		"Algo vivo en cada cuarto.": "방마다 살아 있는 무언가를.",
		"Los libros visten más que el mármol.":
			"책은 대리석보다 방을 더 멋지게 꾸며요.",
		"LÁMPARAS DE PIE": "플로어 스탠드",
		"Rincones cálidos al caer la tarde.": "해 질 녘의 따뜻한 구석.",
		"RECÁMARA": "침실",
		"SUITE": "스위트",
		"SALÓN": "라운지",
		"Camina y mira lo que has ganado": "둘러보며 내가 이룬 걸 확인하세요",
		"Por colocar: {0} en cajas": "배치 대기: 상자에 {0}",
		"Lo que se compra aquí, por secciones:": "여기서 살 수 있는 것, 구역별로:",
		"ENTRAR": "입장",
		"LA SIGUIENTE": "다음 집",
		"EL TECHO": "최고",
		"No hay casa mejor. Ahora llénala.":
			"이보다 좋은 집은 없어요. 이제 채우세요.",
		"Descanso: +{0} de energía tras cada partido.":
			"휴식: 경기마다 에너지 +{0}.",
		"Suma +{0} de energía tras cada partido.":
			"경기마다 에너지 +{0}.",
		"Sólo cabe en el jardín de un solar de {0} x {0} o más.": "{0} x {0} 이상 부지의 정원에만 들어가요.",
		"Mantenimiento: {0} por partido.": "유지비: 경기당 {0}.",
		"MUDARSE · {0}": "이사 · {0}",
		"TE FALTA {0}": "{0} 부족",
		"SALA": "거실",
		"PATIO": "마당",
		"JARDIN": "정원",
		"SALA DE TROFEOS": "트로피 룸",
		"SALA DE PREMIOS": "시상 룸",
		"GALERIA": "갤러리",
		"GARAGE": "차고",
		"CANCHA": "구장",
		"SOFÁ": "소파",
		"MESA": "테이블",
		"REPISA": "선반",
		"CAMA": "침대",
		"VITRINA": "트로피 진열장",
		"MARCO": "액자",
		"BANCA": "벤치",
		"AUTO": "차",
		"PORTERÍA": "골대",




		"A PRESTAMO": "임대 중",
		"MESA DE POQUER": "포커 테이블",
		"AQUI": "여기",
		"SUELO": "바닥",
		"BASTA": "완료",
		"PINTAR TODAS LAS PAREDES": "모든 벽 칠하기",
		"PINTAR SUELO": "바닥 칠하기",
		"DEJAR DE PINTAR": "칠하기 끝",
		"QUITAR PINTURA": "페인트 지우기",
		"QUITAR PISO": "바닥 지우기",
		"Ancho de la brocha, en casillas.": "붓 너비, 칸 단위.",
		"PINTAR ESTE CUARTO": "이 방 칠하기",
		"Se pinta el cuarto donde tengas la mano.": "손이 있는 방을 칠해요.",
		"DERRIBAR EN LINEA": "일렬로 철거",
		"DEJAR LA MAZA": "해머 내려놓기",
		"EMPEZAR DERRIBO": "철거 시작",
		"TIRAR LO MARCADO": "표시한 곳 철거",
		"DERRIBAR": "철거",
		"PASTO": "잔디",
		"Ciegas: {0} y {1}": "블라인드: {0} / {1}",
		"{0} se retira": "{0} 폴드",
		"{0} pasa": "{0} 체크",
		"{0} iguala": "{0} 콜",
		"{0} sube a {1}": "{0}, {1}까지 레이즈",
		"PAREJA": "원페어",
		"relacionesPAREJA": "연인",
		"ESCALERA": "스트레이트",
		"COLOR": "플러시",
		"FULL": "풀하우스",
		"PREFLOP": "프리플롭",
		"FLOP": "플롭",
		"TURN": "턴",
		"RIVER": "리버",
		"SHOWDOWN": "쇼다운",
		"SIGUENOS":
			"팔로우",
		"Síguenos y comparte el juego con tus amigos.":
			"팔로우하고 친구들과 게임을 공유하세요.",
		"COMPARTIR EL JUEGO": "게임 공유",
		"COMPARTIR": "공유",
		"ENLACE COPIADO · PÉGALO DONDE QUIERAS": "링크 복사됨 · 원하는 곳에 붙여넣기",
		"PULSA OTRA VEZ PARA SALIR": "한 번 더 누르면 종료",
		"VALORAR EL JUEGO": "게임 평가하기",
		"GIRAR": "회전",
		"CAJA": "상자",
		"MUEBLE": "가구",
		"GUARDA": "보관",
		"ANULAR": "취소",
		"MOVER": "이동",
		"ALZAR": "세우기",
		"TRAZAR": "그리기",
		"TIRAR": "철거",
		"NO PASA": "통과 불가",
		"PINTAR": "칠하기",
		"GIRO": "회전",
		"COLGAR PLAYERAS": "유니폼 걸기",
		"PLAYERA ENMARCADA": "액자 속 유니폼",
		"COLGAR PLAYERA": "유니폼 걸기",
		"Una playera enmarcada, la que tú elijas. Cuelga las que quieras.": "원하는 유니폼 한 벌을 액자에. 원하는 만큼 걸 수 있어요.",
		"MARCO {0} · VACÍO": "액자 {0} · 비어 있음",
		"MARCO {0}": "액자 {0}",
		"AUTOMÁTICO": "자동",
		"DORSAL": "등번호",
		"Toca el número que quieras. Los que llevan tus compañeros se piden dos veces.": "원하는 번호를 터치하세요. 동료가 쓰는 번호는 두 번 터치해야 해요.",
		"El {0} lo lleva {1}. Toca otra vez y te lo pones: a él le dan otro.": "{0}번은 {1} 선수가 달고 있어요. 한 번 더 터치하면 가져와요: 그 선수는 다른 번호를 받아요.",
		"El {0} lo lleva {1}. Mantén y te lo pones: a él le dan otro.": "{0}번은 {1} 선수가 달고 있어요. 길게 누르면 가져와요: 그 선수는 다른 번호를 받아요.",
		"DEJARLO AUTOMÁTICO": "자동으로 두기",
		"SILLA": "의자",
		"Para sentarse a la mesa.": "식탁에 앉기 위해.",
		"BANCO DE BARRA": "바 스툴",
		"Para la barra de la cocina.": "주방 카운터용.",
		"SILLÓN": "안락의자",
		"Tu sitio para ver el partido.": "경기 보는 내 자리.",
		"Tu solar pasa a {0} x {0}. Crece por los cuatro lados.":
			"부지가 {0} x {0} 크기로 넓어져요. 네 방향 모두 커져요.",
		"{0} en una edición de {1}": "{1} 단일 대회 {0}",
		"Mejor media": "최고 평균",
		"{0} va con todo ({1})": "{0} 올인 ({1})",
		"{0} se lleva {1} (los demás se fueron)":
			"{0}, {1} 획득 (나머지 폴드)",
		"Gana {0} con {1} ({2})": "{0} 승리: {1} ({2})",




		"ARCE CLARO": "밝은 메이플",
		"HORMIGÓN": "콘크리트",
		"MÁRMOL": "대리석",
		"CARBÓN": "차콜",
		"PARTIDA DE PÓQUER": "포커 나이트",
		"Invitas, se reparten cartas y se juega con tu dinero.":
			"초대하면 카드가 돌고, 진짜 돈으로 게임해요.",
		"LOS DEL VESTUARIO": "라커룸 멤버",
		"Tres compañeros y una noche larga.":
			"동료 세 명과 기나긴 밤.",
		"GENTE DE OTROS CLUBES": "다른 클럽 선수들",
		"Se juega más fuerte, y se cuenta por ahí.":
			"판돈이 더 크고, 소문도 나요.",
		"GENTE CONOCIDA": "유명 인사",
		"Apuestas de las que salen en el periódico.":
			"신문에 나오는 판돈.",
		"CARTA ALTA": "하이카드",
		"DOBLE PAREJA": "투페어",
		"TRÍO": "트리플",
		"PÓQUER": "포카드",
		"ESCALERA DE COLOR": "스트레이트 플러시",
		"PUNTERÍA": "조준",
		"AQUI GIRA": "여기서 회전",
		"SIN MESA": "탁자 없음",
		"dejarías un rincón sin paso":
			"구석의 통로가 막혀요",
		"Solo ante el portero: define el mano a mano.":
			"골키퍼와 1대1: 승부를 끝내세요.",
		"Jala hacia atrás y suelta al arco": "뒤로 당겼다가 골문을 향해 놓으세요",
		"Disparo de frente: aprovecha el ángulo abierto.":
			"정면 슈팅: 열린 각도를 활용하세요.",
		"Jala y suelta con fuerza al arco": "당겼다가 골문을 향해 세게 놓으세요",
		"Desde lejos: la puntería pesa más que la fuerza.":
			"중거리: 파워보다 정확도가 중요해요.",
		"Apunta fino y suelta al arco": "정교하게 조준하고 골문을 향해 놓으세요",
		"Ángulo cerrado: mete efecto para colarla.":
			"좁은 각도: 회전을 걸어 감아 넣으세요.",
		"Curva el tiro hacia el palo largo": "먼 쪽 골대로 감아 차세요",
		"Contragolpe: resuelve antes de que cierre la defensa.":
			"역습: 수비가 닫히기 전에 마무리하세요.",
		"Jala y suelta antes de que te tapen":
			"막히기 전에 당겼다가 놓으세요",
		"El balón es TUYO y estás en la banda: cuélgalo al área o prueba el tiro escorado.":
			"공은 내 거예요. 측면에 있으니 박스로 올리거나 각도 없는 슈팅을 노려 보세요.",
		"Jala y suelta: al área o al arco":
			"당겼다가 놓기: 박스로, 또는 골문으로",
		"Tiro libre directo: sortea la barrera al arco.":
			"직접 프리킥: 수비벽을 넘겨 골문으로.",
		"Jala y suelta por encima de la barrera":
			"당겼다가 수비벽 위로 놓으세요",
		"Córner: coloca el centro para el remate.":
			"코너킥: 마무리할 수 있게 크로스를 올리세요.",
		"Pon el balón al corazón del área":
			"박스 한가운데로 공을 보내세요",
		"Penal: tú y el portero, a sangre fría.":
			"페널티킥: 나와 골키퍼, 냉정하게.",
		"Elige tu lado y suelta ajustado":
			"방향을 정하고 구석으로 놓으세요",
		"Falta al borde del área: monta el disparo desde fuera.":
			"박스 바로 앞 프리킥: 밖에서 슈팅을 준비하세요.",
		"Jala y suelta buscando el hueco":
			"빈틈을 노려 당겼다가 놓으세요",
		"Saque de banda: reanuda el ataque con un compañero.":
			"스로인: 동료와 함께 공격을 다시 시작하세요.",
		"Saca rápido hacia un compañero": "동료에게 빠르게 던지세요",
		"Cancha entera y sin reloj: siente la conducción y tira cuando quieras.":
			"필드 전체, 시간 제한 없음: 드리블을 느끼고 원할 때 슈팅하세요.",
		"Arrastra para conducir; suelta en el círculo para tirar":
			"드래그로 드리블, 원 안에서 놓으면 슈팅",
		"Ganas COMPLETANDO el pase largo a la otra banda, no marcando.":
			"골이 아니라 반대편 측면으로 롱패스를 성공시키면 이겨요.",
		"Apunta al compañero de la otra banda":
			"반대편 측면의 동료를 조준하세요",
		"Aquí NO se tira: llega a las zonas rojas para salir limpio.":
			"여기선 슈팅 금지: 빨간 구역에 도달해 깔끔하게 빠져나가세요.",
		"Arrastra para correr y zafarte de la marca":
			"드래그로 달려 마크를 떨쳐 내세요",
		"Trofeos": "트로피",
		"ANDA POR LA CASA · TOCA PARA RENOMBRAR O GUARDAR":
			"집 안을 돌아다니는 중 · 터치해서 이름 변경 또는 보관",
		"Ampliar a {0} x {0}: levanta las paredes donde quieras y amuébla­lo a tu gusto en el modo edición.":
			"{0} x {0} 확장: 편집 모드에서 원하는 곳에 벽을 세우고 마음대로 꾸미세요.",
		"Asistencias": "도움",
		"Aún no hay cartas en la mesa.": "아직 테이블에 카드가 없어요.",
		"BOTE: {0}": "팟: {0}",
		"CESION": "임대",
		"LEY BOSMAN": "보스만 룰",
		"DEADLINE DAY": "이적 마감일",
		"División": "디비전",
		"EL DIARIO": "신문",
		"EL TRASPASO": "이적",
		"EL VESTUARIO DEL AÑO": "올해의 팀",
		"EN CURSO": "진행 중",
		"Edad": "나이",
		"El club te sube a {0}": "클럽이 {0}까지 올려 줘요",
		"El primero de muchos. Este no se te olvida en toda la carrera.":
			"많은 골 중 첫 번째. 커리어 내내 잊지 못할 골이에요.",
		"GANO EL DERBI": "더비 승리",
		"GUARDARLA (HOY NO SALE)": "보관 (오늘은 안 나옴)",
		"Goles": "골",
		"Guardado": "저장됨",
		"HOY NO SALE · TOCA PARA RENOMBRAR O SACAR":
			"오늘은 안 나옴 · 터치해서 이름 변경 또는 꺼내기",
		"Hoy la ciudad amaneció con la portada buena.": "오늘 도시는 좋은 1면 기사로 아침을 맞았어요.",
		"Hoy la ciudad amaneció con tu nombre en la portada.":
			"오늘 도시는 1면에 실린 내 이름으로 아침을 맞았어요.",
		"IGUALAR": "콜",
		"INVITADO": "게스트",
		"JUGAR PÓQUER": "포커 하기",
		"FACIL": "쉬움",
		"MEDIO": "보통",
		"DIFICIL": "어려움",
		"EXTREMO": "극한",

		"MANTEN PULSADO": "길게 눌러 조준",
		"SUELTA PARA TIRAR": "떼서 던지기",
		"¡SE TE FUE LA MANO!": "손이 미끄러졌어요!",
		"DIANA": "불스아이",
		"ANILLO": "아우터 불",
		"TRIPLE {0}": "트리플 {0}",
		"DOBLE {0}": "더블 {0}",
		"VISITA {0} DE {1}": "라운드 {0}/{1}",
		"TU {0}   ·   {1} {2}": "나 {0}   ·   {1} {2}",
		"TIRA {0}": "{0} 차례",
		"GANAS EL RETO": "도전 성공",
		"GANAS LA PARTIDA": "게임 승리",
		"OTRO DIA SERA": "다음 기회에",
		"QUIMICA +{0}": "케미 +{0}",
		"ARRASTRA Y SUELTA": "드래그 후 놓기",
		"FALTA · BOLA EN MANO": "파울 · 프리볼",
		"MESA ABIERTA": "오픈 테이블",
		"LISAS": "단색",
		"RAYADAS": "줄무늬",
		"LA NEGRA": "8번 볼",
		"{0} · TE QUEDAN {1}": "{0} · {1} 남음",
		"TIRAR DARDOS": "다트 하기",
		"JUGAR BILLAR": "당구 치기",
		"¿CONTRA QUIEN?": "누구랑?",
		"TIRAR UN RATO": "그냥 던지기",
		"UNA PARTIDA SOLO": "혼자 한 판",
		"Ya ganaste química esta semana. Se juega por el récord.": "이번 주 케미는 이미 얻었어요. 이번 판은 기록을 위해.",
		"EL UTILERO": "장비 담당",
		"UN COMPAÑERO": "동료",
		"EL CAPITAN": "주장",
		"DIANA DE DARDOS": "다트판",
		"Se tira como se chuta. Reta al vestuario y gana química.": "슈팅하듯 던져요. 라커룸 동료에게 도전해 케미를 얻으세요.",
		"Se tira como se chuta: tensas y sueltas. Reta a quien quieras.": "슈팅하듯 던져요: 당겼다가 놓기. 누구에게나 도전하세요.",
		"La resortera, sobre el paño. Una partida con el vestuario.": "새총을 당구대 위에. 라커룸 동료들과 한 게임.",
		"NOCHE DE DARDOS": "다트 나이트",
		"Caen dos del vestuario y se tira hasta tarde.": "동료 두 명이 놀러 와 늦게까지 던져요.",
		"NOCHE DE BILLAR": "당구 나이트",
		"Tacos, hielo y una mesa que no se apaga.": "큐, 얼음, 그리고 꺼지지 않는 테이블.",
		"LEVANTARSE DE LA MESA": "자리에서 일어나기",
		"LOS NUEVOS UNIFORMES": "새 유니폼",
		"Media (OVR)": "능력치 (OVR)",
		"Mejor gol": "최고의 골",
		"Mejor pase": "최고의 패스",
		"NUEVO CLUB": "새 클럽",
		"No se pudo crear el video": "영상을 만들 수 없어요",
		"No se pudo escribir el video": "영상을 쓸 수 없어요",
		"No se pudo preparar la carpeta del video":
			"영상 폴더를 준비할 수 없어요",
		"Nota media": "평균 평점",
		"OTRA MANO": "새 핸드",
		"PASAR": "체크",
		"PONER NOMBRE": "이름 정하기",
		"PRIMER GOL": "첫 골",
		"Partidos": "경기",
		"Prima de objetivo: ${0}": "목표 보너스: ${0}",
		"Primas por títulos: ${0}": "우승 보너스: ${0}",
		"Cláusula de ascenso: tu ficha sube a ${0}":
			"승격 조항: 주급이 ${0}까지 올라요",
		"Cláusula de descenso: tu ficha baja a ${0}":
			"강등 조항: 주급이 ${0}까지 내려가요",
		"RETIRARSE": "폴드",
		"SACARLA A LA CASA": "집으로 꺼내기",
		"SE RETIRÓ": "폴드함",
		"SIN TRASPASO": "이적 없음",
		"SUBIR A {0}": "레이즈 {0}",
		"Sin títulos esta temporada.": "이번 시즌 우승 없음.",
		"TRAMO": "구간",
		"TU PRIMER GOL": "내 첫 골",
		"TU TURNO": "내 차례",
		"PIENSA {0}…": "{0} 고민 중…",
		"TERMINA LA MANO PARA LEVANTARTE": "일어나려면 핸드를 끝내세요",
		"ESTA NOCHE: {0}": "오늘 밤: {0}",
		"MANO {0}/{1} · CIEGA {2}": "핸드 {0}/{1} · 블라인드 {2}",
		"ULTIMA MANO DE LA NOCHE": "오늘 밤 마지막 핸드",
		"MEJOR MANO: {0}": "최고 핸드: {0}",
		"ARRUINASTE A {0}": "{0} 탈락시킴",
		"NERVIOSO": "초조",
		"TRANQUILO": "침착",
		"PRUDENTE": "신중",
		"EQUILIBRADO": "균형",
		"KAMIKAZE": "돌격대장",
		"FAROLERO": "블러퍼",
		"TIENES: {0}": "보유: {0}",
		"IGUALAR {0}": "콜 {0}",
		"TORNEO · MANO {0} · CIEGA {1}": "토너먼트 · 핸드 {0} · 블라인드 {1}",
		"¡CAMPEÓN DEL TORNEO!": "토너먼트 우승!",
		"TORNEO DE LA TEMPORADA": "시즌 토너먼트",
		"TORNEO: YA JUGADO ESTA TEMPORADA": "토너먼트: 이번 시즌 이미 참가",
		"Torneo de Póquer": "포커 토너먼트",
		"Campeón del Torneo de Póquer": "포커 토너먼트 우승",
		"RETO: GANA UN BOTE DE FAROL": "도전: 블러핑으로 팟 따기",
		"RETO: DEJA A UN RIVAL SIN FICHAS": "도전: 상대 하나 탈락시키기",
		"RETO: GANA {0} EN UNA MANO": "도전: 한 핸드에 {0} 따기",
		"RETO: GANA CON COLOR O MEJOR": "도전: 플러시 이상으로 이기기",
		"RETO: ACABA LA NOCHE GANANDO": "도전: 이긴 채로 밤 마치기",
		"RETO CUMPLIDO · QUIMICA +{0}": "도전 성공 · 케미 +{0}",
		"RETO CUMPLIDO": "도전 성공",
		"RETO DE LA SEMANA: HECHO": "주간 도전: 완료",
		"TE DEBE {0}": "받을 돈 {0}",
		"LE DEBES {0}": "갚을 돈 {0}",
		"CIEGA {0} · PARA IGUALAR {1}": "블라인드 {0} · 콜 {1}",
		"OVR {0}": "OVR {0}",
		"SUBIDA MINIMA {0} · TODO DENTRO {1}": "최소 레이즈 {0} · 올인 {1}",
		"TODO DENTRO ({0})": "올인 ({0})",
		"TODO {0}": "올인 {0}",
		"½ BOTE {0}": "½ 팟 {0}",
		"BOTE {0}": "팟 {0}",
		"TUS FICHAS: {0}": "내 칩: {0}",
		"Tan cerca. La medalla de plata es la que enseña lo que todavía falta.":
			"아깝다. 은메달은 아직 무엇이 부족한지 알려 주는 메달이에요.",
		"Te sientan en el vestuario con el director deportivo. En {0} no pueden con tu sueldo y tu traspaso les cuadra el ejercicio: contaban con ese dinero antes de decírtelo.":
			"라커룸에서 단장과 마주 앉아요. {0} 클럽은 내 주급을 감당할 수 없고, 이적료로 장부를 맞춰야 해요: 내게 말하기도 전에 그 돈을 계산에 넣고 있었어요.",
		"Toca una temporada para verla en detalle.":
			"시즌을 터치하면 자세히 볼 수 있어요.",
		"Toda la ciudad amaneció con esa portada.":
			"도시 전체가 그 1면으로 아침을 맞았어요.",
		"Toda la ciudad amaneció con tu fichaje en la portada.":
			"도시 전체가 1면에 실린 내 영입 소식으로 아침을 맞았어요.",
		"Tres equipaciones nuevas. El club estrena piel.":
			"새 유니폼 세 벌. 클럽이 새 옷을 입어요.",
		"Tu solar mide {0} x {0} metros.": "부지 크기: {0} x {0}미터.",
		"VER TEMPORADA A TEMPORADA": "시즌별 보기",
		"VER RESUMEN": "요약 보기",
		"Valor": "가치",
		"Ya no se puede ampliar más.": "더 이상 확장할 수 없어요.",
		"{0}  (liga {1})": "{0}  (리그 {1})",
		"{0} m": "{0} m",
		"{0} · TEMPORADA {1}": "{0} · {1} 시즌",
		"¿CON QUIÉN JUEGAS?": "누구랑 할까요?",




		"MESA DE PÓQUER": "포커 테이블",
		"Invita a quien quieras y juégate el dinero de verdad.":
			"원하는 사람을 초대해 진짜 돈을 걸고 게임하세요.",
		"CAMA SENCILLA": "싱글 침대",
		"Un colchón y a dormir.": "매트리스 하나, 이제 자러 가요.",
		"CAMA DOBLE": "더블 침대",
		"De verdad se descansa.": "제대로 쉴 수 있어요.",
		"CAMA KING": "킹 침대",
		"La cama de alguien que ya llegó.":
			"성공한 사람의 침대.",
		"Para ver el partido sentado.": "앉아서 경기 보기용.",
		"SOFÁ ESQUINERO": "코너 소파",
		"Caben los amigos.": "친구들이 다 앉을 수 있어요.",
		"SOFÁ DE PIEL": "가죽 소파",
		"Piel de verdad, del color del salón de un fichaje caro.":
			"진짜 가죽, 비싼 몸값 선수의 거실 색.",
		"Donde se come.": "밥 먹는 곳.",
		"MESA DE COMEDOR": "식탁",
		"Para sentar a la familia.": "가족이 모두 앉을 수 있어요.",
		"MESA DE MÁRMOL": "대리석 테이블",
		"Pesa media tonelada y se nota.": "무게만 반 톤, 티가 나요.",
		"COCINETA": "미니 주방",
		"Dos fuegos y un fregadero.": "화구 두 개와 싱크대.",
		"COCINA COMPLETA": "풀 키친",
		"Aquí ya se cocina en serio.": "이제 제대로 요리할 수 있어요.",
		"COCINA CON ISLA": "아일랜드 주방",
		"Con isla en medio, como las de revista.":
			"가운데 아일랜드까지, 잡지에 나오는 것처럼.",
		"GALLINA": "암탉",
		"Una gallina que picotea y trota por la casa.":
			"집 안을 쪼고 종종거리는 암탉.",
		"LORO": "앵무새",
		"Un loro de colores que brinca y no para quieto.":
			"가만히 있지 못하고 폴짝대는 알록달록 앵무새.",
		"PIANO DE COLA": "그랜드 피아노",
		"Laca negra en el salón. Suena a que llegaste.":
			"거실의 검은 래커. 성공했다는 소리가 나요.",
		"MESA DE BILLAR": "당구대",
		"Una partida con el vestuario. La química se juega.":
			"라커룸 동료들과 한 게임. 케미가 걸려 있어요.",
		"FUTBOLITO": "테이블 축구",
		"Piques rápidos en casa. Nadie se va sin revancha.":
			"집에서 즐기는 빠른 한판 승부. 리턴 매치 없이는 아무도 못 가요.",
		"ESCULTURA": "조각상",
		"Una pieza de autor. Puro caché en el salón.":
			"작가의 작품. 거실에 품격이 흘러요.",
		"ACUARIO": "수족관",
		"Un muro de agua y peces. Baja las pulsaciones.":
			"물과 물고기로 된 벽. 심박수가 내려가요.",
		"ESTILO CALIDO": "웜 스타일",
		"Terracota, roble y luz de tarde. La casa abraza.":
			"테라코타, 오크, 저녁 햇살. 집이 포근하게 안아줘요.",
		"ESTILO INDUSTRIAL": "인더스트리얼",
		"Cemento visto, acero y madera cruda. Sin adornos.":
			"노출 콘크리트, 강철, 거친 원목. 장식은 없어요.",
		"ESTILO MARMOL": "대리석 스타일",
		"Mármol blanco y filos de oro. La casa de un campeón.":
			"하얀 대리석에 금빛 테두리. 챔피언의 집이에요.",
		"PANTALLA GRANDE": "대형 스크린",
		"Una tele más grande para ver el gol en condiciones.":
			"골 장면을 제대로 보려면 더 큰 TV가 필요해요.",
		"PANTALLA MURAL": "월 스크린",
		"Pantalla de pared, como en el palco. Se ve desde la cocina.":
			"VIP석처럼 벽 전체가 스크린. 주방에서도 보여요.",
		"MESA DE JARDÍN": "정원 테이블",
		"BANCA DE JARDÍN": "정원 벤치",
		"Un sitio donde sentarse fuera y ver pasar la temporada.": "밖에 앉아서 시즌이 흘러가는 걸 지켜볼 자리.",
		"Con sombrilla. Para comer fuera cuando aprieta el calor.": "파라솔 포함. 더위가 기승일 때 밖에서 식사하세요.",
		"Agua corriendo en el patio. Se oye antes de verse.": "마당에 흐르는 물. 보이기 전에 소리부터 들려요.",
		"Sombra de vigas sobre el patio. Se pasa por debajo.": "마당 위에 드리운 들보 그늘. 그 아래로 지나다녀요.",

		"ARBUSTO": "관목",
		"SOMBRILLA": "파라솔",
		"FAROL DE JARDÍN": "정원 램프",
		"HAMACA": "해먹",
		"CAMASTRO": "선베드",
		"ÁRBOL": "나무",
		"COLUMPIO DE TERRAZA": "테라스 그네",
		"FOGATA": "화로",
		"HUERTO": "텃밭",
		"PORTERÍA DE ENTRENO": "훈련용 골대",
		"ESTANQUE DE KOI": "잉어 연못",
		"COCINA EXTERIOR": "야외 주방",
		"HELICÓPTERO": "헬리콥터",
		"Nada de carreteras: llegas a todo volando y el cuerpo lo nota.": "더는 도로가 필요 없어요. 어디든 날아가니 몸이 한결 가벼워요.",
		"HELIPUERTO": "헬리패드",
		"Verde bajo para el borde del terreno. Se ponen varios.":
			"부지 가장자리용 낮은 초록. 여러 개 놓을 수 있어요.",
		"Sombra donde no hay árbol. Va sola, sin mesa debajo.":
			"나무가 없는 곳의 그늘. 테이블 없이 단독으로 서요.",
		"Luz propia fuera: de noche el jardín deja de ser un hueco negro.":
			"밖을 밝히는 나만의 조명. 밤에도 정원이 깜깜한 구멍이 아니에요.",
		"Lona suspendida entre dos postes para descansar al aire libre.":
			"두 기둥 사이에 건 천. 야외에서 쉬기 좋아요.",
		"Tumbarse al sol. Junto a la piscina se ven de a dos.":
			"햇볕 아래 눕기. 수영장 옆엔 두 개가 짝으로 어울려요.",
		"Tres metros de copa: lo único que da sombra de verdad.":
			"3미터짜리 나무 갓. 진짜 그늘을 주는 건 이것뿐이에요.",
		"Un banco colgado que se mece. Para ver caer la tarde.":
			"흔들리는 매달린 벤치. 해 질 녘을 바라보기 좋아요.",
		"Fuego fuera: alumbra el patio y calienta la noche.":
			"야외의 불. 마당을 밝히고 밤을 데워줘요.",
		"Bancales con verdura. Se come lo que sale de tu terreno.":
			"채소를 키우는 화단. 내 땅에서 난 걸 먹어요.",
		"Portería con red: entrenar en casa deja de ser una idea.":
			"그물 달린 골대. 집에서 훈련하는 게 더는 꿈이 아니에요.",
		"Agua quieta con carpas y una cascada que no calla.":
			"잉어가 노니는 고요한 물과 쉬지 않는 폭포.",
		"Barra, fuegos y fregadero fuera. El asador con casa.":
			"밖에 바, 화구, 싱크대까지. 집 딸린 바비큐장이에요.",
		"La losa con la H. No sirve para nada y se ve desde el aire.":
			"H가 그려진 바닥판. 쓸모는 없지만 하늘에서도 보여요.",
		"Sombra donde no hay árbol. Se planta y ya hay sitio.":
			"나무가 없는 곳의 그늘. 세우기만 하면 쉴 자리가 생겨요.",
		"Verde bajo para el borde. Lo barato que llena metros.":
			"가장자리용 낮은 초록. 싸게 공간을 채우는 방법이에요.",
		"Luz propia en el jardín, encendida en cuanto cae la noche.":
			"정원을 밝히는 나만의 조명. 밤이 되면 바로 켜져요.",
		"FUENTE": "분수",
		"PÉRGOLA": "퍼걸러",



		"ENTRENO": "훈련",
		"ENTRENAMIENTO": "훈련",
		"EL CAMPO DE ATRÁS": "뒤편 연습장",
		"Un campo cercado, una caseta y los conos. Con eso se empieza.":
			"울타리 친 구장, 오두막 하나, 콘 몇 개. 시작은 이걸로 충분해요.",
		"LA CIUDAD DEPORTIVA": "트레이닝 센터",
		"CIUDAD DEPORTIVA": "트레이닝 센터",
		"Vallado en condiciones, vestuarios y material para el balón parado.":
			"제대로 된 울타리, 라커룸, 세트피스 훈련 장비.",
		"EL CENTRO DE ALTO RENDIMIENTO": "하이 퍼포먼스 센터",
		"Tribuna, torre de filmación y una estación para cada cosa que sabes hacer.":
			"관중석, 촬영 타워, 그리고 내가 할 줄 아는 모든 기술마다 훈련장이 있어요.",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario"
		+ " distinto. Todavía no cuenta para la carrera. Se sale con PAUSA.":
			"훈련을 골라 마음껏 반복하세요. 시도할 때마다 다른 상황이 만들어져요. 아직 커리어에는 반영되지 않아요. 나가려면 일시정지를 누르세요.",
		"QUE SE ENTRENA AQUI": "여기서 훈련하는 것",
		"SI SUBES DE CATEGORIA": "상위 리그로 승격하면",
		"Se abre: {0}.": "해금: {0}.",
		"PREPARADOR FÍSICO": "피지컬 코치",
		"Alguien que cuida tu cuerpo a jornada completa: la mayor recuperación tras"
		+ " cada partido.":
			"내 몸을 전담 관리해 줘요. 경기 후 회복량이 가장 커요.",
		"CHEF PERSONAL": "개인 셰프",
		"Cocina para ti cada semana: COMER BIEN no te gasta acción y recuperas más energía tras cada partido.":
			"매주 요리해 줘요. 건강식 먹기에 행동을 쓰지 않고, 경기 후 에너지를 더 회복해요.",
		"TU CHEF COCINÓ · SIN GASTAR ACCIÓN": "셰프의 요리 · 행동 소모 없음",
		"NUTRICIONISTA": "영양사",
		"Te arma la dieta de cada semana: cada partido te gasta menos energía.": "매주 식단을 짜줘요. 경기마다 에너지 소모가 줄어요.",
		"ENTRENADOR PERSONAL": "개인 트레이너",
		"Te espera en tu gimnasio: LEVANTAR PESAS no te gasta acción.": "내 체육관에서 기다려요. 웨이트 트레이닝에 행동을 쓰지 않아요.",
		"CON TU ENTRENADOR · SIN GASTAR ACCIÓN": "트레이너와 함께 · 행동 소모 없음",
		"GASTO": "소모",
		"ACCIONES": "행동",
		"NIVEL {0}/{1}": "레벨 {0}/{1}",
		"TUYO · NIVEL {0}/{1}": "보유 · 레벨 {0}/{1}",
		"SUBE A NIVEL {0} · PAGO ÚNICO": "레벨 {0} 업그레이드 · 1회 결제",
		"Comes como atleta: +{0}% de experiencia en cada partido.": "운동선수처럼 먹어요. 경기마다 경험치 +{0}%.",
		"Te cuida el cuerpo: {0}% menos riesgo de lesión.": "몸을 챙겨줘요. 부상 위험 {0}% 감소.",
		"Más exigente: LEVANTAR PESAS te da +{0} de técnico.": "더 빡센 훈련. 웨이트 트레이닝 시 감독 호감도 +{0}.",
		"CONSULTORIO DE NUTRICIÓN": "영양 상담실",
		"Escritorio, báscula con tallímetro y el plato en la pared: donde trabaja tu nutricionista.": "책상, 신장계 달린 체중계, 벽에 붙은 식단표. 영양사가 일하는 곳이에요.",
		"El consultorio de tu nutricionista: escritorio, báscula con tallímetro y el póster del plato.": "영양사의 상담실. 책상, 신장계 달린 체중계, 식단 포스터.",
		"CLÍNICA PRIVADA": "개인 클리닉",
		"Casi la mitad de riesgo de lesión, y toda baja dura la mitad.":
			"부상 위험이 거의 절반, 결장 기간도 모두 절반이에요.",
		"ANALISTA DE VÍDEO": "영상 분석관",
		"Estudias cada partido con alguien que sabe mirar: +25% de experiencia.":
			"볼 줄 아는 사람과 매 경기를 분석해요. 경험치 +25%.",
		"RENEGOCIAR CON EL AGENTE": "에이전트와 재협상",
		"Su comisión baja del 8% al 3%. Cara, pero cuanto antes la firmes, más te"
		+ " devuelve.":
			"수수료가 8%에서 3%로 내려가요. 비싸지만 빨리 서명할수록 더 많이 돌려받아요.",
		"CORTES DE PELO": "헤어컷",
		"VELLO FACIAL": "수염",
		"TINTES": "염색",
		"PUNTAS": "끝 염색",
		"ENTRADAS": "M자 이마",
		"La frente que gana terreno. Asúmelo con dignidad.":
			"이마가 영역을 넓혀가요. 품위 있게 받아들이세요.",
		"RAPADO A LOS LADOS": "언더컷",
		"Máquina en los lados, tupé arriba. El corte de vestuario.":
			"옆은 바리캉, 위는 앞머리를 세운 스타일. 라커룸 단골 헤어.",
		"RAYA AL LADO": "가르마",
		"Una raya rapada a navaja. Detalle de peluquería cara.":
			"면도날로 낸 가르마 라인. 비싼 이발소의 디테일.",
		"DEGRADADO": "테이퍼 페이드",
		"Se difumina hacia abajo. Nunca pasa de moda.":
			"아래로 갈수록 흐려져요. 절대 유행을 타지 않아요.",
		"FRANJAS RAPADAS": "쉐이브 라인",
		"Rayas marcadas al ras. Para el que ya tuvo su noche perfecta.":
			"두피까지 바짝 새긴 라인. 완벽한 밤을 보내본 선수를 위해.",
		"CRESTA ANCHA": "와이드 모히칸",
		"El mohicano de los campeones. Se lleva con una liga en la vitrina.":
			"챔피언의 모히칸. 진열장에 리그 우승 트로피가 있어야 어울려요.",
		"PATILLAS": "구레나룻",
		"Bajan por la mandíbula y ahí se quedan.": "턱선을 따라 내려와 거기 머물러요.",
		"MOSCA": "소울 패치",
		"Un toque bajo el labio. Poco pelo, mucha actitud.":
			"아랫입술 밑 한 점. 털은 적어도 태도는 넘쳐요.",
		"CANDADO": "턱수염 라인",
		"Contorno fino, mejilla limpia. Requiere pulso.":
			"가는 윤곽선, 깔끔한 볼. 손이 떨리면 안 돼요.",
		"BARBÓN": "풀 비어드",
		"Barba cerrada de verdad. Diez años encima en una semana.":
			"제대로 빽빽한 수염. 일주일 만에 열 살은 더 들어 보여요.",
		"BIGOTE MANILLAR": "핸들바 콧수염",
		"Las puntas caen. Solo se lo permite quien lleva una década.":
			"끝이 아래로 처져요. 10년은 뛴 선수만 소화할 수 있어요.",
		"PLATINO": "플래티넘",
		"Decolorado entero. Te van a encontrar en cualquier repetición.":
			"전체 탈색. 어느 리플레이에서든 눈에 띌 거예요.",
		"ROJO FUEGO": "파이어 레드",
		"Se ve desde el último anillo de la grada.":
			"관중석 맨 꼭대기에서도 보여요.",
		"AZUL ELÉCTRICO": "일렉트릭 블루",
		"Para el que ya fue el mejor de un mes y quiere que se note.":
			"이달의 선수에 뽑혀 본 선수가 티 내고 싶을 때.",
		"ROSA": "핑크",
		"Solo se lo puede permitir alguien con un Balón de Oro en casa.":
			"집에 올해의 선수 트로피가 있는 사람만 소화할 수 있어요.",
		"PUNTAS DECOLORADAS": "탈색 포인트",
		"Solo las puntas. El resto se queda como estaba.":
			"끝부분만 탈색. 나머지는 그대로예요.",
		"PUNTAS DORADAS": "골드 포인트",
		"Oro en las puntas. Se gana ganando Europa.":
			"끝부분에 금빛. 유럽을 제패해야 얻어요.",




		"RADIO COMARCAL": "지역 라디오",
		"CERÁMICA NORTE": "노스 세라믹",
		"NOVA MÓVIL": "노바 모바일",
		"HELIOS SEGUROS": "헬리오스 보험",
		"IMPERIAL": "임페리얼",
		"Te conocen del barrio. Cada año que cumples, te suben el trato.":
			"동네에서부터 알던 사이. 기대에 부응하는 해마다 조건을 올려줘요.",
		"Narran tus partidos y te pagan por el pase, no por el remate.":
			"내 경기를 중계하고, 마무리가 아니라 패스에 돈을 줘요.",
		"Casi no te pagan por venir. Te pagan por el año entero.":
			"오기만 해서는 거의 안 줘요. 1년 내내 활약해야 줘요.",
		"La valla del estadio es tuya, pero sólo cobras cuando marcas.":
			"경기장 광고판은 내 것이지만, 돈은 골을 넣을 때만 받아요.",
		"Les gusta el balón parado. Lo demás no se lo cuentan.":
			"세트피스를 좋아해요. 나머지는 관심 없어요.",
		"Pagan la asistencia como otros pagan el gol.":
			"다른 곳이 골에 주는 만큼 도움에 줘요.",
		"La llevan los que deciden partidos. Les da igual cómo.":
			"경기를 결정짓는 선수들이 입어요. 방법은 상관없대요.",
		"Quieren regularidad, no fuegos artificiales. Y la quieren todo el año.":
			"불꽃놀이보다 꾸준함을 원해요. 그것도 1년 내내.",
		"Sólo miran las noches grandes: Europa y copa. La liga no existe.":
			"큰 경기의 밤만 봐요. 유럽 대항전과 컵. 리그는 안중에 없어요.",
		"La marca del mundo te mira, y el mundo no se conforma.":
			"글로벌 브랜드가 지켜보고 있고, 세상은 만족을 모르죠.",
		"El contrato de una vida, y pide la temporada de una vida.":
			"일생일대의 계약. 그만큼 일생일대의 시즌을 요구해요.",
		"{0} ASISTENCIAS": "도움 {0}개",
		"{0} ENTRE GOLES Y ASISTENCIAS": "공격 포인트 {0}개",
		"{0} GOLES A BALÓN PARADO": "세트피스 골 {0}개",
		"{0} GOLES EN EUROPA O COPA": "유럽 대항전·컵 {0}골",
		" Y MEDIA {0}": " 및 능력치 {0}",
		" · media {0}/{1}": " · 능력치 {0}/{1}",
		"GOL O ASISTENCIA": "골 또는 도움",
		"GOL DE BALÓN PARADO": "세트피스 골",
		"GOL EN EUROPA O COPA": "유럽 대항전·컵 골",
		"GOL DE PENAL": "PK 골",
		"{0} te sube el trato: ${1} por partido": "{0}에서 조건 인상: 경기당 ${1}",
		"${0} por partido + ${1} por {2}": "경기당 ${0} + {2}당 ${1}",
		"${0} / PARTIDO   +${1} POR {2}": "${0} / 경기   +${1} / {2}",
		"PREMIO ${0}": "보너스 ${0}",
		"TU MARCA": "내 브랜드",
		"PANADERÍA DEL BARRIO": "동네 빵집",
		"IRON FIT": "IRON FIT",
		"VOLT COLA": "VOLT COLA",
		"BANCO MERIDIÁN": "메리디안 은행",
		"Pagan por estar en el campo. Si te sientan, no cobras.":
			"그라운드에 서 있는 값을 줘요. 벤치에 앉으면 한 푼도 없어요.",
		"KRONOS SPORT": "KRONOS SPORT",
		"MOTORES ARIA": "아리아 모터스",
		"AEROLÍNEAS CÉNIT": "제니스 항공",

		"PROMESA": "유망주",
		"PROFESIONAL": "프로",
		"FIGURA": "핵심 선수",
		"ESTRELLA MUNDIAL": "월드 스타",
		"LEYENDA": "레전드",
		"INMORTAL": "불멸",
		"del Mundo": "(세계)",
		"de tu club": "(내 클럽)",
		"de {0}": "({0})",
		"INMORTAL {0}": "불멸 {0}",
		"INMORTAL ★{0}": "불멸 ★{0}",
		"Leyenda eterna {0}.": "영원한 레전드 {0}.",
		"—a las puertas": "—문턱에서",
		"Te falta prestigio de leyenda mundial (o palmarés de club) para LEYENDA.":
			"레전드가 되려면 세계적 레전드급 명성(또는 클럽 우승 경력)이 필요해요.",
		"CLASIFICATORIAS": "예선",
		"CLASIF. MUNDIAL": "세계 대회 예선",
		"CLASIF. EUROPA": "유럽 예선",
		"CLASIF. SUDAMÉRICA": "남미 예선",
		"CLASIF. NORTEAMÉRICA": "북중미 예선",
		"CLASIF. ASIA": "아시아 예선",
		"CLASIF. ÁFRICA": "아프리카 예선",
		"CLASIF. OCEANÍA": "오세아니아 예선",
		"MUNDIAL": "세계 대회",
		"CONTINENTAL": "대륙 대회",


		"AMISTOSOS": "친선 경기",
		"TODA LA CARRERA POR TORNEO": "커리어 전체 · 대회별",
		"Ningún puesto de esta liga da plaza de {0}: las plazas se reparten por el"
		+ " coeficiente del país, y la última competición es la puerta de las ligas"
		+ " pequeñas.":
			"이 리그는 어느 순위도 {0} 출전권을 주지 않아요. 출전권은 국가 계수로 나뉘고, 마지막 대회가 작은 리그의 유럽행 관문이에요.",
		"De {0} temporada(s) vieja(s) sólo se guardó el total, sin repartir por"
		+ " torneo: no entran en esta tabla.":
			"옛 시즌 {0}개는 대회별 구분 없이 합계만 저장돼서 이 표에 들어가지 않아요.",
		"EUROCOPA": "유럽 대회",
		"COPA AMÉRICA": "남미 대회",
		"COPA ORO": "북중미 대회",
		"COPA DE ASIA": "아시아 대회",
		"COPA AFRICANA": "아프리카 대회",
		"COPA CONTINENTAL": "대륙컵",




		"COPA DE CAMPEONES": "엘리트컵",
		"COPA EUROPA": "유로파컵",
		"COPA CONFERENCIA": "챌린지컵",

		"Aún no hay nada que exponer": "아직 전시할 게 없어요",
		"sin sitio · pon otra vitrina o repisa": "자리 없음 · 진열장이나 선반을 더 놓으세요",
		"sin sitio · pon otro estante de balones": "자리 없음 · 공 선반을 더 놓으세요",
		"CAMISETAS": "유니폼",
		"EN EQUIPO": "팀",
		"INDIVIDUALES": "개인",
		"Sin registro del año": "연도 기록 없음",
		"SALIR DE LA CANCHA": "구장 나가기",
		"Pronto podrás entrenar aquí.": "곧 여기서 훈련할 수 있어요.",
		"ISLA CON BARRA": "바 아일랜드",
		"La barra exenta: se cocina de un lado y se come del otro.":
			"독립형 바. 한쪽에선 요리하고 반대쪽에선 먹어요.",
		"TOCADOR CON ESPEJO": "거울 화장대",
		"CAMA PARA PERRO": "강아지 침대",
		"RASCADOR PARA GATO": "캣타워",
		"LAVANDERÍA": "세탁실",
		"MUEBLE DE RECIBIDOR": "현관 수납장",
		"VESTIDOR DE ROPA DE CALLE": "사복 옷장",
		"TELESCOPIO": "망원경",
		"CAMBIAR DE ROPA": "옷 갈아입기",
		"VOLVER A CASA": "집으로",
		"Cojín, manta y juguete: el perro tiene dónde descansar.":
			"쿠션, 담요, 장난감. 강아지가 쉴 곳이 생겨요.",
		"Postes y plataformas para que el gato tenga su rincón.":
			"기둥과 발판으로 고양이만의 구석을 만들어줘요.",
		"Lavadora, cesta y toallas para la ropa de entrenamiento.":
			"훈련복을 위한 세탁기, 빨래 바구니, 수건.",
		"Llaves, mochila y zapatos: todo a mano junto a la entrada.":
			"열쇠, 백팩, 신발. 현관 옆에 모든 게 손 닿는 곳에.",
		"Ropa de calle, tenis y espejo. Acércate para cambiarte.":
			"사복, 운동화, 거울. 가까이 가서 갈아입으세요.",
		"Tubo óptico sobre trípode para tu rincón junto a la ventana.":
			"창가 구석에 놓을 삼각대 위 광학 망원경.",
		"Un rincón para los dos: espejo, frascos y banqueta.":
			"둘을 위한 구석. 거울, 화장품, 스툴.",
		"TOCADOR": "화장대",
		"El rincón de arreglarse, con espejo y su banqueta.":
			"단장하는 구석. 거울과 전용 스툴.",
		"DESPACHO CON CAJA FUERTE": "금고 딸린 서재",
		"Escritorio, carpetas y caja fuerte. Aquí se firma lo que ganas.":
			"책상, 서류철, 금고. 버는 돈은 여기서 서명해요.",
		"REPASAR CONTRATOS": "계약서 검토",
		"Una tarde con tu agente y los papeles sobre la mesa.":
			"에이전트와 함께 서류를 펼쳐 놓고 보내는 오후.",
		"SAUNA": "사우나",
		"Duelas, piedras calientes y media hora de calor seco.":
			"나무 벽, 뜨거운 돌, 30분의 건식 열기.",
		"Calor seco en duelas de pino. Sales otro después del partido.":
			"소나무 벽 속 건식 열기. 경기 후 다른 사람이 되어 나와요.",
		"GORRAS DE LA SELECCIÓN": "국가대표 캡",
		"Una gorra por partido con tu país. Se llena sola.":
			"국가대표 경기마다 캡 하나. 저절로 채워져요.",
		"BALÓN DEL PRIMER GOL": "첫 골 공",
		"El balón de tu primer gol, bajo cristal y con su cartela.":
			"첫 골을 넣은 공. 유리 케이스 속에 명패와 함께.",
		"COCINA DEL NUTRICIONISTA": "영양사의 주방",
		"Nevera de raciones pesadas y báscula en la barra.":
			"무게를 잰 식단이 든 냉장고와 조리대 위 저울.",
		"Comer medido: la misma comida de casa, pero pesada.":
			"계량 식사. 집밥 그대로, 무게만 재요.",
		"Todo pesado y a su hora: el cuerpo lo nota el domingo.":
			"모두 계량하고 제시간에. 일요일이면 몸이 알아요.",
		"Barra central con fregadero: aquí se cocina y se come.":
			"싱크대 달린 중앙 조리대. 여기서 요리하고 여기서 먹어요.",
		"MALETAS APILADAS": "쌓인 캐리어",
		"Una maleta por club. La pila crece con cada traspaso.":
			"클럽마다 캐리어 하나. 이적할 때마다 더 높이 쌓여요.",
		"SILLÓN DE BARBERO": "이발 의자",
		"Cuero, espejo con bombillas y carrito. Aquí se hacen las portadas.":
			"가죽 의자, 전구 거울, 카트. 화보 사진은 여기서 시작돼요.",
		"VITRINA ISLA": "아일랜드 진열장",
		"La isla de museo: cristal por los cuatro lados y tres baldas.":
			"박물관식 진열대. 사면이 유리에 선반 세 칸.",
		"ESTATUA DE BRONCE": "청동상",
		"Tú en bronce, sobre un plinto con tu nombre y tus títulos.":
			"청동으로 된 나. 이름과 우승 기록이 새겨진 받침대 위에.",
		"SIESTA AL SOL": "햇볕 낮잠",
		"Media hora fuera, sin teléfono. El cuerpo lo agradece.":
			"휴대폰 없이 밖에서 30분. 몸이 고마워해요.",


		"CABINA DE PÓDCAST": "팟캐스트 부스",
		"TINA DE HIELO": "얼음 욕조",
		"BANCO DE BOTAS": "축구화 벤치",
		"TOALLERO": "수건걸이",
		"ESPEJO DE CUERPO ENTERO": "전신 거울",
		"MESA DE CENTRO": "커피 테이블",
		"RINCÓN DEL CAFÉ": "커피 코너",
		"APARADOR DE VAJILLA": "그릇 장식장",
		"GALLINERO": "닭장",
		"GRABAR UN PÓDCAST": "팟캐스트 녹음",
		"BAÑO DE HIELO": "얼음 목욕",
		"LIMPIAR LAS BOTAS": "축구화 손질",
		"MINIJUEGOS": "미니게임",
		"Micro, cascos y panel acústico. Graba tu semana: rinde con la prensa.":
			"마이크, 헤드폰, 흡음판. 한 주를 녹음하면 언론 반응이 좋아요.",
		"Agua a tres grados. Tres minutos que las piernas agradecen.":
			"3도의 물. 다리가 고마워할 3분이에요.",
		"Balda, cepillo y hormas. Botas cuidadas se gastan la mitad.":
			"선반, 솔, 슈트리. 잘 관리한 축구화는 절반만 닳아요.",
		"Barra de pared con toallas limpias. Pide muro para colgarse.":
			"깨끗한 수건이 걸린 벽걸이 바. 걸 벽이 필요해요.",
		"Luna de cuerpo entero para mirarte antes de salir.":
			"나가기 전에 비춰 보는 전신 거울.",
		"Baja, delante del sofá: ahí van el café y el mando.":
			"소파 앞 낮은 테이블. 커피와 리모컨 자리예요.",
		"Cafetera, tazas y molinillo. El primer café del día, en casa.":
			"커피 머신, 컵, 그라인더. 하루의 첫 커피를 집에서.",
		"Vajilla a la vista tras el cristal. La mesa se pone desde aquí.":
			"유리 너머로 보이는 그릇들. 식탁 차림은 여기서 시작해요.",
		"Caseta con tejadillo y nidal: la gallina tiene dónde dormir.":
			"지붕과 둥지 상자가 있는 작은 집. 닭이 잘 곳이 생겨요.",
		"Una hora de micrófono contando tu semana. Una acción semanal.":
			"마이크 앞에서 한 시간 동안 한 주 이야기. 주간 행동 1회.",
		"Cepillo, betún y cordones: el próximo partido gasta la mitad.":
			"솔, 구두약, 끈. 다음 경기에서 절반만 닳아요.",
		"Con las botas de cantera no hay nada que cuidar.":
			"유스 축구화는 손질할 게 없어요.",
		"Tus botas ya están listas para el próximo partido.":
			"다음 경기를 위한 축구화 준비 완료.",
		"Espera al alta médica para entrenar.": "훈련하려면 의료진의 복귀 승인을 기다리세요.",
		"UN JEQUE": "왕족 부호",
		"UN MAGNATE": "재벌",
		"UN FONDO": "투자 펀드",
		"LOS INGRESOS SE DOBLAN": "수입 2배",
		"COMPRA PARA VENDER": "되팔기용 인수",
		"Compra el club para ganarlo todo: el doble de presupuesto en GERENCIA, y la directiva te va a pedir mucho más arriba en la tabla.": "모든 걸 이기려고 클럽을 사요. 프런트 예산이 2배가 되고, 이사회는 순위표에서 훨씬 높은 곳을 요구할 거예요.",
		"Un fondo de inversión compra el club para revenderlo: algo más de presupuesto, y en su último año vende lo que más vale del vestuario.": "투자 펀드가 되팔 목적으로 클럽을 사요. 예산이 조금 늘고, 마지막 해에는 라커룸에서 가장 비싼 선수를 팔아요.",
		"Te sientan en el vestuario con el director deportivo. El fondo que compró {0} se va este verano y quiere su beneficio: eres lo que más vale del vestuario, y tu traspaso es la plusvalía.": "라커룸에서 단장과 마주 앉게 돼요. {0} 클럽을 산 펀드가 이번 여름에 떠나며 수익을 원해요. 라커룸에서 가장 비싼 선수가 바로 나고, 내 이적료가 그 차익이에요.",
		"FACHADA": "외관",
		"TORRE DE CRISTAL": "유리 타워",
		"Tu piso en una torre de vidrio y acero: la ciudad entera en la ventana.": "유리와 강철로 된 타워 속 내 집. 창밖으로 도시 전체가 보여요.",
		"EDIFICIO COLONIAL": "콜로니얼 빌딩",
		"Balcones de hierro, arcos y muros de color: el barrio viejo de la ciudad.": "철제 발코니, 아치, 색색의 벽. 도시의 옛 동네예요.",
		"CASA MEDITERRANEA": "지중해풍 주택",
		"Muros encalados, teja árabe y buganvilla: huele a mar.": "하얀 회벽, 기와, 부겐빌레아. 바다 냄새가 나요.",
		"CABAÑA DE MADERA": "통나무 오두막",
		"Troncos, porche con mecedora y chimenea de piedra: el bosque en tu puerta.": "통나무, 흔들의자 놓인 현관, 돌 굴뚝. 문 앞이 바로 숲이에요.",
		"CUBO DE CRISTAL": "유리 큐브",
		"Un cubo de vidrio sobre el jardín: todo luz, nada que esconder.": "정원 위의 유리 큐브. 온통 빛이고 숨길 게 없어요.",
		"LOFT DE HORMIGON": "콘크리트 로프트",
		"Hormigón visto, ventanales de taller y puerta de acero: industrial de verdad.": "노출 콘크리트, 공장식 창, 강철 문. 진짜 인더스트리얼이에요.",
		"MANSION VICTORIANA": "빅토리아풍 저택",
		"Torreón, buhardillas y balaustradas: la casa de las películas.": "탑, 지붕창, 난간. 영화에 나오는 그 집이에요.",
		"VILLA MEDITERRANEA": "해변 빌라",
		"Arcos, palmeras y terraza con pérgola: una villa junto al mar.": "아치, 야자수, 퍼걸러 테라스. 바닷가의 빌라예요.",
		"HACIENDA": "아시엔다",
		"Portón de madera, patio con arcos y campanario: la casa grande del campo.": "나무 대문, 아치 안뜰, 종탑. 시골의 대저택이에요.",
		"RANCHO": "목장",
		"Cercas de madera, granero rojo y establo: tierra tuya hasta donde alcanza la vista.": "나무 울타리, 빨간 헛간, 마구간. 눈이 닿는 끝까지 내 땅이에요.",
		"Bono de relación ya estrenado: no vuelve a sumar.": "관계 보너스는 이미 받았어요. 다시 더해지지 않아요.",
		"¿VOLVER A LA DE FÁBRICA?": "기본으로 되돌릴까요?",
		"Se quita sin reembolso y la casa vuelve a la de fábrica. Comprarla otra vez cuesta lo mismo.": "환불 없이 제거되고 집은 기본 상태로 돌아가요. 다시 사려면 같은 가격이 들어요.",
		"BUZÓN": "우편함",
		"COLUMPIO": "그네",
		"UN AFICIONADO": "어느 팬",
		"Hay {0} ofertas sobre la mesa. No las dejes enfriar.": "제안이 {0}건 와 있어요. 식기 전에 답하세요.",
		"Tu precontrato está firmado. En verano cambias de aires.": "사전 계약에 서명했어요. 여름이면 새 팀으로 떠나요.",
		"Te vi el último partido y no me moví del asiento. Gracias.": "지난 경기 보면서 자리에서 꼼짝도 못 했어요. 고마워요.",
		"Tu nuevo contrato ya está en vigor: {0} temporadas más con nosotros.": "새 계약이 발효됐어요. 앞으로 {0}시즌 더 함께해요.",
		"Van {0} goles esta temporada. La directiva lo celebra contigo.": "이번 시즌 벌써 {0}골. 이사회도 함께 축하해요.",
		"Gracias por los títulos de la temporada pasada. La vitrina también es tuya.": "지난 시즌 우승 고마워요. 트로피 진열장도 당신 거예요.",
		"Te cortan la rueda a gritos. Esta noche el vestuario no espera a nadie.": "고함 속에 기자회견이 끊겨요. 오늘 밤 라커룸은 누구도 기다려 주지 않아요.",
		"El confeti del suelo es del otro. Y aun así te toca contestar.": "바닥의 꽃가루는 상대 팀 몫이에요. 그래도 답은 해야죠.",
		"Se cuela uno a gritar detrás de ti. Un derbi también se gana delante del micro.": "누군가 뒤로 몰래 들어와 소리쳐요. 더비는 마이크 앞에서도 이겨야 해요.",
		"TOCAR EL PIANO": "피아노 연주",
		"OCTAVA {0}": "옥타브 {0}",
		"TOCA LAS TECLAS": "건반을 누르세요",
		"CRUCETA ELIGE · {0} TOCA": "방향키 선택 · {0} 연주",
		"INTERCAMBIADAS": "교환됨",
		"AQUÍ": "여기",
		"PONER AQUÍ": "여기 놓기",
		"TRAER AQUÍ": "여기로 옮기기",
		"DEJARLA AUTOMÁTICA": "자동으로",
		"PROMETER UN GOL": "골 약속",
		"{0} llega con cinco victorias seguidas en liga. El de la radio local, el único que te espera a la salida, te pregunta si os dan miedo.": "{0}, 리그 5연승을 달리며 찾아와요. 출구에서 기다리던 유일한 사람인 지역 라디오 기자가 상대가 두렵냐고 물어요.",
		"{0} llega con cinco victorias seguidas en liga. La sala de prensa está llena hasta el pasillo, y todas las cámaras te preguntan si os dan miedo.": "{0}, 리그 5연승을 달리며 찾아와요. 기자회견장은 복도까지 꽉 찼고, 모든 카메라가 상대가 두렵냐고 물어요.",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Un periodista de la radio local te para en el aparcamiento: ¿es el mejor momento para cruzártelos?": "{0}, 5라운드째 무승에 팬들은 경질을 외치고 있어요. 지역 라디오 기자가 주차장에서 묻네요. 지금이 붙기 딱 좋은 때냐고요.",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Con la sala llena, la primera pregunta es para ti: ¿es el mejor momento para cruzártelos?": "{0}, 5라운드째 무승에 팬들은 경질을 외치고 있어요. 꽉 찬 회견장에서 첫 질문이 나에게 와요. 지금이 붙기 딱 좋은 때냐고요.",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y el chico de la radio local quiere saber si tú sí.": "{0}, 이번 시즌 새 감독 {1} 체제. 어떤 축구를 할지 아무도 모르는데, 지역 라디오의 어린 기자는 나는 아는지 궁금해해요.",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y una sala llena de cámaras quiere saber si tú sí.": "{0}, 이번 시즌 새 감독 {1} 체제. 어떤 축구를 할지 아무도 모르는데, 카메라로 가득한 회견장은 나는 아는지 궁금해해요.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Sólo el fotógrafo del periódico local busca la foto del reencuentro.": "나를 지도했던 {0} 감독이 이제 {1} 클럽의 벤치에 앉아요. 재회 사진을 노리는 건 지역 신문 사진기자뿐이에요.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Medio país quiere la foto del reencuentro, y las cámaras ya os esperan en el túnel.": "나를 지도했던 {0} 감독이 이제 {1} 클럽의 벤치에 앉아요. 온 나라가 재회 사진을 원하고, 카메라는 벌써 터널에서 두 사람을 기다려요.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. En la radio local te preguntan si podrás con él.": "{1} 클럽이 이번 시즌 영입한 {0} 선수는 벌써 팀 내 최고 수준이에요. 지역 라디오에서 그를 감당할 수 있겠냐고 물어요.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Las portadas ya venden el partido como vuestro duelo, y la sala entera te pregunta por él.": "{1} 클럽이 이번 시즌 영입한 {0} 선수는 벌써 팀 내 최고 수준이에요. 1면은 이미 두 사람의 대결로 경기를 홍보하고, 회견장 전체가 그에 대해 물어요.",
		"En tu país se ha coronado {0}. Una radio de allí, de las pocas que te siguen, te pregunta si algún día te verán jugar en casa.": "고국에서 {0} 클럽이 우승했어요. 나를 챙겨 보는 몇 안 되는 현지 라디오가 언젠가 고국에서 뛰는 모습을 볼 수 있겠냐고 물어요.",
		"En tu país se ha coronado {0}, y la prensa de allí abre con tu cara: ¿algún día te verán jugar en casa?": "고국에서 {0} 클럽이 우승했고, 현지 언론은 내 얼굴로 1면을 열어요. 언젠가 고국에서 뛰는 모습을 볼 수 있을까요?",
		"COPAS": "컵",
		"TASACIÓN": "감정",
		"AFICIONADO": "팬",
		"COLECCIONISTA": "수집가",
		"QUEDÁRMELA": "보관",
		"VENDIDA": "판매됨",
		"PERCHERO DE TIENDA": "매장형 유니폼 랙",
		"Doce playeras en ganchos, como en la tienda: las tuyas y las que cambiaste.": "매장처럼 옷걸이에 걸린 유니폼 12벌. 내 것과 교환한 것들.",
		"Te sale a encarar: pica cuando el aro llegue a sus piernas y pásasela por el túnel.": "수비수가 막아서요. 링이 다리에 닿을 때 탭해서 알까기하세요.",
		"Toca la pantalla cuando el aro se cierre": "링이 닫힐 때 화면을 탭하세요",
		"Pulsa cuando el aro se cierre": "링이 닫힐 때 누르세요",
		"SUBASTAR": "경매",
		"SALIDA": "시작가",
		"PUJA": "입찰",
		"PARA EL {0}": "{0}번에게",
		"SE FUE": "넘어감",
		"ADJUDICAR": "낙찰",
		"COBRAR": "수령",
		"¡VENDIDA!": "판매 완료!",
		"DESIERTA": "유찰",
		"DUDA": "고민",
		"${0} / PARTIDO": "${0} / 경기",
		"+${0} POR {1}": "+${0} / {1}",
		"INDEMNIZACIÓN ${0}": "위약금 ${0}",
		"ROMPISTE CON {0}": "{0} 계약 파기",
		"URNA DE PLAYERAS": "유니폼 케이스",
		"MURAL DE PLAYERAS": "유니폼 월",
		"VITRINA DE ESPECIALES": "희귀 유니폼 케이스",
		"Tres playeras tras el cristal, con luz de museo.": "유리 속 유니폼 3벌, 박물관 조명까지.",
		"Seis playeras enmarcadas en dos filas: tu salón de la fama.": "두 줄로 액자에 넣은 유니폼 6벌. 나만의 명예의 전당.",
		"Se llena sola con tus cambiadas más raras y valiosas.": "가장 희귀하고 값진 교환 유니폼으로 저절로 채워져요.",
		"CHIHUAHUA": "치와와",
		"SALCHICHA": "닥스훈트",
		"GOLDEN": "골든",
		"HUSKY": "허스키",
		"GATO NEGRO": "검은 고양이",
		"GATO GRIS": "회색 고양이",
		"SIAMES": "샴고양이",
		"PERSA": "페르시안",
		"Cabe en una mano y ladra como uno grande.": "한 손에 쏙 들어오지만 큰 개처럼 짖어요.",
		"Largo, bajito y siempre detrás de ti.": "길쭉하고 작고, 늘 뒤를 졸졸 따라와요.",
		"Dorado, bonachón y el favorito del vestuario.": "황금빛 순둥이, 라커룸의 인기쟁이예요.",
		"Ojos de hielo y energía para dar y regalar.": "얼음 같은 눈에 넘치는 에너지.",
		"Dicen que da mala suerte... al rival.": "불운을 부른다던데... 상대 팀한테요.",
		"Tranquilo, elegante y dueño del sofá.": "차분하고 우아한 소파의 주인님.",
		"Ojos azules y opinión sobre todo.": "파란 눈에, 모든 일에 할 말이 있어요.",
		"Una nube blanca que duerme donde quiere.": "아무 데서나 자는 하얀 구름이에요.",
		"LUEGO": "나중에",
		"AL VECINDARIO": "동네로",
		"EL COMUNICADO": "공식 입장",
		"Tus palabras siguen dando vueltas y el club espera un comunicado antes del próximo partido.": "네 발언이 여전히 화제고, 구단은 다음 경기 전에 공식 입장을 기다리고 있다.",
		"Tu roja dejó al equipo con diez. El club te pide un comunicado antes del próximo partido.": "네 퇴장으로 팀이 10명이 됐다. 구단은 다음 경기 전에 공식 입장을 요구한다.",
		"Tu festejo le costó una multa al club y la polémica no se apaga. Esperan tu comunicado.": "네 세리머니로 구단이 벌금을 냈고 논란이 가라앉지 않는다. 다들 네 입장을 기다린다.",
		"PEDIR PERDÓN": "사과하기",
		"SOSTENERLO": "입장 고수",
		"HIERBAS": "허브",
		"LECHUGA": "상추",
		"JITOMATE": "토마토",
		"CHILES": "고추",
		"FRESAS": "딸기",
		"MAÍZ": "옥수수",
		"AGUACATE": "아보카도",
		"AGAVE": "용설란",
	},





	"match_strip": {
		"ULTIMO": "지난",
		"PROXIMO": "다음",
		"DEBUT": "데뷔",
		"FIN": "끝",
		"HOY": "오늘",
		"DERBI": "더비",
		"CASA": "홈",
		"FUERA": "원정",



		"{0} DERBIS · {1}": "더비 {0}회 · {1}",
		"{0} DERBIS SIN GANARLE": "더비 {0}경기 무승",
		"{0} DERBIS GANADOS SEGUIDOS": "더비 {0}연승",
		"NUNCA LE HAS GANADO": "한 번도 못 이김",
		"NO LE GANAS DESDE HACE {0} AÑOS": "{0}년째 무승",


		"G": "W",
		"E": "D",
		"P": "L",


		"LIGA": "리그",
		"COPA": "컵",
		"CLASIF": "예선",
		"MUNDIAL": "세계 대회",

		"J{0}": "{0}R",
		"GRUPO {0}": "{0}조",

		"LIGA {0}": "리그 {0}",



		"DIECISEISAVOS": "32강",
		"OCTAVOS": "16강",
		"CUARTOS": "8강",
		"SEMIFINAL": "준결승",



		"rondaIDA": "1차전",
		"rondaVUELTA": "2차전",
		"FINAL": "결승",
		"PRIMERA RONDA": "1라운드",
		"SEGUNDA RONDA": "2라운드",
		"TERCERA RONDA": "3라운드",
		"CUARTA RONDA": "4라운드",
		"QUINTA RONDA": "5라운드",
		"SEXTA RONDA": "6라운드",
		"SÉPTIMA RONDA": "7라운드",
		"OCTAVA RONDA": "8라운드",
		"TREINTAIDOSAVOS": "64강",
		"FASE DE GRUPOS": "조별 리그",
	},





















	"content": {
		"MEJOR DEL MUNDIAL": "세계 대회 MVP",
		"MEJOR DE LA COPA CONTINENTAL": "대륙컵 MVP",
		"PREMIO CONTINENTAL": "대륙 어워드",
		"El mundo entero miraba. Y el mejor fuiste tú.": "온 세상이 지켜봤어요. 그리고 최고는 바로 나였어요.",
		"Tu continente tuvo un dueño este verano.": "이번 여름, 대륙의 주인은 따로 있었어요.",
		"Ser el Mejor del Mundial con tu selección.": "대표팀으로 세계 대회 MVP 되기.",
		"PREMIO DEL MUNDO": "월드 어워드",
		"CHICO DE ORO": "골든 키드",
		"Premio del Mundo": "월드 어워드",
		"Chico de Oro": "골든 키드",
		"El Mejor del Planeta": "지구 최고의 선수",
		"Ganar el Chico de Oro, la promesa del año.": "올해의 유망주, 골든 키드 수상하기.",
		"Ganar el Premio del Mundo.": "월드 어워드 수상하기.",
		"GOL DEL AÑO": "올해의 골",
		"Gol del Año": "올해의 골",
		"GOL OLÍMPICO": "코너 직접골",
		"BAJO LA BARRERA": "벽 아래로",
		"DESDE LEJOS": "중거리",
		"CON ROSCA": "감아차기",
		"CHILENA": "바이시클",
		"VOLEA": "발리",
		"PANENKA": "파넨카",
		"DE FALTA": "프리킥",
		"DE CABEZA": "헤더",
		"Obra de Arte": "예술 작품",
		"Ganar el Gol del Año.": "올해의 골 수상하기.",
		"EL PASILLO": "축하의 길",
		"Tu gol 100, 250 o 500 con el club: tus compañeros se abren en dos filas aplaudiendo y tú cruzas por el medio saludando.": "클럽 통산 100, 250, 500호 골. 동료들이 두 줄로 서서 박수 치고, 나는 그 사이를 손 흔들며 걸어가요.",
		"EL MARCADOR SIGUE PUESTO": "전광판은 아직 켜져 있다",
		"Tres horas después del pitido. Nadie ha venido a apagarlo.": "종료 휘슬 세 시간 뒤. 아무도 끄러 오지 않았어요.",
		"Tres horas después del pitido. En su casa nadie ha venido a apagarlo.": "종료 휘슬 세 시간 뒤. 상대 홈에선 아무도 끄러 오지 않았어요.",
		"TE AGUANTAS LA MIRADA": "내 눈을 마주 볼 수 있다",
		"NO TE AGUANTAS LA MIRADA": "내 눈을 마주 볼 수 없다",
		"El de enfrente durmió bien. Es el mismo que juega el jueves.": "거울 속 그 사람은 잘 잤어요. 목요일에 뛰는 것도 그 사람이에요.",
		"El de enfrente no durmió. Y es el que juega el jueves.": "거울 속 그 사람은 못 잤어요. 그리고 목요일에 뛰는 게 그 사람이에요.",
		"VEINTE MINUTOS DESPUÉS": "20분 뒤",
		"el marcador": "스코어",
		"minutos": "분",
		"El escudo que amaneció clavado en tu hueco lo pisó media plantilla al salir.": "아침에 내 사물함에 박혀 있던 엠블럼은 나가는 길에 동료 절반이 밟고 지나갔어요.",
		"Nadie descolgó la hoja del rival. Tu camiseta se quedó donde la tiraste.": "아무도 상대 팀 종이를 떼지 않았어요. 내 유니폼은 던져 둔 그 자리에 그대로예요.",










		"SE ABRE EL MERCADO": "이적 시장 개장",
		"LOS QUE QUIERE": "영입 희망",
		"LOS QUE SUELTA": "방출 대상",
		"MERCADO DE VERANO": "여름 이적 시장",
		"El club no busca a nadie": "클럽이 찾는 선수가 없어요",
		"El club no suelta a nadie": "클럽이 내보낼 선수가 없어요",
		"PARA CEDER": "임대 대상",
		"INTOCABLES": "판매 불가",
		"Nadie en venta": "판매 대상 없음",
		"Nadie para ceder": "임대 대상 없음",
		"Nadie es intocable": "판매 불가 선수 없음",
		"TU MEDIA": "내 능력치",
		"TU VALOR": "내 가치",
		"ENTRAN": "영입",
		"SALEN": "방출",
		"CEDIDO": "임대",
		"LIBRE": "자유",
		"Nadie ha visto todavía lo que haces": "아직 아무도 내 실력을 못 봤어요",
		"La temporada que hiciste te pone por encima": "지난 시즌 활약이 나를 위로 올려줘요",
		"Llevas años aquí y eso pesa": "여기서 보낸 세월이 무게가 있어요",
		"El once no se entiende sin ti": "선발 11명은 나 없이는 말이 안 돼요",
		"La temporada que hiciste no te defiende": "지난 시즌 활약이 나를 지켜주지 못해요",
		"Casi no juegas, y eso se nota en la lista": "거의 못 뛰었고, 명단에도 그게 드러나요",
		"El club se hundió y hay que hacer caja": "클럽이 무너져서 돈을 마련해야 해요",
		"El club salvó el año y no necesita vender": "클럽이 시즌을 지켜내서 팔 필요가 없어요",
		"Lo que vales hoy es dinero que el club mira": "지금 내 가치는 클럽이 눈독 들이는 돈이에요",


		"Un año. Lo que le regales dice si la conociste.":
			"1년. 무슨 선물을 하느냐가 그녀를 알았는지 말해줘요.",
		"{0} años. Lo que le regales dice si la conociste.":
			"{0}년. 무슨 선물을 하느냐가 그녀를 알았는지 말해줘요.",
		"Poso de los años: {0}%":
			"함께한 세월: {0}%",
		"Se te pasó la fecha. Ella no dijo nada.":
			"날짜를 놓쳤어요. 그녀는 아무 말도 하지 않았어요.",
		"Se quedó callada un momento. Era exactamente eso.":
			"그녀는 잠시 말이 없었어요. 바로 그거였어요.",
		"Poso de los años: {0}% — las malas rachas pesan menos.":
			"함께한 세월: {0}% — 힘든 시기가 덜 무거워져요.",
		"Dio las gracias y lo dejó en la mesa del recibidor.":
			"고맙다고 하고는 현관 탁자에 두었어요.",
		"Un año más, y sigues sin saber quién es.":
			"또 1년이 지났는데, 아직도 그녀가 누군지 몰라요.",
		"Un fin de semana los dos solos, sin teléfono":
			"휴대폰 없이 둘만의 주말",
		"Una fiesta con toda la gente que quiere":
			"그녀가 아끼는 사람들을 모두 부른 파티",
		"Poner su nombre en algo tuyo: el coche, la casa, la cuenta": "내 것에 그녀 이름 올리기: 차, 집, 통장",
		"Algo que compraste con prisa y sin pensar":
			"급하게 생각 없이 산 물건",
		"Un billete abierto para que se vaya donde quiera":
			"어디든 갈 수 있는 오픈 티켓",
		"Repetir exactamente la primera cena, mesa incluida":
			"첫 저녁 식사를 테이블까지 그대로 재현",
		"UN AÑO MÁS":
			"또 1년",
		"Hoy hace justo un año de aquello, y {0} no lo ha mencionado"
		+ " ni una vez en toda la semana. Eso no significa que se le"
		+ " haya olvidado.":
			"오늘로 그 일이 있은 지 꼭 1년인데, 이번 주 내내 {0}의 입에서 그 얘기가 한 번도 나오지 않았어요. 잊었다는 뜻은 아니에요.",
		"PREPARARLE ALGO":
			"뭔가 준비하기",
		"DEJARLO PASAR":
			"그냥 넘기기",



		"Le queda una noche. Aciertos: {0} de {1}":
			"남은 밤은 하루. 맞힌 답: {1}개 중 {0}개",
		"Lo que digas ahora depende de quién es ella.":
			"지금 할 말은 그녀가 어떤 사람인지에 달렸어요.",
		"Deshizo una maleta. Sólo una, y sin decir nada.":
			"그녀가 캐리어 하나를 풀었어요. 딱 하나, 아무 말 없이.",
		"Se queda. No es lo de antes, pero se queda.":
			"그녀가 남아요. 예전 같진 않지만, 남아요.",
		"Cerró la puerta despacio, que es peor que un portazo.":
			"그녀가 문을 천천히 닫았어요. 쾅 닫는 것보다 더 아파요.",
		"Se acabó.":
			"끝났어요.",


		"EL CUARTO DE INVITADOS":
			"손님방",
		"Llevas tres noches durmiendo solo. {0} dice que es por la espalda, y en la"
		+ " cama de al lado hay una almohada que no estaba.":
			"사흘째 혼자 자고 있어요. 허리 때문이라는 {0}의 말과 달리, 옆 침대엔 못 보던 베개가 놓여 있어요.",
		"PREGUNTARLE QUÉ PASA":
			"무슨 일인지 묻기",
		"SERÁ LA ESPALDA":
			"허리 때문이겠지",
		"NO PREGUNTÓ POR EL PARTIDO":
			"경기 얘기를 묻지 않았다",
		"Entras, dejas la bolsa, y {0} sigue con lo suyo. Antes preguntaba antes de que"
		+ " te quitaras el abrigo. Hoy no, y ayer tampoco.":
			"들어와서 가방을 내려놔도 하던 일만 계속하는 {0}. 예전엔 외투를 벗기도 전에 물었는데, 오늘은 아니에요. 어제도요.",
		"APAGAR EL TELÉFONO Y SENTARTE":
			"폰 끄고 앉기",
		"SUBIR A DUCHARTE":
			"올라가서 샤워하기",
		"LA MALETA PEQUEÑA":
			"작은 캐리어",
		"La maleta de mano lleva dos semanas junto a la puerta, hecha. {0} no la ha"
		+ " deshecho ni una vez, y tampoco se ha ido.":
			"{0}의 기내용 캐리어가 짐이 싸인 채 2주째 문 옆에 있어요. 한 번도 풀지 않았고, 떠나지도 않았어요.",
		"PEDIR PERMISO Y LLEVÁRTELA":
			"휴가 내고 데려가기",
		"NO ABRIR ESE TEMA":
			"그 얘기는 꺼내지 않기",
		"PASAR LA TARDE JUNTOS":
			"함께 오후 보내기",
		"Sin teléfono y sin prisa. Se nota más de lo que parece.":
			"휴대폰 없이, 서두르지 않고. 보기보다 큰 의미가 있어요.",
		"En casa se descansa: +{0} de energía cada jornada.":
			"집에서 푹 쉬어요. 매 라운드 에너지 +{0}.",
		"Así no se duerme: {0} de energía cada jornada.":
			"이래선 잠을 못 자요. 매 라운드 에너지 {0}.",
		"DEJARLA":
			"헤어지기",
		"PEDIR EL DIVORCIO":
			"이혼 신청",
		"¿DIVORCIARTE DE {0}?":
			"{0}, 이혼할까요?",
		"¿DEJAR A {0}?":
			"{0}, 헤어질까요?",
		"El reparto se paga igual que si lo pidiera ella: ${0}.":
			"재산 분할은 그녀가 요구했을 때와 똑같이 들어요: ${0}.",
		"La separación de bienes que firmasteis sigue valiendo. Es todo lo que te"
		+ " protege.":
			"서명했던 혼전 계약은 아직 유효해요. 나를 지켜주는 건 그것뿐이에요.",
		"No firmasteis nada, así que entra todo: el dinero y lo que tienes puesto.":
			"아무것도 서명하지 않아서 전부 분할 대상이에요. 현금도, 가진 것도.",
		"No cuesta nada. Ni dinero ni prensa.":
			"드는 건 없어요. 돈도, 기사도.",
		"Y no te va a presentar nadie a nadie en una buena temporada. Estas cosas se"
		+ " cuentan.":
			"그리고 한동안은 아무도 누굴 소개해 주지 않을 거예요. 이런 일은 소문이 나요.",
		"SÍ, SE ACABÓ":
			"응, 끝이야",
		"SE LLEVA ${0}":
			"그녀 몫 ${0}",
		"«Me quedo. Los viajes que pueda perdonar, los pierdo.»":
			"«나 남을게. 빠질 수 있는 원정은 다 빠질게.»",
		"«No te voy a pedir que esperes. Te pido que elijas tú.»":
			"«기다려 달라곤 안 할게. 네가 선택해 줘.»",
		"«Esto se arregla con tiempo. Dame la temporada.»":
			"«시간이 해결해 줄 거야. 이번 시즌만 줘.»",
		"«Dime qué necesitas y lo hago mañana.»":
			"«뭐가 필요한지 말해 줘. 내일 바로 할게.»",
		"«No hace falta que digas nada. Me siento y te escucho.»":
			"«아무 말 안 해도 돼. 앉아서 들을게.»",
		"«Piensa en todo lo que hemos hecho.»":
			"«우리가 함께한 걸 다 생각해 봐.»",
		"«Si te vas lo entiendo. Pero prefiero que te quedes.»":
			"«떠난다면 이해해. 그래도 남아 줬으면 좋겠어.»",
		"«Mañana no hay entrenamiento. Vámonos donde quieras.»":
			"«내일 훈련 없어. 가고 싶은 데 가자.»",
		"«Ya está, ¿no? Pues ya está.»":
			"«이걸로 끝이야? 그래, 끝이야.»",
		"Se sienta en el brazo del sofá, sin quitarse el abrigo.":
			"그녀는 외투도 벗지 않고 소파 팔걸이에 앉아요.",
		"No ha dicho que no. Sigue ahí.":
			"싫다고 하진 않았어요. 아직 거기 있어요.",
		"Mira las maletas y luego te mira a ti.":
			"그녀가 캐리어를 보고, 그다음 나를 봐요.",
		"Las maletas de {0} llevan dos días en el recibidor y esta"
		+ " vez no las está deshaciendo. Queda una conversación, y es"
		+ " esta noche.":
			"{0}의 캐리어가 이틀째 현관에 있고, 이번엔 풀지 않고 있어요. 남은 대화는 하나, 오늘 밤이에요.",
		"HABLAR CON ELLA":
			"그녀와 대화하기",
		"DEJAR QUE SE VAYA":
			"보내 주기",


		"TU EX HABLA":
			"전 애인의 폭로",
		"Una revista le ha pagado a {1} por contar cómo eras"
		+ " entonces. No miente en nada, y eso es lo peor. {0} lo ha"
		+ " leído entero.":
			"한 잡지가 돈을 주고 {1}에게 예전의 내 모습을 털어놓게 했어요. 거짓말은 하나도 없고, 그게 최악이에요. {0}도 전부 읽었어요.",
		"NO CONTESTAR":
			"대응하지 않기",
		"DESMENTIRLO EN PÚBLICO":
			"공개적으로 부인",
		"ESTABA EN LA MISMA MESA":
			"바로 옆 테이블에",
		"Cena de gala, y en la mesa de al lado está {1}. {0} la ha"
		+ " reconocido antes de sentarse y no ha soltado tu mano en toda"
		+ " la noche.":
			"갈라 디너, 옆 테이블에 {1}. 앉기도 전에 {0}의 눈이 먼저 알아봤고, 밤새 내 손을 놓지 않아요.",
		"SALUDARLA Y VOLVER":
			"인사하고 돌아오기",
		"HACER COMO QUE NO":
			"못 본 척하기",




		"LA CENA DEL VESTUARIO":
			"선수단 회식",
		"El grupo sale a cenar y alguien lo deja caer con una"
		+ " sonrisa: «esta vez, solos». {0} ya se estaba arreglando.":
			"선수들이 저녁을 먹으러 나가는데, 누군가 웃으며 슬쩍 말해요. «이번엔 우리끼리.» 이미 단장 중이던 {0}.",
		"LLEVARLA IGUAL":
			"그래도 데려가기",
		"LA ENTRADA DEL PALCO":
			"VIP석 자리",
		"El club te ofrece una butaca de palco para {0}. Desde ahí se"
		+ " ve el partido; desde la grada de siempre se ve a la gente.":
			"클럽이 {0}에게 VIP석 좌석을 제안해요. 거기선 경기가 보이고, 늘 앉던 관중석에선 사람들이 보여요.",
		"AL PALCO":
			"VIP석",
		"CON LA GRADA":
			"관중석에서",
		"LA QUIEREN EN LA CAMPAÑA":
			"광고에 그녀를 원해요",
		"La marca ha visto una foto vuestra y quiere a {0} en el"
		+ " anuncio. Pagan por los dos y no aceptan un no fácil.":
			"스폰서가 두 사람 사진을 보고 {0}의 광고 출연을 원해요. 둘 다에게 출연료를 주고, 쉽게 거절을 받아들이지 않아요.",
		"QUE SALGA ELLA":
			"출연시키기",
		"ELLA NO SE VENDE":
			"그녀는 팔지 않아",
		"LA CENA DE TU AGENTE":
			"에이전트의 만찬",
		"Tu agente ha montado una cena con gente que decide cosas. Es"
		+ " esta noche, y esta noche ya la teníais ocupada.":
			"에이전트가 결정권 있는 사람들과의 만찬을 잡았어요. 오늘 밤인데, 오늘 밤은 이미 약속이 있었어요.",
		"IR A LA CENA":
			"만찬 가기",
		"LO QUE TENÍAIS":
			"원래 약속",
		"EL VÍDEO DEL MÍSTER":
			"감독의 영상",
		"El técnico ha mandado dos horas de vídeo para esta noche."
		+ " {0} lleva toda la semana esperando esta noche.":
			"감독이 오늘 밤 볼 영상 2시간 분량을 보냈어요. {0}에게는 일주일 내내 기다린 밤이에요.",
		"VERLO ENTERO":
			"전부 보기",
		"MAÑANA LO VES":
			"내일 봐도 돼",
		"OS QUIEREN A LOS DOS":
			"둘 다 원해요",
		"Un programa quiere una entrevista de pareja. Sería la"
		+ " primera vez que {0} habla delante de una cámara.":
			"한 프로그램이 커플 인터뷰를 원해요. {0}에게는 처음으로 카메라 앞에서 말하는 자리가 될 거예요.",
		"IR JUNTOS":
			"함께 가기",
		"IR TÚ SOLO":
			"혼자 가기",
		"EL PLAN DE NO HACER NADA":
			"아무것도 안 하기 계획",
		"Hay tres sitios donde deberías dejarte ver este fin de"
		+ " semana. {0} ha comprado comida para dos y no piensa moverse"
		+ " de casa.":
			"이번 주말 얼굴을 비춰야 할 곳이 세 군데예요. 2인분 장을 봐 온 {0}, 집에서 꼼짝 안 할 생각이에요.",
		"QUEDARTE CON ELLA":
			"그녀와 집에 있기",
		"DEJARTE VER":
			"얼굴 비추기",
		"ELLA CREE QUE VALES MÁS":
			"그녀는 내가 더 받아야 한대요",
		"{0} ha leído lo que cobra el que juega en tu puesto en otro"
		+ " sitio. «Pide lo tuyo o pídelo yo por ti.»":
			"다른 팀 같은 포지션 선수의 연봉 기사를 읽은 {0}. «네 몫을 요구해. 아니면 내가 대신 할게.»",
		"PEDIR MÁS AL CLUB":
			"클럽에 인상 요구",
		"ESTOY BIEN AQUÍ":
			"여기 만족해",
		"LA FOTO DEL PATROCINIO":
			"스폰서 사진",
		"En la foto de la marca sales con una modelo a medio metro."
		+ " {0} la ha visto antes que tú y no ha dicho nada, que es"
		+ " peor.":
			"스폰서 사진 속 내 옆 50cm에 모델이 있어요. 나보다 먼저 본 {0}, 아무 말도 하지 않았어요. 그게 더 나빠요.",
		"HABLARLO ESA NOCHE":
			"그날 밤 대화하기",
		"ES TRABAJO, SE LE PASA":
			"일이야, 곧 풀릴 거야",
		"SE FUE SIN AVISAR":
			"말없이 떠났다",
		"{0} se ha ido diez días con sus amigas y te has enterado por"
		+ " una foto. No es una prueba: es que no se le ocurrió que"
		+ " hubiera que pedir permiso.":
			"친구들과 열흘 여행을 떠난 {0}. 나는 사진을 보고서야 알았어요. 시험하는 게 아니에요. 허락을 구해야 한다는 생각 자체를 못 한 거예요.",
		"DESEARLE BUEN VIAJE":
			"즐거운 여행 빌어주기",
		"PEDIRLE EXPLICACIONES":
			"해명 요구하기",
		"ELLA YA ERA DE AQUÍ":
			"원래 우리 편이었다",
		"{0} tiene su sitio en la grada desde antes de conocerte y no"
		+ " piensa cambiarlo por un palco. Hoy le toca cantar contigo"
		+ " abajo.":
			"{0}의 관중석 자리는 나를 만나기 전부터였고, VIP석과 바꿀 생각이 없어요. 오늘은 아래에서 나를 위해 노래해요.",
		"SALUDARLA AL GOL":
			"골 넣고 그녀에게 인사",
		"ESO NO SE HACE":
			"그건 아니지",
		"LA CAZARON EN LA PUERTA":
			"현관에서 찍혔다",
		"Alguien vendió una foto de {0} saliendo de tu casa. No sale"
		+ " mal; sale sin querer salir, que para ella es lo mismo.":
			"누군가 우리 집을 나서는 {0}의 사진을 팔았어요. 못 나온 건 아니에요. 찍히기 싫은 얼굴로 나왔고, 그녀에겐 그게 같은 거예요.",
		"PARAR ESO COMO SEA":
			"무슨 수를 써서든 막기",
		"SE OLVIDA EN DOS DÍAS":
			"이틀이면 잊혀",
		"LA SEMANA MALA":
			"최악의 한 주",
		"Otra derrota, y en casa no se habla de otra"
		+ " cosa. {0} no te pregunta: te pone las botas en la puerta y"
		+ " se calla.":
			"또 패배, 집에서도 그 얘기뿐이에요. {0}의 대답은 질문 대신 문 앞에 놓인 축구화, 그리고 침묵이에요.",
		"SALIR A CORRER CON ELLA":
			"그녀와 함께 달리기",

		"TU AGENTE · «llámame, es importante»":
			"에이전트 · «전화 줘, 중요한 일이야»",
		"EL MÍSTER · vídeo del rival, para hoy":
			"감독 · 상대 분석 영상, 오늘 밤까지",
		"TU MARCA · quieren una foto mañana":
			"스폰서 · 내일 사진 촬영 원함",




		"Le gusta la vida tranquila. No pide focos, pide que estés.":
			"조용한 삶을 좋아해요. 스포트라이트가 아니라 내가 곁에 있길 원해요.",
		"Vive de noche. Contigo o sin ti, y eso es justo el problema.":
			"밤에 살아요. 나와 함께든 아니든. 그게 바로 문제예요.",
		"Tiene lo suyo y va en serio. Te quiere arriba, y lo dice.":
			"자기 일이 있고 진지해요. 내가 정상에 서길 바라고, 그걸 말해요.",
		"Te quiere entero. Cada foto con otra le cuesta una noche.":
			"나를 온전히 원해요. 다른 여자와 찍힌 사진 한 장마다 그녀의 밤 하나가 사라져요.",
		"No te necesita, te eligió. Aguanta todo menos que la des por"
		+ " hecha.":
			"내가 필요한 게 아니라 나를 선택했어요. 당연하게 여기는 것만 빼면 다 참아요.",
		"Iba al estadio antes de conocerte. Los domingos son"
		+ " sagrados.":
			"나를 만나기 전부터 경기장에 다녔어요. 일요일은 신성해요.",
		"Odia la prensa. Contigo en privado lo da todo; en público,"
		+ " nada.":
			"언론을 싫어해요. 둘만 있을 땐 전부를 주지만, 공개석상에선 아무것도 없어요.",
		"Entiende el oficio: entrena, viaja, aguanta. Y espera lo"
		+ " mismo.":
			"이 일을 이해해요. 훈련하고, 원정 다니고, 버텨요. 그리고 나에게도 같은 걸 기대해요.",

		"Trabaja en algo que nunca termina de explicar. Invita ella, y no deja discutirlo.":
			"제대로 설명한 적 없는 일을 해요. 계산은 늘 그녀가 하고, 토를 달지 못하게 해요.",
		"LA CUENTA YA ESTABA PAGADA":
			"계산은 이미 끝나 있었다",
		"{0} ha pagado la cena, el hotel y un coche nuevo para tu madre, y no entiende qué te molesta. «Tengo más de lo que me voy a gastar nunca. Déjame.»":
			"저녁, 호텔, 우리 엄마 새 차까지 계산한 {0}. 내가 왜 불편한지 모르겠대요. \"평생 써도 다 못 쓸 만큼 있어. 그냥 둬.\"",
		"DEJAR QUE PAGUE":
			"계산하게 두기",
		"LA PRÓXIMA PAGO YO":
			"다음엔 내가 낼게",
		"REGALO DE ELLA":
			"그녀의 선물",
		"FESTEJOS":
			"세리머니",
		"FALTAN {0}": "{0}개 남음",
		"COMPLETA":
			"완성",
		"continenteEUROPA": "유럽",
		"continenteSUDAMÉRICA": "남미",
		"continenteNORTEAMÉRICA": "북미",
		"continenteÁFRICA": "아프리카",
		"continenteASIA": "아주",
		"continenteOCEANÍA": "대양주",
		"RIVALES":
			"라이벌",
		"VENCIDO":
			"격파",
		"Cada rival al que le ganes un partido queda apuntado aquí para siempre, en todas tus carreras.":
			"경기에서 이긴 라이벌은 모든 커리어에 걸쳐 여기에 영원히 기록돼요.",
		"PAREJAS":
			"연인",
		"Las mujeres de tu vida. Cada una destapa su medalla el día que se muda contigo, te casas con ella o se acaba.":
			"내 인생의 여자들. 함께 살게 되는 날, 결혼하는 날, 또는 끝나는 날 각자의 메달이 공개돼요.",
		"Pareja por descubrir. Sabrás quién es el día que se mude contigo.":
			"아직 모르는 연인. 함께 살게 되는 날 누군지 알게 돼요.",
		"La última: {0}":
			"마지막 연인: {0}",
		"LA CENA DEL CLUB":
			"클럽 만찬",
		"EL BAR":
			"바",
		"LA GALERÍA":
			"갤러리",
		"LA PUERTA DEL ESTADIO":
			"경기장 출입구",
		"DÓNDE LA CONOCES":
			"만나는 곳",
		"GASTO EN CASA":
			"생활비",
		"DESCANSO EN CASA":
			"집에서 휴식",
		"SE ENFADA":
			"화남",
		"SE CONTENTA":
			"기분 좋음",
		"PIDE DINERO":
			"돈 요구",
		"EL {0} DEL SUELDO":
			"주급의 {0}",
		"NUNCA":
			"없음",
		"PIDE EL DIVORCIO":
			"이혼 요구",
		"PUEDE HACERLO":
			"할 수 있음",
		"TU CASA O TU SUELDO":
			"집 또는 주급",
		"EL {0} DE LO TUYO":
			"내 재산의 {0}",
		"SE LLEVA AL IRSE":
			"떠날 때 가져감",
		"TE REGALA":
			"선물",
		"HASTA EL {0} DEL SUELDO":
			"최대 주급의 {0}",
		"SE MUDA CONTIGO":
			"동거 시작",
		"PRONTO":
			"곧",
		"SIN PRISA":
			"천천히",
		"BAJA SOLA DESDE":
			"자연 감소 시작",
		"{0} · RÁPIDO":
			"{0} · 빠르게",
		"{0} · DESPACIO":
			"{0} · 천천히",
		"{0} · APENAS":
			"{0} · 거의 없음",
		"VIVIR CON ELLA":
			"그녀와의 동거",
		"INVITA ELLA":
			"그녀가 냄",
		"· invita ella":
			"· 그녀가 냄",
		"La boda la paga ella: ${0}.":
			"결혼식 비용은 그녀가 내요: ${0}.",
		"Boda pagada por ella: ${0}.":
			"그녀가 낸 결혼식 비용: ${0}.",
		"LA TASACIÓN":
			"감정 평가",
		"Ha venido un señor con una carpeta a medir el salón y a fotografiar la vitrina. {0} dice que es por el seguro. Nadie ha cambiado el seguro.":
			"서류철을 든 남자가 와서 거실 치수를 재고 트로피 진열장 사진을 찍어 갔어요. {0}의 말로는 보험 때문이래요. 보험은 아무도 바꾸지 않았어요.",
		"SUBIRLE LA ASIGNACIÓN":
			"용돈 올려주기",
		"NO LE DOY MÁS":
			"한 푼도 더는 안 돼",
		"CUANDO LE CONVENGA":
			"그녀 마음 내킬 때",
		"TE CUESTA MÁS":
			"비용 증가",
		"TE SUMA MÁS":
			"효과 증가",
		"TE CUESTA MENOS":
			"비용 감소",
		"TE SUMA MENOS":
			"효과 감소",

		"LAS ESCRITURAS":
			"집문서",
		"Tu agente trae las escrituras de la casa y una sola pregunta: a nombre de quién. {0} ya ha preguntado dos veces si hay que firmar algo.":
			"에이전트가 집문서와 질문 하나를 들고 왔어요. 누구 명의로 할 건지. 서명할 게 있냐는 {0}의 질문은 벌써 두 번째예요.",
		"QUE DECIDA ELLA":
			"그녀가 정하게",
		"Tu agente pone las escrituras sobre la mesa y pregunta sin mirarte: «¿a nombre de quién?».":
			"에이전트가 집문서를 탁자에 올려놓고 나를 보지도 않은 채 물어요. «누구 명의로요?»",
		"MANTÉN · A NOMBRE DE MI MADRE":
			"길게 눌러 · 엄마 명의로",
		"MANTÉN · A SU NOMBRE":
			"길게 눌러 · 그녀 명의로",
		"Tu madre firmó sin gafas y sin preguntar. Al salir te dijo: «Yo no entiendo de papeles, hijo. Pero de esa casa no me saca nadie».":
			"엄마는 안경도 안 끼고 묻지도 않고 서명했어요. 나가면서 한마디 하셨죠. \"난 서류는 잘 몰라, 아들. 그래도 그 집에선 아무도 날 못 내보내.\"",
		"Ella se enteró esa noche y pidió más asignación: el {0} de tu sueldo.":
			"그날 밤 알게 된 그녀가 용돈 인상을 요구했어요: 주급의 {0}.",
		"Leyó su nombre dos veces y sonrió. Esa noche no habló de la asignación.":
			"그녀는 자기 이름을 두 번 읽고 웃었어요. 그날 밤 용돈 얘기는 없었어요.",
		"Su abogado pidió la casa. Las escrituras dicen otra cosa.":
			"그녀의 변호사가 집을 요구했어요. 집문서 내용은 달라요.",
		"La casa está a nombre de tu madre.":
			"집은 엄마 명의예요.",
		"FIRMAR Y QUE SE VAYA":
			"서명하고 보내기",
		"Su abogado trae las escrituras con su nombre. El tuyo consigue cambiarlas por la mitad de tu cuenta.":
			"그녀의 변호사가 그녀 명의의 집문서를 가져와요. 내 변호사가 통장 잔고 절반과 맞바꾸는 데 성공해요.",
		"La casa y tu ficha se quedan.":
			"집과 주급은 지켰어요.",
		"LA MITAD DE TU DINERO · ${0}":
			"내 돈의 절반 · ${0}",
		"Se fue con dos maletas, las mismas con las que llegó.":
			"그녀는 올 때 들고 온 캐리어 두 개만 들고 떠났어요.",
		"La casa sigue a nombre de tu madre.":
			"집은 여전히 엄마 명의예요.",
		"Firmaste. La casa vuelve a ser tuya; la cuenta, la mitad.":
			"서명했어요. 집은 다시 내 것, 통장은 절반이 됐어요.",
		"DEPENDE DE LAS ESCRITURAS":
			"집문서에 달렸음",
		"Todo a Nombre de Mamá":
			"전부 엄마 명의",
		"Que su abogado pidiera la casa y las escrituras dijeran otra cosa.":
			"그녀의 변호사가 집을 요구했는데 집문서 내용은 다르게 만들기.",
		"Lo pediste tú, y las escrituras están a nombre de tu madre: no hay nada que repartir.":
			"내가 요구했고 집문서는 엄마 명의예요. 나눌 게 없어요.",
		"Su abogado trae las escrituras con su nombre, pero tu cuenta está a cero: no hay mitad que llevarse.":
			"그녀의 변호사가 그녀 명의의 집문서를 가져왔지만, 내 통장은 0원이에요. 가져갈 절반이 없어요.",
		"Las escrituras están a nombre de tu madre: no se lleva nada.":
			"집문서가 엄마 명의예요. 그녀는 아무것도 못 가져가요.",
		"Las escrituras están a su nombre: se lleva la mitad de tu dinero, ${0}.":
			"집문서가 그녀 명의예요. 내 돈의 절반(${0})을 가져가요.",
		"La casera":
			"집순이",
		"La fiestera":
			"파티걸",
		"La ambiciosa":
			"야심가",
		"La celosa":
			"질투쟁이",
		"La independiente":
			"독립파",
		"La hincha":
			"열성 팬",
		"La reservada":
			"비밀주의",
		"La cazafortunas":
			"꽃뱀",
		"La compañera":
			"동반자",
		"La millonaria":
			"백만장자",
		"Quiere tu tiempo, no tu dinero. En casa se duerme.":
			"돈이 아니라 내 시간을 원해요. 집에서 푹 잘 수 있어요.",
		"Vive de noche, contigo o sin ti. Te cuesta sueño y dinero.":
			"나와 함께든 아니든 밤에 살아요. 잠도 돈도 들어요.",
		"Te quiere arriba, y te pasa la factura por subir.":
			"당신이 정상에 서길 바라지만, 올라가는 비용은 당신에게 청구해요.",
		"Te quiere entero, y cada foto tuya con otra le cuesta una noche.":
			"당신의 전부를 원해요. 다른 여자와 찍힌 사진 한 장마다 그녀는 밤을 설쳐요.",
		"No te necesita: te eligió. Nunca acepta tu dinero.":
			"당신이 필요한 게 아니에요. 당신을 선택한 거죠. 당신 돈은 절대 받지 않아요.",
		"Iba al estadio antes que tú. Los domingos son sagrados.":
			"당신보다 먼저 경기장에 다녔어요. 일요일은 신성한 날이에요.",
		"Odia la prensa. En privado lo da todo.":
			"언론을 싫어해요. 둘만 있을 땐 전부를 줘요.",
		"No te quiere. Cuando le salgan las cuentas, se va con lo tuyo; con papel, tarda más y se lleva menos.":
			"당신을 사랑하지 않아요. 계산이 맞아떨어지면 당신 것을 챙겨 떠날 거예요. 혼전 계약서가 있으면 더 오래 버티고 덜 가져가요.",
		"Entiende el oficio. Entrena, viaja y aguanta contigo.":
			"이 일을 이해해요. 같이 훈련하고, 같이 다니고, 곁에서 버텨줘요.",
		"Tiene más que tú y no te lo dice. Te regala dinero cada jornada y paga la boda.":
			"당신보다 가진 게 많은데 말하지 않아요. 라운드마다 돈을 주고, 결혼식 비용도 내요.",



		"Tu agente lo dice sin mirarte: «firma la separación de"
		+ " bienes».":
			"에이전트가 눈도 마주치지 않고 말해요. «혼전 계약서에 서명해.»",
		"La boda cuesta ${0}.":
			"결혼식 비용: ${0}.",
		"FIRMAR EL PRENUPCIAL":
			"혼전 계약서 서명",
		"CASARSE SIN PAPELES":
			"계약서 없이 결혼",
		"Firmó sin leerlo y no volvió a mencionarlo en toda la noche.":
			"읽지도 않고 서명했고, 그날 밤 내내 다시는 꺼내지 않았어요.",
		"Rompiste el papel delante de ella. Ese gesto lo va a"
		+ " recordar.":
			"그녀 앞에서 계약서를 찢었어요. 그 모습을 그녀는 기억할 거예요.",
		"Boda pagada: ${0}.":
			"결혼식 비용 지불: ${0}",
		"Piden ${0}: ${1} de tu dinero y ${2} de lo que tienes"
		+ " puesto.":
			"요구액은 ${0}. 현금 ${1}, 그리고 가진 재산에서 ${2}.",
		"Con separación de bienes firmada":
			"혼전 계약서 서명함",
		"Sin separación de bienes: entra todo":
			"혼전 계약서 없음: 전부 분할 대상",
		"FIRMAR Y ACABAR":
			"서명하고 끝내기",
		"PELEAR LA CIFRA":
			"금액 다투기",
		"IR A JUICIO":
			"소송 가기",
		"Su abogado tarda dos días en contestar. Baja un poco, y"
		+ " poco.":
			"그녀의 변호사는 답장에 이틀이 걸려요. 금액을 조금 낮춰요. 아주 조금만.",
		"El juez no le dio todo lo que pedía. Te llevas ${0} menos.":
			"판사는 그녀가 요구한 걸 다 주진 않았어요. ${0}만큼 더 지켰어요.",
		"El juez no le dio lo que pedía. Tampoco había mucho que repartir.": "판사는 그녀의 요구를 받아들이지 않았어요. 어차피 나눌 것도 별로 없었어요.",
		"Salió peor que el acuerdo. Los abogados también se cobran.":
			"합의보다 결과가 나빴어요. 변호사들도 자기 몫을 챙기니까요.",
		"Firmaste sin leerlo entero. Se acabó.":
			"끝까지 읽지도 않고 서명했어요. 끝났어요.",
		"Se lleva ${0}. Te quedan ${1}.":
			"그녀 몫은 ${0}. 남은 돈은 ${1}.",

		"Reservaste sin decirle por qué, y {0} bajó vestida para algo que no sabe qué"
		+ " es. El anillo lleva un mes pagado y lo llevas encima.":
			"이유도 말하지 않고 예약했고, {0} 씨는 뭔지 모를 무언가를 위해 차려입고 내려왔어요. 반지는 한 달 전에 결제했고, 지금 주머니 속에 있어요.",
		"PEDÍRSELO ESTA NOCHE":
			"오늘 밤 청혼하기",
		"LO QUE FIRMÁIS":
			"서명할 내용",
		"Tu agente lleva tres días pidiendo veinte minutos. Trae una carpeta y no la ha"
		+ " abierto delante de nadie.":
			"에이전트가 사흘째 20분만 달라고 해요. 폴더를 하나 들고 다니는데, 아무 앞에서도 열지 않았어요.",
		"ESCUCHARLE":
			"들어 보기",
		"NO HAY NADA QUE FIRMAR":
			"서명할 건 없어",

		"UN FAVOR PARA SU HERMANO":
			"그녀 남동생의 부탁",
		"El hermano de {0} tiene un negocio que va a salir seguro y le falta el"
		+ " arranque. Ella no lo pide para ella, y eso es justo lo que hace difícil decir"
		+ " que no.":
			"{0} 씨의 남동생에게 실패할 리 없는 사업이 있는데, 초기 자금만 없대요. 그녀가 자기를 위해 부탁하는 게 아니라서, 거절하기가 더 어려워요.",
		"ADELANTARLE EL DINERO":
			"돈을 빌려주기",
		"QUE LO PIDA AL BANCO":
			"은행에 가 보라고 하기",
		"Tranquila, cariñosa y sin dramas. Nunca te pide explicaciones.":
			"차분하고 다정하고 드라마가 없어요. 해명을 요구하는 일도 없어요.",
		"Su abogado no negocia. Pone dos papeles sobre la mesa y te dice que firmes"
		+ " uno.":
			"그녀의 변호사는 협상하지 않아요. 서류 두 장을 테이블에 올려놓고 하나에 서명하래요.",
		"No hay tercera opción, y él lo sabe desde el día que os conocisteis.":
			"세 번째 선택지는 없어요. 그녀를 만난 날부터 그는 알고 있었어요.",
		"No hay tercera opción.":
			"세 번째 선택지는 없어요.",
		"Se fue con una maleta y dejó el resto. Su abogado llamará el lunes.": "그녀는 여행 가방 하나만 들고 나머지는 두고 떠났어요. 변호사가 월요일에 연락할 거예요.",
		"Todavía estáis casados. Eso se firma, no se dice.": "아직은 부부예요. 그건 말이 아니라 서명으로 끝나요.",
		"La separación de bienes que firmasteis recorta las dos.": "서명해 둔 혼전 계약서가 둘 다 줄여 줘요.",
		"PAGAR Y QUEDÁRTELA · ${0}": "돈 내고 지키기 · ${0}",
		"Pagaste por tu propia casa. El papel valió justo eso.": "내 집을 내 돈 주고 산 셈이에요. 계약서의 가치는 딱 그만큼이었어요.",
		"${0}, y las llaves siguen siendo tuyas.": "${0}. 그리고 열쇠는 여전히 당신 거예요.",
		"Firmaste el otro. Cinco años pagando lo que ya no está en tu cuenta.": "다른 쪽에 서명했어요. 이제 통장에 없는 돈을 5년 동안 갚아요.",
		"Con ella no hay reparto que negociar: su abogado te hará elegir entre la casa y cinco temporadas de tu ficha.": "그녀와는 협상할 분할이 없어요. 그녀의 변호사가 집과 5시즌 치 주급 중 하나를 고르게 할 거예요.",
		"Eliges tú, y se elige esta semana.": "고르는 건 당신이고, 이번 주 안에 정해야 해요.",
		"SU ABOGADO YA LLAMÓ": "그녀 변호사의 전화",
		"LA CASA · ${0}":
			"집 · ${0}",
				"{0} DE TU FICHA · ${1} POR PARTIDO · {2} TEMPORADAS":
			"주급의 {0} · 경기당 ${1} · {2}시즌",
		"Con ella este papel es una acusación.":
			"그녀에게 이 서류는 고발장이에요.",
		"A ella el dinero le da igual.":
			"그녀는 돈에 관심이 없어요.",
		"LA CASA":
			"집",
		"EL {0}% DE TU FICHA · {1} TEMPORADAS":
			"주급의 {0}% · {1}시즌",
		"La casa que tienes vale ${0}. La ficha, ${1} por partido.":
			"집의 가치는 ${0}. 주급은 경기당 ${1}.",
		"Recogiste en dos cajas. La vitrina se quedó donde estaba.":
			"상자 두 개에 짐을 쌌어요. 트로피 진열장은 그 자리에 남았어요.",
		"La casa es suya, y todo lo que le metiste dentro.":
			"집은 그녀 것이에요. 당신이 채워 넣은 것까지 전부.",
		"Firmaste el otro. Cinco años de que cada partido rinda la mitad.":
			"다른 쪽에 서명했어요. 5년 동안 모든 경기 수입이 반토막이에요.",
		"${0} por partido, y sube si tú subes.":
			"경기당 ${0}. 당신이 오르면 같이 올라요.",
		"A ella el dinero le da igual: firmar apenas le va a doler.":
			"그녀는 돈에 관심이 없어요. 서명해도 거의 아프지 않을 거예요.",
		"Con ella este papel es una acusación. Y es de quien más te protege.":
			"그녀에게 이 서류는 고발장이에요. 그리고 이 서류가 가장 지켜 주는 상대가 바로 그녀예요.",
		"Le va a doler más de lo que va a decir.":
			"그녀는 말하는 것보다 더 아플 거예요.",

		"Va a vibrar tres veces. Contestar es perderla a ella.":
			"휴대폰이 세 번 울릴 거예요. 받으면 그녀를 잃어요.",
		"Aguantados sin mirar: {0} de {1}":
			"안 보고 버틴 횟수: {1}번 중 {0}번",
		"Ella se calla y espera a que termines. Se le fue lo que iba a decir.":
			"그녀는 입을 다물고 당신이 끝내길 기다려요. 하려던 말은 사라졌어요.",
		"No te contó nada. Estabas en otra cosa.":
			"그녀는 아무 말도 하지 않았어요. 당신은 딴생각 중이었어요.",
		"CONTESTAR":
			"받기",
		"GUARDAR EL TELÉFONO":
			"휴대폰 넣기",
		"PEDÍRSELO":
			"청혼하기",
		"Lleváis dos temporadas viviendo juntos y el anillo está"
		+ " pagado desde hace un mes. Tu agente quiere hablar contigo"
		+ " antes de que se lo pidas.":
			"함께 산 지 두 시즌이 됐고, 반지는 한 달 전에 결제했어요. 청혼하기 전에 에이전트가 할 얘기가 있대요.",
		"HABLAR CON ÉL":
			"들어 보기",
		"¿LOS TIRAS TÚ?":
			"네가 찰래?",
		"{0} ha fallado dos penales este año y en el vestuario nadie dice nada. Llevas el brazalete: el siguiente lo decides tú.":
			"{0} 선수가 올해 PK를 두 번 실축했는데, 라커룸에선 아무도 말이 없어요. 주장 완장은 당신 팔에 있어요. 다음 키커는 당신이 정해요.",
		"LOS COBRO YO":
			"내가 찬다",
		"SIGUE ÉL":
			"계속 맡긴다",
		"EL PUESTO QUE QUERÍAS":
			"원하던 포지션",
		"Tres años seguidos siendo el goleador del equipo desde donde no querías jugar. El técnico te para en el pasillo: el {0} es tuyo si lo quieres.":
			"원치 않던 자리에서 3년 연속 팀 득점왕. 감독이 복도에서 당신을 멈춰 세워요. 원한다면 {0} 자리는 네 거라고.",
		"ES MÍO":
			"내 자리다",
		"ME QUEDO DONDE ESTOY":
			"지금 자리에 남는다",
		"EL RIVAL DE LA DÉCADA":
			"10년의 라이벌",
		"SE LLEVA TU LIGA OTRA VEZ":
			"또 리그 우승을 빼앗기다",
		"LIGAS SEGUIDAS DE ELLOS":
			"그들의 리그 연속 우승",
		"sus ligas":
			"그들의 리그 우승",
		"las tuyas":
			"내 우승",
		"sus goles contra ti":
			"그가 내게 넣은 골",
		"Tres años viéndolos levantar la liga que querías. No abre la boca: la cifra habla por él, y dice que el año que viene vuelve.":
			"당신이 원하던 리그 트로피를 그들이 드는 걸 3년째 지켜봤어요. 그는 입도 열지 않아요. 숫자가 대신 말하죠. 내년에도 돌아온다고.",
		"EL SELECCIONADOR SE ACUERDA":
			"대표팀 감독이 기억하다",
		"TU PRIMERA CONVOCATORIA, TARDE":
			"늦게 온 첫 소집",
		"TEMPORADAS SIN LLAMARTE":
			"부름 없던 시즌",
		"goles de liga":
			"리그 골",
		"años sin llamada":
			"부름 없던 해",
		"edad":
			"나이",
		"Dos temporadas de goleador en primera y el teléfono sin sonar. Hoy viene en persona: no pide perdón, pero te mira a los ojos.":
			"1부 리그 득점왕으로 두 시즌을 보냈는데도 전화는 울리지 않았어요. 오늘 그가 직접 왔어요. 사과는 없지만, 당신 눈을 똑바로 봐요.",
		"EL PRESIDENTE TE PIDE QUEDARTE":
			"구단주가 남아 달라고 하다",
		"HAN PAGADO TU CLÁUSULA":
			"바이아웃이 지불됐다",
		"TEMPORADAS EN EL CLUB":
			"클럽에서 보낸 시즌",
		"la cláusula":
			"바이아웃",
		"balones de oro":
			"올해의 선수 수상",
		"Baja al césped sin prensa ni cámaras. No puede retener a quien paga la cláusula, y lo sabe: sólo viene a pedírtelo. La oferta sigue en MERCADO.":
			"기자도 카메라도 없이 그가 그라운드로 내려와요. 바이아웃을 낸 팀에게서 선수를 붙잡을 수 없다는 걸 그도 알아요. 그저 부탁하러 왔을 뿐이에요. 제안은 아직 이적 시장에 있어요.",
		"OTRO AÑO":
			"1년 더",
		"SU ABOGADO HA LLAMADO":
			"그녀 변호사의 전화",
		"No fue una discusión ni una noche mala: fue una carta. {0}"
		+ " quiere el divorcio, y su abogado ya ha puesto una cifra"
		+ " encima de la mesa.":
			"말다툼도, 나쁜 밤도 아니었어요. 편지 한 통이었어요. {0} 씨가 이혼을 원하고, 그녀의 변호사가 이미 금액을 테이블에 올려놨어요.",
		"VER LA CIFRA":
			"금액 보기",
		"NO ABRIR ESA CARTA":
			"편지 열지 않기",




		"Deja el teléfono boca abajo y escúchala.":
			"휴대폰을 뒤집어 놓고 그녀 말을 들어요.",
		"Si vibra, no pasa nada. Es no tocarlo.":
			"울려도 괜찮아요. 건드리지만 않으면 돼요.",
		"Avisos ignorados: {0} de {1}":
			"무시한 알림: {1}개 중 {0}개",
		"Ella se calla y espera a que termines.":
			"그녀는 입을 다물고 당신이 끝내길 기다려요.",
		"No miraste el teléfono ni una vez. Ella lo notó.":
			"휴대폰을 한 번도 보지 않았어요. 그녀도 알아챘어요.",
		"Contestaste alguna. La noche se salvó a medias.":
			"몇 개는 받았어요. 그날 밤은 반쯤 살렸어요.",
		"Contestaste todas. Pidió la cuenta antes del postre.":
			"전부 받았어요. 그녀는 디저트 전에 계산서를 달라고 했어요.",
		"Pregunta {0} de {1}":
			"질문 {1}개 중 {0}번째",
		"Te acordabas de todo. No se lo esperaba.":
			"전부 기억하고 있었어요. 그녀는 예상 못 했어요.",
		"Casi todo. Se rió del que fallaste.":
			"거의 다요. 틀린 하나에 그녀가 웃었어요.",
		"Uno de tres. «¿Me estabas escuchando?»":
			"셋 중 하나. «내 말 듣고 있긴 했어?»",
		"Ni uno. Esa noche no la escuchaste.":
			"하나도 못 맞혔어요. 그날 밤 그녀 말을 듣지 않았어요.",
		"Aciertos: {0} de {1}":
			"정답: {1}개 중 {0}개",
		"Ronda {0} de {1}":
			"라운드 {0}/{1}",
		"DECIRLO AHORA":
			"지금 말하기",
		"Dijiste lo justo y cuando tocaba. Te presentó a los suyos.":
			"딱 필요한 말을, 딱 맞는 순간에 했어요. 그녀가 친구들에게 당신을 소개했어요.",
		"Alguna la acertaste. Al salir te tomó del brazo.":
			"몇 번은 맞혔어요. 나가는 길에 그녀가 팔짱을 꼈어요.",
		"Hablaste siempre a destiempo. Salisteis pronto.":
			"매번 엉뚱한 순간에 말했어요. 일찍 자리를 떴어요.",
		"Quiere el {0} de tu sueldo, todos los meses.":
			"그녀가 원하는 건 매달 주급의 {0}.",
		"Serían ${0} por partido.":
			"경기당 ${0}에 해당해요.",
		"NO OFRECERLE NADA":
			"아무것도 제안하지 않기",
		"OFRECERLE LA MITAD":
			"절반 제안하기",
		"OFRECERLE CASI TODO":
			"거의 전부 제안하기",
		"DARLE LO QUE PIDE":
			"요구대로 주기",
		"«¿{0}? No me hagas esto.» Baja al {1}.":
			"«{0}? 나한테 이러지 마.» 그녀가 {1}까지 낮춰요.",
		"Trato hecho: el {0} de tu sueldo, cada partido.":
			"합의 완료: 매 경기 주급의 {0}.",
		"Sube tu mantenimiento en ${0} por partido.":
			"경기당 유지비가 ${0} 늘어요.",
		"Se levantó de la mesa sin acabar la frase.":
			"그녀는 말을 끝내지도 않고 자리에서 일어났어요.",
		"Esto no queda así.":
			"이대로 끝나지 않아.",
		"Creció en un pueblo de la costa":
			"바닷가 마을에서 자랐어요",
		"Creció en un barrio del norte":
			"북쪽 동네에서 자랐어요",
		"Se crió en el campo, lejos de todo":
			"모든 것과 멀리 떨어진 시골에서 자랐어요",
		"Es de una ciudad de montaña":
			"산골 도시 출신이에요",
		"Cambió de casa cada dos años":
			"2년마다 이사를 다녔어요",
		"Nunca ha salido de esta ciudad":
			"이 도시를 떠나 본 적이 없어요",
		"Vivió un tiempo en el extranjero":
			"한동안 해외에서 살았어요",
		"Es del mismo barrio que tú":
			"당신과 같은 동네 출신이에요",
		"No soporta que le hablen de fútbol":
			"축구 얘기를 들으면 질색해요",
		"No soporta la gente que llega tarde":
			"늦게 오는 사람을 못 참아요",
		"No soporta las fotos sin avisar":
			"예고 없이 찍는 사진을 못 참아요",
		"No soporta el ruido de los sitios de moda":
			"핫플레이스의 소음을 못 참아요",
		"No soporta que le mientan por educación":
			"예의상 하는 거짓말을 못 참아요",
		"No soporta madrugar":
			"아침 일찍 일어나는 걸 못 참아요",
		"No soporta que le pidan permiso para todo":
			"뭐든 허락받으려는 걸 못 참아요",
		"No soporta el mar":
			"바다를 못 견뎌요",
		"Pidió pescado y no se lo acabó":
			"생선을 시키고 다 먹지 않았어요",
		"Pidió lo mismo que tú":
			"당신과 같은 걸 시켰어요",
		"Pidió sólo postre":
			"디저트만 시켰어요",
		"Pidió el plato más raro de la carta":
			"메뉴에서 제일 특이한 걸 시켰어요",
		"No pidió nada, dijo que no tenía hambre":
			"아무것도 안 시켰어요. 배가 안 고프대요",
		"Pidió carne muy hecha":
			"고기를 바싹 익혀 달라고 했어요",
		"Pidió que eligieras tú":
			"당신더러 골라 달라고 했어요",
		"Pidió la sopa del día":
			"오늘의 수프를 시켰어요",
		"Ella habla con gente que no conoces. Espera el hueco.":
			"그녀는 당신이 모르는 사람들과 얘기 중이에요. 틈을 기다려요.",
		"Alguien pregunta a qué te dedicas. No es el momento de"
		+ " decirlo.":
			"누군가 당신 직업을 물어요. 지금은 말할 때가 아니에요.",
		"Se gira hacia ti. Ahora sí.":
			"그녀가 당신 쪽으로 돌아봐요. 지금이에요.",
		"¿De dónde te dijo que era?":
			"그녀가 어디 출신이라고 했죠?",
		"¿Qué te dijo que no soporta?":
			"그녀가 뭘 못 참는다고 했죠?",
		"¿Qué pidió aquella noche?":
			"그날 밤 그녀가 뭘 시켰죠?",
		"LA PRIMERA CENA":
			"첫 저녁 식사",
		"Mesa para dos y el teléfono boca abajo. Esta noche va de"
		+ " escucharla — y de que no te pillen mirando la pantalla.":
			"2인용 테이블, 휴대폰은 뒤집어 두고. 오늘 밤은 그녀 말을 듣는 자리예요. 그리고 화면 보다 들키지 않는 자리.",
		"ESTA SEMANA NO":
			"이번 주는 안 돼",
		"LO QUE TE CONTÓ":
			"그녀가 해 준 얘기",
		"Una copa y la conversación de la otra noche encima de la"
		+ " mesa. Vas a tener que acordarte de lo que te dijo.":
			"술 한잔, 그리고 지난밤 대화가 다시 테이블 위에. 그녀가 한 말을 기억해 내야 해요.",
		"LA INAUGURACIÓN DE ELLA":
			"그녀의 오프닝 파티",
		"Te lleva a una exposición donde no conoces a nadie. Aquí no"
		+ " se trata de entender los cuadros: se trata de saber cuándo"
		+ " hablar.":
			"그녀가 아는 사람 하나 없는 전시회에 데려가요. 그림을 이해하는 게 문제가 아니에요. 언제 말할지 아는 게 문제예요.",
		"HABLEMOS DE DINERO":
			"돈 얘기 좀 해",
		"{0} ha esperado a que acabe la cena para decirlo, y lo dice"
		+ " sin rodeos: quiere una cantidad fija todos los meses, o esto"
		+ " no tiene sentido.":
			"{0} 씨는 저녁 식사가 끝날 때까지 기다렸다가 돌려 말하지 않아요. 매달 정해진 금액을 원한대요. 아니면 이 관계는 의미가 없대요.",
		"HABLARLO":
			"얘기해 보기",
		"NO PIENSO DISCUTIR ESO":
			"그 얘긴 안 해",


		"PRÓRROGA": "연장 휴식",
		"DESCANSO · FINAL": "하프타임 · 결승",
		"DESCANSO · DERBI": "하프타임 · 더비",
		"SEGUNDO TIEMPO EXTRA": "연장 후반",
		"SI NADIE MARCA, PENALTIS": "무득점이면 승부차기",
		"QUINCE MINUTOS PARA AGUANTAR": "15분만 버텨라",
		"QUINCE MINUTOS PARA REMONTAR": "15분 안에 뒤집어라",
		"SI ACABA ASÍ: PRÓRROGA": "이대로면: 연장전",
		"SI ACABA ASÍ: CAMPEONES": "이대로면: 우승",
		"SI ACABA ASÍ: SUBCAMPEONES": "이대로면: 준우승",
		"SI ACABA ASÍ: PASÁIS": "이대로면: 진출",
		"SI ACABA ASÍ: FUERA": "이대로면: 탈락",
		"GLOBAL {0}-{1} · PRÓRROGA": "합계 {0}-{1} · 연장전",
		"GLOBAL {0}-{1} · PASÁIS": "합계 {0}-{1} · 진출",
		"GLOBAL {0}-{1} · FUERA": "합계 {0}-{1} · 탈락",
		"10 CONTRA 11": "10 대 11",
		"11 CONTRA 10": "11 대 10",
		"LÍDER": "선두",
		"EN ASCENSO": "승격권",
		"EN DESCENSO": "강등권",
		"IGUALADO CON EL LÍDER": "선두와 동점",
		"IGUALADO CON EL ASCENSO": "승격권과 동점",
		"IGUALADO CON EL DESCENSO": "강등권과 동점",
		"A {0} PTS DEL LÍDER": "선두와 {0}점 차",
		"A {0} PTS DEL ASCENSO": "승격권과 {0}점 차",
		"A {0} PTS DEL DESCENSO": "강등권과 {0}점 차",
		"ÚLTIMA JORNADA": "최종 라운드",
		"El míster se ha ido a por {0} delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"감독이 라커룸 전원 앞에서 {0} 선수를 몰아세웠어요. 아무도 바닥에서 눈을 떼지 못해요. 당신은 그 옆에 앉아 있어요.",
		"Lo has dicho delante de todos. El míster no lo olvidará, y {0} tampoco.":
			"모두 앞에서 말했어요. 감독은 잊지 않을 거예요. {0} 선수도요.",
		"Te has callado. {0} se ha dado cuenta.": "입을 다물었어요. {0} 선수가 눈치챘어요.",
		"{0}, nos has dejado con diez. Hoy no me hables.": "{0}, 너 때문에 10명으로 뛰잖아. 오늘은 말 걸지 마.",
		"{0}, {1} goles. ¿Vas a parar alguno en la segunda?":
			"{0}, {1}골이나 먹었어. 후반엔 하나라도 막을 거야?",
		"LA HA TOMADO CON ÉL": "그 녀석만 찍혔다",
		"El míster se ha ido a por un compañero delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"감독이 라커룸 전원 앞에서 동료 하나를 몰아세웠어요. 아무도 바닥에서 눈을 떼지 못해요. 당신은 그 옆에 앉아 있어요.",
		"DAR LA CARA POR ÉL": "그를 감싸기",
		"QUEDARTE CALLADO": "가만히 있기",

		"PREGUNTA DE VESTUARIO": "라커룸 퀴즈",
		"En el banco, alguien saca el móvil y lanza una pregunta a todo el vestuario.": "벤치에서 누가 휴대폰을 꺼내 라커룸 전체에 퀴즈를 내요.",
		"¿De dónde llegó {0} a {1}?": "{0} 선수는 어디에서 {1} 클럽으로 왔을까?",
		"ACIERTA Y SUMAS +{0} DE ENERGÍA AL PITIDO": "맞히면 종료 휘슬 때 에너지 +{0}",
		"¡Exacto! Llegó de {0}. +{1} de energía al pitido.": "정답! {0}에서 왔어요. 종료 휘슬 때 에너지 +{1}.",
		"No. Llegó de {0}.": "땡. {0}에서 왔어요.",
		"Esto no es lo que somos. Tú tira del carro y los demás irán detrás.":
			"이건 우리 모습이 아니야. 네가 앞에서 끌어. 나머지는 따라올 거다.",
		"Nos hemos salido del plan. Volved a lo de siempre y el resto llegará.":
			"계획에서 벗어났어. 하던 대로 돌아가면 나머지는 따라온다.",
		"Me dais vergüenza. A todos. Esa camiseta no se regala así.":
			"창피하다. 전부 다. 그 유니폼은 그렇게 거저 주는 게 아니야.",
		"Ya está. Que por lo menos no sea peor.": "끝났다. 적어도 더 나빠지게는 하지 마.",
		"Tú no eres éste. Te conozco: sal y demuéstramelo.":
			"이건 네가 아니야. 난 널 알아. 나가서 보여 줘.",
		"Haz lo sencillo. Lo que te ha traído hasta aquí, nada más.":
			"단순하게 해. 널 여기까지 데려온 것만. 그 이상은 필요 없어.",
		"Así no. Si en diez minutos sigues igual, te cambio.":
			"그렇게 하면 안 돼. 10분 뒤에도 똑같으면 교체다.",
		"Lo que esperaba de ti. Ni más ni menos.": "기대한 만큼이다. 그 이상도 이하도 아니야.",
		"Un gol no es nada. Dádsela a él, que sabe qué hacer con ella.":
			"한 골은 아무것도 아니야. 저 녀석한테 줘. 어떻게 할지 아는 녀석이니까.",
		"Vamos bien aunque no lo parezca. Mismo plan, y el gol llegará.":
			"보기보다 잘하고 있어. 계획대로 가면 골은 온다.",
		"Uno abajo y nadie se ha manchado la camiseta. Quiero verlo en la segunda.":
			"한 골 지고 있는데 유니폼 더럽힌 놈이 하나도 없어. 후반엔 보여 줘.",
		"Un gol abajo. Haré cambios.": "한 골 지고 있다. 교체 들어간다.",
		"Cero a cero. La próxima que tengas, adentro. Confío en ti.":
			"0-0. 다음 찬스는 꽂아 넣어. 널 믿는다.",
		"Cero a cero, como estaba pensado. Paciencia, que el gol viene solo.":
			"0-0, 계획대로다. 인내해. 골은 알아서 온다.",
		"Cero a cero y nadie ha probado al portero. Eso se acabó.":
			"0-0인데 키퍼를 시험한 놈이 없어. 이제 그만.",
		"Cero a cero. Seguid así y ya veremos.": "0-0. 계속 이렇게 가 보자.",
		"Empate. Marca tú la diferencia, que para eso te traje.":
			"동점. 네가 차이를 만들어. 그러라고 데려온 거야.",
		"Empate. No cambiéis nada: si seguimos así, el partido es nuestro.":
			"동점. 아무것도 바꾸지 마. 이대로 가면 우리 경기다.",
		"Un empate no me vale. Quiero más de todos, y de ti el primero.":
			"무승부론 안 돼. 모두 더 해. 너부터.",
		"Empate. Algo tocaremos.": "동점. 좀 손보겠다.",
		"Bien. Seguid buscándole, que el segundo lo lleva en las botas.":
			"좋아. 계속 저 녀석을 찾아. 두 번째 골이 발끝에 있어.",
		"Ganamos haciendo lo nuestro. Seguid igual.": "우리 방식대로 이기고 있다. 그대로 가.",
		"Uno a cero no es nada. No quiero ver ni un paso atrás.":
			"1-0은 아무것도 아니야. 한 발짝도 물러서지 마.",
		"Ganamos. No toquéis nada.": "이기고 있다. 아무것도 건드리지 마.",
		"Esto es lo que sois. Disfrutadlo, pero sin regalar nada.":
			"이게 너희 실력이다. 즐겨. 하지만 아무것도 내주지 마.",
		"El plan funciona. Cuarenta y cinco minutos más de lo mismo.":
			"계획이 먹히고 있어. 45분 더 똑같이.",
		"Bien. Y ahora no quiero ver a nadie relajándose. A nadie.":
			"좋아. 이제 긴장 푸는 놈은 보고 싶지 않다. 단 한 명도.",
		"Está hecho. Aprovecharé para mover el banquillo.": "끝난 경기다. 벤치 멤버들 좀 뛰게 하겠다.",
		"{0} no vuelve. Los demás, a correr también por él.":
			"{0} 선수는 못 돌아온다. 나머지는 그 몫까지 뛰어.",
		"Nos lo han metido en el peor minuto. Olvidadlo ya, o nos come la segunda.":
			"최악의 타이밍에 먹혔어. 당장 잊어. 아니면 후반에 잡아먹힌다.",
		"Íbamos perdiendo y lo habéis levantado. Eso no os lo regala nadie.":
			"지고 있던 걸 뒤집었어. 그건 누가 거저 주는 게 아니야.",
		"Íbamos ganando y lo hemos regalado. Eso no vuelve a pasar.":
			"이기고 있다가 내줬어. 두 번은 없다.",
		"El gol en el mejor momento. Ahora están tocados: a por el siguiente.":
			"딱 좋은 타이밍의 골. 저쪽은 흔들렸어. 다음 골 가자.",
		"Con diez. Cada uno corre por dos, y sin una queja.":
			"10명이다. 각자 두 사람 몫을 뛰어. 불평은 없다.",
		"Tienen uno menos. Que lo noten sus piernas, no las nuestras.":
			"저쪽이 한 명 적어. 우리 다리 말고 저쪽 다리가 느끼게 해.",
		"Si llegamos a los penaltis, quiero once que se tengan en pie.":
			"승부차기까지 가면, 두 발로 서 있는 11명이 필요하다.",
		"Quince minutos. Aguantadlos como si fueran noventa.":
			"15분. 90분처럼 버텨.",
		"Quince minutos para darle la vuelta. Lo que os quede, ahí fuera.":
			"15분 안에 뒤집는다. 남은 힘 전부 저기서 쏟아.",
		"Así, prórroga. Y nadie quiere prórroga.": "이대로면 연장전이다. 아무도 원하지 않아.",
		"Ahora mismo pasamos. Que no se os note que lo sabéis.":
			"지금은 진출이야. 그걸 아는 티 내지 마.",
		"Ahora mismo estamos fuera. Cuarenta y cinco minutos para cambiarlo.":
			"지금은 탈락이야. 45분 안에 바꿔.",
		"Una final no se juega: se gana. El que se esconda, al banquillo.":
			"결승은 뛰는 게 아니라 이기는 거다. 숨는 놈은 벤치행.",
		"Cuarenta y cinco minutos entre vosotros y la copa. Ni uno menos.":
			"너희와 트로피 사이에 45분이 남았다. 1분도 빼지 마.",
		"Nadie se acuerda de los subcampeones. Nadie. Salid a por ella.":
			"준우승은 아무도 기억 안 해. 아무도. 나가서 가져와.",
		"¿Los oís? Pues que sea lo último que cantan hoy.": "들리냐? 오늘 저들이 부르는 마지막 노래로 만들어.",
		"Esto no es un partido más y lo sabéis. Hoy no se pierde.":
			"그냥 경기가 아닌 거 알지. 오늘은 지면 안 돼.",
		"Media ciudad está callada ahora mismo. Que siga así.":
			"지금 도시 절반이 조용해. 계속 그렇게 만들어.",
		"Así acabado, la tabla se nos pone cuesta arriba. Hay que darle la vuelta.":
			"이대로 끝나면 순위표가 험해진다. 뒤집어야 해.",
		"Un punto aquí no arregla nada. Quedan pocos partidos y éste es uno.":
			"여기서 승점 1은 아무것도 해결 못 해. 남은 경기 얼마 없고, 이게 그중 하나다.",
		"Si esto acaba así, la tabla se mueve a nuestro favor. No lo tiréis.":
			"이대로 끝나면 순위표가 우리 쪽으로 움직인다. 날리지 마.",


		"NO SALES": "교체다",
		"Le metiste un balonazo a tu propio banquillo. No hacía falta nada más.":
			"자기 팀 벤치에 공을 냅다 찼어. 그거면 충분했다.",
		"{0} ocasiones tiradas antes del descanso. Ya lo había decidido en la tercera.":
			"전반에만 찬스 {0}번을 날렸어. 세 번째에서 이미 결정했다.",
		"Cuarenta y cinco minutos y no te he visto. Hoy se acabó aquí.":
			"45분 동안 네가 안 보였어. 오늘은 여기까지다.",



		"VAS POR DELANTE": "앞서고 있어요",
		"VAS POR DETRÁS": "뒤지고 있어요",
		"TODO IGUAL": "동점",
		"SEGUNDA PARTE": "후반전",

		"No la tenías: en el túnel cuesta el triple.":
			"없었잖아요. 터널에선 세 배가 들어요.",
		"energía": "에너지",
		"tus minutos": "내 출전 시간",
		"Te están pasando por encima. Esto no se arregla solo en la segunda.":
			"완전히 밀리고 있어. 후반에 저절로 해결되지 않는다.",
		"Desde la banca también se juega. Cuando te toque, no preguntes.":
			"벤치에서도 경기는 뛰는 거다. 네 차례가 오면 묻지 말고 나가.",
		"A ti no te he visto. O apareces en la segunda, o te sientas.":
			"넌 안 보였어. 후반에 나타나든지, 아니면 앉아.",
		"Vas fundido. Piensa bien dónde gastas lo que te queda.":
			"완전히 지쳤어. 남은 힘을 어디에 쓸지 잘 생각해.",
		"Un gol. Sólo eso os separa, y quedan cuarenta y cinco minutos.":
			"한 골. 그 차이뿐이고, 45분 남았다.",
		"Cero a cero. Esto lo gana el primero que acierte.":
			"0-0. 먼저 해내는 쪽이 이긴다.",
		"Empate. El que se canse primero, pierde.": "동점. 먼저 지치는 쪽이 진다.",
		"Un gol no es nada. Salid como si fuerais perdiendo.":
			"한 골 리드는 아무것도 아니야. 지고 있는 것처럼 나가.",
		"Bien. Ahora lo difícil: no regalar lo que ya es vuestro.":
			"좋아. 이제 어려운 부분이다. 이미 가진 걸 내주지 마.",

		"EL BALÓN ES TUYO": "공은 네 거야",
		"EL BALÓN ES DE LOS DOS": "둘이 나눠 갖는 공",
		"UN BALÓN PARA CADA UNO": "하나씩 가져",
		"PASES TUYOS, GOLES DE {0}": "내 패스, {0}의 골",
		"GOLES ENTRE LOS DOS": "둘이 합작한 골",
		"Te lo dio a ti. Sabe de dónde salieron.": "당신 거예요. 그 골이 어디서 나왔는지 그도 알아요.",
		"{0} tuyos, {1} suyos. Cada uno con el suyo.": "당신 {0}골, 그 {1}골. 각자 자기 공을 챙겨요.",
		"DOS HAT-TRICKS": "해트트릭 두 개",
		"GOLES EN UN PARTIDO": "한 경기 골",
		"Firmado por todos. Ya sabes dónde va.": "선수단 전원의 사인. 어디에 둘지 알죠?",
		"INTERCAMBIO": "유니폼 교환",
		"SU CAMISETA": "그의 유니폼",
		"La suya se queda contigo. La tuya se va con él.": "그의 유니폼은 당신이 갖고, 당신 유니폼은 그가 가져가요.",
		"TE PIDE LA CAMISETA": "유니폼을 달래요",
		"{0} te espera en el círculo con la suya ya enrollada en la mano. La grada todavía no se va, y desde arriba se ve todo.": "{0} 선수가 센터서클에서 자기 유니폼을 손에 말아 쥔 채 기다려요. 관중석은 아직 비지 않았고, 위에서는 다 보여요.",
		"CAMBIARLA": "교환하기",
		"DÁRSELA SIN PEDIR NADA": "그냥 주기",
		"NO SE CAMBIA": "안 바꿔",
		"BALONES": "공",
		"PLAYERAS": "유니폼",
		"VITRINA DE BALONES": "공 진열장",






		"VITRINA TORRE": "타워 진열장",
		"VITRINA GALERÍA": "갤러리 진열장",
		"VITRINA DE PREMIOS": "개인상 진열장",
		"Tres baldas en un metro: para el rincón que no da más.":
			"1미터에 선반 세 개. 더는 들어갈 데 없는 구석용이에요.",
		"Cuatro metros de mostrador para alinear el palmarés.":
			"우승 기록을 늘어놓을 4미터짜리 진열대.",
		"Solo para lo tuyo: los galardones individuales.":
			"오직 당신 것만: 개인상 트로피.",
		"Sólo para lo tuyo: los galardones individuales.":
			"오직 당신 것만: 개인상 트로피.",
		"Cada balón, con el día y el rival al que se lo metiste.": "공마다 그날 날짜와 골을 넣은 상대 팀이 적혀 있어요.",
		"Los balones de tus hat-tricks y las camisetas que cambiaste.": "해트트릭 기념구와 교환한 유니폼들.",
		"CAMBIO EN EL BANQUILLO": "새 감독 부임",
		"EL NUEVO": "새 감독",
		"TÉCNICO NUEVO": "새 감독",
		"Destituyen a {0}. {1}": "{0} 감독 경질. {1}",
		"TE QUERÍA A TI": "당신을 원했어요",
		"Pidió tu nombre antes de firmar. Vienes de serie en su plan.": "계약 전에 당신 이름을 콕 집어 요청했어요. 당신은 그의 계획에 기본으로 들어 있어요.",
		"NO TOCA LO QUE FUNCIONA": "잘되면 안 바꾼다",
		"Ha visto los vídeos y no piensa cambiar lo que ya andaba.": "영상을 다 봤고, 이미 잘 돌아가던 건 바꿀 생각이 없대요.",
		"EMPEZAMOS DE CERO": "모두 원점에서",
		"No te conoce de nada. Todo el mundo parte del mismo sitio.": "당신을 전혀 몰라요. 모두가 같은 출발선에 서요.",
		"TE LO VAS A GANAR": "자리는 실력으로",
		"Dice que aquí no hay intocables, y te mira a ti al decirlo.": "여기에 건드릴 수 없는 선수는 없다고 하면서, 당신을 쳐다봐요.",
		"NO CUENTA CONTIGO": "계획에 없음",
		"Tiene otro plan, y en su pizarra tu nombre no aparece.": "다른 구상이 있고, 그의 작전판에 당신 이름은 없어요.",

		"TÉCNICOS": "감독",
		"RANKING DE TÉCNICOS": "감독 랭킹",
		"Los técnicos del mundo, ordenados por sus estrellas.": "전 세계 감독을 별점 순으로 정리했어요.",
		"Los trofeos cuentan desde la temporada {0}.": "트로피는 {0} 시즌부터 집계돼요.",
		"1ª DIVISIÓN": "1부 리그",
		"EN EL PARO": "무직",
		"Nadie en esta lista todavía. Los que echan de su club pasan aquí hasta que otro los ficha.": "아직 아무도 없어요. 클럽에서 경질된 감독은 다른 클럽이 데려갈 때까지 여기 있어요.",
		"TU TÉCNICO: {0}° DE {1}": "내 감독: {1}명 중 {0}위",
		"En el cargo desde la temporada {0}.": "{0} 시즌부터 지휘 중.",
		"Sin títulos todavía.": "아직 우승 없음.",

		"MÍSTER": "감독",
		"2ª DIVISIÓN": "2부 리그",
		"técnico": "감독",
		"técnicos": "감독",
		"técnico sin equipo": "무직 감독",
		"técnicos sin equipo": "무직 감독",
		"seleccionador": "대표팀 감독",
		"seleccionadores": "대표팀 감독",

		"cara de leyenda": "레전드 얼굴",
		"caras de leyenda": "레전드 얼굴",
		"Palmarés real, más lo que ganen desde la temporada {0}.": "실제 우승 기록에, {0} 시즌부터 따낸 우승을 더해요.",
		"{0} destituye a {1}. Llega {2}.": "{0}, {1} 감독 경질. 후임은 {2}.",

		"BALÓN AL ÁREA": "롱볼",
		"No quiere elaborar: quiere el balón arriba y gente rematando.": "빌드업은 필요 없대요. 공은 전방으로, 박스엔 사람을 채워요.",
		"TOQUE Y PACIENCIA": "인내의 빌드업",
		"Prefiere diez pases a un balonazo. Aquí se juega con la cabeza.": "롱볼 한 번보다 패스 열 번. 여기선 머리로 축구해요.",
		"PRESIÓN ALTA": "전방 압박",
		"Noventa minutos corriendo. El que no llega, descansa.": "90분 내내 뛰어요. 못 따라오면 벤치예요.",
		"OFICIO": "노련함",
		"Once fijo y partido controlado. Aquí mandan los que ya saben.": "고정된 베스트 11, 통제된 경기. 여기선 아는 사람들이 판을 짜요.",
		"DOBLE PIVOTE": "더블 볼란치",
		"Dos que barren, uno que piensa y uno arriba. Primero, no perder.": "둘은 쓸고, 하나는 생각하고, 하나는 최전방. 우선 지지 않는 것.",
		"ATAQUE TOTAL": "닥공",
		"Tres atrás y tres arriba. Si nos meten dos, metemos tres.": "스리백에 스리톱. 두 골 먹으면 세 골 넣어요.",
		"AUTOBÚS": "버스 세우기",
		"Cinco atrás y a la contra. Un 1-0 es una goleada.": "파이브백에 역습. 1-0이면 대승이에요.",
		"PIZARRA": "작전판",
		"El {0} ya juega el {1} de {2}": "{0}, 이제 {2}의 {1} 가동",

		"ESPECIALISTA A BALÓN PARADO": "세트피스 전문가",
		"Ensaya el balón parado: si eres el lanzador, te llegan muchas más faltas, córners y penales.": "세트피스를 훈련해요. 당신이 키커라면 프리킥, 코너킥, PK가 훨씬 많아져요.",
		"EL CÓRNER ES UN PENAL": "코너킥은 PK다",
		"Ensaya el córner: si eres el lanzador, sacas casi el doble de córners y tiras menos faltas.": "코너킥을 훈련해요. 당신이 키커라면 코너킥이 거의 두 배가 되고 프리킥은 줄어요.",
		"CONTRAGOLPE": "역습",
		"Cede el balón y sale a la carrera: más contras y menos posesión.": "공을 내주고 달려요. 역습은 늘고 점유율은 줄어요.",
		"AL ÁREA, SIEMPRE": "무조건 박스로",
		"Todo por las bandas: llueven centros al área y hay menos disparos desde fuera.": "전부 측면으로. 박스 안에 크로스가 쏟아지고 중거리 슈팅은 줄어요.",
		"JUEGO DE ESPACIOS": "공간 활용",
		"Busca el pase al hueco: más mano a mano con el portero.": "침투 패스를 노려요. 골키퍼와 일대일 상황이 늘어요.",
		"PEGA DESDE FUERA": "중거리 슈팅",
		"Pide el disparo desde fuera del área: más tiros lejanos.": "박스 밖 슈팅을 주문해요. 중거리 슈팅이 늘어요.",
		"CERROJO": "빗장 수비",
		"Con ventaja cierra el partido: el rival casi no remonta desde el 75'.": "앞서면 문을 걸어 잠가요. 75분 이후 상대가 뒤집는 일이 거의 없어요.",
		"FERGIE TIME": "퍼기 타임",
		"Sus equipos no se rinden: más goles propios en el descuento.": "그의 팀은 포기하지 않아요. 추가 시간에 우리 팀 골이 늘어요.",
		"EL ÁREA ES UN CAMPO DE MINAS": "박스는 지뢰밭",
		"Juega por dentro y lo derriban: el doble de penales a favor.": "중앙을 파고들다 걸려 넘어져요. 우리 팀 PK가 두 배.",
		"CONFÍA EN EL CHAVAL": "유망주를 믿는다",
		"Apuesta por los jóvenes: hasta los 23 juegas más y antes eres titular.": "어린 선수를 밀어줘요. 23살까지 출전이 늘고 더 빨리 선발이 돼요.",
		"EL BALÓN ES NUESTRO": "공은 우리 것",
		"Con el balón el rival no llega: encaja menos, pero el partido va más lento.": "공을 쥐고 있으면 상대가 못 와요. 실점은 줄지만 경기가 느려져요.",
		"SALE A MORDER": "물어뜯는 출발",
		"Empieza a mil: la primera media hora es de tu equipo, ida y vuelta.": "처음부터 전력 질주. 첫 30분은 우리 팀 차지, 치고받는 경기.",
		"POCAS PERO CLARAS": "적지만 확실하게",
		"Menos ocasiones y mejores: llegan más cerca de la portería, y fallarlas cuesta el doble.": "찬스는 적지만 질이 좋아요. 골문 더 가까이에서 오지만, 놓치면 두 배로 아파요.",
		"HOMBRE DE DERBIS": "더비의 사나이",
		"Se crece en los derbis: más juego y una ocasión más contra el rival de siempre.": "더비에서 강해져요. 숙적 상대로 플레이가 늘고 찬스가 하나 더.",
		"CUIDA LAS PIERNAS": "다리를 아낀다",
		"Menos lesiones y mejor descanso, a cambio de rotarte más.": "부상은 줄고 회복은 좋아져요. 대신 로테이션이 늘어요.",
		"EL LOCO": "미치광이",
		"Ida y vuelta sin freno: más energía por partido y más lesiones.": "브레이크 없는 난타전. 경기당 에너지가 늘고 부상도 늘어요.",
		"NO TE FÍAS DEL CHAVAL": "어린 선수 불신",
		"No se fía de los jóvenes: hasta los 23 te cuesta más el puesto.": "어린 선수를 믿지 않아요. 23살까지는 자리 잡기가 더 어려워요.",
		"BRONCA POR TODO": "만사에 호통",
		"Bronca por todo: cada mal partido te pesa el doble con él.": "매사에 호통. 못 뛴 경기 하나하나가 두 배로 무거워요.",
		"CARRUSEL": "회전목마",
		"Rota sin parar: te sienta aunque llegues fresco.": "쉬지 않고 로테이션. 컨디션이 좋아도 벤치에 앉혀요.",
		"NO SUELTA UN DURO": "구두쇠",
		"Manda en los fichajes y no suelta un duro: las mejoras de contrato cuestan más.": "영입을 직접 쥐고 한 푼도 안 써요. 계약 인상이 더 비싸져요.",
		"ONCE DE LA SUERTE": "행운의 11인",
		"Si el once ganó, repite: para entrar hay que esperar a que pierda.": "이긴 베스트 11은 그대로. 들어가려면 질 때까지 기다려야 해요.",
		"VE ROJAS DONDE NO LAS HAY": "퇴장 제조기",
		"Sus equipos ven más rojas: jugarás con diez más veces.": "그의 팀은 퇴장이 잦아요. 10명으로 뛰는 일이 많아져요.",
		"FUERA DE CASA SE ENCOGE": "원정만 가면 위축",
		"Fuera de casa se encoge: el rival aprieta más en su campo.": "원정에서 위축돼요. 상대가 홈에서 더 몰아붙여요.",
		"SU OJITO DERECHO": "편애가 있다",
		"Tiene favoritos: hasta que te lo ganes, otro juega en tu sitio.": "아끼는 선수가 있어요. 마음을 얻기 전까진 다른 선수가 당신 자리에서 뛰어요.",
		"PARTIDOS LOCOS": "난타전",
		"Sus partidos son locos: goleadas en las dos porterías.": "그의 경기는 난장판. 양쪽 골문에 골이 쏟아져요.",
		"DESPIERTA AL DESCANSO": "하프타임에 깨어남",
		"Sale dormido: nada antes del 25', y el rival manda la primera parte.": "잠든 채 시작해요. 25분 전엔 아무것도 없고, 전반은 상대가 지배해요.",
		"ONCE DE HIERRO": "철의 베스트 11",
		"Casi no rota: repite el once mientras aguanten las piernas; el que no juega, espera.": "로테이션이 거의 없어요. 다리가 버티는 한 같은 11명. 못 뛰는 선수는 기다려요.",
		"LA CULPA ES TUYA": "네 탓이다",
		"Tras perder, la culpa es tuya: afición y prensa te lo cobran el doble.": "지면 당신 탓. 팬과 언론이 두 배로 따져요.",
		"REVOLUCIÓN": "혁명",
		"Llega y manda: lleva al equipo a su dibujo el doble de rápido.": "오자마자 장악해요. 팀이 그의 포메이션으로 두 배 빨리 바뀌어요.",
		"LO QUE FUNCIONA NO SE TOCA": "잘되는 건 안 건드린다",
		"Respeta lo heredado: tarda el doble en llevar al equipo a su dibujo.": "물려받은 걸 존중해요. 팀이 포메이션을 바꾸는 데 두 배 걸려요.",

		"RASGOS DEL MÍSTER": "감독 성향",
		"RASGOS": "성향",
		"RASGO BUENO": "좋은 성향",
		"RASGO MALO": "나쁜 성향",
		"Juega para un técnico con este rasgo para descubrirlo.": "이 성향을 가진 감독 밑에서 뛰면 알 수 있어요.",
		"Con la selección no se descubre: juega para un técnico de club con este rasgo.": "대표팀에선 알 수 없어요. 이 성향을 가진 클럽 감독 밑에서 뛰어요.",
		"Los rasgos de los técnicos para los que has jugado. Cada uno se descubre con el primer partido a sus órdenes.": "함께한 감독들의 성향이에요. 그 감독 밑에서 첫 경기를 뛰면 하나씩 드러나요.",
		"Sin rasgos conocidos.": "알려진 성향 없음.",
		"BUENOS": "장점",
		"MALOS": "단점",
		"Rasgo nuevo: {0}": "새 성향: {0}",



		"MOVER ESTO": "옮기기",
		"choca con {0}": "{0}에 부딪힘",
		"encima de {0}": "{0} 위",






		"GANAS LA TANDA": "승부차기 승리",
		"ELIMINADO EN PENALES": "승부차기 탈락",
		"La metió {0}. Los otros diez cruzaron medio campo para decírselo.":
			"{0} 선수가 꽂아 넣었어요. 나머지 열 명이 하프라인을 넘어 달려와 축하해요.",
		"La metiste tú. Los otros diez cruzaron medio campo para decírtelo.":
			"당신이 꽂아 넣었어요. 나머지 열 명이 하프라인을 넘어 달려와 축하해요.",
		"La sacó {0}. Los otros diez cruzaron medio campo para decírselo.":
			"{0} 선수가 막아냈어요. 나머지 열 명이 하프라인을 넘어 달려와 축하해요.",
		"La mandaron fuera. Los otros diez cruzaron medio campo igual.":
			"상대가 밖으로 날렸어요. 그래도 나머지 열 명이 하프라인을 넘어 달려왔어요.",
		"La metiste tú. Hasta el banquillo saltó al campo a por ti.":
			"당신이 넣었어요. 벤치 멤버들까지 그라운드로 뛰쳐나와 달려왔어요.",
		"La metió {0}. Hasta el banquillo saltó al campo a por él.":
			"{0} 선수가 넣었어요. 벤치 멤버들까지 그라운드로 뛰쳐나와 달려갔어요.",
		"La sacó {0}. Hasta el banquillo saltó al campo a por él.":
			"{0} 선수가 막아냈어요. 벤치 멤버들까지 그라운드로 뛰쳐나와 달려갔어요.",
		"La mandaron fuera. Hasta el banquillo saltó al campo.":
			"상대가 밖으로 날렸어요. 벤치 멤버들까지 그라운드로 뛰쳐나왔어요.",
		"La fiesta la dan ellos. A ti te quedan cuarenta metros hasta el túnel.":
			"축제는 저들의 것. 당신에겐 터널까지 40미터가 남았어요.",
		"Subcampeón": "준우승",

		"Campeón: {0}": "우승: {0}",
		"La fiesta estaba lista. La están dando ellos, en el sitio donde ibas a estar tú.":
			"축제 준비는 끝나 있었어요. 그런데 당신이 있어야 할 바로 그 자리에서 저들이 축하하고 있어요.",

		"ÁNGULO": "각도",

		"Presión alta": "전방 압박",
		"Bloque bajo": "내려앉은 수비",
		"Marcaje al hombre": "대인 마크",
		"Bloque alto paciente": "인내하는 하이 라인",


		"Equilibrado": "균형",

		"ÁRBITRO": "심판",
		"Tarjetero": "카드 남발",
		"Permisivo": "관대함",
		"Deja seguir": "어드밴티지 선호",
		"Pita todo": "휘슬 남발",

		"Encerrado en la banda": "측면에 갇힘",
		"El último hombre": "최후의 수비수",

		"Juega la {0}": "{0} 출전 중",

		"Su comisión baja del 8% al 3% en cada partido, y también en lo que"
		+ " cobras al firmar. Cara, pero cuanto antes la firmes, más te devuelve.":
			"에이전트 수수료가 모든 경기 수입과 계약금에서 8%에서 3%로 줄어요. 비싸지만, 빨리 서명할수록 더 많이 돌려받아요.",

		"EL CHAVO TE COMIÓ EL PUESTO": "유망주에게 자리를 뺏기다",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la"
		+ " nómina: el tuyo. Te piden por las buenas un 20% de tu sueldo, y el"
		+ " vestuario ya sabe que te lo han pedido.":
			"클럽이 특급 유망주와 말을 맞춰 놨는데, 급여 명단에 자리가 없어요. 바로 당신 자리요. 정중하게 주급 20% 삭감을 부탁하는데, 라커룸은 이미 그 얘길 알고 있어요.",
		"DECIR QUE LES SOBRÓ CONFIANZA": "자만했다고 말하기",
		"Los eliminó un equipo de dos categorías más abajo, en una cancha de mil"
		+ " personas y con el vestuario de local festejando junto al de ustedes.":
			"두 단계 아래 팀에게, 천 명짜리 경기장에서 탈락했어요. 바로 옆 홈팀 라커룸에선 축하가 한창이었어요.",

		"max_asist_eulCerebro de la Europa League": "유로파컵 플레이메이커",
		"pichichi_x5Dueño del Area": "박스의 포식자",
		"pichichi_3_paisesEl Gol No Entiende de Idiomas":
			"골에는 통역이 필요 없다",
		"doblete_ligaGoles y Pases": "득점·도움 석권",
		"verdugo_paises_bajosVerdugo de Países Bajos": "네덜란드의 재앙",
		"presentacion_40kCuarenta Mil": "4만 관중",
		"TE QUIEREN EN EL PLATÓ": "TV 출연 요청",
		"UN MICRÓFONO CALIENTE": "켜진 마이크",
		"DESCANSAR EN CASA": "집에서 휴식",
		"SALIR CON EL EQUIPO": "팀원들과 외출",
		"¡Subiste a nivel {0}!": "레벨 {0} 달성!",
		"Tienes {0} puntos para repartir en tus habilidades.":
			"능력에 분배할 포인트가 {0}점 있어요.",
		"un compañero": "동료 한 명",
		"Le abriste la puerta a {0}. Atento al mercado.":
			"{0} 쪽에 문을 열어 뒀어요. 이적 시장을 지켜보세요.",
		"Aún no hay ofertas. Se pueden mover fichas.":
			"아직 제안이 없어요. 상황은 아직 바뀔 수 있어요.",
		"{0} {1} sobre la mesa.": "테이블 위에 {0} {1}.",
		"Marcas interesadas": "관심 있는 브랜드",
		"{0} {1} {2} ficharte.": "{0} {1} {2} 당신 영입.",
		"Convocado con tu selección": "대표팀 소집",
		"Entras en la lista ({0}). Jugarás las fechas FIFA.":
			"소집 명단에 들었어요 ({0}). A매치 기간에 뛰어요.",
		"Te dan el alta": "복귀 승인",
		"Recuperado. Vuelves a estar disponible para el próximo partido.":
			"회복 완료. 다음 경기부터 다시 뛸 수 있어요.",
		"Lesión": "부상",
		"Estarás de baja {0} {1}.": "{0} {1} 동안 결장해요.",
		"Fuera de la lista": "명단 제외",
		"El seleccionador de {0} te deja fuera de la convocatoria.":
			"{0} 대표팀 감독이 당신을 소집 명단에서 뺐어요.",
		"Vuelves a la selección": "대표팀 복귀",
		"Regresas a la lista de {0} ({1}).": "{0} 대표팀 명단에 복귀했어요 ({1}).",
		"Titular con tu selección": "대표팀 선발",
		"Te ganas el puesto en el once de {0}.":
			"{0} 대표팀 베스트 11 자리를 따냈어요.",
		"Te quedas fuera": "명단 제외",
		"El técnico no te convoca para el próximo partido.":
			"감독이 다음 경기 명단에서 당신을 뺐어요.",
		"Pierdes la titularidad": "선발 자리를 잃었어요",
		"Empezarás en el banquillo el próximo partido.":
			"다음 경기는 벤치에서 시작해요.",
		"Vuelves al once": "선발 복귀",
		"El técnico te devuelve la titularidad.": "감독이 선발 자리를 돌려줬어요.",
		"Energía en rojo": "에너지 위험",
		"Vas al {0}%. Jugando así rindes menos y te arriesgas a lesionarte.":
			"에너지 {0}%. 이대로 뛰면 경기력이 떨어지고 부상 위험이 있어요.",
		"Semana de derbi": "더비 주간",
		"Toca {0}. Gana y todo cuenta doble.":
			"다음 상대는 {0}. 이기면 모든 게 두 배예요.",
		"Logro: {0}": "업적: {0}",
		"El técnico cuenta más contigo": "감독의 신뢰 상승",
		"Tu rol en el club sube a {0}.": "클럽 내 역할 상승: {0}.",
		"El técnico te nombra capitán": "감독이 당신을 주장으로 임명",
		"Tu rendimiento manda en el vestuario: llevas el brazalete.":
			"당신의 활약이 라커룸을 이끌어요. 주장 완장은 당신 거예요.",
		"Te quitan el brazalete": "주장 완장 박탈",
		"Otro compañero rinde por encima de ti esta temporada.":
			"이번 시즌엔 다른 동료가 당신보다 잘하고 있어요.",
		", {0} goles": ", {0}골",
		"Fuiste la figura ({0} de nota{1}).":
			"경기의 주인공이었어요 (평점 {0}{1}).",
		"Media {0}: el mejor de tu liga este mes (listón {1}).":
			"평점 {0}: 이달 리그 최고 (기준 {1}).",
		"Premio de la temporada {0}.": "{0} 시즌 수상.",
		"¡Campeón de Liga!": "리그 우승!",
		"Levantaste la liga con tu club.": "클럽과 함께 리그 트로피를 들어 올렸어요.",
		"¡Ascenso!": "승격!",
		"Subes a {0} con tu club.": "클럽과 함께 승격: {0}.",
		"Descenso a {0}": "강등: {0}",
		"Ganar la copa nacional.": "국내 컵 우승하기.",
		"Eres campeón de Europa.": "유럽 정상에 올랐어요.",
		"Fase final de Champions": "엘리트컵 토너먼트",

		"Entraste en el ONCE IDEAL de la liga": "리그 베스트 11에 선정됐어요",
		"¡Campeón de Europa League!": "유로파컵 우승!",
		"Ganas Europa y con ella la plaza para la próxima Champions.":
			"유럽 무대 우승, 그리고 다음 시즌 엘리트컵 출전권까지.",
		"Fase final de Europa League": "유로파컵 토너먼트",
		"¡Campeón del Mundo de Clubes!": "클럽 세계 대회 우승!",
		"El título más grande a nivel de club.": "클럽 축구 최고의 타이틀.",
		"Objetivo cumplido": "목표 달성",
		"El club queda contento con tu temporada.": "클럽이 당신의 시즌에 만족해요.",
		"Objetivo no cumplido": "목표 미달성",
		"El club esperaba más. Sube la presión.":
			"클럽은 더 기대했어요. 압박이 커져요.",
		"El club te pone en venta por no cumplir":
			"목표 미달로 클럽이 당신을 매물로 내놨어요",
		"El club te pone en venta": "클럽이 당신을 매물로 내놨어요",
		"Dos temporadas sin dar lo que firmaste. En {0} escuchan ofertas por ti.":
			"두 시즌 동안 계약값을 못 했어요. {0}에서 당신에 대한 제안을 듣고 있어요.",
		"El club te buscará minutos fuera": "클럽이 다른 곳에서 출전 기회를 찾아줘요",
		"El club te buscará sitio fuera": "클럽이 다른 곳에 자리를 찾아줘요",
		"No cumpliste lo que te pidieron y en {0} creen que necesitas jugar. En el próximo mercado te buscarán una cesión.":
			"요구를 채우지 못했고, {0}에서는 당신이 경기에 뛰어야 한다고 봐요. 다음 이적 시장에서 임대처를 찾아줄 거예요.",
		"Contrato en el último año": "계약 마지막 해",
		"Renueva o escucha ofertas antes de quedar libre.":
			"FA가 되기 전에 재계약하거나 제안을 들어 보세요.",
		"Se acabó: te retiras a los {0}": "여기까지: {0}세에 은퇴",
		"Mercado de verano abierto": "여름 이적 시장 개장",
		"{0}: OBJETIVO CUMPLIDO": "{0}: 목표 달성",
		"{0} no renueva, y no volverá en {1} temporadas":
			"{0}, 재계약 안 함. {1}시즌 동안 돌아오지 않아요",
		"{0} no renueva: tu club no juega en Europa": "{0}, 재계약 안 함: 우리 클럽이 유럽 대항전에 안 나가요",
		"{0}: objetivo a {1} por tus {2} jornadas de baja":
			"{0}: {2}라운드 결장으로 목표 {1}까지 하향",
		"{0} no renueva": "{0}, 재계약 안 함",
		"Los años pesan: -{0} en lo físico": "세월의 무게: 피지컬 -{0}",
		"Los años pesan: -{0} en lo físico y -{1} en lo técnico": "세월의 무게: 피지컬 -{0}, 기술 -{1}",
		"Los años pesan: -{0} en lo técnico": "세월의 무게: 기술 -{0}",
		"Terminar {0} o mejor en la liga.": "리그 {0} 이상으로 마치기.",
		"Dar {0} asistencias.": "도움 {0}개 기록하기.",
		"Jugar {0} partidos.": "{0}경기 출전하기.",
		"Promediar {0} de nota.": "평균 평점 {0} 기록하기.",
		"Marcar {0} goles.": "{0}골 넣기.",
		"Preguntaron por ti": "당신에 대한 문의",
		"{0} te ha hecho una oferta.": "{0}에서 영입 제안을 보냈어요.",
		"Un club": "어느 클럽",
		"Mercado de invierno abierto": "겨울 이적 시장 개장",
		"Se retiran de la puja": "영입 경쟁에서 철수",
		"Rechazaste una oferta": "제안을 거절했어요",
		"Dijiste no a {0}. Se busca otro destino para la próxima jornada.":
			"{0}의 제안을 거절했어요. 다음 라운드를 위해 다른 행선지를 찾고 있어요.",
		"Nadie ocupa el hueco": "빈자리를 채운 곳 없음",
		"Rechazaste y de momento no ha llegado nadie más.":
			"제안을 거절했고, 아직 다른 곳은 오지 않았어요.",
		"{0} ya no cuenta contigo: buscan a otro.":
			"{0}, 더는 당신을 원하지 않아요. 다른 선수를 찾고 있어요.",
		"Enfrían el interés": "관심이 식었어요",
		"{0} se baja tras tu último partido.": "{0}, 지난 경기 후 발을 뺐어요.",
		"Último día de mercado": "이적 시장 마감일",
		"{0} {1} sobre la mesa. Mañana se cierra.":
			"테이블 위에 {0} {1}. 내일 이적 시장이 닫혀요.",
		"Nueva oferta": "새 제안",
		"{0} entra en la puja por ti.": "{0}도 당신 영입 경쟁에 뛰어들었어요.",
		"El club": "클럽",
		"mejor ficha": "더 높은 주급",
		"ser titular": "선발 출전",
		"Negociación abierta": "협상 시작",
		"Pediste {0} a {1}. Te responden en la próxima jornada.":
			"{1}에 요구: {0}. 다음 라운드에 답이 와요.",
		"sube la ficha a ${0}/partido": "주급을 경기당 ${0}까지 인상",
		"acepta ficharte como {0}": "{0} 역할로 영입에 동의",
		"Ceden en la negociación": "한발 물러섰어요",
		"Rompen la negociación": "협상 결렬",
		"{0} retira su oferta: te apretaste de más.":
			"{0}, 제안 철회: 너무 세게 밀어붙였어요.",
		"Se plantan": "버티기",
		"{0} mantiene su oferta tal cual. No hay más margen.":
			"{0}, 제안 그대로 유지. 더 이상 여지는 없어요.",
		"Rumores de mercado": "이적 루머",
		"{0} pregunta por ti de cara al mercado de invierno.":
			"{0}에서 겨울 이적 시장을 앞두고 당신에 대해 문의하고 있어요.",
		"El club necesita venderte": "클럽이 당신을 팔아야 해요",
		"En {0} dicen que tu traspaso les cuadra el año. Puedes negarte, pero no te lo"
		+ " van a agradecer. Decide en MERCADO.":
			"{0}에서는 당신을 팔아야 올해 장부가 맞는대요. 거절할 수 있지만 좋아하진 않을 거예요. 이적 시장에서 결정하세요.",
		"el club": "클럽",
		"Aceptas salir": "이적 수락",
		"El club te ofrece a quien pregunte. Busca destino en MERCADO.":
			"클럽이 문의하는 누구에게나 당신을 내놓을 거예요. 이적 시장에서 행선지를 찾으세요.",
		"Te niegas a salir": "이적 거부",
		"Te quedas, pero el club contaba con ese traspaso y se nota en el vestuario.":
			"남게 됐지만, 클럽은 그 이적료를 기대하고 있었고 라커룸도 그걸 느껴요.",
		"El club te busca minutos": "클럽이 출전 기회를 찾아줘요",
		"En {0} no vas a jugar y lo saben: te ofrecen salir CEDIDO para que juegues."
		+ " Puedes negarte, pero te quedas donde estás. Decide en MERCADO.":
			"{0}에서 당신이 못 뛸 걸 알아요. 경기에 뛸 수 있도록 임대를 제안해요. 거절할 수 있지만, 그러면 그대로 남아요. 이적 시장에서 결정하세요.",
		"Te niegas a salir cedido": "임대 거부",
		"Te quedas. El club te buscó minutos y dijiste que no: esta temporada vas a"
		+ " mirar muchos partidos desde fuera.":
			"남게 됐어요. 클럽이 출전 기회를 찾아줬는데 거절했으니, 이번 시즌은 밖에서 경기를 많이 보게 될 거예요.",
		"El club deja de contar contigo: buscan salida":
			"클럽의 구상 제외: 방출 추진",
		"El club deja de esperarte": "클럽이 더는 기다리지 않아요",
		"Dos temporadas sin crecer y sin sitio en el equipo: {0} te pone en la puerta"
		+ " de salida y no te va a renovar.":
			"두 시즌째 성장도 없고 팀 내 자리도 없어요. {0}에서 당신을 내보내려 하고, 재계약도 없어요.",
		"Vuelve de su cesión": "임대 복귀",
		"{0} regresa al vestuario tras un año jugando fuera.":
			"{0} 선수가 1년 임대를 마치고 라커룸에 돌아왔어요.",
		"Un canterano": "유스 출신 선수",
		"Sale cedido": "임대 이적",
		"{0} se va cedido a {1} por una temporada.":
			"{0} 선수, {1}에 1시즌 임대.",
		"Llega cedido": "임대 영입",
		"{0} ({1}) llega cedido desde {2}.": "{0} ({1}) 선수, {2}에서 임대 합류.",
		"Sube uno de la cantera": "유스 콜업",
		"{0} ({1}) se queda con el hueco en el primer equipo.":
			"{0} ({1}) 선수가 1군 자리를 꿰찼어요.",
		"Tu club ficha": "우리 클럽 영입",
		"Llega {0} ({1}) desde {2}.": "{2}에서 {0} ({1}) 선수 영입.",
		"El descenso vacía el vestuario": "강등으로 라커룸이 텅 비어요",
		"{0} ({1}) se va: el club necesita hacer caja.":
			"{0} ({1}) 선수 이탈: 클럽은 현금이 필요해요.",
		"Se va un compañero": "동료 이탈",
		"{0} deja el vestuario: firma por {1}.":
			"{0} 선수가 라커룸을 떠나요: {1} 클럽과 계약.",
		"El fichaje del mercado": "이적 시장 최대어",
		"{0} pasa de {1} a {2} por ${3}.": "{0} 선수, ${3}에 {1}에서 {2} 클럽으로 이적.",




		"Se mueve tu vestuario": "라커룸 변화",
		"Llegan {0}. Se van {1}.": "영입: {0}. 이탈: {1}.",
		"Llegan {0}.": "영입: {0}.",
		"Se vacía tu vestuario": "라커룸이 비어 가요",
		"Se van {0}.": "이탈: {0}.",
		"Cesiones en tu club": "우리 클럽 임대 소식",
		"Llegan cedidos {0}. Salen cedidos {1}.":
			"임대 영입: {0}. 임대 이적: {1}.",
		"Llegan cedidos {0}.": "임대 영입: {0}.",
		"Salen cedidos {0}.": "임대 이적: {0}.",
		"El mercado se movió": "뜨거웠던 이적 시장",
		"{0} traspasos en el mundo. Los tienes en MERCADO.":
			"전 세계 이적 {0}건. 모두 이적 시장에 있어요.",
		"{0} traspasos en el mundo. El más caro: {1} a {2} por ${3}.":
			"전 세계 이적 {0}건. 최고액: {1}, {2} 클럽행 ${3}.",
		"Fichaste por un club nuevo": "새 클럽과 계약했어요",
		"Te incorporas a {0}. Empiezas de cero en el vestuario.":
			"{0} 합류. 라커룸에서 처음부터 다시 시작해요.",
		"tu nuevo club": "새 클럽",
		"Tu contrato terminó: eres AGENTE LIBRE":
			"계약 만료: 이제 자유 계약 선수예요",
		"Eres agente libre": "자유 계약 선수",
		"Tu contrato terminó. Elige tu próximo club.":
			"계약이 끝났어요. 다음 클럽을 고르세요.",
		"Firmaste como agente libre": "자유 계약으로 입단했어요",
		"Fichas por {0} sin traspaso.": "이적료 없이 {0} 클럽과 계약해요.",
		"Fin de la cesión: vuelves a {0}": "임대 종료: {0} 복귀",
		"Renovaste tu contrato": "재계약했어요",
		"Sigues en {0}: {1} {2} más.": "{0} 잔류: {1} {2} 연장.",
		"No renuevas: al escaparate": "재계약 거부: 매물로",
		"El club te pone en venta para no perderte gratis. Si te quedas, jugarás menos.":
			"클럽은 당신을 공짜로 잃느니 팔기로 했어요. 남으면 출전이 줄어요.",
		"Sin destinos de cesión": "임대처 없음",
		"Ningún club menor te quiere cedido ahora mismo.":
			"지금은 당신을 임대로 원하는 작은 클럽이 없어요.",
		"Pediste salir cedido": "임대를 요청했어요",
		"Clubes menores donde jugarías de titular. Elige en el MERCADO.":
			"당신이 선발로 뛸 수 있는 작은 클럽들. 이적 시장에서 고르세요.",
		"Tu club quiere retenerte": "클럽이 당신을 붙잡으려 해요",
		"{0} pone sobre la mesa una mejora de contrato para que te quedes.":
			"{0}에서 잔류를 위해 더 나은 계약을 제시했어요.",
		"Tu club": "내 클럽",
		"Sin sitio en la selección de {0}": "{0} 대표팀에 자리 없음",
		"Titular de {0}": "{0} 대표팀 선발",
		"Convocado con {0}": "{0} 대표팀 소집",
		"¡{0} se clasificó al Mundial!": "{0}, 세계 대회 진출 확정!",
		"{0} CAMPEÓN de la {1}… sin ti": "{0}, {1} 우승… 당신 없이",
		"{0}: {1} CAMPEÓN, y tú sin jugar un minuto": "{0}: {1} 우승, 당신은 1분도 못 뛰었어요",
		"{0} subcampeón de la {1} (sin ti)": "{0}, {1} 준우승 (당신 없이)",
		"{0}: {1} eliminada en {2} (sin ti)":
			"{0}: {1}, {2}에서 탈락 (당신 없이)",
		"{0} sin ti": "{0}, 당신 없이",
		"{0} se clasificó al Mundial (sin ti)":
			"{0}, 세계 대회 진출 (당신 없이)",
		"¡CAMPEÓN DEL MUNDO con {0}!": "{0}에서 세계 챔피언!",
		"¡CAMPEÓN de la {0} con {1}!": "{1}에서 {0} 우승!",
		"Subcampeón de la {0} con {1}": "{1}에서 {0} 준우승",
		"{0}: eliminado en {1} con {2}": "{0}: {2}에서 {1} 탈락",
		"{0} con {1}": "{0} ({1})",
		"{0} se clasificó al Mundial": "{0}, 세계 대회 본선 진출",
		"{0} no fue al Mundial": "{0}, 세계 대회 불참",
		"Mundial sin ti: {0} de {1}": "나 없는 세계 대회: {1}, {0}",
		"{0} sin ti: {1} de {2}": "나 없는 {0}: {2}, {1}",
		"{0} no se clasificó al Mundial": "{0}, 세계 대회 예선 탈락",


		"natdieciseisavos": "32강",
		"natoctavos": "16강",
		"natcuartos": "8강",
		"natsemifinal": "준결승",
		"natfinal": "결승",
		"natfase de grupos": "조별 리그",
		"natno clasificada": "예선 탈락",
		"natcampeón": "우승",
		"natsubcampeón": "준우승",
		"natronda": "라운드",
		"calluptitular": "선발",
		"callupconvocado": "소집",
		"SUENA OTRO CLUB": "다른 클럽의 관심",
		"ME INTERESARÍA": "관심 있어요",
		"ESTOY COMPROMETIDO AQUÍ": "여기에 전념할래요",
		"DOS CLUBES PREGUNTAN": "두 클럽의 문의",
		"Te ponen el micro delante: {0} y {1} preguntan por ti. ¿A cuál te irías? Lo que"
		+ " digas lo oye tu técnico.":
			"마이크가 눈앞에: {0}, {1} 두 클럽이 관심을 보여요. 어디로 가고 싶어요? 감독도 듣고 있어요.",
		"ME IRÍA A {0}": "{0} 이적 희망",
		"ME QUEDO EN {0}": "{0}에 남을래요",
		"LESIONADO": "부상",
		"Selección": "대표팀",
		"buzonMERCADO": "이적 시장",
		"¡LOGRO DESBLOQUEADO!": "업적 달성!",
		"¡ARQUETIPO DESBLOQUEADO!": "아키타입 해금!",
		"¡RASGO DESCUBIERTO!": "특성 발견!",
		"TOCA PARA CONTINUAR": "탭해서 계속",
		"REGATEA Y REMATA": "드리블 후 슈팅",
		"Puedes tirar ya. O jala desde dentro del círculo para conducir, vuelve al círculo y paras en seco: ahí apuntas con calma y tiras. Combinar regate y tiro es lo que abre a un defensa.": "바로 슈팅해도 돼요. 아니면 원 안에서 당겨 드리블하고, 원으로 돌아오면 딱 멈춰요: 거기서 차분히 조준하고 슈팅하세요. 드리블과 슈팅을 섞어야 수비수를 뚫을 수 있어요.",
		"MODO PASE": "패스 모드",
		"Dentro del círculo, el mismo trazo es un pase. Jala hacia atrás y el balón sale hacia adelante, al compañero libre de la otra banda. Sin defensa encima, es la salida más segura.": "원 안에서는 같은 동작이 패스예요. 뒤로 당기면 공이 앞으로, 반대편 측면의 빈 동료에게 가요. 붙은 수비수가 없을 땐 가장 안전한 탈출구예요.",
		"EL RELEVO": "바통 터치",
		"Si tu pase llega a un compañero fuera del área, pasas a jugar con él. Si cae dentro del área no hay control que valga: remata de primera.": "패스가 박스 밖의 동료에게 가면 그 선수로 바뀌어 플레이해요. 박스 안에 떨어지면 컨트롤할 틈이 없어요: 원터치로 마무리해요.",
		"LA PANTALLA DE GOLPEO": "킥 화면",
		"Soltaste la resortera: ahora eliges dónde tocar el balón. La costura marca el centro: ahí sale tenso. Cuanto más abajo la toques, más lo elevas; cuanto más al borde, menos potencia.": "새총을 놓았어요: 이제 공의 어디를 찰지 골라요. 솔기가 중앙이에요: 거기를 차면 낮고 빠르게 날아가요. 아래를 찰수록 더 높이 뜨고, 가장자리일수록 파워가 줄어요.",

		"Primera Mudanza": "첫 이사",
		"Subir de casa por primera vez.": "처음으로 집 업그레이드하기.",
		"Vida Acomodada": "여유로운 삶",
		"Llegar a vivir en una casa moderna.": "모던 하우스로 이사하기.",
		"La Mansión": "대저택",
		"Llegar a vivir en una mansión.": "대저택으로 이사하기.",
		"Hogar, Dulce Hogar": "즐거운 나의 집",
		"Amueblar tu casa con 10 adiciones.": "집에 추가 시설 10개 들이기.",
		"La Finca": "전원 저택",
		"Llegar a vivir en una finca.": "전원 저택으로 이사하기.",
		"Casa Llena": "꽉 찬 집",
		"Amueblar tu casa con 40 adiciones.": "집에 추가 시설 40개 들이기.",
		"La Casa Soñada": "꿈의 집",
		"Amueblar tu casa con 80 adiciones.": "집에 추가 시설 80개 들이기.",


		"Hacer 10 puntos en la maquinita de tu casa.": "집 오락기에서 10점 내기.",
		"Serpiente Legendaria": "전설의 뱀",
		"¡TE TOCAN LAS LISAS!": "솔리드 볼 차례!",
		"¡TE TOCAN LAS RAYADAS!": "스트라이프 볼 차례!",
		"Bullseye": "불스아이",
		"Clavar un dardo en el mero centro de la diana.": "다트를 과녁 정중앙에 꽂기.",
		"Ganar cinco retos de billar al vestuario en tu casa.":
			"집에서 라커룸 동료들과의 당구 대결 5번 이기기.",

		"Buen Pulso": "흔들림 없는 손",
		"Hacer 200 puntos en la diana de tu casa.": "집 다트판에서 200점 내기.",
		"Mano de Seda": "비단결 손",
		"Hacer 320 puntos en la diana de tu casa.": "집 다트판에서 320점 내기.",
		"Nueve Dardos": "나인 다트",
		"Hacer 400 puntos en la diana de tu casa.": "집 다트판에서 400점 내기.",
		"La Mirada del Míster": "감독의 눈총",
		"Llegar a cien dominadas en el banquillo.": "벤치 옆에서 리프팅 100개 달성하기.",
		"Compañero de Vestuario": "라커룸 동료",
		"Agregar a tu primer amigo.": "첫 친구 추가하기.",
		"La Peña": "패거리",
		"Tener 5 amigos.": "친구 5명 만들기.",
		"Hinchada Propia": "나만의 팬",
		"Tener 10 amigos.": "친구 10명 만들기.",
		"Sin Fronteras": "국경은 없다",
		"El Mejor del Grupo": "무리 중 최고",
		"Ser primero en LEGADO entre al menos 3 amigos.": "친구 3명 이상 중에서 레거시 1위 하기.",
		"Bola Ocho": "에잇 볼",
		"Ganar tu primera partida de billar en casa.": "집에서 첫 당구 게임 이기기.",
		"Mesa Limpia": "클린 테이블",
		"Ganar una partida de billar sin que el rival meta una sola bola.":
			"상대가 공 하나도 못 넣게 하고 당구 게임 이기기.",
		"El Dueño de la Casa": "집주인",
		"Ganaste cinco retos al vestuario en tu casa, entre la diana y la mesa.": "다트판과 당구대에서 라커룸 동료들과의 대결 5번을 이겼어요.",
		"Hacer 50 puntos en la maquinita de tu casa.": "집 오락기에서 50점 내기.",
		"Graduado de la Academia": "아카데미 졸업생",
		"Completar el entrenamiento de la Academia.": "아카데미 훈련 완료하기.",
		"Ocho Años":
			"8년",
		"Ocho temporadas con la misma persona.":
			"같은 사람과 8시즌 함께하기.",
		"Media Naranja": "반쪽",
		"Formalizar una relación.": "연애 공식화하기.",
		"Vitrina Dorada": "황금 진열장",
		"Desbloquear todos los logros épicos.": "에픽 업적 모두 해금하기.",
		"¡Corten!": "컷!",
		"Tumbar a un camarógrafo de un balonazo.": "빗나간 슈팅으로 카메라맨 넘어뜨리기.",


		"¡Plumas!": "깃털!",
		"Alcanzar a una paloma del campo de un balonazo.": "빗나간 슈팅으로 경기장 비둘기 맞히기.",


		"¡Agua Va!": "물벼락!",
		"Reventar una cabeza de riego de un balonazo y que escupa torcida el resto del partido.":
			"슈팅으로 스프링클러 헤드를 부숴 경기 끝까지 물이 옆으로 뿜어지게 하기.",
		"¡Remojón!": "흠뻑!",
		"Tirarle la bebida a diez aficionados con balones que se van a la grada.":
			"관중석으로 날아간 공으로 팬 10명의 음료 쏟게 하기.",


		"¡Ahí Va la Bandeja!": "도시락 날아간다!",
		"Tumbarle la bandeja de comida al vendedor de la grada de un balonazo.":
			"빗나간 슈팅으로 관중석 상인의 음식 쟁반 떨어뜨리기.",
		"¡LE TIRASTE LA COMIDA AL VENDEDOR!":
			"상인의 음식이 날아갔어요!",
		"Le Callaste la Boca": "입 다물게 했다",
		"Marcar después de que te abucheen desde la grada, en el mismo partido.":
			"관중석에서 야유를 받은 경기에서 골 넣기.",
		"Ese Balón No Vuelve": "저 공은 안 돌아와",
		"Mandar un balón a la calle en un campo sin nada detrás del arco.":
			"골대 뒤에 아무것도 없는 경기장에서 공을 거리로 날려 보내기.",
		"Cesión al Portero": "골키퍼에게 백패스",
		"Pasarle el balón a tu propio portero en vez de tirar a puerta.":
			"슈팅 대신 우리 골키퍼에게 공 돌려주기.",
		"¡A por agua!": "물 마시는 시간!",
		"Tirar las botellas de agua del portero de un balonazo.":
			"빗나간 슈팅으로 골키퍼의 물병 쓰러뜨리기.",
		"La mano del derbi": "더비의 악수",
		"Descubrir el apretón de manos de los técnicos al acabar un derbi.":
			"더비가 끝난 뒤 두 감독의 악수 발견하기.",
		"Mano de hierro": "강철 악력",
		"Ganarle el apretón de manos al técnico rival al acabar un derbi.":
			"더비가 끝난 뒤 상대 감독과의 악수 대결 이기기.",
		"¡Una foto y me voy!": "사진 한 장만!",
		"Un aficionado salta al campo en una final para tomarse una foto contigo.":
			"결승전 도중 팬이 그라운드에 뛰어들어 나와 사진 찍기.",
		"¡Cristales!": "유리 박살!",
		"Reventar el cristal de un palco de un balonazo.": "빗나간 슈팅으로 VIP석 유리창 깨기.",
		"Sin Piedad con el Chaval": "꼬마에게도 자비 없음",
		"Tumbar al recogepelotas de un balonazo.": "빗나간 슈팅으로 볼보이 넘어뜨리기.",
		"De Espaldas a la Copa": "트로피에 등 돌리고",
		"Perder una final y ver al rival levantar el título.": "결승에서 져서 상대가 트로피 드는 걸 지켜보기.",

		"{0} decidió la final. Su nombre se queda contigo.": "{0} 선수가 결승을 결정지었어요. 그 이름은 잊지 못할 거예요.",
		"{0} metió el penalti que decidió la final. Su nombre se queda contigo.":
			"{0} 선수가 결승을 결정짓는 페널티킥을 넣었어요. 그 이름은 잊지 못할 거예요.",
		"{0} paró el penalti que decidió la final. Su nombre se queda contigo.":
			"{0} 선수가 결승을 결정짓는 페널티킥을 막았어요. 그 이름은 잊지 못할 거예요.",
		"REVANCHA · TEMPORADA {0}": "복수전 · {0} 시즌",
		"{0} te quitó la final de la temporada {1} ({2}). Esta noche los que miran son ellos.":
			"{0} 클럽이 {1} 시즌 결승을 빼앗아 갔어요 ({2}). 오늘 밤엔 그들이 지켜볼 차례예요.",
		"Final vengada en la temporada {0}": "{0} 시즌 결승 설욕",
		"Te ganó la final de la temporada {0}": "{0} 시즌 결승에서 패배",
		"Revancha": "복수전",
		"Ganar una final al club que te quitó otra.":
			"다른 결승을 빼앗아 간 클럽에게 결승에서 이기기.",
		"Tres Pases, Tres Goles": "패스 셋, 골 셋",
		"Darle tres asistencias al mismo compañero en un partido.": "한 경기에서 같은 동료에게 도움 3개 기록하기.",
		"Un Balón Cada Uno": "한 골씩 사이좋게",
		"Hacer hat-trick en el partido en que le das tres asistencias al mismo compañero.": "같은 동료에게 도움 3개를 준 경기에서 해트트릭하기.",
		"Piel Nueva": "새 유니폼",
		"Ver la presentación de las equipaciones de la temporada.": "시즌 유니폼 공개 보기.",
		"Primer Gol": "첫 골",


		"El Año Perfecto": "완벽한 한 해",
		"En PRIMERA y en una sola temporada: liga, copa y Champions, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de la Champions.":
			"1부 리그에서 한 시즌 만에: 리그, 컵, 엘리트컵 우승에 올해의 선수, 리그 MVP와 득점왕, 엘리트컵 MVP와 득점왕까지.",
		"De la Camilla al Gol": "들것에서 골망으로",
		"Volver de una lesión grave y marcar en tu regreso.":
			"큰 부상에서 돌아와 복귀전에서 골 넣기.",
		"Marcar tu primer gol.": "첫 골 넣기.",
		"Marcar rematando un córner.": "코너킥을 받아 골 넣기.",
		"Marcar directo desde el córner, sin que nadie toque el balón.":
			"아무도 공을 건드리지 않고 코너킥 직접 골 넣기.",
		"Marcar un penal picado: cambiar a modo CENTRO antes de golpear.":
			"칩 페널티킥 성공하기: 차기 전에 크로스 모드로 바꾸세요.",
		"Goleador": "골잡이",
		"10 goles en tu carrera.": "커리어 10골.",
		"Artillero": "명사수",
		"50 goles en tu carrera.": "커리어 50골.",
		"Centenario": "센추리온",
		"100 goles en tu carrera.": "커리어 100골.",
		"Killer": "히트맨",
		"250 goles en tu carrera.": "커리어 250골.",
		"Máquina de Goles": "골 머신",
		"500 goles en tu carrera.": "커리어 500골.",
		"Asistente": "도우미",
		"Dar tu primera asistencia.": "첫 도움 기록하기.",
		"Cerebro": "지휘자",
		"100 asistencias en tu carrera.": "커리어 도움 100개.",
		"Doblete": "멀티골",
		"2 goles en un mismo partido.": "한 경기 2골.",
		"Hat-Trick": "해트트릭",
		"3 goles en un mismo partido.": "한 경기 3골.",
		"4 goles en un mismo partido.": "한 경기 4골.",
		"Manita": "5골쇼",
		"5 goles en un mismo partido.": "한 경기 5골.",
		"Sangre Fría": "강철 심장",
		"Marcar tu primer penalti.": "첫 페널티킥 골 넣기.",
		"Especialista de Penales": "PK 장인",
		"25 penaltis marcados.": "페널티킥 25골.",
		"Maestro de la Falta": "프리킥 마스터",
		"Marcar de tiro libre directo.": "직접 프리킥으로 골 넣기.",
		"El Muro No Existe": "수비벽이 뭐죠?",
		"10 goles de tiro libre.": "프리킥 10골.",
		"Jugada de Estrategia": "교과서 세트피스",
		"Por Debajo": "벽 아래로",
		"Marcar un tiro libre por debajo de la barrera.": "수비벽 아래로 프리킥 골 넣기.",
		"Gol Olímpico": "코너 직접골",

		"Testarazo": "총알 헤더",
		"Marcar de cabeza.": "헤더로 골 넣기.",
		"Sin Dejarla Caer": "떨어뜨리지 마",
		"Marcar de volea.": "발리로 골 넣기.",
		"Chilena de Antología": "전설의 바이시클 킥",
		"Marcar de chilena.": "바이시클 킥으로 골 넣기.",
		"Perro en la Cancha": "그라운드의 강아지",
		"Que un perro se meta en la cancha durante un partido tuyo.":
			"내 경기 도중 개가 그라운드에 난입하기.",
		"Marcaste de cabeza tras un córner.": "코너킥에서 헤더로 골을 넣었어요.",
		"Campeón": "우승",
		"Ganar tu primera liga.": "첫 리그 우승하기.",
		"Rey de Primera": "1부 리그 왕",
		"Campeón de la máxima categoría.": "최상위 리그 우승.",
		"Subir de categoría.": "상위 리그로 승격하기.",
		"Copa en Vitrina": "진열장 속 컵",
		"Rey de Europa": "대륙의 왕",
		"Ganar la Champions continental.": "대륙 엘리트컵 우승하기.",
		"Ganar el Mundial de Clubes.": "클럽 세계 대회 우승하기.",
		"Noche Europea": "대륙 대회의 밤",
		"Marcar en un partido continental.": "대륙 대회 경기에서 골 넣기.",
		"Orgullo Nacional": "국가의 자부심",
		"Marcar con tu selección.": "대표팀에서 골 넣기.",
		"Asistencia Internacional": "A매치 도움",
		"Dar una asistencia con tu selección.": "대표팀에서 도움 기록하기.",
		"Héroe Mundialista": "세계 대회의 영웅",
		"Marcar en el Mundial.": "세계 대회에서 골 넣기.",
		"Gloria Continental": "대륙의 영광",
		"Ganar la Euro/Copa América con tu país.": "대표팀으로 유럽 대회/남미 대회 우승하기.",
		"Ganar el Mundial con tu selección.": "대표팀으로 세계 대회 우승하기.",
		"El Mejor del Mundo": "세계 최고",
		"Ganar el Balón de Oro.": "올해의 선수 수상하기.",
		"Tríada Dorada": "황금 트레블",
		"3 Balones de Oro.": "올해의 선수 3회 수상.",
		"El Que Te Lo Quitó": "빼앗긴 영광",
		"Quedar segundo en el Balón de Oro, justo detrás del ganador.": "올해의 선수 투표에서 수상자 바로 뒤 2위 하기.",
		"Nivel Plata": "실버 등급",
		"Llegar a ser jugador de plata: media 65 en una carrera.":
			"실버 선수 되기: 한 커리어에서 OVR 65 달성.",
		"Nivel Oro": "골드 등급",
		"Llegar a ser jugador de oro: media 75 en una carrera.": "골드 선수 되기: 한 커리어에서 OVR 75 달성.",
		"Nivel Diamante": "다이아몬드 등급",
		"Llegar a ser jugador de diamante: media 85 en una carrera.":
			"다이아몬드 선수 되기: 한 커리어에서 OVR 85 달성.",
		"Clase Mundial": "월드 클래스",
		"Media de habilidades de nivel élite (90).": "엘리트급 능력 평균 (90).",
		"Actuación Perfecta": "완벽한 경기",
		"Un partido con nota 9.5 o más.": "평점 9.5 이상인 경기.",
		"¿El Mejor de la Historia?": "역대 최고?",
		"Liga, copa, continental, Balón de Oro y goleo en una misma temporada.":
			"한 시즌에 리그, 컵, 대륙 대회, 올해의 선수, 득점왕 석권.",
		"Trotamundos": "방랑자",
		"Ganar liga con 3 clubes distintos.": "서로 다른 3개 클럽에서 리그 우승하기.",
		"El Conquistador": "정복자",
		"Ganar la 1ª división de las cinco grandes: España, Inglaterra, Italia, Alemania y Francia.":
			"5대 리그 1부 모두 우승하기: 스페인, 잉글랜드, 이탈리아, 독일, 프랑스.",
		"La Vuelta al Mundo": "세계 일주",
		"Ganar la liga en 3 confederaciones distintas (Europa, América, Asia…).":
			"서로 다른 3개 대륙 연맹(유럽, 아메리카, 아시아…)에서 리그 우승하기.",
		"Un Solo Amor": "단 하나의 사랑",
		"5 títulos de liga con un mismo club.": "한 클럽에서 리그 우승 5회.",
		"Mi Único Amor": "원클럽맨",
		"Diez temporadas o más en el mismo club sin fichar nunca por otro; una cesión no lo rompe.":
			"다른 클럽과 계약하지 않고 한 클럽에서 10시즌 이상 뛰기. 임대는 괜찮아요.",
		"Uno Siempre Vuelve": "결국 돌아왔다",
		"Volver a fichar por un club en el que ya hayas jugado antes.":
			"예전에 뛰었던 클럽과 다시 계약하기.",
		"Dinastía": "왕조",
		"Ganar la liga 3 temporadas seguidas.": "3시즌 연속 리그 우승하기.",
		"Amo de Europa": "대륙의 지배자",
		"Ganar la Champions con 3 clubes distintos.": "서로 다른 3개 클럽에서 엘리트컵 우승하기.",
		"Coleccionista de Títulos": "트로피 수집가",







		"Ganar la Copa de Campeones continental.": "대륙 엘리트컵 우승하기.",
		"Ganar la Euro/Torneo Sudamericano con tu país.":
			"대표팀으로 유럽 대회/남미 대회 우승하기.",
		"Ganar el Jugador del Año.": "올해의 선수 수상하기.",
		"3 Premios al Mejor.": "올해의 선수 3회 수상.",
		"Liga, copa, continental, Jugador del Año y goleo en una misma temporada.": "한 시즌에 리그, 컵, 대륙 대회, 올해의 선수, 득점왕 석권.",
		"Ganar la Copa de Campeones con 3 clubes distintos.": "서로 다른 3개 클럽에서 엘리트컵 우승하기.",
		"Ganar los seis grandes: liga, copa, Copa de Campeones, Mundial de Clubes, continental y Mundial.":
			"6대 타이틀 모두 우승하기: 리그, 컵, 엘리트컵, 클럽 세계 대회, 대륙 대회, 세계 대회.",
		"Rey de Copa Europa": "유로파컵의 왕",
		"Ganar la Copa Europa.": "유로파컵 우승하기.",
		"Rey de la Copa Conferencia": "챌린지컵의 왕",
		"Ganar la Copa Conferencia.": "챌린지컵 우승하기.",
		"Ganar el Bota de la Liga.": "리그 득점왕 차지하기.",
		"Bota de la Copa de Campeones": "엘리트컵 득점왕",
		"Ser el máximo goleador de la Copa de Campeones.": "엘리트컵 득점왕 되기.",
		"Bota de la Copa Europa": "유로파컵 득점왕",
		"Ser el máximo goleador de la Copa Europa.": "유로파컵 득점왕 되기.",
		"Bota de la Copa Conferencia": "챌린지컵 득점왕",
		"Ser el máximo goleador de la Copa Conferencia.": "챌린지컵 득점왕 되기.",
		"Máximo asistente de la Copa de Campeones.": "엘리트컵 도움왕.",
		"Cerebro de la Copa Europa": "유로파컵 플레이메이커",
		"Máximo asistente de la Copa Europa.": "유로파컵 도움왕.",
		"Máximo goleador de tu liga Y de la Copa de Campeones en la misma temporada.": "같은 시즌에 리그와 엘리트컵 득점왕 동시 달성.",
		"Ganar los seis grandes: liga, copa, Champions, Mundial de Clubes, continental y Mundial.":
			"6대 타이틀 모두 우승하기: 리그, 컵, 엘리트컵, 클럽 세계 대회, 대륙 대회, 세계 대회.",
		"Leal de Corazón": "한결같은 마음",
		"500 partidos con un mismo club.": "한 클럽에서 500경기.",
		"Círculo Completo": "돌고 돌아 처음으로",
		"Retirarte en el club donde empezaste.": "커리어를 시작한 클럽에서 은퇴하기.",
		"Hasta el Final": "끝까지",
		"Jugar hasta el final: que el calendario te retire a ti.": "끝까지 뛰기: 은퇴는 세월이 정하게 하기.",
		"Salir a Tiempo": "박수칠 때 떠나라",
		"El Cuerpo Dijo Basta": "몸이 먼저 멈췄다",
		"Que una lesión grave de veterano te retire antes de tiempo.":
			"베테랑 시절 큰 부상으로 일찍 은퇴하기.",
		"Colgar las botas por decisión propia, antes de que te lo digan.":
			"누가 말하기 전에 스스로 축구화 벗기.",
		"Leyenda del Club": "클럽 레전드",
		"Entrar al top 5 de leyendas de tu club.": "클럽 레전드 TOP 5 진입하기.",
		"Cara a Cara": "정면 승부",
		"Entre los Grandes": "거장들 사이에서",
		"Dejar atrás a 5 leyendas.": "레전드 5명 넘어서기.",
		"Nombre Propio": "나만의 이름",
		"Dejar atrás a 15 leyendas.": "레전드 15명 넘어서기.",
		"Mejor de la Historia": "역대 최고",
		"Nadie en la historia hizo más goles + asistencias de élite que tú.": "역사상 누구도 나보다 엘리트 무대 골 + 도움이 많지 않아요.",
		"Por Encima de Todos": "모두의 위에",
		"En los Libros": "기록에 남다",
		"Batir tu primer récord histórico.": "첫 역대 기록 깨기.",
		"Hombre de Récords": "기록 제조기",
		"Batir 10 récords históricos.": "역대 기록 10개 깨기.",
		"Dejar atrás a 30 leyendas de la historia.": "역사 속 레전드 30명 넘어서기.",
		"Veterano": "베테랑",
		"100 partidos disputados.": "100경기 출전.",
		"Inoxidable": "철인",
		"300 partidos disputados.": "300경기 출전.",
		"Un Lustro": "5년",
		"5 temporadas completadas.": "5시즌 완주.",
		"Una Década": "10년",
		"10 temporadas completadas.": "10시즌 완주.",
		"Leyenda": "레전드",
		"Alcanzar el escalón LEYENDA.": "레전드 등급 도달하기.",
		"Inmortal": "불멸",
		"Alcanzar el escalón INMORTAL.": "불멸 등급 도달하기.",
		"Curtido en la Cantera": "밑바닥에서 단련",
		"Completar una temporada entera en Tercera División.": "3부 리그에서 한 시즌 완주하기.",
		"Veterano de Segunda": "2부 리그 베테랑",
		"Completar una temporada entera en Segunda División.": "2부 리그에서 한 시즌 완주하기.",
		"Bautizo en Primera": "1부 리그 신고식",
		"Completar una temporada entera en Primera División.": "1부 리그에서 한 시즌 완주하기.",
		"Rey de Europa League": "유로파컵의 왕",
		"Ganar la Europa League.": "유로파컵 우승하기.",
		"Pichichi": "골잡이 킹",
		"Ganar el Pichichi de la Liga.": "리그 득점왕 차지하기.",
		"bota_championsBota de la Champions": "엘리트컵 득점왕",
		"Ser el máximo goleador de la Champions.": "엘리트컵 득점왕 되기.",
		"bota_europaBota de la Europa League": "유로파컵 득점왕",
		"Ser el máximo goleador de la Europa League.": "유로파컵 득점왕 되기.",
		"Cerebro de la Liga": "리그 플레이메이커",
		"Máximo asistente de la Liga.": "리그 도움왕.",
		"Cerebro de Europa": "엘리트컵 플레이메이커",
		"Máximo asistente de la Champions.": "엘리트컵 도움왕.",
		"nombre del logro max_asist_eulCerebro de la Europa League": "유로파컵 플레이메이커",
		"Máximo asistente de la Europa League.": "유로파컵 도움왕.",
		"COLISIÓN: misma clave ya existe en el dominio 'match' (trofeos) con este MISMO"
		+ " valor; se repite idéntica a propósitoBota de Oro del Mundial":
			"세계 대회 득점왕",
		"Máximo goleador del Mundial con tu selección.":
			"대표팀으로 세계 대회 득점왕 되기.",
		"Killer de la Liga": "리그의 킬러",
		"Ganar 3 veces el trofeo de máximo goleador de tu liga.": "리그 득점왕 트로피 3회 차지하기.",
		"'dueño del área' -> quien manda dentro del área; 'BOX' es el área en inglés"
		+ " británicoDueño del Area":
			"박스의 지배자",
		"Ganar 5 veces el trofeo de máximo goleador de tu liga.": "리그 득점왕 트로피 5회 차지하기.",
		"El Que Reparte": "배달부",
		"Ganar 3 veces el trofeo de máximo asistente de tu liga.": "리그 도움왕 트로피 3회 차지하기.",
		"Goleador Sin Fronteras": "국경 없는 골잡이",
		"Ser máximo goleador de la liga en 2 países distintos.":
			"서로 다른 2개 나라에서 리그 득점왕 되기.",
		"el chiste: el gol se entiende en cualquier idiomaEl Gol No Entiende de"
		+ " Idiomas":
			"골은 통역이 필요 없다",
		"Ser máximo goleador de la liga en 3 países distintos.":
			"서로 다른 3개 나라에서 리그 득점왕 되기.",
		"cabeza de ambas tablas (goles y asistencias); 'Goals & Assists' no cabe en 13"
		+ " caracteresGoles y Pases":
			"골도 도움도",
		"Máximo goleador Y máximo asistente de tu liga en la misma temporada.":
			"같은 시즌에 리그 득점왕과 도움왕 동시 달성.",
		"Nadie Marca Más": "누구보다 많이",
		"Máximo goleador de tu liga Y de la Champions en la misma temporada.":
			"같은 시즌에 리그와 엘리트컵 득점왕 동시 달성.",
		"Estrella del Partido": "경기의 스타",
		"Ser elegido Jugador del Partido.": "경기 최우수 선수로 선정되기.",
		"jugador_mesJugador del Mes": "이달의 선수",
		"Ganar el Jugador del Mes.": "이달의 선수 수상하기.",
		"Verdugo de España": "스페인의 재앙",
		"Vencer a todos los clubes de España (las tres divisiones).":
			"스페인의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Inglaterra": "잉글랜드의 재앙",
		"Vencer a todos los clubes de Inglaterra (las tres divisiones).":
			"잉글랜드의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Italia": "이탈리아의 재앙",
		"Vencer a todos los clubes de Italia (las tres divisiones).":
			"이탈리아의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Alemania": "독일의 재앙",
		"Vencer a todos los clubes de Alemania (las tres divisiones).":
			"독일의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Francia": "프랑스의 재앙",
		"Vencer a todos los clubes de Francia (las tres divisiones).":
			"프랑스의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Portugal": "포르투갈의 재앙",
		"Vencer a todos los clubes de Portugal (las tres divisiones).":
			"포르투갈의 모든 클럽 꺾기 (1~3부 전부).",
		"'Holland' porque 'the Netherlands' se pasa del ancho del español en la fila"
		+ " del logroVerdugo de Países Bajos":
			"네덜란드의 재앙",
		"Vencer a todos los clubes de Países Bajos (las tres divisiones).":
			"네덜란드의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Bélgica": "벨기에의 재앙",
		"Vencer a todos los clubes de Bélgica (las tres divisiones).":
			"벨기에의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Turquía": "튀르키예의 재앙",
		"Vencer a todos los clubes de Turquía (las tres divisiones).":
			"튀르키예의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Argentina": "아르헨티나의 재앙",
		"Vencer a todos los clubes de Argentina (las tres divisiones).":
			"아르헨티나의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Brasil": "브라질의 재앙",
		"Vencer a todos los clubes de Brasil (las tres divisiones).":
			"브라질의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de México": "멕시코의 재앙",
		"Vencer a todos los clubes de México (las tres divisiones).":
			"멕시코의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Estados Unidos": "미국의 재앙",
		"Vencer a todos los clubes de Estados Unidos (las tres divisiones).":
			"미국의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Arabia Saudí": "사우디아라비아의 재앙",
		"Vencer a todos los clubes de Arabia Saudí (las tres divisiones).":
			"사우디아라비아의 모든 클럽 꺾기 (1~3부 전부).",

		"Verdugo de Escocia": "스코틀랜드의 재앙",
		"Vencer a todos los clubes de Escocia (las tres divisiones).":
			"스코틀랜드의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Grecia": "그리스의 재앙",
		"Vencer a todos los clubes de Grecia (las tres divisiones).":
			"그리스의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Ucrania": "우크라이나의 재앙",
		"Vencer a todos los clubes de Ucrania (las tres divisiones).":
			"우크라이나의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Austria": "오스트리아의 재앙",
		"Vencer a todos los clubes de Austria (las tres divisiones).":
			"오스트리아의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Suiza": "스위스의 재앙",
		"Vencer a todos los clubes de Suiza (las tres divisiones).":
			"스위스의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Chequia": "체코의 재앙",
		"Vencer a todos los clubes de Chequia (las tres divisiones).":
			"체코의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Croacia": "크로아티아의 재앙",
		"Vencer a todos los clubes de Croacia (las tres divisiones).":
			"크로아티아의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Serbia": "세르비아의 재앙",
		"Vencer a todos los clubes de Serbia (las tres divisiones).":
			"세르비아의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Dinamarca": "덴마크의 재앙",
		"Vencer a todos los clubes de Dinamarca (las tres divisiones).":
			"덴마크의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Noruega": "노르웨이의 재앙",
		"Vencer a todos los clubes de Noruega (las tres divisiones).":
			"노르웨이의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Japón": "일본의 재앙",
		"Vencer a todos los clubes de Japón (las tres divisiones).":
			"일본의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Corea del Sur": "대한민국의 재앙",
		"Vencer a todos los clubes de Corea del Sur (las tres divisiones).":
			"대한민국의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Colombia": "콜롬비아의 재앙",
		"Vencer a todos los clubes de Colombia (las tres divisiones).":
			"콜롬비아의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Chile": "칠레의 재앙",
		"Vencer a todos los clubes de Chile (las tres divisiones).":
			"칠레의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Uruguay": "우루과이의 재앙",
		"Vencer a todos los clubes de Uruguay (las tres divisiones).":
			"우루과이의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Paraguay": "파라과이의 재앙",
		"Vencer a todos los clubes de Paraguay (las tres divisiones).":
			"파라과이의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Ecuador": "에콰도르의 재앙",
		"Vencer a todos los clubes de Ecuador (las tres divisiones).":
			"에콰도르의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Perú": "페루의 재앙",
		"Vencer a todos los clubes de Perú (las tres divisiones).":
			"페루의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Bolivia": "볼리비아의 재앙",
		"Vencer a todos los clubes de Bolivia (las tres divisiones).":
			"볼리비아의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Venezuela": "베네수엘라의 재앙",
		"Vencer a todos los clubes de Venezuela (las tres divisiones).":
			"베네수엘라의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Egipto": "이집트의 재앙",
		"Vencer a todos los clubes de Egipto (las tres divisiones).":
			"이집트의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Marruecos": "모로코의 재앙",
		"Vencer a todos los clubes de Marruecos (las tres divisiones).":
			"모로코의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Túnez": "튀니지의 재앙",
		"Vencer a todos los clubes de Túnez (las tres divisiones).":
			"튀니지의 모든 클럽 꺾기 (1~3부 전부).",
		"Verdugo de Nueva Zelanda": "뉴질랜드의 재앙",
		"Vencer a todos los clubes de Nueva Zelanda (las tres divisiones).":
			"뉴질랜드의 모든 클럽 꺾기 (1~3부 전부).",
		"Némesis del Mundo": "세계의 숙적",
		"Vencer a TODOS los clubes del juego: cada liga, cada división. La cima del hardcore.":
			"게임 속 모든 클럽 꺾기: 모든 리그, 모든 디비전. 하드코어의 정점.",
		"Nuevo Fichaje": "새 영입",
		"Ser presentado ante tu nueva afición por primera vez.": "새 팬들 앞에서 첫 입단식 치르기.",
		"Diez Mil Curiosos": "구경꾼 1만 명",
		"10.000 personas fueron a tu presentación.":
			"입단식에 1만 명이 왔어요.",
		"No Cabe Un Alma": "빈자리 하나 없이",
		"Llenar el estadio el día de tu presentación, sin haber jugado un solo minuto.":
			"1분도 뛰지 않고 입단식 날 경기장 가득 채우기.",
		"'Forty Thousand' (14) se pasa del español (12); el número mantiene el"
		+ " anchoCuarenta Mil":
			"4만 관중",
		"40.000 personas fueron a verte firmar.": "4만 명이 내 계약 서명을 보러 왔어요.",
		"Fichaje Galáctico": "갈락티코 영입",
		"Que 65.000 personas vayan a tu presentación. Dejar de ser un jugador para ser una noticia.":
			"입단식에 6만 5천 명 모으기. 선수를 넘어 뉴스가 되기.",
		"Ochenta Mil Almas": "8만의 영혼",
		"Que 80.000 personas llenen el estadio SÓLO para verte llegar. Ni un partido, ni un gol: tu nombre.":
			"오직 내 도착을 보려고 8만 명이 경기장을 채우기. 경기도 골도 아닌, 내 이름으로.",
		"Siempre Te Esperan": "언제나 기다리는 팬",
		"Llenar el estadio en TRES presentaciones distintas.": "서로 다른 입단식 세 번에서 경기장 가득 채우기.",


		"Rompelíneas": "라인 브레이커",
		"Ganar tu primer regate.": "첫 드리블 성공하기.",
		"Bailarín": "댄서",
		"25 regates ganados.": "드리블 25회 성공.",
		"Imparable": "언스토퍼블",
		"100 regates ganados.": "드리블 100회 성공.",
		"Agónico": "극장골",
		"Marcar en el minuto 85 o después.": "85분 이후에 골 넣기.",
		"Rey del Descuento": "추가 시간의 왕",
		"10 goles del minuto 85 en adelante.": "85분 이후 10골.",
		"Noche de Remontada": "역전의 밤",
		"Ganar un partido en el que llegues a ir perdiendo por 2 goles.":
			"2골 차로 지고 있던 경기 이기기.",
		"Orgullo de la Ciudad": "도시의 자랑",
		"Ganar tu primer derbi.": "첫 더비 승리하기.",
		"El Gol que Vale Doble": "두 배의 가치",
		"Marcar en un derbi.": "더비에서 골 넣기.",
		"Rey del Derbi": "더비의 왕",
		"Ganar 5 derbis.": "더비 5승.",
		"Millonario": "백만장자",
		"Juntar 1.000.000 en el banco.": "은행에 1,000,000 모으기.",
		"Magnate": "거물",
		"Juntar 10.000.000 en el banco.": "은행에 10,000,000 모으기.",
		"Imagen de Marca": "브랜드의 얼굴",
		"Firmar tu primer contrato de patrocinio.": "첫 스폰서 계약 맺기.",
		"Hombre Anuncio": "광고판 사나이",
		"Firmar 10 contratos de patrocinio.": "스폰서 계약 10건 맺기.",
		"Vida de Futbolista": "축구 선수의 삶",
		"Comprar tu primer artículo de estilo de vida.": "첫 라이프스타일 아이템 구매하기.",
		"Inversor": "투자자",
		"Hacer tu primera inversión.": "첫 투자 하기.",
		"Hombre del Vestuario": "라커룸의 남자",
		"Responder 25 decisiones.": "결정 25번 내리기.",
		"La Voz del Equipo": "팀의 목소리",
		"Responder 100 decisiones.": "결정 100번 내리기.",
		"Vía Bosman": "보스만 루트",
		"Firmar por un club siendo agente libre, sin traspaso de por medio.":
			"이적료 없이 자유 계약 선수로 클럽과 계약하기.",
		"Nunca te Enamores de un Cedido": "임대생에게 반하지 마라",
		"Ser elegido Mejor Jugador del Club en el equipo donde juegas cedido.": "임대 간 팀에서 클럽 시즌 최우수 선수로 선정되기.",
		"Ida y Vuelta": "갔다가 돌아오기",
		"Completar una cesión entera y volver a tu club.": "임대 기간을 다 채우고 원 소속 클럽으로 복귀하기.",
		"Pasaporte Sellado": "도장 찍힌 여권",
		"Jugar en clubes de 3 países distintos.": "서로 다른 3개 나라의 클럽에서 뛰기.",
		"Ciudadano del Mundo": "세계 시민",
		"Jugar en clubes de 5 países distintos.": "서로 다른 5개 나라의 클럽에서 뛰기.",
		"Segunda Vida": "두 번째 인생",
		"Cerrar una carrera entera (hasta el retiro) con un modificador de Nueva Carrera+ activo.":
			"새 커리어+ 모디파이어를 켠 채 커리어 하나를 은퇴까지 마치기.",
		"Primera Vitrina": "첫 진열장",
		"Desbloquear todos los logros comunes.": "일반 업적 모두 해금하기.",
		"Vitrina Azul": "파란 진열장",
		"Desbloquear todos los logros raros.": "레어 업적 모두 해금하기.",
		"título (sale en 2 entradas: entrevista y plato_o_descanso)TE QUIEREN EN EL"
		+ " PLATÓ":
			"방송 출연 요청",
		"La televisión te invita a la entrevista de la semana. Media tarde de foco,"
		+ " preguntas y sonrisas.":
			"TV에서 이번 주 메인 인터뷰에 초대했어요. 조명과 질문과 미소로 보내는 반나절이에요.",
		"ACUDIR": "출연",
		"PLANTARLES": "바람 맞히기",
		"ACTO DE TU PATROCINADOR": "스폰서 행사",
		"Tu marca monta una firma de autógrafos y te quiere ahí. Pagan aparte, pero es"
		+ " un día entero.":
			"스폰서가 사인회를 열고 나를 원해요. 따로 돈을 주지만, 하루를 통째로 써야 해요.",
		"IR AL ACTO": "행사 참석",
		"también en benefico_ciudad (línea 276, fuera de mi rango)EXCUSARTE":
			"핑계 대기",

		"LA HUELGA DE PRIMAS": "보너스 파업",
		"El club debe tres meses de primas y la plantilla ha decidido no salir a"
		+ " calentar. El míster está en el túnel mirando el reloj, y hay una cámara en"
		+ " la boca del vestuario.":
			"클럽이 3개월째 보너스를 안 줘서 선수단이 몸 풀러 나가지 않기로 했어요. 감독은 터널에서 시계를 보고 있고, 라커룸 입구엔 카메라가 있어요.",
		"SUMARTE AL PARO": "파업 동참",
		"SALIR A CALENTAR SOLO": "혼자 몸 풀기",
		"LA FINAL ES EL SÁBADO": "결승은 토요일",
		"El parte médico dice que no llegas. El míster te lo pide a la cara, delante"
		+ " del cuerpo técnico, y el doctor niega con la cabeza sin decir nada.":
			"진료 기록상으로는 출전이 어려워요. 감독은 코치진 앞에서 직접 부탁하고, 팀 닥터는 말없이 고개를 저어요.",
		"APRETAR LOS DIENTES": "이 악물기",
		"HACERLE CASO AL MÉDICO": "의사 말 듣기",
		"Aguantaste: estás disponible para el partido grande.":
			"버텨 냈어요: 빅 매치에 출전할 수 있어요.",
		"Se rompió del todo. La baja es larga.":
			"완전히 망가졌어요. 오래 쉬어야 해요.",
		"EL EQUIPO VIAJA SIN TI": "팀은 나 없이 원정",
		"El autobús sale a las nueve y tu nombre no está en la lista. El doctor dice"
		+ " que el viaje no te hace bien; el vestuario, que verte en el banquillo les"
		+ " hace bien a ellos.":
			"버스는 9시에 떠나는데 명단에 내 이름이 없어요. 팀 닥터는 이동이 몸에 안 좋다고 하고, 라커룸은 내가 벤치에 있는 게 큰 힘이 된대요.",
		"VIAJAR CON LA EXPEDICIÓN": "원정 동행",
		"QUEDARTE EN REHABILITACIÓN": "남아서 재활",
		"EL PARTE QUE SE FILTRÓ": "유출된 진료 기록",
		"Un diario publica tu parte médico con dos semanas de más y un titular con la"
		+ " palabra «calvario». El club no fue; alguien de dentro, sí.":
			"한 신문이 2주를 부풀린 내 진료 기록을 \"고난\"이라는 제목과 함께 실었어요. 클럽이 아니라 내부의 누군가가 흘렸어요.",
		"DESMENTIRLO A CÁMARA": "카메라 앞 부인",
		"CALLAR Y RECUPERARTE": "침묵하고 회복",
		"EL MÉDICO DE TU AGENTE": "에이전트의 의사",
		"Tu agente te manda la tarjeta de un doctor «que hace milagros» y que no es"
		+ " del club. El médico del club no sabe nada, y mejor que siga así.":
			"에이전트가 클럽 소속이 아닌 \"기적을 일으키는\" 의사의 명함을 보냈어요. 클럽 의사는 아무것도 몰라요. 계속 모르는 게 좋겠죠.",
		"PROBAR EL TRATAMIENTO": "치료 받아 보기",
		"CONFIAR EN EL CLUB": "클럽을 믿기",
		"El milagro existe: dos semanas menos de baja.":
			"기적은 있었어요: 결장 기간이 2주 줄었어요.",
		"Se rompió del todo. Y el club se enteró de dónde.":
			"완전히 망가졌어요. 게다가 클럽이 어디서 치료받았는지 알아냈어요.",
		"CABE UNO MÁS SI TE BAJAS": "연봉 깎으면 한 명 더 가능",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la nómina: el"
		+ " tuyo. Te piden por las buenas un 20% de tu ficha, y el vestuario ya sabe"
		+ " que te lo han pedido.":
			"클럽이 슈퍼스타 영입을 거의 끝냈는데 연봉 총액에 자리가 없어요: 바로 내 몫이요. 주급의 20%를 정중하게 양보해 달래요. 라커룸도 이 요청을 이미 알고 있어요.",
		"BAJARTE EL SUELDO": "주급 삭감 수락",
		"NI UN PESO": "한 푼도 못 깎아",
		"Te bajas la ficha": "주급을 깎았어요",
		"Cobrarás ${0} por partido en vez de ${1}. El club ya tiene su hueco.":
			"경기당 ${1} 대신 ${0} 받게 돼요. 클럽은 필요한 자리를 얻었어요.",
		"EL BANDO DEL BRAZALETE": "주장 완장 쟁탈전",
		"{0} está señalado y el vestuario busca relevo. Suenan dos nombres: el tuyo y"
		+ " el del veterano que lleva once años aquí.":
			"{0} 선수가 비난을 받자 라커룸이 대안을 찾고 있어요. 두 이름이 거론돼요: 내 이름, 그리고 여기서 11년을 뛴 베테랑.",


		"MOVER FICHA POR EL BRAZALETE": "주장 완장 노리기",
		"LA ENTRADA EN EL ENTRENO": "훈련 중 태클",
		"Fuiste a por un balón que no era tuyo y {0}, el que te disputa el puesto, se"
		+ " ha ido al vestuario cojeando y sin mirarte. El grupo lo vio todo.":
			"내 공도 아닌데 달려들었고, 주전 경쟁자 {0} 선수가 나를 쳐다보지도 않고 절뚝이며 라커룸으로 들어갔어요. 다들 다 봤어요.",
		"PEDIR PERDÓN DELANTE DE TODOS": "모두 앞에서 사과",
		"NO DAR EXPLICACIONES": "해명은 필요 없어",
		"EL CHAVAL TE COMIÓ EL PUESTO": "꼬마에게 뺏긴 자리",
		"{0} entró por ti y volvió a hacerlo bien. Te busca al acabar para que le"
		+ " corrijas dos cosas del perfil de tiro. Enseñárselas es enseñárselas.":
			"{0} 선수가 나 대신 들어가 또 잘했어요. 경기 후 찾아와 슈팅 자세 두 가지를 봐 달래요. 가르쳐 주면 그만큼 강해지겠죠.",

		"SE ROMPIÓ EL QUE TE PELEA EL PUESTO": "경쟁자 부상 이탈",
		"{0} se rompió en el entreno y el puesto es tuyo hasta nuevo aviso. El vestuario mira a ver qué cara pones.":
			"{0} 선수가 훈련 중 부상을 당해 당분간 그 자리는 내 거예요. 라커룸이 내 표정을 살피고 있어요.",
		"LLEVARLE LA REHABILITACIÓN": "재활 도와주기",
		"APROVECHAR EL HUECO": "기회 잡기",
		"EL CAPITÁN TE SIENTA": "주장의 호출",
		"{0} te aparta antes del entreno con el brazalete en la mano: dice que el grupo"
		+ " está harto de tu forma de celebrar, y que te lo dice él antes de que te lo"
		+ " diga otro.":
			"{0} 선수가 훈련 전 완장을 손에 들고 나를 따로 불렀어요: 다들 내 세리머니에 질렸대요. 다른 사람이 말하기 전에 자기가 먼저 말하는 거래요.",
		"BAJAR LA CABEZA": "고개 숙이기",
		"CONTESTARLE DELANTE DE TODOS": "모두 앞에서 맞받아치기",

		"LA VUELTA AL CAMPO": "우승 세리머니 한 바퀴",
		"Campeón. La copa pesa de verdad y el estadio no se va a ir a ninguna parte."
		+ " Queda una vuelta al campo y todos esperan que se la des a alguien.":
			"우승. 트로피는 정말 무겁고 경기장은 아무 데도 안 가요. 이제 한 바퀴 돌 차례, 다들 누군가에게 바치길 기다려요.",
		"LEVANTARLA ANTE EL FONDO": "우리 팬석 앞에서 들기",
		"QUE LA LEVANTE EL GRUPO": "동료들이 들게 하기",
		"LLEVÁRSELA AL MÍSTER": "감독에게 바치기",
		"LA CIUDAD ESTÁ EN LA CALLE": "도시가 거리로 나왔어요",
		"Ascenso. Hay gente en la avenida desde antes de que acabara el partido, un"
		+ " autobús descapotable esperando y un micrófono que va a llegar a todas"
		+ " las casas.":
			"승격. 경기가 끝나기도 전에 대로에 사람들이 몰렸고, 오픈탑 버스가 기다리고, 마이크 하나가 모든 집에 닿을 거예요.",
		"PROMETER QUE TE QUEDAS": "잔류 약속하기",
		"NOMBRAR UNO A UNO AL VESTUARIO": "동료 이름 하나씩 부르기",
		"PEDIR REFUERZOS EN DIRECTO": "생방송으로 보강 요구",
		"EL MEJOR DEL MUNDO": "세계 최고",
		"Jugador del Año. Estás de pie con el trofeo en la mano, la sala en silencio y"
		+ " treinta segundos que se van a repetir el resto de tu carrera.":
			"올해의 선수. 트로피를 손에 들고 서 있어요. 장내는 조용하고, 이 30초는 커리어 내내 다시 재생될 거예요.",
		"A LOS QUE TE PASAN EL BALÓN": "패스해 준 동료들에게",
		"A LA GENTE QUE TE VIO EMPEZAR": "시작을 지켜본 분들께",
		"AL CAMINO QUE TE TRAJO AQUÍ": "여기까지 온 길에게",
		"EL MEJOR DE LA TEMPORADA": "시즌 MVP",
		"Te dan el premio al mejor del año y hay que decir algo. La sala está llena"
		+ " de gente que decide cosas sobre ti: tu club, tu competición y los que"
		+ " escriben.":
			"올해의 선수상을 받았으니 한마디 해야 해요. 장내엔 나에 대해 결정하는 사람들로 가득해요: 클럽, 대회 관계자, 그리고 기사를 쓰는 사람들.",
		"HABLAR DEL EQUIPO QUE TE SOSTUVO": "버텨 준 팀 이야기",
		"AGRADECER AL MÍSTER QUE TE PUSO": "기용해 준 감독께 감사",
		"DEDICÁRSELO A LA GRADA": "관중석에 바치기",

		"LA CIUDAD ES TUYA": "도시는 내 거야",
		"Ganasteis el derbi. Hay gente esperando el autobús en la puerta, esta vez"
		+ " para llevaros en volandas, y mañana no se va a hablar de otra cosa en"
		+ " toda la ciudad.":
			"더비에서 이겼어요. 이번엔 헹가래를 치려고 사람들이 문 앞에서 버스를 기다리고, 내일 도시 전체가 이 얘기뿐일 거예요.",
		"CELEBRARLO EN LA VALLA": "펜스 앞 세리머니",
		"DECIR QUE SÓLO SON TRES PUNTOS": "그저 승점 3점일 뿐",
		"DEDICÁRSELO AL VESTUARIO": "라커룸에 바치기",


		"selección": "대표팀",
		"competidor": "경쟁자",
		"TU PRIMERA VEZ CON TU PAÍS": "첫 A매치",
		"Debutaste con la selección. En el túnel te esperan la cámara de tu país y el"
		+ " utillero con la camiseta del partido, que se guarda o se regala.":
			"대표팀 데뷔를 했어요. 터널에서 조국의 방송 카메라와 경기 유니폼을 든 장비 담당이 기다려요. 간직할 수도, 선물할 수도 있어요.",
		"ENMARCARLA PARA TU FAMILIA": "액자에 넣어 가족에게",
		"REGALÁRSELA AL SELECCIONADOR": "대표팀 감독에게 선물",
		"SUBIRLA A TUS REDES": "SNS에 올리기",
		"EL SELECCIONADOR TE APARTA": "대표팀 감독의 호출",
		"Al acabar te lleva a un lado, lejos del grupo. Puedes escuchar lo que tenga"
		+ " que decirte, o aprovechar los dos minutos para pedirle el puesto de"
		+ " titular.":
			"경기 후 감독이 나를 동료들과 떨어진 곳으로 데려가요. 할 말을 들어도 되고, 그 2분을 이용해 선발 자리를 요구해도 돼요.",
		"ESCUCHAR Y CALLAR": "듣고 침묵하기",
		"PEDIRLE EL PUESTO": "선발 요구",
		"Le gustó tu descaro: cuenta contigo.": "당돌함이 마음에 들었대요: 나를 계획에 넣었어요.",
		"No era el momento ni el sitio. Tomó nota.":
			"때와 장소가 틀렸어요. 감독이 기억해 뒀어요.",
		"TU CLUB TE RECLAMA": "클럽의 복귀 요청",
		"Tu club llamó a la federación: quieren que vuelvas en el primer vuelo y te"
		+ " saltes el segundo partido. El seleccionador te deja elegir a ti, que es la"
		+ " peor parte.":
			"클럽이 협회에 연락했어요: 첫 비행기로 돌아와 두 번째 경기는 빠지래요. 대표팀 감독은 나에게 선택을 맡겼어요. 그게 제일 괴로워요.",
		"VOLVER AL CLUB": "클럽으로 복귀",
		"QUEDARTE CON TU PAÍS": "대표팀에 남기",
		"MARCASTE CON TU PAÍS": "대표팀에서 골!",
		"Gol con la camiseta de tu selección y un micrófono de tu país esperándote. Se"
		+ " puede repartir de tres maneras, y las tres se oyen en tu casa.":
			"대표팀 유니폼을 입고 넣은 골, 그리고 고국의 마이크가 기다려요. 공을 돌리는 방법은 세 가지, 셋 다 우리 집에서도 들려요.",
		"AL PAÍS QUE TE VIO NACER": "나를 낳아 준 조국에",
		"AL SELECCIONADOR QUE TE LLAMÓ": "불러 준 대표팀 감독께",
		"AL CLUB QUE TE PAGA": "월급 주는 클럽에",
		"LA PRENSA DE TU PAÍS": "고국의 언론",
		"Perdisteis y el país entero pide explicaciones. Te esperan en zona mixta con"
		+ " la pregunta ya escrita: quién tuvo la culpa.":
			"경기에 졌고 온 나라가 해명을 원해요. 믹스트 존에서 이미 질문을 준비해 두고 기다려요: 누구 탓이냐고.",
		"DAR LA CARA POR EL GRUPO": "팀을 대신해 나서기",
		"DECIR QUE TÚ CUMPLISTE": "내 몫은 했다고 말하기",
		"NOVENTA MINUTOS MIRANDO": "90분 내내 구경만",
		"Viajaste medio mundo para calentar dos veces y volver a sentarte. Tu agente"
		+ " quiere que se sepa; el segundo entrenador te ha visto la cara desde el"
		+ " banquillo.":
			"지구 반 바퀴를 날아가 몸만 두 번 풀고 다시 앉았어요. 에이전트는 이걸 알리고 싶어 하고, 수석코치는 벤치에서 내 표정을 보고 있었어요.",
		"APLAUDIR DESDE EL BANCO": "벤치에서 박수",
		"QUE SE ENTERE TU AGENTE": "에이전트에게 맡기기",
		"AYUDARLE": "도와주기",
		"CERRARLE LA PUERTA": "문 닫기",
		"LA CAMISETA DEL RIVAL": "상대의 유니폼",
		"Su estrella se acerca en el túnel y te ofrece cambiar camisetas. Hay veinte"
		+ " cámaras esperando el gesto, y la grada de tu fondo sigue ahí arriba.":
			"상대 팀 스타가 터널에서 다가와 유니폼 교환을 제안해요. 카메라 20대가 그 장면을 기다리고, 우리 팬석은 아직 저 위에 있어요.",
		"CAMBIARLA DELANTE DE TODOS": "모두 앞에서 교환",
		"DEJARLE CON LA MANO TENDIDA": "내민 손 무시하기",








		"ALGUIEN EN LA MESA DE AL LADO": "옆 테이블의 누군가",
		"Cena del club, y la conversación de tu mesa lleva una hora girando"
		+ " alrededor de {0}. Te está mirando desde hace rato.":
			"클럽 회식, 우리 테이블은 한 시간째 {0} 얘기뿐이에요. 그녀가 아까부터 이쪽을 보고 있어요.",
		"ACERCARTE": "다가가기",







		"TE LA QUIEREN PRESENTAR": "소개해 주고 싶대요",
		"Un compañero insiste toda la semana: {0} es amiga de su mujer y ya le"
		+ " habló de ti. Sólo tienes que decir que sí.":
			"동료가 일주일 내내 졸라요: {0}, 그의 아내 친구인데 벌써 내 얘기를 들었대요. 좋다고만 하면 돼요.",
		"QUE SEA EL SÁBADO": "토요일로 하자",
		"NO ESTÁS PARA ESO": "지금은 아니야",
		"TE ESPERABA EN LA PUERTA": "문 앞에서 기다린 그녀",
		"LA INAUGURACIÓN": "개막식의 밤",
		"Tu marca te lleva a la inauguración de una exposición y no entiendes ni uno de los"
		+ " cuadros. {0} lleva veinte minutos delante del mismo, y acaba de darse cuenta"
		+ " de que la miras a ella.":
			"스폰서가 전시회 개막식에 데려갔는데 그림이 하나도 이해가 안 돼요. 20분째 같은 그림 앞에 서 있던 {0}, 방금 내 시선을 알아챘어요.",
		"PREGUNTARLE QUÉ VE": "뭐가 보이는지 묻기",
		"VOLVER CON LOS TUYOS": "일행에게 돌아가기",
		"{0} llevaba dos horas en la puerta de jugadores. No traía camiseta que"
		+ " firmar: traía su número escrito en un papel.":
			"{0}, 선수 출입구에서 두 시간째 기다렸어요. 사인받을 유니폼은 없었어요: 쪽지에 적은 전화번호만 있었어요.",
		"GUARDARTE EL PAPEL": "쪽지 챙기기",
		"SUBIR AL AUTOBÚS": "버스 타기",
		"LA LLAVE DE TU CASA": "우리 집 열쇠",
		"{0} lleva media semana durmiendo aquí y sus cosas ya ocupan un cajón."
		+ " Alguien tiene que decirlo en voz alta.":
			"{0}, 일주일의 절반을 여기서 자고 짐이 서랍 하나를 차지했어요. 누군가는 소리 내서 말해야 해요.",
		"PEDIRLE QUE SE MUDE": "같이 살자고 하기",
		"TODAVÍA NO": "아직은 아냐",
		"LA CENA QUE LE DEBES": "약속한 저녁 식사",
		"Reservaste hace tres semanas y hoy es la noche. También es la noche del"
		+ " vídeo del rival, que el técnico mandó a todo el plantel.":
			"3주 전에 예약한 날이 바로 오늘이에요. 감독이 선수단 전원에게 보낸 상대 분석 영상을 봐야 하는 날이기도 해요.",
		"IR A CENAR": "저녁 먹으러",
		"VER EL VÍDEO": "영상 보기",
		"OTRA SEMANA FUERA": "또 일주일 원정",
		"Cuatro días de concentración, el tercer viaje del mes. {0} ya no"
		+ " pregunta cuándo vuelves: mira el calendario y se calla.":
			"4일간의 합숙, 이번 달 세 번째 원정. {0}, 이제 언제 오냐고 묻지도 않아요: 달력만 보고 말이 없어요.",
		"LLAMARLA CADA NOCHE": "매일 밤 전화하기",
		"CONCENTRARTE EN EL PARTIDO": "경기에 집중",
		"SU CUMPLEAÑOS ES HOY": "오늘은 그녀의 생일",
		"Es el cumpleaños de {0} y hay treinta personas en tu casa. Mañana a las"
		+ " nueve hay partido y el técnico avisó de que mirará las caras.":
			"{0}의 생일이라 집에 30명이 와 있어요. 내일 9시에 경기가 있고, 감독은 표정을 보겠다고 했어요.",
		"QUEDARTE HASTA EL FINAL": "끝까지 남기",
		"SUBIR A DORMIR": "자러 올라가기",
		"HAY QUE HABLAR": "얘기 좀 해",
		"{0} apagó la televisión en mitad del resumen de la jornada y se sentó"
		+ " enfrente. Esta conversación llevaba meses pendiente.":
			"{0}, 라운드 하이라이트 도중 TV를 끄고 맞은편에 앉았어요. 몇 달째 미뤄 온 대화예요.",
		"ESCUCHARLA ENTERA": "끝까지 듣기",
		"DECIRLE QUE NO ES EL MOMENTO": "지금은 때가 아니라고 하기",
		"TE ESPERÓ DESPIERTA": "자지 않고 기다린 그녀",
		"Son las dos de la mañana, perdisteis, y {0} sigue despierta en la cocina"
		+ " con dos platos servidos. No preguntó por el partido.":
			"새벽 2시, 경기에 졌어요. 부엌에는 아직 깨어 있는 {0}, 그리고 차려 둔 두 접시. 경기 얘기는 묻지 않았어요.",
		"SENTARTE A CENAR": "앉아서 먹기",
		"IRTE DERECHO A LA CAMA": "바로 침대로",
		"LA FOTO DEL DOMINGO": "일요일의 화보",
		"Una revista ofrece portada: tú y {0}, en casa, ocho páginas. Pagan bien"
		+ " y a ella la fotografiarían por primera vez.":
			"잡지에서 표지를 제안해요: 나와 {0}, 집에서, 8페이지. 보수도 좋고, 그녀는 처음으로 카메라 앞에 서게 돼요.",
		"ACEPTAR LA PORTADA": "표지 촬영 수락",
		"PROTEGERLA": "그녀 보호",
		"ELLA QUIERE SALIR": "놀러 가고 싶은 그녀",
		"Ganasteis y {0} ya tiene mesa reservada para las dos de la mañana."
		+ " Mañana hay recuperación a las nueve.":
			"경기에 이겼고 {0}의 새벽 2시 테이블 예약은 이미 끝났어요. 내일 9시엔 회복 훈련이 있어요.",
		"SALIR CON ELLA": "같이 나가기",
		"MAÑANA HAY TRABAJO": "내일 훈련 있어",
		"LA GIRA DE PRETEMPORADA": "프리시즌 투어",
		"Tres semanas al otro lado del mundo. El club permite acompañantes, pero"
		+ " el vestuario mira raro al que viaja con pareja.":
			"지구 반대편에서 3주. 클럽은 동반을 허락하지만, 라커룸은 애인을 데려오는 선수를 곱게 보지 않아요.",
		"QUE VENGA CONTIGO": "같이 가기",
		"IR SOLO": "혼자 가기",
		"SE ACABÓ": "끝이야",
		"Las maletas de {0} llevan dos días en el recibidor y esta vez no las"
		+ " está deshaciendo. Lo que queda por decidir no es si se va: es cómo.":
			"{0}의 가방이 이틀째 현관에 있고, 이번엔 풀지 않아요. 남은 건 떠날지가 아니라 어떻게 떠날지예요.",
		"SUPLICARLE DELANTE DE TODOS": "모두 앞에서 붙잡기",
		"DECIRLE QUE ERA SU DECISIÓN": "그녀의 결정이라고 하기",
		"DEJAR QUE LO CUENTE ELLA": "그녀가 말하게 두기",

		"Vivís juntos: ${0} por partido.": "동거 중: 경기당 ${0}.",
		"Estáis empezando. Todavía no vive contigo.":
			"이제 막 시작했어요. 아직 같이 살진 않아요.",
		"ASADO DEL VESTUARIO": "선수단 바비큐",
		"Los veteranos organizan un asado y te toca poner la carne. Caro, pero ahí se"
		+ " hacen los amigos.":
			"고참들이 바비큐를 여는데 고기 담당이 나예요. 비싸지만, 친구는 거기서 생겨요.",
		"PAGAR EL ASADO": "바비큐 쏘기",
		"NO HAY TIEMPO": "시간 없음",
		"EL TÉCNICO TE LLAMA": "감독의 호출",
		"EL MÍSTER TIENE UNA IDEA": "감독의 아이디어",
		"Te enseña la pizarra con tu nombre fuera de tu sitio de siempre: te ve de {0}. Dice que ahí hay hueco y que lo llenas tú.": "작전판을 보여 주는데 내 이름이 늘 있던 자리 밖에 있어요: 나를 {0} 포지션으로 보고 있대요. 거기 빈자리가 있고 내가 채울 거래요.",
		"ACEPTAR EL CAMBIO": "변경 수락",
		"PEDIR GARANTÍAS": "보장 요구",
		"SEGUIR EN LO TUYO": "원래 자리 고수",
		"Te promete el puesto y los minutos.": "자리와 출전 시간을 약속했어요.",
		"No le gustó que le pusieras condiciones.": "조건을 단 게 마음에 들지 않았대요.",
		"Puerta cerrada. Puedes escuchar y asentir, o jugártela y pedirle más"
		+ " protagonismo.":
			"문은 닫혔어요. 듣고 고개를 끄덕일 수도, 모험을 걸고 더 큰 역할을 요구할 수도 있어요.",
		"ESCUCHAR": "듣기",
		"PEDIR MÁS": "더 요구",
		"¡El técnico te compra la idea!": "감독이 내 아이디어를 받아들였어요!",
		"Mala lectura: al técnico no le gustó.": "판단 미스: 감독이 마음에 안 들어했어요.",
		"VISITA A LA CANTERA": "유스 방문",
		"El club organiza una visita a los niños de la cantera y del hospital. Nadie te"
		+ " obliga.":
			"클럽이 유스 아이들과 소아 병동 방문을 준비했어요. 억지로 갈 필요는 없어요.",
		"IR": "GO",
		"DESCANSAR": "휴식",
		"título (sale en 2 entradas: polemica y micro_polemica)UN MICRÓFONO CALIENTE":
			"켜진 마이크",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el equipo?'":
			"기자가 떠봐요: '팀 내 역할에 정말 만족하세요?'",
		"MORDERTE LA LENGUA": "말 아끼기",
		"SOLTARLO": "다 말하기",
		"SALIDA DEL EQUIPO": "팀 회식",
		"El vestuario sale esta noche. Habrá fotos, habrá risas, y mañana habrá"
		+ " entrenamiento.":
			"오늘 밤 라커룸 전원이 놀러 나가요. 사진도 찍고, 웃음도 터지고, 내일은 훈련이 있어요.",
		"IR CON ELLOS": "같이 가기",
		"QUEDARTE": "집에 있기",

		"ALBOROTO EN TU CALLE": "집 앞 소동",
		"Hay aficionados acampados frente a tu casa desde temprano. Los vecinos ya"
		+ " llamaron dos veces.":
			"아침부터 팬들이 집 앞에 진을 치고 있어요. 이웃들이 벌써 두 번이나 신고했어요.",
		"SALIR A FIRMAR": "나가서 사인",
		"CERRAR CORTINAS": "커튼 치기",
		"TU MASCOTA AMANECIÓ MAL": "반려동물이 아파요",
		"No quiso comer y te mira raro. El veterinario bueno atiende hoy... a la"
		+ " hora del entrenamiento de recuperación.":
			"밥도 안 먹고 이상하게 쳐다봐요. 실력 좋은 수의사는 오늘 진료하는데... 하필 회복 훈련 시간이에요.",
		"LLEVARLA AL VETERINARIO": "동물병원 가기",
		"ESPERAR A MAÑANA": "내일까지 기다리기",
		"Falsa alarma: por la tarde ya corría por la casa.":
			"괜한 걱정: 저녁엔 벌써 집 안을 뛰어다녀요.",
		"Mala noche para los dos. No pegaste ojo.":
			"둘 다 힘든 밤이었어요. 한숨도 못 잤어요.",
		"ASADO EN TU JARDÍN": "정원 바비큐",
		"Compraste el asador y el vestuario se enteró. 'El sábado en tu casa',"
		+ " dicen. No era pregunta.":
			"그릴을 산 걸 라커룸이 알아버렸어요. '토요일에 너희 집'이래요. 질문이 아니었어요.",
		"ENCENDER EL ASADOR": "그릴 켜기",


		"TARDE DE PISCINA": "수영장 오후",
		"Hace calor, tu piscina está impecable y media plantilla tiene tu"
		+ " dirección. El timbre va a sonar.":
			"덥고, 수영장은 깨끗하고, 스쿼드 절반이 집 주소를 알아요. 곧 초인종이 울릴 거예요.",
		"ABRIR LA CASA": "집 개방",
		"TARDE PARA TI": "나만의 시간",
		"PEREGRINACIÓN A TU VITRINA": "진열장 성지순례",
		"El club pregunta si puedes recibir a los juveniles en tu mansión: quieren"
		+ " ver la vitrina con sus propios ojos.":
			"클럽에서 대저택에 유스 선수들을 초대할 수 있냐고 물어요. 트로피 진열장을 직접 보고 싶대요.",
		"RECIBIRLOS": "초대하기",
		"OTRA SEMANA": "다음 주에",
		"NOCHE LIBRE": "자유 시간",
		"Tus amigos te esperan para una noche de PlayStation. El técnico ofrece una"
		+ " sesión extra de vídeo y tiros a puerta. No llegas a las dos.":
			"친구들이 게임하자고 기다리고 있어요. 감독은 영상 분석과 슈팅 추가 훈련을 제안해요. 둘 다는 못 해요.",
		"PS4 CON LOS AMIGOS": "친구들과 게임",
		"ENTRENAR CON EL DT": "감독과 훈련",
		"El programa deportivo de la noche te reserva el asiento bueno. O eso, o el"
		+ " sofá de casa con las piernas en alto.":
			"오늘 밤 축구 프로그램이 좋은 자리를 비워 뒀대요. 아니면 집 소파에서 다리 올리고 쉬기.",
		"IR A LA ENTREVISTA": "인터뷰 가기",
		"sale en 2 entradas: plato_o_descanso y dia_libre_tripleDESCANSAR EN CASA":
			"집에서 휴식",
		"TODOS TE BUSCAN": "모두가 널 찾아",
		"A la salida hay dos corros: la afición con camisetas y bufandas, y los"
		+ " periodistas con micrófonos. Solo te da tiempo a uno.":
			"출구에 무리가 둘이에요. 유니폼과 머플러를 든 팬들, 마이크를 든 기자들. 시간은 한쪽뿐이에요.",
		"FIRMAR A LA AFICIÓN": "팬 사인회",
		"ATENDER A LA PRENSA": "언론 응대",
		"DOS CENAS, UNA NOCHE": "한 밤, 두 저녁 약속",
		"Tu agente reservó mesa para hablar de tu futuro. El técnico te invitó a la"
		+ " suya para hablar del equipo. Coinciden a la misma hora.":
			"에이전트가 미래를 얘기하자며 식당을 예약했어요. 감독은 팀 얘기를 하자며 집으로 초대했어요. 둘 다 같은 시간이에요.",
		"CENAR CON TU AGENTE": "에이전트와 식사",
		"CENAR CON EL DT": "감독과 식사",
		"LA TARDE DESPUÉS": "경기 다음 날",
		"El readaptador te espera en el gimnasio para soltar piernas. Tu marca, a la"
		+ " misma hora, monta una firma pagada.":
			"피지컬 코치가 다리를 풀자며 체육관에서 기다려요. 같은 시간, 스폰서 브랜드는 유료 사인회를 열어요.",
		"GIMNASIO": "체육관",
		"ACTO DE LA MARCA": "브랜드 행사",
		"TERCER TIEMPO": "뒤풀이",
		"El vestuario se va a celebrar (o a lamentar) el resultado hasta tarde. En casa"
		+ " te esperaban para cenar tranquilo.":
			"라커룸은 늦게까지 결과를 축하(혹은 한탄)하러 나가요. 집에서는 조용한 저녁을 기다리고 있었어요.",
		"sale en 2 entradas: equipo_o_casa y dia_libre_tripleSALIR CON EL EQUIPO":
			"팀과 외출",
		"NOCHE EN CASA": "집에서 저녁",
		"TE POSTULAN DE CAPITÁN": "주장 후보 지명",
		"El vestuario vota y tu nombre suena para el brazalete. Aceptar es echarte el"
		+ " equipo a la espalda; ceder es un gesto al veterano de siempre.":
			"라커룸 투표에서 주장 완장 후보로 이름이 올랐어요. 수락하면 팀을 짊어지는 거고, 양보하면 늘 완장을 찼던 베테랑에 대한 예우예요.",
		"ACEPTAR EL BRAZALETE": "완장 수락",
		"APOYAR AL VETERANO": "베테랑 지지",
		"QUIEREN TU VIDA PRIVADA": "사생활을 원해요",
		"Una revista ofrece una fortuna por abrir las puertas de tu casa. Tu agente"
		+ " prefiere que sigas siendo un misterio que se cotiza.":
			"한 잡지가 집을 공개하면 거액을 주겠대요. 에이전트는 몸값 높은 미스터리로 남길 바라요.",
		"ABRIR LAS PUERTAS": "문 열기",
		"MANTENER EL MISTERIO": "미스터리 유지",
		"LOS PAPARAZZI": "파파라치",
		"Un fotógrafo lleva días pegado a ti: el coche, el restaurante, la salida del entreno. Anoche te sacó cenando a las tantas y mañana sale en portada.":
			"며칠째 사진기자가 따라붙어요. 차, 식당, 훈련장 출구까지. 어젯밤 늦게 식사하는 모습이 찍혔고, 내일 1면에 나와요.",
		"DENUNCIARLO": "고소하기",
		"EL BAILE DE MODA": "유행 댄스",
		"El community manager del club te persigue para grabar el baile viral del"
		+ " momento. El míster odia esas cosas.":
			"클럽 SNS 담당자가 요즘 유행하는 바이럴 댄스를 찍자고 쫓아다녀요. 감독은 그런 거 질색해요.",
		"GRABAR EL BAILE": "댄스 촬영",
		"NI DE BROMA": "절대 안 해",
		"EL HIJO DEL MÍSTER": "감독의 아들",
		"En el rondo te toca marcar al hijo del técnico, que anda de pruebas. Puedes"
		+ " hacerle un caño de los que duelen o dejarle lucirse.":
			"론도에서 테스트 중인 감독 아들을 마크하게 됐어요. 아픈 알까기를 먹이거나, 돋보이게 해줄 수 있어요.",
		"HACERLE UN CAÑO": "알까기",
		"DEJARLE LUCIRSE": "돋보이게 해주기",
		"UN NIÑO BAJO LA LLUVIA": "빗속의 아이",
		"Sales muerto y llueve, pero un niño lleva dos horas esperando con tu camiseta"
		+ " y un rotulador.":
			"녹초가 돼서 나왔는데 비까지 쏟아져요. 그런데 한 아이가 유니폼과 펜을 들고 두 시간째 기다리고 있어요.",
		"PARARTE A FIRMAR": "멈춰서 사인",
		"AL AUTOBÚS": "버스로",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el"
		+ " equipo?'. Una frase gorda vende titulares, pero el míster lo verá.":
			"기자가 떠봐요: '팀 내 역할에 정말 만족하세요?'. 센 한마디는 헤드라인이 되지만, 감독도 보게 될 거예요.",
		"SOLTARLO TODO": "전부 말하기",
		"¿CON QUIÉN TE SIENTAS?": "누구 옆에 앉을까?",
		"Primer viaje con el equipo. En el autobús quedan tres sitios libres, y con quién te sientas se nota.":
			"팀과의 첫 원정이에요. 버스에 빈자리가 셋 남았고, 누구 옆에 앉는지 다들 지켜봐요.",
		"CON LOS VETERANOS": "베테랑들과",
		"CON EL MÍSTER": "감독과",
		"GRABANDO PARA REDES": "SNS용 촬영",
		"TU PRIMERA ENTREVISTA": "첫 인터뷰",
		"Micrófono delante y una sola pregunta abierta. Lo que digas te retrata.":
			"눈앞에 마이크, 열린 질문 하나. 무슨 말을 하든 그게 내 이미지가 돼요.",
		"DEL EQUIPO": "팀 얘기",
		"DE TUS METAS": "내 목표",
		"DE LA AFICIÓN": "팬 얘기",
		"¿A QUIÉN LO DEDICAS?": "누구에게 바칠까?",
		"Acabas de marcar y la cámara te busca. El gesto que hagas ahora lo verá todo"
		+ " el estadio.":
			"방금 골을 넣었고 카메라가 나를 잡아요. 지금 하는 세리머니를 경기장 전체가 봐요.",
		"AL MÍSTER": "감독에게",
		"A LA GRADA": "관중석에",
		"A CÁMARA, TU MARCA": "카메라에, 내 브랜드",
		"DÍA LIBRE": "휴일",
		"Jornada sin obligaciones. Puedes desconectar en casa, salir con el grupo, o"
		+ " meter horas de gimnasio por tu cuenta.":
			"아무 일정 없는 날이에요. 집에서 푹 쉬거나, 동료들과 나가거나, 혼자 체육관에서 땀 흘릴 수 있어요.",
		"GIMNASIO POR TU CUENTA": "혼자 체육관",
		"LA FOTO DE EQUIPO": "팀 단체 사진",
		"El fotógrafo coloca la foto de plantilla. Hay hueco delante con el capitán, en"
		+ " el centro entre todos, o pegado al cuerpo técnico.":
			"사진기자가 스쿼드 단체 사진 자리를 잡고 있어요. 앞줄 주장 옆, 가운데 모두와 함께, 아니면 코칭스태프 바로 옆.",
		"DELANTE, PROTAGONISTA": "앞줄, 주인공",
		"EN EL CENTRO, CON TODOS": "가운데, 다 같이",
		"AL LADO DEL MÍSTER": "감독 옆",
		"TRES MARCAS TE TANTEAN": "브랜드 세 곳의 러브콜",
		"Tres patrocinadores mueven ficha a la vez: la deportiva de siempre, una firma"
		+ " de moda, y la marca local de tu ciudad.":
			"스폰서 세 곳이 동시에 움직여요. 늘 입던 스포츠 브랜드, 패션 브랜드, 그리고 고향의 로컬 브랜드.",
		"LA DEPORTIVA": "스포츠웨어",
		"LA DE MODA": "패션",
		"LA LOCAL": "로컬",
		"¿QUÉ SUBES A TUS REDES?": "SNS에 뭘 올릴까?",
		"Foto lista para publicar tras el partido. Un gesto para la grada, un elogio al"
		+ " vestuario, o un guiño al míster.":
			"경기 후 올릴 사진이 준비됐어요. 관중석에 인사, 라커룸 칭찬, 아니면 감독에게 윙크.",
		"GUIÑO A LA AFICIÓN": "팬들에게 인사",
		"ELOGIO AL VESTUARIO": "동료들 칭찬",
		"GRACIAS, MÍSTER": "감사해요, 감독님",
		"NOVATADA EN LA COMIDA": "신입 신고식",
		"Primera comida con la plantilla y toca ritual de novato: subirte a la silla a"
		+ " cantar, o marcarte un baile. Elige tu veneno y reza.":
			"스쿼드와의 첫 식사, 신입 신고식 시간이에요. 의자에 올라가 노래하거나, 춤을 추거나. 골라서 기도하세요.",
		"CANTAR": "노래",
		"Te saliste: el vestuario te corea de pie.":
			"대박: 라커룸이 일어나서 떼창해요.",
		"Desafinaste fatal. Qué vergüenza ajena.": "음이탈 대참사. 보는 사람이 다 민망해요.",
		"BAILAR": "춤",
		"¡La rompiste! Hasta el utillero lo grabó.":
			"찢었다! 장비 담당까지 찍었어요.",
		"Bailaste terrible. No lo superan.": "춤이 처참했어요. 두고두고 놀릴 거예요.",
		"RETO VIRAL DE DOMINADAS": "리프팅 챌린지",
		"Un compañero saca el móvil: reto de toques al balón para subirlo a redes. La"
		+ " cámara ya está grabando.":
			"동료가 휴대폰을 꺼내요. SNS에 올릴 리프팅 챌린지예요. 카메라는 이미 돌고 있어요.",
		"INTENTARLO": "도전",
		"¡Clip perfecto! Se hace viral.": "완벽한 클립! 바로 바이럴.",
		"Se te cae a la segunda. Meme asegurado.":
			"두 번째 터치에 떨궜어요. 밈 확정.",
		"NO ME LA JUEGO": "안 할래",
		"El crack del vestuario te reta a la consola delante de todos. Ganarle da"
		+ " galones; perder, cachondeo para semanas.":
			"라커룸 에이스가 모두 앞에서 게임 대결을 신청해요. 이기면 인정받고, 지면 몇 주는 놀림감이에요.",
		"ACEPTAR EL DUELO": "대결 수락",
		"¡Le ganas en la prórroga! Respeto total.":
			"연장전에서 이겼어요! 완전 리스펙.",
		"Paliza. Te lo recordarán a diario.": "참패. 매일 듣게 될 거예요.",
		"OTRO DÍA": "다음에",
		"NOCHE DE CASINO": "카지노의 밤",
		"Tu agente te lleva al casino a 'hacer contactos'. La ruleta llama y él te"
		+ " anima a mojarte.":
			"에이전트가 '인맥 쌓자'며 카지노에 데려왔어요. 룰렛이 부르고, 에이전트는 걸어보라고 부추겨요.",
		"APOSTAR FUERTE": "크게 베팅",
		"¡Pleno! El agente te mira con otros ojos.":
			"적중! 에이전트가 다시 보네요.",
		"Lo dejas todo en la mesa. Ay.": "테이블에 몽땅 털렸어요. 아이고.",
		"SOLO MIRAR": "구경만",
		"UN PRONÓSTICO ATREVIDO": "과감한 예측",
		"En directo te piden mojarte con el próximo gran partido. Acertar te hace"
		+ " profeta; fallar, el hazmerreír.":
			"생방송에서 다음 빅매치 예측을 요구해요. 맞히면 예언자, 틀리면 웃음거리예요.",
		"MOJARTE": "예측하기",
		"Clavaste el pronóstico. Portada.": "예측 적중. 1면 장식.",
		"Ni una. Los memes no perdonan.": "하나도 못 맞혔어요. 밈은 자비가 없어요.",
		"AGUA, NI ME MOJO": "중립 지키기",
		"DUELO DE PENALTIS": "승부차기 대결",
		"ACEPTAR": "수락",
		"Le ganas la tanda. Ovación del grupo.": "승부차기에서 이겼어요. 다들 환호해요.",
		"Te para tres. Sonrojo.": "세 개나 막혔어요. 얼굴이 화끈.",
		"A LA DUCHA": "샤워하러",
		"KARAOKE DE CONCENTRACIÓN": "합숙 노래방",
		"Noche de karaoke en la concentración. Todos esperan a ver si te atreves con el"
		+ " micro.":
			"합숙 중 노래방의 밤이에요. 다들 마이크를 잡을 용기가 있는지 지켜봐요.",
		"COGER EL MICRO": "마이크 잡기",
		"¡Estrella de la noche! Grupo rendido.":
			"오늘 밤의 스타! 다들 반했어요.",
		"Un desastre. Y alguien lo grabó.": "대참사. 게다가 누가 찍었어요.",
		"PASAR EL MICRO": "마이크 넘기기",
		"ESTRENAR BAILE DE GOL": "새 골 세리머니",
		"El vestuario te pincha para que te inventes una celebración nueva para el"
		+ " próximo gol. O sale icónica, o sale ridícula.":
			"라커룸이 다음 골 때 쓸 새 세리머니를 만들라고 부추겨요. 전설이 되거나, 웃음거리가 되거나.",
		"INVENTARME UNO": "하나 만들기",
		"¡Se copia en todos los patios! Icónico.": "온 동네 운동장이 따라 해요! 전설.",
		"Ridículo total. Mejor no marcar.": "완전 우스꽝스러워요. 차라리 골을 넣지 마요.",
		"CELEBRAR NORMAL": "평소대로",
		"LA CENA LA PAGAS TÚ": "저녁은 네가 쏴",
		"Victoria y el vestuario mira al recién llegado: la cena de celebración la paga el nuevo. Es tradición, y es cara.":
			"승리하자 라커룸이 신입을 쳐다봐요. 축하 회식은 새로 온 선수가 쏘는 거래요. 전통이고, 비싸요.",
		"PAGAR CON GUSTO": "기꺼이 계산",
		"ESCAQUEARTE": "슬쩍 빠지기",
		"FUISTE LA FIGURA": "오늘의 주인공",
		"Ganasteis y todos preguntan por ti. La sala de prensa está llena y tienes las"
		+ " piernas fundidas.":
			"이겼고 다들 나를 찾아요. 기자회견실은 꽉 찼고 다리는 풀렸어요.",
		"ATENDER A TODOS": "모두 응대",
		"DIRECTO A CASA": "곧장 집으로",
		"BUSCANDO CULPABLES": "책임 공방",
		"Derrota y el vestuario arde. El míster pide explicaciones mirando a los ojos."
		+ " Puedes dar la cara o mirar al suelo.":
			"패배 후 라커룸이 불타요. 감독이 눈을 보며 해명을 요구해요. 정면으로 맞서거나 바닥만 보거나.",
		"DAR LA CARA": "정면 돌파",
		"MIRAR AL SUELO": "고개 숙이기",
		"BRONCA EN EL VESTUARIO": "라커룸 언쟁",
		"Tras perder, el capitán monta un pollo y señala a los que no corrieron. Puedes"
		+ " respaldarle o quedarte callado.":
			"패배 후 주장이 폭발해서 안 뛴 선수들을 지목해요. 주장 편을 들거나 입을 다물 수 있어요.",
		"RESPALDAR AL CAPITÁN": "주장 지지",
		"CALLAR Y AGUANTAR": "입 다물기",
		"PREGUNTA ENVENENADA": "함정 질문",
		"Recién perdido, un periodista te empuja a cargar contra el árbitro. Un titular"
		+ " fácil, pero el técnico odia el circo.":
			"방금 졌는데 기자가 심판을 비난하라고 부추겨요. 쉬운 헤드라인이지만, 감독은 소란을 질색해요.",
		"CONTENERTE": "참기",
		"CARGAR CONTRA TODO": "전부 비판",
		"GANASTE EL DERBI": "더비 승리",
		"El derbi cayó de tu lado y la ciudad es una fiesta. La grada corea tu nombre y"
		+ " te invitan a salir a celebrar hasta el amanecer.":
			"더비를 잡았고 도시 전체가 축제예요. 관중석은 내 이름을 연호하고, 다들 해 뜰 때까지 놀자고 해요.",
		"CELEBRAR CON LA GRADA": "팬들과 축하",
		"CELEBRAR CON MODESTIA": "조용히 축하",
		"EL RETO DEL DERBI": "더비 내기",
		"Antes del derbi el vestuario se retó: el que marque, se rapa. Marcaste. Ahora toca cumplir delante de las cámaras… o rajarte.":
			"더비 전에 라커룸이 내기를 했어요. 골 넣는 사람이 삭발하기로. 내가 넣었어요. 카메라 앞에서 약속을 지킬까요… 아니면 꽁무니를 뺄까요.",
		"CUMPLIR Y RAPARTE": "약속대로 삭발",
		"¡Leyenda del vestuario! La grada lo adora.":
			"라커룸 레전드! 관중석이 열광해요.",
		"El corte sale fatal. Cachondeo eterno.":
			"머리가 엉망이 됐어요. 평생 놀림감.",
		"RAJARTE": "꽁무니 빼기",
		"MOLESTIA A CUESTAS": "통증을 안고",
		"Arrastras una molestia. El médico aconseja parar; el míster quiere verte en el"
		+ " próximo entreno fuerte, sin excusas.":
			"통증이 계속돼요. 의사는 쉬라는데, 감독은 다음 강훈련에 무조건 나오래요.",
		"FORZAR POR EL MÍSTER": "감독 위해 강행",
		"HACER CASO AL MÉDICO": "의사 말 듣기",
		"TU CIUDAD TE LLAMA": "고향이 불러요",
		"Tu ciudad natal organiza un partido benéfico y quieren tu cara en el cartel."
		+ " Es un día entero fuera.":
			"고향에서 자선 경기를 여는데 포스터 모델이 돼 달래요. 하루를 통째로 비워야 해요.",
		"IR AL BENÉFICO": "자선 경기 출전",
		"EXCUSARTE": "정중히 사양",
		"ELIGES DORSAL": "등번호 선택",
		"El utillero te deja elegir número: el 10 mediático que todos miran, el del"
		+ " ídolo que se retiró, o uno humilde de currante.":
			"장비 담당이 등번호를 고르래요. 모두가 주목하는 10번, 은퇴한 우상의 번호, 아니면 묵묵한 일꾼의 번호.",
		"EL 10 MEDIÁTICO": "화제의 10번",
		"EL DEL ÍDOLO": "우상의 번호",
		"UNO DISCRETO": "조용한 번호",
		"CAMPEONATO DE DARDOS": "다트 챔피언십",
		"En la concentración montan un torneo de dardos con piques de por medio. El que"
		+ " gana, manda esa semana.":
			"합숙에서 신경전 가득한 다트 대회가 열려요. 우승자가 그 주를 지배해요.",
		"APUNTARTE": "참가 신청",
		"¡Campeón! Mandas en el vestuario.": "우승! 라커룸은 내 거예요.",
		"Última ronda de vergüenza.": "꼴찌. 창피해요.",
		"EL PRESIDENTE BAJA": "구단주 등장",
		"Tras la victoria el presidente baja eufórico al vestuario a felicitar uno por"
		+ " uno. Todos miran a quién saluda primero.":
			"승리 후 구단주가 들떠서 라커룸에 내려와 한 명씩 축하해요. 누구에게 먼저 인사하는지 다들 지켜봐요.",
		"DEDICARLE LA VICTORIA": "승리 바치기",
		"CELEBRAR CON EL GRUPO": "동료들과 축하",

		"El mundo": "전 세계",
		"Fase final de Conference": "챌린지컵 토너먼트",
		"El club te ofrece cambiar de dorsal (llevas el {0})":
			"클럽이 등번호 변경을 제안해요 (현재 {0}번)",
		"ESTÁS EN EL ONCE DE {0}": "{0} 선발 명단 포함",
		"El seleccionador te pone de salida. Tu puntuación ({0}) supera el corte del once ({1}).":
			"대표팀 감독이 선발로 기용해요. 내 점수({0})가 선발 기준({1})을 넘었어요.",
		"CONVOCADO POR {0}": "{0} 대표팀 소집",
		"Entras en la lista de 23 y empiezas en el banquillo. Para el once te faltan {0} puntos.":
			"23인 명단에 들어 벤치에서 시작해요. 선발까지 {0}점 부족해요.",
		"FUERA DE LA LISTA DE {0}": "{0} 명단 제외",
		"El seleccionador no te llama esta vez. Tu puntuación es {0} y el último convocado marca {1}: te faltan {2}.":
			"이번엔 대표팀 감독이 부르지 않았어요. 내 점수는 {0}, 마지막 소집 선수는 {1}. {2}점 부족해요.",
		"Le quitaste el sitio a {0}.": "{0} 선수의 자리를 빼앗았어요.",
		"El once lo tiene {0}, con {1}.": "선발 자리는 {0} 선수 차지예요. 점수 {1}.",
		"El último de la lista es {0}, con {1}.": "명단 마지막 선수는 {0}, 점수 {1}.",
		"AMISTOSO: el seleccionador prueba gente y el corte baja {0} puntos. {1}":
			"친선 경기: 감독이 새 얼굴을 시험해서 기준이 {0}점 내려가요. {1}",
		"TE PIDEN: {0} ({1}/{2})": "요구 사항: {0} ({1}/{2})",
		"Juega {0} partidos con tu país.": "대표팀으로 {0}경기 출전하기.",
		"Marca {0} goles con tu país.": "대표팀에서 {0}골 넣기.",
		"Cumpliste lo que te pidió {0}": "{0} 감독의 요구를 달성했어요",
		"No cumpliste lo que te pidió {0}": "{0} 감독의 요구를 달성하지 못했어요",
		"CAPITÁN de {0}": "{0} 주장",
		"Perdiste el brazalete de {0}": "{0} 주장 완장을 잃었어요",
		"PERDISTE EL BRAZALETE": "완장 박탈",
		"{0} {1} · TU MEDIA {2}": "{0} {1} · 내 OVR {2}",
		"EL TÉCNICO NUEVO REPARTE DE CERO": "새 감독, 원점에서 시작",
		"VESTUARIO NUEVO": "새 라커룸",
		"SE QUEDA EN {0}": "{0} 잔류",
		"BRAZALETE": "주장 완장",
		"BRAZALETE TUYO": "내 완장",
		"SIN RIVAL": "경쟁자 없음",
		"FRENADO POR TU PALABRA": "약속에 묶임",
		"BRAZALETE: {0}/{1} PARTIDOS · SELECCIONADOR {2}/{3} · VESTUARIO {4}/{5} · SIENDO TITULAR": "완장: {0}/{1}경기 · 감독 {2}/{3} · 라커룸 {4}/{5} · 선발 출전",
		"¡{0} se clasificó para {1}!": "{0}, {1} 진출 확정!",

		"Dieciseisavos": "32강",
		"Ronda": "라운드",
		"AMISTOSO": "친선 경기",
		"TUS TIROS": "슈팅 맵",
		"LOS AMISTOSOS": "친선 경기",
		"TORNEO EUROPEO": "유럽 대회",
		"TORNEO SUDAMERICANO": "남미 대회",
		"TORNEO NORTEAMERICANO": "북미 대회",
		"TORNEO ASIÁTICO": "아시아 대회",
		"TORNEO AFRICANO": "아프리카 대회",
		"TORNEO DE OCEANÍA": "오세아니아 대회",
		"TORNEO CONTINENTAL": "대륙 대회",
		"DIF": "득실",
		"CC": "CC",
		"CEU": "EC",
		"CCF": "CFC",
		"Pediste salir: el club te ofrece a quien pregunte, también con el mercado cerrado. Estas ofertas no caducan con la ventana.":
			"이적을 요청했어요. 클럽은 문의하는 누구에게나 나를 내놓아요, 이적 시장이 닫혀 있어도요. 이 제안들은 이적 기간이 끝나도 만료되지 않아요.",
		"16avos": "32강",
		"DISTANCIA": "거리",
		"T": "S",
		"DENTRO DEL ÁREA": "박스 안",
		"FUERA DEL ÁREA": "박스 밖",
		"DE MUY LEJOS": "중거리",
		"PRODIGIO": "신동",
		"HEREDERO": "후계자",
		"RECOMENDADO": "추천 선수",
		"KILLER NATO": "타고난 킬러",
		"HIJO DE LEYENDA": "레전드의 아들",


		"PICARDIA": "길거리 센스",
		"MANO FRIA": "강심장",
		"CARA DE ANUNCIO": "광고 체질",
		"EL TELEFONO": "그 전화번호",
		"EL NUEVE": "9번",
		"EL QUE VOLVIO": "돌아온 선수",
		"EL DEPORTIVO": "스포츠카",
		"EL PATIO DE LA FAMILIA": "가족의 땅",
		"EL PREPARADOR DE LA FAMILIA": "가족 트레이너",
		"RECUPERACION": "회복",
		"Cuarenta mil personas fueron a verte firmar y te compraste el coche. Llegas tarde a entrenar, pero llegas: la prensa te adora y el vestuario menos.":
			"4만 명이 입단식을 보러 왔고, 그래서 차를 샀어요. 훈련엔 늦지만 오긴 와요. 언론은 사랑하고, 라커룸은 덜 해요.",
		"El terreno de la familia ya era tuyo antes de firmar nada. La casa la levantas tú, pero el sitio donde ponerla no lo pagas.":
			"가족의 땅은 계약 전부터 내 거였어요. 집은 직접 짓지만, 집 지을 땅값은 안 내요.",
		"El que puso en pie a tu padre te conoce desde niño. Te recuperas entre partidos como nadie de tu edad, y a él no hay que pagarle.":
			"아버지를 다시 일으켜 세운 사람이 어릴 때부터 나를 알아요. 경기 사이 회복력이 또래 누구보다 좋고, 그분은 돈도 안 받아요.",
		"EL AHIJADO": "애제자",
		"BOTAS DE ORO": "황금 축구화",
		"PIERNAS DE NIÑO": "소년의 다리",
		"El uno contra uno lo aprendiste en una cancha sin red: +4 de regate desde el debut.":
			"골망 없는 코트에서 1대1을 배웠어요: 데뷔부터 드리블 +4.",
		"Cuando pitan penalti, el balón lo coges tú: +5 de penales, que es lo que decide quién lo tira en tu equipo.":
			"페널티킥 휘슬이 울리면 공은 내가 잡아요: 페널티킥 +5, 팀에서 누가 찰지 정하는 능력이에요.",
		"Sales bien en foto y la prensa lo nota: empiezas con la puerta de los patrocinios abierta, no en tu segunda temporada.":
			"사진발이 좋아서 언론이 주목했어요: 두 번째 시즌이 아니라 처음부터 스폰서의 문이 열려 있어요.",
		"Tienes el teléfono de alguien que mueve fichas: tu agente arranca con la mesa llena y el mercado abierto desde el primer mes.":
			"선수를 움직이는 거물의 번호를 알아요: 에이전트가 첫 달부터 제안 가득한 책상과 열린 이적 시장으로 시작해요.",
		"El área es tuya: +3 de potencia, y si el 9 está libre en tu club, te lo guardan.":
			"박스는 내 영역: 파워 +3, 그리고 클럽에서 9번이 비어 있으면 나를 위해 남겨 둬요.",
		"Ya jugaste aquí una vez y nadie lo olvidó: la grada te espera y la prensa te da el beneficio de la duda.":
			"예전에 여기서 뛰었고 아무도 잊지 않았어요: 관중석이 기다리고, 언론은 일단 믿어 줘요.",
		"En este vestuario tu apellido ya sonaba: el técnico te conoce antes de verte jugar, y la prensa lo sabe.":
			"이 라커룸에선 내 성이 이미 유명했어요: 감독은 경기 전부터 나를 알고, 언론도 그걸 알아요.",
		"Tres trofeos de goleador vinieron con unas CORONA DE ORO. Estrenas un par, sin estrenar y sin pagar.":
			"득점왕 트로피 세 개와 함께 골든 크라운 축구화가 왔어요. 돈 한 푼 안 낸 새 축구화로 시작해요.",
		"Las piernas no se acuerdan de los años: +6 a velocidad, aceleración y regate de salida.":
			"다리는 나이를 기억하지 못해요: 시작 속도, 가속, 드리블 +6.",
		"TE LLEVAS": "획득",
		"PASO 2 DE 3 · LO QUE TE GANASTE": "2/3단계 · 내가 얻은 것",
		"LIBRES": "무료",
		"POR DESBLOQUEAR": "잠김",
		"VIDA": "인생",
		"LESION": "부상",
		"BANCO": "은행",
		"TUS VENTAJAS": "내 특전",
		"BOTAS HEREDADAS": "물려받은 축구화",
		"CON CARTEL": "이름값",
		"PIE EDUCADO": "정교한 발",
		"MANO DERECHA": "오른팔",
		"EL DIEZ": "10번",
		"CUERPO DE HIERRO": "강철 몸",
		"FICHAJE DE ORO": "황금 영입",
		"SANGRE AZUL": "푸른 피",
		"SE ABRE CON": "해금 조건",
		"Lo que te ganaste en carreras anteriores. Cada ventaja gasta puntos de legado, y no alcanzan para todas: elige con cuáles arrancas —o con ninguna, y empieza de cero como todos.": "지난 커리어에서 얻은 것들이에요. 특전마다 레거시 포인트가 들고, 전부 고를 만큼은 절대 없어요. 가지고 시작할 걸 고르세요. 아니면 하나도 없이, 모두처럼 맨바닥에서 시작하세요.",
		"Te quedaste las botas de aquel año en Tercera. Estrenas unas TRUENO XT: pegan más fuerte, y duran lo que duran.": "3부 리그 시절 축구화를 간직했어요. 썬더 XT로 시작해요: 슈팅이 더 세지고, 수명은 다할 때까지예요.",
		"Llegas con cartel: la grada ya coreó tu nombre una vez y te lo guarda.": "이름값을 안고 와요: 이 관중은 내 이름을 연호한 적이 있고, 그걸 기억해요.",
		"Los primeros diez goles no se olvidan: +3 de precisión desde el debut.": "처음 넣은 10골은 잊히지 않아요: 데뷔부터 정확도 +3.",
		"Un agente con oficina te firma antes que ningún club: más puertas y menos comisión. Su cuota mensual, también desde el día uno.": "사무실 있는 에이전트가 어느 클럽보다 먼저 계약해요: 더 많은 기회, 더 적은 수수료. 월 수수료도 첫날부터 나가요.",
		"Ya llevaste el 10 y no se te olvidó: +3 de visión, y si el 10 está libre en tu club, te lo guardan.": "10번을 달아 봤고 잊지 않았어요: 시야 +3, 그리고 클럽에서 10번이 비어 있으면 나를 위해 남겨 둬요.",
		"Trescientos partidos enseñan a caer: 20% menos de riesgo de lesión, toda la carrera.": "300경기가 넘어지는 법을 가르쳐 줬어요: 커리어 내내 부상 위험 20% 감소.",
		"Heredas el apellido y la casa: entras a vivir el primer día. El mantenimiento también se hereda.": "성과 집을 물려받아요: 첫날부터 입주해요. 관리비도 같이 물려받아요.",
		"No llegas a pelear un sitio: llegas a ocuparlo. Un peldaño más de rol en tu contrato de debut.": "자리 경쟁하러 오는 게 아니라 차지하러 와요. 데뷔 계약의 역할이 한 단계 높아져요.",
		"El seleccionador ya sabe quién eres: empiezas con crédito para entrar en la primera lista.": "대표팀 감독이 이미 나를 알아요: 첫 소집 명단에 들 점수를 안고 시작해요.",
		"Naciste con algo. Empiezas con 3 puntos de habilidad por repartir.":
			"타고난 게 있어요. 스킬 포인트 3점을 갖고 시작해요.",
		"La familia te respalda: +$35.000 en el banco desde el primer día.":
			"가족이 밀어줘요: 첫날부터 은행에 +$35,000.",
		"El técnico ya oyó hablar de ti. Debutas con su confianza, no en la grada.":
			"감독이 이미 소문을 들었어요. 관중석이 아니라 감독의 신뢰 속에 데뷔해요.",
		"El gol lo llevas puesto: +6 a potencia, precisión y efecto de salida.":
			"골은 핏속에 있어요: 시작 파워, 정확도, 회전 +6.",
		"Cargas un apellido: +$20.000 y 2 puntos de habilidad. La sombra pesa.":
			"무거운 성을 짊어졌어요: +$20,000에 스킬 포인트 2점. 그림자가 무거워요.",
		"Véncelo en un partido (con cualquier carrera) para desbloquearlo.":
			"경기에서 이기면 해금돼요 (어느 커리어든).",
		"Completa una temporada en {0}ª división o ficha por un club de {1}ª para desbloquear.":
			"{0}부 리그에서 한 시즌을 마치거나 {1}부 리그 클럽과 계약하면 해금돼요.",
		"LIGA ESPAÑOLA": "스페인 리그",
		"LIGA INGLESA": "잉글랜드 리그",
		"LIGA ITALIANA": "이탈리아 리그",
		"LIGA ALEMANA": "독일 리그",
		"LIGA MEXICANA": "멕시코 리그",
		"LIGA LUSA": "포르투갈 리그",
		"LIGA FRANCESA": "프랑스 리그",
		"LIGA NEERLANDESA": "네덜란드 리그",
		"LIGA BRASILEÑA": "브라질 리그",
		"LIGA ARGENTINA": "아르헨티나 리그",
		"LIGA AMERICANA": "미국 리그",
		"LIGA SAUDI": "사우디 리그",
		"LIGA TURCA": "튀르키예 리그",
		"LIGA BELGA": "벨기에 리그",
		"{0}G {1}A · {2} · {3}": "{0}G {1}A · {2} · {3}",
		"EQUIPO ENCENDIDO": "팀 상승세",
		"EQUIPO FRÍO": "팀 침체",
		"PORTERO EN LOS NERVIOS": "골키퍼 동요",
		"PORTERO TENSO": "골키퍼 긴장",




		"Diagonal del extremo": "윙어의 대각선 침투",
		"El pasillo interior": "하프 스페이스",
		"El embudo": "깔때기",
		"La defensa volcada": "한쪽으로 쏠린 수비",
		"Doblada por fuera": "바깥쪽 오버래핑",
		"Aislado en la banda": "측면 고립",
		"La subida por fuera": "바깥쪽 오버래핑 침투",
		"El tercer hombre": "서드맨",
		"Indirecta al costado del área": "박스 옆 간접 프리킥",
		"Indirecta de segunda línea": "먼 거리 간접 프리킥",
		"Contra el muro replegado": "밀집 수비벽 공략",
		"Presión alta tras la pérdida": "볼 뺏긴 뒤 전방 압박",
		"Contra tras córner rival": "상대 코너킥 후 역습",
		"Ley de la ventaja": "어드밴티지",
		"Tres contra tres": "3대3",
		"Falta lejana colgada al área": "박스로 띄우는 먼 프리킥",
		"Falta lejana desde la banda": "측면 먼 거리 프리킥",
		"Falta desde tres cuartos": "장거리 프리킥",
		"Cambio corto": "짧은 전환",
		"Cambio de banda": "방향 전환",
		"Cambio largo": "긴 전환",
		"Salir de la presión": "압박 탈출",
		"Cruza el medio campo": "하프라인 넘기",

		"¡LA RECUPERASTE! ATACA": "볼 탈취! 공격",
		"GOL EN CONTRA": "실점",
		"DESBORDADO": "돌파 허용",
		"LA PARÓ TU PORTERO": "골키퍼 선방",
		"LE DEJASTE TIRAR": "슈팅 허용",
		"Recuperar el balón": "볼 탈취",
		"DEFENSA": "수비",
		"El balón NO es tuyo. Métete entre él y tu portería: al llegarle bien puesto, se la quitas.": "공은 내 것이 아니에요. 상대와 내 골대 사이로 들어가세요: 좋은 위치에서 붙으면 뺏을 수 있어요.",
		"Te la sirven": "패스 연결",
		"Te la traen conduciendo y te la pasan. Apunta y remátala de primera, o se te escapa.": "동료가 드리블해 와서 패스해 줘요. 조준해서 원터치로 마무리하세요, 안 그러면 놓쳐요.",
		"Espera el pase; luego jala y suelta": "패스를 기다렸다가 당겼다 놓기",
		"REMATE AÉREO": "공중볼 마무리",
		"Cabezazos": "헤더",
		"Voleas": "발리",
		"Chilenas": "바이시클 킥",
		"Te cuelgan el centro a la cabeza. Espera a que llegue y cabecea a puerta.": "머리로 크로스가 와요. 공이 올 때까지 기다렸다가 골문으로 헤더하세요.",
		"Espera el centro; luego jala y suelta": "크로스를 기다렸다가 당겼다 놓기",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que toque el suelo.": "가슴으로 공이 와요: 트래핑하고 땅에 닿기 전에 발리로 차세요.",
		"Espera el control; luego jala y suelta": "트래핑을 기다렸다가 당겼다 놓기",
		"Saltas de espaldas al arco: apunta a puerta aunque no la veas.": "골문을 등지고 점프해요: 안 보여도 골문을 조준하세요.",
		"Raso al pie": "발밑 땅볼",
		"Te la ponen botando": "바운드 패스",
		"¡De primera!": "원터치!",
		"Espera el momento perfecto": "완벽한 타이밍을 기다리세요",
		"¡Cabecea!": "헤더!",
		"Tocada a destiempo": "타이밍 미스",
		"Tocada de refilón": "빗맞음",
		"¡Al primer toque!": "원터치!",
		"¡Al bote pronto!": "하프 발리!",
		"¡Cazada al bote!": "바운드 포착!",
		"El bote te ganó": "바운드에 속았어요",
		"Bote de refilón": "바운드 빗맞음",
		"¡La bajaste y pegaste!": "잡아 놓고 슈팅!",
		"¡Control y tiro!": "컨트롤 후 슈팅!",
		"Tiro a destiempo tras el control": "컨트롤 후 타이밍 미스",
		"De refilón tras el control": "컨트롤 후 빗맞음",
		"¡Cabezazo pleno!": "정확한 헤더!",
		"¡Con toda la frente!": "이마 정중앙!",
		"Saltaste a destiempo": "점프 타이밍 미스",
		"De refilón con la frente": "이마에 스침",
		"¡Volea!": "발리!",
		"¡De pecho y volea!": "가슴 트래핑 후 발리!",
		"Volea a destiempo": "발리 타이밍 미스",
		"Volea de refilón": "발리 빗맞음",
		"¡Chilena de libro!": "교과서적인 바이시클 킥!",
		"Chilena a destiempo": "바이시클 킥 타이밍 미스",
		"Chilena de refilón": "바이시클 킥 빗맞음",
		"Saltaste tarde": "점프가 늦었어요",
		"Chilena tardía": "늦은 바이시클 킥",
		"Te adelantaste a la volea": "발리가 너무 빨랐어요",
		"Volea tardía": "발리가 너무 늦었어요",
		"Raso del lado ciego": "사각지대 땅볼",
		"Raso a la carrera": "달리는 방향 땅볼",
		"Tensa por el aire": "강한 공중 패스",
		"Te la cuelgan": "띄운 패스",
		"Raso con rosca": "감아 찬 땅볼",
		"Raso largo": "긴 땅볼",
		"Filtrado al hueco": "공간 스루패스",
		"Filtrado con rosca": "감아 찬 스루패스",
		"Con comba": "휘는 공",
		"Centro a la cabeza": "머리로 크로스",
		"Centro al pecho": "가슴으로 크로스",
		"Centro a la chilena": "바이시클 킥용 크로스",
		"Cambio de juego": "방향 전환",
		"Centro de la otra banda": "반대편 측면 크로스",
		"Al pecho desde la otra banda": "반대편에서 가슴으로",
		"Al pecho desde la banda": "측면에서 가슴으로",
		"Botando desde lejos": "먼 거리 바운드",
		"Chilena desde la otra banda": "반대편 바이시클 킥 크로스",
		"A media altura": "허리 높이",
		"Botando de muy lejos": "아주 먼 바운드",
		"Centro con rosca": "감아 찬 크로스",
		"Chilena con rosca": "바이시클 킥용 감아 찬 크로스",
		"Al pecho con rosca": "가슴으로 감아 찬 크로스",
		"Tras el punto penal": "페널티 스폿 뒤",
		"Córner a la cabeza": "머리로 코너킥",
		"Córner a la chilena": "바이시클 킥용 코너킥",
		"Córner al borde del área": "박스 모서리로 코너킥",
		"Falta colgada a la cabeza": "머리로 띄운 프리킥",
		"Falta colgada a la chilena": "바이시클 킥용 띄운 프리킥",
		"Falta colgada al pecho": "가슴으로 띄운 프리킥",
		"En la frontal": "박스 앞",
		"En el área": "박스 안",
		"En el área chica": "골 에어리어 안",
		"Escorado en el área": "박스 안 측면",
		"Al costado del área": "박스 옆",
		"Pegado a la banda": "측면 끝",
		"Centrar por la banda": "측면 크로스",
		"Pon el CENTRO a un compañero: se gana completándolo, no tirando a puerta.": "동료에게 크로스를 올리세요: 슈팅이 아니라 크로스를 연결해야 이겨요.",
		"Cuelga el centro a un compañero": "동료에게 크로스 올리기",
		"Centro corto": "짧은 크로스",
		"Centro largo": "긴 크로스",
		"¡Centro puesto!": "크로스 성공!",
		"El centro no llegó": "크로스가 닿지 않았어요",
		"notaCENTRO PUESTO": "크로스 성공",
		"Arrastra para correr; no hay nada más que tocar": "드래그해서 달리기. 다른 조작은 없어요",
		"Ponte entre el balón y tu portería para robar. Al recuperar, sigue arrastrando y ataca.": "공과 내 골대 사이에 들어가서 뺏으세요. 뺏으면 계속 드래그해서 공격하세요.",
		"Arrastra para correr; toca con un segundo dedo para barrerte": "드래그해서 달리기, 두 번째 손가락으로 탭하면 슬라이딩 태클",
		"FALTA": "파울",
		"RECUPERADA": "볼 탈취",
		"TE DESBORDÓ": "돌파당함",
		"Campo abierto": "오픈 플레이",
		"PASE": "패스",
		"Tu fondo: los minutos que aguantas —a tope juegas los 90' y llegas a la prórroga—, lo que te cuesta cada partido y lo que repones. También te hace menos propenso a lesionarte.":
			"체력: 버틸 수 있는 시간이에요. 최대치면 90분을 다 뛰고 연장전까지 가요. 경기마다 드는 소모량과 회복량도 정해요. 부상 위험도 낮춰 줘요.",
		"Copa de Campeones": "엘리트컵",
		"Copa Europa": "유로파컵",
		"Copa Conferencia": "챌린지컵",
		"Jugador del Año": "올해의 선수",
		"Bota (Liga)": "득점왕 (리그)",
		"Mejor (Copa de Campeones)": "최우수 (엘리트컵)",
		"Bota (Copa de Campeones)": "득점왕 (엘리트컵)",
		"Asist. (Copa de Campeones)": "도움왕 (엘리트컵)",
		"Mejor (Copa Europa)": "최우수 (유로파컵)",
		"Bota (Copa Europa)": "득점왕 (유로파컵)",
		"Asist. (Copa Europa)": "도움왕 (유로파컵)",
		"Mejor (Copa Conferencia)": "최우수 (챌린지컵)",
		"Bota (Copa Conferencia)": "득점왕 (챌린지컵)",
		"Asist. (Copa Conferencia)": "도움왕 (챌린지컵)",
		"VUELVEN A LLAMAR": "다시 연락 옴",
		"TU AGENTE LA SOSTIENE": "에이전트가 붙잡는 중",
		"NO SE DEJÓ SOSTENER": "붙잡지 못함",
		"SE HARTARON DE TUS NOES": "거절에 지쳤대요",
		"LLEGA MENOS DE LO QUE ERA": "금액 하락",
		"MEJORAN LA OFERTA": "제안 상향",
		"TRASPASO PACTADO": "이적 합의",
		"NO LLEGAN A LO QUE PIDEN": "요구액 미달",
		"RETIRAN LA PUJA": "제안 철회",
		"HAY PELEA POR TI": "영입 경쟁",
		"APRIETA POR TI": "적극 구애",
		"COBRAN POR TU VENTA": "이적료 수령",
		"¡Salió bien!": "성공!",
		"Salió mal…": "실패…",
		"No les das el perfil todavía.": "아직 원하는 유형이 아니에요.",
		"Ese club no existe.": "없는 클럽이에요.",
		"Ya juegas ahí.": "이미 거기서 뛰고 있어요.",
		"Ya tienes su oferta sobre la mesa.": "그 클럽의 제안이 이미 와 있어요.",
		"Les dijiste que no en esta ventana.": "이번 이적 기간에 거절했어요.",
		"Es un club muy por debajo del tuyo: no bajan a por ti.":
			"우리 클럽보다 한참 아래예요: 나를 데려가러 오지 않아요.",
		"Está demasiadas categorías por encima: se sube de una en una.":
			"너무 높은 등급이에요: 한 계단씩 올라가야 해요.",
		"No pueden pagar lo que costaría sacarte.":
			"나를 데려갈 이적료를 감당할 수 없어요.",
		"Tu última concentración": "마지막 대표팀 소집",
		"{0}: {1} fuera en la fase de grupos (sin ti)": "{0}: {1} 조별 리그 탈락 (나 없이)",
		"{0} se clasificó para {1} (sin ti)": "{0}, {1} 진출 확정 (나 없이)",
		"{0} se quedó fuera de {1}": "{0}, {1} 진출 실패",
		"{0}: fuera en la fase de grupos con {1}": "{0}: {1} 조별 리그 탈락",
		"{0} se clasificó para {1}": "{0}, {1} 진출 확정",
		"{0} no se clasificó para {1}": "{0}, {1} 진출 실패",
		"{0} sólo jugó amistosos este año": "{0}, 올해는 친선 경기만 치렀어요",
		"{0} amistosos con {1}: {2} ganados": "{1}에서 친선 경기 {0}회: {2}승",
		"Tu palmarés": "내 우승 기록",
		"Tu temporada": "내 시즌",
		"Dónde juegas": "뛰는 곳",
		"El seleccionador": "대표팀 감독",
		"Llevas el brazalete": "주장 완장 착용",
		"Ya eres del grupo": "이제 팀의 일원",
		"Eliminado de la copa": "컵 탈락",
		"En dieciseisavos de copa": "컵 32강",
		"En octavos de copa": "컵 16강",
		"En cuartos de copa": "컵 8강",
		"En semifinales de copa": "컵 준결승",
		"En la final de copa": "컵 결승",
		"Partidos con la selección": "대표팀 출전",
		"Asistencias con la selección": "대표팀 도움",
		"El Diez": "10번",
		"Llegar a llevar el 10 a la espalda.": "등에 10번을 달기.",
		"El Nueve de un Grande": "빅클럽의 9번",
		"Llevar el 9 en uno de los clubes más fuertes del mundo.":
			"세계 최강 클럽 중 한 곳에서 9번 달기.",
		"Adiós Internacional": "대표팀 은퇴",
		"Colgar la camiseta de tu país por decisión propia, sin dejar el club.":
			"클럽은 떠나지 않고, 스스로 대표팀 유니폼을 벗기.",
		"Brazalete del País": "대표팀 주장",
		"Llevar la cinta de capitán de tu selección.": "국가대표팀 주장 완장 차기.",
		"Rey de la Conference": "챌린지컵의 왕",
		"Ganar la Conference.": "챌린지컵 우승.",
		"Ser el máximo goleador de la Conference.": "챌린지컵 득점왕 되기.",
		"Goles y Pases": "득점·도움 1위",
		"Verdugo de Países Bajos": "네덜란드 킬러",
		"Cuarenta Mil": "4만 명",
		"TELEVISIÓN": "TV",
		"MIS CAMISETAS": "내 유니폼",
		"LÁMPARA": "조명",
		"JARDÍN": "정원",
		"CINTA": "러닝머신",
		"COCINA": "주방",
		"ESPEJO": "거울",
		"LIBRERO": "책장",
		"MANCUERNAS": "덤벨",
		"PLANTA": "화분",
		"MANSION": "대저택",
		"FINCA": "전원 저택",
		"PREMIOS AL MEJOR": "개인상",
		"Premios al Mejor": "올해의 선수상",
		"JUGADOR DEL AÑO": "올해의 선수",
		"BOTA": "득점",
		"Bota": "득점",
		"Torneo Europeo": "유럽 대회",
		"Torneo Sudamericano": "남미 대회",
		"Torneo Norteamericano": "북미 대회",
		"Torneo Asiático": "아시아 대회",
		"Torneo Africano": "아프리카 대회",
		"Torneo de Oceanía": "오세아니아 대회",
		"TODOS LOS PREMIOS AL MEJOR": "모든 개인상",
		"{0} PREMIOS AL MEJOR": "개인상 {0}개",
		"Falta indirecta en el área": "박스 안 간접 프리킥",
		"CARRERA": "커리어",
		"TIROS": "슈팅",
		"ACELERACION": "가속",
		"ENTRADA": "태클",
		"CRUZ": "십자",
		"INICIAL": "이니셜",
		"Sólido": "단색",
		"Espina": "가시",
		"Puntos": "도트",
		"Estrellas": "별",
		"Pelo 2": "헤어 2",
		"Pelo 3": "헤어 3",
		"Pelo 5": "헤어 5",
		"Pelo 6": "헤어 6",
		"Cejas 1": "눈썹 1",
		"Cejas 2": "눈썹 2",
		"Cejas 3": "눈썹 3",
		"Cejas 4": "눈썹 4",
		"Cejas 5": "눈썹 5",
		"Rastas": "드레드",
		"Peinado (pieza)": "헤어스타일 (파츠)",
		"Ninguno": "없음",
		"Máscara": "마스크",
		"Banda": "헤어밴드",
		"Banda roja": "빨간 헤어밴드",
		"Banda azul": "파란 헤어밴드",
		"Banda negra": "검은 헤어밴드",
		"Banda oro": "금색 헤어밴드",
		"Fade alto": "하이 페이드",
		"Fade bajo": "로우 페이드",
		"Peinado atrás": "슬릭백",
		"Quiff corto": "숏 퀴프",
		"Banda pelo": "머리끈",
		"Doble brazalete": "더블 밴드",
		"Media manga": "하프 슬리브",
		"Banda verde": "초록 헤어밴드",
		"Banda rosa": "분홍 헤어밴드",
		"Banda naranja": "주황 헤어밴드",
		"Económicos": "저가",
		"Clásicos": "클래식",
		"Contemporáneos": "모던",
		"Sin pelo": "민머리",
		"Cortes cortos": "짧은 머리",
		"Cortes medianos": "중간 머리",
		"Cortes largos": "긴 머리",
		"Accesorio de pelo": "헤어 액세서리",
		"Banda deportiva": "땀밴드",
		"Cinta fina": "얇은 리본",
		"Liga para recogido": "묶음 머리끈",
		"Máscara de protección": "보호 마스크",
		"Sin máscara": "마스크 없음",
		"Con máscara": "마스크 착용",
		"Tipo de ceja": "눈썹 모양",
		"Sin cejas": "눈썹 없음",
		"Tatuaje facial": "얼굴 타투",
		"Lado del rostro": "얼굴 방향",
		"Tinta facial": "얼굴 잉크",
		"Conjuntos completos": "풀 세트",
		"Clásico": "클래식",
		"Del traje": "정장 세트",
		"Pañuelo de saco": "행커치프",
		"Cinturón": "벨트",
		"Color del accesorio": "액세서리 색",
		"Deportivo": "스포츠",
		"De lujo": "럭셔리",
		"CLASIF J{0}": "예선 {0}R",
		"SIN PARTIDO": "경기 없음",


		"Aperturas vistas": "오프닝 시청",
		"· la saltaron": "· 건너뜀",
		"· salieron al campo": "· 경기장 입장",
		"· el estadio tardó más de 3 s (el cine perdió hasta 1 s)": "· 경기장 로딩 3초 초과 (인트로 최대 1초 손실)",
		"Apertura: décimas hasta ver el estadio (peor)": "오프닝: 경기장이 보일 때까지 0.1초 단위 (최악)",
		"·· sin ninguna tirada (no gastó cupo)": "·· 뽑기 없음 (슬롯 소모 없음)",
		"·· con una tirada": "·· 뽑기 1회",
		"·· con dos o más tiradas": "·· 뽑기 2회 이상",
		"Academias empezadas": "아카데미 시작",
		"· pasaron el 1 (MUEVETE)": "· 1번 통과 (움직이기)",
		"· pasaron el 2 (PEGALE)": "· 2번 통과 (슈팅)",
		"· pasaron el 3 (ENCARA)": "· 3번 통과 (돌파)",
		"· pasaron el 4 (SIRVE AL AREA)": "· 4번 통과 (박스로 패스)",
		"· pasaron el 5 (BALON PARADO)": "· 5번 통과 (세트피스)",
		"Academias terminadas": "아카데미 완료",
		"{0} espera respuesta":
			"{0} 클럽이 답변을 기다려요",
		"Tu oferta caduca. Nadie va a decidir por ti.":
			"제안이 곧 만료돼요. 아무도 대신 결정해 주지 않아요.",
		"Hoy es tu cumpleaños":
			"오늘은 내 생일",
		"El vestuario te ha preparado algo.":
			"라커룸에서 뭔가 준비했대요.",
		"Tu once te espera.":
			"선발 11명이 기다려요.",
		"Ya casi estás en forma":
			"거의 다 회복했어요",
		"Una semana más y vuelves al once.":
			"일주일만 더 있으면 선발로 복귀해요.",
		"Tu carrera sigue ahí":
			"커리어가 기다려요",
		"Tu temporada con el {0} sigue a medias.":
			"{0} 클럽에서의 시즌이 아직 절반 남았어요.",
		"AVISOS":
			"알림",
		"AVISARME EN EL TELÉFONO":
			"휴대폰 알림 받기",
		"Un recordatorio cuando algo te espera: una oferta que caduca, tu cumpleaños, la vuelta de una lesión. Nunca más de uno al día.":
			"뭔가 기다리고 있을 때 알려 드려요: 곧 만료되는 제안, 생일, 부상 복귀. 하루에 한 번 이상은 절대 안 보내요.",
		"Los tienes bloqueados para este juego en los Ajustes de tu teléfono.":
			"휴대폰 설정에서 이 게임의 알림을 차단했어요.",
		"Altas abiertas (NUEVA CARRERA)": "가입 시작 (새 커리어)",
		"QUITARLO":
			"삭제",
		"El día del calendario de fuera en el que el juego se acuerda de ti. Sin año: no hace falta.":
			"게임이 나를 기억해 주는 실제 달력의 날짜예요. 연도는 필요 없어요.",
		"· entraron al campo":
			"· 경기장 입장",
		"· escribieron un nombre (ya jugando)":
			"· 이름 입력 (플레이 중)",
		"SIGO":
			"계속할래",
		"LO DEJO POR HOY":
			"오늘은 여기까지",
		"Eso es el juego entero: apuntas, ajustas la fuerza y pegas. Quedan unos ejercicios más para sacarte mejores ofertas de club.":
			"이게 게임의 전부예요: 조준하고, 파워를 맞추고, 차요. 더 좋은 클럽 제안을 받으려면 연습이 몇 개 더 남았어요.",
		"· marcaron su primer gol en la escuela":
			"· 아카데미에서 첫 골",
		"· escribieron un nombre": "· 이름 입력",
		"· aceptaron jugarla": "· 플레이 수락",
		"· llegaron a marcar un gol": "· 골까지 성공",
		"Entradas a LA CAJA desde el hub": "허브에서 더 박스 진입",
		"Carreras creadas": "생성된 커리어",
		"Jornadas jugadas": "플레이한 라운드",
		"Arranques del juego (en frío)": "게임 실행 (콜드 스타트)",
		"· el anterior se cerró solo (crash o memoria)": "· 이전 실행이 저절로 종료 (크래시 또는 메모리)",
		"· · y fue en pleno partido": "· · 경기 도중",
		"· · con la app inactiva (¿cerrada desde el selector?)": "· · 앱 비활성 상태 (앱 전환기에서 종료?)",
		"· · tras un aviso de memoria de iOS": "· · iOS 메모리 경고 후",
		"Avisos de memoria de iOS": "iOS 메모리 경고",
		"· en pleno partido": "· 경기 도중",
		"Partidos jugados: ganados": "경기 결과: 승",
		"· empatados": "· 무",
		"· perdidos": "· 패",
		"Partidos abandonados desde la pausa": "일시정지 메뉴에서 포기한 경기",
		"Minutos en el campo": "경기장에서 보낸 시간(분)",
		"Minutos en menús": "메뉴 체류 시간(분)",
		"Goles marcados": "득점",
		"· con la selección": "· 국가대표팀",
		"· de penal": "· 페널티킥",
		"· · a lo Panenka": "· · 파넨카",
		"· de tiro libre": "· 프리킥",
		"· de córner": "· 코너킥",
		"· · olímpicos": "· · 코너킥 직접 골",
		"· de cabeza": "· 헤더",
		"· de volea": "· 발리",
		"· de chilena": "· 바이시클 킥",
		"· en mano a mano": "· 1대1",
		"· en disparo frontal": "· 정면 슈팅",
		"· desde lejos": "· 중거리",
		"· desde ángulo cerrado": "· 좁은 각도",
		"· al contraataque": "· 역습",
		"· en centro al área": "· 박스 안 크로스",
		"· en rebote en el área": "· 박스 안 리바운드",
		"· en la jugada de volea": "· 발리 플레이",
		"· en saque de banda largo": "· 롱 스로인",
		"· en falta indirecta en el área": "· 박스 안 간접 프리킥",
		"· tras regate libre": "· 자유 드리블 후",
		"· saliendo desde tu campo": "· 우리 진영에서 빌드업",
		"· desde un saque de meta": "· 골킥에서",
		"· en otras jugadas": "· 기타 플레이",
		"Hat-tricks (3 goles o más en un partido)": "해트트릭 (한 경기 3골 이상)",
		"Autogoles": "자책골",
		"Penales fallados en el partido": "경기 중 PK 실축",
		"Penales fallados en tandas": "승부차기 실축",
		"Tiros desviados por un defensa": "수비수 맞고 굴절된 슈팅",
		"· que acabaron en córner": "· 코너킥으로 이어짐",
		"· que el defensa metió en su portería": "· 수비수 자책골",
		"· · a menos de 20 m": "· · 20m 미만",
		"· · de 20 a 25 m": "· · 20~25m",
		"· · de 25 a 30 m": "· · 25~30m",
		"· · a 30 m o más": "· · 30m 이상",
		"· · rematados de cabeza": "· · 헤더 마무리",
		"· · rematados de volea": "· · 발리 마무리",
		"· · rematados de chilena": "· · 바이시클 킥 마무리",
		"· a menos de 6 m del arco": "· 골문에서 6m 미만",
		"· de 6 a 16 m": "· 6~16m",
		"· de 16 a 25 m": "· 16~25m",
		"· de 25 a 30 m": "· 25~30m",
		"· a 30 m o más": "· 30m 이상",
		"Gol más lejano (m)": "최장거리 골 (m)",
		"Tiro libre más lejano metido (m)": "최장거리 프리킥 골 (m)",
		"Pase de gol más largo (m)": "최장거리 도움 패스 (m)",
		"Asistencias dadas": "도움",
		"Partidos jugados con el club": "클럽 경기 출전",
		"Partidos jugados con la selección": "국가대표팀 경기 출전",
		"Derbis ganados": "더비 승리",
		"Partidos ganados remontando": "역전승",
		"Títulos de equipo ganados": "팀 우승 횟수",
		"· ligas": "· 리그",
		"· copas": "· 컵",
		"· continentales de clubes y Mundial de Clubes": "· 대륙 클럽 대회 및 클럽 세계 대회",
		"· ascensos": "· 승격",
		"· Mundiales con la selección": "· 대표팀 세계 대회",
		"· continentales con la selección": "· 대표팀 대륙 대회",
		"Premios individuales": "개인상",
		"· Balones de Oro": "· 올해의 선수",
		"Veces Jugador del Partido": "MOM 수상",
		"Veces Jugador del Mes": "이달의 선수 수상",
		"Traspasos firmados": "이적 계약",
		"· millones pagados por ellos": "· 지불된 이적료 (백만)",
		"Cargas con un técnico duplicado (se arregló solo)": "감독 중복 로드 (자동 수정됨)",
		"· arreglos del carrusel de técnicos en ellas": "· 그중 감독 이동 수정",
		"Goles de club de antes (carreras guardadas)": "이전 클럽 골 (저장된 커리어)",
		"Asistencias de club de antes": "이전 클럽 도움",
		"Partidos de club de antes": "이전 클럽 경기",
		"Títulos de equipo de antes": "이전 팀 우승",
		"Premios individuales de antes": "이전 개인상",
		"Más goles de club en una carrera": "한 커리어 최다 클럽 골",
		"Más asistencias de club en una carrera": "한 커리어 최다 클럽 도움",
		"Más goles en un partido": "한 경기 최다 골",
		"Más títulos de equipo en una carrera": "한 커리어 최다 팀 우승",
		"Más Balones de Oro en una carrera": "한 커리어 최다 올해의 선수 수상",
		"Jornadas simuladas o vistas": "시뮬레이션 또는 관전한 라운드",
		"Temporadas terminadas": "완료한 시즌",
		"Carreras llevadas hasta el retiro": "은퇴까지 간 커리어",
		"Aperturas de HABILIDAD": "능력 화면 열기",
		"Aperturas de CONTRATO": "계약 화면 열기",
		"Aperturas de RELACIONES": "관계 화면 열기",
		"Aperturas de ASPECTO": "외모 화면 열기",
		"Aperturas de TIENDA": "상점 화면 열기",
		"Aperturas de CASA": "집 화면 열기",
		"Aperturas de TORNEOS": "대회 화면 열기",
		"Aperturas de MERCADO": "이적 시장 화면 열기",
		"Aperturas de CARRERA": "커리어 화면 열기",
		"Aperturas de CALENDARIO": "일정 화면 열기",
		"Aperturas de PLANTILLA": "스쿼드 화면 열기",
		"Aperturas de RANKING": "랭킹 화면 열기",
		"Aperturas de MAPA": "지도 화면 열기",
		"Aperturas de TROFEOS": "트로피 화면 열기",
		"Aperturas de CLUBES": "클럽 화면 열기",
		"Aperturas de LEYENDAS": "레전드 화면 열기",
		"Aperturas de BALON": "올해의 선수 화면 열기",
		"Sesiones de PRÁCTICA": "연습 세션",
		"Sesiones de ENTRENO en el club": "클럽 훈련 세션",
		"Aperturas del EDITOR de planteles": "스쿼드 에디터 열기",
		"Decisiones contestadas": "응답한 결정",
		"Semana más lejana alcanzada": "도달한 최장 주차",
		"Temporada más lejana alcanzada": "도달한 최장 시즌",
		"Nivel más alto alcanzado": "도달한 최고 레벨",
		"+{0} PTS DE HABILIDAD": "SP +{0}",
		"+{0} XP": "+{0} XP",
		"AL BANQUILLO": "벤치행",
		"PIERDES LA TITULARIDAD": "선발 제외",


		"CAMBIO": "교체",
		"TE CAMBIAN":
			"교체 아웃",
		"TU NOTA CUANDO TE CAMBIARON":
			"교체 당시 평점",
		"Te cambian, y no por descansar. Al túnel, y nadie aplaude.":
			"교체됐어요, 휴식 때문이 아니에요. 터널로 들어가는데, 아무도 박수 치지 않아요.",
		"Te cambian, y no por descansar. Fuera del campo, y nadie aplaude.":
			"교체됐어요, 휴식 때문이 아니에요. 그라운드를 떠나는데, 아무도 박수 치지 않아요.",
		"TE SACAN DEL CAMPO": "강제 교체",
		"OCASIONES SEGUIDAS FALLADAS": "연속 찬스 무산",
		"MINUTO": "분",
		"El míster no esperó a la cuarta. Fuera del campo, y nadie aplaude.":
			"감독은 네 번째를 기다리지 않았어요. 그라운드를 떠나는데, 아무도 박수 치지 않아요.",
		"El míster no esperó a la cuarta. Al túnel, y nadie aplaude.":
			"감독은 네 번째를 기다리지 않았어요. 터널로 들어가는데, 아무도 박수 치지 않아요.",
		"LA CONFIANZA DEL TÉCNICO": "감독의 신뢰",
		"Hoy miras desde aquí. El sitio no se pierde: se deja de merecer.":
			"오늘은 여기서 지켜봐요. 자리는 잃는 게 아니라, 자격을 잃는 거예요.",
		"LA FINAL": "결승",
		"VAMOS": "가자",
		"HIMNO": "국가",
		"CAMISETA DE VITRINA": "액자에 걸 유니폼",
		"LA FINAL DE EUROPA": "유럽 결승",
		"LA FINAL DE TU SELECCION": "대표팀 결승",
		"LA FINAL DEL MUNDIALITO": "클럽 세계 결승",
		"LA FINAL DE COPA": "컵 결승",
		"ENFRENTE, {0}": "상대: {0}",
		"NOCHE EUROPEA": "유럽의 밤",
		"DESDE EL BANQUILLO": "벤치에서",



		"TU SELECCION": "내 대표팀",
		"RENOVACION": "재계약",
		"FICHAJE": "영입",
		"SIGUES EN CASA": "잔류",
		"FIRMADO Y CERRADO": "계약 완료",
		"por partido": "경기당",
		"Te quedas porque quieres. Eso, en este oficio, lo firman pocos.":
			"원해서 남는 거예요. 이 바닥에서 그런 계약을 하는 선수는 드물어요.",



		"Pagaron por ti antes de verte jugar aquí. Ahora hay que darles la razón.":
			"여기서 뛰는 걸 보기도 전에 돈을 냈어요. 이제 그 선택이 옳았다는 걸 보여줄 때예요.",
		"Llegaste sin que nadie pagara un peso. Eso también hay que demostrarlo.":
			"이적료 한 푼 없이 왔어요. 그것도 증명해야 해요.",
		"HOY, EN TU CASA": "오늘은 홈에서",
		"HOY, EN LA SUYA": "오늘은 원정에서",
		"tu puesto": "내 자리",
		"el suyo": "상대 자리",
		"tus goles": "내 골",
		"Esa casa fue tuya. Hoy no te van a perdonar ni una.": "한때 내 집이었던 곳이에요. 오늘은 하나도 봐주지 않을 거예요.",
		"tu dorsal": "내 등번호",
		"No hay plan de partido que arregle un derbi. Se gana o se aguanta.":
			"어떤 전술도 더비를 해결해 주지 않아요. 이기거나 버티거나.",




		"Sois vecinos en la tabla y en la ciudad. Esto no se olvida ni ganándolo.":
			"순위표에서도 도시에서도 이웃이에요. 이겨도 이 싸움은 끝나지 않아요.",
		"Vienen a tu casa a quitarte el sitio. Perder hoy vale por tres derrotas.":
			"내 자리를 뺏으러 홈에 쳐들어와요. 오늘 지면 세 번 진 거나 마찬가지예요.",
		"Vas a su casa de líder. No hay tarde que les guste más.":
			"선두로 그들의 홈에 가요. 그들이 이보다 좋아할 오후는 없어요.",
		"Van por delante todo el año. Hoy la tabla no cuenta.":
			"1년 내내 앞서 있었던 팀이에요. 오늘은 순위표가 의미 없어요.",


		"PASAS DE RONDA": "다음 라운드 진출",
		"ELIMINADO": "탈락",
		"el cruce": "맞대결",
		"rondas ganadas": "통과한 라운드",
		"Una noche más y hay copa. En esta sala ya no habla nadie de suerte.":
			"하룻밤만 더 이기면 우승이에요. 이 방에서 이제 운이라고 말하는 사람은 없어요.",
		"Semifinales. Quedan dos partidos para levantarla.":
			"준결승. 트로피까지 두 경기 남았어요.",
		"{0} fuera. El cuadro sigue abierto y vosotros dentro.":
			"{0} 탈락. 대진은 아직 열려 있고, 우리는 살아남았어요.",
		"Fuera a la primera. El vestuario se vacía sin que nadie diga nada.":
			"첫 관문에서 탈락. 아무 말 없이 라커룸이 비어 가요.",
		"A un partido de la final. Esta sala va a tardar en olvidarlo.":
			"결승까지 한 경기. 이 방은 오랫동안 이걸 잊지 못할 거예요.",
		"{0} os deja fuera. Se acabó la copa y quedan cuarenta domingos.":
			"{0}에 패해 탈락. 컵은 끝났고, 일요일이 마흔 번 남았어요.",
		"{0} os deja fuera. El siguiente es dentro de cuatro años.":
			"{0}에 패해 탈락. 다음 대회는 4년 뒤예요.",


		"Llevas {0} sin ganarles. En esta sala nadie lo ha olvidado.":
			"{0} 동안 이기지 못했어요. 이 방에서 그걸 잊은 사람은 없어요.",
		"Nunca les has ganado. Algún día tiene que ser el primero.":
			"한 번도 이긴 적이 없어요. 언젠가는 첫 승이 나와야죠.",
		"No les ganas desde hace {0} años. La gente lleva la cuenta.":
			"{0}년째 못 이기고 있어요. 다들 세고 있어요.",
		"Llevas {0} seguidos contra ellos. Hoy vienen a por eso.":
			"상대로 {0}연승 중이에요. 오늘 저쪽은 그걸 끊으러 왔어요.",


		"{0} os ha marcado {1} en estos derbis. Hoy no lo pierdas de vista.":
			"{0} 선수는 이 더비에서 우리 상대로 {1}골을 넣었어요. 오늘은 눈을 떼지 마세요.",

		"AHORA MANDAS TÚ": "이제 지휘는 내 몫",
		"LAS ÓRDENES": "지시",
		"EL CAMINO": "경로",
		"Mientras apuntas, toca a un compañero: cada toque cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.":
			"조준하는 동안 동료를 터치하세요. 터치할 때마다 지시가 바뀌어요. 하늘색은 골문으로 침투, 호박색은 대기, 자홍색은 마커를 끌고 가요.",
		"El suelo enseña a dónde irá y se borra conforme lo corre. Máximo tres órdenes, sólo duran esa jugada, y arrancan cuando tiras o regateas.":
			"바닥에 갈 곳이 표시되고, 달려가면 지워져요. 지시는 최대 세 개, 그 플레이에서만 유효하고, 슈팅이나 드리블을 하면 시작돼요.",

		"TU TAQUILLA": "내 라커",
		"FIN DE ETAPA": "한 시대의 끝",

		"SE VA AL RIVAL": "라이벌로 떠난다",
		"FICHA POR EL RIVAL": "라이벌과 계약",
		"venía de": "이전 소속",
		"Se fue gratis. A ellos.": "공짜로 떠났어요. 그것도 저쪽으로.",
		"Lo pagaron, y lo pagaron caro. Sigue doliendo.": "돈을 냈죠, 그것도 비싸게. 아직도 쓰려요.",

		"CIERRA EL MERCADO": "이적 시장 마감",
		"PIDEN": "요구액",
		"SOLO PREGUNTA": "문의만",
		"LES FALTAN {0}": "{0} 부족",

		"SE QUEDA": "잔류",
		"Se queda. El traspaso se cae.": "잔류해요. 이적은 무산됐어요.",
		"Ya lo tenía decidido. Al menos sabe que se lo pediste.": "이미 마음을 정했대요. 그래도 붙잡아 준 건 알아요.",
		"Le has quitado la última duda: se va.": "마지막 망설임을 없애 줬어요. 떠나요.",
		"Le dio la vuelta: se queda igual.": "마음을 돌렸어요. 결국 남아요.",
		"Sin que nadie le dijera nada, se queda.": "아무도 아무 말 안 했는데, 남기로 했어요.",
		"Se va, y tú no tuviste nada que ver.": "떠나요. 당신과는 아무 상관 없이요.",
		"SE LO QUIEREN LLEVAR": "그를 원하는 클럽",
		"SUENA PARA OTRO": "이적설",
		"PEDIRLE QUE SE QUEDE": "남아 달라고 하기",
		"DECIRLE QUE ES SU OPORTUNIDAD": "기회를 잡으라고 하기",
		"TU VESTUARIO": "내 라커룸",
		"SE LLEVAN A {0}": "{0} 이적",
		"lo quiere": "관심 클럽",
		"le quedan": "남은 기간",
		"Un compañero tuyo tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "동료 한 명이 이적 제안을 받았지만 아직 수락하지 않았어요. 라커룸에 둘뿐이고, 당신이라면 어떻게 할지 물어보려 해요.",
		"{0} tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "{0} 선수가 이적 제안을 받았지만 아직 수락하지 않았어요. 라커룸에 둘뿐이고, 당신이라면 어떻게 할지 물어보려 해요.",
		"TU CLUB TE RETIENE": "클럽이 안 놓아줘요",
		"No te dejan salir: pide el traspaso primero.": "보내 주지 않아요. 먼저 이적을 요청하세요.",
		"No renuevas: te ponen en el escaparate.": "재계약 거부: 이적 명단에 올랐어요.",
		"Tu club te vende. Falta tu respuesta.": "클럽이 당신을 팔려 해요. 답을 기다려요.",
		"Quieren cederte. Falta tu respuesta.": "임대를 보내려 해요. 답을 기다려요.",
		"Aceptaste salir: te ofrecen a quien pregunte.": "이적에 동의했어요. 문의하는 곳 어디든 제안해요.",
		"Pediste salir: ya no te retienen.": "이적을 요청했어요. 더는 붙잡지 않아요.",
		"Pediste cesión: llegan destinos cada ventana.": "임대를 요청했어요. 이적 시장마다 행선지가 와요.",
		"ULTIMA JORNADA": "마지막 날",
		"Ultima jornada: mañana ya no hay mercado.": "마지막 라운드: 내일이면 이적 시장이 닫혀요.",
		"MERCADO ABIERTO": "이적 시장 오픈",
		"QUEDAN {0}": "{0} 남음",
		"INTERESADO": "관심",
		"Quedan {0} jornadas de mercado.": "이적 시장이 {0}라운드 남았어요.",
		"La ventana cierra esta noche.": "이적 시장이 오늘 밤 닫혀요.",
		"Se cerró la ventana.": "이적 시장이 닫혔어요.",
		"TE VAS": "떠나요",
		"TE QUEDAS": "잔류",
		"ofertas": "제안",
		"la mejor": "최고 제안",
		"pedían": "요구액",
		"Acordado en el último minuto.": "마감 직전에 합의했어요.",
		"Nadie llegó a lo que pedía tu club.": "클럽 요구액을 맞춘 곳이 없었어요.",
		"Se cerró la ventana y no llamó nadie.": "이적 시장이 닫혔고 아무도 연락하지 않았어요.",

		"SE VA LA ESTRELLA": "스타가 떠났다",
		"destino": "행선지",
		"traspaso": "이적료",
		"Con ese dinero llega {0}.": "그 돈으로 {0} 선수를 영입했어요.",
		"Acabó contrato y nadie lo renovó.": "계약이 끝났고 아무도 재계약하지 않았어요.",
		"El club todavía no ha fichado a nadie en su lugar.": "클럽은 아직 대체 선수를 영입하지 못했어요.",
		"Ni un balón, ni una camiseta. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "공 하나, 유니폼 한 장 없어요. 여기 당신 것은 아무것도 남지 않았고, 가져갈 것도 없어요.",
		"Una sola cosa cabe en la maleta. Con una basta para acordarse.": "가방엔 딱 하나만 들어가요. 추억하는 데는 하나면 충분해요.",
		"Lo que cabe en una maleta después de todos estos años.": "그 모든 세월 끝에 가방 하나에 들어가는 것들.",
		"EL DORSAL QUE DEJASTE": "두고 온 등번호",
		"SIGUE AHI": "아직 거기에",
		"EL {0}": "{0}번",
		"lo llevaste": "그때 번호",
		"hoy llevas": "지금 번호",
		"Lo llevaste una temporada. A alguien le bastó.": "한 시즌 달았을 뿐인데, 누군가에겐 그걸로 충분했어요.",
		"Tú cambiaste de número. Él no.": "당신은 번호를 바꿨어요. 그는 아니에요.",
		"EL PORTERO DE ENFRENTE": "상대 골키퍼",
		"YA TE CONOCE": "이미 아는 사이",
		"LE HAS METIDO {0}": "{0}골 넣음",
		"TU VILLANO": "내 천적",
		"TE HA MARCADO {0} EN ESTE DERBI": "이 더비 우리 상대 {0}골",
		"TE CONOCE DE ANTES": "예전부터 아는 사이",
		"CARA A CARA": "맞대결",
		"TE PELEA EL GOLEO": "득점왕 경쟁자",
		"TE PELEA LAS ASISTENCIAS": "도움왕 경쟁자",
		"PRONÓSTICO": "예상",
		"FAVORITO": "우세",
		"{0} TEMPORADAS JUNTOS EN {1}": "{1}에서 함께한 {0}시즌",
		"reencuentros": "재회",
		"Todavía no sabe por dónde le vas a entrar.": "어느 쪽으로 파고들지 아직 몰라요.",
		"Nadie le ha hecho más daño que tú.": "당신만큼 그를 괴롭힌 선수는 없어요.",
		"LA PIZARRA DEL RIVAL": "상대 작전판",
		"ESE ERES TU": "바로 당신",
		"LA CHARLA DE HOY": "오늘의 작전 회의",
		"TE ESPERABAN": "기다리고 있었다",
		"EL VERDUGO": "천적",
		"{0} GOLES DESPUES": "{0}골 이후",
		"No se junta esta gente por un jugador cualquiera.": "아무 선수에게나 이렇게 사람이 모이진 않아요.",
		"De todo lo que hay en esa pizarra, la única foto es la tuya.": "작전판 위 모든 것 중에 사진은 당신 것 하나뿐이에요.",
		"TE CANTAN": "당신의 응원가",
		"OVACION": "기립 박수",
		"TE OVACIONAN": "모두 기립",
		"Aplauden los que venían a verte perder. Eso no lo dan dos veces.":
			"당신이 지는 걸 보러 온 사람들이 박수를 쳐요. 두 번은 없는 일이에요.",
		"domingos": "일요일",
		"tu nota": "내 평점",
		"afición": "팬",
		"No marcaste. Da igual: se aprendieron tu nombre igual.": "골은 없었어요. 상관없어요. 다들 당신 이름을 외웠으니까요.",
		"EMPIEZAS EN EL BANQUILLO": "벤치에서 시작",
		"La primera vez que el once empieza sin ti. Desde aquí también se mira el partido.": "처음으로 선발 11명이 당신 없이 시작해요. 여기서도 경기는 볼 수 있어요.",
		"división": "리그",
		"aforo": "수용 인원",
		"Hasta aquí se sube. Ahora hay que quedarse.": "여기가 꼭대기예요. 이제 버텨야 해요.",
		"Un escalón más. Desde aquí se ve el de arriba.": "한 계단 올랐어요. 여기서 다음 계단이 보여요.",
		"Todo el mundo empieza en un campo como éste.": "누구나 이런 경기장에서 시작해요.",
		"SE RETIRA": "은퇴",
		"La cantera del {1} no para: {0}, {2} años, ya es titular": "{1} 유스는 멈추지 않는다: {0}, {2}세, 벌써 주전",
		"{0}, {2} años, se gana un puesto en el once del {1}": "{0}({2}세), {1} 선발 자리 꿰차",
		"{0}, {2} años, vuelve de su cesión en el {3} y se gana el once del {1}": "{0}({2}세), {3} 임대 마치고 복귀해 {1} 선발 차지",
		"EL ADIOS": "작별",
		"TEMPORADAS EN ESTA CASA": "이 클럽에서 보낸 시즌",
		"Ni una copa que sacar al césped, y el estadio en pie igual.":
			"잔디 위로 들고 나갈 트로피 하나 없지만, 경기장은 모두 일어섰어요.",
		"Aquí empezó todo. Y aquí se acaba, con todo lo que ganaste puesto.":
			"모든 게 여기서 시작됐어요. 그리고 여기서 끝나요, 당신이 따낸 모든 걸 늘어놓고.",
		"Los que te vieron crecer se quedaron de pie hasta el final.":
			"당신의 성장을 지켜본 이들이 끝까지 서 있었어요.",
		"EL BRAZALETE": "주장 완장",
		"tu media": "내 능력치",
		"temporada": "시즌",
		"El vestuario votó y salió tu nombre. Ahora te toca sostenerlo.":
			"라커룸 투표에서 당신 이름이 나왔어요. 이제 그 무게를 견뎌야 해요.",
		"Nadie regala esta cinta: la ganaste domingo a domingo. Ahora no la sueltes.":
			"이 완장은 그냥 주는 게 아니에요. 매주 경기로 따낸 거예요. 이제 놓치지 마세요.",
		"VISITANTE": "원정",
		"VUELTA": "귀환",
		"NO TE HAN PERDONADO": "아직 용서 못 했다",
		"Te fuiste al rival. Cada vez que vuelvas a este campo la grada empezará en tu contra, y eso ya no se quita.":
			"라이벌로 떠났어요. 이 경기장에 돌아올 때마다 관중석은 처음부터 당신에게 등을 돌리고, 그건 영영 사라지지 않아요.",
		"BALÓN DE ORO": "올해의 선수",
		"Ningún equipo levanta esto por ti. Este se gana solo.":
			"이건 팀이 대신 들어 주지 않아요. 혼자 따내는 상이에요.",
		"Tú quedaste {0}.": "최종 순위: {0}.",
		"Tú quedaste {0}, detrás de {1}.": "{1} 선수에 밀려 {0}에 그쳤어요.",
		"{0} GALA JUNTOS: ÉL {1}, TÚ {2}": "함께한 시상식 {0}: 그 {1}, 나 {2}",
		"{0} GALA JUNTOS: {1} {2}, {3} {4}": "함께한 시상식 {0}: {1} {2}, {3} {4}",
		"Este año no entraste en la votación.": "올해는 투표 후보에 오르지 못했어요.",
		"EL MEJOR DEL MUNDO · {0}": "세계 최고 · {0}",
		"TU PRIMER JUGADOR DEL AÑO": "나의 첫 올해의 선수",
		"TU JUGADOR DEL AÑO Nº {0}": "올해의 선수 {0}회째",
		"TEMPORADAS EN EL OFICIO · CIFRAS EN PRIMERA": "커리어 시즌 · 1부 기록",
		"LO DEJA CUANDO QUIERE": "스스로 내린 결정",
		"{0} años. El cuerpo mandó y no hubo discusión.":
			"{0}세. 몸이 결정했고 이견은 없었어요.",
		"Nadie te empujó a esto: te vas de pie, que es como se van los pocos.":
			"누가 떠민 게 아니에요. 서서 떠나는 거예요, 소수만이 그렇게 떠나죠.",
		"FIGURA DEL PARTIDO": "경기 최우수 선수",
		"RENOVACIÓN": "재계약",
		"SE DESPIDE": "작별 인사",
		"SE DESPIDE UNA LEYENDA": "레전드의 작별",
		"SE VA UNA LEYENDA": "레전드가 떠난다",
		"VUELVE UNA LEYENDA": "레전드의 귀환",
		"Te vas siendo leyenda de esta casa. Tu nombre se queda aquí.": "이 클럽의 레전드로 떠나요. 당신 이름은 여기 남아요.",
		"Fuiste leyenda aquí. Vienes de rival y aun así se ponen de pie.": "여기선 레전드였죠. 상대로 돌아왔는데도 다들 일어서요.",

		"HOMENAJE": "기념 경기",
		"Toda una etapa en el mismo club. El club te lo devuelve delante de los tuyos.":
			"한 클럽에서 보낸 한 시대. 클럽이 당신 사람들 앞에서 보답해요.",
		"HOMENAJE en {0}: {1} temporadas de lealtad. Prima de ${2} y la grada rendida.":
			"{0}에서 기념 경기: {1}시즌의 충성. 보너스 ${2}, 관중석은 열광.",
		"LA CAMISETA DEL CLUB ES LA TUYA: {0} unidades": "클럽 유니폼은 당신 것: {0}장",
		"Camisetas: {0} unidades, el nº{1} del vestuario": "유니폼: {0}장, 라커룸 {1}위",
		"Dos minutos de micrófono y a la ducha. Mañana no se acuerda nadie.":
			"마이크 앞에서 2분, 그리고 샤워실로. 내일이면 아무도 기억 못 해요.",
		"Firmado. El club apuesta por ti y ahora hay que devolverlo en el campo.":
			"계약 완료. 클럽이 당신에게 걸었어요. 이제 경기장에서 보답하세요.",
		"Se acabó aquí. Lo que hiciste con esta camiseta ya no te lo quita nadie.":
			"여기서 끝이에요. 이 유니폼을 입고 해낸 건 아무도 못 빼앗아요.",
		"Te llamaron. Ahora hay que ir y quedarse.": "부름을 받았어요. 이제 가서 자리를 지키세요.",
		"ÚLTIMO DÍA EN EL CLUB": "클럽에서의 마지막 날",
		"TITULAR CON TU SELECCIÓN": "대표팀 선발 출전",
		"EN LA LISTA DE TU SELECCIÓN": "대표팀 명단 포함",

		"VAS AL MUNDIAL": "세계 대회에 간다",
		"PIDE TU DORSAL": "등번호 요청",
		"ME QUEDO EL {0}": "{0}번 유지",
		"SIGUES CON EL {0}": "{0}번 유지",
		"CAMBIA TU DORSAL": "등번호 변경",
		"EL {0} ES TUYO HASTA EL PROXIMO TORNEO": "다음 대회까지 {0}번은 내 것",
		"PEDISTE EL {0}": "{0}번 요청함",
		"Un continente entero, y tú dentro.": "대륙 전체, 그리고 그 안에 당신.",
		"AÑOS AL IR AL MUNDIAL": "세계 대회 출전 당시 나이",
		"CONVOCATORIA OFICIAL": "공식 소집",
		"QUEDAS CONVOCADO": "소집 확정",
		"Una carrera cabe en tres o cuatro. Éste es uno.": "커리어에 이런 순간은 서너 번뿐이에요. 이게 그중 하나예요.",
		"RENUEVA UNA TEMPORADA MÁS": "1시즌 재계약",
		"RENUEVA HASTA {0} TEMPORADAS MÁS": "최대 {0}시즌 재계약",



		"SE VA EN VERANO": "여름에 떠난다",
		"FIRMA CON {0} PARA EL VERANO": "여름에 {0} 클럽과 계약",
		"Ya está firmado y todavía quedan cinco meses de temporada. Lo que digas hoy es lo que te van a gritar hasta junio.":
			"이미 계약했는데 시즌은 아직 다섯 달 남았어요. 오늘 하는 말을 6월까지 듣게 될 거예요.",
		"¿POR QUÉ TE VAS?": "왜 떠나요?",
		"Treinta micrófonos y una sola pregunta. Lo que contestes decide quién carga con esto: el míster, la grada o la prensa.":
			"마이크 서른 개, 질문은 하나. 당신 대답에 따라 이 짐을 누가 질지 정해져요. 감독, 관중석, 아니면 언론.",
		"SE LO DIJE AL MÍSTER A LA CARA": "감독에게 직접 말했어요",
		"LE DEBO A ESTA GENTE HASTA JUNIO": "6월까지 팬들에게 빚이 있어요",
		"ES FÚTBOL, NADA PERSONAL": "축구일 뿐, 사적인 건 없어요",
		"YA NO HAY NADA QUE REPARTIR": "더 나눌 게 없어요",
		"EN VERANO": "여름에",
		"TU NUEVO SUELDO POR TEMPORADA": "새 시즌 연봉",
		"GOLES CON ESTA CAMISETA · {0} PARTIDOS": "이 유니폼으로 넣은 골 · {0}경기",
		"AÑOS AL ENTRAR EN LA LISTA": "첫 소집 당시 나이",
		"TU NOTA DEL PARTIDO (×10)": "이번 경기 평점 (×10)",
		"JUGADOR DEL PARTIDO": "경기 최우수 선수",
		"{0} GOLES · JUGADOR DEL PARTIDO": "{0}골 · 경기 최우수 선수",
		"HASTA EL AÑO QUE VIENE": "내년에 또 만나요",
		"PASAR PÁGINA": "다음으로",
		"GOLES EN {0} PARTIDOS · {1} ASISTENCIAS": "{0}경기 득점 · 도움 {1}",
		"Se quedaron a aplaudir igual. Eso también se gana.":
			"그래도 남아서 박수를 쳐 줬어요. 그것도 얻어낸 거예요.",
		"Media grada de vuelta a casa. El año que viene se empieza de cero.":
			"관중 절반이 집으로 향해요. 내년엔 처음부터 다시 시작이에요.",
		"Las gradas se vaciaron antes del pitido. Hay años así.":
			"종료 휘슬 전에 관중석이 비었어요. 그런 해도 있어요.",
		"{0} DE {1} · SIN TÍTULOS": "{1} {0} · 무관",
		"YA FIRMASTE CON OTRO": "이미 다른 곳과 계약",
		"TE VAS Y ELLOS LO SABEN": "떠나는 걸 다들 알아요",
		"SE TE ACABA EL CONTRATO": "계약 만료",
		"SE ACABA TU CESIÓN": "임대 종료",

		"Te vas dejando una vitrina. Esta grada va a tardar en cantarle a otro.":
			"트로피 진열장을 남기고 떠나요. 이 관중석이 다른 선수를 위해 노래하려면 시간이 걸릴 거예요.",
		"No siempre se gana, pero aquí ganaste. Eso ya no te lo quita nadie.":
			"늘 이기는 건 아니지만, 여기선 이겼어요. 그건 아무도 못 빼앗아요.",
		"Ni un título, y aun así están todos de pie. Algo hiciste bien.":
			"트로피 하나 없는데도 모두 일어섰어요. 뭔가 잘한 거예요.",
		"JUGADOR DEL MES": "이달의 선수",
		"MEJOR DEL MES EN TU LIGA": "리그 이달의 선수",
		"TU MEDIA DEL MES (×10)": "이달 평균 평점 (×10)",
		"EL MEJOR DEL MES DE TU LIGA": "리그 이달의 선수",
		"SU MEDIA DEL MES (×10)": "이달 평균 평점 (×10)",
		"GOLES EN EL PARTIDO": "이번 경기 골",
		"goles año": "시즌 골",
		"asist. año": "시즌 도움",
		"SU MEDIA DE LA TEMPORADA (×10)": "시즌 평균 평점 (×10)",
		"El mejor del año de tu competición, y este año no fue para ti.": "대회의 올해 최고 선수. 올해는 당신이 아니었어요.",
		"Este mes fue suyo. El siguiente empieza de cero para los dos.": "이번 달은 그 선수 몫이었어요. 다음 달은 둘 다 0에서 시작해요.",
		"Hoy el micro es suyo. La semana que viene se vuelve a repartir.": "오늘 마이크는 그 선수 몫이에요. 다음 주엔 다시 주인이 바뀌어요.",
		"el listón": "기준선",
		"{0} partidos por encima de todos. El mes siguiente empieza de cero.":
			"{0}경기에서 모두를 앞섰어요. 다음 달은 처음부터 시작이에요.",
		"MEJOR DEL AÑO": "올해의 최고",
		"TU MEDIA DE LA TEMPORADA (×10)": "내 시즌 평균 평점 (×10)",
		"goles": "골",
		"asist.": "도움",
		"partidos": "경기",
		"El mejor del año en tu competición.": "올해 당신 대회의 최고 선수.",
		"ADIÓS INTERNACIONAL": "마지막 A매치",
		"SE RETIRA DE LA SELECCIÓN": "대표팀 은퇴",
		"APARICIONES CON TU PAÍS": "대표팀 출전 횟수",
		"títulos": "우승",
		"La camiseta del país no se cuelga: se entrega. Que la sude otro.":
			"대표팀 유니폼은 거는 게 아니라 물려주는 거예요. 이제 다른 누가 땀 흘릴 차례예요.",
		"NO SE PUDO GUARDAR": "저장 실패",
		"CELEBRACIÓN DE TÍTULOS": "우승 축하",
		"LA CIUDAD ES VUESTRA": "이 도시는 우리 거야",
		"TÍTULOS SOBRE EL AUTOBÚS": "버스 위 트로피",
		"Hay años que se cuentan por títulos. Éste no cabe en una vitrina.":
			"트로피로 세는 해가 있어요. 올해는 진열장 하나로 모자라요.",
		"Dos en la misma temporada. La ciudad no se lo va a callar.":
			"한 시즌에 두 개. 도시가 가만있지 않을 거예요.",
		"Un año entero cabe en esta calle, y toda esta gente vino a verlo.":
			"한 시즌이 이 거리에 다 담겼고, 이 사람들 모두 그걸 보러 왔어요.",

		"RECIBIMIENTO EN EL AYUNTAMIENTO": "시청 환영 행사",
		"LA PLAZA ES VUESTRA": "이 광장은 우리 거야",

		"RECIBIMIENTO EN EL PALACIO": "궁전 환영 행사",
		"EL PAÍS ES VUESTRO": "이 나라는 우리 거야",
		"Un país entero bajo un balcón, y una sola copa que enseñarle.":
			"발코니 아래 나라 전체, 그리고 보여 줄 트로피 하나.",
		"TÍTULOS EN EL BALCÓN": "발코니 위 트로피",
		"Tres títulos y un balcón. El año que nadie esperaba de vosotros.":
			"트로피 세 개와 발코니 하나. 아무도 기대하지 않았던 시즌이에요.",
		"Dos en la misma temporada. Abajo no cabe nadie más.":
			"한 시즌에 두 개. 아래엔 더 들어설 자리가 없어요.",
		"No hizo falta cortar la avenida: vino la ciudad entera aquí.":
			"대로를 막을 필요도 없었어요. 도시 전체가 여기로 왔으니까요.",
		"LA PEÑA DEL CLUB": "서포터즈 클럽",
		"AQUÍ CABE TODO EL CLUB": "클럽 전체가 여기 다 모였어요",
		"TÍTULOS SOBRE LA BARRA": "바 위의 트로피",
		"Tres copas en una barra de seis metros. Ya no caben más.":
			"6미터 바 위에 트로피 세 개. 더는 못 올려요.",
		"Dos en la misma temporada, y el local se quedó pequeño.":
			"한 시즌에 두 개, 가게가 좁아졌어요.",
		"No vino la ciudad entera. Vinieron los que siempre vienen.":
			"도시 전체가 오진 않았어요. 늘 오던 사람들이 왔죠.",
		"SUBIMOS": "승격",
		"SALTARON AL CÉSPED · Y NO CABÍA NADIE MÁS": "그라운드로 뛰어들다 · 빈틈 하나 없이",
		"Subir cambia el club entero: otro presupuesto, otros rivales, otra vida.":
			"승격은 클럽 전체를 바꿔요. 새 예산, 새 상대, 새로운 삶.",
		"PUESTO FINAL · DE {0} EQUIPOS": "최종 순위 · {0}팀 중",
		"El club entero baja contigo: menos presupuesto, otros rivales, y una temporada para volver.":
			"클럽 전체가 함께 강등돼요. 줄어든 예산, 다른 상대, 그리고 다시 올라갈 한 시즌.",
		"CAMPEON": "우승",
		"PASILLO DE HONOR": "가드 오브 아너",
		"EN CASA DE {0}": "{0} 원정",
		"de ventaja": "앞섬",

		"Con jornadas de sobra y ya no hay nada que discutir. Por eso te aplauden ellos.":
			"라운드가 남았는데 이미 끝난 승부예요. 그래서 저들도 박수를 쳐요.",
		"Te lo reconocen los que lo perdieron. No hay elogio mejor.":
			"우승을 놓친 이들이 인정해 줘요. 이보다 큰 칭찬은 없어요.",
		"LA LISTA": "명단",
		"ONCE INICIAL": "선발 11명",
		"TITULARES": "선발",
		"SUPLENTES": "교체",
		"ESTÁS EN EL ONCE": "선발 출전",
		"TE QUEDAS FUERA DEL ONCE": "선발 제외",
		"NO ESTÁS EN LA LISTA": "명단 제외",
		"A ENTRENAR": "훈련하러",
		"El míster te pone de salida. El sitio hay que sostenerlo.":
			"감독이 당신을 선발로 내세웠어요. 이제 그 자리를 지켜야 해요.",
		"Empiezas en el banco. Se recupera jugando, no discutiendo.":
			"벤치에서 시작해요. 자리는 말이 아니라 경기로 되찾는 거예요.",
		"Esta semana ni te vistes. El lunes se vuelve a empezar.":
			"이번 주엔 유니폼도 못 입어요. 월요일에 다시 시작이에요.",
		"EL ESTADIO LLEVA TU NOMBRE": "경기장에 내 이름이",
		"ASÍ SE LLAMA DESDE HOY": "오늘부터 이 이름",
		"TÍTULOS CON ESTE CLUB": "이 클럽에서의 우승",
		"Los que vengan detrás van a jugar en un sitio que se llama como tú. Eso ya no te lo quita nadie.":
			"앞으로 올 선수들은 당신 이름을 단 경기장에서 뛰게 돼요. 그건 아무도 못 빼앗아요.",
		"CAMPEONES": "우승!",
		"TUS GOLES EN ESTE TORNEO · {0} PARTIDOS": "이번 대회 내 골 · {0}경기",
		"CAMPEÓN DE {0}": "{0} 우승",
		"CAMPEÓN · {0}": "우승 · {0}",
		"BIENVENIDO": "환영해요",
		"DE VUELTA": "다시 집으로",
		"Aquí ya sabes dónde está todo. Falta que te vuelvan a ver.": "여기선 어디에 뭐가 있는지 다 알죠. 이제 다시 보여 줄 차례예요.",
		"LLEGAS CEDIDO": "임대 합류",
		"FICHAJE LIBRE": "자유 계약",
		"NUEVO FICHAJE": "신규 영입",
		"EN LAS GRADAS · AFORO {0}": "관중 · 수용 {0}",
		"En equipo": "팀",
		"Individuales": "개인",
		"TRASPASO ${0}": "이적료 ${0}",
		"AL VESTUARIO": "라커룸으로",
		"ESTA SEMANA": "이번 주",
		"PRETEMPORADA": "프리시즌",
		"TU FICHAJE": "내 영입",
		"TU RENOVACIÓN": "내 재계약",
		"FINAL DE TEMPORADA": "시즌 종료",
		"CAMPEÓN": "우승",
		"LA GALA": "시상식",
		"Campeón del mundo. No hay nada por encima de esto.":
			"세계 챔피언. 이보다 위는 없어요.",
		"La noche que Europa se quedó mirándote a ti.": "유럽 전체가 당신만 바라본 밤.",
		"El mejor club del mundo, y tú dentro.": "세계 최고의 클럽, 그리고 그 안에 당신.",
		"Tu continente lleva tu nombre este verano.": "올여름 대륙이 당신 이름을 외쳐요.",
		"Europa por la puerta de atrás. Se entra igual.":
			"뒷문으로 들어간 유럽. 그래도 들어간 건 들어간 거예요.",
		"La tercera copa de Europa también pesa al levantarla.":
			"유럽 세 번째 컵도 들어 올리면 묵직해요.",
		"Nueve meses para esta tarde. Campeones.": "이 오후를 위한 아홉 달. 우승!",
		"Una final, un título. Así de simple y así de difícil.":
			"결승 한 번, 트로피 하나. 그만큼 단순하고, 그만큼 어려워요.",
		"MEJOR DE LA CHAMPIONS": "엘리트컵 MVP",
		"El mejor de Europa en la competición que todos miran.":
			"모두가 지켜보는 대회에서 유럽 최고.",
		"MEJOR DE LA EUROPA LEAGUE": "유로파컵 MVP",
		"El mejor de tu Europa. La otra también se gana jugando.":
			"또 하나의 유럽 무대 최고. 거기서도 경기로 따내는 거예요.",
		"MEJOR DE LA CONFERENCE": "챌린지컵 MVP",
		"El mejor de la tercera Europa. Se juega con la misma pelota.":
			"세 번째 유럽 무대 최고. 공은 똑같아요.",
		"MEJOR JUGADOR DE LA LIGA": "리그 최우수 선수",
		"Nueve meses de competición y el mejor fuiste tú.":
			"아홉 달의 경쟁, 최고는 당신이었어요.",
		"MEJOR DEL MUNDIALITO": "클럽 세계 MVP",
		"Dos partidos contra los campeones del mundo. Mandaste tú.":
			"세계 챔피언들과의 두 경기. 당신이 지배했어요.",
		"MEJOR DE LA COPA": "컵 대회 MVP",
		"El torneo donde un mal día te elimina. No lo tuviste.":
			"하루만 삐끗해도 탈락하는 대회. 당신에겐 그런 날이 없었어요.",
		"LLENO HISTÓRICO": "역대 최다 관중",
		"ESTADIO LLENO": "만원 관중",
		"MEDIA ENTRADA": "절반만 찬 관중석",
		"PRESENTACIÓN DISCRETA": "조용한 입단식",
		"¿Última parada o retiro dorado? La grada vino a averiguarlo.":
			"마지막 정착지일까, 화려한 은퇴 무대일까? 관중이 확인하러 왔어요.",
		"Nadie entiende qué haces aquí. Vinieron por morbo; convéncelos.":
			"다들 당신이 왜 여기 왔는지 몰라요. 구경하러 왔으니, 마음을 사로잡으세요.",
		"Vienen a ver si eres el refuerzo que les faltaba.":
			"당신이 마지막 퍼즐 조각인지 보러 왔어요.",
		"Media grada se acercó a conocer al cedido.": "관중 절반이 임대생을 보러 왔어요.",
		"Una cesión más. Aquí se demuestra jugando.": "또 한 번의 임대. 여기선 경기로 증명해야 해요.",
		"Sin pagar un peso y el estadio no cabe. Eso es un fichajazo.":
			"한 푼도 안 들였는데 경기장이 꽉 찼어요. 이게 바로 대박 영입이죠.",
		"Se agotaron las entradas para ver un fichaje gratis.": "자유 계약 선수를 보려고 매진됐어요.",
		"Llegas libre y media grada quiso verte la cara.":
			"자유 계약으로 왔는데 관중 절반이 얼굴 보러 왔어요.",
		"Sin traspaso y sin ruido. El ruido lo haces tú.":
			"이적료도 없고 소란도 없어요. 소란은 당신이 만들면 돼요.",
		"El club paró la ciudad para presentarte. No se olvida un día así.":
			"클럽이 당신을 소개하려고 도시를 멈춰 세웠어요. 이런 날은 잊히지 않아요.",
		"Lleno para ver a su fichaje. Ahora hay que responder.":
			"새 영입을 보려고 만원이에요. 이제 보답할 차례예요.",
		"Media entrada. Te conocen; falta que te quieran.":
			"관중석이 절반. 다들 당신을 알아요. 이제 사랑받을 차례예요.",
		"El mejor jugador del mundo es suyo. No cabe un alma para verlo.":
			"세계 최고의 선수가 이 클럽에 왔어요. 빈자리 하나 없어요.",
		"Cuatro curiosos y una cámara. Aquí se empieza desde abajo.":
			"구경꾼 몇 명과 카메라 한 대. 여기선 바닥부터 시작이에요.",
		"Yo también creí que nadie me alcanzaría. Sigue así.":
			"나도 아무도 날 따라잡지 못할 줄 알았지. 계속 그렇게 해.",
		"Los títulos pesan más cuando los cuentan otros. Ya son más los tuyos.":
			"트로피는 남이 셀 때 더 무거운 법이야. 이제 네 게 더 많아.",
		"Me costó una vida llegar ahí arriba. A ti te va a costar quedarte.":
			"난 거기까지 오르는 데 평생이 걸렸어. 넌 그 자리를 지키는 데 그만큼 걸릴 거야.",
		"No te acostumbres a mirar hacia abajo. Sigue ganando.":
			"아래를 내려다보는 데 익숙해지지 마. 계속 이겨.",
		"Bienvenido. Aquí arriba se está solo, pero se ve todo.":
			"환영해. 여긴 외롭지만 다 보여.",
		"Cada gol mío lo llevo contado. Ahora los tuyos son más. Sigue.":
			"내 골은 하나하나 다 세어 뒀어. 이제 네 게 더 많아. 계속 가.",
		"Yo marqué hasta el último día. Tú vas más rápido que yo.":
			"난 마지막 날까지 골을 넣었어. 넌 나보다 빨라.",
		"Los números se rompen para eso. Que alguien rompa los tuyos.":
			"기록은 깨지라고 있는 거야. 누군가 네 기록도 깨 주길.",
		"No pares ahora: al que deja de marcar lo alcanzan en un año.":
			"지금 멈추지 마. 골을 못 넣으면 1년 안에 따라잡혀.",
		"Me tocó verlo desde aquí. Sigue así y no te alcanza nadie.":
			"난 여기서 지켜볼 수밖에 없었어. 이대로만 가면 아무도 널 못 따라잡아.",
		"MÁS TÍTULOS DE LA HISTORIA": "역대 최다 우승",
		"MÁS TÍTULOS": "최다 우승",
		"trofeos": "트로피",



		"MEJOR JUGADOR DE LA HISTORIA": "역대 최고의 선수",
		"YA NO QUEDA NADIE POR DELANTE": "이제 앞엔 아무도 없다",
		"DE LA HISTORIA": "역대",
		"Todavía no he colgado las botas. Nos vemos en el campo.":
			"난 아직 은퇴 안 했어. 경기장에서 보자.",
		"Disfrútalo, que esta temporada pienso quitártelo.":
			"즐겨 둬. 이번 시즌에 도로 뺏어 갈 거니까.",
		"Pasarme con los dos en activo tiene mérito. Ahora aguántalo.":
			"둘 다 현역일 때 날 넘다니 대단해. 이제 지켜 봐.",
		"Sigo jugando, y ya sé a quién me toca perseguir.":
			"난 아직 뛰고 있어. 이제 누굴 쫓아야 할지 알겠네.",
		"Si me tenía que pasar alguien, mejor uno de casa. Sigamos ganando juntos.":
			"누가 날 넘어야 한다면 우리 식구가 낫지. 계속 같이 이기자.",
		"Hoy te lo celebro yo. Mañana, a entrenar como siempre.":
			"오늘은 내가 축하해 줄게. 내일은 평소처럼 훈련이야.",
		"Que se entere el vestuario: aquí jugamos dos de los grandes.":
			"라커룸에 알려. 여기 거물이 둘이나 뛴다고.",
		"Ya no hay nadie delante de ti. Yo sigo jugando, así que no te relajes.":
			"이제 네 앞엔 아무도 없어. 난 아직 뛰고 있으니까 방심하지 마.",
		"Ya no hay nadie delante de ti. Ahora el nombre a batir es el tuyo.":
			"이제 네 앞엔 아무도 없어. 이제 넘어야 할 이름은 네 이름이야.",

		"{0}G {1}A": "{0}G {1}A",
		"media": "평균",
		"clubes": "클럽",
		"A {0}": "{0}행",
		"temporadas": "시즌",
		"Ni un balón. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "공 하나 없어요. 여기 당신 것은 아무것도 남지 않았고, 가져갈 것도 없어요.",
		"La maleta va vacía. Lo que dejaste aquí no cabe en ella: se queda en la grada.": "가방은 텅 비었어요. 여기 남긴 건 가방에 안 들어가요. 관중석에 남아요.",
		"dorsal": "등번호",
		"{0} {1} · JUGADOR DEL PARTIDO": "{0} {1} · 경기 최우수 선수",
		"tiros": "슈팅",
		"pases": "패스",
		"RECORD": "기록",
		"¡A {0}!": "{0}까지!",
		"puntos": "승점",
		"jornadas": "남은 경기",
		"ligas": "리그",
		"copas": "컵",
		"europas": "유럽컵",
		"ascensos": "승격",
		"Este club no había ganado nada parecido en toda su historia. Lo trajiste tú, y aquí no se va a olvidar.":
			"이 클럽은 역사상 이런 걸 한 번도 따낸 적이 없었어요. 당신이 가져왔고, 여기선 절대 잊지 않을 거예요.",
		"MENU PRINCIPAL": "메인 메뉴",
		"UN JUEGO DE": "제작",
		"Clubes, ligas, competiciones, estadios y jugadores son ficticios. Football Legacy no está afiliado, patrocinado ni respaldado por ninguna liga, club, federación o competición real.": "클럽, 리그, 대회, 경기장, 선수는 모두 가상입니다. Football Legacy는 실제 리그, 클럽, 협회, 대회와 제휴, 후원, 보증 관계가 없습니다.",
		"CODIGO · DISENO · ARTE · SONIDO": "코드 · 디자인 · 아트 · 사운드",
		"TU PRESENTACION": "내 입단식",
		"SELECCION T{0}": "대표팀 S{0}",
		"TU MEJOR GOL": "내 최고의 골",
		"GOLES DE CARRERA": "커리어 골",
		"Completa una temporada en {0} división o ficha por un club de {1} para desbloquear.":
			"{0} 리그에서 한 시즌을 마치거나 {1} 리그 클럽과 계약하면 해금돼요.",






















		"COMO SALE": "나오는 방식",
		"CELEBRACION NUEVA": "새 세리머니",
		"CELEBRACIONES": "세리머니",
		"SITIOS": "장소",
		"GESTOS": "동작",


		"Celebración por descubrir. Sigue marcando goles.":
			"아직 발견하지 못한 세리머니. 계속 골을 넣으세요.",


		"ESCENAS": "장면",
		"GLORIA": "영광",
		"DUELO": "아픔",
		"MOMENTOS": "순간",
		"REVIVIR": "다시 보기",
		"Toca para revivir cómo fue.": "터치해서 그 순간을 다시 보세요.",
		"Puedes verla otra vez con el botón.": "버튼으로 다시 볼 수 있어요.",
		"Escena por vivir. Sigue jugando tu carrera.": "아직 겪지 못한 장면. 커리어를 계속하세요.",
		"EL ASCENSO": "승격",
		"LA VUELTA CON LA COPA": "트로피 들고 한 바퀴",
		"LA GALA DEL JUGADOR DEL AÑO": "올해의 선수 시상식",
		"LA GALA DEL CLUB": "클럽 시상식",
		"LA GALA DE LA LIGA": "리그 시상식",
		"EL RECORD": "기록",
		"LA LEYENDA TE SALUDA": "레전드의 인사",
		"TU SITIO EN LA HISTORIA": "역사 속 내 자리",
		"EL ESTADIO CON TU NOMBRE": "내 이름의 경기장",
		"EL HOMENAJE": "헌정식",
		"EL DESFILE": "퍼레이드",
		"EL BALCON DEL AYUNTAMIENTO": "시청 발코니",
		"LA PEÑA DEL BARRIO": "동네 서포터즈 클럽",
		"LAS PANTALLAS DE NUEVA YORK": "뉴욕의 전광판",
		"LA COPA VUELVE EN AVION": "비행기로 돌아온 트로피",
		"LA OVACION AJENA": "원정 관중의 기립 박수",
		"TU CANTO EN LA GRADA": "관중석의 내 응원가",
		"EL PASILLO DEL RIVAL": "라이벌의 가드 오브 아너",
		"LA PRIMERA CONVOCATORIA": "첫 소집",
		"LA LISTA DEL MUNDIAL": "세계 대회 명단",
		"TU VIEJO DORSAL": "내 옛 등번호",
		"EL BAR DEL BARRIO": "동네 술집",
		"EL DESCENSO": "강등",
		"SUBCAMPEON": "준우승",
		"LA FINAL PERDIDA": "놓친 결승",
		"LA ULTIMA TARDE": "마지막 오후",
		"LA LESION": "부상",
		"LA PRIMERA BANCA": "첫 벤치",
		"LA PITADA": "야유",
		"EL TECNICO SE VA": "감독이 떠난다",
		"LA TAQUILLA VACIA": "빈 라커",
		"SE FUE AL RIVAL": "라이벌로 떠났다",
		"LA VUELTA AL CAMPO ENEMIGO": "적지로의 귀환",
		"EL RECIBIMIENTO AL VERDUGO": "천적 환영식",
		"LA DESPEDIDA DEL VESTUARIO": "라커룸 작별",
		"EL ULTIMO PARTIDO EN CASA": "마지막 홈경기",
		"EL ADIOS A LA SELECCION": "대표팀과의 작별",
		"EL PASILLO DE HONOR": "가드 오브 아너",
		"LA PRESENTACION": "입단식",
		"LA BIENVENIDA": "환영식",
		"LA FIRMA": "계약 서명",
		"LA RUEDA DE PRENSA": "기자회견",
		"LA PREGUNTA DEL PRECONTRATO": "사전 계약 질문",
		"EL OJEADOR EN LA TRIBUNA": "관중석의 스카우트",
		"LLEGA EL REFUERZO": "지원군 도착",
		"LOS FICHAJES DEL VERANO": "여름 이적 영입",
		"LA NOCHE DEL CIERRE": "마감의 밤",
		"TU FICHAJE EN LA PORTADA": "1면을 장식한 내 이적",
		"LA CHARLA CON EL COMPAÑERO": "동료와의 대화",
		"LA LISTA DE LA SELECCION": "대표팀 명단",
		"EL VESTUARIO DE COPA": "컵 대회 라커룸",
		"EL VESTUARIO DEL DERBI": "더비 라커룸",
		"LA PORTADA DEL DERBI": "더비 1면",
		"EL MARCADOR DEL DERBI": "더비 전광판",
		"EL ESPEJO DEL DERBI": "더비의 거울",
		"EL HUECO DEL DERBI": "더비의 빈자리",
		"EL PORTERO TE CONOCE": "나를 아는 골키퍼",
		"LA TANDA DE PENALES": "승부차기",
		"EL RECUERDO": "기념품",
		"LA PASARELA DE EQUIPACIONES": "유니폼 런웨이",

		"LOS AUTOGRAFOS EN LA PUERTA": "문 앞의 사인 요청",
		"FIRMA LA CAMISETA": "유니폼에 사인하기",
		"TRES CAMISETAS PARA LA GRADA": "관중석에 유니폼 세 장",
		"CAMISETAS FIRMADAS": "사인한 유니폼",
		"Ganaste, y tres se van a casa con tu firma.": "이겼고, 세 명이 당신 사인을 들고 집에 가요.",
		"No hubo victoria, pero tres se van a casa con tu firma.": "이기진 못했지만, 세 명이 당신 사인을 들고 집에 가요.",
		"LAS FIRMAS EN LA GRADA": "관중석 사인회",
		"LA FIRMA DE FOTOS": "사진 사인회",
		"FIRMA LA FOTO": "사진에 사인하기",
		"FOTOS FIRMADAS": "사인한 사진",
		"EVENTO CON LA AFICION": "팬 이벤트",
		"FIRMA DE FOTOS": "사진 사인회",
		"Tu primer evento con la afición: cinco fotos con tu firma.": "첫 팬 이벤트: 사인한 사진 다섯 장.",
		"Y la cola seguía: {0} más esperando su foto.": "줄은 계속됐어요. 사진을 기다리는 사람이 {0}명 더 있어요.",
		"Cinco fotos con tu firma, cinco que se van contentos.": "사인한 사진 다섯 장, 다섯 명의 행복한 팬.",
		"Firma con el dedo": "손가락으로 사인하세요",
		"BORRAR FIRMA": "사인 지우기",
		"AFICIÓN +{0}": "팬 +{0}",
		"AFICIONADOS ESPERANDO": "기다리는 팬들",
		"TU PRIMER AUTÓGRAFO": "내 첫 사인",
		"TE ESPERABAN EN LA PUERTA": "문 앞에서 기다린 팬들",
		"Pocos, pero vinieron por ti. Así empieza todo.": "몇 명뿐이지만, 당신을 보러 왔어요. 모든 건 이렇게 시작돼요.",
		"Ya te reconocen desde lejos. Y tu coche también.": "이제 멀리서도 알아봐요. 당신 차까지도요.",
		"Llegar a entrenar ya es un acontecimiento.": "훈련장에 도착하는 것만으로도 이제 큰 행사예요.",
		"Primer Autógrafo": "첫 사인",
		"Firmar una camiseta a la gente que te espera en la puerta de la ciudad deportiva.": "훈련장 문 앞에서 기다리는 사람들에게 유니폼에 사인해 주기.",

		"La Más Vendida": "판매왕",
		"Que tu camiseta sea la más vendida del vestuario en una temporada.": "한 시즌 동안 팀 내 유니폼 판매 1위 하기.",
		"All-in": "올인",
		"Ganar el torneo de póquer de tu casa.": "내 집 포커 대회에서 우승하기.",
		"La Ley del Ex": "친정 킬러",
		"Marcarle un gol a un club del que te fuiste.": "떠난 클럽을 상대로 골 넣기.",
		"Una Vida Entera": "한평생",
		"Vivir 50 escenas distintas del álbum en una misma carrera.": "한 커리어에서 앨범 장면 50개를 서로 다르게 경험하기.",
		"Conquistador de Europa": "유럽 정복자",
		"Conquistador de Sudamérica": "남미 정복자",
		"Conquistador de Norteamérica": "북중미 정복자",
		"Conquistador de África": "아프리카 정복자",
		"Conquistador de Asia": "아시아 정복자",
		"Conquistador de Oceanía": "오세아니아 정복자",
		"Libro Completo": "완전한 책",
		"Vencer a todos los clubes y selecciones de Europa.": "유럽의 모든 클럽과 국가대표팀 이기기.",
		"Vencer a todos los clubes y selecciones de Sudamérica.": "남미의 모든 클럽과 국가대표팀 이기기.",
		"Vencer a todos los clubes y selecciones de Norteamérica, Centroamérica y el Caribe.": "북미, 중미, 카리브해의 모든 클럽과 국가대표팀 이기기.",
		"Vencer a todos los clubes y selecciones de África.": "아프리카의 모든 클럽과 국가대표팀 이기기.",
		"Vencer a todos los clubes y selecciones de Asia.": "아시아의 모든 클럽과 국가대표팀 이기기.",
		"Vencer a todos los clubes y selecciones de Oceanía.": "오세아니아의 모든 클럽과 국가대표팀 이기기.",
		"Vencer a todos los rivales del juego: cada club y cada selección del mundo.": "게임 속 모든 상대 이기기: 전 세계 모든 클럽과 모든 국가대표팀.",
		"Álbum Completo": "앨범 완성",
		"Descubrir todos los arquetipos de pareja.": "모든 연인 유형 발견하기.",
		"Rodeado": "인산인해",
		"Firmar autógrafos con 40 aficionados o más esperándote en la puerta.": "문 앞에서 팬 40명 이상이 기다릴 때 사인해 주기.",
		"Turista de Estadios": "경기장 투어리스트",
		"Jugar en 25 estadios distintos.": "서로 다른 경기장 25곳에서 뛰기.",
		"El Brazalete": "주장 완장",
		"Ser el capitán de tu club.": "소속 클럽의 주장 되기.",
		"Desde los Once Metros": "11미터에서",
		"Marcar el penal que gana una tanda.": "승부차기를 끝내는 페널티킥 성공하기.",
		"Carta de Presentación": "명함",
		"Marcar en tu debut con un club nuevo.": "새 클럽 데뷔전에서 골 넣기.",
		"De Hierro": "철인",
		"Jugar 20 partidos o más en una temporada sin perderte ninguno por lesión.": "한 시즌에 부상 결장 없이 20경기 이상 뛰기.",
		"Niño Prodigio": "신동",
		"Debutar en Primera División antes de cumplir 18 años.": "18세가 되기 전에 1부 리그 데뷔하기.",
		"Roble Viejo": "노장의 품격",
		"Marcar un gol con 38 años o más.": "38세 이상의 나이로 골 넣기.",
		"EL ALTA MEDICA": "복귀 승인",
		"LA MUDANZA": "이사",
		"LAS OFERTAS DEL REGRESO": "복귀 제안",
		"¡ALARMA!": "비상!",
		"MUSEO DE {0}": "{0} 박물관",
		"¿ME FIRMA LA GORRA?": "모자에 사인해 줄래요?",
		"EL MUSEO DE TU EGO": "내 자존심 박물관",
		"CLASE DE BAILE": "댄스 교실",
		"PROFESOR: {0}": "강사: {0}",
		"LA CLASE DE LAS ABUELAS": "할머니들의 수업",
		"ESTRENO MUNDIAL": "세계 최초 공개",
		"LA PELÍCULA DE {0}": "{0}의 영화",
		"LA PELÍCULA DE TU VIDA": "내 인생 영화",
		"DURACIÓN: 4 H 38 MIN": "상영 시간: 4시간 38분",
		"EL ESTRENO": "시사회",
		"TODAS LAS ESCENAS": "모든 장면",
		"Tu vida, en cines. Dura cuatro horas y media y nadie se ha ido.": "당신의 인생이 극장에. 네 시간 반짜리인데 아무도 안 나갔어요.",
		"¡NO ME CUENTES EL FINAL!": "결말 말하지 마!",
		"MARTES, 19:00": "화요일 19:00",
		"MÍSTERS ANÓNIMOS": "익명의 감독 모임",
		"PASO 1: ACEPTAR QUE LO SENTASTE": "1단계: 벤치에 앉힌 걸 인정하기",
		"TERAPIA DE MÍSTERS": "감독 테라피",
		"TERAPIA DE MISTERS": "감독 테라피",
		"TODOS LOS TÉCNICOS": "모든 감독",
		"Los has tenido a todos. Ahora se reúnen los martes para superarlo.": "모든 감독을 겪어 봤죠. 이제 그들은 화요일마다 모여서 극복 중이에요.",
		"¡ES ÉL! ¡EL QUE PEDÍA SER TITULAR!": "저 사람이야! 선발 달라고 조르던 그 선수!",
		"RESERVA PARA SIETE": "7인 예약",
		"LA CENA DE LAS EX": "전 연인들의 저녁 식사",
		"TODAS LAS PAREJAS": "모든 연인",
		"Las has conocido a todas. Todas. En la misma mesa.": "모두 만나 봤죠. 전부 다. 한 테이블에서.",
		"PAGA ÉL, ¿NO?": "계산은 쟤가 하는 거지?",
		"DOMINGO, 13:00": "일요일 13:00",
		"LOS DERROTADOS": "패배자들",
		"BARBACOA DE LOS DERROTADOS": "패배자들의 바비큐",
		"TODOS LOS RIVALES": "모든 상대",
		"Les ganaste a todos. Te invitaron igual. La salchicha, quemada.": "모두 이겼어요. 그래도 초대해 줬어요. 소시지는 탔어요.",
		"BARBACOA ANUAL": "연례 바비큐",
		"PERDIMOS CONTRA {0}": "{0}에게 졌다",
		"TE GUARDAMOS LA SALCHICHA QUEMADA": "탄 소시지 남겨 놨어",
		"03:12 · MUSEO CERRADO": "03:12 · 박물관 폐관",
		"EL CONSERJE DEL SALÓN": "명예의 전당 관리인",
		"TU PRIMERA PLACA": "내 첫 명판",
		"Ya estás en el Salón de la Fama. El conserje tiene la foto que lo demuestra.": "이제 명예의 전당에 올랐어요. 관리인한테 증거 사진이 있어요.",
		"PARA MI CUÑADO, QUE NO SE LO CREE": "못 믿는 우리 매형한테 줄 거예요",
		"INAUGURACIÓN": "제막식",
		"TU ESTATUA": "내 동상",
		"LA ESTATUA": "동상",
		"TODA LA COLECCIÓN": "전체 컬렉션",
		"Lo has completado todo. Te han hecho una estatua. El pelo es del utillero.": "모든 걸 다 이뤘어요. 동상까지 세워 줬어요. 머리카락은 장비 담당 거예요.",
		"LEYENDA ETERNA": "영원한 레전드",
		"¿ESE PELO ES DEL UTILLERO?": "저 머리, 장비 담당 거야?",
		"TODOS LOS FESTEJOS": "모든 세리머니",
		"Te sabes todos los festejos. Ahora ellas también.": "모든 세리머니를 다 알죠. 이제 할머니들도 알아요.",
		"¡AHORA LA DE QUITARSE LA CAMISETA!": "이번엔 상의 벗는 거!",
		"TODOS LOS LOGROS": "모든 업적",
		"Lo tienes todo. Hasta el guardia de noche es fan tuyo.": "다 가졌어요. 야간 경비원까지 당신 팬이에요.",
		"LA FIRMA DEL REGRESO": "복귀 계약",


		"EL BANDERIN": "코너 깃발",
		"El clásico: todo el equipo corre al banderín del lado por donde entró el balón.":
			"정석: 팀 전체가 공이 들어온 쪽 코너 깃발로 달려가요.",
		"CON LA GENTE": "팬들에게로",
		"Al fondo, detrás de la línea de gol. En casa, además, te abrazas con un aficionado.":
			"골라인 뒤쪽 끝까지. 홈에선 팬과 포옹도 해요.",
		"LA PIÑA": "단체 포옹",
		"Nadie se va a ningún lado: la montonera se arma justo donde marcaste.":
			"아무 데도 안 가요. 골 넣은 바로 그 자리에서 다들 겹겹이 쌓여요.",
		"CON LOS SUPLENTES": "교체 선수들과",
		"A la banda, con los suplentes. El gol del que acaba de entrar se festeja con los que siguen en el banco.":
			"터치라인으로, 교체 선수들에게. 막 투입된 선수의 골은 아직 벤치에 있는 동료들과 함께 축하해요.",
		"AL CENTRO": "센터서클로",
		"Balón bajo el brazo y a sacar de nuevo. Todavía no hay nada que festejar.":
			"공을 옆구리에 끼고 바로 재개하러 가요. 아직 축하할 때가 아니에요.",
		"TU RINCON": "내 구석",
		"Sólo de visita: a la esquina donde está tu puñado de aficionados.":
			"원정 한정: 당신의 원정 팬 몇 명이 있는 구석으로 가요.",
		"SALTAR LA VALLA": "펜스 넘기",
		"Sólo en casa: saltas la publicidad y te vas hasta el pie de la grada. Esa esquina se vuelve loca.":
			"홈 한정: 광고판을 넘어 관중석 바로 앞까지 가요. 그쪽 구석이 난리 나요.",
		"AL TECNICO": "감독에게",
		"Vienes de bronca con el entrenador y te vas a la raya a abrazarlo. Una sola vez por partido.":
			"감독과 불화가 있었지만, 터치라인으로 달려가 감독을 안아요. 경기당 한 번만.",
		"EN SU CASA": "적진에서",
		"Gol en un derbi, de visita: lo festejas frente a su fondo. Te abuchea el estadio entero y te llueven botellas.":
			"원정 더비 골을 상대 서포터석 앞에서 축하해요. 경기장 전체가 야유하고 물병이 쏟아져요.",
		"PARA LA TELE": "카메라 앞으로",
		"Te plantas delante de la cámara de televisión y el gol se ve por su visor. Sólo donde hay transmisión: en tercera no hay cámaras.":
			"TV 카메라 앞에 딱 서서, 골 장면이 뷰파인더에 잡혀요. 중계가 있는 곳만: 3부엔 카메라가 없어요.",
		"ES NUESTRO": "우리 거야",
		"Última jornada, y el gol te pone por delante. Salta hasta el banquillo al campo.":
			"마지막 라운드, 당신 골로 앞서 나가요. 벤치까지 그라운드로 쏟아져 나와요.",


		"DE RODILLAS": "무릎 슬라이딩",
		"Llegas barriéndote de rodillas. Una de cada tres veces, en los festejos con carrera de verdad.":
			"무릎으로 미끄러지며 도착해요. 제대로 달려가는 세리머니에서 세 번에 한 번.",
		"PUÑO AL AIRE": "주먹 불끈",
		"El salto con el puño cerrado, en el gol agónico que lo cambia todo.":
			"극장골로 모든 게 바뀔 때, 주먹을 꽉 쥐고 점프해요.",
		"BALON A LA GRADA": "관중석으로 뻥",
		"La otra cara del gol agónico: reventar el balón hacia arriba y que caiga donde caiga.":
			"극장골의 또 다른 얼굴: 공을 하늘로 뻥 차 버리고, 어디 떨어지든 상관없어요.",
		"BANDERIN PARTIDO": "부러진 깃대",
		"Llegas al córner y le metes una patada al mástil. Se parte. Uno de cada seis córners.":
			"코너로 가서 깃대를 걷어차요. 부러져요. 코너 세리머니 여섯 번에 한 번.",
		"MASTIL AGARRADO": "깃대 잡기",
		"Llegas al córner, agarras el mástil con el puño y te plantas con la mano en la cadera.": "코너로 가서 깃대를 주먹으로 움켜쥐고, 허리에 손을 얹고 버티고 서요.",
		"SIN CAMISETA": "상의 탈의",
		"Te quitas la camiseta y les enseñas el dorsal. Siempre trae factura: abucheo y botellas.":
			"유니폼을 벗고 등번호를 보여 줘요. 대가는 늘 따라와요: 야유와 물병.",
		"EL SILENCIO": "침묵",
		"Plantarte quieto frente a su fondo mientras el estadio te abuchea. No hacer nada es el gesto.":
			"경기장이 야유하는 동안 상대 서포터석 앞에 가만히 서 있어요. 아무것도 안 하는 게 세리머니예요.",
		"BRAZOS ABIERTOS": "양팔 활짝",
		"Con el brazalete de tu país: brazos abiertos, pidiéndole más a tu gente.":
			"대표팀 주장 완장을 차고: 양팔을 활짝 펴고 팬들에게 더 크게 외쳐 달라고 해요.",
		"GRACIAS, SOCIO": "고마워, 친구",
		"El gol lo empezó otro: vino de un centro o de un córner, y lo primero que haces es señalar a quien lo puso.":
			"골의 시작은 다른 선수였어요. 크로스나 코너킥에서 나왔고, 맨 먼저 그걸 올려 준 선수를 가리켜요.",
		"LA REVERENCIA": "인사",
		"Un golazo: desde fuera del área o de falta directa. Te giras hacia la grada y te inclinas. La mitad de las veces.":
			"원더골: 박스 밖이나 직접 프리킥. 관중석을 향해 돌아서서 고개 숙여 인사해요. 두 번에 한 번.",
		"BESO AL ESCUDO": "엠블럼 키스",
		"Tres temporadas o más en el mismo club. Ya no eres un fichaje, eres de la casa: besas el escudo y la grada lo sabe.":
			"같은 클럽에서 세 시즌 이상. 이제 영입생이 아니라 식구예요. 엠블럼에 입을 맞추면 관중석도 알아요.",
		"TRES DEDOS": "손가락 셋",
		"Tu tercer gol del partido. No hay nada que explicar: levantas tres dedos y que los cuenten ellos.":
			"이 경기 세 번째 골. 설명은 필요 없어요. 손가락 세 개를 들고 세는 건 저들에게 맡겨요.",
		"SIN FESTEJAR": "세리머니 자제",
		"Le marcaste al club que te formó. Te quedas quieto, con la mano en alto. Los otros nueve vienen a abrazarte igual.":
			"당신을 키운 클럽을 상대로 골을 넣었어요. 손을 들고 가만히 서 있어요. 나머지 아홉 명은 그래도 안아 주러 와요.",
		"AL CIELO": "하늘로",
		"Tu primer gol después de una lesión larga. Señalas al cielo. Sólo cuenta ese gol, no los de después.":
			"긴 부상 뒤 첫 골. 하늘을 가리켜요. 그 골만 해당되고, 그 뒤의 골은 아니에요.",


		"A TU PORTERO":
			"우리 골키퍼에게",
		"Tu portero te salvó el partido con una parada. El festejo se va hacia TU campo y él viene corriendo desde su área.":
			"골키퍼가 선방 하나로 경기를 구했어요. 세리머니는 내 진영으로 향하고, 그는 자기 박스에서 달려와요.",
		"AL FOSO":
			"펜스 앞으로",
		"Sólo de noche, con los focos encendidos: te plantas contra la valla del fondo y el estadio entero se te llena de flashes.":
			"밤 경기, 조명이 켜졌을 때만: 골대 뒤 펜스에 딱 붙어 서면 경기장 전체가 플래시로 반짝여요.",
		"A LA TRIBUNA":
			"본부석으로",
		"Hay clubes preguntando por ti. Te vas a la banda de la tribuna principal y señalas hacia el palco: que decidan ellos.":
			"당신에게 관심 있는 클럽들이 있어요. 본부석 쪽 터치라인으로 가서 VIP석을 가리켜요. 결정은 그들 몫.",
		"EN SU AREA":
			"상대 박스에서",
		"Derbi de visita: no corres a ningún lado. Te plantas en el punto de penalti, de espaldas al arco y de cara a su gente, con los brazos abiertos.":
			"원정 더비: 아무 데도 안 달려요. 페널티 스폿에 서서 골문을 등지고, 상대 팬들을 마주한 채 양팔을 활짝 펴요.",
		"NADIE VIENE":
			"아무도 안 온다",
		"El vestuario no te quiere. Marcas, y ninguno de los diez va a abrazarte: se dan la vuelta y te dejan ahí.":
			"라커룸이 등을 돌렸어요. 골을 넣어도 열 명 중 누구도 안아 주러 오지 않아요. 돌아서서 당신을 거기 내버려 둬요.",
		"MAS RUIDO":
			"더 크게",
		"En casa: las dos manos a las orejas, pidiéndole a tu gente que se oiga.":
			"홈에서: 두 손을 귀에 대고 팬들에게 더 크게 외쳐 달라고 해요.",
		"BESAR EL CESPED":
			"잔디 키스",
		"Tu primera temporada en el club: te arrodillas y besas el césped de tu casa nueva.":
			"클럽에서의 첫 시즌: 무릎을 꿇고 새 홈 구장 잔디에 입을 맞춰요.",
		"APLAUSO A TU GENTE":
			"팬들에게 박수",
		"Marcas, pero seguís perdiendo: nada de gritos, aplaudes a los que vinieron a verte.":
			"골을 넣었지만 아직 지고 있어요. 소리 지르지 않고, 보러 와 준 팬들에게 박수를 쳐요.",
		"SALUDO DE GOLEADA":
			"대승 인사",
		"Con tres goles o más de ventaja ya no hay nada que gritar: caminas saludando a la grada.":
			"세 골 이상 앞서면 더 외칠 것도 없어요. 걸어가며 관중석에 손을 흔들어요.",
		"SALTO DE CABEZA":
			"헤더 점프",
		"Gol por alto: saltas una y otra vez con los brazos al cielo.":
			"공중볼 골: 양팔을 하늘로 뻗고 몇 번이고 점프해요.",
		"EL AVION":
			"비행기",
		"Corres al festejo con los brazos abiertos, planeando como un avión. Sólo en los festejos con carrera de verdad.":
			"양팔을 활짝 펴고 비행기처럼 날아가며 달려가요. 제대로 달려가는 세리머니에서만.",
		"LA SELFIE":
			"셀카",
		"Pegado a tu gente —tu fondo o la valla en casa, tu rincón de visita—: sacas el teléfono y te haces una foto con ellos.":
			"팬들 바로 앞에서 (홈에선 서포터석이나 펜스, 원정에선 내 구석) 휴대폰을 꺼내 함께 사진을 찍어요.",
		"ES MI HORA":
			"내 시간",
		"Gol del minuto 80 en adelante: te señalas la muñeca, que es tu hora. Una de cada tres veces.":
			"80분 이후의 골: 손목을 톡톡, 지금이 내 시간이에요. 세 번에 한 번.",
		"MODO ZEN":
			"명상 모드",
		"Con dos goles de ventaja o más: te sientas en el césped con las piernas cruzadas y meditas. Que se preocupen ellos.":
			"두 골 이상 앞서면: 잔디에 책상다리로 앉아 명상해요. 걱정은 저쪽 몫이에요.",
		"BESO AL ANILLO":
			"반지 키스",
		"Tienes pareja: besas el anillo y señalas a la grada, a quien te mira desde allí. Uno de cada cinco goles.":
			"연인이 있을 때: 반지에 입을 맞추고 관중석에서 지켜보는 그 사람을 가리켜요. 다섯 골에 한 번.",
		"MI NOMBRE":
			"내 이름",
		"Hay clubes preguntando por ti: te das la vuelta y te señalas el nombre de la espalda para que lo apunten. La mitad de las veces.":
			"당신에게 관심 있는 클럽들이 있어요. 돌아서서 등의 이름을 가리켜요, 잘 적어 두라고. 두 번에 한 번.",
		"LA MORTAL":
			"백덤블링",
		"Un golazo, desde fuera del área o de falta: llegas, tomas impulso y das una mortal hacia atrás. La otra mitad de los golazos.":
			"원더골, 박스 밖이나 프리킥: 도착해서 도움닫기 후 뒤로 공중제비를 돌아요. 원더골의 나머지 절반.",
		"EL DAB":
			"댑",
		"Se gana en el banquillo, con tus tres botellas de pie: escondes la cara en el codo y apuntas con el otro brazo. Uno de cada siete goles.":
			"벤치에서 얻어요, 물병 세 개를 모두 세웠을 때: 팔꿈치에 얼굴을 묻고 다른 팔로 가리켜요. 일곱 골에 한 번.",
		"¡DAB DESBLOQUEADO! Ya sale en tus goles.":
			"댑 해금! 이제 골 세리머니에 나와요.",
		"Se gana en el banquillo, con tres partidas ganadas 2-0: te plantas cara a cara con un compañero y os jugáis el gol a una mano. Uno de cada siete goles.":
			"벤치에서 얻어요, 2-0으로 세 판 이겼을 때: 동료와 마주 서서 한 손으로 골을 걸고 승부해요. 일곱 골에 한 번.",
		"2-0: {0} de {1} para festejar tus goles con CHIN CHAN PU.":
			"2-0: {1}번 중 {0}번. 달성하면 가위바위보 세리머니.",
		"¡CHIN CHAN PU DESBLOQUEADO! Ya sale en tus goles.":
			"가위바위보 해금! 이제 골 세리머니에 나와요.",
		"BRAZOS CRUZADOS":
			"팔짱",
		"Ya habías fallado dos claras hoy. A la tercera no festejas: te cruzas de brazos y que hablen ellos.":
			"오늘 이미 결정적 찬스를 두 번 놓쳤어요. 세 번째 골엔 세리머니 없이 팔짱을 끼고, 말은 저들에게 맡겨요.",


		"AL CHARCO":
			"물웅덩이로",
		"Sólo con lluvia y campo encharcado: todo el equipo corre al charco más cercano y se lanza de panza. Salpica hasta la valla.":
			"비 오는 날, 물이 고인 경기장에서만: 팀 전체가 가장 가까운 웅덩이로 달려가 배부터 몸을 날려요. 물보라가 펜스까지 튀어요.",
		"EN LA VALLA":
			"광고판 위",
		"Sólo en casa: te subes a la publicidad con los dos que llegan contigo. Los tres, sentados y de brazos cruzados, mirando al campo.":
			"홈 한정: 함께 달려온 두 명과 광고판 위에 올라가요. 셋이 팔짱을 끼고 앉아 경기장을 바라봐요.",
		"LA BOTELLA":
			"물병",
		"Festejando pegado a tu grada, alguien te tira una botella de agua: la atrapas al vuelo, te la bebes y la mandas de vuelta.":
			"우리 서포터석 바로 앞에서 세리머니하는데 누가 물병을 던져요. 공중에서 잡아 마시고 도로 던져 줘요.",


		"EN TU PUESTO MANDA": "내 포지션의 주인",
		"Empiezas en el banquillo.": "벤치에서 시작해요.",

		"JUEGAS EN {0} · PIDE {1}": "현재 {0} · 필요 {1}",
		"NOTA {0} · PIDE {1}": "평점 {0} · 필요 {1}",
		"{0} A {1} DE TU SITIO": "{0}, 내 자리까지 {1}",
		"{0} A {1}": "{0} {1} 차",
		"DE TU SITIO": "내 자리까지",
		"TÉCNICO {0} · PIDE {1}": "감독 {0} · 필요 {1}",
		"TÉCNICO {0}": "감독 {0}",
		"A {0} DE {1}": "{1}까지 {0}",
		"TE ACERCAS": "추격 중",
		"TE ALEJAS": "멀어지는 중",
		"Por nivel saldrías de inicio, pero el seleccionador te tiene en {0} y sólo pone de titular a quien le tiene en {1}. Se gana con partidos de selección.": "실력으론 선발감이지만, 대표팀 감독의 평가는 {0}. 선발은 {1} 이상만 써요. 대표팀 경기로 따내세요.",
		"El vestuario te tiene en {0}: hasta {1} te llegarán {2} balones como mucho.": "라커룸의 평가는 {0}: {1}까지는 공이 최대 {2}번만 와요.",
		"En casa la afición está contigo ({0}): un balón más.": "홈에선 팬들이 당신 편이에요({0}): 공 하나 더.",
		"En casa la afición te pita ({0}): un balón menos.": "홈에선 팬들이 야유해요({0}): 공 하나 덜.",
		"LE QUITASTE EL SITIO A": "내가 자리를 뺏은 선수",
		"RESERVA": "후보",
		"PLANTILLA": "스쿼드",
		"EL ONCE": "선발 11명",
		"NO CONVOCADOS": "명단 제외",
		"RACHA": "폼",
		"TU PUESTO": "내 포지션",
		"PEDIR JUGAR DE {0} · {1}": "{0} 포지션 요청 · {1}",
		"LO VERA BIEN": "좋아할 듯",
		"PUEDE ESCUCHARTE": "들어 줄 수도",
		"LO VERA DIFICIL": "어려울 듯",
		"NI LO ESCUCHA": "안 들어 줌",
		"Ya le pediste un cambio de puesto en esta ventana.": "이번 이적 시장에서 이미 포지션 변경을 요청했어요.",
		"El club te pasa a jugar de {0}.": "클럽이 당신을 {0} 포지션으로 옮겨요.",
		"{0} · RINDES {1}%": "{0} · 효율 {1}%",
		"{0} · RINDES AL {1}% AQUI": "{0} · 여기서 효율 {1}%",
		"TUS PUESTOS": "내 포지션",
		"PUEDES APRENDERLO": "배울 수 있음",
		"FAVORITA": "선호",
		"Tu FAVORITA pesa: los clubes que te quieren ahí salen antes y el técnico te escucha más si se la pides.": "선호 포지션은 힘이 있어요: 그 자리로 원하는 클럽이 먼저 나타나고, 요청하면 감독도 더 귀 기울여요.",


		"¿APRENDER {0}?": "{0} 배우기?",
		"APRENDERLO": "배우기",
		"PUESTO DEVUELTO · {0}": "포지션 환불 · {0}",
		"NATURAL": "주 포지션",
		"COMODO": "익숙함",
		"PROBANDO": "적응 중",
		"AJENO": "낯섦",
		"Aprender un puesto hace que los clubes puedan ficharte para él. El oficio sale de jugarlo.": "포지션을 배우면 클럽이 그 포지션으로 영입할 수 있어요. 실력은 뛰면서 붙어요.",

		"En el partido: rematas dentro del área y te llegan más centros para cabecear.": "경기에서: 박스 안에서 마무리하고, 헤더용 크로스가 더 많이 와요.",
		"En el partido: más disparos desde la frontal y más balones para la volea.": "경기에서: 박스 앞 슈팅과 발리 기회가 더 많아져요.",
		"En el partido: más contras por tu banda, disparos de lejos y salidas jugadas.": "경기에서: 내 측면 역습, 중거리 슈팅, 후방 빌드업이 늘어요.",
		"En el partido: disparos de lejos y desde la frontal, voleas y salidas jugadas.": "경기에서: 중거리와 박스 앞 슈팅, 발리, 후방 빌드업.",
		"En el partido: sobre todo disparos de lejos y salidas jugadas; poca área.": "경기에서는: 주로 중거리 슈팅과 후방 빌드업. 박스 안에는 별로 안 들어가요.",
		"TE QUIEREN DE {0}": "{0}에서 원해요",
		"PAGA MÁS": "더 높은 주급",
		"MEJOR CLUB": "더 좋은 클럽",
		"MÁS MINUTOS": "더 많은 출전",
		"OFERTA {0} DE {1}": "제안 {1}개 중 {0}",
		"SU ONCE MÁS FUERTE": "상대 최강 베스트 11",
		"SI TE VAS, LO MEJOR DE LA MESA": "떠난다면, 최고의 제안",
		"TE HAN OFRECIDO": "받은 제안",
		"DESTINOS": "임대 행선지",
		"TU SALIDA": "내 이적",
		"EN CESIÓN": "임대 명단",
		"FUERA DEL PLAN": "전력 외",
		"NO TE VENDEN": "판매 불가",
		"TE ESCUCHAN": "협상 가능",
		"Salvo cláusula: {0}": "바이아웃 제외: {0}",
		"Te llegan {0} ofertas más y tu club pide un {1}% menos": "제안이 {0}개 더 오고, 클럽 요구액이 {1}% 내려가요",
		"Te queda un año: no te retienen.": "계약이 1년 남았어요: 붙잡지 않아요.",
		"TU SITIO · {0}": "내 자리 · {0}",
		"TU SITIO ESTA LIBRE": "내 자리가 비어 있어요",
		"CESIÓN {0} DE {1}": "임대 {1}건 중 {0}",
		"SIN OPCIÓN": "옵션 없음",
		"Jugarías de": "포지션",
		"Vuelves en": "복귀까지",
		"Opción de compra": "완전 영입 옵션",
		"Creces": "성장",
		"Con la ventana abierta ya no se da pie: si quieren, su oferta llega a la mesa.": "이적 시장이 열린 지금은 떠볼 수 없어요: 원한다면 정식 제안이 올 거예요.",
		"{0} TEMP": "{0}시즌",
		"mercadoMESA": "제안",
		"MINUTOS": "출전 시간",
		"Nada de lo que hay encima de la mesa te mejora: ni el club, ni la ficha, ni los minutos.":
			"받은 제안 중 지금보다 나은 건 없어요: 클럽도, 주급도, 출전 시간도.",
		"TE PEDIRÁN GOLES": "골을 원할 거예요",
		"TE PEDIRÁN ASISTENCIAS": "도움을 원할 거예요",
		"Sin club: no hay plantilla que mostrar. Ficha por un equipo y aquí verás a los tuyos.":
			"소속 클럽 없음: 보여줄 스쿼드가 없어요. 팀에 입단하면 여기서 동료들을 볼 수 있어요.",
		"Sales de inicio.": "선발 출전이에요.",
		"Viajas, pero no juegas.": "원정은 함께 가지만, 출전은 안 해요.",
		"El torneo ya empezó y la lista está cerrada: tu sitio se juega en la próxima.":
			"대회가 이미 시작돼서 명단이 마감됐어요: 다음 대회에서 자리를 노려요.",
		"Ya das el nivel: te llaman en la próxima fecha FIFA.":
			"이제 실력이 충분해요: 다음 A매치 기간에 소집될 거예요.",
		"BOTA DE LA LIGA": "리그 득점왕",
		"Tu premio te avala: este año no te piden nota ni nivel.":
			"수상 경력이 보증해 줘요: 올해는 평점도 능력치도 따지지 않아요.",
		"MEJOR DE LA LIGA": "리그 최고 선수",
		"PREMIO DE CAMPEONES": "엘리트컵 개인상",
		"CAMPEON DEL MUNDO": "세계 대회 우승",
		"CAMPEON CONTINENTAL": "대륙 대회 우승",
		"BOTA DEL MUNDIAL": "세계 대회 득점왕",
		"JUGAR INFILTRADO": "부상 안고 출전",
		"PIDE": "요구",
		"TIENES": "보유",
		"Decide si SALES. Si le caes mal, no pasas del banquillo. Lo que haces en las fechas FIFA te sube o te baja con él, y en amistosos rota.":
			"선발 여부를 정해요. 감독 눈 밖에 나면 벤치를 벗어날 수 없어요. A매치 기간의 활약에 따라 신뢰가 오르내리고, 친선 경기에선 로테이션을 돌려요.",
		"Deciden si te la PASAN: si el grupo no te quiere, te llegan dos balones. Se gana ganando juntos.":
			"패스를 줄지 정해요: 팀이 싫어하면 한 경기에 공 두 번 만져요. 함께 이기면서 얻는 거예요.",
		"PARA ENTRAR": "소집 기준",
		"PARA SER TITULAR": "선발 기준",


		"MI EQUIPO":
			"내 팀",
		"GERENCIA":
			"프런트",
		"DAR UNA CHARLA AL VESTUARIO":
			"라커룸 미팅 소집",
		"Reúnes al grupo tú, sin el míster delante. Si te siguen, el equipo entero se suelta; si no eres nadie ahí dentro, se nota.":
			"감독 없이 직접 선수들을 모아요. 다들 따르면 팀 전체가 살아나고, 안에서 존재감이 없으면 티가 나요.",
		"PEDIR CAMBIO DE PUESTO":
			"포지션 변경 요청",
		"Le dices al técnico dónde quieres jugar. Cuenta lo cómodo que estés ahí y lo que se fíe de ti.":
			"감독에게 원하는 포지션을 말해요. 그 자리가 얼마나 편한지, 감독이 얼마나 믿는지가 중요해요.",
		"PEDIR LOS BALONES PARADOS":
			"세트피스 전담 요청",
		"Penales, faltas y córners para ti el resto de la temporada, aunque haya alguien con mejor pie en la plantilla.":
			"시즌이 끝날 때까지 PK, 프리킥, 코너킥은 당신 몫이에요. 스쿼드에 더 발 좋은 선수가 있어도요.",
		"SUGERIR UN FICHAJE":
			"영입 추천",
		"Señalas a un jugador de otro club. El club mira su precio y su caja, y decide.":
			"다른 클럽 선수를 지목해요. 클럽은 그 선수의 가격과 자금 사정을 보고 결정해요.",
		"AVISAR QUE TE VAS LA PROXIMA TEMPORADA":
			"다음 시즌 이적 통보",
		"No pides permiso: avisas. Entras en la lista, bajan lo que piden por ti y llegan ofertas de verdad. La grada no lo olvida.":
			"허락을 구하는 게 아니라 통보예요. 이적 명단에 오르고, 요구 이적료가 내려가고, 진짜 제안이 들어와요. 관중석은 이걸 잊지 않아요.",
		"NIVEL EN EL VESTUARIO":
			"라커룸 내 위상",
		"CONFIANZA DEL TECNICO":
			"감독의 신뢰",
		"EL VESTUARIO":
			"라커룸",
		"LA GRADA":
			"관중석",
		"ANOS EN EL CLUB":
			"클럽 재적 연수",
		"Sin club no hay nada que pedir. Ficha por un equipo y aquí decidirás con él.":
			"소속 클럽이 없으면 요청할 것도 없어요. 팀에 입단하면 여기서 함께 결정해요.",
		"TU PESO EN EL CLUB":
			"클럽 내 영향력",
		"No se compra: sale de lo que eres en ese vestuario.":
			"돈으로 살 수 없어요: 그 라커룸에서 당신이 어떤 존재인지에서 나와요.",
		"QUE LE PIDES":
			"요청 사항",
		"Esperas respuesta a: {0}.":
			"답변 대기 중: {0}.",
		"Te contestan en la próxima jornada.":
			"다음 라운드에 답변이 와요.",
		"Te contestan en {0} jornadas.":
			"{0}라운드 후에 답변이 와요.",
		"Acabas de pedir algo: la próxima jornada puedes volver.":
			"방금 요청했어요: 다음 라운드에 다시 올 수 있어요.",
		"Acabas de pedir algo: puedes volver en {0} jornadas.":
			"방금 요청했어요: {0}라운드 후에 다시 올 수 있어요.",
		"Cedido no decides tu vida aquí: el club que te tiene prestado no manda, y el tuyo ya decidió tu año.":
			"임대 중에는 여기서 아무것도 못 정해요: 임대 클럽엔 권한이 없고, 원소속 클럽이 이미 올해를 정했어요.",
		"LA RESPUESTA DEL CLUB":
			"클럽의 답변",
		"Te escucharon y dijeron que no. Queda dicho.":
			"들어는 봤지만 거절했어요. 그걸로 끝이에요.",
		"Hablaste tú y el grupo se soltó: el vestuario está contigo.":
			"당신이 나서자 팀이 살아났어요: 라커룸이 당신 편이에요.",
		"Dijeron que sí, pero el puesto ya no estaba libre.":
			"수락했지만, 그 자리는 이미 비어 있지 않았어요.",
		"Desde hoy juegas de {0}.":
			"오늘부터 포지션: {0}.",
		"Los penales, las faltas y los córners son tuyos el resto de la temporada.":
			"시즌이 끝날 때까지 PK, 프리킥, 코너킥은 당신 몫이에요.",
		"Queda dicho: te vas al acabar la temporada. Estás en la lista y van a llegar ofertas.":
			"통보 완료: 시즌이 끝나면 떠나요. 이적 명단에 올랐고 제안이 들어올 거예요.",
		"Dijeron que sí, pero el fichaje se cayó: ese jugador ya no estaba donde lo viste.":
			"수락했지만 영입이 무산됐어요: 그 선수는 이미 그 클럽에 없었어요.",
		"{0} firma por tu club. Lo pediste tú.":
			"{0} 선수가 우리 클럽과 계약. 당신이 요청한 영입이에요.",
		"Te dijeron que sí.":
			"수락했어요.",
		"Peso {0} · {1}":
			"영향력 {0} · {1}",
		"Abrir la boca ya cuesta, digan lo que digan.":
			"입을 여는 것만으로도 대가가 따라요. 답이 뭐든요.",
		"PEDIRLO":
			"요청",
		"DEJARLO":
			"그만두기",
		"DONDE QUIERES JUGAR":
			"원하는 포지션",
		"Sólo sabes jugar en un sitio. Aprende otro y podrás pedirlo.":
			"한 포지션밖에 못 뛰어요. 다른 포지션을 익히면 요청할 수 있어요.",
		"A QUIEN FICHAMOS":
			"누구를 영입할까",
		"Lo más flojo del once es el {0} ({1}).":
			"베스트 11의 약점은 {0} 자리예요 ({1}).",
		"{0} · media {1} · {2} años · {3}":
			"{0} · 능력치 {1} · {2}세 · {3}",
		"Hoy no hay nadie que mejore tu once y esté a tiro. Vuelve otra jornada.":
			"오늘은 베스트 11을 강화하면서 영입 가능한 선수가 없어요. 다른 라운드에 다시 오세요.",


		"LO ESTAN VIENDO":
			"검토 중",
		"MIENTRAS TANTO":
			"그동안",
		"Tu peso subió a {0} desde que lo pediste.":
			"요청 후 영향력이 {0}까지 올랐어요.",
		"Tu peso bajó a {0} desde que lo pediste.":
			"요청 후 영향력이 {0}까지 내려갔어요.",
		"Tu peso sigue en {0}.":
			"영향력은 그대로: {0}.",
		"Te contestan con el peso que tengas ese día, no con el de hoy: lo que hagas hasta entonces cuenta.":
			"답변은 오늘이 아니라 그날의 영향력으로 정해져요: 그때까지 하는 모든 게 반영돼요.",
		"A {0} ya se lo llevaron: cuando contesten, la petición se caerá sola.":
			"{0} 선수는 이미 다른 곳으로 갔어요: 답변이 오면 요청은 자동으로 취소돼요.",
		"{0} sigue donde lo viste.":
			"{0} 선수는 아직 그 클럽에 있어요.",
		"LO QUE PUEDE PAGAR EL CLUB":
			"클럽이 쓸 수 있는 돈",
		"La raya es el más caro de la lista.":
			"기준선은 명단에서 가장 비싼 선수예요.",
		"No cabe en la caja. Puedes señalarlo igual.":
			"클럽 자금을 넘어요. 그래도 지목할 수 있어요.",
		"EL DESPACHO":
			"프런트",
		"TE DIJERON QUE SI":
			"수락",
		"TE DIJERON QUE NO":
			"거절",


		"Le quedan {0} temporadas: es un parche.":
			"남은 계약 {0}시즌: 임시방편이에요.",
		"Le quedan {0} temporadas.":
			"남은 계약 {0}시즌.",


		"LO QUE LES HAS PEDIDO":
			"내 요청 목록",
		"T{0} J{1} · {2}":
			"S{0} R{1} · {2}",
		"FICHAR A {0}":
			"영입: {0}",
		"JUGAR DE {0}":
			"포지션: {0}",
		"TE SIGUIERON":
			"팀이 따랐어요",
		"TE CAMBIARON DE SITIO":
			"포지션 변경",
		"TE LOS DIERON":
			"세트피스 획득",
		"QUEDO DICHO":
			"통보 완료",
		"LO FICHARON":
			"영입 성공",


		"LO QUE MAS TE FALTA":
			"가장 부족한 점",
		"{0}, {1} PUNTOS":
			"{0}, {1}점",
		"Se mide contra tu vestuario, no en absoluto: sube tu media, o cámbiate a un club donde destaques.":
			"절대 기준이 아니라 라커룸 안에서 비교해요: 능력치를 올리거나, 돋보일 수 있는 클럽으로 옮기세요.",
		"Cada partido la mueve, arriba o abajo, según tu nota.":
			"매 경기 평점에 따라 오르내려요.",
		"Se gana fuera del campo: la charla, los retos en casa y lo que decides con ellos.":
			"경기장 밖에서 얻어요: 라커룸 미팅, 집에서의 도전, 동료들과 내리는 결정.",
		"Sube al cumplir tu objetivo de contrato, y con el año que haga el club.":
			"계약 목표를 달성하면 오르고, 클럽의 시즌 성적에 따라서도 올라요.",
		"Se revisa al cerrar la temporada, contra la mejor media de tus compañeros.":
			"시즌이 끝날 때, 동료 중 최고 능력치와 비교해 재평가돼요.",
		"Se gana quedándote: cada temporada en el mismo club suma.":
			"남아 있으면 쌓여요: 같은 클럽에서 보낸 시즌마다 더해져요.",



		"NO SE PIDE, SE AVISA":
			"요청이 아니라 통보",
		"Años en el club":
			"클럽 재적 연수",
		"DE CIEN":
			"100점 만점",
		"PRESUPUESTO PARA FICHAJES":
			"이적 예산",

		"ENTRA SIN APRETAR":
			"여유 지출",
		"CABE":
			"가능",
		"APRIETA":
			"빠듯",
		"NO LLEGA":
			"자금 부족",
		"FICHAJES ESPERADOS":
			"예상 영입",
		"Gastado en esta ventana: {0} de {1}.":
			"이번 이적 시장 지출: {1} 중 {0}.",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede.":
			"이 순서대로 움직여요: 한 명이 계약하면, 나머지는 남은 돈으로 입찰해요.",
		"1 partido con ellos":
			"함께 1경기",
		"{0} partidos con ellos":
			"함께 {0}경기",
		"Te faltan {0} de relación.":
			"관계가 {0} 부족해요.",
		"TE ESCUCHA":
			"귀 기울임",
		"LO QUE HICIERON CON TU LISTA":
			"내 명단의 결과",
		"Ficharon a {0}. Lo señalaste tú.":
			"{0} 선수를 영입했어요. 당신이 지목한 선수예요.",
		"Miraron tu lista y no ficharon a ninguno.":
			"명단을 봤지만 아무도 영입하지 않았어요.",
		"A QUIEN LE HAS SENALADO":
			"내가 지목한 선수",
		"Marca hasta {0} jugadores en el RANKING y el club los mirará al cerrarse el mercado.":
			"랭킹에서 최대 {0}명을 지목하면 이적 시장이 닫힐 때 클럽이 검토해요.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y los mirarán al cerrarse el mercado.":
			"베스트 11의 약점은 {0} 자리예요 ({1}). 랭킹에서 최대 {2}명을 지목하면 이적 시장이 닫힐 때 검토해요.",
		"Ventana abierta: {0} {1} por delante. En cada una el club decide, y un objetivo vivo puede caerse solo.":
			"이적 시장 오픈: 남은 기간 {0} {1}. 매번 클럽이 결정하고, 진행 중인 영입 대상도 저절로 무산될 수 있어요.",
		"Mercado cerrado. La próxima ventana dura {0} {1}: lo que marques ahora espera a que abra.":
			"이적 시장 마감. 다음 이적 시장은 {0} {1}: 지금 지목한 선수는 시장이 열릴 때까지 대기해요.",
		"{0} de {1} esta temporada. Toca uno para quitarlo.":
			"이번 시즌 {1}명 중 {0}명. 탭하면 제외돼요.",

		"RECOMENDAR AL CLUB ({0})":
			"클럽에 추천 ({0})",
		"QUITAR DE TU LISTA":
			"내 명단에서 제외",
		"Señalado: interés {0}%, fichaje {1}%.":
			"지목됨: 관심도 {0}%, 영입 확률 {1}%.",
		"Tu once {0}": "내 베스트 {0}",
		"Rival en su puesto {0}": "같은 포지션 경쟁자 {0}",
		"Tu once {0} · rival en su puesto {1}": "내 베스트 11 {0} · 같은 포지션 경쟁자 {1}",
		"Brazalete +{0}": "주장 완장 +{0}",
		"Ojeo -{0}: no conoce tu liga": "스카우팅 -{0}: 우리 리그를 몰라요",
		"Ojeo -{0}: {1} cesiones": "스카우팅 -{0}: 임대 {1}회",
		"Ojeo -{0}: no conoce tu liga, {1} cesiones": "스카우팅 -{0}: 우리 리그를 모름, 임대 {1}회",
		"Viene de más arriba: precio +{0} %": "더 큰 클럽 출신: 가격 +{0} %",

		"Tu pasado pesa: {0} temporadas en ligas grandes, {1} cesiones, {2} clubes": "과거가 영향을 줘요: 빅리그 {0}시즌, 임대 {1}회, 클럽 {2}곳",
		"Trayectoria: precio +{0} % ({1} temporadas en ligas grandes)": "커리어: 가격 +{0} % (빅리그 {1}시즌)",
		"Trotamundos: precio −{0} % ({1} cesiones, {2} clubes)": "저니맨: 가격 −{0} % (임대 {1}회, 클럽 {2}곳)",

		"Jugaste aquí {0} temporadas: te dejan volver por un {1} % menos": "여기서 {0}시즌 뛰었어요: {1} % 할인된 가격에 복귀할 수 있어요",
		"Te dejan volver a casa por un {0} % menos": "{0} % 할인된 가격에 친정으로 복귀할 수 있어요",

		"REGRESA A CASA": "친정 복귀",
		"VUELVE A CASA": "금의환향",
		"La grada no lo olvidó: {0} con esta camiseta. Desde hoy vuelve a entrenar contigo.": "팬들은 잊지 않았어요: 이 유니폼을 입고 {0}. 오늘부터 다시 당신과 함께 훈련해요.",
		"Jugó aquí {0} · traspaso -{1} %": "여기서 뛴 기간 {0} · 이적료 -{1} %",
		"Jugó aquí {0}": "여기서 뛴 기간 {0}",
		"VUELVE": "복귀",
		"INTERES": "관심도",
		"LO PEDISTE TU":
			"내가 요청",
		"TUS FICHAJES":
			"내 영입",
		"YA NO ESTA":
			"떠남",
		"Tu ojo: {0} cerró el año con nota {1}":
			"내 안목: {0} 선수, 시즌 평점 {1}",
		"{0} no convenció al técnico":
			"{0} 선수는 감독을 설득하지 못했어요",
		"MARCAR EN EL RANKING ({0})":
			"랭킹에서 지목 ({0})",
		"Ya has gastado tus recomendaciones de esta temporada. El año que viene vuelves a tener cinco.":
			"이번 시즌 추천 기회를 다 썼어요. 내년에 다시 5번 생겨요.",
		"Ya gastaste tus {0} recomendaciones de esta temporada.":
			"이번 시즌 추천 {0}회를 이미 다 썼어요.",
		"{0} de {1}. Toca uno para quitarlo.":
			"{1}명 중 {0}명. 탭하면 제외돼요.",
		"Ya has señalado {0}. Quita a alguno primero.":
			"이미 {0}명을 지목했어요. 먼저 한 명을 빼세요.",
		"Le dices al técnico dónde quieres jugar.":
			"감독에게 원하는 포지션을 말해요.",
		"Penales, faltas y córners para ti el resto de la temporada.":
			"시즌이 끝날 때까지 PK, 프리킥, 코너킥은 당신 몫이에요.",
		"No pides permiso: avisas. Entras en la lista y llegan ofertas de verdad.":
			"허락을 구하는 게 아니라 통보예요. 이적 명단에 오르고 진짜 제안이 들어와요.",



		"QUE LO FICHEN":
			"영입 요청",
		"LO QUE PASO CON TUS OBJETIVOS":
			"영입 대상 결과",
		"FALLIDO":
			"무산",
		"Marca hasta {0} jugadores en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"랭킹에서 최대 {0}명을 지목하면 이적 시장의 매 라운드마다 클럽이 결정해요.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"베스트 11의 약점은 {0} 자리예요 ({1}). 랭킹에서 최대 {2}명을 지목하면 이적 시장의 매 라운드마다 클럽이 결정해요.",
		"Ya lo intentaste esta temporada y se cayó. Podrás volver a señalarlo el año que viene.":
			"이번 시즌 시도했지만 무산됐어요. 내년에 다시 지목할 수 있어요.",
		"FICHARON A {0}":
			"영입 성공: {0}",
		"SE CAYO {0}":
			"무산: {0}",
		"TU ONCE {0}": "내 베스트 {0}",
		"No te mira: tu once está en {0} y él en {1}.":
			"거들떠보지도 않아요: 내 베스트 11은 {0}, 그는 {1}.",
		"ALTAS Y BAJAS": "영입과 방출",
		"ALTA": "영입",
		"BAJA": "방출",
		"SE CAYO SOLO": "자동 무산",
		"CERRO EL MERCADO": "시장 마감",
		"YA NO JUGABA AHI": "이미 떠남",
		"SE RETIRABA": "은퇴 예정",
		"TE FUISTE DEL CLUB": "내가 떠남",
		"Ya no le quedan jornadas: se cae al cerrar.":
			"남은 라운드가 없어요: 시장이 닫히면 제외돼요.",
		"Está acabando su carrera: el club no ficha a quien se retira.":
			"커리어 막바지예요: 클럽은 은퇴할 선수를 영입하지 않아요.",
		"Ya no juega ahí.": "이제 그 클럽에 없어요.",
		"NO CABIA NADIE": "스쿼드 자리 없음",
		"Tu plantilla está llena y no hay a quien soltar: aunque el club diga que sí, no cabrá.":
			"스쿼드가 꽉 찼고 내보낼 선수도 없어요: 클럽이 수락해도 들어올 자리가 없어요.",
		"El club está en apuro: solo entran los LIBRES.":
			"클럽이 재정난이에요: FA 선수만 영입할 수 있어요.",
		"SE LO LLEVO {0}": "{0} 클럽이 데려감",
		"Llegaron porque tú los señalaste":
			"당신이 지목해서 왔어요",
		"Fichajes que le pediste al club y el club hizo.":
			"당신이 요청하고 클럽이 성사시킨 영입이에요.",
		"Un fichaje que le pediste al club y el club hizo.":
			"당신이 요청하고 클럽이 성사시킨 영입 하나.",
		"CLAUSULAZO":
			"바이아웃 발동",
		"Mis outfits":
			"내 코디",
		"Nombre del outfit":
			"코디 이름",
		"Escribe un nombre para guardar tu outfit.":
			"코디를 저장하려면 이름을 입력하세요.",
		"Outfit guardado.":
			"코디를 저장했어요.",
		"Outfit aplicado.":
			"코디를 적용했어요.",
		"Outfit actualizado con tu ropa actual.":
			"지금 입은 옷으로 코디를 업데이트했어요.",
		"Outfit eliminado.":
			"코디를 삭제했어요.",
		"Guarda tu combinación actual y úsala con un toque.":
			"지금 입은 조합을 저장하고 탭 한 번으로 입어요.",
		"Guardar outfit":
			"코디 저장",
		"Playera gráfica":
			"그래픽 티셔츠",
		"Jersey retro":
			"레트로 저지",
		"Polo tejido":
			"니트 폴로",
		"Camisa de lino":
			"린넨 셔츠",
		"Cierre corto":
			"하프집업",
		"Polo rugby":
			"럭비 폴로",
		"Sobrecamisa":
			"오버셔츠",
		"Parka":
			"파카",
		"Pants deportivos":
			"트랙 팬츠",
		"Pantalón de pinzas":
			"핀턱 슬랙스",
		"Jeans barril":
			"배럴 진",
		"Cargo técnico":
			"테크 카고 팬츠",
		"Tenis retro":
			"레트로 스니커즈",
		"Tenis deportivos":
			"러닝화",
		"Zapatos de charol":
			"에나멜 구두",
		"Tenis gruesos":
			"청키 스니커즈",
		"Cinturón de cuero":
			"가죽 벨트",
		"Hebilla metálica":
			"메탈 버클",
		"Pañuelo recto":
			"스트레이트 폴드",
		"Pañuelo de pico":
			"포인티드 폴드",
		"Casual elegante":
			"스마트 캐주얼",
		"Corbata de moño":
			"보타이",
		"Corbata, moño o bufanda":
			"넥타이, 보타이, 스카프",
		"Ya no juega ahí. Quítalo y señala a otro.":
			"이제 그 클럽에 없어요. 빼고 다른 선수를 지목하세요.",
		"Está acabando su carrera. Quítalo y señala a otro.":
			"커리어 막바지예요. 빼고 다른 선수를 지목하세요.",
		"Hoy no hay presupuesto. Si el club vende, vuelve a haberlo.":
			"오늘은 예산이 없어요. 클럽이 선수를 팔면 다시 생겨요.",


		"REFUERZO":
			"새 영입",
		"TE HICIERON CASO":
			"의견 반영",
		"Lo señalaste tú y el club puso el dinero. Desde hoy entrena contigo.":
			"당신이 지목하고 클럽이 돈을 냈어요. 오늘부터 당신과 함께 훈련해요.",
		"Te Hicieron Caso":
			"의견 반영",
		"El club fichó a alguien que TÚ le señalaste.":
			"당신이 지목한 선수를 클럽이 영입했어요.",
		"Que el club fiche a alguien que TÚ le hayas señalado.": "당신이 지목한 선수를 클럽이 영입하게 만드세요.",


		"FICHAJES DE VERANO": "여름 이적 시장 영입",
		"Y {0} MÁS": "외 {0}명",

		"NUEVA YORK":
			"뉴욕",
		"TU CARA EN NUEVA YORK":
			"뉴욕을 장식한 내 얼굴",
		"La marca compró la plaza entera. Todas las pantallas a la vez, y en todas tú.":
			"브랜드가 광장 전체를 샀어요. 모든 스크린에 동시에, 전부 당신 얼굴이에요.",
		"ÚLTIMA HORA":
			"속보",
		"{0} FIRMA CON {1}":
			"{0}, {1} 클럽과 계약",
		"ALINEACIÓN":
			"라인업",
		"PITADA":
			"야유",
		"TU GRADA TE PITA":
			"홈 팬들의 야유",
		"Te silbaron al oír tu nombre. El partido de hoy es la respuesta.":
			"당신 이름이 불리자 휘파람이 쏟아졌어요. 오늘 경기로 답하세요.",
		"tardes malas":
			"부진한 날",
		"{0} veces con esta camiseta. El club te lo agradece antes del saque.":
			"이 유니폼을 입고 {0}번. 킥오프 전에 클럽이 감사를 전해요.",
		"asistencias":
			"도움",
		"OJEADOR":
			"스카우트",
		"Llegó una hora antes y sólo miró a uno. Su oferta llega en la próxima ventana.":
			"한 시간 일찍 와서 딱 한 명만 봤어요. 다음 이적 시장에 제안이 올 거예요.",
		"A SEGUIR":
			"주목",
		"MURAL":
			"벽화",
		"TU CARA EN EL BARRIO":
			"벽에 그려진 내 얼굴",
		"Nadie te pidió permiso para pintarte. Mejor así.":
			"아무도 허락받지 않고 당신을 그렸어요. 그게 더 좋죠.",
		"ANUNCIO":
			"광고",
		"TU CARA EN LA CIUDAD":
			"도시를 장식한 내 얼굴",
		"FIJO POR PARTIDO":
			"경기당 고정",
		"Pasas por debajo y te ves en grande. Los que pasan, también.":
			"그 아래를 지나며 거대한 내 모습을 봐요. 지나가는 사람들도요.",
		"LLEGADA":
			"도착",
		"LA COPA VUELVE A CASA":
			"트로피가 집으로 돌아와요",
		"Viajó en su propio asiento, con el cinturón puesto. Nadie la soltó en todo el vuelo.":
			"전용 좌석에 안전벨트까지 매고 왔어요. 비행 내내 아무도 손을 놓지 않았어요.",

		"TOMA {0}": "테이크{0}",
		"TOMA 7": "테이크7",
		"REC": "REC",
		"La séptima fue la buena. El cámara estaba con el celular.":
			"일곱 번째가 성공이었어요. 카메라맨은 휴대폰을 보고 있었어요.",


		"LA PANCARTA CON FALTA":
			"오타 난 현수막",
		"LA PANCARTA":
			"현수막",
		"CASI":
			"아깝다",
		"ARREGLADA":
			"수정 완료",
		"la tela":
			"현수막",
		"tu apellido":
			"내 이름",
		"Una letra mal. La van a colgar igual todos los domingos.":
			"한 글자가 틀렸어요. 그래도 매주 일요일마다 걸 거예요.",
		"Tardaron años, pero la arreglaron. Con cinta.":
			"몇 년 걸렸지만 결국 고쳤어요. 테이프로.",


		"LAS PALOMAS NO OLVIDAN":
			"비둘기는 잊지 않는다",
		"Una paloma del larguero no volvió a casa. Las demás se acuerdan.":
			"크로스바에 앉아 있던 비둘기 한 마리가 집에 돌아가지 못했어요. 나머지는 기억해요.",
		"Otra vez tú. Ellas llevan la cuenta.":
			"또 너야. 비둘기들이 세고 있어요.",
		"SANCION": "승점 삭감",
		"FAIR PLAY": "FAIR PLAY",
		"{0} arranca la liga con -{1} puntos por el fair play": "{0}, 재정 규정 위반으로 승점 -{1}에서 리그 시작",
		"{0} incumple el fair play: si repite, perderá {1} puntos": "{0}, 재정 규정 위반: 반복하면 승점 {1}점 삭감",
		"CUENTAS DEL CLUB": "클럽 재정",
		"SANAS": "건전",
		"EN APURO": "부채",
		"-{0} PTS": "-{0}점",
		"AVISO {0}/{1}": "경고 {0}/{1}",
		"INGRESOS / AÑO": "연 수입",
		"NOMINA / AÑO": "연 주급 총액",
		"RAYA ROJA": "레드라인",
		"Cerrar la temporada con la caja bajo la raya roja es un aviso. Dos seguidas: la liga siguiente empieza con -{0} puntos.": "자금이 레드라인 아래인 채로 시즌을 마치면 경고. 두 시즌 연속이면 다음 리그를 승점 -{0}점에서 시작해요.",
		"-{0} por fair play": "재정 규정 -{0}",
		"SANCION DE FAIR PLAY": "재정 규정 징계",
		"-{0} PTS EN LA LIGA": "리그 승점 -{0}",
		"AVISO DE FAIR PLAY": "재정 규정 경고",
		"SI REPITE: -{0} PTS": "반복 시: -{0}점",
		"EL CLUB CAMBIA DE DUEÑO": "클럽 주인이 바뀌다",
		"DINERO DE FUERA": "외부 자본",
		"LOS INGRESOS SE DISPARAN": "수입 폭증",
		"TEMPORADAS DE PROYECTO": "프로젝트 시즌",
		"ingreso de antes": "이전 수입",
		"ingreso ahora": "현재 수입",
		"la caja": "클럽 자금",
		"Compra el club y trae dinero de fuera: habrá más presupuesto en GERENCIA, y el club va a fichar, también en tu puesto.": "클럽을 인수하고 외부 자본을 들여와요: 프런트의 예산이 늘고, 클럽은 선수를 영입할 거예요. 당신 포지션에도요.",
		"EL CLUB ENTRA EN CRISIS": "클럽 위기",
		"LA CAJA EN ROJO": "자금 적자",
		"PUNTOS EN JUEGO": "걸린 승점",
		"la raya roja": "레드라인",
		"ingreso": "수입",
		"DUEÑO NUEVO": "새 구단주",
		"EN CRISIS": "위기",
		"TOCA VENDER": "판매 필수",
		"Te sientan en el vestuario con el director deportivo. {0} está en crisis: si la caja sigue bajo la raya roja al cierre, la liga le quita {1} puntos. Eres lo que más vale del vestuario, y tu traspaso es el dinero que falta.": "라커룸에서 단장과 마주 앉았어요. {0} 클럽은 위기예요: 시즌 마감 때 자금이 레드라인 아래면 리그가 승점 {1}점을 깎아요. 당신이 라커룸에서 가장 비싼 선수고, 당신 이적료가 바로 모자란 돈이에요.",
		"EL CLUB NO PAGA": "임금 체불",
		"Te sientan en el vestuario con el director deportivo. {0} no tiene con qué pagarte: llevas {1} partidos sin cobrar y te deben ${2}. Si aguantas, cobras cuando llegue el dinero. Si pides la carta, en verano eres libre.": "라커룸에서 단장과 마주 앉았어요. {0} 클럽은 당신에게 줄 돈이 없어요: {1}경기째 급여를 못 받았고 밀린 돈은 ${2}. 버티면 돈이 들어올 때 받아요. 계약 해지를 요청하면 여름에 FA가 돼요.",
		"AGUANTO": "버틴다",
		"PIDO LA CARTA": "계약 해지 요청",
		"IMPAGO DEL CLUB": "임금 체불",
		"Lo que te debía el club": "클럽이 밀린 급여",
		"El dueño nuevo te paga lo que te debía el club: ${0}": "새 구단주가 클럽의 밀린 급여를 지급해요: ${0}",
		"El club te paga la mitad de lo que te debía: ${0} de ${1}": "클럽이 밀린 급여의 절반을 지급해요: ${1} 중 ${0}",
		"EL CLUB TE DEBE": "클럽의 체불액",
		"TE DEBE": "체불",
		"caja": "자금",
		"MULTA POR LA ROJA": "퇴장 벌금",
		"MULTA DEL COMITÉ": "리그 벌금",
		"multa {0}": "벌금 {0}",
		"Esta temporada pagaste ${0} en multas": "이번 시즌 벌금으로 ${0} 냈어요",
		"ELECCIONES EN EL CLUB": "클럽 회장 선거",
		"Hay elecciones en {0}. El candidato promete sanear la caja vendiéndote este verano y quiere saber de qué lado estás. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "{0} 클럽에서 선거가 열려요. 후보는 이번 여름 당신을 팔아 재정을 바로잡겠다고 공약하고, 당신이 누구 편인지 알고 싶어 해요. 당신 사진이 표를 움직여요. 팬들은 진 쪽을 고른 사람을 기억해요.",
		"Hay elecciones en {0}. El candidato promete dinero para fichar y quiere tu foto en su campaña. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "{0} 클럽에서 선거가 열려요. 후보는 영입 자금을 약속하고 선거 운동에 당신 사진을 원해요. 당신 사진이 표를 움직여요. 팬들은 진 쪽을 고른 사람을 기억해요.",
		"CON EL PRESIDENTE": "회장 지지",
		"CON EL CANDIDATO": "후보 지지",
		"AL MARGEN": "중립",
		"El presidente gana las elecciones y sigue": "현 회장이 선거에서 이겨 연임해요",
		"Gana el candidato: el presidente nuevo quiere venderte este verano": "후보 당선: 새 회장이 이번 여름 당신을 팔려고 해요",
		"Gana el candidato: el presidente nuevo mete ${0} en la caja para fichar": "후보 당선: 새 회장이 영입 자금으로 ${0} 투입",
		"PRESIDENTE": "회장",
		"CANDIDATO": "후보",
		"GANA EL CANDIDATO": "후보 당선",
		"SIGUE EL PRESIDENTE": "회장 연임",
		"LA GRADA TE APLAUDE": "팬들의 박수",
		"LA GRADA TE PITA": "팬들의 야유",
		"EL JEQUE SE VA": "셰이크의 철수",
		"El jeque deja el {0} y su nómina se queda: crisis": "셰이크가 {0} 클럽을 떠나고 주급 부담만 남아: 위기",
		"El jeque se ha ido y su dinero con él, pero la nómina que firmó se queda. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "셰이크가 떠나며 돈도 가져갔지만, 그가 계약한 주급은 남았어요. 이번 여름 클럽은 선수를 팔아야 하고, 마감 때 자금이 레드라인 아래면 리그가 승점 {0}점을 깎아요.",
		"LA SALA DE JUNTAS": "이사회실",
		"Sin rodeos: no hay dinero. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "돌려 말하지 않을게요: 돈이 없어요. 이번 여름 클럽은 선수를 팔아야 하고, 마감 때 자금이 레드라인 아래면 리그가 승점 {0}점을 깎아요.",
		"SIN EUROPA": "유럽 불가",
		"TEMPORADA SIN EUROPA": "유럽 대회 없는 시즌",
		"la plaza perdida": "잃은 출전권",
		"puntos de sanción": "징계 승점",
		"CONTROL FINANCIERO": "재정 통제",
		"NO SE VENDE": "판매 안 함",
		"EL ESTADIO SE VENDE": "경기장 명명권 매각",
		"cobra el club": "클럽 수령액",
		"La crisis aprieta y el club vende el nombre del campo. La grada no lo perdona: este año entra menos gente y en el muro cuelga una pancarta.": "위기가 심해져 클럽이 경기장 이름을 팔았어요. 관중석은 용서하지 않아요: 올해는 관중이 줄고 벽에 현수막이 걸려요.",
		"El {0} vende el nombre de su estadio: ahora es el {1}": "{0} 클럽, 경기장 명명권 매각: 새 이름은 {1}",
		"VENDE EL ESTADIO": "경기장 매각",
		"Sin rodeos: no hay dinero. Para tapar el agujero, el club vende el nombre del estadio, y aun así este verano tiene que vender.": "돌려 말하지 않을게요: 돈이 없어요. 구멍을 메우려고 클럽이 경기장 이름을 팔지만, 그래도 이번 여름 선수를 팔아야 해요.",
		"CONCURSO": "파산",
		"El {0} entra en concurso de acreedores: este verano no ficha": "{0} 클럽, 법정관리 돌입: 이번 여름 영입 금지",
		"EL CONCURSO DE ACREEDORES": "법정관리",
		"CONCURSO DE ACREEDORES": "법정관리",
		"EN CONCURSO": "파산 상태",
		"LO LLEVA UN ADMINISTRADOR": "법정관리인 체제",
		"FICHAJES ESTE VERANO": "이번 여름 영입",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Lo que se pueda vender, se vende.": "클럽이 빚을 갚지 못해 판사가 법정관리인을 앉혔어요. 겨울 이적 시장까지 아무도 영입하지 않고 어떤 계약도 손대지 않아요. 당신 계약도요. 팔 수 있는 건 다 팔아요.",
		"CONTRATOS CONGELADOS": "계약 동결",
		"Tu club está en concurso: hasta el mercado de invierno no se toca un contrato.": "클럽이 법정관리 중이에요: 겨울 이적 시장까지 어떤 계약도 손대지 않아요.",
		"Tu club está en concurso: hasta el mercado de invierno no ficha a nadie.": "클럽이 법정관리 중이에요: 겨울 이적 시장까지 아무도 영입하지 않아요.",
		"EL ADMINISTRADOR TE VENDE": "관리인이 당신을 판다",
		"El juez puso a un administrador al frente de {0} y te recibe en el despacho del presidente, con las cuentas sobre la mesa. En la lista de lo que se vende, tu nombre va el primero: o sales este verano, o te quedas cobrando menos.": "판사가 {0} 클럽에 법정관리인을 앉혔고, 그가 회장실에서 장부를 펼쳐 놓고 당신을 맞아요. 매각 명단 맨 위에 당신 이름이 있어요: 이번 여름 떠나거나, 덜 받고 남거나.",
		"Tu club está en concurso y vas el primero de la lista. O sales este verano, o te quedas cobrando menos.": "클럽이 법정관리 중이고 당신이 매각 명단 1순위예요. 이번 여름 떠나거나, 덜 받고 남거나.",
		"Cobras menos lo que reste de contrato y el administrador te saca de la lista. El vestuario y la grada lo ven.": "남은 계약 기간 동안 덜 받고, 관리인이 당신을 명단에서 빼요. 라커룸과 관중석이 지켜봐요.",
		"LA REBAJA DEL VESTUARIO": "라커룸 임금 삭감",
		"El presidente baja al vestuario: {0} está en crisis y no llega a fin de mes. Pide a la plantilla un {1}% menos de ficha esta temporada, y quien firme cobra a tiempo. El capitán ya ha firmado; faltas tú.": "구단주가 라커룸에 내려왔어요: {0} 클럽은 위기라 월말을 버티기도 힘들어요. 이번 시즌 스쿼드에 주급 {1}% 삭감을 요청하고, 서명한 사람은 제때 받아요. 주장은 이미 서명했어요. 남은 건 당신뿐이에요.",
		"FIRMO: {0}/sem": "서명: {0}/주",
		"NO FIRMO": "거부",
		"LA ASAMBLEA DE SOCIOS": "회원 총회",
		"El juez cerró el concurso y {0} es de sus socios: la asamblea votó la compra a mano alzada, un {1}% a favor. No hay dueño que ponga dinero, así que piden a la plantilla que entre con una acción. La grada mira a sus jugadores.": "판사가 법정관리를 종료했고 {0} 클럽은 이제 회원들의 것이에요: 총회에서 거수로 인수를 결정했어요. 찬성 {1}%. 돈을 댈 구단주가 없어서 선수단에게 지분 참여를 요청해요. 관중석이 선수들을 지켜봐요.",
		"COMPRO ACCIONES": "지분 매입",
		"SÓLO VOTO": "투표만",
		"SOCIOS": "회원",
		"Los socios compran el {0}: un {1}% vota sí en la asamblea": "회원들이 {0} 클럽 인수: 총회 찬성 {1}%",
		"DE LOS SOCIOS": "회원 소유",
		"Los socios te pagan lo que te debía el club: ${0}": "회원들이 클럽의 밀린 급여를 지급해요: ${0}",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tienes acciones: tu voto arrastra a la grada.": "세 시즌 뒤, 한 투자자가 {0} 클럽을 사려 하고 시즌 말에 총회가 투표해요. 여론조사는 매각 찬성 {1}%. 당신은 지분이 있어요: 당신의 표가 관중석을 움직여요.",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tu voto es uno más, pero la grada escucha a sus jugadores.": "세 시즌 뒤, 한 투자자가 {0} 클럽을 사려 하고 시즌 말에 총회가 투표해요. 여론조사는 매각 찬성 {1}%. 당신의 표는 한 표일 뿐이지만, 관중석은 선수들의 말에 귀 기울여요.",
		"LA ASAMBLEA VOTA LA VENTA": "총회 매각 투표",
		"VOTO VENDER": "매각 찬성",
		"VOTO SEGUIR": "매각 반대",
		"Los socios venden el {0} a un inversor: un {1}% vota sí": "회원들이 {0} 클럽을 투자자에게 매각: 찬성 {1}%",
		"Los socios del {0} no venden: un {1}% vota seguir": "{0} 클럽 회원들, 매각 거부: 반대 {1}%",
		"ASAMBLEA DE SOCIOS": "회원 총회",
		"EL DUEÑO QUIERE TUS ACCIONES": "구단주가 지분을 원함",
		"No regatea: el dinero no es su problema.": "흥정하지 않아요: 돈은 문제가 아니에요.",
		"Sabe lo que vale cada parte y lo paga.": "지분마다 가치를 알고 그만큼 줘요.",
		"Su fondo regatea cada céntimo.": "그의 펀드는 한 푼까지 흥정해요.",
		"VENDO": "판매",
		"NO VENDO": "보유",
		"EN EL DESPACHO": "사무실에서",
		"tus acciones": "내 지분",
		"{0} tiene dueño nuevo y lo quiere entero: te ofrece ${1} por la parte que compraste en la asamblea, que te costó ${2}.": "{0} 클럽의 새 구단주가 지분 전부를 원해요: 총회 때 ${2}에 산 당신 지분에 ${1} 가격을 제시해요.",
		"HUELGA EN EL VESTUARIO": "라커룸 파업",
		"{0} lleva {1} partidos sin pagar a nadie y a ti te debe ${2}. El capitán os reúne antes de entrenar: nadie sale al campo hasta que el club pague. Si os plantáis todos, la directiva rasca la caja y paga ${3}. Si tú entrenas, la huelga se rompe.": "{0} 클럽이 {1}경기째 아무에게도 급여를 안 줬고, 당신에게 밀린 돈은 ${2}. 주장이 훈련 전에 선수들을 모았어요: 클럽이 돈을 줄 때까지 아무도 경기장에 안 나가요. 모두 버티면 이사회가 자금을 긁어모아 ${3}만큼 지급해요. 당신이 훈련하면 파업은 깨져요.",
		"ME SUMO": "동참",
		"SALGO A ENTRENAR": "훈련 나감",
		"El {0} entra en concurso y le embargan el estadio: jugará en el campo del {1}": "{0} 클럽, 법정관리로 경기장 압류: {1} 클럽 홈구장에서 경기",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Y el estadio queda embargado: esta temporada jugáis de local en {0}, el campo del {1}.": "클럽이 빚을 갚지 못해 판사가 법정관리인을 앉혔어요. 겨울 이적 시장까지 아무도 영입하지 않고 어떤 계약도 손대지 않아요. 당신 계약도요. 게다가 경기장이 압류됐어요: 이번 시즌 홈 경기는 {1} 클럽의 구장인 {0}에서 치러요.",
		"El {0} sale del concurso: pacta con sus acreedores y vuelve a fichar": "{0} 클럽, 법정관리 졸업: 채권단과 합의하고 다시 영입 가능",
		"TE PEDIRÁN GOL Y PASE": "골과 도움을 원할 거예요",
		"En el partido: juegas arriba y pegado a tu banda, con más ángulo, contras y balones servidos.": "경기에서는: 높은 위치에서 측면에 붙어 뛰고, 좁은 각도의 슈팅, 역습, 받아먹는 공이 많아요.",
		"EL RESBALÓN": "미끄러짐",
		"ESTAMBUL": "이스탄불",
		"LA REMONTADA": "대역전",
		"EL 92:48": "92:48",
		"EL CÓRNER RÁPIDO": "빠른 코너킥",
		"LA FINAL EN SU CASA": "상대 홈에서의 결승",
		"LA NOCHE DE LONDRES": "런던의 밤",
		"EL PORTERO CABECEA": "골키퍼의 헤더",
		"LA FINAL EN MADRID": "마드리드 결승",
		"SE RESBALÓ": "미끄러졌다",
		"IBAN 3-0": "3-0 리드",
		"NADIE MIRABA": "아무도 안 봤다",
		"NI UN PENAL": "PK 하나 없이",
		"FUE EL PORTERO": "골키퍼가 넣었다",
		"Juega con uno de los dos clubes contra el otro.": "두 클럽 중 하나로 상대 클럽과 맞붙어요.",
		"Falta una jornada para el derbi.": "다음 라운드는 더비예요.",
		"Faltan {0} jornadas para el derbi.": "더비까지 {0}라운드 남았어요.",
		"Falta una jornada para la fecha de selecciones.": "다음 라운드가 끝나면 A매치 기간이에요.",
		"Faltan {0} jornadas para la fecha de selecciones.": "A매치 기간까지 {0}라운드 남았어요.",
		"Te juegas el ascenso": "승격이 걸린 경기",
		"Te juegas la salvación": "잔류가 걸린 경기",
		"Te juegas el título": "우승이 걸린 경기",
		"Te espera el derbi": "더비가 기다려요",
		"Derbi ante {0}": "더비: 상대 {0}",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que bote.": "가슴으로 오는 공: 트래핑하고 바운드 전에 발리로 차요.",
		"Stick izquierdo para correr; pulsa {0} para barrerte": "왼쪽 스틱으로 달리기, {0} 버튼으로 슬라이딩",
		"Ponte entre el balón y tu portería para robar, o pulsa {0} para barrerte. Al recuperar, sigue con WASD y ataca.": "공과 우리 골대 사이에 서서 공을 뺏거나, {0} 버튼으로 슬라이딩하세요. 공을 되찾으면 WASD로 계속 공격하세요.",
		"WASD para correr; pulsa {0} para barrerte": "WASD로 달리기, {0} 버튼으로 슬라이딩",
		"TU TITULAR LLEGÓ A SU VESTUARIO": "내 발언이 상대 라커룸에",
		"TRES GOLES Y EL MICRO": "해트트릭과 마이크",
		"Hat-trick y el balón bajo el brazo. La cadena te para con él todavía en la mano y quiere oírtelo decir en directo.": "해트트릭 기념 공을 옆구리에 끼고 나오는데, 방송사가 공을 든 채인 당신을 붙잡고 생방송 인터뷰를 원해요.",
		"EL GOL DEL FINAL": "극장골",
		"Tu gol en el último suspiro decidió el partido. La cadena te para con el estadio aún temblando y quiere la frase de la noche.": "막판 극장골로 경기를 결정지었어요. 경기장이 아직 들썩이는 가운데 방송사가 당신을 붙잡고 오늘 밤의 한마디를 원해요.",
		"EL PENAL FALLADO": "PK 실축",
		"Fallaste un penal y la sala de prensa sólo quiere hablar de eso. Hay cámaras, hay micro y una pregunta esperándote.": "PK를 실축했고 기자회견장은 그 얘기만 원해요. 카메라와 마이크, 그리고 질문 하나가 기다려요.",
		"ASUMIRLO": "책임 인정",
		"EL PRÓXIMO LO METO": "다음엔 넣는다",
		"PENAL FALLADO": "PK 실축",
		"Un penal fallado pesa más que tres metidos. Lo que digas ahora es lo que se lee mañana.": "PK 실축 한 번은 세 골보다 무거워요. 지금 하는 말이 내일 기사가 돼요.",
		"RUEDA DE PRENSA": "기자회견",
		"· te buscarán": "· 노릴 거예요",
		"Colgaste las botas y volviste. Esa puerta sólo se abre una vez: la próxima despedida es la última.": "축구화를 벗었다가 돌아왔어요. 그 문은 한 번만 열려요: 다음 작별이 마지막이에요.",
		"Se viene contigo.": "함께 가기로 했어요.",
		"No se viene. Os toca la distancia.": "함께 가지 않아요. 장거리 연애예요.",
		"¿SE VIENE CONTIGO?": "함께 갈까?",
		"El contrato nuevo está encima de la mesa de la cocina, y es en otro país. {0} lo ha leído dos veces sin decir nada. Su vida está aquí.": "새 계약서가 부엌 식탁 위에 있어요. 다른 나라예요. {0} 씨는 아무 말 없이 두 번 읽었어요. 그녀의 삶은 여기 있어요.",
		"PEDIRLE QUE VENGA": "같이 가자고 한다",
		"QUE SE QUEDE": "남게 둔다",
		"LA CLÍNICA": "병원",
		"{0} se ha enterado por la tele antes que por ti. Está en la puerta de la clínica con una bolsa de ropa tuya y cara de no pensar irse.": "{0} 씨는 당신보다 TV로 먼저 소식을 들었어요. 당신 옷가방을 들고 병원 앞에 와 있는데, 돌아갈 생각이 없는 얼굴이에요.",
		"DEJAR QUE TE CUIDE": "간호받는다",
		"PEDIRLE ESPACIO": "혼자 있고 싶다",
		"Ser el máximo goleador de las ligas de Europa.": "유럽 리그 전체 득점왕이 되세요.",
		"El pase del Mundial": "세계 대회의 패스",
		"Ser el máximo asistente del Mundial con tu selección.": "국가대표로 세계 대회 도움왕이 되세요.",
		"Centenario Internacional": "A매치 센추리 클럽",
		"Jugar 100 partidos con tu selección.": "국가대표로 100경기에 출전하세요.",
		"FOTO OFICIAL": "팀 사진",
		"LA FOTO OFICIAL": "공식 팀 사진",
		"La plantilla de este año ya tiene su foto. Colgará en la sede toda la temporada.": "올해 스쿼드의 사진이 나왔어요. 시즌 내내 클럽 본부에 걸려요.",
		"FIRMA EL CONTRATO": "계약서에 서명",
		"Tu firma queda guardada: será la de tus autógrafos.": "서명이 저장됐어요: 앞으로 사인할 때 이 서명을 써요.",
		"RENOVACIÓN DE CONTRATO": "재계약",
		"CONTRATO DE JUGADOR": "선수 계약서",
		"FIRMA DEL JUGADOR": "선수 서명",
		"TU CAMISETA A LA GRADA": "유니폼을 관중석으로",
		"Arrastra hacia atrás y suelta": "뒤로 당겼다 놓으세요",
		"Más fuerte": "더 세게",
		"El niño del cartel se lleva tu camiseta.": "피켓 든 아이가 유니폼을 받았어요.",
		"Iba para el niño, pero se la quedó el de al lado.": "아이 몫이었는데, 옆 사람이 가져갔어요.",
		"La atrapó el de al lado del niño.": "아이 옆 사람이 잡았어요.",
		"La atrapó uno del muro.": "벽 쪽 사람이 잡았어요.",
		"Se la llevó la grada de arriba.": "위층 관중석으로 날아갔어요.",
		"Se quedó corta.": "모자랐어요.",
		"LA PIZARRA DEL MÍSTER": "감독의 전술판",
		"Dibuja tu jugada": "플레이를 그려 보세요",
		"LE GUSTÓ": "마음에 듦",
		"A SU MANERA": "감독 방식대로",
		"El míster deja tu jugada en la pizarra.": "감독이 당신의 플레이를 전술판에 남겨 둬요.",
		"El míster borra tus flechas y dibuja las suyas.": "감독이 당신 화살표를 지우고 자기 걸 그려요.",
		"PASEO DE LEYENDAS": "명예의 거리",
		"TU HUELLA": "내 흔적",
		"DEJA TU HUELLA": "흔적을 남기세요",
		"Mantén el dedo en el cemento": "손가락을 시멘트에 대고 있으세요",
		"Mantén {0} en el cemento": "{0} 버튼을 누른 채 시멘트에 찍으세요",
		"Bien honda: ahí se queda para siempre.": "깊게 찍혔어요: 영원히 남을 거예요.",
		"La plaza ya tiene tu mano.": "광장에 당신 손자국이 남았어요.",
		"Apenas se marca: el cemento ya estaba duro.": "겨우 자국만: 시멘트가 이미 굳었어요.",
		"¡JUNTITOS, TODOS MIRANDO A LA CÁMARA!": "다들 붙어서, 카메라 보세요!",
		"¡A LA CUENTA DE TRES!": "셋 하면!",
		"Primera ronda": "1라운드",
		"Segunda ronda": "2라운드",
		"Tercera ronda": "3라운드",
		"Cuarta ronda": "4라운드",
		"Quinta ronda": "5라운드",
		"Sexta ronda": "6라운드",
		"Séptima ronda": "7라운드",
		"Octava ronda": "8라운드",
		"Treintaidosavos": "64강",
		"32avos": "64강",
		"1.ª ronda": "1라운드",
		"2.ª ronda": "2라운드",
		"3.ª ronda": "3라운드",
		"4.ª ronda": "4라운드",
		"5.ª ronda": "5라운드",
		"6.ª ronda": "6라운드",
		"7.ª ronda": "7라운드",
		"8.ª ronda": "8라운드",
		"¡FESTEJO DESBLOQUEADO!": "세리머니 해금!",
		"LA OCARINA": "오카리나",
		"Te pones el gorro verde, te salen orejas de duende y tocas la ocarina. Lo estrenas en tu próximo gol.": "초록 모자를 쓰고, 요정 귀가 돋고, 오카리나를 불어요. 다음 골에서 첫선을 보여요.",
		"Se gana en el piano de casa, tocando de oído una canción de la ocarina: te pones el gorro verde, te salen orejas de duende y la tocas. Uno de cada once goles.": "집에 있는 피아노로 오카리나 노래를 귀로 듣고 연주하면 얻어요: 초록 모자를 쓰고, 요정 귀가 돋고, 연주해요. 11골에 한 번.",
		"¡SEXTETE!": "6관왕!",
		"¡SEPTETE!": "7관왕!",
		"¡OCTETE!": "8관왕!",
		"Esto ya no es una temporada: es la historia del club.": "이건 이제 한 시즌이 아니에요: 클럽의 역사예요.",
		"SUS PADRES, EL DOMINGO": "일요일, 그녀의 부모님",
		"Los padres de {0} vienen a comer el domingo, como cada mes. Tu agente te ha cerrado una sesión de fotos a la misma hora.": "{0} 씨의 부모님이 매달 그렇듯 일요일 점심을 드시러 와요. 그런데 에이전트가 같은 시간에 화보 촬영을 잡았어요.",
		"PONER LA MESA": "상 차리기",
		"LA SESIÓN DE FOTOS": "화보 촬영",
		"LAS FIESTAS DE SU PUEBLO": "그녀 고향의 축제",
		"{0} quiere llevarte a las fiestas de su pueblo. Medio pueblo sabe ya que vas, y el otro medio lo sabrá en cuanto aparques.": "{0} 씨가 고향 축제에 당신을 데려가고 싶어 해요. 마을 절반은 이미 당신이 오는 걸 알고, 나머지 절반은 주차하자마자 알게 될 거예요.",
		"IR AL PUEBLO": "고향에 간다",
		"ESTE AÑO NO": "올해는 패스",
		"SU CUMPLEAÑOS, EN UNA ISLA": "섬에서의 생일",
		"{0} celebra su cumpleaños en una isla: avión fletado, cuarenta amigos y tres noches. Tú entrenas el viernes.": "{0} 씨가 섬에서 생일을 보내요: 전세기, 친구 마흔 명, 3박. 당신은 금요일에 훈련이 있어요.",
		"IR Y VOLVER EN EL DÍA": "당일치기",
		"LLAMARLA A MEDIANOCHE": "자정에 전화",
		"LA FOTO DE LAS CINCO": "새벽 5시의 사진",
		"Sale una foto de {0} a las cinco de la mañana en una discoteca, la víspera de tu partido. Tú dormías en casa; en las redes nadie lo cree.": "경기 전날 새벽 5시, 클럽에 있는 {0} 씨의 사진이 퍼졌어요. 당신은 집에서 자고 있었지만, SNS에선 아무도 안 믿어요.",
		"DEFENDERLA EN PÚBLICO": "공개적으로 감싸기",
		"PEDIRLE QUE BAJE EL RITMO": "자제를 부탁하기",
		"LA MESA DEL PRESIDENTE": "구단주의 테이블",
		"{0} ha conseguido sentarte en la mesa del presidente en la cena del club. No te lo ha consultado: te ha dicho a qué hora pasa el coche.": "{0} 씨가 클럽 만찬에서 구단주 테이블에 당신 자리를 마련했어요. 상의도 없이, 차가 몇 시에 오는지만 알려줬어요.",
		"IR Y SONREÍR": "가서 웃기",
		"NO ME MUEVAS LOS HILOS": "날 조종하지 마",
		"SU MARCA, TU CARA": "그녀의 브랜드, 내 얼굴",
		"{0} lanza su propia línea de ropa y quiere que la presentes tú. Dice que es un negocio de los dos; el contrato lo firma ella.": "{0} 씨가 자기 의류 브랜드를 론칭하면서 당신이 홍보하길 원해요. 둘의 사업이라는데, 계약서엔 그녀가 서명해요.",
		"PRESENTARLA": "홍보하기",
		"MI CARA NO SE PRESTA": "내 얼굴은 안 빌려줘",
		"EL MENSAJE DE LAS TRES": "새벽 3시의 메시지",
		"A las tres de la mañana se ha encendido tu teléfono: una periodista, por un reportaje. {0} ha visto la pantalla y ya no se ha vuelto a dormir.": "새벽 3시에 휴대폰이 켜졌어요: 기사 때문에 연락한 기자예요. {0} 씨는 화면을 보고 다시 잠들지 못했어요.",
		"ENSEÑARLE EL TELÉFONO": "휴대폰 보여주기",
		"ES MI TRABAJO": "일이니까",
		"LA FISIO NUEVA": "새 물리치료사",
		"El club ha fichado una fisioterapeuta y {0} ya sabe cómo se llama. Pregunta, como quien no quiere la cosa, a qué hora te toca.": "클럽이 새 여성 물리치료사를 고용했는데 {0} 씨는 벌써 이름을 알아요. 무심한 척 당신 치료가 몇 시냐고 물어요.",
		"CAMBIAR DE TURNO": "시간대 변경",
		"ES MI FISIO": "내 치료사야",
		"SU INAUGURACIÓN": "그녀의 전시 오픈",
		"{0} inaugura su primera exposición el sábado, y el sábado juegas en la otra punta del país. No te ha pedido que vayas.": "{0} 씨가 토요일에 첫 전시회를 열어요. 토요일에 당신은 나라 반대편에서 경기가 있어요. 와 달라고 하지는 않았어요.",
		"LLEGAR AUNQUE SEA AL FINAL": "끝날 때라도 간다",
		"MANDARLE FLORES": "꽃 보내기",
		"TE HA DICHO QUE NO": "거절당함",
		"Le pediste a {0} que viniera a la gala del club. Tiene un plan con sus amigas desde hace meses, y te ha dicho que no sin ningún drama.": "{0} 씨에게 클럽 시상식에 같이 가자고 했어요. 몇 달 전부터 친구들과 약속이 있어서, 아무렇지 않게 거절했어요.",
		"IR SOLO Y CONTÁRSELO": "혼자 가고 얘기해 주기",
		"PEDIRLE QUE LO CAMBIE": "약속 바꿔 달라기",
		"MADRINA DE LA PEÑA": "팬클럽 대모",
		"La peña del barrio quiere a {0} de madrina en su aniversario. Ella ya ha dicho que sí, y a ti te esperan para firmar camisetas.": "동네 팬클럽이 창립 기념일에 {0} 씨를 대모로 모시고 싶어 해요. 그녀는 이미 수락했고, 당신은 유니폼에 사인해야 해요.",
		"IR CON ELLA": "함께 간다",
		"QUE VAYA ELLA": "그녀만 보낸다",
		"TE LO DIJO EN EL COCHE": "차 안에서 들은 말",
		"Jugaste mal y {0} te lo ha dicho en el coche, con datos y sin anestesia. Sabe de qué habla: lleva veinte años en la grada.": "경기를 망쳤고, {0} 씨가 차 안에서 데이터를 들이밀며 사정없이 지적했어요. 뭘 아는 사람이에요: 20년째 관중석을 지켜 왔으니까요.",
		"HOY NO, POR FAVOR": "오늘은 제발 그만",
		"DIJISTE SU NOMBRE": "그녀의 이름을 말했다",
		"En una entrevista nombraste a {0}, de pasada y con cariño. Desde entonces le escriben desconocidos.": "인터뷰에서 지나가듯 다정하게 {0} 씨 이름을 언급했어요. 그 뒤로 모르는 사람들이 그녀에게 메시지를 보내요.",
		"PEDIRLE PERDÓN": "사과하기",
		"LO DIJE CON CARIÑO": "좋은 뜻이었어",
		"UNA VALLA MÁS ALTA": "더 높은 담장",
		"{0} quiere una valla alta y cámaras en la entrada de tu casa. Los vecinos, que te saludan cada mañana, no lo van a entender.": "{0} 씨가 집 입구에 높은 담장과 카메라를 원해요. 매일 아침 인사하는 이웃들은 이해 못 할 거예요.",
		"PONER LA VALLA": "담장 설치",
		"AQUÍ NO HACE FALTA": "여긴 필요 없어",
		"UNA CUENTA DE LOS DOS": "공동 계좌",
		"{0} ha encontrado un banco que os abre una cuenta conjunta con tarjeta de cristal. Dice que así no tiene que pedirte cada cosa.": "{0} 씨가 크리스털 카드가 나오는 공동 계좌를 열어 주는 은행을 찾았어요. 그러면 하나하나 부탁할 필요가 없대요.",
		"ABRIRLA": "개설",
		"CADA UNO LA SUYA": "각자 따로",
		"EL ESCAPARATE": "쇼윈도",
		"Paseabais y {0} se ha parado delante de un escaparate. No ha dicho nada. Al día siguiente ha vuelto a pasar por la misma calle.": "산책하다가 {0} 씨가 어느 쇼윈도 앞에 멈춰 섰어요. 아무 말도 안 했어요. 다음 날 같은 거리를 또 지나갔어요.",
		"SEGUIR ANDANDO": "계속 걷기",
		"SU EXAMEN": "그녀의 시험",
		"{0} tiene el lunes el examen más importante de su carrera. Lleva meses aguantando tus viajes; esta semana sólo te pide la casa en silencio.": "{0} 씨는 월요일에 인생에서 가장 중요한 시험이 있어요. 몇 달째 당신의 원정을 견뎌 왔고, 이번 주엔 조용한 집만 부탁해요.",
		"DORMIR EN EL HOTEL DEL CLUB": "클럽 호텔에서 자기",
		"LA CASA ES DE LOS DOS": "우리 둘의 집이야",
		"LA CENA DE FIN DE TEMPORADA": "시즌 종료 만찬",
		"{0} se ha hecho amiga de medio vestuario, y ahora el capitán quiere hacer la cena de fin de temporada en tu casa.": "{0} 씨가 라커룸 절반과 친해졌고, 이제 주장이 시즌 종료 만찬을 당신 집에서 하고 싶어 해요.",
		"HACERLA EN CASA": "집에서 열기",
		"MEJOR EN UN RESTAURANTE": "식당이 낫겠어",
		"SU AVIÓN": "전용기",
		"{0} te ofrece su avión para volver del partido de fuera, en vez del autobús del equipo. Llegarías a casa tres horas antes.": "{0} 씨가 원정 경기 후 팀 버스 대신 자기 전용기를 타고 오라고 해요. 집에 세 시간 일찍 도착할 거예요.",
		"EL AVIÓN": "전용기",
		"EL AUTOBÚS": "버스",
		"LA CENA CON SU PADRE": "그녀 아버지와의 만찬",
		"El padre de {0} te ha invitado a cenar. Tiene tres empresas y una sola pregunta: qué vas a hacer cuando dejes el fútbol.": "{0} 씨의 아버지가 저녁 식사에 초대했어요. 회사를 셋이나 가졌고, 질문은 하나뿐이에요: 축구를 그만두면 뭘 할 건가?",
		"TENGO UN PLAN": "계획이 있어요",
		"NO LO HE PENSADO": "아직 생각 못 했어요",
		"LA LUNA DE MIEL": "신혼여행",
		"Os casasteis en plena temporada y la luna de miel sigue en un cajón. {0} ha encontrado diez días en tu calendario y ya ha mirado vuelos.": "시즌 중에 결혼해서 신혼여행은 아직 서랍 속이에요. {0} 씨가 당신 일정에서 열흘을 찾아냈고 벌써 항공편을 봤어요.",
		"IROS LOS DIEZ DÍAS": "열흘 다 떠나기",
		"EN VERANO, PROMETIDO": "여름에, 약속해",
		"NAVIDAD, ¿EN QUÉ CASA?": "크리스마스는 어느 집?",
		"Tu madre y {0} se tratan con una educación que da frío. Este año hay que elegir dónde se pasa la Navidad, y las dos esperan la misma respuesta.": "어머니와 {0} 씨는 서늘할 만큼 예의 바르게 서로를 대해요. 올해는 크리스마스를 어디서 보낼지 정해야 하는데, 둘 다 같은 답을 기다려요.",
		"CON SU FAMILIA": "그녀의 가족",
		"CON LA TUYA": "내 가족",
		"LA MESA DE LA PRIMERA CENA": "첫 데이트의 그 테이블",
		"Lleváis meses sin salir solos. {0} ha reservado el jueves en el restaurante de vuestra primera cena, sin preguntarte si tenías algo.": "둘이서만 나간 지 몇 달째예요. {0} 씨가 당신 일정도 묻지 않고 목요일에 첫 저녁을 먹었던 식당을 예약했어요.",
		"IR EL JUEVES": "목요일에 가기",
		"CAMBIARLO DE DÍA": "날짜 바꾸기",
		"LAS FOTOS DE LA BODA": "결혼식 사진",
		"Una revista ofrece una fortuna por las fotos de vuestra boda, que nunca enseñasteis a nadie. {0} dice que decidas tú.": "한 잡지가 아무에게도 공개한 적 없는 결혼식 사진에 거액을 제시해요. {0} 씨는 당신이 정하래요.",
		"VENDERLAS": "판다",
		"SON NUESTRAS": "우리만의 것",
		"¿CUÁNTOS AÑOS MÁS?": "앞으로 몇 년 더?",
		"{0} te ha preguntado, por primera vez, cuántos años más piensas jugar. No era un reproche: quería saber cuándo empezáis a vivir.": "{0} 씨가 처음으로 앞으로 몇 년 더 뛸 생각인지 물었어요. 원망이 아니었어요: 둘이 언제부터 함께 살 수 있는지 알고 싶었던 거예요.",
		"LOS QUE AGUANTEN LAS PIERNAS": "다리가 버틸 때까지",
		"COMPRA": "구매",
		"Empezáis a salir, {0} y tú. Si no es lo tuyo, se deja en RELACIONES y no cuesta nada.": "{0} 씨와 사귀기 시작했어요. 마음에 안 들면 관계 메뉴에서 정리할 수 있고, 비용은 없어요.",
		"Va a vibrar tres veces. Guarda el teléfono y escucha lo que te cuenta.": "휴대폰이 세 번 울릴 거예요. 휴대폰을 치우고 그녀 얘기를 들으세요.",
		"En la próxima cita te lo preguntará:": "다음 데이트에서 물어볼 거예요:",
		"Lo que te contó en la cena · {0} de {1}": "저녁 식사 때 들은 이야기 · {1} 중 {0}",
		"Pulsa con la línea dentro de la franja · {0} de {1}": "선이 띠 안에 있을 때 탭 · {1} 중 {0}",
		"Alguien te pregunta a qué te dedicas. Contesta sin presumir.": "누군가 무슨 일을 하냐고 물어요. 잘난 척하지 말고 대답하세요.",
		"EL ROBOT": "로봇",
		"Baile suelto: codos en ángulo recto y la cabeza girando a tirones, como una máquina. Pide sitio a la vista.": "자유 댄스: 팔꿈치를 직각으로 꺾고 머리를 기계처럼 끊어서 돌려요. 주변에 공간이 필요해요.",
		"Tienes pareja: meces un bebé invisible en los brazos, para quien te espera en casa.": "연인이 있어요: 집에서 기다리는 사람을 위해 보이지 않는 아기를 품에 안고 흔들어요.",
		"LA LLAMADA": "전화 세리머니",
		"Hay clubes preguntando por ti: te llevas la mano a la oreja como un teléfono. Que llame tu agente.": "여러 클럽이 당신을 문의 중: 손을 전화기처럼 귀에 대요. 에이전트한테 전화하라고.",
		"EL SURF": "서핑",
		"Baile suelto: te tiras de panza y te deslizas por el césped con los brazos abiertos.": "자유 댄스: 배로 몸을 던져 두 팔을 벌리고 잔디 위를 미끄러져요.",
		"LOS BOLOS": "볼링",
		"Baile suelto: zancada baja y lanzas una bola invisible de bolos rasa por el césped.": "자유 댄스: 낮게 런지하며 보이지 않는 볼링공을 잔디 위로 굴려요.",
		"EL ABRAZO": "포옹",
		"Baile suelto: abres los brazos y le das un abrazo enorme a la grada.": "자유 댄스: 두 팔을 벌려 관중석을 크게 안아 줘요.",
		"LA CUMBIA": "쿰비아",
		"Baile suelto: pasito a un lado y al otro, cadera y brazos al ritmo.": "자유 댄스: 이쪽저쪽으로 잔걸음, 리듬에 맞춰 엉덩이와 팔을 흔들어요.",
		"EL RUGIDO": "포효",
		"Un golazo: te agachas, sacas las garras y ruges como un león.": "원더골: 몸을 웅크리고 발톱을 세운 채 사자처럼 포효해요.",
		"EL BEBE": "아기",
		"Tener un amigo que juega en otro tipo de teléfono.": "다른 종류의 휴대폰으로 플레이하는 친구 만들기.",
		"Cuatro Goles": "4골",
		"Partidos de 4 goles o más": "4골 이상 나온 경기",
		"DUELO DE CONSOLA": "기기 대결",
		"El portero te reta a penaltis al acabar el entreno y medio vestuario se queda a mirar y a picarse.": "훈련이 끝나고 골키퍼가 승부차기 대결을 걸어와요. 라커룸 절반이 남아서 구경하며 약을 올려요.",
		"El comité europeo deja al {0} sin Europa una temporada": "유럽 위원회, {0} 클럽에 한 시즌 유럽 대회 출전 금지",
		"El comité europeo investiga el dinero del jeque del {0}": "유럽 위원회, {0} 클럽 셰이크 자금 조사 착수",
		"EUROPA DICTA SENTENCIA": "유럽의 판결",
		"FALLO EUROPEO": "유럽 판결",
		"EL FALLO EUROPEO": "유럽의 판결",
		"El comité europeo ha investigado los patrocinios del jeque y los da por inflados: el club no jugará en Europa la temporada que viene. En la liga no pierde ni un punto.": "유럽 위원회가 셰이크의 스폰서 계약을 조사한 결과 부풀려졌다고 판단했어요. 클럽은 다음 시즌 유럽 대회에 나갈 수 없어요. 리그에서는 승점이 한 점도 깎이지 않아요.",
		"· tienes que marcar": "· 골을 넣어야 해요",
		"ASÍ VA EL CHICO DE ORO": "골든 키드 레이스",
		"El mejor de {0} años o menos, con el mismo baremo que el Jugador del Año.": "{0}세 이하 최고의 선수. 올해의 선수와 같은 기준으로 평가해요.",
		"LA PROMESA DEL AÑO": "올해의 유망주",
		"LA PROMESA DEL AÑO · {0}": "올해의 유망주 · {0}",
		"TU PRIMER CHICO DE ORO": "내 첫 골든 키드",
		"TU CHICO DE ORO Nº {0}": "내 골든 키드 {0}번째",
		"LA GALA DEL CHICO DE ORO": "골든 키드 시상식",
		"¿QUIÉN ES TU ÍDOLO?": "내 우상은?",
		"ELEGIR A TU ÍDOLO": "우상 선택",
		"Primer premio en primera. Y la pregunta que te van a hacer toda la carrera.": "1부 리그 첫 수상. 그리고 커리어 내내 듣게 될 질문.",
		"MANTÉN PULSADO PARA ELEGIRLO: NO PODRÁS CAMBIARLO": "길게 눌러 선택: 변경 불가",
		"LA TERTULIA": "토크쇼",
		"EL DEBATE": "토론",
		"TE ADORAN": "찬사",
		"TE CRITICAN": "혹평",
		"OPINIONES DIVIDIDAS": "엇갈린 평가",
		"A FAVOR": "찬성",
		"EN CONTRA": "반대",
		"CON DUDAS": "글쎄",
		"¿ES PARA PRIMERA?": "1부 감인가?",
		"¿YA ES UN CRACK?": "벌써 스타?",
		"¿CUMPLE O NO CUMPLE?": "제 몫 하나?",
		"En la tele ya hablan de ti como de los buenos.": "TV에서는 벌써 당신을 정상급 선수로 이야기해요.",
		"En la tele piden más. En el campo se contesta.": "TV에서는 더 많은 걸 바라요. 대답은 그라운드에서.",
		"En la tele no terminan de decidirse contigo.": "TV에서는 아직 당신에 대한 평가를 못 내렸어요.",
		"EL EXJUGADOR": "전직 선수",
		"LA PERIODISTA": "기자",
		"EL CRÍTICO": "비평가",
		"Una media de {0}. Eso en Primera no lo firma cualquiera.": "평균 평점 {0}. 1부에서 아무나 내는 기록이 아니죠.",
		"Cada jornada, de lo mejor del campo: {0} de media.": "매 라운드 경기장 최고 수준: 평균 {0}.",
		"Un {0} de media. Cumple, pero de él se espera más.": "평균 {0}. 제 몫은 하지만, 더 기대하게 되죠.",
		"{0} de nota. Ni para tirar cohetes ni para preocuparse.": "평점 {0}. 축포를 쏠 일도, 걱정할 일도 아니에요.",
		"Un {0} de media es muy poco para Primera.": "평균 평점 {0}, 1부에선 너무 낮아요.",
		"Con {0} de nota, yo me lo pensaría para el once.": "평점 {0}. 저라면 선발로 쓸지 고민하겠어요.",
		"Goles: {0}. Asistencias: {1}. Está decidiendo partidos.": "골: {0}. 도움: {1}. 경기를 결정짓고 있어요.",
		"Los números hablan solos. Goles: {0}. Asistencias: {1}.": "숫자가 다 말해줘요. 골: {0}. 도움: {1}.",
		"Goles: {0}. Asistencias: {1}. Correcto, sin más.": "골: {0}. 도움: {1}. 무난해요, 그 이상은 아니고요.",
		"Goles: {0}. Asistencias: {1}. Aporta, pero no basta.": "골: {0}. 도움: {1}. 보탬은 되지만 부족해요.",
		"Goles: {0}. Asistencias: {1}. En toda la temporada. Así no.": "골: {0}. 도움: {1}. 시즌 전체 기록이에요. 이래선 안 돼요.",
		"Goles: {0}. Asistencias: {1}. No aparece: hay que exigirle.": "골: {0}. 도움: {1}. 존재감이 없어요. 다그쳐야 해요.",
		"{0} de {1} partidos. El técnico no lo saca del once.": "{1}경기 중 {0}경기. 감독이 선발에서 빼지 않아요.",
		"Es fijo: {0} partidos de {1}. Eso es confianza.": "붙박이예요: {1}경기 중 {0}경기. 그게 신뢰죠.",
		"{0} partidos de {1}. Todavía no es indiscutible.": "{1}경기 중 {0}경기. 아직 확실한 주전은 아니에요.",
		"Entra y sale: {0} de {1}. Tiene que ganarse el sitio.": "들쭉날쭉: {1}경기 중 {0}경기. 자리를 따내야 해요.",
		"Sólo {0} de {1} partidos. Ni su técnico confía en él.": "{1}경기 중 고작 {0}경기. 감독조차 믿지 않아요.",
		"{0} partidos de {1}. Así es imposible que crezca.": "{1}경기 중 {0}경기. 이래서는 성장할 수가 없어요.",
		"El equipo va en el puesto {0} y él tiene mucho que ver.": "팀은 {0}위, 그의 지분이 커요.",
		"Puesto {0} en la tabla. Cuando el equipo gana, todos brillan.": "순위표 {0}위. 팀이 이기면 모두가 빛나죠.",
		"El equipo va en el puesto {0}, en tierra de nadie. Y él, igual.": "팀은 {0}위, 어중간한 위치예요. 그도 마찬가지고요.",
		"Puesto {0}. Una temporada gris para todos.": "{0}위. 모두에게 잿빛 시즌이에요.",
		"El equipo va en el puesto {0} y él no ayuda a salir de ahí.": "팀은 {0}위인데, 그는 반등에 도움이 안 돼요.",
		"Puesto {0} en la tabla. Alguien tiene que dar un paso al frente.": "순위표 {0}위. 누군가 나서야 해요.",
		"MANTÉN PARA SALTAR": "길게 눌러 건너뛰기",
		"TU ÍDOLO": "내 우상",
		"A GANARSE EL PUESTO": "자리를 따내라",
		"Ahora le toca al banquillo dar la cara.": "이제 벤치 멤버들이 나설 차례예요.",
		"Ahora tiene que demostrar que es imprescindible.": "이제 없어선 안 될 선수임을 증명해야 해요.",
		"Apareció cuando nadie lo esperaba. Eso es un crack.": "아무도 기대하지 않을 때 나타났어요. 그게 스타죠.",
		"BAJA SENSIBLE": "뼈아픈 공백",
		"Buen gol, pero el partido lo jugó a ratos.": "멋진 골이었지만, 경기 내내 기복이 있었어요.",
		"CON ÉL": "있을 때",
		"CON ÉL Y SIN ÉL": "있을 때 / 없을 때",
		"Cada partido, su gol. Así se gana una liga.": "매 경기 한 골. 그렇게 리그 우승을 하는 거죠.",
		"Con ese penalti se escaparon los puntos.": "그 페널티킥으로 승점이 날아갔어요.",
		"Con o sin ti, el equipo fue igual. Ahora, a marcar la diferencia.": "당신이 있든 없든 팀은 똑같았어요. 이제 차이를 만들어 보세요.",
		"Con él, {0} puntos por partido; sin él, {1}.": "그가 있을 때 경기당 승점 {0}, 없을 때 {1}.",
		"Convocado, pero desde el banquillo.": "소집됐지만, 벤치에서 시작해요.",
		"Convocado. Ahora a ganarse el once.": "소집 완료. 이제 선발 자리를 따내야죠.",
		"Dejó al equipo con diez. Eso no se hace.": "팀을 10명으로 만들었어요. 그러면 안 되죠.",
		"EL ONCE DE LA TELE": "TV 올해의 팀",
		"EL ONCE DE LA TEMPORADA": "시즌 베스트 11",
		"EL PARTE MÉDICO": "의료 보고서",
		"EL PENALTI FALLADO": "실축한 페널티킥",
		"El equipo aguanta {0} semanas sin él.": "팀은 그 없이 {0}주를 버틸 수 있어요.",
		"El equipo ha vivido muy bien sin él.": "팀은 그가 없어도 아주 잘 지냈어요.",
		"El equipo lo ha echado mucho de menos.": "팀은 그의 빈자리를 크게 느꼈어요.",
		"El equipo ni ganó ni perdió sin él.": "그가 없어도 팀은 얻은 것도 잃은 것도 없었어요.",
		"El equipo sumó más sin ti. Toca demostrar en el campo.": "당신이 없을 때 팀이 승점을 더 땄어요. 그라운드에서 증명할 때예요.",
		"El portero lo adivinó. Mérito suyo.": "골키퍼가 방향을 읽었어요. 골키퍼가 잘한 거죠.",
		"El seleccionador cuenta contigo de inicio.": "대표팀 감독이 당신을 선발로 생각하고 있어요.",
		"El seleccionador tiene otros nombres.": "대표팀 감독은 다른 선수들을 염두에 두고 있어요.",
		"Entre los once mejores de la liga. Ahí es nada.": "리그 베스트 11. 대단하죠.",
		"Entre los once mejores de la liga. La tele te pone de ejemplo.": "리그 베스트 11. TV에서 당신을 본보기로 꼽아요.",
		"Ese gol vale puntos y vale una temporada.": "그 골은 승점의 가치, 한 시즌의 가치가 있어요.",
		"Ese penalti no se puede fallar.": "그 페널티킥은 놓치면 안 되죠.",
		"Esta vez no entraste. El once del año que viene se gana desde ya.": "이번엔 못 들었어요. 내년 베스트 11은 지금부터 따내는 거예요.",
		"Esta vez no estás. La próxima lista se gana con tu club.": "이번엔 명단에 없어요. 다음 명단은 소속 클럽에서 따내는 거예요.",
		"Estuvo cerca. El año que viene, dentro.": "아까웠어요. 내년엔 들어가요.",
		"Está dentro, que es lo primero.": "명단에 들었어요. 그게 먼저죠.",
		"Estás en la lista. El once, a ganárselo en los entrenamientos.": "소집 명단에 들었어요. 선발 자리는 훈련에서 따내세요.",
		"Fallar un penalti le pasa a cualquiera.": "페널티킥 실축은 누구에게나 일어나요.",
		"Fuera de la lista. Mensaje claro del seleccionador.": "명단 제외. 대표팀 감독의 분명한 메시지예요.",
		"Hay que verla diez veces. No lo tengo claro.": "열 번은 돌려봐야 해요. 확신이 안 서네요.",
		"IMPRESCINDIBLE": "필수 자원",
		"Indiscutible en el once de la temporada.": "시즌 베스트 11의 확고한 주인공.",
		"LA LISTA DE LA SELECCIÓN": "대표팀 소집 명단",
		"LA MOVIOLA": "리플레이",
		"LA RACHA": "상승세",
		"LA ROJA": "레드카드",
		"LA SEQUÍA": "골 가뭄",
		"La portería se te resiste. Un gol lo cambia todo.": "골문이 좀처럼 안 열려요. 한 골이면 모든 게 바뀌어요.",
		"La selección se construye a su alrededor.": "대표팀이 그를 중심으로 꾸려지고 있어요.",
		"La tele lo repite una y otra vez. Al siguiente, se marca.": "TV에서 계속 다시 보여줘요. 다음엔 넣으면 돼요.",
		"La tele no habla de otra cosa: estás en racha.": "TV는 온통 당신 얘기뿐이에요: 상승세를 타고 있어요.",
		"Le faltó regularidad para entrar.": "명단에 들기엔 꾸준함이 부족했어요.",
		"Le toca ganarse el puesto otra vez.": "다시 자리를 따내야 해요.",
		"Lo decidió él, sí. Ochenta minutos discretos.": "결정지은 건 그가 맞아요. 80분은 조용했지만요.",
		"Lo ha merecido, partido a partido.": "한 경기 한 경기, 충분히 자격이 있어요.",
		"MAZAZO": "날벼락",
		"Marca en {0} partidos seguidos. Está en racha.": "{0}경기 연속 골. 상승세를 타고 있어요.",
		"Necesita un gol, aunque sea de rebote.": "골이 필요해요. 리바운드 골이라도요.",
		"Ni rastro de él en el once. Temporada floja.": "베스트 11 어디에도 없어요. 아쉬운 시즌이에요.",
		"No hay defensa que lo pare ahora mismo.": "지금 그를 막을 수비는 없어요.",
		"Otros lo hicieron mejor en su puesto.": "그의 포지션에서 더 잘한 선수들이 있었어요.",
		"PARTE MÉDICO": "부상 소식",
		"PUNTOS POR PARTIDO": "경기당 승점",
		"Para mí, la roja fue muy rigurosa.": "제가 보기엔 레드카드는 너무 가혹했어요.",
		"Partidos que se pierde: {1}. Se notará.": "결장 경기: {1}. 공백이 느껴질 거예요.",
		"Partidos que se pierde: {1}. Y de los gordos.": "결장 경기: {1}. 그것도 빅매치들이에요.",
		"Poca cosa. En nada vuelves a estar disponible.": "별일 아니에요. 금방 다시 뛸 수 있어요.",
		"SE PIERDE": "결장",
		"SEMANAS": "주",
		"SIN PARTIDOS A LA VISTA": "예정 경기 없음",
		"SIN ÉL": "없을 때",
		"Se le ha cerrado la portería.": "골문이 그에게 굳게 닫혔어요.",
		"Se queda fuera, pero la puerta sigue abierta.": "명단에서 빠졌지만, 문은 아직 열려 있어요.",
		"Sin marcar en {0} partidos. Un delantero vive del gol.": "{0}경기 무득점. 공격수는 골로 먹고살죠.",
		"Sin ti el equipo se resintió. Vuelve su referente.": "당신이 없는 동안 팀이 흔들렸어요. 에이스가 돌아와요.",
		"Sin él, el equipo se queda cojo.": "그가 없으면 팀이 절름발이가 돼요.",
		"Sin él, el equipo sumó más: {1} por partido.": "그가 없을 때 팀이 더 많이 땄어요: 경기당 {1}.",
		"Sin él, {1} puntos por partido. Con él, {0}.": "그가 없을 때 경기당 승점 {1}. 있을 때 {0}.",
		"Su temporada no le alcanza para la selección.": "그의 시즌 활약으로는 대표팀에 들기 부족해요.",
		"TE QUEDAS FUERA": "명단 제외",
		"Te toca mirar desde la grada unas semanas.": "몇 주 동안은 관중석에서 지켜봐야 해요.",
		"Titular con su país. Se lo ha ganado.": "조국의 선발 선수. 자격이 충분해요.",
		"Tu gol del final es la jugada de la semana.": "당신의 막판 골이 이주의 플레이예요.",
		"Tu roja es la polémica de la semana.": "당신의 레드카드가 이주의 논란이에요.",
		"UN SUSTO": "철렁",
		"Un susto y poco más: {0} semanas.": "가벼운 부상일 뿐이에요: {0}주.",
		"Una roja infantil. La paga el equipo.": "유치한 퇴장. 대가는 팀이 치러요.",
		"Va con la selección, pero no es titular.": "대표팀에 합류하지만 선발은 아니에요.",
		"Va para largo. El equipo tendrá que apañarse sin ti.": "오래 걸릴 거예요. 팀은 당신 없이 버텨야 해요.",
		"Vuelve el que marca la diferencia.": "차이를 만드는 선수가 돌아와요.",
		"Vuelve enseguida. Nada que lamentar.": "곧 돌아와요. 걱정할 것 없어요.",
		"Ya es fijo para el seleccionador.": "이제 대표팀 감독의 붙박이 선수예요.",
		"{0} PARTIDOS MARCANDO": "{0}경기 연속 골",
		"{0} PARTIDOS SIN MARCAR": "{0}경기 무득점",
		"{0} semanas fuera, justo cuando iba lanzado.": "{0}주 결장, 한창 날아오르던 참에.",
		"{0} semanas fuera. Mazazo para el club.": "{0}주 결장. 클럽에 날벼락이에요.",
		"¿LO HAN ECHADO DE MENOS?": "그의 공백, 컸나?",
		"ÚLTIMOS PARTIDOS": "최근 경기",
		"Hay respuestas que te siguen toda la carrera.": "커리어 내내 따라다니는 대답도 있어요.",
		"HACE {0} TEMPORADAS": "{0}시즌 전",
		"MI ÍDOLO ES {0}": "내 우상: {0}",
		"LA PRENSA RECUPERA AQUEL VÍDEO": "언론이 그 영상을 다시 꺼내요",
		"PREMIOS DEL MES DESDE ENTONCES": "그 후 이달의 선수 수상",
		"¿SIGUE SIENDO TU ÍDOLO?": "아직도 우상이에요?",
		"La sala pone el vídeo de hace {0} temporadas. Lo que digas hoy sale mañana al lado.": "회견장에서 {0}시즌 전 영상을 틀어요. 오늘 하는 말은 내일 그 옆에 실려요.",
		"SIEMPRE LO SERÁ": "영원한 우상",
		"YA JUEGO MI PROPIA HISTORIA": "이젠 내 역사를 써요",
		"EL FAN DE SIEMPRE": "여전히 팬",
		"DE MANOS DE TU IDOLO": "우상의 손에서",
		"Nunca lo gané. Verlo en tus manos es casi lo mismo.": "난 끝내 못 땄어. 네 손에 있는 걸 보니 거의 같은 기분이야.",
		"Yo también lo levanté una vez. Ahora es tuyo.": "나도 한 번 들어 올렸지. 이제 네 거야.",
		"Lo levanté {0} veces. Ninguna pesó como ésta.": "난 {0}번 들어 올렸어. 이번만큼 묵직한 건 없었지.",
		"Te lo entregó {0}, el ídolo del que hablaste aquella noche.": "그날 밤 말했던 우상, {0} 선수가 직접 건네줬어요.",
		"Te Elijo a Ti": "너로 정했다",
		"Ponerle a una mascota el nombre del ratón eléctrico más famoso.": "반려동물에게 가장 유명한 전기 쥐의 이름을 붙이세요.",
		"Hay un nombre amarillo y eléctrico que tus mascotas llevan esperando.": "반려동물들이 기다려 온 노랗고 찌릿한 이름이 있어요.",
		"LO CONOCES": "첫 만남",
		"TU IDOLO VINO A VERTE": "우상이 당신을 보러 왔어요",
		"LA PRIMERA VEZ EN PERSONA": "처음 직접 만난 날",
		"la final": "결승",
		"el derbi": "더비",
		"temporadas después": "시즌 후",
		"Lo dijiste hace {0} temporadas en una rueda de prensa. Hoy bajó a buscarte.": "{0}시즌 전 기자회견에서 했던 말. 오늘 그가 당신을 찾아 내려왔어요.",
		"Te vi levantarla. Yo también temblaba la primera vez.": "네가 들어 올리는 걸 봤어. 나도 처음엔 떨렸지.",
		"Hoy duele. Guárdalo: la próxima vez te toca a ti.": "오늘은 아프겠지. 잘 간직해. 다음엔 네 차례야.",
		"Esta casa también fue la mía. Gracias por cuidarla.": "이 집은 내 집이기도 했어. 잘 지켜줘서 고마워.",
		"Esta grada no olvida, y yo tampoco. Sigue.": "이 관중석은 잊지 않아. 나도 마찬가지고. 계속 달려.",
		"PINGÜINO": "펭귄",
		"Un pingüino que anda a pasitos por la casa. Dicen que trae suerte en el próximo gol.": "집 안을 뒤뚱뒤뚱 걸어 다니는 펭귄. 다음 골에 행운을 가져다준대요.",
		"EL PINGUINAZO": "펭귄 대작전",
		"Se gana comprando el pingüino de casa: en tu siguiente gol tu equipo se vuelve pingüinos y los rivales, dinosaurios. Sale una sola vez.": "집에 펭귄을 사면 얻어요: 다음 골에 우리 팀은 펭귄, 상대는 공룡으로 변해요. 딱 한 번만 나와요.",
		"Tu equipo se vuelve pingüinos y los rivales, dinosaurios. Lo estrenas en tu próximo gol, y sólo esa vez.": "우리 팀은 펭귄, 상대는 공룡으로 변해요. 다음 골에 첫선을 보이고, 그 한 번뿐이에요.",
		"SU FESTEJO": "그의 세리머니",
		"TU IDOLO TE ESPERABA": "우상이 기다리고 있었어요",
		"NUEVO FESTEJO": "새 세리머니",
		"La levanté con esta misma camiseta. Ahora mi festejo es tuyo.": "바로 이 유니폼을 입고 들어 올렸지. 이제 내 세리머니는 네 거야.",
		"Me has ganado la final. Esto ya no es mío.": "결승에서 날 이겼구나. 이제 이건 내 게 아니야.",
		"Se lo ganaste en una final, a él.": "결승에서, 바로 그를 꺾고 따냈어요.",
		"Ganaste una final con su camiseta.": "그의 유니폼을 입고 결승에서 이겼어요.",
		"Lo estrenas en tu próximo gol.": "다음 골에서 첫선을 보여요.",
		"SU ULTIMO CONSEJO": "그의 마지막 조언",
		"TE INVITO A CENAR": "저녁은 내가 쏠게",
		"LA CENA": "저녁 식사",
		"La felicidad está en cada día.": "행복은 매일매일에 있어요.",
		"Hace {0} años dijiste en una rueda de prensa que yo era tu ídolo.": "{0}년 전에 기자회견에서 내가 네 우상이라고 했지.",
		"Y lo sigues siendo.": "지금도 그래요.",
		"Cuando me retiré pensé que echaría de menos las finales.": "은퇴할 때는 결승전이 그리울 줄 알았어.",
		"Pero echo de menos los martes. El autobús, el café malo, las risas del vestuario.": "근데 화요일이 그리워. 구단 버스, 맛없는 커피, 라커룸의 웃음소리.",
		"Me he pasado la vida esperando el próximo gran día. Y la felicidad estaba en todos los demás.": "평생 다음 큰 경기만 기다리며 살았어. 그런데 행복은 그 나머지 날들에 있었지.",
		"¿Y ahora qué hago?": "그럼 이제 전 뭘 해야 하죠?",
		"Lo mismo que en el campo: un día cada vez. En el fútbol y en la vida, la felicidad está en cada día.": "그라운드에서처럼 하면 돼. 하루하루. 축구에서도 인생에서도, 행복은 매일매일에 있어.",
		"Por cada día.": "매일을 위하여.",
		"Yo todavía juego, y ya sé lo que voy a echar de menos.": "난 아직 뛰고 있지만, 뭐가 그리울지 벌써 알아.",
		"No serán las finales. Serán los martes: el autobús, el café malo, las risas del vestuario.": "결승전은 아닐 거야. 화요일이겠지: 구단 버스, 맛없는 커피, 라커룸의 웃음소리.",
		"TE ELIJO A TI": "너로 정했다",
		"Se gana poniéndole a una mascota el nombre del ratón eléctrico: te calas la gorra roja y lanzas la bola. Lo estrena tu siguiente gol; luego, uno de cada trece.": "반려동물에게 전기 쥐의 이름을 붙이면 얻어요: 빨간 모자를 눌러쓰고 볼을 던져요. 다음 골에서 첫선을 보이고, 그 뒤로는 13골에 한 번.",
		"El club lo guardaba para alguien como tú.": "클럽이 당신 같은 선수를 위해 아껴 두었어요.",
		"{0} te lo cede.": "{0} 선수가 물려줘요.",
		"¿LLEVAS SU {0}?": "그의 {0} 달래?",
		"LLEVARLO": "달기",
		"Cada domingo te compararán con él.": "매주 일요일 그와 비교당할 거예요.",
		"Tu número, tu historia.": "내 번호, 내 역사.",
		"Ya llevas el {0}.": "이제 {0} 달고 뛰어요.",
		"La grada compara tu {0} con el de {1}": "관중석, 당신의 {0} 보며 {1} 떠올려",
		"Llevas el {0} a su altura": "그 못지않게 {0} 달고 뛰어요",
		"su dorsal": "그의 등번호",
		"títulos aquí": "이곳에서의 우승",
		"LA ENTREVISTA AL REVES": "거꾸로 된 인터뷰",
		"¿Quién es tu ídolo?": "당신의 우상은 누구예요?",
		"{0}. Me firmó la playera cuando tenía {1} años. Todavía la tengo.": "{0}. 제가 {1}살 때 유니폼에 사인해 줬어요. 아직도 갖고 있어요.",
		"Y ahora me pasa el balón todos los fines de semana.": "그런데 이제는 주말마다 저한테 패스를 해줘요.",
		"Hoy lo tuve enfrente. Sigue siendo él.": "오늘 그를 상대로 뛰었어요. 여전히 최고예요.",
		"SU ÍDOLO ERES TÚ": "그의 우상은 당신",
		"TEMPORADAS DESDE QUE DIJISTE EL TUYO": "당신이 우상을 밝힌 지 몇 시즌",
		"Hace {0} temporadas dijiste {1}. Hoy el nombre que dicen es el tuyo.": "{0}시즌 전 당신은 {1} 선수를 꼽았어요. 오늘 모두가 부르는 이름은 당신이에요.",
		"CONTRA TU ÍDOLO": "우상과의 대결",
		"CONTRA TU IDOLO": "우상과의 대결",
		"LO ELEGISTE HACE {0} TEMPORADAS": "{0}시즌 전 선택한 우상",
		"ranking": "랭킹",
		"Alguien le enseñó aquella rueda de prensa. Te reconoce.": "누군가 그에게 그 기자회견을 보여줬어요. 그가 당신을 알아봐요.",
		"Hoy no eres su aficionado. Eres su rival.": "오늘은 그의 팬이 아니에요. 그의 상대예요.",
		"Noventa minutos sin pedirle un autógrafo.": "사인 요청은 90분 뒤로 미뤄요.",
		"LA CAMISETA DE TU ÍDOLO": "우상의 유니폼",
		"Esta no se cambia por nada.": "이건 무엇과도 바꿀 수 없어요.",
		"FICHA CONTIGO": "당신과 한 팀으로",
		"JUGARÁS CON ÉL": "그와 함께 뛰어요",
		"años después": "년 후",
		"Hace {0} años dijiste su nombre delante de todos.": "{0}년 전, 모두 앞에서 그의 이름을 말했죠.",
		"Hace un año dijiste su nombre delante de todos.": "1년 전, 모두 앞에서 그의 이름을 말했죠.",
		"Llegas nuevo, y el primero que viene a darte la bienvenida es él.": "새로 온 당신을 가장 먼저 반겨준 사람이 바로 그예요.",
		"El club lo ha fichado. Ahora entrenas cada día con el que veías por la tele.": "클럽이 그를 영입했어요. 이제 TV로 보던 그와 매일 함께 훈련해요.",
		"Lo pediste tú y el club lo trajo. Ahora te toca estar a su altura.": "당신이 원했고 클럽이 데려왔어요. 이제 그에 걸맞은 활약을 보여줘야 해요.",
		"ES TU ÍDOLO": "내 우상",
		"EN EL PALCO": "관중석에서",
		"TU ÍDOLO, EN EL PALCO": "관중석의 내 우상",
		"SE LEVANTÓ POR TI": "당신을 위해 일어섰어요",
		"el partido": "경기",
		"Dos en mi casa. Esta grada ya tiene otro nombre que cantar.": "우리 집에서 두 골. 이 관중석이 부를 새 이름이 생겼네.",
		"Un gol en el derbi, en esta casa. Eso no se olvida nunca.": "이 집에서, 더비에서 넣은 골. 그건 절대 잊히지 않아.",
		"Lo dijiste hace {0} temporadas. Hoy, en la que fue su casa, el palco entero miró cómo te aplaudía.": "{0}시즌 전에 했던 그 말. 오늘 그의 옛 홈에서, 귀빈석 전체가 그가 당신에게 박수 치는 모습을 지켜봤어요.",
		"SE MIDE CON SU ÍDOLO": "우상과의 맞대결",
		"EL DISCIPULO YA ES MEJOR": "제자가 스승을 넘다",
		"EL DISCÍPULO YA ES MEJOR": "제자가 스승을 넘다",
		"EDICIÓN ESPECIAL": "특별판",
		"EL ALUMNO SUPERA AL MAESTRO": "청출어람",
		"ÚLTIMA HORA: {0} SUPERA A {1} EN EL RANKING": "속보: {0}, 랭킹에서 {1} 추월",
		"TU RANKING": "내 랭킹",
		"SU RANKING": "그의 랭킹",
		"tu ranking": "내 랭킹",
		"su ranking": "그의 랭킹",
		"El día que lo nombraste te sacaba {0} puestos.": "그의 이름을 꼽던 날, 그는 당신보다 {0}계단 위에 있었어요.",
		"El día que lo nombraste lo mirabas desde muy abajo.": "그의 이름을 꼽던 날, 당신은 까마득히 아래에서 그를 올려다봤어요.",
		"Hace {0} temporadas dijo en una rueda de prensa que su ídolo era {1}. Hoy el ranking los pone al revés.": "{0}시즌 전 그는 기자회견에서 우상으로 {1} 선수를 꼽았어요. 오늘 랭킹은 두 사람을 뒤바꿔 놓았어요.",
		"Un número no es una carrera. {1} ya tiene la suya; a {2} todavía le falta escribirla.": "숫자가 커리어는 아니에요. {1} 선수는 이미 자신의 커리어를 썼고, {2} 선수는 아직 써 내려가야 해요.",
		"Hemos hablado con {1} esta mañana. Dice que alguien tenía que pasarle algún día, y que se alegra de que haya sido {2}.": "오늘 아침 {1} 선수와 이야기를 나눴어요. 언젠가는 누군가 자신을 넘어야 했는데, 그게 {2} 선수라서 기쁘대요.",
		"SU DESPEDIDA": "그의 작별",
		"Compartisteis vestuario. Hoy le aplaudes desde la grada.": "같은 라커룸을 썼죠. 오늘은 관중석에서 그에게 박수를 보내요.",
		"Te tocó enfrentarte a él. Hoy te tocó despedirlo.": "그와 맞서야 했죠. 오늘은 그를 떠나보내요.",
		"Él tampoco lo olvidó: tu nombre estaba en su lista de invitados.": "그도 잊지 않았어요: 초대 명단에 당신 이름이 있었어요.",
		"En el borde del área": "페널티 박스 바로 앞",
		"Abierto al segundo palo": "먼 쪽 골대로 넓게",
		"VUELTA DE HONOR": "세리머니 런",
		"LA VUELTA DE HONOR": "세리머니 런",
		"LA ÚLTIMA DE {0}": "{0}의 마지막 바퀴",
		"{0} cuelga las botas este verano. La última vuelta fue suya.": "{0} 선수, 이번 여름 축구화를 벗어요. 마지막 바퀴는 그의 몫이었어요.",
		"Más Premios al Mejor en una carrera": "커리어 최다 올해의 선수 수상",
		"Tus amigos te esperan para una noche de videojuegos. El técnico ofrece una sesión extra de vídeo y tiros a puerta. No llegas a las dos.": "친구들이 게임 하는 밤에 당신을 기다려요. 감독은 영상 분석과 슈팅 추가 훈련을 제안해요. 둘 다는 못 가요.",
		"CONSOLA CON AMIGOS": "친구들과 게임",
		"Caños": "알까기",
		"Año redondo del club: el técnico cuenta más contigo": "클럽 최고의 한 해: 감독이 당신을 더 신뢰해요",
		"Año para olvidar: el club escucharía ofertas por ti": "잊고 싶은 한 해: 클럽이 당신에 대한 제안을 들어볼 거예요",
		"DIRECTIVA": "이사회",
		"El {0} se ilusiona: la directiva pide acabar {1}": "{0} 클럽 기대감 상승: 이사회 목표는 {1}",
		"El {0} rebaja la meta: ahora le basta acabar {1}": "{0} 클럽 목표 하향: 이제 {1}도 충분",
		"El {0} cae en {1} antes de lo que pedía la directiva": "{0} 클럽, 이사회 목표보다 이른 {1}에서 탈락",
		"Cuadrar las cuentas": "장부 맞추기",
		"Salir del rojo del fair play": "재정 페어플레이 적자 탈출",
		"CAJA SANA": "재정 양호",
		"CUENTAS": "재정",
		"¡Que alguien le pite!": "누가 휘슬 좀 불어요!",
		"Un recogepelotas de casa te tira el balón detrás de la valla para hacer tiempo.": "홈 볼보이가 시간을 끌려고 공을 광고판 뒤로 차 버려요.",
		"Balón largo": "롱볼",
		"Te cuelgan un balón largo: pica cuando el aro se cierre para bajarlo. Si te rebota, pierdes la jugada.": "롱볼이 날아와요: 원이 좁혀질 때 탭해서 받아 내세요. 몸에 맞고 튀면 공격권을 잃어요.",
		"ESA NOCHE": "그날 밤",
		"EN CASA DE UN COLEGA": "친구 집에서",
		"¡LO PUSE DE CAPITÁN!": "주장으로 뽑았는데!",
		"¡Y YO LO TENÍA EN EL BANQUILLO!": "벤치에 앉혔는데!",
		"EL CAPITÁN DEL FANTASY": "판타지 주장",
		"FANTASY": "판타지",
		"LOS DEL SOFÁ": "소파 군단",
		"{0} goles tuyos y un colega que no se calla: te tenía de capitán.": "당신의 {0}골, 그리고 입을 다물지 않는 친구: 당신을 주장으로 뽑았대요.",
		"MÁXIMO": "최고",
		"TU CAPITÁN SUMA {0} PTS": "내 주장 {0}점 획득",
		"FIRMADA": "사인",
		"CON BARRO": "진흙투성이",
		"SU ÚLTIMA TEMPORADA": "그의 마지막 시즌",
		"PROMESA CUMPLIDA": "약속 지킴",
		"El mejor de su equipo te buscó a ti.": "상대 팀 에이스가 당신을 찾아왔어요.",
		"Te la firmó antes de dártela.": "건네기 전에 사인을 해줬어요.",
		"Con el barro de esta tarde todavía encima.": "오늘 오후의 진흙이 아직 묻어 있어요.",
		"Se retira este verano. Es de las últimas que vestirá.": "이번 여름 은퇴해요. 그가 입을 마지막 유니폼 중 하나예요.",
		"TÚ: {0} DE MEDIA": "나: 평균 {0}",
		"PRIMAS": "보너스",
		"TU CONTRATO PAGA": "내 계약 지급액",
		"ESTA TEMPORADA": "이번 시즌",
		"FICHA": "주급",
		"CADA PARTIDO": "매 경기",
		"COBRADO": "수령",
		"FIRMA": "계약금",
		"PACTADA": "합의",
		"BASE": "기본",
		"MEJOR DEL CLUB": "클럽 최고",
		"Primas por goles": "골 보너스",
		"Lo que llevas cobrado en primas esta temporada.": "이번 시즌 받은 보너스 총액이에요.",
		"Se cobra al cierre de la temporada si cumples el objetivo.": "목표를 달성하면 시즌 종료 때 지급돼요.",
		"Se cobra al cierre de la temporada si el club cumple lo que pide.": "클럽이 목표를 달성하면 시즌 종료 때 지급돼요.",
		"Se cobra al cierre de la temporada si el club gana el título.": "클럽이 우승하면 시즌 종료 때 지급돼요.",
		"Se cobra en cuanto ganas el premio.": "상을 받는 즉시 지급돼요.",
		"Se cobra en el partido, por cada gol que marques.": "경기 중 골을 넣을 때마다 지급돼요.",
		"Se cobra en el partido, por cada asistencia que des.": "경기 중 도움을 올릴 때마다 지급돼요.",
		"TU BOMBO": "내 선택",
		"SU MOMENTO": "그 순간에만",
		"DE VISITA": "원정",
		"EN TU BOMBO": "선택됨",
		"AL BOMBO": "선택",
		"Elige con la estrella cuáles salen al marcar. Lo nuevo sigue saliendo.": "별을 눌러 골을 넣을 때 나올 세리머니를 고르세요. 새 세리머니도 계속 나옵니다.",
		"{0}, jugador del partido. Hoy no hay más preguntas.": "{0}, 오늘 경기 최고의 선수. 더 이상 질문은 없다.",
		"Qué partido, {0}. Hoy la cena la pagas tú.": "엄청난 경기였어, {0}. 오늘 저녁은 네가 쏴.",
		"¡Hoy {0} lo ha bordado! Que no se vaya nunca.": "오늘 {0} 완벽했다! 절대 떠나지 마.",
		"{0} se ve en lo más alto. Su frase ya es la portada de la semana.": "{0}, 자신이 정상에 있다고 본다. 그 한마디가 벌써 이번 주 1면이다.",
		"Mucho hablar, {0}. En el campo nos vemos.": "말이 많네, {0}. 경기장에서 보자.",
		"{0} contesta a la crítica. Ahora le toca demostrarlo en el campo.": "{0}, 비판에 반박하다. 이제 경기장에서 증명할 차례.",
		"¡Así se contesta, {0}! Ahora, a callar bocas.": "이게 바로 대답이지, {0}! 이제 입을 다물게 해 줘.",
		"Lo dijo y lo cumplió. {0} es de los nuestros.": "말한 대로 해냈다. {0}, 역시 우리 사람이다.",
		"Palabra de {0}. Así da gusto.": "{0}, 약속을 지켰다. 이래야 맛이지.",
		"¿Y la bravata, {0}? Seguimos esperando.": "그 큰소리는 어디 갔어, {0}? 아직 기다리는 중이다.",
		"La frase de {0} le salió cara.": "{0}의 한마디, 비싼 대가를 치렀다.",
		"Me firmó la camiseta {0}. Un crack también fuera del campo.": "{0}, 내 유니폼에 사인해 줬다. 경기장 밖에서도 스타.",
		"Soy del otro equipo, pero {0} me firmó la camiseta. Respeto.": "난 상대 팀 팬이지만 {0}, 내 유니폼에 사인해 줬다. 존경한다.",
		"Una hora esperando y {0} pasó de largo.": "한 시간을 기다렸는데 {0}, 그냥 지나쳐 갔다.",
		"¡Me ha caído la camiseta de {0}! No me la quito en un año.": "{0}의 유니폼을 받았다! 1년은 안 벗는다.",
		"El balonazo de {0} al móvil lleva todo el día dando vueltas.": "{0}의 공이 휴대폰을 맞힌 영상, 하루 종일 돌고 있다.",
		"Lo de {0} ya es viral. Así se mueven unas redes.": "{0}의 영상, 벌써 화제다. SNS는 이렇게 움직인다.",
		"Ese festejo de {0} no se olvida. Te esperamos en la vuelta.": "{0}의 그 세리머니, 잊지 않겠다. 리턴 매치에서 보자.",
		"Polémica por el festejo de {0}: el comité ya lo mira.": "{0}의 세리머니 논란, 위원회가 이미 들여다보고 있다.",
		"Roja para {0}, y su equipo con uno menos.": "{0} 퇴장, 팀은 한 명이 모자란 채로 싸운다.",
		"A la ducha temprano, {0}.": "일찍 샤워하러 가네, {0}.",
		"Ánimo, {0}. El vestuario te espera.": "힘내, {0}. 라커룸이 기다리고 있어.",
		"Recupérate pronto, {0}. Te necesitamos.": "빨리 회복해, {0}. 네가 필요해.",
		"Bienvenido a {1}, {0}. Aquí se suda la camiseta.": "{1}에 온 걸 환영해, {0}. 여기선 유니폼을 위해 땀 흘린다.",
		"Es oficial: {0} ya es jugador de {1}.": "공식 발표: {0}, 이제 {1} 선수다.",
		"Partido para olvidar de {0}. ¿Dónde estuvo?": "{0}에게는 잊고 싶은 경기. 어디 있었나?",
		"{0} calla bocas: después del zasca, partidazo.": "{0}, 입을 다물게 했다: 사이다 답글 후 대활약.",
		"¡Zasca y partidazo! {0} tenía razón.": "사이다에 대활약까지! {0}, 네가 옳았다.",
		"Tanto zasca para esto: {0}, otra vez gris.": "그렇게 큰소리치더니 이거냐: {0}, 또 존재감 없음.",
		"Mucho móvil y poco fútbol, {0}.": "폰은 많이, 축구는 조금, {0}.",
		"Esto es cosa de todos. Orgulloso de este vestuario.": "모두가 함께 만든 결과. 이 라커룸이 자랑스럽다.",
		"Trabajo, trabajo y más trabajo. Y esto sólo acaba de empezar.": "노력, 노력, 또 노력. 이건 시작일 뿐이다.",
		"Esto es para vosotros. Sin vuestra voz no somos nada.": "이건 여러분을 위한 것. 여러분의 목소리 없이는 우린 아무것도 아니다.",
		"¡Grande, {0}! Juntos hasta el final.": "최고야, {0}! 끝까지 함께.",
		"Así se habla. Equipo.": "바로 그거지. 팀.",
		"{0} reparte el mérito. Gesto de capitán.": "{0}, 공을 나누다. 주장다운 모습.",
		"¡Ese es mi jugador!": "그게 바로 내 선수다!",
		"Menos postureo, {0}.": "허세 좀 줄여, {0}.",
		"El fútbol es de once, {0}.": "축구는 열한 명이 하는 거야, {0}.",
		"¡Te queremos, {0}!": "사랑해, {0}!",
		"La grada es nuestro jugador número doce.": "관중석은 우리의 열두 번째 선수다.",
		"{0} se gana a la grada otra vez.": "{0}, 또 한 번 관중석을 사로잡다.",
		"Foto lista para publicar tras el partido. Lo que subas lo verá todo el mundo, y cada mensaje tiene su público.": "경기 후 올릴 사진이 준비됐다. 네가 올리는 건 모두가 보고, 메시지마다 보는 사람이 다르다.",
		"FOTO CON EL VESTUARIO": "팀원들과 사진",
		"TU MOMENTO": "나의 순간",
		"PARA LA GRADA": "팬들을 위해",
		"TE CRITICAN EN REDES": "SNS에서 비판받다",
		"Partido gris y el hashtag ya corre. Te etiquetan en cada crítica y el móvil no para de vibrar. ¿Contestas?": "밋밋한 경기, 해시태그가 벌써 퍼지고 있다. 비판마다 네가 태그되고 휴대폰은 쉴 새 없이 울린다. 답할 건가?",
		"IGNORAR": "무시",
		"CON CLASE": "품위 있게",
		"ZASCA": "사이다",
		"TU ZASCA CORRE POR LAS REDES": "너의 사이다 답글이 퍼지고 있다",
		"Verdugo de Suecia": "스웨덴의 재앙",
		"Verdugo de Rumanía": "루마니아의 재앙",
		"Vencer a todos los clubes de Suecia (las tres divisiones).": "스웨덴의 모든 클럽 꺾기 (1~3부 전부).",
		"Vencer a todos los clubes de Rumanía (las tres divisiones).": "루마니아의 모든 클럽 꺾기 (1~3부 전부).",
		"LLEGADAS": "도착",
		"ACABA DE ATERRIZAR": "방금 도착",
		"LA LLEGADA": "도착",
		"te esperaban en el aeropuerto": "공항에서 기다렸어요",
		"periodistas": "기자",
		"LA LLEGADA AL AEROPUERTO": "공항 도착",
		"Media ciudad vino a verte bajar del avión.": "도시의 절반이 비행기에서 내리는 모습을 보러 왔어요.",
		"En Primera, hasta el aeropuerto tiene micrófonos.": "1부 리그에서는 공항에도 마이크가 있어요.",
		"En Segunda no se ve esto todos los días.": "2부 리그에서는 흔한 광경이 아니에요.",
		"Pocos, pero ya se saben tu nombre.": "많진 않지만 벌써 이름을 알아요.",
		"¿CÓMO LO CELEBRAS?": "어떤 세리머니?",
		"SI NO TOCAS, A TU MANERA": "안 누르면 내 방식대로",
		"PROVOCAR": "도발",
		"PERDÓN": "사과",
		"A LOS TUYOS": "내 팬들에게",
		"MULTA": "벌금",
		"CONTRA TU EX": "친정팀 상대",
		"ROCE CON EL TÉCNICO": "감독과 갈등",
		"ROCE CON EL VESTUARIO": "라커룸 갈등",
		"RECIÉN SALIDO": "교체 투입",
		"{0} corrió a abrazar a su técnico. Paz en el banquillo.": "{0} 선수가 감독에게 달려가 안겼다. 벤치에 평화가.",
		"Ese abrazo de {0} con el míster dice mucho.": "{0} 선수와 감독의 포옹, 많은 걸 말해준다.",
		"Gol de {0} y todos con él. Este vestuario está unido.": "{0} 선수의 골, 모두가 함께했다. 이 라커룸은 하나다.",
		"¡{0} vino a celebrarlo con nosotros!": "{0} 선수가 우리와 함께 세리머니했다!",
		"{0} no lo celebró contra nosotros. Respeto.": "{0} 선수는 우리를 상대로 세리머니하지 않았다. 존중.",
		"{0} marca a su ex y no lo celebra.": "{0} 선수, 친정팀에 골 넣고도 세리머니 자제.",
		"NADA QUE ARREGLAR": "되돌릴 게 없음",
		"Me equivoqué. Pido perdón al club, al míster y a mis compañeros.": "제가 잘못했습니다. 구단과 감독님, 동료들에게 사과드립니다.",
		"{0} pide perdón en un comunicado. El club da el asunto por cerrado.": "{0}, 공식 사과문 발표. 구단은 사안을 일단락했다.",
		"Errores los tenemos todos. A seguir, {0}.": "실수는 누구나 해. 계속 가자, {0}.",
		"Disculpas aceptadas. Ahora, a darlo todo.": "사과 받아들인다. 이제 전부 쏟아내.",
		"Mucho perdón ahora, {0}…": "이제 와서 사과 많네, {0}…",
		"Dije lo que pienso y no me escondo.": "생각한 대로 말했고 숨지 않겠습니다.",
		"{0} no rectifica: ni una palabra de disculpa.": "{0}, 물러서지 않는다: 사과 한마디 없어.",
		"¡Sin miedo, {0}! Con dos.": "겁먹지 마, {0}! 배짱 있네.",
		"Así no ayudas al equipo, {0}.": "그래선 팀에 도움 안 돼, {0}.",
		"{0} se planta. El míster toma nota.": "{0}, 입장 고수. 감독이 지켜보고 있다.",
		"Ni comunicado ni disculpa: {0} guarda silencio.": "입장도 사과도 없다: {0}, 침묵.",
		"¿Y el comunicado, {0}? Seguimos esperando.": "입장문은, {0}? 아직 기다리는 중.",
		"¿QUÉ TE CONVENCIÓ DE VENIR?": "왜 이 팀을 택했나요?",
		"{0} periodistas y una pregunta. Lo que contestes lo va a oír todo el club.": "기자 {0}명과 질문 하나. 당신의 대답을 클럽 전체가 듣게 됩니다.",
		"EL TÉCNICO": "감독",
		"EL EQUIPO": "팀",
		"LA AFICIÓN": "팬",
		"LA PROXIMA: MULTA ×2 · ROJA {0}": "다음엔: 벌금 ×2 · 퇴장 {0}",
		"LA PROXIMA: TECNICO {0}": "다음엔: 감독 {0}",
		"VIGILADO: MULTA ×2": "감시 중: 벌금 ×2",
		"VIGILADO: TECNICO {0}": "감시 중: 감독 {0}",
		"{0} no cierra la puerta a {1}. ¿Se va?": "{0} 선수, {1} 이적 가능성 열어둬. 떠나나?",
		"¿{0} coqueteando con {1}? Así no.": "{0} 선수가 {1} 팀과 썸을? 이건 아니지.",
		"{0} se queda. ¡Eso es compromiso!": "{0} 선수는 남는다. 이게 의리지!",
		"{0} corta el rumor de {1}.": "{0} 선수, {1} 이적설 일축.",
		"Gracias a {0} por el pase de hoy.": "오늘 패스 고마워요, {0}.",
		"Se sabe que te seguimos. Lo que digas lo oyen tu grada y nuestro despacho.": "우리가 지켜보는 건 다들 알아요. 하는 말은 팬들도 우리 구단도 다 들어요.",
		"Respetamos tu palabra, {0}. La puerta sigue abierta.": "약속은 존중해요, {0}. 문은 열려 있어요.",
		"¡Vaya pase me diste, crack! Ese gol es medio tuyo.": "패스 최고였어요! 그 골은 반은 당신 몫이에요.",
		"Gracias por la camiseta del túnel, {0}. Desde entonces no me pierdo un gol tuyo.": "터널에서 준 유니폼 고마워요, {0}. 그 뒤로 골은 하나도 안 놓쳐요.",
		"¡Tu camiseta ya está colgada en mi cuarto, {0}!": "유니폼 벌써 제 방에 걸어놨어요, {0}!",
		"Me alegró verte, {0}. Sigue así.": "만나서 반가웠어요, {0}. 계속 이렇게 해요.",
		"En el fútbol nunca se sabe.": "축구는 모르는 거예요.",
		"Mi sitio está aquí.": "제 자리는 여기예요.",
		"El próximo te lo pongo yo.": "다음엔 제가 패스할게요.",
		"¡Gracias por estar siempre!": "늘 함께해줘서 고마워요!",
		"Verdugo de Bosnia y Herzegovina": "보스니아 헤르체고비나의 재앙",
		"Vencer a todos los clubes de Bosnia y Herzegovina (las tres divisiones).": "보스니아 헤르체고비나의 모든 클럽 꺾기 (1~3부 전부).",
		"Las copas europeas estrenan rondas previas este verano": "유럽 대회, 이번 여름 예비 라운드 도입",
		"El {0} jugará la ronda {1} de la {2} contra el {3}": "{0} 클럽, {2} {1} 라운드에서 {3} 클럽과 맞대결",
		"El {0} elimina al {1} y entra en la fase de liga de la {2}": "{0} 클럽, {1} 클럽 꺾고 {2} 리그 페이즈 진출",
		"El {0} elimina al {1} y pasa a la ronda {2} de la {3}": "{0} 클럽, {1} 클럽 꺾고 {3} {2} 라운드 진출",
		"El {0} cae ante el {1} y se queda sin Europa": "{0} 클럽, {1} 클럽에 패해 유럽 무대 좌절",
		"El {0} cae ante el {1} y baja a la fase de liga de la {2}": "{0} 클럽, {1} 클럽에 패해 {2} 리그 페이즈로 강등",
		"El {0} cae ante el {1} y baja a la ronda {2} de la {3}": "{0} 클럽, {1} 클럽에 패해 {3} {2} 라운드로 강등",
		"{0} gana una plaza extra en la {1} por su temporada europea": "{0}, 유럽 시즌 성과로 {1} 추가 출전권 획득",
		"Mil Goles": "천 골",
		"1.000 goles en tu carrera.": "커리어 1,000골.",
		"Hat-Trick en la Final": "결승전 해트트릭",
		"3 goles en una final.": "한 결승전에서 3골.",
		"Goleador de la Patria": "조국의 득점왕",
		"50 goles con tu selección.": "대표팀에서 50골.",
		"Bicampeón del Mundo": "세계 대회 2회 우승",
		"Ganar 2 Mundiales con tu selección.": "대표팀으로 세계 대회 2회 우승하기.",
		"Era Dorada": "황금기",
		"5 Balones de Oro.": "올해의 선수 5회 수상.",
		"Mr. Champions": "미스터 엘리트컵",
		"Ganar la Champions 5 veces en tu carrera.": "커리어에서 엘리트컵 5회 우승하기.",
		"Tricampeón de Europa": "유럽 3연패",
		"Ganar la Champions 3 temporadas seguidas.": "엘리트컵 3시즌 연속 우승하기.",
		"Mr. Libertadores": "미스터 글로리컵",
		"Ganar la Libertadores 5 veces en tu carrera.": "커리어에서 글로리컵 5회 우승하기.",
		"Mr. Copa del Norte": "미스터 북부컵",
		"Ganar la Concacaf Champions Cup 5 veces en tu carrera.": "커리어에서 북부컵 5회 우승하기.",
		"Killer de Europa": "유럽의 킬러",
		"Ser 3 veces el máximo goleador de la Champions.": "엘리트컵 득점왕 3회 달성하기.",
		"¡Llamen a Mantenimiento!": "관리팀 불러요!",
		"Romper de dos balonazos las dos cuerdas que tensan la red y que salga el staff a tenderlas.": "슈팅 두 번으로 그물을 당기는 줄 두 개를 끊어 스태프가 다시 매러 나오게 하기.",
		"La red no se sostiene sola: algo la tensa por detrás.": "그물은 혼자 버티지 않는다. 뒤에서 무언가가 당기고 있다.",
	},








	"plural": {


		"pluralTIRO": ["슈팅", "슈팅"],
		"pluralPASE": ["패스", "패스"],
		"FIRMA DE AUTÓGRAFOS": "사인회",
		"AUTÓGRAFOS FIRMADOS": "사인 완료",
		"FIRMA LA CAJA": "상자에 사인",
		"FIRMAS EN EL SÚPER": "슈퍼 사인회",
		"Diez cajas firmadas. Ésas no se las come nadie.": "사인한 시리얼 상자 열 개. 이건 아무도 안 먹어요.",
		"FIRMA EL CROMO": "카드에 사인",
		"FIRMAS EN EL BARRIO": "동네 사인회",
		"FIRMA EL PÓSTER": "포스터 사인",
		"FIRMA LA CLAQUETA": "슬레이트 사인",
		"FIRMAS BAJO LA VALLA": "광고판 아래 사인",
		"FIRMAS EN LA PLAZA": "광장 사인회",
		"FIRMAS EN EL PLATÓ": "촬영장 사인회",
		"Diez pósters firmados. Ésos acaban enmarcados.": "서명한 포스터 열 장. 이런 건 액자에 들어가요.",
		"Diez fotos firmadas. Ésas brillan más que las pantallas.": "서명한 사진 열 장. 저 화면들보다 더 빛나요.",
		"Diez claquetas firmadas. Esta vez sí lo grabó alguien.": "서명한 슬레이트 열 개. 이번에는 정말 누가 찍었어요.",
		"SELFIE": "셀카",
		"ENCUADRA Y DISPARA": "구도 잡고 찰칵",
		"FOTO": "찰칵",
		"ARRASTRA": "드래그",
		"MOVIDA": "흔들림",
		"SELFIES": "셀카",
		"A TUS REDES": "내 SNS로",
		"Diez cromos firmados. Ésos ya no se cambian.": "사인한 카드 열 장. 이건 이제 교환 안 해요.",
		"FIRMA EL CARTEL": "포스터에 사인",
		"FIRMAS EN LA PARADA": "정류장 사인회",
		"Diez carteles firmados. Ésos no los arranca nadie.": "사인한 포스터 열 장. 이건 아무도 안 떼요.",
		"FIRMA LA PORTADA": "표지에 사인",
		"FIRMAS EN LA TIENDA": "게임숍 사인회",
		"Diez portadas firmadas. Ésas no se revenden.": "사인한 패키지 열 개. 이건 되팔지 않아요.",
		"pluralASISTENCIA": ["도움", "도움"],
		"pluralA PUERTA": ["유효 슈팅", "유효 슈팅"],
		"pluralREGATE": ["드리블", "드리블"],
		"pluralPÉRDIDA": ["볼 손실", "볼 손실"],
		"pluralFALTA RECIBIDA": ["파울 유도", "파울 유도"],


		"pluralFIJADO": ["고정", "고정"],
		"pluralVETADO": ["금지", "금지"],

		"pluralJORNADA": ["라운드", "라운드"],
		"pluraljornada": ["라운드", "라운드"],
		"pluralPUNTO": ["승점", "승점"],
		"pluralsemana": ["주", "주"],
		"pluraldía": ["일", "일"],
		"pluralclub": ["클럽", "클럽"],
		"pluraloferta": ["제안", "제안"],
		"pluralpatrocinador": ["스폰서", "스폰서"],
		"pluralquiere": ["원해요", "원해요"],
		"pluraltemporada": ["시즌", "시즌"],
		"pluraljugador": ["선수", "선수"],
		"pluralrival": ["상대", "상대"],
		"pluralpar": ["쌍", "쌍"],
		"pluralcompañero": ["동료", "동료"],
		"pluralgol": ["골", "골"],
		"pluralasistencia": ["도움", "도움"],
		"pluralAÑO": ["년", "년"],
		"pluralSEMANA": ["주", "주"],
		"pluralDÍA": ["일", "일"],
		"pluralpartido": ["경기", "경기"],
		"pluralPARTIDO": ["경기", "경기"],

		"pluralGOL": ["골", "골"],
		"pluralTEMPORADA": ["시즌", "시즌"],
		"pluralPARADA": ["선방", "선방"],
		"pluralfichaje": ["이적", "이적"],
		"pluralescudo": ["엠블럼", "엠블럼"],
		"pluralcompeticion": ["대회", "대회"],
		"pluralestadio": ["경기장", "경기장"],
		"pluralderbi": ["더비", "더비"],
		"pluraltécnico": ["감독", "감독"],
		"pluraltécnico sin equipo": ["무직 감독", "무직 감독"],
		"pluralseleccionador": ["대표팀 감독", "대표팀 감독"],
		"pluralcara de leyenda": ["레전드 얼굴", "레전드 얼굴"],
	},










	"guias": {
		"Tu equipo: quién sale hoy, quién descansa y quién te compite el puesto.": "내 팀: 오늘 누가 선발로 나서고, 누가 쉬고, 누가 내 자리를 노리는지.",
		"PARA QUÉ SIRVEN": "무엇에 쓰나",
		"Ninguna barra es adorno. El técnico y el vestuario deciden si juegas; la afición y la prensa, cuánto vales y qué marcas te buscan; el agente, cuántas ofertas ves.": "장식용 막대는 하나도 없어요. 감독과 라커룸은 출전 여부를, 팬과 언론은 몸값과 어떤 브랜드가 찾아올지를, 에이전트는 제안을 몇 개 볼지를 결정해요.",
		"EL VESTUARIO TE DA EL BALÓN": "라커룸이 공을 준다",
		"No es simpatía: con el vestuario hundido te llegan MENOS ocasiones por partido, y con él alto, una o dos más.": "인기 문제가 아니에요: 라커룸 분위기가 바닥이면 경기당 찬스가 줄고, 높으면 한두 번 더 와요.",
		"LA GRADA JUEGA": "관중도 뛴다",
		"Con la afición por los suelos, el estadio te arruina jugadas. Con la afición contigo, apuntas más fino.": "팬심이 바닥이면 경기장이 당신의 플레이를 망쳐요. 팬들이 당신 편이면 조준이 더 정확해져요.",
		"SUBEN Y BAJAN": "오르내린다",
		"Quien te reclama esta semana mueve su barra según lo que contestes. Y todas tiran hacia el medio cada temporada: lo alto cae rápido, lo bajo sube despacio.": "이번 주 당신을 부른 쪽은 당신의 대답에 따라 막대가 움직여요. 그리고 매 시즌 모두 중간으로 돌아가요: 높은 건 빨리 떨어지고, 낮은 건 천천히 올라요.",
		"Quién te quiere, cuánto pagan y qué te ofrece cada club. Sólo se mueve en sus dos ventanas: verano e invierno.": "누가 당신을 원하는지, 얼마를 주는지, 클럽마다 무엇을 제안하는지. 여름과 겨울, 두 번의 이적 시장에만 움직여요.",
		"QUIÉN PUEDE FICHARTE": "누가 영입할 수 있나",
		"Hay dos vetos: un grande no ficha a quien no le da el nivel, y un modesto no puede pagarte. Por eso no te llama todo el mundo.": "막히는 경우는 두 가지예요: 빅클럽은 수준이 안 되는 선수를 영입하지 않고, 작은 클럽은 당신 몸값을 감당 못 해요. 그래서 모두가 연락하진 않아요.",
		"LO QUE VALES": "내 몸값",
		"Cuatro cosas: lo que sabes hacer, tu puesto, lo que llevas hecho esta temporada y lo que la gente sabe de ti. Y la edad manda: de joven multiplica, y desde los 28 pierdes casi un cuarto cada año.": "네 가지예요: 능력, 포지션, 이번 시즌 활약, 그리고 지명도. 그리고 나이가 결정적이에요: 어릴 땐 몸값이 몇 배로 뛰고, 28세부터는 매년 거의 4분의 1씩 떨어져요.",
		"TU AGENTE ABRE PUERTAS": "에이전트가 문을 연다",
		"Su nivel decide CUÁNTAS ofertas ves, y ayuda a arrancarle más sueldo al club. Por eso cobra.": "에이전트 등급이 제안을 몇 개 볼지 결정하고, 클럽에게서 주급을 더 끌어내는 데 도움을 줘요. 그래서 수수료를 받는 거죠.",
		"Puedes pedir salir o irte cedido. Al club no le gusta que se lo pidan.": "이적이나 임대를 요청할 수 있어요. 클럽은 그런 요청을 좋아하지 않아요.",
		"EL ÁRBITRO PITA": "심판의 휘슬",
		"TU PLANTEL": "내 스쿼드",
		"El once de hoy sobre la cancha y, debajo, quién descansa. Es una foto: el once lo pone el técnico, no tú.": "오늘의 선발 11명이 경기장 위에, 그 아래에는 휴식 중인 선수들. 지금 이 순간의 모습일 뿐: 선발은 감독이 정해요, 당신이 아니라.",
		"LA ENERGÍA MANDA": "에너지가 좌우한다",
		"Tus compañeros se cansan y el técnico los rota: la cancha, la banca y los que no viajan son los del PRÓXIMO partido, no una lista fija. FRESCO, EN FORMA y CARGADO dicen cómo llega cada uno.":
			"동료들도 지치고 감독은 로테이션을 돌려요: 경기장, 벤치, 원정에 안 가는 선수들은 고정 명단이 아니라 다음 경기 기준이에요. 쌩쌩, 폼 좋음, 피로 누적이 각자의 컨디션을 알려줘요.",
		"TU COMPETENCIA": "내 경쟁자",
		"Arriba, tú contra el que juega en tu puesto: la raya blanca es lo que el club pide para ese sitio. Debajo, de qué depende que salgas — tus cualidades, el técnico y tu racha.":
			"위쪽은 당신과 같은 포지션 선수의 비교: 흰 선은 클럽이 그 자리에 요구하는 수준이에요. 아래쪽은 출전을 좌우하는 요소 — 능력, 감독, 그리고 폼.",
		"TU HABILIDAD": "내 능력",
		"Tus diez cualidades. Las ocho de arriba deciden cómo te sale el balón; las dos de abajo son tu especialidad.": "당신의 능력 10가지. 위의 8개는 공이 발에서 어떻게 나가는지를 정하고, 아래 2개는 당신의 특기예요.",
		"LA ESPECIALIDAD": "특기",
		"Penales y balón parado NO suben tu media: te hacen el lanzador del equipo. Es una elección de estilo, no un atajo.": "페널티킥과 세트피스는 OVR을 올려주지 않아요: 팀의 전담 키커가 될 뿐이에요. 지름길이 아니라 스타일의 선택이에요.",
		"LOS PUNTOS": "포인트",
		"Al subir de nivel ganas puntos. Se gastan con el más de cada fila, y mientras no salgas de la pantalla puedes deshacer.": "레벨업하면 포인트를 얻어요. 각 줄의 + 버튼으로 쓰고, 화면을 나가기 전까진 되돌릴 수 있어요.",
		"LOS DESPACHOS": "프런트 오피스",
		"Aquí se trata con el club fuera de la cancha: cuánto te escuchan y a quién te traen.": "그라운드 밖에서 클럽과 협상하는 곳이에요: 내 말을 얼마나 들어주는지, 누구를 데려와 주는지.",
		"CUÁNTO TE ESCUCHAN": "발언권",
		"Seis niveles, y cada uno te deja pedir más. Los sube tu relación (técnico, vestuario, años, afición y títulos aquí) y se revisan en invierno y en verano. Toca uno: verás qué pide y qué da.": "여섯 단계가 있고, 단계마다 더 많은 걸 요구할 수 있어요. 관계(감독, 라커룸, 근속 연수, 팬, 이곳에서의 우승)로 올라가고, 겨울과 여름에 재평가돼요. 하나를 탭하면 요구 조건과 혜택이 보여요.",
		"LA MESA DE FICHAJES": "영입 데스크",
		"Con la ventana abierta marcas a quién vendes y a quién fichas, y el presupuesto se rehace con cada toque. Nada se mueve hasta que confirmas.": "이적 시장이 열리면 누구를 팔고 누구를 영입할지 표시하고, 탭할 때마다 예산이 다시 계산돼요. 확인하기 전까진 아무것도 바뀌지 않아요.",
		"LO QUE SE MUEVE": "영입과 방출",
		"Son fichajes de verdad del mercado, no adorno: el que entra viene de un club real y por un precio.": "장식이 아니라 실제 이적 시장의 영입이에요: 들어오는 선수는 실제 클럽에서 이적료를 받고 와요.",
		"EL MERCADO DE LOS DEMÁS": "다른 팀들의 이적 시장",
		"Quién ficha por quién en todo el mundo, con lo que pagaron.": "전 세계에서 누가 어디로 이적했는지, 이적료는 얼마였는지.",
		"ORDÉNALO": "정렬",
		"Las fichas de arriba ordenan por fecha, media o precio, y recortan a tu club, tu liga o el mundo.": "위쪽 칩으로 날짜, OVR, 가격순 정렬을 하고, 내 클럽, 내 리그, 전 세계로 범위를 좁혀요.",
		"EL MUNDO SIGUE": "세상은 돌아간다",
		"Lo que pasa en los partidos que no juegas. La liga vive aunque tú no estés.": "당신이 뛰지 않는 경기에서 일어나는 일들. 당신이 없어도 리그는 계속돼요.",
		"CAMBIA EL RECORTE": "범위 바꾸기",
		"La etiqueta subrayada no es un título: se toca y va rotando entre tu club, tu liga y el mundo entero.": "밑줄 친 라벨은 제목이 아니에요: 탭하면 내 클럽, 내 리그, 전 세계 순으로 바뀌어요.",
		"LO TUYO VA MARCADO": "내 소식은 표시돼요",
		"Las noticias que te tocan llevan el borde de color, y sólo salen las últimas: esto es una portada, no un archivo.": "당신과 관련된 뉴스는 색깔 테두리가 있고, 최신 뉴스만 나와요: 이건 1면이지, 보관함이 아니에요.",
		"TU CONTRATO": "내 계약",
		"El trato que tienes con el club: tu rol, tu sueldo y hasta cuándo.": "클럽과 맺은 계약: 내 역할, 주급, 그리고 계약 기간.",
		"LO QUE TE PIDEN": "클럽의 요구",
		"El club te marca una meta del año. De cómo la lleves depende lo que te ofrezcan al renovar.": "클럽이 올해 목표를 정해줘요. 목표 달성 정도에 따라 재계약 조건이 달라져요.",
		"Se pide en AGENTE, junto a las ofertas. Lo que puedes pedir sale de cómo vienes jugando, no de lo que te gustaría.": "에이전트 메뉴에서 제안 옆에서 요청해요. 요구할 수 있는 건 원하는 게 아니라 지금까지의 활약에서 나와요.",
		"Tu cara y tu pelo, lo que llevas en la cancha y la ropa de calle, en tres pestañas.": "얼굴과 머리, 경기장 복장과 사복을 탭 세 개로.",
		"SE GUARDA SOLO": "자동 저장",
		"Cada toque queda guardado. Y lo que compres en TIENDA aparece aquí para ponértelo.": "탭할 때마다 저장돼요. 상점에서 산 아이템도 여기에 나타나서 입을 수 있어요.",
		"LAS BOTAS": "축구화",
		"Dan un bono a tu golpeo, y SE GASTAN con el uso: al agotarse dejan de dártelo.": "킥에 보너스를 주고, 쓸수록 닳아요: 다 닳으면 보너스가 사라져요.",
		"PARA LA JORNADA": "경기 대비",
		"Lo que se consume: recuperarte, ponerte a punto y llegar mejor al siguiente partido.": "소모품: 회복하고, 컨디션을 끌어올리고, 다음 경기에 더 좋은 상태로 나가기 위한 것.",
		"Se lleva una comisión de lo que ingresas, y otra al firmar. Es el precio de que alguien te mueva.": "수입의 일부를 수수료로 떼고, 계약할 때도 또 떼요. 누군가 당신을 움직여 주는 대가예요.",
		"Donde vives entre partidos. Subir de casa mejora cómo llegas al siguiente.": "경기 사이에 지내는 곳. 더 좋은 집일수록 다음 경기에 더 좋은 상태로 나가요.",
		"LA SEMANA": "이번 주",
		"Lo que puedes hacer en casa esta semana, sin salir a ningún lado.": "이번 주 어디도 가지 않고 집에서 할 수 있는 것들.",
		"El siguiente peldaño, con lo que cuesta y lo que da. Ojo: el descanso tiene techo, no se acumula sin fin.": "다음 단계, 비용과 효과까지. 주의: 휴식에는 상한이 있어서 끝없이 쌓이지 않아요.",
		"Cada competición que juegas, por dentro: su tabla, su cuadro o su grupo, y quién lleva los goles.": "출전하는 모든 대회의 속사정: 순위표, 대진표나 조, 그리고 득점 선두.",
		"EL MUNDO ENTERO": "전 세계",
		"En la liga puedes viajar a otro país y a otra división: las tablas del planeta están aquí.": "리그 화면에서 다른 나라, 다른 디비전으로 넘어갈 수 있어요: 지구상의 모든 순위표가 여기 있어요.",
		"EL HISTORIAL": "역대 우승",
		"Quién ganó cada año. Tu nombre entra en esa lista si te lo ganas.": "해마다 누가 우승했는지. 자격을 갖추면 당신 이름도 그 명단에 올라요.",
		"EL MERCADO": "이적 시장",
		"SI NO JUEGAS": "경기에 못 뛰면",
		"TU TEMPORADA": "내 시즌",
		"Todos tus partidos en el orden en que se juegan, con lo ya jugado y su resultado.": "모든 경기를 치르는 순서대로, 끝난 경기는 결과와 함께.",
		"MIRA ADELANTE": "앞을 내다봐요",
		"Aquí se ve cuándo se te juntan liga, copa y selección: ésas son las semanas en que el cansancio pesa.": "리그, 컵, 대표팀 경기가 몰리는 때가 여기서 보여요: 그때가 피로가 쌓이는 주예요.",
		"EL RANKING": "랭킹",
		"Los jugadores del planeta ordenados por su media, con la tuya dentro para compararte.": "전 세계 선수들을 OVR 순으로, 당신도 그 안에 넣어 비교할 수 있어요.",
		"ACÓTALO": "좁혀 보기",
		"Se puede filtrar por puesto y por país: así se ve contra quién compites de verdad.": "포지션과 국가로 필터링할 수 있어요: 그래야 진짜 경쟁자가 보여요.",
		"Los números de todo lo que llevas hecho: temporada a temporada y torneo por torneo.": "지금까지 해 온 모든 것의 숫자: 시즌별, 대회별로.",
		"Cada club por el que pasaste y lo que costó cada movimiento.": "거쳐 간 모든 클럽과 이적마다의 이적료.",
		"La curva de lo que vales: el termómetro de si vas subiendo o cayendo.": "몸값 곡선: 오르는 중인지 떨어지는 중인지 알려주는 온도계.",
		"TU PUNTERÍA": "내 슈팅",
		"Desde dónde tiras y desde dónde te entra. Cada marca es un remate tuyo, no una media inventada, y la curva es el vuelo que tuvo ese balón.":
			"어디서 슈팅하고 어디서 골이 들어가는지. 표시 하나하나가 실제 당신의 슈팅이고 지어낸 평균이 아니에요. 곡선은 그 공이 날아간 궤적이에요.",
		"El gol más lejano, el mejor acierto… lo que hiciste, no lo que crees que haces.": "최장거리 골, 최고 정확도… 당신이 한다고 생각하는 게 아니라 실제로 한 것.",
		"AÑO POR AÑO": "연도별",
		"Con las flechas se mira cualquier temporada ya cerrada.": "화살표로 이미 끝난 시즌을 볼 수 있어요.",
		"TU VITRINA": "내 진열장",
		"Lo que ya ganaste. Se queda para siempre y se ve también dentro de tu casa.": "이미 따낸 것들. 영원히 남고, 집 안에서도 보여요.",
		"LO QUE FALTA": "남은 것",
		"Todo lo que existe por ganar, incluido lo que hoy te queda lejos.": "따낼 수 있는 모든 것, 지금은 까마득한 것까지.",
		"LA CASA POR DENTRO": "클럽의 속사정",
		"Lo que tu club ganó antes de que llegaras, y quiénes lo hicieron.": "당신이 오기 전에 클럽이 따낸 것들, 그리고 그 주인공들.",
		"LOS DE SIEMPRE": "역대 명단",
		"Los máximos goleadores de la casa. Ahí es donde hay que meterse.": "클럽 역대 최다 득점자. 여기에 이름을 올려야 해요.",
		"LAS LEYENDAS": "레전드",
		"Los grandes del juego, por liga y por club. Son la vara con la que se te mide.": "리그별, 클럽별 전설들. 당신을 재는 잣대예요.",
		"TU SITIO": "내 자리",
		"Con los años, tu nombre aparece en estas listas. Eso es el legado.": "세월이 흐르면 이 명단들에 당신 이름이 나타나요. 그게 레거시예요.",
		"EL JUGADOR DEL AÑO": "올해의 선수",
		"Quién lo ganó cada año y con qué números. Si no lo ganas tú, lo gana alguien.": "해마다 누가 어떤 기록으로 받았는지. 당신이 못 받으면 다른 누군가가 받아요.",
		"CÓMO SE GANA": "수상 조건",
		"Lo que pesa en la votación. Meter goles es una parte, no toda.": "투표에서 중요한 것. 골은 일부일 뿐, 전부가 아니에요.",
		"ESTE AÑO": "올해",
		"Cómo va la votación ahora mismo, contigo dentro si andas cerca.": "지금 투표 현황, 근처에 있다면 당신도 포함해서.",
		"EL PARTIDO": "경기",
		"Tu equipo, el rival y el minuto. Un partido no se juega de corrido: se juega por OCASIONES, y cada una es tuya.": "우리 팀, 상대, 그리고 시간. 경기는 처음부터 끝까지 이어서 하는 게 아니라 찬스 단위로 하고, 찬스 하나하나가 당신 거예요.",
		"A QUIÉN LLEVAS": "조작 중인 선수",
		"El jugador que controlas ahora. Un pase FUERA del área te pasa el mando al que lo recibe; dentro del área remata él de primera y no hay relevo.": "지금 조작하는 선수. 페널티 박스 밖에서 끝나는 패스는 받는 선수에게 조작이 넘어가고, 박스 안에서는 그가 바로 슈팅해서 교대가 없어요.",
		"TU NOTA": "내 평점",
		"Sube y baja con cada cosa que haces. Es la nota con la que el técnico te juzga, y la que decide tu temporada.": "하는 모든 플레이에 따라 오르내려요. 감독이 당신을 평가하는 점수이자, 시즌을 좌우하는 점수예요.",
		"EL VIENTO": "바람",
		"Hacia dónde sopla y cuánto. El balón se va con él: cuéntalo al apuntar o el centro se te pasa largo.": "어느 쪽으로 얼마나 부는지. 공은 바람을 타요: 조준할 때 감안하지 않으면 크로스가 길어져요.",
		"EL PARTIDO SE INCLINA": "경기 흐름이 기운다",
		"Cuando tu equipo se enciende, el rival marca menos entre tus jugadas. Cuando se enfría, aprieta él. Lo verás avisado.": "우리 팀이 불붙으면 당신의 찬스 사이에 상대 득점이 줄어요. 식으면 상대가 몰아붙여요. 알림으로 알려줘요.",
		"FUERA DE LUGAR": "오프사이드",
		"Cuando salió el pase, el que lo recibió estaba más cerca del arco que el balón y que el penúltimo rival (el portero cuenta): el abanderado levanta y la jugada se anula. A la altura, en juego.": "패스가 나간 순간, 받은 선수가 공과 뒤에서 두 번째 상대 선수(골키퍼 포함)보다 골문에 더 가까이 있었어요: 부심이 깃발을 들고 플레이는 취소돼요. 같은 선상이면 온사이드예요.",
		"El árbitro pita lo que ve. No siempre a tu favor: también te la pitan a ti.": "심판은 보이는 대로 불어요. 항상 당신 편은 아니에요: 당신에게 불리하게 불기도 해요.",
		"TARJETA": "카드",
		"Queda anotada. La amarilla es un aviso; una roja te deja fuera de los próximos partidos de ese torneo, y ahí no se juega ni se entrena: se espera.": "기록에 남아요. 경고는 주의일 뿐이지만, 퇴장은 그 대회의 다음 경기들에 못 나가게 하고, 그동안은 경기도 훈련도 없이 기다려야 해요.",
		"AHORA LLEVAS A OTRO": "조작 선수 변경",
		"Diste el pase y el mando saltó al que la recibió. Termina tú la jugada: si él vuelve a pasar, el mando se queda contigo.": "패스를 하자 조작이 받은 선수에게 넘어갔어요. 직접 플레이를 마무리하세요: 그가 다시 패스하면 조작은 당신에게 남아요.",
		"Desperdiciar ocasiones SEGUIDAS con la nota por los suelos te saca del partido. Si el técnico confía en ti te compra una más, pero no muchas.": "평점이 바닥인데 찬스를 연속으로 날리면 교체돼요. 감독이 신뢰하면 한 번 더 기회를 주지만, 많지는 않아요.",
		"CÓMO SE JUEGA": "플레이 방법",
		"TUS PASES": "패스 맵",
		"TUS REGATES": "드리블 맵",
		"Asistencia": "도움",
		"Acabó en remate": "슈팅으로 연결",
		"Sin remate": "슈팅 없음",
		"Por donde pisaste": "활동 범위",
		"Te la quitaron": "볼 뺏김",
		"Falta a favor": "파울 유도",
		" de {0}": " / {0}",
		"EL BAR DE SIEMPRE": "단골 술집",

		"GALA DEL CLUB": "클럽 시상식",
		"GALA DE LA LIGA": "리그 시상식",
		"La liga te elige su mejor jugador de la temporada.": "리그가 당신을 시즌 최우수 선수로 뽑았어요.",
		"El mejor de tu línea en toda la liga. El del año fue para {0}.": "리그 전체에서 당신 포지션 최고. 시즌 최우수 선수는 {0} 선수에게 돌아갔어요.",
		"La liga eligió a {0}. El año que viene, la gala también es tuya.": "리그는 {0} 선수를 뽑았어요. 내년엔 시상식의 주인공이 당신일 수도 있어요.",
		"SUSPENDIDA": "취소",
		"GALA SUSPENDIDA": "시상식 취소",
		"MEJOR DEFENSA": "최우수 수비수",
		"MEJOR PORTERO": "최우수 골키퍼",
		"MEJOR MEDIO": "최우수 미드필더",
		"MEJOR DELANTERO": "최우수 공격수",
		"MEJOR JUGADOR DE LA TEMPORADA": "시즌 최우수 선수",
		"TROFEOS SUSPENDIDOS": "시상 취소",
		"puesto": "순위",
		"objetivos": "목표",
		"Tu vestuario te eligió el mejor de la temporada.": "라커룸 동료들이 당신을 시즌 최우수 선수로 뽑았어요.",
		"El mejor de tu línea. El del año fue para {0}.": "당신 포지션 최고. 시즌 최우수 선수는 {0} 선수에게 돌아갔어요.",
		"El vestuario eligió a {0}. La próxima gala se empieza a ganar en agosto.": "라커룸은 {0} 선수를 뽑았어요. 다음 시상식은 8월부터 준비해야 해요.",
		"El club bajó de categoría. La directiva suspende los premios del año por el mal rendimiento del equipo.": "클럽이 강등됐어요. 이사회는 팀의 부진을 이유로 올해 시상을 취소해요.",
		"El club no cumplió ninguno de sus objetivos. La directiva suspende los premios del año por el mal rendimiento del equipo.": "클럽이 목표를 하나도 달성하지 못했어요. 이사회는 팀의 부진을 이유로 올해 시상을 취소해요.",
		"El club suspende sus premios del año por el mal rendimiento": "클럽, 부진 이유로 올해 시상 취소",
		"Mejor (Club)": "최우수 (클럽)",
		"Delantero (Club)": "공격수 (클럽)",
		"Medio (Club)": "미드필더 (클럽)",
		"Defensa (Club)": "수비수 (클럽)",
		"Mejor Jugador del Club": "클럽 올해의 선수",
		"Mejor Delantero del Club": "클럽 최우수 공격수",
		"Mejor Medio del Club": "클럽 최우수 미드필더",
		"Mejor Defensa del Club": "클럽 최우수 수비수",
		"LA GUARDARON": "간직하고 있었다",
		"tenías": "당시",
		"gol": "골",
		"Alguien la enmarcó y la colgó. Nadie te lo dijo nunca.": "누군가 액자에 넣어 걸어 뒀어요. 아무도 말해준 적 없었죠.",
		"Sigue ahí. Ya casi nadie se acuerda de aquella tarde, pero sigue ahí.": "아직 거기 있어요. 그날 오후를 기억하는 사람은 이제 거의 없지만, 아직 거기 있어요.",
		"TU CELULAR": "내 휴대폰",
		"Cada app es un recorte: tu club, tu liga, el mundo y tus redes, donde se contesta a quien te critica.": "앱마다 하나의 발췌예요: 내 클럽, 내 리그, 세상, 그리고 나를 비판하는 사람에게 답하는 내 SNS.",
	},












	"caja": {
		"CONSEGUIR DINERO": "돈 얻기",
		"CONSEGUIR PUNTOS": "포인트 얻기",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu Apple ID.":
			"이건 게임 머니가 아니라 실제 돈으로 결제돼요: Apple ID로 청구돼요.",
		"Lo que compres entra en esta carrera al instante.":
			"구매한 건 이 커리어에 즉시 들어와요.",
		"DINERO REAL": "실제 돈",
		"DINERO DEL JUEGO": "게임 머니",
		"LA CAJA": "충전",
		"PUNTOS DE HABILIDAD": "스킬 포인트",
		"Se reparten a mano en TU JUGADOR. Un punto cuesta 1 por debajo de 80, 2 de 80 a 89 y 3 de 90 en adelante: cuanto mejor eres, menos rinde el paquete.":
			"내 선수 메뉴에서 직접 배분해요. 1포인트 비용은 80 미만 1, 80~89는 2, 90 이상은 3: 잘할수록 패키지 효율이 떨어져요.",
		"+ {0} PUNTOS DE HABILIDAD": "+ {0} 스킬 포인트",
		"EXTRA": "추가",
		"COMPRA LISTA": "구매 완료",
		"Se sumaron ${0} a tu carrera.": "커리어에 ${0} 추가됐어요.",
		"Tienes {0} puntos nuevos para repartir en TU JUGADOR.":
			"내 선수 메뉴에서 배분할 새 포인트 {0}개가 있어요.",
		"Ya lo tienes todo al máximo, así que los puntos entraron como {0} de experiencia.":
			"모든 능력이 이미 최대치라서, 포인트가 경험치 {0}점으로 들어왔어요.",
		"Se registró tu compra. Si no ves lo que compraste, cierra y vuelve a abrir el juego.":
			"구매가 등록됐어요. 구매한 게 안 보이면 게임을 껐다가 다시 켜 주세요.",
		"PRIMA DE PARTIDO": "경기 수당",
		"Para lo que te falta hoy: unas botas, o el gel y la bebida antes del derbi.":
			"오늘 부족한 것에: 축구화 한 켤레, 또는 더비 전에 먹을 젤과 음료.",
		"BONO DE CONTRATO": "계약 보너스",
		"El deportivo, o unas botas de las buenas con repuesto para toda la temporada.":
			"스포츠카, 또는 시즌 내내 쓸 여분까지 딸린 좋은 축구화.",
		"Alcanza para el preparador físico, o para subir de escalón con tu agente.":
			"피지컬 코치를 고용하거나, 에이전트 등급을 한 단계 올릴 수 있는 금액.",
		"TRASPASO RÉCORD": "기록적인 이적",
		"La clínica y el analista de vídeo, de una sentada.":
			"클리닉과 영상 분석관을 한 번에.",
		"El agente que te sienta con los grandes de Europa, pagado de golpe.":
			"유럽 빅클럽과 협상 테이블을 잡아 주는 에이전트, 일시불로.",
		"SESIÓN EXTRA": "추가 훈련",
		"Cuatro niveles de golpe. Para rematar la habilidad que traes a medias.":
			"한 번에 4레벨. 반쯤 키운 능력을 마무리하세요.",
		"Sube una habilidad entera de 60 a 85, o reparte donde más duela.":
			"능력 하나를 60에서 85까지 통째로 올리거나, 가장 아쉬운 곳에 나눠 주세요.",
		"Una habilidad de 60 a 99, y todavía sobra para empezar la siguiente.":
			"능력 하나를 60에서 99까지, 그러고도 다음 능력을 시작할 만큼 남아요.",
		"TALENTO GENERACIONAL": "세대급 재능",
		"Trescientos puntos. Casi la mitad de todo lo que se puede subir en una carrera.":
			"300포인트. 커리어에서 올릴 수 있는 전체의 거의 절반.",







		"TODAS LAS VENTAJAS": "모든 특전",
		"Abre de golpe la vitrina entera de NUEVA CARRERA+, sin esperar a sus logros.":
			"새 커리어+ 진열장 전체를 업적 달성 없이 한 번에 열어요.",
		"PARA SIEMPRE": "영구",
		"{0} VENTAJAS": "특전 {0}개",


		"DOBLE PAGA": "급여 2배",
		"Sueldo, primas y patrocinios ×2 en todas tus carreras, las de hoy y las que vengan.":
			"주급, 보너스, 스폰서 수입 ×2, 지금의 커리어와 앞으로의 모든 커리어에서.",
		"Activa: cobras el doble en cada partido y en cada cierre.":
			"적용 중: 매 경기와 매 시즌 정산 때 두 배로 받아요.",
		"TODAS TUS CARRERAS": "모든 커리어",
		"PAGO ÚNICO": "1회 결제",
		"COBRA ×2": "수입 ×2",


		"DOBLE XP": "XP 2배",
		"La XP de cada partido ×2 en todas tus carreras, las de hoy y las que vengan.":
			"매 경기 XP ×2, 지금의 커리어와 앞으로의 모든 커리어에서.",
		"Activa: ganas el doble de XP en cada partido.":
			"적용 중: 매 경기 XP를 두 배로 얻어요.",
		"GANA XP ×2": "XP ×2 획득",


		"PACK LEYENDA": "레전드 팩",
		"DOBLE PAGA y DOBLE XP juntos, en todas tus carreras, las de hoy y las que vengan.":
			"급여 2배와 XP 2배를 함께, 지금의 커리어와 앞으로의 모든 커리어에서.",
		"Activa: cobras el doble y ganas el doble de XP en cada partido.":
			"적용 중: 매 경기 두 배로 받고 XP도 두 배로 얻어요.",
		"LOS DOS ×2": "둘 다 ×2",
		"PAGA": "급여",
		"XP": "XP",
		"AHORRO": "할인",
		"CUARTA RANURA": "네 번째 슬롯",
		"Una cuarta ranura en la portada, para llevar otra carrera a la vez.":
			"타이틀 화면에 네 번째 슬롯을 추가해, 커리어를 하나 더 동시에 진행해요.",
		"Activa: tu portada tiene cuatro ranuras.": "적용 중: 타이틀 화면에 슬롯이 4개 있어요.",
		"ABRE LA CUARTA": "4번 슬롯 열기",
		"RANURA": "슬롯",
		"A LA VEZ": "동시 진행",
		"HITOS": "이정표",
		"Tus {0} ventajas siguen entrando en cada carrera nueva.":
			"특전 {0}개가 새 커리어마다 계속 적용돼요.",
		"Se abren todas de golpe en NUEVA CARRERA+, y también las que se añadan después.":
			"새 커리어+에서 모두 한 번에 열리고, 나중에 추가되는 것도 포함돼요.",
		"No marca ningún logro: tu palmarés sigue siendo lo que jugaste.":
			"업적은 하나도 달성 처리되지 않아요: 내 기록은 실제로 플레이한 그대로예요.",
		"Se paga una vez y queda en tu Apple ID: vale para las 3 ranuras y para cada carrera nueva.":
			"한 번 결제하면 Apple ID에 남아요: 슬롯 3개와 모든 새 커리어에 적용돼요.",
		"Listo: ya están abiertas todas. Las eliges al empezar una carrera nueva, en TUS VENTAJAS.":
			"완료: 전부 열렸어요. 새 커리어를 시작할 때 내 특전에서 고르세요.",
		"COMPRAS": "구매",
		"¿Reinstalaste el juego o cambiaste de teléfono? Recupera aquí lo que ya pagaste con este Apple ID.":
			"게임을 재설치했거나 휴대폰을 바꿨나요? 이 Apple ID로 결제한 것을 여기서 복원하세요.",
		"RESTAURAR COMPRAS": "구매 복원",
		"RESTAURANDO": "복원 중",
		"Listo: ya recuperaste lo que habías comprado con este Apple ID.":
			"완료: 이 Apple ID로 구매한 것을 복원했어요.",
		"Este Apple ID no tiene compras que recuperar en Football Legacy.":
			"이 Apple ID에는 Football Legacy에서 복원할 구매 내역이 없어요.",

		"PACK DOBLE": "더블 팩",
		"Las dos monedas en una compra, y sale mejor que por separado.":
			"두 가지 재화를 한 번에, 따로 사는 것보다 저렴해요.",





		"POSTE": "골대",
		"TU {0}%": "나 {0}%",
		"RIVAL {0}%": "상대 {0}%",
		"subMANTEN": "유지",
		"subPEDIDO": "요청",
		"subAGUANTA": "버텨",
		"subFUERA": "아웃",
		"subLESIONADO": "부상",
		"Subirla cuesta 1 punto y tienes {0}.": "올리려면 1포인트가 필요하고 {0}포인트 있어요.",
		"Subirla cuesta {0} puntos y tienes {1}.": "올리려면 {0}포인트가 필요하고 {1}포인트 있어요.",
	},

	"casa_pack_2": {
		"COLCHÓN DE ESTIRAMIENTOS": "스트레칭 매트",
		"Rutina corta de movilidad: recupera energía y un punto de ánimo.": "짧은 유연성 루틴: 에너지와 사기 1포인트를 회복해요.",
		"Zona de movilidad para soltar piernas. Su rutina da energía y ánimo.": "다리를 풀어 주는 유연성 공간. 루틴으로 에너지와 사기를 얻어요.",
		"MÁQUINA DE RESPIRACIÓN": "호흡 기계",
		"Respiración guiada para centrarte. Da ánimo y confianza con el técnico.": "마음을 가다듬는 호흡 가이드. 사기와 감독의 신뢰가 올라가요.",
		"Cabina de respiración guiada para bajar pulsaciones antes de competir.": "경기 전 심박수를 낮춰 주는 호흡 가이드 부스.",
		"PANEL DE OBJETIVOS": "목표 보드",
		"Metas, notas y hábitos de temporada para vestir la pared.": "시즌 목표, 메모, 습관으로 벽을 꾸며요.",
		"Panel de objetivos y hábitos. Decora la pared y ordena tu semana.": "목표와 습관 보드. 벽을 꾸미고 한 주를 정리해 줘요.",
		"BAR SALUDABLE": "헬시 바",
		"Jugos, agua mineral y snacks medidos: recupera energía sin salir.": "주스, 생수, 적당량의 간식: 밖에 나가지 않고 에너지를 회복해요.",
		"Bar de jugos, agua mineral y snacks. Recupera un poco de energía.": "주스, 생수, 간식이 있는 바예요. 에너지를 조금 회복해요.",
		"LÁMPARA SOLAR": "태양광 램프",
		"Luz cálida de ambiente para que los rincones se sientan habitados.": "구석구석 사람 사는 느낌을 주는 따뜻한 무드등이에요.",
		"Luz cálida de ambiente. No da bonus, pero levanta mucho el rincón.": "따뜻한 무드등. 보너스는 없지만 구석 분위기가 확 살아요.",
		"ESTIRAR EN CASA": "집에서 스트레칭",
		"Hasta +4 de energía y +1 de ánimo. Una acción semanal.": "에너지 최대 +4, 사기 +1. 주 1회 행동이에요.",
		"RESPIRAR Y ENFOCAR": "호흡하고 집중",
		"+1 de ánimo y +1 con el técnico si aún hay margen. Una acción semanal.": "사기 +1, 여유가 있으면 감독과의 관계 +1. 주 1회 행동이에요.",
		"HIDRATARSE BIEN": "충분한 수분 섭취",
		"Hasta +4 de energía. Una acción semanal.": "에너지 최대 +4. 주 1회 행동이에요.",
	},




















	"aspecto": {

		"Corte César": "시저 컷",
		"Coleta": "포니테일",
		"Coleta alta": "하이 포니",
		"Calvicie en coronilla": "정수리 탈모",
		"Dos trenzas": "양갈래 땋기",
		"Flat top": "플랫탑",
		"Flequillo": "앞머리",
		"Corte hongo": "바가지 머리",
		"Pelo largo": "긴 머리",
		"Melena a la mandíbula": "턱선 단발",
		"Moño": "번",
		"Mullet rizado": "곱슬 멀릿",
		"Peinado hacia atrás": "올백",
		"Raya al lado": "가르마",
		"Rizado": "곱슬",
		"Semicalvo": "반대머리",
		"Trenzas pegadas": "콘로우",
		"Trenzas largas sueltas": "긴 풀린 땋은 머리",
		"Tupé": "퀴프",
		"Undercut": "언더컷",

		"French crop texturizado": "텍스처 크롭컷",
		"Crop con degradado alto": "하이 페이드 크롭",
		"Crew cut": "크루컷",
		"Buzz con degradado": "페이드 버즈컷",
		"Tupé corto": "짧은 퀴프",
		"Raya lateral corta": "짧은 가르마",
		"Edgar con fleco recto": "일자 앞머리 에드거",
		"Crop rizado": "곱슬 크롭",
		"Ivy League": "아이비리그컷",
		"Ondas cortas con degradado": "페이드 숏 웨이브",
		"Fleco de cortina largo": "긴 커튼 앞머리",
		"Wolf cut suave": "소프트 울프컷",
		"Mullet moderno": "모던 멀릿",
		"Rizos sueltos": "루즈 컬",
		"Rastas recogidas arriba": "올린 드레드",
		"Rastas hacia un lado": "한쪽 넘긴 드레드",
		"Trenzas pegadas con diseños": "패턴 콘로우",
		"Twists cortos": "숏 트위스트",
		"Melena ondulada": "웨이브 장발",
		"Capas despeinadas": "헝클어진 레이어드",
		"Media coleta": "반묶음",
		"Rastas cortas": "짧은 드레드",
		"Rastas con degradado": "페이드 드레드",
		"Rastas a la mandíbula": "턱선 드레드",
		"Rastas largas sueltas": "긴 풀린 드레드",
		"Rastas gruesas": "굵은 드레드",
		"Fleco recto": "일자 앞머리",
		"Fleco irregular": "삐죽 앞머리",
		"Fleco diagonal": "사선 앞머리",
		"Fleco de cortina": "커튼 앞머리",
		"Fleco ondulado": "웨이브 앞머리",

		"Barba cuadrada": "각진 수염",
		"Barba redondeada": "둥근 수염",
		"Barba trenzada": "땋은 수염",
		"Bigote de puntas curvadas": "핸들바 콧수염",
		"Bigote fino": "얇은 콧수염",
		"Bigote chevrón": "셰브런 콧수염",
		"Chiva larga": "긴 염소수염",
		"Bigote herradura": "말굽 콧수염",
		"Barba larga": "긴 수염",
		"Bigote morsa": "바다코끼리 수염",
		"Patillas unidas al bigote": "구레나룻 연결",
		"Perilla": "턱수염",
		"Barba sin bigote": "콧수염 없는 수염",
		"Barba de tres días": "까칠한 수염",

		"Arqueadas": "아치형",
		"Caídas": "처진형",
		"Con cortes": "슬릿",
		"Finas": "얇은형",
		"Inclinadas": "사선형",
		"Naturales": "자연형",
		"Pobladas": "짙은형",

		"Altas": "높은형",
		"Unidas": "일자 연결",
		"Cortas": "짧은형",
		"Largas": "긴형",
		"Puntiagudas": "뾰족형",
		"Una levantada": "한쪽 치켜뜸",
		"Furiosas": "성난형",
		"Muy pobladas": "아주 짙음",
		"Rectas gruesas": "굵은 일자",
		"Despeinadas": "헝클어짐",
		"Cuadradas": "각진형",
		"Gruesas arqueadas": "굵은 아치형",


		"Crop": "크롭",
		"Cesar": "시저",
		"Crew": "크루",
		"Bun": "번",
		"Zigzag": "지그재그",
		"Rombos": "다이아몬드",
		"Espiga": "헤링본",
		"Malla": "메시",
		"Entrenamiento": "훈련",
		"Lujo": "럭셔리",
		"Ninguna": "없음",
		"Varsity": "바시티",
		"Gabardina": "트렌치코트",
		"Acolchada": "패딩",
		"Gimnasio": "헬스",
		"Streetwear": "스트리트",
		"Retro": "레트로",
		"Invierno": "겨울",
		"Vaquero": "카우보이",
		"Playero": "해변",
		"Rockero": "로커",
		"Urbano": "어반",
		"Día de nieve": "눈 오는 날",
		"Festival": "페스티벌",
		"Llegada al estadio": "경기장 도착",
		"Aeropuerto": "공항",
		"Rueda de prensa": "기자회견",
		"Terraza clásica": "클래식 테라스",
		"Usar": "사용",
		"Actualizar": "업데이트",
		"Eliminar": "삭제",
		"Bajas": "낮은형",
		"Villano": "악당",
		"Doble corte": "더블 컷",
		"Escalón": "계단형",
	},
	"paises": {
		"Afganistán": "아프가니스탄",
		"Albania": "알바니아",
		"Alemania": "독일",
		"Andorra": "안도라",
		"Angola": "앙골라",
		"Anguila": "앵귈라",
		"Antigua y Barbuda": "앤티가 바부다",
		"Arabia Saudí": "사우디아라비아",
		"Argelia": "알제리",
		"Argentina": "아르헨티나",
		"Armenia": "Armenia",
		"Aruba": "아루바",
		"Australia": "호주",
		"Austria": "Austria",
		"Azerbaiyán": "아제르바이잔",
		"Bahamas": "바하마",
		"Bangladés": "방글라데시",
		"Barbados": "바베이도스",
		"Baréin": "바레인",
		"Belice": "벨리즈",
		"Benín": "베냉",
		"Bermudas": "버뮤다",
		"Bielorrusia": "벨라루스",
		"Bolivia": "볼리비아",
		"Bosnia y Herzegovina": "보스니아 헤르체고비나",
		"Botsuana": "보츠와나",
		"Brasil": "브라질",
		"Brunéi": "브루나이",
		"Bulgaria": "불가리아",
		"Burkina Faso": "부르키나파소",
		"Burundi": "부룬디",
		"Bután": "부탄",
		"Bélgica": "벨기에",
		"Cabo Verde": "카보베르데",
		"Camboya": "캄보디아",
		"Camerún": "카메룬",
		"Canadá": "캐나다",
		"Catar": "카타르",
		"Chad": "차드",
		"Chequia": "체코",
		"Chile": "칠레",
		"China": "중국",
		"China Taipéi": "차이니즈 타이베이",
		"Chipre": "키프로스",
		"Colombia": "콜롬비아",
		"Comoras": "코모로",
		"Congo": "콩고",
		"Corea del Norte": "북한",
		"Corea del Sur": "대한민국",
		"Costa de Marfil": "코트디부아르",
		"Costa Rica": "코스타리카",
		"Croacia": "Croatia",
		"Cuba": "쿠바",
		"Curazao": "퀴라소",
		"Dinamarca": "덴마크",
		"Dominica": "도미니카",
		"Ecuador": "에콰도르",
		"Egipto": "이집트",
		"El Salvador": "엘살바도르",
		"Emiratos Árabes": "아랍에미리트",
		"Eritrea": "Eritrea",
		"Escocia": "스코틀랜드",
		"Eslovaquia": "슬로바키아",
		"Eslovenia": "슬로베니아",
		"España": "스페인",
		"Estados Unidos": "미국",
		"Estonia": "Estonia",
		"Esuatini": "에스와티니",
		"Etiopía": "에티오피아",
		"Filipinas": "필리핀",
		"Finlandia": "핀란드",
		"Fiyi": "피지",
		"Francia": "프랑스",
		"Gabón": "가봉",
		"Gales": "웨일스",
		"Gambia": "감비아",
		"Georgia": "조지아",
		"Ghana": "가나",
		"Gibraltar": "지브롤터",
		"Granada": "그레나다",
		"Grecia": "그리스",
		"Guam": "괌",
		"Guatemala": "과테말라",
		"Guinea": "기니",
		"Guinea Ecuatorial": "적도 기니",
		"Guinea-Bisáu": "기니비사우",
		"Guyana": "가이아나",
		"Haití": "아이티",
		"Honduras": "온두라스",
		"Hong Kong": "홍콩",
		"Hungría": "헝가리",
		"India": "인도",
		"Indonesia": "인도네시아",
		"Inglaterra": "잉글랜드",
		"Irak": "Iraq",
		"Irlanda": "아일랜드",
		"Irlanda del Norte": "북아일랜드",
		"Irán": "이란",
		"Islandia": "아이슬란드",
		"Islas Caimán": "케이맨 제도",
		"Islas Cook": "쿡 제도",
		"Islas Feroe": "페로 제도",
		"Islas Marianas del Norte": "북마리아나 제도",
		"Islas Salomón": "솔로몬 제도",
		"Islas Turcas y Caicos": "터크스 케이커스",
		"Islas Vírgenes Británicas": "영국령 버진아일랜드",
		"Islas Vírgenes de EE.UU.": "미국령 버진아일랜드",
		"Israel": "이스라엘",
		"Italia": "이탈리아",
		"Jamaica": "자메이카",
		"Japón": "일본",
		"Jordania": "요르단",
		"Kazajistán": "카자흐스탄",
		"Kenia": "케냐",
		"Kirguistán": "키르기스스탄",
		"Kosovo": "코소보",
		"Kuwait": "쿠웨이트",
		"Laos": "Laos",
		"Lesoto": "레소토",
		"Letonia": "라트비아",
		"Liberia": "Liberia",
		"Libia": "리비아",
		"Liechtenstein": "리히텐슈타인",
		"Lituania": "리투아니아",
		"Luxemburgo": "룩셈부르크",
		"Líbano": "레바논",
		"Macao": "마카오",
		"Macedonia del Norte": "북마케도니아",
		"Madagascar": "마다가스카르",
		"Malasia": "말레이시아",
		"Malaui": "말라위",
		"Maldivas": "몰디브",
		"Malta": "몰타",
		"Malí": "말리",
		"Marruecos": "모로코",
		"Mauricio": "모리셔스",
		"Mauritania": "모리타니",
		"Moldova": "몰도바",
		"Mongolia": "몽골",
		"Montenegro": "몬테네그로",
		"Montserrat": "몬트세랫",
		"Mozambique": "모잠비크",
		"Myanmar": "미얀마",
		"México": "멕시코",
		"Namibia": "나미비아",
		"Nepal": "네팔",
		"Nicaragua": "니카라과",
		"Nigeria": "Nigeria",
		"Noruega": "노르웨이",
		"Nueva Caledonia": "뉴칼레도니아",
		"Nueva Zelanda": "뉴질랜드",
		"Níger": "니제르",
		"Omán": "오만",
		"Pakistán": "파키스탄",
		"Palestina": "팔레스타인",
		"Panamá": "파나마",
		"Papúa Nueva Guinea": "파푸아뉴기니",
		"Paraguay": "파라과이",
		"Países Bajos": "네덜란드",
		"Perú": "페루",
		"Polonia": "폴란드",
		"Portugal": "포르투갈",
		"Puerto Rico": "푸에르토리코",
		"RD Congo": "DR콩고",
		"República Centroafricana": "중앙아프리카공화국",
		"República Dominicana": "도미니카 공화국",
		"Ruanda": "르완다",
		"Rumanía": "루마니아",
		"Rusia": "러시아",
		"Samoa": "사모아",
		"Samoa Americana": "아메리칸사모아",
		"San Cristóbal y Nieves": "세인트키츠 네비스",
		"San Marino": "산마리노",
		"San Vicente y las Granadinas": "세인트빈센트 그레나딘",
		"Santa Lucía": "세인트루시아",
		"Santo Tomé y Príncipe": "상투메 프린시페",
		"Senegal": "세네갈",
		"Serbia": "세르비아",
		"Seychelles": "세이셸",
		"Sierra Leona": "시에라리온",
		"Singapur": "싱가포르",
		"Siria": "시리아",
		"Somalia": "소말리아",
		"Sri Lanka": "스리랑카",
		"Sudáfrica": "남아프리카공화국",
		"Sudán": "수단",
		"Sudán del Sur": "남수단",
		"Suecia": "스웨덴",
		"Suiza": "스위스",
		"Surinam": "수리남",
		"Tahití": "타히티",
		"Tailandia": "태국",
		"Tanzania": "탄자니아",
		"Tayikistán": "타지키스탄",
		"Timor Oriental": "동티모르",
		"Togo": "토고",
		"Tonga": "통가",
		"Trinidad y Tobago": "트리니다드 토바고",
		"Turkmenistán": "투르크메니스탄",
		"Turquía": "튀르키예",
		"Túnez": "튀니지",
		"Ucrania": "우크라",
		"Uganda": "우간다",
		"Uruguay": "우루과이",
		"Uzbekistán": "우즈베키스탄",
		"Vanuatu": "바누아투",
		"Venezuela": "베네수엘라",
		"Vietnam": "베트남",
		"Yemen": "예멘",
		"Yibuti": "지부티",
		"Zambia": "잠비아",
		"Zimbabue": "짐바브웨",
	},

	"herencia": {
		"ESTRELLAS": "별",
		"KITS": "키트",
		"VENTAJAS": "특전",
		"COMPRAR": "구매",
		"ABIERTA": "해금됨",
		"EL ALTA": "새 커리어",
		"DE SALIDA": "기본 지급",
		"DE TU HERENCIA": "내 레거시에서",
		"SOLAR": "부지",
		"TE ALCANZA": "구매 가능",
		"TE FALTAN {0} ★": "{0} ★ 부족",
		"BOTAS DE BARRIO": "동네 축구화",
		"REFUERZOS": "부스터",
		"Vale en TODAS tus carreras, las de hoy y las que empieces.": "지금 커리어도, 앞으로 시작할 커리어도 모든 커리어에 적용돼요.",
		"Al empezar una carrera las eliges en el paso TUS VENTAJAS.": "커리어를 시작할 때 내 특전 단계에서 골라요.",
		"Lo que se compra aquí no se gana: se hereda. Cada ventaja entra sola en toda carrera nueva, hoy y siempre.": "여기서 사는 건 얻는 게 아니라 물려받는 거예요. 모든 특전은 새 커리어마다 자동으로 들어가요. 지금도, 앞으로도.",
		"En tu herencia: entra en toda carrera nueva.": "내 레거시에 있어요: 모든 새 커리어에 들어가요.",
		"Abierta por TODAS LAS VENTAJAS: en tu herencia, en toda carrera nueva.": "모든 특전으로 해금: 내 레거시에 있어요. 모든 새 커리어에 들어가요.",
		"Estrellas y la vitrina entera, con dinero real. Son de tu cuenta, no de una carrera: sobreviven a borrar ranuras.": "별과 진열장 전체를 현금으로. 커리어가 아니라 계정에 귀속돼요: 슬롯을 지워도 남아요.",
		"Elige una pieza. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "하나 고르세요. 여기서 산 건 지금 커리어도, 앞으로 올 커리어도 모두 함께해요.",
		"Desde hoy va contigo en cada carrera, las de ahora y las que vengan. No se devuelve.": "오늘부터 지금 커리어도, 앞으로 올 커리어도 모두 함께해요. 환불은 안 돼요.",
		"La vitrina entera, en tu herencia: las veinticuatro en toda carrera nueva.": "진열장 전체가 내 레거시에: 24개 모두 새 커리어마다 들어가요.",
		"Ciento cincuenta estrellas: tu primera ventaja, la de nivel 1, sin esperar al primer retiro.": "별 150개: 첫 은퇴를 기다리지 않고 레벨 1 첫 특전을 바로.",
		"Toca una con cadenas y cómprala aquí mismo, con estrellas o con dinero real. Son tuyas para siempre: cada una entra sola en toda carrera nueva.": "사슬에 묶인 걸 눌러 여기서 바로 사세요. 별로도, 현금으로도 돼요. 영원히 내 거예요: 하나하나가 새 커리어마다 자동으로 들어가요.",
		"Consigue más en LEGADO, desde el menú.": "메뉴의 레거시에서 더 얻으세요.",
		"CANTERA DE ORO": "황금 아카데미",
		"Toda carrera nueva arranca con 65 en las ocho habilidades en vez de 60. Es un año de entrenamiento antes de debutar.": "모든 새 커리어가 8개 능력 모두 60 대신 65로 시작해요. 데뷔 전 1년치 훈련이에요.",
		"LA CARTERA DEL ABUELO": "할아버지의 지갑",
		"Diez mil de salida en toda carrera nueva, encima de los cinco mil de siempre. Para no vivir al día el primer año.": "모든 새 커리어 시작 때 기본 5천에 더해 1만을 추가로. 첫해부터 쪼들리지 않게요.",
		"UN AGENTE QUE TE CONOCE": "나를 아는 에이전트",
		"EL SOLAR DE LA FAMILIA": "가문의 부지",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} compradas · {3} gastadas": "업적과 은퇴마다 얻어요: 업적 {0} · 은퇴 {1} · 구매 {2} · 사용 {3}",
		"No marca ningún logro: LOGROS y Game Center siguen contando sólo lo jugado.": "업적은 해금되지 않아요: 업적과 Game Center는 직접 플레이한 것만 세요.",
		"Pagas {0} ★ · te quedan {1} ★": "지불 {0} ★ · 남은 별 {1} ★",
		"Este retiro deja {0} ★ en tu herencia · {1} ★ por gastar en el menú": "이번 은퇴로 레거시에 {0} ★ · 메뉴에서 쓸 별 {1} ★",
		"Ventajas abiertas para tu próxima carrera: {0} de {1}": "다음 커리어용 해금 특전: {1}개 중 {0}개",
		"Toda carrera nueva arranca con unas BARRIO 90 nuevas puestas en vez de las de cantera. Se gastan, como todas.": "모든 새 커리어가 아카데미 축구화 대신 새 BARRIO 90을 신고 시작해요. 다른 축구화처럼 닳아요.",
		"Tu agente empieza cada carrera creyendo en ti: llamadas y encargos desde el primer mes, no a media carrera.": "에이전트가 커리어 시작부터 나를 믿어요: 커리어 중반이 아니라 첫 달부터 전화와 부탁이 와요.",
		"Un terreno donde construir, en toda carrera nueva. El terreno sin la casa: lo que levantes encima lo pagas tú.": "모든 새 커리어에 집 지을 부지가 있어요. 집 없이 땅만: 위에 짓는 건 직접 내야 해요.",
		"CONSEGUIR ESTRELLAS": "별 얻기",
		"UN PUÑADO DE ESTRELLAS": "별 한 줌",
		"REINICIAR PARTIDO": "경기 다시 시작",
		"YA PAGADO": "결제 완료",
		"La App Store no ha devuelto la ficha. Entra con conexión y vuelve a probar.": "App Store에서 상품 정보를 받지 못했어요. 인터넷에 연결해서 다시 시도하세요.",
		"BRONCE": "브론즈",
		"PLATA": "실버",
		"DIAMANTE": "다이아몬드",
		"BUEN TOQUE": "부드러운 터치",
		"Le pegas con rosca desde niño: +4 de efecto desde el debut.": "어릴 때부터 감아 찼어요: 데뷔부터 회전 +4.",
		"PULMONES": "강철 폐",
		"Ibas corriendo al colegio y de vuelta: +4 de físico desde el debut.": "학교를 뛰어서 오갔어요: 데뷔부터 피지컬 +4.",
		"LOS AHORROS": "저축",
		"La familia guardó para tu debut: veinticinco mil de salida en toda carrera nueva.": "가족이 데뷔를 위해 모아뒀어요: 모든 새 커리어 시작 때 2만 5천.",
		"El vestuario te sigue antes de que abras la boca: el equipo nunca por debajo de 55.": "입을 열기도 전에 라커룸이 따라요: 팀 평가는 절대 55 아래로 안 내려가요.",
		"EL CEREBRO": "두뇌",
		"Ves la jugada antes que nadie: +6 de visión y +3 de precisión y efecto.": "누구보다 먼저 플레이를 읽어요: 시야 +6, 정확도와 회전 +3.",
		"EL RELOJ DEL ABUELO": "할아버지의 시계",
		"Un reloj de lujo que ya era de la familia: la prensa te mira distinto desde el primer día.": "원래 가문의 것이던 명품 시계: 첫날부터 언론이 다르게 봐요.",
		"SUPERDOTADO": "천재",
		"Naciste para esto: 8 puntos de habilidad por repartir antes de debutar.": "이걸 위해 태어났어요: 데뷔 전에 나눌 스킬 포인트 8.",
		"LA FORTUNA FAMILIAR": "가문의 재산",
		"Doscientos cincuenta mil de salida en toda carrera nueva. Nunca vas a vivir al día.": "모든 새 커리어 시작 때 25만. 쪼들릴 일은 절대 없어요.",
		"La vitrina entera, en tu herencia: todas en toda carrera nueva.": "진열장 전체가 내 레거시에: 모두 새 커리어마다 들어가요.",

		"BAJO LOS FOCOS": "스포트라이트",
		"CON PADRINO": "든든한 인맥",
		"LA DINASTIA": "왕조",
		"CUERPO DE ATLETA": "운동선수의 몸",
		"PURO TALENTO": "순수한 재능",
		"Llegas ya famoso: la grada te corea, la prensa te sigue y el seleccionador sabe tu nombre.": "이미 유명한 채로 와요: 관중석이 이름을 연호하고, 언론이 따라붙고, 대표팀 감독이 나를 알아요.",
		"Tu agente contesta, el vestuario te respeta y firmas el debut un rol más arriba.": "에이전트가 전화를 받고, 라커룸이 존중하고, 데뷔 계약을 한 단계 높은 역할로 맺어요.",
		"Naces con herencia: un cuarto de millón en el banco, el terreno del abuelo y la casa del viejo.": "금수저로 태어나요: 은행에 25만, 할아버지의 부지, 아버지의 집.",
		"Un cuerpo que no se rompe: piernas de niño, 20 % menos lesiones y fisio gratis toda la carrera.": "부서지지 않는 몸: 젊은 다리, 부상 20% 감소, 커리어 내내 무료 물리치료사.",
		"Naces crack: 65 en todo, ocho puntos por repartir y un disparo que asusta desde el primer partido.": "타고난 크랙: 전부 65, 나눌 포인트 8, 첫 경기부터 무서운 슈팅.",
		"PACKS": "팩",
		"COMPRAR PACK": "팩 구매",
		"TAMBIÉN TUYAS": "이것도 내 거",
		"Cinco packs de tres ventajas. Cada una entra sola en toda carrera nueva, hoy y siempre.": "특전 3개짜리 팩 5종. 하나하나가 새 커리어마다 자동으로 들어가요. 지금도, 앞으로도.",
		"En tu herencia: sus tres ventajas entran en toda carrera nueva.": "내 레거시에 있어요: 특전 3개가 모든 새 커리어에 들어가요.",
		"YA TIENES {0} DE 3: con estrellas pagas sólo lo que te falta.": "3개 중 {0}개 보유: 별로 사면 부족한 것만 내요.",
		"Y {0} ventajas sueltas de antes, tuyas: entran igual en cada carrera.": "그리고 예전 단품 특전 {0}개도 내 거예요: 똑같이 모든 커리어에 들어가요.",
		"Elige un pack. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "팩을 고르세요. 여기서 산 건 지금 커리어도, 앞으로 올 커리어도 모두 함께해요.",
		"Toca una con cadenas y compra su pack aquí mismo, con estrellas o con dinero real. Es tuyo para siempre: sus tres ventajas entran solas en toda carrera nueva.": "사슬에 묶인 걸 눌러 그 팩을 여기서 바로 사세요. 별로도, 현금으로도 돼요. 영원히 내 거예요: 특전 3개가 새 커리어마다 자동으로 들어가요.",
		"Las estrellas se ganan jugando: con cada logro y con cada retiro.": "별은 플레이로 얻어요: 업적과 은퇴마다.",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} gastadas": "업적과 은퇴마다 얻어요: 업적 {0} · 은퇴 {1} · 사용 {2}",

		"¡DOBLETE DE {0}!": "{0}, 멀티골!",
		"¡TERCERO DE {0}: HAT-TRICK!": "{0}, 또 골! 해트트릭!",
		"¡CUATRO DE {0}! SÚPER HAT-TRICK": "{0}, 4골 폭발!",
		"¡CINCO DE {0}! LA MANITA": "{0}, 5골! 못 막는다",
		"¡{1} GOLES DE {0}! DE LEYENDA": "{0}, {1}골! 전설이다",
		"¡OTRA ASISTENCIA DE {0}! VAN DOS": "{0}, 또 도움! 벌써 2개",
		"¡TERCERA ASISTENCIA DE {0}!": "{0}, 세 번째 도움!",
		"¡{1} ASISTENCIAS DE {0}!": "{0}, 도움 {1}개!",
		"{0} YA LLEVA TRES PARADAS": "{0}, 벌써 세 번째 선방",
		"¡CINCO PARADAS DE {0}!": "{0}, 선방 5개!",
		"¡{1} PARADAS! {0} ES UN MURO": "선방 {1}개! {0}, 통곡의 벽",
		"{0} YA TENÍA AMARILLA ({1}')": "{0} 선수, 이미 경고 ({1}')",
		"¡OTRA ROJA! TU EQUIPO SE QUEDA CON NUEVE": "또 퇴장! 우리 팀은 9명",
		"¡OTRA ROJA! EL RIVAL SE QUEDA CON NUEVE": "또 퇴장! 상대는 9명",
		"YA SON TRES AMARILLAS DE TU EQUIPO": "우리 팀 벌써 경고 3장",
		"YA SON TRES AMARILLAS DEL RIVAL": "상대 벌써 경고 3장",
		"¡CINCO AMARILLAS DE TU EQUIPO!": "우리 팀 경고 5장!",
		"¡CINCO AMARILLAS DEL RIVAL!": "상대 경고 5장!",
	},

	"salon_fama": {
		"SALÓN DE LA FAMA": "명예의 전당",
		"ESPERAN SU PLACA": "명판 대기 중",
		"TUS LEYENDAS": "내 레전드",
		"Aún no hay placas. Cuando una carrera se retire, cuelga aquí su placa: su ranura queda libre para empezar otra y su historia se queda en este salón.": "아직 명판이 없어요. 커리어가 은퇴하면 여기에 명판을 걸어요: 그 슬롯은 비워져 새 커리어를 시작할 수 있고, 그 이야기는 이 전당에 남아요.",
		"RANURA {0} · RETIRADO": "슬롯 {0} · 은퇴",
		"Antes de colgarla, termina su despedida: entra en su carrera desde el menú.": "걸기 전에 작별을 마무리하세요: 메뉴에서 그 커리어로 들어가요.",
		"COLGAR SU PLACA": "명판 걸기",
		"¿COLGAR SU PLACA?": "명판을 걸까요?",
		"La carrera de {0} sale de la RANURA {1} y se queda en el SALÓN DE LA FAMA. La ranura queda libre para empezar otra.": "{0}의 커리어가 슬롯 {1}에서 나와 명예의 전당에 남아요. 슬롯은 비워져 새 커리어를 시작할 수 있어요.",
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida y su museo se borran. Esto no se puede deshacer.": "전당에는 명판이 남아요: 기록, 트로피, 클럽. 세이브와 박물관은 지워져요. 되돌릴 수 없어요.",
		"No se pudo. La carrera sigue donde estaba.": "실패했어요. 커리어는 그대로예요.",
		"COLGAR MI PLACA": "내 명판 걸기",
		"Pieza de Museo": "박물관 소장품",
		"Entrar por primera vez al museo de tu carrera.": "내 커리어 박물관에 처음 들어가기.",
	},

	"casa_legado": {
		"MESA DE PING-PONG": "탁구대",
		"VITRINA DEL CAPITÁN": "주장 진열장",
		"POSADERO PARA LORO": "앵무새 횃대",
		"Mesa con red y palas. Juega al ping-pong contra un rival.": "네트와 라켓이 있는 탁구대. 상대와 탁구를 쳐요.",
		"Tu capitanía bajo cristal. Conserva los nombramientos ganados.": "유리 안의 주장 경력. 받은 주장 임명을 간직해요.",
		"Rama de madera con agua y semillas. Tu loro descansa aquí.": "물과 씨앗이 있는 나무 횃대. 앵무새가 여기서 쉬어요.",
		"JUGAR PING-PONG": "탁구 치기",
		"VER BRAZALETES": "주장 완장 보기",
		"TUS BRAZALETES": "내 주장 완장",
		"El nombramiento se gana jugando. La vitrina conserva tus brazaletes.": "주장 임명은 플레이로 얻어요. 진열장이 주장 완장을 간직해요.",
		"Tu primer brazalete aparecerá cuando te nombren capitán.": "주장으로 임명되면 첫 주장 완장이 나타나요.",
		"CAPITÁN DE LA SELECCIÓN": "대표팀 주장",
		"CAPITÁN DEL CLUB": "클럽 주장",
		"REGISTRADO EN LA TEMPORADA {0}": "{0} 시즌에 기록",
		"Esta partida ya tenía la capitanía. Se conserva la vigente, sin inventar fechas anteriores.": "이 세이브엔 이미 주장 경력이 있었어요. 지금 것을 유지하고, 이전 날짜는 지어내지 않아요.",
		"PING-PONG": "탁구",
		"A 11 puntos, con ventaja de 2. Punto decisivo en 20-20.": "11점 선승, 2점 차로 승리. 20-20이면 다음 점수가 결정타.",
		"ARRASTRA AQUÍ PARA MOVER LA PALA": "여기를 끌어 라켓 이동",
		"IZQUIERDA": "왼쪽",
		"CENTRO": "가운데",
		"DERECHA": "오른쪽",
		"Mueve la pala con el dedo. El golpe es automático.": "손가락으로 라켓을 움직여요. 타격은 자동이에요.",
		"Compra la mesa de ping-pong para jugar.": "탁구대를 사야 칠 수 있어요.",
		"Elige dónde devolver: izquierda, centro o derecha.": "어디로 넘길지 고르세요: 왼쪽, 가운데, 오른쪽.",
		"GANÓ EL RIVAL": "상대 승리",
		"REVANCHA": "리매치",
		"TU SAQUE": "내 서브",
		"SAQUE RIVAL": "상대 서브",
		"SACAR": "서브",
		"PUNTO PARA TI": "내 득점",
		"PUNTO PARA EL RIVAL": "상대 득점",
		"DEVOLUCIONES: {0}": "리턴: {0}",
		"AHORA ENFRENTE": "이젠 적으로",
		"AHORA JUEGA EN {0}": "이제 {0}에서 뛰어요",
		"DEBUTA": "데뷔",
		"EL DEBUT DEL CHAVAL": "꼬마의 데뷔",
		"EL QUE SE FUE": "떠난 그 녀석",
		"FICHA POR {0}": "{0} 이적",
		"FIRMA SU PLAYERA": "유니폼에 사인",
		"Firmó su primer contrato. Quiso que estuvieras tú a su lado.": "첫 계약서에 사인했어요. 옆에 당신이 있길 바랐대요.",
		"Hoy entra por primera vez. Tú te acuerdas de lo que se siente.": "오늘 처음으로 그라운드를 밟아요. 그 기분, 당신은 알죠.",
		"LA CANTERA": "아카데미",
		"LLEGA DE LA CANTERA": "아카데미 출신",
		"La encontró colgada en su taquilla. No hizo falta decir nada.": "사물함에 걸려 있는 걸 발견했어요. 말은 필요 없었어요.",
		"Lo viste debutar a tu lado. Hoy te va a tocar marcarlo.": "내 옆에서 데뷔하는 걸 봤죠. 오늘은 그 녀석을 마크해야 해요.",
		"Lo viste debutar. Ahora lo cuentan en la tele del bar.": "그의 데뷔를 봤죠. 이제는 술집 TV에 나와요.",
		"PRIMER CONTRATO": "첫 계약",
		"PRIMER CONTRATO PROFESIONAL": "첫 프로 계약",
		"Podía correr a la grada. Corrió hacia ti.": "관중석으로 달려갈 수도 있었죠. 그는 당신에게 달려왔어요.",
		"SU PRIMER CONTRATO": "그의 첫 계약",
		"SU PRIMER GOL": "그의 첫 골",
		"Se quedó con la playera en blanco en las manos. No dijo nada.": "사인 없는 유니폼을 손에 들고 서 있었어요. 아무 말도 없었어요.",
		"TU DORSAL ES SUYO": "내 등번호는 그의 것",
		"{0} AÑOS · CANTERA": "{0}세 · 아카데미",
		"{0} AÑOS · PRIMER GOL": "{0}세 · 첫 골",
		"{0} AÑOS · PRIMER PARTIDO": "{0}세 · 첫 경기",
		"«Mi sueño es jugar junto a ti pronto.»": "“얼른 형이랑 같이 뛰는 게 꿈이에요.”",
		"«Mi sueño es jugar junto a ti pronto.» Ya está aquí.": "“얼른 형이랑 같이 뛰는 게 꿈이에요.” 이제 여기 있어요.",
		"—¿Me firmas la playera?": "“유니폼에 사인해 주실래요?”",
		"PRESENTADO": "공식 입단",
		"Tu ahijado ya tiene dorsal. Esta temporada jugáis juntos.": "내 대자에게 이제 등번호가 생겼어요. 이번 시즌은 함께 뛰어요.",
		"DESPUÉS DEL ENTRENO": "훈련 후",
		"—Me quedé para verte. ¿Me enseñas a pegarle como tú?": "“형 보려고 남았어요. 형처럼 차는 법 알려줄래요?”",
		"IRTE": "가기",
		"UNA HORA MÁS": "한 시간 더",
		"Se fue a casa ya de noche, con el balón bajo el brazo.": "공을 옆구리에 끼고 어두워져서야 집에 갔어요.",
		"Recogió el balón y se quedó tirando solo.": "공을 주워 혼자 계속 슈팅했어요.",
		"SU PADRINO": "그의 대부",
		"SUBE AL PRIMER EQUIPO": "1군 승격",
		"—Lo subimos contigo. ¿Quieres ser su padrino?": "“너랑 같이 올릴 거야. 대부가 되어 줄래?”",
		"TU AHIJADO": "내 대자",
		"La temporada que viene, jugará a tu lado.": "다음 시즌엔 당신 옆에서 뛸 거예요.",
		"SIGUE EN LA CANTERA": "아카데미 잔류",
		"El director asintió. El niño miró al suelo.": "디렉터는 고개를 끄덕였어요. 아이는 바닥만 바라봤어요.",
		"El Ahijado": "대자",
		"Apadrinar a un niño de la cantera hasta el primer equipo.": "아카데미 꼬마를 1군까지 이끌어 주기.",
		"VER SALÓN": "명예의 전당",
		"ESCALÓN": "단계",
		"AQUÍ EMPEZASTE": "시작한 곳",
		"PARED DE REFLEJOS": "반사신경 벽",
		"MEMORAMA": "짝 맞추기",
		"JUGAR REFLEJOS": "반사신경 플레이",
		"JUGAR MEMORAMA": "짝 맞추기 하기",
		"¡RÉCORD!": "신기록!",
		"ANTES {0}": "이전 {0}",
		"RÉCORD {0}": "기록 {0}",
		"RÉCORDS · {0}": "기록 · {0}",
		"MS": "MS",
		"NO TOQUES": "누르지 마",
		"TOCA": "눌러",
		"REFLEJO": "반응 속도",
		"TIEMPO": "시간",
		"COMPLETADO": "완료",
		"MEMORIZA": "외워",
		"MOVIMIENTOS": "시도",
		"TU COLECCIÓN": "내 컬렉션",
		"{0} S": "{0}초",
		"memoramaEN JUEGO": "사용 카드",
		"memoramaPAREJAS": "짝",
		"reflejosRACHA": "연속",
		"Pared de luces: toca la que se enciende. Récord de reflejos.": "불빛 벽: 켜지는 불을 누르세요. 반응 속도 기록.",
		"Mesa de cartas con tu colección: encuentra las parejas.": "내 컬렉션으로 만든 카드 테이블: 짝을 찾으세요.",
	},


	"pique": {
		"CALMA": "침착",
		"ENCÁRATE": "맞서기",
		"{0} TE BUSCA": "{0}, 나를 노린다",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE ENCARAN": "{0}, {1}에게 뒤에서 발길질, 서로 대치",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1}, QUE NO RESPONDE": "{0}, {1}에게 뒤에서 발길질, {1} 무반응",
		"notaTEMPLE": "침착함",
		"notaAMARILLA": "경고",
		"Otra vez le ganas a {0}. Ya no le hace ninguna gracia.": "또 {0} 선수를 이겼어요. 이제 전혀 웃지 않아요.",
		"{0} ya te tiene entre ceja y ceja.": "{0} 선수가 이제 당신을 벼르고 있어요.",
		"{0} va a por ti, no a por el balón. Patada por detrás.": "{0} 선수는 공이 아니라 당신을 노려요. 뒤에서 발길질.",
		"Ni mira la pelota: {0} te pega por detrás.": "공은 보지도 않아요: {0} 선수가 뒤에서 걷어차요.",
		"Te levantas y te vas a por {0}. Frente con frente.": "일어나서 곧장 {0} 선수에게 가요. 정면으로 맞대결.",
		"No te lo callas: cara a cara con {0}, y la grada se enciende.": "참지 않아요: {0} 선수와 얼굴을 맞대고, 관중석이 들끓어요.",
		"{0} te busca y no te encuentra. Te das la vuelta.": "{0} 선수가 도발하지만 반응이 없어요. 당신은 돌아서요.",
		"Ni lo miras. {0} se queda con el dedo en el aire.": "쳐다보지도 않아요. {0} 선수는 손가락만 허공에 든 채 남아요.",
		"{1} NO LE PIERDE LA PISTA A {0}": "{1}, {0}에게서 눈을 떼지 않는다",
		"{0} SE LE ESCAPA A {1} UNA Y OTRA VEZ": "{0}, {1}의 마크를 거듭 벗겨내다",
		"AMBIENTE CALDEADO ENTRE {0} Y {1}": "{0} 대 {1}, 신경전 과열",
		"CADA BALÓN ENTRE {0} Y {1} ES UNA GUERRA": "{0} 대 {1}, 공 하나하나가 전쟁",
		"{0} NO ENTRA AL TRAPO Y SIGUE A LO SUYO": "{0}, 도발에 안 넘어가고 제 할 일",
		"{1} BUSCA LA REACCIÓN DE {0} Y NO LA ENCUENTRA": "{1}, {0}의 반응을 노렸지만 실패",
		"SIN {1} EN EL CAMPO, {0} RESPIRA": "{1} 퇴장, {0} 한숨 돌리다",
		"{1} JUEGA CON LA AMARILLA A CUESTAS": "{1}, 경고를 안고 뛴다",
		"{0} JUEGA AL LÍMITE CON LA AMARILLA": "{0}, 경고 안고 아슬아슬",
		"Viven en tu casa y cobran cada jornada.": "내 집에 살면서 라운드마다 돈을 받아요.",

		"¡Derribaste el dron de la tele!": "TV 드론을 격추했어요!",
		"Señal Perdida": "신호 끊김",
		"Derribar el dron de la tele de un balonazo.": "강슛으로 TV 드론 격추하기.",
		"Algunos partidos los graba un dron desde el cielo.": "어떤 경기는 하늘에서 드론이 촬영해요.",

		"¡Balón de playa en el área!": "박스 안에 비치볼이!",
		"¡Desvío en el balón de playa!": "비치볼 맞고 굴절!",
		"Gol de Playa": "비치볼 골",
		"Marcar un gol desviado por el balón de playa.": "비치볼에 굴절된 골 넣기.",
		"A veces cae algo inflable desde la grada.": "가끔 관중석에서 풍선 같은 게 떨어져요.",

		"¡Le volaste el celular a un fan!": "팬의 휴대폰을 날려버렸어요!",
		"¡Tu balonazo se hizo viral!": "내 강슛이 바이럴됐어요!",
		"REC": "REC",
		"{0} vistas": "조회수 {0}",
		"Se Hizo Viral": "바이럴 대박",
		"Tirarle el celular a un fan que te graba.": "촬영 중인 팬의 휴대폰 맞혀 떨어뜨리기.",
		"Hay quien graba el partido desde detrás de la valla.": "광고판 뒤에서 경기를 찍는 사람이 있어요.",
		"Tangana en pleno derbi: {0} te empuja y se forma el corro.": "더비 한복판에서 몸싸움: {0} 선수가 밀치자 선수들이 몰려들어요.",
		"Empujones entre los dos equipos. {0} lo empezó y el árbitro tiene que meterse en medio.": "두 팀 사이에 몸싸움이 벌어졌어요. {0} 선수가 시작했고 심판이 말려야 해요.",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE MONTA LA TANGANA": "{0}, {1}에게 뒤에서 발길질, 몸싸움 시작",
		"LA TANGANA DEJA EL DERBI AL ROJO VIVO": "몸싸움에 더비 과열",
		"DESDE LA TANGANA, {1} Y {0} NO SE QUITAN LA VISTA": "몸싸움 이후 {1}, {0} 서로 노려봐요",
		"{0} ARRASTRA LA AMARILLA DE LA TANGANA": "{0}, 몸싸움 경고 안고 뛰어요",
		"Y en los bares sólo se habla de la tangana.": "술집에서도 온통 그 몸싸움 이야기뿐이에요.",
	},


	"editor_estadio_derbi": {
		"ESTADIO": "경기장",
		"estadioPLANTA": "구조",
		"VOLVER AL ESTADIO AUTOMATICO": "자동 경기장으로 되돌리기",
		"El nombre sale en la carátula de TV y en el hub. La planta es la forma de las gradas en el partido.": "이름은 TV 화면과 허브에 나와요. 구조는 경기 중 관중석의 모양이에요.",
		"SIN DERBI": "더비 없음",
		"VOLVER AL DERBI AUTOMATICO": "자동 더비로 되돌리기",
		"Es el partido con más ambiente del año. Tiene que ser del mismo país; puede ser de otra división.": "한 해 중 분위기가 가장 뜨거운 경기예요. 같은 나라여야 하고, 다른 부여도 돼요.",
		"ELIGE SU RIVAL DE DERBI": "더비 상대 선택",
		"Tiene que ser del mismo país.\nPuede ser de otra división.": "같은 나라여야 해요.\n다른 부여도 돼요.",
		"DERBI DE: {0}": "더비 상대: {0}",
		"{0} y {1} pasan a ser rivales de derbi.": "{0} 클럽과 {1} 클럽이 더비 라이벌이 돼요.",
		"Los rivales que tenían hasta hoy se quedan sin derbi, y el juego les busca otro.": "지금까지의 라이벌은 더비가 없어지고, 게임이 새 상대를 찾아줘요.",
		"AÑADIR OTRO DERBI": "더비 추가",
		"Hasta tres rivales; el primero es el derbi principal.": "라이벌은 3팀까지, 첫 번째가 메인 더비예요.",
		"Se suma a los derbis que ya tenían elegidos.": "이미 고른 더비에 추가돼요.",
		"Es el partido con más ambiente del año. Puede ser de cualquier confederación; sus otros rivales de siempre se quedan.": "한 해 중 분위기가 가장 뜨거운 경기예요. 어느 연맹이든 되고, 기존 라이벌은 그대로 남아요.",
		"Puede ser de cualquier confederación.": "어느 연맹이든 돼요.",
		"El rival que cada una tenía elegido vuelve a los suyos de siempre.": "각자 골랐던 라이벌은 원래 상대들로 돌아가요.",
		"derbi con selección desconocida: {0}": "알 수 없는 대표팀과의 더비: {0}",
		"derbi consigo misma: {0}": "자기 자신과의 더비: {0}",
		"Las carreras ya empezadas lo estrenan al volver a cargar la partida.": "이미 진행 중인 커리어는 세이브를 다시 불러올 때 적용돼요.",
		"CONFIRMAR DERBI": "더비 확인",
		"· DERBI: {0}": "· 더비: {0}",
		"· ESTADIO": "· 경기장",
		"derbi": "더비",
		"derbis": "더비",
		"Su estadio y su derbi, también.": "경기장과 더비도요.",
		"derbi con club desconocido: {0}": "알 수 없는 클럽과의 더비: {0}",
		"demasiados derbis para: {0}": "더비가 너무 많음: {0}",
		"derbi entre países distintos: {0}": "서로 다른 나라 간 더비: {0}",
		"CUENCO CERRADO": "닫힌 볼",
		"CUATRO TRIBUNAS": "4면 스탠드",
		"HERRADURA": "말굽형",
		"TRIBUNA EN L": "L자 스탠드",
		"DOS TRIBUNAS": "2면 스탠드",
		"CON PISTA": "트랙 포함",
		"CUENCO REDONDO": "원형 볼",
		"COLISEO": "콜로세움",
		"OCTAGONO": "팔각형",
		"CATEDRAL": "대성당",
		"VELAS": "돛",
		"DOS ANILLOS": "2층 링",
		"MEMBRANA": "막 구조",
		"TRIBUNA ALTA": "높은 스탠드",
		"CALDERA": "가마솥",
		"TRIBUNA DOBLE": "2층 스탠드",
		"TECHO DE TELA": "천막 지붕",
		"FONDO ALTO": "높은 골대 뒤",
		"FONDO EN BLOQUES": "블록형 골대 뒤",
		"SIN FONDO, ARBOLES": "골대 뒤 나무숲",
		"TECHO A DOS AGUAS": "박공지붕",
		"CAMPO HUNDIDO": "낮은 그라운드",
		"PANTALLA GIGANTE": "대형 전광판",
		"ARCO AL FONDO": "골대 뒤 아치",
		"TERRAPLEN": "흙 둔덕",
		"GRADAS TUBO": "튜브 스탠드",
		"MURO DE PIE": "입석 벽",
		"TRES ANILLOS": "3층 링",
		"FONDO DE BANDERAS": "깃발 골대 뒤",
		"TRIBUNA CON POSTES": "기둥 스탠드",
		"TORRE DEL RELOJ": "시계탑",
		"CAMPO CON COCHES": "차 있는 경기장",
		"FONDO DE CHIMENEAS": "굴뚝 골대 뒤",
		"PIEL ENVOLVENTE": "감싸는 외피",
		"LATERAL PLANO": "평평한 측면",
		"ANILLO COLGADO": "매달린 링",
		"TECHO DE DIENTES": "톱니 지붕",
		"COLUMNATA": "열주",
		"TECHO FLOTANTE": "떠 있는 지붕",
		"TORRES CON RAMPA": "램프 타워",
		"CALABAZA": "호박",
		"PUERTA MONUMENTAL": "기념비 정문",
		"OLA DE VIDRIO": "유리 물결",
		"OLIMPICO DE PIEDRA": "석조 종합 대회장",
		"COLOSO": "거상",
		"CAJON VERTICAL": "수직 상자",
		"HERRADURA DE TRES PISOS": "3층 말굽형",
		"TRES GRADAS ABIERTAS": "개방형 3층 스탠드",

		"TU ESTADO": "내 상태",
		"LO DECIDE LA DIRECTIVA": "이사회 결정",
		"SI PAGAN": "돈을 내면",
		"La directiva te bloquea {0} ofertas": "이사회가 나에 대한 제안 {0}건을 막는 중",
		"Tu club rechaza las ofertas por ti: sólo la cláusula te saca.": "클럽이 나에 대한 제안을 거절해요: 바이아웃 조항만이 나를 빼낼 수 있어요.",
		"Tu club no te retiene.": "클럽이 나를 붙잡지 않아요.",
		"Si alguien paga lo que pide tu club, te vende.": "누군가 클럽의 요구액을 내면 나를 팔아요.",
		"Hoy tu club no negocia por ti.": "지금은 클럽이 나에 대해 협상하지 않아요.",
		"Tu club te ofrece a quien pregunte.": "클럽이 묻는 누구에게나 나를 내놓아요.",
		"No estás en venta.": "판매 대상이 아니에요.",
		"La directiva dijo NO: no cuentas lo bastante. Puedes volver a pedirlo la temporada que viene.": "이사회의 답은 NO: 아직 비중이 부족해요. 다음 시즌에 다시 요청할 수 있어요.",
		"PEDIR QUE NO ME VENDAN": "판매 금지 요청",
		"¿PEDIR QUE NO TE VENDAN?": "판매 금지를 요청할까요?",
		"Lo decide la directiva, una vez por temporada. Si dice que sí, rechaza las ofertas por ti este año. La cláusula sigue valiendo.": "이사회가 시즌당 한 번 결정해요. 승인하면 올해는 나에 대한 제안을 거절해요. 바이아웃 조항은 여전히 유효해요.",
		"LA DIRECTIVA DICE SÍ": "이사회 승인",
		"LA DIRECTIVA DICE NO": "이사회 거절",
		"Pedir el traspaso te pone en venta y te quita minutos hasta que salgas. La cesión, si no eres titular.": "이적을 요청하면 판매 명단에 오르고, 떠날 때까지 출전 시간이 줄어요. 임대는 선발이 아닐 때만.",

		"Quiere venir: sale sin cláusula (+{0} %).": "오고 싶어 해요: 조항 없이 이적 (+{0} %).",

		"TU OFERTA": "내 제안",
		"OFRECER": "제안",
		"INTENTOS": "시도",
		"PACTADO": "합의",
		"Trato cerrado ({0}). Te queda {1}.": "거래 성사 ({0}). 남은 금액 {1}.",
		"No aceptan. Piden {0}.": "거절했어요. 요구액은 {0}.",

		"NO FIRMAR": "사인 안 함",
		"TE FUISTE SIN FIRMAR": "사인 없이 떠났어요",
		"La valla te vio pasar. Mañana lo contará.": "펜스 앞 팬들이 지나가는 당신을 봤어요. 내일 다 소문낼 거예요.",
		"Cien Firmas": "사인 100장",
		"Firmar 100 autógrafos.": "사인 100장 해주기.",
		"Mil Firmas": "사인 1000장",
		"Firmar 1.000 autógrafos.": "사인 1,000장 해주기.",
		"La Mano de Oro": "황금 손",
		"Firmar 10.000 autógrafos.": "사인 10,000장 해주기.",
		"UN FAN TE PARA": "팬이 멈춰 세움",
		"EN EL AEROPUERTO": "공항에서",
		"EN EL TÚNEL": "터널에서",
		"EN LA CENA": "저녁 식사 중",
		"SEMANA DE DERBI": "더비 주간",
		"{0} AUTÓGRAFOS EN TU CARRERA": "커리어 통산 사인 {0}장",
		"FIRMA EN LA TERMINAL": "터미널에서 사인",
		"El grupo esperó un minuto en la puerta de embarque.": "팀 전체가 탑승구에서 1분을 기다렸어요.",
		"DIRECTO AL AVIÓN": "곧장 비행기로",
		"Ni lo miraste. El grupo llegó puntual.": "쳐다보지도 않았어요. 팀은 제시간에 도착했어요.",
		"EL NIÑO DEL TÚNEL": "터널의 꼬마",
		"Sale al campo de tu mano con tu firma puesta.": "당신 사인을 달고 당신 손을 잡고 입장해요.",
		"LO DEJASTE PLANTADO": "바람맞혔어요",
		"Las cámaras del túnel lo grabaron todo.": "터널 카메라에 전부 찍혔어요.",
		"FIRMA EN LA CENA": "식사 중 사인",
		"A tu pareja se le enfrió el plato.": "연인의 음식이 다 식었어요.",
		"ESTA NOCHE NO": "오늘 밤은 안 돼요",
		"Hoy cenabas con tu pareja. Lo entendió… o casi.": "오늘은 연인과의 저녁이었어요. 이해해 줬어요… 거의.",
		"FIRMASTE AL RIVAL": "상대 유니폼에 사인",
		"Tu firma en la camiseta del rival. Mañana sale en portada.": "상대 팀 유니폼에 내 사인. 내일 1면감이에요.",
		"ESA CAMISETA, NO": "그 유니폼은 안 돼요",
		"Tu grada aplaude que no la firmaras.": "우리 팬들이 사인 안 한 걸 박수로 반겨요.",
		"EL HINCHA DE SIEMPRE": "평생 팬",
		"NO VOLVERÁ": "다시 안 올 거예요",
		"Le firmaste la primera hace {0} temporadas. Sigue aquí.": "{0}시즌 전에 그의 첫 사인을 해줬죠. 아직도 여기 있어요.",
		"Ahora trae a su hijo. Hace {0} temporadas, el niño era él.": "이제 아들을 데려와요. {0}시즌 전엔 그가 그 꼬마였죠.",
		"Te esperó {0} temporadas. No volverá a pedírtelo.": "{0}시즌을 기다렸어요. 다시는 부탁하지 않을 거예요.",
		"EL FOTÓGRAFO": "사진 기사",
		"La foto era con {0}. Tú sólo sujetabas el móvil.": "사진은 {0}의 사진이었어요. 당신은 폰만 들고 있었죠.",
	},


	"descanso_pactado": {
		"PEDIR DESCANSO": "휴식 요청",
		"EL MÍSTER DICE QUE NO": "감독의 답은 NO",
		"Hoy no. Éste es de los que se juegan.": "오늘은 안 돼. 이건 제대로 뛰어야 하는 경기야.",
		"Hoy te necesito. Este partido pesa demasiado.": "오늘은 네가 필요해. 이 경기는 너무 중요해.",
		"Aquí juegan los once de siempre. Tú también.": "여기선 늘 뛰던 11명이 뛴다. 너도야.",
		"Contra éste te quiero en el campo. Juegas.": "이 팀 상대로는 네가 그라운드에 있어야 해. 출전이야.",
		"Me lo pides tú y te lo concedo. ¿Banca por si hace falta, descansas del todo, o al final juegas?": "네가 부탁하니 들어주지. 혹시 몰라 벤치에 있을래, 푹 쉴래, 아니면 그냥 뛸래?",
		"¿JUEGAS O DESCANSAS?": "뛸래, 쉴래?",
		"EL MÍSTER DECIDE": "감독의 결정",
		"Entonces sales de inicio. Que se note que lo querías.": "그럼 선발이다. 뛰고 싶었다는 걸 보여줘.",
		"Te quiero fresco, pero a mano. Si se tuerce, entras.": "쌩쌩하되 가까이 있어. 꼬이면 투입이다.",
		"Descansa. Te quiero entero para lo que viene.": "쉬어. 다음 경기를 위해 몸 아껴둬.",
		"Contra éste no te necesito de inicio y después viene {0}. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "이 팀 상대로는 선발로 필요 없고, 다음은 {0} 경기다. 뛸래, 혹시 몰라 벤치에 있을래, 아니면 쉴래?",
		"Contra éste no te necesito de inicio. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "이 팀 상대로는 선발로 필요 없다. 뛸래, 혹시 몰라 벤치에 있을래, 아니면 쉴래?",
		"BANCA, POR SI HACE FALTA": "벤치 대기",
		"DECISIÓN": "결정",
		"EL MÍSTER QUIERE HABLAR CONTIGO": "감독이 할 말이 있대요",
		"DESCANSAS": "휴식",
		"Te quiere entero para el partido grande que viene.": "감독은 다가올 빅매치를 위해 당신이 온전하길 원해요.",
		"Llegas justo de energía. Hoy no te vistes.": "에너지가 빠듯해요. 오늘은 명단 제외예요.",
		"Contra este rival te guarda. Si el partido se tuerce, entras.": "이 상대에겐 당신을 아껴둬요. 경기가 꼬이면 투입돼요.",
		"DESPUÉS": "다음",
		"EL MÍSTER TE GUARDA": "감독이 아껴둠",
		"Hoy el partido no se juega nada. Sólo entras si se lesiona un compañero.": "오늘 경기는 걸린 게 없어요. 동료가 부상당할 때만 들어가요.",
		"Se mira el global de la eliminatoria.": "합산 스코어로 따져요.",
		"Si el partido se tuerce, el míster te llama.": "경기가 꼬이면 감독이 불러요.",
		"PERDIENDO": "지는 중",
		"EMPATANDO": "비기는 중",
		"GANANDO POR 1": "1골 리드",
		"LO VES DESDE CASA": "집에서 시청",
		"Ganaron sin ti. Llegas entero a lo que viene.": "당신 없이 이겼어요. 다음 경기에 쌩쌩하게 나서요.",
		"Empate sin ti. La prensa pregunta dónde estabas.": "당신 없이 무승부. 언론이 당신은 어디 있었냐고 물어요.",
		"Perdieron sin ti. La prensa pregunta dónde estabas.": "당신 없이 졌어요. 언론이 당신은 어디 있었냐고 물어요.",
		"DÍA LIBRE · LO VES DESDE CASA": "휴일 · 집에서 시청",
		"EL MÍSTER NO TE NECESITA HOY · TE QUEDAS EN LA BANCA": "오늘은 필요 없음 · 벤치 대기",
		"JUEGAS O DESCANSAS": "출전 또는 휴식",
		"POR SI HACE FALTA": "혹시 몰라",
		"DIA LIBRE": "휴일",

		"CLASIFICADOS": "진출",
		"ELIMINADOS": "탈락",
		"AL {0}": "{0} 진출",
		"SIN {0}": "{0} 좌절",
		"FUERA DEL TORNEO": "대회 탈락",
		"Un país entero lo celebra contigo.": "온 나라가 당신과 함께 축하해요.",
		"Un país entero apagó la tele.": "온 나라가 TV를 껐어요.",
	},

	"banca_juego": {
		"CHIN CHAN PU": "가위바위보",
		"BOTELLA DE PIE": "병 세우기",
		"DOMINADAS": "리프팅",
		"CONTRA {0}": "VS {0}",
		"TU COMPAÑERO": "내 동료",
		"¡ELIGE!": "골라!",
		"CHIN": "바위",
		"CHAN": "보",
		"¡PU!": "가위!",
		"¡TUYA!": "승리!",
		"¡SUYA!": "패배!",
		"¡OTRA!": "다시!",
		"¡LANZA!": "던져!",
		"SU TURNO": "상대 차례",
		"¡DE PIE!": "섰다!",
		"¡SE CAE!": "넘어졌다!",
		"¡TOCA!": "탭!",
		"¡GANASTE!": "승리!",
		"Hoy recoge él los conos.": "오늘 콘 정리는 저 친구 몫.",
		"Hoy recoges tú los conos.": "오늘 콘 정리는 내 몫.",
		"Los conos, a medias.": "콘 정리는 반반.",
		"CREAR LIGA": "리그 만들기",
		"UNIRSE": "참가",
		"UNIRSE A UNA LIGA": "리그 참가",
		"TERMINADA": "종료",
		"{0} D": "{0}일",
		"LIGA NO ENCONTRADA": "리그 없음",
		"LIGA LLENA": "리그 만원",
		"DEMASIADAS LIGAS": "리그가 너무 많음",
		"Crea una liga y pasa su código: 28 días, gana quien más sume.": "리그를 만들고 코드를 공유하세요: 28일 동안 가장 많이 쌓은 사람이 우승.",
		"Únete a mi liga de Football Legacy: código {0}": "내 Football Legacy 리그에 들어와: 코드 {0}",
		"Reto de {0}": "{0}의 도전장",
		"Tienes un reto": "도전장이 왔어요",
		"Se acaba pronto: juégalo antes de que venza.": "곧 끝나요: 만료 전에 플레이하세요.",
		"PADRINO": "멘토",
		"Embajador": "홍보대사",
		"Que 3 amigos que invitaste jueguen 10 partidos.": "초대한 친구 3명이 10경기씩 플레이하기.",
		"Fundador": "창립자",
		"Que 10 amigos que invitaste jueguen 10 partidos.": "초대한 친구 10명이 10경기씩 플레이하기.",
		"~{0} BALONES": "공 ~{0}개",
		"+{0} SUELDO": "주급 +{0}",
		"+1 BALÓN EN CASA": "집에 공 +1",
		"-1 BALÓN EN CASA": "집에 공 -1",
		"DESDE CERO": "처음부터",
		"CON TU CARRERA": "내 커리어로",
		"Sólo cuenta una carrera que empieces después de crearla.": "리그를 만든 뒤 시작한 커리어만 집계돼요.",
		"Cuenta lo que sumes desde hoy con tu carrera.": "오늘부터 내 커리어로 쌓은 것을 집계해요.",
		"Empieza una carrera nueva para contar en esta liga.": "이 리그에 집계되려면 새 커리어를 시작하세요.",
		"Podio": "포디움",
		"Acabar entre los 3 primeros de una liga de amigos.": "친구 리그에서 3위 안에 들기.",
		"Campeón de liga": "리그 우승",
		"Ganar una liga de amigos.": "친구 리그 우승하기.",
		"Tricampeón": "3회 우승",
		"Ganar 3 ligas de amigos.": "친구 리그 3번 우승하기.",
		"OTRA TEMPORADA": "새 시즌",
		"Liga {0}: último día": "리그 {0}: 마지막 날",
		"Vas {0}º. Aún puedes remontar.": "현재 {0}위. 아직 역전할 수 있어요.",
		"Aún puedes sumar antes del final.": "끝나기 전에 아직 더 쌓을 수 있어요.",

		"PECHO Y VOLEA": "가슴 트래핑 발리",
		"¡CLAVADO!": "완벽!",
		"¡CONTROL!": "컨트롤!",
		"¡SE TE ESCAPA!": "놓쳤다!",
		"¡DESLIZA HACIA ÉL!": "그쪽으로 스와이프!",
		"TOCA EN EL ARO": "링을 탭",
		"¡AL PIE!": "발밑으로!",
		"¡CON ROSCA!": "감아서!",
		"¡CORTO!": "짧아!",
		"¡LARGO!": "길어!",
		"¡DESVIADO!": "빗나감!",
		"CONTROL Y VOLEA": "트래핑 발리",
		"¡GLOBO!": "로빙!",
		"PULSA {0} EN EL ARO": "링에서 {0} 누르기",
		"STICK: APUNTA · {0}: GLOBO": "스틱: 조준 · {0}: 로빙",
		"EL 1-7": "그 7-1",
		"Juega con una de las dos selecciones contra la otra.": "두 대표팀 중 하나로 다른 팀과 맞붙어요.",
		"EL TREN": "기차",
		"Un gol en una final: te tiras en plancha y detrás de ti se tiran los cuatro más cerca, uno a uno, cada uno a los pies del de delante.": "결승전 골: 배로 미끄러지면 가장 가까운 동료 4명이 하나씩 뒤따라 앞사람 발치로 몸을 날려요.",
		"EL CORRO": "둥근 원",
		"Con el vestuario a tu lado: tus compañeros te rodean aplaudiendo y tú festejas en medio.": "라커룸이 내 편: 동료들이 박수 치며 둘러싸고, 당신은 한가운데서 세리머니해요.",
		"LA OREJA": "귀 쫑긋",
		"Tu grada te está cantando: te giras hacia ella con las manos en las orejas y la grada se viene abajo. Sólo delante de los tuyos.": "관중석이 내 이름을 노래해요: 그쪽으로 돌아 귀에 손을 대면 관중석이 뒤집어져요. 홈 팬 앞에서만.",
		"LA MANO DE DIOS": "신의 손",
		"EL GOL FANTASMA": "유령 골",
		"LA MANO EN LA LÍNEA": "골라인 핸드볼",
		"EL PENAL AL CIELO": "하늘로 간 PK",
		"EL MINUTO 116": "116분",
		"FUE CON LA MANO": "핸드볼이었다",
		"NO LO DIERON": "노골 판정",
		"ESTAMPAS LUNA": "ESTAMPAS LUNA",
		"CEREALES ALBA": "CEREALES ALBA",
		"AUTOCARES ATLAS": "AUTOCARES ATLAS",
		"PIXEL ARENA": "PIXEL ARENA",
		"Tu cara en el álbum del barrio. Cada gol, un sobre más.": "동네 앨범 속 내 얼굴. 골마다 카드 팩 하나 더.",
		"Tu cara en la caja del desayuno. Pagan fijo y piden poco.": "아침 시리얼 상자 속 내 얼굴. 고정 금액에 요구는 적어요.",
		"Tu cara recorre la ciudad en el autobús. Si no juegas, no ruedas.": "버스를 타고 도시를 도는 내 얼굴. 경기에 안 나가면 버스도 안 굴러가요.",
		"La portada del videojuego del año. Cada gol tuyo vende una copia más.": "올해의 게임 표지. 내 골 하나에 한 장씩 더 팔려요.",
		"TU ESTAMPA": "내 카드",
		"TU CARA EN LA CAJA": "상자 속 내 얼굴",
		"TU CARA EN LA RUTA": "버스 속 내 얼굴",
		"TU PORTADA": "내 표지",
		"DESAYUNO DE CAMPEÓN": "챔피언의 아침",
		"Tres sobres y ya te tenían repetido. Te cambian por dos.": "팩 3개 만에 벌써 중복이었어요. 두 장에 바꿔 가요.",
		"Medio barrio desayuna contigo. El otro medio, con la competencia.": "동네 절반은 당신과 아침을 먹어요. 나머지 절반은 경쟁자와.",
		"Doce metros de cara. Y para cada parada, en todas las rutas.": "12미터짜리 얼굴. 모든 노선, 모든 정류장마다.",
		"La cola da la vuelta a la manzana. Dentro del juego también eres tú.": "줄이 한 블록을 돌아요. 게임 속 그 선수도 당신이에요.",
	},
}
