extends RefCounted














































const DOMAINS: Dictionary = {



	"trueno_himno": {
		"GOLEADA": "GOL ŞOV",
		"¡HUH!": "HUH!",
		"¡CON EL BOMBO!": "DAVULLA!",
		"¡DESCUADRE!": "KAÇTI!",
		"¡TRUENO!": "GUMBUR!",
		"SE DESCUADRO": "DAGILDI",
		"goleada": "gol şov",
		"palmas": "alkış",
		"La grada entera, a tu compás.": "Bütün tribün senin ritminde.",
		"Las palmas se fueron cada una por su lado.": "Alkışlar her biri bir yana dağıldı.",
		"EL TRUENO": "GUMBUR",
		"EL APRETON": "TOKALAŞMA",
		"EL HIMNO": "MARŞ",
		"A TU LADO: {0}": "YANINDA: {0}",
		"EN DIRECTO": "CANLI",
		"RISA": "GULME",
		"AGUANTA": "DAYAN",
		"¡TE BUSCA!": "DIKKAT!",
		"¡REVIENTAS!": "PATLADIN!",
		"¡LA TELE!": "KAMERA!",
		"¡JA, JA!": "HA HA!",
		"¡PILLADO!": "YAKALANDIN!",
		"¡AGUANTASTE!": "DAYANDIN!",
		"Todo el país te ha visto reírte en pleno himno.": "Bütün ülke seni marş sırasında gülerken gördü.",
		"Cara de piedra con todo el país mirando.": "Bütün ülke izlerken taş gibi bir surat.",
		"El Trueno": "Gök Gürültüsü",
		"Llevar a la grada entera hasta el redoble tras una goleada en casa.": "İç sahada farklı bir galibiyetin ardından bütün tribünü son davul vuruşuna kadar götür.",
		"Aguantar el himno sin reírte con la tele delante.": "Kamera karşısında gülmeden marşı bitir.",
		"Pillado en Directo": "Canlı Yayında Yakalandı",
		"Que la tele te pille riéndote durante el himno.": "Marş sırasında gülerken kameraya yakalan.",
		"Tras una goleada en casa, la grada espera a que alguien marque el compás.": "İç sahada farklı bir galibiyetten sonra tribün, ritmi birinin tutturmasını bekler.",
		"Con tu selección, el himno se canta serio... aunque el de al lado no ayude.": "Milli takımda marş ciddiyetle söylenir... yanındaki yardım etmese bile.",
		"Con tu selección, ojo con quién tienes al lado cuando suena el himno.": "Milli takımda marş çalarken yanında kim var, dikkat et.",
		"El Míster Aún Sabe": "Hoca Hâlâ Usta",
		"Que tu técnico baje de pecho un balón fuera y se la dé al que saca de banda.": "Teknik direktörün taca çıkan topu göğsüyle indirip taç atışını kullanacak oyuncuya versin.",
		"Cuando el balón sale por tu banquillo, a veces el míster no se resiste.": "Top yedek kulübenin önünden dışarı çıkınca hoca bazen dayanamaz.",
		"¡PENAL!": "PENALTI!",
		"NO ERA PENAL": "PENALTI DEGILDI",
		"{0} NO LO OLVIDA": "{0} UNUTMADI",
		"¡ESE NO ES!": "BU DEGIL!",
		"EL MARACANAZO": "MARACANAZO",
		"EL CABEZAZO": "KAFA ATMA",
		"LA PRÓRROGA DE RÍO": "RIO'DA UZATMA",
		"LOS PENALES DE DOHA": "DOHA PENALTILARI",
		"EL GOL DE ORO": "ALTIN GOL",
		"GOL DE ORO": "ALTIN GOL",
		"DOS EN EL DESCUENTO": "UZATMADA IKI GOL",
		"EL ÚLTIMO SUSPIRO": "SON NEFES",
		"LA VUELTA DE ÁMSTERDAM": "AMSTERDAM ROVANŞI",
		"LA MANITA": "BEŞLIK",
		"ROJA DIRECTA": "DIREKT KIRMIZI",
		"EN LOS PENALES": "PENALTILARLA",
		"ESTABA ADELANTADO": "OFSAYTTAYDI",
		"LA CHILENA": "ROVEŞATA",
		"LA GRADA APLAUDE": "TRIBUN ALKIŞLIYOR",
		"Cara de Piedra": "Taş Surat",
	},


	"mando_f2": {
		"IZQUIERDA · AJUSTA EL STICK": "SOL · ANALOGU AYARLA",
		"DERECHA · AJUSTA EL STICK": "SAG · ANALOGU AYARLA",
		"mandoCRUZ": "ÇARPI",
		"mandoCÍRCULO": "DAIRE",
		"mandoCUADRADO": "KARE",
		"mandoTRIÁNGULO": "UÇGEN",
		"Stick izquierdo para moverte · llega al balón y remata": "Hareket için sol analog · vurmak için topa ulaş",
		"Con mando se juega en horizontal: {0} > {1} > {2}": "Kumandayla yatay oynanır: {0} > {1} > {2}",
		"MANTÉN {0} Y SUELTA": "{0} BASILI TUT, BIRAK",
		"Apunta con el stick y mantén {0}. Más carga, más fuerte.": "Analogla nişan al ve {0} tuşunu basılı tut. Daha çok güç, daha sert.",
		"PULSA {0} PARA CONTINUAR": "DEVAM IÇIN {0}",
		"PULSA {0} PARA JUGAR": "{0} ILE OYNA",
		"El coche acelera solo. Gira con el stick y frena con {0}.": "Araba kendi hızlanır. Analogla dön, {0} ile fren yap.",
		"Pulsa {0} para saltar": "Geçmek için {0} tuşuna bas",
		"CENTRO · apunta y pulsa {0}": "ORTA · nişan al ve {0} tuşuna bas",
		"Apunta con el stick · pulsa {0}": "Analogla nişan al · {0} tuşuna bas",
		"Pulsa {0} para continuar": "Devam etmek için {0} tuşuna bas",
		"Mueve un stick para seguir": "Sürdürmek için bir analoğu oynat",
		"PULSA {0} PARA EMPEZAR": "{0} ILE BAŞLA",
		"CABEZAZO · jala el stick derecho y suelta": "KAFA · sağ analoğu çek ve bırak",
		"Empuja el stick izquierdo y corres hacia donde lo empujas. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Sol analoğu it, ittiğin yöne koşarsın. Bırak, anında durursun. Topu kırmızı diske götür: üstüne basınca söner ve sıradaki yanar, hep öbür tarafta. Top sürmek nereye gideceğini seçmektir, dümdüz koşmak değil.",
		"Dos sticks: el izquierdo conduce y el derecho tira. Jala el derecho hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltarlo, apunta al balón con el izquierdo y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "İki analog: sol top sürer, sağ şut çeker. Sağı sapan gibi geri çek: kılavuz ileriyi gösterir. Bırakınca sol ile topa nişan al ve {0} tuşuna bas — vurduğun yer belirler. İlk seferde top bölgelere boyanır: üstü yerden ve yavaş gider, altı yükselip düşer, yanları falso verir. Kenara ne kadar yakınsan güç o kadar az: füze ortadan çıkar.",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: {2} gira la vista a la banda y te enseña a los compañeros; otra vez y vuelve.": "Pas tuşu yok: pas vermek bir arkadaşına nişan alıp ŞUT ÇEKMEKTIR ve topu kim önce ulaşırsa o alır. İki arkadaşın var: biri ceza sahası dışında, biri içinde. Pasın ceza sahası dışına düşerse topu alanla oynamaya geçersin. İçine düşerse kontrol yok: direkt vurur. Onları görmek için: {2} kamerayı taç çizgisine döndürür ve arkadaşlarını gösterir. Bir kez daha, geri gelir.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con el stick izquierdo y tira con el derecho cuando lo veas.": "Rakipler üstünde ve saha önünde: topu sür ve rakip yarı sahaya GEÇ — parlayan çizgiye kadar şut yok, çalım var, ve ilerlediğin her bölümde önüne yeni oyuncular çıkar. Sonra bire bir: sol analogla topu sür, fırsatı görünce sağ ile vur.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el botón TIRO/CENTRO de la pantalla. Para cambiar entre CENTRO (colgado) y TIRO (raso), pulsa {1} mientras apuntas. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "Bunlar ORTA: top ceza sahasına havadan gönderilir. Korner zaten ORTA olarak başlar; ekrandaki ŞUT/ORTA düğmesi bunu söyler. ORTA (havadan) ve ŞUT (yerden) arasında geçiş için nişan alırken {1} tuşuna bas. Kaleyi değil, bir takım arkadaşının kafasını ara. Bitirirken kanat değiştirme: aynı servis, ama öbür uçtaki boş arkadaşı bularak.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con el stick izquierdo, pásala con el derecho a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "Kendi yarı sahanda topla başlıyorsun, kale çok uzakta. Sol analogla top sür, sağ ile bir arkadaşına pas ver ve devam et: pas şut gibi vurulur ve topu alanla oynarsın. İlerlemeden geride kalırsan rakip baskıyı artırır. Sonra bire bir: fırsatı görünce şut çek.",
		"Con {1} cambias entre CENTRO y TIRO.": "{1} ORTA ile ŞUT arasında geçiş yapar.",
		"Apunta al área y aguanta el stick.": "Ceza sahasına nişan al ve analoğu tut.",
		"Sueltas, apuntas y pulsas {0}.": "Bırak, nişan al ve {0} tuşuna bas.",
		"Stick izquierdo para conducir; jala el derecho y suelta para tirar": "Sol analogla top sür; şut için sağı çek ve bırak",
		"Stick izquierdo para conducir; no se tira": "Sol analogla top sür; şut yok",
		"Stick izquierdo para conducir; apunta con el derecho a un compañero y suelta": "Sol analogla top sür; sağ ile bir arkadaşına nişan al ve bırak",
		"Mientras apuntas, {0} elige compañero y {1} cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.": "Nişan alırken {0} bir takım arkadaşı seçer, {1} talimatını değiştirir. Mavi kaleye koşar, kehribar yerinde kalır, eflatun adamını peşinden sürükler.",
		"STICK DERECHO: CÁMARA · {0}/{1}: BUSCAR · {2}/{3}: RITMO": "SAG ÇUBUK: KAMERA · {0}/{1}: SAR · {2}/{3}: HIZ",
		"LB ALTERNA": "LB GEÇIŞ",
		"¿SALIR DEL JUEGO?": "OYUN KAPANSIN MI?",
		"MUEVE EL STICK PARA GIRAR": "DONMEK IÇIN ANALOGU OYNAT",
		"PULSA {0} PARA OTRA": "TEKRAR IÇIN {0}",
		"Mueve la pala con el stick. {0} para sacar.": "Raketi analogla oynat. Servis için {0}.",
		"Pulsa {0} para firmar": "İmzalamak için {0} bas",
		"Gira el campo con el stick derecho. Los esquemas son de consulta.": "Sahayı sağ çubukla döndür. Dizilişler sadece inceleme içindir.",
		"Apunta con WASD · pulsa {0}": "WASD ile nişan al · {0} tuşuna bas",
		"WASD para moverte · llega al balón y remata": "WASD ile hareket et · topa ulaş ve vur",
		"Pulsa WASD o una flecha para seguir": "Sürdürmek için WASD veya bir ok tuşuna bas",
		"CABEZAZO · mantén una flecha y suelta": "KAFA · bir ok tuşunu basılı tut ve bırak",
		"HAZ CLIC PARA CONTINUAR": "DEVAM IÇIN TIKLA",
		"HAZ CLIC EN EL ARO": "POTAYA TIKLA",
		"¡ARRASTRA HACIA ÉL!": "ONA DOGRU SURUKLE!",
		"Arrastra para girar el campo. Los esquemas son de consulta.": "Sahayı döndürmek için sürükle. Şemalar yalnızca bilgi içindir.",
		"El coche acelera solo. Gira con las flechas y frena con la de abajo.": "Araba kendiliğinden hızlanır. Oklarla dön, aşağı okla fren yap.",
		"Arrastra el balón hacia la canasta. Más rápido, más fuerte.": "Topu potaya doğru sürükle. Ne kadar hızlı, o kadar sert.",
		"ARRASTRA HACIA LA CANASTA": "POTAYA SURUKLE",
		"HAZ CLIC PARA OTRA": "TIKLA: BIR DAHA",
		"USA LAS FLECHAS PARA GIRAR": "DONMEK IÇIN OKLARI KULLAN",
		"Arrastra hacia el aro y suelta.": "Potaya doğru sürükle ve bırak.",
		"Mantén una flecha y suelta para tirar": "Bir ok tuşunu basılı tut ve şut için bırak",
		"Mantén una flecha y suelta para centrar": "Bir ok tuşunu basılı tut ve ortalamak için bırak",
		"teclaESPACIO": "BOŞLUK",
		"teclaMAYÚS": "SHIFT",
		"Con WASD corres hacia donde pulsas. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "WASD ile bastığın yöne koşarsın. Bırak, anında durursun. Topu kırmızı diske götür: üstüne basınca söner ve sıradaki yanar, hep öbür tarafta. Top sürmek nereye gideceğini seçmektir, düz koşmak değil.",
		"WASD conduce y las flechas tiran. Mantén una flecha, como una resortera: la guía apunta al lado contrario. Al soltarla, apunta al balón con WASD y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "WASD top sürer, ok tuşları şut çeker. Bir ok tuşunu sapan gibi basılı tut: kılavuz ters tarafı gösterir. Bırakınca WASD ile topa nişan al ve {0} tuşuna bas — vurduğun yer belirler. İlk seferde top bölgelere boyanır: üstü yerden ve yavaş gider, altı yükselip düşer, yanları falso verir. Kenara ne kadar yakınsan güç o kadar az: füze ortadan çıkar.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con WASD y tira con las flechas cuando lo veas.": "Rakipler üstünde ve saha önünde: topu sür ve rakip yarı sahaya GEÇ — yanan çizgiye kadar şut çekilmez, çalım atılır, ilerlediğin her bölümde karşına yeni oyuncular çıkar. Sonra birebir: WASD ile top sür, görünce ok tuşlarıyla şut çek.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con WASD, pásala con las flechas a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "Kendi yarı sahanda topla başlıyorsun, kale uzakta. WASD ile top sür, ok tuşlarıyla bir takım arkadaşına pas ver ve devam et: pas şut gibi vurulur ve onu alan oyuncuyla oynarsın. İlerlemeden geride kalırsan rakip bastırır. Sonra birebir: görünce şut çek.",
		"Sueltas, apuntas con WASD y pulsas {0}.": "Bırak, WASD ile nişan al ve {0} tuşuna bas.",
		"Apunta al área y aguanta la flecha.": "Ceza sahasına nişan al ve ok tuşunu basılı tut.",
		"WASD para conducir; mantén una flecha y suelta para tirar": "WASD ile top sür; bir ok tuşunu basılı tut ve bırakıp şut çek",
		"WASD para conducir; no se tira": "WASD ile top sür; şut yok",
		"WASD para conducir; mantén una flecha hacia un compañero y suelta": "WASD ile top sür; takım arkadaşı yönünde bir ok tuşunu basılı tut ve bırak",
		"PULSA LAS TECLAS O HAZ CLIC": "TUŞLARA BAS YA DA TIKLA",
		"LA PARTIDA ESTÁ GUARDADA": "OYUN KAYDEDILDI",
		"SE PIERDE PARA SIEMPRE": "SONSUZA DEK KAYBOLUR",
		"NO HAY VUELTA ATRÁS": "GERI DONUŞ YOK",
		"SALIR DEL PARTIDO": "MAÇTAN ÇIK",
		"¿SALIR DEL PARTIDO?": "MAÇTAN ÇIKILSIN MI?",
		"¿REINICIAR EL PARTIDO?": "MAÇ YENIDEN BAŞLASIN MI?",
		"¿{0}?": "{0}?",
		"APUNTA Y TIRA": "NIŞAN AL, ŞUT AT",
		"GOLPEA": "VUR",
		"TIRO O CENTRO": "ŞUT YA DA ORTA",
		"CANCELA": "IPTAL",
		"ORDENA": "ÇAGIR",
		"COMPAÑERO U OBJETIVO": "TAKIM ARK./HEDEF",
		"MANTIENE": "TUT",
		"CÁMARA": "KAMERA",
		"SE PIERDE LO JUGADO": "OYNANAN KAYBOLUR",
		"EL PARTIDO QUEDA POR JUGAR": "MAÇ OYNANMAMIŞ KALIR",
		"VUELVES AL 0' CON LA MISMA ENERGÍA": "AYNI ENERJIYLE 0' A DONERSIN",
		"SE PIERDEN LAS ESTRELLAS": "YILDIZLAR KAYBOLUR",
		"MUEVE": "HAREKET",
		"A/B NINTENDO": "NINTENDO A/B",
		"CORRE Y TIRA": "KOŞ VE ŞUT AT",
		"Mantén {0} para correr · cruza al campo rival": "Koşmak için {0} basılı tut · rakip yarı sahaya geç",
		"Mantén {0} para correr · lleva el balón a la zona roja": "Koşmak için {0} basılı tut · topu kırmızı bölgeye götür",
		"Empuja el stick izquierdo y vas al paso hacia donde lo empujas; mantén {3} y corres. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Sol analoğu it, ittiğin yöne yürürsün; {3} tuşunu basılı tut, koşarsın. Bırak, anında durursun. Topu kırmızı diske götür: üstüne basınca söner ve sıradaki yanar, hep öbür tarafta. Top sürmek nereye gideceğini seçmektir, düz koşmak değil.",
		"Con WASD vas al paso hacia donde pulsas; mantén {3} y corres. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "WASD ile bastığın yöne yürürsün; {3} tuşunu basılı tut, koşarsın. Bırak, anında durursun. Topu kırmızı diske götür: üstüne basınca söner ve sıradaki yanar, hep öbür tarafta. Top sürmek nereye gideceğini seçmektir, düz koşmak değil.",
		"Empuja este stick hacia el disco; con {3}, corres.": "Bu analoğu diske doğru it; {3} ile koşarsın.",
		"Pulsa WASD y vas al disco; con {3}, corres.": "WASD'ye bas, diske gidersin; {3} ile koşarsın.",
		"CANCELA O PAUSA": "IPTAL VEYA DUR",
		"CORRE": "KOŞ",
	},


	"previa_pases": {
		"MÁXIMO GOLEADOR": "GOL KRALI",
		"MÁXIMO ASISTENTE": "ASIST KRALI",
		"{0} EN GOLEO": "GOLCULERDE {0}",
	},

	"amigos": {
		"AMIGOS": "DOSTLAR",
		"TABLA": "TABLO",
		"TU CÓDIGO": "KODUN",
		"INVITAR": "DAVET",
		"TÍTULOS": "KUPALAR",
		"{0} AÑOS · TEMPORADA {1}": "{0} YAŞ · SEZON {1}",
		"HACE {0} D": "{0} G ONCE",
		"Vista previa: amigos de ejemplo": "Önizleme: örnek arkadaşlar",
		"AGREGAR AMIGO": "ARKADAŞ EKLE",
		"AGREGAR": "EKLE",
		"CÓDIGO NO ENCONTRADO": "KOD BULUNAMADI",
		"ES TU CÓDIGO": "BU SENIN KODUN",
		"SIN CONEXIÓN": "BAGLANTI YOK",
		"Amigo agregado.": "Arkadaş eklendi.",
		"Juega Football Legacy conmigo: {0} · código {1}": "Football Legacy'yi benimle oyna: {0} · kod {1}",
		"Invitación copiada.": "Davet kopyalandı.",
		"¿SALIR DE LA LIGA?": "LIGDEN ÇIK?",
		"Si vuelves, empiezas de 0.": "Geri dönersen 0'dan başlarsın.",
		"No podrás volver.": "Geri dönemezsin.",
		"Empieza una carrera para compararte.": "Kendini kıyaslamak için bir kariyere başla.",
		"{0} fichó por {1}": "{0}, {1} takımına transfer oldu",
		"{0} ganó la liga": "{0} ligi kazandı",
		"{0} se lesionó: {1} semanas": "{0} sakatlandı: {1} hafta",
		"{0} subió a {1} de media": "{0}, {1} genele yükseldi",
		"{0} llegó a {1} goles": "{0}, {1} gole ulaştı",
		"{0} ganó el premio al Jugador del Año": "{0} Yılın Oyuncusu ödülünü kazandı",
		"VER CASA": "EVI GOR",
		"CASA DE {0}": "EV: {0}",
		"AÚN NO HAY CASA": "HENUZ EV YOK",
		"TU CALLE": "SOKAGIN",
		"VECINOS": "KOMŞULAR",
		"apodoCAÑÓN": "TOPÇU",
		"apodoRAYO": "YILDIRIM",
		"apodoCOHETE": "ROKET",
		"apodoTANQUE": "TANK",
		"apodoMURO": "DUVAR",
		"apodoTORNADO": "KASIRGA",
		"apodoTITÁN": "TITAN",
		"apodoLEÓN": "ASLAN",
		"apodoTIBURÓN": "KOPEKBALIGI",
		"apodoHALCÓN": "ŞAHIN",
		"apodoLOBO": "KURT",
		"apodoTORO": "BOGA",
		"apodoMAGO": "BUYUCU",
		"apodoCÓNDOR": "KONDOR",
		"apodoTRUENO": "TUFAN",
		"apodoVOLCÁN": "YANARDAG",
		"apodoDE ORO": "ALTIN",
		"apodoDE ACERO": "ÇELIK",
		"apodoDE FUEGO": "ATEŞ",
		"apodoDE HIELO": "BUZ",
		"apodoDEL SUR": "GUNEYLI",
		"apodoDEL NORTE": "KUZEYLI",
		"apodoDEL BARRIO": "MAHALLE",
		"apodoDEL ÁREA": "GOLCU",
		"apodoDE PLATA": "GUMUŞ",
		"apodoDE LEYENDA": "EFSANE",
		"apodoIMPARABLE": "DURDURULAMAZ",
		"apodoVELOZ": "HIZLI",
		"apodoLETAL": "OLUMCUL",
		"apodoSALVAJE": "VAHŞI",
		"apodoSIN FRENO": "FRENSIZ",
		"apodoDE MEDIANOCHE": "GECEYARISI",
		"apodo{0} {1} {2}": "{1} {0} {2}",
		"ELIGE TU NOMBRE": "ADINI SEÇ",
		"ESCRIBE TU NOMBRE": "ADINI YAZ",
		"Lo ven todos. Un nombre ofensivo se puede denunciar.": "Herkes görür. Saldırgan bir isim şikâyet edilebilir.",
		"MÁXIMO 16 LETRAS": "EN FAZLA 16 HARF",
		"SÓLO LETRAS Y NÚMEROS": "SADECE HARF VE RAKAM",
		"MÍNIMO 2 LETRAS": "EN AZ 2 HARF",
		"ESE NOMBRE NO SE PUEDE USAR": "BU ISIM KULLANILAMAZ",
		"OCULTAR SU NOMBRE": "ADINI GIZLE",
		"MOSTRAR SU NOMBRE": "ADINI GOSTER",
		"DENUNCIAR": "ŞIKAYET ET",
		"AMIGOS crea un perfil anónimo y sube tu carrera y tu apodo para rankings y retos.": "DOSTLAR anonim bir profil oluşturur; sıralamalar ve düellolar için kariyerini ve takma adını yükler.",
		"Tolerancia cero con apodos ofensivos o abusivos.": "Saldırgan veya taciz edici takma adlara sıfır tolerans.",
		"AHORA NO": "ŞIMDI DEGIL",
		"BORRAR MI CUENTA": "HESABIMI SIL",
		"¿BORRAR TU CUENTA?": "HESABIN SILINSIN MI?",
		"Se borran del servidor tu perfil, amigos, retos, ligas, ranking y casa. Tu carrera en este dispositivo no se toca.": "Profilin, arkadaşların, düelloların, ligların, sıralaman ve evin sunucudan silinir. Bu cihazdaki kariyerine dokunulmaz.",
		"Cuenta borrada.": "Hesap silindi.",
		"No se pudo borrar. Revisa tu conexión e inténtalo luego.": "Silinemedi. Bağlantını kontrol et ve daha sonra tekrar dene.",
		"QUITAR AMIGO": "ARKADAŞI ÇIKAR",
		"¿QUITAR AMIGO?": "ARKADAŞ ÇIKARILSIN MI?",
		"¿DENUNCIAR?": "ŞIKAYET EDILSIN MI?",
		"Deja de ser tu amigo y se oculta su nombre.": "Artık arkadaşın olmaz ve adı gizlenir.",
		"Deja de ser tu amigo.": "Artık arkadaşın olmaz.",
		"Queda bloqueado: no vuelve a aparecer en AMIGOS.": "Engellendi: DOSTLAR bölümünde bir daha görünmez.",
		"BLOQUEAR": "ENGELLE",
		"Al aceptar, aceptas estas normas: tolerancia cero con el contenido ofensivo y con los usuarios abusivos. Lo denunciado se oculta y la cuenta se expulsa.": "Kabul ederek bu kurallara uymayı kabul edersin: saldırgan içeriğe ve taciz eden kullanıcılara sıfır tolerans. Şikâyet edilen gizlenir ve hesap atılır.",
		"cocheSUBIR": "BIN",
		"BAJAR": "IN",
		"FRENO": "FREN",
		"KM/H": "KM/SA",
		"R": "R",
		"ACELERA": "GAZ",
	},


	"amigos_retos": {
		"RETOS": "DUELLO",
		"RETO": "DUELLO",
		"RETAR": "DUELLO",
		"RETAR A UN AMIGO": "DOSTA MEYDAN OKU",
		"JUGADAS": "ŞUTLAR",
		"{0} JUGADAS": "{0} ŞUT",
		"{0} · {1} JUGADAS": "{0} · {1} ŞUT",
		"TE TOCA": "SIRAN",
		"ESPERANDO": "BEKLIYOR",
		"ENVIANDO": "GIDIYOR",
		"CADUCADO": "BITTI",
		"QUEDAN {0} H": "{0} SA KALDI",
		"QUEDAN {0} D": "{0} G KALDI",
		"Sin conexión: lo último guardado": "Bağlantı yok: son kaydedilen",
		"+{0} ★ por amigo que juegue 10 partidos": "10 maç oynayan her arkadaş için +{0} ★",
		"+{0} ★ por invitar amigos": "Arkadaş davetine +{0} ★",
		"Aún no hay novedades de tus amigos.": "Arkadaşlarından henüz haber yok.",
		"Reta a un amigo: mismas jugadas para los dos, gana quien marque más.": "Bir arkadaşına meydan oku: ikinize aynı şutlar, en çok gol atan kazanır.",
		"Agrega un amigo para retarlo.": "Meydan okumak için bir arkadaş ekle.",
		"Reto enviado.": "Düello gönderildi.",
		"Sólo vale el primer intento. Si sales, cuenta lo que lleves.": "Sadece ilk denemen sayılır. Çıkarsan o ana kadarki skorun geçerli olur.",
		"Marca guardada. El resultado sale cuando juegue tu amigo.": "Skorun kaydedildi. Sonuç, arkadaşın oynayınca çıkar.",
		"SALIR DEL RANKING": "SIRALAMADAN ÇIK",
		"ENTRAR EN EL RANKING": "SIRALAMAYA GIR",
		"DEMASIADOS RETOS HOY": "BUGUN FAZLA DUELLO",

		"EN GRUPO": "GRUP",
		"RETO EN GRUPO": "GRUP DUELLOSU",
		"ELIGE AL MENOS 2 AMIGOS": "EN AZ 2 ARKADAŞ SEÇ",
		"PUESTO {0} DE {1}": "SIRA {0} / {1}",
		"Las marcas de los demás se ven al terminar la tuya.": "Diğerlerinin skorları seninki bitince görünür.",
		"Agrega al menos dos amigos para un reto en grupo.": "Grup düellosu için en az iki arkadaş ekle.",
		"Marca guardada. El resultado sale cuando jueguen todos.": "Skorun kaydedildi. Sonuç, herkes oynayınca çıkar.",
		"YA NO ES TU AMIGO": "ARKADAŞIN DEGIL",
		"YA LO JUGASTE": "ZATEN OYNADIN",
		"RETO CADUCADO": "DUELLO BITTI",
		"{0} ganó un título": "{0} bir kupa kazandı",
		"{0} ganó un premio individual": "{0} bireysel ödül kazandı",
		"{0} colgó las botas": "{0} kramponlarını astı",
		"Guante Lanzado": "Meydan Okuma",
		"Jugar tu primer reto contra un amigo.": "Bir arkadaşına karşı ilk düellonu oyna.",
		"El Pique": "Hava Atma Hakkı",
		"Ganar un reto a un amigo.": "Bir arkadaşına karşı düello kazan.",
		"Rey del Barrio": "Mahallenin Kralı",
		"Ganar 10 retos a tus amigos.": "Arkadaşlarına karşı 10 düello kazan.",
		"Pleno": "Kusursuz Tur",
		"Marcar todas en un reto de 10 o 15 jugadas.": "10 ya da 15 şutluk bir düelloda hepsini gole çevir.",
		"Padrino": "Akıl Hocası",
		"Que un amigo que invitaste juegue 10 partidos.": "Davet ettiğin bir arkadaş 10 maç oynasın.",
		"Cazatalentos": "Yetenek Avcısı",
		"Que 5 amigos que invitaste jueguen 10 partidos.": "Davet ettiğin 5 arkadaş 10 maç oynasın.",
	},

	"amigos_carreras": {
		"{0} CARRERAS": "{0} KARIYER",
		"SU JUGADOR": "OYUNCUSU",
		"JUEGAS CON": "OYUNCUN",
	},


	"logros_hito": {
		"Oro Precoz": "Erken Altın",
		"Ganar el Balón de Oro antes de cumplir 19 años.": "19 yaşına girmeden Yılın Oyuncusu ödülünü kazan.",
		"Triplete": "Üçleme",
		"Liga, copa y tu gran copa continental en la misma temporada.": "Aynı sezonda lig, kupa ve en büyük kıta kupan.",
		"Último Baile": "Son Dans",
		"Levantar un título en tu temporada de retiro.": "Emeklilik sezonunda bir kupa kaldır.",
		"De la Nada": "Sıfırdan Zirveye",
		"Debutar en Tercera y ganar la liga de Primera en la misma carrera.": "Üçüncü ligde ilk maçına çık ve aynı kariyerde birinci ligi kazan.",
		"Álbum de un Continente": "Bir Kıtanın Albümü",
		"Completar en la VITRINA todas las ligas y copas de una confederación.": "Bir konfederasyonun tüm lig ve kupalarını VITRIN'de tamamla.",
		"La Vitrina Completa": "Tam Vitrin",
		"Completar el álbum de la VITRINA al 100 %.": "VITRIN albümünü %100 tamamla.",
		"Sextete": "Altı Kupa",
		"Seis títulos con tu club en doce meses.": "On iki ayda kulübünle altı kupa.",
		"Desde la Primera Ronda": "İlk Turdan",
		"Ganar una copa de Europa entrando por la primera ronda previa.": "İlk eleme turundan girerek bir Avrupa kupası kazan.",
	},


	"vitrina_album": {
		"NACIONAL": "ULUSAL",
		"Ganado {0} veces.": "{0} kez kazanıldı.",
		"Trofeo por ganar. Sigue jugando tu carrera.": "Kazanılacak kupa. Kariyerini oynamaya devam et.",
	},






	"grada_tifos": {
		"EL TIFO DEL DERBI": "DERBI TIFOSU",
		"La peña está pintando las cartulinas para el derbi contra {0} y te pregunta si pones el dinero. Si lo pones, el domingo la curva levanta tu número.": "Taraftar derneği {0} karşısındaki derbi için kartonları boyuyor ve parayı senin verip vermeyeceğini soruyor. Verirsen pazar günü tribün senin numaranı kaldıracak.",
		"PAGAR EL TIFO": "TIFOYU ODE",
		"QUE SAQUEN SU ESCUDO": "ARMA YETER",
		"Premio de la Afición": "Taraftar Ödülü",
		"EL ESTADIO, EN PIE: APLAUDEN TU DORSAL": "STADYUM AYAKTA, NUMARANI ALKIŞLIYOR",
		"TU EX GRADA, EN PIE: APLAUDEN TU DORSAL": "ESKI TARAFTARIN NUMARANI ALKIŞLIYOR",
		"PAÑUELOS BLANCOS EN LA GRADA: VAN POR TI": "TRIBUNDE BEYAZ MENDILLER: HEDEF SENSIN",
		"PAÑUELOS BLANCOS CONTRA EL PALCO": "BEYAZ MENDILLER YONETIME",
		"PAÑOLADA": "MENDIL",
		"OS VAIS A VUESTRA GRADA: OS APLAUDEN IGUAL": "TRIBUNE GIDINCE: YINE DE ALKIŞ",
		"OS VAIS A VUESTRA GRADA: PITOS Y PAÑUELOS": "TRIBUNE GIDINCE: ISLIK VE MENDIL",
		"APLAUSOS": "ALKIŞ",
		"PITOS": "ISLIK",
		"REGALO": "HEDIYE",
		"{0} le da su camiseta a un niño de la grada": "{0} formasını tribündeki bir çocuğa veriyor",
		"Goleada ante el {0}: la grada del {1} aplaude igual": "{0} karşısında farklı yenilgi: {1} taraftarı yine de alkışlıyor",
		"Goleada ante el {0}: pitos y pañuelos para el {1}": "{0} karşısında farklı yenilgi: {1} takımına ıslık ve mendil",
		"FIRMA TU CAMISETA": "FORMANI IMZALA",
		"Es para el niño del cartel": "Pankartlı çocuk için",
		"Marcaste, y el niño del cartel se lleva tu camiseta.": "Gol attın, pankartlı çocuk formanı eve götürüyor.",
		"TRIBUNA {0}": "{0} TRIBUNU",
		"Es para tu hincha de siempre": "Sadık taraftarın için",
		"Tu hincha de siempre se lleva tu camiseta.": "Sadık taraftarın formanı eve götürüyor.",
		"Le negaste tu camiseta a tu hincha de siempre.": "Sadık taraftarına formanı vermedin.",
	},
	"ajustes_tumbado": {

		"ZURDO": "SOLAK",
		"TAMAÑO": "BOYUT",
		"OPACIDAD": "OPAKLIK",
		"CRT": "CRT",
		"ICONO": "IKON",
		"DATOS": "VERI",
		"TELÉFONO": "TELEFON",
		"CUMPLE": "YAŞ GUNU",
		"MOVIMIENTO": "HAREKET",
		"SACUDIDA": "SARSINTI",
		"MANDO": "PAD",
		"CONECTAR": "BAGLAN",
		"CONECTADO": "BAGLI",
		"ESPERANDO MANDO": "PAD BEKLENIYOR",
		"EN EL MANDO": "PAD'DE",
		"EN EL TELÉFONO": "TELEFONDA",
		"EN EL ORDENADOR": "PC'DE",
		"MANTÉN": "BAS",
		"HASTA QUE PARPADEE": "YANIP SONENE KADAR",
		"EMPAREJAR": "EŞLE",
		"SINCRONIZAR": "SYNC",
		"TOCA EL MANDO": "PAD'E DOKUN",
		"VINCULAR": "ESLE",
		"PRIVACIDAD": "GIZLILIK",
		"LICENCIAS": "LISANSLAR",
		"Licencia: {0}": "Lisans: {0}",
	},






	"copas_america": {
		"COPA GLORIA": "ŞAN KUPASI",
		"Copa Gloria": "Şan Kupası",
		"LIBERTADORES": "ŞAN KUPASI",
		"COPA DEL SUR": "GUNEY KUPASI",
		"Copa del Sur": "Güney Kupası",
		"SUDAMERICANA": "GUNEY KUPASI",
		"COPA DEL NORTE": "KUZEY KUPASI",
		"Copa del Norte": "Kuzey Kupası",
		"CONCACAF CHAMPIONS CUP": "KUZEY KUPASI",
		"MEJOR DE LA COPA GLORIA": "ŞAN KUPASI EN IYISI",
		"MEJOR DE LA COPA DEL SUR": "GUNEY KUPASI EN IYISI",
		"MEJOR DE LA COPA DEL NORTE": "KUZEY KUPASI EN IYISI",
		"Todo un continente soñando con esta copa. Y la levantas tú.":
			"Bütün bir kıta bu kupanın hayalini kuruyor. Ve onu sen kaldırıyorsun.",
		"La otra copa de América. Se suda igual y se levanta igual.":
			"Amerika'nın öbür kupası. Aynı terle oynanır, aynı gururla kaldırılır.",
		"El norte del continente entero, a tus pies.":
			"Kıtanın bütün kuzeyi ayaklarının altında.",
		"El mejor de América en la copa que todo el continente mira.":
			"Bütün kıtanın izlediği kupada Amerika'nın en iyisi.",
		"El mejor de la otra copa de América. Nadie la jugó como tú.":
			"Amerika'nın öbür kupasının en iyisi. Kimse onu senin gibi oynamadı.",
		"El mejor del norte del continente. Las noches de copa fueron tuyas.":
			"Kıtanın kuzeyinin en iyisi. Kupa geceleri senindi.",
		"Previa": "Ön Eleme",
		"PREVIA": "ON ELEME",
		"Preliminar": "Ön Tur",
		"PRELIMINAR": "ON TUR",
		"Campeón de Libertadores": "Şan Kupası şampiyonu",
		"Campeón de Copa Gloria": "Şan Kupası şampiyonu",
		"Campeón de Sudamericana": "Güney Kupası şampiyonu",
		"Campeón de Copa del Sur": "Güney Kupası şampiyonu",
		"Campeón de Concacaf": "Kuzey Kupası şampiyonu",
		"Campeón de Copa del Norte": "Kuzey Kupası şampiyonu",
		"Bota de la Libertadores": "Şan Kupası Gol Kralı",
		"Bota de la Copa Gloria": "Şan Kupası Gol Kralı",
		"Bota de la Sudamericana": "Güney Kupası Gol Kralı",
		"Bota de la Copa del Sur": "Güney Kupası Gol Kralı",
		"Bota de la Concacaf": "Kuzey Kupası Gol Kralı",
		"Bota de la Copa del Norte": "Kuzey Kupası Gol Kralı",
		"Máximo Asistente de la Libertadores": "Şan Kupası asist kralı",
		"Máximo Asistente de la Copa Gloria": "Şan Kupası asist kralı",
		"Máximo Asistente de la Sudamericana": "Güney Kupası asist kralı",
		"Máximo Asistente de la Copa del Sur": "Güney Kupası asist kralı",
		"Máximo Asistente de la Concacaf": "Kuzey Kupası asist kralı",
		"Máximo Asistente de la Copa del Norte": "Kuzey Kupası asist kralı",
		"Mejor de la Libertadores": "Şan Kupası'nın En İyisi",
		"Mejor de la Copa Gloria": "Şan Kupası'nın En İyisi",
		"Mejor de la Sudamericana": "Güney Kupası'nın En İyisi",
		"Mejor de la Copa del Sur": "Güney Kupası'nın En İyisi",
		"Mejor de la Concacaf": "Kuzey Kupası'nın En İyisi",
		"Mejor de la Copa del Norte": "Kuzey Kupası'nın En İyisi",
		"¡Campeón de Copa Gloria!": "Şan Kupası şampiyonu!",
		"¡Campeón de Copa del Sur!": "Güney Kupası şampiyonu!",
		"¡Campeón de Copa del Norte!": "Kuzey Kupası şampiyonu!",
		"¡CAMPEÓN DE COPA GLORIA!": "ŞAN KUPASI ŞAMPIYONU!",
		"¡CAMPEÓN DE COPA DEL SUR!": "GUNEY KUPASI ŞAMPIYONU!",
		"¡CAMPEÓN DE COPA DEL NORTE!": "KUZEY KUPASI ŞAMPIYONU!",
		"Clasificado a Copa Gloria": "Şan Kupası bileti alındı",
		"Clasificado a Copa del Sur": "Güney Kupası bileti alındı",
		"Clasificado a Copa del Norte": "Kuzey Kupası bileti alındı",
		"Fase final de Copa Gloria": "Şan Kupası eleme aşaması",
		"Fase final de Copa del Sur": "Güney Kupası eleme aşaması",
		"Fase final de Copa del Norte": "Kuzey Kupası eleme aşaması",
		"Mejor (Copa Gloria)": "En İyi (Şan Kupası)",
		"Mejor (Copa del Sur)": "En İyi (Güney Kupası)",
		"Mejor (Copa del Norte)": "En İyi (Kuzey Kupası)",
		"Bota (Copa Gloria)": "Gol Kralı (Şan Kupası)",
		"Bota (Copa del Sur)": "Gol Kralı (Güney Kupası)",
		"Bota (Copa del Norte)": "Gol Kralı (Kuzey Kupası)",
		"Asist. (Copa Gloria)": "Asist (Şan Kupası)",
		"Asist. (Copa del Sur)": "Asist (Güney Kupası)",
		"Asist. (Copa del Norte)": "Asist (Kuzey Kupası)",
		"Gloria Eterna": "Ebedi Şan",
		"Rey del Sur": "Güneyin Kralı",
		"Rey del Norte": "Kuzeyin Kralı",
		"Amo de América": "Amerika'nın Efendisi",
		"Dos Mundos": "İki Dünya",
		"Cerebro de la Libertadores": "Şan Kupası Oyun Kurucusu",
		"Cerebro de la Copa Gloria": "Şan Kupası Oyun Kurucusu",
		"Cerebro de la Sudamericana": "Güney Kupası Oyun Kurucusu",
		"Cerebro de la Copa del Sur": "Güney Kupası Oyun Kurucusu",
		"Cerebro de la Concacaf": "Kuzey Kupası Oyun Kurucusu",
		"Cerebro de la Copa del Norte": "Kuzey Kupası Oyun Kurucusu",
		"Ganar la Libertadores.": "Şan Kupası'nı kazan.",
		"Ganar la Copa Gloria.": "Şan Kupası'nı kazan.",
		"Ganar la Sudamericana.": "Güney Kupası'nı kazan.",
		"Ganar la Copa del Sur.": "Güney Kupası'nı kazan.",
		"Ganar la Concacaf Champions Cup.": "Kuzey Kupası'nı kazan.",
		"Ganar la Copa del Norte.": "Kuzey Kupası'nı kazan.",
		"Ser el máximo goleador de la Libertadores.": "Şan Kupası gol kralı ol.",
		"Ser el máximo goleador de la Copa Gloria.": "Şan Kupası gol kralı ol.",
		"Ser el máximo goleador de la Sudamericana.": "Güney Kupası gol kralı ol.",
		"Ser el máximo goleador de la Copa del Sur.": "Güney Kupası gol kralı ol.",
		"Ser el máximo goleador de la Concacaf Champions Cup.": "Kuzey Kupası gol kralı ol.",
		"Ser el máximo goleador de la Copa del Norte.": "Kuzey Kupası gol kralı ol.",
		"Máximo asistente de la Libertadores.": "Şan Kupası asist kralı.",
		"Máximo asistente de la Copa Gloria.": "Şan Kupası asist kralı.",
		"Máximo asistente de la Sudamericana.": "Güney Kupası asist kralı.",
		"Máximo asistente de la Copa del Sur.": "Güney Kupası asist kralı.",
		"Máximo asistente de la Concacaf Champions Cup.": "Kuzey Kupası asist kralı.",
		"Máximo asistente de la Copa del Norte.": "Kuzey Kupası asist kralı.",
		"Ganar la Libertadores con 3 clubes distintos.": "Şan Kupası'nı 3 farklı kulüple kazan.",
		"Ganar la Copa Gloria con 3 clubes distintos.": "Şan Kupası'nı 3 farklı kulüple kazan.",
		"Ganar la Champions y también la Libertadores o la Concacaf Champions Cup.": "Elit Kupası'nı ve ayrıca Şan Kupası'nı ya da Kuzey Kupası'nı kazan.",
		"Ganar la Copa de Campeones y también la Copa Gloria o la Copa del Norte.": "Elit Kupası'nı ve ayrıca Şan Kupası'nı ya da Kuzey Kupası'nı kazan.",
		"Máximo goleador de tu liga Y de tu gran copa continental en la misma temporada.": "Aynı sezonda hem liginin HEM de en büyük kıta kupanın gol kralı ol.",
		"Ganar los seis grandes: liga, copa, tu gran copa continental, Mundial de Clubes, continental y Mundial.": "Büyük altıyı kazan: lig, kupa, en büyük kıta kupan, Kulüpler Dünya Şampiyonası, kıta şampiyonası ve Dünya Şampiyonası.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de esa copa.": "BIRINCI LIGDE ve tek sezonda: lig, kupa ve en büyük kıta kupan; üstüne Yılın Oyuncusu, ligde MVP ve gol krallığı, o kupada da MVP ve gol krallığı.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Jugador del Año, MVP y goleo de la liga, y MVP y bota de esa copa.": "BIRINCI LIGDE ve tek sezonda: lig, kupa ve en büyük kıta kupan; üstüne Yılın Oyuncusu, ligde MVP ve gol krallığı, o kupada da MVP ve gol krallığı.",
		"TORNEOS CONTINENTALES": "KITA KUPALARI",
		"continentales": "kıta kupaları",
		"bota_libertadoresBota de la Libertadores": "Şan Kupası Gol Kralı",
		"bota_sudamericanaBota de la Sudamericana": "Güney Kupası Gol Kralı",
		"bota_concacafBota de la Concacaf": "Kuzey Kupası Gol Kralı",
		"max_asist_sudCerebro de la Sudamericana": "Güney Kupası Oyun Kurucusu",
		"nombre del logro max_asist_sudCerebro de la Sudamericana": "Güney Kupası Oyun Kurucusu",



		"tabGLORIA": "ŞAN",
		"tabSUR": "GUNEY",
		"tabNORTE": "KUZEY",
		"GLO": "ŞAN",
		"SUR": "GNY",
		"NOR": "KZY",
	},


	"copas_asia": {
		"COPA DE ORIENTE": "DOGU KUPASI",
		"Copa de Oriente": "Doğu Kupası",
		"MEJOR DE LA COPA DE ORIENTE": "DOGU KUPASI EN IYISI",
		"Campeón de Copa de Oriente": "Doğu Kupası şampiyonu",
		"Bota de la Copa de Oriente": "Doğu Kupası Gol Kralı",
		"Máximo Asistente de la Copa de Oriente": "Doğu Kupası asist kralı",
		"Mejor de la Copa de Oriente": "Doğu Kupası'nın En İyisi",
		"¡Campeón de Copa de Oriente!": "Doğu Kupası şampiyonu!",
		"¡CAMPEÓN DE COPA DE ORIENTE!": "DOGU KUPASI ŞAMPIYONU!",
		"Clasificado a Copa de Oriente": "Doğu Kupası bileti alındı",
		"Fase final de Copa de Oriente": "Doğu Kupası eleme aşaması",
		"Mejor (Copa de Oriente)": "En İyi (Doğu Kupası)",
		"Bota (Copa de Oriente)": "Gol Kralı (Doğu Kupası)",
		"Asist. (Copa de Oriente)": "Asist (Doğu Kupası)",
		"Cerebro de la Copa de Oriente": "Doğu Kupası Oyun Kurucusu",
		"Ganar la Copa de Oriente.": "Doğu Kupası'nı kazan.",
		"Ser el máximo goleador de la Copa de Oriente.": "Doğu Kupası gol kralı ol.",
		"Máximo asistente de la Copa de Oriente.": "Doğu Kupası asist kralı.",
		"COPA DEL SOL": "GUNEŞ KUPASI",
		"Copa del Sol": "Güneş Kupası",
		"MEJOR DE LA COPA DEL SOL": "GUNEŞ KUPASI EN IYISI",
		"Campeón de Copa del Sol": "Güneş Kupası şampiyonu",
		"Bota de la Copa del Sol": "Güneş Kupası Gol Kralı",
		"Máximo Asistente de la Copa del Sol": "Güneş Kupası asist kralı",
		"Mejor de la Copa del Sol": "Güneş Kupası'nın En İyisi",
		"¡Campeón de Copa del Sol!": "Güneş Kupası şampiyonu!",
		"¡CAMPEÓN DE COPA DEL SOL!": "GUNEŞ KUPASI ŞAMPIYONU!",
		"Clasificado a Copa del Sol": "Güneş Kupası bileti alındı",
		"Fase final de Copa del Sol": "Güneş Kupası eleme aşaması",
		"Mejor (Copa del Sol)": "En İyi (Güneş Kupası)",
		"Bota (Copa del Sol)": "Gol Kralı (Güneş Kupası)",
		"Asist. (Copa del Sol)": "Asist (Güneş Kupası)",
		"Cerebro de la Copa del Sol": "Güneş Kupası Oyun Kurucusu",
		"Ganar la Copa del Sol.": "Güneş Kupası'nı kazan.",
		"Ser el máximo goleador de la Copa del Sol.": "Güneş Kupası gol kralı ol.",
		"Máximo asistente de la Copa del Sol.": "Güneş Kupası asist kralı.",
		"Rey de Oriente": "Doğunun Kralı",
		"Rey del Sol": "Güneşin Kralı",
		"tabORIENTE": "DOGU",
		"tabSOL": "GUNEŞ",
		"ORI": "DGU",
		"CSO": "GNŞ",
		"Medio mundo de distancia y una sola copa. Es tuya.": "Dünyanın öbür ucunda tek bir kupa. Artık senin.",
		"Viajes largos, noches largas. Y al final, la copa.": "Uzun yolculuklar, uzun geceler. Ve sonunda kupa.",
		"El mejor de la copa grande de Asia. Nadie brilló como tú.": "Asya'nın en büyük kupasının en iyisi. Kimse senin gibi parlamadı.",
		"El mejor de la otra copa de Asia. Cada noche fue tuya.": "Asya'nın öbür kupasının en iyisi. Her gece senindi.",
	},


	"copas_africa": {
		"COPA DEL ATLAS": "ATLAS KUPASI",
		"Copa del Atlas": "Atlas Kupası",
		"MEJOR DE LA COPA DEL ATLAS": "ATLAS KUPASI EN IYISI",
		"Campeón de Copa del Atlas": "Atlas Kupası şampiyonu",
		"Bota de la Copa del Atlas": "Atlas Kupası Gol Kralı",
		"Máximo Asistente de la Copa del Atlas": "Atlas Kupası asist kralı",
		"Mejor de la Copa del Atlas": "Atlas Kupası'nın En İyisi",
		"¡Campeón de Copa del Atlas!": "Atlas Kupası şampiyonu!",
		"¡CAMPEÓN DE COPA DEL ATLAS!": "ATLAS KUPASI ŞAMPIYONU!",
		"Clasificado a Copa del Atlas": "Atlas Kupası bileti alındı",
		"Fase final de Copa del Atlas": "Atlas Kupası eleme aşaması",
		"Mejor (Copa del Atlas)": "En İyi (Atlas Kupası)",
		"Bota (Copa del Atlas)": "Gol Kralı (Atlas Kupası)",
		"Asist. (Copa del Atlas)": "Asist (Atlas Kupası)",
		"Cerebro de la Copa del Atlas": "Atlas Kupası Oyun Kurucusu",
		"Ganar la Copa del Atlas.": "Atlas Kupası'nı kazan.",
		"Ser el máximo goleador de la Copa del Atlas.": "Atlas Kupası gol kralı ol.",
		"Máximo asistente de la Copa del Atlas.": "Atlas Kupası asist kralı.",
		"COPA DEL BAOBAB": "BAOBAB KUPASI",
		"Copa del Baobab": "Baobab Kupası",
		"MEJOR DE LA COPA DEL BAOBAB": "BAOBAB KUPASI EN IYISI",
		"Campeón de Copa del Baobab": "Baobab Kupası şampiyonu",
		"Bota de la Copa del Baobab": "Baobab Kupası Gol Kralı",
		"Máximo Asistente de la Copa del Baobab": "Baobab Kupası asist kralı",
		"Mejor de la Copa del Baobab": "Baobab Kupası'nın En İyisi",
		"¡Campeón de Copa del Baobab!": "Baobab Kupası şampiyonu!",
		"¡CAMPEÓN DE COPA DEL BAOBAB!": "BAOBAB KUPASI ŞAMPIYONU!",
		"Clasificado a Copa del Baobab": "Baobab Kupası bileti alındı",
		"Fase final de Copa del Baobab": "Baobab Kupası eleme aşaması",
		"Mejor (Copa del Baobab)": "En İyi (Baobab Kupası)",
		"Bota (Copa del Baobab)": "Gol Kralı (Baobab Kupası)",
		"Asist. (Copa del Baobab)": "Asist (Baobab Kupası)",
		"Cerebro de la Copa del Baobab": "Baobab Kupası Oyun Kurucusu",
		"Ganar la Copa del Baobab.": "Baobab Kupası'nı kazan.",
		"Ser el máximo goleador de la Copa del Baobab.": "Baobab Kupası gol kralı ol.",
		"Máximo asistente de la Copa del Baobab.": "Baobab Kupası asist kralı.",
		"Rey del Atlas": "Atlas'ın Kralı",
		"Rey del Baobab": "Baobab'ın Kralı",
		"tabATLAS": "ATLAS",
		"tabBAOBAB": "BAOBAB",
		"ATL": "ATL",
		"BAO": "BAO",
		"El mejor de la copa grande de África. Nadie brilló como tú.": "Afrika'nın en büyük kupasının en iyisi. Kimse senin gibi parlamadı.",
		"El mejor de la otra copa de África. Cada noche fue tuya.": "Afrika'nın öbür kupasının en iyisi. Her gece senindi.",
	},




	"copas_oceania": {
		"COPA DEL CORAL": "MERCAN KUPASI",
		"Copa del Coral": "Mercan Kupası",
		"MEJOR DE LA COPA DEL CORAL": "MERCAN KUPASI EN IYISI",
		"Campeón de Copa del Coral": "Mercan Kupası şampiyonu",
		"Bota de la Copa del Coral": "Mercan Kupası Gol Kralı",
		"Máximo Asistente de la Copa del Coral": "Mercan Kupası asist kralı",
		"Mejor de la Copa del Coral": "Mercan Kupası'nın En İyisi",
		"¡Campeón de Copa del Coral!": "Mercan Kupası şampiyonu!",
		"¡CAMPEÓN DE COPA DEL CORAL!": "MERCAN KUPASI ŞAMPIYONU!",
		"Clasificado a Copa del Coral": "Mercan Kupası bileti alındı",
		"Fase final de Copa del Coral": "Mercan Kupası eleme aşaması",
		"Mejor (Copa del Coral)": "En İyi (Mercan Kupası)",
		"Bota (Copa del Coral)": "Gol Kralı (Mercan Kupası)",
		"Asist. (Copa del Coral)": "Asist (Mercan Kupası)",
		"Cerebro de la Copa del Coral": "Mercan Kupası Oyun Kurucusu",
		"Ganar la Copa del Coral.": "Mercan Kupası'nı kazan.",
		"Ser el máximo goleador de la Copa del Coral.": "Mercan Kupası gol kralı ol.",
		"Máximo asistente de la Copa del Coral.": "Mercan Kupası asist kralı.",
		"Rey del Coral": "Mercanın Kralı",
		"Señor del Arrecife": "Resifin Efendisi",
		"Ganar 3 veces la Copa del Coral.": "Mercan Kupası'nı 3 kez kazan.",
		"Tiburón del Pacífico": "Pasifik Köpekbalığı",
		"Ser 2 veces el máximo goleador de la Copa del Coral.": "Mercan Kupası'nda 2 kez gol kralı ol.",
		"Ser el mejor jugador de la Copa del Coral.": "Mercan Kupası'nın en iyi oyuncusu ol.",
		"tabCORAL": "MERCAN",
		"COR": "MER",
		"Islas lejanas, un solo estadio. Y la copa del Pacífico es tuya.": "Uzak adalar, tek bir stadyum. Ve Pasifik'in kupası senin.",
		"El mejor de la copa del Pacífico. Cada isla habló de ti.": "Pasifik kupasının en iyisi. Her ada seni konuştu.",
	},









	"campeon_de_campeones": {
		"CAMPEÓN DE CAMPEONES": "CAMPEON DE CAMPEONES",
		"Campeón de Campeones": "Campeón de Campeones",
		"Ganar el Campeón de Campeones.": "Campeón de Campeones kupasını kazan.",
		"Dos campeones y una sola copa. La tuya.": "İki şampiyon, tek kupa. Seninki.",
	},
	"supercopas": {
		"Campeón de la Finalísima": "Süperfinal şampiyonu",
		"Finalísima": "Süperfinal",
		"FINALÍSIMA": "SUPERFINAL",
		"FINALÍSIMA: {0} le gana a {1}": "SUPERFINAL: {0}, {1} ekibini yendi",
		"Dos Continentes": "İki Kıta",
		"Ganar la Finalísima con tu país.": "Süperfinali ülkenle kazan.",
		"Campeón de tu continente contra campeón del otro. Ganó el tuyo.": "Kıtanın şampiyonu, öbür kıtanın şampiyonuna karşı. Seninki kazandı.",
		"COPA DE LA LIGA": "LIG KUPASI",
		"Copa de la Liga": "Lig Kupası",
		"Campeón de la Copa de la Liga": "Lig Kupası şampiyonu",
		"La otra copa del país. También es tuya.": "Ülkenin diğer kupası. O da senin.",
		"Doble Copa": "Çifte Kupa",
		"Ganar la Copa de la Liga.": "Lig Kupası'nı kazan.",
		"LIGA DE NACIONES": "ULUSLAR LIGI",
		"Liga de Naciones": "Uluslar Ligi",
		"Campeón de la Liga de Naciones": "Uluslar Ligi şampiyonu",
		"Liga A": "Lig A",
		"Ganar la Liga de Naciones con tu país.": "Ülkenle Uluslar Ligi'ni kazan.",
		"Seis jornadas, una Final Four. La primera de tu continente.": "Altı hafta, bir Final Four. Kıtanın ilki.",
		"LIGA DE NACIONES: {0}": "ULUSLAR LIGI: {0}",
		"SUPERCOPA DE ÁFRICA": "AFRIKA SUPER KUPASI",
		"Supercopa de África": "Afrika Süper Kupası",
		"Campeón de la Supercopa de África": "Afrika Süper Kupası şampiyonu",
		"Supercampeón de África": "Afrika'nın Süper Şampiyonu",
		"Ganar la Supercopa de África.": "Afrika Süper Kupası'nı kazan.",
		"Los dos campeones de África, y la copa es tuya.": "Afrika'nın iki şampiyonu, kupa senin.",
		"RECOPA DEL SUR": "GUNEY S.KUPASI",
		"Recopa del Sur": "Güney Süper Kupası",
		"COPA INTERCONTINENTAL": "KITALARARASI KUPA",
		"Copa Intercontinental": "Kıtalararası Kupa",
		"DERBI DE LAS AMÉRICAS": "AMERIKA DERBISI",
		"COPA AFROASIÁTICA": "AFRO-ASYA KUPASI",

		"PLAY-OFF ASIA-PACÍFICO": "ASYA-PASIFIK PLAY-OFF",
		"COPA CHALLENGER": "CHALLENGER KUPASI",
		"Campeón de la Recopa": "Güney Süper Kupası şampiyonu",
		"Campeón Intercontinental": "Kıtalararası şampiyon",
		"Campeón contra Campeón": "Şampiyona Karşı Şampiyon",
		"Rey Intercontinental": "Kıtalararası Kral",
		"Ganar la Recopa del Sur.": "Güney Süper Kupası'nı kazan.",
		"Ganar la Copa Intercontinental.": "Kıtalararası Kupa'yı kazan.",
		"Campeón contra campeón. Y la copa se queda contigo.": "Şampiyona karşı şampiyon. Ve kupa sende kalıyor.",
		"Los campeones de cada continente, y el mejor eres tú.": "Her kıtanın şampiyonları burada ve en iyisi sensin.",
		"SUPERCOPA DE EUROPA": "AVRUPA SUPER KUPASI",
		"Supercopa de Europa": "Avrupa Süper Kupası",
		"Campeón de la Supercopa de Europa": "Avrupa Süper Kupası şampiyonu",
		"Supercampeón de Europa": "Avrupa'nın Süper Şampiyonu",
		"Ganar la Supercopa de Europa.": "Avrupa Süper Kupası'nı kazan.",
		"Los dos campeones de Europa, y la copa es tuya.": "Avrupa'nın iki şampiyonu karşı karşıya ve kupa senin.",
		"SUPERCOPA": "SUPERKUPA",
		"Supercopa": "Süper Kupa",
		"Campeón de Supercopa": "Süper Kupa şampiyonu",
		"Supercampeón": "Süper Şampiyon",
		"Ganar la Supercopa de tu país.": "Ülkenin Süper Kupası'nı kazan.",
		"El campeón contra el campeón. Y la copa, tuya.": "Şampiyon şampiyona karşı. Ve kupa senin.",
		"SUPERCOPA · FINAL": "SUPERKUPA · FINAL",
		"COPA DE LA ASOCIACIÓN": "FEDERASYON KUPASI",
		"Copa de la Asociación": "Federasyon Kupası",
		"COPA DE LAS LIGAS": "LIGLER KUPASI",
		"Copa de las Ligas": "Ligler Kupası",
		"Campeón de la Copa de las Ligas": "Ligler Kupası şampiyonu",
		"DUELO DE CAMPEONES": "ŞAMPIYON DUELLOSU",
		"Rey de las Dos Ligas": "İki Ligin Kralı",
		"Ganar la Copa de las Ligas.": "Ligler Kupası'nı kazan.",
		"Duelo de campeones entre dos ligas. Y la copa, tuya.": "İki ligin şampiyonları kapışıyor. Kupa senin.",
	},
	"apertura_clausura": {
		"APERTURA": "APERTURA",
		"CLAUSURA": "CLAUSURA",
		"Apertura": "Apertura",
		"Clausura": "Clausura",
		"EN LIGUILLA": "LIGUILLA'DA",
		"IGUALADO CON LA LIGUILLA": "LIGUILLA ILE AYNI PUAN",
		"A {0} PTS DE LA LIGUILLA": "LIGUILLA'YA {0} PUAN VAR",
		"{0} es bicampeón: Apertura y Clausura": "{0} çifte şampiyon: Apertura ve Clausura",
		"{0} gana el Clausura; el Apertura fue de {1}": "Clausura'yı {0} kazandı; Apertura {1} takımının olmuştu",
		"ANUAL": "YILLIK",
		"El torneo aún no arranca.": "Turnuva henüz başlamadı.",
		"{0} os deja fuera. Se acabó el Apertura; queda el Clausura.": "{0} sizi eledi. Apertura bitti; sırada Clausura var.",
	},
	"liguilla": {
		"ESTO SE VA A LOS PENALES": "IŞ PENALTILARA GIDIYOR",
		"GLOBAL EMPATADO: PASAS POR POSICIÓN": "EŞITLIK: SIRALAMAYLA TUR SENIN",
		"GLOBAL EMPATADO: PASA EL RIVAL POR POSICIÓN": "EŞITLIK: SIRALAMAYLA TUR RAKIBIN",
		"PASAS POR POSICIÓN": "SIRALAMAYLA TUR",
		"FUERA POR POSICIÓN": "SIRALAMAYLA VEDA",
		"POR POSICIÓN": "SIRALAMAYLA",
		"SI ACABA ASÍ: PENALTIS": "BOYLE BITERSE: PENALTI",
		"SI ACABA ASÍ: OTRA NOCHE": "BOYLE: BIR MAÇ DAHA",
		"Así, nos toca otra noche. Que no haga falta.": "Böyle giderse bir gece daha oynarız. Umarım gerek kalmaz.",
		"Así, penaltis. Y nadie quiere penaltis.": "Böyle giderse penaltılar. Kimse penaltı istemez.",
		"LIGUILLA": "LIGUILLA",
		"PLAY-IN": "PLAY-IN",
		"Play-in": "Play-in",
		"FINAL DE LA LIGUILLA": "LIGUILLA FINALI",
		"SUPERLÍDER: {0}": "ZIRVE: {0}",
		"Entrar a la liguilla": "Liguilla'ya gir",
		"Superlíder": "Lider",
		"No entró": "Kalamadı",
		"{0} en la tabla": "Tabloda {0}",
		"Campeón de Liga: {0}": "Lig şampiyonu: {0}",
		"Del 1º al 6º, a cuartos; del 7º al 10º, al play-in.": "1.-6. çeyrek finale; 7.-10. play-in'e.",
		"Así quedaría si la liga acabara hoy.": "Lig bugün bitse tablo böyle olurdu.",
		"Dos partidos y la liga es vuestra. En esta sala ya no habla nadie de suerte.": "İki maç daha ve lig sizin. Bu odada artık kimse şanstan bahsetmiyor.",
		"Semifinales. Dos cruces más y la liga es vuestra.": "Yarı final. İki tur daha ve lig sizin.",
		"Global igualado y pasa el mejor de la tabla: {0}. No hizo falta ni la tanda.": "Toplamda eşitlik, tabloda üstte olan geçiyor: {0}. Penaltılara bile gerek kalmadı.",
		"A un cruce de la final. Esta sala va a tardar en olvidarlo.": "Finale bir tur kaldı. Bu oda bunu kolay kolay unutmaz.",
		"{0} os deja fuera. Se acabó la liguilla y con ella el año.": "{0} sizi eledi. Liguilla bitti, onunla birlikte sezon da.",
		"Una liga entera para perderla en la última noche. La vuelta al campo la dan ellos.": "Koca bir lig sezonu, son gecede kaybedildi. Şeref turunu onlar atıyor.",
		"{0} gana la liguilla y la liga; {1} fue superlíder": "Liguilla'yı ve ligi {0} kazandı; zirvede {1} vardı",
		"{0} es Campeón de Campeones": "Campeón de Campeones: {0}",
		"{0} es Campeón de Campeones ante {1}": "{0}, {1} karşısında Campeón de Campeones oldu",
		"Del 1º al 8º, a cuartos.": "1. ile 8. arası çeyrek finale.",
	},


	"golpeo_puntero": {
		"Jala el stick derecho y suelta para tirar": "Şut için sağ analoğu çek ve bırak",
		"Jala el stick derecho y suelta para centrar": "Orta için sağ analoğu çek ve bırak",

		"Jala el stick izquierdo y suelta para tirar": "Şut için sol analoğu çek ve bırak",
		"Jala el stick izquierdo y suelta para centrar": "Orta için sol analoğu çek ve bırak",


		"Apunta con el stick · pulsa el botón": "Analogla nişan al · düğmeye bas",
		"CENTRO · apunta y pulsa el botón": "ORTA · nişan al ve düğmeye bas",
	},

	"pingpong_matt": {
		"pingpong_mattRETO DE MATT": "DUELLO: MATT",
		"pingpong_mattENTRENO": "IDMAN",
		"pingpong_mattDESAFIO": "ZORLU",
		"pingpong_mattLEYENDA": "EFSANE",
		"pingpong_mattVENCISTE A MATT": "MATT'I YENDIN",
		"pingpong_mattGANO MATT": "MATT ALDI",
		"pingpong_mattSAQUE DE MATT": "MATT SERVISTE",
		"pingpong_mattPUNTO PARA MATT": "SAYI: MATT",
		"pingpong_mattATAQUE": "ATAK",
		"pingpong_mattMATT ATACA": "MATT ATAKTA",
		"pingpong_mattVICTORIAS": "GALIBIYET",
		"pingpong_mattRECORD": "REKOR",
		"pingpong_mattCAMPEON": "KRAL",
		"pingpong_mattINTERCAMBIO: {0}": "RALLI: {0}",
		"pingpong_mattMueve la pala. Toca para sacar.": "Raketi oynat. Servis için dokun.",
		"pingpong_mattCentro: ataque. Lateral: colocación.": "Orta: atak. Kenar: yerleştirme.",
	},
	"museo_visita": {
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida se borra; su museo queda disponible para visitar. Esto no se puede deshacer.": "Salonda plaketi kalır: rakamlar, kupalar ve kulüpler. Kayıt silinir; müzesi ziyarete açık kalır. Bu geri alınamaz.",
		"MEJOR TEMPORADA": "EN IYI SEZON",
		"Por premios, media y aportación.": "Ödüllere, reytinge ve katkıya göre.",
		"ELIGE DOS CARRERAS": "IKI KARIYER SEÇ",
		"ELIGE OTRA CARRERA": "BAŞKA KARIYER SEÇ",
		"COMPARAR CARRERAS": "KARIYER KIYASLA",
		"CAMBIAR CARRERAS": "KARIYER DEGIŞTIR",
		"DERROTAS": "Mağlubiyet",
		"EMPATES": "Beraberlik",
		"VICTORIAS": "Galibiyet",
		"RECONOCIMIENTOS": "ONUR LISTESI",
		"LEYENDA DEL CLUB": "KULUP EFSANESI",
		"LEYENDA DE LA LIGA": "LIG EFSANESI",
		"LEYENDA DE LA SELECCIÓN": "MILLI TAKIM EFSANESI",
		"RÉCORDS REGISTRADOS": "KAYITLI REKORLAR",
		"MEJOR DE LA HISTORIA": "TARIHIN EN IYISI",
		"TROFEOS": "KUPALAR",
		"PREMIOS": "ODULLER",
		"POR EQUIPO": "TAKIMLAR",
		"No se conservaron las estadísticas por temporada.": "Sezon istatistikleri saklanmadı.",
		"V": "G",
		"D": "M",
		"VISITAR MUSEO": "MUZEYI GEZ",
		"SALAS": "SALONLAR",
		"VESTÍBULO": "GIRIŞ",
		"HAT-TRICKS": "HAT-TRICK",
		"TU MUSEO": "MUZEN",
		"ESTÁS AQUÍ": "BURADASIN",
		"VISITAR SALA": "SALONU GEZ",
		"TOCA PARA EXPLORAR": "DOKUN VE KEŞFET",
	},
	"coleccion_pistas": {
		"TIROS LIBRES": "FRIKIKLER",
		"CÓRNERS": "KORNER",
		"SAQUES DE BANDA": "TAÇLAR",
		"INDIRECTAS": "ENDIREKTLER",
		"MANO A MANO": "BIRE BIR",
		"TIRO FRONTAL": "ONDEN ŞUT",
		"TIRO LEJANO": "UZAK ŞUT",
		"TIRO CRUZADO": "ÇAPRAZ ŞUT",
		"CONTRAS": "KONTRA",
		"CENTROS": "ORTALAR",
		"PRIMERA OCASIÓN": "ILK POZISYON",
		"GOLES DE TU EQUIPO": "TAKIMININ GOLLERI",
		"GOLES DEL RIVAL": "RAKIP GOLLERI",
		"{0} GANANDO": "{0} ONDEYKEN",
		"{0} SIN GANAR": "{0} ONDE DEGILKEN",
		"{0} DESDE EL {1}'": "{0} {1}' SONRASI",
		"{0} HASTA EL {1}'": "{0} {1}' ONCESI",
		"CUÁNDO": "ZAMAN",
		"EN DERBIS": "DERBILERDE",
		"DE VISITANTE": "DEPLASMAN",
		"SÓLO EN CLUB": "SADECE KULUP",
		"EXPULSIONES": "KIRMIZILAR",
		"OCASIÓN FALLADA": "KAÇAN POZISYON",

		"PISTA: {0}": "IPUCU: {0}",
		"BALONES PARA TI": "SANA GELEN TOP",
		"LESIONES": "SAKATLIK",
		"GASTO DE ENERGÍA": "ENERJI HARCAMA",
		"TE SIENTA BAJO": "ALTINDA YEDEK",
		"RECUPERACIÓN": "TOPARLANMA",
		"PUESTO HASTA LOS 23": "23 YAŞINA KADAR YER",
		"PUESTO SIN SU CONFIANZA": "GUVENI OLMADAN YER",
		"JORNADAS EN LA GRADA": "TRIBUNDEKI HAFTALAR",
		"TRAS GANAR": "KAZANINCA",
		"REPITE EL ONCE": "AYNI ILK 11",
		"BRONCA TRAS MAL PARTIDO": "KOTU MAÇ SONRASI FIRÇA",
		"AFICIÓN Y PRENSA AL PERDER": "YENILINCE TARAFTAR-BASIN",
		"MEJORA DE CONTRATO": "SOZLEŞME ZAMMI",
		"CAMBIO DE DIBUJO": "DIZILIŞ DEGIŞIMI",
		"Ser generoso desde los once metros también tiene premio.": "Penaltı noktasında cömert olmanın da bir ödülü var.",
		"En la cantera hay un chaval que necesita a alguien que crea en él.": "Altyapıda kendisine inanacak birine ihtiyacı olan bir çocuk var.",
		"Desde los once metros, a veces el balón es sólo tuyo.": "Penaltı noktasında bazen top sadece senindir.",
		"Ningún partido está perdido aunque vayas dos goles abajo.": "İki gol geride olsan bile hiçbir maç kaybedilmiş değildir.",
		"Los de la tele graban muy pegados a la línea de fondo.": "Televizyoncular kale çizgisinin hemen dibinde çekim yapıyor.",
		"No todo balón tiene que acabar en la portería rival.": "Her top rakip kalede bitmek zorunda değil.",
		"El portero deja algo para beber junto a su poste.": "Kaleci direğinin yanına içecek bir şey bırakıyor.",
		"En una final, alguien de la grada quiere un recuerdo contigo.": "Bir finalde tribündeki biri seninle bir hatıra istiyor.",
		"A veces se posan visitas con alas sobre el césped.": "Bazen çimlere kanatlı misafirler konar.",
		"Arriba, los del palco miran el partido detrás de un cristal.": "Yukarıda, localardakiler maçı camın arkasından izliyor.",
		"El que te devuelve los balones espera junto a la banda.": "Topları geri veren çocuk taç çizgisinin yanında bekliyor.",
		"Al acabar un derbi, mira lo que pasa entre los dos banquillos.": "Derbi bitince iki yedek kulübesi arasında olanlara bak.",
		"En el apretón del derbi, el que aprieta más gana.": "Derbideki tokalaşmada kim daha sıkı sıkarsa o kazanır.",
		"El banquillo de enfrente también está a tiro.": "Karşı takımın yedek kulübesi de menzilde.",
		"Tu propio banquillo también está a tiro.": "Kendi yedek kulüben de menzilde.",
		"El míster de enfrente grita de pie en su área técnica.": "Rakip hoca teknik alanında ayakta bağırıyor.",
		"Tu propio míster también está de pie en la banda.": "Kendi hocan da kenarda ayakta duruyor.",
		"A fuerza de balonazos, un banquillo se puede vaciar.": "Yeterince başıboş şutla bir yedek kulübesi boşaltılabilir.",
		"Entre la hierba asoman las cabezas del riego.": "Çimlerin arasından fıskiye başlıkları görünüyor.",
		"En la grada hay vasos llenos, y los balones que se van caen en algún sitio.": "Tribünde dolu bardaklar var ve dışarı giden toplar bir yere düşüyor.",
		"En la grada alguien pasea con una bandeja de comida.": "Tribünde biri elinde yemek tepsisiyle dolaşıyor.",
		"Si la grada te abuchea, contéstale donde más duele.": "Tribün seni yuhalarsa, en çok acıyan yerden cevap ver.",
		"En algunos campos de barrio no hay nada detrás del arco.": "Bazı mahalle sahalarında kalenin arkasında hiçbir şey yok.",
		"No todas las finales acaban con la copa en tus manos.": "Her final kupa ellerindeyken bitmez.",
		"Si un club te quita una final, búscalo en otra.": "Bir kulüp senden bir finali alırsa, onu başka bir finalde bul.",
		"Una Nueva Carrera+ con ventajas, jugada hasta el último día.": "Avantajlı bir Yeni Kariyer+, son güne kadar oynanmış.",
		"En tu casa hay un volante esperando: ni frenos ni hierba.": "Evinde seni bir direksiyon bekliyor: ne fren var ne çim.",
		"La maquinita de tu casa guarda un récord por batir.": "Evindeki oyun makinesinde kırılacak bir rekor var.",
		"La diana de tu casa premia la puntería fina.": "Evindeki dart tahtası sağlam eli ödüllendirir.",
		"Hay balones sueltos por el banquillo, y el míster no siempre mira.": "Yedek kulübesinin çevresinde başıboş toplar var ve hoca her zaman bakmıyor.",
		"En el billar de tu casa, no dejes jugar al rival.": "Evindeki bilardo masasında rakibine oynama fırsatı verme.",
		"Si te casas, piensa bien a nombre de quién pones la casa.": "Evlenirsen, evi kimin adına yapacağını iyi düşün.",
		"De visita, tarde y perdiendo por la mínima, el balón tarda en volver.": "Deplasmanda, geç dakikalarda ve bir farkla gerideyken top geç dönüyor.",
	},
	"tapetes_formas": {
		"TAPETE OVALADO": "OVAL HALI",
		"Lana de contorno oval, con borde tejido y centro suave.": "Örgü kenarlı, yumuşak ortalı oval yün halı.",
		"TAPETE HEXAGONAL": "ALTIGEN HALI",
		"Seis lados y franjas concéntricas para vestir un rincón.": "Altı kenarı ve iç içe şeritleriyle bir köşeyi süsler.",
		"TAPETE ORGÁNICO": "ORGANIK HALI",
		"Curvas suaves e irregulares, como una piedra de río.": "Nehir taşı gibi yumuşak, düzensiz kıvrımlar.",
		"TAPETE DE PASILLO": "KORIDOR HALISI",
		"Tejido alargado con esquinas redondas y bandas claras.": "Yuvarlak köşeli, açık renk şeritli uzun dokuma.",
		"el tapete no puede atravesar una pared": "halı duvarın içinden geçemez",
	},
	"decoracion_salon": {
		"TAPETE REDONDO": "YUVARLAK HALI",
		"TAPETE TEJIDO": "DOKUMA HALI",
		"BOCINAS DE TORRE": "KULE HOPARLOR",
		"BOCINAS DE ESTANTE": "RAF HOPARLORU",
		"LIBRERO ABIERTO": "AÇIK KITAPLIK",
		"LIBRERO MODULAR": "MODULER RAF",
		"Yute trenzado en círculos. Va debajo de mesas y sillones.": "Daireler halinde örülmüş jüt. Masa ve koltukların altına yakışır.",
		"Lana con rombos y flecos. Viste el suelo sin estorbar el paso.": "Baklava desenli, saçaklı yün. Yolu kapatmadan zemini süsler.",
		"Dos torres de audio con conos y puertos al frente.": "Önden konili ve portlu iki ses kulesi.",
		"Dos bocinas compactas y receptor sobre un mueble bajo.": "Alçak bir dolap üstünde iki kompakt hoparlör ve bir amfi.",
		"Madera y tubos oscuros, con baldas abiertas para libros.": "Ahşap ve koyu borular, kitaplar için açık raflar.",
		"Cubos, cajones y libros en una composición de madera.": "Ahşap bir düzende küpler, çekmeceler ve kitaplar.",
	},
	"nivel_club": {
		"TU NIVEL EN EL CLUB": "KULUPTEKI SEVIYEN",
		"CON VOZ": "ETKILI",
		"DE CONFIANZA": "GUVENILIR",
		"HOMBRE DE LA CASA": "KULUBUN ADAMI",
		"Subes de nivel en el club: {0}.": "Kulüpte seviye atladın: {0}.",
		"Bajas de nivel en el club: {0}.": "Kulüpte seviye düştün: {0}.",
		"Pierdes el brazalete del club.": "Kulübün kaptanlık bandını kaybediyorsun.",
		"Tu peso en el club te deja pedir número sin esperar a renovar. Llevas el {0}: uno libre es tuyo; el de un compañero, depende de él.": "Kulüpteki ağırlığın, sözleşme yenilemeyi beklemeden numara istemene izin veriyor. Şu an {0} numara sende: boştaki bir numara senin; bir takım arkadaşınınki ise ona bağlı.",
		"{0} no te cede el {1}. Sigues con el {2}.": "{0} sana {1} numarayı vermiyor. {2} numarayla devam.",
		"{0} te cede el {1}.": "{0} sana {1} numarayı veriyor.",
		"El club ya te dijo que no a este fichaje en esta ventana.": "Kulüp bu transfere bu dönemde zaten hayır dedi.",
		"Acabas de llegar: el club aún no te consulta los fichajes. Con {0} de relación pasas a {1} y puedes proponerlos.": "Daha yeni geldin: kulüp transferlerde henüz sana danışmıyor. İlişki {0} olunca seviyen {1} olur ve transfer önerebilirsin.",
		"EN RIESGO": "RISKTE",
		"ES EL NIVEL {0}: VAS EN EL {1}": "SEVIYE {0} LAZIM: SEN {1}",
		"TE FALTAN {0} DE RELACIÓN": "{0} ILIŞKI EKSIK",
		"TITULAR EL {0} %: PIDE {1} %": "ILK 11 %{0}: GEREKEN %{1}",
		"NO ERES TITULAR": "YEDEKSIN",
		"Venderlo, protegerlo o pedir que lo renueven es del nivel {0}: {1} de relación con el club.": "Onu satmak, korumak ya da sözleşmesinin yenilenmesini istemek için seviye gerekir: {0} (kulüple {1} ilişki).",
		"Vender es del nivel {0}: {1} de relación con el club.": "Satmak için seviye gerekir: {0} (kulüple {1} ilişki).",
		"Pedir otro técnico es del nivel {0}: {1} de relación con el club.": "Başka hoca istemek için seviye gerekir: {0} (kulüple {1} ilişki).",
		"Ya lo pediste esta temporada.": "Bu sezon zaten istedin.",
		"Antes, contesta lo que tienes pendiente.": "Önce bekleyen sorulara cevap ver.",
		"PEDIR OTRO DORSAL": "NUMARA ISTE",
		"Con tu nivel, el club decide cada fichaje al confirmar: {0} % de que diga que sí. Al que rechace no se le vuelve a proponer en esta ventana.": "Senin seviyende kulüp her transfere sen onaylayınca karar verir: evet deme ihtimali %{0}. Reddettiğini bu dönemde tekrar öneremezsin.",
		"VENDER": "SAT",
		"EL CLUB DIJO NO": "KULUP REDDETTI",
		"relación": "ilişki",
		"nivel": "seviye",
		"El {0} lo lleva {1}. Toca otra vez y se lo pides: hay un {2} % de que te lo ceda.": "{0} numarayı {1} giyiyor. Tekrar dokun ve ondan iste: sana verme ihtimali %{2}.",
		"El {0} lo lleva {1}. Mantén y se lo pides: hay un {2} % de que te lo ceda.": "{0} numarayı {1} giyiyor. Basılı tut ve ondan iste: sana verme ihtimali %{2}.",
		"TU NIVEL: {0}": "SEVIYEN: {0}",
		"BAJAS DE NIVEL EN EL CLUB": "KULUPTE SEVIYE DUŞTUN",
		"PIDES OTRO DORSAL": "YENI NUMARA",
		"TU PETICIÓN": "TALEBIN",
		"El club te dio la voz y el vestuario la reconoce. Ahora la cinta es tuya.": "Kulüp sana söz hakkı verdi, soyunma odası da bunu tanıyor. Artık kaptanlık bandı senin.",
		"VES LA MESA": "MASAYI GOR",
		"PROPONES FICHAJES": "TRANSFER ONER",
		"COMPRAS Y VENTAS": "ALIM VE SATIM",
		"OTRO DORSAL": "YENI NUMARA",
		"OTRO TECNICO": "YENI HOCA",
		"PRIMA FIDELIDAD": "SADAKAT PRIMI",
		"GRADA FIEL": "VEFALI FAN",
		"MAS MARGEN": "DAHA ESNEK",
		"Pediste salir: el club ya no te consulta su plantilla.": "Ayrılmak istedin: kulüp artık kadro konusunda sana danışmıyor.",
		"Prima de fidelidad": "Sadakat primi",
		"CEDIDO: TU NIVEL TE ESPERA": "KIRALIK: SEVIYEN BEKLEMEDE",
		"BAJAS EN {0}": "DUŞUŞ: {0}",
		"PROMETIDO AL VETERANO": "VETERANA SOZ VERILDI",
		"CLUB NUEVO": "YENI KULUP",
		"Una vez por temporada.": "Sezonda bir kez.",
	},
	"mesa_fichajes": {
		"BUSCAR EN EL RANKING": "SIRALAMADA ARA",
		"Los fichajes se marcan con + en el ranking.": "Transferler sıralamada + ile işaretlenir.",
		"VENDER ({0})": "SAT ({0})",
		"CONFIRMAR ({0})": "ONAYLA ({0})",
		"{0} SIN CONFIRMAR": "{0} BEKLIYOR",
		"Es tu último {0}: sin él no hay quien juegue ahí.": "Son {0} oyuncun o: o olmazsa orada oynayacak kimse yok.",
		"Estás cedido: tu club no te pregunta por sus fichajes.": "Kiralıksın: kulübün transferlerde sana danışmıyor.",
		"FICHADOS": "ALINAN",
		"VENDIDOS": "SATILAN",
		"FICHAJES ({0})": "TRANSFER ({0})",
		"VENTAS ({0})": "SATIŞ ({0})",
		"FICHAR EN LA MESA": "ALIMA EKLE",
		"VENDER EN LA MESA": "SATIŞA EKLE",
		"QUITAR DE LA MESA": "MASADAN KALDIR",
		"FICHAS": "GELEN",
		"VENDES": "GIDEN",
		"FIRMO ESTE AÑO": "YENI TRANSFER",
		"Firmaste con otro club: la plantilla del año que viene ya no la haces tú.": "Başka bir kulüple imzaladın: gelecek sezonun kadrosunu artık sen kurmuyorsun.",
		"Firmó esta temporada: no se vende hasta la próxima.": "Bu sezon imzaladı: gelecek sezona kadar satılamaz.",
		"Juega aquí cedido: no es tuyo para venderlo.": "Burada kiralık oynuyor: satmak sana düşmez.",
		"LA MESA": "MASA",
		"La plantilla quedaría en {0}: el máximo es {1}.": "Kadro {0} kişi olur: en fazla {1}.",
		"La plantilla quedaría en {0}: el mínimo es {1}.": "Kadro {0} kişi olur: en az {1}.",
		"Lo pide tu técnico: si llega, te lo apunta.": "Hocan bir tane istiyor: gelirse not ediyor.",
		"Si fichas a uno de esa línea, el técnico te lo apunta.": "O hatta birini alırsan hocan bunu not eder.",
		"Marca a quién vendes y a quién fichas.": "Kimi sattığını ve kimi aldığını işaretle.",
		"Marcado ({0}). Te faltan {1}.": "İşaretli ({0}). {1} eksiğin var.",
		"Marcado ({0}). Te queda {1}.": "İşaretli ({0}). {1} hakkın kaldı.",
		"Mercado cerrado. La mesa abre con la próxima ventana, que dura {0} {1}.": "Transfer dönemi kapalı. Masa, {0} {1} sürecek bir sonraki dönemle açılır.",
		"Mercado cerrado: la mesa abre con la próxima ventana.": "Transfer dönemi kapalı: masa bir sonraki dönemle açılır.",
		"NO QUIERE VENIR": "GELMIYOR",
		"NO QUISO VENIR": "REDDETTI",
		"NO SALIERON": "OLMADI",
		"Nada de lo marcado sale hoy: mira los avisos en rojo.": "İşaretlediklerinin hiçbiri bugün gerçekleşmiyor: kırmızı uyarılara bak.",
		"Nadie lo compra hoy a ese precio.": "Bugün onu bu fiyata kimse almaz.",
		"No hay vuelta atrás: se mueve todo a la vez.": "Geri dönüş yok: her şey aynı anda gerçekleşir.",
		"No quiere venir: interés {0} % (mínimo {1} %).": "Gelmek istemiyor: ilgi %{0} (en az %{1}).",
		"PRESUPUESTO": "BUTCE",
		"QUEDA": "KALAN",
		"QUEDA EN LA MESA": "KALAN BUTCE",
		"SIN COMPRADOR": "ALICI YOK",
		"SIN DINERO": "PARA YOK",
		"Sin club no hay mesa de fichajes.": "Kulüp yoksa transfer masası da yok.",
		"Está cedido: quien lo tiene no lo puede vender.": "Kiralık: elinde tutan kulüp onu satamaz.",
		"Su club no lo vende: sólo sale pagando su cláusula.": "Kulübü onu satmıyor: ancak serbest kalma bedeli ödenirse ayrılır.",
		"Te faltan {0}: vende a alguien o quita un fichaje.": "{0} eksiğin var: birini sat ya da bir transferi çıkar.",
		"Te pagan un {0} % menos de lo que vale: el comprador sabe que tienes prisa.": "Sana değerinden %{0} az ödüyorlar: alıcı acelen olduğunu biliyor.",
		"ULTIMO {0}": "SON {0}",
		"VA AL {0}": "ALAN: {0}",
		"Va al {0} por {1} cuando confirmes la mesa.": "Masayı onayladığında {1} karşılığında {0} takımına gidiyor.",
		"Ventana abierta: {0} {1} por delante. Nada se mueve hasta que confirmes.": "Transfer dönemi açık: {0} {1} kaldı. Sen onaylayana kadar hiçbir şey olmaz.",
		"Ya juega en tu club.": "Zaten senin kulübünde oynuyor.",
		"DEF": "DEF",
		"MED": "OS",
		"DEL": "FOR",
	},
	"surf_casa": {
		"ALBERCA DE OLAS": "DALGA HAVUZU",
		"Alberca decorativa con olas en movimiento, agua translúcida y espuma. Incluye generador y tabla.": "Hareketli dalgalar, yarı saydam su ve köpükle dekoratif havuz. Dalga makinesi ve sörf tahtası dahil.",
	},
	"penthouse_tecnologia": {
		"SEMANA {0}": "{0}. HAFTA",
		"SOFÁ PENTHOUSE": "LUKS KANEPE",
		"Sofá modular de piel crema, nogal y latón. Recibe visitas en tu salón.": "Krem deri, ceviz ve pirinçten modüler kanepe. Misafirlerini salonunda ağırla.",
		"COMEDOR PENTHOUSE": "LUKS YEMEK MASASI",
		"Mesa de mármol negro con seis sillas de piel y detalles de latón.": "Siyah mermer masa, altı deri sandalye ve pirinç detaylar.",
		"CAMA PENTHOUSE": "LUKS YATAK",
		"Cama flotante de nogal con cabecero iluminado. Permite dormir de verdad.": "Aydınlatmalı başlıklı, ceviz asma yatak. Gerçekten uyumanı sağlar.",
		"ROBOT ASPIRADOR": "ROBOT SUPURGE",
		"Robot con base de carga. Recorre el suelo libre al colocarlo en casa.": "Şarj istasyonlu robot. Evine yerleştirince boş zeminde dolaşır.",
		"ESPEJO INTELIGENTE": "AKILLI AYNA",
		"Espejo de pie con pantalla: consulta tu estado y los próximos partidos.": "Ekranlı boy aynası: durumunu ve sıradaki maçları gör.",
		"MESA HOLOGRÁFICA": "HOLOGRAM MASA",
		"Mesa táctica con proyección 3D. Explora cuatro formaciones y gira la vista.": "3B projeksiyonlu taktik masası. Dört dizilişi incele ve görüşü döndür.",
		"CONSULTAR ESPEJO": "AYNAYA BAK",
		"EXPLORAR TÁCTICA": "TAKTIGI INCELE",
		"TECNOLOGÍA": "TEKNOLOJI",
		"Compra este objeto para usarlo.": "Kullanmak için bu eşyayı satın al.",
		"ENERGÍA {0}/100": "ENERJI {0}/100",
		"ÁNIMO {0} · LESIÓN: {1} SEMANAS": "MORAL {0} · SAKATLIK: {1} HAFTA",
		"PRÓXIMOS PARTIDOS": "SIRADAKI MAÇLAR",
		"No hay partidos programados.": "Planlanmış maç yok.",
		"FECHA POR CONFIRMAR": "TARIH BELLI DEGIL",
		"Tu estado se actualiza cada vez que consultas el espejo.": "Aynaya her baktığında durumun güncellenir.",
		"CAMBIAR ESQUEMA": "ŞEMA DEGIŞTIR",
		"VISTA INICIAL": "ILK GORUNUM",
		"Gira el campo con el dedo. Los esquemas son de consulta.": "Sahayı parmağınla döndür. Dizilişler sadece inceleme içindir.",
		"FORMACIÓN {0}": "DIZILIŞ {0}",
		"ÁNIMO {0} · LESIÓN: {1} DÍAS": "MORAL {0} · SAKATLIK: {1} GUN",
	},
	"basket_reloj": {
		"SEGUIDAS": "SERI",
		"CANASTAS": "BASKET",
		"LIMPIAS": "TEMIZ",
		"TIRO {0}/10": "ŞUT {0}/10",
		"POSICIÓN {0}/5": "NOKTA {0}/5",
		"Desliza hacia el aro y suelta.": "Çembere doğru kaydır ve bırak.",
		"2 por canasta · 3 limpia · +1 cada 3 seguidas": "Basket 2 · temiz 3 · her 3 seride +1",
		"¡LIMPIA!": "TEMIZ!",
		"CORTO · MÁS FUERZA": "KISA · DAHA GUÇLU",
		"LARGO · MENOS FUERZA": "UZUN · DAHA HAFIF",
		"IZQUIERDA · AJUSTA EL GESTO": "SOL · HAREKETI AYARLA",
		"DERECHA · AJUSTA EL GESTO": "SAG · HAREKETI AYARLA",
		"+{0} PUNTOS": "+{0} SAYI",
		"{0} PUNTOS · {1}/10": "{0} SAYI · {1}/10",
		"MEJOR RACHA {0} · LIMPIAS {1}": "EN IYI SERI {0} · TEMIZ {1}",
		"RÉCORD DE SESIÓN": "SEANS REKORU",
		"TIRO FALLADO": "KAÇAN ŞUT",
		"CANASTA DE BASKET": "BASKET POTASI",
		"RELOJ DE PIE": "AYAKLI SAAT",
		"Canasta con tablero, red y balón. Diez tiros haciendo flick hacia el aro.": "Panya, file ve toplu pota. Çembere doğru fiske atarak on şut.",
		"Reloj decorativo de madera con esfera, péndulo y pesas de latón.": "Kadranlı, sarkaçlı ve pirinç ağırlıklı dekoratif ahşap saat.",
		"JUGAR BASKET": "BASKET OYNA",
		"BASKET": "BASKET",
		"Toca el balón, haz flick hacia el aro y suelta.": "Topa dokun, çembere doğru fiske at ve bırak.",
		"TIRO {0}/10 · CANASTAS {1}": "ŞUT {0}/10 · BASKET {1}",
		"Compra una canasta para jugar.": "Oynamak için bir pota satın al.",
		"DIEZ TIROS · CINCO POSICIONES": "ON ŞUT · BEŞ NOKTA",
		"{0}/10 CANASTAS · MEJOR RACHA {1}": "{0}/10 BASKET · EN IYI SERI {1}",
		"OTRA RONDA": "TEKRAR",
		"DESLIZA HACIA LA CANASTA": "POTAYA DOGRU KAYDIR",
		"Desliza el balón hacia la canasta. Más rápido, más fuerte.": "Topu potaya doğru kaydır. Ne kadar hızlı, o kadar güçlü.",
		"TOCA EL BALÓN Y LANZA": "TOPA DOKUN VE AT",
		"¡CANASTA!": "BASKET!",
	},
	"pingpong_dedo": {
		"Mueve la raqueta con el dedo sobre la mesa. Toca para sacar.": "Raketi masanın üstünde parmağınla oynat. Servis için dokun.",
		"La raqueta sigue tu dedo. Golpea de lado para dirigir la pelota.": "Raket parmağını takip eder. Topu yönlendirmek için kenarıyla vur.",
	},
	"minijuegos_mandos": {
		"PARTIDA EN CURSO": "MAÇ SURUYOR",
		"SUAVE": "KOLAY",
		"EXPERTO": "UZMAN",
		"CONTROL": "KONTROL",
		"ATAQUE": "ATAK",
		"MEJOR INTERCAMBIO: {0}": "EN IYI RALLI: {0}",
		"Centra la pala para atacar; de canto, bloqueas suave.": "Atak için raketi ortala; kenarıyla yumuşak bloklarsın.",
		"La pelota tocó la red.": "Top fileye takıldı.",
		"La pelota salió de la mesa.": "Top masanın dışına çıktı.",
		"La pala no llegó a la pelota.": "Raket topa yetişemedi.",
		"La pelota botó dos veces.": "Top iki kez sekti.",
		"La pelota botó en el campo propio.": "Top vuranın tarafında sekti.",
		"El saque no botó en ambos campos.": "Servis iki tarafta da sekmedi.",
		"PUNTO DE PARTIDO": "MAÇ SAYISI",
		"ARRASTRA PARA GIRAR · SUELTA PARA CENTRAR": "SURUKLE: DON · BIRAK: ORTALA",
		"FUERA DEL ASFALTO: VUELVE A LA PISTA": "ASFALT DIŞI: PISTE DON",
		"CONTROL {0} · {1} s": "KONTROL {0} · {1} sn",
		"CONTROL PERDIDO · PUEDES REINICIAR EN PAUSA": "KONTROL KAÇTI · DURAKLATIP YENIDEN BAŞLAT",
		"Avance automático. Arrastra para girar y toca el freno.": "Otomatik sürüş. Yön için sürükle, fren için dokun.",
		"PRÓXIMO CONTROL: {0} m": "SONRAKI KONTROL: {0} m",
		"META: {0} m": "FINIŞ: {0} m",
	},


	"clausulas": {
		"NEGOCIAR CLÁUSULAS": "MADDELERI KONUŞ",
		"MANTÉN PARA PRESENTAR": "BASILI TUT: SUN",
		"Hasta {0}.": "En fazla {0}.",
		"ACEPTAN": "KABUL",
		"CONTRAOFERTA": "KARŞI TEKLIF",
		"×1": "×1",
		"×1,5": "×1,5",
		"×2": "×2",
		"×3": "×3",
		"NO JUEGAN CON ESE PUESTO": "O MEVKIDE OYNAMIYORLAR",
		"SU TITULAR ES MUCHO MEJOR": "ILK 11'DEKI ÇOK DAHA IYI",
		"ESPERAS SU RESPUESTA": "CEVAP BEKLENIYOR",
		"YA NEGOCIASTE LAS CLÁUSULAS": "MADDELER ZATEN KONUŞULDU",
		"SIN MESA ABIERTA": "AÇIK MASA YOK",
		"YA NEGOCIASTE ESTE AÑO": "BU YIL ZATEN KONUŞTUN",
		"Ya negociaste tus cláusulas esta temporada.": "Bu sezon maddelerini zaten konuştun.",
		"RENOVAR EN AGENTE": "MENAJERDE YENILE",
		"RENEGOCIAR EN AGENTE": "MENAJERDE PAZARLIK",
	},


	"avisos_hoy": {
		"HOY, EL TÍTULO": "ŞAMPIYONLUK",
		"HOY, EL ASCENSO": "ÇIKIŞ GUNU",
		"HOY, LA SALVACIÓN": "KURTULUŞ GUNU",
		"GANA Y LO SELLAS": "KAZAN VE MUHURLE",
		"UN PUNTO BASTA": "BIR PUAN YETER",
		"COMPRA UN MUEBLE": "MOBILYA AL",
		"MIRA QUIÉN TE SIGUE": "KIM IZLIYOR, BAK",
	},


	"alineaciones": {
		"ALINEACIONES": "KADROLAR",
	},


	"radio": {
		"TEMA DEL JUEGO": "ANA TEMA",
		"LUCES DEL ESTADIO": "STADYUM IŞIKLARI",
		"CAMINO A LA GLORIA": "ZAFERE GIDEN YOL",
		"DOMINGO DE SOL": "GUNEŞLI PAZAR",
		"NOCHE LARGA": "UZUN GECE",
		"SEMANA DE FINAL": "FINAL HAFTASI",
		"VENTANA DE FICHAJES": "TRANSFER DONEMI",
		"LEVANTAR LA COPA": "KUPAYI KALDIR",
		"NOCHE DE COPA": "KUPA GECESI",
		"NOCHE DE ESTRELLAS": "YILDIZLAR GECESI",
		"JUEVES EUROPEO": "AVRUPA GECESI",
		"CAMINO EUROPEO": "AVRUPA YOLU",
		"RADIO": "RADYO",
		"TOCA PARA CAMBIAR DE TEMA": "DOKUN, PARÇA DEGIŞSIN",
		"AL AZAR": "KARIŞIK",
		"Cada título que ganes suma su himno a la música del vestuario.": "Kazandığın her kupa, marşını soyunma odasının müziğine ekler.",
		"CAMPO AL AMANECER": "ŞAFAKTA SAHA",
		"LLUVIA SUAVE": "HAFIF YAGMUR",
		"HIERBA FRESCA": "TAZE ÇIMEN",
	},


	"resultado": {
		"SIN GOLES": "GOL YOK",
		"PARADA": "KURTARIŞ",
		"PARADAS": "KURTARIŞ",
	},


	"promo": {
		"¿TIENES UN CODIGO?": "KODUN MU VAR?",
		"CANJEAR CODIGO": "KODU KULLAN",
		"Escribe el código tal cual te lo dieron. Cada código se canjea una sola vez en este teléfono.": "Kodu sana verildiği gibi yaz. Her kod bu telefonda yalnızca bir kez kullanılabilir.",
		"TU CODIGO": "KODUN",
		"CANJEAR": "KULLAN",
		"COMPROBANDO...": "BAKILIYOR...",
		"Escribe un código.": "Bir kod yaz.",
		"No encontramos ese código. Si es nuevo, conéctate a internet y vuelve a probar.": "Bu kodu bulamadık. Yeniyse internete bağlan ve tekrar dene.",
		"Ese código ya no está activo.": "Bu kod artık aktif değil.",
		"Ese código ya caducó.": "Bu kodun süresi doldu.",
		"Ya canjeaste ese código en este teléfono.": "Bu kodu bu telefonda zaten kullandın.",
		"Ese código ya lo canjeó otra persona.": "Bu kodu başka biri zaten kullandı.",
		"Este código va a una carrera: ábrela y canjéalo desde su tienda.": "Bu kod bir kariyere gider: bir kariyer aç ve onun mağazasından kullan.",
		"Ese código no existe. Revisa que esté bien escrito.": "Böyle bir kod yok. Doğru yazdığını kontrol et.",
		"¡CODIGO CANJEADO!": "KOD KULLANILDI!",
		"+ {0} ★ EN TU HERENCIA": "+ {0} ★ LEGACY'YE",
		"ABIERTA EN TU HERENCIA: {0}": "LEGACY'DE AÇILDI: {0}",
	},
	"simulador_conduccion": {
		"Compra el simulador en CASA > COCHERA. Incluye un compacto para jugar.": "Simülatörü EV > GARAJ bölümünden satın al. Oynaman için kompakt bir araba dahil.",
		"Compacto incluido sólo para jugar. Tus compras desbloquean más coches.": "Kompakt araba sadece yarış için dahil. Satın aldıkların daha fazla araba açar.",
		"Incluye un compacto para jugar y permite usar tus coches comprados. No gasta dinero ni acciones semanales.": "Yarışman için kompakt bir araba dahil ve satın aldığın arabaları kullanmanı sağlar. Para ya da haftalık eylem harcamaz.",
		"Asiento deportivo, volante y tres pantallas. Incluye un compacto virtual; tus compras desbloquean más coches. Sin mantenimiento.": "Yarış koltuğu, direksiyon ve üç ekran. Sanal bir kompakt araba dahil; satın aldıkların daha fazla araba açar. Bakım masrafı yok.",
		"AUTO · A/D GIRAR · S FRENAR": "OTO · A/D DON · S FREN",
		"NUEVO RÉCORD DE TIEMPO": "YENI EN IYI SURE",
		"Sin récord: faltaron controles.": "Rekor yok: kontroller kaçırıldı.",
		"As del volante": "Direksiyon ası",
		"Cruzar los tres controles del simulador y llegar antes del tiempo objetivo.": "Simülatörün üç kontrol noktasından geç ve hedef süreden önce bitir.",
		"Primera Medalla": "İlk Madalya",
		"Sacar el oro en el simulador con el compacto urbano.": "Simülatörde şehir hatchback'iyle altın al.",
		"Piloto de Domingo": "Pazar Şoförü",
		"Terminar 25 vueltas en el simulador.": "Simülatörde 25 tur tamamla.",
		"Vuelta Limpia": "Temiz Tur",
		"Terminar una vuelta del simulador sin salirte nunca del asfalto.": "Asfalttan hiç çıkmadan bir simülatör turu tamamla.",
		"Cazamonedas": "Jeton Avcısı",
		"Recoger las 72 monedas en una vuelta del simulador.": "Simülatörde bir turda 72 jetonun hepsini topla.",
		"Pie a Fondo": "Gaz Sonuna Kadar",
		"Dar una vuelta con el hiperdeportivo sin tocar el freno ni salirte del asfalto.": "Hiper otomobille frene dokunmadan ve asfalttan çıkmadan bir tur at.",
		"Garaje de Oro": "Altın Garaj",
		"Sacar el oro en el simulador con los ocho coches.": "Simülatörde sekiz arabanın hepsiyle altın al.",
		"MONEDAS {0}/{1} · {2}": "JETON {0}/{1} · {2}",
		"PUNTOS DE ESTA CARRERA": "BU YARIŞIN PUANLARI",
		"CURVA CERRADA: FRENA": "KESKIN VIRAJ: FRENLE",
		"CONTROLES {0}/3 · OBJETIVO {1} s · MÁX. {2} km/h": "KONTROL {0}/3 · HEDEF {1} sn · MAKS. {2} km/sa",
		"OBJETIVO CUMPLIDO": "GOREV TAMAM",
		"OBJETIVO PENDIENTE": "GOREV KAÇTI",
		"El coche acelera solo. Mantén un botón para girar y los dos a la vez para frenar.": "Araba kendi hızlanır. Dönmek için bir tuşa, fren için ikisine birden basılı tut.",
		"LOS DOS: FRENO": "IKISI: FREN",
		"CAMBIAR COCHE": "ARABA SEÇ",
		"¡META!": "FINIŞ!",
		"¡BRONCE!": "BRONZ!",
		"¡PLATA!": "GUMUŞ!",
		"¡ORO!": "ALTIN",
		"MONEDAS {0}/{1}": "JETON {0}/{1}",
		"¡YA!": "GIT!",
		"TU RÉCORD: {0} s": "REKORUN: {0} sn",
		"SIN RÉCORD TODAVÍA": "HENUZ REKOR YOK",
		"CORRES CONTRA TU FANTASMA": "HAYALETINLE YARIŞIYORSUN",
		"SIGUIENTE MEDALLA: {0} s": "SIRADAKI MADALYA: {0} sn",
		"SIN MEDALLA": "MADALYA YOK",
		"MEDALLA DE BRONCE": "BRONZ MADALYA",
		"MEDALLA DE PLATA": "GUMUŞ MADALYA",
		"MEDALLA DE ORO": "ALTIN MADALYA",
	},


	"menu": {
		"SIMULADOR DE CARRERAS": "YARIŞ SIMULATORU",
		"Asiento deportivo, volante y tres pantallas. Conduce sólo los coches que has comprado. Sin mantenimiento.": "Yarış koltuğu, direksiyon ve üç ekran. Sadece satın aldığın arabaları sür. Bakım masrafı yok.",
		"Conduce los coches de tu colección. No gasta dinero ni acciones semanales.": "Koleksiyonundaki arabaları sür. Para ya da haftalık eylem harcamaz.",
		"CONDUCIR": "SUR",
		"SALIR": "ÇIKIŞ",


		"ligaSALIR": "AYRIL",
		"FRENAR": "FREN",
		"ACELERAR": "GAZ",
		"SIN COCHES": "ARABA YOK",
		"OTRA CARRERA": "TEKRAR YARIŞ",
		"Sólo tus coches. Sin gastos ni acciones semanales.": "Sadece senin arabaların. Masraf ya da haftalık eylem yok.",
		"Compra el simulador y un coche en CASA > COCHERA.": "Simülatörü ve bir arabayı EV > GARAJ bölümünden satın al.",
		"Llega a la meta. Salir del asfalto te frena.": "Finişe ulaş. Asfalttan çıkmak seni yavaşlatır.",
		"Mantén ACELERAR y dirige. Flechas o WASD en teclado.": "GAZ'a basılı tut ve yönlendir. Klavyede ok tuşları ya da WASD.",
		"META: {0} s · MEJOR DE ESTA SESIÓN: {1} s": "FINIŞ: {0} sn · SEANS REKORU: {1} sn",
		"COCHERA": "GARAJ",
		"COCHES": "ARABA",
		"La ampliación está ocupada. No se moverá tu construcción.": "Ek bina dolu. Yapın yerinden oynatılmayacak.",

		"COPIADO · PÉGALO DONDE QUIERAS": "KOPYALANDI · HER YERE YAPIŞTIR",

		"NOVEDADES": "YENILIKLER",
		"VERSIÓN {0}": "SURUM {0}",

		"POTENCIAL": "POTANSIYEL",
		"CONTACTO": "ILETIŞIM",
		"REDES": "SOSYAL",
		"CORREO": "POSTA",
		"¿Una idea, un fallo o sólo quieres saludar? Escríbeme directo.": "Bir fikrin mi var, bir hata mı buldun, yoksa sadece selam mı vermek istiyorsun? Bana doğrudan yaz.",





		"ESTE ESTADIO NO SABE TU NOMBRE.": "BU STADYUM ADINI BILMIYOR.",



		"¿CÓMO TE LLAMAS?": "ADIN NE?",
		"ESO EMPIEZA HOY.": "BUGUN BAŞLIYOR.",
		"IDIOMA": "DIL",
		"RANURA {0}": "YUVA {0}",


		"HOY, DERBI": "DERBI GUNU",
		"HOY, DERBI · {0}": "DERBI GUNU · {0}",
		"ACTIVA": "AKTIF",
		"CONTINUAR": "DEVAM",
		"VER LEGADO": "LEGACY",
		"Ranura libre.": "Boş yuva.",
		"+ NUEVA CARRERA": "+ YENI KARIYER",
		"{0} AÑOS": "{0} YIL",
		"SIN CLUB": "KULUPSUZ",
		"Sin club": "Kulüpsüz",
		"MÁS": "DAHA",
		"OTRAS RANURAS": "DIGER YUVALAR",
		"PRÁCTICA": "IDMAN",
		"AJUSTES": "AYARLAR",
		"LOGROS": "BAŞARI",
		"COLECCIÓN": "KOLEKSIYON",
		"EDITOR": "EDITOR",

		"CLUB Y PAIS": "KULUP VE ULKE",
		"TODOS": "TUMU",
		"PENDIENTES": "KILITLI",
		"LOGRADOS": "AÇILAN",
		"A PUNTO DE CAER": "ÇOK YAKIN",



		"{0} % del mundo": "Oyuncu oranı: %{0}",
		"Logro secreto. Sigue jugando para descubrirlo.":
			"Gizli başarım. Ortaya çıkarmak için oynamaya devam et.",

		"Preparando el estadio…": "Stadyum hazırlanıyor…",
		"Cargando…": "Yükleniyor…",
		"RESTAURAR": "GERI YUKLE",
		"RESTAURAR CARRERA": "KARIYERI GERI YUKLE",
		"Copias guardadas en iCloud.": "iCloud'a kaydedilen kopyalar.",
		"No se pudo restaurar la carrera.": "Kariyer geri yüklenemedi.",
		"Carrera restaurada.": "Kariyer geri yüklendi.",
		"VERSION MAS NUEVA": "DAHA YENI SURUM",
		"Se jugó después en {0}.": "Daha sonra {0} üzerinde oynandı.",
		"Se jugó después en otro aparato.": "Daha sonra başka bir cihazda oynandı.",
		"iCLOUD": "iCLOUD",
		"ESTE APARATO": "BU CIHAZ",
		"PARTIDO LIBRE": "SERBEST MAÇ",
		"ELIGE TU EQUIPO": "TAKIMINI SEÇ",
		"ELIGE EL RIVAL": "RAKIBI SEÇ",
		"ELIGE TU JUGADOR": "OYUNCUNU SEÇ",
		"Amistoso de exhibición · no cuenta para la carrera": "Gösteri maçı · kariyere sayılmaz",
		"PRÁCTICA LIBRE": "SERBEST IDMAN",
		"RECOMIENDA": "ONERIYOR",
		"ENCARGO": "GOREV",
		"DETALLE": "DETAY",
		"QUIERE VERTE": "SENI GORMEK ISTIYOR",
	},



	"compra": {
		"{0} PARTIDOS": "{0} MAÇ",
		"{0} GOLES": "{0} GOL",
		"{0} ASIST": "{0} ASIST",
		"La App Store no responde. Revisa tu conexión y vuelve a intentarlo.":
			"App Store yanıt vermiyor. Bağlantını kontrol et ve tekrar dene.",
		"Google Play no responde. Revisa tu conexión y vuelve a intentarlo.":
			"Google Play yanıt vermiyor. Bağlantını kontrol et ve tekrar dene.",
		"Tu pago quedó pendiente: lo recibirás en cuanto se confirme.":
			"Ödemen beklemede: onaylanır onaylanmaz alacaksın.",
		"Listo: ya recuperaste lo que habías comprado con esta cuenta de Google.":
			"Tamam: bu Google hesabıyla satın aldıklarını geri aldın.",
		"Esta cuenta de Google no tiene compras que recuperar en Football Legacy.":
			"Bu Google hesabının Football Legacy'de geri yüklenecek satın alımı yok.",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu cuenta de Google.":
			"Bunu oyun parasıyla değil, GERÇEK PARAYLA ödersin: Google hesabından tahsil edilir.",
		"GOOGLE PLAY":
			"GOOGLE PLAY",
		"Este aparato no tiene permitidas las compras.":
			"Bu cihazda satın alımlara izin verilmiyor.",

		"No se pudo completar la compra.": "Satın alma tamamlanamadı.",
		"Apple rechazó el pago.": "Apple ödemeyi reddetti.",
		"La compra no está disponible en tu región.":
			"Bu satın alma bölgende kullanılamıyor.",
		"No hay conexión con la App Store.": "App Store'a bağlanılamıyor.",
		"No se pudo verificar la compra con Apple. Se reintentará al volver a abrir el juego.":
			"Apple satın almayı doğrulayamadı. Oyunu bir sonraki açışında yeniden denenecek.",
	},










	"hub": {

		"SANCIONADO · {0} {1} DE CASTIGO": "CEZALI · {0} {1} MEN",

		"FORMA": "FORM",



		"ovrMEDIA": "GENEL",
		"NIVEL": "DUZEY",
		"DINERO": "PARA",
		"TEMPORADA": "SEZON",
		"{0} · {1} AÑOS": "{0} · {1} YAŞ",
		"AGENTE LIBRE · {0} AÑOS": "SERBEST · {0} YAŞ",
		"ENERGÍA {0}%": "ENERJI %{0}",

		"NO CONVOCADO": "KADRODA YOK",
		"BANQUILLO": "YEDEK",
		"YA NO QUEDAN CAMBIOS": "DEGIŞIKLIK HAKKI YOK",
		"SE VA {0}": "ÇIKAN: {0}",
		"¡PARADÓN DE {0}!": "DEV KURTARIŞ: {0}!",
		"{0} SE ESTIRA Y LA SACA": "{0} UZANIP ÇELIYOR",
		"LA ATAJA {0}": "{0} TUTUYOR",
		"SE SALVA EL PORTERO": "KALECI KURTARIYOR",
		"PARADAS EN EL PARTIDO": "MAÇTAKI KURTARIŞLAR",
		"asistA": "A",
		"PLANTILLAS": "KADROLAR",
		"RELATO": "ANLATIM",
		"OVR": "GNL",
		"ROTACIÓN": "ROTASYON",
		"TITULAR": "ILK 11",
		"INDISCUTIBLE": "VAZGEÇILMEZ",

		"AGENTE LIBRE": "SERBEST",
		"ELIGE CLUB": "KULUP SEÇ",
		"TE VENDEN": "SATIŞTASIN",
		"RESPONDE YA": "YANITLA",
		"EN VENTA": "SATILIK",
		"ESPERANDO OFERTAS": "TEKLIF BEKLIYOR",
		"CIERRA HOY": "SON GUN",
		"CIERRA EN {0}J": "KAPANIŞ: {0} H",
		"MERCADO CERRADO": "TRANSFER KAPALI",
		"ABRE EN {0}J": "AÇILIŞ: {0} H",
		"PRÓXIMA TEMPORADA": "GELECEK SEZON",

		"MERCADO DE VERANO": "YAZ DONEMI",
		"MERCADO DE INVIERNO": "KIŞ DONEMI",
		"VERANO": "YAZ",
		"INVIERNO": "KIŞ",

		"BUZON": "POSTA",
		"{0} NUEVOS": "{0} YENI",
		"AL DIA": "OKUNDU",
		"Elige tu próximo club": "Sonraki kulübünü seç",
		"¡TE BUSCAN!": "TALIP VAR!",
		"PLANTEL": "KADRO",
		"PERFIL": "PROFIL",
		"CONTRATO": "SOZLEŞME",
		"MERCADO": "PIYASA",
		"TIENDA": "MAGAZA",
		"ASPECTO": "GORUNUM",
		"CASUAL": "GUNLUK",
		"Tu ropa de calle. La eliges tú.": "Sokak kıyafetlerin. Seçimi sana kalmış.",
		"Eres el mismo con las dos ropas.": "İki kıyafetle de aynı kişisin.",
		"{0} · el uniforme es el de tu club.":
			"{0} · forma kulübünün.",



		"RELACIONES": "ILIŞKILER",

		"Para el próximo: {0}, ~{1}'.": "Sonraki maç: {0}, ~{1}'.",
		"El balón te llega ~{0} veces por partido.":
			"Top maç başına ~{0} kez sana geliyor.",
		"El balón te llega ~{0} vez por partido.":
			"Top maç başına ~{0} kez sana geliyor.",
		"Vales ${0} en el mercado.": "Piyasa değerin ${0}.",



		"famaDESCONOCIDO": "TANINMIYOR",
		"famaLOCAL": "YEREL",
		"famaCONOCIDO": "TANINAN",
		"famaCARA CONOCIDA": "UNLU",
		"famaESTRELLA": "YILDIZ",
		"{0} de {1} marcas te pueden ofertar.": "{1} markadan {0} tanesi sana teklif yapabilir.",
		"Y 1 ya te queda chica.": "Ve 1 tanesi artık sana küçük geliyor.",
		"Y {0} ya te quedan chicas.": "Ve {0} tanesi artık sana küçük geliyor.",
		"Estrella: esta temporada aguantas {0} partidos flojos sin que te olviden. Por debajo de {1} dejas de serlo.": "Yıldız: bu sezon unutulmadan {0} kötü maç kaldırabilirsin. {1} altına düşersen yıldızlığın biter.",
		"Estrella: esta temporada aguantas 1 partido flojo sin que te olviden. Por debajo de {0} dejas de serlo.": "Yıldız: bu sezon unutulmadan önce 1 kötü maç hakkın var. {0} altına düşersen yıldızlığın biter.",
		"Estrella: esta temporada ya te están olvidando. Por debajo de {0} dejas de serlo.": "Yıldız: bu sezon seni şimdiden unutmaya başladılar. {0} altına düşersen yıldızlığın biter.",
		"Sólo te llama una: te falta nombre. Con más prensa te llaman hasta tres.": "Sadece biri arıyor: adın yeterince büyük değil. Basında daha çok yer alırsan üçe kadar arayan olur.",
		"PUJA CON {0}: +{1} %": "{0} ILE YARIŞ: +%{1}",
		"Te saca +{0} de sueldo en cada oferta. Tócalo para darle un encargo.":
			"Her teklifte sana +{0} maaş kazandırır. Ona bir iş vermek için dokun.",
		"TUS RELACIONES": "ILIŞKILERIN",
		"TORNEOS": "TURNUVA",

		"CALENDARIO": "FIKSTUR",


		"CLASIF {0}": "ELEME {0}",
		"La temporada aún no tiene calendario.":
			"Sezonun henüz fikstürü yok.",

		"RANKING": "SIRALAMA",
		"RANKING DE JUGADORES": "OYUNCU SIRALAMASI",
		"Los jugadores de 1ª división del mundo, ordenados por su media."
			+ " Tú entras en la misma lista.":
			"Dünyanın 1. lig oyuncuları, genel reytinge göre sıralı. Sen de aynı listedesin.",
		"Ningún jugador cumple estos filtros. Prueba a soltar alguno.":
			"Bu filtrelere uyan oyuncu yok. Birini kaldırmayı dene.",
		"Ahora mismo no hay nadie sin club. La bolsa se llena al cerrar cada ventana de mercado.":
			"Şu an kulüpsüz kimse yok. Havuz her transfer döneminin kapanışında dolar.",
		"TU SITIO: {0}° DE {1}": "SIRAN: {0}/{1}",
		"A {0} de media del {1}°": "{1}. sıradakinin {0} genel gerisinde",
		"IR A MI FILA": "SIRAMA GIT",
		"MARCADOS": "IŞARETLI",
		"TODO": "TUMU",
		"PAÍS": "ULKE",
		"PORTEROS": "KALECILER",
		"DEFENSAS": "DEFANS",
		"MEDIOS": "ORTA SAHA",
		"DELANTEROS": "FORVETLER",
		"FILTRAR POR PUESTO": "MEVKI FILTRESI",
		"FILTRAR POR EDAD": "YAŞ FILTRESI",
		"FILTRAR POR VALOR": "DEGER FILTRESI",
		"DIVISIÓN": "KADEME",
		"FILTRAR POR LIGA": "LIG FILTRESI",
		"FILTRAR POR DIVISIÓN": "KADEME FILTRESI",
		"Los jugadores del mundo, por liga y división, ordenados por su media. Tú entras en la misma lista.": "Dünyanın oyuncuları, lig ve kademe bazında, genel reytinge göre sıralı. Sen de aynı listedesin.",
		"{0} PUESTOS": "{0} MEVKI",
		"FILTRAR POR PAÍS": "ULKE FILTRESI",
		"FILTRAR POR BANQUILLO": "KULUBE FILTRESI",
		"FILTRAR POR ESTRELLAS": "YILDIZ FILTRESI",
		"FILTRAR POR IDEA": "STIL FILTRESI",
		"IDEA": "STIL",
		"Ningún técnico cumple estos filtros.": "Bu filtrelere uyan teknik direktör yok.",
		"{0}-{1} DE {2}": "{0}-{1} TOPLAM {2}",
		"ANTERIOR": "ONCEKI",
		"PALMARÉS": "KUPALAR",
		"LEYENDAS": "EFSANE",
		"SELECCIÓN": "MILLI",
		"VITRINA": "VITRIN",



		"HISTORIA": "TARIH",
		"LEGADO": "LEGACY",



		"ABIERTO · {0}J": "AÇIK · {0}H",
		"EN VENTA · {0} OFERTAS": "SATIŞTA · {0} TEKLIF",

		"CLUBES Y LEYENDAS": "KULUP VE EFSANE",
		"JUGADOR DEL ANO · {0}": "YILIN OYUNCUSU · {0}",
		"{0} PUNTOS": "{0} PUAN",
		"TOPE {0}": "MAX {0}",
		"NIVEL {0}": "DUZEY {0}",
		"SIN CONTRATO": "SOZLEŞMESIZ",
		"ÚLTIMO AÑO": "SON YIL",
		"{0} TEMPORADAS": "{0} SEZON",

		"1 TEMPORADA": "1 SEZON",
		"{0}% SOBRE TU SUELDO": "MAAŞININ %{0} USTU",

		"PEDIR UN POCO": "BIRAZ ISTE",
		"PEDIR MUCHO": "ÇOK ISTE",
		"+{0} si acepta": "+{0} kabul ederse",
		"ROMPER EL HIELO": "BUZLARI ERIT",
		"YA ROMPISTE EL HIELO": "BUZLAR ERIDI",
		"Hablan de otra cosa un rato · SE RELAJA":
			"Bir süre başka şeylerden konuşursunuz · YUMUŞAR",
		"EL DURO": "SERT",
		"EL AMABLE": "KIBAR",
		"EL SUSCEPTIBLE": "ALINGAN",
		"EL PACIENTE": "SABIRLI",

		"SU HUMOR": "KEYFI",
		"DE BUENAS": "KEYFI YERINDE",
		"SE LO PIENSA": "DUŞUNUYOR",
		"IMPACIENTE": "SABIRSIZ",
		"HARTO": "BIKTI",
		"TE CEDEN": "KIRALIK",
		"{0} OFERTAS": "{0} TEKLIF",
		"{0} DESTINO": "{0} TALIP",
		"{0} DESTINOS": "{0} TALIP",
		"CERRADO": "KAPALI",
		"SIN OFERTAS · {0}J": "TEKLIF YOK · {0}H",
		"{0} OFERTAS · {1}J": "{0} TEKLIF · {1}H",


		"CIERRA HOY · {0} OFERTAS": "BUGUN BITER · {0} TEKLIF",
		"{0} OFERTAS SOBRE LA MESA": "MASADA {0} TEKLIF",

		"MEJORA": "ZAM",
		"TU CLUB TE LA OFRECE": "KULUBUN SUNUYOR",
		"TU CLUB TE MEJORA": "KULUBUN ZAM VERIR",
		"Se adelanta a los que vienen a por ti.": "Seni isteyenler gelmeden önce davranıyorlar.",
		"EL MEJOR QUE TRAJISTE": "GETIRDIGIN EN IYI",
		"{0} partidos · nota {1}": "{0} maç · not {1}",
		"EL TECNICO PIDE": "HOCA ISTIYOR",
		"Si fichan a uno de esa línea: +{0} % de que salga y el técnico te lo apunta.": "O bölgeden birini alırlarsa: +{0} % gelme şansı ve hoca bunu not eder.",
		"Ya le trajiste uno: te lo apunta.": "Ona zaten birini getirdin: not etti.",
		"Lo pide el técnico: sale más fácil": "Hoca bunu istiyor: transferi daha kolay",
		"SUBIR": "YUKARI",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede. SUBIR cambia el orden.": "Bu sırayla denerler: biri imzalarsa diğerleri kalanla teklif verir. YUKARI sırayı değiştirir.",
		"PAGAR LO QUE PIDEN": "ISTENENI ODE",
		"REGATEAR -{0} %": "PAZARLIK -%{0}",
		"MANDAR OJEADOR ({0})": "GOZCU GONDER ({0})",
		"Ojeado: el club ya se fía de él.": "Gözlendi: kulüp artık ona güveniyor.",
		"QUITAR DE LA VENTA": "SATIŞTAN ÇEK",
		"PONER EN VENTA": "SATIŞA ÇIKAR",
		"En venta: en la próxima ventana se ofrece a un club de su nivel, un {0} % por debajo de su valor.": "Satışta: bir sonraki dönemde kendi seviyesindeki bir kulübe, değerinin {0} % altında teklif edilir.",
		"Ya tienes {0} en venta.": "Satışta zaten {0} oyuncun var.",
		"Se ofrecen al abrir la ventana a clubes de su nivel, un {0} % por debajo de su valor. Se quitan desde su ficha.": "Dönem açılınca kendi seviyelerindeki kulüplere, değerlerinin {0} % altında teklif edilirler. Kartlarından kaldırabilirsin.",
		"No vendría a tu club: no casa con su categoría.": "Kulübüne gelmez: seviyesine uymuyor.",
		"RETIRAR LA PETICION": "TALEBI GERI ÇEK",
		"SI DICE QUE NO, TU TÉCNICO LO SABE": "HAYIR DERSE HOCAN DA DUYAR",
		"PETICIONES": "TALEPLER",
		"TODAVÍA NADA": "HENUZ YOK",
		"TU TÉCNICO CUMPLE": "HOCAN SOZUNU TUTAR",
		"DE TUS {0} MEJORES": "EN IYI {0} ARASINDA",
		"SUPLENTE Y CLUB EN APURO": "YEDEK VE KULUP ZORDA",
		"VETERANO SUPLENTE": "YAŞLI YEDEK",
		"DEJAS LA CAJA VACIA": "KASAYI BOŞALTIRSIN",
		"NADIE PARA TU PUESTO": "MEVKIINDE KIMSE YOK",
		"VAS EN RACHA": "SERIDESIN",
		"Si te lo cede: -{0} con el vestuario.": "Sana bırakırsa: soyunma odasıyla -{0}.",
		"Se lo pediste al club: {0} % de que lo traiga en la próxima ventana de técnicos.": "Kulüpten istedin: bir sonraki teknik direktör döneminde getirme şansı {0} %.",
		"El club lo decide en la próxima ventana de técnicos (invierno o final de temporada). Si dice que no, tu técnico se entera.": "Kulüp bunu bir sonraki teknik direktör döneminde (devre arası ya da sezon sonu) karara bağlar. Hayır derse hocan duyar.",
		"El club te hizo caso: llegó {0}.": "Kulüp seni dinledi: gelen isim {0}.",
		"El club dijo que no a {0}, y tu técnico se enteró.": "Kulüp {0} için hayır dedi ve hocan bunu duydu.",
		"El club cambió de técnico, pero no trajo a {0}.": "Kulüp hoca değiştirdi ama gelen isim {0} olmadı.",
		"{0} ya no estaba a tu alcance.": "{0} artık ulaşılmaz oldu.",
		"¿Otro técnico? Pídelo desde su ficha, en {0}, pestaña {1}.": "Başka bir hoca mı? Kartından iste: {0}, {1} sekmesi.",
		"PEDISTE A": "ISTEDIN",
		"QUE LO TRAIGAN": "GELME ŞANSI",
		"QUE LO ECHEN": "KOVULMASI",
		"ENCAJA": "UYUYOR",
		"NO ENCAJA": "UYMUYOR",
		"CUMPLE SUS METAS": "HEDEFTE",
		"PEDIR QUE LO ECHEN": "KOVULMASINI ISTE",
		"ELEGIR QUIÉN VIENE · NIVEL {0}": "YERINE KIM GELSIN · DUZEY {0}",
		"{0} · FUERA": "{0} · GIDER",
		"{0} SIN VICTORIA": "{0} MAÇ ZAFERSIZ",
		"El club te hace caso: destituye al técnico": "Kulüp seni dinliyor: teknik direktör görevden alındı",
		"Se decide en la próxima ventana de técnicos: la de invierno o el final de la temporada. Si dice que no, tu técnico se entera.": "Bir sonraki teknik direktör döneminde karar verilir: devre arası ya da sezon sonu. Hayır derse hocan duyar.",
		"El club te hace caso: llega {0} al banquillo": "Kulüp seni dinliyor: kulübeye {0} geliyor",
		"NO LO VENDAIS": "SATMAYIN",
		"QUITAR PROTECCION": "KORUMAYI KALDIR",
		"Protegido: el club no lo vende ni lo cede y pide el doble por él. Si lo pagan, se va igual; cada ventana en que rechace ofertas te quita {0} de relación.": "Korumada: kulüp onu satmaz, kiralamaz ve iki katını ister. Biri öderse yine de gider; kulübün teklif reddettiği her dönem sana {0} ilişki kaybettirir.",
		"QUE LO RENUEVEN": "SOZLEŞME UZAT",
		"Se decide en la próxima ventana de contratos.": "Bir sonraki sözleşme döneminde karar verilir.",
		"Pedido: {0} % de que renueve en la próxima ventana de contratos.": "İstendi: bir sonraki sözleşme döneminde uzatma şansı {0} %.",
		"Si lo pides: {0} % de que renueve.": "İstersen: uzatma şansı {0} %.",
		"Ya pides {0} renovaciones.": "Zaten {0} sözleşme uzatması istiyorsun.",
		"INTOCABLE": "KORUNUYOR",
		"PROTEGES A": "KORUDUGUN",
		"Pagaron el doble ({2}) y {0} se fue a {1}.": "İki katını ({2}) ödediler ve {0} gitti; yeni kulübü {1}.",
		"El club rechazó {0} de {1} por {2}.": "Kulüp, {2} için {1} kulübünden gelen {0} tutarındaki teklifi reddetti.",
		"Te cuesta {0} de relación hasta final de temporada.": "Sezon sonuna kadar sana {0} ilişki kaybettirir.",
		"RENOVACIONES": "YENILEMELER",
		"{0} renovo.": "{0} sözleşme uzattı.",
		"El club no quiso renovar a {0}.": "Kulüp, {0} adlı oyuncunun sözleşmesini uzatmak istemedi.",
		"{0} no quiso renovar.": "{0} sözleşme uzatmak istemedi.",
		"{0} ya había firmado con otro club.": "{0} zaten başka bir kulüple anlaşmıştı.",
		"PIDE UN PUESTO": "MEVKI ISTE",
		"El club busca un {0}: va a por {1}.": "Kulüp bir {0} arıyor: hedefi {1}.",
		"Tú pides el puesto y el club elige a quién: sale más a menudo y, si se cae, prueba con otro. Gasta una recomendación.": "Sen mevkiyi istersin, kulüp kimi alacağını seçer: daha sık tutar ve olmazsa başkasını dener. Bir tavsiye hakkı harcar.",
		"No te quedan recomendaciones esta temporada.": "Bu sezon tavsiye hakkın kalmadı.",
		"Ya hay un puesto pedido.": "Zaten istenmiş bir mevki var.",
		"El club no encuentra a nadie mejor para ese puesto.": "Kulüp o mevki için daha iyisini bulamıyor.",
		"VENTANAS ANTERIORES": "ONCEKI DONEMLER",
		"Gastado {0} · ventas {1}": "Harcanan {0} · satışlar {1}",
		"RENOVACIÓN SOBRE LA MESA": "MASADA UZATMA TEKLIFI",
		"SALDRÁS LIBRE AL CIERRE": "SONUNDA BEDELSIZ AYRILIRSIN",
		"ABIERTO · {0} FICHAJES": "AÇIK · {0} TRANSFER",
		"OBJETIVO": "HEDEF",
		"VAS CORTO": "GERIDESIN",
		"{0} DE {1} · VAS CORTO": "{0}/{1} · GERIDESIN",
		"RÉCORD A LA VISTA": "REKOR GORUNDU",
		"A {0} {1} DEL LIBRO": "REKORA {0} {1}",
		"GOL": "GOL",


		"ESTA TEMPORADA POR TORNEO": "BU SEZON TURNUVA BAZINDA",
		"TORNEO": "KUPA",
		"CHAMPIONS": "ELIT",
		"EUROPA": "AVRUPA",
		"CONFERENCE": "CHALLENGE",
		"MUNDIALITO": "KULUPLER",
		"{0} OFERTAS · {1} EXPIRA HOY": "{0} TEKLIF · {1} BUGUN BITER",
		"{0} OFERTAS · {1} EXPIRAN HOY": "{0} TEKLIF · {1} BUGUN BITER",
		"NEGOCIACIÓN": "PAZARLIK",
		"{0} CLUBES RESPONDIERON": "{0} KULUP YANIT VERDI",


		"{0} TE BUSCAN · YA": "{0} TALIP · HEMEN",
		"{0} MARCAS": "{0} MARKA",
		"SIN JUGAR": "MAÇ YOK",
		"{0} EN LIGA": "LIGDE {0}",
		"CONVOCADO": "KADRODA",


		"seleccionFUERA": "YOK",
		"{0} TROFEOS": "{0} KUPA",
		"{0} GOLES": "{0} GOL",

		"TIENES {0} {1} SIN REPARTIR": "{0} {1} HARCANMADI",
		"SEMANA · {0} DE {1} ACCIONES": "HAFTA · {0}/{1} EYLEM",




		"previaGANAS": "GALIP",
		"previaEMPATE": "BERAB.",
		"previaPIERDES": "MAGL.",
		"iniV": "G",
		"iniE": "B",
		"iniD": "M",




		"SUBIR HABILIDADES · {0}": "YETENEK PUANI · {0}",
		"SIN PUNTOS": "PUAN YOK",
		"PERSONALIZAR": "OZELLEŞTIR",
		"MENÚ": "MENU",

		"ELEGIR CLUB": "KULUP SEÇ",
		"LESIONADO · VER LA JORNADA": "SAKAT · HAFTAYI IZLE",
		"LESIONADO · {0} {1} DE BAJA": "SAKAT · {0} {1} YOKSUN",
		"YA USADA": "KULLANILDI",
		"{0} {1} DE BAJA": "{0} {1} YOKSUN",

		"ALTA MÉDICA": "OYNAYABILIR",
		"VUELVES AL EQUIPO": "TAKIMA DONDUN",
		"PARTIDOS PERDIDOS": "KAÇAN MAÇLAR",
		"El cuerpo aguantó. El puesto no se guardó solo: ahora hay que "
		+ "ganárselo otra vez.":
			"Vücut dayandı. Yerin kendi kendine korunmadı: şimdi onu yeniden kazanman lazım.",
		"LA TEMPORADA, EN EL AIRE": "SEZON BELIRSIZ",
		"MESES FUERA": "AYLARCA YOK",
		"BAJA LARGA": "UZUN SAKATLIK",
		"TE PIERDES LO QUE VIENE": "GELENLERI KAÇIRIRSIN",
		"SEMANAS DE BAJA": "HAFTALARCA YOK",
		"{0} SEMANAS DE BAJA": "{0} HAFTA YOKSUN",
		"Vuelves cuando el cuerpo diga. Mientras tanto el equipo juega sin ti "
		+ "y el puesto no se guarda solo.":
			"Vücudun izin verince dönersin. Bu arada takım sensiz oynar ve yerin kendi kendine korunmaz.",
		"Esta baja ya te costó {0} {1}": "Bu sakatlık sana şimdiden {0} {1} kaybettirdi",
		"SIMULAR {0}": "SIMULE {0}",
		"JUGAR CON TU SELECCIÓN": "MILLI TAKIMLA OYNA",
		"FECHA DE SELECCIONES": "MILLI ARA",
		"FECHA DE SELECCIONES · SALES DE TITULAR": "MILLI ARA · ILK 11",
		"FECHA DE SELECCIONES · ENTRAS DESDE LA BANCA": "MILLI ARA · YEDEKTEN GIRIŞ",
		"VER EL PARTIDO": "MAÇI IZLE",
		"JUGAR PARTIDO": "MAÇI OYNA",
		"MANTENER PARA PASAR A FIN DE TEMPORADA": "SEZONU BITIRMEK IÇIN BASILI TUT",
		"LA TEMPORADA HA TERMINADO": "SEZON BITTI",

		"TE LO PERDISTE LESIONADO": "SAKATLIKTAN KAÇIRDIN",
		"TE VE FLOJO DE": "ZAYIF YONUN",
		"NO CONVOCADO · TE VE FLOJO DE {0}": "KADRO DIŞI · ZAYIF YON: {0}",
		"EL MÍSTER TE PIDE ALGO": "HOCANIN BIR ISTEGI VAR",
		"NO TE CONVOCARON": "KADRO DIŞISIN",
		"Algo es algo.": "Hiç yoktan iyidir.",
		"Aprovecha para entrenar e impresionar al míster.": "Fırsatı antrenman yapıp hocayı etkilemek için kullan.",
		"Porterías chiquitas": "Mini kaleler",
		"Métela en la portería pequeña, no en la grande. Cada balón sale de más lejos.": "Topu küçük kaleye at, büyüğüne değil. Her top daha uzaktan başlar.",
		"Jala y suelta a la portería pequeña": "Geri çek ve küçük kaleye bırak",
		"Rompe las dianas": "Hedefleri kır",
		"Eslalon con rival": "Rakipli slalom",
		"OTRO BALÓN": "BAŞKA TOP",
		"Pisa los conos con el balón. El chico paga el triple, pero está del lado del que te marca.": "Topla konilere bas. Küçük olan üç kat puan verir ama sana markaj yapan oyuncunun tarafında.",
		"Arrastra para conducir; no se tira": "Sürmek için sürükle; şut yok",
		"Rompe las dianas del arco. La chiquita de arriba paga el triple que la gorda de abajo.": "Kaledeki hedefleri kır. Yukarıdaki küçük, aşağıdaki büyükten üç kat puan verir.",
		"Jala y suelta a una diana": "Geri çek ve bir hedefe bırak",
		"TU RÉCORD": "REKORUN",
		"NUEVO RÉCORD": "YENI REKOR",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario distinto. Aquí no se juega nada de la carrera — el que cuenta es EL ENCARGO DEL MÍSTER, y ése sale la jornada que no te convocan. Se sale con PAUSA.": "Bir antrenman seç ve istediğin kadar tekrarla: her deneme farklı bir senaryo kurar. Buradakiler kariyerini etkilemez — sayılan HOCANIN GOREVI, o da kadroya alınmadığın hafta çıkar. DURAKLAT ile çıkılır.",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada de esto cuenta para la carrera — el que cuenta es EL ENCARGO DEL MÍSTER. Se sale con PAUSA.": "Bir pozisyon seç ve istediğin kadar tekrarla: her deneme o türden farklı bir senaryo kurar. Bunların hiçbiri kariyerine sayılmaz — sayılan HOCANIN GOREVI. DURAKLAT ile çıkılır.",
		"Ya te vio cumplir. Ahora te pide más.": "Sözünü tuttuğunu gördü. Şimdi daha fazlasını istiyor.",
		"EL MÍSTER TE MIRA EN": "HOCA SENI IZLIYOR:",
		"LA PRÓXIMA": "SIRADAKI",
		"TE VE FLOJO DE {0}": "ZAYIF YONUN: {0}",
		"LA META": "HEDEF",
		"COMPLETA EL CIRCUITO": "PARKURU BITIR",
		"EL PRECIO": "BEDELI",
		"-{0} ENERGÍA": "-{0} ENERJI",
		"CUMPLIR EL ENCARGO": "GOREVI YAP",
		"SOLO SIMULAR": "SIMULE ET",
		"EL ENCARGO": "GOREV",
		"NO LLEGASTE": "YETMEDI",
		"Así sí. El sábado te veo en la lista.": "İşte böyle. Cumartesi seni kadroda görürüm.",
		"Otra semana igual y no.": "Bir hafta daha böyle olursa kadroda yoksun.",
		"EL PRÓXIMO": "SIRADAKI",
		"SIGUES FUERA": "HALA YOKSUN",
		"TE DAN DESCANSO": "DINLENDIRILDIN",
		"Te llegan balones y no los defines": "Toplar sana geliyor ama bitiremiyorsun",
		"Le pegas flojo": "Topa yumuşak vuruyorsun",
		"No sabes curvarla": "Topa falso veremiyorsun",
		"No me das confianza desde los once": "Penaltıda bana güven vermiyorsun",
		"Los balones parados los tira otro": "Duran topları başkası kullanıyor",
		"El primero que te sale te come": "Üstüne gelen ilk adam seni yiyip bitiriyor",
		"NO FUISTE CONVOCADO": "KADROYA ALINMADIN",
		"{0} ganó sin ti": "{0} sensiz kazandı",
		"Tu selección": "Milli takımın",
		"Tu equipo": "Takımın",
		"Empató sin ti": "Sensiz berabere kaldı",
		"Perdió sin ti": "Sensiz kaybetti",
		"Recuperado: vuelves el próximo partido": "İyileştin: bir sonraki maçta dönüyorsun",
		"Te quedan {0} {1} de baja": "Sakatlığının bitmesine {0} {1} var",
		"Sin goles": "Gol yok",
		"TU EQUIPO": "TAKIMIN",
		"Gol": "Gol",


		"A puerta": "İsabetli",
		"Fuera del marco": "İsabetsiz",
		"Tapado": "Engellendi",

		"SIN TIEMPO ESTA SEMANA": "BU HAFTA VAKIT YOK",
		"NO TE ALCANZA": "PARAN YETMEZ",
		"LO PIENSO": "DUŞUNECEGIM",
		"ANTES DEL MERCADO": "TRANSFERDEN ONCE",
		"DESPUÉS DEL PARTIDO": "MAÇTAN SONRA",
		"CÓMO QUEDAN LAS COSAS": "SON DURUM",
		"TU DECISIÓN": "KARAR SENIN",
		"otro club": "başka bir kulüp",
		"Un intermediario te susurra que al {0} le gustas. Si dices que te interesaría, "
		+ "puede que oferten por ti en el mercado… pero en tu club no te lo perdonarán.":
			"Bir aracı, {0} kulübünün senden hoşlandığını fısıldıyor. İlgilendiğini söylersen transfer döneminde sana teklif yapabilirler… ama kulübün bunu asla affetmez.",

		"Técnico": "Teknik direktör",
		"Vestuario": "Soyunma odası",

		"SOCIEDAD": "ORTAKLIK",


		"YA JUGASTEIS JUNTOS EN {0}": "BIRLIKTE OYNADINIZ: {0}",
		"TAMBIÉN PASÓ POR {0}": "O DA OYNADI: {0}",
		"VIENE DE {0}, TU RIVAL": "RAKIBIN {0} TAKIMINDAN",


		"SOCIO": "ORTAK",

		"SÓLO CABE UNO": "TEK KIŞILIK",
		"SABES DÓNDE ESTUVO": "NEREDEYDI, BILIYORSUN",
		"{0} salió la víspera y lo sabes tú solo. El míster acaba de preguntar en voz alta por qué se movió como si llevara piedras en los pies.": "{0} maçtan önceki gece dışarı çıktı ve bunu bir tek sen biliyorsun. Hoca az önce yüksek sesle, neden ayaklarında taş varmış gibi hareket ettiğini sordu.",
		"TAPARLO": "ORT BAS ET",
		"EL GOL ES TUYO": "GOL SENIN",
		"Acabas de marcar y la grada corea tu nombre. {0} lleva un mes sin jugar y te mira desde el banquillo, aplaudiendo con las manos flojas.": "Az önce gol attın ve tribün adını haykırıyor. {0} bir aydır oynamıyor ve yedek kulübesinden seni gönülsüzce alkışlıyor.",
		"DEDICÁRSELO": "ONA ARMAGAN ET",
		"CORRER A LA GRADA": "TRIBUNE KOŞ",
		"TE PIDE DINERO": "SENDEN PARA ISTIYOR",
		"{0} te llama de noche y tarda un rato en llegar al punto: en su casa hay un lío y necesita una mano. No dice cuándo te lo devuelve.": "{0} gece seni arıyor ve sadede gelmesi biraz sürüyor: evde bir sorun var ve yardıma ihtiyacı var. Ne zaman geri ödeyeceğini söylemiyor.",
		"PRESTÁRSELO": "ODUNÇ VER",
		"SU ÚLTIMO DÍA": "SON GUNU",
		"El traspaso de {0} está firmado y mañana ya no entrena aquí. El vestuario hará lo de siempre: un aplauso, una foto y a lo suyo.": "{0} adlı oyuncunun transferi imzalandı ve yarın artık burada antrenman yapmayacak. Soyunma odası her zamanki gibi yapacak: bir alkış, bir fotoğraf ve herkes işine.",
		"ORGANIZARLE UNA DESPEDIDA": "ONA VEDA PARTISI DUZENLE",
		"UN ABRAZO Y YA": "SARIL, O KADAR",
		"Un programa os invita a {0} y a ti, pero la productora sólo tiene caché para uno y te lo ha ofrecido a ti primero. Él todavía no lo sabe.": "Bir program seni ve {0} adlı oyuncuyu davet ediyor ama yapımcı sadece birine ücret ödeyebiliyor ve önce sana teklif etti. O henüz bilmiyor.",
		"QUE VAYA ÉL": "O GITSIN",
		"IR YO": "GIDERIM",

		"LO DEJÓ FUERA": "KADRO DIŞI",
		"{0} no entró en la lista y lleva media hora sin hablar con nadie. Tú sí juegas, y el míster te escucha más que a él.": "{0} kadroya giremedi ve yarım saattir kimseyle konuşmuyor. Sen oynuyorsun ve hoca seni ondan daha çok dinliyor.",
		"HABLAR POR ÉL": "ONUN IÇIN KONUŞ",
		"NO ES MI PELEA": "KARIŞMAM",
		"OS GRITASTEIS": "BAGIRIŞTINIZ",
		"Le pediste el balón a gritos, él te contestó peor, y el banquillo entero lo vio. En el vestuario nadie ha dicho una palabra desde entonces.": "Bağırarak topu istedin, o daha kötü cevap verdi ve bütün yedek kulübesi gördü. O zamandan beri soyunma odasında kimse tek kelime etmedi.",
		"PEDIR PERDÓN YO": "OZUR DILE",
		"QUE SE LE PASE": "SAKINLEŞSIN",
		"LA REHABILITACIÓN ES SOLA": "REHABILITASYON YALNIZDIR",
		"{0} se rompió y hace la recuperación por su cuenta, en un gimnasio vacío mientras los demás entrenan. Nadie va a saber si apareces o no.": "{0} sakatlandı ve diğerleri antrenman yaparken boş bir spor salonunda tek başına iyileşmeye çalışıyor. Gidip gitmediğini kimse bilmeyecek.",
		"ACOMPAÑARLO": "YANINDA OL",
		"YA VOLVERÁ": "NASILSA DONER",
		"TE QUIERE DE PADRINO": "SENI SAGDIÇ ISTIYOR",
		"{0} se casa en pretemporada y te pide que estés a su lado. Es un fin de semana entero, y tú tenías otros planes con tu descanso.": "{0} sezon öncesinde evleniyor ve yanında olmanı istiyor. Koca bir hafta sonu, ve senin dinlenmek için başka planların vardı.",

		"ÉL QUIERE EL PENALTI": "PENALTIYI O ISTIYOR",
		"{0} lleva tres partidos sin marcar y te pide el próximo penalti. Los dos sabéis que el goleo del año se decide en detalles como éste.": "{0} üç maçtır gol atamıyor ve bir sonraki penaltıyı senden istiyor. İkiniz de sezonun gol krallığı yarışının böyle ayrıntılarda belirlendiğini biliyorsunuz.",
		"SE LO DEJO": "ONA BIRAK",
		"LOS TIRO YO": "BEN ATARIM",
		"TE PREGUNTAN POR ÉL": "ONU SORUYORLAR",
		"Un periodista quiere que valores el mal momento de {0}. La pregunta viene con la respuesta puesta y toda la sala esperando.": "Bir gazeteci {0} adlı oyuncunun kötü gidişini yorumlamanı istiyor. Sorunun cevabı içinde hazır ve bütün salon bekliyor.",
		"LO DEFIENDO": "ONU SAVUN",
		"NO ME MOJO": "TARAFSIZ KAL",
		"CENA EN SU CASA": "EVINDE AKŞAM YEMEGI",
		"{0} te invita a cenar con su familia la víspera del partido. Es media noche que no duermes, y de las que se recuerdan.": "{0} maçtan önceki gece seni ailesiyle yemeğe davet ediyor. Yarım gece uykusuz kalırsın, ama unutulmayacak cinsten.",
		"VOY": "OLUR",
		"LA SOCIEDAD": "ORTAKLIK",
		"en este partido": "bu maçta",
		"y {0} más": "ve {0} daha",
		"Afición": "Taraftar",
		"Prensa": "Basın",
		"Agente": "Menajer",
		"Pareja": "Partner",
		"{0} energía": "{0} enerji",
		"o": "ya da",
		"· 1 acción": "· 1 eylem",
		"· posible oferta": "· olası teklif",

		"VS": "VS",
		"GANASTE": "YENDIN",
		"EMPATASTE": "BERABERE",
		"PERDISTE": "YENILDIN",
		"GOL DE {0}": "GOL: {0}",
		"{0} DE {1}": "{1} {0} GOL",
		"EN CASA": "EVDE",
		"XP {0} / {1} · AL NIVEL {2}": "XP {0} / {1} · DUZEY {2}",
		"{0} {1} SIN ASIGNAR · REPARTELOS": "{0} {1} HARCANMADI · DAGIT",
		"LA CARRERA": "YARIŞ",
		"EL CUADRO": "EŞLEŞME",
		"LA TABLA": "TABLO",


		"GOLEADORES": "GOLCULER",
		"GRUPO {0} · PASAN {1}": "GRUP {0} · ILK {1}",


		"FASE DE LIGA · {0}/{1} · {2}": "LIG AŞAMASI · {0}/{1} · {2}",
		"A OCTAVOS": "SON 16'YA",
		"AL PLAYOFF": "PLAY-OFF'A",





		"faseligaFUERA": "VEDA",
		"EN LISTA DE VENTA": "SATIŞ LISTESINDE",
		"EN LISTA DE CESIÓN": "KIRALIK LISTESINDE",
		"CESIÓN · {0} DESTINOS": "KIRALIK · {0} TALIP",
		"VER LA JORNADA": "HAFTAYI IZLE",
		"SIMULAR PARTIDO": "MAÇI SIMULE ET",
		"NO CONVOCADO · LO VES DESDE LA GRADA": "KADRO DIŞI · TRIBUNDEN IZLE",
		"SALES DE TITULAR · ~{0} MIN": "ILK 11 · ~{0} DK",


		"DERBI · TITULAR · ~{0} MIN": "DERBI · ILK 11 · ~{0} DK",
		"DERBI · DESDE LA BANCA · ~{0} MIN": "DERBI · YEDEKTEN · ~{0} DK",
		"ENTRAS DESDE LA BANCA · ~{0} MIN": "YEDEKTEN GIRIYORSUN · ~{0} DK",
		"SIN GASOLINA · EMPIEZAS EN LA BANCA · ~{0} MIN": "BENZIN BITTI · YEDEKTE BAŞLIYORSUN · ~{0} DK",
		"EL MÍSTER NO TE QUIERE · DESDE LA BANCA · ~{0} MIN": "HOCA SENI ISTEMIYOR · YEDEKTEN · ~{0} DK",
		"TE CUIDAN AL VOLVER · DESDE LA BANCA · ~{0} MIN": "YAVAŞ DONUŞ · YEDEKTEN · ~{0} DK",
		"EL TÉCNICO TE DA UNA OPORTUNIDAD": "HOCA SANA ŞANS VERIYOR",
		"EL TÉCNICO TE ESTÁ BUSCANDO HUECO": "HOCA SANA YER ARIYOR",
		"EL TÉCNICO TE DA DESCANSO": "HOCA SENI DINLENDIRIYOR",
		"SIN GASOLINA": "BENZIN BITTI",
		"TE CUIDAN AL VOLVER": "YAVAŞ DONUŞ",
		"DESDE LA BANCA · ~{0} MIN": "YEDEKTEN · ~{0} DK",
		"MEDIA Y FAMA: {0} · EL MÉRITO LO PONES TÚ": "GENEL VE ŞOHRET: {0} · GERISI SENDE",
		"Te faltan {0}: sube de nivel, marca más o gánate al seleccionador en la concentración.":
			"{0} eksiğin var: seviye atla, daha çok gol at ya da kampta milli takım teknik direktörünü etkile.",
		"AL CAMPO": "SAHAYA",
		"SIMULAR LA FECHA": "MAÇI SIMULE ET",
		"NO ENTRASTE EN LA LISTA": "KADROYA GIREMEDIN",
		"PUESTO {0} DE {1} EN {2}": "{2} · SIRA {0}/{1}",
		"Debes mejorar para ser convocado: sube ~{0} de media o fama.":
			"Kadroya çağrılmak için gelişmelisin: genel ya da şöhrette ~{0} artır.",
		"Debes mejorar para ser convocado: más nivel y más nombre.":
			"Kadroya çağrılmak için gelişmelisin: daha yüksek seviye ve daha büyük bir ad.",
		"PRÓXIMO MUNDIAL · EN {0} {1}": "DUNYA ŞAMPIYONASINA {0} {1}",
		"{0} AÑOS · NIVEL {1}": "{0} YAŞ · DUZEY {1}",
		"AÑO {0} · SEM {1}": "YIL {0} · HFT {1}",
		"LESIÓN": "SAKAT",
		"EL CUERPO DECIDE": "VUCUDUN KARARI",
		"EN JUEGO": "RISKTE",
		"TE GUARDA PARA {0}": "SENI {0} IÇIN SAKLIYOR",
		"TE DIO DESCANSO": "HOCA SENI DINLENDIRDI",
		"Para el próximo: {0}.": "Sonraki maç: {0}.",
		"FECHAS": "FIKSTUR",
		"riel_pieSIGUIENTE": "SONRAKI",
		"riel_pieS{0}": "H{0}",
		"rielGENTE": "KIŞILER",
		"rielDESTREZA": "YETENEK",
		"rielGERENCIA": "YONETIM",
		"rielFICHAJES": "TRANSFER",
		"rielASPECTO": "GORUNUM",
		"rielCONTRATO": "SOZLEŞME",
		"rielTORNEOS": "TURNUVA",
		"rielRANKING": "SIRALAMA",
		"rielNOTICIAS": "HABERLER",
		"rielJUGADOR": "OYUNCUM",
		"rielEQUIPO": "TAKIMIM",
		"· das tu palabra": "· söz veriyorsun",
		"Diste tu palabra: si te vas esta ventana o la siguiente, tu grada te lo cobrará.": "Söz verdin: bu transfer döneminde ya da bir sonrakinde gidersen taraftarın bunu sana ödetir.",
		"· empezáis a salir": "· çıkmaya başlıyorsunuz",
		"J{0}/{1}": "H{0}/{1}",
		"CÓMO SE VOTA": "OYLAMA",
		"NO CUENTAS": "SAYILMAZ",
		"AL 1º": "1.YE",
		"SOBRE EL 2º": "2.NIN USTU",
		"AL {0} · {1}": "{0} · {1}",
		"HASTA {0}": "AZAMI {0}",
		"1 OFERTA": "1 TEKLIF",
		"SIN OFERTAS AÚN": "TEKLIF YOK",
		"QUITAR DE VENTA": "SATIŞTAN ÇEK",
		"SU VALOR": "DEGER",
		"ESPERAR": "BEKLE",
		"{0} MÁS EN CAMINO": "{0} DAHA GELIYOR",
		"{0} DE SU VALOR": "DEGERI {0}",
		"ACEPTADA": "KABUL",
		"¡Sube su oferta!": "Teklifini yükseltti!",
		"Se planta: no pone más.": "Geri adım atmıyor: daha fazla vermeyecek.",
		"Se ofende y retira su oferta.": "Alındı ve teklifini geri çekti.",
		"Esa oferta ya no está.": "Bu teklif artık yok.",
		"Ya le pediste más: no pondrá más.": "Zaten daha fazlasını istedin: artık eklemeyecek.",
		"Ya aceptaste una oferta.": "Zaten bir teklifi kabul ettin.",
		"Ya no está en venta.": "Artık satılık değil.",
		"En venta: sus ofertas, en la lista VENDER.": "Satılık: teklifleri SAT listesinde.",
		"TU VENTANA": "DONEMIN",
		"TRATOS CERRADOS": "ANLAŞMALAR",
		"CERRAR TRATOS": "IMZALA",
		"TE QUEDA": "KALAN",
		"VENTAS": "SATIŞ",
		"GENTE": "INSAN",
		"SECCION": "BOLUM",
		"DECORAR": "DEKORE ET",
		"VENDER MUEBLE": "EŞYA SAT",
		"¿Esperabas este recibimiento?": "Bu karşılamayı bekliyor muydun?",
		"¿Qué esperas de esta nueva etapa?": "Bu yeni dönemden ne bekliyorsun?",
		"Vengo a devolverles todo este cariño en el campo.": "Bu sevginin hepsini sahada geri ödeyeceğim.",
		"Es un sueño. Ahora toca ganarse el sitio.": "Bu bir rüya. Şimdi yerimi kazanma zamanı.",
		"Vengo a dejarlo todo por esta camiseta.": "Bu forma için her şeyimi vermeye geldim.",
		"Q1": "Q1",
		"Q2": "Q2",
		"Q3": "Q3",
		"PO": "PO",
		"SI PIERDES": "YENILIRSEN",
		"CAMINO A LA FASE DE LIGA": "LIG AŞAMASINA YOL",
		"VÍA DE LIGA": "LIG YOLU",
		"VÍA DE CAMPEONES": "ŞAMPIYON YOLU",
		"GANADOR DE": "KAZANAN",
		"PERDEDOR DE": "KAYBEDEN",
		"SORTEO {0}": "KURA {0}",
		"IDA {0}": "ILK MAÇ {0}",
		"VUELTA {0}": "ROVANŞ {0}",
		"DESDE LA FASE DE LIGA YA NO SE BAJA": "LIG AŞAMASINDAN SONRA DUŞUŞ YOK",
		"GLOBAL A FAVOR": "TOPLAM ONDE",
		"GLOBAL EN CONTRA": "TOPLAM GERIDE",
		"GLOBAL IGUALADO": "TOPLAM EŞIT",
		"UEFA": "UEFA",
		"COEFICIENTE DE 5 TEMPORADAS": "5 SEZONLUK KATSAYI",
		"Tu liga no juega las copas de la UEFA.": "Ligin UEFA kupalarında oynamıyor.",
		"PLAZAS {0}": "KONTENJAN {0}",
		"uefaSUSPENDIDA": "ASKIDA",
		"uefa{0} A {1}": "{0} IÇIN {1}",
		"COEFICIENTE UEFA": "UEFA KATSAYISI",
		"5 TEMPORADAS": "5 SEZON",
		"CABEZA DE SERIE": "TOHUM",
		"SUELO DE TU LIGA": "LIG TABANI",
		"LP": "LA",
	},


	"career_pages": {
		"TUYA": "SENIN",

		"¿Te la compras?": "Alıyor musun?",
		"Va a tu clóset: te la pones en PERSONALIZAR.": "Gardırobuna gider: OZELLEŞTIR bölümünden giy.",
		"COMPRAR ${0}": "AL ${0}",





		"LO QUE PIDE EL CLUB": "KULUBUN ISTEDIGI",
		"Lo que se le exige al equipo, medido contra sus rivales de cada torneo.": "Takımdan beklenen, her turnuvadaki rakiplerine göre ölçülür.",
		"{0}: {1} o mejor": "{0}: {1} ya da daha iyi",
		"Pelear arriba ({0} o mejor)": "Zirve için savaş ({0} ya da daha iyi)",
		"Te lo suben: el año pasado diste más de lo pedido.": "Hedef yükseltildi: geçen sezon istenenden fazlasını verdin.",
		"Te lo bajan: el año pasado te quedaste corto.": "Hedef düşürüldü: geçen sezon geride kaldın.",
		"A este ritmo: {0} de {1}": "Bu gidişle: {0} / {1}",
		"EL CLUB": "KULUP",
		"GRUPO": "GRUP",
		"{0} goles · hiciste {1}": "{0} gol · sen {1} attın",
		"{0} asistencias · diste {1}": "{0} asist · sen {1} yaptın",
		"{0} partidos · jugaste {1}": "{0} maç · sen {1} oynadın",
		"nota {0} · hiciste {1}": "not {0} · seninki {1}",
		"acabar {0} o mejor": "{0} ya da daha iyi bitir",
		"TE SIENTAN POR NO CUMPLIR": "HEDEF TUTMADI, YEDEKSIN",
		"Ganar la liga": "Ligi kazan",
		"Acabar {0} o mejor": "{0} ya da daha iyi bitir",
		"Mantener la categoría": "Ligde kal",
		"Ascender de categoría": "Üst lige çık",
		"Pelear el ascenso ({0} o mejor)": "Üst lig için savaş ({0} ya da daha iyi)",
		"Levantar el título": "Kupayı kaldır",
		"Llegar a la final": "Finale çık",
		"Llegar a semifinales": "Yarı finale çık",
		"Llegar a cuartos": "Çeyrek finale çık",
		"Pasar una ronda": "Bir tur geç",
		"Pasar la fase de liga": "Lig aşamasını geç",
		"Dar la cara": "Mücadele et",
		"Competir": "Rekabet et",
		"FALLADO": "TUTMADI",
		"SIN EMPEZAR": "BAŞLAMADI",
		"VAS {0}": "SEN {0}",
		"SIN DATOS": "VERI YOK",
		"EN FASE DE LIGA": "LIG AŞAMASINDA",
		"{0}/{1} RONDAS": "{0}/{1} TUR",
		"EL CLUB, CORTO": "KULUP GERIDE",
		"{0} · PIDE {1}": "{0} · HEDEF {1}",
		"Prima por el año del club: ${0}": "Kulübün sezon primi: ${0}",
		"El club destituye al técnico": "Kulüp teknik direktörü görevden alıyor",
		"Las copas le salvan el puesto al técnico": "Kupalar teknik direktörün koltuğunu kurtarıyor",
		"El club le mantiene la confianza al técnico": "Kulüp teknik direktöre güvenmeye devam ediyor",
		"TU OBJETIVO": "HEDEFIN",
		"EL AÑO DEL CLUB": "KULUBUN YILI",

		"TU JUEGO": "OYUNUN",

		"HABILIDAD": "YETENEK",

		"CLUBES": "KULUP",
		"JUGADORES": "OYUNCULAR",
		"BALON DE ORO": "YILIN OYUNCUSU",
		"TU CARRERA": "KARIYERIN",
		"TROFEOS": "KUPALAR",

		"SONIDO": "SES",
		"MÚSICA": "MUZIK",
		"EFECTOS": "EFEKT",
		"PARTIDO": "MAÇ",
		"DIFICULTAD": "ZORLUK",
		"NORMAL": "NORMAL",



		"LA DIFICULTAD": "ZORLUK",
		"Así de duro te lo va a poner el rival. No lo eliges para siempre.": "Rakip sana işi bu kadar zorlaştıracak. Bu seçime sonsuza kadar bağlı değilsin.",
		"Puedes cambiarla en cualquier momento desde PAUSA > AJUSTES, sin salir del partido.": "İstediğin zaman maçtan çıkmadan DURAKLAT > AYARLAR üzerinden değiştirebilirsin.",
		"FACIL: el rival se para mientras apuntas y no te quita el balón nunca. El portero falla más.": "KOLAY: nişan alırken rakip durur ve topu senden asla almaz. Kaleci daha çok hata yapar.",
		"NORMAL: el rival va más lento mientras apuntas y te roba de más cerca. El portero falla algo más.": "NORMAL: nişan alırken rakip yavaşlar ve topu kapmak için daha çok yaklaşması gerekir. Kaleci biraz daha fazla hata yapar.",
		"DIFICIL: el juego completo. Te aprietan mientras apuntas, te roban el balón y el portero no regala nada.": "ZOR: oyunun tamamı. Nişan alırken baskı yaparlar, topu kaparlar ve kaleci hiçbir şey hediye etmez.",
		"EXTREMO: marcan a la estrella, una ocasión menos, cansado tiras peor, tapan más, roban sin aviso y todos te exigen más.": "EKSTREM: yıldıza özel markaj, bir pozisyon eksik, yorgunken şutların bozulur, daha çok blok, uyarısız top kapma ve herkes senden daha fazlasını ister.",
		"PERSPECTIVA": "PERSPEKTIF",
		"TV": "TV",
		"CAMPO": "SAHA",
		"TV: el plano alto de siempre. Toda la cancha por delante para ver a quién pasarla.": "TV: her zamanki yüksek açı. Kime pas vereceğini görmek için bütün saha önünde.",
		"CAMPO: la cámara baja y se acerca, casi a tu espalda. Entra el fondo del estadio y el partido se ve desde dentro.": "SAHA: kamera alçalır ve yaklaşır, neredeyse arkanda. Stadyumun karşı tarafı kadraja girer ve maçı içeriden izlersin.",
		"SACUDIDA DE CÁMARA": "KAMERA SARSINTISI",
		"DISTANCIA DE CÁMARA": "KAMERA MESAFESI",
		"GIRO DE VISTA": "AÇI DONUŞU",
		"MENOS MOVIMIENTO DE CÁMARA": "AZ KAMERA HAREKETI",
		"VIBRACIÓN": "TITREŞIM",
		"TEMA CLARO": "AÇIK TEMA",
		"TEMA OSCURO": "KOYU TEMA",
		"PANTALLA": "EKRAN",
		"EFECTO CRT": "CRT EFEKTI",
		"AHORRO DE BATERÍA": "PIL TASARRUFU",

		"CALIDAD BAJA": "DUŞUK KALITE",
		"MUY BAJA": "EN DUŞUK",

		"Rayas de tele retro": "Retro TV tarama çizgileri",
		"Más fluido, menos detalle y sin CRT": "Daha akıcı, daha az detay, CRT yok",
		"Aún más fluido, menos nítido": "Daha da akıcı, daha az net",
		"Menús a 30 fps cuando no tocas": "Dokunmadığında menüler 30 fps",
		"Cambia el icono de la app": "Uygulama simgesini değiştir",
		"Juega con el teléfono girado": "Telefonu yan çevirerek oyna",

		"HORIZONTAL": "YATAY",
		"EN CONSTRUCCIÓN": "YAPIMDA",
		"PROBAR": "DENE",
		"La vista horizontal todavía no está terminada: algunas pantallas "
		+ "pueden verse descuadradas o cortadas. Puedes volver a la vertical aquí mismo "
		+ "cuando quieras.":
			"Yatay görünüm henüz bitmedi: bazı ekranlar kaymış ya da kesik görünebilir. İstediğin zaman buradan dikeye dönebilirsin.",
		"Para teléfonos que van lentos: menos resolución en el estadio, sin filtro "
		+ "CRT ni sombras, y la mitad de lluvia y nieve.":
			"Yavaş telefonlar için: stadyumda daha düşük çözünürlük, CRT filtresi ve gölge yok, yağmur ve karın yarısı.",
		"Tu teléfono iba lento: activamos CALIDAD BAJA. Puedes quitarla en "
		+ "AJUSTES.":
			"Telefonun yavaş çalışıyordu: DUŞUK KALITE açıldı. AYARLAR bölümünden kapatabilirsin.",

		"ICONO DE LA APP": "UYG. SIMGESI",
		"CLÁSICO": "KLASIK",
		"NOCHE DE BRUJAS": "CADILAR BAYRAMI",
		"Cambia el icono del juego en tu pantalla de inicio.":
			"Ana ekranındaki oyun simgesini değiştir.",
		"El teléfono no dejó cambiar el icono. Vuelve a intentarlo.":
			"Telefonun simgeyi değiştirmeye izin vermedi. Tekrar dene.",
		"Con el juego quieto baja el refresco y deja que la pantalla se apague "
		+ "sola. El partido no cambia.":
			"Oyun boşta kalınca yenileme hızını düşürür ve ekranın kendiliğinden kapanmasına izin verir. Maçlar değişmez.",
		"CARRERAS": "KAYITLAR",
		"Borra la carrera de cualquier ranura para dejarla libre. No se puede deshacer.":
			"Herhangi bir yuvadaki kariyeri silip yuvayı boşalt. Geri alınamaz.",
		"EMPEZAR DE CERO": "SIFIRDAN BAŞLA",
		"Borra todas las carreras Y todos los logros. El juego queda como recién instalado. No se puede deshacer.":
			"Bütün kariyerleri VE bütün başarımları siler. Oyun yeni yüklenmiş gibi olur. Geri alınamaz.",
		"REINICIAR TODO": "HEPSINI SIFIRLA",
		"¿REINICIAR TODO?": "SIFIRLANSIN MI?",
		"Se pierden todas las carreras y TODOS los logros. El juego vuelve a empezar de cero. Esto no se puede deshacer.":
			"Bütün kariyerler ve HER başarım kaybolur. Oyun sıfırdan başlar. Bu geri alınamaz.",
		"SÍ": "EVET",
		"BORRAR": "SIL",
		"SÍ, BORRAR": "EVET, SIL",
		"SÍ, BORRAR TODO": "HEPSINI SIL",
		"CANCELAR": "IPTAL",
		"VACÍA": "BOŞ",
		"RETIRADO": "EMEKLI",
		"T{0}": "S{0}",
		"¿BORRAR RANURA {0}?": "{0}. YUVAYI SIL?",
		"Es tu carrera ACTIVA.": "Bu senin AKTIF kariyerin.",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.{1}\n"
		+ "Las otras ranuras no se tocan.":
			"{0} adlı oyuncunun kariyeri kaybolur: seviye, para, sözleşme ve kupalar.{1}\nDiğer yuvalara dokunulmaz.",

		"TU NOMBRE": "ADIN",
		"NOMBRE EN LA ESPALDA": "FORMADAKI AD",
		"16 AÑOS · DEBUTANTE": "16 YAŞ · ÇAYLAK",
		"Debutante": "Çaylak",
		"TU ASPECTO": "GORUNUŞUN",
		"NUEVA CARRERA+": "YENI KARIYER+",
		"Lo que te ganaste en carreras anteriores. Elige con qué ventaja arrancas esta "
		+ "vez —o ninguna, y empieza de cero como todos.":
			"Önceki kariyerlerinde kazandıkların. Bu sefer hangi avantajla başlayacağını seç — ya da hiçbirini seçme, herkes gibi sıfırdan başla.",
		"QUITAR": "KALDIR",
		"ELEGIR": "SEÇ",
		"TU NACIONALIDAD": "UYRUGUN",
		"ELIGE TU NACIONALIDAD": "UYRUGUNU SEÇ",
		"FALTA TU NOMBRE Y TU NACIONALIDAD": "AD VE UYRUK EKSIK",
		"FALTA ESCRIBIR TU NOMBRE": "ONCE ADINI YAZ",
		"FALTA ELEGIR TU NACIONALIDAD": "ONCE UYRUGUNU SEÇ",
		"TU CLUB": "KULUBUN",
		"LEYENDAS DEL CLUB": "KULUP EFSANELERI",
		"NO EXISTEN LEYENDAS AÚN": "HENUZ EFSANE YOK",
		"CREA TU JUGADOR": "OYUNCUNU YARAT",



		"PASO 1 DE 2 · NOMBRE Y ASPECTO": "ADIM 1/2 · AD VE GORUNUŞ",
		"SIGUIENTE  >": "ILERI  >",
		"< ATRÁS": "< GERI",
		"NACIONALIDAD Y CLUB": "UYRUK VE KULUP",
		"PASO 2 DE 2 · CON QUIÉN Y DÓNDE EMPIEZAS": "ADIM 2/2 · KIMLE VE NEREDE BAŞLIYORSUN",
		"EMPEZAR CARRERA": "KARIYERE BAŞLA",
		"< VOLVER": "< GERI",



		"Primera": "Birinci",
		"Segunda": "İkinci",
		"Tercera": "Üçüncü",
		"{0} DIVISIÓN": "{0} LIG",
		"¡NUEVO!": "YENI!",
		"DESBLOQUEADA": "AÇILDI",
		"BLOQUEADO": "KILITLI",

		"< ATRAS": "< GERI",



		"Piel": "Ten",
		"Pelo": "Saç",
		"Corte": "Kesim",
		"Vello facial": "Sakal-bıyık",



		"Puntas": "Uçlar",
		"Botines": "Krampon",
		"Playera casual": "Günlük tişört",
		"Pantalón casual": "Günlük pantolon",
		"Estampado": "Desen",
		"2º color playera": "Tişört 2. renk",
		"Manga": "Kol",
		"Prenda": "Giysi",
		"Chamarra": "Ceket",
		"Rectangulares": "Dikdörtgen",
		"Deportivos": "Spor",
		"Short de mezclilla": "Kot şort",
		"Short cargo": "Kargo şort",
		"Bermuda": "Bermuda",
		"Short de baño": "Mayo şort",
		"Diamante": "Elmas",
		"Doble aro": "Çift halka",
		"Colgante": "Sallantılı",
		"Ear cuff": "Kulak kelepçesi",
		"Oxford": "Oxford",
		"Chelsea": "Chelsea",
		"Chanclas": "Terlik",
		"Gala": "Gala",
		"Traje de gala": "Gala takımı",
		"Esmoquin clásico": "Klasik smokin",
		"Traje azul": "Mavi takım",
		"Esmoquin marfil": "Fildişi smokin",
		"Terciopelo granate": "Bordo kadife",
		"Tres piezas gris": "Gri üç parça",
		"Traje cruzado": "Kruvaze takım",
		"Oficina azul": "Ofis mavisi",
		"Básico grafito": "Grafit sade",
		"Lino arena": "Kum keten",
		"Traje café": "Kahverengi takım",
		"Satén medianoche": "Gece saten",
		"Terciopelo esmeralda": "Zümrüt kadife",
		"Seda perla": "İnci ipek",
		"Marfil y oro": "Fildişi ve altın",
		"Negro y oro": "Siyah ve altın",
		"Diplomático": "Diplomat",
		"Traje sin corbata": "Kravatsız takım",
		"Saco y cuello alto": "Blazer ve balıkçı yaka",
		"Conjunto con chaleco": "Yelekli takım",
		"Oversize": "Oversize",
		"Sin mangas": "Kolsuz",
		"Cuello alto": "Balıkçı yaka",
		"Camisa abierta": "Açık gömlek",
		"Chinos": "Chino",
		"Mezclilla ancha": "Bol kot",
		"De vestir": "Kumaş",
		"Short deportivo": "Spor şort",
		"Bomber": "Bomber",
		"Mezclilla": "Kot",
		"Cuero": "Deri",
		"Rompevientos": "Rüzgarlık",
		"Blazer": "Blazer",
		"Cierre": "Kapama",
		"Abierta": "Açık",
		"Cerrada": "Kapalı",
		"Hacia atrás": "Ters",
		"Gorro tejido": "Örgü bere",
		"Bucket": "Bucket şapka",
		"Redondos": "Yuvarlak",
		"Aviador": "Pilot",
		"Con dije": "Uçlu kolye",
		"Reloj": "Saat",
		"Pulsera": "Bileklik",
		"Calzado": "Ayakkabı",
		"Tenis bajos": "Kısa sneaker",
		"Tenis altos": "Uzun sneaker",
		"Botas": "Bot",
		"Mocasines": "Loafer",
		"Sandalias": "Sandalet",
		"Color del calzado": "Ayakkabı rengi",
		"Playeras": "Tişörtler",
		"Pantalones": "Pantolonlar",
		"Chamarras": "Ceketler",
		"Gorras": "Kepler",
		"Accesorios": "Aksesuarlar",
		"Color de playera": "Tişört rengi",
		"Prenda exterior": "Dış giyim",
		"Color de chamarra": "Ceket rengi",
		"Recto": "Düz",
		"Jeans": "Jean",
		"Cargo": "Kargo",
		"Jogger": "Jogger",
		"Aretes": "Küpeler",
		"Broquel": "Tektaş",
		"Aro": "Halka",
		"Cadena": "Zincir",
		"Metal": "Metal",
		"Polo": "Polo",
		"Camisa": "Gömlek",
		"Suéter": "Kazak",
		"Chaleco": "Yelek",
		"Abrigo": "Palto",
		"Hoodie": "Kapüşonlu",
		"Largo del pantalón": "Pantolon boyu",
		"Largo": "Uzun",
		"Corto": "Kısa",
		"Gorra": "Kep",
		"Sombrero": "Şapka",
		"Color de la gorra": "Kep rengi",
		"Corta": "Kısa",
		"Larga": "Uzun",
		"Gafas": "Gözlük",
		"De sol": "Güneş gözlüğü",
		"Lentes": "Gözlük",
		"Liso": "Düz",
		"Rayas": "Çizgili",
		"Raya fina": "İnce çizgi",
		"Mitad": "Yarım",
		"Tatuajes": "Dövmeler",

		"Tinte": "Boya",
		"Rostro": "Yüz",
		"Mediano": "Orta",
		"Accesorio": "Aksesuar",
		"Brazos": "Kollar",
		"Arriba": "Üst",
		"Abajo": "Alt",
		"Detalles": "Detaylar",
		"Outfits": "Kombinler",
		"Traje": "Takım",
		"Cuello": "Boyun",
		"Muñeca": "Bilek",
		"Brazo izq": "Sol kol",
		"Brazo der": "Sağ kol",
		"Ambos": "İkisi",


		"Tatuaje de cuello": "Boyun dövmesi",
		"Tinta del cuello": "Boyun mürekkebi",
		"Dibujo de la pierna": "Bacak deseni",
		"Tinta de la pierna": "Bacak mürekkebi",
		"Guantes de campo": "Saha eldiveni",
		"Guantes": "Eldiven",
		"Muñequeras": "Bileklikler",
		"Color de la muñequera": "Bileklik rengi",
		"Manga de compresión": "Kompresyon kolluğu",
		"Color de la manga": "Kolluk rengi",
		"Vendaje": "Bandaj",
		"Medias": "Tozluk",
		"Cinta de la media": "Tozluk bandı",
		"Normales": "Normal",
		"Con cinta": "Bantlı",
		"Bajadas": "İndirilmiş",
		"Piernas": "Bacaklar",
		"Pierna izq": "Sol bacak",
		"Pierna der": "Sağ bacak",
		"Manga entera": "Tam kol",
		"Antebrazo": "Ön kol",
		"Bíceps": "Pazı",
		"Manga difuminada": "Silik kol",
		"Escamas": "Pullar",
		"Eslabones": "Zincir",
		"Ondas": "Dalgalar",
		"Cuadros": "Kareler",
		"Aros finos": "İnce halkalar",
		"Salpicado": "Benekli",
		"Tres aros": "Üç halka",
		"Lágrima": "Gözyaşı",
		"Estrella": "Yıldız",
		"Barra": "Çubuk",
		"Triángulo": "Üçgen",
		"Galón": "Şerit",
		"Flecha": "Ok",
		"Cuadro": "Kare",
		"Anillo": "Yüzük",
		"Gancho": "Kanca",
		"Raya corta": "Kısa çizgi",
		"Dos barras": "İki çubuk",
		"Cruz": "Haç",
		"Franja": "Bant",
		"Franja ancha": "Geniş bant",
		"Tres puntos": "Üç nokta",
		"Rombo": "Baklava",
		"Dibujo del tatuaje": "Dövme deseni",
		"Tinta del tatuaje": "Dövme mürekkebi",
		"Punto": "Nokta",
		"Dos puntos": "İki nokta",
		"Línea corta": "Kısa çizgi",
		"Cruz pequeña": "Küçük haç",
		"Rombo pequeño": "Küçük baklava",
		"Izquierda": "Sol",
		"Derecha": "Sağ",
		"Ambas": "İkisi",
		"Damero": "Dama",
		"Aros": "Halkalar",
		"Brazalete": "Kol bandı",
		"Tribal": "Tribal",
		"Cepillo": "Asker tıraşı",
		"Un costado": "Yandan kazıma",
		"Mullet": "Mullet",
		"Afro": "Afro",
		"Melena": "Uzun saç",
		"Ojos": "Gözler",
		"Cejas": "Kaşlar",
		"Accesorio de cabeza": "Baş aksesuarı",
		"Raya al medio": "Ortadan ayrık",
		"Coronilla": "Tepe",
		"Herradura": "Nal",
		"Normal": "Normal",
		"Calvo": "Kel",
		"Rapado": "Kazıma",
		"Cresta": "İbik",
		"Lados": "Yanlar",
		"Degradado": "Degrade",
		"Entradas": "Açılmış",
		"Cresta ancha": "Geniş ibik",
		"Raya": "Yandan ayrık",
		"Franjas": "Çizgiler",
		"Nada": "Yok",
		"Barba": "Sakal",
		"Candado": "Keçi sakal",
		"Bigote": "Bıyık",
		"Sombra": "Kirli sakal",
		"Patillas": "Favori",
		"Mosca": "Dudak altı",
		"Contorno": "Çene hattı",
		"Barbón": "Gür sakal",
		"Manillar": "Pala bıyık",

		"CAMBIAR": "DEGIŞ",
		"BUSCAR": "ARA",
		"SIN RESULTADOS": "SONUÇ YOK",
		"SUGERIDAS": "ONERILEN",
		"TODAS": "TUMU",
		"Color libre": "Serbest renk",


		"ANTES": "ONCE",
		"AHORA": "ŞIMDI",
		"PAÍS DEL CLUB": "KULUP ULKESI",
		"VER LOS {0} CLUBES": "{0} KULUBU GOR",
		"TUS OFERTAS": "TEKLIFLERIN",
		"INICIA DESDE ABAJO": "ALTTAN BAŞLA",
		"INICIA DONDE QUIERAS": "ISTEDIGIN YERDEN BAŞLA",
		"ELIGE TU CLUB": "KULUBUNU SEÇ",
		"VER LAS {0} OFERTAS": "{0} TEKLIFI GOR",
		"{0} DE TU PAÍS · {1} DEL EXTRANJERO": "{0} ULKENDEN · {1} YURTDIŞINDAN",
		"DIVISIÓN BLOQUEADA": "LIG KILITLI",
		"TELEMETRÍA": "TELEMETRI",
		"Contadores de uso guardados en este teléfono. Sirven para saber qué partes del juego se usan y no hay ningún dato tuyo dentro.":
			"Bu telefonda tutulan kullanım sayaçları. Oyunun hangi bölümlerinin kullanıldığını gösterir ve içinde sana ait hiçbir veri yoktur.",
		"COMPARTIR CONTADORES":
			"SAYAÇLARI PAYLAŞ",
		"Estos mismos números se envían al desarrollador para saber qué partes del juego se usan. Nunca van tu nombre, tu partida ni nada que te identifique. Apágalo cuando quieras.":
			"Bu sayılar, oyunun hangi bölümlerinin kullanıldığını öğrenmek için geliştiriciye gönderilir. Adın, kaydın ya da seni tanıtan hiçbir şey asla gönderilmez. İstediğin zaman kapatabilirsin.",
		"VER CONTADORES": "SAYAÇLARI GOR",
		"BORRAR CONTADORES": "SAYAÇLARI SIL",
		"PEDIR BORRADO": "SILME TALEBI",
		"CERRAR": "KAPAT",
		"NO": "HAYIR",
		"MANTEN PARA REINICIAR TODO": "SIFIRLAMAK IÇIN BASILI TUT",
		"MANTEN PARA PEDIR CAMBIO": "ÇIKMAK IÇIN BASILI TUT",
		"BORRAR TODO": "HEPSINI SIL",
		"MANTÉN PULSADO PARA BORRAR TODO": "HEPSINI SILMEK IÇIN BASILI TUT",

		"REY DEL GOL": "GOL KRALI",
		"REY DEL PASE": "ASIST KRALI",
		"{0} lidera el goleo con {1}": "Gol krallığında lider {0}: {1}",
		"{0} acaba de máximo goleador con {1}": "Sezonu gol kralı bitiren isim {0}: {1}",
		"{0} manda en asistencias con {1}": "Asistlerde zirvede {0}: {1}",
		"{0} acaba líder de asistencias con {1}": "Sezonu asist lideri bitiren isim {0}: {1}",
		"{0} es el jugador de la temporada ({1})": "Sezonun oyuncusu {0} ({1})",
		"CAMPEÓN DE LIGA": "LIG ŞAMPIYONU",
		"DESCIENDE": "DUŞTU",
		"BOMBAZO": "BOMBA",
		"SORPRESA": "SURPRIZ",
		"{0} se lleva la liga": "Şampiyon {0}",
		"{0} baja a {1}": "{0} küme düştü: yeni ligi {1}",
		"{0} es el fichaje más caro de la ventana": "Dönemin en pahalı transferi: {0}",
		"{0} cuelga las botas": "{0} kramponları astı",
		"{0} tumba al {1}": "{0}, {1} karşısında sürpriz yaptı",
		"{0} lleva {1} victorias seguidas": "{0}: üst üste {1} galibiyet",
		"{0} lleva {1} partidos sin ganar": "{0}: {1} maçtır galibiyet yok",
		"El {0} destituye a {1}": "{0}, teknik direktör {1} ile yollarını ayırdı",
		"{0} coge el banquillo del {1}": "{0}, {1} kulübünün başına geçti",
		"{0} deja el {1} y coge el {2}": "{0}, {1} kulübünden ayrılıp {2} kulübüne geçti",
		"El {0} se lleva a {1} del {2}": "{0}, {2} kulübünden {1} adlı hocayı kaptı",

		"SELECCIONES": "MILLI TAKIM",
		"{0} deja de ser seleccionador de {1}": "{0}, {1} milli takımındaki görevini bıraktı",
		"{0}, nuevo seleccionador de {1}": "{1} milli takımının yeni hocası: {0}",
		"{0} deja el {1} para dirigir a {2}": "{0}, {2} takımını çalıştırmak için {1} kulübünden ayrıldı",
		"{0} deja la selección de {1} y coge la de {2}": "{2} milli takımının yeni hocası {0}; önceki görevi {1}",
		"{0} deja la selección de {1} y coge el {2}": "{0}, {1} milli takımını bırakıp {2} kulübüne geçti",

		"INVERSOR": "YATIRIM",
		"CRISIS": "KRIZ",
		"{0} cambia de dueño: llega dinero para fichar": "{0} kulübü el değiştirdi: transfer için para geliyor",
		"{0} entra en crisis y tendrá que vender": "{0} kulübü krize girdi ve satış yapmak zorunda kalacak",
		"Se acaba el dinero del nuevo dueño del {0}": "{0} kulübünde yeni sahibin parası bitti",
		"NOTICIAS": "HABERLER",
		"Tu club todavía no ha sido noticia.": "Kulübün henüz haber olmadı.",
		"Tu liga todavía no ha sido noticia.": "Ligin henüz haber olmadı.",
		"El mundo todavía no ha dado que hablar.": "Dünyada henüz konuşulacak bir şey yok.",
		"Un jeque compra el {0}: viene a ganarlo todo": "Bir şeyh {0} kulübünü aldı: her şeyi kazanmaya geliyor",
		"Un magnate compra el {0}: llega dinero para fichar": "Bir magnat {0} kulübünü aldı: transfer için para geliyor",
		"Un fondo compra el {0} para revenderlo": "Bir fon {0} kulübünü yeniden satmak için aldı",
		"PRIMER PARTIDO": "ILK MAÇ",
		"BODA": "EVLI",
		"DIVORCIO": "BOŞANMA",
		"RUPTURA": "AYRILIK",
		"JUNTOS": "IKILI",
		"A DISTANCIA": "UZAKTAN",
		"{0} se casa": "{0} evleniyor",
		"{0} se divorcia": "{0} boşanıyor",
		"{0} rompe con su pareja": "{0} sevgilisinden ayrılıyor",
		"{0} llega al {1} con su pareja": "{0} sevgilisiyle {1} takımına geliyor",
		"{0} llega solo al {1}: su pareja no se muda": "{0} {1} takımına yalnız geliyor: sevgilisi taşınmıyor",
		"NOTICIA": "HABER",
		"EL DOBLETE": "DUBLE",
		"EL TRIPLETE": "TREBLE",
		"ASCENDISTE": "YUKSELDIN",
		"DESCENDISTE": "KUME DUŞTUN",
		"de {0} equipos": "{0} takım arasında",
		"Bolsa": "Çanta",
		"Mallas": "Tayt",
		"Térmicas": "Termal",
		"Rodillera": "Dizlik",
		"Material": "Malzeme",
		"Neopreno": "Neopren",
		"LEER": "OKU",
		"SIN PERDER": "YENILMEDEN",
		"ORDEN": "SIRALAMA",
		"ORDENAR": "SIRALA",
		"TUS REDES": "SOSYAL",
		"TU POST": "GONDERI",
		"FUEGO": "ATEŞ",
		"APLAUSO": "ALKIŞ",
		"HINCHA": "FAN",
		"MARCA": "MARKA",
		"¿CONTESTAS?": "CEVAP?",
		"No contestas. Pasa solo.": "Cevap yok. Geçer gider.",
		"Toca mejorar. Y mejoraré.": "Gelişmeli. Gelişeceğim.",
		"En el próximo hablo yo. #CALLABOCAS": "Sonraki maçta ben. #SUSUN",
		"SE COBRA": "HESAP",
		"te ha mencionado · nota {0}": "senden bahsetti · puan {0}",
		"Tu muro todavía está vacío.": "Duvarın henüz boş.",
		"El Diario": "Gazete Spor",
		"@eldiario": "@gazetespor",
		"La Grada": "Tribün",
		"@lagradafiel": "@tribunsadik",
		"@el_10_del_equipo": "@takimin_10_u",
		"Hincha rival": "Rakip Taraftar",
		"@ultra_norte": "@kuzey_ultra",
		"Tu marca": "Markan",
		"@tumarca_oficial": "@markan_resmi",
		"tras la {0}": "{0} sonrası",
		"SEGUIDORES": "TAKIPÇI",
		"RESPONDER": "YANITLA",
		"RESPONDIENDO A": "YANITLANAN",
		"Nos vemos en el campo. #ALLÍTEESPERO": "Sahada görüşürüz. #SAHADABEKLERIM",
		"¡Así se habla, capitán!": "İşte bu konuşma, kaptan!",
		"Mucho hablar...": "Çok laf...",
		"TE ETIQUETAN": "ETIKETLENDIN",
		"Un rival te ha mencionado antes del partido. Todo el mundo mira qué contestas.": "Bir rakip seni maç öncesi etiketledi. Herkes ne cevap vereceğine bakıyor.",
		"Lo dijiste en redes. Hoy te toca callar.": "Bunu sosyal medyada söyledin. Bugün susma sırası sende.",
		"antes de la {0}": "{0} öncesinde",
		"{0} te ha etiquetado": "{0} seni etiketledi",
		"¿ENTRAS AL TRAPO?": "TAKILIR MISIN?",
		"Ni le contestas. Tu técnico lo agradece.": "Cevap bile vermiyorsun. Teknik direktörün memnun.",
		"el campo es mi casa. A ver si esta vez das la cara.": "saha benim evim. Bakalım bu sefer ortaya çıkacak mısın.",
		"¿te acuerdas de la final? Yo sí. Te espero en el campo.": "finali hatırlıyor musun? Ben hatırlıyorum. Sahada bekliyorum.",
		"Hablamos en el campo.": "Sahada konuşuruz.",
		"La final ya pasó. Ahora, otra historia.": "Final geride kaldı. Şimdi başka bir hikâye.",
		"LA REVANCHA": "ROVANŞ",
		"MENSAJES": "MESAJLAR",
		"AGRADECER": "TEŞEKKUR",
		"DISTE TU PALABRA": "SOZ VERDIN",
		"No tienes mensajes.": "Hiç mesajın yok.",
		"{0}, de la grada": "{0}, tribünden",
		"CADUCA EN {0}": "{0} MAÇ KALDI",
		"TU ASISTENCIA · {0}": "ASISTIN · {0}",
		"RUMOR": "KULIS",
		"PALABRA": "SOZ",
		"Si no contestas, no pasa nada.": "Cevap vermezsen bir şey olmaz.",
		"¿Con qué festejo nos celebras el próximo gol en casa?": "Bir sonraki ev sahibi golünde bizim için nasıl bir sevinç yapacaksın?",
		"ENCUESTA": "ANKET",
		"{0} VOTOS": "{0} OY",
		"Ganó {0}": "{0} kazandı",
		"Lo votó {0}": "{0} oyladı",
		"LLEVAR AL BOMBO": "ÇARKA EKLE",
		"Abre tu bombo de CELEBRACIONES.": "KUTLAMALAR çarkını aç.",
		"SI SALE EN CASA": "EVDE OLURSA",
		"Tú celebras a tu manera.": "Sen kendi tarzında sevinirsin.",
		"NO CUESTA NADA": "BEDAVA",
		"Tu próximo gol en casa": "Bir sonraki ev golün",
		"LA PEÑA LA PIDE": "TARAFTAR ISTER",
		"encuesta del mes · gana {0}": "ayın anketi · {0} kazanır",
		"La peña vota el festejo del mes. Gana {2}: ¡lo queremos ver en casa, {0}!": "Taraftar ayın sevincini oyluyor. {2} kazandı: evimizde görmek istiyoruz, {0}!",
		"{0} le hace caso a su peña: {2} en casa.": "{0} taraftarını dinledi: evinde {2}.",
		"¡Lo pedimos y {0} lo hizo! {2} delante de la peña.": "İstedik, {0} yaptı! Taraftarın önünde {2}.",
		"Llegar a la fase de liga": "Lig aşamasına ulaş",
		"Ganar el cruce de {0}": "{0} turunu kazan",
		"¡La selfie de mi vida con {0}! Ya es mi foto de perfil.": "{0} ile hayatımın selfie'si! Artık profil fotoğrafım.",
		"Me firmó y encima nos hicimos una selfie. Gracias, {0}.": "İmzayı aldım, üstüne selfie de çektik. Teşekkürler, {0}.",
		"Salió movida, pero os juro que es {0}.": "Bulanık çıktı ama yemin ederim bu {0}.",
		"TECLAS": "TUŞLAR",
		"PULSA UNA TECLA": "BIR TUŞA BAS",
		"MANTEN PARA RESTABLECER": "BASILI TUT: SIFIRLA",
		"FAN": "HAYRAN",
		"Pillaron al revendedor que se colaba en la firma de {0}. ¡Bien visto!": "{0}'in imza gününde araya kaynayan karaborsacı yakalandı. İyi gördün!",
		"A {0} no se la cuelan: seguridad saca a un revendedor de su firma.": "{0}'i kandıramazsın: Güvenlik bir karaborsacıyı imza gününden çıkardı.",
		"Ya hay firmas de {0} a la venta por 5 €. El de la cola se puso las botas.": "{0}'in imzaları şimdiden 5 €'ya satışta. Kuyruktaki adam köşeyi döndü.",
		"Nuestra tarde de firmas con {0} ya está en reventa. No era la idea.": "{0} ile imza günümüz şimdiden karaborsada. Amaç bu değildi.",
		"Esperé toda la tarde para ver a {0} y me sacó seguridad. Sólo quería su firma.": "{0}'i görmek için bütün öğleden sonra bekledim, güvenlik beni dışarı attı. Sadece imzasını istiyordum.",
	},

























	"match": {
		"Mejor del Mundial": "Dünya Şampiyonası'nın En İyisi",
		"Mejor de la Copa continental": "Kıta Kupası'nın En İyisi",
		"Bota de la Copa continental": "Kıta Kupası Gol Kralı",
		"Mejor (Mundial)": "En İyi (Dünya)",
		"Mejor (Continental)": "En İyi (Kıta)",
		"Bota (Continental)": "Gol Kralı (Kıta)",
		"Figura del Mundial": "Dünya Şampiyonası Yıldızı",
		"JUEGOS OLÍMPICOS": "OLIMPIYATLAR",
		"Campeón Olímpico": "Olimpiyat Şampiyonu",
		"Oro olímpico": "Olimpiyat altını",
		"Oro Olímpico": "Olimpiyat Altını",
		"Ganar el oro en los Juegos Olímpicos.": "Olimpiyat Oyunları'nda altın madalya kazan.",
		"El oro que no se compra. Se cuelga del cuello.": "Satın alınamayan altın. Boynuna asılır.",
		"JUEGOS OLÍMPICOS: oro para {0}": "OLIMPIYATLAR: altın {0} için",
		"{0}: ORO en los Juegos Olímpicos": "{0}: Olimpiyat Oyunları'nda ALTIN",
		"{0}: plata en los Juegos Olímpicos": "{0}: Olimpiyat Oyunları'nda gümüş",
		"{0}: bronce en los Juegos Olímpicos": "{0}: Olimpiyat Oyunları'nda bronz",


		"NO SOLTÓ": "BIRAKMADI",
		"SE LA APRETÓ": "SIKIŞTIRILDI",
		"ÉSTA VA POR TI": "BU SENIN IÇIN",
		"SE LA APRETARON, Y LO SABE": "SIKIŞTIRILDI VE BUNU BILIYOR",
		"COMO SIEMPRE: NO SOLTÓ": "YINE BIRAKMADI",
		"HOY SE LA APRETARON": "BUGUN SIKIŞTIRILDI",
		"NI UN CENTÍMETRO": "GEÇIT YOK",
		"SE DEJÓ APRETAR": "SIKIŞTIRILMAYA IZIN VERDI",
		"NO SOLTÓ, POR UNA VEZ": "BU KEZ BIRAKMADI",
		"SE LA APRETÓ. LE DA IGUAL": "SIKIŞTIRILDI. UMURUNDA DEGIL",



		"TU EX TÉCNICO NO CONTABA CONTIGO": "ESKI HOCAN SANA GUVENMIYORDU",
		"TU EX TÉCNICO APLAUDE TU GOL": "ESKI HOCAN GOLUNU ALKIŞLIYOR",
		"GOL A TU EX TÉCNICO": "ESKI HOCANA GOL",
		"TU EX TÉCNICO SE VA SIN MIRARTE": "ESKI HOCAN SANA BAKMADAN GIDIYOR",
		"TU EX TÉCNICO TE APLAUDE": "ESKI HOCAN SENI ALKIŞLIYOR",
		"TU EX TÉCNICO FESTEJA": "ESKI HOCAN SEVINIYOR",
		"APRETASTE A TU EX TÉCNICO": "ESKI HOCANI SIKIŞTIRDIN",
		"TU EX TÉCNICO PUEDE CONTIGO": "ESKI HOCAN HALA SENI YENIYOR",
		"¡PICA RÁPIDO!": "HIZLI DOKUN!",
		"LLEVA LA RAYA HASTA TU LADO": "ÇIZGIYI KENDI TARAFINA ÇEK",



		"EL VOLADO": "YAZI TURA",
		"Cara": "Tura",
		"Sol": "Yazı",
		"¿Cara o sol?": "Yazı mı tura mı?",
		"Tu equipo pide {0}.": "Takımın seçimi: {0}.",
		"La moneda dice {0}.": "Para: {0}.",
		"¡GANAS EL VOLADO! Pateas con tu gente.": "YAZI TURAYI KAZANDIN! Kendi taraftarının önünde atıyorsun.",
		"Pierdes el volado: pateas ante la grada rival.": "Yazı turayı kaybettin: rakip tribünün önünde atıyorsun.",

		"¡LE DISTE AL ÁRBITRO!": "HAKEMI VURDUN!",
		"ROJA DIRECTA · {0} {1} DE SANCIÓN": "DIREKT KIRMIZI · {0} {1} CEZA",






		"El derbi. Fuera de casa. Aquí no se perdona nada.": "Derbi. Deplasmanda. Burada hiçbir şey affedilmez.",
		"Derbi. Noventa minutos que se recuerdan un año.": "Derbi günü. Bütün yıl konuşulacak doksan dakika.",
		"Última jornada. Lo que pase aquí ya no se arregla.": "Son hafta. Burada olan bir daha düzelmez.",
		"{0}. Y tú llegas en racha.": "{0}. Ve sen formda geliyorsun.",

		"Te van a apretar arriba desde el primer balón. Sacúdetelos rápido.": "İlk toptan itibaren önde baskı yapacaklar. Hızla kurtul.",
		"Hoy toca autobús: once atrás esperándote. La paciencia también juega.": "Bugün otobüs var: on bir kişi geride seni bekliyor. Sabır da oynar.",
		"Te marcan al hombre. Cada carrera tuya se lleva a uno puesto.": "Adam adama markaj yapıyorlar. Her koşun birini peşinden sürükler.",
		"Línea alta y sin prisa. La espalda de esa zaga es la jugada.": "Yüksek savunma hattı, acele yok. O defansın arkası, pozisyonun ta kendisi.",
		"Campo de {0}. A ver quién se acuerda de ti al final.": "Deplasman: {0}. Bakalım sonunda adını kim hatırlayacak.",

		"Enfrente, {0}. Una temporada juntos en {1}; se acuerda de ti.": "Karşıda {0}. {1} formasıyla bir sezon birlikte oynadınız; seni hatırlıyor.",
		"Enfrente, {0}: {2} temporadas juntos en {1}. Te conoce de memoria.": "Karşıda {0}: {1} formasıyla {2} sezon birlikte. Seni ezbere biliyor.",
		"{0} te conoce de {1}. Sabe hacia dónde vas a romper.": "{0} seni {1} günlerinden tanıyor. Hangi yöne kaçacağını biliyor.",
		"{0} jugó contigo en {1}: te lee antes de que toques.": "{0} seninle {1} formasıyla oynadı: sen dokunmadan seni okuyor.",
		"Lo callaste. Su estadio entero, callado.": "Onları susturdun. Koca stadyum, sessiz.",
		"En el 90 y en su casa. De esos que no se olvidan.": "90. dakikada, hem de deplasmanda. Unutulmayanlardan.",
		"Le has dado la vuelta. Tú solo.": "Maçı çevirdin. Tek başına.",
		"Tres. Te llevas el balón a casa.": "Üç. Topu eve götürüyorsun.",
		"Y van dos. El campo es tuyo.": "İki oldu. Saha senin.",
		"En el derbi. Ese lo vas a contar mucho tiempo.": "Hem de derbide. Bunu yıllarca anlatacaksın.",
		"Empate. Y quedan minutos.": "Yine eşitlik. Ve hala dakikalar var.",
		"Te lo empatan al final. Y te toca a ti arreglarlo.": "Son anda eşitlediler. Düzeltmek sana düşüyor.",
		"{0} se pone por delante. La grada lo nota.": "{0} öne geçiyor. Tribünde hissediliyor.",
		"Otro. Esto se está yendo.": "Bir tane daha. Maç elden gidiyor.",

		"Vuelves a {0}. Aquí jugaste {1} temporadas.": "Yeniden {0} sahasındasın. Burada {1} sezon oynadın.",
		"Enfrente, {0}. Tu antiguo club.": "Karşıda {0}. Eski kulübün.",
		"{0} te cedió. Hoy le devuelves el favor.": "{0} seni kiraya verdi. Bugün iyiliğin karşılığını veriyorsun.",
		"{1} temporadas en {0}. Hoy celebras allí.": "{0} formasıyla {1} sezon. Bugün orada sevinen sensin.",
		"{0} te dejó ir hace nada. Error suyo.": "{0} seni kısa süre önce gönderdi. Onların hatası.",
		"Le marcas a {0}, tu antiguo club.": "Eski kulübün {0} karşısında gol attın.",
		"{0} jugó contigo en {1}. Y hoy te marca.": "{0} seninle {1} formasıyla oynadı. Ve bugün sana gol atıyor.",
		"Tu club cedió a {0}. Y él se lo cobra.": "Kulübün {0} adlı oyuncuyu kiraya verdi. O da bunun hesabını soruyor.",
		"{0}: {1} temporadas en tu club. Hoy, rival.": "{0}: kulübünde {1} sezon. Bugün rakip.",
		"{0}, ex de tu club. Duele el doble.": "{0}, kulübünün eski oyuncusu. İki kat acıtıyor.",
		"El palo. Un centímetro más adentro y estabas celebrando.": "Direk. Bir santim içeride olsa sevinç senindi.",
		"Otra vez el hierro. Hoy no te quiere.": "Yine direk. Bugün şans senden yana değil.",
		"Se lo pusiste. El gol es suyo; el pase, tuyo.": "Önüne koydun. Gol onun; pas senin.",


		"Levanta la mano. Nadie lo mira. Otra vez.": "Elini kaldırıyor. Kimse bakmıyor. Yine.",
		"Está solo y lo ve todo el estadio menos sus compañeros.": "Bomboş, ve bunu takım arkadaşları dışında bütün stadyum görüyor.",
		"La juegan por el otro lado. Ya ni la pide.": "Öbür taraftan oynuyorlar. Artık istemiyor bile.",
		"Se ofrece, le dan la espalda. Este equipo no es suyo.": "Kendini gösteriyor, ona sırtlarını dönüyorlar. Bu onun takımı değil.",
		"Había pase y eligieron el otro. Pasa mucho últimamente.": "Pas vardı ama diğerini seçtiler. Son zamanlarda bu çok oluyor.",
		"Le llega y el estadio entero silba. Se le va larga.": "Top ona geliyor ve bütün stadyum ıslıklıyor. Top ayağından kaçıyor.",
		"El balón es suyo. El abucheo también. La pierde.": "Top onun. Yuhalar da. Topu kaptırıyor.",
		"Un pito por cada toque. No controla ni la más fácil.": "Her dokunuşa bir ıslık. En kolayını bile kontrol edemiyor.",
		"La grada le cae encima y el control se le va largo.": "Tribün üstüne geliyor ve kontrolü uzun kaçıyor.",



		"Uno se levanta en la tercera fila. Y no es para aplaudir.": "Üçüncü sırada biri ayağa kalkıyor. Alkışlamak için değil.",
		"Ya hay quien le lleva la cuenta de los fallos desde la grada.": "Tribünde hatalarını sayan biri bile var.",
		"Se oye a uno solo por encima de todos, y no dice nada bonito.": "Bir ses hepsinin üstünden duyuluyor, ve hiç hoş şeyler söylemiyor.",
		"El estadio se levanta sólo de verlo con el balón.": "Onu topla görmek bile stadyumu ayağa kaldırıyor.",
		"Corean su nombre. Y todavía no ha hecho nada.": "Adını haykırıyorlar. Ve henüz hiçbir şey yapmadı.",
		"Se oye el murmullo en cuanto la toca.": "Topa dokunduğu an uğultu duyuluyor.",
		"Hasta su propia gente le silba al oír su nombre.": "Kendi taraftarı bile adını duyunca ıslıklıyor.",
		"Silbidos de los suyos. Hoy lo miran con lupa.": "Kendi taraftarından ıslık. Bugün her dokunuşu mercek altında.",
		"Su grada no le perdona una. Cada toque, con lupa.": "Kendi tribünü ona hiçbir şeyi affetmiyor. Her dokunuş mercek altında.",
		"Ganado en su campo. Eso vale doble.": "Deplasmanda kazanıldı. Bu iki kat değerli.",
		"El derbi es tuyo.": "Derbi senin.",
		"Dijiste que lo ganarías, y lo ganaste.": "Kazanacağını söyledin ve kazandın.",
		"Hablaste antes del derbi. Hoy te toca callar.": "Derbiden önce konuştun. Bugün susma sırası sende.",
		"BRAVATA": "PALAVRA",
		"{0} cumplió su palabra ante el {1}": "{0}, {1} karşısında sözünü tuttu",
		"{0} se traga sus palabras ante el {1}": "{0}, {1} karşısında sözlerini yuttu",
		"Cumpliste tu palabra ante el {0}": "{0} karşısında sözünü tuttun",
		"Te tragas tus palabras ante el {0}": "{0} karşısında sözlerini yuttun",
		"Se acabó. Y lo dejaste escapar.": "Bitti. Ve elinden kaçırdın.",


		"Desde tu campo. Todo el césped por delante.": "Kendi yarı sahandan. Bütün saha önünde.",
		"Balón tuyo en tu mitad. Ahora hay que cruzarla entera.": "Top sende, kendi yarı sahanda. Şimdi bütün sahayı geçmen lazım.",
		"Se la das y sigues. Así se sale de la presión.": "Ver ve koş. Pres böyle kırılır.",
		"Un toque y a correr. La presión se queda atrás.": "Tek dokunuş ve koş. Pres geride kalır.",
		"Se la das a {0}, que ya sabía que venía.": "Topu veriyorsun: {0} geleceğini zaten biliyordu.",
		"{0} y tú, de memoria. Ni hizo falta mirar.": "Sen ve {0}, ezbere. Bakmaya bile gerek yoktu.",
		"Medio campo cruzado sin un susto.": "Orta çizgi sorunsuz geçildi.",
		"Ya estás en su mitad. Y con el balón.": "Artık onların yarı sahasındasın. Hem de topla.",
		"Se repliegan. Te dejaron llegar, no entrar.": "Geri çekiliyorlar. Gelmene izin verdiler, girmene değil.",
		"Cuarenta y cinco segundos de toque. Y nada que contar.": "Kırk beş saniye pas. Ve ortada bir şey yok.",
		"Demasiado solo, demasiado tiempo. Te la quitaron.": "Fazla yalnız, fazla uzun. Topu kaptılar.",
		"Se enamoró del balón. Y lo pagó.": "Topa aşık oldu. Ve bedelini ödedi.",
		"Te bajan en tu campo. Falta, y a empezar de nuevo.": "Kendi yarı sahanda seni düşürüyorlar. Faul, ve baştan başla.",
		"Salió de tu área y acabó en la suya. La jugada es tuya.": "Kendi ceza sahandan çıktı, onlarınkinde bitti. Bu atak senin.",
		"Tú la sacaste, él la metió. Así se construye.": "Sen çıkardın, o attı. Oyun böyle kurulur.",

		"Robo en tu campo. ¡A la contra!": "Kendi yarı sahanda top kapma. Kontra!",
		"La recuperas en tu mitad. Ahora, rápido.": "Topu kendi yarı sahanda geri kazanıyorsun. Şimdi, çabuk.",
		"Están todos arriba. Hay campo para correr.": "Hepsi ileride. Koşacak alan var.",
		"Se volcaron buscando el gol. Su espalda es tuya.": "Gol için herkesi ileri attılar. Arkaları senin.",
		"Con uno menos, a la contra. Es lo que toca.": "Bir kişi eksik, kontraya. Şimdi oyun bu.",
		"Diez contra once: se defiende y se sale rápido.": "On bire karşı on: savun, sonra hızlı çık.",
		"Se la das y arrancas. Cada segundo cuenta.": "Ver ve çık. Her saniye önemli.",
		"Pase y a correr. Que no les dé tiempo a volver.": "Pas ver ve koş. Geri dönmeye vakit bulmasınlar.",
		"Tardaste. Ya volvieron todos.": "Geç kaldın. Hepsi geri döndü.",
		"La contra se enfrió. Ya están ordenados atrás.": "Kontra soğudu. Arkada dizildiler.",
		"Falta táctica. Te cortan la contra.": "Taktik faul. Kontranı kestiler.",
		"Contra de manual. De tu campo a la red.": "Ders kitabı gibi kontra. Kendi yarı sahandan ağlara.",
		"Tú la llevaste, él la metió. Contra perfecta.": "Sen taşıdın, o bitirdi. Kusursuz kontra.",
		"Juegan con diez. Busca al que está libre.": "On kişi kaldılar. Boştaki adamı bul.",
		"Tres contra dos. Uno de los tuyos está solo.": "Üçe iki. Senin adamlardan biri boşta.",

		"Contragolpe": "Kontra atak",
		"El hombre de más": "Fazladan adam",
		"Te la quitaron en tu área. Ese regalo no se devuelve.": "Topu kendi ceza sahanda kaptırdın. O hediye geri gelmez.",
		"Perdida en tu área, gol en tu portería. Así de corto.": "Ceza sahanda kayıp, kalende gol. Bu kadar kısa.",
		"Te la roban ahí mismo y tu portero te salva la cara.": "Topu tam orada kaptırıyorsun ve kalecin seni utançtan kurtarıyor.",
		"Se la quitaron en tu área y la tiraron fuera. Hoy sí; mañana, no.": "Topu ceza sahanda kaptılar ve dışarı attılar. Bugün evet; yarın, hayır.",
		"Desde el portero. Corta, y sin regalar.": "Kaleciden. Kısa, ve hiçbir şey hediye etmeden.",
		"Le cortan el primer pase. En tu área. Malo.": "İlk pas kesiliyor. Ceza sahanda. Kötü.",
		"Saque de meta. Tu portero tiene el balón y tú, la decisión.": "Kale vuruşu. Top kalecinde, karar sende.",
		"Te vienen a buscar arriba. El portero no puede pensárselo.": "Seni önde karşılıyorlar. Kaleci düşünemez.",
		"Presión alta al saque. Corto es un riesgo; largo, una moneda al aire.": "Kale vuruşunda önde pres. Kısa risk; uzun, yazı tura.",
		"En corto, a los pies. Salida limpia desde atrás.": "Kısa, ayağa. Geriden temiz çıkış.",
		"Saque corto y balón dominado. Así empieza una jugada, no un despeje.": "Kısa vuruş ve top kontrolde. Atak böyle başlar, uzaklaştırma değil.",
		"La revienta y la baja un compañero. Medio campo de un golpe.": "Uzun vuruyor ve bir arkadaşı topu indiriyor. Tek vuruşta yarım saha.",
		"Largo y con destinatario. La gana tu jugador y sigue el juego.": "Uzun ve adresli. Adamın topu kazanıyor ve oyun sürüyor.",
		"Tu portero te busca. Ahora es tuya, con todo el campo por delante.": "Kalecin seni buluyor. Top artık senin, bütün saha önünde.",
		"Del guante a tus pies. A partir de aquí, la jugada es tuya.": "Eldivenden ayağına. Buradan sonra atak senin.",
		"La reventó y la ganaron ellos. Saque largo, balón perdido.": "Uzun vurdu ve topu onlar kazandı. Uzun vuruş, kayıp top.",
		"Saque largo a ninguna parte: cabeza rival y a defender.": "Hiçbir yere gitmeyen uzun vuruş: rakip kafayı vuruyor, yine savunmadasın.",
		"El saque no encuentra a nadie. Balón muerto y a empezar otra vez.": "Vuruş kimseyi bulmuyor. Ölü top, her şey yeniden.",
		"Se fue sin dueño. Un saque de meta que no llegó a nadie.": "Sahipsiz gitti. Kimseye ulaşmayan bir kale vuruşu.",
		"Se la quitan al primer pase, a un paso de tu portería. Regalo.": "İlk pasta topu kaptılar, kalene bir adım mesafede. Hediye.",
		"Del saque de meta al fondo de la red. Toda la cancha en una jugada.": "Kale vuruşundan ağlara. Tek atakta bütün saha.",
		"Empezó en el guante de tu portero y acabó en gol. Así se sale.": "Kalecinin eldiveninde başladı, golle bitti. Oyun kurmak böyle olur.",
		"De tu portero a la red sin pasar por ti. Lo viste de cerca.": "Kalecinden ağlara, sana hiç uğramadan. Yakından izledin.",
		"Gol de la salida de meta. Tú no la tocaste, pero la viste nacer.": "Kale vuruşundan gelen gol. Topa dokunmadın ama doğuşunu gördün.",
		"Salió de tu portero y la acabaste tú. Cien metros de jugada.": "Kalecinden çıktı, sen bitirdin. Yüz metrelik bir atak.",
		"Saque de meta, campo cruzado y gol tuyo. De área a área.": "Kale vuruşu, saha geçildi ve senin golün. Ceza sahasından ceza sahasına.",
		"Saque de banda en corto, a tus pies. Ahora decides tú.": "Kısa taç atışı, ayağına. Karar artık senin.",
		"Te la saca el lateral y la jugada sigue. Balón cuidado.": "Bek taçı sana atıyor ve oyun sürüyor. Top kontrolde.",
		"Te la saca al pecho. Bájala y a jugar.": "Taçı göğsüne atıyor. İndir ve oyna.",
		"Saque de banda, control de pecho y la jugada viva.": "Taç atışı, göğüsle kontrol ve atak canlı.",
		"La colgaron con las manos y la metiste con la cabeza.": "Elle havaya diktiler, sen kafayla gömdün.",
		"Saque de banda al área y cabezazo a la red. De pizarra.": "Ceza sahasına uzun taç ve ağlara kafa. Tam tahtadaki gibi.",
		"La cuelgan desde la banda y la despejan ellos. A por la siguiente.": "Taçla ceza sahasına atıyorlar, onlar uzaklaştırıyor. Sıradakine.",
		"Saque largo al área y cabeza rival. Esta vez no.": "Ceza sahasına uzun taç ve rakip kafası. Bu sefer olmadı.",
		"Cabezazo tras el saque de banda y el portero lo saca.": "Taç atışı sonrası kafa vuruşu, kaleci çıkarıyor.",
		"Saque largo, remate de cabeza y una parada de las buenas.": "Uzun taç, kafa vuruşu ve harika bir kurtarış.",
		"Saque de banda al área, cabezazo y fuera. Faltó dirección.": "Ceza sahasına uzun taç, kafa vuruşu ve dışarı. Yön eksikti.",
		"La peinas tras el saque largo y se marcha. Cerca.": "Uzun taçta topu kafayla sektiriyorsun, dışarı süzülüyor. Yakındı.",





		"SELECCION": "MILLI",
		"LIBRO DE RECORDS": "REKOR KITABI",




		"Campeón del Mundo": "Dünya Şampiyonası şampiyonu",
		"Bota de Oro del Mundial": "Dünya Şampiyonası Gol Kralı",
		"Campeón de Champions": "Elit Kupası şampiyonu",
		"Campeón de Europa League": "Avrupa Kupası şampiyonu",
		"Campeón del Mundo de Clubes": "Kulüpler Dünya Şampiyonu",
		"Campeón continental": "Kıta şampiyonu",
		"Campeón de Liga": "Lig şampiyonu",
		"Campeón de Copa": "Kupa şampiyonu",
		"Ascenso": "Üst lige çıkış",
		"Mejor Jugador de la Liga": "Ligin En İyi Oyuncusu",
		"Pichichi de la Liga": "Lig Gol Kralı",
		"Máximo Asistente de la Liga": "Lig Asist Kralı",
		"Mejor de la Champions": "Elit Kupası'nın En İyisi",
		"Bota de la Champions": "Elit Kupası Gol Kralı",
		"Máximo Asistente de la Champions": "Elit Kupası Asist Kralı",
		"Mejor de la Europa League": "Avrupa Kupası'nın En İyisi",
		"Bota de la Europa League": "Avrupa Kupası Gol Kralı",
		"Máximo Asistente de la Europa League": "Avrupa Kupası Asist Kralı",


		"Campeón de Conference": "Challenge Kupası şampiyonu",
		"Mejor de la Conference": "Challenge Kupası'nın En İyisi",
		"Bota de la Conference": "Challenge Kupası Gol Kralı",
		"Máximo Asistente de la Conference": "Challenge Kupası Asist Kralı",
		"Mejor de la Copa": "Kupanın En İyisi",
		"Bota de la Copa": "Kupa Gol Kralı",
		"Máximo Asistente de la Copa": "Kupa Asist Kralı",
		"Mejor del Mundial de Clubes": "Kulüpler Dünya Şampiyonası'nın En İyisi",
		"Bota del Mundial de Clubes": "Kulüpler Dünya Şampiyonası Gol Kralı",
		"Máximo Asistente del Mundial de Clubes": "Kulüpler Dünya Şampiyonası Asist Kralı",
		"Jugador del Partido": "Maçın Oyuncusu",
		"Jugador del Mes": "Ayın Oyuncusu",
		"Bota de Oro": "Gol Kralı",
		"MVP de la temporada": "Sezonun Oyuncusu",
		"Bota (Mundial)": "Gol Kralı (Dünya)",
		"Mundial de Clubes": "Kulüpler Dünya Şampiyonası",
		"Continental (selección)": "Kıta (milli)",
		"Liga": "Lig",
		"Copa": "Kupa",
		"Mejor (Liga)": "En İyi (Lig)",
		"Pichichi (Liga)": "Gol Kralı (Lig)",
		"Asist. (Liga)": "Asist (Lig)",
		"Mejor (Champions)": "En İyi (EK)",
		"Bota (Champions)": "Gol Kralı (EK)",
		"Asist. (Champions)": "Asist (EK)",
		"Mejor (Europa)": "En İyi (AK)",
		"Bota (Europa)": "Gol Kralı (AK)",
		"Asist. (Europa)": "Asist (AK)",


		"Mejor (Conference)": "En İyi (CK)",
		"Bota (Conference)": "Gol Kralı (CK)",
		"Asist. (Conference)": "Asist (CK)",
		"Mejor (Copa)": "En İyi (Kupa)",
		"Bota (Copa)": "Gol Kralı (Kupa)",
		"Asist. (Copa)": "Asist (Kupa)",
		"Mejor (Mundialito)": "En İyi (Kulüpler)",
		"Bota (Mundialito)": "Gol Kralı (Kulüpler)",
		"Asist. (Mundialito)": "Asist (Kulüpler)",
		"MVP": "MVP",



		"PAUSA": "DURDU",
		"REANUDAR": "DEVAM",
		"REINICIAR": "YENIDEN",
		"OTRO PARTIDO": "YENI MAÇ",
		"Toca para saltar": "Geçmek için dokun",
		"Gira la vista · suelta para volver a apuntar":
			"Görüşü çevir · nişan için bırak",
		"Arrastra hacia atrás para apuntar": "Nişan almak için geri çek",
		"CABEZAZO · arrastra hacia atrás para apuntar": "KAFA · nişan almak için geri çek",
		"Toca el balón · arrastra para girar": "Topa dokun · döndürmek için sürükle",


		"CENTRO · otro dedo vuelve al tiro": "ORTA · diğer parmak şuta döner",
		"CENTRO · toca el balón": "ORTA · topa dokun",



		"modoTIRO": "ŞUT",
		"modoCENTRO": "ORTA",
		"modoREGATE": "ÇALIM",


		"modoCORRER": "KOŞ",

		"modoDESPEJE": "DEGAJ",

		"modoVOLEA": "VOLE",
		"modoCABEZAZO": "KAFA",
		"modoCHILENA": "ROVAŞATA",



		"vistaARCO": "KALE",
		"vistaCOMPAÑEROS": "TAKIM",
		"Toca para continuar": "Devam etmek için dokun",


		"Arrastra para seguir": "Sürdürmek için sürükle",



		"hudNOTA": "PUAN",
		"notaGOL": "GOL",
		"notaATAJADA": "TUTTU",
		"notaPALO": "DIREK",
		"notaFUERA": "DIŞARI",
		"notaBLOQUEADO": "BLOK",
		"notaDESPEJE": "DEGAJ",
		"notaFUERA DE JUEGO": "OFSAYT",
		"notaBALÓN PERDIDO": "TOP KAYBI",
		"notaSIN CONTACTO": "ISKA",
		"notaEN PROPIA": "K.K. GOL",
		"notaREGATE": "ÇALIM",

		"notaROBO": "KAPMA",
		"notaDESBORDADO": "GEÇILDI",
		"notaPENAL": "PENALTI",
		"notaFALTA": "FAUL",
		"notaPASE": "PAS",
		"notaPASE CLAVE": "KILIT PAS",
		"notaASISTENCIA": "ASIST",




		"notaLA ATRAPA EL PORTERO": "KALECI TUTTU",



		"notaSE TE FUE FUERA": "TOP OYUN DIŞI",



		"notaFALLOS SEGUIDOS": "UST USTE ISKA",
		"notaNADA": "YOK",

		"EJERCICIO {0} DE {1}": "ALIŞTIRMA {0}/{1}",
		"META:": "AMAÇ:",
		"EMPEZAR": "BAŞLA",
		"SIGUIENTE": "SONRAKI",
		"TERMINAR": "BITIR",
		"LA ACADEMIA": "AKADEMI",
		"{0} / {1} ESTRELLAS": "{0} / {1} YILDIZ",

		"Cinco ejercicios para aprender a jugar."
		+ " Cuantas más estrellas saques, mejores ofertas de club recibirás.":
			"Oyunu öğrenmen için beş alıştırma. Ne kadar çok yıldız toplarsan kulüplerden o kadar iyi teklif alırsın.",
		"JUGAR LA ACADEMIA": "AKADEMIYI OYNA",
		"ÚLTIMOS 15 MINUTOS": "SON 15 DAKIKA",
		"TOCA PARA SEGUIR": "DEVAM ICIN DOKUN",
		"SALTAR TUTORIAL": "EGITIMI GEÇ",
		"Estos clubes se fijaron en ti. Elige tu oferta:":
			"Bu kulüpler seni fark etti. Teklifini seç:",
		"ELEGIR YO MISMO": "KENDIM SEÇEYIM",
		"FICHAR": "IMZALA",
		"LA OFERTA DEL OJEADOR": "GOZLEMCININ TEKLIFI",
		"Boletín perfecto: mejor sueldo y rol, y +2 puntos de habilidad.":
			"Kusursuz karne: daha iyi maaş ve rol, artı 2 yetenek puanı.",
		"Tu boletín mejora el sueldo y el rol de estas ofertas.":
			"Karnen bu tekliflerin maaşını ve rolünü iyileştiriyor.",
		"Tu boletín mejora el sueldo de estas ofertas.":
			"Karnen bu tekliflerin maaşını iyileştiriyor.",


		"TE FICHAN COMO: {0}": "ROLUN: {0}",
		"EMPEZARÍAS: {0}": "BAŞLANGIÇ: {0}",
		"MUÉVETE": "HAREKET ET",
		"PÉGALE": "VUR",
		"ENCARA": "USTUNE GIT",
		"SIRVE AL ÁREA": "ORTA YAP",









		"Apoya el dedo dentro del círculo: ahí nace todo. Sácalo del círculo y corres hacia el lado contrario al que jalas. Suelta y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Parmağını dairenin içine koy: her şey orada başlar. Daireden çıkarırsan çektiğin yönün tersine koşarsın. Bırakınca anında durursun. Topu kırmızı diske götür: üstüne basınca söner ve bir sonraki yanar, hep öbür tarafta. Top sürmek nereye gideceğini seçmektir, düz koşmak değil.",
		"Pisa las 4 zonas rojas, en orden.": "4 kırmızı bölgeye sırayla bas.",
		"Nadie te la quita y no hay reloj. Las estrellas son para quien las encadena rápido.": "Kimse topu senden alamaz ve süre yok. Yıldızlar onları hızlı zincirleyene.",
		"Jala hacia atrás y sales corriendo hacia el disco.": "Geri çek, diske doğru koşarsın.",
		"Dos tiros de práctica: el primero a puerta vacía, el segundo ya con portero. Después, 2 goles en 4 intentos.": "İki deneme şutu: ilki boş kaleye, ikincisi kaleciyle. Sonra 4 denemede 2 gol.",
		"Los dos primeros no puntúan. En los otros, cuantos menos intentos gastes, más estrellas.": "İlk ikisi sayılmaz. Kalanlarda ne kadar az deneme harcarsan o kadar çok yıldız.",
		"Las cuatro zonas": "Dört bölge",
		"Tiro a puerta": "Şut çalışması",
		"Jala hacia atrás, como una resortera: la guía apunta hacia"
		+ " adelante. Al soltar, toca el balón — y dónde lo tocas manda."
		+ " La costura marca el centro: ahí sale tenso. Cuanto más abajo"
		+ " de ella, más lo elevas, hasta la cuchara. Y cuanto más al"
		+ " borde, menos potencia: el pepinazo va al centro. Con dos dedos"
		+ " giras la vista y apuntas desde otro ángulo.":
			"Sapan gibi geri çek: kılavuz ileriyi gösterir. Bırakınca topa dokun — nereye dokunduğun her şeyi belirler. Dikiş merkezi gösterir: oraya vurursan top dümdüz gider. Altına indikçe topu o kadar yükseltirsin, aşırtmaya kadar. Kenara yaklaştıkça güç azalır: füze tam ortadan çıkar. İki parmakla görüşü çevirip başka bir açıdan nişan alırsın.",
		"Cuantos menos intentos gastes, más estrellas.":
			"Ne kadar az deneme harcarsan o kadar çok yıldız.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "Rakipler üstünde ve saha önünde: topu sür ve rakip yarı sahaya GEÇ — parlayan çizgiye kadar şut yok, çalım var, ve ilerlediğin her bölümde önüne yeni oyuncular çıkar. Sonra bire bir: hemen vur ya da topu sürüp daireye dön, anında dur ve sakince nişan al.",
		"Primero cruza la media cancha, hasta la raya encendida. Después, el mano a mano: 1 gol en 3 intentos.": "Önce orta sahayı geç, parlayan çizgiye kadar. Sonra bire bir: 3 denemede 1 gol.",
		"La salida es un ensayo y no puntúa. Cuantos menos intentos"
		+ " gastes en el mano a mano, más estrellas.":
			"Çıkış bir provadır, puan getirmez. Bire birde ne kadar az deneme harcarsan o kadar çok yıldız.",
		"Marca 1 gol en 3 intentos.": "3 denemede 1 gol at.",



		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, dos PASES — dentro del círculo pasas —: el cambio de banda, buscando al compañero libre en la otra punta, y el relevo. El relevo es la regla más rara del juego: si el pase le llega a un compañero fuera del área, pasas a jugar con él; si cae dentro del área no hay control que valga y remata de primera.": "Bunlar ORTA: top ceza sahasına havadan gönderilir. Korner zaten ORTA olarak başlar; sağ üstteki gösterge bunu söyler. ORTA (havadan) ve ŞUT (yerden) arasında geçiş için nişan alırken başka bir parmakla dokun ya da o göstergeye dokun. Kaleyi değil, bir takım arkadaşının kafasını ara. Bitirirken iki PAS — dairenin içindeyken pas verirsin —: kanat değiştirme, öbür uçtaki boş adamı bulmak, ve devir. Devir oyunun en tuhaf kuralı: pas ceza sahası dışındaki bir arkadaşına ulaşırsa onunla oynamaya devam edersin; ceza sahasının içine düşerse kontrol yok, ilk vuruşta bitirir.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve los dos pases.": "6 denemede 1 gol at: 3 korner ve 3 orta. Ve iki pası da ver.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. Los dos pases son ensayo y no puntúan.": "Gol altısından herhangi birinde gelebilir. Ne kadar erken, o kadar çok yıldız. İki pas prova, puan getirmez.",
		"El relevo": "Devir",
		"Dentro del círculo pasas · al de fuera del área lo controlas tú": "Daire içinde pas verirsin · ceza sahası dışındaki artık sensin",
		"La barrera tapa el camino raso: elévalo por encima tocando el"
		+ " balón abajo. El costado lo curva, si te atreves. Y el examen"
		+ " final: el penal. Respira. Tú eliges la esquina.":
			"Baraj yerden yolu kapatıyor: topa alttan dokunup üstünden aşırt. Yandan vurursan falso alır, cesaretin varsa. Ve final sınavı: penaltı. Nefes al. Köşeyi sen seç.",
		"Libre: 1 gol en 3 intentos · Penal: 1 en 2.":
			"Serbest vuruş: 3 denemede 1 gol · Penaltı: 2 denemede 1.",


		"SE ACABARON LOS INTENTOS": "DENEME HAKKIN BITTI",
		"TE LA QUITÓ EL PORTERO": "KALECI TOPU ALDI",
		"EJERCICIO {0} TERMINADO": "{0} BITTI",
		"SIN ESTRELLAS": "YILDIZ YOK",
		"REPETIR {0}": "TEKRAR: {0}",
		"VER MIS OFERTAS": "TEKLIFLERIM",
		"Con ellas se decide qué clubes te ofrecen contrato."
		+ " Todo esto se entrena en Práctica cuando quieras.":
			"Hangi kulüplerin sana sözleşme teklif edeceğini onlar belirler. Bunların hepsini istediğin zaman İdman bölümünde çalışabilirsin.",
		"Unos diez minutos. Puedes salirte cuando quieras.":
			"Yaklaşık on dakika. İstediğin an çıkabilirsin.",
		"SALTAR LA ACADEMIA": "AKADEMIYI GEÇ",
		"Eligiendo tu club a mano pierdes el premio del"
		+ " boletín.":
			"Kulübünü elle seçersen karne ödülünü kaybedersin.",
		"< MENÚ": "< MENU",


		"TERMINAR Y VER OFERTAS": "BITIR · TEKLIFLER",
		"EMPEZAR LA ACADEMIA DE CERO": "AKADEMIYE SIFIRDAN BAŞLA",
		"¿SEGURO? TOCA OTRA VEZ": "EMIN MISIN? YINE DOKUN",

		"PASO 1 DE 3 · QUIÉN ERES": "ADIM 1/3 · SEN KIMSIN",
		"PASO 3 DE 3 · DÓNDE EMPIEZAS": "ADIM 3/3 · BAŞLANGIÇ YERIN",


		"TUS CUALIDADES EN ESTE EJERCICIO": "BU ALIŞTIRMADAKI OZELLIKLERIN",


		"TOCA PARA JUGAR": "DOKUN VE OYNA",
		"TOCA PARA EMPEZAR": "DOKUN VE BAŞLA",
		"{0}: SIN ESTRELLAS": "{0}: YILDIZ YOK",



		"Apoya el dedo dentro de tu círculo.":
			"Parmağını dairenin içine koy.",
		"Saca el dedo del círculo: corres al lado contrario.":
			"Parmağını daireden çıkar: ters yöne koşarsın.",
		"Suelta y paras en seco.":
			"Bırak, anında durursun.",
		"Dentro del círculo apuntas: la guía crece.":
			"Dairenin içinde nişan alırsın: kılavuz büyür.",
		"Sacas el dedo del círculo y regateas, sin soltar.":
			"Parmağını bırakmadan daireden çıkar, çalım atarsın.",
		"Vuelves a entrar y paras en seco, apuntando.":
			"Geri girersin, anında durup nişan alırsın.",
		"Sueltas dentro y le pegas.":
			"İçeride bırakırsın ve vurursun.",
		"Toca el pasto fuera de tu círculo y giras la vista.":
			"Dairenin dışında çime dokun, görüş döner.",
		"Otro toque y la vista vuelve.":
			"Bir dokunuş daha, görüş geri gelir.",
		"Fuera del círculo conduces: cruza la raya.":
			"Dairenin dışında top sürersin: çizgiyi geç.",
		"Apunta al área y aguanta el dedo.":
			"Ceza sahasına nişan al ve parmağını tut.",
		"Con otro dedo cambias entre CENTRO y TIRO.":
			"Başka bir parmakla ORTA ve ŞUT arasında geçiş yaparsın.",

		"Empuja este stick y corres hacia el disco.":
			"Bu analoğu it, diske koşarsın.",
		"Empuja este stick y conduces: cruza la raya.":
			"Bu analoğu it, top sürersin: çizgiyi geç.",
		"Empuja este stick y conduces.":
			"Bu analoğu it, top sürersin.",
		"Jala este stick hacia atrás y apuntas.":
			"Bu analoğu geri çek, nişan alırsın.",
		"Sueltas y le pegas.":
			"Bırak ve vur.",
		"Con este botón cambias entre CENTRO y TIRO.":
			"Bu düğme ORTA ile ŞUT arasında geçiş yapar.",
		"Empuja este stick y avanza hacia el arco.":
			"Bu analoğu it, kaleye ilerle.",
		"Jala este stick y pásala a un compañero.":
			"Bu analoğu çek, takım arkadaşına pas ver.",
		"Suelta y la cuelgas.":
			"Bırak, ortayı açarsın.",
		"Jala hacia atrás y suelta para pegarle.":
			"Geri çek ve vurmak için bırak.",
		"Jala hacia atrás y corre: cruza la raya de la media cancha.": "Geri çek ve koş: orta saha çizgisini geç.",
		"Cuélgala al área. Con otro dedo cambias entre CENTRO y TIRO.":
			"Ceza sahasına orta aç. Başka bir parmakla ORTA ve ŞUT arasında geçiş yaparsın.",
		"Jala hacia atrás para pegarle a la falta.":
			"Serbest vuruşu kullanmak için geri çek.",


		"GUÍA {0}/{1}": "IPUCU {0}/{1}",
		"SALTAR": "GEÇ",
		"LISTO": "TAMAM",
		"TIRO o CENTRO": "ŞUT ya da ORTA",
		"Este indicador dice cómo va a salir el balón. Toca con OTRO dedo"
		+ " mientras apuntas —o toca este chip— para cambiar entre TIRO (raso)"
		+ " y CENTRO (colgado). Los córners empiezan en CENTRO.":
			"Bu gösterge topun nasıl çıkacağını söyler. Nişan alırken BAŞKA bir parmakla dokun —ya da bu çipe dokun— ŞUT (yerden) ve ORTA (havadan) arasında geçiş yap. Kornerler ORTA ile başlar.",
		"ESTA ES TU CARRERA": "IŞTE KARIYERIN",
		"Bienvenido. Aquí arriba estás tú: tu media, tu energía y tu"
		+ " dinero, en todas las pantallas.":
			"Hoş geldin. Burada, yukarıda sen varsın: genel puanın, enerjin ve paran, her ekranda.",
		"TU PARTIDO": "MAÇIN",
		"El partido de hoy sale de este botón. Y el campo del fondo es"
		+ " para entrenar cuando quieras.":
			"Bugünkü maç bu butondan başlar. Arkadaki saha da istediğin zaman antrenman yapman için.",
		"Estás aquí: tu partido y lo que reclama tu atención esta"
		+ " semana.":
			"Buradasın: maçın ve bu hafta ilgini bekleyenler.",
		"Tus habilidades, tu contrato, tu gente, tu tienda y tu casa.":
			"Yeteneklerin, sözleşmen, çevren, mağazan ve evin.",
		"Lo que pasa fuera y te afecta: los torneos y el mercado de"
		+ " fichajes.":
			"Dışarıda olup seni etkileyenler: turnuvalar ve transfer piyasası.",
		"Lo que ya no cambia: tu carrera, tus trofeos y las leyendas.":
			"Artık değişmeyenler: kariyerin, kupaların ve efsaneler.",
		"¿REPASAR?": "TEKRAR?",
		"Este botón vuelve a abrir esta guía siempre que quieras.":
			"Bu buton bu rehberi istediğin zaman yeniden açar.",
		"Jala hacia atrás para correr · déjalos atrás":
			"Koşmak için geri çek · onları geride bırak",
		"Arrastra desde tu círculo: dentro apuntas · fuera corres":
			"Dairenden sürükle: içeride nişan · dışarıda koşu",


		"bandaFUERA": "TAÇ",
		"La bajas…": "İndiriyorsun…",
		"Conduciendo · vuelve al círculo para apuntar":
			"Top sürüyorsun · nişan için daireye dön",
		"Conduciendo · toca tu círculo para apuntar": "Top sürüyorsun · nişan için dairene dokun",
		"Jala para tirar · sal del círculo para conducir":
			"Şut için çek · top sürmek için daireden çık",
		"Jala para centrar · sal del círculo para conducir":
			"Orta için çek · top sürmek için daireden çık",
		"Arrastra dentro para apuntar · fuera conduces": "Nişan için içeride sürükle · dışarıda top sürersin",
		"Toca tu jugador · dentro del círculo tiras, fuera conduces":
			"Oyuncuna dokun · daire içinde şut, dışında top sürme",
		"¡Cabezazo de {0}!": "{0} kafayı vuruyor!",
		"¡Al rechace {0}!": "Dönen topta {0}!",
		"¡Al rechace!": "Dönen top!",
		"¡Pase a {0}!": "Pas: {0}!",
		"¡Cabezazo!": "Kafa!",
		"¡Palomita de {0}!": "Balıklama kafa: {0}!",
		"¡Palomita!": "Balıklama!",
		"¡Chilena de {0}!": "Rövaşata: {0}!",
		"¡Chilena!": "Rövaşata!",
		"¡El portero le saca la chilena!": "Kaleci rövaşatayı çıkarıyor!",
		"¡Vaya chilena! Y vaya atajada": "Ne rövaşata! Ve ne kurtarış",
		"La chilena choca con la defensa": "Rövaşata savunmaya çarpıyor",
		"¡Chilena bloqueada!": "Rövaşata bloke edildi!",
		"¡Chilena a las nubes!": "Rövaşata uzaya gitti!",
		"La chilena se va por encima": "Rövaşata üstten auta gidiyor",
		"¡La chilena al poste!": "Rövaşata direğe!",
		"¡Qué chilena! Y el palo dice no": "Ne rövaşata! Direk izin vermedi",
		"La chilena se va por poco": "Rövaşata az farkla dışarıda",
		"¡Casi! La chilena no entró": "Az kalsın! Rövaşata girmedi",
		"¡CHILENA DE {0}! GOLAZO DE OTRO PLANETA": "ROVAŞATA: {0}! BAŞKA GEZEGENDEN BIR GOL",
		"¡DE CHILENA! {0} FIRMA EL GOL DEL AÑO": "ROVAŞATAYLA! {0} YILIN GOLUNU ATIYOR",
		"¡Pase!": "Pas!",
		"¡Pase clave!": "Kilit pas!",
		"¡Pase clave a {0}!": "Kilit pas: {0}!",
		"¡Conduce {0}!": "{0} topu sürüyor!",
		"¡Conduce!": "Top sürüyor!",
		"Segunda jugada": "İkinci top",
		"¡Bloqueado!": "Bloke!",
		"¡Desviado!": "Sekti!",
		"¡Desviado a córner!": "Sekti, korner!",
		"¡AUTOGOL DEL RIVAL!": "KENDI KALESINE!",
		"AUTOGOL": "K.K. GOL",
		"notaDESVIADO": "SEKTI",
		"Tu tiro se iba fuera, pero el defensa la mete en su propia portería.": "Şutun dışarı gidiyordu ama defans oyuncusu topu kendi kalesine soktu.",
		"Iba fuera y rebota en el defensa hasta el fondo de su red. Autogol.": "Dışarı gidiyordu, defans oyuncusuna çarpıp ağlara gitti. Kendi kalesine gol.",
		"¡Le diste al camarógrafo!": "Kameramanı vurdun!",
		"¡REVENTASTE EL CRISTAL DEL PALCO!": "LOCANIN CAMINI PATLATTIN!",
		"¡Agrietaste el cristal del palco!": "Locanın camını çatlattın!",
		"¡Le diste a TU entrenador!": "KENDI hocanı vurdun!",
		"¡Le diste al entrenador rival!": "Rakip hocayı vurdun!",
		"¡Le diste a tu propio banquillo!": "Kendi yedek kulübeni vurdun!",
		"¡Balonazo al banquillo rival!": "Rakip yedek kulübesine füze!",
		" · EL MÍSTER TE SACA": " · HOCA SENI ÇIKARIYOR",
		"EL TÉCNICO RETIRA A {0} · BALONAZO A SU PROPIO BANQUILLO": "{0} OYUNDAN ALINDI · KENDI KULUBESINE TOP ATTI",
		"BALONAZOS A TU PROPIO BANQUILLO": "KENDI KULUBENE ATILAN TOPLAR",
		"Le diste un balonazo a tu propia banca. Al túnel, sin discutir.": "Kendi yedek kulübene top attın. Soyunma odasına, tartışmasız.",
		"Le diste un balonazo a tu propia banca. Fuera del campo, sin discutir.": "Kendi yedek kulübene top attın. Saha dışına, tartışmasız.",
		"Recado a la Banca": "Kulübeye Mesaj",
		"Darle un balonazo a alguien del banquillo rival.": "Rakip yedek kulübesinden birini topla vur.",
		"Fuego Amigo": "Dost Ateşi",
		"Gloria Prestada": "Ödünç Şan",
		"Cederle un penal al compañero que iba por su hat-trick.": "Hat-trick peşindeki takım arkadaşına penaltıyı ver.",
		"Nadie Toca Mi Balón": "Topuma Kimse Dokunamaz",
		"Quedarte el penal con un compañero pidiéndotelo para su hat-trick.": "Hat-trick için isteyen bir arkadaşın varken penaltıyı kendin kullan.",
		"Darle un balonazo a alguien de tu propio banquillo.": "Kendi yedek kulübenden birini topla vur.",
		"Con el Míster No": "Hocaya Olmaz",
		"Tumbar al entrenador rival de un balonazo.": "Rakip hocayı topla yere ser.",
		"Te Vas al Banquillo": "Kulübeye Gidiyorsun",
		"Tumbar a tu propio entrenador de un balonazo.": "Kendi hocanı topla yere ser.",
		"Desalojo": "Kulübe Boşaltma",
		"Tumbar a diez personas de los banquillos a lo largo de tu carrera.":
			"Kariyerin boyunca kulübelerden on kişiyi yere ser.",
		"¡Le diste al recogepelotas! La prensa no te lo perdona": "Top toplayıcı çocuğu vurdun! Basın bunu affetmez",
		"¡Tiraste las botellas del portero!": "Kalecinin su şişelerini devirdin!",



		"¡LE DISTE AL ASPERSOR!": "FISKIYEYI VURDUN!",
		"¡LE TIRASTE LA BEBIDA A UN AFICIONADO!": "BIR TARAFTARIN IÇECEGINI DOKTUN!",
		"¡Le diste a una paloma!": "Bir güvercini vurdun!",
		"¡Se fue a la calle!": "Top stadın dışına gitti!",
		"¡Se quedan el balón!": "Topu vermiyorlar!",
		"¡Fuera de juego!": "Ofsayt!",
		"¡GOL! (asistencia)": "GOL! (asist)",
		"¡GOOOL!": "GOOOL!",
		"Despeje del rival": "Rakip uzaklaştırdı",


		"¡EN PROPIA PUERTA!": "KENDI KALESINE!",
		"¡Se te escapó el balón!": "Top senden kaçtı!",

		"TE LA DEVUELVE EL PORTERO": "KALECI TOPU GERI VERIYOR",
		"EL BALÓN VUELVE A TI": "TOP SANA GERI DONUYOR",
		"¡Atajada del portero!": "Kaleci kurtardı!",
		"Tiro bloqueado": "Şut bloke edildi",
		"Por encima del arco": "Üst direğin üstünden",
		"¡Al poste!": "Direk!",
		"¡Al poste y fuera!": "Direkten dışarı!",
		"¡Fuera!": "Dışarı!",
		"¡Salió el portero!": "Kaleci çıktı!",
		"Se te fue por la línea": "Topu çizgiden dışarı kaçırdın",
		"Te ganó el defensa": "Defans oyuncusu kazandı",


		"Te resbalaste en el charco": "Su birikintisinde kaydın",
		"¡Gran regate!": "Harika çalım!",
		"La cobra {0}": "{0} kullanıyor",
		"¡El portero se la ataja a {0}!": "{0} vurdu, kaleci kurtardı!",
		"¡{0} la estrella en el palo!": "{0} direğe çarptırdı!",
		"¡La barrera se lo tapa a {0}!": "{0} vurdu, baraj engelledi!",
		"Lo saca {0}…": "{0} kullanıyor…",
		"Arrastra para moverte · toca el balón y remata": "Hareket için sürükle · vurmak için topa dokun",
		"¡{0} la manda fuera!": "{0} dışarı gönderdi!",
		"¡Gol de {0}!": "Gol: {0}!",
		"{0} NO FALLA DESDE LOS ONCE METROS": "{0} PENALTIDAN HATA YAPMIYOR",
		"{0} FALLA DESDE LOS ONCE METROS": "{0} PENALTIYI KAÇIRIYOR",
		"LA FALTA DE {0} SE PIERDE SIN PELIGRO": "{0} KULLANDI, FRIKIK ETKISIZ",
		"{0} LA CLAVA DE FALTA DIRECTA": "{0} FRIKIKTEN GOL ATTI",
		"{0} REMATA EL CÓRNER A LA RED": "{0} KORNERI GOLE ÇEVIRDI",
		"AHORA MANDA TU EQUIPO EL {0}": "TAKIMIN ONE GEÇTI, {0}",
		"TU EQUIPO EMPATA EL PARTIDO, {0}": "TAKIMIN EŞITLEDI, {0}",
		"TU EQUIPO RECORTA, {0}": "FARK AZALDI, {0}",
		"SE ADELANTA EL RIVAL, {0}": "RAKIP ONE GEÇTI, {0}",
		"EL RIVAL EMPATA, {0}": "RAKIP EŞITLEDI, {0}",
		"EL RIVAL RECORTA, {0}": "RAKIP FARKI AZALTTI, {0}",
		"ENTRA {0}": "GIREN {0}",
		"SALE {0}": "ÇIKAN {0}",
		"EL TÉCNICO RETIRA A {0} · ACTUACIÓN DEFICIENTE": "HOCA OYUNDAN ALDI: {0} · ZAYIF PERFORMANS",
		"{0} SALE LESIONADO · NO PUEDE CONTINUAR": "{0} SAKATLANDI · DEVAM EDEMIYOR",
		"LESIONADO EN EL {0}'": "SAKAT · {0}. DAKIKA",
		"{0} PIDE EL CAMBIO": "{0} ÇIKMAK ISTIYOR",

		"{0} PIDE EL CAMBIO · NO LE QUEDA NADA": "{0} ÇIKMAK ISTIYOR · DERMANI KALMADI",
		"{0} PIDE EL CAMBIO · EL BANQUILLO NO LO ENTIENDE":
			"{0} ÇIKMAK ISTIYOR · KULUBE ANLAMIYOR",

		"{0} PIDE EL CAMBIO AL BANQUILLO": "{0} KULUBEDEN ÇIKIŞ ISTIYOR",
		"EL BANQUILLO TE DICE QUE AGUANTES: YA NO DA TIEMPO":
			"KULUBE DAYANMANI ISTIYOR: ARTIK ZAMAN YOK",

		"PEDIR CAMBIO": "ÇIKMAK ISTE",
		"CAMBIO PEDIDO": "ÇIKIŞ ISTENDI",


		"VAS AL LÍMITE: MEJOR NO FORZAR": "SINIRDASIN: ZORLAMASAN IYI",
		"EL TÉCNICO RETIRA A {0} · OVACIÓN DEL ESTADIO":
			"OYUNDAN ALINDI: {0} · AYAKTA ALKIŞ",
		"{0} SE VA ENTRE APLAUSOS · EL PARTIDO ESTÁ HECHO":
			"{0} ALKIŞLARLA ÇIKIYOR · MAÇ BITTI SAYILIR",
		"EL BANQUILLO PREPARA TU CAMBIO: EL PARTIDO ESTÁ HECHO":
			"KULUBE DEGIŞIKLIGINI HAZIRLIYOR: MAÇ BITTI SAYILIR",



		"EL PARTIDO ESTÁ EN JUEGO: TE VA A DECIR QUE AGUANTES":
			"MAÇ HALA AÇIK: SANA DAYANMANI SOYLEYECEK",
		"YA TE DIJO QUE NO: INSISTIR SALE CARO": "ZATEN HAYIR DEDI: ISRAR PAHALIYA PATLAR",
		"EL MÍSTER TE DICE QUE AGUANTES: TE NECESITA AHÍ":
			"HOCA DAYANMANI ISTIYOR: SANA ORADA IHTIYACI VAR",
		"EL BANQUILLO DICE QUE AGUANTES": "HOCA DAYAN DEDI",
		"SALIDA GESTIONADA": "PLANLI ÇIKIŞ",
		"PEDISTE EL CAMBIO": "ÇIKMAK ISTEDIN",
		"{0} MIN Y {1} % DE ENERGÍA QUE NO GASTASTE":
			"{0} DK VE %{1} HARCANMAMIŞ ENERJI",



		"YA NO DA TIEMPO: IBAS A SALIR IGUAL": "ARTIK ZAMAN YOK: ZATEN ÇIKACAKTIN",
		"EL PARTIDO ESTÁ HECHO: TE LO VAN A AGRADECER":
			"MAÇ BITTI SAYILIR: SANA TEŞEKKUR EDECEKLER",
		"NO TE QUEDA NADA: EL MÍSTER LO ENTIENDE": "DERMANIN KALMADI: HOCA ANLIYOR",
		"QUEDA PARTIDO Y TE QUEDAN PIERNAS: ES UN DESPLANTE":
			"MAÇ DA VAR, BACAK DA: BU BIR SAYGISIZLIK",
		"{0} PIDE EL CAMBIO Y EL BANQUILLO ASIENTE": "{0} ÇIKMAK ISTIYOR, KULUBE ONAYLIYOR",
		"FUERA DEL CAMPO": "SAHA DIŞINDA",
		"FUERA POR LESION": "SAKATLIKLA ÇIKTI",
		"{0} SALE JUGANDO DE LA PRESIÓN": "{0} PRESTEN TOPLA ÇIKIYOR",
		"{0} ROMPE LÍNEAS CON UN GRAN REGATE": "{0} HARIKA ÇALIMLA HATLARI KIRIYOR",
		"{0} PIERDE EL BALÓN EN UN REGATE": "{0} ÇALIMDA TOPU KAPTIRIYOR",
		"DERRIBAN A {0}: FALTA PELIGROSA": "{0} YERDE: TEHLIKELI FRIKIK",
		"DERRIBAN A {0} EN EL ÁREA: ¡PENAL!": "{0} CEZA SAHASINDA YERDE: PENALTI!",
		"CARGAN A {0} EN LA SALIDA: FALTA": "{0} ÇIKIŞTA ITILDI: FAUL",
		"FRENAN A {0} EN LA SALIDA: FALTA": "{0} ÇIKIŞTA DURDURULDU: FAUL",
		"CARGAN A {0} POR LA ESPALDA: FALTA": "{0} ARKADAN ITILDI: FAUL",
		"MODO TIRO": "ŞUT MODU",
		"MODO CENTRO": "ORTA MODU",
		"REGATEANDO": "ÇALIM",
		"CARGAN A {0} POR LA ESPALDA EN EL ÁREA: ¡PENAL!": "{0} CEZA SAHASINDA ARKADAN ITILDI: PENALTI!",
		"¡ROMPISTE LÍNEAS!": "HAT KIRILDI!",
		"¡FALTA! Se cobra aquí mismo": "FAUL! Burada kullanılacak",
		"¡PENAL! Se cobra en los once metros": "PENALTI! Beyaz noktadan kullanılacak",
		"{0} QUIERE COBRAR EL PENAL": "{0} PENALTIYA TALIP",
		"SE LO DAS": "VER",
		"NO SE LO DAS": "SEN KULLAN",
		"VA POR SU HAT-TRICK": "HAT-TRICK PEŞINDE",
		"TE QUEDAS EL PENAL Y {0} SE APARTA": "PENALTI SENDE, {0} KENARA ÇEKILDI",
		"EL PENAL ES TUYO": "PENALTI SENIN",
		"SE LO DAS A {0}": "VERDIN: {0}",
		"LE CEDES EL PENAL A {0} PARA SU HAT-TRICK": "PENALTIYI VERDIN, {0} HAT-TRICK YAPTI",
		"LE CEDES EL PENAL A {0} Y NO ENTRA": "PENALTIYI VERDIN, {0} KAÇIRDI",
		"EL EQUIPO TE DEJA EL PENAL: HAT-TRICK": "TAKIM PENALTIYI VERDI: HAT-TRICK",
		"EL EQUIPO TE DEJA EL PENAL Y LO FALLAS": "TAKIM PENALTIYI BIRAKTI, SEN KAÇIRDIN",
		"{0} TE DA EL PENAL": "PENALTIYI {0} SANA VERDI",
		"EL PENAL ES DE {0}": "PENALTIYI {0} KULLANACAK",
		"LA FALTA ES DE {0}": "FRIKIGI {0} KULLANACAK",
		"SÍ {0} % · NO {1} %": "EVET %{0} · HAYIR %{1}",
		"PÍDESELO": "ISTE",
		"DÉJASELO": "BIRAK",
		"LE PIDES EL BALÓN A {0}": "TOPU ISTIYORSUN: {0}",
		"{0} TE DA LA FALTA": "FRIKIGI {0} SANA VERDI",
		"{0} SE LO QUEDA": "{0} VERMIYOR",
		"{0} SE LA QUEDA": "{0} VERMIYOR",
		"LE PIDES EL PENAL A {0} Y SE LO QUEDA": "PENALTIYI ISTEDIN, {0} VERMEDI",
		"LE PIDES LA FALTA A {0} Y SE LA QUEDA": "FRIKIGI ISTEDIN, {0} VERMEDI",
		"{0} TE DEJA EL PENAL Y RESPONDES": "PENALTIYI {0} SANA VERDI, HAKKINI VERDIN",
		"{0} TE DEJA EL PENAL Y NO RESPONDES": "PENALTIYI {0} SANA VERDI, OLMADI",
		"{0} TE DEJA LA FALTA Y RESPONDES": "FRIKIGI {0} SANA VERDI, HAKKINI VERDIN",
		"{0} TE DEJA LA FALTA Y NO RESPONDES": "FRIKIGI {0} SANA VERDI, OLMADI",
		"¡TANDA DE PENALES!": "PENALTI ATIŞLARI!",
		"TANDA {0}-{1}": "SERI {0}-{1}",
		"TANDA {0}-{1} · TIRA TU EQUIPO...": "SERI {0}-{1} · SIRA TAKIMINDA...",
		"TANDA {0}-{1} · ¡TE TOCA A TI!": "SERI {0}-{1} · SIRA SENDE!",
		"TANDA {0}-{1} · Cobra {2}...": "SERI {0}-{1} · Kullanan: {2}...",
		"¡GOL! Cobras con personalidad.": "GOL! Kişilikli vuruş.",
		"¡FALLAS TU PENAL!": "PENALTINI KAÇIRDIN!",
		"¡GOL!": "GOL!",
		"¡FALLA TU EQUIPO!": "TAKIMIN KAÇIRDI!",
		"TANDA {0}-{1} · TIRA EL RIVAL...": "SERI {0}-{1} · SIRA RAKIPTE...",
		"GOL DEL RIVAL": "RAKIP ATTI",
		"¡LO ATAJA TU PORTERO!": "KALECIN KURTARDI!",
		"¡AL PALO!": "DIREK!",
		"¡AL TRAVESAÑO!": "UST DIREK!",
		"¡LA MANDA POR ENCIMA!": "USTTEN AUTA!",
		"¡LA MANDA FUERA!": "DIŞARI!",
		"PENALES {0}-{1}": "PENALTI {0}-{1}",
		"¡PASAS TÚ! ({0}-{1})": "TUR SENIN! ({0}-{1})",
		"ELIMINADO EN PENALES ({0}-{1})": "PENALTILARLA ELENDIN ({0}-{1})",
		"VICTORIA": "ZAFER",
		"EMPATE": "BERABERE",
		"DERROTA": "YENILGI",
		"Encarada por la banda": "Kanatta adam eksiltme",
		"Disparo escorado": "Dar açıdan şut",
		"Desde la banda": "Kanattan",
		"Contra por la banda": "Kanattan kontra",
		"Falta lateral al área": "Kanattan serbest vuruş",
		"Uno contra uno": "Bire bir",
		"Falta a {0} m": "{0} m serbest vuruş",









		"Volea al bote": "Yarım vole",
		"Volea bombeada": "Kavisli vole",
		"Volea al vuelo": "Havadan vole",
		"Volea rasa": "Yerden vole",
		"balón botando": "seken top",
		"llega bombeado": "yukarıdan düşen",
		"balón al vuelo": "havadaki top",
		"balón rodando": "yerdeki top",
		"línea adelantada": "ileri savunma hattı",
		"bajo presión": "baskı altında",
		"con superioridad": "sayısal üstünlükle",
		"Tras el regate": "Çalım sonrası",
		"Pared con el pivote": "Pivotla verkaç",
		"Ruptura al espacio": "Boşluğa koşu",
		"Cabezazo al segundo palo": "Arka direğe kafa",
		"Cabezazo en el primer palo": "Ön direğe kafa",
		"Palomita": "Balıklama",
		"El autobús": "Otobüsü çekmek",
		"Mano a mano franco": "Temiz bire bir",
		"Falta escorada al palo corto": "Dar açılı frikik, ön direk",
		"Falta sobre la muralla": "Barajın üstünden frikik",
		"Falta a la escuadra": "Doksana frikik",
		"Saque de banda a la torre": "Uzun taç, kuleye",
		"RIVAL": "RAKIP",
		"RESULTADOS": "SONUÇLAR",
		"DOMINIO": "KONTROL",
		"TU APUESTA": "TAHMININ",
		"ELLOS": "ONLAR",
		"FORMACIÓN": "DIZILIŞ",
		"FUERZA": "GUÇ",
		"SU PELIGRO": "TEHLIKELERI",
		"FRESCO": "DINÇ",
		"EN FORMA": "FORMDA",
		"CARGADO": "DOLU",
		"ENERGÍA": "ENERJI",
		"EN VIVO": "CANLI",

		"1T": "1Y",
		"2T": "2Y",
		"PR": "UZ",
		"TOCA PARA AVANZAR  ▸": "GEÇMEK ICIN DOKUN  ▸",
		"ARRASTRA PARA LEER · TOCA PARA AVANZAR  ▸":
			"OKU: SURUKLE · GEÇ: DOKUN  ▸",





		"▸ VER EL GOL": "▸ GOL TEKRARI",
		"▸ GOL": "▸ GOL",
		"¡GOLAZO! {0} LA MANDA A GUARDAR": "NE GOL! {0} AGLARA GONDERDI",
		"GOL EN CONTRA: {0} CASTIGA EL ROBO EN TU ÁREA": "YEDIGIN GOL: {0} CEZA SAHANDA TOPU KAPIP ATTI",
		"LA REPETICION": "TEKRAR",
		"AL POSTE": "DIREK",
		"AL LARGUERO": "UST DIREK",


		"REVISION VAR": "VAR KONTROLU",
		"COMPROBANDO EL LARGUERO": "UST DIREK KONTROLU",
		"EL PIQUE, BAJO EL LARGUERO": "SEKME UST DIREGIN ALTINDA",
		"TECNOLOGIA DE LINEA DE GOL": "GOL ÇIZGISI TEKNOLOJISI",
		"COMPROBANDO EL POSTE": "DIREK KONTROLU",
		"EL PIQUE, FUERA DE LA RAYA": "SEKME ÇIZGININ DIŞINDA",
		"NO ES GOL": "GOL YOK",
		"ARRASTRA PARA GIRAR LA CÁMARA": "KAMERAYI SURUKLEYEREK ÇEVIR",
		"ARCO": "KALE",
		"ORBITA": "TUR",
		"TU CAMARA": "KAMERAN",


		"repeLIBRE": "SERB.",





		"GUARDADO": "KAYITLI",
		"Guardado en tus fotos": "Fotoğraflarına kaydedildi",
		"Da permiso a Fotos para guardar el video": "Videoyu kaydetmek için Fotoğraflar'a izin ver",
		"No se pudo guardar en tus fotos": "Fotoğraflarına kaydedilemedi",
		"Este aparato no puede guardar el video": "Bu cihaz videoyu kaydedemiyor",
		"No se pudo empezar a grabar": "Kayıt başlatılamadı",
		"Se cortó la grabación": "Kayıt yarıda kesildi",
		"No hay jugada que guardar": "Kaydedilecek pozisyon yok",
		"No hay nada grabado": "Hiçbir şey kaydedilmedi",
		"No se pudo cerrar el video": "Video tamamlanamadı",
		"¡Mira mi gol en Football Legacy!": "Football Legacy'deki golüme bak!",
		"Compartido": "Paylaşıldı",
		"No se pudo abrir compartir": "Paylaşım açılamadı",
		"ENLACE COPIADO: PEGALO EN TU POST": "LINK KOPYALANDI: GONDERIYE EKLE",
		"Listo": "Tamam",





		"ORDEN DESDE LA BANDA: TODOS ATRÁS, SE DEFIENDE EL RESULTADO":
			"KENARDAN TALIMAT: HERKES GERIYE, SKOR KORUNACAK",
		"ORDEN DESDE LA BANDA: EQUILIBRIO, NI ATRÁS NI ARRIBA":
			"KENARDAN TALIMAT: DENGE, NE GERIDE NE ILERIDE",
		"ORDEN DESDE LA BANDA: TODOS ARRIBA, SE VA A POR EL PARTIDO":
			"KENARDAN TALIMAT: HERKES ILERI, MAÇI ALMAYA",
		"EL EQUIPO BAJA EL PISTÓN: A ADMINISTRAR PIERNAS":
			"TAKIM TEMPOYU DUŞURUYOR: GUÇ SAKLANACAK",
		"EL EQUIPO VUELVE A SU RITMO NORMAL": "TAKIM NORMAL TEMPOSUNA DONUYOR",
		"EL EQUIPO SUBE EL PISTÓN: A MORDER CADA BALÓN":
			"TAKIM TEMPOYU ARTIRIYOR: HER TOPA BASKI",
		"PLANTEAMIENTO": "TAKTIK",
		"INTENSIDAD": "YOGUNLUK",
		"planDEFENSIVO": "SAVUNMA",
		"planBALANCEADO": "DENGELI",
		"planOFENSIVO": "HUCUM",
		"planBAJA": "AZ",
		"planMEDIA": "ORTA",
		"planALTA": "ÇOK",
		"Aguantas atrás: encajas menos, pero el balón te llega lejos del área.":
			"Geride bekliyorsun: daha az gol yersin ama top sana ceza sahasından uzakta gelir.",
		"El equipo juega parejo.": "Takım dengeli oynuyor.",
		"Vas al frente: te llega más cerca del arco, pero atrás quedas expuesto.":
			"İleri çıkıyorsun: top sana kaleye daha yakın gelir ama arkada açık verirsin.",
		"Dosificas: tocas menos el balón, pero terminas entero.":
			"Kendini idare ediyorsun: topa daha az dokunursun ama maçı dinç bitirirsin.",
		"Ritmo normal.": "Normal tempo.",
		"Buscas cada pelota, pero acabas fundido (y más expuesto a la lesión).":
			"Her topun peşinden koşarsın ama tükenirsin (ve sakatlık riskin artar).",
		"SE ACABO": "BITTI",
		"HASTA AQUI": "BU KADAR",
		"{0} · {1} de {2}": "{0} · {1}/{2}",
		"EL ULTIMO PITIDO": "SON DUDUK",
		"EL ESTADIO EN PIE": "STADYUM AYAKTA",
		"AÑO A AÑO": "YIL YIL",
		"COMO CRECISTE": "GELIŞIMIN",
		"LA VITRINA": "VITRIN",
		"¿ERES LEYENDA?": "EFSANE MISIN?",
		"LA PRENSA": "BASIN",
		"LO QUE DEJAS": "GERIDE KALAN",
		"GRACIAS {0}": "SAG OL {0}",
		"GRACIAS": "SAG OL",
		"Suena el silbato y ya no hay temporada siguiente.":
			"Düdük çalıyor ve artık bir sonraki sezon yok.",
		"{0} años. El cuerpo pidió la cuenta.":
			"{0} yaşında. Vücut hesabı istedi.",
		"Suena el silbato y esta vez lo eliges tú.":
			"Düdük çalıyor ve bu sefer karar senin.",

		"Suena el silbato y esta vez no hay vuelta.":
			"Düdük çalıyor ve bu sefer dönüş yok.",
		"El cuerpo pidió la cuenta antes de tiempo.":
			"Vücut hesabı vaktinden önce istedi.",
		"\"EL CUERPO LE PASO LA FACTURA\"": "\"VUCUDU FATURAYI KESTI\"",
		"A los {0} años, una lesión decidió por él.":
			"{0} yaşında bir sakatlık onun yerine karar verdi.",
		"Te vas cuando todavía te quedaba algo dentro.":
			"İçinde hala bir şeyler kalmışken gidiyorsun.",
		"{0} temporadas · {1} partidos": "{0} sezon · {1} maç",
		"Las camisetas que vestiste": "Giydiğin formalar",
		"DE PIE": "AYAKTA",
		"El estadio entero, en pie, coreando tu nombre.":
			"Bütün stadyum ayakta, adını haykırıyor.",
		"Muchos de los que aplauden no vieron tu debut.":
			"Alkışlayanların çoğu ilk maçını görmedi.",
		"{0} veces internacional con {1}": "{1} milli takımında {0} maç",
		"No hay historial que enseñar.": "Gösterilecek bir geçmiş yok.",
		"TOTAL": "TOPLAM",
		"LA CARRERA EN CIFRAS": "RAKAMLARLA KARIYER",
		"ASIST": "ASIST",
		"De todo eso, {0} goles y {1} asistencias fueron en la elite (1ª y seleccion):"
		+ " es lo que te compara con las leyendas.":
			"Bunlardan {0} gol ve {1} asist elit seviyede (1. lig ve milli takım) geldi: seni efsanelerle kıyaslayan budur.",
		"TEMP · CLUB": "SEZON · KULUP",
		"TITULOS": "KUPALAR",
		"T{0} {1}": "S{0} {1}",
		"Una carrera tan corta no dibuja curva.":
			"Bu kadar kısa bir kariyer eğri çizmez.",
		"Lo que valias y lo que sabias, año a año":
			"Değerin ve yeteneğin, yıl yıl",
		"VALOR": "DEGER",
		"curvaMEDIA": "GENEL",
		"Valiste más que nunca en la temporada {0}: $ {1}":
			"Hiç {0}. sezondaki kadar değerli olmadın: $ {1}",
		"Tu mejor media fue {0}, y la de hoy es {1}":
			"En iyi genel puanın {0} oldu, bugün {1}",
		"El mercado dejó de creer en ti {0} temporadas antes de que se te acabara el"
		+ " fútbol.":
			"Piyasa sana futbolun bitmesinden {0} sezon önce inanmayı bıraktı.",
		"LA VITRINA VACIA": "BOŞ VITRIN",
		"No ganaste nada, y aun así jugaste {0} temporadas.":
			"Hiçbir şey kazanmadın ama yine de {0} sezon oynadın.",
		"Hay carreras que no caben en una vitrina.":
			"Bazı kariyerler bir vitrine sığmaz.",
		"{0} de equipo · {1} individuales": "{0} takım · {1} bireysel",
		"CON TU EQUIPO": "TAKIMLA",
		"TUYOS Y DE NADIE MAS": "SADECE SENIN",
		"UNO POR UNO": "TEK TEK",
		"COPA · {0}": "KUPA · {0}",
		"MAXIMO GOLEADOR": "GOL KRALI",
		"MAXIMO ASISTENTE": "ASIST KRALI",
		"PODIO DE LA LIGA": "LIGDE ILK 3",
		"MEJOR JUGADOR": "EN IYI OYUNCU",
		"Tu nombre por delante de {0} leyendas del fútbol":
			"Adın {0} futbol efsanesinin önünde",
		"Los grandes de la historia siguen todos por delante.":
			"Tarihin büyükleri hala senin önünde.",
		"PRODUCCION HISTORICA": "TARIHI KATKI",
		"{0} goles y {1} asistencias en la elite":
			"Elit seviyede {0} gol ve {1} asist",
		"Nº{0} de la historia, por delante de {1} leyendas":
			"Tarihte {0}. sıra, {1} efsanenin önünde",
		"Ninguna leyenda del fútbol se queda por detrás de ti.":
			"Hiçbir futbol efsanesi senin gerisinde kalmıyor.",
		"Los récords del mundo siguen donde estaban.":
			"Dünya rekorları hala yerinde duruyor.",
		"RECORD DEL MUNDO: {0}": "DUNYA REKORU: {0}",
		"Goles en una carrera": "Kariyerde gol",
		"Balones de Oro": "Yılın Oyuncusu ödülleri",
		"Ligas ganadas": "Kazanılan ligler",
		"DONDE TE VAS SIENDO LEYENDA": "EFSANE OLDUGUN YERLER",
		"En ninguna parte, todavía.": "Henüz hiçbir yerde.",
		"Al top histórico de un club se entra ganando allí, siendo"
		+ " su máximo goleador o su récord de partidos, o con 10 temporadas seguidas; al"
		+ " de una liga, ganando o marcando goles en su primera división; al de tu"
		+ " selección, siendo uno de sus 5 máximos goleadores.":
			"Bir kulübün tüm zamanlar listesine orada kupa kazanarak, en golcüsü ya da maç rekortmeni olarak veya üst üste 10 sezonla girilir; bir ligin listesine en üst liginde kazanarak ya da gol atarak; milli takımının listesine ise en golcü 5 oyuncusundan biri olarak.",
		"leyenda del club": "kulüp efsanesi",
		"goleador histórico del club": "kulübün tüm zamanların golcüsü",
		"récord de partidos del club": "kulübün maç rekoru",
		"leyenda de la liga": "lig efsanesi",
		"leyenda de la selección": "milli takım efsanesi",
		"Nº{0}": "{0}.",
		"\"{0} GOLES Y UNA SOLA MANERA DE ENTENDER EL JUEGO\"":
			"\"{0} GOL VE OYUNU ANLAMANIN TEK BIR YOLU\"",
		"Se retira uno de los grandes rematadores de su generación.":
			"Kuşağının büyük golcülerinden biri futbolu bırakıyor.",
		"\"{0} GOLES DESPUES, EL AREA SE QUEDA VACIA\"":
			"\"{0} GOL SONRA CEZA SAHASI BOŞ KALIYOR\"",
		"El delantero deja el fútbol tras {0} temporadas.":
			"Forvet {0} sezonun ardından futbolu bırakıyor.",
		"\"NO TODO SE MIDE EN GOLES\"": "\"HER ŞEY GOLLE OLÇULMEZ\"",
		"{0} goles y {1} asistencias en {2} temporadas de oficio.":
			"{2} sezonluk emekle {0} gol ve {1} asist.",
		"\"LA VITRINA QUE DEJA: {0} TITULOS\"": "\"GERIDE BIRAKTIGI VITRIN: {0} KUPA\"",
		"Pocos futbolistas se han ido con tanto ganado.":
			"Çok az futbolcu bu kadar çok şey kazanarak ayrıldı.",
		"\"SE VA CON {0} TITULOS Y NINGUNA DEUDA\"":
			"\"{0} KUPAYLA VE BORÇSUZ GIDIYOR\"",
		"Ganó lo que pudo donde le tocó jugar.":
			"Nerede oynadıysa orada kazanabileceğini kazandı.",
		"\"EL FUTBOL NO SIEMPRE PAGA LO QUE DEBE\"":
			"\"FUTBOL HER ZAMAN BORCUNU ODEMEZ\"",
		"Se retira sin títulos, que no es lo mismo que sin carrera.":
			"Kupasız emekli oluyor, ama bu kariyersiz demek değil.",
		"\"VUELVE A CASA PARA SIEMPRE\"": "\"EVE KALICI DONUŞ\"",
		"Se retira en el {0}, donde empezó todo.":
			"Her şeyin başladığı {0} kulübünde emekli oluyor.",
		"\"JUGO HASTA EL ULTIMO DIA QUE LE DEJARON\"":
			"\"IZIN VERDIKLERI SON GUNE KADAR OYNADI\"",
		"A los {0} años, el calendario decidio por él.":
			"{0} yaşında takvim onun yerine karar verdi.",
		"\"ME VOY AHORA QUE TODAVIA SE JUGAR\"": "\"HALA OYNAYABILIRKEN GIDIYORUM\"",
		"Anuncia su retirada a los {0} años, por decision propia.":
			"{0} yaşında, tamamen kendi kararıyla emekliliğini açıklıyor.",
		"Te vas siendo": "Ayrılırken",



		"{0} retira tu dorsal": "{0} forma numaranı emekliye ayırıyor",
		"{0} temporadas con el mismo número a la espalda.":
			"Sırtında aynı numarayla {0} sezon.",
		"LA CAMISETA QUE SE QUEDA": "SAKLANAN FORMA",
		"{0} temporadas con él": "Onunla {0} sezon",
		"Prestigio: {0} puntos": "Prestij: {0} puan",
		"El vestuario se queda vacío, pero el nombre no se borra.":
			"Soyunma odası boşalıyor ama isim silinmiyor.",
		"Ahora ya solo queda mirar lo que hiciste.":
			"Artık geriye sadece yaptıklarına bakmak kalıyor.",
		"ELIGE EL CLUB DONDE ENTRA": "GIDECEGI KULUBU SEÇ",
		"ELIGE EL CLUB DESTINO": "HEDEF KULUBU SEÇ",
		"También puede ser su propio club, para cambiarlo de asiento.":
			"Kendi kulübü de olabilir, onu başka bir yere taşımak için.",
		"Fichajes, cualidades, caras y escudos a tu gusto.\nSe guarda solo y vale para"
		+ " todas las carreras.":
			"Transferler, özellikler, yüzler ve armalar istediğin gibi.\nKendiliğinden kaydedilir ve tüm kariyerlerde geçerlidir.",
		"EDITADO": "DEGIŞTI",
		"ELIGE EL ASIENTO QUE OCUPA": "GIRECEGI YERI SEÇ",
		"Quien tenga ese asiento hoy SALE del juego; el nuevo\nhereda su puesto y su"
		+ " dorsal.":
			"O yeri bugün kim tutuyorsa oyundan ÇIKAR; yeni gelen\nonun mevkisini ve forma numarasını devralır.",
		"ELIGE CON QUIEN SE INTERCAMBIA": "KIMINLE TAKAS EDECEGINI SEÇ",
		"Los dos jugadores se cambian de club; el puesto y el dorsal\nson del asiento,"
		+ " no viajan.":
			"İki oyuncu kulüp değiştirir; mevki ve forma\nnumarası yere aittir, onlarla gitmez.",
		"{0} · FUERZA {1}": "{0} · GUÇ {1}",
		"SOLO SU POSICION ({0}): {1}": "AYNI MEVKI ({0}): {1}",
		"editorSI": "EVET",
		"editorNO": "HAYIR",
		"CREAR JUGADOR": "OYUNCU YARAT",
		"EDITAR CLUB": "KULUP AYARI",
		"IDENTIDAD": "KIMLIK",
		"AL TOCAR UN CLUB SE ABRE": "KULUBE DOKUNUNCA AÇILAN",
		"Nadie encaja aquí con el filtro puesto. Apágalo para ver el plantel completo.":
			"Bu filtreyle burada kimse uymuyor. Tüm kadroyu görmek için filtreyi kapat.",
		"— BANCA —": "— YEDEK —",


		"LISTA": "LISTE",
		"— RESERVA —": "— REZERV —",
		"QUITAR EDICIONES DEL CLUB": "KULUP DEGIŞIKLIGINI SIL",
		"{0}  · TU PUESTO": "{0}  · YERIN",
		"EDAD": "YAŞ",
		"POSICIÓN": "MEVKI",
		"AÑOS": "YAŞ",
		"NACION": "ULKE",
		"PUESTO": "MEVKI",



		"POR": "GK", "DFC": "CB", "LTI": "LB", "LTD": "RB",
		"MCD": "CDM", "MC": "CM", "MI": "LM", "MD": "RM",
		"DC": "ST", "CAM": "CAM", "MCO": "CAM", "EI": "LW", "ED": "RW",


		"SABE JUGAR DE": "DIGER MEVKI",




		"AL MENOS UN PUESTO: MARCA OTRO ANTES DE QUITAR ESTE.": "EN AZ BIR MEVKI: ONCE BAŞKASINI IŞARETLE.",
		"EL ARCO ES EXCLUYENTE: UN PORTERO NO JUEGA DE NADA MAS.": "KALE AYRI BIR MEVKI: KALECI BAŞKA YERDE OYNAMAZ.",
		"MARCA SU PUESTO DE CAMPO: ASI SALE DEL ARCO.": "SAHA MEVKISINI IŞARETLE: BOYLECE KALEDEN ÇIKAR.",
		"ES EL ULTIMO {0} DEL CLUB: MARCA A OTRO PRIMERO.": "KULUBUN SON {0} OYUNCUSU: ONCE DIGERINI SEÇ.",
		"El primero es su puesto (hoy {0}) y el número es su OVR ahí: quítalo y pasa al siguiente. Hasta {1}, y viajan con la persona.": "İlki onun mevkisi (bugün {0}) ve sayı oradaki OVR değeri: kaldırırsan sıradaki geçer. En fazla {1}, ve kişiyle birlikte giderler.",
		"— TITULARES · {0} —": "— ILK 11 · {0} —",
		"EL ARCO ES EXCLUYENTE: NI ENTRA NI SALE NADIE.": "KALE AYRICALIKLI: KIMSE GIRMEZ, KIMSE ÇIKMAZ.",
		"SU PUESTO VA SIEMPRE: NO SE PUEDE QUITAR.": "KENDI MEVKISI HEP SAYILIR: KALDIRILAMAZ.",
		"HASTA {0} PUESTOS: QUITA UNO PARA PONER OTRO.": "EN FAZLA {0} MEVKI: EKLEMEK ICIN BIRINI SIL.",
		"Su puesto va siempre. Hasta {0}, y viajan con la persona.": "Kendi mevkisi hep geçerli. En fazla {0}, ve kişiyle birlikte giderler.",
		"Mientras juegues aquí, este asiento lo ocupas tú; el jugador editado vale para"
		+ " el resto del mundo.":
			"Burada oynadığın sürece bu yer senin; düzenlediğin oyuncu dünyanın geri kalanında geçerli.",
		"El puesto es del ASIENTO: en un intercambio se queda aquí.":
			"Mevki YERE aittir: takasta burada kalır.",
		"VELOCIDAD": "HIZ",
		"PEGADA": "KUVVET",
		"PUNTERIA": "ISABET",
		"ROSCA": "FALSO",
		"CABEZA": "KAFA",
		"PENAL": "PEN.",
		"BALON PARADO": "DURAN TOP",
		"REFLEJOS": "REFLEKS",
		"REFLEJOS solo cuenta en porteros. Se guarda solo.":
			"REFLEKS sadece kalecilerde sayılır. Kendiliğinden kaydedilir.",
		"Cada puesto se mide por sus cualidades. Se guarda solo.":
			"Her mevki kendi özellikleriyle ölçülür. Kendiliğinden kaydedilir.",
		"REFLEJOS solo cuenta en porteros.": "REFLEKS sadece kalecilerde sayılır.",
		"TRASPASAR": "TRANSFER",
		"QUITAR EDICION (VOLVER AL DE BASE)": "DEGIŞIKLIGI SIL (ORIJINALE DON)",
		"ES EL ULTIMO DE SU PUESTO: NO SE PUEDE CAMBIAR.":
			"MEVKISINDEKI SON OYUNCU: DEGIŞTIRILEMEZ.",

		"MIS EDICIONES": "DEGIŞIKLIKLER",

		"IMPORTAR DATOS": "VERI IÇE AKTAR",
		"Catálogo completo": "Tam katalog",
		"EXPORTAR EL MUNDO ENTERO": "TUM DUNYAYI DIŞA AKTAR",
		"IMPORTAR: ABRIR ARCHIVOS": "IÇE AKTAR: DOSYA",
		"IMPORTAR UN ARCHIVO": "DOSYA IÇE AKTAR",
		"Exportar te da un archivo para editarlo en el ordenador; importar lo trae de vuelta. Vale .json o un .zip con la carpeta de escudos dentro.": "Dışa aktarma sana bilgisayarda düzenlemen için bir dosya verir; içe aktarma onu geri getirir. .json ya da içinde arma klasörü olan bir .zip olur.",
		"Al terminar se abre COMPARTIR: mándalo a Archivos o a tu ordenador para editarlo y volver a importarlo.": "Bitince PAYLAŞ açılır: düzenleyip yeniden içe aktarmak için Dosyalar'a ya da bilgisayarına gönder.",
		"Al terminar se abre GUARDAR: déjalo en Descargas y desde ahí pásalo al ordenador o a tu nube para editarlo y volver a importarlo.": "Bitince KAYDET açılır: İndirilenler'e bırak, oradan düzenleyip yeniden içe aktarmak için bilgisayarına ya da bulutuna taşı.",
		"Si el archivo está en Drive, bájalo antes a Descargas.": "Dosya Drive'daysa önce İndirilenler'e indir.",
		"IMPORTANDO…": "YUKLENIYOR…",
		"Guardando el catálogo y los escudos. No cierres el juego.": "Katalog ve armalar kaydediliyor. Oyunu kapatma.",
		"No se pudo guardar el archivo donde elegiste.": "Dosya seçtiğin yere kaydedilemedi.",
		"El archivo es tuyo y para tu uso personal: el juego no aloja ni reparte packs.": "Dosya senin ve kişisel kullanımın için: oyun paket barındırmaz ve dağıtmaz.",
		"Lo que importes es tuyo y se queda en tu dispositivo: tú respondes de lo que metas en el archivo.": "İçe aktardığın her şey senin ve cihazında kalır: dosyaya koyduğundan sen sorumlusun.",
		"El .zip no trae ningún archivo .json dentro.": "Bu .zip içinde hiç .json dosyası yok.",
		"El archivo es demasiado grande: no se importó nada.": "Dosya çok büyük: hiçbir şey içe aktarılmadı.",
		"no se pudo abrir el selector": "dosya seçici açılamadı",
		"no se pudo copiar el archivo elegido": "seçilen dosya kopyalanamadı",
		"no se encontró el archivo exportado": "dışa aktarılan dosya bulunamadı",
		"EXPORTADO A {0}": "AKTARILDI: {0}",
		"Queda en la carpeta de Football Legacy como {0}: ábrelo en el ordenador para ajustar tus plantillas y vuelve a importarlo.": "Football Legacy klasöründe {0} adıyla duruyor: kadrolarını ayarlamak için bilgisayarda aç ve yeniden içe aktar.",
		"EXPORTAR PLANTILLA": "ŞABLON AKTAR",
		"EXPORTAR": "AKTAR",
		"NO SE PUDO ESCRIBIR": "YAZILAMADI",
		"Saca todos los clubes, plantillas y competiciones tal y como están ahora.": "Tüm kulüpleri, kadroları ve turnuvaları şu anki halleriyle dışarı çıkarır.",
		"Los escudos no van dentro: esos los pones tú.": "Armalar dahil değil: onları sen eklersin.",
		"club": "kulüp",
		"clubes": "kulüp",
		"jugador": "oyuncu",
		"jugadores": "oyuncu",
		"escudo": "arma",
		"escudos": "arma",
		"competicion": "turnuva",
		"competiciones": "turnuva",
		"club desconocido": "bilinmeyen kulüp",
		"competición desconocida": "bilinmeyen turnuva",
		"marca desconocida": "bilinmeyen marka",
		"id vacío": "boş id",
		"nombre vacío": "boş isim",
		"marca {0}: {1}": "marka {0}: {1}",
		"marca deportiva {0}: {1}": "forma markası {0}: {1}",
		"pesa {0} KB (tope {1})": "{0} KB (sınır {1})",
		"no es un PNG válido": "geçerli bir PNG değil",
		"no es un SVG válido": "geçerli bir SVG değil",
		"{0}x{1} (tope {2}x{3})": "{0}x{1} (sınır {2}x{3})",
		"no se pudo escribir": "yazılamadı",
		"no se encontró el archivo": "dosya bulunamadı",
		"no se pudo abrir el archivo": "dosya açılamadı",
		"el archivo pesa más de {0} MB": "dosya {0} MB'den büyük",
		"el archivo no es un JSON válido": "dosya geçerli bir JSON değil",
		"formato {0}: este juego lee el {1}": "biçim {0}: bu oyun {1} biçimini okur",
		"{0} pide {1} asientos y el juego admite de {2} a {3}": "{0} {1} yer istiyor, oyun {2} ile {3} arası kabul ediyor",
		"{0} se queda en {1} asientos: el último es su único {2}": "{0} {1} yerde kalıyor: sonuncusu tek {2}",
		"{0}: el asiento {1} se queda de {2} (el pack lo dejaba sin ninguno)": "{0}: {1}. yer {2} olarak kalıyor (paket onu hiçsiz bırakıyordu)",
		"no se pudo cruzar {0} con {1} (¿mismo país? ¿misma división?)": "{0} ile {1} takas edilemedi (aynı ülke mi? aynı lig mi?)",
		"club desconocido: {0}": "bilinmeyen kulüp: {0}",
		"formación desconocida: {0}": "bilinmeyen diziliş: {0}",
		"país desconocido: {0}": "bilinmeyen ülke: {0}",
		"leyenda desconocida: {0}": "bilinmeyen efsane: {0}",
		"planta desconocida: {0}": "bilinmeyen stadyum planı: {0}",
		"estadio": "stadyum",
		"estadios": "stadyum",
		"logo de {0}: {1}": "{0} arması: {1}",
		"base64 ilegible": "okunamayan base64",
		"{0} trae {1} jugadores y hay {2} asientos": "{0} {1} oyuncu getiriyor ve {2} yer var",
		"{0} trae {1} jugadores para {2} asientos: {3} sin cubrir": "{0} {1} oyuncu getiriyor, yer sayısı {2}: {3} boş",
		"{0}: {1} clubes sin jugadores en el pack (se quedan los del juego)": "{0}: pakette oyuncusu olmayan {1} kulüp (oyunun kendileri kalıyor)",
		"{0} de {1} jugadores": "{0} / {1} oyuncu",
		"{0} sin cubrir": "{0} boş",
		"{0} descartados": "{0} atıldı",
		"IMPORTAR": "YUKLE",

		"EL MUNDO SE MOVIO": "DUNYA DEGIŞTI",
		"Los clubes llevan {0} en esta carrera. Esos jugadores se quedan con su nombre anterior: el pack no los reescribe.":
			"Kulüpler bu kariyerde {0} yaptı. O oyuncular eski isimlerini korur: paket onları yeniden yazmaz.",
		"fichaje": "transfer",
		"fichajes": "transfer",
		"Puedes devolver el mundo al catálogo que acabas de importar. Se pierden esos fichajes, también los de tu plantilla; tu carrera, tu club y tus estadísticas no se tocan.":
			"Dünyayı az önce içe aktardığın kataloğa döndürebilirsin. O transferler kaybolur, kendi kadrondakiler de; kariyerin, kulübün ve istatistiklerin etkilenmez.",
		"VOLVER AL PACK": "PAKETE DON",
		"DEJARLO ASI": "KALSIN",
		"QUITAR TODO LO IMPORTADO": "TUM YUKLENENLERI SIL",
		"NO SE PUDO LEER": "OKUNAMADI",
		"Nombres, plantillas y escudos desde un archivo tuyo. Se puede deshacer entero.":
			"İsimler, kadrolar ve armalar senin dosyandan. Tamamen geri alınabilir.",
		"No hay ningún archivo todavía. Toca IMPORTAR, deja tu .json en esa carpeta y vuelve.":
			"Henüz dosya yok. YUKLE düğmesine dokun, .json dosyanı o klasöre bırak ve geri dön.",
		"Pisa los nombres y las plantillas que tengas ahora.":
			"Şu anki isimlerin ve kadroların üzerine yazar.",
		"Vale para todas las ranuras y se puede quitar entero.":
			"Tüm kayıt yuvalarında geçerli ve tamamen kaldırılabilir.",
		"Todo lo que has tocado, para llegar de un toque y para poder deshacerlo.":
			"Dokunduğun her şey, tek dokunuşla ulaşmak ve geri almak için.",





		"CAMBIAR DE DIVISION": "LIG DEGIŞTIR",
		"La división solo se cambia con la temporada recién empezada: el calendario,"
		+ " la tabla y el bombo de copa ya están armados con las de ahora.":
			"Lig sadece sezon yeni başlamışken değiştirilebilir: fikstür, puan durumu ve kupa kurası şimdikilerle kurulmuş durumda.",
		"El calendario se vuelve a sortear: liga, copa y europeas.":
			"Fikstür yeniden çekilir: lig, kupa ve Avrupa.",
		"EDITOR DE ESTA CARRERA": "BU KARIYERI DUZENLE",
		"EDITAR MI CARRERA": "KARIYERI DUZENLE",
		"Retoca el plantel que tienes HOY: con sus fichajes, sus retiros y sus años"
		+ " encima. Sólo cambia esta partida; tu base de datos global no se toca.":
			"BUGUN sahip olduğun kadroyu düzenle: transferleri, emeklilikleri ve yaşlarıyla. Sadece bu kaydı değiştirir; genel veritabanın etkilenmez.",
		"EDITANDO TU CARRERA · {0} · TEMPORADA {1}":
			"KARIYER DUZENLEME · {0} · SEZON {1}",
		"Lo que toques aquí cambia SOLO esta carrera.\nTu base de datos global no se"
		+ " entera.":
			"Burada dokunduğun her şey SADECE bu kariyeri değiştirir.\nGenel veritabanının haberi olmaz.",
		"{0} de {1} asientos editados en esta carrera.":
			"Bu kariyerde {1} kadro yerinden {0} tanesi düzenlendi.",
		"Todavía no has editado nada en esta carrera.":
			"Bu kariyerde henüz hiçbir şey düzenlemedin.",
		"NO CABE": "YER YOK",
		"Esta carrera ya tiene {0} asientos editados, que es el tope.":
			"Bu kariyerde zaten {0} düzenlenmiş yer var, sınır bu.",
		"Esta carrera ya tiene {0} asientos editados, que es el tope. Quita alguno en"
		+ " MIS EDICIONES.":
			"Bu kariyerde zaten {0} düzenlenmiş yer var, sınır bu. Bazılarını DEGIŞIKLIKLER bölümünden kaldır.",
		"Todo lo que has tocado EN ESTA CARRERA vuelve a como estaba.":
			"BU KARIYERDE dokunduğun her şey eski haline döner.",
		"La base de datos global no se toca: sigue igual en todas las ranuras.":
			"Genel veritabanına dokunulmaz: tüm kayıt yuvalarında aynı kalır.",
		"Los fichajes que hiciste aquí NO se deshacen: son parte de la partida.":
			"Burada yaptığın transferler geri ALINMAZ: kaydın parçasıdır.",
		"Todavía no has editado nada.": "Henüz hiçbir şey düzenlemedin.",
		"· IDENTIDAD DEL CLUB (NOMBRE, COLORES, ESCUDO)":
			"· KULUP KIMLIGI (AD, RENKLER, ARMA)",
		"VER MÁS ({0})": "DEVAMI ({0})",
		"QUITAR TODO LO EDITADO": "TUM DEGIŞIKLIKLERI SIL",
		"Las plantillas, los traspasos, las caras y los escudos vuelven a la base de fábrica.":
			"Kadrolar, transferler, yüzler ve armalar fabrika ayarlarına döner.",
		"Vale para todas las ranuras de partida, no solo para esta.":
			"Bu sadece bu kayıt için değil, tüm kayıt yuvaları için geçerli.",
		"Esto SI es para siempre.": "Bu GERI ALINAMAZ.",
		"Ningún {0} encaja con esa búsqueda. Toca TODOS para ver el resto.":
			"Bu aramaya uyan {0} yok. Kalanları görmek için TUMU seçeneğine dokun.",
		"SUBIR O BAJAR TODO EL CLUB": "KULUBU TOPTAN AYARLA",
		"AJUSTAR EL CLUB": "KULUBU AYARLA",
		"Suma o resta a TODAS las cualidades de los 23 asientos.":
			"23 yerin TUM özelliklerine ekler ya da çıkarır.",
		"Nada baja de {0} ni pasa de {1}. Se deshace entero con QUITAR EDICIONES DEL CLUB.":
			"Hiçbir şey {0} altına inmez ya da {1} üstüne çıkmaz. Tamamını KULUP DEGIŞIKLIGINI SIL ile geri al.",
		"DUPLICAR": "KOPYALA",
		"No es para siempre: QUITAR EDICION devuelve al de antes.":
			"Kalıcı değil: DEGIŞIKLIGI SIL eskisini geri getirir.",
		"JUGADOR NUEVO": "YENI OYUNCU",
		"El puesto y el dorsal los da el asiento\nque elijas al final.":
			"Mevkisini ve forma numarasını\nsonunda seçtiğin yer belirler.",
		"NOMBRE DEL JUGADOR": "OYUNCU ADI",
		"ELEGIR ASIENTO": "YER SEÇ",
		"JUGADOR NUEVO: {0}": "YENI OYUNCU: {0}",
		"TRASPASO: {0} ({1} · {2})": "TRANSFER: {0} ({1} · {2})",
		"CANCELAR ALTA": "KAYIT IPTAL",
		"CANCELAR TRASPASO": "TRANSFER IPTAL",
		"CONFIRMAR ALTA": "KAYDI ONAYLA",
		"{0} entra en {1}.": "{0}, {1} takımına katıldı.",
		"SE VA SOLO (SIN CAMBIO)":
			"TEK GIDER (TAKAS YOK)",
		"INTERCAMBIO CON OTRO JUGADOR":
			"BAŞKA OYUNCUYLA TAKAS",
		"Los dos jugadores cambian de club.":
			"İki oyuncu da kulüp değiştirir.",
		"TRASPASO HECHO: {0} FICHA POR {1}.":
			"TRANSFER TAMAM: {0} → {1}.",
		"Nadie vuelve a cambio: su club se queda con un jugador menos.":
			"Karşılığında kimse gelmez: kulübü bir oyuncu eksik kalır.",
		"Al tocar un club se ficha ahí mismo: no eliges asiento.":
			"Bir kulübe dokununca oraya anında transfer olur: yer seçmezsin.",
		"Nadie vuelve a cambio y nadie deja su asiento.":
			"Karşılığında kimse gelmez, kimse de yerini kaybetmez.",
		"{0} se queda con {1} jugadores y {2} pasa a {3}.":
			"{0} takımında {1} oyuncu kalır, {2} takımı {3} oyuncuya çıkar.",
		"Sigue jugando en su puesto, con un dorsal libre del club nuevo.":
			"Kendi mevkisinde oynamaya devam eder, yeni kulübünde boş bir numarayla.",
		"NO SE PUDO":
			"OLMADI",
		"Ya juega en ese club.":
			"Zaten o kulüpte oynuyor.",
		"Un club no puede bajar de {0} jugadores.":
			"Bir kulüp {0} oyuncunun altına inemez.",
		"Un club no puede pasar de {0} jugadores.":
			"Bir kulüp {0} oyuncuyu geçemez.",
		"{0} se quedaría sin ningún {1}.":
			"{0} takımında hiç {1} kalmaz.",
		"Ese traspaso no se puede hacer.":
			"Bu transfer yapılamaz.",
		"{0} deja su asiento y SALE del juego.":
			"{0} yerini bırakır ve oyundan ÇIKAR.",
		"El nuevo jugará de {0} con el dorsal {1}.":
			"Yeni oyuncu {0} mevkisinde, {1} numarayla oynayacak.",
		"CREAR": "EKLE",
		"ALTA HECHA: {0} ENTRA POR {1}.": "EKLENDI: {0}, {1} YERINE.",
		"{0} ficha por {1}.": "{0}, {1} kulübüne imza attı.",
		"{0} se marcha a {1}.": "{0}, {1} takımına gidiyor.",
		"OJO: {0} pasa a jugar de {1} y {2} de {3}.":
			"DIKKAT: {0} artık {1}, {2} ise {3} oynuyor.",
		"CONFIRMAR TRASPASO": "TRANSFERI ONAYLA",
		"CONFIRMAR": "ONAYLA",
		"TRASPASO HECHO: {0} LLEGA POR {1}.": "TRANSFER: {0} GELDI, {1} GITTI.",
		"QUITAR EDICIONES": "HEPSINI GERI AL",
		"Todo el {0} vuelve a su plantilla de base.":
			"{0} kadrosunun tamamı varsayılan haline döner.",
		"Los traspasos hechos con este club también se deshacen aquí.":
			"Bu kulüple yapılan transferler de burada geri alınır.",
		"QUITAR TODO": "HEPSINI SIL",


		"FISICO": "FIZIK",
		"FISICO (PIEL, PELO, BARBA)": "FIZIK (TEN, SAÇ, SAKAL)",
		"La cara viaja con la persona: si la traspasas, se la lleva. Se guarda solo.":
			"Yüz kişiyle birlikte gider: transfer edersen onu da götürür. Kendiliğinden kaydedilir.",
		"QUITAR FISICO (VOLVER AL DE FABRICA)": "FIZIGI SIL (VARSAYILANA DON)",


		"Nace con esta cara. El alta no se confirma hasta elegir asiento.":
			"Bu yüzle doğar. Yer seçmeden kayıt kesinleşmez.",

		"NOMBRE": "AD",
		"SIGLAS (VAN EN EL ESCUDO)": "KISALTMA (ARMADA YER ALIR)",
		"UNIFORME": "FORMA",
		"UNIFORME · {0}": "FORMA · {0}",
		"Playera": "Forma",
		"Shorts": "Şort",
		"Acento del patrón": "Desen vurgusu",
		"PATRON": "DESEN",
		"LOCAL": "EV",
		"VISITA": "DEP.",
		"ALTERNA": "UÇUNCU",
		"El acento solo se ve si la playera lleva patrón.":
			"Vurgu yalnızca formada desen varsa görünür.",
		"PECHO DE LA PLAYERA": "FORMA ONU",
		"PATROCINADOR": "SPONSOR",
		"MARCA DEPORTIVA": "MARKA",
		"Estas son las marcas del juego: importa un pack de logos para usar las tuyas. El club estrena lo que elijas en esta misma temporada, y desde ahí los contratos siguen rotando solos cada pocas temporadas.":
			"Bunlar oyunun kendi markaları: kendi markalarını kullanmak için bir logo paketi yükle. Kulüp seçtiğini bu sezondan itibaren giyer, sonrasında sözleşmeler birkaç sezonda bir kendiliğinden değişmeye devam eder.",
		"Las marcas salen de tu pack. El club estrena lo que elijas en esta misma"
		+ " temporada, y desde ahí los contratos siguen rotando solos cada pocas"
		+ " temporadas.":
			"Markalar senin paketinden geliyor. Kulüp seçtiğini bu sezondan itibaren giyer, sonrasında anlaşmalar birkaç sezonda bir kendiliğinden değişmeye devam eder.",


		"tintaAUTO": "OTO",
		"TINTA DEL PECHO · {0}": "FORMA ONU RENGI · {0}",
		"Color del patrocinador": "Sponsor rengi",
		"Color de la marca deportiva": "Marka rengi",
		"Con AUTO el juego elige el color que mejor se lee sobre esta playera. El color que fijes vale solo para este uniforme.":
			"OTO seçiliyken oyun bu formada en iyi okunan rengi seçer. Belirlediğin renk yalnızca bu formada geçerli.",
		"Este uniforme se genera solo cada temporada. El club lo estrena tal cual"
		+ " en la temporada en que lo elijas, y a partir de ahí sigue cambiando de"
		+ " color y dibujo cada año.":
			"Bu forma her sezon yeniden oluşturulur. Kulüp onu seçtiğin sezonda olduğu gibi giyer, sonrasında rengi ve deseni her yıl değişmeye devam eder.",
		"ESCUDO": "ARMA",


		"escudoFORMA": "ŞEKIL",
		"FONDO": "ZEMIN",
		"TINTA": "RENK",
		"EMBLEMA": "AMBLEM",
		"BORDE": "KENAR",
		"La fuerza y el país no se tocan aquí: son la estructura de la liga.":
			"Güç ve ülke burada değişmez: bunlar ligin yapısıdır.",



		"Se INTERCAMBIA con un club de otra división del mismo país: uno sube y el"
		+ " otro baja, y cada liga sigue con los mismos equipos.":
			"Aynı ülkenin başka bir ligindeki kulüple yer değiştirir: biri yükselir, diğeri düşer ve her lig aynı takımlarla devam eder.",
		"ELIGE EL CLUB CON EL QUE SE CAMBIA": "YER DEGISECEGI KULUBU SEÇ",
		"Los dos se cruzan: uno sube y el otro baja.\nTiene que ser de otra división"
		+ " del mismo país.":
			"İkisi yer değiştirir: biri yükselir, diğeri düşer.\nAynı ülkenin başka bir liginden olmalı.",
		"CAMBIO DE DIVISION: {0} ({1})": "LIG DEGISIMI: {0} ({1})",
		"CANCELAR CAMBIO": "DEGISIM IPTAL",
		"CONFIRMAR CAMBIO DE DIVISION": "LIG DEGISIMINI ONAYLA",
		"{0} pasa a {1}.": "{0} → {1}.",
		"Se cruzan los dos, así que cada división sigue con los mismos equipos.":
			"İkisi yer değiştirdiği için her ligdeki takım sayısı aynı kalır.",
		"Su plantel y su fuerza no cambian.": "Kadrosu ve gücü değişmez.",
		"Las carreras ya empezadas siguen con la división que tengan.":
			"Başlamış kariyerler mevcut ligleriyle devam eder.",
		"CAMBIO HECHO: {0} A {1}.": "DEGISTI: {0} → {1}.",

		"ELIGE SU EQUIPO NUEVO": "YENI TAKIMINI SEÇ",
		"Se cruza con el técnico de ese club: cada uno se sienta en el banquillo del otro.":
			"O kulübün teknik direktörüyle yer değiştirir: her biri diğerinin kulübesine oturur.",
		"CAMBIO DE EQUIPO: {0} ({1})": "TAKIM DEGISIMI: {0} ({1})",
		"— TÉCNICOS —": "— HOCALAR —",
		"SU CARA": "YUZU",
		"CAMBIAR DE EQUIPO": "TAKIM DEGISTIR",
		"DEJARLO LIBRE": "BOŞTA BIRAK",
		"{0} SE QUEDA SIN EQUIPO. EN SU BANQUILLO SE SIENTA {1}.":
			"{0} TAKIMSIZ KALDI. KULUBEYE {1} GEÇIYOR.",
		"Se va al mercado de técnicos y puede volver.":
			"Teknik direktör piyasasına çıkar ve geri dönebilir.",
		"DEVOLVER A SU CLUB": "KULUBUNE DONDUR",
		"{0} VUELVE A {1}.": "{0} → {1}: DONDU.",
		"QUITAR EDICIÓN DEL TÉCNICO": "HOCA DUZENLEMESINI SIL",

		"— SELECCIONES —": "— ULKELER —",
		"Las selecciones vuelven a su uniforme y su convocatoria de fábrica.":
			"Milli takımlar varsayılan formalarına ve kadrolarına döner.",
		"El uniforme y la convocatoria de cada selección valen para todas tus partidas.":
			"Her milli takımın forması ve kadrosu tüm kayıtlarında geçerlidir.",
		"BUSCAR SELECCION": "MILLI TAKIM ARA",
		"Ninguna selección se llama así.": "Bu isimde bir milli takım yok.",
		"EDITADO: {0}": "DEGISTI: {0}",
		"AUTOMATICA": "OTOMATIK",
		"ELEGIR CONVOCADOS": "KADROYU SEÇ",
		"Este uniforme se genera solo cada temporada. La selección lo estrena tal cual en la temporada en que lo elijas, y a partir de ahí sigue cambiando de color y dibujo cada año.":
			"Bu forma her sezon yeniden oluşturulur. Milli takım onu seçtiğin sezonda olduğu gibi giyer, sonrasında rengi ve deseni her yıl değişmeye devam eder.",
		"La bandera, el nombre y la fuerza de un país no se tocan aquí.":
			"Bir ülkenin bayrağı, adı ve gücü burada değişmez.",
		"QUITAR EDICION DEL UNIFORME": "FORMA DUZENLEMESINI SIL",
		"{0} vuelve a sus uniformes de fábrica.": "{0} varsayılan formalarına döner.",
		"Su convocatoria no se toca.": "Kadrosu olduğu gibi kalır.",
		"FIJAR: va siempre. VETAR: no va nunca. El resto de la lista la arma el juego con los mejores del país.":
			"TUT: hep gider. YASAK: asla gitmez. Listenin geri kalanını oyun ülkenin en iyileriyle doldurur.",
		"CONVOCADOS · {0}": "KADRO · {0}",
		"A LAS PUERTAS": "KAPIDAKILER",
		"VER {0} MAS": "+{0} GOSTER",
		"FUERA DE LA LISTA": "LISTE DIŞI",
		"VETADO": "YASAK",
		"QUITAR VETO": "YASAGI AÇ",
		"FIJADO, PERO YA NO ESTA EN EL PAIS": "SABIT, AMA ARTIK HAVUZDA YOK",
		"FIJADO, SIN SITIO": "SABIT, YER YOK",
		"SOLTAR": "BIRAK",
		"QUITAR FIJADOS Y VETOS": "TUT/YASAK SIL",
		"{0} vuelve a convocar solo a sus mejores.": "{0} yine yalnızca en iyilerini çağırır.",
		"Su uniforme no se toca.": "Forması olduğu gibi kalır.",
		"FIJADO": "SABIT",
		"FIJAR": "TUT",
		"VETAR": "YASAK",

		"— LEYENDAS —": "— EFSANE —",
		"Los grandes de la historia no juegan en ningún club: su cara se toca aquí.":
			"Tarihin büyükleri hiçbir kulüpte oynamaz: yüzleri burada düzenlenir.",
		"Sale con esta cara donde aparezca: al conocerla, en la gala y en la cancha. Se guarda sola.":
			"Bu yüz göründüğü her yerde çıkar: tanıştığında, galada ve sahada. Kendiliğinden kaydedilir.",
		"QUITAR CARA (VOLVER A LA SUYA)": "YUZU SIL (KENDI YUZUNE DON)",
		"La cara viaja con él: si cambia de banquillo, se la lleva. Se guarda sola.":
			"Yüz onunla gider: kulübe değiştirirse onu da götürür. Kendiliğinden kaydedilir.",
		"Fija en todas tus carreras. Sus resultados la suben o la bajan.":
			"Tüm kariyerlerinde sabit. Sonuçları onu yükseltir ya da düşürür.",
		"Sin tocar, se sortea en cada carrera alrededor de esto.":
			"Dokunulmazsa her kariyerde bunun çevresinde rastgele belirlenir.",
		"Sus resultados la suben o la bajan hasta estrella y media.":
			"Sonuçları onu bir buçuk yıldıza kadar yükseltip düşürebilir.",
		"El cambio de equipo vale para las carreras nuevas.": "Takım değişikliği yeni kariyerlerde geçerli olur.",
		"El cambio de equipo vale desde hoy en esta carrera.":
			"Takım değişikliği bu kariyerde bugünden itibaren geçerli.",
		"CONFIRMAR CAMBIO DE EQUIPO": "TAKIM DEGISIMINI ONAYLA",
		"{0} pasa a entrenar al {1}.": "{0}, {1} takımının başına geçiyor.",
		"Cada uno se lleva su habilidad, su cara y sus trofeos.":
			"Her biri yeteneğini, yüzünü ve kupalarını yanında götürür.",
		"Las carreras ya empezadas siguen con sus banquillos.":
			"Başlamış kariyerler kendi kulübeleriyle devam eder.",
		"Tu relación con tu técnico no cambia.": "Teknik direktörünle ilişkin değişmez.",
		"CAMBIO HECHO: {0} ENTRENA AL {1}.": "TAMAM: {0} → {1} HOCASI.",
		"· DIVISION CAMBIADA ({0})": "· LIG DEGISTI ({0})",
		"La división tampoco: se deshace intercambiando otra vez.":
			"Lig de değişmez: geri almak için yeniden yer değiştir.",
		"QUITAR EDICION DEL CLUB": "KULUP DUZENLEMESINI SIL",
		"{0} vuelve a su nombre, uniforme y escudo de fábrica.":
			"{0} varsayılan adına, formasına ve armasına döner.",
		"Su plantel no se toca.": "Kadrosuna dokunulmaz.",


		"LISO": "DUZ",
		"RAYAS": "ÇIZGILI",
		"AROS": "YATAY",
		"MITADES": "YARIM",
		"MANGAS": "KOLLAR",
		"RAYA FINA": "TEL ÇIZGI",
		"BANDA": "KUŞAK",
		"DIAGONAL": "ÇAPRAZ",
		"CUADROS": "KARELI",
		"FRANJA VERTICAL": "ORTA ŞERIT",
		"FRANJA PECHO": "GOGUS ŞERIDI",
		"REDONDO": "DAIRE",
		"SCUDETTO": "SCUDETTO",
		"HEXAGONO": "ALTIGEN",
		"BANDERIN": "FLAMA",
		"ROMBO": "BAKLAVA",
		"ESTANDARTE": "SANCAK",
		"TRAPECIO": "YAMUK",
		"FRANCES": "FRANSIZ",
		"PICA": "MAÇA",
		"CUADRADO": "KARE",
		"PALO": "DIK",
		"FAJA": "BANT",
		"CUARTELES": "DORTLU",
		"CHEVRON": "ŞEVRON",
		"JEFE": "UST",
		"PIE": "ALT",
		"ORLA": "ÇERÇEVE",
		"PUNTA": "UÇ",
		"ROMBOS": "ELMAS",
		"TRICOLOR": "UÇ RENK",
		"SEGUNDO COLOR": "IKINCI RENK",
		"OSCURO": "KOYU",
		"CLARO": "AÇIK",
		"NADA": "YOK",
		"LETRAS": "HARFLER",
		"ESTRELLA": "YILDIZ",
		"DOS ESTRELLAS": "IKI YILDIZ",
		"ARO": "HALE",
		"BALON": "TOP",
		"AGUILA": "KARTAL",
		"TORO": "BOGA",
		"CORONA": "TAÇ",
		"RAYO": "ŞIMŞEK",
		"LUNA": "HILAL",
		"TORRE": "KULE",
		"ANCLA": "ÇAPA",
		"ENGRANE": "DIŞLI",
		"HOJA": "DAL",
		"ORO": "SARI",
		"BLANCO": "BEYAZ",
		"NEGRO": "SIYAH",
		"TEMPORADA {0}": "SEZON {0}",
		"FIN DE TEMPORADA": "SEZON SONU",
		"TU AÑO": "BU YIL",
		"PROGRESION": "GELIŞIM",
		"EL MUNDO": "DUNYA",
		"LO QUE VIENE": "SIRADAKILER",
		"LA DESPEDIDA": "VEDA",
		"IR AL MERCADO": "PIYASAYA GIT",
		"Objetivo del club: {0}": "Kulüp hedefi: {0}",
		"CUMPLIDO": "TAMAM",
		"NO CUMPLIDO": "OLMADI",
		"temporadaMEDIA": "GENEL",
		"{0} vs. el año pasado": "{0} geçen yıla göre",
		"TUS HABILIDADES": "YETENEKLERIN",
		"TU SITIO EN EL MUNDO": "DUNYADAKI YERIN",
		"TU CARRERA HASTA HOY": "KARIYERIN ŞU ANA DEK",
		"Tu mejor partido: {0}": "En iyi maçın: {0}",
		"HITOS DE CARRERA": "KARIYER ANLARI",
		"{0} partidos como profesional": "{0} profesyonel maç",
		"{0} goles de carrera": "{0} kariyer golü",
		"{0} asistencias de carrera": "{0} kariyer asisti",
		"{0} partidos disputados": "{0} maç oynandı",
		"{0} goles marcados": "{0} gol atıldı",
		"{0} asistencias repartidas": "{0} asist yapıldı",
		"TÚ Y TUS COMPAÑEROS": "SEN VE ARKADAŞLARIN",
		"TU MEJOR PARTIDO": "EN IYI MAÇIN",
		"OBJETIVO DEL CLUB": "KULUP HEDEFI",
		"vs {0}": "vs {0}",
		"vs. el año pasado": "geçen sezona göre",
		"EL CLUB Y TÚ": "KULUP VE SEN",
		"EL CLUB CUENTA CONTIGO": "KULUP SANA GUVENIYOR",
		"EL CLUB ESPERA MÁS DE TI": "KULUP SENDEN DAHA FAZLA BEKLER",
		"EL CLUB TE BUSCARÁ MINUTOS FUERA": "KULUP SANA BAŞKA YERDE SURE ARAYACAK",
		"EL CLUB TE PONE EN EL ESCAPARATE": "KULUP SENI SATIŞA ÇIKARIYOR",
		"TU MEDIA AÑO A AÑO": "YILLARA GORE GENELIN",
		"Valor de mercado": "Piyasa değeri",
		"Dinero": "Para",
		"SIN TÍTULOS": "KUPA YOK",
		"Este año no levantaste nada. Se vuelve a empezar.":
			"Bu yıl hiçbir şey kaldırmadın. Her şey yeniden başlıyor.",
		"En color, lo que levantaste; apagado, lo que se escapó.": "Renkli olanlar kazandıkların; soluk olanlar kaçanlar.",
		"LO QUE GANASTE": "KAZANDIKLARIN",
		"GOLEO DE LA LIGA": "GOL KRALLIGI",
		"CÓMO ACABÓ TU LIGA": "LIGIN NASIL BITTI",
		"Acabaste {0} de {1}.": "{1} takım arasında {0} oldun.",
		"SIN NOVEDAD": "YENILIK YOK",
		"El mundo siguió su curso sin sobresaltos.": "Dünya sakin sakin dönmeye devam etti.",
		"LO QUE SE LLEVARON OTROS": "BAŞKALARI NE KAZANDI",

		"EN EL MUNDO": "DUNYADA",
		"FICHAJE DEL AÑO": "YILIN TRANSFERI",
		"Suben de categoría: {0}": "Üst lige çıkanlar: {0}",
		"{0} pts": "{0} puan",
		"Y HASTA AQUI": "BU KADAR",
		"NO HAY TEMPORADA SIGUIENTE.": "ARTIK SONRAKI SEZON YOK.",
		"Se acabó el futbol jugado. Lo que viene ahora es la despedida, y despues lo"
		+ " que dejaste.":
			"Futbolu bıraktın. Şimdi sırada veda var, sonra da geride bıraktıkların.",


		"{0} temporadas": "{0} sezon",
		"Hiciste {0} goles el año pasado": "Geçen sezon {0} gol attın",
		"Diste {0} asistencias el año pasado": "Geçen sezon {0} asist yaptın",
		"Jugaste {0} partidos el año pasado": "Geçen sezon {0} maç oynadın",
		"PRIMA": "PRIM",
		"EL AÑO EN DINERO": "YILIN KAZANCI",
		"GANASTE ESTE AÑO": "KAZANDIGIN",
		"Primas por títulos": "Kupa primleri",
		"Prima de objetivo": "Hedef primi",
		"Prima por el año del club": "Kulübün sezon primi",
		"Royalties de camiseta": "Forma satış payı",
		"Premio del patrocinador": "Sponsor ödülü",

		"TU SELECCIÓN": "MILLI TAKIM",
		"TU CUERPO": "VUCUDUN",
		"EL RESTO DEL AÑO": "YILIN KALANI",
		"TU SITUACIÓN": "DURUMUN",
		"ERES AGENTE LIBRE: tu contrato terminó.": "SERBEST OYUNCUSUN: sözleşmen bitti.",
		"Ningún club es dueño de tu pase. Elige destino en el mercado: fichas sin"
		+ " traspaso y con prima.":
			"Hiçbir kulüp senin sahibin değil. Transfer döneminde nereye gideceğini seç: bonservis bedeli olmadan, imza primiyle gidersin.",
		"Contrato: ÚLTIMO AÑO": "Sözleşme: SON YIL",
		"Contrato: {0} temporadas por delante": "Sözleşme: {0} sezon kaldı",
		"Renueva o escucha ofertas: si acabas el año sin firmar, te vas gratis.":
			"Yenile ya da teklifleri dinle: yılı imzasız bitirirsen bedelsiz gidersin.",
		"LO QUE TE PIDEN AHORA": "YENI HEDEFIN",
		"QUIÉN TE QUIERE": "KIM SENI ISTER",
		"TE QUIERE YA": "HEMEN ISTIYOR",
		"MUY INTERESADO": "ÇOK ISTEKLI",
		"Y {0} clubes más preguntaron por ti.": "{0} kulüp daha seni sordu.",
		"ÚLTIMA JUGADA": "SON POZISYON",
		"GOLEADOR": "GOLCU",
		"ASISTENCIA": "ASIST",
		"hudFINAL": "MAÇ SONU",
		"CALIFICACIÓN": "PUAN",
		"EXPERIENCIA": "TECRUBE",
		"¡NIVEL {0}!  +{1} puntos": "SEVIYE {0}!  +{1} puan",
		"¡NIVEL {0}!": "SEVIYE {0}!",

		"RECUPERADAS": "TOP KAZANMA",



		"Recuperadas": "Top kazanma",
		"OCASIONES": "FIRSAT",
		"PASES": "PAS",
		"{0} CLAVE": "{0} KILIT",
		"HAT-TRICK": "HAT-TRICK",
		"HÉROE DEL DERBI": "DERBI KAHRAMANI",
		"PARTIDAZO": "ŞOV",
		"REPARTIDOR": "ASISTÇI",
		"DOBLETE": "DUBLE",
		"GOL Y ASISTENCIA": "GOL + ASIST",
		"GRAN PARTIDO": "BUYUK MAÇ",
		"LOS 90 MINUTOS": "TAM 90",
		"UNIFORMES PARECIDOS · EL RIVAL SALE DE VISITA":
			"FORMALAR BENZER · RAKIP DEPLASMAN FORMASIYLA",
		"JUGAR": "OYNA",
		"SALTAR AL CAMPO": "SAHAYA ÇIK",
		"SUPLENTE": "YEDEK",
		"CANSADO": "YORGUN",
		"JORNADA {0}": "{0}. HAFTA",
		"Uniforme titular": "İç saha forması",
		"Uniforme visitante": "Deplasman forması",
		"Tercer uniforme": "Üçüncü forma",
		"Uniforme conmemorativo": "Anma forması",
		"uniformeLOCAL": "EV",
		"uniformeVISITA": "DEP.",
		"uniformeALTERNA": "UÇUNCU",
		"El balón debe estar al menos a {0} m de la línea de gol.":
			"Top kale çizgisine en az {0} m uzakta olmalı.",
		"El balón está demasiado cerca del arco (mínimo {0} m).":
			"Top kaleye çok yakın (en az {0} m).",
		"Con el balón tan abierto la cámara cae tras la tribuna (máx {0} m).":
			"Top bu kadar açıktayken kamera tribünün arkasına düşüyor (en fazla {0} m).",
		"Hay un jugador fuera del campo.": "Saha dışında bir oyuncu var.",
		"Un balón en movimiento tan lento nunca sale de la pantalla de tiro.":
			"Bu kadar yavaş hareket eden top şut ekranından hiç çıkmaz.",
		"Tipo de jugada desconocido.": "Bilinmeyen pozisyon türü.",
		"Un jugador de la barrera no está a los 9.15 m.":
			"Barajdaki bir oyuncu 9.15 m'de değil.",
		"{0} {1} CERCA de la jugada quedan fuera del encuadre.":
			"Pozisyonun YAKININDAKI {0} {1} kadraj dışında kalıyor.",
		"{0} {1} tapan tu carril de tiro.": "{0} {1} şut yolunu kapatıyor.",
		"{0} {1} pegados al balón o a tu carrera.":
			"{0} {1} topa ya da koşu yoluna yapışık.",
		"{0} {1} de jugadores encimados.": "{0} {1}: oyuncular üst üste.",
		"{0} {1} en fuera de juego: el pase se pitará.":
			"{0} {1} ofsaytta: pas için düdük çalınacak.",
		"Un centro sin rematadores no tiene a quién buscar.":
			"Ceza sahasında kimse yoksa ortanın gideceği kimse yok.",
		"TUS MARCAS": "REKORLARIN",
		"TORNEOS DE EUROPA": "AVRUPA KUPALARI",

		"BALONES DE ORO": "YILIN OYUNCUSU",
		"LIGAS": "LIGLER",
		"RÉCORD / TÚ": "REKOR / SEN",
		"RÉCORD / {0}": "REKOR / {0}",
		"EN ACTIVO": "HALA OYNUYOR",
		"a los {0}": "{0} yaşında",

		"TUS VÍCTIMAS": "KURBANLARIN",
		"G+A": "G+A",
		"G+A/PJ": "G+A/M",
		"{0} RIVALES": "{0} RAKIP",
		"Todavía no le has hecho daño a nadie.": "Henüz kimseye zarar vermedin.",
		"Aún no hay historia que contar: sal a jugar.":
			"Henüz anlatacak bir hikâye yok: çık ve oyna.",
		"Mejor temporada goleadora": "En golcü sezon",
		"Más asistencias en un año": "Bir yılda en çok asist",
		"Mejor media (10+ partidos)": "En iyi genel (10+ maç)",
		"Valor pico: $ {0} a los {1} años": "Zirve değer: {1} yaşında $ {0}",
		"Mayor presentación: {0} personas ({1}, T{2})":
			"En büyük tanıtım: {0} kişi ({1}, S{2})",
		"{0}: {1} (T{2}, {3})": "{0}: {1} (S{2}, {3})",
		"RÉCORDS DE LA LIGA · {0}": "LIG REKORLARI · {0}",
		"EL REGISTRO DE {0}": "KULUP REKORU · {0}",
		"RÉCORDS DEL MUNDO": "DUNYA REKORLARI",
		"★ {0}: {1} — RÉCORD TUYO": "★ {0}: {1} — REKOR SENDE",
		"{0}: {1} — TU RÉCORD (T{2})": "{0}: {1} — REKORUN (S{2})",
		"Antes: {0} ({1}), con {2}": "Önceki: {0} ({1}), {2} ile",
		"Tu mejor: {0}": "En iyin: {0}",
		"Goles en una temporada": "Bir sezonda gol",
		"Asistencias en una temporada": "Bir sezonda asist",
		"Mejor media en una temporada": "Bir sezonda en iyi genel",
		"Goles en una temporada con el club": "Kulüpte bir sezonda gol",
		"Goles con el club": "Kulüpte gol",
		"SUPERAS A": "GEÇTIN",
		"LEYENDA Nº{0}": "EFSANE NO.{0}",
		"Partidos jugados en la liga": "Ligde oynanan maç",
		"Partidos jugados con el club": "Kulüpte oynanan maç",
		"Goles en una edición de Champions": "Bir Elit Kupası sezonunda gol",
		"Asistencias en una edición de Champions": "Bir Elit Kupası sezonunda asist",
		"Mejor media en una edición de Champions": "Bir Elit Kupası sezonunda en iyi genel",
		"Goles en una edición de Europa League": "Bir Avrupa Kupası sezonunda gol",
		"Asistencias en una edición de Europa League": "Bir Avrupa Kupası sezonunda asist",
		"Mejor media en una edición de Europa League": "Bir Avrupa Kupası sezonunda en iyi genel",
		"Goles en una edición de Conference": "Bir Challenge Kupası sezonunda gol",
		"Asistencias en una edición de Conference": "Bir Challenge Kupası sezonunda asist",
		"Mejor media en una edición de Conference": "Bir Challenge Kupası sezonunda en iyi genel",
		"Goles con la selección": "Milli takımda gol",
		"LA SELECCIÓN · {0}": "MILLI TAKIM · {0}",
		"Reescrito {0} veces: {1}": "{0} kez yenilendi: {1}",
		"{0} reescribió el libro: {1} ({2})": "{0} tarihi yeniden yazdı: {1} ({2})",
		"RÉCORD": "REKOR",



		"SUPERAS A UNA LEYENDA": "BIR EFSANEYI GEÇTIN",
		"SUPERADA": "GEÇILDI",
		"TE ADELANTÓ": "SENI GEÇTI",
		"Tu palmarés sólo cuenta lo ganado en 1ª división y el Mundial: es la vara con la que se mide a los grandes.":
			"Kariyer kartın yalnızca 1. ligde ve Dünya Şampiyonası'nda kazandıklarını sayar: büyükler bu ölçüyle değerlendirilir.",
		"Superar a tu primera leyenda de la historia (sólo cuenta lo hecho en 1ª división o con la selección).":
			"Tarihteki ilk efsaneni geç (yalnızca 1. lig ve milli takım başarıları sayılır).",
		"SUPERADO EN TÍTULOS": "KUPADA GEÇILDIN",
		"SUPERADO EN GOLES + ASISTENCIAS": "GOL + ASISTTE GEÇILDIN",
		"TUS TÍTULOS (1ª Y SELECCIÓN)": "KUPALARIN (1. LIG VE MILLI)",
		"TUS GOLES + ASISTENCIAS DE ÉLITE": "ELIT GOL + ASISTLERIN",
		"la tuya": "seninki",
		"por delante": "önde",
		"SEGUIR": "DEVAM",
		"lo tenía": "sahibi",
		"su marca": "rekoru",
		"desde": "itibaren",
		"Tu nombre entra en los libros. Ese registro ya es tuyo.":
			"Adın kitaplara geçti. O rekor artık senin.",
		"{0}: {1}. El registro era de {2} ({3}).":
			"{0}: {1}. Rekor {2} adlı oyuncudaydı ({3}).",
		"{0} · {1} JUGADORES": "{0} · {1} OYUNCU",
		"CAPITÁN": "KAPTAN",
		"PENALES": "PENALTI",
		"EL GLOBAL ES TUYO: AL RIVAL NO LE SIRVE ESTE MARCADOR": "TOPLAMDA ONDESIN: BU SKOR RAKIBE YARAMAZ",
		"{0} SE VUELCA ARRIBA: LE FALTAN {1} PARA PASAR": "{0} HUCUMA YUKLENIYOR: TUR IÇIN {1} GOL LAZIM",
		"EL RIVAL DEJA MEDIO EQUIPO EN TU CAMPO, ATRÁS HAY PRADERA": "RAKIP YARI TAKIMINI SENIN SAHANA YIGDI, ARKASI BOMBOŞ",
		"GLOBAL EMPATADO: ESTO HUELE A PRÓRROGA": "TOPLAMDA EŞITLIK: UZATMA KOKUSU VAR",
		"TE FALTAN {0} EN EL GLOBAL, HAY QUE IR A POR ELLOS": "TOPLAMDA {0} GOL LAZIM, GIT VE AL ONLARI",
		"TU EQUIPO SE VUELCA Y DEJA LA ESPALDA VENDIDA": "TAKIMIN HUCUMA YUKLENIYOR, ARKASI BOMBOŞ",
		"GLOBAL {0}-{1}": "TOPLAM {0}-{1}",
		"PASA {0}": "TUR: {0}",
		"FALTAS / CÓRNERS": "FAUL / KORNER",
		"Sin plantel: aún no tienes club.": "Kadro yok: henüz bir kulübün yok.",
		"SUELDO": "MAAŞ",
		"NOTA": "PUAN",
		"Capitán": "Kaptan",
		"Lanza los penales": "Penaltıları kullanır",
		"Lanza faltas y córners": "Serbest vuruş ve kornerleri kullanır",
		"Aún no hay convocatoria que mostrar.": "Henüz gösterilecek kadro yok.",
		"CONVOCATORIA": "KADRO",


		"— banca —": "— yedekler —",
		"— corte de la convocatoria —": "— kadro sınırı —",

		"No tienes avisos todavía.": "Henüz bildirimin yok.",
		"{0} · NUEVO": "{0} · YENI",
		"T{0} · día {1}": "S{0} · gün {1}",
		"buzonPREMIO": "ODUL",
		"buzonCLUB Y SELECCION": "KULUP VE MILLI",
		"buzonMARCA Y NIVEL": "MARKA/SEVIYE",
		"buzonLESION": "SAKAT",
		"buzonAVISO": "HABER",
		"COMÚN": "YAYGIN",
		"RARO": "NADIR",
		"ÉPICO": "EPIK",
		"LEGENDARIO": "EFSANEVI",
		"ADIÓS A LAS CANCHAS": "SON DUDUK",
		"{0} TEMPORADAS · SE RETIRA A LOS {1}": "{0} SEZON · {1} YAŞINDA BIRAKTI",
		"JUGO HASTA EL FINAL": "SONUNA KADAR OYNADI",
		"SE FUE CUANDO QUISO": "ISTEDIGINDE GITTI",

		"EL CUERPO DIJO BASTA": "VUCUT YETER DEDI",
		"TU LEGADO": "MIRASIN",
		"por rango": "dereceye göre",
		"Club: {0} partidos  ({1}V · {2}E · {3}D)":
			"Kulüp: {0} maç  ({1}G · {2}B · {3}M)",
		"Goles: {0}   Asistencias: {1}   Media: {2}":
			"Gol: {0}   Asist: {1}   Genel: {2}",
		"{0}: {1} partidos · {2} goles · {3} asistencias":
			"{0}: {1} maç · {2} gol · {3} asist",
		"TOTAL: {0} partidos · {1} goles · {2} asistencias":
			"TOPLAM: {0} maç · {1} gol · {2} asist",
		"{0} títulos de equipo · {1} premios individuales":
			"{0} takım kupası · {1} bireysel ödül",
		"TUS CLUBES": "KULUPLERIN",
		"EMPEZAR OTRA CARRERA": "YENI KARIYERE BAŞLA",
		"ENTRAR AL MUSEO": "MUZEYE GIR",
		"TE QUIEREN DE VUELTA": "SENI GERI ISTIYORLAR",
		"JUGASTE AQUÍ": "BURADA OYNADIN",
		"Ya jugaste aquí, y no te han olvidado.": "Daha önce burada oynadın ve seni unutmadılar.",
		"Su {0} tiene {1}. Tú vuelves con {2}.": "{0} gücü: {1}. Sen {2} ile dönüyorsun.",
		"¿FIRMAS?": "IMZA?",
		"{0} · {1} por temporada, {2} años.": "{0} · sezonluk {1}, {2} yıl.",
		"Vuelves como agente libre y sin traspaso. Es la única vuelta que tiene esta carrera: si la firmas, el retiro que viene después ya es el definitivo.": "Serbest oyuncu olarak, bonservis bedeli olmadan dönüyorsun. Bu kariyerin tek dönüşü bu: imzalarsan sonraki emeklilik kesin olur.",
		"FIRMAR Y VOLVER": "IMZALA VE DON",
		"¿VOLVER A JUGAR?": "TEKRAR OYNA?",
		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos. Volverías con 10 puntos menos en todas tus habilidades.": "Teklifleri dinlemek bir yıla mal olur: dünya sensiz dönmeye devam eder, sen de oynamadan yaşlanırsın. Tüm yeteneklerin 10 puan düşük döneceksin.",
		"VER QUIÉN ME QUIERE": "BENI KIM ISTIYOR",


		"¿SALIR DEL RETIRO?": "EMEKLILIKTEN DONUŞ?",
		"Escuchar ofertas cuesta un año, y vuelves con 10 menos en todo.": "Teklifleri dinlemek bir yıla mal olur ve her şeyde 10 puan düşük dönersin.",
		"SÍ, VUELVO": "EVET, DONDUM",
		"YA PAGASTE EL AÑO": "YIL ODENDI",
		"CUESTA UN AÑO · 10 MENOS EN TODO": "BIR YIL · HER ŞEYDE -10",
		"¿CON QUIÉN VUELVES?": "KIMLE DONUYORSUN?",
		"VOLVER AL MUSEO": "MUZEYE DON",


		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos.": "Teklifleri dinlemek bir yıla mal olur: dünya sensiz dönmeye devam eder, sen de oynamadan yaşlanırsın.",
		"LO QUE CUESTA": "BEDELI",
		"HABILIDADES": "YETENEKLER",
		"VUELVES": "DONUŞ",
		"EL ÚLTIMO VISTAZO": "SON BIR BAKIŞ",
		"años": "yaş",
		"tu OVR": "OVR'in",
		"Ni una copa detrás del cristal. Por eso vuelves.": "Camın ardında tek bir kupa yok. Bu yüzden dönüyorsun.",
		"Todo eso ya lo ganaste. Y aun así te vas a poner las botas otra vez.": "Bunların hepsini zaten kazandın. Yine de kramponları bir kez daha giyiyorsun.",
		"Se está bien aquí dentro. Pero aquí dentro ya no pasa nada.": "Burası güzel. Ama artık burada hiçbir şey olmuyor.",
		"EL AÑO QUE TE PERDISTE": "KAÇIRDIGIN YIL",
		"La liga la ganó {0}.": "Ligi kazanan: {0}.",
		"No llamó nadie. El teléfono de un retirado de tu edad suena poco, y ese silencio también es una respuesta.": "Kimse aramadı. Senin yaşında emekli birinin telefonu az çalar ve bu sessizlik de bir cevaptır.",
		"MUSEO": "MUZE",
		"SALIR DEL MUSEO": "MUZEDEN ÇIK",
		"NO QUEDAN RANURAS": "BOŞ YUVA YOK",
		"Todas las ranuras tienen carrera. Cuelga esta placa en el SALÓN DE LA FAMA o borra una desde AJUSTES para empezar otra.": "Tüm yuvalar dolu. Yenisine başlamak için bu plaketi HALL OF FAME'e as ya da AYARLAR'dan birini sil.",
		"ELEGIR CARRERA": "KARIYER SEÇ",
		"Tres carreras, cada una con su propia partida.":
			"Üç kariyer, her birinin kendi kaydı.",
		"RETIRADO · {0} PARTIDOS · {1} GOLES": "EMEKLI · {0} MAÇ · {1} GOL",
		"RETIRADO · {0} PARTIDOS": "EMEKLI · {0} MAÇ",
		"MANTÉN PULSADO PARA BORRAR": "SILMEK IÇIN BASILI TUT",
		"TEMPORADA {0} · {1} AÑOS · {2} PJ": "SEZON {0} · {1} YAŞ · {2} MAÇ",
		"¿BORRAR ESTA CARRERA?": "KARIYER SILINSIN MI?",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.\nLas otras dos"
		+ " no se tocan.":
			"{0} adlı oyuncunun kariyeri silinir: seviye, para, sözleşme ve kupalar.\nDiğer ikisine dokunulmaz.",
		"TU JUGADOR": "OYUNCUN",
		"TU CLUB · SE CAMBIA EN EL MERCADO": "KULUBUN · PIYASADA DEGIŞIR",
		"Se guarda solo.": "Otomatik kaydedilir.",
		"GUARDAR": "KAYDET",

		"¡Peina {0}!": "{0} kafayla uzattı!",
		"¡La peina!": "Kafayla uzattı!",
		"¡Cambio de banda!": "Oyunu öbür kanada çevirdin!",
		"Te quedaste con la salida corta": "Kısa pasla yetindin",
		"El pase no llegó": "Pas ulaşmadı",
		"¡Saliste jugando!": "Oyunu geriden kurdun!",
		"Te encerraron": "Seni sıkıştırdılar",
		"Toca a tu jugador para empezar": "Başlamak için oyuncuna dokun",
		"Te frenaron con falta": "Seni faulle durdurdular",
		"¡El perro cortó la jugada!": "Köpek oyunu kesti!",

		"El rival se repliega": "Rakip geri çekiliyor",
		"Falta en tu campo: se reanuda": "Kendi yarı sahanda faul: oyun yeniden başlıyor",

		"SAL JUGANDO": "GERIDEN KUR",

		"¡DE PRIMERA! PASE DE {0}": "DIREKT! PAS: {0}",
		"¡DE PRIMERA! TE LA PONEN": "DIREKT! PAS GELIYOR",
		"¡CABEZAZO! TE LA CUELGAN": "KAFA! ORTA GELIYOR",
		"¡CABEZAZO! CENTRO DE {0}": "KAFA! ORTA: {0}",
		"¡VOLEA! TE LA CUELGAN": "VOLE! ORTA GELIYOR",
		"¡VOLEA! CENTRO DE {0}": "VOLE! ORTA: {0}",
		"¡CHILENA! TE LA CUELGAN": "ROVAŞATA! ORTA GELIYOR",
		"¡CHILENA! CENTRO DE {0}": "ROVAŞATA! ORTA: {0}",
		"¡CÓRNER! TE LA CUELGAN": "KORNER! ORTA GELIYOR",
		"¡CÓRNER! LO SACA {0}": "KORNER! ATAN: {0}",
		"¡FALTA! TE LA CUELGAN": "FAUL! ORTA GELIYOR",
		"¡FALTA! LA CUELGA {0}": "FAUL! ORTA: {0}",

		"Salida de meta": "Kale vuruşu",
		"Sacas de meta con tu portero: juégala en corto o revienta el pase largo. Luego juegas con quien la recibe.": "Kale vuruşunu kalecinle kullanıyorsun: kısa oyna ya da uzun vur. Sonra topu alanla oynarsın.",
		"Apunta a un compañero y suelta": "Bir takım arkadaşına nişan al ve bırak",
		"SALIDA DE META": "KALE VURUŞU",
		"Te cortaron el pase": "Pasın kesildi",
		"PASE CORTADO": "PAS KESILDI",

		"Salida jugada": "Geriden oyun kurma",
		"Naces en tu campo con el balón. Conduce, pásala y avanza: cada pase lo golpeas tú y juegas con quien la recibe.": "Kendi yarı sahanda topla başlıyorsun. Top sür, pas ver ve ilerle: her pası sen vurursun ve topu alanla oynarsın.",
		"Arrastra para conducir; apunta a un compañero y suelta": "Top sürmek için sürükle; bir arkadaşına nişan al ve bırak",
		"Saque de banda corto": "Kısa taç",
		"Saque de banda al área": "Ceza sahasına taç",
		"Te la sacan de banda al área. No se controla: espera a que llegue y cabecea a puerta.": "Taçla top ceza sahasına atılıyor. Kontrol yok: gelmesini bekle ve kafayla kaleye vur.",
		"Espera el saque; luego jala y suelta": "Atışı bekle; sonra çek ve bırak",
		"Un compañero te la saca de banda: la controlas solo y juegas libre. Regatea, tira o devuélvesela.": "Bir arkadaşın taç atıyor: topu otomatik kontrol edip serbest oynarsın. Çalım at, şut çek ya da geri ver.",
		"¡SAQUE DE BANDA!": "TAÇ!",
		"¡{0} SACA DE BANDA!": "TAÇ: {0}!",
		"Naces en tu campo con el balón y el arco lejos. Conduce, pásala a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "Kendi yarı sahanda topla başlıyorsun, kale çok uzakta. Top sür, bir arkadaşına pas ver ve devam et: pas şut gibi vurulur ve topu alanla oynarsın. İlerlemeden geride kalırsan rakip baskıyı artırır. Sonra bire bir: hemen şut çek ya da topu sürüp çembere geri dön, durup sakince nişan al.",
		"Primero sal jugando desde tu campo: conduce, pasa y llega hasta el arco. Después, el mano a mano: 1 gol en 3 intentos.": "Önce kendi yarı sahandan oyunu kur: top sür, pas ver ve kaleye ulaş. Sonra bire bir: 3 denemede 1 gol.",
		"Pásala a un compañero y avanza hacia el arco.": "Bir arkadaşına pas ver ve kaleye doğru ilerle.",
		"PASA Y AVANZA": "PAS VE KOŞ",
		"ATAJADA": "TUTTU",
		"DESPEJE": "TEMIZ",
		"FUERA DE JUEGO": "OFSAYT",
		"BALÓN PERDIDO": "TOP KAYBI",


		"TE RESBALASTE": "KAYDIN",
		"SIN CONTACTO": "ISKA",
		"CAMBIO DE BANDA": "KANAT DEGIŞTIR",
		"PASE FALLADO": "KOTU PAS",
		"SALIDA LIMPIA": "TEMIZ ÇIKIŞ",
		"TOCA PARA SALIR": "DOKUN VE ÇIK",
		"ENCERRADO": "SIKIŞTIN",
		"FALTA AL SALIR": "ÇIKARKEN FAUL",
		"LA COBRA OTRO": "ARKADAŞIN ATAR",
		"¡PRÓRROGA! Dos tiempos de 15 minutos.": "UZATMA! 15'er dakikalık iki devre.",
		"Fin del primer tiempo extra.": "Uzatmanın ilk yarısı bitti.",
		"¡TE TOCA A TI!": "SIRA SENDE!",
		"Cobra tu compañero…": "Takım arkadaşın topun başında…",
		"Cobra el rival…": "Rakip topun başında…",
		"Cobra {0}…": "Topun başında: {0}…",
		"Arrastra hacia atrás para correr · lleva el balón a la zona roja":
			"Koşmak için geri sürükle · topu kırmızı bölgeye götür",
		"Arrastra hacia atrás para correr · cruza al campo rival":
			"Koşmak için geri sürükle · rakip yarı sahaya geç",
		"CAMPO RIVAL · TIRA O PASA": "RAKIP SAHA · ŞUT YA DA PAS",
		"CAMPO RIVAL · TIRA": "RAKIP SAHA · ŞUT",


		"LLEVA EL BALON AL DISCO ROJO": "TOPU KIRMIZI DISKE GOTUR",




		"AL DISCO ROJO": "KIRMIZI DISKE",
		"RASA Y LENTA": "YERDEN YAVAŞ",
		"SUBE Y CAE": "YUKSELIR, DUŞER",
		"COMBA": "FALSO",
		"EL CENTRO PEGA MAS FUERTE": "ORTA EN SERT VURUR",
		"DENTRO TIRAS / FUERA REGATEAS": "IÇERDE ŞUT / DIŞARDA ÇALIM",
		"IZQUIERDO CONDUCE / DERECHO TIRA": "SOL SURER / SAG ŞUT ÇEKER",
		"PASALA": "PAS VER",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: un toque en el pasto, fuera de tu círculo y sin nadie debajo, gira la vista a la banda y te enseña a los compañeros; otro toque y vuelve.":
			"Pas tuşu yok: pas vermek bir arkadaşına nişan alıp ŞUT ÇEKMEKTIR ve topu kim önce ulaşırsa o alır. İki arkadaşın var: biri ceza sahası dışında, biri içinde. Pasın ceza sahası dışına düşerse topu alanla oynamaya geçersin. İçine düşerse kontrol yok: direkt vurur. Onları görmek için: çemberinin dışında, altında kimse olmayan bir yere, çime dokun; kamera taç çizgisine döner ve arkadaşlarını gösterir. Bir dokunuş daha, geri gelir.",
		"Un pase de práctica. Después, 1 gol en 3 pases al área.": "Bir deneme pası. Sonra ceza sahasına 3 pasta 1 gol.",
		"El primero no puntúa. En los otros, cuantos menos intentos gastes, más estrellas.": "İlki sayılmaz. Diğerlerinde ne kadar az deneme harcarsan o kadar çok yıldız.",
		"Apunta a un compañero y suelta.": "Bir arkadaşına nişan al ve bırak.",
		"FUERA LO JUEGAS TU / DENTRO REMATA": "DIŞARIDA SEN / IÇERIDE O VURUR",
		"SE ACABO EL REGATE": "ÇALIM BITTI",
		"Ahora aprendes a TIRAR": "Şimdi ŞUT ÇEKMEYI öğreniyorsun",
		"LO TIENES": "TAMAMDIR",
		"NO SUPERASTE LA PRUEBA": "ANTRENMAN GEÇILMEDI",
		"OTRA VEZ": "BIR DAHA",
		"Aquí no se avanza hasta que te sale. Tómate el tiempo que necesites.": "Burada başarana kadar ilerlemek yok. İstediğin kadar zaman al.",
		"Eso es la escuela: cada ejercicio te enseña un gesto y te paga en estrellas. Quedan unos pocos, y sacan mejores ofertas de club.": "Okul budur: her antrenman sana bir hareket öğretir ve yıldızla öder. Birkaç tane kaldı ve daha iyi kulüp teklifleri getirir.",
		"PARA EN SECO Y APUNTA": "DUR VE NIŞAN AL",
		"BUSCA LA OTRA BANDA": "UZAK KANADI BUL",
		"Todo se decide en tu círculo: con el dedo DENTRO apuntas y tiras, y en cuanto lo sacas conduces. Es el mismo arrastre sin levantar el dedo: mira la palabra del círculo, que dice TIRO o REGATE según dónde estés. Volver a entrar te para en seco y te devuelve la puntería. Jala hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltar, toca el balón — y dónde lo tocas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro. Con dos dedos giras la vista y apuntas desde otro ángulo.":
			"Her şey çemberinde olur: parmak IÇERIDEYKEN nişan alıp şut çekersin, dışarı çıkardığın an top sürersin. Parmağını kaldırmadan aynı sürükleme: çemberdeki kelimeye bak, nerede olduğuna göre ŞUT ya da ÇALIM yazar. Yeniden içeri girmek seni anında durdurur ve nişanını geri verir. Sapan gibi geri çek: kılavuz ileriyi gösterir. Bırakınca topa dokun — dokunduğun yer belirler. İlk seferde top bölgelere boyanır: üstü yerden ve yavaş gider, altı yükselip düşer, yanları falso verir. Kenara ne kadar yakınsan güç o kadar az: füze ortadan çıkar. İki parmakla görüşü döndürüp başka açıdan nişan alırsın.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "Bunlar ORTALAR: top ceza sahasına havadan gönderilir. Kornerde zaten ORTA ile başlar; sağ üstteki gösterge bunu söyler. ORTA (havadan) ile ŞUT (yerden) arasında geçmek için nişan alırken başka bir parmakla dokun ya da o göstergeye dokun. Kaleyi değil, bir arkadaşının kafasını ara. Kapanışta da kanat değiştirme: aynı servis ama öbür uçtaki boştaki arkadaşı arayarak.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve el cambio de banda.": "6 denemede 1 gol at: 3 korner ve 3 orta. Ve kanat değiştirme servisini yap.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. El cambio de banda es ensayo y no puntúa.": "Gol altısının herhangi birinde gelebilir. Ne kadar erken, o kadar çok yıldız. Kanat değiştirme denemedir ve sayılmaz.",
		"METE DOS GOLES": "IKI GOL AT",
		"CRUZA Y ENCARA": "GEÇ VE UZERINE GIT",
		"CUELGALA AL AREA": "ORTA YAP",
		"SALVA LA BARRERA": "BARAJI AŞ",
		"REGATEA HASTA EL MEDIO CAMPO": "ORTA ÇIZGIYE KADAR ÇALIM AT",


		"Salir de atrás": "Geriden çıkış",
		"Encerrado en tu banda": "Taç çizgisinde sıkıştın",
		"Atrapado en el medio": "Orta sahada kapana kısıldın",
		"Contra el bloque": "Bloka karşı",
		"Te salta el delantero": "Forvet üstüne geliyor",
		"Desde tu área": "Kendi ceza sahandan",
		"ZONA {0} DE {1}": "BOLGE {0}/{1}",
		"Busca al compañero de la otra banda · dentro del círculo pasas":
			"Öbür kanattaki arkadaşını bul · çemberin içinde pas verirsin",
		"El video salió con un tamaño raro": "Video tuhaf bir boyutta çıktı",
		"Tu gol más lejano del año: {0} m.": "Yılın en uzak golün: {0} m.",
		"Tu pase más largo del año: {0} m.": "Yılın en uzun pasın: {0} m.",
		"BUSCAR CLUB O JUGADOR": "KULUP/OYUNCU ARA",
		"Escribe al menos dos letras para buscar.": "Aramak için en az iki harf yaz.",
		"Nada encaja con esa búsqueda.": "Bu aramayla eşleşen bir şey yok.",
		"{0} · {1} DE {2} — AFINA LA BUSQUEDA": "{0} · {1}/{2} — ARAMAYI DARALT",
		"PAIS": "ULKE",
		"SI": "EVET",
		"PIDE ALIENTO": "COŞTUR",
		"A LO TUYO": "ODAKLAN",
		"RUGE {0} % · PITA {1} %": "COŞKU %{0} · YUHA %{1}",
		"LA GRADA RUGE": "TRIBUN COŞTU",
		"PIDES ALIENTO Y LA GRADA RUGE": "DESTEK ISTEDIN: TRIBUN COSTU",
		"PIDES ALIENTO Y LA GRADA TE PITA": "DESTEK ISTEDIN: YUHALADILAR",
		"¡{0}, {0}!": "{0}! {0}!",
		"¡{0}, TRAIDOR!": "{0}, HAIN!",
		"La entrada": "Kayarak Müdahale",
		"Toca cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "İşaret beyazdan geçerken dokun: kayarak müdahale eder ve topu temiz alırsın. Kırmızıda faul yaparsın; sarıda kart görürsün.",
		"Toca en el blanco para barrerte": "Kaymak için beyazda dokun",
		"¡BALÓN LIMPIO!": "TEMIZ MUDAHALE!",
		"¡AMARILLA!": "SARI KART!",
		"¡SE TE VA!": "KAÇTI!",
		"La barrera tapa el camino raso: elévalo por encima pegándole al balón abajo. El costado lo curva, si te atreves. Y el examen final: el penal. Respira. Tú eliges la esquina.": "Baraj yerden yolu kapatıyor: topa alttan vurup üstünden aşırt. Yandan vurursan falso alır, cesaretin varsa. Ve final sınavı: penaltı. Nefes al. Köşeyi sen seçersin.",
		"WASD CONDUCE / FLECHAS TIRAN": "WASD SURER / OKLAR ŞUT ÇEKER",
		"Pulsa WASD y corres hacia el disco.": "WASD'ye bas, diske koşarsın.",
		"Pulsa WASD y conduces.": "WASD'ye bas, top sürersin.",
		"Mantén una flecha y apuntas.": "Bir ok tuşunu basılı tut, nişan alırsın.",
		"Pulsa WASD y conduces: cruza la raya.": "WASD'ye bas, top sürersin: çizgiyi geç.",
		"Pulsa WASD y avanza hacia el arco.": "WASD'ye bas, kaleye ilerle.",
		"Mantén una flecha y pásala a un compañero.": "Bir ok tuşunu basılı tut, takım arkadaşına pas ver.",
		"Mantén una flecha y suelta para pegarle a la falta.": "Serbest vuruşu kullanmak için bir ok tuşunu basılı tut ve bırak.",
		"Pulsa WASD para empezar": "Başlamak için WASD'ye bas",
		"WASD para correr · cruza al campo rival": "Koşmak için WASD · rakip yarı sahaya geç",
		"WASD para correr · lleva el balón a la zona roja": "Koşmak için WASD · topu kırmızı bölgeye götür",
		"Pulsa {0} en el blanco para barrerte": "Kaymak için beyazda {0} tuşuna bas",
		"PULSA WASD PARA SALIR": "WASD ILE ÇIK",
		"Pulsa {0} cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "İşaret beyazdan geçerken {0} tuşuna bas: kayarak müdahale edip topu temiz alırsın. Kırmızıda faul olur; sarıda kart görürsün.",
		"VOLVIO, Y SE FUE POR LA PUERTA DE ATRAS": "DONDU, VE ARKA KAPIDAN GITTI",
		"LA VUELTA": "DONUŞ",
		"Bota de Oro de Europa": "Avrupa Gol Kralı",
		"BOTA DE ORO DE EUROPA": "AVRUPA GOL KRALI",
		"Máximo Asistente del Mundial": "Dünya Şampiyonası Asist Kralı",
		"Máximo Asistente de la Copa continental": "Kıta Kupası Asist Kralı",
		"Asist. (Mundial)": "Asist (Dünya)",
		"Asist. (Continental)": "Asist (Kıta)",
		"ASISTENTE DEL MUNDIAL": "DUNYA ŞAMP. ASIST KRALI",
		"Once Ideal de la Liga": "Ligin En İyi 11'i",
		"Once Ideal": "En İyi 11",
		"Bota de Oro (Europa)": "Gol Kralı (Avrupa)",
		"Prometiste un gol, y lo metiste.": "Gol sözü verdin ve attın.",
		"Prometiste un gol. Hoy no llegó.": "Gol sözü verdin. Bugün gelmedi.",
		"Cumpliste tu promesa de gol ante el {0}": "{0} karşısında gol sözünü tuttun",
		"Prometiste un gol ante el {0} y no llegó": "{0} karşısında gol sözü verdin ama gol gelmedi",
		"{0} cumplió su promesa de gol ante el {1}": "{0}, {1} karşısında gol sözünü tuttu",
		"{0} prometió un gol ante el {1} y no llegó": "{0}, {1} karşısında gol sözü verdi ama gol gelmedi",
		"DIBUJO DEL SHORT": "ŞORT DESENI",
		"Acento del short": "Şort vurgusu",
		"DIBUJO DE LAS MEDIAS": "ÇORAP DESENI",
		"Acento de las medias": "Çorap vurgusu",
		"Cuello polo": "Polo yaka",
		"Fin de manga": "Kol ucu",
		"FILO": "BIYE",
		"DOBLE FILO": "ÇIFT BIYE",
		"RIBETE": "PAÇA",
		"FILO Y RIBETE": "BIYE + PAÇA",
		"PANEL": "PANEL",
		"ABERTURA": "YIRTMAÇ",
		"VUELTA FINA": "INCE KONÇ",
		"DOBLE VUELTA": "ÇIFT KONÇ",
		"DOS RAYAS": "IKI ÇIZGI",
		"RAYA ALTA": "UST ÇIZGI",
		"BANDA ANCHA": "GENIŞ BANT",
		"AROS ANCHOS": "GENIŞ HALKA",
		"VUELTA DE COLOR": "RENKLI KONÇ",
		"FRANJA": "ŞERIT",
		"DOS FRANJAS": "IKI ŞERIT",
		"SHORT, MEDIAS Y CUELLO": "ŞORT, ÇORAP VE YAKA",
		"PICA CUANDO SE CIERRE": "KAPANINCA DOKUN",
		"¡CAÑO!": "TUNEL!",
		"SE LO OLIÓ": "OKUDU",
		"YA ESTÁ EN SU HUECO": "YERINDE",
		"EN TU VITRINA": "VITRININDE",
		"TODAVÍA SE HABLA DEL CAÑO DE {0} A {1}": "TUNEL HALA KONUŞULUYOR: {0} → {1}",
		"{1} YA NO SE LE ACERCA TANTO A {0} TRAS EL CAÑO": "{1} TUNELDEN SONRA {0}'A FAZLA YAKLAŞMIYOR",
		"LA GRADA PIDE OTRO CAÑO DE {0}": "TRIBUN BIR TUNEL DAHA ISTIYOR: {0}",
		"{1} LE LEYÓ EL CAÑO A {0} Y NO SE LO PERDONA": "{1} TUNELI SEZDI: {0} BUNU HAZMEDEMIYOR",
		"{0} QUISO EL CAÑO Y LA GRADA AÚN SILBA": "{0} TUNEL DENEDI, TRIBUN HALA ISLIKLIYOR",
		"PRESENTACIÓN DEL TÍTULO": "ŞAMPIYONLUK KUTLAMASI",
		"ANTE TU AFICIÓN": "TARAFTARININ ONUNDE",
		"JUEGOS DE VERANO": "YAZ OYUNLARI",
		"Campeón de Verano": "Yaz Şampiyonu",
		"Oro de Verano": "Yaz Altını",
		"Ganar el oro en los Juegos de Verano.": "Yaz Oyunları'nda altın madalya kazan.",
		"JUEGOS DE VERANO: oro para {0}": "YAZ OYUNLARI: altın {0} için",
		"{0}: ORO en los Juegos de Verano": "{0}: Yaz Oyunları'nda ALTIN",
		"{0}: plata en los Juegos de Verano": "{0}: Yaz Oyunları'nda gümüş",
		"{0}: bronce en los Juegos de Verano": "{0}: Yaz Oyunları'nda bronz",
		"El juego no trae nombres, escudos ni marcas reales. Importa sólo lo que tengas derecho a usar: es responsabilidad tuya.": "Oyunda gerçek isim, arma veya marka yoktur. Yalnızca kullanma hakkın olanı içe aktar: sorumluluk sana aittir.",
		"¡El recogepelotas hace tiempo!": "Top toplayıcı vakit geçiriyor!",
		"¡BALÓN LARGO!": "UZUN TOP!",
		"¡{0} TE LA CUELGA!": "{0} UZUN VURDU!",
		"¡CONTROLADA!": "KONTROL!",
		"Primas por premios": "Ödül primleri",
		"Prima de firma": "İmza primi",
		"+${0} DE PRIMA": "+${0} PRIM",
		"SI EL CLUB CUMPLE": "KULUP BAŞARIRSA",
		"GUARDANDO EN TU ALBUM...": "ALBUME KAYDEDILIYOR...",
		"EN TU ALBUM · %d/%d": "ALBUMDE · %d/%d",
		"ALBUM LLENO %d/%d · BORRA UNO EN COLECCION": "ALBUM DOLU %d/%d · KOLEKSIYONDAN BIR SIL",
		"SIN ESPACIO EN EL TELEFONO": "TELEFON DOLU",
		"NO SE PUDO GUARDAR · TOCA PARA REINTENTAR": "KAYDEDILEMEDI · DOKUN VE DENE",
		"¡Se queda corto!": "Kısa kaldı!",
		"Cosechas del huerto": "Bahçe hasadı",
		"PLANTILLAS DE COMUNIDAD": "TOPLULUK KADROLARI",
		"Packs que hace la gente. Cada uno vive en la web de quien lo hizo.": "Oyuncuların hazırladığı paketler. Her biri yapanın kendi sitesinde durur.",
		"BUSCAR PACK O CREADOR": "PAKET/YAPIMCI ARA",
		"BÁJALO": "INDIR",
		"en su web": "kendi sitesinde",
		"TÓCALO": "DOKUN",
		"en Descargas": "İndirilenler'de",
		"IMPORTA": "AKTAR",
		"se abre en el juego": "oyunda açılır",
		"CARGANDO": "YUKLENIR",
		"TODAVÍA NO HAY": "HENUZ YOK",
		"Cuando alguien comparta un pack, sale aquí.": "Biri bir paket paylaşınca burada görünür.",
		"Conéctate a internet para ver la lista.": "Listeyi görmek için internete bağlan.",
		"REINTENTAR": "YENIDEN",
		"¡ROMPISTE UNA CUERDA DE LA RED!": "AGIN BIR HALATINI KOPARDIN!",
		"¡LAS DOS CUERDAS DE LA RED!": "AGIN IKI HALATI DA!",
		"¡El staff arregla la red!": "Saha görevlileri ağı onarıyor!",
	},







	"sim": {




		"simFINAL DEL PARTIDO": "MAÇ SONU",
		"simDESCANSO": "DEVRE",
		"simGOOOL": "GOOOL",
		"simGOLAZO": "GOLAZO",
		"simGOLES": "GOL",
		"simGOL": "GOL",
		"simASISTENCIA": "ASIST",
		"simASISTE": "ASIST",
		"simATAJADÓN": "MUHTEŞEM",
		"simPARADA": "TUTTU",
		"simPOSTE": "DIREK",
		"simTRAVESAÑO": "UST DIREK",
		"simCABECEA": "KAFA",
		"simREMATA": "VURDU",
		"simREMATE": "ŞUT",
		"simDISPARO": "ŞUT",
		"simCÓRNER": "KORNER",
		"simPENAL": "PENALTI",
		"simENTRA": "GIREN",
		"simCAMBIO": "DEGIŞ.",
		"simTIRO LIBRE": "S. VURUŞ",
		"simFUERA DE JUEGO": "OFSAYT",
		"simAMARILLA": "SARI",
		"simROJA": "KIRMIZI",
		"simEXPULSADO": "ATILDI",
		"simLESIÓN": "SAKAT",
		"simLESIONADO": "SAKAT",
		"simFALTA": "FAUL",
		"simPÉRDIDA": "KAYIP",
		"¡GOL DE {0}!": "GOL: {0}!",
		"ASISTE {0}": "ASIST: {0}",
		"DESCANSO": "DEVRE",
		"FINAL DEL PARTIDO": "MAÇ SONU",
		"TOQUE EN EL MEDIO CAMPO": "ORTA SAHADA PAS TRAFIGI",
		"TU EQUIPO CONTROLA EL BALÓN": "TAKIMIN TOPU ELDE TUTUYOR",
		"EL RIVAL PRESIONA ARRIBA": "RAKIP ONDE BASKI YAPIYOR",
		"FALTA EN MEDIA CANCHA": "ORTA SAHADA FAUL",
		"SAQUE DE BANDA": "TAÇ ATIŞI",
		"LA AFICIÓN ANIMA": "TARAFTAR DESTEK VERIYOR",
		"DUELO FÍSICO EN EL CENTRO": "ORTADA FIZIKSEL MUCADELE",
		"EL ÁRBITRO DEJA SEGUIR": "HAKEM AVANTAJ VERIYOR",
		"PASES EN CORTO, SIN PRISA": "KISA PASLAR, ACELE YOK",
		"CÓRNER SIN REMATE CLARO": "KORNERDEN SONUÇ ÇIKMADI",
		"FUERA DE JUEGO SEÑALADO": "OFSAYT VERILDI",
		"BALÓN LARGO SIN DUEÑO": "UZUN TOP, SAHIPSIZ KALDI",
		"TU DEFENSA CORTA EL AVANCE": "DEFANSIN ATAGI KESIYOR",
		"EL PORTERO ACHICA A TIEMPO": "KALECI AÇIYI ZAMANINDA DARALTIYOR",
		"CAMBIO DE ORIENTACIÓN AL OTRO COSTADO": "OYUN DIGER KANADA ÇEVRILDI",
		"PRESIÓN TRAS PÉRDIDA EN CAMPO RIVAL": "RAKIP SAHADA KARŞI PRES",
		"EL BALÓN NO QUIERE ENTRAR EN EL ÁREA": "TOP CEZA SAHASINA GIRMIYOR",
		"AMARILLA POR CORTAR EL CONTRA": "KONTRAYI KESTI, SARI KART",
		"LA GRADA PIDE MÁS RITMO": "TRIBUN TEMPO ISTIYOR",
		"SE JUEGA A UN SOLO ARCO": "OYUN TEK KALEYE DONDU",
		"PARADO EL JUEGO POR UN GOLPE": "DARBE YUZUNDEN OYUN DURDU",
		"BUEN RELEVO EN LA BANDA": "KANATTA IYI YARDIM",
		"CENTRO PASADO, NO HABÍA NADIE": "ORTA UZUN KALDI, KIMSE YOKTU",
		"EL MEDIOCAMPO SE PARTE EN DOS": "ORTA SAHA IKIYE BOLUNDU",
		"CÓRNER BOTADO EN CORTO": "KORNER KISA KULLANILDI",
		"FALTA AL BORDE DEL ÁREA, SE ARMA LA BARRERA": "CEZA SAHASI DIBINDE FAUL, BARAJ KURULUYOR",
		"EL ÁRBITRO MIDE LOS NUEVE METROS": "HAKEM DOKUZ METREYI OLÇUYOR",
		"SAQUE DE ESQUINA QUE DESPEJA EL PRIMER PALO": "KORNER ON DIREKTE UZAKLAŞTIRILDI",
		"TIRO LIBRE LEJANO QUE SE VA A LA GRADA": "UZAKTAN SERBEST VURUŞ TRIBUNE GITTI",
		"SAQUE DE PUERTA LARGO, A DISPUTAR": "UZUN KALE VURUŞU, TOP ORTADA",
		"SEGUNDA JUGADA DEL CÓRNER, RECHAZA LA ZAGA": "KORNERDE IKINCI TOP, DEFANS UZAKLAŞTIRDI",
		"SAQUE DE BANDA LARGO AL ÁREA": "CEZA SAHASINA UZUN TAÇ",
		"ROBO EN TRES CUARTOS Y VUELTA A EMPEZAR": "ILERIDE TOP KAPILDI, BAŞA DONULDU",
		"DOS HOMBRES AL BALÓN, NO LO DEJAN SALIR": "TOPA IKI KIŞI, ÇIKIŞ YOK",
		"LA ZAGA SE JUNTA Y CIERRA EL PASILLO": "DEFANS HATTI DARALIP YOLU KAPATIYOR",
		"DESPEJE LARGO PARA QUITARSE EL AGOBIO": "BASKIYI ATMAK IÇIN UZUN UZAKLAŞTIRMA",
		"RUEDA EL BALÓN DE LADO A LADO": "TOP SAGA SOLA DOLAŞIYOR",
		"PAREDES EN EL CENTRO DEL CAMPO": "ORTA SAHADA VER-KAÇ",
		"CONTRA A CAMPO ABIERTO QUE SE QUEDA EN NADA": "AÇIK ALANDA KONTRA, SONUÇ YOK",
		"TODOS CORREN, NADIE PIENSA": "HERKES KOŞUYOR, KIMSE DUŞUNMUYOR",
		"EL RITMO BAJA Y EL PARTIDO SE ADORMECE": "TEMPO DUŞTU, MAÇ UYUKLUYOR",
		"SE JUEGA CON EL FRENO DE MANO": "EL FRENI ÇEKILI OYNANIYOR",
		"PIDE EL CAMBIO UN JUGADOR TOCADO": "DARBE ALAN BIR OYUNCU DEGIŞIKLIK ISTIYOR",
		"PROTESTAS AL LINIER DESDE EL BANQUILLO": "YEDEK KULUBESINDEN YAN HAKEME ITIRAZ",
		"APLAUDE LA GRADA UNA JUGADA DE OFICIO": "TRIBUN USTA IŞI HAREKETI ALKIŞLIYOR",
		"EL BALÓN SE VA AL FONDO SIN DUEÑO": "TOP SAHIPSIZ ŞEKILDE AUTA ÇIKIYOR",
		"{0} REMATA FUERA POR POCO": "{0} KIL PAYI DIŞARI VURDU",
		"¡{0} LA TUVO, GRAN PARADA!": "{0} KAÇIRDI, DEV KURTARIŞ!",
		"{0} CABECEA ALTO": "{0} KAFA, DIŞARI",
		"DISPARO DE {0}, ¡ATAJADÓN!": "ŞUT {0}, MUHTEŞEM KURTARIŞ!",
		"{0} ESTRELLA EL POSTE": "{0} DIREGE ÇARPTIRDI",
		"{0} REMATA DESVIADO": "{0} AUTA VURDU",


		"{0} DISPARA Y LO TAPA UN DEFENSA": "{0} VURDU, DEFANS BLOKLADI",
		"EL TIRO DE {0} TOCA EN UN DEFENSA Y SE VA A CÓRNER": "ŞUT {0}, DEFANSTAN SEKTI, KORNER",
		"TU DEFENSA SE TIRA Y TAPA EL DISPARO DE {0}": "DEFANSIN KAYARAK {0} ŞUTUNU BLOKLADI",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA, CÓRNER": "ŞUT {0}, DEFANSINDAN SEKTI, KORNER",
		"¡GOL DE {0}! TOCA EN UN DEFENSA Y SE CUELA": "GOL! {0} VURDU, DEFANSTAN SEKIP AGLARA GITTI",
		"¡{0} DISPARA, LA DESVÍA UN DEFENSA Y ADENTRO!": "{0} VURDU, DEFANSTAN SEKTI VE GOL!",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA Y ENTRA": "ŞUT {0}, DEFANSINDAN SEKIP AGLARA GITTI",
		"¡AUTOGOL DE {0}!": "K.K. GOL: {0}!",
		"{0} LA METE EN SU PROPIA PUERTA": "{0} TOPU KENDI AGLARINA ATTI",


		"¡{0} SE ELEVA Y LA CLAVA DE CABEZA!": "{0} YUKSELDI VE KAFAYLA ÇAKTI!",
		"¡CABEZAZO DE {0} AL FONDO DE LA RED!": "{0} KAFAYLA AGLARIN DIBINE!",
		"¡{0} GANA ARRIBA Y NO PERDONA!": "{0} HAVADA KAZANDI VE AFFETMEDI!",
		"¡{0} LA ENGANCHA DE VOLEA!": "{0} VOLEYE YAPIŞTI!",
		"¡{0} LA PRENDE AL AIRE Y ADENTRO!": "{0} HAVADA VURDU VE GOL!",
		"¡SIN DEJARLA CAER! GOL DE {0}": "YERE DEGMEDEN! GOL: {0}",
		"¡DE CHILENA! ¡{0}, INCREÍBLE!": "ROVAŞATA! {0}, INANILMAZ!",
		"¡CHILENA DE {0}! GOL PARA LA HISTORIA": "ROVAŞATA: {0}! TARIHI GOL",
		"¡{0} DE CHILENA! ¡SE CAE EL ESTADIO!": "{0} ROVAŞATAYLA! STAT YIKILIYOR!",
		"{0} CABECEA SOLO Y MARCA": "{0} BOŞTA KAFAYLA ATTI",
		"LA VOLEA DE {0} SE CUELA": "VOLE {0}, TOP AGLARDA",
		"{0} MARCA DE CHILENA. QUÉ CASTIGO": "{0} ROVAŞATAYLA ATTI. ACIMASIZ",
		"¡{0} CABECEA Y LA SACA EL PORTERO!": "{0} KAFAYLA VURDU, KALECI ÇIKARDI!",
		"LA VOLEA DE {0} SE VA POR ENCIMA": "VOLE {0}, TOP USTTEN AUTA",
		"{0} INTENTA LA CHILENA, ¡POR POCO!": "{0} ROVAŞATA DENEDI, KIL PAYI!",
		"CABEZAZO DE {0} AL POSTE": "{0} KAFAYLA DIREGE",
		"{0} LO PRUEBA DE VOLEA, DESVIADO": "{0} VOLE DENEDI, DIŞARI",
		"TU EQUIPO REMATA FUERA": "TAKIMIN DIŞARI VURDU",
		"¡CASI GOL DE TU EQUIPO!": "TAKIMIN GOLE ÇOK YAKLAŞTI!",
		"GRAN PARADA DEL PORTERO": "KALECIDEN MUHTEŞEM KURTARIŞ",
		"DISPARO DEL RIVAL, ¡ATAJADÓN!": "RAKIP ŞUT ÇEKTI, MUHTEŞEM KURTARIŞ!",
		"EL RIVAL ESTRELLA EL POSTE": "RAKIP DIREGI BULDU",
		"EL RIVAL REMATA FUERA": "RAKIP DIŞARI VURDU",
		"CÓRNER PARA TU EQUIPO, LO CUELGA {0}": "TAKIMINA KORNER, ORTA: {0}",
		"FALTA PELIGROSA Y {0} SE PLANTA SOBRE EL BALÓN":
			"TEHLIKELI FAUL, TOPUN BAŞINDA {0}",
		"{0} SACA EL CÓRNER AL SEGUNDO PALO Y DESPEJA LA ZAGA":
			"{0} KORNERI ARKA DIREGE ATTI, DEFANS UZAKLAŞTIRDI",
		"TIRO LIBRE DE {0}: LA BARRERA LA MANDA AL CÓRNER":
			"SERBEST VURUŞ {0}: BARAJDAN KORNERE",
		"{0} LA COLGÓ AL ÁREA Y EL PORTERO LA ATRAPÓ EN EL AIRE":
			"{0} CEZA SAHASINA ORTALADI, KALECI HAVADA TUTTU",
		"SAQUE DE BANDA LARGO DE {0} BUSCANDO EL SEGUNDO PALO":
			"UZUN TAÇ {0}, ARKA DIREK ARANIYOR",
		"FALTA LATERAL: {0} PONE EL CENTRO Y SE ARMA EL LÍO":
			"KANATTAN FAUL: {0} ORTALADI, ORTALIK KARIŞTI",
		"CÓRNER EN CORTO ENTRE {0} Y SU COMPAÑERO":
			"KORNER KISA: {0} VE TAKIM ARKADAŞI",
		"{0} ENSAYA UNA FALTA LEJANA Y SE VA ALTA":
			"{0} UZAKTAN FAULU DENEDI, TOP USTTEN AUTA",
		"OTRO CÓRNER: {0} VUELVE A COLGARLA AL ÁREA": "YINE KORNER: {0} TEKRAR ORTALADI",
		"CÓRNER PARA EL RIVAL, LO SACA {0}": "RAKIBE KORNER, KULLANAN: {0}",
		"FALTA AL BORDE DEL ÁREA, LA PONE {0}": "CEZA SAHASI DIBINDE FAUL, ATAN: {0}",
		"{0} CUELGA EL CÓRNER Y TU DEFENSA DESPEJA DE CABEZA":
			"{0} KORNERI ORTALADI, DEFANSIN KAFAYLA UZAKLAŞTIRDI",
		"TIRO LIBRE DE {0} QUE SE ESTRELLA EN LA BARRERA":
			"SERBEST VURUŞ {0}, BARAJA ÇARPTI",
		"{0} LA MANDA AL ÁREA Y TU PORTERO SALE A PUÑOS":
			"{0} CEZA SAHASINA ATTI, KALECIN YUMRUKLA ÇELDI",
		"SAQUE DE BANDA LARGO DE {0}, SIN CONSECUENCIAS":
			"UZUN TAÇ {0}, SONUÇ YOK",
		"FALTA EN TRES CUARTOS: {0} ESPERA A QUE SUBAN LOS CENTRALES":
			"ILERIDE FAUL: {0} STOPERLERIN ÇIKMASINI BEKLIYOR",
		"{0} BOTA EL CÓRNER EN CORTO Y TU EQUIPO ACHICA":
			"{0} KORNERI KISA KULLANDI, TAKIMIN ÇIKIYOR",
		"FALTA LEJANA DE {0} POR ENCIMA DEL TRAVESAÑO":
			"UZAKTAN SERBEST VURUŞ {0}, UST DIREK USTUNDEN",
		"OTRO CÓRNER RIVAL: {0} LO CUELGA AL PRIMER PALO":
			"RAKIBE YINE KORNER: {0} ON DIREGE ORTALADI",
		"CÓRNER PARA TU EQUIPO, DESPEJA LA ZAGA": "TAKIMINA KORNER, DEFANS UZAKLAŞTIRDI",
		"FALTA PELIGROSA A FAVOR, SE ARMA LA BARRERA":
			"LEHINE TEHLIKELI FAUL, BARAJ KURULUYOR",
		"TIRO LIBRE DE TU EQUIPO QUE SE VA ALTO": "TAKIMININ SERBEST VURUŞU USTTEN AUTA",
		"CÓRNER PARA EL RIVAL, DESPEJA TU DEFENSA":
			"RAKIBE KORNER, DEFANSIN UZAKLAŞTIRDI",
		"FALTA PELIGROSA EN CONTRA, TU EQUIPO ARMA LA BARRERA":
			"ALEYHINE TEHLIKELI FAUL, TAKIMIN BARAJ KURUYOR",
		"TIRO LIBRE DEL RIVAL A LAS MANOS DEL PORTERO":
			"RAKIBIN SERBEST VURUŞU KALECININ KUCAGINDA",

		"AMARILLA PARA {0} POR UNA ENTRADA TARDÍA": "GEÇ GIRDI, SARI KART: {0}",
		"EL ÁRBITRO AMONESTA A {0} POR PROTESTAR": "HAKEM ITIRAZDAN SARI KART GOSTERDI: {0}",
		"AMARILLA A {0} POR FRENAR EL CONTRA CON FALTA":
			"KONTRAYI FAULLE KESTI, SARI KART: {0}",
		"AMARILLA PARA {0} POR UNA FALTA DURA": "SERT FAUL, SARI KART: {0}",
		"{0} VE LA AMARILLA POR PERDER TIEMPO": "ZAMAN GEÇIRDI, SARI KART: {0}",
		"AMARILLA A {0} POR DERRIBAR AL EXTREMO": "KANAT OYUNCUSUNU DUŞURDU, SARI KART: {0}",
		"AMARILLA PARA TU EQUIPO": "TAKIMINA SARI KART",
		"AMARILLA PARA EL RIVAL": "RAKIBE SARI KART",
		"AMARILLA PARA {0}": "SARI KART: {0}",
		"SEGUNDA AMARILLA PARA {0}": "IKINCI SARI KART: {0}",
		"¡ROJA! {0} SE VA EXPULSADO": "KIRMIZI! {0} ATILDI",
		"EL ÁRBITRO PERDONA A {0}": "HAKEM {0} IÇIN GOZ YUMDU",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA A TU EQUIPO CON DIEZ":
			"IKINCI SARIDAN KIRMIZI! {0} GITTI, TAKIMIN 10 KIŞI",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA AL RIVAL CON DIEZ":
			"IKINCI SARIDAN KIRMIZI! {0} GITTI, RAKIP 10 KIŞI",
		"¡ROJA DIRECTA A {0}! TU EQUIPO SE QUEDA CON DIEZ":
			"DIREKT KIRMIZI: {0}! TAKIMIN 10 KIŞI KALDI",
		"¡ROJA DIRECTA A {0}! EL RIVAL SE QUEDA CON DIEZ":
			"DIREKT KIRMIZI: {0}! RAKIP 10 KIŞI KALDI",
		"ROJA DIRECTA POR EL BALONAZO AL ÁRBITRO":
			"HAKEME TOPLA VURDU, DIREKT KIRMIZI",
		"{0} SE MARCHA LESIONADO, NO PUEDE SEGUIR":
			"{0} SAKATLANDI, DEVAM EDEMIYOR",
		"LESIÓN EN EL RIVAL: {0} DEJA LA CANCHA": "RAKIPTE SAKATLIK: {0} SAHADAN ÇIKIYOR",
		"PARÓN POR LESIÓN, ENTRA LA CAMILLA": "SAKATLIK ARASI, SEDYE SAHADA",
		"BLOQUE BAJO Y SIN PRISA: EL PARTIDO SE JUEGA AL RALENTÍ":
			"ALÇAK BLOK, ACELE YOK: MAÇ AGIR ÇEKIMDE",
		"TU EQUIPO CEDE EL BALÓN Y ESPERA AGAZAPADO":
			"TAKIMIN TOPU BIRAKIP PUSUDA BEKLIYOR",
		"ONCE HOMBRES POR DETRÁS DE LA PELOTA, SIN GASTAR UNA GOTA":
			"TOPUN GERISINDE ON BIR KIŞI, HIÇ ENERJI HARCAMADAN",
		"SE JUEGA A LO QUE QUIERE {0}, PERO NO ENTRA NADIE":
			"OYUNU {0} YONETIYOR, AMA KIMSE GIREMIYOR",
		"CADA DESPEJE ES UN SEGUNDO MÁS QUE SE VA DEL RELOJ":
			"HER UZAKLAŞTIRMA SAATTEN BIR SANIYE DAHA GOTURUYOR",
		"EL BANQUILLO PIDE CALMA: NI UN PASO ADELANTE":
			"KULUBE SAKIN OLUN DIYOR: ILERI TEK ADIM YOK",
		"MURO Y PACIENCIA, EL PLAN ES QUE NO PASE NADA":
			"DUVAR VE SABIR, PLAN HIÇBIR ŞEY OLMAMASI",
		"TU EQUIPO ADMINISTRA PIERNAS Y METROS ATRÁS":
			"TAKIMIN GERIDE ENERJISINI IDARELI KULLANIYOR",
		"REPLIEGUE ORDENADO, SIN SALIR A LA PRESIÓN":
			"DUZENLI GERI ÇEKILME, PRESE ÇIKMADAN",
		"{0} TOCA Y TOCA CONTRA UN MURO QUE NO SE MUEVE":
			"{0} PAS USTUNE PAS, AMA DUVAR KIPIRDAMIYOR",
		"BLOQUE BAJO Y SALIDA RÁPIDA: TU EQUIPO ESPERA SU MOMENTO":
			"ALÇAK BLOK, HIZLI ÇIKIŞ: TAKIMIN ANINI BEKLIYOR",
		"REPLIEGUE Y CONTRA, ASÍ SE PLANTEÓ ESTE PARTIDO":
			"GERIDE BEKLE VE KONTRA, MAÇ PLANI BU",
		"TU EQUIPO CEDE EL CENTRO DEL CAMPO Y CIERRA EL ÁREA":
			"TAKIMIN ORTA SAHAYI BIRAKIP CEZA SAHASINI KAPATIYOR",
		"LÍNEAS JUNTAS, SIN UN HUECO ENTRE ELLAS": "HATLAR SIKI, ARALARINDA HIÇ BOŞLUK YOK",
		"SE DEFIENDE CON ORDEN Y SE SALE CON CRITERIO":
			"DUZENLE SAVUNUP AKILLA ÇIKIYORLAR",
		"{0} TIENE EL BALÓN; TU EQUIPO TIENE EL PLAN": "TOP {0} TAKIMINDA; PLAN SENIN TAKIMINDA",
		"CADA ROBO SE CONVIERTE EN UN BALÓN LARGO": "HER TOP KAPMA UZUN TOPA DONUŞUYOR",
		"LA ZAGA MANDA: NADA PASA POR EL MEDIO":
			"DEFANS HATTI HAKIM: ORTADAN HIÇBIR ŞEY GEÇMIYOR",
		"TU EQUIPO JUEGA AL ERROR DEL RIVAL": "TAKIMIN RAKIBIN HATASINI BEKLIYOR",
		"DEFENSA EN BLOQUE, SIN REGALAR LA ESPALDA":
			"BLOK HALINDE SAVUNMA, ARKAYA ALAN YOK",
		"REPLIEGUE FEROZ: SE DEFIENDE COMO SI FUERA EL ÚLTIMO MINUTO":
			"VAHŞI GERI ÇEKILME: SON DAKIKAYMIŞ GIBI SAVUNUYORLAR",
		"BLOQUE BAJO PERO A MIL POR HORA, NO SE RESPIRA NI ATRÁS":
			"ALÇAK BLOK AMA TAM GAZ, GERIDE BILE NEFES YOK",
		"TU EQUIPO SE PARTE EL ALMA EN CADA DESPEJE":
			"TAKIMIN HER UZAKLAŞTIRMADA CANINI VERIYOR",
		"SE DEFIENDE Y SE SALE AL CONTRAGOLPE COMO UN LATIGAZO":
			"SAVUNUP KIRBAÇ GIBI KONTRAYA ÇIKIYORLAR",
		"TRABAJO SUCIO A TODA VELOCIDAD: DOS HOMBRES A CADA BALÓN":
			"TAM HIZDA PIS IŞ: HER TOPA IKI KIŞI",
		"CIERRAN ATRÁS Y ARRANCAN AL ESPACIO EN CUANTO ROBAN":
			"GERIYI KAPATIP TOPU KAPINCA BOŞLUGA FIRLIYORLAR",
		"ENTREGA TOTAL EN EL REPLIEGUE, Y ESTO SE PAGA EN PIERNAS":
			"GERI ÇEKILMEDE TAM ADANMIŞLIK, BEDELINI BACAKLAR ODER",
		"{0} SE ESTRELLA CONTRA UNA MURALLA QUE ADEMÁS CORRE":
			"{0} KOŞAN BIR DUVARA ÇARPIYOR",
		"NI UN METRO GRATIS: PERSIGUEN AL RIVAL HASTA EL CÓRNER":
			"BEDAVA METRE YOK: RAKIBI KORNER BAYRAGINA KOVALIYORLAR",
		"DEFENDER ASÍ QUEMA, PERO EL ARCO SIGUE EN PIE":
			"BOYLE SAVUNMAK YAKAR, AMA KALE HALA AYAKTA",
		"PARTIDO DE TRÁMITE: TU EQUIPO NO ARRIESGA NI UN PASE":
			"RUTIN BIR MAÇ: TAKIMIN TEK PASTA BILE RISK ALMIYOR",
		"RITMO BAJO Y POSICIONES FIJAS, NADIE SE DESCUELGA":
			"DUŞUK TEMPO, SABIT MEVKILER, KIMSE BOZMUYOR",
		"SE TOCA EN HORIZONTAL, SIN ROMPER LÍNEAS": "YATAY PASLAR, HIÇ HAT KIRILMIYOR",
		"EL PARTIDO SE DUERME Y A TU EQUIPO NO LE MOLESTA":
			"MAÇ UYUKLUYOR VE TAKIMIN HIÇ ŞIKAYETÇI DEGIL",
		"PLAN SOBRIO: NI ATRÁS NI ARRIBA, DEJAR CORRER EL RELOJ":
			"SADE PLAN: NE GERI NE ILERI, SAATI ERIT",
		"TU EQUIPO DOSIFICA, GUARDANDO PIERNAS PARA EL FINAL":
			"TAKIMIN IDARELI OYNUYOR, BACAKLARI SONA SAKLIYOR",
		"PASES DE SEGURIDAD Y MIRADAS AL BANQUILLO": "GARANTI PASLAR VE KULUBEYE BAKIŞLAR",
		"SIN PRESIÓN Y SIN PRISA, EL PARTIDO ESTÁ EN PAUSA":
			"PRES YOK, ACELE YOK, MAÇ DURAKLATILMIŞ GIBI",
		"EQUILIBRIO Y CALMA, NADIE QUIERE ROMPER LA MESA":
			"DENGE, SAKINLIK, KIMSE MASAYI DEVIRMEK ISTEMEZ",
		"SE JUEGA A MEDIO GAS, ESPERANDO UNA GRIETA":
			"YARIM GAZ OYNANIYOR, BIR ÇATLAK BEKLENIYOR",
		"PARTIDO PAREJO: TU EQUIPO SOSTIENE EL EQUILIBRIO":
			"DENGELI MAÇ: TAKIMIN DENGEYI KORUYOR",
		"NI REPLIEGUE NI LOCURA, EL PLAN ES EL ORDEN":
			"NE GERI ÇEKILME NE ÇILGINLIK, PLAN DUZEN",
		"SE JUEGA DE IGUAL A IGUAL EN EL MEDIO CAMPO": "ORTA SAHADA DIŞ DIŞE MUCADELE",
		"TU EQUIPO ALTERNA TOQUE Y VERTICALIDAD": "TAKIMIN SABIRLA DIKINE OYUNU HARMANLIYOR",
		"BLOQUE MEDIO Y PRESIÓN SÓLO CUANDO TOCA": "ORTA BLOK, PRES YALNIZCA GEREKINCE",
		"PLAN CLÁSICO: SUJETAR ATRÁS, PROBAR ARRIBA":
			"KLASIK PLAN: GERIDE TUT, ILERIDE YOKLA",
		"EL PARTIDO SE JUEGA DONDE TU EQUIPO QUIERE, EN EL MEDIO":
			"MAÇ TAKIMININ ISTEDIGI YERDE, ORTADA OYNANIYOR",
		"SIN DESAJUSTES, CADA UNO EN SU SITIO": "HIÇBIR YERDE AÇIK YOK, HERKES YERINDE",
		"SE ESPERA EL MOMENTO SIN REGALAR NADA":
			"HIÇBIR ŞEY VERMEDEN AN BEKLENIYOR",
		"{0} NO ENCUENTRA GRIETAS EN UN EQUIPO BIEN PLANTADO":
			"{0} IYI YERLEŞMIŞ BIR TAKIMDA ÇATLAK BULAMIYOR",
		"MISMO PLAN, OTRO PULSO: TU EQUIPO CORRE EL DOBLE":
			"AYNI PLAN, BAŞKA NABIZ: TAKIMIN IKI KAT KOŞUYOR",
		"IDA Y VUELTA A TODO TREN, ESTO ES UN PARTIDO ROTO":
			"TAM GAZ KARŞILIKLI ATAKLAR, BU MAÇ AÇIK",
		"PRESIÓN EN CUANTO SE PIERDE, ORDEN EN CUANTO SE TIENE":
			"TOP GIDINCE PRES, GELINCE DUZEN",
		"RITMO ALTO SIN PERDER LA FORMA": "YUKSEK TEMPO, DUZEN BOZULMADAN",
		"SE DISPUTA CADA SEGUNDA PELOTA COMO SI FUERA LA ÚLTIMA":
			"HER SEKEN TOP SONUNCUYMUS GIBI KOVALANIYOR",
		"TU EQUIPO ACELERA CADA VEZ QUE PISA CAMPO CONTRARIO":
			"TAKIMIN RAKIP SAHAYA HER GEÇISTE HIZLANIYOR",
		"EL PARTIDO VUELA DE ÁREA A ÁREA": "MAÇ KALEDEN KALEYE AKIYOR",
		"INTENSIDAD ARRIBA: {0} NO ENCUENTRA UN SEGUNDO DE PAZ":
			"TEMPO YUKSEK: {0} BIR AN BILE RAHAT EDEMIYOR",
		"EQUILIBRIO CON EL ACELERADOR PISADO": "DENGE VAR AMA GAZ SONUNA KADAR",
		"SE CORRE MUCHO Y SE PIENSA RÁPIDO": "BOL KOSU VE HIZLI DUSUNCE",
		"TODOS ARRIBA, PERO SIN QUEMARSE: SE BUSCA CON CABEZA":
			"HERKES ILERIDE AMA TUKENMEDEN: AKILLA OYNANIYOR",
		"ATAQUE PACIENTE: SE RODEA EL ÁREA ESPERANDO EL HUECO":
			"SABIRLI HUCUM: CEZA SAHASI ÇEVRESINDE BOSLUK BEKLENIYOR",
		"TU EQUIPO ADELANTA LÍNEAS Y ADMINISTRA EL ESFUERZO":
			"TAKIMIN HATLARI ILERI ATIYOR, GUCUNU IDARE EDIYOR",
		"MUCHA GENTE ARRIBA Y NINGUNA PRISA POR LLEGAR":
			"ILERIDE ÇOK OYUNCU VAR AMA HIÇ ACELE YOK",
		"SE ATACA AL PASO, CON EL BALÓN COMO ÚNICO ARGUMENTO":
			"YURUR ADIMLA HUCUM, TEK ARGUMAN TOP",
		"PROPUESTA OFENSIVA SIN DESGASTE: TOQUE Y ESPERA":
			"YORULMADAN HUCUM PLANI: PAS VE BEKLE",
		"LOS LATERALES SUBEN, PERO NADIE CORRE DE MÁS":
			"BEKLER ÇIKIYOR AMA KIMSE FAZLA KOSMUYOR",
		"TU EQUIPO ACAMPA EN CAMPO DE {0} SIN APRETAR EL PASO":
			"TAKIMIN {0} YARI SAHASINA YERLESTI, ACELESIZ",
		"AMBICIÓN CON LAS PIERNAS GUARDADAS PARA EL FINAL":
			"HIRS VAR, BACAKLAR SONA SAKLANIYOR",
		"SE INSISTE ARRIBA, AUNQUE SIN PRESIÓN TRAS PÉRDIDA":
			"ILERIDE ISRAR VAR AMA KAYIPTAN SONRA PRES YOK",
		"PLANTEAMIENTO OFENSIVO: TODOS ARRIBA SOBRE {0}":
			"HUCUM PLANI: HERKES {0} UZERINE",
		"TU EQUIPO ADELANTA LA LÍNEA Y BUSCA EL ÁREA RIVAL":
			"TAKIMIN HATTI ILERI ATIYOR, RAKIP KALEYI ARIYOR",
		"LOS LATERALES VIVEN EN CAMPO CONTRARIO":
			"BEKLER RAKIP YARI SAHADA YASIYOR",
		"SE ATACA CON GENTE: CINCO HOMBRES POR DELANTE DEL BALÓN":
			"KALABALIK HUCUM: TOPUN ONUNDE BEŞ OYUNCU",
		"TU EQUIPO EMPUJA Y EL RIVAL ACUMULA GENTE ATRÁS":
			"TAKIMIN BASKI YAPIYOR, RAKIP GERIYE YIGILIYOR",
		"CENTRO TRAS CENTRO, EL PLAN ES AHOGAR EL ÁREA":
			"ORTA USTUNE ORTA, PLAN CEZA SAHASINI BOGMAK",
		"PROPUESTA VALIENTE, AUNQUE DEJE ESPACIOS A LA ESPALDA":
			"CESUR PLAN, ARKADA BOSLUK BIRAKSA DA",
		"TU EQUIPO JUEGA EN CAMPO DE {0} Y NO PIENSA SALIR":
			"TAKIMIN {0} SAHASINDA OYNUYOR, ÇIKMAYA NIYETI YOK",
		"SE ARRIESGA EN CADA SALIDA BUSCANDO AL DELANTERO":
			"HER ÇIKISTA FORVETE RISKLI TOP ATILIYOR",
		"EL BLOQUE ESTÁ ALTO Y LA ZAGA, MUY SOLA":
			"BLOK YUKSEKTE, DEFANS ÇOK YALNIZ",
		"ASEDIO TOTAL: TODOS ARRIBA Y A MÁXIMO PULSO": "TAM KUSATMA: HERKES ILERIDE, SONUNA KADAR",
		"PRESIÓN ASFIXIANTE SOBRE {0}, NO LES DEJAN NI SACAR":
			"{0} UZERINDE BOGUCU PRES, TOPU ÇIKARAMIYORLAR",
		"TU EQUIPO SE VOLCÓ Y NO HAY QUIEN LO FRENE":
			"TAKIMIN HER SEYIYLE ILERI ATILDI, DURDURAN YOK",
		"OLA TRAS OLA SOBRE EL ÁREA RIVAL": "RAKIP KALEYE DALGA DALGA HUCUM",
		"ROBO ARRIBA Y REMATE: ESTO ES UNA TORMENTA": "ILERIDE KAP VE VUR: BU BIR FIRTINA",
		"EL RIVAL NO PASA DE MEDIO CAMPO, Y ESO SE PAGA EN PIERNAS":
			"RAKIP ORTA SAHAYI GEÇEMIYOR, BEDELI BACAKLARA",
		"TODO EL EQUIPO METIDO EN VEINTE METROS DE CAMPO CONTRARIO":
			"TUM TAKIM RAKIP SAHANIN YIRMI METRESINE SIKIŞTI",
		"RITMO ALTÍSIMO, NO DEJAN RESPIRAR A {0}": "ÇOK YUKSEK TEMPO, {0} NEFES ALAMIYOR",
		"UN SOLO EQUIPO EN EL CAMPO, Y ES EL TUYO": "SAHADA TEK TAKIM VAR, O DA SENINKI",
		"ATAQUE SIN RED: ATRÁS SÓLO QUEDAN DOS":
			"FILESIZ HUCUM: ARKADA SADECE IKI KISI",
		"CON EL {0} ABAJO, TU EQUIPO VA AL FRENTE": "SKOR {0}: GERIDEKI TAKIMIN ILERI ÇIKIYOR",
		"ARRANCA EL PARTIDO, PRIMEROS TANTEOS ANTE {0}": "MAÇ BAŞLADI, {0} ILE ILK YOKLAMALAR",
		"CON EL {0} ABAJO, TU EQUIPO SE VUELCA AL FRENTE":
			"SKOR {0}: GERIDEKI TAKIMIN HER SEYIYLE ILERIDE",
		"FRÍOS: A TU EQUIPO NO LE SALE NADA": "BUZ GIBI: TAKIMININ HIÇBIR SEYI TUTMUYOR",
		"PIERNAS PESADAS: {0} ACUSA EL CANSANCIO": "AGIR BACAKLAR: {0} YORGUNLUGU HISSETTI",
		"{0} SE COLOCA EL BALÓN EN EL PUNTO": "{0} TOPU PENALTI NOKTASINA KOYUYOR",
		"LA PENA MÁXIMA LA COBRA {0}": "PENALTIYI {0} KULLANACAK",
		"SE PREPARA {0} SOBRE LA FALTA": "{0} SERBEST VURUSUN BASINDA",
		"SE HACE CARGO {0} DE LA FALTA": "SERBEST VURUSU {0} KULLANIYOR",
		"SACA EL CÓRNER {0}": "KORNERI {0} KULLANIYOR",
		"SAQUE DE ESQUINA, LLEGA EL CENTRO": "KORNER, ORTA GELIYOR",
		"{0} MINUTOS AÑADIDOS": "{0} DAKIKA UZATMA",
		"ESTO SE VA A LA PRÓRROGA": "MAÇ UZATMALARA GIDIYOR",
		"{0} LLEGA TARDE A TODO, SIN PIERNAS": "{0} HER SEYE GEÇ, BACAK KALMADI",
		"{0} PIDE EL CAMBIO CON LA MIRADA": "{0} BAKISLARIYLA ÇIKMAK ISTIYOR",
		"SE LE ACABA LA GASOLINA A {0}": "{0} TUKENMEK UZERE",
		"{0} ANDA ENCHUFADÍSIMO HOY": "{0} BUGUN TAM GAZ",
		"NO PARA DE CORRER, {0}": "{0} KOSMAYI BIRAKMIYOR",
		"{0} ESTÁ ADMINISTRANDO FUERZAS": "{0} GUCUNU IDARE EDIYOR",
		"{0} ANDA MUY FLOJO, LE FALTA CHISPA": "{0} ÇOK SONUK, KIVILCIM YOK",
		"{0} DEBERÍA PISAR MÁS EL ÁREA": "{0} CEZA SAHASINA DAHA ÇOK GIRSE",
		"A {0} LE FALTA AYUDAR ATRÁS": "{0} GERIDE DAHA ÇOK YARDIM ETMELI",
		"ASÍ NO LE LLEGA UN BALÓN A {0}": "BOYLE GIDERSE {0} TOP GORMEYECEK",
		"{0} SE ESTÁ ADUEÑANDO DEL PARTIDO": "{0} MAÇA HAKIM OLUYOR",
		"PARTIDAZO DE {0}": "{0} ŞOV YAPIYOR",
		"SE LE ESTÁ ATRAGANTANDO EL PARTIDO A {0}": "MAÇ {0} IÇIN ZORLASIYOR",
		"{0} NO APARECE": "{0} ORTADA YOK",
		"{0} LLEVA LA MANIJA DEL EQUIPO": "{0} TAKIMIN IPLERINI TUTUYOR",
		"{0} SE QUEDA SOLO ARRIBA, NADIE SUBE": "{0} ILERIDE YALNIZ, KIMSE ÇIKMIYOR",
		"TODO PASA POR {0}": "HER SEY {0} UZERINDEN",
		"{0} NO PARA DE APAGAR FUEGOS ATRÁS": "{0} GERIDE YANGIN SONDURMEYI BIRAKMIYOR",
		"{0} SE PASA EL PARTIDO CORRIENDO DETRÁS DEL BALÓN": "{0} MAÇ BOYU TOPUN PESINDE KOSUYOR",
		"{0} MANEJA LOS TIEMPOS DESDE EL MEDIO": "{0} ORTA SAHADAN TEMPOYU BELIRLIYOR",
		"TARDE TRANQUILA PARA {0} EN LA ZAGA": "DEFANSTA {0} IÇIN SAKIN BIR GUN",
		"LA GRADA CANTA TU NOMBRE, {0}": "TRIBUNLER ADINI HAYKIRIYOR, {0}",
		"{0} BAJA A ORDENAR EL JUEGO": "{0} OYUNU KURMAYA GERI GELIYOR",
		"{0} CALIENTA EN LA BANDA, PIDE ENTRAR":
			"{0} KENARDA ISINIYOR, GIRMEK ISTIYOR",

		"{0} MIRA EL PARTIDO DESDE EL BANQUILLO, CABIZBAJO":
			"{0} MAÇI KULUBEDEN BOYNU BUKUK IZLIYOR",
		"{0} SE SIENTA FUNDIDO, EL BANQUILLO LE DA HIELO":
			"{0} BITKIN OTURUYOR, KULUBEDEN BUZ GELIYOR",
		"UNA PALMADA PARA {0} AL LLEGAR AL BANQUILLO":
			"KULUBEYE DONEN {0} IÇIN SIRTA BIR DOKUNUS",
		"NADIE DEL BANQUILLO MIRA A {0}": "KIMSE {0} YUZUNE BAKMIYOR",
		"EN EL BANQUILLO SE COMENTA LA SALIDA DE {0}":
			"KULUBEDE {0} DEGIŞIKLIGI KONUŞULUYOR",
		"{0} SIGUE EL PARTIDO DESDE EL BANQUILLO": "{0} MAÇI KULUBEDEN IZLIYOR",
		"EQUIPO ENCENDIDO, HUELE A GOL ANTE {0}":
			"TAKIM ATEŞLI, {0} KARŞISINDA GOL KOKUSU VAR",
		"DUELO PAREJO, NADIE QUIERE EL ERROR": "DENGELI MAÇ, KIMSE HATA YAPMAK ISTEMIYOR",
		"TU EQUIPO MANEJA EL {0}": "SKOR KONTROLDE: {0}",
		"TU EQUIPO MANEJA EL {0} SIN PRISA": "TAKIMIN ACELESIZ YONETIYOR: {0}",
		"SE ACERCA EL DESCANSO CON EL {0}": "SKOR {0}, DEVRE ARASI YAKLASIYOR",
		"RECTA FINAL, URGE EL EMPATE: TODOS ARRIBA":
			"SON BOLUM, BERABERLIK ŞART: HERKES ILERI",
		"RECTA FINAL Y EL {0} SIGUE ABIERTO": "SON BOLUM VE {0} SKORU HALA BELIRSIZ",
		"RECTA FINAL: TU EQUIPO AGUANTA EL {0} CON EL ALMA":
			"SON BOLUM: TAKIMIN {0} SKORUNU CANLA KORUYOR",
	},

	"notifications": {
		"ESA CAMISETA TIENE DUEÑO": "O FORMANIN SAHIBI VAR",
		"El número que quieres cuelga dos perchas más allá, con el nombre de {0} encima. Cambiarlo se hace más de lo que parece.":
			"İstediğin numara iki askı ötede asılı, üstünde {0} adı var. Onu değiştirmek göründüğünden zor iş.",
		"COMPRÁRSELO": "PARAYLA AL",
		"PEDIRLO AL CLUB": "KULUBE SOR",
		"DEJARLO ESTAR": "BOŞ VER",
		"UN OJEADOR EN LA GRADA": "TRIBUNDE GOZLEMCI",
		"Un club grande mandó ojeador a verte y la prensa local se enteró. Todos quieren saber si sueñas con irte.":
			"Büyük bir kulüp seni izlemeye gözlemci yolladı ve yerel basın bunu duydu. Herkes gitmeyi hayal edip etmediğini merak ediyor.",
		"HABLAR DEL SUEÑO": "HAYALINI ANLAT",
		"QUITARLE HIERRO": "GEÇIŞTIR",
		"EL SEGUNDO TRABAJO": "IKINCI IŞ",
		"Un compañero reparte paquetes por las mañanas para llegar a fin de mes. Esta semana no puede y te pide cubrirle una tarde.":
			"Bir takım arkadaşın ay sonunu getirmek için sabahları kargo dağıtıyor. Bu hafta yapamıyor ve bir öğleden sonra yerine geçmeni istiyor.",
		"ECHARLE LA TARDE": "VARDIYASINI AL",
		"NO PUEDO": "YAPAMAM",
		"ESTE CAMPO ES UN PATATAL": "BU SAHA TARLA GIBI",
		"El césped es un parche de tierra y bote falso. Un periodista te pregunta, sonriendo, qué te parece tu nuevo estadio.":
			"Çim dediğin bir toprak yaması, top her yere sekiyor. Bir gazeteci sırıtarak yeni stadın hakkında ne düşündüğünü soruyor.",
		"DECIR LA VERDAD": "DOGRUYU SOYLE",
		"'AQUÍ SE JUEGA IGUAL'": "'FARK ETMEZ'",
		"CÁMARAS EN EL VESTUARIO": "SOYUNMA ODASINDA KAMERA",
		"Una plataforma quiere rodar tu documental: un mes de cámaras siguiéndote hasta dentro del vestuario. Pagan bien. El grupo no sonríe.":
			"Bir dijital platform belgeselini çekmek istiyor: bir ay boyunca kameralar seni soyunma odasına kadar takip edecek. İyi para veriyorlar. Takım hiç gülmüyor.",
		"FIRMAR EL RODAJE": "ANLAŞMAYI IMZALA",
		"PROTEGER EL GRUPO": "TAKIMI KORU",
		"TU CIFRA EN PORTADA": "FIYATIN MANŞETTE",
		"Un diario publica lo que pides por renovar, con cifra y todo. Es casi exacta. Confirmarla presiona al club; negarla te protege.":
			"Bir gazete, sözleşme yenilemek için istediğin rakamı yayımladı. Neredeyse tam isabet. Doğrulamak kulübü sıkıştırır; yalanlamak seni korur.",
		"CONFIRMARLA": "DOGRULA",
		"NEGARLO TODO": "HEPSI YALAN",
		"EL PENALTI QUE NO TIRASTE": "ATMADIGIN PENALTI",
		"El designado falló el penalti que costó el partido. Tú eras el segundo de la lista y la prensa lo sabe.":
			"Penaltıcı, maçı kaybettiren penaltıyı kaçırdı. Listede ikinci sendin ve basın bunu biliyor.",
		"RESPALDARLO": "ONU SAVUN",
		"'YO LO PEDÍ'": "'BEN DEDIM'",
		"TUS NÚMEROS EN LA PIZARRA": "RAKAMLARIN TAHTADA",
		"Un analista joven te espera con tu mala racha desmenuzada en la pizarra: mapas, flechas y todo lo que no estás haciendo.":
			"Genç bir analist, kötü gidişatını tahtada didik didik etmiş seni bekliyor: haritalar, oklar ve yapmadığın her şey.",
		"TRAGARTE EL ORGULLO": "GURURUNU YUT",
		"MANDARLO A PASEO": "YOLLA GITSIN",
		"El siguiente partido te da la razón.": "Sonraki maç seni haklı çıkarıyor.",
		"La racha sigue y el míster no olvida.": "Kötü gidişat sürüyor ve hoca unutmuyor.",
		"LA CÁMARA TE ENFOCÓ": "KAMERAYA YAKALANDIN",
		"Otro partido desde el banco, y la cámara te pilló con cara larga. En redes debaten si eres mal compañero.":
			"Yine kulübede bir maç ve kamera seni asık suratla yakaladı. Sosyal medyada kötü bir takım arkadaşı olup olmadığın tartışılıyor.",
		"'APOYO AL EQUIPO'": "'TAKIMA DESTEK'",
		"NO ACLARAR NADA": "KONUŞSUNLAR",
		"EL DISCURSO DEL NUEVO": "YENI ADAMIN KONUSMASI",
		"Primer día con el grupo entero sentado y el míster te cede la palabra. Cuarenta segundos y todo el vestuario midiéndote.":
			"Bütün takımın oturduğu ilk gün ve hoca sözü sana veriyor. Kırk saniye, bütün soyunma odası seni tartıyor.",
		"PROMETER TÍTULOS": "KUPA SOZU VER",
		"VENGO A APRENDER": "OGRENMEYE GELDIM",
		"SÓLO SALUDAR Y SENTARTE": "SELAM VER VE OTUR",
		"DÓNDE VAS A VIVIR": "EV SEÇIMI",
		"El club te pasa tres opciones: el ático del centro que sale en las revistas, una casa pegada a la ciudad deportiva, o seguir en el hotel y no gastar.":
			"Kulüp sana üç seçenek sunuyor: dergilere çıkan şehir merkezindeki çatı katı, antrenman tesisinin dibinde bir ev ya da otelde kalıp hiç para harcamamak.",
		"EL ÁTICO DEL CENTRO": "MERKEZDE ÇATI KATI",
		"PEGADO AL ENTRENAMIENTO": "TESISIN DIBINDE",
		"SEGUIR EN EL HOTEL": "OTELDE KAL",
		"EL PLANTE POR LOS MINUTOS": "DAKIKA ULTIMATOMU",
		"Otra jornada mirando desde el banco. Tu agente ya tiene el titular escrito y un periodista esperando; el míster te ha citado a solas antes de que salga.":
			"Yine yedek kulübesinden izlenen bir hafta. Menajerinin manşeti hazır, bir gazeteci bekliyor; hoca haber çıkmadan seni baş başa çağırdı.",
		"EXIGIRLO EN PÚBLICO": "HERKESE AÇIK ISTE",
		"TRAGAR Y CALLARTE": "SUS VE YUT",
		"EL MOTÍN": "ISYAN",
		"El vestuario ha decidido que el míster se tiene que ir y hay una carta con firmas dando vueltas. Falta la tuya, y el despacho está a diez metros por el otro pasillo.":
			"Soyunma odası hocanın gitmesi gerektiğine karar verdi ve imzalı bir mektup elden ele dolaşıyor. Bir tek seninki eksik; hocanın odası da öbür koridorda, on metre ötede.",
		"FIRMAR CON EL GRUPO": "TAKIMLA IMZALA",
		"AVISAR AL MÍSTER": "HOCAYI UYAR",
		"EL AÑO QUE TE QUEDA": "SON YILIN",
		"Tu agente tiene un periodista al teléfono y una frase preparada: que escuchas ofertas. Filtrarla te dobla el precio y te convierte, esta misma noche, en el que ya se fue.":
			"Menajerinin telefonda bir gazeteci ve hazır bir cümlesi var: teklifleri dinlediğin. Sızdırmak fiyatını ikiye katlar ve seni daha bu gece gitmiş adam yapar.",
		"DEJARLA CAER": "SIZDIR",
		"JURAR QUE TE QUEDAS": "KALACAGINA YEMIN ET",
		"LO QUE SABE EL CAPITÁN": "KAPTANIN BILDIGI",
		"Tres se saltaron la concentración y tú los viste salir. El club te pregunta a la cara, como capitán, y el vestuario entero espera en el pasillo a ver qué dices.":
			"Üç kişi kamp kuralını çiğneyip kaçtı, sen de çıktıklarını gördün. Kulüp sana kaptan olarak yüzüne soruyor; bütün soyunma odası koridorda ne diyeceğini bekliyor.",
		"DAR LOS NOMBRES": "ISIMLERI VER",
		"TAPARLOS": "ORT BAS",
		"LA OFERTA QUE NO SE RECHAZA": "REDDEDILEMEZ TEKLIF",
		"Una casa de apuestas pone medio año de sueldo por tu cara en su cartel. La grada odia esa marca —hay pancartas cada domingo— y el club firmó contra ella.":
			"Bir bahis şirketi, yüzün afişlerinde yer alsın diye yarım yıllık maaşını teklif ediyor. Tribünler o markadan nefret ediyor —her pazar pankart açılıyor— ve kulüp ona karşı taahhüt imzaladı.",
		"COBRAR Y FIRMAR": "PARAYI AL",
		"DECIR QUE NO": "HAYIR DE",
		"EL VESTUARIO YA LO SABE": "SOYUNMA ODASI BILIYOR",
		"Pediste salir y la noticia llegó antes que tú al vestuario. Nadie te dice nada, que es peor. El capitán te espera apoyado en tu taquilla.":
			"Ayrılmak istedin ve haber soyunma odasına senden önce ulaştı. Kimse bir şey demiyor, bu daha kötü. Kaptan dolabına yaslanmış seni bekliyor.",
		"NO ES ASUNTO SUYO": "ONLARA NE",
		"LA GRADA TE CANTA": "TRIBUN YUKLENIYOR",
		"En el calentamiento un fondo entero te canta que te vayas ya. A la salida hay bufandas en el suelo y una cámara esperando tu cara.":
			"Isınmada bütün bir kale arkası tribünü hemen gitmen için tezahürat yapıyor. Çıkışta yerde atkılar ve yüzünü bekleyen bir kamera var.",
		"APLAUDIR AL FONDO": "TRIBUNU ALKISLA",
		"SALIR SIN MIRAR": "BAKMADAN ÇIK",
		"TE HAN PUESTO EN LA LISTA": "LISTEYE KONDUN",
		"El club te metió en la lista de transferibles sin avisarte, y te enteraste por la prensa. Hay un micrófono delante y la pregunta ya está hecha.":
			"Kulüp seni haber vermeden transfer listesine koydu ve bunu basından öğrendin. Önünde bir mikrofon var ve soru çoktan soruldu.",
		"TRAGARME EL SAPO": "SINEYE ÇEK",
		"CONTAR LA VERDAD": "DOGRUYU ANLAT",
		"LA MEDALLA DE PLATA": "GUMUŞ MADALYA",
		"Perdiste la final. En el círculo central te cuelgan la medalla que nadie quiere, y en el túnel hay treinta micrófonos esperando a que señales a alguien.":
			"Finali kaybettin. Orta yuvarlakta kimsenin istemediği madalyayı boynuna takıyorlar; tünelde otuz mikrofon birini suçlamanı bekliyor.",
		"CULPAR AL PLANTEAMIENTO": "TAKTIGI SUÇLA",
		"SEÑALAR AL VESTUARIO": "TAKIMI SUÇLA",
		"PASAR DE LARGO SIN HABLAR": "KONUSMADAN GEÇ",
		"LA REUNIÓN DE JUNIO": "HAZIRAN TOPLANTISI",
		"Despacho, dos directivos y una carpeta con tu temporada abierta encima de la mesa. No cumpliste, y de aquí nadie sale hasta que la culpa tenga un nombre.":
			"Bir ofis, iki yönetici ve masada açık duran, sezonunu anlatan bir dosya. Beklentiyi karşılamadın ve suçun bir adı olana kadar kimse bu odadan çıkmıyor.",
		"SEÑALAR AL TÉCNICO": "HOCAYI SUÇLA",
		"SEÑALAR A LA PLANTILLA": "KADROYU SUÇLA",
		"FIRMAR QUE FUE TU CULPA": "SUÇU USTLEN",
		"CUATRO EN CONTRA": "DORT GOL YEDIK",
		"Ridículo de los que se recuerdan. La grada se quedó de pie esperando a que alguien subiera a dar la cara, y en el vestuario nadie levanta la vista del suelo.":
			"Unutulmayacak bir rezalet. Tribünler, biri gelip hesap versin diye ayakta bekledi; soyunma odasında kimse gözünü yerden kaldırmıyor.",
		"PEDIR PERDÓN EN CALIENTE": "HEMEN OZUR DILE",
		"DECIR QUE NO ES PARA TANTO": "ABARTILDIGINI SOYLE",
		"REVENTAR EL VESTUARIO": "TAKIMA YUKLEN",
		"PERDISTE EL DERBI": "DERBIYI KAYBETTIN",
		"La ciudad es de ellos durante un año entero. En la puerta hay gente esperando el autobús del equipo, y no vienen a pedir autógrafos.":
			"Şehir koca bir yıl boyunca onların. Kapıda takım otobüsünü bekleyen insanlar var ve imza istemeye gelmediler.",
		"ENCARARTE CON LA VALLA": "TELLERE YURU",
		"CARGAR CONTRA EL ÁRBITRO": "HAKEME YUKLEN",
		"IRTE EN SILENCIO": "SESSIZCE GIT",
		"FUERA CONTRA UN MODESTO": "KUÇUK TAKIMA ELENDIK",
		"Os echó un equipo de dos categorías más abajo, en un campo de mil personas y con el vestuario de local celebrándolo al lado del vuestro.":
			"İki lig aşağıdaki bir takım sizi bin kişilik bir sahada eledi; ev sahibinin soyunma odası da sizinkinin hemen yanında kutluyor.",
		"DECIR QUE OS SOBRÓ CONFIANZA": "REHAVETI KABUL ET",
		"DEFENDER AL GRUPO CONTRA TODOS": "TAKIMI HERKESE KARŞI SAVUN",
		"NO ABRIR LA BOCA": "TEK KELIME YOK",
		"EL ESTADIO LLEVARÁ TU NOMBRE": "STADA ADIN VERILIYOR",
		"La directiva lo anuncia en la próxima junta: quiere ponerle tu nombre al estadio. Es el honor más grande que da un club, y sólo se da una vez.":
			"Yönetim bir sonraki toplantıda açıklayacak: stadyuma senin adını vermek istiyorlar. Bir kulübün verebileceği en büyük onur bu ve yalnızca bir kez verilir.",
		"ACEPTAR EL HONOR": "ONURU KABUL ET",
		"QUE SEA PARA TODO EL VESTUARIO": "TUM TAKIMIN ADINA OLSUN",
		"DEJARLO CON SU NOMBRE DE SIEMPRE": "ESKI ADI KALSIN",
		"TE PONEN EL MICRO": "MIKROFON KARŞINDA",
		"Figura del partido. La cadena te para antes del vestuario y hay treinta segundos en directo. Lo que digas se repite toda la semana.":
			"Maçın adamı sensin. Yayıncı kuruluş seni soyunma odasından önce durduruyor, otuz saniye canlı yayındasın. Ne dersen bütün hafta tekrar tekrar gösterilecek.",
		"MÉRITO DEL EQUIPO": "TAKIMIN BAŞARISI",
		"HABLAR DE TU MOMENTO": "FORMUNU ANLAT",
		"DEDICÁRSELO A LA GENTE": "TARAFTARA ARMAGAN",
		"CÓMO LO CUENTAS": "NE DIYECEKSIN",
		"El parte ya salió y el teléfono no para. Toca decir algo sobre la baja, y cada versión tiene su precio.":
			"Sağlık raporu çıktı ve telefon susmuyor. Sakatlık hakkında bir şey söylemek gerek ve her versiyonun bir bedeli var.",
		"VOLVERÉ ANTES DE TIEMPO": "ERKEN DONECEGIM",
		"SEGUIR LOS PLAZOS": "PLANA UY",
		"NO DECIR NADA": "SESSIZ KAL",
		"El médico no dice plazos: dice que a tu edad una rotura así no vuelve entera. Puedes pelear la rehabilitación y volver mermado, o parar tú antes de que te paren.":
			"Doktor süre vermiyor: senin yaşında böyle bir yırtığın tam iyileşmeyeceğini söylüyor. Rehabilitasyonla savaşıp eksik dönebilir ya da seni durdurmadan önce kendin bırakabilirsin.",
		"REHABILITARME": "MUCADELE ET",
		"MÉRITO DE {0}": "{0} SAYESINDE",
	},





	"leyenda_casa": {
		"DE LA CASA": "SADIKLAR",
		"Diez temporadas seguidas o más en el club. Una cesión no corta la racha.": "Kulüpte üst üste on sezon ya da daha fazla. Kiralık gitmek seriyi bozmaz.",
		"Nadie lleva aún diez temporadas seguidas en {0}.": "{0} kulübünde henüz kimse üst üste on sezon oynamadı.",

		"PASARON POR AQUÍ": "BURADA OYNADILAR",
		"Jugaron aquí y hoy están en otro club, los mejores primero.": "Burada oynadılar, bugün başka kulüpteler; en iyiler önce.",
		"Nadie que pasara por {0} sigue en activo en otro club.": "{0} kulübünden geçip başka bir kulüpte hâlâ oynayan kimse yok.",
		"TEMP.": "SEZ.",
		"Bandera del Club": "Kulübün Bayrağı",
		"Jugar 10 temporadas seguidas en un mismo club.": "Aynı kulüpte üst üste 10 sezon oyna.",
	},

	"achievements": {},





	"practice": {
		"VOLVER": "GERI",
		"SALIR A MENÚ": "MENUYE DON",
		"EMPEZAR DE NUEVO": "BASTAN BASLA",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada cuenta para la carrera. Se sale con PAUSA.": "Bir pozisyon seç ve dilediğin kadar tekrarla: her deneme o türün içinde farklı bir senaryo kurar. Hiçbiri kariyerine sayılmaz. DURAKLAT ile çıkılır.",
		"JUEGO ABIERTO": "AÇIK OYUN",
		"BALÓN PARADO": "DURAN TOP",
		"CONDUCCIÓN": "TOP SURME",
		"Mano a mano": "Bire bir",
		"Disparo frontal": "Ceza yayından şut",
		"Desde lejos": "Uzaktan",
		"Ángulo cerrado": "Dar açı",
		"Rebote en el área": "Ceza sahasında dönen top",
		"Contraataque": "Kontra atak",
		"Volea": "Vole",
		"Centro al área": "Ceza sahasına orta",
		"Centro desde el fondo": "Çizgiden orta",
		"Tiro libre": "Serbest vuruş",
		"Tiro de esquina": "Korner",
		"Penal": "Penaltı",
		"Saque de banda largo": "Uzun taç",
		"Falta al borde del área": "Ceza sahası önünde frikik",
		"Regate 1 contra 1": "Bire bir çalım",



		"EL CAMPO": "SAHA",
		"AZOTEA": "TERAS",
		"TU ESTADIO": "STADYUMUN",
		"EL TIEMPO": "HAVA",
		"SORTEO": "ŞANS",


		"SOL": "GUNES",
		"NUBES": "BULUT",
		"TARDE": "AKSAM",
		"LLUVIA": "YAGMUR",
		"NOCHE": "GECE",
		"NIEVE": "KAR",
		"En la azotea siempre anochece y siempre llueve: es su hora. Juega en TU ESTADIO si quieres mandar sobre el tiempo.": "Terasta hep akşam olur, hep yağmur yağar: onun saati bu. Hava senin dediğin olsun istiyorsan STADYUMUN seçeneğinde oyna.",
		"Se sortea como en un partido de verdad.": "Gerçek bir maçtaki gibi rastgele belirlenir.",
		"Sin límite · no cuenta para la carrera": "Sınırsız · kariyere sayılmaz",
		"Tu estadio con {0}.": "Stadyumun: {0}.",




		"Soleado": "Güneşli",
		"Nublado": "Bulutlu",
		"Atardecer": "Gün batımı",
		"Lluvia": "Yağmur",
		"Noche": "Gece",
		"Nieve": "Kar",



		"Llovizna": "Çisenti",
		"Tormenta": "Fırtına",
	},















	"career_screens": {

		"TRAYECTORIA": "KARIYER",
		"DESDE T{0}": "ILK: S{0}",

		"DESDE {0}": "ILK: {0}",


		"viaLIBRE": "SERB.",
		"viaEDITOR": "EDITOR",
		"TRASPASO": "TRANSFER",
		"FIN CESION": "KIR. BITTI",
		"COMPRADO": "ALINDI",

		"HAY UNA PARED AHI": "BURADA DUVAR VAR",
		"PUERTAS Y VENTANAS": "KAPI VE PENCERE",

		"PINO": "ÇAM",
		"NOGAL": "CEVIZ",
		"NEGRO MATE": "MAT SIYAH",
		"ALUMINIO": "ALUMINYUM",
		"LATÓN": "BRONZ",




		"RITMO": "RITIM",
		"FALTO DE RITMO · SE PASA JUGANDO": "RITIMSIZ · OYNADIKÇA GELIR",
		"EL TÉCNICO TE DA DESCANSO · LO VES DESDE LA GRADA":
			"HOCA SENI DINLENDIRIYOR · MAÇI TRIBUNDEN IZLERSIN",
		"POR DEBAJO DE {0} EMPIEZAS EN LA BANCA": "{0} ALTINDA YEDEK BASLARSIN",




		"POR DEBAJO DE {0} NO TE CONVOCAN": "{0} ALTINDA KADROYA ALINMAZSIN",


		"AÑO {0} · SEM {1}/{2}": "YIL {0} · HF {1}/{2}",
		"energiaFUERA": "YOK",
		"energiaBANCA": "YEDEK",
		"Aún no llevas {0} partidos: esta vez no cuenta.":
			"Henüz {0} maç oynamadın: bu sefer sayılmaz.",

		"MANTENIMIENTO": "BAKIM",
		"En segunda tu club abre tienda oficial: merch, y la tabla de las camisetas más vendidas del vestuario.":
			"İkinci ligde kulübün resmi mağazasını açıyor: ürünler ve takımda en çok forması satanların tablosu.",
		"LAS MÁS VENDIDAS": "EN ÇOK SATANLAR",
		"{0} AL AÑO": "YILDA {0}",
		"Lo que mueve cada uno de la marca del club. Vender camisetas te hace más difícil de vender a ti.":
			"Her oyuncunun kulüp markasından payı. Forma sattıkça seni satmak zorlaşır.",
		"JUGADOR": "OYUNCU",
		"CUOTA": "PAY",

		"TUS TEMPORADAS": "SEZONLARIN",
		"AÑO": "YIL",
		"{0}º de {1}": "{0}. / {1}",
		"Tu dorsal, el {0}, se elige al fichar o al renovar.":
			"Forma numaran ({0}) transferde ya da sözleşme yenilerken seçilir.",
		"A la espalda: {0}": "Sırtında: {0}",
		"GOL DE PENAL EN LIGA": "LIGDE PENALTI GOLU",
		"GOL DE PENAL EN {0}": "PENALTI GOLU: {0}",

		"Tu media es {0}. Con la vara de {1} son {2}, y ése es el número que se mide contra la lista.":
			"Genel ortalaman {0}. {1} ölçütüyle {2} ediyor; listeyle karşılaştırılan sayı da bu.",
		"Y el seleccionador te apunta {0} por lo de fuera del campo, así que la lista te lee {1}.":
			"Milli takım teknik direktörü saha dışındakiler için sana {0} ekliyor; liste seni {1} olarak görüyor.",
		"Tu país no tiene liga propia: eres su estrella indiscutible.":
			"Ülkenin kendi ligi yok: tartışmasız yıldızı sensin.",
		"Te faltan {0} puntos para entrar en la convocatoria.":
			"Kadroya girmek için {0} puan daha lazım.",
		"Aún no entras en la convocatoria.": "Henüz kadroya giremiyorsun.",
		"Sin nacionalidad: no hay selección que disputar.":
			"Uyruk yok: oynayacak milli takım da yok.",
		"{0} · {1} CANDIDATOS": "{0} · {1} ADAY",
		"DORSAL {0}": "NUMARA {0}",
		"1-{0} ONCE": "1-{0} AS",
		"{0}-{1} BANCA": "{0}-{1} YEDEK",
		"El suelo, la pared y la carpintería, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.": "Zemin, duvar ve doğramalar senin zevkine. Ayrı ayrı alınır ve senin kalır: istediğin zaman değiştirebilirsin.",
		"MUDARSE": "TAŞIN",
		"El terreno crece a {0}×{0} m y todo lo que construiste se queda.": "Arsa {0}×{0} m olur ve inşa ettiğin her şey kalır.",
		"La casa más grande que se vende, y una planta hecha a la medida.": "Satıştaki en büyük ev ve sana özel bir kat planı.",
		"Todo lo que construiste se queda.": "İnşa ettiğin her şey kalır.",
		"Ya vives en la mejor casa: no hay ninguna encima.": "Zaten en iyi evde yaşıyorsun: bundan büyüğü yok.",
		"PRECIO": "FIYAT",

		"PONER VENTANA": "PENCERE EKLE",
		"PUERTA DOBLE": "ÇIFT KAPI",
		"PONER ARCO": "KEMER EKLE",
		"PONER VENTANAL": "GENIS PENCERE",
		"PONER OJO DE BUEY": "LOMBOZ EKLE",
		"DOBLE": "ÇIFT",
		"ARCADA": "KEMER",
		"VENTNL": "GENIS",
		"OJO": "OVAL",
		"QUITAR VENTANA": "PENCERE KAPAT",
		"VENTAN": "PENC.",
		"TAPIAR": "KAPAT",

		"VACIAR": "BOSALT",
		"PUESTOS": "KONDU",
		"TABIQUES": "DUVARLAR",
		"PINTADO": "BOYALI",
		"TIRADOS": "YIKILAN",
		"DESPINTADO": "BOYASIZ",
		"MANTEN PARA GUARDAR TODO": "BASILI TUT: HEPSI DEPOYA",
		"MANTEN PARA DEJARLO LIMPIO": "BASILI TUT: TEMIZLE",
		"MANTEN PARA ARRASAR": "BASILI TUT: YIK",
		"PLANOS": "PLANLAR",
		"Cuartos ya repartidos, con sus puertas puestas.": "Odalar hazır bölünmüş, kapıları takılı.",
		"Este terreno es demasiado chico para repartirlo en cuartos.": "Bu arsa odalara bölmek için çok küçük.",
		"LO QUE SE VA": "GIDENLER",
		"El plano REEMPLAZA tu casa: tira tus paredes, borra la pintura y recoge tus muebles al inventario.": "Plan evinin YERINE geçer: duvarların yıkılır, boya silinir ve eşyaların depoya döner.",
		"PAREDES QUE HAY": "MEVCUT DUVARLAR",
		"Aplicar un plano las tira todas y pone las suyas.": "Bir plan uygulamak hepsini yıkar ve kendi duvarlarını koyar.",
		"DOS AMBIENTES": "IKI BOLUM",
		"Un muro con puerta: día de un lado, noche del otro.": "Kapılı bir duvar: bir yanda gündüz, öbür yanda gece.",
		"DOS RECÁMARAS": "IKI ODA",
		"TRES CUARTOS Y BAÑO": "UÇ ODA VE BANYO",
		"Añade un baño en la esquina de la entrada.": "Girişin köşesine bir banyo ekler.",
		"Dos cuartos al fondo, con su puerta cada uno, y el salón al frente.": "Arkada her birinin kendi kapısı olan iki oda, önde salon.",
		"CUATRO CUARTOS": "DORT ODA",
		"Cocina aparte, salón al frente y dos cuartos al fondo.": "Ayrı mutfak, önde salon ve arkada iki oda.",
		"PASILLO Y CUATRO CUARTOS": "KORIDOR VE DORT ODA",
		"Un pasillo desde la puerta, dos cuartos por lado y el salón al fondo.": "Kapıdan bir koridor, iki yanda ikişer oda ve arkada salon.",
		"{0} cuartos": "{0} oda",
		"O YA AMUEBLADA": "YA DA ESYALI",





		"rotANULAR": "IPTAL",
		"rotDESHAZ": "GERI",
		"rotCERRAR": "KAPAT",
		"rotGIRAR": "ÇEVIR",
		"rotMOVER": "TASI",
		"rotOTRO": "YENI",
		"rotPINTAR": "BOYA",
		"rotPLANOS": "PLAN",
		"rotQUITAR": "KALDIR",
		"rotTAPAR": "KAPAT",
		"rotTAPIAR": "DUVAR",
		"rotTAPONA": "ENGEL",
		"rotTIRAR": "YIK",
		"rotTRAMO": "PARÇA",
		"rotVACIAR": "BOSALT",
		"rotVENTAN": "PENC.",
		"En este plano no cabe el juego de muebles completo.": "Tam mobilya takımı bu plana sığmıyor.",
		"Llega con {0} muebles ya puestos en su sitio.": "{0} parça eşya yerleştirilmiş olarak gelir.",
		"Sueltos costarían {0}": "Ayrı ayrı {0} tutardı",
		"AMUEBLADA": "EŞYALI",
		"Calculando la oferta…": "Teklif hesaplanıyor…",
		"COMPRAR AMUEBLADA · {0}": "ESYALI AL · {0}",
		"PAGASTE": "ODEDIN",
		"Y de paso te acomodamos {0} muebles que ya tenías guardados.": "Depoda duran {0} parça eşyanı da yerleştirdik.",
		"Muévelo todo si quieres: la casa ya es tuya y nada está clavado.": "İstersen hepsini taşı: ev artık senin ve hiçbir şey çakılı değil.",
		"MANTEN PARA PONER ESTE PLANO": "BASILI TUT: BU PLANI KUR",
		"Tira TAMBIÉN el cascarón y las paredes de fábrica. Queda el terreno con su piso.": "AYRICA kabuğu ve fabrika duvarlarını da yıkar. Arsanın zemini kalır.",
		"Ni muebles, ni paredes, ni pintura: este terreno ya está pelado.": "Ne eşya, ne duvar, ne boya: bu arsa zaten çıplak.",
		"{0} paredes": "{0} duvar",
		"PLANO": "PLAN",
		"Muévelas, tíralas o ábreles más puertas: ahora son tuyas.": "Taşı, yık ya da yeni kapılar aç: artık senin.",
		"MARCOS DE TODA LA CASA": "TUM EVIN ÇERÇEVELERI",
		"Puertas, ventanas, corredizas, rodapiés y remates.": "Kapılar, pencereler, sürgülü kapılar, süpürgelikler ve kapaklar.",
		"PONER CORREDIZA": "SURGULU EKLE",
		"QUITAR CORREDIZA": "SURGULUYU KALDIR",
		"PARED CORTA": "KISA DUVAR",
		"CORRED": "SURGU",
		"CORTA": "KISA",
		"TAPAR": "KAPAT",
		"YA ESTA PELADO": "ZATEN BOS",
		"TIRAR TODO EL TRAMO": "TUM PARÇAYI YIK",
		"NO HAY NADA PUESTO": "HIÇBIR SEY YOK",
		"YA ESTA LIMPIO": "ZATEN TEMIZ",
		"Recoge tus muebles al inventario. Las paredes y la pintura se quedan.": "Eşyalarını envantere toplar. Duvarlar ve boya kalır.",
		"Además tira tus tabiques, cierra los boquetes y borra la pintura del suelo.": "Ayrıca bölme duvarlarını yıkar, boşlukları kapatır ve zemin boyasını siler.",
		"Nada se pierde: todo lo que compraste sigue en tu inventario.": "Hiçbir şey kaybolmaz: satın aldığın her şey envanterinde kalır.",
		"Esta planta ya está vacía: todo lo tuyo está en el inventario.": "Bu kat zaten boş: senin olan her şey envanterde.",
		"Ni muebles puestos, ni tabiques tuyos, ni pintura: no hay nada que quitar.": "Ne kurulu eşya, ne senin duvarın, ne boya: kaldırılacak bir şey yok.",
		"YA ESTA": "TAMAM",
		"A CAJAS": "KUTUDA",
		"VALOR DE MERCADO": "PIYASA DEGERI",
		"TU SITIO EN EL EQUIPO": "TAKIMDAKI YERIN",
		"ROL DE CONTRATO": "SOZLESME ROLU",
		"PRÓXIMO PARTIDO": "SONRAKI MAÇ",
		"{0} · ~{1} MIN": "{0} · ~{1} DK",
		"ÚLTIMO PARTIDO": "SON MAÇ",
		"{0} MIN · {1}": "{0} DK · {1}",
		"NO JUGASTE": "OYNAMADIN",
		"FORMA · {0}": "FORM · {0}",
		"MEDIA TEMPORADA": "SEZON PUANI",
		"MEDIA CARRERA": "KARIYER PUANI",
		"HABILIDADES · {0} PUNTOS": "YETENEK · {0} PUAN",
		"HABILIDADES · TODO AL TOPE": "YETENEK · HEPSI TAVAN",
		"Ya no queda nada que subir: los puntos que ganes se convierten en experiencia.": "Geliştirecek bir şey kalmadı: kazandığın puanlar deneyime dönüşür.",
		"Penales": "Penaltılar",
		"Tiros libres y córners": "Serbest vuruş ve kornerler",
		"{0}: los lanzas TÚ": "{0}: SEN kullanıyorsun",
		"{0}: los lanza {1} — tú cobras ~{2} de cada 10":
			"{0}: {1} kullanıyor — 10 vuruştan ~{2} tanesi senin",
		"{0}: los lanza {1} — supéralo para quitárselos":
			"{0}: {1} kullanıyor — onu geçersen sıra sende",
		"SU NIVEL": "ONUN SEV.",
		"TU NIVEL": "SEVIYEN",
		"TÚ COBRAS": "PAYIN",
		"En racha (+{0})": "Formda (+{0})",
		"En baja ({0})": "Düşüşte ({0})",
		"Estable": "Sabit",



		"Potencia": "Güç",
		"Precisión": "İsabet",
		"Efecto": "Falso",
		"Visión": "Vizyon",
		"Físico": "Fizik",
		"Velocidad": "Hız",
		"Aceleración": "İvmelenme",
		"Regate": "Çalım",
		"Balón parado": "Duran top",


		"Pegada": "Vuruş",
		"Puntería": "Bitiricilik",
		"Rosca": "Kavis",
		"Cabeza": "Kafa",

		"Reflejos": "Refleks",
		"Entrada": "Top kapma",
		"{0} · MEDIA {1}": "{0} · GENEL {1}",
		"TE PELEA EL PUESTO": "YERINE GOZ DIKTI",
		"VER PLANTEL": "KADROYU GOR",



		"La velocidad a la que sale el balón de tu pie. Sólo la entregas entera si le pegas al empeine.":
			"Topun ayağından çıkış hızı. Hepsini ancak temiz bir üst ayak vuruşuyla verirsin.",
		"Cuánto respeta el balón la línea que trazaste. Cierra el abanico de error del apuntador.":
			"Topun çizdiğin çizgiye ne kadar sadık kaldığı. Nişanın hata payını daraltır.",
		"Cuánto comba el balón en el aire. También es el toque con el que conduces en el regate.":
			"Topun havada ne kadar falso aldığı. Çalımda topu sürdüğün dokunuş da budur.",
		"Desde 85 ves dibujada la línea de fuera de juego. El árbitro la pita igual sin ella.":
			"85'ten itibaren ofsayt çizgisini sahada çizili görürsün. Hakem onsuz da aynı şekilde çalar.",
		"Lo rápido que corres con el balón en el regate: si eres lento te la quitan, si eres rápido no te alcanzan. No toca el tiro.":
			"Çalımda topla ne kadar hızlı koştuğun: yavaşsan topu kaparlar, hızlıysan yetişemezler. Şuta etkisi yok.",
		"Qué tan rápido llegas a tu velocidad máxima: el arranque, el frenazo y la marcha atrás al conducir.":
			"Son hızına ne kadar çabuk ulaştığın: topla çıkış, duruş ve geri dönüş.",
		"Tu control del balón en carrera: el quiebre sin perder velocidad y a qué distancia te lo pueden robar.":
			"Koşarken top kontrolün: hız kesmeden yön değiştirmek ve topu senden ne kadar yakından alabilecekleri.",
		"DE PARADO A TU MÁXIMA EN {0} S": "DURARKEN SON HIZA {0} SN",
		"TE ROBAN A {0} CM DEL BALÓN": "{0} CM YAKINDAN KAPARLAR",
		"Cada punto sobre el lanzador de tu equipo te da más penales. NO cuenta para tu media.":
			"Takımının penaltıcısını geçtiğin her puan sana daha çok penaltı getirir. Genel puanına SAYILMAZ.",
		"Cada punto sobre el lanzador de tu equipo te da más faltas y córners. NO cuenta para tu media.":
			"Takımının duran top ustasını geçtiğin her puan sana daha çok serbest vuruş ve korner getirir. Genel puanına SAYILMAZ.",
		"TU TIRO: {0} KM/H": "ŞUTUN: {0} KM/S",
		"TU CABEZAZO: {0} KM/H": "KAFA VURUSU: {0} KM/S",
		"A {0} M EL BALÓN SALE DENTRO DE ±{1} CM": "{0} M MESAFEDE TOP ±{1} CM IÇINDE",
		"SIN ABANICO: EL BALÓN VA POR DONDE APUNTAS": "SAPMA YOK: TOP NEREYE NIŞAN ALIRSAN ORAYA",
		"COMBA ×{0}": "FALSO ×{0}",
		"VES LA LÍNEA DE FUERA DE JUEGO EN LA CANCHA": "OFSAYT ÇIZGISINI SAHADA GORURSUN",
		"TE FALTAN {0} PARA VER LA LÍNEA DE FUERA DE JUEGO": "OFSAYT ÇIZGISI IÇIN {0} DAHA",
		"CORRES A {0} M/S · EL DEFENSA MÁS RÁPIDO, {1}":
			"HIZIN {0} M/SN · EN HIZLI DEFANS {1}",
		"LOS COBRAS TODOS": "HEPSI SENDE",
		"COBRAS {0} DE CADA 10": "{0}/10 SENDE",
		"DESHACER": "GERI AL",
		"PUNTO DEVUELTO · {0}": "PUAN IADE · {0}",
		"Al salir del perfil, lo repartido queda firmado.":
			"Profilden çıkınca dağıttığın puanlar kesinleşir.",
		"ESPORÁDICO": "ARA SIRA",
		"ROTACIÓN": "ROTASYON",

		"MEDIA {0}": "GENEL {0}",
		"MEDIA {0} EN {1} JORNADAS": "{1} HAFTADA GENEL {0}",
		"{0} de {1} · {2}/{3} jornadas": "{0} / {1} · {2}/{3} hafta",
		"JUGAR {0} JORNADAS": "{0} HAFTA OYNA",
		"JUGAR {0} JORNADAS DE {1}' O MÁS": "{0} HAFTA {1}' VE UZERI OYNA",
		"{0} GOLES": "{0} GOL",
		"CONTRATO": "SOZLEŞME",
		"Club: {0} ({1})": "Kulüp: {0} ({1})",
		"Sueldo: ${0} por partido": "Maaş: maç başı ${0}",
		"Temporadas restantes: {0}": "Kalan sezon: {0}",
		"tu club": "kulübün",
		"CEDIDO · el contrato es con {0}": "KIRALIK · sözleşmen {0} ile",
		"Mantenimiento del estilo de vida: -${0} por partido":
			"Yaşam tarzı gideri: maç başı -${0}",
		"OBJETIVO DE TEMPORADA": "SEZON HEDEFI",

		"CLÁUSULA PERSONAL": "KISISEL MADDE",
		"Sin cláusula. Una condición con dientes a cambio de renunciar a las otras.":
			"Madde yok. Diğerlerinden vazgeçme karşılığında dişli bir şart.",
		"ANTI-DESCENSO": "KUME DUŞME",
		"Si el club baja de categoría, quedas AGENTE LIBRE.":
			"Kulüp küme düşerse SERBEST OYUNCU olursun.",
		"PROMESA DE TITULARIDAD": "ILK 11 SOZU",
		"Si juegas pocos partidos esta temporada, quedas AGENTE LIBRE.":
			"Bu sezon az maç oynarsan SERBEST OYUNCU olursun.",
		"NO A UN RIVAL": "RAKIBE YOK",
		"Tu club no puede venderte a tu rival de siempre.":
			"Kulübün seni ezeli rakibine satamaz.",
		"ELEGIR CLÁUSULA": "MADDE SEÇ",
		"CAMBIAR CLÁUSULA": "MADDE DEGISTIR",
		"La cláusula se pacta al arranque de la temporada.":
			"Madde sezon başında belirlenir.",
		"Sólo una a la vez. Se pacta al arranque de la temporada.":
			"Aynı anda yalnızca bir tane. Sezon başında belirlenir.",
		"SIN CLÁUSULA": "MADDE YOK",
		"CLÁUSULA PACTADA": "MADDE TAMAM",
		"ES TU RIVAL: tu CLÁUSULA impide que acabes aquí.":
			"EZELI RAKIBIN: MADDEN burada bitmeni engelliyor.",
		"CLÁUSULA ANTI-DESCENSO: el club bajó y quedas AGENTE LIBRE.":
			"KUME DUŞME MADDESI: kulüp düştü, SERBEST OYUNCU oldun.",
		"PROMESA DE TITULARIDAD incumplida ({0} partidos): quedas AGENTE LIBRE.":
			"ILK 11 SOZU tutulmadı ({0} maç): SERBEST OYUNCU oldun.",

		"PACTAR OBJETIVO": "HEDEF BELIRLE",
		"PACTAR EL OBJETIVO": "HEDEFI BELIRLE",
		"Más exigente paga más prima; más cómodo, menos. Se pacta una vez, al arranque de la temporada.":
			"Zor hedef daha büyük prim öder; kolay hedef daha az. Bir kez, sezon başında belirlenir.",
		"CÓMODO": "KOLAY",
		"COMO ESTÁ": "AYNEN",
		"EXIGENTE": "ZOR",
		"OBJETIVO PACTADO": "HEDEF TAMAM",
		"Ya pactaste tu objetivo esta temporada.": "Bu sezonun hedefini zaten belirledin.",
		"top {0}": "ilk {0}",
		"{0} asist.": "{0} asist",
		"{0} part.": "{0} maç",
		"nota {0}": "ort. {0}",
		"{0} goles": "{0} gol",
		"RENOVAR CONTRATO": "SOZLESME YENILE",


		"LA OFERTA DEL CLUB": "KULUBUN TEKLIFI",
		"AÑOS QUE OFRECEN": "YIL TEKLIFI",
		"NINGUNO": "YOK",
		"SUELDO NUEVO": "YENI MAAŞ",


		"EQUILIBRIO": "DENGE",
		"MÁS AÑOS": "UZUN",
		"LIBERTAD": "OZGURLUK",
		"PRIMA DE FIRMA": "IMZA PRIMI",
		"CLÁUSULA": "MADDE",
		"Cobras $ {0} de prima al firmar.": "İmzada $ {0} prim alırsın.",
		"Cláusula baja: si un club la paga, el tuyo no puede negarse.":
			"Düşük madde: bir kulüp öderse seninki hayır diyemez.",
		"Cláusula en $ {0}: quien la pague, te lleva.":
			"Madde $ {0}: kim öderse seni alır.",

		"BANDERA":
			"BAYRAK",
		"Tu grada frena tu venta: cobras más y el club te blinda con una cláusula un {0} % más alta.":
			"Taraftarın satışını engelliyor: daha çok kazanırsın ve kulüp seni %{0} daha yüksek bir maddeyle kilitler.",
		"Cláusula en $ {0}: tu grada frena tu venta.":
			"Madde $ {0}: taraftarın satışını engelliyor.",
		"Aceptaste salir: tu grada ya no te quiere y el club te ofrece a quien pregunte, más barato. Sigues jugando mientras llega tu destino.":
			"Ayrılmayı kabul ettin: taraftarın artık seni istemiyor ve kulüp seni soran herkese daha ucuza teklif ediyor. Gideceğin yer çıkana kadar oynamaya devam ediyorsun.",
		"TU GRADA TE QUIERE FUERA":
			"TARAFTAR SENI ISTEMIYOR",
		"Negarte no te cuesta nada: el club no necesita tu dinero, necesita que dejen de pitarte. Si aceptas, te venden más barato.":
			"Reddetmek sana bir şey kaybettirmez: kulübün paraya değil, ıslıkların bitmesine ihtiyacı var. Kabul edersen seni daha ucuza satarlar.",
		"Te quedas, y en el vestuario nadie te lo reprocha. La grada no cambia sola: esa hay que ganársela en el campo.":
			"Kalıyorsun ve soyunma odasında kimse bunu yüzüne vurmuyor. Taraftar kendiliğinden dönmez: onu sahada geri kazanmalısın.",
		"Te sientan en el vestuario con el director deportivo. En {0} la grada ya no te quiere y el club la escucha: te ofrecen a quien pregunte, y más barato. Si te quedas, nadie aquí dentro te lo reprocha.":
			"Seni sportif direktörle soyunma odasında oturtuyorlar. {0} kulübünde taraftar artık seni istemiyor ve kulüp onları dinliyor: seni soran herkese, daha ucuza teklif edecekler. Kalırsan burada kimse bunu yüzüne vurmaz.",

		"La ficha sale de: {0}": "Maaşın kaynağı: {0}",
		"tu nivel": "seviyen",
		"tu prestigio": "prestijin",
		"tus títulos": "kupaların",
		"tu afición": "taraftarın",
		"tus récords": "rekorların",
		"su interés": "ilgileri",
		"tu temporada": "sezonun",
		"Quedan {0} · al firmar tendrías {1} en total":
			"{0} kaldı · imzalarsan toplam {1} olur",
		"Tu sueldo {0} de $ {1} a $ {2} por partido":
			"Maaşın maç başı ${1} seviyesinden ${2} seviyesine {0}",
		"sube": "çıkıyor",
		"baja": "iniyor",
		"Te renuevan con el mismo sueldo.": "Aynı maaşla sözleşmeni yeniliyorlar.",
		"Te firman como {0}": "Seni {0} olarak imzalıyorlar",
		"Por tu temporada: {0}{1}% sobre el sueldo":
			"Sezonun için: maaşa {0}%{1}",
		"Es el techo salarial del club: no pueden pagar más.":
			"Kulübün maaş tavanı bu: daha fazlasını ödeyemezler.",
		"Negocian sobre tu ficha actual: nadie da más salto en una firma.": "Mevcut maaşın üzerinden pazarlık yapıyorlar: tek imzada kimse daha büyük sıçrama yapamaz.",
		"¿RENOVAR?": "YENILE?",
		"{0} años más (tendrías {1}) y ficha de $ {2} por partido.":
			"{0} yıl daha (toplam {1}), maç başı $ {2} maaşla.",
		"Es MENOS de lo que cobras ahora.": "Şu an kazandığından AZ.",


		"CONTRATO RENOVADO": "YENILENDI",


		"SOLO EN TU ÚLTIMO AÑO": "SADECE SON YILINDA",
		"EL TÉCNICO NO RENUEVA": "HOCA HAYIR DIYOR",




		"RENEGOCIAR": "PAZARLIK",
		"PEDIR RENEGOCIACIÓN": "PAZARLIK ISTE",
		"LO QUE PUEDES PEDIR": "ISTEYEBILECEKLERIN",
		"AÑOS QUE SUMAS": "EKLENEN YIL",
		"PRIMAS PACTADAS": "PRIMLER",
		"MESA DE CONTRATO": "SOZLESME MASASI",
		"CONTRATO MEJORADO": "SOZLESME IYILESTI",
		"Tu sueldo sube de $ {0} a $ {1} por partido":
			"Maaşın maç başı $ {0} seviyesinden $ {1} seviyesine çıkıyor",
		"Te reconocen como {0}": "Seni {0} olarak görüyorlar",
		"Por tu temporada: +{0}% sobre el sueldo": "Sezonun için: maaşa +%{0}",
		"Sueldo: $ {0} → $ {1} (+$ {2})": "Maaş: $ {0} → $ {1} (+$ {2})",
		"Años: +{0} (tendrías {1})": "Yıl: +{0} (toplam {1})",
		"Prima por gol: +$ {0}": "Gol primi: +$ {0}",
		"Prima por asistencia: +$ {0}": "Asist primi: +$ {0}",
		"Rol: te reconocen como {0}": "Rol: {0} olarak görülüyorsun",
		"Para renegociar antes: {0}": "Daha erken pazarlık için: {0}",


		"Eres agente libre: negocia con un club nuevo.":
			"Serbest oyuncusun: yeni bir kulüple pazarlık yap.",
		"Estás cedido: tu contrato lo lleva el club dueño.":
			"Kiralıksın: sözleşmen asıl kulübünde.",
		"Ya firmaste un precontrato con otro club.":
			"Başka bir kulüple zaten ön sözleşme imzaladın.",
		"El club te dio por perdido; no hay mesa.":
			"Kulüp senden umudu kesti; masa yok.",
		"Pediste salir: arréglalo con el club antes de negociar.":
			"Ayrılmak istedin: pazarlıktan önce bunu kulüple çöz.",
		"Es tu último año: el club ya te ofrece renovar.":
			"Son yılın: kulüp zaten sözleşme yenilemeyi teklif ediyor.",
		"Acabas de firmar: cumple una temporada antes de pedir mejora.":
			"Yeni imzaladın: iyileştirme istemeden önce bir sezonu tamamla.",
		"Te queda mucho contrato: el club no tiene por qué moverlo.":
			"Sözleşmende daha çok süre var: kulübün ona dokunması için sebep yok.",
		"El club no negocia fichas con el mercado cerrado.":
			"Kulüp transfer dönemi kapalıyken maaş konuşmaz.",
		"El club no se sentó contigo este año. Vuelve la temporada que viene.":
			"Kulüp bu yıl seninle masaya oturmadı. Gelecek sezon tekrar dene.",
		"FIRMAR LA MEJORA":
			"YENISINI IMZALA",
		"El club ya cuenta con tu salida: no te convoca.":
			"Kulüp gideceğini varsayıyor: seni kadroya almıyor.",
		"Renueva o busca club, o no juegas.":
			"Ya yenile ya kulüp bul, yoksa oynamazsın.",
		"Una bala al año. Si fallas, esperas.":
			"Yılda tek kurşun. Iskalarsan beklersin.",
		"PEDIR MESA AL CLUB":
			"KULUPTEN MASA ISTE",
		"SE SIENTAN":
			"MASA IHTIMALI",
		"Se sientan contigo un {0}% de las veces. Si dicen que no, no habrá mesa esta temporada.":
			"Seninle %{0} ihtimalle masaya otururlar. Hayır derlerse bu sezon masa olmaz.",
		"PEDIR MESA":
			"MASA ISTE",
		"SE SIENTAN CONTIGO":
			"MASAYA OTURURLAR",
		"NO HAY MESA ESTE AÑO":
			"BU YIL MASA YOK",
		"Ya renegociaste esta temporada. Vuelve el año que viene.":
			"Bu sezon zaten pazarlık yaptın. Gelecek yıl tekrar gel.",
		"Aún no jugaste lo suficiente esta temporada.":
			"Bu sezon henüz yeterince oynamadın.",
		"Sube tu media a {0} para sentarte a negociar.":
			"Pazarlık masasına oturmak için genelini {0} yap.",
		"Gánate al técnico antes de pedir mejora.":
			"İyileştirme istemeden önce hocayı kazan.",
		"EN EL ESCAPARATE": "VITRINDE",
		"No renuevas: el club te vende y juegas menos hasta que salgas.":
			"Yenilemiyorsun: kulüp seni satıyor ve gidene kadar daha az oynarsın.",
		"Busca una salida en el MERCADO, o aguanta el año y quedarás AGENTE LIBRE al"
		+ " final.":
			"PIYASA bölümünde bir çıkış bul ya da yılı tamamla, sonunda SERBEST OYUNCU olursun.",
		"NO RENOVAR": "YENILEME",
		"¿NO RENOVAR?": "YENILEME?",
		"El club te pondrá en venta para no perderte gratis. Si no sales, jugarás menos"
		+ " el resto del año. Si aguantas, quedarás libre al final.":
			"Kulüp seni bedavaya kaybetmemek için satışa çıkaracak. Gitmezsen yılın kalanında daha az oynarsın. Dayanırsan sonunda serbest kalırsın.",
		"NO RENUEVO": "YENILEMEM",
		"NO RENUEVAS · EL CLUB TE VENDE": "YENILEME YOK · KULUP SENI SATIYOR",
		"EL CLUB TE VENDE": "KULUP SENI SATIYOR",
		"EL FINAL": "SON",
		"Los años ya pesan. Puedes seguir peleando... o cerrar la carrera y entrar en"
		+ " la historia con lo que ganaste.":
			"Yıllar ağırlaşıyor. Savaşmaya devam edebilirsin... ya da kariyerini kapatıp kazandıklarınla tarihe geçebilirsin.",
		"Juegues lo que juegues, a los {0} años se acaba: te queda {1} temporada.": "Ne kadar oynarsan oyna, {0} yaşında biter: {1} sezonun kaldı.",
		"Juegues lo que juegues, a los {0} años se acaba: te quedan {1} temporadas.":
			"Ne kadar oynarsan oyna, {0} yaşında biter: {1} sezonun kaldı.",
		"COLGAR LAS BOTAS": "KRAMPONLARI AS",
		"MEJOR NO": "VAZGEÇ",
		"¿COLGAR LAS BOTAS?": "KRAMPONLARI AS?",
		"Se acaba de verdad: no hay más partidos. Tu legado, tu vitrina y tu historia"
		+ " quedan guardados para siempre.":
			"Bu gerçekten son: artık maç yok. Mirasın, vitrinin ve hikâyen sonsuza dek saklanır.",
		"ME RETIRO": "BIRAKIYORUM",
		"MANTÉN PARA RETIRARTE": "BASILI TUT: EMEKLI OL",
		"AÚN ME QUEDA FÚTBOL": "DAHA FUTBOLUM VAR",
		"Termina {0} o mejor en la liga.": "Ligi {0} sırada ya da daha yukarıda bitir.",
		"La liga aún no arranca.": "Lig henüz başlamadı.",
		"Vas {0}{1}": "Sıran: {0}{1}",
		"sin clasificar": "sıralamada yok",
		"Da {0} asistencias  (llevas {1})": "{0} asist yap  ({1} yaptın)",
		"Marca {0} goles  (llevas {1})": "{0} gol at  ({1} attın)",
		"TU VALOR": "DEGERIN",
		"TE PIDEN": "ISTENEN",
		"EN LISTA": "LISTEDE",
		"CONTRATO CORTO": "KISA SOZLESME",
		"Tu agente está en {0}: te consigue {1} oferta(s) por ventana.":
			"Menajerin {0} seviyesinde: dönem başına {1} teklif getiriyor.",
		"LOS OJEADORES": "GOZLEMCILER",
		"Un club mira tres cosas y te juzga por la más floja. Para que te busque un"
		+ " grande, tienes que ser bueno en las tres.":
			"Bir kulüp üç şeye bakar ve seni en zayıfına göre yargılar. Büyük bir takımın seni istemesi için üçünde de iyi olmalısın.",
		"Fama": "Şöhret",
		"Que te conozcan: prensa y afición.": "Tanınmak: basın ve taraftar.",
		"Nivel": "Seviye",
		"Tus habilidades frente a la élite.": "Yeteneklerinin elit oyunculara göre düzeyi.",
		"Forma": "Form",
		"Tu media de la temporada: {0}.": "Sezon ortalaman: {0}.",
		"Verano: fechas 1 a {0}. Invierno: {1} a {2}. Hoy es la {3}.":
			"Yaz: 1-{0}. haftalar. Kış: {1}-{2}. Bugün: {3}.",
		"TU CLUB TE VENDE": "KULUBUN SENI SATIYOR",
		"Dijiste que no renuevas: el club te ofrece para no perderte gratis. Mientras"
		+ " no salgas, juegas menos. Elige una salida:":
			"Yenilemeyeceğini söyledin: kulüp seni bedavaya kaybetmemek için teklif ediyor. Gidene kadar daha az oynarsın. Bir çıkış seç:",
		"ESTÁS EN VENTA": "SATILIKSIN",
		"Aceptaste salir: el club te ofrece a quien pregunte para hacer caja. Sigues"
		+ " jugando mientras llega tu destino.":
			"Ayrılmayı kabul ettin: kulüp para kazanmak için seni soran herkese teklif ediyor. Gideceğin yer çıkana kadar oynamaya devam ediyorsun.",
		"ULTIMO DIA · mañana se cierra": "SON GUN · yarın kapanıyor",
		"Cierra en {0} jornadas. Lo que hagas en el campo mueve las ofertas: hay clubes"
		+ " que entran y clubes que se van.":
			"{0} hafta sonra kapanıyor. Sahada yaptıkların teklifleri etkiler: gelen kulüpler de olur, vazgeçenler de.",
		"Nadie ha preguntado por ti. Rinde y hazte ver.":
			"Kimse seni sormadı. Performans göster ve dikkat çek.",


		"FICHAJES": "TRANSFER",
		"RECIENTES": "YENI",
		"MAS CAROS": "EN PAHALI",
		"MUNDO": "DUNYA",
		"MI JUGADOR": "OYUNCUM",
		"DIVISION": "LIG",
		"TU LIGA": "LIGIN",
		"Ningún movimiento en tu liga todavía.": "Liginde henüz hiç hareket yok.",


		"Tu vestuario sigue igual: ni una alta ni una baja.":
			"Soyunma odan aynı: ne gelen var ne giden.",
		"Sin club: nadie entra ni sale de un vestuario que no tienes.":
			"Kulüp yok: olmayan bir soyunma odasına kimse girip çıkmaz.",
		"El mercado todavía no se ha movido.": "Piyasa henüz hareketlenmedi.",
		"EN TU VESTUARIO": "SOYUNMA ODAN",
		"MANTÉN · TRASPASO": "TUT · TRANSFER",
		"MANTÉN · CESIÓN": "TUT · KIRALIK",
		"VENDIDO": "SATILDI",
		"LLEGA": "GELDI",
		"SE VA": "GITTI",
		"DEJA EL CLUB": "AYRILIYOR",



		"{0} ALTA": "{0} GELEN",
		"{0} ALTAS": "{0} GELEN",
		"{0} BAJA": "{0} GIDEN",
		"{0} BAJAS": "{0} GIDEN",
		"De {0} a {1}": "{0} → {1}",
		"Cedido de {0} a {1}": "Kiralık: {0} → {1}",
		"Deja {0}": "Ayrılıyor: {0}",
		"LIBRE": "SERB.",
		"ERES AGENTE LIBRE": "SERBEST OYUNCUSUN",
		"Tu contrato terminó. Fichas SIN traspaso (Bosman): el club se ahorra el fee y"
		+ " una parte es tu PRIMA de fichaje. El rol que te espera se dice antes de firmar"
		+ " — elige con cabeza.":
			"Sözleşmen bitti. BONSERVISSIZ imzalarsın (Bosman): kulüp bonservis bedelinden tasarruf eder ve bir kısmı senin imza PRIMIN olur. Seni bekleyen rol imzadan önce söylenir — akıllıca seç.",
		"Tu valor: $ {0}": "Değerin: $ {0}",
		"Ningún club por ahora. Vuelve a intentarlo más tarde.":
			"Şimdilik kulüp yok. Daha sonra tekrar dene.",
		"{0} OPCIONES A TU NIVEL": "SEVIYENDE {0} SEÇENEK",
		"TU CLUB QUIERE RETENERTE": "KULUBUN SENI TUTMAK ISTIYOR",
		"Te mejora el contrato para que te quedes:":
			"Kalman için sözleşmeni iyileştiriyorlar:",
		"Sueldo: ${0} por partido (ahora ${1})": "Maaş: maç başı ${0} (şu an ${1})",
		"Contrato: {0} temporadas": "Sözleşme: {0} sezon",
		"Eres un ídolo de la casa: {0} temporadas aquí.":
			"Kulübün efsanesisin: burada {0} sezon.",
		"RENOVAR Y QUEDARME": "YENILE VE KAL",
		"RENOVADO · TE QUEDAS": "YENILENDI · KALIYORSUN",
		"EL CLUB NECESITA VENDERTE": "KULUP SENI SATMAK ZORUNDA",


		"RIESGO DE VENTA": "SATIS RISKI",
		"VENTANA EN {0}J": "DONEM: {0} HF",
		"POR TU GRADA": "TRIBUN ISTEDI",
		"AFICIÓN A {0}": "TARAFTAR {0}",
		"Y ESTÁS A SALVO": "VE GUVENDESIN",
		"SALVO ASCENSO": "ÇIKARSA HARIÇ",
		"O EUROPA": "YA DA AVRUPA",
		"En {0} no pueden pagarte: venderte les cuadra las cuentas. Negarte tiene precio en el vestuario:":
			"{0} kulübü maaşını ödeyemiyor: seni satmak hesaplarını dengeliyor. Reddetmenin soyunma odasında bir bedeli var:",
		"Negarte: técnico {0} · equipo {1} · afición {2}":
			"Reddedersen: hoca {0} · takım {1} · taraftar {2}",


		"El club te quiso vender y te plantaste. Después de este año, te lo"
			+ " reconocen: el vestuario te lo devuelve.":
			"Kulüp seni satmak istedi, sen direndin. Bu sezondan sonra hakkını veriyorlar: soyunma odası karşılığını ödüyor.",
		"TENÍAS RAZÓN": "HAKLIYDIN",
		"Te querían vender y dijiste que no. El año te dio la razón, y el"
			+ " club sale a decirlo delante de todos.":
			"Seni satmak istediler, hayır dedin. Sezon seni haklı çıkardı ve kulüp bunu herkesin önünde söylüyor.",
		"HAY OTRA MANERA": "BASKA YOLU VAR",
		"ENTONCES, PON TÚ": "O ZAMAN SEN ODE",
		"El director deportivo te escucha y no dice que no. Pero el agujero"
			+ " de {0} sigue ahí, y si no sale de tu traspaso tiene que salir de tu"
			+ " contrato. Elige por dónde.":
			"Sportif direktör seni dinliyor ve hayır demiyor. Ama {0} kulübünün açığı hâlâ orada; transferinden çıkmazsa sözleşmenden çıkmak zorunda. Nereden olacağını seç.",
		"FICHA: {0}/sem": "MAAS: {0}/hafta",
		"CLÁUSULA: {0}": "MADDE: {0}",
		"O te quedas pagándolo tú: el club retira la venta dos temporadas y"
			+ " refuerza en el próximo mercado de verano. Elige por dónde pagas.":
			"Ya da kalıp faturayı sen ödersin: kulüp satışı iki sezon askıya alır ve sonraki yaz döneminde takviye yapar. Nasıl ödeyeceğini seç.",
		"ME BAJO LA FICHA A {0}/sem": "MAASIM {0}/hafta OLSUN",
		"¿TE BAJAS LA FICHA?": "MAAS INDIRIMI?",
		"Cobras menos lo que reste de contrato, pero el club retira la venta"
			+ " y refuerza. Sigues libre de salir cuando quieras.":
			"Sözleşmenin kalanında daha az kazanırsın ama kulüp satıştan vazgeçer ve takviye yapar. İstediğin zaman gitmekte yine özgürsün.",
		"ME SUBO LA CLÁUSULA A {0}": "MADDEMI {0} YAP",
		"¿TE SUBES LA CLÁUSULA?": "MADDE ARTISI?",
		"No cobras menos, pero te blindas: salir de aquí costará mucho más y"
			+ " firmas {0} temporada más.":
			"Daha az kazanmazsın ama kendini kilitlersin: buradan ayrılmak çok daha pahalı olur ve {0} sezon daha imzalarsın.",
		"ACEPTO SALIR": "GIDERIM",
		"¿ACEPTAS SALIR?": "GITMEYE RAZI?",
		"El club te ofrecerá a quien pregunte y verás más ofertas. Sigues jugando"
		+ " mientras tanto.":
			"Kulüp seni soran herkese teklif edecek ve daha çok teklif göreceksin. Bu arada oynamaya devam ediyorsun.",
		"ACEPTO": "KABUL",
		"ME NIEGO": "HAYIR",
		"¿TE NIEGAS A SALIR?": "GITMIYOR MUSUN?",
		"Te quedas, pero el club contaba con ese traspaso: bajan técnico, equipo y"
		+ " afición.":
			"Kalıyorsun ama kulüp o bonservise güveniyordu: hoca, takım ve taraftar düşüyor.",
		"ME QUEDO": "KALIYORUM",
		"EL CLUB TE BUSCA MINUTOS": "KULUP SANA SURE ARIYOR",
		"En {0} no cuentan contigo para jugar y no te lo ocultan: te ofrecen salir"
		+ " CEDIDO una temporada, a un club donde seas titular. Puedes negarte, pero te"
		+ " quedas justo donde no juegas.":
			"{0} kulübü seni oynatmayı düşünmüyor ve bunu saklamıyor: ilk 11 oynayacağın bir kulübe bir sezonluk KIRALIK gitmeyi teklif ediyorlar. Reddedebilirsin ama tam da oynamadığın yerde kalırsın.",
		"Negarte: técnico {0} · equipo {1} · y esta temporada, ni la copa":
			"Reddedersen: hoca {0} · takım {1} · ve bu sezon kupa bile yok",
		"Destino: {0}": "Hedef: {0}",
		"ME VOY CEDIDO": "KIRALIK GIDERIM",
		"¿SALIR CEDIDO?": "KIRALIK MI?",
		"Una temporada jugando de titular en un club menor. Vuelves al terminar, y"
		+ " creces más rápido mientras estás fuera.":
			"Bir sezon küçük bir kulüpte ilk 11'de oynarsın. Sezon bitince dönersin ve dışarıdayken daha hızlı gelişirsin.",
		"ME VOY": "GIDIYORUM",
		"¿TE QUEDAS?": "KALMAK MI?",
		"Seguirás sin jugar y el técnico se lo tomará mal. Esta temporada perderás"
		+ " hasta los partidos de rotación.":
			"Yine oynamayacaksın ve hoca bunu kötü karşılayacak. Bu sezon rotasyon maçlarını bile kaybedeceksin.",
		"TU CLUB NO TE VENDE": "KULUBUN SENI SATMIYOR",
		"Con contrato largo y rindiendo, tu club prefiere retenerte. Puedes forzar la"
		+ " salida, pero el técnico, el vestuario y la afición lo pagarán.":
			"Uzun sözleşmen var ve iyi oynuyorsun, kulübün seni tutmak istiyor. Ayrılığı zorlayabilirsin ama hoca, soyunma odası ve taraftar bunu sana ödetir.",
		"PEDIR EL TRASPASO": "TRANSFER TALEP ET",
		"¿PEDIR EL TRASPASO?": "TRANSFER TALEBI MI?",
		"Tu club dejará de retenerte, pero el vestuario se lo tomará como una traición:"
		+ " bajan técnico, equipo y afición.":
			"Kulübün seni tutmayı bırakır ama soyunma odası bunu ihanet sayar: hoca, takım ve taraftarla ilişkin düşer.",
		"LO PIDO": "ISTIYORUM",
		"Nadie suena por ti todavía. Rinde y hazte ver.":
			"Henüz adın kimseyle anılmıyor. İyi oyna ve kendini göster.",
		"TE SIGUEN": "SENI IZLIYORLAR",
		"Rumores de cara a la próxima ventana. Puedes darle pie a uno para que apriete"
		+ " —pero tu vestuario lo notará—.":
			"Bir sonraki transfer dönemi öncesi söylentiler var. Birine bastırması için yeşil ışık yakabilirsin —ama soyunma odan bunu fark eder—.",
		"Te siguen de cerca": "Seni yakından izliyorlar",
		"Interés serio": "Ciddi ilgi",
		"Suena flojo": "Sadece fısıltı",
		"Va {0} de {1} en su liga · {2}": "Liginde {0} sırada ({1} takım) · {2}",
		"LE DISTE PIE": "ONAY VERDIN",
		"LE DISTE PIE · APRETARÁ EN LA VENTANA":
			"ONAY VERDIN · TRANSFERDE BASTIRACAK",
		"MOSTRAR INTERÉS": "ILGI GOSTER",
		"¿MOSTRAR INTERÉS EN {0}?": "{0} ICIN ILGI GOSTER?",
		"Le das pie para que apriete en la próxima ventana. Tu vestuario lo nota: bajan"
		+ " un poco técnico, equipo y afición.":
			"Bir sonraki dönemde bastırması için yeşil ışık yakıyorsun. Soyunma odan bunu fark eder: hoca, takım ve taraftarla ilişkin biraz düşer.",
		"LE DOY PIE": "ONAY VERIYORUM",
		"NO ME INTERESA":
			"ILGILENMIYORUM",
		"¿DESCARTAR A {0}?":
			"{0} ELENSIN MI?",
		"DESCARTAR":
			"ÇIKAR",
		"Dejas de verlo entre los que te siguen y su sitio lo ocupa otro club interesado. No cuesta nada: todavía no hay ninguna oferta que rechazar. Vuelven a sonar la próxima temporada.":
			"Seni izleyenler arasından çıkar ve yerini ilgilenen başka bir kulüp alır. Bedeli yok: henüz reddedilecek bir teklif yok. Gelecek sezon adı yeniden geçebilir.",
		"TU EX":
			"ESKI",
		"Volver a un club TUYO es mucho más fácil: allí ya saben quién eres y tu agente entra por la puerta grande.":
			"Eski bir kulübüne dönmek çok daha kolay: orada seni zaten tanıyorlar ve menajerin kapıdan elini kolunu sallayarak girer.",
		"Ya le diste pie a otro club.": "Zaten başka bir kulübe yeşil ışık yaktın.",
		"CEDIDO": "KIRALIK",
		"Perteneces a {0}: vuelves al cerrar la temporada.":
			"{0} kulübüne aitsin: sezon bitince dönersin.",
		"¿QUIERES MÁS MINUTOS?": "DAHA ÇOK SURE MI?",
		"Puedes pedir salir CEDIDO a un club menor donde juegues de titular. De joven,"
		+ " además, crecerás más rápido jugando.":
			"İlk 11'de oynayacağın küçük bir kulübe KIRALIK gitmeyi isteyebilirsin. Gençken oynayarak daha hızlı da gelişirsin.",
		"PEDIR SALIR CEDIDO": "KIRALIK ISTE",
		"¿PEDIR SALIR CEDIDO?": "KIRALIK ISTER MISIN?",
		"Buscarás minutos en un club menor durante una temporada. El técnico lo nota un"
		+ " poco, pero entiende que quieras jugar.":
			"Bir sezon boyunca küçük bir kulüpte süre arayacaksın. Hoca biraz bozulur ama oynamak istemeni anlar.",



		"PEDISTE SALIR": "GITMEK ISTEDIN",
		"¿QUIERES SALIR?": "GITMEK MI?",
		"PEDISTE SALIR CEDIDO": "KIRALIK GITMEK ISTEDIN",
		"TE QUIEREN A PRÉSTAMO": "KIRALIK ISTIYORLAR",
		"Tu club no cuenta contigo. Cedido tendrías sitio en el once — y volverías con"
		+ " el crédito que te ganes.":
			"Kulübün sana güvenmiyor. Kiralık gidersen ilk 11'de yerin olur — ve kazandığın itibarla dönersin.",
		"Cesión una temporada · misma ficha · TITULAR probable":
			"Bir sezonluk kiralık · aynı maaş · muhtemelen ILK 11",
		"IRTE CEDIDO": "KIRALIK GIT",
		"MANTÉN PARA IRTE CEDIDO": "KIRALIK ICIN BASILI TUT",
		"¿IRTE CEDIDO A {0}?": "KIRALIK: {0}?",
		"Una temporada fuera para jugar de verdad. Tu contrato sigue siendo del club"
		+ " dueño.":
			"Gerçekten oynamak için bir sezon dışarıda. Sözleşmen hâlâ asıl kulübüne ait.",
		"PREGUNTARON POR TI": "SENI SORDULAR",


		"ES TU RIVAL · NO TE LO PERDONARÁN": "EZELI RAKIP · ASLA AFFETMEZLER",



		"SE ACABÓ EL TIEMPO": "SURE DOLDU",
		"SE ENFRÍAN": "SOGUYORLAR",
		"NUEVO": "YENI",
		"SUBEN EL SUELDO": "MAAŞ ARTIYOR",


		"TE BAJARON EL SUELDO": "MAAŞIN DUŞURULDU",
		"NEGOCIAR TU SUELDO": "MAAŞINI KONUŞ",

		"NEGOCIAR MI SUELDO": "MAAŞIMI KONUŞ",
		"YA NEGOCIASTE ESTA TEMPORADA": "BU SEZON ZATEN KONUŞTUN",
		"Ya negociaste tu ficha esta temporada.":
			"Bu sezon maaşını zaten konuştun.",
		"YA NEGOCIASTE CON ELLOS": "ONLARLA ZATEN PAZARLIK ETTIN",
		"YA PAGAN SU TOPE": "ZATEN TAVANI ODUYORLAR",
		"SIN OFERTA": "TEKLIF YOK",
		"TE OFRECEN DE SUELDO POR PARTIDO": "MAÇ BAŞI MAAŞ TEKLIFI",


		"MANTÉN PARA ACEPTAR ${0}": "{0} ICIN BASILI TUT",

		"MANTÉN PARA SALIR CON ${0}": "{0} ILE AYRIL: BASILI TUT",
		"MANTÉN PARA SALIR": "BASILI TUT: AYRIL",
		"MANTÉN PULSADO": "BASILI TUT",
		"RETIRAN LA OFERTA · SE ACABÓ": "TEKLIF GERI ÇEKILDI · BITTI",
		"SE LEVANTAN DE LA MESA · SE ACABÓ": "MASADAN KALKTILAR · BITTI",
		"ESTÁ A PUNTO DE CORTAR · ROMPE EL HIELO O CIERRA":
			"MASAYI TERK ETMEK UZERE · BUZU KIR YA DA KAPAT",
		"Si pides más, pueden subirlo… o bajarlo": "Daha fazla istersen artırabilirler… ya da düşürebilirler",
		"Pediste {0} vez(ces) · llegaste con ${1}": "{0} kez istedin · masaya ${1} ile oturdun",
		"TU AGENTE TE MIRA: ES EL MOMENTO": "MENAJERIN SANA BAKIYOR: TAM ZAMANI",
		"Lo consultan…": "Danışıyorlar…",
		"PODEMOS LLEGAR AHÍ  (+{0})": "ORAYA ÇIKABILIRIZ  (+{0})",
		"ENTONCES REVISAMOS LA OFERTA  (−{0})":
			"TEKLIFI GOZDEN GEÇIRIRIZ  (−{0})",
		"MEJOR ROL": "ROL ARTIŞI",
		"SE PLANTARON": "DIRENDILER",
		"SE RETIRAN": "ÇEKILDILER",
		"LO RECHAZASTE": "REDDETTIN",
		"NADIE OCUPÓ EL HUECO": "YERI KIMSE ALMADI",
		"VUELVE DE CESIÓN": "KIRALIKTAN DONUŞ",
		"SE QUEDAN AL CEDIDO": "BONSERVISI ALINDI",
		"SE FUERON": "GITTILER",

		"CIERRA": "BITER",
		"{0} J": "{0} H",
		"FAMA": "ŞOHRET",
		"CÓMO TE FICHAN": "SENI NASIL ALIRLAR",
		"Un club mira cuatro cosas —fama, nivel, forma y PRESTIGIO— y te juzga"
		+ " por la MÁS FLOJA: para que te busque un grande tienes que ser bueno en las"
		+ " cuatro a la vez.\n\nEl PRESTIGIO es lo que hiciste el año pasado: dónde"
		+ " quedaste en el Balón de Oro, o lo más grande que levantaste. Los tres"
		+ " primeros dicen cómo juegas HOY; éste dice de quién se habló en junio, y es"
		+ " el que abre la puerta de los más grandes.\n\nDentro de la ventana, lo que"
		+ " hagas en el campo mueve las ofertas: hay clubes que entran y clubes que se"
		+ " van. Tu agente decide CUÁNTAS de las que existen llegan hasta ti.":
			"Bir kulüp dört şeye bakar —şöhret, seviye, form ve PRESTIJ— ve seni EN ZAYIF olanına göre yargılar: büyük bir kulübün seni istemesi için dördünde birden iyi olmalısın.\n\nPRESTIJ geçen yıl yaptıklarındır: Yılın Oyuncusu oylamasında kaçıncı olduğun ya da kaldırdığın en büyük kupa. İlk üçü BUGUN nasıl oynadığını söyler; bu ise haziranda kimden bahsedildiğini söyler ve en büyüklerin kapısını açan odur.\n\nTransfer döneminde sahada yaptıkların teklifleri oynatır: kimi kulüp gelir, kimi gider. Var olan tekliflerden KAÇININ sana ulaşacağına menajerin karar verir.",
		"PRESTIGIO": "PRESTIJ",
		"Te falta PRESTIGIO: acaba alto en la votación del Jugador del Año o levanta algo.":
			"PRESTIJ eksik: Yılın Oyuncusu'nda üst sıralarda bitir ya da bir kupa kaldır.",
		"Tu prestigio viene de haber sido {0}º del mundo.":
			"Prestijin dünyada {0}. olmandan geliyor.",
		"Tu prestigio lo sostiene lo que ganaste: {0}.":
			"Prestijini kazandıkların ayakta tutuyor: {0}.",
		"Quedaste {0}º en el Jugador del Año: del {1}º en adelante el puesto ya no cuenta.":
			"Yılın Oyuncusu'nda {0}. oldun: {1}. sıradan sonrası artık sayılmıyor.",
		"No tienes prestigio: ni entraste en la gala ni levantaste nada.":
			"Prestijin yok: ne galaya girdin ne de bir şey kaldırdın.",
		"TRASPASO SIN PACTAR": "BEDEL ANLAŞMASI YOK",
		"Ofrecen {0} · tu club pide {1} · faltan {2}":
			"Teklif: {0} · kulübün istediği: {1} · eksik: {2}",
		"PELEAN POR TI ({0} MÁS)": "KAPIŞIYORLAR ({0} DAHA)",
		"EJERCEN LA RECOMPRA": "GERI ALIM DEVREDE",
		"LO QUE SE GUARDARON": "SAKLI HAKLAR",
		"{0} se lleva el {1}% de tu próximo traspaso (hoy serían {2}).":
			"{0} sonraki transferinden %{1} alır (bugün {2} eder).",
		"{0} puede recomprarte por {1}{2}.": "{0} seni geri alabilir: {1}{2}.",
		" (ya caducó)": " (süresi doldu)",
		"AHÍ NO LLEGAS": "ULAŞAMAZSIN",
		"DÉJALO": "BOŞVER",
		"LLAMA IGUAL": "YINE ARA",
		"En NEGRITA los que hoy te ficharían si tu agente les entra. Los demás puedes"
		+ " pedirlos igual, pero te dirá que no.":
			"KALIN yazılanlar, menajerin ulaşırsa bugün seni alacak olanlar. Diğerlerini de isteyebilirsin ama eli boş döner.",
		"ENTENDIDO": "ANLADIM",
		"SE VAN MAÑANA": "YARIN GIDIYOR",

		"REBAJADO: FIN DE CONTRATO": "UCUZ: SOZLEŞME BITIYOR",

		"VINO A VERTE": "IZLEMEYE GELDI",
		"TE SIGUE": "TAKIPTE",
		"TE QUIERE": "ISTIYOR",
		"VA EN SERIO": "ÇOK CIDDI",
		"Ya elegiste: tu junio tiene dueño. Ningún otro club puede moverte.": "Seçimini yaptın: haziranın belli. Başka hiçbir kulüp seni alamaz.",

		"SOLO LIGA Y COPA": "LIG VE KUPA",

		"NEGOCIAR…": "PAZARLIK…",

		"PEDIR TRASPASO": "TRANSFER ISTE",
		"PEDIR CESIÓN": "KIRALIK ISTE",
		"Pedir el TRASPASO te pone en LISTA DE VENTA: tu club te ofrece a quien"
		+ " pregunte y llegan más ofertas — pero el vestuario lo paga y el técnico"
		+ " te da MENOS minutos mientras no salgas: ya dijiste que te vas.\n\nSi no"
		+ " eres titular, puedes pedir salir CEDIDO a un club menor donde juegues:"
		+ " de joven, además, creces más rápido jugando.":
			"TRANSFER istemek seni SATIŞ LISTESINE sokar: kulübün seni soran herkese önerir ve daha çok teklif gelir — ama bunun bedelini soyunma odası öder ve sen gidene kadar hoca sana DAHA AZ süre verir: gideceğini söyledin.\n\nİlk 11'de değilsen, oynayacağın küçük bir kulübe KIRALIK gitmeyi isteyebilirsin: gençken oynayarak daha hızlı da gelişirsin.",
		"Estás EN LISTA DE VENTA: tu club ya no te retiene y te ofrece a quien"
		+ " pregunte. Cada ventana te trae más ofertas."
		+ " Mientras no salgas, el técnico te da menos minutos.":
			"SATIŞ LISTESINDESIN: kulübün artık seni tutmuyor ve soran herkese öneriyor. Her transfer dönemi daha çok teklif getirir. Sen gidene kadar hoca sana daha az süre verir.",
		"Te pones EN LISTA DE VENTA: el club deja de retenerte y te ofrece a"
		+ " quien pregunte. El vestuario se lo toma a mal: bajan técnico, equipo y"
		+ " afición. Y mientras no salgas, el técnico te dará MENOS MINUTOS por"
		+ " bien que juegues: ya dijiste que te vas.":
			"SATIŞ LISTESINE giriyorsun: kulüp seni tutmayı bırakır ve soran herkese önerir. Soyunma odası bunu kötü karşılar: hoca, takım ve taraftarla ilişkin düşer. Ve sen gidene kadar ne kadar iyi oynarsan oyna hoca sana DAHA AZ SURE verir: gideceğini söyledin.",

		"DESDE VERANO": "YAZ DONEMI",

		"BUSCAN DELANTERO": "FORVET ARIYORLAR",

		"PRECIO DE ENERO": "OCAK FIYATI",

		"TRAYECTORIA +{0}%": "GEÇMIŞ +%{0}",
		"TROTAMUNDOS −{0}%": "GEZGIN −%{0}",

		"YA FICHARON DE TU CLUB ({0})": "KULUBUNDEN ALDILAR ({0})",
		"SUELEN FICHAR DE TU LIGA": "LIGINDEN SIK ALIRLAR",

		"VUELVES A CASA": "EVE DONUŞ",
		"TU EX CLUB": "ESKI KULUP",

		"VUELVE CEDIDO A CASA": "EVINE KIRALIK DONUŞ",

		"PAGAN LA CLÁUSULA": "MADDE ODENDI",
		"CLÁUSULA DE RESCISIÓN": "SERBEST KALMA BEDELI",

		"TE PREGUNTAN POR EL RUMOR": "SANA SOYLENTIYI SORUYORLAR",
		"Se sabe que {0} te sigue y la prensa te pone el micro delante. Lo que digas"
		+ " lo oyen todos: tu grada y su despacho.":
			"{0} kulübünün seni izlediği biliniyor ve basın önüne mikrofonu uzatıyor. Ne dersen herkes duyar: senin tribünün ve onların yönetimi.",
		"NO ME CIERRO A NADA": "HER ŞEYE AÇIGIM",
		"ESTOY CENTRADO AQUÍ": "ODAGIM BURADA",

		"RETIRAR LA PETICIÓN": "TALEBI GERI ÇEK",
		"¿RETIRAR LA PETICIÓN?": "GERI ÇEKILSIN MI?",

		"CUMPLE LO DICHO": "SOZUNU TUTUYOR",
		"CONTRADICE LO DICHO": "SOZUNU BOZUYOR",
		"DIJISTE: {0}": "SOYLEDIN: {0}",
		"TE COMPROMETE: {0}": "SOZ VERDIN: {0}",
		"IR DONDE JUEGUES MÁS": "DAHA ÇOK OYNAMAK",
		"IR A UN CLUB MAYOR": "DAHA BUYUK KULUP",
		"IRTE DE ESTE CLUB": "BU KULUPTEN GIT",

		"PIDE SALIR": "AYRILIK",
		"{0} pide salir cedido para jugar más": "{0} daha çok oynamak için kiralık gitmek istiyor",
		"{0} busca una cesión donde lo vean": "{0} görüneceği bir kiralık arıyor",

		"NO RENUEVA": "UZATMIYOR",
		"PRECONTRATO · {0}": "ON SOZLEŞME · {0}",
		"EN JUNIO": "HAZIRAN",
		"RENUEVA": "UZATIR",
		"SE VA LIBRE": "BEDELSIZ",
		"PRECONTRATO": "ON SOZLEŞME",
		"{0} renueva con el {1} hasta {2}": "{0}, {1} ile sözleşmesini {2} yılına kadar uzattı",
		"{0} no renovará con el {1}: se va libre en junio": "{0}, {1} ile sözleşme uzatmayacak: haziranda bedelsiz ayrılıyor",
		"{0} firma un precontrato con el {1}": "{0}, {1} ile ön sözleşme imzaladı",
		"{0} pide una cesión: no ve futuro en el {1}": "{0} kiralık istiyor: {1} kulübünde gelecek görmüyor",
		"{0} se ofrece para salir cedido": "{0} kiralık gitmeye gönüllü",
		"{0} pide salir del {1}: quiere jugar más":
			"{0}, {1} kulübünden ayrılmak istiyor: daha çok oynamak istiyor",
		"{0} pide salir del {1} y busca un club mayor":
			"{0}, {1} kulübünden ayrılıp daha büyük bir kulüp arıyor",
		"{0} no cree en el proyecto del {1} y pide salir":
			"{0}, {1} kulübünün projesine inanmıyor ve ayrılmak istiyor",
		"{0} pide salir del {1}": "{0}, {1} kulübünden ayrılmak istiyor",
		"Dijiste «{0}», y te vas a donde dijiste.":
			"«{0}» dedin ve tam dediğin yere gidiyorsun.",
		"Dijiste «{0}». Acabas firmando otra cosa.":
			"«{0}» dedin. Sonunda başka bir şeye imza atıyorsun.",

		"¿POR QUÉ TE QUIERES IR?": "NEDEN GITMEK ISTIYORSUN?",
		"EL DIRECTOR DEPORTIVO": "SPORTIF DIREKTOR",
		"BUSCO MÁS MINUTOS": "DAHA ÇOK SURE",
		"QUIERO UN CLUB MEJOR": "DAHA BUYUK KULUP",
		"NO CREO EN EL PROYECTO": "PROJEYE INANMIYORUM",
		"QUIERO JUGAR": "OYNAMALIYIM",
		"QUIERO QUE ME VEAN": "GORUNMEK ISTIYORUM",
		"AQUÍ NO TENGO FUTURO": "BURADA GELECEGIM YOK",
		"ME LO PIENSO": "DUŞUNECEGIM",
		"NADA, OLVÍDELO": "BOŞVERIN",
		"YA LO JUEGAS TODO": "ZATEN HEP OYNUYORSUN",
		"TE BUSCAMOS SITIO.": "SANA YER BULURUZ.",
		"PUES QUE PAGUEN LO QUE VALES.": "O ZAMAN DEGERINI ODESINLER.",
		"AQUÍ NO SE REGALA A NADIE.": "BURADA KIMSE BEDAVA VERILMEZ.",
		"EL PROYECTO SIGUE, CONTIGO O SIN TI.": "PROJE SENLE DE SENSIZ DE SURER.",
		"NO TE FALTA RAZÓN.": "HAKSIZ DEGILSIN.",
		"ME DUELE, PERO TE ENTIENDO. VUELVE MEJOR.": "UZULUYORUM AMA ANLIYORUM. DAHA IYI DON.",
		"JUEGA FUERA Y A LA VUELTA HABLAMOS.": "GIT OYNA, DONUNCE KONUŞURUZ.",
		"TE BUSCAMOS UN SITIO DONDE JUGAR.": "SANA OYNAYACAGIN BIR YER BULURUZ.",
		"AQUÍ TAMBIÉN SE JUEGA SI TE LO GANAS.": "HAK EDERSEN BURADA DA OYNARSIN.",
		"HACES BIEN.": "DOGRUSU BU.",
		"Antes de ponerte en la lista quiere oírlo de tu boca. Lo que le digas decide a quién llama y cuánto pide por ti.": "Seni listeye koymadan önce bunu kendi ağzından duymak istiyor. Ona ne söylediğin kimi arayacağını ve senin için ne kadar isteyeceğini belirler.",
		"{0} te para en el pasillo, junto a la lista. Quiere saber por qué pides salir cedido.": "{0} seni koridorda, kadro listesinin yanında durduruyor. Neden kiralık gitmek istediğini bilmek istiyor.",
		"EL EQUIPO SE HUNDE": "TAKIM BATIYOR",
		"PELEÁIS ARRIBA": "ZIRVE YARIŞINDASINIZ",
		"ÍDOLO DE LA GRADA": "TRIBUNUN IDOLU",
		"RECIÉN LLEGADO": "YENI GELEN",
		"YA LO DIJISTE ANTES": "BUNU DAHA ONCE DEDIN",
		"HOY NADIE MÁS GRANDE": "BUGUN DAHA IYISI YOK",
		"HOY NO PREGUNTA NADIE": "BUGUN SORAN YOK",
		"SIN DESTINO HOY": "BUGUN HEDEF YOK",
		"PIDEN {0}": "BEDEL {0}",

		"Tu mercado ya no abre esta temporada: podrás pedir salir cuando abra el"
		+ " de verano.":
			"Bu sezon transfer dönemin artık açılmıyor: yaz dönemi açılınca ayrılmak isteyebilirsin.",
		"Disculpa pública: sales de la lista de venta. La afición se lo cobra, y el"
		+ " técnico tardará un par de partidos en volver a contar contigo — dijiste"
		+ " que te ibas.":
			"Kamuoyu önünde özür: satış listesinden çıkıyorsun. Taraftar bunun hesabını sorar ve hoca sana yeniden güvenmek için birkaç maç bekler — gideceğini söylemiştin.",
		"RETIRASTE LA PETICIÓN": "TALEBI GERI ÇEKTIN",

		"Sube de la cantera de {0}": "{0} altyapısından yükseldi",
		"CANTERA": "ALTYAPI",

		"LA BOMBA DEL CIERRE": "SON GUN BOMBASI",

		"Opción de compra pactada: $ {0}": "Anlaşılan satın alma opsiyonu: $ {0}",
		"EJECUTAN LA OPCIÓN": "OPSIYON KULLANILDI",
		"{0} quiere que vuelvas: pide repetir la cesión y puja por ti": "{0} geri dönmeni istiyor: kiralığı yenilemek istiyor ve senin için teklif veriyor",
		"{0} quiere que vuelvas: pide repetir la cesión": "{0} geri dönmeni istiyor: kiralığı yenilemek istiyor",
		"{0} quiere que vuelvas: intentará comprarte": "{0} geri dönmeni istiyor: seni satın almayı deneyecek",
		"{0} quería que volvieras, pero tu club cuenta contigo": "{0} geri dönmeni istiyordu ama kulübün sana güveniyor",
		"{0} ejecuta la opción de compra pactada":
			"{0} anlaşılan satın alma opsiyonunu kullanıyor",

		"ENCARGO AL AGENTE…": "MENAJERE GOREV…",

		"{0} LIBRES": "{0} KALDI",

		"ENCARGOS": "GOREVLER",
		"CONFIANZA": "GUVEN",
		"TU DINERO": "PARAN",
		"CUESTA VESTUARIO": "TAKIM KIZAR",
		"La cifra de cada botón es LO QUE TE COBRA por ese encargo, y sale de tu bolsillo al momento. Tienes ${0}.":
			"Her düğmedeki rakam, o görev için SENDEN ALDIGI ücrettir ve hemen cebinden çıkar. ${0} paran var.",
		"TU AGENTE": "MENAJERIN",
		"MUÉVEME POR EL MERCADO": "BENI PAZARLA",
		"BUSCA EN UNA LIGA…": "BIR LIGDE ARA…",
		"TOCA LA PUERTA DE UN CLUB…": "BIR KULUBUN KAPISINI ÇAL…",
		"¿QUÉ LIGA?": "HANGI LIG?",
		"¿QUÉ CLUB?": "HANGI KULUP",
		"TU AGENTE SE MUEVE": "MENAJERIN ÇALIŞIYOR",
		"LO TRAJO TU AGENTE": "MENAJERIN GETIRDI",
		"TU AGENTE NO PUDO": "MENAJERIN BAŞARAMADI",

		"TU MESA ESTÁ LLENA": "MASAN DOLU",
		"NO TRAS TU RECHAZO": "REDDETTIN, OLMAZ",
		"FUERA DE TU ALCANCE": "BOYUNU AŞAR",
		"YA ESTABA EN TU MESA": "ZATEN MASANDAYDI",
		"TRAJO A {0}": "GETIRDI: {0}",
		"El mercado cierra hoy: ya no hay tiempo para encargos.":
			"Transfer dönemi bugün kapanıyor: görevler için artık zaman yok.",
		"Tu agente trabaja la liga de {0}: sus clubes entran primero.":
			"Menajerin {0} liginde çalışıyor: o ligin kulüpleri önce gelir.",
		"Tu agente está tocando esa puerta: se sabe en la próxima jornada.":
			"Menajerin o kapıyı çalıyor: sonuç gelecek hafta belli olur.",
		"Tu agente te está moviendo: esta ventana entran más clubes.":
			"Menajerin seni pazarlıyor: bu dönem daha çok kulüp gelecek.",
		"FIRMAR PRECONTRATO": "ON SOZLEŞME IMZALA",
		"¿FIRMAR PRECONTRATO CON {0}?": "{0} ILE ON SOZLEŞME?",
		"Firmas para el VERANO: terminas la temporada aquí y al cierre te vas"
		+ " GRATIS, con tu prima. Tu mercado se cierra este año, no podrás renovar, y"
		+ " el técnico te dará menos minutos: ya sabe que te vas.":
			"YAZ için imzalıyorsun: sezonu burada bitirir, sonunda primini alarak BEDELSIZ gidersin. Transfer dönemin bu yıl kapanır, sözleşme uzatamazsın ve hoca sana daha az süre verir: gideceğini biliyor.",

		"Te vas a tu RIVAL: la grada no te lo perdona. Técnico −{0}, afición −{1}; cuanto más te quieren, más duele.": "RAKIBINE gidiyorsun: tribün bunu affetmez. Hoca −{0}, taraftar −{1}; seni ne kadar severlerse o kadar acıtır.",
		"Te vas a un club de tu LIGA: los tendrás enfrente. Técnico −{0}, afición −{1}.": "Kendi LIGINDEKI bir kulübe gidiyorsun: karşına çıkacaklar. Hoca −{0}, taraftar −{1}.",
		"Te vas a otra liga de tu PAÍS. Técnico −{0}, afición −{1}.": "Kendi ULKENDE başka bir lige gidiyorsun. Hoca −{0}, taraftar −{1}.",
		"Te vas al EXTRANJERO: se entiende más. Técnico −{0}, afición −{1}.": "YURT DIŞINA gidiyorsun: bu daha kolay kabul görür. Hoca −{0}, taraftar −{1}.",


		"PRECONTRATO FIRMADO": "ON SOZLEŞME TAMAM",
		"PRECONTRATO FIRMADO · TE VAS EN VERANO": "ON SOZLEŞME TAMAM · YAZIN GIDIYORSUN",
		"Al cerrar la temporada te vas GRATIS a {0}."
		+ " Ya elegiste destino: tu mercado está resuelto y juegas menos"
		+ " mientras tanto.":
			"Sezon bitince {0} kulübüne BEDELSIZ gidiyorsun. Hedefini seçtin: transfer işin bitti ve bu arada daha az oynuyorsun.",
		"Se cumple tu precontrato: llegas GRATIS a {0}":
			"Ön sözleşmen devrede: {0} kulübüne BEDELSIZ geliyorsun",

		"FIRMADO: {0}": "IMZA: {0}",
		"YA FIRMASTE CON {0}": "{0} ILE IMZALADIN",

		"TE CONSIGUE EL PRECONTRATO": "ON SOZLEŞMEYI AYARLADI",
		"TE GUARDAN EL {0}": "{0} SANA AYRILDI",
		"Ya firmaste con {0}: el técnico cuenta menos contigo.": "{0} ile zaten imzaladın: hoca sana daha az güveniyor.",

		"HITO": "KUPA",
		"SIN HITO": "KUPA YOK",
		"Tienes nivel de grande: te falta GANAR algo.":
			"Büyük kulüp seviyesindesin: şimdi bir şey KAZANMAN lazım.",
		"ABRE": "AÇIK",
		"EL AÑO QUE VIENE": "GELECEK SEZON",

		"LOS QUE TE SIGUEN": "SENI IZLEYENLER",
		"Clubes que preguntan por ti de cara a la próxima ventana. Puedes darle pie a UNO"
		+ " para que apriete cuando abra: llegará con oferta y su distintivo.\n\nNo sale"
		+ " gratis —el vestuario se entera de que miras fuera— y sólo se puede con un club"
		+ " por ventana.":
			"Bir sonraki transfer dönemi öncesi seni soran kulüpler. Dönem açılınca bastırması için BIRINE yeşil ışık yakabilirsin: teklifle ve kendi rozetiyle gelir.\n\nBedava değil —soyunma odası başka yerlere baktığını öğrenir— ve her dönemde yalnızca bir kulüple olur.",
		"DE CERCA": "YAKINDAN",
		"SERIO": "CIDDI",
		"FLOJO": "ZAYIF",
		"FUERA DE COPA": "KUPADAN ELENDI",
		"OCTAVOS": "SON 16",
		"CUARTOS": "ÇEYREK",
		"SEMIS": "YARI",
		"FINAL": "FINAL",

		"Sin traspaso (agente libre) · prima de fichaje: ${0}":
			"Bonservissiz (serbest oyuncu) · imza primi: ${0}",
		"Traspaso: ${0} · tu prima: ${1}": "Bonservis: ${0} · senin primin: ${1}",
		"Te esperan como: {0}": "Seni şu rolde istiyorlar: {0}",
		"Se retiran mañana": "Yarın çekiliyorlar",
		"Aguantan {0} jornadas más": "{0} hafta daha bekliyorlar",
		"ULTIMATUM: hoy o nunca": "ULTIMATOM: bugün ya da asla",
		"Ahora cobras ${0}/partido · esta oferta {1}%":
			"Şu an maç başı ${0} alıyorsun · bu teklif %{1}",
		"Un club por encima del tuyo": "Seninkinden üst seviye bir kulüp",
		"Un club por debajo del tuyo": "Seninkinden alt seviye bir kulüp",
		"Un club a tu nivel": "Senin seviyende bir kulüp",
		"FICHAR (LIBRE)": "BEDELSIZ IMZA",
		"Esperas respuesta a tu {0} (próxima jornada)":
			"{0} için yanıt bekliyorsun (gelecek hafta)",
		"petición de sueldo": "maaş talebi",
		"petición de titular": "ilk 11 talebi",
		"Ya negociaste esta oferta: sin más margen.":
			"Bu teklif için zaten pazarlık yaptın: başka pay kalmadı.",
		"PEDIR SER TITULAR": "ILK 11 ISTE",
		"PEDIR MÁS SUELDO": "ZAM ISTE",
		"TU CLUB NO TE DEJA SALIR": "KULUBUN BIRAKMIYOR",
		"FICHAR": "IMZALA",
		"que suban el sueldo": "maaşın artırılması",
		"que te fichen de titular": "ilk 11 olarak alınman",
		"¿NEGOCIAR CON {0}?": "{0} ILE PAZARLIK?",
		"Pides {0}. Responden la próxima jornada: pueden ceder, plantarse o RETIRAR la"
		+ " oferta.":
			"{0} istiyorsun. Gelecek hafta yanıt verecekler: geri adım atabilir, direnebilir ya da teklifi GERI ÇEKEBILIRLER.",
		"NEGOCIAR": "PAZARLIK",
		"NEGOCIACIÓN ABIERTA · RESPONDEN LA PRÓXIMA JORNADA":
			"PAZARLIK BAŞLADI · GELECEK HAFTA YANIT VERECEKLER",
		"RECHAZAR": "REDDET",
		"¿RECHAZAR A {0}?": "REDDET: {0}?",
		"Se retiran de la puja para siempre en este mercado. Otros clubes pueden ocupar"
		+ " su hueco, pero no hoy: se sabe en la próxima jornada.":
			"Bu transfer döneminde yarıştan tamamen çekilirler. Yerlerini başka kulüpler alabilir ama bugün değil: gelecek hafta belli olur.",
		"RECHAZO": "REDDET",
		"OFERTA RECHAZADA · SE BUSCA OTRO DESTINO":
			"TEKLIF REDDEDILDI · BAŞKA YER ARANIYOR",
		"¿FICHAR POR {0}?": "{0} ILE IMZA?",
		"Te esperan como {0}. Llegas al vestuario desde abajo: el puesto se gana.":
			"Seni {0} olarak istiyorlar. Soyunma odasına en alttan giriyorsun: forma kazanılır.",
		"FIRMO": "IMZALARIM",
		"Fichaje libre: sin traspaso, con prima de ${0}. Te esperan como {1}; el puesto"
		+ " se gana.":
			"Bonservissiz transfer: bedel yok, ${0} imza primi. Seni {1} olarak istiyorlar; forma kazanılır.",

		"ELIGE TU DORSAL": "NUMARANI SEÇ",
		"HAY DORSAL LIBRE": "BOŞ NUMARA VAR",
		"Te fichan como un acontecimiento y el club te deja elegir. Llevas el {0}, pero"
		+ " la camiseta que quieras es tuya.":
			"Seni büyük bir transfer olarak alıyorlar ve kulüp seçme hakkı veriyor. {0} numaralı formayı giyiyorsun ama istediğin numara senin.",
		"Se cerró el mercado y el club repasa los números. Llevas el {0}, y este año hay"
		+ " camiseta libre si la quieres.":
			"Transfer dönemi kapandı ve kulüp numaraları gözden geçiriyor. {0} numaralı formayı giyiyorsun ve istersen bu yıl boş forma var.",
		"PONERME EL {0}": "{0} OLSUN",
		"SEGUIR CON EL {0}": "{0} ILE DEVAM",
		"ELIGE OTRO": "BAŞKA SEÇ",
		"TU DORSAL EN EL CLUB": "KULUPTEKI NUMARAN",
		"RENUEVAS: TU DORSAL": "UZATTIN: NUMARAN",
		"Llegas nuevo y el club te deja escoger número. Llevas el {0}; si prefieres otro de los que están libres, es tuyo.": "Yeni geldin ve kulüp numara seçmene izin veriyor. {0} numaralı formayı giyiyorsun; boştakilerden başkasını istersen senin.",
		"Firmas con el club y aprovechas para repasar tu número. Llevas el {0}; si quieres otro de los que están libres, cámbialo.": "Kulüple imzalıyorsun ve numaranı gözden geçirme fırsatı buluyorsun. {0} numaralı formayı giyiyorsun; boştakilerden başkasını istersen değiştir.",
		"ELIGE TU NÚMERO": "NUMARANI SEÇ",
		"Te pones el {0}.": "{0} numarayı alıyorsun.",
		"Sigues con el {0}.": "{0} numarayla devam ediyorsun.",
		"BOTAS": "KRAMPON",
		"OFERTA DE LA JORNADA": "HAFTANIN FIRSATI",
		"OFERTA": "FIRSAT",
		"ANTES ${0}": "ESKI ${0}",
		"Sólo estética: pintan tus botas en el partido y en las escenas, y no cambian sus bonos. Se ponen en TIENDA, en BOTAS.": "Sadece görünüm: maçta ve sahnelerde kramponlarını boyar, bonuslarını değiştirmez. MAGAZA'da, KRAMPON bölümünden giyilir.",
		"+ {0} PUNTOS": "+ {0} PUAN",
		"Sólo color, no da bonos. Es tuya hasta que empieces otra carrera.": "Sadece renk, bonus vermez. Yeni bir kariyere başlayana kadar senin.",
		"PINTA TUS BOTAS": "KRAMPONUNU BOYAR",
		"YA LA TIENES: SE PONE EN TIENDA, EN BOTAS": "ZATEN SENDE: MAGAZA, KRAMPON BOLUMU",
		"SE PONE EN TIENDA, EN BOTAS": "MAGAZA, KRAMPON BOLUMU",
		"Tus botas estrenan la {0}.": "Kramponlarında artık {0} var.",
		"TUS EDICIONES": "SERILERIN",
		"SIN EDICIÓN": "SERI YOK",
		"EDICIÓN DEBUT": "DEBUT SERISI",
		"EDICIÓN ASCENSO": "TERFI SERISI",
		"EDICIÓN ORO": "ALTIN SERI",
		"EDICIÓN NOCHE": "GECE SERISI",
		"EDICIÓN FUEGO": "ATEŞ SERISI",
		"EDICIÓN HIELO": "BUZ SERISI",
		"EDICIÓN NEÓN": "NEON SERISI",
		"PACK DEBUT": "ILK PAKET",
		"PACK ASCENSO": "TERFI PAKETI",
		"PACK JUGADOR DEL AÑO": "Y.OYUNCUSU PAKETI",
		"EL QUE MÁS RINDE": "EN AVANTAJLI",
		"ALCANZA": "YETER",
		"ALCANZA PARA {0}": "{0} ICIN YETER",
		"TE ALCANZARÍA PARA: {0}": "ŞUNA YETERDI: {0}",
		"QUEDARÍAS CON ${0}": "${0} KALIRDI",
		"QUEDARÍAS CON {0} PUNTOS": "{0} PUAN KALIRDI",
		"QUEDARÍAS CON ${0} Y {1} PUNTOS": "${0} VE {1} PUAN KALIRDI",
		"TUS HABILIDADES ESTÁN AL MÁXIMO: ENTRARÍAN COMO ≈{0} XP": "YETENEKLERIN TAVANDA: ≈{0} XP OLARAK GIRER",
		"TE FALTAN ${0} PARA {1}": "{1} ICIN ${0} EKSIK",
		"YA TE ALCANZA PARA {0}": "ARTIK {0} ICIN YETER",
		"VOLVER A {0}": "GERI: {0}",
		"REPARTIR PUNTOS": "PUAN DAGIT",
		"PERSONAL": "EKIP",
		"PARA EL CUERPO": "VUCUDUN ICIN",
		"PARA EL VESTUARIO": "SOYUNMA ODASI ICIN",
		"TU CUERPO TÉCNICO": "TEKNIK EKIBIN",
		"ROPA": "GIYIM",
		"LUJOS": "LUKS",
		"PELUQUERÍA": "BERBER",
		"Cortes y barbas de autor. Los de siempre siguen gratis en ASPECTO.": "İmza kesimler ve sakallar. Klasikler GORUNUM bölümünde hâlâ ücretsiz.",
		"VER MARCAS": "MARKALAR",
		"PONÉRTELO": "GIY",
		"TU PUESTO: {0}º · {1} · {2}%": "SIRAN: {0}. · {1} · %{2}",
		"{0} % POR TU GRADA": "TRIBUNDEN %{0}",
		"TE LLEVA: {0}": "MENAJERIN: {0}",
		"LLEVAS PUESTAS": "AYAGINDA",
		"VS LAS TUYAS": "VS SENDEKI",
		"LO MISMO": "AYNI",
		"DURA {0} MÁS": "{0} DAHA UZUN",
		"DURA {0} MENOS": "{0} DAHA KISA",
		"USA LO QUE TIENES": "ELINDEKINI KULLAN",

		"POTENCIA": "GUÇ",
		"EFECTO": "FALSO",
		"${1} POR PARTIDO · DURA {0}": "MAÇ BAŞI ${1} · {0} SURER",
		"CON TU NETO DE HOY NO LLEGAS": "BUGUNKU NET MAAŞIN YETMEZ",
		"TE FALTAN {0} · {1}": "{0} EKSIK · {1}",
		"EL MÁS CERCA": "EN YAKIN",
		"SIN MANTENIMIENTO": "BAKIM YOK",
		"SE ESTRENA AL COMPRAR · ROTA, VUELVE EN {0}": "ALINCA GIYILIR · BOZULURSA {0} SONRA",
		"COMISIÓN {0}% · HOY {1}%": "KOM. %{0} · BUGUN %{1}",
		"SOBRE TU SUELDO: {0} / PARTIDO": "MAAŞINDAN: {0} / MAÇ",
		"PARA SIEMPRE · SIN MANTENIMIENTO": "KALICI · BAKIM YOK",
		"VER EN CASA": "EVDE GOR",
		"MIENTRAS SIGAS AQUÍ · TE QUEDAN {0} {1}": "BURADA KALDIKÇA · {0} {1} KALDI",
		"TU CARTERA": "CUZDANIN",
		"{0} PUNTOS LIBRES": "{0} BOŞ PUAN",
		"TOCA UNA BOTA PARA PROBÁRTELA": "DENEMEK ICIN KRAMPONA DOKUN",
		"TU TREN DE VIDA": "YAŞAM TARZIN",
		"TOCA UNA FICHA PARA ELEGIRLA": "SEÇMEK ICIN KARTA DOKUN",
		"TU PERSONAL": "EKIBIN",
		"TIENES {0} DE {1}": "{0}/{1} SENDE",
		"TU MERCH": "URUNLERIN",
		"NO TIENES NADA GUARDADO": "SAKLI BIR ŞEY YOK",
		"LO QUE CAMBIA": "NE DEGIŞIR",
		"PAGAS ${0} · TE QUEDAN ${1}": "ODEME ${0} · KALAN ${1}",
		"HOY NO SIRVE: {0}": "BUGUN OLMAZ: {0}",
		"-{0}% HOY": "-%{0} BUGUN",
		"ABRIENDO": "AÇILIYOR",
		"APP STORE": "APP STORE",
		"CONSUMO": "URUN",
		"Lo que compras aquí te mejora MIENTRAS SIGAS EN ESTE CLUB. Si fichas por otro, se queda con este escudo.": "Burada aldıkların seni BU KULUPTE KALDIKÇA geliştirir. Başka yere imza atarsan bu armayla burada kalır.",
		"El escudo en la cabeza, todos los días. Lo más barato que dice de qué eres.": "Her gün başında arma. Kimden yana olduğunu söylemenin en ucuz yolu.",
		"La que se levanta en el himno. Mientras juegues aquí, la grada te la reconoce.": "Marşta havaya kaldırdığın atkı. Burada oynadığın sürece tribün bunu takdir eder.",
		"El del año, con el sello del club. Lo usas a diario y llegas algo más entero.": "Yılın topu, kulüp mühürlü. Her gün kullanırsın ve biraz daha dinç gelirsin.",
		"La de este año, con tu dorsal. Sales con ella y la prensa lo nota.": "Bu yılın forması, senin numaranla. Onunla dışarı çıkarsın ve basın fark eder.",
		"TIENDA DEL CLUB": "KULUP MAGAZASI",
		"En primera, la tienda saca además la playera firmada de la vitrina.": "En üst ligde mağaza vitrindeki imzalı formayı da satışa çıkarır.",
		"GORRA DEL CLUB": "KULUP ŞAPKASI",
		"BUFANDA DEL CLUB": "KULUP ATKISI",
		"BALÓN OFICIAL": "RESMI TOP",
		"PLAYERA DE LA TEMPORADA": "SEZONUN FORMASI",
		"PLAYERA FIRMADA": "IMZALI FORMA",
		"La de la vitrina, firmada por la plantilla. Sólo en primera.": "Vitrindeki, kadronun imzaladığı forma. Sadece en üst ligde.",
		"ESTILO": "STIL",
		"INVERSION": "YATIRIM",
		"Toca una bota para probártela en el espejo.":
			"Aynada denemek için bir krampona dokun.",
		"Llevas ahorrado el {0}%.": "%{0} biriktirdin.",
		"EN USO": "AKTIF",
		"EQUIPAR": "GIY",
		"CON TUS BOTAS": "KRAMPONUNLA",
		"VIDA {0}%  ·  se gastan al jugar": "OMUR {0}%  ·  oynadıkça aşınır",
		"SIN DESGASTE  ·  las de pago dan más": "AŞINMAZ  ·  ücretliler daha çok verir",
		"EN USO · {0}%": "AKTIF · {0}%",
		"Se te acabaron tus {0}. Toca otras para reponerlas.":
			"{0} bitti. Yenilemek için başka bir çifte dokun.",
		"Tu fama interesó a {0}. Míralo en PATROCINIOS.":
			"Şöhretin {0} markasının dikkatini çekti. SPONSORLAR bölümüne bak.",
		"CONSUMIBLES": "TUKETIM",
		"ESTILO DE VIDA": "YAŞAM TARZI",
		"DINERO PARADO": "ATIL PARA",
		"NÓMINA": "MAAŞ",
		"INGRESOS": "GELIR",
		"DESCUENTOS": "KESINTILER",
		"VER DESGLOSE": "DETAYI GOSTER",
		"OCULTAR DESGLOSE": "DETAYI GIZLE",
		"PRIMA DE RESULTADO": "SONUÇ PRIMI",
		"PRIMA POR GOL": "GOL PRIMI",
		"PRIMA POR ASISTENCIA": "ASIST PRIMI",
		"PATROCINIO": "SPONSOR",
		"COMISIÓN DEL AGENTE": "MENAJER PAYI",
		"CÁMARA ROTA": "KIRIK KAMERA",
		"BALÓN A LA GRADA": "TOP TRIBUNE",



		"BALÓN A LA CALLE": "TOP SOKAGA",
		"RECOGEPELOTAS DERRIBADO": "TOP TOPLAYICI DEVRILDI",
		"CRISTAL DEL PALCO": "LOCA CAMI",
		"EN NÚMEROS ROJOS": "EKSIDESIN",
		"ficha $ {0} / partido": "maaş $ {0} / maç",
		"ficha $ {0} − gastos $ {1}": "maaş $ {0} − gider $ {1}",
		"Te miden como {0}": "Seni {0} olarak değerlendiriyorlar",
		"Juega {0} partidos  (llevas {1})": "{0} maç oyna  (şu an {1})",
		"Promedia {0} de nota  (llevas {1})": "Ortalama {0} not al  (şu an {1})",
		"Te hacen famoso, pero casi todo le sienta mal al técnico o al vestuario.":
			"Seni ünlü yaparlar ama çoğu hocayı ya da soyunma odasını rahatsız eder.",
		"TUYO": "SENIN",
		"ESTÉTICA": "GORUNUM",
		"Lo único que se compra y SE VE: te cambia de verdad en el hub, en la previa y"
		+ " en la cancha. No da ventaja ninguna, y por eso mismo es tuyo elegirlo. Los"
		+ " cortes y barbas de siempre siguen siendo gratis en PERSONALIZAR.":
			"Satın alınan ve GORUNEN tek şey: seni hub'da, maç öncesinde ve sahada gerçekten değiştirir. Hiçbir avantaj sağlamaz ve tam da bu yüzden seçim senin. Klasik kesimler ve sakallar KIŞISELLEŞTIR bölümünde hâlâ ücretsiz.",
		"INVERSIONES": "YATIRIMLAR",
		"Para cuando el dinero sobra: mejoran tu cuerpo o tu bolsillo, para siempre y sin mantenimiento.":
			"Paranın bol olduğu zamanlar için: vücudunu ya da cüzdanını geliştirir, kalıcı ve bakımsız.",
		"PONER": "GIY",
		"TE QUEDA BIEN": "YAKIŞTI",
		"LOGRO: {0}": "ODUL: {0}",
		"MANTENIMIENTO  -${0} / PARTIDO": "BAKIM  -${0} / MAÇ",
		"USAR": "KULLAN",
		"Tu míster. Convéncelo en la cancha.": "Hocan. Onu sahada ikna et.",
		"Decide si juegas y cuántos minutos.":
			"Oynayıp oynamayacağına ve kaç dakika oynayacağına o karar verir.",
		"Decide si el balón te llega.": "Topun sana gelip gelmeyeceğine onlar karar verir.",
		"Sube tu valor y abre las puertas de las marcas.":
			"Değerini artırır ve markaların kapısını açar.",
		"Tu fama: qué marcas te buscan y qué clubes se fijan en ti.":
			"Şöhretin: hangi markalar seni istiyor ve hangi kulüpler seni fark ediyor.",
		"Cuántas ofertas ves, la ficha que te sacan (hasta +15%) y qué tan bien regateas.":
			"Kaç teklif gördüğün, sana koparılan maaş (+%15'e kadar) ve ne kadar iyi pazarlık ettiğin.",
		"Patrocinadores": "Sponsorlar",
		"Cómo vas con los objetivos de tus marcas.":
			"Markalarının hedeflerinde nasıl gidiyorsun.",
		"TUS MARCAS · {0} DE {1}": "MARKALARIN · {0}/{1}",
		"Ninguna todavía. Sal en la prensa y vendrán solas.":
			"Henüz yok. Basında görün, kendileri gelir.",
		"TE BUSCAN": "ARANIYOR",
		"La temporada ya está en marcha: las marcas cerraron sus contratos en"
		+ " pretemporada. Vuelven a buscarte cuando empiece la siguiente.":
			"Sezon çoktan başladı: markalar anlaşmalarını hazırlık döneminde yaptı. Bir sonraki sezon başlayınca yeniden ararlar.",
		"Nadie por ahora. La prensa manda aquí.": "Şimdilik kimse yok. Burada basın belirleyici.",
		"PRETEMPORADA: es ahora o el año que viene. En cuanto juegues la primera"
		+ " jornada se cierra, y lo que no firmes ya no vuelve esta temporada.":
			"HAZIRLIK DONEMI: ya şimdi ya gelecek yıl. İlk haftayı oynadığın an kapanır ve imzalamadığın bu sezon geri gelmez.",
		"OBJETIVO: {0}": "HEDEF: {0}",
		"SIN HUECO": "YER YOK",
		"FIRMAR": "IMZALA",
		"{0}  ({1}/{2})  ·  premio ${3}": "{0}  ({1}/{2})  ·  ödül ${3}",
		"{0}  ({1})  ·  premio ${2}": "{0}  ({1})  ·  ödül ${2}",
		"Se cobra al final de la temporada.": "Sezon sonunda ödenir.",
		"ROMPER": "FESHET",
		"¿ROMPER CON {0}?": "FESHET: {0}?",
		"Pierdes el contrato, su pago por partido y el premio del objetivo. No vuelve.":
			"Sözleşmeyi, maç başı ödemesini ve hedef ödülünü kaybedersin. Geri gelmez.",
		"TUS PATROCINADORES": "SPONSORLARIN",
		"SIN MARCAS": "MARKA YOK",
		"{0}/{1} OBJETIVOS": "{0}/{1} HEDEF",
		"Desde el banquillo no cobras: sólo cuentan (y se pagan) las jornadas de {0}' o más.":
			"Yedek kulübesinden para kazanamazsın: yalnızca {0}' ve üzeri oynadığın haftalar sayılır (ve ödenir).",
		"Te perdonan parte del objetivo por las {0} jornadas que te perdiste lesionado (firmaste {1}).":
			"Sakat kaldığın {0} hafta için hedefin bir kısmını affediyorlar ({1} için imzalamıştın).",
		"Te piden menos jornadas por las {0} que te perdiste lesionado. La media no baja.":
			"Sakat kaçırdığın {0} hafta yüzünden daha az hafta istiyorlar. Not ortalaması şartı düşmez.",
		"{0} no te llama: le fallaste. Le quedan {1} temporada(s) de enfado.":
			"{0} aramıyor: onu yüzüstü bıraktın. Daha {1} sezon küs kalacak.",
		"INDEMNIZACIÓN: ${0} de lo que ya te pagaron.":
			"TAZMINAT: sana ödenenden ${0} geri.",
		"ROMPO EL CONTRATO": "SOZLEŞMEYI FESHET",
		"CLASIFICACIÓN · {0}": "PUAN DURUMU · {0}",
		"{0} (TÚ)": "{0} (SEN)",
		"{0} PTS ({1} PJ)": "{0} P ({1} MAÇ)",
		"— objetivo del club: {0} —": "— kulübün hedefi: {0} —",
		"TU GRUPO": "GRUBUN",
		"TU CUADRO": "EŞLEŞMELER",
		"¡CAMPEÓN!": "ŞAMPIYON!",
		"Eliminado": "Elendi",
		"Fuera en la fase de grupos": "Grup aşamasında veda",
		"Fuera en la fase de liga": "Lig aşamasında veda",
		"No la juegas esta temporada — así va en el mundo.":
			"Bu sezon bu turnuvada yoksun — dünyada durum böyle.",
		"Tu club no está esta temporada — así va en el mundo.":
			"Kulübün bu sezon bu turnuvada yok — dünyada durum böyle.",
		"Sin campo europeo esta temporada.": "Bu sezon Avrupa katılımcısı yok.",
		"CAMPEÓN: {0}": "ŞAMPIYON: {0}",
		"ACTIVO": "AKTIF",
		"No la juegas esta temporada — mira su carrera de goleo.":
			"Bu sezon bu turnuvada yoksun — gol krallığı yarışına bak.",
		"COPA NACIONAL": "ULUSAL KUPA",
		"Aún no arranca.": "Henüz başlamadı.",
		"¡CAMPEÓN DE COPA!": "KUPA ŞAMPIYONU!",




		"¡CAMPEÓN DE LIGA!": "LIG ŞAMPIYONU!",
		"¡CAMPEÓN DE COPA DE CAMPEONES!": "ELIT KUPASI ŞAMPIYONU!",
		"¡CAMPEÓN DE COPA EUROPA!": "AVRUPA KUPASI ŞAMPIYONU!",
		"¡CAMPEÓN DE COPA CONFERENCIA!": "CHALLENGE KUPASI ŞAMPIYONU!",
		"Fase final de Copa de Campeones": "Elit Kupası eleme aşaması",
		"Fase final de Copa Europa": "Avrupa Kupası eleme aşaması",
		"Fase final de Copa Conferencia": "Challenge Kupası eleme aşaması",
		"Clasificado a Copa de Campeones": "Elit Kupası'na katılım hakkı",
		"Clasificado a Copa Europa": "Avrupa Kupası'na katılım hakkı",
		"Clasificado a Copa Conferencia": "Challenge Kupası'na katılım hakkı",
		"Eliminado de la Copa": "Kupadan elendi",
		"A eliminatoria directa: sin tabla de goleadores.":
			"Doğrudan eleme: gol tablosu yok.",
		"MUNDIAL DE CLUBES": "KULUP DUNYA ŞAMP.",
		"Contra los mejores clubes de otras confederaciones.":
			"Diğer konfederasyonların en iyi kulüplerine karşı.",
		"¡CAMPEÓN DEL MUNDO DE CLUBES!": "DUNYA KULUPLER ŞAMPIYONU!",
		"Eliminado del Mundial de Clubes": "Kulüpler Dünya Şampiyonası'ndan elendi",
		"Aún sin nacionalidad.": "Henüz uyruk yok.",
		"El Mundial se juega cada {0} temporadas; quedar entre los {1} primeros del"
		+ " grupo clasifica.":
			"Dünya Şampiyonası {0} sezonda bir oynanır; grubunu ilk {1} içinde bitirmek turnuvaya götürür.",
		"Sin datos de esta competición todavía.": "Bu turnuva için henüz veri yok.",
		"TOP 10 · GOLEO": "TOP 10 · GOL",
		"TOP 10 · ASISTENCIAS": "TOP 10 · ASIST",
		"TOP 10 · MEDIA": "TOP 10 · NOT",
		"{0} {1} · vs": "{0} {1} · vs",
		"Por definir": "Belli değil",
		"Por definir.": "BELLI DEGIL.",
		"Fase de grupos": "Grup aşaması",


		"Fase de liga": "Lig aşaması",



		"EL SORTEO": "KURA",


		"GRUPO DE LA MUERTE": "OLUM GRUBU",


		"EL MUNDIAL ES ESTE AÑO": "DUNYA ŞAMPIYONASI BU YIL",
		"EL MUNDIAL ES EL AÑO QUE VIENE": "DUNYA ŞAMPIYONASI GELECEK YIL",
		"MUNDIAL EN {0} TEMPORADAS": "DUNYA ŞAMPIYONASINA {0} SEZON",
		"Lo juegas con {0} años.": "{0} yaşında oynarsın.",
		"Llegarás con {0} años.": "Oraya {0} yaşında varacaksın.",
		"No llegarás: a esa edad ya estarás retirado.": "Yetişemeyeceksin: o yaşta çoktan emekli olmuş olacaksın.",
		"TUS RIVALES": "RAKIPLERIN",
		"{0} EN CASA · {1} FUERA": "{0} EV · {1} DEPLASMAN",
		"Los mismos que verás en tu calendario.":
			"Fikstüründe göreceğin rakiplerin aynısı.",
		"FASE DE LIGA": "LIG AŞAMASI",
		"TÚ": "SEN",
		"{0}. {1}  {2} PTS ({3} PJ)": "{0}. {1}  {2} P ({3} MAÇ)",
		"Aún no arranca": "Henüz başlamadı",
		"¡Campeón de Copa!": "Kupa şampiyonu!",
		"En {0}": "Tur: {0}",
		"En juego": "Sürüyor",
		"¡Campeón de Copa de Campeones!": "Elit Kupası şampiyonu!",
		"Fase final": "Eleme aşaması",
		"OCTAVOS DE FINAL": "SON 16 TURU",
		"CUARTOS DE FINAL": "ÇEYREK FINAL",
		"SEMIFINAL": "YARI FINAL",



		"Playoff": "Play-off",
		"PLAYOFF": "PLAY-OFF",
		"Octavos": "Son 16",
		"Cuartos": "Çeyrek final",
		"Semifinal": "Yarı final",
		"Final": "Final",
		"LEYENDAS DEL MUNDO": "DUNYA EFSANELERI",
		"TABLEROS MUNDIALES": "DUNYA SIRALAMASI",
		"Arriba, las leyendas de tu partida. Aquí, jugadores reales de todo el mundo: tu mejor carrera se manda al cerrar cada temporada.": "Yukarıda kayıt dosyanın efsaneleri. Burada dünyanın dört bir yanından gerçek oyuncular: en iyi kariyerin her sezon sonunda gönderilir.",
		"VER EN GAME CENTER": "GAME CENTER'DA GOR",
		"FORTUNA": "SERVET",
		"LOGROS EN GAME CENTER": "GAME CENTER BAŞARIMLARI",
		"Arriba, tu catálogo completo. En Game Center, los que Apple conoce: se mandan solos al desbloquearse, y ahí se ve cuántos jugadores del mundo tienen cada medalla.": "Yukarıda tüm kataloğun. Game Center'da Apple'ın bildikleri: kilidini açınca kendiliğinden gönderilir ve orada dünyada kaç oyuncunun her madalyaya sahip olduğu görünür.",
		"TOP {0}": "TOP {0}",
		"MÁS TROFEOS INDIVIDUALES": "EN ÇOK BIREYSEL KUPA",
		"MÁS TROFEOS DE EQUIPO": "EN ÇOK TAKIM KUPASI",
		"MÁS TROFEOS EN TOTAL": "EN ÇOK TOPLAM KUPA",
		"Los premios que se ganan uno solo: el mejor del año y las botas de goleo.":
			"Tek başına kazanılan ödüller: Yılın Oyuncusu ve gol krallıkları.",
		"Ligas, copas, continentales y Mundiales: lo que se levanta con once.":
			"Ligler, kupalar, kıta kupaları ve Dünya Şampiyonaları: on bir kişiyle kaldırılanlar.",
		"La vitrina entera, sin preguntar de dónde salió cada trofeo.":
			"Vitrinin tamamı, hangi kupanın nereden geldiği sorulmadan.",
		"LEYENDAS POR LIGA": "LIG EFSANELERI",
		"LEYENDAS POR CLUB": "KULUP EFSANELERI",
		"No ha habido leyendas en {0}… aún.": "{0} için hiç efsane çıkmadı… henüz.",
		"este club": "bu kulüp",
		"INDIV.": "BIREY.",
		"EQUIPO": "TAKIM",
		"GOLES + ASISTENCIAS": "GOL + ASIST",
		"LA LEYENDA A TIRO": "EFSANE MENZILDE",
		"A {0} DE LA LEYENDA": "EFSANEYE {0} KALDI",
		"IGUALADO CON LA LEYENDA": "EFSANEYLE BAŞ BAŞA",
		"Máximos productores de la historia (G+A). Sólo cuenta lo hecho en 1ª división"
		+ " o con tu selección: es lo que mide a los grandes.":
			"Tarihin en üretken oyuncuları (G+A). Sadece 1. ligde ya da milli takımda yapılanlar sayılır: büyükleri ölçen budur.",
		"TU PRODUCCIÓN · POR CATEGORÍA": "URETIMIN · LIG BAZINDA",
		"ÉLITE (1ª + SELECCIÓN)": "ELIT (1. LIG + MILLI)",
		"TOTAL (TODAS LAS CATEGORÍAS)": "TOPLAM (TUM LIGLER)",
		"La diferencia ({0} G · {1} A) es lo hecho en 2ª y 3ª división.":
			"Aradaki fark ({0} G · {1} A) 2. ve 3. ligde yapıldı.",
		"Balón de Oro": "Yılın Oyuncusu",
		"Goleo": "Gol krallığı",
		"Ligas": "Ligler",
		"Copas": "Kupalar",
		"Continental": "Kıta",
		"Mundial": "Dünya Şampiyonası",
		"LOS MÁS LAUREADOS DEL MUNDO": "EN ÇOK KUPA KAZANANLAR",
		"CLUBES · {0}": "KULUP · {0}",


		"TE QUIEREN": "ISTEYENLER",
		"TE MIRA": "IZLIYOR",
		"NADIE": "KIMSE",
		"1 CLUB": "1 KULUP",
		"Hoy ningún club te ficharía a tu nivel. Rinde y sube tu valor para que empiecen a mirarte.": "Bugün hiçbir kulüp seni bu seviyende almaz. İyi oyna ve değerini artır ki sana bakmaya başlasınlar.",
		"{0} CLUBES": "{0} KULUP",
		"CLUB": "KULUP",
		"INTERNACIONALIDADES": "MILLI MAÇ",
		"GOLES": "GOL",
		"{0} · TEMPORADA {1}{2}": "{0} · SEZON {1}{2}",
		"no convocado": "kadroya çağrılmadı",
		"RUMBO AL MUNDIAL": "DUNYA ŞAMPIYONASI YOLU",
		"El Mundial se juega cada 4 temporadas. Quedar entre los {0} primeros de tu"
		+ " grupo clasifica.":
			"Dünya Şampiyonası 4 sezonda bir oynanır. Grubunu ilk {0} içinde bitirmek turnuvaya götürür.",
		"HISTORIAL": "GEÇMIŞ",
		"Aún no has cerrado una temporada con la selección.":
			"Milli takımla henüz bir sezonu kapatmadın.",
		"T{0} · {1}": "S{0} · {1}",
		"SELECCIÓN DE {0}": "MILLI TAKIM: {0}",
		"FUERA DE LA CONVOCATORIA": "KADRO DIŞI",
		"SIN DORSAL": "NUMARA YOK",
		"VER CONVOCATORIA": "KADROYU GOR",





		"PTS": "P",
		"A {0} PUESTOS": "{0} SIRA GERI",
		"PUESTO {0}": "{0}. SIRA",
		"Tu media es {0}. Con la vara de {1} son {2}; {3} de fama y {4} de mérito la dejan en {5}.":
			"Genel puanın {0}. {1} ölçüsüyle bu {2} eder; {3} şöhret ve {4} başarı puanıyla {5} olur.",
		"CORTE LISTA": "KADRO EŞIGI",
		"CORTE ONCE": "11 EŞIGI",


		"Eres el número {0} de {1} por puntuación, pero el sitio que ocuparías es el de {2} ({3}): a nadie que te saque más de {4} se le quita el puesto. Necesitas {5}.":
			"Puana göre {0}. sıradasın ({1}), ama alacağın yer {2} adlı oyuncunun ({3}): senden {4} puandan fazla önde olan kimsenin yeri alınmaz. Gereken: {5}.",
		"Entras en la lista, pero no en el once: el sitio que ocuparías es el de {0} ({1}) y a nadie que te saque más de {2} se le quita el puesto. Necesitas {3}.":
			"Kadroya giriyorsun ama ilk 11'e değil: alacağın yer {0} adlı oyuncunun ({1}) ve senden {2} puandan fazla önde olan kimsenin yeri alınmaz. Gereken: {3}.",

		"Lo que más te acerca: ganarte al seleccionador en la concentración (hasta {0}), un título individual (hasta {1}) y tu temporada de club (hasta {2}).":
			"Seni en çok yaklaştıran: kampta milli takım teknik direktörünü kazanmak (en fazla {0}), bireysel bir ödül (en fazla {1}) ve kulüpteki sezonun (en fazla {2}).",




		"Tu puntuación ya es {0} y hoy daría para entrar, pero la lista de esta campaña se cerró antes de que llegaras: el seleccionador no la rehace a mitad de camino. Tu sitio se juega en la próxima.":
			"Puanın artık {0} ve bugün kadroya girmeye yeter, ama bu kampanyanın kadrosu sen gelmeden açıklandı: teknik direktör yarı yolda listeyi yeniden yapmaz. Yerin bir sonrakinde belirlenecek.",
		"Sigues en la lista de esta campaña: al seleccionador no le gusta cortar a nadie a mitad de camino. Pero tu puntuación cayó a {0} y el corte está en {1}: si no reaccionas, la próxima lista se hace sin ti.":
			"Bu kampanyanın kadrosundasın: teknik direktör yarı yolda kimseyi kesmeyi sevmez. Ama puanın {0} seviyesine düştü ve baraj {1}: toparlanmazsan sonraki kadro sensiz açıklanır.",

		"Debut: {0} años": "İlk maç: {0} yaşında",
		"Temporada {0}": "Sezon {0}",
		"marcaste": "attın",
		"RETIRADO DE LA SELECCIÓN": "MILLI TAKIMI BIRAKTIN",
		"RETIRARTE DE LA SELECCIÓN": "MILLI TAKIMI BIRAK",
		"YA NO ENTRAS EN LA LISTA": "ARTIK KADRODA YOKSUN",
		"GOLEADORES HISTÓRICOS": "TARIHI GOLCULER",
		"¿CUELGAS LA CAMISETA DE TU PAÍS?": "MILLI FORMAYI ASIYOR MUSUN?",
		"El seleccionador ya no cuenta contigo. Tus {0} partidos y {1} goles quedan sellados, y las fechas de selecciones dejan de costarte energía. Sólo un Mundial podría hacerte volver.": "Milli takım teknik direktörü artık sana güvenmiyor. {0} maçın ve {1} golün mühürlenir, milli aralar artık enerjine mal olmaz. Seni ancak bir Dünya Şampiyonası geri getirebilir.",

		"Colgaste la camiseta de {0}. Sus torneos siguen en tu calendario, pero"
		+ " los ves desde fuera.":
			"{0} formasını astın. Turnuvaları takviminde kalır ama dışarıdan izlersin.",
		"VOLVER PARA EL MUNDIAL": "DUNYA ŞAMPIYONASI IÇIN DON",
		"¿VUELVES DEL RETIRO?": "EMEKLILIKTEN DONUŞ?",
		"{0} juega el Mundial y el seleccionador te quiere en la lista. Volver es volver de verdad: las fechas de selecciones vuelven a contar contigo.": "{0} Dünya Şampiyonası'nda oynuyor ve teknik direktör seni kadroda istiyor. Dönmek gerçekten dönmek demek: milli aralar yeniden seni sayar.",
		"VUELVO": "DONDUM",
		"{0} JUGADORES": "{0} OYUNCU",
		"Grupo por definir.": "Grup belli değil.",
		"{0}. {1}  {2} PTS ({3})": "{0}. {1}  {2} P ({3})",
		"— corte de clasificación —": "— katılım barajı —",
		"Ahora mismo: {0}": "Şu an: {0}",
		"CLASIFICADA": "VIZE ALDI",
		"fuera del Mundial": "Dünya Şampiyonası dışında",
		"fuera de {0}": "{0} dışında",
		"Cuadro por definir.": "Eşleşmeler belli değil.",
		"{0} no está en {1}.": "{0}, {1} turnuvasında yok.",
		"Clasifícala la próxima vez quedando entre los tres primeros de tu grupo.":
			"Bir dahaki sefere grubunu ilk üçte bitirerek vize al.",
		"¡{0}, CAMPEÓN de {1}!": "{0}, {1} ŞAMPIYONU!",
		"Proyección de {0}: {1}": "{0} için tahmin: {1}",
		"{0} selecciones en el cuadro. Tu papel en el club mueve la aguja: rinde y"
		+ " llévala lejos.":
			"Eşleşmelerde {0} ülke. Kulüpteki rolün ibreyi oynatır: iyi oyna ve onları ileri taşı.",
		"Las clasificatorias aún no empiezan.": "Elemeler henüz başlamadı.",
		"{0}. {1}  {2} PTS ({3}, {4} PJ)": "{0}. {1}  {2} P ({3}, {4} MAÇ)",
		"— corte de clasificación al Mundial —": "— Dünya Şampiyonası katılım barajı —",
		"¡{0} CLASIFICADA!": "{0} VIZE ALDI!",
		"{0} se quedó fuera del Mundial": "{0} Dünya Şampiyonası dışında kaldı",
		"{0} · vs": "{0} · vs",
		"{0} quedó eliminada de {1}": "{0}, {1} turnuvasından elendi",
		"LIBRO DE RÉCORDS": "REKOR KITABI",
		"LIGA · CLUB · MUNDO": "LIG · KULUP · DUNYA",
		"ABRIR": "AÇ",
		"VITRINA": "VITRIN",
		"Aún vacía. Gana una liga, una copa o una bota y aquí lucirá tu primer trofeo.":
			"Henüz boş. Bir lig, bir kupa ya da bir gol krallığı kazan, ilk kupan burada parlasın.",
		"TEMPORADA A TEMPORADA": "SEZON SEZON",
		"EN EQUIPO · {0}": "TAKIM · {0}",
		"INDIVIDUALES · {0}": "BIREYSEL · {0}",
		"Aún no has cerrado ninguna temporada.": "Henüz hiçbir sezonu kapatmadın.",
		"* temporada en curso": "* devam eden sezon",
		"El detalle por temporada aparecerá aquí al cerrar la temporada en la que ganes"
		+ " tu próximo premio.":
			"Sezon sezon detay, bir sonraki ödülünü kazandığın sezonu kapattığında burada görünecek.",
		"POR TEMPORADA": "SEZONLUK",
		"TRASPASOS": "TRANSFER",
		"Sigues donde empezaste.": "Başladığın yerdesin.",
		"LEGADO": "MIRAS",
		"Puntos de legado: {0} — suben con goles, títulos y partidos con tu"
		+ " selección.":
			"Miras puanı: {0} — goller, kupalar ve milli maçlarla artar.",
		"Vía Mundo · prestigio {0}/{1}": "Dünya Yolu · prestij {0}/{1}",
		"necesitas {0} puntos de legado": "{0} miras puanı gerekiyor",
		"Vía Club · {0}/{1} títulos": "Kulüp Yolu · {0}/{1} kupa",
		"{0} histórico del club": "Kulüp tarihinde {0}",
		"(pide top-2)": "(ilk 2 gerekir)",
		"aún no figuras entre sus leyendas": "henüz efsaneleri arasında değilsin",
		"Fuera del top {0} de la historia": "Tüm zamanlarda ilk {0} dışında",
		"{0} de la historia": "Tüm zamanlarda {0}",
		"Nadie por encima: el más grande que ha pisado un campo.":
			"Üstünde kimse yok: sahaya çıkmış en büyük oyuncu.",
		"El siguiente a superar": "Sıradaki geçilecek isim",
		"Te falta 1 trofeo": "1 kupa kaldı",
		"Te faltan {0} trofeos": "{0} kupa kaldı",
		"Goles por temporada": "Sezon başına gol",
		"{0}T": "{0}S",
		"COMO SE SUBE": "NASIL ARTAR",
		"Goles, asistencias y partidos con tu selección suman siempre — los"
		+ " primeros valen mucho y el volumen se aplana. Los trofeos suman entero"
		+ " lo suyo:":
			"Goller, asistler ve milli maçlar her zaman puan getirir — ilkleri çok değerlidir ve miktar arttıkça etkisi azalır. Kupalar kendi payının tamamını ekler:",
		"{0} a los {1}": "{1} yaşında {0}",
		"ASÍ VA LA VOTACIÓN": "OYLAMA DURUMU",
		"Con lo jugado hasta la jornada {0} de {1}. Si la temporada cerrara hoy,"
		+ " el 1º se lo lleva: el ranking manda, sin excepciones.":
			"{1} haftanın {0}. haftasına kadar oynananlara göre. Sezon bugün bitse 1. olan alır: sıralama belirler, istisna yok.",
		"Sólo votan la PRIMERA división de las ligas EUROPEAS. Y los títulos del"
		+ " año entran al cierre: una {0} son {1} puntos que hoy no lleva nadie.":
			"Sadece AVRUPA liglerinin BIRINCI ligi oy kullanır. Ve yılın kupaları sezon sonunda eklenir: bir {0} bugün kimsenin taşımadığı {1} puan demek.",
		"Gana el que más puntos suma, sin excepciones. Los títulos no son una"
		+ " llave aparte: son la forma más rápida de sumar.":
			"En çok puanı toplayan kazanır, istisna yok. Kupalar ayrı bir yol değil: puan toplamanın en hızlı yolu.",
		"La LIGA y la COPA valen según la liga en que se ganan: las cinco grandes"
		+ " pagan el doble que las ligas pequeñas. Abajo van los puntos de TU liga.":
			"LIG ve KUPA, kazanıldıkları ligin değerine göre puan getirir: beş büyük lig, küçük liglerin iki katını verir. Aşağıda SENIN liginin puanları var.",
		"Tú vas más abajo:": "Sen daha aşağıdasın:",
		"El mejor de tu equipo:": "Takımının en iyisi:",
		"Aún no has jugado este año: sin partidos no hay votación que valga.":
			"Bu yıl henüz oynamadın: maç yoksa oy da yok.",
		"Tu liga no vota: para entrar hay que jugar la PRIMERA división de una"
		+ " liga EUROPEA.":
			"Ligin oy kullanmıyor: girmek için bir AVRUPA liginin BIRINCI liginde oynamalısın.",
		"{0} para {1}": "{1} için {0}",
		"TU RECORRIDO": "YOLCULUGUN",


		"T{0}-T{1}": "S{0}-S{1}",
		"Llegaste CEDIDO": "KIRALIK geldin",
		"Pagaron ${0} por ti": "Senin için ${0} ödediler",
		"Aquí empezaste": "Burada başladın",
		"Llegaste gratis": "Bedelsiz geldin",
		"GLOBAL": "GENEL",
		"PARTIDOS": "MAÇ",
		"{0}V · {1}E · {2}D": "{0}G · {1}B · {2}M",
		"ASISTENCIAS": "ASIST",
		"MEDIA": "NOT",



		"GOLEO": "GOL",
		"mejor: {0}": "en iyi: {0}",
		"TEMPORADAS": "SEZON",
		"en {0} {1}": "{0} {1} içinde",
		"INTERNACIONAL": "MILLI",
		"{0} goles con {1}": "{1} formasıyla {0} gol",
		"$ {0}  ·  ahora": "$ {0}  ·  şimdi",
		"La curva aparece al cerrar tu segunda temporada.":
			"Eğri ikinci sezonunu kapatınca görünür.",
		"Pico: ${0} en la temporada {1}": "Zirve: {1}. sezonda ${0}",
		"T{0} · ${1}": "S{0} · ${1}",
		"tabLIGA": "LIG",
		"tabCHAMP": "ELIT",
		"tabEUROPA": "AVR",
		"tabCOPA": "KUPA",
		"tabCLUBES": "KULUP",
		"tabMUNDIAL": "DUNYA",
		"tabCONTIN.": "KITA",
		"tabCLASIF": "ELEME",
		"palmaresLIGA": "LIG",
		"palmaresCOPA": "KUPA",
		"palmaresCONT.": "KITA",
		"tablaTEMP": "SEZ",
		"tablaCLUB": "KULUP",
		"tablaPJ": "O",
		"tablaG": "G",
		"tablaA": "A",
		"tablaNOTA": "NOT",


		"tabla_ligaEQUIPO": "TAKIM",
		"tabla_ligaPJ": "O",
		"tabla_ligaG": "G",
		"tabla_ligaE": "B",
		"tabla_ligaP": "M",
		"tabla_ligaPTS": "P",
		"tabla_ligaGOLES": "GOL",
		"tabla_ligaASIST": "ASIST",

		"CED": "KIR.",
		"{0}A": "{0}Y",
		"{0}S": "{0}H",
		"{0}P": "{0}M",
		"CEDIDO · NO SE RENUEVA": "KIRALIK · UZATILMAZ",
		"TREN DE VIDA": "YAŞAM TARZI",
		"NETO POR PARTIDO": "MAÇ BAŞI NET",
		"TUS NOES": "RETLERIN",
		"SE VAN HOY": "BUGUN SON",
		"Se hartaron de tus noes: el club contaba con esa venta. El técnico deja de contar contigo hasta el año que viene.":
			"Retlerinden bıktılar: kulüp o satışa güveniyordu. Hoca gelecek yıla kadar sana güvenmeyecek.",
		"Llevas muchos noes: lo que llega ahora ya no es del nivel de lo que tumbaste.":
			"Çok fazla teklif reddettin: artık gelenler geri çevirdiklerinin seviyesinde değil.",
		"Tu agente sostiene esa oferta: se sabe en la próxima jornada.":
			"Menajerin bu teklifi bekletiyor: cevabı gelecek hafta belli olacak.",
		"Tu agente no acepta más encargos esta ventana.":
			"Menajerin bu transfer döneminde başka iş almıyor.",
		"Te quedan {0} encargo(s) esta ventana (tu agente acepta más cuanto mejor te trate).":
			"Bu dönem {0} iş hakkın kaldı (menajerinle aran ne kadar iyiyse o kadar çok iş alır).",
		"Tu agente puede llamar igual, pero volverá con las manos vacías y te costará {0}, un poco de vestuario y el trato con él.":
			"Menajerin yine de arayabilir ama eli boş döner; sana {0}, biraz soyunma odası desteği ve onunla aranı kaybettirir.",
		"Tu club no te deja salir: pide el traspaso primero.":
			"Kulübün gitmene izin vermiyor: önce transfer talebinde bulun.",
		"El mercado está cerrado: el botón de irte aparece al abrir la ventana. Negarte, puedes ya.":
			"Transfer dönemi kapalı: ayrılma butonu dönem açılınca çıkar. Reddetmeyi ise şimdi de yapabilirsin.",
		"PEDISTE EL TRASPASO": "TRANSFER TALEBI",
		"ESTÁS CEDIDO": "KIRALIKSIN",
		"Juegas en {0}, pero tu pase es de {1}.":
			"Oynadığın takım: {0}. Lisansın ise {1} kulübünde.",
		"tu club dueño": "asıl kulübün",
		"Mientras dure la cesión, aquí no hay nada que firmar ni negociar. Vuelves a {0} al cerrar la temporada.":
			"Kiralık süren boyunca burada imzalanacak ya da pazarlık edilecek bir şey yok. Sezon bitince {0} kulübüne dönüyorsun.",
		"Hay clubes esperándote cedido, pero el mercado está cerrado: la cesión se firma cuando abra la ventana.":
			"Seni kiralamak isteyen kulüpler var ama transfer dönemi kapalı: kiralama dönem açılınca imzalanır.",
		"Estás EN LISTA DE CESIÓN: mientras sigas en ella, cada ventana te trae destinos nuevos.":
			"KIRALIK LISTESINDESIN: listede kaldıkça her dönem yeni adresler gelir.",
		"{0} · titular probable · una temporada": "{0} · muhtemel ilk 11 · bir sezon",
		"Sueldo/partido": "Maaş/maç",
		"Prima (sin traspaso)": "Prim (bonservissiz)",
		"Traspaso": "Bonservis",
		"Tu prima": "Senin payın",


		"Prima (bruta)": "Prim (brüt)",
		"Te queda limpio": "Sana kalan",
		"Tu prima (limpia)": "Senin payın (net)",
		"(−{0}% agente)": "(−%{0} menajer)",
		"LA SOSTIENE TU AGENTE": "MENAJERIN BEKLETIYOR",
		"HOY O NUNCA": "SON ŞANS",
		"Va {0} de {1} en {2} · {3}": "{1} takım içinde {0} sırada · {2} · {3}",
		"RECHAZAR ESTA OFERTA": "BU TEKLIFI REDDET",




		"MANTÉN PARA FICHAR": "IMZA: BASILI TUT",
		"¿ENCARGAR?": "IŞ VER?",
		"MANTÉN PARA ENCARGAR": "IŞ IÇIN BASILI TUT",
		"Tu agente trabajará {0} esta ventana. Cuesta {1}.": "Menajerin bu dönem şurada çalışacak: {0}. Ücreti: {1}.",
		"la liga de {0}": "{0} ligi",
		"MANTÉN PARA FIRMAR": "IMZA: BASILI TUT",
		"MANTÉN PARA NO RENOVAR": "UZATMA: BASILI TUT",
		"MANTÉN PARA FIRMAR EL PRECONTRATO": "ON SOZLESME: BASILI TUT",
		"MANTÉN PARA RECHAZAR": "REDDET: BASILI TUT",
		"TU CLUB NO TE VENDE: te queda contrato y cuentan contigo. Pide el traspaso ahí abajo para poder firmar.":
			"KULUBUN SENI SATMIYOR: sözleşmen sürüyor ve sana güveniyorlar. İmza atabilmek için aşağıdan transfer talebinde bulun.",
		"QUE TU AGENTE LA SOSTENGA": "MENAJERIN BEKLETSIN",
		"TU AGENTE LA SOSTIENE · RESPONDEN MAÑANA": "MENAJERIN BEKLETIYOR · CEVAP YARIN",
		"Se retiran de la puja para siempre en este mercado. El mercado cierra hoy: nadie ocupará su hueco.":
			"Bu transfer döneminde yarıştan tamamen çekiliyorlar. Dönem bugün kapanıyor: yerlerini kimse doldurmayacak.",
		"Tu club contaba con esta venta: con este NO se les acaba la paciencia y el técnico dejará de contar contigo.":
			"Kulübün bu satışa güveniyordu: bu HAYIR ile sabırları tükenir ve teknik direktör artık sana güvenmez.",
		"Tu club contaba con esta venta: te quedan {0} noes antes de que se les acabe la paciencia.":
			"Kulübün bu satışa güveniyordu: sabırları tükenmeden önce {0} kez daha hayır diyebilirsin.",
		"Y llevas muchos noes: lo que llegue en su lugar vendrá por debajo de lo que estás tumbando.":
			"Üstelik çok teklif reddettin: yerine gelen, şu an geri çevirdiğinin altında olacak.",
		"OFERTA RECHAZADA · EL MERCADO CIERRA HOY": "TEKLIF REDDEDILDI · DONEM BUGUN KAPANIR",
		"CONCENTRADO CON {0}": "KAMPTA: {0}",
		"Aquí mandan otros. Que tu club te adore no le dice nada al seleccionador: a esta gente te la ganas jugando las fechas FIFA.":
			"Burada başkaları söz sahibi. Kulübünün sana tapması milli takım teknik direktörüne bir şey anlatmaz: bu insanları FIFA haftalarında oynayarak kazanırsın.",
		"Seleccionador": "Milli takım hocası",
		"Es quien firma la lista. Mira tu nota cuando juegas con el país.":
			"Kadroyu o belirler. Milli maçlardaki notuna bakar.",
		"Las tres suman {0} puntos a tu convocatoria.":
			"Üçü birlikte kadro şansına {0} puan katıyor.",
		"Vestuario de la selección": "Milli takım soyunma odası",
		"Se gana ganando juntos. Una derrota jugando mal es lo que más resta.":
			"Birlikte kazanarak kazanılır. En çok kaybettiren, kötü oynanan bir mağlubiyettir.",
		"Afición de {0}": "Taraftar: {0}",
		"Le enamora que marques. En casa, si te quiere te llega un balón más; si te pita, uno menos.":
			"Gol atman onları büyüler. Evde seni severlerse bir top fazla gelir; ıslıklarlarsa bir top eksik.",
		"LOS TUYOS, ESTÉS DONDE ESTÉS": "NEREDE OLURSAN OL, SENINLER",
		"Te siguen a todas partes: lo que hagas con tu país también cuenta.":
			"Seni her yerde takip ederler: milli takımda yaptıkların da sayılır.",
		"Sigue siendo el tuyo. Una buena fecha FIFA sube tu precio.":
			"Hâlâ senin adamın. İyi bir FIFA haftası değerini artırır.",
		"COPA EU": "ELIT",
		"COPA C.": "AVRUPA",
		"COPA 3": "CHALL.",
		"ASCENSO": "ÇIKAN",
		"DESCENSO": "DUSEN",
		"CUADRO": "EŞLEŞME",
		"Torneo en curso.": "Turnuva sürüyor.",
		"Quedar entre los {0} primeros del grupo clasifica para {1}.":
			"Grubu ilk {0} içinde bitiren {1} için hak kazanır.",
		"Pasan los {0} primeros de cada grupo.": "Her gruptan ilk {0} takım tur atlar.",
		"El cuadro se sortea al acabar la fase de grupos.":
			"Eşleşmeler grup aşaması bitince çekilir.",


		"El cuadro se sortea al acabar la primera fase.":
			"Eşleşmeler ilk aşama bitince çekilir.",
		"Del 1 al {0}, a octavos. Del {1} al {2}, al playoff. El resto, fuera.":
			"1 ile {0}. arası son 16'ya. {1} ile {2}. arası play-off'a. Gerisi elenir.",
		"Todavía no se ha entregado ninguno. Se falla al cerrar cada temporada, con los números de todo el mundo.":
			"Henüz hiçbiri verilmedi. Her sezon sonunda herkesin istatistiklerine göre belirlenir.",
		"LA VOTACIÓN": "OYLAMA",

		"EL ONCE IDEAL": "YILIN 11'I",

		"{0} ligas en {1} años": "{1} yılda {0} lig şampiyonluğu",
		"Aún no se ha cerrado ninguna temporada.": "Henüz hiçbir sezon tamamlanmadı.",
		"Antes de tu carrera, sin fechas: {0}": "Kariyerinden önce, tarihsiz: {0}",
		"Los once mejores de {0} esa temporada, por nota media.": "O sezon {0} liginin en iyi on biri, not ortalamasına göre.",
		"Los que más cerca estuvieron, con lo que hizo cada uno. Los puntos salen del baremo de abajo.":
			"En çok yaklaşanlar ve her birinin yaptıkları. Puanlar aşağıdaki cetvelden çıkıyor.",
		"Tú quedaste más abajo:": "Sen daha aşağıda kaldın:",
		"Ese año no entraste en la votación.": "O yıl oylamaya giremedin.",
		"Una línea por temporada: goles, asistencias, media y puntos de la votación. Toca una para verla completa.":
			"Her sezon bir satır: gol, asist, ortalama ve oylama puanı. Tamamını görmek için birine dokun.",
		"ASIST.": "ASIST",
		"PUNTOS": "PUAN",
		"No levantó ningún título esa temporada.": "O sezon hiç kupa kaldırmadı.",
		"También: {0}": "Ayrıca: {0}",
		"COMO SE GANA": "NASIL ALINIR",
		"Los puntos con los que se elige al mejor del año. Los de tu selección y los de Europa pesan más.":
			"Yılın oyuncusunu seçen puanlar. Milli takım ve Avrupa puanları daha ağır basar.",
		"Sólo entran en la votación los que juegan la PRIMERA DIVISIÓN de una liga EUROPEA.":
			"Oylamaya yalnızca bir AVRUPA liginin BIRINCI LIGINDE oynayanlar girer.",
		"GOL EN LIGA": "LIG GOLU",
		"ASISTENCIA EN LIGA": "LIG ASISTI",
		"GOL EN {0}": "GOL: {0}",
		"ASISTENCIA EN {0}": "ASIST: {0}",
		"CADA DECIMA DE MEDIA SOBRE {0}": "{0} UZERI HER 0.1 ORTALAMA",
		"{0} PTS": "{0} P",
		"{0}G {1}A  ·  {2}": "{0}G {1}A  ·  {2}",
		"  ({0} en {1})": "  ({0} · {1})",
		"TE PIDIERON: {0}   {1}/{2}": "ISTEDIKLERI: {0}   {1}/{2}",
		"CAPITÁN DE {0}": "KAPTAN: {0}",
		"Llevas la cinta desde hace {0} temporadas.": "{0} sezondur kaptanlık bandını taşıyorsun.",
		"JUGAR PARA {0}": "{0} IÇIN OYNA",
		"SU ONCE CORTA EN {0}": "ILK 11 BARAJI: {0}",
		"¿JUGAR PARA {0}?": "{0} IÇIN OYNA?",
		"Llevas {0} temporadas jugando ahí y ningún partido oficial te ata todavía a {1}. Su once corta en {2}; el de {1}, en {3}.":
			"{0} sezondur orada oynuyorsun ve hiçbir resmi maç seni henüz {1} takımına bağlamıyor. Onların ilk 11 barajı {2}; {1} takımınınki {3}.",
		"No hay marcha atrás. Empiezas de cero con ellos: el seleccionador, el vestuario y la afición vuelven a no conocerte, y pierdes el brazalete si lo llevabas. Tus partidos y tus goles se quedan en tu historial.":
			"Geri dönüşü yok. Onlarla sıfırdan başlıyorsun: milli takım teknik direktörü, soyunma odası ve taraftarlar seni yine tanımıyor olacak; taşıyorsan kaptanlık bandını da kaybedersin. Maçların ve gollerin geçmişinde kalır.",
		"SÍ, ELIJO {0}": "EVET: {0}",
		"SEGUIR CON LOS MÍOS": "KENDI ULKEMLE KAL",
		"{0} se juega al terminar la temporada de clubes; el campeón se sabrá entonces.":
			"{0} kulüp sezonu bitince oynanır; şampiyon o zaman belli olacak.",
		"Clasifícala la próxima vez quedando entre los {0} primeros de tu grupo.":
			"Bir dahaki sefere grubunda ilk {0} içinde bitirerek hak kazan.",
		"Cada sello es un título: temporada · club · división.":
			"Her mühür bir şampiyonluk: sezon · kulüp · lig.",
		"LO QUE SE PUEDE GANAR": "KAZANILABILECEKLER",
		"+{0} SIN REGISTRO": "+{0} KAYITSIZ",

		"GRADA": "TRIBUN",
		"+{0} más": "+{0} daha",
		"CED = esa temporada la jugaste CEDIDO: el club de la fila te tenía prestado, no eras suyo.":
			"KIR = o sezon KIRALIK oynadın: satırdaki kulüp seni kiralamıştı, onların oyuncusu değildin.",
		"MAPA DE TIROS": "ŞUT HARITASI",
		"PEDIR EL CAMBIO": "OYUNDAN ÇIKMA",
		"PROGRESIÓN": "GELIŞIM",
		"Aún no has rematado. Cada tiro que pegues este año queda marcado aquí, con el sitio desde el que salió.":
			"Henüz şut atmadın. Bu yıl attığın her şut, atıldığı yerle birlikte burada işaretlenir.",
		"Ese año aún no se apuntaban los remates.":
			"O yıl şutlar henüz kaydedilmiyordu.",
		"Ese año aún no se apuntaban los pases.":
			"O yıl paslar henüz kaydedilmiyordu.",
		"Ese año aún no se apuntaba por dónde te movías.":
			"O yıl hareketlerin henüz kaydedilmiyordu.",
		"En este partido no remataste.":
			"Bu maçta hiç şut atmadın.",
		"En este partido no le dejaste el balón a nadie.":
			"Bu maçta kimseye pas vermedin.",
		"En este partido no quedó rastro de tus movimientos.":
			"Bu maçta hareketlerinden iz kalmadı.",
		"A PUERTA": "ISABETLI",
		"Sobre {0} remates medidos": "Ölçülen {0} şut üzerinden",
		" · {0} bloqueados (no cuentan: no fue tu puntería)":
			" · {0} engellendi (sayılmaz: nişanınla ilgisi yok)",
		"EL MARCO — dónde cruzó cada tiro": "KALE — her şutun geçtiği yer",
		"EL CAMPO — desde dónde tiraste": "SAHA — nereden şut attın",



		"DESVIADO": "ISABETSIZ",
		"TAPADO": "ENGEL",
		"ANULADO": "IPTAL",
		"POR DÓNDE ANDUVISTE": "NERELERDE DOLAŞTIN",

		"REGATE GANADO": "ÇALIM KAZANDI",
		"SALISTE CON {0}": "BAŞLANGIÇ: {0}",
		"ACABAS EN {0}": "BITIŞ: {0}",
		"RECUPERASTE": "TOPARLANDIN",
		"OTRAS COMPRAS": "DIGER ALIMLAR",
		"DESCANSO Y FÍSICO": "DINLENME VE FIZIK",
		"SIN CAMBIOS": "DEGISIM YOK",
		"EN TODA TU CARRERA": "TUM KARIYERINDE",
		"DESDE MÁS LEJOS": "EN UZAKTAN",
		"TU GOL MÁS LEJANO": "EN UZAK GOLUN",
		"TU PASE MÁS LARGO": "EN UZUN PASIN",
		"Ese año: gol desde {0} m": "O yıl: {0} m'den gol",
		"Esta temporada: gol desde {0} m": "Bu sezon: {0} m'den gol",
		"EL MÁS LARGO": "EN UZUN",
		"Ese año: pase de {0} m": "O yıl: {0} m'lik pas",
		"Esta temporada: pase de {0} m": "Bu sezon: {0} m'lik pas",
		"MAPA": "SAHA",
		"MAPA DE PASES": "PAS HARITASI",
		"REGATES": "ÇALIMLAR",
		"MAPA DE REGATES": "ÇALIM HARITASI",
		"JUGADA ABIERTA": "AKAN OYUN",
		"TODA TU CARRERA": "TUM KARIYERIN",
		"JUGADA": "OYUN",
		"TIRO LIBRE": "FRIKIK",
		"CÓRNER": "KORNER",
		" · sólo {0}": " · yalnızca {0}",
		"Aún no has pisado el campo. Aquí va a quedar el rastro de por dónde te mueves, dónde te quitan el balón y dónde te hacen falta.":
			"Henüz sahaya çıkmadın. Nerede dolaştığın, nerede top kaptırdığın ve nerede faul yaptırdığın burada iz bırakacak.",
		"TE LA QUITARON": "TOP KAYBI",
		"FALTAS A FAVOR": "KAZANILAN FAUL",
		"LA CANCHA — atacas hacia la derecha": "SAHA — sağa doğru hücum ediyorsun",
		"Toca una marca del campo para ver la jugada.": "Pozisyonu görmek için sahadaki bir işarete dokun.",
		"min {0}": "dk {0}",
		"Viendo {0} de {1} · toca otra vez el chip para verlo todo":
			"{1} içinden {0} gösteriliyor · hepsini görmek için çipe tekrar dokun",
		"{0}: {1}": "{0}: {1}",
		"ninguno en {0}": "hiç yok: {0}",
		"1 de cada {0}": "{0} denemede 1",
		"Tus asistencias salen sobre todo {0}: {1} de {2}":
			"Asistlerin çoğunlukla {0}: {2} asistin {1} tanesi",
		"Donde más te la quitan: {0}, {1}.": "Topu en çok kaptırdığın yer: {0}, {1}.",
		"en el último tercio": "son üçte birlik bölgede",
		"en el medio campo": "orta sahada",
		"en tu propio campo": "kendi yarı sahanda",
		"POR LA IZQUIERDA": "SOL KANATTAN",
		"POR EL CENTRO": "ORTADAN",
		"POR LA DERECHA": "SAG KANATTAN",
		"AL LADO IZQUIERDO": "SOLA",
		"AL LADO DERECHO": "SAGA",
		"AL PALO": "DIREKTEN",
		"POR ENCIMA": "USTTEN",
		"DESPEJADO": "DEFEDILDI",
		"REMATE": "ŞUT",
		"ACABÓ EN GOL": "GOLLE BITTI",
		"ACABÓ EN REMATE": "ŞUTLA BITTI",
		"ANULADO POR FUERA DE JUEGO": "OFSAYTTAN IPTAL",
		"SE QUEDÓ SIN REMATE": "ŞUT ÇIKMADI",
		"SE TE ESCAPÓ": "ELINDEN KAÇTI",
		"TE GANÓ EL PORTERO": "KALECI KAZANDI",
		"NO LLEGASTE AL BALÓN": "TOPA YETIŞEMEDIN",
		"TE ENCERRARON": "SIKIŞTIRDILAR",
		"TE HICIERON FALTA": "SANA FAUL YAPILDI",
		"PENAL A TU FAVOR": "LEHINE PENALTI",
		"PERDISTE EL BALÓN": "TOPU KAPTIRDIN",
		"Y TUS REGATES": "VE ÇALIMLARIN",
		"El tercer mapa: por dónde te mueves de verdad, dónde te quitan el balón y dónde te hacen falta.":
			"Üçüncü harita: aslında nerede dolaştığın, nerede top kaptırdığın ve nerede sana faul yapıldığı.",
		"TOCA UNA MARCA": "IŞARETE DOKUN",
		"Cada balón del campo se puede tocar: te dice contra quién fue, en qué minuto, y te dibuja el vuelo que tuvo.":
			"Sahadaki her topa dokunabilirsin: kime karşı olduğunu, hangi dakika olduğunu söyler ve topun uçuşunu çizer.",
		"A REMATE": "ŞUTA",
		"SIN REMATE": "ŞUTSUZ",
		"Sobre {0} pases que llegaron": "İsabetli {0} pas üzerinden",
		" · {0} pases clave": " · {0} kilit pas",
		" · {0} anulados por fuera de juego (no cuentan: no fue tu pase)":
			" · {0} ofsayttan iptal (sayılmaz: senin pasınla ilgisi yok)",
		"EL CAMPO — de dónde a dónde repartes": "SAHA — topu nereden nereye dağıtıyorsun",


		"LA CANCHA — tu último pase de cada jugada": "SAHA — her ataktaki son pasın",
		"LA CANCHA — desde dónde tiraste": "SAHA — nereden şut attın",
		"POR QUÉ ESA NOTA": "NOTUN NEDENI",
		"LO QUE SUMÓ": "ARTIRANLAR",
		"LO QUE RESTÓ": "DUSURENLER",
		"Aún no le has dejado el balón a nadie. Cada pase que llegue a un compañero queda marcado aquí, con el viaje que hizo y en qué acabó la jugada.":
			"Henüz kimseye pas vermedin. Bir takım arkadaşına ulaşan her pas, izlediği yol ve atağın nasıl bittiğiyle birlikte burada işaretlenir.",
		"LARGO": "MESAFE",
		"tablaP": "P",
		"PASE CORTO": "KISA PAS",
		"PASE MEDIO": "ORTA PAS",
		"PASE LARGO": "UZUN PAS",
		"Y TUS PASES": "VE PASLARIN",
		"Arriba se cambia a PASES: a dónde repartes, y cuántos de esos balones acaban en remate o en gol.":
			"Yukarıdan PASLAR'a geç: topu nereye dağıttığın ve bu topların kaçının şut ya da golle bittiği.",
		"{0}: todavía sin marca.": "{0}: henüz işaret yok.",
		"T{0} · CEDIDO": "S{0}·KIRALIK",
		"Mantenimiento: -{0} por partido": "Bakım: maç başına -{0}",
		"RONDA {0}": "TUR {0}",
		"TU": "SEN",
		"EN RACHA": "FORMDA",
		"PJ": "O",
		"A": "A",
		"SEMANA SIN PARTIDO": "BU HAFTA MAÇ YOK",
		"JORNADA": "HAFTA",
		"Tu casillero · abre la TIENDA": "Dolabın · MAGAZA'yı açar",
		"Tu playera · cambia de uniforme": "Formanı değiştir · forma seç",
		"ENERO": "OCAK",
		"FEBRERO": "ŞUBAT",
		"MARZO": "MART",
		"ABRIL": "NISAN",
		"MAYO": "MAYIS",
		"JUNIO": "HAZIRAN",
		"JULIO": "TEMMUZ",
		"AGOSTO": "AGUSTOS",
		"SEPTIEMBRE": "EYLUL",
		"OCTUBRE": "EKIM",
		"NOVIEMBRE": "KASIM",
		"DICIEMBRE": "ARALIK",
		"diaLU": "PZT",
		"diaMA": "SAL",
		"diaMI": "ÇAR",
		"diaJU": "PER",
		"diaVI": "CUM",
		"diaSA": "CMT",
		"diaDO": "PAZ",
		"DÍAS DE DESCANSO": "DINLENME GUNLERI",
		"{0}d": "{0}g",
		"TU PAPEL": "ROLUN",
		"lesionBAJA": "SAKAT",
		"lesionALTA": "HAZIR",
		"{0}D": "{0}G",
		"VER EN GOOGLE PLAY": "GOOGLE PLAY'DE GOR",
		"LOGROS EN GOOGLE PLAY": "GOOGLE PLAY BAŞARIMLARI",
		"Arriba, tu catálogo completo. En Google Play, los que Google conoce: se mandan solos al desbloquearse y se ven en tu perfil de jugador.": "Yukarıda tüm kataloğun. Google Play'de Google'ın bildikleri: kilidini açtığında kendiliğinden gönderilir ve oyuncu profilinde görünür.",
		"Tu fachada {0} es de esta casa: la nueva luce la de fábrica.": "{0} cephen bu evin: yenisi fabrika cephesiyle gelir.",
		"S{0}": "H{0}",
		"AYUDA": "YARDIM",
		"tabla_ligaDG": "AV",
		"TÚ {0}": "SEN {0}",
		"{0} PTS · +{1} AL {2}": "{0} P · {2} ILE +{1}",
		"{0} PTS · -{1} DEL {2}": "{0} P · {2} ILE -{1}",
		"{0} · {1} PTS": "{0} · {1} P",
		"COMPETICIÓN": "TURNUVA",
		"ZONAS": "BOLGELER",
		"NO LA JUEGAS": "SEN OYNAMIYORSUN",
		"GRUPOS": "GRUPLAR",
		"EXENTO": "BAY",
		"POR DEFINIR": "BELLI DEGIL",
		"VIGENTE": "ŞAMPIYON",
		"Pasan los {0} primeros de cada grupo y los {1} mejores terceros.": "Her gruptan ilk {0} takım ve en iyi {1} üçüncü tur atlar.",
		"Pasan también los {0} mejores terceros.": "En iyi {0} üçüncü de tur atlar.",
		"{0} MEJORES": "EN IYI {0}",
		"VIVOS": "KALAN",
		"cuadroGLOBAL": "TOPLAM",
		"FALTAS A TU PALABRA": "SOZUNU TUTMUYORSUN",
		"Dijiste que te quedabas, y te vas igual. Tu grada no lo olvida.": "Kalacağını söylemiştin, yine de gidiyorsun. Taraftarın bunu unutmaz.",
		"DT": "TD",
		"DE {0}": "{0} IÇINDE",
		"TU PAÍS": "ULKEN",
		"TU EDAD": "YAŞIN",
		"CON +1 DE MEDIA: {0}": "+1 NOTLA: {0}",
		"TOP 10 DE {0}": "TOP 10 · {0}",
		"rankingEN EL MUNDO": "DUNYADA",
		"FILTRAR": "FILTRELE",
		"{0} TÍTULOS · -{1} DEL {2}": "{0} KUPA · {2} ILE -{1}",
		"{0} TÍTULOS · +{1} AL {2}": "{0} KUPA · {2} ILE +{1}",
		"carreraLIGAS": "LIGLER",
		"carreraCOPAS": "KUPALAR",
		"tablaTOT": "TOP",
		"{0} PARA {1}": "{1} IÇIN {0}",
		"FUERA DEL TOP {0}": "ILK {0} DIŞINDA",
		"-{0} TÍTULOS": "-{0} KUPA",
		"PICO {0} · T{1}": "ZIRVE {0} · S{1}",
		"RECORRIDO": "YOLCULUK",
		"TEMPS.": "SEZ.",
		"ESTA TEMP.": "BU SEZON",
		"{0}/{1} BATIDOS": "{0}/{1} KIRILDI",
		"MÁS CERCA": "EN YAKIN",
		"AÚN SIN MARCA": "HENUZ KAYIT YOK",
		"ambitoAMÉRICA": "AMERIKA",
		"REQUISITOS": "ŞARTLAR",
		"¿CÓMO SE CALCULA?": "NASIL HESAPLANIR?",
		"-{0} PARA ENTRAR": "KADRO IÇIN -{0}",
		"-{0} PARA SER TITULAR": "ILK 11 IÇIN -{0}",
		"EN {0} TEMP.": "{0} SEZ. SONRA",
		"CON {0} AÑOS": "{0} YAŞINDA",
		"{0} TEMPORADAS · {1} TÍTULOS": "{0} SEZON · {1} KUPA",
		"OFERTAS": "TEKLIFLER",
		"VER CESIÓN": "KIRALIGI GOR",
		"carreraGASTO": "HARCAMA",
		"SIN FICHAJES": "TRANSFER YOK",
		"EL MÁS CARO": "EN PAHALI",
		"{0} FICHAJES": "{0} TRANSFER",
		"1 FICHAJE": "1 TRANSFER",
		"TÍTULOS · -{0} DEL {1}": "KUPA · {1} ILE -{0}",
		"POR DELANTE": "ONUNDE",
		"SELECCIONADOR": "HOCA",
		"-1 TÍTULO": "-1 KUPA",
		"1 TÍTULO": "1 KUPA",
		"RENOVAR": "UZAT",
		"CESIÓN": "KIRALIK",
		"PEDIR": "ISTE",
		"RETIRAR": "GERI AL",
		"CLÁUSULAS": "MADDELER",
		"CAMINO": "YOL",
		"MUÉVEME": "PAZARLA",
		"UNA LIGA": "BIR LIG",
		"UN CLUB": "BIR KULUP",
		"BAJAR FICHA": "MAAŞ INDIR",
		"SUBIR CLÁUSULA": "BEDELI ARTIR",
		"NO VENDERME": "SATMAYIN",
		"{0} BLOQUEADAS": "{0} ENGELLI",
		"C. LIGA": "LIG K.",
		"Patrocinador: {0}": "Sponsor: {0}",
		"{0} LIBRE": "{0} KALDI",
		"VENTA": "SATIŞ",
		"Este año no cuentas: hay que jugar la temporada ENTERA en una Primera europea.": "Bu yıl sayılmıyorsun: sezonun TAMAMINI bir Avrupa birinci liginde oynamalısın.",
		"C. LIGAS": "LIGLER K",
		"¡CAMPEÓN DE LA COPA DE LAS LIGAS!": "LIGLER KUPASI ŞAMPIYONU!",
		"Eliminado de la Copa de las Ligas": "Ligler Kupası'ndan elendi",
		"{0} SIN GUARDAR": "{0} KAYITSIZ",
		"PIERNAS": "BACAKLAR",
		"TODO AL TOPE": "HEPSI TAVAN",
		"SALARIO": "MAAŞ",
		"ESTATUS": "STATU",
		"EL CLUB DICE": "KULUP DIYOR KI",
		"PEDIR SALIDA": "AYRILMAK ISTE",
		"HASTA T{0}": "BITIŞ S{0}",
		"QUEDAN {0} TEMPORADAS": "{0} SEZON KALDI",
		"MANTÉN 1 S": "1 SN BASILI TUT",
		"Tu temporada da para pedir mejora: siéntate con el club.": "Sezonun daha iyisini hak ediyor: kulüple masaya otur.",
		"El club está contento con lo firmado.": "Kulüp imzalanandan memnun.",
		"YA LO PEDISTE": "ZATEN ISTEDIN",
		"CONTESTA LO PENDIENTE": "ONCE BEKLEYENI YANITLA",
		"AÚN NO TE ESCUCHAN": "HENUZ DINLEMIYORLAR",
		"CUANDO ABRA EL MERCADO": "TRANSFER DONEMINDE",
		"PRÓXIMO CRUCE": "SIRADAKI MAÇ",
		"TU TÉCNICO": "HOCAN",
		"GRUPOS {0}-{1}": "GRUPLAR {0}-{1}",
		"VER EL GOL": "GOLU IZLE",
		"MANTEN PARA BORRAR": "BASILI TUT: SIL",
		"NO SE PUEDE LEER": "OKUNAMIYOR",
		"SIN GOLES TODAVIA": "HENUZ GOL YOK",
		"MARCA, Y EN LA REPETICION PULSA": "GOL ATTIN, TEKRARDA DOKUN",
		"LLENO · BORRA UNO PARA GUARDAR OTRO": "DOLU · YENISI ICIN BIRINI SIL",
		"TOCA UN GOL Y VELO. BORRAR SE MANTIENE.": "GOLE DOKUN. SIL: BASILI TUT.",
		"{0} M/S": "{0} M/S",
		"Hasta 30 goles por carrera. Se ven con el cielo y el viento de aquel día, en tu estadio de hoy.": "Kariyer başına en fazla 30 gol. O günün gökyüzü ve rüzgârıyla, bugünkü stadyumunda izlenir.",
		"El archivo se dañó. Sólo queda borrarlo.": "Dosya bozuldu. Tek çare onu silmek.",
		"GALAS": "GALA",
		"GANADOR": "KAZANAN",
		"La votación del año arranca con la primera jornada.": "Yılın oylaması ilk haftayla başlıyor.",
		"ONCE IDEAL": "EN IYI 11",
		"VER TODOS": "TUMU",
		"VOTACIÓN": "OYLAMA",
	},










	"shop": {

		"ROPA DE CALLE": "SOKAK KIYAFETI",
		"Toca una prenda para comprarla. Lo que compres te espera en ASPECTO.": "Satın almak için bir parçaya dokun. Aldıkların seni GORUNUM'de bekler.",

		"CAMILLA DE FISIOTERAPIA": "FIZYOTERAPI MASASI",
		"PIZARRA TÁCTICA": "TAKTIK TAHTASI",
		"BICICLETA ESTÁTICA": "SABIT BISIKLET",
		"MURO DE RÉCORDS": "REKOR DUVARI",
		"RINCÓN DE LECTURA": "OKUMA KOSESI",
		"MESA DE RECUERDOS": "ANI MASASI",
		"Camilla y material de recuperación. Su sesión recupera energía, no cura lesiones.": "Tedavi masası ve toparlanma ekipmanı. Bir seans enerji kazandırır, sakatlık iyileştirmez.",
		"Pizarra móvil para preparar el próximo partido. El bono se activa al usarla.": "Bir sonraki maça hazırlanmak için taşınabilir tahta. Bonus kullanınca devreye girer.",
		"Cardio suave en casa; requiere estar sin lesión para pedalear.": "Evde hafif kardiyo; pedal çevirmek için sakat olmaman gerekir.",
		"Tus goles, asistencias, títulos y mejores temporadas, con datos reales.": "Gollerin, asistlerin, kupaların ve en iyi sezonların, gerçek verilerle.",
		"Sillón, libro y luz cálida: lee para recuperar energía y ánimo.": "Koltuk, kitap ve sıcak ışık: enerji ve moral toplamak için oku.",
		"Cartas y recuerdos de tu carrera. Consulta los momentos guardados.": "Kariyerinden mektuplar ve anılar. Kayıtlı anlarına göz at.",
		"SESIÓN DE FISIOTERAPIA": "FIZYOTERAPI",
		"PREPARAR EL PARTIDO": "MAÇ HAZIRLIGI",
		"PEDALEAR SUAVE": "HAFIF PEDAL",
		"LEER CON CALMA": "SAKIN OKUMA",
		"Recupera hasta 12 de energía. No acorta las lesiones. Una acción semanal.": "12 enerjiye kadar kazandırır. Sakatlığı kısaltmaz. Haftada bir eylem.",
		"+3 puntos de precisión efectiva para el próximo partido. Una acción semanal.": "Bir sonraki maç için +3 etkin isabet puanı. Haftada bir eylem.",
		"Hasta +5 de energía y +1 con el técnico, sin lesión. Una acción semanal.": "Sakat değilken +5 enerjiye kadar ve hocayla +1. Haftada bir eylem.",
		"Hasta +3 de energía y +1 de ánimo. Una acción semanal.": "+3 enerjiye kadar ve +1 moral. Haftada bir eylem.",
		"VER RÉCORDS": "REKORLAR",
		"ABRIR RECUERDOS": "ANILARI AÇ",
		"VER CONDICIÓN": "KONDISYON",
		"de ánimo": "moral",
		"PRECISIÓN +3 · PRÓXIMO PARTIDO": "ISABET +3 · SONRAKI MAÇ",
		"Coloca este mueble para usarlo.": "Kullanmak için bu eşyayı yerleştir.",
		"Espera al alta médica para pedalear.": "Pedal çevirmek için doktordan onay bekle.",
		"La preparación táctica ya está lista para el próximo partido.": "Taktik hazırlığın bir sonraki maç için zaten hazır.",
		"Ahora mismo no necesitas esta sesión.": "Şu an bu seansa ihtiyacın yok.",
		"Consultar no consume acciones ni cambia tus estadísticas.": "Göz atmak eylem harcamaz ve istatistiklerini değiştirmez.",
		"Aún no hay partidos registrados para este muro.": "Bu duvar için henüz kayıtlı maç yok.",
		"Los recuerdos aparecerán cuando tu carrera deje momentos guardados.": "Kariyerin özel anlar biriktirdikçe anılar burada belirecek.",
		"TU HISTORIA EMPIEZA AQUÍ": "HIKAYEN BURADA BAŞLIYOR",
		"RECUERDOS": "ANILAR",
		"{0} TÍTULOS": "{0} KUPA",
		"{0} / {1}": "{0} / {1}",
		"GOLES CON TUS CLUBES": "KULUP GOLLERIN",
		"ASISTENCIAS CON TUS CLUBES": "KULUPLERINLE ASISTLERIN",
		"TU MEJOR TEMPORADA GOLEADORA": "EN GOLCU SEZONUN",
		"TU MEJOR TEMPORADA DE ASISTENCIAS": "EN ÇOK ASIST YAPTIGIN SEZON",
		"TU MEJOR MEDIA DE TEMPORADA": "EN YUKSEK SEZON ORTALAMAN",
		"NOTA {0} · {1} PARTIDOS": "NOT {0} · {1} MAÇ",
		"TÍTULOS GANADOS": "KAZANILAN KUPA",
		"TU DEBUT CON UN CLUB": "KULUPTE ILK MAÇIN",
		"TU DEBUT CON LA SELECCIÓN": "MILLI TAKIMDA ILK MAÇIN",
		"TU CESIÓN": "KIRALIK",
		"CAMISETA INTERCAMBIADA": "DEGIŞILEN FORMA",
		"BALÓN DEL PARTIDO": "MAÇ TOPU",
		"RESULTADO {0}–{1}": "SONUÇ {0}–{1}",
		"Los grandes de Europa se fijan en ti.": "Avrupa'nın büyükleri seni izliyor.",
		"Tienes con qué, pero te falta FAMA: haz ruido marcando.":
			"Yeteneğin var ama SOHRETIN eksik: gol atarak ses getir.",
		"Gustas, pero necesitas más NIVEL: al gimnasio.":
			"Beğeniyorlar ama daha çok SEVIYE lazım: spor salonuna.",
		"Te siguen, pero tu MEDIA no acompaña: hay que rendir.":
			"Takip ediyorlar ama ORTALAMAN yetmiyor: performans göstermelisin.",
		"POT": "GUÇ",
		"PRE": "ISB",
		"EFE": "FLS",
		"ENERGIA": "ENERJI",
		"RIESGO": "RISK",
		"SEMANAS BAJA": "SAKAT HAFTA",
		"COMISION": "KOMISYON",
		"PRENSA": "BASIN",
		"AFICIÓN": "TARAFT.",
		"AGENTE": "MENAJ.",
		"TÉCNICO": "HOCA",


		"VESTUARIO": "SOYUNMA ODASI",
		"ROTO": "KOPUK",
		"FRÍO": "UZAK",
		"BUENO": "IYI",
		"INCONDICIONAL": "SADIK",
		"BARRIO 90": "SOKAK 90",
		"Tu primer salto. Un poco de todo, a tu alcance.": "İlk sıçrayışın. Her şeyden biraz, bütçene uygun.",
		"ACERO PRO": "ÇELIK PRO",
		"Hechas para durar. Rendimiento modesto, muchos partidos.": "Dayanıklı yapıldılar. Mütevazı performans, bol maç.",
		"ÓRBITA 10": "ORBIT 10",
		"Coloca y dibuja la curva. Menos fuerza, más intención.": "Yerleştir ve falso ver. Daha az güç, daha çok niyet.",
		"ECLIPSE X": "ECLIPSE X",
		"Oscuridad y neón. Potencia, puntería y una comba de élite.": "Karanlık ve neon. Elit güç, isabet ve falso.",
		"NOVA PRISM": "NOVA PRISM",
		"Brillo de otro mundo. Cada disparo traza su propia curva.": "Başka bir dünyadan parıltı. Her şut kendi eğrisini çizer.",
		"ZÉNIT SUPREMA": "ZIRVE SUPREMA",
		"La cima del juego. Fuerza, precisión y comba sin concesiones.": "Oyunun zirvesi. Ödünsüz güç, isabet ve falso.",
		"+ {0} · DURAN {1} PARTIDOS": "+ {0} · {1} MAÇ DAYANIR",
		"Si ya las tienes, vuelven al 100% de vida.": "Zaten varsa dayanıklılıkları %100'e döner.",
		"{0} están en tu ropero con el 100% de vida.": "{0} gardırobunda %100 dayanıklılıkla duruyor.",
		"BOTA DE CANTERA": "ALTYAPI BOTU",
		"Las de siempre. Sin trucos.": "Her zamankiler. Hilesiz.",
		"TRUENO XT": "SIMSEK XT",
		"Pega más fuerte, pero cuesta domarla.": "Daha sert vurur ama ehlileştirmesi zor.",
		"BISTURÍ 09": "NEŞTER 09",
		"Para quien coloca en vez de reventar.":
			"Topu patlatmak yerine yerleştirenlere.",
		"COMBA CLÁSICA": "KLASIK FALSO",
		"Rosca de verdad. La falta es tuya.": "Gerçek falso. Serbest vuruş senin.",
		"CORONA DE ORO": "ALTIN TAÇ",
		"Sin peros. Si puedes pagarla.": "Aması yok. Parası yetene.",
		"BEBIDA ENERGÉTICA": "ENERJI IÇECEGI",
		"+35 de energía. Ábrela entre semana o en el descanso.":
			"+35 enerji. Hafta içinde ya da devre arasında aç.",
		"GEL ANTIINFLAMATORIO": "ANTI-ENFLAMATUVAR JEL",
		"Adelanta una semana tu recuperación.": "İyileşmeni bir hafta öne çeker.",
		"SESIÓN DE VÍDEO": "VIDEO ANALIZI",
		"+1 de forma. Estudias al rival.": "+1 form. Rakibi inceliyorsun.",
		"CÁMARA HIPERBÁRICA": "HIPERBARIK ODA",
		"Borra cualquier lesión al instante y devuelve +20 de energía. El cuerpo sólo la aguanta una vez por temporada.":
			"Her sakatlığı anında siler ve +20 enerji verir. Vücudun bunu sezonda yalnızca bir kez kaldırır.",
		"CORTE DE AUTOR": "OZEL SAÇ KESIMI",
		"Sales en las fotos. Barato y sin enemigos.":
			"Fotoğraflarda çıkarsın. Ucuz ve kimseyi kızdırmaz.",
		"CENA CON EL VESTUARIO": "TAKIMLA AKŞAM YEMEGI",
		"La química se compra. Se puede repetir.":
			"Uyum satın alınır. Tekrarlanabilir.",

		"TU AGENTE": "MENAJERIN",
		"EL DE SIEMPRE": "ESKISI",
		"Ahora te lleva: {0} · se queda el {1}% de lo que cobras": "Şimdi seninle: {0} · kazancının %{1} kadarını alır",
		"No hay nadie por encima. La agencia es tuya.": "Üstünde kimse yok. Ajans senin.",
		"VUELVE EN {0}": "DONUŞ: {0}",
		"YA ESTE AÑO": "BU YIL YAPILDI",
		"COMISIÓN %": "KOMISYON %",
		"AGENTE CON OFICINA": "OFISLI MENAJER",
		"Deja de atenderte desde el coche. Comisión del 7%.": "Artık seni arabadan aramıyor. Komisyon %7.",
		"AGENTE CON CARTERA": "PORTFOYLU MENAJER",
		"Ya lleva a otros profesionales. Más clubes te miran, y cobra el 6%.": "Artık başka profesyonelleri de temsil ediyor. Daha çok kulüp seni izler; %6 alır.",
		"AGENCIA DE PRIMERA": "BUYUK AJANS",
		"Un equipo detrás de tu nombre: ofertas de fuera y prensa a favor. El 5%.": "Adının arkasında bir ekip: yurt dışından teklifler ve dost basın. %5.",
		"AGENTE DE ESTRELLAS": "YILDIZ MENAJERI",
		"Sólo lleva a quince jugadores en el mundo y tú eres uno. El 3,5%.": "Dünyada yalnızca on beş oyuncuyu temsil ediyor ve biri sensin. %3,5.",
		"TU PROPIA AGENCIA": "KENDI AJANSIN",
		"El despacho es tuyo y él trabaja para ti. La comisión baja al 2,5%.": "Ofis senin ve o senin için çalışıyor. Komisyon %2,5'e düşer.",
		"La grada corea tu nombre. Las marcas lo notan. Una vez por temporada.": "Tribün adını haykırıyor. Markalar fark ediyor. Sezonda bir kez.",

		"CHARLA CON EL PSICÓLOGO": "SPOR PSIKOLOGU",
		"Tu próximo partido no te bajará la forma, juegues como juegues.": "Nasıl oynarsan oyna, bir sonraki maç formunu düşürmeyecek.",
		"BOTELLÍN ISOTÓNICO": "SPOR IÇECEGI",
		"+10 de energía, y tus botas no se gastan en el próximo partido.": "+10 enerji ve kramponların bir sonraki maçta aşınmaz.",

		"CENA CON EL CAPITÁN": "KAPTANLA AKŞAM YEMEGI",
		"Invitas al vestuario y pagas tú. +7 con el equipo. No se puede repetir en 10 partidos.":
			"Takımı yemeğe çıkarıyorsun, hesap senden. Takımla +7. 10 maç boyunca tekrarlanamaz.",
		"REUNIÓN CON EL TÉCNICO": "HOCAYLA TOPLANTI",
		"Le pides explicaciones y sales reforzado. +6 con el técnico — pero si fallas en el próximo partido, se lo cobra el doble.":
			"Hesap soruyorsun ve güçlenerek çıkıyorsun. Hocayla +6 — ama bir sonraki maçta kötü oynarsan sana iki katını ödetir.",
		"INFILTRACIÓN": "IGNE",
		"Juegas el próximo partido aunque estés lesionado. Al acabar, tu baja crece 2 semanas.":
			"Sakat olsan da bir sonraki maçta oynarsın. Maç bitince sakatlık süren 2 hafta uzar.",
		"SIN LESIÓN": "SAKAT YOK",
		"NO DISPONIBLE": "KULLANILAMAZ",
		"EN {0} {1}": "{0} {1} SONRA",
		"JUGAR INFILTRADO": "IGNEYLE OYNA",
		"LESIONADO · TU BAJA CRECERÁ {0} SEMANAS": "SAKAT · YOKLUGUN {0} HAFTA UZAYACAK",
		"YA PUESTO": "HAZIR",
		"Te pones el atuendo {0} en ASPECTO.": "GORUNUM'de {0} kıyafetinin kilidini açar.",
		"Ya vistes el atuendo {0} en ASPECTO.": "GORUNUM'de {0} kıyafetini giyiyorsun.",

		"Atuendo": "Kıyafet",
		"DE ORO": "ALTIN",
		"DEL BARRIO": "SOKAK",
		"DE PISTA": "PIST",
		"DE OFICINA": "OFIS",
		"RELOJ DE ORO": "ALTIN SAAT",
		"Todos lo ven. El técnico también.": "Herkes görür. Hoca da.",
		"DONACIÓN AL BARRIO": "MAHALLEYE BAGIŞ",
		"La grada corea tu nombre. Las marcas lo notan.":
			"Tribün adını haykırıyor. Markalar fark ediyor.",
		"GIMNASIO EN CASA": "EV SPOR SALONU",
		"Cuidas el cuerpo: recuperas algo más tras cada partido.":
			"Vücuduna iyi bakıyorsun: her maçtan sonra biraz daha toparlanırsın.",
		"DEPORTIVO": "SPOR ARABA",
		"MUSCLE CAR": "MUSCLE CAR",
		"COMPACTO URBANO": "ŞEHIR HATCHBACK",
		"SEDÁN CLÁSICO": "KLASIK SEDAN",
		"FAMILIAR VIAJERO": "STATION WAGON",
		"PICKUP DE CAMPO": "KIR PIKAPI",
		"Pequeño, amarillo y práctico. Tu primer coche sin presumir.": "Küçük, sarı ve pratik. Gösterişsiz ilk araban.",
		"Cuatro puertas, azul discreto y espacio para el día a día.": "Dört kapı, sade mavi ve günlük hayat için yer.",
		"Carrocería larga, barras de techo y maletero para todo el equipo.": "Uzun gövde, tavan rayları ve tüm ekipmanına yetecek bagaj.",
		"Robusta, sencilla y con caja abierta. Para salir de la ciudad.": "Sağlam, sade ve açık kasalı. Şehirden kaçmak için.",
		"COCHERA DE COLECCIÓN": "KOLEKSIYON GARAJI",
		"Ocho plazas en una ampliación a la derecha de casa. Terreno incluido y coches colocados automáticamente. Sin mantenimiento.": "Evinin sağındaki ek binada sekiz park yeri. Arsa dahil, arabalar otomatik yerleşir. Bakım gerektirmez.",
		"ESTACIONAR LOS CUATRO": "DORDUNU DE PARK ET",
		"Cuatro plazas, portón abierto y paso a casa. Sin mantenimiento.": "Dört park yeri, açık garaj kapısı ve eve geçiş. Bakım gerektirmez.",
		"Primero coloca la cochera.": "Önce garajı yerleştir.",
		"Necesitas tener los cuatro coches.": "Dört arabaya da sahip olman gerekiyor.",
		"Apártate de las plazas antes de estacionar.": "Park etmeden önce park yerlerinden çekil.",
		"Hay una plaza bloqueada. No se movió ningún coche.": "Bir park yeri kapalı. Hiçbir araba taşınmadı.",
		"La cochera necesita un espacio libre de paredes.": "Garaj için duvarsız boş bir alan gerekiyor.",
		"Tu coche de colección. Colócalo, gíralo o guárdalo en casa.": "Koleksiyon araban. Yerleştir, döndür ya da evde sakla.",
		"Tu reloj de oro, expuesto en casa.": "Altın saatin, evde sergileniyor.",
		"GRAN TURISMO": "GRAN TURISMO",
		"HIPERDEPORTIVO": "HIPER ARABA",
		"Franjas negras y cuatro faros. Te oyen antes de verte.": "Siyah şeritler ve dört far. Seni görmeden önce duyarlar.",
		"Capó largo y verde de lujo. Elegancia que sale en todas las fotos.": "Uzun kaput ve lüks yeşil. Her fotoğrafa giren bir zarafet.",
		"Plata, carbono y alerón. Una pieza de colección que acapara portadas.": "Gümüş, karbon ve rüzgârlık. Manşetleri kapan bir koleksiyon parçası.",
		"Llegas tarde a entrenar, pero llegas.":
			"Antrenmana geç kalıyorsun ama geliyorsun.",
		"AGENTE DE PRIMERA": "UST DUZEY MENAJER",
		"Más ofertas sobre la mesa y mejor regateo.":
			"Masada daha çok teklif ve daha iyi pazarlık.",
		"CASA CON JARDÍN": "BAHÇELI EV",
		"Descansas de verdad: recuperas bastante más tras cada partido.":
			"Gerçekten dinleniyorsun: her maçtan sonra çok daha fazla toparlanırsın.",



		"DEPARTAMENTO": "DAIRE",
		"Un cuarto, una ventana y el sitio justo para la primera copa.":
			"Bir oda, bir pencere ve ilk kupan için tam yetecek yer.",
		"CASA MODERNA": "MODERN EV",
		"Sala de trofeos propia y aún mejor descanso entre partidos.":
			"Kendine ait kupa odası ve maçlar arasında daha da iyi dinlenme.",
		"Galería, garage y tu cancha tras la puerta del fondo.":
			"Galeri, garaj ve arka kapının ardında kendi sahan.",
		"CAMPO DE ENTRENAMIENTO": "ANTRENMAN SAHASI",
		"TU FRASE ESTÁ EN SU GRADA": "SOZUN ONLARIN TRIBUNUNDE",
		"TU CUMPLEAÑOS": "DOGUM GUNUN",
		"SIN PONER": "YOK",
		"¿QUÉ MES?": "HANGI AY?",
		"¿QUÉ DÍA DE {0}?": "{0}: HANGI GUN?",
		"HOY NO SE ENTRENA": "BUGUN IDMAN YOK",
		"FELIZ CUMPLEAÑOS": "IYI KI DOGDUN",
		"Te esperaban dentro. Alguien del vestuario se acordó, y eso en un vestuario no es poco.": "Seni içeride bekliyorlardı. Soyunma odasından biri hatırladı ve bir soyunma odasında bu az şey değil.",
		"ENE": "OCA",
		"FEB": "ŞUB",
		"MAR": "MAR",
		"ABR": "NIS",
		"MAY": "MAY",
		"JUN": "HAZ",
		"JUL": "TEM",
		"AGO": "AGU",
		"SEP": "EYL",
		"OCT": "EKI",
		"NOV": "KAS",
		"DIC": "ARA",
		"EL MICRÓFONO ABIERTO": "AÇIK MIKROFON",
		"Semana de derbi y el periodista deja el micro abierto: '¿os ven por encima de {0}?'. Sabes que lo que digas va a estar en su grada el domingo.": "Derbi haftası ve muhabir mikrofonu açık bırakıyor: 'Kendinizi {0} takımından üstün görüyor musunuz?'. Ne dersen pazar günü onların tribününde olacak, biliyorsun.",
		"MEDIR LAS PALABRAS": "SOZLERINI TART",
		"SOLTAR LA BRAVATA": "BUYUK KONUŞ",

		"LLEGAN SIN SU ESTRELLA": "YILDIZLARI YOK",
		"Tu próximo rival llega sin uno de sus mejores jugadores, que está lesionado. En la rueda de prensa te preguntan si es el partido para aprovecharlo.": "Bir sonraki rakibin en iyi oyuncularından biri sakat ve maçta yok. Basın toplantısında bunu fırsata çevirecek maç olup olmadığını soruyorlar.",
		"RESPETAR AL RIVAL": "RAKIBE SAYGI",
		"HAY QUE APROVECHARLO": "FIRSATI KULLANALIM",

		"VIENEN LANZADOS": "SERIDELER",
		"{0} llega con cinco victorias seguidas en liga. En la rueda de prensa te preguntan si os dan miedo.": "{0} ligde art arda beş galibiyetle geliyor. Basın toplantısında onlardan korkup korkmadığınızı soruyorlar.",
		"RESPETO, NO MIEDO": "SAYGI, KORKU YOK",
		"LA RACHA SE ACABA AQUÍ": "SERI BURADA BITER",
		"UN GRANDE HERIDO": "YARALI DEV",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Te preguntan si es el mejor momento para cruzártelos.": "{0} beş haftadır kazanamıyor ve tribünleri kelle istiyor. Onlarla karşılaşmanın en doğru zaman olup olmadığını soruyorlar.",
		"UN GRANDE SIEMPRE ES UN GRANDE": "DEV HER ZAMAN DEVDIR",
		"HAY QUE REMATARLOS": "IŞLERINI BITIRELIM",
		"BANQUILLO NUEVO ENFRENTE": "KARŞIDA YENI HOCA",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y la prensa quiere saber si tú sí.": "{0} bu sezon yeni teknik direktörle başladı: {1}. Henüz kimse nasıl oynadıklarını bilmiyor ve basın senin bilip bilmediğini merak ediyor.",
		"ESTUDIARLO CON EL MÍSTER": "HOCAYLA ONLARI ÇALIŞ",
		"QUE SE PREOCUPE ÉL": "O DUŞUNSUN",
		"TU ANTIGUO TÉCNICO": "ESKI HOCAN",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Los periodistas buscan la foto del reencuentro.": "Bir zamanlar seni çalıştıran teknik direktör {0} şimdi {1} kulübünün kulübesinde oturuyor. Muhabirler buluşma fotoğrafının peşinde.",
		"UN ABRAZO ANTES DEL PARTIDO": "MAÇTAN ONCE SARIL",
		"HOY ES UN RIVAL MÁS": "BUGUN O SADECE RAKIP",
		"SU GRAN FICHAJE": "BUYUK TRANSFER",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Te preguntan si el duelo es entre vosotros dos.": "{1} bu sezon {0} adlı oyuncuyu transfer etti ve şimdiden ilk 11'lerinin en iyilerinden. Düellonun ikiniz arasında olup olmadığını soruyorlar.",
		"ES UN PARTIDO DE EQUIPOS": "BU BIR TAKIM OYUNU",
		"AQUÍ LE ESPERO": "ONU BEKLIYORUM",
		"CAMPEÓN EN CASA": "MEMLEKETTE ŞAMPIYON",
		"En tu país se ha coronado {0}, y la prensa de allí te pregunta si algún día te verán jugar en casa.": "Ülkende {0} şampiyon oldu ve oranın basını bir gün seni memlekette oynarken görüp göremeyeceklerini soruyor.",
		"ALGÚN DÍA, QUIÉN SABE": "BIR GUN, KIM BILIR",
		"AQUÍ ESTOY A GUSTO": "BURADA MUTLUYUM",
		"TE PIDEN QUE LO ACLARES": "AÇIKLAMA ISTIYORLAR",
		"Tu frase lleva toda la semana en la portada y en la grada de {0}. El club te pregunta si quieres suavizarla antes del domingo.": "Sözün bütün hafta manşetlerde ve {0} tribünlerinde. Kulüp pazardan önce yumuşatmak isteyip istemediğini soruyor.",
		"SOSTENERLA": "SOZUMDEYIM",
		"SUAVIZARLA": "YUMUŞAT",
		"UN GOL EN DOS JORNADAS": "IKI MAÇTA BIR GOL",
		"Te llama al despacho y no se anda con rodeos: si no marcas en las dos próximas jornadas, te sientas.": "Seni odasına çağırıyor ve lafı dolandırmıyor: sonraki iki maçta gol atmazsan yedek kulübesine oturursun.",
		"AGACHAR LA CABEZA": "BOYUN EG",
		"DECIRLE LO QUE PIENSAS": "DUŞUNDUGUNU SOYLE",
		"LO MARCASTE": "ATTIN",
		"Marcaste dentro del plazo. En el pasillo no te dijo nada, pero el lunes tu nombre volvió a la pizarra del once.": "Süre dolmadan gol attın. Koridorda bir şey demedi ama pazartesi adın yine ilk 11 tahtasındaydı.",
		"SE ACABÓ EL PLAZO": "SURE DOLDU",
		"Dos jornadas, ningún gol. No hizo falta que te lo dijera: el once del domingo ya no te lleva.": "İki maç, sıfır gol. Söylemesine gerek kalmadı: pazar günkü ilk 11'de artık yoksun.",
		"EL CAPITÁN TE PARA": "KAPTAN SENI DURDURDU",
		"{0} te espera en la puerta del vestuario. No levanta la voz: te dice que el equipo lleva semanas jugando para ti y que eso se acaba hoy.": "{0} soyunma odasının kapısında seni bekliyor. Sesini yükseltmiyor: takımın haftalardır senin için oynadığını ve bunun bugün bittiğini söylüyor.",
		"CONTESTARLE": "CEVAP VER",
		"TE ESPERAN EN EL TÚNEL": "TUNELDE SENI BEKLEYEN VAR",
		"Un crío con tu nombre en la espalda lleva media hora esperando en la boca del túnel. Su padre le dice que no molestes, que ya vas tarde.": "Sırtında senin adın yazan bir çocuk yarım saattir tünelin ağzında bekliyor. Babası seni rahatsız etmemesini, zaten geç kaldığını söylüyor.",
		"PARARTE CON ÉL": "ONUN IÇIN DUR",
		"SALUDAR Y SEGUIR": "EL SALLA VE GEÇ",
		"TU CASILLERO NO ESTÁ COMO LO DEJASTE": "DOLABIN BIRAKTIGIN GIBI DEGIL",
		"Llegas al vestuario y tu hueco está lleno de espuma hasta arriba. Nadie te mira, pero nadie está haciendo nada tampoco.": "Soyunma odasına geliyorsun ve yerin tepeye kadar köpükle dolu. Kimse sana bakmıyor ama kimse bir şey de yapmıyor.",
		"SEGUIRLES EL JUEGO": "OYUNA AYAK UYDUR",
		"LIMPIAR EN SILENCIO": "SESSIZCE TEMIZLE",
		"TE PARA EN LA BANDA": "SENI KENARDA DURDURUYOR",
		"Te sustituye, y en vez de darte la mano y mirar al campo te para, te dice algo al oído y te abraza hasta que la grada se levanta.": "Seni oyundan alıyor ve elini sıkıp sahaya dönmek yerine seni durduruyor, kulağına bir şey fısıldıyor ve tribün ayağa kalkana kadar sarılıyor.",
		"ESCUCHARLE": "ONU DINLE",
		"IRTE AL BANQUILLO": "KULUBEYE GIT",
		"EL ONCE YA ESTÁ DIBUJADO": "ILK 11 ÇOKTAN YAZILDI",
		"Entras al vestuario antes que nadie y la pizarra ya tiene el once del domingo. Lo lees dos veces: tu nombre no está en ninguna de las dos.": "Soyunma odasına herkesten önce giriyorsun ve tahtada pazar günkü ilk 11 yazılı. İki kez okuyorsun: adın ikisinde de yok.",
		"BORRARLA": "SIL",
		"AQUÍ NO TE OLVIDAN": "SENI UNUTMADILAR",

		"EX CLUB · TITULAR · ~{0} MIN": "ESKI KULUP · ILK 11 · ~{0} DK",
		"EX CLUB · DESDE LA BANCA · ~{0} MIN": "ESKI KULUP · YEDEKTEN · ~{0} DK",
		"SU GRADA NO OLVIDA TU TRASPASO": "TRIBUN SATIŞINI UNUTMADI",
		"SU GRADA RECUERDA TU CESIÓN": "TRIBUN KIRALIK DONEMI ANAR",
		"SU GRADA NI SE INMUTA": "TRIBUN HIÇ ALDIRMIYOR",
		"TU EX CLUB, DE VISITA": "ESKI KULUBUN KONUK",
		"TU EX CLUB, ENFRENTE": "ESKI KULUBUN KARŞIDA",
		"{0} · MÁRCALE: HAY PRIMA": "{0} · GOL AT: PRIM VAR",
		"GOL AL EX CLUB": "ESKI KULUBE GOL",
		"TRAIDOR": "HAIN",
		"BENGALA EN EL CÉSPED": "SAHADA MEŞALE",
		"SE PELEAN EN TU GRADA": "TRIBUNUNDE KAVGA VAR",
		"CANCHA DE {0}": "SAHA: {0}",
		"VISITAR MI CASA": "EVIME GIT",
		"SALIR DE CASA": "EVDEN ÇIK",
		"SEGUNDO PISO": "IKINCI KAT",
		"TERCER PISO": "UÇUNCU KAT",
		"Una planta más. Se levanta sobre lo que ya cerraste.": "Bir kat daha. Zaten kapattığın alanın üstüne yükselir.",
		"La última planta, y la que se ve desde la calle.": "En üst kat, sokaktan görünen.",
		"PRIMERO EL SEGUNDO PISO": "ONCE IKINCI KAT",
		"NO HAY NADA CERRADO DEBAJO": "ALTTA KAPALI ALAN YOK",
		"ADICIONES": "EKLER",
		"ACABADOS": "KAPLAMA",
		"MATERIAL DE ESTA PARED": "BU DUVARIN MALZEMESI",
		"EL DE LA CASA": "EVIN KENDI",
		"PISO": "ZEMIN",
		"PARED": "DUVAR",
		"El suelo y la pared, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.":
			"Zemin ve duvar, tercih senin. Ayrı ayrı alınır ve sende kalır: istediğin zaman değiştirebilirsin.",
		"Instaladas: {0} de {1}.": "Kurulu: {1} içinden {0}.",
		"Muebles, mejoras y mascotas para tu casa. Se compran una vez y las colocas donde quieras desde VISITAR.": "Evin için mobilya, geliştirmeler ve evcil hayvanlar. Bir kez alınır, ZIYARET'ten istediğin yere yerleştirirsin.",
		"TIENES {0}": "SENDE: {0}",
		"POR PARTIDO": "MAÇ BAŞI",
		"TE CONVIENE": "DEGER",
		"AL ALCANCE": "UYGUN",
		"COLOCAR AHORA": "ŞIMDI KOY",
		"Compraste {0}. Está en tus cajas.": "Satın aldın: {0}. Kutularında duruyor.",
		"Así quedaría tu casa.": "Evin böyle görünürdü.",
		"Nada al alcance en este cajón.": "Bu çekmecede alabileceğin bir şey yok.",
		"{0} x {0} m": "{0} x {0} m",
		"OTRA MÁS": "BIR DAHA",
		"OTRA MÁS · {0}": "BIR DAHA · {0}",
		"Se compran en MI JUGADOR ▸ CASA.": "OYUNCUM ▸ EV bölümünden alınır.",
		"TU CASA se reinicia a 0: se vende y te devuelven el 80% de lo invertido.":
			"EVIN sıfırlanır: satılır ve yatırdığının %80'i sana geri döner.",
		"INSTALADO": "KURULDU",
		"INSTALAR · {0}": "KUR · {0}",
		"Abre: {0}.": "Açar: {0}.",
		"Si cambias de club la vendes y empiezas de cero: te devuelven el 80% de lo invertido.":
			"Kulüp değiştirirsen evi satıp sıfırdan başlarsın: yatırdığının %80'i geri döner.",
		"Si cambias de club empiezas de cero: la casa se queda, y te devuelven el 80% de lo invertido.":
			"Kulüp değiştirirsen sıfırdan başlarsın: ev kalır ve yatırdığının %80'i geri döner.",



		"fuera de la cuadrícula": "ızgaranın dışında",
		"se sale del suelo": "zeminin dışına taşıyor",
		"tapa la puerta": "kapıyı kapatıyor",

		"sin sitio para usarlo": "kullanacak yer yok",
		"tiene que ir pegado a una pared": "duvara bitişik olmalı",
		"no puede mirar a la pared": "duvara dönük olamaz",
		"a la intemperie no se cuelga nada": "açık havaya bir şey asılmaz",
		"el helipuerto va en el jardín, sobre el pasto": "helikopter pisti bahçeye, çimin üstüne gider",
		"el helipuerto pide cielo abierto: ni una pared alrededor": "helikopter pisti açık gökyüzü ister: çevresinde tek duvar olmamalı",

		"TERRENO": "ARSA",
		"La casa es tuya: te la llevas contigo aunque cambies de club.":
			"Ev senin: kulüp değiştirsen de seninle gelir.",
		"Suelo nuevo pegado a tu casa: pártelo con paredes y amuéblalo a tu gusto en el modo edición.":
			"Evine bitişik yeni zemin: düzenleme modunda duvarlarla böl ve dilediğin gibi döşe.",
		"TERRENO ESTE": "DOGU ARSASI",
		"TERRENO DEL FONDO": "ARKA ARSA",
		"TERRENO OESTE": "BATI ARSASI",
		"ALA NORTE": "KUZEY KAN.",
		"TERRENO DEL GARAGE": "GARAJ ARSASI",
		"Suelo nuevo pegado a la sala. Tuyo para lo que quieras.":
			"Salona bitişik yeni zemin. Ne istersen senin.",
		"El fondo del edificio, ganado al patio de luces.":
			"Binanın arkası, ışıklıktan kazanıldı.",
		"Suelo nuevo junto a la recámara.":
			"Yatak odasının yanında yeni zemin.",
		"El fondo del patio, allanado y tuyo.":
			"Avlunun arkası, düzlenmiş ve senin.",
		"Suelo nuevo sobre el gimnasio, con paso a la sala.":
			"Spor salonunun üstünde yeni zemin, salona geçişli.",
		"Del jardín a la sala de premios, todo tuyo.":
			"Bahçeden ödül odasına kadar, hepsi senin.",
		"Un ala entera tras el salón, pegada a la suite.":
			"Salonun arkasında koca bir kanat, süitin hemen yanında.",
		"El costado del garage, listo para lo que sea.":
			"Garajın yanı, her şeye hazır.",
		"AMPLIAR · {0}": "BUYUT · {0}",
		"YA ES TUYO": "ZATEN SENIN",

		"VENTANA": "PENCERE",
		"VENTANA NUEVA": "YENI PENCERE",
		"Una ventana más, en el muro que tú elijas.":
			"Seçtiğin duvara bir pencere daha.",
		"Luz de verdad en el muro que tú elijas.":
			"Seçtiğin duvara gerçek ışık.",

		"VENTANAL": "BUYUK PENCERE",
		"OJO DE BUEY": "LOMBOZ",
		"Del suelo al techo: el muro entero se vuelve luz.":
			"Yerden tavana: bütün duvar ışığa dönüşür.",
		"Un redondel alto, para el rincón que pide poco.":
			"Yüksekte küçük yuvarlak bir pencere, az şey isteyen köşe için.",

		"~{0} partidos de sueldo": "~{0} maçlık maaş",
		"menos de un partido de sueldo": "bir maçlık maaştan az",
		"TE CONVIENE: llegas justo de energía":
			"DEGER: enerjin azaldı",
		"TE CONVIENE: el vestuario anda frío":
			"DEGER: soyunma odası soğuk",
		"TE CONVIENE: la afición anda fría": "DEGER: taraftar soğuk",
		"TE CONVIENE: la prensa no habla de ti":
			"DEGER: basın senden bahsetmiyor",
		"TE CONVIENE: el técnico no te ve":
			"DEGER: hoca seni görmüyor",
		"TE CONVIENE: tu agente no se mueve":
			"DEGER: menajerin kıpırdamıyor",

		"VER": "GOR",
		"AQUI VA: {0}": "BURAYA: {0}",
		"REPISA DE PARED": "DUVAR RAFI",
		"Una balda más para tus trofeos, donde tú digas.":
			"Kupaların için bir raf daha, nereye istersen.",
		"MASCOTA": "EVCIL",
		"PERRO": "KOPEK",
		"GATO": "KEDI",
		"Un perro que te espera y te sigue por los cuartos.":
			"Seni bekleyen ve odalarda peşinden gelen bir köpek.",
		"Un gato que pasea a lo suyo... y a veces te sigue.":
			"Kendi bildiği gibi gezen... ve bazen peşinden gelen bir kedi.",

		"YA TIENES {0}": "SENDE VAR: {0}",



		"TECNICO": "HOCA",
		"AFICION": "TARAFT.",


		"TU CASA": "EVIN",
		"{0} de {1} adiciones": "{1} ekten {0} tanesi",
		"PATRIMONIO": "MULK",
		"La mejor casa de tu carrera: {0}.": "Kariyerinin en iyi evi: {0}.",
		"Se quedó atrás con un traspaso.": "Bir transferde geride kaldı.",

		"RECIBIR VISITA": "MISAFIR AGIRLA",


		"ESTILO NORDICO": "NORDIK STIL",
		"Madera clara y paredes de leche: la casa respira.":
			"Açık renk ahşap ve süt beyazı duvarlar: ev nefes alıyor.",
		"ESTILO NOCTURNO": "GECE STILI",
		"Grafito, humo y madera oscura. Serio como un 0-0 fuera.":
			"Grafit, duman ve koyu ahşap. Deplasmanda 0-0 kadar ciddi.",
		"ESTILO DEL CLUB": "KULUP STILI",
		"Telas y detalles con los colores de tu escudo.":
			"Armanın renklerinde kumaşlar ve detaylar.",
		"MUDANZA": "TAŞINMA",
		"LAS LLAVES SON TUYAS": "ANAHTARLAR SENIN",
		"EL SOLAR CRECE": "ARSAN BUYUYOR",





		"EL DIA DESPUES": "ERTESI GUN",
		"HOY MEJOR NO SALIR": "BUGUN EVDE KAL",
		"EL MARCADOR": "SKOR",
		"Mañana en el barrio no se hablará de otra cosa.":
			"Yarın mahallede başka bir şey konuşulmayacak.",
		"Esa bandera la ataron a tu reja de madrugada.":
			"O bayrağı şafak sökmeden parmaklığına bağlamışlar.",
		"LO QUE COSTO": "BEDELI",

		"Tu agente te esperaba: hay ofertas sobre la mesa.":
			"Menajerin seni bekliyordu: masada teklifler var.",
		"Un compañero vino a revivir la goleada.":
			"Bir takım arkadaşın farklı galibiyeti yeniden yaşamaya geldi.",
		"Un compañero pasó a saludar.": "Bir takım arkadaşın merhaba demeye uğradı.",
		"{0} vino a revivir la goleada.": "Farklı galibiyeti yeniden yaşamaya geldi: {0}.",
		"{0} pasó a saludar.": "Merhaba demeye uğradı: {0}.",
		"{0} se queda hasta tarde. El vestuario se entera de cómo vives.":
			"{0} geç saate kadar kalıyor. Soyunma odası nasıl yaşadığını öğreniyor.",
		"YA RECIBISTE ESTA SEMANA": "BU HAFTA MISAFIR ALDIN",
		"¿A QUIÉN RECIBES?": "KIM GELIYOR?",
		"Tu casa de hoy rinde {0} de hospitalidad.":
			"Evin bugün {0} misafirperverlik değerinde.",
		"HOY NO": "BUGUN YOK",
		"A UN COMPAÑERO": "TAKIM ARKADAŞI",
		"AL TÉCNICO": "HOCA",
		"A TU AGENTE": "MENAJERIN",
		"Se queda hasta tarde. El vestuario se entera de cómo vives.":
			"Geç saate kadar kalıyor. Soyunma odası nasıl yaşadığını öğreniyor.",
		"Café, vídeo y charla larga. Te ve como alguien serio.":
			"Kahve, video ve uzun bir sohbet. Seni ciddi biri olarak görüyor.",
		"Negocio en la sala de tu casa: aquí las cifras suenan mejor.":
			"Kendi salonunda iş konuşmak: burada rakamlar kulağa daha hoş geliyor.",

		"ESTA SEMANA, EN CASA": "BU HAFTA, EVDE",
		"Te quedan {0} de {1} acciones.": "{1} eylemden {0} tanesi kaldı.",
		"ya, esta semana": "bu hafta yapıldı",
		"YA LO HICISTE ESTA SEMANA": "BU HAFTA YAPTIN",
		"NO TE QUEDA TIEMPO ESTA SEMANA": "BU HAFTA VAKIT KALMADI",
		"de energía": "enerji",
		"DORMIR DE VERDAD": "DELIKSIZ UYU",
		"Ocho horas seguidas y el cuerpo lo agradece.":
			"Sekiz saat kesintisiz ve vücut teşekkür ediyor.",
		"COMER BIEN": "IYI BESLEN",
		"Cocinas tú, y comes lo que te toca comer.":
			"Yemeği sen yapıyorsun ve ne yemen gerekiyorsa onu yiyorsun.",
		"ESTUDIAR AL RIVAL": "RAKIBI INCELE",
		"Te tragas el partido del rival con libreta.":
			"Rakibin maçını elinde defterle baştan sona izliyorsun.",
		"NADAR": "YUZ",
		"Largos suaves: descarga las piernas sin cargarlas.":
			"Hafif kulaçlar: bacakları yormadan rahatlatır.",
		"INVITAR AL VESTUARIO": "TAKIMI DAVET ET",
		"Caen dos compañeros y se hace de noche jugando.":
			"İki takım arkadaşın uğruyor ve hava kararana kadar oynuyorsunuz.",
		"SALIR A RODAR": "TURA ÇIK",
		"Estrenas: {0}.": "Yeni odalar: {0}.",
		"JUGAR AL SNAKE": "SNAKE OYNA",
		"SNAKE": "SNAKE",
		"DESLIZA PARA GIRAR": "DONMEK IÇIN KAYDIR",
		"TOCA PARA OTRA": "TEKRAR IÇIN DOKUN",
		"SE ACABO · {0}": "BITTI · {0}",
		"¡RECORD! · {0}": "REKOR! · {0}",
		"PUNTOS {0}   ·   RECORD {1}": "PUAN {0}   ·   REKOR {1}",
		"AL VESTUARIO ENTERO": "TUM TAKIM",
		"Veinticinco tíos en tu casa hasta la madrugada. La química se cocina.":
			"Yirmi beş adam sabaha kadar senin evde. Uyum pişiyor.",
		"PIDE {0}": "ŞART: {0}",
		"Necesitas {0} en tu casa.": "Evinde şu lazım: {0}.",
		"LEVANTAR PESAS": "AGIRLIK KALDIR",
		"Una hora seria de hierro. El técnico se entera.":
			"Ciddi bir saatlik demir mesaisi. Hoca fark ediyor.",
		"CORRER EN LA CINTA": "KOŞU BANDINDA KOŞ",
		"Fondo tranquilo: llegas al domingo con otra gasolina.":
			"Sakin tempo koşu: pazara depoda daha çok benzinle gelirsin.",
		"Una vuelta sin rumbo. La gente te saluda.":
			"Rotasız bir tur. İnsanlar sana el sallıyor.",
		"JUGAR CON TU MASCOTA": "EVCILINLE OYNA",
		"Media hora de correr tras algo que no cuenta.":
			"Yarım saat, hiçbir şeye sayılmayan bir şeyin peşinde koşmak.",
		"PARED DE MOMENTOS": "ANILAR DUVARI",
		"Tus récords, enmarcados donde se vean.":
			"Rekorların, görünecek bir yerde çerçevelenmiş.",
		"MAQUETA DEL ESTADIO": "STADYUM MAKETI",
		"Tu estadio en miniatura, con los colores de tu club.":
			"Stadyumun minyatür halde, kulübünün renklerinde.",
		"ARCADE RETRO": "RETRO ATARI",
		"Partidas viejas para despejar la cabeza. El vestuario pide turno.":
			"Kafanı boşaltmak için eski oyunlar. Soyunma odası sıraya giriyor.",
		"PISCINA": "HAVUZ",
		"Largos suaves al día siguiente: las piernas lo agradecen.":
			"Ertesi gün hafif kulaçlar: bacakların teşekkür edecek.",
		"MOTO DE COLECCIÓN": "KOLEKSIYON MOTOSU",
		"El garage por fin parece garage.":
			"Garaj sonunda garaja benziyor.",
		"MAQUETA DE TU ESTADIO": "STADYUMUNUN MAKETI",
		"ARCADE": "ATARI",
		"MOTO": "MOTO",
		"ESTUDIO DE VIDEO": "VIDEO ODASI",
		"Estudias al rival en tu sala. El técnico lo agradece.":
			"Rakibi kendi salonunda inceliyorsun. Hoca bunu takdir ediyor.",
		"ASADOR EN EL PATIO": "BAHÇEDE MANGAL",
		"El vestuario viene a comer. La química se cocina.":
			"Takım yemeğe geliyor. Uyum pişiyor.",
		"JACUZZI": "JAKUZI",
		"Piernas nuevas al día siguiente del partido.":
			"Maçın ertesi günü yepyeni bacaklar.",
		"SALA DE CINE": "EV SINEMASI",
		"Desconectas de verdad. Y todos quieren venir.":
			"Gerçekten kafa dinliyorsun. Herkes de gelmek istiyor.",
		"SPA CON FISIO": "FIZYOLU SPA",
		"Tratamiento en casa: el mejor descanso que se compra.":
			"Evde tedavi: paranın alabileceği en iyi dinlenme.",
		"CANCHA DE ENTRENAMIENTO": "ANTRENMAN SAHASI",
		"Sales de casa y practicas campo abierto cuando quieras.":
			"Evden çık ve istediğin zaman açık sahada çalış.",
		"SALIR A ENTRENAR": "ANTRENMANA ÇIK",



		"MODO EDICION": "DUZENLEME",



		"INVENTARIO": "ENVANTER",
		"TUS COSAS": "EŞYALARIN",
		"EN LA CASA": "EVDE",
		"EN CAJAS": "KUTULARDA",
		"Aquí no hay nada todavía.": "Burada henüz bir şey yok.",
		"No te sobra nada: todo lo que compraste está puesto en la casa.": "Fazlan yok: aldığın her şey evde yerleştirilmiş.",


		"EXHIBICION": "SERGIDE",
		"OCIO": "EGLENCE",
		"ENTRENAR": "IDMAN",
		"DECORACION": "DEKOR",

		"ALFOMBRA": "HALI",




		"Aquí se duerme de verdad y se recupera la energía.": "Burada gerçekten uyunur ve enerji toplanır.",
		"Donde se reciben las visitas del vestuario.": "Soyunma odasından gelen misafirlerin ağırlandığı yer.",
		"Un sitio más donde sentarse sin ocupar medio cuarto.": "Odanın yarısını kaplamadan oturacak bir yer daha.",
		"Comer bien en casa cuesta menos que comer fuera.": "Evde iyi beslenmek dışarıda yemekten ucuzdur.",
		"El centro de la sala: todo lo demás se acomoda alrededor.": "Salonun kalbi: geri kalan her şey etrafına dizilir.",
		"Tus copas, a la vista. Cuantas más perchas, más palmarés.": "Kupaların gözler önünde. Raf arttıkça kupa da artar.",
		"La vitrina del que empieza: pocas copas, pero las tuyas.": "Yeni başlayanın vitrini: az kupa ama hepsi senin.",
		"Una playera enmarcada por cada club en el que jugaste.": "Oynadığın her kulüp için çerçeveli bir forma.",
		"Los récords de tu carrera, colgados.": "Kariyer rekorların, duvarda asılı.",
		"Lo único de la tienda que se exhibe en casa.": "Mağazadan alıp evde sergilediğin tek şey.",
		"Estudiar al rival antes del partido.": "Maçtan önce rakibi incele.",
		"Una partida no cuesta acción de semana. Se está por estar.": "Bir oyun haftalık eylem harcamaz. Sırf keyif için.",
		"Tu estadio en pequeño, con su marcador.": "Stadyumunun minyatürü, skor tabelasıyla birlikte.",
		"Nadar descansa y no gasta energía de entrenamiento.": "Yüzmek dinlendirir ve antrenman enerjisi harcatmaz.",
		"Salir a rodar. No sirve para nada y por eso está.": "Tura çıkmak. Hiçbir işe yaramaz, olayı da bu.",
		"El rack con la barra: levantar pesas sube tu físico.": "Sehpa ve bar: ağırlık kaldırmak fiziğini geliştirir.",
		"La torre de mancuernas. Un rack solo no hace un gimnasio.": "Dambıl kulesi. Tek sehpayla spor salonu olmaz.",
		"Correr en casa los días que no hay cancha.": "Saha olmayan günlerde evde koşu.",
		"Va debajo de todo y no estorba a nada.": "Her şeyin altına gider ve hiçbir şeye engel olmaz.",
		"Verde en un rincón. Cuesta poco y se nota.": "Bir köşede yeşillik. Ucuz ve fark edilir.",
		"Luz propia en el rincón que quede oscuro.": "Karanlık kalan köşeye kendi ışığı.",
		"Se apoya a ras de muro y llena una pared entera.": "Duvara dayanır ve bütün bir duvarı doldurur.",
		"De cuerpo entero. Pide muro, como todo lo que cuelga.": "Boy aynası. Asılan her şey gibi duvar ister.",

		"{0} EN CAJAS": "KUTULARDA {0}",
		"{0} EN CAJAS · VALEN {1}": "KUTULARDA {0} · DEGERI {1}",
		"VENDER {0}": "SAT: {0}",
		"¿SEGURO? SE VAN {0} PIEZAS": "EMIN MISIN? {0} PARÇA",
		"MANTÉN PARA VENDER": "SAT: BASILI TUT",
		"MANTÉN · SE VAN {0} PIEZAS": "BASILI TUT · {0} PARÇA",
		"SALDO {0}": "KASA {0}",
		"{0} x {1} celdas  ·  {2} m de alto": "{0} x {1} hücre  ·  {2} m yükseklik",
		"EN CAJAS · TOCA PARA SACARLO": "KUTUDA · ÇIKARMAK IÇIN DOKUN",
		"EN LA CASA · TOCA PARA GUARDARLO": "EVDE · KALDIRMAK IÇIN DOKUN",


		"MASCOTAS": "EVCILLER",


		"OTRO": "YENI",
		"OTRO ({0}/{1})": "YENI ({0}/{1})",


		"PAREDES": "DUVAR",
		"MUEBLES": "MOBILYA",
		"PONER AQUI": "BURAYA KOY",
		"INICIAR PARED": "DUVAR BAŞLAT",
		"FIN DE PARED": "DUVARI BITIR",
		"CANCELAR TRAZO": "IPTAL",
		"BAÑO": "BANYO",
		"INODORO": "KLOZET",
		"Cerámica, tapa y cisterna para completar el baño.":
			"Banyoyu tamamlamak için seramik, kapak ve rezervuar.",
		"Lavabo con espejo y grifo, listo junto al muro.":
			"Aynalı ve musluklu lavabo, duvar dibinde hazır.",
		"Mampara de cristal y regadera para el rincón del baño.":
			"Banyo köşesi için cam paravan ve duş başlığı.",
		"Una tina de baño de borde ancho.": "Geniş kenarlı bir küvet.",
		"LAVABO": "LAVABO",
		"DUCHA": "DUŞ",
		"TINA": "KUVET",
		"Lo primero que echa en falta una casa.": "Bir evin ilk eksiğini hissettiği şey.",
		"Con espejo, para mirarte antes de salir.": "Aynalı, çıkmadan önce kendine bakmak için.",
		"Agua caliente después de entrenar.": "Antrenmandan sonra sıcak su.",
		"Para las piernas cargadas de después del partido.": "Maçtan sonra ağırlaşan bacaklar için.",
		"AMPLIAR EL TERRENO": "ARSAYI GENIŞLET",
		"PARED DE CAMISETAS": "FORMA DUVARI",
		"Donde van las copas que ganas.": "Kazandığın kupaların gittiği yer.",
		"Una playera por cada club en el que jugaste.": "Oynadığın her kulüp için bir forma.",
		"Para los trofeos que no caben en la vitrina.": "Vitrine sığmayan kupalar için.",
		"LEVANTAR PARED": "DUVAR OR",
		"TIRAR ESTA PARED": "BU DUVARI YIK",
		"REHACER ESTA PARED": "BU DUVARI YENIDEN OR",

		"PONER PUERTA": "KAPI EKLE",
		"QUITAR PUERTA": "KAPIYI KALDIR",
		"DEJARIA SIN PASO": "GEÇIŞ KALMAZ",
		"las paredes van rectas": "duvarlar düz gider",
		"demasiado corta": "çok kısa",
		"ahí no hay suelo": "orada zemin yok",
		"te quedarías dentro": "içeride kalırsın",
		"dejarías {0} sin paso": "geçişsiz kalır: {0}",
		"HOY NO SALE · TOCA PARA SACARLA": "BUGUN YOK · ÇIKARMAK IÇIN DOKUN",
		"ANDA POR LA CASA · TOCA PARA GUARDARLA": "EVDE DOLAŞIYOR · KALDIRMAK IÇIN DOKUN",
		"TAPETES": "HALILAR",



		"CUADRO DE PARED": "DUVAR TABLOSU",
		"CUADRO GRANDE": "BUYUK TABLO",
		"ÓLEO DE AUTOR": "IMZALI TABLO",
		"BANDERINES": "FLAMALAR",
		"MIS BUFANDAS": "ATKILARIM",
		"MIS BOTINES": "KRAMPONLAR",

		"MUSEO DE BALONES": "TOP MUZESI",
		"ESCUDO DEL CLUB": "KULUP ARMASI",
		"BANDERINES DE CAMBIO": "HATIRA FLAMALARI",
		"TIFO ENMARCADO": "ÇERÇEVELI TIFO",
		"BALONES DE TEMPORADA": "SEZON TOPLARI",
		"BUTACAS DEL ESTADIO": "STADYUM KOLTUKLARI",
		"ALFOMBRA DEL CÍRCULO": "SANTRA HALISI",
		"CASILLERO DEL VESTIDOR": "SOYUNMA ODASI DOLABI",
		"TAPIZ": "DUVAR HALISI",
		"PANEL DE MADERA": "AHŞAP KAPLAMA",
		"MAPA DE GIRAS": "TUR HARITASI",
		"CARTEL DE PARTIDO": "MAÇ AFIŞI",
		"PORTADA ENMARCADA": "ÇERÇEVELI MANŞET",
		"PLACA DE FICHAJE": "TRANSFER PLAKETI",
		"AUN NO SE JUEGA": "HENUZ OYNANMADI",
		"VS {0}": "VS {0}",
		"{0} GOLES · NOTA {1}": "{0} GOL · PUAN {1}",
		"\"EL QUE VIENE PISANDO FUERTE\"": "\"GELECEGIN YILDIZI\"",
		"DE LA CANTERA": "ALTYAPIDAN",
		"El cartel de tu mejor partido: rival, goles y nota.":
			"En iyi maçının afişi: rakip, goller ve puan.",
		"La portada del día que ganaste algo. Se reescribe sola.":
			"Bir şey kazandığın günün manşeti. Kendi kendine yenilenir.",
		"El club, la temporada y lo que costó tu fichaje.":
			"Kulüp, sezon ve transferinin bedeli.",
		"PANTALLA DE MURO": "DUVAR EKRANI",
		"CHIMENEA": "ŞOMINE",
		"PLAFÓN": "TAVAN LAMBASI",
		"ARAÑA": "AVIZE",
		"APLIQUE": "APLIK",
		"LÁMPARA DE BURÓ": "ABAJUR",
		"RÓTULO DE NEÓN": "NEON TABELA",
		"TIRA LED": "LED ŞERIT",
		"MACETERO": "UZUN SAKSI",
		"PECERA DE PIE": "AKVARYUM",
		"CARRITO DE REFRESCOS": "IÇECEK ARABASI",
		"PUF": "PUF",
		"BAÚL": "BAVUL",
		"PERCHERO": "PORTMANTO",
		"NEVERA DE JUGOS": "MEYVE SUYU DOLABI",
		"TOCADISCOS": "PIKAP",
		"Un lienzo con marco. Lo más barato contra un muro pelado.":
			"Çerçeveli bir tuval. Çıplak duvara en ucuz çare.",
		"Metro y medio de lienzo. Ya no es un detalle.":
			"Bir buçuk metre tuval. Artık ayrıntı değil.",
		"Dos metros firmados. La pared entera es él.":
			"İki metre, imzalı. Bütün duvar artık o tablo.",
		"Los de tus clubes, cruzando el rincón en diagonal.":
			"Kulüplerinin renkleri, köşeden köşeye gerili.",
		"Una bufanda por cada afición que te cantó.":
			"Adını haykıran her taraftar için bir atkı.",
		"Los botines de tus noches grandes, en peanas.":
			"Büyük gecelerinin kramponları, kaidelerin üstünde.",
		"Treinta y dos balones tras el cristal, con luz de museo.":
			"Camın ardında otuz iki top, müze ışığıyla.",
		"El escudo de tu club, retroiluminado contra el muro.":
			"Kulübünün arması, duvarda arkadan aydınlatmalı.",
		"Un banderín de intercambio por cada club que pisaste.":
			"Oynadığın her kulüpten bir hatıra flaması.",
		"Un trozo del tifo que te dedicó tu grada, enmarcado.":
			"Tribününün sana adadığı tifodan bir parça, çerçeveli.",
		"Un balón por temporada, con los colores de aquel año.":
			"Her sezon için bir top, o yılın renkleriyle.",
		"Dos butacas originales de la grada, con su número.":
			"Tribünden iki orijinal koltuk, numarasıyla birlikte.",
		"El círculo central tejido, con tu escudo en medio.":
			"Dokuma santra yuvarlağı, ortasında senin armanla.",
		"Tu taquilla del vestidor, con tu dorsal en la puerta.":
			"Soyunma odasındaki dolabın, kapısında forma numaran.",
		"Un tramo de muro con otra tela, de suelo a techo.":
			"Duvarın bir bölümü başka kumaşla, yerden tavana.",
		"Duelas de suelo a techo: el muro deja de ser pared.":
			"Yerden tavana ahşap çıtalar: duvar duvar olmaktan çıkar.",
		"Un mapamundi con una chincheta en cada país donde jugaste. Se llena solo.":
			"Oynadığın her ülkede bir raptiye olan dünya haritası. Kendi kendine dolar.",
		"La pantalla colgada, sin mueble que la sostenga.":
			"Duvara asılı ekran, altında taşıyan mobilya yok.",
		"Fuego de verdad: da luz propia y calienta el rincón.":
			"Gerçek ateş: kendi ışığını verir, köşeyi ısıtır.",
		"Luz de techo, la que hace que un cuarto deje de ser cueva.":
			"Tavan ışığı: bir odayı mağara olmaktan kurtaran şey.",
		"Cristal colgado en medio del salón. Se nota al entrar.":
			"Salonun ortasında asılı kristal. Girer girmez fark edilir.",
		"Va en pareja, uno a cada lado del muro que enseñas.":
			"Çift alınır; gösterdiğin duvarın iki yanına birer tane.",
		"Con su buró incluido, para leer sin encender el cuarto.":
			"Komodiniyle birlikte; odayı aydınlatmadan okumak için.",
		"Tu nombre en neón, encendido toda la noche.":
			"Adın neonla yazılı, bütün gece yanar.",
		"Bordea el muro y baña el cuarto de color.":
			"Duvar boyunca uzanır, odayı renge boğar.",
		"Verde de metro ochenta para el rincón que sobra.":
			"Kimsenin kullanmadığı köşeye bir seksen boyunda yeşillik.",
		"Una columna de agua con peces. No hace nada y se mira.":
			"İçinde balıklar olan bir su sütunu. Hiçbir işe yaramaz, ama izlersin.",
		"Refrescos a mano cuando llega la visita.": "Misafir gelince meşrubatlar elinin altında.",
		"Se tira al suelo y ya hay un sitio más donde caer.":
			"Yere at, yayılacak bir yer daha olsun.",
		"Guarda lo que no se enseña, y hace de banco.":
			"Sergilemediklerini saklar, bank olarak da işe yarar.",
		"Donde va la chamarra al entrar por la puerta.":
			"Kapıdan girer girmez ceketin asıldığı yer.",
		"Jugos en frío, iluminados. La compra del que presume.":
			"Soğuk ve ışıklı meyve suları. Hava atanın alışverişi.",
		"Vinilo, brazo y altavoces sobre su mueble de madera.":
			"Ahşap dolabının üstünde plak, kol ve hoparlörler.",
		"El suelo deja de estar desnudo.": "Zemin artık çıplak değil.",
		"PLANTAS": "BITKI",
		"Algo vivo en cada cuarto.": "Her odada canlı bir şey.",
		"Los libros visten más que el mármol.":
			"Kitaplar bir odayı mermerden daha iyi giydirir.",
		"LÁMPARAS DE PIE": "AYAKLI LAMBALAR",
		"Rincones cálidos al caer la tarde.": "Akşam çökerken sıcak köşeler.",
		"RECÁMARA": "Y. ODASI",
		"SUITE": "SUIT",
		"SALÓN": "SALON",
		"Camina y mira lo que has ganado": "Dolaş ve kazandıklarına bak",
		"Por colocar: {0} en cajas": "Yerleştirilecek: kutuda {0}",
		"Lo que se compra aquí, por secciones:": "Burada satın alabileceklerin, bölüm bölüm:",
		"ENTRAR": "GIR",
		"LA SIGUIENTE": "SIRADAKI",
		"EL TECHO": "ZIRVE",
		"No hay casa mejor. Ahora llénala.":
			"Bundan iyi ev yok. Şimdi doldur onu.",
		"Descanso: +{0} de energía tras cada partido.":
			"Dinlenme: her maçtan sonra +{0} enerji.",
		"Suma +{0} de energía tras cada partido.":
			"Her maçtan sonra +{0} enerji ekler.",
		"Sólo cabe en el jardín de un solar de {0} x {0} o más.": "Sadece {0} x {0} veya daha büyük bir arsanın bahçesine sığar.",
		"Mantenimiento: {0} por partido.": "Bakım: maç başına {0}.",
		"MUDARSE · {0}": "TAŞIN · {0}",
		"TE FALTA {0}": "EKSIK {0}",
		"SALA": "OTURMA OD.",
		"PATIO": "AVLU",
		"JARDIN": "BAHÇE",
		"SALA DE TROFEOS": "KUPA ODASI",
		"SALA DE PREMIOS": "ODUL ODASI",
		"GALERIA": "GALERI",
		"GARAGE": "GARAJ",
		"CANCHA": "SAHA",
		"SOFÁ": "KANEPE",
		"MESA": "MASA",
		"REPISA": "RAF",
		"CAMA": "YATAK",
		"VITRINA": "VITRIN",
		"MARCO": "ÇERÇEVE",
		"BANCA": "BANK",
		"AUTO": "OTO",
		"PORTERÍA": "KALE",




		"A PRESTAMO": "KIRALIK",
		"MESA DE POQUER": "POKER MASASI",
		"AQUI": "BURA",
		"SUELO": "ZEMIN",
		"BASTA": "TAMAM",
		"PINTAR TODAS LAS PAREDES": "TUM DUVARLARI BOYA",
		"PINTAR SUELO": "ZEMINI BOYA",
		"DEJAR DE PINTAR": "BOYAMAYI BIRAK",
		"QUITAR PINTURA": "BOYAYI SIL",
		"QUITAR PISO": "ZEMINI SIL",
		"Ancho de la brocha, en casillas.": "Fırça genişliği, kare cinsinden.",
		"PINTAR ESTE CUARTO": "BU ODAYI BOYA",
		"Se pinta el cuarto donde tengas la mano.": "Elinin olduğu oda boyanır.",
		"DERRIBAR EN LINEA": "SIRAYLA YIK",
		"DEJAR LA MAZA": "BALYOZU BIRAK",
		"EMPEZAR DERRIBO": "YIKIMA BAŞLA",
		"TIRAR LO MARCADO": "IŞARETLILERI YIK",
		"DERRIBAR": "YIK",
		"PASTO": "ÇIM",
		"Ciegas: {0} y {1}": "Körler: {0} ve {1}",
		"{0} se retira": "{0} çekiliyor",
		"{0} pasa": "{0} pas geçiyor",
		"{0} iguala": "{0} görüyor",
		"{0} sube a {1}": "{0} artırıyor: {1}",
		"PAREJA": "PER",
		"relacionesPAREJA": "PARTNER",
		"ESCALERA": "KENT",
		"COLOR": "FLOŞ",
		"FULL": "FUL",
		"PREFLOP": "PREFLOP",
		"FLOP": "FLOP",
		"TURN": "TURN",
		"RIVER": "RIVER",
		"SHOWDOWN": "SHOWDOWN",
		"SIGUENOS":
			"TAKIP ET",
		"Síguenos y comparte el juego con tus amigos.":
			"Bizi takip et ve oyunu arkadaşlarınla paylaş.",
		"COMPARTIR EL JUEGO": "OYUNU PAYLAŞ",
		"COMPARTIR": "PAYLAŞ",
		"ENLACE COPIADO · PÉGALO DONDE QUIERAS": "BAGLANTI KOPYALANDI · YAPIŞTIR",
		"PULSA OTRA VEZ PARA SALIR": "ÇIKMAK IÇIN TEKRAR BAS",
		"VALORAR EL JUEGO": "OYUNU PUANLA",
		"GIRAR": "ÇEVIR",
		"CAJA": "KUTU",
		"MUEBLE": "EŞYA",
		"GUARDA": "KALDIR",
		"ANULAR": "IPTAL",
		"MOVER": "TAŞI",
		"ALZAR": "INŞA",
		"TRAZAR": "ÇIZ",
		"TIRAR": "YIK",
		"NO PASA": "OLMAZ",
		"PINTAR": "BOYA",
		"GIRO": "DON",
		"COLGAR PLAYERAS": "FORMA AS",
		"PLAYERA ENMARCADA": "ÇERÇEVELI FORMA",
		"COLGAR PLAYERA": "FORMA AS",
		"Una playera enmarcada, la que tú elijas. Cuelga las que quieras.": "Çerçeveli bir forma, hangisini seçersen. İstediğin kadar as.",
		"MARCO {0} · VACÍO": "ÇERÇEVE {0} · BOŞ",
		"MARCO {0}": "ÇERÇEVE {0}",
		"AUTOMÁTICO": "OTOMATIK",
		"DORSAL": "NUMARA",
		"Toca el número que quieras. Los que llevan tus compañeros se piden dos veces.": "İstediğin numaraya dokun. Takım arkadaşlarının giydikleri için iki kez dokunman gerekir.",
		"El {0} lo lleva {1}. Toca otra vez y te lo pones: a él le dan otro.": "{0} numara şu an {1} adlı oyuncuda. Tekrar dokun, sen al: ona başka numara verilir.",
		"El {0} lo lleva {1}. Mantén y te lo pones: a él le dan otro.": "{0} numara şu an {1} adlı oyuncuda. Basılı tut, sen al: ona başka numara verilir.",
		"DEJARLO AUTOMÁTICO": "OTOMATIK KALSIN",
		"SILLA": "SANDALYE",
		"Para sentarse a la mesa.": "Masada oturmak için.",
		"BANCO DE BARRA": "BAR TABURESI",
		"Para la barra de la cocina.": "Mutfak tezgâhı için.",
		"SILLÓN": "KOLTUK",
		"Tu sitio para ver el partido.": "Maç izleme köşen.",
		"Tu solar pasa a {0} x {0}. Crece por los cuatro lados.":
			"Arsan {0} x {0} oluyor. Dört yandan birden büyür.",
		"{0} en una edición de {1}": "Tek bir {1} turnuvasında {0}",
		"Mejor media": "En iyi ortalama",
		"{0} va con todo ({1})": "{0} all-in yapıyor ({1})",
		"{0} se lleva {1} (los demás se fueron)":
			"{0} potu alıyor: {1} (diğerleri çekildi)",
		"Gana {0} con {1} ({2})": "Kazanan {0}: {1} ({2})",




		"ARCE CLARO": "AKÇAAGAÇ",
		"HORMIGÓN": "BETON",
		"MÁRMOL": "MERMER",
		"CARBÓN": "ANTRASIT",
		"PARTIDA DE PÓQUER": "POKER GECESI",
		"Invitas, se reparten cartas y se juega con tu dinero.":
			"Davet edersin, kartlar dağıtılır ve gerçek parayla oynanır.",
		"LOS DEL VESTUARIO": "TAKIM ARKADAŞLARI",
		"Tres compañeros y una noche larga.":
			"Üç takım arkadaşı ve uzun bir gece.",
		"GENTE DE OTROS CLUBES": "DIGER KULUPLERDEN",
		"Se juega más fuerte, y se cuenta por ahí.":
			"Bahisler daha yüksek ve laf dolaşır.",
		"GENTE CONOCIDA": "UNLU SIMALAR",
		"Apuestas de las que salen en el periódico.":
			"Gazetelere düşen bahisler.",
		"CARTA ALTA": "YUK. KART",
		"DOBLE PAREJA": "IKI PER",
		"TRÍO": "UÇLU",
		"PÓQUER": "KARE",
		"ESCALERA DE COLOR": "FLOŞ KENT",
		"PUNTERÍA": "NIŞAN",
		"AQUI GIRA": "BURADA DON",
		"SIN MESA": "MASA YOK",
		"dejarías un rincón sin paso":
			"bir köşeyi geçitsiz bırakırsın",
		"Solo ante el portero: define el mano a mano.":
			"Kaleciyle karşı karşıya: düelloyu bitir.",
		"Jala hacia atrás y suelta al arco": "Geri çek ve kaleye bırak",
		"Disparo de frente: aprovecha el ángulo abierto.":
			"Önden şut: açık açıyı kullan.",
		"Jala y suelta con fuerza al arco": "Çek ve kaleye sertçe bırak",
		"Desde lejos: la puntería pesa más que la fuerza.":
			"Uzaktan: isabet güçten daha önemli.",
		"Apunta fino y suelta al arco": "İnce nişan al ve kaleye bırak",
		"Ángulo cerrado: mete efecto para colarla.":
			"Dar açı: falsoyla içeri sok.",
		"Curva el tiro hacia el palo largo": "Şutu uzak direğe kıvır",
		"Contragolpe: resuelve antes de que cierre la defensa.":
			"Kontra atak: savunma kapanmadan bitir.",
		"Jala y suelta antes de que te tapen":
			"Önün kapanmadan çek ve bırak",
		"El balón es TUYO y estás en la banda: cuélgalo al área o prueba el tiro escorado.":
			"Top SENDE ve kanattasın: ceza sahasına ortala ya da dar açıdan şutu dene.",
		"Jala y suelta: al área o al arco":
			"Çek ve bırak: ceza sahasına ya da kaleye",
		"Tiro libre directo: sortea la barrera al arco.":
			"Direkt serbest vuruş: barajı aşıp kaleye.",
		"Jala y suelta por encima de la barrera":
			"Çek ve barajın üstünden bırak",
		"Córner: coloca el centro para el remate.":
			"Korner: vuruş için ortayı yerleştir.",
		"Pon el balón al corazón del área":
			"Topu ceza sahasının göbeğine gönder",
		"Penal: tú y el portero, a sangre fría.":
			"Penaltı: sen ve kaleci, soğukkanlılıkla.",
		"Elige tu lado y suelta ajustado":
			"Köşeni seç ve dibe bırak",
		"Falta al borde del área: monta el disparo desde fuera.":
			"Ceza sahası önünde faul: dışarıdan şutu hazırla.",
		"Jala y suelta buscando el hueco":
			"Çek ve boşluğu arayarak bırak",
		"Saque de banda: reanuda el ataque con un compañero.":
			"Taç: atağı bir takım arkadaşıyla yeniden başlat.",
		"Saca rápido hacia un compañero": "Hızlıca bir takım arkadaşına at",
		"Cancha entera y sin reloj: siente la conducción y tira cuando quieras.":
			"Bütün saha, süre yok: top sürmeyi hisset ve istediğin an şut at.",
		"Arrastra para conducir; suelta en el círculo para tirar":
			"Top sürmek için sürükle; şut için halkada bırak",
		"Ganas COMPLETANDO el pase largo a la otra banda, no marcando.":
			"Gol atarak değil, karşı kanada uzun pası TAMAMLAYARAK kazanırsın.",
		"Apunta al compañero de la otra banda":
			"Karşı kanattaki takım arkadaşına nişan al",
		"Aquí NO se tira: llega a las zonas rojas para salir limpio.":
			"Burada şut YOK: temiz çıkmak için kırmızı bölgelere ulaş.",
		"Arrastra para correr y zafarte de la marca":
			"Koşmak ve markajdan kurtulmak için sürükle",
		"Trofeos": "Kupalar",
		"ANDA POR LA CASA · TOCA PARA RENOMBRAR O GUARDAR":
			"EVDE GEZIYOR · AD VER YA DA KALDIR: DOKUN",
		"Ampliar a {0} x {0}: levanta las paredes donde quieras y amuébla­lo a tu gusto en el modo edición.":
			"{0} x {0} boyutuna genişlet: duvarları istediğin yere ör ve düzenleme modunda zevkine göre döşe.",
		"Asistencias": "Asistler",
		"Aún no hay cartas en la mesa.": "Masada henüz kart yok.",
		"BOTE: {0}": "POT: {0}",
		"CESION": "KIRALIK",
		"LEY BOSMAN": "BOSMAN",
		"DEADLINE DAY": "SON GUN",
		"División": "Lig",
		"EL DIARIO": "GAZETE",
		"EL TRASPASO": "TRANSFER",
		"EL VESTUARIO DEL AÑO": "YILIN TAKIMI",
		"EN CURSO": "SURUYOR",
		"Edad": "Yaş",
		"El club te sube a {0}": "Kulüp seni şuna yükseltti: {0}",
		"El primero de muchos. Este no se te olvida en toda la carrera.":
			"Daha nicelerinin ilki. Bunu kariyerin boyunca unutmazsın.",
		"GANO EL DERBI": "DERBIYI ALDI",
		"GUARDARLA (HOY NO SALE)": "KALDIR (BUGUN YOK)",
		"Goles": "Goller",
		"Guardado": "Kaydedildi",
		"HOY NO SALE · TOCA PARA RENOMBRAR O SACAR":
			"BUGUN YOK · AD VER YA DA ÇIKAR: DOKUN",
		"Hoy la ciudad amaneció con la portada buena.": "Şehir bugün güzel bir manşetle uyandı.",
		"Hoy la ciudad amaneció con tu nombre en la portada.":
			"Şehir bugün manşette senin adınla uyandı.",
		"IGUALAR": "GOR",
		"INVITADO": "MISAFIR",
		"JUGAR PÓQUER": "POKER OYNA",
		"FACIL": "KOLAY",
		"MEDIO": "ORTA",
		"DIFICIL": "ZOR",
		"EXTREMO": "EKSTREM",

		"MANTEN PULSADO": "BASILI TUT",
		"SUELTA PARA TIRAR": "ATMAK IÇIN BIRAK",
		"¡SE TE FUE LA MANO!": "ELIN KAYDI!",
		"DIANA": "TAM ORTA",
		"ANILLO": "HALKA",
		"TRIPLE {0}": "UÇLU {0}",
		"DOBLE {0}": "ÇIFT {0}",
		"VISITA {0} DE {1}": "TUR {0} / {1}",
		"TU {0}   ·   {1} {2}": "SEN {0}   ·   {1} {2}",
		"TIRA {0}": "ATIŞ: {0}",
		"GANAS EL RETO": "KAZANDIN",
		"GANAS LA PARTIDA": "OYUNU KAZANDIN",
		"OTRO DIA SERA": "BAŞKA ZAMAN",
		"QUIMICA +{0}": "UYUM +{0}",
		"ARRASTRA Y SUELTA": "SURUKLE VE BIRAK",
		"FALTA · BOLA EN MANO": "FAUL · TOP ELDE",
		"MESA ABIERTA": "MASA AÇIK",
		"LISAS": "DUZLER",
		"RAYADAS": "ÇIZGILI",
		"LA NEGRA": "SIYAH TOP",
		"{0} · TE QUEDAN {1}": "{0} · KALAN {1}",
		"TIRAR DARDOS": "DART AT",
		"JUGAR BILLAR": "BILARDO OYNA",
		"¿CONTRA QUIEN?": "KIME KARŞI?",
		"TIRAR UN RATO": "SADECE AT",
		"UNA PARTIDA SOLO": "TEK BAŞINA OYUN",
		"Ya ganaste química esta semana. Se juega por el récord.": "Bu hafta uyum kazandın zaten. Bu oyun rekor için.",
		"EL UTILERO": "MALZEMECI",
		"UN COMPAÑERO": "TAKIM ARK.",
		"EL CAPITAN": "KAPTAN",
		"DIANA DE DARDOS": "DART TAHTASI",
		"Se tira como se chuta. Reta al vestuario y gana química.": "Şut çeker gibi atarsın. Takım arkadaşlarına meydan oku ve uyum kazan.",
		"Se tira como se chuta: tensas y sueltas. Reta a quien quieras.": "Şut çeker gibi atarsın: ger ve bırak. İstediğine meydan oku.",
		"La resortera, sobre el paño. Una partida con el vestuario.": "Sapan, çuhanın üstünde. Takım arkadaşlarınla bir oyun.",
		"NOCHE DE DARDOS": "DART GECESI",
		"Caen dos del vestuario y se tira hasta tarde.": "İki takım arkadaşı uğrar, geç saate kadar atarsınız.",
		"NOCHE DE BILLAR": "BILARDO GECESI",
		"Tacos, hielo y una mesa que no se apaga.": "Istakalar, buz ve hiç sönmeyen bir masa.",
		"LEVANTARSE DE LA MESA": "MASADAN KALK",
		"LOS NUEVOS UNIFORMES": "YENI FORMALAR",
		"Media (OVR)": "Genel (OVR)",
		"Mejor gol": "En iyi gol",
		"Mejor pase": "En iyi pas",
		"NUEVO CLUB": "YENI KULUP",
		"No se pudo crear el video": "Video oluşturulamadı",
		"No se pudo escribir el video": "Video yazılamadı",
		"No se pudo preparar la carpeta del video":
			"Video klasörü hazırlanamadı",
		"Nota media": "Ort. puan",
		"OTRA MANO": "YENI EL",
		"PASAR": "PAS",
		"PONER NOMBRE": "AD VER",
		"PRIMER GOL": "ILK GOL",
		"Partidos": "Maçlar",
		"Prima de objetivo: ${0}": "Hedef primi: ${0}",
		"Primas por títulos: ${0}": "Kupa primleri: ${0}",
		"Cláusula de ascenso: tu ficha sube a ${0}":
			"Üst lig maddesi: maaşın ${0} olur",
		"Cláusula de descenso: tu ficha baja a ${0}":
			"Küme düşme maddesi: maaşın ${0} olur",
		"RETIRARSE": "ÇEKIL",
		"SACARLA A LA CASA": "EVE GOTUR",
		"SE RETIRÓ": "ÇEKILDI",
		"SIN TRASPASO": "TRANSFER YOK",
		"SUBIR A {0}": "ARTIR: {0}",
		"Sin títulos esta temporada.": "Bu sezon kupa yok.",
		"TRAMO": "DILIM",
		"TU PRIMER GOL": "ILK GOLUN",
		"TU TURNO": "SEN OYNA",
		"PIENSA {0}…": "DUŞUNUYOR: {0}…",
		"TERMINA LA MANO PARA LEVANTARTE": "KALKMAK IÇIN ELI BITIR",
		"ESTA NOCHE: {0}": "BU GECE: {0}",
		"MANO {0}/{1} · CIEGA {2}": "EL {0}/{1} · KOR {2}",
		"ULTIMA MANO DE LA NOCHE": "GECENIN SON ELI",
		"MEJOR MANO: {0}": "EN IYI EL: {0}",
		"ARRUINASTE A {0}": "IFLAS ETTI: {0}",
		"NERVIOSO": "GERGIN",
		"TRANQUILO": "SAKIN",
		"PRUDENTE": "TEMKINLI",
		"EQUILIBRADO": "DENGELI",
		"KAMIKAZE": "KAMIKAZE",
		"FAROLERO": "BLOFÇU",
		"TIENES: {0}": "ELINDE: {0}",
		"IGUALAR {0}": "GOR {0}",
		"TORNEO · MANO {0} · CIEGA {1}": "TURNUVA · EL {0} · KOR {1}",
		"¡CAMPEÓN DEL TORNEO!": "TURNUVA ŞAMPIYONU!",
		"TORNEO DE LA TEMPORADA": "SEZON TURNUVASI",
		"TORNEO: YA JUGADO ESTA TEMPORADA": "TURNUVA: BU SEZON OYNANDI",
		"Torneo de Póquer": "Poker Turnuvası",
		"Campeón del Torneo de Póquer": "Poker Turnuvası şampiyonu",
		"RETO: GANA UN BOTE DE FAROL": "GOREV: BLOFLA POT KAZAN",
		"RETO: DEJA A UN RIVAL SIN FICHAS": "GOREV: BIR RAKIBI BATIR",
		"RETO: GANA {0} EN UNA MANO": "GOREV: TEK ELDE {0} KAZAN",
		"RETO: GANA CON COLOR O MEJOR": "GOREV: FLOŞ YA DA USTUYLE KAZAN",
		"RETO: ACABA LA NOCHE GANANDO": "GOREV: GECEYI KARDA BITIR",
		"RETO CUMPLIDO · QUIMICA +{0}": "GOREV TAMAM · UYUM +{0}",
		"RETO CUMPLIDO": "GOREV TAMAM",
		"RETO DE LA SEMANA: HECHO": "HAFTALIK GOREV: TAMAM",
		"TE DEBE {0}": "ALACAGIN {0}",
		"LE DEBES {0}": "BORCUN {0}",
		"CIEGA {0} · PARA IGUALAR {1}": "KOR {0} · GORMEK IÇIN {1}",
		"OVR {0}": "OVR {0}",
		"SUBIDA MINIMA {0} · TODO DENTRO {1}": "MIN. ARTIŞ {0} · ALL-IN {1}",
		"TODO DENTRO ({0})": "ALL-IN ({0})",
		"TODO {0}": "ALL-IN {0}",
		"½ BOTE {0}": "½ POT {0}",
		"BOTE {0}": "POT {0}",
		"TUS FICHAS: {0}": "FIŞLERIN: {0}",
		"Tan cerca. La medalla de plata es la que enseña lo que todavía falta.":
			"Çok yakındı. Gümüş madalya, hâlâ neyin eksik olduğunu gösteren madalyadır.",
		"Te sientan en el vestuario con el director deportivo. En {0} no pueden con tu sueldo y tu traspaso les cuadra el ejercicio: contaban con ese dinero antes de decírtelo.":
			"Seni soyunma odasında sportif direktörle oturtuyorlar. {0} kulübü maaşını kaldıramıyor ve transferin bütçeyi denkleştiriyor: sana söylemeden önce o paraya güveniyorlardı.",
		"Toca una temporada para verla en detalle.":
			"Ayrıntıları görmek için bir sezona dokun.",
		"Toda la ciudad amaneció con esa portada.":
			"Bütün şehir o manşetle uyandı.",
		"Toda la ciudad amaneció con tu fichaje en la portada.":
			"Bütün şehir manşette senin transferinle uyandı.",
		"Tres equipaciones nuevas. El club estrena piel.":
			"Üç yeni forma. Kulüp kabuk değiştiriyor.",
		"Tu solar mide {0} x {0} metros.": "Arsan {0} x {0} metre.",
		"VER TEMPORADA A TEMPORADA": "SEZON SEZON",
		"VER RESUMEN": "OZETI GOR",
		"Valor": "Değer",
		"Ya no se puede ampliar más.": "Daha fazla genişletilemez.",
		"{0}  (liga {1})": "{0}  (ligde {1})",
		"{0} m": "{0} m",
		"{0} · TEMPORADA {1}": "{0} · SEZON {1}",
		"¿CON QUIÉN JUEGAS?": "KIMLER OYNUYOR?",




		"MESA DE PÓQUER": "POKER MASASI",
		"Invita a quien quieras y juégate el dinero de verdad.":
			"İstediğini davet et ve gerçek parasına oyna.",
		"CAMA SENCILLA": "TEK KIŞILIK",
		"Un colchón y a dormir.": "Bir şilte ve uyku.",
		"CAMA DOBLE": "ÇIFT YATAK",
		"De verdad se descansa.": "Gerçekten dinlenirsin.",
		"CAMA KING": "KING SIZE",
		"La cama de alguien que ya llegó.":
			"Artık başarmış birinin yatağı.",
		"Para ver el partido sentado.": "Maçı oturarak izlemek için.",
		"SOFÁ ESQUINERO": "KOŞE KANEPE",
		"Caben los amigos.": "Arkadaşların da sığar.",
		"SOFÁ DE PIEL": "DERI KANEPE",
		"Piel de verdad, del color del salón de un fichaje caro.":
			"Gerçek deri, pahalı bir transferin salonunun renginde.",
		"Donde se come.": "Yemek yenen yer.",
		"MESA DE COMEDOR": "YEMEK MASASI",
		"Para sentar a la familia.": "Bütün aile oturur.",
		"MESA DE MÁRMOL": "MERMER MASA",
		"Pesa media tonelada y se nota.": "Yarım ton çeker, belli de olur.",
		"COCINETA": "MINI MUTFAK",
		"Dos fuegos y un fregadero.": "İki ocak ve bir evye.",
		"COCINA COMPLETA": "TAM MUTFAK",
		"Aquí ya se cocina en serio.": "Artık gerçekten yemek pişirebilirsin.",
		"COCINA CON ISLA": "ADALI MUTFAK",
		"Con isla en medio, como las de revista.":
			"Ortasında adasıyla, dergilerdeki gibi.",
		"GALLINA": "TAVUK",
		"Una gallina que picotea y trota por la casa.":
			"Evin içinde gagalayıp koşturan bir tavuk.",
		"LORO": "PAPAGAN",
		"Un loro de colores que brinca y no para quieto.":
			"Zıplayıp duran, yerinde durmayan rengârenk bir papağan.",
		"PIANO DE COLA": "PIYANO",
		"Laca negra en el salón. Suena a que llegaste.":
			"Salonda siyah cila. Başardığını haykırır.",
		"MESA DE BILLAR": "BILARDO MASASI",
		"Una partida con el vestuario. La química se juega.":
			"Takım arkadaşlarınla bir oyun. Uyum için oynanır.",
		"FUTBOLITO": "LANGIRT",
		"Piques rápidos en casa. Nadie se va sin revancha.":
			"Evde hızlı kapışmalar. Kimse rövanşsız gitmez.",
		"ESCULTURA": "HEYKEL",
		"Una pieza de autor. Puro caché en el salón.":
			"İmzalı bir eser. Salonda saf prestij.",
		"ACUARIO": "AKVARYUM",
		"Un muro de agua y peces. Baja las pulsaciones.":
			"Sudan ve balıklardan bir duvar. Nabzını düşürür.",
		"ESTILO CALIDO": "SICAK STIL",
		"Terracota, roble y luz de tarde. La casa abraza.":
			"Terakota, meşe ve akşam ışığı. Ev seni sarar.",
		"ESTILO INDUSTRIAL": "ENDUSTRIYEL",
		"Cemento visto, acero y madera cruda. Sin adornos.":
			"Brüt beton, çelik ve ham ahşap. Süssüz.",
		"ESTILO MARMOL": "MERMER STIL",
		"Mármol blanco y filos de oro. La casa de un campeón.":
			"Beyaz mermer ve altın kenarlar. Bir şampiyonun evi.",
		"PANTALLA GRANDE": "BUYUK EKRAN",
		"Una tele más grande para ver el gol en condiciones.":
			"Golü doğru dürüst izlemek için daha büyük bir televizyon.",
		"PANTALLA MURAL": "DUVAR EKRANI",
		"Pantalla de pared, como en el palco. Se ve desde la cocina.":
			"Locadaki gibi duvar ekranı. Mutfaktan bile görünür.",
		"MESA DE JARDÍN": "BAHÇE MASASI",
		"BANCA DE JARDÍN": "BAHÇE BANKI",
		"Un sitio donde sentarse fuera y ver pasar la temporada.": "Dışarıda oturup sezonun geçişini izleyecek bir yer.",
		"Con sombrilla. Para comer fuera cuando aprieta el calor.": "Şemsiyesiyle. Sıcak bastırınca dışarıda yemek için.",
		"Agua corriendo en el patio. Se oye antes de verse.": "Avluda akan su. Görmeden önce duyarsın.",
		"Sombra de vigas sobre el patio. Se pasa por debajo.": "Avlunun üstünde kirişlerden gölge. Altından geçilir.",

		"ARBUSTO": "ÇALI",
		"SOMBRILLA": "ŞEMSIYE",
		"FAROL DE JARDÍN": "BAHÇE FENERI",
		"HAMACA": "HAMAK",
		"CAMASTRO": "ŞEZLONG",
		"ÁRBOL": "AGAÇ",
		"COLUMPIO DE TERRAZA": "BAHÇE SALINCAGI",
		"FOGATA": "ATEŞLIK",
		"HUERTO": "SEBZE BAHÇESI",
		"PORTERÍA DE ENTRENO": "ANTRENMAN KALESI",
		"ESTANQUE DE KOI": "KOI HAVUZU",
		"COCINA EXTERIOR": "DIŞ MUTFAK",
		"HELICÓPTERO": "HELIKOPTER",
		"Nada de carreteras: llegas a todo volando y el cuerpo lo nota.": "Yollara elveda: her yere uçarak gidersin ve vücudun bunu hisseder.",
		"HELIPUERTO": "HELIPORT",
		"Verde bajo para el borde del terreno. Se ponen varios.":
			"Arsanın kenarı için alçak yeşillik. Birkaç tane konur.",
		"Sombra donde no hay árbol. Va sola, sin mesa debajo.":
			"Ağaç olmayan yere gölge. Tek başına durur, altında masa yok.",
		"Luz propia fuera: de noche el jardín deja de ser un hueco negro.":
			"Dışarıda kendi ışığın: gece bahçe kara bir delik olmaktan çıkar.",
		"Lona suspendida entre dos postes para descansar al aire libre.":
			"Açık havada dinlenmek için iki direk arasına gerilmiş bez.",
		"Tumbarse al sol. Junto a la piscina se ven de a dos.":
			"Güneşte uzan. Havuz kenarında çift olunca yakışır.",
		"Tres metros de copa: lo único que da sombra de verdad.":
			"Üç metrelik taç: gerçekten gölge yapan tek şey.",
		"Un banco colgado que se mece. Para ver caer la tarde.":
			"Sallanan asılı bir bank. Akşamın çöküşünü izlemek için.",
		"Fuego fuera: alumbra el patio y calienta la noche.":
			"Dışarıda ateş: avluyu aydınlatır, geceyi ısıtır.",
		"Bancales con verdura. Se come lo que sale de tu terreno.":
			"Sebze tarhları. Kendi arsanda yetişeni yersin.",
		"Portería con red: entrenar en casa deja de ser una idea.":
			"Fileli kale: evde antrenman hayal olmaktan çıkar.",
		"Agua quieta con carpas y una cascada que no calla.":
			"Sazanlı durgun su ve hiç susmayan bir şelale.",
		"Barra, fuegos y fregadero fuera. El asador con casa.":
			"Dışarıda tezgâh, ocak ve evye. Evi olan bir mangal.",
		"La losa con la H. No sirve para nada y se ve desde el aire.":
			"Üstünde H olan beton. Hiçbir işe yaramaz ve havadan görünür.",
		"Sombra donde no hay árbol. Se planta y ya hay sitio.":
			"Ağaç olmayan yere gölge. Dik, hazır bir köşe olsun.",
		"Verde bajo para el borde. Lo barato que llena metros.":
			"Kenar için alçak yeşillik. Metreleri doldurmanın ucuz yolu.",
		"Luz propia en el jardín, encendida en cuanto cae la noche.":
			"Bahçede kendi ışığın, gece çöker çökmez yanar.",
		"FUENTE": "ÇEŞME",
		"PÉRGOLA": "PERGOLA",



		"ENTRENO": "IDMAN",
		"ENTRENAMIENTO": "ANTRENMAN",
		"EL CAMPO DE ATRÁS": "ARKA SAHA",
		"Un campo cercado, una caseta y los conos. Con eso se empieza.":
			"Çitli bir saha, bir kulübe ve konilar. Böyle başlanır.",
		"LA CIUDAD DEPORTIVA": "ANTRENMAN TESISI",
		"CIUDAD DEPORTIVA": "TESISLER",
		"Vallado en condiciones, vestuarios y material para el balón parado.":
			"Düzgün çitler, soyunma odaları ve duran top malzemesi.",
		"EL CENTRO DE ALTO RENDIMIENTO": "YUKSEK PERFORMANS MERKEZI",
		"Tribuna, torre de filmación y una estación para cada cosa que sabes hacer.":
			"Tribün, çekim kulesi ve yapabildiğin her şey için bir istasyon.",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario"
		+ " distinto. Todavía no cuenta para la carrera. Se sale con PAUSA.":
			"Bir çalışma seç ve istediğin kadar tekrarla: her deneme farklı bir senaryo kurar. Henüz kariyerine sayılmaz. DURAKLAT ile çıkılır.",
		"QUE SE ENTRENA AQUI": "BURADA NE ÇALIŞILIR",
		"SI SUBES DE CATEGORIA": "UST LIGE ÇIKARSAN",
		"Se abre: {0}.": "Açılır: {0}.",
		"PREPARADOR FÍSICO": "KONDISYONER",
		"Alguien que cuida tu cuerpo a jornada completa: la mayor recuperación tras"
		+ " cada partido.":
			"Vücuduna tam zamanlı bakan biri: her maçtan sonra en büyük toparlanma.",
		"CHEF PERSONAL": "OZEL AŞÇI",
		"Cocina para ti cada semana: COMER BIEN no te gasta acción y recuperas más energía tras cada partido.":
			"Her hafta senin için yemek yapar: IYI BESLEN artık eylem harcamaz ve her maçtan sonra daha çok enerji toplarsın.",
		"TU CHEF COCINÓ · SIN GASTAR ACCIÓN": "AŞÇIN PIŞIRDI · EYLEM HARCANMADI",
		"NUTRICIONISTA": "DIYETISYEN",
		"Te arma la dieta de cada semana: cada partido te gasta menos energía.": "Her haftanın diyetini hazırlar: her maç daha az enerji harcatır.",
		"ENTRENADOR PERSONAL": "KIŞISEL ANTRENOR",
		"Te espera en tu gimnasio: LEVANTAR PESAS no te gasta acción.": "Seni spor salonunda bekler: AGIRLIK KALDIR artık eylem harcamaz.",
		"CON TU ENTRENADOR · SIN GASTAR ACCIÓN": "ANTRENORUNLE · EYLEM HARCANMADI",
		"GASTO": "KAYIP",
		"ACCIONES": "EYLEMLER",
		"NIVEL {0}/{1}": "DUZEY {0}/{1}",
		"TUYO · NIVEL {0}/{1}": "SENIN · DUZEY {0}/{1}",
		"SUBE A NIVEL {0} · PAGO ÚNICO": "DUZEY {0} YAP · TEK ODEME",
		"Comes como atleta: +{0}% de experiencia en cada partido.": "Sporcu gibi beslenirsin: her maçtan +%{0} deneyim.",
		"Te cuida el cuerpo: {0}% menos riesgo de lesión.": "Vücuduna bakar: sakatlık riski %{0} daha az.",
		"Más exigente: LEVANTAR PESAS te da +{0} de técnico.": "Daha zorlu: AGIRLIK KALDIR hocayla ilişkine +{0} katar.",
		"CONSULTORIO DE NUTRICIÓN": "DIYETISYEN OFISI",
		"Escritorio, báscula con tallímetro y el plato en la pared: donde trabaja tu nutricionista.": "Masa, boy ölçerli tartı ve duvarda besin tabağı: diyetisyeninin çalıştığı yer.",
		"El consultorio de tu nutricionista: escritorio, báscula con tallímetro y el póster del plato.": "Diyetisyeninin ofisi: masa, boy ölçerli tartı ve besin tabağı posteri.",
		"CLÍNICA PRIVADA": "OZEL KLINIK",
		"Casi la mitad de riesgo de lesión, y toda baja dura la mitad.":
			"Sakatlık riski neredeyse yarıya iner ve her sakatlık yarısı kadar sürer.",
		"ANALISTA DE VÍDEO": "VIDEO ANALISTI",
		"Estudias cada partido con alguien que sabe mirar: +25% de experiencia.":
			"Her maçı bakmasını bilen biriyle incelersin: +%25 deneyim.",
		"RENEGOCIAR CON EL AGENTE": "MENAJERLE PAZARLIK",
		"Su comisión baja del 8% al 3%. Cara, pero cuanto antes la firmes, más te"
		+ " devuelve.":
			"Komisyonu %8'den %3'e iner. Pahalı, ama ne kadar erken imzalarsan o kadar çok geri kazandırır.",
		"CORTES DE PELO": "SAÇ KESIMLERI",
		"VELLO FACIAL": "SAKAL BIYIK",
		"TINTES": "BOYA",
		"PUNTAS": "UÇLAR",
		"ENTRADAS": "AÇILMA",
		"La frente que gana terreno. Asúmelo con dignidad.":
			"Geri çekilen saç çizgisi. Onurla kabullen.",
		"RAPADO A LOS LADOS": "YANLAR SIFIR",
		"Máquina en los lados, tupé arriba. El corte de vestuario.":
			"Yanlar makineyle, üstü kabarık. Soyunma odası kesimi.",
		"RAYA AL LADO": "YANDAN AYRIK",
		"Una raya rapada a navaja. Detalle de peluquería cara.":
			"Ustura ile açılmış bir ayrım. Pahalı berber işi.",
		"DEGRADADO": "DEGRADE",
		"Se difumina hacia abajo. Nunca pasa de moda.":
			"Aşağı doğru kaybolur. Asla modası geçmez.",
		"FRANJAS RAPADAS": "KAZIMA ÇIZGI",
		"Rayas marcadas al ras. Para el que ya tuvo su noche perfecta.":
			"Sıfıra kazınmış çizgiler. Mükemmel gecesini yaşamış oyuncu için.",
		"CRESTA ANCHA": "GENIŞ IBIK",
		"El mohicano de los campeones. Se lleva con una liga en la vitrina.":
			"Şampiyonların mohikanı. Vitrinde bir lig kupasıyla taşınır.",
		"PATILLAS": "FAVORILER",
		"Bajan por la mandíbula y ahí se quedan.": "Çene boyunca iner ve orada kalır.",
		"MOSCA": "DUDAK ALTI",
		"Un toque bajo el labio. Poco pelo, mucha actitud.":
			"Dudağın altında bir dokunuş. Az kıl, bol tavır.",
		"CANDADO": "KONTUR",
		"Contorno fino, mejilla limpia. Requiere pulso.":
			"İnce kontur, temiz yanak. Sağlam el ister.",
		"BARBÓN": "GUR SAKAL",
		"Barba cerrada de verdad. Diez años encima en una semana.":
			"Gerçekten gür bir sakal. Bir haftada on yaş büyürsün.",
		"BIGOTE MANILLAR": "PALA BIYIK",
		"Las puntas caen. Solo se lo permite quien lleva una década.":
			"Uçlar aşağı sarkar. Ancak on yılı devirmiş biri yakıştırabilir.",
		"PLATINO": "PLATIN",
		"Decolorado entero. Te van a encontrar en cualquier repetición.":
			"Baştan aşağı açık renk. Her tekrarda seni bulurlar.",
		"ROJO FUEGO": "ATEŞ RENGI",
		"Se ve desde el último anillo de la grada.":
			"Tribünün en üst katından görünür.",
		"AZUL ELÉCTRICO": "ELEKTRIK MAVI",
		"Para el que ya fue el mejor de un mes y quiere que se note.":
			"Ayın oyuncusu olmuş ve bunun görülmesini isteyen için.",
		"ROSA": "PEMBE",
		"Solo se lo puede permitir alguien con un Balón de Oro en casa.":
			"Bunu ancak evinde Yılın Oyuncusu ödülü olan biri taşıyabilir.",
		"PUNTAS DECOLORADAS": "AÇIK UÇLAR",
		"Solo las puntas. El resto se queda como estaba.":
			"Sadece uçlar. Gerisi olduğu gibi kalır.",
		"PUNTAS DORADAS": "ALTIN UÇLAR",
		"Oro en las puntas. Se gana ganando Europa.":
			"Uçlarda altın. Avrupa'yı kazanarak hak edilir.",




		"RADIO COMARCAL": "YEREL RADYO",
		"CERÁMICA NORTE": "KUZEY SERAMIK",
		"NOVA MÓVIL": "NOVA MOBIL",
		"HELIOS SEGUROS": "HELIOS SIGORTA",
		"IMPERIAL": "IMPERIAL",
		"Te conocen del barrio. Cada año que cumples, te suben el trato.":
			"Seni mahalleden tanırlar. Hedefi tutturduğun her yıl anlaşmayı büyütürler.",
		"Narran tus partidos y te pagan por el pase, no por el remate.":
			"Maçlarını anlatırlar ve golü değil, pası öderler.",
		"Casi no te pagan por venir. Te pagan por el año entero.":
			"Gelmen için neredeyse hiç ödemezler. Bütün yıl için öderler.",
		"La valla del estadio es tuya, pero sólo cobras cuando marcas.":
			"Stadyumdaki reklam panosu senin, ama sadece gol attığında kazanırsın.",
		"Les gusta el balón parado. Lo demás no se lo cuentan.":
			"Duran topları severler. Gerisi onlar için sayılmaz.",
		"Pagan la asistencia como otros pagan el gol.":
			"Asisti, başkalarının golü ödediği gibi öderler.",
		"La llevan los que deciden partidos. Les da igual cómo.":
			"Maçları belirleyen oyuncular taşır. Nasıl olduğu umurlarında değil.",
		"Quieren regularidad, no fuegos artificiales. Y la quieren todo el año.":
			"Havai fişek değil, istikrar isterler. Hem de bütün yıl.",
		"Sólo miran las noches grandes: Europa y copa. La liga no existe.":
			"Sadece büyük gecelere bakarlar: Avrupa ve kupa. Lig yok onlar için.",
		"La marca del mundo te mira, y el mundo no se conforma.":
			"Dünya markası seni izliyor, ve dünya yetinmez.",
		"El contrato de una vida, y pide la temporada de una vida.":
			"Bir ömrün sözleşmesi; karşılığında bir ömrün sezonunu ister.",
		"{0} ASISTENCIAS": "{0} ASIST",
		"{0} ENTRE GOLES Y ASISTENCIAS": "{0} GOL VE ASIST",
		"{0} GOLES A BALÓN PARADO": "{0} DURAN TOP GOLU",
		"{0} GOLES EN EUROPA O COPA": "AVRUPA VEYA KUPA: {0} GOL",
		" Y MEDIA {0}": " VE GENEL {0}",
		" · media {0}/{1}": " · genel {0}/{1}",
		"GOL O ASISTENCIA": "GOL YA DA ASIST",
		"GOL DE BALÓN PARADO": "DURAN TOP GOLU",
		"GOL EN EUROPA O COPA": "AVRUPA/KUPA GOLU",
		"GOL DE PENAL": "PENALTI GOLU",
		"{0} te sube el trato: ${1} por partido": "{0} anlaşmanı büyütüyor: maç başına ${1}",
		"${0} por partido + ${1} por {2}": "Maç başına ${0} + her {2} için ${1}",
		"${0} / PARTIDO   +${1} POR {2}": "${0} / MAÇ   +${1} / {2}",
		"PREMIO ${0}": "PRIM ${0}",
		"TU MARCA": "MARKAN",
		"PANADERÍA DEL BARRIO": "MAHALLE FIRINI",
		"IRON FIT": "IRON FIT",
		"VOLT COLA": "VOLT COLA",
		"BANCO MERIDIÁN": "MERIDIAN BANK",
		"Pagan por estar en el campo. Si te sientan, no cobras.":
			"Sahada olduğun için öderler. Yedeğe çekilirsen para yok.",
		"KRONOS SPORT": "KRONOS SPORT",
		"MOTORES ARIA": "ARIA MOTOR",
		"AEROLÍNEAS CÉNIT": "ZENITH HAVAYOLU",

		"PROMESA": "UMUT",
		"PROFESIONAL": "PROFESYONEL",
		"FIGURA": "LIDER",
		"ESTRELLA MUNDIAL": "DUNYA YILDIZI",
		"LEYENDA": "EFSANE",
		"INMORTAL": "EBEDI",
		"del Mundo": "— Dünya",
		"de tu club": "— kulübün",
		"de {0}": "— {0}",
		"INMORTAL {0}": "EBEDI {0}",
		"INMORTAL ★{0}": "EBEDI ★{0}",
		"Leyenda eterna {0}.": "Ebedi efsane {0}.",
		"—a las puertas": "—eşikte",
		"Te falta prestigio de leyenda mundial (o palmarés de club) para LEYENDA.":
			"EFSANE olmak için dünya efsanesi prestiji (ya da kulüpte kupa koleksiyonu) gerekiyor.",
		"CLASIFICATORIAS": "ELEMELER",
		"CLASIF. MUNDIAL": "DUNYA ELEMESI",
		"CLASIF. EUROPA": "AVRUPA ELEMESI",
		"CLASIF. SUDAMÉRICA": "G.AMERIKA ELEMESI",
		"CLASIF. NORTEAMÉRICA": "K.AMERIKA ELEMESI",
		"CLASIF. ASIA": "ASYA ELEMESI",
		"CLASIF. ÁFRICA": "AFRIKA ELEMESI",
		"CLASIF. OCEANÍA": "OKYANUSYA ELEMESI",
		"MUNDIAL": "DUNYA",
		"CONTINENTAL": "KITASAL",


		"AMISTOSOS": "HAZIRLIK",
		"TODA LA CARRERA POR TORNEO": "TURNUVAYA GORE TUM KARIYER",
		"Ningún puesto de esta liga da plaza de {0}: las plazas se reparten por el"
		+ " coeficiente del país, y la última competición es la puerta de las ligas"
		+ " pequeñas.":
			"Bu ligde hiçbir sıra {0} bileti vermiyor: biletler ülke katsayısına göre dağıtılır ve son turnuva, küçük liglerin kapısıdır.",
		"De {0} temporada(s) vieja(s) sólo se guardó el total, sin repartir por"
		+ " torneo: no entran en esta tabla.":
			"{0} eski sezon için yalnızca toplam kaydedildi, turnuvalara bölünmedi: bu tabloda yer almıyor.",
		"EUROCOPA": "AVR. TURNUVASI",
		"COPA AMÉRICA": "G.AMERIKA TURNUVASI",
		"COPA ORO": "K.AMERIKA TURNUVASI",
		"COPA DE ASIA": "ASYA TURN.",
		"COPA AFRICANA": "AFRIKA TURN.",
		"COPA CONTINENTAL": "KITA KUPASI",




		"COPA DE CAMPEONES": "ELIT KUPASI",
		"COPA EUROPA": "AVR. KUPASI",
		"COPA CONFERENCIA": "CHALLENGE KUPASI",

		"Aún no hay nada que exponer": "Henüz sergilenecek bir şey yok",
		"sin sitio · pon otra vitrina o repisa": "yer yok · başka bir vitrin ya da raf koy",
		"sin sitio · pon otro estante de balones": "yer yok · başka bir top rafı koy",
		"CAMISETAS": "FORMALAR",
		"EN EQUIPO": "TAKIM",
		"INDIVIDUALES": "BIREYSEL",
		"Sin registro del año": "Yıl kaydı yok",
		"SALIR DE LA CANCHA": "SAHADAN ÇIK",
		"Pronto podrás entrenar aquí.": "Yakında burada antrenman yapabileceksin.",
		"ISLA CON BARRA": "BARLI ADA",
		"La barra exenta: se cocina de un lado y se come del otro.":
			"Bağımsız bar: bir yanda pişirilir, öbür yanda yenir.",
		"TOCADOR CON ESPEJO": "AYNALI ŞIFONYER",
		"CAMA PARA PERRO": "KOPEK YATAGI",
		"RASCADOR PARA GATO": "KEDI AGACI",
		"LAVANDERÍA": "ÇAMAŞIR",
		"MUEBLE DE RECIBIDOR": "ANTRE KONSOLU",
		"VESTIDOR DE ROPA DE CALLE": "GUNLUK KIYAFET DOLABI",
		"TELESCOPIO": "TELESKOP",
		"CAMBIAR DE ROPA": "UZERINI DEGIŞ",
		"VOLVER A CASA": "EVE DON",
		"Cojín, manta y juguete: el perro tiene dónde descansar.":
			"Minder, battaniye ve oyuncak: köpeğinin dinlenecek yeri var.",
		"Postes y plataformas para que el gato tenga su rincón.":
			"Kedin kendi köşesine sahip olsun diye direkler ve platformlar.",
		"Lavadora, cesta y toallas para la ropa de entrenamiento.":
			"Antrenman kıyafetlerin için çamaşır makinesi, sepet ve havlular.",
		"Llaves, mochila y zapatos: todo a mano junto a la entrada.":
			"Anahtarlar, sırt çantası ve ayakkabılar: hepsi girişte elinin altında.",
		"Ropa de calle, tenis y espejo. Acércate para cambiarte.":
			"Günlük kıyafetler, spor ayakkabılar ve ayna. Üstünü değiştirmek için yanına git.",
		"Tubo óptico sobre trípode para tu rincón junto a la ventana.":
			"Pencere kenarındaki köşen için tripod üstünde bir optik tüp.",
		"Un rincón para los dos: espejo, frascos y banqueta.":
			"İki kişilik bir köşe: ayna, şişeler ve tabure.",
		"TOCADOR": "MAKYAJ",
		"El rincón de arreglarse, con espejo y su banqueta.":
			"Hazırlanma köşesi: aynası ve taburesiyle.",
		"DESPACHO CON CAJA FUERTE": "KASALI ÇALIŞMA ODASI",
		"Escritorio, carpetas y caja fuerte. Aquí se firma lo que ganas.":
			"Masa, dosyalar ve kasa. Kazandığın para burada imzalanır.",
		"REPASAR CONTRATOS": "SOZLEŞMELERE BAK",
		"Una tarde con tu agente y los papeles sobre la mesa.":
			"Menajerinle bir öğleden sonra, kâğıtlar masada.",
		"SAUNA": "SAUNA",
		"Duelas, piedras calientes y media hora de calor seco.":
			"Ahşap paneller, sıcak taşlar ve yarım saat kuru sıcak.",
		"Calor seco en duelas de pino. Sales otro después del partido.":
			"Çam paneller arasında kuru sıcak. Maçtan sonra yenilenmiş çıkarsın.",
		"GORRAS DE LA SELECCIÓN": "MILLI TAKIM ŞAPKALARI",
		"Una gorra por partido con tu país. Se llena sola.":
			"Ülkenle oynadığın her maç için bir şapka. Kendi kendine dolar.",
		"BALÓN DEL PRIMER GOL": "ILK GOL TOPU",
		"El balón de tu primer gol, bajo cristal y con su cartela.":
			"İlk golünün topu, camın altında, etiketiyle.",
		"COCINA DEL NUTRICIONISTA": "DIYETISYEN MUTFAGI",
		"Nevera de raciones pesadas y báscula en la barra.":
			"Tartılmış porsiyonlarla dolu buzdolabı ve tezgâhta tartı.",
		"Comer medido: la misma comida de casa, pero pesada.":
			"Ölçülü beslenme: evdeki yemeğin aynısı, ama tartılmış.",
		"Todo pesado y a su hora: el cuerpo lo nota el domingo.":
			"Her şey tartılı ve saatinde: vücudun pazar günü bunu hisseder.",
		"Barra central con fregadero: aquí se cocina y se come.":
			"Evyeli orta tezgâh: burada pişirilir, burada yenir.",
		"MALETAS APILADAS": "BAVUL YIGINI",
		"Una maleta por club. La pila crece con cada traspaso.":
			"Her kulüp için bir bavul. Yığın her transferle büyür.",
		"SILLÓN DE BARBERO": "BERBER KOLTUGU",
		"Cuero, espejo con bombillas y carrito. Aquí se hacen las portadas.":
			"Deri, ampullü ayna ve servis arabası. Kapak fotoğrafları burada başlar.",
		"VITRINA ISLA": "ADA VITRIN",
		"La isla de museo: cristal por los cuatro lados y tres baldas.":
			"Müze adası: dört yanı cam, üç raf.",
		"ESTATUA DE BRONCE": "BRONZ HEYKEL",
		"Tú en bronce, sobre un plinto con tu nombre y tus títulos.":
			"Bronzdan sen, adının ve kupalarının yazdığı bir kaidenin üstünde.",
		"SIESTA AL SOL": "GUNEŞ UYKUSU",
		"Media hora fuera, sin teléfono. El cuerpo lo agradece.":
			"Dışarıda yarım saat, telefonsuz. Vücudun teşekkür eder.",


		"CABINA DE PÓDCAST": "PODCAST KABINI",
		"TINA DE HIELO": "BUZ KUVETI",
		"BANCO DE BOTAS": "KRAMPON BANKI",
		"TOALLERO": "HAVLULUK",
		"ESPEJO DE CUERPO ENTERO": "BOY AYNASI",
		"MESA DE CENTRO": "ORTA SEHPA",
		"RINCÓN DEL CAFÉ": "KAHVE KOŞESI",
		"APARADOR DE VAJILLA": "VITRIN DOLABI",
		"GALLINERO": "KUMES",
		"GRABAR UN PÓDCAST": "PODCAST KAYDET",
		"BAÑO DE HIELO": "BUZ BANYOSU",
		"LIMPIAR LAS BOTAS": "KRAMPON TEMIZLE",
		"MINIJUEGOS": "OYUNLAR",
		"Micro, cascos y panel acústico. Graba tu semana: rinde con la prensa.":
			"Mikrofon, kulaklık ve akustik panel. Haftanı kaydet: basın sever.",
		"Agua a tres grados. Tres minutos que las piernas agradecen.":
			"Üç derecelik su. Bacaklarının teşekkür edeceği üç dakika.",
		"Balda, cepillo y hormas. Botas cuidadas se gastan la mitad.":
			"Raf, fırça ve kalıplar. Bakımlı kramponlar yarı yarıya az aşınır.",
		"Barra de pared con toallas limpias. Pide muro para colgarse.":
			"Temiz havlulu duvar askısı. Asılmak için duvar ister.",
		"Luna de cuerpo entero para mirarte antes de salir.":
			"Çıkmadan önce kendine bakmak için boy aynası.",
		"Baja, delante del sofá: ahí van el café y el mando.":
			"Alçak, kanepenin önünde: kahve ve kumanda oraya.",
		"Cafetera, tazas y molinillo. El primer café del día, en casa.":
			"Kahve makinesi, fincanlar ve değirmen. Günün ilk kahvesi evde.",
		"Vajilla a la vista tras el cristal. La mesa se pone desde aquí.":
			"Cam arkasında sergilenen tabaklar. Sofra buradan kurulur.",
		"Caseta con tejadillo y nidal: la gallina tiene dónde dormir.":
			"Çatılı ve folluklu küçük bir kulübe: tavuğunun uyuyacak yeri var.",
		"Una hora de micrófono contando tu semana. Una acción semanal.":
			"Haftanı anlattığın bir saatlik mikrofon. Haftalık bir eylem.",
		"Cepillo, betún y cordones: el próximo partido gasta la mitad.":
			"Fırça, boya ve bağcıklar: sonraki maç onları yarı yarıya az aşındırır.",
		"Con las botas de cantera no hay nada que cuidar.":
			"Altyapı kramponlarında bakılacak bir şey yok.",
		"Tus botas ya están listas para el próximo partido.":
			"Kramponların bir sonraki maça şimdiden hazır.",
		"Espera al alta médica para entrenar.": "Antrenman için doktordan onay bekle.",
		"UN JEQUE": "BIR ŞEYH",
		"UN MAGNATE": "BIR MAGNAT",
		"UN FONDO": "BIR FON",
		"LOS INGRESOS SE DOBLAN": "GELIR IKI KAT",
		"COMPRA PARA VENDER": "SATMAK IÇIN ALIR",
		"Compra el club para ganarlo todo: el doble de presupuesto en GERENCIA, y la directiva te va a pedir mucho más arriba en la tabla.": "Kulübü her şeyi kazanmak için alıyor: YONETIM'de iki kat bütçe var ve yönetim kurulu puan tablosunda çok daha yukarıyı isteyecek.",
		"Un fondo de inversión compra el club para revenderlo: algo más de presupuesto, y en su último año vende lo que más vale del vestuario.": "Yatırım fonu kulübü yeniden satmak için alıyor: biraz daha fazla bütçe var ve son yılında soyunma odasındaki en değerli oyuncuyu satıyor.",
		"Te sientan en el vestuario con el director deportivo. El fondo que compró {0} se va este verano y quiere su beneficio: eres lo que más vale del vestuario, y tu traspaso es la plusvalía.": "Seni soyunma odasında sportif direktörle oturtuyorlar. {0} kulübünü satın alan fon bu yaz gidiyor ve kârını istiyor: soyunma odasındaki en değerli oyuncu sensin ve transferin o kâr.",
		"FACHADA": "CEPHE",
		"TORRE DE CRISTAL": "CAM KULE",
		"Tu piso en una torre de vidrio y acero: la ciudad entera en la ventana.": "Cam ve çelik bir kulede dairen: bütün şehir pencerende.",
		"EDIFICIO COLONIAL": "KOLONYAL BINA",
		"Balcones de hierro, arcos y muros de color: el barrio viejo de la ciudad.": "Demir balkonlar, kemerler ve renkli duvarlar: şehrin eski mahallesi.",
		"CASA MEDITERRANEA": "AKDENIZ EVI",
		"Muros encalados, teja árabe y buganvilla: huele a mar.": "Badanalı duvarlar, kiremit çatı ve begonvil: deniz kokuyor.",
		"CABAÑA DE MADERA": "AHŞAP KULUBE",
		"Troncos, porche con mecedora y chimenea de piedra: el bosque en tu puerta.": "Kütükler, sallanan sandalyeli veranda ve taş baca: orman kapında.",
		"CUBO DE CRISTAL": "CAM KUP",
		"Un cubo de vidrio sobre el jardín: todo luz, nada que esconder.": "Bahçenin üstünde bir cam küp: bol ışık, saklanacak bir şey yok.",
		"LOFT DE HORMIGON": "BETON LOFT",
		"Hormigón visto, ventanales de taller y puerta de acero: industrial de verdad.": "Açık beton, atölye pencereleri ve çelik kapı: gerçek endüstriyel.",
		"MANSION VICTORIANA": "VIKTORYA KOŞKU",
		"Torreón, buhardillas y balaustradas: la casa de las películas.": "Kule, çatı pencereleri ve korkuluklar: filmlerdeki ev.",
		"VILLA MEDITERRANEA": "SAHIL VILLASI",
		"Arcos, palmeras y terraza con pérgola: una villa junto al mar.": "Kemerler, palmiyeler ve pergolalı teras: denizin kıyısında bir villa.",
		"HACIENDA": "HACIENDA",
		"Portón de madera, patio con arcos y campanario: la casa grande del campo.": "Ahşap kapı, kemerli avlu ve çan kulesi: kırın büyük evi.",
		"RANCHO": "RANCH",
		"Cercas de madera, granero rojo y establo: tierra tuya hasta donde alcanza la vista.": "Ahşap çitler, kırmızı ambar ve ahır: gözün gördüğü yere kadar senin toprağın.",
		"Bono de relación ya estrenado: no vuelve a sumar.": "İlişki bonusu zaten alındı: bir daha eklenmez.",
		"¿VOLVER A LA DE FÁBRICA?": "FABRIKA HALINE DON?",
		"Se quita sin reembolso y la casa vuelve a la de fábrica. Comprarla otra vez cuesta lo mismo.": "İade olmadan kaldırılır ve ev fabrika haline döner. Yeniden almak aynı fiyata.",
		"BUZÓN": "POSTA KUTUSU",
		"COLUMPIO": "SALINCAK",
		"UN AFICIONADO": "BIR TARAFTAR",
		"Hay {0} ofertas sobre la mesa. No las dejes enfriar.": "Masada {0} teklif var. Soğumalarına izin verme.",
		"Tu precontrato está firmado. En verano cambias de aires.": "Ön sözleşmen imzalandı. Yazın hava değişikliği var.",
		"Te vi el último partido y no me moví del asiento. Gracias.": "Son maçta seni izledim, koltuğumdan kalkamadım. Teşekkürler.",
		"Tu nuevo contrato ya está en vigor: {0} temporadas más con nosotros.": "Yeni sözleşmen yürürlükte: bizimle {0} sezon daha.",
		"Van {0} goles esta temporada. La directiva lo celebra contigo.": "Bu sezon {0} gol oldu. Yönetim seninle kutluyor.",
		"Gracias por los títulos de la temporada pasada. La vitrina también es tuya.": "Geçen sezonki kupalar için teşekkürler. Vitrin senin de.",
		"Te cortan la rueda a gritos. Esta noche el vestuario no espera a nadie.": "Basın toplantısı bağırışlarla bölünüyor. Bu gece soyunma odası kimseyi beklemiyor.",
		"El confeti del suelo es del otro. Y aun así te toca contestar.": "Yerdeki konfeti rakibin. Yine de cevap vermek sana düşüyor.",
		"Se cuela uno a gritar detrás de ti. Un derbi también se gana delante del micro.": "Biri arkandan bağırarak sızıyor. Derbi mikrofonun önünde de kazanılır.",
		"TOCAR EL PIANO": "PIYANO ÇAL",
		"OCTAVA {0}": "OKTAV {0}",
		"TOCA LAS TECLAS": "TUŞLARA DOKUN",
		"CRUCETA ELIGE · {0} TOCA": "YON TUŞU SEÇER · {0} ÇALAR",
		"INTERCAMBIADAS": "TAKAS",
		"AQUÍ": "BURADA",
		"PONER AQUÍ": "BURAYA KOY",
		"TRAER AQUÍ": "BURAYA TAŞI",
		"DEJARLA AUTOMÁTICA": "OTOMATIK YAP",
		"PROMETER UN GOL": "GOL SOZU VER",
		"{0} llega con cinco victorias seguidas en liga. El de la radio local, el único que te espera a la salida, te pregunta si os dan miedo.": "{0} ligde art arda beş galibiyetle geliyor. Çıkışta seni bekleyen tek kişi olan yerel radyocu, onlardan korkup korkmadığınızı soruyor.",
		"{0} llega con cinco victorias seguidas en liga. La sala de prensa está llena hasta el pasillo, y todas las cámaras te preguntan si os dan miedo.": "{0} ligde art arda beş galibiyetle geliyor. Basın salonu koridora kadar dolu ve bütün kameralar onlardan korkup korkmadığınızı soruyor.",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Un periodista de la radio local te para en el aparcamiento: ¿es el mejor momento para cruzártelos?": "{0} beş haftadır kazanamıyor ve tribünleri kelle istiyor. Yerel radyodan bir muhabir seni otoparkta durduruyor: Onlarla karşılaşmanın en doğru zamanı bu mu?",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Con la sala llena, la primera pregunta es para ti: ¿es el mejor momento para cruzártelos?": "{0} beş haftadır kazanamıyor ve tribünleri kelle istiyor. Salon tıklım tıklım ve ilk soru sana: Onlarla karşılaşmanın en doğru zamanı bu mu?",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y el chico de la radio local quiere saber si tú sí.": "{0} bu sezon yeni teknik direktörle başladı: {1}. Henüz kimse nasıl oynadıklarını bilmiyor ve yerel radyodaki genç, senin bilip bilmediğini merak ediyor.",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y una sala llena de cámaras quiere saber si tú sí.": "{0} bu sezon yeni teknik direktörle başladı: {1}. Henüz kimse nasıl oynadıklarını bilmiyor ve kameralarla dolu bir salon senin bilip bilmediğini merak ediyor.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Sólo el fotógrafo del periódico local busca la foto del reencuentro.": "Bir zamanlar seni çalıştıran teknik direktör {0} şimdi {1} kulübünün kulübesinde oturuyor. Buluşma fotoğrafının peşinde yalnızca yerel gazetenin fotoğrafçısı var.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Medio país quiere la foto del reencuentro, y las cámaras ya os esperan en el túnel.": "Bir zamanlar seni çalıştıran teknik direktör {0} şimdi {1} kulübünün kulübesinde oturuyor. Ülkenin yarısı buluşma fotoğrafını istiyor ve kameralar sizi tünelde bekliyor.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. En la radio local te preguntan si podrás con él.": "{1} bu sezon {0} adlı oyuncuyu transfer etti ve şimdiden ilk 11'lerinin en iyilerinden. Yerel radyoda onunla baş edip edemeyeceğini soruyorlar.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Las portadas ya venden el partido como vuestro duelo, y la sala entera te pregunta por él.": "{1} bu sezon {0} adlı oyuncuyu transfer etti ve şimdiden ilk 11'lerinin en iyilerinden. Manşetler maçı şimdiden ikinizin düellosu diye satıyor ve bütün salon sana onu soruyor.",
		"En tu país se ha coronado {0}. Una radio de allí, de las pocas que te siguen, te pregunta si algún día te verán jugar en casa.": "Ülkende {0} şampiyon oldu. Seni takip eden az sayıdaki radyodan biri, bir gün seni memlekette oynarken görüp göremeyeceklerini soruyor.",
		"En tu país se ha coronado {0}, y la prensa de allí abre con tu cara: ¿algún día te verán jugar en casa?": "Ülkende {0} şampiyon oldu ve oranın basını manşete seni taşıyor: Bir gün seni memlekette oynarken görecekler mi?",
		"COPAS": "KUPALAR",
		"TASACIÓN": "DEGERLEME",
		"AFICIONADO": "TARAFTAR",
		"COLECCIONISTA": "KOLEKSIYONCU",
		"QUEDÁRMELA": "BENDE KALSIN",
		"VENDIDA": "SATILDI",
		"PERCHERO DE TIENDA": "MAGAZA ASKILIGI",
		"Doce playeras en ganchos, como en la tienda: las tuyas y las que cambiaste.": "Mağazadaki gibi askıda on iki forma: seninkiler ve değiştirdiklerin.",
		"Te sale a encarar: pica cuando el aro llegue a sus piernas y pásasela por el túnel.": "Üstüne geliyor: halka bacaklarına gelince dokun ve bacak arası geçir.",
		"Toca la pantalla cuando el aro se cierre": "Halka kapanınca ekrana dokun",
		"Pulsa cuando el aro se cierre": "Halka kapanınca bas",
		"SUBASTAR": "MEZAT",
		"SALIDA": "AÇILIŞ",
		"PUJA": "TEKLIF",
		"PARA EL {0}": "{0} NOLU",
		"SE FUE": "KAÇTI",
		"ADJUDICAR": "ÇEK",
		"COBRAR": "AL",
		"¡VENDIDA!": "SATILDI!",
		"DESIERTA": "ALICISIZ",
		"DUDA": "HMM",
		"${0} / PARTIDO": "${0} / MAÇ",
		"+${0} POR {1}": "+${0} / {1}",
		"INDEMNIZACIÓN ${0}": "TAZMINAT ${0}",
		"ROMPISTE CON {0}": "{0} FESHEDILDI",
		"URNA DE PLAYERAS": "FORMA VITRINI",
		"MURAL DE PLAYERAS": "FORMA DUVARI",
		"VITRINA DE ESPECIALES": "NADIRLER VITRINI",
		"Tres playeras tras el cristal, con luz de museo.": "Camın ardında üç forma, müze ışığıyla.",
		"Seis playeras enmarcadas en dos filas: tu salón de la fama.": "İki sırada altı çerçeveli forma: senin şöhretler salonun.",
		"Se llena sola con tus cambiadas más raras y valiosas.": "Kendi kendine en nadir değiş tokuş formalarınla dolar.",
		"CHIHUAHUA": "CHIHUAHUA",
		"SALCHICHA": "SOSIS KOPEK",
		"GOLDEN": "GOLDEN",
		"HUSKY": "HUSKY",
		"GATO NEGRO": "KARA KEDI",
		"GATO GRIS": "GRI KEDI",
		"SIAMES": "SIYAM",
		"PERSA": "IRAN KEDISI",
		"Cabe en una mano y ladra como uno grande.": "Bir avuca sığar ama koca köpek gibi havlar.",
		"Largo, bajito y siempre detrás de ti.": "Uzun, alçak ve hep peşinde.",
		"Dorado, bonachón y el favorito del vestuario.": "Altın renkli, iyi huylu ve soyunma odasının gözdesi.",
		"Ojos de hielo y energía para dar y regalar.": "Buz gibi gözler ve tükenmeyen enerji.",
		"Dicen que da mala suerte... al rival.": "Uğursuz derler... rakip için.",
		"Tranquilo, elegante y dueño del sofá.": "Sakin, zarif ve kanepenin sahibi.",
		"Ojos azules y opinión sobre todo.": "Mavi gözler ve her şeye dair bir fikir.",
		"Una nube blanca que duerme donde quiere.": "Canı nerede isterse orada uyuyan beyaz bir bulut.",
		"LUEGO": "SONRA",
		"AL VECINDARIO": "SOKAGA ÇIK",
		"EL COMUNICADO": "AÇIKLAMA",
		"Tus palabras siguen dando vueltas y el club espera un comunicado antes del próximo partido.": "Sözlerin hâlâ konuşuluyor ve kulüp bir sonraki maçtan önce bir açıklama bekliyor.",
		"Tu roja dejó al equipo con diez. El club te pide un comunicado antes del próximo partido.": "Kırmızı kartın takımı on kişi bıraktı. Kulüp bir sonraki maçtan önce açıklama istiyor.",
		"Tu festejo le costó una multa al club y la polémica no se apaga. Esperan tu comunicado.": "Sevincin kulübe para cezasına mal oldu ve tartışma dinmiyor. Açıklamanı bekliyorlar.",
		"PEDIR PERDÓN": "OZUR DILE",
		"SOSTENERLO": "DIREN",
		"HIERBAS": "OTLAR",
		"LECHUGA": "MARUL",
		"JITOMATE": "DOMATES",
		"CHILES": "ACI BIBER",
		"FRESAS": "ÇILEK",
		"MAÍZ": "MISIR",
		"AGUACATE": "AVOKADO",
		"AGAVE": "AGAV",
	},





	"match_strip": {
		"ULTIMO": "ONCEKI",
		"PROXIMO": "SONRAKI",
		"DEBUT": "DEBUT",
		"FIN": "SON",
		"HOY": "BUGUN",
		"DERBI": "DERBI",
		"CASA": "EV",
		"FUERA": "DEP",



		"{0} DERBIS · {1}": "{0} DERBI · {1}",
		"{0} DERBIS SIN GANARLE": "{0} DERBI GALIBIYETSIZ",
		"{0} DERBIS GANADOS SEGUIDOS": "UST USTE {0} DERBI ZAFERI",
		"NUNCA LE HAS GANADO": "ONLARI HIÇ YENEMEDIN",
		"NO LE GANAS DESDE HACE {0} AÑOS": "{0} YILDIR ONLARI YENEMEDIN",


		"G": "G",
		"E": "B",
		"P": "M",


		"LIGA": "LIG",
		"COPA": "KUPA",
		"CLASIF": "ELEME",
		"MUNDIAL": "DUNYA",

		"J{0}": "H{0}",
		"GRUPO {0}": "GRUP {0}",

		"LIGA {0}": "LIG {0}",



		"DIECISEISAVOS": "SON 32",
		"OCTAVOS": "SON 16",
		"CUARTOS": "ÇEYREK",
		"SEMIFINAL": "YARI FINAL",



		"rondaIDA": "ILK MAÇ",
		"rondaVUELTA": "ROVANŞ",
		"FINAL": "FINAL",
		"PRIMERA RONDA": "1. TUR",
		"SEGUNDA RONDA": "2. TUR",
		"TERCERA RONDA": "3. TUR",
		"CUARTA RONDA": "4. TUR",
		"QUINTA RONDA": "5. TUR",
		"SEXTA RONDA": "6. TUR",
		"SÉPTIMA RONDA": "7. TUR",
		"OCTAVA RONDA": "8. TUR",
		"TREINTAIDOSAVOS": "SON 64",
		"FASE DE GRUPOS": "GRUP AŞAMASI",
	},





















	"content": {
		"MEJOR DEL MUNDIAL": "DUNYA EN IYISI",
		"MEJOR DE LA COPA CONTINENTAL": "KITA KUPASI EN IYISI",
		"PREMIO CONTINENTAL": "KITA ODULU",
		"El mundo entero miraba. Y el mejor fuiste tú.": "Bütün dünya izliyordu. Ve en iyisi sendin.",
		"Tu continente tuvo un dueño este verano.": "Kıtan bu yaz bir sahibini buldu.",
		"Ser el Mejor del Mundial con tu selección.": "Milli takımınla Dünya Şampiyonası'nın en iyisi ol.",
		"PREMIO DEL MUNDO": "DUNYA ODULU",
		"CHICO DE ORO": "ALTIN GENÇ",
		"Premio del Mundo": "Dünya Ödülü",
		"Chico de Oro": "Altın Genç",
		"El Mejor del Planeta": "Gezegenin En İyisi",
		"Ganar el Chico de Oro, la promesa del año.": "Yılın gözde yeteneği Altın Genç ödülünü kazan.",
		"Ganar el Premio del Mundo.": "Dünya Ödülü'nü kazan.",
		"GOL DEL AÑO": "YILIN GOLU",
		"Gol del Año": "Yılın Golü",
		"GOL OLÍMPICO": "OLIMPIK GOL",
		"BAJO LA BARRERA": "BARAJ ALTI",
		"DESDE LEJOS": "UZAKTAN",
		"CON ROSCA": "KAVISLI",
		"CHILENA": "MAKAS",
		"VOLEA": "VOLE",
		"PANENKA": "PANENKA",
		"DE FALTA": "FRIKIK",
		"DE CABEZA": "KAFA",
		"Obra de Arte": "Başyapıt",
		"Ganar el Gol del Año.": "Yılın Golü ödülünü kazan.",
		"EL PASILLO": "GECIT",
		"Tu gol 100, 250 o 500 con el club: tus compañeros se abren en dos filas aplaudiendo y tú cruzas por el medio saludando.": "Kulüple 100., 250. veya 500. golün: takım arkadaşların iki sıra olup alkışlar, sen de ortadan selam vererek geçersin.",
		"EL MARCADOR SIGUE PUESTO": "SKORBORD HALA YANIYOR",
		"Tres horas después del pitido. Nadie ha venido a apagarlo.": "Son düdükten üç saat sonra. Kimse kapatmaya gelmedi.",
		"Tres horas después del pitido. En su casa nadie ha venido a apagarlo.": "Son düdükten üç saat sonra. Onların evinde kimse kapatmaya gelmedi.",
		"TE AGUANTAS LA MIRADA": "AYNAYA BAKABILIYORSUN",
		"NO TE AGUANTAS LA MIRADA": "AYNAYA BAKAMIYORSUN",
		"El de enfrente durmió bien. Es el mismo que juega el jueves.": "Karşıdaki iyi uyudu. Perşembe oynayacak olan da o.",
		"El de enfrente no durmió. Y es el que juega el jueves.": "Karşıdaki uyumadı. Ve perşembe oynayacak olan o.",
		"VEINTE MINUTOS DESPUÉS": "YIRMI DAKIKA SONRA",
		"el marcador": "skor",
		"minutos": "dakika",
		"El escudo que amaneció clavado en tu hueco lo pisó media plantilla al salir.": "Sabah dolabına çakılmış bulduğun armayı, çıkarken kadronun yarısı çiğnedi.",
		"Nadie descolgó la hoja del rival. Tu camiseta se quedó donde la tiraste.": "Kimse rakibin kâğıdını indirmedi. Forman attığın yerde kaldı.",










		"SE ABRE EL MERCADO": "TRANSFER BAŞLADI",
		"LOS QUE QUIERE": "ISTEDIKLERI",
		"LOS QUE SUELTA": "GONDERDIKLERI",
		"MERCADO DE VERANO": "YAZ TRANSFERI",
		"El club no busca a nadie": "Kulüp kimseyi aramıyor",
		"El club no suelta a nadie": "Kulüp kimseyi bırakmıyor",
		"PARA CEDER": "KIRALIK",
		"INTOCABLES": "DOKUNULMAZ",
		"Nadie en venta": "Satılık kimse yok",
		"Nadie para ceder": "Kiralanacak kimse yok",
		"Nadie es intocable": "Kimse dokunulmaz değil",
		"TU MEDIA": "GENELIN",
		"TU VALOR": "DEGERIN",
		"ENTRAN": "GELEN",
		"SALEN": "GIDEN",
		"CEDIDO": "KIRALIK",
		"LIBRE": "BOŞTA",
		"Nadie ha visto todavía lo que haces": "Ne yapabildiğini henüz kimse görmedi",
		"La temporada que hiciste te pone por encima": "Geçirdiğin sezon seni diğerlerinin üstüne çıkarıyor",
		"Llevas años aquí y eso pesa": "Yıllardır buradasın, bu da önemli",
		"El once no se entiende sin ti": "İlk 11 sensiz düşünülemez",
		"La temporada que hiciste no te defiende": "Geçirdiğin sezon seni savunmuyor",
		"Casi no juegas, y eso se nota en la lista": "Neredeyse hiç oynamıyorsun ve listede bu belli oluyor",
		"El club se hundió y hay que hacer caja": "Kulüp battı ve para bulması gerekiyor",
		"El club salvó el año y no necesita vender": "Kulüp sezonu kurtardı, satmaya ihtiyacı yok",
		"Lo que vales hoy es dinero que el club mira": "Bugünkü değerin, kulübün göz diktiği bir para",


		"Un año. Lo que le regales dice si la conociste.":
			"Bir yıl. Ona ne hediye ettiğin, onu tanıyıp tanımadığını gösterir.",
		"{0} años. Lo que le regales dice si la conociste.":
			"{0} yıl. Ona ne hediye ettiğin, onu tanıyıp tanımadığını gösterir.",
		"Poso de los años: {0}%":
			"Yılların birikimi: %{0}",
		"Se te pasó la fecha. Ella no dijo nada.":
			"Tarihi kaçırdın. O hiçbir şey demedi.",
		"Se quedó callada un momento. Era exactamente eso.":
			"Bir an sessiz kaldı. Tam olarak buydu.",
		"Poso de los años: {0}% — las malas rachas pesan menos.":
			"Yılların birikimi: %{0} — kötü dönemler artık daha az ağır basıyor.",
		"Dio las gracias y lo dejó en la mesa del recibidor.":
			"Teşekkür etti ve antredeki masaya bıraktı.",
		"Un año más, y sigues sin saber quién es.":
			"Bir yıl daha geçti ve hâlâ onun kim olduğunu bilmiyorsun.",
		"Un fin de semana los dos solos, sin teléfono":
			"İkinize özel, telefonsuz bir hafta sonu",
		"Una fiesta con toda la gente que quiere":
			"Sevdiği herkesle bir parti",
		"Poner su nombre en algo tuyo: el coche, la casa, la cuenta": "Senin bir şeyine onun adını koymak: araba, ev, hesap",
		"Algo que compraste con prisa y sin pensar":
			"Aceleyle, düşünmeden aldığın bir şey",
		"Un billete abierto para que se vaya donde quiera":
			"İstediği yere gitsin diye açık bir bilet",
		"Repetir exactamente la primera cena, mesa incluida":
			"İlk akşam yemeğini aynen tekrarlamak, aynı masa dahil",
		"UN AÑO MÁS":
			"BIR YIL DAHA",
		"Hoy hace justo un año de aquello, y {0} no lo ha mencionado"
		+ " ni una vez en toda la semana. Eso no significa que se le"
		+ " haya olvidado.":
			"Bugün tam bir yıl oldu ve {0} bütün hafta bundan bir kez bile bahsetmedi. Bu, unuttuğu anlamına gelmiyor.",
		"PREPARARLE ALGO":
			"BIR ŞEY HAZIRLA",
		"DEJARLO PASAR":
			"GEÇIŞTIR",



		"Le queda una noche. Aciertos: {0} de {1}":
			"Bir gecesi kaldı. Doğru tahmin: {0} / {1}",
		"Lo que digas ahora depende de quién es ella.":
			"Şimdi ne diyeceğin, onun kim olduğuna bağlı.",
		"Deshizo una maleta. Sólo una, y sin decir nada.":
			"Bir bavulu boşalttı. Sadece birini, hiçbir şey demeden.",
		"Se queda. No es lo de antes, pero se queda.":
			"Kalıyor. Eskisi gibi değil, ama kalıyor.",
		"Cerró la puerta despacio, que es peor que un portazo.":
			"Kapıyı yavaşça kapattı; bu, çarpmaktan daha kötü.",
		"Se acabó.":
			"Bitti.",


		"EL CUARTO DE INVITADOS":
			"MISAFIR ODASI",
		"Llevas tres noches durmiendo solo. {0} dice que es por la espalda, y en la"
		+ " cama de al lado hay una almohada que no estaba.":
			"Üç gecedir yalnız uyuyorsun. {0} sırtı yüzünden olduğunu söylüyor, ve yandaki yatakta önceden olmayan bir yastık var.",
		"PREGUNTARLE QUÉ PASA":
			"NE OLDUGUNU SOR",
		"SERÁ LA ESPALDA":
			"SIRTINDANDIR",
		"NO PREGUNTÓ POR EL PARTIDO":
			"MAÇI SORMADI",
		"Entras, dejas la bolsa, y {0} sigue con lo suyo. Antes preguntaba antes de que"
		+ " te quitaras el abrigo. Hoy no, y ayer tampoco.":
			"İçeri giriyorsun, çantayı bırakıyorsun, ve {0} kendi işine devam ediyor. Eskiden sen montunu çıkarmadan sorardı. Bugün sormadı, dün de.",
		"APAGAR EL TELÉFONO Y SENTARTE":
			"TELEFONU KAPAT, OTUR",
		"SUBIR A DUCHARTE":
			"DUŞA GIR",
		"LA MALETA PEQUEÑA":
			"KUÇUK BAVUL",
		"La maleta de mano lleva dos semanas junto a la puerta, hecha. {0} no la ha"
		+ " deshecho ni una vez, y tampoco se ha ido.":
			"Kabin bavulu iki haftadır kapının yanında, hazır. {0} onu bir kez bile boşaltmadı, ama gitmedi de.",
		"PEDIR PERMISO Y LLEVÁRTELA":
			"IZIN AL VE ONU GOTUR",
		"NO ABRIR ESE TEMA":
			"O KONUYU AÇMA",
		"PASAR LA TARDE JUNTOS":
			"BIRLIKTE VAKIT GEÇIR",
		"Sin teléfono y sin prisa. Se nota más de lo que parece.":
			"Telefonsuz, acelesiz. Göründüğünden daha çok şey ifade eder.",
		"En casa se descansa: +{0} de energía cada jornada.":
			"Evde iyi dinlenirsin: her maç haftası +{0} enerji.",
		"Así no se duerme: {0} de energía cada jornada.":
			"Böyle uyunmaz: her maç haftası {0} enerji.",
		"DEJARLA":
			"AYRIL",
		"PEDIR EL DIVORCIO":
			"BOŞANMA DAVASI AÇ",
		"¿DIVORCIARTE DE {0}?":
			"{0} ILE BOŞANMAK?",
		"¿DEJAR A {0}?":
			"{0} ILE BITIR?",
		"El reparto se paga igual que si lo pidiera ella: ${0}.":
			"Paylaşım, onun istemiş olması gibi aynı tutar: ${0}.",
		"La separación de bienes que firmasteis sigue valiendo. Es todo lo que te"
		+ " protege.":
			"İmzaladığınız mal ayrılığı sözleşmesi hâlâ geçerli. Seni koruyan tek şey o.",
		"No firmasteis nada, así que entra todo: el dinero y lo que tienes puesto.":
			"Hiçbir şey imzalamadınız, yani her şey masada: para ve sahip olduğun her şey.",
		"No cuesta nada. Ni dinero ni prensa.":
			"Hiçbir şeye mal olmaz. Ne para, ne manşet.",
		"Y no te va a presentar nadie a nadie en una buena temporada. Estas cosas se"
		+ " cuentan.":
			"Ve uzun bir süre kimse seni kimseyle tanıştırmayacak. Bu tür şeyler duyulur.",
		"SÍ, SE ACABÓ":
			"EVET, BITTI",
		"SE LLEVA ${0}":
			"${0} ALIYOR",
		"«Me quedo. Los viajes que pueda perdonar, los pierdo.»":
			"«Kalıyorum. Kaçırabileceğim her yolculuğu kaçıracağım.»",
		"«No te voy a pedir que esperes. Te pido que elijas tú.»":
			"«Senden beklemeni istemeyeceğim. Senden seçmeni istiyorum.»",
		"«Esto se arregla con tiempo. Dame la temporada.»":
			"«Bu zamanla düzelir. Bana bu sezonu ver.»",
		"«Dime qué necesitas y lo hago mañana.»":
			"«Neye ihtiyacın olduğunu söyle, yarın yapayım.»",
		"«No hace falta que digas nada. Me siento y te escucho.»":
			"«Bir şey söylemene gerek yok. Oturur, seni dinlerim.»",
		"«Piensa en todo lo que hemos hecho.»":
			"«Birlikte yaptığımız her şeyi düşün.»",
		"«Si te vas lo entiendo. Pero prefiero que te quedes.»":
			"«Gidersen anlarım. Ama kalmanı tercih ederim.»",
		"«Mañana no hay entrenamiento. Vámonos donde quieras.»":
			"«Yarın antrenman yok. İstediğin yere gidelim.»",
		"«Ya está, ¿no? Pues ya está.»":
			"«Bu kadar mı? Peki, bu kadar.»",
		"Se sienta en el brazo del sofá, sin quitarse el abrigo.":
			"Montunu çıkarmadan kanepenin koluna oturuyor.",
		"No ha dicho que no. Sigue ahí.":
			"Hayır demedi. Hâlâ orada.",
		"Mira las maletas y luego te mira a ti.":
			"Bavullara bakıyor, sonra sana.",
		"Las maletas de {0} llevan dos días en el recibidor y esta"
		+ " vez no las está deshaciendo. Queda una conversación, y es"
		+ " esta noche.":
			"Bavullar iki gündür antrede; {0} bu kez onları boşaltmıyor. Geriye tek bir konuşma kaldı, o da bu gece.",
		"HABLAR CON ELLA":
			"ONUNLA KONUŞ",
		"DEJAR QUE SE VAYA":
			"BIRAK GITSIN",


		"TU EX HABLA":
			"ESKIN KONUŞTU",
		"Una revista le ha pagado a {1} por contar cómo eras"
		+ " entonces. No miente en nada, y eso es lo peor. {0} lo ha"
		+ " leído entero.":
			"Bir dergi, o zamanlar nasıl biri olduğunu anlatması için {1} adlı kişiye para ödedi. Hiçbir konuda yalan söylemiyor, en kötüsü de bu. {0} hepsini okudu.",
		"NO CONTESTAR":
			"CEVAP VERME",
		"DESMENTIRLO EN PÚBLICO":
			"AÇIKÇA YALANLA",
		"ESTABA EN LA MISMA MESA":
			"YAN MASADAYDI",
		"Cena de gala, y en la mesa de al lado está {1}. {0} la ha"
		+ " reconocido antes de sentarse y no ha soltado tu mano en toda"
		+ " la noche.":
			"Gala yemeği, ve yan masada {1} var. {0} oturmadan önce onu tanıdı ve bütün gece elini bırakmadı.",
		"SALUDARLA Y VOLVER":
			"SELAM VER, GERI DON",
		"HACER COMO QUE NO":
			"GORMEMIŞ GIBI YAP",




		"LA CENA DEL VESTUARIO":
			"TAKIM YEMEGI",
		"El grupo sale a cenar y alguien lo deja caer con una"
		+ " sonrisa: «esta vez, solos». {0} ya se estaba arreglando.":
			"Takım yemeğe çıkıyor ve biri gülümseyerek lafı geçiriyor: «bu sefer sadece biz». {0} çoktan hazırlanıyordu.",
		"LLEVARLA IGUAL":
			"YINE DE GOTUR",
		"LA ENTRADA DEL PALCO":
			"LOCA KOLTUGU",
		"El club te ofrece una butaca de palco para {0}. Desde ahí se"
		+ " ve el partido; desde la grada de siempre se ve a la gente.":
			"Kulüp, {0} için bir loca koltuğu teklif ediyor. Oradan maç görünür; her zamanki tribünden insanlar görünür.",
		"AL PALCO":
			"LOCAYA",
		"CON LA GRADA":
			"TRIBUNLE",
		"LA QUIEREN EN LA CAMPAÑA":
			"KAMPANYADA ONU ISTIYORLAR",
		"La marca ha visto una foto vuestra y quiere a {0} en el"
		+ " anuncio. Pagan por los dos y no aceptan un no fácil.":
			"Marka ikinizin bir fotoğrafını görmüş ve reklamda {0} olsun istiyor. İkinize de ödüyorlar ve kolay kolay hayır kabul etmiyorlar.",
		"QUE SALGA ELLA":
			"O DA OYNASIN",
		"ELLA NO SE VENDE":
			"O SATILIK DEGIL",
		"LA CENA DE TU AGENTE":
			"MENAJERININ YEMEGI",
		"Tu agente ha montado una cena con gente que decide cosas. Es"
		+ " esta noche, y esta noche ya la teníais ocupada.":
			"Menajerin karar veren insanlarla bir yemek ayarlamış. Bu akşam, ama bu akşam zaten planınız vardı.",
		"IR A LA CENA":
			"YEMEGE GIT",
		"LO QUE TENÍAIS":
			"PLANINIZA SADIK KAL",
		"EL VÍDEO DEL MÍSTER":
			"HOCANIN VIDEOSU",
		"El técnico ha mandado dos horas de vídeo para esta noche."
		+ " {0} lleva toda la semana esperando esta noche.":
			"Teknik direktör bu akşam için iki saatlik video göndermiş. {0} bütün hafta bu akşamı bekliyordu.",
		"VERLO ENTERO":
			"HEPSINI IZLE",
		"MAÑANA LO VES":
			"YARINA KALSIN",
		"OS QUIEREN A LOS DOS":
			"IKINIZ DE DAVETLI",
		"Un programa quiere una entrevista de pareja. Sería la"
		+ " primera vez que {0} habla delante de una cámara.":
			"Bir program çift röportajı istiyor. {0} ilk kez bir kameranın önünde konuşacak.",
		"IR JUNTOS":
			"BERABER GIT",
		"IR TÚ SOLO":
			"TEK BAŞINA GIT",
		"EL PLAN DE NO HACER NADA":
			"HIÇBIR ŞEY YAPMAMA PLANI",
		"Hay tres sitios donde deberías dejarte ver este fin de"
		+ " semana. {0} ha comprado comida para dos y no piensa moverse"
		+ " de casa.":
			"Bu hafta sonu görünmen gereken üç yer var. {0} iki kişilik yemek almış ve evden çıkmaya hiç niyeti yok.",
		"QUEDARTE CON ELLA":
			"ONUNLA EVDE KAL",
		"DEJARTE VER":
			"BOY GOSTER",
		"ELLA CREE QUE VALES MÁS":
			"ONA GORE DAHA DEGERLISIN",
		"{0} ha leído lo que cobra el que juega en tu puesto en otro"
		+ " sitio. «Pide lo tuyo o pídelo yo por ti.»":
			"{0} senin mevkindeki oyuncunun başka yerde ne kazandığını okumuş. «Hakkını iste, yoksa senin yerine ben isterim.»",
		"PEDIR MÁS AL CLUB":
			"KULUPTEN ZAM ISTE",
		"ESTOY BIEN AQUÍ":
			"BURADA MUTLUYUM",
		"LA FOTO DEL PATROCINIO":
			"SPONSOR FOTOGRAFI",
		"En la foto de la marca sales con una modelo a medio metro."
		+ " {0} la ha visto antes que tú y no ha dicho nada, que es"
		+ " peor.":
			"Markanın fotoğrafında yarım metre yanında bir modelle çıkıyorsun. {0} fotoğrafı senden önce görmüş ve hiçbir şey dememiş; bu daha kötü.",
		"HABLARLO ESA NOCHE":
			"O GECE KONUŞUN",
		"ES TRABAJO, SE LE PASA":
			"IŞ ICABI, GEÇER",
		"SE FUE SIN AVISAR":
			"HABER VERMEDEN GITTI",
		"{0} se ha ido diez días con sus amigas y te has enterado por"
		+ " una foto. No es una prueba: es que no se le ocurrió que"
		+ " hubiera que pedir permiso.":
			"{0} kız arkadaşlarıyla on günlüğüne gitmiş ve sen bunu bir fotoğraftan öğrenmişsin. Bu bir sınav değil: izin istemek gerektiği aklına bile gelmemiş.",
		"DESEARLE BUEN VIAJE":
			"IYI YOLCULUKLAR DILE",
		"PEDIRLE EXPLICACIONES":
			"AÇIKLAMA ISTE",
		"ELLA YA ERA DE AQUÍ":
			"O ZATEN BIZDENDI",
		"{0} tiene su sitio en la grada desde antes de conocerte y no"
		+ " piensa cambiarlo por un palco. Hoy le toca cantar contigo"
		+ " abajo.":
			"{0} seni tanımadan önce de tribünde yeri olan biri ve orayı bir locayla değiştirmeye niyeti yok. Bugün aşağıdan senin için tezahürat yapacak.",
		"SALUDARLA AL GOL":
			"GOLU ONA ARMAGAN ET",
		"ESO NO SE HACE":
			"BU YAPILMAZ",
		"LA CAZARON EN LA PUERTA":
			"KAPIDA YAKALANDI",
		"Alguien vendió una foto de {0} saliendo de tu casa. No sale"
		+ " mal; sale sin querer salir, que para ella es lo mismo.":
			"Biri, sevgilin {0} senin evinden çıkarken çekilmiş bir fotoğrafı satmış. Fotoğrafta kötü görünmüyor; çekilmek istemediği belli, ki onun için ikisi aynı şey.",
		"PARAR ESO COMO SEA":
			"NE YAP ET, DURDUR",
		"SE OLVIDA EN DOS DÍAS":
			"IKI GUNDE UNUTULUR",
		"LA SEMANA MALA":
			"KOTU HAFTA",
		"Otra derrota, y en casa no se habla de otra"
		+ " cosa. {0} no te pregunta: te pone las botas en la puerta y"
		+ " se calla.":
			"Bir mağlubiyet daha ve evde başka bir şey konuşulmuyor. {0} soru sormuyor: kramponlarını kapının önüne koyuyor ve susuyor.",
		"SALIR A CORRER CON ELLA":
			"ONUNLA KOŞUYA ÇIK",

		"TU AGENTE · «llámame, es importante»":
			"MENAJERIN · «beni ara, önemli»",
		"EL MÍSTER · vídeo del rival, para hoy":
			"HOCA · rakip videosu, bu akşama",
		"TU MARCA · quieren una foto mañana":
			"SPONSORUN · yarın fotoğraf istiyorlar",




		"Le gusta la vida tranquila. No pide focos, pide que estés.":
			"Sakin hayatı sever. Spot ışığı istemez, yanında olmanı ister.",
		"Vive de noche. Contigo o sin ti, y eso es justo el problema.":
			"Gece yaşar. Seninle ya da sensiz, sorun da tam bu.",
		"Tiene lo suyo y va en serio. Te quiere arriba, y lo dice.":
			"Kendi işi var ve ciddi. Seni zirvede görmek istiyor ve bunu söylüyor.",
		"Te quiere entero. Cada foto con otra le cuesta una noche.":
			"Seni bütünüyle istiyor. Başkasıyla her fotoğrafın ona bir geceye mal oluyor.",
		"No te necesita, te eligió. Aguanta todo menos que la des por"
		+ " hecha.":
			"Sana ihtiyacı yok, seni seçti. Her şeye katlanır, hafife alınmaya katlanmaz.",
		"Iba al estadio antes de conocerte. Los domingos son"
		+ " sagrados.":
			"Seni tanımadan önce de stadyuma giderdi. Pazarlar kutsaldır.",
		"Odia la prensa. Contigo en privado lo da todo; en público,"
		+ " nada.":
			"Basından nefret eder. Baş başayken sana her şeyi verir; herkesin önünde, hiçbir şey.",
		"Entiende el oficio: entrena, viaja, aguanta. Y espera lo"
		+ " mismo.":
			"Bu işi anlar: antrenman, deplasman, sabır. Ve aynısını bekler.",

		"Trabaja en algo que nunca termina de explicar. Invita ella, y no deja discutirlo.":
			"Bir türlü tam anlatamadığı bir işte çalışıyor. Hesabı o öder ve tartışmaya izin vermez.",
		"LA CUENTA YA ESTABA PAGADA":
			"HESAP ÇOKTAN ODENMIŞTI",
		"{0} ha pagado la cena, el hotel y un coche nuevo para tu madre, y no entiende qué te molesta. «Tengo más de lo que me voy a gastar nunca. Déjame.»":
			"{0} yemeği, oteli ve annene yeni bir arabayı ödemiş ve seni neyin rahatsız ettiğini anlamıyor. «Hayatım boyunca harcayabileceğimden fazlası var. Bırak.»",
		"DEJAR QUE PAGUE":
			"BIRAK O ODESIN",
		"LA PRÓXIMA PAGO YO":
			"SONRAKI BENDEN",
		"REGALO DE ELLA":
			"ONUN HEDIYESI",
		"FESTEJOS":
			"KUTLAMALAR",
		"FALTAN {0}": "EKSIK {0}",
		"COMPLETA":
			"TAMAM",
		"continenteEUROPA": "AVRUPA",
		"continenteSUDAMÉRICA": "GUNEY AMERIKA",
		"continenteNORTEAMÉRICA": "KUZEY AMERIKA",
		"continenteÁFRICA": "AFRIKA",
		"continenteASIA": "ASYA",
		"continenteOCEANÍA": "OKYANUSYA",
		"RIVALES":
			"RAKIP",
		"VENCIDO":
			"YENILDI",
		"Cada rival al que le ganes un partido queda apuntado aquí para siempre, en todas tus carreras.":
			"Bir maçta yendiğin her rakip, bütün kariyerlerinde sonsuza dek burada kayıtlı kalır.",
		"PAREJAS":
			"SEVGILI",
		"Las mujeres de tu vida. Cada una destapa su medalla el día que se muda contigo, te casas con ella o se acaba.":
			"Hayatındaki kadınlar. Her biri, seninle aynı eve taşındığı, onunla evlendiğin ya da ilişkinin bittiği gün madalyasını açar.",
		"Pareja por descubrir. Sabrás quién es el día que se mude contigo.":
			"Keşfedilecek sevgili. Kim olduğunu seninle aynı eve taşındığı gün öğreneceksin.",
		"La última: {0}":
			"Sonuncusu: {0}",
		"LA CENA DEL CLUB":
			"KULUP YEMEGI",
		"EL BAR":
			"BAR",
		"LA GALERÍA":
			"GALERI",
		"LA PUERTA DEL ESTADIO":
			"STADYUM KAPISI",
		"DÓNDE LA CONOCES":
			"NEREDE TANIŞIRSIN",
		"GASTO EN CASA":
			"EV MASRAFI",
		"DESCANSO EN CASA":
			"EVDE DINLENME",
		"SE ENFADA":
			"KIZAR",
		"SE CONTENTA":
			"SEVINIR",
		"PIDE DINERO":
			"PARA ISTER",
		"EL {0} DEL SUELDO":
			"MAAŞININ {0}",
		"NUNCA":
			"ASLA",
		"PIDE EL DIVORCIO":
			"BOŞANMAK ISTER",
		"PUEDE HACERLO":
			"YAPABILIR",
		"TU CASA O TU SUELDO":
			"EVIN YA DA MAAŞIN",
		"EL {0} DE LO TUYO":
			"VARLIGININ {0}",
		"SE LLEVA AL IRSE":
			"GIDERKEN ALIR",
		"TE REGALA":
			"HEDIYESI",
		"HASTA EL {0} DEL SUELDO":
			"MAAŞININ {0} KADARI",
		"SE MUDA CONTIGO":
			"YANINA TAŞINIR",
		"PRONTO":
			"ERKEN",
		"SIN PRISA":
			"ACELESIZ",
		"BAJA SOLA DESDE":
			"DUŞMEYE BAŞLAR",
		"{0} · RÁPIDO":
			"{0} · HIZLI",
		"{0} · DESPACIO":
			"{0} · YAVAŞ",
		"{0} · APENAS":
			"{0} · AZICIK",
		"VIVIR CON ELLA":
			"ONUNLA YAŞAM",
		"INVITA ELLA":
			"HESAP ONDAN",
		"· invita ella":
			"· hesap ondan",
		"La boda la paga ella: ${0}.":
			"Düğünü o ödüyor: ${0}.",
		"Boda pagada por ella: ${0}.":
			"Düğün masrafını o ödedi: ${0}.",
		"LA TASACIÓN":
			"EKSPERTIZ",
		"Ha venido un señor con una carpeta a medir el salón y a fotografiar la vitrina. {0} dice que es por el seguro. Nadie ha cambiado el seguro.":
			"Elinde dosyayla bir adam gelip salonu ölçtü ve vitrinin fotoğrafını çekti. {0} sigorta için olduğunu söylüyor. Kimse sigortayı değiştirmedi.",
		"SUBIRLE LA ASIGNACIÓN":
			"HARÇLIGINI ARTIR",
		"NO LE DOY MÁS":
			"TEK KURUŞ YOK",
		"CUANDO LE CONVENGA":
			"IŞINE GELINCE",
		"TE CUESTA MÁS":
			"DAHA PAHALI",
		"TE SUMA MÁS":
			"DAHA ÇOK KATAR",
		"TE CUESTA MENOS":
			"DAHA UCUZ",
		"TE SUMA MENOS":
			"DAHA AZ KATAR",

		"LAS ESCRITURAS":
			"TAPU",
		"Tu agente trae las escrituras de la casa y una sola pregunta: a nombre de quién. {0} ya ha preguntado dos veces si hay que firmar algo.":
			"Menajerin evin tapusunu ve tek bir soruyu getiriyor: kimin adına. {0} imzalanacak bir şey olup olmadığını iki kez sordu bile.",
		"QUE DECIDA ELLA":
			"O KARAR VERSIN",
		"Tu agente pone las escrituras sobre la mesa y pregunta sin mirarte: «¿a nombre de quién?».":
			"Menajerin tapuyu masaya koyuyor ve sana bakmadan soruyor: «kimin adına?».",
		"MANTÉN · A NOMBRE DE MI MADRE":
			"TUT · ANNEMIN ADINA",
		"MANTÉN · A SU NOMBRE":
			"TUT · ONUN ADINA",
		"Tu madre firmó sin gafas y sin preguntar. Al salir te dijo: «Yo no entiendo de papeles, hijo. Pero de esa casa no me saca nadie».":
			"Annen gözlüksüz ve soru sormadan imzaladı. Çıkarken sana şöyle dedi: «Ben kâğıttan anlamam, oğlum. Ama o evden beni kimse çıkaramaz».",
		"Ella se enteró esa noche y pidió más asignación: el {0} de tu sueldo.":
			"O gece öğrendi ve daha fazla harçlık istedi: maaşının {0} kadarı.",
		"Leyó su nombre dos veces y sonrió. Esa noche no habló de la asignación.":
			"Adını iki kez okudu ve gülümsedi. O gece harçlıktan hiç bahsetmedi.",
		"Su abogado pidió la casa. Las escrituras dicen otra cosa.":
			"Avukatı evi istedi. Tapu başka bir şey söylüyor.",
		"La casa está a nombre de tu madre.":
			"Ev annenin adına.",
		"FIRMAR Y QUE SE VAYA":
			"IMZALA VE GITSIN",
		"Su abogado trae las escrituras con su nombre. El tuyo consigue cambiarlas por la mitad de tu cuenta.":
			"Avukatı onun adına olan tapuyu getiriyor. Senin avukatın, hesabının yarısı karşılığında tapuyu değiştirmeyi başarıyor.",
		"La casa y tu ficha se quedan.":
			"Ev ve maaşın sende kalıyor.",
		"LA MITAD DE TU DINERO · ${0}":
			"PARANIN YARISI · ${0}",
		"Se fue con dos maletas, las mismas con las que llegó.":
			"Geldiği iki bavulla gitti.",
		"La casa sigue a nombre de tu madre.":
			"Ev hâlâ annenin adına.",
		"Firmaste. La casa vuelve a ser tuya; la cuenta, la mitad.":
			"İmzaladın. Ev yine senin; hesabın ise yarı yarıya.",
		"DEPENDE DE LAS ESCRITURAS":
			"TAPUYA BAGLI",
		"Todo a Nombre de Mamá":
			"Her Şey Annemin Adına",
		"Que su abogado pidiera la casa y las escrituras dijeran otra cosa.":
			"Avukatı evi istesin ve tapu başka bir şey söylesin.",
		"Lo pediste tú, y las escrituras están a nombre de tu madre: no hay nada que repartir.":
			"Sen istedin ve tapu annenin adına: paylaşılacak bir şey yok.",
		"Su abogado trae las escrituras con su nombre, pero tu cuenta está a cero: no hay mitad que llevarse.":
			"Avukatı onun adına olan tapuyu getiriyor ama hesabın sıfırda: alınacak yarı yok.",
		"Las escrituras están a nombre de tu madre: no se lleva nada.":
			"Tapu annenin adına: hiçbir şey alamıyor.",
		"Las escrituras están a su nombre: se lleva la mitad de tu dinero, ${0}.":
			"Tapu onun adına: paranın yarısını, ${0}, alıp gidiyor.",
		"La casera":
			"Evcimen",
		"La fiestera":
			"Parti kızı",
		"La ambiciosa":
			"Hırslı",
		"La celosa":
			"Kıskanç",
		"La independiente":
			"Bağımsız",
		"La hincha":
			"Taraftar",
		"La reservada":
			"Ketum",
		"La cazafortunas":
			"Para avcısı",
		"La compañera":
			"Yol arkadaşı",
		"La millonaria":
			"Milyoner",
		"Quiere tu tiempo, no tu dinero. En casa se duerme.":
			"Paranı değil, zamanını istiyor. Evde uyunur.",
		"Vive de noche, contigo o sin ti. Te cuesta sueño y dinero.":
			"Gece yaşar, seninle ya da sensiz. Sana uykuya ve paraya mal olur.",
		"Te quiere arriba, y te pasa la factura por subir.":
			"Seni zirvede istiyor ve tırmanışın faturasını sana kesiyor.",
		"Te quiere entero, y cada foto tuya con otra le cuesta una noche.":
			"Seni bütünüyle istiyor; başka bir kadınla çekilen her fotoğrafın ona bir geceye mal oluyor.",
		"No te necesita: te eligió. Nunca acepta tu dinero.":
			"Sana ihtiyacı yok: seni seçti. Paranı asla kabul etmez.",
		"Iba al estadio antes que tú. Los domingos son sagrados.":
			"Stadyuma senden önce de giderdi. Pazarlar kutsaldır.",
		"Odia la prensa. En privado lo da todo.":
			"Basından nefret eder. Baş başayken her şeyi verir.",
		"No te quiere. Cuando le salgan las cuentas, se va con lo tuyo; con papel, tarda más y se lleva menos.":
			"Seni sevmiyor. Hesabı tuttuğunda seninkilerle çekip gider; evlilik sözleşmesi varsa daha geç gider ve daha az alır.",
		"Entiende el oficio. Entrena, viaja y aguanta contigo.":
			"Bu işi anlar. Seninle antrenman yapar, yolculuk eder ve katlanır.",
		"Tiene más que tú y no te lo dice. Te regala dinero cada jornada y paga la boda.":
			"Senden zengin ve bunu söylemiyor. Her hafta sana para hediye eder ve düğünü öder.",



		"Tu agente lo dice sin mirarte: «firma la separación de"
		+ " bienes».":
			"Menajerin sana bakmadan söylüyor: «mal ayrılığı sözleşmesini imzala».",
		"La boda cuesta ${0}.":
			"Düğünün masrafı ${0}.",
		"FIRMAR EL PRENUPCIAL":
			"SOZLEŞMEYI IMZALA",
		"CASARSE SIN PAPELES":
			"SOZLEŞMESIZ EVLEN",
		"Firmó sin leerlo y no volvió a mencionarlo en toda la noche.":
			"Okumadan imzaladı ve bütün gece bir daha lafını etmedi.",
		"Rompiste el papel delante de ella. Ese gesto lo va a"
		+ " recordar.":
			"Kâğıdı onun önünde yırttın. Bu hareketi hiç unutmayacak.",
		"Boda pagada: ${0}.":
			"Düğün ödendi: ${0}.",
		"Piden ${0}: ${1} de tu dinero y ${2} de lo que tienes"
		+ " puesto.":
			"${0} istiyorlar: ${1} nakit ve ${2} değerinde eşya.",
		"Con separación de bienes firmada":
			"Mal ayrılığı sözleşmesi imzalı",
		"Sin separación de bienes: entra todo":
			"Mal ayrılığı yok: her şey masada",
		"FIRMAR Y ACABAR":
			"IMZALA VE BITIR",
		"PELEAR LA CIFRA":
			"RAKAMA ITIRAZ ET",
		"IR A JUICIO":
			"DAVA AÇ",
		"Su abogado tarda dos días en contestar. Baja un poco, y"
		+ " poco.":
			"Avukatı iki günde cevap veriyor. Biraz iniyor, ama çok az.",
		"El juez no le dio todo lo que pedía. Te llevas ${0} menos.":
			"Hâkim ona istediği her şeyi vermedi. Cebinde ${0} fazla kalıyor.",
		"El juez no le dio lo que pedía. Tampoco había mucho que repartir.": "Hâkim ona istediğini vermedi. Zaten paylaşılacak pek bir şey yoktu.",
		"Salió peor que el acuerdo. Los abogados también se cobran.":
			"Anlaşmadan kötü çıktı. Avukatlar da paylarını alıyor.",
		"Firmaste sin leerlo entero. Se acabó.":
			"Tamamını okumadan imzaladın. Bitti.",
		"Se lleva ${0}. Te quedan ${1}.":
			"${0} alıyor. Sana ${1} kalıyor.",

		"Reservaste sin decirle por qué, y {0} bajó vestida para algo que no sabe qué"
		+ " es. El anillo lleva un mes pagado y lo llevas encima.":
			"Masayı nedenini söylemeden ayırttın ve {0} adını koyamadığı bir şey için giyinip aşağı indi. Yüzüğün parası bir aydır ödenmiş ve cebinde.",
		"PEDÍRSELO ESTA NOCHE":
			"BU GECE SOR",
		"LO QUE FIRMÁIS":
			"IMZALADIGINIZ",
		"Tu agente lleva tres días pidiendo veinte minutos. Trae una carpeta y no la ha"
		+ " abierto delante de nadie.":
			"Menajerin üç gündür yirmi dakika istiyor. Elinde bir dosya var ve kimsenin önünde açmadı.",
		"ESCUCHARLE":
			"ONU DINLE",
		"NO HAY NADA QUE FIRMAR":
			"IMZALANACAK BIR ŞEY YOK",

		"UN FAVOR PARA SU HERMANO":
			"KARDEŞINE BIR IYILIK",
		"El hermano de {0} tiene un negocio que va a salir seguro y le falta el"
		+ " arranque. Ella no lo pide para ella, y eso es justo lo que hace difícil decir"
		+ " que no.":
			"{0} kardeşi için bir iyilik istiyor: kesin tutacak bir işi var, sadece başlangıç parası eksik. Kendisi için istemiyor ve hayır demeyi zorlaştıran da tam bu.",
		"ADELANTARLE EL DINERO":
			"PARAYI SEN VER",
		"QUE LO PIDA AL BANCO":
			"BANKAYA GITSIN",
		"Tranquila, cariñosa y sin dramas. Nunca te pide explicaciones.":
			"Sakin, sevecen ve dramsız. Senden asla hesap sormaz.",
		"Su abogado no negocia. Pone dos papeles sobre la mesa y te dice que firmes"
		+ " uno.":
			"Avukatı pazarlık etmiyor. Masaya iki kâğıt koyuyor ve birini imzalamanı söylüyor.",
		"No hay tercera opción, y él lo sabe desde el día que os conocisteis.":
			"Üçüncü seçenek yok ve o bunu, onunla tanıştığın günden beri biliyor.",
		"No hay tercera opción.":
			"Üçüncü seçenek yok.",
		"Se fue con una maleta y dejó el resto. Su abogado llamará el lunes.": "Tek bir bavulla gitti, gerisini bıraktı. Avukatı pazartesi arayacak.",
		"Todavía estáis casados. Eso se firma, no se dice.": "Hâlâ evlisiniz. Bu imzayla biter, sözle değil.",
		"La separación de bienes que firmasteis recorta las dos.": "İmzaladığınız mal ayrılığı sözleşmesi ikisini de azaltıyor.",
		"PAGAR Y QUEDÁRTELA · ${0}": "ODE VE EVI TUT · ${0}",
		"Pagaste por tu propia casa. El papel valió justo eso.": "Kendi evin için ödedin. Kâğıdın değeri tam olarak buydu.",
		"${0}, y las llaves siguen siendo tuyas.": "${0} ve anahtarlar hâlâ sende.",
		"Firmaste el otro. Cinco años pagando lo que ya no está en tu cuenta.": "Diğerini imzaladın. Beş yıl boyunca artık hesabında olmayan bir şeyi ödeyeceksin.",
		"Con ella no hay reparto que negociar: su abogado te hará elegir entre la casa y cinco temporadas de tu ficha.": "Onunla pazarlık edilecek bir paylaşım yok: avukatı seni ev ile beş sezonluk maaşın arasında seçim yapmaya zorlayacak.",
		"Eliges tú, y se elige esta semana.": "Sen seçiyorsun ve bu hafta seçiyorsun.",
		"SU ABOGADO YA LLAMÓ": "AVUKATI ARADI",
		"LA CASA · ${0}":
			"EV · ${0}",
				"{0} DE TU FICHA · ${1} POR PARTIDO · {2} TEMPORADAS":
			"MAAŞININ {0} · MAÇ BAŞI ${1} · {2} SEZON",
		"Con ella este papel es una acusación.":
			"Onunla bu kâğıt bir suçlama demek.",
		"A ella el dinero le da igual.":
			"Onun için para önemli değil.",
		"LA CASA":
			"EV",
		"EL {0}% DE TU FICHA · {1} TEMPORADAS":
			"MAAŞININ %{0} · {1} SEZON",
		"La casa que tienes vale ${0}. La ficha, ${1} por partido.":
			"Evinin değeri ${0}. Maaşın, maç başı ${1}.",
		"Recogiste en dos cajas. La vitrina se quedó donde estaba.":
			"Eşyalarını iki koliye topladın. Vitrin olduğu yerde kaldı.",
		"La casa es suya, y todo lo que le metiste dentro.":
			"Ev onun, içine koyduğun her şey de.",
		"Firmaste el otro. Cinco años de que cada partido rinda la mitad.":
			"Diğerini imzaladın. Beş yıl boyunca her maç sana yarısını kazandıracak.",
		"${0} por partido, y sube si tú subes.":
			"Maç başı ${0} ve sen yükseldikçe artar.",
		"A ella el dinero le da igual: firmar apenas le va a doler.":
			"Onun için para önemli değil: imzalamak onu pek acıtmayacak.",
		"Con ella este papel es una acusación. Y es de quien más te protege.":
			"Onunla bu kâğıt bir suçlama demek. Üstelik seni en çok ondan korur.",
		"Le va a doler más de lo que va a decir.":
			"Onu, söyleyeceğinden çok daha fazla acıtacak.",

		"Va a vibrar tres veces. Contestar es perderla a ella.":
			"Üç kez titreyecek. Cevap vermek onu kaybetmek demek.",
		"Aguantados sin mirar: {0} de {1}":
			"Bakmadan dayandığın: {0} / {1}",
		"Ella se calla y espera a que termines. Se le fue lo que iba a decir.":
			"Susuyor ve bitirmeni bekliyor. Söyleyeceği şey uçup gitti.",
		"No te contó nada. Estabas en otra cosa.":
			"Sana hiçbir şey anlatmadı. Aklın başka yerdeydi.",
		"CONTESTAR":
			"CEVAPLA",
		"GUARDAR EL TELÉFONO":
			"TELEFONU KALDIR",
		"PEDÍRSELO":
			"TEKLIF ET",
		"Lleváis dos temporadas viviendo juntos y el anillo está"
		+ " pagado desde hace un mes. Tu agente quiere hablar contigo"
		+ " antes de que se lo pidas.":
			"İki sezondur birlikte yaşıyorsunuz ve yüzüğün parası bir aydır ödenmiş. Menajerin, sen teklif etmeden önce seninle konuşmak istiyor.",
		"HABLAR CON ÉL":
			"ONU DINLE",
		"¿LOS TIRAS TÚ?":
			"SEN MI ATACAKSIN?",
		"{0} ha fallado dos penales este año y en el vestuario nadie dice nada. Llevas el brazalete: el siguiente lo decides tú.":
			"{0} bu yıl iki penaltı kaçırdı ve soyunma odasında kimse ağzını açmıyor. Kaptanlık bandı sende: bir sonrakine sen karar veriyorsun.",
		"LOS COBRO YO":
			"BEN ATARIM",
		"SIGUE ÉL":
			"O ATSIN",
		"EL PUESTO QUE QUERÍAS":
			"ISTEDIGIN MEVKI",
		"Tres años seguidos siendo el goleador del equipo desde donde no querías jugar. El técnico te para en el pasillo: el {0} es tuyo si lo quieres.":
			"Hiç oynamak istemediğin yerden üç yıl üst üste takımın gol kralı oldun. Teknik direktör seni koridorda durduruyor: istersen {0} mevkii senin.",
		"ES MÍO":
			"BENIM",
		"ME QUEDO DONDE ESTOY":
			"YERIMDE KALIRIM",
		"EL RIVAL DE LA DÉCADA":
			"ON YILIN RAKIBI",
		"SE LLEVA TU LIGA OTRA VEZ":
			"LIGI YINE ONLAR ALDI",
		"LIGAS SEGUIDAS DE ELLOS":
			"ARKA ARKAYA LIGLERI",
		"sus ligas":
			"ligleri",
		"las tuyas":
			"seninkiler",
		"sus goles contra ti":
			"sana attığı goller",
		"Tres años viéndolos levantar la liga que querías. No abre la boca: la cifra habla por él, y dice que el año que viene vuelve.":
			"Üç yıl boyunca istediğin ligi onların kaldırmasını izledin. Ağzını açmıyor: rakam onun yerine konuşuyor ve seneye geri döneceğini söylüyor.",
		"EL SELECCIONADOR SE ACUERDA":
			"MILLI TAKIM HOCASI HATIRLADI",
		"TU PRIMERA CONVOCATORIA, TARDE":
			"ILK MILLI DAVETIN, GEÇ DE OLSA",
		"TEMPORADAS SIN LLAMARTE":
			"ÇAGRILMADIGIN SEZONLAR",
		"goles de liga":
			"lig golü",
		"años sin llamada":
			"çağrısız yıllar",
		"edad":
			"yaş",
		"Dos temporadas de goleador en primera y el teléfono sin sonar. Hoy viene en persona: no pide perdón, pero te mira a los ojos.":
			"Birinci ligde iki sezon gol krallığı ve telefon hiç çalmadı. Bugün bizzat geliyor: özür dilemiyor ama gözlerinin içine bakıyor.",
		"EL PRESIDENTE TE PIDE QUEDARTE":
			"BAŞKAN KALMANI ISTIYOR",
		"HAN PAGADO TU CLÁUSULA":
			"BEDELIN ODENDI",
		"TEMPORADAS EN EL CLUB":
			"KULUPTEKI SEZONLAR",
		"la cláusula":
			"serbest kalma bedeli",
		"balones de oro":
			"Yılın Oyuncusu",
		"Baja al césped sin prensa ni cámaras. No puede retener a quien paga la cláusula, y lo sabe: sólo viene a pedírtelo. La oferta sigue en MERCADO.":
			"Basın ve kamera olmadan sahaya iniyor. Serbest kalma bedeli ödenen birini tutamaz ve bunu biliyor: sadece rica etmeye geliyor. Teklif hâlâ PIYASA ekranında.",
		"OTRO AÑO":
			"BIR YIL DAHA",
		"SU ABOGADO HA LLAMADO":
			"AVUKATI ARADI",
		"No fue una discusión ni una noche mala: fue una carta. {0}"
		+ " quiere el divorcio, y su abogado ya ha puesto una cifra"
		+ " encima de la mesa.":
			"Bir kavga ya da kötü bir gece değildi: bir mektuptu. {0} boşanmak istiyor ve avukatı masaya çoktan bir rakam koydu.",
		"VER LA CIFRA":
			"RAKAMI GOR",
		"NO ABRIR ESA CARTA":
			"MEKTUBU AÇMA",




		"Deja el teléfono boca abajo y escúchala.":
			"Telefonu ters çevir ve onu dinle.",
		"Si vibra, no pasa nada. Es no tocarlo.":
			"Titrerse bir şey olmaz. Yeter ki dokunma.",
		"Avisos ignorados: {0} de {1}":
			"Görmezden gelinen bildirim: {0} / {1}",
		"Ella se calla y espera a que termines.":
			"Susuyor ve bitirmeni bekliyor.",
		"No miraste el teléfono ni una vez. Ella lo notó.":
			"Telefonuna bir kez bile bakmadın. Fark etti.",
		"Contestaste alguna. La noche se salvó a medias.":
			"Birkaçına cevap verdin. Gece yarı yarıya kurtuldu.",
		"Contestaste todas. Pidió la cuenta antes del postre.":
			"Hepsine cevap verdin. Tatlıdan önce hesabı istedi.",
		"Pregunta {0} de {1}":
			"Soru {0} / {1}",
		"Te acordabas de todo. No se lo esperaba.":
			"Her şeyi hatırlıyordun. Bunu beklemiyordu.",
		"Casi todo. Se rió del que fallaste.":
			"Neredeyse her şeyi. Kaçırdığına güldü.",
		"Uno de tres. «¿Me estabas escuchando?»":
			"Üçte bir. «Beni dinliyor muydun?»",
		"Ni uno. Esa noche no la escuchaste.":
			"Hiçbiri. O gece onu dinlemedin.",
		"Aciertos: {0} de {1}":
			"Doğru: {0} / {1}",
		"Ronda {0} de {1}":
			"Tur {0} / {1}",
		"DECIRLO AHORA":
			"ŞIMDI SOYLE",
		"Dijiste lo justo y cuando tocaba. Te presentó a los suyos.":
			"Tam kararında ve tam zamanında konuştun. Seni arkadaşlarıyla tanıştırdı.",
		"Alguna la acertaste. Al salir te tomó del brazo.":
			"Bazılarını tutturdun. Çıkarken koluna girdi.",
		"Hablaste siempre a destiempo. Salisteis pronto.":
			"Hep yanlış anda konuştun. Erken kalktınız.",
		"Quiere el {0} de tu sueldo, todos los meses.":
			"Her ay maaşının {0} kadarını istiyor.",
		"Serían ${0} por partido.":
			"Maç başı ${0} eder.",
		"NO OFRECERLE NADA":
			"HIÇBIR ŞEY VERME",
		"OFRECERLE LA MITAD":
			"YARISINI TEKLIF ET",
		"OFRECERLE CASI TODO":
			"ÇOGUNU TEKLIF ET",
		"DARLE LO QUE PIDE":
			"ISTEDIGINI VER",
		"«¿{0}? No me hagas esto.» Baja al {1}.":
			"«Ne, {0}? Bunu bana yapma.» İsteğini {1} seviyesine indiriyor.",
		"Trato hecho: el {0} de tu sueldo, cada partido.":
			"Anlaştınız: her maç maaşının {0} kadarı.",
		"Sube tu mantenimiento en ${0} por partido.":
			"Giderlerini maç başı ${0} artırır.",
		"Se levantó de la mesa sin acabar la frase.":
			"Cümlesini bitirmeden masadan kalktı.",
		"Esto no queda así.":
			"Bu iş burada bitmez.",
		"Creció en un pueblo de la costa":
			"Sahilde bir kasabada büyüdü",
		"Creció en un barrio del norte":
			"Kuzeyde bir mahallede büyüdü",
		"Se crió en el campo, lejos de todo":
			"Kırsalda, her şeyden uzakta büyüdü",
		"Es de una ciudad de montaña":
			"Bir dağ kasabasından",
		"Cambió de casa cada dos años":
			"İki yılda bir ev değiştirdi",
		"Nunca ha salido de esta ciudad":
			"Bu şehirden hiç çıkmadı",
		"Vivió un tiempo en el extranjero":
			"Bir süre yurt dışında yaşadı",
		"Es del mismo barrio que tú":
			"Seninle aynı mahalleden",
		"No soporta que le hablen de fútbol":
			"Ona futboldan bahsedilmesine dayanamaz",
		"No soporta la gente que llega tarde":
			"Geç kalanlara dayanamaz",
		"No soporta las fotos sin avisar":
			"Habersiz çekilen fotoğraflara dayanamaz",
		"No soporta el ruido de los sitios de moda":
			"Moda mekânların gürültüsüne dayanamaz",
		"No soporta que le mientan por educación":
			"Kibarlıktan yalan söylenmesine dayanamaz",
		"No soporta madrugar":
			"Erken kalkmaya dayanamaz",
		"No soporta que le pidan permiso para todo":
			"Her şey için izin istenmesine dayanamaz",
		"No soporta el mar":
			"Denize dayanamaz",
		"Pidió pescado y no se lo acabó":
			"Balık istedi ve bitirmedi",
		"Pidió lo mismo que tú":
			"Seninle aynısını istedi",
		"Pidió sólo postre":
			"Sadece tatlı istedi",
		"Pidió el plato más raro de la carta":
			"Menüdeki en tuhaf yemeği istedi",
		"No pidió nada, dijo que no tenía hambre":
			"Hiçbir şey istemedi, aç olmadığını söyledi",
		"Pidió carne muy hecha":
			"Etini iyi pişmiş istedi",
		"Pidió que eligieras tú":
			"Senin seçmeni istedi",
		"Pidió la sopa del día":
			"Günün çorbasını istedi",
		"Ella habla con gente que no conoces. Espera el hueco.":
			"Tanımadığın insanlarla konuşuyor. Boşluğu bekle.",
		"Alguien pregunta a qué te dedicas. No es el momento de"
		+ " decirlo.":
			"Biri ne iş yaptığını soruyor. Bunu söylemenin sırası değil.",
		"Se gira hacia ti. Ahora sí.":
			"Sana dönüyor. İşte şimdi.",
		"¿De dónde te dijo que era?":
			"Nereli olduğunu söylemişti?",
		"¿Qué te dijo que no soporta?":
			"Neye dayanamadığını söylemişti?",
		"¿Qué pidió aquella noche?":
			"O gece ne istemişti?",
		"LA PRIMERA CENA":
			"ILK YEMEK",
		"Mesa para dos y el teléfono boca abajo. Esta noche va de"
		+ " escucharla — y de que no te pillen mirando la pantalla.":
			"İki kişilik masa ve telefon ters çevrili. Bu gece onu dinleme gecesi — ve ekrana bakarken yakalanmama gecesi.",
		"ESTA SEMANA NO":
			"BU HAFTA OLMAZ",
		"LO QUE TE CONTÓ":
			"SANA ANLATTIKLARI",
		"Una copa y la conversación de la otra noche encima de la"
		+ " mesa. Vas a tener que acordarte de lo que te dijo.":
			"Bir kadeh ve geçen geceki sohbet yine masada. Sana söylediklerini hatırlaman gerekecek.",
		"LA INAUGURACIÓN DE ELLA":
			"ONUN SERGI AÇILIŞI",
		"Te lleva a una exposición donde no conoces a nadie. Aquí no"
		+ " se trata de entender los cuadros: se trata de saber cuándo"
		+ " hablar.":
			"Seni kimseyi tanımadığın bir sergiye götürüyor. Burada mesele tabloları anlamak değil: ne zaman konuşacağını bilmek.",
		"HABLEMOS DE DINERO":
			"PARAYI KONUŞALIM",
		"{0} ha esperado a que acabe la cena para decirlo, y lo dice"
		+ " sin rodeos: quiere una cantidad fija todos los meses, o esto"
		+ " no tiene sentido.":
			"{0} bunu söylemek için yemeğin bitmesini bekledi ve lafı dolandırmadan söylüyor: her ay sabit bir miktar istiyor, yoksa bunun bir anlamı yok.",
		"HABLARLO":
			"KONUŞALIM",
		"NO PIENSO DISCUTIR ESO":
			"BUNU TARTIŞMAM",


		"PRÓRROGA": "UZATMA",
		"DESCANSO · FINAL": "DEVRE · FINAL",
		"DESCANSO · DERBI": "DEVRE · DERBI",
		"SEGUNDO TIEMPO EXTRA": "UZATMA 2. YARI",
		"SI NADIE MARCA, PENALTIS": "GOL YOKSA PENALTILAR",
		"QUINCE MINUTOS PARA AGUANTAR": "ON BEŞ DAKIKA DAYAN",
		"QUINCE MINUTOS PARA REMONTAR": "ON BEŞ DAKIKADA ÇEVIR",
		"SI ACABA ASÍ: PRÓRROGA": "BOYLE BITERSE: UZATMA",
		"SI ACABA ASÍ: CAMPEONES": "BOYLE BITERSE: ŞAMPIYON",
		"SI ACABA ASÍ: SUBCAMPEONES": "BOYLE BITERSE: IKINCI",
		"SI ACABA ASÍ: PASÁIS": "BOYLE BITERSE: TUR",
		"SI ACABA ASÍ: FUERA": "BOYLE BITERSE: VEDA",
		"GLOBAL {0}-{1} · PRÓRROGA": "TOPLAM {0}-{1} · UZATMA",
		"GLOBAL {0}-{1} · PASÁIS": "TOPLAM {0}-{1} · TUR",
		"GLOBAL {0}-{1} · FUERA": "TOPLAM {0}-{1} · VEDA",
		"10 CONTRA 11": "10'A 11",
		"11 CONTRA 10": "11'E 10",
		"LÍDER": "LIDER",
		"EN ASCENSO": "ÇIKIŞ YERI",
		"EN DESCENSO": "DUŞME HATTI",
		"IGUALADO CON EL LÍDER": "LIDERLE EŞIT",
		"IGUALADO CON EL ASCENSO": "ÇIKIŞ YERIYLE EŞIT",
		"IGUALADO CON EL DESCENSO": "DUŞME HATTIYLA EŞIT",
		"A {0} PTS DEL LÍDER": "LIDERE {0} PUAN",
		"A {0} PTS DEL ASCENSO": "ÇIKIŞA {0} PUAN",
		"A {0} PTS DEL DESCENSO": "DUŞMEDEN {0} PUAN UZAK",
		"ÚLTIMA JORNADA": "SON HAFTA",
		"El míster se ha ido a por {0} delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"Hoca bütün takımın önünde {0} adlı oyuncuya yüklendi. Kimse başını yerden kaldırmıyor. Sen onun yanında oturuyorsun.",
		"Lo has dicho delante de todos. El míster no lo olvidará, y {0} tampoco.":
			"Bunu herkesin önünde söyledin. Ne hoca bunu unutacak ne de {0}.",
		"Te has callado. {0} se ha dado cuenta.": "Sustun. {0} bunu fark etti.",
		"{0}, nos has dejado con diez. Hoy no me hables.": "{0}, bizi on kişi bıraktın. Bugün benimle konuşma.",
		"{0}, {1} goles. ¿Vas a parar alguno en la segunda?":
			"{0}, {1} gol. İkinci yarıda birini kurtaracak mısın?",
		"LA HA TOMADO CON ÉL": "HEDEF OLDU",
		"El míster se ha ido a por un compañero delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"Hoca bütün takımın önünde bir takım arkadaşına yüklendi. Kimse başını yerden kaldırmıyor. Sen onun yanında oturuyorsun.",
		"DAR LA CARA POR ÉL": "ONA SAHIP ÇIK",
		"QUEDARTE CALLADO": "SESINI ÇIKARMA",

		"PREGUNTA DE VESTUARIO": "SOYUNMA ODASI SORUSU",
		"En el banco, alguien saca el móvil y lanza una pregunta a todo el vestuario.": "Yedek kulübesinde biri telefonunu çıkarıp bütün takıma bir soru soruyor.",
		"¿De dónde llegó {0} a {1}?": "{0}, {1} takımına nereden geldi?",
		"ACIERTA Y SUMAS +{0} DE ENERGÍA AL PITIDO": "BIL, MAÇ SONU +{0} ENERJI KAZAN",
		"¡Exacto! Llegó de {0}. +{1} de energía al pitido.": "Tam isabet! {0} takımından geldi. Maç sonunda +{1} enerji.",
		"No. Llegó de {0}.": "Hayır. {0} takımından geldi.",
		"Esto no es lo que somos. Tú tira del carro y los demás irán detrás.":
			"Biz bu değiliz. Sen öne düş, diğerleri arkandan gelir.",
		"Nos hemos salido del plan. Volved a lo de siempre y el resto llegará.":
			"Plandan saptık. Bildiğimiz işe dönün, gerisi gelir.",
		"Me dais vergüenza. A todos. Esa camiseta no se regala así.":
			"Utandırıyorsunuz beni. Hepiniz. O forma böyle hediye edilmez.",
		"Ya está. Que por lo menos no sea peor.": "Tamam. Bari daha kötü olmasın.",
		"Tú no eres éste. Te conozco: sal y demuéstramelo.":
			"Bu sen değilsin. Seni tanırım: çık ve bana göster.",
		"Haz lo sencillo. Lo que te ha traído hasta aquí, nada más.":
			"Basit oyna. Seni buraya getiren neyse o, fazlası değil.",
		"Así no. Si en diez minutos sigues igual, te cambio.":
			"Böyle olmaz. On dakika sonra hâlâ aynıysan, seni oyundan alırım.",
		"Lo que esperaba de ti. Ni más ni menos.": "Senden beklediğim buydu. Ne fazla ne eksik.",
		"Un gol no es nada. Dádsela a él, que sabe qué hacer con ella.":
			"Bir gol hiçbir şey değil. Topu ona verin, onunla ne yapacağını bilir.",
		"Vamos bien aunque no lo parezca. Mismo plan, y el gol llegará.":
			"Göründüğünden iyi gidiyoruz. Aynı plan, gol gelecek.",
		"Uno abajo y nadie se ha manchado la camiseta. Quiero verlo en la segunda.":
			"Bir gol gerideyiz ve kimse formasını kirletmedi. İkinci yarıda görmek istiyorum.",
		"Un gol abajo. Haré cambios.": "Bir gol gerideyiz. Değişiklik yapacağım.",
		"Cero a cero. La próxima que tengas, adentro. Confío en ti.":
			"Sıfır sıfır. Bir sonraki fırsatı ağlara gönder. Sana güveniyorum.",
		"Cero a cero, como estaba pensado. Paciencia, que el gol viene solo.":
			"Sıfır sıfır, planladığımız gibi. Sabır, gol kendiliğinden gelir.",
		"Cero a cero y nadie ha probado al portero. Eso se acabó.":
			"Sıfır sıfır ve kimse kaleciyi denemedi. Bu iş burada biter.",
		"Cero a cero. Seguid así y ya veremos.": "Sıfır sıfır. Böyle devam edin, bakalım.",
		"Empate. Marca tú la diferencia, que para eso te traje.":
			"Beraberlik. Farkı sen yarat, seni bunun için aldım.",
		"Empate. No cambiéis nada: si seguimos así, el partido es nuestro.":
			"Beraberlik. Hiçbir şeyi değiştirmeyin: böyle devam edersek maç bizim.",
		"Un empate no me vale. Quiero más de todos, y de ti el primero.":
			"Beraberlik bana yetmez. Hepinizden daha fazlasını istiyorum, ilk önce de senden.",
		"Empate. Algo tocaremos.": "Beraberlik. Bir şeyler değiştireceğiz.",
		"Bien. Seguid buscándole, que el segundo lo lleva en las botas.":
			"Güzel. Onu aramaya devam edin, ikinci gol kramponlarında.",
		"Ganamos haciendo lo nuestro. Seguid igual.": "Kendi oyunumuzla kazanıyoruz. Aynen devam.",
		"Uno a cero no es nada. No quiero ver ni un paso atrás.":
			"Bir sıfır hiçbir şey değil. Tek bir adım geri görmek istemiyorum.",
		"Ganamos. No toquéis nada.": "Kazanıyoruz. Hiçbir şeye dokunmayın.",
		"Esto es lo que sois. Disfrutadlo, pero sin regalar nada.":
			"Siz busunuz. Tadını çıkarın, ama hiçbir şey hediye etmeyin.",
		"El plan funciona. Cuarenta y cinco minutos más de lo mismo.":
			"Plan işliyor. Kırk beş dakika daha aynısı.",
		"Bien. Y ahora no quiero ver a nadie relajándose. A nadie.":
			"Güzel. Şimdi kimsenin gevşediğini görmek istemiyorum. Hiç kimsenin.",
		"Está hecho. Aprovecharé para mover el banquillo.": "İş bitti. Yedeklere de şans vereceğim.",
		"{0} no vuelve. Los demás, a correr también por él.":
			"{0} geri dönmüyor. Geri kalanlar, onun için de koşun.",
		"Nos lo han metido en el peor minuto. Olvidadlo ya, o nos come la segunda.":
			"Golü en kötü dakikada yedik. Hemen unutun, yoksa ikinci yarı bizi yer.",
		"Íbamos perdiendo y lo habéis levantado. Eso no os lo regala nadie.":
			"Gerideydik ve maçı çevirdiniz. Bunu size kimse hediye etmez.",
		"Íbamos ganando y lo hemos regalado. Eso no vuelve a pasar.":
			"Öndeydik ve hediye ettik. Bu bir daha olmayacak.",
		"El gol en el mejor momento. Ahora están tocados: a por el siguiente.":
			"Gol en güzel anda geldi. Şimdi sarsıldılar: bir sonrakine gidin.",
		"Con diez. Cada uno corre por dos, y sin una queja.":
			"On kişiyiz. Herkes iki kişilik koşacak, hem de şikâyet etmeden.",
		"Tienen uno menos. Que lo noten sus piernas, no las nuestras.":
			"Bir kişi eksikler. Bunu onların bacakları hissetsin, bizimkiler değil.",
		"Si llegamos a los penaltis, quiero once que se tengan en pie.":
			"Penaltılara kalırsak, ayakta duran on bir kişi istiyorum.",
		"Quince minutos. Aguantadlos como si fueran noventa.":
			"On beş dakika. Doksan dakikaymış gibi dayanın.",
		"Quince minutos para darle la vuelta. Lo que os quede, ahí fuera.":
			"Maçı çevirmek için on beş dakika. Ne kaldıysa orada bırakın.",
		"Así, prórroga. Y nadie quiere prórroga.": "Böyle olursa uzatma. Kimse uzatma istemez.",
		"Ahora mismo pasamos. Que no se os note que lo sabéis.":
			"Şu an turu geçiyoruz. Bildiğinizi belli etmeyin.",
		"Ahora mismo estamos fuera. Cuarenta y cinco minutos para cambiarlo.":
			"Şu an elendik. Bunu değiştirmek için kırk beş dakika var.",
		"Una final no se juega: se gana. El que se esconda, al banquillo.":
			"Final oynanmaz: kazanılır. Saklanan yedek kulübesine.",
		"Cuarenta y cinco minutos entre vosotros y la copa. Ni uno menos.":
			"Sizinle kupa arasında kırk beş dakika var. Bir dakika bile eksik değil.",
		"Nadie se acuerda de los subcampeones. Nadie. Salid a por ella.":
			"Kimse ikinciyi hatırlamaz. Kimse. Çıkın ve onu alın.",
		"¿Los oís? Pues que sea lo último que cantan hoy.": "Duyuyor musunuz? Bugün söyledikleri son şarkı bu olsun.",
		"Esto no es un partido más y lo sabéis. Hoy no se pierde.":
			"Bu sıradan bir maç değil ve bunu biliyorsunuz. Bugün kaybedilmez.",
		"Media ciudad está callada ahora mismo. Que siga así.":
			"Şu an şehrin yarısı susmuş durumda. Öyle kalsın.",
		"Así acabado, la tabla se nos pone cuesta arriba. Hay que darle la vuelta.":
			"Böyle biterse puan durumunda işimiz zorlaşır. Bunu çevirmemiz lazım.",
		"Un punto aquí no arregla nada. Quedan pocos partidos y éste es uno.":
			"Burada bir puan hiçbir şeyi düzeltmez. Az maç kaldı ve bu da onlardan biri.",
		"Si esto acaba así, la tabla se mueve a nuestro favor. No lo tiréis.":
			"Böyle biterse puan durumu lehimize döner. Bunu çöpe atmayın.",


		"NO SALES": "KENARDA",
		"Le metiste un balonazo a tu propio banquillo. No hacía falta nada más.":
			"Kendi yedek kulübene sert bir top vurdun. Başka bir şeye gerek yoktu.",
		"{0} ocasiones tiradas antes del descanso. Ya lo había decidido en la tercera.":
			"Devre arasından önce {0} fırsat harcandı. Kararımı üçüncüsünde vermiştim.",
		"Cuarenta y cinco minutos y no te he visto. Hoy se acabó aquí.":
			"Kırk beş dakika ve seni hiç görmedim. Bugün senin için burada bitti.",



		"VAS POR DELANTE": "ONDESIN",
		"VAS POR DETRÁS": "GERIDESIN",
		"TODO IGUAL": "EŞITLIK",
		"SEGUNDA PARTE": "IKINCI YARI",

		"No la tenías: en el túnel cuesta el triple.":
			"Sende yoktu: tünelde üç katına mal olur.",
		"energía": "enerji",
		"tus minutos": "dakikaların",
		"Te están pasando por encima. Esto no se arregla solo en la segunda.":
			"Seni ezip geçiyorlar. Bu ikinci yarıda kendiliğinden düzelmez.",
		"Desde la banca también se juega. Cuando te toque, no preguntes.":
			"Yedek kulübesinden de oynanır. Sıra sana gelince, iki kez sorma.",
		"A ti no te he visto. O apareces en la segunda, o te sientas.":
			"Seni sahada görmedim. Ya ikinci yarıda ortaya çık ya da otur.",
		"Vas fundido. Piensa bien dónde gastas lo que te queda.":
			"Pilin bitmiş. Kalanını nerede harcayacağını iyi düşün.",
		"Un gol. Sólo eso os separa, y quedan cuarenta y cinco minutos.":
			"Bir gol. Aradaki fark sadece bu ve kırk beş dakika var.",
		"Cero a cero. Esto lo gana el primero que acierte.":
			"Sıfır sıfır. Bunu ilk golü atan kazanır.",
		"Empate. El que se canse primero, pierde.": "Beraberlik. İlk yorulan kaybeder.",
		"Un gol no es nada. Salid como si fuerais perdiendo.":
			"Bir gol fark hiçbir şey değil. Gerideymiş gibi çıkın.",
		"Bien. Ahora lo difícil: no regalar lo que ya es vuestro.":
			"Güzel. Şimdi zor kısım: zaten sizin olanı hediye etmeyin.",

		"EL BALÓN ES TUYO": "TOP SENIN",
		"EL BALÓN ES DE LOS DOS": "TOP IKINIZIN",
		"UN BALÓN PARA CADA UNO": "HERKESE BIR TOP",
		"PASES TUYOS, GOLES DE {0}": "PAS SENDEN, GOL: {0}",
		"GOLES ENTRE LOS DOS": "IKINIZIN GOLLERI",
		"Te lo dio a ti. Sabe de dónde salieron.": "Topu sana verdi. Nereden geldiklerini biliyor.",
		"{0} tuyos, {1} suyos. Cada uno con el suyo.": "{0} senin, {1} onun. Herkes kendininkini alır.",
		"DOS HAT-TRICKS": "IKI HAT-TRICK",
		"GOLES EN UN PARTIDO": "BIR MAÇTA GOL",
		"Firmado por todos. Ya sabes dónde va.": "Bütün takım imzaladı. Nereye gideceğini biliyorsun.",
		"INTERCAMBIO": "TAKAS",
		"SU CAMISETA": "FORMASI",
		"La suya se queda contigo. La tuya se va con él.": "Onunki sende kalıyor. Seninki onunla gidiyor.",
		"TE PIDE LA CAMISETA": "FORMANI ISTIYOR",
		"{0} te espera en el círculo con la suya ya enrollada en la mano. La grada todavía no se va, y desde arriba se ve todo.": "{0} kendi formasını elinde rulo yapmış, orta yuvarlakta seni bekliyor. Tribünler henüz boşalmadı ve yukarıdan her şey görünüyor.",
		"CAMBIARLA": "TAKAS ET",
		"DÁRSELA SIN PEDIR NADA": "KARŞILIKSIZ VER",
		"NO SE CAMBIA": "TAKAS YOK",
		"BALONES": "TOPLAR",
		"PLAYERAS": "FORMALAR",
		"VITRINA DE BALONES": "TOP VITRINI",






		"VITRINA TORRE": "KULE VITRIN",
		"VITRINA GALERÍA": "GALERI VITRIN",
		"VITRINA DE PREMIOS": "ODUL VITRINI",
		"Tres baldas en un metro: para el rincón que no da más.":
			"Bir metrede üç raf: artık yer kalmayan köşe için.",
		"Cuatro metros de mostrador para alinear el palmarés.":
			"Kupaları dizmek için dört metrelik tezgâh.",
		"Solo para lo tuyo: los galardones individuales.":
			"Sadece senin için: bireysel ödüller.",
		"Sólo para lo tuyo: los galardones individuales.":
			"Sadece senin için: bireysel ödüller.",
		"Cada balón, con el día y el rival al que se lo metiste.": "Her top, attığın gün ve rakibiyle birlikte.",
		"Los balones de tus hat-tricks y las camisetas que cambiaste.": "Hat-trick yaptığın maçların topları ve takas ettiğin formalar.",
		"CAMBIO EN EL BANQUILLO": "KULUBEDE DEGIŞIM",
		"EL NUEVO": "YENI HOCA",
		"TÉCNICO NUEVO": "YENI HOCA",
		"Destituyen a {0}. {1}": "{0} görevden alındı. {1}",
		"TE QUERÍA A TI": "SENI ISTEDI",
		"Pidió tu nombre antes de firmar. Vienes de serie en su plan.": "İmzalamadan önce adını verdi. Planında baştan beri varsın.",
		"NO TOCA LO QUE FUNCIONA": "IŞLEYENE DOKUNMAZ",
		"Ha visto los vídeos y no piensa cambiar lo que ya andaba.": "Videoları izledi ve zaten işleyen şeyi değiştirmeye niyeti yok.",
		"EMPEZAMOS DE CERO": "HERKES SIFIRDAN",
		"No te conoce de nada. Todo el mundo parte del mismo sitio.": "Seni hiç tanımıyor. Herkes aynı yerden başlıyor.",
		"TE LO VAS A GANAR": "YERINI HAK ET",
		"Dice que aquí no hay intocables, y te mira a ti al decirlo.": "Burada dokunulmaz kimse olmadığını söylüyor ve bunu söylerken sana bakıyor.",
		"NO CUENTA CONTIGO": "PLANLARINDA YOKSUN",
		"Tiene otro plan, y en su pizarra tu nombre no aparece.": "Başka bir planı var ve tahtasında senin adın yok.",

		"TÉCNICOS": "HOCALAR",
		"RANKING DE TÉCNICOS": "HOCA SIRALAMASI",
		"Los técnicos del mundo, ordenados por sus estrellas.": "Dünyanın teknik direktörleri, yıldızlarına göre sıralı.",
		"Los trofeos cuentan desde la temporada {0}.": "Kupalar {0} sezonundan itibaren sayılır.",
		"1ª DIVISIÓN": "1. LIG",
		"EN EL PARO": "BOŞTA",
		"Nadie en esta lista todavía. Los que echan de su club pasan aquí hasta que otro los ficha.": "Bu listede henüz kimse yok. Kulübünden kovulanlar, başka bir kulüp onları alana kadar burada kalır.",
		"TU TÉCNICO: {0}° DE {1}": "HOCAN: #{0} / {1}",
		"En el cargo desde la temporada {0}.": "{0} sezonundan beri görevde.",
		"Sin títulos todavía.": "Henüz kupası yok.",

		"MÍSTER": "HOCA",
		"2ª DIVISIÓN": "2. LIG",
		"técnico": "teknik direktör",
		"técnicos": "teknik direktör",
		"técnico sin equipo": "takımsız teknik direktör",
		"técnicos sin equipo": "takımsız teknik direktör",
		"seleccionador": "milli takım teknik direktörü",
		"seleccionadores": "milli takım teknik direktörü",

		"cara de leyenda": "efsane yüzü",
		"caras de leyenda": "efsane yüzü",
		"Palmarés real, más lo que ganen desde la temporada {0}.": "Gerçek başarılar, artı {0} sezonundan itibaren kazandıkları.",
		"{0} destituye a {1}. Llega {2}.": "{0} kulübü {1} ile yollarını ayırdı. Yerine {2} geldi.",

		"BALÓN AL ÁREA": "UZUN TOP",
		"No quiere elaborar: quiere el balón arriba y gente rematando.": "Oyun kurmak istemiyor: topu önde ve ceza sahasında vuran adamlar istiyor.",
		"TOQUE Y PACIENCIA": "PAS VE SABIR",
		"Prefiere diez pases a un balonazo. Aquí se juega con la cabeza.": "Bir uzun top yerine on pası tercih eder. Burada akılla oynanır.",
		"PRESIÓN ALTA": "ONDE BASKI",
		"Noventa minutos corriendo. El que no llega, descansa.": "Doksan dakika koşu. Yetişemeyen oturur.",
		"OFICIO": "USTA",
		"Once fijo y partido controlado. Aquí mandan los que ya saben.": "Sabit ilk 11 ve kontrollü maç. Burada bilenler söz sahibi.",
		"DOBLE PIVOTE": "ÇIFT PIVOT",
		"Dos que barren, uno que piensa y uno arriba. Primero, no perder.": "İki süpürücü, bir düşünen ve bir forvet. Önce kaybetmemek.",
		"ATAQUE TOTAL": "TAM HUCUM",
		"Tres atrás y tres arriba. Si nos meten dos, metemos tres.": "Arkada üç, önde üç. Bize iki atarlarsa, biz üç atarız.",
		"AUTOBÚS": "OTOBUSU ÇEK",
		"Cinco atrás y a la contra. Un 1-0 es una goleada.": "Arkada beş ve kontra. 1-0 farklı galibiyettir.",
		"PIZARRA": "TAKTIK",
		"El {0} ya juega el {1} de {2}": "{0} artık {2} adlı hocanın {1} dizilişiyle oynuyor",

		"ESPECIALISTA A BALÓN PARADO": "DURAN TOP UZMANI",
		"Ensaya el balón parado: si eres el lanzador, te llegan muchas más faltas, córners y penales.": "Duran topları çalıştırır: kullanan sensen, çok daha fazla serbest vuruş, korner ve penaltı gelir.",
		"EL CÓRNER ES UN PENAL": "KORNER PENALTI GIBI",
		"Ensaya el córner: si eres el lanzador, sacas casi el doble de córners y tiras menos faltas.": "Korneri çalıştırır: kullanan sensen, neredeyse iki kat korner kullanır ve daha az serbest vuruş atarsın.",
		"CONTRAGOLPE": "KONTRATAK",
		"Cede el balón y sale a la carrera: más contras y menos posesión.": "Topu rakibe bırakır ve koşar: daha çok kontra, daha az topa sahip olma.",
		"AL ÁREA, SIEMPRE": "HEP CEZA SAHASINA",
		"Todo por las bandas: llueven centros al área y hay menos disparos desde fuera.": "Her şey kanatlardan: ceza sahasına ortalar yağar, uzaktan şut azalır.",
		"JUEGO DE ESPACIOS": "BOŞLUK OYUNU",
		"Busca el pase al hueco: más mano a mano con el portero.": "Ara pası arar: kaleciyle daha çok karşı karşıya.",
		"PEGA DESDE FUERA": "UZAKTAN VUR",
		"Pide el disparo desde fuera del área: más tiros lejanos.": "Ceza sahası dışından şut ister: daha çok uzaktan şut.",
		"CERROJO": "KILIT",
		"Con ventaja cierra el partido: el rival casi no remonta desde el 75'.": "Öndeyken maçı kilitler: rakip 75'ten sonra neredeyse hiç geri dönemez.",
		"FERGIE TIME": "FERGIE TIME",
		"Sus equipos no se rinden: más goles propios en el descuento.": "Takımları asla pes etmez: uzatmalarda daha çok gol atarsınız.",
		"EL ÁREA ES UN CAMPO DE MINAS": "CEZA SAHASI MAYIN TARLASI",
		"Juega por dentro y lo derriban: el doble de penales a favor.": "İçeriden oynar ve faul yer: lehine iki kat penaltı.",
		"CONFÍA EN EL CHAVAL": "GENÇLERE GUVENIR",
		"Apuesta por los jóvenes: hasta los 23 juegas más y antes eres titular.": "Gençlere şans verir: 23 yaşına kadar daha çok oynar ve daha erken ilk 11'e girersin.",
		"EL BALÓN ES NUESTRO": "TOP BIZIM",
		"Con el balón el rival no llega: encaja menos, pero el partido va más lento.": "Top bizdeyken rakip gelemez: daha az gol yenir ama maç daha yavaş akar.",
		"SALE A MORDER": "ISIRARAK BAŞLAR",
		"Empieza a mil: la primera media hora es de tu equipo, ida y vuelta.": "Tam gaz başlar: karşılıklı ataklarla geçen ilk yarım saat senin takımının.",
		"POCAS PERO CLARAS": "AZ AMA NET",
		"Menos ocasiones y mejores: llegan más cerca de la portería, y fallarlas cuesta el doble.": "Daha az ama daha iyi fırsatlar: kaleye daha yakın gelir ve kaçırmak iki kat pahalıya patlar.",
		"HOMBRE DE DERBIS": "DERBI ADAMI",
		"Se crece en los derbis: más juego y una ocasión más contra el rival de siempre.": "Derbilerde büyür: ezeli rakibe karşı daha çok oyun ve bir fırsat daha.",
		"CUIDA LAS PIERNAS": "BACAKLARI KORUR",
		"Menos lesiones y mejor descanso, a cambio de rotarte más.": "Daha az sakatlık ve daha iyi dinlenme; karşılığında seni daha çok rotasyona sokar.",
		"EL LOCO": "DELI",
		"Ida y vuelta sin freno: más energía por partido y más lesiones.": "Frensiz karşılıklı oyun: maç başına daha çok enerji ve daha çok sakatlık.",
		"NO TE FÍAS DEL CHAVAL": "GENÇLERE GUVENMEZ",
		"No se fía de los jóvenes: hasta los 23 te cuesta más el puesto.": "Gençlere güvenmez: 23 yaşına kadar yerini kapmak daha zor.",
		"BRONCA POR TODO": "HER ŞEYE KIZAR",
		"Bronca por todo: cada mal partido te pesa el doble con él.": "Her şeye kızar: onunla her kötü maç iki kat ağır gelir.",
		"CARRUSEL": "ROTASYON",
		"Rota sin parar: te sienta aunque llegues fresco.": "Durmadan rotasyon yapar: dinç olsan bile seni kenara oturtur.",
		"NO SUELTA UN DURO": "ELI SIKI",
		"Manda en los fichajes y no suelta un duro: las mejoras de contrato cuestan más.": "Transferlerde söz onda ve tek kuruş koklatmaz: sözleşme iyileştirmeleri daha pahalı.",
		"ONCE DE LA SUERTE": "UGURLU 11",
		"Si el once ganó, repite: para entrar hay que esperar a que pierda.": "İlk 11 kazandıysa aynısı oynar: girmek için bir mağlubiyet beklemen gerekir.",
		"VE ROJAS DONDE NO LAS HAY": "HER YERDE KIRMIZI GORUR",
		"Sus equipos ven más rojas: jugarás con diez más veces.": "Takımları daha çok kırmızı kart görür: daha sık on kişi oynarsın.",
		"FUERA DE CASA SE ENCOGE": "DEPLASMANDA SINER",
		"Fuera de casa se encoge: el rival aprieta más en su campo.": "Deplasmanda siner: rakip kendi sahasında daha çok bastırır.",
		"SU OJITO DERECHO": "GOZDESI VAR",
		"Tiene favoritos: hasta que te lo ganes, otro juega en tu sitio.": "Gözdeleri var: onu kazanana kadar senin yerinde başkası oynar.",
		"PARTIDOS LOCOS": "ÇILGIN MAÇLAR",
		"Sus partidos son locos: goleadas en las dos porterías.": "Maçları çılgındır: iki kalede de gol yağmuru.",
		"DESPIERTA AL DESCANSO": "DEVREDE UYANIR",
		"Sale dormido: nada antes del 25', y el rival manda la primera parte.": "Uykulu başlar: 25'ten önce hiçbir şey yok ve ilk yarıya rakip hükmeder.",
		"ONCE DE HIERRO": "DEMIR 11",
		"Casi no rota: repite el once mientras aguanten las piernas; el que no juega, espera.": "Neredeyse hiç rotasyon yapmaz: bacaklar dayandıkça aynı ilk 11'i oynatır; oynamayan bekler.",
		"LA CULPA ES TUYA": "SUÇ SENDE",
		"Tras perder, la culpa es tuya: afición y prensa te lo cobran el doble.": "Mağlubiyetten sonra suç sende: taraftar ve basın sana iki katını ödetir.",
		"REVOLUCIÓN": "DEVRIM",
		"Llega y manda: lleva al equipo a su dibujo el doble de rápido.": "Gelir ve hemen söz sahibi olur: takımı kendi dizilişine iki kat hızlı geçirir.",
		"LO QUE FUNCIONA NO SE TOCA": "IŞLEYENE DOKUNULMAZ",
		"Respeta lo heredado: tarda el doble en llevar al equipo a su dibujo.": "Mirası korur: takımı kendi dizilişine geçirmesi iki kat uzun sürer.",

		"RASGOS DEL MÍSTER": "HOCANIN HUYLARI",
		"RASGOS": "HUYLAR",
		"RASGO BUENO": "IYI HUY",
		"RASGO MALO": "KOTU HUY",
		"Juega para un técnico con este rasgo para descubrirlo.": "Bu huyu keşfetmek için bu huya sahip bir teknik direktörün takımında oyna.",
		"Con la selección no se descubre: juega para un técnico de club con este rasgo.": "Milli takımda keşfedilmez: bu huya sahip bir kulüp teknik direktörünün takımında oyna.",
		"Los rasgos de los técnicos para los que has jugado. Cada uno se descubre con el primer partido a sus órdenes.": "Takımında oynadığın teknik direktörlerin huyları. Her biri, onun yönetimindeki ilk maçında ortaya çıkar.",
		"Sin rasgos conocidos.": "Bilinen huy yok.",
		"BUENOS": "IYI",
		"MALOS": "KOTU",
		"Rasgo nuevo: {0}": "Yeni huy: {0}",



		"MOVER ESTO": "TAŞI",
		"choca con {0}": "{0} ile çakışıyor",
		"encima de {0}": "üstünde: {0}",






		"GANAS LA TANDA": "SERI SENIN",
		"ELIMINADO EN PENALES": "PENALTILARLA ELENDIN",
		"La metió {0}. Los otros diez cruzaron medio campo para decírselo.":
			"Golü {0} attı. Diğer on kişi bunu ona söylemek için sahanın yarısını koştu.",
		"La metiste tú. Los otros diez cruzaron medio campo para decírtelo.":
			"Golü sen attın. Diğer on kişi bunu sana söylemek için sahanın yarısını koştu.",
		"La sacó {0}. Los otros diez cruzaron medio campo para decírselo.":
			"Kurtaran {0} oldu. Diğer on kişi bunu ona söylemek için sahanın yarısını koştu.",
		"La mandaron fuera. Los otros diez cruzaron medio campo igual.":
			"Dışarı attılar. Diğer on kişi yine de sahanın yarısını koştu.",
		"La metiste tú. Hasta el banquillo saltó al campo a por ti.":
			"Golü sen attın. Yedek kulübesi bile senin için sahaya fırladı.",
		"La metió {0}. Hasta el banquillo saltó al campo a por él.":
			"Golü {0} attı. Yedek kulübesi bile onun için sahaya fırladı.",
		"La sacó {0}. Hasta el banquillo saltó al campo a por él.":
			"{0} kurtardı. Yedek kulübesi bile onun için sahaya fırladı.",
		"La mandaron fuera. Hasta el banquillo saltó al campo.":
			"Üstten auta attılar. Yedek kulübesi bile sahaya fırladı.",
		"La fiesta la dan ellos. A ti te quedan cuarenta metros hasta el túnel.":
			"Bayram onların. Sana tünele kadar kırk metre kaldı.",
		"Subcampeón": "İkinci",

		"Campeón: {0}": "Şampiyon: {0}",
		"La fiesta estaba lista. La están dando ellos, en el sitio donde ibas a estar tú.":
			"Kutlama hazırdı. Şimdi onlar kutluyor, tam senin olman gereken yerde.",

		"ÁNGULO": "AÇI",

		"Presión alta": "Önde baskı",
		"Bloque bajo": "Derin blok",
		"Marcaje al hombre": "Adam adama",
		"Bloque alto paciente": "Sabırlı önde blok",


		"Equilibrado": "Dengeli",

		"ÁRBITRO": "HAKEM",
		"Tarjetero": "Kart meraklısı",
		"Permisivo": "Hoşgörülü",
		"Deja seguir": "Avantaj verir",
		"Pita todo": "Her şeye düdük çalar",

		"Encerrado en la banda": "Kanata sıkışmış",
		"El último hombre": "Son adam",

		"Juega la {0}": "Oynadığı turnuva: {0}",

		"Su comisión baja del 8% al 3% en cada partido, y también en lo que"
		+ " cobras al firmar. Cara, pero cuanto antes la firmes, más te devuelve.":
			"Komisyonu her maçta %8'den %3'e iner, imza parasında da öyle. Pahalı ama ne kadar erken imzalarsan o kadar çok kazandırır.",

		"EL CHAVO TE COMIÓ EL PUESTO": "VELET FORMANI KAPTI",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la"
		+ " nómina: el tuyo. Te piden por las buenas un 20% de tu sueldo, y el"
		+ " vestuario ya sabe que te lo han pedido.":
			"Kulüp bir harika çocukla anlaşmış, maaş bordrosunda yer lazım: seninki. Kibarca maaşından %20 indirim istiyorlar ve soyunma odası bunu çoktan biliyor.",
		"DECIR QUE LES SOBRÓ CONFIANZA": "FAZLA RAHATTILAR DE",
		"Los eliminó un equipo de dos categorías más abajo, en una cancha de mil"
		+ " personas y con el vestuario de local festejando junto al de ustedes.":
			"İki lig aşağıdan bir takıma elendiniz, bin kişilik bir sahada, ev sahibi soyunma odası sizinkinin yanında kutlama yaparken.",

		"max_asist_eulCerebro de la Europa League": "Avrupa Kupası Oyun Kurucusu",
		"pichichi_x5Dueño del Area": "Ceza Sahası Avcısı",
		"pichichi_3_paisesEl Gol No Entiende de Idiomas":
			"Golün Dili Yoktur",
		"doblete_ligaGoles y Pases": "İkisinde de Zirve",
		"verdugo_paises_bajosVerdugo de Países Bajos": "Hollanda'nın Belası",
		"presentacion_40kCuarenta Mil": "Kırk Bin",
		"TE QUIEREN EN EL PLATÓ": "TV SENI ISTIYOR",
		"UN MICRÓFONO CALIENTE": "AÇIK MIKROFON",
		"DESCANSAR EN CASA": "EVDE DINLEN",
		"SALIR CON EL EQUIPO": "TAKIMLA DIŞARI ÇIK",
		"¡Subiste a nivel {0}!": "Seviye atladın: {0}!",
		"Tienes {0} puntos para repartir en tus habilidades.":
			"Yeteneklerine dağıtacak {0} puanın var.",
		"un compañero": "bir takım arkadaşı",
		"Le abriste la puerta a {0}. Atento al mercado.":
			"Kapıyı araladın, ilgilenen: {0}. Transfer piyasasını takip et.",
		"Aún no hay ofertas. Se pueden mover fichas.":
			"Henüz teklif yok. Her şey değişebilir.",
		"{0} {1} sobre la mesa.": "Masada {0} {1} var.",
		"Marcas interesadas": "Markalar ilgileniyor",
		"{0} {1} {2} ficharte.": "{0} {1} seni almak {2}.",
		"Convocado con tu selección": "Milli takıma çağrıldın",
		"Entras en la lista ({0}). Jugarás las fechas FIFA.":
			"Kadrodasın ({0}). Milli arada oynayacaksın.",
		"Te dan el alta": "Sağlık raporun çıktı",
		"Recuperado. Vuelves a estar disponible para el próximo partido.":
			"İyileştin. Bir sonraki maç için yeniden hazırsın.",
		"Lesión": "Sakatlık",
		"Estarás de baja {0} {1}.": "{0} {1} sahalardan uzak kalacaksın.",
		"Fuera de la lista": "Kadro dışı",
		"El seleccionador de {0} te deja fuera de la convocatoria.":
			"{0} milli takım teknik direktörü seni kadroya almadı.",
		"Vuelves a la selección": "Milli takıma dönüş",
		"Regresas a la lista de {0} ({1}).": "Yeniden {0} kadrosundasın ({1}).",
		"Titular con tu selección": "Milli takımda ilk 11",
		"Te ganas el puesto en el once de {0}.":
			"{0} ilk 11'inde yerini kazandın.",
		"Te quedas fuera": "Kadro dışısın",
		"El técnico no te convoca para el próximo partido.":
			"Hoca seni bir sonraki maçın kadrosuna almadı.",
		"Pierdes la titularidad": "Formayı kaybettin",
		"Empezarás en el banquillo el próximo partido.":
			"Bir sonraki maça yedek başlayacaksın.",
		"Vuelves al once": "Yeniden ilk 11'de",
		"El técnico te devuelve la titularidad.": "Hoca formayı sana geri verdi.",
		"Energía en rojo": "Enerji kırmızıda",
		"Vas al {0}%. Jugando así rindes menos y te arriesgas a lesionarte.":
			"Enerjin %{0}. Böyle oynarsan performansın düşer ve sakatlanma riskin artar.",
		"Semana de derbi": "Derbi haftası",
		"Toca {0}. Gana y todo cuenta doble.":
			"Sıradaki rakip: {0}. Kazan, her şey çift sayılsın.",
		"Logro: {0}": "Başarım: {0}",
		"El técnico cuenta más contigo": "Hoca sana daha çok güveniyor",
		"Tu rol en el club sube a {0}.": "Kulüpteki rolün yükseldi: {0}.",
		"El técnico te nombra capitán": "Hoca seni kaptan yaptı",
		"Tu rendimiento manda en el vestuario: llevas el brazalete.":
			"Performansınla soyunma odasına liderlik ediyorsun: kaptanlık bandı sende.",
		"Te quitan el brazalete": "Kaptanlık bandını kaybettin",
		"Otro compañero rinde por encima de ti esta temporada.":
			"Bu sezon başka bir takım arkadaşı senden daha iyi oynuyor.",
		", {0} goles": ", {0} gol",
		"Fuiste la figura ({0} de nota{1}).":
			"Maçın yıldızıydın (not: {0}{1}).",
		"Media {0}: el mejor de tu liga este mes (listón {1}).":
			"Ortalama {0}: bu ay liginin en iyisi (baraj {1}).",
		"Premio de la temporada {0}.": "{0} sezonu ödülü.",
		"¡Campeón de Liga!": "Lig şampiyonu!",
		"Levantaste la liga con tu club.": "Kulübünle ligi kazandın.",
		"¡Ascenso!": "Üst lige çıktın!",
		"Subes a {0} con tu club.": "Kulübünle bir üst lige çıktın: {0}.",
		"Descenso a {0}": "Küme düştün: {0}",
		"Ganar la copa nacional.": "Kupayı kazan.",
		"Eres campeón de Europa.": "Avrupa şampiyonusun.",
		"Fase final de Champions": "Elit Kupası eleme turları",

		"Entraste en el ONCE IDEAL de la liga": "Ligin EN IYI 11'ine girdin",
		"¡Campeón de Europa League!": "Avrupa Kupası şampiyonu!",
		"Ganas Europa y con ella la plaza para la próxima Champions.":
			"Avrupa'yı kazandın, bununla gelecek sezon Elit Kupası'nda yer de.",
		"Fase final de Europa League": "Avrupa Kupası eleme turları",
		"¡Campeón del Mundo de Clubes!": "Kulüpler Dünya Şampiyonu!",
		"El título más grande a nivel de club.": "Kulüp futbolunun en büyük kupası.",
		"Objetivo cumplido": "Hedef tuttu",
		"El club queda contento con tu temporada.": "Kulüp sezonundan memnun.",
		"Objetivo no cumplido": "Hedef tutmadı",
		"El club esperaba más. Sube la presión.":
			"Kulüp daha fazlasını bekliyordu. Baskı artıyor.",
		"El club te pone en venta por no cumplir":
			"Hedefi tutturamadığın için kulüp seni satışa çıkardı",
		"El club te pone en venta": "Kulüp seni satışa çıkardı",
		"Dos temporadas sin dar lo que firmaste. En {0} escuchan ofertas por ti.":
			"İki sezondur imzaladığın şeyi veremedin. {0} yönetimi senin için teklif dinliyor.",
		"El club te buscará minutos fuera": "Kulüp sana başka yerde süre bulacak",
		"El club te buscará sitio fuera": "Kulüp sana başka yerde yer bulacak",
		"No cumpliste lo que te pidieron y en {0} creen que necesitas jugar. En el próximo mercado te buscarán una cesión.":
			"Senden isteneni yapamadın ve {0} yönetimi oynaman gerektiğini düşünüyor. Bir sonraki transfer döneminde seni kiralık gönderecekler.",
		"Contrato en el último año": "Sözleşmenin son yılı",
		"Renueva o escucha ofertas antes de quedar libre.":
			"Bonservisin eline geçmeden uzat ya da teklifleri dinle.",
		"Se acabó: te retiras a los {0}": "Bitti: {0} yaşında emekli oluyorsun",
		"Mercado de verano abierto": "Yaz transfer dönemi açıldı",
		"{0}: OBJETIVO CUMPLIDO": "{0}: HEDEF TUTTU",
		"{0} no renueva, y no volverá en {1} temporadas":
			"{0} sözleşmeyi uzatmıyor ve {1} sezon geri dönmeyecek",
		"{0} no renueva: tu club no juega en Europa": "{0} sözleşmeyi uzatmıyor: kulübün Avrupa'da oynamıyor",
		"{0}: objetivo a {1} por tus {2} jornadas de baja":
			"{0}: {2} hafta sakat kaldığın için hedef {1} oldu",
		"{0} no renueva": "{0} sözleşmeyi uzatmıyor",
		"Los años pesan: -{0} en lo físico": "Yaş kendini gösteriyor: fizikte -{0}",
		"Los años pesan: -{0} en lo físico y -{1} en lo técnico": "Yaş kendini gösteriyor: fizikte -{0}, teknikte -{1}",
		"Los años pesan: -{0} en lo técnico": "Yaş kendini gösteriyor: teknikte -{0}",
		"Terminar {0} o mejor en la liga.": "Ligi {0} veya daha iyi bitir.",
		"Dar {0} asistencias.": "{0} asist yap.",
		"Jugar {0} partidos.": "{0} maç oyna.",
		"Promediar {0} de nota.": "Ortalama {0} not al.",
		"Marcar {0} goles.": "{0} gol at.",
		"Preguntaron por ti": "Seni sordular",
		"{0} te ha hecho una oferta.": "Teklif yapan kulüp: {0}.",
		"Un club": "Bir kulüp",
		"Mercado de invierno abierto": "Ara transfer dönemi açıldı",
		"Se retiran de la puja": "Yarıştan çekildiler",
		"Rechazaste una oferta": "Bir teklifi reddettin",
		"Dijiste no a {0}. Se busca otro destino para la próxima jornada.":
			"{0} teklifine hayır dedin. Bir sonraki hafta için başka bir adres aranıyor.",
		"Nadie ocupa el hueco": "Boşluğu dolduran yok",
		"Rechazaste y de momento no ha llegado nadie más.":
			"Teklifi reddettin ve şimdilik başka kimse gelmedi.",
		"{0} ya no cuenta contigo: buscan a otro.":
			"{0} artık seni düşünmüyor: başkasını arıyorlar.",
		"Enfrían el interés": "İlgi soğuyor",
		"{0} se baja tras tu último partido.": "Son maçından sonra {0} geri adım attı.",
		"Último día de mercado": "Transferin son günü",
		"{0} {1} sobre la mesa. Mañana se cierra.":
			"Masada {0} {1} var. Dönem yarın kapanıyor.",
		"Nueva oferta": "Yeni teklif",
		"{0} entra en la puja por ti.": "{0} seni almak için yarışa girdi.",
		"El club": "Kulüp",
		"mejor ficha": "daha iyi maaş",
		"ser titular": "ilk 11 garantisi",
		"Negociación abierta": "Görüşmeler başladı",
		"Pediste {0} a {1}. Te responden en la próxima jornada.":
			"{1} kulübünden {0} istedin. Bir sonraki hafta yanıt verecekler.",
		"sube la ficha a ${0}/partido": "maaşını maç başı ${0} yapar",
		"acepta ficharte como {0}": "seni {0} olarak almayı kabul eder",
		"Ceden en la negociación": "Geri adım attılar",
		"Rompen la negociación": "Görüşmeler koptu",
		"{0} retira su oferta: te apretaste de más.":
			"{0} teklifini geri çekti: fazla yüklendin.",
		"Se plantan": "Geri adım atmıyorlar",
		"{0} mantiene su oferta tal cual. No hay más margen.":
			"{0} teklifini olduğu gibi koruyor. Daha fazla pay yok.",
		"Rumores de mercado": "Transfer söylentileri",
		"{0} pregunta por ti de cara al mercado de invierno.":
			"{0} ara transfer dönemi için seni soruyor.",
		"El club necesita venderte": "Kulübün seni satması gerekiyor",
		"En {0} dicen que tu traspaso les cuadra el año. Puedes negarte, pero no te lo"
		+ " van a agradecer. Decide en MERCADO.":
			"{0} yönetimi transferinin bütçeyi denkleştireceğini söylüyor. Reddedebilirsin ama sana teşekkür etmezler. Kararını PIYASA ekranında ver.",
		"el club": "kulüp",
		"Aceptas salir": "Gitmeyi kabul ettin",
		"El club te ofrece a quien pregunte. Busca destino en MERCADO.":
			"Kulüp seni soran herkese önerecek. PIYASA ekranında yeni adres bul.",
		"Te niegas a salir": "Gitmeyi reddettin",
		"Te quedas, pero el club contaba con ese traspaso y se nota en el vestuario.":
			"Kalıyorsun ama kulüp o transfer gelirine güveniyordu ve soyunma odasında bu hissediliyor.",
		"El club te busca minutos": "Kulüp sana süre arıyor",
		"En {0} no vas a jugar y lo saben: te ofrecen salir CEDIDO para que juegues."
		+ " Puedes negarte, pero te quedas donde estás. Decide en MERCADO.":
			"{0} kulübünde oynamayacaksın ve bunu biliyorlar: maç oynaman için seni KIRALIK göndermeyi öneriyorlar. Reddedebilirsin ama olduğun yerde kalırsın. Kararını PIYASA ekranında ver.",
		"Te niegas a salir cedido": "Kiralığı reddettin",
		"Te quedas. El club te buscó minutos y dijiste que no: esta temporada vas a"
		+ " mirar muchos partidos desde fuera.":
			"Kalıyorsun. Kulüp sana süre buldu ve sen hayır dedin: bu sezon birçok maçı dışarıdan izleyeceksin.",
		"El club deja de contar contigo: buscan salida":
			"Kulüp artık seni düşünmüyor: gitmeni istiyorlar",
		"El club deja de esperarte": "Kulüp seni beklemekten vazgeçti",
		"Dos temporadas sin crecer y sin sitio en el equipo: {0} te pone en la puerta"
		+ " de salida y no te va a renovar.":
			"İki sezondur gelişemedin ve takımda yerin yok: {0} sana kapıyı gösteriyor ve sözleşmeni uzatmayacak.",
		"Vuelve de su cesión": "Kiralıktan döndü",
		"{0} regresa al vestuario tras un año jugando fuera.":
			"{0}, bir yıl başka yerde oynadıktan sonra soyunma odasına döndü.",
		"Un canterano": "Bir altyapı oyuncusu",
		"Sale cedido": "Kiralık gitti",
		"{0} se va cedido a {1} por una temporada.":
			"{0} bir sezonluğuna kiralık olarak gidiyor: {1}.",
		"Llega cedido": "Kiralık geldi",
		"{0} ({1}) llega cedido desde {2}.": "{0} ({1}) kiralık olarak geldi, gönderen: {2}.",
		"Sube uno de la cantera": "Altyapıdan biri yükseldi",
		"{0} ({1}) se queda con el hueco en el primer equipo.":
			"{0} ({1}) A takımdaki boşluğu kaptı.",
		"Tu club ficha": "Kulübün transfer yaptı",
		"Llega {0} ({1}) desde {2}.": "{0} ({1}) geldi, eski kulübü: {2}.",
		"El descenso vacía el vestuario": "Küme düşmek soyunma odasını boşaltıyor",
		"{0} ({1}) se va: el club necesita hacer caja.":
			"{0} ({1}) gidiyor: kulübün paraya ihtiyacı var.",
		"Se va un compañero": "Bir takım arkadaşı gidiyor",
		"{0} deja el vestuario: firma por {1}.":
			"{0} soyunma odasına veda etti: yeni kulübü {1}.",
		"El fichaje del mercado": "Dönemin transferi",
		"{0} pasa de {1} a {2} por ${3}.": "{0} transfer oldu: {1} → {2}, bedel ${3}.",




		"Se mueve tu vestuario": "Soyunma odan değişiyor",
		"Llegan {0}. Se van {1}.": "Gelenler: {0}. Gidenler: {1}.",
		"Llegan {0}.": "Gelenler: {0}.",
		"Se vacía tu vestuario": "Soyunma odan boşalıyor",
		"Se van {0}.": "Gidenler: {0}.",
		"Cesiones en tu club": "Kulübünde kiralıklar",
		"Llegan cedidos {0}. Salen cedidos {1}.":
			"Kiralık gelenler: {0}. Kiralık gidenler: {1}.",
		"Llegan cedidos {0}.": "Kiralık gelenler: {0}.",
		"Salen cedidos {0}.": "Kiralık gidenler: {0}.",
		"El mercado se movió": "Hareketli bir dönem",
		"{0} traspasos en el mundo. Los tienes en MERCADO.":
			"Dünyada {0} transfer. Hepsi PIYASA ekranında.",
		"{0} traspasos en el mundo. El más caro: {1} a {2} por ${3}.":
			"Dünyada {0} transfer. En pahalısı: {1} → {2}, bedel ${3}.",
		"Fichaste por un club nuevo": "Yeni bir kulübe imza attın",
		"Te incorporas a {0}. Empiezas de cero en el vestuario.":
			"Yeni kulübün: {0}. Soyunma odasında sıfırdan başlıyorsun.",
		"tu nuevo club": "yeni kulübün",
		"Tu contrato terminó: eres AGENTE LIBRE":
			"Sözleşmen bitti: artık SERBEST OYUNCUSUN",
		"Eres agente libre": "Serbest oyuncusun",
		"Tu contrato terminó. Elige tu próximo club.":
			"Sözleşmen bitti. Bir sonraki kulübünü seç.",
		"Firmaste como agente libre": "Serbest oyuncu olarak imzaladın",
		"Fichas por {0} sin traspaso.": "{0} kulübüne bonservissiz imza atıyorsun.",
		"Fin de la cesión: vuelves a {0}": "Kiralık bitti: {0} kulübüne dönüyorsun",
		"Renovaste tu contrato": "Sözleşmeni uzattın",
		"Sigues en {0}: {1} {2} más.": "{0} kulübünde devam: {1} {2} daha.",
		"No renuevas: al escaparate": "Uzatmıyorsun: vitrine çıktın",
		"El club te pone en venta para no perderte gratis. Si te quedas, jugarás menos.":
			"Kulüp seni bedavaya kaybetmemek için satışa çıkardı. Kalırsan daha az oynarsın.",
		"Sin destinos de cesión": "Kiralık seçeneği yok",
		"Ningún club menor te quiere cedido ahora mismo.":
			"Şu an hiçbir küçük kulüp seni kiralık istemiyor.",
		"Pediste salir cedido": "Kiralık gitmek istedin",
		"Clubes menores donde jugarías de titular. Elige en el MERCADO.":
			"İlk 11'de oynayacağın küçük kulüpler. PIYASA ekranında seç.",
		"Tu club quiere retenerte": "Kulübün seni tutmak istiyor",
		"{0} pone sobre la mesa una mejora de contrato para que te quedes.":
			"{0} kalman için masaya iyileştirilmiş bir sözleşme koydu.",
		"Tu club": "Kulübün",
		"Sin sitio en la selección de {0}": "{0} milli takımında yer yok",
		"Titular de {0}": "{0} ilk 11'inde",
		"Convocado con {0}": "{0} kadrosuna çağrıldın",
		"¡{0} se clasificó al Mundial!": "{0} Dünya Şampiyonası'na katılmayı garantiledi!",
		"{0} CAMPEÓN de la {1}… sin ti": "{0}, {1} ŞAMPIYONU… sen yokken",
		"{0}: {1} CAMPEÓN, y tú sin jugar un minuto": "{0}: {1} ŞAMPIYON oldu, sen tek dakika oynamadın",
		"{0} subcampeón de la {1} (sin ti)": "{0}, {1} ikincisi (sen yokken)",
		"{0}: {1} eliminada en {2} (sin ti)":
			"{0}: {1} elendi, tur: {2} (sen yokken)",
		"{0} sin ti": "{0}, sen yokken",
		"{0} se clasificó al Mundial (sin ti)":
			"{0} Dünya Şampiyonası'na katılmayı garantiledi (sen yokken)",
		"¡CAMPEÓN DEL MUNDO con {0}!": "{0} ile DUNYA ŞAMPIYONU!",
		"¡CAMPEÓN de la {0} con {1}!": "{1} ile {0} ŞAMPIYONU!",
		"Subcampeón de la {0} con {1}": "{1} ile {0} ikincisi",
		"{0}: eliminado en {1} con {2}": "{0}: {2} ile elendin, tur: {1}",
		"{0} con {1}": "{0} — {1} ile",
		"{0} se clasificó al Mundial": "{0} Dünya Şampiyonası'na katılmayı garantiledi",
		"{0} no fue al Mundial": "{0} Dünya Şampiyonası'na gidemedi",
		"Mundial sin ti: {0} de {1}": "Sensiz Dünya Şampiyonası: {1}, {0}",
		"{0} sin ti: {1} de {2}": "Sensiz {0}: {2}, {1}",
		"{0} no se clasificó al Mundial": "{0} Dünya Şampiyonası'na katılamadı",


		"natdieciseisavos": "son 32",
		"natoctavos": "son 16",
		"natcuartos": "çeyrek final",
		"natsemifinal": "yarı final",
		"natfinal": "final",
		"natfase de grupos": "grup aşaması",
		"natno clasificada": "katılamadı",
		"natcampeón": "şampiyon",
		"natsubcampeón": "ikinci",
		"natronda": "tur",
		"calluptitular": "ilk 11",
		"callupconvocado": "kadroda",
		"SUENA OTRO CLUB": "BIR KULUP ARADI",
		"ME INTERESARÍA": "ILGIMI ÇEKER",
		"ESTOY COMPROMETIDO AQUÍ": "BURADA MUTLUYUM",
		"DOS CLUBES PREGUNTAN": "IKI KULUP SORUYOR",
		"Te ponen el micro delante: {0} y {1} preguntan por ti. ¿A cuál te irías? Lo que"
		+ " digas lo oye tu técnico.":
			"Mikrofon önünde: {0} ve {1} seni soruyor. Hangisine giderdin? Hocan dinliyor.",
		"ME IRÍA A {0}": "{0}: GIDERDIM",
		"ME QUEDO EN {0}": "{0}: KALIYORUM",
		"LESIONADO": "Sakat",
		"Selección": "Ülke",
		"buzonMERCADO": "PIYASA",
		"¡LOGRO DESBLOQUEADO!": "BAŞARIM AÇILDI!",
		"¡ARQUETIPO DESBLOQUEADO!": "ARKETIP AÇILDI!",
		"¡RASGO DESCUBIERTO!": "HUY KEŞFEDILDI!",
		"TOCA PARA CONTINUAR": "DEVAM IÇIN DOKUN",
		"REGATEA Y REMATA": "ÇALIM AT VE VUR",
		"Puedes tirar ya. O jala desde dentro del círculo para conducir, vuelve al círculo y paras en seco: ahí apuntas con calma y tiras. Combinar regate y tiro es lo que abre a un defensa.": "Hemen şut çekebilirsin. Ya da top sürmek için çemberin içinden çek, çembere dön ve aniden dur: orada sakince nişan alıp vurursun. Çalım ve şutu birleştirmek defansı açar.",
		"MODO PASE": "PAS MODU",
		"Dentro del círculo, el mismo trazo es un pase. Jala hacia atrás y el balón sale hacia adelante, al compañero libre de la otra banda. Sin defensa encima, es la salida más segura.": "Çemberin içinde aynı hareket bir pastır. Geriye çek, top ileri, öbür kanattaki boştaki arkadaşına gider. Üstünde defans yoksa en güvenli çıkış budur.",
		"EL RELEVO": "DEVIR",
		"Si tu pase llega a un compañero fuera del área, pasas a jugar con él. Si cae dentro del área no hay control que valga: remata de primera.": "Pasın ceza sahası dışında bir arkadaşına ulaşırsa onunla oynamaya geçersin. Ceza sahasının içine düşerse kontrol yok: ilk vuruşta bitirir.",
		"LA PANTALLA DE GOLPEO": "VURUŞ EKRANI",
		"Soltaste la resortera: ahora eliges dónde tocar el balón. La costura marca el centro: ahí sale tenso. Cuanto más abajo la toques, más lo elevas; cuanto más al borde, menos potencia.": "Sapanı bıraktın: şimdi topa nereden vuracağını seçiyorsun. Dikiş merkezi gösterir: oradan vurursan top düz gider. Ne kadar alttan vurursan o kadar yükselir; kenara yaklaştıkça güç azalır.",

		"Primera Mudanza": "İlk Taşınma",
		"Subir de casa por primera vez.": "Evini ilk kez büyüt.",
		"Vida Acomodada": "Rahat Hayat",
		"Llegar a vivir en una casa moderna.": "Modern bir evde yaşamaya başla.",
		"La Mansión": "Malikane",
		"Llegar a vivir en una mansión.": "Bir malikanede yaşamaya başla.",
		"Hogar, Dulce Hogar": "Evim Evim Güzel Evim",
		"Amueblar tu casa con 10 adiciones.": "Evini 10 eklentiyle döşe.",
		"La Finca": "Çiftlik Evi",
		"Llegar a vivir en una finca.": "Bir çiftlik evinde yaşamaya başla.",
		"Casa Llena": "Dolu Ev",
		"Amueblar tu casa con 40 adiciones.": "Evini 40 eklentiyle döşe.",
		"La Casa Soñada": "Hayalindeki Ev",
		"Amueblar tu casa con 80 adiciones.": "Evini 80 eklentiyle döşe.",


		"Hacer 10 puntos en la maquinita de tu casa.": "Evindeki atari makinesinde 10 puan yap.",
		"Serpiente Legendaria": "Efsanevi Yılan",
		"¡TE TOCAN LAS LISAS!": "DUZ TOPLAR SENDE!",
		"¡TE TOCAN LAS RAYADAS!": "ÇIZGILILER SENDE!",
		"Bullseye": "Tam İsabet",
		"Clavar un dardo en el mero centro de la diana.": "Dart tahtasının tam ortasına bir ok sapla.",
		"Ganar cinco retos de billar al vestuario en tu casa.":
			"Evinde takım arkadaşlarına karşı beş bilardo düellosu kazan.",

		"Buen Pulso": "Sağlam El",
		"Hacer 200 puntos en la diana de tu casa.": "Evindeki dart tahtasında 200 puan yap.",
		"Mano de Seda": "İpek El",
		"Hacer 320 puntos en la diana de tu casa.": "Evindeki dart tahtasında 320 puan yap.",
		"Nueve Dardos": "Dokuz Ok",
		"Hacer 400 puntos en la diana de tu casa.": "Evindeki dart tahtasında 400 puan yap.",
		"La Mirada del Míster": "Hocanın Bakışı",
		"Llegar a cien dominadas en el banquillo.": "Yedek kulübesinde topu yüz kez sektir.",
		"Compañero de Vestuario": "Takım Arkadaşı",
		"Agregar a tu primer amigo.": "İlk arkadaşını ekle.",
		"La Peña": "Ekip",
		"Tener 5 amigos.": "5 arkadaşın olsun.",
		"Hinchada Propia": "Kendi Taraftarın",
		"Tener 10 amigos.": "10 arkadaşın olsun.",
		"Sin Fronteras": "Sınır Yok",
		"El Mejor del Grupo": "Grubun En İyisi",
		"Ser primero en LEGADO entre al menos 3 amigos.": "En az 3 arkadaş arasında LEGACY'de birinci ol.",
		"Bola Ocho": "Sekiz Top",
		"Ganar tu primera partida de billar en casa.": "Evinde ilk bilardo oyununu kazan.",
		"Mesa Limpia": "Temiz Masa",
		"Ganar una partida de billar sin que el rival meta una sola bola.":
			"Rakibin tek top sokamadan bir bilardo oyunu kazan.",
		"El Dueño de la Casa": "Evin Efendisi",
		"Ganaste cinco retos al vestuario en tu casa, entre la diana y la mesa.": "Evinde dart ve bilardoda soyunma odasına karşı beş düello kazandın.",
		"Hacer 50 puntos en la maquinita de tu casa.": "Evindeki atari makinesinde 50 puan yap.",
		"Graduado de la Academia": "Akademi Mezunu",
		"Completar el entrenamiento de la Academia.": "Akademi antrenmanını tamamla.",
		"Ocho Años":
			"Sekiz Yıl",
		"Ocho temporadas con la misma persona.":
			"Aynı kişiyle sekiz sezon.",
		"Media Naranja": "Hayat Arkadaşı",
		"Formalizar una relación.": "Bir ilişkiyi resmileştir.",
		"Vitrina Dorada": "Altın Vitrin",
		"Desbloquear todos los logros épicos.": "Tüm epik başarımların kilidini aç.",
		"¡Corten!": "Kestik!",
		"Tumbar a un camarógrafo de un balonazo.": "Kontrolsüz bir şutla bir kameramanı yere ser.",


		"¡Plumas!": "Tüyler!",
		"Alcanzar a una paloma del campo de un balonazo.": "Kontrolsüz bir şutla sahadaki güvercinlerden birini vur.",


		"¡Agua Va!": "Her Yer Su!",
		"Reventar una cabeza de riego de un balonazo y que escupa torcida el resto del partido.":
			"Bir şutla fıskiye başlığını kır, maçın geri kalanında yana doğru su püskürtsün.",
		"¡Remojón!": "Sırılsıklam!",
		"Tirarle la bebida a diez aficionados con balones que se van a la grada.":
			"Tribüne giden toplarla on taraftarın içeceğini dök.",


		"¡Ahí Va la Bandeja!": "Yemek Gitti!",
		"Tumbarle la bandeja de comida al vendedor de la grada de un balonazo.":
			"Kontrolsüz bir şutla tribündeki satıcının yemek tepsisini düşür.",
		"¡LE TIRASTE LA COMIDA AL VENDEDOR!":
			"SATICININ YEMEGINI UÇURDUN!",
		"Le Callaste la Boca": "Sustun mu Şimdi?",
		"Marcar después de que te abucheen desde la grada, en el mismo partido.":
			"Tribünden yuhalandıktan sonra aynı maçta gol at.",
		"Ese Balón No Vuelve": "O Top Gitti",
		"Mandar un balón a la calle en un campo sin nada detrás del arco.":
			"Kalenin arkasında hiçbir şey olmayan bir sahada topu sokağa yolla.",
		"Cesión al Portero": "Kaleciye Geri Pas",
		"Pasarle el balón a tu propio portero en vez de tirar a puerta.":
			"Şut çekmek yerine topu kendi kalecine geri ver.",
		"¡A por agua!": "Su Molası!",
		"Tirar las botellas de agua del portero de un balonazo.":
			"Kontrolsüz bir şutla kalecinin su şişelerini devir.",
		"La mano del derbi": "Derbi El Sıkışması",
		"Descubrir el apretón de manos de los técnicos al acabar un derbi.":
			"Derbi sonunda teknik direktörlerin el sıkışmasını keşfet.",
		"Mano de hierro": "Demir Pençe",
		"Ganarle el apretón de manos al técnico rival al acabar un derbi.":
			"Derbi sonunda rakip hocayla el sıkışmayı kazan.",
		"¡Una foto y me voy!": "Bir Fotoğraf Yeter!",
		"Un aficionado salta al campo en una final para tomarse una foto contigo.":
			"Bir finalde bir taraftar seninle fotoğraf çektirmek için sahaya giriyor.",
		"¡Cristales!": "Kırık Cam!",
		"Reventar el cristal de un palco de un balonazo.": "Kontrolsüz bir şutla bir locanın camını kır.",
		"Sin Piedad con el Chaval": "Çocuğa Acıma Yok",
		"Tumbar al recogepelotas de un balonazo.": "Kontrolsüz bir şutla top toplayıcı çocuğu yere ser.",
		"De Espaldas a la Copa": "Kupaya Sırtını Dön",
		"Perder una final y ver al rival levantar el título.": "Bir finali kaybet ve rakibin kupayı kaldırışını izle.",

		"{0} decidió la final. Su nombre se queda contigo.": "Finali {0} belirledi. O ismi unutmayacaksın.",
		"{0} metió el penalti que decidió la final. Su nombre se queda contigo.":
			"Finali belirleyen penaltıyı {0} attı. O ismi unutmayacaksın.",
		"{0} paró el penalti que decidió la final. Su nombre se queda contigo.":
			"Finali belirleyen penaltıyı {0} kurtardı. O ismi unutmayacaksın.",
		"REVANCHA · TEMPORADA {0}": "ROVANŞ · SEZON {0}",
		"{0} te quitó la final de la temporada {1} ({2}). Esta noche los que miran son ellos.":
			"{1} sezonunda finali senden {0} aldı ({2}). Bu gece izleyen taraf onlar.",
		"Final vengada en la temporada {0}": "{0} sezonunda finalin rövanşı alındı",
		"Te ganó la final de la temporada {0}": "{0} sezonu finalinde seni yendi",
		"Revancha": "Rövanş",
		"Ganar una final al club que te quitó otra.":
			"Senden bir final alan kulübe karşı bir final kazan.",
		"Tres Pases, Tres Goles": "Üç Pas, Üç Gol",
		"Darle tres asistencias al mismo compañero en un partido.": "Bir maçta aynı arkadaşına üç asist yap.",
		"Un Balón Cada Uno": "Herkese Bir Top",
		"Hacer hat-trick en el partido en que le das tres asistencias al mismo compañero.": "Aynı arkadaşına üç asist yaptığın maçta hat-trick yap.",
		"Piel Nueva": "Yeni Forma",
		"Ver la presentación de las equipaciones de la temporada.": "Sezonun forma tanıtımını izle.",
		"Primer Gol": "İlk Gol",


		"El Año Perfecto": "Kusursuz Yıl",
		"En PRIMERA y en una sola temporada: liga, copa y Champions, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de la Champions.":
			"UST LIGDE ve tek sezonda: lig, kupa ve Elit Kupası, artı Yılın Oyuncusu, lig MVP'si ve gol krallığı, Elit Kupası MVP'si ve gol krallığı.",
		"De la Camilla al Gol": "Sedyeden Gole",
		"Volver de una lesión grave y marcar en tu regreso.":
			"Ağır bir sakatlıktan dön ve dönüş maçında gol at.",
		"Marcar tu primer gol.": "İlk golünü at.",
		"Marcar rematando un córner.": "Korner sonrası gol at.",
		"Marcar directo desde el córner, sin que nadie toque el balón.":
			"Topa kimse dokunmadan doğrudan kornerden gol at.",
		"Marcar un penal picado: cambiar a modo CENTRO antes de golpear.":
			"Aşırtma penaltı golü at: vurmadan önce ORTA moduna geç.",
		"Goleador": "Golcü",
		"10 goles en tu carrera.": "Kariyerinde 10 gol.",
		"Artillero": "Keskin Nişancı",
		"50 goles en tu carrera.": "Kariyerinde 50 gol.",
		"Centenario": "Yüzbaşı",
		"100 goles en tu carrera.": "Kariyerinde 100 gol.",
		"Killer": "Tetikçi",
		"250 goles en tu carrera.": "Kariyerinde 250 gol.",
		"Máquina de Goles": "Gol Makinesi",
		"500 goles en tu carrera.": "Kariyerinde 500 gol.",
		"Asistente": "Pasör",
		"Dar tu primera asistencia.": "İlk asistini yap.",
		"Cerebro": "Maestro",
		"100 asistencias en tu carrera.": "Kariyerinde 100 asist.",
		"Doblete": "Çifte Gol",
		"2 goles en un mismo partido.": "Bir maçta 2 gol.",
		"Hat-Trick": "Hat-Trick",
		"3 goles en un mismo partido.": "Bir maçta 3 gol.",
		"4 goles en un mismo partido.": "Bir maçta 4 gol.",
		"Manita": "Beşlik",
		"5 goles en un mismo partido.": "Bir maçta 5 gol.",
		"Sangre Fría": "Buz Gibi",
		"Marcar tu primer penalti.": "İlk penaltı golünü at.",
		"Especialista de Penales": "Penaltı Kralı",
		"25 penaltis marcados.": "25 penaltı golü.",
		"Maestro de la Falta": "Serbest Vuruş Ustası",
		"Marcar de tiro libre directo.": "Direkt serbest vuruştan gol at.",
		"El Muro No Existe": "Baraj mı? Ne Barajı?",
		"10 goles de tiro libre.": "Serbest vuruştan 10 gol.",
		"Jugada de Estrategia": "Ders Kitabı Duran Top",
		"Por Debajo": "Barajın Altından",
		"Marcar un tiro libre por debajo de la barrera.": "Barajın altından serbest vuruş golü at.",
		"Gol Olímpico": "Olimpik Gol",

		"Testarazo": "Füze Kafa",
		"Marcar de cabeza.": "Kafayla gol at.",
		"Sin Dejarla Caer": "Yere Düşürmeden",
		"Marcar de volea.": "Voleyle gol at.",
		"Chilena de Antología": "Tarihi Rövaşata",
		"Marcar de chilena.": "Rövaşatayla gol at.",
		"Perro en la Cancha": "Sahada Köpek",
		"Que un perro se meta en la cancha durante un partido tuyo.":
			"Maçlarından birinde sahaya bir köpek girsin.",
		"Marcaste de cabeza tras un córner.": "Kornerden kafayla gol attın.",
		"Campeón": "Şampiyon",
		"Ganar tu primera liga.": "İlk lig şampiyonluğunu kazan.",
		"Rey de Primera": "Üst Ligin Kralı",
		"Campeón de la máxima categoría.": "En üst lig şampiyonu.",
		"Subir de categoría.": "Bir üst lige çık.",
		"Copa en Vitrina": "Vitrinde Kupa",
		"Rey de Europa": "Avrupa'nın Kralı",
		"Ganar la Champions continental.": "Kıtasal Elit Kupası'nı kazan.",
		"Ganar el Mundial de Clubes.": "Kulüpler Dünya Şampiyonası'nı kazan.",
		"Noche Europea": "Avrupa Gecesi",
		"Marcar en un partido continental.": "Kıtasal bir maçta gol at.",
		"Orgullo Nacional": "Milli Gurur",
		"Marcar con tu selección.": "Milli takımında gol at.",
		"Asistencia Internacional": "Milli Asist",
		"Dar una asistencia con tu selección.": "Milli takımında asist yap.",
		"Héroe Mundialista": "Dünya Şampiyonası Kahramanı",
		"Marcar en el Mundial.": "Dünya Şampiyonası'nda gol at.",
		"Gloria Continental": "Kıtasal Zafer",
		"Ganar la Euro/Copa América con tu país.": "Ülkenle Avrupa/Güney Amerika Turnuvası'nı kazan.",
		"Ganar el Mundial con tu selección.": "Milli takımınla Dünya Şampiyonası'nı kazan.",
		"El Mejor del Mundo": "Dünyanın En İyisi",
		"Ganar el Balón de Oro.": "Yılın Oyuncusu ödülünü kazan.",
		"Tríada Dorada": "Altın Üçleme",
		"3 Balones de Oro.": "3 kez Yılın Oyuncusu.",
		"El Que Te Lo Quitó": "Ödülü Elinden Alan",
		"Quedar segundo en el Balón de Oro, justo detrás del ganador.": "Yılın Oyuncusu oylamasında kazananın hemen arkasında ikinci ol.",
		"Nivel Plata": "Gümüş Seviye",
		"Llegar a ser jugador de plata: media 65 en una carrera.":
			"Gümüş oyuncu ol: bir kariyerde 65 genel.",
		"Nivel Oro": "Altın Seviye",
		"Llegar a ser jugador de oro: media 75 en una carrera.": "Altın oyuncu ol: bir kariyerde 75 genel.",
		"Nivel Diamante": "Elmas Seviye",
		"Llegar a ser jugador de diamante: media 85 en una carrera.":
			"Elmas oyuncu ol: bir kariyerde 85 genel.",
		"Clase Mundial": "Dünya Klasında",
		"Media de habilidades de nivel élite (90).": "Elit seviye yetenek ortalaması (90).",
		"Actuación Perfecta": "Kusursuz Performans",
		"Un partido con nota 9.5 o más.": "9.5 veya üzeri notlu bir maç.",
		"¿El Mejor de la Historia?": "Tüm Zamanların En İyisi?",
		"Liga, copa, continental, Balón de Oro y goleo en una misma temporada.":
			"Aynı sezonda lig, kupa, kıtasal kupa, Yılın Oyuncusu ve gol krallığı.",
		"Trotamundos": "Gezgin",
		"Ganar liga con 3 clubes distintos.": "3 farklı kulüple lig şampiyonu ol.",
		"El Conquistador": "Fatih",
		"Ganar la 1ª división de las cinco grandes: España, Inglaterra, Italia, Alemania y Francia.":
			"Büyük beş ligin hepsini kazan: İspanya, İngiltere, İtalya, Almanya ve Fransa.",
		"La Vuelta al Mundo": "Dünya Turu",
		"Ganar la liga en 3 confederaciones distintas (Europa, América, Asia…).":
			"3 farklı konfederasyonda lig şampiyonu ol (Avrupa, Amerika, Asya…).",
		"Un Solo Amor": "Tek Aşk",
		"5 títulos de liga con un mismo club.": "Aynı kulüple 5 lig şampiyonluğu.",
		"Mi Único Amor": "Tek Kulüp Adamı",
		"Diez temporadas o más en el mismo club sin fichar nunca por otro; una cesión no lo rompe.":
			"Başka bir kulübe hiç imza atmadan aynı kulüpte on veya daha fazla sezon; kiralık bunu bozmaz.",
		"Uno Siempre Vuelve": "Eski Aşk Unutulmaz",
		"Volver a fichar por un club en el que ya hayas jugado antes.":
			"Daha önce oynadığın bir kulübe yeniden imza at.",
		"Dinastía": "Hanedan",
		"Ganar la liga 3 temporadas seguidas.": "Ligi üst üste 3 sezon kazan.",
		"Amo de Europa": "Avrupa'nın Hükümdarı",
		"Ganar la Champions con 3 clubes distintos.": "3 farklı kulüple Elit Kupası'nı kazan.",
		"Coleccionista de Títulos": "Kupa Koleksiyoncusu",







		"Ganar la Copa de Campeones continental.": "Kıtasal Elit Kupası'nı kazan.",
		"Ganar la Euro/Torneo Sudamericano con tu país.":
			"Ülkenle Avrupa/Güney Amerika Turnuvası'nı kazan.",
		"Ganar el Jugador del Año.": "Yılın Oyuncusu ödülünü kazan.",
		"3 Premios al Mejor.": "3 kez Yılın Oyuncusu.",
		"Liga, copa, continental, Jugador del Año y goleo en una misma temporada.": "Aynı sezonda lig, kupa, kıtasal kupa, Yılın Oyuncusu ve gol krallığı.",
		"Ganar la Copa de Campeones con 3 clubes distintos.": "3 farklı kulüple Elit Kupası'nı kazan.",
		"Ganar los seis grandes: liga, copa, Copa de Campeones, Mundial de Clubes, continental y Mundial.":
			"Altı büyük kupanın hepsini kazan: lig, kupa, Elit Kupası, Kulüpler Dünya Şampiyonası, kıtasal kupa ve Dünya Şampiyonası.",
		"Rey de Copa Europa": "Avrupa Kupası Kralı",
		"Ganar la Copa Europa.": "Avrupa Kupası'nı kazan.",
		"Rey de la Copa Conferencia": "Challenge Kupası Kralı",
		"Ganar la Copa Conferencia.": "Challenge Kupası'nı kazan.",
		"Ganar el Bota de la Liga.": "Lig gol krallığını kazan.",
		"Bota de la Copa de Campeones": "Elit Kupası Gol Kralı",
		"Ser el máximo goleador de la Copa de Campeones.": "Elit Kupası'nın gol kralı ol.",
		"Bota de la Copa Europa": "Avrupa Kupası Gol Kralı",
		"Ser el máximo goleador de la Copa Europa.": "Avrupa Kupası'nın gol kralı ol.",
		"Bota de la Copa Conferencia": "Challenge Kupası Gol Kralı",
		"Ser el máximo goleador de la Copa Conferencia.": "Challenge Kupası'nın gol kralı ol.",
		"Máximo asistente de la Copa de Campeones.": "Elit Kupası asist kralı.",
		"Cerebro de la Copa Europa": "Avrupa Kupası Oyun Kurucusu",
		"Máximo asistente de la Copa Europa.": "Avrupa Kupası'nın asist kralı.",
		"Máximo goleador de tu liga Y de la Copa de Campeones en la misma temporada.": "Aynı sezonda hem liginin HEM DE Elit Kupası'nın gol kralı.",
		"Ganar los seis grandes: liga, copa, Champions, Mundial de Clubes, continental y Mundial.":
			"Altı büyük kupanın hepsini kazan: lig, kupa, Elit Kupası, Kulüpler Dünya Şampiyonası, kıtasal kupa ve Dünya Şampiyonası.",
		"Leal de Corazón": "Yüreği Sadık",
		"500 partidos con un mismo club.": "Aynı kulüple 500 maç.",
		"Círculo Completo": "Tam Tur",
		"Retirarte en el club donde empezaste.": "Başladığın kulüpte emekli ol.",
		"Hasta el Final": "Sonuna Kadar",
		"Jugar hasta el final: que el calendario te retire a ti.": "Sonuna kadar oyna: seni takvim emekli etsin.",
		"Salir a Tiempo": "Zirvede Bırak",
		"El Cuerpo Dijo Basta": "Vücut Pes Etti",
		"Que una lesión grave de veterano te retire antes de tiempo.":
			"Kariyerinin sonlarında ağır bir sakatlık seni erken emekli etsin.",
		"Colgar las botas por decisión propia, antes de que te lo digan.":
			"Kimse söylemeden, kendi kararınla kramponları as.",
		"Leyenda del Club": "Kulüp Efsanesi",
		"Entrar al top 5 de leyendas de tu club.": "Kulübünün ilk 5 efsanesi arasına gir.",
		"Cara a Cara": "Yüz Yüze",
		"Entre los Grandes": "Büyüklerin Arasında",
		"Dejar atrás a 5 leyendas.": "5 efsaneyi geride bırak.",
		"Nombre Propio": "Kendi Adın",
		"Dejar atrás a 15 leyendas.": "15 efsaneyi geride bırak.",
		"Mejor de la Historia": "Tarihin En İyisi",
		"Nadie en la historia hizo más goles + asistencias de élite que tú.": "Tarihte hiç kimse senden fazla elit gol + asist yapmadı.",
		"Por Encima de Todos": "Hepsinin Üstünde",
		"En los Libros": "Tarihe Geçtin",
		"Batir tu primer récord histórico.": "İlk tarihi rekorunu kır.",
		"Hombre de Récords": "Rekor Adamı",
		"Batir 10 récords históricos.": "10 tarihi rekor kır.",
		"Dejar atrás a 30 leyendas de la historia.": "Tarihin 30 efsanesini geride bırak.",
		"Veterano": "Kıdemli",
		"100 partidos disputados.": "100 maç oynandı.",
		"Inoxidable": "Demir Adam",
		"300 partidos disputados.": "300 maç oynandı.",
		"Un Lustro": "5 Yıl",
		"5 temporadas completadas.": "5 sezon tamamlandı.",
		"Una Década": "10 Yıl",
		"10 temporadas completadas.": "10 sezon tamamlandı.",
		"Leyenda": "Efsane",
		"Alcanzar el escalón LEYENDA.": "EFSANE seviyesine ulaş.",
		"Inmortal": "Ölümsüz",
		"Alcanzar el escalón INMORTAL.": "OLUMSUZ seviyesine ulaş.",
		"Curtido en la Cantera": "Zor Yoldan Gelen",
		"Completar una temporada entera en Tercera División.": "3. Lig'de tam bir sezon tamamla.",
		"Veterano de Segunda": "2. Lig Kurdu",
		"Completar una temporada entera en Segunda División.": "2. Lig'de tam bir sezon tamamla.",
		"Bautizo en Primera": "Üst Lig Vaftizi",
		"Completar una temporada entera en Primera División.": "1. Lig'de tam bir sezon tamamla.",
		"Rey de Europa League": "Avrupa Kupası Kralı",
		"Ganar la Europa League.": "Avrupa Kupası'nı kazan.",
		"Pichichi": "Gol Kralı",
		"Ganar el Pichichi de la Liga.": "Lig gol krallığını kazan.",
		"bota_championsBota de la Champions": "Elit Kupası Gol Kralı",
		"Ser el máximo goleador de la Champions.": "Elit Kupası'nın gol kralı ol.",
		"bota_europaBota de la Europa League": "Avrupa Kupası Gol Kralı",
		"Ser el máximo goleador de la Europa League.": "Avrupa Kupası'nın gol kralı ol.",
		"Cerebro de la Liga": "Lig Oyun Kurucusu",
		"Máximo asistente de la Liga.": "Ligin asist kralı.",
		"Cerebro de Europa": "Elit Kupası Oyun Kurucusu",
		"Máximo asistente de la Champions.": "Elit Kupası asist kralı.",
		"nombre del logro max_asist_eulCerebro de la Europa League": "Avrupa Kupası Oyun Kurucusu",
		"Máximo asistente de la Europa League.": "Avrupa Kupası'nın asist kralı.",
		"COLISIÓN: misma clave ya existe en el dominio 'match' (trofeos) con este MISMO"
		+ " valor; se repite idéntica a propósitoBota de Oro del Mundial":
			"Dünya Şampiyonası Gol Kralı",
		"Máximo goleador del Mundial con tu selección.":
			"Milli takımınla Dünya Şampiyonası'nın gol kralı ol.",
		"Killer de la Liga": "Ligin Tetikçisi",
		"Ganar 3 veces el trofeo de máximo goleador de tu liga.": "Liginin gol krallığı ödülünü 3 kez kazan.",
		"'dueño del área' -> quien manda dentro del área; 'BOX' es el área en inglés"
		+ " británicoDueño del Area":
			"Ceza Sahası Kralı",
		"Ganar 5 veces el trofeo de máximo goleador de tu liga.": "Liginin gol krallığı ödülünü 5 kez kazan.",
		"El Que Reparte": "Pas Dağıtıcısı",
		"Ganar 3 veces el trofeo de máximo asistente de tu liga.": "Liginin asist krallığı ödülünü 3 kez kazan.",
		"Goleador Sin Fronteras": "Sınır Tanımayan Golcü",
		"Ser máximo goleador de la liga en 2 países distintos.":
			"2 farklı ülkede ligin gol kralı ol.",
		"el chiste: el gol se entiende en cualquier idiomaEl Gol No Entiende de"
		+ " Idiomas":
			"Golün Dili Yoktur",
		"Ser máximo goleador de la liga en 3 países distintos.":
			"3 farklı ülkede ligin gol kralı ol.",
		"cabeza de ambas tablas (goles y asistencias); 'Goals & Assists' no cabe en 13"
		+ " caracteresGoles y Pases":
			"İkisinde de Zirve",
		"Máximo goleador Y máximo asistente de tu liga en la misma temporada.":
			"Aynı sezonda liginin hem gol HEM DE asist kralı ol.",
		"Nadie Marca Más": "Senden Çok Atan Yok",
		"Máximo goleador de tu liga Y de la Champions en la misma temporada.":
			"Aynı sezonda hem liginin HEM DE Elit Kupası'nın gol kralı.",
		"Estrella del Partido": "Maçın Yıldızı",
		"Ser elegido Jugador del Partido.": "Maçın Oyuncusu seçil.",
		"jugador_mesJugador del Mes": "Ayın Oyuncusu",
		"Ganar el Jugador del Mes.": "Ayın Oyuncusu ödülünü kazan.",
		"Verdugo de España": "İspanya'nın Belası",
		"Vencer a todos los clubes de España (las tres divisiones).":
			"İspanya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Inglaterra": "İngiltere'nin Belası",
		"Vencer a todos los clubes de Inglaterra (las tres divisiones).":
			"İngiltere'deki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Italia": "İtalya'nın Belası",
		"Vencer a todos los clubes de Italia (las tres divisiones).":
			"İtalya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Alemania": "Almanya'nın Belası",
		"Vencer a todos los clubes de Alemania (las tres divisiones).":
			"Almanya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Francia": "Fransa'nın Belası",
		"Vencer a todos los clubes de Francia (las tres divisiones).":
			"Fransa'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Portugal": "Portekiz'in Belası",
		"Vencer a todos los clubes de Portugal (las tres divisiones).":
			"Portekiz'deki tüm kulüpleri yen (üç ligin hepsi).",
		"'Holland' porque 'the Netherlands' se pasa del ancho del español en la fila"
		+ " del logroVerdugo de Países Bajos":
			"Hollanda'nın Belası",
		"Vencer a todos los clubes de Países Bajos (las tres divisiones).":
			"Hollanda'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Bélgica": "Belçika'nın Belası",
		"Vencer a todos los clubes de Bélgica (las tres divisiones).":
			"Belçika'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Turquía": "Türkiye'nin Belası",
		"Vencer a todos los clubes de Turquía (las tres divisiones).":
			"Türkiye'deki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Argentina": "Arjantin'in Belası",
		"Vencer a todos los clubes de Argentina (las tres divisiones).":
			"Arjantin'deki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Brasil": "Brezilya'nın Belası",
		"Vencer a todos los clubes de Brasil (las tres divisiones).":
			"Brezilya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de México": "Meksika'nın Belası",
		"Vencer a todos los clubes de México (las tres divisiones).":
			"Meksika'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Estados Unidos": "ABD'nin Belası",
		"Vencer a todos los clubes de Estados Unidos (las tres divisiones).":
			"ABD'deki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Arabia Saudí": "Suudi Arabistan'ın Belası",
		"Vencer a todos los clubes de Arabia Saudí (las tres divisiones).":
			"Suudi Arabistan'daki tüm kulüpleri yen (üç ligin hepsi).",

		"Verdugo de Escocia": "İskoçya'nın Belası",
		"Vencer a todos los clubes de Escocia (las tres divisiones).":
			"İskoçya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Grecia": "Yunanistan'ın Belası",
		"Vencer a todos los clubes de Grecia (las tres divisiones).":
			"Yunanistan'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Ucrania": "Ukrayna'nın Belası",
		"Vencer a todos los clubes de Ucrania (las tres divisiones).":
			"Ukrayna'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Austria": "Avusturya'nın Belası",
		"Vencer a todos los clubes de Austria (las tres divisiones).":
			"Avusturya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Suiza": "İsviçre'nin Belası",
		"Vencer a todos los clubes de Suiza (las tres divisiones).":
			"İsviçre'deki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Chequia": "Çekya'nın Belası",
		"Vencer a todos los clubes de Chequia (las tres divisiones).":
			"Çekya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Croacia": "Hırvatistan'ın Belası",
		"Vencer a todos los clubes de Croacia (las tres divisiones).":
			"Hırvatistan'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Serbia": "Sırbistan'ın Belası",
		"Vencer a todos los clubes de Serbia (las tres divisiones).":
			"Sırbistan'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Dinamarca": "Danimarka'nın Belası",
		"Vencer a todos los clubes de Dinamarca (las tres divisiones).":
			"Danimarka'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Noruega": "Norveç'in Belası",
		"Vencer a todos los clubes de Noruega (las tres divisiones).":
			"Norveç'teki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Japón": "Japonya'nın Belası",
		"Vencer a todos los clubes de Japón (las tres divisiones).":
			"Japonya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Corea del Sur": "Güney Kore'nin Belası",
		"Vencer a todos los clubes de Corea del Sur (las tres divisiones).":
			"Güney Kore'deki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Colombia": "Kolombiya'nın Belası",
		"Vencer a todos los clubes de Colombia (las tres divisiones).":
			"Kolombiya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Chile": "Şili'nin Belası",
		"Vencer a todos los clubes de Chile (las tres divisiones).":
			"Şili'deki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Uruguay": "Uruguay'ın Belası",
		"Vencer a todos los clubes de Uruguay (las tres divisiones).":
			"Uruguay'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Paraguay": "Paraguay'ın Belası",
		"Vencer a todos los clubes de Paraguay (las tres divisiones).":
			"Paraguay'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Ecuador": "Ekvador'un Belası",
		"Vencer a todos los clubes de Ecuador (las tres divisiones).":
			"Ekvador'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Perú": "Peru'nun Belası",
		"Vencer a todos los clubes de Perú (las tres divisiones).":
			"Peru'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Bolivia": "Bolivya'nın Belası",
		"Vencer a todos los clubes de Bolivia (las tres divisiones).":
			"Bolivya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Venezuela": "Venezuela'nın Belası",
		"Vencer a todos los clubes de Venezuela (las tres divisiones).":
			"Venezuela'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Egipto": "Mısır'ın Belası",
		"Vencer a todos los clubes de Egipto (las tres divisiones).":
			"Mısır'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Marruecos": "Fas'ın Belası",
		"Vencer a todos los clubes de Marruecos (las tres divisiones).":
			"Fas'taki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Túnez": "Tunus'un Belası",
		"Vencer a todos los clubes de Túnez (las tres divisiones).":
			"Tunus'taki tüm kulüpleri yen (üç ligin hepsi).",
		"Verdugo de Nueva Zelanda": "Yeni Zelanda'nın Belası",
		"Vencer a todos los clubes de Nueva Zelanda (las tres divisiones).":
			"Yeni Zelanda'daki tüm kulüpleri yen (üç ligin hepsi).",
		"Némesis del Mundo": "Dünyanın Belası",
		"Vencer a TODOS los clubes del juego: cada liga, cada división. La cima del hardcore.":
			"Oyundaki TUM kulüpleri yen: her lig, her kademe. Hardcore'un zirvesi.",
		"Nuevo Fichaje": "Yeni Transfer",
		"Ser presentado ante tu nueva afición por primera vez.": "Yeni taraftarlarına ilk kez tanıtıl.",
		"Diez Mil Curiosos": "10.000 Meraklı",
		"10.000 personas fueron a tu presentación.":
			"İmza törenine 10.000 kişi geldi.",
		"No Cabe Un Alma": "İğne Atsan Düşmez",
		"Llenar el estadio el día de tu presentación, sin haber jugado un solo minuto.":
			"Tek dakika oynamadan imza töreninde stadı doldur.",
		"'Forty Thousand' (14) se pasa del español (12); el número mantiene el"
		+ " anchoCuarenta Mil":
			"40.000 Taraftar",
		"40.000 personas fueron a verte firmar.": "İmzanı izlemeye 40.000 kişi geldi.",
		"Fichaje Galáctico": "Galaktik Transfer",
		"Que 65.000 personas vayan a tu presentación. Dejar de ser un jugador para ser una noticia.":
			"İmza törenine 65.000 kişi çek. Oyuncu olmaktan çık, manşet ol.",
		"Ochenta Mil Almas": "80.000 Can",
		"Que 80.000 personas llenen el estadio SÓLO para verte llegar. Ni un partido, ni un gol: tu nombre.":
			"Stadı SADECE gelişini izlemek için 80.000 kişiyle doldur. Ne maç ne gol: senin adın.",
		"Siempre Te Esperan": "Hep Seni Beklerler",
		"Llenar el estadio en TRES presentaciones distintas.": "UÇ farklı imza töreninde stadı doldur.",


		"Rompelíneas": "Hat Kıran",
		"Ganar tu primer regate.": "İlk çalımını kazan.",
		"Bailarín": "Dansçı",
		"25 regates ganados.": "25 çalım kazanıldı.",
		"Imparable": "Durdurulamaz",
		"100 regates ganados.": "100 çalım kazanıldı.",
		"Agónico": "Son Nefes",
		"Marcar en el minuto 85 o después.": "85. dakikada veya sonrasında gol at.",
		"Rey del Descuento": "Uzatmaların Kralı",
		"10 goles del minuto 85 en adelante.": "85. dakikadan sonra 10 gol.",
		"Noche de Remontada": "Geri Dönüş Gecesi",
		"Ganar un partido en el que llegues a ir perdiendo por 2 goles.":
			"2 farklı geriye düştüğün bir maçı kazan.",
		"Orgullo de la Ciudad": "Şehrin Gururu",
		"Ganar tu primer derbi.": "İlk derbini kazan.",
		"El Gol que Vale Doble": "Çift Değerli Gol",
		"Marcar en un derbi.": "Bir derbide gol at.",
		"Rey del Derbi": "Derbi Kralı",
		"Ganar 5 derbis.": "5 derbi kazan.",
		"Millonario": "Milyoner",
		"Juntar 1.000.000 en el banco.": "Bankada 1.000.000 biriktir.",
		"Magnate": "Patron",
		"Juntar 10.000.000 en el banco.": "Bankada 10.000.000 biriktir.",
		"Imagen de Marca": "Marka Yüzü",
		"Firmar tu primer contrato de patrocinio.": "İlk sponsorluk sözleşmeni imzala.",
		"Hombre Anuncio": "Reklam Panosu",
		"Firmar 10 contratos de patrocinio.": "10 sponsorluk sözleşmesi imzala.",
		"Vida de Futbolista": "Futbolcu Hayatı",
		"Comprar tu primer artículo de estilo de vida.": "İlk yaşam tarzı ürününü satın al.",
		"Inversor": "Yatırımcı",
		"Hacer tu primera inversión.": "İlk yatırımını yap.",
		"Hombre del Vestuario": "Soyunma Odasının Adamı",
		"Responder 25 decisiones.": "25 karar ver.",
		"La Voz del Equipo": "Takımın Sesi",
		"Responder 100 decisiones.": "100 karar ver.",
		"Vía Bosman": "Bosman Yolu",
		"Firmar por un club siendo agente libre, sin traspaso de por medio.":
			"Bonservis bedeli olmadan, serbest oyuncu olarak bir kulübe imza at.",
		"Nunca te Enamores de un Cedido": "Kiralığa Aşık Olma",
		"Ser elegido Mejor Jugador del Club en el equipo donde juegas cedido.": "Kiralık oynadığın takımda Sezonun Kulüp Oyuncusu seçil.",
		"Ida y Vuelta": "Git Gel",
		"Completar una cesión entera y volver a tu club.": "Bir kiralık dönemini tamamla ve kulübüne dön.",
		"Pasaporte Sellado": "Damgalı Pasaport",
		"Jugar en clubes de 3 países distintos.": "3 farklı ülkede kulüplerde oyna.",
		"Ciudadano del Mundo": "Dünya Vatandaşı",
		"Jugar en clubes de 5 países distintos.": "5 farklı ülkede kulüplerde oyna.",
		"Segunda Vida": "İkinci Hayat",
		"Cerrar una carrera entera (hasta el retiro) con un modificador de Nueva Carrera+ activo.":
			"Yeni Kariyer+ değiştiricisi açıkken bütün bir kariyeri (emekliliğe kadar) tamamla.",
		"Primera Vitrina": "İlk Vitrin",
		"Desbloquear todos los logros comunes.": "Tüm sıradan başarımların kilidini aç.",
		"Vitrina Azul": "Mavi Vitrin",
		"Desbloquear todos los logros raros.": "Tüm nadir başarımların kilidini aç.",
		"título (sale en 2 entradas: entrevista y plato_o_descanso)TE QUIEREN EN EL"
		+ " PLATÓ":
			"TV SENI ISTIYOR",
		"La televisión te invita a la entrevista de la semana. Media tarde de foco,"
		+ " preguntas y sonrisas.":
			"Televizyon seni haftanın büyük röportajına çağırıyor. Yarım öğleden sonra ışık, soru ve gülümseme.",
		"ACUDIR": "VARIM",
		"PLANTARLES": "GITMIYORUM",
		"ACTO DE TU PATROCINADOR": "SPONSOR ETKINLIGI",
		"Tu marca monta una firma de autógrafos y te quiere ahí. Pagan aparte, pero es"
		+ " un día entero.":
			"Markan bir imza günü düzenliyor ve seni orada istiyor. Ayrıca ödüyorlar ama koca bir gün gidiyor.",
		"IR AL ACTO": "GIDERIM",
		"también en benefico_ciudad (línea 276, fuera de mi rango)EXCUSARTE":
			"GELEMEM",

		"LA HUELGA DE PRIMAS": "PRIM GREVI",
		"El club debe tres meses de primas y la plantilla ha decidido no salir a"
		+ " calentar. El míster está en el túnel mirando el reloj, y hay una cámara en"
		+ " la boca del vestuario.":
			"Kulüp üç aylık prim borçlu ve kadro ısınmaya çıkmama kararı aldı. Hoca tünelde saate bakıyor ve soyunma odasının kapısında bir kamera var.",
		"SUMARTE AL PARO": "GREVE KATIL",
		"SALIR A CALENTAR SOLO": "TEK BAŞINA ISIN",
		"LA FINAL ES EL SÁBADO": "FINAL CUMARTESI",
		"El parte médico dice que no llegas. El míster te lo pide a la cara, delante"
		+ " del cuerpo técnico, y el doctor niega con la cabeza sin decir nada.":
			"Sağlık raporu yetişemeyeceğini söylüyor. Hoca teknik ekibin önünde yüzüne soruyor, doktor tek kelime etmeden başını sallıyor.",
		"APRETAR LOS DIENTES": "DIŞINI SIK",
		"HACERLE CASO AL MÉDICO": "DOKTORU DINLE",
		"Aguantaste: estás disponible para el partido grande.":
			"Dayandın: büyük maç için hazırsın.",
		"Se rompió del todo. La baja es larga.":
			"Tamamen koptu. Uzun süre yoksun.",
		"EL EQUIPO VIAJA SIN TI": "TAKIM SENSIZ GIDIYOR",
		"El autobús sale a las nueve y tu nombre no está en la lista. El doctor dice"
		+ " que el viaje no te hace bien; el vestuario, que verte en el banquillo les"
		+ " hace bien a ellos.":
			"Otobüs dokuzda kalkıyor ve adın listede yok. Doktor yolculuğun sana iyi gelmeyeceğini söylüyor; soyunma odası ise seni yedek kulübesinde görmenin onlara çok iyi geleceğini.",
		"VIAJAR CON LA EXPEDICIÓN": "KAFILEYLE GIT",
		"QUEDARTE EN REHABILITACIÓN": "REHABDE KAL",
		"EL PARTE QUE SE FILTRÓ": "SIZAN SAGLIK RAPORU",
		"Un diario publica tu parte médico con dos semanas de más y un titular con la"
		+ " palabra «calvario». El club no fue; alguien de dentro, sí.":
			"Bir gazete sağlık raporunu iki hafta fazlasıyla ve içinde «çile» kelimesi geçen bir manşetle yayımladı. Sızdıran kulüp değil; içeriden biri.",
		"DESMENTIRLO A CÁMARA": "KAMERADA YALANLA",
		"CALLAR Y RECUPERARTE": "SUS VE IYILEŞ",
		"EL MÉDICO DE TU AGENTE": "MENAJERININ DOKTORU",
		"Tu agente te manda la tarjeta de un doctor «que hace milagros» y que no es"
		+ " del club. El médico del club no sabe nada, y mejor que siga así.":
			"Menajerin sana «mucize yaratan» ve kulüpten olmayan bir doktorun kartını yolluyor. Kulüp doktorunun haberi yok, öyle kalsa iyi olur.",
		"PROBAR EL TRATAMIENTO": "TEDAVIYI DENE",
		"CONFIAR EN EL CLUB": "KULUBE GUVEN",
		"El milagro existe: dos semanas menos de baja.":
			"Mucize gerçek: sakatlığın iki hafta kısaldı.",
		"Se rompió del todo. Y el club se enteró de dónde.":
			"Tamamen koptu. Kulüp de nerede olduğunu öğrendi.",
		"CABE UNO MÁS SI TE BAJAS": "INDIRIM YAPARSAN YER VAR",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la nómina: el"
		+ " tuyo. Te piden por las buenas un 20% de tu ficha, y el vestuario ya sabe"
		+ " que te lo han pedido.":
			"Kulüp bir süper yıldızla neredeyse anlaştı, maaş bordrosunda yer lazım: seninki. Kibarca maaşından %20 indirim istiyorlar ve soyunma odası bunu çoktan biliyor.",
		"BAJARTE EL SUELDO": "INDIRIMI KABUL ET",
		"NI UN PESO": "KURUŞ YOK",
		"Te bajas la ficha": "Maaşında indirime gittin",
		"Cobrarás ${0} por partido en vez de ${1}. El club ya tiene su hueco.":
			"Maç başı ${1} yerine ${0} alacaksın. Kulüp ihtiyacı olan yeri buldu.",
		"EL BANDO DEL BRAZALETE": "KAPTANLIK SAFLARI",
		"{0} está señalado y el vestuario busca relevo. Suenan dos nombres: el tuyo y"
		+ " el del veterano que lleva once años aquí.":
			"{0} hedefte ve soyunma odası yerine birini arıyor. İki isim konuşuluyor: seninki ve on bir yıldır burada olan kıdemlinin.",


		"MOVER FICHA POR EL BRAZALETE": "BANT IÇIN BASTIR",
		"LA ENTRADA EN EL ENTRENO": "ANTRENMANDA MUDAHALE",
		"Fuiste a por un balón que no era tuyo y {0}, el que te disputa el puesto, se"
		+ " ha ido al vestuario cojeando y sin mirarte. El grupo lo vio todo.":
			"Senin olmayan bir topa daldın ve forma için yarıştığın {0}, sana bakmadan topallayarak soyunma odasına gitti. Grup her şeyi gördü.",
		"PEDIR PERDÓN DELANTE DE TODOS": "HERKESIN ONUNDE OZUR DILE",
		"NO DAR EXPLICACIONES": "KIMSEYE AÇIKLAMA YAPMA",
		"EL CHAVAL TE COMIÓ EL PUESTO": "VELET FORMANI KAPTI",
		"{0} entró por ti y volvió a hacerlo bien. Te busca al acabar para que le"
		+ " corrijas dos cosas del perfil de tiro. Enseñárselas es enseñárselas.":
			"{0} senin yerine girdi ve yine iyi oynadı. Maçtan sonra şut tekniğindeki iki şeyi düzeltmen için seni buluyor. Ona öğretmek, onu silahlandırmak demek.",

		"SE ROMPIÓ EL QUE TE PELEA EL PUESTO": "RAKIBIN SAKATLANDI",
		"{0} se rompió en el entreno y el puesto es tuyo hasta nuevo aviso. El vestuario mira a ver qué cara pones.":
			"{0} antrenmanda sakatlandı ve forma şimdilik senin. Soyunma odası yüzünün ifadesine bakıyor.",
		"LLEVARLE LA REHABILITACIÓN": "REHABINE SEN EŞLIK ET",
		"APROVECHAR EL HUECO": "FIRSATI DEGERLENDIR",
		"EL CAPITÁN TE SIENTA": "KAPTAN SENI ÇAGIRIYOR",
		"{0} te aparta antes del entreno con el brazalete en la mano: dice que el grupo"
		+ " está harto de tu forma de celebrar, y que te lo dice él antes de que te lo"
		+ " diga otro.":
			"Kaptan {0}, antrenmandan önce elinde kaptanlık bandıyla seni kenara çekiyor: takım gol sevinçlerinden bıkmış, bunu sana başkası söylemeden kendisi söylemek istiyor.",
		"BAJAR LA CABEZA": "SESINI ÇIKARMA",
		"CONTESTARLE DELANTE DE TODOS": "HERKESIN ONUNDE KARŞILIK VER",

		"LA VUELTA AL CAMPO": "ŞEREF TURU",
		"Campeón. La copa pesa de verdad y el estadio no se va a ir a ninguna parte."
		+ " Queda una vuelta al campo y todos esperan que se la des a alguien.":
			"Şampiyon. Kupa gerçekten ağır ve stadyum hiçbir yere gitmiyor. Bir şeref turu kaldı ve herkes onu birine armağan etmeni bekliyor.",
		"LEVANTARLA ANTE EL FONDO": "TRIBUNE KALDIR",
		"QUE LA LEVANTE EL GRUPO": "TAKIM KALDIRSIN",
		"LLEVÁRSELA AL MÍSTER": "HOCAYA GOTUR",
		"LA CIUDAD ESTÁ EN LA CALLE": "ŞEHIR SOKAKLARA DOKULDU",
		"Ascenso. Hay gente en la avenida desde antes de que acabara el partido, un"
		+ " autobús descapotable esperando y un micrófono que va a llegar a todas"
		+ " las casas.":
			"Üst lig. Daha maç bitmeden caddeye insanlar dolmuştu; bekleyen bir üstü açık otobüs ve şehirdeki her eve ulaşacak bir mikrofon var.",
		"PROMETER QUE TE QUEDAS": "KALACAGINA SOZ VER",
		"NOMBRAR UNO A UNO AL VESTUARIO": "TAKIMI TEK TEK SAY",
		"PEDIR REFUERZOS EN DIRECTO": "CANLI YAYINDA TAKVIYE ISTE",
		"EL MEJOR DEL MUNDO": "DUNYANIN EN IYISI",
		"Jugador del Año. Estás de pie con el trofeo en la mano, la sala en silencio y"
		+ " treinta segundos que se van a repetir el resto de tu carrera.":
			"Yılın Oyuncusu. Elinde kupayla ayaktasın, salon sessiz ve kariyerin boyunca tekrar tekrar izlenecek otuz saniye var.",
		"A LOS QUE TE PASAN EL BALÓN": "BANA PAS ATANLARA",
		"A LA GENTE QUE TE VIO EMPEZAR": "BAŞLADIGIMI GORENLERE",
		"AL CAMINO QUE TE TRAJO AQUÍ": "BENI BURAYA GETIREN YOLA",
		"EL MEJOR DE LA TEMPORADA": "SEZONUN OYUNCUSU",
		"Te dan el premio al mejor del año y hay que decir algo. La sala está llena"
		+ " de gente que decide cosas sobre ti: tu club, tu competición y los que"
		+ " escriben.":
			"Sana yılın oyuncusu ödülünü veriyorlar ve bir şey söylemen gerek. Salon senin hakkında karar veren insanlarla dolu: kulübün, ligin ve yazanlar.",
		"HABLAR DEL EQUIPO QUE TE SOSTUVO": "ARKANDAKI TAKIMDAN BAHSET",
		"AGRADECER AL MÍSTER QUE TE PUSO": "SENI OYNATAN HOCAYA TEŞEKKUR ET",
		"DEDICÁRSELO A LA GRADA": "TRIBUNLERE ARMAGAN ET",

		"LA CIUDAD ES TUYA": "ŞEHIR SENIN",
		"Ganasteis el derbi. Hay gente esperando el autobús en la puerta, esta vez"
		+ " para llevaros en volandas, y mañana no se va a hablar de otra cosa en"
		+ " toda la ciudad.":
			"Derbiyi kazandınız. Kapıda otobüsü bekleyen insanlar var, bu sefer sizi omuzlarda taşımak için; yarın bütün şehirde başka hiçbir şey konuşulmayacak.",
		"CELEBRARLO EN LA VALLA": "TELLERDE KUTLA",
		"DECIR QUE SÓLO SON TRES PUNTOS": "SADECE UÇ PUAN DE",
		"DEDICÁRSELO AL VESTUARIO": "SOYUNMA ODASINA ARMAGAN ET",


		"selección": "milli takım",
		"competidor": "rakibin",
		"TU PRIMERA VEZ CON TU PAÍS": "ILK MILLI MAÇIN",
		"Debutaste con la selección. En el túnel te esperan la cámara de tu país y el"
		+ " utillero con la camiseta del partido, que se guarda o se regala.":
			"Milli takımda ilk maçına çıktın. Tünelde seni ülkenin kamerası ve maç formasıyla malzemeci bekliyor: ya saklarsın ya hediye edersin.",
		"ENMARCARLA PARA TU FAMILIA": "AILEN IÇIN ÇERÇEVELET",
		"REGALÁRSELA AL SELECCIONADOR": "HOCAYA HEDIYE ET",
		"SUBIRLA A TUS REDES": "SOSYAL MEDYADA PAYLAŞ",
		"EL SELECCIONADOR TE APARTA": "MILLI HOCA SENI KENARA ÇEKIYOR",
		"Al acabar te lleva a un lado, lejos del grupo. Puedes escuchar lo que tenga"
		+ " que decirte, o aprovechar los dos minutos para pedirle el puesto de"
		+ " titular.":
			"Maçtan sonra seni gruptan uzakta bir kenara çekiyor. Ne diyeceğini dinleyebilir ya da bu iki dakikayı ilk 11 yerini istemek için kullanabilirsin.",
		"ESCUCHAR Y CALLAR": "DINLE VE SUS",
		"PEDIRLE EL PUESTO": "FORMAYI ISTE",
		"Le gustó tu descaro: cuenta contigo.": "Cesaretini beğendi: planlarında varsın.",
		"No era el momento ni el sitio. Tomó nota.":
			"Ne yeriydi ne zamanı. Not aldı.",
		"TU CLUB TE RECLAMA": "KULUBUN SENI ISTIYOR",
		"Tu club llamó a la federación: quieren que vuelvas en el primer vuelo y te"
		+ " saltes el segundo partido. El seleccionador te deja elegir a ti, que es la"
		+ " peor parte.":
			"Kulübün federasyonu aradı: ilk uçakla dönmeni ve ikinci maçı kaçırmanı istiyorlar. Milli takım teknik direktörü seçimi sana bırakıyor, en kötüsü de bu.",
		"VOLVER AL CLUB": "KULUBE DON",
		"QUEDARTE CON TU PAÍS": "ULKENLE KAL",
		"MARCASTE CON TU PAÍS": "ULKEN IÇIN GOL ATTIN",
		"Gol con la camiseta de tu selección y un micrófono de tu país esperándote. Se"
		+ " puede repartir de tres maneras, y las tres se oyen en tu casa.":
			"Milli formayla bir gol ve seni bekleyen memleketten bir mikrofon. Bunu üç şekilde paylaşabilirsin ve üçü de evde duyulur.",
		"AL PAÍS QUE TE VIO NACER": "DOGDUGUM ULKEYE",
		"AL SELECCIONADOR QUE TE LLAMÓ": "BENI ÇAGIRAN HOCAYA",
		"AL CLUB QUE TE PAGA": "BANA MAAŞ VEREN KULUBE",
		"LA PRENSA DE TU PAÍS": "MEMLEKETTEKI BASIN",
		"Perdisteis y el país entero pide explicaciones. Te esperan en zona mixta con"
		+ " la pregunta ya escrita: quién tuvo la culpa.":
			"Kaybettiniz ve bütün ülke hesap soruyor. Seni karma bölgede, soru önceden yazılmış halde bekliyorlar: suç kimdeydi?",
		"DAR LA CARA POR EL GRUPO": "TAKIMIN ARKASINDA DUR",
		"DECIR QUE TÚ CUMPLISTE": "SEN GOREVINI YAPTIN DE",
		"NOVENTA MINUTOS MIRANDO": "DOKSAN DAKIKA SEYIR",
		"Viajaste medio mundo para calentar dos veces y volver a sentarte. Tu agente"
		+ " quiere que se sepa; el segundo entrenador te ha visto la cara desde el"
		+ " banquillo.":
			"Dünyanın yarısını uçtun, iki kez ısınıp yeniden oturmak için. Menajerin bunun duyulmasını istiyor; yardımcı antrenör yedek kulübesinden yüzünü izliyordu.",
		"APLAUDIR DESDE EL BANCO": "KULUBEDEN ALKIŞLA",
		"QUE SE ENTERE TU AGENTE": "MENAJERIN KONUŞSUN",
		"AYUDARLE": "EL UZAT",
		"CERRARLE LA PUERTA": "KAPIYI KAPAT",
		"LA CAMISETA DEL RIVAL": "RAKIBIN FORMASI",
		"Su estrella se acerca en el túnel y te ofrece cambiar camisetas. Hay veinte"
		+ " cámaras esperando el gesto, y la grada de tu fondo sigue ahí arriba.":
			"Yıldızları tünelde yanına gelip forma değişmeyi teklif ediyor. Yirmi kamera o anı bekliyor ve senin tribünün hâlâ yukarıda.",
		"CAMBIARLA DELANTE DE TODOS": "HERKESIN ONUNDE DEGIŞ",
		"DEJARLE CON LA MANO TENDIDA": "ELINI HAVADA BIRAK",








		"ALGUIEN EN LA MESA DE AL LADO": "YAN MASADA BIRI",
		"Cena del club, y la conversación de tu mesa lleva una hora girando"
		+ " alrededor de {0}. Te está mirando desde hace rato.":
			"Kulüp yemeği ve masandaki sohbet bir saattir hep aynı kişi etrafında dönüyor: {0}. Bir süredir sana bakıyor.",
		"ACERCARTE": "YAKLAŞ",







		"TE LA QUIEREN PRESENTAR": "SENI TANIŞTIRMAK ISTIYOR",
		"Un compañero insiste toda la semana: {0} es amiga de su mujer y ya le"
		+ " habló de ti. Sólo tienes que decir que sí.":
			"Bir takım arkadaşın bütün hafta ısrar ediyor: {0} karısının arkadaşı ve senden çoktan bahsetmiş. Sadece evet demen yeterli.",
		"QUE SEA EL SÁBADO": "CUMARTESI OLSUN",
		"NO ESTÁS PARA ESO": "ŞU AN DEGIL",
		"TE ESPERABA EN LA PUERTA": "KAPIDA SENI BEKLIYORDU",
		"LA INAUGURACIÓN": "AÇILIŞ GECESI",
		"Tu marca te lleva a la inauguración de una exposición y no entiendes ni uno de los"
		+ " cuadros. {0} lleva veinte minutos delante del mismo, y acaba de darse cuenta"
		+ " de que la miras a ella.":
			"Sponsorun seni bir sergi açılışına götürüyor ve tabloların tek birini bile anlamıyorsun. {0} yirmi dakikadır aynı tablonun önünde duruyor ve ona baktığını yeni fark etti.",
		"PREGUNTARLE QUÉ VE": "NE GORDUGUNU SOR",
		"VOLVER CON LOS TUYOS": "SENINKILERE DON",
		"{0} llevaba dos horas en la puerta de jugadores. No traía camiseta que"
		+ " firmar: traía su número escrito en un papel.":
			"{0} iki saattir oyuncu kapısındaydı. İmzalatacak forması yoktu: bir kâğıda yazılmış telefon numarası vardı.",
		"GUARDARTE EL PAPEL": "KAGIDI CEBINE KOY",
		"SUBIR AL AUTOBÚS": "OTOBUSE BIN",
		"LA LLAVE DE TU CASA": "EVININ ANAHTARI",
		"{0} lleva media semana durmiendo aquí y sus cosas ya ocupan un cajón."
		+ " Alguien tiene que decirlo en voz alta.":
			"{0} haftanın yarısını burada uyuyarak geçiriyor ve eşyaları şimdiden bir çekmeceyi doldurdu. Birinin bunu yüksek sesle söylemesi gerek.",
		"PEDIRLE QUE SE MUDE": "TAŞINMASINI ISTE",
		"TODAVÍA NO": "DAHA ERKEN",
		"LA CENA QUE LE DEBES": "BORÇLU OLDUGUN YEMEK",
		"Reservaste hace tres semanas y hoy es la noche. También es la noche del"
		+ " vídeo del rival, que el técnico mandó a todo el plantel.":
			"Üç hafta önce rezervasyon yaptın ve bu gece o gece. Aynı zamanda hocanın bütün kadroya gönderdiği rakip analiz videosunun gecesi.",
		"IR A CENAR": "YEMEGE GIT",
		"VER EL VÍDEO": "VIDEOYU IZLE",
		"OTRA SEMANA FUERA": "BIR HAFTA DAHA",
		"Cuatro días de concentración, el tercer viaje del mes. {0} ya no"
		+ " pregunta cuándo vuelves: mira el calendario y se calla.":
			"Dört günlük kamp, ayın üçüncü yolculuğu. {0} artık ne zaman döneceğini sormuyor: takvime bakıp susuyor.",
		"LLAMARLA CADA NOCHE": "HER GECE ONU ARA",
		"CONCENTRARTE EN EL PARTIDO": "MAÇA ODAKLAN",
		"SU CUMPLEAÑOS ES HOY": "BUGUN DOGUM GUNU",
		"Es el cumpleaños de {0} y hay treinta personas en tu casa. Mañana a las"
		+ " nueve hay partido y el técnico avisó de que mirará las caras.":
			"Bugün {0} adlı sevgilinin doğum günü ve evinde otuz kişi var. Yarın saat dokuzda maç var ve hoca yüzlere bakacağını söyledi.",
		"QUEDARTE HASTA EL FINAL": "SONUNA KADAR KAL",
		"SUBIR A DORMIR": "YATMAYA ÇIK",
		"HAY QUE HABLAR": "KONUŞMALIYIZ",
		"{0} apagó la televisión en mitad del resumen de la jornada y se sentó"
		+ " enfrente. Esta conversación llevaba meses pendiente.":
			"{0} haftanın özetinin ortasında televizyonu kapattı ve karşına oturdu. Bu konuşma aylardır bekliyordu.",
		"ESCUCHARLA ENTERA": "SONUNA DEK DINLE",
		"DECIRLE QUE NO ES EL MOMENTO": "ŞIMDI SIRASI DEGIL DE",
		"TE ESPERÓ DESPIERTA": "UYUMADAN BEKLEDI",
		"Son las dos de la mañana, perdisteis, y {0} sigue despierta en la cocina"
		+ " con dos platos servidos. No preguntó por el partido.":
			"Saat gece ikisi, kaybettiniz ve {0} hâlâ mutfakta uyanık, iki tabak hazır. Maçı sormadı.",
		"SENTARTE A CENAR": "OTUR VE YE",
		"IRTE DERECHO A LA CAMA": "DOGRU YATAGA",
		"LA FOTO DEL DOMINGO": "PAZAR ÇEKIMI",
		"Una revista ofrece portada: tú y {0}, en casa, ocho páginas. Pagan bien"
		+ " y a ella la fotografiarían por primera vez.":
			"Bir dergi kapak teklif ediyor: sen ve {0}, evde, sekiz sayfa. İyi para veriyorlar ve o ilk kez fotoğraflanacak.",
		"ACEPTAR LA PORTADA": "KAPAGI KABUL ET",
		"PROTEGERLA": "ONU KORU",
		"ELLA QUIERE SALIR": "DIŞARI ÇIKMAK ISTIYOR",
		"Ganasteis y {0} ya tiene mesa reservada para las dos de la mañana."
		+ " Mañana hay recuperación a las nueve.":
			"Kazandınız ve {0} gece ikiye masa ayırtmış bile. Yarın saat dokuzda toparlanma antrenmanı var.",
		"SALIR CON ELLA": "ONUNLA ÇIK",
		"MAÑANA HAY TRABAJO": "YARIN IŞ VAR",
		"LA GIRA DE PRETEMPORADA": "SEZON ONCESI TURNE",
		"Tres semanas al otro lado del mundo. El club permite acompañantes, pero"
		+ " el vestuario mira raro al que viaja con pareja.":
			"Dünyanın öbür ucunda üç hafta. Kulüp eşlere izin veriyor ama soyunma odası sevgilisiyle gelene yan gözle bakıyor.",
		"QUE VENGA CONTIGO": "SENINLE GELSIN",
		"IR SOLO": "TEK GIT",
		"SE ACABÓ": "BITTI",
		"Las maletas de {0} llevan dos días en el recibidor y esta vez no las"
		+ " está deshaciendo. Lo que queda por decidir no es si se va: es cómo.":
			"Valizleri iki gündür antrede duruyor ve bu sefer boşaltmıyor: {0} gidiyor. Karar verilecek şey gidip gitmeyeceği değil: nasıl gideceği.",
		"SUPLICARLE DELANTE DE TODOS": "HERKESIN ONUNDE YALVAR",
		"DECIRLE QUE ERA SU DECISIÓN": "ONUN KARARIYDI DE",
		"DEJAR QUE LO CUENTE ELLA": "O ANLATSIN",

		"Vivís juntos: ${0} por partido.": "Birlikte yaşıyorsunuz: maç başı ${0}.",
		"Estáis empezando. Todavía no vive contigo.":
			"Daha yeni başlıyorsunuz. Henüz seninle yaşamıyor.",
		"ASADO DEL VESTUARIO": "TAKIM MANGALI",
		"Los veteranos organizan un asado y te toca poner la carne. Caro, pero ahí se"
		+ " hacen los amigos.":
			"Kıdemliler mangal yapıyor ve et sende. Pahalı ama dostluklar orada kurulur.",
		"PAGAR EL ASADO": "HESABI ODE",
		"NO HAY TIEMPO": "ZAMAN YOK",
		"EL TÉCNICO TE LLAMA": "HOCA SENI ÇAGIRIYOR",
		"EL MÍSTER TIENE UNA IDEA": "HOCANIN BIR FIKRI VAR",
		"Te enseña la pizarra con tu nombre fuera de tu sitio de siempre: te ve de {0}. Dice que ahí hay hueco y que lo llenas tú.": "Sana tahtayı gösteriyor, adın her zamanki yerinin dışında: seni {0} olarak görüyor. Orada bir boşluk olduğunu ve onu senin dolduracağını söylüyor.",
		"ACEPTAR EL CAMBIO": "MEVKIYI KABUL ET",
		"PEDIR GARANTÍAS": "GARANTI ISTE",
		"SEGUIR EN LO TUYO": "MEVKINDE KAL",
		"Te promete el puesto y los minutos.": "Sana forma ve süre sözü veriyor.",
		"No le gustó que le pusieras condiciones.": "Şart koşmandan hoşlanmadı.",
		"Puerta cerrada. Puedes escuchar y asentir, o jugártela y pedirle más"
		+ " protagonismo.":
			"Kapı kapalı. Dinleyip başını sallayabilir ya da şansını deneyip daha büyük bir rol isteyebilirsin.",
		"ESCUCHAR": "DINLE",
		"PEDIR MÁS": "DAHA ISTE",
		"¡El técnico te compra la idea!": "Hoca fikri satın aldı!",
		"Mala lectura: al técnico no le gustó.": "Yanlış okuma: hoca bundan hoşlanmadı.",
		"VISITA A LA CANTERA": "ALTYAPI ZIYARETI",
		"El club organiza una visita a los niños de la cantera y del hospital. Nadie te"
		+ " obliga.":
			"Kulüp altyapıdaki çocuklara ve hastanedeki çocuklara bir ziyaret düzenliyor. Kimse seni zorlamıyor.",
		"IR": "GIT",
		"DESCANSAR": "DINLEN",
		"título (sale en 2 entradas: polemica y micro_polemica)UN MICRÓFONO CALIENTE":
			"AÇIK MIKROFON",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el equipo?'":
			"Bir gazeteci seni kışkırtıyor: 'Takımdaki rolünden gerçekten memnun musun?'",
		"MORDERTE LA LENGUA": "DILINI ISIR",
		"SOLTARLO": "PATLA",
		"SALIDA DEL EQUIPO": "TAKIMLA GECE",
		"El vestuario sale esta noche. Habrá fotos, habrá risas, y mañana habrá"
		+ " entrenamiento.":
			"Soyunma odası bu gece dışarı çıkıyor. Fotoğraflar olacak, kahkahalar olacak ve yarın antrenman olacak.",
		"IR CON ELLOS": "ONLARLA GIT",
		"QUEDARTE": "EVDE KAL",

		"ALBOROTO EN TU CALLE": "SOKAGINDA KARGAŞA",
		"Hay aficionados acampados frente a tu casa desde temprano. Los vecinos ya"
		+ " llamaron dos veces.":
			"Taraftarlar sabahın erken saatinden beri evinin önünde kamp kurmuş. Komşular şimdiden iki kez aradı.",
		"SALIR A FIRMAR": "IMZA DAGIT",
		"CERRAR CORTINAS": "PERDELERI KAPAT",
		"TU MASCOTA AMANECIÓ MAL": "EVCIL HAYVAN HASTA",
		"No quiso comer y te mira raro. El veterinario bueno atiende hoy... a la"
		+ " hora del entrenamiento de recuperación.":
			"Yemek yemedi ve sana tuhaf bakıyor. İyi veteriner bugün bakıyor... tam toparlanma antrenmanı saatinde.",
		"LLEVARLA AL VETERINARIO": "VETERINERE GOTUR",
		"ESPERAR A MAÑANA": "YARINI BEKLE",
		"Falsa alarma: por la tarde ya corría por la casa.":
			"Yanlış alarm: akşama evin içinde koşturuyordu.",
		"Mala noche para los dos. No pegaste ojo.":
			"İkiniz için de kötü bir gece. Gözüne uyku girmedi.",
		"ASADO EN TU JARDÍN": "BAHÇEDE MANGAL",
		"Compraste el asador y el vestuario se enteró. 'El sábado en tu casa',"
		+ " dicen. No era pregunta.":
			"Mangalı aldın ve soyunma odası duydu. 'Cumartesi sende' diyorlar. Soru değildi.",
		"ENCENDER EL ASADOR": "MANGALI YAK",


		"TARDE DE PISCINA": "HAVUZ KEYFI",
		"Hace calor, tu piscina está impecable y media plantilla tiene tu"
		+ " dirección. El timbre va a sonar.":
			"Hava sıcak, havuzun tertemiz ve kadronun yarısı adresini biliyor. Zil çalacak.",
		"ABRIR LA CASA": "KAPILARI AÇ",
		"TARDE PARA TI": "KENDINE ZAMAN",
		"PEREGRINACIÓN A TU VITRINA": "VITRIN ZIYARETI",
		"El club pregunta si puedes recibir a los juveniles en tu mansión: quieren"
		+ " ver la vitrina con sus propios ojos.":
			"Kulüp, altyapı çocuklarını malikânende ağırlayıp ağırlayamayacağını soruyor: vitrini kendi gözleriyle görmek istiyorlar.",
		"RECIBIRLOS": "AGIRLA",
		"OTRA SEMANA": "BAŞKA HAFTA",
		"NOCHE LIBRE": "BOŞ GECE",
		"Tus amigos te esperan para una noche de PlayStation. El técnico ofrece una"
		+ " sesión extra de vídeo y tiros a puerta. No llegas a las dos.":
			"Arkadaşların PlayStation gecesi için seni bekliyor. Hoca ekstra bir video ve şut antrenmanı öneriyor. İkisine birden yetişemezsin.",
		"PS4 CON LOS AMIGOS": "ARKADAŞLARLA PS4",
		"ENTRENAR CON EL DT": "HOCAYLA ÇALIŞ",
		"El programa deportivo de la noche te reserva el asiento bueno. O eso, o el"
		+ " sofá de casa con las piernas en alto.":
			"Akşamki spor programı sana en iyi koltuğu ayırıyor. Ya o ya da evde ayaklar havada kanepe.",
		"IR A LA ENTREVISTA": "ROPORTAJA GIT",
		"sale en 2 entradas: plato_o_descanso y dia_libre_tripleDESCANSAR EN CASA":
			"EVDE DINLEN",
		"TODOS TE BUSCAN": "GOZLER SENDE",
		"A la salida hay dos corros: la afición con camisetas y bufandas, y los"
		+ " periodistas con micrófonos. Solo te da tiempo a uno.":
			"Çıkışta iki kalabalık var: formaları ve atkılarıyla taraftarlar, mikrofonlarıyla gazeteciler. Sadece birine vaktin var.",
		"FIRMAR A LA AFICIÓN": "TARAFTARA IMZA",
		"ATENDER A LA PRENSA": "BASINLA KONUŞ",
		"DOS CENAS, UNA NOCHE": "IKI YEMEK, BIR GECE",
		"Tu agente reservó mesa para hablar de tu futuro. El técnico te invitó a la"
		+ " suya para hablar del equipo. Coinciden a la misma hora.":
			"Menajerin geleceğini konuşmak için masa ayırttı. Hoca da takımı konuşmak için seni kendi masasına davet etti. İkisi aynı saatte.",
		"CENAR CON TU AGENTE": "MENAJERLE YE",
		"CENAR CON EL DT": "HOCAYLA YE",
		"LA TARDE DESPUÉS": "ERTESI GUN",
		"El readaptador te espera en el gimnasio para soltar piernas. Tu marca, a la"
		+ " misma hora, monta una firma pagada.":
			"Kondisyoner seni bacaklarını açmak için spor salonunda bekliyor. Markan da tam aynı saatte ücretli bir imza etkinliği düzenliyor.",
		"GIMNASIO": "SALON",
		"ACTO DE LA MARCA": "MARKA ETKINLIGI",
		"TERCER TIEMPO": "UÇUNCU YARI",
		"El vestuario se va a celebrar (o a lamentar) el resultado hasta tarde. En casa"
		+ " te esperaban para cenar tranquilo.":
			"Soyunma odası sonucu geç saate kadar kutlamaya (ya da unutmaya) gidiyor. Evde ise seni sakin bir yemek için bekliyorlardı.",
		"sale en 2 entradas: equipo_o_casa y dia_libre_tripleSALIR CON EL EQUIPO":
			"TAKIMLA ÇIK",
		"NOCHE EN CASA": "EVDE GECE",
		"TE POSTULAN DE CAPITÁN": "KAPTANLIGA ADAYSIN",
		"El vestuario vota y tu nombre suena para el brazalete. Aceptar es echarte el"
		+ " equipo a la espalda; ceder es un gesto al veterano de siempre.":
			"Soyunma odası oylama yapıyor ve kaptanlık bandı için senin adın geçiyor. Kabul etmek takımı sırtlanmak demek; çekilmek, bandı hep takan kıdemliye bir jest.",
		"ACEPTAR EL BRAZALETE": "BANDI KABUL ET",
		"APOYAR AL VETERANO": "KIDEMLIYI DESTEKLE",
		"QUIEREN TU VIDA PRIVADA": "OZEL HAYATINI ISTIYORLAR",
		"Una revista ofrece una fortuna por abrir las puertas de tu casa. Tu agente"
		+ " prefiere que sigas siendo un misterio que se cotiza.":
			"Bir dergi evinin kapılarını açman için servet teklif ediyor. Menajerin, değerini koruyan bir gizem olarak kalmanı tercih ediyor.",
		"ABRIR LAS PUERTAS": "KAPILARI AÇ",
		"MANTENER EL MISTERIO": "GIZEMI KORU",
		"LOS PAPARAZZI": "PAPARAZZILER",
		"Un fotógrafo lleva días pegado a ti: el coche, el restaurante, la salida del entreno. Anoche te sacó cenando a las tantas y mañana sale en portada.":
			"Bir fotoğrafçı günlerdir peşinde: araba, restoran, antrenman tesisinin kapısı. Dün gece seni gece yarısı yemekte yakaladı ve yarın manşette.",
		"DENUNCIARLO": "ŞIKAYET ET",
		"EL BAILE DE MODA": "MODA DANS",
		"El community manager del club te persigue para grabar el baile viral del"
		+ " momento. El míster odia esas cosas.":
			"Kulübün sosyal medya sorumlusu, anın viral dansını çekmek için peşinde. Hoca böyle şeylerden nefret eder.",
		"GRABAR EL BAILE": "DANSI ÇEK",
		"NI DE BROMA": "ASLA",
		"EL HIJO DEL MÍSTER": "HOCANIN OGLU",
		"En el rondo te toca marcar al hijo del técnico, que anda de pruebas. Puedes"
		+ " hacerle un caño de los que duelen o dejarle lucirse.":
			"Dar alanda deneme sürecindeki hocanın oğlunu markaj yapma sırası sende. Ona can yakan bir bacak arası atabilir ya da parlamasına izin verebilirsin.",
		"HACERLE UN CAÑO": "BACAK ARASI AT",
		"DEJARLE LUCIRSE": "PARLASIN",
		"UN NIÑO BAJO LA LLUVIA": "YAGMURDA BIR ÇOCUK",
		"Sales muerto y llueve, pero un niño lleva dos horas esperando con tu camiseta"
		+ " y un rotulador.":
			"Bitkin çıkıyorsun ve bardaktan boşanırcasına yağmur yağıyor, ama bir çocuk iki saattir formanla ve bir kalemle bekliyor.",
		"PARARTE A FIRMAR": "DUR VE IMZALA",
		"AL AUTOBÚS": "OTOBUSE",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el"
		+ " equipo?'. Una frase gorda vende titulares, pero el míster lo verá.":
			"Bir gazeteci seni kışkırtıyor: 'Takımdaki rolünden gerçekten memnun musun?'. Sert bir cümle manşet satar ama hoca görecek.",
		"SOLTARLO TODO": "HEPSINI SOYLE",
		"¿CON QUIÉN TE SIENTAS?": "KIMINLE OTURUYORSUN?",
		"Primer viaje con el equipo. En el autobús quedan tres sitios libres, y con quién te sientas se nota.":
			"Takımla ilk yolculuk. Otobüste üç boş koltuk var ve kimin yanına oturduğun göze batar.",
		"CON LOS VETERANOS": "KIDEMLILERLE",
		"CON EL MÍSTER": "HOCAYLA",
		"GRABANDO PARA REDES": "SOSYAL MEDYA ÇEKIMI",
		"TU PRIMERA ENTREVISTA": "ILK ROPORTAJIN",
		"Micrófono delante y una sola pregunta abierta. Lo que digas te retrata.":
			"Mikrofon önünde ve tek bir açık soru. Ne dersen seni o anlatır.",
		"DEL EQUIPO": "TAKIM",
		"DE TUS METAS": "HEDEFLER",
		"DE LA AFICIÓN": "TARAFTAR",
		"¿A QUIÉN LO DEDICAS?": "KIME ARMAGAN?",
		"Acabas de marcar y la cámara te busca. El gesto que hagas ahora lo verá todo"
		+ " el estadio.":
			"Az önce gol attın ve kamera seni buluyor. Şimdi ne yaparsan bütün stadyum görecek.",
		"AL MÍSTER": "HOCAYA",
		"A LA GRADA": "TRIBUNE",
		"A CÁMARA, TU MARCA": "KAMERAYA, MARKAN",
		"DÍA LIBRE": "IZIN GUNU",
		"Jornada sin obligaciones. Puedes desconectar en casa, salir con el grupo, o"
		+ " meter horas de gimnasio por tu cuenta.":
			"Hiçbir yükümlülüğün olmayan bir gün. Evde kafa dinleyebilir, takımla çıkabilir ya da kendi başına spor salonunda saat doldurabilirsin.",
		"GIMNASIO POR TU CUENTA": "TEK BAŞINA SALON",
		"LA FOTO DE EQUIPO": "TAKIM FOTOGRAFI",
		"El fotógrafo coloca la foto de plantilla. Hay hueco delante con el capitán, en"
		+ " el centro entre todos, o pegado al cuerpo técnico.":
			"Fotoğrafçı kadro fotoğrafını hazırlıyor. Önde kaptanın yanında, ortada herkesle ya da teknik ekibin hemen yanında yer var.",
		"DELANTE, PROTAGONISTA": "ONDE, YILDIZ",
		"EN EL CENTRO, CON TODOS": "ORTADA, HERKESLE",
		"AL LADO DEL MÍSTER": "HOCANIN YANINDA",
		"TRES MARCAS TE TANTEAN": "UÇ MARKA KAPIDA",
		"Tres patrocinadores mueven ficha a la vez: la deportiva de siempre, una firma"
		+ " de moda, y la marca local de tu ciudad.":
			"Üç sponsor aynı anda hamle yapıyor: hep giydiğin spor markası, bir moda markası ve memleketinin yerel markası.",
		"LA DEPORTIVA": "SPOR MARKASI",
		"LA DE MODA": "MODA",
		"LA LOCAL": "YEREL",
		"¿QUÉ SUBES A TUS REDES?": "NE PAYLAŞIYORSUN?",
		"Foto lista para publicar tras el partido. Un gesto para la grada, un elogio al"
		+ " vestuario, o un guiño al míster.":
			"Maçtan sonra paylaşılmaya hazır bir fotoğraf. Tribüne bir selam, soyunma odasına bir övgü ya da hocaya bir göz kırpma.",
		"GUIÑO A LA AFICIÓN": "TARAFTARA SELAM",
		"ELOGIO AL VESTUARIO": "TAKIMA OVGU",
		"GRACIAS, MÍSTER": "SAG OL HOCAM",
		"NOVATADA EN LA COMIDA": "ÇAYLAK TORENI",
		"Primera comida con la plantilla y toca ritual de novato: subirte a la silla a"
		+ " cantar, o marcarte un baile. Elige tu veneno y reza.":
			"Kadroyla ilk yemek ve çaylak ritüeli zamanı: sandalyeye çıkıp şarkı söyle ya da dans et. Zehrini seç ve dua et.",
		"CANTAR": "ŞARKI",
		"Te saliste: el vestuario te corea de pie.":
			"Döktürdün: takım ayakta sana eşlik ediyor.",
		"Desafinaste fatal. Qué vergüenza ajena.": "Feci detone oldun. İzleyen utandı.",
		"BAILAR": "DANS",
		"¡La rompiste! Hasta el utillero lo grabó.":
			"Yıktın geçtin! Malzemeci bile kayda aldı.",
		"Bailaste terrible. No lo superan.": "Berbat dans ettin. Bunu hiç unutmayacaklar.",
		"RETO VIRAL DE DOMINADAS": "TOP SEKTIRME YARIŞI",
		"Un compañero saca el móvil: reto de toques al balón para subirlo a redes. La"
		+ " cámara ya está grabando.":
			"Bir takım arkadaşın telefonunu çıkarıyor: sosyal medyaya atmak için top sektirme meydan okuması. Kamera çoktan çekiyor.",
		"INTENTARLO": "DENE",
		"¡Clip perfecto! Se hace viral.": "Mükemmel klip! Anında viral.",
		"Se te cae a la segunda. Meme asegurado.":
			"İkinci dokunuşta düşürdün. Caps garanti.",
		"NO ME LA JUEGO": "RISKE GIRMEM",
		"El crack del vestuario te reta a la consola delante de todos. Ganarle da"
		+ " galones; perder, cachondeo para semanas.":
			"Soyunma odasının yıldızı herkesin önünde seni konsolda düelloya çağırıyor. Yenersen itibar kazanırsın; kaybedersen haftalarca dalga geçilir.",
		"ACEPTAR EL DUELO": "DUELLOYA GIR",
		"¡Le ganas en la prórroga! Respeto total.":
			"Uzatmada yendin! Tam saygı.",
		"Paliza. Te lo recordarán a diario.": "Fena dayak. Her gün hatırlatacaklar.",
		"OTRO DÍA": "SONRA",
		"NOCHE DE CASINO": "KUMAR GECESI",
		"Tu agente te lleva al casino a 'hacer contactos'. La ruleta llama y él te"
		+ " anima a mojarte.":
			"Menajerin seni 'bağlantı kurmak' için kumarhaneye götürüyor. Rulet çağırıyor ve o da seni gaza getiriyor.",
		"APOSTAR FUERTE": "YUKSEK OYNA",
		"¡Pleno! El agente te mira con otros ojos.":
			"Tam isabet! Menajerin sana artık başka gözle bakıyor.",
		"Lo dejas todo en la mesa. Ay.": "Her şeyi masada bıraktın. Eyvah.",
		"SOLO MIRAR": "SADECE BAK",
		"UN PRONÓSTICO ATREVIDO": "CESUR BIR TAHMIN",
		"En directo te piden mojarte con el próximo gran partido. Acertar te hace"
		+ " profeta; fallar, el hazmerreír.":
			"Canlı yayında bir sonraki büyük maç için tahmin istiyorlar. Tutarsa kâhinsin; tutmazsa alay konusu.",
		"MOJARTE": "TAHMIN",
		"Clavaste el pronóstico. Portada.": "Tahmini tutturdun. Manşet oldun.",
		"Ni una. Los memes no perdonan.": "Bir tane bile tutmadı. Capsler affetmiyor.",
		"AGUA, NI ME MOJO": "ORTA YOLU BUL",
		"DUELO DE PENALTIS": "PENALTI DUELLOSU",
		"ACEPTAR": "TAMAM",
		"Le ganas la tanda. Ovación del grupo.": "Düelloyu kazandın. Takım coştu.",
		"Te para tres. Sonrojo.": "Üç tane kurtardı. Yüzün kızardı.",
		"A LA DUCHA": "DUŞA",
		"KARAOKE DE CONCENTRACIÓN": "KAMPTA KARAOKE",
		"Noche de karaoke en la concentración. Todos esperan a ver si te atreves con el"
		+ " micro.":
			"Kampta karaoke gecesi. Herkes mikrofonu almaya cesaret edip etmeyeceğini görmeyi bekliyor.",
		"COGER EL MICRO": "MIKROFONU AL",
		"¡Estrella de la noche! Grupo rendido.":
			"Gecenin yıldızı! Takım hayran kaldı.",
		"Un desastre. Y alguien lo grabó.": "Felaket. Üstelik biri kayda aldı.",
		"PASAR EL MICRO": "MIKROFONU UZAT",
		"ESTRENAR BAILE DE GOL": "YENI GOL DANSI",
		"El vestuario te pincha para que te inventes una celebración nueva para el"
		+ " próximo gol. O sale icónica, o sale ridícula.":
			"Soyunma odası bir sonraki golün için yeni bir sevinç icat etmen için seni dürtüyor. Ya efsane olur ya rezil.",
		"INVENTARME UNO": "BIR TANE UYDUR",
		"¡Se copia en todos los patios! Icónico.": "Bütün okul bahçeleri taklit ediyor! Efsane.",
		"Ridículo total. Mejor no marcar.": "Tam bir rezalet. Gol atmasan iyi olur.",
		"CELEBRAR NORMAL": "NORMAL SEVIN",
		"LA CENA LA PAGAS TÚ": "YEMEK SENDEN",
		"Victoria y el vestuario mira al recién llegado: la cena de celebración la paga el nuevo. Es tradición, y es cara.":
			"Galibiyet ve soyunma odası yeni geleni süzüyor: kutlama yemeğini yeni gelen ısmarlar. Gelenek bu ve pahalı.",
		"PAGAR CON GUSTO": "SEVE SEVE ODE",
		"ESCAQUEARTE": "SIVIŞ",
		"FUISTE LA FIGURA": "GECENIN YILDIZI",
		"Ganasteis y todos preguntan por ti. La sala de prensa está llena y tienes las"
		+ " piernas fundidas.":
			"Kazandınız ve herkes seni soruyor. Basın salonu dolu ve bacakların bitmiş.",
		"ATENDER A TODOS": "HERKESLE KONUŞ",
		"DIRECTO A CASA": "DOGRU EVE",
		"BUSCANDO CULPABLES": "SUÇLU ARANIYOR",
		"Derrota y el vestuario arde. El míster pide explicaciones mirando a los ojos."
		+ " Puedes dar la cara o mirar al suelo.":
			"Mağlubiyet ve soyunma odası yanıyor. Hoca gözlerinin içine bakarak hesap soruyor. Hesap verebilir ya da yere bakabilirsin.",
		"DAR LA CARA": "HESAP VER",
		"MIRAR AL SUELO": "YERE BAK",
		"BRONCA EN EL VESTUARIO": "SOYUNMA ODASINDA KAVGA",
		"Tras perder, el capitán monta un pollo y señala a los que no corrieron. Puedes"
		+ " respaldarle o quedarte callado.":
			"Mağlubiyetten sonra kaptan ortalığı birbirine katıyor ve koşmayanları tek tek sayıyor. Ona arka çıkabilir ya da susabilirsin.",
		"RESPALDAR AL CAPITÁN": "KAPTANA ARKA ÇIK",
		"CALLAR Y AGUANTAR": "SUS VE KATLAN",
		"PREGUNTA ENVENENADA": "ZEHIRLI SORU",
		"Recién perdido, un periodista te empuja a cargar contra el árbitro. Un titular"
		+ " fácil, pero el técnico odia el circo.":
			"Daha yeni kaybetmişken bir gazeteci seni hakeme yüklenmeye zorluyor. Kolay bir manşet, ama hoca sirkten nefret eder.",
		"CONTENERTE": "SAKIN KAL",
		"CARGAR CONTRA TODO": "HERKESE YUKLEN",
		"GANASTE EL DERBI": "DERBI KAZANILDI",
		"El derbi cayó de tu lado y la ciudad es una fiesta. La grada corea tu nombre y"
		+ " te invitan a salir a celebrar hasta el amanecer.":
			"Derbi sizden yana döndü ve şehir bayram yeri. Tribün adını haykırıyor ve seni sabaha kadar kutlamaya çağırıyorlar.",
		"CELEBRAR CON LA GRADA": "TRIBUNLE KUTLA",
		"CELEBRAR CON MODESTIA": "MUTEVAZI KUTLA",
		"EL RETO DEL DERBI": "DERBI SOZU",
		"Antes del derbi el vestuario se retó: el que marque, se rapa. Marcaste. Ahora toca cumplir delante de las cámaras… o rajarte.":
			"Derbiden önce soyunma odası birbirine meydan okudu: gol atan kafasını kazıtacak. Gol attın. Şimdi kameraların önünde sözünü tutma vakti… ya da korkup kaçma.",
		"CUMPLIR Y RAPARTE": "SOZUNU TUT, KAZIT",
		"¡Leyenda del vestuario! La grada lo adora.":
			"Soyunma odası efsanesi! Tribün bayılıyor.",
		"El corte sale fatal. Cachondeo eterno.":
			"Saç felaket oldu. Bitmeyen dalga.",
		"RAJARTE": "GERI ADIM",
		"MOLESTIA A CUESTAS": "AGRIYLA OYNAMAK",
		"Arrastras una molestia. El médico aconseja parar; el míster quiere verte en el"
		+ " próximo entreno fuerte, sin excusas.":
			"Bir ağrıyla oynuyorsun. Doktor durmanı öneriyor; hoca seni bir sonraki ağır antrenmanda görmek istiyor, bahane yok.",
		"FORZAR POR EL MÍSTER": "HOCA IÇIN ZORLA",
		"HACER CASO AL MÉDICO": "DOKTORU DINLE",
		"TU CIUDAD TE LLAMA": "MEMLEKET ÇAGIRIYOR",
		"Tu ciudad natal organiza un partido benéfico y quieren tu cara en el cartel."
		+ " Es un día entero fuera.":
			"Memleketin bir yardım maçı düzenliyor ve afişte senin yüzünü istiyorlar. Bütün bir gün dışarıdasın.",
		"IR AL BENÉFICO": "YARDIM MAÇINA",
		"EXCUSARTE": "OZUR DILE",
		"ELIGES DORSAL": "NUMARANI SEÇ",
		"El utillero te deja elegir número: el 10 mediático que todos miran, el del"
		+ " ídolo que se retiró, o uno humilde de currante.":
			"Malzemeci numaranı seçmene izin veriyor: herkesin gözünün üstünde olduğu meşhur 10, emekli olan idolün numarası ya da mütevazı bir emekçi numarası.",
		"EL 10 MEDIÁTICO": "MEŞHUR 10",
		"EL DEL ÍDOLO": "IDOLUNKU",
		"UNO DISCRETO": "SESSIZ BIRI",
		"CAMPEONATO DE DARDOS": "DART ŞAMPIYONASI",
		"En la concentración montan un torneo de dardos con piques de por medio. El que"
		+ " gana, manda esa semana.":
			"Kampta bolca atışmalı bir dart turnuvası düzenliyorlar. Kazanan o hafta sözü geçen kişi olur.",
		"APUNTARTE": "KATIL",
		"¡Campeón! Mandas en el vestuario.": "Şampiyon! Soyunma odasında söz sende.",
		"Última ronda de vergüenza.": "Sonuncu oldun. Rezalet.",
		"EL PRESIDENTE BAJA": "BAŞKAN AŞAGIDA",
		"Tras la victoria el presidente baja eufórico al vestuario a felicitar uno por"
		+ " uno. Todos miran a quién saluda primero.":
			"Galibiyetten sonra başkan coşkuyla soyunma odasına iniyor ve herkesi tek tek tebrik ediyor. Herkes ilk kimi selamlayacağına bakıyor.",
		"DEDICARLE LA VICTORIA": "GALIBIYETI ARMAGAN ET",
		"CELEBRAR CON EL GRUPO": "TAKIMLA KUTLA",

		"El mundo": "Dünya",
		"Fase final de Conference": "Challenge Kupası eleme turları",
		"El club te ofrece cambiar de dorsal (llevas el {0})":
			"Kulüp sana yeni forma numarası teklif ediyor (şu an numaran {0})",
		"ESTÁS EN EL ONCE DE {0}": "MILLI TAKIM ILK 11: {0}",
		"El seleccionador te pone de salida. Tu puntuación ({0}) supera el corte del once ({1}).":
			"Milli takım teknik direktörü seni ilk 11'de başlatıyor. Puanın ({0}) ilk 11 barajını ({1}) aşıyor.",
		"CONVOCADO POR {0}": "MILLI DAVET: {0}",
		"Entras en la lista de 23 y empiezas en el banquillo. Para el once te faltan {0} puntos.":
			"23 kişilik kadroya girdin ve yedek başlıyorsun. İlk 11 için {0} puan eksiğin var.",
		"FUERA DE LA LISTA DE {0}": "KADRO DIŞI: {0}",
		"El seleccionador no te llama esta vez. Tu puntuación es {0} y el último convocado marca {1}: te faltan {2}.":
			"Milli takım teknik direktörü bu sefer seni çağırmadı. Puanın {0}, kadroya giren son oyuncunun puanı {1}: {2} puan eksiğin var.",
		"Le quitaste el sitio a {0}.": "Yerini kaptığın oyuncu: {0}.",
		"El once lo tiene {0}, con {1}.": "İlk 11'deki yer {0} adlı oyuncunun, puanı {1}.",
		"El último de la lista es {0}, con {1}.": "Kadroya giren son oyuncu {0}, puanı {1}.",
		"AMISTOSO: el seleccionador prueba gente y el corte baja {0} puntos. {1}":
			"HAZIRLIK MAÇI: hoca yeni isimleri deniyor ve baraj {0} puan düşüyor. {1}",
		"TE PIDEN: {0} ({1}/{2})": "ISTENEN: {0} ({1}/{2})",
		"Juega {0} partidos con tu país.": "Milli takımla {0} maça çık.",
		"Marca {0} goles con tu país.": "Milli takımla {0} gol at.",
		"Cumpliste lo que te pidió {0}": "İsteneni yaptın. İsteyen: {0}",
		"No cumpliste lo que te pidió {0}": "İsteneni yapamadın. İsteyen: {0}",
		"CAPITÁN de {0}": "KAPTAN: {0}",
		"Perdiste el brazalete de {0}": "Kaptanlık bandını kaybettin: {0}",
		"PERDISTE EL BRAZALETE": "BANT GITTI",
		"{0} {1} · TU MEDIA {2}": "{0} {1} · SEN {2}",
		"EL TÉCNICO NUEVO REPARTE DE CERO": "YENI HOCA, TEMIZ SAYFA",
		"VESTUARIO NUEVO": "YENI KADRO",
		"SE QUEDA EN {0}": "KALIYOR: {0}",
		"BRAZALETE": "BANT",
		"BRAZALETE TUYO": "BANT SENDE",
		"SIN RIVAL": "RAKIP YOK",
		"FRENADO POR TU PALABRA": "SOZUN BAGLIYOR",
		"BRAZALETE: {0}/{1} PARTIDOS · SELECCIONADOR {2}/{3} · VESTUARIO {4}/{5} · SIENDO TITULAR": "BANT: {0}/{1} MAÇ · HOCA {2}/{3} · SOYUNMA ODASI {4}/{5} · ILK 11'DE",
		"¡{0} se clasificó para {1}!": "{0} turnuvaya katılmaya hak kazandı: {1}!",

		"Dieciseisavos": "Son 32",
		"Ronda": "Tur",
		"AMISTOSO": "HAZIRLIK",
		"TUS TIROS": "ŞUTLARIN",
		"LOS AMISTOSOS": "HAZIRLIKLAR",
		"TORNEO EUROPEO": "AVRUPA TURNUVASI",
		"TORNEO SUDAMERICANO": "G.AMERIKA TURNUVASI",
		"TORNEO NORTEAMERICANO": "K. AMERIKA TURNUVASI",
		"TORNEO ASIÁTICO": "ASYA TURNUVASI",
		"TORNEO AFRICANO": "AFRIKA TURN.",
		"TORNEO DE OCEANÍA": "OKYANUSYA TURN.",
		"TORNEO CONTINENTAL": "KITA TURNUVASI",
		"DIF": "AV",
		"CC": "EK",
		"CEU": "AK",
		"CCF": "CK",
		"Pediste salir: el club te ofrece a quien pregunte, también con el mercado cerrado. Estas ofertas no caducan con la ventana.":
			"Ayrılmak istedin: kulüp seni soran herkese teklif ediyor, transfer dönemi kapalıyken bile. Bu teklifler dönemle birlikte sona ermez.",
		"16avos": "SON 32",
		"DISTANCIA": "MESAFE",
		"T": "Ş",
		"DENTRO DEL ÁREA": "CEZA SAHASI IÇI",
		"FUERA DEL ÁREA": "CEZA ALANI DIŞI",
		"DE MUY LEJOS": "ÇOK UZAKTAN",
		"PRODIGIO": "DAHI",
		"HEREDERO": "VARIS",
		"RECOMENDADO": "TAVSIYELI",
		"KILLER NATO": "DOGAL GOLCU",
		"HIJO DE LEYENDA": "EFSANENIN OGLU",


		"PICARDIA": "SOKAK ZEKASI",
		"MANO FRIA": "SOGUKKANLI",
		"CARA DE ANUNCIO": "REKLAM YUZU",
		"EL TELEFONO": "TELEFON",
		"EL NUEVE": "9 NUMARA",
		"EL QUE VOLVIO": "GERI DONEN",
		"EL DEPORTIVO": "SPOR ARABA",
		"EL PATIO DE LA FAMILIA": "AILE BAHÇESI",
		"EL PREPARADOR DE LA FAMILIA": "AILE ANTRENORU",
		"RECUPERACION": "TOPARLANMA",
		"Cuarenta mil personas fueron a verte firmar y te compraste el coche. Llegas tarde a entrenar, pero llegas: la prensa te adora y el vestuario menos.":
			"İmzanı izlemeye kırk bin kişi geldi, sen de arabayı aldın. Antrenmana geç geliyorsun ama geliyorsun: basın sana bayılıyor, soyunma odası o kadar değil.",
		"El terreno de la familia ya era tuyo antes de firmar nada. La casa la levantas tú, pero el sitio donde ponerla no lo pagas.":
			"Ailenin arsası daha hiçbir şeye imza atmadan seninkiydi. Evi sen yapıyorsun ama koyacağın yere para ödemiyorsun.",
		"El que puso en pie a tu padre te conoce desde niño. Te recuperas entre partidos como nadie de tu edad, y a él no hay que pagarle.":
			"Babanı ayağa kaldıran adam seni çocukluğundan beri tanıyor. Maç aralarında yaşıtların gibi değil, çok daha iyi toparlanıyorsun ve ona para ödemen gerekmiyor.",
		"EL AHIJADO": "HIMAYELI",
		"BOTAS DE ORO": "ALTIN BOTLAR",
		"PIERNAS DE NIÑO": "ÇOCUK BACAKLARI",
		"El uno contra uno lo aprendiste en una cancha sin red: +4 de regate desde el debut.":
			"Bire biri filesiz bir sahada öğrendin: ilk maçından itibaren +4 çalım.",
		"Cuando pitan penalti, el balón lo coges tú: +5 de penales, que es lo que decide quién lo tira en tu equipo.":
			"Penaltı düdüğü çalınca topu sen alırsın: +5 penaltı, takımında kimin atacağını da bu belirler.",
		"Sales bien en foto y la prensa lo nota: empiezas con la puerta de los patrocinios abierta, no en tu segunda temporada.":
			"Fotoğrafta iyi çıkıyorsun ve basın bunu fark etti: sponsorluk kapısı ikinci sezonunda değil, en baştan açık başlıyorsun.",
		"Tienes el teléfono de alguien que mueve fichas: tu agente arranca con la mesa llena y el mercado abierto desde el primer mes.":
			"Oyuncu transfer eden birinin telefonu sende: menajerin dolu bir masayla başlıyor ve transfer piyasası ilk aydan itibaren açık.",
		"El área es tuya: +3 de potencia, y si el 9 está libre en tu club, te lo guardan.":
			"Ceza sahası senin: +3 güç, kulübünde 9 numara boştaysa da onu sana saklıyorlar.",
		"Ya jugaste aquí una vez y nadie lo olvidó: la grada te espera y la prensa te da el beneficio de la duda.":
			"Burada bir kez oynadın ve kimse unutmadı: tribün seni bekliyor ve basın sana şüphenin faydasını veriyor.",
		"En este vestuario tu apellido ya sonaba: el técnico te conoce antes de verte jugar, y la prensa lo sabe.":
			"Bu soyunma odasında soyadın zaten biliniyordu: hoca seni oynarken görmeden tanıyor, basın da bunu biliyor.",
		"Tres trofeos de goleador vinieron con unas CORONA DE ORO. Estrenas un par, sin estrenar y sin pagar.":
			"Üç gol krallığı ödülü bir çift ALTIN TAÇ ile geldi. Hiç para ödemediğin yepyeni bir çiftle başlıyorsun.",
		"Las piernas no se acuerdan de los años: +6 a velocidad, aceleración y regate de salida.":
			"Bacakların yaşları hatırlamıyor: başlangıç hızı, ivme ve çalıma +6.",
		"TE LLEVAS": "ALIYORSUN",
		"PASO 2 DE 3 · LO QUE TE GANASTE": "ADIM 2/3 · KAZANDIKLARIN",
		"LIBRES": "AÇIK",
		"POR DESBLOQUEAR": "KILITLI",
		"VIDA": "HAYAT",
		"LESION": "SAKAT",
		"BANCO": "BANKA",
		"TUS VENTAJAS": "AVANTAJLARIN",
		"BOTAS HEREDADAS": "MIRAS KRAMPON",
		"CON CARTEL": "BUYUK ISIM",
		"PIE EDUCADO": "TATLI AYAK",
		"MANO DERECHA": "SAG KOL",
		"EL DIEZ": "10 NO.",
		"CUERPO DE HIERRO": "DEMIR VUCUT",
		"FICHAJE DE ORO": "ALTIN TRANSFER",
		"SANGRE AZUL": "MAVI KAN",
		"SE ABRE CON": "AÇAN",
		"Lo que te ganaste en carreras anteriores. Cada ventaja gasta puntos de legado, y no alcanzan para todas: elige con cuáles arrancas —o con ninguna, y empieza de cero como todos.": "Önceki kariyerlerinde kazandıkların. Her avantaj miras puanı harcar ve hepsine asla yetmez: hangileriyle başlayacağını seç — ya da hiçbiriyle, herkes gibi sıfırdan başla.",
		"Te quedaste las botas de aquel año en Tercera. Estrenas unas TRUENO XT: pegan más fuerte, y duran lo que duran.": "Üçüncü ligdeki o sezonun kramponlarını sakladın. Bir çift TRUENO XT ile başlıyorsun: daha sert vururlar ve ne kadar dayanırlarsa o kadar.",
		"Llegas con cartel: la grada ya coreó tu nombre una vez y te lo guarda.": "Şöhretinle geliyorsun: bu tribün adını bir kez haykırdı ve unutmadı.",
		"Los primeros diez goles no se olvidan: +3 de precisión desde el debut.": "İlk on golün seninle kalır: ilk maçından itibaren +3 isabet.",
		"Un agente con oficina te firma antes que ningún club: más puertas y menos comisión. Su cuota mensual, también desde el día uno.": "Ofisi olan bir menajer seninle herhangi bir kulüpten önce anlaşıyor: daha çok kapı, daha az komisyon. Aylık ücreti de ilk gün başlıyor.",
		"Ya llevaste el 10 y no se te olvidó: +3 de visión, y si el 10 está libre en tu club, te lo guardan.": "10 numarayı bir kez giydin ve unutmadın: +3 vizyon, kulübünde 10 numara boştaysa da onu sana saklıyorlar.",
		"Trescientos partidos enseñan a caer: 20% menos de riesgo de lesión, toda la carrera.": "Üç yüz maç düşmeyi öğretir: bütün kariyerin boyunca %20 daha az sakatlık riski.",
		"Heredas el apellido y la casa: entras a vivir el primer día. El mantenimiento también se hereda.": "Soyadını ve evi miras alıyorsun: ilk gün taşınıyorsun. Bakım masrafı da miras.",
		"No llegas a pelear un sitio: llegas a ocuparlo. Un peldaño más de rol en tu contrato de debut.": "Yer kapmak için değil, yerini almak için geliyorsun: ilk sözleşmende rolün bir basamak daha yüksek.",
		"El seleccionador ya sabe quién eres: empiezas con crédito para entrar en la primera lista.": "Milli takım teknik direktörü kim olduğunu zaten biliyor: ilk kadroya girmek için avantajlı başlıyorsun.",
		"Naciste con algo. Empiezas con 3 puntos de habilidad por repartir.":
			"Bir şeyle doğdun. Dağıtacak 3 yetenek puanıyla başlıyorsun.",
		"La familia te respalda: +$35.000 en el banco desde el primer día.":
			"Ailen arkanda: ilk günden bankada +$35.000.",
		"El técnico ya oyó hablar de ti. Debutas con su confianza, no en la grada.":
			"Hoca senin adını çoktan duydu. Tribünde değil, onun güveniyle başlıyorsun.",
		"El gol lo llevas puesto: +6 a potencia, precisión y efecto de salida.":
			"Gol kanında var: başlangıç gücü, isabet ve falsoya +6.",
		"Cargas un apellido: +$20.000 y 2 puntos de habilidad. La sombra pesa.":
			"Bir soyadı taşıyorsun: +$20.000 ve 2 yetenek puanı. Gölgesi ağır.",
		"Véncelo en un partido (con cualquier carrera) para desbloquearlo.":
			"Kilidini açmak için onu bir maçta yen (herhangi bir kariyerde).",
		"Completa una temporada en {0}ª división o ficha por un club de {1}ª para desbloquear.":
			"Kilidi açmak için {0}. ligde bir sezon tamamla ya da {1}. ligden bir kulübe imza at.",
		"LIGA ESPAÑOLA": "ISPANYA LIGI",
		"LIGA INGLESA": "INGILTERE LIGI",
		"LIGA ITALIANA": "ITALYA LIGI",
		"LIGA ALEMANA": "ALMANYA LIGI",
		"LIGA MEXICANA": "MEKSIKA LIGI",
		"LIGA LUSA": "LUSO LIGI",
		"LIGA FRANCESA": "FRANSA LIGI",
		"LIGA NEERLANDESA": "HOLLANDA LIGI",
		"LIGA BRASILEÑA": "BREZILYA LIGI",
		"LIGA ARGENTINA": "ARJANTIN LIGI",
		"LIGA AMERICANA": "AMERIKA LIGI",
		"LIGA SAUDI": "SUUDI LIGI",
		"LIGA TURCA": "TURKIYE LIGI",
		"LIGA BELGA": "BELÇIKA LIGI",
		"{0}G {1}A · {2} · {3}": "{0}G {1}A · {2} · {3}",
		"EQUIPO ENCENDIDO": "TAKIM ALEV ALDI",
		"EQUIPO FRÍO": "TAKIM SOGUK",
		"PORTERO EN LOS NERVIOS": "KALECI PANIKTE",
		"PORTERO TENSO": "KALECI GERGIN",




		"Diagonal del extremo": "Kanat oyuncusunun çaprazı",
		"El pasillo interior": "Yarım alan",
		"El embudo": "Huni",
		"La defensa volcada": "Kayan savunma",
		"Doblada por fuera": "Dıştan bindirme",
		"Aislado en la banda": "Kanatta yalnız",
		"La subida por fuera": "Dıştan koşu",
		"El tercer hombre": "Üçüncü adam",
		"Indirecta al costado del área": "Ceza sahası yanından endirekt",
		"Indirecta de segunda línea": "Uzaktan endirekt",
		"Contra el muro replegado": "Kalabalık barikata karşı",
		"Presión alta tras la pérdida": "Top kaybında önde baskı",
		"Contra tras córner rival": "Rakip kornerinden kontra",
		"Ley de la ventaja": "Avantaj kuralı",
		"Tres contra tres": "Üçe üç",
		"Falta lejana colgada al área": "Ceza sahasına uzaktan serbest vuruş",
		"Falta lejana desde la banda": "Kanattan uzak serbest vuruş",
		"Falta desde tres cuartos": "Orta sahadan serbest vuruş",
		"Cambio corto": "Kısa oyun değiştirme",
		"Cambio de banda": "Oyun değiştirme",
		"Cambio largo": "Uzun oyun değiştirme",
		"Salir de la presión": "Baskıdan çıkmak",
		"Cruza el medio campo": "Orta çizgiyi geç",

		"¡LA RECUPERASTE! ATACA": "TOPU KAPTIN! HUCUM",
		"GOL EN CONTRA": "YENILEN GOL",
		"DESBORDADO": "GEÇILDIN",
		"LA PARÓ TU PORTERO": "KALECIN KURTARDI",
		"LE DEJASTE TIRAR": "ŞUTA IZIN VERDIN",
		"Recuperar el balón": "Topu geri kazanmak",
		"DEFENSA": "SAVUNMA",
		"El balón NO es tuyo. Métete entre él y tu portería: al llegarle bien puesto, se la quitas.": "Top senin DEGIL. Onunla kalen arasına gir: iyi pozisyonda yetişirsen topu kaparsın.",
		"Te la sirven": "Sana servis",
		"Te la traen conduciendo y te la pasan. Apunta y remátala de primera, o se te escapa.": "Topu sürerek getirip sana pas veriyorlar. Nişan al ve tek vuruşta bitir, yoksa kaçar.",
		"Espera el pase; luego jala y suelta": "Pası bekle; sonra çek ve bırak",
		"REMATE AÉREO": "HAVADAN BITIRIŞ",
		"Cabezazos": "Kafa vuruşları",
		"Voleas": "Voleler",
		"Chilenas": "Rövaşatalar",
		"Te cuelgan el centro a la cabeza. Espera a que llegue y cabecea a puerta.": "Kafana orta yapıyorlar. Topun gelmesini bekle ve kaleye kafayı vur.",
		"Espera el centro; luego jala y suelta": "Ortayı bekle; sonra çek ve bırak",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que toque el suelo.": "Topu göğsüne atıyorlar: kontrol et ve yere değmeden vole vur.",
		"Espera el control; luego jala y suelta": "Kontrolü bekle; sonra çek ve bırak",
		"Saltas de espaldas al arco: apunta a puerta aunque no la veas.": "Kaleye sırtın dönük sıçrıyorsun: göremesen de kaleye nişan al.",
		"Raso al pie": "Yerden ayağa",
		"Te la ponen botando": "Sekerek gelen top",
		"¡De primera!": "Tek vuruşta!",
		"Espera el momento perfecto": "Mükemmel anı bekle",
		"¡Cabecea!": "Kafayı vur!",
		"Tocada a destiempo": "Zamanlama hatalı",
		"Tocada de refilón": "Sıyırarak vuruş",
		"¡Al primer toque!": "İlk dokunuşta!",
		"¡Al bote pronto!": "Yarım vole!",
		"¡Cazada al bote!": "Sekişte yakaladın!",
		"El bote te ganó": "Sekiş seni geçti",
		"Bote de refilón": "Sekişten sıyırdı",
		"¡La bajaste y pegaste!": "İndirdin ve vurdun!",
		"¡Control y tiro!": "Kontrol ve şut!",
		"Tiro a destiempo tras el control": "Kontrolden sonra şutta zamanlama hatası",
		"De refilón tras el control": "Kontrolden sonra sıyırdı",
		"¡Cabezazo pleno!": "Tam kafa!",
		"¡Con toda la frente!": "Tam alından!",
		"Saltaste a destiempo": "Ya erken ya geç sıçradın",
		"De refilón con la frente": "Alnından sıyırdı",
		"¡Volea!": "Vole!",
		"¡De pecho y volea!": "Göğüs ve vole!",
		"Volea a destiempo": "Volede zamanlama hatası",
		"Volea de refilón": "Sıyırarak vole",
		"¡Chilena de libro!": "Ders kitabı gibi rövaşata!",
		"Chilena a destiempo": "Rövaşatada zamanlama hatası",
		"Chilena de refilón": "Sıyırarak rövaşata",
		"Saltaste tarde": "Geç sıçradın",
		"Chilena tardía": "Geç kalan rövaşata",
		"Te adelantaste a la volea": "Voleye erken girdin",
		"Volea tardía": "Voleye geç kaldın",
		"Raso del lado ciego": "Kör noktandan",
		"Raso a la carrera": "Koşu yoluna yerden",
		"Tensa por el aire": "Havadan sert",
		"Te la cuelgan": "Havadan aşırtma",
		"Raso con rosca": "Falsolu yerden",
		"Raso largo": "Uzun ve yerden",
		"Filtrado al hueco": "Boşluğa ara pası",
		"Filtrado con rosca": "Falsolu ara pası",
		"Con comba": "Kavisli",
		"Centro a la cabeza": "Kafana orta",
		"Centro al pecho": "Göğsüne orta",
		"Centro a la chilena": "Rövaşata için orta",
		"Cambio de juego": "Oyun değiştirme",
		"Centro de la otra banda": "Uzak kanattan orta",
		"Al pecho desde la otra banda": "Uzak kanattan göğsüne orta",
		"Al pecho desde la banda": "Kanattan göğsüne orta",
		"Botando desde lejos": "Uzaktan sekerek",
		"Chilena desde la otra banda": "Uzak kanattan rövaşata için orta",
		"A media altura": "Uyluk hizasında",
		"Botando de muy lejos": "Çok uzaktan sekerek",
		"Centro con rosca": "Falsolu orta",
		"Chilena con rosca": "Rövaşata için falsolu orta",
		"Al pecho con rosca": "Göğsüne falsolu orta",
		"Tras el punto penal": "Penaltı noktasının arkası",
		"Córner a la cabeza": "Kafana korner",
		"Córner a la chilena": "Rövaşata için korner",
		"Córner al borde del área": "Ceza sahası çizgisine korner",
		"Falta colgada a la cabeza": "Kafana havadan serbest vuruş",
		"Falta colgada a la chilena": "Rövaşata için havadan serbest vuruş",
		"Falta colgada al pecho": "Göğsüne havadan serbest vuruş",
		"En la frontal": "Ceza sahası önü",
		"En el área": "Ceza sahası içi",
		"En el área chica": "Altıpasta",
		"Escorado en el área": "Ceza sahasında açıda",
		"Al costado del área": "Ceza sahası yanı",
		"Pegado a la banda": "Kanat çizgisinde",
		"Centrar por la banda": "Kanattan orta",
		"Pon el CENTRO a un compañero: se gana completándolo, no tirando a puerta.": "ORTAYI bir takım arkadaşına yap: şut atarak değil, ortayı tamamlayarak kazanırsın.",
		"Cuelga el centro a un compañero": "Ortayı bir takım arkadaşına gönder",
		"Centro corto": "Kısa orta",
		"Centro largo": "Uzun orta",
		"¡Centro puesto!": "Orta yerini buldu!",
		"El centro no llegó": "Orta ulaşmadı",
		"notaCENTRO PUESTO": "ORTA YERINDE",
		"Arrastra para correr; no hay nada más que tocar": "Koşmak için sürükle; basacak başka bir şey yok",
		"Ponte entre el balón y tu portería para robar. Al recuperar, sigue arrastrando y ataca.": "Topu kapmak için topla kalen arasına gir. Kazanınca sürüklemeye devam et ve hücum et.",
		"Arrastra para correr; toca con un segundo dedo para barrerte": "Koşmak için sürükle; kayarak müdahale için ikinci parmakla dokun",
		"FALTA": "FAUL",
		"RECUPERADA": "TOPU KAPTIN",
		"TE DESBORDÓ": "SENI GEÇTI",
		"Campo abierto": "Açık oyun",
		"PASE": "PAS",
		"Tu fondo: los minutos que aguantas —a tope juegas los 90' y llegas a la prórroga—, lo que te cuesta cada partido y lo que repones. También te hace menos propenso a lesionarte.":
			"Dayanıklılığın: kaç dakika dayandığın — tam doluyken 90 dakikanın tamamını oynar ve uzatmalara kadar gidersin —, her maçın sana maliyeti ve ne kadar toparlandığın. Sakatlanma eğilimini de azaltır.",
		"Copa de Campeones": "Elit Kupası",
		"Copa Europa": "Avrupa Kupası",
		"Copa Conferencia": "Challenge Kupası",
		"Jugador del Año": "Yılın Oyuncusu",
		"Bota (Liga)": "Gol Kralı (Lig)",
		"Mejor (Copa de Campeones)": "En İyi (Elit Kupası)",
		"Bota (Copa de Campeones)": "Gol Kralı (Elit Kupası)",
		"Asist. (Copa de Campeones)": "Asist (Elit Kupası)",
		"Mejor (Copa Europa)": "En İyi (Avrupa Kupası)",
		"Bota (Copa Europa)": "Gol Kralı (Avrupa Kupası)",
		"Asist. (Copa Europa)": "Asist (Avrupa Kupası)",
		"Mejor (Copa Conferencia)": "En İyi (Challenge Kupası)",
		"Bota (Copa Conferencia)": "Gol Kralı (Challenge Kupası)",
		"Asist. (Copa Conferencia)": "Asist (Challenge Kupası)",
		"VUELVEN A LLAMAR": "YINE ARIYORLAR",
		"TU AGENTE LA SOSTIENE": "MENAJERIN TUTUYOR",
		"NO SE DEJÓ SOSTENER": "TUTMADI",
		"SE HARTARON DE TUS NOES": "HAYIRLARINDAN BIKTILAR",
		"LLEGA MENOS DE LO QUE ERA": "ESKISINDEN AZ",
		"MEJORAN LA OFERTA": "TEKLIF ARTTI",
		"TRASPASO PACTADO": "TRANSFER TAMAM",
		"NO LLEGAN A LO QUE PIDEN": "ISTENEN PARAYA YETMIYOR",
		"RETIRAN LA PUJA": "TEKLIF ÇEKILDI",
		"HAY PELEA POR TI": "KAPIŞIYORLAR",
		"APRIETA POR TI": "SENI ISTIYOR",
		"COBRAN POR TU VENTA": "SATIŞTAN PAY ALDI",
		"¡Salió bien!": "İşe yaradı!",
		"Salió mal…": "Ters gitti…",
		"No les das el perfil todavía.": "Henüz aradıkları profile uymuyorsun.",
		"Ese club no existe.": "Böyle bir kulüp yok.",
		"Ya juegas ahí.": "Zaten orada oynuyorsun.",
		"Ya tienes su oferta sobre la mesa.": "Teklifleri zaten masada.",
		"Les dijiste que no en esta ventana.": "Bu transfer döneminde onlara hayır dedin.",
		"Es un club muy por debajo del tuyo: no bajan a por ti.":
			"Bu kulüp seninkinin çok altında: senin için aşağı inmezler.",
		"Está demasiadas categorías por encima: se sube de una en una.":
			"Çok fazla lig yukarıda: basamaklar tek tek çıkılır.",
		"No pueden pagar lo que costaría sacarte.":
			"Seni koparmanın maliyetini karşılayamazlar.",
		"Tu última concentración": "Son milli davetin",
		"{0}: {1} fuera en la fase de grupos (sin ti)": "{0}: {1} grup aşamasında elendi (sen yokken)",
		"{0} se clasificó para {1} (sin ti)": "{0} turnuvaya katılmaya hak kazandı: {1} (sen yokken)",
		"{0} se quedó fuera de {1}": "{0} katılamadı: {1}",
		"{0}: fuera en la fase de grupos con {1}": "{0}: {1} ile grup aşamasında elendin",
		"{0} se clasificó para {1}": "{0} turnuvaya katılmaya hak kazandı: {1}",
		"{0} no se clasificó para {1}": "{0} katılmaya hak kazanamadı: {1}",
		"{0} sólo jugó amistosos este año": "{0} bu yıl yalnızca hazırlık maçı oynadı",
		"{0} amistosos con {1}: {2} ganados": "{1} ile {0} hazırlık maçı: {2} galibiyet",
		"Tu palmarés": "Kupaların",
		"Tu temporada": "Sezonun",
		"Dónde juegas": "Nerede oynuyorsun",
		"El seleccionador": "Milli takım hocası",
		"Llevas el brazalete": "Kaptanlık bandı sende",
		"Ya eres del grupo": "Artık takımdan birisin",
		"Eliminado de la copa": "Kupadan elendin",
		"En dieciseisavos de copa": "Kupada son 32'de",
		"En octavos de copa": "Kupada son 16'da",
		"En cuartos de copa": "Kupada çeyrek finalde",
		"En semifinales de copa": "Kupada yarı finalde",
		"En la final de copa": "Kupa finalindesin",
		"Partidos con la selección": "Milli takımda maç",
		"Asistencias con la selección": "Milli takımda asist",
		"El Diez": "On Numara",
		"Llegar a llevar el 10 a la espalda.": "Sırtında 10 numarayı taşı.",
		"El Nueve de un Grande": "Bir Devin 9 Numarası",
		"Llevar el 9 en uno de los clubes más fuertes del mundo.":
			"Dünyanın en güçlü kulüplerinden birinde 9 numarayı giy.",
		"Adiós Internacional": "Milli Veda",
		"Colgar la camiseta de tu país por decisión propia, sin dejar el club.":
			"Kulübünü bırakmadan, kendi kararınla milli formayı bırak.",
		"Brazalete del País": "Ülkenin Bandı",
		"Llevar la cinta de capitán de tu selección.": "Milli takımının kaptanlık bandını tak.",
		"Rey de la Conference": "Challenge Kupası Kralı",
		"Ganar la Conference.": "Challenge Kupası'nı kazan.",
		"Ser el máximo goleador de la Conference.": "Challenge Kupası'nın gol kralı ol.",
		"Goles y Pases": "Goller ve Paslar",
		"Verdugo de Países Bajos": "Hollanda'nın Belası",
		"Cuarenta Mil": "Kırk Bin",
		"TELEVISIÓN": "TELEVIZYON",
		"MIS CAMISETAS": "FORMALARIM",
		"LÁMPARA": "LAMBA",
		"JARDÍN": "BAHÇE",
		"CINTA": "KOŞU BANDI",
		"COCINA": "MUTFAK",
		"ESPEJO": "AYNA",
		"LIBRERO": "KITAPLIK",
		"MANCUERNAS": "DAMBIL",
		"PLANTA": "BITKI",
		"MANSION": "KONAK",
		"FINCA": "ÇIFTLIK",
		"PREMIOS AL MEJOR": "YILIN OYUNCUSU",
		"Premios al Mejor": "Yılın Oyuncusu ödülleri",
		"JUGADOR DEL AÑO": "YILIN OYUNCUSU",
		"BOTA": "GOL KR.",
		"Bota": "Gol Kralı",
		"Torneo Europeo": "Avrupa Turnuvası",
		"Torneo Sudamericano": "Güney Amerika Turnuvası",
		"Torneo Norteamericano": "Kuzey Amerika Turnuvası",
		"Torneo Asiático": "Asya Turnuvası",
		"Torneo Africano": "Afrika Turnuvası",
		"Torneo de Oceanía": "Okyanusya Turnuvası",
		"TODOS LOS PREMIOS AL MEJOR": "TUM YILIN OYUNCULARI",
		"{0} PREMIOS AL MEJOR": "{0} YILIN OYUNCUSU",
		"Falta indirecta en el área": "Ceza sahasında endirekt serbest vuruş",
		"CARRERA": "KARIYER",
		"TIROS": "ŞUT",
		"ACELERACION": "HIZLANMA",
		"ENTRADA": "KAPMA",
		"CRUZ": "HAÇ",
		"INICIAL": "HARF",
		"Sólido": "Dolu",
		"Espina": "Diken",
		"Puntos": "Noktalar",
		"Estrellas": "Yıldızlar",
		"Pelo 2": "Saç 2",
		"Pelo 3": "Saç 3",
		"Pelo 5": "Saç 5",
		"Pelo 6": "Saç 6",
		"Cejas 1": "Kaş 1",
		"Cejas 2": "Kaş 2",
		"Cejas 3": "Kaş 3",
		"Cejas 4": "Kaş 4",
		"Cejas 5": "Kaş 5",
		"Rastas": "Rasta",
		"Peinado (pieza)": "Saç modeli (parça)",
		"Ninguno": "Yok",
		"Máscara": "Maske",
		"Banda": "Bant",
		"Banda roja": "Kırmızı bant",
		"Banda azul": "Mavi bant",
		"Banda negra": "Siyah bant",
		"Banda oro": "Altın bant",
		"Fade alto": "Yüksek fade",
		"Fade bajo": "Alçak fade",
		"Peinado atrás": "Geriye tarama",
		"Quiff corto": "Kısa kabarık",
		"Banda pelo": "Saç bandı",
		"Doble brazalete": "Çift bant",
		"Media manga": "Yarım kol",
		"Banda verde": "Yeşil bant",
		"Banda rosa": "Pembe bant",
		"Banda naranja": "Turuncu bant",
		"Económicos": "Ekonomik",
		"Clásicos": "Klasikler",
		"Contemporáneos": "Modern",
		"Sin pelo": "Saçsız",
		"Cortes cortos": "Kısa kesimler",
		"Cortes medianos": "Orta kesimler",
		"Cortes largos": "Uzun kesimler",
		"Accesorio de pelo": "Saç aksesuarı",
		"Banda deportiva": "Ter bandı",
		"Cinta fina": "İnce kurdele",
		"Liga para recogido": "Saç lastiği",
		"Máscara de protección": "Koruyucu maske",
		"Sin máscara": "Maskesiz",
		"Con máscara": "Maskeli",
		"Tipo de ceja": "Kaş şekli",
		"Sin cejas": "Kaşsız",
		"Tatuaje facial": "Yüz dövmesi",
		"Lado del rostro": "Yüzün tarafı",
		"Tinta facial": "Yüz mürekkebi",
		"Conjuntos completos": "Tam kombinler",
		"Clásico": "Klasik",
		"Del traje": "Takımla uyumlu",
		"Pañuelo de saco": "Cep mendili",
		"Cinturón": "Kemer",
		"Color del accesorio": "Aksesuar rengi",
		"Deportivo": "Spor",
		"De lujo": "Lüks",
		"CLASIF J{0}": "ELEME {0}.H",
		"SIN PARTIDO": "MAÇ YOK",


		"Aperturas vistas": "Görülen açılışlar",
		"· la saltaron": "· atladılar",
		"· salieron al campo": "· sahaya çıktılar",
		"· el estadio tardó más de 3 s (el cine perdió hasta 1 s)": "· stadyum 3 s'den uzun sürdü (giriş en fazla 1 s kaybetti)",
		"Apertura: décimas hasta ver el estadio (peor)": "Açılış: stadyum görünene kadar saniyenin onda biri (en kötü)",
		"·· sin ninguna tirada (no gastó cupo)": "·· hiç çekiliş yapmadan (hak harcamadı)",
		"·· con una tirada": "·· bir çekilişle",
		"·· con dos o más tiradas": "·· iki veya daha fazla çekilişle",
		"Academias empezadas": "Başlanan akademiler",
		"· pasaron el 1 (MUEVETE)": "· 1 numarayı geçtiler (HAREKET ET)",
		"· pasaron el 2 (PEGALE)": "· 2 numarayı geçtiler (VUR)",
		"· pasaron el 3 (ENCARA)": "· 3 numarayı geçtiler (USTUNE GIT)",
		"· pasaron el 4 (SIRVE AL AREA)": "· 4 numarayı geçtiler (ORTA YAP)",
		"· pasaron el 5 (BALON PARADO)": "· 5 numarayı geçtiler (DURAN TOP)",
		"Academias terminadas": "Biten akademiler",
		"{0} espera respuesta":
			"{0} cevap bekliyor",
		"Tu oferta caduca. Nadie va a decidir por ti.":
			"Teklifinin süresi doluyor. Senin yerine kimse karar vermeyecek.",
		"Hoy es tu cumpleaños":
			"Bugün doğum günün",
		"El vestuario te ha preparado algo.":
			"Soyunma odası sana bir şey hazırladı.",
		"Tu once te espera.":
			"İlk 11'in seni bekliyor.",
		"Ya casi estás en forma":
			"Neredeyse formdasın",
		"Una semana más y vuelves al once.":
			"Bir hafta daha ve ilk 11'e dönüyorsun.",
		"Tu carrera sigue ahí":
			"Kariyerin hâlâ orada",
		"Tu temporada con el {0} sigue a medias.":
			"{0} takımıyla sezonun yarıda kaldı.",
		"AVISOS":
			"UYARI",
		"AVISARME EN EL TELÉFONO":
			"TELEFONDA HATIRLAT",
		"Un recordatorio cuando algo te espera: una oferta que caduca, tu cumpleaños, la vuelta de una lesión. Nunca más de uno al día.":
			"Seni bir şey beklediğinde bir hatırlatma: süresi dolan bir teklif, doğum günün, sakatlığın bitişi. Günde asla birden fazla değil.",
		"Los tienes bloqueados para este juego en los Ajustes de tu teléfono.":
			"Telefonunun Ayarlar'ında bu oyun için bildirimleri engellemişsin.",
		"Altas abiertas (NUEVA CARRERA)": "Açılan kayıtlar (YENI KARIYER)",
		"QUITARLO":
			"KALDIR",
		"El día del calendario de fuera en el que el juego se acuerda de ti. Sin año: no hace falta.":
			"Dışarıdaki takvimde oyunun seni hatırladığı gün. Yıl yok: gerek yok.",
		"· entraron al campo":
			"· sahaya girdiler",
		"· escribieron un nombre (ya jugando)":
			"· bir isim yazdılar (zaten oynarken)",
		"SIGO":
			"VARIM",
		"LO DEJO POR HOY":
			"BUGUNLUK BU KADAR",
		"Eso es el juego entero: apuntas, ajustas la fuerza y pegas. Quedan unos ejercicios más para sacarte mejores ofertas de club.":
			"Oyunun tamamı bu: nişan alırsın, gücü ayarlarsın ve vurursun. Daha iyi kulüp teklifleri kazanman için birkaç antrenman daha kaldı.",
		"· marcaron su primer gol en la escuela":
			"· okulda ilk gollerini attılar",
		"· escribieron un nombre": "· bir isim yazdılar",
		"· aceptaron jugarla": "· oynamayı kabul ettiler",
		"· llegaron a marcar un gol": "· gol atmayı başardılar",
		"Entradas a LA CAJA desde el hub": "Ana ekrandan KUTU'ya girişler",
		"Carreras creadas": "Oluşturulan kariyerler",
		"Jornadas jugadas": "Oynanan haftalar",
		"Arranques del juego (en frío)": "Oyun açılışları (soğuk başlatma)",
		"· el anterior se cerró solo (crash o memoria)": "· öncekisi kendiliğinden kapandı (çökme veya bellek)",
		"· · y fue en pleno partido": "· · ve maçın ortasındaydı",
		"· · con la app inactiva (¿cerrada desde el selector?)": "· · uygulama etkin değilken (uygulama seçiciden mi kapatıldı?)",
		"· · tras un aviso de memoria de iOS": "· · iOS bellek uyarısından sonra",
		"Avisos de memoria de iOS": "iOS bellek uyarıları",
		"· en pleno partido": "· maçın ortasında",
		"Partidos jugados: ganados": "Oynanan maçlar: kazanılan",
		"· empatados": "· berabere",
		"· perdidos": "· kaybedilen",
		"Partidos abandonados desde la pausa": "Duraklatma menüsünden bırakılan maçlar",
		"Minutos en el campo": "Sahada geçen dakika",
		"Minutos en menús": "Menülerde geçen dakika",
		"Goles marcados": "Atılan goller",
		"· con la selección": "· milli takımda",
		"· de penal": "· penaltıdan",
		"· · a lo Panenka": "· · Panenka usulü",
		"· de tiro libre": "· serbest vuruştan",
		"· de córner": "· kornerden",
		"· · olímpicos": "· · doğrudan kornerden",
		"· de cabeza": "· kafayla",
		"· de volea": "· voleyle",
		"· de chilena": "· rövaşatayla",
		"· en mano a mano": "· karşı karşıya",
		"· en disparo frontal": "· önden şutla",
		"· desde lejos": "· uzaktan",
		"· desde ángulo cerrado": "· dar açıdan",
		"· al contraataque": "· kontra ataktan",
		"· en centro al área": "· ceza sahasına ortadan",
		"· en rebote en el área": "· ceza sahasında dönen toptan",
		"· en la jugada de volea": "· vole pozisyonlarında",
		"· en saque de banda largo": "· uzun taçtan",
		"· en falta indirecta en el área": "· ceza sahasında endirekt serbest vuruştan",
		"· tras regate libre": "· serbest çalımdan sonra",
		"· saliendo desde tu campo": "· kendi yarı sahandan çıkarak",
		"· desde un saque de meta": "· kale vuruşundan",
		"· en otras jugadas": "· diğer pozisyonlarda",
		"Hat-tricks (3 goles o más en un partido)": "Hat-trick (bir maçta 3 veya daha fazla gol)",
		"Autogoles": "Kendi kalesine goller",
		"Penales fallados en el partido": "Maçta kaçırılan penaltılar",
		"Penales fallados en tandas": "Seri penaltılarda kaçırılanlar",
		"Tiros desviados por un defensa": "Bir defans oyuncusundan seken şutlar",
		"· que acabaron en córner": "· kornerle biten",
		"· que el defensa metió en su portería": "· defans oyuncusunun kendi kalesine attığı",
		"· · a menos de 20 m": "· · 20 m'den yakın",
		"· · de 20 a 25 m": "· · 20 ila 25 m",
		"· · de 25 a 30 m": "· · 25 ila 30 m",
		"· · a 30 m o más": "· · 30 m veya daha uzak",
		"· · rematados de cabeza": "· · kafayla tamamlanan",
		"· · rematados de volea": "· · voleyle tamamlanan",
		"· · rematados de chilena": "· · rövaşatayla tamamlanan",
		"· a menos de 6 m del arco": "· kaleye 6 m'den yakın",
		"· de 6 a 16 m": "· 6 ila 16 m",
		"· de 16 a 25 m": "· 16 ila 25 m",
		"· de 25 a 30 m": "· 25 ila 30 m",
		"· a 30 m o más": "· 30 m veya daha uzak",
		"Gol más lejano (m)": "En uzak gol (m)",
		"Tiro libre más lejano metido (m)": "Golle biten en uzak serbest vuruş (m)",
		"Pase de gol más largo (m)": "En uzun asist pası (m)",
		"Asistencias dadas": "Yapılan asistler",
		"Partidos jugados con el club": "Kulüple oynanan maçlar",
		"Partidos jugados con la selección": "Milli takımla oynanan maçlar",
		"Derbis ganados": "Kazanılan derbiler",
		"Partidos ganados remontando": "Geri dönüşle kazanılan maçlar",
		"Títulos de equipo ganados": "Kazanılan takım kupaları",
		"· ligas": "· ligler",
		"· copas": "· kupalar",
		"· continentales de clubes y Mundial de Clubes": "· kıtasal kulüp kupaları ve Kulüpler Dünya Şampiyonası",
		"· ascensos": "· üst lige çıkışlar",
		"· Mundiales con la selección": "· milli takımla Dünya Şampiyonaları",
		"· continentales con la selección": "· milli takımla kıtasal kupalar",
		"Premios individuales": "Bireysel ödüller",
		"· Balones de Oro": "· Yılın Oyuncusu ödülleri",
		"Veces Jugador del Partido": "Maçın Oyuncusu seçilme sayısı",
		"Veces Jugador del Mes": "Ayın Oyuncusu seçilme sayısı",
		"Traspasos firmados": "İmzalanan transferler",
		"· millones pagados por ellos": "· onlar için ödenen milyonlar",
		"Cargas con un técnico duplicado (se arregló solo)": "Teknik direktörü iki kez görünen yüklemeler (kendiliğinden düzeldi)",
		"· arreglos del carrusel de técnicos en ellas": "· bunlarda hoca değişikliği düzeltmeleri",
		"Goles de club de antes (carreras guardadas)": "Önceki kulüp golleri (kayıtlı kariyerler)",
		"Asistencias de club de antes": "Önceki kulüp asistleri",
		"Partidos de club de antes": "Önceki kulüp maçları",
		"Títulos de equipo de antes": "Önceki takım kupaları",
		"Premios individuales de antes": "Önceki bireysel ödüller",
		"Más goles de club en una carrera": "Bir kariyerde en çok kulüp golü",
		"Más asistencias de club en una carrera": "Bir kariyerde en çok kulüp asisti",
		"Más goles en un partido": "Bir maçta en çok gol",
		"Más títulos de equipo en una carrera": "Bir kariyerde en çok takım kupası",
		"Más Balones de Oro en una carrera": "Bir kariyerde en çok Yılın Oyuncusu ödülü",
		"Jornadas simuladas o vistas": "Simüle edilen veya izlenen haftalar",
		"Temporadas terminadas": "Biten sezonlar",
		"Carreras llevadas hasta el retiro": "Emekliliğe kadar götürülen kariyerler",
		"Aperturas de HABILIDAD": "YETENEK açılışları",
		"Aperturas de CONTRATO": "SOZLESME açılışları",
		"Aperturas de RELACIONES": "ILISKILER açılışları",
		"Aperturas de ASPECTO": "GORUNUM açılışları",
		"Aperturas de TIENDA": "MAGAZA açılışları",
		"Aperturas de CASA": "EV açılışları",
		"Aperturas de TORNEOS": "TURNUVALAR açılışları",
		"Aperturas de MERCADO": "PIYASA açılışları",
		"Aperturas de CARRERA": "KARIYER açılışları",
		"Aperturas de CALENDARIO": "TAKVIM açılışları",
		"Aperturas de PLANTILLA": "KADRO açılışları",
		"Aperturas de RANKING": "SIRALAMA açılışları",
		"Aperturas de MAPA": "HARITA açılışları",
		"Aperturas de TROFEOS": "KUPALAR açılışları",
		"Aperturas de CLUBES": "KULUPLER açılışları",
		"Aperturas de LEYENDAS": "EFSANELER açılışları",
		"Aperturas de BALON": "YILIN OYUNCUSU açılışları",
		"Sesiones de PRÁCTICA": "ALIŞTIRMA seansları",
		"Sesiones de ENTRENO en el club": "Kulüpte ANTRENMAN seansları",
		"Aperturas del EDITOR de planteles": "Kadro EDITORU açılışları",
		"Decisiones contestadas": "Yanıtlanan kararlar",
		"Semana más lejana alcanzada": "Ulaşılan en ileri hafta",
		"Temporada más lejana alcanzada": "Ulaşılan en ileri sezon",
		"Nivel más alto alcanzado": "Ulaşılan en yüksek seviye",
		"+{0} PTS DE HABILIDAD": "+{0} YETENEK PUANI",
		"+{0} XP": "+{0} XP",
		"AL BANQUILLO": "KULUBEYE",
		"PIERDES LA TITULARIDAD": "FORMAYI KAYBEDIYORSUN",


		"CAMBIO": "ÇIKTIN",
		"TE CAMBIAN":
			"OYUNDAN ALINDIN",
		"TU NOTA CUANDO TE CAMBIARON":
			"ÇIKTIGINDAKI NOTUN",
		"Te cambian, y no por descansar. Al túnel, y nadie aplaude.":
			"Oyundan alındın, hem de dinlenmek için değil. Tünele gidiyorsun ve kimse alkışlamıyor.",
		"Te cambian, y no por descansar. Fuera del campo, y nadie aplaude.":
			"Oyundan alındın, hem de dinlenmek için değil. Saha dışına çıkıyorsun ve kimse alkışlamıyor.",
		"TE SACAN DEL CAMPO": "KENARA ALINDIN",
		"OCASIONES SEGUIDAS FALLADAS": "ARKA ARKAYA KAÇAN FIRSAT",
		"MINUTO": "DAKIKA",
		"El míster no esperó a la cuarta. Fuera del campo, y nadie aplaude.":
			"Hoca dördüncüsünü beklemedi. Saha dışına çıkıyorsun ve kimse alkışlamıyor.",
		"El míster no esperó a la cuarta. Al túnel, y nadie aplaude.":
			"Hoca dördüncüsünü beklemedi. Tünele gidiyorsun ve kimse alkışlamıyor.",
		"LA CONFIANZA DEL TÉCNICO": "HOCANIN GUVENI",
		"Hoy miras desde aquí. El sitio no se pierde: se deja de merecer.":
			"Bugün buradan izliyorsun. Yer kaybedilmez: hak edilmez olur.",
		"LA FINAL": "FINAL",
		"VAMOS": "HADI",
		"HIMNO": "MARŞ",
		"CAMISETA DE VITRINA": "VITRINLIK FORMA",
		"LA FINAL DE EUROPA": "AVRUPA FINALI",
		"LA FINAL DE TU SELECCION": "MILLI TAKIMININ FINALI",
		"LA FINAL DEL MUNDIALITO": "KULUP DUNYA FINALI",
		"LA FINAL DE COPA": "KUPA FINALI",
		"ENFRENTE, {0}": "KARŞINDA: {0}",
		"NOCHE EUROPEA": "AVRUPA GECESI",
		"DESDE EL BANQUILLO": "KULUBEDEN",



		"TU SELECCION": "ULKEN",
		"RENOVACION": "SOZLESME",
		"FICHAJE": "IMZA",
		"SIGUES EN CASA": "KALIYORSUN",
		"FIRMADO Y CERRADO": "IMZALANDI, BITTI",
		"por partido": "maç başına",
		"Te quedas porque quieres. Eso, en este oficio, lo firman pocos.":
			"İstediğin için kalıyorsun. Bu meslekte buna imza atan az olur.",



		"Pagaron por ti antes de verte jugar aquí. Ahora hay que darles la razón.":
			"Seni burada oynarken görmeden para ödediler. Şimdi onları haklı çıkarmalısın.",
		"Llegaste sin que nadie pagara un peso. Eso también hay que demostrarlo.":
			"Kimse bir kuruş ödemeden geldin. Bunu da kanıtlamak gerekir.",
		"HOY, EN TU CASA": "BUGUN, EVINDE",
		"HOY, EN LA SUYA": "BUGUN, ONLARDA",
		"tu puesto": "senin yerin",
		"el suyo": "onlarınki",
		"tus goles": "gollerin",
		"Esa casa fue tuya. Hoy no te van a perdonar ni una.": "O ev seninti. Bugün sana hiçbir şeyi affetmeyecekler.",
		"tu dorsal": "forma numaran",
		"No hay plan de partido que arregle un derbi. Se gana o se aguanta.":
			"Hiçbir maç planı bir derbiyi çözmez. Ya kazanılır ya dayanılır.",




		"Sois vecinos en la tabla y en la ciudad. Esto no se olvida ni ganándolo.":
			"Hem tabloda hem şehirde komşusunuz. Kazansan bile bu unutulmaz.",
		"Vienen a tu casa a quitarte el sitio. Perder hoy vale por tres derrotas.":
			"Yerini almak için evine geliyorlar. Bugün kaybetmek üç mağlubiyet sayılır.",
		"Vas a su casa de líder. No hay tarde que les guste más.":
			"Lider olarak onların evine gidiyorsun. Daha çok sevdikleri bir akşam yok.",
		"Van por delante todo el año. Hoy la tabla no cuenta.":
			"Bütün yıl öndeler. Bugün tablo sayılmaz.",


		"PASAS DE RONDA": "TUR ATLADIN",
		"ELIMINADO": "ELENDIN",
		"el cruce": "eşleşme",
		"rondas ganadas": "kazanılan tur",
		"Una noche más y hay copa. En esta sala ya no habla nadie de suerte.":
			"Bir gece daha ve kupa var. Bu odada artık kimse şanstan bahsetmiyor.",
		"Semifinales. Quedan dos partidos para levantarla.":
			"Yarı final. Kupayı kaldırmaya iki maç kaldı.",
		"{0} fuera. El cuadro sigue abierto y vosotros dentro.":
			"Elenen: {0}. Tablo hâlâ açık ve siz içindesiniz.",
		"Fuera a la primera. El vestuario se vacía sin que nadie diga nada.":
			"İlk turda elendiniz. Soyunma odası kimse bir şey demeden boşalıyor.",
		"A un partido de la final. Esta sala va a tardar en olvidarlo.":
			"Finale bir maç uzaktasınız. Bu oda bunu kolay unutmayacak.",
		"{0} os deja fuera. Se acabó la copa y quedan cuarenta domingos.":
			"Sizi eleyen: {0}. Kupa bitti ve önünüzde kırk pazar var.",
		"{0} os deja fuera. El siguiente es dentro de cuatro años.":
			"Sizi eleyen: {0}. Bir sonraki dört yıl sonra.",


		"Llevas {0} sin ganarles. En esta sala nadie lo ha olvidado.":
			"{0} maçtır onları yenemiyorsun. Bu odada kimse unutmadı.",
		"Nunca les has ganado. Algún día tiene que ser el primero.":
			"Onları hiç yenemedin. Bir gün ilki olmak zorunda.",
		"No les ganas desde hace {0} años. La gente lleva la cuenta.":
			"{0} yıldır onları yenemiyorsun. Herkes sayıyor.",
		"Llevas {0} seguidos contra ellos. Hoy vienen a por eso.":
			"Onlara karşı üst üste {0} maç. Bugün bunun için geliyorlar.",


		"{0} os ha marcado {1} en estos derbis. Hoy no lo pierdas de vista.":
			"{0} bu derbilerde size {1} gol attı. Bugün onu gözden kaçırma.",

		"AHORA MANDAS TÚ": "ARTIK SOZ SENDE",
		"LAS ÓRDENES": "TALIMATLAR",
		"EL CAMINO": "YOL",
		"Mientras apuntas, toca a un compañero: cada toque cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.":
			"Nişan alırken bir takım arkadaşına dokun: her dokunuş talimatını değiştirir. Mavi kaleye koşar, kehribar yerinde kalır, eflatun adamını peşinden sürükler.",
		"El suelo enseña a dónde irá y se borra conforme lo corre. Máximo tres órdenes, sólo duran esa jugada, y arrancan cuando tiras o regateas.":
			"Zemin nereye gideceğini gösterir ve o koştukça silinir. En fazla üç talimat, yalnızca o pozisyonda geçerli ve şut çektiğinde ya da çalım attığında başlar.",

		"TU TAQUILLA": "DOLABIN",
		"FIN DE ETAPA": "DEVRIN SONU",

		"SE VA AL RIVAL": "RAKIBE GIDIYOR",
		"FICHA POR EL RIVAL": "RAKIBE IMZA ATTI",
		"venía de": "geldiği kulüp",
		"Se fue gratis. A ellos.": "Bedelsiz gitti. Hem de onlara.",
		"Lo pagaron, y lo pagaron caro. Sigue doliendo.": "Para ödediler, hem de çok. Hâlâ acıtıyor.",

		"CIERRA EL MERCADO": "TRANSFER BITIYOR",
		"PIDEN": "BEDEL",
		"SOLO PREGUNTA": "SADECE SORDU",
		"LES FALTAN {0}": "EKSIK: {0}",

		"SE QUEDA": "KALIYOR",
		"Se queda. El traspaso se cae.": "Kalıyor. Transfer suya düştü.",
		"Ya lo tenía decidido. Al menos sabe que se lo pediste.": "Kararını çoktan vermişti. En azından ondan istediğini biliyor.",
		"Le has quitado la última duda: se va.": "Son şüphesini de sen giderdin: gidiyor.",
		"Le dio la vuelta: se queda igual.": "Fikrini değiştirdi: yine de kalıyor.",
		"Sin que nadie le dijera nada, se queda.": "Kimse ona bir şey demeden kalıyor.",
		"Se va, y tú no tuviste nada que ver.": "Gidiyor ve senin bununla hiçbir ilgin yoktu.",
		"SE LO QUIEREN LLEVAR": "ONU ISTIYORLAR",
		"SUENA PARA OTRO": "ADI BAŞKA YERDE",
		"PEDIRLE QUE SE QUEDE": "KALMASINI ISTE",
		"DECIRLE QUE ES SU OPORTUNIDAD": "FIRSATI KAÇIRMA DE",
		"TU VESTUARIO": "TAKIMIN",
		"SE LLEVAN A {0}": "{0} GIDIYOR",
		"lo quiere": "isteyen",
		"le quedan": "kalan",
		"Un compañero tuyo tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "Bir takım arkadaşının masada bir teklifi var ve henüz evet demedi. Soyunma odasında yalnızsınız ve sana senin yerinde olsan ne yapacağını soracak.",
		"{0} tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "{0} adlı oyuncunun masada bir teklifi var ve henüz evet demedi. Soyunma odasında yalnızsınız ve sana senin yerinde olsan ne yapacağını soracak.",
		"TU CLUB TE RETIENE": "KULUBUN SATMIYOR",
		"No te dejan salir: pide el traspaso primero.": "Gitmene izin vermiyorlar: önce transfer iste.",
		"No renuevas: te ponen en el escaparate.": "Sözleşme uzatmıyorsun: seni vitrine koyuyorlar.",
		"Tu club te vende. Falta tu respuesta.": "Kulübün seni satıyor. Cevabını bekliyorlar.",
		"Quieren cederte. Falta tu respuesta.": "Seni kiralamak istiyorlar. Cevabını bekliyorlar.",
		"Aceptaste salir: te ofrecen a quien pregunte.": "Gitmeyi kabul ettin: seni soran herkese teklif ediyorlar.",
		"Pediste salir: ya no te retienen.": "Gitmek istedin: artık seni tutmuyorlar.",
		"Pediste cesión: llegan destinos cada ventana.": "Kiralık gitmek istedin: her pencerede yeni adresler geliyor.",
		"ULTIMA JORNADA": "SON HAFTA",
		"Ultima jornada: mañana ya no hay mercado.": "Son hafta: yarın artık transfer yok.",
		"MERCADO ABIERTO": "TRANSFER AÇIK",
		"QUEDAN {0}": "KALAN: {0}",
		"INTERESADO": "ILGILI",
		"Quedan {0} jornadas de mercado.": "Transferin kapanmasına {0} hafta kaldı.",
		"La ventana cierra esta noche.": "Transfer penceresi bu gece kapanıyor.",
		"Se cerró la ventana.": "Transfer penceresi kapandı.",
		"TE VAS": "GIDIYORSUN",
		"TE QUEDAS": "KALDIN",
		"ofertas": "teklif",
		"la mejor": "en iyisi",
		"pedían": "istenen",
		"Acordado en el último minuto.": "Son dakikada anlaşıldı.",
		"Nadie llegó a lo que pedía tu club.": "Kimse kulübünün istediği bedele ulaşmadı.",
		"Se cerró la ventana y no llamó nadie.": "Pencere kapandı ve kimse aramadı.",

		"SE VA LA ESTRELLA": "YILDIZ GIDIYOR",
		"destino": "gittiği yer",
		"traspaso": "bonservis",
		"Con ese dinero llega {0}.": "O parayla gelen: {0}.",
		"Acabó contrato y nadie lo renovó.": "Sözleşmesi bitti ve kimse uzatmadı.",
		"El club todavía no ha fichado a nadie en su lugar.": "Kulüp henüz yerine kimseyi almadı.",
		"Ni un balón, ni una camiseta. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "Ne bir top ne bir forma. Burada senden hiçbir şey kalmadı, sen de bir şey götürmüyorsun.",
		"Una sola cosa cabe en la maleta. Con una basta para acordarse.": "Bavula tek bir şey sığar. Hatırlamak için biri yeter.",
		"Lo que cabe en una maleta después de todos estos años.": "Bunca yılın ardından bir bavula sığanlar.",
		"EL DORSAL QUE DEJASTE": "BIRAKTIGIN NUMARA",
		"SIGUE AHI": "HALA ORADA",
		"EL {0}": "NO. {0}",
		"lo llevaste": "sen giydin",
		"hoy llevas": "şimdi giydiğin",
		"Lo llevaste una temporada. A alguien le bastó.": "Bir sezon giydin. Birine yetti.",
		"Tú cambiaste de número. Él no.": "Sen numaranı değiştirdin. O değiştirmedi.",
		"EL PORTERO DE ENFRENTE": "RAKIP KALECI",
		"YA TE CONOCE": "SENI TANIYOR",
		"LE HAS METIDO {0}": "ONA {0} GOL ATTIN",
		"TU VILLANO": "BAŞ BELAN",
		"TE HA MARCADO {0} EN ESTE DERBI": "BU DERBIDE SANA {0} GOL ATTI",
		"TE CONOCE DE ANTES": "ESKI TANIDIK",
		"CARA A CARA": "YUZ YUZE",
		"TE PELEA EL GOLEO": "GOL YARISINDAKI RAKIBIN",
		"TE PELEA LAS ASISTENCIAS": "ASIST YARISINDAKI RAKIBIN",
		"PRONÓSTICO": "TAHMIN",
		"FAVORITO": "FAVORI",
		"{0} TEMPORADAS JUNTOS EN {1}": "{1}: {0} SEZON BIRLIKTE",
		"reencuentros": "yeniden karşılaşma",
		"Todavía no sabe por dónde le vas a entrar.": "Hâlâ ona hangi taraftan geleceğini bilmiyor.",
		"Nadie le ha hecho más daño que tú.": "Ona senden çok kimse zarar vermedi.",
		"LA PIZARRA DEL RIVAL": "RAKIBIN TAHTASI",
		"ESE ERES TU": "BU SENSIN",
		"LA CHARLA DE HOY": "BUGUNKU KONUŞMA",
		"TE ESPERABAN": "BEKLIYORLARDI",
		"EL VERDUGO": "CELLATLARI",
		"{0} GOLES DESPUES": "{0} GOL SONRA",
		"No se junta esta gente por un jugador cualquiera.": "Bu kadar insan sıradan bir oyuncu için toplanmaz.",
		"De todo lo que hay en esa pizarra, la única foto es la tuya.": "O tahtadaki her şeyin arasında tek fotoğraf seninki.",
		"TE CANTAN": "ADINI SOYLUYORLAR",
		"OVACION": "AYAKTA ALKIŞ",
		"TE OVACIONAN": "AYAKTALAR",
		"Aplauden los que venían a verte perder. Eso no lo dan dos veces.":
			"Kaybetmeni izlemeye gelenler alkışlıyor. Bu iki kez olmaz.",
		"domingos": "pazarlar",
		"tu nota": "notun",
		"afición": "taraftar",
		"No marcaste. Da igual: se aprendieron tu nombre igual.": "Gol atmadın. Fark etmez: adını yine de ezberlediler.",
		"EMPIEZAS EN EL BANQUILLO": "YEDEK BAŞLIYORSUN",
		"La primera vez que el once empieza sin ti. Desde aquí también se mira el partido.": "İlk 11 ilk kez sensiz başlıyor. Maç buradan da izlenir.",
		"división": "lig",
		"aforo": "kapasite",
		"Hasta aquí se sube. Ahora hay que quedarse.": "Çıkılabilecek en yüksek yer burası. Şimdi burada kalmak lazım.",
		"Un escalón más. Desde aquí se ve el de arriba.": "Bir basamak daha. Buradan bir üstü görünüyor.",
		"Todo el mundo empieza en un campo como éste.": "Herkes böyle bir sahada başlar.",
		"SE RETIRA": "BIRAKIYOR",
		"La cantera del {1} no para: {0}, {2} años, ya es titular": "{1} altyapısı durmuyor: {2} yaşındaki {0} şimdiden ilk 11'de",
		"{0}, {2} años, se gana un puesto en el once del {1}": "{2} yaşındaki {0}, {1} ilk 11'inde yer kaptı",
		"{0}, {2} años, vuelve de su cesión en el {3} y se gana el once del {1}": "{2} yaşındaki {0}, {3} takımındaki kiralık döneminden döndü ve {1} ilk 11'inde yer kaptı",
		"EL ADIOS": "VEDA",
		"TEMPORADAS EN ESTA CASA": "BU EVDEKI SEZONLAR",
		"Ni una copa que sacar al césped, y el estadio en pie igual.":
			"Çime çıkarılacak tek bir kupa yok, yine de stadyum ayakta.",
		"Aquí empezó todo. Y aquí se acaba, con todo lo que ganaste puesto.":
			"Her şey burada başladı. Ve burada bitiyor, kazandığın her şey önünde.",
		"Los que te vieron crecer se quedaron de pie hasta el final.":
			"Büyümeni izleyenler sonuna kadar ayakta kaldı.",
		"EL BRAZALETE": "KAPTANLIK",
		"tu media": "genel",
		"temporada": "sezon",
		"El vestuario votó y salió tu nombre. Ahora te toca sostenerlo.":
			"Soyunma odası oy verdi ve senin adın çıktı. Şimdi onu taşıma sırası sende.",
		"Nadie regala esta cinta: la ganaste domingo a domingo. Ahora no la sueltes.":
			"Bu bandı kimse hediye etmez: pazar pazar kazandın. Şimdi bırakma.",
		"VISITANTE": "DEPLASMAN",
		"VUELTA": "DONUŞ",
		"NO TE HAN PERDONADO": "SENI AFFETMEDILER",
		"Te fuiste al rival. Cada vez que vuelvas a este campo la grada empezará en tu contra, y eso ya no se quita.":
			"Rakibe gittin. Bu sahaya her dönüşünde tribün sana karşı başlayacak ve bu artık hiç geçmeyecek.",
		"BALÓN DE ORO": "YILIN OYUNCUSU",
		"Ningún equipo levanta esto por ti. Este se gana solo.":
			"Bunu senin için hiçbir takım kaldırmaz. Bu tek başına kazanılır.",
		"Tú quedaste {0}.": "{0} oldun.",
		"Tú quedaste {0}, detrás de {1}.": "{0} oldun; önünde {1} vardı.",
		"{0} GALA JUNTOS: ÉL {1}, TÚ {2}": "{0} GALA BIRLIKTE: O {1}, SEN {2}",
		"{0} GALA JUNTOS: {1} {2}, {3} {4}": "{0} GALA BIRLIKTE: {1} {2}, {3} {4}",
		"Este año no entraste en la votación.": "Bu yıl oylamaya giremedin.",
		"EL MEJOR DEL MUNDO · {0}": "DUNYANIN EN IYISI · {0}",
		"TU PRIMER JUGADOR DEL AÑO": "ILK YILIN OYUNCUSU ODULUN",
		"TU JUGADOR DEL AÑO Nº {0}": "{0}. YILIN OYUNCUSU ODULUN",
		"TEMPORADAS EN EL OFICIO · CIFRAS EN PRIMERA": "MESLEKTE SEZON · UST LIG RAKAMLARI",
		"LO DEJA CUANDO QUIERE": "KENDI KARARIYLA",
		"{0} años. El cuerpo mandó y no hubo discusión.":
			"{0} yaşında. Vücut karar verdi ve tartışma olmadı.",
		"Nadie te empujó a esto: te vas de pie, que es como se van los pocos.":
			"Kimse seni buna zorlamadı: ayakta gidiyorsun, azınlığın gittiği gibi.",
		"FIGURA DEL PARTIDO": "MAÇIN OYUNCUSU",
		"RENOVACIÓN": "SOZLESME",
		"SE DESPIDE": "VEDA",
		"SE DESPIDE UNA LEYENDA": "BIR EFSANE VEDA EDIYOR",
		"SE VA UNA LEYENDA": "EFSANE GIDIYOR",
		"VUELVE UNA LEYENDA": "EFSANE DONUYOR",
		"Te vas siendo leyenda de esta casa. Tu nombre se queda aquí.": "Bu kulübün efsanesi olarak gidiyorsun. Adın burada kalıyor.",
		"Fuiste leyenda aquí. Vienes de rival y aun así se ponen de pie.": "Burada efsaneydin. Rakip olarak geliyorsun ve yine de ayağa kalkıyorlar.",

		"HOMENAJE": "JUBILE",
		"Toda una etapa en el mismo club. El club te lo devuelve delante de los tuyos.":
			"Aynı kulüpte koca bir dönem. Kulüp bunu sana kendi taraftarının önünde ödüyor.",
		"HOMENAJE en {0}: {1} temporadas de lealtad. Prima de ${2} y la grada rendida.":
			"{0} kulübünde JUBILE: {1} sezonluk sadakat. ${2} prim ve tribün önünde eğiliyor.",
		"LA CAMISETA DEL CLUB ES LA TUYA: {0} unidades": "KULUBUN FORMASI SENIN: {0} adet",
		"Camisetas: {0} unidades, el nº{1} del vestuario": "Formalar: {0} adet, soyunma odasında {1}. sırada",
		"Dos minutos de micrófono y a la ducha. Mañana no se acuerda nadie.":
			"İki dakika mikrofon ve duşa. Yarın kimse hatırlamaz.",
		"Firmado. El club apuesta por ti y ahora hay que devolverlo en el campo.":
			"İmzalandı. Kulüp sana güveniyor; şimdi bunu sahada öde.",
		"Se acabó aquí. Lo que hiciste con esta camiseta ya no te lo quita nadie.":
			"Burada bitti. Bu formayla yaptıklarını artık kimse elinden alamaz.",
		"Te llamaron. Ahora hay que ir y quedarse.": "Seni çağırdılar. Şimdi git ve kal.",
		"ÚLTIMO DÍA EN EL CLUB": "KULUPTE SON GUN",
		"TITULAR CON TU SELECCIÓN": "MILLI TAKIMDA ILK 11",
		"EN LA LISTA DE TU SELECCIÓN": "MILLI TAKIM KADROSUNDA",

		"VAS AL MUNDIAL": "DUNYA ŞAMPIYONASI'NA GIDIYORSUN",
		"PIDE TU DORSAL": "NUMARANI ISTE",
		"ME QUEDO EL {0}": "{0} BENDE KALIR",
		"SIGUES CON EL {0}": "{0} SENDE KALIYOR",
		"CAMBIA TU DORSAL": "NUMARANI DEGIŞTIR",
		"EL {0} ES TUYO HASTA EL PROXIMO TORNEO": "{0} GELECEK TURNUVAYA KADAR SENIN",
		"PEDISTE EL {0}": "ISTEDIGIN: {0}",
		"Un continente entero, y tú dentro.": "Koca bir kıta ve sen içindesin.",
		"AÑOS AL IR AL MUNDIAL": "DUNYA ŞAMPIYONASI'NA GIDERKEN YAŞIN",
		"CONVOCATORIA OFICIAL": "RESMI KADRO",
		"QUEDAS CONVOCADO": "KADRODASIN",
		"Una carrera cabe en tres o cuatro. Éste es uno.": "Bir kariyere üç dört tane sığar. Bu onlardan biri.",
		"RENUEVA UNA TEMPORADA MÁS": "BIR SEZON DAHA UZATTI",
		"RENUEVA HASTA {0} TEMPORADAS MÁS": "{0} SEZONA KADAR UZATTI",



		"SE VA EN VERANO": "YAZIN GIDIYOR",
		"FIRMA CON {0} PARA EL VERANO": "YAZ IÇIN {0} ILE ANLAŞTI",
		"Ya está firmado y todavía quedan cinco meses de temporada. Lo que digas hoy es lo que te van a gritar hasta junio.":
			"İmza atıldı ve sezonun daha beş ayı var. Bugün ne dersen, hazirana kadar sana onu bağıracaklar.",
		"¿POR QUÉ TE VAS?": "NEDEN GIDIYORSUN?",
		"Treinta micrófonos y una sola pregunta. Lo que contestes decide quién carga con esto: el míster, la grada o la prensa.":
			"Otuz mikrofon ve tek bir soru. Cevabın bunun yükünü kimin taşıyacağına karar verir: hoca, tribün ya da basın.",
		"SE LO DIJE AL MÍSTER A LA CARA": "HOCAYA YUZUNE SOYLEDIM",
		"LE DEBO A ESTA GENTE HASTA JUNIO": "HAZIRANA KADAR ONLARA BORÇLUYUM",
		"ES FÚTBOL, NADA PERSONAL": "BU FUTBOL, KISISEL DEGIL",
		"YA NO HAY NADA QUE REPARTIR": "PAYLAŞACAK BIR ŞEY KALMADI",
		"EN VERANO": "YAZIN",
		"TU NUEVO SUELDO POR TEMPORADA": "SEZONLUK YENI MAAŞIN",
		"GOLES CON ESTA CAMISETA · {0} PARTIDOS": "BU FORMAYLA GOL · {0} MAÇ",
		"AÑOS AL ENTRAR EN LA LISTA": "ILK DAVETTEKI YAŞIN",
		"TU NOTA DEL PARTIDO (×10)": "MAÇ NOTUN (×10)",
		"JUGADOR DEL PARTIDO": "MAÇIN OYUNCUSU",
		"{0} GOLES · JUGADOR DEL PARTIDO": "{0} GOL · MAÇIN OYUNCUSU",
		"HASTA EL AÑO QUE VIENE": "GELECEK YIL GORUŞURUZ",
		"PASAR PÁGINA": "YENI SAYFA",
		"GOLES EN {0} PARTIDOS · {1} ASISTENCIAS": "{0} MAÇTA GOL · {1} ASIST",
		"Se quedaron a aplaudir igual. Eso también se gana.":
			"Yine de alkışlamak için kaldılar. Bu da kazanılır.",
		"Media grada de vuelta a casa. El año que viene se empieza de cero.":
			"Tribünün yarısı eve dönüyor. Gelecek yıl sıfırdan başlanır.",
		"Las gradas se vaciaron antes del pitido. Hay años así.":
			"Tribünler son düdükten önce boşaldı. Bazı yıllar böyledir.",
		"{0} DE {1} · SIN TÍTULOS": "{0} / {1} · KUPASIZ",
		"YA FIRMASTE CON OTRO": "BAŞKASIYLA IMZALADIN",
		"TE VAS Y ELLOS LO SABEN": "GIDIYORSUN, BILIYORLAR",
		"SE TE ACABA EL CONTRATO": "SOZLEŞMEN BITIYOR",
		"SE ACABA TU CESIÓN": "KIRALIGIN BITIYOR",

		"Te vas dejando una vitrina. Esta grada va a tardar en cantarle a otro.":
			"Arkanda bir vitrin bırakıyorsun. Bu tribünün bir başkası için şarkı söylemesi zaman alacak.",
		"No siempre se gana, pero aquí ganaste. Eso ya no te lo quita nadie.":
			"Her zaman kazanılmaz ama burada kazandın. Bunu artık kimse elinden alamaz.",
		"Ni un título, y aun así están todos de pie. Algo hiciste bien.":
			"Tek bir kupa yok, yine de hepsi ayakta. Bir şeyi doğru yaptın.",
		"JUGADOR DEL MES": "AYIN OYUNCUSU",
		"MEJOR DEL MES EN TU LIGA": "LIGINDE AYIN EN IYISI",
		"TU MEDIA DEL MES (×10)": "AYLIK ORTALAMAN (×10)",
		"EL MEJOR DEL MES DE TU LIGA": "LIGINDE AYIN EN IYISI",
		"SU MEDIA DEL MES (×10)": "AYLIK ORTALAMA (×10)",
		"GOLES EN EL PARTIDO": "BU MAÇTAKI GOLLER",
		"goles año": "gol (yıl)",
		"asist. año": "asist (yıl)",
		"SU MEDIA DE LA TEMPORADA (×10)": "SEZON ORTALAMASI (×10)",
		"El mejor del año de tu competición, y este año no fue para ti.": "Organizasyonunda yılın en iyisi ve bu yıl sen değildin.",
		"Este mes fue suyo. El siguiente empieza de cero para los dos.": "Bu ay onundu. Bir sonraki ikiniz için de sıfırdan başlıyor.",
		"Hoy el micro es suyo. La semana que viene se vuelve a repartir.": "Bugün mikrofon onda. Gelecek hafta yeniden dağıtılır.",
		"el listón": "çıta",
		"{0} partidos por encima de todos. El mes siguiente empieza de cero.":
			"Herkesin üstünde {0} maç. Bir sonraki ay sıfırdan başlıyor.",
		"MEJOR DEL AÑO": "YILIN YILDIZI",
		"TU MEDIA DE LA TEMPORADA (×10)": "SEZON ORTALAMAN (×10)",
		"goles": "gol",
		"asist.": "asist",
		"partidos": "maç",
		"El mejor del año en tu competición.": "Bu yıl organizasyonunun en iyisi.",
		"ADIÓS INTERNACIONAL": "MILLI VEDA",
		"SE RETIRA DE LA SELECCIÓN": "MILLI TAKIMI BIRAKIYOR",
		"APARICIONES CON TU PAÍS": "MILLI FORMAYLA MAÇ",
		"títulos": "kupa",
		"La camiseta del país no se cuelga: se entrega. Que la sude otro.":
			"Milli forma asılmaz: devredilir. Bırak başkası terlesin.",
		"NO SE PUDO GUARDAR": "KAYDEDILEMEDI",
		"CELEBRACIÓN DE TÍTULOS": "ŞAMPIYONLUK KUTLAMASI",
		"LA CIUDAD ES VUESTRA": "ŞEHIR SIZIN",
		"TÍTULOS SOBRE EL AUTOBÚS": "OTOBUSTE KUPALAR",
		"Hay años que se cuentan por títulos. Éste no cabe en una vitrina.":
			"Bazı sezonlar kupayla sayılır. Bu bir vitrine sığmaz.",
		"Dos en la misma temporada. La ciudad no se lo va a callar.":
			"Aynı sezonda iki tane. Şehir bunu dilinden düşürmeyecek.",
		"Un año entero cabe en esta calle, y toda esta gente vino a verlo.":
			"Koca bir sezon bu caddeye sığıyor ve bütün bu insanlar onu görmeye geldi.",

		"RECIBIMIENTO EN EL AYUNTAMIENTO": "BELEDIYEDE KARŞILAMA",
		"LA PLAZA ES VUESTRA": "MEYDAN SIZIN",

		"RECIBIMIENTO EN EL PALACIO": "SARAYDA KARŞILAMA",
		"EL PAÍS ES VUESTRO": "ULKE SIZIN",
		"Un país entero bajo un balcón, y una sola copa que enseñarle.":
			"Koca bir ülke bir balkonun altında ve gösterecek tek bir kupa.",
		"TÍTULOS EN EL BALCÓN": "BALKONDA KUPALAR",
		"Tres títulos y un balcón. El año que nadie esperaba de vosotros.":
			"Üç kupa ve bir balkon. Kimsenin sizden beklemediği sezon.",
		"Dos en la misma temporada. Abajo no cabe nadie más.":
			"Aynı sezonda iki tane. Aşağıda kimseye yer kalmadı.",
		"No hizo falta cortar la avenida: vino la ciudad entera aquí.":
			"Caddeyi kapatmaya gerek kalmadı: bütün şehir buraya geldi.",
		"LA PEÑA DEL CLUB": "TARAFTAR DERNEGI",
		"AQUÍ CABE TODO EL CLUB": "BUTUN KULUP BURAYA SIGAR",
		"TÍTULOS SOBRE LA BARRA": "TEZGAHTA KUPALAR",
		"Tres copas en una barra de seis metros. Ya no caben más.":
			"Altı metrelik bir tezgahta üç kupa. Bir tane daha sığmaz.",
		"Dos en la misma temporada, y el local se quedó pequeño.":
			"Aynı sezonda iki tane ve mekan dar geldi.",
		"No vino la ciudad entera. Vinieron los que siempre vienen.":
			"Bütün şehir gelmedi. Her zaman gelenler geldi.",
		"SUBIMOS": "ÇIKTIK",
		"SALTARON AL CÉSPED · Y NO CABÍA NADIE MÁS": "SAHAYA AKTILAR · IGNE ATSAN DUŞMEZ",
		"Subir cambia el club entero: otro presupuesto, otros rivales, otra vida.":
			"Üst lige çıkmak bütün kulübü değiştirir: yeni bütçe, yeni rakipler, yeni hayat.",
		"PUESTO FINAL · DE {0} EQUIPOS": "SON SIRA · {0} TAKIM ARASINDA",
		"El club entero baja contigo: menos presupuesto, otros rivales, y una temporada para volver.":
			"Bütün kulüp seninle küme düşüyor: daha az bütçe, başka rakipler ve geri dönmek için bir sezon.",
		"CAMPEON": "ŞAMPIYON",
		"PASILLO DE HONOR": "ONUR KORIDORU",
		"EN CASA DE {0}": "{0} SAHASINDA",
		"de ventaja": "farkla",

		"Con jornadas de sobra y ya no hay nada que discutir. Por eso te aplauden ellos.":
			"Daha haftalar varken tartışılacak bir şey kalmadı. Bu yüzden onlar bile alkışlıyor.",
		"Te lo reconocen los que lo perdieron. No hay elogio mejor.":
			"Bunu kaybedenler teslim ediyor. Bundan büyük övgü yok.",
		"LA LISTA": "LISTE",
		"ONCE INICIAL": "ILK 11",
		"TITULARES": "ASILLAR",
		"SUPLENTES": "YEDEKLER",
		"ESTÁS EN EL ONCE": "ILK 11'DESIN",
		"TE QUEDAS FUERA DEL ONCE": "ILK 11'DE YOKSUN",
		"NO ESTÁS EN LA LISTA": "KADRODA YOKSUN",
		"A ENTRENAR": "ANTRENMANA",
		"El míster te pone de salida. El sitio hay que sostenerlo.":
			"Hoca seni ilk 11'de başlatıyor. Şimdi o yeri korumak lazım.",
		"Empiezas en el banco. Se recupera jugando, no discutiendo.":
			"Yedek başlıyorsun. Yer tartışarak değil, oynayarak geri alınır.",
		"Esta semana ni te vistes. El lunes se vuelve a empezar.":
			"Bu hafta forma bile giymiyorsun. Pazartesi her şey yeniden başlar.",
		"EL ESTADIO LLEVA TU NOMBRE": "STADA SENIN ADIN VERILDI",
		"ASÍ SE LLAMA DESDE HOY": "BUGUNDEN ITIBAREN ADI",
		"TÍTULOS CON ESTE CLUB": "BU KULUPLE KUPALAR",
		"Los que vengan detrás van a jugar en un sitio que se llama como tú. Eso ya no te lo quita nadie.":
			"Senden sonra gelen herkes senin adını taşıyan bir yerde oynayacak. Bunu artık kimse elinden alamaz.",
		"CAMPEONES": "ŞAMPIYON",
		"TUS GOLES EN ESTE TORNEO · {0} PARTIDOS": "BU TURNUVADAKI GOLLERIN · {0} MAÇ",
		"CAMPEÓN DE {0}": "{0} ŞAMPIYONU",
		"CAMPEÓN · {0}": "ŞAMPIYON · {0}",
		"BIENVENIDO": "HOŞ GELDIN",
		"DE VUELTA": "EVE DONUŞ",
		"Aquí ya sabes dónde está todo. Falta que te vuelvan a ver.": "Burada her şeyin yerini biliyorsun. Şimdi seni yeniden görmeleri lazım.",
		"LLEGAS CEDIDO": "KIRALIK",
		"FICHAJE LIBRE": "BEDELSIZ",
		"NUEVO FICHAJE": "YENI TRANSFER",
		"EN LAS GRADAS · AFORO {0}": "TRIBUN · KAPASITE {0}",
		"En equipo": "Takım",
		"Individuales": "Bireysel",
		"TRASPASO ${0}": "BEDEL ${0}",
		"AL VESTUARIO": "SOYUNMA ODASI",
		"ESTA SEMANA": "BU HAFTA",
		"PRETEMPORADA": "SEZON ONCESI",
		"TU FICHAJE": "TRANSFERIN",
		"TU RENOVACIÓN": "SOZLEŞMEN",
		"FINAL DE TEMPORADA": "SEZON SONU",
		"CAMPEÓN": "ŞAMPIYON",
		"LA GALA": "GALA",
		"Campeón del mundo. No hay nada por encima de esto.":
			"Dünya şampiyonu. Bunun üstünde hiçbir şey yok.",
		"La noche que Europa se quedó mirándote a ti.": "Bütün Avrupa'nın seni izlediği gece.",
		"El mejor club del mundo, y tú dentro.": "Dünyanın en iyi kulübü ve sen içindesin.",
		"Tu continente lleva tu nombre este verano.": "Kıtan bu yaz senin adını taşıyor.",
		"Europa por la puerta de atrás. Se entra igual.":
			"Avrupa'ya arka kapıdan. Yine de içerdesin.",
		"La tercera copa de Europa también pesa al levantarla.":
			"Avrupa'nın üçüncü kupası da kaldırırken ağır geliyor.",
		"Nueve meses para esta tarde. Campeones.": "Bu akşam için dokuz ay. Şampiyonlar.",
		"Una final, un título. Así de simple y así de difícil.":
			"Bir final, bir kupa. Bu kadar basit, bu kadar zor.",
		"MEJOR DE LA CHAMPIONS": "ELIT KUPASI EN IYISI",
		"El mejor de Europa en la competición que todos miran.":
			"Herkesin izlediği organizasyonda Avrupa'nın en iyisi.",
		"MEJOR DE LA EUROPA LEAGUE": "AVRUPA KUPASI EN IYISI",
		"El mejor de tu Europa. La otra también se gana jugando.":
			"Senin Avrupa'nın en iyisi. Öbürü de oynayarak kazanılır.",
		"MEJOR DE LA CONFERENCE": "CHALLENGE EN IYISI",
		"El mejor de la tercera Europa. Se juega con la misma pelota.":
			"Üçüncü Avrupa'nın en iyisi. Aynı topla oynanıyor.",
		"MEJOR JUGADOR DE LA LIGA": "LIGIN EN IYI OYUNCUSU",
		"Nueve meses de competición y el mejor fuiste tú.":
			"Dokuz aylık mücadele ve en iyisi sendin.",
		"MEJOR DEL MUNDIALITO": "KULUP DUNYA EN IYISI",
		"Dos partidos contra los campeones del mundo. Mandaste tú.":
			"Dünya şampiyonlarına karşı iki maç. Sözü sen söyledin.",
		"MEJOR DE LA COPA": "KUPANIN EN IYISI",
		"El torneo donde un mal día te elimina. No lo tuviste.":
			"Tek bir kötü günün seni elediği turnuva. Sen o günü yaşamadın.",
		"LLENO HISTÓRICO": "REKOR SEYIRCI",
		"ESTADIO LLENO": "TIKLIM TIKLIM",
		"MEDIA ENTRADA": "YARI DOLU",
		"PRESENTACIÓN DISCRETA": "SESSIZ TANITIM",
		"¿Última parada o retiro dorado? La grada vino a averiguarlo.":
			"Son durak mı, altın emeklilik mi? Tribün öğrenmeye geldi.",
		"Nadie entiende qué haces aquí. Vinieron por morbo; convéncelos.":
			"Burada ne aradığını kimse anlamıyor. Merakından geldiler; onları ikna et.",
		"Vienen a ver si eres el refuerzo que les faltaba.":
			"Eksik parça sen misin diye görmeye geldiler.",
		"Media grada se acercó a conocer al cedido.": "Tribünün yarısı kiralık oyuncuyu tanımaya geldi.",
		"Una cesión más. Aquí se demuestra jugando.": "Bir kiralık daha. Burada oynayarak kanıtlanır.",
		"Sin pagar un peso y el estadio no cabe. Eso es un fichajazo.":
			"Bir kuruş ödenmedi ve stadyum dolup taşıyor. İşte bu bir bomba transfer.",
		"Se agotaron las entradas para ver un fichaje gratis.": "Bedelsiz bir transferi görmek için biletler tükendi.",
		"Llegas libre y media grada quiso verte la cara.":
			"Bedelsiz geliyorsun ve tribünün yarısı yüzünü görmek istedi.",
		"Sin traspaso y sin ruido. El ruido lo haces tú.":
			"Ne bonservis ne gürültü. Gürültüyü sen yapacaksın.",
		"El club paró la ciudad para presentarte. No se olvida un día así.":
			"Kulüp seni tanıtmak için şehri durdurdu. Böyle bir gün unutulmaz.",
		"Lleno para ver a su fichaje. Ahora hay que responder.":
			"Transferlerini görmek için tıklım tıklım. Şimdi karşılık verme sırası sende.",
		"Media entrada. Te conocen; falta que te quieran.":
			"Yarı dolu tribün. Seni tanıyorlar; şimdi sevmelerini sağla.",
		"El mejor jugador del mundo es suyo. No cabe un alma para verlo.":
			"Dünyanın en iyi oyuncusu artık onların. Onu görmek için iğne atsan yere düşmez.",
		"Cuatro curiosos y una cámara. Aquí se empieza desde abajo.":
			"Birkaç meraklı ve bir kamera. Burada sıfırdan başlanır.",
		"Yo también creí que nadie me alcanzaría. Sigue así.":
			"Ben de kimsenin bana yetişemeyeceğini sanmıştım. Böyle devam et.",
		"Los títulos pesan más cuando los cuentan otros. Ya son más los tuyos.":
			"Kupalar başkaları saydığında daha ağır gelir. Artık seninkiler daha fazla.",
		"Me costó una vida llegar ahí arriba. A ti te va a costar quedarte.":
			"Oraya çıkmak bana bir ömre mal oldu. Orada kalmak da sana o kadar pahalıya patlayacak.",
		"No te acostumbres a mirar hacia abajo. Sigue ganando.":
			"Aşağıya bakmaya alışma. Kazanmaya devam et.",
		"Bienvenido. Aquí arriba se está solo, pero se ve todo.":
			"Hoş geldin. Burası yalnız ama her şey görünüyor.",
		"Cada gol mío lo llevo contado. Ahora los tuyos son más. Sigue.":
			"Her golümü tek tek saydım. Artık seninkiler daha fazla. Devam et.",
		"Yo marqué hasta el último día. Tú vas más rápido que yo.":
			"Ben son günüme kadar gol attım. Sen benden hızlı gidiyorsun.",
		"Los números se rompen para eso. Que alguien rompa los tuyos.":
			"Rekorlar kırılmak içindir. Umarım biri de seninkini kırar.",
		"No pares ahora: al que deja de marcar lo alcanzan en un año.":
			"Şimdi durma: gol atmayı bırakana bir yılda yetişirler.",
		"Me tocó verlo desde aquí. Sigue así y no te alcanza nadie.":
			"Bunu buradan izlemek zorunda kaldım. Böyle devam edersen kimse sana yetişemez.",
		"MÁS TÍTULOS DE LA HISTORIA": "TARIHIN EN ÇOK KUPASI",
		"MÁS TÍTULOS": "EN ÇOK KUPA",
		"trofeos": "kupa",



		"MEJOR JUGADOR DE LA HISTORIA": "TARIHIN EN IYI OYUNCUSU",
		"YA NO QUEDA NADIE POR DELANTE": "ONUNDE KIMSE KALMADI",
		"DE LA HISTORIA": "TARIHIN",
		"Todavía no he colgado las botas. Nos vemos en el campo.":
			"Kramponlarımı daha asmadım. Sahada görüşürüz.",
		"Disfrútalo, que esta temporada pienso quitártelo.":
			"Tadını çıkar, çünkü bu sezon onu senden geri almayı düşünüyorum.",
		"Pasarme con los dos en activo tiene mérito. Ahora aguántalo.":
			"İkimiz de oynarken beni geçmek az iş değil. Şimdi orada tutun.",
		"Sigo jugando, y ya sé a quién me toca perseguir.":
			"Hâlâ oynuyorum ve artık kimin peşine düşeceğimi biliyorum.",
		"Si me tenía que pasar alguien, mejor uno de casa. Sigamos ganando juntos.":
			"Biri beni geçecekse, bizden biri olsun. Birlikte kazanmaya devam edelim.",
		"Hoy te lo celebro yo. Mañana, a entrenar como siempre.":
			"Bugün seninle ben kutluyorum. Yarın her zamanki gibi antrenmana.",
		"Que se entere el vestuario: aquí jugamos dos de los grandes.":
			"Soyunma odası duysun: burada büyüklerden ikisi oynuyor.",
		"Ya no hay nadie delante de ti. Yo sigo jugando, así que no te relajes.":
			"Önünde artık kimse yok. Ben hâlâ oynuyorum, o yüzden rahatlama.",
		"Ya no hay nadie delante de ti. Ahora el nombre a batir es el tuyo.":
			"Önünde artık kimse yok. Artık geçilmesi gereken isim senin adın.",

		"{0}G {1}A": "{0}G {1}A",
		"media": "ort.",
		"clubes": "kulüp",
		"A {0}": "Gittiği yer: {0}",
		"temporadas": "sezon",
		"Ni un balón. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "Tek bir top yok. Burada senden hiçbir şey kalmadı, sen de bir şey götürmüyorsun.",
		"La maleta va vacía. Lo que dejaste aquí no cabe en ella: se queda en la grada.": "Bavul boş gidiyor. Burada bıraktıkların ona sığmaz: tribünde kalır.",
		"dorsal": "numara",
		"{0} {1} · JUGADOR DEL PARTIDO": "{0} {1} · MAÇIN OYUNCUSU",
		"tiros": "şut",
		"pases": "pas",
		"RECORD": "REKOR",
		"¡A {0}!": "Hedef: {0}!",
		"puntos": "puan",
		"jornadas": "kalan hafta",
		"ligas": "lig",
		"copas": "kupa",
		"europas": "Avrupa kupası",
		"ascensos": "üst lige çıkış",
		"Este club no había ganado nada parecido en toda su historia. Lo trajiste tú, y aquí no se va a olvidar.":
			"Bu kulüp tarihi boyunca buna benzer hiçbir şey kazanmamıştı. Onu sen getirdin ve burada bu unutulmayacak.",
		"MENU PRINCIPAL": "ANA MENU",
		"UN JUEGO DE": "YAPIM",
		"Clubes, ligas, competiciones, estadios y jugadores son ficticios. Football Legacy no está afiliado, patrocinado ni respaldado por ninguna liga, club, federación o competición real.": "Kulüpler, ligler, organizasyonlar, stadyumlar ve oyuncular kurgusaldır. Football Legacy hiçbir gerçek lig, kulüp, federasyon veya organizasyonla bağlantılı değildir; onlar tarafından desteklenmez veya onaylanmaz.",
		"CODIGO · DISENO · ARTE · SONIDO": "KOD · TASARIM · SANAT · SES",
		"TU PRESENTACION": "TANITIMIN",
		"SELECCION T{0}": "MILLI S{0}",
		"TU MEJOR GOL": "EN IYI GOLUN",
		"GOLES DE CARRERA": "KARIYER GOLLERI",
		"Completa una temporada en {0} división o ficha por un club de {1} para desbloquear.":
			"Açmak için {0} ligde bir sezon tamamla ya da {1} lig kulübüne imza at.",






















		"COMO SALE": "NASIL ÇIKAR",
		"CELEBRACION NUEVA": "YENI GOL SEVINCI",
		"CELEBRACIONES": "SEVINÇLER",
		"SITIOS": "YERLER",
		"GESTOS": "POZLAR",


		"Celebración por descubrir. Sigue marcando goles.":
			"Keşfedilecek gol sevinci. Gol atmaya devam et.",


		"ESCENAS": "SAHNE",
		"GLORIA": "ZAFER",
		"DUELO": "HUZUN",
		"MOMENTOS": "ANLAR",
		"REVIVIR": "TEKRAR",
		"Toca para revivir cómo fue.": "Nasıl olduğunu yeniden yaşamak için dokun.",
		"Puedes verla otra vez con el botón.": "Düğmeyle yeniden izleyebilirsin.",
		"Escena por vivir. Sigue jugando tu carrera.": "Yaşanacak sahne. Kariyerini oynamaya devam et.",
		"EL ASCENSO": "LIGE ÇIKIŞ",
		"LA VUELTA CON LA COPA": "KUPAYLA TUR",
		"LA GALA DEL JUGADOR DEL AÑO": "YILIN OYUNCUSU GALASI",
		"LA GALA DEL CLUB": "KULUP GALASI",
		"LA GALA DE LA LIGA": "LIG GALASI",
		"EL RECORD": "REKOR",
		"LA LEYENDA TE SALUDA": "EFSANENIN SELAMI",
		"TU SITIO EN LA HISTORIA": "TARIHTEKI YERIN",
		"EL ESTADIO CON TU NOMBRE": "ADINI TAŞIYAN STADYUM",
		"EL HOMENAJE": "JUBILE",
		"EL DESFILE": "ZAFER TURU",
		"EL BALCON DEL AYUNTAMIENTO": "BELEDIYE BALKONU",
		"LA PEÑA DEL BARRIO": "MAHALLE DERNEGI",
		"LAS PANTALLAS DE NUEVA YORK": "NEW YORK EKRANLARI",
		"LA COPA VUELVE EN AVION": "KUPA UÇAKLA DONUYOR",
		"LA OVACION AJENA": "RAKIP ALKIŞI",
		"TU CANTO EN LA GRADA": "TRIBUNDE SENIN ŞARKIN",
		"EL PASILLO DEL RIVAL": "RAKIBIN ONUR KORIDORU",
		"LA PRIMERA CONVOCATORIA": "ILK MILLI DAVET",
		"LA LISTA DEL MUNDIAL": "DUNYA ŞAMPIYONASI KADROSU",
		"TU VIEJO DORSAL": "ESKI NUMARAN",
		"EL BAR DEL BARRIO": "MAHALLE KAHVESI",
		"EL DESCENSO": "KUME DUŞME",
		"SUBCAMPEON": "IKINCILIK",
		"LA FINAL PERDIDA": "KAYBEDILEN FINAL",
		"LA ULTIMA TARDE": "SON AKŞAM",
		"LA LESION": "SAKATLIK",
		"LA PRIMERA BANCA": "ILK YEDEKLIK",
		"LA PITADA": "ISLIKLAR",
		"EL TECNICO SE VA": "HOCA GIDIYOR",
		"LA TAQUILLA VACIA": "BOŞ DOLAP",
		"SE FUE AL RIVAL": "RAKIBE GITTI",
		"LA VUELTA AL CAMPO ENEMIGO": "DUŞMAN SAHAYA DONUŞ",
		"EL RECIBIMIENTO AL VERDUGO": "CELLADI KARŞILAMA",
		"LA DESPEDIDA DEL VESTUARIO": "SOYUNMA ODASINDA VEDA",
		"EL ULTIMO PARTIDO EN CASA": "EVDEKI SON MAÇ",
		"EL ADIOS A LA SELECCION": "MILLI TAKIMA VEDA",
		"EL PASILLO DE HONOR": "ONUR KORIDORU",
		"LA PRESENTACION": "TANITIM",
		"LA BIENVENIDA": "KARŞILAMA",
		"LA FIRMA": "IMZA",
		"LA RUEDA DE PRENSA": "BASIN TOPLANTISI",
		"LA PREGUNTA DEL PRECONTRATO": "ON SOZLEŞME SORUSU",
		"EL OJEADOR EN LA TRIBUNA": "TRIBUNDEKI GOZLEMCI",
		"LLEGA EL REFUERZO": "TAKVIYE GELIYOR",
		"LOS FICHAJES DEL VERANO": "YAZ TRANSFERLERI",
		"LA NOCHE DEL CIERRE": "SON GUN GECESI",
		"TU FICHAJE EN LA PORTADA": "TRANSFERIN MANŞETTE",
		"LA CHARLA CON EL COMPAÑERO": "TAKIM ARKADAŞIYLA SOHBET",
		"LA LISTA DE LA SELECCION": "MILLI TAKIM KADROSU",
		"EL VESTUARIO DE COPA": "KUPA SOYUNMA ODASI",
		"EL VESTUARIO DEL DERBI": "DERBI SOYUNMA ODASI",
		"LA PORTADA DEL DERBI": "DERBI MANŞETI",
		"EL MARCADOR DEL DERBI": "DERBI SKOR TABELASI",
		"EL ESPEJO DEL DERBI": "DERBI AYNASI",
		"EL HUECO DEL DERBI": "DERBI BOŞLUGU",
		"EL PORTERO TE CONOCE": "KALECI SENI TANIYOR",
		"LA TANDA DE PENALES": "PENALTI ATIŞLARI",
		"EL RECUERDO": "HATIRA",
		"LA PASARELA DE EQUIPACIONES": "FORMA DEFILESI",

		"LOS AUTOGRAFOS EN LA PUERTA": "KAPIDA IMZA",
		"FIRMA LA CAMISETA": "FORMAYI IMZALA",
		"TRES CAMISETAS PARA LA GRADA": "TRIBUNE UÇ FORMA",
		"CAMISETAS FIRMADAS": "IMZALI FORMALAR",
		"Ganaste, y tres se van a casa con tu firma.": "Kazandın ve üç kişi evine senin imzanla dönüyor.",
		"No hubo victoria, pero tres se van a casa con tu firma.": "Galibiyet yoktu ama üç kişi evine senin imzanla dönüyor.",
		"LAS FIRMAS EN LA GRADA": "TRIBUNDE IMZA",
		"LA FIRMA DE FOTOS": "FOTOGRAF IMZASI",
		"FIRMA LA FOTO": "FOTOYU IMZALA",
		"FOTOS FIRMADAS": "IMZALI FOTOLAR",
		"EVENTO CON LA AFICION": "TARAFTAR ETKINLIGI",
		"FIRMA DE FOTOS": "FOTO IMZASI",
		"Tu primer evento con la afición: cinco fotos con tu firma.": "Taraftarlarla ilk etkinliğin: senin imzanla beş fotoğraf.",
		"Y la cola seguía: {0} más esperando su foto.": "Ve kuyruk devam ediyordu: fotoğrafını bekleyen {0} kişi daha.",
		"Cinco fotos con tu firma, cinco que se van contentos.": "Senin imzanla beş fotoğraf, mutlu giden beş taraftar.",
		"Firma con el dedo": "Parmağınla imzala",
		"BORRAR FIRMA": "IMZAYI SIL",
		"AFICIÓN +{0}": "TARAFTAR +{0}",
		"AFICIONADOS ESPERANDO": "BEKLEYEN TARAFTARLAR",
		"TU PRIMER AUTÓGRAFO": "ILK IMZAN",
		"TE ESPERABAN EN LA PUERTA": "KAPIDA SENI BEKLIYORLARDI",
		"Pocos, pero vinieron por ti. Así empieza todo.": "Az kişi ama senin için geldiler. Her şey böyle başlar.",
		"Ya te reconocen desde lejos. Y tu coche también.": "Artık seni uzaktan tanıyorlar. Arabanı da.",
		"Llegar a entrenar ya es un acontecimiento.": "Antrenmana gelmen bile artık bir olay.",
		"Primer Autógrafo": "İlk İmza",
		"Firmar una camiseta a la gente que te espera en la puerta de la ciudad deportiva.": "Antrenman tesisinin kapısında seni bekleyenlere bir forma imzala.",

		"La Más Vendida": "En Çok Satan",
		"Que tu camiseta sea la más vendida del vestuario en una temporada.": "Bir sezonda soyunma odasının en çok satan forması seninki olsun.",
		"All-in": "All-In",
		"Ganar el torneo de póquer de tu casa.": "Evindeki poker turnuvasını kazan.",
		"La Ley del Ex": "Eski Takım Kuralı",
		"Marcarle un gol a un club del que te fuiste.": "Ayrıldığın bir kulübe gol at.",
		"Una Vida Entera": "Koca Bir Ömür",
		"Vivir 50 escenas distintas del álbum en una misma carrera.": "Tek bir kariyerde albümün 50 farklı sahnesini yaşa.",
		"Conquistador de Europa": "Avrupa'nın Fatihi",
		"Conquistador de Sudamérica": "Güney Amerika'nın Fatihi",
		"Conquistador de Norteamérica": "Kuzey Amerika'nın Fatihi",
		"Conquistador de África": "Afrika'nın Fatihi",
		"Conquistador de Asia": "Asya'nın Fatihi",
		"Conquistador de Oceanía": "Okyanusya'nın Fatihi",
		"Libro Completo": "Eksiksiz Defter",
		"Vencer a todos los clubes y selecciones de Europa.": "Avrupa'daki bütün kulüpleri ve milli takımları yen.",
		"Vencer a todos los clubes y selecciones de Sudamérica.": "Güney Amerika'daki bütün kulüpleri ve milli takımları yen.",
		"Vencer a todos los clubes y selecciones de Norteamérica, Centroamérica y el Caribe.": "Kuzey Amerika, Orta Amerika ve Karayipler'deki bütün kulüpleri ve milli takımları yen.",
		"Vencer a todos los clubes y selecciones de África.": "Afrika'daki bütün kulüpleri ve milli takımları yen.",
		"Vencer a todos los clubes y selecciones de Asia.": "Asya'daki bütün kulüpleri ve milli takımları yen.",
		"Vencer a todos los clubes y selecciones de Oceanía.": "Okyanusya'daki bütün kulüpleri ve milli takımları yen.",
		"Vencer a todos los rivales del juego: cada club y cada selección del mundo.": "Oyundaki bütün rakipleri yen: dünyadaki her kulübü ve her milli takımı.",
		"Álbum Completo": "Eksiksiz Albüm",
		"Descubrir todos los arquetipos de pareja.": "Bütün sevgili tiplerini keşfet.",
		"Rodeado": "Etrafı Sarıldı",
		"Firmar autógrafos con 40 aficionados o más esperándote en la puerta.": "Kapıda seni bekleyen 40 veya daha fazla taraftara imza dağıt.",
		"Turista de Estadios": "Stadyum Turisti",
		"Jugar en 25 estadios distintos.": "25 farklı stadyumda oyna.",
		"El Brazalete": "Kaptanlık Bandı",
		"Ser el capitán de tu club.": "Kulübünün kaptanı ol.",
		"Desde los Once Metros": "Penaltı Noktasından",
		"Marcar el penal que gana una tanda.": "Seri penaltıları kazandıran penaltıyı at.",
		"Carta de Presentación": "Kartvizit",
		"Marcar en tu debut con un club nuevo.": "Yeni bir kulüpteki ilk maçında gol at.",
		"De Hierro": "Demir Adam",
		"Jugar 20 partidos o más en una temporada sin perderte ninguno por lesión.": "Bir sezonda sakatlık yüzünden hiçbirini kaçırmadan 20 veya daha fazla maç oyna.",
		"Niño Prodigio": "Harika Çocuk",
		"Debutar en Primera División antes de cumplir 18 años.": "18 yaşına girmeden Birinci Lig'de ilk maçına çık.",
		"Roble Viejo": "Yaşlı Çınar",
		"Marcar un gol con 38 años o más.": "38 yaşında veya daha büyükken gol at.",
		"EL ALTA MEDICA": "SAHALARA DONUŞ",
		"LA MUDANZA": "TAŞINMA",
		"LAS OFERTAS DEL REGRESO": "DONUŞ TEKLIFLERI",
		"¡ALARMA!": "ALARM!",
		"MUSEO DE {0}": "{0} MUZESI",
		"¿ME FIRMA LA GORRA?": "ŞAPKAMA IMZA?",
		"EL MUSEO DE TU EGO": "EGONUN MUZESI",
		"CLASE DE BAILE": "DANS DERSI",
		"PROFESOR: {0}": "OGRETMEN: {0}",
		"LA CLASE DE LAS ABUELAS": "NINELERIN DERSI",
		"ESTRENO MUNDIAL": "DUNYA GALASI",
		"LA PELÍCULA DE {0}": "{0} FILMI",
		"LA PELÍCULA DE TU VIDA": "HAYATININ FILMI",
		"DURACIÓN: 4 H 38 MIN": "SURE: 4 S 38 DK",
		"EL ESTRENO": "GALA",
		"TODAS LAS ESCENAS": "TUM SAHNELER",
		"Tu vida, en cines. Dura cuatro horas y media y nadie se ha ido.": "Hayatın sinemalarda. Dört buçuk saat sürüyor ve kimse salondan çıkmadı.",
		"¡NO ME CUENTES EL FINAL!": "SONUNU SOYLEME!",
		"MARTES, 19:00": "SALI, 19:00",
		"MÍSTERS ANÓNIMOS": "ANONIM HOCALAR",
		"PASO 1: ACEPTAR QUE LO SENTASTE": "ADIM 1: KESTIGINI KABUL ET",
		"TERAPIA DE MÍSTERS": "HOCA TERAPISI",
		"TERAPIA DE MISTERS": "HOCA TERAPISI",
		"TODOS LOS TÉCNICOS": "TUM HOCALAR",
		"Los has tenido a todos. Ahora se reúnen los martes para superarlo.": "Hepsiyle çalıştın. Şimdi atlatmak için salı günleri toplanıyorlar.",
		"¡ES ÉL! ¡EL QUE PEDÍA SER TITULAR!": "BU O! ILK 11 ISTEYEN!",
		"RESERVA PARA SIETE": "YEDI KISILIK MASA",
		"LA CENA DE LAS EX": "ESKILER YEMEGI",
		"TODAS LAS PAREJAS": "TUM SEVGILILER",
		"Las has conocido a todas. Todas. En la misma mesa.": "Hepsiyle tanıştın. Hepsiyle. Aynı masada.",
		"PAGA ÉL, ¿NO?": "O ODER, DEGIL MI?",
		"DOMINGO, 13:00": "PAZAR, 13:00",
		"LOS DERROTADOS": "YENILENLER",
		"BARBACOA DE LOS DERROTADOS": "YENILENLERIN MANGALI",
		"TODOS LOS RIVALES": "TUM RAKIPLER",
		"Les ganaste a todos. Te invitaron igual. La salchicha, quemada.": "Hepsini yendin. Yine de seni davet ettiler. Sucuk yanmış.",
		"BARBACOA ANUAL": "YILLIK MANGAL",
		"PERDIMOS CONTRA {0}": "{0} BIZI YENDI",
		"TE GUARDAMOS LA SALCHICHA QUEMADA": "SANA YANIK SUCUK AYIRDIK",
		"03:12 · MUSEO CERRADO": "03:12 · MUZE KAPALI",
		"EL CONSERJE DEL SALÓN": "HALL OF FAME HADEMESI",
		"TU PRIMERA PLACA": "ILK PLAKETIN",
		"Ya estás en el Salón de la Fama. El conserje tiene la foto que lo demuestra.": "Artık Hall of Fame'desin. Hademenin bunu kanıtlayan fotoğrafı var.",
		"PARA MI CUÑADO, QUE NO SE LO CREE": "INANMAYAN ENISTEME",
		"INAUGURACIÓN": "AÇILIŞ",
		"TU ESTATUA": "HEYKELIN",
		"LA ESTATUA": "HEYKEL",
		"TODA LA COLECCIÓN": "TUM KOLEKSIYON",
		"Lo has completado todo. Te han hecho una estatua. El pelo es del utillero.": "Her şeyi tamamladın. Heykelini diktiler. Saçlar malzemecinin.",
		"LEYENDA ETERNA": "EBEDI EFSANE",
		"¿ESE PELO ES DEL UTILLERO?": "O SAÇ MALZEMECININ MI?",
		"TODOS LOS FESTEJOS": "TUM SEVINÇLER",
		"Te sabes todos los festejos. Ahora ellas también.": "Bütün gol sevinçlerini biliyorsun. Artık onlar da biliyor.",
		"¡AHORA LA DE QUITARSE LA CAMISETA!": "ŞIMDI FORMAYI ÇIKAR!",
		"TODOS LOS LOGROS": "TUM BASARIMLAR",
		"Lo tienes todo. Hasta el guardia de noche es fan tuyo.": "Her şeyin var. Gece bekçisi bile hayranın.",
		"LA FIRMA DEL REGRESO": "DONUŞ IMZASI",


		"EL BANDERIN": "BAYRAK",
		"El clásico: todo el equipo corre al banderín del lado por donde entró el balón.":
			"Klasik: bütün takım topun geldiği taraftaki korner bayrağına koşar.",
		"CON LA GENTE": "TARAFTARA",
		"Al fondo, detrás de la línea de gol. En casa, además, te abrazas con un aficionado.":
			"Dibe, kale çizgisinin arkasına. Evinde ayrıca bir taraftarla sarılırsın.",
		"LA PIÑA": "YIGIN",
		"Nadie se va a ningún lado: la montonera se arma justo donde marcaste.":
			"Kimse bir yere koşmuyor: yığın tam gol attığın yerde kuruluyor.",
		"CON LOS SUPLENTES": "YEDEKLERLE",
		"A la banda, con los suplentes. El gol del que acaba de entrar se festeja con los que siguen en el banco.":
			"Kenara, yedeklerle. Oyuna yeni girdiysen golü kulübede kalanlarla kutlarsın.",
		"AL CENTRO": "ORTAYA",
		"Balón bajo el brazo y a sacar de nuevo. Todavía no hay nada que festejar.":
			"Top koltuğunun altında, hemen santraya. Daha kutlanacak bir şey yok.",
		"TU RINCON": "SENIN KOŞEN",
		"Sólo de visita: a la esquina donde está tu puñado de aficionados.":
			"Sadece deplasmanda: bir avuç taraftarının olduğu köşeye.",
		"SALTAR LA VALLA": "BARIYERI AŞ",
		"Sólo en casa: saltas la publicidad y te vas hasta el pie de la grada. Esa esquina se vuelve loca.":
			"Sadece evinde: reklam panolarını aşıp tribünün dibine kadar gidersin. O köşe çıldırır.",
		"AL TECNICO": "HOCAYA",
		"Vienes de bronca con el entrenador y te vas a la raya a abrazarlo. Una sola vez por partido.":
			"Hocayla aran bozuktu; kenar çizgisine koşup ona sarılırsın. Maçta bir kez, fazlası yok.",
		"EN SU CASA": "EVLERINDE",
		"Gol en un derbi, de visita: lo festejas frente a su fondo. Te abuchea el estadio entero y te llueven botellas.":
			"Deplasmanda derbi golü, onların tribününün önünde kutlanır. Bütün stat seni yuhalar, şişeler yağar.",
		"PARA LA TELE": "KAMERAYA",
		"Te plantas delante de la cámara de televisión y el gol se ve por su visor. Sólo donde hay transmisión: en tercera no hay cámaras.":
			"Televizyon kamerasının önüne dikilirsin ve gol onun vizöründen görünür. Sadece yayın olan yerde: üçüncü ligde kamera yok.",
		"ES NUESTRO": "BU BIZIM",
		"Última jornada, y el gol te pone por delante. Salta hasta el banquillo al campo.":
			"Son hafta ve golün seni öne geçiriyor. Yedek kulübesi bile sahaya fırlıyor.",


		"DE RODILLAS": "DIZ USTU",
		"Llegas barriéndote de rodillas. Una de cada tres veces, en los festejos con carrera de verdad.":
			"Dizlerinin üstünde kayarak gelirsin. Gerçek koşulu sevinçlerde, üç seferden birinde.",
		"PUÑO AL AIRE": "YUMRUK",
		"El salto con el puño cerrado, en el gol agónico que lo cambia todo.":
			"Her şeyi değiştiren son dakika golünde, yumruk sıkılı zıplayış.",
		"BALON A LA GRADA": "TOP TRIBUNE",
		"La otra cara del gol agónico: reventar el balón hacia arriba y que caiga donde caiga.":
			"Son dakika golünün öbür yüzü: topu havaya patlat, nereye düşerse düşsün.",
		"BANDERIN PARTIDO": "KIRIK BAYRAK",
		"Llegas al córner y le metes una patada al mástil. Se parte. Uno de cada seis córners.":
			"Kornere varıp direğe bir tekme atarsın. Kırılır. Altı kornerden birinde.",
		"MASTIL AGARRADO": "DIREGI TUT",
		"Llegas al córner, agarras el mástil con el puño y te plantas con la mano en la cadera.": "Kornere varırsın, direği yumruğunla kavrarsın ve elin belinde dikilirsin.",
		"SIN CAMISETA": "FORMASIZ",
		"Te quitas la camiseta y les enseñas el dorsal. Siempre trae factura: abucheo y botellas.":
			"Formanı çıkarıp sırtındaki numarayı gösterirsin. Her zaman bedeli var: yuh ve şişeler.",
		"EL SILENCIO": "SESSIZLIK",
		"Plantarte quieto frente a su fondo mientras el estadio te abuchea. No hacer nada es el gesto.":
			"Stat seni yuhalarken onların tribününün önünde kıpırdamadan dikilirsin. Hiçbir şey yapmamak, hareketin ta kendisi.",
		"BRAZOS ABIERTOS": "KOLLAR AÇIK",
		"Con el brazalete de tu país: brazos abiertos, pidiéndole más a tu gente.":
			"Ülkenin kaptanlık bandıyla: kollar açık, taraftarından daha fazlasını istersin.",
		"GRACIAS, SOCIO": "SAG OL, DOSTUM",
		"El gol lo empezó otro: vino de un centro o de un córner, y lo primero que haces es señalar a quien lo puso.":
			"Golü başkası başlattı: bir ortadan ya da kornerden geldi ve ilk işin topu vereni parmakla göstermek.",
		"LA REVERENCIA": "REVERANS",
		"Un golazo: desde fuera del área o de falta directa. Te giras hacia la grada y te inclinas. La mitad de las veces.":
			"Müthiş bir gol: ceza sahası dışından ya da direkt serbest vuruştan. Tribüne dönüp eğilirsin. İki seferden birinde.",
		"BESO AL ESCUDO": "ARMAYI OP",
		"Tres temporadas o más en el mismo club. Ya no eres un fichaje, eres de la casa: besas el escudo y la grada lo sabe.":
			"Aynı kulüpte üç sezon ya da daha fazla. Artık transfer değil, evin çocuğusun: armayı öpersin ve tribün bunu bilir.",
		"TRES DEDOS": "3 PARMAK",
		"Tu tercer gol del partido. No hay nada que explicar: levantas tres dedos y que los cuenten ellos.":
			"Maçtaki üçüncü golün. Açıklanacak bir şey yok: üç parmağını kaldırırsın, saysınlar.",
		"SIN FESTEJAR": "SEVINÇ YOK",
		"Le marcaste al club que te formó. Te quedas quieto, con la mano en alto. Los otros nueve vienen a abrazarte igual.":
			"Seni yetiştiren kulübe gol attın. Kıpırdamadan durursun, bir elin havada. Diğer dokuzu yine de sarılmaya gelir.",
		"AL CIELO": "GOKYUZUNE",
		"Tu primer gol después de una lesión larga. Señalas al cielo. Sólo cuenta ese gol, no los de después.":
			"Uzun bir sakatlıktan sonraki ilk golün. Gökyüzünü gösterirsin. Sadece o gol sayılır, sonrakiler değil.",


		"A TU PORTERO":
			"KALECINE",
		"Tu portero te salvó el partido con una parada. El festejo se va hacia TU campo y él viene corriendo desde su área.":
			"Kalecin bir kurtarışla maçı kurtardı. Kutlama SENIN yarı sahana gider ve o da ceza sahasından koşarak gelir.",
		"AL FOSO":
			"ÇUKURA",
		"Sólo de noche, con los focos encendidos: te plantas contra la valla del fondo y el estadio entero se te llena de flashes.":
			"Sadece gece, ışıklar yanarken: kale arkasındaki bariyere yaslanırsın ve bütün stat flaşlarla dolar.",
		"A LA TRIBUNA":
			"ANA TRIBUNE",
		"Hay clubes preguntando por ti. Te vas a la banda de la tribuna principal y señalas hacia el palco: que decidan ellos.":
			"Seni soran kulüpler var. Ana tribünün önündeki kenar çizgisine gidip locayı gösterirsin: karar onların.",
		"EN SU AREA":
			"ALANLARINDA",
		"Derbi de visita: no corres a ningún lado. Te plantas en el punto de penalti, de espaldas al arco y de cara a su gente, con los brazos abiertos.":
			"Deplasmanda derbi: hiçbir yere koşmazsın. Penaltı noktasına dikilirsin; sırtın kaleye, yüzün onların taraftarına dönük, kolların açık.",
		"NADIE VIENE":
			"KIMSE GELMEZ",
		"El vestuario no te quiere. Marcas, y ninguno de los diez va a abrazarte: se dan la vuelta y te dejan ahí.":
			"Soyunma odası sana sırt çevirdi. Gol atarsın ve onlardan hiçbiri sarılmaya gelmez: arkalarını dönüp seni orada bırakırlar.",
		"MAS RUIDO":
			"DAHA SESLI",
		"En casa: las dos manos a las orejas, pidiéndole a tu gente que se oiga.":
			"Evinde: iki elin kulaklarında, taraftarından sesini duyurmasını istersin.",
		"BESAR EL CESPED":
			"ÇIMI OP",
		"Tu primera temporada en el club: te arrodillas y besas el césped de tu casa nueva.":
			"Kulüpteki ilk sezonun: diz çöküp yeni evinin çimlerini öpersin.",
		"APLAUSO A TU GENTE":
			"TARAFTARA ALKIŞ",
		"Marcas, pero seguís perdiendo: nada de gritos, aplaudes a los que vinieron a verte.":
			"Gol atarsın ama hâlâ yeniliyorsunuz: bağırmak yok, seni izlemeye gelenleri alkışlarsın.",
		"SALUDO DE GOLEADA":
			"FARK SELAMI",
		"Con tres goles o más de ventaja ya no hay nada que gritar: caminas saludando a la grada.":
			"Üç gol ya da daha fazla öndeyken bağıracak bir şey kalmaz: tribünü selamlayarak yürürsün.",
		"SALTO DE CABEZA":
			"KAFA SIÇRAYIŞI",
		"Gol por alto: saltas una y otra vez con los brazos al cielo.":
			"Havadan gol: iki kolun gökyüzünde, tekrar tekrar zıplarsın.",
		"EL AVION":
			"UÇAK",
		"Corres al festejo con los brazos abiertos, planeando como un avión. Sólo en los festejos con carrera de verdad.":
			"Kollarını açıp uçak gibi süzülerek sevince koşarsın. Sadece gerçek koşulu sevinçlerde.",
		"LA SELFIE":
			"SELFIE",
		"Pegado a tu gente —tu fondo o la valla en casa, tu rincón de visita—: sacas el teléfono y te haces una foto con ellos.":
			"Taraftarına yapışık —evinde tribünün ya da bariyerin, deplasmanda köşen—: telefonu çıkarıp onlarla fotoğraf çekersin.",
		"ES MI HORA":
			"SAAT BENIM",
		"Gol del minuto 80 en adelante: te señalas la muñeca, que es tu hora. Una de cada tres veces.":
			"80. dakikadan sonra gelen gol: bileğine vurursun, çünkü saat senin saatin. Üç seferden birinde.",
		"MODO ZEN":
			"ZEN MODU",
		"Con dos goles de ventaja o más: te sientas en el césped con las piernas cruzadas y meditas. Que se preocupen ellos.":
			"İki gol ya da daha fazla öndeyken: çimlere bağdaş kurup oturur ve meditasyon yaparsın. Varsın onlar dertlensin.",
		"BESO AL ANILLO":
			"YUZUK OPUCUGU",
		"Tienes pareja: besas el anillo y señalas a la grada, a quien te mira desde allí. Uno de cada cinco goles.":
			"Sevgilin var: yüzüğünü öper, tribünde seni izleyeni gösterirsin. Beş golden birinde.",
		"MI NOMBRE":
			"ISMIM",
		"Hay clubes preguntando por ti: te das la vuelta y te señalas el nombre de la espalda para que lo apunten. La mitad de las veces.":
			"Seni soran kulüpler var: arkanı dönüp sırtındaki ismi gösterirsin ki not alsınlar. İki seferden birinde.",
		"LA MORTAL":
			"TERS TAKLA",
		"Un golazo, desde fuera del área o de falta: llegas, tomas impulso y das una mortal hacia atrás. La otra mitad de los golazos.":
			"Müthiş bir gol, ceza sahası dışından ya da frikikten: gelirsin, hız alırsın ve geriye takla atarsın. Müthiş gollerin öbür yarısı.",
		"EL DAB":
			"DAB",
		"Se gana en el banquillo, con tus tres botellas de pie: escondes la cara en el codo y apuntas con el otro brazo. Uno de cada siete goles.":
			"Yedek kulübesinde kazanılır, üç şişenin üçü de ayakta kalınca: yüzünü dirseğine gömüp öbür kolunla işaret edersin. Her yedi golden birinde.",
		"¡DAB DESBLOQUEADO! Ya sale en tus goles.":
			"DAB AÇILDI! Artık gol sevinçlerinde.",
		"Se gana en el banquillo, con tres partidas ganadas 2-0: te plantas cara a cara con un compañero y os jugáis el gol a una mano. Uno de cada siete goles.":
			"Yedek kulübesinde kazanılır, üç oyunu 2-0 kazanınca: bir takım arkadaşınla karşı karşıya geçip golü tek elle oynarsınız. Her yedi golden birinde.",
		"2-0: {0} de {1} para festejar tus goles con CHIN CHAN PU.":
			"2-0: {0}/{1}, gollerini TAŞ KAGIT MAKAS ile kutlamak için.",
		"¡CHIN CHAN PU DESBLOQUEADO! Ya sale en tus goles.":
			"TAŞ KAGIT MAKAS AÇILDI! Artık gol sevinçlerinde.",
		"BRAZOS CRUZADOS":
			"KOLLAR BAGLI",
		"Ya habías fallado dos claras hoy. A la tercera no festejas: te cruzas de brazos y que hablen ellos.":
			"Bugün zaten iki net pozisyon kaçırmıştın. Üçüncüde sevinmezsin: kollarını bağlarsın, varsın onlar konuşsun.",


		"AL CHARCO":
			"BIRIKINTIYE",
		"Sólo con lluvia y campo encharcado: todo el equipo corre al charco más cercano y se lanza de panza. Salpica hasta la valla.":
			"Sadece yağmurda, su basmış sahada: bütün takım en yakın su birikintisine koşar ve karnının üstüne atlar. Sular bariyere kadar sıçrar.",
		"EN LA VALLA":
			"PANODA",
		"Sólo en casa: te subes a la publicidad con los dos que llegan contigo. Los tres, sentados y de brazos cruzados, mirando al campo.":
			"Sadece evinde: seninle gelen ikisiyle reklam panosuna çıkarsın. Üçünüz kollarınız bağlı oturup sahayı izlersiniz.",
		"LA BOTELLA":
			"ŞIŞE",
		"Festejando pegado a tu grada, alguien te tira una botella de agua: la atrapas al vuelo, te la bebes y la mandas de vuelta.":
			"Kendi tribününün dibinde sevinirken biri sana su şişesi atar: havada yakalar, içer ve geri yollarsın.",


		"EN TU PUESTO MANDA": "MEVKINDE OYNAYAN",
		"Empiezas en el banquillo.": "Yedek kulübesinde başlıyorsun.",

		"JUEGAS EN {0} · PIDE {1}": "SEN: {0} · GEREKEN: {1}",
		"NOTA {0} · PIDE {1}": "NOT {0} · GEREKEN {1}",
		"{0} A {1} DE TU SITIO": "{0} · MEVKINE {1} KALDI",
		"{0} A {1}": "{0} {1} GERIDE",
		"DE TU SITIO": "MEVKINDEN",
		"TÉCNICO {0} · PIDE {1}": "HOCA {0} · GEREKEN {1}",
		"TÉCNICO {0}": "HOCA {0}",
		"A {0} DE {1}": "{1}: {0} FARK",
		"TE ACERCAS": "YAKLAŞTIN",
		"TE ALEJAS": "UZAKLAŞTIN",
		"Por nivel saldrías de inicio, pero el seleccionador te tiene en {0} y sólo pone de titular a quien le tiene en {1}. Se gana con partidos de selección.": "Seviyene göre ilk 11'de başlardın, ama milli takım teknik direktörü sana {0} veriyor ve sadece {1} ve üstü verdiği oyuncuları ilk 11'de oynatıyor. Bunu milli maçlarla kazanırsın.",
		"El vestuario te tiene en {0}: hasta {1} te llegarán {2} balones como mucho.": "Soyunma odasındaki notun {0}: {1} olana kadar en fazla {2} top gelecek.",
		"En casa la afición está contigo ({0}): un balón más.": "Evde taraftar seninle ({0}): bir top fazla.",
		"En casa la afición te pita ({0}): un balón menos.": "Evde taraftar seni ıslıklıyor ({0}): bir top eksik.",
		"LE QUITASTE EL SITIO A": "YERINI ALDIGIN OYUNCU",
		"RESERVA": "YEDEK",
		"PLANTILLA": "KADRO",
		"EL ONCE": "ILK 11",
		"NO CONVOCADOS": "KADRO DIŞI",
		"RACHA": "FORM",
		"TU PUESTO": "MEVKIN",
		"PEDIR JUGAR DE {0} · {1}": "MEVKI ISTE: {0} · {1}",
		"LO VERA BIEN": "IYI KARŞILAR",
		"PUEDE ESCUCHARTE": "DINLEYEBILIR",
		"LO VERA DIFICIL": "ZOR GORUR",
		"NI LO ESCUCHA": "DINLEMEZ BILE",
		"Ya le pediste un cambio de puesto en esta ventana.": "Bu transfer döneminde zaten mevki değişikliği istedin.",
		"El club te pasa a jugar de {0}.": "Kulüp seni {0} olarak oynatmaya başlıyor.",
		"{0} · RINDES {1}%": "{0} · VERIM %{1}",
		"{0} · RINDES AL {1}% AQUI": "{0} · BURADA VERIMIN %{1}",
		"TUS PUESTOS": "MEVKILERIN",
		"PUEDES APRENDERLO": "OGRENEBILIRSIN",
		"FAVORITA": "FAVORI",
		"Tu FAVORITA pesa: los clubes que te quieren ahí salen antes y el técnico te escucha más si se la pides.": "FAVORI mevkin ağırlık taşır: seni orada isteyen kulüpler önce çıkar ve istersen hoca seni daha çok dinler.",


		"¿APRENDER {0}?": "OGREN: {0}?",
		"APRENDERLO": "OGREN",
		"PUESTO DEVUELTO · {0}": "MEVKI IADE · {0}",
		"NATURAL": "DOGAL",
		"COMODO": "RAHAT",
		"PROBANDO": "DENEMEDE",
		"AJENO": "YABANCI",
		"Aprender un puesto hace que los clubes puedan ficharte para él. El oficio sale de jugarlo.": "Bir mevki öğrenmek, kulüplerin seni o mevki için transfer edebilmesini sağlar. Ustalık oynayarak gelir.",

		"En el partido: rematas dentro del área y te llegan más centros para cabecear.": "Maçta: ceza sahası içinde bitirirsin ve kafa vuruşu için daha çok orta gelir.",
		"En el partido: más disparos desde la frontal y más balones para la volea.": "Maçta: ceza sahası önünden daha çok şut ve vole için daha çok top.",
		"En el partido: más contras por tu banda, disparos de lejos y salidas jugadas.": "Maçta: kanadından daha çok kontra, uzaktan şutlar ve geriden oyun kurma.",
		"En el partido: disparos de lejos y desde la frontal, voleas y salidas jugadas.": "Maçta: uzaktan ve ceza sahası önünden şutlar, voleler ve geriden oyun kurma.",
		"En el partido: sobre todo disparos de lejos y salidas jugadas; poca área.": "Maçta: çoğunlukla uzaktan şutlar ve geriden oyun kurma; ceza sahasında az zaman.",
		"TE QUIEREN DE {0}": "ISTENEN MEVKI: {0}",
		"PAGA MÁS": "ÇOK ODER",
		"MEJOR CLUB": "IYI KULUP",
		"MÁS MINUTOS": "ÇOK SURE",
		"OFERTA {0} DE {1}": "TEKLIF {0}/{1}",
		"SU ONCE MÁS FUERTE": "EN GUCLU ILK 11",
		"SI TE VAS, LO MEJOR DE LA MESA": "GIDERSEN, MASADAKI EN IYISI",
		"TE HAN OFRECIDO": "MASADAKILER",
		"DESTINOS": "KIRALIK",
		"TU SALIDA": "AYRILIGIN",
		"EN CESIÓN": "KIRALIK",
		"FUERA DEL PLAN": "PLAN DISI",
		"NO TE VENDEN": "SATILMAZSIN",
		"TE ESCUCHAN": "DINLERLER",
		"Salvo cláusula: {0}": "Serbest kalma bedeli hariç: {0}",
		"Te llegan {0} ofertas más y tu club pide un {1}% menos": "{0} teklif daha alırsın ve kulübün %{1} daha az ister",
		"Te queda un año: no te retienen.": "Bir yılın kaldı: seni tutmazlar.",
		"TU SITIO · {0}": "MEVKIN · {0}",
		"TU SITIO ESTA LIBRE": "MEVKIN BOŞ",
		"CESIÓN {0} DE {1}": "KIRALIK {0}/{1}",
		"SIN OPCIÓN": "OPSIYONSUZ",
		"Jugarías de": "Oynayacağın mevki",
		"Vuelves en": "Dönüş",
		"Opción de compra": "Satın alma opsiyonu",
		"Creces": "Gelişirsin",
		"Con la ventana abierta ya no se da pie: si quieren, su oferta llega a la mesa.": "Transfer dönemi açıkken artık ima yok: seni istiyorlarsa teklifleri masaya gelir.",
		"{0} TEMP": "{0} SEZ",
		"mercadoMESA": "MASA",
		"MINUTOS": "DAKIKA",
		"Nada de lo que hay encima de la mesa te mejora: ni el club, ni la ficha, ni los minutos.":
			"Masadaki hiçbir şey seni ileri taşımıyor: ne kulüp, ne maaş, ne süre.",
		"TE PEDIRÁN GOLES": "GOL ISTEYECEKLER",
		"TE PEDIRÁN ASISTENCIAS": "ASIST ISTEYECEKLER",
		"Sin club: no hay plantilla que mostrar. Ficha por un equipo y aquí verás a los tuyos.":
			"Kulübün yok: gösterilecek kadro yok. Bir takımla imzala, takım arkadaşlarını burada görürsün.",
		"Sales de inicio.": "İlk 11'de başlıyorsun.",
		"Viajas, pero no juegas.": "Kafileye giriyorsun ama oynamıyorsun.",
		"El torneo ya empezó y la lista está cerrada: tu sitio se juega en la próxima.":
			"Turnuva başladı ve kadro kapandı: yerin bir dahaki sefere belirlenecek.",
		"Ya das el nivel: te llaman en la próxima fecha FIFA.":
			"Artık seviyen yetiyor: bir sonraki milli arada çağrılacaksın.",
		"BOTA DE LA LIGA": "LIG GOL KRALI",
		"Tu premio te avala: este año no te piden nota ni nivel.":
			"Ödülün sana kefil: bu yıl senden not ya da seviye istemiyorlar.",
		"MEJOR DE LA LIGA": "LIGIN EN IYISI",
		"PREMIO DE CAMPEONES": "ELIT KUPASI ODULU",
		"CAMPEON DEL MUNDO": "DUNYA ŞAMPIYONU",
		"CAMPEON CONTINENTAL": "KITA ŞAMPIYONU",
		"BOTA DEL MUNDIAL": "DUNYA GOL KRALI",
		"JUGAR INFILTRADO": "SAKAT OYNA",
		"PIDE": "ŞART",
		"TIENES": "SENDE",
		"Decide si SALES. Si le caes mal, no pasas del banquillo. Lo que haces en las fechas FIFA te sube o te baja con él, y en amistosos rota.":
			"OYNAYIP oynamayacağına o karar verir. Seni sevmezse yedek kulübesinden çıkamazsın. FIFA arası tarihlerde yaptıkların seni onun gözünde yükseltir ya da düşürür, hazırlık maçlarında rotasyon yapar.",
		"Deciden si te la PASAN: si el grupo no te quiere, te llegan dos balones. Se gana ganando juntos.":
			"Sana PAS verip vermeyeceklerine onlar karar verir: grup seni istemezse bütün maç iki top alırsın. Birlikte kazanarak kazanılır.",
		"PARA ENTRAR": "KADRO IÇIN",
		"PARA SER TITULAR": "ILK 11 IÇIN",


		"MI EQUIPO":
			"TAKIMIM",
		"GERENCIA":
			"YONETIM",
		"DAR UNA CHARLA AL VESTUARIO":
			"SOYUNMA ODASINDA KONUŞ",
		"Reúnes al grupo tú, sin el míster delante. Si te siguen, el equipo entero se suelta; si no eres nadie ahí dentro, se nota.":
			"Oyuncuları hoca yokken sen toplarsın. Seni takip ederlerse bütün takım rahatlar; orada bir hiçsen, belli olur.",
		"PEDIR CAMBIO DE PUESTO":
			"MEVKI DEGIŞIKLIGI ISTE",
		"Le dices al técnico dónde quieres jugar. Cuenta lo cómodo que estés ahí y lo que se fíe de ti.":
			"Hocaya nerede oynamak istediğini söylersin. Önemli olan orada ne kadar rahat olduğun ve sana ne kadar güvendiği.",
		"PEDIR LOS BALONES PARADOS":
			"DURAN TOPLARI ISTE",
		"Penales, faltas y córners para ti el resto de la temporada, aunque haya alguien con mejor pie en la plantilla.":
			"Sezonun geri kalanında penaltılar, serbest vuruşlar ve kornerler senin; kadroda daha iyi ayağı olan biri olsa bile.",
		"SUGERIR UN FICHAJE":
			"TRANSFER ONER",
		"Señalas a un jugador de otro club. El club mira su precio y su caja, y decide.":
			"Başka bir kulüpten bir oyuncuyu gösterirsin. Kulübün onun fiyatına ve kendi kasasına bakar, karar verir.",
		"AVISAR QUE TE VAS LA PROXIMA TEMPORADA":
			"GELECEK SEZON GIDECEGINI DUYUR",
		"No pides permiso: avisas. Entras en la lista, bajan lo que piden por ti y llegan ofertas de verdad. La grada no lo olvida.":
			"İzin istemiyorsun: haber veriyorsun. Listeye girersin, bedelin düşer ve gerçek teklifler gelir. Tribün bunu unutmaz.",
		"NIVEL EN EL VESTUARIO":
			"SOYUNMA ODASINDAKI SEVIYEN",
		"CONFIANZA DEL TECNICO":
			"HOCANIN GUVENI",
		"EL VESTUARIO":
			"SOYUNMA ODASI",
		"LA GRADA":
			"TRIBUN",
		"ANOS EN EL CLUB":
			"KULUPTEKI YILLAR",
		"Sin club no hay nada que pedir. Ficha por un equipo y aquí decidirás con él.":
			"Kulübün yoksa isteyecek bir şey yok. Bir takımla imzala, burada onlarla birlikte karar verirsin.",
		"TU PESO EN EL CLUB":
			"KULUPTEKI AGIRLIGIN",
		"No se compra: sale de lo que eres en ese vestuario.":
			"Satın alınmaz: o soyunma odasında ne olduğundan gelir.",
		"QUE LE PIDES":
			"NE ISTIYORSUN",
		"Esperas respuesta a: {0}.":
			"Bekleyen cevap: {0}.",
		"Te contestan en la próxima jornada.":
			"Gelecek hafta cevap verirler.",
		"Te contestan en {0} jornadas.":
			"{0} hafta içinde cevap verirler.",
		"Acabas de pedir algo: la próxima jornada puedes volver.":
			"Az önce bir şey istedin: gelecek hafta tekrar gel.",
		"Acabas de pedir algo: puedes volver en {0} jornadas.":
			"Az önce bir şey istedin: {0} hafta sonra tekrar gel.",
		"Cedido no decides tu vida aquí: el club que te tiene prestado no manda, y el tuyo ya decidió tu año.":
			"Kiralıkken burada hiçbir şeye karar veremezsin: seni kiralayan kulüp söz sahibi değil, asıl kulübün de yılını çoktan belirledi.",
		"LA RESPUESTA DEL CLUB":
			"KULUBUN CEVABI",
		"Te escucharon y dijeron que no. Queda dicho.":
			"Dinlediler ve hayır dediler. Konu kapandı.",
		"Hablaste tú y el grupo se soltó: el vestuario está contigo.":
			"Sen konuştun ve grup rahatladı: soyunma odası seninle.",
		"Dijeron que sí, pero el puesto ya no estaba libre.":
			"Evet dediler ama mevki artık boş değildi.",
		"Desde hoy juegas de {0}.":
			"Bugünden itibaren {0} olarak oynuyorsun.",
		"Los penales, las faltas y los córners son tuyos el resto de la temporada.":
			"Sezonun geri kalanında penaltılar, serbest vuruşlar ve kornerler senin.",
		"Queda dicho: te vas al acabar la temporada. Estás en la lista y van a llegar ofertas.":
			"Karar verildi: sezon sonunda gidiyorsun. Listedesin ve teklifler gelecek.",
		"Dijeron que sí, pero el fichaje se cayó: ese jugador ya no estaba donde lo viste.":
			"Evet dediler ama transfer suya düştü: o oyuncu artık gördüğün yerde değildi.",
		"{0} firma por tu club. Lo pediste tú.":
			"{0} kulübünle imzaladı. Onu sen istedin.",
		"Te dijeron que sí.":
			"Evet dediler.",
		"Peso {0} · {1}":
			"Ağırlık {0} · {1}",
		"Abrir la boca ya cuesta, digan lo que digan.":
			"Ağzını açmanın bile bir bedeli var, ne cevap verirlerse versinler.",
		"PEDIRLO":
			"ISTE",
		"DEJARLO":
			"VAZGEÇ",
		"DONDE QUIERES JUGAR":
			"ISTEDIGIN MEVKI",
		"Sólo sabes jugar en un sitio. Aprende otro y podrás pedirlo.":
			"Sadece tek bir mevkide oynayabiliyorsun. Bir başkasını öğren, onu da isteyebilirsin.",
		"A QUIEN FICHAMOS":
			"KIMI ALALIM",
		"Lo más flojo del once es el {0} ({1}).":
			"İlk 11'in en zayıf halkası {0} ({1}).",
		"{0} · media {1} · {2} años · {3}":
			"{0} · genel {1} · {2} yaş · {3}",
		"Hoy no hay nadie que mejore tu once y esté a tiro. Vuelve otra jornada.":
			"Bugün ilk 11'ini geliştirecek ve ulaşılabilir kimse yok. Başka bir hafta tekrar gel.",


		"LO ESTAN VIENDO":
			"INCELIYORLAR",
		"MIENTRAS TANTO":
			"BU ARADA",
		"Tu peso subió a {0} desde que lo pediste.":
			"İstediğinden beri ağırlığın {0} seviyesine çıktı.",
		"Tu peso bajó a {0} desde que lo pediste.":
			"İstediğinden beri ağırlığın {0} seviyesine düştü.",
		"Tu peso sigue en {0}.":
			"Ağırlığın hâlâ {0}.",
		"Te contestan con el peso que tengas ese día, no con el de hoy: lo que hagas hasta entonces cuenta.":
			"O günkü ağırlığına göre cevap verirler, bugünküne göre değil: o zamana kadar yaptıkların sayılır.",
		"A {0} ya se lo llevaron: cuando contesten, la petición se caerá sola.":
			"{0} adlı oyuncu çoktan gitti: cevap verdiklerinde istek kendiliğinden düşecek.",
		"{0} sigue donde lo viste.":
			"{0} hâlâ gördüğün yerde.",
		"LO QUE PUEDE PAGAR EL CLUB":
			"KULUBUN ODEYEBILECEGI",
		"La raya es el más caro de la lista.":
			"Çizgi, listedeki en pahalı oyuncu.",
		"No cabe en la caja. Puedes señalarlo igual.":
			"Kasaya sığmıyor. Yine de onu gösterebilirsin.",
		"EL DESPACHO":
			"YONETIM ODASI",
		"TE DIJERON QUE SI":
			"EVET DEDILER",
		"TE DIJERON QUE NO":
			"HAYIR DEDILER",


		"Le quedan {0} temporadas: es un parche.":
			"Sözleşmesinin bitmesine {0} sezon var: geçici bir çözüm.",
		"Le quedan {0} temporadas.":
			"Sözleşmesinin bitmesine {0} sezon var.",


		"LO QUE LES HAS PEDIDO":
			"ONLARDAN ISTEDIKLERIN",
		"T{0} J{1} · {2}":
			"S{0} H{1} · {2}",
		"FICHAR A {0}":
			"TRANSFER {0}",
		"JUGAR DE {0}":
			"MEVKI: {0}",
		"TE SIGUIERON":
			"PEŞINDEN GELDILER",
		"TE CAMBIARON DE SITIO":
			"MEVKINI DEGIŞTIRDILER",
		"TE LOS DIERON":
			"SANA VERDILER",
		"QUEDO DICHO":
			"DUYURULDU",
		"LO FICHARON":
			"ONU ALDILAR",


		"LO QUE MAS TE FALTA":
			"EN ÇOK EKSIGIN",
		"{0}, {1} PUNTOS":
			"{0}, {1} PUAN",
		"Se mide contra tu vestuario, no en absoluto: sube tu media, o cámbiate a un club donde destaques.":
			"Mutlak olarak değil, soyunma odana göre ölçülür: genelini yükselt ya da öne çıkacağın bir kulübe geç.",
		"Cada partido la mueve, arriba o abajo, según tu nota.":
			"Her maç, notuna göre onu yukarı ya da aşağı oynatır.",
		"Se gana fuera del campo: la charla, los retos en casa y lo que decides con ellos.":
			"Saha dışında kazanılır: takım konuşması, evdeki meydan okumalar ve onlarla verdiğin kararlar.",
		"Sube al cumplir tu objetivo de contrato, y con el año que haga el club.":
			"Sözleşme hedefini tutturunca ve kulübün geçirdiği sezonla yükselir.",
		"Se revisa al cerrar la temporada, contra la mejor media de tus compañeros.":
			"Sezon sonunda, takım arkadaşlarının en yüksek geneline göre gözden geçirilir.",
		"Se gana quedándote: cada temporada en el mismo club suma.":
			"Kalarak kazanılır: aynı kulüpteki her sezon sayılır.",



		"NO SE PIDE, SE AVISA":
			"ISTENMEZ, DUYURULUR",
		"Años en el club":
			"Kulüpteki yıllar",
		"DE CIEN":
			"YUZ UZERINDEN",
		"PRESUPUESTO PARA FICHAJES":
			"TRANSFER BUTÇESI",

		"ENTRA SIN APRETAR":
			"RAHAT HARCAMA",
		"CABE":
			"OLUR",
		"APRIETA":
			"ZORLAR",
		"NO LLEGA":
			"PARA YOK",
		"FICHAJES ESPERADOS":
			"BEKLENEN ALIMLAR",
		"Gastado en esta ventana: {0} de {1}.":
			"Bu dönem harcanan: {0} / {1}.",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede.":
			"Bu sırayla denerler: biri imzalarsa, diğerlerine kalanla teklif verirler.",
		"1 partido con ellos":
			"Onlarla 1 maç",
		"{0} partidos con ellos":
			"Onlarla {0} maç",
		"Te faltan {0} de relación.":
			"Gereken ilişkiye {0} puan eksiğin var.",
		"TE ESCUCHA":
			"DINLER",
		"LO QUE HICIERON CON TU LISTA":
			"LISTENLE NE YAPTILAR",
		"Ficharon a {0}. Lo señalaste tú.":
			"{0} adlı oyuncuyu aldılar. Onu sen göstermiştin.",
		"Miraron tu lista y no ficharon a ninguno.":
			"Listene baktılar ve hiçbirini almadılar.",
		"A QUIEN LE HAS SENALADO":
			"KIMLERI GOSTERDIN",
		"Marca hasta {0} jugadores en el RANKING y el club los mirará al cerrarse el mercado.":
			"SIRALAMA'da en fazla {0} oyuncu işaretle; transfer dönemi kapanınca kulüp onlara bakacak.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y los mirarán al cerrarse el mercado.":
			"İlk 11'indeki en zayıf halka {0} ({1}). SIRALAMA'da en fazla {2} oyuncu işaretle; transfer dönemi kapanınca onlara bakacaklar.",
		"Ventana abierta: {0} {1} por delante. En cada una el club decide, y un objetivo vivo puede caerse solo.":
			"Transfer dönemi açık: önünde {0} {1} var. Kulüp her birinde karar verir ve canlı bir hedef kendiliğinden düşebilir.",
		"Mercado cerrado. La próxima ventana dura {0} {1}: lo que marques ahora espera a que abra.":
			"Transfer dönemi kapalı. Bir sonraki dönem {0} {1} sürecek: şimdi işaretlediklerin açılmasını bekler.",
		"{0} de {1} esta temporada. Toca uno para quitarlo.":
			"Bu sezon {0} / {1}. Çıkarmak için birine dokun.",

		"RECOMENDAR AL CLUB ({0})":
			"KULUBE ONER ({0})",
		"QUITAR DE TU LISTA":
			"LISTENDEN ÇIKAR",
		"Señalado: interés {0}%, fichaje {1}%.":
			"İşaretlendi: ilgi %{0}, transfer %{1}.",
		"Tu once {0}": "İlk 11'in {0}",
		"Rival en su puesto {0}": "Mevkiindeki rakip {0}",
		"Tu once {0} · rival en su puesto {1}": "İlk 11'in {0} · mevkiindeki rakip {1}",
		"Brazalete +{0}": "Kaptanlık bandı +{0}",
		"Ojeo -{0}: no conoce tu liga": "Gözlemci -{0}: ligini tanımıyor",
		"Ojeo -{0}: {1} cesiones": "Gözlemci -{0}: {1} kiralık",
		"Ojeo -{0}: no conoce tu liga, {1} cesiones": "Gözlemci -{0}: ligini tanımıyor, {1} kiralık",
		"Viene de más arriba: precio +{0} %": "Daha büyük kulüpten geliyor: fiyat +%{0}",

		"Tu pasado pesa: {0} temporadas en ligas grandes, {1} cesiones, {2} clubes": "Geçmişin ağır basıyor: büyük liglerde {0} sezon, {1} kiralık, {2} kulüp",
		"Trayectoria: precio +{0} % ({1} temporadas en ligas grandes)": "Kariyer: fiyat +%{0} (büyük liglerde {1} sezon)",
		"Trotamundos: precio −{0} % ({1} cesiones, {2} clubes)": "Gezgin: fiyat −%{0} ({1} kiralık, {2} kulüp)",

		"Jugaste aquí {0} temporadas: te dejan volver por un {1} % menos": "Burada {0} sezon oynadın: %{1} daha ucuza dönmene izin veriyorlar",
		"Te dejan volver a casa por un {0} % menos": "%{0} daha ucuza eve dönmene izin veriyorlar",

		"REGRESA A CASA": "EVE DONUŞ",
		"VUELVE A CASA": "EVE DONUYOR",
		"La grada no lo olvidó: {0} con esta camiseta. Desde hoy vuelve a entrenar contigo.": "Taraftar unutmadı: bu formayla {0}. Bugünden itibaren yine seninle antrenman yapıyor.",
		"Jugó aquí {0} · traspaso -{1} %": "Burada oynadı: {0} · bonservis -%{1}",
		"Jugó aquí {0}": "Burada oynadı: {0}",
		"VUELVE": "DONUŞ",
		"INTERES": "ILGI",
		"LO PEDISTE TU":
			"SENIN SEÇIMIN",
		"TUS FICHAJES":
			"TRANSFERLERIN",
		"YA NO ESTA":
			"GITTI",
		"Tu ojo: {0} cerró el año con nota {1}":
			"Gözün: {0} yılı {1} notuyla kapattı",
		"{0} no convenció al técnico":
			"{0} hocayı ikna edemedi",
		"MARCAR EN EL RANKING ({0})":
			"SIRALAMADA IŞARETLE ({0})",
		"Ya has gastado tus recomendaciones de esta temporada. El año que viene vuelves a tener cinco.":
			"Bu sezonun tavsiye haklarını bitirdin. Gelecek yıl yine beş hakkın olacak.",
		"Ya gastaste tus {0} recomendaciones de esta temporada.":
			"Bu sezonki {0} tavsiye hakkını zaten kullandın.",
		"{0} de {1}. Toca uno para quitarlo.":
			"{0} / {1}. Çıkarmak için birine dokun.",
		"Ya has señalado {0}. Quita a alguno primero.":
			"Zaten {0} oyuncu işaretledin. Önce birini çıkar.",
		"Le dices al técnico dónde quieres jugar.":
			"Hocaya nerede oynamak istediğini söylersin.",
		"Penales, faltas y córners para ti el resto de la temporada.":
			"Sezonun geri kalanında penaltılar, serbest vuruşlar ve kornerler senin.",
		"No pides permiso: avisas. Entras en la lista y llegan ofertas de verdad.":
			"İzin istemiyorsun: haber veriyorsun. Listeye girersin ve gerçek teklifler gelir.",



		"QUE LO FICHEN":
			"ALSINLAR",
		"LO QUE PASO CON TUS OBJETIVOS":
			"HEDEFLERINE NE OLDU",
		"FALLIDO":
			"SUYA DUŞTU",
		"Marca hasta {0} jugadores en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"SIRALAMA'da en fazla {0} oyuncu işaretle; kulüp transfer döneminin her haftasında karar verecek.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"İlk 11'indeki en zayıf halka {0} ({1}). SIRALAMA'da en fazla {2} oyuncu işaretle; kulüp transfer döneminin her haftasında karar verecek.",
		"Ya lo intentaste esta temporada y se cayó. Podrás volver a señalarlo el año que viene.":
			"Bu sezon onu denedin ve suya düştü. Gelecek yıl onu yeniden gösterebilirsin.",
		"FICHARON A {0}":
			"ALINDI: {0}",
		"SE CAYO {0}":
			"SUYA DUŞTU: {0}",
		"TU ONCE {0}": "ILK 11: {0}",
		"No te mira: tu once está en {0} y él en {1}.":
			"Bakmaz bile: senin ilk 11'in {0}, onunki {1}.",
		"ALTAS Y BAJAS": "GELEN-GIDEN",
		"ALTA": "GELEN",
		"BAJA": "GIDEN",
		"SE CAYO SOLO": "SUYA DUŞTU",
		"CERRO EL MERCADO": "DONEM KAPANDI",
		"YA NO JUGABA AHI": "AYRILMIŞTI",
		"SE RETIRABA": "EMEKLI OLUYORDU",
		"TE FUISTE DEL CLUB": "KULUPTEN AYRILDIN",
		"Ya no le quedan jornadas: se cae al cerrar.":
			"Haftası kalmadı: dönem kapanınca düşer.",
		"Está acabando su carrera: el club no ficha a quien se retira.":
			"Kariyerini bitiriyor: kulüp emekli olacak oyuncuyu almaz.",
		"Ya no juega ahí.": "Artık orada oynamıyor.",
		"NO CABIA NADIE": "KADRODA YER YOKTU",
		"Tu plantilla está llena y no hay a quien soltar: aunque el club diga que sí, no cabrá.":
			"Kadron dolu ve bırakılacak kimse yok: kulüp evet dese bile sığmaz.",
		"El club está en apuro: solo entran los LIBRES.":
			"Kulüp zor durumda: sadece SERBEST oyuncular gelebilir.",
		"SE LO LLEVO {0}": "{0} KAPTI",
		"Llegaron porque tú los señalaste":
			"Sen gösterdiğin için geldiler",
		"Fichajes que le pediste al club y el club hizo.":
			"Kulüpten istediğin ve kulübün yaptığı transferler.",
		"Un fichaje que le pediste al club y el club hizo.":
			"Kulüpten istediğin ve kulübün yaptığı bir transfer.",
		"CLAUSULAZO":
			"BEDEL ODENDI",
		"Mis outfits":
			"Kombinlerim",
		"Nombre del outfit":
			"Kombin adı",
		"Escribe un nombre para guardar tu outfit.":
			"Kombinini kaydetmek için bir ad yaz.",
		"Outfit guardado.":
			"Kombin kaydedildi.",
		"Outfit aplicado.":
			"Kombin uygulandı.",
		"Outfit actualizado con tu ropa actual.":
			"Kombin şu an giydiklerinle güncellendi.",
		"Outfit eliminado.":
			"Kombin silindi.",
		"Guarda tu combinación actual y úsala con un toque.":
			"Şu an giydiğini kaydet ve tek dokunuşla kullan.",
		"Guardar outfit":
			"Kombini kaydet",
		"Playera gráfica":
			"Baskılı tişört",
		"Jersey retro":
			"Retro forma",
		"Polo tejido":
			"Örgü polo",
		"Camisa de lino":
			"Keten gömlek",
		"Cierre corto":
			"Yarım fermuar",
		"Polo rugby":
			"Rugby polo",
		"Sobrecamisa":
			"Gömlek ceket",
		"Parka":
			"Parka",
		"Pants deportivos":
			"Eşofman altı",
		"Pantalón de pinzas":
			"Pileli pantolon",
		"Jeans barril":
			"Barrel kot",
		"Cargo técnico":
			"Teknik kargo pantolon",
		"Tenis retro":
			"Retro spor ayakkabı",
		"Tenis deportivos":
			"Koşu ayakkabısı",
		"Zapatos de charol":
			"Rugan ayakkabı",
		"Tenis gruesos":
			"Kalın tabanlı spor ayakkabı",
		"Cinturón de cuero":
			"Deri kemer",
		"Hebilla metálica":
			"Metal toka",
		"Pañuelo recto":
			"Düz mendil",
		"Pañuelo de pico":
			"Sivri mendil",
		"Casual elegante":
			"Şık günlük",
		"Corbata de moño":
			"Papyon",
		"Corbata, moño o bufanda":
			"Kravat, papyon ya da atkı",
		"Ya no juega ahí. Quítalo y señala a otro.":
			"Artık orada oynamıyor. Onu çıkar ve başkasını göster.",
		"Está acabando su carrera. Quítalo y señala a otro.":
			"Kariyerinin sonuna geliyor. Onu çıkar ve başkasını göster.",
		"Hoy no hay presupuesto. Si el club vende, vuelve a haberlo.":
			"Bugün bütçe yok. Kulüp satış yaparsa yine olur.",


		"REFUERZO":
			"TAKVIYE",
		"TE HICIERON CASO":
			"SENI DINLEDILER",
		"Lo señalaste tú y el club puso el dinero. Desde hoy entrena contigo.":
			"Onu sen gösterdin ve kulüp parayı koydu. Bugünden itibaren seninle antrenman yapıyor.",
		"Te Hicieron Caso":
			"Seni Dinlediler",
		"El club fichó a alguien que TÚ le señalaste.":
			"Kulüp, SENIN gösterdiğin birini aldı.",
		"Que el club fiche a alguien que TÚ le hayas señalado.": "Kulübe SENIN gösterdiğin birini aldır.",


		"FICHAJES DE VERANO": "YAZ TRANSFERLERI",
		"Y {0} MÁS": "VE {0} DAHA",

		"NUEVA YORK":
			"NEW YORK",
		"TU CARA EN NUEVA YORK":
			"NEW YORK'TA YUZUN",
		"La marca compró la plaza entera. Todas las pantallas a la vez, y en todas tú.":
			"Marka bütün meydanı satın aldı. Bütün ekranlar aynı anda, hepsinde sen.",
		"ÚLTIMA HORA":
			"SON DAKIKA",
		"{0} FIRMA CON {1}":
			"{0} IMZALADI: {1}",
		"ALINEACIÓN":
			"DIZILIŞ",
		"PITADA":
			"YUH",
		"TU GRADA TE PITA":
			"TRIBUN YUHALIYOR",
		"Te silbaron al oír tu nombre. El partido de hoy es la respuesta.":
			"Adını duyunca ıslıkladılar. Bugünkü maç senin cevabın.",
		"tardes malas":
			"kötü günler",
		"{0} veces con esta camiseta. El club te lo agradece antes del saque.":
			"Bu formayla {0} kez. Kulüp başlama vuruşundan önce sana teşekkür ediyor.",
		"asistencias":
			"asist",
		"OJEADOR":
			"SCOUT",
		"Llegó una hora antes y sólo miró a uno. Su oferta llega en la próxima ventana.":
			"Bir saat erken geldi ve sadece bir oyuncuyu izledi. Teklifi bir sonraki transfer döneminde geliyor.",
		"A SEGUIR":
			"TAKIP",
		"MURAL":
			"MURAL",
		"TU CARA EN EL BARRIO":
			"DUVARDA YUZUN",
		"Nadie te pidió permiso para pintarte. Mejor así.":
			"Kimse seni çizmek için izin istemedi. Böylesi daha iyi.",
		"ANUNCIO":
			"REKLAM",
		"TU CARA EN LA CIUDAD":
			"ŞEHIRDE YUZUN",
		"FIJO POR PARTIDO":
			"MAÇ BAŞI SABIT",
		"Pasas por debajo y te ves en grande. Los que pasan, también.":
			"Altından geçiyorsun ve kendini kocaman görüyorsun. Geçenler de.",
		"LLEGADA":
			"VARIŞ",
		"LA COPA VUELVE A CASA":
			"KUPA EVE DONUYOR",
		"Viajó en su propio asiento, con el cinturón puesto. Nadie la soltó en todo el vuelo.":
			"Kendi koltuğunda, emniyet kemeri takılı uçtu. Bütün uçuş boyunca kimse elinden bırakmadı.",

		"TOMA {0}": "PLAN {0}",
		"TOMA 7": "PLAN 7",
		"REC": "REC",
		"La séptima fue la buena. El cámara estaba con el celular.":
			"Yedincisi tuttu. Kameraman telefonla uğraşıyordu.",


		"LA PANCARTA CON FALTA":
			"HATALI PANKART",
		"LA PANCARTA":
			"PANKART",
		"CASI":
			"YAKIN",
		"ARREGLADA":
			"DUZELDI",
		"la tela":
			"pankart",
		"tu apellido":
			"soyadın",
		"Una letra mal. La van a colgar igual todos los domingos.":
			"Bir harf yanlış. Yine de her pazar asacaklar.",
		"Tardaron años, pero la arreglaron. Con cinta.":
			"Yıllar sürdü ama düzelttiler. Bantla.",


		"LAS PALOMAS NO OLVIDAN":
			"GUVERCINLER UNUTMAZ",
		"Una paloma del larguero no volvió a casa. Las demás se acuerdan.":
			"Üst direkteki bir güvercin eve dönmedi. Diğerleri hatırlıyor.",
		"Otra vez tú. Ellas llevan la cuenta.":
			"Yine sen. Sayıyorlar.",
		"SANCION": "CEZA",
		"FAIR PLAY": "FAIR PLAY",
		"{0} arranca la liga con -{1} puntos por el fair play": "{0} lige fair play yüzünden -{1} puanla başlıyor",
		"{0} incumple el fair play: si repite, perderá {1} puntos": "{0} fair play kuralını çiğnedi: tekrarlarsa {1} puan kaybedecek",
		"CUENTAS DEL CLUB": "KULUP HESABI",
		"SANAS": "IYI",
		"EN APURO": "SIKIŞIK",
		"-{0} PTS": "-{0} PT",
		"AVISO {0}/{1}": "UYARI {0}/{1}",
		"INGRESOS / AÑO": "GELIR / YIL",
		"NOMINA / AÑO": "MAAŞ / YIL",
		"RAYA ROJA": "SINIR",
		"Cerrar la temporada con la caja bajo la raya roja es un aviso. Dos seguidas: la liga siguiente empieza con -{0} puntos.": "Sezonu kasa sınırın altında kapatmak bir uyarıdır. Üst üste iki kez: bir sonraki lig -{0} puanla başlar.",
		"-{0} por fair play": "-{0} fair play nedeniyle",
		"SANCION DE FAIR PLAY": "FAIR PLAY CEZASI",
		"-{0} PTS EN LA LIGA": "LIGDE -{0} PUAN",
		"AVISO DE FAIR PLAY": "FAIR PLAY UYARISI",
		"SI REPITE: -{0} PTS": "TEKRAR: -{0} PUAN",
		"EL CLUB CAMBIA DE DUEÑO": "KULUP EL DEGISTIRIYOR",
		"DINERO DE FUERA": "DIŞARIDAN PARA",
		"LOS INGRESOS SE DISPARAN": "GELIRLER ROKET GIBI",
		"TEMPORADAS DE PROYECTO": "PROJE SEZONLARI",
		"ingreso de antes": "önceki gelir",
		"ingreso ahora": "şimdiki gelir",
		"la caja": "kasa",
		"Compra el club y trae dinero de fuera: habrá más presupuesto en GERENCIA, y el club va a fichar, también en tu puesto.": "Kulübü satın alır ve dışarıdan para getirir: YONETIM bölümünde bütçe artar, kulüp oyuncu alır, senin mevkiine de.",
		"EL CLUB ENTRA EN CRISIS": "KULUP KRIZE GIRDI",
		"LA CAJA EN ROJO": "KASA KIRMIZIDA",
		"PUNTOS EN JUEGO": "RISKLI PUAN",
		"la raya roja": "sınır",
		"ingreso": "gelir",
		"DUEÑO NUEVO": "YENI PATRON",
		"EN CRISIS": "KRIZDE",
		"TOCA VENDER": "SATMALI",
		"Te sientan en el vestuario con el director deportivo. {0} está en crisis: si la caja sigue bajo la raya roja al cierre, la liga le quita {1} puntos. Eres lo que más vale del vestuario, y tu traspaso es el dinero que falta.": "Seni soyunma odasında spor direktörüyle oturturlar. {0} kriz içinde: sezon sonunda kasa hâlâ sınırın altındaysa lig {1} puan siler. Soyunma odasında en değerli sensin ve transferin eksik olan para.",
		"EL CLUB NO PAGA": "KULUP ODEMIYOR",
		"Te sientan en el vestuario con el director deportivo. {0} no tiene con qué pagarte: llevas {1} partidos sin cobrar y te deben ${2}. Si aguantas, cobras cuando llegue el dinero. Si pides la carta, en verano eres libre.": "Seni soyunma odasında spor direktörüyle oturtuyorlar. {0} sana ödeme yapamıyor: {1} maçtır maaş almadın ve ${2} alacağın var. Dayanırsan para geldiğinde alırsın. Serbest kalma belgesini istersen yazın serbestsin.",
		"AGUANTO": "KALIRIM",
		"PIDO LA CARTA": "SERBEST ISTE",
		"IMPAGO DEL CLUB": "KULUP BORCU",
		"Lo que te debía el club": "Kulübün sana borcu olan tutar",
		"El dueño nuevo te paga lo que te debía el club: ${0}": "Yeni sahip, kulübün sana borçlu olduğunu ödüyor: ${0}",
		"El club te paga la mitad de lo que te debía: ${0} de ${1}": "Kulüp sana borcunun yarısını ödüyor: ${1} içinden ${0}",
		"EL CLUB TE DEBE": "KULUP BORÇLU",
		"TE DEBE": "BORÇ",
		"caja": "kasa",
		"MULTA POR LA ROJA": "KIRMIZI CEZASI",
		"MULTA DEL COMITÉ": "KURUL CEZASI",
		"multa {0}": "ceza {0}",
		"Esta temporada pagaste ${0} en multas": "Bu sezon cezalara ${0} ödedin",
		"ELECCIONES EN EL CLUB": "KULUP SEÇIMI",
		"Hay elecciones en {0}. El candidato promete sanear la caja vendiéndote este verano y quiere saber de qué lado estás. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "{0} kulübünde seçim var. Aday, seni bu yaz satarak kasayı toparlamayı vaat ediyor ve hangi tarafta olduğunu bilmek istiyor. Fotoğrafın oy getirir; taraftar kaybedeni seçenleri unutmaz.",
		"Hay elecciones en {0}. El candidato promete dinero para fichar y quiere tu foto en su campaña. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "{0} kulübünde seçim var. Aday, transfer için para vaat ediyor ve kampanyasında fotoğrafını istiyor. Fotoğrafın oy getirir; taraftar kaybedeni seçenleri unutmaz.",
		"CON EL PRESIDENTE": "BAŞKANIN YANINDA",
		"CON EL CANDIDATO": "ADAYIN YANINDA",
		"AL MARGEN": "TARAFSIZ",
		"El presidente gana las elecciones y sigue": "Başkan seçimi kazanıyor ve görevine devam ediyor",
		"Gana el candidato: el presidente nuevo quiere venderte este verano": "Aday kazanıyor: yeni başkan seni bu yaz satmak istiyor",
		"Gana el candidato: el presidente nuevo mete ${0} en la caja para fichar": "Aday kazanıyor: yeni başkan transfer için kasaya ${0} koyuyor",
		"PRESIDENTE": "BAŞKAN",
		"CANDIDATO": "ADAY",
		"GANA EL CANDIDATO": "ADAY KAZANDI",
		"SIGUE EL PRESIDENTE": "BAŞKAN KALIYOR",
		"LA GRADA TE APLAUDE": "TRIBUN ALKIŞLIYOR",
		"LA GRADA TE PITA": "TRIBUN YUHALIYOR",
		"EL JEQUE SE VA": "SEYH GIDIYOR",
		"El jeque deja el {0} y su nómina se queda: crisis": "Şeyh {0} kulübünü bıraktı, maaş yükü kaldı: kriz",
		"El jeque se ha ido y su dinero con él, pero la nómina que firmó se queda. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "Şeyh gitti, parası da onunla gitti ama imzaladığı maaş yükü kaldı. Bu yaz kulüp satmak zorunda ve sezon sonunda kasa hâlâ sınırın altındaysa lig {0} puan siler.",
		"LA SALA DE JUNTAS": "YONETIM KURULU",
		"Sin rodeos: no hay dinero. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "Lafı dolandırmadan: para yok. Bu yaz kulüp satmak zorunda ve sezon sonunda kasa hâlâ sınırın altındaysa lig {0} puan siler.",
		"SIN EUROPA": "AVRUPA YOK",
		"TEMPORADA SIN EUROPA": "AVRUPASIZ SEZON",
		"la plaza perdida": "kaybedilen yer",
		"puntos de sanción": "ceza puanı",
		"CONTROL FINANCIERO": "MALI DENETIM",
		"NO SE VENDE": "SATILMAZ",
		"EL ESTADIO SE VENDE": "STADYUM SATILDI",
		"cobra el club": "kulüp alır",
		"La crisis aprieta y el club vende el nombre del campo. La grada no lo perdona: este año entra menos gente y en el muro cuelga una pancarta.": "Kriz sıkıştırıyor ve kulüp sahanın adını satıyor. Tribün bunu affetmiyor: bu sene daha az seyirci geliyor ve duvarda bir pankart asılı.",
		"El {0} vende el nombre de su estadio: ahora es el {1}": "{0} stadının adını satıyor: yeni adı {1}",
		"VENDE EL ESTADIO": "STADYUM SATIYOR",
		"Sin rodeos: no hay dinero. Para tapar el agujero, el club vende el nombre del estadio, y aun así este verano tiene que vender.": "Lafı dolandırmadan: para yok. Açığı kapatmak için kulüp stadyumun adını satıyor ve yine de bu yaz oyuncu satmak zorunda.",
		"CONCURSO": "IFLAS",
		"El {0} entra en concurso de acreedores: este verano no ficha": "{0} iflas masasına giriyor: bu yaz transfer yok",
		"EL CONCURSO DE ACREEDORES": "IFLAS",
		"CONCURSO DE ACREEDORES": "IFLAS",
		"EN CONCURSO": "IFLASTA",
		"LO LLEVA UN ADMINISTRADOR": "KAYYUM YONETIYOR",
		"FICHAJES ESTE VERANO": "YAZ TRANSFERI",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Lo que se pueda vender, se vende.": "Kulüp borcunu ödeyemiyor ve bir hakim yönetime kayyum atıyor. Kış transfer dönemine kadar kimse transfer edilmez ve hiçbir sözleşmeye dokunulmaz, seninki de dahil. Satılabilecek ne varsa satılır.",
		"CONTRATOS CONGELADOS": "SOZLEŞME DONDU",
		"Tu club está en concurso: hasta el mercado de invierno no se toca un contrato.": "Kulübün iflas masasında: kış transfer dönemine kadar hiçbir sözleşmeye dokunulmaz.",
		"Tu club está en concurso: hasta el mercado de invierno no ficha a nadie.": "Kulübün iflas masasında: kış transfer dönemine kadar kimseyi transfer etmez.",
		"EL ADMINISTRADOR TE VENDE": "SATILIYORSUN",
		"El juez puso a un administrador al frente de {0} y te recibe en el despacho del presidente, con las cuentas sobre la mesa. En la lista de lo que se vende, tu nombre va el primero: o sales este verano, o te quedas cobrando menos.": "Hakim {0} kulübünün başına bir kayyum atadı ve seni başkanın odasında, hesaplar masadayken karşılıyor. Satış listesinde ilk sırada senin adın var: ya bu yaz gidersin, ya da daha az maaşla kalırsın.",
		"Tu club está en concurso y vas el primero de la lista. O sales este verano, o te quedas cobrando menos.": "Kulübün iflas koruması altında ve listenin başındasın. Ya bu yaz gidersin, ya da daha az maaşla kalırsın.",
		"Cobras menos lo que reste de contrato y el administrador te saca de la lista. El vestuario y la grada lo ven.": "Sözleşmenin kalanında daha az kazanırsın ve kayyum seni listeden çıkarır. Soyunma odası ve tribün bunu görür.",
		"LA REBAJA DEL VESTUARIO": "MAAŞ KESINTISI",
		"El presidente baja al vestuario: {0} está en crisis y no llega a fin de mes. Pide a la plantilla un {1}% menos de ficha esta temporada, y quien firme cobra a tiempo. El capitán ya ha firmado; faltas tú.": "Başkan soyunma odasına iniyor: {0} kriz içinde ve ayı çıkaramıyor. Kadrodan bu sezon maaşlarda %{1} kesinti istiyor, imzalayan zamanında ödeme alacak. Kaptan zaten imzaladı; sıra sende.",
		"FIRMO: {0}/sem": "IMZA: {0}/hf",
		"NO FIRMO": "IMZALAMA",
		"LA ASAMBLEA DE SOCIOS": "UYELER KURULU",
		"El juez cerró el concurso y {0} es de sus socios: la asamblea votó la compra a mano alzada, un {1}% a favor. No hay dueño que ponga dinero, así que piden a la plantilla que entre con una acción. La grada mira a sus jugadores.": "Hakim iflas dosyasını kapattı ve {0} artık üyelerinin: kurul satın almayı el kaldırarak oyladı, yüzde {1} evet dedi. Para koyacak bir sahip yok, bu yüzden kadrodan bir hisseyle katılması isteniyor. Tribün oyuncularına bakıyor.",
		"COMPRO ACCIONES": "HISSE ALIRIM",
		"SÓLO VOTO": "SADECE OY",
		"SOCIOS": "UYELER",
		"Los socios compran el {0}: un {1}% vota sí en la asamblea": "Üyeler {0} kulübünü satın alıyor: kurulda yüzde {1} evet oyu verdi",
		"DE LOS SOCIOS": "UYELERIN",
		"Los socios te pagan lo que te debía el club: ${0}": "Üyeler kulübün sana borçlu olduğunu ödüyor: ${0}",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tienes acciones: tu voto arrastra a la grada.": "Üç sezon sonra bir yatırımcı {0} kulübünü satın almak istiyor ve genel kurul sezon sonunda oylayacak. Anketlerde satışa evet diyenler %{1}. Hissen var: oyun tribünü peşinden sürükler.",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tu voto es uno más, pero la grada escucha a sus jugadores.": "Üç sezon sonra bir yatırımcı {0} kulübünü satın almak istiyor ve genel kurul sezon sonunda oylayacak. Anketlerde satışa evet diyenler %{1}. Oyun sadece bir oy, ama tribün oyuncularını dinler.",
		"LA ASAMBLEA VOTA LA VENTA": "KURUL SATIŞI OYLAR",
		"VOTO VENDER": "SATIŞA EVET",
		"VOTO SEGUIR": "KALMAYA OY",
		"Los socios venden el {0} a un inversor: un {1}% vota sí": "Üyeler {0} kulübünü yatırımcıya satıyor: oyların %{1} evet",
		"Los socios del {0} no venden: un {1}% vota seguir": "{0} üyeleri satmıyor: oyların %{1} kalmaktan yana",
		"ASAMBLEA DE SOCIOS": "UYE KURULU",
		"EL DUEÑO QUIERE TUS ACCIONES": "PATRON HISSENI ISTIYOR",
		"No regatea: el dinero no es su problema.": "Pazarlık yapmaz: para onun için sorun değil.",
		"Sabe lo que vale cada parte y lo paga.": "Her payın değerini bilir ve öder.",
		"Su fondo regatea cada céntimo.": "Fonu her kuruş için pazarlık eder.",
		"VENDO": "SAT",
		"NO VENDO": "SATMAM",
		"EN EL DESPACHO": "OFISTE",
		"tus acciones": "hissen",
		"{0} tiene dueño nuevo y lo quiere entero: te ofrece ${1} por la parte que compraste en la asamblea, que te costó ${2}.": "{0} takımının yeni bir sahibi var ve hepsini istiyor: genel kurulda aldığın hisse için ${1} veriyor, sana maliyeti ${2} idi.",
		"HUELGA EN EL VESTUARIO": "SOYUNMA ODASI GREVI",
		"{0} lleva {1} partidos sin pagar a nadie y a ti te debe ${2}. El capitán os reúne antes de entrenar: nadie sale al campo hasta que el club pague. Si os plantáis todos, la directiva rasca la caja y paga ${3}. Si tú entrenas, la huelga se rompe.": "{0} kulübü {1} maçtır kimseye ödeme yapmıyor ve sana ${2} borcu var. Kaptan antrenmandan önce herkesi topluyor: kulüp ödemeden kimse sahaya çıkmayacak. Hepiniz direnirseniz yönetim kasayı karıştırıp ${3} öder. Sen antrenman yaparsan grev bozulur.",
		"ME SUMO": "DAHILIM",
		"SALGO A ENTRENAR": "ANTRENMANA GIT",
		"El {0} entra en concurso y le embargan el estadio: jugará en el campo del {1}": "{0} iflas ediyor ve stadyumuna el konuyor: {1} takımının sahasında oynayacak",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Y el estadio queda embargado: esta temporada jugáis de local en {0}, el campo del {1}.": "Kulüp borcunu ödeyemiyor ve bir hakim yönetime kayyum atıyor. Kış transfer dönemine kadar kimse transfer edilmez ve hiçbir sözleşmeye dokunulmaz, seninki de dahil. Stadyuma el konuldu: bu sezon iç sahada {0} stadyumunda, {1} takımının sahasında oynuyorsunuz.",
		"El {0} sale del concurso: pacta con sus acreedores y vuelve a fichar": "{0} iflas masasından çıkıyor: alacaklılarla anlaştı, yeniden transfer yapabilecek",
		"TE PEDIRÁN GOL Y PASE": "GOL VE ASIST ISTENIR",
		"En el partido: juegas arriba y pegado a tu banda, con más ángulo, contras y balones servidos.": "Maçta: önde ve kanadına yapışık oynarsın; daha dar açılar, kontralar ve ayağına gelen toplar.",
		"EL RESBALÓN": "KAYAN AYAK",
		"ESTAMBUL": "ISTANBUL",
		"LA REMONTADA": "TARIHI DONUŞ",
		"EL 92:48": "92:48",
		"EL CÓRNER RÁPIDO": "HIZLI KORNER",
		"LA FINAL EN SU CASA": "EVDE FINAL",
		"LA NOCHE DE LONDRES": "LONDRA GECESI",
		"EL PORTERO CABECEA": "KALECININ KAFASI",
		"LA FINAL EN MADRID": "MADRID FINALI",
		"SE RESBALÓ": "KAYDI",
		"IBAN 3-0": "3-0 ONDE",
		"NADIE MIRABA": "DALGINLAR",
		"NI UN PENAL": "PENALTI YOK",
		"FUE EL PORTERO": "GOLU KALECI",
		"Juega con uno de los dos clubes contra el otro.": "İki kulüpten biriyle diğerine karşı oyna.",
		"Falta una jornada para el derbi.": "Bir sonraki hafta derbi var.",
		"Faltan {0} jornadas para el derbi.": "Derbiye {0} hafta var.",
		"Falta una jornada para la fecha de selecciones.": "Milli ara bir hafta sonra.",
		"Faltan {0} jornadas para la fecha de selecciones.": "Milli araya {0} hafta var.",
		"Te juegas el ascenso": "Yükselme maçı",
		"Te juegas la salvación": "Kalma maçı",
		"Te juegas el título": "Şampiyonluk maçı",
		"Te espera el derbi": "Derbi seni bekliyor",
		"Derbi ante {0}": "Derbi: {0}",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que bote.": "Topu göğsüne atıyorlar: kontrol et ve sekmeden vole vur.",
		"Stick izquierdo para correr; pulsa {0} para barrerte": "Koşmak için sol analog; kayarak girmek için {0} tuşuna bas",
		"Ponte entre el balón y tu portería para robar, o pulsa {0} para barrerte. Al recuperar, sigue con WASD y ataca.": "Topu kapmak için topla kalen arasına gir ya da kayarak girmek için {0} tuşuna bas. Kazanınca WASD ile devam et ve hücum et.",
		"WASD para correr; pulsa {0} para barrerte": "Koşmak için WASD; kayarak girmek için {0} tuşuna bas",
		"TU TITULAR LLEGÓ A SU VESTUARIO": "SOZUN SOYUNMA ODASINA ULAŞTI",
		"TRES GOLES Y EL MICRO": "UÇ GOL VE MIKROFON",
		"Hat-trick y el balón bajo el brazo. La cadena te para con él todavía en la mano y quiere oírtelo decir en directo.": "Hat-trick yaptın, top koltuğunun altında. Kanal seni top hâlâ elindeyken durduruyor ve bunu canlı yayında senden duymak istiyor.",
		"EL GOL DEL FINAL": "SON DAKIKA GOLU",
		"Tu gol en el último suspiro decidió el partido. La cadena te para con el estadio aún temblando y quiere la frase de la noche.": "Son nefesteki golün maçı belirledi. Kanal, stat hâlâ titrerken seni durduruyor ve gecenin sözünü istiyor.",
		"EL PENAL FALLADO": "KAÇAN PENALTI",
		"Fallaste un penal y la sala de prensa sólo quiere hablar de eso. Hay cámaras, hay micro y una pregunta esperándote.": "Bir penaltı kaçırdın ve basın odası sadece bunu konuşmak istiyor. Kameralar, mikrofon ve seni bekleyen bir soru var.",
		"ASUMIRLO": "USTLEN",
		"EL PRÓXIMO LO METO": "SONRAKI GIRER",
		"PENAL FALLADO": "PENALTI KACTI",
		"Un penal fallado pesa más que tres metidos. Lo que digas ahora es lo que se lee mañana.": "Kaçan bir penaltı, atılan üçten daha ağır basar. Şimdi söylediklerin yarın okunacak olan.",
		"RUEDA DE PRENSA": "BASIN ODASI",
		"· te buscarán": "· seni arayacaklar",
		"Colgaste las botas y volviste. Esa puerta sólo se abre una vez: la próxima despedida es la última.": "Kramponları astın ve geri döndün. O kapı yalnızca bir kez açılır: bir sonraki vedan son olacak.",
		"Se viene contigo.": "Seninle geliyor.",
		"No se viene. Os toca la distancia.": "Gelmiyor. Uzaktan devam edeceksiniz.",
		"¿SE VIENE CONTIGO?": "GELIYOR MU?",
		"El contrato nuevo está encima de la mesa de la cocina, y es en otro país. {0} lo ha leído dos veces sin decir nada. Su vida está aquí.": "Yeni sözleşme mutfak masasının üstünde ve başka bir ülkede. {0} onu iki kez okudu, tek kelime etmeden. Hayatı burada.",
		"PEDIRLE QUE VENGA": "GELMESINI ISTE",
		"QUE SE QUEDE": "KALSIN",
		"LA CLÍNICA": "KLINIK",
		"{0} se ha enterado por la tele antes que por ti. Está en la puerta de la clínica con una bolsa de ropa tuya y cara de no pensar irse.": "{0} bunu senden önce televizyondan öğrendi. Kliniğin kapısında, senin kıyafetlerinle dolu bir çantayla duruyor; gitmeye niyeti yok.",
		"DEJAR QUE TE CUIDE": "IZIN VER",
		"PEDIRLE ESPACIO": "ALAN ISTE",
		"Ser el máximo goleador de las ligas de Europa.": "Avrupa liglerinin en golcüsü ol.",
		"El pase del Mundial": "Dünya Şampiyonası'nın pası",
		"Ser el máximo asistente del Mundial con tu selección.": "Milli takımınla Dünya Şampiyonası'nın asist kralı ol.",
		"Centenario Internacional": "Milli Yüzüncü",
		"Jugar 100 partidos con tu selección.": "Milli takımınla 100 maç oyna.",
		"FOTO OFICIAL": "TAKIM FOTOSU",
		"LA FOTO OFICIAL": "TAKIM FOTOGRAFI",
		"La plantilla de este año ya tiene su foto. Colgará en la sede toda la temporada.": "Bu yılın kadrosunun fotoğrafı çekildi. Bütün sezon kulüp binasında asılı duracak.",
		"FIRMA EL CONTRATO": "SOZLEŞMEYI IMZALA",
		"Tu firma queda guardada: será la de tus autógrafos.": "İmzan kaydedildi: otograflarında o kullanılacak.",
		"RENOVACIÓN DE CONTRATO": "SOZLEŞME YENILEME",
		"CONTRATO DE JUGADOR": "OYUNCU SOZLEŞMESI",
		"FIRMA DEL JUGADOR": "OYUNCU IMZASI",
		"TU CAMISETA A LA GRADA": "FORMAN TRIBUNE",
		"Arrastra hacia atrás y suelta": "Geriye çek ve bırak",
		"Más fuerte": "Daha güçlü",
		"El niño del cartel se lleva tu camiseta.": "Pankartlı çocuk formanı kapıyor.",
		"Iba para el niño, pero se la quedó el de al lado.": "Çocuğa atmıştın ama yanındaki kaptı.",
		"La atrapó el de al lado del niño.": "Çocuğun yanındaki yakaladı.",
		"La atrapó uno del muro.": "Duvardaki biri yakaladı.",
		"Se la llevó la grada de arriba.": "Üst tribün aldı.",
		"Se quedó corta.": "Kısa kaldı.",
		"LA PIZARRA DEL MÍSTER": "HOCANIN TAHTASI",
		"Dibuja tu jugada": "Oyununu çiz",
		"LE GUSTÓ": "BEGENDI",
		"A SU MANERA": "KENDI USULU",
		"El míster deja tu jugada en la pizarra.": "Hoca hamleni tahtada bırakıyor.",
		"El míster borra tus flechas y dibuja las suyas.": "Hoca oklarını silip kendi oklarını çiziyor.",
		"PASEO DE LEYENDAS": "EFSANELER YOLU",
		"TU HUELLA": "IZIN",
		"DEJA TU HUELLA": "IZINI BIRAK",
		"Mantén el dedo en el cemento": "Parmağını çimentoda tut",
		"Mantén {0} en el cemento": "Çimentoda {0} düğmesini basılı tut",
		"Bien honda: ahí se queda para siempre.": "Gayet derin: orada sonsuza dek kalacak.",
		"La plaza ya tiene tu mano.": "Meydan artık elini taşıyor.",
		"Apenas se marca: el cemento ya estaba duro.": "Zor iz bıraktı: çimento çoktan sertleşmişti.",
		"¡JUNTITOS, TODOS MIRANDO A LA CÁMARA!": "SIKIŞIN, HERKES KAMERAYA BAKSIN!",
		"¡A LA CUENTA DE TRES!": "UÇ DEYINCE!",
		"Primera ronda": "1. Tur",
		"Segunda ronda": "2. Tur",
		"Tercera ronda": "3. Tur",
		"Cuarta ronda": "4. Tur",
		"Quinta ronda": "5. Tur",
		"Sexta ronda": "6. Tur",
		"Séptima ronda": "7. Tur",
		"Octava ronda": "8. Tur",
		"Treintaidosavos": "Son 64",
		"32avos": "SON 64",
		"1.ª ronda": "1. Tur",
		"2.ª ronda": "2. Tur",
		"3.ª ronda": "3. Tur",
		"4.ª ronda": "4. Tur",
		"5.ª ronda": "5. Tur",
		"6.ª ronda": "6. Tur",
		"7.ª ronda": "7. Tur",
		"8.ª ronda": "8. Tur",
		"¡FESTEJO DESBLOQUEADO!": "SEVINÇ AÇILDI!",
		"LA OCARINA": "OKARINA",
		"Te pones el gorro verde, te salen orejas de duende y tocas la ocarina. Lo estrenas en tu próximo gol.": "Yeşil şapkayı takarsın, elf kulakların çıkar ve okarina çalarsın. İlk kez bir sonraki golünde.",
		"Se gana en el piano de casa, tocando de oído una canción de la ocarina: te pones el gorro verde, te salen orejas de duende y la tocas. Uno de cada once goles.": "Evdeki piyanoda bir okarina şarkısını kulaktan çalınca kazanılır: yeşil şapkayı takarsın, elf kulakların çıkar ve onu çalarsın. Her on bir golden birinde.",
		"¡SEXTETE!": "ALTI KUPA!",
		"¡SEPTETE!": "YEDI KUPA!",
		"¡OCTETE!": "SEKIZ KUPA!",
		"Esto ya no es una temporada: es la historia del club.": "Bu artık bir sezon değil: kulübün tarihi.",
		"SUS PADRES, EL DOMINGO": "AILESI, PAZAR",
		"Los padres de {0} vienen a comer el domingo, como cada mes. Tu agente te ha cerrado una sesión de fotos a la misma hora.": "{0} kişisinin ailesi her ay olduğu gibi pazar günü yemeğe geliyor. Menajerin aynı saate bir fotoğraf çekimi ayarlamış.",
		"PONER LA MESA": "SOFRAYI KUR",
		"LA SESIÓN DE FOTOS": "FOTOGRAF ÇEKIMI",
		"LAS FIESTAS DE SU PUEBLO": "KOYUNUN ŞENLIGI",
		"{0} quiere llevarte a las fiestas de su pueblo. Medio pueblo sabe ya que vas, y el otro medio lo sabrá en cuanto aparques.": "{0} seni köyünün şenliğine götürmek istiyor. Köyün yarısı geleceğini biliyor, öbür yarısı da araba park eder etmez öğrenecek.",
		"IR AL PUEBLO": "KOYE GIT",
		"ESTE AÑO NO": "BU YIL YOK",
		"SU CUMPLEAÑOS, EN UNA ISLA": "ADADA DOGUM GUNU",
		"{0} celebra su cumpleaños en una isla: avión fletado, cuarenta amigos y tres noches. Tú entrenas el viernes.": "{0} doğum gününü bir adada kutluyor: kiralık uçak, kırk arkadaş, üç gece. Sen cuma günü antrenmandasın.",
		"IR Y VOLVER EN EL DÍA": "AYNI GUN GIDIP DON",
		"LLAMARLA A MEDIANOCHE": "GECE YARISI ARA",
		"LA FOTO DE LAS CINCO": "SABAH BEŞ FOTOGRAFI",
		"Sale una foto de {0} a las cinco de la mañana en una discoteca, la víspera de tu partido. Tú dormías en casa; en las redes nadie lo cree.": "Maçının arifesinde sabah beşte bir gece kulübünde çekilmiş bir fotoğraf çıkıyor: {0}. Sen evde uyuyordun; sosyal medyada kimse inanmıyor.",
		"DEFENDERLA EN PÚBLICO": "HERKESE AÇIK SAVUN",
		"PEDIRLE QUE BAJE EL RITMO": "YAVAŞLAMASINI ISTE",
		"LA MESA DEL PRESIDENTE": "BAŞKANIN MASASI",
		"{0} ha conseguido sentarte en la mesa del presidente en la cena del club. No te lo ha consultado: te ha dicho a qué hora pasa el coche.": "{0} kulüp yemeğinde seni başkanın masasına oturtmayı başardı. Sana danışmadı: arabanın kaçta geleceğini söyledi sadece.",
		"IR Y SONREÍR": "GULUMSE",
		"NO ME MUEVAS LOS HILOS": "IPLERIMI ÇEKME",
		"SU MARCA, TU CARA": "MARKANIN YUZU",
		"{0} lanza su propia línea de ropa y quiere que la presentes tú. Dice que es un negocio de los dos; el contrato lo firma ella.": "{0} kendi giyim markasını çıkarıyor ve tanıtımını senin yapmanı istiyor. İkinizin işi olduğunu söylüyor; sözleşmeyi ise o imzalıyor.",
		"PRESENTARLA": "TANIT",
		"MI CARA NO SE PRESTA": "YUZUM SATILIK DEGIL",
		"EL MENSAJE DE LAS TRES": "SAAT UÇ MESAJI",
		"A las tres de la mañana se ha encendido tu teléfono: una periodista, por un reportaje. {0} ha visto la pantalla y ya no se ha vuelto a dormir.": "Sabah üçte telefonun yandı: bir gazeteci, bir haber için. {0} ekranı gördü ve bir daha uyuyamadı.",
		"ENSEÑARLE EL TELÉFONO": "TELEFONU GOSTER",
		"ES MI TRABAJO": "BU BENIM IŞIM",
		"LA FISIO NUEVA": "YENI FIZYO",
		"El club ha fichado una fisioterapeuta y {0} ya sabe cómo se llama. Pregunta, como quien no quiere la cosa, a qué hora te toca.": "Kulüp bir fizyoterapist transfer etti ve {0} adını şimdiden biliyor. Sıranın kaçta olduğunu sanki hiç umursamıyormuş gibi soruyor.",
		"CAMBIAR DE TURNO": "VARDIYA DEGIŞTIR",
		"ES MI FISIO": "FIZYOM",
		"SU INAUGURACIÓN": "AÇILIŞI",
		"{0} inaugura su primera exposición el sábado, y el sábado juegas en la otra punta del país. No te ha pedido que vayas.": "{0} cumartesi ilk sergisini açıyor, cumartesi de sen ülkenin öbür ucunda oynuyorsun. Gelmeni istemedi.",
		"LLEGAR AUNQUE SEA AL FINAL": "SONA DA OLSA YETIŞ",
		"MANDARLE FLORES": "ÇIÇEK GONDER",
		"TE HA DICHO QUE NO": "HAYIR DEDI",
		"Le pediste a {0} que viniera a la gala del club. Tiene un plan con sus amigas desde hace meses, y te ha dicho que no sin ningún drama.": "{0} kişisinden kulüp galasına gelmesini istedin. Aylardır arkadaşlarıyla bir planı var ve hiç drama çıkarmadan hayır dedi.",
		"IR SOLO Y CONTÁRSELO": "TEK GIT, ANLAT",
		"PEDIRLE QUE LO CAMBIE": "ERTELEMESINI ISTE",
		"MADRINA DE LA PEÑA": "TARAFTAR DERNEGI",
		"La peña del barrio quiere a {0} de madrina en su aniversario. Ella ya ha dicho que sí, y a ti te esperan para firmar camisetas.": "Mahalle taraftar derneği yıl dönümünde onur konuğu istiyor: {0}. O evet dedi bile, seni de forma imzalamaya bekliyorlar.",
		"IR CON ELLA": "ONUNLA GIT",
		"QUE VAYA ELLA": "O GITSIN",
		"TE LO DIJO EN EL COCHE": "ARABADA SOYLEDI",
		"Jugaste mal y {0} te lo ha dicho en el coche, con datos y sin anestesia. Sabe de qué habla: lleva veinte años en la grada.": "Kötü oynadın ve {0} bunu sana arabada, verilerle ve anestezisiz söyledi. Ne dediğini biliyor: yirmi yıldır tribünde.",
		"HOY NO, POR FAVOR": "BUGUN OLMAZ",
		"DIJISTE SU NOMBRE": "ADINI ANDIN",
		"En una entrevista nombraste a {0}, de pasada y con cariño. Desde entonces le escriben desconocidos.": "Bir röportajda {0} kişisinden, geçerken ve sevgiyle söz ettin. O günden beri yabancılar ona yazıyor.",
		"PEDIRLE PERDÓN": "OZUR DILE",
		"LO DIJE CON CARIÑO": "SEVGIYLE DEDIM",
		"UNA VALLA MÁS ALTA": "DAHA YUKSEK ÇIT",
		"{0} quiere una valla alta y cámaras en la entrada de tu casa. Los vecinos, que te saludan cada mañana, no lo van a entender.": "{0} evinin girişine yüksek bir çit ve kameralar istiyor. Her sabah sana selam veren komşular bunu anlamayacak.",
		"PONER LA VALLA": "ÇITI YAPTIR",
		"AQUÍ NO HACE FALTA": "BURADA GEREK YOK",
		"UNA CUENTA DE LOS DOS": "ORTAK HESAP",
		"{0} ha encontrado un banco que os abre una cuenta conjunta con tarjeta de cristal. Dice que así no tiene que pedirte cada cosa.": "{0} ikinize cam kartlı ortak hesap açan bir banka buldu. Böyle olursa her şey için senden istemek zorunda kalmayacakmış.",
		"ABRIRLA": "AÇ",
		"CADA UNO LA SUYA": "HERKESIN KENDISI",
		"EL ESCAPARATE": "VITRIN",
		"Paseabais y {0} se ha parado delante de un escaparate. No ha dicho nada. Al día siguiente ha vuelto a pasar por la misma calle.": "Yürüyordunuz ve {0} bir vitrinin önünde durdu. Hiçbir şey söylemedi. Ertesi gün aynı sokaktan yine geçti.",
		"SEGUIR ANDANDO": "YURUMEYE DEVAM",
		"SU EXAMEN": "SINAVI",
		"{0} tiene el lunes el examen más importante de su carrera. Lleva meses aguantando tus viajes; esta semana sólo te pide la casa en silencio.": "{0} pazartesi kariyerinin en önemli sınavına giriyor. Aylardır seyahatlerine katlanıyor; bu hafta senden yalnızca sessiz bir ev istiyor.",
		"DORMIR EN EL HOTEL DEL CLUB": "KULUP OTELINDE KAL",
		"LA CASA ES DE LOS DOS": "EV IKIMIZIN",
		"LA CENA DE FIN DE TEMPORADA": "SEZON SONU YEMEGI",
		"{0} se ha hecho amiga de medio vestuario, y ahora el capitán quiere hacer la cena de fin de temporada en tu casa.": "{0} soyunma odasının yarısıyla arkadaş oldu ve şimdi kaptan sezon sonu yemeğini senin evinde yapmak istiyor.",
		"HACERLA EN CASA": "EVDE YAP",
		"MEJOR EN UN RESTAURANTE": "RESTORAN DAHA IYI",
		"SU AVIÓN": "UÇAGI",
		"{0} te ofrece su avión para volver del partido de fuera, en vez del autobús del equipo. Llegarías a casa tres horas antes.": "{0} deplasman maçından dönmek için takım otobüsü yerine sana kendi uçağını öneriyor. Eve üç saat erken varırsın.",
		"EL AVIÓN": "UÇAK",
		"EL AUTOBÚS": "OTOBUS",
		"LA CENA CON SU PADRE": "BABASIYLA YEMEK",
		"El padre de {0} te ha invitado a cenar. Tiene tres empresas y una sola pregunta: qué vas a hacer cuando dejes el fútbol.": "{0} kişisinin babası seni yemeğe davet etti. Üç şirketi ve tek bir sorusu var: futbolu bıraktığında ne yapacaksın?",
		"TENGO UN PLAN": "PLANIM VAR",
		"NO LO HE PENSADO": "DUŞUNMEDIM",
		"LA LUNA DE MIEL": "BALAYI",
		"Os casasteis en plena temporada y la luna de miel sigue en un cajón. {0} ha encontrado diez días en tu calendario y ya ha mirado vuelos.": "Sezonun ortasında evlendiniz ve balayı hâlâ bir çekmecede duruyor. {0} takviminde on gün buldu ve uçuşlara bile baktı.",
		"IROS LOS DIEZ DÍAS": "ON GUN GIDIN",
		"EN VERANO, PROMETIDO": "YAZ, SOZ",
		"NAVIDAD, ¿EN QUÉ CASA?": "YILBAŞI, KIMDE?",
		"Tu madre y {0} se tratan con una educación que da frío. Este año hay que elegir dónde se pasa la Navidad, y las dos esperan la misma respuesta.": "Annen ile {0} birbirine insanı üşüten bir nezaketle davranıyor. Bu yıl yılbaşının nerede geçeceğine karar vermek gerek ve ikisi de aynı cevabı bekliyor.",
		"CON SU FAMILIA": "AILESIYLE",
		"CON LA TUYA": "SENINKIYLE",
		"LA MESA DE LA PRIMERA CENA": "ILK YEMEGIN MASASI",
		"Lleváis meses sin salir solos. {0} ha reservado el jueves en el restaurante de vuestra primera cena, sin preguntarte si tenías algo.": "Aylardır baş başa dışarı çıkmadınız. {0} ilk yemeğinizin restoranında perşembe için masa ayırttı, işin var mı diye sormadan.",
		"IR EL JUEVES": "PERŞEMBE GIT",
		"CAMBIARLO DE DÍA": "GUNU DEGIŞTIR",
		"LAS FOTOS DE LA BODA": "DUGUN FOTOGRAFLARI",
		"Una revista ofrece una fortuna por las fotos de vuestra boda, que nunca enseñasteis a nadie. {0} dice que decidas tú.": "Bir dergi, kimseye göstermediğiniz düğün fotoğraflarınız için servet teklif ediyor. {0} kararı senin vermen gerektiğini söylüyor.",
		"VENDERLAS": "SAT",
		"SON NUESTRAS": "BIZIM",
		"¿CUÁNTOS AÑOS MÁS?": "DAHA KAÇ YIL?",
		"{0} te ha preguntado, por primera vez, cuántos años más piensas jugar. No era un reproche: quería saber cuándo empezáis a vivir.": "{0} sana ilk kez daha kaç yıl oynamayı düşündüğünü sordu. Sitem değildi: ne zaman yaşamaya başlayacağınızı bilmek istedi.",
		"LOS QUE AGUANTEN LAS PIERNAS": "BACAKLAR DAYANDIKÇA",
		"COMPRA": "SATIN AL",
		"Empezáis a salir, {0} y tú. Si no es lo tuyo, se deja en RELACIONES y no cuesta nada.": "{0} ile çıkmaya başladınız. Sana göre değilse ILIŞKILER'den bitirirsin, hiçbir bedeli yok.",
		"Va a vibrar tres veces. Guarda el teléfono y escucha lo que te cuenta.": "Üç kez titreyecek. Telefonu kaldır ve sana anlattıklarını dinle.",
		"En la próxima cita te lo preguntará:": "Bir sonraki buluşmada bunu sana soracak:",
		"Lo que te contó en la cena · {0} de {1}": "Yemekte sana anlattıkları · {0} / {1}",
		"Pulsa con la línea dentro de la franja · {0} de {1}": "Çizgi şeridin içindeyken dokun · {0} / {1}",
		"Alguien te pregunta a qué te dedicas. Contesta sin presumir.": "Biri sana ne iş yaptığını soruyor. Hava atmadan cevap ver.",
		"EL ROBOT": "ROBOT",
		"Baile suelto: codos en ángulo recto y la cabeza girando a tirones, como una máquina. Pide sitio a la vista.": "Serbest dans: dirsekler dik açıyla, kafa makine gibi sarsıla sarsıla dönüyor. Görünür bir boşluk ister.",
		"Tienes pareja: meces un bebé invisible en los brazos, para quien te espera en casa.": "Bir partnerin var: kollarında görünmez bir bebeği sallıyorsun, evde seni bekleyen için.",
		"LA LLAMADA": "TELEFON",
		"Hay clubes preguntando por ti: te llevas la mano a la oreja como un teléfono. Que llame tu agente.": "Kulüpler seni soruyor: elini telefon gibi kulağına götürüyorsun. Menajerin arasın.",
		"EL SURF": "SORF",
		"Baile suelto: te tiras de panza y te deslizas por el césped con los brazos abiertos.": "Serbest dans: karnının üstüne atlıyor ve kollarını açarak çimlerde kayıyorsun.",
		"LOS BOLOS": "BOWLING",
		"Baile suelto: zancada baja y lanzas una bola invisible de bolos rasa por el césped.": "Serbest dans: alçak bir adım atıp görünmez bir bowling topunu çimlerin üzerinde yuvarlıyorsun.",
		"EL ABRAZO": "KUCAK",
		"Baile suelto: abres los brazos y le das un abrazo enorme a la grada.": "Serbest dans: kollarını açıp tribüne kocaman sarılıyorsun.",
		"LA CUMBIA": "CUMBIA",
		"Baile suelto: pasito a un lado y al otro, cadera y brazos al ritmo.": "Serbest dans: bir yana bir yana küçük adımlar, kalça ve kollar ritimde.",
		"EL RUGIDO": "KUKREME",
		"Un golazo: te agachas, sacas las garras y ruges como un león.": "Muhteşem bir gol: çömelip pençelerini çıkarıyor ve aslan gibi kükrüyorsun.",
		"EL BEBE": "BEBEK",
		"Tener un amigo que juega en otro tipo de teléfono.": "Başka tür bir telefonda oynayan bir arkadaşın olsun.",
		"Cuatro Goles": "Dört Gol",
		"Partidos de 4 goles o más": "4 veya daha fazla gollü maçlar",
		"DUELO DE CONSOLA": "KONSOL KAPIŞMASI",
		"El portero te reta a penaltis al acabar el entreno y medio vestuario se queda a mirar y a picarse.": "Kaleci antrenmandan sonra seni penaltı düellosuna çağırıyor ve soyunma odasının yarısı izleyip laf atmak için kalıyor.",
		"El comité europeo deja al {0} sin Europa una temporada": "Avrupa komitesi, {0} kulübünü bir sezon Avrupa'dan men etti",
		"El comité europeo investiga el dinero del jeque del {0}": "Avrupa komitesi, {0} kulübünün şeyhinin parasını inceliyor",
		"EUROPA DICTA SENTENCIA": "AVRUPA KARARI",
		"FALLO EUROPEO": "AVRUPA KARARI",
		"EL FALLO EUROPEO": "AVRUPA KARARI",
		"El comité europeo ha investigado los patrocinios del jeque y los da por inflados: el club no jugará en Europa la temporada que viene. En la liga no pierde ni un punto.": "Avrupa komitesi şeyhin sponsorluklarını inceledi ve şişirilmiş buldu: kulüp gelecek sezon Avrupa'da oynamayacak. Ligde tek bir puan bile kaybetmeyecek.",
		"· tienes que marcar": "· gol atmalısın",
		"ASÍ VA EL CHICO DE ORO": "ALTIN GENÇ YARIŞI",
		"El mejor de {0} años o menos, con el mismo baremo que el Jugador del Año.": "{0} yaş ve altının en iyisi, Yılın Oyuncusu ile aynı puanlama.",
		"LA PROMESA DEL AÑO": "YILIN UMUDU",
		"LA PROMESA DEL AÑO · {0}": "YILIN UMUDU · {0}",
		"TU PRIMER CHICO DE ORO": "ILK ALTIN GENÇ ODULUN",
		"TU CHICO DE ORO Nº {0}": "{0}. ALTIN GENÇ ODULUN",
		"LA GALA DEL CHICO DE ORO": "ALTIN GENÇ GALASI",
		"¿QUIÉN ES TU ÍDOLO?": "IDOLUN KIM?",
		"ELEGIR A TU ÍDOLO": "IDOLUNU SEÇ",
		"Primer premio en primera. Y la pregunta que te van a hacer toda la carrera.": "Birinci ligdeki ilk ödülün. Ve kariyerin boyunca sorulacak o soru.",
		"MANTÉN PULSADO PARA ELEGIRLO: NO PODRÁS CAMBIARLO": "SEÇMEK IÇIN BASILI TUT: DEGIŞTIRILEMEZ",
		"LA TERTULIA": "MASA",
		"EL DEBATE": "TARTIŞMA",
		"TE ADORAN": "SEVILIYOR",
		"TE CRITICAN": "ELEŞTIRI",
		"OPINIONES DIVIDIDAS": "GORUSLER BOLUNDU",
		"A FAVOR": "DESTEK",
		"EN CONTRA": "KARŞI",
		"CON DUDAS": "ŞUPHELI",
		"¿ES PARA PRIMERA?": "1. LIGE UYGUN MU?",
		"¿YA ES UN CRACK?": "ARTIK YILDIZ MI?",
		"¿CUMPLE O NO CUMPLE?": "BEKLENTIYE UYAR MI?",
		"En la tele ya hablan de ti como de los buenos.": "Televizyonda artık senden iyilerden biri olarak söz ediyorlar.",
		"En la tele piden más. En el campo se contesta.": "Televizyonda daha fazlasını istiyorlar. Cevap sahada verilir.",
		"En la tele no terminan de decidirse contigo.": "Televizyonda senin hakkında bir türlü karar veremiyorlar.",
		"EL EXJUGADOR": "ESKI OYUNCU",
		"LA PERIODISTA": "GAZETECI",
		"EL CRÍTICO": "ELESTIRMEN",
		"Una media de {0}. Eso en Primera no lo firma cualquiera.": "Ortalama {0}. Birinci ligde bunu herkes yapamaz.",
		"Cada jornada, de lo mejor del campo: {0} de media.": "Her hafta sahadaki en iyilerden: ortalama {0}.",
		"Un {0} de media. Cumple, pero de él se espera más.": "Ortalama {0}. Görevini yapıyor ama ondan daha fazlası bekleniyor.",
		"{0} de nota. Ni para tirar cohetes ni para preocuparse.": "Not {0}. Ne sevinecek ne de endişelenecek bir şey.",
		"Un {0} de media es muy poco para Primera.": "Ortalama {0} birinci lig için çok az.",
		"Con {0} de nota, yo me lo pensaría para el once.": "{0} notla ilk on bire koymayı ben iki kez düşünürdüm.",
		"Goles: {0}. Asistencias: {1}. Está decidiendo partidos.": "Gol: {0}. Asist: {1}. Maçları o belirliyor.",
		"Los números hablan solos. Goles: {0}. Asistencias: {1}.": "Rakamlar kendini anlatıyor. Gol: {0}. Asist: {1}.",
		"Goles: {0}. Asistencias: {1}. Correcto, sin más.": "Gol: {0}. Asist: {1}. İdare eder, o kadar.",
		"Goles: {0}. Asistencias: {1}. Aporta, pero no basta.": "Gol: {0}. Asist: {1}. Katkı sağlıyor ama yetmiyor.",
		"Goles: {0}. Asistencias: {1}. En toda la temporada. Así no.": "Gol: {0}. Asist: {1}. Koca sezonda. Böyle olmaz.",
		"Goles: {0}. Asistencias: {1}. No aparece: hay que exigirle.": "Gol: {0}. Asist: {1}. Ortada yok: ondan daha fazlasını istemek lazım.",
		"{0} de {1} partidos. El técnico no lo saca del once.": "{1} maçın {0} tanesi. Teknik direktör onu ilk on birden çıkarmıyor.",
		"Es fijo: {0} partidos de {1}. Eso es confianza.": "Değişmez: {1} maçın {0} tanesi. Bu güven demek.",
		"{0} partidos de {1}. Todavía no es indiscutible.": "{1} maçın {0} tanesi. Henüz tartışılmaz değil.",
		"Entra y sale: {0} de {1}. Tiene que ganarse el sitio.": "Girip çıkıyor: {1} maçın {0} tanesi. Yerini hak etmesi lazım.",
		"Sólo {0} de {1} partidos. Ni su técnico confía en él.": "{1} maçın yalnızca {0} tanesi. Teknik direktörü bile ona güvenmiyor.",
		"{0} partidos de {1}. Así es imposible que crezca.": "{1} maçın {0} tanesi. Böyle gelişmesi imkânsız.",
		"El equipo va en el puesto {0} y él tiene mucho que ver.": "Takım {0}. sırada ve bunda onun büyük payı var.",
		"Puesto {0} en la tabla. Cuando el equipo gana, todos brillan.": "Tabloda {0}. sıra. Takım kazanınca herkes parlar.",
		"El equipo va en el puesto {0}, en tierra de nadie. Y él, igual.": "Takım {0}. sırada, ortada bir yerde. O da öyle.",
		"Puesto {0}. Una temporada gris para todos.": "{0}. sıra. Herkes için gri bir sezon.",
		"El equipo va en el puesto {0} y él no ayuda a salir de ahí.": "Takım {0}. sırada ve o oradan çıkmaya yardım etmiyor.",
		"Puesto {0} en la tabla. Alguien tiene que dar un paso al frente.": "Tabloda {0}. sıra. Birinin öne çıkması lazım.",
		"MANTÉN PARA SALTAR": "GEÇMEK IÇIN BASILI TUT",
		"TU ÍDOLO": "IDOLUN",
		"A GANARSE EL PUESTO": "YERINI KAZAN",
		"Ahora le toca al banquillo dar la cara.": "Şimdi yedek kulübesinin sahne alma zamanı.",
		"Ahora tiene que demostrar que es imprescindible.": "Şimdi vazgeçilmez olduğunu kanıtlaması gerekiyor.",
		"Apareció cuando nadie lo esperaba. Eso es un crack.": "Kimsenin beklemediği anda çıktı geldi. İşte bu bir yıldız.",
		"BAJA SENSIBLE": "AGIR KAYIP",
		"Buen gol, pero el partido lo jugó a ratos.": "Güzel gol, ama maçta sadece ara ara vardı.",
		"CON ÉL": "ONUNLA",
		"CON ÉL Y SIN ÉL": "ONUNLA VE ONSUZ",
		"Cada partido, su gol. Así se gana una liga.": "Her maçta bir gol. Lig böyle kazanılır.",
		"Con ese penalti se escaparon los puntos.": "O penaltıyla puanlar uçup gitti.",
		"Con o sin ti, el equipo fue igual. Ahora, a marcar la diferencia.": "Sen olsan da olmasan da takım aynıydı. Şimdi fark yaratma zamanı.",
		"Con él, {0} puntos por partido; sin él, {1}.": "Onunla maç başına {0} puan; onsuz {1}.",
		"Convocado, pero desde el banquillo.": "Davet edildi, ama yedek kulübesinden.",
		"Convocado. Ahora a ganarse el once.": "Davet edildi. Şimdi ilk on bir yeri için mücadele zamanı.",
		"Dejó al equipo con diez. Eso no se hace.": "Takımı on kişi bıraktı. Bu yapılmaz.",
		"EL ONCE DE LA TELE": "TV'NIN 11'I",
		"EL ONCE DE LA TEMPORADA": "SEZONUN 11'I",
		"EL PARTE MÉDICO": "SAGLIK RAPORU",
		"EL PENALTI FALLADO": "KACAN PENALTI",
		"El equipo aguanta {0} semanas sin él.": "Takım onsuz {0} hafta idare eder.",
		"El equipo ha vivido muy bien sin él.": "Takım onsuz da gayet iyi idare etti.",
		"El equipo lo ha echado mucho de menos.": "Takım onu çok aradı.",
		"El equipo ni ganó ni perdió sin él.": "Takım onsuz ne kazandı ne kaybetti.",
		"El equipo sumó más sin ti. Toca demostrar en el campo.": "Takım sensiz daha çok puan topladı. Sahada kanıtlama zamanı.",
		"El portero lo adivinó. Mérito suyo.": "Kaleci yönü bildi. Bu onun başarısı.",
		"El seleccionador cuenta contigo de inicio.": "Milli takım hocası seni ilk 11'de düşünüyor.",
		"El seleccionador tiene otros nombres.": "Milli takım hocasının aklında başka isimler var.",
		"Entre los once mejores de la liga. Ahí es nada.": "Ligin en iyi on bir oyuncusu arasında. Hiç fena değil.",
		"Entre los once mejores de la liga. La tele te pone de ejemplo.": "Ligin en iyi on bir oyuncusu arasındasın. Televizyon seni örnek gösteriyor.",
		"Ese gol vale puntos y vale una temporada.": "Bu gol hem puan hem koca bir sezon eder.",
		"Ese penalti no se puede fallar.": "O penaltı kaçırılmaz.",
		"Esta vez no entraste. El once del año que viene se gana desde ya.": "Bu sefer giremedin. Gelecek yılın 11'i şimdiden kazanılır.",
		"Esta vez no estás. La próxima lista se gana con tu club.": "Bu sefer listede yoksun. Bir sonraki liste kulübünle kazanılır.",
		"Estuvo cerca. El año que viene, dentro.": "Çok yaklaştı. Gelecek yıl içeride.",
		"Está dentro, que es lo primero.": "İçeride, asıl önemli olan bu.",
		"Estás en la lista. El once, a ganárselo en los entrenamientos.": "Listedesin. İlk on bir yerini antrenmanlarda kazanacaksın.",
		"Fallar un penalti le pasa a cualquiera.": "Penaltı kaçırmak herkesin başına gelir.",
		"Fuera de la lista. Mensaje claro del seleccionador.": "Listenin dışında. Milli takım hocasından net bir mesaj.",
		"Hay que verla diez veces. No lo tengo claro.": "On kere izlemek lazım. Emin değilim.",
		"IMPRESCINDIBLE": "VAZGEÇILMEZ",
		"Indiscutible en el once de la temporada.": "Sezonun 11'inde tartışmasız.",
		"LA LISTA DE LA SELECCIÓN": "MILLI KADRO",
		"LA MOVIOLA": "TEKRAR",
		"LA RACHA": "SERI",
		"LA ROJA": "KIRMIZI",
		"LA SEQUÍA": "KURAKLIK",
		"La portería se te resiste. Un gol lo cambia todo.": "Kale sana direniyor. Tek bir gol her şeyi değiştirir.",
		"La selección se construye a su alrededor.": "Milli takım onun etrafında kuruluyor.",
		"La tele lo repite una y otra vez. Al siguiente, se marca.": "Televizyon tekrar tekrar gösteriyor. Bir sonrakinde gol var.",
		"La tele no habla de otra cosa: estás en racha.": "Televizyon başka bir şeyden bahsetmiyor: seri yakaladın.",
		"Le faltó regularidad para entrar.": "İçeri girmek için istikrar eksikti.",
		"Le toca ganarse el puesto otra vez.": "Yerini yeniden kazanması gerekiyor.",
		"Lo decidió él, sí. Ochenta minutos discretos.": "Maçı o bitirdi, evet. Seksen dakika sönüktü.",
		"Lo ha merecido, partido a partido.": "Bunu hak etti, maç maç.",
		"MAZAZO": "DARBE",
		"Marca en {0} partidos seguidos. Está en racha.": "Üst üste {0} maçta gol attı. Seri yakaladı.",
		"Necesita un gol, aunque sea de rebote.": "Bir gole ihtiyacı var, dönen top olsa bile.",
		"Ni rastro de él en el once. Temporada floja.": "11'de izi bile yok. Zayıf bir sezon.",
		"No hay defensa que lo pare ahora mismo.": "Şu an hiçbir savunma onu durduramıyor.",
		"Otros lo hicieron mejor en su puesto.": "Başkaları onun mevkiinde daha iyiydi.",
		"PARTE MÉDICO": "SAGLIK",
		"PUNTOS POR PARTIDO": "MAÇ BAŞI PUAN",
		"Para mí, la roja fue muy rigurosa.": "Bana göre kırmızı kart çok sertti.",
		"Partidos que se pierde: {1}. Se notará.": "Kaçıracağı maç: {1}. Hissedilecek.",
		"Partidos que se pierde: {1}. Y de los gordos.": "Kaçıracağı maç: {1}. Hem de büyükleri.",
		"Poca cosa. En nada vuelves a estar disponible.": "Önemli değil. Çok yakında yine hazırsın.",
		"SE PIERDE": "KACIRIR",
		"SEMANAS": "HAFTA",
		"SIN PARTIDOS A LA VISTA": "MAC YOK",
		"SIN ÉL": "ONSUZ",
		"Se le ha cerrado la portería.": "Kale ona kapandı.",
		"Se queda fuera, pero la puerta sigue abierta.": "Dışarıda kaldı, ama kapı hâlâ açık.",
		"Sin marcar en {0} partidos. Un delantero vive del gol.": "{0} maçtır gol yok. Forvet golle yaşar.",
		"Sin ti el equipo se resintió. Vuelve su referente.": "Sensiz takım zorlandı. Lideri geri döndü.",
		"Sin él, el equipo se queda cojo.": "Onsuz takım topallıyor.",
		"Sin él, el equipo sumó más: {1} por partido.": "Onsuz takım daha çok topladı: maç başına {1}.",
		"Sin él, {1} puntos por partido. Con él, {0}.": "Onsuz maç başına {1} puan. Onunla {0}.",
		"Su temporada no le alcanza para la selección.": "Sezonu milli takım için yetmiyor.",
		"TE QUEDAS FUERA": "DISARIDASIN",
		"Te toca mirar desde la grada unas semanas.": "Birkaç hafta tribünden izleyeceksin.",
		"Titular con su país. Se lo ha ganado.": "Milli takımda ilk 11'de. Bunu hak etti.",
		"Tu gol del final es la jugada de la semana.": "Son dakika golün haftanın pozisyonu.",
		"Tu roja es la polémica de la semana.": "Kırmızı kartın haftanın tartışması.",
		"UN SUSTO": "KORKU",
		"Un susto y poco más: {0} semanas.": "Bir korku, o kadar: {0} hafta.",
		"Una roja infantil. La paga el equipo.": "Çocukça bir kırmızı kart. Bedelini takım ödüyor.",
		"Va con la selección, pero no es titular.": "Milli takımla gidiyor, ama ilk on birde değil.",
		"Va para largo. El equipo tendrá que apañarse sin ti.": "Uzun sürecek. Takım sensiz idare etmek zorunda.",
		"Vuelve el que marca la diferencia.": "Fark yaratan oyuncu geri döndü.",
		"Vuelve enseguida. Nada que lamentar.": "Hemen dönüyor. Üzülecek bir şey yok.",
		"Ya es fijo para el seleccionador.": "Artık milli takım hocası için vazgeçilmez.",
		"{0} PARTIDOS MARCANDO": "{0} MAC GOLLU",
		"{0} PARTIDOS SIN MARCAR": "{0} MAC GOLSUZ",
		"{0} semanas fuera, justo cuando iba lanzado.": "{0} hafta yok, tam da formdayken.",
		"{0} semanas fuera. Mazazo para el club.": "{0} hafta yok. Kulüp için büyük darbe.",
		"¿LO HAN ECHADO DE MENOS?": "ONU ARADILAR MI?",
		"ÚLTIMOS PARTIDOS": "SON MACLAR",
		"Hay respuestas que te siguen toda la carrera.": "Bazı cevaplar seni kariyerin boyunca takip eder.",
		"HACE {0} TEMPORADAS": "{0} SEZON ONCE",
		"MI ÍDOLO ES {0}": "IDOLUM {0}",
		"LA PRENSA RECUPERA AQUEL VÍDEO": "BASIN O VIDEOYU BULDU",
		"PREMIOS DEL MES DESDE ENTONCES": "O GUNDEN BERI AYIN ODULU",
		"¿SIGUE SIENDO TU ÍDOLO?": "HALA IDOLUN MU?",
		"La sala pone el vídeo de hace {0} temporadas. Lo que digas hoy sale mañana al lado.": "Salonda {0} sezon önceki video oynatılıyor. Bugün söylediğin yarın onun yanında çıkacak.",
		"SIEMPRE LO SERÁ": "HEP OLACAK",
		"YA JUEGO MI PROPIA HISTORIA": "ARTIK KENDI HIKAYEM VAR",
		"EL FAN DE SIEMPRE": "EBEDI HAYRAN",
		"DE MANOS DE TU IDOLO": "IDOLUNUN ELINDEN",
		"Nunca lo gané. Verlo en tus manos es casi lo mismo.": "Ben hiç kazanamadım. Onu senin ellerinde görmek neredeyse aynı şey.",
		"Yo también lo levanté una vez. Ahora es tuyo.": "Ben de bir kez kaldırdım. Artık senin.",
		"Lo levanté {0} veces. Ninguna pesó como ésta.": "Onu {0} kez kaldırdım. Hiçbiri bunun kadar ağır gelmedi.",
		"Te lo entregó {0}, el ídolo del que hablaste aquella noche.": "Onu sana {0} verdi; o gece sözünü ettiğin idolün.",
		"Te Elijo a Ti": "Seni Seçtim",
		"Ponerle a una mascota el nombre del ratón eléctrico más famoso.": "Bir evcil hayvana en ünlü elektrikli farenin adını ver.",
		"Hay un nombre amarillo y eléctrico que tus mascotas llevan esperando.": "Evcil hayvanlarının beklediği sarı ve elektrikli bir isim var.",
		"LO CONOCES": "TANIŞMA",
		"TU IDOLO VINO A VERTE": "IDOLUN SENI GORMEYE GELDI",
		"LA PRIMERA VEZ EN PERSONA": "ILK KEZ YUZ YUZE",
		"la final": "final",
		"el derbi": "derbi",
		"temporadas después": "sezon sonra",
		"Lo dijiste hace {0} temporadas en una rueda de prensa. Hoy bajó a buscarte.": "Bunu {0} sezon önce bir basın toplantısında söyledin. Bugün seni bulmak için aşağı indi.",
		"Te vi levantarla. Yo también temblaba la primera vez.": "Kaldırışını gördüm. İlk seferinde ben de titriyordum.",
		"Hoy duele. Guárdalo: la próxima vez te toca a ti.": "Bugün acıtıyor. Bunu sakla: bir dahaki sefere sıra sende.",
		"Esta casa también fue la mía. Gracias por cuidarla.": "Burası benim de evimdi. Ona iyi baktığın için teşekkürler.",
		"Esta grada no olvida, y yo tampoco. Sigue.": "Bu tribün unutmaz, ben de unutmam. Devam et.",
		"PINGÜINO": "PENGUEN",
		"Un pingüino que anda a pasitos por la casa. Dicen que trae suerte en el próximo gol.": "Evin içinde minik adımlarla yürüyen bir penguen. Bir sonraki golde şans getirdiği söylenir.",
		"EL PINGUINAZO": "PENGUENATOR",
		"Se gana comprando el pingüino de casa: en tu siguiente gol tu equipo se vuelve pingüinos y los rivales, dinosaurios. Sale una sola vez.": "Evin penguenini satın alarak kazanılır: bir sonraki golünde takımın penguenlere, rakipler dinozorlara dönüşür. Sadece bir kez çıkar.",
		"Tu equipo se vuelve pingüinos y los rivales, dinosaurios. Lo estrenas en tu próximo gol, y sólo esa vez.": "Takımın penguenlere, rakipler dinozorlara dönüşür. Bir sonraki golünde ilk kez kullanırsın, ve sadece o bir kez.",
		"SU FESTEJO": "ONUN KUTLAMASI",
		"TU IDOLO TE ESPERABA": "IDOLUN SENI BEKLIYORDU",
		"NUEVO FESTEJO": "YENI KUTLAMA",
		"La levanté con esta misma camiseta. Ahora mi festejo es tuyo.": "Onu bu formayla kaldırdım. Artık kutlamam senin.",
		"Me has ganado la final. Esto ya no es mío.": "Finalde beni yendin. Bu artık benim değil.",
		"Se lo ganaste en una final, a él.": "Onu ondan aldın, bir finalde.",
		"Ganaste una final con su camiseta.": "Onun formasıyla bir final kazandın.",
		"Lo estrenas en tu próximo gol.": "İlk kez bir sonraki golünde yapacaksın.",
		"SU ULTIMO CONSEJO": "SON TAVSIYESI",
		"TE INVITO A CENAR": "AKŞAM YEMEGI BENDEN",
		"LA CENA": "AKŞAM YEMEGI",
		"La felicidad está en cada día.": "Mutluluk her günün içinde.",
		"Hace {0} años dijiste en una rueda de prensa que yo era tu ídolo.": "{0} yıl önce bir basın toplantısında idolünün ben olduğumu söylemiştin.",
		"Y lo sigues siendo.": "Hâlâ öylesin.",
		"Cuando me retiré pensé que echaría de menos las finales.": "Emekli olduğumda finalleri özleyeceğimi sanmıştım.",
		"Pero echo de menos los martes. El autobús, el café malo, las risas del vestuario.": "Ama salıları özlüyorum. Otobüsü, kötü kahveyi, soyunma odasındaki kahkahaları.",
		"Me he pasado la vida esperando el próximo gran día. Y la felicidad estaba en todos los demás.": "Hayatım bir sonraki büyük günü beklemekle geçti. Oysa mutluluk diğer bütün günlerdeydi.",
		"¿Y ahora qué hago?": "Peki şimdi ne yapacağım?",
		"Lo mismo que en el campo: un día cada vez. En el fútbol y en la vida, la felicidad está en cada día.": "Sahadaki gibi: her seferinde bir gün. Futbolda da hayatta da mutluluk her günün içinde.",
		"Por cada día.": "Her güne.",
		"Yo todavía juego, y ya sé lo que voy a echar de menos.": "Hâlâ oynuyorum ve neyi özleyeceğimi şimdiden biliyorum.",
		"No serán las finales. Serán los martes: el autobús, el café malo, las risas del vestuario.": "Finaller olmayacak. Salılar olacak: otobüs, kötü kahve, soyunma odasındaki kahkahalar.",
		"TE ELIJO A TI": "SENI SEÇTIM",
		"Se gana poniéndole a una mascota el nombre del ratón eléctrico: te calas la gorra roja y lanzas la bola. Lo estrena tu siguiente gol; luego, uno de cada trece.": "Bir evcil hayvana elektrikli farenin adını verince kazanılır: kırmızı şapkayı takar ve topu fırlatırsın. İlk kez bir sonraki golünde; sonra on üç golde bir.",
		"El club lo guardaba para alguien como tú.": "Kulüp onu senin gibi biri için saklıyordu.",
		"{0} te lo cede.": "{0} onu sana bırakıyor.",
		"¿LLEVAS SU {0}?": "ONUN {0} NUMARASI?",
		"LLEVARLO": "GIY",
		"Cada domingo te compararán con él.": "Her pazar seni onunla kıyaslayacaklar.",
		"Tu número, tu historia.": "Senin numaran, senin hikâyen.",
		"Ya llevas el {0}.": "Artık {0} numarayı giyiyorsun.",
		"La grada compara tu {0} con el de {1}": "Tribün senin {0} numaranı {1} ile kıyaslıyor",
		"Llevas el {0} a su altura": "{0} numarayı onun gibi taşıyorsun",
		"su dorsal": "onun numarası",
		"títulos aquí": "buradaki kupalar",
		"LA ENTREVISTA AL REVES": "TERS ROPORTAJ",
		"¿Quién es tu ídolo?": "İdolün kim?",
		"{0}. Me firmó la playera cuando tenía {1} años. Todavía la tengo.": "{0}. {1} yaşımdayken formamı imzaladı. Hâlâ bende.",
		"Y ahora me pasa el balón todos los fines de semana.": "Şimdi de her hafta sonu bana pas veriyor.",
		"Hoy lo tuve enfrente. Sigue siendo él.": "Bugün karşımdaydı. Hâlâ benim idolüm.",
		"SU ÍDOLO ERES TÚ": "ONUN IDOLU SENSIN",
		"TEMPORADAS DESDE QUE DIJISTE EL TUYO": "IDOLUNU SOYLEYELI GECEN SEZON",
		"Hace {0} temporadas dijiste {1}. Hoy el nombre que dicen es el tuyo.": "{0} sezon önce {1} demiştin. Bugün söylenen isim senin.",
		"CONTRA TU ÍDOLO": "IDOLUNE KARŞI",
		"CONTRA TU IDOLO": "IDOLUNE KARŞI",
		"LO ELEGISTE HACE {0} TEMPORADAS": "ONU {0} SEZON ONCE SEÇTIN",
		"ranking": "sıralama",
		"Alguien le enseñó aquella rueda de prensa. Te reconoce.": "Biri ona o basın toplantısını göstermiş. Seni tanıyor.",
		"Hoy no eres su aficionado. Eres su rival.": "Bugün onun hayranı değilsin. Rakibisin.",
		"Noventa minutos sin pedirle un autógrafo.": "Doksan dakika boyunca ondan imza istemeden.",
		"LA CAMISETA DE TU ÍDOLO": "IDOLUNUN FORMASI",
		"Esta no se cambia por nada.": "Bunu hiçbir şeye değişmezsin.",
		"FICHA CONTIGO": "SENINLE IMZALIYOR",
		"JUGARÁS CON ÉL": "ONUNLA OYNAYACAKSIN",
		"años después": "yıl sonra",
		"Hace {0} años dijiste su nombre delante de todos.": "{0} yıl önce herkesin önünde onun adını söyledin.",
		"Hace un año dijiste su nombre delante de todos.": "Bir yıl önce herkesin önünde onun adını söyledin.",
		"Llegas nuevo, y el primero que viene a darte la bienvenida es él.": "Yeni geliyorsun ve seni ilk karşılayan o.",
		"El club lo ha fichado. Ahora entrenas cada día con el que veías por la tele.": "Kulüp onu transfer etti. Artık televizyonda izlediğin adamla her gün antrenman yapıyorsun.",
		"Lo pediste tú y el club lo trajo. Ahora te toca estar a su altura.": "Sen istedin, kulüp getirdi. Şimdi onun seviyesinde olma sırası sende.",
		"ES TU ÍDOLO": "IDOLUN",
		"EN EL PALCO": "LOCADA",
		"TU ÍDOLO, EN EL PALCO": "IDOLUN LOCADA",
		"SE LEVANTÓ POR TI": "SENIN IÇIN AYAGA KALKTI",
		"el partido": "maç",
		"Dos en mi casa. Esta grada ya tiene otro nombre que cantar.": "Benim evimde iki gol. Bu tribünün artık söyleyecek yeni bir adı var.",
		"Un gol en el derbi, en esta casa. Eso no se olvida nunca.": "Derbide, bu evde bir gol. Bu asla unutulmaz.",
		"Lo dijiste hace {0} temporadas. Hoy, en la que fue su casa, el palco entero miró cómo te aplaudía.": "Bunu {0} sezon önce söyledin. Bugün, bir zamanlar onun evi olan yerde, bütün loca onun seni alkışlamasını izledi.",
		"SE MIDE CON SU ÍDOLO": "IDOLUYLE KARŞI KARŞIYA",
		"EL DISCIPULO YA ES MEJOR": "OGRENCI ARTIK DAHA IYI",
		"EL DISCÍPULO YA ES MEJOR": "OGRENCI ARTIK DAHA IYI",
		"EDICIÓN ESPECIAL": "OZEL YAYIN",
		"EL ALUMNO SUPERA AL MAESTRO": "OGRENCI USTAYI GEÇTI",
		"ÚLTIMA HORA: {0} SUPERA A {1} EN EL RANKING": "SON DAKIKA: {0}, SIRALAMADA {1} ONUNE GEÇTI",
		"TU RANKING": "SENIN SIRAN",
		"SU RANKING": "ONUN SIRASI",
		"tu ranking": "senin sıran",
		"su ranking": "onun sırası",
		"El día que lo nombraste te sacaba {0} puestos.": "Onun adını verdiğin gün senden {0} sıra öndeydi.",
		"El día que lo nombraste lo mirabas desde muy abajo.": "Onun adını verdiğin gün ona çok aşağıdan bakıyordun.",
		"Hace {0} temporadas dijo en una rueda de prensa que su ídolo era {1}. Hoy el ranking los pone al revés.": "{0} sezon önce bir basın toplantısında idolünün {1} olduğunu söylemişti. Bugün sıralama onları tersine diziyor.",
		"Un número no es una carrera. {1} ya tiene la suya; a {2} todavía le falta escribirla.": "Bir sayı bir kariyer değildir. {1} kendi kariyerini çoktan yazdı; {2} ise daha yazmak zorunda.",
		"Hemos hablado con {1} esta mañana. Dice que alguien tenía que pasarle algún día, y que se alegra de que haya sido {2}.": "Bu sabah {1} ile konuştuk. Bir gün birinin onu geçeceğini, bunun {2} olmasına sevindiğini söylüyor.",
		"SU DESPEDIDA": "ONUN VEDASI",
		"Compartisteis vestuario. Hoy le aplaudes desde la grada.": "Aynı soyunma odasını paylaştınız. Bugün onu tribünden alkışlıyorsun.",
		"Te tocó enfrentarte a él. Hoy te tocó despedirlo.": "Ona karşı oynaman gerekti. Bugün onu uğurlamak sana düştü.",
		"Él tampoco lo olvidó: tu nombre estaba en su lista de invitados.": "O da unutmadı: adın davetli listesindeydi.",
		"En el borde del área": "Ceza sahası çizgisinde",
		"Abierto al segundo palo": "Arka direkte boşta",
		"VUELTA DE HONOR": "ONUR TURU",
		"LA VUELTA DE HONOR": "ONUR TURU",
		"LA ÚLTIMA DE {0}": "SON TUR: {0}",
		"{0} cuelga las botas este verano. La última vuelta fue suya.": "{0} bu yaz futbolu bırakıyor. Son tur ona aitti.",
		"Más Premios al Mejor en una carrera": "Bir kariyerde en çok Yılın Oyuncusu ödülü",
		"Tus amigos te esperan para una noche de videojuegos. El técnico ofrece una sesión extra de vídeo y tiros a puerta. No llegas a las dos.": "Arkadaşların oyun gecesi için seni bekliyor. Hoca ekstra bir video ve şut antrenmanı öneriyor. İkisine birden yetişemezsin.",
		"CONSOLA CON AMIGOS": "ARKADAŞLARLA KONSOL",
		"Caños": "Bacak arası",
		"Año redondo del club: el técnico cuenta más contigo": "Kulüp için harika bir yıl: teknik direktör sana daha çok güveniyor",
		"Año para olvidar: el club escucharía ofertas por ti": "Unutulacak bir yıl: kulüp senin için teklifleri dinlerdi",
		"DIRECTIVA": "YONETIM",
		"El {0} se ilusiona: la directiva pide acabar {1}": "{0} umutlendi: yönetim {1} bitirmeyi istiyor",
		"El {0} rebaja la meta: ahora le basta acabar {1}": "{0} hedefi düşürdü: artık {1} bitirmek yeterli",
		"El {0} cae en {1} antes de lo que pedía la directiva": "{0}, yönetimin istediğinden önce {1} yolunda elendi",
		"Cuadrar las cuentas": "Hesapları dengelemek",
		"Salir del rojo del fair play": "Fair play kırmızısından çıkmak",
		"CAJA SANA": "KASA IYI",
		"CUENTAS": "HESAP",
		"¡Que alguien le pite!": "Biri Düdük Çalsın!",
		"Un recogepelotas de casa te tira el balón detrás de la valla para hacer tiempo.": "Ev sahibi top toplayıcı çocuk, zaman geçirmek için topu reklam panosunun arkasına atıyor.",
		"Balón largo": "Uzun top",
		"Te cuelgan un balón largo: pica cuando el aro se cierre para bajarlo. Si te rebota, pierdes la jugada.": "Sana uzun top atılıyor: halka kapandığında dokun ve topu indir. Topu sekmeye bırakırsan pozisyonu kaybedersin.",
		"ESA NOCHE": "O GECE",
		"EN CASA DE UN COLEGA": "BIR ARKADAŞTA",
		"¡LO PUSE DE CAPITÁN!": "KAPTAN YAPTIM!",
		"¡Y YO LO TENÍA EN EL BANQUILLO!": "BENSE YEDEKTE TUTTUM!",
		"EL CAPITÁN DEL FANTASY": "FANTEZI KAPTANI",
		"FANTASY": "FANTEZI",
		"LOS DEL SOFÁ": "KANEPECILER",
		"{0} goles tuyos y un colega que no se calla: te tenía de capitán.": "{0} golün ve susmayan bir arkadaş: seni kaptan yapmıştı.",
		"MÁXIMO": "EN YUKSEK",
		"TU CAPITÁN SUMA {0} PTS": "KAPTANIN {0} PUAN TOPLADI",
		"FIRMADA": "IMZALI",
		"CON BARRO": "ÇAMURLU",
		"SU ÚLTIMA TEMPORADA": "SON SEZONU",
		"PROMESA CUMPLIDA": "VAADINI TUTTU",
		"El mejor de su equipo te buscó a ti.": "Takımının en iyisi seni buldu.",
		"Te la firmó antes de dártela.": "Sana vermeden önce imzaladı.",
		"Con el barro de esta tarde todavía encima.": "Bu akşamın çamuru hâlâ üstünde.",
		"Se retira este verano. Es de las últimas que vestirá.": "Bu yaz futbolu bırakıyor. Giydiği son formalardan biri.",
		"TÚ: {0} DE MEDIA": "SEN: {0} ORTALAMA",
		"PRIMAS": "PRIM",
		"TU CONTRATO PAGA": "SOZLEŞME ODER",
		"ESTA TEMPORADA": "BU SEZON",
		"FICHA": "MAAŞ",
		"CADA PARTIDO": "HER MAÇ",
		"COBRADO": "ALINAN",
		"FIRMA": "IMZA",
		"PACTADA": "ANLAŞMA",
		"BASE": "BAZ",
		"MEJOR DEL CLUB": "KULUP YILDIZI",
		"Primas por goles": "Gol primleri",
		"Lo que llevas cobrado en primas esta temporada.": "Bu sezon prim olarak şimdiye kadar aldığın tutar.",
		"Se cobra al cierre de la temporada si cumples el objetivo.": "Hedefe ulaşırsan sezon sonunda ödenir.",
		"Se cobra al cierre de la temporada si el club cumple lo que pide.": "Kulüp istediğini yaparsa sezon sonunda ödenir.",
		"Se cobra al cierre de la temporada si el club gana el título.": "Kulüp şampiyon olursa sezon sonunda ödenir.",
		"Se cobra en cuanto ganas el premio.": "Ödülü kazandığın anda ödenir.",
		"Se cobra en el partido, por cada gol que marques.": "Maçta, attığın her gol için ödenir.",
		"Se cobra en el partido, por cada asistencia que des.": "Maçta, verdiğin her asist için ödenir.",
		"TU BOMBO": "SEÇTIKLERIN",
		"SU MOMENTO": "KENDI ANI",
		"DE VISITA": "DEPLASMAN",
		"EN TU BOMBO": "SEÇILDI",
		"AL BOMBO": "SEÇ",
		"Elige con la estrella cuáles salen al marcar. Lo nuevo sigue saliendo.": "Gol atınca hangilerinin çıkacağını yıldızla seç. Yeniler çıkmaya devam eder.",
		"{0}, jugador del partido. Hoy no hay más preguntas.": "{0}, maçın oyuncusu. Bugün başka soru yok.",
		"Qué partido, {0}. Hoy la cena la pagas tú.": "Ne maçtı ama {0}. Bu akşam yemekler senden.",
		"¡Hoy {0} lo ha bordado! Que no se vaya nunca.": "{0} bugün döktürdü! Asla gitmesin.",
		"{0} se ve en lo más alto. Su frase ya es la portada de la semana.": "{0} kendini zirvede görüyor. Sözü şimdiden haftanın manşeti.",
		"Mucho hablar, {0}. En el campo nos vemos.": "Çok konuşuyorsun {0}. Sahada görüşürüz.",
		"{0} contesta a la crítica. Ahora le toca demostrarlo en el campo.": "{0} eleştirilere cevap verdi. Şimdi sahada kanıtlaması gerek.",
		"¡Así se contesta, {0}! Ahora, a callar bocas.": "İşte böyle cevap verilir {0}! Şimdi sustur onları.",
		"Lo dijo y lo cumplió. {0} es de los nuestros.": "Söyledi ve yaptı. {0} bizden biri.",
		"Palabra de {0}. Así da gusto.": "{0} sözünü tuttu. İşte böyle.",
		"¿Y la bravata, {0}? Seguimos esperando.": "Hani o iddia {0}? Hâlâ bekliyoruz.",
		"La frase de {0} le salió cara.": "{0} o sözün bedelini ağır ödedi.",
		"Me firmó la camiseta {0}. Un crack también fuera del campo.": "{0} formamı imzaladı. Saha dışında da yıldız.",
		"Soy del otro equipo, pero {0} me firmó la camiseta. Respeto.": "Rakip takımı tutuyorum ama {0} formamı imzaladı. Saygı.",
		"Una hora esperando y {0} pasó de largo.": "Bir saat bekledim, {0} yüzüme bakmadan geçti.",
		"¡Me ha caído la camiseta de {0}! No me la quito en un año.": "{0} formasını bana fırlattı! Bir yıl üstümden çıkmaz.",
		"El balonazo de {0} al móvil lleva todo el día dando vueltas.": "Telefonu uçuran şut bütün gün dönüyor: imza {0}.",
		"Lo de {0} ya es viral. Así se mueven unas redes.": "{0} olayı viral oldu bile. Sosyal medya böyle hareketlenir.",
		"Ese festejo de {0} no se olvida. Te esperamos en la vuelta.": "{0}, o sevinci unutmayacağız. Rövanşta bekliyoruz.",
		"Polémica por el festejo de {0}: el comité ya lo mira.": "{0} sevinci olay oldu: disiplin kurulu inceliyor.",
		"Roja para {0}, y su equipo con uno menos.": "{0} kırmızı kart gördü, takımı on kişi kaldı.",
		"A la ducha temprano, {0}.": "Erkenden duşa, {0}.",
		"Ánimo, {0}. El vestuario te espera.": "Geçmiş olsun {0}. Soyunma odası seni bekliyor.",
		"Recupérate pronto, {0}. Te necesitamos.": "Çabuk iyileş {0}. Sana ihtiyacımız var.",
		"Bienvenido a {1}, {0}. Aquí se suda la camiseta.": "Hoş geldin {0}. {1} formasının hakkını burada vereceksin.",
		"Es oficial: {0} ya es jugador de {1}.": "Resmi: {0} artık {1} oyuncusu.",
		"Partido para olvidar de {0}. ¿Dónde estuvo?": "{0} için unutulacak bir maç. Neredeydi?",
		"{0} calla bocas: después del zasca, partidazo.": "{0} herkesi susturdu: o ayardan sonra harika bir maç.",
		"¡Zasca y partidazo! {0} tenía razón.": "Ayar ve harika maç! {0} haklıymış.",
		"Tanto zasca para esto: {0}, otra vez gris.": "O kadar ayar bunun için miydi: {0} yine silikti.",
		"Mucho móvil y poco fútbol, {0}.": "Telefon çok, futbol az {0}.",
		"Esto es cosa de todos. Orgulloso de este vestuario.": "Bu hepimizin işi. Bu soyunma odasıyla gurur duyuyorum.",
		"Trabajo, trabajo y más trabajo. Y esto sólo acaba de empezar.": "Çalışmak, çalışmak, daha çok çalışmak. Ve bu daha başlangıç.",
		"Esto es para vosotros. Sin vuestra voz no somos nada.": "Bu sizin için. Sizin sesiniz olmadan biz hiçbir şeyiz.",
		"¡Grande, {0}! Juntos hasta el final.": "Helal {0}! Sonuna kadar birlikte.",
		"Así se habla. Equipo.": "İşte böyle konuşulur. Takım.",
		"{0} reparte el mérito. Gesto de capitán.": "{0} başarıyı paylaşıyor. Kaptan gibi bir hareket.",
		"¡Ese es mi jugador!": "İşte benim oyuncum!",
		"Menos postureo, {0}.": "Biraz daha az poz, {0}.",
		"El fútbol es de once, {0}.": "Futbol on bir kişiyle oynanır {0}.",
		"¡Te queremos, {0}!": "Seni seviyoruz {0}!",
		"La grada es nuestro jugador número doce.": "Tribün bizim on ikinci oyuncumuz.",
		"{0} se gana a la grada otra vez.": "{0} tribünleri yine kazandı.",
		"Foto lista para publicar tras el partido. Lo que subas lo verá todo el mundo, y cada mensaje tiene su público.": "Maçtan sonra paylaşmaya hazır bir fotoğraf. Ne paylaşırsan herkes görecek ve her mesajın bir kitlesi var.",
		"FOTO CON EL VESTUARIO": "TAKIMLA FOTOGRAF",
		"TU MOMENTO": "SENIN ANIN",
		"PARA LA GRADA": "TARAFTAR IÇIN",
		"TE CRITICAN EN REDES": "SENI ELEŞTIRIYORLAR",
		"Partido gris y el hashtag ya corre. Te etiquetan en cada crítica y el móvil no para de vibrar. ¿Contestas?": "Silik bir maç ve hashtag şimdiden yayılıyor. Her eleştiride etiketleniyorsun, telefonun titremekten durmuyor. Cevap verecek misin?",
		"IGNORAR": "BOŞVER",
		"CON CLASE": "ŞIK CEVAP",
		"ZASCA": "AYAR",
		"TU ZASCA CORRE POR LAS REDES": "AYARIN VIRAL OLDU",
		"Verdugo de Suecia": "İsveç'in Belası",
		"Verdugo de Rumanía": "Romanya'nın Belası",
		"Vencer a todos los clubes de Suecia (las tres divisiones).": "İsveç'teki tüm kulüpleri yen (üç ligin hepsi).",
		"Vencer a todos los clubes de Rumanía (las tres divisiones).": "Romanya'daki tüm kulüpleri yen (üç ligin hepsi).",
		"LLEGADAS": "VARIŞ",
		"ACABA DE ATERRIZAR": "AZ ONCE INDI",
		"LA LLEGADA": "VARIŞ",
		"te esperaban en el aeropuerto": "seni havalimanında bekliyordu",
		"periodistas": "gazeteci",
		"LA LLEGADA AL AEROPUERTO": "HAVALIMANI KARŞILAMASI",
		"Media ciudad vino a verte bajar del avión.": "Şehrin yarısı uçaktan inişini görmeye geldi.",
		"En Primera, hasta el aeropuerto tiene micrófonos.": "Birinci ligde havalimanında bile mikrofonlar var.",
		"En Segunda no se ve esto todos los días.": "İkinci ligde bunu her gün görmezsin.",
		"Pocos, pero ya se saben tu nombre.": "Az kişi var ama adını şimdiden biliyorlar.",
		"¿CÓMO LO CELEBRAS?": "NASIL KUTLARSIN?",
		"SI NO TOCAS, A TU MANERA": "DOKUNMA: KENDI TARZIN",
		"PROVOCAR": "KIŞKIRT",
		"PERDÓN": "OZUR",
		"A LOS TUYOS": "TARAFTARINA",
		"MULTA": "CEZA",
		"CONTRA TU EX": "ESKI KULUP",
		"ROCE CON EL TÉCNICO": "HOCAYLA GERGINLIK",
		"ROCE CON EL VESTUARIO": "TAKIMLA GERGINLIK",
		"RECIÉN SALIDO": "YENI GIRDI",
		"{0} corrió a abrazar a su técnico. Paz en el banquillo.": "{0} koşup hocasına sarıldı. Kulübede barış var.",
		"Ese abrazo de {0} con el míster dice mucho.": "{0} ile hocanın o sarılması çok şey anlatıyor.",
		"Gol de {0} y todos con él. Este vestuario está unido.": "Gol {0} imzalı ve herkes onunla. Bu soyunma odası birlik içinde.",
		"¡{0} vino a celebrarlo con nosotros!": "{0} gelip bizimle kutladı!",
		"{0} no lo celebró contra nosotros. Respeto.": "{0} bize karşı gol sevinci yapmadı. Saygı.",
		"{0} marca a su ex y no lo celebra.": "{0} eski takımına gol atıp sevinmiyor.",
		"NADA QUE ARREGLAR": "ZATEN TAMAM",
		"Me equivoqué. Pido perdón al club, al míster y a mis compañeros.": "Hata yaptım. Kulüpten, hocadan ve takım arkadaşlarımdan özür dilerim.",
		"{0} pide perdón en un comunicado. El club da el asunto por cerrado.": "{0} bir açıklamayla özür diledi. Kulüp konuyu kapanmış sayıyor.",
		"Errores los tenemos todos. A seguir, {0}.": "Hepimiz hata yaparız. Devam, {0}.",
		"Disculpas aceptadas. Ahora, a darlo todo.": "Özür kabul edildi. Şimdi her şeyini ver.",
		"Mucho perdón ahora, {0}…": "Şimdi çok özür var, {0}…",
		"Dije lo que pienso y no me escondo.": "Düşündüğümü söyledim ve saklanmıyorum.",
		"{0} no rectifica: ni una palabra de disculpa.": "{0} geri adım atmıyor: tek kelime özür yok.",
		"¡Sin miedo, {0}! Con dos.": "Korkma, {0}! Yürekli.",
		"Así no ayudas al equipo, {0}.": "Böyle takıma yardım etmiyorsun, {0}.",
		"{0} se planta. El míster toma nota.": "{0} direniyor. Hoca not alıyor.",
		"Ni comunicado ni disculpa: {0} guarda silencio.": "Ne açıklama ne özür: {0} sessiz kalıyor.",
		"¿Y el comunicado, {0}? Seguimos esperando.": "Açıklama nerede, {0}? Hâlâ bekliyoruz.",
		"¿QUÉ TE CONVENCIÓ DE VENIR?": "SENI NE IKNA ETTI?",
		"{0} periodistas y una pregunta. Lo que contestes lo va a oír todo el club.": "{0} gazeteci ve tek bir soru. Ne cevap verirsen tüm kulüp duyacak.",
		"EL TÉCNICO": "TEKNIK DIREKTOR",
		"EL EQUIPO": "TAKIM",
		"LA AFICIÓN": "TARAFTAR",
		"LA PROXIMA: MULTA ×2 · ROJA {0}": "SONRAKI: CEZA ×2 · KIRMIZI KART {0}",
		"LA PROXIMA: TECNICO {0}": "SONRAKI: TEKNIK DIREKTOR {0}",
		"VIGILADO: MULTA ×2": "GOZETIMDE: CEZA ×2",
		"VIGILADO: TECNICO {0}": "GOZETIMDE: TEKNIK DIREKTOR {0}",
		"{0} no cierra la puerta a {1}. ¿Se va?": "{0}, {1} kulübüne kapıyı kapatmıyor. Gidiyor mu?",
		"¿{0} coqueteando con {1}? Así no.": "{0}, {1} kulübüyle flört mü ediyor? Böyle olmaz.",
		"{0} se queda. ¡Eso es compromiso!": "{0} kalıyor. İşte bağlılık bu!",
		"{0} corta el rumor de {1}.": "{0}, {1} kulübü söylentisine son verdi.",
		"Gracias a {0} por el pase de hoy.": "Bugünkü pas için teşekkürler {0}.",
		"Se sabe que te seguimos. Lo que digas lo oyen tu grada y nuestro despacho.": "Seni takip ettiğimiz biliniyor. Ne söylersen taraftarın da yönetimimiz de duyar.",
		"Respetamos tu palabra, {0}. La puerta sigue abierta.": "Sözüne saygı duyuyoruz {0}. Kapı hâlâ açık.",
		"¡Vaya pase me diste, crack! Ese gol es medio tuyo.": "Ne pas verdin be usta! O golün yarısı senin.",
		"Gracias por la camiseta del túnel, {0}. Desde entonces no me pierdo un gol tuyo.": "Tüneldeki forma için sağ ol {0}. O günden beri hiçbir golünü kaçırmadım.",
		"¡Tu camiseta ya está colgada en mi cuarto, {0}!": "Forman şimdiden odamda asılı {0}!",
		"Me alegró verte, {0}. Sigue así.": "Seni görmek güzeldi {0}. Böyle devam.",
		"En el fútbol nunca se sabe.": "Futbolda belli olmaz.",
		"Mi sitio está aquí.": "Benim yerim burası.",
		"El próximo te lo pongo yo.": "Sıradaki pası ben veriyorum.",
		"¡Gracias por estar siempre!": "Hep yanımda olduğun için sağ ol!",
		"Verdugo de Bosnia y Herzegovina": "Bosna-Hersek'in Belası",
		"Vencer a todos los clubes de Bosnia y Herzegovina (las tres divisiones).": "Bosna-Hersek'teki tüm kulüpleri yen (üç ligin hepsi).",
		"Las copas europeas estrenan rondas previas este verano": "Avrupa kupaları bu yaz eleme turlarına başlıyor",
		"El {0} jugará la ronda {1} de la {2} contra el {3}": "{0}, {2} {1} turunda {3} ile eşleşti",
		"El {0} elimina al {1} y entra en la fase de liga de la {2}": "{0}, {1} takımını eledi ve {2} lig aşamasına yükseldi",
		"El {0} elimina al {1} y pasa a la ronda {2} de la {3}": "{0}, {1} takımını eledi ve {3} {2} turuna yükseldi",
		"El {0} cae ante el {1} y se queda sin Europa": "{0}, {1} karşısında elendi ve Avrupa'ya veda etti",
		"El {0} cae ante el {1} y baja a la fase de liga de la {2}": "{0}, {1} karşısında elendi ve {2} lig aşamasına düştü",
		"El {0} cae ante el {1} y baja a la ronda {2} de la {3}": "{0}, {1} karşısında elendi ve {3} {2} turuna düştü",
		"{0} gana una plaza extra en la {1} por su temporada europea": "{0}, Avrupa sezonu sayesinde {1} için fazladan kontenjan kazandı",
		"Mil Goles": "Bin Gol",
		"1.000 goles en tu carrera.": "Kariyerinde 1.000 gol.",
		"Hat-Trick en la Final": "Finalde Hat-Trick",
		"3 goles en una final.": "Tek bir finalde 3 gol.",
		"Goleador de la Patria": "Vatanın Golcüsü",
		"50 goles con tu selección.": "Milli takımınla 50 gol.",
		"Bicampeón del Mundo": "İki Kez Dünya Şampiyonu",
		"Ganar 2 Mundiales con tu selección.": "Milli takımınla Dünya Şampiyonası'nı 2 kez kazan.",
		"Era Dorada": "Altın Çağ",
		"5 Balones de Oro.": "5 kez Yılın Oyuncusu.",
		"Mr. Champions": "Mr. Elit Kupası",
		"Ganar la Champions 5 veces en tu carrera.": "Kariyerinde Elit Kupası'nı 5 kez kazan.",
		"Tricampeón de Europa": "Üç Kez Avrupa Şampiyonu",
		"Ganar la Champions 3 temporadas seguidas.": "Elit Kupası'nı üst üste 3 sezon kazan.",
		"Mr. Libertadores": "Mr. Şan Kupası",
		"Ganar la Libertadores 5 veces en tu carrera.": "Kariyerinde Şan Kupası'nı 5 kez kazan.",
		"Mr. Copa del Norte": "Mr. Kuzey Kupası",
		"Ganar la Concacaf Champions Cup 5 veces en tu carrera.": "Kariyerinde Kuzey Kupası'nı 5 kez kazan.",
		"Killer de Europa": "Avrupa'nın Tetikçisi",
		"Ser 3 veces el máximo goleador de la Champions.": "Elit Kupası'nda 3 kez gol kralı ol.",
		"¡Llamen a Mantenimiento!": "Bakımcıyı Çağırın!",
		"Romper de dos balonazos las dos cuerdas que tensan la red y que salga el staff a tenderlas.": "Fileyi geren iki ipi iki şutla kopar ve görevlileri onları germeye çıkart.",
		"La red no se sostiene sola: algo la tensa por detrás.": "File kendi kendine durmuyor: arkadan onu geren bir şey var.",
	},








	"plural": {


		"pluralTIRO": ["ŞUT", "ŞUT"],
		"pluralPASE": ["PAS", "PAS"],
		"FIRMA DE AUTÓGRAFOS": "IMZA GUNU",
		"AUTÓGRAFOS FIRMADOS": "IMZALAR TAMAM",
		"FIRMA LA CAJA": "KUTU IMZALA",
		"FIRMAS EN EL SÚPER": "MARKETTE IMZA",
		"Diez cajas firmadas. Ésas no se las come nadie.": "On imzalı kutu. Bunları kimse yemez.",
		"FIRMA EL CROMO": "KARTI IMZALA",
		"FIRMAS EN EL BARRIO": "MAHALLEDE IMZA",
		"FIRMA EL PÓSTER": "POSTERI IMZALA",
		"FIRMA LA CLAQUETA": "KLAKETI IMZALA",
		"FIRMAS BAJO LA VALLA": "PANO ALTINDA IMZA",
		"FIRMAS EN LA PLAZA": "MEYDANDA IMZA",
		"FIRMAS EN EL PLATÓ": "PLATODA IMZA",
		"Diez pósters firmados. Ésos acaban enmarcados.": "On imzalı poster. Bunlar çerçevelenir.",
		"Diez fotos firmadas. Ésas brillan más que las pantallas.": "On imzalı fotoğraf. Bunlar ekranlardan daha parlak.",
		"Diez claquetas firmadas. Esta vez sí lo grabó alguien.": "On imzalı klaket. Bu sefer birisi gerçekten kaydetti.",
		"SELFIE": "SELFIE",
		"ENCUADRA Y DISPARA": "KADRAJLA VE ÇEK",
		"FOTO": "ÇEK",
		"ARRASTRA": "SURUKLE",
		"MOVIDA": "BULANIK",
		"SELFIES": "SELFIE",
		"A TUS REDES": "SOSYAL MEDYANA",
		"Diez cromos firmados. Ésos ya no se cambian.": "On imzalı kart. Bunlar artık takas edilmez.",
		"FIRMA EL CARTEL": "AFIŞI IMZALA",
		"FIRMAS EN LA PARADA": "DURAKTA IMZA",
		"Diez carteles firmados. Ésos no los arranca nadie.": "On imzalı afiş. Bunları kimse sökmez.",
		"FIRMA LA PORTADA": "KAPAGI IMZALA",
		"FIRMAS EN LA TIENDA": "MAGAZADA IMZA",
		"Diez portadas firmadas. Ésas no se revenden.": "On imzalı kapak. Bunlar yeniden satılmaz.",
		"pluralASISTENCIA": ["ASIST", "ASIST"],
		"pluralA PUERTA": ["ISABETLI", "ISABETLI"],
		"pluralREGATE": ["ÇALIM", "ÇALIM"],
		"pluralPÉRDIDA": ["KAYIP", "KAYIP"],
		"pluralFALTA RECIBIDA": ["KAZANILAN FAUL", "KAZANILAN FAUL"],


		"pluralFIJADO": ["SABIT", "SABIT"],
		"pluralVETADO": ["YASAK", "YASAK"],

		"pluralJORNADA": ["HAFTA", "HAFTA"],
		"pluraljornada": ["hafta", "hafta"],
		"pluralPUNTO": ["PUAN", "PUAN"],
		"pluralsemana": ["hafta", "hafta"],
		"pluraldía": ["gün", "gün"],
		"pluralclub": ["kulüp", "kulüp"],
		"pluraloferta": ["teklif", "teklif"],
		"pluralpatrocinador": ["sponsor", "sponsor"],
		"pluralquiere": ["istiyor", "istiyor"],
		"pluraltemporada": ["sezon", "sezon"],
		"pluraljugador": ["oyuncu", "oyuncu"],
		"pluralrival": ["rakip", "rakip"],
		"pluralpar": ["çift", "çift"],
		"pluralcompañero": ["takım arkadaşı", "takım arkadaşı"],
		"pluralgol": ["gol", "gol"],
		"pluralasistencia": ["asist", "asist"],
		"pluralAÑO": ["YIL", "YIL"],
		"pluralSEMANA": ["HAFTA", "HAFTA"],
		"pluralDÍA": ["GUN", "GUN"],
		"pluralpartido": ["maç", "maç"],
		"pluralPARTIDO": ["MAÇ", "MAÇ"],

		"pluralGOL": ["GOL", "GOL"],
		"pluralTEMPORADA": ["SEZON", "SEZON"],
		"pluralPARADA": ["KURTARIŞ", "KURTARIŞ"],
		"pluralfichaje": ["transfer", "transfer"],
		"pluralescudo": ["arma", "arma"],
		"pluralcompeticion": ["turnuva", "turnuva"],
		"pluralestadio": ["stadyum", "stadyum"],
		"pluralderbi": ["derbi", "derbi"],
		"pluraltécnico": ["teknik direktör", "teknik direktör"],
		"pluraltécnico sin equipo": ["takımsız teknik direktör", "takımsız teknik direktör"],
		"pluralseleccionador": ["milli takım teknik direktörü", "milli takım teknik direktörü"],
		"pluralcara de leyenda": ["efsane yüzü", "efsane yüzü"],
	},










	"guias": {
		"Tu equipo: quién sale hoy, quién descansa y quién te compite el puesto.": "Takımın: bugün kim başlıyor, kim dinleniyor ve kim formana rakip.",
		"PARA QUÉ SIRVEN": "NE IŞE YARARLAR",
		"Ninguna barra es adorno. El técnico y el vestuario deciden si juegas; la afición y la prensa, cuánto vales y qué marcas te buscan; el agente, cuántas ofertas ves.": "Hiçbir çubuk süs değil. Oynayıp oynamayacağına hoca ve soyunma odası karar verir; ne kadar ettiğine ve hangi markaların kapını çalacağına taraftar ve basın; kaç teklif göreceğine de menajerin.",
		"EL VESTUARIO TE DA EL BALÓN": "TAKIM SANA TOP VERIR",
		"No es simpatía: con el vestuario hundido te llegan MENOS ocasiones por partido, y con él alto, una o dos más.": "Mesele sevilmek değil: soyunma odası dibe vurmuşsa maç başına DAHA AZ pozisyon gelir, yüksekse bir iki tane fazla.",
		"LA GRADA JUEGA": "TRIBUN OYNAR",
		"Con la afición por los suelos, el estadio te arruina jugadas. Con la afición contigo, apuntas más fino.": "Taraftar yerlerdeyken stat pozisyonlarını mahveder. Taraftar arkandayken nişanın daha isabetli olur.",
		"SUBEN Y BAJAN": "INIP ÇIKARLAR",
		"Quien te reclama esta semana mueve su barra según lo que contestes. Y todas tiran hacia el medio cada temporada: lo alto cae rápido, lo bajo sube despacio.": "Bu hafta seni çağıran, verdiğin cevaba göre çubuğunu oynatır. Ve her sezon hepsi ortaya doğru kayar: yüksek olan hızlı düşer, düşük olan yavaş çıkar.",
		"Quién te quiere, cuánto pagan y qué te ofrece cada club. Sólo se mueve en sus dos ventanas: verano e invierno.": "Seni kim istiyor, ne kadar ödüyorlar ve her kulüp ne teklif ediyor. Sadece iki transfer döneminde hareketlenir: yaz ve kış.",
		"QUIÉN PUEDE FICHARTE": "KIM SENI ALABILIR",
		"Hay dos vetos: un grande no ficha a quien no le da el nivel, y un modesto no puede pagarte. Por eso no te llama todo el mundo.": "İki kesin engel var: büyük kulüp kendi seviyesinin altındaki oyuncuyu almaz, mütevazı kulüp de sana parayı yetiştiremez. Bu yüzden herkes aramıyor.",
		"LO QUE VALES": "NE KADAR EDERSIN",
		"Cuatro cosas: lo que sabes hacer, tu puesto, lo que llevas hecho esta temporada y lo que la gente sabe de ti. Y la edad manda: de joven multiplica, y desde los 28 pierdes casi un cuarto cada año.": "Dört şey: ne yapabildiğin, mevkin, bu sezon yaptıkların ve insanların senin hakkında bildikleri. Ve yaş belirleyici: gençken katlar, 28'den itibaren her yıl neredeyse dörtte birini kaybedersin.",
		"TU AGENTE ABRE PUERTAS": "MENAJERIN KAPI AÇAR",
		"Su nivel decide CUÁNTAS ofertas ves, y ayuda a arrancarle más sueldo al club. Por eso cobra.": "Seviyesi KAÇ teklif göreceğini belirler ve kulüpten daha iyi maaş koparmaya yardım eder. Parayı bunun için alıyor.",
		"Puedes pedir salir o irte cedido. Al club no le gusta que se lo pidan.": "Ayrılmak ya da kiralık gitmek isteyebilirsin. Kulüp bunun istenmesinden hoşlanmaz.",
		"EL ÁRBITRO PITA": "HAKEM ÇALAR",
		"TU PLANTEL": "KADRON",
		"El once de hoy sobre la cancha y, debajo, quién descansa. Es una foto: el once lo pone el técnico, no tú.": "Bugünün ilk 11'i sahada, altında da dinlenenler. Bu bir anlık görüntü: ilk 11'i sen değil hoca seçer.",
		"LA ENERGÍA MANDA": "ENERJI BELIRLER",
		"Tus compañeros se cansan y el técnico los rota: la cancha, la banca y los que no viajan son los del PRÓXIMO partido, no una lista fija. FRESCO, EN FORMA y CARGADO dicen cómo llega cada uno.":
			"Takım arkadaşların yorulur ve hoca rotasyon yapar: saha, yedek kulübesi ve kafileye girmeyenler BIR SONRAKI maçın kadrosudur, sabit bir liste değil. DINÇ, FORMDA ve AGIR her birinin nasıl geldiğini söyler.",
		"TU COMPETENCIA": "RAKIBIN",
		"Arriba, tú contra el que juega en tu puesto: la raya blanca es lo que el club pide para ese sitio. Debajo, de qué depende que salgas — tus cualidades, el técnico y tu racha.":
			"Üstte, sen ve mevkinde oynayan: beyaz çizgi, kulübün o yer için istediği. Altta, oynamanın neye bağlı olduğu — yeteneklerin, hoca ve formun.",
		"TU HABILIDAD": "YETENEGIN",
		"Tus diez cualidades. Las ocho de arriba deciden cómo te sale el balón; las dos de abajo son tu especialidad.": "On özelliğin. Üstteki sekizi topun ayağından nasıl çıkacağını belirler; alttaki ikisi uzmanlığın.",
		"LA ESPECIALIDAD": "UZMANLIK",
		"Penales y balón parado NO suben tu media: te hacen el lanzador del equipo. Es una elección de estilo, no un atajo.": "Penaltı ve duran top genelini ARTIRMAZ: seni takımın atıcısı yapar. Bu bir stil tercihi, kestirme yol değil.",
		"LOS PUNTOS": "PUANLAR",
		"Al subir de nivel ganas puntos. Se gastan con el más de cada fila, y mientras no salgas de la pantalla puedes deshacer.": "Seviye atladıkça puan kazanırsın. Her satırdaki artıyla harcarsın ve ekrandan çıkana kadar geri alabilirsin.",
		"LOS DESPACHOS": "YONETIM ODASI",
		"Aquí se trata con el club fuera de la cancha: cuánto te escuchan y a quién te traen.": "Kulüple saha dışındaki işler burada: seni ne kadar dinliyorlar ve sana kimi getiriyorlar.",
		"CUÁNTO TE ESCUCHAN": "NE KADAR DINLERLER",
		"Seis niveles, y cada uno te deja pedir más. Los sube tu relación (técnico, vestuario, años, afición y títulos aquí) y se revisan en invierno y en verano. Toca uno: verás qué pide y qué da.": "Altı seviye var ve her biri daha fazlasını istemene izin verir. Onları ilişkin yükseltir (hoca, soyunma odası, yıllar, taraftar ve buradaki kupalar) ve kışın ve yazın gözden geçirilir. Birine dokun: ne istediğini ve ne verdiğini gör.",
		"LA MESA DE FICHAJES": "TRANSFER MASASI",
		"Con la ventana abierta marcas a quién vendes y a quién fichas, y el presupuesto se rehace con cada toque. Nada se mueve hasta que confirmas.": "Transfer dönemi açıkken kimi satıp kimi alacağını işaretlersin ve bütçe her dokunuşta yeniden hesaplanır. Sen onaylayana kadar hiçbir şey kıpırdamaz.",
		"LO QUE SE MUEVE": "GELEN-GIDEN",
		"Son fichajes de verdad del mercado, no adorno: el que entra viene de un club real y por un precio.": "Bunlar piyasadan gerçek transferler, süs değil: gelen oyuncu gerçek bir kulüpten ve bir bedel karşılığında geliyor.",
		"EL MERCADO DE LOS DEMÁS": "DIGERLERININ PIYASASI",
		"Quién ficha por quién en todo el mundo, con lo que pagaron.": "Bütün dünyada kim kime imza attı ve ne kadar ödendi.",
		"ORDÉNALO": "SIRALA",
		"Las fichas de arriba ordenan por fecha, media o precio, y recortan a tu club, tu liga o el mundo.": "Üstteki çipler tarihe, genele ya da fiyata göre sıralar ve kulübüne, ligine ya da dünyaya göre daraltır.",
		"EL MUNDO SIGUE": "DUNYA DONUYOR",
		"Lo que pasa en los partidos que no juegas. La liga vive aunque tú no estés.": "Oynamadığın maçlarda olanlar. Sen olmasan da lig yaşıyor.",
		"CAMBIA EL RECORTE": "KAPSAMI DEGIŞTIR",
		"La etiqueta subrayada no es un título: se toca y va rotando entre tu club, tu liga y el mundo entero.": "Altı çizili etiket başlık değil: dokununca kulübün, ligin ve bütün dünya arasında döner.",
		"LO TUYO VA MARCADO": "SENINKILER BELLI",
		"Las noticias que te tocan llevan el borde de color, y sólo salen las últimas: esto es una portada, no un archivo.": "Seni ilgilendiren haberlerin renkli çerçevesi var ve sadece en yenileri çıkar: burası bir manşet, arşiv değil.",
		"TU CONTRATO": "SOZLEŞMEN",
		"El trato que tienes con el club: tu rol, tu sueldo y hasta cuándo.": "Kulüple yaptığın anlaşma: rolün, maaşın ve ne kadar süreceği.",
		"LO QUE TE PIDEN": "SENDEN ISTENEN",
		"El club te marca una meta del año. De cómo la lleves depende lo que te ofrezcan al renovar.": "Kulüp sana yıllık bir hedef koyar. Nasıl gittiğin, yenilemede ne teklif edeceklerini belirler.",
		"Se pide en AGENTE, junto a las ofertas. Lo que puedes pedir sale de cómo vienes jugando, no de lo que te gustaría.": "MENAJER bölümünde, tekliflerin yanında istenir. Ne isteyebileceğin, canının ne istediğine değil, nasıl oynadığına bağlı.",
		"Tu cara y tu pelo, lo que llevas en la cancha y la ropa de calle, en tres pestañas.": "Yüzün ve saçın, sahada giydiklerin ve sokak kıyafetlerin, üç sekmede.",
		"SE GUARDA SOLO": "OTOMATIK KAYIT",
		"Cada toque queda guardado. Y lo que compres en TIENDA aparece aquí para ponértelo.": "Her dokunuş kaydedilir. MAGAZA bölümünden aldığın her şey de giymen için burada çıkar.",
		"LAS BOTAS": "KRAMPON",
		"Dan un bono a tu golpeo, y SE GASTAN con el uso: al agotarse dejan de dártelo.": "Vuruşuna bonus verir ve kullandıkça AŞINIR: bitince bonus da gider.",
		"PARA LA JORNADA": "MAÇ GUNU IÇIN",
		"Lo que se consume: recuperarte, ponerte a punto y llegar mejor al siguiente partido.": "Tükenenler: toparlanmak, formu yakalamak ve bir sonraki maça daha iyi gelmek.",
		"Se lleva una comisión de lo que ingresas, y otra al firmar. Es el precio de que alguien te mueva.": "Kazancından bir pay alır, imzada da bir pay daha. Birinin seni taşımasının bedeli bu.",
		"Donde vives entre partidos. Subir de casa mejora cómo llegas al siguiente.": "Maçlar arasında yaşadığın yer. Daha iyi bir ev, bir sonraki maça daha iyi gelmen demek.",
		"LA SEMANA": "HAFTA",
		"Lo que puedes hacer en casa esta semana, sin salir a ningún lado.": "Bu hafta evde, hiçbir yere gitmeden yapabileceklerin.",
		"El siguiente peldaño, con lo que cuesta y lo que da. Ojo: el descanso tiene techo, no se acumula sin fin.": "Bir sonraki basamak, maliyeti ve getirisiyle. Dikkat: dinlenmenin bir tavanı var, sonsuza kadar birikmez.",
		"Cada competición que juegas, por dentro: su tabla, su cuadro o su grupo, y quién lleva los goles.": "Oynadığın her turnuva, içeriden: puan durumu, eşleşme tablosu ya da grubu ve gol krallığında kim önde.",
		"EL MUNDO ENTERO": "BUTUN DUNYA",
		"En la liga puedes viajar a otro país y a otra división: las tablas del planeta están aquí.": "Ligde başka bir ülkeye ve başka bir lige gidebilirsin: gezegendeki bütün puan durumları burada.",
		"EL HISTORIAL": "KAZANANLAR",
		"Quién ganó cada año. Tu nombre entra en esa lista si te lo ganas.": "Her yıl kim kazandı. Hak edersen senin adın da o listeye girer.",
		"EL MERCADO": "PIYASA",
		"SI NO JUEGAS": "OYNAMAZSAN",
		"TU TEMPORADA": "SEZONUN",
		"Todos tus partidos en el orden en que se juegan, con lo ya jugado y su resultado.": "Bütün maçların oynanış sırasıyla; oynananlar ve nasıl bittikleri de.",
		"MIRA ADELANTE": "ILERIYE BAK",
		"Aquí se ve cuándo se te juntan liga, copa y selección: ésas son las semanas en que el cansancio pesa.": "Lig, kupa ve milli takımın ne zaman üst üste bindiğini burada görürsün: yorgunluğun ağır bastığı haftalar bunlar.",
		"EL RANKING": "SIRALAMA",
		"Los jugadores del planeta ordenados por su media, con la tuya dentro para compararte.": "Gezegendeki oyuncular genellerine göre sıralı; kendini kıyaslaman için seninki de içinde.",
		"ACÓTALO": "DARALT",
		"Se puede filtrar por puesto y por país: así se ve contra quién compites de verdad.": "Mevkiye ve ülkeye göre filtreleyebilirsin: böylece gerçekte kiminle rekabet ettiğini görürsün.",
		"Los números de todo lo que llevas hecho: temporada a temporada y torneo por torneo.": "Yaptığın her şeyin rakamları: sezon sezon ve turnuva turnuva.",
		"Cada club por el que pasaste y lo que costó cada movimiento.": "Geçtiğin her kulüp ve her transferin maliyeti.",
		"La curva de lo que vales: el termómetro de si vas subiendo o cayendo.": "Değerinin eğrisi: yükselip yükselmediğini ya da düştüğünü gösteren termometre.",
		"TU PUNTERÍA": "ISABETIN",
		"Desde dónde tiras y desde dónde te entra. Cada marca es un remate tuyo, no una media inventada, y la curva es el vuelo que tuvo ese balón.":
			"Nereden şut çektiğin ve gollerin nereden geldiği. Her işaret senin bir şutun, uydurma bir ortalama değil; eğri de o topun gerçek uçuşu.",
		"El gol más lejano, el mejor acierto… lo que hiciste, no lo que crees que haces.": "En uzak gol, en iyi isabet… ne yaptığın, ne yaptığını sandığın değil.",
		"AÑO POR AÑO": "YIL YIL",
		"Con las flechas se mira cualquier temporada ya cerrada.": "Oklarla bitmiş herhangi bir sezona bakabilirsin.",
		"TU VITRINA": "VITRININ",
		"Lo que ya ganaste. Se queda para siempre y se ve también dentro de tu casa.": "Şimdiye kadar kazandıkların. Sonsuza dek kalır ve evinin içinde de görünür.",
		"LO QUE FALTA": "EKSIKLER",
		"Todo lo que existe por ganar, incluido lo que hoy te queda lejos.": "Kazanılacak her şey, bugün sana uzak olanlar da dahil.",
		"LA CASA POR DENTRO": "KULUBUN IÇI",
		"Lo que tu club ganó antes de que llegaras, y quiénes lo hicieron.": "Kulübünün sen gelmeden önce kazandıkları ve bunları kimlerin kazandırdığı.",
		"LOS DE SIEMPRE": "TUM ZAMANLAR",
		"Los máximos goleadores de la casa. Ahí es donde hay que meterse.": "Kulübün tüm zamanların golcüleri. Girmen gereken liste bu.",
		"LAS LEYENDAS": "EFSANELER",
		"Los grandes del juego, por liga y por club. Son la vara con la que se te mide.": "Oyunun büyükleri, lig lig ve kulüp kulüp. Seni onlarla ölçecekler.",
		"TU SITIO": "YERIN",
		"Con los años, tu nombre aparece en estas listas. Eso es el legado.": "Yıllar geçtikçe adın bu listelerde görünür. Miras budur.",
		"EL JUGADOR DEL AÑO": "YILIN OYUNCUSU",
		"Quién lo ganó cada año y con qué números. Si no lo ganas tú, lo gana alguien.": "Her yıl kimin kazandığı ve hangi rakamlarla. Sen kazanmazsan başkası kazanır.",
		"CÓMO SE GANA": "NASIL ALINIR",
		"Lo que pesa en la votación. Meter goles es una parte, no toda.": "Oylamada neyin ağır bastığı. Gol atmak işin bir parçası, hepsi değil.",
		"ESTE AÑO": "BU YIL",
		"Cómo va la votación ahora mismo, contigo dentro si andas cerca.": "Oylama şu an nasıl gidiyor; yakınsan sen de içindesin.",
		"EL PARTIDO": "MAÇ",
		"Tu equipo, el rival y el minuto. Un partido no se juega de corrido: se juega por OCASIONES, y cada una es tuya.": "Takımın, rakip ve dakika. Maç baştan sona oynanmaz: POZISYONLARLA oynanır ve her biri senindir.",
		"A QUIÉN LLEVAS": "KIM SENDE",
		"El jugador que controlas ahora. Un pase FUERA del área te pasa el mando al que lo recibe; dentro del área remata él de primera y no hay relevo.": "Şu an kontrol ettiğin oyuncu. Ceza sahası DIŞINDA biten pas, kontrolü topu alana geçirir; ceza sahası içinde o ilk vuruşta şut çeker ve devir olmaz.",
		"TU NOTA": "NOTUN",
		"Sube y baja con cada cosa que haces. Es la nota con la que el técnico te juzga, y la que decide tu temporada.": "Yaptığın her şeyle iner çıkar. Teknik direktörün seni yargıladığı ve sezonunu belirleyen not bu.",
		"EL VIENTO": "RUZGAR",
		"Hacia dónde sopla y cuánto. El balón se va con él: cuéntalo al apuntar o el centro se te pasa largo.": "Nereye ve ne kadar sert estiği. Top onunla sürüklenir: nişan alırken hesaba kat, yoksa orta uzun gider.",
		"EL PARTIDO SE INCLINA": "MAÇ DONUYOR",
		"Cuando tu equipo se enciende, el rival marca menos entre tus jugadas. Cuando se enfría, aprieta él. Lo verás avisado.": "Takımın alev aldığında rakip senin pozisyonların arasında daha az gol atar. Soğuduğunda o bastırır. Haber verilecek.",
		"FUERA DE LUGAR": "OFSAYT",
		"Cuando salió el pase, el que lo recibió estaba más cerca del arco que el balón y que el penúltimo rival (el portero cuenta): el abanderado levanta y la jugada se anula. A la altura, en juego.": "Pas çıktığında topu alan oyuncu kaleye toptan ve sondan ikinci rakipten (kaleci de sayılır) daha yakındı: yan hakem bayrağı kaldırır ve pozisyon iptal edilir. Aynı hizada olmak ofsayt değildir.",
		"El árbitro pita lo que ve. No siempre a tu favor: también te la pitan a ti.": "Hakem gördüğünü çalar. Her zaman senin lehine değil: aleyhine de çalınır.",
		"TARJETA": "KART",
		"Queda anotada. La amarilla es un aviso; una roja te deja fuera de los próximos partidos de ese torneo, y ahí no se juega ni se entrena: se espera.": "Kayda geçer. Sarı bir uyarıdır; kırmızı seni o turnuvanın sonraki maçlarından uzak tutar ve o sürede ne oynanır ne antrenman yapılır: beklenir.",
		"AHORA LLEVAS A OTRO": "TOPTA YENI ADAM",
		"Diste el pase y el mando saltó al que la recibió. Termina tú la jugada: si él vuelve a pasar, el mando se queda contigo.": "Pası verdin ve kontrol topu alana geçti. Pozisyonu sen bitir: o tekrar pas verirse kontrol sende kalır.",
		"Desperdiciar ocasiones SEGUIDAS con la nota por los suelos te saca del partido. Si el técnico confía en ti te compra una más, pero no muchas.": "Notun yerlerdeyken pozisyonları ART ARDA harcamak seni oyundan aldırır. Hoca sana güveniyorsa bir şans daha verir, ama çok değil.",
		"CÓMO SE JUEGA": "NASIL OYNANIR",
		"TUS PASES": "PASLARIN",
		"TUS REGATES": "ÇALIMLARIN",
		"Asistencia": "Asist",
		"Acabó en remate": "Şutla bitti",
		"Sin remate": "Şut yok",
		"Por donde pisaste": "Oynadığın yerler",
		"Te la quitaron": "Top kaptırdın",
		"Falta a favor": "Kazanılan faul",
		" de {0}": " / {0}",
		"EL BAR DE SIEMPRE": "BILINDIK BAR",

		"GALA DEL CLUB": "KULUP GECESI",
		"GALA DE LA LIGA": "LIG GECESI",
		"La liga te elige su mejor jugador de la temporada.": "Lig seni sezonun en iyi oyuncusu seçiyor.",
		"El mejor de tu línea en toda la liga. El del año fue para {0}.": "Ligde mevkinin en iyisi. Sezonun oyuncusu ödülü şu oyuncuya gitti: {0}.",
		"La liga eligió a {0}. El año que viene, la gala también es tuya.": "Lig şu oyuncuyu seçti: {0}. Seneye o gece senin de olabilir.",
		"SUSPENDIDA": "IPTAL",
		"GALA SUSPENDIDA": "GECE IPTAL",
		"MEJOR DEFENSA": "EN IYI DEFANS",
		"MEJOR PORTERO": "EN IYI KALECI",
		"MEJOR MEDIO": "EN IYI ORTACI",
		"MEJOR DELANTERO": "EN IYI FORVET",
		"MEJOR JUGADOR DE LA TEMPORADA": "SEZONUN OYUNCUSU",
		"TROFEOS SUSPENDIDOS": "ODULLER IPTAL",
		"puesto": "sıra",
		"objetivos": "hedefler",
		"Tu vestuario te eligió el mejor de la temporada.": "Soyunma odası seni sezonun en iyisi seçti.",
		"El mejor de tu línea. El del año fue para {0}.": "Mevkinin en iyisi. Sezonun oyuncusu ödülü şu oyuncuya gitti: {0}.",
		"El vestuario eligió a {0}. La próxima gala se empieza a ganar en agosto.": "Soyunma odası şu oyuncuyu seçti: {0}. Gelecek yılın gecesi ağustosta kazanılmaya başlar.",
		"El club bajó de categoría. La directiva suspende los premios del año por el mal rendimiento del equipo.": "Kulüp küme düştü. Yönetim, takımın kötü performansı yüzünden bu yılın ödüllerini iptal ediyor.",
		"El club no cumplió ninguno de sus objetivos. La directiva suspende los premios del año por el mal rendimiento del equipo.": "Kulüp hedeflerinin hiçbirini tutturamadı. Yönetim, takımın kötü performansı yüzünden bu yılın ödüllerini iptal ediyor.",
		"El club suspende sus premios del año por el mal rendimiento": "Kulüp kötü performans yüzünden bu yılın ödüllerini iptal ediyor",
		"Mejor (Club)": "En İyi (Kulüp)",
		"Delantero (Club)": "Forvet (Kulüp)",
		"Medio (Club)": "Orta Saha (Kulüp)",
		"Defensa (Club)": "Defans (Kulüp)",
		"Mejor Jugador del Club": "Kulübün Sezon Oyuncusu",
		"Mejor Delantero del Club": "Kulübün En İyi Forveti",
		"Mejor Medio del Club": "Kulübün En İyi Orta Sahası",
		"Mejor Defensa del Club": "Kulübün En İyi Defansı",
		"LA GUARDARON": "SAKLAMIŞLAR",
		"tenías": "yaşındaydın",
		"gol": "gol",
		"Alguien la enmarcó y la colgó. Nadie te lo dijo nunca.": "Biri onu çerçeveletip asmış. Kimse sana hiç söylemedi.",
		"Sigue ahí. Ya casi nadie se acuerda de aquella tarde, pero sigue ahí.": "Hâlâ orada. O öğleden sonrayı artık neredeyse kimse hatırlamıyor, ama hâlâ orada.",
		"TU CELULAR": "TELEFONUN",
		"Cada app es un recorte: tu club, tu liga, el mundo y tus redes, donde se contesta a quien te critica.": "Her uygulama bir kesittir: kulübün, ligin, dünya ve sosyal medyan; seni eleştirenlere orada cevap verilir.",
	},












	"caja": {
		"CONSEGUIR DINERO": "PARA AL",
		"CONSEGUIR PUNTOS": "PUAN AL",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu Apple ID.":
			"Bu GERÇEK PARAYLA ödenir, oyun parasıyla değil: Apple ID'nden tahsil edilir.",
		"Lo que compres entra en esta carrera al instante.":
			"Satın aldığın her şey bu kariyere anında eklenir.",
		"DINERO REAL": "GERÇEK PARA",
		"DINERO DEL JUEGO": "OYUN PARASI",
		"LA CAJA": "KASA",
		"PUNTOS DE HABILIDAD": "YETENEK PUANI",
		"Se reparten a mano en TU JUGADOR. Un punto cuesta 1 por debajo de 80, 2 de 80 a 89 y 3 de 90 en adelante: cuanto mejor eres, menos rinde el paquete.":
			"OYUNCUM bölümünde elle dağıtılır. Bir puan 80'in altında 1, 80-89 arası 2, 90 ve üstü 3 tutar: ne kadar iyiysen paket o kadar az getirir.",
		"+ {0} PUNTOS DE HABILIDAD": "+ {0} YETENEK PUANI",
		"EXTRA": "EK",
		"COMPRA LISTA": "SATIN ALINDI",
		"Se sumaron ${0} a tu carrera.": "Kariyerine ${0} eklendi.",
		"Tienes {0} puntos nuevos para repartir en TU JUGADOR.":
			"OYUNCUM bölümünde dağıtacak {0} yeni puanın var.",
		"Ya lo tienes todo al máximo, así que los puntos entraron como {0} de experiencia.":
			"Her şey zaten tavanda, bu yüzden puanlar {0} deneyim olarak eklendi.",
		"Se registró tu compra. Si no ves lo que compraste, cierra y vuelve a abrir el juego.":
			"Satın alman kaydedildi. Aldığını göremiyorsan oyunu kapatıp yeniden aç.",
		"PRIMA DE PARTIDO": "MAÇ PRIMI",
		"Para lo que te falta hoy: unas botas, o el gel y la bebida antes del derbi.":
			"Bugün eksiğin ne ise: bir çift krampon ya da derbi öncesi jel ve içecek.",
		"BONO DE CONTRATO": "SOZLESME BONUSU",
		"El deportivo, o unas botas de las buenas con repuesto para toda la temporada.":
			"Spor araba ya da bütün sezon yetecek yedekleriyle iyi bir çift krampon.",
		"Alcanza para el preparador físico, o para subir de escalón con tu agente.":
			"Kondisyoner için ya da menajerinle bir basamak yükselmek için yeter.",
		"TRASPASO RÉCORD": "REKOR TRANSFER",
		"La clínica y el analista de vídeo, de una sentada.":
			"Klinik ve video analisti, tek seferde.",
		"El agente que te sienta con los grandes de Europa, pagado de golpe.":
			"Seni Avrupa'nın devleriyle masaya oturtan menajer, peşin ödenmiş.",
		"SESIÓN EXTRA": "EKSTRA SEANS",
		"Cuatro niveles de golpe. Para rematar la habilidad que traes a medias.":
			"Tek seferde dört seviye. Yarım bıraktığın yeteneği tamamlamak için.",
		"Sube una habilidad entera de 60 a 85, o reparte donde más duela.":
			"Bir yeteneği 60'tan 85'e çıkar ya da en çok acıyan yere dağıt.",
		"Una habilidad de 60 a 99, y todavía sobra para empezar la siguiente.":
			"Bir yetenek 60'tan 99'a, üstelik bir sonrakine başlamaya da artar.",
		"TALENTO GENERACIONAL": "NESLIN YETENEGI",
		"Trescientos puntos. Casi la mitad de todo lo que se puede subir en una carrera.":
			"Üç yüz puan. Bir kariyerde yükseltilebilecek her şeyin neredeyse yarısı.",







		"TODAS LAS VENTAJAS": "TUM AVANTAJLAR",
		"Abre de golpe la vitrina entera de NUEVA CARRERA+, sin esperar a sus logros.":
			"YENI KARIYER+ vitrininin tamamını, başarımlarını beklemeden tek seferde açar.",
		"PARA SIEMPRE": "KALICI",
		"{0} VENTAJAS": "{0} AVANTAJ",


		"DOBLE PAGA": "ÇIFTE MAAS",
		"Sueldo, primas y patrocinios ×2 en todas tus carreras, las de hoy y las que vengan.":
			"Maaş, primler ve sponsorluklar tüm kariyerlerinde ×2, bugünküler de gelecekler de.",
		"Activa: cobras el doble en cada partido y en cada cierre.":
			"Aktif: her maçta ve her sezon kapanışında iki katını alırsın.",
		"TODAS TUS CARRERAS": "TUM KARIYERLERIN",
		"PAGO ÚNICO": "TEK SEFERLIK",
		"COBRA ×2": "×2 KAZAN",


		"DOBLE XP": "ÇIFTE XP",
		"La XP de cada partido ×2 en todas tus carreras, las de hoy y las que vengan.":
			"Her maçın XP'si tüm kariyerlerinde ×2, bugünküler de gelecekler de.",
		"Activa: ganas el doble de XP en cada partido.":
			"Aktif: her maçta iki kat XP kazanırsın.",
		"GANA XP ×2": "XP×2 KAZAN",


		"PACK LEYENDA": "EFSANE PAKET",
		"DOBLE PAGA y DOBLE XP juntos, en todas tus carreras, las de hoy y las que vengan.":
			"ÇIFTE MAAŞ ve ÇIFTE XP bir arada, tüm kariyerlerinde, bugünküler de gelecekler de.",
		"Activa: cobras el doble y ganas el doble de XP en cada partido.":
			"Aktif: her maçta iki kat maaş ve iki kat XP kazanırsın.",
		"LOS DOS ×2": "IKISI ×2",
		"PAGA": "MAAS",
		"XP": "XP",
		"AHORRO": "KAZANÇ",
		"CUARTA RANURA": "DORDUNCU YUVA",
		"Una cuarta ranura en la portada, para llevar otra carrera a la vez.":
			"Ana ekranda dördüncü bir yuva; aynı anda bir kariyer daha yürütmek için.",
		"Activa: tu portada tiene cuatro ranuras.": "Aktif: ana ekranında dört yuva var.",
		"ABRE LA CUARTA": "4. YUVAYI AÇ",
		"RANURA": "YUVA",
		"A LA VEZ": "BIRLIKTE",
		"HITOS": "HEDEFLER",
		"Tus {0} ventajas siguen entrando en cada carrera nueva.":
			"{0} avantajın her yeni kariyere girmeye devam ediyor.",
		"Se abren todas de golpe en NUEVA CARRERA+, y también las que se añadan después.":
			"Hepsi YENI KARIYER+ içinde tek seferde açılır, sonradan eklenecekler de.",
		"No marca ningún logro: tu palmarés sigue siendo lo que jugaste.":
			"Hiçbir başarımı işaretlemez: kariyer geçmişin oynadığın neyse o kalır.",
		"Se paga una vez y queda en tu Apple ID: vale para las 3 ranuras y para cada carrera nueva.":
			"Bir kez ödenir ve Apple ID'ne bağlı kalır: 3 yuvada ve her yeni kariyerde geçerli.",
		"Listo: ya están abiertas todas. Las eliges al empezar una carrera nueva, en TUS VENTAJAS.":
			"Tamam: hepsi açıldı. Yeni bir kariyere başlarken AVANTAJLARIN bölümünden seçersin.",
		"COMPRAS": "ALIMLAR",
		"¿Reinstalaste el juego o cambiaste de teléfono? Recupera aquí lo que ya pagaste con este Apple ID.":
			"Oyunu yeniden mi yükledin ya da telefon mu değiştirdin? Bu Apple ID ile ödediklerini buradan geri al.",
		"RESTAURAR COMPRAS": "GERI YUKLE",
		"RESTAURANDO": "YUKLENIYOR",
		"Listo: ya recuperaste lo que habías comprado con este Apple ID.":
			"Tamam: bu Apple ID ile satın aldıklarını geri aldın.",
		"Este Apple ID no tiene compras que recuperar en Football Legacy.":
			"Bu Apple ID'nin Football Legacy'de geri yüklenecek satın alımı yok.",

		"PACK DOBLE": "ÇIFTE PAKET",
		"Las dos monedas en una compra, y sale mejor que por separado.":
			"İki para birimi tek satın alımda, ayrı ayrı almaktan daha ucuz.",





		"POSTE": "DIREK",
		"TU {0}%": "SEN %{0}",
		"RIVAL {0}%": "RAKIP {0}%",
		"subMANTEN": "KAL",
		"subPEDIDO": "ISTEK",
		"subAGUANTA": "DEVAM",
		"subFUERA": "ÇIK",
		"subLESIONADO": "SAKAT",
		"Subirla cuesta 1 punto y tienes {0}.": "Yükseltmek 1 puan, sende {0} var.",
		"Subirla cuesta {0} puntos y tienes {1}.": "Yükseltmek {0} puan, sende {1} var.",
	},

	"casa_pack_2": {
		"COLCHÓN DE ESTIRAMIENTOS": "ESNEME MINDERI",
		"Rutina corta de movilidad: recupera energía y un punto de ánimo.": "Kısa bir mobilite rutini: enerji ve bir puan form kazandırır.",
		"Zona de movilidad para soltar piernas. Su rutina da energía y ánimo.": "Bacakları açmak için mobilite köşesi. Rutini enerji ve form verir.",
		"MÁQUINA DE RESPIRACIÓN": "NEFES MAKINESI",
		"Respiración guiada para centrarte. Da ánimo y confianza con el técnico.": "Odaklanmak için rehberli nefes. Form ve hocayla güven kazandırır.",
		"Cabina de respiración guiada para bajar pulsaciones antes de competir.": "Müsabaka öncesi nabzı düşürmek için rehberli nefes kabini.",
		"PANEL DE OBJETIVOS": "HEDEF PANOSU",
		"Metas, notas y hábitos de temporada para vestir la pared.": "Duvarı süsleyen sezon hedefleri, notlar ve alışkanlıklar.",
		"Panel de objetivos y hábitos. Decora la pared y ordena tu semana.": "Hedef ve alışkanlık panosu. Duvarı süsler ve haftanı düzene sokar.",
		"BAR SALUDABLE": "SAGLIKLI BAR",
		"Jugos, agua mineral y snacks medidos: recupera energía sin salir.": "Meyve suyu, maden suyu ve ölçülü atıştırmalık: dışarı çıkmadan enerji toplar.",
		"Bar de jugos, agua mineral y snacks. Recupera un poco de energía.": "Meyve suyu, maden suyu ve atıştırmalık barı. Biraz enerji toplar.",
		"LÁMPARA SOLAR": "GUNES LAMBASI",
		"Luz cálida de ambiente para que los rincones se sientan habitados.": "Köşelere yaşanmışlık katan sıcak ortam ışığı.",
		"Luz cálida de ambiente. No da bonus, pero levanta mucho el rincón.": "Sıcak ortam ışığı. Bonus vermez ama köşeyi çok canlandırır.",
		"ESTIRAR EN CASA": "EVDE ESNE",
		"Hasta +4 de energía y +1 de ánimo. Una acción semanal.": "+4'e kadar enerji ve +1 form. Haftalık bir eylem.",
		"RESPIRAR Y ENFOCAR": "NEFES VE ODAKLANMA",
		"+1 de ánimo y +1 con el técnico si aún hay margen. Una acción semanal.": "+1 form ve yer varsa hocayla +1. Haftalık bir eylem.",
		"HIDRATARSE BIEN": "IYI SU IÇ",
		"Hasta +4 de energía. Una acción semanal.": "+4'e kadar enerji. Haftalık bir eylem.",
	},




















	"aspecto": {

		"Corte César": "Sezar kesim",
		"Coleta": "At kuyruğu",
		"Coleta alta": "Yüksek at kuyruğu",
		"Calvicie en coronilla": "Tepeden dökülme",
		"Dos trenzas": "İki örgü",
		"Flat top": "Flat top",
		"Flequillo": "Kâkül",
		"Corte hongo": "Kâse kesim",
		"Pelo largo": "Uzun saç",
		"Melena a la mandíbula": "Çene boyu küt",
		"Moño": "Topuz",
		"Mullet rizado": "Kıvırcık mullet",
		"Peinado hacia atrás": "Geriye taranmış",
		"Raya al lado": "Yandan ayrık",
		"Rizado": "Kıvırcık",
		"Semicalvo": "Yarı kel",
		"Trenzas pegadas": "Kafaya yapışık örgü",
		"Trenzas largas sueltas": "Uzun açık örgüler",
		"Tupé": "Kabarık perçem",
		"Undercut": "Undercut",

		"French crop texturizado": "Dokulu French crop",
		"Crop con degradado alto": "Yüksek geçişli crop",
		"Crew cut": "Kısa asker tıraşı",
		"Buzz con degradado": "Geçişli kısa tıraş",
		"Tupé corto": "Kısa perçem",
		"Raya lateral corta": "Kısa yandan ayrık",
		"Edgar con fleco recto": "Edgar, düz kâkül",
		"Crop rizado": "Kıvırcık crop",
		"Ivy League": "Ivy League",
		"Ondas cortas con degradado": "Kısa dalgalı, geçişli",
		"Fleco de cortina largo": "Uzun perde kâkül",
		"Wolf cut suave": "Yumuşak wolf cut",
		"Mullet moderno": "Modern mullet",
		"Rizos sueltos": "Gevşek bukleler",
		"Rastas recogidas arriba": "Toplanmış rasta",
		"Rastas hacia un lado": "Yana rasta",
		"Trenzas pegadas con diseños": "Desenli yapışık örgü",
		"Twists cortos": "Kısa twist",
		"Melena ondulada": "Dalgalı uzun saç",
		"Capas despeinadas": "Dağınık katlar",
		"Media coleta": "Yarım at kuyruğu",
		"Rastas cortas": "Kısa rasta",
		"Rastas con degradado": "Geçişli rasta",
		"Rastas a la mandíbula": "Çene boyu rasta",
		"Rastas largas sueltas": "Uzun açık rasta",
		"Rastas gruesas": "Kalın rasta",
		"Fleco recto": "Düz kâkül",
		"Fleco irregular": "Düzensiz kâkül",
		"Fleco diagonal": "Yana kâkül",
		"Fleco de cortina": "Perde kâkül",
		"Fleco ondulado": "Dalgalı kâkül",

		"Barba cuadrada": "Köşeli sakal",
		"Barba redondeada": "Yuvarlak sakal",
		"Barba trenzada": "Örgülü sakal",
		"Bigote de puntas curvadas": "Burma bıyık",
		"Bigote fino": "İnce bıyık",
		"Bigote chevrón": "Kalın düz bıyık",
		"Chiva larga": "Uzun keçi sakalı",
		"Bigote herradura": "Nal bıyık",
		"Barba larga": "Uzun sakal",
		"Bigote morsa": "Pala bıyık",
		"Patillas unidas al bigote": "Favoriden bıyığa",
		"Perilla": "Çene sakalı",
		"Barba sin bigote": "Bıyıksız sakal",
		"Barba de tres días": "Üç günlük sakal",

		"Arqueadas": "Kemerli",
		"Caídas": "Düşük",
		"Con cortes": "Kesikli",
		"Finas": "İnce",
		"Inclinadas": "Eğik",
		"Naturales": "Doğal",
		"Pobladas": "Gür",

		"Altas": "Yüksek",
		"Unidas": "Bitişik",
		"Cortas": "Kısa",
		"Largas": "Uzun",
		"Puntiagudas": "Sivri",
		"Una levantada": "Tek kalkık",
		"Furiosas": "Öfkeli",
		"Muy pobladas": "Çok gür",
		"Rectas gruesas": "Kalın düz",
		"Despeinadas": "Dağınık",
		"Cuadradas": "Köşeli",
		"Gruesas arqueadas": "Kalın kemerli",


		"Crop": "Crop",
		"Cesar": "Sezar",
		"Crew": "Asker",
		"Bun": "Bun",
		"Zigzag": "Zigzag",
		"Rombos": "Baklava",
		"Espiga": "Balıksırtı",
		"Malla": "File",
		"Entrenamiento": "Antrenman",
		"Lujo": "Lüks",
		"Ninguna": "Yok",
		"Varsity": "Varsity",
		"Gabardina": "Trençkot",
		"Acolchada": "Şişme mont",
		"Gimnasio": "Spor salonu",
		"Streetwear": "Streetwear",
		"Retro": "Retro",
		"Invierno": "Kış",
		"Vaquero": "Kovboy",
		"Playero": "Plaj günü",
		"Rockero": "Rockçı",
		"Urbano": "Şehirli",
		"Día de nieve": "Karlı gün",
		"Festival": "Festival",
		"Llegada al estadio": "Stadyuma geliş",
		"Aeropuerto": "Havalimanı",
		"Rueda de prensa": "Basın toplantısı",
		"Terraza clásica": "Klasik tribün",
		"Usar": "Kullan",
		"Actualizar": "Güncelle",
		"Eliminar": "Sil",
		"Bajas": "Alçak",
		"Villano": "Kötü adam",
		"Doble corte": "Çift kesik",
		"Escalón": "Basamaklı",
	},
	"paises": {
		"Afganistán": "Afganistan",
		"Albania": "Arnavutluk",
		"Alemania": "Almanya",
		"Andorra": "Andora",
		"Angola": "Angola",
		"Anguila": "Anguilla Adası",
		"Antigua y Barbuda": "Antigua ve Barbuda",
		"Arabia Saudí": "Suudi Arabistan",
		"Argelia": "Cezayir",
		"Argentina": "Arjantin",
		"Armenia": "Ermenistan",
		"Aruba": "Aruba",
		"Australia": "Avustralya",
		"Austria": "Avusturya",
		"Azerbaiyán": "Azerbaycan",
		"Bahamas": "Bahamas",
		"Bangladés": "Bangladeş",
		"Barbados": "Barbados",
		"Baréin": "Bahreyn",
		"Belice": "Belize",
		"Benín": "Benin",
		"Bermudas": "Bermuda",
		"Bielorrusia": "Belarus",
		"Bolivia": "Bolivya",
		"Bosnia y Herzegovina": "Bosna-Hersek",
		"Botsuana": "Botsvana",
		"Brasil": "Brezilya",
		"Brunéi": "Brunei",
		"Bulgaria": "Bulgaristan",
		"Burkina Faso": "Burkina Faso",
		"Burundi": "Burundi",
		"Bután": "Butan",
		"Bélgica": "Belçika",
		"Cabo Verde": "Yeşil Burun Adaları",
		"Camboya": "Kamboçya",
		"Camerún": "Kamerun",
		"Canadá": "Kanada",
		"Catar": "Katar",
		"Chad": "Çad",
		"Chequia": "Çekya",
		"Chile": "Şili",
		"China": "Çin",
		"China Taipéi": "Çin Taipei",
		"Chipre": "Kıbrıs",
		"Colombia": "Kolombiya",
		"Comoras": "Komorlar",
		"Congo": "Kongo",
		"Corea del Norte": "Kuzey Kore",
		"Corea del Sur": "Güney Kore",
		"Costa de Marfil": "Fildişi Sahili",
		"Costa Rica": "Kosta Rika",
		"Croacia": "Hırvatistan",
		"Cuba": "Küba",
		"Curazao": "Curaçao",
		"Dinamarca": "Danimarka",
		"Dominica": "Dominika",
		"Ecuador": "Ekvador",
		"Egipto": "Mısır",
		"El Salvador": "El Salvador",
		"Emiratos Árabes": "BAE",
		"Eritrea": "Eritre",
		"Escocia": "İskoçya",
		"Eslovaquia": "Slovakya",
		"Eslovenia": "Slovenya",
		"España": "İspanya",
		"Estados Unidos": "ABD",
		"Estonia": "Estonya",
		"Esuatini": "Esvatini",
		"Etiopía": "Etiyopya",
		"Filipinas": "Filipinler",
		"Finlandia": "Finlandiya",
		"Fiyi": "Fiji",
		"Francia": "Fransa",
		"Gabón": "Gabon",
		"Gales": "Galler",
		"Gambia": "Gambiya",
		"Georgia": "Gürcistan",
		"Ghana": "Gana",
		"Gibraltar": "Cebelitarık",
		"Granada": "Grenada",
		"Grecia": "Yunanistan",
		"Guam": "Guam",
		"Guatemala": "Guatemala",
		"Guinea": "Gine",
		"Guinea Ecuatorial": "Ekvator Ginesi",
		"Guinea-Bisáu": "Gine-Bissau",
		"Guyana": "Guyana",
		"Haití": "Haiti",
		"Honduras": "Honduras",
		"Hong Kong": "Hong Kong",
		"Hungría": "Macaristan",
		"India": "Hindistan",
		"Indonesia": "Endonezya",
		"Inglaterra": "İngiltere",
		"Irak": "Irak",
		"Irlanda": "İrlanda",
		"Irlanda del Norte": "Kuzey İrlanda",
		"Irán": "İran",
		"Islandia": "İzlanda",
		"Islas Caimán": "Cayman Adaları",
		"Islas Cook": "Cook Adaları",
		"Islas Feroe": "Faroe Adaları",
		"Islas Marianas del Norte": "Kuzey Mariana Adaları",
		"Islas Salomón": "Solomon Adaları",
		"Islas Turcas y Caicos": "Turks ve Caicos",
		"Islas Vírgenes Británicas": "Britanya Virjin Adaları",
		"Islas Vírgenes de EE.UU.": "ABD Virjin Adaları",
		"Israel": "İsrail",
		"Italia": "İtalya",
		"Jamaica": "Jamaika",
		"Japón": "Japonya",
		"Jordania": "Ürdün",
		"Kazajistán": "Kazakistan",
		"Kenia": "Kenya",
		"Kirguistán": "Kırgızistan",
		"Kosovo": "Kosova",
		"Kuwait": "Kuveyt",
		"Laos": "Laos",
		"Lesoto": "Lesotho",
		"Letonia": "Letonya",
		"Liberia": "Liberya",
		"Libia": "Libya",
		"Liechtenstein": "Lihtenştayn",
		"Lituania": "Litvanya",
		"Luxemburgo": "Lüksemburg",
		"Líbano": "Lübnan",
		"Macao": "Makao",
		"Macedonia del Norte": "Kuzey Makedonya",
		"Madagascar": "Madagaskar",
		"Malasia": "Malezya",
		"Malaui": "Malavi",
		"Maldivas": "Maldivler",
		"Malta": "Malta",
		"Malí": "Mali",
		"Marruecos": "Fas",
		"Mauricio": "Mauritius",
		"Mauritania": "Moritanya",
		"Moldova": "Moldova",
		"Mongolia": "Moğolistan",
		"Montenegro": "Karadağ",
		"Montserrat": "Montserrat",
		"Mozambique": "Mozambik",
		"Myanmar": "Myanmar",
		"México": "Meksika",
		"Namibia": "Namibya",
		"Nepal": "Nepal",
		"Nicaragua": "Nikaragua",
		"Nigeria": "Nijerya",
		"Noruega": "Norveç",
		"Nueva Caledonia": "Yeni Kaledonya",
		"Nueva Zelanda": "Yeni Zelanda",
		"Níger": "Nijer",
		"Omán": "Umman",
		"Pakistán": "Pakistan",
		"Palestina": "Filistin",
		"Panamá": "Panama",
		"Papúa Nueva Guinea": "Papua Yeni Gine",
		"Paraguay": "Paraguay",
		"Países Bajos": "Hollanda",
		"Perú": "Peru",
		"Polonia": "Polonya",
		"Portugal": "Portekiz",
		"Puerto Rico": "Porto Riko",
		"RD Congo": "KD Kongo",
		"República Centroafricana": "Orta Afrika Cum.",
		"República Dominicana": "Dominik Cumhuriyeti",
		"Ruanda": "Ruanda",
		"Rumanía": "Romanya",
		"Rusia": "Rusya",
		"Samoa": "Samoa",
		"Samoa Americana": "Amerikan Samoası",
		"San Cristóbal y Nieves": "St. Kitts ve Nevis",
		"San Marino": "San Marino",
		"San Vicente y las Granadinas": "St. Vincent ve Grenadinler",
		"Santa Lucía": "Saint Lucia",
		"Santo Tomé y Príncipe": "São Tomé ve Príncipe",
		"Senegal": "Senegal",
		"Serbia": "Sırbistan",
		"Seychelles": "Seyşeller",
		"Sierra Leona": "Sierra Leone",
		"Singapur": "Singapur",
		"Siria": "Suriye",
		"Somalia": "Somali",
		"Sri Lanka": "Sri Lanka",
		"Sudáfrica": "Güney Afrika",
		"Sudán": "Sudan",
		"Sudán del Sur": "Güney Sudan",
		"Suecia": "İsveç",
		"Suiza": "İsviçre",
		"Surinam": "Surinam",
		"Tahití": "Tahiti",
		"Tailandia": "Tayland",
		"Tanzania": "Tanzanya",
		"Tayikistán": "Tacikistan",
		"Timor Oriental": "Doğu Timor",
		"Togo": "Togo",
		"Tonga": "Tonga",
		"Trinidad y Tobago": "Trinidad ve Tobago",
		"Turkmenistán": "Türkmenistan",
		"Turquía": "Türkiye",
		"Túnez": "Tunus",
		"Ucrania": "Ukrayna",
		"Uganda": "Uganda",
		"Uruguay": "Uruguay",
		"Uzbekistán": "Özbekistan",
		"Vanuatu": "Vanuatu",
		"Venezuela": "Venezuela",
		"Vietnam": "Vietnam",
		"Yemen": "Yemen",
		"Yibuti": "Cibuti",
		"Zambia": "Zambiya",
		"Zimbabue": "Zimbabve",
	},

	"herencia": {
		"ESTRELLAS": "YILDIZLAR",
		"KITS": "FORM",
		"VENTAJAS": "AVANTAJ",
		"COMPRAR": "AL",
		"ABIERTA": "AÇIK",
		"EL ALTA": "YENI KAR.",
		"DE SALIDA": "BAŞLANGIÇ",
		"DE TU HERENCIA": "MIRASINDAN",
		"SOLAR": "ARSA",
		"TE ALCANZA": "YETERLI",
		"TE FALTAN {0} ★": "{0} ★ EKSIK",
		"BOTAS DE BARRIO": "SOKAK KRAMPONU",
		"REFUERZOS": "TAKVIYE",
		"Vale en TODAS tus carreras, las de hoy y las que empieces.": "TUM kariyerlerinde geçerli, bugünküler de başlayacakların da.",
		"Al empezar una carrera las eliges en el paso TUS VENTAJAS.": "Bir kariyere başlarken AVANTAJLARIN adımında seçersin.",
		"Lo que se compra aquí no se gana: se hereda. Cada ventaja entra sola en toda carrera nueva, hoy y siempre.": "Burada alınan kazanılmaz: miras kalır. Her avantaj her yeni kariyere kendiliğinden girer, bugün ve her zaman.",
		"En tu herencia: entra en toda carrera nueva.": "Mirasında: her yeni kariyere girer.",
		"Abierta por TODAS LAS VENTAJAS: en tu herencia, en toda carrera nueva.": "TUM AVANTAJLAR ile açıldı: mirasında, her yeni kariyerde.",
		"Estrellas y la vitrina entera, con dinero real. Son de tu cuenta, no de una carrera: sobreviven a borrar ranuras.": "Yıldızlar ve vitrinin tamamı, gerçek parayla. Bir kariyerin değil hesabının malı: yuva silsen de kalırlar.",
		"Elige una pieza. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "Bir parça seç. Burada aldığın her şey her kariyerde seninle gelir, bugünkünde de gelecek olanlarda da.",
		"Desde hoy va contigo en cada carrera, las de ahora y las que vengan. No se devuelve.": "Bugünden itibaren her kariyerde seninle, şimdikilerde de gelecek olanlarda da. İadesi yok.",
		"La vitrina entera, en tu herencia: las veinticuatro en toda carrera nueva.": "Vitrinin tamamı mirasında: yirmi dördü de her yeni kariyerde.",
		"Ciento cincuenta estrellas: tu primera ventaja, la de nivel 1, sin esperar al primer retiro.": "Yüz elli yıldız: ilk avantajın, 1. seviyedeki, ilk emekliliği beklemeden.",
		"Toca una con cadenas y cómprala aquí mismo, con estrellas o con dinero real. Son tuyas para siempre: cada una entra sola en toda carrera nueva.": "Zincirli birine dokun ve hemen burada yıldızla ya da gerçek parayla satın al. Sonsuza dek senin: her biri her yeni kariyere kendiliğinden girer.",
		"Consigue más en LEGADO, desde el menú.": "Daha fazlasını menüdeki LEGACY bölümünden al.",
		"CANTERA DE ORO": "ALTIN ALTYAPI",
		"Toda carrera nueva arranca con 65 en las ocho habilidades en vez de 60. Es un año de entrenamiento antes de debutar.": "Her yeni kariyer sekiz yeteneğin hepsinde 60 yerine 65 ile başlar. İlk maçından önce bir yıllık antrenman demek.",
		"LA CARTERA DEL ABUELO": "DEDENIN CUZDANI",
		"Diez mil de salida en toda carrera nueva, encima de los cinco mil de siempre. Para no vivir al día el primer año.": "Her yeni kariyerde her zamanki beş binin üstüne başlangıçta on bin daha. İlk yıl kıt kanaat yaşamamak için.",
		"UN AGENTE QUE TE CONOCE": "SENI TANIYAN MENAJER",
		"EL SOLAR DE LA FAMILIA": "AILE ARSASI",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} compradas · {3} gastadas": "Her başarım ve her emeklilikle kazanılır: başarımlardan {0} · emekliliklerden {1} · satın alınan {2} · harcanan {3}",
		"No marca ningún logro: LOGROS y Game Center siguen contando sólo lo jugado.": "Hiçbir başarımı açmaz: BASARIMLAR ve Game Center yalnızca oynadığını saymaya devam eder.",
		"Pagas {0} ★ · te quedan {1} ★": "Ödediğin: {0} ★ · kalan: {1} ★",
		"Este retiro deja {0} ★ en tu herencia · {1} ★ por gastar en el menú": "Bu emeklilik mirasına {0} ★ bırakıyor · menüde harcanacak {1} ★",
		"Ventajas abiertas para tu próxima carrera: {0} de {1}": "Bir sonraki kariyerin için açılan avantajlar: {0} / {1}",
		"Toda carrera nueva arranca con unas BARRIO 90 nuevas puestas en vez de las de cantera. Se gastan, como todas.": "Her yeni kariyer altyapı kramponları yerine yepyeni bir BARRIO 90 ile başlar. Her krampon gibi o da aşınır.",
		"Tu agente empieza cada carrera creyendo en ti: llamadas y encargos desde el primer mes, no a media carrera.": "Menajerin her kariyere sana inanarak başlar: kariyerin ortasında değil, ilk aydan itibaren telefonlar ve işler.",
		"Un terreno donde construir, en toda carrera nueva. El terreno sin la casa: lo que levantes encima lo pagas tú.": "Her yeni kariyerde üzerine inşa edeceğin bir arsa. Evsiz arazi: üstüne ne dikersen parasını sen ödersin.",
		"CONSEGUIR ESTRELLAS": "YILDIZ AL",
		"UN PUÑADO DE ESTRELLAS": "BIR AVUÇ YILDIZ",
		"REINICIAR PARTIDO": "MAÇI YENIDEN AÇ",
		"YA PAGADO": "ODENDI",
		"La App Store no ha devuelto la ficha. Entra con conexión y vuelve a probar.": "App Store ürün bilgisini döndürmedi. İnternete bağlan ve tekrar dene.",
		"BRONCE": "BRONZ",
		"PLATA": "GUMUŞ",
		"DIAMANTE": "ELMAS",
		"BUEN TOQUE": "TATLI VURUŞ",
		"Le pegas con rosca desde niño: +4 de efecto desde el debut.": "Çocukluğundan beri topu falsolu vuruyorsun: ilk maçından itibaren +4 falso.",
		"PULMONES": "CIGERLER",
		"Ibas corriendo al colegio y de vuelta: +4 de físico desde el debut.": "Okula koşarak gidip gelirdin: ilk maçından itibaren +4 fizik.",
		"LOS AHORROS": "BIRIKIM",
		"La familia guardó para tu debut: veinticinco mil de salida en toda carrera nueva.": "Aile ilk maçın için para biriktirdi: her yeni kariyerde başlangıçta yirmi beş bin.",
		"El vestuario te sigue antes de que abras la boca: el equipo nunca por debajo de 55.": "Ağzını açmadan soyunma odası seni izler: takım hiçbir zaman 55'in altına düşmez.",
		"EL CEREBRO": "BEYIN",
		"Ves la jugada antes que nadie: +6 de visión y +3 de precisión y efecto.": "Oyunu herkesten önce görürsün: +6 vizyon, +3 isabet ve falso.",
		"EL RELOJ DEL ABUELO": "DEDENIN SAATI",
		"Un reloj de lujo que ya era de la familia: la prensa te mira distinto desde el primer día.": "Zaten ailenin olan lüks bir saat: basın sana ilk günden farklı bakar.",
		"SUPERDOTADO": "YETENEKLI",
		"Naciste para esto: 8 puntos de habilidad por repartir antes de debutar.": "Bunun için doğdun: ilk maçından önce dağıtacak 8 yetenek puanı.",
		"LA FORTUNA FAMILIAR": "AILE SERVETI",
		"Doscientos cincuenta mil de salida en toda carrera nueva. Nunca vas a vivir al día.": "Her yeni kariyerde başlangıçta iki yüz elli bin. Asla kıt kanaat yaşamayacaksın.",
		"La vitrina entera, en tu herencia: todas en toda carrera nueva.": "Vitrinin tamamı mirasında: hepsi her yeni kariyerde.",

		"BAJO LOS FOCOS": "SPOT IŞIKLARINDA",
		"CON PADRINO": "ARKASI GUÇLU",
		"LA DINASTIA": "HANEDAN",
		"CUERPO DE ATLETA": "ATLET VUCUDU",
		"PURO TALENTO": "SAF YETENEK",
		"Llegas ya famoso: la grada te corea, la prensa te sigue y el seleccionador sabe tu nombre.": "Zaten ünlü geliyorsun: tribün adını haykırır, basın peşinden gelir ve milli takım teknik direktörü seni tanır.",
		"Tu agente contesta, el vestuario te respeta y firmas el debut un rol más arriba.": "Menajerin telefonu açar, soyunma odası sana saygı duyar ve ilk sözleşmeni bir rol yukarıdan imzalarsın.",
		"Naces con herencia: un cuarto de millón en el banco, el terreno del abuelo y la casa del viejo.": "Varlıklı doğuyorsun: bankada çeyrek milyon, dedenin arsası ve babanın evi.",
		"Un cuerpo que no se rompe: piernas de niño, 20 % menos lesiones y fisio gratis toda la carrera.": "Kırılmayan bir vücut: genç bacaklar, %20 daha az sakatlık ve kariyer boyu ücretsiz fizyoterapist.",
		"Naces crack: 65 en todo, ocho puntos por repartir y un disparo que asusta desde el primer partido.": "Yıldız doğuyorsun: her şeyde 65, dağıtacak sekiz puan ve ilk maçtan korkutan bir şut.",
		"PACKS": "PAKET",
		"COMPRAR PACK": "PAKET AL",
		"TAMBIÉN TUYAS": "YINE SENIN",
		"Cinco packs de tres ventajas. Cada una entra sola en toda carrera nueva, hoy y siempre.": "Üçer avantajlık beş paket. Her biri her yeni kariyere kendiliğinden girer, bugün ve her zaman.",
		"En tu herencia: sus tres ventajas entran en toda carrera nueva.": "Mirasında: üç avantajı her yeni kariyere girer.",
		"YA TIENES {0} DE 3: con estrellas pagas sólo lo que te falta.": "3 TANEDEN {0} TANESI SENDE: yıldızla yalnızca eksiğini ödersin.",
		"Y {0} ventajas sueltas de antes, tuyas: entran igual en cada carrera.": "Ayrıca eskiden aldığın {0} tekli avantaj senin: onlar da her kariyere girer.",
		"Elige un pack. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "Bir paket seç. Burada aldığın her şey her kariyerde seninle gelir, bugünkünde de gelecek olanlarda da.",
		"Toca una con cadenas y compra su pack aquí mismo, con estrellas o con dinero real. Es tuyo para siempre: sus tres ventajas entran solas en toda carrera nueva.": "Zincirli birine dokun ve paketini hemen burada yıldızla ya da gerçek parayla al. Sonsuza dek senin: üç avantajı her yeni kariyere kendiliğinden girer.",
		"Las estrellas se ganan jugando: con cada logro y con cada retiro.": "Yıldızlar oynayarak kazanılır: her başarım ve her emeklilikle.",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} gastadas": "Her başarım ve her emeklilikle kazanılır: başarımlardan {0} · emekliliklerden {1} · harcanan {2}",

		"¡DOBLETE DE {0}!": "{0} DUBLE YAPTI!",
		"¡TERCERO DE {0}: HAT-TRICK!": "{0} YINE: HAT-TRICK!",
		"¡CUATRO DE {0}! SÚPER HAT-TRICK": "{0} DORT ATTI! GOL YAGMURU",
		"¡CINCO DE {0}! LA MANITA": "{0} BEŞ ATTI! DURMUYOR",
		"¡{1} GOLES DE {0}! DE LEYENDA": "{0}: {1} GOL! EFSANE",
		"¡OTRA ASISTENCIA DE {0}! VAN DOS": "{0} BIR ASIST DAHA! IKI OLDU",
		"¡TERCERA ASISTENCIA DE {0}!": "{0}: UÇUNCU ASIST!",
		"¡{1} ASISTENCIAS DE {0}!": "{0}: {1} ASIST!",
		"{0} YA LLEVA TRES PARADAS": "{0}: ŞIMDIDEN 3 KURTARIŞ",
		"¡CINCO PARADAS DE {0}!": "{0}: BEŞ KURTARIŞ!",
		"¡{1} PARADAS! {0} ES UN MURO": "{1} KURTARIŞ! {0} DUVAR GIBI",
		"{0} YA TENÍA AMARILLA ({1}')": "{0} ZATEN SARI GORDU ({1}')",
		"¡OTRA ROJA! TU EQUIPO SE QUEDA CON NUEVE": "BIR KIRMIZI DAHA! TAKIMIN 9 KIŞI KALDI",
		"¡OTRA ROJA! EL RIVAL SE QUEDA CON NUEVE": "BIR KIRMIZI DAHA! RAKIP 9 KIŞI KALDI",
		"YA SON TRES AMARILLAS DE TU EQUIPO": "TAKIMIN 3. SARI KARTI",
		"YA SON TRES AMARILLAS DEL RIVAL": "RAKIBIN 3. SARI KARTI",
		"¡CINCO AMARILLAS DE TU EQUIPO!": "TAKIMINA 5. SARI KART!",
		"¡CINCO AMARILLAS DEL RIVAL!": "RAKIBE 5. SARI KART!",
	},

	"salon_fama": {
		"SALÓN DE LA FAMA": "HALL OF FAME",
		"ESPERAN SU PLACA": "PLAKET BEKLIYOR",
		"TUS LEYENDAS": "EFSANELERIN",
		"Aún no hay placas. Cuando una carrera se retire, cuelga aquí su placa: su ranura queda libre para empezar otra y su historia se queda en este salón.": "Henüz plaket yok. Bir kariyer emekliye ayrıldığında plaketini buraya as: yuvası yenisine başlamak için boşalır, hikâyesi bu salonda kalır.",
		"RANURA {0} · RETIRADO": "YUVA {0} · EMEKLI",
		"Antes de colgarla, termina su despedida: entra en su carrera desde el menú.": "Asmadan önce vedasını bitir: menüden o kariyere gir.",
		"COLGAR SU PLACA": "PLAKETINI AS",
		"¿COLGAR SU PLACA?": "PLAKETI AS?",
		"La carrera de {0} sale de la RANURA {1} y se queda en el SALÓN DE LA FAMA. La ranura queda libre para empezar otra.": "{0} adlı oyuncunun kariyeri YUVA {1} içinden çıkar ve HALL OF FAME içinde kalır. Yuva yenisine başlamak için boşalır.",
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida y su museo se borran. Esto no se puede deshacer.": "Salonda plaketi kalır: rakamlar, kupalar ve kulüpler. Kayıt ve müzesi silinir. Bu geri alınamaz.",
		"No se pudo. La carrera sigue donde estaba.": "Olmadı. Kariyer olduğu yerde duruyor.",
		"COLGAR MI PLACA": "PLAKETIMI AS",
		"Pieza de Museo": "Müze Parçası",
		"Entrar por primera vez al museo de tu carrera.": "Kariyer müzene ilk kez gir.",
	},

	"casa_legado": {
		"MESA DE PING-PONG": "PING-PONG MASASI",
		"VITRINA DEL CAPITÁN": "KAPTAN VITRINI",
		"POSADERO PARA LORO": "PAPAGAN TUNEGI",
		"Mesa con red y palas. Juega al ping-pong contra un rival.": "Fileli ve raketli masa. Bir rakibe karşı ping-pong oyna.",
		"Tu capitanía bajo cristal. Conserva los nombramientos ganados.": "Kaptanlığın camın ardında. Kazandığın kaptanlıkları saklar.",
		"Rama de madera con agua y semillas. Tu loro descansa aquí.": "Su ve yemli tahta dal. Papağanın burada dinlenir.",
		"JUGAR PING-PONG": "PING-PONG OYNA",
		"VER BRAZALETES": "BANTLARI GOR",
		"TUS BRAZALETES": "BANTLARIN",
		"El nombramiento se gana jugando. La vitrina conserva tus brazaletes.": "Kaptanlık oynayarak kazanılır. Vitrin kaptanlık bantlarını saklar.",
		"Tu primer brazalete aparecerá cuando te nombren capitán.": "İlk kaptanlık bandın seni kaptan yaptıklarında görünecek.",
		"CAPITÁN DE LA SELECCIÓN": "MILLI TAKIM KAPTANI",
		"CAPITÁN DEL CLUB": "KULUP KAPTANI",
		"REGISTRADO EN LA TEMPORADA {0}": "SEZON {0} KAYDI",
		"Esta partida ya tenía la capitanía. Se conserva la vigente, sin inventar fechas anteriores.": "Bu kayıtta zaten bir kaptanlık vardı. Mevcut olan korunur, önceki tarihler uydurulmaz.",
		"PING-PONG": "PING-PONG",
		"A 11 puntos, con ventaja de 2. Punto decisivo en 20-20.": "11 sayıya, 2 fark. 20-20'de altın sayı.",
		"ARRASTRA AQUÍ PARA MOVER LA PALA": "RAKETI OYNATMAK IÇIN SURUKLE",
		"IZQUIERDA": "SOL",
		"CENTRO": "ORTA",
		"DERECHA": "SAG",
		"Mueve la pala con el dedo. El golpe es automático.": "Raketi parmağınla oynat. Vuruş otomatik.",
		"Compra la mesa de ping-pong para jugar.": "Oynamak için ping-pong masasını satın al.",
		"Elige dónde devolver: izquierda, centro o derecha.": "Nereye döndüreceğini seç: sol, orta ya da sağ.",
		"GANÓ EL RIVAL": "RAKIP KAZANDI",
		"REVANCHA": "ROVANŞ",
		"TU SAQUE": "SERVIS SEN",
		"SAQUE RIVAL": "SERVIS RAKIPTE",
		"SACAR": "VUR",
		"PUNTO PARA TI": "SAYI SENIN",
		"PUNTO PARA EL RIVAL": "SAYI RAKIBIN",
		"DEVOLUCIONES: {0}": "DONUŞLER: {0}",
		"AHORA ENFRENTE": "ARTIK RAKIP",
		"AHORA JUEGA EN {0}": "YENI TAKIMI: {0}",
		"DEBUTA": "ILK",
		"EL DEBUT DEL CHAVAL": "VELETIN ILK MAÇI",
		"EL QUE SE FUE": "GIDEN",
		"FICHA POR {0}": "TRANSFER: {0}",
		"FIRMA SU PLAYERA": "FORMASINI IMZALA",
		"Firmó su primer contrato. Quiso que estuvieras tú a su lado.": "İlk sözleşmesini imzaladı. Yanında senin olmanı istedi.",
		"Hoy entra por primera vez. Tú te acuerdas de lo que se siente.": "Bugün ilk kez oyuna giriyor. Nasıl bir his olduğunu hatırlıyorsun.",
		"LA CANTERA": "ALTYAPI",
		"LLEGA DE LA CANTERA": "ALTYAPIDAN GELIYOR",
		"La encontró colgada en su taquilla. No hizo falta decir nada.": "Onu dolabında asılı buldu. Bir şey söylemeye gerek yoktu.",
		"Lo viste debutar a tu lado. Hoy te va a tocar marcarlo.": "Yanında ilk maçına çıktığını gördün. Bugün onu sen tutacaksın.",
		"Lo viste debutar. Ahora lo cuentan en la tele del bar.": "İlk maçını gördün. Şimdi bardaki televizyonda anlatıyorlar.",
		"PRIMER CONTRATO": "ILK SOZLESME",
		"PRIMER CONTRATO PROFESIONAL": "ILK PROFESYONEL SOZLESME",
		"Podía correr a la grada. Corrió hacia ti.": "Tribüne koşabilirdi. Sana koştu.",
		"SU PRIMER CONTRATO": "ILK SOZLESMESI",
		"SU PRIMER GOL": "ILK GOLU",
		"Se quedó con la playera en blanco en las manos. No dijo nada.": "Elinde boş forma kaldı. Tek kelime etmedi.",
		"TU DORSAL ES SUYO": "FORMA NUMARAN ONUN",
		"{0} AÑOS · CANTERA": "{0} YAŞ · ALTYAPI",
		"{0} AÑOS · PRIMER GOL": "{0} YAŞ · ILK GOL",
		"{0} AÑOS · PRIMER PARTIDO": "{0} YAŞ · ILK MAÇ",
		"«Mi sueño es jugar junto a ti pronto.»": "«Hayalim yakında seninle birlikte oynamak.»",
		"«Mi sueño es jugar junto a ti pronto.» Ya está aquí.": "«Hayalim yakında seninle birlikte oynamak.» Artık burada.",
		"—¿Me firmas la playera?": "—Formamı imzalar mısın?",
		"PRESENTADO": "TANITILDI",
		"Tu ahijado ya tiene dorsal. Esta temporada jugáis juntos.": "Himayendeki çocuğun artık forma numarası var. Bu sezon birlikte oynuyorsunuz.",
		"DESPUÉS DEL ENTRENO": "ANTRENMAN SONRASI",
		"—Me quedé para verte. ¿Me enseñas a pegarle como tú?": "—Seni izlemek için kaldım. Bana senin gibi vurmayı öğretir misin?",
		"IRTE": "GIT",
		"UNA HORA MÁS": "BIR SAAT DAHA",
		"Se fue a casa ya de noche, con el balón bajo el brazo.": "Hava karardıktan sonra eve gitti, top koltuğunun altında.",
		"Recogió el balón y se quedó tirando solo.": "Topu aldı ve tek başına şut çekmeye devam etti.",
		"SU PADRINO": "HAMISI",
		"SUBE AL PRIMER EQUIPO": "A TAKIMA YUKSELIYOR",
		"—Lo subimos contigo. ¿Quieres ser su padrino?": "—Onu seninle birlikte yukarı alıyoruz. Hamisi olmak ister misin?",
		"TU AHIJADO": "HIMAYENDEKI",
		"La temporada que viene, jugará a tu lado.": "Gelecek sezon senin yanında oynayacak.",
		"SIGUE EN LA CANTERA": "ALTYAPIDA KALIYOR",
		"El director asintió. El niño miró al suelo.": "Direktör başını salladı. Çocuk yere baktı.",
		"El Ahijado": "Himayedeki Çocuk",
		"Apadrinar a un niño de la cantera hasta el primer equipo.": "Altyapıdan bir çocuğu A takıma kadar kanatlarının altına al.",
		"VER SALÓN": "EFSANELER",
		"ESCALÓN": "KADEME",
		"AQUÍ EMPEZASTE": "BASLANGIC",
		"PARED DE REFLEJOS": "REFLEKS DUVARI",
		"MEMORAMA": "HAFIZA",
		"JUGAR REFLEJOS": "REFLEKS OYNA",
		"JUGAR MEMORAMA": "HAFIZA OYNA",
		"¡RÉCORD!": "REKOR!",
		"ANTES {0}": "ONCEKI {0}",
		"RÉCORD {0}": "REKOR {0}",
		"RÉCORDS · {0}": "REKORLAR · {0}",
		"MS": "MS",
		"NO TOQUES": "DOKUNMA",
		"TOCA": "DOKUN",
		"REFLEJO": "TEPKI",
		"TIEMPO": "SURE",
		"COMPLETADO": "TAMAMLANDI",
		"MEMORIZA": "EZBERLE",
		"MOVIMIENTOS": "HAMLE",
		"TU COLECCIÓN": "KOLEKSIYONUN",
		"{0} S": "{0} SN",
		"memoramaEN JUEGO": "OYUNDA",
		"memoramaPAREJAS": "ÇIFTLER",
		"reflejosRACHA": "SERI",
		"Pared de luces: toca la que se enciende. Récord de reflejos.": "Işık duvarı: yanana dokun. Refleks rekoru.",
		"Mesa de cartas con tu colección: encuentra las parejas.": "Koleksiyonunla kart masası: çiftleri bul.",
	},


	"pique": {
		"CALMA": "SAKIN",
		"ENCÁRATE": "KAFA TUT",
		"{0} TE BUSCA": "{0} PEŞINDE",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE ENCARAN": "{0} ARKADAN TEKMELEDI: {1} ILE KAFA KAFAYA",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1}, QUE NO RESPONDE": "{0} ARKADAN TEKMELEDI, {1} TEPKI VERMEDI",
		"notaTEMPLE": "SAKINLIK",
		"notaAMARILLA": "SARI KART",
		"Otra vez le ganas a {0}. Ya no le hace ninguna gracia.": "{0} karşısında yine kazandın. Artık hiç hoşuna gitmiyor.",
		"{0} ya te tiene entre ceja y ceja.": "{0} artık sana kafayı taktı.",
		"{0} va a por ti, no a por el balón. Patada por detrás.": "{0} topa değil sana gidiyor. Arkadan tekme.",
		"Ni mira la pelota: {0} te pega por detrás.": "Topa bakmıyor bile: {0} arkadan vuruyor.",
		"Te levantas y te vas a por {0}. Frente con frente.": "Kalkıyorsun ve {0} ile burun buruna geliyorsun.",
		"No te lo callas: cara a cara con {0}, y la grada se enciende.": "Susmuyorsun: {0} ile yüz yüze, tribün alev alıyor.",
		"{0} te busca y no te encuentra. Te das la vuelta.": "{0} tepki arıyor, bulamıyor. Arkanı dönüyorsun.",
		"Ni lo miras. {0} se queda con el dedo en el aire.": "Yüzüne bile bakmıyorsun. {0} parmağı havada kalıyor.",
		"{1} NO LE PIERDE LA PISTA A {0}": "{1} GOZUNU {0} UZERINDEN AYIRMIYOR",
		"{0} SE LE ESCAPA A {1} UNA Y OTRA VEZ": "{0} YINE KAÇTI, {1} YETIŞEMIYOR",
		"AMBIENTE CALDEADO ENTRE {0} Y {1}": "{0} VE {1} ARASINDA GERGINLIK",
		"CADA BALÓN ENTRE {0} Y {1} ES UNA GUERRA": "{0} VE {1} ARASINDA HER TOP SAVAŞ",
		"{0} NO ENTRA AL TRAPO Y SIGUE A LO SUYO": "{0} OLTAYA GELMIYOR, IŞINE BAKIYOR",
		"{1} BUSCA LA REACCIÓN DE {0} Y NO LA ENCUENTRA": "{1} TAHRIK EDIYOR, {0} TEPKI VERMIYOR",
		"SIN {1} EN EL CAMPO, {0} RESPIRA": "{1} SAHADA YOK, {0} RAHATLADI",
		"{1} JUEGA CON LA AMARILLA A CUESTAS": "{1} SARI KARTLA OYNUYOR",
		"{0} JUEGA AL LÍMITE CON LA AMARILLA": "{0} SARI KARTLA SINIRDA",
		"Viven en tu casa y cobran cada jornada.": "Senin evinde yaşıyorlar ve her hafta para alıyorlar.",

		"¡Derribaste el dron de la tele!": "Televizyon dronunu düşürdün!",
		"Señal Perdida": "Sinyal Kesildi",
		"Derribar el dron de la tele de un balonazo.": "Televizyon dronunu bir şutla düşür.",
		"Algunos partidos los graba un dron desde el cielo.": "Bazı maçları gökyüzünden bir dron çeker.",

		"¡Balón de playa en el área!": "Ceza sahasında plaj topu!",
		"¡Desvío en el balón de playa!": "Plaj topundan sekti!",
		"Gol de Playa": "Plaj Golü",
		"Marcar un gol desviado por el balón de playa.": "Plaj topundan seken bir gol at.",
		"A veces cae algo inflable desde la grada.": "Bazen tribünden şişme bir şey düşer.",

		"¡Le volaste el celular a un fan!": "Bir taraftarın telefonunu uçurdun!",
		"¡Tu balonazo se hizo viral!": "Füzen viral oldu!",
		"REC": "REC",
		"{0} vistas": "{0} izlenme",
		"Se Hizo Viral": "Viral Oldu",
		"Tirarle el celular a un fan que te graba.": "Seni çeken bir taraftarın telefonunu elinden düşür.",
		"Hay quien graba el partido desde detrás de la valla.": "Bazıları maçı reklam panolarının arkasından çeker.",
		"Tangana en pleno derbi: {0} te empuja y se forma el corro.": "Derbinin ortasında arbede: {0} seni itiyor ve etrafında halka oluşuyor.",
		"Empujones entre los dos equipos. {0} lo empezó y el árbitro tiene que meterse en medio.": "İki takım arasında itişme. {0} başlattı ve hakem araya girmek zorunda.",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE MONTA LA TANGANA": "{0} ARKADAN TEKMELEDI: {1} ILE ARBEDE CIKTI",
		"LA TANGANA DEJA EL DERBI AL ROJO VIVO": "ARBEDE DERBIYI KIZISTIRDI",
		"DESDE LA TANGANA, {1} Y {0} NO SE QUITAN LA VISTA": "ARBEDEDEN BERI {1} VE {0} GOZ GOZE",
		"{0} ARRASTRA LA AMARILLA DE LA TANGANA": "{0} ARBEDEDEN SARI KARTLI",
		"Y en los bares sólo se habla de la tangana.": "Kahvehanelerde de sadece arbede konuşuluyor.",
	},


	"editor_estadio_derbi": {
		"ESTADIO": "STADYUM",
		"estadioPLANTA": "PLAN",
		"VOLVER AL ESTADIO AUTOMATICO": "OTOMATIK STADYUMA DON",
		"El nombre sale en la carátula de TV y en el hub. La planta es la forma de las gradas en el partido.": "Ad, TV ekranında ve ana ekranda çıkar. Plan, maçta tribünlerin şeklidir.",
		"SIN DERBI": "DERBI YOK",
		"VOLVER AL DERBI AUTOMATICO": "OTOMATIK DERBIYE DON",
		"Es el partido con más ambiente del año. Tiene que ser del mismo país; puede ser de otra división.": "Yılın en atmosferli maçı. Aynı ülkeden olmalı; başka bir ligden olabilir.",
		"ELIGE SU RIVAL DE DERBI": "DERBI RAKIBINI SEÇ",
		"Tiene que ser del mismo país.\nPuede ser de otra división.": "Aynı ülkeden olmalı.\nBaşka bir ligden olabilir.",
		"DERBI DE: {0}": "DERBI: {0}",
		"{0} y {1} pasan a ser rivales de derbi.": "{0} ve {1} artık derbi rakibi.",
		"Los rivales que tenían hasta hoy se quedan sin derbi, y el juego les busca otro.": "Bugüne kadarki rakipleri derbisiz kalır ve oyun onlara yenisini bulur.",
		"AÑADIR OTRO DERBI": "DERBI EKLE",
		"Hasta tres rivales; el primero es el derbi principal.": "En fazla üç rakip; ilki ana derbidir.",
		"Se suma a los derbis que ya tenían elegidos.": "Zaten seçtikleri derbilere eklenir.",
		"Es el partido con más ambiente del año. Puede ser de cualquier confederación; sus otros rivales de siempre se quedan.": "Yılın en atmosferli maçı. Herhangi bir konfederasyondan olabilir; diğer bilindik rakipleri kalır.",
		"Puede ser de cualquier confederación.": "Herhangi bir konfederasyondan olabilir.",
		"El rival que cada una tenía elegido vuelve a los suyos de siempre.": "Her birinin seçtiği rakip, bilindik rakiplerine döner.",
		"derbi con selección desconocida: {0}": "bilinmeyen milli takımla derbi: {0}",
		"derbi consigo misma: {0}": "kendisiyle derbi: {0}",
		"Las carreras ya empezadas lo estrenan al volver a cargar la partida.": "Başlamış kariyerlerde, kayıt yeniden yüklendiğinde geçerli olur.",
		"CONFIRMAR DERBI": "DERBIYI ONAYLA",
		"· DERBI: {0}": "· DERBI: {0}",
		"· ESTADIO": "· STADYUM",
		"derbi": "derbi",
		"derbis": "derbi",
		"Su estadio y su derbi, también.": "Stadyumu ve derbisi de.",
		"derbi con club desconocido: {0}": "bilinmeyen kulüple derbi: {0}",
		"demasiados derbis para: {0}": "şunun için çok fazla derbi: {0}",
		"derbi entre países distintos: {0}": "farklı iki ülke arasında derbi: {0}",
		"CUENCO CERRADO": "KAPALI KASE",
		"CUATRO TRIBUNAS": "DORT TRIBUN",
		"HERRADURA": "AT NALI",
		"TRIBUNA EN L": "L TRIBUN",
		"DOS TRIBUNAS": "IKI TRIBUN",
		"CON PISTA": "PISTLI",
		"CUENCO REDONDO": "YUVARLAK KASE",
		"COLISEO": "KOLEZYUM",
		"OCTAGONO": "SEKIZGEN",
		"CATEDRAL": "KATEDRAL",
		"VELAS": "YELKEN",
		"DOS ANILLOS": "IKI HALKA",
		"MEMBRANA": "MEMBRAN",
		"TRIBUNA ALTA": "UZUN TRIBUN",
		"CALDERA": "KAZAN",
		"TRIBUNA DOBLE": "ÇIFT TRIBUN",
		"TECHO DE TELA": "KUMAŞ ÇATI",
		"FONDO ALTO": "DIK ARKA",
		"FONDO EN BLOQUES": "BLOKLU ARKA",
		"SIN FONDO, ARBOLES": "ARKA YOK, AGAÇLAR",
		"TECHO A DOS AGUAS": "BEŞIK ÇATI",
		"CAMPO HUNDIDO": "ÇUKUR SAHA",
		"PANTALLA GIGANTE": "DEV EKRAN",
		"ARCO AL FONDO": "ARKADA KEMER",
		"TERRAPLEN": "TOPRAK SET",
		"GRADAS TUBO": "BORU TRIBUN",
		"MURO DE PIE": "AYAKTA TRIBUN",
		"TRES ANILLOS": "UÇ HALKA",
		"FONDO DE BANDERAS": "BAYRAKLI ARKA",
		"TRIBUNA CON POSTES": "DIREKLI TRIBUN",
		"TORRE DEL RELOJ": "SAAT KULESI",
		"CAMPO CON COCHES": "ARABALI SAHA",
		"FONDO DE CHIMENEAS": "BACALI ARKA",
		"PIEL ENVOLVENTE": "SARAN CEPHE",
		"LATERAL PLANO": "DUZ YAN",
		"ANILLO COLGADO": "ASILI HALKA",
		"TECHO DE DIENTES": "DIŞLI ÇATI",
		"COLUMNATA": "SUTUNLU",
		"TECHO FLOTANTE": "YUZEN ÇATI",
		"TORRES CON RAMPA": "RAMPALI KULE",
		"CALABAZA": "KABAK",
		"PUERTA MONUMENTAL": "ANIT KAPI",
		"OLA DE VIDRIO": "CAM DALGA",
		"OLIMPICO DE PIEDRA": "TAŞ OLIMPIYAT",
		"COLOSO": "KOLOS",
		"CAJON VERTICAL": "DIKEY KUTU",
		"HERRADURA DE TRES PISOS": "UÇ KATLI AT NALI",
		"TRES GRADAS ABIERTAS": "UÇ AÇIK TRIBUN",

		"TU ESTADO": "DURUMUN",
		"LO DECIDE LA DIRECTIVA": "YONETIM KARAR VERIR",
		"SI PAGAN": "ODERLERSE",
		"La directiva te bloquea {0} ofertas": "Yönetim senin için gelen {0} teklifi engelliyor",
		"Tu club rechaza las ofertas por ti: sólo la cláusula te saca.": "Kulübün senin için gelen teklifleri reddediyor: seni ancak serbest kalma bedeli çıkarır.",
		"Tu club no te retiene.": "Kulübün seni tutmuyor.",
		"Si alguien paga lo que pide tu club, te vende.": "Biri kulübünün istediği bedeli öderse seni satar.",
		"Hoy tu club no negocia por ti.": "Kulübün şu an senin için pazarlık yapmıyor.",
		"Tu club te ofrece a quien pregunte.": "Kulübün seni soran herkese teklif ediyor.",
		"No estás en venta.": "Satılık değilsin.",
		"La directiva dijo NO: no cuentas lo bastante. Puedes volver a pedirlo la temporada que viene.": "Yönetim HAYIR dedi: yeterince önemli değilsin. Gelecek sezon yeniden isteyebilirsin.",
		"PEDIR QUE NO ME VENDAN": "SATILMAMAYI ISTE",
		"¿PEDIR QUE NO TE VENDAN?": "SATILMAMAYI ISTER MISIN?",
		"Lo decide la directiva, una vez por temporada. Si dice que sí, rechaza las ofertas por ti este año. La cláusula sigue valiendo.": "Yönetim karar verir, sezonda bir kez. Evet derse bu yıl senin için gelen teklifleri reddeder. Serbest kalma bedeli geçerli olmaya devam eder.",
		"LA DIRECTIVA DICE SÍ": "YONETIM EVET DEDI",
		"LA DIRECTIVA DICE NO": "YONETIM HAYIR DEDI",
		"Pedir el traspaso te pone en venta y te quita minutos hasta que salgas. La cesión, si no eres titular.": "Transfer istemek seni satış listesine koyar ve gidene kadar süre kaybettirir. Kiralık ise, ilk 11'de değilsen.",

		"Quiere venir: sale sin cláusula (+{0} %).": "Gelmek istiyor: serbest kalma bedeli olmadan ayrılır (+%{0}).",

		"TU OFERTA": "TEKLIFIN",
		"OFRECER": "TEKLIF",
		"INTENTOS": "DENEME",
		"PACTADO": "ANLAŞMA",
		"Trato cerrado ({0}). Te queda {1}.": "Anlaşma tamam ({0}). Kalan: {1}.",
		"No aceptan. Piden {0}.": "Kabul etmiyorlar. İstedikleri: {0}.",

		"NO FIRMAR": "IMZALAMA",
		"TE FUISTE SIN FIRMAR": "IMZASIZ GITTIN",
		"La valla te vio pasar. Mañana lo contará.": "Bariyerdekiler geçip gittiğini gördü. Yarın herkese anlatacaklar.",
		"Cien Firmas": "Yüz İmza",
		"Firmar 100 autógrafos.": "100 imza dağıt.",
		"Mil Firmas": "Bin İmza",
		"Firmar 1.000 autógrafos.": "1.000 imza dağıt.",
		"La Mano de Oro": "Altın El",
		"Firmar 10.000 autógrafos.": "10.000 imza dağıt.",
		"UN FAN TE PARA": "TARAFTAR GELDI",
		"EN EL AEROPUERTO": "HAVALIMANINDA",
		"EN EL TÚNEL": "TUNELDE",
		"EN LA CENA": "YEMEKTE",
		"SEMANA DE DERBI": "DERBI HAFTASI",
		"{0} AUTÓGRAFOS EN TU CARRERA": "KARIYERINDE {0} IMZA",
		"FIRMA EN LA TERMINAL": "TERMINALDE IMZA",
		"El grupo esperó un minuto en la puerta de embarque.": "Kafile biniş kapısında bir dakika bekledi.",
		"DIRECTO AL AVIÓN": "DOGRU UÇAGA",
		"Ni lo miraste. El grupo llegó puntual.": "Bakmadın bile. Kafile vaktinde vardı.",
		"EL NIÑO DEL TÚNEL": "TUNEL ÇOCUGU",
		"Sale al campo de tu mano con tu firma puesta.": "Senin imzanı taşıyarak elini tutup sahaya çıkıyor.",
		"LO DEJASTE PLANTADO": "ONU EKTIN",
		"Las cámaras del túnel lo grabaron todo.": "Tünel kameraları her şeyi kaydetti.",
		"FIRMA EN LA CENA": "YEMEKTE IMZA",
		"A tu pareja se le enfrió el plato.": "Partnerinin yemeği soğudu.",
		"ESTA NOCHE NO": "BU GECE OLMAZ",
		"Hoy cenabas con tu pareja. Lo entendió… o casi.": "Bu akşam partnerinle yemekteydin. Anladı… neredeyse.",
		"FIRMASTE AL RIVAL": "RAKIBE IMZA ATTIN",
		"Tu firma en la camiseta del rival. Mañana sale en portada.": "İmzan rakibin formasında. Yarın manşette.",
		"ESA CAMISETA, NO": "O FORMA OLMAZ",
		"Tu grada aplaude que no la firmaras.": "Taraftarın imzalamamanı alkışlıyor.",
		"EL HINCHA DE SIEMPRE": "SADIK TARAFTAR",
		"NO VOLVERÁ": "BIR DAHA GELMEYECEK",
		"Le firmaste la primera hace {0} temporadas. Sigue aquí.": "İlk imzanı ona {0} sezon önce verdin. Hâlâ burada.",
		"Ahora trae a su hijo. Hace {0} temporadas, el niño era él.": "Artık oğlunu getiriyor. {0} sezon önce o çocuk oydu.",
		"Te esperó {0} temporadas. No volverá a pedírtelo.": "Seni {0} sezon bekledi. Bir daha istemeyecek.",
		"EL FOTÓGRAFO": "FOTOGRAFÇI",
		"La foto era con {0}. Tú sólo sujetabas el móvil.": "Fotoğraf {0} ile çekildi. Sen sadece telefonu tuttun.",
	},


	"descanso_pactado": {
		"PEDIR DESCANSO": "DINLENME ISTE",
		"EL MÍSTER DICE QUE NO": "HOCA HAYIR DIYOR",
		"Hoy no. Éste es de los que se juegan.": "Bugün olmaz. Bu, oynanması gereken maçlardan.",
		"Hoy te necesito. Este partido pesa demasiado.": "Bugün sana ihtiyacım var. Bu maç çok önemli.",
		"Aquí juegan los once de siempre. Tú también.": "Burada hep oynayan on bir oynar. Sen de.",
		"Contra éste te quiero en el campo. Juegas.": "Bunlara karşı seni sahada istiyorum. Oynuyorsun.",
		"Me lo pides tú y te lo concedo. ¿Banca por si hace falta, descansas del todo, o al final juegas?": "Bunu sen istiyorsun, kabul ediyorum. Gerekirse yedek, tam dinlenme ya da sonunda oynarsın?",
		"¿JUEGAS O DESCANSAS?": "MAÇ MI, DINLENME MI?",
		"EL MÍSTER DECIDE": "HOCANIN KARARI",
		"Entonces sales de inicio. Que se note que lo querías.": "O zaman ilk 11'de başlıyorsun. İstediğini göster.",
		"Te quiero fresco, pero a mano. Si se tuerce, entras.": "Seni dinç istiyorum ama elimin altında. İşler ters giderse giriyorsun.",
		"Descansa. Te quiero entero para lo que viene.": "Dinlen. Sıradakiler için seni sapasağlam istiyorum.",
		"Contra éste no te necesito de inicio y después viene {0}. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "Bu rakibe karşı seni ilk 11'de istemiyorum, sonra da {0} maçı var. Oynar mısın, gerekirse diye yedek kulübesinde mi beklersin, yoksa dinlenir misin?",
		"Contra éste no te necesito de inicio. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "Bu rakibe karşı seni ilk 11'de istemiyorum. Oynar mısın, gerekirse diye yedek kulübesinde mi beklersin, yoksa dinlenir misin?",
		"BANCA, POR SI HACE FALTA": "YEDEK, HER IHTIMALE",
		"DECISIÓN": "KARAR",
		"EL MÍSTER QUIERE HABLAR CONTIGO": "HOCA SENINLE KONUŞMAK ISTIYOR",
		"DESCANSAS": "DINLEN",
		"Te quiere entero para el partido grande que viene.": "Hoca seni gelecek büyük maç için sapasağlam istiyor.",
		"Llegas justo de energía. Hoy no te vistes.": "Enerjin kıt. Bugün kadroda değilsin.",
		"Contra este rival te guarda. Si el partido se tuerce, entras.": "Bu rakibe karşı seni saklıyor. Maç ters giderse giriyorsun.",
		"DESPUÉS": "SONRA",
		"EL MÍSTER TE GUARDA": "HOCA SENI SAKLIYOR",
		"Hoy el partido no se juega nada. Sólo entras si se lesiona un compañero.": "Bugünkü maçın bir önemi yok. Ancak bir takım arkadaşın sakatlanırsa girersin.",
		"Se mira el global de la eliminatoria.": "Eşleşmenin toplam skoru önemli.",
		"Si el partido se tuerce, el míster te llama.": "Maç ters giderse hoca seni çağırır.",
		"PERDIENDO": "GERIDE",
		"EMPATANDO": "BERABERE",
		"GANANDO POR 1": "1 GOL ONDE",
		"LO VES DESDE CASA": "EVDEN IZLIYORSUN",
		"Ganaron sin ti. Llegas entero a lo que viene.": "Sensiz kazandılar. Sıradakine dinç geliyorsun.",
		"Empate sin ti. La prensa pregunta dónde estabas.": "Sensiz beraberlik. Basın neredeydin diye soruyor.",
		"Perdieron sin ti. La prensa pregunta dónde estabas.": "Sensiz kaybettiler. Basın neredeydin diye soruyor.",
		"DÍA LIBRE · LO VES DESDE CASA": "IZIN GUNU · EVDEN IZLIYORSUN",
		"EL MÍSTER NO TE NECESITA HOY · TE QUEDAS EN LA BANCA": "HOCA BUGUN SENI ISTEMIYOR · YEDEKTESIN",
		"JUEGAS O DESCANSAS": "OYNA YA DA DINLEN",
		"POR SI HACE FALTA": "HER IHTIMALE",
		"DIA LIBRE": "IZIN GUNU",

		"CLASIFICADOS": "TUR ATLADIK",
		"ELIMINADOS": "ELENDIK",
		"AL {0}": "{0} BILETI",
		"SIN {0}": "{0} YOK",
		"FUERA DEL TORNEO": "TURNUVA DIŞI",
		"Un país entero lo celebra contigo.": "Bütün bir ülke seninle kutluyor.",
		"Un país entero apagó la tele.": "Bütün bir ülke televizyonu kapattı.",
	},

	"banca_juego": {
		"CHIN CHAN PU": "TAŞ KAGIT MAKAS",
		"BOTELLA DE PIE": "ŞIŞE ÇEVIRME",
		"DOMINADAS": "TOP SEKTIRME",
		"CONTRA {0}": "KARŞI: {0}",
		"TU COMPAÑERO": "ARKADAŞIN",
		"¡ELIGE!": "SEÇ!",
		"CHIN": "TAŞ",
		"CHAN": "KAGIT",
		"¡PU!": "MAKAS!",
		"¡TUYA!": "SENIN!",
		"¡SUYA!": "ONUN!",
		"¡OTRA!": "YINE!",
		"¡LANZA!": "AT!",
		"SU TURNO": "SIRASI",
		"¡DE PIE!": "DIK!",
		"¡SE CAE!": "DUŞTU!",
		"¡TOCA!": "VUR!",
		"¡GANASTE!": "KAZANDIN!",
		"Hoy recoge él los conos.": "Bugün konileri o topluyor.",
		"Hoy recoges tú los conos.": "Bugün konileri sen topluyorsun.",
		"Los conos, a medias.": "Koniler yarı yarıya.",
		"CREAR LIGA": "LIG KUR",
		"UNIRSE": "KATIL",
		"UNIRSE A UNA LIGA": "LIGE KATIL",
		"TERMINADA": "Bitti",
		"{0} D": "{0} G",
		"LIGA NO ENCONTRADA": "LIG BULUNAMADI",
		"LIGA LLENA": "Lig dolu",
		"DEMASIADAS LIGAS": "Çok fazla lig",
		"Crea una liga y pasa su código: 28 días, gana quien más sume.": "Bir lig kur ve kodunu paylaş: 28 gün, en çok toplayan kazanır.",
		"Únete a mi liga de Football Legacy: código {0}": "Football Legacy ligime katıl: kod {0}",
		"Reto de {0}": "{0} meydan okudu",
		"Tienes un reto": "Bir meydan okuman var",
		"Se acaba pronto: juégalo antes de que venza.": "Yakında bitiyor: süresi dolmadan oyna.",
		"PADRINO": "AKIL HOCASI",
		"Embajador": "Elçi",
		"Que 3 amigos que invitaste jueguen 10 partidos.": "Davet ettiğin 3 arkadaşın 10 maç oynasın.",
		"Fundador": "Kurucu",
		"Que 10 amigos que invitaste jueguen 10 partidos.": "Davet ettiğin 10 arkadaşın 10 maç oynasın.",
		"~{0} BALONES": "~{0} TOP",
		"+{0} SUELDO": "+{0} MAAŞ",
		"+1 BALÓN EN CASA": "EVDE +1 TOP",
		"-1 BALÓN EN CASA": "EVDE -1 TOP",
		"DESDE CERO": "Sıfırdan",
		"CON TU CARRERA": "Kariyerinle",
		"Sólo cuenta una carrera que empieces después de crearla.": "Yalnızca oluşturduktan sonra başlattığın kariyer sayılır.",
		"Cuenta lo que sumes desde hoy con tu carrera.": "Bugünden itibaren kariyerinle kazandıklarını sayar.",
		"Empieza una carrera nueva para contar en esta liga.": "Bu ligde sayılmak için yeni bir kariyere başla.",
		"Podio": "Podyum",
		"Acabar entre los 3 primeros de una liga de amigos.": "Bir arkadaş liginde ilk 3'te bitir.",
		"Campeón de liga": "Lig şampiyonu",
		"Ganar una liga de amigos.": "Bir arkadaş ligi kazan.",
		"Tricampeón": "Üç kez şampiyon",
		"Ganar 3 ligas de amigos.": "3 arkadaş ligi kazan.",
		"OTRA TEMPORADA": "Yeni sezon",
		"Liga {0}: último día": "{0} ligi: son gün",
		"Vas {0}º. Aún puedes remontar.": "{0}. sıradasın. Hâlâ yükselebilirsin.",
		"Aún puedes sumar antes del final.": "Bitmeden önce hâlâ ekleyebilirsin.",

		"PECHO Y VOLEA": "GOGUS VE VOLE",
		"¡CLAVADO!": "KUSURSUZ!",
		"¡CONTROL!": "KONTROL!",
		"¡SE TE ESCAPA!": "KAÇTI!",
		"¡DESLIZA HACIA ÉL!": "ONA DOGRU KAYDIR!",
		"TOCA EN EL ARO": "HALKADA DOKUN",
		"¡AL PIE!": "AYAGINA!",
		"¡CON ROSCA!": "FALSOLU!",
		"¡CORTO!": "KISA!",
		"¡LARGO!": "UZUN!",
		"¡DESVIADO!": "ISABETSIZ!",
		"CONTROL Y VOLEA": "KONTROL VE VOLE",
		"¡GLOBO!": "AŞIRTMA!",
		"PULSA {0} EN EL ARO": "HALKADA {0} BAS",
		"STICK: APUNTA · {0}: GLOBO": "ÇUBUK: NISAN AL · {0}: ASIRT",
		"EL 1-7": "1-7",
		"Juega con una de las dos selecciones contra la otra.": "İki milli takımdan biriyle diğerine karşı oyna.",
		"EL TREN": "TREN",
		"Un gol en una final: te tiras en plancha y detrás de ti se tiran los cuatro más cerca, uno a uno, cada uno a los pies del de delante.": "Finalde gol: karnının üstüne kayarsın, en yakın dört arkadaşın da teker teker arkandan atlar, her biri öndekinin ayağının dibine.",
		"EL CORRO": "HALKA",
		"Con el vestuario a tu lado: tus compañeros te rodean aplaudiendo y tú festejas en medio.": "Soyunma odası arkandayken: takım arkadaşların seni alkışlayarak çevreler, sen de ortada sevinirsin.",
		"LA OREJA": "KULAK",
		"Tu grada te está cantando: te giras hacia ella con las manos en las orejas y la grada se viene abajo. Sólo delante de los tuyos.": "Tribünün senin için şarkı söylüyor: ellerin kulaklarında ona dönersin ve tribün yıkılır. Sadece kendi taraftarının önünde.",
		"LA MANO DE DIOS": "TANRI ELI",
		"EL GOL FANTASMA": "HAYALET GOL",
		"LA MANO EN LA LÍNEA": "ÇIZGIDE EL",
		"EL PENAL AL CIELO": "PENALTI GOKTE",
		"EL MINUTO 116": "DAKIKA 116",
		"FUE CON LA MANO": "ELLE ATILDI",
		"NO LO DIERON": "VERILMEDI",
		"ESTAMPAS LUNA": "ESTAMPAS LUNA",
		"CEREALES ALBA": "CEREALES ALBA",
		"AUTOCARES ATLAS": "AUTOCARES ATLAS",
		"PIXEL ARENA": "PIXEL ARENA",
		"Tu cara en el álbum del barrio. Cada gol, un sobre más.": "Mahalle albümünde senin yüzün var. Her golde bir paket daha satılır.",
		"Tu cara en la caja del desayuno. Pagan fijo y piden poco.": "Yüzün kahvaltı kutusunda. Sabit öderler, az şey isterler.",
		"Tu cara recorre la ciudad en el autobús. Si no juegas, no ruedas.": "Yüzün şehri otobüsle dolaşır. Oynamazsan otobüs yürümez.",
		"La portada del videojuego del año. Cada gol tuyo vende una copia más.": "Yılın oyununun kapağı. Attığın her gol bir kopya daha satar.",
		"TU ESTAMPA": "KARTIN",
		"TU CARA EN LA CAJA": "YUZUN KUTUDA",
		"TU CARA EN LA RUTA": "YUZUN OTOBUSTE",
		"TU PORTADA": "KAPAGIN",
		"DESAYUNO DE CAMPEÓN": "ŞAMPIYON KAHVALTISI",
		"Tres sobres y ya te tenían repetido. Te cambian por dos.": "Üç pakette çift çıkmıştın bile. Seni ikiyle takas ediyorlar.",
		"Medio barrio desayuna contigo. El otro medio, con la competencia.": "Mahallenin yarısı seninle kahvaltı ediyor. Öbür yarısı rakiple.",
		"Doce metros de cara. Y para cada parada, en todas las rutas.": "On iki metre yüz. Her durakta, her hatta.",
		"La cola da la vuelta a la manzana. Dentro del juego también eres tú.": "Kuyruk bloğun çevresini dolaşıyor. Oyunun içinde de sensin.",
	},
}
