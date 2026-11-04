extends RefCounted




































const DOMAINS: Dictionary = {



	"trueno_himno": {
		"GOLEADA": "PESTA GOL",
		"¡HUH!": "HUH!",
		"¡CON EL BOMBO!": "IKUTI DRUM!",
		"¡DESCUADRE!": "MELESET!",
		"¡TRUENO!": "GUNTUR!",
		"SE DESCUADRO": "RITME BUYAR",
		"goleada": "pesta gol",
		"palmas": "tepukan",
		"La grada entera, a tu compás.": "Seluruh tribun mengikuti iramamu.",
		"Las palmas se fueron cada una por su lado.": "Tepukannya buyar ke mana-mana.",
		"EL TRUENO": "GUNTUR",
		"EL APRETON": "JABAT TANGAN",
		"EL HIMNO": "HIMNE",
		"A TU LADO: {0}": "DI SAMPINGMU: {0}",
		"EN DIRECTO": "LANGSUNG",
		"RISA": "TAWA",
		"AGUANTA": "TAHAN",
		"¡TE BUSCA!": "AWAS!",
		"¡REVIENTAS!": "MELEDAK!",
		"¡LA TELE!": "KAMERA!",
		"¡JA, JA!": "HA HA!",
		"¡PILLADO!": "KETAHUAN!",
		"¡AGUANTASTE!": "BERHASIL!",
		"Todo el país te ha visto reírte en pleno himno.": "Seluruh negeri melihatmu tertawa saat lagu kebangsaan.",
		"Cara de piedra con todo el país mirando.": "Muka datar, disaksikan seluruh negeri.",
		"El Trueno": "Sang Guntur",
		"Llevar a la grada entera hasta el redoble tras una goleada en casa.": "Bawa seluruh tribun sampai gebukan drum terakhir setelah pesta gol di kandang.",
		"Aguantar el himno sin reírte con la tele delante.": "Bertahan sepanjang lagu kebangsaan tanpa tertawa di depan kamera.",
		"Pillado en Directo": "Tertangkap Kamera",
		"Que la tele te pille riéndote durante el himno.": "Ketahuan kamera TV sedang tertawa saat lagu kebangsaan.",
		"Tras una goleada en casa, la grada espera a que alguien marque el compás.": "Setelah pesta gol di kandang, tribun menunggu seseorang memberi irama.",
		"Con tu selección, el himno se canta serio... aunque el de al lado no ayude.": "Bersama timnas, lagu kebangsaan dinyanyikan dengan serius... meski yang di sebelahmu tak membantu.",
		"Con tu selección, ojo con quién tienes al lado cuando suena el himno.": "Bersama timnas, hati-hati dengan siapa di sebelahmu saat lagu kebangsaan berkumandang.",
		"El Míster Aún Sabe": "Pelatih Masih Jago",
		"Que tu técnico baje de pecho un balón fuera y se la dé al que saca de banda.": "Pelatihmu mengontrol dengan dada bola yang keluar lalu mengopernya ke pelempar ke dalam.",
		"Cuando el balón sale por tu banquillo, a veces el míster no se resiste.": "Saat bola keluar di dekat bangku cadanganmu, kadang pelatih tak tahan.",
		"¡PENAL!": "PENALTI!",
		"NO ERA PENAL": "BUKAN PENALTI",
		"{0} NO LO OLVIDA": "{0} TAK LUPA",
		"¡ESE NO ES!": "BUKAN ITU!",
		"EL MARACANAZO": "MARACANAZO",
		"EL CABEZAZO": "TANDUKAN ITU",
		"LA PRÓRROGA DE RÍO": "BABAK TAMBAHAN DI RIO",
		"LOS PENALES DE DOHA": "ADU PENALTI DOHA",
		"EL GOL DE ORO": "GOL EMAS ITU",
		"GOL DE ORO": "GOL EMAS",
		"DOS EN EL DESCUENTO": "DUA GOL DI INJURY TIME",
		"EL ÚLTIMO SUSPIRO": "NAPAS TERAKHIR",
		"LA VUELTA DE ÁMSTERDAM": "LEG KEDUA DI AMSTERDAM",
		"LA MANITA": "LIMA JARI",
		"ROJA DIRECTA": "MERAH LANGSUNG",
		"EN LOS PENALES": "LEWAT ADU PENALTI",
		"ESTABA ADELANTADO": "DIA OFFSIDE",
		"LA CHILENA": "TENDANGAN SALTO",
		"LA GRADA APLAUDE": "TRIBUN BERTEPUK",
		"Cara de Piedra": "Muka Datar",
	},


	"mando_f2": {
		"IZQUIERDA · AJUSTA EL STICK": "KIRI · ATUR STIK",
		"DERECHA · AJUSTA EL STICK": "KANAN · ATUR STIK",
		"mandoCRUZ": "SILANG",
		"mandoCÍRCULO": "LINGKARAN",
		"mandoCUADRADO": "KOTAK",
		"mandoTRIÁNGULO": "SEGITIGA",
		"Stick izquierdo para moverte · llega al balón y remata": "Stik kiri untuk bergerak · capai bola dan tembak",
		"Con mando se juega en horizontal: {0} > {1} > {2}": "Dengan kontroler, main mode lanskap: {0} > {1} > {2}",
		"MANTÉN {0} Y SUELTA": "TAHAN {0} LALU LEPAS",
		"Apunta con el stick y mantén {0}. Más carga, más fuerte.": "Bidik dengan stik dan tahan {0}. Makin terisi, makin kuat.",
		"PULSA {0} PARA CONTINUAR": "TEKAN {0} UNTUK LANJUT",
		"PULSA {0} PARA JUGAR": "TEKAN {0} UNTUK MAIN",
		"El coche acelera solo. Gira con el stick y frena con {0}.": "Mobil melaju sendiri. Belok dengan stik dan rem dengan {0}.",
		"Pulsa {0} para saltar": "Tekan {0} untuk lewati",
		"CENTRO · apunta y pulsa {0}": "SILANG · bidik lalu tekan {0}",
		"Apunta con el stick · pulsa {0}": "Bidik dengan stik · tekan {0}",
		"Pulsa {0} para continuar": "Tekan {0} untuk lanjut",
		"Mueve un stick para seguir": "Gerakkan stik untuk lanjut",
		"PULSA {0} PARA EMPEZAR": "TEKAN {0} MULAI",
		"CABEZAZO · jala el stick derecho y suelta": "SUNDULAN · tarik stik kanan lalu lepas",
		"Empuja el stick izquierdo y corres hacia donde lo empujas. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Dorong stik kiri dan kamu berlari ke arah dorongan. Lepaskan dan kamu berhenti mendadak. Bawa bola ke cakram merah: saat kamu menginjaknya, cakram padam dan yang berikutnya menyala, selalu di sisi lain. Menggiring itu memilih ke mana, bukan lari lurus ke depan.",
		"Dos sticks: el izquierdo conduce y el derecho tira. Jala el derecho hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltarlo, apunta al balón con el izquierdo y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "Dua stik: yang kiri menggiring dan yang kanan menembak. Tarik yang kanan ke belakang seperti ketapel: panduan mengarah ke depan. Saat dilepas, bidik bola dengan yang kiri dan tekan {0}, dan tempat kamu menendangnya menentukan. Pertama kali bola dibagi per zona: atas keluar rendah dan pelan, bawah naik lalu jatuh, sisi melengkung. Makin ke tepi, makin lemah tenaganya: tembakan keras ada di tengah.",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: {2} gira la vista a la banda y te enseña a los compañeros; otra vez y vuelve.": "Tidak ada tombol umpan: mengumpan itu MENEMBAK ke arah rekan setim, dan bola jadi milik yang tiba duluan. Kamu punya dua: satu di luar kotak, satu di dalam. Kalau umpanmu jatuh di luar kotak, kamu main sebagai penerimanya. Kalau di dalam, tak ada kontrol: dia langsung menembak. Untuk melihat mereka: {2} memutar pandangan ke sisi lapangan dan menampilkan rekan setimmu; tekan lagi untuk kembali.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con el stick izquierdo y tira con el derecho cuando lo veas.": "Lawan menempel dan lapangan terbentang di depan: giring bola dan MENYEBERANG ke wilayah lawan — sampai garis menyala kamu tidak menembak, kamu menggiring, dan setiap kali maju, muncul lawan baru di jalurmu. Lalu, satu lawan satu: giring dengan stik kiri dan tembak dengan yang kanan saat ada peluang.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el botón TIRO/CENTRO de la pantalla. Para cambiar entre CENTRO (colgado) y TIRO (raso), pulsa {1} mientras apuntas. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "Ini UMPAN SILANG: bola dilambungkan ke kotak penalti. Pada tendangan sudut, bola sudah mulai sebagai SILANG; tombol TEMBAK/SILANG di layar menunjukkannya. Untuk berganti antara SILANG (melambung) dan TEMBAK (mendatar), tekan {1} saat membidik. Cari kepala rekan setim, bukan gawang. Dan di akhir, pindah sisi: umpan yang sama tapi mencari rekan yang bebas di ujung seberang.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con el stick izquierdo, pásala con el derecho a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "Kamu mulai di area sendiri dengan bola dan gawang jauh. Giring dengan stik kiri, umpan ke rekan setim dengan yang kanan, dan terus maju: umpan ditendang seperti tembakan dan kamu main sebagai penerimanya. Kalau kamu diam di belakang tanpa maju, lawan menekan lebih keras. Lalu, satu lawan satu: tembak saat ada peluang.",
		"Con {1} cambias entre CENTRO y TIRO.": "{1} mengganti SILANG dan SHOT.",
		"Apunta al área y aguanta el stick.": "Bidik ke kotak penalti dan tahan stiknya.",
		"Sueltas, apuntas y pulsas {0}.": "Lepas, bidik, lalu tekan {0}.",
		"Stick izquierdo para conducir; jala el derecho y suelta para tirar": "Stik kiri untuk menggiring; tarik yang kanan lalu lepas untuk menembak",
		"Stick izquierdo para conducir; no se tira": "Stik kiri untuk menggiring; tidak menembak",
		"Stick izquierdo para conducir; apunta con el derecho a un compañero y suelta": "Stik kiri untuk menggiring; bidik rekan setim dengan yang kanan lalu lepas",
		"Mientras apuntas, {0} elige compañero y {1} cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.": "Saat membidik, {0} memilih rekan setim dan {1} mengganti perintahnya. Biru muda lari ke gawang, oranye tetap di posisi, magenta menarik penjaganya menjauh.",
		"STICK DERECHO: CÁMARA · {0}/{1}: BUSCAR · {2}/{3}: RITMO": "STIK KANAN: KAMERA · {0}/{1}: GESER · {2}/{3}: KECEPATAN",
		"LB ALTERNA": "LB GANTI",
		"¿SALIR DEL JUEGO?": "KELUAR GAME?",
		"MUEVE EL STICK PARA GIRAR": "GERAKKAN STIK UNTUK BELOK",
		"PULSA {0} PARA OTRA": "TEKAN {0}, MAIN LAGI",
		"Mueve la pala con el stick. {0} para sacar.": "Geser bet dengan stik. {0} untuk servis.",
		"Pulsa {0} para firmar": "Tekan {0} untuk tanda tangan",
		"Gira el campo con el stick derecho. Los esquemas son de consulta.": "Putar lapangan dengan stik kanan. Skemanya hanya untuk dilihat.",
		"Apunta con WASD · pulsa {0}": "Bidik dengan WASD · tekan {0}",
		"WASD para moverte · llega al balón y remata": "WASD untuk bergerak · capai bola dan tembak",
		"Pulsa WASD o una flecha para seguir": "Tekan WASD atau panah untuk lanjut",
		"CABEZAZO · mantén una flecha y suelta": "SUNDULAN · tahan panah lalu lepas",
		"HAZ CLIC PARA CONTINUAR": "KLIK UNTUK LANJUT",
		"HAZ CLIC EN EL ARO": "KLIK RING INI",
		"¡ARRASTRA HACIA ÉL!": "SERET KE ARAHNYA!",
		"Arrastra para girar el campo. Los esquemas son de consulta.": "Seret untuk memutar lapangan. Skemanya hanya untuk dilihat.",
		"El coche acelera solo. Gira con las flechas y frena con la de abajo.": "Mobil melaju sendiri. Belok dengan panah dan rem dengan panah bawah.",
		"Arrastra el balón hacia la canasta. Más rápido, más fuerte.": "Seret bola ke arah keranjang. Lebih cepat, lebih kuat.",
		"ARRASTRA HACIA LA CANASTA": "SERET KE KERANJANG",
		"HAZ CLIC PARA OTRA": "KLIK, MAIN LAGI",
		"USA LAS FLECHAS PARA GIRAR": "PAKAI PANAH UNTUK BELOK",
		"Arrastra hacia el aro y suelta.": "Seret ke arah ring lalu lepas.",
		"Mantén una flecha y suelta para tirar": "Tahan panah lalu lepas untuk menembak",
		"Mantén una flecha y suelta para centrar": "Tahan panah lalu lepas untuk mengumpan silang",
		"teclaESPACIO": "SPASI",
		"teclaMAYÚS": "SHIFT",
		"Con WASD corres hacia donde pulsas. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Dengan WASD kamu berlari ke arah yang kamu tekan. Lepaskan dan kamu berhenti mendadak. Bawa bola ke cakram merah: saat diinjak, cakram itu padam dan yang berikutnya menyala, selalu di sisi lain. Menggiring bola berarti memilih arah, bukan lari lurus.",
		"WASD conduce y las flechas tiran. Mantén una flecha, como una resortera: la guía apunta al lado contrario. Al soltarla, apunta al balón con WASD y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "WASD menggiring dan tombol panah menembak. Tahan satu panah seperti ketapel: panduan mengarah ke sisi berlawanan. Saat dilepas, bidik bola dengan WASD dan tekan {0}, dan tempat kamu menendangnya menentukan. Pertama kali bola dibagi per zona: atas keluar rendah dan pelan, bawah naik lalu jatuh, sisi melengkung. Makin ke tepi, makin lemah tenaganya: tembakan keras ada di tengah.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con WASD y tira con las flechas cuando lo veas.": "Lawan menempel dan lapangan terbentang di depan: giring dan MASUK ke area lawan — sampai garis menyala tidak menembak, melainkan menggiring, dan setiap bagian yang kamu lewati memunculkan pemain baru di jalanmu. Lalu, satu lawan satu: giring dengan WASD dan tembak dengan tombol panah saat kamu melihatnya.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con WASD, pásala con las flechas a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "Kamu mulai di area sendiri dengan bola dan gawang masih jauh. Giring dengan WASD, umpan ke rekan dengan tombol panah dan lanjutkan: umpan ditendang seperti tembakan dan kamu bermain sebagai pemain yang menerimanya. Kalau kamu tertinggal tanpa maju, lawan menekan. Lalu, satu lawan satu: tembak saat kamu melihatnya.",
		"Sueltas, apuntas con WASD y pulsas {0}.": "Lepas, bidik dengan WASD, lalu tekan {0}.",
		"Apunta al área y aguanta la flecha.": "Bidik ke kotak penalti dan tahan tombol panahnya.",
		"WASD para conducir; mantén una flecha y suelta para tirar": "WASD untuk menggiring; tahan satu panah dan lepas untuk menembak",
		"WASD para conducir; no se tira": "WASD untuk menggiring; tidak menembak",
		"WASD para conducir; mantén una flecha hacia un compañero y suelta": "WASD untuk menggiring; tahan satu panah ke arah rekan dan lepas",
		"PULSA LAS TECLAS O HAZ CLIC": "TEKAN TOMBOL ATAU KLIK",
		"LA PARTIDA ESTÁ GUARDADA": "GAME TERSIMPAN",
		"SE PIERDE PARA SIEMPRE": "HILANG SELAMANYA",
		"NO HAY VUELTA ATRÁS": "TAK BISA KEMBALI",
		"SALIR DEL PARTIDO": "KELUAR LAGA",
		"¿SALIR DEL PARTIDO?": "KELUAR DARI LAGA?",
		"¿REINICIAR EL PARTIDO?": "ULANGI LAGA?",
		"¿{0}?": "{0}?",
		"APUNTA Y TIRA": "BIDIK DAN TEMBAK",
		"GOLPEA": "TENDANG",
		"TIRO O CENTRO": "TEMBAK/UMPAN",
		"CANCELA": "BATAL",
		"ORDENA": "PERINTAH",
		"COMPAÑERO U OBJETIVO": "REKAN/TARGET",
		"MANTIENE": "TAHAN",
		"CÁMARA": "KAMERA",
		"SE PIERDE LO JUGADO": "PROGRES HILANG",
		"EL PARTIDO QUEDA POR JUGAR": "LAGA BELUM DIMAINKAN",
		"VUELVES AL 0' CON LA MISMA ENERGÍA": "KEMBALI KE 0' DENGAN ENERGI SAMA",
		"SE PIERDEN LAS ESTRELLAS": "BINTANG HILANG",
		"MUEVE": "GERAK",
		"A/B NINTENDO": "A/B NINTENDO",
		"CORRE Y TIRA": "LARI DAN TEMBAK",
		"Mantén {0} para correr · cruza al campo rival": "Tahan {0} untuk lari · masuk ke area lawan",
		"Mantén {0} para correr · lleva el balón a la zona roja": "Tahan {0} untuk lari · bawa bola ke zona merah",
		"Empuja el stick izquierdo y vas al paso hacia donde lo empujas; mantén {3} y corres. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Dorong stik kiri dan kamu berjalan ke arah dorongan; tahan {3} dan kamu berlari. Lepaskan dan kamu berhenti mendadak. Bawa bola ke cakram merah: saat diinjak, cakram itu padam dan yang berikutnya menyala, selalu di sisi lain. Menggiring bola berarti memilih arah, bukan lari lurus.",
		"Con WASD vas al paso hacia donde pulsas; mantén {3} y corres. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Dengan WASD kamu berjalan ke arah yang kamu tekan; tahan {3} dan kamu berlari. Lepaskan dan kamu berhenti mendadak. Bawa bola ke cakram merah: saat diinjak, cakram itu padam dan yang berikutnya menyala, selalu di sisi lain. Menggiring bola berarti memilih arah, bukan lari lurus.",
		"Empuja este stick hacia el disco; con {3}, corres.": "Dorong stik ini ke cakram; dengan {3}, kamu berlari.",
		"Pulsa WASD y vas al disco; con {3}, corres.": "Tekan WASD dan kamu menuju cakram; dengan {3}, kamu berlari.",
		"CANCELA O PAUSA": "BATAL ATAU JEDA",
		"CORRE": "LARI",
	},


	"previa_pases": {
		"MÁXIMO GOLEADOR": "TOP SKOR",
		"MÁXIMO ASISTENTE": "RAJA ASIS",
		"{0} EN GOLEO": "TOP SKOR {0}",
	},

	"amigos": {
		"AMIGOS": "TEMAN",
		"TABLA": "TABEL",
		"TU CÓDIGO": "KODEMU",
		"INVITAR": "UNDANG",
		"TÍTULOS": "GELAR",
		"{0} AÑOS · TEMPORADA {1}": "{0} THN · MUSIM {1}",
		"HACE {0} D": "{0} HR LALU",
		"Vista previa: amigos de ejemplo": "Pratinjau: contoh teman",
		"AGREGAR AMIGO": "TAMBAH TEMAN",
		"AGREGAR": "TAMBAH",
		"CÓDIGO NO ENCONTRADO": "KODE TIDAK DITEMUKAN",
		"ES TU CÓDIGO": "ITU KODEMU",
		"SIN CONEXIÓN": "TANPA KONEKSI",
		"Amigo agregado.": "Teman ditambahkan.",
		"Juega Football Legacy conmigo: {0} · código {1}": "Main Football Legacy bareng aku: {0} · kode {1}",
		"Invitación copiada.": "Undangan disalin.",
		"¿SALIR DE LA LIGA?": "KELUAR DARI LIGA?",
		"Si vuelves, empiezas de 0.": "Kalau kembali, kamu mulai dari 0.",
		"No podrás volver.": "Kamu tidak bisa kembali.",
		"Empieza una carrera para compararte.": "Mulai karier untuk membandingkan dirimu.",
		"{0} fichó por {1}": "{0} bergabung dengan {1}",
		"{0} ganó la liga": "{0} juara liga",
		"{0} se lesionó: {1} semanas": "{0} cedera: {1} minggu",
		"{0} subió a {1} de media": "{0} naik ke rating {1}",
		"{0} llegó a {1} goles": "{0} mencapai {1} gol",
		"{0} ganó el premio al Jugador del Año": "{0} meraih gelar Pemain Terbaik",
		"VER CASA": "LIHAT RUMAH",
		"CASA DE {0}": "RUMAH {0}",
		"AÚN NO HAY CASA": "BELUM ADA RUMAH",
		"TU CALLE": "JALANMU",
		"VECINOS": "TETANGGA",
		"apodoCAÑÓN": "MERIAM",
		"apodoRAYO": "PETIR",
		"apodoCOHETE": "ROKET",
		"apodoTANQUE": "TANK",
		"apodoMURO": "TEMBOK",
		"apodoTORNADO": "TORNADO",
		"apodoTITÁN": "TITAN",
		"apodoLEÓN": "SINGA",
		"apodoTIBURÓN": "HIU",
		"apodoHALCÓN": "ELANG",
		"apodoLOBO": "SERIGALA",
		"apodoTORO": "BANTENG",
		"apodoMAGO": "PENYIHIR",
		"apodoCÓNDOR": "KONDOR",
		"apodoTRUENO": "GUNTUR",
		"apodoVOLCÁN": "VULKAN",
		"apodoDE ORO": "EMAS",
		"apodoDE ACERO": "BAJA",
		"apodoDE FUEGO": "API",
		"apodoDE HIELO": "ES",
		"apodoDEL SUR": "DARI SELATAN",
		"apodoDEL NORTE": "DARI UTARA",
		"apodoDEL BARRIO": "KAMPUNG",
		"apodoDEL ÁREA": "KOTAK PENALTI",
		"apodoDE PLATA": "PERAK",
		"apodoDE LEYENDA": "LEGENDA",
		"apodoIMPARABLE": "TAK TERHENTIKAN",
		"apodoVELOZ": "CEPAT",
		"apodoLETAL": "MEMATIKAN",
		"apodoSALVAJE": "LIAR",
		"apodoSIN FRENO": "TANPA REM",
		"apodoDE MEDIANOCHE": "TENGAH MALAM",
		"apodo{0} {1} {2}": "{0} {1} {2}",
		"ELIGE TU NOMBRE": "PILIH NAMAMU",
		"ESCRIBE TU NOMBRE": "TULIS NAMAMU",
		"Lo ven todos. Un nombre ofensivo se puede denunciar.": "Semua orang melihatnya. Nama yang menyinggung bisa dilaporkan.",
		"MÁXIMO 16 LETRAS": "MAKSIMAL 16 HURUF",
		"SÓLO LETRAS Y NÚMEROS": "HANYA HURUF DAN ANGKA",
		"MÍNIMO 2 LETRAS": "MINIMAL 2 HURUF",
		"ESE NOMBRE NO SE PUEDE USAR": "NAMA ITU TIDAK BOLEH DIPAKAI",
		"OCULTAR SU NOMBRE": "SEMBUNYIKAN NAMANYA",
		"MOSTRAR SU NOMBRE": "TAMPILKAN NAMANYA",
		"DENUNCIAR": "LAPORKAN",
		"AMIGOS crea un perfil anónimo y sube tu carrera y tu apodo para rankings y retos.": "TEMAN membuat profil anonim dan mengunggah kariermu serta julukanmu untuk peringkat dan tantangan.",
		"Tolerancia cero con apodos ofensivos o abusivos.": "Tanpa toleransi untuk julukan yang menyinggung atau kasar.",
		"AHORA NO": "NANTI SAJA",
		"BORRAR MI CUENTA": "HAPUS AKUN SAYA",
		"¿BORRAR TU CUENTA?": "HAPUS AKUNMU?",
		"Se borran del servidor tu perfil, amigos, retos, ligas, ranking y casa. Tu carrera en este dispositivo no se toca.": "Profil, teman, tantangan, liga, peringkat, dan rumahmu dihapus dari server. Kariermu di perangkat ini tidak tersentuh.",
		"Cuenta borrada.": "Akun dihapus.",
		"No se pudo borrar. Revisa tu conexión e inténtalo luego.": "Gagal menghapus. Periksa koneksimu dan coba lagi nanti.",
		"QUITAR AMIGO": "HAPUS TEMAN",
		"¿QUITAR AMIGO?": "HAPUS TEMAN?",
		"¿DENUNCIAR?": "LAPORKAN?",
		"Deja de ser tu amigo y se oculta su nombre.": "Tidak lagi menjadi temanmu dan namanya disembunyikan.",
		"Deja de ser tu amigo.": "Tidak lagi menjadi temanmu.",
		"Queda bloqueado: no vuelve a aparecer en AMIGOS.": "Diblokir: tidak akan muncul lagi di TEMAN.",
		"BLOQUEAR": "BLOKIR",
		"Al aceptar, aceptas estas normas: tolerancia cero con el contenido ofensivo y con los usuarios abusivos. Lo denunciado se oculta y la cuenta se expulsa.": "Dengan menerima, kamu menyetujui aturan ini: tanpa toleransi untuk konten yang menyinggung dan pengguna yang kasar. Yang dilaporkan disembunyikan dan akunnya dikeluarkan.",
		"cocheSUBIR": "MASUK",
		"BAJAR": "KELUAR",
		"FRENO": "REM",
		"KM/H": "KM/J",
		"R": "R",
		"ACELERA": "GAS",
	},


	"amigos_retos": {
		"RETOS": "DUEL",
		"RETO": "DUEL",
		"RETAR": "TANTANG",
		"RETAR A UN AMIGO": "TANTANG TEMAN",
		"JUGADAS": "TENDANGAN",
		"{0} JUGADAS": "{0} TENDANGAN",
		"{0} · {1} JUGADAS": "{0} · {1} TENDANGAN",
		"TE TOCA": "GILIRANMU",
		"ESPERANDO": "MENUNGGU",
		"ENVIANDO": "MENGIRIM",
		"CADUCADO": "HANGUS",
		"QUEDAN {0} H": "SISA {0} J",
		"QUEDAN {0} D": "SISA {0} H",
		"Sin conexión: lo último guardado": "Offline: data terakhir",
		"+{0} ★ por amigo que juegue 10 partidos": "+{0} ★ per teman yang main 10 laga",
		"+{0} ★ por invitar amigos": "+{0} ★ karena mengundang teman",
		"Aún no hay novedades de tus amigos.": "Belum ada kabar dari temanmu.",
		"Reta a un amigo: mismas jugadas para los dos, gana quien marque más.": "Tantang teman: tendangan sama untuk berdua, gol terbanyak menang.",
		"Agrega un amigo para retarlo.": "Tambah teman untuk menantangnya.",
		"Reto enviado.": "Duel terkirim.",
		"Sólo vale el primer intento. Si sales, cuenta lo que lleves.": "Hanya percobaan pertama yang dihitung. Jika keluar, skor sejauh ini yang berlaku.",
		"Marca guardada. El resultado sale cuando juegue tu amigo.": "Skor disimpan. Hasilnya muncul saat temanmu bermain.",
		"SALIR DEL RANKING": "KELUAR DARI PERINGKAT",
		"ENTRAR EN EL RANKING": "MASUK PERINGKAT",
		"DEMASIADOS RETOS HOY": "BATAS HARIAN",

		"EN GRUPO": "GRUP",
		"RETO EN GRUPO": "TANTANGAN GRUP",
		"ELIGE AL MENOS 2 AMIGOS": "PILIH MINIMAL 2 TEMAN",
		"PUESTO {0} DE {1}": "#{0} DARI {1}",
		"Las marcas de los demás se ven al terminar la tuya.": "Skor yang lain terlihat setelah kamu selesai.",
		"Agrega al menos dos amigos para un reto en grupo.": "Tambah minimal dua teman untuk tantangan grup.",
		"Marca guardada. El resultado sale cuando jueguen todos.": "Skor disimpan. Hasilnya muncul saat semua sudah bermain.",
		"YA NO ES TU AMIGO": "BUKAN TEMANMU LAGI",
		"YA LO JUGASTE": "SUDAH DIMAINKAN",
		"RETO CADUCADO": "DUEL HANGUS",
		"{0} ganó un título": "{0} meraih gelar",
		"{0} ganó un premio individual": "{0} meraih penghargaan individu",
		"{0} colgó las botas": "{0} gantung sepatu",
		"Guante Lanzado": "Tantangan Dilempar",
		"Jugar tu primer reto contra un amigo.": "Mainkan duel pertamamu melawan teman.",
		"El Pique": "Gengsi",
		"Ganar un reto a un amigo.": "Menangkan duel melawan teman.",
		"Rey del Barrio": "Raja Kampung",
		"Ganar 10 retos a tus amigos.": "Menangkan 10 duel melawan temanmu.",
		"Pleno": "Sempurna",
		"Marcar todas en un reto de 10 o 15 jugadas.": "Cetak gol di semua tendangan dalam duel 10 atau 15.",
		"Padrino": "Mentor",
		"Que un amigo que invitaste juegue 10 partidos.": "Teman yang kamu undang main 10 laga.",
		"Cazatalentos": "Pemandu Bakat",
		"Que 5 amigos que invitaste jueguen 10 partidos.": "5 teman yang kamu undang main 10 laga.",
	},

	"amigos_carreras": {
		"{0} CARRERAS": "{0} KARIER",
		"SU JUGADOR": "PEMAINNYA",
		"JUEGAS CON": "MAIN SEBAGAI",
	},


	"logros_hito": {
		"Oro Precoz": "Emas Dini",
		"Ganar el Balón de Oro antes de cumplir 19 años.": "Raih gelar Pemain Terbaik sebelum berusia 19 tahun.",
		"Triplete": "Treble",
		"Liga, copa y tu gran copa continental en la misma temporada.": "Liga, piala, dan piala kontinental utamamu dalam satu musim.",
		"Último Baile": "Dansa Terakhir",
		"Levantar un título en tu temporada de retiro.": "Angkat gelar di musim pensiunmu.",
		"De la Nada": "Dari Nol",
		"Debutar en Tercera y ganar la liga de Primera en la misma carrera.": "Debut di kasta ketiga dan juarai liga kasta teratas dalam karier yang sama.",
		"Álbum de un Continente": "Album Satu Benua",
		"Completar en la VITRINA todas las ligas y copas de una confederación.": "Lengkapi di LEMARI semua liga dan piala satu konfederasi.",
		"La Vitrina Completa": "Lemari Trofi Penuh",
		"Completar el álbum de la VITRINA al 100 %.": "Lengkapi album LEMARI hingga 100%.",
		"Sextete": "Sextuple",
		"Seis títulos con tu club en doce meses.": "Enam gelar bersama klubmu dalam dua belas bulan.",
		"Desde la Primera Ronda": "Dari Babak Pertama",
		"Ganar una copa de Europa entrando por la primera ronda previa.": "Menangkan piala Eropa setelah masuk lewat babak kualifikasi pertama.",
	},


	"vitrina_album": {
		"NACIONAL": "NASIONAL",
		"Ganado {0} veces.": "Menang {0} kali.",
		"Trofeo por ganar. Sigue jugando tu carrera.": "Trofi belum diraih. Lanjutkan kariermu.",
	},






	"grada_tifos": {
		"EL TIFO DEL DERBI": "TIFO DERBY",
		"La peña está pintando las cartulinas para el derbi contra {0} y te pregunta si pones el dinero. Si lo pones, el domingo la curva levanta tu número.": "Kelompok suporter sedang mengecat karton untuk derby melawan {0} dan bertanya apakah kamu mau membiayainya. Kalau ya, hari Minggu tribun akan mengangkat nomormu.",
		"PAGAR EL TIFO": "BAYAR TIFO",
		"QUE SAQUEN SU ESCUDO": "PAKAI LAMBANG SAJA",
		"Premio de la Afición": "Penghargaan Suporter",
		"EL ESTADIO, EN PIE: APLAUDEN TU DORSAL": "STADION BERDIRI UNTUK NOMORMU",
		"TU EX GRADA, EN PIE: APLAUDEN TU DORSAL": "MANTAN SUPORTERMU BERDIRI UNTUK NOMORMU",
		"PAÑUELOS BLANCOS EN LA GRADA: VAN POR TI": "SAPU TANGAN PUTIH: MEREKA MENGECAMMU",
		"PAÑUELOS BLANCOS CONTRA EL PALCO": "SAPU TANGAN UNTUK MANAJEMEN",
		"PAÑOLADA": "PROTES",
		"OS VAIS A VUESTRA GRADA: OS APLAUDEN IGUAL": "KE TRIBUN: MEREKA TETAP BERTEPUK",
		"OS VAIS A VUESTRA GRADA: PITOS Y PAÑUELOS": "KE TRIBUN: EJEKAN DAN SAPU TANGAN",
		"APLAUSOS": "TEPUKAN",
		"PITOS": "EJEKAN",
		"REGALO": "HADIAH",
		"{0} le da su camiseta a un niño de la grada": "{0} memberikan jerseynya kepada seorang anak di tribun",
		"Goleada ante el {0}: la grada del {1} aplaude igual": "Dibantai {0}: suporter {1} tetap bertepuk tangan",
		"Goleada ante el {0}: pitos y pañuelos para el {1}": "Dibantai {0}: ejekan dan sapu tangan untuk {1}",
		"FIRMA TU CAMISETA": "TEKEN JERSEYMU",
		"Es para el niño del cartel": "Ini untuk anak yang membawa papan",
		"Marcaste, y el niño del cartel se lleva tu camiseta.": "Kamu mencetak gol, dan anak yang membawa papan membawa pulang jerseymu.",
		"TRIBUNA {0}": "TRIBUN {0}",
		"Es para tu hincha de siempre": "Ini untuk fan setiamu",
		"Tu hincha de siempre se lleva tu camiseta.": "Fan setiamu membawa pulang jerseymu.",
		"Le negaste tu camiseta a tu hincha de siempre.": "Kamu menolak memberikan jerseymu kepada fan setiamu.",
	},
	"ajustes_tumbado": {

		"ZURDO": "KIDAL",
		"TAMAÑO": "UKURAN",
		"OPACIDAD": "OPASITAS",
		"CRT": "CRT",
		"ICONO": "IKON",
		"DATOS": "DATA",
		"TELÉFONO": "PONSEL",
		"CUMPLE": "ULTAH",
		"MOVIMIENTO": "GERAKAN",
		"SACUDIDA": "GUNCANG",
		"MANDO": "PAD",
		"CONECTAR": "SAMBUNG",
		"CONECTADO": "TERHUBUNG",
		"ESPERANDO MANDO": "MENUNGGU PAD",
		"EN EL MANDO": "DI PAD",
		"EN EL TELÉFONO": "DI PONSEL",
		"EN EL ORDENADOR": "DI PC",
		"MANTÉN": "TAHAN",
		"HASTA QUE PARPADEE": "SAMPAI BERKEDIP",
		"EMPAREJAR": "PAIRING",
		"SINCRONIZAR": "SYNC",
		"TOCA EL MANDO": "KETUK PAD",
		"VINCULAR": "PAIRING",
		"PRIVACIDAD": "PRIVASI",
		"LICENCIAS": "LISENSI",
		"Licencia: {0}": "Lisensi: {0}",
	},






	"copas_america": {
		"COPA GLORIA": "PIALA KEJAYAAN",
		"Copa Gloria": "Piala Kejayaan",
		"LIBERTADORES": "PIALA KEJAYAAN",
		"COPA DEL SUR": "PIALA SELATAN",
		"Copa del Sur": "Piala Selatan",
		"SUDAMERICANA": "PIALA SELATAN",
		"COPA DEL NORTE": "PIALA UTARA",
		"Copa del Norte": "Piala Utara",
		"CONCACAF CHAMPIONS CUP": "PIALA UTARA",
		"MEJOR DE LA COPA GLORIA": "TERBAIK PIALA KEJAYAAN",
		"MEJOR DE LA COPA DEL SUR": "TERBAIK PIALA SELATAN",
		"MEJOR DE LA COPA DEL NORTE": "TERBAIK PIALA UTARA",
		"Todo un continente soñando con esta copa. Y la levantas tú.":
			"Seluruh benua memimpikan piala ini. Dan kamu yang mengangkatnya.",
		"La otra copa de América. Se suda igual y se levanta igual.":
			"Piala Amerika yang lain. Keringatnya sama, mengangkatnya pun sama.",
		"El norte del continente entero, a tus pies.":
			"Seluruh utara benua di kakimu.",
		"El mejor de América en la copa que todo el continente mira.":
			"Yang terbaik di Amerika, di piala yang ditonton seluruh benua.",
		"El mejor de la otra copa de América. Nadie la jugó como tú.":
			"Yang terbaik di piala Amerika yang lain. Tak ada yang memainkannya sepertimu.",
		"El mejor del norte del continente. Las noches de copa fueron tuyas.":
			"Yang terbaik di utara benua. Malam-malam piala itu milikmu.",
		"Previa": "Kualifikasi",
		"PREVIA": "KUALIFIKASI",
		"Preliminar": "Pendahuluan",
		"PRELIMINAR": "PENDAHULUAN",
		"Campeón de Libertadores": "Juara Piala Kejayaan",
		"Campeón de Copa Gloria": "Juara Piala Kejayaan",
		"Campeón de Sudamericana": "Juara Piala Selatan",
		"Campeón de Copa del Sur": "Juara Piala Selatan",
		"Campeón de Concacaf": "Juara Piala Utara",
		"Campeón de Copa del Norte": "Juara Piala Utara",
		"Bota de la Libertadores": "Sepatu Emas Piala Kejayaan",
		"Bota de la Copa Gloria": "Sepatu Emas Piala Kejayaan",
		"Bota de la Sudamericana": "Sepatu Emas Piala Selatan",
		"Bota de la Copa del Sur": "Sepatu Emas Piala Selatan",
		"Bota de la Concacaf": "Sepatu Emas Piala Utara",
		"Bota de la Copa del Norte": "Sepatu Emas Piala Utara",
		"Máximo Asistente de la Libertadores": "Raja Asis Piala Kejayaan",
		"Máximo Asistente de la Copa Gloria": "Raja Asis Piala Kejayaan",
		"Máximo Asistente de la Sudamericana": "Raja Asis Piala Selatan",
		"Máximo Asistente de la Copa del Sur": "Raja Asis Piala Selatan",
		"Máximo Asistente de la Concacaf": "Raja Asis Piala Utara",
		"Máximo Asistente de la Copa del Norte": "Raja Asis Piala Utara",
		"Mejor de la Libertadores": "Pemain Terbaik Piala Kejayaan",
		"Mejor de la Copa Gloria": "Pemain Terbaik Piala Kejayaan",
		"Mejor de la Sudamericana": "Pemain Terbaik Piala Selatan",
		"Mejor de la Copa del Sur": "Pemain Terbaik Piala Selatan",
		"Mejor de la Concacaf": "Pemain Terbaik Piala Utara",
		"Mejor de la Copa del Norte": "Pemain Terbaik Piala Utara",
		"¡Campeón de Copa Gloria!": "Juara Piala Kejayaan!",
		"¡Campeón de Copa del Sur!": "Juara Piala Selatan!",
		"¡Campeón de Copa del Norte!": "Juara Piala Utara!",
		"¡CAMPEÓN DE COPA GLORIA!": "JUARA PIALA KEJAYAAN!",
		"¡CAMPEÓN DE COPA DEL SUR!": "JUARA PIALA SELATAN!",
		"¡CAMPEÓN DE COPA DEL NORTE!": "JUARA PIALA UTARA!",
		"Clasificado a Copa Gloria": "Lolos ke Piala Kejayaan",
		"Clasificado a Copa del Sur": "Lolos ke Piala Selatan",
		"Clasificado a Copa del Norte": "Lolos ke Piala Utara",
		"Fase final de Copa Gloria": "Fase gugur Piala Kejayaan",
		"Fase final de Copa del Sur": "Fase gugur Piala Selatan",
		"Fase final de Copa del Norte": "Fase gugur Piala Utara",
		"Mejor (Copa Gloria)": "Terbaik (Piala Kejayaan)",
		"Mejor (Copa del Sur)": "Terbaik (Piala Selatan)",
		"Mejor (Copa del Norte)": "Terbaik (Piala Utara)",
		"Bota (Copa Gloria)": "Sepatu (Piala Kejayaan)",
		"Bota (Copa del Sur)": "Sepatu (Piala Selatan)",
		"Bota (Copa del Norte)": "Sepatu (Piala Utara)",
		"Asist. (Copa Gloria)": "Asis (Piala Kejayaan)",
		"Asist. (Copa del Sur)": "Asis (Piala Selatan)",
		"Asist. (Copa del Norte)": "Asis (Piala Utara)",
		"Gloria Eterna": "Kejayaan Abadi",
		"Rey del Sur": "Raja Selatan",
		"Rey del Norte": "Raja Utara",
		"Amo de América": "Penguasa Amerika",
		"Dos Mundos": "Dua Dunia",
		"Cerebro de la Libertadores": "Otak Piala Kejayaan",
		"Cerebro de la Copa Gloria": "Otak Piala Kejayaan",
		"Cerebro de la Sudamericana": "Otak Piala Selatan",
		"Cerebro de la Copa del Sur": "Otak Piala Selatan",
		"Cerebro de la Concacaf": "Otak Piala Utara",
		"Cerebro de la Copa del Norte": "Otak Piala Utara",
		"Ganar la Libertadores.": "Juarai Piala Kejayaan.",
		"Ganar la Copa Gloria.": "Juarai Piala Kejayaan.",
		"Ganar la Sudamericana.": "Juarai Piala Selatan.",
		"Ganar la Copa del Sur.": "Juarai Piala Selatan.",
		"Ganar la Concacaf Champions Cup.": "Juarai Piala Utara.",
		"Ganar la Copa del Norte.": "Juarai Piala Utara.",
		"Ser el máximo goleador de la Libertadores.": "Menjadi pencetak gol terbanyak Piala Kejayaan.",
		"Ser el máximo goleador de la Copa Gloria.": "Menjadi pencetak gol terbanyak Piala Kejayaan.",
		"Ser el máximo goleador de la Sudamericana.": "Menjadi pencetak gol terbanyak Piala Selatan.",
		"Ser el máximo goleador de la Copa del Sur.": "Menjadi pencetak gol terbanyak Piala Selatan.",
		"Ser el máximo goleador de la Concacaf Champions Cup.": "Menjadi pencetak gol terbanyak Piala Utara.",
		"Ser el máximo goleador de la Copa del Norte.": "Menjadi pencetak gol terbanyak Piala Utara.",
		"Máximo asistente de la Libertadores.": "Raja asis Piala Kejayaan.",
		"Máximo asistente de la Copa Gloria.": "Raja asis Piala Kejayaan.",
		"Máximo asistente de la Sudamericana.": "Raja asis Piala Selatan.",
		"Máximo asistente de la Copa del Sur.": "Raja asis Piala Selatan.",
		"Máximo asistente de la Concacaf Champions Cup.": "Raja asis Piala Utara.",
		"Máximo asistente de la Copa del Norte.": "Raja asis Piala Utara.",
		"Ganar la Libertadores con 3 clubes distintos.": "Juarai Piala Kejayaan bersama 3 klub berbeda.",
		"Ganar la Copa Gloria con 3 clubes distintos.": "Juarai Piala Kejayaan bersama 3 klub berbeda.",
		"Ganar la Champions y también la Libertadores o la Concacaf Champions Cup.": "Juarai Piala Elite dan juga Piala Kejayaan atau Piala Utara.",
		"Ganar la Copa de Campeones y también la Copa Gloria o la Copa del Norte.": "Juarai Piala Elite dan juga Piala Kejayaan atau Piala Utara.",
		"Máximo goleador de tu liga Y de tu gran copa continental en la misma temporada.": "Top skor ligamu DAN piala kontinental utamamu di musim yang sama.",
		"Ganar los seis grandes: liga, copa, tu gran copa continental, Mundial de Clubes, continental y Mundial.": "Menangi enam besar: liga, piala, piala kontinental utamamu, Kejuaraan Dunia Klub, kontinental, dan Kejuaraan Dunia.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de esa copa.": "Di KASTA TERTINGGI dalam satu musim: liga, piala, dan piala kontinental utamamu, plus Pemain Terbaik, MVP dan top skor liga, serta MVP dan sepatu emas piala itu.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Jugador del Año, MVP y goleo de la liga, y MVP y bota de esa copa.": "Di KASTA TERTINGGI dalam satu musim: liga, piala, dan piala kontinental utamamu, plus Pemain Terbaik, MVP dan top skor liga, serta MVP dan sepatu emas piala itu.",
		"TORNEOS CONTINENTALES": "PIALA KONTINENTAL",
		"continentales": "piala kontinental",
		"bota_libertadoresBota de la Libertadores": "Sepatu Emas Piala Kejayaan",
		"bota_sudamericanaBota de la Sudamericana": "Sepatu Emas Piala Selatan",
		"bota_concacafBota de la Concacaf": "Sepatu Emas Piala Utara",
		"max_asist_sudCerebro de la Sudamericana": "Otak Piala Selatan",
		"nombre del logro max_asist_sudCerebro de la Sudamericana": "Otak Piala Selatan",



		"tabGLORIA": "JAYA",
		"tabSUR": "SELATAN",
		"tabNORTE": "UTARA",
		"GLO": "PK",
		"SUR": "PS",
		"NOR": "PU",
	},


	"copas_asia": {
		"COPA DE ORIENTE": "PIALA TIMUR",
		"Copa de Oriente": "Piala Timur",
		"MEJOR DE LA COPA DE ORIENTE": "TERBAIK PIALA TIMUR",
		"Campeón de Copa de Oriente": "Juara Piala Timur",
		"Bota de la Copa de Oriente": "Sepatu Emas Piala Timur",
		"Máximo Asistente de la Copa de Oriente": "Raja Asis Piala Timur",
		"Mejor de la Copa de Oriente": "Pemain Terbaik Piala Timur",
		"¡Campeón de Copa de Oriente!": "Juara Piala Timur!",
		"¡CAMPEÓN DE COPA DE ORIENTE!": "JUARA PIALA TIMUR!",
		"Clasificado a Copa de Oriente": "Lolos ke Piala Timur",
		"Fase final de Copa de Oriente": "Fase gugur Piala Timur",
		"Mejor (Copa de Oriente)": "Terbaik (Piala Timur)",
		"Bota (Copa de Oriente)": "Sepatu (Piala Timur)",
		"Asist. (Copa de Oriente)": "Asis (Piala Timur)",
		"Cerebro de la Copa de Oriente": "Otak Piala Timur",
		"Ganar la Copa de Oriente.": "Juarai Piala Timur.",
		"Ser el máximo goleador de la Copa de Oriente.": "Menjadi pencetak gol terbanyak Piala Timur.",
		"Máximo asistente de la Copa de Oriente.": "Raja asis Piala Timur.",
		"COPA DEL SOL": "PIALA MATAHARI",
		"Copa del Sol": "Piala Matahari",
		"MEJOR DE LA COPA DEL SOL": "TERBAIK PIALA MATAHARI",
		"Campeón de Copa del Sol": "Juara Piala Matahari",
		"Bota de la Copa del Sol": "Sepatu Emas Piala Matahari",
		"Máximo Asistente de la Copa del Sol": "Raja Asis Piala Matahari",
		"Mejor de la Copa del Sol": "Pemain Terbaik Piala Matahari",
		"¡Campeón de Copa del Sol!": "Juara Piala Matahari!",
		"¡CAMPEÓN DE COPA DEL SOL!": "JUARA PIALA MATAHARI!",
		"Clasificado a Copa del Sol": "Lolos ke Piala Matahari",
		"Fase final de Copa del Sol": "Fase gugur Piala Matahari",
		"Mejor (Copa del Sol)": "Terbaik (Piala Matahari)",
		"Bota (Copa del Sol)": "Sepatu (Piala Matahari)",
		"Asist. (Copa del Sol)": "Asis (Piala Matahari)",
		"Cerebro de la Copa del Sol": "Otak Piala Matahari",
		"Ganar la Copa del Sol.": "Juarai Piala Matahari.",
		"Ser el máximo goleador de la Copa del Sol.": "Menjadi pencetak gol terbanyak Piala Matahari.",
		"Máximo asistente de la Copa del Sol.": "Raja asis Piala Matahari.",
		"Rey de Oriente": "Raja Timur",
		"Rey del Sol": "Raja Matahari",
		"tabORIENTE": "TIMUR",
		"tabSOL": "MATAHARI",
		"ORI": "PT",
		"CSO": "PM",
		"Medio mundo de distancia y una sola copa. Es tuya.": "Setengah dunia jauhnya, dan hanya satu piala. Milikmu.",
		"Viajes largos, noches largas. Y al final, la copa.": "Perjalanan panjang, malam panjang. Dan akhirnya, piala.",
		"El mejor de la copa grande de Asia. Nadie brilló como tú.": "Yang terbaik di piala besar Asia. Tak ada yang bersinar sepertimu.",
		"El mejor de la otra copa de Asia. Cada noche fue tuya.": "Yang terbaik di piala Asia lainnya. Setiap malam milikmu.",
	},


	"copas_africa": {
		"COPA DEL ATLAS": "PIALA ATLAS",
		"Copa del Atlas": "Piala Atlas",
		"MEJOR DE LA COPA DEL ATLAS": "TERBAIK PIALA ATLAS",
		"Campeón de Copa del Atlas": "Juara Piala Atlas",
		"Bota de la Copa del Atlas": "Sepatu Emas Piala Atlas",
		"Máximo Asistente de la Copa del Atlas": "Raja Asis Piala Atlas",
		"Mejor de la Copa del Atlas": "Pemain Terbaik Piala Atlas",
		"¡Campeón de Copa del Atlas!": "Juara Piala Atlas!",
		"¡CAMPEÓN DE COPA DEL ATLAS!": "JUARA PIALA ATLAS!",
		"Clasificado a Copa del Atlas": "Lolos ke Piala Atlas",
		"Fase final de Copa del Atlas": "Fase gugur Piala Atlas",
		"Mejor (Copa del Atlas)": "Terbaik (Piala Atlas)",
		"Bota (Copa del Atlas)": "Sepatu (Piala Atlas)",
		"Asist. (Copa del Atlas)": "Asis (Piala Atlas)",
		"Cerebro de la Copa del Atlas": "Otak Piala Atlas",
		"Ganar la Copa del Atlas.": "Juarai Piala Atlas.",
		"Ser el máximo goleador de la Copa del Atlas.": "Menjadi pencetak gol terbanyak Piala Atlas.",
		"Máximo asistente de la Copa del Atlas.": "Raja asis Piala Atlas.",
		"COPA DEL BAOBAB": "PIALA BAOBAB",
		"Copa del Baobab": "Piala Baobab",
		"MEJOR DE LA COPA DEL BAOBAB": "TERBAIK PIALA BAOBAB",
		"Campeón de Copa del Baobab": "Juara Piala Baobab",
		"Bota de la Copa del Baobab": "Sepatu Emas Piala Baobab",
		"Máximo Asistente de la Copa del Baobab": "Raja Asis Piala Baobab",
		"Mejor de la Copa del Baobab": "Pemain Terbaik Piala Baobab",
		"¡Campeón de Copa del Baobab!": "Juara Piala Baobab!",
		"¡CAMPEÓN DE COPA DEL BAOBAB!": "JUARA PIALA BAOBAB!",
		"Clasificado a Copa del Baobab": "Lolos ke Piala Baobab",
		"Fase final de Copa del Baobab": "Fase gugur Piala Baobab",
		"Mejor (Copa del Baobab)": "Terbaik (Piala Baobab)",
		"Bota (Copa del Baobab)": "Sepatu (Piala Baobab)",
		"Asist. (Copa del Baobab)": "Asis (Piala Baobab)",
		"Cerebro de la Copa del Baobab": "Otak Piala Baobab",
		"Ganar la Copa del Baobab.": "Juarai Piala Baobab.",
		"Ser el máximo goleador de la Copa del Baobab.": "Menjadi pencetak gol terbanyak Piala Baobab.",
		"Máximo asistente de la Copa del Baobab.": "Raja asis Piala Baobab.",
		"Rey del Atlas": "Raja Atlas",
		"Rey del Baobab": "Raja Baobab",
		"tabATLAS": "ATLAS",
		"tabBAOBAB": "BAOBAB",
		"ATL": "ATL",
		"BAO": "BAO",
		"El mejor de la copa grande de África. Nadie brilló como tú.": "Yang terbaik di piala besar Afrika. Tak ada yang bersinar sepertimu.",
		"El mejor de la otra copa de África. Cada noche fue tuya.": "Yang terbaik di piala Afrika lainnya. Setiap malam milikmu.",
	},



	"copas_oceania": {
		"COPA DEL CORAL": "PIALA KARANG",
		"Copa del Coral": "Piala Karang",
		"MEJOR DE LA COPA DEL CORAL": "TERBAIK PIALA KARANG",
		"Campeón de Copa del Coral": "Juara Piala Karang",
		"Bota de la Copa del Coral": "Sepatu Emas Piala Karang",
		"Máximo Asistente de la Copa del Coral": "Raja Asis Piala Karang",
		"Mejor de la Copa del Coral": "Pemain Terbaik Piala Karang",
		"¡Campeón de Copa del Coral!": "Juara Piala Karang!",
		"¡CAMPEÓN DE COPA DEL CORAL!": "JUARA PIALA KARANG!",
		"Clasificado a Copa del Coral": "Lolos ke Piala Karang",
		"Fase final de Copa del Coral": "Fase gugur Piala Karang",
		"Mejor (Copa del Coral)": "Terbaik (Piala Karang)",
		"Bota (Copa del Coral)": "Sepatu (Piala Karang)",
		"Asist. (Copa del Coral)": "Asis (Piala Karang)",
		"Cerebro de la Copa del Coral": "Otak Piala Karang",
		"Ganar la Copa del Coral.": "Juarai Piala Karang.",
		"Ser el máximo goleador de la Copa del Coral.": "Menjadi pencetak gol terbanyak Piala Karang.",
		"Máximo asistente de la Copa del Coral.": "Raja asis Piala Karang.",
		"Rey del Coral": "Raja Karang",
		"Señor del Arrecife": "Penguasa Terumbu",
		"Ganar 3 veces la Copa del Coral.": "Juarai Piala Karang 3 kali.",
		"Tiburón del Pacífico": "Hiu Pasifik",
		"Ser 2 veces el máximo goleador de la Copa del Coral.": "Menjadi pencetak gol terbanyak Piala Karang 2 kali.",
		"Ser el mejor jugador de la Copa del Coral.": "Menjadi pemain terbaik Piala Karang.",
		"tabCORAL": "KORAL",
		"COR": "KOR",
		"Islas lejanas, un solo estadio. Y la copa del Pacífico es tuya.": "Pulau-pulau jauh, satu stadion saja. Dan piala Pasifik milikmu.",
		"El mejor de la copa del Pacífico. Cada isla habló de ti.": "Yang terbaik di piala Pasifik. Setiap pulau membicarakanmu.",
	},









	"campeon_de_campeones": {
		"CAMPEÓN DE CAMPEONES": "CAMPEON DE CAMPEONES",
		"Campeón de Campeones": "Campeón de Campeones",
		"Ganar el Campeón de Campeones.": "Menangkan Campeón de Campeones.",
		"Dos campeones y una sola copa. La tuya.": "Dua juara, satu trofi. Milikmu.",
	},
	"supercopas": {
		"Campeón de la Finalísima": "Juara Superfinal",
		"Finalísima": "Superfinal",
		"FINALÍSIMA": "SUPERFINAL",
		"FINALÍSIMA: {0} le gana a {1}": "SUPERFINAL: {0} kalahkan {1}",
		"Dos Continentes": "Dua Benua",
		"Ganar la Finalísima con tu país.": "Menangkan Superfinal bersama negaramu.",
		"Campeón de tu continente contra campeón del otro. Ganó el tuyo.": "Juara benuamu melawan juara benua lain. Juaramu menang.",
		"COPA DE LA LIGA": "PIALA LIGA",
		"Copa de la Liga": "Piala Liga",
		"Campeón de la Copa de la Liga": "Juara Piala Liga",
		"La otra copa del país. También es tuya.": "Piala lain di negeri ini. Ini juga milikmu.",
		"Doble Copa": "Dwi Piala",
		"Ganar la Copa de la Liga.": "Menangi Piala Liga.",
		"LIGA DE NACIONES": "LIGA BANGSA",
		"Liga de Naciones": "Liga Bangsa",
		"Campeón de la Liga de Naciones": "Juara Liga Bangsa",
		"Liga A": "Liga A",
		"Ganar la Liga de Naciones con tu país.": "Menangkan Liga Bangsa bersama negaramu.",
		"Seis jornadas, una Final Four. La primera de tu continente.": "Enam pekan, satu Final Four. Yang pertama di benuamu.",
		"LIGA DE NACIONES: {0}": "LIGA BANGSA: {0}",
		"SUPERCOPA DE ÁFRICA": "PIALA SUPER AFRIKA",
		"Supercopa de África": "Piala Super Afrika",
		"Campeón de la Supercopa de África": "Juara Piala Super Afrika",
		"Supercampeón de África": "Juara Super Afrika",
		"Ganar la Supercopa de África.": "Menangkan Piala Super Afrika.",
		"Los dos campeones de África, y la copa es tuya.": "Dua juara Afrika, dan pialanya milikmu.",
		"RECOPA DEL SUR": "RECOPA SELATAN",
		"Recopa del Sur": "Recopa Selatan",
		"COPA INTERCONTINENTAL": "PIALA ANTARBENUA",
		"Copa Intercontinental": "Piala Antarbenua",
		"DERBI DE LAS AMÉRICAS": "DERBI AMERIKA",
		"COPA AFROASIÁTICA": "PIALA AFRO-ASIA",

		"PLAY-OFF ASIA-PACÍFICO": "PLAY-OFF ASIA-PASIFIK",
		"COPA CHALLENGER": "PIALA CHALLENGER",
		"Campeón de la Recopa": "Juara Recopa Selatan",
		"Campeón Intercontinental": "Juara Antarbenua",
		"Campeón contra Campeón": "Juara lawan Juara",
		"Rey Intercontinental": "Raja Antarbenua",
		"Ganar la Recopa del Sur.": "Menangkan Recopa Selatan.",
		"Ganar la Copa Intercontinental.": "Menangkan Piala Antarbenua.",
		"Campeón contra campeón. Y la copa se queda contigo.": "Juara lawan juara. Dan pialanya tetap milikmu.",
		"Los campeones de cada continente, y el mejor eres tú.": "Para juara dari setiap benua, dan yang terbaik adalah kamu.",
		"SUPERCOPA DE EUROPA": "PIALA SUPER EROPA",
		"Supercopa de Europa": "Piala Super Eropa",
		"Campeón de la Supercopa de Europa": "Juara Piala Super Eropa",
		"Supercampeón de Europa": "Juara Super Eropa",
		"Ganar la Supercopa de Europa.": "Menangkan Piala Super Eropa.",
		"Los dos campeones de Europa, y la copa es tuya.": "Dua juara Eropa, dan pialanya milikmu.",
		"SUPERCOPA": "SUPERCUP",
		"Supercopa": "Piala Super",
		"Campeón de Supercopa": "Juara Piala Super",
		"Supercampeón": "Juara Super",
		"Ganar la Supercopa de tu país.": "Menangkan Piala Super negaramu.",
		"El campeón contra el campeón. Y la copa, tuya.": "Juara lawan juara. Dan pialanya milikmu.",
		"SUPERCOPA · FINAL": "FINAL PIALA SUPER",
		"COPA DE LA ASOCIACIÓN": "PIALA ASOSIASI",
		"Copa de la Asociación": "Piala Asosiasi",
		"COPA DE LAS LIGAS": "PIALA DUA LIGA",
		"Copa de las Ligas": "Piala Dua Liga",
		"Campeón de la Copa de las Ligas": "Juara Piala Dua Liga",
		"DUELO DE CAMPEONES": "DUEL JUARA",
		"Rey de las Dos Ligas": "Raja Dua Liga",
		"Ganar la Copa de las Ligas.": "Menangkan Piala Dua Liga.",
		"Duelo de campeones entre dos ligas. Y la copa, tuya.": "Duel juara dua liga. Dan pialanya milikmu.",
	},
	"apertura_clausura": {
		"APERTURA": "APERTURA",
		"CLAUSURA": "CLAUSURA",
		"Apertura": "Apertura",
		"Clausura": "Clausura",
		"EN LIGUILLA": "MASUK LIGUILLA",
		"IGUALADO CON LA LIGUILLA": "SAMA DENGAN LIGUILLA",
		"A {0} PTS DE LA LIGUILLA": "{0} PTS DARI LIGUILLA",
		"{0} es bicampeón: Apertura y Clausura": "{0} juara ganda: Apertura dan Clausura",
		"{0} gana el Clausura; el Apertura fue de {1}": "{0} juara Clausura; Apertura milik {1}",
		"ANUAL": "TAHUNAN",
		"El torneo aún no arranca.": "Turnamen ini belum dimulai.",
		"{0} os deja fuera. Se acabó el Apertura; queda el Clausura.": "{0} menyingkirkan kalian. Apertura usai; masih ada Clausura.",
	},
	"liguilla": {
		"ESTO SE VA A LOS PENALES": "INI BAKAL KE ADU PENALTI",
		"GLOBAL EMPATADO: PASAS POR POSICIÓN": "IMBANG: KAMU LOLOS KARENA PERINGKAT",
		"GLOBAL EMPATADO: PASA EL RIVAL POR POSICIÓN": "IMBANG: LAWAN LOLOS KARENA PERINGKAT",
		"PASAS POR POSICIÓN": "LOLOS VIA POSISI",
		"FUERA POR POSICIÓN": "GUGUR VIA POSISI",
		"POR POSICIÓN": "VIA POSISI",
		"SI ACABA ASÍ: PENALTIS": "SKOR INI: PENALTI",
		"SI ACABA ASÍ: OTRA NOCHE": "SKOR INI: SATU LAGA LAGI",
		"Así, nos toca otra noche. Que no haga falta.": "Kalau begini, kita main sekali lagi. Jangan sampai.",
		"Así, penaltis. Y nadie quiere penaltis.": "Kalau begini, adu penalti. Tak ada yang mau itu.",
		"LIGUILLA": "LIGUILLA",
		"PLAY-IN": "PLAY-IN",
		"Play-in": "Play-in",
		"FINAL DE LA LIGUILLA": "FINAL LIGUILLA",
		"SUPERLÍDER: {0}": "PUNCAK: {0}",
		"Entrar a la liguilla": "Masuk Liguilla",
		"Superlíder": "Pemuncak",
		"No entró": "Tak lolos",
		"{0} en la tabla": "{0} di klasemen",
		"Campeón de Liga: {0}": "Juara liga: {0}",
		"Del 1º al 6º, a cuartos; del 7º al 10º, al play-in.": "Peringkat 1-6 ke perempat final; 7-10 ke play-in.",
		"Así quedaría si la liga acabara hoy.": "Begini jika liga berakhir hari ini.",
		"Dos partidos y la liga es vuestra. En esta sala ya no habla nadie de suerte.": "Dua laga lagi dan liga jadi milik kalian. Di ruangan ini tak ada yang bicara soal untung.",
		"Semifinales. Dos cruces más y la liga es vuestra.": "Semifinal. Dua babak lagi dan liga milik kalian.",
		"Global igualado y pasa el mejor de la tabla: {0}. No hizo falta ni la tanda.": "Agregat imbang, yang lebih tinggi di klasemen lolos: {0}. Tanpa adu penalti.",
		"A un cruce de la final. Esta sala va a tardar en olvidarlo.": "Satu babak lagi ke final. Ruangan ini tak akan cepat lupa.",
		"{0} os deja fuera. Se acabó la liguilla y con ella el año.": "{0} menyingkirkan kalian. Liguilla usai, musim pun berakhir.",
		"Una liga entera para perderla en la última noche. La vuelta al campo la dan ellos.": "Semusim penuh, lepas di malam terakhir. Mereka yang berkeliling lapangan.",
		"{0} gana la liguilla y la liga; {1} fue superlíder": "{0} juara Liguilla dan liga; {1} pemuncak klasemen",
		"{0} es Campeón de Campeones": "{0} juara Campeón de Campeones",
		"{0} es Campeón de Campeones ante {1}": "{0} kalahkan {1}, juara Campeón de Campeones",
		"Del 1º al 8º, a cuartos.": "Peringkat 1 sampai 8 ke perempat final.",
	},


	"golpeo_puntero": {
		"Jala el stick derecho y suelta para tirar": "Tarik stik kanan lalu lepas untuk menembak",
		"Jala el stick derecho y suelta para centrar": "Tarik stik kanan lalu lepas untuk umpan silang",

		"Jala el stick izquierdo y suelta para tirar": "Tarik stik kiri lalu lepas untuk menembak",
		"Jala el stick izquierdo y suelta para centrar": "Tarik stik kiri lalu lepas untuk umpan silang",


		"Apunta con el stick · pulsa el botón": "Bidik dengan stik · tekan tombol",
		"CENTRO · apunta y pulsa el botón": "SILANG · bidik lalu tekan tombol",
	},

	"pingpong_matt": {
		"pingpong_mattRETO DE MATT": "DUEL MATT",
		"pingpong_mattENTRENO": "LATIHAN",
		"pingpong_mattDESAFIO": "TANTANGAN",
		"pingpong_mattLEYENDA": "LEGENDA",
		"pingpong_mattVENCISTE A MATT": "MATT KALAH",
		"pingpong_mattGANO MATT": "MATT WIN",
		"pingpong_mattSAQUE DE MATT": "SERVIS MATT",
		"pingpong_mattPUNTO PARA MATT": "POIN MATT",
		"pingpong_mattATAQUE": "SERANG",
		"pingpong_mattMATT ATACA": "MATT SERANG",
		"pingpong_mattVICTORIAS": "MENANG",
		"pingpong_mattRECORD": "REKOR",
		"pingpong_mattCAMPEON": "JUARA",
		"pingpong_mattINTERCAMBIO: {0}": "RALI: {0}",
		"pingpong_mattMueve la pala. Toca para sacar.": "Geser bet. Ketuk untuk servis.",
		"pingpong_mattCentro: ataque. Lateral: colocación.": "Tengah: serangan. Pinggir: arah.",
	},
	"museo_visita": {
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida se borra; su museo queda disponible para visitar. Esto no se puede deshacer.": "Di hall tetap ada plakatnya: statistik, trofi, dan klub. Data game dihapus; museumnya tetap bisa dikunjungi. Ini tidak bisa dibatalkan.",
		"MEJOR TEMPORADA": "MUSIM TERBAIK",
		"Por premios, media y aportación.": "Berdasarkan penghargaan, rating, dan kontribusi.",
		"ELIGE DOS CARRERAS": "PILIH DUA KARIER",
		"ELIGE OTRA CARRERA": "PILIH KARIER LAIN",
		"COMPARAR CARRERAS": "BANDINGKAN KARIER",
		"CAMBIAR CARRERAS": "GANTI KARIER",
		"DERROTAS": "KALAH",
		"EMPATES": "SERI",
		"VICTORIAS": "MENANG",
		"RECONOCIMIENTOS": "PENGHARGAAN",
		"LEYENDA DEL CLUB": "LEGENDA KLUB",
		"LEYENDA DE LA LIGA": "LEGENDA LIGA",
		"LEYENDA DE LA SELECCIÓN": "LEGENDA TIMNAS",
		"RÉCORDS REGISTRADOS": "REKOR TERCATAT",
		"MEJOR DE LA HISTORIA": "TERBAIK SEJARAH",
		"TROFEOS": "TROFI",
		"PREMIOS": "AWARD",
		"POR EQUIPO": "PER TIM",
		"No se conservaron las estadísticas por temporada.": "Statistik per musim tidak tersimpan.",
		"V": "M",
		"D": "K",
		"VISITAR MUSEO": "LIHAT MUSEUM",
		"SALAS": "RUANG",
		"VESTÍBULO": "LOBI",
		"HAT-TRICKS": "HAT-TRICK",
		"TU MUSEO": "MUSEUMMU",
		"ESTÁS AQUÍ": "KAMU DI SINI",
		"VISITAR SALA": "MASUKI RUANG",
		"TOCA PARA EXPLORAR": "KETUK: JELAJAHI",
	},
	"coleccion_pistas": {
		"TIROS LIBRES": "FREE KICK",
		"CÓRNERS": "KORNER",
		"SAQUES DE BANDA": "LEMPARAN",
		"INDIRECTAS": "TAK LANGSUNG",
		"MANO A MANO": "1 LAWAN 1",
		"TIRO FRONTAL": "TEMBAK LURUS",
		"TIRO LEJANO": "TEMBAK JAUH",
		"TIRO CRUZADO": "TEMBAK SUDUT",
		"CONTRAS": "COUNTER",
		"CENTROS": "SILANG",
		"PRIMERA OCASIÓN": "PELUANG PERTAMA",
		"GOLES DE TU EQUIPO": "GOL TIMMU",
		"GOLES DEL RIVAL": "GOL LAWAN",
		"{0} GANANDO": "{0} SAAT UNGGUL",
		"{0} SIN GANAR": "{0} SAAT TAK UNGGUL",
		"{0} DESDE EL {1}'": "{0} DARI {1}'",
		"{0} HASTA EL {1}'": "{0} SAMPAI {1}'",
		"CUÁNDO": "KAPAN",
		"EN DERBIS": "DI DERBY",
		"DE VISITANTE": "TANDANG",
		"SÓLO EN CLUB": "HANYA KLUB",
		"EXPULSIONES": "KARTU MERAH",
		"OCASIÓN FALLADA": "PELUANG GAGAL",

		"PISTA: {0}": "CLUE: {0}",
		"BALONES PARA TI": "BOLA UNTUKMU",
		"LESIONES": "CEDERA",
		"GASTO DE ENERGÍA": "PEMAKAIAN ENERGI",
		"TE SIENTA BAJO": "CADANG DI BAWAH",
		"RECUPERACIÓN": "PEMULIHAN",
		"PUESTO HASTA LOS 23": "TEMPAT SAMPAI 23",
		"PUESTO SIN SU CONFIANZA": "TEMPAT SAMPAI DIPERCAYA",
		"JORNADAS EN LA GRADA": "PEKAN DI TRIBUN",
		"TRAS GANAR": "USAI MENANG",
		"REPITE EL ONCE": "INTI SAMA LAGI",
		"BRONCA TRAS MAL PARTIDO": "TEGURAN USAI LAGA BURUK",
		"AFICIÓN Y PRENSA AL PERDER": "SUPORTER & PERS SAAT KALAH",
		"MEJORA DE CONTRATO": "KENAIKAN KONTRAK",
		"CAMBIO DE DIBUJO": "GANTI FORMASI",
		"Ser generoso desde los once metros también tiene premio.": "Bermurah hati dari titik penalti juga ada hadiahnya.",
		"En la cantera hay un chaval que necesita a alguien que crea en él.": "Di akademi ada anak muda yang butuh seseorang yang percaya padanya.",
		"Desde los once metros, a veces el balón es sólo tuyo.": "Dari titik penalti, kadang bola itu hanya milikmu.",
		"Ningún partido está perdido aunque vayas dos goles abajo.": "Tak ada laga yang pasti kalah, meski tertinggal dua gol.",
		"Los de la tele graban muy pegados a la línea de fondo.": "Kru TV merekam sangat dekat dengan garis gawang.",
		"No todo balón tiene que acabar en la portería rival.": "Tak semua bola harus berakhir di gawang lawan.",
		"El portero deja algo para beber junto a su poste.": "Kiper menaruh minuman di dekat tiangnya.",
		"En una final, alguien de la grada quiere un recuerdo contigo.": "Di final, ada suporter di tribun yang ingin kenang-kenangan bersamamu.",
		"A veces se posan visitas con alas sobre el césped.": "Kadang tamu bersayap hinggap di lapangan.",
		"Arriba, los del palco miran el partido detrás de un cristal.": "Di atas sana, tamu VIP menonton laga dari balik kaca.",
		"El que te devuelve los balones espera junto a la banda.": "Anak yang mengembalikan bola menunggu di dekat garis lapangan.",
		"Al acabar un derbi, mira lo que pasa entre los dos banquillos.": "Usai derby, lihat apa yang terjadi di antara dua bangku cadangan.",
		"En el apretón del derbi, el que aprieta más gana.": "Saat jabat tangan derby, yang menggenggam paling kuat menang.",
		"El banquillo de enfrente también está a tiro.": "Bangku cadangan lawan juga dalam jangkauan tembakan.",
		"Tu propio banquillo también está a tiro.": "Bangku cadanganmu sendiri juga dalam jangkauan tembakan.",
		"El míster de enfrente grita de pie en su área técnica.": "Pelatih lawan berteriak sambil berdiri di area teknisnya.",
		"Tu propio míster también está de pie en la banda.": "Pelatihmu sendiri juga berdiri di pinggir lapangan.",
		"A fuerza de balonazos, un banquillo se puede vaciar.": "Kalau terus menendang liar, bangku cadangan bisa kosong.",
		"Entre la hierba asoman las cabezas del riego.": "Kepala penyiram menyembul di antara rumput.",
		"En la grada hay vasos llenos, y los balones que se van caen en algún sitio.": "Di tribun ada gelas penuh, dan bola yang melambung jatuh entah di mana.",
		"En la grada alguien pasea con una bandeja de comida.": "Di tribun ada yang berkeliling membawa nampan makanan.",
		"Si la grada te abuchea, contéstale donde más duele.": "Kalau suporter mencemoohmu, balas di tempat yang paling menyakitkan.",
		"En algunos campos de barrio no hay nada detrás del arco.": "Di beberapa lapangan kampung tak ada apa-apa di belakang gawang.",
		"No todas las finales acaban con la copa en tus manos.": "Tak semua final berakhir dengan piala di tanganmu.",
		"Si un club te quita una final, búscalo en otra.": "Kalau sebuah klub merebut final darimu, cari klub itu di final lain.",
		"Una Nueva Carrera+ con ventajas, jugada hasta el último día.": "Karier Baru+ dengan perk, dimainkan sampai hari terakhir.",
		"En tu casa hay un volante esperando: ni frenos ni hierba.": "Di rumahmu ada setir menunggu: tanpa rem, tanpa rumput.",
		"La maquinita de tu casa guarda un récord por batir.": "Mesin arkade di rumahmu menyimpan rekor yang harus dipecahkan.",
		"La diana de tu casa premia la puntería fina.": "Papan dart di rumahmu menghargai bidikan yang tajam.",
		"Hay balones sueltos por el banquillo, y el míster no siempre mira.": "Ada bola berserakan di sekitar bangku cadangan, dan pelatih tidak selalu melihat.",
		"En el billar de tu casa, no dejes jugar al rival.": "Di meja biliar rumahmu, jangan biarkan lawan main.",
		"Si te casas, piensa bien a nombre de quién pones la casa.": "Kalau menikah, pikir baik-baik atas nama siapa rumahnya.",
		"De visita, tarde y perdiendo por la mínima, el balón tarda en volver.": "Tandang, di menit akhir dan kalah satu gol, bola lama sekali kembali.",
	},
	"tapetes_formas": {
		"TAPETE OVALADO": "KARPET OVAL",
		"Lana de contorno oval, con borde tejido y centro suave.": "Karpet wol berbentuk oval, bertepi anyaman dan bagian tengah lembut.",
		"TAPETE HEXAGONAL": "KARPET HEKSAGON",
		"Seis lados y franjas concéntricas para vestir un rincón.": "Enam sisi dan garis konsentris untuk menghias sudut ruangan.",
		"TAPETE ORGÁNICO": "KARPET ORGANIK",
		"Curvas suaves e irregulares, como una piedra de río.": "Lengkung lembut tak beraturan, seperti batu sungai.",
		"TAPETE DE PASILLO": "KARPET LORONG",
		"Tejido alargado con esquinas redondas y bandas claras.": "Anyaman panjang dengan sudut membulat dan garis terang.",
		"el tapete no puede atravesar una pared": "karpet tidak bisa menembus dinding",
	},
	"decoracion_salon": {
		"TAPETE REDONDO": "KARPET BULAT",
		"TAPETE TEJIDO": "KARPET ANYAM",
		"BOCINAS DE TORRE": "SPEAKER TOWER",
		"BOCINAS DE ESTANTE": "SPEAKER RAK",
		"LIBRERO ABIERTO": "RAK TERBUKA",
		"LIBRERO MODULAR": "RAK MODULAR",
		"Yute trenzado en círculos. Va debajo de mesas y sillones.": "Goni anyam melingkar. Muat di bawah meja dan sofa.",
		"Lana con rombos y flecos. Viste el suelo sin estorbar el paso.": "Wol bermotif belah ketupat dan berumbai. Menghias lantai tanpa menghalangi jalan.",
		"Dos torres de audio con conos y puertos al frente.": "Dua speaker tower dengan cone dan port menghadap depan.",
		"Dos bocinas compactas y receptor sobre un mueble bajo.": "Dua speaker kecil dan receiver di atas kabinet rendah.",
		"Madera y tubos oscuros, con baldas abiertas para libros.": "Kayu dan pipa gelap, dengan rak terbuka untuk buku.",
		"Cubos, cajones y libros en una composición de madera.": "Kubus, laci, dan buku dalam susunan kayu.",
	},
	"nivel_club": {
		"TU NIVEL EN EL CLUB": "LEVELMU DI KLUB",
		"CON VOZ": "SUARA",
		"DE CONFIANZA": "DIPERCAYA",
		"HOMBRE DE LA CASA": "ANDALAN KLUB",
		"Subes de nivel en el club: {0}.": "Levelmu naik di klub: {0}.",
		"Bajas de nivel en el club: {0}.": "Levelmu turun di klub: {0}.",
		"Pierdes el brazalete del club.": "Kamu kehilangan ban kapten klub.",
		"Tu peso en el club te deja pedir número sin esperar a renovar. Llevas el {0}: uno libre es tuyo; el de un compañero, depende de él.": "Pengaruhmu di klub memungkinkanmu minta nomor tanpa menunggu perpanjangan. Kamu pakai {0}: yang kosong jadi milikmu; milik rekan setim, tergantung dia.",
		"{0} no te cede el {1}. Sigues con el {2}.": "{0} tidak mau memberikan {1} padamu. Kamu tetap pakai {2}.",
		"{0} te cede el {1}.": "{0} memberikan {1} padamu.",
		"El club ya te dijo que no a este fichaje en esta ventana.": "Klub sudah menolak transfer ini di bursa kali ini.",
		"Acabas de llegar: el club aún no te consulta los fichajes. Con {0} de relación pasas a {1} y puedes proponerlos.": "Kamu baru tiba: klub belum meminta pendapatmu soal transfer. Dengan hubungan {0}, kamu naik ke {1} dan bisa mengusulkannya.",
		"EN RIESGO": "BERISIKO",
		"ES EL NIVEL {0}: VAS EN EL {1}": "BUTUH LEVEL {0}: KAMU {1}",
		"TE FALTAN {0} DE RELACIÓN": "KURANG {0} HUBUNGAN",
		"TITULAR EL {0} %: PIDE {1} %": "INTI {0} %: BUTUH {1} %",
		"NO ERES TITULAR": "BUKAN PEMAIN INTI",
		"Venderlo, protegerlo o pedir que lo renueven es del nivel {0}: {1} de relación con el club.": "Menjual, melindungi, atau minta kontraknya diperpanjang butuh level {0}: hubungan {1} dengan klub.",
		"Vender es del nivel {0}: {1} de relación con el club.": "Menjual butuh level {0}: hubungan {1} dengan klub.",
		"Pedir otro técnico es del nivel {0}: {1} de relación con el club.": "Minta pelatih lain butuh level {0}: hubungan {1} dengan klub.",
		"Ya lo pediste esta temporada.": "Kamu sudah memintanya musim ini.",
		"Antes, contesta lo que tienes pendiente.": "Jawab dulu yang masih tertunda.",
		"PEDIR OTRO DORSAL": "MINTA NOMOR BARU",
		"Con tu nivel, el club decide cada fichaje al confirmar: {0} % de que diga que sí. Al que rechace no se le vuelve a proponer en esta ventana.": "Dengan levelmu, klub memutuskan tiap transfer saat kamu konfirmasi: dengan peluang {0} % dia bilang ya. Yang ditolak tak bisa diusulkan lagi di bursa ini.",
		"VENDER": "JUAL",
		"EL CLUB DIJO NO": "KLUB MENOLAK",
		"relación": "hubungan",
		"nivel": "level",
		"El {0} lo lleva {1}. Toca otra vez y se lo pides: hay un {2} % de que te lo ceda.": "{0} dipakai {1}. Ketuk lagi untuk memintanya: peluang {2} % dia mau melepasnya.",
		"El {0} lo lleva {1}. Mantén y se lo pides: hay un {2} % de que te lo ceda.": "{0} dipakai {1}. Tahan untuk memintanya: peluang {2} % dia mau melepasnya.",
		"TU NIVEL: {0}": "LEVELMU: {0}",
		"BAJAS DE NIVEL EN EL CLUB": "LEVELMU TURUN DI KLUB",
		"PIDES OTRO DORSAL": "MINTA NOMOR BARU",
		"TU PETICIÓN": "PERMINTAAN",
		"El club te dio la voz y el vestuario la reconoce. Ahora la cinta es tuya.": "Klub memberimu suara dan ruang ganti mengakuinya. Sekarang ban kapten milikmu.",
		"VES LA MESA": "LIHAT DAFTAR",
		"PROPONES FICHAJES": "USUL TRANSFER",
		"COMPRAS Y VENTAS": "BELI & JUAL",
		"OTRO DORSAL": "NOMOR BARU",
		"OTRO TECNICO": "PELATIH BARU",
		"PRIMA FIDELIDAD": "BONUS LOYALITAS",
		"GRADA FIEL": "FANS SETIA",
		"MAS MARGEN": "LEBIH LUANG",
		"Pediste salir: el club ya no te consulta su plantilla.": "Kamu minta keluar: klub tak lagi meminta pendapatmu soal skuadnya.",
		"Prima de fidelidad": "Bonus loyalitas",
		"CEDIDO: TU NIVEL TE ESPERA": "PINJAMAN: LEVEL DITAHAN",
		"BAJAS EN {0}": "TURUN DI {0}",
		"PROMETIDO AL VETERANO": "DIJANJIKAN KE SENIOR",
		"CLUB NUEVO": "KLUB BARU",
		"Una vez por temporada.": "Sekali per musim.",
	},
	"mesa_fichajes": {
		"BUSCAR EN EL RANKING": "CARI DI RANKING",
		"Los fichajes se marcan con + en el ranking.": "Transfer ditandai dengan + di ranking.",
		"VENDER ({0})": "JUAL ({0})",
		"CONFIRMAR ({0})": "KONFIRM ({0})",
		"{0} SIN CONFIRMAR": "{0} TERTUNDA",
		"Es tu último {0}: sin él no hay quien juegue ahí.": "Dia {0} terakhirmu: tanpa dia tak ada yang bisa main di posisi itu.",
		"Estás cedido: tu club no te pregunta por sus fichajes.": "Kamu sedang dipinjamkan: klubmu tak meminta pendapatmu soal transfernya.",
		"FICHADOS": "MASUK",
		"VENDIDOS": "TERJUAL",
		"FICHAJES ({0})": "MASUK ({0})",
		"VENTAS ({0})": "KELUAR ({0})",
		"FICHAR EN LA MESA": "TANDAI REKRUT",
		"VENDER EN LA MESA": "TANDAI JUAL",
		"QUITAR DE LA MESA": "LEPAS TANDA",
		"FICHAS": "MASUK",
		"VENDES": "KELUAR",
		"FIRMO ESTE AÑO": "REKRUTAN BARU",
		"Firmaste con otro club: la plantilla del año que viene ya no la haces tú.": "Kamu sudah teken dengan klub lain: skuad musim depan bukan lagi kamu yang menyusun.",
		"Firmó esta temporada: no se vende hasta la próxima.": "Teken musim ini: tak bisa dijual sampai musim depan.",
		"Juega aquí cedido: no es tuyo para venderlo.": "Dia di sini berstatus pinjaman: kamu tak berhak menjualnya.",
		"LA MESA": "DAFTAR",
		"La plantilla quedaría en {0}: el máximo es {1}.": "Skuad akan jadi {0}: maksimalnya {1}.",
		"La plantilla quedaría en {0}: el mínimo es {1}.": "Skuad akan jadi {0}: minimalnya {1}.",
		"Lo pide tu técnico: si llega, te lo apunta.": "Pelatihmu menginginkannya: kalau dia datang, dicatat untukmu.",
		"Si fichas a uno de esa línea, el técnico te lo apunta.": "Kalau kamu rekrut satu dari lini itu, pelatih mencatatnya untukmu.",
		"Marca a quién vendes y a quién fichas.": "Tandai siapa yang kamu jual dan siapa yang kamu rekrut.",
		"Marcado ({0}). Te faltan {1}.": "Ditandai ({0}). Kurang {1}.",
		"Marcado ({0}). Te queda {1}.": "Ditandai ({0}). Sisa {1}.",
		"Mercado cerrado. La mesa abre con la próxima ventana, que dura {0} {1}.": "Bursa tutup. Daftar dibuka bersama bursa berikutnya, yang berlangsung {0} {1}.",
		"Mercado cerrado: la mesa abre con la próxima ventana.": "Bursa tutup: daftar dibuka bersama bursa berikutnya.",
		"NO QUIERE VENIR": "TAK MAU DATANG",
		"NO QUISO VENIR": "DIA MENOLAK",
		"NO SALIERON": "GAGAL",
		"Nada de lo marcado sale hoy: mira los avisos en rojo.": "Tak satu pun yang ditandai bisa jalan hari ini: lihat peringatan merah.",
		"Nadie lo compra hoy a ese precio.": "Hari ini tak ada yang mau membelinya dengan harga itu.",
		"No hay vuelta atrás: se mueve todo a la vez.": "Tak ada jalan kembali: semuanya bergerak sekaligus.",
		"No quiere venir: interés {0} % (mínimo {1} %).": "Dia tak mau datang: minat {0} % (minimal {1} %).",
		"PRESUPUESTO": "ANGGARAN",
		"QUEDA": "SISA",
		"QUEDA EN LA MESA": "SISA ANGGARAN",
		"SIN COMPRADOR": "TANPA PEMBELI",
		"SIN DINERO": "TANPA DANA",
		"Sin club no hay mesa de fichajes.": "Tanpa klub tak ada daftar transfer.",
		"Está cedido: quien lo tiene no lo puede vender.": "Sedang dipinjamkan: klub yang memakainya tak bisa menjualnya.",
		"Su club no lo vende: sólo sale pagando su cláusula.": "Klubnya tak menjualnya: hanya bisa pergi lewat klausul pelepasan.",
		"Te faltan {0}: vende a alguien o quita un fichaje.": "Kurang {0}: jual seseorang atau batalkan satu transfer.",
		"Te pagan un {0} % menos de lo que vale: el comprador sabe que tienes prisa.": "Kamu dibayar {0} % lebih murah dari nilainya: pembeli tahu kamu sedang buru-buru.",
		"ULTIMO {0}": "{0} TERAKHIR",
		"VA AL {0}": "KE {0}",
		"Va al {0} por {1} cuando confirmes la mesa.": "Dia ke {0} seharga {1} saat kamu konfirmasi daftar.",
		"Ventana abierta: {0} {1} por delante. Nada se mueve hasta que confirmes.": "Bursa dibuka: {0} {1} lagi. Tak ada yang bergerak sampai kamu konfirmasi.",
		"Ya juega en tu club.": "Dia sudah main di klubmu.",
		"DEF": "DEF",
		"MED": "MID",
		"DEL": "FWD",
	},
	"surf_casa": {
		"ALBERCA DE OLAS": "KOLAM OMBAK",
		"Alberca decorativa con olas en movimiento, agua translúcida y espuma. Incluye generador y tabla.": "Kolam dekoratif dengan ombak bergerak, air bening, dan busa. Termasuk generator dan papan selancar.",
	},
	"penthouse_tecnologia": {
		"SEMANA {0}": "MINGGU {0}",
		"SOFÁ PENTHOUSE": "SOFA PENTHOUSE",
		"Sofá modular de piel crema, nogal y latón. Recibe visitas en tu salón.": "Sofa modular kulit krem dengan kayu walnut dan kuningan. Terima tamu di ruang tamumu.",
		"COMEDOR PENTHOUSE": "SET MAKAN PENTHOUSE",
		"Mesa de mármol negro con seis sillas de piel y detalles de latón.": "Meja marmer hitam dengan enam kursi kulit dan detail kuningan.",
		"CAMA PENTHOUSE": "BED PENTHOUSE",
		"Cama flotante de nogal con cabecero iluminado. Permite dormir de verdad.": "Ranjang walnut melayang dengan sandaran kepala berlampu. Bisa tidur sungguhan.",
		"ROBOT ASPIRADOR": "ROBOT VAKUM",
		"Robot con base de carga. Recorre el suelo libre al colocarlo en casa.": "Robot dengan dok pengisi daya. Berkeliling di lantai kosong saat dipasang di rumah.",
		"ESPEJO INTELIGENTE": "CERMIN PINTAR",
		"Espejo de pie con pantalla: consulta tu estado y los próximos partidos.": "Cermin berdiri dengan layar: cek kondisimu dan laga berikutnya.",
		"MESA HOLOGRÁFICA": "MEJA HOLOGRAM",
		"Mesa táctica con proyección 3D. Explora cuatro formaciones y gira la vista.": "Meja taktik dengan proyeksi 3D. Jelajahi empat formasi dan putar tampilannya.",
		"CONSULTAR ESPEJO": "CEK CERMIN",
		"EXPLORAR TÁCTICA": "JELAJAH TAKTIK",
		"TECNOLOGÍA": "TEKNOLOGI",
		"Compra este objeto para usarlo.": "Beli barang ini untuk memakainya.",
		"ENERGÍA {0}/100": "ENERGI {0}/100",
		"ÁNIMO {0} · LESIÓN: {1} SEMANAS": "MORAL {0} · CEDERA: {1} MINGGU",
		"PRÓXIMOS PARTIDOS": "LAGA BERIKUT",
		"No hay partidos programados.": "Tak ada laga terjadwal.",
		"FECHA POR CONFIRMAR": "TANGGAL BELUM PASTI",
		"Tu estado se actualiza cada vez que consultas el espejo.": "Kondisimu diperbarui setiap kali kamu mengecek cermin.",
		"CAMBIAR ESQUEMA": "GANTI SKEMA",
		"VISTA INICIAL": "TAMPILAN AWAL",
		"Gira el campo con el dedo. Los esquemas son de consulta.": "Putar lapangan dengan jarimu. Skemanya hanya untuk dilihat.",
		"FORMACIÓN {0}": "FORMASI {0}",
		"ÁNIMO {0} · LESIÓN: {1} DÍAS": "MORAL {0} · CEDERA: {1} HARI",
	},
	"basket_reloj": {
		"SEGUIDAS": "BERUNTUN",
		"CANASTAS": "MASUK",
		"LIMPIAS": "SWISH",
		"TIRO {0}/10": "SHOT {0}/10",
		"POSICIÓN {0}/5": "POSISI {0}/5",
		"Desliza hacia el aro y suelta.": "Gesek ke arah ring lalu lepas.",
		"2 por canasta · 3 limpia · +1 cada 3 seguidas": "2 per basket · 3 swish · +1 tiap 3 beruntun",
		"¡LIMPIA!": "SWISH!",
		"CORTO · MÁS FUERZA": "PENDEK · KUATKAN",
		"LARGO · MENOS FUERZA": "KEJAUHAN · PELANKAN",
		"IZQUIERDA · AJUSTA EL GESTO": "KIRI · ATUR GERAKAN",
		"DERECHA · AJUSTA EL GESTO": "KANAN · ATUR GERAKAN",
		"+{0} PUNTOS": "+{0} POIN",
		"{0} PUNTOS · {1}/10": "{0} POIN · {1}/10",
		"MEJOR RACHA {0} · LIMPIAS {1}": "BERUNTUN MAKS {0} · SWISH {1}",
		"RÉCORD DE SESIÓN": "REKOR SESI",
		"TIRO FALLADO": "SHOT MELESET",
		"CANASTA DE BASKET": "RING BASKET",
		"RELOJ DE PIE": "JAM BERDIRI",
		"Canasta con tablero, red y balón. Diez tiros haciendo flick hacia el aro.": "Ring dengan papan, jaring, dan bola. Sepuluh tembakan dengan flick ke arah ring.",
		"Reloj decorativo de madera con esfera, péndulo y pesas de latón.": "Jam kayu dekoratif dengan muka jam, bandul, dan pemberat kuningan.",
		"JUGAR BASKET": "MAIN BASKET",
		"BASKET": "BASKET",
		"Toca el balón, haz flick hacia el aro y suelta.": "Sentuh bola, flick ke arah ring lalu lepas.",
		"TIRO {0}/10 · CANASTAS {1}": "SHOT {0}/10 · MASUK {1}",
		"Compra una canasta para jugar.": "Beli ring basket untuk bermain.",
		"DIEZ TIROS · CINCO POSICIONES": "SEPULUH SHOT · LIMA POSISI",
		"{0}/10 CANASTAS · MEJOR RACHA {1}": "{0}/10 MASUK · BERUNTUN MAKS {1}",
		"OTRA RONDA": "MAIN LAGI",
		"DESLIZA HACIA LA CANASTA": "GESER KE RING",
		"Desliza el balón hacia la canasta. Más rápido, más fuerte.": "Geser bola ke ring. Makin cepat, makin kuat.",
		"TOCA EL BALÓN Y LANZA": "SENTUH BOLA & LEMPAR",
		"¡CANASTA!": "MASUK!",
	},
	"pingpong_dedo": {
		"Mueve la raqueta con el dedo sobre la mesa. Toca para sacar.": "Gerakkan bet dengan jarimu di atas meja. Ketuk untuk servis.",
		"La raqueta sigue tu dedo. Golpea de lado para dirigir la pelota.": "Bet mengikuti jarimu. Pukul dengan tepi bet untuk mengarahkan bola.",
	},
	"minijuegos_mandos": {
		"PARTIDA EN CURSO": "LAGA BERJALAN",
		"SUAVE": "MUDAH",
		"EXPERTO": "AHLI",
		"CONTROL": "KONTROL",
		"ATAQUE": "SERANG",
		"MEJOR INTERCAMBIO: {0}": "RALI TERBAIK: {0}",
		"Centra la pala para atacar; de canto, bloqueas suave.": "Pukul dengan bagian tengah bet untuk menyerang; dari tepi, bloknya lembut.",
		"La pelota tocó la red.": "Bola mengenai net.",
		"La pelota salió de la mesa.": "Bola keluar dari meja.",
		"La pala no llegó a la pelota.": "Bet tak mengenai bola.",
		"La pelota botó dos veces.": "Bola memantul dua kali.",
		"La pelota botó en el campo propio.": "Bola memantul di sisi sendiri.",
		"El saque no botó en ambos campos.": "Servis tidak memantul di kedua sisi.",
		"PUNTO DE PARTIDO": "MATCH POINT",
		"ARRASTRA PARA GIRAR · SUELTA PARA CENTRAR": "SERET UNTUK BELOK · LEPAS UNTUK LURUS",
		"FUERA DEL ASFALTO: VUELVE A LA PISTA": "DI LUAR ASPAL: KEMBALI KE LINTASAN",
		"CONTROL {0} · {1} s": "CHECKPOINT {0} · {1} s",
		"CONTROL PERDIDO · PUEDES REINICIAR EN PAUSA": "CHECKPOINT TERLEWAT · ULANGI DARI JEDA",
		"Avance automático. Arrastra para girar y toca el freno.": "Maju otomatis. Seret untuk belok dan ketuk rem.",
		"PRÓXIMO CONTROL: {0} m": "CHECKPOINT BERIKUT: {0} m",
		"META: {0} m": "FINIS: {0} m",
	},


	"clausulas": {
		"NEGOCIAR CLÁUSULAS": "NEGO KLAUSUL",
		"MANTÉN PARA PRESENTAR": "TAHAN UNTUK AJUKAN",
		"Hasta {0}.": "Hingga {0}.",
		"ACEPTAN": "SETUJU",
		"CONTRAOFERTA": "TAWAR BALIK",
		"×1": "×1",
		"×1,5": "×1.5",
		"×2": "×2",
		"×3": "×3",
		"NO JUEGAN CON ESE PUESTO": "TAK PAKAI POSISI ITU",
		"SU TITULAR ES MUCHO MEJOR": "INTINYA JAUH LEBIH BAIK",
		"ESPERAS SU RESPUESTA": "MENUNGGU JAWABAN",
		"YA NEGOCIASTE LAS CLÁUSULAS": "KLAUSUL SUDAH DINEGO",
		"SIN MESA ABIERTA": "MEJA BELUM BUKA",
		"YA NEGOCIASTE ESTE AÑO": "SUDAH NEGO TAHUN INI",
		"Ya negociaste tus cláusulas esta temporada.": "Kamu sudah menegosiasikan klausulmu musim ini.",
		"RENOVAR EN AGENTE": "PERPANJANG: AGEN",
		"RENEGOCIAR EN AGENTE": "NEGO ULANG: AGEN",
	},


	"avisos_hoy": {
		"HOY, EL TÍTULO": "HARI JUARA",
		"HOY, EL ASCENSO": "HARI PROMOSI",
		"HOY, LA SALVACIÓN": "HARI BERTAHAN",
		"GANA Y LO SELLAS": "MENANG & KUNCI",
		"UN PUNTO BASTA": "SERI CUKUP",
		"COMPRA UN MUEBLE": "BELI PERABOT",
		"MIRA QUIÉN TE SIGUE": "LIHAT PEMANTAUMU",
	},


	"alineaciones": {
		"ALINEACIONES": "LINE-UP",
	},


	"radio": {
		"TEMA DEL JUEGO": "TEMA UTAMA",
		"LUCES DEL ESTADIO": "LAMPU STADION",
		"CAMINO A LA GLORIA": "JALAN KEJAYAAN",
		"DOMINGO DE SOL": "MINGGU CERAH",
		"NOCHE LARGA": "LARUT MALAM",
		"SEMANA DE FINAL": "PEKAN FINAL",
		"VENTANA DE FICHAJES": "BURSA TRANSFER",
		"LEVANTAR LA COPA": "ANGKAT TROFI",
		"NOCHE DE COPA": "MALAM PIALA",
		"NOCHE DE ESTRELLAS": "MALAM BINTANG",
		"JUEVES EUROPEO": "KAMIS EROPA",
		"CAMINO EUROPEO": "JALAN EROPA",
		"RADIO": "RADIO",
		"TOCA PARA CAMBIAR DE TEMA": "KETUK UNTUK GANTI LAGU",
		"AL AZAR": "ACAK",
		"Cada título que ganes suma su himno a la música del vestuario.": "Setiap gelar yang kamu raih menambah himnenya ke musik ruang ganti.",
		"CAMPO AL AMANECER": "FAJAR DI LAPANGAN",
		"LLUVIA SUAVE": "HUJAN RINTIK",
		"HIERBA FRESCA": "RUMPUT SEGAR",
	},


	"resultado": {
		"SIN GOLES": "TANPA GOL",
		"PARADA": "SAVE",
		"PARADAS": "SAVE",
	},


	"promo": {
		"¿TIENES UN CODIGO?": "PUNYA KODE?",
		"CANJEAR CODIGO": "TUKAR KODE",
		"Escribe el código tal cual te lo dieron. Cada código se canjea una sola vez en este teléfono.": "Ketik kode persis seperti yang kamu terima. Tiap kode hanya bisa ditukar sekali di ponsel ini.",
		"TU CODIGO": "KODEMU",
		"CANJEAR": "TUKAR",
		"COMPROBANDO...": "MEMERIKSA...",
		"Escribe un código.": "Ketik kodenya.",
		"No encontramos ese código. Si es nuevo, conéctate a internet y vuelve a probar.": "Kode itu tidak ditemukan. Kalau baru, sambungkan ke internet dan coba lagi.",
		"Ese código ya no está activo.": "Kode itu sudah tidak aktif.",
		"Ese código ya caducó.": "Kode itu sudah kedaluwarsa.",
		"Ya canjeaste ese código en este teléfono.": "Kamu sudah menukar kode itu di ponsel ini.",
		"Ese código ya lo canjeó otra persona.": "Kode itu sudah ditukar orang lain.",
		"Este código va a una carrera: ábrela y canjéalo desde su tienda.": "Kode ini untuk sebuah karier: buka satu karier dan tukar dari tokonya.",
		"Ese código no existe. Revisa que esté bien escrito.": "Kode itu tidak ada. Periksa apakah tulisannya benar.",
		"¡CODIGO CANJEADO!": "KODE DITUKAR!",
		"+ {0} ★ EN TU HERENCIA": "+ {0} ★ KE WARISANMU",
		"ABIERTA EN TU HERENCIA: {0}": "TERBUKA DI WARISANMU: {0}",
	},
	"simulador_conduccion": {
		"Compra el simulador en CASA > COCHERA. Incluye un compacto para jugar.": "Beli simulator di RUMAH > GARASI. Termasuk satu mobil kompak untuk dimainkan.",
		"Compacto incluido sólo para jugar. Tus compras desbloquean más coches.": "Mobil kompak hanya untuk bermain. Pembelianmu membuka lebih banyak mobil.",
		"Incluye un compacto para jugar y permite usar tus coches comprados. No gasta dinero ni acciones semanales.": "Termasuk satu mobil kompak untuk balapan dan bisa memakai mobil yang kamu beli. Tak memakan uang maupun aksi mingguan.",
		"Asiento deportivo, volante y tres pantallas. Incluye un compacto virtual; tus compras desbloquean más coches. Sin mantenimiento.": "Kursi balap, setir, dan tiga layar. Termasuk satu mobil kompak virtual; pembelianmu membuka lebih banyak mobil. Tanpa perawatan.",
		"AUTO · A/D GIRAR · S FRENAR": "AUTO · A/D BELOK · S REM",
		"NUEVO RÉCORD DE TIEMPO": "REKOR WAKTU BARU",
		"Sin récord: faltaron controles.": "Tanpa rekor: ada checkpoint terlewat.",
		"As del volante": "Jagoan Setir",
		"Cruzar los tres controles del simulador y llegar antes del tiempo objetivo.": "Lewati ketiga checkpoint simulator dan finis sebelum waktu target.",
		"Primera Medalla": "Medali Pertama",
		"Sacar el oro en el simulador con el compacto urbano.": "Raih emas di simulator dengan mobil kompak kota.",
		"Piloto de Domingo": "Pembalap Akhir Pekan",
		"Terminar 25 vueltas en el simulador.": "Selesaikan 25 putaran di simulator.",
		"Vuelta Limpia": "Putaran Bersih",
		"Terminar una vuelta del simulador sin salirte nunca del asfalto.": "Selesaikan satu putaran simulator tanpa pernah keluar dari aspal.",
		"Cazamonedas": "Pemburu Koin",
		"Recoger las 72 monedas en una vuelta del simulador.": "Kumpulkan semua 72 koin dalam satu putaran simulator.",
		"Pie a Fondo": "Gas Pol",
		"Dar una vuelta con el hiperdeportivo sin tocar el freno ni salirte del asfalto.": "Lakukan satu putaran dengan hypercar tanpa menyentuh rem dan tanpa keluar dari aspal.",
		"Garaje de Oro": "Garasi Emas",
		"Sacar el oro en el simulador con los ocho coches.": "Raih emas di simulator dengan kedelapan mobil.",
		"MONEDAS {0}/{1} · {2}": "KOIN {0}/{1} · {2}",
		"PUNTOS DE ESTA CARRERA": "POIN BALAPAN INI",
		"CURVA CERRADA: FRENA": "TIKUNGAN TAJAM: REM",
		"CONTROLES {0}/3 · OBJETIVO {1} s · MÁX. {2} km/h": "CHECKPOINT {0}/3 · TARGET {1} s · MAKS. {2} km/h",
		"OBJETIVO CUMPLIDO": "TARGET TERCAPAI",
		"OBJETIVO PENDIENTE": "TARGET GAGAL",
		"El coche acelera solo. Mantén un botón para girar y los dos a la vez para frenar.": "Mobil melaju sendiri. Tahan satu tombol untuk belok dan keduanya sekaligus untuk mengerem.",
		"LOS DOS: FRENO": "KEDUANYA: REM",
		"CAMBIAR COCHE": "GANTI MOBIL",
		"¡META!": "FINIS!",
		"¡BRONCE!": "BRONZE!",
		"¡PLATA!": "PERAK!",
		"¡ORO!": "EMAS!",
		"MONEDAS {0}/{1}": "KOIN {0}/{1}",
		"¡YA!": "GO!",
		"TU RÉCORD: {0} s": "REKORMU: {0} s",
		"SIN RÉCORD TODAVÍA": "BELUM ADA REKOR",
		"CORRES CONTRA TU FANTASMA": "LAWAN BAYANGANMU",
		"SIGUIENTE MEDALLA: {0} s": "MEDALI BERIKUT: {0} s",
		"SIN MEDALLA": "NOL MEDALI",
		"MEDALLA DE BRONCE": "MEDALI PERUNGGU",
		"MEDALLA DE PLATA": "MEDALI PERAK",
		"MEDALLA DE ORO": "MEDALI EMAS",
	},


	"menu": {
		"SIMULADOR DE CARRERAS": "SIMULATOR BALAP",
		"Asiento deportivo, volante y tres pantallas. Conduce sólo los coches que has comprado. Sin mantenimiento.": "Kursi balap, setir, dan tiga layar. Kendarai hanya mobil yang sudah kamu beli. Tanpa biaya perawatan.",
		"Conduce los coches de tu colección. No gasta dinero ni acciones semanales.": "Kendarai mobil koleksimu. Tidak memakai uang atau aksi mingguan.",
		"CONDUCIR": "MENYETIR",
		"SALIR": "KELUAR",


		"ligaSALIR": "KELUAR",
		"FRENAR": "REM",
		"ACELERAR": "GAS",
		"SIN COCHES": "NOL MOBIL",
		"OTRA CARRERA": "BALAP LAGI",
		"Sólo tus coches. Sin gastos ni acciones semanales.": "Hanya mobilmu. Tanpa biaya atau aksi mingguan.",
		"Compra el simulador y un coche en CASA > COCHERA.": "Beli simulatornya dan sebuah mobil di RUMAH > GARASI.",
		"Llega a la meta. Salir del asfalto te frena.": "Capai garis finis. Keluar dari aspal membuatmu melambat.",
		"Mantén ACELERAR y dirige. Flechas o WASD en teclado.": "Tahan GAS dan arahkan. Tombol panah atau WASD di keyboard.",
		"META: {0} s · MEJOR DE ESTA SESIÓN: {1} s": "FINIS: {0} s · TERBAIK SESI INI: {1} s",
		"COCHERA": "GARASI",
		"COCHES": "MOBIL",
		"La ampliación está ocupada. No se moverá tu construcción.": "Perluasan sedang terpakai. Bangunanmu tidak akan dipindahkan.",

		"COPIADO · PÉGALO DONDE QUIERAS": "DISALIN · TEMPEL DI MANA SAJA",

		"NOVEDADES": "YANG BARU",
		"VERSIÓN {0}": "VERSI {0}",

		"POTENCIAL": "POTENSI",
		"CONTACTO": "KONTAK",
		"REDES": "SOSMED",
		"CORREO": "EMAIL",
		"¿Una idea, un fallo o sólo quieres saludar? Escríbeme directo.": "Punya ide, nemu bug, atau cuma mau menyapa? Langsung kirim pesan ke aku.",





		"ESTE ESTADIO NO SABE TU NOMBRE.": "STADION INI BELUM TAHU NAMAMU.",



		"¿CÓMO TE LLAMAS?": "SIAPA NAMAMU?",
		"ESO EMPIEZA HOY.": "MULAI HARI INI.",
		"IDIOMA": "BAHASA",
		"RANURA {0}": "SLOT {0}",


		"HOY, DERBI": "HARI DERBY",
		"HOY, DERBI · {0}": "HARI DERBY · {0}",
		"ACTIVA": "AKTIF",
		"CONTINUAR": "LANJUTKAN",
		"VER LEGADO": "CEK LEGACY",
		"Ranura libre.": "Slot kosong.",
		"+ NUEVA CARRERA": "+ KARIER BARU",
		"{0} AÑOS": "{0} TAHUN",
		"SIN CLUB": "TANPA KLUB",
		"Sin club": "Tanpa klub",
		"MÁS": "LAIN",
		"OTRAS RANURAS": "SLOT LAIN",
		"PRÁCTICA": "LATIHAN",
		"AJUSTES": "SETELAN",
		"LOGROS": "PRESTASI",
		"COLECCIÓN": "KOLEKSI",
		"EDITOR": "EDITOR",

		"CLUB Y PAIS": "KLUB & NEGARA",
		"TODOS": "SEMUA",
		"PENDIENTES": "TERKUNCI",
		"LOGRADOS": "TERBUKA",
		"A PUNTO DE CAER": "HAMPIR DAPAT",



		"{0} % del mundo": "{0} % dunia",
		"Logro secreto. Sigue jugando para descubrirlo.":
			"Prestasi rahasia. Terus main untuk membukanya.",

		"Preparando el estadio…": "Menyiapkan stadion…",
		"Cargando…": "Memuat…",
		"RESTAURAR": "PULIHKAN",
		"RESTAURAR CARRERA": "PULIHKAN KARIER",
		"Copias guardadas en iCloud.": "Salinan tersimpan di iCloud.",
		"No se pudo restaurar la carrera.": "Karier tidak dapat dipulihkan.",
		"Carrera restaurada.": "Karier dipulihkan.",
		"VERSION MAS NUEVA": "VERSI LEBIH BARU",
		"Se jugó después en {0}.": "Dimainkan belakangan di {0}.",
		"Se jugó después en otro aparato.": "Dimainkan belakangan di perangkat lain.",
		"iCLOUD": "iCLOUD",
		"ESTE APARATO": "PERANGKAT INI",
		"PARTIDO LIBRE": "LAGA BEBAS",
		"ELIGE TU EQUIPO": "PILIH TIMMU",
		"ELIGE EL RIVAL": "PILIH LAWAN",
		"ELIGE TU JUGADOR": "PILIH PEMAINMU",
		"Amistoso de exhibición · no cuenta para la carrera": "Laga persahabatan · tidak dihitung untuk karier",
		"PRÁCTICA LIBRE": "LATIHAN BEBAS",
		"RECOMIENDA": "MENYARANKAN",
		"ENCARGO": "TUGAS",
		"DETALLE": "DETAIL",
		"QUIERE VERTE": "INGIN BERTEMU",
	},



	"compra": {
		"{0} PARTIDOS": "{0} LAGA",
		"{0} GOLES": "{0} GOL",
		"{0} ASIST": "{0} AST",
		"La App Store no responde. Revisa tu conexión y vuelve a intentarlo.":
			"App Store tidak merespons. Periksa koneksimu dan coba lagi.",
		"Google Play no responde. Revisa tu conexión y vuelve a intentarlo.":
			"Google Play tidak merespons. Periksa koneksimu dan coba lagi.",
		"Tu pago quedó pendiente: lo recibirás en cuanto se confirme.":
			"Pembayaranmu masih tertunda: kamu akan menerimanya begitu dikonfirmasi.",
		"Listo: ya recuperaste lo que habías comprado con esta cuenta de Google.":
			"Beres: pembelianmu dengan akun Google ini sudah pulih.",
		"Esta cuenta de Google no tiene compras que recuperar en Football Legacy.":
			"Akun Google ini tak punya pembelian untuk dipulihkan di Football Legacy.",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu cuenta de Google.":
			"Ini dibayar dengan UANG ASLI, bukan uang game: ditagih ke akun Google-mu.",
		"GOOGLE PLAY":
			"GOOGLE PLAY",
		"Este aparato no tiene permitidas las compras.":
			"Perangkat ini tidak mengizinkan pembelian.",

		"No se pudo completar la compra.": "Pembelian tak bisa diselesaikan.",
		"Apple rechazó el pago.": "Apple menolak pembayaran.",
		"La compra no está disponible en tu región.":
			"Pembelian ini tidak tersedia di wilayahmu.",
		"No hay conexión con la App Store.": "Tak ada koneksi ke App Store.",
		"No se pudo verificar la compra con Apple. Se reintentará al volver a abrir el juego.":
			"Pembelian tak bisa diverifikasi Apple. Akan dicoba lagi saat kamu membuka game berikutnya.",
	},










	"hub": {

		"SANCIONADO · {0} {1} DE CASTIGO": "DISKORS · {0} {1}",

		"FORMA": "FORM",



		"ovrMEDIA": "OVR",
		"NIVEL": "LEVEL",
		"DINERO": "UANG",
		"TEMPORADA": "MUSIM",
		"{0} · {1} AÑOS": "{0} · {1} THN",
		"AGENTE LIBRE · {0} AÑOS": "BEBAS · {0} THN",
		"ENERGÍA {0}%": "ENERGI {0}%",

		"NO CONVOCADO": "TAK DIPILIH",
		"BANQUILLO": "CADANGAN",
		"YA NO QUEDAN CAMBIOS": "JATAH GANTI HABIS",
		"SE VA {0}": "{0} KELUAR",
		"¡PARADÓN DE {0}!": "SAVE HEBAT {0}!",
		"{0} SE ESTIRA Y LA SACA": "{0} MENEPIS BOLA",
		"LA ATAJA {0}": "{0} MENAHAN",
		"SE SALVA EL PORTERO": "KIPER MENAHAN BOLA",
		"PARADAS EN EL PARTIDO": "SAVE DI LAGA INI",
		"asistA": "A",
		"PLANTILLAS": "SKUAD",
		"RELATO": "KOMENTAR",
		"OVR": "OVR",
		"ROTACIÓN": "ROTASI",
		"TITULAR": "INTI",
		"INDISCUTIBLE": "WAJIB MAIN",

		"AGENTE LIBRE": "PEMAIN BEBAS",
		"ELIGE CLUB": "PILIH KLUB",
		"TE VENDEN": "DIJUAL",
		"RESPONDE YA": "JAWAB KINI",
		"EN VENTA": "DIJUAL",
		"ESPERANDO OFERTAS": "MENANTI TAWARAN",
		"CIERRA HOY": "TUTUP KINI",
		"CIERRA EN {0}J": "TUTUP {0}P",
		"MERCADO CERRADO": "BURSA TUTUP",
		"ABRE EN {0}J": "BUKA {0}P",
		"PRÓXIMA TEMPORADA": "MUSIM DEPAN",

		"MERCADO DE VERANO": "BURSA MUSIM PANAS",
		"MERCADO DE INVIERNO": "BURSA MUSIM DINGIN",
		"VERANO": "PANAS",
		"INVIERNO": "DINGIN",

		"BUZON": "INBOX",
		"{0} NUEVOS": "{0} BARU",
		"AL DIA": "TERBACA",
		"Elige tu próximo club": "Pilih klub berikutnya",
		"¡TE BUSCAN!": "DIINCAR!",
		"PLANTEL": "SKUAD",
		"PERFIL": "PROFIL",
		"CONTRATO": "KONTRAK",
		"MERCADO": "BURSA",
		"TIENDA": "TOKO",
		"ASPECTO": "LOOK",
		"CASUAL": "KASUAL",
		"Tu ropa de calle. La eliges tú.": "Pakaian santaimu. Kamu yang pilih.",
		"Eres el mismo con las dos ropas.": "Kamu tetap kamu dengan kedua pakaian itu.",
		"{0} · el uniforme es el de tu club.":
			"{0} · seragamnya dari klubmu.",



		"RELACIONES": "RELASI",

		"Para el próximo: {0}, ~{1}'.": "Berikutnya: {0}, ~{1}'.",
		"El balón te llega ~{0} veces por partido.":
			"Bola sampai ke kamu ~{0} kali per laga.",
		"El balón te llega ~{0} vez por partido.":
			"Bola sampai ke kamu ~{0} kali per laga.",
		"Vales ${0} en el mercado.": "Nilaimu ${0} di bursa.",



		"famaDESCONOCIDO": "TAK DIKENAL",
		"famaLOCAL": "LOKAL",
		"famaCONOCIDO": "DIKENAL",
		"famaCARA CONOCIDA": "TERKENAL",
		"famaESTRELLA": "BINTANG",
		"{0} de {1} marcas te pueden ofertar.": "{0} dari {1} merek bisa mengajukan tawaran.",
		"Y 1 ya te queda chica.": "Dan 1 sudah terlalu kecil untukmu.",
		"Y {0} ya te quedan chicas.": "Dan {0} sudah terlalu kecil untukmu.",
		"Estrella: esta temporada aguantas {0} partidos flojos sin que te olviden. Por debajo de {1} dejas de serlo.": "Bintang: musim ini kamu boleh main jelek {0} kali sebelum dilupakan. Di bawah {1}, kamu bukan bintang lagi.",
		"Estrella: esta temporada aguantas 1 partido flojo sin que te olviden. Por debajo de {0} dejas de serlo.": "Bintang: musim ini kamu boleh main jelek 1 kali sebelum dilupakan. Di bawah {0}, kamu bukan bintang lagi.",
		"Estrella: esta temporada ya te están olvidando. Por debajo de {0} dejas de serlo.": "Bintang: musim ini kamu sudah mulai dilupakan. Di bawah {0}, kamu bukan bintang lagi.",
		"Sólo te llama una: te falta nombre. Con más prensa te llaman hasta tres.": "Hanya satu yang menelepon: namamu belum cukup besar. Dengan lebih banyak pers, sampai tiga yang menelepon.",
		"PUJA CON {0}: +{1} %": "ADU TAWAR {0}: +{1} %",
		"Te saca +{0} de sueldo en cada oferta. Tócalo para darle un encargo.":
			"Dia menambah +{0} gaji di tiap tawaran. Ketuk untuk memberinya tugas.",
		"TUS RELACIONES": "RELASIMU",
		"TORNEOS": "KOMP.",

		"CALENDARIO": "JADWAL",


		"CLASIF {0}": "KUALIF {0}",
		"La temporada aún no tiene calendario.":
			"Musim ini belum punya jadwal.",

		"RANKING": "RANKING",
		"RANKING DE JUGADORES": "RANKING PEMAIN",
		"Los jugadores de 1ª división del mundo, ordenados por su media."
			+ " Tú entras en la misma lista.":
			"Pemain kasta tertinggi dari seluruh dunia, diurutkan menurut OVR. Kamu juga masuk daftar ini.",
		"Ningún jugador cumple estos filtros. Prueba a soltar alguno.":
			"Tak ada pemain yang cocok dengan filter ini. Coba lepas salah satunya.",
		"Ahora mismo no hay nadie sin club. La bolsa se llena al cerrar cada ventana de mercado.":
			"Saat ini tak ada pemain tanpa klub. Daftar pemain bebas terisi saat tiap bursa transfer tutup.",
		"TU SITIO: {0}° DE {1}": "PERINGKATMU: {0}/{1}",
		"A {0} de media del {1}°": "Tertinggal {0} OVR dari #{1}",
		"IR A MI FILA": "KE BARISKU",
		"MARCADOS": "DITANDAI",
		"TODO": "SEMUA",
		"PAÍS": "NEGARA",
		"PORTEROS": "KIPER",
		"DEFENSAS": "BEK",
		"MEDIOS": "GELANDANG",
		"DELANTEROS": "PENYERANG",
		"FILTRAR POR PUESTO": "FILTER POSISI",
		"FILTRAR POR EDAD": "FILTER USIA",
		"FILTRAR POR VALOR": "FILTER NILAI",
		"DIVISIÓN": "DIVISI",
		"FILTRAR POR LIGA": "FILTER LIGA",
		"FILTRAR POR DIVISIÓN": "FILTER DIVISI",
		"Los jugadores del mundo, por liga y división, ordenados por su media. Tú entras en la misma lista.": "Pemain dunia, menurut liga dan divisi, diurutkan menurut OVR. Kamu masuk daftar yang sama.",
		"{0} PUESTOS": "{0} POSISI",
		"FILTRAR POR PAÍS": "FILTER NEGARA",
		"FILTRAR POR BANQUILLO": "FILTER KLUB",
		"FILTRAR POR ESTRELLAS": "FILTER BINTANG",
		"FILTRAR POR IDEA": "FILTER GAYA",
		"IDEA": "GAYA",
		"Ningún técnico cumple estos filtros.": "Tak ada pelatih yang cocok dengan filter ini.",
		"{0}-{1} DE {2}": "{0}-{1}/{2}",
		"ANTERIOR": "SEBELUM",
		"PALMARÉS": "PALMARES",
		"LEYENDAS": "LEGENDA",
		"SELECCIÓN": "TIMNAS",
		"VITRINA": "LEMARI",



		"HISTORIA": "SEJARAH",
		"LEGADO": "LEGACY",



		"ABIERTO · {0}J": "BUKA · {0}P",
		"EN VENTA · {0} OFERTAS": "DIJUAL · {0} TAWARAN",

		"CLUBES Y LEYENDAS": "KLUB & LEGENDA",
		"JUGADOR DEL ANO · {0}": "PEMAIN TERBAIK · {0}",
		"{0} PUNTOS": "{0} POIN",
		"TOPE {0}": "BATAS {0}",
		"NIVEL {0}": "LEVEL {0}",
		"SIN CONTRATO": "NOL KONTRAK",
		"ÚLTIMO AÑO": "THN AKHIR",
		"{0} TEMPORADAS": "{0} MUSIM",

		"1 TEMPORADA": "1 MUSIM",
		"{0}% SOBRE TU SUELDO": "{0}% DI ATAS GAJIMU",

		"PEDIR UN POCO": "MINTA SEDIKIT",
		"PEDIR MUCHO": "MINTA BESAR",
		"+{0} si acepta": "+{0} jika setuju",
		"ROMPER EL HIELO": "CAIRKAN SUASANA",
		"YA ROMPISTE EL HIELO": "SUASANA SUDAH CAIR",
		"Hablan de otra cosa un rato · SE RELAJA":
			"Kalian ngobrol hal lain sebentar · DIA MELUNAK",
		"EL DURO": "SI KERAS",
		"EL AMABLE": "SI RAMAH",
		"EL SUSCEPTIBLE": "SI BAPERAN",
		"EL PACIENTE": "SI SABAR",

		"SU HUMOR": "MOODNYA",
		"DE BUENAS": "MOOD BAIK",
		"SE LO PIENSA": "MENIMBANG",
		"IMPACIENTE": "TAK SABAR",
		"HARTO": "MUAK",
		"TE CEDEN": "PINJAMAN",
		"{0} OFERTAS": "{0} TAWARAN",
		"{0} DESTINO": "{0} TUJUAN",
		"{0} DESTINOS": "{0} TUJUAN",
		"CERRADO": "TUTUP",
		"SIN OFERTAS · {0}J": "NOL TAWARAN · {0}P",
		"{0} OFERTAS · {1}J": "{0} TAWARAN · {1}P",


		"CIERRA HOY · {0} OFERTAS": "TUTUP HARI INI · {0} TAWARAN",
		"{0} OFERTAS SOBRE LA MESA": "{0} TAWARAN DI MEJA",

		"MEJORA": "NAIK",
		"TU CLUB TE LA OFRECE": "KLUBMU MENAWARKANNYA",
		"TU CLUB TE MEJORA": "KLUB NAIKKAN GAJI",
		"Se adelanta a los que vienen a por ti.": "Mereka bergerak sebelum yang lain datang mengincarmu.",
		"EL MEJOR QUE TRAJISTE": "TERBAIK BAWAANMU",
		"{0} partidos · nota {1}": "{0} laga · rating {1}",
		"EL TECNICO PIDE": "PELATIH MINTA",
		"Si fichan a uno de esa línea: +{0} % de que salga y el técnico te lo apunta.": "Jika mereka merekrut satu dari lini itu: peluang jadi +{0} % dan pelatih mencatatnya.",
		"Ya le trajiste uno: te lo apunta.": "Kamu sudah membawa satu: dicatat.",
		"Lo pide el técnico: sale más fácil": "Diminta pelatih: lebih mudah direkrut",
		"SUBIR": "NAIK",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede. SUBIR cambia el orden.": "Mereka maju sesuai urutan ini: jika satu teken, sisanya menawar dengan sisa anggaran. NAIK mengubah urutan.",
		"PAGAR LO QUE PIDEN": "BAYAR HARGANYA",
		"REGATEAR -{0} %": "TAWAR -{0} %",
		"MANDAR OJEADOR ({0})": "KIRIM SCOUT ({0})",
		"Ojeado: el club ya se fía de él.": "Sudah dipantau: klub kini percaya padanya.",
		"QUITAR DE LA VENTA": "BATAL DIJUAL",
		"PONER EN VENTA": "JUAL",
		"En venta: en la próxima ventana se ofrece a un club de su nivel, un {0} % por debajo de su valor.": "Dijual: di bursa berikutnya dia ditawarkan ke klub selevel, {0} % lebih murah dari nilainya.",
		"Ya tienes {0} en venta.": "Kamu sudah punya {0} di daftar jual.",
		"Se ofrecen al abrir la ventana a clubes de su nivel, un {0} % por debajo de su valor. Se quitan desde su ficha.": "Ditawarkan saat bursa dibuka ke klub selevel mereka, {0} % lebih murah dari nilai. Batalkan dari profilnya.",
		"No vendría a tu club: no casa con su categoría.": "Dia tak mau ke klubmu: levelnya tidak cocok.",
		"RETIRAR LA PETICION": "TARIK PERMINTAAN",
		"SI DICE QUE NO, TU TÉCNICO LO SABE": "JIKA KLUB MENOLAK, PELATIHMU TAHU",
		"PETICIONES": "PERMINTAAN",
		"TODAVÍA NADA": "BELUM ADA",
		"TU TÉCNICO CUMPLE": "PELATIHMU MEMENUHI",
		"DE TUS {0} MEJORES": "DARI {0} TERBAIKMU",
		"SUPLENTE Y CLUB EN APURO": "CADANGAN & KLUB TERDESAK",
		"VETERANO SUPLENTE": "CADANGAN VETERAN",
		"DEJAS LA CAJA VACIA": "KAS KLUB KOSONG",
		"NADIE PARA TU PUESTO": "POSISIMU KOSONG",
		"VAS EN RACHA": "SEDANG ON FIRE",
		"Si te lo cede: -{0} con el vestuario.": "Jika dia mengalah: -{0} dengan ruang ganti.",
		"Se lo pediste al club: {0} % de que lo traiga en la próxima ventana de técnicos.": "Kamu sudah memintanya ke klub: peluang {0} % dia didatangkan di bursa pelatih berikutnya.",
		"El club lo decide en la próxima ventana de técnicos (invierno o final de temporada). Si dice que no, tu técnico se entera.": "Klub memutuskan di bursa pelatih berikutnya (musim dingin atau akhir musim). Jika menolak, pelatihmu tahu.",
		"El club te hizo caso: llegó {0}.": "Klub menurutimu: {0} datang.",
		"El club dijo que no a {0}, y tu técnico se enteró.": "Klub menolak {0}, dan pelatihmu tahu.",
		"El club cambió de técnico, pero no trajo a {0}.": "Klub ganti pelatih, tapi tidak membawa {0}.",
		"{0} ya no estaba a tu alcance.": "{0} sudah tak terjangkau.",
		"¿Otro técnico? Pídelo desde su ficha, en {0}, pestaña {1}.": "Pelatih lain? Minta dari profilnya, di {0}, tab {1}.",
		"PEDISTE A": "DIMINTA",
		"QUE LO TRAIGAN": "PELUANG",
		"QUE LO ECHEN": "PELUANG",
		"ENCAJA": "COCOK",
		"NO ENCAJA": "TIDAK COCOK",
		"CUMPLE SUS METAS": "TARGET TERPENUHI",
		"PEDIR QUE LO ECHEN": "MINTA DIPECAT",
		"ELEGIR QUIÉN VIENE · NIVEL {0}": "PILIH PENGGANTI · LEVEL {0}",
		"{0} · FUERA": "{0} · KELUAR",
		"{0} SIN VICTORIA": "{0} TANPA MENANG",
		"El club te hace caso: destituye al técnico": "Klub menurutimu: pelatih dipecat",
		"Se decide en la próxima ventana de técnicos: la de invierno o el final de la temporada. Si dice que no, tu técnico se entera.": "Diputuskan di bursa pelatih berikutnya: musim dingin atau akhir musim. Jika menolak, pelatihmu tahu.",
		"El club te hace caso: llega {0} al banquillo": "Klub menurutimu: {0} duduk di bangku pelatih",
		"NO LO VENDAIS": "JANGAN JUAL",
		"QUITAR PROTECCION": "LEPAS PROTEKSI",
		"Protegido: el club no lo vende ni lo cede y pide el doble por él. Si lo pagan, se va igual; cada ventana en que rechace ofertas te quita {0} de relación.": "Dilindungi: klub tak menjual atau meminjamkannya dan minta harga dua kali lipat. Jika ada yang membayar, dia tetap pergi; tiap bursa klub menolak tawaran, hubunganmu berkurang {0}.",
		"QUE LO RENUEVEN": "PERPANJANG DIA",
		"Se decide en la próxima ventana de contratos.": "Diputuskan di bursa kontrak berikutnya.",
		"Pedido: {0} % de que renueve en la próxima ventana de contratos.": "Diminta: peluang {0} % dia perpanjang di bursa kontrak berikutnya.",
		"Si lo pides: {0} % de que renueve.": "Jika kamu minta: peluang {0} % dia perpanjang.",
		"Ya pides {0} renovaciones.": "Kamu sudah meminta {0} perpanjangan.",
		"INTOCABLE": "PROTEKSI",
		"PROTEGES A": "DILINDUNGI",
		"Pagaron el doble ({2}) y {0} se fue a {1}.": "Mereka membayar dua kali lipat ({2}) dan {0} pergi ke {1}.",
		"El club rechazó {0} de {1} por {2}.": "Klub menolak {0} dari {1} seharga {2}.",
		"Te cuesta {0} de relación hasta final de temporada.": "Hubunganmu berkurang {0} sampai akhir musim.",
		"RENOVACIONES": "PERPANJANGAN",
		"{0} renovo.": "{0} perpanjang kontrak.",
		"El club no quiso renovar a {0}.": "Klub tak mau memperpanjang {0}.",
		"{0} no quiso renovar.": "{0} tak mau perpanjang kontrak.",
		"{0} ya había firmado con otro club.": "{0} sudah teken dengan klub lain.",
		"PIDE UN PUESTO": "MINTA POSISI",
		"El club busca un {0}: va a por {1}.": "Klub mencari {0}: mengincar {1}.",
		"Tú pides el puesto y el club elige a quién: sale más a menudo y, si se cae, prueba con otro. Gasta una recomendación.": "Kamu minta posisinya dan klub memilih orangnya: lebih sering berhasil dan, jika gagal, mereka coba yang lain. Memakai satu rekomendasi.",
		"No te quedan recomendaciones esta temporada.": "Rekomendasimu habis musim ini.",
		"Ya hay un puesto pedido.": "Sudah ada posisi yang diminta.",
		"El club no encuentra a nadie mejor para ese puesto.": "Klub tak menemukan siapa pun yang lebih baik untuk posisi itu.",
		"VENTANAS ANTERIORES": "BURSA SEBELUMNYA",
		"Gastado {0} · ventas {1}": "Belanja {0} · penjualan {1}",
		"RENOVACIÓN SOBRE LA MESA": "PERPANJANGAN DI MEJA",
		"SALDRÁS LIBRE AL CIERRE": "KAMU PERGI GRATIS DI AKHIR",
		"ABIERTO · {0} FICHAJES": "BUKA · {0} REKRUTAN",
		"OBJETIVO": "TARGET",
		"VAS CORTO": "KURANG",
		"{0} DE {1} · VAS CORTO": "{0} DARI {1} · KURANG",
		"RÉCORD A LA VISTA": "REKOR MENDEKAT",
		"A {0} {1} DEL LIBRO": "{0} {1} KE REKOR",
		"GOL": "GOL",


		"ESTA TEMPORADA POR TORNEO": "MUSIM INI PER TURNAMEN",
		"TORNEO": "KOMP.",
		"CHAMPIONS": "ELITE",
		"EUROPA": "EUROPA",
		"CONFERENCE": "CHALLENGE",
		"MUNDIALITO": "DUNIA KLUB",
		"{0} OFERTAS · {1} EXPIRA HOY": "{0} TAWARAN · {1} HABIS HARI INI",
		"{0} OFERTAS · {1} EXPIRAN HOY": "{0} TAWARAN · {1} HABIS HARI INI",
		"NEGOCIACIÓN": "NEGOSIASI",
		"{0} CLUBES RESPONDIERON": "{0} KLUB MENJAWAB",


		"{0} TE BUSCAN · YA": "DIINCAR {0} · KINI",
		"{0} MARCAS": "{0} MEREK",
		"SIN JUGAR": "TAK MAIN",
		"{0} EN LIGA": "{0} DI LIGA",
		"CONVOCADO": "DIPANGGIL",


		"seleccionFUERA": "ABSEN",
		"{0} TROFEOS": "{0} TROFI",
		"{0} GOLES": "{0} GOL",

		"TIENES {0} {1} SIN REPARTIR": "{0} {1} BELUM DIPAKAI",
		"SEMANA · {0} DE {1} ACCIONES": "MINGGU · {0} DARI {1} AKSI",




		"previaGANAS": "MENANG",
		"previaEMPATE": "SERI",
		"previaPIERDES": "KALAH",
		"iniV": "M",
		"iniE": "S",
		"iniD": "K",




		"SUBIR HABILIDADES · {0}": "NAIKKAN SKILL · {0}",
		"SIN PUNTOS": "NOL POIN",
		"PERSONALIZAR": "KUSTOM",
		"MENÚ": "MENU",

		"ELEGIR CLUB": "PILIH KLUB",
		"LESIONADO · VER LA JORNADA": "CEDERA · LIHAT PEKAN INI",
		"LESIONADO · {0} {1} DE BAJA": "CEDERA · ABSEN {0} {1}",
		"YA USADA": "TERPAKAI",
		"{0} {1} DE BAJA": "ABSEN {0} {1}",

		"ALTA MÉDICA": "PULIH",
		"VUELVES AL EQUIPO": "KEMBALI KE TIM",
		"PARTIDOS PERDIDOS": "LAGA TERLEWAT",
		"El cuerpo aguantó. El puesto no se guardó solo: ahora hay que "
		+ "ganárselo otra vez.":
			"Tubuhmu kuat. Tempatmu tidak menunggu sendiri: sekarang harus direbut lagi.",
		"LA TEMPORADA, EN EL AIRE": "MUSIM DIPERTARUHKAN",
		"MESES FUERA": "ABSEN LAMA",
		"BAJA LARGA": "ABSEN PANJANG",
		"TE PIERDES LO QUE VIENE": "ABSEN DI LAGA BERIKUT",
		"SEMANAS DE BAJA": "MINGGU ABSEN",
		"{0} SEMANAS DE BAJA": "ABSEN {0} MINGGU",
		"Vuelves cuando el cuerpo diga. Mientras tanto el equipo juega sin ti "
		+ "y el puesto no se guarda solo.":
			"Kamu kembali saat tubuhmu siap. Sementara itu tim main tanpamu dan tempatmu tidak menunggu sendiri.",
		"Esta baja ya te costó {0} {1}": "Cedera ini sudah merugikanmu {0} {1}",
		"SIMULAR {0}": "SIMULASI {0}",
		"JUGAR CON TU SELECCIÓN": "BELA TIMNASMU",
		"FECHA DE SELECCIONES": "JEDA INTERNASIONAL",
		"FECHA DE SELECCIONES · SALES DE TITULAR": "JEDA INTERNASIONAL · KAMU INTI",
		"FECHA DE SELECCIONES · ENTRAS DESDE LA BANCA": "JEDA INTERNASIONAL · DARI BANGKU",
		"VER EL PARTIDO": "TONTON LAGA",
		"JUGAR PARTIDO": "MAIN LAGA",
		"MANTENER PARA PASAR A FIN DE TEMPORADA": "TAHAN UNTUK AKHIRI MUSIM",
		"LA TEMPORADA HA TERMINADO": "MUSIM SUDAH SELESAI",

		"TE LO PERDISTE LESIONADO": "KAMU ABSEN KARENA CEDERA",
		"TE VE FLOJO DE": "KAMU LEMAH DI",
		"NO CONVOCADO · TE VE FLOJO DE {0}": "TAK DIPANGGIL · LEMAH DI {0}",
		"EL MÍSTER TE PIDE ALGO": "PELATIH MINTA SESUATU",
		"NO TE CONVOCARON": "TAK DIPANGGIL",
		"Algo es algo.": "Ada lebih baik daripada tidak.",
		"Aprovecha para entrenar e impresionar al míster.": "Manfaatkan untuk latihan dan membuat pelatih terkesan.",
		"Porterías chiquitas": "Gawang mini",
		"Métela en la portería pequeña, no en la grande. Cada balón sale de más lejos.": "Masukkan ke gawang kecil, bukan yang besar. Tiap bola datang dari lebih jauh.",
		"Jala y suelta a la portería pequeña": "Tarik dan lepas ke gawang kecil",
		"Rompe las dianas": "Pecahkan target",
		"Eslalon con rival": "Slalom dengan penjaga",
		"OTRO BALÓN": "BOLA LAIN",
		"Pisa los conos con el balón. El chico paga el triple, pero está del lado del que te marca.": "Injak kerucut dengan bola. Yang kecil bayarnya tiga kali lipat, tapi ada di sisi penjagamu.",
		"Arrastra para conducir; no se tira": "Seret untuk menggiring; tak bisa menendang",
		"Rompe las dianas del arco. La chiquita de arriba paga el triple que la gorda de abajo.": "Pecahkan target di gawang. Yang kecil di atas bayarnya tiga kali lipat dari yang besar di bawah.",
		"Jala y suelta a una diana": "Tarik dan lepas ke satu target",
		"TU RÉCORD": "REKORMU",
		"NUEVO RÉCORD": "REKOR BARU",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario distinto. Aquí no se juega nada de la carrera — el que cuenta es EL ENCARGO DEL MÍSTER, y ése sale la jornada que no te convocan. Se sale con PAUSA.": "Pilih satu latihan dan ulangi sebanyak maumu: tiap percobaan menyusun skenario yang berbeda. Di sini tak ada yang memengaruhi kariermu. Yang berpengaruh adalah TUGAS PELATIH, dan itu muncul di pekan kamu tak dipanggil. Keluar dengan JEDA.",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada de esto cuenta para la carrera — el que cuenta es EL ENCARGO DEL MÍSTER. Se sale con PAUSA.": "Pilih satu situasi dan ulangi sebanyak maumu: tiap percobaan menyusun skenario yang berbeda di jenis itu. Semua ini tak dihitung untuk kariermu. Yang dihitung adalah TUGAS PELATIH. Keluar dengan JEDA.",
		"Ya te vio cumplir. Ahora te pide más.": "Dia sudah melihatmu berhasil. Sekarang dia minta lebih.",
		"EL MÍSTER TE MIRA EN": "PELATIH MENILAIMU DI",
		"LA PRÓXIMA": "BERIKUTNYA",
		"TE VE FLOJO DE {0}": "KAMU LEMAH DI {0}",
		"LA META": "TARGET",
		"COMPLETA EL CIRCUITO": "SELESAIKAN SIRKUIT",
		"EL PRECIO": "HARGANYA",
		"-{0} ENERGÍA": "-{0} ENERGI",
		"CUMPLIR EL ENCARGO": "PENUHI TUGAS",
		"SOLO SIMULAR": "SIMULASI SAJA",
		"EL ENCARGO": "TUGAS",
		"NO LLEGASTE": "BELUM CUKUP",
		"Así sí. El sábado te veo en la lista.": "Nah, begitu. Sabtu kulihat kamu di daftar.",
		"Otra semana igual y no.": "Satu minggu lagi begini dan kamu tersingkir.",
		"EL PRÓXIMO": "BERIKUTNYA",
		"SIGUES FUERA": "MASIH ABSEN",
		"TE DAN DESCANSO": "DIISTIRAHATKAN",
		"Te llegan balones y no los defines": "Bola datang padamu tapi tak kamu jadikan gol",
		"Le pegas flojo": "Tendanganmu lemah",
		"No sabes curvarla": "Kamu belum bisa melengkungkannya",
		"No me das confianza desde los once": "Aku tak percaya padamu di titik penalti",
		"Los balones parados los tira otro": "Bola mati ditendang orang lain",
		"El primero que te sale te come": "Pemain pertama yang menghadangmu melahapmu",
		"NO FUISTE CONVOCADO": "KAMU TAK DIPANGGIL",
		"{0} ganó sin ti": "{0} menang tanpamu",
		"Tu selección": "Timnasmu",
		"Tu equipo": "Timmu",
		"Empató sin ti": "Seri tanpamu",
		"Perdió sin ti": "Kalah tanpamu",
		"Recuperado: vuelves el próximo partido": "Sudah pulih: kamu kembali di laga berikutnya",
		"Te quedan {0} {1} de baja": "Sisa absenmu {0} {1}",
		"Sin goles": "Tanpa gol",
		"TU EQUIPO": "TIMMU",
		"Gol": "Gol",


		"A puerta": "Tepat sasaran",
		"Fuera del marco": "Melebar",
		"Tapado": "Diblok",

		"SIN TIEMPO ESTA SEMANA": "WAKTU HABIS MINGGU INI",
		"NO TE ALCANZA": "UANG KURANG",
		"LO PIENSO": "PIKIR DULU",
		"ANTES DEL MERCADO": "SEBELUM BURSA",
		"DESPUÉS DEL PARTIDO": "SETELAH LAGA",
		"CÓMO QUEDAN LAS COSAS": "KONDISI SEKARANG",
		"TU DECISIÓN": "KEPUTUSANMU",
		"otro club": "klub lain",
		"Un intermediario te susurra que al {0} le gustas. Si dices que te interesaría, "
		+ "puede que oferten por ti en el mercado… pero en tu club no te lo perdonarán.":
			"Seorang perantara berbisik bahwa {0} menyukaimu. Jika kamu bilang tertarik, mereka mungkin menawarmu di bursa... tapi klubmu tak akan memaafkannya.",

		"Técnico": "Pelatih",
		"Vestuario": "Ruang ganti",

		"SOCIEDAD": "KEMITRAAN",


		"YA JUGASTEIS JUNTOS EN {0}": "PERNAH SATU TIM DI {0}",
		"TAMBIÉN PASÓ POR {0}": "JUGA PERNAH DI {0}",
		"VIENE DE {0}, TU RIVAL": "DARI {0}, RIVALMU",


		"SOCIO": "MITRA",

		"SÓLO CABE UNO": "HANYA SATU",
		"SABES DÓNDE ESTUVO": "KAMU TAHU DIA KE MANA",
		"{0} salió la víspera y lo sabes tú solo. El míster acaba de preguntar en voz alta por qué se movió como si llevara piedras en los pies.": "{0} keluar malam sebelumnya dan hanya kamu yang tahu. Pelatih baru saja bertanya keras-keras kenapa dia bergerak seperti kakinya diganduli batu.",
		"TAPARLO": "TUTUPI DIA",
		"EL GOL ES TUYO": "GOL INI MILIKMU",
		"Acabas de marcar y la grada corea tu nombre. {0} lleva un mes sin jugar y te mira desde el banquillo, aplaudiendo con las manos flojas.": "Kamu baru mencetak gol dan tribun menyanyikan namamu. {0} sudah sebulan tak main dan menatapmu dari bangku cadangan, bertepuk tangan dengan lesu.",
		"DEDICÁRSELO": "PERSEMBAHKAN",
		"CORRER A LA GRADA": "LARI KE TRIBUN",
		"TE PIDE DINERO": "DIA MINTA UANG",
		"{0} te llama de noche y tarda un rato en llegar al punto: en su casa hay un lío y necesita una mano. No dice cuándo te lo devuelve.": "{0} meneleponmu malam-malam dan butuh waktu lama sampai ke intinya: di rumahnya ada masalah dan dia butuh bantuan. Dia tak bilang kapan akan mengembalikannya.",
		"PRESTÁRSELO": "PINJAMKAN",
		"SU ÚLTIMO DÍA": "HARI TERAKHIR",
		"El traspaso de {0} está firmado y mañana ya no entrena aquí. El vestuario hará lo de siempre: un aplauso, una foto y a lo suyo.": "Transfer {0} sudah diteken dan besok dia tak latihan di sini lagi. Ruang ganti akan melakukan yang biasa: tepuk tangan, satu foto, lalu kembali bekerja.",
		"ORGANIZARLE UNA DESPEDIDA": "BUAT PESTA PERPISAHAN",
		"UN ABRAZO Y YA": "PELUK SAJA",
		"Un programa os invita a {0} y a ti, pero la productora sólo tiene caché para uno y te lo ha ofrecido a ti primero. Él todavía no lo sabe.": "Sebuah acara TV mengundang {0} dan kamu, tapi produsernya hanya sanggup membayar satu honor dan menawarkannya padamu dulu. Dia belum tahu.",
		"QUE VAYA ÉL": "DIA SAJA",
		"IR YO": "AKU SAJA",

		"LO DEJÓ FUERA": "DIA DICORET",
		"{0} no entró en la lista y lleva media hora sin hablar con nadie. Tú sí juegas, y el míster te escucha más que a él.": "{0} tak masuk daftar dan sudah setengah jam tak bicara dengan siapa pun. Kamu main, dan pelatih lebih mendengarkanmu daripada dia.",
		"HABLAR POR ÉL": "BELA DIA",
		"NO ES MI PELEA": "BUKAN URUSANKU",
		"OS GRITASTEIS": "SALING TERIAK",
		"Le pediste el balón a gritos, él te contestó peor, y el banquillo entero lo vio. En el vestuario nadie ha dicho una palabra desde entonces.": "Kamu berteriak minta bola, dia membalas lebih kasar, dan seluruh bangku cadangan melihatnya. Sejak itu tak ada yang bicara sepatah kata pun di ruang ganti.",
		"PEDIR PERDÓN YO": "MINTA MAAF DULU",
		"QUE SE LE PASE": "BIAR REDA",
		"LA REHABILITACIÓN ES SOLA": "REHAB ITU SEPI",
		"{0} se rompió y hace la recuperación por su cuenta, en un gimnasio vacío mientras los demás entrenan. Nadie va a saber si apareces o no.": "{0} cedera dan menjalani pemulihan sendirian, di gym kosong sementara yang lain latihan. Tak ada yang akan tahu kamu datang atau tidak.",
		"ACOMPAÑARLO": "TEMANI DIA",
		"YA VOLVERÁ": "NANTI BALIK",
		"TE QUIERE DE PADRINO": "JADI PENDAMPING",
		"{0} se casa en pretemporada y te pide que estés a su lado. Es un fin de semana entero, y tú tenías otros planes con tu descanso.": "{0} menikah saat pramusim dan memintamu mendampinginya. Itu satu akhir pekan penuh, dan kamu punya rencana lain untuk istirahatmu.",

		"ÉL QUIERE EL PENALTI": "DIA MAU PENALTI",
		"{0} lleva tres partidos sin marcar y te pide el próximo penalti. Los dos sabéis que el goleo del año se decide en detalles como éste.": "{0} sudah tiga laga tak mencetak gol dan meminta penalti berikutnya darimu. Kalian berdua tahu perebutan top skor musim ini ditentukan oleh detail seperti ini.",
		"SE LO DEJO": "KUBERIKAN",
		"LOS TIRO YO": "AKU TENDANG",
		"TE PREGUNTAN POR ÉL": "DITANYA SOAL DIA",
		"Un periodista quiere que valores el mal momento de {0}. La pregunta viene con la respuesta puesta y toda la sala esperando.": "Seorang wartawan ingin kamu menilai masa sulit {0}. Pertanyaannya sudah membawa jawabannya sendiri dan seluruh ruangan menunggu.",
		"LO DEFIENDO": "KUBELA",
		"NO ME MOJO": "NETRAL",
		"CENA EN SU CASA": "MAKAN DI RUMAHNYA",
		"{0} te invita a cenar con su familia la víspera del partido. Es media noche que no duermes, y de las que se recuerdan.": "{0} mengundangmu makan malam bersama keluarganya sehari sebelum laga. Setengah malam tanpa tidur, tapi yang akan kamu kenang.",
		"VOY": "IKUT",
		"LA SOCIEDAD": "KEMITRAAN",
		"en este partido": "di laga ini",
		"y {0} más": "dan {0} lagi",
		"Afición": "Suporter",
		"Prensa": "Pers",
		"Agente": "Agen",
		"Pareja": "Pasangan",
		"{0} energía": "{0} energi",
		"o": "atau",
		"· 1 acción": "· 1 aksi",
		"· posible oferta": "· kemungkinan tawaran",

		"VS": "VS",
		"GANASTE": "MENANG",
		"EMPATASTE": "SERI",
		"PERDISTE": "KALAH",
		"GOL DE {0}": "GOL {0}",
		"{0} DE {1}": "{0} OLEH {1}",
		"EN CASA": "KANDANG",
		"XP {0} / {1} · AL NIVEL {2}": "XP {0} / {1} · KE LEVEL {2}",
		"{0} {1} SIN ASIGNAR · REPARTELOS": "{0} {1} BELUM DIPAKAI · PAKAI",
		"LA CARRERA": "PERSAINGAN",
		"EL CUADRO": "BAGAN",
		"LA TABLA": "KLASEMEN",


		"GOLEADORES": "TOP SKOR",
		"GRUPO {0} · PASAN {1}": "GRUP {0} · LOLOS {1}",


		"FASE DE LIGA · {0}/{1} · {2}": "FASE LIGA · {0}/{1} · {2}",
		"A OCTAVOS": "16 BESAR",
		"AL PLAYOFF": "KE PLAYOFF",





		"faseligaFUERA": "GUGUR",
		"EN LISTA DE VENTA": "DIJUAL",
		"EN LISTA DE CESIÓN": "DIPINJAMKAN",
		"CESIÓN · {0} DESTINOS": "PINJAMAN · {0} TUJUAN",
		"VER LA JORNADA": "LIHAT PEKAN",
		"SIMULAR PARTIDO": "SIMULASI LAGA",
		"NO CONVOCADO · LO VES DESDE LA GRADA": "TAK DIPANGGIL · TONTON DARI TRIBUN",
		"SALES DE TITULAR · ~{0} MIN": "KAMU INTI · ~{0} MNT",


		"DERBI · TITULAR · ~{0} MIN": "DERBY · INTI · ~{0} MNT",
		"DERBI · DESDE LA BANCA · ~{0} MIN": "DERBY · DARI BANGKU · ~{0} MNT",
		"ENTRAS DESDE LA BANCA · ~{0} MIN": "DARI BANGKU · ~{0} MNT",
		"SIN GASOLINA · EMPIEZAS EN LA BANCA · ~{0} MIN": "TENAGA HABIS · DARI BANGKU · ~{0} MNT",
		"EL MÍSTER NO TE QUIERE · DESDE LA BANCA · ~{0} MIN": "PELATIH DINGIN · DARI BANGKU · ~{0} MNT",
		"TE CUIDAN AL VOLVER · DESDE LA BANCA · ~{0} MIN": "DIJAGA SAAT KEMBALI · DARI BANGKU · ~{0} MNT",
		"EL TÉCNICO TE DA UNA OPORTUNIDAD": "PELATIH BERI KAMU KESEMPATAN",
		"EL TÉCNICO TE ESTÁ BUSCANDO HUECO": "PELATIH CARI TEMPAT UNTUKMU",
		"EL TÉCNICO TE DA DESCANSO": "PELATIH MENGISTIRAHATKANMU",
		"SIN GASOLINA": "TENAGA HABIS",
		"TE CUIDAN AL VOLVER": "DIJAGA SAAT KEMBALI",
		"DESDE LA BANCA · ~{0} MIN": "DARI BANGKU · ~{0} MNT",
		"MEDIA Y FAMA: {0} · EL MÉRITO LO PONES TÚ": "OVR & KETENARAN: {0} · SISANYA KAMU",
		"Te faltan {0}: sube de nivel, marca más o gánate al seleccionador en la concentración.":
			"Kurang {0}: naik level, cetak lebih banyak gol, atau yakinkan pelatih timnas di TC.",
		"AL CAMPO": "MAIN",
		"SIMULAR LA FECHA": "SIMULASI LAGA",
		"NO ENTRASTE EN LA LISTA": "KAMU TAK MASUK DAFTAR",
		"PUESTO {0} DE {1} EN {2}": "#{0} DARI {1} DI {2}",
		"Debes mejorar para ser convocado: sube ~{0} de media o fama.":
			"Tingkatkan dirimu agar dipanggil: tambah ~{0} OVR atau ketenaran.",
		"Debes mejorar para ser convocado: más nivel y más nombre.":
			"Tingkatkan dirimu agar dipanggil: level lebih tinggi dan nama lebih besar.",
		"PRÓXIMO MUNDIAL · EN {0} {1}": "KEJUARAAN DUNIA {0} {1} LAGI",
		"{0} AÑOS · NIVEL {1}": "{0} THN · LEVEL {1}",
		"AÑO {0} · SEM {1}": "THN {0} · MGG {1}",
		"LESIÓN": "CEDERA",
		"EL CUERPO DECIDE": "TUBUH MENENTUKAN",
		"EN JUEGO": "TARUHAN",
		"TE GUARDA PARA {0}": "DISIMPAN UNTUK {0}",
		"TE DIO DESCANSO": "DIISTIRAHATKAN",
		"Para el próximo: {0}.": "Berikutnya: {0}.",
		"FECHAS": "JADWAL",
		"riel_pieSIGUIENTE": "BERIKUT",
		"riel_pieS{0}": "M{0}",
		"rielGENTE": "RELASI",
		"rielDESTREZA": "SKILL",
		"rielGERENCIA": "PENGURUS",
		"rielFICHAJES": "TRANSFER",
		"rielASPECTO": "LOOK",
		"rielCONTRATO": "KONTRAK",
		"rielTORNEOS": "KOMP.",
		"rielRANKING": "RANKING",
		"rielNOTICIAS": "BERITA",
		"rielJUGADOR": "PEMAINKU",
		"rielEQUIPO": "TIMKU",
		"· das tu palabra": "· kamu berjanji",
		"Diste tu palabra: si te vas esta ventana o la siguiente, tu grada te lo cobrará.": "Kamu sudah berjanji: kalau pergi di bursa transfer ini atau berikutnya, suporter akan menagihnya darimu.",
		"· empezáis a salir": "· kalian mulai pacaran",
		"J{0}/{1}": "P{0}/{1}",
		"CÓMO SE VOTA": "CARA VOTING",
		"NO CUENTAS": "TIDAK IKUT",
		"AL 1º": "KE 1",
		"SOBRE EL 2º": "ATAS KE-2",
		"AL {0} · {1}": "KE {0} · {1}",
		"HASTA {0}": "MAKS {0}",
		"1 OFERTA": "1 TAWAR",
		"SIN OFERTAS AÚN": "BELUM ADA",
		"QUITAR DE VENTA": "TARIK",
		"SU VALOR": "NILAI",
		"ESPERAR": "TUNGGU",
		"{0} MÁS EN CAMINO": "{0} LAGI DATANG",
		"{0} DE SU VALOR": "{0} DARI NILAI",
		"ACEPTADA": "DITERIMA",
		"¡Sube su oferta!": "Tawarannya naik!",
		"Se planta: no pone más.": "Bertahan: tidak mau menambah.",
		"Se ofende y retira su oferta.": "Tersinggung dan menarik tawarannya.",
		"Esa oferta ya no está.": "Tawaran itu sudah tidak ada.",
		"Ya le pediste más: no pondrá más.": "Kamu sudah minta lebih: tidak akan menambah lagi.",
		"Ya aceptaste una oferta.": "Kamu sudah menerima satu tawaran.",
		"Ya no está en venta.": "Sudah tidak dijual.",
		"En venta: sus ofertas, en la lista VENDER.": "Dijual: tawarannya ada di daftar JUAL.",
		"TU VENTANA": "JENDELAMU",
		"TRATOS CERRADOS": "DEAL SELESAI",
		"CERRAR TRATOS": "TUTUP DEAL",
		"TE QUEDA": "SISA",
		"VENTAS": "JUAL",
		"GENTE": "ORANG",
		"SECCION": "BAGIAN",
		"DECORAR": "DEKORASI",
		"VENDER MUEBLE": "JUAL BARANG",
		"¿Esperabas este recibimiento?": "Apakah kamu mengira sambutan seperti ini?",
		"¿Qué esperas de esta nueva etapa?": "Apa harapanmu untuk babak baru ini?",
		"Vengo a devolverles todo este cariño en el campo.": "Aku akan membalas semua cinta ini di lapangan.",
		"Es un sueño. Ahora toca ganarse el sitio.": "Ini mimpi. Sekarang saatnya merebut tempatku.",
		"Vengo a dejarlo todo por esta camiseta.": "Aku datang untuk memberikan segalanya demi jersey ini.",
		"Q1": "Q1",
		"Q2": "Q2",
		"Q3": "Q3",
		"PO": "PO",
		"SI PIERDES": "JIKA KALAH",
		"CAMINO A LA FASE DE LIGA": "JALAN KE FASE LIGA",
		"VÍA DE LIGA": "JALUR LIGA",
		"VÍA DE CAMPEONES": "JALUR JUARA",
		"GANADOR DE": "PEMENANG",
		"PERDEDOR DE": "PECUNDANG",
		"SORTEO {0}": "UNDI {0}",
		"IDA {0}": "LEG 1 {0}",
		"VUELTA {0}": "LEG 2 {0}",
		"DESDE LA FASE DE LIGA YA NO SE BAJA": "DARI FASE LIGA TIDAK TURUN LAGI",
		"GLOBAL A FAVOR": "AGREGAT UNGGUL",
		"GLOBAL EN CONTRA": "AGREGAT KALAH",
		"GLOBAL IGUALADO": "AGREGAT SERI",
		"UEFA": "UEFA",
		"COEFICIENTE DE 5 TEMPORADAS": "KOEFISIEN 5 MUSIM",
		"Tu liga no juega las copas de la UEFA.": "Ligamu tidak bermain di kompetisi UEFA.",
		"PLAZAS {0}": "SLOT {0}",
		"uefaSUSPENDIDA": "DITANGGUHKAN",
		"uefa{0} A {1}": "{1} KE {0}",
		"COEFICIENTE UEFA": "KOEFISIEN UEFA",
		"5 TEMPORADAS": "5 MUSIM",
		"CABEZA DE SERIE": "UNGGULAN",
		"SUELO DE TU LIGA": "BATAS BAWAH LIGA",
		"LP": "FL",
	},


	"career_pages": {
		"TUYA": "MILIK",

		"¿Te la compras?": "Mau beli?",
		"Va a tu clóset: te la pones en PERSONALIZAR.": "Masuk lemarimu: pakai di KUSTOM.",
		"COMPRAR ${0}": "BELI ${0}",





		"LO QUE PIDE EL CLUB": "TUNTUTAN KLUB",
		"Lo que se le exige al equipo, medido contra sus rivales de cada torneo.": "Yang dituntut dari tim, diukur dengan para lawan di tiap turnamen.",
		"{0}: {1} o mejor": "{0}: {1} atau lebih baik",
		"Pelear arriba ({0} o mejor)": "Bersaing di atas ({0} atau lebih baik)",
		"Te lo suben: el año pasado diste más de lo pedido.": "Target dinaikkan: tahun lalu kamu memberi lebih dari yang diminta.",
		"Te lo bajan: el año pasado te quedaste corto.": "Target diturunkan: tahun lalu kamu kurang.",
		"A este ritmo: {0} de {1}": "Dengan ritme ini: {0} dari {1}",
		"EL CLUB": "KLUB",
		"GRUPO": "GRUP",
		"{0} goles · hiciste {1}": "{0} gol · kamu cetak {1}",
		"{0} asistencias · diste {1}": "{0} assist · kamu beri {1}",
		"{0} partidos · jugaste {1}": "{0} laga · kamu main {1}",
		"nota {0} · hiciste {1}": "rating {0} · kamu dapat {1}",
		"acabar {0} o mejor": "finis {0} atau lebih baik",
		"TE SIENTAN POR NO CUMPLIR": "DICADANGKAN KARENA GAGAL",
		"Ganar la liga": "Juarai liga",
		"Acabar {0} o mejor": "Finis {0} atau lebih baik",
		"Mantener la categoría": "Bertahan di divisi",
		"Ascender de categoría": "Naik divisi",
		"Pelear el ascenso ({0} o mejor)": "Kejar promosi ({0} atau lebih baik)",
		"Levantar el título": "Angkat trofi",
		"Llegar a la final": "Capai final",
		"Llegar a semifinales": "Capai semifinal",
		"Llegar a cuartos": "Capai perempat final",
		"Pasar una ronda": "Lolos satu babak",
		"Pasar la fase de liga": "Lolos fase liga",
		"Dar la cara": "Tunjukkan perlawanan",
		"Competir": "Bersaing",
		"FALLADO": "GAGAL",
		"SIN EMPEZAR": "BELUM MULAI",
		"VAS {0}": "DI {0}",
		"SIN DATOS": "NIHIL",
		"EN FASE DE LIGA": "DI FASE LIGA",
		"{0}/{1} RONDAS": "{0}/{1} BABAK",
		"EL CLUB, CORTO": "KLUB KURANG",
		"{0} · PIDE {1}": "{0} · MINTA {1}",
		"Prima por el año del club: ${0}": "Bonus musim klub: ${0}",
		"El club destituye al técnico": "Klub memecat pelatih",
		"Las copas le salvan el puesto al técnico": "Piala menyelamatkan kursi pelatih",
		"El club le mantiene la confianza al técnico": "Klub tetap percaya pada pelatih",
		"TU OBJETIVO": "TARGETMU",
		"EL AÑO DEL CLUB": "MUSIM KLUB",

		"TU JUEGO": "GAYA MAIN",

		"HABILIDAD": "SKILL",

		"CLUBES": "KLUB",
		"JUGADORES": "PEMAIN",
		"BALON DE ORO": "PEMAIN TERBAIK",
		"TU CARRERA": "KARIERMU",
		"TROFEOS": "TROFI",

		"SONIDO": "SUARA",
		"MÚSICA": "MUSIK",
		"EFECTOS": "EFEK",
		"PARTIDO": "LAGA",
		"DIFICULTAD": "KESULITAN",
		"NORMAL": "NORMAL",



		"LA DIFICULTAD": "KESULITAN",
		"Así de duro te lo va a poner el rival. No lo eliges para siempre.": "Seberapa keras lawan akan menyulitkanmu. Pilihan ini tidak permanen.",
		"Puedes cambiarla en cualquier momento desde PAUSA > AJUSTES, sin salir del partido.": "Bisa kamu ganti kapan saja lewat JEDA > SETELAN, tanpa keluar dari laga.",
		"FACIL: el rival se para mientras apuntas y no te quita el balón nunca. El portero falla más.": "MUDAH: lawan berhenti saat kamu membidik dan tak pernah merebut bola. Kiper lebih sering salah.",
		"NORMAL: el rival va más lento mientras apuntas y te roba de más cerca. El portero falla algo más.": "NORMAL: lawan lebih lambat saat kamu membidik dan merebut bola dari jarak lebih dekat. Kiper agak lebih sering salah.",
		"DIFICIL: el juego completo. Te aprietan mientras apuntas, te roban el balón y el portero no regala nada.": "SULIT: permainan utuh. Kamu ditekan saat membidik, bola bisa direbut dan kiper tak memberi celah.",
		"EXTREMO: marcan a la estrella, una ocasión menos, cansado tiras peor, tapan más, roban sin aviso y todos te exigen más.": "EKSTREM: bintang dijaga ketat, peluang berkurang satu, lelah tendangan melenceng, lebih banyak blok, direbut tanpa peringatan, semua menuntut lebih.",
		"PERSPECTIVA": "PERSPEKTIF",
		"TV": "TV",
		"CAMPO": "PITCH",
		"TV: el plano alto de siempre. Toda la cancha por delante para ver a quién pasarla.": "TV: sudut tinggi seperti biasa. Seluruh lapangan di depanmu, untuk melihat ke siapa bola dioper.",
		"CAMPO: la cámara baja y se acerca, casi a tu espalda. Entra el fondo del estadio y el partido se ve desde dentro.": "PITCH: kamera lebih rendah dan dekat, nyaris di belakangmu. Ujung stadion ikut terlihat dan laga terasa dari dalam.",
		"SACUDIDA DE CÁMARA": "GETAR KAMERA",
		"DISTANCIA DE CÁMARA": "JARAK KAMERA",
		"GIRO DE VISTA": "PUTAR SUDUT",
		"MENOS MOVIMIENTO DE CÁMARA": "KAMERA LEBIH DIAM",
		"VIBRACIÓN": "GETARAN",
		"TEMA CLARO": "TEMA TERANG",
		"TEMA OSCURO": "TEMA GELAP",
		"PANTALLA": "LAYAR",
		"EFECTO CRT": "EFEK CRT",
		"AHORRO DE BATERÍA": "HEMAT BATERAI",

		"CALIDAD BAJA": "MODE RINGAN",
		"MUY BAJA": "SANGAT RINGAN",

		"Rayas de tele retro": "Garis TV jadul",
		"Más fluido, menos detalle y sin CRT": "Lebih lancar, detail berkurang, tanpa CRT",
		"Aún más fluido, menos nítido": "Makin lancar, kurang tajam",
		"Menús a 30 fps cuando no tocas": "Menu 30 fps saat tidak disentuh",
		"Cambia el icono de la app": "Ganti ikon aplikasi",
		"Juega con el teléfono girado": "Main dengan ponsel miring",

		"HORIZONTAL": "LANSKAP",
		"EN CONSTRUCCIÓN": "BELUM SELESAI",
		"PROBAR": "COBA",
		"La vista horizontal todavía no está terminada: algunas pantallas "
		+ "pueden verse descuadradas o cortadas. Puedes volver a la vertical aquí mismo "
		+ "cuando quieras.":
			"Tampilan horizontal belum selesai: beberapa layar bisa terlihat berantakan atau terpotong. Kamu bisa kembali ke tampilan tegak di sini kapan saja.",
		"Para teléfonos que van lentos: menos resolución en el estadio, sin filtro "
		+ "CRT ni sombras, y la mitad de lluvia y nieve.":
			"Untuk ponsel yang lambat: resolusi stadion lebih rendah, tanpa filter CRT dan bayangan, serta hujan dan salju separuhnya.",
		"Tu teléfono iba lento: activamos CALIDAD BAJA. Puedes quitarla en "
		+ "AJUSTES.":
			"Ponselmu lambat, jadi MODE RINGAN kami aktifkan. Bisa kamu matikan di SETELAN.",

		"ICONO DE LA APP": "IKON APLIKASI",
		"CLÁSICO": "KLASIK",
		"NOCHE DE BRUJAS": "HALLOWEEN",
		"Cambia el icono del juego en tu pantalla de inicio.":
			"Ganti ikon game di layar utamamu.",
		"El teléfono no dejó cambiar el icono. Vuelve a intentarlo.":
			"Ponsel tidak mengizinkan ikon diganti. Coba lagi.",
		"Con el juego quieto baja el refresco y deja que la pantalla se apague "
		+ "sola. El partido no cambia.":
			"Saat game diam, refresh rate turun dan layar mati sendiri. Laga tidak berubah.",
		"CARRERAS": "KARIER",
		"Borra la carrera de cualquier ranura para dejarla libre. No se puede deshacer.":
			"Hapus karier di slot mana pun agar kosong. Tidak bisa diurungkan.",
		"EMPEZAR DE CERO": "MULAI DARI NOL",
		"Borra todas las carreras Y todos los logros. El juego queda como recién instalado. No se puede deshacer.":
			"Menghapus semua karier DAN semua prestasi. Game kembali seperti baru dipasang. Tidak bisa diurungkan.",
		"REINICIAR TODO": "RESET SEMUA",
		"¿REINICIAR TODO?": "RESET SEMUA?",
		"Se pierden todas las carreras y TODOS los logros. El juego vuelve a empezar de cero. Esto no se puede deshacer.":
			"Semua karier dan SEMUA prestasi hilang. Game mulai dari nol. Ini tidak bisa diurungkan.",
		"SÍ": "YA",
		"BORRAR": "HAPUS",
		"SÍ, BORRAR": "YA, HAPUS",
		"SÍ, BORRAR TODO": "YA, HAPUS SEMUA",
		"CANCELAR": "BATAL",
		"VACÍA": "KOSONG",
		"RETIRADO": "PENSIUN",
		"T{0}": "M{0}",
		"¿BORRAR RANURA {0}?": "HAPUS SLOT {0}?",
		"Es tu carrera ACTIVA.": "Ini karier AKTIFMU.",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.{1}\n"
		+ "Las otras ranuras no se tocan.":
			"Karier {0} akan hilang: level, uang, kontrak, dan palmares.{1}\nSlot lain tidak terpengaruh.",

		"TU NOMBRE": "NAMAMU",
		"NOMBRE EN LA ESPALDA": "NAMA DI PUNGGUNG",
		"16 AÑOS · DEBUTANTE": "16 THN · PEMULA",
		"Debutante": "Pemula",
		"TU ASPECTO": "LOOKMU",
		"NUEVA CARRERA+": "KARIER BARU+",
		"Lo que te ganaste en carreras anteriores. Elige con qué ventaja arrancas esta "
		+ "vez —o ninguna, y empieza de cero como todos.":
			"Yang kamu raih di karier sebelumnya. Pilih keunggulan yang kamu bawa kali ini — atau tak ada, dan mulai dari nol seperti semua orang.",
		"QUITAR": "LEPAS",
		"ELEGIR": "PILIH",
		"TU NACIONALIDAD": "NEGARAMU",
		"ELIGE TU NACIONALIDAD": "PILIH NEGARAMU",
		"FALTA TU NOMBRE Y TU NACIONALIDAD": "NAMA DAN NEGARA BELUM DIISI",
		"FALTA ESCRIBIR TU NOMBRE": "TULIS NAMAMU DULU",
		"FALTA ELEGIR TU NACIONALIDAD": "PILIH NEGARAMU DULU",
		"TU CLUB": "KLUBMU",
		"LEYENDAS DEL CLUB": "LEGENDA KLUB",
		"NO EXISTEN LEYENDAS AÚN": "BELUM ADA LEGENDA",
		"CREA TU JUGADOR": "BUAT PEMAINMU",



		"PASO 1 DE 2 · NOMBRE Y ASPECTO": "LANGKAH 1 DARI 2 · NAMA & LOOK",
		"SIGUIENTE  >": "LANJUT  >",
		"< ATRÁS": "< BALIK",
		"NACIONALIDAD Y CLUB": "NEGARA & KLUB",
		"PASO 2 DE 2 · CON QUIÉN Y DÓNDE EMPIEZAS": "LANGKAH 2 DARI 2 · SIAPA & DI MANA",
		"EMPEZAR CARRERA": "MULAI KARIER",
		"< VOLVER": "< BALIK",



		"Primera": "Pertama",
		"Segunda": "Kedua",
		"Tercera": "Ketiga",
		"{0} DIVISIÓN": "DIVISI {0}",
		"¡NUEVO!": "BARU!",
		"DESBLOQUEADA": "TERBUKA",
		"BLOQUEADO": "TERKUNCI",

		"< ATRAS": "< BALIK",



		"Piel": "Kulit",
		"Pelo": "Rambut",
		"Corte": "Potongan",
		"Vello facial": "Bulu wajah",



		"Puntas": "Ujung",
		"Botines": "Sepatu bola",
		"Playera casual": "Kaus santai",
		"Pantalón casual": "Celana santai",
		"Estampado": "Motif",
		"2º color playera": "Warna kaus 2",
		"Manga": "Lengan",
		"Prenda": "Pakaian",
		"Chamarra": "Jaket",
		"Rectangulares": "Persegi",
		"Deportivos": "Sporty",
		"Short de mezclilla": "Jin pendek",
		"Short cargo": "Cargo pendek",
		"Bermuda": "Bermuda",
		"Short de baño": "Celana renang",
		"Diamante": "Berlian",
		"Doble aro": "Hoop ganda",
		"Colgante": "Menjuntai",
		"Ear cuff": "Ear cuff",
		"Oxford": "Oxford",
		"Chelsea": "Chelsea",
		"Chanclas": "Sandal jepit",
		"Gala": "Gala",
		"Traje de gala": "Jas gala",
		"Esmoquin clásico": "Tuksedo klasik",
		"Traje azul": "Jas biru",
		"Esmoquin marfil": "Tuksedo gading",
		"Terciopelo granate": "Beludru merah tua",
		"Tres piezas gris": "Tiga potong abu",
		"Traje cruzado": "Jas dua baris",
		"Oficina azul": "Kantor biru",
		"Básico grafito": "Dasar grafit",
		"Lino arena": "Linen pasir",
		"Traje café": "Jas cokelat",
		"Satén medianoche": "Satin tengah malam",
		"Terciopelo esmeralda": "Beludru zamrud",
		"Seda perla": "Sutra mutiara",
		"Marfil y oro": "Gading dan emas",
		"Negro y oro": "Hitam dan emas",
		"Diplomático": "Diplomat",
		"Traje sin corbata": "Jas tanpa dasi",
		"Saco y cuello alto": "Blazer dan turtleneck",
		"Conjunto con chaleco": "Setelan dan rompi",
		"Oversize": "Oversize",
		"Sin mangas": "Tanpa lengan",
		"Cuello alto": "Turtleneck",
		"Camisa abierta": "Kemeja terbuka",
		"Chinos": "Chino",
		"Mezclilla ancha": "Jin lebar",
		"De vestir": "Formal",
		"Short deportivo": "Celana olahraga",
		"Bomber": "Bomber",
		"Mezclilla": "Jin",
		"Cuero": "Kulit",
		"Rompevientos": "Jaket anti angin",
		"Blazer": "Blazer",
		"Cierre": "Resleting",
		"Abierta": "Terbuka",
		"Cerrada": "Tertutup",
		"Hacia atrás": "Dibalik",
		"Gorro tejido": "Kupluk",
		"Bucket": "Bucket",
		"Redondos": "Bulat",
		"Aviador": "Aviator",
		"Con dije": "Liontin",
		"Reloj": "Jam tangan",
		"Pulsera": "Gelang",
		"Calzado": "Alas kaki",
		"Tenis bajos": "Sneaker rendah",
		"Tenis altos": "Sneaker tinggi",
		"Botas": "Bot",
		"Mocasines": "Loafer",
		"Sandalias": "Sandal",
		"Color del calzado": "Warna sepatu",
		"Playeras": "Kaus",
		"Pantalones": "Celana",
		"Chamarras": "Jaket",
		"Gorras": "Topi",
		"Accesorios": "Aksesori",
		"Color de playera": "Warna kaus",
		"Prenda exterior": "Luaran",
		"Color de chamarra": "Warna jaket",
		"Recto": "Lurus",
		"Jeans": "Jeans",
		"Cargo": "Cargo",
		"Jogger": "Jogger",
		"Aretes": "Anting",
		"Broquel": "Tindik",
		"Aro": "Hoop",
		"Cadena": "Rantai",
		"Metal": "Logam",
		"Polo": "Polo",
		"Camisa": "Kemeja",
		"Suéter": "Sweter",
		"Chaleco": "Rompi",
		"Abrigo": "Mantel",
		"Hoodie": "Hoodie",
		"Largo del pantalón": "Panjang celana",
		"Largo": "Panjang",
		"Corto": "Pendek",
		"Gorra": "Topi",
		"Sombrero": "Topi lebar",
		"Color de la gorra": "Warna topi",
		"Corta": "Pendek",
		"Larga": "Panjang",
		"Gafas": "Kacamata",
		"De sol": "Hitam",
		"Lentes": "Minus",
		"Liso": "Polos",
		"Rayas": "Garis",
		"Raya fina": "Garis tipis",
		"Mitad": "Separuh",
		"Tatuajes": "Tato",

		"Tinte": "Warna",
		"Rostro": "Wajah",
		"Mediano": "Sedang",
		"Accesorio": "Aksesori",
		"Brazos": "Lengan",
		"Arriba": "Atas",
		"Abajo": "Bawah",
		"Detalles": "Detail",
		"Outfits": "Outfit",
		"Traje": "Jas",
		"Cuello": "Leher",
		"Muñeca": "Pergelangan",
		"Brazo izq": "Lengan kiri",
		"Brazo der": "Lengan kanan",
		"Ambos": "Keduanya",


		"Tatuaje de cuello": "Tato leher",
		"Tinta del cuello": "Tinta leher",
		"Dibujo de la pierna": "Motif kaki",
		"Tinta de la pierna": "Tinta kaki",
		"Guantes de campo": "Sarung tangan",
		"Guantes": "Gloves",
		"Muñequeras": "Gelang tangan",
		"Color de la muñequera": "Warna gelang",
		"Manga de compresión": "Lengan kompresi",
		"Color de la manga": "Warna lengan",
		"Vendaje": "Perban",
		"Medias": "Kaus kaki",
		"Cinta de la media": "Pita kaus kaki",
		"Normales": "Biasa",
		"Con cinta": "Berpita",
		"Bajadas": "Diturunkan",
		"Piernas": "Kaki",
		"Pierna izq": "Kaki kiri",
		"Pierna der": "Kaki kanan",
		"Manga entera": "Lengan penuh",
		"Antebrazo": "Lengan bawah",
		"Bíceps": "Bisep",
		"Manga difuminada": "Lengan pudar",
		"Escamas": "Sisik",
		"Eslabones": "Mata rantai",
		"Ondas": "Gelombang",
		"Cuadros": "Kotak-kotak",
		"Aros finos": "Cincin tipis",
		"Salpicado": "Bintik",
		"Tres aros": "Tiga cincin",
		"Lágrima": "Air mata",
		"Estrella": "Bintang",
		"Barra": "Batang",
		"Triángulo": "Segitiga",
		"Galón": "Chevron",
		"Flecha": "Panah",
		"Cuadro": "Kotak",
		"Anillo": "Cincin",
		"Gancho": "Kait",
		"Raya corta": "Garis pendek",
		"Dos barras": "Dua batang",
		"Cruz": "Salib",
		"Franja": "Pita",
		"Franja ancha": "Pita lebar",
		"Tres puntos": "Tiga titik",
		"Rombo": "Belah ketupat",
		"Dibujo del tatuaje": "Motif tato",
		"Tinta del tatuaje": "Tinta tato",
		"Punto": "Titik",
		"Dos puntos": "Dua titik",
		"Línea corta": "Garis pendek",
		"Cruz pequeña": "Salib kecil",
		"Rombo pequeño": "Belah ketupat kecil",
		"Izquierda": "Kiri",
		"Derecha": "Kanan",
		"Ambas": "Keduanya",
		"Damero": "Papan catur",
		"Aros": "Cincin",
		"Brazalete": "Ban lengan",
		"Tribal": "Tribal",
		"Cepillo": "Cepak",
		"Un costado": "Satu sisi",
		"Mullet": "Mullet",
		"Afro": "Afro",
		"Melena": "Gondrong",
		"Ojos": "Mata",
		"Cejas": "Alis",
		"Accesorio de cabeza": "Aksesori kepala",
		"Raya al medio": "Belah tengah",
		"Coronilla": "Ubun-ubun",
		"Herradura": "Tapal kuda",
		"Normal": "Normal",
		"Calvo": "Botak",
		"Rapado": "Cukur",
		"Cresta": "Mohawk",
		"Lados": "Undercut",
		"Degradado": "Fade",
		"Entradas": "Dahi lebar",
		"Cresta ancha": "Mohawk lebar",
		"Raya": "Belahan",
		"Franjas": "Garis",
		"Nada": "Tak ada",
		"Barba": "Jenggot",
		"Candado": "Goatee",
		"Bigote": "Kumis",
		"Sombra": "Brewok tipis",
		"Patillas": "Cambang",
		"Mosca": "Soul patch",
		"Contorno": "Garis rahang",
		"Barbón": "Jenggot penuh",
		"Manillar": "Handlebar",

		"CAMBIAR": "GANTI",
		"BUSCAR": "CARI",
		"SIN RESULTADOS": "TAK ADA HASIL",
		"SUGERIDAS": "SARAN",
		"TODAS": "SEMUA",
		"Color libre": "Warna bebas",


		"ANTES": "LAMA",
		"AHORA": "BARU",
		"PAÍS DEL CLUB": "NEGARA KLUB",
		"VER LOS {0} CLUBES": "LIHAT {0} KLUB",
		"TUS OFERTAS": "TAWARANMU",
		"INICIA DESDE ABAJO": "MULAI DARI BAWAH",
		"INICIA DONDE QUIERAS": "MULAI DI MANA SAJA",
		"ELIGE TU CLUB": "PILIH KLUBMU",
		"VER LAS {0} OFERTAS": "LIHAT {0} TAWARAN",
		"{0} DE TU PAÍS · {1} DEL EXTRANJERO": "{0} LOKAL · {1} ASING",
		"DIVISIÓN BLOQUEADA": "DIVISI TERKUNCI",
		"TELEMETRÍA": "TELEMETRI",
		"Contadores de uso guardados en este teléfono. Sirven para saber qué partes del juego se usan y no hay ningún dato tuyo dentro.":
			"Angka pemakaian yang disimpan di ponsel ini. Gunanya untuk tahu bagian game mana yang dipakai, dan tak ada datamu di dalamnya.",
		"COMPARTIR CONTADORES":
			"BAGIKAN ANGKA",
		"Estos mismos números se envían al desarrollador para saber qué partes del juego se usan. Nunca van tu nombre, tu partida ni nada que te identifique. Apágalo cuando quieras.":
			"Angka yang sama ini dikirim ke pengembang untuk tahu bagian game mana yang dipakai. Namamu, data permainanmu, dan apa pun yang mengenalimu tidak pernah ikut. Matikan kapan saja.",
		"VER CONTADORES": "LIHAT ANGKA",
		"BORRAR CONTADORES": "HAPUS ANGKA",
		"PEDIR BORRADO": "MINTA HAPUS DATA",
		"CERRAR": "TUTUP",
		"NO": "TAK",
		"MANTEN PARA REINICIAR TODO": "TAHAN UNTUK RESET SEMUA",
		"MANTEN PARA PEDIR CAMBIO": "TAHAN UNTUK MINTA KELUAR",
		"BORRAR TODO": "HAPUS SEMUA",
		"MANTÉN PULSADO PARA BORRAR TODO": "TAHAN UNTUK HAPUS SEMUA",

		"REY DEL GOL": "RAJA GOL",
		"REY DEL PASE": "RAJA ASSIST",
		"{0} lidera el goleo con {1}": "{0} puncaki daftar top skor dengan {1}",
		"{0} acaba de máximo goleador con {1}": "{0} tutup musim sebagai top skor dengan {1}",
		"{0} manda en asistencias con {1}": "{0} puncaki daftar assist dengan {1}",
		"{0} acaba líder de asistencias con {1}": "{0} tutup musim sebagai raja assist dengan {1}",
		"{0} es el jugador de la temporada ({1})": "{0} jadi pemain terbaik musim ini ({1})",
		"CAMPEÓN DE LIGA": "JUARA LIGA",
		"DESCIENDE": "DEGRADASI",
		"BOMBAZO": "TERMAHAL",
		"SORPRESA": "KEJUTAN",
		"{0} se lleva la liga": "{0} juara liga",
		"{0} baja a {1}": "{0} turun ke {1}",
		"{0} es el fichaje más caro de la ventana": "{0} jadi rekrutan termahal bursa ini",
		"{0} cuelga las botas": "{0} gantung sepatu",
		"{0} tumba al {1}": "{0} tumbangkan {1}",
		"{0} lleva {1} victorias seguidas": "{0} menang {1} kali beruntun",
		"{0} lleva {1} partidos sin ganar": "{0} tak menang dalam {1} laga",
		"El {0} destituye a {1}": "{0} pecat {1}",
		"{0} coge el banquillo del {1}": "{0} ambil alih {1}",
		"{0} deja el {1} y coge el {2}": "{0} tinggalkan {1} dan pindah ke {2}",
		"El {0} se lleva a {1} del {2}": "{0} bajak {1} dari {2}",

		"SELECCIONES": "TIMNAS",
		"{0} deja de ser seleccionador de {1}": "{0} mundur sebagai pelatih timnas {1}",
		"{0}, nuevo seleccionador de {1}": "{0}, pelatih baru timnas {1}",
		"{0} deja el {1} para dirigir a {2}": "{0} tinggalkan {1} untuk melatih {2}",
		"{0} deja la selección de {1} y coge la de {2}": "{0} tinggalkan timnas {1} dan pindah ke timnas {2}",
		"{0} deja la selección de {1} y coge el {2}": "{0} tinggalkan timnas {1} dan pindah ke {2}",

		"INVERSOR": "INVESTOR",
		"CRISIS": "KRISIS",
		"{0} cambia de dueño: llega dinero para fichar": "{0} ganti pemilik: uang masuk untuk belanja",
		"{0} entra en crisis y tendrá que vender": "{0} masuk krisis dan harus menjual pemain",
		"Se acaba el dinero del nuevo dueño del {0}": "Uang pemilik baru {0} habis",
		"NOTICIAS": "BERITA",
		"Tu club todavía no ha sido noticia.": "Klubmu belum jadi berita.",
		"Tu liga todavía no ha sido noticia.": "Ligamu belum jadi berita.",
		"El mundo todavía no ha dado que hablar.": "Belum ada kabar yang layak dibicarakan.",
		"Un jeque compra el {0}: viene a ganarlo todo": "Seorang syeikh membeli {0}: datang untuk juara",
		"Un magnate compra el {0}: llega dinero para fichar": "Seorang taipan membeli {0}: uang masuk untuk belanja",
		"Un fondo compra el {0} para revenderlo": "Sebuah dana membeli {0} untuk dijual lagi",
		"PRIMER PARTIDO": "LAGA PERTAMA",
		"BODA": "AKAD",
		"DIVORCIO": "CERAI",
		"RUPTURA": "PUTUS",
		"JUNTOS": "BERDUA",
		"A DISTANCIA": "JARAK JAUH",
		"{0} se casa": "{0} menikah",
		"{0} se divorcia": "{0} bercerai",
		"{0} rompe con su pareja": "{0} putus dengan pasangannya",
		"{0} llega al {1} con su pareja": "{0} tiba di {1} bersama pasangannya",
		"{0} llega solo al {1}: su pareja no se muda": "{0} tiba sendirian di {1}: pasangannya tidak pindah",
		"NOTICIA": "BERITA",
		"EL DOBLETE": "GELAR GANDA",
		"EL TRIPLETE": "TREBLE",
		"ASCENDISTE": "PROMOSI",
		"DESCENDISTE": "DEGRADASI",
		"de {0} equipos": "dari {0} tim",
		"Bolsa": "Tas",
		"Mallas": "Legging",
		"Térmicas": "Termal",
		"Rodillera": "Pelindung lutut",
		"Material": "Bahan",
		"Neopreno": "Neoprena",
		"LEER": "BACA",
		"SIN PERDER": "TAK KALAH",
		"ORDEN": "URUTAN",
		"ORDENAR": "URUTKAN",
		"TUS REDES": "MEDSOS",
		"TU POST": "POSTMU",
		"FUEGO": "API",
		"APLAUSO": "TEPUK",
		"HINCHA": "FANS",
		"MARCA": "MEREK",
		"¿CONTESTAS?": "BALAS?",
		"No contestas. Pasa solo.": "Tak dibalas. Lewat sendiri.",
		"Toca mejorar. Y mejoraré.": "Harus membaik. Pasti.",
		"En el próximo hablo yo. #CALLABOCAS": "Laga depan aku bicara. #DIAM",
		"SE COBRA": "DITAGIH",
		"te ha mencionado · nota {0}": "menyebutmu · nilai {0}",
		"Tu muro todavía está vacío.": "Dindingmu masih kosong.",
		"El Diario": "Harian Bola",
		"@eldiario": "@harianbola",
		"La Grada": "Tribun Setia",
		"@lagradafiel": "@tribunsetia",
		"@el_10_del_equipo": "@nomor10_tim",
		"Hincha rival": "Fans rival",
		"@ultra_norte": "@ultras_utara",
		"Tu marca": "Mereknu",
		"@tumarca_oficial": "@mereknu_resmi",
		"tras la {0}": "setelah {0}",
		"SEGUIDORES": "PENGIKUT",
		"RESPONDER": "BALAS",
		"RESPONDIENDO A": "MEMBALAS",
		"Nos vemos en el campo. #ALLÍTEESPERO": "Sampai jumpa di lapangan. #KUTUNGGUDISANA",
		"¡Así se habla, capitán!": "Begitu dong, kapten!",
		"Mucho hablar...": "Banyak omong...",
		"TE ETIQUETAN": "DITAG",
		"Un rival te ha mencionado antes del partido. Todo el mundo mira qué contestas.": "Seorang rival menyebutmu sebelum pertandingan. Semua orang menunggu jawabanmu.",
		"Lo dijiste en redes. Hoy te toca callar.": "Kamu bilang di medsos. Hari ini giliranmu diam.",
		"antes de la {0}": "sebelum {0}",
		"{0} te ha etiquetado": "{0} men-tag kamu",
		"¿ENTRAS AL TRAPO?": "MELADENI?",
		"Ni le contestas. Tu técnico lo agradece.": "Kamu bahkan tak membalas. Pelatihmu menghargainya.",
		"el campo es mi casa. A ver si esta vez das la cara.": "lapangan itu rumahku. Kita lihat apa kali ini kamu berani muncul.",
		"¿te acuerdas de la final? Yo sí. Te espero en el campo.": "ingat finalnya? Aku ingat. Kutunggu di lapangan.",
		"Hablamos en el campo.": "Kita bicara di lapangan.",
		"La final ya pasó. Ahora, otra historia.": "Final sudah lewat. Sekarang, cerita lain.",
		"LA REVANCHA": "PEMBALASAN",
		"MENSAJES": "PESAN",
		"AGRADECER": "MAKASIH",
		"DISTE TU PALABRA": "SUDAH BERJANJI",
		"No tienes mensajes.": "Kamu tidak punya pesan.",
		"{0}, de la grada": "{0}, dari tribun",
		"CADUCA EN {0}": "SISA {0}",
		"TU ASISTENCIA · {0}": "ASISTMU · {0}",
		"RUMOR": "GOSIP",
		"PALABRA": "JANJI",
		"Si no contestas, no pasa nada.": "Kalau tidak kamu balas, tidak apa-apa.",
		"¿Con qué festejo nos celebras el próximo gol en casa?": "Dengan perayaan apa kamu merayakan gol kandang berikutnya untuk kami?",
		"ENCUESTA": "POLLING",
		"{0} VOTOS": "{0} SUARA",
		"Ganó {0}": "{0} menang",
		"Lo votó {0}": "Dipilih oleh {0}",
		"LLEVAR AL BOMBO": "KE UNDIAN",
		"Abre tu bombo de CELEBRACIONES.": "Buka undian PERAYAAN milikmu.",
		"SI SALE EN CASA": "HANYA DI KANDANG",
		"Tú celebras a tu manera.": "Rayakan dengan caramu.",
		"NO CUESTA NADA": "GRATIS",
		"Tu próximo gol en casa": "Gol kandangmu berikutnya",
		"LA PEÑA LA PIDE": "FANS MINTA",
		"encuesta del mes · gana {0}": "polling bulan ini · {0} menang",
		"La peña vota el festejo del mes. Gana {2}: ¡lo queremos ver en casa, {0}!": "Fans memilih perayaan bulan ini. {2} menang: kami ingin melihatnya di kandang, {0}!",
		"{0} le hace caso a su peña: {2} en casa.": "{0} menuruti fansnya: {2} di kandang.",
		"¡Lo pedimos y {0} lo hizo! {2} delante de la peña.": "Kami minta dan {0} melakukannya! {2} di depan fans.",
		"Llegar a la fase de liga": "Capai fase liga",
		"Ganar el cruce de {0}": "Menangkan babak {0}",
		"¡La selfie de mi vida con {0}! Ya es mi foto de perfil.": "Selfie terbaik seumur hidup bareng {0}! Sekarang jadi foto profilku.",
		"Me firmó y encima nos hicimos una selfie. Gracias, {0}.": "Ditandatangani dan kami juga selfie bareng. Makasih, {0}.",
		"Salió movida, pero os juro que es {0}.": "Hasilnya buram, tapi sumpah itu {0}.",
		"TECLAS": "TOMBOL",
		"PULSA UNA TECLA": "TEKAN TOMBOL",
		"MANTEN PARA RESTABLECER": "TAHAN UNTUK RESET",
		"FAN": "FAN",
		"Pillaron al revendedor que se colaba en la firma de {0}. ¡Bien visto!": "Calo yang menyelinap ke antrean tanda tangan {0} ketahuan. Jeli!",
		"A {0} no se la cuelan: seguridad saca a un revendedor de su firma.": "{0} tak bisa dikelabui: keamanan mengusir calo dari sesi tanda tangan.",
		"Ya hay firmas de {0} a la venta por 5 €. El de la cola se puso las botas.": "Tanda tangan {0} sudah dijual 5 €. Orang di antrean itu untung besar.",
		"Nuestra tarde de firmas con {0} ya está en reventa. No era la idea.": "Sesi tanda tangan kami bersama {0} sudah dijual ulang. Bukan itu tujuannya.",
		"Esperé toda la tarde para ver a {0} y me sacó seguridad. Sólo quería su firma.": "Aku menunggu seharian untuk bertemu {0} dan malah diusir keamanan. Aku cuma mau tanda tangan.",
	},

























	"match": {
		"Mejor del Mundial": "Terbaik Kejuaraan Dunia",
		"Mejor de la Copa continental": "Terbaik Piala Benua",
		"Bota de la Copa continental": "Sepatu Emas Piala Benua",
		"Mejor (Mundial)": "Terbaik (Kejuaraan Dunia)",
		"Mejor (Continental)": "Terbaik (Benua)",
		"Bota (Continental)": "Sepatu (Benua)",
		"Figura del Mundial": "Bintang Kejuaraan Dunia",
		"JUEGOS OLÍMPICOS": "OLIMPIADE",
		"Campeón Olímpico": "Juara Olimpiade",
		"Oro olímpico": "Emas Olimpiade",
		"Oro Olímpico": "Emas Olimpiade",
		"Ganar el oro en los Juegos Olímpicos.": "Meraih emas di Olimpiade.",
		"El oro que no se compra. Se cuelga del cuello.": "Emas yang tak bisa dibeli. Tergantung di lehermu.",
		"JUEGOS OLÍMPICOS: oro para {0}": "OLIMPIADE: emas untuk {0}",
		"{0}: ORO en los Juegos Olímpicos": "{0}: EMAS di Olimpiade",
		"{0}: plata en los Juegos Olímpicos": "{0}: perak di Olimpiade",
		"{0}: bronce en los Juegos Olímpicos": "{0}: perunggu di Olimpiade",


		"NO SOLTÓ": "TAK LEPAS",
		"SE LA APRETÓ": "DIA DIREMAS",
		"ÉSTA VA POR TI": "INI UNTUKMU",
		"SE LA APRETARON, Y LO SABE": "DIA DIREMAS, DAN TAHU",
		"COMO SIEMPRE: NO SOLTÓ": "BIASA: DIA TAK MELEPAS",
		"HOY SE LA APRETARON": "HARI INI DIA DIREMAS",
		"NI UN CENTÍMETRO": "SEINCI PUN TIDAK",
		"SE DEJÓ APRETAR": "DIA MEMBIARKAN DIREMAS",
		"NO SOLTÓ, POR UNA VEZ": "SEKALI INI TAK LEPAS",
		"SE LA APRETÓ. LE DA IGUAL": "DIA DIREMAS. TAK PEDULI",



		"TU EX TÉCNICO NO CONTABA CONTIGO": "MANTAN PELATIHMU MENYEPELEKANMU",
		"TU EX TÉCNICO APLAUDE TU GOL": "MANTAN PELATIHMU PUJI GOLMU",
		"GOL A TU EX TÉCNICO": "GOL KE MANTAN PELATIHMU",
		"TU EX TÉCNICO SE VA SIN MIRARTE": "MANTAN PELATIHMU PERGI TAK MENOLEH",
		"TU EX TÉCNICO TE APLAUDE": "MANTAN PELATIHMU MEMUJIMU",
		"TU EX TÉCNICO FESTEJA": "MANTAN PELATIHMU GIRANG",
		"APRETASTE A TU EX TÉCNICO": "KAMU REMAS MANTAN PELATIH",
		"TU EX TÉCNICO PUEDE CONTIGO": "MANTAN PELATIHMU MASIH MENANG",
		"¡PICA RÁPIDO!": "KETUK CEPAT!",
		"LLEVA LA RAYA HASTA TU LADO": "TARIK GARIS KE SISIMU",



		"EL VOLADO": "TOSS KOIN",
		"Cara": "Gambar",
		"Sol": "Angka",
		"¿Cara o sol?": "Gambar atau angka?",
		"Tu equipo pide {0}.": "Timmu pilih {0}.",
		"La moneda dice {0}.": "Koin menunjukkan {0}.",
		"¡GANAS EL VOLADO! Pateas con tu gente.": "KAMU MENANG TOSS! Kamu menendang di depan suporter sendiri.",
		"Pierdes el volado: pateas ante la grada rival.": "Kamu kalah toss: kamu menendang menghadap tribun lawan.",

		"¡LE DISTE AL ÁRBITRO!": "KAMU KENAI WASIT!",
		"ROJA DIRECTA · {0} {1} DE SANCIÓN": "MERAH LANGSUNG · SKORS {0} {1}",






		"El derbi. Fuera de casa. Aquí no se perdona nada.": "Derby. Laga tandang. Di sini tak ada yang dimaafkan.",
		"Derbi. Noventa minutos que se recuerdan un año.": "Hari derby. Sembilan puluh menit yang diingat setahun penuh.",
		"Última jornada. Lo que pase aquí ya no se arregla.": "Pekan terakhir. Apa pun yang terjadi di sini, tak bisa diperbaiki lagi.",
		"{0}. Y tú llegas en racha.": "{0}. Dan kamu datang dalam performa bagus.",

		"Te van a apretar arriba desde el primer balón. Sacúdetelos rápido.": "Mereka menekanmu tinggi sejak bola pertama. Lepaskan diri dengan cepat.",
		"Hoy toca autobús: once atrás esperándote. La paciencia también juega.": "Hari ini bus diparkir: sebelas orang menunggu di belakang. Sabar juga bagian dari permainan.",
		"Te marcan al hombre. Cada carrera tuya se lleva a uno puesto.": "Kamu dijaga ketat satu lawan satu. Setiap larianmu menyeret satu pemain.",
		"Línea alta y sin prisa. La espalda de esa zaga es la jugada.": "Garis tinggi dan tanpa terburu-buru. Ruang di belakang lini bertahan itu kuncinya.",
		"Campo de {0}. A ver quién se acuerda de ti al final.": "Kandang {0}. Kita lihat siapa yang ingat namamu di akhir.",

		"Enfrente, {0}. Una temporada juntos en {1}; se acuerda de ti.": "Di seberang, {0}. Semusim bersama di {1}; dia ingat kamu.",
		"Enfrente, {0}: {2} temporadas juntos en {1}. Te conoce de memoria.": "Di seberang, {0}: {2} musim bersama di {1}. Dia hafal kamu luar dalam.",
		"{0} te conoce de {1}. Sabe hacia dónde vas a romper.": "{0} kenal kamu dari {1}. Dia tahu ke mana kamu akan menusuk.",
		"{0} jugó contigo en {1}: te lee antes de que toques.": "{0} pernah main denganmu di {1}: dia membacamu sebelum kamu menyentuh bola.",
		"Lo callaste. Su estadio entero, callado.": "Kamu membungkam mereka. Seluruh stadion mereka, hening.",
		"En el 90 y en su casa. De esos que no se olvidan.": "Menit ke-90, di kandang mereka. Yang tak bisa dilupakan.",
		"Le has dado la vuelta. Tú solo.": "Kamu membalikkan keadaan. Sendirian.",
		"Tres. Te llevas el balón a casa.": "Tiga. Kamu bawa bolanya pulang.",
		"Y van dos. El campo es tuyo.": "Sudah dua. Lapangan milikmu.",
		"En el derbi. Ese lo vas a contar mucho tiempo.": "Di derby. Ini akan kamu ceritakan bertahun-tahun.",
		"Empate. Y quedan minutos.": "Imbang lagi. Dan masih ada waktu.",
		"Te lo empatan al final. Y te toca a ti arreglarlo.": "Mereka menyamakan skor di akhir. Dan kamu yang harus memperbaikinya.",
		"{0} se pone por delante. La grada lo nota.": "{0} unggul. Suporter merasakannya.",
		"Otro. Esto se está yendo.": "Satu lagi. Laga ini mulai lepas.",

		"Vuelves a {0}. Aquí jugaste {1} temporadas.": "Kamu kembali ke {0}. Di sini kamu main {1} musim.",
		"Enfrente, {0}. Tu antiguo club.": "Di seberang, {0}. Klub lamamu.",
		"{0} te cedió. Hoy le devuelves el favor.": "{0} pernah meminjamkanmu. Hari ini kamu balas budi.",
		"{1} temporadas en {0}. Hoy celebras allí.": "{1} musim di {0}. Hari ini kamu merayakan di sana.",
		"{0} te dejó ir hace nada. Error suyo.": "{0} melepasmu belum lama ini. Kesalahan mereka.",
		"Le marcas a {0}, tu antiguo club.": "Kamu mencetak gol ke {0}, klub lamamu.",
		"{0} jugó contigo en {1}. Y hoy te marca.": "{0} main denganmu di {1}. Dan hari ini dia mencetak gol ke gawangmu.",
		"Tu club cedió a {0}. Y él se lo cobra.": "Klubmu meminjamkan {0}. Dan dia membalasnya.",
		"{0}: {1} temporadas en tu club. Hoy, rival.": "{0}: {1} musim di klubmu. Hari ini, lawan.",
		"{0}, ex de tu club. Duele el doble.": "{0}, mantan pemain klubmu. Sakitnya dua kali lipat.",
		"El palo. Un centímetro más adentro y estabas celebrando.": "Tiang gawang. Satu sentimeter lagi ke dalam dan kamu sudah merayakan.",
		"Otra vez el hierro. Hoy no te quiere.": "Lagi-lagi kena tiang. Hari ini keberuntungan tak memihakmu.",
		"Se lo pusiste. El gol es suyo; el pase, tuyo.": "Kamu menyodorkannya. Golnya miliknya; umpannya milikmu.",


		"Levanta la mano. Nadie lo mira. Otra vez.": "Dia mengangkat tangan. Tak ada yang melihat. Lagi.",
		"Está solo y lo ve todo el estadio menos sus compañeros.": "Dia sendirian dan seluruh stadion melihatnya, kecuali rekan setimnya.",
		"La juegan por el otro lado. Ya ni la pide.": "Mereka main lewat sisi lain. Dia sudah berhenti minta bola.",
		"Se ofrece, le dan la espalda. Este equipo no es suyo.": "Dia menawarkan diri, mereka membelakangi. Tim ini bukan miliknya.",
		"Había pase y eligieron el otro. Pasa mucho últimamente.": "Ada umpan dan mereka pilih yang lain. Belakangan sering begini.",
		"Le llega y el estadio entero silba. Se le va larga.": "Bola sampai ke dia dan seluruh stadion bersiul. Kontrolnya kejauhan.",
		"El balón es suyo. El abucheo también. La pierde.": "Bolanya miliknya. Begitu juga cemoohannya. Dia kehilangan bola.",
		"Un pito por cada toque. No controla ni la más fácil.": "Siulan di setiap sentuhan. Dia tak bisa mengontrol bahkan yang termudah.",
		"La grada le cae encima y el control se le va largo.": "Suporter mencecarnya dan kontrolnya kejauhan.",



		"Uno se levanta en la tercera fila. Y no es para aplaudir.": "Seorang berdiri di baris ketiga. Bukan untuk bertepuk tangan.",
		"Ya hay quien le lleva la cuenta de los fallos desde la grada.": "Sudah ada yang menghitung kesalahannya dari tribun.",
		"Se oye a uno solo por encima de todos, y no dice nada bonito.": "Satu suara terdengar di atas semuanya, dan isinya tidak baik.",
		"El estadio se levanta sólo de verlo con el balón.": "Stadion berdiri hanya karena melihat dia pegang bola.",
		"Corean su nombre. Y todavía no ha hecho nada.": "Mereka menyanyikan namanya. Padahal dia belum berbuat apa-apa.",
		"Se oye el murmullo en cuanto la toca.": "Gumaman terdengar begitu dia menyentuh bola.",
		"Hasta su propia gente le silba al oír su nombre.": "Bahkan suporternya sendiri mencemooh begitu namanya disebut.",
		"Silbidos de los suyos. Hoy lo miran con lupa.": "Siulan dari pendukungnya sendiri. Hari ini setiap sentuhannya diteliti.",
		"Su grada no le perdona una. Cada toque, con lupa.": "Suporternya sendiri tak memaafkan satu pun. Setiap sentuhan diteliti.",
		"Ganado en su campo. Eso vale doble.": "Menang di kandang mereka. Nilainya dua kali lipat.",
		"El derbi es tuyo.": "Derby milikmu.",
		"Dijiste que lo ganarías, y lo ganaste.": "Kamu bilang akan menang, dan kamu menang.",
		"Hablaste antes del derbi. Hoy te toca callar.": "Kamu bicara sebelum derby. Hari ini kamu harus diam.",
		"BRAVATA": "SESUMBAR",
		"{0} cumplió su palabra ante el {1}": "{0} menepati janji melawan {1}",
		"{0} se traga sus palabras ante el {1}": "{0} menelan kata-katanya melawan {1}",
		"Cumpliste tu palabra ante el {0}": "Kamu menepati janji melawan {0}",
		"Te tragas tus palabras ante el {0}": "Kamu menelan kata-katamu melawan {0}",
		"Se acabó. Y lo dejaste escapar.": "Selesai. Dan kamu membiarkannya lepas.",


		"Desde tu campo. Todo el césped por delante.": "Dari wilayahmu sendiri. Seluruh rumput terbentang di depan.",
		"Balón tuyo en tu mitad. Ahora hay que cruzarla entera.": "Bola milikmu di separuh lapanganmu. Sekarang kamu harus menyeberangi seluruhnya.",
		"Se la das y sigues. Así se sale de la presión.": "Kamu oper dan terus lari. Begitu cara lepas dari tekanan.",
		"Un toque y a correr. La presión se queda atrás.": "Satu sentuhan lalu lari. Tekanan tertinggal di belakang.",
		"Se la das a {0}, que ya sabía que venía.": "Kamu oper ke {0}, yang sudah tahu bola akan datang.",
		"{0} y tú, de memoria. Ni hizo falta mirar.": "Kamu dan {0}, sudah hafal. Tak perlu menoleh.",
		"Medio campo cruzado sin un susto.": "Garis tengah terlewati tanpa panik.",
		"Ya estás en su mitad. Y con el balón.": "Kamu sudah di separuh lapangan mereka. Dan membawa bola.",
		"Se repliegan. Te dejaron llegar, no entrar.": "Mereka mundur. Kamu dibiarkan datang, bukan masuk.",
		"Cuarenta y cinco segundos de toque. Y nada que contar.": "Empat puluh lima detik oper-operan. Dan tak ada hasilnya.",
		"Demasiado solo, demasiado tiempo. Te la quitaron.": "Terlalu sendirian, terlalu lama. Bolamu direbut.",
		"Se enamoró del balón. Y lo pagó.": "Dia terlalu asyik dengan bola. Dan harus membayar mahal.",
		"Te bajan en tu campo. Falta, y a empezar de nuevo.": "Kamu dijatuhkan di wilayahmu sendiri. Pelanggaran, dan mulai lagi.",
		"Salió de tu área y acabó en la suya. La jugada es tuya.": "Bola keluar dari kotakmu dan berakhir di kotak mereka. Serangan itu milikmu.",
		"Tú la sacaste, él la metió. Así se construye.": "Kamu membawanya keluar, dia memasukkannya. Begitu cara membangun.",

		"Robo en tu campo. ¡A la contra!": "Rebut bola di wilayahmu. Serangan balik!",
		"La recuperas en tu mitad. Ahora, rápido.": "Kamu merebutnya di separuh lapanganmu. Sekarang, cepat.",
		"Están todos arriba. Hay campo para correr.": "Mereka semua naik. Ada ruang untuk berlari.",
		"Se volcaron buscando el gol. Su espalda es tuya.": "Mereka menumpuk ke depan mengejar gol. Ruang di belakang mereka milikmu.",
		"Con uno menos, a la contra. Es lo que toca.": "Kurang satu orang, main serangan balik. Itu yang harus dilakukan.",
		"Diez contra once: se defiende y se sale rápido.": "Sepuluh lawan sebelas: bertahan lalu keluar cepat.",
		"Se la das y arrancas. Cada segundo cuenta.": "Oper lalu lari. Setiap detik berharga.",
		"Pase y a correr. Que no les dé tiempo a volver.": "Oper dan lari. Jangan beri mereka waktu kembali.",
		"Tardaste. Ya volvieron todos.": "Terlambat. Mereka semua sudah kembali.",
		"La contra se enfrió. Ya están ordenados atrás.": "Serangan balik mendingin. Mereka sudah rapi di belakang.",
		"Falta táctica. Te cortan la contra.": "Pelanggaran taktis. Serangan balikmu dihentikan.",
		"Contra de manual. De tu campo a la red.": "Serangan balik sempurna. Dari wilayahmu ke gawang.",
		"Tú la llevaste, él la metió. Contra perfecta.": "Kamu membawanya, dia memasukkannya. Serangan balik sempurna.",
		"Juegan con diez. Busca al que está libre.": "Mereka bermain dengan sepuluh. Cari pemain yang bebas.",
		"Tres contra dos. Uno de los tuyos está solo.": "Tiga lawan dua. Salah satu pemainmu tidak terjaga.",

		"Contragolpe": "Serangan balik",
		"El hombre de más": "Unggul jumlah pemain",
		"Te la quitaron en tu área. Ese regalo no se devuelve.": "Bolamu direbut di kotakmu sendiri. Hadiah itu tak kembali.",
		"Perdida en tu área, gol en tu portería. Así de corto.": "Bola hilang di kotakmu, gol di gawangmu. Sesingkat itu.",
		"Te la roban ahí mismo y tu portero te salva la cara.": "Mereka merebutnya di situ juga dan kipermu menyelamatkan mukamu.",
		"Se la quitaron en tu área y la tiraron fuera. Hoy sí; mañana, no.": "Bolamu direbut di kotakmu dan mereka menendangnya melebar. Hari ini beruntung; besok, belum tentu.",
		"Desde el portero. Corta, y sin regalar.": "Dari kiper. Pendek, dan jangan buang bola.",
		"Le cortan el primer pase. En tu área. Malo.": "Umpan pertama dipotong. Di kotakmu. Buruk.",
		"Saque de meta. Tu portero tiene el balón y tú, la decisión.": "Tendangan gawang. Kipermu pegang bola, dan kamu yang memutuskan.",
		"Te vienen a buscar arriba. El portero no puede pensárselo.": "Mereka datang menekan tinggi. Kiper tak bisa berpikir lama.",
		"Presión alta al saque. Corto es un riesgo; largo, una moneda al aire.": "Pressing tinggi saat tendangan gawang. Pendek berisiko; panjang, lempar koin.",
		"En corto, a los pies. Salida limpia desde atrás.": "Pendek, ke kaki. Build-up bersih dari belakang.",
		"Saque corto y balón dominado. Así empieza una jugada, no un despeje.": "Tendangan pendek dan bola terkendali. Begitu serangan dimulai, bukan sapuan.",
		"La revienta y la baja un compañero. Medio campo de un golpe.": "Dia menendang keras dan rekan menjinakkannya. Setengah lapangan sekali tendang.",
		"Largo y con destinatario. La gana tu jugador y sigue el juego.": "Panjang, dan ada sasarannya. Pemainmu memenangkannya dan permainan lanjut.",
		"Tu portero te busca. Ahora es tuya, con todo el campo por delante.": "Kipermu mencarimu. Sekarang milikmu, seluruh lapangan di depan.",
		"Del guante a tus pies. A partir de aquí, la jugada es tuya.": "Dari sarung tangan ke kakimu. Mulai dari sini, serangannya milikmu.",
		"La reventó y la ganaron ellos. Saque largo, balón perdido.": "Dia menendangnya keras dan mereka yang menang. Tendangan panjang, bola hilang.",
		"Saque largo a ninguna parte: cabeza rival y a defender.": "Tendangan panjang ke antah berantah: sundulan lawan, dan kembali bertahan.",
		"El saque no encuentra a nadie. Balón muerto y a empezar otra vez.": "Tendangan tak menemukan siapa pun. Bola mati, dan mulai lagi.",
		"Se fue sin dueño. Un saque de meta que no llegó a nadie.": "Bola tak bertuan. Tendangan gawang yang tak sampai ke siapa pun.",
		"Se la quitan al primer pase, a un paso de tu portería. Regalo.": "Direbut dari umpan pertama, selangkah dari gawangmu. Hadiah.",
		"Del saque de meta al fondo de la red. Toda la cancha en una jugada.": "Dari tendangan gawang ke dasar jala. Seluruh lapangan dalam satu serangan.",
		"Empezó en el guante de tu portero y acabó en gol. Así se sale.": "Berawal dari sarung tangan kipermu dan berakhir gol. Begitu cara build-up dari belakang.",
		"De tu portero a la red sin pasar por ti. Lo viste de cerca.": "Dari kipermu ke jala tanpa lewat kamu. Kamu melihatnya dari dekat.",
		"Gol de la salida de meta. Tú no la tocaste, pero la viste nacer.": "Gol dari tendangan gawang. Kamu tak menyentuhnya, tapi kamu melihatnya lahir.",
		"Salió de tu portero y la acabaste tú. Cien metros de jugada.": "Keluar dari kipermu dan kamu yang menuntaskan. Serangan seratus meter.",
		"Saque de meta, campo cruzado y gol tuyo. De área a área.": "Tendangan gawang, lapangan terlewati, dan golmu. Dari kotak ke kotak.",
		"Saque de banda en corto, a tus pies. Ahora decides tú.": "Lemparan pendek, ke kakimu. Sekarang kamu yang memutuskan.",
		"Te la saca el lateral y la jugada sigue. Balón cuidado.": "Bek sayap melempar ke kamu dan permainan lanjut. Bola aman.",
		"Te la saca al pecho. Bájala y a jugar.": "Dilempar ke dadamu. Turunkan dan main.",
		"Saque de banda, control de pecho y la jugada viva.": "Lemparan ke dalam, kontrol dada, dan serangan tetap hidup.",
		"La colgaron con las manos y la metiste con la cabeza.": "Mereka melempar dengan tangan dan kamu menyelesaikannya dengan kepala.",
		"Saque de banda al área y cabezazo a la red. De pizarra.": "Lemparan jauh ke kotak dan sundulan masuk jala. Persis seperti di papan taktik.",
		"La cuelgan desde la banda y la despejan ellos. A por la siguiente.": "Bola dilambungkan dari sisi lapangan dan lawan menyapunya. Lanjut ke peluang berikutnya.",
		"Saque largo al área y cabeza rival. Esta vez no.": "Lemparan jauh ke kotak penalti dan sundulan bek lawan. Kali ini tidak.",
		"Cabezazo tras el saque de banda y el portero lo saca.": "Sundulan setelah lemparan ke dalam, dan kiper menepisnya.",
		"Saque largo, remate de cabeza y una parada de las buenas.": "Lemparan jauh, sundulan, dan save kelas atas.",
		"Saque de banda al área, cabezazo y fuera. Faltó dirección.": "Lemparan ke kotak, sundulan, dan melebar. Arahnya kurang pas.",
		"La peinas tras el saque largo y se marcha. Cerca.": "Kamu menyundul bola dari lemparan jauh, tapi bola melayang keluar. Nyaris.",





		"SELECCION": "TIMNAS",
		"LIBRO DE RECORDS": "BUKU REKOR",




		"Campeón del Mundo": "Juara Dunia",
		"Bota de Oro del Mundial": "Sepatu Emas Kejuaraan Dunia",
		"Campeón de Champions": "Juara Piala Elite",
		"Campeón de Europa League": "Juara Piala Europa",
		"Campeón del Mundo de Clubes": "Juara Dunia Antarklub",
		"Campeón continental": "Juara Kontinental",
		"Campeón de Liga": "Juara Liga",
		"Campeón de Copa": "Juara Piala",
		"Ascenso": "Promosi",
		"Mejor Jugador de la Liga": "Pemain Terbaik Liga",
		"Pichichi de la Liga": "Top Skor Liga",
		"Máximo Asistente de la Liga": "Raja Assist Liga",
		"Mejor de la Champions": "Terbaik Piala Elite",
		"Bota de la Champions": "Sepatu Emas Piala Elite",
		"Máximo Asistente de la Champions": "Raja Assist Piala Elite",
		"Mejor de la Europa League": "Terbaik Piala Europa",
		"Bota de la Europa League": "Sepatu Emas Piala Europa",
		"Máximo Asistente de la Europa League": "Raja Assist Piala Europa",


		"Campeón de Conference": "Juara Piala Challenge",
		"Mejor de la Conference": "Terbaik Piala Challenge",
		"Bota de la Conference": "Sepatu Emas Piala Challenge",
		"Máximo Asistente de la Conference": "Raja Assist Piala Challenge",
		"Mejor de la Copa": "Terbaik Piala",
		"Bota de la Copa": "Sepatu Emas Piala",
		"Máximo Asistente de la Copa": "Raja Assist Piala",
		"Mejor del Mundial de Clubes": "Terbaik Kejuaraan Dunia Klub",
		"Bota del Mundial de Clubes": "Sepatu Emas Kejuaraan Dunia Klub",
		"Máximo Asistente del Mundial de Clubes": "Raja Assist Kejuaraan Dunia Klub",
		"Jugador del Partido": "Pemain Terbaik Laga",
		"Jugador del Mes": "Pemain Terbaik Bulan Ini",
		"Bota de Oro": "Sepatu Emas",
		"MVP de la temporada": "MVP Musim",
		"Bota (Mundial)": "Sepatu (Kejuaraan Dunia)",
		"Mundial de Clubes": "Kejuaraan Dunia Klub",
		"Continental (selección)": "Kontinental (timnas)",
		"Liga": "Liga",
		"Copa": "Piala",
		"Mejor (Liga)": "Terbaik (Liga)",
		"Pichichi (Liga)": "Top Skor (Liga)",
		"Asist. (Liga)": "Ast. (Liga)",
		"Mejor (Champions)": "Terbaik (Piala Elite)",
		"Bota (Champions)": "Sepatu (Piala Elite)",
		"Asist. (Champions)": "Ast. (Piala Elite)",
		"Mejor (Europa)": "Terbaik (Europa)",
		"Bota (Europa)": "Sepatu (Europa)",
		"Asist. (Europa)": "Ast. (Europa)",


		"Mejor (Conference)": "Terbaik (Piala Challenge)",
		"Bota (Conference)": "Sepatu (Piala Challenge)",
		"Asist. (Conference)": "Ast. (Piala Challenge)",
		"Mejor (Copa)": "Terbaik (Piala)",
		"Bota (Copa)": "Sepatu (Piala)",
		"Asist. (Copa)": "Ast. (Piala)",
		"Mejor (Mundialito)": "Terbaik (Dunia Klub)",
		"Bota (Mundialito)": "Sepatu (Dunia Klub)",
		"Asist. (Mundialito)": "Ast. (Dunia Klub)",
		"MVP": "MVP",



		"PAUSA": "JEDA",
		"REANUDAR": "LANJUT",
		"REINICIAR": "ULANGI",
		"OTRO PARTIDO": "LAGA LAGI",
		"Toca para saltar": "Ketuk untuk lewati",
		"Gira la vista · suelta para volver a apuntar":
			"Putar sudut pandang · lepas untuk membidik lagi",
		"Arrastra hacia atrás para apuntar": "Seret ke belakang untuk membidik",
		"CABEZAZO · arrastra hacia atrás para apuntar": "SUNDULAN · seret ke belakang untuk membidik",
		"Toca el balón · arrastra para girar": "Ketuk bola · seret untuk memutar",


		"CENTRO · otro dedo vuelve al tiro": "SILANG · jari lain balik ke SHOT",
		"CENTRO · toca el balón": "SILANG · ketuk bola",



		"modoTIRO": "SHOT",
		"modoCENTRO": "SILANG",
		"modoREGATE": "DRIBEL",


		"modoCORRER": "LARI",

		"modoDESPEJE": "SAPUAN",

		"modoVOLEA": "VOLI",
		"modoCABEZAZO": "SUNDULAN",
		"modoCHILENA": "SALTO",



		"vistaARCO": "GOAL",
		"vistaCOMPAÑEROS": "REKAN",
		"Toca para continuar": "Ketuk untuk lanjut",


		"Arrastra para seguir": "Seret untuk lanjut",



		"hudNOTA": "RATING",
		"notaGOL": "GOL",
		"notaATAJADA": "SAVE",
		"notaPALO": "TIANG",
		"notaFUERA": "MELEBAR",
		"notaBLOQUEADO": "DIBLOK",
		"notaDESPEJE": "SAPUAN",
		"notaFUERA DE JUEGO": "OFFSIDE",
		"notaBALÓN PERDIDO": "BOLA HILANG",
		"notaSIN CONTACTO": "MELESET",
		"notaEN PROPIA": "OWN GOAL",
		"notaREGATE": "DRIBEL",

		"notaROBO": "REBUT",
		"notaDESBORDADO": "DILEWATI",
		"notaPENAL": "PENALTI",
		"notaFALTA": "FOUL",
		"notaPASE": "PASS",
		"notaPASE CLAVE": "KEY PASS",
		"notaASISTENCIA": "ASSIST",




		"notaLA ATRAPA EL PORTERO": "DITANGKAP KIPER",



		"notaSE TE FUE FUERA": "BOLA KELUAR",



		"notaFALLOS SEGUIDOS": "GAGAL BERUNTUN",
		"notaNADA": "NOL",

		"EJERCICIO {0} DE {1}": "LATIHAN {0} DARI {1}",
		"META:": "MISI:",
		"EMPEZAR": "MULAI",
		"SIGUIENTE": "LANJUT",
		"TERMINAR": "SELESAI",
		"LA ACADEMIA": "AKADEMI",
		"{0} / {1} ESTRELLAS": "{0} / {1} BINTANG",

		"Cinco ejercicios para aprender a jugar."
		+ " Cuantas más estrellas saques, mejores ofertas de club recibirás.":
			"Lima latihan untuk belajar main. Makin banyak bintang yang kamu raih, makin bagus tawaran klub yang kamu dapat.",
		"JUGAR LA ACADEMIA": "MAIN AKADEMI",
		"ÚLTIMOS 15 MINUTOS": "15 MENIT TERAKHIR",
		"TOCA PARA SEGUIR": "KETUK LANJUT",
		"SALTAR TUTORIAL": "LEWATI TUTORIAL",
		"Estos clubes se fijaron en ti. Elige tu oferta:":
			"Klub-klub ini melirikmu. Pilih tawaranmu:",
		"ELEGIR YO MISMO": "PILIH SENDIRI",
		"FICHAR": "TEKEN",
		"LA OFERTA DEL OJEADOR": "TAWARAN PENCARI BAKAT",
		"Boletín perfecto: mejor sueldo y rol, y +2 puntos de habilidad.":
			"Rapor sempurna: gaji dan peran lebih baik, plus 2 poin skill.",
		"Tu boletín mejora el sueldo y el rol de estas ofertas.":
			"Rapormu meningkatkan gaji dan peran tawaran ini.",
		"Tu boletín mejora el sueldo de estas ofertas.":
			"Rapormu meningkatkan gaji tawaran ini.",


		"TE FICHAN COMO: {0}": "PERANMU: {0}",
		"EMPEZARÍAS: {0}": "MULAI: {0}",
		"MUÉVETE": "BERGERAK",
		"PÉGALE": "TENDANG",
		"ENCARA": "HADAPI",
		"SIRVE AL ÁREA": "UMPAN SILANG",









		"Apoya el dedo dentro del círculo: ahí nace todo. Sácalo del círculo y corres hacia el lado contrario al que jalas. Suelta y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Letakkan jari di dalam lingkaran: semuanya bermula dari sana. Seret keluar dari lingkaran dan kamu berlari berlawanan dengan arah tarikanmu. Lepas dan kamu berhenti mendadak. Bawa bola ke cakram merah: begitu diinjak, ia padam dan menyalakan yang berikutnya, selalu di sisi seberang. Menggiring bola itu memilih arah, bukan lari lurus.",
		"Pisa las 4 zonas rojas, en orden.": "Injak 4 zona merah secara berurutan.",
		"Nadie te la quita y no hay reloj. Las estrellas son para quien las encadena rápido.": "Tak ada yang bisa merebutnya darimu dan tak ada batas waktu. Bintang untuk yang merangkainya paling cepat.",
		"Jala hacia atrás y sales corriendo hacia el disco.": "Tarik ke belakang dan kamu melesat ke arah cakram.",
		"Dos tiros de práctica: el primero a puerta vacía, el segundo ya con portero. Después, 2 goles en 4 intentos.": "Dua tembakan latihan: pertama ke gawang kosong, kedua sudah dengan kiper. Lalu, 2 gol dalam 4 percobaan.",
		"Los dos primeros no puntúan. En los otros, cuantos menos intentos gastes, más estrellas.": "Dua yang pertama tidak dihitung. Sisanya, makin sedikit percobaan yang terpakai, makin banyak bintang.",
		"Las cuatro zonas": "Empat zona",
		"Tiro a puerta": "Latihan menembak",
		"Jala hacia atrás, como una resortera: la guía apunta hacia"
		+ " adelante. Al soltar, toca el balón — y dónde lo tocas manda."
		+ " La costura marca el centro: ahí sale tenso. Cuanto más abajo"
		+ " de ella, más lo elevas, hasta la cuchara. Y cuanto más al"
		+ " borde, menos potencia: el pepinazo va al centro. Con dos dedos"
		+ " giras la vista y apuntas desde otro ángulo.":
			"Tarik ke belakang seperti ketapel: panduan mengarah ke depan. Saat dilepas, sentuh bola, dan tempat kamu menyentuhnya menentukan segalanya. Garis jahitan menandai bagian tengah: di situ bola melaju datar. Makin ke bawah, makin tinggi bola terangkat, sampai jadi chip. Dan makin ke tepi, makin kecil tenaganya: tembakan keras ada di tengah. Dengan dua jari kamu memutar sudut pandang dan membidik dari sudut lain.",
		"Cuantos menos intentos gastes, más estrellas.":
			"Makin sedikit percobaan yang terpakai, makin banyak bintang.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "Lawan menempel dan lapangan terbentang di depan: giring bola dan MENYEBERANG ke wilayah lawan — sampai garis menyala kamu tidak menembak, kamu menggiring, dan setiap kali maju, muncul lawan baru di jalurmu. Lalu, satu lawan satu: tembak langsung, atau giring dan kembali ke lingkaran untuk berhenti mendadak dan membidik dengan tenang.",
		"Primero cruza la media cancha, hasta la raya encendida. Después, el mano a mano: 1 gol en 3 intentos.": "Pertama seberangi garis tengah, sampai garis menyala. Lalu, satu lawan satu: 1 gol dalam 3 percobaan.",
		"La salida es un ensayo y no puntúa. Cuantos menos intentos"
		+ " gastes en el mano a mano, más estrellas.":
			"Fase awal cuma latihan dan tidak dihitung. Makin sedikit percobaan di satu lawan satu, makin banyak bintang.",
		"Marca 1 gol en 3 intentos.": "Cetak 1 gol dalam 3 percobaan.",



		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, dos PASES — dentro del círculo pasas —: el cambio de banda, buscando al compañero libre en la otra punta, y el relevo. El relevo es la regla más rara del juego: si el pase le llega a un compañero fuera del área, pasas a jugar con él; si cae dentro del área no hay control que valga y remata de primera.": "Ini UMPAN SILANG: bola dilambungkan ke kotak penalti. Pada tendangan sudut, bola sudah mulai sebagai SILANG; indikator di kanan atas menunjukkannya. Untuk berganti antara SILANG (melambung) dan SHOT (mendatar), ketuk dengan jari lain saat membidik, atau ketuk indikator itu. Cari kepala rekan setim, bukan gawang. Dan di akhir, dua UMPAN — di dalam lingkaran kamu mengumpan —: pindah sisi, mencari rekan yang bebas di ujung seberang, dan estafet. Estafet adalah aturan paling aneh di game ini: jika umpan sampai ke rekan di luar kotak penalti, kamu lanjut bermain sebagai dia; jika jatuh di dalam kotak penalti, tak ada kontrol: dia langsung menembak.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve los dos pases.": "Cetak 1 gol dalam 6 percobaan: 3 tendangan sudut dan 3 umpan silang. Dan lakukan dua umpan itu.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. Los dos pases son ensayo y no puntúan.": "Gol bisa datang di salah satu dari keenamnya. Makin cepat, makin banyak bintang. Dua umpan itu latihan dan tidak dihitung.",
		"El relevo": "Estafet",
		"Dentro del círculo pasas · al de fuera del área lo controlas tú": "Di dalam lingkaran kamu mengumpan · pemain di luar kotak jadi kendalimu",
		"La barrera tapa el camino raso: elévalo por encima tocando el"
		+ " balón abajo. El costado lo curva, si te atreves. Y el examen"
		+ " final: el penal. Respira. Tú eliges la esquina.":
			"Tembok menutup jalur mendatar: angkat bola melewatinya dengan menyentuh bagian bawah bola. Sisi bola membuatnya melengkung, kalau berani. Dan ujian akhir: penalti. Tarik napas. Kamu yang pilih sudutnya.",
		"Libre: 1 gol en 3 intentos · Penal: 1 en 2.":
			"Tendangan bebas: 1 gol dalam 3 percobaan · Penalti: 1 dalam 2.",


		"SE ACABARON LOS INTENTOS": "PERCOBAAN HABIS",
		"TE LA QUITÓ EL PORTERO": "KIPER MEREBUTNYA",
		"EJERCICIO {0} TERMINADO": "LATIHAN {0} SELESAI",
		"SIN ESTRELLAS": "TANPA BINTANG",
		"REPETIR {0}": "ULANGI {0}",
		"VER MIS OFERTAS": "LIHAT TAWARANKU",
		"Con ellas se decide qué clubes te ofrecen contrato."
		+ " Todo esto se entrena en Práctica cuando quieras.":
			"Bintang itu menentukan klub mana yang menawarimu kontrak. Semua ini bisa dilatih di Latihan kapan saja.",
		"Unos diez minutos. Puedes salirte cuando quieras.":
			"Sekitar sepuluh menit. Kamu bisa keluar kapan saja.",
		"SALTAR LA ACADEMIA": "LEWATI AKADEMI",
		"Eligiendo tu club a mano pierdes el premio del"
		+ " boletín.":
			"Memilih klub sendiri membuatmu kehilangan hadiah rapor.",
		"< MENÚ": "< MENU",


		"TERMINAR Y VER OFERTAS": "SELESAI, LIHAT TAWARAN",
		"EMPEZAR LA ACADEMIA DE CERO": "ULANG AKADEMI DARI AWAL",
		"¿SEGURO? TOCA OTRA VEZ": "YAKIN? KETUK LAGI",

		"PASO 1 DE 3 · QUIÉN ERES": "LANGKAH 1/3 · SIAPA KAMU",
		"PASO 3 DE 3 · DÓNDE EMPIEZAS": "LANGKAH 3/3 · MULAI DI MANA",


		"TUS CUALIDADES EN ESTE EJERCICIO": "KEMAMPUANMU DI LATIHAN INI",


		"TOCA PARA JUGAR": "KETUK MAIN",
		"TOCA PARA EMPEZAR": "KETUK MULAI",
		"{0}: SIN ESTRELLAS": "{0}: TANPA BINTANG",



		"Apoya el dedo dentro de tu círculo.":
			"Letakkan jari di dalam lingkaranmu.",
		"Saca el dedo del círculo: corres al lado contrario.":
			"Seret keluar dari lingkaran: kamu berlari ke arah berlawanan.",
		"Suelta y paras en seco.":
			"Lepas dan kamu berhenti mendadak.",
		"Dentro del círculo apuntas: la guía crece.":
			"Di dalam lingkaran kamu membidik: panduannya memanjang.",
		"Sacas el dedo del círculo y regateas, sin soltar.":
			"Seret keluar dari lingkaran dan kamu menggiring, tanpa melepas.",
		"Vuelves a entrar y paras en seco, apuntando.":
			"Masuk lagi dan kamu berhenti mendadak, sambil membidik.",
		"Sueltas dentro y le pegas.":
			"Lepas di dalam dan kamu menendang.",
		"Toca el pasto fuera de tu círculo y giras la vista.":
			"Ketuk rumput di luar lingkaranmu dan sudut pandang berputar.",
		"Otro toque y la vista vuelve.":
			"Ketuk lagi dan sudut pandang kembali.",
		"Fuera del círculo conduces: cruza la raya.":
			"Di luar lingkaran kamu menggiring: seberangi garis.",
		"Apunta al área y aguanta el dedo.":
			"Bidik ke kotak penalti dan tahan jarimu.",
		"Con otro dedo cambias entre CENTRO y TIRO.":
			"Dengan jari lain kamu berganti antara SILANG dan SHOT.",

		"Empuja este stick y corres hacia el disco.":
			"Dorong stik ini dan kamu berlari ke cakram.",
		"Empuja este stick y conduces: cruza la raya.":
			"Dorong stik ini dan kamu menggiring: lewati garis.",
		"Empuja este stick y conduces.":
			"Dorong stik ini dan kamu menggiring.",
		"Jala este stick hacia atrás y apuntas.":
			"Tarik stik ini ke belakang dan kamu membidik.",
		"Sueltas y le pegas.":
			"Lepas dan kamu menendang.",
		"Con este botón cambias entre CENTRO y TIRO.":
			"Tombol ini mengganti SILANG dan SHOT.",
		"Empuja este stick y avanza hacia el arco.":
			"Dorong stik ini dan maju ke gawang.",
		"Jala este stick y pásala a un compañero.":
			"Tarik stik ini dan oper ke rekan setim.",
		"Suelta y la cuelgas.":
			"Lepas dan kamu melambungkannya.",
		"Jala hacia atrás y suelta para pegarle.":
			"Tarik ke belakang dan lepas untuk menendang.",
		"Jala hacia atrás y corre: cruza la raya de la media cancha.": "Tarik ke belakang dan lari: seberangi garis tengah.",
		"Cuélgala al área. Con otro dedo cambias entre CENTRO y TIRO.":
			"Lambungkan ke kotak penalti. Dengan jari lain kamu berganti antara SILANG dan SHOT.",
		"Jala hacia atrás para pegarle a la falta.":
			"Tarik ke belakang untuk menendang tendangan bebas.",


		"GUÍA {0}/{1}": "TUR {0}/{1}",
		"SALTAR": "LEWATI",
		"LISTO": "OKE",
		"TIRO o CENTRO": "SHOT atau SILANG",
		"Este indicador dice cómo va a salir el balón. Toca con OTRO dedo"
		+ " mientras apuntas —o toca este chip— para cambiar entre TIRO (raso)"
		+ " y CENTRO (colgado). Los córners empiezan en CENTRO.":
			"Indikator ini menunjukkan bagaimana bola akan keluar. Ketuk dengan jari LAIN saat membidik —atau ketuk chip ini— untuk berganti antara SHOT (mendatar) dan SILANG (melambung). Tendangan sudut mulai di SILANG.",
		"ESTA ES TU CARRERA": "INILAH KARIERMU",
		"Bienvenido. Aquí arriba estás tú: tu media, tu energía y tu"
		+ " dinero, en todas las pantallas.":
			"Selamat datang. Di atas sini ada kamu: ratingmu, energimu, dan uangmu, di semua layar.",
		"TU PARTIDO": "LAGAMU",
		"El partido de hoy sale de este botón. Y el campo del fondo es"
		+ " para entrenar cuando quieras.":
			"Laga hari ini dimulai dari tombol ini. Dan lapangan di latar belakang untuk latihan kapan pun kamu mau.",
		"Estás aquí: tu partido y lo que reclama tu atención esta"
		+ " semana.":
			"Kamu di sini: lagamu dan apa pun yang butuh perhatianmu pekan ini.",
		"Tus habilidades, tu contrato, tu gente, tu tienda y tu casa.":
			"Skill-mu, kontrakmu, orang-orangmu, tokomu, dan rumahmu.",
		"Lo que pasa fuera y te afecta: los torneos y el mercado de"
		+ " fichajes.":
			"Apa yang terjadi di luar sana dan memengaruhimu: turnamen dan bursa transfer.",
		"Lo que ya no cambia: tu carrera, tus trofeos y las leyendas.":
			"Yang tak lagi berubah: kariermu, trofimu, dan para legenda.",
		"¿REPASAR?": "LIHAT LAGI?",
		"Este botón vuelve a abrir esta guía siempre que quieras.":
			"Tombol ini membuka lagi tur ini kapan pun kamu mau.",
		"Jala hacia atrás para correr · déjalos atrás":
			"Tarik ke belakang untuk lari · tinggalkan mereka",
		"Arrastra desde tu círculo: dentro apuntas · fuera corres":
			"Seret dari lingkaranmu: di dalam membidik · di luar lari",


		"bandaFUERA": "KELUAR",
		"La bajas…": "Kamu menurunkan bola…",
		"Conduciendo · vuelve al círculo para apuntar":
			"Menggiring · kembali ke lingkaran untuk membidik",
		"Conduciendo · toca tu círculo para apuntar": "Menggiring · ketuk lingkaranmu untuk membidik",
		"Jala para tirar · sal del círculo para conducir":
			"Tarik untuk menembak · keluar lingkaran untuk menggiring",
		"Jala para centrar · sal del círculo para conducir":
			"Tarik untuk umpan silang · keluar lingkaran untuk menggiring",
		"Arrastra dentro para apuntar · fuera conduces": "Seret di dalam untuk membidik · di luar menggiring",
		"Toca tu jugador · dentro del círculo tiras, fuera conduces":
			"Sentuh pemainmu · di dalam lingkaran menembak, di luar menggiring",
		"¡Cabezazo de {0}!": "Sundulan dari {0}!",
		"¡Al rechace {0}!": "{0} menyambar rebound!",
		"¡Al rechace!": "Menyambar rebound!",
		"¡Pase a {0}!": "Umpan ke {0}!",
		"¡Cabezazo!": "Sundulan!",
		"¡Palomita de {0}!": "Sundulan terbang dari {0}!",
		"¡Palomita!": "Sundulan terbang!",
		"¡Chilena de {0}!": "Tendangan salto dari {0}!",
		"¡Chilena!": "Tendangan salto!",
		"¡El portero le saca la chilena!": "Kiper menepis tendangan salto itu!",
		"¡Vaya chilena! Y vaya atajada": "Tendangan salto luar biasa! Dan save luar biasa",
		"La chilena choca con la defensa": "Tendangan salto membentur pertahanan",
		"¡Chilena bloqueada!": "Tendangan salto diblok!",
		"¡Chilena a las nubes!": "Tendangan salto melambung ke awan!",
		"La chilena se va por encima": "Tendangan salto melewati atas gawang",
		"¡La chilena al poste!": "Tendangan salto membentur tiang!",
		"¡Qué chilena! Y el palo dice no": "Tendangan salto indah! Tapi tiang menggagalkannya",
		"La chilena se va por poco": "Tendangan salto melebar tipis",
		"¡Casi! La chilena no entró": "Nyaris! Tendangan salto tidak masuk",
		"¡CHILENA DE {0}! GOLAZO DE OTRO PLANETA": "TENDANGAN SALTO DARI {0}! GOL DARI PLANET LAIN",
		"¡DE CHILENA! {0} FIRMA EL GOL DEL AÑO": "SALTO! {0} CETAK GOL TERBAIK TAHUN INI",
		"¡Pase!": "Umpan!",
		"¡Pase clave!": "Umpan kunci!",
		"¡Pase clave a {0}!": "Umpan kunci ke {0}!",
		"¡Conduce {0}!": "{0} menggiring bola!",
		"¡Conduce!": "Menggiring!",
		"Segunda jugada": "Bola kedua",
		"¡Bloqueado!": "Diblok!",
		"¡Desviado!": "Terdefleksi!",
		"¡Desviado a córner!": "Terdefleksi jadi korner!",
		"¡AUTOGOL DEL RIVAL!": "OWN GOAL LAWAN!",
		"AUTOGOL": "OWN GOAL",
		"notaDESVIADO": "DEFLEKSI",
		"Tu tiro se iba fuera, pero el defensa la mete en su propia portería.": "Tembakanmu melebar, tapi bek malah memasukkannya ke gawangnya sendiri.",
		"Iba fuera y rebota en el defensa hasta el fondo de su red. Autogol.": "Bola melebar lalu memantul dari bek masuk ke gawangnya sendiri. Gol bunuh diri.",
		"¡Le diste al camarógrafo!": "Kamu mengenai juru kamera!",
		"¡REVENTASTE EL CRISTAL DEL PALCO!": "KAMU PECAHKAN KACA BOKS VIP!",
		"¡Agrietaste el cristal del palco!": "Kamu meretakkan kaca boks VIP!",
		"¡Le diste a TU entrenador!": "Kamu mengenai PELATIHMU sendiri!",
		"¡Le diste al entrenador rival!": "Kamu mengenai pelatih lawan!",
		"¡Le diste a tu propio banquillo!": "Kamu mengenai bangku cadanganmu sendiri!",
		"¡Balonazo al banquillo rival!": "Bola keras ke bangku cadangan lawan!",
		" · EL MÍSTER TE SACA": " · PELATIH MENARIKMU",
		"EL TÉCNICO RETIRA A {0} · BALONAZO A SU PROPIO BANQUILLO": "PELATIH TARIK {0} KELUAR · TENDANG KE BANGKU SENDIRI",
		"BALONAZOS A TU PROPIO BANQUILLO": "BOLA KE BANGKUMU SENDIRI",
		"Le diste un balonazo a tu propia banca. Al túnel, sin discutir.": "Kamu menendang bola keras ke bangku cadanganmu sendiri. Langsung ke ruang ganti, tanpa debat.",
		"Le diste un balonazo a tu propia banca. Fuera del campo, sin discutir.": "Kamu menendang bola keras ke bangku cadanganmu sendiri. Keluar lapangan, tanpa debat.",
		"Recado a la Banca": "Pesan untuk Bangku",
		"Darle un balonazo a alguien del banquillo rival.": "Menendang bola keras ke seseorang di bangku cadangan lawan.",
		"Fuego Amigo": "Salah Tembak",
		"Gloria Prestada": "Kemuliaan Pinjaman",
		"Cederle un penal al compañero que iba por su hat-trick.": "Menyerahkan penalti ke rekan setim yang mengejar hat-trick.",
		"Nadie Toca Mi Balón": "Jangan Sentuh Bolaku",
		"Quedarte el penal con un compañero pidiéndotelo para su hat-trick.": "Tetap mengambil penalti walau rekan setim memohon demi hat-trick.",
		"Darle un balonazo a alguien de tu propio banquillo.": "Menendang bola keras ke seseorang di bangku cadangan timmu sendiri.",
		"Con el Míster No": "Pelatih Pun Kena",
		"Tumbar al entrenador rival de un balonazo.": "Menjatuhkan pelatih lawan dengan tendangan keras.",
		"Te Vas al Banquillo": "Kamu Ditarik Keluar",
		"Tumbar a tu propio entrenador de un balonazo.": "Menjatuhkan pelatihmu sendiri dengan tendangan keras.",
		"Desalojo": "Pengosongan Bangku",
		"Tumbar a diez personas de los banquillos a lo largo de tu carrera.":
			"Menjatuhkan sepuluh orang dari bangku cadangan sepanjang kariermu.",
		"¡Le diste al recogepelotas! La prensa no te lo perdona": "Kamu mengenai ball boy! Pers tak memaafkanmu",
		"¡Tiraste las botellas del portero!": "Kamu menjatuhkan botol minum kiper!",



		"¡LE DISTE AL ASPERSOR!": "KENA SPRINKLER!",
		"¡LE TIRASTE LA BEBIDA A UN AFICIONADO!": "KAMU TUMPAHKAN MINUMAN SEORANG SUPORTER!",
		"¡Le diste a una paloma!": "Kamu mengenai seekor merpati!",
		"¡Se fue a la calle!": "Bola keluar stadion!",
		"¡Se quedan el balón!": "Bolanya tak dikembalikan!",
		"¡Fuera de juego!": "Offside!",
		"¡GOL! (asistencia)": "GOL! (assist)",
		"¡GOOOL!": "GOOOL!",
		"Despeje del rival": "Lawan menyapu bola",


		"¡EN PROPIA PUERTA!": "GOL BUNUH DIRI!",
		"¡Se te escapó el balón!": "Bolanya lepas!",

		"TE LA DEVUELVE EL PORTERO": "KIPER KEMBALIKAN BOLA",
		"EL BALÓN VUELVE A TI": "BOLA KEMBALI KE KAMU",
		"¡Atajada del portero!": "Kiper menepisnya!",
		"Tiro bloqueado": "Tembakan diblok",
		"Por encima del arco": "Di atas mistar",
		"¡Al poste!": "Kena tiang!",
		"¡Al poste y fuera!": "Kena tiang dan keluar!",
		"¡Fuera!": "Melebar!",
		"¡Salió el portero!": "Kiper keluar!",
		"Se te fue por la línea": "Bolanya keluar lewat garis",
		"Te ganó el defensa": "Bek merebutnya",


		"Te resbalaste en el charco": "Kamu terpeleset di genangan",
		"¡Gran regate!": "Dribel hebat!",
		"La cobra {0}": "{0} mengeksekusi",
		"¡El portero se la ataja a {0}!": "Kiper menepis tembakan {0}!",
		"¡{0} la estrella en el palo!": "{0} menghantam tiang!",
		"¡La barrera se lo tapa a {0}!": "Tembok menahan tembakan {0}!",
		"Lo saca {0}…": "{0} yang eksekusi…",
		"Arrastra para moverte · toca el balón y remata": "Seret untuk bergerak · sentuh bola dan tembak",
		"¡{0} la manda fuera!": "{0} menendang melebar!",
		"¡Gol de {0}!": "Gol dari {0}!",
		"{0} NO FALLA DESDE LOS ONCE METROS": "{0} TAK GAGAL DARI TITIK PENALTI",
		"{0} FALLA DESDE LOS ONCE METROS": "{0} GAGAL DARI TITIK PENALTI",
		"LA FALTA DE {0} SE PIERDE SIN PELIGRO": "TENDANGAN BEBAS {0} TAK BERBAHAYA",
		"{0} LA CLAVA DE FALTA DIRECTA": "{0} GOL DARI TENDANGAN BEBAS",
		"{0} REMATA EL CÓRNER A LA RED": "{0} MENYUNDUL KORNER MASUK",
		"AHORA MANDA TU EQUIPO EL {0}": "TIMMU UNGGUL, {0}",
		"TU EQUIPO EMPATA EL PARTIDO, {0}": "TIMMU SAMAKAN, {0}",
		"TU EQUIPO RECORTA, {0}": "TIMMU MEMPERKECIL, {0}",
		"SE ADELANTA EL RIVAL, {0}": "LAWAN UNGGUL, {0}",
		"EL RIVAL EMPATA, {0}": "LAWAN SAMAKAN, {0}",
		"EL RIVAL RECORTA, {0}": "LAWAN MEMPERKECIL, {0}",
		"ENTRA {0}": "IN {0}",
		"SALE {0}": "OUT {0}",
		"EL TÉCNICO RETIRA A {0} · ACTUACIÓN DEFICIENTE": "PELATIH TARIK {0} · PENAMPILAN BURUK",
		"{0} SALE LESIONADO · NO PUEDE CONTINUAR": "{0} KELUAR CEDERA · TAK BISA LANJUT",
		"LESIONADO EN EL {0}'": "CEDERA DI MENIT {0}",
		"{0} PIDE EL CAMBIO": "{0} MINTA GANTI",

		"{0} PIDE EL CAMBIO · NO LE QUEDA NADA": "{0} MINTA GANTI · TENAGA HABIS",
		"{0} PIDE EL CAMBIO · EL BANQUILLO NO LO ENTIENDE":
			"{0} MINTA GANTI · BANGKU TAK PAHAM",

		"{0} PIDE EL CAMBIO AL BANQUILLO": "{0} ISYARAT MINTA GANTI KE BANGKU",
		"EL BANQUILLO TE DICE QUE AGUANTES: YA NO DA TIEMPO":
			"BANGKU SURUH KAMU BERTAHAN: WAKTU TAK CUKUP",

		"PEDIR CAMBIO": "MINTA GANTI",
		"CAMBIO PEDIDO": "GANTI DIMINTA",


		"VAS AL LÍMITE: MEJOR NO FORZAR": "KAMU DI BATAS: JANGAN DIPAKSA",
		"EL TÉCNICO RETIRA A {0} · OVACIÓN DEL ESTADIO":
			"PELATIH TARIK {0} · TEPUK TANGAN STADION",
		"{0} SE VA ENTRE APLAUSOS · EL PARTIDO ESTÁ HECHO":
			"{0} KELUAR DIIRINGI TEPUK TANGAN · LAGA AMAN",
		"EL BANQUILLO PREPARA TU CAMBIO: EL PARTIDO ESTÁ HECHO":
			"BANGKU SIAPKAN PERGANTIANMU: LAGA SUDAH AMAN",



		"EL PARTIDO ESTÁ EN JUEGO: TE VA A DECIR QUE AGUANTES":
			"LAGA MASIH HIDUP: DIA AKAN SURUH KAMU BERTAHAN",
		"YA TE DIJO QUE NO: INSISTIR SALE CARO": "DIA SUDAH BILANG TIDAK: MEMAKSA ITU MAHAL",
		"EL MÍSTER TE DICE QUE AGUANTES: TE NECESITA AHÍ":
			"PELATIH SURUH KAMU BERTAHAN: KAMU DIBUTUHKAN",
		"EL BANQUILLO DICE QUE AGUANTES": "BANGKU SURUH KAMU BERTAHAN",
		"SALIDA GESTIONADA": "KELUAR TERATUR",
		"PEDISTE EL CAMBIO": "KAMU MINTA GANTI",
		"{0} MIN Y {1} % DE ENERGÍA QUE NO GASTASTE":
			"{0} MENIT DAN {1} % ENERGI YANG TAK TERPAKAI",



		"YA NO DA TIEMPO: IBAS A SALIR IGUAL": "WAKTU HABIS: KAMU MEMANG AKAN KELUAR",
		"EL PARTIDO ESTÁ HECHO: TE LO VAN A AGRADECER":
			"LAGA SUDAH AMAN: MEREKA AKAN BERTERIMA KASIH",
		"NO TE QUEDA NADA: EL MÍSTER LO ENTIENDE": "TENAGAMU HABIS: PELATIH PAHAM",
		"QUEDA PARTIDO Y TE QUEDAN PIERNAS: ES UN DESPLANTE":
			"LAGA MASIH PANJANG, KAKI MASIH KUAT: ITU MENGHINA",
		"{0} PIDE EL CAMBIO Y EL BANQUILLO ASIENTE": "{0} MINTA GANTI DAN BANGKU MENGANGGUK",
		"FUERA DEL CAMPO": "KELUAR LAPANGAN",
		"FUERA POR LESION": "KELUAR CEDERA",
		"{0} SALE JUGANDO DE LA PRESIÓN": "{0} LOLOS DARI PRESSING",
		"{0} ROMPE LÍNEAS CON UN GRAN REGATE": "{0} TEMBUS LINI DENGAN DRIBEL HEBAT",
		"{0} PIERDE EL BALÓN EN UN REGATE": "{0} KEHILANGAN BOLA SAAT DRIBEL",
		"DERRIBAN A {0}: FALTA PELIGROSA": "{0} DILANGGAR: FREE KICK BAHAYA",
		"DERRIBAN A {0} EN EL ÁREA: ¡PENAL!": "{0} DIJATUHKAN DI KOTAK: PENALTI!",
		"CARGAN A {0} EN LA SALIDA: FALTA": "{0} DITABRAK SAAT BUILD-UP: FOUL",
		"FRENAN A {0} EN LA SALIDA: FALTA": "{0} DIJEGAL SAAT BUILD-UP: FOUL",
		"CARGAN A {0} POR LA ESPALDA: FALTA": "{0} DITABRAK DARI BELAKANG: FOUL",
		"MODO TIRO": "MODE SHOT",
		"MODO CENTRO": "MODE SILANG",
		"REGATEANDO": "MENDRIBEL",
		"CARGAN A {0} POR LA ESPALDA EN EL ÁREA: ¡PENAL!": "{0} DITABRAK DARI BELAKANG DI KOTAK: PENALTI!",
		"¡ROMPISTE LÍNEAS!": "LINI JEBOL!",
		"¡FALTA! Se cobra aquí mismo": "FOUL! Dieksekusi di sini",
		"¡PENAL! Se cobra en los once metros": "PENALTI! Dieksekusi dari titik penalti",
		"{0} QUIERE COBRAR EL PENAL": "{0} MAU EKSEKUSI PENALTI",
		"SE LO DAS": "SERAHKAN",
		"NO SE LO DAS": "TAHAN",
		"VA POR SU HAT-TRICK": "DIA KEJAR HAT-TRICK",
		"TE QUEDAS EL PENAL Y {0} SE APARTA": "KAMU AMBIL PENALTI, {0} MENYINGKIR",
		"EL PENAL ES TUYO": "PENALTI MILIKMU",
		"SE LO DAS A {0}": "KAMU BERI KE {0}",
		"LE CEDES EL PENAL A {0} PARA SU HAT-TRICK": "KAMU BERI {0} PENALTI DEMI HAT-TRICK-NYA",
		"LE CEDES EL PENAL A {0} Y NO ENTRA": "KAMU BERI {0} PENALTI, DIA GAGAL",
		"EL EQUIPO TE DEJA EL PENAL: HAT-TRICK": "TIM BERI KAMU PENALTI: HAT-TRICK",
		"EL EQUIPO TE DEJA EL PENAL Y LO FALLAS": "TIM BERI KAMU PENALTI, KAMU GAGAL",
		"{0} TE DA EL PENAL": "{0} BERI KAMU PENALTI",
		"EL PENAL ES DE {0}": "PENALTI MILIK {0}",
		"LA FALTA ES DE {0}": "FREE KICK MILIK {0}",
		"SÍ {0} % · NO {1} %": "YA {0}% · TIDAK {1}%",
		"PÍDESELO": "MINTA",
		"DÉJASELO": "BIARKAN",
		"LE PIDES EL BALÓN A {0}": "KAMU MINTA BOLA KE {0}",
		"{0} TE DA LA FALTA": "{0} BERI FREE KICK",
		"{0} SE LO QUEDA": "{0} MENOLAK",
		"{0} SE LA QUEDA": "{0} MENOLAK",
		"LE PIDES EL PENAL A {0} Y SE LO QUEDA": "KAMU MINTA PENALTI KE {0}, DIA MENOLAK",
		"LE PIDES LA FALTA A {0} Y SE LA QUEDA": "KAMU MINTA FREE KICK KE {0}, DIA MENOLAK",
		"{0} TE DEJA EL PENAL Y RESPONDES": "{0} BERI PENALTI, KAMU CETAK",
		"{0} TE DEJA EL PENAL Y NO RESPONDES": "{0} BERI PENALTI, KAMU GAGAL",
		"{0} TE DEJA LA FALTA Y RESPONDES": "{0} BERI FREE KICK, KAMU CETAK",
		"{0} TE DEJA LA FALTA Y NO RESPONDES": "{0} BERI FREE KICK, KAMU GAGAL",
		"¡TANDA DE PENALES!": "ADU PENALTI!",
		"TANDA {0}-{1}": "ADU PEN. {0}-{1}",
		"TANDA {0}-{1} · TIRA TU EQUIPO...": "ADU PEN. {0}-{1} · TIMMU MAJU...",
		"TANDA {0}-{1} · ¡TE TOCA A TI!": "ADU PEN. {0}-{1} · GILIRANMU!",
		"TANDA {0}-{1} · Cobra {2}...": "ADU PEN. {0}-{1} · {2} maju...",
		"¡GOL! Cobras con personalidad.": "GOL! Eksekusi penuh percaya diri.",
		"¡FALLAS TU PENAL!": "PENALTIMU GAGAL!",
		"¡GOL!": "GOL!",
		"¡FALLA TU EQUIPO!": "TIMMU GAGAL!",
		"TANDA {0}-{1} · TIRA EL RIVAL...": "ADU PEN. {0}-{1} · LAWAN MAJU...",
		"GOL DEL RIVAL": "GOL LAWAN",
		"¡LO ATAJA TU PORTERO!": "KIPERMU MENEPIS!",
		"¡AL PALO!": "KENA TIANG!",
		"¡AL TRAVESAÑO!": "KENA MISTAR!",
		"¡LA MANDA POR ENCIMA!": "DI ATAS GAWANG!",
		"¡LA MANDA FUERA!": "MELEBAR!",
		"PENALES {0}-{1}": "PEN {0}-{1}",
		"¡PASAS TÚ! ({0}-{1})": "LOLOS! ({0}-{1})",
		"ELIMINADO EN PENALES ({0}-{1})": "KALAH ADU PENALTI ({0}-{1})",
		"VICTORIA": "MENANG",
		"EMPATE": "SERI",
		"DERROTA": "KALAH",
		"Encarada por la banda": "Duel di sayap",
		"Disparo escorado": "Tembakan sudut sempit",
		"Desde la banda": "Dari sayap",
		"Contra por la banda": "Serangan balik lewat sayap",
		"Falta lateral al área": "Tendangan bebas dari samping kotak",
		"Uno contra uno": "Satu lawan satu",
		"Falta a {0} m": "Tendangan bebas {0} m",









		"Volea al bote": "Voli pantul",
		"Volea bombeada": "Voli melambung",
		"Volea al vuelo": "Voli langsung",
		"Volea rasa": "Voli rendah",
		"balón botando": "bola memantul",
		"llega bombeado": "bola datang melambung",
		"balón al vuelo": "bola melayang",
		"balón rodando": "bola menggelinding",
		"línea adelantada": "garis pertahanan tinggi",
		"bajo presión": "ditekan",
		"con superioridad": "unggul jumlah",
		"Tras el regate": "Setelah dribel",
		"Pared con el pivote": "Satu-dua dengan pivot",
		"Ruptura al espacio": "Lari ke ruang kosong",
		"Cabezazo al segundo palo": "Sundulan tiang jauh",
		"Cabezazo en el primer palo": "Sundulan tiang dekat",
		"Palomita": "Sundulan terbang",
		"El autobús": "Parkir bus",
		"Mano a mano franco": "Satu lawan satu bersih",
		"Falta escorada al palo corto": "Tendangan bebas miring, tiang dekat",
		"Falta sobre la muralla": "Tendangan bebas lewati pagar betis",
		"Falta a la escuadra": "Tendangan bebas ke pojok atas",
		"Saque de banda a la torre": "Lemparan jauh ke si jangkung",
		"RIVAL": "LAWAN",
		"RESULTADOS": "HASIL",
		"DOMINIO": "KENDALI",
		"TU APUESTA": "PILIHANMU",
		"ELLOS": "LAWAN",
		"FORMACIÓN": "FORMASI",
		"FUERZA": "KEKUATAN",
		"SU PELIGRO": "BAHAYANYA",
		"FRESCO": "SEGAR",
		"EN FORMA": "PRIMA",
		"CARGADO": "BERAT",
		"ENERGÍA": "ENERGI",
		"EN VIVO": "LIVE",

		"1T": "B1",
		"2T": "B2",
		"PR": "ET",
		"TOCA PARA AVANZAR  ▸": "KETUK UNTUK MAJU  ▸",
		"ARRASTRA PARA LEER · TOCA PARA AVANZAR  ▸":
			"SERET UNTUK BACA · KETUK UNTUK LANJUT  ▸",





		"▸ VER EL GOL": "▸ LIHAT GOL",
		"▸ GOL": "▸ GOL",
		"¡GOLAZO! {0} LA MANDA A GUARDAR": "GOL INDAH! {0} MENCETAKNYA",
		"GOL EN CONTRA: {0} CASTIGA EL ROBO EN TU ÁREA": "GOL LAWAN: {0} HUKUM REBUTAN DI KOTAKMU",
		"LA REPETICION": "REPLAY",
		"AL POSTE": "KENA TIANG",
		"AL LARGUERO": "KENA MISTAR",


		"REVISION VAR": "CEK VAR",
		"COMPROBANDO EL LARGUERO": "CEK MISTAR",
		"EL PIQUE, BAJO EL LARGUERO": "PANTULAN DI BAWAH MISTAR",
		"TECNOLOGIA DE LINEA DE GOL": "TEKNOLOGI GARIS GOL",
		"COMPROBANDO EL POSTE": "CEK TIANG",
		"EL PIQUE, FUERA DE LA RAYA": "PANTULAN DI LUAR GARIS",
		"NO ES GOL": "GOL BATAL",
		"ARRASTRA PARA GIRAR LA CÁMARA": "SERET UNTUK PUTAR KAMERA",
		"ARCO": "GOL",
		"ORBITA": "ORBIT",
		"TU CAMARA": "KAMERAMU",


		"repeLIBRE": "BEBAS",





		"GUARDADO": "DISIMPAN",
		"Guardado en tus fotos": "Disimpan ke fotomu",
		"Da permiso a Fotos para guardar el video": "Beri izin Foto untuk menyimpan video",
		"No se pudo guardar en tus fotos": "Gagal menyimpan ke fotomu",
		"Este aparato no puede guardar el video": "Perangkat ini tak bisa menyimpan video",
		"No se pudo empezar a grabar": "Gagal mulai merekam",
		"Se cortó la grabación": "Rekaman terhenti",
		"No hay jugada que guardar": "Tak ada aksi untuk disimpan",
		"No hay nada grabado": "Tak ada yang terekam",
		"No se pudo cerrar el video": "Gagal menyelesaikan video",
		"¡Mira mi gol en Football Legacy!": "Lihat golku di Football Legacy!",
		"Compartido": "Dibagikan",
		"No se pudo abrir compartir": "Gagal membuka menu bagikan",
		"ENLACE COPIADO: PEGALO EN TU POST": "TAUTAN DISALIN: TEMPEL DI POSTMU",
		"Listo": "Oke",





		"ORDEN DESDE LA BANDA: TODOS ATRÁS, SE DEFIENDE EL RESULTADO":
			"PERINTAH PELATIH: SEMUA MUNDUR, JAGA HASIL",
		"ORDEN DESDE LA BANDA: EQUILIBRIO, NI ATRÁS NI ARRIBA":
			"PERINTAH PELATIH: SEIMBANG, TAK MUNDUR TAK MAJU",
		"ORDEN DESDE LA BANDA: TODOS ARRIBA, SE VA A POR EL PARTIDO":
			"PERINTAH PELATIH: SEMUA MAJU, KEJAR KEMENANGAN",
		"EL EQUIPO BAJA EL PISTÓN: A ADMINISTRAR PIERNAS":
			"TIM KURANGI TEMPO: HEMAT TENAGA",
		"EL EQUIPO VUELVE A SU RITMO NORMAL": "TIM KEMBALI KE RITME NORMAL",
		"EL EQUIPO SUBE EL PISTÓN: A MORDER CADA BALÓN":
			"TIM NAIKKAN TEMPO: REBUT SETIAP BOLA",
		"PLANTEAMIENTO": "STRATEGI",
		"INTENSIDAD": "INTENSITAS",
		"planDEFENSIVO": "BERTAHAN",
		"planBALANCEADO": "SEIMBANG",
		"planOFENSIVO": "MENYERANG",
		"planBAJA": "LOW",
		"planMEDIA": "MID",
		"planALTA": "HIGH",
		"Aguantas atrás: encajas menos, pero el balón te llega lejos del área.":
			"Kamu bertahan di belakang: kebobolan lebih sedikit, tapi bola datang jauh dari kotak penalti.",
		"El equipo juega parejo.": "Tim bermain seimbang.",
		"Vas al frente: te llega más cerca del arco, pero atrás quedas expuesto.":
			"Kamu maju: bola datang lebih dekat ke gawang, tapi lini belakangmu terbuka.",
		"Dosificas: tocas menos el balón, pero terminas entero.":
			"Kamu atur tenaga: sentuh bola lebih sedikit, tapi tetap segar.",
		"Ritmo normal.": "Tempo normal.",
		"Buscas cada pelota, pero acabas fundido (y más expuesto a la lesión).":
			"Kamu kejar semua bola, tapi akhirnya kehabisan tenaga (dan lebih rawan cedera).",
		"SE ACABO": "SELESAI",
		"HASTA AQUI": "CUKUP",
		"{0} · {1} de {2}": "{0} · {1} dari {2}",
		"EL ULTIMO PITIDO": "PELUIT AKHIR",
		"EL ESTADIO EN PIE": "TRIBUN BERDIRI",
		"AÑO A AÑO": "PER TAHUN",
		"COMO CRECISTE": "PERTUMBUHANMU",
		"LA VITRINA": "LEMARI",
		"¿ERES LEYENDA?": "KAMU LEGENDA?",
		"LA PRENSA": "PERS",
		"LO QUE DEJAS": "PENINGGALAN",
		"GRACIAS {0}": "MAKASIH {0}",
		"GRACIAS": "MAKASIH",
		"Suena el silbato y ya no hay temporada siguiente.":
			"Peluit berbunyi dan tak ada musim berikutnya.",
		"{0} años. El cuerpo pidió la cuenta.":
			"Usia {0} tahun. Tubuh sudah minta berhenti.",
		"Suena el silbato y esta vez lo eliges tú.":
			"Peluit berbunyi, dan kali ini kamu yang memutuskan.",

		"Suena el silbato y esta vez no hay vuelta.":
			"Peluit berbunyi, dan kali ini tak ada jalan kembali.",
		"El cuerpo pidió la cuenta antes de tiempo.":
			"Tubuh minta berhenti sebelum waktunya.",
		"\"EL CUERPO LE PASO LA FACTURA\"": "\"TUBUHNYA MENAGIH HARGA\"",
		"A los {0} años, una lesión decidió por él.":
			"Di usia {0} tahun, cedera yang memutuskan untuknya.",
		"Te vas cuando todavía te quedaba algo dentro.":
			"Kamu pergi saat masih ada yang tersisa di dalam dirimu.",
		"{0} temporadas · {1} partidos": "{0} musim · {1} laga",
		"Las camisetas que vestiste": "Jersey yang pernah kamu pakai",
		"DE PIE": "BERDIRI",
		"El estadio entero, en pie, coreando tu nombre.":
			"Seluruh stadion berdiri, menyanyikan namamu.",
		"Muchos de los que aplauden no vieron tu debut.":
			"Banyak yang bertepuk tangan belum menyaksikan debutmu.",
		"{0} veces internacional con {1}": "{0} kali bela {1}",
		"No hay historial que enseñar.": "Tak ada riwayat untuk ditampilkan.",
		"TOTAL": "TOTAL",
		"LA CARRERA EN CIFRAS": "KARIER DALAM ANGKA",
		"ASIST": "AST",
		"De todo eso, {0} goles y {1} asistencias fueron en la elite (1ª y seleccion):"
		+ " es lo que te compara con las leyendas.":
			"Dari semua itu, {0} gol dan {1} assist terjadi di level elite (kasta tertinggi dan timnas): itulah yang membandingkanmu dengan para legenda.",
		"TEMP · CLUB": "MUSIM · KLUB",
		"TITULOS": "GELAR",
		"T{0} {1}": "M{0} {1}",
		"Una carrera tan corta no dibuja curva.":
			"Karier sesingkat ini tak membentuk kurva.",
		"Lo que valias y lo que sabias, año a año":
			"Nilai dan kemampuanmu, tahun demi tahun",
		"VALOR": "NILAI",
		"curvaMEDIA": "OVR",
		"Valiste más que nunca en la temporada {0}: $ {1}":
			"Nilaimu paling tinggi di musim {0}: $ {1}",
		"Tu mejor media fue {0}, y la de hoy es {1}":
			"OVR terbaikmu {0}, dan hari ini {1}",
		"El mercado dejó de creer en ti {0} temporadas antes de que se te acabara el"
		+ " fútbol.":
			"Bursa berhenti percaya padamu {0} musim sebelum sepak bolamu habis.",
		"LA VITRINA VACIA": "LEMARI KOSONG",
		"No ganaste nada, y aun así jugaste {0} temporadas.":
			"Kamu tak menang apa pun, tapi tetap main {0} musim.",
		"Hay carreras que no caben en una vitrina.":
			"Ada karier yang tak muat di lemari trofi.",
		"{0} de equipo · {1} individuales": "{0} tim · {1} individu",
		"CON TU EQUIPO": "BERSAMA TIM",
		"TUYOS Y DE NADIE MAS": "HANYA MILIKMU",
		"UNO POR UNO": "SATU-SATU",
		"COPA · {0}": "PIALA {0}",
		"MAXIMO GOLEADOR": "TOP SKOR",
		"MAXIMO ASISTENTE": "RAJA ASSIST",
		"PODIO DE LA LIGA": "PODIUM LIGA",
		"MEJOR JUGADOR": "MVP",
		"Tu nombre por delante de {0} leyendas del fútbol":
			"Namamu di atas {0} legenda sepak bola",
		"Los grandes de la historia siguen todos por delante.":
			"Para legenda sejarah semuanya masih di atasmu.",
		"PRODUCCION HISTORICA": "CATATAN SEJARAH",
		"{0} goles y {1} asistencias en la elite":
			"{0} gol dan {1} assist di level elite",
		"Nº{0} de la historia, por delante de {1} leyendas":
			"Peringkat ke-{0} sepanjang sejarah, di atas {1} legenda",
		"Ninguna leyenda del fútbol se queda por detrás de ti.":
			"Tak satu pun legenda sepak bola ada di bawahmu.",
		"Los récords del mundo siguen donde estaban.":
			"Rekor dunia masih di tempatnya.",
		"RECORD DEL MUNDO: {0}": "REKOR DUNIA: {0}",
		"Goles en una carrera": "Gol dalam satu karier",
		"Balones de Oro": "Gelar Pemain Terbaik",
		"Ligas ganadas": "Gelar liga",
		"DONDE TE VAS SIENDO LEYENDA": "TEMPATMU JADI LEGENDA",
		"En ninguna parte, todavía.": "Belum ada di mana pun.",
		"Al top histórico de un club se entra ganando allí, siendo"
		+ " su máximo goleador o su récord de partidos, o con 10 temporadas seguidas; al"
		+ " de una liga, ganando o marcando goles en su primera división; al de tu"
		+ " selección, siendo uno de sus 5 máximos goleadores.":
			"Untuk masuk daftar abadi sebuah klub, kamu harus juara di sana, jadi top skor atau pemegang rekor laga terbanyaknya, atau bermain 10 musim beruntun; untuk daftar liga, juara atau mencetak gol di kasta tertingginya; untuk timnasmu, jadi satu dari 5 top skor sepanjang masa.",
		"leyenda del club": "legenda klub",
		"goleador histórico del club": "top skor sepanjang masa klub",
		"récord de partidos del club": "rekor laga klub",
		"leyenda de la liga": "legenda liga",
		"leyenda de la selección": "legenda timnas",
		"Nº{0}": "#{0}",
		"\"{0} GOLES Y UNA SOLA MANERA DE ENTENDER EL JUEGO\"":
			"\"{0} GOL DAN SATU CARA MEMAHAMI PERMAINAN\"",
		"Se retira uno de los grandes rematadores de su generación.":
			"Salah satu penyelesai terbaik generasinya gantung sepatu.",
		"\"{0} GOLES DESPUES, EL AREA SE QUEDA VACIA\"":
			"\"{0} GOL KEMUDIAN, KOTAK PENALTI KOSONG\"",
		"El delantero deja el fútbol tras {0} temporadas.":
			"Penyerang itu meninggalkan sepak bola setelah {0} musim.",
		"\"NO TODO SE MIDE EN GOLES\"": "\"TAK SEMUA DIUKUR DENGAN GOL\"",
		"{0} goles y {1} asistencias en {2} temporadas de oficio.":
			"{0} gol dan {1} assist dalam {2} musim kerja keras.",
		"\"LA VITRINA QUE DEJA: {0} TITULOS\"": "\"LEMARI TROFINYA: {0} GELAR\"",
		"Pocos futbolistas se han ido con tanto ganado.":
			"Sedikit pemain yang pensiun dengan raihan sebanyak ini.",
		"\"SE VA CON {0} TITULOS Y NINGUNA DEUDA\"":
			"\"PERGI DENGAN {0} GELAR, TANPA UTANG\"",
		"Ganó lo que pudo donde le tocó jugar.":
			"Dia menang sebisanya di mana pun dia dimainkan.",
		"\"EL FUTBOL NO SIEMPRE PAGA LO QUE DEBE\"":
			"\"SEPAK BOLA TAK SELALU MEMBAYAR UTANGNYA\"",
		"Se retira sin títulos, que no es lo mismo que sin carrera.":
			"Dia pensiun tanpa gelar, tapi bukan tanpa karier.",
		"\"VUELVE A CASA PARA SIEMPRE\"": "\"PULANG UNTUK SELAMANYA\"",
		"Se retira en el {0}, donde empezó todo.":
			"Dia pensiun di {0}, tempat semuanya bermula.",
		"\"JUGO HASTA EL ULTIMO DIA QUE LE DEJARON\"":
			"\"MAIN SAMPAI HARI TERAKHIR YANG DIBERIKAN\"",
		"A los {0} años, el calendario decidio por él.":
			"Di usia {0} tahun, kalender yang memutuskan untuknya.",
		"\"ME VOY AHORA QUE TODAVIA SE JUGAR\"": "\"AKU PERGI SELAGI MASIH BISA MAIN\"",
		"Anuncia su retirada a los {0} años, por decision propia.":
			"Dia umumkan pensiun di usia {0} tahun, murni keputusannya sendiri.",
		"Te vas siendo": "Kamu pergi sebagai",



		"{0} retira tu dorsal": "{0} pensiunkan nomormu",
		"{0} temporadas con el mismo número a la espalda.":
			"{0} musim dengan nomor yang sama di punggungmu.",
		"LA CAMISETA QUE SE QUEDA": "JERSEY YANG TINGGAL",
		"{0} temporadas con él": "{0} musim memakainya",
		"Prestigio: {0} puntos": "Prestise: {0} poin",
		"El vestuario se queda vacío, pero el nombre no se borra.":
			"Ruang ganti kosong, tapi namamu tak terhapus.",
		"Ahora ya solo queda mirar lo que hiciste.":
			"Kini tinggal melihat kembali apa yang kamu capai.",
		"ELIGE EL CLUB DONDE ENTRA": "PILIH KLUB TUJUANNYA",
		"ELIGE EL CLUB DESTINO": "PILIH KLUB TUJUAN",
		"También puede ser su propio club, para cambiarlo de asiento.":
			"Bisa juga klubnya sendiri, untuk memindahkannya ke slot lain.",
		"Fichajes, cualidades, caras y escudos a tu gusto.\nSe guarda solo y vale para"
		+ " todas las carreras.":
			"Transfer, atribut, wajah, dan lambang sesukamu.\nTersimpan otomatis dan berlaku di semua karier.",
		"EDITADO": "DIEDIT",
		"ELIGE EL ASIENTO QUE OCUPA": "PILIH SLOT YANG DIISI",
		"Quien tenga ese asiento hoy SALE del juego; el nuevo\nhereda su puesto y su"
		+ " dorsal.":
			"Siapa pun yang memegang slot itu hari ini KELUAR dari game;\npemain baru mewarisi posisi dan nomornya.",
		"ELIGE CON QUIEN SE INTERCAMBIA": "PILIH SIAPA YANG DITUKAR",
		"Los dos jugadores se cambian de club; el puesto y el dorsal\nson del asiento,"
		+ " no viajan.":
			"Kedua pemain bertukar klub; posisi dan nomor\nmilik slot, tidak ikut pindah.",
		"{0} · FUERZA {1}": "{0} · KEKUATAN {1}",
		"SOLO SU POSICION ({0}): {1}": "POSISI SAMA ({0}): {1}",
		"editorSI": "YA",
		"editorNO": "TAK",
		"CREAR JUGADOR": "BUAT PEMAIN",
		"EDITAR CLUB": "EDIT KLUB",
		"IDENTIDAD": "IDENTITAS",
		"AL TOCAR UN CLUB SE ABRE": "KETUK KLUB UNTUK MEMBUKA",
		"Nadie encaja aquí con el filtro puesto. Apágalo para ver el plantel completo.":
			"Tak ada yang cocok dengan filter ini. Matikan untuk melihat seluruh skuad.",
		"— BANCA —": "— BENCH —",


		"LISTA": "LIST",
		"— RESERVA —": "— RESERVE —",
		"QUITAR EDICIONES DEL CLUB": "HAPUS EDITAN KLUB",
		"{0}  · TU PUESTO": "{0}  · SLOTMU",
		"EDAD": "USIA",
		"POSICIÓN": "POSISI",
		"AÑOS": "THN",
		"NACION": "NEGARA",
		"PUESTO": "POS",



		"POR": "GK", "DFC": "CB", "LTI": "LB", "LTD": "RB",
		"MCD": "CDM", "MC": "CM", "MI": "LM", "MD": "RM",
		"DC": "ST", "CAM": "CAM", "MCO": "CAM", "EI": "LW", "ED": "RW",


		"SABE JUGAR DE": "BISA MAIN DI",




		"AL MENOS UN PUESTO: MARCA OTRO ANTES DE QUITAR ESTE.": "MIN. SATU POSISI: CENTANG LAIN DULU SEBELUM LEPAS INI.",
		"EL ARCO ES EXCLUYENTE: UN PORTERO NO JUEGA DE NADA MAS.": "GAWANG EKSKLUSIF: KIPER TAK MAIN DI POSISI LAIN.",
		"MARCA SU PUESTO DE CAMPO: ASI SALE DEL ARCO.": "CENTANG POSISI LAPANGANNYA UNTUK KELUAR DARI GAWANG.",
		"ES EL ULTIMO {0} DEL CLUB: MARCA A OTRO PRIMERO.": "{0} TERAKHIR DI KLUB: CENTANG YANG LAIN DULU.",
		"El primero es su puesto (hoy {0}) y el número es su OVR ahí: quítalo y pasa al siguiente. Hasta {1}, y viajan con la persona.": "Yang pertama adalah posisinya (kini {0}) dan angkanya OVR di situ: lepas dan yang berikutnya menggantikan. Maksimal {1}, dan ikut pindah bersama orangnya.",
		"— TITULARES · {0} —": "— INTI · {0} —",
		"EL ARCO ES EXCLUYENTE: NI ENTRA NI SALE NADIE.": "GAWANG EKSKLUSIF: TAK ADA YANG KELUAR MASUK.",
		"SU PUESTO VA SIEMPRE: NO SE PUEDE QUITAR.": "POSISI ASLINYA SELALU ADA: TAK BISA DILEPAS.",
		"HASTA {0} PUESTOS: QUITA UNO PARA PONER OTRO.": "MAKS {0} POSISI: LEPAS SATU, TAMBAH LAIN.",
		"Su puesto va siempre. Hasta {0}, y viajan con la persona.": "Posisi aslinya selalu ada. Maksimal {0}, dan ikut pindah bersama orangnya.",
		"Mientras juegues aquí, este asiento lo ocupas tú; el jugador editado vale para"
		+ " el resto del mundo.":
			"Selama kamu main di sini, slot ini milikmu; pemain yang diedit berlaku untuk dunia lainnya.",
		"El puesto es del ASIENTO: en un intercambio se queda aquí.":
			"Posisi milik SLOT: saat tukar, tetap di sini.",
		"VELOCIDAD": "KECEPATAN",
		"PEGADA": "POWER",
		"PUNTERIA": "AKURASI",
		"ROSCA": "EFEK",
		"CABEZA": "KEPALA",
		"PENAL": "PEN",
		"BALON PARADO": "BOLA MATI",
		"REFLEJOS": "REFLEKS",
		"REFLEJOS solo cuenta en porteros. Se guarda solo.":
			"REFLEKS hanya berlaku untuk kiper. Tersimpan otomatis.",
		"Cada puesto se mide por sus cualidades. Se guarda solo.":
			"Tiap posisi dinilai dari atributnya sendiri. Tersimpan otomatis.",
		"REFLEJOS solo cuenta en porteros.": "REFLEKS hanya berlaku untuk kiper.",
		"TRASPASAR": "TRANSFER",
		"QUITAR EDICION (VOLVER AL DE BASE)": "HAPUS EDITAN (KEMBALI KE BAWAAN)",
		"ES EL ULTIMO DE SU PUESTO: NO SE PUEDE CAMBIAR.":
			"YANG TERAKHIR DI POSISINYA: TAK BISA DIUBAH.",

		"MIS EDICIONES": "EDITANKU",

		"IMPORTAR DATOS": "IMPOR DATA",
		"Catálogo completo": "Katalog lengkap",
		"EXPORTAR EL MUNDO ENTERO": "EKSPOR SELURUH DUNIA",
		"IMPORTAR: ABRIR ARCHIVOS": "IMPOR: BUKA FILE",
		"IMPORTAR UN ARCHIVO": "IMPOR SATU FILE",
		"Exportar te da un archivo para editarlo en el ordenador; importar lo trae de vuelta. Vale .json o un .zip con la carpeta de escudos dentro.": "Ekspor memberimu file untuk diedit di komputer; impor membawanya kembali. Bisa .json atau .zip berisi folder lambang.",
		"Al terminar se abre COMPARTIR: mándalo a Archivos o a tu ordenador para editarlo y volver a importarlo.": "Setelah selesai, BAGIKAN terbuka: kirim ke File atau ke komputermu untuk diedit lalu diimpor lagi.",
		"Al terminar se abre GUARDAR: déjalo en Descargas y desde ahí pásalo al ordenador o a tu nube para editarlo y volver a importarlo.": "Setelah selesai, SIMPAN terbuka: taruh di Download lalu pindahkan ke komputer atau cloud-mu untuk diedit dan diimpor lagi.",
		"Si el archivo está en Drive, bájalo antes a Descargas.": "Jika file ada di Drive, unduh dulu ke Download.",
		"IMPORTANDO…": "MENGIMPOR…",
		"Guardando el catálogo y los escudos. No cierres el juego.": "Menyimpan katalog dan lambang. Jangan tutup game.",
		"No se pudo guardar el archivo donde elegiste.": "File tak bisa disimpan di tempat yang kamu pilih.",
		"El archivo es tuyo y para tu uso personal: el juego no aloja ni reparte packs.": "File ini milikmu untuk keperluan pribadi: game tidak menyimpan atau membagikan paket.",
		"Lo que importes es tuyo y se queda en tu dispositivo: tú respondes de lo que metas en el archivo.": "Apa pun yang kamu impor jadi milikmu dan tetap di perangkatmu: kamu bertanggung jawab atas isi file.",
		"El .zip no trae ningún archivo .json dentro.": "File .zip tak berisi file .json.",
		"El archivo es demasiado grande: no se importó nada.": "File terlalu besar: tidak ada yang diimpor.",
		"no se pudo abrir el selector": "pemilih file tak bisa dibuka",
		"no se pudo copiar el archivo elegido": "file yang dipilih tak bisa disalin",
		"no se encontró el archivo exportado": "file hasil ekspor tak ditemukan",
		"EXPORTADO A {0}": "DIEKSPOR KE {0}",
		"Queda en la carpeta de Football Legacy como {0}: ábrelo en el ordenador para ajustar tus plantillas y vuelve a importarlo.": "Tersimpan di folder Football Legacy sebagai {0}: buka di komputer untuk menyesuaikan skuadmu lalu impor lagi.",
		"EXPORTAR PLANTILLA": "EKSPOR SKUAD",
		"EXPORTAR": "EKSPOR",
		"NO SE PUDO ESCRIBIR": "GAGAL MENULIS",
		"Saca todos los clubes, plantillas y competiciones tal y como están ahora.": "Mengeluarkan semua klub, skuad, dan kompetisi persis seperti sekarang.",
		"Los escudos no van dentro: esos los pones tú.": "Lambang tidak ikut: itu kamu tambahkan sendiri.",
		"club": "klub",
		"clubes": "klub",
		"jugador": "pemain",
		"jugadores": "pemain",
		"escudo": "lambang",
		"escudos": "lambang",
		"competicion": "kompetisi",
		"competiciones": "kompetisi",
		"club desconocido": "klub tak dikenal",
		"competición desconocida": "kompetisi tak dikenal",
		"marca desconocida": "merek tak dikenal",
		"id vacío": "id kosong",
		"nombre vacío": "nama kosong",
		"marca {0}: {1}": "merek {0}: {1}",
		"marca deportiva {0}: {1}": "merek perlengkapan {0}: {1}",
		"pesa {0} KB (tope {1})": "{0} KB (batas {1})",
		"no es un PNG válido": "bukan PNG valid",
		"no es un SVG válido": "bukan SVG valid",
		"{0}x{1} (tope {2}x{3})": "{0}x{1} (batas {2}x{3})",
		"no se pudo escribir": "tak bisa ditulis",
		"no se encontró el archivo": "file tak ditemukan",
		"no se pudo abrir el archivo": "file tak bisa dibuka",
		"el archivo pesa más de {0} MB": "file lebih dari {0} MB",
		"el archivo no es un JSON válido": "file bukan JSON valid",
		"formato {0}: este juego lee el {1}": "format {0}: game ini membaca {1}",
		"{0} pide {1} asientos y el juego admite de {2} a {3}": "{0} meminta {1} slot dan game menerima {2} sampai {3}",
		"{0} se queda en {1} asientos: el último es su único {2}": "{0} tetap {1} slot: yang terakhir satu-satunya {2}",
		"{0}: el asiento {1} se queda de {2} (el pack lo dejaba sin ninguno)": "{0}: slot {1} tetap sebagai {2} (paket membiarkannya kosong)",
		"no se pudo cruzar {0} con {1} (¿mismo país? ¿misma división?)": "tak bisa menukar {0} dengan {1} (negara sama? divisi sama?)",
		"club desconocido: {0}": "klub tak dikenal: {0}",
		"formación desconocida: {0}": "formasi tak dikenal: {0}",
		"país desconocido: {0}": "negara tak dikenal: {0}",
		"leyenda desconocida: {0}": "legenda tak dikenal: {0}",
		"planta desconocida: {0}": "bentuk stadion tak dikenal: {0}",
		"estadio": "stadion",
		"estadios": "stadion",
		"logo de {0}: {1}": "lambang {0}: {1}",
		"base64 ilegible": "base64 tak terbaca",
		"{0} trae {1} jugadores y hay {2} asientos": "{0} membawa {1} pemain dan ada {2} slot",
		"{0} trae {1} jugadores para {2} asientos: {3} sin cubrir": "{0} membawa {1} pemain untuk {2} slot: {3} belum terisi",
		"{0}: {1} clubes sin jugadores en el pack (se quedan los del juego)": "{0}: {1} klub tanpa pemain di paket (pemain bawaan game tetap)",
		"{0} de {1} jugadores": "{0} dari {1} pemain",
		"{0} sin cubrir": "{0} belum terisi",
		"{0} descartados": "{0} dibuang",
		"IMPORTAR": "IMPOR",

		"EL MUNDO SE MOVIO": "DUNIA BERUBAH",
		"Los clubes llevan {0} en esta carrera. Esos jugadores se quedan con su nombre anterior: el pack no los reescribe.":
			"Klub sudah melakukan {0} di karier ini. Pemain-pemain itu tetap memakai nama lama: paket tidak menimpanya.",
		"fichaje": "transfer",
		"fichajes": "transfer",
		"Puedes devolver el mundo al catálogo que acabas de importar. Se pierden esos fichajes, también los de tu plantilla; tu carrera, tu club y tus estadísticas no se tocan.":
			"Kamu bisa mengembalikan dunia ke katalog yang baru diimpor. Transfer itu hilang, termasuk yang di skuadmu; kariermu, klubmu, dan statistikmu tak tersentuh.",
		"VOLVER AL PACK": "BALIK KE PAKET",
		"DEJARLO ASI": "BIARKAN",
		"QUITAR TODO LO IMPORTADO": "HAPUS SEMUA YANG DIIMPOR",
		"NO SE PUDO LEER": "GAGAL DIBACA",
		"Nombres, plantillas y escudos desde un archivo tuyo. Se puede deshacer entero.":
			"Nama, skuad, dan lambang dari file milikmu. Bisa dibatalkan seluruhnya.",
		"No hay ningún archivo todavía. Toca IMPORTAR, deja tu .json en esa carpeta y vuelve.":
			"Belum ada file. Ketuk IMPOR, taruh file .json di folder itu lalu kembali.",
		"Pisa los nombres y las plantillas que tengas ahora.":
			"Menimpa nama dan skuad yang kamu punya sekarang.",
		"Vale para todas las ranuras y se puede quitar entero.":
			"Berlaku untuk semua slot dan bisa dihapus sekaligus.",
		"Todo lo que has tocado, para llegar de un toque y para poder deshacerlo.":
			"Semua yang pernah kamu ubah, cukup sekali ketuk dan bisa dibatalkan.",





		"CAMBIAR DE DIVISION": "GANTI DIVISI",
		"La división solo se cambia con la temporada recién empezada: el calendario,"
		+ " la tabla y el bombo de copa ya están armados con las de ahora.":
			"Divisi hanya bisa diganti saat musim baru dimulai: jadwal, klasemen, dan undian piala sudah disusun dari divisi yang sekarang.",
		"El calendario se vuelve a sortear: liga, copa y europeas.":
			"Jadwal diundi ulang: liga, piala, dan kompetisi Eropa.",
		"EDITOR DE ESTA CARRERA": "EDITOR KARIER INI",
		"EDITAR MI CARRERA": "EDIT KARIERKU",
		"Retoca el plantel que tienes HOY: con sus fichajes, sus retiros y sus años"
		+ " encima. Sólo cambia esta partida; tu base de datos global no se toca.":
			"Ubah skuad yang kamu punya HARI INI: lengkap dengan transfer, pensiun, dan usianya. Hanya mengubah save ini; database globalmu tak tersentuh.",
		"EDITANDO TU CARRERA · {0} · TEMPORADA {1}":
			"MENGEDIT KARIERMU · {0} · MUSIM {1}",
		"Lo que toques aquí cambia SOLO esta carrera.\nTu base de datos global no se"
		+ " entera.":
			"Apa pun yang kamu ubah di sini hanya mengubah karier INI.\nDatabase globalmu tak tahu apa-apa.",
		"{0} de {1} asientos editados en esta carrera.":
			"{0} dari {1} slot skuad diedit di karier ini.",
		"Todavía no has editado nada en esta carrera.":
			"Kamu belum mengedit apa pun di karier ini.",
		"NO CABE": "PENUH",
		"Esta carrera ya tiene {0} asientos editados, que es el tope.":
			"Karier ini sudah punya {0} slot yang diedit, itulah batasnya.",
		"Esta carrera ya tiene {0} asientos editados, que es el tope. Quita alguno en"
		+ " MIS EDICIONES.":
			"Karier ini sudah punya {0} slot yang diedit, itulah batasnya. Hapus beberapa di EDITANKU.",
		"Todo lo que has tocado EN ESTA CARRERA vuelve a como estaba.":
			"Semua yang kamu ubah DI KARIER INI kembali seperti semula.",
		"La base de datos global no se toca: sigue igual en todas las ranuras.":
			"Database global tak tersentuh: tetap sama di semua slot.",
		"Los fichajes que hiciste aquí NO se deshacen: son parte de la partida.":
			"Transfer yang kamu buat di sini TIDAK dibatalkan: itu bagian dari save.",
		"Todavía no has editado nada.": "Kamu belum mengedit apa pun.",
		"· IDENTIDAD DEL CLUB (NOMBRE, COLORES, ESCUDO)":
			"· IDENTITAS KLUB (NAMA, WARNA, LAMBANG)",
		"VER MÁS ({0})": "LIHAT LAGI ({0})",
		"QUITAR TODO LO EDITADO": "HAPUS SEMUA EDITAN",
		"Las plantillas, los traspasos, las caras y los escudos vuelven a la base de fábrica.":
			"Skuad, transfer, wajah, dan lambang semuanya kembali ke bawaan pabrik.",
		"Vale para todas las ranuras de partida, no solo para esta.":
			"Berlaku untuk semua slot save, bukan hanya yang ini.",
		"Esto SI es para siempre.": "Ini TAK BISA dibatalkan.",
		"Ningún {0} encaja con esa búsqueda. Toca TODOS para ver el resto.":
			"Tak ada {0} yang cocok dengan pencarian itu. Ketuk SEMUA untuk melihat sisanya.",
		"SUBIR O BAJAR TODO EL CLUB": "NAIKKAN ATAU TURUNKAN KLUB",
		"AJUSTAR EL CLUB": "ATUR KLUB",
		"Suma o resta a TODAS las cualidades de los 23 asientos.":
			"Menambah atau mengurangi SEMUA atribut dari 23 slot.",
		"Nada baja de {0} ni pasa de {1}. Se deshace entero con QUITAR EDICIONES DEL CLUB.":
			"Tak ada yang turun di bawah {0} atau lewat dari {1}. Batalkan semua dengan HAPUS EDITAN KLUB.",
		"DUPLICAR": "GANDAKAN",
		"No es para siempre: QUITAR EDICION devuelve al de antes.":
			"Tidak selamanya: HAPUS EDITAN mengembalikan yang lama.",
		"JUGADOR NUEVO": "PEMAIN BARU",
		"El puesto y el dorsal los da el asiento\nque elijas al final.":
			"Posisi dan nomor ditentukan oleh slot\nyang kamu pilih di akhir.",
		"NOMBRE DEL JUGADOR": "NAMA PEMAIN",
		"ELEGIR ASIENTO": "PILIH SLOT",
		"JUGADOR NUEVO: {0}": "PEMAIN BARU: {0}",
		"TRASPASO: {0} ({1} · {2})": "TRANSFER: {0} ({1} · {2})",
		"CANCELAR ALTA": "BATAL TAMBAH",
		"CANCELAR TRASPASO": "BATAL TRANSFER",
		"CONFIRMAR ALTA": "TAMBAHKAN",
		"{0} entra en {1}.": "{0} masuk ke {1}.",
		"SE VA SOLO (SIN CAMBIO)":
			"PERGI TANPA TUKAR",
		"INTERCAMBIO CON OTRO JUGADOR":
			"TUKAR DENGAN PEMAIN LAIN",
		"Los dos jugadores cambian de club.":
			"Kedua pemain berganti klub.",
		"TRASPASO HECHO: {0} FICHA POR {1}.":
			"TRANSFER BERES: {0} TEKEN DI {1}.",
		"Nadie vuelve a cambio: su club se queda con un jugador menos.":
			"Tak ada yang kembali sebagai gantinya: klubnya kurang satu pemain.",
		"Al tocar un club se ficha ahí mismo: no eliges asiento.":
			"Ketuk klub dan dia langsung direkrut di sana: tak perlu pilih slot.",
		"Nadie vuelve a cambio y nadie deja su asiento.":
			"Tak ada yang kembali sebagai gantinya dan tak ada yang kehilangan slot.",
		"{0} se queda con {1} jugadores y {2} pasa a {3}.":
			"{0} tersisa {1} pemain dan {2} naik menjadi {3}.",
		"Sigue jugando en su puesto, con un dorsal libre del club nuevo.":
			"Dia tetap main di posisinya, dengan nomor kosong di klub baru.",
		"NO SE PUDO":
			"GAGAL",
		"Ya juega en ese club.":
			"Dia sudah main di klub itu.",
		"Un club no puede bajar de {0} jugadores.":
			"Klub tak boleh kurang dari {0} pemain.",
		"Un club no puede pasar de {0} jugadores.":
			"Klub tak boleh lebih dari {0} pemain.",
		"{0} se quedaría sin ningún {1}.":
			"{0} tak akan punya {1} sama sekali.",
		"Ese traspaso no se puede hacer.":
			"Transfer itu tak bisa dilakukan.",
		"{0} deja su asiento y SALE del juego.":
			"{0} meninggalkan slotnya dan KELUAR dari game.",
		"El nuevo jugará de {0} con el dorsal {1}.":
			"Pemain baru main sebagai {0} dengan nomor {1}.",
		"CREAR": "BUAT",
		"ALTA HECHA: {0} ENTRA POR {1}.": "PEMAIN MASUK: {0} GANTIKAN {1}.",
		"{0} ficha por {1}.": "{0} teken kontrak di {1}.",
		"{0} se marcha a {1}.": "{0} pindah ke {1}.",
		"OJO: {0} pasa a jugar de {1} y {2} de {3}.":
			"CATAT: {0} kini main sebagai {1} dan {2} sebagai {3}.",
		"CONFIRMAR TRASPASO": "TERIMA TRANSFER",
		"CONFIRMAR": "OKE",
		"TRASPASO HECHO: {0} LLEGA POR {1}.": "TRANSFER SELESAI: {0} SEHARGA {1}.",
		"QUITAR EDICIONES": "HAPUS SEMUA EDIT",
		"Todo el {0} vuelve a su plantilla de base.":
			"Seluruh {0} kembali ke skuad bawaan.",
		"Los traspasos hechos con este club también se deshacen aquí.":
			"Transfer yang dibuat dengan klub ini juga dibatalkan di sini.",
		"QUITAR TODO": "HAPUS SEMUA",


		"FISICO": "LOOK",
		"FISICO (PIEL, PELO, BARBA)": "LOOK (KULIT, RAMBUT, JENGGOT)",
		"La cara viaja con la persona: si la traspasas, se la lleva. Se guarda solo.":
			"Wajah ikut orangnya: kalau dia kamu transfer, wajahnya ikut pindah. Tersimpan otomatis.",
		"QUITAR FISICO (VOLVER AL DE FABRICA)": "HAPUS LOOK (KEMBALI KE BAWAAN)",


		"Nace con esta cara. El alta no se confirma hasta elegir asiento.":
			"Lahir dengan wajah ini. Perekrutan baru final setelah kamu pilih slot.",

		"NOMBRE": "NAMA",
		"SIGLAS (VAN EN EL ESCUDO)": "INISIAL (DI LOGO)",
		"UNIFORME": "KIT",
		"UNIFORME · {0}": "KIT · {0}",
		"Playera": "Jersey",
		"Shorts": "Celana",
		"Acento del patrón": "Aksen pola",
		"PATRON": "POLA",
		"LOCAL": "HOME",
		"VISITA": "AWAY",
		"ALTERNA": "KETIGA",
		"El acento solo se ve si la playera lleva patrón.":
			"Aksen hanya tampak kalau jersey punya pola.",
		"PECHO DE LA PLAYERA": "DADA JERSEY",
		"PATROCINADOR": "SPONSOR",
		"MARCA DEPORTIVA": "MEREK KIT",
		"Estas son las marcas del juego: importa un pack de logos para usar las tuyas. El club estrena lo que elijas en esta misma temporada, y desde ahí los contratos siguen rotando solos cada pocas temporadas.":
			"Ini merek bawaan game: impor paket logo untuk memakai merekmu. Klub memakai pilihanmu mulai musim ini juga, dan sesudahnya kontrak berganti sendiri tiap beberapa musim.",
		"Las marcas salen de tu pack. El club estrena lo que elijas en esta misma"
		+ " temporada, y desde ahí los contratos siguen rotando solos cada pocas"
		+ " temporadas.":
			"Merek diambil dari paketmu. Klub memakai pilihanmu mulai musim ini juga, dan sesudahnya kontrak berganti sendiri tiap beberapa musim.",


		"tintaAUTO": "AUTO",
		"TINTA DEL PECHO · {0}": "TINTA DADA · {0}",
		"Color del patrocinador": "Warna sponsor",
		"Color de la marca deportiva": "Warna merek kit",
		"Con AUTO el juego elige el color que mejor se lee sobre esta playera. El color que fijes vale solo para este uniforme.":
			"Dengan AUTO, game memilih warna yang paling jelas di jersey ini. Warna yang kamu tetapkan hanya berlaku untuk kit ini.",
		"Este uniforme se genera solo cada temporada. El club lo estrena tal cual"
		+ " en la temporada en que lo elijas, y a partir de ahí sigue cambiando de"
		+ " color y dibujo cada año.":
			"Kit ini dibuat baru tiap musim. Klub memakainya persis seperti pilihanmu di musim kamu memilih, lalu warna dan polanya berganti tiap tahun.",
		"ESCUDO": "LOGO",


		"escudoFORMA": "MODEL",
		"FONDO": "LATAR",
		"TINTA": "TINTA",
		"EMBLEMA": "EMBLEM",
		"BORDE": "TEPI",
		"La fuerza y el país no se tocan aquí: son la estructura de la liga.":
			"Kekuatan dan negara tidak diubah di sini: itu struktur liga.",



		"Se INTERCAMBIA con un club de otra división del mismo país: uno sube y el"
		+ " otro baja, y cada liga sigue con los mismos equipos.":
			"DITUKAR dengan klub dari divisi lain di negara yang sama: satu naik, satu turun, dan tiap liga tetap berisi tim yang sama.",
		"ELIGE EL CLUB CON EL QUE SE CAMBIA": "PILIH KLUB UNTUK DITUKAR",
		"Los dos se cruzan: uno sube y el otro baja.\nTiene que ser de otra división"
		+ " del mismo país.":
			"Keduanya bertukar: satu naik, satu turun.\nHarus dari divisi lain di negara yang sama.",
		"CAMBIO DE DIVISION: {0} ({1})": "TUKAR DIVISI: {0} ({1})",
		"CANCELAR CAMBIO": "BATAL TUKAR",
		"CONFIRMAR CAMBIO DE DIVISION": "KONFIRMASI TUKAR DIVISI",
		"{0} pasa a {1}.": "{0} pindah ke {1}.",
		"Se cruzan los dos, así que cada división sigue con los mismos equipos.":
			"Keduanya bertukar, jadi tiap divisi tetap berisi jumlah tim yang sama.",
		"Su plantel y su fuerza no cambian.": "Skuad dan kekuatannya tidak berubah.",
		"Las carreras ya empezadas siguen con la división que tengan.":
			"Karier yang sudah berjalan tetap di divisi masing-masing.",
		"CAMBIO HECHO: {0} A {1}.": "DITUKAR: {0} KE {1}.",

		"ELIGE SU EQUIPO NUEVO": "PILIH KLUB BARUNYA",
		"Se cruza con el técnico de ese club: cada uno se sienta en el banquillo del otro.":
			"Dia bertukar dengan pelatih klub itu: masing-masing duduk di bangku yang lain.",
		"CAMBIO DE EQUIPO: {0} ({1})": "GANTI KLUB: {0} ({1})",
		"— TÉCNICOS —": "— PELATIH —",
		"SU CARA": "WAJAH",
		"CAMBIAR DE EQUIPO": "GANTI KLUB",
		"DEJARLO LIBRE": "BEBASKAN",
		"{0} SE QUEDA SIN EQUIPO. EN SU BANQUILLO SE SIENTA {1}.":
			"{0} TANPA KLUB. {1} AMBIL ALIH BANGKU.",
		"Se va al mercado de técnicos y puede volver.":
			"Dia masuk bursa pelatih dan bisa kembali.",
		"DEVOLVER A SU CLUB": "KEMBALIKAN KE KLUB",
		"{0} VUELVE A {1}.": "{0} BALIK KE {1}.",
		"QUITAR EDICIÓN DEL TÉCNICO": "HAPUS EDIT PELATIH",

		"— SELECCIONES —": "— TIMNAS —",
		"Las selecciones vuelven a su uniforme y su convocatoria de fábrica.":
			"Timnas kembali ke kit dan daftar panggilan bawaan.",
		"El uniforme y la convocatoria de cada selección valen para todas tus partidas.":
			"Kit dan daftar panggilan tiap timnas berlaku untuk semua kariermu.",
		"BUSCAR SELECCION": "CARI TIMNAS",
		"Ninguna selección se llama así.": "Tidak ada timnas dengan nama itu.",
		"EDITADO: {0}": "DIEDIT: {0}",
		"AUTOMATICA": "OTOMATIS",
		"ELEGIR CONVOCADOS": "PILIH SKUAD",
		"Este uniforme se genera solo cada temporada. La selección lo estrena tal cual en la temporada en que lo elijas, y a partir de ahí sigue cambiando de color y dibujo cada año.":
			"Kit ini dibuat baru tiap musim. Timnas memakainya persis seperti pilihanmu di musim kamu memilih, lalu warna dan desainnya berganti tiap tahun.",
		"La bandera, el nombre y la fuerza de un país no se tocan aquí.":
			"Bendera, nama, dan kekuatan sebuah negara tidak diubah di sini.",
		"QUITAR EDICION DEL UNIFORME": "HAPUS EDIT KIT",
		"{0} vuelve a sus uniformes de fábrica.": "{0} kembali ke kit bawaan.",
		"Su convocatoria no se toca.": "Daftar panggilannya tidak diubah.",
		"FIJAR: va siempre. VETAR: no va nunca. El resto de la lista la arma el juego con los mejores del país.":
			"KUNCI: selalu masuk. BLOK: tak pernah masuk. Sisanya diisi game dengan yang terbaik di negara itu.",
		"CONVOCADOS · {0}": "DIPANGGIL · {0}",
		"A LAS PUERTAS": "HAMPIR MASUK",
		"VER {0} MAS": "+{0} LAGI",
		"FUERA DE LA LISTA": "DI LUAR DAFTAR",
		"VETADO": "DIBLOK",
		"QUITAR VETO": "BUKA BLOK",
		"FIJADO, PERO YA NO ESTA EN EL PAIS": "KUNCI, TAPI SUDAH BUKAN WARGANYA",
		"FIJADO, SIN SITIO": "KUNCI, TAK MUAT",
		"SOLTAR": "LEPAS",
		"QUITAR FIJADOS Y VETOS": "HAPUS KUNCI & BLOK",
		"{0} vuelve a convocar solo a sus mejores.": "{0} kembali memanggil hanya yang terbaik.",
		"Su uniforme no se toca.": "Kitnya tidak diubah.",
		"FIJADO": "KUNCI",
		"FIJAR": "KUNCI",
		"VETAR": "BLOK",

		"— LEYENDAS —": "— LEGENDA —",
		"Los grandes de la historia no juegan en ningún club: su cara se toca aquí.":
			"Para legenda sepanjang masa tidak main di klub mana pun: wajah mereka diubah di sini.",
		"Sale con esta cara donde aparezca: al conocerla, en la gala y en la cancha. Se guarda sola.":
			"Wajah ini muncul di mana pun dia tampil: saat kamu bertemu dia, di gala, dan di lapangan. Tersimpan otomatis.",
		"QUITAR CARA (VOLVER A LA SUYA)": "HAPUS WAJAH (KEMBALI KE ASLI)",
		"La cara viaja con él: si cambia de banquillo, se la lleva. Se guarda sola.":
			"Wajah ikut dia: kalau pindah bangku, wajahnya ikut. Tersimpan otomatis.",
		"Fija en todas tus carreras. Sus resultados la suben o la bajan.":
			"Tetap sama di semua kariermu. Hasilnya menaikkan atau menurunkan bintangnya.",
		"Sin tocar, se sortea en cada carrera alrededor de esto.":
			"Kalau tak diubah, diundi di tiap karier di sekitar nilai ini.",
		"Sus resultados la suben o la bajan hasta estrella y media.":
			"Hasilnya bisa menaikkan atau menurunkannya hingga satu setengah bintang.",
		"El cambio de equipo vale para las carreras nuevas.": "Ganti klub berlaku untuk karier baru.",
		"El cambio de equipo vale desde hoy en esta carrera.":
			"Ganti klub berlaku mulai hari ini di karier ini.",
		"CONFIRMAR CAMBIO DE EQUIPO": "KONFIRMASI GANTI KLUB",
		"{0} pasa a entrenar al {1}.": "{0} kini melatih {1}.",
		"Cada uno se lleva su habilidad, su cara y sus trofeos.":
			"Masing-masing membawa skill, wajah, dan trofinya.",
		"Las carreras ya empezadas siguen con sus banquillos.":
			"Karier yang sudah berjalan tetap dengan bangku pelatih masing-masing.",
		"Tu relación con tu técnico no cambia.": "Hubunganmu dengan pelatihmu tidak berubah.",
		"CAMBIO HECHO: {0} ENTRENA AL {1}.": "GANTI SELESAI: {0} MELATIH {1}.",
		"· DIVISION CAMBIADA ({0})": "· DIVISI BERUBAH ({0})",
		"La división tampoco: se deshace intercambiando otra vez.":
			"Divisi juga tak ikut kembali: batalkan dengan tukar lagi.",
		"QUITAR EDICION DEL CLUB": "HAPUS EDIT KLUB",
		"{0} vuelve a su nombre, uniforme y escudo de fábrica.":
			"{0} kembali ke nama, kit, dan logo bawaan.",
		"Su plantel no se toca.": "Skuadnya tidak diubah.",


		"LISO": "POLOS",
		"RAYAS": "GARIS",
		"AROS": "HOOP",
		"MITADES": "BELAH",
		"MANGAS": "LENGAN",
		"RAYA FINA": "PINSTRIPE",
		"BANDA": "SASH",
		"DIAGONAL": "DIAGONAL",
		"CUADROS": "KOTAK",
		"FRANJA VERTICAL": "GARIS TENGAH",
		"FRANJA PECHO": "GARIS DADA",
		"REDONDO": "BULAT",
		"SCUDETTO": "SCUDETTO",
		"HEXAGONO": "HEKSAGON",
		"BANDERIN": "BENDERA",
		"ROMBO": "WAJIK",
		"ESTANDARTE": "SPANDUK",
		"TRAPECIO": "TRAPEZ",
		"FRANCES": "PRANCIS",
		"PICA": "SEKOP",
		"CUADRADO": "PERSEGI",
		"PALO": "PALE",
		"FAJA": "FESS",
		"CUARTELES": "KUARTER",
		"CHEVRON": "CHEVRON",
		"JEFE": "ATAS",
		"PIE": "BASE",
		"ORLA": "PINGGIR",
		"PUNTA": "PILE",
		"ROMBOS": "LOZENGE",
		"TRICOLOR": "TRIWARNA",
		"SEGUNDO COLOR": "WARNA KEDUA",
		"OSCURO": "GELAP",
		"CLARO": "MUDA",
		"NADA": "NOL",
		"LETRAS": "HURUF",
		"ESTRELLA": "BINTANG",
		"DOS ESTRELLAS": "DUA BINTANG",
		"ARO": "RING",
		"BALON": "BOLA",
		"AGUILA": "ELANG",
		"TORO": "SAPI",
		"CORONA": "TIARA",
		"RAYO": "BOLT",
		"LUNA": "BULAN",
		"TORRE": "MENARA",
		"ANCLA": "SAUH",
		"ENGRANE": "GEAR",
		"HOJA": "DAUN",
		"ORO": "EMAS",
		"BLANCO": "PUTIH",
		"NEGRO": "HITAM",
		"TEMPORADA {0}": "MUSIM {0}",
		"FIN DE TEMPORADA": "AKHIR MUSIM",
		"TU AÑO": "TAHUNMU",
		"PROGRESION": "PROGRES",
		"EL MUNDO": "DUNIA",
		"LO QUE VIENE": "SELANJUTNYA",
		"LA DESPEDIDA": "PERPISAHAN",
		"IR AL MERCADO": "KE BURSA",
		"Objetivo del club: {0}": "Target klub: {0}",
		"CUMPLIDO": "TERCAPAI",
		"NO CUMPLIDO": "GAGAL",
		"temporadaMEDIA": "RATING",
		"{0} vs. el año pasado": "{0} vs. tahun lalu",
		"TUS HABILIDADES": "SKILLMU",
		"TU SITIO EN EL MUNDO": "PERINGKATMU DI DUNIA",
		"TU CARRERA HASTA HOY": "KARIERMU SEJAUH INI",
		"Tu mejor partido: {0}": "Laga terbaikmu: {0}",
		"HITOS DE CARRERA": "TONGGAK KARIER",
		"{0} partidos como profesional": "{0} laga profesional",
		"{0} goles de carrera": "{0} gol sepanjang karier",
		"{0} asistencias de carrera": "{0} assist sepanjang karier",
		"{0} partidos disputados": "{0} laga dimainkan",
		"{0} goles marcados": "{0} gol dicetak",
		"{0} asistencias repartidas": "{0} assist diberikan",
		"TÚ Y TUS COMPAÑEROS": "KAMU & REKAN SETIM",
		"TU MEJOR PARTIDO": "LAGA TERBAIKMU",
		"OBJETIVO DEL CLUB": "TARGET KLUB",
		"vs {0}": "vs {0}",
		"vs. el año pasado": "vs. tahun lalu",
		"EL CLUB Y TÚ": "KLUB & KAMU",
		"EL CLUB CUENTA CONTIGO": "KLUB ANDALKAN KAMU",
		"EL CLUB ESPERA MÁS DE TI": "KLUB MENUNTUT LEBIH",
		"EL CLUB TE BUSCARÁ MINUTOS FUERA": "KLUB CARIKAN MENIT DI KLUB LAIN",
		"EL CLUB TE PONE EN EL ESCAPARATE": "KLUB MENJUALMU",
		"TU MEDIA AÑO A AÑO": "OVR-MU TIAP TAHUN",
		"Valor de mercado": "Nilai pasar",
		"Dinero": "Uang",
		"SIN TÍTULOS": "TANPA GELAR",
		"Este año no levantaste nada. Se vuelve a empezar.":
			"Tahun ini kamu tak mengangkat apa pun. Mulai lagi dari awal.",
		"En color, lo que levantaste; apagado, lo que se escapó.": "Berwarna: yang kamu angkat; redup: yang lepas.",
		"LO QUE GANASTE": "RAIHANMU",
		"GOLEO DE LA LIGA": "TOP SKOR LIGA",
		"CÓMO ACABÓ TU LIGA": "KLASEMEN LIGAMU",
		"Acabaste {0} de {1}.": "Kamu finis peringkat {0} dari {1}.",
		"SIN NOVEDAD": "SEPI",
		"El mundo siguió su curso sin sobresaltos.": "Dunia berjalan tenang tanpa kejutan.",
		"LO QUE SE LLEVARON OTROS": "RAIHAN PIHAK LAIN",

		"EN EL MUNDO": "DI DUNIA",
		"FICHAJE DEL AÑO": "TRANSFER TOP",
		"Suben de categoría: {0}": "Promosi: {0}",
		"{0} pts": "{0} poin",
		"Y HASTA AQUI": "SAMPAI SINI",
		"NO HAY TEMPORADA SIGUIENTE.": "TAK ADA MUSIM BERIKUTNYA.",
		"Se acabó el futbol jugado. Lo que viene ahora es la despedida, y despues lo"
		+ " que dejaste.":
			"Masa mainmu sudah selesai. Berikutnya perpisahan, lalu apa yang kamu tinggalkan.",


		"{0} temporadas": "{0} musim",
		"Hiciste {0} goles el año pasado": "Kamu cetak {0} gol tahun lalu",
		"Diste {0} asistencias el año pasado": "Kamu beri {0} assist tahun lalu",
		"Jugaste {0} partidos el año pasado": "Kamu main {0} laga tahun lalu",
		"PRIMA": "BONUS",
		"EL AÑO EN DINERO": "UANG TAHUN INI",
		"GANASTE ESTE AÑO": "KAMU DAPAT",
		"Primas por títulos": "Bonus gelar",
		"Prima de objetivo": "Bonus target",
		"Prima por el año del club": "Bonus musim klub",
		"Royalties de camiseta": "Royalti jersey",
		"Premio del patrocinador": "Hadiah sponsor",

		"TU SELECCIÓN": "TIMNASMU",
		"TU CUERPO": "TUBUHMU",
		"EL RESTO DEL AÑO": "SISA TAHUN INI",
		"TU SITUACIÓN": "STATUSMU",
		"ERES AGENTE LIBRE: tu contrato terminó.": "KAMU PEMAIN BEBAS: kontrakmu habis.",
		"Ningún club es dueño de tu pase. Elige destino en el mercado: fichas sin"
		+ " traspaso y con prima.":
			"Tak ada klub yang memilikimu. Pilih tujuan di bursa: kamu teken tanpa biaya transfer dan dapat bonus.",
		"Contrato: ÚLTIMO AÑO": "Kontrak: TAHUN TERAKHIR",
		"Contrato: {0} temporadas por delante": "Kontrak: sisa {0} musim",
		"Renueva o escucha ofertas: si acabas el año sin firmar, te vas gratis.":
			"Perpanjang atau dengarkan tawaran: kalau tahun berakhir tanpa tanda tangan, kamu pergi gratis.",
		"LO QUE TE PIDEN AHORA": "TARGET BARUMU",
		"QUIÉN TE QUIERE": "PEMINATMU",
		"TE QUIERE YA": "MAU SEKARANG",
		"MUY INTERESADO": "SANGAT MINAT",
		"Y {0} clubes más preguntaron por ti.": "Dan {0} klub lagi menanyakanmu.",
		"ÚLTIMA JUGADA": "AKSI TERAKHIR",
		"GOLEADOR": "PENCETAK",
		"ASISTENCIA": "ASSIST",
		"hudFINAL": "USAI",
		"CALIFICACIÓN": "RATING",
		"EXPERIENCIA": "XP",
		"¡NIVEL {0}!  +{1} puntos": "LEVEL {0}!  +{1} poin",
		"¡NIVEL {0}!": "LEVEL {0}!",

		"RECUPERADAS": "REBUT BOLA",



		"Recuperadas": "Rebut bola",
		"OCASIONES": "PELUANG",
		"PASES": "UMPAN",
		"{0} CLAVE": "{0} KUNCI",
		"HAT-TRICK": "HAT-TRICK",
		"HÉROE DEL DERBI": "PAHLAWAN DERBY",
		"PARTIDAZO": "BINTANG",
		"REPARTIDOR": "PLAYMAKER",
		"DOBLETE": "DUA GOL",
		"GOL Y ASISTENCIA": "GOL & ASSIST",
		"GRAN PARTIDO": "LAGA HEBAT",
		"LOS 90 MINUTOS": "90 MENIT PENUH",
		"UNIFORMES PARECIDOS · EL RIVAL SALE DE VISITA":
			"KIT MIRIP · LAWAN PAKAI KIT AWAY",
		"JUGAR": "MAIN",
		"SALTAR AL CAMPO": "MASUK LAPANGAN",
		"SUPLENTE": "CADANGAN",
		"CANSADO": "LELAH",
		"JORNADA {0}": "PEKAN {0}",
		"Uniforme titular": "Kit kandang",
		"Uniforme visitante": "Kit tandang",
		"Tercer uniforme": "Kit ketiga",
		"Uniforme conmemorativo": "Kit peringatan",
		"uniformeLOCAL": "HOME",
		"uniformeVISITA": "AWAY",
		"uniformeALTERNA": "KETIGA",
		"El balón debe estar al menos a {0} m de la línea de gol.":
			"Bola harus berjarak minimal {0} m dari garis gawang.",
		"El balón está demasiado cerca del arco (mínimo {0} m).":
			"Bola terlalu dekat gawang (minimal {0} m).",
		"Con el balón tan abierto la cámara cae tras la tribuna (máx {0} m).":
			"Dengan bola sejauh ini ke sisi, kamera jatuh di belakang tribun (maks {0} m).",
		"Hay un jugador fuera del campo.": "Ada pemain di luar lapangan.",
		"Un balón en movimiento tan lento nunca sale de la pantalla de tiro.":
			"Bola bergerak selambat ini tak pernah keluar dari layar tembakan.",
		"Tipo de jugada desconocido.": "Jenis aksi tidak dikenal.",
		"Un jugador de la barrera no está a los 9.15 m.":
			"Satu pemain tembok tidak berada di jarak 9.15 m.",
		"{0} {1} CERCA de la jugada quedan fuera del encuadre.":
			"{0} {1} DEKAT aksi berada di luar bingkai.",
		"{0} {1} tapan tu carril de tiro.": "{0} {1} menutup jalur tembakanmu.",
		"{0} {1} pegados al balón o a tu carrera.":
			"{0} {1} menempel di bola atau jalur larimu.",
		"{0} {1} de jugadores encimados.": "{0} {1} pemain bertumpuk.",
		"{0} {1} en fuera de juego: el pase se pitará.":
			"{0} {1} offside: umpan akan kena offside.",
		"Un centro sin rematadores no tiene a quién buscar.":
			"Umpan silang tanpa penyerang tidak punya sasaran.",
		"TUS MARCAS": "REKORMU",
		"TORNEOS DE EUROPA": "PIALA-PIALA EROPA",

		"BALONES DE ORO": "PEMAIN TERBAIK",
		"LIGAS": "LIGA",
		"RÉCORD / TÚ": "REKOR / KAMU",
		"RÉCORD / {0}": "REKOR / {0}",
		"EN ACTIVO": "MASIH MAIN",
		"a los {0}": "di usia {0}",

		"TUS VÍCTIMAS": "KORBANMU",
		"G+A": "G+A",
		"G+A/PJ": "G+A/MN",
		"{0} RIVALES": "{0} LAWAN",
		"Todavía no le has hecho daño a nadie.": "Kamu belum melukai siapa pun.",
		"Aún no hay historia que contar: sal a jugar.":
			"Belum ada cerita: ayo main.",
		"Mejor temporada goleadora": "Musim gol terbaik",
		"Más asistencias en un año": "Assist terbanyak dalam setahun",
		"Mejor media (10+ partidos)": "Rating terbaik (10+ laga)",
		"Valor pico: $ {0} a los {1} años": "Nilai puncak: $ {0} di usia {1}",
		"Mayor presentación: {0} personas ({1}, T{2})":
			"Presentasi terbesar: {0} orang ({1}, M{2})",
		"{0}: {1} (T{2}, {3})": "{0}: {1} (M{2}, {3})",
		"RÉCORDS DE LA LIGA · {0}": "REKOR LIGA · {0}",
		"EL REGISTRO DE {0}": "REKOR KLUB {0}",
		"RÉCORDS DEL MUNDO": "REKOR DUNIA",
		"★ {0}: {1} — RÉCORD TUYO": "★ {0}: {1} — REKORMU",
		"{0}: {1} — TU RÉCORD (T{2})": "{0}: {1} — REKORMU (M{2})",
		"Antes: {0} ({1}), con {2}": "Sebelumnya: {0} ({1}), bersama {2}",
		"Tu mejor: {0}": "Terbaikmu: {0}",
		"Goles en una temporada": "Gol dalam satu musim",
		"Asistencias en una temporada": "Assist dalam satu musim",
		"Mejor media en una temporada": "Rating terbaik dalam satu musim",
		"Goles en una temporada con el club": "Gol dalam satu musim untuk klub",
		"Goles con el club": "Gol untuk klub",
		"SUPERAS A": "LAMPAUI",
		"LEYENDA Nº{0}": "LEGENDA #{0}",
		"Partidos jugados en la liga": "Penampilan di liga",
		"Partidos jugados con el club": "Penampilan untuk klub",
		"Goles en una edición de Champions": "Gol dalam satu edisi Piala Elite",
		"Asistencias en una edición de Champions": "Assist dalam satu edisi Piala Elite",
		"Mejor media en una edición de Champions": "Rating terbaik dalam satu edisi Piala Elite",
		"Goles en una edición de Europa League": "Gol dalam satu edisi Piala Europa",
		"Asistencias en una edición de Europa League": "Assist dalam satu edisi Piala Europa",
		"Mejor media en una edición de Europa League": "Rating terbaik dalam satu edisi Piala Europa",
		"Goles en una edición de Conference": "Gol dalam satu edisi Piala Challenge",
		"Asistencias en una edición de Conference": "Assist dalam satu edisi Piala Challenge",
		"Mejor media en una edición de Conference": "Rating terbaik dalam satu edisi Piala Challenge",
		"Goles con la selección": "Gol untuk timnas",
		"LA SELECCIÓN · {0}": "TIMNAS · {0}",
		"Reescrito {0} veces: {1}": "Ditulis ulang {0} kali: {1}",
		"{0} reescribió el libro: {1} ({2})": "{0} menulis ulang buku rekor: {1} ({2})",
		"RÉCORD": "REKOR",



		"SUPERAS A UNA LEYENDA": "KAMU LAMPAUI LEGENDA",
		"SUPERADA": "TERSALIP",
		"TE ADELANTÓ": "MENYALIPMU",
		"Tu palmarés sólo cuenta lo ganado en 1ª división y el Mundial: es la vara con la que se mide a los grandes.":
			"Palmaresmu hanya menghitung yang diraih di kasta tertinggi dan Kejuaraan Dunia: itulah patokan untuk mengukur para legenda.",
		"Superar a tu primera leyenda de la historia (sólo cuenta lo hecho en 1ª división o con la selección).":
			"Lampaui legenda pertamamu dalam sejarah (hanya capaian di kasta tertinggi atau timnas yang dihitung).",
		"SUPERADO EN TÍTULOS": "TERSALIP DI GELAR",
		"SUPERADO EN GOLES + ASISTENCIAS": "TERSALIP DI GOL + ASSIST",
		"TUS TÍTULOS (1ª Y SELECCIÓN)": "GELARMU (KASTA 1 & TIMNAS)",
		"TUS GOLES + ASISTENCIAS DE ÉLITE": "GOL + ASSIST ELITMU",
		"la tuya": "milikmu",
		"por delante": "masih di depan",
		"SEGUIR": "LANJUT",
		"lo tenía": "milik",
		"su marca": "rekornya",
		"desde": "sejak",
		"Tu nombre entra en los libros. Ese registro ya es tuyo.":
			"Namamu masuk buku rekor. Rekor itu sekarang milikmu.",
		"{0}: {1}. El registro era de {2} ({3}).":
			"{0}: {1}. Rekor itu dulu milik {2} ({3}).",
		"{0} · {1} JUGADORES": "{0} · {1} PEMAIN",
		"CAPITÁN": "KAPTEN",
		"PENALES": "PENALTI",
		"EL GLOBAL ES TUYO: AL RIVAL NO LE SIRVE ESTE MARCADOR": "UNGGUL AGREGAT: SKOR INI TAK CUKUP BAGI LAWAN",
		"{0} SE VUELCA ARRIBA: LE FALTAN {1} PARA PASAR": "{0} MENYERANG HABIS: BUTUH {1} LAGI UNTUK LOLOS",
		"EL RIVAL DEJA MEDIO EQUIPO EN TU CAMPO, ATRÁS HAY PRADERA": "SETENGAH TIM LAWAN DI AREAMU, BELAKANGNYA KOSONG",
		"GLOBAL EMPATADO: ESTO HUELE A PRÓRROGA": "AGREGAT SERI: MENUJU BABAK TAMBAHAN",
		"TE FALTAN {0} EN EL GLOBAL, HAY QUE IR A POR ELLOS": "KURANG {0} DI AGREGAT, KEJAR SEKARANG",
		"TU EQUIPO SE VUELCA Y DEJA LA ESPALDA VENDIDA": "TIMMU MENYERANG HABIS, PERTAHANAN TERBUKA LEBAR",
		"GLOBAL {0}-{1}": "AGR {0}-{1}",
		"PASA {0}": "{0} LOLOS",
		"FALTAS / CÓRNERS": "FK / KORNER",
		"Sin plantel: aún no tienes club.": "Tanpa skuad: kamu belum punya klub.",
		"SUELDO": "GAJI",
		"NOTA": "RTG",
		"Capitán": "Kapten",
		"Lanza los penales": "Penendang penalti",
		"Lanza faltas y córners": "Penendang tendangan bebas dan korner",
		"Aún no hay convocatoria que mostrar.": "Belum ada daftar panggilan untuk ditampilkan.",
		"CONVOCATORIA": "PANGGILAN",


		"— banca —": "— cadangan —",
		"— corte de la convocatoria —": "— batas panggilan —",

		"No tienes avisos todavía.": "Belum ada pemberitahuan.",
		"{0} · NUEVO": "{0} · BARU",
		"T{0} · día {1}": "M{0} · hari {1}",
		"buzonPREMIO": "HADIAH",
		"buzonCLUB Y SELECCION": "KLUB & TIMNAS",
		"buzonMARCA Y NIVEL": "MEREK & LEVEL",
		"buzonLESION": "CEDERA",
		"buzonAVISO": "INFO",
		"COMÚN": "UMUM",
		"RARO": "RARE",
		"ÉPICO": "EPIK",
		"LEGENDARIO": "LEGENDARIS",
		"ADIÓS A LAS CANCHAS": "PELUIT AKHIR",
		"{0} TEMPORADAS · SE RETIRA A LOS {1}": "{0} MUSIM · PENSIUN DI USIA {1}",
		"JUGO HASTA EL FINAL": "MAIN SAMPAI AKHIR",
		"SE FUE CUANDO QUISO": "PERGI SAAT DIA MAU",

		"EL CUERPO DIJO BASTA": "TUBUH MENYERAH",
		"TU LEGADO": "LEGACYMU",
		"por rango": "per peringkat",
		"Club: {0} partidos  ({1}V · {2}E · {3}D)":
			"Klub: {0} laga  ({1}M · {2}S · {3}K)",
		"Goles: {0}   Asistencias: {1}   Media: {2}":
			"Gol: {0}   Assist: {1}   Rating: {2}",
		"{0}: {1} partidos · {2} goles · {3} asistencias":
			"{0}: {1} laga · {2} gol · {3} assist",
		"TOTAL: {0} partidos · {1} goles · {2} asistencias":
			"TOTAL: {0} laga · {1} gol · {2} assist",
		"{0} títulos de equipo · {1} premios individuales":
			"{0} gelar tim · {1} penghargaan individu",
		"TUS CLUBES": "KLUBMU",
		"EMPEZAR OTRA CARRERA": "MULAI KARIER LAIN",
		"ENTRAR AL MUSEO": "MASUK MUSEUM",
		"TE QUIEREN DE VUELTA": "MINTA KAMU KEMBALI",
		"JUGASTE AQUÍ": "KLUB LAMAMU",
		"Ya jugaste aquí, y no te han olvidado.": "Kamu pernah main di sini, dan mereka belum melupakanmu.",
		"Su {0} tiene {1}. Tú vuelves con {2}.": "{0} mereka: {1}. Kamu kembali dengan {2}.",
		"¿FIRMAS?": "TEKEN?",
		"{0} · {1} por temporada, {2} años.": "{0} · {1} per musim, {2} tahun.",
		"Vuelves como agente libre y sin traspaso. Es la única vuelta que tiene esta carrera: si la firmas, el retiro que viene después ya es el definitivo.": "Kamu kembali sebagai pemain bebas, tanpa biaya transfer. Ini satu-satunya comeback karier ini: kalau kamu teken, pensiun berikutnya adalah yang terakhir.",
		"FIRMAR Y VOLVER": "TEKEN & KEMBALI",
		"¿VOLVER A JUGAR?": "MAIN LAGI?",
		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos. Volverías con 10 puntos menos en todas tus habilidades.": "Mendengar tawaran memakan satu tahun: dunia jalan terus tanpamu dan kamu bertambah tua tanpa bermain. Kamu kembali dengan 10 poin lebih rendah di semua skill.",
		"VER QUIÉN ME QUIERE": "LIHAT PEMINAT",


		"¿SALIR DEL RETIRO?": "BATAL PENSIUN?",
		"Escuchar ofertas cuesta un año, y vuelves con 10 menos en todo.": "Mendengar tawaran memakan satu tahun, dan kamu kembali dengan 10 poin lebih rendah di semua.",
		"SÍ, VUELVO": "YA, KEMBALI",
		"YA PAGASTE EL AÑO": "TAHUN SUDAH LUNAS",
		"CUESTA UN AÑO · 10 MENOS EN TODO": "BIAYA 1 TAHUN · -10 DI SEMUA",
		"¿CON QUIÉN VUELVES?": "PILIH KLUBMU",
		"VOLVER AL MUSEO": "KEMBALI KE MUSEUM",


		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos.": "Mendengar tawaran memakan satu tahun: dunia jalan terus tanpamu dan kamu bertambah tua tanpa bermain.",
		"LO QUE CUESTA": "BIAYANYA",
		"HABILIDADES": "SKILL",
		"VUELVES": "KEMBALI",
		"EL ÚLTIMO VISTAZO": "TATAPAN TERAKHIR",
		"años": "tahun",
		"tu OVR": "OVR-mu",
		"Ni una copa detrás del cristal. Por eso vuelves.": "Tak satu piala pun di balik kaca. Itu sebabnya kamu kembali.",
		"Todo eso ya lo ganaste. Y aun así te vas a poner las botas otra vez.": "Semua itu sudah kamu menangkan. Tapi kamu tetap mau memakai sepatu bola lagi.",
		"Se está bien aquí dentro. Pero aquí dentro ya no pasa nada.": "Enak di dalam sini. Tapi di dalam sini tak ada lagi yang terjadi.",
		"EL AÑO QUE TE PERDISTE": "TAHUN YANG HILANG",
		"La liga la ganó {0}.": "Liga dimenangkan {0}.",
		"No llamó nadie. El teléfono de un retirado de tu edad suena poco, y ese silencio también es una respuesta.": "Tak ada yang menelepon. Telepon pemain pensiunan seusiamu jarang berdering, dan keheningan itu juga sebuah jawaban.",
		"MUSEO": "MUSEUM",
		"SALIR DEL MUSEO": "KELUAR MUSEUM",
		"NO QUEDAN RANURAS": "SLOT PENUH",
		"Todas las ranuras tienen carrera. Cuelga esta placa en el SALÓN DE LA FAMA o borra una desde AJUSTES para empezar otra.": "Semua slot sudah berisi karier. Gantung plakat ini di HALL OF FAME atau hapus satu dari SETELAN untuk memulai yang lain.",
		"ELEGIR CARRERA": "PILIH KARIER",
		"Tres carreras, cada una con su propia partida.":
			"Tiga karier, masing-masing dengan save sendiri.",
		"RETIRADO · {0} PARTIDOS · {1} GOLES": "PENSIUN · {0} LAGA · {1} GOL",
		"RETIRADO · {0} PARTIDOS": "PENSIUN · {0} LAGA",
		"MANTÉN PULSADO PARA BORRAR": "TAHAN UNTUK HAPUS",
		"TEMPORADA {0} · {1} AÑOS · {2} PJ": "MUSIM {0} · {1} THN · {2} MN",
		"¿BORRAR ESTA CARRERA?": "HAPUS KARIER INI?",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.\nLas otras dos"
		+ " no se tocan.":
			"Karier {0} hilang: level, uang, kontrak, dan palmares.\nDua yang lain tidak terpengaruh.",
		"TU JUGADOR": "PEMAINMU",
		"TU CLUB · SE CAMBIA EN EL MERCADO": "KLUBMU · GANTI DI BURSA",
		"Se guarda solo.": "Tersimpan otomatis.",
		"GUARDAR": "SIMPAN",

		"¡Peina {0}!": "Sundulan terusan {0}!",
		"¡La peina!": "Sundulan terusan!",
		"¡Cambio de banda!": "Alihkan serangan!",
		"Te quedaste con la salida corta": "Kamu memilih umpan pendek",
		"El pase no llegó": "Umpannya kurang jauh",
		"¡Saliste jugando!": "Kamu berhasil keluar dari tekanan!",
		"Te encerraron": "Kamu terkurung",
		"Toca a tu jugador para empezar": "Ketuk pemainmu untuk mulai",
		"Te frenaron con falta": "Kamu dihentikan dengan pelanggaran",
		"¡El perro cortó la jugada!": "Anjing itu memotong aksi!",

		"El rival se repliega": "Lawan mundur",
		"Falta en tu campo: se reanuda": "Pelanggaran di wilayahmu: laga dilanjutkan",

		"SAL JUGANDO": "BANGUN SERANGAN",

		"¡DE PRIMERA! PASE DE {0}": "SEKALI SENTUH! UMPAN {0}",
		"¡DE PRIMERA! TE LA PONEN": "SEKALI SENTUH! UMPAN DATANG",
		"¡CABEZAZO! TE LA CUELGAN": "SUNDULAN! SILANG DATANG",
		"¡CABEZAZO! CENTRO DE {0}": "SUNDULAN! SILANG {0}",
		"¡VOLEA! TE LA CUELGAN": "VOLI! SILANG DATANG",
		"¡VOLEA! CENTRO DE {0}": "VOLI! SILANG {0}",
		"¡CHILENA! TE LA CUELGAN": "SALTO! SILANG DATANG",
		"¡CHILENA! CENTRO DE {0}": "TENDANGAN SALTO! SILANG {0}",
		"¡CÓRNER! TE LA CUELGAN": "KORNER! SILANG DATANG",
		"¡CÓRNER! LO SACA {0}": "KORNER! {0} MENGAMBILNYA",
		"¡FALTA! TE LA CUELGAN": "FREE KICK! SILANG DATANG",
		"¡FALTA! LA CUELGA {0}": "FREE KICK! {0} KIRIM BOLA",

		"Salida de meta": "Tendangan gawang",
		"Sacas de meta con tu portero: juégala en corto o revienta el pase largo. Luego juegas con quien la recibe.": "Kamu melakukan tendangan gawang dengan kipermu: mainkan pendek atau tendang umpan panjang. Lalu kamu main sebagai siapa pun yang menerimanya.",
		"Apunta a un compañero y suelta": "Bidik rekan setim lalu lepas",
		"SALIDA DE META": "GOAL KICK",
		"Te cortaron el pase": "Umpanmu terpotong",
		"PASE CORTADO": "UMPAN PUTUS",

		"Salida jugada": "Build-up",
		"Naces en tu campo con el balón. Conduce, pásala y avanza: cada pase lo golpeas tú y juegas con quien la recibe.": "Kamu mulai di area sendiri dengan bola. Giring, umpan, dan maju: tiap umpan kamu tendang sendiri dan kamu main sebagai penerimanya.",
		"Arrastra para conducir; apunta a un compañero y suelta": "Seret untuk menggiring; bidik rekan setim lalu lepas",
		"Saque de banda corto": "Lemparan pendek",
		"Saque de banda al área": "Lemparan ke kotak penalti",
		"Te la sacan de banda al área. No se controla: espera a que llegue y cabecea a puerta.": "Bola dilempar ke kotak penalti. Tak bisa kamu kontrol: tunggu bola datang lalu sundul ke gawang.",
		"Espera el saque; luego jala y suelta": "Tunggu lemparan; lalu tarik dan lepas",
		"Un compañero te la saca de banda: la controlas solo y juegas libre. Regatea, tira o devuélvesela.": "Rekan setim melempar ke dalam: bola terkontrol otomatis dan kamu main bebas. Dribel, tembak, atau kembalikan.",
		"¡SAQUE DE BANDA!": "LEMPARAN!",
		"¡{0} SACA DE BANDA!": "{0} MELEMPAR!",
		"Naces en tu campo con el balón y el arco lejos. Conduce, pásala a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "Kamu mulai di area sendiri dengan bola dan gawang jauh. Giring, umpan ke rekan setim, dan terus maju: umpan ditendang seperti tembakan dan kamu main sebagai penerimanya. Kalau kamu diam di belakang tanpa maju, lawan menekan lebih keras. Lalu, satu lawan satu: langsung tembak, atau giring bola dan kembali ke lingkaran untuk berhenti mendadak dan membidik dengan tenang.",
		"Primero sal jugando desde tu campo: conduce, pasa y llega hasta el arco. Después, el mano a mano: 1 gol en 3 intentos.": "Pertama, bangun serangan dari area sendiri: giring, umpan, dan sampai ke gawang. Lalu, satu lawan satu: 1 gol dalam 3 percobaan.",
		"Pásala a un compañero y avanza hacia el arco.": "Umpan ke rekan setim dan maju ke gawang.",
		"PASA Y AVANZA": "UMPAN & MAJU",
		"ATAJADA": "SAVE",
		"DESPEJE": "SAPUAN",
		"FUERA DE JUEGO": "OFFSIDE",
		"BALÓN PERDIDO": "BOLA HILANG",


		"TE RESBALASTE": "TERPELESET",
		"SIN CONTACTO": "MELESET",
		"CAMBIO DE BANDA": "ALIH SAYAP",
		"PASE FALLADO": "UMPAN GAGAL",
		"SALIDA LIMPIA": "KELUAR BERSIH",
		"TOCA PARA SALIR": "KETUK: KELUAR",
		"ENCERRADO": "TERKUNCI",
		"FALTA AL SALIR": "DIFOUL SAAT KELUAR",
		"LA COBRA OTRO": "REKAN EKSEKUSI",
		"¡PRÓRROGA! Dos tiempos de 15 minutos.": "PERPANJANGAN WAKTU! Dua babak 15 menit.",
		"Fin del primer tiempo extra.": "Babak pertama perpanjangan usai.",
		"¡TE TOCA A TI!": "GILIRANMU!",
		"Cobra tu compañero…": "Rekan setim bersiap mengeksekusi...",
		"Cobra el rival…": "Lawan bersiap mengeksekusi...",
		"Cobra {0}…": "{0} bersiap mengeksekusi...",
		"Arrastra hacia atrás para correr · lleva el balón a la zona roja":
			"Seret ke belakang untuk lari · bawa bola ke zona merah",
		"Arrastra hacia atrás para correr · cruza al campo rival":
			"Seret ke belakang untuk lari · masuk ke area lawan",
		"CAMPO RIVAL · TIRA O PASA": "AREA LAWAN · TEMBAK/UMPAN",
		"CAMPO RIVAL · TIRA": "AREA LAWAN: TEMBAK",


		"LLEVA EL BALON AL DISCO ROJO": "BAWA BOLA KE TITIK MERAH",




		"AL DISCO ROJO": "KE TITIK MERAH",
		"RASA Y LENTA": "RENDAH PELAN",
		"SUBE Y CAE": "NAIK LALU JATUH",
		"COMBA": "CURVE",
		"EL CENTRO PEGA MAS FUERTE": "TENGAH PALING KENCANG",
		"DENTRO TIRAS / FUERA REGATEAS": "DI DALAM TEMBAK / DI LUAR DRIBEL",
		"IZQUIERDO CONDUCE / DERECHO TIRA": "KIRI GIRING / KANAN TEMBAK",
		"PASALA": "UMPAN",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: un toque en el pasto, fuera de tu círculo y sin nadie debajo, gira la vista a la banda y te enseña a los compañeros; otro toque y vuelve.":
			"Tidak ada tombol umpan: mengumpan itu MENEMBAK ke arah rekan setim, dan bola jadi milik yang tiba duluan. Kamu punya dua: satu di luar kotak, satu di dalam. Kalau umpanmu jatuh di luar kotak, kamu main sebagai penerimanya. Kalau di dalam, tak ada kontrol: dia langsung menembak. Untuk melihat mereka: satu ketukan di rumput, di luar lingkaranmu dan tanpa orang di bawahnya, memutar pandangan ke sisi lapangan dan menampilkan rekan setimmu; ketuk lagi untuk kembali.",
		"Un pase de práctica. Después, 1 gol en 3 pases al área.": "Satu umpan latihan. Lalu, 1 gol dari 3 umpan ke kotak.",
		"El primero no puntúa. En los otros, cuantos menos intentos gastes, más estrellas.": "Yang pertama tak dihitung. Di sisanya, makin sedikit percobaan terpakai, makin banyak bintang.",
		"Apunta a un compañero y suelta.": "Bidik rekan setim lalu lepas.",
		"FUERA LO JUEGAS TU / DENTRO REMATA": "DI LUAR KAMU MAIN / DI DALAM DIA TEMBAK",
		"SE ACABO EL REGATE": "DRIBEL SELESAI",
		"Ahora aprendes a TIRAR": "Sekarang belajar MENEMBAK",
		"LO TIENES": "BERHASIL",
		"NO SUPERASTE LA PRUEBA": "LATIHAN GAGAL",
		"OTRA VEZ": "SEKALI LAGI",
		"Aquí no se avanza hasta que te sale. Tómate el tiempo que necesites.": "Di sini kamu tak lanjut sebelum berhasil. Ambil waktu sebanyak yang kamu butuhkan.",
		"Eso es la escuela: cada ejercicio te enseña un gesto y te paga en estrellas. Quedan unos pocos, y sacan mejores ofertas de club.": "Itulah sekolahnya: tiap latihan mengajarkan satu gerakan dan membayarmu dengan bintang. Tinggal beberapa lagi, dan hasilnya menarik tawaran klub yang lebih baik.",
		"PARA EN SECO Y APUNTA": "BERHENTI & BIDIK",
		"BUSCA LA OTRA BANDA": "CARI SISI SEBERANG",
		"Todo se decide en tu círculo: con el dedo DENTRO apuntas y tiras, y en cuanto lo sacas conduces. Es el mismo arrastre sin levantar el dedo: mira la palabra del círculo, que dice TIRO o REGATE según dónde estés. Volver a entrar te para en seco y te devuelve la puntería. Jala hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltar, toca el balón — y dónde lo tocas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro. Con dos dedos giras la vista y apuntas desde otro ángulo.":
			"Semua ditentukan di lingkaranmu: dengan jari DI DALAM kamu membidik dan menembak, begitu jari keluar kamu menggiring. Itu seret yang sama tanpa mengangkat jari: lihat kata di lingkaran, tertulis TEMBAK atau DRIBEL sesuai posisimu. Masuk lagi menghentikanmu mendadak dan mengembalikan bidikanmu. Tarik ke belakang seperti ketapel: panduan mengarah ke depan. Saat dilepas, sentuh bola, dan tempat kamu menyentuhnya menentukan. Pertama kali bola dibagi per zona: atas keluar rendah dan pelan, bawah naik lalu jatuh, sisi melengkung. Makin ke tepi, makin lemah tenaganya: tembakan keras ada di tengah. Dengan dua jari kamu memutar pandangan dan membidik dari sudut lain.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "Ini UMPAN SILANG: bola dilambungkan ke kotak penalti. Pada tendangan sudut, bola sudah mulai dalam mode SILANG; indikator di kanan atas menunjukkannya. Untuk pindah antara SILANG (lambung) dan TEMBAK (mendatar), ketuk dengan jari lain saat membidik, atau ketuk indikator itu. Cari kepala rekan setim, bukan gawang. Dan terakhir, alih sayap: umpan yang sama tapi mencari rekan yang bebas di sisi seberang.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve el cambio de banda.": "Cetak 1 gol dalam 6 percobaan: 3 tendangan sudut dan 3 umpan silang. Dan lakukan alih sayap.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. El cambio de banda es ensayo y no puntúa.": "Gol bisa terjadi di salah satu dari enam. Makin cepat, makin banyak bintang. Alih sayap itu latihan dan tak dihitung.",
		"METE DOS GOLES": "CETAK DUA GOL",
		"CRUZA Y ENCARA": "SILANG & TANTANG",
		"CUELGALA AL AREA": "LAMBUNG KE KOTAK",
		"SALVA LA BARRERA": "LEWATI PAGAR",
		"REGATEA HASTA EL MEDIO CAMPO": "DRIBEL KE GARIS TENGAH",


		"Salir de atrás": "Keluar dari belakang",
		"Encerrado en tu banda": "Terjepit di sayap",
		"Atrapado en el medio": "Terjebak di tengah",
		"Contra el bloque": "Lawan blok rapat",
		"Te salta el delantero": "Penyerang menekanmu",
		"Desde tu área": "Dari kotak sendiri",
		"ZONA {0} DE {1}": "ZONA {0}/{1}",
		"Busca al compañero de la otra banda · dentro del círculo pasas":
			"Cari rekan setim di sisi seberang · di dalam lingkaran kamu mengumpan",
		"El video salió con un tamaño raro": "Ukuran videonya aneh",
		"Tu gol más lejano del año: {0} m.": "Gol terjauhmu tahun ini: {0} m.",
		"Tu pase más largo del año: {0} m.": "Umpan terpanjangmu tahun ini: {0} m.",
		"BUSCAR CLUB O JUGADOR": "CARI KLUB / PEMAIN",
		"Escribe al menos dos letras para buscar.": "Ketik minimal dua huruf untuk mencari.",
		"Nada encaja con esa búsqueda.": "Tak ada yang cocok dengan pencarian itu.",
		"{0} · {1} DE {2} — AFINA LA BUSQUEDA": "{0} · {1} DARI {2} — PERSEMPIT CARI",
		"PAIS": "NEGARA",
		"SI": "YA",
		"PIDE ALIENTO": "MINTA SORAK",
		"A LO TUYO": "FOKUS",
		"RUGE {0} % · PITA {1} %": "SORAK {0}% · EJEK {1}%",
		"LA GRADA RUGE": "SORAK SORAI",
		"PIDES ALIENTO Y LA GRADA RUGE": "MINTA DUKUNGAN: TRIBUN BERSORAK",
		"PIDES ALIENTO Y LA GRADA TE PITA": "MINTA DUKUNGAN: MALAH DISORAKI",
		"¡{0}, {0}!": "{0}! {0}!",
		"¡{0}, TRAIDOR!": "{0}, PENGKHIANAT!",
		"La entrada": "Tekel",
		"Toca cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "Ketuk saat penanda melewati putih: kamu tekel dan merebut bola dengan bersih. Di merah kamu melanggar; di kuning, kamu dapat kartu.",
		"Toca en el blanco para barrerte": "Ketuk di putih untuk tekel",
		"¡BALÓN LIMPIO!": "TEKEL BERSIH!",
		"¡AMARILLA!": "KARTU KUNING!",
		"¡SE TE VA!": "LOLOS!",
		"La barrera tapa el camino raso: elévalo por encima pegándole al balón abajo. El costado lo curva, si te atreves. Y el examen final: el penal. Respira. Tú eliges la esquina.": "Tembok menutup jalur mendatar: angkat bola melewatinya dengan menendang bagian bawah bola. Sisi bola membuatnya melengkung, kalau kamu berani. Dan ujian terakhir: penalti. Tarik napas. Kamu yang memilih sudutnya.",
		"WASD CONDUCE / FLECHAS TIRAN": "WASD GIRING / PANAH TEMBAK",
		"Pulsa WASD y corres hacia el disco.": "Tekan WASD dan kamu berlari ke cakram.",
		"Pulsa WASD y conduces.": "Tekan WASD dan kamu menggiring.",
		"Mantén una flecha y apuntas.": "Tahan satu panah dan kamu membidik.",
		"Pulsa WASD y conduces: cruza la raya.": "Tekan WASD dan kamu menggiring: lewati garis.",
		"Pulsa WASD y avanza hacia el arco.": "Tekan WASD dan maju ke gawang.",
		"Mantén una flecha y pásala a un compañero.": "Tahan satu panah dan umpan ke rekan.",
		"Mantén una flecha y suelta para pegarle a la falta.": "Tahan satu panah dan lepas untuk menendang tendangan bebas.",
		"Pulsa WASD para empezar": "Tekan WASD untuk mulai",
		"WASD para correr · cruza al campo rival": "WASD untuk lari · masuk ke area lawan",
		"WASD para correr · lleva el balón a la zona roja": "WASD untuk lari · bawa bola ke zona merah",
		"Pulsa {0} en el blanco para barrerte": "Tekan {0} di putih untuk tekel",
		"PULSA WASD PARA SALIR": "WASD: KELUAR",
		"Pulsa {0} cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "Tekan {0} saat penanda melewati bagian putih: kamu menekel dan merebut bola dengan bersih. Di merah itu pelanggaran; di kuning, kamu kena kartu.",
		"VOLVIO, Y SE FUE POR LA PUERTA DE ATRAS": "KEMBALI, PERGI LEWAT PINTU BELAKANG",
		"LA VUELTA": "KEMBALI",
		"Bota de Oro de Europa": "Sepatu Emas Eropa",
		"BOTA DE ORO DE EUROPA": "SEPATU EMAS EROPA",
		"Máximo Asistente del Mundial": "Raja Assist Kejuaraan Dunia",
		"Máximo Asistente de la Copa continental": "Raja Assist Piala Benua",
		"Asist. (Mundial)": "Ast. (Kejuaraan Dunia)",
		"Asist. (Continental)": "Ast. (Benua)",
		"ASISTENTE DEL MUNDIAL": "ASSIST KEJUARAAN DUNIA",
		"Once Ideal de la Liga": "Susunan Terbaik Liga",
		"Once Ideal": "Susunan Terbaik",
		"Bota de Oro (Europa)": "Sepatu Emas (Eropa)",
		"Prometiste un gol, y lo metiste.": "Kamu menjanjikan gol, dan kamu mencetaknya.",
		"Prometiste un gol. Hoy no llegó.": "Kamu menjanjikan gol. Hari ini tidak datang.",
		"Cumpliste tu promesa de gol ante el {0}": "Kamu menepati janji golmu melawan {0}",
		"Prometiste un gol ante el {0} y no llegó": "Kamu menjanjikan gol melawan {0} dan tidak terwujud",
		"{0} cumplió su promesa de gol ante el {1}": "{0} menepati janji golnya melawan {1}",
		"{0} prometió un gol ante el {1} y no llegó": "{0} menjanjikan gol melawan {1} dan tidak terwujud",
		"DIBUJO DEL SHORT": "MOTIF CELANA",
		"Acento del short": "Aksen celana",
		"DIBUJO DE LAS MEDIAS": "MOTIF KAUS KAKI",
		"Acento de las medias": "Aksen kaus kaki",
		"Cuello polo": "Kerah polo",
		"Fin de manga": "Ujung lengan",
		"FILO": "LIS",
		"DOBLE FILO": "LIS GANDA",
		"RIBETE": "KELIM",
		"FILO Y RIBETE": "LIS + KELIM",
		"PANEL": "PANEL",
		"ABERTURA": "BELAHAN",
		"VUELTA FINA": "LIS ATAS TIPIS",
		"DOBLE VUELTA": "LIS ATAS GANDA",
		"DOS RAYAS": "DUA GARIS",
		"RAYA ALTA": "GARIS ATAS",
		"BANDA ANCHA": "PITA LEBAR",
		"AROS ANCHOS": "LINGKAR LEBAR",
		"VUELTA DE COLOR": "LIS ATAS WARNA",
		"FRANJA": "STRIP",
		"DOS FRANJAS": "DUA STRIP",
		"SHORT, MEDIAS Y CUELLO": "CELANA, KAOS KAKI DAN KERAH",
		"PICA CUANDO SE CIERRE": "KETUK SAAT MENUTUP",
		"¡CAÑO!": "NUTMEG",
		"SE LO OLIÓ": "TERBACA",
		"YA ESTÁ EN SU HUECO": "DI TEMPATNYA",
		"EN TU VITRINA": "DI LEMARIMU",
		"TODAVÍA SE HABLA DEL CAÑO DE {0} A {1}": "MASIH RAMAI SOAL KOLONG {0} KE {1}",
		"{1} YA NO SE LE ACERCA TANTO A {0} TRAS EL CAÑO": "{1} TAK BERANI DEKAT {0} LAGI SETELAH DIKOLONG",
		"LA GRADA PIDE OTRO CAÑO DE {0}": "PENONTON MINTA KOLONG LAGI DARI {0}",
		"{1} LE LEYÓ EL CAÑO A {0} Y NO SE LO PERDONA": "{1} MEMBACA KOLONG {0} DAN TERUS MENGEJEKNYA",
		"{0} QUISO EL CAÑO Y LA GRADA AÚN SILBA": "{0} COBA MENGOLONG, PENONTON MASIH BERSIUL",
		"PRESENTACIÓN DEL TÍTULO": "PRESENTASI GELAR",
		"ANTE TU AFICIÓN": "DI DEPAN SUPORTERMU",
		"JUEGOS DE VERANO": "PESTA MUSIM PANAS",
		"Campeón de Verano": "Juara Musim Panas",
		"Oro de Verano": "Emas Musim Panas",
		"Ganar el oro en los Juegos de Verano.": "Meraih emas di Pesta Musim Panas.",
		"JUEGOS DE VERANO: oro para {0}": "PESTA MUSIM PANAS: emas untuk {0}",
		"{0}: ORO en los Juegos de Verano": "{0}: EMAS di Pesta Musim Panas",
		"{0}: plata en los Juegos de Verano": "{0}: perak di Pesta Musim Panas",
		"{0}: bronce en los Juegos de Verano": "{0}: perunggu di Pesta Musim Panas",
		"El juego no trae nombres, escudos ni marcas reales. Importa sólo lo que tengas derecho a usar: es responsabilidad tuya.": "Game ini tidak menyertakan nama, lambang, atau merek asli. Impor hanya yang berhak kamu gunakan: itu tanggung jawabmu.",
		"¡El recogepelotas hace tiempo!": "Pemungut bola ulur waktu!",
		"¡BALÓN LARGO!": "BOLA PANJANG!",
		"¡{0} TE LA CUELGA!": "{0} MELAMBUNGKANNYA!",
		"¡CONTROLADA!": "TERKONTROL!",
		"Primas por premios": "Bonus penghargaan",
		"Prima de firma": "Bonus tanda tangan",
		"+${0} DE PRIMA": "+${0} BONUS",
		"SI EL CLUB CUMPLE": "JIKA KLUB CAPAI",
		"GUARDANDO EN TU ALBUM...": "MENYIMPAN KE ALBUM...",
		"EN TU ALBUM · %d/%d": "DI ALBUM · %d/%d",
		"ALBUM LLENO %d/%d · BORRA UNO EN COLECCION": "ALBUM PENUH %d/%d · HAPUS SATU DI KOLEKSI",
		"SIN ESPACIO EN EL TELEFONO": "PONSEL PENUH",
		"NO SE PUDO GUARDAR · TOCA PARA REINTENTAR": "GAGAL · KETUK UNTUK ULANG",
		"¡Se queda corto!": "Tidak sampai!",
		"Cosechas del huerto": "Panen kebun",
		"PLANTILLAS DE COMUNIDAD": "SKUAD KOMUNITAS",
		"Packs que hace la gente. Cada uno vive en la web de quien lo hizo.": "Pack buatan para pemain. Masing-masing ada di situs pembuatnya.",
		"BUSCAR PACK O CREADOR": "CARI PACK/PEMBUAT",
		"BÁJALO": "UNDUH",
		"en su web": "di situsnya",
		"TÓCALO": "KETUK",
		"en Descargas": "di Unduhan",
		"IMPORTA": "IMPOR",
		"se abre en el juego": "terbuka di dalam game",
		"CARGANDO": "MEMUAT",
		"TODAVÍA NO HAY": "BELUM ADA",
		"Cuando alguien comparta un pack, sale aquí.": "Saat seseorang membagikan pack, akan muncul di sini.",
		"Conéctate a internet para ver la lista.": "Sambungkan ke internet untuk melihat daftar.",
		"REINTENTAR": "ULANGI",
		"¡ROMPISTE UNA CUERDA DE LA RED!": "TALI JARING PUTUS!",
		"¡LAS DOS CUERDAS DE LA RED!": "DUA TALI JARING!",
		"¡El staff arregla la red!": "Petugas memperbaiki jaring!",
	},







	"sim": {




		"simFINAL DEL PARTIDO": "LAGA USAI",
		"simDESCANSO": "HALFTIME",
		"simGOOOL": "GOOOL",
		"simGOLAZO": "INDAH",
		"simGOLES": "GOL",
		"simGOL": "GOL",
		"simASISTENCIA": "ASSIST",
		"simASISTE": "ASSIST",
		"simATAJADÓN": "SAVE HEBAT",
		"simPARADA": "SAVE",
		"simPOSTE": "TIANG",
		"simTRAVESAÑO": "MISTAR",
		"simCABECEA": "SUNDUL",
		"simREMATA": "TEMBAK",
		"simREMATE": "TEMBAK",
		"simDISPARO": "TEMBAK",
		"simCÓRNER": "KORNER",
		"simPENAL": "PENALTI",
		"simENTRA": "MASUK",
		"simCAMBIO": "GANTI",
		"simTIRO LIBRE": "FREE KICK",
		"simFUERA DE JUEGO": "OFFSIDE",
		"simAMARILLA": "KUNING",
		"simROJA": "MERAH",
		"simEXPULSADO": "DIUSIR",
		"simLESIÓN": "CEDERA",
		"simLESIONADO": "CEDERA",
		"simFALTA": "FOUL",
		"simPÉRDIDA": "HILANG",
		"¡GOL DE {0}!": "GOL {0}!",
		"ASISTE {0}": "ASSIST {0}",
		"DESCANSO": "HALFTIME",
		"FINAL DEL PARTIDO": "LAGA USAI",
		"TOQUE EN EL MEDIO CAMPO": "OPER-OPER DI LINI TENGAH",
		"TU EQUIPO CONTROLA EL BALÓN": "TIMMU MENGUASAI BOLA",
		"EL RIVAL PRESIONA ARRIBA": "LAWAN PRESSING TINGGI",
		"FALTA EN MEDIA CANCHA": "FOUL DI LINI TENGAH",
		"SAQUE DE BANDA": "LEMPARAN",
		"LA AFICIÓN ANIMA": "SUPORTER BERSORAK",
		"DUELO FÍSICO EN EL CENTRO": "ADU FISIK DI TENGAH",
		"EL ÁRBITRO DEJA SEGUIR": "WASIT BIARKAN LANJUT",
		"PASES EN CORTO, SIN PRISA": "UMPAN PENDEK, SANTAI",
		"CÓRNER SIN REMATE CLARO": "KORNER TANPA PELUANG",
		"FUERA DE JUEGO SEÑALADO": "OFFSIDE DITIUP",
		"BALÓN LARGO SIN DUEÑO": "BOLA JAUH TAK BERTUAN",
		"TU DEFENSA CORTA EL AVANCE": "BEKMU MEMUTUS SERANGAN",
		"EL PORTERO ACHICA A TIEMPO": "KIPER MEMPERSEMPIT SUDUT",
		"CAMBIO DE ORIENTACIÓN AL OTRO COSTADO": "BOLA DIALIHKAN KE SAYAP LAIN",
		"PRESIÓN TRAS PÉRDIDA EN CAMPO RIVAL": "PRESSING BALIK DI AREA LAWAN",
		"EL BALÓN NO QUIERE ENTRAR EN EL ÁREA": "BOLA SULIT MASUK KOTAK",
		"AMARILLA POR CORTAR EL CONTRA": "KUNING STOP SERANGAN BALIK",
		"LA GRADA PIDE MÁS RITMO": "SUPORTER MINTA IRAMA CEPAT",
		"SE JUEGA A UN SOLO ARCO": "SERANGAN SATU ARAH",
		"PARADO EL JUEGO POR UN GOLPE": "LAGA STOP KARENA BENTURAN",
		"BUEN RELEVO EN LA BANDA": "BACKUP BAGUS DI SAYAP",
		"CENTRO PASADO, NO HABÍA NADIE": "SILANG KEJAUHAN, TAK ADA ORANG",
		"EL MEDIOCAMPO SE PARTE EN DOS": "LINI TENGAH TERBELAH LEBAR",
		"CÓRNER BOTADO EN CORTO": "KORNER DIKIRIM PENDEK",
		"FALTA AL BORDE DEL ÁREA, SE ARMA LA BARRERA": "FOUL DI TEPI KOTAK, PAGAR BETIS DIBENTUK",
		"EL ÁRBITRO MIDE LOS NUEVE METROS": "WASIT MENGUKUR SEMBILAN METER",
		"SAQUE DE ESQUINA QUE DESPEJA EL PRIMER PALO": "KORNER DISAPU DI TIANG DEKAT",
		"TIRO LIBRE LEJANO QUE SE VA A LA GRADA": "FREE KICK JAUH MELAMBUNG KE TRIBUN",
		"SAQUE DE PUERTA LARGO, A DISPUTAR": "TENDANGAN GAWANG JAUH, REBUTAN",
		"SEGUNDA JUGADA DEL CÓRNER, RECHAZA LA ZAGA": "BOLA KEDUA KORNER, BEK MENYAPU",
		"SAQUE DE BANDA LARGO AL ÁREA": "LEMPARAN JAUH KE KOTAK",
		"ROBO EN TRES CUARTOS Y VUELTA A EMPEZAR": "REBUT DI DEPAN, LALU MULAI LAGI",
		"DOS HOMBRES AL BALÓN, NO LO DEJAN SALIR": "DUA ORANG KE BOLA, TAK ADA JALAN KELUAR",
		"LA ZAGA SE JUNTA Y CIERRA EL PASILLO": "BEK MERAPAT DAN TUTUP CELAH",
		"DESPEJE LARGO PARA QUITARSE EL AGOBIO": "SAPUAN JAUH DEMI LEPAS DARI TEKANAN",
		"RUEDA EL BALÓN DE LADO A LADO": "BOLA BERGULIR SISI KE SISI",
		"PAREDES EN EL CENTRO DEL CAMPO": "UMPAN TEMBOK DI TENGAH",
		"CONTRA A CAMPO ABIERTO QUE SE QUEDA EN NADA": "SERANGAN BALIK TERBUKA GAGAL",
		"TODOS CORREN, NADIE PIENSA": "SEMUA LARI, TANPA MIKIR",
		"EL RITMO BAJA Y EL PARTIDO SE ADORMECE": "IRAMA TURUN, LAGA MULAI MENGANTUK",
		"SE JUEGA CON EL FRENO DE MANO": "MAIN DENGAN REM TANGAN TERTARIK",
		"PIDE EL CAMBIO UN JUGADOR TOCADO": "PEMAIN CEDERA RINGAN MINTA DIGANTI",
		"PROTESTAS AL LINIER DESDE EL BANQUILLO": "PROTES KE HAKIM GARIS DARI BANGKU",
		"APLAUDE LA GRADA UNA JUGADA DE OFICIO": "SUPORTER TEPUK TANGAN, AKSI CERDIK",
		"EL BALÓN SE VA AL FONDO SIN DUEÑO": "BOLA KELUAR TANPA ADA YANG MENGEJAR",
		"{0} REMATA FUERA POR POCO": "{0} MELEBAR TIPIS",
		"¡{0} LA TUVO, GRAN PARADA!": "{0} HAMPIR, SAVE HEBAT!",
		"{0} CABECEA ALTO": "{0} SUNDUL TINGGI",
		"DISPARO DE {0}, ¡ATAJADÓN!": "TEMBAKAN {0}, SAVE HEBAT!",
		"{0} ESTRELLA EL POSTE": "{0} MENGHANTAM TIANG",
		"{0} REMATA DESVIADO": "{0} MELESET SASARAN",


		"{0} DISPARA Y LO TAPA UN DEFENSA": "{0} MENEMBAK, DIBLOK BEK",
		"EL TIRO DE {0} TOCA EN UN DEFENSA Y SE VA A CÓRNER": "TEMBAKAN {0} KENA BEK, KORNER",
		"TU DEFENSA SE TIRA Y TAPA EL DISPARO DE {0}": "BEKMU MELUNCUR, BLOK TEMBAKAN {0}",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA, CÓRNER": "TEMBAKAN {0} MEMBENTUR BEKMU, KORNER",
		"¡GOL DE {0}! TOCA EN UN DEFENSA Y SE CUELA": "GOL {0}! KENA BEK DAN MASUK",
		"¡{0} DISPARA, LA DESVÍA UN DEFENSA Y ADENTRO!": "{0} MENEMBAK, MEMBENTUR BEK, MASUK!",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA Y ENTRA": "TEMBAKAN {0} MEMBENTUR BEKMU DAN MASUK",
		"¡AUTOGOL DE {0}!": "BUNUH DIRI {0}!",
		"{0} LA METE EN SU PROPIA PUERTA": "{0} MENJEBOL GAWANG SENDIRI",


		"¡{0} SE ELEVA Y LA CLAVA DE CABEZA!": "{0} MELOMPAT TINGGI, SUNDUL MASUK!",
		"¡CABEZAZO DE {0} AL FONDO DE LA RED!": "SUNDULAN {0} KE JARING!",
		"¡{0} GANA ARRIBA Y NO PERDONA!": "{0} MENANG DI UDARA, TAK MENGAMPUNI!",
		"¡{0} LA ENGANCHA DE VOLEA!": "{0} MENGHAJAR DENGAN VOLI!",
		"¡{0} LA PRENDE AL AIRE Y ADENTRO!": "{0} MENGHAJAR DI UDARA, MASUK!",
		"¡SIN DEJARLA CAER! GOL DE {0}": "LANGSUNG HAJAR! GOL {0}",
		"¡DE CHILENA! ¡{0}, INCREÍBLE!": "SALTO! {0}, LUAR BIASA!",
		"¡CHILENA DE {0}! GOL PARA LA HISTORIA": "SALTO {0}! GOL SEPANJANG MASA",
		"¡{0} DE CHILENA! ¡SE CAE EL ESTADIO!": "{0} DENGAN SALTO! STADION MELEDAK!",
		"{0} CABECEA SOLO Y MARCA": "{0} SUNDUL TANPA KAWAL",
		"LA VOLEA DE {0} SE CUELA": "VOLI {0} MASUK",
		"{0} MARCA DE CHILENA. QUÉ CASTIGO": "{0} CETAK GOL SALTO. KEJAM",
		"¡{0} CABECEA Y LA SACA EL PORTERO!": "{0} SUNDUL, KIPER MENYELAMATKAN!",
		"LA VOLEA DE {0} SE VA POR ENCIMA": "VOLI {0} MELAMBUNG DI ATAS",
		"{0} INTENTA LA CHILENA, ¡POR POCO!": "{0} COBA SALTO, TIPIS MELEBAR!",
		"CABEZAZO DE {0} AL POSTE": "SUNDULAN {0} KE TIANG",
		"{0} LO PRUEBA DE VOLEA, DESVIADO": "{0} COBA VOLI, MELEBAR",
		"TU EQUIPO REMATA FUERA": "TIMMU MELEBAR",
		"¡CASI GOL DE TU EQUIPO!": "HAMPIR GOL TIMMU!",
		"GRAN PARADA DEL PORTERO": "SAVE HEBAT DARI KIPER",
		"DISPARO DEL RIVAL, ¡ATAJADÓN!": "TEMBAKAN LAWAN, SAVE HEBAT!",
		"EL RIVAL ESTRELLA EL POSTE": "LAWAN MENGHANTAM TIANG",
		"EL RIVAL REMATA FUERA": "LAWAN MELEBAR",
		"CÓRNER PARA TU EQUIPO, LO CUELGA {0}": "KORNER TIMMU, {0} MENGIRIM BOLA",
		"FALTA PELIGROSA Y {0} SE PLANTA SOBRE EL BALÓN":
			"FREE KICK BAHAYA, {0} SIAP DI DEPAN BOLA",
		"{0} SACA EL CÓRNER AL SEGUNDO PALO Y DESPEJA LA ZAGA":
			"{0} KE TIANG JAUH, BEK MENYAPU",
		"TIRO LIBRE DE {0}: LA BARRERA LA MANDA AL CÓRNER":
			"FREE KICK {0}: PAGAR BETIS BUANG KE KORNER",
		"{0} LA COLGÓ AL ÁREA Y EL PORTERO LA ATRAPÓ EN EL AIRE":
			"{0} KIRIM KE KOTAK, KIPER TANGKAP DI UDARA",
		"SAQUE DE BANDA LARGO DE {0} BUSCANDO EL SEGUNDO PALO":
			"LEMPARAN JAUH {0} CARI TIANG JAUH",
		"FALTA LATERAL: {0} PONE EL CENTRO Y SE ARMA EL LÍO":
			"FREE KICK SAMPING: {0} SILANG, KACAU",
		"CÓRNER EN CORTO ENTRE {0} Y SU COMPAÑERO":
			"KORNER PENDEK {0} DAN REKANNYA",
		"{0} ENSAYA UNA FALTA LEJANA Y SE VA ALTA":
			"{0} COBA DARI JAUH, MELAMBUNG",
		"OTRO CÓRNER: {0} VUELVE A COLGARLA AL ÁREA": "KORNER LAGI: {0} KIRIM BOLA LAGI",
		"CÓRNER PARA EL RIVAL, LO SACA {0}": "KORNER LAWAN, DIEKSEKUSI {0}",
		"FALTA AL BORDE DEL ÁREA, LA PONE {0}": "FREE KICK TEPI KOTAK, {0} MAJU",
		"{0} CUELGA EL CÓRNER Y TU DEFENSA DESPEJA DE CABEZA":
			"{0} KIRIM KORNER, BEKMU SUNDUL KELUAR",
		"TIRO LIBRE DE {0} QUE SE ESTRELLA EN LA BARRERA":
			"FREE KICK {0} MENGHANTAM PAGAR BETIS",
		"{0} LA MANDA AL ÁREA Y TU PORTERO SALE A PUÑOS":
			"{0} KIRIM KE KOTAK, KIPERMU TINJU KELUAR",
		"SAQUE DE BANDA LARGO DE {0}, SIN CONSECUENCIAS":
			"LEMPARAN JAUH {0}, TAK BERBUAH",
		"FALTA EN TRES CUARTOS: {0} ESPERA A QUE SUBAN LOS CENTRALES":
			"FREE KICK DEPAN: {0} TUNGGU CB NAIK",
		"{0} BOTA EL CÓRNER EN CORTO Y TU EQUIPO ACHICA":
			"{0} KORNER PENDEK, TIMMU MAJU MENEKAN",
		"FALTA LEJANA DE {0} POR ENCIMA DEL TRAVESAÑO":
			"FREE KICK JAUH {0} DI ATAS MISTAR",
		"OTRO CÓRNER RIVAL: {0} LO CUELGA AL PRIMER PALO":
			"KORNER LAWAN LAGI: {0} KE TIANG DEKAT",
		"CÓRNER PARA TU EQUIPO, DESPEJA LA ZAGA": "KORNER TIMMU, BEK MENYAPU",
		"FALTA PELIGROSA A FAVOR, SE ARMA LA BARRERA":
			"FREE KICK BAHAYA UNTUKMU, PAGAR DIBENTUK",
		"TIRO LIBRE DE TU EQUIPO QUE SE VA ALTO": "FREE KICK TIMMU MELAMBUNG TINGGI",
		"CÓRNER PARA EL RIVAL, DESPEJA TU DEFENSA":
			"KORNER LAWAN, BEKMU MENYAPU",
		"FALTA PELIGROSA EN CONTRA, TU EQUIPO ARMA LA BARRERA":
			"FREE KICK BAHAYA UNTUK LAWAN, TIMMU BENTUK PAGAR",
		"TIRO LIBRE DEL RIVAL A LAS MANOS DEL PORTERO":
			"FREE KICK LAWAN LANGSUNG KE KIPER",

		"AMARILLA PARA {0} POR UNA ENTRADA TARDÍA": "KUNING {0} KARENA TACKLE TERLAMBAT",
		"EL ÁRBITRO AMONESTA A {0} POR PROTESTAR": "WASIT BERI KARTU {0} KARENA PROTES",
		"AMARILLA A {0} POR FRENAR EL CONTRA CON FALTA":
			"KUNING {0} KARENA FOUL STOP SERANGAN",
		"AMARILLA PARA {0} POR UNA FALTA DURA": "KUNING {0} KARENA FOUL KERAS",
		"{0} VE LA AMARILLA POR PERDER TIEMPO": "{0} KARTU KUNING KARENA ULUR WAKTU",
		"AMARILLA A {0} POR DERRIBAR AL EXTREMO": "KUNING {0} KARENA JATUHKAN WINGER",
		"AMARILLA PARA TU EQUIPO": "KUNING UNTUK TIMMU",
		"AMARILLA PARA EL RIVAL": "KUNING UNTUK LAWAN",
		"AMARILLA PARA {0}": "KUNING UNTUK {0}",
		"SEGUNDA AMARILLA PARA {0}": "KUNING KEDUA UNTUK {0}",
		"¡ROJA! {0} SE VA EXPULSADO": "MERAH! {0} DIUSIR",
		"EL ÁRBITRO PERDONA A {0}": "WASIT MEMAAFKAN {0}",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA A TU EQUIPO CON DIEZ":
			"KUNING KEDUA, MERAH! {0} BUAT TIMMU 10 ORANG",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA AL RIVAL CON DIEZ":
			"KUNING KEDUA, MERAH! {0} BUAT LAWAN 10 ORANG",
		"¡ROJA DIRECTA A {0}! TU EQUIPO SE QUEDA CON DIEZ":
			"MERAH LANGSUNG {0}! TIMMU TINGGAL 10 ORANG",
		"¡ROJA DIRECTA A {0}! EL RIVAL SE QUEDA CON DIEZ":
			"MERAH LANGSUNG {0}! LAWAN TINGGAL 10 ORANG",
		"ROJA DIRECTA POR EL BALONAZO AL ÁRBITRO":
			"MERAH LANGSUNG, BOLA DITENDANG KE WASIT",
		"{0} SE MARCHA LESIONADO, NO PUEDE SEGUIR":
			"{0} KELUAR CEDERA, TAK BISA LANJUT",
		"LESIÓN EN EL RIVAL: {0} DEJA LA CANCHA": "LAWAN CEDERA: {0} KELUAR LAPANGAN",
		"PARÓN POR LESIÓN, ENTRA LA CAMILLA": "LAGA BERHENTI KARENA CEDERA, TANDU MASUK",
		"BLOQUE BAJO Y SIN PRISA: EL PARTIDO SE JUEGA AL RALENTÍ":
			"BLOK RENDAH, TAK BURU-BURU: LAGA SLOW MOTION",
		"TU EQUIPO CEDE EL BALÓN Y ESPERA AGAZAPADO":
			"TIMMU SERAHKAN BOLA DAN MENUNGGU",
		"ONCE HOMBRES POR DETRÁS DE LA PELOTA, SIN GASTAR UNA GOTA":
			"SEBELAS ORANG DI BELAKANG BOLA, HEMAT TENAGA",
		"SE JUEGA A LO QUE QUIERE {0}, PERO NO ENTRA NADIE":
			"{0} PEGANG KENDALI, TAPI TAK ADA YANG MASUK",
		"CADA DESPEJE ES UN SEGUNDO MÁS QUE SE VA DEL RELOJ":
			"TIAP SAPUAN MENGHABISKAN SATU DETIK LAGI",
		"EL BANQUILLO PIDE CALMA: NI UN PASO ADELANTE":
			"BANGKU MINTA TENANG: JANGAN MAJU",
		"MURO Y PACIENCIA, EL PLAN ES QUE NO PASE NADA":
			"TEMBOK DAN SABAR, RENCANANYA: TAK TERJADI APA-APA",
		"TU EQUIPO ADMINISTRA PIERNAS Y METROS ATRÁS":
			"TIMMU HEMAT TENAGA DAN JARAK DI BELAKANG",
		"REPLIEGUE ORDENADO, SIN SALIR A LA PRESIÓN":
			"MUNDUR RAPI, TAK KELUAR MENEKAN",
		"{0} TOCA Y TOCA CONTRA UN MURO QUE NO SE MUEVE":
			"{0} UMPAN TERUS KE TEMBOK YANG DIAM",
		"BLOQUE BAJO Y SALIDA RÁPIDA: TU EQUIPO ESPERA SU MOMENTO":
			"BLOK RENDAH, KELUAR CEPAT: TIMMU MENUNGGU MOMEN",
		"REPLIEGUE Y CONTRA, ASÍ SE PLANTEÓ ESTE PARTIDO":
			"BERTAHAN LALU SERANG BALIK, ITU RENCANANYA",
		"TU EQUIPO CEDE EL CENTRO DEL CAMPO Y CIERRA EL ÁREA":
			"TIMMU LEPAS TENGAH DAN TUTUP KOTAK",
		"LÍNEAS JUNTAS, SIN UN HUECO ENTRE ELLAS": "LINI RAPAT, TAK ADA CELAH",
		"SE DEFIENDE CON ORDEN Y SE SALE CON CRITERIO":
			"BERTAHAN RAPI, KELUAR DENGAN TUJUAN",
		"{0} TIENE EL BALÓN; TU EQUIPO TIENE EL PLAN": "{0} PEGANG BOLA; TIMMU PEGANG RENCANA",
		"CADA ROBO SE CONVIERTE EN UN BALÓN LARGO": "TIAP MEREBUT BOLA, LANGSUNG BOLA JAUH",
		"LA ZAGA MANDA: NADA PASA POR EL MEDIO":
			"BEK BERKUASA: TAK ADA YANG LEWAT TENGAH",
		"TU EQUIPO JUEGA AL ERROR DEL RIVAL": "TIMMU MAIN MENUNGGU KESALAHAN LAWAN",
		"DEFENSA EN BLOQUE, SIN REGALAR LA ESPALDA":
			"BERTAHAN SEBAGAI BLOK, RUANG BELAKANG TERJAGA",
		"REPLIEGUE FEROZ: SE DEFIENDE COMO SI FUERA EL ÚLTIMO MINUTO":
			"MUNDUR BUAS: BERTAHAN SEPERTI MENIT TERAKHIR",
		"BLOQUE BAJO PERO A MIL POR HORA, NO SE RESPIRA NI ATRÁS":
			"BLOK RENDAH TAPI NGEBUT, TAK ADA NAPAS",
		"TU EQUIPO SE PARTE EL ALMA EN CADA DESPEJE":
			"TIMMU BERJUANG DI TIAP SAPUAN",
		"SE DEFIENDE Y SE SALE AL CONTRAGOLPE COMO UN LATIGAZO":
			"BERTAHAN LALU SERANG BALIK SECEPAT CAMBUK",
		"TRABAJO SUCIO A TODA VELOCIDAD: DOS HOMBRES A CADA BALÓN":
			"KERJA KOTOR NGEBUT: DUA ORANG KE TIAP BOLA",
		"CIERRAN ATRÁS Y ARRANCAN AL ESPACIO EN CUANTO ROBAN":
			"TUTUP BELAKANG, LARI SAAT BOLA DIREBUT",
		"ENTREGA TOTAL EN EL REPLIEGUE, Y ESTO SE PAGA EN PIERNAS":
			"ALL-OUT SAAT MUNDUR, DAN KAKI YANG MEMBAYAR",
		"{0} SE ESTRELLA CONTRA UNA MURALLA QUE ADEMÁS CORRE":
			"{0} MENABRAK TEMBOK YANG IKUT LARI",
		"NI UN METRO GRATIS: PERSIGUEN AL RIVAL HASTA EL CÓRNER":
			"TAK ADA RUANG GRATIS: DIKEJAR SAMPAI BENDERA KORNER",
		"DEFENDER ASÍ QUEMA, PERO EL ARCO SIGUE EN PIE":
			"BERTAHAN BEGINI MELELAHKAN, TAPI GAWANG UTUH",
		"PARTIDO DE TRÁMITE: TU EQUIPO NO ARRIESGA NI UN PASE":
			"LAGA FORMALITAS: TIMMU TAK AMBIL RISIKO SEDIKIT PUN",
		"RITMO BAJO Y POSICIONES FIJAS, NADIE SE DESCUELGA":
			"IRAMA RENDAH, POSISI TETAP, TAK ADA YANG NEKAT",
		"SE TOCA EN HORIZONTAL, SIN ROMPER LÍNEAS": "UMPAN MENYAMPING, TAK PECAHKAN LINI",
		"EL PARTIDO SE DUERME Y A TU EQUIPO NO LE MOLESTA":
			"LAGA MENGANTUK, TIMMU TAK KEBERATAN",
		"PLAN SOBRIO: NI ATRÁS NI ARRIBA, DEJAR CORRER EL RELOJ":
			"RENCANA POLOS: TAK MUNDUR TAK MAJU, HABISKAN WAKTU",
		"TU EQUIPO DOSIFICA, GUARDANDO PIERNAS PARA EL FINAL":
			"TIMMU ATUR TENAGA, SIMPAN KAKI UNTUK AKHIR",
		"PASES DE SEGURIDAD Y MIRADAS AL BANQUILLO": "UMPAN AMAN DAN LIRIKAN KE BANGKU",
		"SIN PRESIÓN Y SIN PRISA, EL PARTIDO ESTÁ EN PAUSA":
			"TANPA PRESSING, TAK BURU-BURU, LAGA SEOLAH JEDA",
		"EQUILIBRIO Y CALMA, NADIE QUIERE ROMPER LA MESA":
			"SEIMBANG DAN TENANG, TAK ADA YANG MAU MERUSAK",
		"SE JUEGA A MEDIO GAS, ESPERANDO UNA GRIETA":
			"MAIN SETENGAH GAS, MENUNGGU CELAH",
		"PARTIDO PAREJO: TU EQUIPO SOSTIENE EL EQUILIBRIO":
			"LAGA SEIMBANG: TIMMU JAGA KESEIMBANGAN",
		"NI REPLIEGUE NI LOCURA, EL PLAN ES EL ORDEN":
			"TAK MUNDUR, TAK NEKAT: KUNCINYA RAPI",
		"SE JUEGA DE IGUAL A IGUAL EN EL MEDIO CAMPO": "ADU SEIMBANG DI LINI TENGAH",
		"TU EQUIPO ALTERNA TOQUE Y VERTICALIDAD": "TIMMU SELANG-SELING SABAR DAN LANGSUNG",
		"BLOQUE MEDIO Y PRESIÓN SÓLO CUANDO TOCA": "BLOK TENGAH, PRESSING HANYA SAAT PERLU",
		"PLAN CLÁSICO: SUJETAR ATRÁS, PROBAR ARRIBA":
			"RENCANA KLASIK: TAHAN DI BELAKANG, COBA DI DEPAN",
		"EL PARTIDO SE JUEGA DONDE TU EQUIPO QUIERE, EN EL MEDIO":
			"LAGA BERJALAN DI TENGAH, SESUAI MAU TIMMU",
		"SIN DESAJUSTES, CADA UNO EN SU SITIO": "TAK ADA CELAH, SEMUA DI POSISI",
		"SE ESPERA EL MOMENTO SIN REGALAR NADA":
			"MENUNGGU MOMEN TANPA MEMBERI APA-APA",
		"{0} NO ENCUENTRA GRIETAS EN UN EQUIPO BIEN PLANTADO":
			"{0} TAK MENEMUKAN CELAH DI TIM YANG RAPI",
		"MISMO PLAN, OTRO PULSO: TU EQUIPO CORRE EL DOBLE":
			"RENCANA SAMA, DENYUT BEDA: TIMMU LARI DUA KALI LIPAT",
		"IDA Y VUELTA A TODO TREN, ESTO ES UN PARTIDO ROTO":
			"BALAS-BALASAN NGEBUT, LAGA INI TERBUKA LEBAR",
		"PRESIÓN EN CUANTO SE PIERDE, ORDEN EN CUANTO SE TIENE":
			"PRESSING SAAT HILANG, RAPI SAAT PEGANG",
		"RITMO ALTO SIN PERDER LA FORMA": "IRAMA TINGGI, BENTUK TERJAGA",
		"SE DISPUTA CADA SEGUNDA PELOTA COMO SI FUERA LA ÚLTIMA":
			"TIAP BOLA KEDUA DIREBUT SEPERTI YANG TERAKHIR",
		"TU EQUIPO ACELERA CADA VEZ QUE PISA CAMPO CONTRARIO":
			"TIMMU NGEBUT TIAP MASUK AREA LAWAN",
		"EL PARTIDO VUELA DE ÁREA A ÁREA": "LAGA MELESAT DARI KOTAK KE KOTAK",
		"INTENSIDAD ARRIBA: {0} NO ENCUENTRA UN SEGUNDO DE PAZ":
			"INTENSITAS NAIK: {0} TAK DAPAT SEDETIK TENANG",
		"EQUILIBRIO CON EL ACELERADOR PISADO": "SEIMBANG DENGAN GAS DIINJAK",
		"SE CORRE MUCHO Y SE PIENSA RÁPIDO": "BANYAK LARI DAN BERPIKIR CEPAT",
		"TODOS ARRIBA, PERO SIN QUEMARSE: SE BUSCA CON CABEZA":
			"SEMUA NAIK, TAPI TAK HABIS TENAGA: PAKAI OTAK",
		"ATAQUE PACIENTE: SE RODEA EL ÁREA ESPERANDO EL HUECO":
			"SERANGAN SABAR: MENGITARI KOTAK MENUNGGU CELAH",
		"TU EQUIPO ADELANTA LÍNEAS Y ADMINISTRA EL ESFUERZO":
			"TIMMU MAJUKAN LINI DAN ATUR TENAGA",
		"MUCHA GENTE ARRIBA Y NINGUNA PRISA POR LLEGAR":
			"BANYAK ORANG DI DEPAN, TAK ADA BURU-BURU",
		"SE ATACA AL PASO, CON EL BALÓN COMO ÚNICO ARGUMENTO":
			"MENYERANG SANTAI, BOLA JADI SATU-SATUNYA ARGUMEN",
		"PROPUESTA OFENSIVA SIN DESGASTE: TOQUE Y ESPERA":
			"SERANGAN TANPA CAPEK: UMPAN LALU TUNGGU",
		"LOS LATERALES SUBEN, PERO NADIE CORRE DE MÁS":
			"BEK SAYAP NAIK, TAPI TAK ADA YANG FORSIR",
		"TU EQUIPO ACAMPA EN CAMPO DE {0} SIN APRETAR EL PASO":
			"TIMMU BERKEMAH DI WILAYAH {0} TANPA TAMBAH TEMPO",
		"AMBICIÓN CON LAS PIERNAS GUARDADAS PARA EL FINAL":
			"AMBISI, TENAGA DISIMPAN UNTUK AKHIR LAGA",
		"SE INSISTE ARRIBA, AUNQUE SIN PRESIÓN TRAS PÉRDIDA":
			"TERUS MENEKAN, TAPI TANPA PRESSING BALIK",
		"PLANTEAMIENTO OFENSIVO: TODOS ARRIBA SOBRE {0}":
			"STRATEGI MENYERANG: SEMUA NAIK DI {0}",
		"TU EQUIPO ADELANTA LA LÍNEA Y BUSCA EL ÁREA RIVAL":
			"TIMMU NAIKKAN GARIS DAN BURU KOTAK LAWAN",
		"LOS LATERALES VIVEN EN CAMPO CONTRARIO":
			"BEK SAYAP MENETAP DI SISI LAWAN",
		"SE ATACA CON GENTE: CINCO HOMBRES POR DELANTE DEL BALÓN":
			"MENYERANG RAMAI-RAMAI: LIMA ORANG DI DEPAN BOLA",
		"TU EQUIPO EMPUJA Y EL RIVAL ACUMULA GENTE ATRÁS":
			"TIMMU MENEKAN, LAWAN MENUMPUK DI BELAKANG",
		"CENTRO TRAS CENTRO, EL PLAN ES AHOGAR EL ÁREA":
			"UMPAN SILANG BERTUBI, KOTAK LAWAN DIBANJIRI",
		"PROPUESTA VALIENTE, AUNQUE DEJE ESPACIOS A LA ESPALDA":
			"BERANI, MESKI RUANG DI BELAKANG TERBUKA",
		"TU EQUIPO JUEGA EN CAMPO DE {0} Y NO PIENSA SALIR":
			"TIMMU MAIN DI WILAYAH {0} DAN TAK MAU KELUAR",
		"SE ARRIESGA EN CADA SALIDA BUSCANDO AL DELANTERO":
			"TIAP BUILD-UP BERISIKO: BOLA KE PENYERANG",
		"EL BLOQUE ESTÁ ALTO Y LA ZAGA, MUY SOLA":
			"BLOK TINGGI, LINI BELAKANG SANGAT TERBUKA",
		"ASEDIO TOTAL: TODOS ARRIBA Y A MÁXIMO PULSO": "KEPUNGAN TOTAL: SEMUA NAIK, TEMPO PENUH",
		"PRESIÓN ASFIXIANTE SOBRE {0}, NO LES DEJAN NI SACAR":
			"PRESSING MENCEKIK {0}, BUILD-UP PUN TAK BISA",
		"TU EQUIPO SE VOLCÓ Y NO HAY QUIEN LO FRENE":
			"TIMMU ALL-OUT MENYERANG DAN TAK TERBENDUNG",
		"OLA TRAS OLA SOBRE EL ÁREA RIVAL": "GELOMBANG BERTUBI KE KOTAK LAWAN",
		"ROBO ARRIBA Y REMATE: ESTO ES UNA TORMENTA": "REBUT DI DEPAN, LANGSUNG TEMBAK: INI BADAI",
		"EL RIVAL NO PASA DE MEDIO CAMPO, Y ESO SE PAGA EN PIERNAS":
			"LAWAN TAK LEWAT TENGAH, DAN STAMINA TERKURAS",
		"TODO EL EQUIPO METIDO EN VEINTE METROS DE CAMPO CONTRARIO":
			"SEMUA PEMAIN TERJEPIT DI 20 METER SISI LAWAN",
		"RITMO ALTÍSIMO, NO DEJAN RESPIRAR A {0}": "TEMPO GILA, {0} TAK BISA BERNAPAS",
		"UN SOLO EQUIPO EN EL CAMPO, Y ES EL TUYO": "HANYA SATU TIM DI LAPANGAN, DAN ITU TIMMU",
		"ATAQUE SIN RED: ATRÁS SÓLO QUEDAN DOS":
			"MENYERANG TANPA JARING: TINGGAL DUA DI BELAKANG",
		"CON EL {0} ABAJO, TU EQUIPO VA AL FRENTE": "TERTINGGAL {0}, TIMMU MAJU KE DEPAN",
		"ARRANCA EL PARTIDO, PRIMEROS TANTEOS ANTE {0}": "LAGA DIMULAI, SALING MENJAJAKI {0}",
		"CON EL {0} ABAJO, TU EQUIPO SE VUELCA AL FRENTE":
			"TERTINGGAL {0}, TIMMU ALL-OUT MENYERANG",
		"FRÍOS: A TU EQUIPO NO LE SALE NADA": "DINGIN: TAK ADA YANG JALAN BAGI TIMMU",
		"PIERNAS PESADAS: {0} ACUSA EL CANSANCIO": "KAKI BERAT: {0} MULAI KELELAHAN",
		"{0} SE COLOCA EL BALÓN EN EL PUNTO": "{0} TARUH BOLA DI TITIK PENALTI",
		"LA PENA MÁXIMA LA COBRA {0}": "{0} AKAN EKSEKUSI PENALTI",
		"SE PREPARA {0} SOBRE LA FALTA": "{0} SIAP AMBIL FREE KICK",
		"SE HACE CARGO {0} DE LA FALTA": "{0} AMBIL ALIH TENDANGAN BEBAS",
		"SACA EL CÓRNER {0}": "{0} AMBIL KORNER",
		"SAQUE DE ESQUINA, LLEGA EL CENTRO": "KORNER, UMPAN SILANG DATANG",
		"{0} MINUTOS AÑADIDOS": "{0} MENIT TAMBAHAN",
		"ESTO SE VA A LA PRÓRROGA": "LAGA KE PERPANJANGAN WAKTU",
		"{0} LLEGA TARDE A TODO, SIN PIERNAS": "{0} TERLAMBAT SEMUA, KAKI HABIS",
		"{0} PIDE EL CAMBIO CON LA MIRADA": "{0} MINTA GANTI LEWAT TATAPAN",
		"SE LE ACABA LA GASOLINA A {0}": "{0} KEHABISAN BENSIN",
		"{0} ANDA ENCHUFADÍSIMO HOY": "{0} SANGAT TAJAM HARI INI",
		"NO PARA DE CORRER, {0}": "{0} TAK BERHENTI LARI",
		"{0} ESTÁ ADMINISTRANDO FUERZAS": "{0} MENGATUR TENAGA",
		"{0} ANDA MUY FLOJO, LE FALTA CHISPA": "{0} TERLIHAT LOYO, TAK ADA GREGET",
		"{0} DEBERÍA PISAR MÁS EL ÁREA": "{0} HARUS SERING MASUK KOTAK",
		"A {0} LE FALTA AYUDAR ATRÁS": "{0} HARUS BANTU DI BELAKANG",
		"ASÍ NO LE LLEGA UN BALÓN A {0}": "BEGINI TERUS, {0} TAK KEBAGIAN BOLA",
		"{0} SE ESTÁ ADUEÑANDO DEL PARTIDO": "{0} MENGUASAI LAGA INI",
		"PARTIDAZO DE {0}": "LAGA HEBAT {0}",
		"SE LE ESTÁ ATRAGANTANDO EL PARTIDO A {0}": "{0} MULAI KESULITAN DI LAGA INI",
		"{0} NO APARECE": "{0} TAK TERLIHAT",
		"{0} LLEVA LA MANIJA DEL EQUIPO": "{0} MEMEGANG KENDALI TIM",
		"{0} SE QUEDA SOLO ARRIBA, NADIE SUBE": "{0} SENDIRI DI DEPAN, TAK ADA YANG NAIK",
		"TODO PASA POR {0}": "SEMUA LEWAT {0}",
		"{0} NO PARA DE APAGAR FUEGOS ATRÁS": "{0} TERUS MEMADAMKAN API DI BELAKANG",
		"{0} SE PASA EL PARTIDO CORRIENDO DETRÁS DEL BALÓN": "{0} SEPANJANG LAGA MENGEJAR BOLA",
		"{0} MANEJA LOS TIEMPOS DESDE EL MEDIO": "{0} ATUR TEMPO DARI TENGAH",
		"TARDE TRANQUILA PARA {0} EN LA ZAGA": "SORE TENANG BAGI {0} DI BELAKANG",
		"LA GRADA CANTA TU NOMBRE, {0}": "SUPORTER MENYANYIKAN NAMAMU, {0}",
		"{0} BAJA A ORDENAR EL JUEGO": "{0} TURUN MENGATUR PERMAINAN",
		"{0} CALIENTA EN LA BANDA, PIDE ENTRAR":
			"{0} PEMANASAN DI PINGGIR, MINTA MASUK",

		"{0} MIRA EL PARTIDO DESDE EL BANQUILLO, CABIZBAJO":
			"{0} MENONTON DARI BANGKU CADANGAN, TERTUNDUK",
		"{0} SE SIENTA FUNDIDO, EL BANQUILLO LE DA HIELO":
			"{0} TERDUDUK LEMAS, BANGKU CADANGAN BERI ES",
		"UNA PALMADA PARA {0} AL LLEGAR AL BANQUILLO":
			"TEPUKAN BAHU UNTUK {0} SAAT TIBA DI BANGKU",
		"NADIE DEL BANQUILLO MIRA A {0}": "TAK ADA YANG LIRIK {0} DI BANGKU",
		"EN EL BANQUILLO SE COMENTA LA SALIDA DE {0}":
			"BANGKU RAMAI BICARA SOAL KELUARNYA {0}",
		"{0} SIGUE EL PARTIDO DESDE EL BANQUILLO": "{0} MENGIKUTI LAGA DARI BANGKU CADANGAN",
		"EQUIPO ENCENDIDO, HUELE A GOL ANTE {0}":
			"TIMMU MEMBARA, GOL SEGERA DATANG LAWAN {0}",
		"DUELO PAREJO, NADIE QUIERE EL ERROR": "DUEL SEIMBANG, TAK ADA YANG MAU SALAH",
		"TU EQUIPO MANEJA EL {0}": "TIMMU MENGENDALIKAN {0}",
		"TU EQUIPO MANEJA EL {0} SIN PRISA": "TIMMU KENDALIKAN {0} DENGAN TENANG",
		"SE ACERCA EL DESCANSO CON EL {0}": "JELANG TURUN MINUM, SKOR {0}",
		"RECTA FINAL, URGE EL EMPATE: TODOS ARRIBA":
			"TIKUNGAN AKHIR, BUTUH GOL PENYAMA: SEMUA NAIK",
		"RECTA FINAL Y EL {0} SIGUE ABIERTO": "TIKUNGAN AKHIR, {0} MASIH TERBUKA",
		"RECTA FINAL: TU EQUIPO AGUANTA EL {0} CON EL ALMA":
			"TIKUNGAN AKHIR: TIMMU PERTAHANKAN {0} MATI-MATIAN",
	},

	"notifications": {
		"ESA CAMISETA TIENE DUEÑO": "NOMOR ITU SUDAH DIPAKAI",
		"El número que quieres cuelga dos perchas más allá, con el nombre de {0} encima. Cambiarlo se hace más de lo que parece.":
			"Nomor yang kamu mau tergantung dua gantungan dari sini, dengan nama {0} di atasnya. Menggantinya tidak semudah kelihatannya.",
		"COMPRÁRSELO": "BELI",
		"PEDIRLO AL CLUB": "MINTA KLUB",
		"DEJARLO ESTAR": "BIARKAN",
		"UN OJEADOR EN LA GRADA": "PENCARI BAKAT NONTON",
		"Un club grande mandó ojeador a verte y la prensa local se enteró. Todos quieren saber si sueñas con irte.":
			"Klub besar mengirim pencari bakat untuk melihatmu dan pers lokal mencium kabarnya. Semua ingin tahu apakah kamu bermimpi pergi.",
		"HABLAR DEL SUEÑO": "AKUI MIMPI",
		"QUITARLE HIERRO": "REDAKAN",
		"EL SEGUNDO TRABAJO": "KERJA KEDUA",
		"Un compañero reparte paquetes por las mañanas para llegar a fin de mes. Esta semana no puede y te pide cubrirle una tarde.":
			"Seorang rekan setim mengantar paket tiap pagi demi menutup kebutuhan. Minggu ini dia tak bisa dan minta kamu menggantikan satu sore.",
		"ECHARLE LA TARDE": "GANTIKAN",
		"NO PUEDO": "TAK BISA",
		"ESTE CAMPO ES UN PATATAL": "LAPANGAN INI MEMALUKAN",
		"El césped es un parche de tierra y bote falso. Un periodista te pregunta, sonriendo, qué te parece tu nuevo estadio.":
			"Rumputnya cuma tanah dan pantulan liar. Seorang jurnalis bertanya sambil nyengir, bagaimana menurutmu stadion barumu.",
		"DECIR LA VERDAD": "JUJUR SAJA",
		"'AQUÍ SE JUEGA IGUAL'": "'SAMA SAJA DI SINI'",
		"CÁMARAS EN EL VESTUARIO": "KAMERA DI RUANG GANTI",
		"Una plataforma quiere rodar tu documental: un mes de cámaras siguiéndote hasta dentro del vestuario. Pagan bien. El grupo no sonríe.":
			"Sebuah platform streaming ingin syuting dokumenter tentangmu: sebulan kamera mengikutimu sampai ke ruang ganti. Bayarannya bagus. Rekan setim tak tersenyum.",
		"FIRMAR EL RODAJE": "TEKEN KONTRAK",
		"PROTEGER EL GRUPO": "LINDUNGI TIM",
		"TU CIFRA EN PORTADA": "ANGKAMU DI KORAN",
		"Un diario publica lo que pides por renovar, con cifra y todo. Es casi exacta. Confirmarla presiona al club; negarla te protege.":
			"Sebuah koran memuat permintaanmu untuk perpanjangan, lengkap dengan angka. Hampir tepat. Membenarkannya menekan klub; menyangkalnya melindungimu.",
		"CONFIRMARLA": "BENARKAN",
		"NEGARLO TODO": "BANTAH SEMUA",
		"EL PENALTI QUE NO TIRASTE": "PENALTI YANG LEPAS",
		"El designado falló el penalti que costó el partido. Tú eras el segundo de la lista y la prensa lo sabe.":
			"Eksekutor utama gagal penalti dan tim kalah. Kamu urutan kedua dan pers tahu itu.",
		"RESPALDARLO": "BELA DIA",
		"'YO LO PEDÍ'": "'AKU MINTA'",
		"TUS NÚMEROS EN LA PIZARRA": "STATMU DI PAPAN",
		"Un analista joven te espera con tu mala racha desmenuzada en la pizarra: mapas, flechas y todo lo que no estás haciendo.":
			"Seorang analis muda menunggumu dengan performa burukmu dibedah di papan: peta, panah, dan semua yang tidak kamu lakukan.",
		"TRAGARTE EL ORGULLO": "TELAN GENGSI",
		"MANDARLO A PASEO": "USIR DIA",
		"El siguiente partido te da la razón.": "Laga berikutnya membenarkanmu.",
		"La racha sigue y el míster no olvida.": "Paceklik berlanjut dan pelatih tak lupa.",
		"LA CÁMARA TE ENFOCÓ": "KAMERA MENYOROTMU",
		"Otro partido desde el banco, y la cámara te pilló con cara larga. En redes debaten si eres mal compañero.":
			"Laga lain dari bangku cadangan, dan kamera memergokimu bermuka masam. Di medsos orang berdebat apakah kamu rekan yang buruk.",
		"'APOYO AL EQUIPO'": "'AKU DUKUNG TIM'",
		"NO ACLARAR NADA": "BIARKAN SAJA",
		"EL DISCURSO DEL NUEVO": "PIDATO PEMAIN BARU",
		"Primer día con el grupo entero sentado y el míster te cede la palabra. Cuarenta segundos y todo el vestuario midiéndote.":
			"Hari pertama, seluruh tim duduk dan pelatih memberimu giliran bicara. Empat puluh detik, dan seisi ruang ganti menilaimu.",
		"PROMETER TÍTULOS": "JANJIKAN TROFI",
		"VENGO A APRENDER": "AKU MAU BELAJAR",
		"SÓLO SALUDAR Y SENTARTE": "CUKUP SAPA LALU DUDUK",
		"DÓNDE VAS A VIVIR": "TEMPAT TINGGAL",
		"El club te pasa tres opciones: el ático del centro que sale en las revistas, una casa pegada a la ciudad deportiva, o seguir en el hotel y no gastar.":
			"Klub memberi tiga pilihan: penthouse pusat kota yang sering masuk majalah, rumah dekat pusat latihan, atau tetap di hotel dan tak keluar uang.",
		"EL ÁTICO DEL CENTRO": "PENTHOUSE KOTA",
		"PEGADO AL ENTRENAMIENTO": "DEKAT LAPANGAN LATIHAN",
		"SEGUIR EN EL HOTEL": "TETAP DI HOTEL",
		"EL PLANTE POR LOS MINUTOS": "ULTIMATUM SOAL MENIT",
		"Otra jornada mirando desde el banco. Tu agente ya tiene el titular escrito y un periodista esperando; el míster te ha citado a solas antes de que salga.":
			"Satu pekan lagi menonton dari bangku cadangan. Agenmu sudah menulis judulnya dan wartawan menunggu; pelatih memanggilmu empat mata sebelum berita terbit.",
		"EXIGIRLO EN PÚBLICO": "TUNTUT DI PUBLIK",
		"TRAGAR Y CALLARTE": "TAHAN DIRI",
		"EL MOTÍN": "KUDETA",
		"El vestuario ha decidido que el míster se tiene que ir y hay una carta con firmas dando vueltas. Falta la tuya, y el despacho está a diez metros por el otro pasillo.":
			"Ruang ganti memutuskan pelatih harus pergi dan sebuah surat bertanda tangan beredar. Tinggal tanda tanganmu, dan ruangan pelatih hanya sepuluh meter di lorong sebelah.",
		"FIRMAR CON EL GRUPO": "TEKEN BERSAMA TIM",
		"AVISAR AL MÍSTER": "LAPOR PELATIH",
		"EL AÑO QUE TE QUEDA": "TAHUN TERAKHIRMU",
		"Tu agente tiene un periodista al teléfono y una frase preparada: que escuchas ofertas. Filtrarla te dobla el precio y te convierte, esta misma noche, en el que ya se fue.":
			"Agenmu sedang menelepon wartawan dan sudah siap dengan satu kalimat: kamu mendengarkan tawaran. Membocorkannya menggandakan harga dan, malam ini juga, menjadikanmu orang yang sudah pergi.",
		"DEJARLA CAER": "BOCORKAN",
		"JURAR QUE TE QUEDAS": "SUMPAH BERTAHAN",
		"LO QUE SABE EL CAPITÁN": "YANG KAPTEN TAHU",
		"Tres se saltaron la concentración y tú los viste salir. El club te pregunta a la cara, como capitán, y el vestuario entero espera en el pasillo a ver qué dices.":
			"Tiga orang melanggar jam malam dan kamu melihat mereka keluar. Klub bertanya langsung padamu sebagai kapten, dan seisi ruang ganti menunggu di lorong untuk mendengar jawabanmu.",
		"DAR LOS NOMBRES": "SEBUT NAMA",
		"TAPARLOS": "TUTUPI",
		"LA OFERTA QUE NO SE RECHAZA": "TAWARAN TAK TERTOLAK",
		"Una casa de apuestas pone medio año de sueldo por tu cara en su cartel. La grada odia esa marca —hay pancartas cada domingo— y el club firmó contra ella.":
			"Sebuah situs taruhan menawarkan gaji setengah tahun untuk wajahmu di papan reklame. Suporter membenci merek itu —ada spanduk tiap Minggu— dan klub sudah menandatangani janji menolaknya.",
		"COBRAR Y FIRMAR": "AMBIL UANGNYA",
		"DECIR QUE NO": "BILANG TIDAK",
		"EL VESTUARIO YA LO SABE": "RUANG GANTI SUDAH TAHU",
		"Pediste salir y la noticia llegó antes que tú al vestuario. Nadie te dice nada, que es peor. El capitán te espera apoyado en tu taquilla.":
			"Kamu minta pergi dan beritanya sampai ke ruang ganti lebih dulu. Tak ada yang bicara, dan itu lebih buruk. Kapten menunggu, bersandar di lokermu.",
		"NO ES ASUNTO SUYO": "URUSANKU SENDIRI",
		"LA GRADA TE CANTA": "TRIBUN BERNYANYI",
		"En el calentamiento un fondo entero te canta que te vayas ya. A la salida hay bufandas en el suelo y una cámara esperando tu cara.":
			"Saat pemanasan, satu tribun penuh bernyanyi menyuruhmu pergi sekarang juga. Di luar ada syal-syal di tanah dan kamera menunggu wajahmu.",
		"APLAUDIR AL FONDO": "BALAS TEPUKAN",
		"SALIR SIN MIRAR": "KELUAR, TUNDUK",
		"TE HAN PUESTO EN LA LISTA": "NAMAMU DI DAFTAR",
		"El club te metió en la lista de transferibles sin avisarte, y te enteraste por la prensa. Hay un micrófono delante y la pregunta ya está hecha.":
			"Klub memasukkanmu ke daftar jual tanpa memberi tahu, dan kamu tahu dari pers. Ada mikrofon di depanmu dan pertanyaannya sudah dilempar.",
		"TRAGARME EL SAPO": "TELAN SAJA",
		"CONTAR LA VERDAD": "BERKATA JUJUR",
		"LA MEDALLA DE PLATA": "MEDALI PERAK",
		"Perdiste la final. En el círculo central te cuelgan la medalla que nadie quiere, y en el túnel hay treinta micrófonos esperando a que señales a alguien.":
			"Kamu kalah di final. Di lingkaran tengah mereka mengalungkan medali yang tak diinginkan siapa pun, dan di lorong tiga puluh mikrofon menunggumu menunjuk seseorang.",
		"CULPAR AL PLANTEAMIENTO": "SALAHKAN TAKTIK",
		"SEÑALAR AL VESTUARIO": "SALAHKAN SKUAD",
		"PASAR DE LARGO SIN HABLAR": "LEWAT TANPA BICARA",
		"LA REUNIÓN DE JUNIO": "RAPAT BULAN JUNI",
		"Despacho, dos directivos y una carpeta con tu temporada abierta encima de la mesa. No cumpliste, y de aquí nadie sale hasta que la culpa tenga un nombre.":
			"Sebuah kantor, dua direksi, dan map musimmu terbuka di meja. Kamu gagal, dan tak ada yang keluar sebelum kesalahan punya nama.",
		"SEÑALAR AL TÉCNICO": "SALAHKAN PELATIH",
		"SEÑALAR A LA PLANTILLA": "SALAHKAN SKUAD",
		"FIRMAR QUE FUE TU CULPA": "AKUI ITU SALAHMU",
		"CUATRO EN CONTRA": "KEBOBOLAN EMPAT",
		"Ridículo de los que se recuerdan. La grada se quedó de pie esperando a que alguien subiera a dar la cara, y en el vestuario nadie levanta la vista del suelo.":
			"Kekalahan memalukan yang akan diingat. Tribun tetap berdiri menunggu seseorang naik dan bertanggung jawab, dan di ruang ganti tak ada yang mengangkat mata dari lantai.",
		"PEDIR PERDÓN EN CALIENTE": "MINTA MAAF SEKARANG",
		"DECIR QUE NO ES PARA TANTO": "BILANG BERLEBIHAN",
		"REVENTAR EL VESTUARIO": "SEMPROT SKUAD",
		"PERDISTE EL DERBI": "KALAH DI DERBY",
		"La ciudad es de ellos durante un año entero. En la puerta hay gente esperando el autobús del equipo, y no vienen a pedir autógrafos.":
			"Kota ini milik mereka setahun penuh. Di gerbang ada orang menunggu bus tim, dan mereka tidak datang untuk minta tanda tangan.",
		"ENCARARTE CON LA VALLA": "HADAPI SUPORTER",
		"CARGAR CONTRA EL ÁRBITRO": "SALAHKAN WASIT",
		"IRTE EN SILENCIO": "PERGI DIAM-DIAM",
		"FUERA CONTRA UN MODESTO": "TUMBANG LAWAN TIM KECIL",
		"Os echó un equipo de dos categorías más abajo, en un campo de mil personas y con el vestuario de local celebrándolo al lado del vuestro.":
			"Kalian disingkirkan tim dua divisi di bawah, di stadion seribu penonton, dengan ruang ganti tuan rumah berpesta tepat di sebelah ruang ganti kalian.",
		"DECIR QUE OS SOBRÓ CONFIANZA": "AKUI KALIAN LENGAH",
		"DEFENDER AL GRUPO CONTRA TODOS": "BELA TIM DARI SEMUA",
		"NO ABRIR LA BOCA": "TUTUP MULUT",
		"EL ESTADIO LLEVARÁ TU NOMBRE": "STADION AKAN BERNAMAMU",
		"La directiva lo anuncia en la próxima junta: quiere ponerle tu nombre al estadio. Es el honor más grande que da un club, y sólo se da una vez.":
			"Direksi akan mengumumkannya di rapat berikutnya: mereka ingin memberi namamu pada stadion. Itu kehormatan terbesar sebuah klub, dan hanya diberikan sekali.",
		"ACEPTAR EL HONOR": "PAKAI NAMAKU",
		"QUE SEA PARA TODO EL VESTUARIO": "UNTUK SELURUH SKUAD",
		"DEJARLO CON SU NOMBRE DE SIEMPRE": "PERTAHANKAN NAMA LAMA",
		"TE PONEN EL MICRO": "MIKROFON PADAMU",
		"Figura del partido. La cadena te para antes del vestuario y hay treinta segundos en directo. Lo que digas se repite toda la semana.":
			"Pemain terbaik laga. Stasiun TV menahanmu sebelum ruang ganti dan ada tiga puluh detik siaran langsung. Apa pun yang kamu ucapkan diputar ulang sepekan penuh.",
		"MÉRITO DEL EQUIPO": "BERKAT TIM",
		"HABLAR DE TU MOMENTO": "BICARA FORMAMU",
		"DEDICÁRSELO A LA GENTE": "UNTUK SUPORTER",
		"CÓMO LO CUENTAS": "CARA CERITAMU",
		"El parte ya salió y el teléfono no para. Toca decir algo sobre la baja, y cada versión tiene su precio.":
			"Laporan cedera sudah keluar dan telepon tak berhenti berdering. Harus ada yang dikatakan soal absen ini, dan tiap versi ada harganya.",
		"VOLVERÉ ANTES DE TIEMPO": "AKU KEMBALI LEBIH CEPAT",
		"SEGUIR LOS PLAZOS": "IKUTI JADWAL",
		"NO DECIR NADA": "DIAM SAJA",
		"El médico no dice plazos: dice que a tu edad una rotura así no vuelve entera. Puedes pelear la rehabilitación y volver mermado, o parar tú antes de que te paren.":
			"Dokter tak memberi jadwal: katanya di usiamu robekan seperti ini tak pernah pulih utuh. Kamu bisa berjuang lewat rehabilitasi dan kembali dengan kemampuan menurun, atau berhenti sendiri sebelum dihentikan.",
		"REHABILITARME": "REHABILITASI",
		"MÉRITO DE {0}": "JASA {0}",
	},





	"leyenda_casa": {
		"DE LA CASA": "ANDALAN",
		"Diez temporadas seguidas o más en el club. Una cesión no corta la racha.": "Sepuluh musim berturut-turut atau lebih di klub. Pinjaman tidak memutus catatan itu.",
		"Nadie lleva aún diez temporadas seguidas en {0}.": "Belum ada yang bermain sepuluh musim berturut-turut di {0}.",

		"PASARON POR AQUÍ": "PERNAH DI SINI",
		"Jugaron aquí y hoy están en otro club, los mejores primero.": "Pernah main di sini dan kini di klub lain, yang terbaik dulu.",
		"Nadie que pasara por {0} sigue en activo en otro club.": "Belum ada alumni {0} yang masih aktif di klub lain.",
		"TEMP.": "MUSIM",
		"Bandera del Club": "Andalan Klub",
		"Jugar 10 temporadas seguidas en un mismo club.": "Main 10 musim berturut-turut di klub yang sama.",
	},

	"achievements": {},





	"practice": {
		"VOLVER": "KEMBALI",
		"SALIR A MENÚ": "KE MENU",
		"EMPEZAR DE NUEVO": "ULANG DARI AWAL",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada cuenta para la carrera. Se sale con PAUSA.": "Pilih satu situasi dan ulangi sepuasnya: setiap percobaan menyusun skenario berbeda dalam tipe itu. Tidak ada yang dihitung untuk kariermu. Keluar lewat JEDA.",
		"JUEGO ABIERTO": "OPEN PLAY",
		"BALÓN PARADO": "BOLA MATI",
		"CONDUCCIÓN": "GIRINGAN",
		"Mano a mano": "Satu lawan satu",
		"Disparo frontal": "Tembakan frontal",
		"Desde lejos": "Dari jarak jauh",
		"Ángulo cerrado": "Sudut sempit",
		"Rebote en el área": "Bola liar di kotak penalti",
		"Contraataque": "Serangan balik",
		"Volea": "Voli",
		"Centro al área": "Umpan silang ke kotak",
		"Centro desde el fondo": "Silang dari garis akhir",
		"Tiro libre": "Tendangan bebas",
		"Tiro de esquina": "Tendangan sudut",
		"Penal": "Penalti",
		"Saque de banda largo": "Lemparan jauh",
		"Falta al borde del área": "Tendangan bebas tepi kotak",
		"Regate 1 contra 1": "Dribel 1 lawan 1",



		"EL CAMPO": "LAPANGAN",
		"AZOTEA": "ATAP",
		"TU ESTADIO": "STADIONMU",
		"EL TIEMPO": "CUACA",
		"SORTEO": "ACAK",


		"SOL": "CERAH",
		"NUBES": "AWAN",
		"TARDE": "SENJA",
		"LLUVIA": "HUJAN",
		"NOCHE": "MALAM",
		"NIEVE": "SALJU",
		"En la azotea siempre anochece y siempre llueve: es su hora. Juega en TU ESTADIO si quieres mandar sobre el tiempo.": "Di atap selalu senja dan selalu hujan: itu waktunya. Main di STADIONMU kalau mau mengatur cuaca.",
		"Se sortea como en un partido de verdad.": "Diundi seperti di laga sungguhan.",
		"Sin límite · no cuenta para la carrera": "Tanpa batas · tidak dihitung untuk karier",
		"Tu estadio con {0}.": "Stadionmu, {0}.",




		"Soleado": "Cerah",
		"Nublado": "Mendung",
		"Atardecer": "Senja",
		"Lluvia": "Hujan",
		"Noche": "Malam",
		"Nieve": "Salju",



		"Llovizna": "Gerimis",
		"Tormenta": "Badai",
	},















	"career_screens": {

		"TRAYECTORIA": "RIWAYAT",
		"DESDE T{0}": "SEJAK M{0}",

		"DESDE {0}": "SEJAK {0}",


		"viaLIBRE": "BEBAS",
		"viaEDITOR": "EDITOR",
		"TRASPASO": "TRANSFER",
		"FIN CESION": "PINJ. USAI",
		"COMPRADO": "DIBELI",

		"HAY UNA PARED AHI": "DINDING DI SANA",
		"PUERTAS Y VENTANAS": "PINTU & JENDELA",

		"PINO": "PINE",
		"NOGAL": "KENARI",
		"NEGRO MATE": "HITAM DOF",
		"ALUMINIO": "ALUMINIUM",
		"LATÓN": "BRASS",




		"RITMO": "RITME",
		"FALTO DE RITMO · SE PASA JUGANDO": "KURANG RITME · ATASI DENGAN MAIN",
		"EL TÉCNICO TE DA DESCANSO · LO VES DESDE LA GRADA":
			"PELATIH MENGISTIRAHATKANMU · KAMU DI TRIBUN",
		"POR DEBAJO DE {0} EMPIEZAS EN LA BANCA": "DI BAWAH {0} KAMU MULAI DI CADANGAN",




		"POR DEBAJO DE {0} NO TE CONVOCAN": "DI BAWAH {0} KAMU TAK DIPANGGIL",


		"AÑO {0} · SEM {1}/{2}": "THN {0} · MGG {1}/{2}",
		"energiaFUERA": "ABSEN",
		"energiaBANCA": "BENCH",
		"Aún no llevas {0} partidos: esta vez no cuenta.":
			"Kamu belum main {0} laga: kali ini tidak dihitung.",

		"MANTENIMIENTO": "PERAWATAN",
		"En segunda tu club abre tienda oficial: merch, y la tabla de las camisetas más vendidas del vestuario.":
			"Di divisi dua klubmu membuka toko resmi: merchandise, dan tabel jersey terlaris di ruang ganti.",
		"LAS MÁS VENDIDAS": "TERLARIS",
		"{0} AL AÑO": "{0}/TAHUN",
		"Lo que mueve cada uno de la marca del club. Vender camisetas te hace más difícil de vender a ti.":
			"Seberapa besar tiap pemain menggerakkan merek klub. Menjual jersey membuatmu lebih sulit dijual.",
		"JUGADOR": "PEMAIN",
		"CUOTA": "PORSI",

		"TUS TEMPORADAS": "MUSIMMU",
		"AÑO": "THN",
		"{0}º de {1}": "ke-{0} dari {1}",
		"Tu dorsal, el {0}, se elige al fichar o al renovar.":
			"Nomormu, {0}, dipilih saat teken atau perpanjang kontrak.",
		"A la espalda: {0}": "Di punggung: {0}",
		"GOL DE PENAL EN LIGA": "GOL PENALTI DI LIGA",
		"GOL DE PENAL EN {0}": "GOL PENALTI DI {0}",

		"Tu media es {0}. Con la vara de {1} son {2}, y ése es el número que se mide contra la lista.":
			"OVR-mu {0}. Dengan ukuran {1} jadi {2}, dan itulah angka yang diukur terhadap daftar.",
		"Y el seleccionador te apunta {0} por lo de fuera del campo, así que la lista te lee {1}.":
			"Dan pelatih timnas menambahkan {0} untuk urusan di luar lapangan, jadi di daftar kamu bernilai {1}.",
		"Tu país no tiene liga propia: eres su estrella indiscutible.":
			"Negaramu tak punya liga sendiri: kamu bintang yang tak tergantikan.",
		"Te faltan {0} puntos para entrar en la convocatoria.":
			"Kurang {0} poin lagi untuk masuk skuad timnas.",
		"Aún no entras en la convocatoria.": "Kamu belum masuk skuad timnas.",
		"Sin nacionalidad: no hay selección que disputar.":
			"Tanpa kewarganegaraan: tak ada timnas untuk dibela.",
		"{0} · {1} CANDIDATOS": "{0} · {1} KANDIDAT",
		"DORSAL {0}": "NOMOR {0}",
		"1-{0} ONCE": "1-{0} INTI",
		"{0}-{1} BANCA": "{0}-{1} BENCH",
		"El suelo, la pared y la carpintería, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.": "Lantai, dinding, dan kusen sesuai seleramu. Dibeli satuan dan jadi milikmu: ganti kapan saja.",
		"MUDARSE": "PINDAH",
		"El terreno crece a {0}×{0} m y todo lo que construiste se queda.": "Lahan membesar jadi {0}×{0} m dan semua yang kamu bangun tetap ada.",
		"La casa más grande que se vende, y una planta hecha a la medida.": "Rumah terbesar yang dijual, dengan denah sesuai ukuran.",
		"Todo lo que construiste se queda.": "Semua yang kamu bangun tetap ada.",
		"Ya vives en la mejor casa: no hay ninguna encima.": "Kamu sudah tinggal di rumah terbaik: tak ada yang lebih tinggi.",
		"PRECIO": "HARGA",

		"PONER VENTANA": "BUAT JENDELA",
		"PUERTA DOBLE": "PINTU GANDA",
		"PONER ARCO": "BUAT ARKADE",
		"PONER VENTANAL": "JENDELA LEBAR",
		"PONER OJO DE BUEY": "JENDELA BULAT",
		"DOBLE": "GANDA",
		"ARCADA": "ARKADE",
		"VENTNL": "LEBAR",
		"OJO": "OVAL",
		"QUITAR VENTANA": "TUTUP JENDELA",
		"VENTAN": "JENDEL",
		"TAPIAR": "TEMBOK",

		"VACIAR": "KOSONG",
		"PUESTOS": "PASANG",
		"TABIQUES": "DINDING",
		"PINTADO": "DICAT",
		"TIRADOS": "DIBONGKAR",
		"DESPINTADO": "DIKUPAS",
		"MANTEN PARA GUARDAR TODO": "TAHAN UNTUK SIMPAN SEMUA",
		"MANTEN PARA DEJARLO LIMPIO": "TAHAN UNTUK KOSONGKAN",
		"MANTEN PARA ARRASAR": "TAHAN UNTUK RATAKAN",
		"PLANOS": "DENAH",
		"Cuartos ya repartidos, con sus puertas puestas.": "Kamar sudah dibagi, lengkap dengan pintunya.",
		"Este terreno es demasiado chico para repartirlo en cuartos.": "Lahan ini terlalu kecil untuk disekat jadi kamar.",
		"LO QUE SE VA": "YANG HILANG",
		"El plano REEMPLAZA tu casa: tira tus paredes, borra la pintura y recoge tus muebles al inventario.": "Denah MENGGANTI rumahmu: dindingmu dirobohkan, cat dihapus, dan perabotmu masuk ke penyimpanan.",
		"PAREDES QUE HAY": "DINDING KINI",
		"Aplicar un plano las tira todas y pone las suyas.": "Menerapkan denah merobohkan semuanya dan memasang dinding miliknya.",
		"DOS AMBIENTES": "DUA RUANG",
		"Un muro con puerta: día de un lado, noche del otro.": "Satu dinding berpintu: siang di satu sisi, malam di sisi lain.",
		"DOS RECÁMARAS": "DUA KAMAR",
		"TRES CUARTOS Y BAÑO": "TIGA KAMAR & KM",
		"Añade un baño en la esquina de la entrada.": "Menambah kamar mandi di sudut pintu masuk.",
		"Dos cuartos al fondo, con su puerta cada uno, y el salón al frente.": "Dua kamar di belakang, masing-masing berpintu, dan ruang tamu di depan.",
		"CUATRO CUARTOS": "EMPAT KAMAR",
		"Cocina aparte, salón al frente y dos cuartos al fondo.": "Dapur sendiri, ruang tamu di depan dan dua kamar di belakang.",
		"PASILLO Y CUATRO CUARTOS": "LORONG & EMPAT KAMAR",
		"Un pasillo desde la puerta, dos cuartos por lado y el salón al fondo.": "Lorong dari pintu, dua kamar tiap sisi dan ruang tamu di belakang.",
		"{0} cuartos": "{0} kamar",
		"O YA AMUEBLADA": "ATAU SIAP HUNI",





		"rotANULAR": "BATAL",
		"rotDESHAZ": "UNDO",
		"rotCERRAR": "TUTUP",
		"rotGIRAR": "PUTAR",
		"rotMOVER": "GESER",
		"rotOTRO": "LAIN",
		"rotPINTAR": "CAT",
		"rotPLANOS": "DENAH",
		"rotQUITAR": "LEPAS",
		"rotTAPAR": "SEGEL",
		"rotTAPIAR": "TEMBOK",
		"rotTAPONA": "HALANG",
		"rotTIRAR": "ROBOH",
		"rotTRAMO": "RUAS",
		"rotVACIAR": "KOSONG",
		"rotVENTAN": "JENDEL",
		"En este plano no cabe el juego de muebles completo.": "Di denah ini set perabot lengkap tak muat.",
		"Llega con {0} muebles ya puestos en su sitio.": "Datang dengan {0} perabot yang sudah terpasang.",
		"Sueltos costarían {0}": "Satuan harganya {0}",
		"AMUEBLADA": "LENGKAP",
		"Calculando la oferta…": "Menghitung tawaran…",
		"COMPRAR AMUEBLADA · {0}": "BELI LENGKAP · {0}",
		"PAGASTE": "DIBAYAR",
		"Y de paso te acomodamos {0} muebles que ya tenías guardados.": "Sekalian kami merapikan {0} perabot yang sudah kamu simpan.",
		"Muévelo todo si quieres: la casa ya es tuya y nada está clavado.": "Geser semuanya kalau mau: rumah sudah milikmu dan tak ada yang dipaku mati.",
		"MANTEN PARA PONER ESTE PLANO": "TAHAN UNTUK PAKAI DENAH INI",
		"Tira TAMBIÉN el cascarón y las paredes de fábrica. Queda el terreno con su piso.": "Juga merobohkan kerangka dan dinding bawaan. Lahan tetap dengan lantainya.",
		"Ni muebles, ni paredes, ni pintura: este terreno ya está pelado.": "Tanpa perabot, dinding, atau cat: lahan ini sudah polos.",
		"{0} paredes": "{0} dinding",
		"PLANO": "DENAH",
		"Muévelas, tíralas o ábreles más puertas: ahora son tuyas.": "Geser, robohkan, atau tambah pintu: sekarang semuanya milikmu.",
		"MARCOS DE TODA LA CASA": "KUSEN SELURUH RUMAH",
		"Puertas, ventanas, corredizas, rodapiés y remates.": "Pintu, jendela, pintu geser, plint, dan list.",
		"PONER CORREDIZA": "BUAT PINTU GESER",
		"QUITAR CORREDIZA": "LEPAS PINTU GESER",
		"PARED CORTA": "DINDING PENDEK",
		"CORRED": "SORONG",
		"CORTA": "KECIL",
		"TAPAR": "SEGEL",
		"YA ESTA PELADO": "SUDAH POLOS",
		"TIRAR TODO EL TRAMO": "BONGKAR SEMUA",
		"NO HAY NADA PUESTO": "KOSONG",
		"YA ESTA LIMPIO": "SUDAH BERSIH",
		"Recoge tus muebles al inventario. Las paredes y la pintura se quedan.": "Perabotmu kembali ke inventaris. Dinding dan cat tetap ada.",
		"Además tira tus tabiques, cierra los boquetes y borra la pintura del suelo.": "Dinding sekatmu juga dirobohkan, lubang ditutup, dan cat lantai dihapus.",
		"Nada se pierde: todo lo que compraste sigue en tu inventario.": "Tak ada yang hilang: semua yang kamu beli tetap ada di inventaris.",
		"Esta planta ya está vacía: todo lo tuyo está en el inventario.": "Lantai ini sudah kosong: semua milikmu ada di inventaris.",
		"Ni muebles puestos, ni tabiques tuyos, ni pintura: no hay nada que quitar.": "Tak ada perabot terpasang, sekat buatanmu, atau cat: tak ada yang bisa dilepas.",
		"YA ESTA": "SELESAI",
		"A CAJAS": "DIKEMAS",
		"VALOR DE MERCADO": "NILAI PASAR",
		"TU SITIO EN EL EQUIPO": "TEMPATMU DI TIM",
		"ROL DE CONTRATO": "PERAN KONTRAK",
		"PRÓXIMO PARTIDO": "LAGA BERIKUT",
		"{0} · ~{1} MIN": "{0} · ~{1} MNT",
		"ÚLTIMO PARTIDO": "LAGA TERAKHIR",
		"{0} MIN · {1}": "{0} MNT · {1}",
		"NO JUGASTE": "TAK MAIN",
		"FORMA · {0}": "FORM · {0}",
		"MEDIA TEMPORADA": "RATING MUSIM",
		"MEDIA CARRERA": "RATING KARIER",
		"HABILIDADES · {0} PUNTOS": "SKILL · {0} POIN",
		"HABILIDADES · TODO AL TOPE": "SKILL · SEMUA MAKS",
		"Ya no queda nada que subir: los puntos que ganes se convierten en experiencia.": "Tak ada lagi yang bisa dinaikkan: poin yang kamu raih jadi pengalaman.",
		"Penales": "Penalti",
		"Tiros libres y córners": "Tendangan bebas dan korner",
		"{0}: los lanzas TÚ": "{0}: KAMU yang menendang",
		"{0}: los lanza {1} — tú cobras ~{2} de cada 10":
			"{0}: {1} yang menendang — kamu dapat ~{2} dari 10",
		"{0}: los lanza {1} — supéralo para quitárselos":
			"{0}: {1} yang menendang — kalahkan dia untuk merebutnya",
		"SU NIVEL": "LEVELNYA",
		"TU NIVEL": "LEVELMU",
		"TÚ COBRAS": "JATAHMU",
		"En racha (+{0})": "Sedang bagus (+{0})",
		"En baja ({0})": "Sedang turun ({0})",
		"Estable": "Stabil",



		"Potencia": "Kekuatan",
		"Precisión": "Akurasi",
		"Efecto": "Efek",
		"Visión": "Visi",
		"Físico": "Fisik",
		"Velocidad": "Kecepatan",
		"Aceleración": "Akselerasi",
		"Regate": "Dribel",
		"Balón parado": "Bola mati",


		"Pegada": "Tendangan keras",
		"Puntería": "Penyelesaian",
		"Rosca": "Lengkung",
		"Cabeza": "Sundulan",

		"Reflejos": "Refleks",
		"Entrada": "Tekel",
		"{0} · MEDIA {1}": "{0} · OVR {1}",
		"TE PELEA EL PUESTO": "MENGINCAR TEMPATMU",
		"VER PLANTEL": "LIHAT SKUAD",



		"La velocidad a la que sale el balón de tu pie. Sólo la entregas entera si le pegas al empeine.":
			"Kecepatan bola lepas dari kakimu. Tenaga penuh hanya keluar kalau kamu menendang dengan punggung kaki.",
		"Cuánto respeta el balón la línea que trazaste. Cierra el abanico de error del apuntador.":
			"Seberapa setia bola mengikuti garis yang kamu tarik. Mempersempit sebaran meleset bidikanmu.",
		"Cuánto comba el balón en el aire. También es el toque con el que conduces en el regate.":
			"Seberapa melengkung bola di udara. Juga sentuhan saat kamu menggiring bola dalam dribel.",
		"Desde 85 ves dibujada la línea de fuera de juego. El árbitro la pita igual sin ella.":
			"Mulai 85 kamu bisa melihat garis offside di lapangan. Wasit tetap meniupnya tanpa garis itu.",
		"Lo rápido que corres con el balón en el regate: si eres lento te la quitan, si eres rápido no te alcanzan. No toca el tiro.":
			"Secepat apa kamu lari membawa bola saat dribel: kalau lambat bola direbut, kalau cepat tak terkejar. Tak memengaruhi tembakan.",
		"Qué tan rápido llegas a tu velocidad máxima: el arranque, el frenazo y la marcha atrás al conducir.":
			"Secepat apa kamu mencapai kecepatan puncak: start, rem, dan putar balik saat menggiring.",
		"Tu control del balón en carrera: el quiebre sin perder velocidad y a qué distancia te lo pueden robar.":
			"Kontrol bolamu saat berlari: belok tanpa kehilangan laju dan seberapa dekat lawan bisa merebutnya.",
		"DE PARADO A TU MÁXIMA EN {0} S": "DIAM KE MAKS DALAM {0} S",
		"TE ROBAN A {0} CM DEL BALÓN": "DIREBUT DARI {0} CM",
		"Cada punto sobre el lanzador de tu equipo te da más penales. NO cuenta para tu media.":
			"Tiap poin di atas penendang timmu memberimu lebih banyak penalti. TIDAK dihitung ke OVR-mu.",
		"Cada punto sobre el lanzador de tu equipo te da más faltas y córners. NO cuenta para tu media.":
			"Tiap poin di atas penendang timmu memberimu lebih banyak tendangan bebas dan korner. TIDAK dihitung ke OVR-mu.",
		"TU TIRO: {0} KM/H": "TEMBAKAN: {0} KM/H",
		"TU CABEZAZO: {0} KM/H": "SUNDULANMU: {0} KM/H",
		"A {0} M EL BALÓN SALE DENTRO DE ±{1} CM": "DI {0} M BOLA JATUH DALAM ±{1} CM",
		"SIN ABANICO: EL BALÓN VA POR DONDE APUNTAS": "TANPA SEBARAN: BOLA KE ARAH BIDIKANMU",
		"COMBA ×{0}": "EFEK ×{0}",
		"VES LA LÍNEA DE FUERA DE JUEGO EN LA CANCHA": "GARIS OFFSIDE TAMPAK DI LAPANGAN",
		"TE FALTAN {0} PARA VER LA LÍNEA DE FUERA DE JUEGO": "KURANG {0} UNTUK GARIS OFFSIDE",
		"CORRES A {0} M/S · EL DEFENSA MÁS RÁPIDO, {1}":
			"LARIMU {0} M/S · BEK TERCEPAT, {1}",
		"LOS COBRAS TODOS": "SEMUA JATAHMU",
		"COBRAS {0} DE CADA 10": "JATAHMU {0} DARI 10",
		"DESHACER": "URUNGKAN",
		"PUNTO DEVUELTO · {0}": "POIN KEMBALI · {0}",
		"Al salir del perfil, lo repartido queda firmado.":
			"Saat keluar dari profil, poin yang kamu bagi jadi permanen.",
		"ESPORÁDICO": "PELAPIS",
		"ROTACIÓN": "ROTASI",

		"MEDIA {0}": "RATING {0}",
		"MEDIA {0} EN {1} JORNADAS": "RATING {0} DALAM {1} PEKAN",
		"{0} de {1} · {2}/{3} jornadas": "{0} dari {1} · {2}/{3} pekan",
		"JUGAR {0} JORNADAS": "MAIN {0} PEKAN",
		"JUGAR {0} JORNADAS DE {1}' O MÁS": "MAIN {0} PEKAN, {1}' ATAU LEBIH",
		"{0} GOLES": "{0} GOL",
		"CONTRATO": "KONTRAK",
		"Club: {0} ({1})": "Klub: {0} ({1})",
		"Sueldo: ${0} por partido": "Gaji: ${0} per laga",
		"Temporadas restantes: {0}": "Sisa musim: {0}",
		"tu club": "klubmu",
		"CEDIDO · el contrato es con {0}": "DIPINJAMKAN · kontrakmu dengan {0}",
		"Mantenimiento del estilo de vida: -${0} por partido":
			"Biaya gaya hidup: -${0} per laga",
		"OBJETIVO DE TEMPORADA": "TARGET MUSIM",

		"CLÁUSULA PERSONAL": "KLAUSUL PRIBADI",
		"Sin cláusula. Una condición con dientes a cambio de renunciar a las otras.":
			"Tanpa klausul. Satu syarat yang tegas, ditukar dengan melepas klausul lain.",
		"ANTI-DESCENSO": "ANTI-DEGRADASI",
		"Si el club baja de categoría, quedas AGENTE LIBRE.":
			"Jika klub degradasi, kamu jadi PEMAIN BEBAS.",
		"PROMESA DE TITULARIDAD": "JANJI JADI INTI",
		"Si juegas pocos partidos esta temporada, quedas AGENTE LIBRE.":
			"Jika kamu jarang main musim ini, kamu jadi PEMAIN BEBAS.",
		"NO A UN RIVAL": "TOLAK RIVAL",
		"Tu club no puede venderte a tu rival de siempre.":
			"Klubmu tak boleh menjualmu ke rival abadimu.",
		"ELEGIR CLÁUSULA": "PILIH KLAUSUL",
		"CAMBIAR CLÁUSULA": "GANTI KLAUSUL",
		"La cláusula se pacta al arranque de la temporada.":
			"Klausul disepakati di awal musim.",
		"Sólo una a la vez. Se pacta al arranque de la temporada.":
			"Hanya boleh satu. Disepakati di awal musim.",
		"SIN CLÁUSULA": "NOL KLAUSUL",
		"CLÁUSULA PACTADA": "KLAUSUL AKTIF",
		"ES TU RIVAL: tu CLÁUSULA impide que acabes aquí.":
			"RIVALMU: KLAUSUL-mu mencegahmu berakhir di sini.",
		"CLÁUSULA ANTI-DESCENSO: el club bajó y quedas AGENTE LIBRE.":
			"KLAUSUL ANTI-DEGRADASI: klub turun kasta dan kamu jadi PEMAIN BEBAS.",
		"PROMESA DE TITULARIDAD incumplida ({0} partidos): quedas AGENTE LIBRE.":
			"JANJI JADI INTI dilanggar ({0} laga): kamu jadi PEMAIN BEBAS.",

		"PACTAR OBJETIVO": "SEPAKATI TARGET",
		"PACTAR EL OBJETIVO": "SEPAKATI TARGET",
		"Más exigente paga más prima; más cómodo, menos. Se pacta una vez, al arranque de la temporada.":
			"Lebih berat, bonus lebih besar; lebih ringan, lebih kecil. Disepakati sekali, di awal musim.",
		"CÓMODO": "RINGAN",
		"COMO ESTÁ": "STANDAR",
		"EXIGENTE": "BERAT",
		"OBJETIVO PACTADO": "TARGET AKTIF",
		"Ya pactaste tu objetivo esta temporada.": "Kamu sudah menyepakati targetmu musim ini.",
		"top {0}": "top {0}",
		"{0} asist.": "{0} ast.",
		"{0} part.": "{0} laga",
		"nota {0}": "rating {0}",
		"{0} goles": "{0} gol",
		"RENOVAR CONTRATO": "PERPANJANG",


		"LA OFERTA DEL CLUB": "TAWARAN KLUB",
		"AÑOS QUE OFRECEN": "TAHUN TAWARAN",
		"NINGUNO": "TAK ADA",
		"SUELDO NUEVO": "GAJI BARU",


		"EQUILIBRIO": "SEIMBANG",
		"MÁS AÑOS": "PANJANG",
		"LIBERTAD": "BEBAS",
		"PRIMA DE FIRMA": "BONUS TEKEN",
		"CLÁUSULA": "KLAUSUL",
		"Cobras $ {0} de prima al firmar.": "Kamu kantongi $ {0} bonus saat teken.",
		"Cláusula baja: si un club la paga, el tuyo no puede negarse.":
			"Klausul rendah: kalau klub lain membayarnya, klubmu tak bisa menolak.",
		"Cláusula en $ {0}: quien la pague, te lleva.":
			"Klausul $ {0}: siapa pun yang membayarnya bisa membawamu.",

		"BANDERA":
			"IKON",
		"Tu grada frena tu venta: cobras más y el club te blinda con una cláusula un {0} % más alta.":
			"Suportermu menahan penjualanmu: gajimu naik dan klub mengunci kamu dengan klausul {0} % lebih tinggi.",
		"Cláusula en $ {0}: tu grada frena tu venta.":
			"Klausul $ {0}: suportermu menahan penjualanmu.",
		"Aceptaste salir: tu grada ya no te quiere y el club te ofrece a quien pregunte, más barato. Sigues jugando mientras llega tu destino.":
			"Kamu setuju pergi: suportermu tak lagi menginginkanmu dan klub menawarkanmu ke siapa pun yang bertanya, lebih murah. Kamu tetap main sampai tujuanmu datang.",
		"TU GRADA TE QUIERE FUERA":
			"SUPORTER MAU KAMU PERGI",
		"Negarte no te cuesta nada: el club no necesita tu dinero, necesita que dejen de pitarte. Si aceptas, te venden más barato.":
			"Menolak tak merugikanmu: klub tak butuh uangmu, klub butuh suporter berhenti mencemoohmu. Kalau setuju, kamu dijual lebih murah.",
		"Te quedas, y en el vestuario nadie te lo reprocha. La grada no cambia sola: esa hay que ganársela en el campo.":
			"Kamu bertahan, dan di ruang ganti tak ada yang menyalahkanmu. Suporter tak berubah sendiri: kamu harus merebut mereka kembali di lapangan.",
		"Te sientan en el vestuario con el director deportivo. En {0} la grada ya no te quiere y el club la escucha: te ofrecen a quien pregunte, y más barato. Si te quedas, nadie aquí dentro te lo reprocha.":
			"Kamu didudukkan di ruang ganti bersama direktur olahraga. Di {0} suporter tak lagi menginginkanmu dan klub mendengarkan: kamu ditawarkan ke siapa pun yang bertanya, dan lebih murah. Kalau kamu bertahan, tak ada yang menyalahkanmu di sini.",

		"La ficha sale de: {0}": "Gajimu ditentukan oleh: {0}",
		"tu nivel": "levelmu",
		"tu prestigio": "prestisemu",
		"tus títulos": "gelarmu",
		"tu afición": "suportermu",
		"tus récords": "rekormu",
		"su interés": "minat mereka",
		"tu temporada": "musimmu",
		"Quedan {0} · al firmar tendrías {1} en total":
			"Sisa {0} · setelah teken totalnya jadi {1}",
		"Tu sueldo {0} de $ {1} a $ {2} por partido":
			"Gajimu {0} dari ${1} jadi ${2} per laga",
		"sube": "naik",
		"baja": "turun",
		"Te renuevan con el mismo sueldo.": "Kamu diperpanjang dengan gaji yang sama.",
		"Te firman como {0}": "Kamu dikontrak sebagai {0}",
		"Por tu temporada: {0}{1}% sobre el sueldo":
			"Berkat musimmu: gaji {0}{1}% sesuai performa",
		"Es el techo salarial del club: no pueden pagar más.":
			"Itu batas gaji klub: mereka tak bisa membayar lebih.",
		"Negocian sobre tu ficha actual: nadie da más salto en una firma.": "Mereka bernegosiasi dari gajimu sekarang: tak ada kenaikan lebih besar dalam sekali teken.",
		"¿RENOVAR?": "LANJUT?",
		"{0} años más (tendrías {1}) y ficha de $ {2} por partido.":
			"{0} tahun lagi (jadi {1}) dengan gaji ${2} per laga.",
		"Es MENOS de lo que cobras ahora.": "Itu LEBIH KECIL dari gajimu sekarang.",


		"CONTRATO RENOVADO": "DIPERPANJANG",


		"SOLO EN TU ÚLTIMO AÑO": "HANYA TAHUN TERAKHIR",
		"EL TÉCNICO NO RENUEVA": "PELATIH MENOLAK",




		"RENEGOCIAR": "NEGO ULANG",
		"PEDIR RENEGOCIACIÓN": "MINTA NEGO ULANG",
		"LO QUE PUEDES PEDIR": "YANG BISA DIMINTA",
		"AÑOS QUE SUMAS": "TAMBAH TAHUN",
		"PRIMAS PACTADAS": "BONUS DISETUJUI",
		"MESA DE CONTRATO": "MEJA NEGO",
		"CONTRATO MEJORADO": "KONTRAK NAIK",
		"Tu sueldo sube de $ {0} a $ {1} por partido":
			"Gajimu naik dari ${0} jadi ${1} per laga",
		"Te reconocen como {0}": "Kamu diakui sebagai {0}",
		"Por tu temporada: +{0}% sobre el sueldo": "Berkat musimmu: gaji +{0}% sesuai performa",
		"Sueldo: $ {0} → $ {1} (+$ {2})": "Gaji: ${0} → ${1} (+${2})",
		"Años: +{0} (tendrías {1})": "Tahun: +{0} (jadi {1})",
		"Prima por gol: +$ {0}": "Bonus gol: +${0}",
		"Prima por asistencia: +$ {0}": "Bonus assist: +${0}",
		"Rol: te reconocen como {0}": "Peran: diakui sebagai {0}",
		"Para renegociar antes: {0}": "Untuk nego ulang lebih awal: {0}",


		"Eres agente libre: negocia con un club nuevo.":
			"Kamu pemain bebas: negosiasi dengan klub baru.",
		"Estás cedido: tu contrato lo lleva el club dueño.":
			"Kamu dipinjamkan: kontrakmu dipegang klub pemilik.",
		"Ya firmaste un precontrato con otro club.":
			"Kamu sudah prakontrak dengan klub lain.",
		"El club te dio por perdido; no hay mesa.":
			"Klub sudah menyerah padamu; tak ada meja nego.",
		"Pediste salir: arréglalo con el club antes de negociar.":
			"Kamu minta pergi: selesaikan dulu dengan klub sebelum bernegosiasi.",
		"Es tu último año: el club ya te ofrece renovar.":
			"Ini tahun terakhirmu: klub sudah menawarkan perpanjangan.",
		"Acabas de firmar: cumple una temporada antes de pedir mejora.":
			"Kamu baru teken: jalani satu musim dulu sebelum minta lebih.",
		"Te queda mucho contrato: el club no tiene por qué moverlo.":
			"Kontrakmu masih panjang: klub tak punya alasan mengubahnya.",
		"El club no negocia fichas con el mercado cerrado.":
			"Klub tak membahas gaji saat bursa tutup.",
		"El club no se sentó contigo este año. Vuelve la temporada que viene.":
			"Klub tak mau duduk bersamamu tahun ini. Kembali musim depan.",
		"FIRMAR LA MEJORA":
			"TEKEN UPGRADE",
		"El club ya cuenta con tu salida: no te convoca.":
			"Klub sudah memperhitungkan kepergianmu: kamu tak dipanggil.",
		"Renueva o busca club, o no juegas.":
			"Perpanjang atau cari klub, atau kamu tak main.",
		"Una bala al año. Si fallas, esperas.":
			"Satu peluang setahun. Gagal, kamu menunggu.",
		"PEDIR MESA AL CLUB":
			"MINTA KLUB NEGO",
		"SE SIENTAN":
			"MAU NEGO",
		"Se sientan contigo un {0}% de las veces. Si dicen que no, no habrá mesa esta temporada.":
			"Peluang mereka mau nego: {0}% dari tiap permintaan. Kalau menolak, tak ada meja nego musim ini.",
		"PEDIR MESA":
			"MINTA NEGO",
		"SE SIENTAN CONTIGO":
			"MEREKA MAU NEGO",
		"NO HAY MESA ESTE AÑO":
			"NEGO TUTUP TAHUN INI",
		"Ya renegociaste esta temporada. Vuelve el año que viene.":
			"Kamu sudah nego ulang musim ini. Kembali tahun depan.",
		"Aún no jugaste lo suficiente esta temporada.":
			"Kamu belum cukup bermain musim ini.",
		"Sube tu media a {0} para sentarte a negociar.":
			"Naikkan rata-rata ratingmu ke {0} untuk duduk bernegosiasi.",
		"Gánate al técnico antes de pedir mejora.":
			"Raih hati pelatih dulu sebelum minta lebih.",
		"EN EL ESCAPARATE": "DIPAJANG",
		"No renuevas: el club te vende y juegas menos hasta que salgas.":
			"Kamu tak memperpanjang: klub menjualmu dan kamu main lebih jarang sampai pergi.",
		"Busca una salida en el MERCADO, o aguanta el año y quedarás AGENTE LIBRE al"
		+ " final.":
			"Cari jalan keluar di BURSA, atau bertahan setahun dan jadi PEMAIN BEBAS di akhir.",
		"NO RENOVAR": "TAK LANJUT",
		"¿NO RENOVAR?": "TAK LANJUT?",
		"El club te pondrá en venta para no perderte gratis. Si no sales, jugarás menos"
		+ " el resto del año. Si aguantas, quedarás libre al final.":
			"Klub akan menjualmu daripada kehilangan kamu gratis. Kalau tak pergi, kamu main lebih jarang sampai akhir tahun. Kalau bertahan, kamu bebas di akhir.",
		"NO RENUEVO": "TAK LANJUT",
		"NO RENUEVAS · EL CLUB TE VENDE": "TAK LANJUT · KLUB MENJUALMU",
		"EL CLUB TE VENDE": "KLUB MENJUALMU",
		"EL FINAL": "AKHIR",
		"Los años ya pesan. Puedes seguir peleando... o cerrar la carrera y entrar en"
		+ " la historia con lo que ganaste.":
			"Usia mulai terasa. Kamu bisa terus berjuang... atau menutup karier dan masuk sejarah dengan apa yang kamu menangkan.",
		"Juegues lo que juegues, a los {0} años se acaba: te queda {1} temporada.": "Sebanyak apa pun kamu main, di usia {0} semua berakhir: sisa {1} musim.",
		"Juegues lo que juegues, a los {0} años se acaba: te quedan {1} temporadas.":
			"Sebanyak apa pun kamu main, di usia {0} semua berakhir: sisa {1} musim.",
		"COLGAR LAS BOTAS": "GANTUNG SEPATU",
		"MEJOR NO": "NANTI SAJA",
		"¿COLGAR LAS BOTAS?": "GANTUNG SEPATU?",
		"Se acaba de verdad: no hay más partidos. Tu legado, tu vitrina y tu historia"
		+ " quedan guardados para siempre.":
			"Ini benar-benar akhir: tak ada laga lagi. Legacy, lemari trofi, dan ceritamu tersimpan selamanya.",
		"ME RETIRO": "PENSIUN",
		"MANTÉN PARA RETIRARTE": "TAHAN UNTUK PENSIUN",
		"AÚN ME QUEDA FÚTBOL": "MASIH SANGGUP MAIN",
		"Termina {0} o mejor en la liga.": "Finis di posisi {0} atau lebih baik di liga.",
		"La liga aún no arranca.": "Liga belum mulai.",
		"Vas {0}{1}": "Posisimu: {0}{1}",
		"sin clasificar": "belum ada peringkat",
		"Da {0} asistencias  (llevas {1})": "Buat {0} assist  (sudah {1})",
		"Marca {0} goles  (llevas {1})": "Cetak {0} gol  (sudah {1})",
		"TU VALOR": "NILAIMU",
		"TE PIDEN": "HARGA",
		"EN LISTA": "DIJUAL",
		"CONTRATO CORTO": "KONTRAK PENDEK",
		"Tu agente está en {0}: te consigue {1} oferta(s) por ventana.":
			"Agenmu ada di {0}: dia carikan {1} tawaran per bursa.",
		"LOS OJEADORES": "PENCARI BAKAT",
		"Un club mira tres cosas y te juzga por la más floja. Para que te busque un"
		+ " grande, tienes que ser bueno en las tres.":
			"Klub melihat tiga hal dan menilaimu dari yang paling lemah. Supaya klub besar mengincarmu, kamu harus bagus di ketiganya.",
		"Fama": "Ketenaran",
		"Que te conozcan: prensa y afición.": "Dikenal: pers dan suporter.",
		"Nivel": "Level",
		"Tus habilidades frente a la élite.": "Skill-mu dibanding para elite.",
		"Forma": "Performa",
		"Tu media de la temporada: {0}.": "Rating musimmu: {0}.",
		"Verano: fechas 1 a {0}. Invierno: {1} a {2}. Hoy es la {3}.":
			"Musim panas: pekan 1 sampai {0}. Musim dingin: {1} sampai {2}. Sekarang pekan {3}.",
		"TU CLUB TE VENDE": "KLUBMU MENJUALMU",
		"Dijiste que no renuevas: el club te ofrece para no perderte gratis. Mientras"
		+ " no salgas, juegas menos. Elige una salida:":
			"Kamu bilang tak akan memperpanjang: klub menawarkanmu agar tak kehilanganmu gratis. Selama belum pergi, kamu main lebih jarang. Pilih jalan keluar:",
		"ESTÁS EN VENTA": "KAMU DIJUAL",
		"Aceptaste salir: el club te ofrece a quien pregunte para hacer caja. Sigues"
		+ " jugando mientras llega tu destino.":
			"Kamu setuju pergi: klub menawarkanmu ke siapa pun yang bertanya untuk menambah kas. Kamu tetap main sampai tujuanmu datang.",
		"ULTIMO DIA · mañana se cierra": "HARI TERAKHIR · besok tutup",
		"Cierra en {0} jornadas. Lo que hagas en el campo mueve las ofertas: hay clubes"
		+ " que entran y clubes que se van.":
			"Tutup dalam {0} pekan. Penampilanmu di lapangan menggerakkan tawaran: ada klub yang masuk, ada yang mundur.",
		"Nadie ha preguntado por ti. Rinde y hazte ver.":
			"Belum ada yang menanyakanmu. Tampil bagus dan curi perhatian.",


		"FICHAJES": "TRANSFER",
		"RECIENTES": "TERBARU",
		"MAS CAROS": "TERMAHAL",
		"MUNDO": "DUNIA",
		"MI JUGADOR": "PEMAINKU",
		"DIVISION": "DIVISI",
		"TU LIGA": "LIGAMU",
		"Ningún movimiento en tu liga todavía.": "Belum ada pergerakan di ligamu.",


		"Tu vestuario sigue igual: ni una alta ni una baja.":
			"Ruang gantimu tetap sama: tak ada yang masuk, tak ada yang keluar.",
		"Sin club: nadie entra ni sale de un vestuario que no tienes.":
			"Tanpa klub: tak ada yang masuk atau keluar dari ruang ganti yang tak kamu punya.",
		"El mercado todavía no se ha movido.": "Bursa belum bergerak.",
		"EN TU VESTUARIO": "DI TIMMU",
		"MANTÉN · TRASPASO": "TAHAN · TRANSFER",
		"MANTÉN · CESIÓN": "TAHAN · PINJAM",
		"VENDIDO": "TERJUAL",
		"LLEGA": "MASUK",
		"SE VA": "KELUAR",
		"DEJA EL CLUB": "KELUAR KLUB",



		"{0} ALTA": "{0} MASUK",
		"{0} ALTAS": "{0} MASUK",
		"{0} BAJA": "{0} OUT",
		"{0} BAJAS": "{0} OUT",
		"De {0} a {1}": "Dari {0} ke {1}",
		"Cedido de {0} a {1}": "Dipinjamkan dari {0} ke {1}",
		"Deja {0}": "Meninggalkan {0}",
		"LIBRE": "BEBAS",
		"ERES AGENTE LIBRE": "KAMU PEMAIN BEBAS",
		"Tu contrato terminó. Fichas SIN traspaso (Bosman): el club se ahorra el fee y"
		+ " una parte es tu PRIMA de fichaje. El rol que te espera se dice antes de firmar"
		+ " — elige con cabeza.":
			"Kontrakmu habis. Kamu teken TANPA biaya transfer (Bosman): klub hemat fee dan sebagian jadi BONUS teken untukmu. Peran yang menantimu disebut sebelum teken — pilih dengan bijak.",
		"Tu valor: $ {0}": "Nilaimu: $ {0}",
		"Ningún club por ahora. Vuelve a intentarlo más tarde.":
			"Belum ada klub saat ini. Coba lagi nanti.",
		"{0} OPCIONES A TU NIVEL": "{0} PILIHAN SESUAI LEVEL",
		"TU CLUB QUIERE RETENERTE": "KLUBMU MAU MENAHANMU",
		"Te mejora el contrato para que te quedes:":
			"Klub memperbaiki kontrakmu agar kamu bertahan:",
		"Sueldo: ${0} por partido (ahora ${1})": "Gaji: ${0} per laga (sekarang ${1})",
		"Contrato: {0} temporadas": "Kontrak: {0} musim",
		"Eres un ídolo de la casa: {0} temporadas aquí.":
			"Kamu idola klub: {0} musim di sini.",
		"RENOVAR Y QUEDARME": "PERPANJANG & TETAP",
		"RENOVADO · TE QUEDAS": "DIPERPANJANG · BERTAHAN",
		"EL CLUB NECESITA VENDERTE": "KLUB HARUS MENJUALMU",


		"RIESGO DE VENTA": "RISIKO DIJUAL",
		"VENTANA EN {0}J": "BURSA {0} PEKAN",
		"POR TU GRADA": "SUARA SUPORTER",
		"AFICIÓN A {0}": "SUPORTER {0}",
		"Y ESTÁS A SALVO": "DAN KAMU AMAN",
		"SALVO ASCENSO": "KECUALI PROMOSI",
		"O EUROPA": "ATAU EROPA",
		"En {0} no pueden pagarte: venderte les cuadra las cuentas. Negarte tiene precio en el vestuario:":
			"{0} tak sanggup membayarmu: menjualmu menyeimbangkan pembukuan mereka. Menolak ada harganya di ruang ganti:",
		"Negarte: técnico {0} · equipo {1} · afición {2}":
			"Menolak: pelatih {0} · tim {1} · suporter {2}",


		"El club te quiso vender y te plantaste. Después de este año, te lo"
			+ " reconocen: el vestuario te lo devuelve.":
			"Klub ingin menjualmu dan kamu bertahan teguh. Setelah musim ini, mereka mengakuinya: ruang ganti membalasmu.",
		"TENÍAS RAZÓN": "KAMU BENAR",
		"Te querían vender y dijiste que no. El año te dio la razón, y el"
			+ " club sale a decirlo delante de todos.":
			"Mereka ingin menjualmu dan kamu bilang tidak. Musim membuktikan kamu benar, dan klub mengatakannya di depan semua orang.",
		"HAY OTRA MANERA": "ADA CARA LAIN",
		"ENTONCES, PON TÚ": "KAMU YANG BAYAR",
		"El director deportivo te escucha y no dice que no. Pero el agujero"
			+ " de {0} sigue ahí, y si no sale de tu traspaso tiene que salir de tu"
			+ " contrato. Elige por dónde.":
			"Direktur olahraga mendengarkanmu dan tak bilang tidak. Tapi lubang keuangan {0} masih ada, dan kalau tak tertutup dari transfermu harus dari kontrakmu. Pilih dari mana.",
		"FICHA: {0}/sem": "GAJI: {0}/mgg",
		"CLÁUSULA: {0}": "KLAUSUL: {0}",
		"O te quedas pagándolo tú: el club retira la venta dos temporadas y"
			+ " refuerza en el próximo mercado de verano. Elige por dónde pagas.":
			"Atau kamu bertahan dan menanggungnya: klub membatalkan penjualan selama dua musim dan belanja pemain di bursa musim panas berikut. Pilih cara kamu membayar.",
		"ME BAJO LA FICHA A {0}/sem": "POTONG GAJI JADI {0}/mgg",
		"¿TE BAJAS LA FICHA?": "POTONG GAJIMU?",
		"Cobras menos lo que reste de contrato, pero el club retira la venta"
			+ " y refuerza. Sigues libre de salir cuando quieras.":
			"Kamu dapat lebih sedikit selama sisa kontrak, tapi klub membatalkan penjualan dan belanja pemain. Kamu tetap bebas pergi kapan pun.",
		"ME SUBO LA CLÁUSULA A {0}": "NAIKKAN KLAUSUL JADI {0}",
		"¿TE SUBES LA CLÁUSULA?": "NAIKKAN KLAUSUL?",
		"No cobras menos, pero te blindas: salir de aquí costará mucho más y"
			+ " firmas {0} temporada más.":
			"Gajimu tak berkurang, tapi kamu terkunci: pergi dari sini akan jauh lebih mahal dan kamu teken {0} musim lagi.",
		"ACEPTO SALIR": "SETUJU PERGI",
		"¿ACEPTAS SALIR?": "SETUJU PERGI?",
		"El club te ofrecerá a quien pregunte y verás más ofertas. Sigues jugando"
		+ " mientras tanto.":
			"Klub akan menawarkanmu ke siapa pun yang bertanya dan kamu akan melihat lebih banyak tawaran. Kamu tetap main selama itu.",
		"ACEPTO": "SETUJU",
		"ME NIEGO": "MENOLAK",
		"¿TE NIEGAS A SALIR?": "TOLAK PERGI?",
		"Te quedas, pero el club contaba con ese traspaso: bajan técnico, equipo y"
		+ " afición.":
			"Kamu bertahan, tapi klub mengandalkan transfer itu: pelatih, tim, dan suporter semua turun.",
		"ME QUEDO": "BERTAHAN",
		"EL CLUB TE BUSCA MINUTOS": "KLUB CARIKAN MENIT",
		"En {0} no cuentan contigo para jugar y no te lo ocultan: te ofrecen salir"
		+ " CEDIDO una temporada, a un club donde seas titular. Puedes negarte, pero te"
		+ " quedas justo donde no juegas.":
			"{0} tak mengandalkanmu untuk bermain dan tak menyembunyikannya: kamu ditawari DIPINJAMKAN satu musim ke klub tempat kamu jadi pemain inti. Kamu boleh menolak, tapi tetap di tempat kamu tak main.",
		"Negarte: técnico {0} · equipo {1} · y esta temporada, ni la copa":
			"Menolak: pelatih {0} · tim {1} · dan musim ini, piala pun tidak",
		"Destino: {0}": "Tujuan: {0}",
		"ME VOY CEDIDO": "SIAP DIPINJAM",
		"¿SALIR CEDIDO?": "DIPINJAMKAN?",
		"Una temporada jugando de titular en un club menor. Vuelves al terminar, y"
		+ " creces más rápido mientras estás fuera.":
			"Satu musim jadi pemain inti di klub lebih kecil. Kamu kembali saat selesai, dan berkembang lebih cepat selama pergi.",
		"ME VOY": "PERGI",
		"¿TE QUEDAS?": "BERTAHAN?",
		"Seguirás sin jugar y el técnico se lo tomará mal. Esta temporada perderás"
		+ " hasta los partidos de rotación.":
			"Kamu tetap tak main dan pelatih tak akan senang. Musim ini kamu bahkan tak dapat laga rotasi.",
		"TU CLUB NO TE VENDE": "KLUBMU TAK MENJUALMU",
		"Con contrato largo y rindiendo, tu club prefiere retenerte. Puedes forzar la"
		+ " salida, pero el técnico, el vestuario y la afición lo pagarán.":
			"Dengan kontrak panjang dan performa bagus, klubmu lebih memilih menahanmu. Kamu bisa memaksa pergi, tapi pelatih, ruang ganti, dan suporter akan menanggung akibatnya.",
		"PEDIR EL TRASPASO": "MINTA TRANSFER",
		"¿PEDIR EL TRASPASO?": "MINTA TRANSFER?",
		"Tu club dejará de retenerte, pero el vestuario se lo tomará como una traición:"
		+ " bajan técnico, equipo y afición.":
			"Klubmu berhenti menahanmu, tapi ruang ganti menganggapnya pengkhianatan: pelatih, tim, dan suporter semua turun.",
		"LO PIDO": "AKU MINTA",
		"Nadie suena por ti todavía. Rinde y hazte ver.":
			"Belum ada yang dikaitkan denganmu. Tampil bagus dan curi perhatian.",
		"TE SIGUEN": "DIPANTAU",
		"Rumores de cara a la próxima ventana. Puedes darle pie a uno para que apriete"
		+ " —pero tu vestuario lo notará—.":
			"Rumor menjelang bursa berikutnya. Kamu bisa memberi lampu hijau ke salah satunya agar menekan —tapi ruang gantimu akan sadar—.",
		"Te siguen de cerca": "Memantaumu dengan ketat",
		"Interés serio": "Minat serius",
		"Suena flojo": "Baru desas-desus",
		"Va {0} de {1} en su liga · {2}": "Peringkat {0} dari {1} di liganya · {2}",
		"LE DISTE PIE": "LAMPU HIJAU",
		"LE DISTE PIE · APRETARÁ EN LA VENTANA":
			"LAMPU HIJAU · AKAN MENEKAN DI BURSA",
		"MOSTRAR INTERÉS": "TUNJUK MINAT",
		"¿MOSTRAR INTERÉS EN {0}?": "TUNJUK MINAT KE {0}?",
		"Le das pie para que apriete en la próxima ventana. Tu vestuario lo nota: bajan"
		+ " un poco técnico, equipo y afición.":
			"Kamu memberi lampu hijau agar menekan di bursa berikutnya. Ruang gantimu sadar: pelatih, tim, dan suporter turun sedikit.",
		"LE DOY PIE": "LAMPU HIJAU",
		"NO ME INTERESA":
			"TAK TERTARIK",
		"¿DESCARTAR A {0}?":
			"TOLAK {0}?",
		"DESCARTAR":
			"TOLAK",
		"Dejas de verlo entre los que te siguen y su sitio lo ocupa otro club interesado. No cuesta nada: todavía no hay ninguna oferta que rechazar. Vuelven a sonar la próxima temporada.":
			"Klub itu hilang dari daftar yang mengincarmu dan klub lain yang berminat menggantikannya. Gratis: belum ada tawaran yang perlu ditolak. Mereka bisa muncul lagi musim depan.",
		"TU EX":
			"MANTAN",
		"Volver a un club TUYO es mucho más fácil: allí ya saben quién eres y tu agente entra por la puerta grande.":
			"Kembali ke klubmu sendiri jauh lebih mudah: mereka sudah tahu siapa kamu dan agenmu masuk lewat pintu depan.",
		"Ya le diste pie a otro club.": "Kamu sudah memberi sinyal ke klub lain.",
		"CEDIDO": "PINJAMAN",
		"Perteneces a {0}: vuelves al cerrar la temporada.":
			"Kamu milik {0}: kembali saat musim berakhir.",
		"¿QUIERES MÁS MINUTOS?": "MAU TAMBAH MENIT?",
		"Puedes pedir salir CEDIDO a un club menor donde juegues de titular. De joven,"
		+ " además, crecerás más rápido jugando.":
			"Kamu bisa minta DIPINJAMKAN ke klub yang lebih kecil tempat kamu jadi pemain inti. Saat masih muda, kamu juga berkembang lebih cepat karena bermain.",
		"PEDIR SALIR CEDIDO": "MINTA DIPINJAMKAN",
		"¿PEDIR SALIR CEDIDO?": "MINTA DIPINJAMKAN?",
		"Buscarás minutos en un club menor durante una temporada. El técnico lo nota un"
		+ " poco, pero entiende que quieras jugar.":
			"Kamu akan cari menit bermain di klub yang lebih kecil selama semusim. Pelatih sedikit kecewa, tapi dia paham kamu ingin bermain.",



		"PEDISTE SALIR": "MINTA KELUAR",
		"¿QUIERES SALIR?": "MAU KELUAR?",
		"PEDISTE SALIR CEDIDO": "KAMU MINTA DIPINJAMKAN",
		"TE QUIEREN A PRÉSTAMO": "MEREKA MAU MEMINJAMMU",
		"Tu club no cuenta contigo. Cedido tendrías sitio en el once — y volverías con"
		+ " el crédito que te ganes.":
			"Klubmu tidak mengandalkanmu. Kalau dipinjamkan, kamu dapat tempat di susunan pemain inti — dan kembali dengan reputasi yang kamu raih.",
		"Cesión una temporada · misma ficha · TITULAR probable":
			"Pinjaman semusim · gaji sama · kemungkinan INTI",
		"IRTE CEDIDO": "DIPINJAMKAN",
		"MANTÉN PARA IRTE CEDIDO": "TAHAN UNTUK DIPINJAMKAN",
		"¿IRTE CEDIDO A {0}?": "DIPINJAMKAN KE {0}?",
		"Una temporada fuera para jugar de verdad. Tu contrato sigue siendo del club"
		+ " dueño.":
			"Semusim di tempat lain untuk benar-benar bermain. Kontrakmu tetap milik klub induk.",
		"PREGUNTARON POR TI": "MEREKA TANYA KAMU",


		"ES TU RIVAL · NO TE LO PERDONARÁN": "RIVALMU · TAK DIMAAFKAN",



		"SE ACABÓ EL TIEMPO": "WAKTU HABIS",
		"SE ENFRÍAN": "MENDINGIN",
		"NUEVO": "BARU",
		"SUBEN EL SUELDO": "GAJI NAIK",


		"TE BAJARON EL SUELDO": "GAJI DIPOTONG",
		"NEGOCIAR TU SUELDO": "NEGO GAJIMU",

		"NEGOCIAR MI SUELDO": "NEGO GAJIKU",
		"YA NEGOCIASTE ESTA TEMPORADA": "SUDAH NEGO MUSIM INI",
		"Ya negociaste tu ficha esta temporada.":
			"Kamu sudah menegosiasikan gajimu musim ini.",
		"YA NEGOCIASTE CON ELLOS": "SUDAH NEGO DENGAN MEREKA",
		"YA PAGAN SU TOPE": "SUDAH BAYAR BATAS MAKS",
		"SIN OFERTA": "NIHIL",
		"TE OFRECEN DE SUELDO POR PARTIDO": "TAWARAN GAJI PER LAGA",


		"MANTÉN PARA ACEPTAR ${0}": "TAHAN UNTUK TERIMA ${0}",

		"MANTÉN PARA SALIR CON ${0}": "TAHAN UNTUK PERGI: ${0}",
		"MANTÉN PARA SALIR": "TAHAN UNTUK PERGI",
		"MANTÉN PULSADO": "TAHAN TERUS",
		"RETIRAN LA OFERTA · SE ACABÓ": "TAWARAN DITARIK · SELESAI",
		"SE LEVANTAN DE LA MESA · SE ACABÓ": "MEREKA PERGI · SELESAI",
		"ESTÁ A PUNTO DE CORTAR · ROMPE EL HIELO O CIERRA":
			"HAMPIR PUTUS · CAIRKAN SUASANA ATAU TUTUP",
		"Si pides más, pueden subirlo… o bajarlo": "Kalau minta lebih, mereka bisa menaikkannya… atau menurunkannya",
		"Pediste {0} vez(ces) · llegaste con ${1}": "Minta {0} kali · awalnya ${1}",
		"TU AGENTE TE MIRA: ES EL MOMENTO": "AGENMU MEMBERI KODE: SEKARANG",
		"Lo consultan…": "Mereka sedang berunding…",
		"PODEMOS LLEGAR AHÍ  (+{0})": "BISA KITA CAPAI  (+{0})",
		"ENTONCES REVISAMOS LA OFERTA  (−{0})":
			"KITA TINJAU ULANG TAWARAN  (−{0})",
		"MEJOR ROL": "NAIK PERAN",
		"SE PLANTARON": "TETAP KUKUH",
		"SE RETIRAN": "MUNDUR",
		"LO RECHAZASTE": "KAMU TOLAK",
		"NADIE OCUPÓ EL HUECO": "TAK ADA PENGGANTI",
		"VUELVE DE CESIÓN": "USAI PINJAMAN",
		"SE QUEDAN AL CEDIDO": "PINJAMAN PERMANEN",
		"SE FUERON": "PERGI",

		"CIERRA": "TUTUP",
		"{0} J": "{0} P",
		"FAMA": "FAME",
		"CÓMO TE FICHAN": "CARA KAMU DIREKRUT",
		"Un club mira cuatro cosas —fama, nivel, forma y PRESTIGIO— y te juzga"
		+ " por la MÁS FLOJA: para que te busque un grande tienes que ser bueno en las"
		+ " cuatro a la vez.\n\nEl PRESTIGIO es lo que hiciste el año pasado: dónde"
		+ " quedaste en el Balón de Oro, o lo más grande que levantaste. Los tres"
		+ " primeros dicen cómo juegas HOY; éste dice de quién se habló en junio, y es"
		+ " el que abre la puerta de los más grandes.\n\nDentro de la ventana, lo que"
		+ " hagas en el campo mueve las ofertas: hay clubes que entran y clubes que se"
		+ " van. Tu agente decide CUÁNTAS de las que existen llegan hasta ti.":
			"Klub menilai empat hal — ketenaran, level, performa, dan PRESTISE — dan menilaimu dari yang PALING LEMAH: supaya dilirik klub besar, kamu harus bagus di keempatnya sekaligus.\n\nPRESTISE adalah apa yang kamu capai tahun lalu: posisi akhirmu di Pemain Terbaik, atau trofi terbesar yang kamu angkat. Tiga yang pertama menunjukkan cara mainmu HARI INI; yang ini menunjukkan siapa yang dibicarakan orang bulan Juni, dan inilah yang membuka pintu klub-klub terbesar.\n\nSelama bursa dibuka, aksimu di lapangan menggeser tawaran: ada klub yang datang dan ada yang pergi. Agenmu menentukan BERAPA BANYAK dari tawaran yang ada yang sampai kepadamu.",
		"PRESTIGIO": "PRESTISE",
		"Te falta PRESTIGIO: acaba alto en la votación del Jugador del Año o levanta algo.":
			"Kamu kurang PRESTISE: finis tinggi di Pemain Terbaik atau angkat trofi.",
		"Tu prestigio viene de haber sido {0}º del mundo.":
			"Prestisemu datang dari finis peringkat ke-{0} dunia.",
		"Tu prestigio lo sostiene lo que ganaste: {0}.":
			"Prestisemu ditopang apa yang kamu menangkan: {0}.",
		"Quedaste {0}º en el Jugador del Año: del {1}º en adelante el puesto ya no cuenta.":
			"Kamu finis peringkat ke-{0} di Pemain Terbaik: mulai peringkat ke-{1} ke bawah posisi tak dihitung lagi.",
		"No tienes prestigio: ni entraste en la gala ni levantaste nada.":
			"Kamu tak punya prestise: tidak masuk gala dan tidak mengangkat trofi apa pun.",
		"TRASPASO SIN PACTAR": "FEE BELUM SEPAKAT",
		"Ofrecen {0} · tu club pide {1} · faltan {2}":
			"Mereka tawarkan {0} · klubmu minta {1} · kurang {2}",
		"PELEAN POR TI ({0} MÁS)": "DIPEREBUTKAN ({0} LAGI)",
		"EJERCEN LA RECOMPRA": "MEREKA BELI KEMBALI",
		"LO QUE SE GUARDARON": "BAGIAN MEREKA",
		"{0} se lleva el {1}% de tu próximo traspaso (hoy serían {2}).":
			"{0} dapat {1}% dari transfermu berikutnya (hari ini jadi {2}).",
		"{0} puede recomprarte por {1}{2}.": "{0} bisa membelimu kembali seharga {1}{2}.",
		" (ya caducó)": " (sudah kedaluwarsa)",
		"AHÍ NO LLEGAS": "TAK TERJANGKAU",
		"DÉJALO": "LUPAKAN",
		"LLAMA IGUAL": "COBA SAJA",
		"En NEGRITA los que hoy te ficharían si tu agente les entra. Los demás puedes"
		+ " pedirlos igual, pero te dirá que no.":
			"Yang TEBAL adalah klub yang akan merekrutmu hari ini kalau agenmu masuk. Sisanya tetap bisa kamu minta, tapi dia akan bilang tidak.",
		"ENTENDIDO": "PAHAM",
		"SE VAN MAÑANA": "PERGI BESOK",

		"REBAJADO: FIN DE CONTRATO": "DISKON: KONTRAK HABIS",

		"VINO A VERTE": "DATANG MENONTON",
		"TE SIGUE": "MENGINCARMU",
		"TE QUIERE": "MAU KAMU",
		"VA EN SERIO": "SERIUS",
		"Ya elegiste: tu junio tiene dueño. Ningún otro club puede moverte.": "Kamu sudah memilih: Junimu sudah ada pemiliknya. Tak ada klub lain yang bisa memindahkanmu.",

		"SOLO LIGA Y COPA": "CUMA LIGA & PIALA",

		"NEGOCIAR…": "NEGO…",

		"PEDIR TRASPASO": "MINTA TRANSFER",
		"PEDIR CESIÓN": "PINJAMKAN AKU",
		"Pedir el TRASPASO te pone en LISTA DE VENTA: tu club te ofrece a quien"
		+ " pregunte y llegan más ofertas — pero el vestuario lo paga y el técnico"
		+ " te da MENOS minutos mientras no salgas: ya dijiste que te vas.\n\nSi no"
		+ " eres titular, puedes pedir salir CEDIDO a un club menor donde juegues:"
		+ " de joven, además, creces más rápido jugando.":
			"Meminta TRANSFER memasukkanmu ke DAFTAR JUAL: klubmu menawarkanmu ke siapa pun yang bertanya dan tawaran lebih banyak masuk — tapi ruang ganti yang menanggungnya dan pelatih memberimu LEBIH SEDIKIT menit selama kamu belum pergi: kamu sudah bilang mau pergi.\n\nKalau kamu bukan pemain inti, kamu bisa minta dipinjamkan ke klub yang lebih kecil tempat kamu main: saat masih muda, kamu juga berkembang lebih cepat karena bermain.",
		"Estás EN LISTA DE VENTA: tu club ya no te retiene y te ofrece a quien"
		+ " pregunte. Cada ventana te trae más ofertas."
		+ " Mientras no salgas, el técnico te da menos minutos.":
			"Kamu ada di DAFTAR JUAL: klubmu tak lagi menahanmu dan menawarkanmu ke siapa pun yang bertanya. Setiap bursa membawa lebih banyak tawaran. Selama kamu belum pergi, pelatih memberimu lebih sedikit menit.",
		"Te pones EN LISTA DE VENTA: el club deja de retenerte y te ofrece a"
		+ " quien pregunte. El vestuario se lo toma a mal: bajan técnico, equipo y"
		+ " afición. Y mientras no salgas, el técnico te dará MENOS MINUTOS por"
		+ " bien que juegues: ya dijiste que te vas.":
			"Kamu masuk DAFTAR JUAL: klub berhenti menahanmu dan menawarkanmu ke siapa pun yang bertanya. Ruang ganti menanggapinya dengan buruk: pelatih, skuad, dan suporter semuanya turun. Dan selama kamu belum pergi, pelatih memberimu LEBIH SEDIKIT MENIT sebagus apa pun mainmu: kamu sudah bilang mau pergi.",

		"DESDE VERANO": "MUSIM PANAS",

		"BUSCAN DELANTERO": "CARI PENYERANG",

		"PRECIO DE ENERO": "HARGA JANUARI",

		"TRAYECTORIA +{0}%": "RIWAYAT +{0}%",
		"TROTAMUNDOS −{0}%": "PENGEMBARA −{0}%",

		"YA FICHARON DE TU CLUB ({0})": "REKRUT DARI KLUBMU ({0})",
		"SUELEN FICHAR DE TU LIGA": "SERING BELI DI LIGAMU",

		"VUELVES A CASA": "PULANG KAMPUNG",
		"TU EX CLUB": "KLUB LAMA",

		"VUELVE CEDIDO A CASA": "DIPINJAMKAN PULANG",

		"PAGAN LA CLÁUSULA": "KLAUSUL DIBAYAR",
		"CLÁUSULA DE RESCISIÓN": "KLAUSUL PELEPASAN",

		"TE PREGUNTAN POR EL RUMOR": "KAMU DITANYA SOAL RUMOR",
		"Se sabe que {0} te sigue y la prensa te pone el micro delante. Lo que digas"
		+ " lo oyen todos: tu grada y su despacho.":
			"Beredar kabar {0} mengincarmu dan pers menyodorkan mikrofon ke wajahmu. Apa pun katamu didengar semua orang: tribunmu dan ruang direksi mereka.",
		"NO ME CIERRO A NADA": "AKU TERBUKA SEMUA",
		"ESTOY CENTRADO AQUÍ": "AKU FOKUS DI SINI",

		"RETIRAR LA PETICIÓN": "TARIK PERMINTAAN",
		"¿RETIRAR LA PETICIÓN?": "TARIK PERMINTAAN?",

		"CUMPLE LO DICHO": "SESUAI UCAPANMU",
		"CONTRADICE LO DICHO": "LANGGAR UCAPANMU",
		"DIJISTE: {0}": "KATAMU: {0}",
		"TE COMPROMETE: {0}": "MENGIKATMU: {0}",
		"IR DONDE JUEGUES MÁS": "CARI MENIT BERMAIN",
		"IR A UN CLUB MAYOR": "KE KLUB LEBIH BESAR",
		"IRTE DE ESTE CLUB": "KELUAR DARI KLUB",

		"PIDE SALIR": "MAU PERGI",
		"{0} pide salir cedido para jugar más": "{0} minta dipinjamkan supaya lebih banyak main",
		"{0} busca una cesión donde lo vean": "{0} ingin dipinjamkan ke klub tempat dia lebih terlihat",

		"NO RENUEVA": "TAK LANJUT",
		"PRECONTRATO · {0}": "PRAKONTRAK · {0}",
		"EN JUNIO": "DI JUNI",
		"RENUEVA": "LANJUT",
		"SE VA LIBRE": "PERGI BEBAS",
		"PRECONTRATO": "PRAKONTRAK",
		"{0} renueva con el {1} hasta {2}": "{0} perpanjang kontrak dengan {1} sampai {2}",
		"{0} no renovará con el {1}: se va libre en junio": "{0} tidak akan perpanjang kontrak dengan {1}: pergi gratis bulan Juni",
		"{0} firma un precontrato con el {1}": "{0} teken prakontrak dengan {1}",
		"{0} pide una cesión: no ve futuro en el {1}": "{0} minta dipinjamkan: tak lihat masa depan di {1}",
		"{0} se ofrece para salir cedido": "{0} menawarkan diri untuk dipinjamkan",
		"{0} pide salir del {1}: quiere jugar más":
			"{0} minta pergi dari {1}: ingin lebih sering main",
		"{0} pide salir del {1} y busca un club mayor":
			"{0} minta pergi dari {1} dan mengincar klub yang lebih besar",
		"{0} no cree en el proyecto del {1} y pide salir":
			"{0} tidak percaya pada proyek {1} dan minta pergi",
		"{0} pide salir del {1}": "{0} minta pergi dari {1}",
		"Dijiste «{0}», y te vas a donde dijiste.":
			"Kamu bilang «{0}», dan kamu pergi persis ke sana.",
		"Dijiste «{0}». Acabas firmando otra cosa.":
			"Kamu bilang «{0}». Akhirnya kamu teken yang lain.",

		"¿POR QUÉ TE QUIERES IR?": "KENAPA KAMU MAU PERGI?",
		"EL DIRECTOR DEPORTIVO": "DIREKTUR OLAHRAGA",
		"BUSCO MÁS MINUTOS": "MAU TAMBAH MENIT",
		"QUIERO UN CLUB MEJOR": "MAU KLUB LEBIH BESAR",
		"NO CREO EN EL PROYECTO": "AKU TAK PERCAYA PROYEKNYA",
		"QUIERO JUGAR": "AKU MAU MAIN",
		"QUIERO QUE ME VEAN": "AKU MAU DILIHAT",
		"AQUÍ NO TENGO FUTURO": "TAK ADA MASA DEPANKU",
		"ME LO PIENSO": "PIKIR DULU",
		"NADA, OLVÍDELO": "LUPAKAN SAJA",
		"YA LO JUEGAS TODO": "KAMU MAIN TERUS",
		"TE BUSCAMOS SITIO.": "KAMI CARIKAN TEMPAT.",
		"PUES QUE PAGUEN LO QUE VALES.": "BIAR MEREKA BAYAR HARGAMU.",
		"AQUÍ NO SE REGALA A NADIE.": "DI SINI TAK ADA YANG DIOBRAL.",
		"EL PROYECTO SIGUE, CONTIGO O SIN TI.": "PROYEK JALAN TERUS, ADA KAMU ATAU TIDAK.",
		"NO TE FALTA RAZÓN.": "KAMU TIDAK SALAH.",
		"ME DUELE, PERO TE ENTIENDO. VUELVE MEJOR.": "SAKIT, TAPI AKU PAHAM. KEMBALI LEBIH HEBAT.",
		"JUEGA FUERA Y A LA VUELTA HABLAMOS.": "MAIN DULU, KITA BICARA SAAT KAMU PULANG.",
		"TE BUSCAMOS UN SITIO DONDE JUGAR.": "KAMI CARIKAN TEMPAT UNTUK MAIN.",
		"AQUÍ TAMBIÉN SE JUEGA SI TE LO GANAS.": "DI SINI JUGA MAIN KALAU KAMU LAYAK.",
		"HACES BIEN.": "KAMU BENAR.",
		"Antes de ponerte en la lista quiere oírlo de tu boca. Lo que le digas decide a quién llama y cuánto pide por ti.": "Sebelum memasukkanmu ke daftar, dia ingin mendengarnya dari mulutmu. Jawabanmu menentukan siapa yang dia telepon dan berapa yang dia minta untukmu.",
		"{0} te para en el pasillo, junto a la lista. Quiere saber por qué pides salir cedido.": "{0} menghentikanmu di lorong, dekat daftar susunan pemain. Dia ingin tahu kenapa kamu minta dipinjamkan.",
		"EL EQUIPO SE HUNDE": "TIM TERPURUK",
		"PELEÁIS ARRIBA": "KALIAN DI PAPAN ATAS",
		"ÍDOLO DE LA GRADA": "IDOLA SUPORTER",
		"RECIÉN LLEGADO": "PENDATANG BARU",
		"YA LO DIJISTE ANTES": "KAMU PERNAH BILANG",
		"HOY NADIE MÁS GRANDE": "BELUM ADA KLUB BESAR",
		"HOY NO PREGUNTA NADIE": "SEPI PEMINAT",
		"SIN DESTINO HOY": "TAK ADA TUJUAN",
		"PIDEN {0}": "MINTA {0}",

		"Tu mercado ya no abre esta temporada: podrás pedir salir cuando abra el"
		+ " de verano.":
			"Bursamu tak lagi dibuka musim ini: kamu bisa minta pergi saat bursa musim panas dibuka.",
		"Disculpa pública: sales de la lista de venta. La afición se lo cobra, y el"
		+ " técnico tardará un par de partidos en volver a contar contigo — dijiste"
		+ " que te ibas.":
			"Permintaan maaf terbuka: kamu keluar dari daftar jual. Suporter tetap menghukummu, dan pelatih butuh beberapa laga untuk kembali mengandalkanmu — kamu bilang mau pergi.",
		"RETIRASTE LA PETICIÓN": "PERMINTAAN DITARIK",

		"Sube de la cantera de {0}": "Naik dari akademi {0}",
		"CANTERA": "AKADEMI",

		"LA BOMBA DEL CIERRE": "BOM PENUTUP BURSA",

		"Opción de compra pactada: $ {0}": "Opsi beli disepakati: $ {0}",
		"EJECUTAN LA OPCIÓN": "OPSI BELI DIAMBIL",
		"{0} quiere que vuelvas: pide repetir la cesión y puja por ti": "{0} ingin kamu kembali: minta pinjaman diulang dan menawar untukmu",
		"{0} quiere que vuelvas: pide repetir la cesión": "{0} ingin kamu kembali: minta pinjaman diulang",
		"{0} quiere que vuelvas: intentará comprarte": "{0} ingin kamu kembali: akan mencoba membelimu",
		"{0} quería que volvieras, pero tu club cuenta contigo": "{0} ingin kamu kembali, tapi klubmu mengandalkanmu",
		"{0} ejecuta la opción de compra pactada":
			"{0} menjalankan opsi beli yang disepakati",

		"ENCARGO AL AGENTE…": "TUGASI AGEN…",

		"{0} LIBRES": "SISA {0}",

		"ENCARGOS": "TUGAS",
		"CONFIANZA": "PERCAYA",
		"TU DINERO": "UANGMU",
		"CUESTA VESTUARIO": "MERUGIKAN RUANG GANTI",
		"La cifra de cada botón es LO QUE TE COBRA por ese encargo, y sale de tu bolsillo al momento. Tienes ${0}.":
			"Angka di tiap tombol adalah BIAYA yang dia tagih untuk tugas itu, langsung dari kantongmu. Kamu punya ${0}.",
		"TU AGENTE": "AGENMU",
		"MUÉVEME POR EL MERCADO": "TAWARKAN AKU",
		"BUSCA EN UNA LIGA…": "CARI DI SATU LIGA…",
		"TOCA LA PUERTA DE UN CLUB…": "KETUK PINTU KLUB…",
		"¿QUÉ LIGA?": "LIGA MANA?",
		"¿QUÉ CLUB?": "KLUB MANA?",
		"TU AGENTE SE MUEVE": "AGENMU BERGERAK",
		"LO TRAJO TU AGENTE": "AGENMU BERHASIL",
		"TU AGENTE NO PUDO": "AGENMU GAGAL",

		"TU MESA ESTÁ LLENA": "DAFTARMU PENUH",
		"NO TRAS TU RECHAZO": "KAMU SUDAH TOLAK",
		"FUERA DE TU ALCANCE": "TAK TERJANGKAU",
		"YA ESTABA EN TU MESA": "SUDAH DI DAFTARMU",
		"TRAJO A {0}": "BAWA {0}",
		"El mercado cierra hoy: ya no hay tiempo para encargos.":
			"Bursa tutup hari ini: tak ada waktu lagi untuk tugas.",
		"Tu agente trabaja la liga de {0}: sus clubes entran primero.":
			"Agenmu menggarap liga {0}: klub-klubnya masuk lebih dulu.",
		"Tu agente está tocando esa puerta: se sabe en la próxima jornada.":
			"Agenmu sedang mengetuk pintu itu: kabarnya ada di pekan berikutnya.",
		"Tu agente te está moviendo: esta ventana entran más clubes.":
			"Agenmu sedang menawarkanmu: lebih banyak klub masuk di bursa ini.",
		"FIRMAR PRECONTRATO": "TEKEN PRAKONTRAK",
		"¿FIRMAR PRECONTRATO CON {0}?": "TEKEN PRAKONTRAK DENGAN {0}?",
		"Firmas para el VERANO: terminas la temporada aquí y al cierre te vas"
		+ " GRATIS, con tu prima. Tu mercado se cierra este año, no podrás renovar, y"
		+ " el técnico te dará menos minutos: ya sabe que te vas.":
			"Kamu teken untuk MUSIM PANAS: kamu selesaikan musim di sini dan pergi GRATIS di akhir, bonus tetap kamu bawa. Bursamu tutup untuk tahun ini, kamu tak bisa perpanjang, dan pelatih memberimu lebih sedikit menit: dia tahu kamu akan pergi.",

		"Te vas a tu RIVAL: la grada no te lo perdona. Técnico −{0}, afición −{1}; cuanto más te quieren, más duele.": "Kamu pindah ke RIVAL: tribun tak akan memaafkanmu. Pelatih −{0}, suporter −{1}; makin mereka sayang, makin sakit.",
		"Te vas a un club de tu LIGA: los tendrás enfrente. Técnico −{0}, afición −{1}.": "Kamu pindah ke klub di LIGAMU: mereka akan jadi lawanmu. Pelatih −{0}, suporter −{1}.",
		"Te vas a otra liga de tu PAÍS. Técnico −{0}, afición −{1}.": "Kamu pindah ke liga lain di NEGARAMU. Pelatih −{0}, suporter −{1}.",
		"Te vas al EXTRANJERO: se entiende más. Técnico −{0}, afición −{1}.": "Kamu pindah ke LUAR NEGERI: lebih bisa dimaklumi. Pelatih −{0}, suporter −{1}.",


		"PRECONTRATO FIRMADO": "PRAKONTRAK DITEKEN",
		"PRECONTRATO FIRMADO · TE VAS EN VERANO": "PRAKONTRAK DITEKEN · PERGI MUSIM PANAS",
		"Al cerrar la temporada te vas GRATIS a {0}."
		+ " Ya elegiste destino: tu mercado está resuelto y juegas menos"
		+ " mientras tanto.":
			"Di akhir musim kamu pergi GRATIS ke {0}. Kamu sudah memilih tujuan: bursamu beres dan kamu main lebih sedikit selama itu.",
		"Se cumple tu precontrato: llegas GRATIS a {0}":
			"Prakontrakmu berlaku: kamu tiba di {0} GRATIS",

		"FIRMADO: {0}": "TEKEN: {0}",
		"YA FIRMASTE CON {0}": "SUDAH TEKEN: {0}",

		"TE CONSIGUE EL PRECONTRATO": "PRAKONTRAK DIDAPAT",
		"TE GUARDAN EL {0}": "NOMOR {0} DISIMPAN",
		"Ya firmaste con {0}: el técnico cuenta menos contigo.": "Kamu sudah teken dengan {0}: pelatih tak lagi banyak mengandalkanmu.",

		"HITO": "GELAR",
		"SIN HITO": "TANPA GELAR",
		"Tienes nivel de grande: te falta GANAR algo.":
			"Kamu sudah selevel klub besar: tinggal MEMENANGKAN gelar.",
		"ABRE": "BUKA",
		"EL AÑO QUE VIENE": "TAHUN DEPAN",

		"LOS QUE TE SIGUEN": "PENGINCARMU",
		"Clubes que preguntan por ti de cara a la próxima ventana. Puedes darle pie a UNO"
		+ " para que apriete cuando abra: llegará con oferta y su distintivo.\n\nNo sale"
		+ " gratis —el vestuario se entera de que miras fuera— y sólo se puede con un club"
		+ " por ventana.":
			"Klub yang menanyakanmu menjelang bursa berikutnya. Kamu bisa memberi sinyal ke SATU klub agar menekan saat bursa dibuka: dia datang dengan tawaran dan lencananya sendiri.\n\nTak gratis —ruang ganti tahu kamu melirik ke luar— dan hanya bisa satu klub per bursa.",
		"DE CERCA": "DEKAT",
		"SERIO": "SERIUS",
		"FLOJO": "LEMAH",
		"FUERA DE COPA": "TERSINGKIR",
		"OCTAVOS": "R16",
		"CUARTOS": "8 BESAR",
		"SEMIS": "SEMI",
		"FINAL": "FINAL",

		"Sin traspaso (agente libre) · prima de fichaje: ${0}":
			"Tanpa biaya transfer (pemain bebas) · bonus teken: ${0}",
		"Traspaso: ${0} · tu prima: ${1}": "Transfer: ${0} · bagianmu: ${1}",
		"Te esperan como: {0}": "Kamu diharapkan sebagai: {0}",
		"Se retiran mañana": "Mereka mundur besok",
		"Aguantan {0} jornadas más": "Mereka menunggu {0} pekan lagi",
		"ULTIMATUM: hoy o nunca": "ULTIMATUM: hari ini atau tidak sama sekali",
		"Ahora cobras ${0}/partido · esta oferta {1}%":
			"Sekarang gajimu ${0}/laga · tawaran ini {1}%",
		"Un club por encima del tuyo": "Klub di atas klubmu",
		"Un club por debajo del tuyo": "Klub di bawah klubmu",
		"Un club a tu nivel": "Klub selevelmu",
		"FICHAR (LIBRE)": "TEKEN (BEBAS)",
		"Esperas respuesta a tu {0} (próxima jornada)":
			"Kamu menunggu jawaban atas {0} (pekan berikutnya)",
		"petición de sueldo": "permintaan gaji",
		"petición de titular": "permintaan jadi pemain inti",
		"Ya negociaste esta oferta: sin más margen.":
			"Penawaran ini sudah kamu negosiasikan: tak ada ruang lagi.",
		"PEDIR SER TITULAR": "MINTA JADI INTI",
		"PEDIR MÁS SUELDO": "MINTA GAJI LEBIH",
		"TU CLUB NO TE DEJA SALIR": "KLUBMU TAK MELEPASMU",
		"FICHAR": "TEKEN",
		"que suban el sueldo": "gaji yang lebih besar",
		"que te fichen de titular": "direkrut sebagai pemain inti",
		"¿NEGOCIAR CON {0}?": "NEGO DENGAN {0}?",
		"Pides {0}. Responden la próxima jornada: pueden ceder, plantarse o RETIRAR la"
		+ " oferta.":
			"Kamu minta {0}. Mereka menjawab pekan depan: bisa mengalah, bertahan, atau MENARIK tawaran.",
		"NEGOCIAR": "NEGO",
		"NEGOCIACIÓN ABIERTA · RESPONDEN LA PRÓXIMA JORNADA":
			"NEGO DIBUKA · JAWAB PEKAN DEPAN",
		"RECHAZAR": "TOLAK",
		"¿RECHAZAR A {0}?": "TOLAK {0}?",
		"Se retiran de la puja para siempre en este mercado. Otros clubes pueden ocupar"
		+ " su hueco, pero no hoy: se sabe en la próxima jornada.":
			"Mereka mundur dari lelang sampai bursa ini berakhir. Klub lain bisa mengisi tempatnya, tapi tidak hari ini: kabarnya ada di pekan berikutnya.",
		"RECHAZO": "TOLAK",
		"OFERTA RECHAZADA · SE BUSCA OTRO DESTINO":
			"TAWARAN DITOLAK · CARI TUJUAN LAIN",
		"¿FICHAR POR {0}?": "GABUNG {0}?",
		"Te esperan como {0}. Llegas al vestuario desde abajo: el puesto se gana.":
			"Mereka mengharapkanmu sebagai {0}. Kamu masuk ruang ganti dari bawah: tempat inti harus diraih.",
		"FIRMO": "TEKEN",
		"Fichaje libre: sin traspaso, con prima de ${0}. Te esperan como {1}; el puesto"
		+ " se gana.":
			"Rekrutan bebas: tanpa biaya transfer, bonus teken ${0}. Mereka mengharapkanmu sebagai {1}; tempat harus diraih.",

		"ELIGE TU DORSAL": "PILIH NOMORMU",
		"HAY DORSAL LIBRE": "NOMOR KOSONG",
		"Te fichan como un acontecimiento y el club te deja elegir. Llevas el {0}, pero"
		+ " la camiseta que quieras es tuya.":
			"Kamu direkrut sebagai kedatangan besar dan klub membiarkanmu memilih. Kamu pakai nomor {0}, tapi nomor mana pun yang kamu mau jadi milikmu.",
		"Se cerró el mercado y el club repasa los números. Llevas el {0}, y este año hay"
		+ " camiseta libre si la quieres.":
			"Bursa sudah tutup dan klub meninjau nomor-nomor. Kamu pakai nomor {0}, dan tahun ini ada nomor kosong kalau kamu mau.",
		"PONERME EL {0}": "PAKAI {0}",
		"SEGUIR CON EL {0}": "TETAP NOMOR {0}",
		"ELIGE OTRO": "PILIH LAIN",
		"TU DORSAL EN EL CLUB": "NOMORMU DI KLUB",
		"RENUEVAS: TU DORSAL": "PERPANJANG: NOMORMU",
		"Llegas nuevo y el club te deja escoger número. Llevas el {0}; si prefieres otro de los que están libres, es tuyo.": "Kamu baru datang dan klub membiarkanmu memilih nomor. Kamu pakai nomor {0}; kalau mau nomor lain yang kosong, itu milikmu.",
		"Firmas con el club y aprovechas para repasar tu número. Llevas el {0}; si quieres otro de los que están libres, cámbialo.": "Kamu teken dengan klub dan sekalian meninjau nomormu. Kamu pakai nomor {0}; kalau mau nomor lain yang kosong, ganti saja.",
		"ELIGE TU NÚMERO": "PILIH NOMORMU",
		"Te pones el {0}.": "Kamu pakai nomor {0}.",
		"Sigues con el {0}.": "Kamu tetap nomor {0}.",
		"BOTAS": "BOOT",
		"OFERTA DE LA JORNADA": "PROMO PEKAN INI",
		"OFERTA": "PROMO",
		"ANTES ${0}": "DULU ${0}",
		"Sólo estética: pintan tus botas en el partido y en las escenas, y no cambian sus bonos. Se ponen en TIENDA, en BOTAS.": "Hanya kosmetik: mengecat sepatumu di laga dan adegan, tanpa mengubah bonusnya. Pasang di TOKO, tab BOOT.",
		"+ {0} PUNTOS": "+ {0} POIN",
		"Sólo color, no da bonos. Es tuya hasta que empieces otra carrera.": "Hanya warna, tanpa bonus. Jadi milikmu sampai kamu mulai karier baru.",
		"PINTA TUS BOTAS": "CAT SEPATUMU",
		"YA LA TIENES: SE PONE EN TIENDA, EN BOTAS": "SUDAH ADA: PASANG DI TOKO, BOOT",
		"SE PONE EN TIENDA, EN BOTAS": "PASANG DI TOKO, BOOT",
		"Tus botas estrenan la {0}.": "Sepatumu kini memakai {0}.",
		"TUS EDICIONES": "EDISIMU",
		"SIN EDICIÓN": "TANPA EDISI",
		"EDICIÓN DEBUT": "EDISI DEBUT",
		"EDICIÓN ASCENSO": "EDISI PROMOSI",
		"EDICIÓN ORO": "EDISI EMAS",
		"EDICIÓN NOCHE": "EDISI MALAM",
		"EDICIÓN FUEGO": "EDISI API",
		"EDICIÓN HIELO": "EDISI ES",
		"EDICIÓN NEÓN": "EDISI NEON",
		"PACK DEBUT": "PAKET DEBUT",
		"PACK ASCENSO": "PAKET PROMOSI",
		"PACK JUGADOR DEL AÑO": "PAKET PEMAIN TERBAIK",
		"EL QUE MÁS RINDE": "PALING HEMAT",
		"ALCANZA": "CUKUP",
		"ALCANZA PARA {0}": "CUKUP UNTUK {0}",
		"TE ALCANZARÍA PARA: {0}": "CUKUP UNTUK: {0}",
		"QUEDARÍAS CON ${0}": "SISA ${0}",
		"QUEDARÍAS CON {0} PUNTOS": "SISA {0} POIN",
		"QUEDARÍAS CON ${0} Y {1} PUNTOS": "SISA ${0} DAN {1} POIN",
		"TUS HABILIDADES ESTÁN AL MÁXIMO: ENTRARÍAN COMO ≈{0} XP": "SKILLMU SUDAH MAKS: MASUK JADI ≈{0} XP",
		"TE FALTAN ${0} PARA {1}": "KURANG ${0} UNTUK {1}",
		"YA TE ALCANZA PARA {0}": "SUDAH CUKUP UNTUK {0}",
		"VOLVER A {0}": "BALIK KE {0}",
		"REPARTIR PUNTOS": "PAKAI POIN",
		"PERSONAL": "STAF",
		"PARA EL CUERPO": "UNTUK TUBUH",
		"PARA EL VESTUARIO": "UNTUK RUANG GANTI",
		"TU CUERPO TÉCNICO": "STAF TEKNISMU",
		"ROPA": "BAJU",
		"LUJOS": "MEWAH",
		"PELUQUERÍA": "BARBER",
		"Cortes y barbas de autor. Los de siempre siguen gratis en ASPECTO.": "Potongan dan jenggot khas. Yang biasa tetap gratis di PENAMPILAN.",
		"VER MARCAS": "CEK MEREK",
		"PONÉRTELO": "PAKAI",
		"TU PUESTO: {0}º · {1} · {2}%": "PERINGKAT #{0} · {1} · {2}%",
		"{0} % POR TU GRADA": "{0}% SUPORTER",
		"TE LLEVA: {0}": "AGENMU: {0}",
		"LLEVAS PUESTAS": "KAMU PAKAI",
		"VS LAS TUYAS": "VS MILIKMU",
		"LO MISMO": "SAMA",
		"DURA {0} MÁS": "TAHAN +{0}",
		"DURA {0} MENOS": "TAHAN -{0}",
		"USA LO QUE TIENES": "PAKAI YANG ADA",

		"POTENCIA": "KEKUATAN",
		"EFECTO": "EFEK",
		"${1} POR PARTIDO · DURA {0}": "${1} PER LAGA · TAHAN {0}",
		"CON TU NETO DE HOY NO LLEGAS": "GAJI BERSIHMU BELUM CUKUP",
		"TE FALTAN {0} · {1}": "KURANG {0} · {1}",
		"EL MÁS CERCA": "TERDEKAT",
		"SIN MANTENIMIENTO": "TANPA PERAWATAN",
		"SE ESTRENA AL COMPRAR · ROTA, VUELVE EN {0}": "DIPAKAI LANGSUNG · RUSAK, BALIK DI {0}",
		"COMISIÓN {0}% · HOY {1}%": "KOMISI {0}% · KINI {1}%",
		"SOBRE TU SUELDO: {0} / PARTIDO": "DARI GAJIMU: {0} / LAGA",
		"PARA SIEMPRE · SIN MANTENIMIENTO": "SELAMANYA · TANPA PERAWATAN",
		"VER EN CASA": "LIHAT RUMAH",
		"MIENTRAS SIGAS AQUÍ · TE QUEDAN {0} {1}": "SELAMA DI SINI · SISA {0} {1}",
		"TU CARTERA": "DOMPETMU",
		"{0} PUNTOS LIBRES": "{0} POIN BEBAS",
		"TOCA UNA BOTA PARA PROBÁRTELA": "KETUK SEPATU UNTUK COBA",
		"TU TREN DE VIDA": "GAYA HIDUPMU",
		"TOCA UNA FICHA PARA ELEGIRLA": "KETUK KARTU UNTUK PILIH",
		"TU PERSONAL": "STAFMU",
		"TIENES {0} DE {1}": "PUNYA {0} DARI {1}",
		"TU MERCH": "MERCHMU",
		"NO TIENES NADA GUARDADO": "TAK ADA SIMPANAN",
		"LO QUE CAMBIA": "YANG BERUBAH",
		"PAGAS ${0} · TE QUEDAN ${1}": "BAYAR ${0} · SISA ${1}",
		"HOY NO SIRVE: {0}": "TAK BERGUNA: {0}",
		"-{0}% HOY": "-{0}% KINI",
		"ABRIENDO": "MEMBUKA",
		"APP STORE": "APP STORE",
		"CONSUMO": "ITEM",
		"Lo que compras aquí te mejora MIENTRAS SIGAS EN ESTE CLUB. Si fichas por otro, se queda con este escudo.": "Apa yang kamu beli di sini menguatkanmu SELAMA KAMU MASIH DI KLUB INI. Kalau pindah ke klub lain, semuanya tertinggal di klub ini.",
		"El escudo en la cabeza, todos los días. Lo más barato que dice de qué eres.": "Lambang klub di kepala, tiap hari. Cara termurah menunjukkan kamu pendukung siapa.",
		"La que se levanta en el himno. Mientras juegues aquí, la grada te la reconoce.": "Yang diangkat saat himne dinyanyikan. Selama kamu main di sini, tribun mengenalinya.",
		"El del año, con el sello del club. Lo usas a diario y llegas algo más entero.": "Edisi tahun ini, dengan cap klub. Kamu pakai tiap hari dan datang sedikit lebih segar.",
		"La de este año, con tu dorsal. Sales con ella y la prensa lo nota.": "Edisi tahun ini, dengan nomormu. Kamu memakainya di luar dan pers memperhatikannya.",
		"TIENDA DEL CLUB": "TOKO KLUB",
		"En primera, la tienda saca además la playera firmada de la vitrina.": "Di kasta tertinggi, toko juga mengeluarkan jersey bertanda tangan dari lemari trofi.",
		"GORRA DEL CLUB": "TOPI KLUB",
		"BUFANDA DEL CLUB": "SYAL KLUB",
		"BALÓN OFICIAL": "BOLA RESMI",
		"PLAYERA DE LA TEMPORADA": "JERSEY MUSIM INI",
		"PLAYERA FIRMADA": "JERSEY TTD",
		"La de la vitrina, firmada por la plantilla. Sólo en primera.": "Yang ada di lemari trofi, ditandatangani seluruh skuad. Hanya di kasta tertinggi.",
		"ESTILO": "GAYA",
		"INVERSION": "INVESTASI",
		"Toca una bota para probártela en el espejo.":
			"Ketuk sepatu untuk mencobanya di cermin.",
		"Llevas ahorrado el {0}%.": "Kamu sudah menabung {0}%.",
		"EN USO": "AKTIF",
		"EQUIPAR": "PAKAI",
		"CON TUS BOTAS": "DENGAN SEPATUMU",
		"VIDA {0}%  ·  se gastan al jugar": "UMUR {0}%  ·  aus saat dipakai main",
		"SIN DESGASTE  ·  las de pago dan más": "TANPA AUS  ·  yang berbayar lebih kuat",
		"EN USO · {0}%": "AKTIF · {0}%",
		"Se te acabaron tus {0}. Toca otras para reponerlas.":
			"{0} milikmu sudah aus. Ketuk sepatu lain untuk menggantinya.",
		"Tu fama interesó a {0}. Míralo en PATROCINIOS.":
			"Ketenaranmu menarik perhatian {0}. Lihat di SPONSOR.",
		"CONSUMIBLES": "HABIS PAKAI",
		"ESTILO DE VIDA": "GAYA HIDUP",
		"DINERO PARADO": "UANG TIDUR",
		"NÓMINA": "GAJI",
		"INGRESOS": "INCOME",
		"DESCUENTOS": "POTONGAN",
		"VER DESGLOSE": "LIHAT RINCIAN",
		"OCULTAR DESGLOSE": "TUTUP RINCIAN",
		"PRIMA DE RESULTADO": "BONUS HASIL",
		"PRIMA POR GOL": "BONUS GOL",
		"PRIMA POR ASISTENCIA": "BONUS ASSIST",
		"PATROCINIO": "SPONSOR",
		"COMISIÓN DEL AGENTE": "KOMISI AGEN",
		"CÁMARA ROTA": "KAMERA RUSAK",
		"BALÓN A LA GRADA": "BOLA KE TRIBUN",



		"BALÓN A LA CALLE": "BOLA KE JALAN",
		"RECOGEPELOTAS DERRIBADO": "PEMUNGUT BOLA TUMBANG",
		"CRISTAL DEL PALCO": "KACA BOX VIP",
		"EN NÚMEROS ROJOS": "DEFISIT",
		"ficha $ {0} / partido": "gaji $ {0} / laga",
		"ficha $ {0} − gastos $ {1}": "gaji $ {0} − biaya $ {1}",
		"Te miden como {0}": "Kamu dinilai sebagai {0}",
		"Juega {0} partidos  (llevas {1})": "Main {0} laga  (sudah {1})",
		"Promedia {0} de nota  (llevas {1})": "Rata-rata rating {0}  (kini {1})",
		"Te hacen famoso, pero casi todo le sienta mal al técnico o al vestuario.":
			"Bikin kamu terkenal, tapi hampir semuanya tak disukai pelatih atau ruang ganti.",
		"TUYO": "MILIK",
		"ESTÉTICA": "LOOK",
		"Lo único que se compra y SE VE: te cambia de verdad en el hub, en la previa y"
		+ " en la cancha. No da ventaja ninguna, y por eso mismo es tuyo elegirlo. Los"
		+ " cortes y barbas de siempre siguen siendo gratis en PERSONALIZAR.":
			"Satu-satunya yang dibeli dan TERLIHAT: benar-benar mengubahmu di hub, di pra-laga dan di lapangan. Tak memberi keuntungan apa pun, makanya pilihannya sepenuhnya di tanganmu. Potongan rambut dan jenggot standar tetap gratis di KUSTOM.",
		"INVERSIONES": "INVESTASI",
		"Para cuando el dinero sobra: mejoran tu cuerpo o tu bolsillo, para siempre y sin mantenimiento.":
			"Untuk saat uang sudah berlimpah: memperkuat tubuh atau dompetmu, selamanya dan tanpa biaya perawatan.",
		"PONER": "PAKAI",
		"TE QUEDA BIEN": "COCOK BUATMU",
		"LOGRO: {0}": "AWARD: {0}",
		"MANTENIMIENTO  -${0} / PARTIDO": "PERAWATAN  -${0} / LAGA",
		"USAR": "PAKAI",
		"Tu míster. Convéncelo en la cancha.": "Pelatihmu. Yakinkan dia di lapangan.",
		"Decide si juegas y cuántos minutos.":
			"Menentukan kamu main atau tidak, dan berapa menit.",
		"Decide si el balón te llega.": "Menentukan apakah bola sampai ke kakimu.",
		"Sube tu valor y abre las puertas de las marcas.":
			"Menaikkan nilaimu dan membuka pintu bagi merek.",
		"Tu fama: qué marcas te buscan y qué clubes se fijan en ti.":
			"Ketenaranmu: merek mana yang mengincarmu dan klub mana yang melirikmu.",
		"Cuántas ofertas ves, la ficha que te sacan (hasta +15%) y qué tan bien regateas.":
			"Berapa tawaran yang kamu lihat, gaji yang bisa didongkrak (sampai +15%) dan seberapa jago kamu menawar.",
		"Patrocinadores": "Sponsor",
		"Cómo vas con los objetivos de tus marcas.":
			"Sejauh mana target merekmu tercapai.",
		"TUS MARCAS · {0} DE {1}": "MEREKMU · {0} DARI {1}",
		"Ninguna todavía. Sal en la prensa y vendrán solas.":
			"Belum ada. Muncul di pers dan mereka akan datang sendiri.",
		"TE BUSCAN": "DIINCAR",
		"La temporada ya está en marcha: las marcas cerraron sus contratos en"
		+ " pretemporada. Vuelven a buscarte cuando empiece la siguiente.":
			"Musim sudah berjalan: merek-merek menutup kontrak saat pramusim. Mereka akan mencarimu lagi saat musim berikutnya mulai.",
		"Nadie por ahora. La prensa manda aquí.": "Belum ada siapa pun. Pers yang berkuasa di sini.",
		"PRETEMPORADA: es ahora o el año que viene. En cuanto juegues la primera"
		+ " jornada se cierra, y lo que no firmes ya no vuelve esta temporada.":
			"PRAMUSIM: sekarang atau tahun depan. Begitu kamu memainkan pekan pertama, pintunya tutup, dan yang tidak kamu teken tak akan kembali musim ini.",
		"OBJETIVO: {0}": "TARGET: {0}",
		"SIN HUECO": "PENUH",
		"FIRMAR": "TEKEN",
		"{0}  ({1}/{2})  ·  premio ${3}": "{0}  ({1}/{2})  ·  bonus ${3}",
		"{0}  ({1})  ·  premio ${2}": "{0}  ({1})  ·  bonus ${2}",
		"Se cobra al final de la temporada.": "Dibayar di akhir musim.",
		"ROMPER": "PUTUS",
		"¿ROMPER CON {0}?": "PUTUS DARI {0}?",
		"Pierdes el contrato, su pago por partido y el premio del objetivo. No vuelve.":
			"Kamu kehilangan kontrak, bayaran per laganya, dan bonus target. Tak akan kembali.",
		"TUS PATROCINADORES": "SPONSORMU",
		"SIN MARCAS": "NOL MEREK",
		"{0}/{1} OBJETIVOS": "{0}/{1} TARGET",
		"Desde el banquillo no cobras: sólo cuentan (y se pagan) las jornadas de {0}' o más.":
			"Dari bangku cadangan kamu tak dibayar: hanya pekan dengan {0}' main atau lebih yang dihitung (dan dibayar).",
		"Te perdonan parte del objetivo por las {0} jornadas que te perdiste lesionado (firmaste {1}).":
			"Sebagian target diringankan karena {0} pekan yang kamu lewatkan akibat cedera (kamu teken {1}).",
		"Te piden menos jornadas por las {0} que te perdiste lesionado. La media no baja.":
			"Mereka minta lebih sedikit pekan karena {0} yang kamu lewatkan akibat cedera. Target rating tidak turun.",
		"{0} no te llama: le fallaste. Le quedan {1} temporada(s) de enfado.":
			"{0} tak menghubungimu: kamu mengecewakan mereka. Masih {1} musim lagi mereka kesal.",
		"INDEMNIZACIÓN: ${0} de lo que ya te pagaron.":
			"DENDA: ${0} dari yang sudah mereka bayarkan padamu.",
		"ROMPO EL CONTRATO": "AKU PUTUS KONTRAK",
		"CLASIFICACIÓN · {0}": "KLASEMEN · {0}",
		"{0} (TÚ)": "{0} (KAU)",
		"{0} PTS ({1} PJ)": "{0} PTS ({1} MN)",
		"— objetivo del club: {0} —": "— target klub: {0} —",
		"TU GRUPO": "GRUPMU",
		"TU CUADRO": "BAGANMU",
		"¡CAMPEÓN!": "JUARA!",
		"Eliminado": "Tersingkir",
		"Fuera en la fase de grupos": "Gugur di fase grup",
		"Fuera en la fase de liga": "Gugur di fase liga",
		"No la juegas esta temporada — así va en el mundo.":
			"Kamu tak ikut musim ini — begini jalannya di dunia.",
		"Tu club no está esta temporada — así va en el mundo.":
			"Klubmu tak ikut musim ini — begini jalannya di dunia.",
		"Sin campo europeo esta temporada.": "Tanpa kompetisi Eropa musim ini.",
		"CAMPEÓN: {0}": "JUARA: {0}",
		"ACTIVO": "AKTIF",
		"No la juegas esta temporada — mira su carrera de goleo.":
			"Kamu tak ikut musim ini — lihat perburuan top skornya.",
		"COPA NACIONAL": "PIALA LOKAL",
		"Aún no arranca.": "Belum mulai.",
		"¡CAMPEÓN DE COPA!": "JUARA PIALA!",




		"¡CAMPEÓN DE LIGA!": "JUARA LIGA!",
		"¡CAMPEÓN DE COPA DE CAMPEONES!": "JUARA PIALA ELITE!",
		"¡CAMPEÓN DE COPA EUROPA!": "JUARA PIALA EUROPA!",
		"¡CAMPEÓN DE COPA CONFERENCIA!": "JUARA PIALA CHALLENGE!",
		"Fase final de Copa de Campeones": "Fase gugur Piala Elite",
		"Fase final de Copa Europa": "Fase gugur Piala Europa",
		"Fase final de Copa Conferencia": "Fase gugur Piala Challenge",
		"Clasificado a Copa de Campeones": "Lolos ke Piala Elite",
		"Clasificado a Copa Europa": "Lolos ke Piala Europa",
		"Clasificado a Copa Conferencia": "Lolos ke Piala Challenge",
		"Eliminado de la Copa": "Tersingkir dari Piala",
		"A eliminatoria directa: sin tabla de goleadores.":
			"Sistem gugur langsung: tak ada tabel pencetak gol.",
		"MUNDIAL DE CLUBES": "KEJUARAAN DUNIA KLUB",
		"Contra los mejores clubes de otras confederaciones.":
			"Melawan klub-klub terbaik dari konfederasi lain.",
		"¡CAMPEÓN DEL MUNDO DE CLUBES!": "JUARA DUNIA KLUB!",
		"Eliminado del Mundial de Clubes": "Tersingkir dari Kejuaraan Dunia Klub",
		"Aún sin nacionalidad.": "Belum punya kewarganegaraan.",
		"El Mundial se juega cada {0} temporadas; quedar entre los {1} primeros del"
		+ " grupo clasifica.":
			"Kejuaraan Dunia digelar tiap {0} musim; finis di {1} besar grup berarti lolos.",
		"Sin datos de esta competición todavía.": "Belum ada data kompetisi ini.",
		"TOP 10 · GOLEO": "TOP 10 · GOL",
		"TOP 10 · ASISTENCIAS": "TOP 10 · ASSIST",
		"TOP 10 · MEDIA": "TOP 10 · RATING",
		"{0} {1} · vs": "{0} {1} · vs",
		"Por definir": "Belum ditentukan",
		"Por definir.": "Belum ditentukan.",
		"Fase de grupos": "Fase grup",


		"Fase de liga": "Fase liga",



		"EL SORTEO": "UNDIAN",


		"GRUPO DE LA MUERTE": "GRUP MAUT",


		"EL MUNDIAL ES ESTE AÑO": "KEJUARAAN DUNIA TAHUN INI",
		"EL MUNDIAL ES EL AÑO QUE VIENE": "KEJUARAAN DUNIA TAHUN DEPAN",
		"MUNDIAL EN {0} TEMPORADAS": "KEJ. DUNIA {0} MUSIM LAGI",
		"Lo juegas con {0} años.": "Kamu memainkannya di usia {0}.",
		"Llegarás con {0} años.": "Saat itu kamu berusia {0}.",
		"No llegarás: a esa edad ya estarás retirado.": "Kamu tak akan sampai: di usia itu kamu sudah pensiun.",
		"TUS RIVALES": "LAWANMU",
		"{0} EN CASA · {1} FUERA": "{0} HOME · {1} AWAY",
		"Los mismos que verás en tu calendario.":
			"Sama dengan yang akan kamu lihat di jadwalmu.",
		"FASE DE LIGA": "FASE LIGA",
		"TÚ": "KAU",
		"{0}. {1}  {2} PTS ({3} PJ)": "{0}. {1}  {2} PTS ({3} MN)",
		"Aún no arranca": "Belum mulai",
		"¡Campeón de Copa!": "Juara Piala!",
		"En {0}": "Di {0}",
		"En juego": "Berlangsung",
		"¡Campeón de Copa de Campeones!": "Juara Piala Elite!",
		"Fase final": "Fase gugur",
		"OCTAVOS DE FINAL": "16 BESAR",
		"CUARTOS DE FINAL": "PEREMPAT FINAL",
		"SEMIFINAL": "SEMIFINAL",



		"Playoff": "Playoff",
		"PLAYOFF": "PLAYOFF",
		"Octavos": "16 besar",
		"Cuartos": "Perempat final",
		"Semifinal": "Semifinal",
		"Final": "Final",
		"LEYENDAS DEL MUNDO": "LEGENDA DUNIA",
		"TABLEROS MUNDIALES": "RANKING DUNIA",
		"Arriba, las leyendas de tu partida. Aquí, jugadores reales de todo el mundo: tu mejor carrera se manda al cerrar cada temporada.": "Di atas, legenda-legenda save-mu. Di sini, pemain asli dari seluruh dunia: karier terbaikmu dikirim tiap akhir musim.",
		"VER EN GAME CENTER": "BUKA GAME CENTER",
		"FORTUNA": "HARTA",
		"LOGROS EN GAME CENTER": "PRESTASI DI GAME CENTER",
		"Arriba, tu catálogo completo. En Game Center, los que Apple conoce: se mandan solos al desbloquearse, y ahí se ve cuántos jugadores del mundo tienen cada medalla.": "Di atas, katalog lengkapmu. Di Game Center, yang dikenal Apple: terkirim otomatis saat terbuka, dan di sana terlihat berapa pemain dunia yang memiliki tiap medali.",
		"TOP {0}": "TOP {0}",
		"MÁS TROFEOS INDIVIDUALES": "TROFI INDIVIDU TERBANYAK",
		"MÁS TROFEOS DE EQUIPO": "TROFI TIM TERBANYAK",
		"MÁS TROFEOS EN TOTAL": "TOTAL TROFI TERBANYAK",
		"Los premios que se ganan uno solo: el mejor del año y las botas de goleo.":
			"Penghargaan yang dimenangkan sendirian: pemain terbaik tahun ini dan sepatu emas top skor.",
		"Ligas, copas, continentales y Mundiales: lo que se levanta con once.":
			"Liga, piala, kontinental, dan Kejuaraan Dunia: yang diangkat bersama sebelas pemain.",
		"La vitrina entera, sin preguntar de dónde salió cada trofeo.":
			"Seluruh lemari trofi, tanpa tanya dari mana tiap trofi berasal.",
		"LEYENDAS POR LIGA": "LEGENDA PER LIGA",
		"LEYENDAS POR CLUB": "LEGENDA PER KLUB",
		"No ha habido leyendas en {0}… aún.": "Belum ada legenda di {0}… sampai sekarang.",
		"este club": "klub ini",
		"INDIV.": "INDIV.",
		"EQUIPO": "TIM",
		"GOLES + ASISTENCIAS": "GOL + ASSIST",
		"LA LEYENDA A TIRO": "LEGENDA DEKAT",
		"A {0} DE LA LEYENDA": "JARAK {0} KE LEGENDA",
		"IGUALADO CON LA LEYENDA": "SAMA DENGAN LEGENDA",
		"Máximos productores de la historia (G+A). Sólo cuenta lo hecho en 1ª división"
		+ " o con tu selección: es lo que mide a los grandes.":
			"Pemain paling produktif sepanjang sejarah (G+A). Hanya hasil di kasta tertinggi atau timnasmu yang dihitung: itulah ukuran pemain hebat.",
		"TU PRODUCCIÓN · POR CATEGORÍA": "PRODUKSIMU · PER KATEGORI",
		"ÉLITE (1ª + SELECCIÓN)": "ELIT (D1 + TIMNAS)",
		"TOTAL (TODAS LAS CATEGORÍAS)": "TOTAL (SEMUA KATEGORI)",
		"La diferencia ({0} G · {1} A) es lo hecho en 2ª y 3ª división.":
			"Selisihnya ({0} G · {1} A) diraih di divisi dua dan tiga.",
		"Balón de Oro": "Pemain Terbaik",
		"Goleo": "Sepatu Emas",
		"Ligas": "Liga",
		"Copas": "Piala",
		"Continental": "Kontinental",
		"Mundial": "Kejuaraan Dunia",
		"LOS MÁS LAUREADOS DEL MUNDO": "PALING BERGELAR DI DUNIA",
		"CLUBES · {0}": "KLUB · {0}",


		"TE QUIEREN": "MENGINCARMU",
		"TE MIRA": "MEMANTAUMU",
		"NADIE": "NIHIL",
		"1 CLUB": "1 KLUB",
		"Hoy ningún club te ficharía a tu nivel. Rinde y sube tu valor para que empiecen a mirarte.": "Hari ini tak ada klub yang mau merekrutmu di levelmu. Tampil bagus dan naikkan nilaimu agar mereka mulai melirik.",
		"{0} CLUBES": "{0} KLUB",
		"CLUB": "KLUB",
		"INTERNACIONALIDADES": "LAGA TIMNAS",
		"GOLES": "GOL",
		"{0} · TEMPORADA {1}{2}": "{0} · MUSIM {1}{2}",
		"no convocado": "tak dipanggil",
		"RUMBO AL MUNDIAL": "MENUJU KEJUARAAN DUNIA",
		"El Mundial se juega cada 4 temporadas. Quedar entre los {0} primeros de tu"
		+ " grupo clasifica.":
			"Kejuaraan Dunia digelar tiap 4 musim. Finis di {0} besar grup berarti lolos.",
		"HISTORIAL": "RIWAYAT",
		"Aún no has cerrado una temporada con la selección.":
			"Kamu belum menutup satu musim pun bersama timnas.",
		"T{0} · {1}": "M{0} · {1}",
		"SELECCIÓN DE {0}": "TIMNAS {0}",
		"FUERA DE LA CONVOCATORIA": "TAK DIPANGGIL",
		"SIN DORSAL": "TANPA NOMOR",
		"VER CONVOCATORIA": "LIHAT PANGGILAN",





		"PTS": "PTS",
		"A {0} PUESTOS": "{0} PERINGKAT",
		"PUESTO {0}": "RANK {0}",
		"Tu media es {0}. Con la vara de {1} son {2}; {3} de fama y {4} de mérito la dejan en {5}.":
			"Rating-mu {0}. Pada skala {1} itu jadi {2}; {3} ketenaran dan {4} prestasi membuatnya {5}.",
		"CORTE LISTA": "BATAS SKUAD",
		"CORTE ONCE": "BATAS INTI",


		"Eres el número {0} de {1} por puntuación, pero el sitio que ocuparías es el de {2} ({3}): a nadie que te saque más de {4} se le quita el puesto. Necesitas {5}.":
			"Berdasarkan skor kamu urutan ke-{0} di {1}, tapi tempat yang akan kamu ambil adalah milik {2} ({3}): siapa pun yang unggul lebih dari {4} darimu tak akan digeser. Kamu butuh {5}.",
		"Entras en la lista, pero no en el once: el sitio que ocuparías es el de {0} ({1}) y a nadie que te saque más de {2} se le quita el puesto. Necesitas {3}.":
			"Kamu masuk skuad, tapi belum masuk tim inti: tempat yang akan kamu ambil adalah milik {0} ({1}) dan siapa pun yang unggul lebih dari {2} darimu tak akan digeser. Kamu butuh {3}.",

		"Lo que más te acerca: ganarte al seleccionador en la concentración (hasta {0}), un título individual (hasta {1}) y tu temporada de club (hasta {2}).":
			"Yang paling mendekatkanmu: memikat pelatih timnas saat TC (hingga {0}), gelar individu (hingga {1}) dan musim klubmu (hingga {2}).",




		"Tu puntuación ya es {0} y hoy daría para entrar, pero la lista de esta campaña se cerró antes de que llegaras: el seleccionador no la rehace a mitad de camino. Tu sitio se juega en la próxima.":
			"Skormu sudah {0} dan hari ini cukup untuk masuk, tapi skuad kali ini diumumkan sebelum kamu sampai: pelatih timnas tak menyusunnya ulang di tengah jalan. Tempatmu diperebutkan di daftar berikutnya.",
		"Sigues en la lista de esta campaña: al seleccionador no le gusta cortar a nadie a mitad de camino. Pero tu puntuación cayó a {0} y el corte está en {1}: si no reaccionas, la próxima lista se hace sin ti.":
			"Kamu masih di skuad kali ini: pelatih timnas tak suka mencoret siapa pun di tengah jalan. Tapi skormu turun ke {0} dan batasnya {1}: kalau tak bangkit, daftar berikutnya disusun tanpamu.",

		"Debut: {0} años": "Debut: usia {0}",
		"Temporada {0}": "Musim {0}",
		"marcaste": "kamu mencetak",
		"RETIRADO DE LA SELECCIÓN": "PENSIUN DARI TIMNAS",
		"RETIRARTE DE LA SELECCIÓN": "PENSIUN DARI TIMNAS",
		"YA NO ENTRAS EN LA LISTA": "TAK MASUK DAFTAR LAGI",
		"GOLEADORES HISTÓRICOS": "TOP SKOR ABADI",
		"¿CUELGAS LA CAMISETA DE TU PAÍS?": "GANTUNG JERSEY NEGARAMU?",
		"El seleccionador ya no cuenta contigo. Tus {0} partidos y {1} goles quedan sellados, y las fechas de selecciones dejan de costarte energía. Sólo un Mundial podría hacerte volver.": "Pelatih timnas tak lagi mengandalkanmu. {0} lagamu dan {1} golmu terkunci, dan jeda internasional tak lagi menguras energimu. Hanya Kejuaraan Dunia yang bisa membuatmu kembali.",

		"Colgaste la camiseta de {0}. Sus torneos siguen en tu calendario, pero"
		+ " los ves desde fuera.":
			"Kamu gantung jersey {0}. Turnamennya tetap ada di jadwalmu, tapi kamu menontonnya dari luar.",
		"VOLVER PARA EL MUNDIAL": "IKUT KEJUARAAN DUNIA",
		"¿VUELVES DEL RETIRO?": "BATAL PENSIUN?",
		"{0} juega el Mundial y el seleccionador te quiere en la lista. Volver es volver de verdad: las fechas de selecciones vuelven a contar contigo.": "{0} tampil di Kejuaraan Dunia dan pelatih timnas menginginkanmu di daftar. Kembali itu sungguhan: kamu dipanggil lagi tiap jeda internasional.",
		"VUELVO": "KEMBALI",
		"{0} JUGADORES": "{0} PEMAIN",
		"Grupo por definir.": "Grup belum ditentukan.",
		"{0}. {1}  {2} PTS ({3})": "{0}. {1}  {2} PTS ({3})",
		"— corte de clasificación —": "— batas lolos —",
		"Ahora mismo: {0}": "Saat ini: {0}",
		"CLASIFICADA": "LOLOS",
		"fuera del Mundial": "tersingkir dari Kejuaraan Dunia",
		"fuera de {0}": "tersingkir dari {0}",
		"Cuadro por definir.": "Bagan belum ditentukan.",
		"{0} no está en {1}.": "{0} tidak ada di {1}.",
		"Clasifícala la próxima vez quedando entre los tres primeros de tu grupo.":
			"Loloskan lain kali dengan finis di tiga besar grupmu.",
		"¡{0}, CAMPEÓN de {1}!": "{0}, JUARA {1}!",
		"Proyección de {0}: {1}": "Proyeksi {0}: {1}",
		"{0} selecciones en el cuadro. Tu papel en el club mueve la aguja: rinde y"
		+ " llévala lejos.":
			"{0} timnas di bagan. Peranmu di klub berpengaruh: tampil bagus dan bawa mereka melaju jauh.",
		"Las clasificatorias aún no empiezan.": "Kualifikasi belum dimulai.",
		"{0}. {1}  {2} PTS ({3}, {4} PJ)": "{0}. {1}  {2} PTS ({3}, {4} MN)",
		"— corte de clasificación al Mundial —": "— batas lolos Kejuaraan Dunia —",
		"¡{0} CLASIFICADA!": "{0} LOLOS!",
		"{0} se quedó fuera del Mundial": "{0} gagal ke Kejuaraan Dunia",
		"{0} · vs": "{0} · vs",
		"{0} quedó eliminada de {1}": "{0} tersingkir dari {1}",
		"LIBRO DE RÉCORDS": "BUKU REKOR",
		"LIGA · CLUB · MUNDO": "LIGA · KLUB · DUNIA",
		"ABRIR": "BUKA",
		"VITRINA": "LEMARI",
		"Aún vacía. Gana una liga, una copa o una bota y aquí lucirá tu primer trofeo.":
			"Masih kosong. Menangkan liga, piala atau sepatu emas dan trofi pertamamu akan terpajang di sini.",
		"TEMPORADA A TEMPORADA": "MUSIM DEMI MUSIM",
		"EN EQUIPO · {0}": "TIM · {0}",
		"INDIVIDUALES · {0}": "INDIVIDU · {0}",
		"Aún no has cerrado ninguna temporada.": "Kamu belum menutup satu musim pun.",
		"* temporada en curso": "* musim berjalan",
		"El detalle por temporada aparecerá aquí al cerrar la temporada en la que ganes"
		+ " tu próximo premio.":
			"Rincian per musim muncul di sini setelah kamu menutup musim saat meraih penghargaan berikutnya.",
		"POR TEMPORADA": "PER MUSIM",
		"TRASPASOS": "TRANSFER",
		"Sigues donde empezaste.": "Kamu masih di tempat kamu mulai.",
		"LEGADO": "LEGACY",
		"Puntos de legado: {0} — suben con goles, títulos y partidos con tu"
		+ " selección.":
			"Poin legacy: {0} — naik lewat gol, gelar dan laga timnas.",
		"Vía Mundo · prestigio {0}/{1}": "Jalur Dunia · prestise {0}/{1}",
		"necesitas {0} puntos de legado": "butuh {0} poin legacy",
		"Vía Club · {0}/{1} títulos": "Jalur Klub · {0}/{1} gelar",
		"{0} histórico del club": "{0} sepanjang masa di klub",
		"(pide top-2)": "(syarat top-2)",
		"aún no figuras entre sus leyendas": "belum termasuk legendanya",
		"Fuera del top {0} de la historia": "Di luar top {0} sepanjang masa",
		"{0} de la historia": "{0} sepanjang masa",
		"Nadie por encima: el más grande que ha pisado un campo.":
			"Tak ada di atasmu: yang terbesar yang pernah menginjak lapangan.",
		"El siguiente a superar": "Target berikutnya",
		"Te falta 1 trofeo": "Kurang 1 trofi",
		"Te faltan {0} trofeos": "Kurang {0} trofi",
		"Goles por temporada": "Gol per musim",
		"{0}T": "{0}M",
		"COMO SE SUBE": "CARA NAIK",
		"Goles, asistencias y partidos con tu selección suman siempre — los"
		+ " primeros valen mucho y el volumen se aplana. Los trofeos suman entero"
		+ " lo suyo:":
			"Gol, assist, dan laga timnas selalu menambah — yang awal bernilai besar, lalu tambahannya melandai. Trofi menambah penuh bagiannya:",
		"{0} a los {1}": "{0} di {1}",
		"ASÍ VA LA VOTACIÓN": "VOTING SEMENTARA",
		"Con lo jugado hasta la jornada {0} de {1}. Si la temporada cerrara hoy,"
		+ " el 1º se lo lleva: el ranking manda, sin excepciones.":
			"Berdasarkan laga hingga pekan {0} dari {1}. Kalau musim berakhir hari ini, peringkat 1 yang menang: ranking berkuasa, tanpa kecuali.",
		"Sólo votan la PRIMERA división de las ligas EUROPEAS. Y los títulos del"
		+ " año entran al cierre: una {0} son {1} puntos que hoy no lleva nadie.":
			"Hanya divisi UTAMA liga-liga EROPA yang memilih. Dan gelar tahun ini masuk saat penutupan: satu {0} bernilai {1} poin yang hari ini belum dimiliki siapa pun.",
		"Gana el que más puntos suma, sin excepciones. Los títulos no son una"
		+ " llave aparte: son la forma más rápida de sumar.":
			"Yang poinnya terbanyak menang, tanpa kecuali. Gelar bukan jalur terpisah: itu cara tercepat menambah poin.",
		"La LIGA y la COPA valen según la liga en que se ganan: las cinco grandes"
		+ " pagan el doble que las ligas pequeñas. Abajo van los puntos de TU liga.":
			"LIGA dan PIALA bernilai sesuai liga tempat dimenangkan: lima liga besar membayar dua kali lipat liga kecil. Di bawah ini poin untuk LIGAMU.",
		"Tú vas más abajo:": "Posisimu lebih di bawah:",
		"El mejor de tu equipo:": "Terbaik di klubmu:",
		"Aún no has jugado este año: sin partidos no hay votación que valga.":
			"Kamu belum main tahun ini: tanpa laga tak ada voting yang berlaku.",
		"Tu liga no vota: para entrar hay que jugar la PRIMERA división de una"
		+ " liga EUROPEA.":
			"Ligamu tidak ikut voting: untuk masuk harus main di divisi UTAMA liga EROPA.",
		"{0} para {1}": "{0} untuk {1}",
		"TU RECORRIDO": "PERJALANANMU",


		"T{0}-T{1}": "M{0}-M{1}",
		"Llegaste CEDIDO": "Datang sebagai PINJAMAN",
		"Pagaron ${0} por ti": "Mereka bayar ${0} untukmu",
		"Aquí empezaste": "Di sini kamu mulai",
		"Llegaste gratis": "Datang gratis",
		"GLOBAL": "TOTAL",
		"PARTIDOS": "LAGA",
		"{0}V · {1}E · {2}D": "{0}M · {1}S · {2}K",
		"ASISTENCIAS": "ASSIST",
		"MEDIA": "RATING",



		"GOLEO": "GOL",
		"mejor: {0}": "terbaik: {0}",
		"TEMPORADAS": "MUSIM",
		"en {0} {1}": "di {0} {1}",
		"INTERNACIONAL": "INTERNASIONAL",
		"{0} goles con {1}": "{0} gol untuk {1}",
		"$ {0}  ·  ahora": "$ {0}  ·  sekarang",
		"La curva aparece al cerrar tu segunda temporada.":
			"Kurva muncul setelah kamu menutup musim keduamu.",
		"Pico: ${0} en la temporada {1}": "Puncak: ${0} di musim {1}",
		"T{0} · ${1}": "M{0} · ${1}",
		"tabLIGA": "LIGA",
		"tabCHAMP": "ELITE",
		"tabEUROPA": "EUROPA",
		"tabCOPA": "CUP",
		"tabCLUBES": "KLUB",
		"tabMUNDIAL": "DUNIA",
		"tabCONTIN.": "KONT.",
		"tabCLASIF": "KUALIF",
		"palmaresLIGA": "LIGA",
		"palmaresCOPA": "CUP",
		"palmaresCONT.": "KONT.",
		"tablaTEMP": "MUS",
		"tablaCLUB": "KLUB",
		"tablaPJ": "MN",
		"tablaG": "G",
		"tablaA": "A",
		"tablaNOTA": "RTG",


		"tabla_ligaEQUIPO": "TIM",
		"tabla_ligaPJ": "MN",
		"tabla_ligaG": "M",
		"tabla_ligaE": "S",
		"tabla_ligaP": "K",
		"tabla_ligaPTS": "PTS",
		"tabla_ligaGOLES": "GOL",
		"tabla_ligaASIST": "AST",

		"CED": "PINJ",
		"{0}A": "{0}T",
		"{0}S": "{0}M",
		"{0}P": "{0}L",
		"CEDIDO · NO SE RENUEVA": "PINJAMAN · TAK LANJUT",
		"TREN DE VIDA": "GAYA HIDUP",
		"NETO POR PARTIDO": "BERSIH PER LAGA",
		"TUS NOES": "TOLAKAN",
		"SE VAN HOY": "PERGI",
		"Se hartaron de tus noes: el club contaba con esa venta. El técnico deja de contar contigo hasta el año que viene.":
			"Mereka bosan dengan penolakanmu: klub mengandalkan penjualan itu. Pelatih tak mengandalkanmu lagi sampai tahun depan.",
		"Llevas muchos noes: lo que llega ahora ya no es del nivel de lo que tumbaste.":
			"Penolakanmu sudah menumpuk: yang datang sekarang tak lagi selevel dengan yang kamu tolak.",
		"Tu agente sostiene esa oferta: se sabe en la próxima jornada.":
			"Agenmu menahan tawaran itu: kamu akan tahu di pekan berikutnya.",
		"Tu agente no acepta más encargos esta ventana.":
			"Agenmu tak menerima tugas lagi di bursa ini.",
		"Te quedan {0} encargo(s) esta ventana (tu agente acepta más cuanto mejor te trate).":
			"Tersisa {0} tugas di bursa ini (agenmu menerima lebih banyak bila hubunganmu makin baik).",
		"Tu agente puede llamar igual, pero volverá con las manos vacías y te costará {0}, un poco de vestuario y el trato con él.":
			"Agenmu tetap bisa menelepon, tapi akan pulang dengan tangan kosong: kamu kehilangan {0}, sedikit nama baik di ruang ganti, dan hubungan baik dengannya.",
		"Tu club no te deja salir: pide el traspaso primero.":
			"Klubmu tak membolehkanmu pergi: ajukan transfer dulu.",
		"El mercado está cerrado: el botón de irte aparece al abrir la ventana. Negarte, puedes ya.":
			"Bursa tutup: tombol pergi muncul saat bursa dibuka. Menolak bisa kapan saja.",
		"PEDISTE EL TRASPASO": "TRANSFER DIMINTA",
		"ESTÁS CEDIDO": "DIPINJAMKAN",
		"Juegas en {0}, pero tu pase es de {1}.":
			"Kamu main di {0}, tapi kamu masih milik {1}.",
		"tu club dueño": "klub indukmu",
		"Mientras dure la cesión, aquí no hay nada que firmar ni negociar. Vuelves a {0} al cerrar la temporada.":
			"Selama pinjaman berlangsung, tak ada yang perlu ditandatangani atau dinegosiasikan di sini. Kamu kembali ke {0} saat musim berakhir.",
		"Hay clubes esperándote cedido, pero el mercado está cerrado: la cesión se firma cuando abra la ventana.":
			"Ada klub yang ingin meminjammu, tapi bursa tutup: pinjaman diteken saat bursa dibuka.",
		"Estás EN LISTA DE CESIÓN: mientras sigas en ella, cada ventana te trae destinos nuevos.":
			"Kamu ada di DAFTAR PINJAMAN: selama masih di sana, tiap bursa membawa tujuan baru.",
		"{0} · titular probable · una temporada": "{0} · calon inti · satu musim",
		"Sueldo/partido": "Gaji/laga",
		"Prima (sin traspaso)": "Bonus (tanpa biaya)",
		"Traspaso": "Biaya",
		"Tu prima": "Bonusmu",


		"Prima (bruta)": "Bonus (kotor)",
		"Te queda limpio": "Kamu terima",
		"Tu prima (limpia)": "Bonusmu (bersih)",
		"(−{0}% agente)": "(−{0}% agen)",
		"LA SOSTIENE TU AGENTE": "DITAHAN AGENMU",
		"HOY O NUNCA": "TERAKHIR",
		"Va {0} de {1} en {2} · {3}": "Peringkat {0} dari {1} di {2} · {3}",
		"RECHAZAR ESTA OFERTA": "TOLAK TAWARAN INI",




		"MANTÉN PARA FICHAR": "TAHAN UNTUK TEKEN",
		"¿ENCARGAR?": "TUGASKAN?",
		"MANTÉN PARA ENCARGAR": "TAHAN UNTUK TUGASKAN",
		"Tu agente trabajará {0} esta ventana. Cuesta {1}.": "Agenmu akan menggarap {0} di bursa ini. Biayanya {1}.",
		"la liga de {0}": "liga {0}",
		"MANTÉN PARA FIRMAR": "TAHAN UNTUK TEKEN",
		"MANTÉN PARA NO RENOVAR": "TAHAN: TAK PERPANJANG",
		"MANTÉN PARA FIRMAR EL PRECONTRATO": "TAHAN UNTUK TEKEN PRAKONTRAK",
		"MANTÉN PARA RECHAZAR": "TAHAN UNTUK TOLAK",
		"TU CLUB NO TE VENDE: te queda contrato y cuentan contigo. Pide el traspaso ahí abajo para poder firmar.":
			"KLUBMU TAK MAU MENJUALMU: kontrakmu masih jalan dan mereka mengandalkanmu. Ajukan permintaan transfer di bawah agar bisa teken.",
		"QUE TU AGENTE LA SOSTENGA": "BIAR AGENMU MENAHANNYA",
		"TU AGENTE LA SOSTIENE · RESPONDEN MAÑANA": "AGENMU MENAHANNYA · DIJAWAB BESOK",
		"Se retiran de la puja para siempre en este mercado. El mercado cierra hoy: nadie ocupará su hueco.":
			"Mereka mundur dari perebutan untuk selamanya di bursa ini. Bursa tutup hari ini: tak ada yang akan mengisi tempat mereka.",
		"Tu club contaba con esta venta: con este NO se les acaba la paciencia y el técnico dejará de contar contigo.":
			"Klubmu mengandalkan penjualan ini: kalau kamu bilang TIDAK, kesabaran mereka habis dan pelatih tak akan memakaimu lagi.",
		"Tu club contaba con esta venta: te quedan {0} noes antes de que se les acabe la paciencia.":
			"Klubmu mengandalkan penjualan ini: kamu masih boleh menolak {0} kali lagi sebelum kesabaran mereka habis.",
		"Y llevas muchos noes: lo que llegue en su lugar vendrá por debajo de lo que estás tumbando.":
			"Dan kamu sudah banyak menolak: yang datang menggantikannya akan lebih rendah dari yang kamu tolak.",
		"OFERTA RECHAZADA · EL MERCADO CIERRA HOY": "TAWARAN DITOLAK · BURSA TUTUP HARI INI",
		"CONCENTRADO CON {0}": "TC DENGAN {0}",
		"Aquí mandan otros. Que tu club te adore no le dice nada al seleccionador: a esta gente te la ganas jugando las fechas FIFA.":
			"Di sini yang berkuasa orang lain. Dipuja klubmu tak berarti apa-apa bagi pelatih timnas: hati mereka kamu rebut dengan bermain di jeda internasional.",
		"Seleccionador": "Pelatih timnas",
		"Es quien firma la lista. Mira tu nota cuando juegas con el país.":
			"Dialah yang meneken daftar pemain. Dia melihat ratingmu saat kamu membela negara.",
		"Las tres suman {0} puntos a tu convocatoria.":
			"Ketiganya menambah {0} poin ke panggilanmu.",
		"Vestuario de la selección": "Ruang ganti timnas",
		"Se gana ganando juntos. Una derrota jugando mal es lo que más resta.":
			"Diraih dengan menang bersama. Kalah sambil main buruk paling banyak mengurangi.",
		"Afición de {0}": "Suporter {0}",
		"Le enamora que marques. En casa, si te quiere te llega un balón más; si te pita, uno menos.":
			"Gol yang memikat mereka. Di kandang, kalau mereka cinta, kamu dapat satu bola lagi; kalau menyoraki, satu berkurang.",
		"LOS TUYOS, ESTÉS DONDE ESTÉS": "ORANGMU, DI MANA PUN KAMU",
		"Te siguen a todas partes: lo que hagas con tu país también cuenta.":
			"Mereka mengikutimu ke mana pun: apa yang kamu lakukan untuk negaramu juga dihitung.",
		"Sigue siendo el tuyo. Una buena fecha FIFA sube tu precio.":
			"Masih orangmu. Jeda internasional yang bagus menaikkan hargamu.",
		"COPA EU": "ELITE",
		"COPA C.": "EUROPA",
		"COPA 3": "CONF.",
		"ASCENSO": "NAIK",
		"DESCENSO": "TURUN",
		"CUADRO": "BAGAN",
		"Torneo en curso.": "Turnamen sedang berjalan.",
		"Quedar entre los {0} primeros del grupo clasifica para {1}.":
			"Finis di {0} besar grup membawamu lolos ke {1}.",
		"Pasan los {0} primeros de cada grupo.": "{0} tim teratas tiap grup lolos.",
		"El cuadro se sortea al acabar la fase de grupos.":
			"Bagan diundi setelah fase grup selesai.",


		"El cuadro se sortea al acabar la primera fase.":
			"Bagan diundi setelah fase pertama selesai.",
		"Del 1 al {0}, a octavos. Del {1} al {2}, al playoff. El resto, fuera.":
			"Peringkat 1 sampai {0} ke 16 besar. {1} sampai {2} ke playoff. Sisanya tersingkir.",
		"Todavía no se ha entregado ninguno. Se falla al cerrar cada temporada, con los números de todo el mundo.":
			"Belum ada yang diberikan. Diputuskan saat tiap musim ditutup, dari angka semua pemain.",
		"LA VOTACIÓN": "VOTING",

		"EL ONCE IDEAL": "BEST XI",

		"{0} ligas en {1} años": "{0} gelar liga dalam {1} tahun",
		"Aún no se ha cerrado ninguna temporada.": "Belum ada musim yang selesai.",
		"Antes de tu carrera, sin fechas: {0}": "Sebelum kariermu, tanpa tanggal: {0}",
		"Los once mejores de {0} esa temporada, por nota media.": "Sebelas terbaik {0} musim itu, berdasarkan rating rata-rata.",
		"Los que más cerca estuvieron, con lo que hizo cada uno. Los puntos salen del baremo de abajo.":
			"Yang paling dekat, beserta apa yang dilakukan masing-masing. Poin dari skala di bawah.",
		"Tú quedaste más abajo:": "Kamu finis lebih bawah:",
		"Ese año no entraste en la votación.": "Tahun itu kamu tidak masuk voting.",
		"Una línea por temporada: goles, asistencias, media y puntos de la votación. Toca una para verla completa.":
			"Satu baris per musim: gol, assist, rating, dan poin voting. Ketuk satu untuk lihat lengkap.",
		"ASIST.": "AST",
		"PUNTOS": "POIN",
		"No levantó ningún título esa temporada.": "Tak mengangkat trofi apa pun musim itu.",
		"También: {0}": "Juga: {0}",
		"COMO SE GANA": "CARA MENANG",
		"Los puntos con los que se elige al mejor del año. Los de tu selección y los de Europa pesan más.":
			"Poin untuk memilih yang terbaik tahun ini. Poin timnas dan Eropa bobotnya lebih besar.",
		"Sólo entran en la votación los que juegan la PRIMERA DIVISIÓN de una liga EUROPEA.":
			"Hanya pemain KASTA TERTINGGI liga EROPA yang masuk voting.",
		"GOL EN LIGA": "GOL LIGA",
		"ASISTENCIA EN LIGA": "ASSIST LIGA",
		"GOL EN {0}": "GOL {0}",
		"ASISTENCIA EN {0}": "ASSIST {0}",
		"CADA DECIMA DE MEDIA SOBRE {0}": "TIAP 0.1 RATING DI ATAS {0}",
		"{0} PTS": "{0} PTS",
		"{0}G {1}A  ·  {2}": "{0}G {1}A  ·  {2}",
		"  ({0} en {1})": "  ({0} di {1})",
		"TE PIDIERON: {0}   {1}/{2}": "DIMINTA: {0}   {1}/{2}",
		"CAPITÁN DE {0}": "KAPTEN {0}",
		"Llevas la cinta desde hace {0} temporadas.": "Sudah {0} musim kamu memakai ban kapten.",
		"JUGAR PARA {0}": "MAIN UNTUK {0}",
		"SU ONCE CORTA EN {0}": "BATAS INTI {0}",
		"¿JUGAR PARA {0}?": "MAIN UNTUK {0}?",
		"Llevas {0} temporadas jugando ahí y ningún partido oficial te ata todavía a {1}. Su once corta en {2}; el de {1}, en {3}.":
			"Sudah {0} musim kamu main di sana dan belum ada laga resmi yang mengikatmu ke {1}. Batas tim inti mereka {2}; {1}, {3}.",
		"No hay marcha atrás. Empiezas de cero con ellos: el seleccionador, el vestuario y la afición vuelven a no conocerte, y pierdes el brazalete si lo llevabas. Tus partidos y tus goles se quedan en tu historial.":
			"Tak ada jalan kembali. Kamu mulai dari nol bersama mereka: pelatih timnas, ruang ganti, dan suporter kembali tak mengenalmu, dan kamu kehilangan ban kapten kalau sedang memakainya. Laga dan golmu tetap di riwayatmu.",
		"SÍ, ELIJO {0}": "YA, PILIH {0}",
		"SEGUIR CON LOS MÍOS": "TETAP BELA NEGARAKU",
		"{0} se juega al terminar la temporada de clubes; el campeón se sabrá entonces.":
			"{0} dimainkan setelah musim klub berakhir; juaranya baru diketahui saat itu.",
		"Clasifícala la próxima vez quedando entre los {0} primeros de tu grupo.":
			"Lolos ke sana lain kali dengan finis di {0} besar grupmu.",
		"Cada sello es un título: temporada · club · división.":
			"Tiap cap adalah satu gelar: musim · klub · divisi.",
		"LO QUE SE PUEDE GANAR": "YANG DIPEREBUTKAN",
		"+{0} SIN REGISTRO": "+{0} TAK DICATAT",

		"GRADA": "TRIBUN",
		"+{0} más": "+{0} lagi",
		"CED = esa temporada la jugaste CEDIDO: el club de la fila te tenía prestado, no eras suyo.":
			"PINJ = musim itu kamu DIPINJAMKAN: klub di baris itu meminjammu, kamu bukan milik mereka.",
		"MAPA DE TIROS": "PETA TEMBAKAN",
		"PEDIR EL CAMBIO": "MINTA DIGANTI",
		"PROGRESIÓN": "PROGRES",
		"Aún no has rematado. Cada tiro que pegues este año queda marcado aquí, con el sitio desde el que salió.":
			"Kamu belum menembak. Tiap tembakanmu tahun ini ditandai di sini, lengkap dengan titik asalnya.",
		"Ese año aún no se apuntaban los remates.":
			"Tahun itu tembakan belum dicatat.",
		"Ese año aún no se apuntaban los pases.":
			"Tahun itu umpan belum dicatat.",
		"Ese año aún no se apuntaba por dónde te movías.":
			"Tahun itu pergerakanmu belum dicatat.",
		"En este partido no remataste.":
			"Di laga ini kamu tidak menembak.",
		"En este partido no le dejaste el balón a nadie.":
			"Di laga ini kamu tidak memberi bola ke siapa pun.",
		"En este partido no quedó rastro de tus movimientos.":
			"Di laga ini tak ada jejak gerakanmu.",
		"A PUERTA": "ON TARGET",
		"Sobre {0} remates medidos": "Dari {0} tembakan terukur",
		" · {0} bloqueados (no cuentan: no fue tu puntería)":
			" · {0} diblok (tak dihitung: bukan soal akurasimu)",
		"EL MARCO — dónde cruzó cada tiro": "GAWANG — arah tiap tembakan",
		"EL CAMPO — desde dónde tiraste": "LAPANGAN — posisi tembakanmu",



		"DESVIADO": "MELEBAR",
		"TAPADO": "DIBLOK",
		"ANULADO": "BATAL",
		"POR DÓNDE ANDUVISTE": "JEJAK GERAKMU",

		"REGATE GANADO": "DRIBEL SUKSES",
		"SALISTE CON {0}": "AWAL {0}",
		"ACABAS EN {0}": "AKHIR {0}",
		"RECUPERASTE": "PULIH",
		"OTRAS COMPRAS": "PEMBELIAN LAIN",
		"DESCANSO Y FÍSICO": "ISTIRAHAT & FISIK",
		"SIN CAMBIOS": "TAK BERUBAH",
		"EN TODA TU CARRERA": "SELURUH KARIERMU",
		"DESDE MÁS LEJOS": "JARAK TERJAUH",
		"TU GOL MÁS LEJANO": "GOL TERJAUHMU",
		"TU PASE MÁS LARGO": "UMPAN TERJAUHMU",
		"Ese año: gol desde {0} m": "Tahun itu: gol dari {0} m",
		"Esta temporada: gol desde {0} m": "Musim ini: gol dari {0} m",
		"EL MÁS LARGO": "TERJAUH",
		"Ese año: pase de {0} m": "Tahun itu: umpan {0} m",
		"Esta temporada: pase de {0} m": "Musim ini: umpan {0} m",
		"MAPA": "PETA",
		"MAPA DE PASES": "PETA UMPAN",
		"REGATES": "DRIBEL",
		"MAPA DE REGATES": "PETA DRIBEL",
		"JUGADA ABIERTA": "OPEN PLAY",
		"TODA TU CARRERA": "SELURUH KARIER",
		"JUGADA": "AKSI",
		"TIRO LIBRE": "FREE KICK",
		"CÓRNER": "KORNER",
		" · sólo {0}": " · {0} saja",
		"Aún no has pisado el campo. Aquí va a quedar el rastro de por dónde te mueves, dónde te quitan el balón y dónde te hacen falta.":
			"Kamu belum menginjak lapangan. Di sini akan tampak jejak gerakanmu, di mana bola direbut darimu, dan di mana kamu dilanggar.",
		"TE LA QUITARON": "BOLA HILANG",
		"FALTAS A FAVOR": "DILANGGAR",
		"LA CANCHA — atacas hacia la derecha": "LAPANGAN — kamu menyerang ke kanan",
		"Toca una marca del campo para ver la jugada.": "Ketuk tanda di lapangan untuk melihat aksinya.",
		"min {0}": "mnt {0}",
		"Viendo {0} de {1} · toca otra vez el chip para verlo todo":
			"Menampilkan {0} dari {1} · ketuk chip lagi untuk lihat semua",
		"{0}: {1}": "{0}: {1}",
		"ninguno en {0}": "tak ada di {0}",
		"1 de cada {0}": "1 dari {0}",
		"Tus asistencias salen sobre todo {0}: {1} de {2}":
			"Assistmu kebanyakan datang {0}: {1} dari {2}",
		"Donde más te la quitan: {0}, {1}.": "Paling sering bolamu direbut: {0}, {1}.",
		"en el último tercio": "di sepertiga akhir",
		"en el medio campo": "di lini tengah",
		"en tu propio campo": "di separuh lapanganmu sendiri",
		"POR LA IZQUIERDA": "LEWAT KIRI",
		"POR EL CENTRO": "LEWAT TENGAH",
		"POR LA DERECHA": "LEWAT KANAN",
		"AL LADO IZQUIERDO": "KE SISI KIRI",
		"AL LADO DERECHO": "KE SISI KANAN",
		"AL PALO": "KENA TIANG",
		"POR ENCIMA": "MELAMBUNG",
		"DESPEJADO": "DISAPU",
		"REMATE": "SHOT",
		"ACABÓ EN GOL": "BERBUAH GOL",
		"ACABÓ EN REMATE": "BERBUAH SHOT",
		"ANULADO POR FUERA DE JUEGO": "BATAL KARENA OFFSIDE",
		"SE QUEDÓ SIN REMATE": "TAK JADI TEMBAKAN",
		"SE TE ESCAPÓ": "BOLA LEPAS",
		"TE GANÓ EL PORTERO": "KIPER MENGHALAUMU",
		"NO LLEGASTE AL BALÓN": "TAK SAMPAI KE BOLA",
		"TE ENCERRARON": "KAMU TERKEPUNG",
		"TE HICIERON FALTA": "KAMU DILANGGAR",
		"PENAL A TU FAVOR": "PENALTI UNTUKMU",
		"PERDISTE EL BALÓN": "BOLAMU HILANG",
		"Y TUS REGATES": "DAN DRIBELMU",
		"El tercer mapa: por dónde te mueves de verdad, dónde te quitan el balón y dónde te hacen falta.":
			"Peta ketiga: ke mana kamu benar-benar bergerak, di mana bola direbut darimu, dan di mana kamu dilanggar.",
		"TOCA UNA MARCA": "KETUK TANDA",
		"Cada balón del campo se puede tocar: te dice contra quién fue, en qué minuto, y te dibuja el vuelo que tuvo.":
			"Setiap bola di lapangan bisa diketuk: kelihatan lawannya siapa, di menit berapa, dan lintasan terbangnya digambar.",
		"A REMATE": "JADI SHOT",
		"SIN REMATE": "TANPA SHOT",
		"Sobre {0} pases que llegaron": "Dari {0} umpan yang sampai",
		" · {0} pases clave": " · {0} umpan kunci",
		" · {0} anulados por fuera de juego (no cuentan: no fue tu pase)":
			" · {0} batal karena offside (tak dihitung: bukan umpanmu)",
		"EL CAMPO — de dónde a dónde repartes": "LAPANGAN — dari mana ke mana kamu mengumpan",


		"LA CANCHA — tu último pase de cada jugada": "LAPANGAN — umpan terakhirmu tiap serangan",
		"LA CANCHA — desde dónde tiraste": "LAPANGAN — posisi tembakanmu",
		"POR QUÉ ESA NOTA": "ALASAN RATING",
		"LO QUE SUMÓ": "PENAMBAH",
		"LO QUE RESTÓ": "PENGURANG",
		"Aún no le has dejado el balón a nadie. Cada pase que llegue a un compañero queda marcado aquí, con el viaje que hizo y en qué acabó la jugada.":
			"Kamu belum memberi bola ke siapa pun. Tiap umpan yang sampai ke rekan setim ditandai di sini, lengkap dengan perjalanannya dan bagaimana serangan berakhir.",
		"LARGO": "JARAK",
		"tablaP": "U",
		"PASE CORTO": "PENDEK",
		"PASE MEDIO": "SEDANG",
		"PASE LARGO": "PANJANG",
		"Y TUS PASES": "DAN UMPANMU",
		"Arriba se cambia a PASES: a dónde repartes, y cuántos de esos balones acaban en remate o en gol.":
			"Di atas, ganti ke UMPAN: ke mana kamu menyebar bola, dan berapa banyak yang berujung shot atau gol.",
		"{0}: todavía sin marca.": "{0}: belum ada tanda.",
		"T{0} · CEDIDO": "M{0} · PINJAM",
		"Mantenimiento: -{0} por partido": "Perawatan: -{0} per laga",
		"RONDA {0}": "RONDE {0}",
		"TU": "KAU",
		"EN RACHA": "PRIMA",
		"PJ": "MN",
		"A": "A",
		"SEMANA SIN PARTIDO": "PEKAN TANPA LAGA",
		"JORNADA": "PEKAN",
		"Tu casillero · abre la TIENDA": "Lokermu · buka TOKO",
		"Tu playera · cambia de uniforme": "Jerseymu · ganti kit",
		"ENERO": "JANUARI",
		"FEBRERO": "FEBRUARI",
		"MARZO": "MARET",
		"ABRIL": "APRIL",
		"MAYO": "MEI",
		"JUNIO": "JUNI",
		"JULIO": "JULI",
		"AGOSTO": "AGUSTUS",
		"SEPTIEMBRE": "SEPTEMBER",
		"OCTUBRE": "OKTOBER",
		"NOVIEMBRE": "NOVEMBER",
		"DICIEMBRE": "DESEMBER",
		"diaLU": "SEN",
		"diaMA": "SEL",
		"diaMI": "RAB",
		"diaJU": "KAM",
		"diaVI": "JUM",
		"diaSA": "SAB",
		"diaDO": "MIN",
		"DÍAS DE DESCANSO": "HARI ISTIRAHAT",
		"{0}d": "{0}h",
		"TU PAPEL": "PERANMU",
		"lesionBAJA": "CEDERA",
		"lesionALTA": "PULIH",
		"{0}D": "{0}H",
		"VER EN GOOGLE PLAY": "BUKA GOOGLE PLAY",
		"LOGROS EN GOOGLE PLAY": "PRESTASI DI GOOGLE PLAY",
		"Arriba, tu catálogo completo. En Google Play, los que Google conoce: se mandan solos al desbloquearse y se ven en tu perfil de jugador.": "Di atas, katalog lengkapmu. Di Google Play, yang dikenal Google: terkirim otomatis saat kamu membukanya dan tampil di profil pemainmu.",
		"Tu fachada {0} es de esta casa: la nueva luce la de fábrica.": "Fasad {0} milikmu untuk rumah ini: rumah baru memakai fasad bawaan.",
		"S{0}": "M{0}",
		"AYUDA": "BANTUAN",
		"tabla_ligaDG": "SG",
		"TÚ {0}": "KAMU {0}",
		"{0} PTS · +{1} AL {2}": "{0} PTS · +{1} DARI {2}",
		"{0} PTS · -{1} DEL {2}": "{0} PTS · -{1} DARI {2}",
		"{0} · {1} PTS": "{0} · {1} PTS",
		"COMPETICIÓN": "KOMPETISI",
		"ZONAS": "ZONA",
		"NO LA JUEGAS": "KAMU TIDAK IKUT",
		"GRUPOS": "GRUP",
		"EXENTO": "BYE",
		"POR DEFINIR": "BELUM ADA",
		"VIGENTE": "JUARA",
		"Pasan los {0} primeros de cada grupo y los {1} mejores terceros.": "{0} tim teratas tiap grup lolos, ditambah {1} peringkat ketiga terbaik.",
		"Pasan también los {0} mejores terceros.": "{0} peringkat ketiga terbaik juga lolos.",
		"{0} MEJORES": "{0} TERBAIK",
		"VIVOS": "TERSISA",
		"cuadroGLOBAL": "AGREGAT",
		"FALTAS A TU PALABRA": "LANGGAR JANJIMU",
		"Dijiste que te quedabas, y te vas igual. Tu grada no lo olvida.": "Kamu bilang bertahan, tapi tetap pergi. Suporter tidak akan melupakannya.",
		"DT": "PEL",
		"DE {0}": "DARI {0}",
		"TU PAÍS": "NEGARAMU",
		"TU EDAD": "USIAMU",
		"CON +1 DE MEDIA: {0}": "DENGAN +1 RATING: {0}",
		"TOP 10 DE {0}": "TOP 10 · {0}",
		"rankingEN EL MUNDO": "DI DUNIA",
		"FILTRAR": "SARING",
		"{0} TÍTULOS · -{1} DEL {2}": "{0} GELAR · -{1} DARI {2}",
		"{0} TÍTULOS · +{1} AL {2}": "{0} GELAR · +{1} DARI {2}",
		"carreraLIGAS": "LIGA",
		"carreraCOPAS": "PIALA",
		"tablaTOT": "TOT",
		"{0} PARA {1}": "{0} UNTUK {1}",
		"FUERA DEL TOP {0}": "DI LUAR TOP {0}",
		"-{0} TÍTULOS": "-{0} GELAR",
		"PICO {0} · T{1}": "PUNCAK {0} · M{1}",
		"RECORRIDO": "PERJALANAN",
		"TEMPS.": "MUSIM",
		"ESTA TEMP.": "MUSIM INI",
		"{0}/{1} BATIDOS": "{0}/{1} PECAH",
		"MÁS CERCA": "TERDEKAT",
		"AÚN SIN MARCA": "BELUM ADA REKOR",
		"ambitoAMÉRICA": "AMERIKA",
		"REQUISITOS": "SYARAT",
		"¿CÓMO SE CALCULA?": "BAGAIMANA DIHITUNG?",
		"-{0} PARA ENTRAR": "-{0} UNTUK MASUK",
		"-{0} PARA SER TITULAR": "-{0} UNTUK JADI INTI",
		"EN {0} TEMP.": "{0} MUSIM LAGI",
		"CON {0} AÑOS": "USIA {0}",
		"{0} TEMPORADAS · {1} TÍTULOS": "{0} MUSIM · {1} GELAR",
		"OFERTAS": "TAWARAN",
		"VER CESIÓN": "LIHAT PINJAMAN",
		"carreraGASTO": "BELANJA",
		"SIN FICHAJES": "TANPA TRANSFER",
		"EL MÁS CARO": "TERMAHAL",
		"{0} FICHAJES": "{0} TRANSFER",
		"1 FICHAJE": "1 TRANSFER",
		"TÍTULOS · -{0} DEL {1}": "GELAR · -{0} DARI {1}",
		"POR DELANTE": "DI DEPANMU",
		"SELECCIONADOR": "PELATIH TIMNAS",
		"-1 TÍTULO": "-1 GELAR",
		"1 TÍTULO": "1 GELAR",
		"RENOVAR": "PERPANJANG",
		"CESIÓN": "PINJAMAN",
		"PEDIR": "MINTA",
		"RETIRAR": "TARIK",
		"CLÁUSULAS": "KLAUSUL",
		"CAMINO": "JALUR",
		"MUÉVEME": "TAWARKAN",
		"UNA LIGA": "SATU LIGA",
		"UN CLUB": "SATU KLUB",
		"BAJAR FICHA": "POTONG GAJI",
		"SUBIR CLÁUSULA": "NAIKKAN KLAUSUL",
		"NO VENDERME": "JANGAN JUAL",
		"{0} BLOQUEADAS": "{0} DIBLOKIR",
		"C. LIGA": "P. LIGA",
		"Patrocinador: {0}": "Sponsor: {0}",
		"{0} LIBRE": "SISA {0}",
		"VENTA": "DIJUAL",
		"Este año no cuentas: hay que jugar la temporada ENTERA en una Primera europea.": "Tahun ini kamu tidak dihitung: harus bermain SELURUH musim di divisi utama Eropa.",
		"C. LIGAS": "P.2 LIGA",
		"¡CAMPEÓN DE LA COPA DE LAS LIGAS!": "JUARA PIALA DUA LIGA!",
		"Eliminado de la Copa de las Ligas": "Tersingkir dari Piala Dua Liga",
		"{0} SIN GUARDAR": "{0} TERTUNDA",
		"PIERNAS": "KAKI",
		"TODO AL TOPE": "SEMUA MAKS",
		"SALARIO": "GAJI",
		"ESTATUS": "STATUS",
		"EL CLUB DICE": "KATA KLUB",
		"PEDIR SALIDA": "MINTA PERGI",
		"HASTA T{0}": "HINGGA M{0}",
		"QUEDAN {0} TEMPORADAS": "SISA {0} MUSIM",
		"MANTÉN 1 S": "TAHAN 1 DTK",
		"Tu temporada da para pedir mejora: siéntate con el club.": "Musimmu layak dapat kontrak lebih baik: bicaralah dengan klub.",
		"El club está contento con lo firmado.": "Klub puas dengan kontrak yang ditandatangani.",
		"YA LO PEDISTE": "SUDAH DIMINTA",
		"CONTESTA LO PENDIENTE": "JAWAB YANG TERTUNDA",
		"AÚN NO TE ESCUCHAN": "BELUM DIDENGAR",
		"CUANDO ABRA EL MERCADO": "SAAT BURSA DIBUKA",
		"PRÓXIMO CRUCE": "LAGA BERIKUTNYA",
		"TU TÉCNICO": "PELATIHMU",
		"GRUPOS {0}-{1}": "GRUP {0}-{1}",
		"VER EL GOL": "LIHAT GOL",
		"MANTEN PARA BORRAR": "TAHAN: HAPUS",
		"NO SE PUEDE LEER": "TAK TERBACA",
		"SIN GOLES TODAVIA": "BELUM ADA GOL",
		"MARCA, Y EN LA REPETICION PULSA": "CETAK GOL, DI ULANGAN KETUK",
		"LLENO · BORRA UNO PARA GUARDAR OTRO": "PENUH · HAPUS SATU UNTUK SIMPAN",
		"TOCA UN GOL Y VELO. BORRAR SE MANTIENE.": "KETUK GOL. TAHAN: HAPUS.",
		"{0} M/S": "{0} M/S",
		"Hasta 30 goles por carrera. Se ven con el cielo y el viento de aquel día, en tu estadio de hoy.": "Hingga 30 gol per karier. Diputar ulang dengan langit dan angin hari itu, di stadionmu saat ini.",
		"El archivo se dañó. Sólo queda borrarlo.": "Berkas rusak. Satu-satunya cara adalah menghapusnya.",
		"GALAS": "GALA",
		"GANADOR": "JUARA",
		"La votación del año arranca con la primera jornada.": "Pemungutan suara tahun ini dimulai di pekan pertama.",
		"ONCE IDEAL": "XI TERBAIK",
		"VER TODOS": "SEMUA",
		"VOTACIÓN": "SUARA",
	},










	"shop": {

		"ROPA DE CALLE": "PAKAIAN HARIAN",
		"Toca una prenda para comprarla. Lo que compres te espera en ASPECTO.": "Ketuk pakaian untuk membelinya. Yang kamu beli menunggu di LOOK.",

		"CAMILLA DE FISIOTERAPIA": "RANJANG FISIOTERAPI",
		"PIZARRA TÁCTICA": "PAPAN TAKTIK",
		"BICICLETA ESTÁTICA": "SEPEDA STATIS",
		"MURO DE RÉCORDS": "DINDING REKOR",
		"RINCÓN DE LECTURA": "SUDUT BACA",
		"MESA DE RECUERDOS": "MEJA KENANGAN",
		"Camilla y material de recuperación. Su sesión recupera energía, no cura lesiones.": "Ranjang dan alat pemulihan. Sesinya memulihkan energi, bukan menyembuhkan cedera.",
		"Pizarra móvil para preparar el próximo partido. El bono se activa al usarla.": "Papan portabel untuk menyiapkan laga berikutnya. Bonusnya aktif saat dipakai.",
		"Cardio suave en casa; requiere estar sin lesión para pedalear.": "Kardio ringan di rumah; harus bebas cedera untuk mengayuh.",
		"Tus goles, asistencias, títulos y mejores temporadas, con datos reales.": "Gol, assist, gelar, dan musim terbaikmu, dengan data asli.",
		"Sillón, libro y luz cálida: lee para recuperar energía y ánimo.": "Kursi, buku, dan cahaya hangat: baca untuk memulihkan energi dan moral.",
		"Cartas y recuerdos de tu carrera. Consulta los momentos guardados.": "Surat dan kenangan kariermu. Lihat momen yang tersimpan.",
		"SESIÓN DE FISIOTERAPIA": "SESI FISIOTERAPI",
		"PREPARAR EL PARTIDO": "SIAPKAN LAGA",
		"PEDALEAR SUAVE": "GOWES SANTAI",
		"LEER CON CALMA": "BACA SANTAI",
		"Recupera hasta 12 de energía. No acorta las lesiones. Una acción semanal.": "Memulihkan hingga 12 energi. Tidak memperpendek cedera. Satu aksi mingguan.",
		"+3 puntos de precisión efectiva para el próximo partido. Una acción semanal.": "+3 poin akurasi efektif untuk laga berikutnya. Satu aksi mingguan.",
		"Hasta +5 de energía y +1 con el técnico, sin lesión. Una acción semanal.": "Hingga +5 energi dan +1 dengan pelatih, saat bebas cedera. Satu aksi mingguan.",
		"Hasta +3 de energía y +1 de ánimo. Una acción semanal.": "Hingga +3 energi dan +1 moral. Satu aksi mingguan.",
		"VER RÉCORDS": "LIHAT REKOR",
		"ABRIR RECUERDOS": "BUKA KENANGAN",
		"VER CONDICIÓN": "LIHAT KONDISI",
		"de ánimo": "moral",
		"PRECISIÓN +3 · PRÓXIMO PARTIDO": "AKURASI +3 · LAGA BERIKUT",
		"Coloca este mueble para usarlo.": "Pasang perabot ini untuk memakainya.",
		"Espera al alta médica para pedalear.": "Tunggu sampai dinyatakan pulih untuk mengayuh.",
		"La preparación táctica ya está lista para el próximo partido.": "Persiapan taktik sudah siap untuk laga berikutnya.",
		"Ahora mismo no necesitas esta sesión.": "Sekarang kamu tidak butuh sesi ini.",
		"Consultar no consume acciones ni cambia tus estadísticas.": "Melihat tidak memakai aksi dan tak mengubah statistikmu.",
		"Aún no hay partidos registrados para este muro.": "Belum ada laga tercatat untuk dinding ini.",
		"Los recuerdos aparecerán cuando tu carrera deje momentos guardados.": "Kenangan akan muncul saat kariermu menyimpan momen.",
		"TU HISTORIA EMPIEZA AQUÍ": "KISAHMU DIMULAI DI SINI",
		"RECUERDOS": "KENANGAN",
		"{0} TÍTULOS": "{0} GELAR",
		"{0} / {1}": "{0} / {1}",
		"GOLES CON TUS CLUBES": "GOL UNTUK KLUBMU",
		"ASISTENCIAS CON TUS CLUBES": "ASSIST UNTUK KLUBMU",
		"TU MEJOR TEMPORADA GOLEADORA": "MUSIM GOLMU TERBAIK",
		"TU MEJOR TEMPORADA DE ASISTENCIAS": "MUSIM ASSISTMU TERBAIK",
		"TU MEJOR MEDIA DE TEMPORADA": "RATING MUSIM TERBAIKMU",
		"NOTA {0} · {1} PARTIDOS": "RATING {0} · {1} LAGA",
		"TÍTULOS GANADOS": "GELAR DIRAIH",
		"TU DEBUT CON UN CLUB": "DEBUT DI KLUB",
		"TU DEBUT CON LA SELECCIÓN": "DEBUT TIMNASMU",
		"TU CESIÓN": "PINJAMAN",
		"CAMISETA INTERCAMBIADA": "JERSEY TUKARAN",
		"BALÓN DEL PARTIDO": "BOLA LAGA",
		"RESULTADO {0}–{1}": "HASIL {0}–{1}",
		"Los grandes de Europa se fijan en ti.": "Klub-klub besar Eropa mengincarmu.",
		"Tienes con qué, pero te falta FAMA: haz ruido marcando.":
			"Kamu punya modal, tapi kurang KETENARAN: bikin ramai dengan mencetak gol.",
		"Gustas, pero necesitas más NIVEL: al gimnasio.":
			"Mereka suka kamu, tapi butuh LEVEL lebih tinggi: ke gym.",
		"Te siguen, pero tu MEDIA no acompaña: hay que rendir.":
			"Mereka mengikutimu, tapi OVR-mu belum mendukung: harus tampil.",
		"POT": "PWR",
		"PRE": "ACC",
		"EFE": "CRL",
		"ENERGIA": "ENERGI",
		"RIESGO": "RISIKO",
		"SEMANAS BAJA": "MINGGU ABSEN",
		"COMISION": "KOMISI",
		"PRENSA": "PERS",
		"AFICIÓN": "FANS",
		"AGENTE": "AGEN",
		"TÉCNICO": "PELATIH",


		"VESTUARIO": "RUANG GANTI",
		"ROTO": "RUSAK",
		"FRÍO": "BEKU",
		"BUENO": "BAIK",
		"INCONDICIONAL": "SETIA",
		"BARRIO 90": "STREET 90",
		"Tu primer salto. Un poco de todo, a tu alcance.": "Lompatan pertamamu. Sedikit dari segalanya, terjangkau.",
		"ACERO PRO": "STEEL PRO",
		"Hechas para durar. Rendimiento modesto, muchos partidos.": "Dibuat awet. Performa biasa saja, banyak laga.",
		"ÓRBITA 10": "ORBIT 10",
		"Coloca y dibuja la curva. Menos fuerza, más intención.": "Tempatkan dan lengkungkan. Kurang tenaga, lebih banyak sentuhan.",
		"ECLIPSE X": "ECLIPSE X",
		"Oscuridad y neón. Potencia, puntería y una comba de élite.": "Gelap dan neon. Tenaga, akurasi, dan lengkungan kelas elite.",
		"NOVA PRISM": "NOVA PRISM",
		"Brillo de otro mundo. Cada disparo traza su propia curva.": "Kilau dari dunia lain. Tiap tembakan menarik lengkungannya sendiri.",
		"ZÉNIT SUPREMA": "SUPREME ZENITH",
		"La cima del juego. Fuerza, precisión y comba sin concesiones.": "Puncak permainan. Tenaga, akurasi, dan lengkungan tanpa kompromi.",
		"+ {0} · DURAN {1} PARTIDOS": "+ {0} · AWET {1} LAGA",
		"Si ya las tienes, vuelven al 100% de vida.": "Kalau sudah punya, kembali ke 100% daya tahan.",
		"{0} están en tu ropero con el 100% de vida.": "{0} ada di lemarimu dengan 100% daya tahan.",
		"BOTA DE CANTERA": "SEPATU AKADEMI",
		"Las de siempre. Sin trucos.": "Pasangan standar. Tanpa trik.",
		"TRUENO XT": "THUNDER XT",
		"Pega más fuerte, pero cuesta domarla.": "Tendangan lebih keras, tapi sulit dijinakkan.",
		"BISTURÍ 09": "SCALPEL 09",
		"Para quien coloca en vez de reventar.":
			"Untuk yang menempatkan bola, bukan menghajarnya.",
		"COMBA CLÁSICA": "CLASSIC CURVE",
		"Rosca de verdad. La falta es tuya.": "Putaran sungguhan. Tendangan bebas jadi milikmu.",
		"CORONA DE ORO": "GOLDEN CROWN",
		"Sin peros. Si puedes pagarla.": "Tanpa tapi. Kalau kamu sanggup membayarnya.",
		"BEBIDA ENERGÉTICA": "MINUMAN ENERGI",
		"+35 de energía. Ábrela entre semana o en el descanso.":
			"+35 energi. Buka di tengah pekan atau saat turun minum.",
		"GEL ANTIINFLAMATORIO": "GEL ANTIRADANG",
		"Adelanta una semana tu recuperación.": "Mempercepat pemulihanmu satu minggu.",
		"SESIÓN DE VÍDEO": "SESI VIDEO",
		"+1 de forma. Estudias al rival.": "+1 performa. Kamu mempelajari lawan.",
		"CÁMARA HIPERBÁRICA": "KAMAR HIPERBARIK",
		"Borra cualquier lesión al instante y devuelve +20 de energía. El cuerpo sólo la aguanta una vez por temporada.":
			"Menghapus cedera apa pun seketika dan mengembalikan +20 energi. Tubuh hanya kuat menahannya sekali per musim.",
		"CORTE DE AUTOR": "RAMBUT DESAINER",
		"Sales en las fotos. Barato y sin enemigos.":
			"Kamu tampil di foto. Murah dan tak bikin musuh.",
		"CENA CON EL VESTUARIO": "MAKAN BERSAMA TIM",
		"La química se compra. Se puede repetir.":
			"Kekompakan bisa dibeli. Boleh diulang.",

		"TU AGENTE": "AGENMU",
		"EL DE SIEMPRE": "YANG LAMA",
		"Ahora te lleva: {0} · se queda el {1}% de lo que cobras": "Agenmu kini: {0} · ambil {1}% dari penghasilanmu",
		"No hay nadie por encima. La agencia es tuya.": "Tak ada yang di atasmu. Agensinya milikmu.",
		"VUELVE EN {0}": "KEMBALI {0}",
		"YA ESTE AÑO": "SUDAH THN INI",
		"COMISIÓN %": "KOMISI %",
		"AGENTE CON OFICINA": "AGEN BERKANTOR",
		"Deja de atenderte desde el coche. Comisión del 7%.": "Tak lagi melayanimu dari mobil. Komisi 7%.",
		"AGENTE CON CARTERA": "AGEN PUNYA KLIEN",
		"Ya lleva a otros profesionales. Más clubes te miran, y cobra el 6%.": "Kini dia mengurus pemain pro lain. Lebih banyak klub memantaumu, dan dia ambil 6%.",
		"AGENCIA DE PRIMERA": "AGENSI PAPAN ATAS",
		"Un equipo detrás de tu nombre: ofertas de fuera y prensa a favor. El 5%.": "Satu tim di balik namamu: tawaran dari luar negeri dan pers yang berpihak. 5%.",
		"AGENTE DE ESTRELLAS": "AGEN PARA BINTANG",
		"Sólo lleva a quince jugadores en el mundo y tú eres uno. El 3,5%.": "Dia hanya mengurus lima belas pemain di dunia dan kamu salah satunya. 3,5%.",
		"TU PROPIA AGENCIA": "AGENSIMU SENDIRI",
		"El despacho es tuyo y él trabaja para ti. La comisión baja al 2,5%.": "Kantornya milikmu dan dia bekerja untukmu. Komisi turun jadi 2,5%.",
		"La grada corea tu nombre. Las marcas lo notan. Una vez por temporada.": "Tribun menyanyikan namamu. Merek-merek menyadarinya. Sekali per musim.",

		"CHARLA CON EL PSICÓLOGO": "SESI PSIKOLOG",
		"Tu próximo partido no te bajará la forma, juegues como juegues.": "Laga berikutnya tak akan menurunkan performamu, bagaimanapun kamu main.",
		"BOTELLÍN ISOTÓNICO": "BOTOL ISOTONIK",
		"+10 de energía, y tus botas no se gastan en el próximo partido.": "+10 energi, dan sepatumu tak aus di laga berikutnya.",

		"CENA CON EL CAPITÁN": "MAKAN BERSAMA KAPTEN",
		"Invitas al vestuario y pagas tú. +7 con el equipo. No se puede repetir en 10 partidos.":
			"Kamu mentraktir seisi ruang ganti. +7 dengan tim. Tak bisa diulang selama 10 laga.",
		"REUNIÓN CON EL TÉCNICO": "RAPAT DENGAN PELATIH",
		"Le pides explicaciones y sales reforzado. +6 con el técnico — pero si fallas en el próximo partido, se lo cobra el doble.":
			"Kamu minta penjelasan dan keluar lebih percaya diri. +6 dengan pelatih — tapi kalau kamu gagal di laga berikutnya, dia menagih dua kali lipat.",
		"INFILTRACIÓN": "SUNTIKAN",
		"Juegas el próximo partido aunque estés lesionado. Al acabar, tu baja crece 2 semanas.":
			"Kamu main di laga berikutnya meski cedera. Setelahnya, absenmu bertambah 2 minggu.",
		"SIN LESIÓN": "TAK CEDERA",
		"NO DISPONIBLE": "TAK TERSEDIA",
		"EN {0} {1}": "{0} {1}",
		"JUGAR INFILTRADO": "MAIN DISUNTIK",
		"LESIONADO · TU BAJA CRECERÁ {0} SEMANAS": "CEDERA · ABSENMU BERTAMBAH {0} MINGGU",
		"YA PUESTO": "TERPASANG",
		"Te pones el atuendo {0} en ASPECTO.": "Kamu bisa memakai setelan {0} di LOOK.",
		"Ya vistes el atuendo {0} en ASPECTO.": "Kamu sudah memakai setelan {0} di LOOK.",

		"Atuendo": "Setelan",
		"DE ORO": "EMAS",
		"DEL BARRIO": "JALANAN",
		"DE PISTA": "OLAHRAGA",
		"DE OFICINA": "KANTOR",
		"RELOJ DE ORO": "ARLOJI EMAS",
		"Todos lo ven. El técnico también.": "Semua orang melihatnya. Pelatih juga.",
		"DONACIÓN AL BARRIO": "DONASI KAMPUNG",
		"La grada corea tu nombre. Las marcas lo notan.":
			"Tribun menyanyikan namamu. Merek-merek menyadarinya.",
		"GIMNASIO EN CASA": "GYM DI RUMAH",
		"Cuidas el cuerpo: recuperas algo más tras cada partido.":
			"Kamu menjaga tubuh: pulih sedikit lebih banyak setelah tiap laga.",
		"DEPORTIVO": "MOBIL SPORT",
		"MUSCLE CAR": "MUSCLE CAR",
		"COMPACTO URBANO": "HATCHBACK KOTA",
		"SEDÁN CLÁSICO": "SEDAN KLASIK",
		"FAMILIAR VIAJERO": "WAGON TOURING",
		"PICKUP DE CAMPO": "PICKUP DESA",
		"Pequeño, amarillo y práctico. Tu primer coche sin presumir.": "Kecil, kuning, dan praktis. Mobil pertamamu tanpa pamer.",
		"Cuatro puertas, azul discreto y espacio para el día a día.": "Empat pintu, biru kalem, dan ruang untuk keseharian.",
		"Carrocería larga, barras de techo y maletero para todo el equipo.": "Bodi panjang, rak atap, dan bagasi untuk semua perlengkapanmu.",
		"Robusta, sencilla y con caja abierta. Para salir de la ciudad.": "Kokoh, sederhana, dengan bak terbuka. Untuk keluar dari kota.",
		"COCHERA DE COLECCIÓN": "GARASI KOLEKSI",
		"Ocho plazas en una ampliación a la derecha de casa. Terreno incluido y coches colocados automáticamente. Sin mantenimiento.": "Delapan slot dalam perluasan di sisi kanan rumah. Sudah termasuk lahan dan mobil ditata otomatis. Tanpa perawatan.",
		"ESTACIONAR LOS CUATRO": "PARKIR KEEMPATNYA",
		"Cuatro plazas, portón abierto y paso a casa. Sin mantenimiento.": "Empat slot, pintu garasi terbuka, dan akses ke rumah. Tanpa perawatan.",
		"Primero coloca la cochera.": "Pasang garasi dulu.",
		"Necesitas tener los cuatro coches.": "Kamu harus punya keempat mobil.",
		"Apártate de las plazas antes de estacionar.": "Menjauh dari slot sebelum parkir.",
		"Hay una plaza bloqueada. No se movió ningún coche.": "Ada slot yang terhalang. Tak ada mobil yang dipindah.",
		"La cochera necesita un espacio libre de paredes.": "Garasi butuh area bebas dinding.",
		"Tu coche de colección. Colócalo, gíralo o guárdalo en casa.": "Mobil koleksimu. Pasang, putar, atau simpan di rumah.",
		"Tu reloj de oro, expuesto en casa.": "Arloji emasmu, dipajang di rumah.",
		"GRAN TURISMO": "GRAND TOURER",
		"HIPERDEPORTIVO": "HYPERCAR",
		"Franjas negras y cuatro faros. Te oyen antes de verte.": "Garis hitam dan empat lampu depan. Mereka mendengarmu sebelum melihatmu.",
		"Capó largo y verde de lujo. Elegancia que sale en todas las fotos.": "Kap panjang berwarna hijau mewah. Keanggunan di setiap foto.",
		"Plata, carbono y alerón. Una pieza de colección que acapara portadas.": "Perak, karbon, dan sayap belakang. Mobil koleksi yang jadi sorotan utama.",
		"Llegas tarde a entrenar, pero llegas.":
			"Kamu telat latihan, tapi tetap datang.",
		"AGENTE DE PRIMERA": "AGEN KELAS ATAS",
		"Más ofertas sobre la mesa y mejor regateo.":
			"Lebih banyak tawaran di meja dan tawar-menawar lebih jago.",
		"CASA CON JARDÍN": "RUMAH BERTAMAN",
		"Descansas de verdad: recuperas bastante más tras cada partido.":
			"Kamu benar-benar istirahat: pulih jauh lebih banyak setelah tiap laga.",



		"DEPARTAMENTO": "APARTEMEN",
		"Un cuarto, una ventana y el sitio justo para la primera copa.":
			"Satu kamar, satu jendela, dan ruang pas untuk piala pertamamu.",
		"CASA MODERNA": "RUMAH MODERN",
		"Sala de trofeos propia y aún mejor descanso entre partidos.":
			"Ruang trofi sendiri dan istirahat antar laga yang lebih baik lagi.",
		"Galería, garage y tu cancha tras la puerta del fondo.":
			"Galeri, garasi, dan lapanganmu di balik pintu belakang.",
		"CAMPO DE ENTRENAMIENTO": "LAPANGAN LATIHAN",
		"TU FRASE ESTÁ EN SU GRADA": "KATAMU ADA DI TRIBUN MEREKA",
		"TU CUMPLEAÑOS": "ULANG TAHUNMU",
		"SIN PONER": "KOSONG",
		"¿QUÉ MES?": "BULAN APA?",
		"¿QUÉ DÍA DE {0}?": "TGL BERAPA {0}?",
		"HOY NO SE ENTRENA": "LIBUR LATIHAN",
		"FELIZ CUMPLEAÑOS": "SELAMAT ULTAH",
		"Te esperaban dentro. Alguien del vestuario se acordó, y eso en un vestuario no es poco.": "Mereka menunggumu di dalam. Seseorang di ruang ganti ingat, dan di ruang ganti itu bukan hal kecil.",
		"ENE": "JAN",
		"FEB": "FEB",
		"MAR": "MAR",
		"ABR": "APR",
		"MAY": "MEI",
		"JUN": "JUN",
		"JUL": "JUL",
		"AGO": "AGU",
		"SEP": "SEP",
		"OCT": "OKT",
		"NOV": "NOV",
		"DIC": "DES",
		"EL MICRÓFONO ABIERTO": "MIKROFON MENYALA",
		"Semana de derbi y el periodista deja el micro abierto: '¿os ven por encima de {0}?'. Sabes que lo que digas va a estar en su grada el domingo.": "Pekan derbi dan wartawan membiarkan mikrofon menyala: 'kalian merasa di atas {0}?'. Kamu tahu apa pun yang kamu bilang bakal ada di tribun mereka hari Minggu.",
		"MEDIR LAS PALABRAS": "JAGA UCAPAN",
		"SOLTAR LA BRAVATA": "UMBAR GERTAKAN",

		"LLEGAN SIN SU ESTRELLA": "TANPA BINTANGNYA",
		"Tu próximo rival llega sin uno de sus mejores jugadores, que está lesionado. En la rueda de prensa te preguntan si es el partido para aprovecharlo.": "Lawanmu berikutnya datang tanpa salah satu pemain terbaiknya yang sedang cedera. Di konferensi pers kamu ditanya apakah ini laga untuk memanfaatkannya.",
		"RESPETAR AL RIVAL": "HORMATI LAWAN",
		"HAY QUE APROVECHARLO": "HARUS DIMANFAATKAN",

		"VIENEN LANZADOS": "LAGI TERBANG",
		"{0} llega con cinco victorias seguidas en liga. En la rueda de prensa te preguntan si os dan miedo.": "{0} datang dengan lima kemenangan beruntun di liga. Di konferensi pers kamu ditanya apakah kalian takut.",
		"RESPETO, NO MIEDO": "HORMAT, TAK TAKUT",
		"LA RACHA SE ACABA AQUÍ": "LAJU MEREKA BERAKHIR",
		"UN GRANDE HERIDO": "RAKSASA TERLUKA",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Te preguntan si es el mejor momento para cruzártelos.": "{0} sudah lima pekan tak menang dan suporternya menuntut pelatih dipecat. Kamu ditanya apakah ini saat terbaik untuk menghadapi mereka.",
		"UN GRANDE SIEMPRE ES UN GRANDE": "RAKSASA TETAP RAKSASA",
		"HAY QUE REMATARLOS": "HABISI MEREKA",
		"BANQUILLO NUEVO ENFRENTE": "PELATIH BARU KUBU LAWAN",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y la prensa quiere saber si tú sí.": "{0} punya pelatih baru musim ini: {1}. Belum ada yang tahu gaya mainnya, dan pers ingin tahu apakah kamu tahu.",
		"ESTUDIARLO CON EL MÍSTER": "PELAJARI BERSAMA PELATIH",
		"QUE SE PREOCUPE ÉL": "BIAR DIA YANG PUSING",
		"TU ANTIGUO TÉCNICO": "MANTAN PELATIHMU",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Los periodistas buscan la foto del reencuentro.": "{0}, pelatih yang dulu melatihmu, kini duduk di bangku cadangan {1}. Para wartawan mengincar foto reuni.",
		"UN ABRAZO ANTES DEL PARTIDO": "PELUKAN SEBELUM LAGA",
		"HOY ES UN RIVAL MÁS": "HARI INI DIA CUMA LAWAN",
		"SU GRAN FICHAJE": "REKRUTAN UTAMA",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Te preguntan si el duelo es entre vosotros dos.": "{1} merekrut {0} musim ini, dan dia sudah jadi salah satu yang terbaik di susunan inti mereka. Kamu ditanya apakah ini duel kalian berdua.",
		"ES UN PARTIDO DE EQUIPOS": "INI PERMAINAN TIM",
		"AQUÍ LE ESPERO": "AKU TUNGGU DIA",
		"CAMPEÓN EN CASA": "JUARA DI TANAH AIR",
		"En tu país se ha coronado {0}, y la prensa de allí te pregunta si algún día te verán jugar en casa.": "Di negaramu {0} baru dinobatkan jadi juara, dan pers di sana bertanya apakah suatu hari mereka bisa melihatmu main di tanah air.",
		"ALGÚN DÍA, QUIÉN SABE": "SIAPA TAHU SUATU HARI",
		"AQUÍ ESTOY A GUSTO": "AKU BETAH DI SINI",
		"TE PIDEN QUE LO ACLARES": "KAMU DIMINTA MENJELASKAN",
		"Tu frase lleva toda la semana en la portada y en la grada de {0}. El club te pregunta si quieres suavizarla antes del domingo.": "Ucapanmu seminggu ini jadi headline dan jadi omongan tribun {0}. Klub bertanya apakah kamu mau melunakkannya sebelum hari Minggu.",
		"SOSTENERLA": "PERTAHANKAN",
		"SUAVIZARLA": "LUNAKKAN",
		"UN GOL EN DOS JORNADAS": "1 GOL DALAM 2 PEKAN",
		"Te llama al despacho y no se anda con rodeos: si no marcas en las dos próximas jornadas, te sientas.": "Dia memanggilmu ke kantor dan bicara terus terang: kalau tak mencetak gol dalam dua pekan ke depan, kamu duduk di bangku cadangan.",
		"AGACHAR LA CABEZA": "TERIMA SAJA",
		"DECIRLE LO QUE PIENSAS": "BILANG ISI HATIMU",
		"LO MARCASTE": "GOLMU MASUK",
		"Marcaste dentro del plazo. En el pasillo no te dijo nada, pero el lunes tu nombre volvió a la pizarra del once.": "Kamu mencetak gol sebelum tenggat. Di lorong dia tak bilang apa-apa, tapi hari Senin namamu kembali ada di papan susunan inti.",
		"SE ACABÓ EL PLAZO": "WAKTU HABIS",
		"Dos jornadas, ningún gol. No hizo falta que te lo dijera: el once del domingo ya no te lleva.": "Dua pekan, nol gol. Dia tak perlu bilang: namamu sudah tak ada di susunan inti hari Minggu.",
		"EL CAPITÁN TE PARA": "KAPTEN MENGHADANGMU",
		"{0} te espera en la puerta del vestuario. No levanta la voz: te dice que el equipo lleva semanas jugando para ti y que eso se acaba hoy.": "{0} menunggumu di pintu ruang ganti. Dia tak meninggikan suara: katanya tim sudah berminggu-minggu bermain untukmu, dan itu berakhir hari ini.",
		"CONTESTARLE": "BALAS DIA",
		"TE ESPERAN EN EL TÚNEL": "DITUNGGU DI LORONG",
		"Un crío con tu nombre en la espalda lleva media hora esperando en la boca del túnel. Su padre le dice que no molestes, que ya vas tarde.": "Seorang bocah dengan namamu di punggung sudah setengah jam menunggu di mulut terowongan. Ayahnya menyuruhnya jangan mengganggumu, kamu sudah terlambat.",
		"PARARTE CON ÉL": "TEMUI DIA",
		"SALUDAR Y SEGUIR": "LAMBAI LALU JALAN",
		"TU CASILLERO NO ESTÁ COMO LO DEJASTE": "LOKERMU TAK SEPERTI SEMULA",
		"Llegas al vestuario y tu hueco está lleno de espuma hasta arriba. Nadie te mira, pero nadie está haciendo nada tampoco.": "Kamu sampai di ruang ganti dan lokermu penuh busa sampai atas. Tak ada yang menatapmu, tapi tak ada juga yang berbuat apa-apa.",
		"SEGUIRLES EL JUEGO": "IKUT BERCANDA",
		"LIMPIAR EN SILENCIO": "BERSIHKAN DIAM-DIAM",
		"TE PARA EN LA BANDA": "DITAHAN DI PINGGIR",
		"Te sustituye, y en vez de darte la mano y mirar al campo te para, te dice algo al oído y te abraza hasta que la grada se levanta.": "Dia menggantimu, dan alih-alih bersalaman lalu menatap lapangan, dia menahanmu, membisikkan sesuatu dan memelukmu sampai tribun berdiri.",
		"ESCUCHARLE": "DENGARKAN",
		"IRTE AL BANQUILLO": "KE BANGKU CADANGAN",
		"EL ONCE YA ESTÁ DIBUJADO": "SUSUNAN INTI SUDAH JADI",
		"Entras al vestuario antes que nadie y la pizarra ya tiene el once del domingo. Lo lees dos veces: tu nombre no está en ninguna de las dos.": "Kamu masuk ruang ganti paling awal dan papan sudah memuat susunan inti hari Minggu. Kamu membacanya dua kali: dua-duanya tanpa namamu.",
		"BORRARLA": "HAPUS",
		"AQUÍ NO TE OLVIDAN": "DI SINI KAMU DIINGAT",

		"EX CLUB · TITULAR · ~{0} MIN": "EX-KLUB · INTI · ~{0} MNT",
		"EX CLUB · DESDE LA BANCA · ~{0} MIN": "EX-KLUB · DARI BANGKU · ~{0} MNT",
		"SU GRADA NO OLVIDA TU TRASPASO": "MASIH DENDAM SOAL TRANSFERMU",
		"SU GRADA RECUERDA TU CESIÓN": "INGAT MASA PINJAMANMU",
		"SU GRADA NI SE INMUTA": "SUPORTERNYA CUEK",
		"TU EX CLUB, DE VISITA": "EX-KLUBMU DATANG",
		"TU EX CLUB, ENFRENTE": "EX-KLUBMU LAWANMU",
		"{0} · MÁRCALE: HAY PRIMA": "{0} · GOL, DAPAT BONUS",
		"GOL AL EX CLUB": "GOL KE EX-KLUB",
		"TRAIDOR": "KHIANAT",
		"BENGALA EN EL CÉSPED": "FLARE DI LAPANGAN",
		"SE PELEAN EN TU GRADA": "RIBUT DI TRIBUNMU",
		"CANCHA DE {0}": "LAPANGAN {0}",
		"VISITAR MI CASA": "KUNJUNGI RUMAH",
		"SALIR DE CASA": "KELUAR RUMAH",
		"SEGUNDO PISO": "LANTAI DUA",
		"TERCER PISO": "LANTAI TIGA",
		"Una planta más. Se levanta sobre lo que ya cerraste.": "Satu lantai lagi. Berdiri di atas lantai yang sudah berdinding.",
		"La última planta, y la que se ve desde la calle.": "Lantai teratas, yang terlihat dari jalan.",
		"PRIMERO EL SEGUNDO PISO": "LANTAI DUA DULU",
		"NO HAY NADA CERRADO DEBAJO": "BAWAHNYA BELUM BERDINDING",
		"ADICIONES": "TAMBAHAN",
		"ACABADOS": "FINISH",
		"MATERIAL DE ESTA PARED": "MATERIAL DINDING INI",
		"EL DE LA CASA": "BAWAAN RUMAH",
		"PISO": "LANTAI",
		"PARED": "TEMBOK",
		"El suelo y la pared, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.":
			"Lantai dan dinding, sesukamu. Dibeli terpisah dan jadi milikmu: ganti kapan saja.",
		"Instaladas: {0} de {1}.": "Terpasang: {0} dari {1}.",
		"Muebles, mejoras y mascotas para tu casa. Se compran una vez y las colocas donde quieras desde VISITAR.": "Perabot, upgrade, dan peliharaan untuk rumahmu. Beli sekali, lalu letakkan di mana pun lewat KUNJUNGI.",
		"TIENES {0}": "PUNYAMU {0}",
		"POR PARTIDO": "PER LAGA",
		"TE CONVIENE": "DISARANKAN",
		"AL ALCANCE": "TERJANGKAU",
		"COLOCAR AHORA": "PASANG KINI",
		"Compraste {0}. Está en tus cajas.": "Kamu membeli {0}. Ada di kardusmu.",
		"Así quedaría tu casa.": "Begini nanti tampilan rumahmu.",
		"Nada al alcance en este cajón.": "Tak ada yang terjangkau di laci ini.",
		"{0} x {0} m": "{0} x {0} m",
		"OTRA MÁS": "LAGI",
		"OTRA MÁS · {0}": "LAGI · {0}",
		"Se compran en MI JUGADOR ▸ CASA.": "Dibeli di PEMAINKU ▸ RUMAH.",
		"TU CASA se reinicia a 0: se vende y te devuelven el 80% de lo invertido.":
			"RUMAHMU direset ke 0: dijual dan kamu mendapat kembali 80% dari modal.",
		"INSTALADO": "TERPASANG",
		"INSTALAR · {0}": "PASANG · {0}",
		"Abre: {0}.": "Membuka: {0}.",
		"Si cambias de club la vendes y empiezas de cero: te devuelven el 80% de lo invertido.":
			"Kalau pindah klub, rumah dijual dan kamu mulai dari nol: kamu mendapat kembali 80% dari modal.",
		"Si cambias de club empiezas de cero: la casa se queda, y te devuelven el 80% de lo invertido.":
			"Kalau pindah klub kamu mulai dari nol: rumah tetap ada, dan kamu mendapat kembali 80% dari modal.",



		"fuera de la cuadrícula": "di luar grid",
		"se sale del suelo": "keluar dari lantai",
		"tapa la puerta": "menutup pintu",

		"sin sitio para usarlo": "tak ada ruang untuk memakainya",
		"tiene que ir pegado a una pared": "harus menempel di dinding",
		"no puede mirar a la pared": "tak bisa menghadap dinding",
		"a la intemperie no se cuelga nada": "di luar ruangan tak ada yang digantung",
		"el helipuerto va en el jardín, sobre el pasto": "helipad harus di taman, di atas rumput",
		"el helipuerto pide cielo abierto: ni una pared alrededor": "helipad butuh langit terbuka: tak boleh ada dinding di sekitarnya",

		"TERRENO": "LAHAN",
		"La casa es tuya: te la llevas contigo aunque cambies de club.":
			"Rumah ini milikmu: ikut denganmu meski kamu pindah klub.",
		"Suelo nuevo pegado a tu casa: pártelo con paredes y amuéblalo a tu gusto en el modo edición.":
			"Lantai baru menempel di rumahmu: bagi dengan dinding dan isi perabot sesukamu di mode edit.",
		"TERRENO ESTE": "LAHAN TIMUR",
		"TERRENO DEL FONDO": "LAHAN BELAKANG",
		"TERRENO OESTE": "LAHAN BARAT",
		"ALA NORTE": "SISI UTARA",
		"TERRENO DEL GARAGE": "LAHAN GARASI",
		"Suelo nuevo pegado a la sala. Tuyo para lo que quieras.":
			"Lantai baru menempel di ruang tamu. Milikmu untuk apa saja.",
		"El fondo del edificio, ganado al patio de luces.":
			"Bagian belakang gedung, diambil dari lubang cahaya.",
		"Suelo nuevo junto a la recámara.":
			"Lantai baru di sebelah kamar.",
		"El fondo del patio, allanado y tuyo.":
			"Bagian belakang halaman, diratakan dan jadi milikmu.",
		"Suelo nuevo sobre el gimnasio, con paso a la sala.":
			"Lantai baru di atas gym, terhubung ke ruang tamu.",
		"Del jardín a la sala de premios, todo tuyo.":
			"Dari taman sampai ruang penghargaan, semuanya milikmu.",
		"Un ala entera tras el salón, pegada a la suite.":
			"Satu sayap penuh di belakang ruang tamu, tepat di samping suite.",
		"El costado del garage, listo para lo que sea.":
			"Sisi garasi, siap untuk apa saja.",
		"AMPLIAR · {0}": "PERLUAS · {0}",
		"YA ES TUYO": "SUDAH MILIKMU",

		"VENTANA": "JENDELA",
		"VENTANA NUEVA": "JENDELA BARU",
		"Una ventana más, en el muro que tú elijas.":
			"Satu jendela lagi, di dinding yang kamu pilih.",
		"Luz de verdad en el muro que tú elijas.":
			"Cahaya sungguhan di dinding yang kamu pilih.",

		"VENTANAL": "JENDELA BESAR",
		"OJO DE BUEY": "BULAT",
		"Del suelo al techo: el muro entero se vuelve luz.":
			"Dari lantai sampai plafon: seluruh dinding jadi cahaya.",
		"Un redondel alto, para el rincón que pide poco.":
			"Satu lingkaran kecil di atas, untuk sudut yang tak banyak minta.",

		"~{0} partidos de sueldo": "gaji ~{0} laga",
		"menos de un partido de sueldo": "kurang dari gaji satu laga",
		"TE CONVIENE: llegas justo de energía":
			"DISARANKAN: energimu tinggal sedikit",
		"TE CONVIENE: el vestuario anda frío":
			"DISARANKAN: ruang ganti lagi dingin",
		"TE CONVIENE: la afición anda fría": "DISARANKAN: suporter lagi dingin",
		"TE CONVIENE: la prensa no habla de ti":
			"DISARANKAN: pers tak membicarakanmu",
		"TE CONVIENE: el técnico no te ve":
			"DISARANKAN: pelatih tak melihatmu",
		"TE CONVIENE: tu agente no se mueve":
			"DISARANKAN: agenmu diam saja",

		"VER": "CEK",
		"AQUI VA: {0}": "DI SINI: {0}",
		"REPISA DE PARED": "RAK DINDING",
		"Una balda más para tus trofeos, donde tú digas.":
			"Satu rak lagi untuk trofimu, di mana pun kamu mau.",
		"MASCOTA": "HEWAN",
		"PERRO": "ANJING",
		"GATO": "KUCING",
		"Un perro que te espera y te sigue por los cuartos.":
			"Anjing yang menunggumu dan mengikutimu keliling ruangan.",
		"Un gato que pasea a lo suyo... y a veces te sigue.":
			"Kucing yang berkeliaran sesukanya... dan kadang mengikutimu.",

		"YA TIENES {0}": "SUDAH ADA {0}",



		"TECNICO": "PELATIH",
		"AFICION": "SUPORTER",


		"TU CASA": "RUMAHMU",
		"{0} de {1} adiciones": "{0} dari {1} tambahan",
		"PATRIMONIO": "ASET",
		"La mejor casa de tu carrera: {0}.": "Rumah terbaik di kariermu: {0}.",
		"Se quedó atrás con un traspaso.": "Tertinggal karena transfer.",

		"RECIBIR VISITA": "TERIMA TAMU",


		"ESTILO NORDICO": "GAYA NORDIK",
		"Madera clara y paredes de leche: la casa respira.":
			"Kayu pucat dan dinding putih susu: rumah terasa lega.",
		"ESTILO NOCTURNO": "GAYA MALAM",
		"Grafito, humo y madera oscura. Serio como un 0-0 fuera.":
			"Grafit, asap, dan kayu gelap. Serius seperti 0-0 tandang.",
		"ESTILO DEL CLUB": "GAYA KLUB",
		"Telas y detalles con los colores de tu escudo.":
			"Kain dan detail berwarna lambangmu.",
		"MUDANZA": "PINDAHAN",
		"LAS LLAVES SON TUYAS": "KUNCINYA MILIKMU",
		"EL SOLAR CRECE": "LAHAN MELUAS",





		"EL DIA DESPUES": "KEESOKAN HARINYA",
		"HOY MEJOR NO SALIR": "DI RUMAH SAJA DULU",
		"EL MARCADOR": "SKOR",
		"Mañana en el barrio no se hablará de otra cosa.":
			"Besok satu kampung tak akan membicarakan hal lain.",
		"Esa bandera la ataron a tu reja de madrugada.":
			"Bendera itu diikat di pagarmu menjelang subuh.",
		"LO QUE COSTO": "HARGANYA",

		"Tu agente te esperaba: hay ofertas sobre la mesa.":
			"Agenmu sudah menunggu: ada tawaran di meja.",
		"Un compañero vino a revivir la goleada.":
			"Seorang rekan setim datang mengenang kemenangan telak itu.",
		"Un compañero pasó a saludar.": "Seorang rekan setim mampir menyapa.",
		"{0} vino a revivir la goleada.": "{0} datang mengenang kemenangan telak itu.",
		"{0} pasó a saludar.": "{0} mampir menyapa.",
		"{0} se queda hasta tarde. El vestuario se entera de cómo vives.":
			"{0} tinggal sampai malam. Ruang ganti jadi tahu cara hidupmu.",
		"YA RECIBISTE ESTA SEMANA": "SUDAH ADA TAMU MGG INI",
		"¿A QUIÉN RECIBES?": "SIAPA TAMUMU?",
		"Tu casa de hoy rinde {0} de hospitalidad.":
			"Nilai keramahan rumahmu hari ini: {0}.",
		"HOY NO": "LAIN KALI",
		"A UN COMPAÑERO": "REKAN SETIM",
		"AL TÉCNICO": "PELATIH",
		"A TU AGENTE": "AGENMU",
		"Se queda hasta tarde. El vestuario se entera de cómo vives.":
			"Dia tinggal sampai malam. Ruang ganti jadi tahu cara hidupmu.",
		"Café, vídeo y charla larga. Te ve como alguien serio.":
			"Kopi, video, dan obrolan panjang. Dia melihatmu sebagai orang serius.",
		"Negocio en la sala de tu casa: aquí las cifras suenan mejor.":
			"Urusan bisnis di ruang tamu rumahmu: di sini angkanya terdengar lebih enak.",

		"ESTA SEMANA, EN CASA": "MINGGU INI, DI RUMAH",
		"Te quedan {0} de {1} acciones.": "Tersisa {0} dari {1} aksi.",
		"ya, esta semana": "sudah, minggu ini",
		"YA LO HICISTE ESTA SEMANA": "SUDAH MINGGU INI",
		"NO TE QUEDA TIEMPO ESTA SEMANA": "WAKTU MINGGU INI HABIS",
		"de energía": "energi",
		"DORMIR DE VERDAD": "TIDUR NYENYAK",
		"Ocho horas seguidas y el cuerpo lo agradece.":
			"Delapan jam penuh dan tubuh berterima kasih.",
		"COMER BIEN": "GIZI BAIK",
		"Cocinas tú, y comes lo que te toca comer.":
			"Kamu masak sendiri, dan makan yang seharusnya kamu makan.",
		"ESTUDIAR AL RIVAL": "PELAJARI LAWAN",
		"Te tragas el partido del rival con libreta.":
			"Kamu menonton laga lawan sampai habis, buku catatan di tangan.",
		"NADAR": "RENANG",
		"Largos suaves: descarga las piernas sin cargarlas.":
			"Renang santai: meringankan kaki tanpa membebaninya.",
		"INVITAR AL VESTUARIO": "AJAK SKUAD",
		"Caen dos compañeros y se hace de noche jugando.":
			"Dua rekan setim mampir dan kalian main sampai gelap.",
		"SALIR A RODAR": "JALAN-JALAN",
		"Estrenas: {0}.": "Ruang baru: {0}.",
		"JUGAR AL SNAKE": "MAIN SNAKE",
		"SNAKE": "SNAKE",
		"DESLIZA PARA GIRAR": "GESER UNTUK BELOK",
		"TOCA PARA OTRA": "KETUK, MAIN LAGI",
		"SE ACABO · {0}": "TAMAT · {0}",
		"¡RECORD! · {0}": "REKOR! · {0}",
		"PUNTOS {0}   ·   RECORD {1}": "POIN {0}   ·   REKOR {1}",
		"AL VESTUARIO ENTERO": "SELURUH SKUAD",
		"Veinticinco tíos en tu casa hasta la madrugada. La química se cocina.":
			"Dua puluh lima orang di rumahmu sampai dini hari. Kekompakan tim pun terbangun.",
		"PIDE {0}": "BUTUH {0}",
		"Necesitas {0} en tu casa.": "Kamu butuh {0} di rumahmu.",
		"LEVANTAR PESAS": "ANGKAT BEBAN",
		"Una hora seria de hierro. El técnico se entera.":
			"Satu jam serius angkat besi. Pelatih pun tahu.",
		"CORRER EN LA CINTA": "LARI DI TREADMILL",
		"Fondo tranquilo: llegas al domingo con otra gasolina.":
			"Lari santai jarak jauh: kamu sampai hari Minggu dengan tenaga lebih.",
		"Una vuelta sin rumbo. La gente te saluda.":
			"Keliling tanpa tujuan. Orang-orang menyapamu.",
		"JUGAR CON TU MASCOTA": "MAIN SAMA PELIHARAAN",
		"Media hora de correr tras algo que no cuenta.":
			"Setengah jam mengejar sesuatu yang tak dihitung.",
		"PARED DE MOMENTOS": "DINDING MOMEN",
		"Tus récords, enmarcados donde se vean.":
			"Rekormu, dibingkai di tempat yang terlihat.",
		"MAQUETA DEL ESTADIO": "MAKET STADION",
		"Tu estadio en miniatura, con los colores de tu club.":
			"Stadionmu dalam bentuk mini, berwarna klubmu.",
		"ARCADE RETRO": "ARCADE RETRO",
		"Partidas viejas para despejar la cabeza. El vestuario pide turno.":
			"Game jadul untuk menjernihkan kepala. Ruang ganti antre giliran.",
		"PISCINA": "KOLAM RENANG",
		"Largos suaves al día siguiente: las piernas lo agradecen.":
			"Renang santai keesokan harinya: kakimu berterima kasih.",
		"MOTO DE COLECCIÓN": "MOTOR KOLEKSI",
		"El garage por fin parece garage.":
			"Garasi akhirnya terlihat seperti garasi.",
		"MAQUETA DE TU ESTADIO": "MAKET STADIONMU",
		"ARCADE": "ARCADE",
		"MOTO": "MOTOR",
		"ESTUDIO DE VIDEO": "RUANG VIDEO",
		"Estudias al rival en tu sala. El técnico lo agradece.":
			"Kamu mempelajari lawan di ruanganmu sendiri. Pelatih menghargainya.",
		"ASADOR EN EL PATIO": "BARBEKU HALAMAN",
		"El vestuario viene a comer. La química se cocina.":
			"Skuad datang makan. Kekompakan tim pun terbangun.",
		"JACUZZI": "JACUZZI",
		"Piernas nuevas al día siguiente del partido.":
			"Kaki segar sehari setelah laga.",
		"SALA DE CINE": "BIOSKOP",
		"Desconectas de verdad. Y todos quieren venir.":
			"Kamu benar-benar lepas penat. Dan semua orang mau datang.",
		"SPA CON FISIO": "SPA + FISIO",
		"Tratamiento en casa: el mejor descanso que se compra.":
			"Perawatan di rumah: istirahat terbaik yang bisa dibeli.",
		"CANCHA DE ENTRENAMIENTO": "LAPANGAN LATIHAN",
		"Sales de casa y practicas campo abierto cuando quieras.":
			"Keluar rumah dan main open play kapan pun kamu mau.",
		"SALIR A ENTRENAR": "BERLATIH DI LUAR",



		"MODO EDICION": "MODE EDIT",



		"INVENTARIO": "INVENTARIS",
		"TUS COSAS": "BARANGMU",
		"EN LA CASA": "DI RUMAH",
		"EN CAJAS": "DI KARDUS",
		"Aquí no hay nada todavía.": "Belum ada apa-apa di sini.",
		"No te sobra nada: todo lo que compraste está puesto en la casa.": "Tak ada yang tersisa: semua yang kamu beli sudah terpasang di rumah.",


		"EXHIBICION": "PAJANGAN",
		"OCIO": "HIBURAN",
		"ENTRENAR": "LATIHAN",
		"DECORACION": "DEKOR",

		"ALFOMBRA": "KARPET",




		"Aquí se duerme de verdad y se recupera la energía.": "Di sini tidur benar-benar nyenyak dan energi pulih.",
		"Donde se reciben las visitas del vestuario.": "Tempat menerima teman-teman dari ruang ganti.",
		"Un sitio más donde sentarse sin ocupar medio cuarto.": "Satu tempat duduk lagi tanpa memakan separuh ruangan.",
		"Comer bien en casa cuesta menos que comer fuera.": "Makan sehat di rumah lebih murah daripada makan di luar.",
		"El centro de la sala: todo lo demás se acomoda alrededor.": "Pusat ruangan: semua yang lain menyesuaikan di sekelilingnya.",
		"Tus copas, a la vista. Cuantas más perchas, más palmarés.": "Pialamu, dipajang. Makin banyak rak, makin penuh palmares.",
		"La vitrina del que empieza: pocas copas, pero las tuyas.": "Lemari pemula: sedikit piala, tapi milikmu sendiri.",
		"Una playera enmarcada por cada club en el que jugaste.": "Satu jersey berbingkai untuk setiap klub yang pernah kamu bela.",
		"Los récords de tu carrera, colgados.": "Rekor kariermu, tergantung di dinding.",
		"Lo único de la tienda que se exhibe en casa.": "Satu-satunya barang toko yang benar-benar dipajang di rumah.",
		"Estudiar al rival antes del partido.": "Pelajari lawan sebelum laga.",
		"Una partida no cuesta acción de semana. Se está por estar.": "Satu game tak memakai aksi minggu ini. Cuma buat senang-senang.",
		"Tu estadio en pequeño, con su marcador.": "Stadionmu versi mini, lengkap dengan papan skor.",
		"Nadar descansa y no gasta energía de entrenamiento.": "Berenang memulihkan tanpa memakai energi latihan.",
		"Salir a rodar. No sirve para nada y por eso está.": "Keliling naik motor. Tak berguna untuk apa-apa, dan memang itu tujuannya.",
		"El rack con la barra: levantar pesas sube tu físico.": "Rak dengan palang: angkat beban menaikkan fisikmu.",
		"La torre de mancuernas. Un rack solo no hace un gimnasio.": "Menara dumbel. Satu rak saja belum jadi gym.",
		"Correr en casa los días que no hay cancha.": "Lari di rumah pada hari-hari tak ada lapangan.",
		"Va debajo de todo y no estorba a nada.": "Ditaruh di bawah semuanya dan tak mengganggu apa pun.",
		"Verde en un rincón. Cuesta poco y se nota.": "Hijau di sudut. Murah, dan terasa bedanya.",
		"Luz propia en el rincón que quede oscuro.": "Cahaya sendiri untuk sudut yang tetap gelap.",
		"Se apoya a ras de muro y llena una pared entera.": "Menempel rata di dinding dan memenuhi satu dinding penuh.",
		"De cuerpo entero. Pide muro, como todo lo que cuelga.": "Seluruh badan. Butuh dinding, seperti semua yang digantung.",

		"{0} EN CAJAS": "{0} DI KARDUS",
		"{0} EN CAJAS · VALEN {1}": "{0} DI KARDUS · NILAI {1}",
		"VENDER {0}": "JUAL {0}",
		"¿SEGURO? SE VAN {0} PIEZAS": "YAKIN? {0} BARANG DIJUAL",
		"MANTÉN PARA VENDER": "TAHAN UNTUK JUAL",
		"MANTÉN · SE VAN {0} PIEZAS": "TAHAN · {0} BARANG DIJUAL",
		"SALDO {0}": "SALDO {0}",
		"{0} x {1} celdas  ·  {2} m de alto": "{0} x {1} sel  ·  tinggi {2} m",
		"EN CAJAS · TOCA PARA SACARLO": "DI KARDUS · KETUK, KELUARKAN",
		"EN LA CASA · TOCA PARA GUARDARLO": "DI RUMAH · KETUK UNTUK SIMPAN",


		"MASCOTAS": "HEWAN",


		"OTRO": "LAIN",
		"OTRO ({0}/{1})": "LAIN ({0}/{1})",


		"PAREDES": "DINDING",
		"MUEBLES": "PERABOT",
		"PONER AQUI": "TARUH SINI",
		"INICIAR PARED": "MULAI DINDING",
		"FIN DE PARED": "AKHIRI",
		"CANCELAR TRAZO": "BATAL",
		"BAÑO": "K. MANDI",
		"INODORO": "KLOSET",
		"Cerámica, tapa y cisterna para completar el baño.":
			"Keramik, tutup, dan tangki air untuk melengkapi kamar mandi.",
		"Lavabo con espejo y grifo, listo junto al muro.":
			"Wastafel dengan cermin dan keran, siap dipasang di dekat dinding.",
		"Mampara de cristal y regadera para el rincón del baño.":
			"Sekat kaca dan shower untuk sudut kamar mandi.",
		"Una tina de baño de borde ancho.": "Bak mandi dengan tepi lebar.",
		"LAVABO": "WASTAFEL",
		"DUCHA": "SHOWER",
		"TINA": "BATHTUB",
		"Lo primero que echa en falta una casa.": "Hal pertama yang kurang dari sebuah rumah.",
		"Con espejo, para mirarte antes de salir.": "Pakai cermin, untuk mengecek penampilan sebelum keluar.",
		"Agua caliente después de entrenar.": "Air hangat setelah latihan.",
		"Para las piernas cargadas de después del partido.": "Untuk kaki yang berat setelah laga.",
		"AMPLIAR EL TERRENO": "PERLUAS LAHAN",
		"PARED DE CAMISETAS": "DINDING JERSEY",
		"Donde van las copas que ganas.": "Tempat piala yang kamu menangkan.",
		"Una playera por cada club en el que jugaste.": "Satu jersey untuk setiap klub yang pernah kamu bela.",
		"Para los trofeos que no caben en la vitrina.": "Untuk trofi yang tak muat di lemari.",
		"LEVANTAR PARED": "BANGUN DINDING",
		"TIRAR ESTA PARED": "ROBOHKAN DINDING",
		"REHACER ESTA PARED": "BANGUN ULANG DINDING",

		"PONER PUERTA": "PASANG PINTU",
		"QUITAR PUERTA": "LEPAS PINTU",
		"DEJARIA SIN PASO": "TAK ADA JALAN",
		"las paredes van rectas": "dinding harus lurus",
		"demasiado corta": "terlalu pendek",
		"ahí no hay suelo": "di situ tak ada lantai",
		"te quedarías dentro": "kamu bakal terkurung di dalamnya",
		"dejarías {0} sin paso": "{0} jadi tak punya jalan masuk",
		"HOY NO SALE · TOCA PARA SACARLA": "DI DALAM · KETUK UNTUK KELUARKAN",
		"ANDA POR LA CASA · TOCA PARA GUARDARLA": "KELILING RUMAH · KETUK UNTUK SIMPAN",
		"TAPETES": "KARPET",



		"CUADRO DE PARED": "LUKISAN DINDING",
		"CUADRO GRANDE": "LUKISAN BESAR",
		"ÓLEO DE AUTOR": "LUKISAN ASLI",
		"BANDERINES": "UMBUL-UMBUL",
		"MIS BUFANDAS": "SYALKU",
		"MIS BOTINES": "SEPATUKU",

		"MUSEO DE BALONES": "MUSEUM BOLA",
		"ESCUDO DEL CLUB": "LAMBANG KLUB",
		"BANDERINES DE CAMBIO": "BENDERA TUKAR",
		"TIFO ENMARCADO": "TIFO DIBINGKAI",
		"BALONES DE TEMPORADA": "BOLA TIAP MUSIM",
		"BUTACAS DEL ESTADIO": "KURSI STADION",
		"ALFOMBRA DEL CÍRCULO": "KARPET LINGKARAN",
		"CASILLERO DEL VESTIDOR": "LOKER RUANG GANTI",
		"TAPIZ": "PERMADANI",
		"PANEL DE MADERA": "PANEL KAYU",
		"MAPA DE GIRAS": "PETA TUR",
		"CARTEL DE PARTIDO": "POSTER LAGA",
		"PORTADA ENMARCADA": "HEADLINE BINGKAI",
		"PLACA DE FICHAJE": "PLAKAT TRANSFER",
		"AUN NO SE JUEGA": "BELUM DIMAINKAN",
		"VS {0}": "VS {0}",
		"{0} GOLES · NOTA {1}": "{0} GOL · RATING {1}",
		"\"EL QUE VIENE PISANDO FUERTE\"": "\"SEDANG NAIK DAUN\"",
		"DE LA CANTERA": "ANAK AKADEMI",
		"El cartel de tu mejor partido: rival, goles y nota.":
			"Poster laga terbaikmu: lawan, gol, dan rating.",
		"La portada del día que ganaste algo. Se reescribe sola.":
			"Halaman depan dari hari kamu menjuarai sesuatu. Berganti dengan sendirinya.",
		"El club, la temporada y lo que costó tu fichaje.":
			"Klub, musim, dan berapa biaya transfermu.",
		"PANTALLA DE MURO": "LAYAR DINDING",
		"CHIMENEA": "PERAPIAN",
		"PLAFÓN": "LAMPU PLAFON",
		"ARAÑA": "KANDELIR",
		"APLIQUE": "LAMPU DINDING",
		"LÁMPARA DE BURÓ": "LAMPU TIDUR",
		"RÓTULO DE NEÓN": "PAPAN NEON",
		"TIRA LED": "STRIP LED",
		"MACETERO": "POT TINGGI",
		"PECERA DE PIE": "AKUARIUM",
		"CARRITO DE REFRESCOS": "TROLI MINUMAN",
		"PUF": "PUF",
		"BAÚL": "PETI",
		"PERCHERO": "GANTUNGAN",
		"NEVERA DE JUGOS": "KULKAS JUS",
		"TOCADISCOS": "TURNTABLE",
		"Un lienzo con marco. Lo más barato contra un muro pelado.":
			"Lukisan berbingkai. Obat termurah untuk dinding kosong.",
		"Metro y medio de lienzo. Ya no es un detalle.":
			"Satu setengah meter kanvas. Bukan lagi sekadar hiasan.",
		"Dos metros firmados. La pared entera es él.":
			"Dua meter bertanda tangan. Seluruh dinding adalah lukisannya.",
		"Los de tus clubes, cruzando el rincón en diagonal.":
			"Umbul-umbul klubmu, dibentang miring di sudut.",
		"Una bufanda por cada afición que te cantó.":
			"Satu syal untuk setiap suporter yang menyanyikan namamu.",
		"Los botines de tus noches grandes, en peanas.":
			"Sepatu dari malam-malam besarmu, di atas alas.",
		"Treinta y dos balones tras el cristal, con luz de museo.":
			"Tiga puluh dua bola di balik kaca, dengan lampu ala museum.",
		"El escudo de tu club, retroiluminado contra el muro.":
			"Lambang klubmu, dengan cahaya dari belakang di dinding.",
		"Un banderín de intercambio por cada club que pisaste.":
			"Satu bendera tukar untuk setiap klub yang pernah kamu singgahi.",
		"Un trozo del tifo que te dedicó tu grada, enmarcado.":
			"Potongan tifo yang dibuat suportermu untukmu, dibingkai.",
		"Un balón por temporada, con los colores de aquel año.":
			"Satu bola per musim, dengan warna tahun itu.",
		"Dos butacas originales de la grada, con su número.":
			"Dua kursi asli dari tribun, lengkap dengan nomornya.",
		"El círculo central tejido, con tu escudo en medio.":
			"Lingkaran tengah lapangan yang ditenun, dengan lambangmu di tengah.",
		"Tu taquilla del vestidor, con tu dorsal en la puerta.":
			"Lokermu di ruang ganti, dengan nomormu di pintu.",
		"Un tramo de muro con otra tela, de suelo a techo.":
			"Sepetak dinding dengan kain lain, dari lantai ke langit-langit.",
		"Duelas de suelo a techo: el muro deja de ser pared.":
			"Bilah dari lantai ke langit-langit: dinding tak lagi sekadar dinding.",
		"Un mapamundi con una chincheta en cada país donde jugaste. Se llena solo.":
			"Peta dunia dengan pin di setiap negara tempat kamu main. Terisi sendiri.",
		"La pantalla colgada, sin mueble que la sostenga.":
			"Layar yang digantung, tanpa perabot penopang.",
		"Fuego de verdad: da luz propia y calienta el rincón.":
			"Api sungguhan: punya cahaya sendiri dan menghangatkan sudut ruang.",
		"Luz de techo, la que hace que un cuarto deje de ser cueva.":
			"Lampu langit-langit, yang bikin ruangan tak lagi seperti gua.",
		"Cristal colgado en medio del salón. Se nota al entrar.":
			"Kristal menggantung di tengah ruang tamu. Terasa begitu kamu masuk.",
		"Va en pareja, uno a cada lado del muro que enseñas.":
			"Belinya berpasangan, satu di tiap sisi dinding yang kamu pamerkan.",
		"Con su buró incluido, para leer sin encender el cuarto.":
			"Lengkap dengan nakas, untuk membaca tanpa menyalakan seisi kamar.",
		"Tu nombre en neón, encendido toda la noche.":
			"Namamu dalam neon, menyala sepanjang malam.",
		"Bordea el muro y baña el cuarto de color.":
			"Menyusuri dinding dan menyinari kamar dengan warna.",
		"Verde de metro ochenta para el rincón que sobra.":
			"Hijau setinggi 1,8 meter untuk sudut yang menganggur.",
		"Una columna de agua con peces. No hace nada y se mira.":
			"Kolom air berisi ikan. Tak berguna, tapi enak dipandang.",
		"Refrescos a mano cuando llega la visita.": "Minuman ringan siap diambil saat tamu datang.",
		"Se tira al suelo y ya hay un sitio más donde caer.":
			"Lempar ke lantai, dan ada satu tempat lagi untuk rebahan.",
		"Guarda lo que no se enseña, y hace de banco.":
			"Menyimpan yang tak dipajang, sekaligus jadi bangku.",
		"Donde va la chamarra al entrar por la puerta.":
			"Tempat jaket begitu kamu masuk lewat pintu.",
		"Jugos en frío, iluminados. La compra del que presume.":
			"Jus dingin dan menyala. Belanjaan orang yang suka pamer.",
		"Vinilo, brazo y altavoces sobre su mueble de madera.":
			"Piringan hitam, tonearm, dan speaker di atas lemari kayu.",
		"El suelo deja de estar desnudo.": "Lantai tak lagi polos.",
		"PLANTAS": "TANAMAN",
		"Algo vivo en cada cuarto.": "Ada yang hidup di setiap kamar.",
		"Los libros visten más que el mármol.":
			"Buku mendandani ruangan lebih baik dari marmer.",
		"LÁMPARAS DE PIE": "LAMPU LANTAI",
		"Rincones cálidos al caer la tarde.": "Sudut hangat saat senja tiba.",
		"RECÁMARA": "KAMAR",
		"SUITE": "SUITE",
		"SALÓN": "LOUNGE",
		"Camina y mira lo que has ganado": "Jalan-jalan dan lihat yang sudah kamu raih",
		"Por colocar: {0} en cajas": "Belum dipasang: {0} dalam kardus",
		"Lo que se compra aquí, por secciones:": "Yang bisa dibeli di sini, per bagian:",
		"ENTRAR": "MASUK",
		"LA SIGUIENTE": "BERIKUTNYA",
		"EL TECHO": "PUNCAK",
		"No hay casa mejor. Ahora llénala.":
			"Tak ada rumah yang lebih bagus. Sekarang tinggal isi.",
		"Descanso: +{0} de energía tras cada partido.":
			"Istirahat: +{0} energi setelah setiap laga.",
		"Suma +{0} de energía tras cada partido.":
			"Menambah +{0} energi setelah setiap laga.",
		"Sólo cabe en el jardín de un solar de {0} x {0} o más.": "Hanya muat di taman lahan {0} x {0} atau lebih besar.",
		"Mantenimiento: {0} por partido.": "Perawatan: {0} per laga.",
		"MUDARSE · {0}": "PINDAH · {0}",
		"TE FALTA {0}": "KURANG {0}",
		"SALA": "RUANG TAMU",
		"PATIO": "TERAS",
		"JARDIN": "TAMAN",
		"SALA DE TROFEOS": "RUANG TROFI",
		"SALA DE PREMIOS": "RUANG AWARD",
		"GALERIA": "GALERI",
		"GARAGE": "GARASI",
		"CANCHA": "ARENA",
		"SOFÁ": "SOFA",
		"MESA": "MEJA",
		"REPISA": "RAK",
		"CAMA": "BED",
		"VITRINA": "LEMARI TROFI",
		"MARCO": "FRAME",
		"BANCA": "BENCH",
		"AUTO": "MOBIL",
		"PORTERÍA": "GAWANG",




		"A PRESTAMO": "PINJAMAN",
		"MESA DE POQUER": "MEJA POKER",
		"AQUI": "SINI",
		"SUELO": "LANTAI",
		"BASTA": "CUKUP",
		"PINTAR TODAS LAS PAREDES": "CAT SEMUA DINDING",
		"PINTAR SUELO": "CAT LANTAI",
		"DEJAR DE PINTAR": "STOP MENGECAT",
		"QUITAR PINTURA": "HAPUS CAT",
		"QUITAR PISO": "LEPAS LANTAI",
		"Ancho de la brocha, en casillas.": "Lebar kuas, dalam petak.",
		"PINTAR ESTE CUARTO": "CAT KAMAR INI",
		"Se pinta el cuarto donde tengas la mano.": "Mengecat kamar tempat tanganmu berada.",
		"DERRIBAR EN LINEA": "BONGKAR LURUS",
		"DEJAR LA MAZA": "LEPAS PALU",
		"EMPEZAR DERRIBO": "MULAI BONGKAR",
		"TIRAR LO MARCADO": "BONGKAR TERTANDA",
		"DERRIBAR": "BONGKAR",
		"PASTO": "RUMPUT",
		"Ciegas: {0} y {1}": "Blind: {0} dan {1}",
		"{0} se retira": "{0} fold",
		"{0} pasa": "{0} check",
		"{0} iguala": "{0} call",
		"{0} sube a {1}": "{0} raise ke {1}",
		"PAREJA": "PAIR",
		"relacionesPAREJA": "KEKASIH",
		"ESCALERA": "STRAIGHT",
		"COLOR": "FLUSH",
		"FULL": "FULL HOUSE",
		"PREFLOP": "PREFLOP",
		"FLOP": "FLOP",
		"TURN": "TURN",
		"RIVER": "RIVER",
		"SHOWDOWN": "SHOWDOWN",
		"SIGUENOS":
			"FOLLOW US",
		"Síguenos y comparte el juego con tus amigos.":
			"Ikuti kami dan bagikan game ini ke teman-temanmu.",
		"COMPARTIR EL JUEGO": "BAGIKAN GAME",
		"COMPARTIR": "BAGIKAN",
		"ENLACE COPIADO · PÉGALO DONDE QUIERAS": "LINK DISALIN · TEMPEL DI MANA SAJA",
		"PULSA OTRA VEZ PARA SALIR": "KETUK LAGI UNTUK KELUAR",
		"VALORAR EL JUEGO": "BERI NILAI GAME",
		"GIRAR": "PUTAR",
		"CAJA": "BOX",
		"MUEBLE": "MEBEL",
		"GUARDA": "SIMPAN",
		"ANULAR": "BATAL",
		"MOVER": "GESER",
		"ALZAR": "BANGUN",
		"TRAZAR": "GAMBAR",
		"TIRAR": "ROBOH",
		"NO PASA": "BUNTU",
		"PINTAR": "CAT",
		"GIRO": "PUTAR",
		"COLGAR PLAYERAS": "GANTUNG JERSEY",
		"PLAYERA ENMARCADA": "JERSEY BERBINGKAI",
		"COLGAR PLAYERA": "GANTUNG JERSEY",
		"Una playera enmarcada, la que tú elijas. Cuelga las que quieras.": "Satu jersey berbingkai, pilih sendiri. Gantung sebanyak yang kamu mau.",
		"MARCO {0} · VACÍO": "FRAME {0} · KOSONG",
		"MARCO {0}": "FRAME {0}",
		"AUTOMÁTICO": "OTOMATIS",
		"DORSAL": "NOMOR",
		"Toca el número que quieras. Los que llevan tus compañeros se piden dos veces.": "Ketuk nomor yang kamu mau. Nomor yang dipakai rekan setim perlu dua ketukan.",
		"El {0} lo lleva {1}. Toca otra vez y te lo pones: a él le dan otro.": "Nomor {0} dipakai {1}. Ketuk lagi untuk mengambilnya: dia dapat nomor lain.",
		"El {0} lo lleva {1}. Mantén y te lo pones: a él le dan otro.": "Nomor {0} dipakai {1}. Tahan untuk mengambilnya: dia dapat nomor lain.",
		"DEJARLO AUTOMÁTICO": "BIARKAN OTOMATIS",
		"SILLA": "KURSI",
		"Para sentarse a la mesa.": "Untuk duduk di meja.",
		"BANCO DE BARRA": "KURSI BAR",
		"Para la barra de la cocina.": "Untuk meja bar dapur.",
		"SILLÓN": "ARMCHAIR",
		"Tu sitio para ver el partido.": "Tempatmu menonton laga.",
		"Tu solar pasa a {0} x {0}. Crece por los cuatro lados.":
			"Lahanmu jadi {0} x {0}. Melebar ke keempat sisi.",
		"{0} en una edición de {1}": "{0} dalam satu edisi {1}",
		"Mejor media": "Rata-rata terbaik",
		"{0} va con todo ({1})": "{0} all-in ({1})",
		"{0} se lleva {1} (los demás se fueron)":
			"{0} ambil {1} (yang lain fold)",
		"Gana {0} con {1} ({2})": "{0} menang dengan {1} ({2})",




		"ARCE CLARO": "MAPEL MUDA",
		"HORMIGÓN": "BETON",
		"MÁRMOL": "MARMER",
		"CARBÓN": "ARANG",
		"PARTIDA DE PÓQUER": "MALAM POKER",
		"Invitas, se reparten cartas y se juega con tu dinero.":
			"Kamu yang undang, kartu dibagikan, dan taruhannya uangmu sendiri.",
		"LOS DEL VESTUARIO": "REKAN SETIM",
		"Tres compañeros y una noche larga.":
			"Tiga rekan setim dan satu malam panjang.",
		"GENTE DE OTROS CLUBES": "PEMAIN KLUB LAIN",
		"Se juega más fuerte, y se cuenta por ahí.":
			"Taruhannya lebih besar, dan kabarnya menyebar.",
		"GENTE CONOCIDA": "WAJAH TERKENAL",
		"Apuestas de las que salen en el periódico.":
			"Taruhan yang sampai masuk koran.",
		"CARTA ALTA": "HIGH CARD",
		"DOBLE PAREJA": "TWO PAIR",
		"TRÍO": "THREE OF A KIND",
		"PÓQUER": "FOUR OF A KIND",
		"ESCALERA DE COLOR": "STRAIGHT FLUSH",
		"PUNTERÍA": "AKURASI",
		"AQUI GIRA": "BELOK SINI",
		"SIN MESA": "NOL MEJA",
		"dejarías un rincón sin paso":
			"kamu akan membuat sudut yang tak bisa dilewati",
		"Solo ante el portero: define el mano a mano.":
			"Berhadapan dengan kiper: tuntaskan duelnya.",
		"Jala hacia atrás y suelta al arco": "Tarik ke belakang dan lepas ke gawang",
		"Disparo de frente: aprovecha el ángulo abierto.":
			"Tembakan dari depan: manfaatkan sudut terbuka.",
		"Jala y suelta con fuerza al arco": "Tarik dan lepas kuat ke gawang",
		"Desde lejos: la puntería pesa más que la fuerza.":
			"Dari jauh: akurasi lebih penting daripada tenaga.",
		"Apunta fino y suelta al arco": "Bidik halus dan lepas ke gawang",
		"Ángulo cerrado: mete efecto para colarla.":
			"Sudut sempit: beri efek agar bola masuk.",
		"Curva el tiro hacia el palo largo": "Lengkungkan tembakan ke tiang jauh",
		"Contragolpe: resuelve antes de que cierre la defensa.":
			"Serangan balik: selesaikan sebelum pertahanan menutup.",
		"Jala y suelta antes de que te tapen":
			"Tarik dan lepas sebelum kamu terkepung",
		"El balón es TUYO y estás en la banda: cuélgalo al área o prueba el tiro escorado.":
			"Bola MILIKMU dan kamu di sayap: lambungkan ke kotak penalti atau coba tembakan menyudut.",
		"Jala y suelta: al área o al arco":
			"Tarik dan lepas: ke kotak atau gawang",
		"Tiro libre directo: sortea la barrera al arco.":
			"Tendangan bebas langsung: lewati pagar betis ke gawang.",
		"Jala y suelta por encima de la barrera":
			"Tarik dan lepas di atas pagar betis",
		"Córner: coloca el centro para el remate.":
			"Korner: arahkan umpan silang untuk disambut.",
		"Pon el balón al corazón del área":
			"Taruh bola di jantung kotak penalti",
		"Penal: tú y el portero, a sangre fría.":
			"Penalti: kamu dan kiper, berdarah dingin.",
		"Elige tu lado y suelta ajustado":
			"Pilih sisimu dan lepas dengan presisi",
		"Falta al borde del área: monta el disparo desde fuera.":
			"Pelanggaran di tepi kotak: siapkan tembakan dari luar.",
		"Jala y suelta buscando el hueco":
			"Tarik dan lepas, cari celah",
		"Saque de banda: reanuda el ataque con un compañero.":
			"Lemparan ke dalam: lanjutkan serangan lewat rekan setim.",
		"Saca rápido hacia un compañero": "Lempar cepat ke rekan setim",
		"Cancha entera y sin reloj: siente la conducción y tira cuando quieras.":
			"Lapangan penuh dan tanpa jam: rasakan giringan dan tembak kapan saja.",
		"Arrastra para conducir; suelta en el círculo para tirar":
			"Seret untuk menggiring; lepas di lingkaran untuk menembak",
		"Ganas COMPLETANDO el pase largo a la otra banda, no marcando.":
			"Kamu menang dengan MENUNTASKAN umpan panjang ke sayap seberang, bukan dengan mencetak gol.",
		"Apunta al compañero de la otra banda":
			"Bidik rekan setim di sayap seberang",
		"Aquí NO se tira: llega a las zonas rojas para salir limpio.":
			"Di sini DILARANG menembak: capai zona merah untuk keluar dengan bersih.",
		"Arrastra para correr y zafarte de la marca":
			"Seret untuk berlari dan lepas dari penjagaan",
		"Trofeos": "Trofi",
		"ANDA POR LA CASA · TOCA PARA RENOMBRAR O GUARDAR":
			"KELILING RUMAH · KETUK: UBAH NAMA/SIMPAN",
		"Ampliar a {0} x {0}: levanta las paredes donde quieras y amuébla­lo a tu gusto en el modo edición.":
			"Perluas jadi {0} x {0}: dirikan dinding sesukamu dan tata sesuai seleramu di mode edit.",
		"Asistencias": "Assist",
		"Aún no hay cartas en la mesa.": "Belum ada kartu di meja.",
		"BOTE: {0}": "POT: {0}",
		"CESION": "PINJAM",
		"LEY BOSMAN": "BOSMAN",
		"DEADLINE DAY": "DEADLINE DAY",
		"División": "Divisi",
		"EL DIARIO": "KORAN",
		"EL TRASPASO": "TRANSFER",
		"EL VESTUARIO DEL AÑO": "TIM TERBAIK THN",
		"EN CURSO": "BERJALAN",
		"Edad": "Usia",
		"El club te sube a {0}": "Klub menaikkanmu ke {0}",
		"El primero de muchos. Este no se te olvida en toda la carrera.":
			"Yang pertama dari sekian banyak. Yang ini tak akan kamu lupakan sepanjang karier.",
		"GANO EL DERBI": "MENANG DERBY",
		"GUARDARLA (HOY NO SALE)": "SIMPAN (HARI INI LIBUR)",
		"Goles": "Gol",
		"Guardado": "Disimpan",
		"HOY NO SALE · TOCA PARA RENOMBRAR O SACAR":
			"LIBUR · KETUK: UBAH NAMA/KELUARKAN",
		"Hoy la ciudad amaneció con la portada buena.": "Pagi ini, kota disambut halaman depan yang tepat.",
		"Hoy la ciudad amaneció con tu nombre en la portada.":
			"Pagi ini, kota disambut namamu di halaman depan.",
		"IGUALAR": "CALL",
		"INVITADO": "TAMU",
		"JUGAR PÓQUER": "MAIN POKER",
		"FACIL": "MUDAH",
		"MEDIO": "SEDANG",
		"DIFICIL": "SULIT",
		"EXTREMO": "EKSTREM",

		"MANTEN PULSADO": "TAHAN STABIL",
		"SUELTA PARA TIRAR": "LEPAS & LEMPAR",
		"¡SE TE FUE LA MANO!": "TANGANMU LICIN!",
		"DIANA": "BULLSEYE",
		"ANILLO": "OUTER BULL",
		"TRIPLE {0}": "TRIPLE {0}",
		"DOBLE {0}": "DOUBLE {0}",
		"VISITA {0} DE {1}": "RONDE {0}/{1}",
		"TU {0}   ·   {1} {2}": "KAMU {0}   ·   {1} {2}",
		"TIRA {0}": "{0} LEMPAR",
		"GANAS EL RETO": "KAMU MENANG",
		"GANAS LA PARTIDA": "KAMU MENANG FRAME",
		"OTRO DIA SERA": "LAIN KALI",
		"QUIMICA +{0}": "CHEMISTRY +{0}",
		"ARRASTRA Y SUELTA": "SERET & LEPAS",
		"FALTA · BOLA EN MANO": "FOUL · BOLA BEBAS",
		"MESA ABIERTA": "MEJA TERBUKA",
		"LISAS": "POLOS",
		"RAYADAS": "BELANG",
		"LA NEGRA": "BOLA 8",
		"{0} · TE QUEDAN {1}": "{0} · SISA {1}",
		"TIRAR DARDOS": "MAIN DART",
		"JUGAR BILLAR": "MAIN BILIAR",
		"¿CONTRA QUIEN?": "LAWAN SIAPA?",
		"TIRAR UN RATO": "LEMPAR SAJA",
		"UNA PARTIDA SOLO": "MAIN SENDIRI",
		"Ya ganaste química esta semana. Se juega por el récord.": "Kamu sudah dapat chemistry minggu ini. Yang ini demi rekor.",
		"EL UTILERO": "KITMAN",
		"UN COMPAÑERO": "REKAN SETIM",
		"EL CAPITAN": "KAPTEN",
		"DIANA DE DARDOS": "PAPAN DART",
		"Se tira como se chuta. Reta al vestuario y gana química.": "Lemparnya seperti menendang. Tantang ruang ganti dan dapatkan chemistry.",
		"Se tira como se chuta: tensas y sueltas. Reta a quien quieras.": "Lemparnya seperti menendang: tarik dan lepas. Tantang siapa saja.",
		"La resortera, sobre el paño. Una partida con el vestuario.": "Ketapel di atas kain meja. Satu frame bersama ruang ganti.",
		"NOCHE DE DARDOS": "MALAM DART",
		"Caen dos del vestuario y se tira hasta tarde.": "Dua rekan setim mampir dan kalian lempar sampai larut.",
		"NOCHE DE BILLAR": "MALAM BILIAR",
		"Tacos, hielo y una mesa que no se apaga.": "Stik, es, dan meja yang tak pernah berhenti.",
		"LEVANTARSE DE LA MESA": "TINGGALKAN MEJA",
		"LOS NUEVOS UNIFORMES": "KIT BARU",
		"Media (OVR)": "OVR",
		"Mejor gol": "Gol terbaik",
		"Mejor pase": "Umpan terbaik",
		"NUEVO CLUB": "KLUB BARU",
		"No se pudo crear el video": "Gagal membuat video",
		"No se pudo escribir el video": "Gagal menulis video",
		"No se pudo preparar la carpeta del video":
			"Gagal menyiapkan folder video",
		"Nota media": "Rating rata-rata",
		"OTRA MANO": "HAND BARU",
		"PASAR": "CHECK",
		"PONER NOMBRE": "BERI NAMA",
		"PRIMER GOL": "GOL AWAL",
		"Partidos": "Laga",
		"Prima de objetivo: ${0}": "Bonus target: ${0}",
		"Primas por títulos: ${0}": "Bonus gelar: ${0}",
		"Cláusula de ascenso: tu ficha sube a ${0}":
			"Klausul promosi: gajimu naik jadi ${0}",
		"Cláusula de descenso: tu ficha baja a ${0}":
			"Klausul degradasi: gajimu turun jadi ${0}",
		"RETIRARSE": "FOLD",
		"SACARLA A LA CASA": "BAWA KE RUMAH",
		"SE RETIRÓ": "FOLD",
		"SIN TRASPASO": "NOL TRANSFER",
		"SUBIR A {0}": "RAISE KE {0}",
		"Sin títulos esta temporada.": "Tak ada gelar musim ini.",
		"TRAMO": "RUAS",
		"TU PRIMER GOL": "GOL PERTAMAMU",
		"TU TURNO": "GILIRANMU",
		"PIENSA {0}…": "{0} BERPIKIR…",
		"TERMINA LA MANO PARA LEVANTARTE": "SELESAIKAN HAND UNTUK BANGKIT",
		"ESTA NOCHE: {0}": "MALAM INI: {0}",
		"MANO {0}/{1} · CIEGA {2}": "HAND {0}/{1} · BLIND {2}",
		"ULTIMA MANO DE LA NOCHE": "HAND TERAKHIR MALAM INI",
		"MEJOR MANO: {0}": "BEST HAND: {0}",
		"ARRUINASTE A {0}": "KAMU HABISI {0}",
		"NERVIOSO": "GUGUP",
		"TRANQUILO": "TENANG",
		"PRUDENTE": "WASPADA",
		"EQUILIBRADO": "SEIMBANG",
		"KAMIKAZE": "KAMIKAZE",
		"FAROLERO": "PEMBLUF",
		"TIENES: {0}": "PUNYA: {0}",
		"IGUALAR {0}": "CALL {0}",
		"TORNEO · MANO {0} · CIEGA {1}": "TURNAMEN · HAND {0} · BLIND {1}",
		"¡CAMPEÓN DEL TORNEO!": "JUARA TURNAMEN!",
		"TORNEO DE LA TEMPORADA": "TURNAMEN MUSIM INI",
		"TORNEO: YA JUGADO ESTA TEMPORADA": "TURNAMEN: SUDAH MAIN MUSIM INI",
		"Torneo de Póquer": "Turnamen Poker",
		"Campeón del Torneo de Póquer": "Juara Turnamen Poker",
		"RETO: GANA UN BOTE DE FAROL": "TANTANGAN: MENANG POT DGN BLUFF",
		"RETO: DEJA A UN RIVAL SIN FICHAS": "TANTANGAN: BANGKRUTKAN LAWAN",
		"RETO: GANA {0} EN UNA MANO": "TANTANGAN: MENANG {0} 1 HAND",
		"RETO: GANA CON COLOR O MEJOR": "TANTANGAN: MENANG FLUSH ATAU LEBIH",
		"RETO: ACABA LA NOCHE GANANDO": "TANTANGAN: PULANG UNTUNG",
		"RETO CUMPLIDO · QUIMICA +{0}": "TANTANGAN OK · CHEMISTRY +{0}",
		"RETO CUMPLIDO": "TANTANGAN OK",
		"RETO DE LA SEMANA: HECHO": "TANTANGAN MINGGU INI: OK",
		"TE DEBE {0}": "UTANGNYA {0}",
		"LE DEBES {0}": "UTANGMU {0}",
		"CIEGA {0} · PARA IGUALAR {1}": "BLIND {0} · UNTUK CALL {1}",
		"OVR {0}": "OVR {0}",
		"SUBIDA MINIMA {0} · TODO DENTRO {1}": "MIN RAISE {0} · ALL IN {1}",
		"TODO DENTRO ({0})": "ALL IN ({0})",
		"TODO {0}": "ALL IN {0}",
		"½ BOTE {0}": "½ POT {0}",
		"BOTE {0}": "POT {0}",
		"TUS FICHAS: {0}": "CHIPMU: {0}",
		"Tan cerca. La medalla de plata es la que enseña lo que todavía falta.":
			"Nyaris. Medali perak itulah yang menunjukkan apa yang masih kurang.",
		"Te sientan en el vestuario con el director deportivo. En {0} no pueden con tu sueldo y tu traspaso les cuadra el ejercicio: contaban con ese dinero antes de decírtelo.":
			"Kamu dipanggil ke ruang ganti bersama direktur olahraga. {0} tak sanggup menanggung gajimu, dan transfermu menyeimbangkan pembukuan mereka: mereka sudah mengandalkan uang itu sebelum memberi tahumu.",
		"Toca una temporada para verla en detalle.":
			"Ketuk satu musim untuk melihat detailnya.",
		"Toda la ciudad amaneció con esa portada.":
			"Pagi ini, seluruh kota disambut halaman depan itu.",
		"Toda la ciudad amaneció con tu fichaje en la portada.":
			"Pagi ini, seluruh kota disambut berita transfermu di halaman depan.",
		"Tres equipaciones nuevas. El club estrena piel.":
			"Tiga kit baru. Klub berganti kulit.",
		"Tu solar mide {0} x {0} metros.": "Lahanmu berukuran {0} x {0} meter.",
		"VER TEMPORADA A TEMPORADA": "MUSIM DEMI MUSIM",
		"VER RESUMEN": "RINGKASAN",
		"Valor": "Nilai",
		"Ya no se puede ampliar más.": "Tak bisa diperluas lagi.",
		"{0}  (liga {1})": "{0}  (liga {1})",
		"{0} m": "{0} m",
		"{0} · TEMPORADA {1}": "{0} · MUSIM {1}",
		"¿CON QUIÉN JUEGAS?": "MAIN SAMA SIAPA?",




		"MESA DE PÓQUER": "MEJA POKER",
		"Invita a quien quieras y juégate el dinero de verdad.":
			"Undang siapa saja dan main pakai uang sungguhan.",
		"CAMA SENCILLA": "BED SINGLE",
		"Un colchón y a dormir.": "Satu kasur, lalu tidur.",
		"CAMA DOBLE": "BED DOUBLE",
		"De verdad se descansa.": "Beneran bisa istirahat.",
		"CAMA KING": "BED KING",
		"La cama de alguien que ya llegó.":
			"Kasur orang yang sudah sampai di puncak.",
		"Para ver el partido sentado.": "Untuk menonton laga sambil duduk.",
		"SOFÁ ESQUINERO": "SOFA SUDUT",
		"Caben los amigos.": "Cukup untuk teman-temanmu.",
		"SOFÁ DE PIEL": "SOFA KULIT",
		"Piel de verdad, del color del salón de un fichaje caro.":
			"Kulit asli, sewarna ruang tamu rekrutan mahal.",
		"Donde se come.": "Tempat makan.",
		"MESA DE COMEDOR": "MEJA MAKAN",
		"Para sentar a la familia.": "Muat untuk seluruh keluarga.",
		"MESA DE MÁRMOL": "MEJA MARMER",
		"Pesa media tonelada y se nota.": "Beratnya setengah ton, dan terasa.",
		"COCINETA": "DAPUR MINI",
		"Dos fuegos y un fregadero.": "Dua tungku dan satu bak cuci.",
		"COCINA COMPLETA": "DAPUR LENGKAP",
		"Aquí ya se cocina en serio.": "Sekarang bisa masak sungguhan.",
		"COCINA CON ISLA": "DAPUR ISLAND",
		"Con isla en medio, como las de revista.":
			"Dengan island di tengah, seperti di majalah.",
		"GALLINA": "AYAM",
		"Una gallina que picotea y trota por la casa.":
			"Seekor ayam yang mematuk dan berlarian di rumah.",
		"LORO": "NURI",
		"Un loro de colores que brinca y no para quieto.":
			"Burung nuri berwarna-warni yang melompat dan tak bisa diam.",
		"PIANO DE COLA": "GRAND PIANO",
		"Laca negra en el salón. Suena a que llegaste.":
			"Pelitur hitam di ruang tamu. Terdengar seperti orang yang sudah sukses.",
		"MESA DE BILLAR": "MEJA BILIAR",
		"Una partida con el vestuario. La química se juega.":
			"Satu frame bersama ruang ganti. Chemistry dipertaruhkan.",
		"FUTBOLITO": "FOOSBALL",
		"Piques rápidos en casa. Nadie se va sin revancha.":
			"Duel gengsi kilat di rumah. Tak ada yang pergi tanpa rematch.",
		"ESCULTURA": "PATUNG",
		"Una pieza de autor. Puro caché en el salón.":
			"Karya bertanda tangan. Gengsi murni di ruang tamu.",
		"ACUARIO": "AKUARIUM",
		"Un muro de agua y peces. Baja las pulsaciones.":
			"Dinding air dan ikan. Menurunkan detak jantung.",
		"ESTILO CALIDO": "GAYA HANGAT",
		"Terracota, roble y luz de tarde. La casa abraza.":
			"Terakota, kayu ek, dan cahaya senja. Rumah yang memeluk.",
		"ESTILO INDUSTRIAL": "GAYA INDUSTRI",
		"Cemento visto, acero y madera cruda. Sin adornos.":
			"Semen ekspos, baja, dan kayu mentah. Tanpa hiasan.",
		"ESTILO MARMOL": "GAYA MARMER",
		"Mármol blanco y filos de oro. La casa de un campeón.":
			"Marmer putih dan tepi emas. Rumah seorang juara.",
		"PANTALLA GRANDE": "LAYAR BESAR",
		"Una tele más grande para ver el gol en condiciones.":
			"TV yang lebih besar untuk menonton gol dengan layak.",
		"PANTALLA MURAL": "LAYAR DINDING",
		"Pantalla de pared, como en el palco. Se ve desde la cocina.":
			"Layar dinding, seperti di boks VIP. Terlihat dari dapur.",
		"MESA DE JARDÍN": "MEJA TAMAN",
		"BANCA DE JARDÍN": "BANGKU TAMAN",
		"Un sitio donde sentarse fuera y ver pasar la temporada.": "Tempat duduk di luar sambil melihat musim berlalu.",
		"Con sombrilla. Para comer fuera cuando aprieta el calor.": "Dengan payung. Untuk makan di luar saat panas terik.",
		"Agua corriendo en el patio. Se oye antes de verse.": "Air mengalir di teras. Terdengar sebelum terlihat.",
		"Sombra de vigas sobre el patio. Se pasa por debajo.": "Bayangan balok di atas teras. Kamu lewat di bawahnya.",

		"ARBUSTO": "SEMAK",
		"SOMBRILLA": "PAYUNG",
		"FAROL DE JARDÍN": "LAMPU TAMAN",
		"HAMACA": "HAMAK",
		"CAMASTRO": "KURSI JEMUR",
		"ÁRBOL": "POHON",
		"COLUMPIO DE TERRAZA": "AYUNAN TERAS",
		"FOGATA": "UNGGUN",
		"HUERTO": "KEBUN SAYUR",
		"PORTERÍA DE ENTRENO": "GAWANG LATIHAN",
		"ESTANQUE DE KOI": "KOLAM KOI",
		"COCINA EXTERIOR": "DAPUR LUAR",
		"HELICÓPTERO": "HELIKOPTER",
		"Nada de carreteras: llegas a todo volando y el cuerpo lo nota.": "Tak ada lagi jalan raya: kamu terbang ke mana-mana dan badanmu merasakannya.",
		"HELIPUERTO": "HELIPAD",
		"Verde bajo para el borde del terreno. Se ponen varios.":
			"Hijau rendah untuk tepi lahan. Bisa dipasang beberapa.",
		"Sombra donde no hay árbol. Va sola, sin mesa debajo.":
			"Naungan di tempat tak ada pohon. Berdiri sendiri, tanpa meja di bawahnya.",
		"Luz propia fuera: de noche el jardín deja de ser un hueco negro.":
			"Cahaya sendiri di luar: malam hari taman tak lagi jadi lubang hitam.",
		"Lona suspendida entre dos postes para descansar al aire libre.":
			"Kain terbentang di antara dua tiang untuk bersantai di udara terbuka.",
		"Tumbarse al sol. Junto a la piscina se ven de a dos.":
			"Berbaring di bawah matahari. Di dekat kolam, cocok berdua.",
		"Tres metros de copa: lo único que da sombra de verdad.":
			"Tajuk tiga meter: satu-satunya yang memberi teduh sungguhan.",
		"Un banco colgado que se mece. Para ver caer la tarde.":
			"Bangku gantung yang berayun. Untuk melihat senja turun.",
		"Fuego fuera: alumbra el patio y calienta la noche.":
			"Api di luar: menerangi teras dan menghangatkan malam.",
		"Bancales con verdura. Se come lo que sale de tu terreno.":
			"Bedengan penuh sayur. Kamu makan hasil lahanmu sendiri.",
		"Portería con red: entrenar en casa deja de ser una idea.":
			"Gawang berjaring: latihan di rumah tak lagi sekadar ide.",
		"Agua quieta con carpas y una cascada que no calla.":
			"Air tenang dengan ikan koi dan air terjun yang tak pernah diam.",
		"Barra, fuegos y fregadero fuera. El asador con casa.":
			"Meja bar, kompor, dan bak cuci di luar. Panggangan lengkap dengan rumahnya.",
		"La losa con la H. No sirve para nada y se ve desde el aire.":
			"Landasan dengan huruf H. Tak berguna, dan terlihat dari udara.",
		"Sombra donde no hay árbol. Se planta y ya hay sitio.":
			"Naungan di tempat tak ada pohon. Tanam saja, tempat teduh langsung ada.",
		"Verde bajo para el borde. Lo barato que llena metros.":
			"Hijau rendah untuk tepi. Cara murah mengisi lahan.",
		"Luz propia en el jardín, encendida en cuanto cae la noche.":
			"Cahaya sendiri di taman, menyala begitu malam tiba.",
		"FUENTE": "FOUNTAIN",
		"PÉRGOLA": "PERGOLA",



		"ENTRENO": "LATIHAN",
		"ENTRENAMIENTO": "LATIHAN",
		"EL CAMPO DE ATRÁS": "LAPANGAN BELAKANG",
		"Un campo cercado, una caseta y los conos. Con eso se empieza.":
			"Lapangan berpagar, satu pondok, dan kerucut. Dari sinilah kamu mulai.",
		"LA CIUDAD DEPORTIVA": "KOMPLEKS LATIHAN",
		"CIUDAD DEPORTIVA": "PUSAT LATIHAN",
		"Vallado en condiciones, vestuarios y material para el balón parado.":
			"Pagar yang layak, ruang ganti, dan perlengkapan bola mati.",
		"EL CENTRO DE ALTO RENDIMIENTO": "PUSAT PERFORMA TINGGI",
		"Tribuna, torre de filmación y una estación para cada cosa que sabes hacer.":
			"Tribun, menara perekam, dan satu stasiun untuk tiap hal yang bisa kamu lakukan.",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario"
		+ " distinto. Todavía no cuenta para la carrera. Se sale con PAUSA.":
			"Pilih satu latihan dan ulangi sepuasnya: tiap percobaan menyusun skenario berbeda. Belum dihitung untuk karier. Keluar dengan JEDA.",
		"QUE SE ENTRENA AQUI": "LATIHAN DI SINI",
		"SI SUBES DE CATEGORIA": "JIKA NAIK DIVISI",
		"Se abre: {0}.": "Terbuka: {0}.",
		"PREPARADOR FÍSICO": "PELATIH FISIK",
		"Alguien que cuida tu cuerpo a jornada completa: la mayor recuperación tras"
		+ " cada partido.":
			"Seseorang yang menjaga tubuhmu sepenuh waktu: pemulihan terbesar setelah tiap laga.",
		"CHEF PERSONAL": "CHEF PRIBADI",
		"Cocina para ti cada semana: COMER BIEN no te gasta acción y recuperas más energía tras cada partido.":
			"Memasak untukmu tiap minggu: MAKAN SEHAT tak menghabiskan aksi dan kamu memulihkan lebih banyak energi setelah tiap laga.",
		"TU CHEF COCINÓ · SIN GASTAR ACCIÓN": "CHEFMU MASAK · TAK PAKAI AKSI",
		"NUTRICIONISTA": "AHLI GIZI",
		"Te arma la dieta de cada semana: cada partido te gasta menos energía.": "Menyusun dietmu tiap minggu: tiap laga menguras lebih sedikit energimu.",
		"ENTRENADOR PERSONAL": "PELATIH PRIBADI",
		"Te espera en tu gimnasio: LEVANTAR PESAS no te gasta acción.": "Menunggumu di gym: ANGKAT BEBAN tak menghabiskan aksi.",
		"CON TU ENTRENADOR · SIN GASTAR ACCIÓN": "BERSAMA PELATIHMU · TAK PAKAI AKSI",
		"GASTO": "KURAS",
		"ACCIONES": "AKSI",
		"NIVEL {0}/{1}": "LEVEL {0}/{1}",
		"TUYO · NIVEL {0}/{1}": "PUNYA · LEVEL {0}/{1}",
		"SUBE A NIVEL {0} · PAGO ÚNICO": "NAIK KE LEVEL {0} · BAYAR SEKALI",
		"Comes como atleta: +{0}% de experiencia en cada partido.": "Kamu makan seperti atlet: pengalaman +{0}% di tiap laga.",
		"Te cuida el cuerpo: {0}% menos riesgo de lesión.": "Dia menjaga tubuhmu: risiko cedera {0}% lebih rendah.",
		"Más exigente: LEVANTAR PESAS te da +{0} de técnico.": "Lebih menuntut: ANGKAT BEBAN memberimu +{0} relasi dengan pelatih.",
		"CONSULTORIO DE NUTRICIÓN": "KLINIK GIZI",
		"Escritorio, báscula con tallímetro y el plato en la pared: donde trabaja tu nutricionista.": "Meja kerja, timbangan dengan pengukur tinggi, dan poster piring makan di dinding: tempat ahli gizimu bekerja.",
		"El consultorio de tu nutricionista: escritorio, báscula con tallímetro y el póster del plato.": "Ruang praktik ahli gizimu: meja kerja, timbangan dengan pengukur tinggi, dan poster piring makan.",
		"CLÍNICA PRIVADA": "KLINIK PRIBADI",
		"Casi la mitad de riesgo de lesión, y toda baja dura la mitad.":
			"Risiko cedera nyaris separuh, dan setiap masa absen separuh lebih singkat.",
		"ANALISTA DE VÍDEO": "ANALIS VIDEO",
		"Estudias cada partido con alguien que sabe mirar: +25% de experiencia.":
			"Kamu pelajari tiap laga bersama orang yang paham cara menonton: pengalaman +25% di tiap laga.",
		"RENEGOCIAR CON EL AGENTE": "NEGO ULANG DENGAN AGEN",
		"Su comisión baja del 8% al 3%. Cara, pero cuanto antes la firmes, más te"
		+ " devuelve.":
			"Komisinya turun dari 8% jadi 3%. Mahal, tapi makin cepat kamu teken, makin banyak kembali.",
		"CORTES DE PELO": "MODEL RAMBUT",
		"VELLO FACIAL": "BULU WAJAH",
		"TINTES": "WARNA",
		"PUNTAS": "UJUNG",
		"ENTRADAS": "DAHI LUAS",
		"La frente que gana terreno. Asúmelo con dignidad.":
			"Dahi yang makin luas. Terima dengan bermartabat.",
		"RAPADO A LOS LADOS": "UNDERCUT",
		"Máquina en los lados, tupé arriba. El corte de vestuario.":
			"Mesin cukur di sisi, jambul di atas. Potongan ruang ganti.",
		"RAYA AL LADO": "SIDE PART",
		"Una raya rapada a navaja. Detalle de peluquería cara.":
			"Garis belah dicukur pakai pisau. Ciri barbershop mahal.",
		"DEGRADADO": "FADE",
		"Se difumina hacia abajo. Nunca pasa de moda.":
			"Memudar ke bawah. Tak pernah ketinggalan zaman.",
		"FRANJAS RAPADAS": "GARIS CUKUR",
		"Rayas marcadas al ras. Para el que ya tuvo su noche perfecta.":
			"Garis dicukur sampai kulit. Untuk yang pernah punya malam sempurna.",
		"CRESTA ANCHA": "MOHAWK LEBAR",
		"El mohicano de los campeones. Se lleva con una liga en la vitrina.":
			"Mohawk para juara. Dipakai kalau sudah ada gelar liga di lemari.",
		"PATILLAS": "CAMBANG",
		"Bajan por la mandíbula y ahí se quedan.": "Turun di sepanjang rahang lalu berhenti di sana.",
		"MOSCA": "SOUL PATCH",
		"Un toque bajo el labio. Poco pelo, mucha actitud.":
			"Sentuhan di bawah bibir. Sedikit rambut, banyak gaya.",
		"CANDADO": "CHINSTRAP",
		"Contorno fino, mejilla limpia. Requiere pulso.":
			"Garis tipis, pipi bersih. Butuh tangan yang mantap.",
		"BARBÓN": "JENGGOT",
		"Barba cerrada de verdad. Diez años encima en una semana.":
			"Jenggot lebat sungguhan. Sepuluh tahun lebih tua dalam seminggu.",
		"BIGOTE MANILLAR": "KUMIS STANG",
		"Las puntas caen. Solo se lo permite quien lleva una década.":
			"Ujungnya melengkung turun. Hanya pemain yang sudah sepuluh tahun berkarier pantas memakainya.",
		"PLATINO": "PLATINUM",
		"Decolorado entero. Te van a encontrar en cualquier repetición.":
			"Diputihkan semua. Kamu gampang ditemukan di replay mana pun.",
		"ROJO FUEGO": "MERAH API",
		"Se ve desde el último anillo de la grada.":
			"Kelihatan dari tribun paling atas.",
		"AZUL ELÉCTRICO": "BIRU LISTRIK",
		"Para el que ya fue el mejor de un mes y quiere que se note.":
			"Untuk yang pernah jadi pemain terbaik bulanan dan mau semua orang tahu.",
		"ROSA": "PINK",
		"Solo se lo puede permitir alguien con un Balón de Oro en casa.":
			"Hanya yang punya trofi Pemain Terbaik di rumah yang pantas memakainya.",
		"PUNTAS DECOLORADAS": "UJUNG PIRANG",
		"Solo las puntas. El resto se queda como estaba.":
			"Hanya ujungnya. Sisanya tetap seperti semula.",
		"PUNTAS DORADAS": "UJUNG EMAS",
		"Oro en las puntas. Se gana ganando Europa.":
			"Emas di ujung. Didapat dengan menjuarai Eropa.",




		"RADIO COMARCAL": "RADIO DAERAH",
		"CERÁMICA NORTE": "KERAMIK UTARA",
		"NOVA MÓVIL": "NOVA MOBILE",
		"HELIOS SEGUROS": "HELIOS ASURANSI",
		"IMPERIAL": "IMPERIAL",
		"Te conocen del barrio. Cada año que cumples, te suben el trato.":
			"Mereka kenal kamu dari kampung. Tiap tahun kamu tampil, kontrakmu naik.",
		"Narran tus partidos y te pagan por el pase, no por el remate.":
			"Mereka menyiarkan laga-lagamu dan membayar untuk umpan, bukan penyelesaian.",
		"Casi no te pagan por venir. Te pagan por el año entero.":
			"Mereka hampir tak membayarmu untuk datang. Mereka membayar untuk setahun penuh.",
		"La valla del estadio es tuya, pero sólo cobras cuando marcas.":
			"Papan iklan stadion milikmu, tapi kamu hanya dibayar saat mencetak gol.",
		"Les gusta el balón parado. Lo demás no se lo cuentan.":
			"Mereka suka bola mati. Selebihnya tak dihitung.",
		"Pagan la asistencia como otros pagan el gol.":
			"Mereka membayar assist seperti yang lain membayar gol.",
		"La llevan los que deciden partidos. Les da igual cómo.":
			"Dipakai para pemain penentu laga. Mereka tak peduli caranya.",
		"Quieren regularidad, no fuegos artificiales. Y la quieren todo el año.":
			"Mereka mau konsistensi, bukan kembang api. Dan mau sepanjang tahun.",
		"Sólo miran las noches grandes: Europa y copa. La liga no existe.":
			"Mereka hanya menonton malam-malam besar: Eropa dan piala. Liga dianggap tak ada.",
		"La marca del mundo te mira, y el mundo no se conforma.":
			"Merek dunia mengawasimu, dan dunia tak mudah puas.",
		"El contrato de una vida, y pide la temporada de una vida.":
			"Kontrak seumur hidup, dan menuntut musim terbaik seumur hidup.",
		"{0} ASISTENCIAS": "{0} ASSIST",
		"{0} ENTRE GOLES Y ASISTENCIAS": "{0} GOL + ASSIST",
		"{0} GOLES A BALÓN PARADO": "{0} GOL BOLA MATI",
		"{0} GOLES EN EUROPA O COPA": "{0} GOL EROPA/PIALA",
		" Y MEDIA {0}": " DAN RATING {0}",
		" · media {0}/{1}": " · rating {0}/{1}",
		"GOL O ASISTENCIA": "GOL ATAU ASSIST",
		"GOL DE BALÓN PARADO": "GOL BOLA MATI",
		"GOL EN EUROPA O COPA": "GOL EROPA/PIALA",
		"GOL DE PENAL": "GOL PENALTI",
		"{0} te sube el trato: ${1} por partido": "{0} menaikkan kontrakmu: ${1} per laga",
		"${0} por partido + ${1} por {2}": "${0} per laga + ${1} per {2}",
		"${0} / PARTIDO   +${1} POR {2}": "${0} / LAGA   +${1} PER {2}",
		"PREMIO ${0}": "BONUS ${0}",
		"TU MARCA": "MEREKMU",
		"PANADERÍA DEL BARRIO": "TOKO ROTI LOKAL",
		"IRON FIT": "IRON FIT",
		"VOLT COLA": "VOLT COLA",
		"BANCO MERIDIÁN": "BANK MERIDIAN",
		"Pagan por estar en el campo. Si te sientan, no cobras.":
			"Mereka bayar untuk kamu di lapangan. Kalau dicadangkan, tak dibayar.",
		"KRONOS SPORT": "KRONOS SPORT",
		"MOTORES ARIA": "MOTOR ARIA",
		"AEROLÍNEAS CÉNIT": "MASKAPAI ZENITH",

		"PROMESA": "PROSPEK",
		"PROFESIONAL": "PROFESIONAL",
		"FIGURA": "ANDALAN",
		"ESTRELLA MUNDIAL": "BINTANG DUNIA",
		"LEYENDA": "LEGENDA",
		"INMORTAL": "ABADI",
		"del Mundo": "Dunia",
		"de tu club": "klubmu",
		"de {0}": "{0}",
		"INMORTAL {0}": "ABADI {0}",
		"INMORTAL ★{0}": "ABADI ★{0}",
		"Leyenda eterna {0}.": "Legenda abadi {0}.",
		"—a las puertas": "—di ambang",
		"Te falta prestigio de leyenda mundial (o palmarés de club) para LEYENDA.":
			"Kamu butuh prestise legenda dunia (atau koleksi gelar klub) untuk mencapai LEGENDA.",
		"CLASIFICATORIAS": "KUALIFIKASI",
		"CLASIF. MUNDIAL": "KUAL. DUNIA",
		"CLASIF. EUROPA": "KUAL. EROPA",
		"CLASIF. SUDAMÉRICA": "KUAL. AMERIKA SEL.",
		"CLASIF. NORTEAMÉRICA": "KUAL. AMERIKA UT.",
		"CLASIF. ASIA": "KUAL. ASIA",
		"CLASIF. ÁFRICA": "KUAL. AFRIKA",
		"CLASIF. OCEANÍA": "KUAL. OSEANIA",
		"MUNDIAL": "DUNIA",
		"CONTINENTAL": "KONTINENTAL",


		"AMISTOSOS": "UJI COBA",
		"TODA LA CARRERA POR TORNEO": "SELURUH KARIER PER TURNAMEN",
		"Ningún puesto de esta liga da plaza de {0}: las plazas se reparten por el"
		+ " coeficiente del país, y la última competición es la puerta de las ligas"
		+ " pequeñas.":
			"Tak ada peringkat di liga ini yang memberi jatah {0}: jatah dibagi menurut koefisien negara, dan kompetisi terakhir adalah pintu masuk liga-liga kecil.",
		"De {0} temporada(s) vieja(s) sólo se guardó el total, sin repartir por"
		+ " torneo: no entran en esta tabla.":
			"Dari {0} musim lama hanya total yang tersimpan, tanpa rincian per turnamen: tidak masuk tabel ini.",
		"EUROCOPA": "TURNAMEN EROPA",
		"COPA AMÉRICA": "TURNAMEN A. SELATAN",
		"COPA ORO": "TURNAMEN A. UTARA",
		"COPA DE ASIA": "TURNAMEN ASIA",
		"COPA AFRICANA": "TURNAMEN AFRIKA",
		"COPA CONTINENTAL": "PIALA BENUA",




		"COPA DE CAMPEONES": "PIALA ELITE",
		"COPA EUROPA": "PIALA EUROPA",
		"COPA CONFERENCIA": "PIALA CHALLENGE",

		"Aún no hay nada que exponer": "Belum ada yang dipajang",
		"sin sitio · pon otra vitrina o repisa": "tak ada tempat · tambah lemari atau rak lain",
		"sin sitio · pon otro estante de balones": "tak ada tempat · tambah rak bola lain",
		"CAMISETAS": "JERSEY",
		"EN EQUIPO": "TIM",
		"INDIVIDUALES": "INDIVIDU",
		"Sin registro del año": "Tak ada catatan tahun",
		"SALIR DE LA CANCHA": "KELUAR LAPANGAN",
		"Pronto podrás entrenar aquí.": "Sebentar lagi kamu bisa berlatih di sini.",
		"ISLA CON BARRA": "ISLAND BAR",
		"La barra exenta: se cocina de un lado y se come del otro.":
			"Bar berdiri sendiri: masak di satu sisi, makan di sisi lain.",
		"TOCADOR CON ESPEJO": "MEJA RIAS+CERMIN",
		"CAMA PARA PERRO": "KASUR ANJING",
		"RASCADOR PARA GATO": "TIANG CAKAR",
		"LAVANDERÍA": "LAUNDRY",
		"MUEBLE DE RECIBIDOR": "MEJA KONSOL",
		"VESTIDOR DE ROPA DE CALLE": "LEMARI BAJU HARIAN",
		"TELESCOPIO": "TELESKOP",
		"CAMBIAR DE ROPA": "GANTI BAJU",
		"VOLVER A CASA": "PULANG",
		"Cojín, manta y juguete: el perro tiene dónde descansar.":
			"Bantal, selimut, dan mainan: anjingmu punya tempat istirahat.",
		"Postes y plataformas para que el gato tenga su rincón.":
			"Tiang dan platform supaya kucingmu punya sudutnya sendiri.",
		"Lavadora, cesta y toallas para la ropa de entrenamiento.":
			"Mesin cuci, keranjang, dan handuk untuk perlengkapan latihanmu.",
		"Llaves, mochila y zapatos: todo a mano junto a la entrada.":
			"Kunci, ransel, dan sepatu: semua di dekat pintu masuk.",
		"Ropa de calle, tenis y espejo. Acércate para cambiarte.":
			"Baju harian, sneakers, dan cermin. Dekati untuk berganti baju.",
		"Tubo óptico sobre trípode para tu rincón junto a la ventana.":
			"Tabung optik di atas tripod untuk sudutmu di dekat jendela.",
		"Un rincón para los dos: espejo, frascos y banqueta.":
			"Sudut untuk berdua: cermin, botol, dan bangku kecil.",
		"TOCADOR": "MEJA RIAS",
		"El rincón de arreglarse, con espejo y su banqueta.":
			"Sudut untuk bersiap, dengan cermin dan bangku kecilnya.",
		"DESPACHO CON CAJA FUERTE": "KANTOR DAN BRANKAS",
		"Escritorio, carpetas y caja fuerte. Aquí se firma lo que ganas.":
			"Meja kerja, map, dan brankas. Di sini penghasilanmu diteken.",
		"REPASAR CONTRATOS": "CEK KONTRAK",
		"Una tarde con tu agente y los papeles sobre la mesa.":
			"Sore bersama agenmu dengan berkas di atas meja.",
		"SAUNA": "SAUNA",
		"Duelas, piedras calientes y media hora de calor seco.":
			"Panel kayu, batu panas, dan setengah jam panas kering.",
		"Calor seco en duelas de pino. Sales otro después del partido.":
			"Panas kering di panel pinus. Kamu keluar jadi orang baru setelah laga.",
		"GORRAS DE LA SELECCIÓN": "TOPI TIMNAS",
		"Una gorra por partido con tu país. Se llena sola.":
			"Satu topi per laga untuk negaramu. Terisi sendiri.",
		"BALÓN DEL PRIMER GOL": "BOLA GOL PERTAMA",
		"El balón de tu primer gol, bajo cristal y con su cartela.":
			"Bola dari gol pertamamu, di bawah kaca dengan plakatnya.",
		"COCINA DEL NUTRICIONISTA": "DAPUR AHLI GIZI",
		"Nevera de raciones pesadas y báscula en la barra.":
			"Kulkas porsi yang ditimbang dan timbangan di meja bar.",
		"Comer medido: la misma comida de casa, pero pesada.":
			"Makan terukur: masakan rumah yang sama, tapi ditimbang.",
		"Todo pesado y a su hora: el cuerpo lo nota el domingo.":
			"Semua ditimbang dan tepat waktu: tubuhmu merasakannya hari Minggu.",
		"Barra central con fregadero: aquí se cocina y se come.":
			"Meja bar tengah dengan wastafel: di sini kamu masak dan makan.",
		"MALETAS APILADAS": "TUMPUKAN KOPER",
		"Una maleta por club. La pila crece con cada traspaso.":
			"Satu koper per klub. Tumpukannya bertambah tiap transfer.",
		"SILLÓN DE BARBERO": "KURSI BARBER",
		"Cuero, espejo con bombillas y carrito. Aquí se hacen las portadas.":
			"Kulit, cermin berlampu, dan troli. Foto sampul dimulai dari sini.",
		"VITRINA ISLA": "LEMARI ISLAND",
		"La isla de museo: cristal por los cuatro lados y tres baldas.":
			"Lemari ala museum: kaca di keempat sisi dan tiga rak.",
		"ESTATUA DE BRONCE": "PATUNG PERUNGGU",
		"Tú en bronce, sobre un plinto con tu nombre y tus títulos.":
			"Dirimu dari perunggu, di atas alas dengan nama dan gelarmu.",
		"SIESTA AL SOL": "TIDUR SIANG",
		"Media hora fuera, sin teléfono. El cuerpo lo agradece.":
			"Setengah jam di luar, tanpa ponsel. Tubuhmu berterima kasih.",


		"CABINA DE PÓDCAST": "BILIK PODCAST",
		"TINA DE HIELO": "BAK ES",
		"BANCO DE BOTAS": "BANGKU SEPATU",
		"TOALLERO": "RAK HANDUK",
		"ESPEJO DE CUERPO ENTERO": "CERMIN BADAN PENUH",
		"MESA DE CENTRO": "MEJA TENGAH",
		"RINCÓN DEL CAFÉ": "SUDUT KOPI",
		"APARADOR DE VAJILLA": "LEMARI PIRING",
		"GALLINERO": "KANDANG",
		"GRABAR UN PÓDCAST": "REKAM PODCAST",
		"BAÑO DE HIELO": "MANDI ES",
		"LIMPIAR LAS BOTAS": "BERSIHKAN SEPATU",
		"MINIJUEGOS": "MINIGAME",
		"Micro, cascos y panel acústico. Graba tu semana: rinde con la prensa.":
			"Mik, headphone, dan panel akustik. Rekam minggumu: pers menyukainya.",
		"Agua a tres grados. Tres minutos que las piernas agradecen.":
			"Air tiga derajat. Tiga menit yang akan disyukuri kakimu.",
		"Balda, cepillo y hormas. Botas cuidadas se gastan la mitad.":
			"Rak, sikat, dan pengganjal sepatu. Sepatu terawat ausnya cuma separuh.",
		"Barra de pared con toallas limpias. Pide muro para colgarse.":
			"Rel dinding dengan handuk bersih. Butuh dinding untuk dipasang.",
		"Luna de cuerpo entero para mirarte antes de salir.":
			"Cermin badan penuh untuk memeriksa penampilan sebelum keluar.",
		"Baja, delante del sofá: ahí van el café y el mando.":
			"Rendah, di depan sofa: tempat kopi dan remote.",
		"Cafetera, tazas y molinillo. El primer café del día, en casa.":
			"Mesin kopi, cangkir, dan penggiling. Kopi pertama hari ini, di rumah.",
		"Vajilla a la vista tras el cristal. La mesa se pone desde aquí.":
			"Peralatan makan terlihat di balik kaca. Meja makan disiapkan dari sini.",
		"Caseta con tejadillo y nidal: la gallina tiene dónde dormir.":
			"Rumah kecil beratap dengan kotak bertelur: ayammu punya tempat tidur.",
		"Una hora de micrófono contando tu semana. Una acción semanal.":
			"Satu jam di depan mik menceritakan minggumu. Satu aksi mingguan.",
		"Cepillo, betún y cordones: el próximo partido gasta la mitad.":
			"Sikat, semir, dan tali: di laga berikutnya ausnya cuma separuh.",
		"Con las botas de cantera no hay nada que cuidar.":
			"Sepatu akademi tak ada yang perlu dirawat.",
		"Tus botas ya están listas para el próximo partido.":
			"Sepatumu sudah siap untuk laga berikutnya.",
		"Espera al alta médica para entrenar.": "Tunggu sampai dinyatakan pulih untuk berlatih.",
		"UN JEQUE": "SYEIKH",
		"UN MAGNATE": "TAIPAN",
		"UN FONDO": "DANA",
		"LOS INGRESOS SE DOBLAN": "PENDAPATAN GANDA",
		"COMPRA PARA VENDER": "BELI UNTUK JUAL",
		"Compra el club para ganarlo todo: el doble de presupuesto en GERENCIA, y la directiva te va a pedir mucho más arriba en la tabla.": "Dia membeli klub untuk memenangkan segalanya: anggaran dua kali lipat di MANAJEMEN, dan direksi akan menuntut jauh lebih tinggi di klasemen.",
		"Un fondo de inversión compra el club para revenderlo: algo más de presupuesto, y en su último año vende lo que más vale del vestuario.": "Dana investasi membeli klub untuk dijual kembali: anggaran sedikit lebih besar, dan di tahun terakhirnya menjual pemain paling berharga di ruang ganti.",
		"Te sientan en el vestuario con el director deportivo. El fondo que compró {0} se va este verano y quiere su beneficio: eres lo que más vale del vestuario, y tu traspaso es la plusvalía.": "Kamu dipanggil ke ruang ganti bersama direktur olahraga. Dana yang membeli {0} pergi musim panas ini dan menginginkan keuntungannya: kamu pemain paling berharga di ruang ganti, dan transfermu adalah labanya.",
		"FACHADA": "FASAD",
		"TORRE DE CRISTAL": "MENARA KACA",
		"Tu piso en una torre de vidrio y acero: la ciudad entera en la ventana.": "Apartemenmu di menara kaca dan baja: seluruh kota ada di jendela.",
		"EDIFICIO COLONIAL": "GEDUNG KOLONIAL",
		"Balcones de hierro, arcos y muros de color: el barrio viejo de la ciudad.": "Balkon besi, lengkungan, dan dinding berwarna: kawasan tua kota.",
		"CASA MEDITERRANEA": "RUMAH MEDITERANIA",
		"Muros encalados, teja árabe y buganvilla: huele a mar.": "Dinding berkapur putih, genteng tanah liat, dan bugenvil: beraroma laut.",
		"CABAÑA DE MADERA": "PONDOK KAYU",
		"Troncos, porche con mecedora y chimenea de piedra: el bosque en tu puerta.": "Balok kayu, teras dengan kursi goyang, dan cerobong batu: hutan di depan pintumu.",
		"CUBO DE CRISTAL": "KUBUS KACA",
		"Un cubo de vidrio sobre el jardín: todo luz, nada que esconder.": "Kubus kaca di atas taman: penuh cahaya, tak ada yang disembunyikan.",
		"LOFT DE HORMIGON": "LOFT BETON",
		"Hormigón visto, ventanales de taller y puerta de acero: industrial de verdad.": "Beton ekspos, jendela besar ala bengkel, dan pintu baja: industrial sejati.",
		"MANSION VICTORIANA": "RUMAH VIKTORIAN",
		"Torreón, buhardillas y balaustradas: la casa de las películas.": "Menara kecil, jendela atap, dan pagar balustrade: rumah seperti di film.",
		"VILLA MEDITERRANEA": "VILA PANTAI",
		"Arcos, palmeras y terraza con pérgola: una villa junto al mar.": "Lengkungan, pohon palem, dan teras dengan pergola: vila di tepi laut.",
		"HACIENDA": "HACIENDA",
		"Portón de madera, patio con arcos y campanario: la casa grande del campo.": "Gerbang kayu, halaman berlengkung, dan menara lonceng: rumah besar di pedesaan.",
		"RANCHO": "RANCH",
		"Cercas de madera, granero rojo y establo: tierra tuya hasta donde alcanza la vista.": "Pagar kayu, lumbung merah, dan kandang: tanahmu sejauh mata memandang.",
		"Bono de relación ya estrenado: no vuelve a sumar.": "Bonus hubungan sudah dipakai: tidak bertambah lagi.",
		"¿VOLVER A LA DE FÁBRICA?": "KEMBALI KE BAWAAN?",
		"Se quita sin reembolso y la casa vuelve a la de fábrica. Comprarla otra vez cuesta lo mismo.": "Dilepas tanpa pengembalian uang dan rumah kembali ke bawaan. Membelinya lagi harganya sama.",
		"BUZÓN": "KOTAK SURAT",
		"COLUMPIO": "AYUNAN",
		"UN AFICIONADO": "SEORANG PENGGEMAR",
		"Hay {0} ofertas sobre la mesa. No las dejes enfriar.": "Ada {0} tawaran di atas meja. Jangan biarkan mendingin.",
		"Tu precontrato está firmado. En verano cambias de aires.": "Prakontrakmu sudah ditandatangani. Musim panas nanti kamu pindah.",
		"Te vi el último partido y no me moví del asiento. Gracias.": "Aku melihatmu di laga terakhir dan tak beranjak dari kursi. Terima kasih.",
		"Tu nuevo contrato ya está en vigor: {0} temporadas más con nosotros.": "Kontrak barumu sudah berlaku: {0} musim lagi bersama kami.",
		"Van {0} goles esta temporada. La directiva lo celebra contigo.": "Sudah {0} gol musim ini. Manajemen merayakannya bersamamu.",
		"Gracias por los títulos de la temporada pasada. La vitrina también es tuya.": "Terima kasih atas gelar musim lalu. Lemari piala itu juga milikmu.",
		"Te cortan la rueda a gritos. Esta noche el vestuario no espera a nadie.": "Konferensi pers dipotong dengan teriakan. Malam ini ruang ganti tak menunggu siapa pun.",
		"El confeti del suelo es del otro. Y aun así te toca contestar.": "Konfeti di lantai milik pihak lawan. Tapi kamu tetap harus menjawab.",
		"Se cuela uno a gritar detrás de ti. Un derbi también se gana delante del micro.": "Seseorang menyelinap berteriak di belakangmu. Derbi juga dimenangkan di depan mikrofon.",
		"TOCAR EL PIANO": "MAIN PIANO",
		"OCTAVA {0}": "OKTAF {0}",
		"TOCA LAS TECLAS": "KETUK TUTSNYA",
		"CRUCETA ELIGE · {0} TOCA": "D-PAD PILIH · {0} MAIN",
		"INTERCAMBIADAS": "DITUKAR",
		"AQUÍ": "DI SINI",
		"PONER AQUÍ": "TARUH DI SINI",
		"TRAER AQUÍ": "PINDAH KE SINI",
		"DEJARLA AUTOMÁTICA": "JADIKAN OTOMATIS",
		"PROMETER UN GOL": "JANJIKAN GOL",
		"{0} llega con cinco victorias seguidas en liga. El de la radio local, el único que te espera a la salida, te pregunta si os dan miedo.": "{0} datang dengan lima kemenangan beruntun di liga. Wartawan radio lokal, satu-satunya yang menunggumu di pintu keluar, bertanya apakah kalian takut.",
		"{0} llega con cinco victorias seguidas en liga. La sala de prensa está llena hasta el pasillo, y todas las cámaras te preguntan si os dan miedo.": "{0} datang dengan lima kemenangan beruntun di liga. Ruang pers penuh sampai ke lorong, dan semua kamera bertanya apakah kalian takut.",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Un periodista de la radio local te para en el aparcamiento: ¿es el mejor momento para cruzártelos?": "{0} sudah lima pekan tak menang dan suporternya menuntut pelatih dipecat. Wartawan radio lokal menghentikanmu di parkiran: apakah ini saat terbaik untuk menghadapi mereka?",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Con la sala llena, la primera pregunta es para ti: ¿es el mejor momento para cruzártelos?": "{0} sudah lima pekan tak menang dan suporternya menuntut pelatih dipecat. Dengan ruangan penuh, pertanyaan pertama untukmu: apakah ini saat terbaik untuk menghadapi mereka?",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y el chico de la radio local quiere saber si tú sí.": "{0} punya pelatih baru musim ini: {1}. Belum ada yang tahu gaya mainnya, dan anak muda dari radio lokal ingin tahu apakah kamu tahu.",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y una sala llena de cámaras quiere saber si tú sí.": "{0} punya pelatih baru musim ini: {1}. Belum ada yang tahu gaya mainnya, dan ruangan penuh kamera ingin tahu apakah kamu tahu.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Sólo el fotógrafo del periódico local busca la foto del reencuentro.": "{0}, pelatih yang dulu melatihmu, kini duduk di bangku cadangan {1}. Hanya fotografer koran lokal yang mengincar foto reuni.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Medio país quiere la foto del reencuentro, y las cámaras ya os esperan en el túnel.": "{0}, pelatih yang dulu melatihmu, kini duduk di bangku cadangan {1}. Separuh negeri mengincar foto reuni, dan kamera sudah menunggu kalian di lorong.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. En la radio local te preguntan si podrás con él.": "{1} merekrut {0} musim ini, dan dia sudah jadi salah satu yang terbaik di susunan inti mereka. Di radio lokal kamu ditanya apakah kamu bisa mengatasinya.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Las portadas ya venden el partido como vuestro duelo, y la sala entera te pregunta por él.": "{1} merekrut {0} musim ini, dan dia sudah jadi salah satu yang terbaik di susunan inti mereka. Halaman depan sudah menjual laga ini sebagai duel kalian, dan seisi ruangan bertanya kepadamu tentang dia.",
		"En tu país se ha coronado {0}. Una radio de allí, de las pocas que te siguen, te pregunta si algún día te verán jugar en casa.": "Di negaramu {0} baru dinobatkan jadi juara. Sebuah radio dari sana, salah satu dari sedikit yang mengikutimu, bertanya apakah suatu hari mereka bisa melihatmu main di tanah air.",
		"En tu país se ha coronado {0}, y la prensa de allí abre con tu cara: ¿algún día te verán jugar en casa?": "Di negaramu {0} baru dinobatkan jadi juara, dan pers di sana memasang wajahmu di halaman depan: apakah suatu hari mereka bisa melihatmu main di tanah air?",
		"COPAS": "PIALA",
		"TASACIÓN": "TAKSIRAN",
		"AFICIONADO": "FANS",
		"COLECCIONISTA": "KOLEKTOR",
		"QUEDÁRMELA": "SIMPAN",
		"VENDIDA": "TERJUAL",
		"PERCHERO DE TIENDA": "RAK JERSEY TOKO",
		"Doce playeras en ganchos, como en la tienda: las tuyas y las que cambiaste.": "Dua belas jersey di gantungan, seperti di toko: milikmu dan hasil tukaran.",
		"Te sale a encarar: pica cuando el aro llegue a sus piernas y pásasela por el túnel.": "Dia maju menghadang: ketuk saat lingkaran sampai di kakinya dan lewatkan bola.",
		"Toca la pantalla cuando el aro se cierre": "Ketuk layar saat lingkaran menutup",
		"Pulsa cuando el aro se cierre": "Tekan saat lingkaran menutup",
		"SUBASTAR": "LELANG",
		"SALIDA": "AWAL",
		"PUJA": "BID",
		"PARA EL {0}": "UNTUK {0}",
		"SE FUE": "LEWAT",
		"ADJUDICAR": "KETOK",
		"COBRAR": "TERIMA",
		"¡VENDIDA!": "TERJUAL!",
		"DESIERTA": "BATAL",
		"DUDA": "HMM",
		"${0} / PARTIDO": "${0} / LAGA",
		"+${0} POR {1}": "+${0} PER {1}",
		"INDEMNIZACIÓN ${0}": "DENDA ${0}",
		"ROMPISTE CON {0}": "PUTUS DARI {0}",
		"URNA DE PLAYERAS": "LEMARI JERSEY",
		"MURAL DE PLAYERAS": "DINDING JERSEY",
		"VITRINA DE ESPECIALES": "LEMARI JERSEY LANGKA",
		"Tres playeras tras el cristal, con luz de museo.": "Tiga jersey di balik kaca, dengan cahaya museum.",
		"Seis playeras enmarcadas en dos filas: tu salón de la fama.": "Enam jersey berbingkai dalam dua baris: hall of fame-mu.",
		"Se llena sola con tus cambiadas más raras y valiosas.": "Terisi sendiri dengan jersey tukaran paling langka milikmu.",
		"CHIHUAHUA": "CHIHUAHUA",
		"SALCHICHA": "DACHSHUND",
		"GOLDEN": "GOLDEN",
		"HUSKY": "HUSKY",
		"GATO NEGRO": "KUCING HITAM",
		"GATO GRIS": "KUCING ABU",
		"SIAMES": "SIAM",
		"PERSA": "PERSIA",
		"Cabe en una mano y ladra como uno grande.": "Muat di satu tangan, tapi menggonggong seperti anjing besar.",
		"Largo, bajito y siempre detrás de ti.": "Panjang, pendek, dan selalu di belakangmu.",
		"Dorado, bonachón y el favorito del vestuario.": "Keemasan, baik hati, dan favorit ruang ganti.",
		"Ojos de hielo y energía para dar y regalar.": "Mata sebiru es dan energi yang tak ada habisnya.",
		"Dicen que da mala suerte... al rival.": "Katanya membawa sial... untuk lawan.",
		"Tranquilo, elegante y dueño del sofá.": "Tenang, anggun, dan penguasa sofa.",
		"Ojos azules y opinión sobre todo.": "Mata biru dan punya pendapat soal apa saja.",
		"Una nube blanca que duerme donde quiere.": "Awan putih yang tidur di mana saja ia mau.",
		"LUEGO": "NANTI",
		"AL VECINDARIO": "KE JALAN",
		"EL COMUNICADO": "PERNYATAAN",
		"Tus palabras siguen dando vueltas y el club espera un comunicado antes del próximo partido.": "Kata-katamu masih ramai dibicarakan dan klub menunggu pernyataan sebelum laga berikutnya.",
		"Tu roja dejó al equipo con diez. El club te pide un comunicado antes del próximo partido.": "Kartu merahmu membuat tim bermain dengan sepuluh orang. Klub meminta pernyataan sebelum laga berikutnya.",
		"Tu festejo le costó una multa al club y la polémica no se apaga. Esperan tu comunicado.": "Selebrasimu membuat klub kena denda dan polemiknya belum reda. Mereka menunggu pernyataanmu.",
		"PEDIR PERDÓN": "MINTA MAAF",
		"SOSTENERLO": "BERTAHAN",
		"HIERBAS": "HERBA",
		"LECHUGA": "SELADA",
		"JITOMATE": "TOMAT",
		"CHILES": "CABAI",
		"FRESAS": "STROBERI",
		"MAÍZ": "JAGUNG",
		"AGUACATE": "ALPUKAT",
		"AGAVE": "AGAVE",
	},





	"match_strip": {
		"ULTIMO": "LALU",
		"PROXIMO": "BERIKUT",
		"DEBUT": "DEBUT",
		"FIN": "USAI",
		"HOY": "KINI",
		"DERBI": "DERBY",
		"CASA": "HOME",
		"FUERA": "AWAY",



		"{0} DERBIS · {1}": "{0} DERBY · {1}",
		"{0} DERBIS SIN GANARLE": "{0} DERBY TANPA MENANG",
		"{0} DERBIS GANADOS SEGUIDOS": "MENANG {0} DERBY BERUNTUN",
		"NUNCA LE HAS GANADO": "TAK PERNAH MENANG",
		"NO LE GANAS DESDE HACE {0} AÑOS": "{0} TAHUN TANPA MENANG",


		"G": "M",
		"E": "S",
		"P": "K",


		"LIGA": "LIGA",
		"COPA": "PIALA",
		"CLASIF": "KUALIF",
		"MUNDIAL": "DUNIA",

		"J{0}": "P{0}",
		"GRUPO {0}": "GRUP {0}",

		"LIGA {0}": "LIGA {0}",



		"DIECISEISAVOS": "32 BESAR",
		"OCTAVOS": "16 BESAR",
		"CUARTOS": "8 BESAR",
		"SEMIFINAL": "SEMIFINAL",



		"rondaIDA": "LEG 1",
		"rondaVUELTA": "LEG 2",
		"FINAL": "FINAL",
		"PRIMERA RONDA": "BABAK 1",
		"SEGUNDA RONDA": "BABAK 2",
		"TERCERA RONDA": "BABAK 3",
		"CUARTA RONDA": "BABAK 4",
		"QUINTA RONDA": "BABAK 5",
		"SEXTA RONDA": "BABAK 6",
		"SÉPTIMA RONDA": "BABAK 7",
		"OCTAVA RONDA": "BABAK 8",
		"TREINTAIDOSAVOS": "64 BESAR",
		"FASE DE GRUPOS": "FASE GRUP",
	},





















	"content": {
		"MEJOR DEL MUNDIAL": "MVP KEJ. DUNIA",
		"MEJOR DE LA COPA CONTINENTAL": "TERBAIK PIALA BENUA",
		"PREMIO CONTINENTAL": "PENGHARGAAN BENUA",
		"El mundo entero miraba. Y el mejor fuiste tú.": "Seluruh dunia menonton. Dan yang terbaik adalah kamu.",
		"Tu continente tuvo un dueño este verano.": "Benuamu punya penguasa musim panas ini.",
		"Ser el Mejor del Mundial con tu selección.": "Jadi pemain terbaik Kejuaraan Dunia bersama timnasmu.",
		"PREMIO DEL MUNDO": "ANUGERAH DUNIA",
		"CHICO DE ORO": "ANAK EMAS",
		"Premio del Mundo": "Anugerah Dunia",
		"Chico de Oro": "Anak Emas",
		"El Mejor del Planeta": "Terbaik di Planet Ini",
		"Ganar el Chico de Oro, la promesa del año.": "Raih Anak Emas, bakat muda terbaik tahun ini.",
		"Ganar el Premio del Mundo.": "Raih Anugerah Dunia.",
		"GOL DEL AÑO": "GOL TERBAIK",
		"Gol del Año": "Gol Terbaik Tahun Ini",
		"GOL OLÍMPICO": "GOL OLIMPIK",
		"BAJO LA BARRERA": "BAWAH PAGAR",
		"DESDE LEJOS": "JARAK JAUH",
		"CON ROSCA": "BERPUTAR",
		"CHILENA": "SALTO",
		"VOLEA": "VOLI",
		"PANENKA": "PANENKA",
		"DE FALTA": "TENDANGAN BEBAS",
		"DE CABEZA": "SUNDULAN",
		"Obra de Arte": "Mahakarya",
		"Ganar el Gol del Año.": "Menangkan Gol Terbaik Tahun Ini.",
		"EL PASILLO": "LORONG",
		"Tu gol 100, 250 o 500 con el club: tus compañeros se abren en dos filas aplaudiendo y tú cruzas por el medio saludando.": "Gol ke-100, 250, atau 500-mu untuk klub: rekan setim berbaris dua lajur sambil bertepuk tangan, dan kamu lewat di tengah sambil melambai.",
		"EL MARCADOR SIGUE PUESTO": "PAPAN SKOR MASIH MENYALA",
		"Tres horas después del pitido. Nadie ha venido a apagarlo.": "Tiga jam setelah peluit akhir. Tak ada yang datang mematikannya.",
		"Tres horas después del pitido. En su casa nadie ha venido a apagarlo.": "Tiga jam setelah peluit akhir. Di kandang mereka tak ada yang datang mematikannya.",
		"TE AGUANTAS LA MIRADA": "KAMU TAHAN TATAP DIRI",
		"NO TE AGUANTAS LA MIRADA": "TAK TAHAN TATAP DIRI",
		"El de enfrente durmió bien. Es el mismo que juega el jueves.": "Yang di seberang tidur nyenyak. Dia yang sama yang bermain hari Kamis.",
		"El de enfrente no durmió. Y es el que juega el jueves.": "Yang di seberang tidak tidur. Dan dia yang bermain hari Kamis.",
		"VEINTE MINUTOS DESPUÉS": "20 MENIT KEMUDIAN",
		"el marcador": "papan skor",
		"minutos": "menit",
		"El escudo que amaneció clavado en tu hueco lo pisó media plantilla al salir.": "Lambang klub yang terpasang di lokermu pagi tadi diinjak separuh skuad saat keluar.",
		"Nadie descolgó la hoja del rival. Tu camiseta se quedó donde la tiraste.": "Tak ada yang menurunkan lembar lawan. Jerseymu tetap di tempat kamu melemparnya.",










		"SE ABRE EL MERCADO": "BURSA DIBUKA",
		"LOS QUE QUIERE": "YANG DIINCAR",
		"LOS QUE SUELTA": "YANG DILEPAS",
		"MERCADO DE VERANO": "BURSA MUSIM PANAS",
		"El club no busca a nadie": "Klub tidak mengincar siapa pun",
		"El club no suelta a nadie": "Klub tidak melepas siapa pun",
		"PARA CEDER": "DIPINJAMKAN",
		"INTOCABLES": "DILINDUNGI",
		"Nadie en venta": "Tak ada yang dijual",
		"Nadie para ceder": "Tak ada yang dipinjamkan",
		"Nadie es intocable": "Tak ada yang dilindungi",
		"TU MEDIA": "OVRMU",
		"TU VALOR": "NILAIMU",
		"ENTRAN": "MASUK",
		"SALEN": "PERGI",
		"CEDIDO": "PINJAM",
		"LIBRE": "BEBAS",
		"Nadie ha visto todavía lo que haces": "Belum ada yang melihat kemampuanmu",
		"La temporada que hiciste te pone por encima": "Musim yang kamu jalani menempatkanmu di atas yang lain",
		"Llevas años aquí y eso pesa": "Kamu sudah bertahun-tahun di sini dan itu berarti",
		"El once no se entiende sin ti": "Tim inti tak masuk akal tanpamu",
		"La temporada que hiciste no te defiende": "Musim yang kamu jalani tidak membelamu",
		"Casi no juegas, y eso se nota en la lista": "Kamu nyaris tak main, dan daftar ini menunjukkannya",
		"El club se hundió y hay que hacer caja": "Klub terpuruk dan harus cari dana",
		"El club salvó el año y no necesita vender": "Klub menyelamatkan musim dan tak perlu menjual",
		"Lo que vales hoy es dinero que el club mira": "Nilaimu hari ini adalah uang yang dilirik klub",


		"Un año. Lo que le regales dice si la conociste.":
			"Satu tahun. Hadiahmu menunjukkan apakah kamu mengenalnya.",
		"{0} años. Lo que le regales dice si la conociste.":
			"{0} tahun. Hadiahmu menunjukkan apakah kamu mengenalnya.",
		"Poso de los años: {0}%":
			"Ikatan bertahun-tahun: {0}%",
		"Se te pasó la fecha. Ella no dijo nada.":
			"Kamu lupa tanggalnya. Dia tidak bilang apa-apa.",
		"Se quedó callada un momento. Era exactamente eso.":
			"Dia terdiam sejenak. Persis itu yang dia mau.",
		"Poso de los años: {0}% — las malas rachas pesan menos.":
			"Ikatan bertahun-tahun: {0}% — masa buruk jadi tak seberat dulu.",
		"Dio las gracias y lo dejó en la mesa del recibidor.":
			"Dia bilang terima kasih dan menaruhnya di meja lorong.",
		"Un año más, y sigues sin saber quién es.":
			"Setahun lagi, dan kamu masih tak tahu siapa dia.",
		"Un fin de semana los dos solos, sin teléfono":
			"Akhir pekan berdua saja, tanpa ponsel",
		"Una fiesta con toda la gente que quiere":
			"Pesta dengan semua orang yang dia sayangi",
		"Poner su nombre en algo tuyo: el coche, la casa, la cuenta": "Mencantumkan namanya di sesuatu milikmu: mobil, rumah, rekening",
		"Algo que compraste con prisa y sin pensar":
			"Sesuatu yang kamu beli terburu-buru tanpa berpikir",
		"Un billete abierto para que se vaya donde quiera":
			"Tiket terbuka supaya dia bisa pergi ke mana pun",
		"Repetir exactamente la primera cena, mesa incluida":
			"Mengulang makan malam pertama persis, termasuk mejanya",
		"UN AÑO MÁS":
			"SETAHUN LAGI",
		"Hoy hace justo un año de aquello, y {0} no lo ha mencionado"
		+ " ni una vez en toda la semana. Eso no significa que se le"
		+ " haya olvidado.":
			"Hari ini tepat setahun sejak itu, dan {0} tidak menyinggungnya sekali pun seminggu ini. Itu bukan berarti dia lupa.",
		"PREPARARLE ALGO":
			"SIAPKAN SESUATU",
		"DEJARLO PASAR":
			"BIARKAN SAJA",



		"Le queda una noche. Aciertos: {0} de {1}":
			"Tinggal satu malam lagi. Benar sejauh ini: {0} dari {1}",
		"Lo que digas ahora depende de quién es ella.":
			"Apa yang kamu katakan sekarang tergantung siapa dia.",
		"Deshizo una maleta. Sólo una, y sin decir nada.":
			"Dia membongkar satu koper. Hanya satu, tanpa berkata apa-apa.",
		"Se queda. No es lo de antes, pero se queda.":
			"Dia bertahan. Tak seperti dulu, tapi dia bertahan.",
		"Cerró la puerta despacio, que es peor que un portazo.":
			"Dia menutup pintu pelan-pelan, yang lebih buruk daripada membantingnya.",
		"Se acabó.":
			"Sudah berakhir.",


		"EL CUARTO DE INVITADOS":
			"KAMAR TAMU",
		"Llevas tres noches durmiendo solo. {0} dice que es por la espalda, y en la"
		+ " cama de al lado hay una almohada que no estaba.":
			"Sudah tiga malam kamu tidur sendiri. {0} bilang karena punggungnya, dan di ranjang sebelah ada bantal yang tadinya tak ada.",
		"PREGUNTARLE QUÉ PASA":
			"TANYA ADA APA",
		"SERÁ LA ESPALDA":
			"MUNGKIN PUNGGUNG",
		"NO PREGUNTÓ POR EL PARTIDO":
			"TAK TANYA SOAL LAGA",
		"Entras, dejas la bolsa, y {0} sigue con lo suyo. Antes preguntaba antes de que"
		+ " te quitaras el abrigo. Hoy no, y ayer tampoco.":
			"Kamu masuk, menaruh tas, dan {0} terus mengerjakan urusannya. Dulu dia bertanya sebelum mantelmu lepas. Hari ini tidak, kemarin juga tidak.",
		"APAGAR EL TELÉFONO Y SENTARTE":
			"MATIKAN PONSEL, DUDUK",
		"SUBIR A DUCHARTE":
			"MANDI DULU",
		"LA MALETA PEQUEÑA":
			"KOPER KECIL",
		"La maleta de mano lleva dos semanas junto a la puerta, hecha. {0} no la ha"
		+ " deshecho ni una vez, y tampoco se ha ido.":
			"Tas kabin itu sudah dua minggu di dekat pintu, siap dibawa. {0} tak pernah membongkarnya, dan dia juga belum pergi.",
		"PEDIR PERMISO Y LLEVÁRTELA":
			"IZIN LALU BAWA DIA",
		"NO ABRIR ESE TEMA":
			"JANGAN BAHAS",
		"PASAR LA TARDE JUNTOS":
			"SORE BERSAMA",
		"Sin teléfono y sin prisa. Se nota más de lo que parece.":
			"Tanpa ponsel, tanpa terburu-buru. Dampaknya lebih besar dari kelihatannya.",
		"En casa se descansa: +{0} de energía cada jornada.":
			"Di rumah kamu istirahat dengan baik: +{0} energi tiap pekan.",
		"Así no se duerme: {0} de energía cada jornada.":
			"Tidur begini tak akan nyenyak: {0} energi tiap pekan.",
		"DEJARLA":
			"PUTUS",
		"PEDIR EL DIVORCIO":
			"AJUKAN CERAI",
		"¿DIVORCIARTE DE {0}?":
			"CERAIKAN {0}?",
		"¿DEJAR A {0}?":
			"PUTUSKAN {0}?",
		"El reparto se paga igual que si lo pidiera ella: ${0}.":
			"Pembagian dibayar sama seperti kalau dia yang meminta: ${0}.",
		"La separación de bienes que firmasteis sigue valiendo. Es todo lo que te"
		+ " protege.":
			"Perjanjian pisah harta yang kalian tandatangani masih berlaku. Hanya itu yang melindungimu.",
		"No firmasteis nada, así que entra todo: el dinero y lo que tienes puesto.":
			"Kalian tak menandatangani apa-apa, jadi semuanya ikut: uang dan apa yang kamu miliki.",
		"No cuesta nada. Ni dinero ni prensa.":
			"Tidak ada biayanya. Tak ada uang, tak ada berita.",
		"Y no te va a presentar nadie a nadie en una buena temporada. Estas cosas se"
		+ " cuentan.":
			"Dan dalam waktu lama tak akan ada yang memperkenalkanmu pada siapa pun. Hal begini cepat menyebar.",
		"SÍ, SE ACABÓ":
			"YA, SELESAI",
		"SE LLEVA ${0}":
			"DIA AMBIL ${0}",
		"«Me quedo. Los viajes que pueda perdonar, los pierdo.»":
			"«Aku tetap di sini. Perjalanan yang bisa kulewatkan, kulewatkan.»",
		"«No te voy a pedir que esperes. Te pido que elijas tú.»":
			"«Aku tak akan memintamu menunggu. Aku memintamu memilih.»",
		"«Esto se arregla con tiempo. Dame la temporada.»":
			"«Ini bisa diperbaiki dengan waktu. Beri aku semusim.»",
		"«Dime qué necesitas y lo hago mañana.»":
			"«Bilang apa yang kamu butuhkan dan besok kulakukan.»",
		"«No hace falta que digas nada. Me siento y te escucho.»":
			"«Tak perlu bicara apa-apa. Aku duduk dan mendengarkan.»",
		"«Piensa en todo lo que hemos hecho.»":
			"«Pikirkan semua yang sudah kita lalui.»",
		"«Si te vas lo entiendo. Pero prefiero que te quedes.»":
			"«Kalau kamu pergi, aku mengerti. Tapi aku lebih suka kamu tinggal.»",
		"«Mañana no hay entrenamiento. Vámonos donde quieras.»":
			"«Besok tak ada latihan. Ayo pergi ke mana pun kamu mau.»",
		"«Ya está, ¿no? Pues ya está.»":
			"«Sudah begitu saja, kan? Ya sudah.»",
		"Se sienta en el brazo del sofá, sin quitarse el abrigo.":
			"Dia duduk di lengan sofa tanpa melepas mantel.",
		"No ha dicho que no. Sigue ahí.":
			"Dia belum bilang tidak. Dia masih di sana.",
		"Mira las maletas y luego te mira a ti.":
			"Dia menatap koper-koper itu, lalu menatapmu.",
		"Las maletas de {0} llevan dos días en el recibidor y esta"
		+ " vez no las está deshaciendo. Queda una conversación, y es"
		+ " esta noche.":
			"Koper-koper {0} sudah dua hari di lorong dan kali ini dia tidak membongkarnya. Tinggal satu percakapan, dan malam ini.",
		"HABLAR CON ELLA":
			"AJAK BICARA",
		"DEJAR QUE SE VAYA":
			"BIARKAN PERGI",


		"TU EX HABLA":
			"MANTAN BICARA",
		"Una revista le ha pagado a {1} por contar cómo eras"
		+ " entonces. No miente en nada, y eso es lo peor. {0} lo ha"
		+ " leído entero.":
			"Sebuah majalah membayar {1} untuk menceritakan seperti apa kamu dulu. Dia tak berbohong sedikit pun, dan itu yang terburuk. {0} sudah membacanya sampai habis.",
		"NO CONTESTAR":
			"DIAM SAJA",
		"DESMENTIRLO EN PÚBLICO":
			"BANTAH TERBUKA",
		"ESTABA EN LA MISMA MESA":
			"DIA DI MEJA SEBELAH",
		"Cena de gala, y en la mesa de al lado está {1}. {0} la ha"
		+ " reconocido antes de sentarse y no ha soltado tu mano en toda"
		+ " la noche.":
			"Makan malam gala, dan {1} duduk di meja sebelah. {0} mengenalinya sebelum duduk dan tak melepas tanganmu sepanjang malam.",
		"SALUDARLA Y VOLVER":
			"SAPA LALU KEMBALI",
		"HACER COMO QUE NO":
			"PURA-PURA TAK LIHAT",




		"LA CENA DEL VESTUARIO":
			"MAKAN MALAM TIM",
		"El grupo sale a cenar y alguien lo deja caer con una"
		+ " sonrisa: «esta vez, solos». {0} ya se estaba arreglando.":
			"Rekan setim mau keluar makan malam dan seseorang melontarkannya sambil tersenyum: «kali ini kita saja». {0} sudah bersiap.",
		"LLEVARLA IGUAL":
			"TETAP AJAK DIA",
		"LA ENTRADA DEL PALCO":
			"TIKET VIP",
		"El club te ofrece una butaca de palco para {0}. Desde ahí se"
		+ " ve el partido; desde la grada de siempre se ve a la gente.":
			"Klub menawarkan kursi boks VIP untuk {0}. Dari sana kamu melihat laga; dari tribun biasa kamu melihat orang-orang.",
		"AL PALCO":
			"KE VIP",
		"CON LA GRADA":
			"DI TRIBUN",
		"LA QUIEREN EN LA CAMPAÑA":
			"DIA DIINCAR IKLAN",
		"La marca ha visto una foto vuestra y quiere a {0} en el"
		+ " anuncio. Pagan por los dos y no aceptan un no fácil.":
			"Sponsor melihat foto kalian berdua dan menginginkan {0} di iklan. Mereka membayar untuk kalian berdua dan tak mudah menerima penolakan.",
		"QUE SALGA ELLA":
			"DIA IKUT",
		"ELLA NO SE VENDE":
			"DIA TAK DIJUAL",
		"LA CENA DE TU AGENTE":
			"MAKAN MALAM AGEN",
		"Tu agente ha montado una cena con gente que decide cosas. Es"
		+ " esta noche, y esta noche ya la teníais ocupada.":
			"Agenmu mengatur makan malam dengan orang-orang pengambil keputusan. Malam ini, dan malam ini kalian sudah punya rencana.",
		"IR A LA CENA":
			"IKUT MAKAN",
		"LO QUE TENÍAIS":
			"RENCANA KALIAN",
		"EL VÍDEO DEL MÍSTER":
			"VIDEO PELATIH",
		"El técnico ha mandado dos horas de vídeo para esta noche."
		+ " {0} lleva toda la semana esperando esta noche.":
			"Pelatih mengirim dua jam video untuk malam ini. {0} sudah menunggu malam ini sepanjang minggu.",
		"VERLO ENTERO":
			"LIHAT SEMUA",
		"MAÑANA LO VES":
			"BESOK SAJA",
		"OS QUIEREN A LOS DOS":
			"MEREKA MAU KALIAN",
		"Un programa quiere una entrevista de pareja. Sería la"
		+ " primera vez que {0} habla delante de una cámara.":
			"Sebuah acara ingin wawancara pasangan. Ini akan jadi pertama kalinya {0} bicara di depan kamera.",
		"IR JUNTOS":
			"BERDUA",
		"IR TÚ SOLO":
			"SENDIRIAN",
		"EL PLAN DE NO HACER NADA":
			"RENCANA REBAHAN",
		"Hay tres sitios donde deberías dejarte ver este fin de"
		+ " semana. {0} ha comprado comida para dos y no piensa moverse"
		+ " de casa.":
			"Akhir pekan ini ada tiga tempat yang sebaiknya kamu datangi biar terlihat. {0} sudah membeli makanan untuk dua orang dan tak berniat keluar rumah.",
		"QUEDARTE CON ELLA":
			"TEMANI DIA",
		"DEJARTE VER":
			"TAMPIL",
		"ELLA CREE QUE VALES MÁS":
			"MENURUTNYA KAMU LAYAK LEBIH",
		"{0} ha leído lo que cobra el que juega en tu puesto en otro"
		+ " sitio. «Pide lo tuyo o pídelo yo por ti.»":
			"{0} membaca berapa gaji pemain di posisimu di tempat lain. «Minta yang pantas untukmu, atau aku yang minta untukmu.»",
		"PEDIR MÁS AL CLUB":
			"MINTA LEBIH",
		"ESTOY BIEN AQUÍ":
			"AKU BETAH",
		"LA FOTO DEL PATROCINIO":
			"FOTO SPONSOR",
		"En la foto de la marca sales con una modelo a medio metro."
		+ " {0} la ha visto antes que tú y no ha dicho nada, que es"
		+ " peor.":
			"Di foto sponsor ada model setengah meter darimu. {0} melihatnya sebelum kamu dan tak bilang apa-apa, yang lebih buruk.",
		"HABLARLO ESA NOCHE":
			"BICARAKAN MALAM ITU",
		"ES TRABAJO, SE LE PASA":
			"INI KERJAAN, NANTI REDA",
		"SE FUE SIN AVISAR":
			"PERGI TANPA PAMIT",
		"{0} se ha ido diez días con sus amigas y te has enterado por"
		+ " una foto. No es una prueba: es que no se le ocurrió que"
		+ " hubiera que pedir permiso.":
			"{0} pergi sepuluh hari bersama teman-temannya dan kamu tahu dari sebuah foto. Ini bukan ujian: dia tak terpikir harus minta izin.",
		"DESEARLE BUEN VIAJE":
			"SELAMAT JALAN",
		"PEDIRLE EXPLICACIONES":
			"MINTA PENJELASAN",
		"ELLA YA ERA DE AQUÍ":
			"DIA SUDAH BAGIAN KITA",
		"{0} tiene su sitio en la grada desde antes de conocerte y no"
		+ " piensa cambiarlo por un palco. Hoy le toca cantar contigo"
		+ " abajo.":
			"{0} punya tempat di tribun sejak sebelum mengenalmu dan tak mau menukarnya dengan boks VIP. Hari ini gilirannya bernyanyi untukmu dari bawah.",
		"SALUDARLA AL GOL":
			"SAPA DIA SAAT GOL",
		"ESO NO SE HACE":
			"ITU TAK PANTAS",
		"LA CAZARON EN LA PUERTA":
			"DIA DIPERGOKI DI PINTU",
		"Alguien vendió una foto de {0} saliendo de tu casa. No sale"
		+ " mal; sale sin querer salir, que para ella es lo mismo.":
			"Seseorang menjual foto {0} keluar dari rumahmu. Fotonya tidak jelek; dia tampak tidak ingin difoto, dan bagi dia itu sama saja.",
		"PARAR ESO COMO SEA":
			"HENTIKAN SEGERA",
		"SE OLVIDA EN DOS DÍAS":
			"REDA DALAM DUA HARI",
		"LA SEMANA MALA":
			"MINGGU BURUK",
		"Otra derrota, y en casa no se habla de otra"
		+ " cosa. {0} no te pregunta: te pone las botas en la puerta y"
		+ " se calla.":
			"Kalah lagi, dan di rumah tak ada obrolan lain. {0} tidak bertanya: dia menaruh sepatu bolamu di dekat pintu lalu diam.",
		"SALIR A CORRER CON ELLA":
			"LARI BERSAMA DIA",

		"TU AGENTE · «llámame, es importante»":
			"AGENMU · «telepon aku, penting»",
		"EL MÍSTER · vídeo del rival, para hoy":
			"PELATIH · video lawan, untuk hari ini",
		"TU MARCA · quieren una foto mañana":
			"SPONSORMU · mau foto besok",




		"Le gusta la vida tranquila. No pide focos, pide que estés.":
			"Dia suka hidup tenang. Tak minta sorotan, minta kamu ada di sisinya.",
		"Vive de noche. Contigo o sin ti, y eso es justo el problema.":
			"Hidupnya di malam hari. Denganmu atau tanpamu, dan itulah masalahnya.",
		"Tiene lo suyo y va en serio. Te quiere arriba, y lo dice.":
			"Dia punya kariernya sendiri dan serius. Dia ingin kamu di puncak, dan bilang terang-terangan.",
		"Te quiere entero. Cada foto con otra le cuesta una noche.":
			"Dia ingin kamu seutuhnya. Setiap fotomu bersama wanita lain membuatnya tak bisa tidur semalaman.",
		"No te necesita, te eligió. Aguanta todo menos que la des por"
		+ " hecha.":
			"Dia tak butuh kamu, dia memilihmu. Dia tahan apa saja kecuali disepelekan.",
		"Iba al estadio antes de conocerte. Los domingos son"
		+ " sagrados.":
			"Dia ke stadion sebelum mengenalmu. Hari Minggu itu sakral.",
		"Odia la prensa. Contigo en privado lo da todo; en público,"
		+ " nada.":
			"Dia benci pers. Berdua denganmu dia memberi segalanya; di depan umum, tidak sama sekali.",
		"Entiende el oficio: entrena, viaja, aguanta. Y espera lo"
		+ " mismo.":
			"Dia paham pekerjaanmu: latihan, bepergian, bertahan. Dan mengharapkan hal yang sama.",

		"Trabaja en algo que nunca termina de explicar. Invita ella, y no deja discutirlo.":
			"Dia bekerja di bidang yang tak pernah benar-benar dia jelaskan. Dia yang traktir, dan tak mau dibantah.",
		"LA CUENTA YA ESTABA PAGADA":
			"TAGIHAN SUDAH LUNAS",
		"{0} ha pagado la cena, el hotel y un coche nuevo para tu madre, y no entiende qué te molesta. «Tengo más de lo que me voy a gastar nunca. Déjame.»":
			"{0} sudah membayar makan malam, hotel, dan mobil baru untuk ibumu, dan tak mengerti apa yang mengganggumu. «Hartaku lebih banyak dari yang bisa kuhabiskan. Biarkan aku.»",
		"DEJAR QUE PAGUE":
			"DIA YANG BAYAR",
		"LA PRÓXIMA PAGO YO":
			"GANTIAN AKU BAYAR",
		"REGALO DE ELLA":
			"HADIAH DARINYA",
		"FESTEJOS":
			"PERAYAAN",
		"FALTAN {0}": "KURANG {0}",
		"COMPLETA":
			"LENGKAP",
		"continenteEUROPA": "EROPA",
		"continenteSUDAMÉRICA": "AMERIKA SEL.",
		"continenteNORTEAMÉRICA": "AMERIKA UT.",
		"continenteÁFRICA": "AFRIKA",
		"continenteASIA": "ASIA",
		"continenteOCEANÍA": "OSEANIA",
		"RIVALES":
			"LAWAN",
		"VENCIDO":
			"TAKLUK",
		"Cada rival al que le ganes un partido queda apuntado aquí para siempre, en todas tus carreras.":
			"Setiap lawan yang kamu kalahkan dalam laga tercatat di sini selamanya, di semua kariermu.",
		"PAREJAS":
			"PASANGAN",
		"Las mujeres de tu vida. Cada una destapa su medalla el día que se muda contigo, te casas con ella o se acaba.":
			"Para wanita dalam hidupmu. Masing-masing membuka medalinya saat dia pindah tinggal bersamamu, saat kamu menikahinya, atau saat hubungan berakhir.",
		"Pareja por descubrir. Sabrás quién es el día que se mude contigo.":
			"Pasangan belum terungkap. Kamu akan tahu siapa dia saat dia pindah tinggal bersamamu.",
		"La última: {0}":
			"Yang terakhir: {0}",
		"LA CENA DEL CLUB":
			"MAKAN MALAM KLUB",
		"EL BAR":
			"BAR",
		"LA GALERÍA":
			"GALERI",
		"LA PUERTA DEL ESTADIO":
			"GERBANG STADION",
		"DÓNDE LA CONOCES":
			"DI MANA BERTEMU",
		"GASTO EN CASA":
			"BIAYA RUMAH",
		"DESCANSO EN CASA":
			"ISTIRAHAT RUMAH",
		"SE ENFADA":
			"MARAH",
		"SE CONTENTA":
			"SENANG",
		"PIDE DINERO":
			"MINTA UANG",
		"EL {0} DEL SUELDO":
			"{0} DARI GAJI",
		"NUNCA":
			"TIDAK",
		"PIDE EL DIVORCIO":
			"MINTA CERAI",
		"PUEDE HACERLO":
			"DIA BISA",
		"TU CASA O TU SUELDO":
			"RUMAH ATAU GAJIMU",
		"EL {0} DE LO TUYO":
			"{0} DARI MILIKMU",
		"SE LLEVA AL IRSE":
			"DIBAWA SAAT PERGI",
		"TE REGALA":
			"MEMBERIMU",
		"HASTA EL {0} DEL SUELDO":
			"HINGGA {0} DARI GAJI",
		"SE MUDA CONTIGO":
			"PINDAH DENGANMU",
		"PRONTO":
			"SEGERA",
		"SIN PRISA":
			"SANTAI",
		"BAJA SOLA DESDE":
			"MEROSOT DARI",
		"{0} · RÁPIDO":
			"{0} · CEPAT",
		"{0} · DESPACIO":
			"{0} · PELAN",
		"{0} · APENAS":
			"{0} · TIPIS",
		"VIVIR CON ELLA":
			"SERUMAH",
		"INVITA ELLA":
			"DIA TRAKTIR",
		"· invita ella":
			"· dia traktir",
		"La boda la paga ella: ${0}.":
			"Dia yang membayar pernikahan: ${0}.",
		"Boda pagada por ella: ${0}.":
			"Pernikahan dibayar dia: ${0}.",
		"LA TASACIÓN":
			"PENILAIAN",
		"Ha venido un señor con una carpeta a medir el salón y a fotografiar la vitrina. {0} dice que es por el seguro. Nadie ha cambiado el seguro.":
			"Seorang pria membawa map datang mengukur ruang tamu dan memotret lemari trofi. {0} bilang itu untuk asuransi. Tak ada yang mengubah asuransi.",
		"SUBIRLE LA ASIGNACIÓN":
			"NAIKKAN JATAHNYA",
		"NO LE DOY MÁS":
			"TAK ADA TAMBAHAN",
		"CUANDO LE CONVENGA":
			"SAAT DIA MAU",
		"TE CUESTA MÁS":
			"LEBIH MAHAL",
		"TE SUMA MÁS":
			"LEBIH UNTUNG",
		"TE CUESTA MENOS":
			"LEBIH MURAH",
		"TE SUMA MENOS":
			"KURANG UNTUNG",

		"LAS ESCRITURAS":
			"SERTIFIKAT",
		"Tu agente trae las escrituras de la casa y una sola pregunta: a nombre de quién. {0} ya ha preguntado dos veces si hay que firmar algo.":
			"Agenmu membawa sertifikat rumah dan satu pertanyaan: atas nama siapa. {0} sudah dua kali bertanya apakah ada yang perlu ditandatangani.",
		"QUE DECIDA ELLA":
			"SERAHKAN KE DIA",
		"Tu agente pone las escrituras sobre la mesa y pregunta sin mirarte: «¿a nombre de quién?».":
			"Agenmu menaruh sertifikat di meja dan bertanya tanpa menatapmu: «atas nama siapa?».",
		"MANTÉN · A NOMBRE DE MI MADRE":
			"TAHAN · ATAS NAMA IBUKU",
		"MANTÉN · A SU NOMBRE":
			"TAHAN · ATAS NAMANYA",
		"Tu madre firmó sin gafas y sin preguntar. Al salir te dijo: «Yo no entiendo de papeles, hijo. Pero de esa casa no me saca nadie».":
			"Ibumu menandatangani tanpa kacamata dan tanpa bertanya. Saat keluar dia berkata: «Ibu tak paham soal surat, Nak. Tapi dari rumah itu tak ada yang bisa mengusir Ibu».",
		"Ella se enteró esa noche y pidió más asignación: el {0} de tu sueldo.":
			"Dia tahu malam itu dan minta jatah lebih besar: {0} dari gajimu.",
		"Leyó su nombre dos veces y sonrió. Esa noche no habló de la asignación.":
			"Dia membaca namanya dua kali lalu tersenyum. Malam itu dia tak menyinggung jatah.",
		"Su abogado pidió la casa. Las escrituras dicen otra cosa.":
			"Pengacaranya minta rumah. Sertifikat bilang lain.",
		"La casa está a nombre de tu madre.":
			"Rumah ini atas nama ibumu.",
		"FIRMAR Y QUE SE VAYA":
			"TEKEN, BIARKAN PERGI",
		"Su abogado trae las escrituras con su nombre. El tuyo consigue cambiarlas por la mitad de tu cuenta.":
			"Pengacaranya membawa sertifikat atas namanya. Pengacaramu berhasil menukarnya dengan separuh rekeningmu.",
		"La casa y tu ficha se quedan.":
			"Rumah dan gajimu tetap di tanganmu.",
		"LA MITAD DE TU DINERO · ${0}":
			"SEPARUH UANGMU · ${0}",
		"Se fue con dos maletas, las mismas con las que llegó.":
			"Dia pergi membawa dua koper, yang sama dengan saat dia datang.",
		"La casa sigue a nombre de tu madre.":
			"Rumah tetap atas nama ibumu.",
		"Firmaste. La casa vuelve a ser tuya; la cuenta, la mitad.":
			"Kamu menandatangani. Rumah kembali jadi milikmu; rekening, tinggal separuh.",
		"DEPENDE DE LAS ESCRITURAS":
			"TERGANTUNG SERTIFIKAT",
		"Todo a Nombre de Mamá":
			"Semua Atas Nama Mama",
		"Que su abogado pidiera la casa y las escrituras dijeran otra cosa.":
			"Pengacaranya minta rumah, tapi sertifikat bilang lain.",
		"Lo pediste tú, y las escrituras están a nombre de tu madre: no hay nada que repartir.":
			"Kamu yang memintanya, dan sertifikat atas nama ibumu: tak ada yang bisa dibagi.",
		"Su abogado trae las escrituras con su nombre, pero tu cuenta está a cero: no hay mitad que llevarse.":
			"Pengacaranya membawa sertifikat atas namanya, tapi rekeningmu nol: tak ada separuh yang bisa diambil.",
		"Las escrituras están a nombre de tu madre: no se lleva nada.":
			"Sertifikat atas nama ibumu: dia tak membawa apa pun.",
		"Las escrituras están a su nombre: se lleva la mitad de tu dinero, ${0}.":
			"Sertifikat atas namanya: dia mengambil separuh uangmu, ${0}.",
		"La casera":
			"Si Rumahan",
		"La fiestera":
			"Si Pesta",
		"La ambiciosa":
			"Si Ambisius",
		"La celosa":
			"Si Pencemburu",
		"La independiente":
			"Si Mandiri",
		"La hincha":
			"Si Suporter",
		"La reservada":
			"Si Tertutup",
		"La cazafortunas":
			"Si Pemburu Harta",
		"La compañera":
			"Si Pendamping",
		"La millonaria":
			"Si Jutawan",
		"Quiere tu tiempo, no tu dinero. En casa se duerme.":
			"Dia ingin waktumu, bukan uangmu. Di rumah, kamu tidur.",
		"Vive de noche, contigo o sin ti. Te cuesta sueño y dinero.":
			"Hidupnya di malam hari, denganmu atau tanpamu. Kamu kehilangan tidur dan uang.",
		"Te quiere arriba, y te pasa la factura por subir.":
			"Dia ingin kamu di puncak, dan menagihmu ongkos untuk naik ke sana.",
		"Te quiere entero, y cada foto tuya con otra le cuesta una noche.":
			"Dia ingin kamu seutuhnya, dan setiap fotomu bersama wanita lain membuatnya tak bisa tidur semalaman.",
		"No te necesita: te eligió. Nunca acepta tu dinero.":
			"Dia tak butuh kamu: dia memilihmu. Dia tak pernah menerima uangmu.",
		"Iba al estadio antes que tú. Los domingos son sagrados.":
			"Dia ke stadion sebelum kamu. Hari Minggu itu sakral.",
		"Odia la prensa. En privado lo da todo.":
			"Dia benci pers. Berdua saja, dia memberi segalanya.",
		"No te quiere. Cuando le salgan las cuentas, se va con lo tuyo; con papel, tarda más y se lleva menos.":
			"Dia tidak mencintaimu. Saat hitungannya pas, dia pergi membawa hartamu; dengan perjanjian pranikah, dia lebih lama menunggu dan membawa lebih sedikit.",
		"Entiende el oficio. Entrena, viaja y aguanta contigo.":
			"Dia paham pekerjaanmu. Dia latihan, bepergian, dan bertahan bersamamu.",
		"Tiene más que tú y no te lo dice. Te regala dinero cada jornada y paga la boda.":
			"Dia punya lebih banyak darimu dan tak bilang. Dia memberimu uang tiap pekan dan membayar pernikahan.",



		"Tu agente lo dice sin mirarte: «firma la separación de"
		+ " bienes».":
			"Agenmu mengatakannya tanpa menatapmu: «tanda tangani perjanjian pranikah».",
		"La boda cuesta ${0}.":
			"Biaya pernikahan ${0}.",
		"FIRMAR EL PRENUPCIAL":
			"TEKEN PRANIKAH",
		"CASARSE SIN PAPELES":
			"NIKAH TANPA SURAT",
		"Firmó sin leerlo y no volvió a mencionarlo en toda la noche.":
			"Dia menandatangani tanpa membacanya dan tak menyinggungnya lagi sepanjang malam.",
		"Rompiste el papel delante de ella. Ese gesto lo va a"
		+ " recordar.":
			"Kamu merobek kertas itu di depannya. Dia akan mengingat gestur itu.",
		"Boda pagada: ${0}.":
			"Pernikahan dibayar: ${0}.",
		"Piden ${0}: ${1} de tu dinero y ${2} de lo que tienes"
		+ " puesto.":
			"Mereka minta ${0}: ${1} dari uang tunaimu dan ${2} dari asetmu.",
		"Con separación de bienes firmada":
			"Dengan perjanjian pranikah diteken",
		"Sin separación de bienes: entra todo":
			"Tanpa pranikah: semuanya masuk hitungan",
		"FIRMAR Y ACABAR":
			"TEKEN, SELESAI",
		"PELEAR LA CIFRA":
			"TAWAR ANGKANYA",
		"IR A JUICIO":
			"KE SIDANG",
		"Su abogado tarda dos días en contestar. Baja un poco, y"
		+ " poco.":
			"Pengacaranya butuh dua hari untuk membalas. Angkanya turun sedikit, cuma sedikit.",
		"El juez no le dio todo lo que pedía. Te llevas ${0} menos.":
			"Hakim tak memberinya semua yang dia minta. Kerugianmu berkurang ${0}.",
		"El juez no le dio lo que pedía. Tampoco había mucho que repartir.": "Hakim tak memberinya yang dia minta. Lagi pula tak banyak yang bisa dibagi.",
		"Salió peor que el acuerdo. Los abogados también se cobran.":
			"Hasilnya lebih buruk dari kesepakatan. Pengacara juga minta bagiannya.",
		"Firmaste sin leerlo entero. Se acabó.":
			"Kamu menandatangani tanpa membacanya sampai habis. Sudah selesai.",
		"Se lleva ${0}. Te quedan ${1}.":
			"Dia mengambil ${0}. Sisamu ${1}.",

		"Reservaste sin decirle por qué, y {0} bajó vestida para algo que no sabe qué"
		+ " es. El anillo lleva un mes pagado y lo llevas encima.":
			"Kamu memesan meja tanpa bilang alasannya, dan {0} turun berdandan untuk sesuatu yang dia sendiri tak tahu apa. Cincinnya sudah lunas sebulan dan ada di sakumu.",
		"PEDÍRSELO ESTA NOCHE":
			"LAMAR MALAM INI",
		"LO QUE FIRMÁIS":
			"YANG DITEKEN",
		"Tu agente lleva tres días pidiendo veinte minutos. Trae una carpeta y no la ha"
		+ " abierto delante de nadie.":
			"Agenmu sudah tiga hari minta dua puluh menit. Dia membawa map dan belum membukanya di depan siapa pun.",
		"ESCUCHARLE":
			"DENGARKAN",
		"NO HAY NADA QUE FIRMAR":
			"TAK ADA YANG DITEKEN",

		"UN FAVOR PARA SU HERMANO":
			"BANTUAN UNTUK SAUDARANYA",
		"El hermano de {0} tiene un negocio que va a salir seguro y le falta el"
		+ " arranque. Ella no lo pide para ella, y eso es justo lo que hace difícil decir"
		+ " que no.":
			"Saudara laki-laki {0} punya bisnis yang pasti untung dan hanya butuh modal awal. Dia tak memintanya untuk diri sendiri, dan justru itu yang membuat sulit berkata tidak.",
		"ADELANTARLE EL DINERO":
			"TALANGI UANGNYA",
		"QUE LO PIDA AL BANCO":
			"SURUH KE BANK",
		"Tranquila, cariñosa y sin dramas. Nunca te pide explicaciones.":
			"Tenang, hangat, dan tanpa drama. Dia tak pernah memintamu menjelaskan diri.",
		"Su abogado no negocia. Pone dos papeles sobre la mesa y te dice que firmes"
		+ " uno.":
			"Pengacaranya tak bernegosiasi. Dia menaruh dua kertas di meja dan menyuruhmu menandatangani salah satu.",
		"No hay tercera opción, y él lo sabe desde el día que os conocisteis.":
			"Tak ada pilihan ketiga, dan dia sudah tahu itu sejak hari kalian bertemu.",
		"No hay tercera opción.":
			"Tak ada pilihan ketiga.",
		"Se fue con una maleta y dejó el resto. Su abogado llamará el lunes.": "Dia pergi membawa satu koper dan meninggalkan sisanya. Pengacaranya akan menelepon hari Senin.",
		"Todavía estáis casados. Eso se firma, no se dice.": "Kalian masih menikah. Itu ditandatangani, bukan diucapkan.",
		"La separación de bienes que firmasteis recorta las dos.": "Perjanjian pranikah yang kalian teken memangkas keduanya.",
		"PAGAR Y QUEDÁRTELA · ${0}": "BAYAR, RUMAH TETAP · ${0}",
		"Pagaste por tu propia casa. El papel valió justo eso.": "Kamu membayar rumahmu sendiri. Segitulah nilai kertas itu.",
		"${0}, y las llaves siguen siendo tuyas.": "${0}, dan kuncinya tetap milikmu.",
		"Firmaste el otro. Cinco años pagando lo que ya no está en tu cuenta.": "Kamu menandatangani yang satunya. Lima tahun membayar apa yang sudah tak ada di rekeningmu.",
		"Con ella no hay reparto que negociar: su abogado te hará elegir entre la casa y cinco temporadas de tu ficha.": "Dengannya tak ada pembagian yang bisa dinegosiasikan: pengacaranya akan membuatmu memilih antara rumah dan gaji lima musim.",
		"Eliges tú, y se elige esta semana.": "Kamu yang memilih, dan harus pekan ini.",
		"SU ABOGADO YA LLAMÓ": "KABAR PENGACARANYA",
		"LA CASA · ${0}":
			"RUMAH · ${0}",
				"{0} DE TU FICHA · ${1} POR PARTIDO · {2} TEMPORADAS":
			"{0} GAJIMU · ${1} PER LAGA · {2} MUSIM",
		"Con ella este papel es una acusación.":
			"Baginya, kertas ini adalah tuduhan.",
		"A ella el dinero le da igual.":
			"Uang tak berarti baginya.",
		"LA CASA":
			"RUMAH",
		"EL {0}% DE TU FICHA · {1} TEMPORADAS":
			"{0}% GAJIMU · {1} MUSIM",
		"La casa que tienes vale ${0}. La ficha, ${1} por partido.":
			"Rumahmu bernilai ${0}. Gajimu, ${1} per laga.",
		"Recogiste en dos cajas. La vitrina se quedó donde estaba.":
			"Kamu berkemas dalam dua kardus. Lemari trofi tetap di tempatnya.",
		"La casa es suya, y todo lo que le metiste dentro.":
			"Rumah itu miliknya, beserta semua yang kamu taruh di dalamnya.",
		"Firmaste el otro. Cinco años de que cada partido rinda la mitad.":
			"Kamu menandatangani yang satunya. Lima tahun setiap laga hanya menghasilkan separuh.",
		"${0} por partido, y sube si tú subes.":
			"${0} per laga, dan naik kalau kamu naik.",
		"A ella el dinero le da igual: firmar apenas le va a doler.":
			"Uang tak berarti baginya: tanda tangan ini nyaris tak menyakitinya.",
		"Con ella este papel es una acusación. Y es de quien más te protege.":
			"Baginya kertas ini adalah tuduhan. Dan justru darinyalah kertas ini paling melindungimu.",
		"Le va a doler más de lo que va a decir.":
			"Dia akan lebih sakit daripada yang diakuinya.",

		"Va a vibrar tres veces. Contestar es perderla a ella.":
			"Akan bergetar tiga kali. Menjawab berarti kehilangan dia.",
		"Aguantados sin mirar: {0} de {1}":
			"Bertahan tanpa melirik: {0} dari {1}",
		"Ella se calla y espera a que termines. Se le fue lo que iba a decir.":
			"Dia diam dan menunggumu selesai. Apa yang hendak dia katakan sudah hilang.",
		"No te contó nada. Estabas en otra cosa.":
			"Dia tak bercerita apa-apa. Pikiranmu di tempat lain.",
		"CONTESTAR":
			"JAWAB",
		"GUARDAR EL TELÉFONO":
			"SIMPAN PONSEL",
		"PEDÍRSELO":
			"LAMAR DIA",
		"Lleváis dos temporadas viviendo juntos y el anillo está"
		+ " pagado desde hace un mes. Tu agente quiere hablar contigo"
		+ " antes de que se lo pidas.":
			"Kalian sudah dua musim tinggal bersama dan cincinnya sudah lunas sebulan. Agenmu ingin bicara sebelum kamu melamarnya.",
		"HABLAR CON ÉL":
			"DENGARKAN DIA",
		"¿LOS TIRAS TÚ?":
			"KAMU YANG AMBIL?",
		"{0} ha fallado dos penales este año y en el vestuario nadie dice nada. Llevas el brazalete: el siguiente lo decides tú.":
			"{0} gagal dua penalti tahun ini dan di ruang ganti tak ada yang bicara. Kamu pakai ban kapten: yang berikutnya kamu yang putuskan.",
		"LOS COBRO YO":
			"AKU YANG AMBIL",
		"SIGUE ÉL":
			"TETAP DIA",
		"EL PUESTO QUE QUERÍAS":
			"POSISI YANG KAMU MAU",
		"Tres años seguidos siendo el goleador del equipo desde donde no querías jugar. El técnico te para en el pasillo: el {0} es tuyo si lo quieres.":
			"Tiga tahun berturut-turut jadi pencetak gol terbanyak tim dari posisi yang tak kamu inginkan. Pelatih menghentikanmu di lorong: posisi {0} milikmu kalau kamu mau.",
		"ES MÍO":
			"ITU MILIKKU",
		"ME QUEDO DONDE ESTOY":
			"AKU TETAP DI SINI",
		"EL RIVAL DE LA DÉCADA":
			"RIVAL SATU DEKADE",
		"SE LLEVA TU LIGA OTRA VEZ":
			"MEREBUT LIGAMU LAGI",
		"LIGAS SEGUIDAS DE ELLOS":
			"LIGA BERUNTUN MEREKA",
		"sus ligas":
			"liga mereka",
		"las tuyas":
			"ligamu",
		"sus goles contra ti":
			"golnya ke gawangmu",
		"Tres años viéndolos levantar la liga que querías. No abre la boca: la cifra habla por él, y dice que el año que viene vuelve.":
			"Tiga tahun melihat mereka mengangkat liga yang kamu inginkan. Dia tak buka mulut: angkanya yang bicara, dan katanya tahun depan dia kembali.",
		"EL SELECCIONADOR SE ACUERDA":
			"PELATIH TIMNAS AKHIRNYA INGAT",
		"TU PRIMERA CONVOCATORIA, TARDE":
			"PANGGILAN PERTAMAMU, TERLAMBAT",
		"TEMPORADAS SIN LLAMARTE":
			"MUSIM TANPA PANGGILAN",
		"goles de liga":
			"gol liga",
		"años sin llamada":
			"tahun tanpa panggilan",
		"edad":
			"usia",
		"Dos temporadas de goleador en primera y el teléfono sin sonar. Hoy viene en persona: no pide perdón, pero te mira a los ojos.":
			"Dua musim jadi pencetak gol di kasta tertinggi dan telepon tak pernah berdering. Hari ini dia datang sendiri: tak minta maaf, tapi menatap matamu.",
		"EL PRESIDENTE TE PIDE QUEDARTE":
			"PRESIDEN MEMINTAMU BERTAHAN",
		"HAN PAGADO TU CLÁUSULA":
			"KLAUSULMU SUDAH DIBAYAR",
		"TEMPORADAS EN EL CLUB":
			"MUSIM DI KLUB",
		"la cláusula":
			"klausulnya",
		"balones de oro":
			"pemain terbaik",
		"Baja al césped sin prensa ni cámaras. No puede retener a quien paga la cláusula, y lo sabe: sólo viene a pedírtelo. La oferta sigue en MERCADO.":
			"Dia turun ke lapangan tanpa pers dan kamera. Dia tak bisa menahan orang yang klausulnya dibayar, dan dia tahu itu: dia cuma datang untuk meminta. Tawarannya masih ada di PASAR.",
		"OTRO AÑO":
			"SETAHUN LAGI",
		"SU ABOGADO HA LLAMADO":
			"PENGACARANYA TELEPON",
		"No fue una discusión ni una noche mala: fue una carta. {0}"
		+ " quiere el divorcio, y su abogado ya ha puesto una cifra"
		+ " encima de la mesa.":
			"Bukan pertengkaran atau malam buruk: ini sebuah surat. {0} ingin bercerai, dan pengacaranya sudah menaruh angka di meja.",
		"VER LA CIFRA":
			"LIHAT ANGKANYA",
		"NO ABRIR ESA CARTA":
			"JANGAN BUKA SURAT",




		"Deja el teléfono boca abajo y escúchala.":
			"Taruh ponsel telungkup dan dengarkan dia.",
		"Si vibra, no pasa nada. Es no tocarlo.":
			"Kalau bergetar, tak apa. Cukup jangan disentuh.",
		"Avisos ignorados: {0} de {1}":
			"Notifikasi diabaikan: {0} dari {1}",
		"Ella se calla y espera a que termines.":
			"Dia diam dan menunggumu selesai.",
		"No miraste el teléfono ni una vez. Ella lo notó.":
			"Kamu tak sekali pun melirik ponsel. Dia menyadarinya.",
		"Contestaste alguna. La noche se salvó a medias.":
			"Kamu menjawab beberapa. Malam itu setengah terselamatkan.",
		"Contestaste todas. Pidió la cuenta antes del postre.":
			"Kamu menjawab semuanya. Dia minta bon sebelum hidangan penutup.",
		"Pregunta {0} de {1}":
			"Pertanyaan {0} dari {1}",
		"Te acordabas de todo. No se lo esperaba.":
			"Kamu ingat semuanya. Dia tak menyangka.",
		"Casi todo. Se rió del que fallaste.":
			"Hampir semuanya. Dia menertawakan yang kamu lewatkan.",
		"Uno de tres. «¿Me estabas escuchando?»":
			"Satu dari tiga. «Kamu sungguh mendengarkanku?»",
		"Ni uno. Esa noche no la escuchaste.":
			"Tak satu pun. Malam itu kamu tak mendengarkannya.",
		"Aciertos: {0} de {1}":
			"Benar: {0} dari {1}",
		"Ronda {0} de {1}":
			"Ronde {0} dari {1}",
		"DECIRLO AHORA":
			"KATAKAN",
		"Dijiste lo justo y cuando tocaba. Te presentó a los suyos.":
			"Kamu bicara secukupnya dan pada saat yang pas. Dia memperkenalkanmu pada teman-temannya.",
		"Alguna la acertaste. Al salir te tomó del brazo.":
			"Beberapa kamu jawab tepat. Saat keluar dia menggandeng lenganmu.",
		"Hablaste siempre a destiempo. Salisteis pronto.":
			"Kamu selalu bicara di waktu yang salah. Kalian pulang lebih awal.",
		"Quiere el {0} de tu sueldo, todos los meses.":
			"Dia minta {0} dari gajimu, setiap bulan.",
		"Serían ${0} por partido.":
			"Itu berarti ${0} per laga.",
		"NO OFRECERLE NADA":
			"TAK BERI APA-APA",
		"OFRECERLE LA MITAD":
			"BERI SEPARUH",
		"OFRECERLE CASI TODO":
			"BERI HAMPIR SEMUA",
		"DARLE LO QUE PIDE":
			"TURUTI PERMINTAANNYA",
		"«¿{0}? No me hagas esto.» Baja al {1}.":
			"«{0}? Jangan begini padaku.» Dia turun ke {1}.",
		"Trato hecho: el {0} de tu sueldo, cada partido.":
			"Sepakat: {0} dari gajimu, setiap laga.",
		"Sube tu mantenimiento en ${0} por partido.":
			"Biaya perawatanmu naik ${0} per laga.",
		"Se levantó de la mesa sin acabar la frase.":
			"Dia bangkit dari meja di tengah kalimat.",
		"Esto no queda así.":
			"Ini belum selesai.",
		"Creció en un pueblo de la costa":
			"Dia tumbuh di desa pesisir",
		"Creció en un barrio del norte":
			"Dia tumbuh di kawasan utara kota",
		"Se crió en el campo, lejos de todo":
			"Dia dibesarkan di pedesaan, jauh dari mana-mana",
		"Es de una ciudad de montaña":
			"Dia berasal dari kota pegunungan",
		"Cambió de casa cada dos años":
			"Dia pindah rumah tiap dua tahun",
		"Nunca ha salido de esta ciudad":
			"Dia tak pernah keluar dari kota ini",
		"Vivió un tiempo en el extranjero":
			"Dia pernah tinggal di luar negeri beberapa waktu",
		"Es del mismo barrio que tú":
			"Dia dari lingkungan yang sama denganmu",
		"No soporta que le hablen de fútbol":
			"Dia tak tahan diajak bicara soal sepak bola",
		"No soporta la gente que llega tarde":
			"Dia tak tahan orang yang datang terlambat",
		"No soporta las fotos sin avisar":
			"Dia tak tahan difoto tanpa aba-aba",
		"No soporta el ruido de los sitios de moda":
			"Dia tak tahan bisingnya tempat yang sedang tren",
		"No soporta que le mientan por educación":
			"Dia tak tahan dibohongi demi sopan santun",
		"No soporta madrugar":
			"Dia tak tahan bangun pagi",
		"No soporta que le pidan permiso para todo":
			"Dia tak tahan ditanya izin untuk segala hal",
		"No soporta el mar":
			"Dia tak tahan laut",
		"Pidió pescado y no se lo acabó":
			"Dia pesan ikan dan tak menghabiskannya",
		"Pidió lo mismo que tú":
			"Dia pesan yang sama denganmu",
		"Pidió sólo postre":
			"Dia hanya pesan hidangan penutup",
		"Pidió el plato más raro de la carta":
			"Dia pesan menu paling aneh",
		"No pidió nada, dijo que no tenía hambre":
			"Dia tak pesan apa-apa, katanya tak lapar",
		"Pidió carne muy hecha":
			"Dia pesan daging well done",
		"Pidió que eligieras tú":
			"Dia minta kamu yang memilih",
		"Pidió la sopa del día":
			"Dia pesan sup hari ini",
		"Ella habla con gente que no conoces. Espera el hueco.":
			"Dia bicara dengan orang yang tak kamu kenal. Tunggu celahnya.",
		"Alguien pregunta a qué te dedicas. No es el momento de"
		+ " decirlo.":
			"Seseorang bertanya apa pekerjaanmu. Ini bukan saat untuk menjawab.",
		"Se gira hacia ti. Ahora sí.":
			"Dia menoleh ke arahmu. Sekarang saatnya.",
		"¿De dónde te dijo que era?":
			"Dia bilang berasal dari mana?",
		"¿Qué te dijo que no soporta?":
			"Dia bilang tak tahan apa?",
		"¿Qué pidió aquella noche?":
			"Apa yang dia pesan malam itu?",
		"LA PRIMERA CENA":
			"KENCAN PERTAMA",
		"Mesa para dos y el teléfono boca abajo. Esta noche va de"
		+ " escucharla — y de que no te pillen mirando la pantalla.":
			"Meja untuk dua orang dan ponsel telungkup. Malam ini soal mendengarkannya — dan jangan sampai ketahuan melirik layar.",
		"ESTA SEMANA NO":
			"NANTI SAJA",
		"LO QUE TE CONTÓ":
			"YANG DIA BILANG",
		"Una copa y la conversación de la otra noche encima de la"
		+ " mesa. Vas a tener que acordarte de lo que te dijo.":
			"Segelas minuman dan obrolan malam itu kembali di meja. Kamu harus mengingat apa yang dia katakan.",
		"LA INAUGURACIÓN DE ELLA":
			"PEMBUKAAN PAMERANNYA",
		"Te lleva a una exposición donde no conoces a nadie. Aquí no"
		+ " se trata de entender los cuadros: se trata de saber cuándo"
		+ " hablar.":
			"Dia mengajakmu ke pameran tempat kamu tak kenal siapa pun. Ini bukan soal memahami lukisan: ini soal tahu kapan harus bicara.",
		"HABLEMOS DE DINERO":
			"BICARA SOAL UANG",
		"{0} ha esperado a que acabe la cena para decirlo, y lo dice"
		+ " sin rodeos: quiere una cantidad fija todos los meses, o esto"
		+ " no tiene sentido.":
			"{0} menunggu makan malam selesai untuk mengatakannya, dan dia bilang terus terang: dia ingin jumlah tetap setiap bulan, atau ini tak ada artinya.",
		"HABLARLO":
			"BICARAKAN",
		"NO PIENSO DISCUTIR ESO":
			"AKU TAK MAU BAHAS",


		"PRÓRROGA": "JEDA ET",
		"DESCANSO · FINAL": "HT · FINAL",
		"DESCANSO · DERBI": "HT · DERBY",
		"SEGUNDO TIEMPO EXTRA": "ET BABAK KEDUA",
		"SI NADIE MARCA, PENALTIS": "TANPA GOL, ADU PENALTI",
		"QUINCE MINUTOS PARA AGUANTAR": "15 MENIT UNTUK BERTAHAN",
		"QUINCE MINUTOS PARA REMONTAR": "15 MENIT UNTUK BANGKIT",
		"SI ACABA ASÍ: PRÓRROGA": "SKOR INI: ET",
		"SI ACABA ASÍ: CAMPEONES": "SKOR INI: JUARA",
		"SI ACABA ASÍ: SUBCAMPEONES": "SKOR INI: RUNNER-UP",
		"SI ACABA ASÍ: PASÁIS": "SKOR INI: LOLOS",
		"SI ACABA ASÍ: FUERA": "SKOR INI: GUGUR",
		"GLOBAL {0}-{1} · PRÓRROGA": "AGG {0}-{1} · ET",
		"GLOBAL {0}-{1} · PASÁIS": "AGG {0}-{1} · LOLOS",
		"GLOBAL {0}-{1} · FUERA": "AGG {0}-{1} · GUGUR",
		"10 CONTRA 11": "10 LAWAN 11",
		"11 CONTRA 10": "11 LAWAN 10",
		"LÍDER": "TOP",
		"EN ASCENSO": "PROMOSI",
		"EN DESCENSO": "DEGRADASI",
		"IGUALADO CON EL LÍDER": "SAMA DENGAN PUNCAK",
		"IGUALADO CON EL ASCENSO": "SAMA DENGAN PROMOSI",
		"IGUALADO CON EL DESCENSO": "SAMA DENGAN DEGRADASI",
		"A {0} PTS DEL LÍDER": "{0} PTS DARI PUNCAK",
		"A {0} PTS DEL ASCENSO": "{0} PTS DARI PROMOSI",
		"A {0} PTS DEL DESCENSO": "{0} PTS DARI DEGRADASI",
		"ÚLTIMA JORNADA": "PEKAN TERAKHIR",
		"El míster se ha ido a por {0} delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"Pelatih menyemprot {0} di depan seluruh ruang ganti. Tak ada yang mengangkat kepala dari lantai. Kamu duduk di sebelahnya.",
		"Lo has dicho delante de todos. El míster no lo olvidará, y {0} tampoco.":
			"Kamu mengatakannya di depan semua orang. Pelatih tak akan lupa, begitu juga {0}.",
		"Te has callado. {0} se ha dado cuenta.": "Kamu diam saja. {0} menyadarinya.",
		"{0}, nos has dejado con diez. Hoy no me hables.": "{0}, kamu membuat kita main dengan sepuluh orang. Hari ini jangan bicara denganku.",
		"{0}, {1} goles. ¿Vas a parar alguno en la segunda?":
			"{0}, {1} gol. Mau menahan satu di babak kedua?",
		"LA HA TOMADO CON ÉL": "DIJADIKAN SASARAN",
		"El míster se ha ido a por un compañero delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"Pelatih menyemprot seorang rekan setim di depan seluruh ruang ganti. Tak ada yang mengangkat kepala dari lantai. Kamu duduk di sebelahnya.",
		"DAR LA CARA POR ÉL": "BELA DIA",
		"QUEDARTE CALLADO": "DIAM SAJA",

		"PREGUNTA DE VESTUARIO": "KUIS RUANG GANTI",
		"En el banco, alguien saca el móvil y lanza una pregunta a todo el vestuario.": "Di bangku cadangan, seseorang mengeluarkan ponsel dan melempar pertanyaan ke seluruh ruang ganti.",
		"¿De dónde llegó {0} a {1}?": "{0} datang ke {1} dari mana?",
		"ACIERTA Y SUMAS +{0} DE ENERGÍA AL PITIDO": "BENAR = +{0} ENERGI SAAT PELUIT AKHIR",
		"¡Exacto! Llegó de {0}. +{1} de energía al pitido.": "Tepat! Dia datang dari {0}. +{1} energi saat peluit akhir.",
		"No. Llegó de {0}.": "Salah. Dia datang dari {0}.",
		"Esto no es lo que somos. Tú tira del carro y los demás irán detrás.":
			"Ini bukan jati diri kita. Kamu yang memimpin, yang lain akan mengikuti.",
		"Nos hemos salido del plan. Volved a lo de siempre y el resto llegará.":
			"Kita keluar dari rencana. Kembali ke yang biasa dan sisanya akan datang.",
		"Me dais vergüenza. A todos. Esa camiseta no se regala así.":
			"Kalian bikin aku malu. Semuanya. Jersey itu tak diberikan begitu saja.",
		"Ya está. Que por lo menos no sea peor.": "Sudah. Setidaknya jangan lebih buruk.",
		"Tú no eres éste. Te conozco: sal y demuéstramelo.":
			"Itu bukan kamu. Aku kenal kamu: keluar sana dan buktikan padaku.",
		"Haz lo sencillo. Lo que te ha traído hasta aquí, nada más.":
			"Main sederhana saja. Apa yang membawamu ke sini, tak perlu lebih.",
		"Así no. Si en diez minutos sigues igual, te cambio.":
			"Jangan begitu. Kalau sepuluh menit lagi masih sama, kamu kuganti.",
		"Lo que esperaba de ti. Ni más ni menos.": "Seperti yang kuharapkan darimu. Tak lebih, tak kurang.",
		"Un gol no es nada. Dádsela a él, que sabe qué hacer con ella.":
			"Satu gol belum apa-apa. Beri bola ke dia, dia tahu apa yang harus dilakukan.",
		"Vamos bien aunque no lo parezca. Mismo plan, y el gol llegará.":
			"Kita lebih baik dari kelihatannya. Rencana sama, dan golnya akan datang.",
		"Uno abajo y nadie se ha manchado la camiseta. Quiero verlo en la segunda.":
			"Tertinggal satu dan tak ada yang berkeringat. Aku mau lihat di babak kedua.",
		"Un gol abajo. Haré cambios.": "Tertinggal satu gol. Aku akan ganti pemain.",
		"Cero a cero. La próxima que tengas, adentro. Confío en ti.":
			"Nol-nol. Peluang berikutnya, masukkan. Aku percaya padamu.",
		"Cero a cero, como estaba pensado. Paciencia, que el gol viene solo.":
			"Nol-nol, sesuai rencana. Sabar, gol akan datang sendiri.",
		"Cero a cero y nadie ha probado al portero. Eso se acabó.":
			"Nol-nol dan belum ada yang menguji kiper. Itu berakhir sekarang.",
		"Cero a cero. Seguid así y ya veremos.": "Nol-nol. Teruskan begini dan kita lihat nanti.",
		"Empate. Marca tú la diferencia, que para eso te traje.":
			"Seri. Kamu yang bikin beda, makanya kamu kurekrut.",
		"Empate. No cambiéis nada: si seguimos así, el partido es nuestro.":
			"Seri. Jangan ubah apa pun: kalau begini terus, laga ini milik kita.",
		"Un empate no me vale. Quiero más de todos, y de ti el primero.":
			"Seri tak cukup buatku. Aku mau lebih dari kalian semua, dan darimu paling dulu.",
		"Empate. Algo tocaremos.": "Seri. Ada yang akan kuubah.",
		"Bien. Seguid buscándole, que el segundo lo lleva en las botas.":
			"Bagus. Terus cari dia, gol kedua ada di sepatunya.",
		"Ganamos haciendo lo nuestro. Seguid igual.": "Kita menang dengan cara kita. Teruskan.",
		"Uno a cero no es nada. No quiero ver ni un paso atrás.":
			"Satu-nol belum apa-apa. Aku tak mau lihat mundur satu langkah pun.",
		"Ganamos. No toquéis nada.": "Kita unggul. Jangan ubah apa pun.",
		"Esto es lo que sois. Disfrutadlo, pero sin regalar nada.":
			"Inilah kalian sebenarnya. Nikmati, tapi jangan beri apa pun cuma-cuma.",
		"El plan funciona. Cuarenta y cinco minutos más de lo mismo.":
			"Rencana berhasil. Empat puluh lima menit lagi, sama saja.",
		"Bien. Y ahora no quiero ver a nadie relajándose. A nadie.":
			"Bagus. Sekarang aku tak mau lihat siapa pun mengendur. Siapa pun.",
		"Está hecho. Aprovecharé para mover el banquillo.": "Sudah beres. Aku akan beri menit ke pemain cadangan.",
		"{0} no vuelve. Los demás, a correr también por él.":
			"{0} tak kembali. Yang lain, berlarilah juga untuknya.",
		"Nos lo han metido en el peor minuto. Olvidadlo ya, o nos come la segunda.":
			"Kita kebobolan di menit terburuk. Lupakan sekarang, atau babak kedua melahap kita.",
		"Íbamos perdiendo y lo habéis levantado. Eso no os lo regala nadie.":
			"Kita tertinggal dan kalian membalikkannya. Itu bukan hadiah dari siapa pun.",
		"Íbamos ganando y lo hemos regalado. Eso no vuelve a pasar.":
			"Kita unggul dan malah menyerahkannya. Jangan sampai terulang.",
		"El gol en el mejor momento. Ahora están tocados: a por el siguiente.":
			"Gol di saat terbaik. Mereka goyah sekarang: kejar gol berikutnya.",
		"Con diez. Cada uno corre por dos, y sin una queja.":
			"Bersepuluh. Masing-masing berlari untuk dua orang, tanpa mengeluh.",
		"Tienen uno menos. Que lo noten sus piernas, no las nuestras.":
			"Mereka kurang satu orang. Biar kaki mereka yang merasakannya, bukan kaki kita.",
		"Si llegamos a los penaltis, quiero once que se tengan en pie.":
			"Kalau lanjut ke adu penalti, aku mau sebelas orang yang masih berdiri tegak.",
		"Quince minutos. Aguantadlos como si fueran noventa.":
			"Lima belas menit. Bertahanlah seperti sembilan puluh.",
		"Quince minutos para darle la vuelta. Lo que os quede, ahí fuera.":
			"Lima belas menit untuk membalikkan skor. Habiskan tenaga kalian di luar sana.",
		"Así, prórroga. Y nadie quiere prórroga.": "Kalau begini, perpanjangan waktu. Dan tak ada yang mau itu.",
		"Ahora mismo pasamos. Que no se os note que lo sabéis.":
			"Saat ini kita lolos. Jangan sampai kelihatan kalau kalian tahu.",
		"Ahora mismo estamos fuera. Cuarenta y cinco minutos para cambiarlo.":
			"Saat ini kita tersingkir. Empat puluh lima menit untuk mengubahnya.",
		"Una final no se juega: se gana. El que se esconda, al banquillo.":
			"Final bukan dimainkan, tapi dimenangkan. Yang bersembunyi, duduk di bangku cadangan.",
		"Cuarenta y cinco minutos entre vosotros y la copa. Ni uno menos.":
			"Empat puluh lima menit antara kalian dan piala. Tak boleh kurang semenit pun.",
		"Nadie se acuerda de los subcampeones. Nadie. Salid a por ella.":
			"Tak ada yang ingat runner-up. Tak ada. Keluar dan ambil piala itu.",
		"¿Los oís? Pues que sea lo último que cantan hoy.": "Dengar mereka? Jadikan itu lagu terakhir yang mereka nyanyikan hari ini.",
		"Esto no es un partido más y lo sabéis. Hoy no se pierde.":
			"Ini bukan laga biasa dan kalian tahu. Hari ini tak boleh kalah.",
		"Media ciudad está callada ahora mismo. Que siga así.":
			"Setengah kota sedang diam sekarang. Biarkan tetap begitu.",
		"Así acabado, la tabla se nos pone cuesta arriba. Hay que darle la vuelta.":
			"Kalau berakhir begini, klasemen makin berat bagi kita. Harus dibalikkan.",
		"Un punto aquí no arregla nada. Quedan pocos partidos y éste es uno.":
			"Satu poin di sini tak menyelesaikan apa pun. Laga tinggal sedikit, dan ini salah satunya.",
		"Si esto acaba así, la tabla se mueve a nuestro favor. No lo tiréis.":
			"Kalau berakhir begini, klasemen bergeser ke arah kita. Jangan sia-siakan.",


		"NO SALES": "DIGANTI",
		"Le metiste un balonazo a tu propio banquillo. No hacía falta nada más.":
			"Kamu menendang bola ke bangku cadangan sendiri. Tak perlu apa-apa lagi.",
		"{0} ocasiones tiradas antes del descanso. Ya lo había decidido en la tercera.":
			"{0} peluang terbuang sebelum turun minum. Aku sudah memutuskan di peluang ketiga.",
		"Cuarenta y cinco minutos y no te he visto. Hoy se acabó aquí.":
			"Empat puluh lima menit dan aku tak melihatmu. Hari ini berakhir di sini.",



		"VAS POR DELANTE": "UNGGUL",
		"VAS POR DETRÁS": "TERTINGGAL",
		"TODO IGUAL": "SKOR SERI",
		"SEGUNDA PARTE": "BABAK KEDUA",

		"No la tenías: en el túnel cuesta el triple.":
			"Kamu tak punya: di lorong harganya tiga kali lipat.",
		"energía": "energi",
		"tus minutos": "menitmu",
		"Te están pasando por encima. Esto no se arregla solo en la segunda.":
			"Kamu digilas mereka. Ini tak beres sendiri di babak kedua.",
		"Desde la banca también se juega. Cuando te toque, no preguntes.":
			"Dari bangku cadangan pun kamu bermain. Saat gilirannya tiba, jangan banyak tanya.",
		"A ti no te he visto. O apareces en la segunda, o te sientas.":
			"Aku tak melihatmu di lapangan. Muncul di babak kedua, atau duduk.",
		"Vas fundido. Piensa bien dónde gastas lo que te queda.":
			"Kamu kehabisan tenaga. Pikir baik-baik di mana kamu pakai sisanya.",
		"Un gol. Sólo eso os separa, y quedan cuarenta y cinco minutos.":
			"Satu gol. Hanya itu selisihnya, dan masih ada empat puluh lima menit.",
		"Cero a cero. Esto lo gana el primero que acierte.":
			"Nol-nol. Laga ini milik yang pertama tepat sasaran.",
		"Empate. El que se canse primero, pierde.": "Seri. Siapa yang capek duluan, kalah.",
		"Un gol no es nada. Salid como si fuerais perdiendo.":
			"Satu gol belum apa-apa. Keluar seolah-olah kalian tertinggal.",
		"Bien. Ahora lo difícil: no regalar lo que ya es vuestro.":
			"Bagus. Sekarang yang sulit: jangan serahkan apa yang sudah jadi milik kalian.",

		"EL BALÓN ES TUYO": "BOLA INI MILIKMU",
		"EL BALÓN ES DE LOS DOS": "BOLA UNTUK BERDUA",
		"UN BALÓN PARA CADA UNO": "SATU BOLA TIAP ORANG",
		"PASES TUYOS, GOLES DE {0}": "UMPANMU, GOL {0}",
		"GOLES ENTRE LOS DOS": "GOL BERDUA",
		"Te lo dio a ti. Sabe de dónde salieron.": "Dia memberikannya padamu. Dia tahu dari mana gol-gol itu datang.",
		"{0} tuyos, {1} suyos. Cada uno con el suyo.": "{0} milikmu, {1} miliknya. Masing-masing dengan miliknya.",
		"DOS HAT-TRICKS": "DUA HAT-TRICK",
		"GOLES EN UN PARTIDO": "GOL DALAM SATU LAGA",
		"Firmado por todos. Ya sabes dónde va.": "Ditandatangani seluruh skuad. Kamu tahu mau ditaruh di mana.",
		"INTERCAMBIO": "SWAP JERSEY",
		"SU CAMISETA": "JERSEYNYA",
		"La suya se queda contigo. La tuya se va con él.": "Punyanya tinggal bersamamu. Punyamu pergi bersamanya.",
		"TE PIDE LA CAMISETA": "DIA MINTA JERSEYMU",
		"{0} te espera en el círculo con la suya ya enrollada en la mano. La grada todavía no se va, y desde arriba se ve todo.": "{0} menunggumu di lingkaran tengah dengan jerseynya sudah tergulung di tangan. Tribun belum bubar, dan dari atas semuanya kelihatan.",
		"CAMBIARLA": "TUKAR",
		"DÁRSELA SIN PEDIR NADA": "BERI TANPA IMBALAN",
		"NO SE CAMBIA": "TAK DITUKAR",
		"BALONES": "BOLA",
		"PLAYERAS": "JERSEY",
		"VITRINA DE BALONES": "LEMARI BOLA",






		"VITRINA TORRE": "LEMARI MENARA",
		"VITRINA GALERÍA": "LEMARI GALERI",
		"VITRINA DE PREMIOS": "LEMARI PENGHARGAAN",
		"Tres baldas en un metro: para el rincón que no da más.":
			"Tiga rak dalam satu meter: untuk sudut yang tak muat lagi.",
		"Cuatro metros de mostrador para alinear el palmarés.":
			"Empat meter meja pajang untuk menata palmares.",
		"Solo para lo tuyo: los galardones individuales.":
			"Khusus milikmu: penghargaan individu.",
		"Sólo para lo tuyo: los galardones individuales.":
			"Khusus milikmu: penghargaan individu.",
		"Cada balón, con el día y el rival al que se lo metiste.": "Setiap bola, lengkap dengan hari dan lawan yang kamu bobol.",
		"Los balones de tus hat-tricks y las camisetas que cambiaste.": "Bola-bola hat-trickmu dan jersey yang kamu tukar.",
		"CAMBIO EN EL BANQUILLO": "PERGANTIAN PELATIH",
		"EL NUEVO": "YANG BARU",
		"TÉCNICO NUEVO": "PELATIH BARU",
		"Destituyen a {0}. {1}": "{0} dipecat. {1}",
		"TE QUERÍA A TI": "DIA MEMILIHMU",
		"Pidió tu nombre antes de firmar. Vienes de serie en su plan.": "Dia menyebut namamu sebelum teken. Kamu sudah masuk rencananya.",
		"NO TOCA LO QUE FUNCIONA": "YANG JALAN, TAK DIUBAH",
		"Ha visto los vídeos y no piensa cambiar lo que ya andaba.": "Dia sudah menonton rekamannya dan tak akan mengubah yang sudah berjalan.",
		"EMPEZAMOS DE CERO": "MULAI DARI NOL",
		"No te conoce de nada. Todo el mundo parte del mismo sitio.": "Dia tak kenal kamu sama sekali. Semua orang mulai dari titik yang sama.",
		"TE LO VAS A GANAR": "RAIH TEMPATMU",
		"Dice que aquí no hay intocables, y te mira a ti al decirlo.": "Katanya di sini tak ada yang tak tergantikan, dan dia menatapmu saat mengatakannya.",
		"NO CUENTA CONTIGO": "TAK MASUK RENCANA",
		"Tiene otro plan, y en su pizarra tu nombre no aparece.": "Dia punya rencana lain, dan namamu tak ada di papan taktiknya.",

		"TÉCNICOS": "PELATIH",
		"RANKING DE TÉCNICOS": "RANKING PELATIH",
		"Los técnicos del mundo, ordenados por sus estrellas.": "Pelatih dari seluruh dunia, diurutkan menurut bintangnya.",
		"Los trofeos cuentan desde la temporada {0}.": "Trofi dihitung sejak musim {0}.",
		"1ª DIVISIÓN": "DIVISI 1",
		"EN EL PARO": "TANPA KLUB",
		"Nadie en esta lista todavía. Los que echan de su club pasan aquí hasta que otro los ficha.": "Belum ada siapa pun di daftar ini. Pelatih yang dipecat mampir di sini sampai klub lain merekrutnya.",
		"TU TÉCNICO: {0}° DE {1}": "PELATIHMU: #{0}/{1}",
		"En el cargo desde la temporada {0}.": "Menjabat sejak musim {0}.",
		"Sin títulos todavía.": "Belum ada gelar.",

		"MÍSTER": "PELATIH",
		"2ª DIVISIÓN": "DIVISI 2",
		"técnico": "pelatih",
		"técnicos": "pelatih",
		"técnico sin equipo": "pelatih tanpa klub",
		"técnicos sin equipo": "pelatih tanpa klub",
		"seleccionador": "pelatih timnas",
		"seleccionadores": "pelatih timnas",

		"cara de leyenda": "wajah legenda",
		"caras de leyenda": "wajah legenda",
		"Palmarés real, más lo que ganen desde la temporada {0}.": "Palmares asli, ditambah apa pun yang mereka menangkan sejak musim {0}.",
		"{0} destituye a {1}. Llega {2}.": "{0} memecat {1}. {2} datang.",

		"BALÓN AL ÁREA": "BOLA PANJANG",
		"No quiere elaborar: quiere el balón arriba y gente rematando.": "Dia tak mau membangun serangan: dia mau bola ke depan dan banyak orang menyambut di kotak.",
		"TOQUE Y PACIENCIA": "UMPAN SABAR",
		"Prefiere diez pases a un balonazo. Aquí se juega con la cabeza.": "Dia lebih suka sepuluh umpan daripada satu bola panjang. Di sini bermain pakai otak.",
		"PRESIÓN ALTA": "PRESS TINGGI",
		"Noventa minutos corriendo. El que no llega, descansa.": "Sembilan puluh menit berlari. Yang tak sanggup, duduk.",
		"OFICIO": "MATANG",
		"Once fijo y partido controlado. Aquí mandan los que ya saben.": "Sebelas pemain tetap dan laga terkendali. Di sini yang berpengalaman yang memimpin.",
		"DOBLE PIVOTE": "DOUBLE PIVOT",
		"Dos que barren, uno que piensa y uno arriba. Primero, no perder.": "Dua yang menyapu, satu yang berpikir dan satu di depan. Pertama, jangan kalah.",
		"ATAQUE TOTAL": "SERANG TOTAL",
		"Tres atrás y tres arriba. Si nos meten dos, metemos tres.": "Tiga di belakang, tiga di depan. Kalau mereka cetak dua, kita cetak tiga.",
		"AUTOBÚS": "PARKIR BUS",
		"Cinco atrás y a la contra. Un 1-0 es una goleada.": "Lima di belakang dan main serangan balik. Menang 1-0 itu pesta gol.",
		"PIZARRA": "PAPAN TAKTIK",
		"El {0} ya juega el {1} de {2}": "{0} kini main {1} ala {2}",

		"ESPECIALISTA A BALÓN PARADO": "AHLI BOLA MATI",
		"Ensaya el balón parado: si eres el lanzador, te llegan muchas más faltas, córners y penales.": "Melatih bola mati: kalau kamu eksekutornya, kamu dapat jauh lebih banyak tendangan bebas, korner, dan penalti.",
		"EL CÓRNER ES UN PENAL": "KORNER = PENALTI",
		"Ensaya el córner: si eres el lanzador, sacas casi el doble de córners y tiras menos faltas.": "Melatih tendangan sudut: kalau kamu eksekutornya, kamu dapat hampir dua kali lipat korner dan lebih sedikit tendangan bebas.",
		"CONTRAGOLPE": "SERANGAN BALIK",
		"Cede el balón y sale a la carrera: más contras y menos posesión.": "Menyerahkan bola lalu berlari: lebih banyak serangan balik dan penguasaan bola lebih sedikit.",
		"AL ÁREA, SIEMPRE": "SELALU KE KOTAK",
		"Todo por las bandas: llueven centros al área y hay menos disparos desde fuera.": "Semua lewat sayap: umpan silang menghujani kotak dan tembakan jarak jauh berkurang.",
		"JUEGO DE ESPACIOS": "MAIN DI CELAH",
		"Busca el pase al hueco: más mano a mano con el portero.": "Mencari umpan terobosan: lebih banyak adu satu lawan satu dengan kiper.",
		"PEGA DESDE FUERA": "TEMBAK DARI JAUH",
		"Pide el disparo desde fuera del área: más tiros lejanos.": "Minta tembakan dari luar kotak: lebih banyak tembakan jarak jauh.",
		"CERROJO": "KUNCI RAPAT",
		"Con ventaja cierra el partido: el rival casi no remonta desde el 75'.": "Kalau unggul dia mengunci laga: lawan nyaris tak bisa bangkit setelah menit 75.",
		"FERGIE TIME": "FERGIE TIME",
		"Sus equipos no se rinden: más goles propios en el descuento.": "Timnya tak pernah menyerah: lebih banyak gol timmu di waktu tambahan.",
		"EL ÁREA ES UN CAMPO DE MINAS": "KOTAK = LADANG RANJAU",
		"Juega por dentro y lo derriban: el doble de penales a favor.": "Main lewat tengah dan dijatuhkan: penalti untukmu dua kali lipat.",
		"CONFÍA EN EL CHAVAL": "PERCAYA ANAK MUDA",
		"Apuesta por los jóvenes: hasta los 23 juegas más y antes eres titular.": "Mengandalkan pemain muda: sampai usia 23 kamu main lebih banyak dan jadi inti lebih cepat.",
		"EL BALÓN ES NUESTRO": "BOLA MILIK KITA",
		"Con el balón el rival no llega: encaja menos, pero el partido va más lento.": "Dengan bola, lawan tak pernah sampai: kebobolan lebih sedikit, tapi laga lebih lambat.",
		"SALE A MORDER": "TANCAP GAS",
		"Empieza a mil: la primera media hora es de tu equipo, ida y vuelta.": "Mulai habis-habisan: setengah jam pertama milik timmu, serang-balas.",
		"POCAS PERO CLARAS": "PELUANG EMAS",
		"Menos ocasiones y mejores: llegan más cerca de la portería, y fallarlas cuesta el doble.": "Peluang lebih sedikit tapi lebih bagus: datang lebih dekat ke gawang, dan gagal memanfaatkannya harganya dua kali lipat.",
		"HOMBRE DE DERBIS": "RAJA DERBY",
		"Se crece en los derbis: más juego y una ocasión más contra el rival de siempre.": "Bersinar di derby: lebih banyak bermain dan satu peluang tambahan lawan rival abadi.",
		"CUIDA LAS PIERNAS": "JAGA KAKI",
		"Menos lesiones y mejor descanso, a cambio de rotarte más.": "Cedera lebih sedikit dan istirahat lebih baik, dengan imbalan kamu lebih sering dirotasi.",
		"EL LOCO": "SI GILA",
		"Ida y vuelta sin freno: más energía por partido y más lesiones.": "Serang-balas tanpa rem: energi per laga lebih banyak dan cedera lebih banyak.",
		"NO TE FÍAS DEL CHAVAL": "TAK PERCAYA ANAK MUDA",
		"No se fía de los jóvenes: hasta los 23 te cuesta más el puesto.": "Tak percaya pemain muda: sampai usia 23, tempatmu lebih sulit didapat.",
		"BRONCA POR TODO": "MARAH TERUS",
		"Bronca por todo: cada mal partido te pesa el doble con él.": "Marah soal segalanya: di matanya, setiap laga buruk dihitung dua kali lipat.",
		"CARRUSEL": "ROTASI",
		"Rota sin parar: te sienta aunque llegues fresco.": "Rotasi tanpa henti: kamu dicadangkan walau segar.",
		"NO SUELTA UN DURO": "PELIT",
		"Manda en los fichajes y no suelta un duro: las mejoras de contrato cuestan más.": "Memegang urusan transfer dan tak melepas sepeser pun: kenaikan kontrak lebih mahal.",
		"ONCE DE LA SUERTE": "INTI BERTUAH",
		"Si el once ganó, repite: para entrar hay que esperar a que pierda.": "Kalau tim inti menang, dia pakai lagi: untuk masuk, tunggu sampai tim kalah.",
		"VE ROJAS DONDE NO LAS HAY": "KARTU MERAH DI MANA-MANA",
		"Sus equipos ven más rojas: jugarás con diez más veces.": "Timnya lebih sering kena kartu merah: kamu akan bermain bersepuluh lebih sering.",
		"FUERA DE CASA SE ENCOGE": "CIUT SAAT TANDANG",
		"Fuera de casa se encoge: el rival aprieta más en su campo.": "Ciut saat tandang: lawan menekan lebih keras di kandangnya.",
		"SU OJITO DERECHO": "ANAK EMAS",
		"Tiene favoritos: hasta que te lo ganes, otro juega en tu sitio.": "Punya favorit: sampai kamu memenangkan hatinya, orang lain main di posisimu.",
		"PARTIDOS LOCOS": "LAGA GILA",
		"Sus partidos son locos: goleadas en las dos porterías.": "Laganya gila: pesta gol di kedua gawang.",
		"DESPIERTA AL DESCANSO": "BANGUN DI BABAK 2",
		"Sale dormido: nada antes del 25', y el rival manda la primera parte.": "Keluar setengah tidur: tak ada apa-apa sebelum menit 25, dan lawan menguasai babak pertama.",
		"ONCE DE HIERRO": "INTI BAJA",
		"Casi no rota: repite el once mientras aguanten las piernas; el que no juega, espera.": "Nyaris tak merotasi: sebelas pemain sama selama kaki kuat; yang tak main, menunggu.",
		"LA CULPA ES TUYA": "SALAHMU",
		"Tras perder, la culpa es tuya: afición y prensa te lo cobran el doble.": "Setelah kalah, itu salahmu: suporter dan pers menagihmu dua kali lipat.",
		"REVOLUCIÓN": "REVOLUSI",
		"Llega y manda: lleva al equipo a su dibujo el doble de rápido.": "Datang dan berkuasa: tim beralih ke formasinya dua kali lebih cepat.",
		"LO QUE FUNCIONA NO SE TOCA": "YANG JALAN JANGAN DIUBAH",
		"Respeta lo heredado: tarda el doble en llevar al equipo a su dibujo.": "Menghormati warisan: tim butuh dua kali lebih lama beralih ke formasinya.",

		"RASGOS DEL MÍSTER": "SIFAT PELATIH",
		"RASGOS": "SIFAT",
		"RASGO BUENO": "BAIK",
		"RASGO MALO": "BURUK",
		"Juega para un técnico con este rasgo para descubrirlo.": "Main untuk pelatih dengan sifat ini untuk mengungkapnya.",
		"Con la selección no se descubre: juega para un técnico de club con este rasgo.": "Tidak terungkap di timnas: main untuk pelatih klub dengan sifat ini.",
		"Los rasgos de los técnicos para los que has jugado. Cada uno se descubre con el primer partido a sus órdenes.": "Sifat para pelatih yang pernah kamu bela. Masing-masing terungkap lewat laga pertama di bawah asuhannya.",
		"Sin rasgos conocidos.": "Belum ada sifat yang diketahui.",
		"BUENOS": "BAIK",
		"MALOS": "BURUK",
		"Rasgo nuevo: {0}": "Sifat baru: {0}",



		"MOVER ESTO": "GESER INI",
		"choca con {0}": "menabrak {0}",
		"encima de {0}": "di atas {0}",






		"GANAS LA TANDA": "MENANG PENALTI",
		"ELIMINADO EN PENALES": "KALAH ADU PENALTI",
		"La metió {0}. Los otros diez cruzaron medio campo para decírselo.":
			"{0} memasukkannya. Sepuluh orang lain berlari melewati setengah lapangan untuk bilang itu padanya.",
		"La metiste tú. Los otros diez cruzaron medio campo para decírtelo.":
			"Kamu memasukkannya. Sepuluh orang lain berlari melewati setengah lapangan untuk bilang itu padamu.",
		"La sacó {0}. Los otros diez cruzaron medio campo para decírselo.":
			"{0} menepisnya. Sepuluh orang lain berlari melewati setengah lapangan untuk bilang itu padanya.",
		"La mandaron fuera. Los otros diez cruzaron medio campo igual.":
			"Bolanya melambung ke luar. Sepuluh orang lain tetap berlari melewati setengah lapangan.",
		"La metiste tú. Hasta el banquillo saltó al campo a por ti.":
			"Kamu memasukkannya. Bahkan bangku cadangan melompat ke lapangan menyambutmu.",
		"La metió {0}. Hasta el banquillo saltó al campo a por él.":
			"{0} memasukkannya. Bahkan bangku cadangan melompat ke lapangan menyambutnya.",
		"La sacó {0}. Hasta el banquillo saltó al campo a por él.":
			"{0} menepisnya. Bahkan bangku cadangan melompat ke lapangan menyambutnya.",
		"La mandaron fuera. Hasta el banquillo saltó al campo.":
			"Bolanya melambung ke luar. Bahkan bangku cadangan melompat ke lapangan.",
		"La fiesta la dan ellos. A ti te quedan cuarenta metros hasta el túnel.":
			"Pestanya milik mereka. Kamu masih harus jalan empat puluh meter ke lorong.",
		"Subcampeón": "Runner-up",

		"Campeón: {0}": "Juara: {0}",
		"La fiesta estaba lista. La están dando ellos, en el sitio donde ibas a estar tú.":
			"Pestanya sudah siap. Mereka yang merayakannya, di tempat yang seharusnya kamu berdiri.",

		"ÁNGULO": "SUDUT",

		"Presión alta": "Press tinggi",
		"Bloque bajo": "Blok rendah",
		"Marcaje al hombre": "Jaga ketat",
		"Bloque alto paciente": "Blok tinggi sabar",


		"Equilibrado": "Seimbang",

		"ÁRBITRO": "WASIT",
		"Tarjetero": "Doyan kartu",
		"Permisivo": "Longgar",
		"Deja seguir": "Biarkan jalan",
		"Pita todo": "Semua ditiup",

		"Encerrado en la banda": "Terkurung di sayap",
		"El último hombre": "Pemain terakhir",

		"Juega la {0}": "Main di {0}",

		"Su comisión baja del 8% al 3% en cada partido, y también en lo que"
		+ " cobras al firmar. Cara, pero cuanto antes la firmes, más te devuelve.":
			"Komisinya turun dari 8% menjadi 3% untuk setiap laga, juga untuk bonus saat teken. Mahal, tapi makin cepat kamu teken, makin banyak yang kembali.",

		"EL CHAVO TE COMIÓ EL PUESTO": "ANAK BARU AMBIL TEMPATMU",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la"
		+ " nómina: el tuyo. Te piden por las buenas un 20% de tu sueldo, y el"
		+ " vestuario ya sabe que te lo han pedido.":
			"Klub sudah mengamankan wonderkid dan tinggal butuh ruang di daftar gaji: milikmu. Kamu diminta baik-baik melepas 20% dari gajimu, dan ruang ganti sudah tahu mereka memintanya.",
		"DECIR QUE LES SOBRÓ CONFIANZA": "BILANG TIM TERLALU PEDE",
		"Los eliminó un equipo de dos categorías más abajo, en una cancha de mil"
		+ " personas y con el vestuario de local festejando junto al de ustedes.":
			"Kalian tersingkir oleh tim dua divisi di bawah, di stadion seribu penonton, dengan ruang ganti tuan rumah berpesta tepat di sebelah ruang ganti kalian.",

		"max_asist_eulCerebro de la Europa League": "Otak Piala Europa",
		"pichichi_x5Dueño del Area": "Penguasa Kotak",
		"pichichi_3_paisesEl Gol No Entiende de Idiomas":
			"Gol Tak Kenal Bahasa",
		"doblete_ligaGoles y Pases": "Gol dan Assist",
		"verdugo_paises_bajosVerdugo de Países Bajos": "Momok Belanda",
		"presentacion_40kCuarenta Mil": "Empat Puluh Ribu",
		"TE QUIEREN EN EL PLATÓ": "KAMU DIUNDANG KE TV",
		"UN MICRÓFONO CALIENTE": "MIKROFON MENYALA",
		"DESCANSAR EN CASA": "ISTIRAHAT SAJA",
		"SALIR CON EL EQUIPO": "KELUAR BARENG TIM",
		"¡Subiste a nivel {0}!": "Kamu naik ke level {0}!",
		"Tienes {0} puntos para repartir en tus habilidades.":
			"Kamu punya {0} poin untuk dibagi ke skillmu.",
		"un compañero": "rekan setim",
		"Le abriste la puerta a {0}. Atento al mercado.":
			"Kamu membuka pintu untuk {0}. Pantau bursa.",
		"Aún no hay ofertas. Se pueden mover fichas.":
			"Belum ada tawaran. Situasi masih bisa berubah.",
		"{0} {1} sobre la mesa.": "{0} {1} di meja.",
		"Marcas interesadas": "Merek-merek tertarik",
		"{0} {1} {2} ficharte.": "{0} {1} {2} merekrutmu.",
		"Convocado con tu selección": "Dipanggil timnasmu",
		"Entras en la lista ({0}). Jugarás las fechas FIFA.":
			"Kamu masuk daftar ({0}). Kamu akan main di jeda internasional.",
		"Te dan el alta": "Kamu dinyatakan pulih",
		"Recuperado. Vuelves a estar disponible para el próximo partido.":
			"Pulih. Kamu bisa main lagi di laga berikutnya.",
		"Lesión": "Cedera",
		"Estarás de baja {0} {1}.": "Kamu absen {0} {1}.",
		"Fuera de la lista": "Tak masuk daftar",
		"El seleccionador de {0} te deja fuera de la convocatoria.":
			"Pelatih timnas {0} tak memanggilmu.",
		"Vuelves a la selección": "Kembali ke timnas",
		"Regresas a la lista de {0} ({1}).": "Kamu kembali ke daftar {0} ({1}).",
		"Titular con tu selección": "Jadi inti di timnasmu",
		"Te ganas el puesto en el once de {0}.":
			"Kamu merebut tempat di tim inti {0}.",
		"Te quedas fuera": "Kamu tak dipanggil",
		"El técnico no te convoca para el próximo partido.":
			"Pelatih tak memanggilmu untuk laga berikutnya.",
		"Pierdes la titularidad": "Kamu kehilangan tempat",
		"Empezarás en el banquillo el próximo partido.":
			"Kamu mulai dari bangku cadangan di laga berikutnya.",
		"Vuelves al once": "Kembali ke tim inti",
		"El técnico te devuelve la titularidad.": "Pelatih mengembalikan tempatmu.",
		"Energía en rojo": "Energi di zona merah",
		"Vas al {0}%. Jugando así rindes menos y te arriesgas a lesionarte.":
			"Kamu di {0}%. Main begini performamu turun dan kamu berisiko cedera.",
		"Semana de derbi": "Pekan derbi",
		"Toca {0}. Gana y todo cuenta doble.":
			"Berikutnya: {0}. Menang dan semuanya dihitung dua kali.",
		"Logro: {0}": "Prestasi: {0}",
		"El técnico cuenta más contigo": "Pelatih makin mengandalkanmu",
		"Tu rol en el club sube a {0}.": "Peranmu di klub naik jadi {0}.",
		"El técnico te nombra capitán": "Pelatih menunjukmu jadi kapten",
		"Tu rendimiento manda en el vestuario: llevas el brazalete.":
			"Performamu memimpin ruang ganti: kamu memakai ban kapten.",
		"Te quitan el brazalete": "Ban kaptenmu dicopot",
		"Otro compañero rinde por encima de ti esta temporada.":
			"Rekan setim lain tampil di atasmu musim ini.",
		", {0} goles": ", {0} gol",
		"Fuiste la figura ({0} de nota{1}).":
			"Kamu bintang laga (rating {0}{1}).",
		"Media {0}: el mejor de tu liga este mes (listón {1}).":
			"Rating {0}: terbaik di ligamu bulan ini (batas {1}).",
		"Premio de la temporada {0}.": "Penghargaan musim {0}.",
		"¡Campeón de Liga!": "Juara Liga!",
		"Levantaste la liga con tu club.": "Kamu mengangkat trofi liga bersama klubmu.",
		"¡Ascenso!": "Promosi!",
		"Subes a {0} con tu club.": "Kamu naik ke {0} bersama klubmu.",
		"Descenso a {0}": "Degradasi ke {0}",
		"Ganar la copa nacional.": "Menangkan piala domestik.",
		"Eres campeón de Europa.": "Kamu juara Eropa.",
		"Fase final de Champions": "Fase gugur Piala Elite",

		"Entraste en el ONCE IDEAL de la liga": "Kamu masuk BEST XI liga",
		"¡Campeón de Europa League!": "Juara Piala Europa!",
		"Ganas Europa y con ella la plaza para la próxima Champions.":
			"Kamu juara Eropa, dan dengannya dapat tempat di Piala Elite musim depan.",
		"Fase final de Europa League": "Fase gugur Piala Europa",
		"¡Campeón del Mundo de Clubes!": "Juara Dunia Antarklub!",
		"El título más grande a nivel de club.": "Gelar terbesar di level klub.",
		"Objetivo cumplido": "Target tercapai",
		"El club queda contento con tu temporada.": "Klub puas dengan musimmu.",
		"Objetivo no cumplido": "Target gagal",
		"El club esperaba más. Sube la presión.":
			"Klub berharap lebih. Tekanan naik.",
		"El club te pone en venta por no cumplir":
			"Klub menjualmu karena target tak tercapai",
		"El club te pone en venta": "Klub menjualmu",
		"Dos temporadas sin dar lo que firmaste. En {0} escuchan ofertas por ti.":
			"Dua musim tak memenuhi kontrakmu. {0} mendengarkan tawaran untukmu.",
		"El club te buscará minutos fuera": "Klub akan mencarikan menit bermain di tempat lain",
		"El club te buscará sitio fuera": "Klub akan mencarikan tempat di klub lain",
		"No cumpliste lo que te pidieron y en {0} creen que necesitas jugar. En el próximo mercado te buscarán una cesión.":
			"Kamu tak memenuhi yang diminta, dan {0} menilai kamu perlu bermain. Di bursa berikutnya mereka akan mencarikan pinjaman.",
		"Contrato en el último año": "Kontrak di tahun terakhir",
		"Renueva o escucha ofertas antes de quedar libre.":
			"Perpanjang atau dengarkan tawaran sebelum jadi pemain bebas.",
		"Se acabó: te retiras a los {0}": "Sudah selesai: kamu pensiun di usia {0}",
		"Mercado de verano abierto": "Bursa musim panas dibuka",
		"{0}: OBJETIVO CUMPLIDO": "{0}: TARGET TERCAPAI",
		"{0} no renueva, y no volverá en {1} temporadas":
			"{0} tak memperpanjang, dan tak akan kembali selama {1} musim",
		"{0} no renueva: tu club no juega en Europa": "{0} tak memperpanjang: klubmu tak main di Eropa",
		"{0}: objetivo a {1} por tus {2} jornadas de baja":
			"{0}: target turun ke {1} karena kamu absen {2} pekan",
		"{0} no renueva": "{0} tidak memperpanjang",
		"Los años pesan: -{0} en lo físico": "Usia mulai terasa: -{0} fisik",
		"Los años pesan: -{0} en lo físico y -{1} en lo técnico": "Usia mulai terasa: -{0} fisik, -{1} teknik",
		"Los años pesan: -{0} en lo técnico": "Usia mulai terasa: -{0} teknik",
		"Terminar {0} o mejor en la liga.": "Finis peringkat {0} atau lebih baik di liga.",
		"Dar {0} asistencias.": "Buat {0} assist.",
		"Jugar {0} partidos.": "Main {0} pertandingan.",
		"Promediar {0} de nota.": "Rata-rata rating {0}.",
		"Marcar {0} goles.": "Cetak {0} gol.",
		"Preguntaron por ti": "Ada yang menanyakanmu",
		"{0} te ha hecho una oferta.": "{0} mengajukan tawaran untukmu.",
		"Un club": "Sebuah klub",
		"Mercado de invierno abierto": "Bursa musim dingin dibuka",
		"Se retiran de la puja": "Mereka mundur dari perebutan",
		"Rechazaste una oferta": "Kamu menolak tawaran",
		"Dijiste no a {0}. Se busca otro destino para la próxima jornada.":
			"Kamu menolak {0}. Tujuan baru dicarikan untuk pekan depan.",
		"Nadie ocupa el hueco": "Tak ada yang mengisi kekosongan",
		"Rechazaste y de momento no ha llegado nadie más.":
			"Kamu menolak, dan sejauh ini belum ada yang lain datang.",
		"{0} ya no cuenta contigo: buscan a otro.":
			"{0} tak lagi menginginkanmu: mereka mengincar pemain lain.",
		"Enfrían el interés": "Minat mendingin",
		"{0} se baja tras tu último partido.": "{0} mundur setelah laga terakhirmu.",
		"Último día de mercado": "Hari terakhir bursa",
		"{0} {1} sobre la mesa. Mañana se cierra.":
			"{0} {1} di meja. Besok bursa ditutup.",
		"Nueva oferta": "Tawaran baru",
		"{0} entra en la puja por ti.": "{0} ikut berebut mendapatkanmu.",
		"El club": "Klub",
		"mejor ficha": "gaji lebih baik",
		"ser titular": "jadi pemain inti",
		"Negociación abierta": "Negosiasi dibuka",
		"Pediste {0} a {1}. Te responden en la próxima jornada.":
			"Kamu minta {0} ke {1}. Mereka menjawab pekan depan.",
		"sube la ficha a ${0}/partido": "menaikkan gajimu jadi ${0}/laga",
		"acepta ficharte como {0}": "setuju merekrutmu sebagai {0}",
		"Ceden en la negociación": "Mereka mengalah",
		"Rompen la negociación": "Negosiasi gagal",
		"{0} retira su oferta: te apretaste de más.":
			"{0} menarik tawarannya: kamu menekan terlalu keras.",
		"Se plantan": "Mereka bertahan",
		"{0} mantiene su oferta tal cual. No hay más margen.":
			"{0} tetap pada tawarannya. Tak ada ruang lagi.",
		"Rumores de mercado": "Kabar bursa",
		"{0} pregunta por ti de cara al mercado de invierno.":
			"{0} menanyakanmu menjelang bursa musim dingin.",
		"El club necesita venderte": "Klub perlu menjualmu",
		"En {0} dicen que tu traspaso les cuadra el año. Puedes negarte, pero no te lo"
		+ " van a agradecer. Decide en MERCADO.":
			"Di {0} mereka bilang transfermu menyeimbangkan keuangan tahun ini. Kamu boleh menolak, tapi mereka tidak akan berterima kasih. Putuskan di BURSA.",
		"el club": "klub",
		"Aceptas salir": "Kamu setuju pergi",
		"El club te ofrece a quien pregunte. Busca destino en MERCADO.":
			"Klub menawarkanmu ke siapa pun yang bertanya. Cari tujuan di BURSA.",
		"Te niegas a salir": "Kamu menolak pergi",
		"Te quedas, pero el club contaba con ese traspaso y se nota en el vestuario.":
			"Kamu bertahan, tapi klub sudah mengandalkan uang transfer itu dan ruang ganti merasakannya.",
		"El club te busca minutos": "Klub mencarikanmu menit bermain",
		"En {0} no vas a jugar y lo saben: te ofrecen salir CEDIDO para que juegues."
		+ " Puedes negarte, pero te quedas donde estás. Decide en MERCADO.":
			"Di {0} kamu tak akan main dan mereka tahu itu: kamu ditawari PINJAMAN supaya bisa main. Boleh menolak, tapi kamu tetap di sini. Putuskan di BURSA.",
		"Te niegas a salir cedido": "Kamu menolak dipinjamkan",
		"Te quedas. El club te buscó minutos y dijiste que no: esta temporada vas a"
		+ " mirar muchos partidos desde fuera.":
			"Kamu bertahan. Klub sudah mencarikanmu menit bermain dan kamu bilang tidak: musim ini kamu akan lebih sering menonton dari luar lapangan.",
		"El club deja de contar contigo: buscan salida":
			"Klub tak lagi mengandalkanmu: mereka ingin kamu pergi",
		"El club deja de esperarte": "Klub berhenti menunggumu",
		"Dos temporadas sin crecer y sin sitio en el equipo: {0} te pone en la puerta"
		+ " de salida y no te va a renovar.":
			"Dua musim tanpa berkembang dan tanpa tempat di tim: {0} menunjukkan pintu keluar dan tak akan memperpanjang kontrakmu.",
		"Vuelve de su cesión": "Kembali dari pinjaman",
		"{0} regresa al vestuario tras un año jugando fuera.":
			"{0} kembali ke ruang ganti setelah setahun bermain di luar.",
		"Un canterano": "Pemain akademi",
		"Sale cedido": "Dipinjamkan",
		"{0} se va cedido a {1} por una temporada.":
			"{0} dipinjamkan ke {1} selama semusim.",
		"Llega cedido": "Datang sebagai pinjaman",
		"{0} ({1}) llega cedido desde {2}.": "{0} ({1}) datang dengan status pinjaman dari {2}.",
		"Sube uno de la cantera": "Naik dari akademi",
		"{0} ({1}) se queda con el hueco en el primer equipo.":
			"{0} ({1}) mengisi tempat di tim utama.",
		"Tu club ficha": "Klubmu merekrut",
		"Llega {0} ({1}) desde {2}.": "{0} ({1}) datang dari {2}.",
		"El descenso vacía el vestuario": "Degradasi mengosongkan ruang ganti",
		"{0} ({1}) se va: el club necesita hacer caja.":
			"{0} ({1}) pergi: klub butuh uang.",
		"Se va un compañero": "Rekan setim pergi",
		"{0} deja el vestuario: firma por {1}.":
			"{0} meninggalkan ruang ganti: teken kontrak di {1}.",
		"El fichaje del mercado": "Transfer bursa ini",
		"{0} pasa de {1} a {2} por ${3}.": "{0} pindah dari {1} ke {2} seharga ${3}.",




		"Se mueve tu vestuario": "Ruang gantimu berubah",
		"Llegan {0}. Se van {1}.": "Masuk: {0}. Keluar: {1}.",
		"Llegan {0}.": "Masuk: {0}.",
		"Se vacía tu vestuario": "Ruang gantimu kosong",
		"Se van {0}.": "Keluar: {0}.",
		"Cesiones en tu club": "Pinjaman di klubmu",
		"Llegan cedidos {0}. Salen cedidos {1}.":
			"Masuk pinjaman: {0}. Keluar pinjaman: {1}.",
		"Llegan cedidos {0}.": "Masuk pinjaman: {0}.",
		"Salen cedidos {0}.": "Keluar pinjaman: {0}.",
		"El mercado se movió": "Bursa ramai",
		"{0} traspasos en el mundo. Los tienes en MERCADO.":
			"{0} transfer di dunia. Semuanya ada di BURSA.",
		"{0} traspasos en el mundo. El más caro: {1} a {2} por ${3}.":
			"{0} transfer di dunia. Termahal: {1} ke {2} seharga ${3}.",
		"Fichaste por un club nuevo": "Kamu pindah ke klub baru",
		"Te incorporas a {0}. Empiezas de cero en el vestuario.":
			"Kamu bergabung dengan {0}. Di ruang ganti, kamu mulai dari nol.",
		"tu nuevo club": "klub barumu",
		"Tu contrato terminó: eres AGENTE LIBRE":
			"Kontrakmu habis: kamu PEMAIN BEBAS",
		"Eres agente libre": "Kamu pemain bebas",
		"Tu contrato terminó. Elige tu próximo club.":
			"Kontrakmu habis. Pilih klub berikutnya.",
		"Firmaste como agente libre": "Kamu teken sebagai pemain bebas",
		"Fichas por {0} sin traspaso.": "Kamu gabung {0} tanpa biaya transfer.",
		"Fin de la cesión: vuelves a {0}": "Pinjaman berakhir: kamu kembali ke {0}",
		"Renovaste tu contrato": "Kamu memperpanjang kontrak",
		"Sigues en {0}: {1} {2} más.": "Kamu tetap di {0}: {1} {2} lagi.",
		"No renuevas: al escaparate": "Tak perpanjang: dipajang di etalase",
		"El club te pone en venta para no perderte gratis. Si te quedas, jugarás menos.":
			"Klub menawarkanmu ke klub lain agar tak kehilanganmu secara gratis. Kalau kamu bertahan, kamu akan lebih jarang main.",
		"Sin destinos de cesión": "Tak ada tujuan pinjaman",
		"Ningún club menor te quiere cedido ahora mismo.":
			"Tak ada klub kecil yang mau meminjammu saat ini.",
		"Pediste salir cedido": "Kamu minta dipinjamkan",
		"Clubes menores donde jugarías de titular. Elige en el MERCADO.":
			"Klub-klub kecil tempat kamu jadi pemain inti. Pilih di BURSA.",
		"Tu club quiere retenerte": "Klubmu ingin menahanmu",
		"{0} pone sobre la mesa una mejora de contrato para que te quedes.":
			"{0} menawarkan kontrak yang lebih baik supaya kamu bertahan.",
		"Tu club": "Klubmu",
		"Sin sitio en la selección de {0}": "Tak ada tempat di skuad {0}",
		"Titular de {0}": "Pemain inti {0}",
		"Convocado con {0}": "Dipanggil {0}",
		"¡{0} se clasificó al Mundial!": "{0} lolos ke Kejuaraan Dunia!",
		"{0} CAMPEÓN de la {1}… sin ti": "{0} JUARA {1}... tanpamu",
		"{0}: {1} CAMPEÓN, y tú sin jugar un minuto": "{0}: {1} JUARA, dan kamu tak main semenit pun",
		"{0} subcampeón de la {1} (sin ti)": "{0} runner-up {1} (tanpamu)",
		"{0}: {1} eliminada en {2} (sin ti)":
			"{0}: {1} tersingkir di {2} (tanpamu)",
		"{0} sin ti": "{0} tanpamu",
		"{0} se clasificó al Mundial (sin ti)":
			"{0} lolos ke Kejuaraan Dunia (tanpamu)",
		"¡CAMPEÓN DEL MUNDO con {0}!": "JUARA DUNIA bersama {0}!",
		"¡CAMPEÓN de la {0} con {1}!": "JUARA {0} bersama {1}!",
		"Subcampeón de la {0} con {1}": "Runner-up {0} bersama {1}",
		"{0}: eliminado en {1} con {2}": "{0}: tersingkir di {1} bersama {2}",
		"{0} con {1}": "{0} bersama {1}",
		"{0} se clasificó al Mundial": "{0} lolos ke Kejuaraan Dunia",
		"{0} no fue al Mundial": "{0} tidak ke Kejuaraan Dunia",
		"Mundial sin ti: {0} de {1}": "Kejuaraan Dunia tanpamu: {1}, {0}",
		"{0} sin ti: {1} de {2}": "{0} tanpamu: {2}, {1}",
		"{0} no se clasificó al Mundial": "{0} gagal lolos ke Kejuaraan Dunia",


		"natdieciseisavos": "32 besar",
		"natoctavos": "16 besar",
		"natcuartos": "perempat final",
		"natsemifinal": "semifinal",
		"natfinal": "final",
		"natfase de grupos": "fase grup",
		"natno clasificada": "tak lolos",
		"natcampeón": "juara",
		"natsubcampeón": "runner-up",
		"natronda": "ronde",
		"calluptitular": "pemain inti",
		"callupconvocado": "masuk skuad",
		"SUENA OTRO CLUB": "ADA KLUB LAIN",
		"ME INTERESARÍA": "AKU TERTARIK",
		"ESTOY COMPROMETIDO AQUÍ": "AKU SETIA DI SINI",
		"DOS CLUBES PREGUNTAN": "DUA KLUB BERTANYA",
		"Te ponen el micro delante: {0} y {1} preguntan por ti. ¿A cuál te irías? Lo que"
		+ " digas lo oye tu técnico.":
			"Mikrofon disodorkan ke mukamu: {0} dan {1} menanyakanmu. Kamu pilih yang mana? Pelatihmu ikut mendengar.",
		"ME IRÍA A {0}": "AKU KE {0}",
		"ME QUEDO EN {0}": "AKU TETAP DI {0}",
		"LESIONADO": "CEDERA",
		"Selección": "Timnas",
		"buzonMERCADO": "BURSA",
		"¡LOGRO DESBLOQUEADO!": "PRESTASI TERBUKA!",
		"¡ARQUETIPO DESBLOQUEADO!": "ARKETIPE TERBUKA!",
		"¡RASGO DESCUBIERTO!": "SIFAT DITEMUKAN!",
		"TOCA PARA CONTINUAR": "KETUK UNTUK LANJUT",
		"REGATEA Y REMATA": "DRIBEL & TEMBAK",
		"Puedes tirar ya. O jala desde dentro del círculo para conducir, vuelve al círculo y paras en seco: ahí apuntas con calma y tiras. Combinar regate y tiro es lo que abre a un defensa.": "Kamu bisa langsung menembak. Atau tarik dari dalam lingkaran untuk menggiring, kembali ke lingkaran dan berhenti mendadak: di situ kamu membidik dengan tenang lalu menembak. Memadukan dribel dan tembakan itulah yang membuka bek.",
		"MODO PASE": "MODE PASS",
		"Dentro del círculo, el mismo trazo es un pase. Jala hacia atrás y el balón sale hacia adelante, al compañero libre de la otra banda. Sin defensa encima, es la salida más segura.": "Di dalam lingkaran, gerakan yang sama jadi umpan. Tarik ke belakang dan bola meluncur ke depan, ke rekan yang bebas di sayap seberang. Tanpa bek di dekatmu, itu jalan keluar paling aman.",
		"EL RELEVO": "ESTAFET",
		"Si tu pase llega a un compañero fuera del área, pasas a jugar con él. Si cae dentro del área no hay control que valga: remata de primera.": "Kalau umpanmu sampai ke rekan di luar kotak penalti, kamu pindah main sebagai dia. Kalau jatuh di dalam kotak penalti, tak sempat dikontrol: dia langsung menembak.",
		"LA PANTALLA DE GOLPEO": "LAYAR TENDANGAN",
		"Soltaste la resortera: ahora eliges dónde tocar el balón. La costura marca el centro: ahí sale tenso. Cuanto más abajo la toques, más lo elevas; cuanto más al borde, menos potencia.": "Kamu melepas ketapel: sekarang pilih bagian bola yang disentuh. Jahitan menandai pusat: kena di situ, bola melaju datar. Makin ke bawah kamu menyentuh, makin tinggi bola terangkat; makin ke tepi, makin kecil tenaganya.",

		"Primera Mudanza": "Pindahan Pertama",
		"Subir de casa por primera vez.": "Tingkatkan rumahmu untuk pertama kali.",
		"Vida Acomodada": "Hidup Nyaman",
		"Llegar a vivir en una casa moderna.": "Pindah ke rumah modern.",
		"La Mansión": "Mansion",
		"Llegar a vivir en una mansión.": "Pindah ke sebuah mansion.",
		"Hogar, Dulce Hogar": "Rumahku Surgaku",
		"Amueblar tu casa con 10 adiciones.": "Lengkapi rumahmu dengan 10 tambahan.",
		"La Finca": "Perkebunan",
		"Llegar a vivir en una finca.": "Pindah ke sebuah perkebunan.",
		"Casa Llena": "Rumah Penuh",
		"Amueblar tu casa con 40 adiciones.": "Lengkapi rumahmu dengan 40 tambahan.",
		"La Casa Soñada": "Rumah Impian",
		"Amueblar tu casa con 80 adiciones.": "Lengkapi rumahmu dengan 80 tambahan.",


		"Hacer 10 puntos en la maquinita de tu casa.": "Raih 10 poin di mesin arkade rumahmu.",
		"Serpiente Legendaria": "Ular Legendaris",
		"¡TE TOCAN LAS LISAS!": "KAMU MAIN POLOS!",
		"¡TE TOCAN LAS RAYADAS!": "KAMU MAIN BELANG!",
		"Bullseye": "Bullseye",
		"Clavar un dardo en el mero centro de la diana.": "Tancapkan dart tepat di pusat papan.",
		"Ganar cinco retos de billar al vestuario en tu casa.":
			"Menangkan lima tantangan biliar melawan rekan setim di rumahmu.",

		"Buen Pulso": "Tangan Mantap",
		"Hacer 200 puntos en la diana de tu casa.": "Raih 200 poin di papan dart rumahmu.",
		"Mano de Seda": "Tangan Sutra",
		"Hacer 320 puntos en la diana de tu casa.": "Raih 320 poin di papan dart rumahmu.",
		"Nueve Dardos": "Sembilan Dart",
		"Hacer 400 puntos en la diana de tu casa.": "Raih 400 poin di papan dart rumahmu.",
		"La Mirada del Míster": "Tatapan Sang Pelatih",
		"Llegar a cien dominadas en el banquillo.": "Menimang bola seratus kali di bangku cadangan.",
		"Compañero de Vestuario": "Rekan Setim",
		"Agregar a tu primer amigo.": "Tambahkan teman pertamamu.",
		"La Peña": "Geng Sendiri",
		"Tener 5 amigos.": "Punya 5 teman.",
		"Hinchada Propia": "Suporter Sendiri",
		"Tener 10 amigos.": "Punya 10 teman.",
		"Sin Fronteras": "Tanpa Batas",
		"El Mejor del Grupo": "Terbaik di Grup",
		"Ser primero en LEGADO entre al menos 3 amigos.": "Jadi nomor satu dalam LEGACY di antara minimal 3 teman.",
		"Bola Ocho": "Bola Delapan",
		"Ganar tu primera partida de billar en casa.": "Menangkan frame biliar pertamamu di rumah.",
		"Mesa Limpia": "Meja Bersih",
		"Ganar una partida de billar sin que el rival meta una sola bola.":
			"Menangkan satu frame biliar tanpa lawan memasukkan satu bola pun.",
		"El Dueño de la Casa": "Tuan Rumah",
		"Ganaste cinco retos al vestuario en tu casa, entre la diana y la mesa.": "Kamu menang lima tantangan melawan rekan setim di rumahmu, lewat papan dart dan meja biliar.",
		"Hacer 50 puntos en la maquinita de tu casa.": "Raih 50 poin di mesin arkade rumahmu.",
		"Graduado de la Academia": "Lulusan Akademi",
		"Completar el entrenamiento de la Academia.": "Selesaikan latihan Akademi.",
		"Ocho Años":
			"Delapan Tahun",
		"Ocho temporadas con la misma persona.":
			"Delapan musim bersama orang yang sama.",
		"Media Naranja": "Belahan Jiwa",
		"Formalizar una relación.": "Resmikan sebuah hubungan.",
		"Vitrina Dorada": "Lemari Trofi Emas",
		"Desbloquear todos los logros épicos.": "Buka semua prestasi epik.",
		"¡Corten!": "Cut!",
		"Tumbar a un camarógrafo de un balonazo.": "Robohkan juru kamera dengan tendangan ngawur.",


		"¡Plumas!": "Bulu!",
		"Alcanzar a una paloma del campo de un balonazo.": "Kenai seekor merpati lapangan dengan tendangan ngawur.",


		"¡Agua Va!": "Air Muncrat!",
		"Reventar una cabeza de riego de un balonazo y que escupa torcida el resto del partido.":
			"Hancurkan kepala penyiram dengan tendangan hingga menyemprot miring sepanjang sisa laga.",
		"¡Remojón!": "Basah Kuyup!",
		"Tirarle la bebida a diez aficionados con balones que se van a la grada.":
			"Tumpahkan minuman sepuluh suporter dengan bola yang melambung ke tribun.",


		"¡Ahí Va la Bandeja!": "Nampan Melayang!",
		"Tumbarle la bandeja de comida al vendedor de la grada de un balonazo.":
			"Jatuhkan nampan makanan pedagang tribun dengan tendangan ngawur.",
		"¡LE TIRASTE LA COMIDA AL VENDEDOR!":
			"MAKANAN PEDAGANG MELAYANG!",
		"Le Callaste la Boca": "Kamu Bungkam Mereka",
		"Marcar después de que te abucheen desde la grada, en el mismo partido.":
			"Cetak gol setelah disoraki dari tribun, di laga yang sama.",
		"Ese Balón No Vuelve": "Bola Itu Tak Kembali",
		"Mandar un balón a la calle en un campo sin nada detrás del arco.":
			"Tendang bola ke jalan di stadion yang tak punya apa pun di belakang gawang.",
		"Cesión al Portero": "Oper Balik ke Kiper",
		"Pasarle el balón a tu propio portero en vez de tirar a puerta.":
			"Umpan bola ke kipermu sendiri alih-alih menembak.",
		"¡A por agua!": "Ambil Air!",
		"Tirar las botellas de agua del portero de un balonazo.":
			"Jatuhkan botol minum kiper dengan tendangan ngawur.",
		"La mano del derbi": "Jabat Tangan Derby",
		"Descubrir el apretón de manos de los técnicos al acabar un derbi.":
			"Temukan jabat tangan para pelatih seusai derby.",
		"Mano de hierro": "Genggaman Besi",
		"Ganarle el apretón de manos al técnico rival al acabar un derbi.":
			"Menangkan adu jabat tangan dengan pelatih lawan seusai derby.",
		"¡Una foto y me voy!": "Satu Foto Saja!",
		"Un aficionado salta al campo en una final para tomarse una foto contigo.":
			"Seorang suporter masuk lapangan saat final untuk berfoto bersamamu.",
		"¡Cristales!": "Kaca Pecah!",
		"Reventar el cristal de un palco de un balonazo.": "Pecahkan kaca boks VIP dengan tendangan ngawur.",
		"Sin Piedad con el Chaval": "Tanpa Ampun untuk Bocah",
		"Tumbar al recogepelotas de un balonazo.": "Robohkan bocah pemungut bola dengan tendangan ngawur.",
		"De Espaldas a la Copa": "Membelakangi Piala",
		"Perder una final y ver al rival levantar el título.": "Kalah di final dan lihat rival mengangkat gelar.",

		"{0} decidió la final. Su nombre se queda contigo.": "{0} menentukan final. Namanya akan selalu kamu ingat.",
		"{0} metió el penalti que decidió la final. Su nombre se queda contigo.":
			"{0} mencetak penalti yang menentukan final. Namanya akan selalu kamu ingat.",
		"{0} paró el penalti que decidió la final. Su nombre se queda contigo.":
			"{0} menyelamatkan penalti yang menentukan final. Namanya akan selalu kamu ingat.",
		"REVANCHA · TEMPORADA {0}": "BALAS DENDAM · MUSIM {0}",
		"{0} te quitó la final de la temporada {1} ({2}). Esta noche los que miran son ellos.":
			"{0} merebut final musim {1} ({2}) darimu. Malam ini merekalah yang menonton.",
		"Final vengada en la temporada {0}": "Final terbalas di musim {0}",
		"Te ganó la final de la temporada {0}": "Mengalahkanmu di final musim {0}",
		"Revancha": "Balas Dendam",
		"Ganar una final al club que te quitó otra.":
			"Menangkan final melawan klub yang pernah merebut final darimu.",
		"Tres Pases, Tres Goles": "Tiga Umpan, Tiga Gol",
		"Darle tres asistencias al mismo compañero en un partido.": "Beri tiga assist ke rekan setim yang sama dalam satu laga.",
		"Un Balón Cada Uno": "Satu Bola Masing-Masing",
		"Hacer hat-trick en el partido en que le das tres asistencias al mismo compañero.": "Cetak hat-trick di laga saat kamu memberi tiga assist ke rekan setim yang sama.",
		"Piel Nueva": "Kulit Baru",
		"Ver la presentación de las equipaciones de la temporada.": "Tonton peluncuran jersey musim ini.",
		"Primer Gol": "Gol Pertama",


		"El Año Perfecto": "Tahun Sempurna",
		"En PRIMERA y en una sola temporada: liga, copa y Champions, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de la Champions.":
			"Di KASTA TERTINGGI dalam satu musim: liga, piala, dan Piala Elite, plus Pemain Terbaik, MVP dan top skor liga, serta MVP dan sepatu emas Piala Elite.",
		"De la Camilla al Gol": "Dari Tandu ke Gol",
		"Volver de una lesión grave y marcar en tu regreso.":
			"Pulih dari cedera parah dan cetak gol saat kembali.",
		"Marcar tu primer gol.": "Cetak gol pertamamu.",
		"Marcar rematando un córner.": "Cetak gol dari tendangan sudut.",
		"Marcar directo desde el córner, sin que nadie toque el balón.":
			"Cetak gol langsung dari tendangan sudut, tanpa ada yang menyentuh bola.",
		"Marcar un penal picado: cambiar a modo CENTRO antes de golpear.":
			"Cetak gol penalti chip: ganti ke mode SILANG sebelum menendang.",
		"Goleador": "Pencetak Gol",
		"10 goles en tu carrera.": "10 gol di kariermu.",
		"Artillero": "Penembak Jitu",
		"50 goles en tu carrera.": "50 gol di kariermu.",
		"Centenario": "Centurion",
		"100 goles en tu carrera.": "100 gol di kariermu.",
		"Killer": "Killer",
		"250 goles en tu carrera.": "250 gol di kariermu.",
		"Máquina de Goles": "Mesin Gol",
		"500 goles en tu carrera.": "500 gol di kariermu.",
		"Asistente": "Pengumpan",
		"Dar tu primera asistencia.": "Buat assist pertamamu.",
		"Cerebro": "Maestro",
		"100 asistencias en tu carrera.": "100 assist di kariermu.",
		"Doblete": "Brace",
		"2 goles en un mismo partido.": "2 gol dalam satu laga.",
		"Hat-Trick": "Hat-Trick",
		"3 goles en un mismo partido.": "3 gol dalam satu laga.",
		"4 goles en un mismo partido.": "4 gol dalam satu laga.",
		"Manita": "Lima Gol",
		"5 goles en un mismo partido.": "5 gol dalam satu laga.",
		"Sangre Fría": "Darah Dingin",
		"Marcar tu primer penalti.": "Cetak penalti pertamamu.",
		"Especialista de Penales": "Raja Penalti",
		"25 penaltis marcados.": "25 penalti dicetak.",
		"Maestro de la Falta": "Maestro Tendangan Bebas",
		"Marcar de tiro libre directo.": "Cetak gol dari tendangan bebas langsung.",
		"El Muro No Existe": "Tembok Apa?",
		"10 goles de tiro libre.": "10 gol tendangan bebas.",
		"Jugada de Estrategia": "Skema Bola Mati",
		"Por Debajo": "Lewat Bawah",
		"Marcar un tiro libre por debajo de la barrera.": "Cetak gol tendangan bebas lewat bawah pagar betis.",
		"Gol Olímpico": "Gol Olimpico",

		"Testarazo": "Sundulan Maut",
		"Marcar de cabeza.": "Cetak gol dengan sundulan.",
		"Sin Dejarla Caer": "Tak Biarkan Jatuh",
		"Marcar de volea.": "Cetak gol dengan voli.",
		"Chilena de Antología": "Tendangan Salto Epik",
		"Marcar de chilena.": "Cetak gol dengan tendangan salto.",
		"Perro en la Cancha": "Anjing di Lapangan",
		"Que un perro se meta en la cancha durante un partido tuyo.":
			"Seekor anjing masuk lapangan saat kamu bermain.",
		"Marcaste de cabeza tras un córner.": "Kamu cetak gol sundulan dari tendangan sudut.",
		"Campeón": "Juara",
		"Ganar tu primera liga.": "Menangkan gelar liga pertamamu.",
		"Rey de Primera": "Raja Kasta Tertinggi",
		"Campeón de la máxima categoría.": "Juara kasta tertinggi.",
		"Subir de categoría.": "Naik divisi.",
		"Copa en Vitrina": "Piala di Lemari",
		"Rey de Europa": "Raja Eropa",
		"Ganar la Champions continental.": "Menangkan Piala Elite.",
		"Ganar el Mundial de Clubes.": "Menangkan Kejuaraan Dunia Klub.",
		"Noche Europea": "Malam Eropa",
		"Marcar en un partido continental.": "Cetak gol di laga kompetisi benua.",
		"Orgullo Nacional": "Kebanggaan Nasional",
		"Marcar con tu selección.": "Cetak gol bersama timnasmu.",
		"Asistencia Internacional": "Assist Internasional",
		"Dar una asistencia con tu selección.": "Buat assist bersama timnasmu.",
		"Héroe Mundialista": "Pahlawan Kejuaraan Dunia",
		"Marcar en el Mundial.": "Cetak gol di Kejuaraan Dunia.",
		"Gloria Continental": "Kejayaan Benua",
		"Ganar la Euro/Copa América con tu país.": "Menangkan turnamen Eropa/Amerika Selatan bersama negaramu.",
		"Ganar el Mundial con tu selección.": "Menangkan Kejuaraan Dunia bersama timnasmu.",
		"El Mejor del Mundo": "Terbaik di Dunia",
		"Ganar el Balón de Oro.": "Raih Pemain Terbaik.",
		"Tríada Dorada": "Trio Emas",
		"3 Balones de Oro.": "3 kali Pemain Terbaik.",
		"El Que Te Lo Quitó": "Yang Merebutnya",
		"Quedar segundo en el Balón de Oro, justo detrás del ganador.": "Finis kedua di Pemain Terbaik, tepat di belakang pemenang.",
		"Nivel Plata": "Level Perak",
		"Llegar a ser jugador de plata: media 65 en una carrera.":
			"Jadi pemain perak: OVR 65 dalam satu karier.",
		"Nivel Oro": "Level Emas",
		"Llegar a ser jugador de oro: media 75 en una carrera.": "Jadi pemain emas: OVR 75 dalam satu karier.",
		"Nivel Diamante": "Level Berlian",
		"Llegar a ser jugador de diamante: media 85 en una carrera.":
			"Jadi pemain berlian: OVR 85 dalam satu karier.",
		"Clase Mundial": "Kelas Dunia",
		"Media de habilidades de nivel élite (90).": "Rata-rata skill level elite (90).",
		"Actuación Perfecta": "Penampilan Sempurna",
		"Un partido con nota 9.5 o más.": "Satu laga dengan rating 9.5 atau lebih.",
		"¿El Mejor de la Historia?": "Terhebat Sepanjang Masa?",
		"Liga, copa, continental, Balón de Oro y goleo en una misma temporada.":
			"Liga, piala, piala benua, Pemain Terbaik, dan top skor dalam satu musim.",
		"Trotamundos": "Petualang",
		"Ganar liga con 3 clubes distintos.": "Menangkan liga bersama 3 klub berbeda.",
		"El Conquistador": "Sang Penakluk",
		"Ganar la 1ª división de las cinco grandes: España, Inglaterra, Italia, Alemania y Francia.":
			"Menangkan kasta tertinggi lima liga besar: Spanyol, Inggris, Italia, Jerman, dan Prancis.",
		"La Vuelta al Mundo": "Keliling Dunia",
		"Ganar la liga en 3 confederaciones distintas (Europa, América, Asia…).":
			"Menangkan liga di 3 konfederasi berbeda (Eropa, Amerika, Asia...).",
		"Un Solo Amor": "Satu Cinta",
		"5 títulos de liga con un mismo club.": "5 gelar liga bersama klub yang sama.",
		"Mi Único Amor": "Setia Satu Klub",
		"Diez temporadas o más en el mismo club sin fichar nunca por otro; una cesión no lo rompe.":
			"Sepuluh musim atau lebih di klub yang sama tanpa pernah pindah ke klub lain; pinjaman tidak memutusnya.",
		"Uno Siempre Vuelve": "Selalu Ada Jalan Pulang",
		"Volver a fichar por un club en el que ya hayas jugado antes.":
			"Teken lagi di klub yang pernah kamu bela.",
		"Dinastía": "Dinasti",
		"Ganar la liga 3 temporadas seguidas.": "Menangkan liga 3 musim beruntun.",
		"Amo de Europa": "Penguasa Eropa",
		"Ganar la Champions con 3 clubes distintos.": "Menangkan Piala Elite bersama 3 klub berbeda.",
		"Coleccionista de Títulos": "Kolektor Gelar",







		"Ganar la Copa de Campeones continental.": "Menangkan Piala Elite.",
		"Ganar la Euro/Torneo Sudamericano con tu país.":
			"Menangkan turnamen Eropa/Amerika Selatan bersama negaramu.",
		"Ganar el Jugador del Año.": "Raih Pemain Terbaik.",
		"3 Premios al Mejor.": "3 kali Pemain Terbaik.",
		"Liga, copa, continental, Jugador del Año y goleo en una misma temporada.": "Liga, piala, piala benua, Pemain Terbaik, dan top skor dalam satu musim.",
		"Ganar la Copa de Campeones con 3 clubes distintos.": "Menangkan Piala Elite bersama 3 klub berbeda.",
		"Ganar los seis grandes: liga, copa, Copa de Campeones, Mundial de Clubes, continental y Mundial.":
			"Menangkan keenam gelar besar: liga, piala, Piala Elite, Kejuaraan Dunia Klub, piala benua, dan Kejuaraan Dunia.",
		"Rey de Copa Europa": "Raja Piala Europa",
		"Ganar la Copa Europa.": "Menangkan Piala Europa.",
		"Rey de la Copa Conferencia": "Raja Piala Challenge",
		"Ganar la Copa Conferencia.": "Menangkan Piala Challenge.",
		"Ganar el Bota de la Liga.": "Raih Sepatu Emas Liga.",
		"Bota de la Copa de Campeones": "Sepatu Emas Piala Elite",
		"Ser el máximo goleador de la Copa de Campeones.": "Jadi top skor Piala Elite.",
		"Bota de la Copa Europa": "Sepatu Emas Piala Europa",
		"Ser el máximo goleador de la Copa Europa.": "Jadi top skor Piala Europa.",
		"Bota de la Copa Conferencia": "Sepatu Emas Piala Challenge",
		"Ser el máximo goleador de la Copa Conferencia.": "Jadi top skor Piala Challenge.",
		"Máximo asistente de la Copa de Campeones.": "Raja assist Piala Elite.",
		"Cerebro de la Copa Europa": "Playmaker Piala Europa",
		"Máximo asistente de la Copa Europa.": "Raja assist Piala Europa.",
		"Máximo goleador de tu liga Y de la Copa de Campeones en la misma temporada.": "Top skor ligamu DAN Piala Elite di musim yang sama.",
		"Ganar los seis grandes: liga, copa, Champions, Mundial de Clubes, continental y Mundial.":
			"Menangkan keenam gelar besar: liga, piala, Piala Elite, Kejuaraan Dunia Klub, piala benua, dan Kejuaraan Dunia.",
		"Leal de Corazón": "Setia dari Hati",
		"500 partidos con un mismo club.": "500 laga bersama klub yang sama.",
		"Círculo Completo": "Lingkaran Penuh",
		"Retirarte en el club donde empezaste.": "Pensiun di klub tempat kamu memulai.",
		"Hasta el Final": "Sampai Akhir",
		"Jugar hasta el final: que el calendario te retire a ti.": "Main sampai akhir: biarkan kalender yang memensiunkanmu.",
		"Salir a Tiempo": "Pergi Saat Puncak",
		"El Cuerpo Dijo Basta": "Tubuh Menyerah",
		"Que una lesión grave de veterano te retire antes de tiempo.":
			"Cedera parah di usia veteran memaksamu pensiun lebih awal.",
		"Colgar las botas por decisión propia, antes de que te lo digan.":
			"Gantung sepatu atas keputusan sendiri, sebelum ada yang menyuruhmu.",
		"Leyenda del Club": "Legenda Klub",
		"Entrar al top 5 de leyendas de tu club.": "Masuk 5 besar legenda klubmu.",
		"Cara a Cara": "Tatap Muka",
		"Entre los Grandes": "Di Antara yang Terbesar",
		"Dejar atrás a 5 leyendas.": "Lampaui 5 legenda.",
		"Nombre Propio": "Nama Sendiri",
		"Dejar atrás a 15 leyendas.": "Melampaui 15 legenda.",
		"Mejor de la Historia": "Terbaik Sepanjang Masa",
		"Nadie en la historia hizo más goles + asistencias de élite que tú.": "Tak ada yang mencetak lebih banyak gol + assist elite darimu sepanjang sejarah.",
		"Por Encima de Todos": "Di Atas Semuanya",
		"En los Libros": "Tercatat Sejarah",
		"Batir tu primer récord histórico.": "Pecahkan rekor bersejarah pertamamu.",
		"Hombre de Récords": "Pemecah Rekor",
		"Batir 10 récords históricos.": "Pecahkan 10 rekor bersejarah.",
		"Dejar atrás a 30 leyendas de la historia.": "Melampaui 30 legenda sepanjang sejarah.",
		"Veterano": "Veteran",
		"100 partidos disputados.": "100 laga dimainkan.",
		"Inoxidable": "Tahan Banting",
		"300 partidos disputados.": "300 laga dimainkan.",
		"Un Lustro": "Lima Tahun",
		"5 temporadas completadas.": "5 musim selesai.",
		"Una Década": "Satu Dekade",
		"10 temporadas completadas.": "10 musim selesai.",
		"Leyenda": "Legenda",
		"Alcanzar el escalón LEYENDA.": "Capai tingkat LEGENDA.",
		"Inmortal": "Abadi",
		"Alcanzar el escalón INMORTAL.": "Capai tingkat ABADI.",
		"Curtido en la Cantera": "Ditempa Kasta Bawah",
		"Completar una temporada entera en Tercera División.": "Selesaikan satu musim penuh di Divisi Tiga.",
		"Veterano de Segunda": "Veteran Divisi Dua",
		"Completar una temporada entera en Segunda División.": "Selesaikan satu musim penuh di Divisi Dua.",
		"Bautizo en Primera": "Debut di Kasta Atas",
		"Completar una temporada entera en Primera División.": "Selesaikan satu musim penuh di kasta tertinggi.",
		"Rey de Europa League": "Raja Piala Europa",
		"Ganar la Europa League.": "Menangkan Piala Europa.",
		"Pichichi": "Top Skor Liga",
		"Ganar el Pichichi de la Liga.": "Jadi top skor Liga.",
		"bota_championsBota de la Champions": "Sepatu Emas Piala Elite",
		"Ser el máximo goleador de la Champions.": "Jadi top skor Piala Elite.",
		"bota_europaBota de la Europa League": "Sepatu Emas Piala Europa",
		"Ser el máximo goleador de la Europa League.": "Jadi top skor Piala Europa.",
		"Cerebro de la Liga": "Otak Liga",
		"Máximo asistente de la Liga.": "Pemberi assist terbanyak Liga.",
		"Cerebro de Europa": "Otak Eropa",
		"Máximo asistente de la Champions.": "Pemberi assist terbanyak Piala Elite.",
		"nombre del logro max_asist_eulCerebro de la Europa League": "Otak Piala Europa",
		"Máximo asistente de la Europa League.": "Pemberi assist terbanyak Piala Europa.",
		"COLISIÓN: misma clave ya existe en el dominio 'match' (trofeos) con este MISMO"
		+ " valor; se repite idéntica a propósitoBota de Oro del Mundial":
			"Sepatu Emas Kejuaraan Dunia",
		"Máximo goleador del Mundial con tu selección.":
			"Top skor Kejuaraan Dunia bersama timnasmu.",
		"Killer de la Liga": "Killer Liga",
		"Ganar 3 veces el trofeo de máximo goleador de tu liga.": "Menangkan trofi top skor ligamu 3 kali.",
		"'dueño del área' -> quien manda dentro del área; 'BOX' es el área en inglés"
		+ " británicoDueño del Area":
			"Raja Kotak Penalti",
		"Ganar 5 veces el trofeo de máximo goleador de tu liga.": "Menangkan trofi top skor ligamu 5 kali.",
		"El Que Reparte": "Sang Penyuplai",
		"Ganar 3 veces el trofeo de máximo asistente de tu liga.": "Menangkan trofi assist terbanyak ligamu 3 kali.",
		"Goleador Sin Fronteras": "Gol Tanpa Batas",
		"Ser máximo goleador de la liga en 2 países distintos.":
			"Jadi top skor liga di 2 negara berbeda.",
		"el chiste: el gol se entiende en cualquier idiomaEl Gol No Entiende de"
		+ " Idiomas":
			"Gol Tak Kenal Bahasa",
		"Ser máximo goleador de la liga en 3 países distintos.":
			"Jadi top skor liga di 3 negara berbeda.",
		"cabeza de ambas tablas (goles y asistencias); 'Goals & Assists' no cabe en 13"
		+ " caracteresGoles y Pases":
			"Gol & Assist",
		"Máximo goleador Y máximo asistente de tu liga en la misma temporada.":
			"Top skor DAN pemberi assist terbanyak ligamu dalam musim yang sama.",
		"Nadie Marca Más": "Tak Tertandingi",
		"Máximo goleador de tu liga Y de la Champions en la misma temporada.":
			"Top skor ligamu DAN Piala Elite dalam musim yang sama.",
		"Estrella del Partido": "Bintang Laga",
		"Ser elegido Jugador del Partido.": "Terpilih jadi Pemain Terbaik Laga.",
		"jugador_mesJugador del Mes": "Pemain Bulan Ini",
		"Ganar el Jugador del Mes.": "Menangkan Pemain Bulan Ini.",
		"Verdugo de España": "Momok Spanyol",
		"Vencer a todos los clubes de España (las tres divisiones).":
			"Kalahkan semua klub Spanyol (ketiga divisinya).",
		"Verdugo de Inglaterra": "Momok Inggris",
		"Vencer a todos los clubes de Inglaterra (las tres divisiones).":
			"Kalahkan semua klub Inggris (ketiga divisinya).",
		"Verdugo de Italia": "Momok Italia",
		"Vencer a todos los clubes de Italia (las tres divisiones).":
			"Kalahkan semua klub Italia (ketiga divisinya).",
		"Verdugo de Alemania": "Momok Jerman",
		"Vencer a todos los clubes de Alemania (las tres divisiones).":
			"Kalahkan semua klub Jerman (ketiga divisinya).",
		"Verdugo de Francia": "Momok Prancis",
		"Vencer a todos los clubes de Francia (las tres divisiones).":
			"Kalahkan semua klub Prancis (ketiga divisinya).",
		"Verdugo de Portugal": "Momok Portugal",
		"Vencer a todos los clubes de Portugal (las tres divisiones).":
			"Kalahkan semua klub Portugal (ketiga divisinya).",
		"'Holland' porque 'the Netherlands' se pasa del ancho del español en la fila"
		+ " del logroVerdugo de Países Bajos":
			"Momok Belanda",
		"Vencer a todos los clubes de Países Bajos (las tres divisiones).":
			"Kalahkan semua klub Belanda (ketiga divisinya).",
		"Verdugo de Bélgica": "Momok Belgia",
		"Vencer a todos los clubes de Bélgica (las tres divisiones).":
			"Kalahkan semua klub Belgia (ketiga divisinya).",
		"Verdugo de Turquía": "Momok Turki",
		"Vencer a todos los clubes de Turquía (las tres divisiones).":
			"Kalahkan semua klub Turki (ketiga divisinya).",
		"Verdugo de Argentina": "Momok Argentina",
		"Vencer a todos los clubes de Argentina (las tres divisiones).":
			"Kalahkan semua klub Argentina (ketiga divisinya).",
		"Verdugo de Brasil": "Momok Brasil",
		"Vencer a todos los clubes de Brasil (las tres divisiones).":
			"Kalahkan semua klub Brasil (ketiga divisinya).",
		"Verdugo de México": "Momok Meksiko",
		"Vencer a todos los clubes de México (las tres divisiones).":
			"Kalahkan semua klub Meksiko (ketiga divisinya).",
		"Verdugo de Estados Unidos": "Momok Amerika Serikat",
		"Vencer a todos los clubes de Estados Unidos (las tres divisiones).":
			"Kalahkan semua klub Amerika Serikat (ketiga divisinya).",
		"Verdugo de Arabia Saudí": "Momok Arab Saudi",
		"Vencer a todos los clubes de Arabia Saudí (las tres divisiones).":
			"Kalahkan semua klub Arab Saudi (ketiga divisinya).",

		"Verdugo de Escocia": "Momok Skotlandia",
		"Vencer a todos los clubes de Escocia (las tres divisiones).":
			"Kalahkan semua klub Skotlandia (ketiga divisinya).",
		"Verdugo de Grecia": "Momok Yunani",
		"Vencer a todos los clubes de Grecia (las tres divisiones).":
			"Kalahkan semua klub Yunani (ketiga divisinya).",
		"Verdugo de Ucrania": "Momok Ukraina",
		"Vencer a todos los clubes de Ucrania (las tres divisiones).":
			"Kalahkan semua klub Ukraina (ketiga divisinya).",
		"Verdugo de Austria": "Momok Austria",
		"Vencer a todos los clubes de Austria (las tres divisiones).":
			"Kalahkan semua klub Austria (ketiga divisinya).",
		"Verdugo de Suiza": "Momok Swiss",
		"Vencer a todos los clubes de Suiza (las tres divisiones).":
			"Kalahkan semua klub Swiss (ketiga divisinya).",
		"Verdugo de Chequia": "Momok Ceko",
		"Vencer a todos los clubes de Chequia (las tres divisiones).":
			"Kalahkan semua klub Ceko (ketiga divisinya).",
		"Verdugo de Croacia": "Momok Kroasia",
		"Vencer a todos los clubes de Croacia (las tres divisiones).":
			"Kalahkan semua klub Kroasia (ketiga divisinya).",
		"Verdugo de Serbia": "Momok Serbia",
		"Vencer a todos los clubes de Serbia (las tres divisiones).":
			"Kalahkan semua klub Serbia (ketiga divisinya).",
		"Verdugo de Dinamarca": "Momok Denmark",
		"Vencer a todos los clubes de Dinamarca (las tres divisiones).":
			"Kalahkan semua klub Denmark (ketiga divisinya).",
		"Verdugo de Noruega": "Momok Norwegia",
		"Vencer a todos los clubes de Noruega (las tres divisiones).":
			"Kalahkan semua klub Norwegia (ketiga divisinya).",
		"Verdugo de Japón": "Momok Jepang",
		"Vencer a todos los clubes de Japón (las tres divisiones).":
			"Kalahkan semua klub Jepang (ketiga divisinya).",
		"Verdugo de Corea del Sur": "Momok Korea Selatan",
		"Vencer a todos los clubes de Corea del Sur (las tres divisiones).":
			"Kalahkan semua klub Korea Selatan (ketiga divisinya).",
		"Verdugo de Colombia": "Momok Kolombia",
		"Vencer a todos los clubes de Colombia (las tres divisiones).":
			"Kalahkan semua klub Kolombia (ketiga divisinya).",
		"Verdugo de Chile": "Momok Chile",
		"Vencer a todos los clubes de Chile (las tres divisiones).":
			"Kalahkan semua klub Chile (ketiga divisinya).",
		"Verdugo de Uruguay": "Momok Uruguay",
		"Vencer a todos los clubes de Uruguay (las tres divisiones).":
			"Kalahkan semua klub Uruguay (ketiga divisinya).",
		"Verdugo de Paraguay": "Momok Paraguay",
		"Vencer a todos los clubes de Paraguay (las tres divisiones).":
			"Kalahkan semua klub Paraguay (ketiga divisinya).",
		"Verdugo de Ecuador": "Momok Ekuador",
		"Vencer a todos los clubes de Ecuador (las tres divisiones).":
			"Kalahkan semua klub Ekuador (ketiga divisinya).",
		"Verdugo de Perú": "Momok Peru",
		"Vencer a todos los clubes de Perú (las tres divisiones).":
			"Kalahkan semua klub Peru (ketiga divisinya).",
		"Verdugo de Bolivia": "Momok Bolivia",
		"Vencer a todos los clubes de Bolivia (las tres divisiones).":
			"Kalahkan semua klub Bolivia (ketiga divisinya).",
		"Verdugo de Venezuela": "Momok Venezuela",
		"Vencer a todos los clubes de Venezuela (las tres divisiones).":
			"Kalahkan semua klub Venezuela (ketiga divisinya).",
		"Verdugo de Egipto": "Momok Mesir",
		"Vencer a todos los clubes de Egipto (las tres divisiones).":
			"Kalahkan semua klub Mesir (ketiga divisinya).",
		"Verdugo de Marruecos": "Momok Maroko",
		"Vencer a todos los clubes de Marruecos (las tres divisiones).":
			"Kalahkan semua klub Maroko (ketiga divisinya).",
		"Verdugo de Túnez": "Momok Tunisia",
		"Vencer a todos los clubes de Túnez (las tres divisiones).":
			"Kalahkan semua klub Tunisia (ketiga divisinya).",
		"Verdugo de Nueva Zelanda": "Momok Selandia Baru",
		"Vencer a todos los clubes de Nueva Zelanda (las tres divisiones).":
			"Kalahkan semua klub Selandia Baru (ketiga divisinya).",
		"Némesis del Mundo": "Nemesis Dunia",
		"Vencer a TODOS los clubes del juego: cada liga, cada división. La cima del hardcore.":
			"Kalahkan SEMUA klub di game: setiap liga, setiap divisi. Puncak hardcore.",
		"Nuevo Fichaje": "Rekrutan Baru",
		"Ser presentado ante tu nueva afición por primera vez.": "Diperkenalkan ke suporter barumu untuk pertama kali.",
		"Diez Mil Curiosos": "10.000 Datang",
		"10.000 personas fueron a tu presentación.":
			"10.000 orang datang ke presentasimu.",
		"No Cabe Un Alma": "Stadion Penuh Sesak",
		"Llenar el estadio el día de tu presentación, sin haber jugado un solo minuto.":
			"Penuhi stadion di hari presentasimu, tanpa bermain semenit pun.",
		"'Forty Thousand' (14) se pasa del español (12); el número mantiene el"
		+ " anchoCuarenta Mil":
			"40.000 Suporter",
		"40.000 personas fueron a verte firmar.": "40.000 orang datang melihatmu teken kontrak.",
		"Fichaje Galáctico": "Rekrutan Galactico",
		"Que 65.000 personas vayan a tu presentación. Dejar de ser un jugador para ser una noticia.":
			"Tarik 65.000 orang ke presentasimu. Berhenti jadi pemain, jadi berita utama.",
		"Ochenta Mil Almas": "80.000 Jiwa",
		"Que 80.000 personas llenen el estadio SÓLO para verte llegar. Ni un partido, ni un gol: tu nombre.":
			"Penuhi stadion dengan 80.000 orang HANYA untuk melihatmu tiba. Bukan laga, bukan gol: namamu.",
		"Siempre Te Esperan": "Selalu Dinanti",
		"Llenar el estadio en TRES presentaciones distintas.": "Penuhi stadion di TIGA presentasi berbeda.",


		"Rompelíneas": "Penembus Lini",
		"Ganar tu primer regate.": "Menangkan dribel pertamamu.",
		"Bailarín": "Penari",
		"25 regates ganados.": "25 dribel dimenangkan.",
		"Imparable": "Tak Terhentikan",
		"100 regates ganados.": "100 dribel dimenangkan.",
		"Agónico": "Detik Terakhir",
		"Marcar en el minuto 85 o después.": "Cetak gol di menit ke-85 atau setelahnya.",
		"Rey del Descuento": "Raja Injury Time",
		"10 goles del minuto 85 en adelante.": "10 gol dari menit ke-85 ke atas.",
		"Noche de Remontada": "Malam Comeback",
		"Ganar un partido en el que llegues a ir perdiendo por 2 goles.":
			"Menangkan laga yang sempat membuatmu tertinggal 2 gol.",
		"Orgullo de la Ciudad": "Kebanggaan Kota",
		"Ganar tu primer derbi.": "Menangkan derby pertamamu.",
		"El Gol que Vale Doble": "Gol Bernilai Ganda",
		"Marcar en un derbi.": "Cetak gol di derby.",
		"Rey del Derbi": "Raja Derby",
		"Ganar 5 derbis.": "Menangkan 5 derby.",
		"Millonario": "Jutawan",
		"Juntar 1.000.000 en el banco.": "Simpan 1.000.000 di bank.",
		"Magnate": "Taipan",
		"Juntar 10.000.000 en el banco.": "Simpan 10.000.000 di bank.",
		"Imagen de Marca": "Wajah Merek",
		"Firmar tu primer contrato de patrocinio.": "Teken kontrak sponsor pertamamu.",
		"Hombre Anuncio": "Papan Iklan Berjalan",
		"Firmar 10 contratos de patrocinio.": "Teken 10 kontrak sponsor.",
		"Vida de Futbolista": "Gaya Hidup Bintang",
		"Comprar tu primer artículo de estilo de vida.": "Beli barang gaya hidup pertamamu.",
		"Inversor": "Investor",
		"Hacer tu primera inversión.": "Lakukan investasi pertamamu.",
		"Hombre del Vestuario": "Orang Ruang Ganti",
		"Responder 25 decisiones.": "Jawab 25 keputusan.",
		"La Voz del Equipo": "Suara Tim",
		"Responder 100 decisiones.": "Jawab 100 keputusan.",
		"Vía Bosman": "Jalur Bosman",
		"Firmar por un club siendo agente libre, sin traspaso de por medio.":
			"Gabung klub sebagai pemain bebas, tanpa biaya transfer.",
		"Nunca te Enamores de un Cedido": "Jangan Cinta Pemain Pinjaman",
		"Ser elegido Mejor Jugador del Club en el equipo donde juegas cedido.": "Terpilih jadi Pemain Terbaik Klub di tim tempatmu dipinjamkan.",
		"Ida y Vuelta": "Pergi-Pulang",
		"Completar una cesión entera y volver a tu club.": "Selesaikan satu masa pinjaman penuh dan kembali ke klubmu.",
		"Pasaporte Sellado": "Paspor Penuh Stempel",
		"Jugar en clubes de 3 países distintos.": "Main untuk klub di 3 negara berbeda.",
		"Ciudadano del Mundo": "Warga Dunia",
		"Jugar en clubes de 5 países distintos.": "Main untuk klub di 5 negara berbeda.",
		"Segunda Vida": "Hidup Kedua",
		"Cerrar una carrera entera (hasta el retiro) con un modificador de Nueva Carrera+ activo.":
			"Tamatkan satu karier penuh (sampai pensiun) dengan modifier Karier Baru+ aktif.",
		"Primera Vitrina": "Lemari Trofi Pertama",
		"Desbloquear todos los logros comunes.": "Buka semua prestasi umum.",
		"Vitrina Azul": "Lemari Biru",
		"Desbloquear todos los logros raros.": "Buka semua prestasi langka.",
		"título (sale en 2 entradas: entrevista y plato_o_descanso)TE QUIEREN EN EL"
		+ " PLATÓ":
			"KAMU DIUNDANG KE TV",
		"La televisión te invita a la entrevista de la semana. Media tarde de foco,"
		+ " preguntas y sonrisas.":
			"Televisi mengundangmu ke wawancara pekan ini. Setengah sore penuh sorotan, pertanyaan, dan senyum.",
		"ACUDIR": "IKUT",
		"PLANTARLES": "MANGKIR",
		"ACTO DE TU PATROCINADOR": "ACARA SPONSORMU",
		"Tu marca monta una firma de autógrafos y te quiere ahí. Pagan aparte, pero es"
		+ " un día entero.":
			"Sponsormu menggelar sesi tanda tangan dan ingin kamu hadir. Dibayar tambahan, tapi makan waktu sehari penuh.",
		"IR AL ACTO": "HADIRI",
		"también en benefico_ciudad (línea 276, fuera de mi rango)EXCUSARTE":
			"TOLAK",

		"LA HUELGA DE PRIMAS": "MOGOK BONUS",
		"El club debe tres meses de primas y la plantilla ha decidido no salir a"
		+ " calentar. El míster está en el túnel mirando el reloj, y hay una cámara en"
		+ " la boca del vestuario.":
			"Klub menunggak bonus tiga bulan dan skuad memutuskan tak mau keluar pemanasan. Pelatih di lorong menatap jam, dan ada kamera di pintu ruang ganti.",
		"SUMARTE AL PARO": "IKUT MOGOK",
		"SALIR A CALENTAR SOLO": "PEMANASAN SENDIRI",
		"LA FINAL ES EL SÁBADO": "FINAL HARI SABTU",
		"El parte médico dice que no llegas. El míster te lo pide a la cara, delante"
		+ " del cuerpo técnico, y el doctor niega con la cabeza sin decir nada.":
			"Laporan medis bilang kamu tak sempat pulih. Pelatih memintanya langsung di depan staf, dan dokter menggeleng tanpa sepatah kata.",
		"APRETAR LOS DIENTES": "TAHAN SAKIT",
		"HACERLE CASO AL MÉDICO": "TURUTI DOKTER",
		"Aguantaste: estás disponible para el partido grande.":
			"Kamu bertahan: kamu bisa main di laga besar.",
		"Se rompió del todo. La baja es larga.":
			"Cedera makin parah. Kamu absen lama.",
		"EL EQUIPO VIAJA SIN TI": "TIM BERANGKAT TANPAMU",
		"El autobús sale a las nueve y tu nombre no está en la lista. El doctor dice"
		+ " que el viaje no te hace bien; el vestuario, que verte en el banquillo les"
		+ " hace bien a ellos.":
			"Bus berangkat jam sembilan dan namamu tak ada di daftar. Dokter bilang perjalanan itu tidak baik untukmu; ruang ganti bilang melihatmu di bangku cadangan sangat baik untuk mereka.",
		"VIAJAR CON LA EXPEDICIÓN": "IKUT ROMBONGAN",
		"QUEDARTE EN REHABILITACIÓN": "TETAP REHABILITASI",
		"EL PARTE QUE SE FILTRÓ": "LAPORAN MEDIS BOCOR",
		"Un diario publica tu parte médico con dos semanas de más y un titular con la"
		+ " palabra «calvario». El club no fue; alguien de dentro, sí.":
			"Sebuah koran memuat laporan medismu dengan dua pekan lebih lama dan judul berisi kata «sengsara». Bukan klub yang membocorkan; orang dalam, iya.",
		"DESMENTIRLO A CÁMARA": "BANTAH DI KAMERA",
		"CALLAR Y RECUPERARTE": "DIAM DAN PULIH",
		"EL MÉDICO DE TU AGENTE": "DOKTER AGENMU",
		"Tu agente te manda la tarjeta de un doctor «que hace milagros» y que no es"
		+ " del club. El médico del club no sabe nada, y mejor que siga así.":
			"Agenmu mengirim kartu nama dokter «ahli keajaiban» yang bukan dokter klub. Dokter klub tidak tahu apa-apa, dan sebaiknya tetap begitu.",
		"PROBAR EL TRATAMIENTO": "COBA PENGOBATAN",
		"CONFIAR EN EL CLUB": "PERCAYA KLUB",
		"El milagro existe: dos semanas menos de baja.":
			"Keajaiban itu nyata: masa absenmu berkurang dua pekan.",
		"Se rompió del todo. Y el club se enteró de dónde.":
			"Cedera makin parah. Dan klub tahu kamu berobat ke mana.",
		"CABE UNO MÁS SI TE BAJAS": "ADA TEMPAT JIKA GAJIMU TURUN",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la nómina: el"
		+ " tuyo. Te piden por las buenas un 20% de tu ficha, y el vestuario ya sabe"
		+ " que te lo han pedido.":
			"Klub hampir mengikat seorang fenomena dan hanya kurang ruang di daftar gaji: milikmu. Mereka minta baik-baik 20% dari gajimu, dan ruang ganti sudah tahu soal permintaan itu.",
		"BAJARTE EL SUELDO": "POTONG GAJI",
		"NI UN PESO": "TAK SEPESER",
		"Te bajas la ficha": "Gajimu dipotong",
		"Cobrarás ${0} por partido en vez de ${1}. El club ya tiene su hueco.":
			"Kamu akan dapat ${0} per laga, bukan ${1}. Klub sudah punya ruang yang dibutuhkan.",
		"EL BANDO DEL BRAZALETE": "KUBU BAN KAPTEN",
		"{0} está señalado y el vestuario busca relevo. Suenan dos nombres: el tuyo y"
		+ " el del veterano que lleva once años aquí.":
			"{0} jadi sorotan dan ruang ganti mencari pengganti. Dua nama beredar: namamu dan veteran yang sudah sebelas tahun di sini.",


		"MOVER FICHA POR EL BRAZALETE": "REBUT BAN KAPTEN",
		"LA ENTRADA EN EL ENTRENO": "TACKLE DI LATIHAN",
		"Fuiste a por un balón que no era tuyo y {0}, el que te disputa el puesto, se"
		+ " ha ido al vestuario cojeando y sin mirarte. El grupo lo vio todo.":
			"Kamu mengejar bola yang bukan milikmu dan {0}, rival yang memperebutkan tempat denganmu, pergi ke ruang ganti sambil pincang tanpa menoleh. Seluruh grup melihatnya.",
		"PEDIR PERDÓN DELANTE DE TODOS": "MINTA MAAF DI DEPAN SEMUA",
		"NO DAR EXPLICACIONES": "TAK PERLU PENJELASAN",
		"EL CHAVAL TE COMIÓ EL PUESTO": "BOCAH ITU REBUT TEMPATMU",
		"{0} entró por ti y volvió a hacerlo bien. Te busca al acabar para que le"
		+ " corrijas dos cosas del perfil de tiro. Enseñárselas es enseñárselas.":
			"{0} masuk menggantikanmu dan tampil bagus lagi. Dia menemuimu usai laga agar kamu membetulkan dua hal pada tembakannya. Mengajarinya sama dengan mempersenjatainya.",

		"SE ROMPIÓ EL QUE TE PELEA EL PUESTO": "RIVALMU CEDERA",
		"{0} se rompió en el entreno y el puesto es tuyo hasta nuevo aviso. El vestuario mira a ver qué cara pones.":
			"{0} cedera di latihan dan tempatnya jadi milikmu sampai ada kabar baru. Ruang ganti memperhatikan ekspresimu.",
		"LLEVARLE LA REHABILITACIÓN": "TEMANI REHABNYA",
		"APROVECHAR EL HUECO": "MANFAATKAN CELAH",
		"EL CAPITÁN TE SIENTA": "KAPTEN MENEGURMU",
		"{0} te aparta antes del entreno con el brazalete en la mano: dice que el grupo"
		+ " está harto de tu forma de celebrar, y que te lo dice él antes de que te lo"
		+ " diga otro.":
			"{0} menarikmu ke samping sebelum latihan dengan ban kapten di tangan: grup sudah muak dengan caramu merayakan gol, dan dia lebih suka bilang sendiri sebelum orang lain.",
		"BAJAR LA CABEZA": "TERIMA SAJA",
		"CONTESTARLE DELANTE DE TODOS": "BALAS DI DEPAN SEMUA",

		"LA VUELTA AL CAMPO": "KELILING LAPANGAN",
		"Campeón. La copa pesa de verdad y el estadio no se va a ir a ninguna parte."
		+ " Queda una vuelta al campo y todos esperan que se la des a alguien.":
			"Juara. Pialanya benar-benar berat dan stadion tak akan ke mana-mana. Tinggal satu putaran keliling lapangan, dan semua berharap kamu mempersembahkannya untuk seseorang.",
		"LEVANTARLA ANTE EL FONDO": "ANGKAT UNTUK TRIBUN",
		"QUE LA LEVANTE EL GRUPO": "BIAR GRUP YANG ANGKAT",
		"LLEVÁRSELA AL MÍSTER": "BERIKAN KE PELATIH",
		"LA CIUDAD ESTÁ EN LA CALLE": "KOTA TUMPAH KE JALAN",
		"Ascenso. Hay gente en la avenida desde antes de que acabara el partido, un"
		+ " autobús descapotable esperando y un micrófono que va a llegar a todas"
		+ " las casas.":
			"Promosi. Orang sudah memenuhi jalan sebelum laga usai, bus atap terbuka menunggu, dan ada mikrofon yang akan sampai ke setiap rumah.",
		"PROMETER QUE TE QUEDAS": "JANJI TETAP DI SINI",
		"NOMBRAR UNO A UNO AL VESTUARIO": "SEBUT SKUAD SATU-SATU",
		"PEDIR REFUERZOS EN DIRECTO": "MINTA PEMAIN BARU LIVE",
		"EL MEJOR DEL MUNDO": "TERBAIK DUNIA",
		"Jugador del Año. Estás de pie con el trofeo en la mano, la sala en silencio y"
		+ " treinta segundos que se van a repetir el resto de tu carrera.":
			"Pemain Terbaik Tahun Ini. Kamu berdiri dengan trofi di tangan, ruangan hening, dan tiga puluh detik yang akan diputar ulang sepanjang kariermu.",
		"A LOS QUE TE PASAN EL BALÓN": "UNTUK PEMBERI UMPANKU",
		"A LA GENTE QUE TE VIO EMPEZAR": "UNTUK SAKSI AWAL KARIERKU",
		"AL CAMINO QUE TE TRAJO AQUÍ": "UNTUK JALAN HINGGA KE SINI",
		"EL MEJOR DE LA TEMPORADA": "PEMAIN TERBAIK MUSIM",
		"Te dan el premio al mejor del año y hay que decir algo. La sala está llena"
		+ " de gente que decide cosas sobre ti: tu club, tu competición y los que"
		+ " escriben.":
			"Kamu menerima penghargaan pemain terbaik tahun ini dan harus bicara. Ruangan penuh orang yang menentukan nasibmu: klubmu, kompetisimu, dan para wartawan.",
		"HABLAR DEL EQUIPO QUE TE SOSTUVO": "SOROT TIM YANG MENOPANGMU",
		"AGRADECER AL MÍSTER QUE TE PUSO": "BERTERIMA KASIH KE PELATIH",
		"DEDICÁRSELO A LA GRADA": "UNTUK PARA SUPORTER",

		"LA CIUDAD ES TUYA": "KOTA MILIKMU",
		"Ganasteis el derbi. Hay gente esperando el autobús en la puerta, esta vez"
		+ " para llevaros en volandas, y mañana no se va a hablar de otra cosa en"
		+ " toda la ciudad.":
			"Kalian menang derby. Orang-orang menunggu bus di pintu, kali ini untuk mengangkat kalian di pundak, dan besok seluruh kota tak akan membicarakan hal lain.",
		"CELEBRARLO EN LA VALLA": "RAYAKAN DI PAGAR",
		"DECIR QUE SÓLO SON TRES PUNTOS": "BILANG CUMA TIGA POIN",
		"DEDICÁRSELO AL VESTUARIO": "UNTUK RUANG GANTI",


		"selección": "timnas",
		"competidor": "rivalmu",
		"TU PRIMERA VEZ CON TU PAÍS": "DEBUT TIMNASMU",
		"Debutaste con la selección. En el túnel te esperan la cámara de tu país y el"
		+ " utillero con la camiseta del partido, que se guarda o se regala.":
			"Kamu debut bersama timnas. Di lorong, kamera negaramu dan pengurus perlengkapan menunggu dengan jersey laga, yang bisa disimpan atau diberikan.",
		"ENMARCARLA PARA TU FAMILIA": "BINGKAI UNTUK KELUARGA",
		"REGALÁRSELA AL SELECCIONADOR": "BERIKAN KE PELATIH TIMNAS",
		"SUBIRLA A TUS REDES": "UNGGAH KE MEDSOS",
		"EL SELECCIONADOR TE APARTA": "PELATIH TIMNAS MENARIKMU",
		"Al acabar te lleva a un lado, lejos del grupo. Puedes escuchar lo que tenga"
		+ " que decirte, o aprovechar los dos minutos para pedirle el puesto de"
		+ " titular.":
			"Usai laga dia membawamu ke samping, jauh dari grup. Kamu bisa mendengarkan apa pun yang ingin dia katakan, atau memakai dua menit itu untuk meminta tempat inti.",
		"ESCUCHAR Y CALLAR": "DENGAR DAN DIAM",
		"PEDIRLE EL PUESTO": "MINTA TEMPAT INTI",
		"Le gustó tu descaro: cuenta contigo.": "Dia suka nyalimu: kamu masuk rencananya.",
		"No era el momento ni el sitio. Tomó nota.":
			"Bukan waktu dan tempat yang tepat. Dia mencatatnya.",
		"TU CLUB TE RECLAMA": "KLUBMU MEMANGGIL",
		"Tu club llamó a la federación: quieren que vuelvas en el primer vuelo y te"
		+ " saltes el segundo partido. El seleccionador te deja elegir a ti, que es la"
		+ " peor parte.":
			"Klubmu menelepon federasi: mereka ingin kamu pulang dengan penerbangan pertama dan melewatkan laga kedua. Pelatih timnas menyerahkan pilihan padamu, dan itu bagian terburuknya.",
		"VOLVER AL CLUB": "PULANG KE KLUB",
		"QUEDARTE CON TU PAÍS": "TETAP BERSAMA TIMNAS",
		"MARCASTE CON TU PAÍS": "GOL UNTUK TIMNASMU",
		"Gol con la camiseta de tu selección y un micrófono de tu país esperándote. Se"
		+ " puede repartir de tres maneras, y las tres se oyen en tu casa.":
			"Gol dengan jersey timnasmu dan mikrofon dari negaramu menunggu. Ada tiga cara membaginya, dan ketiganya terdengar sampai ke rumahmu.",
		"AL PAÍS QUE TE VIO NACER": "UNTUK NEGARA KELAHIRAN",
		"AL SELECCIONADOR QUE TE LLAMÓ": "UNTUK PELATIH YANG MEMANGGIL",
		"AL CLUB QUE TE PAGA": "UNTUK KLUB YANG MENGGAJI",
		"LA PRENSA DE TU PAÍS": "PERS DARI NEGARAMU",
		"Perdisteis y el país entero pide explicaciones. Te esperan en zona mixta con"
		+ " la pregunta ya escrita: quién tuvo la culpa.":
			"Kalian kalah dan seluruh negeri menuntut penjelasan. Mereka menunggu di mixed zone dengan pertanyaan yang sudah tertulis: siapa yang salah.",
		"DAR LA CARA POR EL GRUPO": "BELA GRUP",
		"DECIR QUE TÚ CUMPLISTE": "BILANG TUGASMU BERES",
		"NOVENTA MINUTOS MIRANDO": "90 MENIT MENONTON",
		"Viajaste medio mundo para calentar dos veces y volver a sentarte. Tu agente"
		+ " quiere que se sepa; el segundo entrenador te ha visto la cara desde el"
		+ " banquillo.":
			"Kamu terbang separuh dunia untuk pemanasan dua kali lalu duduk lagi. Agenmu ingin hal ini diketahui; asisten pelatih sudah melihat wajahmu dari bangku cadangan.",
		"APLAUDIR DESDE EL BANCO": "TEPUK TANGAN DI BANGKU",
		"QUE SE ENTERE TU AGENTE": "BIARKAN AGENMU BICARA",
		"AYUDARLE": "BANTU",
		"CERRARLE LA PUERTA": "TUTUP PINTU",
		"LA CAMISETA DEL RIVAL": "JERSEY LAWAN",
		"Su estrella se acerca en el túnel y te ofrece cambiar camisetas. Hay veinte"
		+ " cámaras esperando el gesto, y la grada de tu fondo sigue ahí arriba.":
			"Bintang mereka mendekat di lorong dan menawarkan tukar jersey. Dua puluh kamera menunggu momen itu, dan tribunmu sendiri masih di atas sana.",
		"CAMBIARLA DELANTE DE TODOS": "TUKAR DI DEPAN SEMUA",
		"DEJARLE CON LA MANO TENDIDA": "ABAIKAN TANGANNYA",








		"ALGUIEN EN LA MESA DE AL LADO": "SESEORANG DI MEJA SEBELAH",
		"Cena del club, y la conversación de tu mesa lleva una hora girando"
		+ " alrededor de {0}. Te está mirando desde hace rato.":
			"Makan malam klub, dan obrolan di mejamu sudah satu jam membahas {0}. Dia sudah lama menatapmu.",
		"ACERCARTE": "DEKATI",







		"TE LA QUIEREN PRESENTAR": "KENALAN DARI TEMAN",
		"Un compañero insiste toda la semana: {0} es amiga de su mujer y ya le"
		+ " habló de ti. Sólo tienes que decir que sí.":
			"Seorang rekan setim mendesakmu sepekan penuh: {0} teman istrinya dan sudah mendengar tentangmu. Kamu cuma perlu bilang ya.",
		"QUE SEA EL SÁBADO": "HARI SABTU SAJA",
		"NO ESTÁS PARA ESO": "BUKAN SEKARANG",
		"TE ESPERABA EN LA PUERTA": "DIA MENUNGGU DI GERBANG",
		"LA INAUGURACIÓN": "MALAM PEMBUKAAN",
		"Tu marca te lleva a la inauguración de una exposición y no entiendes ni uno de los"
		+ " cuadros. {0} lleva veinte minutos delante del mismo, y acaba de darse cuenta"
		+ " de que la miras a ella.":
			"Sponsormu membawamu ke pembukaan pameran dan kamu tak paham satu pun lukisannya. {0} sudah dua puluh menit berdiri di depan lukisan yang sama, dan baru sadar kamu menatapnya.",
		"PREGUNTARLE QUÉ VE": "TANYA PANDANGANNYA",
		"VOLVER CON LOS TUYOS": "KEMBALI KE REKANMU",
		"{0} llevaba dos horas en la puerta de jugadores. No traía camiseta que"
		+ " firmar: traía su número escrito en un papel.":
			"{0} sudah dua jam menunggu di pintu pemain. Dia tak membawa jersey untuk ditandatangani: hanya nomor teleponnya di secarik kertas.",
		"GUARDARTE EL PAPEL": "SIMPAN KERTASNYA",
		"SUBIR AL AUTOBÚS": "NAIK BUS",
		"LA LLAVE DE TU CASA": "KUNCI RUMAHMU",
		"{0} lleva media semana durmiendo aquí y sus cosas ya ocupan un cajón."
		+ " Alguien tiene que decirlo en voz alta.":
			"{0} sudah setengah minggu menginap di sini dan barang-barangnya sudah memenuhi satu laci. Seseorang harus mengatakannya terang-terangan.",
		"PEDIRLE QUE SE MUDE": "AJAK SERUMAH",
		"TODAVÍA NO": "BELUM DULU",
		"LA CENA QUE LE DEBES": "UTANG MAKAN MALAM",
		"Reservaste hace tres semanas y hoy es la noche. También es la noche del"
		+ " vídeo del rival, que el técnico mandó a todo el plantel.":
			"Kamu memesan tempat tiga minggu lalu, dan malam inilah waktunya. Malam ini juga jadwal menonton video lawan yang dikirim pelatih ke seluruh skuad.",
		"IR A CENAR": "MAKAN MALAM",
		"VER EL VÍDEO": "TONTON VIDEO",
		"OTRA SEMANA FUERA": "PERGI LAGI",
		"Cuatro días de concentración, el tercer viaje del mes. {0} ya no"
		+ " pregunta cuándo vuelves: mira el calendario y se calla.":
			"Empat hari TC, perjalanan ketiga bulan ini. {0} tak lagi bertanya kapan kamu pulang: dia melihat kalender lalu diam.",
		"LLAMARLA CADA NOCHE": "TELEPON TIAP MALAM",
		"CONCENTRARTE EN EL PARTIDO": "FOKUS KE LAGA",
		"SU CUMPLEAÑOS ES HOY": "ULTAHNYA HARI INI",
		"Es el cumpleaños de {0} y hay treinta personas en tu casa. Mañana a las"
		+ " nueve hay partido y el técnico avisó de que mirará las caras.":
			"{0} berulang tahun dan ada tiga puluh orang di rumahmu. Besok jam sembilan ada laga dan pelatih sudah bilang dia akan memperhatikan wajah setiap pemain.",
		"QUEDARTE HASTA EL FINAL": "BERTAHAN SAMPAI AKHIR",
		"SUBIR A DORMIR": "PERGI TIDUR",
		"HAY QUE HABLAR": "PERLU BICARA",
		"{0} apagó la televisión en mitad del resumen de la jornada y se sentó"
		+ " enfrente. Esta conversación llevaba meses pendiente.":
			"{0} mematikan televisi di tengah ringkasan pekan dan duduk di depanmu. Percakapan ini sudah berbulan-bulan tertunda.",
		"ESCUCHARLA ENTERA": "DENGARKAN DIA",
		"DECIRLE QUE NO ES EL MOMENTO": "BILANG BUKAN SEKARANG",
		"TE ESPERÓ DESPIERTA": "DIA MENUNGGUMU",
		"Son las dos de la mañana, perdisteis, y {0} sigue despierta en la cocina"
		+ " con dos platos servidos. No preguntó por el partido.":
			"Sekarang jam dua pagi, timmu kalah, dan {0} masih terjaga di dapur dengan dua piring tersaji. Dia tak bertanya soal laga.",
		"SENTARTE A CENAR": "DUDUK MAKAN",
		"IRTE DERECHO A LA CAMA": "LANGSUNG TIDUR",
		"LA FOTO DEL DOMINGO": "FOTO HARI MINGGU",
		"Una revista ofrece portada: tú y {0}, en casa, ocho páginas. Pagan bien"
		+ " y a ella la fotografiarían por primera vez.":
			"Sebuah majalah menawarkan sampul: kamu dan {0}, di rumah, delapan halaman. Bayarannya besar dan dia akan difoto untuk pertama kalinya.",
		"ACEPTAR LA PORTADA": "AMBIL SAMPUL",
		"PROTEGERLA": "LINDUNGI",
		"ELLA QUIERE SALIR": "DIA MAU KELUAR MALAM",
		"Ganasteis y {0} ya tiene mesa reservada para las dos de la mañana."
		+ " Mañana hay recuperación a las nueve.":
			"Timmu menang dan {0} sudah memesan meja untuk jam dua pagi. Besok ada sesi pemulihan jam sembilan.",
		"SALIR CON ELLA": "KELUAR BERDUA",
		"MAÑANA HAY TRABAJO": "BESOK KERJA",
		"LA GIRA DE PRETEMPORADA": "TUR PRAMUSIM",
		"Tres semanas al otro lado del mundo. El club permite acompañantes, pero"
		+ " el vestuario mira raro al que viaja con pareja.":
			"Tiga minggu di belahan dunia lain. Klub mengizinkan pendamping, tetapi ruang ganti memandang aneh siapa pun yang membawa pasangan.",
		"QUE VENGA CONTIGO": "AJAK DIA IKUT",
		"IR SOLO": "SENDIRI",
		"SE ACABÓ": "SELESAI",
		"Las maletas de {0} llevan dos días en el recibidor y esta vez no las"
		+ " está deshaciendo. Lo que queda por decidir no es si se va: es cómo.":
			"Koper {0} sudah dua hari di lorong depan dan kali ini dia tidak membongkarnya. Yang tersisa untuk diputuskan bukan apakah dia pergi: tapi bagaimana.",
		"SUPLICARLE DELANTE DE TODOS": "MEMOHON DI DEPAN SEMUA",
		"DECIRLE QUE ERA SU DECISIÓN": "BILANG ITU PILIHANNYA",
		"DEJAR QUE LO CUENTE ELLA": "BIARKAN DIA BERCERITA",

		"Vivís juntos: ${0} por partido.": "Tinggal bersama: ${0} per laga.",
		"Estáis empezando. Todavía no vive contigo.":
			"Baru mulai. Dia belum tinggal bersamamu.",
		"ASADO DEL VESTUARIO": "BARBEKU SKUAD",
		"Los veteranos organizan un asado y te toca poner la carne. Caro, pero ahí se"
		+ " hacen los amigos.":
			"Para senior mengadakan barbeku dan kamu kebagian menyediakan dagingnya. Mahal, tapi di situlah pertemanan terbentuk.",
		"PAGAR EL ASADO": "BAYAR BARBEKU",
		"NO HAY TIEMPO": "TAK ADA WAKTU",
		"EL TÉCNICO TE LLAMA": "PELATIH MEMANGGILMU",
		"EL MÍSTER TIENE UNA IDEA": "PELATIH PUNYA IDE",
		"Te enseña la pizarra con tu nombre fuera de tu sitio de siempre: te ve de {0}. Dice que ahí hay hueco y que lo llenas tú.": "Dia menunjukkan papan taktik dengan namamu di luar posisi biasamu: dia melihatmu sebagai {0}. Katanya di sana ada celah dan kamulah yang mengisinya.",
		"ACEPTAR EL CAMBIO": "TERIMA PERUBAHAN",
		"PEDIR GARANTÍAS": "MINTA JAMINAN",
		"SEGUIR EN LO TUYO": "TETAP DI POSISIMU",
		"Te promete el puesto y los minutos.": "Dia menjanjikanmu tempat dan menit bermain.",
		"No le gustó que le pusieras condiciones.": "Dia tidak suka kamu mengajukan syarat.",
		"Puerta cerrada. Puedes escuchar y asentir, o jugártela y pedirle más"
		+ " protagonismo.":
			"Pintu tertutup. Kamu bisa mendengarkan dan mengangguk, atau mencoba peruntungan dan minta peran lebih besar.",
		"ESCUCHAR": "DENGAR",
		"PEDIR MÁS": "MAU LEBIH",
		"¡El técnico te compra la idea!": "Pelatih menerima idemu!",
		"Mala lectura: al técnico no le gustó.": "Salah baca: pelatih tidak suka itu.",
		"VISITA A LA CANTERA": "KUNJUNGAN AKADEMI",
		"El club organiza una visita a los niños de la cantera y del hospital. Nadie te"
		+ " obliga.":
			"Klub mengatur kunjungan ke anak-anak akademi dan rumah sakit anak. Tidak ada yang memaksamu.",
		"IR": "IKUT",
		"DESCANSAR": "ISTIRAHAT",
		"título (sale en 2 entradas: polemica y micro_polemica)UN MICRÓFONO CALIENTE":
			"WAWANCARA PANAS",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el equipo?'":
			"Seorang wartawan memancingmu: 'apa kamu benar-benar puas dengan peranmu di tim ini?'",
		"MORDERTE LA LENGUA": "TAHAN LIDAH",
		"SOLTARLO": "UNGKAP",
		"SALIDA DEL EQUIPO": "MALAM BARENG TIM",
		"El vestuario sale esta noche. Habrá fotos, habrá risas, y mañana habrá"
		+ " entrenamiento.":
			"Ruang ganti keluar malam ini. Akan ada foto, akan ada tawa, dan besok akan ada latihan.",
		"IR CON ELLOS": "IKUT MEREKA",
		"QUEDARTE": "DI RUMAH",

		"ALBOROTO EN TU CALLE": "RIBUT DI JALANMU",
		"Hay aficionados acampados frente a tu casa desde temprano. Los vecinos ya"
		+ " llamaron dos veces.":
			"Suporter berkemah di depan rumahmu sejak pagi. Para tetangga sudah menelepon dua kali.",
		"SALIR A FIRMAR": "KELUAR TEKEN",
		"CERRAR CORTINAS": "TUTUP GORDEN",
		"TU MASCOTA AMANECIÓ MAL": "PELIHARAANMU SAKIT",
		"No quiso comer y te mira raro. El veterinario bueno atiende hoy... a la"
		+ " hora del entrenamiento de recuperación.":
			"Dia tak mau makan dan menatapmu aneh. Dokter hewan yang bagus buka hari ini... tepat di jam sesi pemulihan.",
		"LLEVARLA AL VETERINARIO": "BAWA KE DOKTER HEWAN",
		"ESPERAR A MAÑANA": "TUNGGU BESOK",
		"Falsa alarma: por la tarde ya corría por la casa.":
			"Alarm palsu: sore harinya dia sudah berlarian di rumah.",
		"Mala noche para los dos. No pegaste ojo.":
			"Malam buruk untuk kalian berdua. Kamu tak bisa tidur sedikit pun.",
		"ASADO EN TU JARDÍN": "BARBEKU DI TAMANMU",
		"Compraste el asador y el vestuario se enteró. 'El sábado en tu casa',"
		+ " dicen. No era pregunta.":
			"Kamu membeli panggangan dan ruang ganti tahu. 'Sabtu di rumahmu', kata mereka. Itu bukan pertanyaan.",
		"ENCENDER EL ASADOR": "NYALAKAN GRILL",


		"TARDE DE PISCINA": "SORE DI KOLAM",
		"Hace calor, tu piscina está impecable y media plantilla tiene tu"
		+ " dirección. El timbre va a sonar.":
			"Cuaca panas, kolam renangmu bersih sempurna dan separuh skuad punya alamatmu. Bel pintu akan berbunyi.",
		"ABRIR LA CASA": "BUKA RUMAH",
		"TARDE PARA TI": "SORE UNTUKMU",
		"PEREGRINACIÓN A TU VITRINA": "ZIARAH LEMARI TROFI",
		"El club pregunta si puedes recibir a los juveniles en tu mansión: quieren"
		+ " ver la vitrina con sus propios ojos.":
			"Klub bertanya apakah kamu bisa menerima para pemain muda di mansionmu: mereka ingin melihat lemari trofi dengan mata kepala sendiri.",
		"RECIBIRLOS": "SAMBUT",
		"OTRA SEMANA": "LAIN KALI",
		"NOCHE LIBRE": "MALAM BEBAS",
		"Tus amigos te esperan para una noche de PlayStation. El técnico ofrece una"
		+ " sesión extra de vídeo y tiros a puerta. No llegas a las dos.":
			"Teman-temanmu menunggu untuk malam PlayStation. Pelatih menawarkan sesi ekstra video dan latihan tembakan. Kamu tak bisa dua-duanya.",
		"PS4 CON LOS AMIGOS": "PS4 BARENG TEMAN",
		"ENTRENAR CON EL DT": "LATIHAN SAMA PELATIH",
		"El programa deportivo de la noche te reserva el asiento bueno. O eso, o el"
		+ " sofá de casa con las piernas en alto.":
			"Acara bola malam ini menyiapkan kursi terbaik untukmu. Pilihannya itu, atau sofa di rumah dengan kaki diselonjorkan.",
		"IR A LA ENTREVISTA": "IKUT WAWANCARA",
		"sale en 2 entradas: plato_o_descanso y dia_libre_tripleDESCANSAR EN CASA":
			"SANTAI DI RUMAH",
		"TODOS TE BUSCAN": "SEMUA MENCARIMU",
		"A la salida hay dos corros: la afición con camisetas y bufandas, y los"
		+ " periodistas con micrófonos. Solo te da tiempo a uno.":
			"Di pintu keluar ada dua kerumunan: suporter dengan jersey dan syal, dan wartawan dengan mikrofon. Kamu hanya sempat melayani satu.",
		"FIRMAR A LA AFICIÓN": "LAYANI SUPORTER",
		"ATENDER A LA PRENSA": "LAYANI PERS",
		"DOS CENAS, UNA NOCHE": "DUA MEJA, SATU MALAM",
		"Tu agente reservó mesa para hablar de tu futuro. El técnico te invitó a la"
		+ " suya para hablar del equipo. Coinciden a la misma hora.":
			"Agenmu memesan meja untuk membahas masa depanmu. Pelatih mengundangmu ke mejanya untuk membahas tim. Waktunya sama, dua-duanya.",
		"CENAR CON TU AGENTE": "MAKAN SAMA AGEN",
		"CENAR CON EL DT": "MAKAN SAMA PELATIH",
		"LA TARDE DESPUÉS": "SORE SESUDAHNYA",
		"El readaptador te espera en el gimnasio para soltar piernas. Tu marca, a la"
		+ " misma hora, monta una firma pagada.":
			"Pelatih kebugaran menunggumu di gym untuk melemaskan kaki. Sponsormu, di jam yang sama, mengadakan sesi tanda tangan berbayar.",
		"GIMNASIO": "GYM",
		"ACTO DE LA MARCA": "ACARA SPONSOR",
		"TERCER TIEMPO": "BABAK KETIGA",
		"El vestuario se va a celebrar (o a lamentar) el resultado hasta tarde. En casa"
		+ " te esperaban para cenar tranquilo.":
			"Ruang ganti pergi merayakan (atau meratapi) hasil sampai larut. Di rumah mereka menunggumu untuk makan malam santai.",
		"sale en 2 entradas: equipo_o_casa y dia_libre_tripleSALIR CON EL EQUIPO":
			"KELUAR BARENG TIM",
		"NOCHE EN CASA": "DI RUMAH SAJA",
		"TE POSTULAN DE CAPITÁN": "KAMU CALON KAPTEN",
		"El vestuario vota y tu nombre suena para el brazalete. Aceptar es echarte el"
		+ " equipo a la espalda; ceder es un gesto al veterano de siempre.":
			"Ruang ganti memilih dan namamu disebut untuk ban kapten. Menerimanya berarti memikul tim di pundakmu; mengalah adalah penghormatan untuk senior yang selalu memakainya.",
		"ACEPTAR EL BRAZALETE": "TERIMA BAN KAPTEN",
		"APOYAR AL VETERANO": "DUKUNG SENIOR",
		"QUIEREN TU VIDA PRIVADA": "KEHIDUPAN PRIBADIMU",
		"Una revista ofrece una fortuna por abrir las puertas de tu casa. Tu agente"
		+ " prefiere que sigas siendo un misterio que se cotiza.":
			"Sebuah majalah menawarkan uang besar untuk membuka pintu rumahmu. Agenmu lebih suka kamu tetap menjadi misteri yang harganya terus naik.",
		"ABRIR LAS PUERTAS": "BUKA PINTU",
		"MANTENER EL MISTERIO": "JAGA MISTERI",
		"LOS PAPARAZZI": "PAPARAZZI",
		"Un fotógrafo lleva días pegado a ti: el coche, el restaurante, la salida del entreno. Anoche te sacó cenando a las tantas y mañana sale en portada.":
			"Seorang fotografer berhari-hari membuntutimu: mobil, restoran, gerbang tempat latihan. Semalam lensanya menangkapmu makan di luar larut malam dan besok masuk halaman depan.",
		"DENUNCIARLO": "LAPORKAN",
		"EL BAILE DE MODA": "TREN JOGET",
		"El community manager del club te persigue para grabar el baile viral del"
		+ " momento. El míster odia esas cosas.":
			"Admin media sosial klub mengejarmu untuk merekam joget viral saat ini. Pelatih benci hal-hal seperti itu.",
		"GRABAR EL BAILE": "REKAM JOGET",
		"NI DE BROMA": "TIDAK MAU",
		"EL HIJO DEL MÍSTER": "ANAK PELATIH",
		"En el rondo te toca marcar al hijo del técnico, que anda de pruebas. Puedes"
		+ " hacerle un caño de los que duelen o dejarle lucirse.":
			"Di rondo kamu harus menjaga anak pelatih, yang sedang ikut seleksi. Kamu bisa mempermalukannya dengan nutmeg, atau membiarkannya unjuk gigi.",
		"HACERLE UN CAÑO": "NUTMEG DIA",
		"DEJARLE LUCIRSE": "BIAR DIA TAMPIL",
		"UN NIÑO BAJO LA LLUVIA": "ANAK DI BAWAH HUJAN",
		"Sales muerto y llueve, pero un niño lleva dos horas esperando con tu camiseta"
		+ " y un rotulador.":
			"Kamu keluar kelelahan dan hujan deras, tapi seorang anak sudah dua jam menunggu dengan jerseymu dan spidol.",
		"PARARTE A FIRMAR": "BERHENTI TEKEN",
		"AL AUTOBÚS": "NAIK BUS",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el"
		+ " equipo?'. Una frase gorda vende titulares, pero el míster lo verá.":
			"Seorang wartawan memancingmu: 'apa kamu benar-benar puas dengan peranmu di tim ini?'. Kalimat keras menjual judul, tetapi pelatih akan melihatnya.",
		"SOLTARLO TODO": "UNGKAP SEMUA",
		"¿CON QUIÉN TE SIENTAS?": "DUDUK BARENG SIAPA?",
		"Primer viaje con el equipo. En el autobús quedan tres sitios libres, y con quién te sientas se nota.":
			"Perjalanan pertama bersama tim. Di bus tersisa tiga kursi kosong, dan dengan siapa kamu duduk akan terlihat.",
		"CON LOS VETERANOS": "BARENG SENIOR",
		"CON EL MÍSTER": "BARENG PELATIH",
		"GRABANDO PARA REDES": "REKAM UNTUK MEDSOS",
		"TU PRIMERA ENTREVISTA": "WAWANCARA PERTAMAMU",
		"Micrófono delante y una sola pregunta abierta. Lo que digas te retrata.":
			"Mikrofon di depan wajah dan satu pertanyaan terbuka. Apa pun jawabanmu, itu menggambarkanmu.",
		"DEL EQUIPO": "SOAL TIM",
		"DE TUS METAS": "SOAL TARGET",
		"DE LA AFICIÓN": "SOAL SUPORTER",
		"¿A QUIÉN LO DEDICAS?": "UNTUK SIAPA?",
		"Acabas de marcar y la cámara te busca. El gesto que hagas ahora lo verá todo"
		+ " el estadio.":
			"Kamu baru saja mencetak gol dan kamera mencarimu. Apa pun yang kamu lakukan sekarang, seluruh stadion akan melihat.",
		"AL MÍSTER": "PELATIH",
		"A LA GRADA": "TRIBUN",
		"A CÁMARA, TU MARCA": "KAMERA, SPONSORMU",
		"DÍA LIBRE": "LIBUR",
		"Jornada sin obligaciones. Puedes desconectar en casa, salir con el grupo, o"
		+ " meter horas de gimnasio por tu cuenta.":
			"Hari tanpa kewajiban. Kamu bisa bersantai di rumah, keluar bersama grup, atau menambah jam gym sendiri.",
		"GIMNASIO POR TU CUENTA": "GYM SENDIRIAN",
		"LA FOTO DE EQUIPO": "FOTO TIM",
		"El fotógrafo coloca la foto de plantilla. Hay hueco delante con el capitán, en"
		+ " el centro entre todos, o pegado al cuerpo técnico.":
			"Fotografer mengatur foto skuad. Ada tempat di depan bersama kapten, di tengah bersama semua, atau tepat di samping staf pelatih.",
		"DELANTE, PROTAGONISTA": "DEPAN, JADI BINTANG",
		"EN EL CENTRO, CON TODOS": "TENGAH, BARENG SEMUA",
		"AL LADO DEL MÍSTER": "DI SAMPING PELATIH",
		"TRES MARCAS TE TANTEAN": "TIGA SPONSOR MENDEKAT",
		"Tres patrocinadores mueven ficha a la vez: la deportiva de siempre, una firma"
		+ " de moda, y la marca local de tu ciudad.":
			"Tiga sponsor bergerak sekaligus: merek olahraga langgananmu, label mode, dan merek lokal kotamu.",
		"LA DEPORTIVA": "OLAHRAGA",
		"LA DE MODA": "MODE",
		"LA LOCAL": "LOKAL",
		"¿QUÉ SUBES A TUS REDES?": "POSTING APA?",
		"Foto lista para publicar tras el partido. Un gesto para la grada, un elogio al"
		+ " vestuario, o un guiño al míster.":
			"Foto siap diunggah setelah laga. Isyarat untuk tribun, pujian untuk ruang ganti, atau kedipan untuk pelatih.",
		"GUIÑO A LA AFICIÓN": "SAPA SUPORTER",
		"ELOGIO AL VESTUARIO": "PUJI RUANG GANTI",
		"GRACIAS, MÍSTER": "MAKASIH, COACH",
		"NOVATADA EN LA COMIDA": "OSPEK PEMAIN BARU",
		"Primera comida con la plantilla y toca ritual de novato: subirte a la silla a"
		+ " cantar, o marcarte un baile. Elige tu veneno y reza.":
			"Makan pertama bersama skuad dan saatnya ritual pemain baru: naik ke kursi untuk bernyanyi, atau berjoget. Pilih salah satu dan berdoalah.",
		"CANTAR": "NYANYI",
		"Te saliste: el vestuario te corea de pie.":
			"Kamu luar biasa: ruang ganti berdiri ikut bernyanyi.",
		"Desafinaste fatal. Qué vergüenza ajena.": "Fals parah. Memalukan untuk ditonton.",
		"BAILAR": "JOGET",
		"¡La rompiste! Hasta el utillero lo grabó.":
			"Jogetmu pecah! Bahkan petugas perlengkapan merekamnya.",
		"Bailaste terrible. No lo superan.": "Jogetmu parah sekali. Mereka tak akan melupakannya.",
		"RETO VIRAL DE DOMINADAS": "JUGGLING VIRAL",
		"Un compañero saca el móvil: reto de toques al balón para subirlo a redes. La"
		+ " cámara ya está grabando.":
			"Seorang rekan setim mengeluarkan ponsel: tantangan juggling bola untuk diunggah ke medsos. Kamera sudah merekam.",
		"INTENTARLO": "COBA",
		"¡Clip perfecto! Se hace viral.": "Klip sempurna! Langsung viral.",
		"Se te cae a la segunda. Meme asegurado.":
			"Bolanya jatuh di sentuhan kedua. Pasti jadi meme.",
		"NO ME LA JUEGO": "TAK MAU RISIKO",
		"El crack del vestuario te reta a la consola delante de todos. Ganarle da"
		+ " galones; perder, cachondeo para semanas.":
			"Bintang ruang ganti menantangmu main konsol di depan semua orang. Mengalahkannya bikin kamu disegani; kalah berarti diolok-olok berminggu-minggu.",
		"ACEPTAR EL DUELO": "TERIMA DUEL",
		"¡Le ganas en la prórroga! Respeto total.":
			"Kamu mengalahkannya di perpanjangan waktu! Respek total.",
		"Paliza. Te lo recordarán a diario.": "Kalah telak. Kamu akan diejek tiap hari.",
		"OTRO DÍA": "NANTI",
		"NOCHE DE CASINO": "MALAM KASINO",
		"Tu agente te lleva al casino a 'hacer contactos'. La ruleta llama y él te"
		+ " anima a mojarte.":
			"Agenmu membawamu ke kasino untuk 'membangun relasi'. Roulette memanggil dan dia mendorongmu ikut bertaruh.",
		"APOSTAR FUERTE": "TARUH BESAR",
		"¡Pleno! El agente te mira con otros ojos.":
			"Pas di angka! Agenmu kini memandangmu berbeda.",
		"Lo dejas todo en la mesa. Ay.": "Semua uangmu habis di meja. Aduh.",
		"SOLO MIRAR": "LIHAT SAJA",
		"UN PRONÓSTICO ATREVIDO": "PREDIKSI BERANI",
		"En directo te piden mojarte con el próximo gran partido. Acertar te hace"
		+ " profeta; fallar, el hazmerreír.":
			"Di siaran langsung kamu diminta menebak laga besar berikutnya. Kalau tepat kamu jadi peramal; kalau meleset, bahan tertawaan.",
		"MOJARTE": "TEBAK",
		"Clavaste el pronóstico. Portada.": "Tebakanmu tepat sekali. Halaman depan.",
		"Ni una. Los memes no perdonan.": "Tak satu pun benar. Meme tak kenal ampun.",
		"AGUA, NI ME MOJO": "NETRAL SAJA",
		"DUELO DE PENALTIS": "DUEL PENALTI",
		"ACEPTAR": "TERIMA",
		"Le ganas la tanda. Ovación del grupo.": "Kamu memenangi adu penalti. Ruang ganti bersorak.",
		"Te para tres. Sonrojo.": "Tiga tendanganmu ditepis. Malu sekali.",
		"A LA DUCHA": "MANDI",
		"KARAOKE DE CONCENTRACIÓN": "KARAOKE TC",
		"Noche de karaoke en la concentración. Todos esperan a ver si te atreves con el"
		+ " micro.":
			"Malam karaoke di TC. Semua menunggu apakah kamu berani memegang mikrofon.",
		"COGER EL MICRO": "AMBIL MIKROFON",
		"¡Estrella de la noche! Grupo rendido.":
			"Bintang malam ini! Ruang ganti takluk.",
		"Un desastre. Y alguien lo grabó.": "Bencana. Dan seseorang merekamnya.",
		"PASAR EL MICRO": "OPER MIKROFON",
		"ESTRENAR BAILE DE GOL": "JOGET GOL BARU",
		"El vestuario te pincha para que te inventes una celebración nueva para el"
		+ " próximo gol. O sale icónica, o sale ridícula.":
			"Ruang ganti memanasimu untuk menciptakan selebrasi baru untuk golmu berikutnya. Kalau tidak ikonik, ya konyol.",
		"INVENTARME UNO": "BUAT SENDIRI",
		"¡Se copia en todos los patios! Icónico.": "Ditiru anak-anak di semua sekolah! Ikonik.",
		"Ridículo total. Mejor no marcar.": "Konyol total. Lebih baik tak usah cetak gol.",
		"CELEBRAR NORMAL": "SELEBRASI BIASA",
		"LA CENA LA PAGAS TÚ": "KAMU YANG TRAKTIR",
		"Victoria y el vestuario mira al recién llegado: la cena de celebración la paga el nuevo. Es tradición, y es cara.":
			"Menang, dan ruang ganti menatap pendatang baru: makan malam perayaan dibayar si anak baru. Itu tradisi, dan mahal.",
		"PAGAR CON GUSTO": "BAYAR IKHLAS",
		"ESCAQUEARTE": "KABUR",
		"FUISTE LA FIGURA": "KAMU BINTANGNYA",
		"Ganasteis y todos preguntan por ti. La sala de prensa está llena y tienes las"
		+ " piernas fundidas.":
			"Timmu menang dan semua mencarimu. Ruang jumpa pers penuh dan kakimu sudah lemas.",
		"ATENDER A TODOS": "LAYANI SEMUA",
		"DIRECTO A CASA": "PULANG SAJA",
		"BUSCANDO CULPABLES": "CARI KAMBING HITAM",
		"Derrota y el vestuario arde. El míster pide explicaciones mirando a los ojos."
		+ " Puedes dar la cara o mirar al suelo.":
			"Kalah, dan ruang ganti membara. Pelatih meminta penjelasan sambil menatap mata kalian. Kamu bisa menghadapinya atau menunduk.",
		"DAR LA CARA": "HADAPI",
		"MIRAR AL SUELO": "MENUNDUK",
		"BRONCA EN EL VESTUARIO": "RIBUT DI RUANG GANTI",
		"Tras perder, el capitán monta un pollo y señala a los que no corrieron. Puedes"
		+ " respaldarle o quedarte callado.":
			"Setelah kalah, kapten mengamuk dan menyebut mereka yang tak berlari. Kamu bisa mendukungnya atau tetap diam.",
		"RESPALDAR AL CAPITÁN": "DUKUNG KAPTEN",
		"CALLAR Y AGUANTAR": "DIAM SAJA",
		"PREGUNTA ENVENENADA": "PERTANYAAN JEBAKAN",
		"Recién perdido, un periodista te empuja a cargar contra el árbitro. Un titular"
		+ " fácil, pero el técnico odia el circo.":
			"Baru saja kalah, seorang wartawan mendorongmu menyerang wasit. Judul yang mudah, tapi pelatih benci drama.",
		"CONTENERTE": "TAHAN DIRI",
		"CARGAR CONTRA TODO": "HAJAR SEMUA",
		"GANASTE EL DERBI": "MENANG DERBY",
		"El derbi cayó de tu lado y la ciudad es una fiesta. La grada corea tu nombre y"
		+ " te invitan a salir a celebrar hasta el amanecer.":
			"Derby berpihak padamu dan kota berpesta. Tribun menyanyikan namamu dan kamu diundang keluar merayakan sampai fajar.",
		"CELEBRAR CON LA GRADA": "PESTA BARENG SUPORTER",
		"CELEBRAR CON MODESTIA": "RAYAKAN SEDERHANA",
		"EL RETO DEL DERBI": "TANTANGAN DERBY",
		"Antes del derbi el vestuario se retó: el que marque, se rapa. Marcaste. Ahora toca cumplir delante de las cámaras… o rajarte.":
			"Sebelum derby ruang ganti saling menantang: yang mencetak gol, kepalanya dibotaki. Kamu mencetak gol. Sekarang saatnya menepati di depan kamera… atau mundur.",
		"CUMPLIR Y RAPARTE": "BOTAKI KEPALA",
		"¡Leyenda del vestuario! La grada lo adora.":
			"Legenda ruang ganti! Tribun memujanya.",
		"El corte sale fatal. Cachondeo eterno.":
			"Potongannya jelek sekali. Diolok-olok selamanya.",
		"RAJARTE": "MUNDUR",
		"MOLESTIA A CUESTAS": "MENAHAN NYERI",
		"Arrastras una molestia. El médico aconseja parar; el míster quiere verte en el"
		+ " próximo entreno fuerte, sin excusas.":
			"Kamu menahan rasa nyeri. Dokter menyarankan berhenti; pelatih ingin melihatmu di latihan keras berikutnya, tanpa alasan.",
		"FORZAR POR EL MÍSTER": "PAKSA DEMI PELATIH",
		"HACER CASO AL MÉDICO": "IKUTI DOKTER",
		"TU CIUDAD TE LLAMA": "KOTAMU MEMANGGIL",
		"Tu ciudad natal organiza un partido benéfico y quieren tu cara en el cartel."
		+ " Es un día entero fuera.":
			"Kota kelahiranmu menggelar laga amal dan mereka ingin wajahmu di poster. Itu memakan satu hari penuh di luar.",
		"IR AL BENÉFICO": "MAIN LAGA AMAL",
		"EXCUSARTE": "MENOLAK",
		"ELIGES DORSAL": "PILIH NOMOR",
		"El utillero te deja elegir número: el 10 mediático que todos miran, el del"
		+ " ídolo que se retiró, o uno humilde de currante.":
			"Petugas perlengkapan membiarkanmu memilih nomor: nomor 10 yang jadi sorotan semua orang, nomor sang idola yang sudah pensiun, atau nomor sederhana si pekerja keras.",
		"EL 10 MEDIÁTICO": "10 SOROTAN",
		"EL DEL ÍDOLO": "MILIK IDOLA",
		"UNO DISCRETO": "SEDERHANA",
		"CAMPEONATO DE DARDOS": "KEJUARAAN DARTS",
		"En la concentración montan un torneo de dardos con piques de por medio. El que"
		+ " gana, manda esa semana.":
			"Di TC mereka menggelar turnamen darts dengan banyak adu gengsi. Yang menang berkuasa minggu itu.",
		"APUNTARTE": "DAFTAR",
		"¡Campeón! Mandas en el vestuario.": "Juara! Kamu berkuasa di ruang ganti.",
		"Última ronda de vergüenza.": "Posisi terakhir. Memalukan.",
		"EL PRESIDENTE BAJA": "PRESIDEN DATANG",
		"Tras la victoria el presidente baja eufórico al vestuario a felicitar uno por"
		+ " uno. Todos miran a quién saluda primero.":
			"Setelah kemenangan, presiden turun ke ruang ganti dengan gembira untuk memberi selamat satu per satu. Semua mata tertuju pada siapa yang dia sapa lebih dulu.",
		"DEDICARLE LA VICTORIA": "DEDIKASI KEMENANGAN",
		"CELEBRAR CON EL GRUPO": "RAYAKAN BARENG TIM",

		"El mundo": "Dunia",
		"Fase final de Conference": "Fase gugur Piala Challenge",
		"El club te ofrece cambiar de dorsal (llevas el {0})":
			"Klub menawarimu ganti nomor punggung (kamu memakai {0})",
		"ESTÁS EN EL ONCE DE {0}": "KAMU DI TIM INTI {0}",
		"El seleccionador te pone de salida. Tu puntuación ({0}) supera el corte del once ({1}).":
			"Pelatih timnas memainkanmu sebagai pemain inti. Skormu ({0}) melewati batas tim inti ({1}).",
		"CONVOCADO POR {0}": "DIPANGGIL {0}",
		"Entras en la lista de 23 y empiezas en el banquillo. Para el once te faltan {0} puntos.":
			"Kamu masuk daftar 23 pemain dan memulai dari bangku cadangan. Untuk tim inti kamu kurang {0} poin.",
		"FUERA DE LA LISTA DE {0}": "TAK DIPANGGIL {0}",
		"El seleccionador no te llama esta vez. Tu puntuación es {0} y el último convocado marca {1}: te faltan {2}.":
			"Pelatih timnas tidak memanggilmu kali ini. Skormu {0} dan pemain terakhir yang dipanggil punya {1}: kamu kurang {2}.",
		"Le quitaste el sitio a {0}.": "Kamu merebut tempat {0}.",
		"El once lo tiene {0}, con {1}.": "Tim inti dipegang {0}, dengan {1}.",
		"El último de la lista es {0}, con {1}.": "Pemain terakhir di daftar adalah {0}, dengan {1}.",
		"AMISTOSO: el seleccionador prueba gente y el corte baja {0} puntos. {1}":
			"UJI COBA: pelatih timnas mencoba wajah-wajah baru dan batasnya turun {0} poin. {1}",
		"TE PIDEN: {0} ({1}/{2})": "TUGASMU: {0} ({1}/{2})",
		"Juega {0} partidos con tu país.": "Mainkan {0} laga untuk negaramu.",
		"Marca {0} goles con tu país.": "Cetak {0} gol untuk negaramu.",
		"Cumpliste lo que te pidió {0}": "Kamu memenuhi permintaan {0}",
		"No cumpliste lo que te pidió {0}": "Kamu tidak memenuhi permintaan {0}",
		"CAPITÁN de {0}": "KAPTEN {0}",
		"Perdiste el brazalete de {0}": "Kamu kehilangan ban kapten {0}",
		"PERDISTE EL BRAZALETE": "BAN KAPTEN HILANG",
		"{0} {1} · TU MEDIA {2}": "{0} {1} · OVR {2}",
		"EL TÉCNICO NUEVO REPARTE DE CERO": "PELATIH BARU, MULAI DARI NOL",
		"VESTUARIO NUEVO": "SKUAD BARU",
		"SE QUEDA EN {0}": "TETAP DI {0}",
		"BRAZALETE": "KAPTEN",
		"BRAZALETE TUYO": "BAN KAPTENMU",
		"SIN RIVAL": "NOL LAWAN",
		"FRENADO POR TU PALABRA": "TERIKAT JANJIMU",
		"BRAZALETE: {0}/{1} PARTIDOS · SELECCIONADOR {2}/{3} · VESTUARIO {4}/{5} · SIENDO TITULAR": "BAN KAPTEN: {0}/{1} LAGA · PELATIH TIMNAS {2}/{3} · RUANG GANTI {4}/{5} · JADI INTI",
		"¡{0} se clasificó para {1}!": "{0} lolos ke {1}!",

		"Dieciseisavos": "32 besar",
		"Ronda": "Babak",
		"AMISTOSO": "UJI COBA",
		"TUS TIROS": "PETA SHOT",
		"LOS AMISTOSOS": "UJI COBA",
		"TORNEO EUROPEO": "TURNAMEN EROPA",
		"TORNEO SUDAMERICANO": "TURNAMEN A. SELATAN",
		"TORNEO NORTEAMERICANO": "TURNAMEN A. UTARA",
		"TORNEO ASIÁTICO": "TURNAMEN ASIA",
		"TORNEO AFRICANO": "TURNAMEN AFRIKA",
		"TORNEO DE OCEANÍA": "TURNAMEN OSEANIA",
		"TORNEO CONTINENTAL": "TURNAMEN BENUA",
		"DIF": "SG",
		"CC": "PE",
		"CEU": "PEU",
		"CCF": "PC",
		"Pediste salir: el club te ofrece a quien pregunte, también con el mercado cerrado. Estas ofertas no caducan con la ventana.":
			"Kamu minta pergi: klub menawarkanmu ke siapa pun yang bertanya, bahkan saat bursa tutup. Tawaran ini tidak hangus bersama jendela transfer.",
		"16avos": "R32",
		"DISTANCIA": "JARAK",
		"T": "T",
		"DENTRO DEL ÁREA": "DALAM KOTAK",
		"FUERA DEL ÁREA": "LUAR KOTAK",
		"DE MUY LEJOS": "JARAK JAUH",
		"PRODIGIO": "PRODIGI",
		"HEREDERO": "PEWARIS",
		"RECOMENDADO": "REKOMENDASI",
		"KILLER NATO": "SANG KILLER",
		"HIJO DE LEYENDA": "ANAK LEGENDA",


		"PICARDIA": "CERDIK",
		"MANO FRIA": "KEPALA DINGIN",
		"CARA DE ANUNCIO": "WAJAH IKLAN",
		"EL TELEFONO": "TELEPON",
		"EL NUEVE": "SANG 9",
		"EL QUE VOLVIO": "YANG KEMBALI",
		"EL DEPORTIVO": "MOBIL SPORT",
		"EL PATIO DE LA FAMILIA": "HALAMAN KELUARGA",
		"EL PREPARADOR DE LA FAMILIA": "PELATIH KELUARGA",
		"RECUPERACION": "PEMULIHAN",
		"Cuarenta mil personas fueron a verte firmar y te compraste el coche. Llegas tarde a entrenar, pero llegas: la prensa te adora y el vestuario menos.":
			"Empat puluh ribu orang datang melihatmu teken kontrak, lalu kamu beli mobil. Kamu telat latihan, tapi tetap datang: pers memujamu, ruang ganti kurang.",
		"El terreno de la familia ya era tuyo antes de firmar nada. La casa la levantas tú, pero el sitio donde ponerla no lo pagas.":
			"Lahan keluarga sudah jadi milikmu sebelum kamu teken apa pun. Rumahnya kamu bangun sendiri, tapi tempat untuk mendirikannya tak perlu kamu bayar.",
		"El que puso en pie a tu padre te conoce desde niño. Te recuperas entre partidos como nadie de tu edad, y a él no hay que pagarle.":
			"Orang yang membuat ayahmu bangkit lagi sudah mengenalmu sejak kecil. Kamu pulih antarlaga seperti tak ada yang seumurmu, dan dia tak menarik bayaran.",
		"EL AHIJADO": "ANAK ASUH",
		"BOTAS DE ORO": "SEPATU EMAS",
		"PIERNAS DE NIÑO": "KAKI BOCAH",
		"El uno contra uno lo aprendiste en una cancha sin red: +4 de regate desde el debut.":
			"Satu lawan satu kamu pelajari di lapangan tanpa jaring: +4 dribel sejak debut.",
		"Cuando pitan penalti, el balón lo coges tú: +5 de penales, que es lo que decide quién lo tira en tu equipo.":
			"Saat peluit penalti berbunyi, bolanya kamu yang ambil: +5 penalti, yang menentukan siapa algojo di timmu.",
		"Sales bien en foto y la prensa lo nota: empiezas con la puerta de los patrocinios abierta, no en tu segunda temporada.":
			"Kamu bagus di foto dan pers menyadarinya: kamu mulai dengan pintu sponsor yang sudah terbuka, bukan di musim kedua.",
		"Tienes el teléfono de alguien que mueve fichas: tu agente arranca con la mesa llena y el mercado abierto desde el primer mes.":
			"Kamu punya nomor seseorang yang menggerakkan pemain: agenmu mulai dengan meja penuh dan bursa terbuka sejak bulan pertama.",
		"El área es tuya: +3 de potencia, y si el 9 está libre en tu club, te lo guardan.":
			"Kotak penalti milikmu: +3 kekuatan, dan kalau nomor 9 kosong di klubmu, nomor itu disimpan untukmu.",
		"Ya jugaste aquí una vez y nadie lo olvidó: la grada te espera y la prensa te da el beneficio de la duda.":
			"Kamu pernah main di sini dan tak ada yang lupa: suporter menantimu dan pers memberimu kesempatan.",
		"En este vestuario tu apellido ya sonaba: el técnico te conoce antes de verte jugar, y la prensa lo sabe.":
			"Di ruang ganti ini nama belakangmu sudah dikenal: pelatih mengenalmu sebelum melihatmu main, dan pers tahu itu.",
		"Tres trofeos de goleador vinieron con unas CORONA DE ORO. Estrenas un par, sin estrenar y sin pagar.":
			"Tiga trofi top skor datang bersama sepasang GOLDEN CROWN. Kamu mulai dengan sepasang baru, tanpa pernah membayarnya.",
		"Las piernas no se acuerdan de los años: +6 a velocidad, aceleración y regate de salida.":
			"Kakimu tak ingat usia: +6 kecepatan, akselerasi, dan dribel awal.",
		"TE LLEVAS": "KAMU BAWA",
		"PASO 2 DE 3 · LO QUE TE GANASTE": "LANGKAH 2 DARI 3 · RAIHANMU",
		"LIBRES": "BEBAS",
		"POR DESBLOQUEAR": "TERKUNCI",
		"VIDA": "LIFE",
		"LESION": "CEDERA",
		"BANCO": "BANK",
		"TUS VENTAJAS": "PERKMU",
		"BOTAS HEREDADAS": "SEPATU WARISAN",
		"CON CARTEL": "NAMA BESAR",
		"PIE EDUCADO": "KAKI MANIS",
		"MANO DERECHA": "TANGAN KANAN",
		"EL DIEZ": "SANG 10",
		"CUERPO DE HIERRO": "TUBUH BAJA",
		"FICHAJE DE ORO": "REKRUT EMAS",
		"SANGRE AZUL": "DARAH BIRU",
		"SE ABRE CON": "BUKA DENGAN",
		"Lo que te ganaste en carreras anteriores. Cada ventaja gasta puntos de legado, y no alcanzan para todas: elige con cuáles arrancas —o con ninguna, y empieza de cero como todos.": "Yang kamu raih di karier sebelumnya. Setiap perk memakai poin legacy dan jumlahnya tak cukup untuk semua: pilih mana yang kamu pakai di awal, atau tak satu pun dan mulai dari nol seperti yang lain.",
		"Te quedaste las botas de aquel año en Tercera. Estrenas unas TRUENO XT: pegan más fuerte, y duran lo que duran.": "Kamu menyimpan sepatu dari musim di kasta ketiga itu. Kamu mulai dengan sepasang TRUENO XT: tendangan lebih keras, dan awetnya sebatas awetnya.",
		"Llegas con cartel: la grada ya coreó tu nombre una vez y te lo guarda.": "Kamu datang dengan nama besar: tribun ini pernah menyanyikan namamu sekali dan masih mengingatnya.",
		"Los primeros diez goles no se olvidan: +3 de precisión desde el debut.": "Sepuluh gol pertama tak terlupakan: +3 akurasi sejak debut.",
		"Un agente con oficina te firma antes que ningún club: más puertas y menos comisión. Su cuota mensual, también desde el día uno.": "Agen berkantor mengontrakmu sebelum klub mana pun: lebih banyak pintu, komisi lebih kecil. Iuran bulanannya juga mulai di hari pertama.",
		"Ya llevaste el 10 y no se te olvidó: +3 de visión, y si el 10 está libre en tu club, te lo guardan.": "Kamu pernah pakai nomor 10 dan tak lupa: +3 visi, dan kalau nomor 10 kosong di klubmu, nomor itu disimpan untukmu.",
		"Trescientos partidos enseñan a caer: 20% menos de riesgo de lesión, toda la carrera.": "Tiga ratus laga mengajarimu cara jatuh: risiko cedera turun 20%, sepanjang karier.",
		"Heredas el apellido y la casa: entras a vivir el primer día. El mantenimiento también se hereda.": "Kamu mewarisi nama belakang dan rumahnya: kamu langsung tinggal di hari pertama. Biaya perawatannya ikut diwarisi.",
		"No llegas a pelear un sitio: llegas a ocuparlo. Un peldaño más de rol en tu contrato de debut.": "Kamu datang bukan untuk berebut tempat: kamu datang untuk mengisinya. Satu tingkat lebih tinggi untuk peran di kontrak debutmu.",
		"El seleccionador ya sabe quién eres: empiezas con crédito para entrar en la primera lista.": "Pelatih timnas sudah tahu siapa kamu: kamu mulai dengan modal untuk masuk daftar pertama.",
		"Naciste con algo. Empiezas con 3 puntos de habilidad por repartir.":
			"Kamu lahir dengan bakat. Kamu mulai dengan 3 poin skill untuk dibagi.",
		"La familia te respalda: +$35.000 en el banco desde el primer día.":
			"Keluarga mendukungmu: +$35,000 di bank sejak hari pertama.",
		"El técnico ya oyó hablar de ti. Debutas con su confianza, no en la grada.":
			"Pelatih sudah mendengar tentangmu. Kamu debut dengan kepercayaannya, bukan dari tribun.",
		"El gol lo llevas puesto: +6 a potencia, precisión y efecto de salida.":
			"Gol sudah melekat padamu: +6 kekuatan, akurasi, dan efek awal.",
		"Cargas un apellido: +$20.000 y 2 puntos de habilidad. La sombra pesa.":
			"Kamu memikul sebuah nama belakang: +$20,000 dan 2 poin skill. Bayangannya berat.",
		"Véncelo en un partido (con cualquier carrera) para desbloquearlo.":
			"Kalahkan mereka dalam satu laga (di karier mana pun) untuk membukanya.",
		"Completa una temporada en {0}ª división o ficha por un club de {1}ª para desbloquear.":
			"Selesaikan satu musim di divisi {0} atau gabung klub divisi {1} untuk membukanya.",
		"LIGA ESPAÑOLA": "LIGA SPANYOL",
		"LIGA INGLESA": "LIGA INGGRIS",
		"LIGA ITALIANA": "LIGA ITALIA",
		"LIGA ALEMANA": "LIGA JERMAN",
		"LIGA MEXICANA": "LIGA MEKSIKO",
		"LIGA LUSA": "L. PORTUGAL",
		"LIGA FRANCESA": "LIGA PRANCIS",
		"LIGA NEERLANDESA": "LIGA BELANDA",
		"LIGA BRASILEÑA": "LIGA BRASIL",
		"LIGA ARGENTINA": "LIGA ARGENTINA",
		"LIGA AMERICANA": "LIGA AMERIKA",
		"LIGA SAUDI": "LIGA SAUDI",
		"LIGA TURCA": "LIGA TURKI",
		"LIGA BELGA": "LIGA BELGIA",
		"{0}G {1}A · {2} · {3}": "{0}G {1}A · {2} · {3}",
		"EQUIPO ENCENDIDO": "TIM PANAS",
		"EQUIPO FRÍO": "TIM DINGIN",
		"PORTERO EN LOS NERVIOS": "KIPER GUGUP",
		"PORTERO TENSO": "KIPER TEGANG",




		"Diagonal del extremo": "Diagonal sayap",
		"El pasillo interior": "Celah tengah",
		"El embudo": "Corong",
		"La defensa volcada": "Bek tergeser",
		"Doblada por fuera": "Overlap di luar",
		"Aislado en la banda": "Terisolasi di sayap",
		"La subida por fuera": "Overlap lewat sayap",
		"El tercer hombre": "Pemain ketiga",
		"Indirecta al costado del área": "Indirect di samping kotak",
		"Indirecta de segunda línea": "Indirect dari jauh",
		"Contra el muro replegado": "Lawan tembok bertahan",
		"Presión alta tras la pérdida": "Pressing usai kehilangan bola",
		"Contra tras córner rival": "Serangan balik usai korner lawan",
		"Ley de la ventaja": "Hukum keuntungan",
		"Tres contra tres": "Tiga lawan tiga",
		"Falta lejana colgada al área": "Tendangan bebas jauh ke kotak",
		"Falta lejana desde la banda": "Tendangan bebas jauh dari sayap",
		"Falta desde tres cuartos": "Tendangan bebas jarak menengah",
		"Cambio corto": "Pindah sisi pendek",
		"Cambio de banda": "Pindah sisi",
		"Cambio largo": "Pindah sisi jauh",
		"Salir de la presión": "Lepas dari pressing",
		"Cruza el medio campo": "Lewati garis tengah",

		"¡LA RECUPERASTE! ATACA": "BOLA DIREBUT! SERANG",
		"GOL EN CONTRA": "KEBOBOLAN",
		"DESBORDADO": "DILEWATI",
		"LA PARÓ TU PORTERO": "KIPERMU SAVE",
		"LE DEJASTE TIRAR": "DIBIARKAN TEMBAK",
		"Recuperar el balón": "Rebut bola",
		"DEFENSA": "BERTAHAN",
		"El balón NO es tuyo. Métete entre él y tu portería: al llegarle bien puesto, se la quitas.": "Bola BUKAN milikmu. Masuk di antara dia dan gawangmu: kalau posisimu pas saat sampai, kamu rebut bola itu.",
		"Te la sirven": "Diumpan padamu",
		"Te la traen conduciendo y te la pasan. Apunta y remátala de primera, o se te escapa.": "Mereka menggiring masuk lalu mengumpanmu. Bidik dan selesaikan sekali sentuh, atau bola lepas.",
		"Espera el pase; luego jala y suelta": "Tunggu umpan; lalu tarik dan lepas",
		"REMATE AÉREO": "FINISH UDARA",
		"Cabezazos": "Sundulan",
		"Voleas": "Voli",
		"Chilenas": "Tendangan salto",
		"Te cuelgan el centro a la cabeza. Espera a que llegue y cabecea a puerta.": "Bola silang diarahkan ke kepalamu. Tunggu sampai tiba dan sundul ke gawang.",
		"Espera el centro; luego jala y suelta": "Tunggu umpan silang; lalu tarik dan lepas",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que toque el suelo.": "Bola diberikan ke dadamu: kamu kontrol lalu voli sebelum menyentuh tanah.",
		"Espera el control; luego jala y suelta": "Tunggu kontrol; lalu tarik dan lepas",
		"Saltas de espaldas al arco: apunta a puerta aunque no la veas.": "Kamu melompat membelakangi gawang: bidik ke gawang walau tak terlihat.",
		"Raso al pie": "Rendah ke kaki",
		"Te la ponen botando": "Diumpan memantul",
		"¡De primera!": "Sekali sentuh!",
		"Espera el momento perfecto": "Tunggu momen yang pas",
		"¡Cabecea!": "Sundul!",
		"Tocada a destiempo": "Sentuhan salah waktu",
		"Tocada de refilón": "Sentuhan menyerempet",
		"¡Al primer toque!": "Sentuhan pertama!",
		"¡Al bote pronto!": "Half-volley!",
		"¡Cazada al bote!": "Disambar saat memantul!",
		"El bote te ganó": "Pantulan mengalahkanmu",
		"Bote de refilón": "Pantulan menyerempet",
		"¡La bajaste y pegaste!": "Kamu turunkan dan tendang!",
		"¡Control y tiro!": "Kontrol dan tembak!",
		"Tiro a destiempo tras el control": "Tembakan salah waktu usai kontrol",
		"De refilón tras el control": "Menyerempet usai kontrol",
		"¡Cabezazo pleno!": "Sundulan penuh!",
		"¡Con toda la frente!": "Pakai seluruh dahi!",
		"Saltaste a destiempo": "Lompatanmu salah waktu",
		"De refilón con la frente": "Menyerempet dahi",
		"¡Volea!": "Voli!",
		"¡De pecho y volea!": "Dada lalu voli!",
		"Volea a destiempo": "Voli salah waktu",
		"Volea de refilón": "Voli menyerempet",
		"¡Chilena de libro!": "Tendangan salto sempurna!",
		"Chilena a destiempo": "Tendangan salto salah waktu",
		"Chilena de refilón": "Tendangan salto menyerempet",
		"Saltaste tarde": "Kamu melompat telat",
		"Chilena tardía": "Tendangan salto telat",
		"Te adelantaste a la volea": "Voli terlalu dini",
		"Volea tardía": "Voli telat",
		"Raso del lado ciego": "Dari sisi butamu",
		"Raso a la carrera": "Rendah searah larimu",
		"Tensa por el aire": "Keras lewat udara",
		"Te la cuelgan": "Diumpan lambung",
		"Raso con rosca": "Rendah melengkung",
		"Raso largo": "Rendah dan jauh",
		"Filtrado al hueco": "Diselipkan ke ruang kosong",
		"Filtrado con rosca": "Diselipkan melengkung",
		"Con comba": "Melengkung",
		"Centro a la cabeza": "Silang ke kepala",
		"Centro al pecho": "Silang ke dada",
		"Centro a la chilena": "Silang untuk tendangan salto",
		"Cambio de juego": "Pindah arah permainan",
		"Centro de la otra banda": "Silang dari sayap seberang",
		"Al pecho desde la otra banda": "Ke dada dari sayap seberang",
		"Al pecho desde la banda": "Ke dada dari sayap",
		"Botando desde lejos": "Memantul dari jauh",
		"Chilena desde la otra banda": "Silang untuk salto dari sayap seberang",
		"A media altura": "Setinggi paha",
		"Botando de muy lejos": "Memantul dari jauh sekali",
		"Centro con rosca": "Umpan silang melengkung",
		"Chilena con rosca": "Umpan silang melengkung untuk tendangan salto",
		"Al pecho con rosca": "Umpan silang melengkung ke dada",
		"Tras el punto penal": "Di belakang titik penalti",
		"Córner a la cabeza": "Korner ke kepalamu",
		"Córner a la chilena": "Korner untuk tendangan salto",
		"Córner al borde del área": "Korner ke tepi kotak penalti",
		"Falta colgada a la cabeza": "Tendangan bebas melambung ke kepalamu",
		"Falta colgada a la chilena": "Tendangan bebas melambung untuk salto",
		"Falta colgada al pecho": "Tendangan bebas melambung ke dadamu",
		"En la frontal": "Di depan kotak",
		"En el área": "Di dalam kotak",
		"En el área chica": "Di kotak gawang",
		"Escorado en el área": "Melebar di kotak",
		"Al costado del área": "Di samping kotak",
		"Pegado a la banda": "Mepet sayap",
		"Centrar por la banda": "Umpan silang dari sayap",
		"Pon el CENTRO a un compañero: se gana completándolo, no tirando a puerta.": "Kirim UMPAN SILANG ke rekan: kamu menang dengan menyelesaikannya, bukan menembak.",
		"Cuelga el centro a un compañero": "Lambungkan silang ke rekan setim",
		"Centro corto": "Silang pendek",
		"Centro largo": "Silang jauh",
		"¡Centro puesto!": "Silang sampai!",
		"El centro no llegó": "Silangnya tak sampai",
		"notaCENTRO PUESTO": "SILANG SAMPAI",
		"Arrastra para correr; no hay nada más que tocar": "Seret untuk lari; tak ada lagi yang perlu disentuh",
		"Ponte entre el balón y tu portería para robar. Al recuperar, sigue arrastrando y ataca.": "Masuk di antara bola dan gawangmu untuk merebutnya. Setelah dapat, terus seret dan serang.",
		"Arrastra para correr; toca con un segundo dedo para barrerte": "Seret untuk lari; ketuk dengan jari kedua untuk sliding",
		"FALTA": "FOUL",
		"RECUPERADA": "DIREBUT",
		"TE DESBORDÓ": "DIA LEWATIMU",
		"Campo abierto": "Open play",
		"PASE": "UMPAN",
		"Tu fondo: los minutos que aguantas —a tope juegas los 90' y llegas a la prórroga—, lo que te cuesta cada partido y lo que repones. También te hace menos propenso a lesionarte.":
			"Staminamu: berapa menit kamu bertahan (penuh, kamu main 90 menit dan sampai ET), tenaga yang terkuras tiap laga, dan seberapa banyak yang pulih. Juga membuatmu lebih kebal cedera.",
		"Copa de Campeones": "Piala Elite",
		"Copa Europa": "Piala Europa",
		"Copa Conferencia": "Piala Challenge",
		"Jugador del Año": "Pemain Terbaik",
		"Bota (Liga)": "Sepatu (Liga)",
		"Mejor (Copa de Campeones)": "Terbaik (Piala Elite)",
		"Bota (Copa de Campeones)": "Sepatu (Piala Elite)",
		"Asist. (Copa de Campeones)": "Ast. (Piala Elite)",
		"Mejor (Copa Europa)": "Terbaik (Piala Europa)",
		"Bota (Copa Europa)": "Sepatu (Piala Europa)",
		"Asist. (Copa Europa)": "Ast. (Piala Europa)",
		"Mejor (Copa Conferencia)": "Terbaik (Piala Challenge)",
		"Bota (Copa Conferencia)": "Sepatu (Piala Challenge)",
		"Asist. (Copa Conferencia)": "Ast. (Piala Challenge)",
		"VUELVEN A LLAMAR": "TELEPON LAGI",
		"TU AGENTE LA SOSTIENE": "AGENMU MENAHAN",
		"NO SE DEJÓ SOSTENER": "TAK BISA DITAHAN",
		"SE HARTARON DE TUS NOES": "BOSAN DENGAN TOLAKANMU",
		"LLEGA MENOS DE LO QUE ERA": "TAWARAN TURUN",
		"MEJORAN LA OFERTA": "TAWARAN NAIK",
		"TRASPASO PACTADO": "TRANSFER SEPAKAT",
		"NO LLEGAN A LO QUE PIDEN": "TAK MAMPU BAYAR",
		"RETIRAN LA PUJA": "TAWARAN DITARIK",
		"HAY PELEA POR TI": "DIREBUTKAN",
		"APRIETA POR TI": "MENGEJARMU",
		"COBRAN POR TU VENTA": "UNTUNG DARI JUALMU",
		"¡Salió bien!": "Berhasil!",
		"Salió mal…": "Gagal...",
		"No les das el perfil todavía.": "Kamu belum cocok dengan profil mereka.",
		"Ese club no existe.": "Klub itu tidak ada.",
		"Ya juegas ahí.": "Kamu sudah main di sana.",
		"Ya tienes su oferta sobre la mesa.": "Tawaran mereka sudah ada di mejamu.",
		"Les dijiste que no en esta ventana.": "Kamu sudah menolak mereka di bursa ini.",
		"Es un club muy por debajo del tuyo: no bajan a por ti.":
			"Klub itu jauh di bawah klubmu: mereka tak akan datang untukmu.",
		"Está demasiadas categorías por encima: se sube de una en una.":
			"Mereka terlalu banyak kasta di atas: naiknya satu per satu.",
		"No pueden pagar lo que costaría sacarte.":
			"Mereka tak sanggup membayar biaya melepaskanmu.",
		"Tu última concentración": "Panggilan terakhirmu",
		"{0}: {1} fuera en la fase de grupos (sin ti)": "{0}: {1} gugur di fase grup (tanpamu)",
		"{0} se clasificó para {1} (sin ti)": "{0} lolos ke {1} (tanpamu)",
		"{0} se quedó fuera de {1}": "{0} gagal lolos ke {1}",
		"{0}: fuera en la fase de grupos con {1}": "{0}: gugur di fase grup bersama {1}",
		"{0} se clasificó para {1}": "{0} lolos ke {1}",
		"{0} no se clasificó para {1}": "{0} tidak lolos ke {1}",
		"{0} sólo jugó amistosos este año": "{0} hanya main uji coba tahun ini",
		"{0} amistosos con {1}: {2} ganados": "{0} uji coba bersama {1}: menang {2}",
		"Tu palmarés": "Palmaresmu",
		"Tu temporada": "Musimmu",
		"Dónde juegas": "Tempatmu main",
		"El seleccionador": "Pelatih timnas",
		"Llevas el brazalete": "Kamu pakai ban kapten",
		"Ya eres del grupo": "Kamu sudah bagian dari grup",
		"Eliminado de la copa": "Tersingkir dari piala",
		"En dieciseisavos de copa": "Di 32 besar piala",
		"En octavos de copa": "Di 16 besar piala",
		"En cuartos de copa": "Di perempat final piala",
		"En semifinales de copa": "Di semifinal piala",
		"En la final de copa": "Di final piala",
		"Partidos con la selección": "Laga bersama timnas",
		"Asistencias con la selección": "Assist bersama timnas",
		"El Diez": "Sang 10",
		"Llegar a llevar el 10 a la espalda.": "Kenakan nomor 10 di punggungmu.",
		"El Nueve de un Grande": "Nomor 9 Klub Raksasa",
		"Llevar el 9 en uno de los clubes más fuertes del mundo.":
			"Pakai nomor 9 di salah satu klub terkuat di dunia.",
		"Adiós Internacional": "Pamit dari Timnas",
		"Colgar la camiseta de tu país por decisión propia, sin dejar el club.":
			"Gantung jersey negaramu atas keputusanmu sendiri, tanpa pergi dari klub.",
		"Brazalete del País": "Ban Kapten Negara",
		"Llevar la cinta de capitán de tu selección.": "Kenakan ban kapten timnasmu.",
		"Rey de la Conference": "Raja Piala Challenge",
		"Ganar la Conference.": "Menangkan Piala Challenge.",
		"Ser el máximo goleador de la Conference.": "Jadi top skor Piala Challenge.",
		"Goles y Pases": "Gol dan Umpan",
		"Verdugo de Países Bajos": "Momok Belanda",
		"Cuarenta Mil": "Empat Puluh Ribu",
		"TELEVISIÓN": "TELEVISI",
		"MIS CAMISETAS": "JERSEYKU",
		"LÁMPARA": "LAMPU",
		"JARDÍN": "TAMAN",
		"CINTA": "TREADMILL",
		"COCINA": "DAPUR",
		"ESPEJO": "CERMIN",
		"LIBRERO": "RAK BUKU",
		"MANCUERNAS": "DUMBEL",
		"PLANTA": "BUNGA",
		"MANSION": "MANSION",
		"FINCA": "PERKEBUNAN",
		"PREMIOS AL MEJOR": "PEMAIN TERBAIK",
		"Premios al Mejor": "Gelar Pemain Terbaik",
		"JUGADOR DEL AÑO": "PEMAIN TERBAIK",
		"BOTA": "BOOT",
		"Bota": "Sepatu",
		"Torneo Europeo": "Turnamen Eropa",
		"Torneo Sudamericano": "Turnamen Amerika Selatan",
		"Torneo Norteamericano": "Turnamen Amerika Utara",
		"Torneo Asiático": "Turnamen Asia",
		"Torneo Africano": "Turnamen Afrika",
		"Torneo de Oceanía": "Turnamen Oseania",
		"TODOS LOS PREMIOS AL MEJOR": "SEMUA GELAR PEMAIN TERBAIK",
		"{0} PREMIOS AL MEJOR": "{0}X PEMAIN TERBAIK",
		"Falta indirecta en el área": "Tendangan bebas indirect di kotak",
		"CARRERA": "KARIER",
		"TIROS": "SHOT",
		"ACELERACION": "AKSELERASI",
		"ENTRADA": "TAKLING",
		"CRUZ": "CROSS",
		"INICIAL": "AWAL",
		"Sólido": "Polos",
		"Espina": "Duri",
		"Puntos": "Titik",
		"Estrellas": "Bintang",
		"Pelo 2": "Rambut 2",
		"Pelo 3": "Rambut 3",
		"Pelo 5": "Rambut 5",
		"Pelo 6": "Rambut 6",
		"Cejas 1": "Alis 1",
		"Cejas 2": "Alis 2",
		"Cejas 3": "Alis 3",
		"Cejas 4": "Alis 4",
		"Cejas 5": "Alis 5",
		"Rastas": "Dreadlock",
		"Peinado (pieza)": "Gaya rambut (bagian)",
		"Ninguno": "Tak ada",
		"Máscara": "Topeng",
		"Banda": "Ikat kepala",
		"Banda roja": "Ikat kepala merah",
		"Banda azul": "Ikat kepala biru",
		"Banda negra": "Ikat kepala hitam",
		"Banda oro": "Ikat kepala emas",
		"Fade alto": "High fade",
		"Fade bajo": "Low fade",
		"Peinado atrás": "Sisir ke belakang",
		"Quiff corto": "Quiff pendek",
		"Banda pelo": "Ikat rambut",
		"Doble brazalete": "Ban ganda",
		"Media manga": "Setengah lengan",
		"Banda verde": "Ikat kepala hijau",
		"Banda rosa": "Ikat kepala pink",
		"Banda naranja": "Ikat kepala oranye",
		"Económicos": "Hemat",
		"Clásicos": "Klasik",
		"Contemporáneos": "Modern",
		"Sin pelo": "Tanpa rambut",
		"Cortes cortos": "Potongan pendek",
		"Cortes medianos": "Potongan sedang",
		"Cortes largos": "Potongan panjang",
		"Accesorio de pelo": "Aksesori rambut",
		"Banda deportiva": "Ikat kepala olahraga",
		"Cinta fina": "Pita tipis",
		"Liga para recogido": "Karet rambut",
		"Máscara de protección": "Topeng pelindung",
		"Sin máscara": "Tanpa topeng",
		"Con máscara": "Dengan topeng",
		"Tipo de ceja": "Bentuk alis",
		"Sin cejas": "Tanpa alis",
		"Tatuaje facial": "Tato wajah",
		"Lado del rostro": "Sisi wajah",
		"Tinta facial": "Tinta wajah",
		"Conjuntos completos": "Setelan lengkap",
		"Clásico": "Klasik",
		"Del traje": "Senada",
		"Pañuelo de saco": "Sapu tangan saku",
		"Cinturón": "Ikat pinggang",
		"Color del accesorio": "Warna aksesori",
		"Deportivo": "Sporty",
		"De lujo": "Mewah",
		"CLASIF J{0}": "KUALIF P{0}",
		"SIN PARTIDO": "TANPA LAGA",


		"Aperturas vistas": "Pembukaan dilihat",
		"· la saltaron": "· dilewati",
		"· salieron al campo": "· masuk ke lapangan",
		"· el estadio tardó más de 3 s (el cine perdió hasta 1 s)": "· stadion butuh lebih dari 3 s (sinematik kehilangan hingga 1 s)",
		"Apertura: décimas hasta ver el estadio (peor)": "Pembukaan: sepersepuluh detik sampai stadion tampil (terburuk)",
		"·· sin ninguna tirada (no gastó cupo)": "·· tanpa undian (tak memakai jatah)",
		"·· con una tirada": "·· dengan satu undian",
		"·· con dos o más tiradas": "·· dengan dua undian atau lebih",
		"Academias empezadas": "Akademi dimulai",
		"· pasaron el 1 (MUEVETE)": "· lolos no. 1 (BERGERAK)",
		"· pasaron el 2 (PEGALE)": "· lolos no. 2 (TENDANG)",
		"· pasaron el 3 (ENCARA)": "· lolos no. 3 (HADAPI)",
		"· pasaron el 4 (SIRVE AL AREA)": "· lolos no. 4 (SILANG KE KOTAK)",
		"· pasaron el 5 (BALON PARADO)": "· lolos no. 5 (BOLA MATI)",
		"Academias terminadas": "Akademi selesai",
		"{0} espera respuesta":
			"{0} menunggu jawaban",
		"Tu oferta caduca. Nadie va a decidir por ti.":
			"Tawaranmu hampir hangus. Tak ada yang akan memutuskan untukmu.",
		"Hoy es tu cumpleaños":
			"Hari ini ulang tahunmu",
		"El vestuario te ha preparado algo.":
			"Ruang ganti menyiapkan sesuatu untukmu.",
		"Tu once te espera.":
			"Tim intimu menunggu.",
		"Ya casi estás en forma":
			"Kamu hampir bugar",
		"Una semana más y vuelves al once.":
			"Seminggu lagi dan kamu kembali ke tim inti.",
		"Tu carrera sigue ahí":
			"Kariermu masih menunggu",
		"Tu temporada con el {0} sigue a medias.":
			"Musimmu bersama {0} baru separuh jalan.",
		"AVISOS":
			"NOTIF",
		"AVISARME EN EL TELÉFONO":
			"INGATKAN DI PONSEL",
		"Un recordatorio cuando algo te espera: una oferta que caduca, tu cumpleaños, la vuelta de una lesión. Nunca más de uno al día.":
			"Pengingat saat ada yang menunggumu: tawaran yang hampir hangus, ulang tahunmu, pulihnya cedera. Tak pernah lebih dari satu sehari.",
		"Los tienes bloqueados para este juego en los Ajustes de tu teléfono.":
			"Kamu memblokirnya untuk game ini di Setelan ponselmu.",
		"Altas abiertas (NUEVA CARRERA)": "Pendaftaran dibuka (KARIER BARU)",
		"QUITARLO":
			"LEPAS",
		"El día del calendario de fuera en el que el juego se acuerda de ti. Sin año: no hace falta.":
			"Hari di kalender luar saat game mengingatmu. Tanpa tahun: tak perlu.",
		"· entraron al campo":
			"· masuk ke lapangan",
		"· escribieron un nombre (ya jugando)":
			"· mengetik nama (sudah main)",
		"SIGO":
			"LANJUT",
		"LO DEJO POR HOY":
			"CUKUP HARI INI",
		"Eso es el juego entero: apuntas, ajustas la fuerza y pegas. Quedan unos ejercicios más para sacarte mejores ofertas de club.":
			"Itulah seluruh game-nya: kamu membidik, mengatur kekuatan, lalu menendang. Masih ada beberapa latihan lagi untuk meraih tawaran klub yang lebih baik.",
		"· marcaron su primer gol en la escuela":
			"· mencetak gol pertama di akademi",
		"· escribieron un nombre": "· mengetik nama",
		"· aceptaron jugarla": "· setuju memainkannya",
		"· llegaron a marcar un gol": "· sampai mencetak gol",
		"Entradas a LA CAJA desde el hub": "Masuk ke KOTAK dari hub",
		"Carreras creadas": "Karier dibuat",
		"Jornadas jugadas": "Pekan dimainkan",
		"Arranques del juego (en frío)": "Peluncuran game (cold start)",
		"· el anterior se cerró solo (crash o memoria)": "· sebelumnya tertutup sendiri (crash atau memori)",
		"· · y fue en pleno partido": "· · dan terjadi di tengah laga",
		"· · con la app inactiva (¿cerrada desde el selector?)": "· · saat aplikasi tidak aktif (ditutup dari pengalih aplikasi?)",
		"· · tras un aviso de memoria de iOS": "· · setelah peringatan memori iOS",
		"Avisos de memoria de iOS": "Peringatan memori iOS",
		"· en pleno partido": "· di tengah laga",
		"Partidos jugados: ganados": "Laga dimainkan: menang",
		"· empatados": "· seri",
		"· perdidos": "· kalah",
		"Partidos abandonados desde la pausa": "Laga ditinggalkan dari menu jeda",
		"Minutos en el campo": "Menit di lapangan",
		"Minutos en menús": "Menit di menu",
		"Goles marcados": "Gol tercipta",
		"· con la selección": "· bersama timnas",
		"· de penal": "· dari penalti",
		"· · a lo Panenka": "· · gaya Panenka",
		"· de tiro libre": "· dari tendangan bebas",
		"· de córner": "· dari korner",
		"· · olímpicos": "· · langsung dari korner",
		"· de cabeza": "· sundulan",
		"· de volea": "· voli",
		"· de chilena": "· tendangan salto",
		"· en mano a mano": "· satu lawan satu",
		"· en disparo frontal": "· tembakan dari depan",
		"· desde lejos": "· dari jauh",
		"· desde ángulo cerrado": "· dari sudut sempit",
		"· al contraataque": "· dari serangan balik",
		"· en centro al área": "· dari umpan silang ke kotak",
		"· en rebote en el área": "· dari bola rebound di kotak",
		"· en la jugada de volea": "· dari skema voli",
		"· en saque de banda largo": "· dari lemparan jauh",
		"· en falta indirecta en el área": "· dari tendangan bebas indirect di kotak",
		"· tras regate libre": "· usai dribel bebas",
		"· saliendo desde tu campo": "· membangun dari area sendiri",
		"· desde un saque de meta": "· dari tendangan gawang",
		"· en otras jugadas": "· dari skema lain",
		"Hat-tricks (3 goles o más en un partido)": "Hat-trick (3 gol atau lebih dalam satu laga)",
		"Autogoles": "Gol bunuh diri",
		"Penales fallados en el partido": "Penalti gagal di laga",
		"Penales fallados en tandas": "Penalti gagal di adu penalti",
		"Tiros desviados por un defensa": "Tembakan dibelokkan bek",
		"· que acabaron en córner": "· berakhir jadi korner",
		"· que el defensa metió en su portería": "· yang dimasukkan bek ke gawangnya sendiri",
		"· · a menos de 20 m": "· · kurang dari 20 m",
		"· · de 20 a 25 m": "· · 20 sampai 25 m",
		"· · de 25 a 30 m": "· · 25 sampai 30 m",
		"· · a 30 m o más": "· · 30 m atau lebih",
		"· · rematados de cabeza": "· · diselesaikan dengan sundulan",
		"· · rematados de volea": "· · diselesaikan dengan voli",
		"· · rematados de chilena": "· · diselesaikan dengan tendangan salto",
		"· a menos de 6 m del arco": "· kurang dari 6 m dari gawang",
		"· de 6 a 16 m": "· 6 sampai 16 m",
		"· de 16 a 25 m": "· 16 sampai 25 m",
		"· de 25 a 30 m": "· 25 sampai 30 m",
		"· a 30 m o más": "· 30 m atau lebih",
		"Gol más lejano (m)": "Gol terjauh (m)",
		"Tiro libre más lejano metido (m)": "Tendangan bebas terjauh yang masuk (m)",
		"Pase de gol más largo (m)": "Umpan assist terjauh (m)",
		"Asistencias dadas": "Assist diberikan",
		"Partidos jugados con el club": "Laga bersama klub",
		"Partidos jugados con la selección": "Laga bersama timnas",
		"Derbis ganados": "Derby dimenangkan",
		"Partidos ganados remontando": "Menang comeback",
		"Títulos de equipo ganados": "Gelar tim diraih",
		"· ligas": "· liga",
		"· copas": "· piala",
		"· continentales de clubes y Mundial de Clubes": "· gelar kontinental klub dan Kejuaraan Dunia Klub",
		"· ascensos": "· promosi",
		"· Mundiales con la selección": "· Kejuaraan Dunia bersama timnas",
		"· continentales con la selección": "· gelar kontinental bersama timnas",
		"Premios individuales": "Penghargaan individu",
		"· Balones de Oro": "· Gelar Pemain Terbaik",
		"Veces Jugador del Partido": "Kali jadi Pemain Terbaik Laga",
		"Veces Jugador del Mes": "Kali jadi Pemain Terbaik Bulanan",
		"Traspasos firmados": "Transfer diteken",
		"· millones pagados por ellos": "· juta dibayarkan untuk mereka",
		"Cargas con un técnico duplicado (se arregló solo)": "Pemuatan dengan pelatih ganda (diperbaiki otomatis)",
		"· arreglos del carrusel de técnicos en ellas": "· perbaikan rotasi pelatih di dalamnya",
		"Goles de club de antes (carreras guardadas)": "Gol klub sebelumnya (karier tersimpan)",
		"Asistencias de club de antes": "Assist klub sebelumnya",
		"Partidos de club de antes": "Laga klub sebelumnya",
		"Títulos de equipo de antes": "Gelar tim sebelumnya",
		"Premios individuales de antes": "Penghargaan individu sebelumnya",
		"Más goles de club en una carrera": "Gol klub terbanyak dalam satu karier",
		"Más asistencias de club en una carrera": "Assist klub terbanyak dalam satu karier",
		"Más goles en un partido": "Gol terbanyak dalam satu laga",
		"Más títulos de equipo en una carrera": "Gelar tim terbanyak dalam satu karier",
		"Más Balones de Oro en una carrera": "Gelar Pemain Terbaik terbanyak dalam satu karier",
		"Jornadas simuladas o vistas": "Pekan yang disimulasi atau ditonton",
		"Temporadas terminadas": "Musim selesai",
		"Carreras llevadas hasta el retiro": "Karier dijalani sampai pensiun",
		"Aperturas de HABILIDAD": "Pembukaan SKILL",
		"Aperturas de CONTRATO": "Pembukaan KONTRAK",
		"Aperturas de RELACIONES": "Pembukaan RELASI",
		"Aperturas de ASPECTO": "Pembukaan LOOK",
		"Aperturas de TIENDA": "Pembukaan TOKO",
		"Aperturas de CASA": "Pembukaan RUMAH",
		"Aperturas de TORNEOS": "Pembukaan TURNAMEN",
		"Aperturas de MERCADO": "Pembukaan BURSA",
		"Aperturas de CARRERA": "Pembukaan KARIER",
		"Aperturas de CALENDARIO": "Pembukaan JADWAL",
		"Aperturas de PLANTILLA": "Pembukaan SKUAD",
		"Aperturas de RANKING": "Pembukaan RANKING",
		"Aperturas de MAPA": "Pembukaan PETA",
		"Aperturas de TROFEOS": "Pembukaan TROFI",
		"Aperturas de CLUBES": "Pembukaan KLUB",
		"Aperturas de LEYENDAS": "Pembukaan LEGENDA",
		"Aperturas de BALON": "Pembukaan PEMAIN TERBAIK",
		"Sesiones de PRÁCTICA": "Sesi LATIHAN",
		"Sesiones de ENTRENO en el club": "Sesi LATIHAN klub",
		"Aperturas del EDITOR de planteles": "Pembukaan EDITOR skuad",
		"Decisiones contestadas": "Keputusan terjawab",
		"Semana más lejana alcanzada": "Pekan terjauh yang dicapai",
		"Temporada más lejana alcanzada": "Musim terjauh yang dicapai",
		"Nivel más alto alcanzado": "Level tertinggi yang dicapai",
		"+{0} PTS DE HABILIDAD": "+{0} PTS SKILL",
		"+{0} XP": "+{0} XP",
		"AL BANQUILLO": "KE CADANGAN",
		"PIERDES LA TITULARIDAD": "TAK LAGI INTI",


		"CAMBIO": "GANTI",
		"TE CAMBIAN":
			"KAMU DIGANTI",
		"TU NOTA CUANDO TE CAMBIARON":
			"RATINGMU SAAT DIGANTI",
		"Te cambian, y no por descansar. Al túnel, y nadie aplaude.":
			"Kamu diganti, bukan untuk istirahat. Ke terowongan, dan tak ada yang bertepuk tangan.",
		"Te cambian, y no por descansar. Fuera del campo, y nadie aplaude.":
			"Kamu diganti, bukan untuk istirahat. Keluar lapangan, dan tak ada yang bertepuk tangan.",
		"TE SACAN DEL CAMPO": "KAMU DITARIK",
		"OCASIONES SEGUIDAS FALLADAS": "PELUANG GAGAL BERTURUT",
		"MINUTO": "MENIT",
		"El míster no esperó a la cuarta. Fuera del campo, y nadie aplaude.":
			"Pelatih tak menunggu yang keempat. Keluar lapangan, dan tak ada yang bertepuk tangan.",
		"El míster no esperó a la cuarta. Al túnel, y nadie aplaude.":
			"Pelatih tak menunggu yang keempat. Ke terowongan, dan tak ada yang bertepuk tangan.",
		"LA CONFIANZA DEL TÉCNICO": "KEPERCAYAAN PELATIH",
		"Hoy miras desde aquí. El sitio no se pierde: se deja de merecer.":
			"Hari ini kamu menonton dari sini. Tempat itu tak hilang: kamu yang berhenti pantas mendapatkannya.",
		"LA FINAL": "FINAL",
		"VAMOS": "AYO",
		"HIMNO": "HIMNE",
		"CAMISETA DE VITRINA": "JERSEY PAJANGAN",
		"LA FINAL DE EUROPA": "FINAL EROPA",
		"LA FINAL DE TU SELECCION": "FINAL TIMNASMU",
		"LA FINAL DEL MUNDIALITO": "FINAL DUNIA KLUB",
		"LA FINAL DE COPA": "FINAL PIALA",
		"ENFRENTE, {0}": "DI SEBERANG, {0}",
		"NOCHE EUROPEA": "MALAM EROPA",
		"DESDE EL BANQUILLO": "DARI CADANGAN",



		"TU SELECCION": "TIMNASMU",
		"RENOVACION": "PERPANJANG",
		"FICHAJE": "REKRUT",
		"SIGUES EN CASA": "KAMU BERTAHAN",
		"FIRMADO Y CERRADO": "RESMI DITEKEN",
		"por partido": "per laga",
		"Te quedas porque quieres. Eso, en este oficio, lo firman pocos.":
			"Kamu bertahan karena kamu mau. Di profesi ini, hanya segelintir yang menekennya.",



		"Pagaron por ti antes de verte jugar aquí. Ahora hay que darles la razón.":
			"Mereka membayar untukmu sebelum melihatmu main di sini. Sekarang buktikan mereka benar.",
		"Llegaste sin que nadie pagara un peso. Eso también hay que demostrarlo.":
			"Kamu datang tanpa ada yang membayar sepeser pun. Itu juga harus dibuktikan.",
		"HOY, EN TU CASA": "DI KANDANGMU",
		"HOY, EN LA SUYA": "DI KANDANG LAWAN",
		"tu puesto": "tempatmu",
		"el suyo": "tempatnya",
		"tus goles": "golmu",
		"Esa casa fue tuya. Hoy no te van a perdonar ni una.": "Kandang itu dulu milikmu. Hari ini mereka tak akan memberimu ampun.",
		"tu dorsal": "nomormu",
		"No hay plan de partido que arregle un derbi. Se gana o se aguanta.":
			"Tak ada strategi yang bisa menyelesaikan derby. Menang, atau bertahan.",




		"Sois vecinos en la tabla y en la ciudad. Esto no se olvida ni ganándolo.":
			"Kalian bertetangga di klasemen dan di kota. Ini tak terlupakan, bahkan kalau menang.",
		"Vienen a tu casa a quitarte el sitio. Perder hoy vale por tres derrotas.":
			"Mereka datang ke kandangmu untuk merebut tempatmu. Kalah hari ini setara tiga kekalahan.",
		"Vas a su casa de líder. No hay tarde que les guste más.":
			"Kamu datang ke kandang mereka sebagai pemuncak. Tak ada sore yang lebih mereka nikmati.",
		"Van por delante todo el año. Hoy la tabla no cuenta.":
			"Mereka unggul sepanjang tahun. Hari ini klasemen tak berarti.",


		"PASAS DE RONDA": "KAMU LOLOS",
		"ELIMINADO": "TERSINGKIR",
		"el cruce": "duel",
		"rondas ganadas": "ronde menang",
		"Una noche más y hay copa. En esta sala ya no habla nadie de suerte.":
			"Satu malam lagi dan ada piala. Di ruangan ini tak ada lagi yang bicara soal keberuntungan.",
		"Semifinales. Quedan dos partidos para levantarla.":
			"Semifinal. Tinggal dua laga lagi untuk mengangkatnya.",
		"{0} fuera. El cuadro sigue abierto y vosotros dentro.":
			"{0} tersingkir. Bagan masih terbuka dan kalian masih di dalamnya.",
		"Fuera a la primera. El vestuario se vacía sin que nadie diga nada.":
			"Tersingkir di awal. Ruang ganti kosong tanpa ada yang bicara.",
		"A un partido de la final. Esta sala va a tardar en olvidarlo.":
			"Satu laga lagi menuju final. Ruangan ini tak akan cepat melupakannya.",
		"{0} os deja fuera. Se acabó la copa y quedan cuarenta domingos.":
			"{0} menyingkirkan kalian. Piala usai dan masih ada empat puluh Minggu lagi.",
		"{0} os deja fuera. El siguiente es dentro de cuatro años.":
			"{0} menyingkirkan kalian. Berikutnya empat tahun lagi.",


		"Llevas {0} sin ganarles. En esta sala nadie lo ha olvidado.":
			"Sudah {0} derby kamu tak menang atas mereka. Tak ada di ruangan ini yang lupa.",
		"Nunca les has ganado. Algún día tiene que ser el primero.":
			"Kamu belum pernah mengalahkan mereka. Suatu hari harus ada yang pertama.",
		"No les ganas desde hace {0} años. La gente lleva la cuenta.":
			"Sudah {0} tahun kamu tak menang atas mereka. Orang-orang menghitungnya.",
		"Llevas {0} seguidos contra ellos. Hoy vienen a por eso.":
			"{0} derby beruntun kamu menang atas mereka. Hari ini mereka datang untuk menghentikannya.",


		"{0} os ha marcado {1} en estos derbis. Hoy no lo pierdas de vista.":
			"{0} sudah mencetak {1} gol ke gawangmu di derby ini. Hari ini jangan lepaskan dia dari pandanganmu.",

		"AHORA MANDAS TÚ": "KAMU YANG MEMIMPIN",
		"LAS ÓRDENES": "PERINTAH",
		"EL CAMINO": "JALUR",
		"Mientras apuntas, toca a un compañero: cada toque cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.":
			"Saat membidik, ketuk rekan setim: tiap ketukan mengganti perintahnya. Biru muda lari ke gawang, oranye tetap di posisi, magenta menarik penjaganya menjauh.",
		"El suelo enseña a dónde irá y se borra conforme lo corre. Máximo tres órdenes, sólo duran esa jugada, y arrancan cuando tiras o regateas.":
			"Lapangan menunjukkan ke mana dia akan lari dan memudar saat dia melewatinya. Maksimal tiga perintah, hanya berlaku satu aksi, dan mulai saat kamu menembak atau mendribel.",

		"TU TAQUILLA": "LOKERMU",
		"FIN DE ETAPA": "AKHIR ERA",

		"SE VA AL RIVAL": "PINDAH KE RIVAL",
		"FICHA POR EL RIVAL": "TEKEN DI RIVAL",
		"venía de": "datang dari",
		"Se fue gratis. A ellos.": "Dia pergi gratis. Ke mereka.",
		"Lo pagaron, y lo pagaron caro. Sigue doliendo.": "Mereka membayar, dan mahal. Masih terasa sakit.",

		"CIERRA EL MERCADO": "BURSA TUTUP",
		"PIDEN": "MINTA",
		"SOLO PREGUNTA": "CUMA TANYA",
		"LES FALTAN {0}": "KURANG {0}",

		"SE QUEDA": "BERTAHAN",
		"Se queda. El traspaso se cae.": "Dia bertahan. Transfernya batal.",
		"Ya lo tenía decidido. Al menos sabe que se lo pediste.": "Dia sudah memutuskan. Setidaknya dia tahu kamu memintanya.",
		"Le has quitado la última duda: se va.": "Kamu menghilangkan keraguan terakhirnya: dia pergi.",
		"Le dio la vuelta: se queda igual.": "Dia memutarbalikkan keadaan: tetap bertahan.",
		"Sin que nadie le dijera nada, se queda.": "Tanpa ada yang mengatakan apa pun, dia bertahan.",
		"Se va, y tú no tuviste nada que ver.": "Dia pergi, dan kamu tak ada hubungannya.",
		"SE LO QUIEREN LLEVAR": "DIINCAR KLUB",
		"SUENA PARA OTRO": "RUMOR PINDAH",
		"PEDIRLE QUE SE QUEDE": "MINTA DIA BERTAHAN",
		"DECIRLE QUE ES SU OPORTUNIDAD": "BILANG INI KESEMPATANNYA",
		"TU VESTUARIO": "SKUADMU",
		"SE LLEVAN A {0}": "{0} PERGI",
		"lo quiere": "peminat",
		"le quedan": "sisa",
		"Un compañero tuyo tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "Rekan setimmu punya tawaran di atas meja dan belum bilang ya. Kalian berdua saja di ruang ganti dan dia akan bertanya apa yang akan kamu lakukan.",
		"{0} tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "{0} punya tawaran di atas meja dan belum bilang ya. Kalian berdua saja di ruang ganti dan dia akan bertanya apa yang akan kamu lakukan.",
		"TU CLUB TE RETIENE": "KLUBMU MENAHANMU",
		"No te dejan salir: pide el traspaso primero.": "Mereka tak melepasmu: minta transfer dulu.",
		"No renuevas: te ponen en el escaparate.": "Tak perpanjang kontrak: kamu dipajang di etalase.",
		"Tu club te vende. Falta tu respuesta.": "Klubmu menjualmu. Tinggal jawabanmu.",
		"Quieren cederte. Falta tu respuesta.": "Mereka ingin meminjamkanmu. Tinggal jawabanmu.",
		"Aceptaste salir: te ofrecen a quien pregunte.": "Kamu setuju pergi: kamu ditawarkan ke siapa pun yang bertanya.",
		"Pediste salir: ya no te retienen.": "Kamu minta pergi: mereka tak lagi menahanmu.",
		"Pediste cesión: llegan destinos cada ventana.": "Kamu minta dipinjamkan: tawaran datang tiap bursa.",
		"ULTIMA JORNADA": "PEKAN TERAKHIR",
		"Ultima jornada: mañana ya no hay mercado.": "Pekan terakhir: besok bursa sudah tutup.",
		"MERCADO ABIERTO": "BURSA BUKA",
		"QUEDAN {0}": "SISA {0}",
		"INTERESADO": "BERMINAT",
		"Quedan {0} jornadas de mercado.": "Sisa {0} pekan bursa.",
		"La ventana cierra esta noche.": "Bursa tutup malam ini.",
		"Se cerró la ventana.": "Bursa sudah tutup.",
		"TE VAS": "KAMU PERGI",
		"TE QUEDAS": "BERTAHAN",
		"ofertas": "tawaran",
		"la mejor": "terbaik",
		"pedían": "minta",
		"Acordado en el último minuto.": "Disepakati di menit terakhir.",
		"Nadie llegó a lo que pedía tu club.": "Tak ada yang mencapai harga yang diminta klubmu.",
		"Se cerró la ventana y no llamó nadie.": "Bursa tutup dan tak ada yang menelepon.",

		"SE VA LA ESTRELLA": "BINTANG PERGI",
		"destino": "tujuan",
		"traspaso": "biaya",
		"Con ese dinero llega {0}.": "Dengan uang itu datang {0}.",
		"Acabó contrato y nadie lo renovó.": "Kontraknya habis dan tak ada yang memperpanjang.",
		"El club todavía no ha fichado a nadie en su lugar.": "Klub belum merekrut pengganti.",
		"Ni un balón, ni una camiseta. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "Tak satu bola pun, tak satu jersey pun. Tak ada milikmu yang tertinggal di sini, dan kamu tak membawa apa-apa.",
		"Una sola cosa cabe en la maleta. Con una basta para acordarse.": "Hanya satu hal yang muat di koper. Satu saja cukup untuk mengenang.",
		"Lo que cabe en una maleta después de todos estos años.": "Yang muat di satu koper setelah bertahun-tahun ini.",
		"EL DORSAL QUE DEJASTE": "NOMOR LAMAMU",
		"SIGUE AHI": "MASIH DI SANA",
		"EL {0}": "NO. {0}",
		"lo llevaste": "kamu pakai",
		"hoy llevas": "kini kamu pakai",
		"Lo llevaste una temporada. A alguien le bastó.": "Kamu memakainya satu musim. Itu cukup untuk seseorang.",
		"Tú cambiaste de número. Él no.": "Kamu ganti nomor. Dia tidak.",
		"EL PORTERO DE ENFRENTE": "KIPER LAWAN",
		"YA TE CONOCE": "KENAL KAMU",
		"LE HAS METIDO {0}": "{0} GOL KE DIA",
		"TU VILLANO": "MUSUHMU",
		"TE HA MARCADO {0} EN ESTE DERBI": "{0} GOL KE KAMU DI DERBY",
		"TE CONOCE DE ANTES": "SUDAH KENAL KAMU",
		"CARA A CARA": "TATAP MUKA",
		"TE PELEA EL GOLEO": "RIVALMU DI DAFTAR GOL",
		"TE PELEA LAS ASISTENCIAS": "RIVALMU DI DAFTAR ASSIST",
		"PRONÓSTICO": "PREDIKSI",
		"FAVORITO": "FAVORIT",
		"{0} TEMPORADAS JUNTOS EN {1}": "{0} MUSIM BERSAMA DI {1}",
		"reencuentros": "reuni",
		"Todavía no sabe por dónde le vas a entrar.": "Dia masih belum tahu dari sisi mana kamu akan menyerang.",
		"Nadie le ha hecho más daño que tú.": "Tak ada yang lebih menyakitinya daripada kamu.",
		"LA PIZARRA DEL RIVAL": "TAKTIK LAWAN",
		"ESE ERES TU": "ITU KAMU",
		"LA CHARLA DE HOY": "ARAHAN HARI INI",
		"TE ESPERABAN": "DITUNGGU",
		"EL VERDUGO": "SANG MOMOK",
		"{0} GOLES DESPUES": "{0} GOL KEMUDIAN",
		"No se junta esta gente por un jugador cualquiera.": "Orang sebanyak ini tidak berkumpul demi pemain biasa.",
		"De todo lo que hay en esa pizarra, la única foto es la tuya.": "Dari semua yang ada di papan itu, satu-satunya foto adalah fotomu.",
		"TE CANTAN": "NAMAMU DINYANYI",
		"OVACION": "OVASI",
		"TE OVACIONAN": "OVASI UNTUKMU",
		"Aplauden los que venían a verte perder. Eso no lo dan dos veces.":
			"Tepuk tangan dari mereka yang datang untuk melihatmu kalah. Itu tak datang dua kali.",
		"domingos": "Minggu",
		"tu nota": "ratingmu",
		"afición": "suporter",
		"No marcaste. Da igual: se aprendieron tu nombre igual.": "Kamu tak mencetak gol. Tak masalah: mereka tetap hafal namamu.",
		"EMPIEZAS EN EL BANQUILLO": "KAMU MULAI DI CADANGAN",
		"La primera vez que el once empieza sin ti. Desde aquí también se mira el partido.": "Pertama kalinya sebelas pemain inti mulai tanpamu. Dari sini kamu juga bisa menonton laga.",
		"división": "divisi",
		"aforo": "kapasitas",
		"Hasta aquí se sube. Ahora hay que quedarse.": "Sampai di sini batas naiknya. Sekarang kamu harus bertahan.",
		"Un escalón más. Desde aquí se ve el de arriba.": "Naik satu anak tangga. Dari sini kelihatan yang di atas.",
		"Todo el mundo empieza en un campo como éste.": "Semua orang mulai di lapangan seperti ini.",
		"SE RETIRA": "PENSIUN",
		"La cantera del {1} no para: {0}, {2} años, ya es titular": "Akademi {1} terus melahirkan: {0}, {2} tahun, sudah jadi pemain inti",
		"{0}, {2} años, se gana un puesto en el once del {1}": "{0}, {2} tahun, merebut tempat di susunan inti {1}",
		"{0}, {2} años, vuelve de su cesión en el {3} y se gana el once del {1}": "{0}, {2} tahun, kembali dari pinjamannya di {3} dan merebut tempat di susunan inti {1}",
		"EL ADIOS": "PERPISAHAN",
		"TEMPORADAS EN ESTA CASA": "MUSIM DI KLUB INI",
		"Ni una copa que sacar al césped, y el estadio en pie igual.":
			"Tak ada piala untuk dibawa ke rumput, tapi stadion tetap berdiri menyambutmu.",
		"Aquí empezó todo. Y aquí se acaba, con todo lo que ganaste puesto.":
			"Di sini semuanya dimulai. Dan di sini berakhir, dengan semua yang kamu menangkan dipajang.",
		"Los que te vieron crecer se quedaron de pie hasta el final.":
			"Mereka yang melihatmu tumbuh tetap berdiri sampai akhir.",
		"EL BRAZALETE": "BAN KAPTEN",
		"tu media": "ratingmu",
		"temporada": "musim",
		"El vestuario votó y salió tu nombre. Ahora te toca sostenerlo.":
			"Ruang ganti memilih dan namamu keluar. Sekarang tugasmu memikulnya.",
		"Nadie regala esta cinta: la ganaste domingo a domingo. Ahora no la sueltes.":
			"Tak ada yang memberi ban ini cuma-cuma: kamu mendapatkannya Minggu demi Minggu. Sekarang jangan lepaskan.",
		"VISITANTE": "TAMU",
		"VUELTA": "REUNI",
		"NO TE HAN PERDONADO": "TAK DIMAAFKAN",
		"Te fuiste al rival. Cada vez que vuelvas a este campo la grada empezará en tu contra, y eso ya no se quita.":
			"Kamu pindah ke rival. Setiap kali kembali ke lapangan ini, tribun akan mulai menentangmu, dan itu tak akan hilang.",
		"BALÓN DE ORO": "PEMAIN TERBAIK",
		"Ningún equipo levanta esto por ti. Este se gana solo.":
			"Tak ada tim yang mengangkat ini untukmu. Ini dimenangkan sendirian.",
		"Tú quedaste {0}.": "Kamu finis {0}.",
		"Tú quedaste {0}, detrás de {1}.": "Kamu finis {0}, di belakang {1}.",
		"{0} GALA JUNTOS: ÉL {1}, TÚ {2}": "GALA {0} BERSAMA: DIA {1}, KAMU {2}",
		"{0} GALA JUNTOS: {1} {2}, {3} {4}": "GALA {0} BERSAMA: {1} {2}, {3} {4}",
		"Este año no entraste en la votación.": "Tahun ini kamu tak masuk pemungutan suara.",
		"EL MEJOR DEL MUNDO · {0}": "TERBAIK DUNIA · {0}",
		"TU PRIMER JUGADOR DEL AÑO": "PEMAIN TERBAIK PERTAMAMU",
		"TU JUGADOR DEL AÑO Nº {0}": "PEMAIN TERBAIKMU KE-{0}",
		"TEMPORADAS EN EL OFICIO · CIFRAS EN PRIMERA": "MUSIM BERKARIER · ANGKA KASTA 1",
		"LO DEJA CUANDO QUIERE": "PENSIUN ATAS MAUNYA",
		"{0} años. El cuerpo mandó y no hubo discusión.":
			"{0} tahun. Tubuh yang memutuskan dan tak ada perdebatan.",
		"Nadie te empujó a esto: te vas de pie, que es como se van los pocos.":
			"Tak ada yang mendorongmu: kamu pergi sambil berdiri, seperti yang hanya dilakukan segelintir orang.",
		"FIGURA DEL PARTIDO": "BINTANG LAGA",
		"RENOVACIÓN": "PERPANJANG",
		"SE DESPIDE": "PERPISAHAN",
		"SE DESPIDE UNA LEYENDA": "SANG LEGENDA PAMIT",
		"SE VA UNA LEYENDA": "LEGENDA PERGI",
		"VUELVE UNA LEYENDA": "LEGENDA KEMBALI",
		"Te vas siendo leyenda de esta casa. Tu nombre se queda aquí.": "Kamu pergi sebagai legenda klub ini. Namamu tetap di sini.",
		"Fuiste leyenda aquí. Vienes de rival y aun así se ponen de pie.": "Kamu dulu legenda di sini. Kamu kembali sebagai rival dan mereka tetap berdiri.",

		"HOMENAJE": "TRIBUT",
		"Toda una etapa en el mismo club. El club te lo devuelve delante de los tuyos.":
			"Satu era penuh di klub yang sama. Klub membalasnya di depan orang-orangmu.",
		"HOMENAJE en {0}: {1} temporadas de lealtad. Prima de ${2} y la grada rendida.":
			"TRIBUT di {0}: {1} musim setia. Bonus ${2} dan tribun takluk padamu.",
		"LA CAMISETA DEL CLUB ES LA TUYA: {0} unidades": "JERSEY KLUB INI MILIKMU: {0} unit",
		"Camisetas: {0} unidades, el nº{1} del vestuario": "Jersey: {0} unit, peringkat ke-{1} di ruang ganti",
		"Dos minutos de micrófono y a la ducha. Mañana no se acuerda nadie.":
			"Dua menit di depan mikrofon, lalu mandi. Besok tak ada yang ingat.",
		"Firmado. El club apuesta por ti y ahora hay que devolverlo en el campo.":
			"Sudah diteken. Klub mempertaruhkan harapan padamu dan sekarang harus dibalas di lapangan.",
		"Se acabó aquí. Lo que hiciste con esta camiseta ya no te lo quita nadie.":
			"Selesai di sini. Apa yang kamu lakukan dengan jersey ini tak bisa diambil siapa pun.",
		"Te llamaron. Ahora hay que ir y quedarse.": "Kamu dipanggil. Sekarang berangkat dan bertahan.",
		"ÚLTIMO DÍA EN EL CLUB": "HARI TERAKHIR DI KLUB",
		"TITULAR CON TU SELECCIÓN": "INTI DI TIMNASMU",
		"EN LA LISTA DE TU SELECCIÓN": "DI DAFTAR TIMNASMU",

		"VAS AL MUNDIAL": "KAMU KE KEJUARAAN DUNIA",
		"PIDE TU DORSAL": "MINTA NOMORMU",
		"ME QUEDO EL {0}": "AKU TETAP {0}",
		"SIGUES CON EL {0}": "TETAP PAKAI {0}",
		"CAMBIA TU DORSAL": "GANTI NOMORMU",
		"EL {0} ES TUYO HASTA EL PROXIMO TORNEO": "NO. {0} MILIKMU SAMPAI TURNAMEN LAGI",
		"PEDISTE EL {0}": "MINTA NO. {0}",
		"Un continente entero, y tú dentro.": "Satu benua penuh, dan kamu ada di dalamnya.",
		"AÑOS AL IR AL MUNDIAL": "TAHUN SAAT KE KEJUARAAN DUNIA",
		"CONVOCATORIA OFICIAL": "PANGGILAN RESMI",
		"QUEDAS CONVOCADO": "KAMU DIPANGGIL",
		"Una carrera cabe en tres o cuatro. Éste es uno.": "Satu karier hanya muat tiga atau empat. Ini salah satunya.",
		"RENUEVA UNA TEMPORADA MÁS": "PERPANJANG SATU MUSIM",
		"RENUEVA HASTA {0} TEMPORADAS MÁS": "PERPANJANG {0} MUSIM LAGI",



		"SE VA EN VERANO": "PERGI USAI MUSIM",
		"FIRMA CON {0} PARA EL VERANO": "GABUNG {0} USAI MUSIM",
		"Ya está firmado y todavía quedan cinco meses de temporada. Lo que digas hoy es lo que te van a gritar hasta junio.":
			"Sudah diteken dan masih ada lima bulan musim tersisa. Apa yang kamu ucapkan hari ini akan diteriakkan padamu sampai Juni.",
		"¿POR QUÉ TE VAS?": "KENAPA KAMU PERGI?",
		"Treinta micrófonos y una sola pregunta. Lo que contestes decide quién carga con esto: el míster, la grada o la prensa.":
			"Tiga puluh mikrofon dan satu pertanyaan. Jawabanmu menentukan siapa yang menanggungnya: pelatih, tribun, atau pers.",
		"SE LO DIJE AL MÍSTER A LA CARA": "KUBILANG LANGSUNG KE PELATIH",
		"LE DEBO A ESTA GENTE HASTA JUNIO": "UTANGKU PADA MEREKA SAMPAI JUNI",
		"ES FÚTBOL, NADA PERSONAL": "INI BOLA, BUKAN PRIBADI",
		"YA NO HAY NADA QUE REPARTIR": "TAK ADA LAGI YANG DIBAGI",
		"EN VERANO": "USAI MUSIM",
		"TU NUEVO SUELDO POR TEMPORADA": "GAJI BARUMU PER MUSIM",
		"GOLES CON ESTA CAMISETA · {0} PARTIDOS": "GOL DI JERSEY INI · {0} LAGA",
		"AÑOS AL ENTRAR EN LA LISTA": "USIA SAAT MASUK DAFTAR",
		"TU NOTA DEL PARTIDO (×10)": "RATING LAGAMU (×10)",
		"JUGADOR DEL PARTIDO": "PEMAIN TERBAIK LAGA",
		"{0} GOLES · JUGADOR DEL PARTIDO": "{0} GOL · PEMAIN TERBAIK LAGA",
		"HASTA EL AÑO QUE VIENE": "SAMPAI TAHUN DEPAN",
		"PASAR PÁGINA": "LANJUT",
		"GOLES EN {0} PARTIDOS · {1} ASISTENCIAS": "GOL DI {0} LAGA · {1} ASSIST",
		"Se quedaron a aplaudir igual. Eso también se gana.":
			"Mereka tetap tinggal untuk bertepuk tangan. Itu juga tak didapat cuma-cuma.",
		"Media grada de vuelta a casa. El año que viene se empieza de cero.":
			"Setengah tribun sudah pulang. Tahun depan mulai dari nol.",
		"Las gradas se vaciaron antes del pitido. Hay años así.":
			"Tribun kosong sebelum peluit akhir. Ada tahun yang seperti itu.",
		"{0} DE {1} · SIN TÍTULOS": "{0}/{1} · TANPA GELAR",
		"YA FIRMASTE CON OTRO": "TEKEN DI KLUB LAIN",
		"TE VAS Y ELLOS LO SABEN": "PERGI, DAN MEREKA TAHU",
		"SE TE ACABA EL CONTRATO": "KONTRAKMU HABIS",
		"SE ACABA TU CESIÓN": "PINJAMANMU HABIS",

		"Te vas dejando una vitrina. Esta grada va a tardar en cantarle a otro.":
			"Kamu pergi meninggalkan lemari trofi. Butuh waktu lama sebelum tribun ini bernyanyi untuk orang lain.",
		"No siempre se gana, pero aquí ganaste. Eso ya no te lo quita nadie.":
			"Tak selalu menang, tapi di sini kamu menang. Itu tak bisa diambil siapa pun lagi.",
		"Ni un título, y aun así están todos de pie. Algo hiciste bien.":
			"Tanpa satu gelar pun, mereka semua tetap berdiri. Kamu melakukan sesuatu dengan benar.",
		"JUGADOR DEL MES": "MVP BULAN INI",
		"MEJOR DEL MES EN TU LIGA": "TERBAIK LIGAMU BULAN INI",
		"TU MEDIA DEL MES (×10)": "RATINGMU BLN INI (×10)",
		"EL MEJOR DEL MES DE TU LIGA": "TERBAIK LIGAMU BULAN INI",
		"SU MEDIA DEL MES (×10)": "RATING BLN INI (×10)",
		"GOLES EN EL PARTIDO": "GOL DI LAGA INI",
		"goles año": "gol (thn)",
		"asist. año": "assist (thn)",
		"SU MEDIA DE LA TEMPORADA (×10)": "RATING MUSIMNYA (×10)",
		"El mejor del año de tu competición, y este año no fue para ti.": "Yang terbaik tahun ini di kompetisimu, dan tahun ini bukan untukmu.",
		"Este mes fue suyo. El siguiente empieza de cero para los dos.": "Bulan ini miliknya. Bulan berikutnya mulai dari nol untuk kalian berdua.",
		"Hoy el micro es suyo. La semana que viene se vuelve a repartir.": "Hari ini mikrofon miliknya. Pekan depan dibagi lagi.",
		"el listón": "standarnya",
		"{0} partidos por encima de todos. El mes siguiente empieza de cero.":
			"{0} laga di atas semua yang lain. Bulan depan mulai dari nol.",
		"MEJOR DEL AÑO": "MVP TAHUN INI",
		"TU MEDIA DE LA TEMPORADA (×10)": "RATING MUSIMMU (×10)",
		"goles": "gol",
		"asist.": "assist",
		"partidos": "laga",
		"El mejor del año en tu competición.": "Yang terbaik tahun ini di kompetisimu.",
		"ADIÓS INTERNACIONAL": "PAMIT DARI TIMNAS",
		"SE RETIRA DE LA SELECCIÓN": "PENSIUN DARI TIMNAS",
		"APARICIONES CON TU PAÍS": "PENAMPILAN TIMNAS",
		"títulos": "gelar",
		"La camiseta del país no se cuelga: se entrega. Que la sude otro.":
			"Jersey negara tak digantung: diserahkan. Biar orang lain yang berkeringat memakainya.",
		"NO SE PUDO GUARDAR": "GAGAL MENYIMPAN",
		"CELEBRACIÓN DE TÍTULOS": "PESTA GELAR",
		"LA CIUDAD ES VUESTRA": "KOTA MILIK KALIAN",
		"TÍTULOS SOBRE EL AUTOBÚS": "GELAR DI ATAS BUS",
		"Hay años que se cuentan por títulos. Éste no cabe en una vitrina.":
			"Ada musim yang dihitung dengan gelar. Yang ini tak muat di lemari trofi.",
		"Dos en la misma temporada. La ciudad no se lo va a callar.":
			"Dua dalam satu musim. Kota ini tak akan diam.",
		"Un año entero cabe en esta calle, y toda esta gente vino a verlo.":
			"Satu musim penuh muat di jalan ini, dan semua orang ini datang untuk melihatnya.",

		"RECIBIMIENTO EN EL AYUNTAMIENTO": "SAMBUTAN DI BALAI KOTA",
		"LA PLAZA ES VUESTRA": "ALUN-ALUN KALIAN",

		"RECIBIMIENTO EN EL PALACIO": "SAMBUTAN DI ISTANA",
		"EL PAÍS ES VUESTRO": "NEGARA MILIK KALIAN",
		"Un país entero bajo un balcón, y una sola copa que enseñarle.":
			"Satu negara penuh di bawah satu balkon, dan hanya satu piala untuk dipamerkan.",
		"TÍTULOS EN EL BALCÓN": "GELAR DI BALKON",
		"Tres títulos y un balcón. El año que nadie esperaba de vosotros.":
			"Tiga gelar dan satu balkon. Musim yang tak diduga siapa pun dari kalian.",
		"Dos en la misma temporada. Abajo no cabe nadie más.":
			"Dua dalam satu musim. Di bawah tak ada tempat lagi.",
		"No hizo falta cortar la avenida: vino la ciudad entera aquí.":
			"Tak perlu menutup jalan raya: seluruh kota datang ke sini.",
		"LA PEÑA DEL CLUB": "KLUB SUPORTER",
		"AQUÍ CABE TODO EL CLUB": "SELURUH KLUB MUAT DI SINI",
		"TÍTULOS SOBRE LA BARRA": "GELAR DI ATAS BAR",
		"Tres copas en una barra de seis metros. Ya no caben más.":
			"Tiga piala di bar sepanjang enam meter. Tak muat lagi.",
		"Dos en la misma temporada, y el local se quedó pequeño.":
			"Dua dalam satu musim, dan tempat ini jadi sempit.",
		"No vino la ciudad entera. Vinieron los que siempre vienen.":
			"Bukan seluruh kota yang datang. Yang datang yang selalu datang.",
		"SUBIMOS": "PROMOSI",
		"SALTARON AL CÉSPED · Y NO CABÍA NADIE MÁS": "MENYERBU RUMPUT · TAK ADA TEMPAT LAGI",
		"Subir cambia el club entero: otro presupuesto, otros rivales, otra vida.":
			"Promosi mengubah seluruh klub: anggaran baru, lawan baru, hidup baru.",
		"PUESTO FINAL · DE {0} EQUIPOS": "PERINGKAT AKHIR · {0} TIM",
		"El club entero baja contigo: menos presupuesto, otros rivales, y una temporada para volver.":
			"Seluruh klub ikut turun bersamamu: anggaran lebih kecil, lawan berbeda, dan satu musim untuk kembali.",
		"CAMPEON": "JUARA",
		"PASILLO DE HONOR": "BARISAN HORMAT",
		"EN CASA DE {0}": "KANDANG {0}",
		"de ventaja": "unggul",

		"Con jornadas de sobra y ya no hay nada que discutir. Por eso te aplauden ellos.":
			"Masih ada sisa pekan dan tak ada lagi yang perlu diperdebatkan. Karena itu mereka pun bertepuk tangan.",
		"Te lo reconocen los que lo perdieron. No hay elogio mejor.":
			"Itu diakui oleh mereka yang kehilangannya. Tak ada pujian yang lebih baik.",
		"LA LISTA": "DAFTAR",
		"ONCE INICIAL": "TIM INTI",
		"TITULARES": "INTI",
		"SUPLENTES": "CADANGAN",
		"ESTÁS EN EL ONCE": "KAMU MASUK INTI",
		"TE QUEDAS FUERA DEL ONCE": "KAMU TAK MASUK INTI",
		"NO ESTÁS EN LA LISTA": "TAK ADA DI DAFTAR",
		"A ENTRENAR": "LATIHAN",
		"El míster te pone de salida. El sitio hay que sostenerlo.":
			"Pelatih menurunkanmu sejak awal. Tempat itu harus kamu pertahankan.",
		"Empiezas en el banco. Se recupera jugando, no discutiendo.":
			"Kamu mulai dari bangku cadangan. Rebut lagi tempatmu dengan bermain, bukan berdebat.",
		"Esta semana ni te vistes. El lunes se vuelve a empezar.":
			"Pekan ini kamu bahkan tak ganti baju. Senin mulai lagi.",
		"EL ESTADIO LLEVA TU NOMBRE": "STADION MEMAKAI NAMAMU",
		"ASÍ SE LLAMA DESDE HOY": "NAMANYA MULAI HARI INI",
		"TÍTULOS CON ESTE CLUB": "GELAR DI KLUB INI",
		"Los que vengan detrás van a jugar en un sitio que se llama como tú. Eso ya no te lo quita nadie.":
			"Mereka yang datang setelahmu akan bermain di tempat yang memakai namamu. Itu tak akan diambil siapa pun.",
		"CAMPEONES": "JUARA",
		"TUS GOLES EN ESTE TORNEO · {0} PARTIDOS": "GOLMU DI TURNAMEN INI · {0} LAGA",
		"CAMPEÓN DE {0}": "JUARA {0}",
		"CAMPEÓN · {0}": "JUARA · {0}",
		"BIENVENIDO": "WELCOME",
		"DE VUELTA": "PULANG",
		"Aquí ya sabes dónde está todo. Falta que te vuelvan a ver.": "Kamu tahu setiap sudut di sini. Tinggal membuat mereka melihatmu lagi.",
		"LLEGAS CEDIDO": "DIPINJAMKAN",
		"FICHAJE LIBRE": "PEMAIN BEBAS",
		"NUEVO FICHAJE": "REKRUTAN BARU",
		"EN LAS GRADAS · AFORO {0}": "DI TRIBUN · KAPASITAS {0}",
		"En equipo": "Tim",
		"Individuales": "Individu",
		"TRASPASO ${0}": "TRANSFER ${0}",
		"AL VESTUARIO": "RUANG GANTI",
		"ESTA SEMANA": "PEKAN INI",
		"PRETEMPORADA": "PRAMUSIM",
		"TU FICHAJE": "REKRUTANMU",
		"TU RENOVACIÓN": "KONTRAK BARU",
		"FINAL DE TEMPORADA": "AKHIR MUSIM",
		"CAMPEÓN": "JUARA",
		"LA GALA": "GALA",
		"Campeón del mundo. No hay nada por encima de esto.":
			"Juara dunia. Tak ada yang lebih tinggi dari ini.",
		"La noche que Europa se quedó mirándote a ti.": "Malam ketika seluruh Eropa menatapmu.",
		"El mejor club del mundo, y tú dentro.": "Klub terbaik di dunia, dan kamu ada di dalamnya.",
		"Tu continente lleva tu nombre este verano.": "Benuamu memakai namamu musim panas ini.",
		"Europa por la puerta de atrás. Se entra igual.":
			"Eropa lewat pintu belakang. Tetap masuk juga.",
		"La tercera copa de Europa también pesa al levantarla.":
			"Trofi Eropa ketiga pun tetap berat saat diangkat.",
		"Nueve meses para esta tarde. Campeones.": "Sembilan bulan demi sore ini. Juara.",
		"Una final, un título. Así de simple y así de difícil.":
			"Satu final, satu trofi. Sesederhana dan sesulit itu.",
		"MEJOR DE LA CHAMPIONS": "TERBAIK PIALA ELITE",
		"El mejor de Europa en la competición que todos miran.":
			"Terbaik Eropa di kompetisi yang ditonton semua orang.",
		"MEJOR DE LA EUROPA LEAGUE": "TERBAIK PIALA EUROPA",
		"El mejor de tu Europa. La otra también se gana jugando.":
			"Terbaik di Eropamu. Yang lain pun dimenangkan lewat bermain.",
		"MEJOR DE LA CONFERENCE": "TERBAIK CHALLENGE",
		"El mejor de la tercera Europa. Se juega con la misma pelota.":
			"Terbaik di Eropa ketiga. Dimainkan dengan bola yang sama.",
		"MEJOR JUGADOR DE LA LIGA": "PEMAIN TERBAIK LIGA",
		"Nueve meses de competición y el mejor fuiste tú.":
			"Sembilan bulan kompetisi dan yang terbaik adalah kamu.",
		"MEJOR DEL MUNDIALITO": "TERBAIK DUNIA KLUB",
		"Dos partidos contra los campeones del mundo. Mandaste tú.":
			"Dua laga melawan juara dunia. Kamu yang memimpin.",
		"MEJOR DE LA COPA": "TERBAIK PIALA",
		"El torneo donde un mal día te elimina. No lo tuviste.":
			"Di turnamen ini, satu hari buruk bisa menyingkirkanmu. Kamu tak mengalaminya.",
		"LLENO HISTÓRICO": "REKOR PENONTON",
		"ESTADIO LLENO": "STADION PENUH",
		"MEDIA ENTRADA": "SEPARUH PENUH",
		"PRESENTACIÓN DISCRETA": "PERKENALAN SEPI",
		"¿Última parada o retiro dorado? La grada vino a averiguarlo.":
			"Pemberhentian terakhir atau perpisahan emas? Suporter datang untuk mencari tahu.",
		"Nadie entiende qué haces aquí. Vinieron por morbo; convéncelos.":
			"Tak ada yang paham untuk apa kamu di sini. Mereka datang karena penasaran; yakinkan mereka.",
		"Vienen a ver si eres el refuerzo que les faltaba.":
			"Mereka datang untuk melihat apakah kamu kepingan yang selama ini kurang.",
		"Media grada se acercó a conocer al cedido.": "Setengah tribun datang untuk menyambut pemain pinjaman.",
		"Una cesión más. Aquí se demuestra jugando.": "Pinjaman lagi. Di sini kamu membuktikan diri lewat bermain.",
		"Sin pagar un peso y el estadio no cabe. Eso es un fichajazo.":
			"Tanpa bayar sepeser pun dan stadion penuh sesak. Itu rekrutan hebat.",
		"Se agotaron las entradas para ver un fichaje gratis.": "Tiket ludes hanya untuk melihat transfer gratis.",
		"Llegas libre y media grada quiso verte la cara.":
			"Kamu datang bebas dan setengah tribun ingin melihat wajahmu.",
		"Sin traspaso y sin ruido. El ruido lo haces tú.":
			"Tanpa biaya transfer dan tanpa gembar-gembor. Keributan itu kamu yang buat.",
		"El club paró la ciudad para presentarte. No se olvida un día así.":
			"Klub menghentikan kota demi memperkenalkanmu. Hari seperti ini tak terlupakan.",
		"Lleno para ver a su fichaje. Ahora hay que responder.":
			"Stadion penuh untuk rekrutan mereka. Sekarang kamu harus menjawabnya.",
		"Media entrada. Te conocen; falta que te quieran.":
			"Setengah penuh. Mereka kenal kamu; tinggal membuat mereka mencintaimu.",
		"El mejor jugador del mundo es suyo. No cabe un alma para verlo.":
			"Pemain terbaik dunia milik mereka. Tak ada satu kursi pun tersisa untuk melihatnya.",
		"Cuatro curiosos y una cámara. Aquí se empieza desde abajo.":
			"Beberapa penonton penasaran dan satu kamera. Di sini kamu mulai dari bawah.",
		"Yo también creí que nadie me alcanzaría. Sigue así.":
			"Aku juga dulu mengira tak ada yang bisa menyusulku. Teruskan.",
		"Los títulos pesan más cuando los cuentan otros. Ya son más los tuyos.":
			"Gelar terasa lebih berat kalau orang lain yang menghitung. Gelarmu kini lebih banyak dari milikku.",
		"Me costó una vida llegar ahí arriba. A ti te va a costar quedarte.":
			"Butuh seumur hidup bagiku untuk sampai ke atas sana. Bagimu, bertahan di sana yang berat.",
		"No te acostumbres a mirar hacia abajo. Sigue ganando.":
			"Jangan terbiasa memandang ke bawah. Terus menang.",
		"Bienvenido. Aquí arriba se está solo, pero se ve todo.":
			"Selamat datang. Di atas sini sepi, tapi semuanya terlihat.",
		"Cada gol mío lo llevo contado. Ahora los tuyos son más. Sigue.":
			"Setiap golku kuhitung. Sekarang golmu lebih banyak. Teruskan.",
		"Yo marqué hasta el último día. Tú vas más rápido que yo.":
			"Aku mencetak gol sampai hari terakhir. Kamu lebih cepat dariku.",
		"Los números se rompen para eso. Que alguien rompa los tuyos.":
			"Rekor ada untuk dipecahkan. Semoga ada yang memecahkan rekormu.",
		"No pares ahora: al que deja de marcar lo alcanzan en un año.":
			"Jangan berhenti sekarang: yang berhenti mencetak gol akan disusul dalam setahun.",
		"Me tocó verlo desde aquí. Sigue así y no te alcanza nadie.":
			"Aku harus menontonnya dari sini. Teruskan, dan tak ada yang bisa menyusulmu.",
		"MÁS TÍTULOS DE LA HISTORIA": "GELAR TERBANYAK SEJARAH",
		"MÁS TÍTULOS": "TOP GELAR",
		"trofeos": "trofi",



		"MEJOR JUGADOR DE LA HISTORIA": "PEMAIN TERBAIK SEJARAH",
		"YA NO QUEDA NADIE POR DELANTE": "TAK ADA LAGI DI DEPANMU",
		"DE LA HISTORIA": "DALAM SEJARAH",
		"Todavía no he colgado las botas. Nos vemos en el campo.":
			"Aku belum gantung sepatu. Sampai jumpa di lapangan.",
		"Disfrútalo, que esta temporada pienso quitártelo.":
			"Nikmatilah, karena musim ini aku berencana merebutnya kembali.",
		"Pasarme con los dos en activo tiene mérito. Ahora aguántalo.":
			"Menyalipku saat kita berdua masih aktif itu bukan hal kecil. Sekarang pertahankan.",
		"Sigo jugando, y ya sé a quién me toca perseguir.":
			"Aku masih main, dan sekarang aku tahu siapa yang harus kukejar.",
		"Si me tenía que pasar alguien, mejor uno de casa. Sigamos ganando juntos.":
			"Kalau harus ada yang melewatiku, lebih baik orang sendiri. Mari terus menang bersama.",
		"Hoy te lo celebro yo. Mañana, a entrenar como siempre.":
			"Hari ini aku ikut merayakannya denganmu. Besok, latihan seperti biasa.",
		"Que se entere el vestuario: aquí jugamos dos de los grandes.":
			"Biar ruang ganti tahu: di sini main dua pemain besar.",
		"Ya no hay nadie delante de ti. Yo sigo jugando, así que no te relajes.":
			"Tak ada lagi yang di depanmu. Aku masih main, jadi jangan santai.",
		"Ya no hay nadie delante de ti. Ahora el nombre a batir es el tuyo.":
			"Tak ada lagi yang di depanmu. Sekarang namamu yang harus dikalahkan.",

		"{0}G {1}A": "{0}G {1}A",
		"media": "rata-rata",
		"clubes": "klub",
		"A {0}": "KE {0}",
		"temporadas": "musim",
		"Ni un balón. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "Satu bola pun tidak. Tak ada milikmu yang tertinggal di sini, dan kamu tak membawa apa-apa.",
		"La maleta va vacía. Lo que dejaste aquí no cabe en ella: se queda en la grada.": "Kopermu kosong. Yang kamu tinggalkan di sini tak muat di dalamnya: tetap di tribun.",
		"dorsal": "nomor",
		"{0} {1} · JUGADOR DEL PARTIDO": "{0} {1} · PEMAIN TERBAIK LAGA",
		"tiros": "tembakan",
		"pases": "umpan",
		"RECORD": "REKOR",
		"¡A {0}!": "KE {0}!",
		"puntos": "poin",
		"jornadas": "sisa pekan",
		"ligas": "liga",
		"copas": "piala",
		"europas": "trofi Eropa",
		"ascensos": "promosi",
		"Este club no había ganado nada parecido en toda su historia. Lo trajiste tú, y aquí no se va a olvidar.":
			"Klub ini belum pernah memenangi hal seperti ini sepanjang sejarahnya. Kamu yang membawanya, dan di sini itu tak akan dilupakan.",
		"MENU PRINCIPAL": "MENU UTAMA",
		"UN JUEGO DE": "DIBUAT OLEH",
		"Clubes, ligas, competiciones, estadios y jugadores son ficticios. Football Legacy no está afiliado, patrocinado ni respaldado por ninguna liga, club, federación o competición real.": "Klub, liga, kompetisi, stadion, dan pemain bersifat fiktif. Football Legacy tidak berafiliasi dengan, disponsori, atau didukung oleh liga, klub, federasi, atau kompetisi nyata mana pun.",
		"CODIGO · DISENO · ARTE · SONIDO": "KODE · DESAIN · SENI · SUARA",
		"TU PRESENTACION": "PERKENALANMU",
		"SELECCION T{0}": "TIMNAS M{0}",
		"TU MEJOR GOL": "GOL TERBAIKMU",
		"GOLES DE CARRERA": "GOL KARIER",
		"Completa una temporada en {0} división o ficha por un club de {1} para desbloquear.":
			"Selesaikan satu musim di divisi {0} atau gabung klub divisi {1} untuk membuka.",






















		"COMO SALE": "CARA TAMPIL",
		"CELEBRACION NUEVA": "SELEBRASI BARU",
		"CELEBRACIONES": "SELEBRASI",
		"SITIOS": "TEMPAT",
		"GESTOS": "GESTUR",


		"Celebración por descubrir. Sigue marcando goles.":
			"Selebrasi yang belum ditemukan. Terus cetak gol.",


		"ESCENAS": "ADEGAN",
		"GLORIA": "GLORI",
		"DUELO": "DUKA",
		"MOMENTOS": "MOMEN",
		"REVIVIR": "REPLAY",
		"Toca para revivir cómo fue.": "Ketuk untuk melihat lagi kejadiannya.",
		"Puedes verla otra vez con el botón.": "Kamu bisa menontonnya lagi lewat tombol.",
		"Escena por vivir. Sigue jugando tu carrera.": "Adegan yang belum dijalani. Teruskan kariermu.",
		"EL ASCENSO": "PROMOSI",
		"LA VUELTA CON LA COPA": "KELILING BAWA PIALA",
		"LA GALA DEL JUGADOR DEL AÑO": "GALA PEMAIN TERBAIK",
		"LA GALA DEL CLUB": "GALA KLUB",
		"LA GALA DE LA LIGA": "GALA LIGA",
		"EL RECORD": "REKOR",
		"LA LEYENDA TE SALUDA": "LEGENDA MENYAPAMU",
		"TU SITIO EN LA HISTORIA": "TEMPATMU DALAM SEJARAH",
		"EL ESTADIO CON TU NOMBRE": "STADION DENGAN NAMAMU",
		"EL HOMENAJE": "PENGHARGAAN",
		"EL DESFILE": "PARADE",
		"EL BALCON DEL AYUNTAMIENTO": "BALKON BALAI KOTA",
		"LA PEÑA DEL BARRIO": "FAN CLUB LOKAL",
		"LAS PANTALLAS DE NUEVA YORK": "LAYAR NEW YORK",
		"LA COPA VUELVE EN AVION": "PIALA TERBANG PULANG",
		"LA OVACION AJENA": "OVASI LAWAN",
		"TU CANTO EN LA GRADA": "NYANYIANMU DI TRIBUN",
		"EL PASILLO DEL RIVAL": "BARISAN HORMAT LAWAN",
		"LA PRIMERA CONVOCATORIA": "PANGGILAN PERTAMA",
		"LA LISTA DEL MUNDIAL": "DAFTAR KEJUARAAN DUNIA",
		"TU VIEJO DORSAL": "NOMOR LAMAMU",
		"EL BAR DEL BARRIO": "WARUNG LOKAL",
		"EL DESCENSO": "DEGRADASI",
		"SUBCAMPEON": "JUARA DUA",
		"LA FINAL PERDIDA": "FINAL KALAH",
		"LA ULTIMA TARDE": "SORE TERAKHIR",
		"LA LESION": "CEDERA",
		"LA PRIMERA BANCA": "CADANGAN PERTAMA",
		"LA PITADA": "CEMOOHAN",
		"EL TECNICO SE VA": "PELATIH PERGI",
		"LA TAQUILLA VACIA": "LOKER KOSONG",
		"SE FUE AL RIVAL": "PINDAH KE LAWAN",
		"LA VUELTA AL CAMPO ENEMIGO": "KEMBALI KE KANDANG LAWAN",
		"EL RECIBIMIENTO AL VERDUGO": "SAMBUTAN SANG MOMOK",
		"LA DESPEDIDA DEL VESTUARIO": "PERPISAHAN RUANG GANTI",
		"EL ULTIMO PARTIDO EN CASA": "LAGA KANDANG TERAKHIR",
		"EL ADIOS A LA SELECCION": "SELAMAT TINGGAL TIMNAS",
		"EL PASILLO DE HONOR": "BARISAN KEHORMATAN",
		"LA PRESENTACION": "PERKENALAN",
		"LA BIENVENIDA": "SAMBUTAN",
		"LA FIRMA": "TEKEN",
		"LA RUEDA DE PRENSA": "KONFERENSI PERS",
		"LA PREGUNTA DEL PRECONTRATO": "PERTANYAAN PRAKONTRAK",
		"EL OJEADOR EN LA TRIBUNA": "PENCARI BAKAT DI TRIBUN",
		"LLEGA EL REFUERZO": "PEMAIN BARU TIBA",
		"LOS FICHAJES DEL VERANO": "TRANSFER MUSIM PANAS",
		"LA NOCHE DEL CIERRE": "MALAM DEADLINE",
		"TU FICHAJE EN LA PORTADA": "REKRUTANMU DI HALAMAN DEPAN",
		"LA CHARLA CON EL COMPAÑERO": "OBROLAN DENGAN REKAN SETIM",
		"LA LISTA DE LA SELECCION": "DAFTAR TIMNAS",
		"EL VESTUARIO DE COPA": "RUANG GANTI PIALA",
		"EL VESTUARIO DEL DERBI": "RUANG GANTI DERBY",
		"LA PORTADA DEL DERBI": "HALAMAN DEPAN DERBY",
		"EL MARCADOR DEL DERBI": "PAPAN SKOR DERBY",
		"EL ESPEJO DEL DERBI": "CERMIN DERBY",
		"EL HUECO DEL DERBI": "CELAH DERBY",
		"EL PORTERO TE CONOCE": "KIPER MENGENALMU",
		"LA TANDA DE PENALES": "ADU PENALTI",
		"EL RECUERDO": "SOUVENIR",
		"LA PASARELA DE EQUIPACIONES": "CATWALK JERSEY",

		"LOS AUTOGRAFOS EN LA PUERTA": "AUTOGRAF DI GERBANG",
		"FIRMA LA CAMISETA": "TEKEN JERSEY",
		"TRES CAMISETAS PARA LA GRADA": "TIGA JERSEY UNTUK TRIBUN",
		"CAMISETAS FIRMADAS": "JERSEY DITEKEN",
		"Ganaste, y tres se van a casa con tu firma.": "Kamu menang, dan tiga orang pulang membawa tanda tanganmu.",
		"No hubo victoria, pero tres se van a casa con tu firma.": "Tak ada kemenangan, tapi tiga orang pulang membawa tanda tanganmu.",
		"LAS FIRMAS EN LA GRADA": "TANDA TANGAN DI TRIBUN",
		"LA FIRMA DE FOTOS": "TANDA TANGAN FOTO",
		"FIRMA LA FOTO": "TEKEN FOTO",
		"FOTOS FIRMADAS": "FOTO DITEKEN",
		"EVENTO CON LA AFICION": "ACARA SUPORTER",
		"FIRMA DE FOTOS": "TEKEN FOTO",
		"Tu primer evento con la afición: cinco fotos con tu firma.": "Acara pertamamu dengan suporter: lima foto dengan tanda tanganmu.",
		"Y la cola seguía: {0} más esperando su foto.": "Dan antrean terus memanjang: {0} lagi menunggu fotonya.",
		"Cinco fotos con tu firma, cinco que se van contentos.": "Lima foto dengan tanda tanganmu, lima orang pulang senang.",
		"Firma con el dedo": "Tanda tangan dengan jari",
		"BORRAR FIRMA": "HAPUS TTD",
		"AFICIÓN +{0}": "FANS +{0}",
		"AFICIONADOS ESPERANDO": "SUPORTER MENUNGGU",
		"TU PRIMER AUTÓGRAFO": "AUTOGRAF PERTAMAMU",
		"TE ESPERABAN EN LA PUERTA": "MEREKA MENUNGGU DI GERBANG",
		"Pocos, pero vinieron por ti. Así empieza todo.": "Hanya sedikit, tapi mereka datang untukmu. Beginilah semuanya dimulai.",
		"Ya te reconocen desde lejos. Y tu coche también.": "Mereka mengenalimu dari jauh. Mobilmu juga.",
		"Llegar a entrenar ya es un acontecimiento.": "Datang ke latihan kini sudah jadi peristiwa.",
		"Primer Autógrafo": "Autograf Pertama",
		"Firmar una camiseta a la gente que te espera en la puerta de la ciudad deportiva.": "Tanda tangani jersey untuk orang-orang yang menunggu di gerbang pusat latihan.",

		"La Más Vendida": "Paling Laris",
		"Que tu camiseta sea la más vendida del vestuario en una temporada.": "Jadikan jerseymu yang terlaris di ruang ganti dalam satu musim.",
		"All-in": "All-in",
		"Ganar el torneo de póquer de tu casa.": "Menangkan turnamen poker di rumahmu.",
		"La Ley del Ex": "Hukum Sang Mantan",
		"Marcarle un gol a un club del que te fuiste.": "Cetak gol ke klub yang pernah kamu tinggalkan.",
		"Una Vida Entera": "Seumur Hidup",
		"Vivir 50 escenas distintas del álbum en una misma carrera.": "Jalani 50 adegan album yang berbeda dalam satu karier.",
		"Conquistador de Europa": "Penakluk Eropa",
		"Conquistador de Sudamérica": "Penakluk Amerika Selatan",
		"Conquistador de Norteamérica": "Penakluk Amerika Utara",
		"Conquistador de África": "Penakluk Afrika",
		"Conquistador de Asia": "Penakluk Asia",
		"Conquistador de Oceanía": "Penakluk Oseania",
		"Libro Completo": "Buku Lengkap",
		"Vencer a todos los clubes y selecciones de Europa.": "Kalahkan semua klub dan timnas di Eropa.",
		"Vencer a todos los clubes y selecciones de Sudamérica.": "Kalahkan semua klub dan timnas di Amerika Selatan.",
		"Vencer a todos los clubes y selecciones de Norteamérica, Centroamérica y el Caribe.": "Kalahkan semua klub dan timnas di Amerika Utara, Amerika Tengah, dan Karibia.",
		"Vencer a todos los clubes y selecciones de África.": "Kalahkan semua klub dan timnas di Afrika.",
		"Vencer a todos los clubes y selecciones de Asia.": "Kalahkan semua klub dan timnas di Asia.",
		"Vencer a todos los clubes y selecciones de Oceanía.": "Kalahkan semua klub dan timnas di Oseania.",
		"Vencer a todos los rivales del juego: cada club y cada selección del mundo.": "Kalahkan semua lawan di game: setiap klub dan setiap timnas di dunia.",
		"Álbum Completo": "Album Lengkap",
		"Descubrir todos los arquetipos de pareja.": "Temukan semua arketipe pasangan.",
		"Rodeado": "Dikerumuni",
		"Firmar autógrafos con 40 aficionados o más esperándote en la puerta.": "Beri autograf saat 40 suporter atau lebih menunggumu di gerbang.",
		"Turista de Estadios": "Turis Stadion",
		"Jugar en 25 estadios distintos.": "Bermain di 25 stadion berbeda.",
		"El Brazalete": "Ban Kapten",
		"Ser el capitán de tu club.": "Jadi kapten klubmu.",
		"Desde los Once Metros": "Dari Titik Penalti",
		"Marcar el penal que gana una tanda.": "Cetak penalti penentu kemenangan di adu penalti.",
		"Carta de Presentación": "Kartu Perkenalan",
		"Marcar en tu debut con un club nuevo.": "Cetak gol di debutmu bersama klub baru.",
		"De Hierro": "Manusia Besi",
		"Jugar 20 partidos o más en una temporada sin perderte ninguno por lesión.": "Bermain 20 laga atau lebih dalam satu musim tanpa absen satu pun karena cedera.",
		"Niño Prodigio": "Bocah Ajaib",
		"Debutar en Primera División antes de cumplir 18 años.": "Debut di kasta tertinggi sebelum umur 18 tahun.",
		"Roble Viejo": "Makin Tua Makin Jadi",
		"Marcar un gol con 38 años o más.": "Cetak gol di usia 38 tahun atau lebih.",
		"EL ALTA MEDICA": "SIAP MAIN LAGI",
		"LA MUDANZA": "PINDAHAN",
		"LAS OFERTAS DEL REGRESO": "TAWARAN SETELAH KEMBALI",
		"¡ALARMA!": "ALARM!",
		"MUSEO DE {0}": "MUSEUM {0}",
		"¿ME FIRMA LA GORRA?": "BISA TEKEN TOPIKU?",
		"EL MUSEO DE TU EGO": "MUSEUM EGOMU",
		"CLASE DE BAILE": "KELAS DANSA",
		"PROFESOR: {0}": "GURU: {0}",
		"LA CLASE DE LAS ABUELAS": "KELAS PARA NENEK",
		"ESTRENO MUNDIAL": "PREMIERE DUNIA",
		"LA PELÍCULA DE {0}": "FILM {0}",
		"LA PELÍCULA DE TU VIDA": "FILM HIDUPMU",
		"DURACIÓN: 4 H 38 MIN": "DURASI: 4 J 38 MNT",
		"EL ESTRENO": "PREMIERE",
		"TODAS LAS ESCENAS": "SEMUA ADEGAN",
		"Tu vida, en cines. Dura cuatro horas y media y nadie se ha ido.": "Hidupmu, di bioskop. Durasinya empat setengah jam dan tak seorang pun pergi.",
		"¡NO ME CUENTES EL FINAL!": "JANGAN BOCORKAN AKHIRNYA!",
		"MARTES, 19:00": "SELASA, 19.00",
		"MÍSTERS ANÓNIMOS": "PELATIH ANONIM",
		"PASO 1: ACEPTAR QUE LO SENTASTE": "LANGKAH 1: AKUI MENCADANGKANNYA",
		"TERAPIA DE MÍSTERS": "TERAPI PELATIH",
		"TERAPIA DE MISTERS": "TERAPI PELATIH",
		"TODOS LOS TÉCNICOS": "SEMUA PELATIH",
		"Los has tenido a todos. Ahora se reúnen los martes para superarlo.": "Mereka semua pernah melatihmu. Kini mereka berkumpul tiap Selasa untuk bisa move on.",
		"¡ES ÉL! ¡EL QUE PEDÍA SER TITULAR!": "ITU DIA! YANG MINTA JADI INTI!",
		"RESERVA PARA SIETE": "MEJA UNTUK TUJUH",
		"LA CENA DE LAS EX": "DINNER MANTAN",
		"TODAS LAS PAREJAS": "SEMUA PASANGAN",
		"Las has conocido a todas. Todas. En la misma mesa.": "Kamu sudah bertemu semuanya. Semuanya. Di meja yang sama.",
		"PAGA ÉL, ¿NO?": "DIA BAYAR, KAN?",
		"DOMINGO, 13:00": "MINGGU, 13.00",
		"LOS DERROTADOS": "PARA YANG KALAH",
		"BARBACOA DE LOS DERROTADOS": "BBQ PARA YANG KALAH",
		"TODOS LOS RIVALES": "SEMUA LAWAN",
		"Les ganaste a todos. Te invitaron igual. La salchicha, quemada.": "Kamu mengalahkan semuanya. Mereka tetap mengundangmu. Sosisnya gosong.",
		"BARBACOA ANUAL": "BBQ TAHUNAN",
		"PERDIMOS CONTRA {0}": "KAMI KALAH DARI {0}",
		"TE GUARDAMOS LA SALCHICHA QUEMADA": "KAMI SISAKAN SOSIS GOSONG UNTUKMU",
		"03:12 · MUSEO CERRADO": "03:12 · MUSEUM TUTUP",
		"EL CONSERJE DEL SALÓN": "PENJAGA HALL OF FAME",
		"TU PRIMERA PLACA": "PLAKAT PERTAMAMU",
		"Ya estás en el Salón de la Fama. El conserje tiene la foto que lo demuestra.": "Kamu sudah masuk Hall of Fame. Penjaga punya fotonya sebagai bukti.",
		"PARA MI CUÑADO, QUE NO SE LO CREE": "UNTUK IPARKU, YANG TAK PERCAYA",
		"INAUGURACIÓN": "PERESMIAN",
		"TU ESTATUA": "PATUNGMU",
		"LA ESTATUA": "PATUNG",
		"TODA LA COLECCIÓN": "SELURUH KOLEKSI",
		"Lo has completado todo. Te han hecho una estatua. El pelo es del utillero.": "Kamu menyelesaikan semuanya. Mereka membuatkan patungmu. Rambutnya milik petugas kit.",
		"LEYENDA ETERNA": "LEGENDA ABADI",
		"¿ESE PELO ES DEL UTILLERO?": "ITU RAMBUT PETUGAS KIT?",
		"TODOS LOS FESTEJOS": "SEMUA SELEBRASI",
		"Te sabes todos los festejos. Ahora ellas también.": "Kamu hafal semua selebrasi. Sekarang mereka juga.",
		"¡AHORA LA DE QUITARSE LA CAMISETA!": "SEKARANG YANG BUKA BAJU!",
		"TODOS LOS LOGROS": "SEMUA PRESTASI",
		"Lo tienes todo. Hasta el guardia de noche es fan tuyo.": "Kamu punya semuanya. Bahkan satpam malam pun jadi penggemarmu.",
		"LA FIRMA DEL REGRESO": "TEKEN KEMBALI",


		"EL BANDERIN": "BENDERA",
		"El clásico: todo el equipo corre al banderín del lado por donde entró el balón.":
			"Klasik: seluruh tim berlari ke bendera sudut di sisi tempat bola masuk.",
		"CON LA GENTE": "KE SUPORTER",
		"Al fondo, detrás de la línea de gol. En casa, además, te abrazas con un aficionado.":
			"Ke belakang, di balik garis gawang. Saat laga kandang, kamu juga dipeluk seorang suporter.",
		"LA PIÑA": "PILE-ON",
		"Nadie se va a ningún lado: la montonera se arma justo donde marcaste.":
			"Tak ada yang lari ke mana-mana: tumpukan terbentuk tepat di tempatmu mencetak gol.",
		"CON LOS SUPLENTES": "DENGAN CADANGAN",
		"A la banda, con los suplentes. El gol del que acaba de entrar se festeja con los que siguen en el banco.":
			"Ke pinggir lapangan, bersama cadangan. Gol pemain yang baru masuk dirayakan bersama mereka yang masih di bangku.",
		"AL CENTRO": "KE TENGAH",
		"Balón bajo el brazo y a sacar de nuevo. Todavía no hay nada que festejar.":
			"Bola di bawah lengan dan langsung kick-off lagi. Belum ada yang perlu dirayakan.",
		"TU RINCON": "POJOKMU",
		"Sólo de visita: a la esquina donde está tu puñado de aficionados.":
			"Hanya saat tandang: ke pojok tempat segelintir suporter tandangmu berada.",
		"SALTAR LA VALLA": "LOMPAT PAGAR",
		"Sólo en casa: saltas la publicidad y te vas hasta el pie de la grada. Esa esquina se vuelve loca.":
			"Hanya di kandang: kamu melompati papan iklan dan menuju kaki tribun. Pojok itu menggila.",
		"AL TECNICO": "KE PELATIH",
		"Vienes de bronca con el entrenador y te vas a la raya a abrazarlo. Una sola vez por partido.":
			"Kamu sempat cekcok dengan pelatih, lalu berlari ke garis pinggir memeluknya. Sekali per laga.",
		"EN SU CASA": "KANDANGNYA",
		"Gol en un derbi, de visita: lo festejas frente a su fondo. Te abuchea el estadio entero y te llueven botellas.":
			"Gol derby saat tandang: kamu merayakannya di depan tribun mereka. Seluruh stadion mencemoohmu dan botol berhamburan.",
		"PARA LA TELE": "UNTUK TV",
		"Te plantas delante de la cámara de televisión y el gol se ve por su visor. Sólo donde hay transmisión: en tercera no hay cámaras.":
			"Kamu berdiri di depan kamera televisi dan gol terlihat lewat jendela bidiknya. Hanya di laga yang disiarkan: di divisi tiga tak ada kamera.",
		"ES NUESTRO": "MILIK KITA",
		"Última jornada, y el gol te pone por delante. Salta hasta el banquillo al campo.":
			"Pekan terakhir, dan golmu membuatmu unggul. Bahkan bangku cadangan ikut berhamburan ke lapangan.",


		"DE RODILLAS": "KNEE SLIDE",
		"Llegas barriéndote de rodillas. Una de cada tres veces, en los festejos con carrera de verdad.":
			"Kamu tiba meluncur dengan lutut di rumput. Satu dari tiga kali, pada selebrasi yang benar-benar berlari.",
		"PUÑO AL AIRE": "KEPAL TINJU",
		"El salto con el puño cerrado, en el gol agónico que lo cambia todo.":
			"Lompat dengan tinju terkepal, untuk gol di detik terakhir yang mengubah segalanya.",
		"BALON A LA GRADA": "BOLA KE TRIBUN",
		"La otra cara del gol agónico: reventar el balón hacia arriba y que caiga donde caiga.":
			"Sisi lain dari gol detik terakhir: tendang bola tinggi-tinggi dan biarkan jatuh di mana saja.",
		"BANDERIN PARTIDO": "BENDERA PATAH",
		"Llegas al córner y le metes una patada al mástil. Se parte. Uno de cada seis córners.":
			"Kamu sampai di pojok dan menendang tiangnya. Patah. Satu dari enam tendangan sudut.",
		"MASTIL AGARRADO": "GENGGAM BENDERA",
		"Llegas al córner, agarras el mástil con el puño y te plantas con la mano en la cadera.": "Kamu lari ke pojok, menggenggam tiang bendera dan berpose dengan tangan di pinggang.",
		"SIN CAMISETA": "BUKA JERSEY",
		"Te quitas la camiseta y les enseñas el dorsal. Siempre trae factura: abucheo y botellas.":
			"Kamu melepas jersey dan menunjukkan nomor di punggungmu. Selalu ada harganya: cemoohan dan lemparan botol.",
		"EL SILENCIO": "KEHENINGAN",
		"Plantarte quieto frente a su fondo mientras el estadio te abuchea. No hacer nada es el gesto.":
			"Berdiri diam di depan tribun mereka sementara stadion mencemoohmu. Tak berbuat apa-apa adalah geraknya.",
		"BRAZOS ABIERTOS": "LENGAN TERBUKA",
		"Con el brazalete de tu país: brazos abiertos, pidiéndole más a tu gente.":
			"Dengan ban kapten negaramu: lengan terbuka, meminta lebih dari orang-orangmu.",
		"GRACIAS, SOCIO": "MAKASIH, KAWAN",
		"El gol lo empezó otro: vino de un centro o de un córner, y lo primero que haces es señalar a quien lo puso.":
			"Gol ini dimulai orang lain: berasal dari umpan silang atau tendangan sudut, dan hal pertama yang kamu lakukan adalah menunjuk orang yang mengirimnya.",
		"LA REVERENCIA": "MEMBUNGKUK",
		"Un golazo: desde fuera del área o de falta directa. Te giras hacia la grada y te inclinas. La mitad de las veces.":
			"Gol indah: dari luar kotak penalti atau tendangan bebas langsung. Kamu berbalik ke tribun dan membungkuk. Satu dari dua kali.",
		"BESO AL ESCUDO": "CIUM LAMBANG",
		"Tres temporadas o más en el mismo club. Ya no eres un fichaje, eres de la casa: besas el escudo y la grada lo sabe.":
			"Tiga musim atau lebih di klub yang sama. Kamu bukan lagi rekrutan, kamu sudah bagian dari klub: kamu mencium lambang dan tribun tahu itu.",
		"TRES DEDOS": "TIGA JARI",
		"Tu tercer gol del partido. No hay nada que explicar: levantas tres dedos y que los cuenten ellos.":
			"Gol ketigamu di laga ini. Tak ada yang perlu dijelaskan: kamu angkat tiga jari dan biar mereka yang menghitung.",
		"SIN FESTEJAR": "TAK MERAYAKAN",
		"Le marcaste al club que te formó. Te quedas quieto, con la mano en alto. Los otros nueve vienen a abrazarte igual.":
			"Kamu mencetak gol ke klub yang membentukmu. Kamu diam, satu tangan terangkat. Sembilan lainnya tetap datang memelukmu.",
		"AL CIELO": "KE LANGIT",
		"Tu primer gol después de una lesión larga. Señalas al cielo. Sólo cuenta ese gol, no los de después.":
			"Gol pertamamu setelah cedera panjang. Kamu menunjuk ke langit. Hanya gol itu yang dihitung, bukan yang sesudahnya.",


		"A TU PORTERO":
			"KE KIPERMU",
		"Tu portero te salvó el partido con una parada. El festejo se va hacia TU campo y él viene corriendo desde su área.":
			"Kipermu menyelamatkan laga dengan satu penyelamatan. Selebrasi bergerak ke sisi TIMMU dan dia berlari dari kotak penaltinya.",
		"AL FOSO":
			"KE PARIT",
		"Sólo de noche, con los focos encendidos: te plantas contra la valla del fondo y el estadio entero se te llena de flashes.":
			"Hanya malam hari, saat lampu sorot menyala: kamu bersandar ke papan iklan di belakang gawang dan seluruh stadion dipenuhi kilatan blitz.",
		"A LA TRIBUNA":
			"KE TRIBUN UTAMA",
		"Hay clubes preguntando por ti. Te vas a la banda de la tribuna principal y señalas hacia el palco: que decidan ellos.":
			"Ada klub yang menanyakan kamu. Kamu ke garis pinggir di depan tribun utama dan menunjuk ke boks VIP: biar mereka yang putuskan.",
		"EN SU AREA":
			"KOTAK LAWAN",
		"Derbi de visita: no corres a ningún lado. Te plantas en el punto de penalti, de espaldas al arco y de cara a su gente, con los brazos abiertos.":
			"Derby tandang: kamu tidak lari ke mana-mana. Kamu berdiri di titik penalti, membelakangi gawang, menghadap suporter lawan dengan tangan terentang.",
		"NADIE VIENE":
			"SENDIRIAN",
		"El vestuario no te quiere. Marcas, y ninguno de los diez va a abrazarte: se dan la vuelta y te dejan ahí.":
			"Ruang ganti tidak lagi mendukungmu. Kamu cetak gol, dan tak satu pun dari sepuluh rekanmu memeluk: mereka berbalik dan membiarkanmu sendirian.",
		"MAS RUIDO":
			"RIUHKAN",
		"En casa: las dos manos a las orejas, pidiéndole a tu gente que se oiga.":
			"Kandang: kedua tangan di telinga, minta suportermu bersuara lebih keras.",
		"BESAR EL CESPED":
			"CIUM RUMPUT",
		"Tu primera temporada en el club: te arrodillas y besas el césped de tu casa nueva.":
			"Musim pertamamu di klub: kamu berlutut dan mencium rumput rumah barumu.",
		"APLAUSO A TU GENTE":
			"TEPUK TANGAN",
		"Marcas, pero seguís perdiendo: nada de gritos, aplaudes a los que vinieron a verte.":
			"Kamu cetak gol, tapi masih tertinggal: tanpa teriak, kamu bertepuk tangan untuk yang datang menontonmu.",
		"SALUDO DE GOLEADA":
			"SALAM PESTA GOL",
		"Con tres goles o más de ventaja ya no hay nada que gritar: caminas saludando a la grada.":
			"Unggul tiga gol atau lebih, tak ada lagi yang perlu diteriakkan: kamu berjalan sambil melambai ke tribun.",
		"SALTO DE CABEZA":
			"LOMPAT SUNDULAN",
		"Gol por alto: saltas una y otra vez con los brazos al cielo.":
			"Gol dari bola atas: kamu melompat berkali-kali dengan kedua tangan ke langit.",
		"EL AVION":
			"PESAWAT",
		"Corres al festejo con los brazos abiertos, planeando como un avión. Sólo en los festejos con carrera de verdad.":
			"Kamu berlari merayakan gol dengan kedua tangan terbentang, melayang seperti pesawat. Hanya pada selebrasi yang benar-benar berlari.",
		"LA SELFIE":
			"SWAFOTO",
		"Pegado a tu gente —tu fondo o la valla en casa, tu rincón de visita—: sacas el teléfono y te haces una foto con ellos.":
			"Merapat ke pendukungmu —tribunmu atau pagar di kandang, sudut pendukungmu saat tandang—: kamu mengeluarkan ponsel dan berfoto bersama mereka.",
		"ES MI HORA":
			"WAKTUKU",
		"Gol del minuto 80 en adelante: te señalas la muñeca, que es tu hora. Una de cada tres veces.":
			"Gol mulai menit ke-80: kamu menunjuk pergelangan tangan, karena ini waktumu. Satu dari tiga kali.",
		"MODO ZEN":
			"MODE ZEN",
		"Con dos goles de ventaja o más: te sientas en el césped con las piernas cruzadas y meditas. Que se preocupen ellos.":
			"Unggul dua gol atau lebih: kamu duduk bersila di rumput dan bermeditasi. Biar mereka yang khawatir.",
		"BESO AL ANILLO":
			"CIUM CINCIN",
		"Tienes pareja: besas el anillo y señalas a la grada, a quien te mira desde allí. Uno de cada cinco goles.":
			"Kamu punya pasangan: kamu mencium cincin dan menunjuk ke tribun, ke orang yang menontonmu dari sana. Satu dari lima gol.",
		"MI NOMBRE":
			"NAMAKU",
		"Hay clubes preguntando por ti: te das la vuelta y te señalas el nombre de la espalda para que lo apunten. La mitad de las veces.":
			"Ada klub yang menanyakanmu: kamu berbalik dan menunjuk nama di punggungmu supaya mereka mencatatnya. Satu dari dua kali.",
		"LA MORTAL":
			"SALTO",
		"Un golazo, desde fuera del área o de falta: llegas, tomas impulso y das una mortal hacia atrás. La otra mitad de los golazos.":
			"Gol indah, dari luar kotak penalti atau tendangan bebas: kamu datang, mengambil ancang-ancang dan melakukan salto ke belakang. Separuh golazo lainnya.",
		"EL DAB":
			"DAB",
		"Se gana en el banquillo, con tus tres botellas de pie: escondes la cara en el codo y apuntas con el otro brazo. Uno de cada siete goles.":
			"Didapat di bangku cadangan, dengan ketiga botolmu berdiri: kamu menyembunyikan wajah di siku dan menunjuk dengan lengan satunya. Satu dari tujuh gol.",
		"¡DAB DESBLOQUEADO! Ya sale en tus goles.":
			"DAB TERBUKA! Kini ada di selebrasi golmu.",
		"Se gana en el banquillo, con tres partidas ganadas 2-0: te plantas cara a cara con un compañero y os jugáis el gol a una mano. Uno de cada siete goles.":
			"Didapat di bangku cadangan, dengan tiga permainan menang 2-0: kamu berhadapan dengan rekan setim dan kalian menentukan gol itu dengan satu tangan. Satu dari tujuh gol.",
		"2-0: {0} de {1} para festejar tus goles con CHIN CHAN PU.":
			"2-0: {0} dari {1} untuk merayakan golmu dengan GUNTING BATU KERTAS.",
		"¡CHIN CHAN PU DESBLOQUEADO! Ya sale en tus goles.":
			"GUNTING BATU KERTAS TERBUKA! Kini ada di selebrasi golmu.",
		"BRAZOS CRUZADOS":
			"TANGAN SILANG",
		"Ya habías fallado dos claras hoy. A la tercera no festejas: te cruzas de brazos y que hablen ellos.":
			"Kamu sudah menyia-nyiakan dua peluang emas hari ini. Di yang ketiga kamu tak merayakan: kamu menyilangkan tangan dan biar mereka yang bicara.",


		"AL CHARCO":
			"KE GENANGAN",
		"Sólo con lluvia y campo encharcado: todo el equipo corre al charco más cercano y se lanza de panza. Salpica hasta la valla.":
			"Hanya saat hujan dan lapangan tergenang: seluruh tim lari ke genangan terdekat dan meluncur dengan perut. Percikannya sampai ke papan iklan.",
		"EN LA VALLA":
			"PAPAN IKLAN",
		"Sólo en casa: te subes a la publicidad con los dos que llegan contigo. Los tres, sentados y de brazos cruzados, mirando al campo.":
			"Hanya di kandang: kamu naik ke papan iklan bersama dua rekan yang menyusul. Bertiga duduk, tangan bersilang, menatap lapangan.",
		"LA BOTELLA":
			"BOTOL AIR",
		"Festejando pegado a tu grada, alguien te tira una botella de agua: la atrapas al vuelo, te la bebes y la mandas de vuelta.":
			"Saat merayakan dekat tribunmu, seseorang melempar botol air: kamu tangkap di udara, meminumnya, lalu melemparnya balik.",


		"EN TU PUESTO MANDA": "TEMPATMU MILIK",
		"Empiezas en el banquillo.": "Kamu mulai dari bangku cadangan.",

		"JUEGAS EN {0} · PIDE {1}": "DI DIVISI {0} · BUTUH {1}",
		"NOTA {0} · PIDE {1}": "RATING {0} · BUTUH {1}",
		"{0} A {1} DE TU SITIO": "{0} TERPAUT {1} DARIMU",
		"{0} A {1}": "{0} KURANG {1}",
		"DE TU SITIO": "DARI TEMPATMU",
		"TÉCNICO {0} · PIDE {1}": "COACH {0} · BUTUH {1}",
		"TÉCNICO {0}": "PELATIH {0}",
		"A {0} DE {1}": "{0} BEDA {1}",
		"TE ACERCAS": "MENDEKAT",
		"TE ALEJAS": "MENJAUH",
		"Por nivel saldrías de inicio, pero el seleccionador te tiene en {0} y sólo pone de titular a quien le tiene en {1}. Se gana con partidos de selección.": "Dari levelmu kamu bisa jadi starter, tapi pelatih timnas menilaimu {0} dan hanya menurunkan pemain yang dinilainya {1} ke atas. Itu didapat lewat laga timnas.",
		"El vestuario te tiene en {0}: hasta {1} te llegarán {2} balones como mucho.": "Ruang ganti menilaimu {0}: sampai {1} kamu hanya dapat paling banyak {2} bola.",
		"En casa la afición está contigo ({0}): un balón más.": "Di kandang suporter mendukungmu ({0}): satu bola lagi.",
		"En casa la afición te pita ({0}): un balón menos.": "Di kandang suporter menyorakimu ({0}): satu bola berkurang.",
		"LE QUITASTE EL SITIO A": "KAMU AMBIL TEMPAT",
		"RESERVA": "CADANG",
		"PLANTILLA": "SKUAD",
		"EL ONCE": "TIM INTI",
		"NO CONVOCADOS": "TAK DIPANGGIL",
		"RACHA": "FORM",
		"TU PUESTO": "TEMPATMU",
		"PEDIR JUGAR DE {0} · {1}": "MINTA MAIN DI {0} · {1}",
		"LO VERA BIEN": "DIA SUKA",
		"PUEDE ESCUCHARTE": "MUNGKIN DIDENGAR",
		"LO VERA DIFICIL": "DIA RAGU",
		"NI LO ESCUCHA": "TAK DIDENGAR",
		"Ya le pediste un cambio de puesto en esta ventana.": "Kamu sudah minta pindah posisi di bursa ini.",
		"El club te pasa a jugar de {0}.": "Klub memindahkanmu bermain sebagai {0}.",
		"{0} · RINDES {1}%": "{0} · PERFORMA {1}%",
		"{0} · RINDES AL {1}% AQUI": "{0} · PERFORMAMU {1}% DI SINI",
		"TUS PUESTOS": "POSISIMU",
		"PUEDES APRENDERLO": "BISA DIPELAJARI",
		"FAVORITA": "FAVORIT",
		"Tu FAVORITA pesa: los clubes que te quieren ahí salen antes y el técnico te escucha más si se la pides.": "Posisi FAVORIT-mu berpengaruh: klub yang mengincarmu di sana datang lebih dulu, dan pelatih lebih mendengar kalau kamu memintanya.",


		"¿APRENDER {0}?": "PELAJARI {0}?",
		"APRENDERLO": "PELAJARI",
		"PUESTO DEVUELTO · {0}": "REFUND POSISI · {0}",
		"NATURAL": "ASLI",
		"COMODO": "NYAMAN",
		"PROBANDO": "BELAJAR",
		"AJENO": "ASING",
		"Aprender un puesto hace que los clubes puedan ficharte para él. El oficio sale de jugarlo.": "Mempelajari posisi membuat klub bisa merekrutmu untuk posisi itu. Jam terbangnya didapat dengan memainkannya.",

		"En el partido: rematas dentro del área y te llegan más centros para cabecear.": "Di laga: kamu menyelesaikan di dalam kotak dan lebih banyak umpan silang untuk disundul.",
		"En el partido: más disparos desde la frontal y más balones para la volea.": "Di laga: lebih banyak tembakan dari tepi kotak dan lebih banyak bola untuk voli.",
		"En el partido: más contras por tu banda, disparos de lejos y salidas jugadas.": "Di laga: lebih banyak serangan balik di sayapmu, tembakan jarak jauh dan build-up dari belakang.",
		"En el partido: disparos de lejos y desde la frontal, voleas y salidas jugadas.": "Di laga: tembakan jarak jauh dan dari tepi kotak, voli dan build-up dari belakang.",
		"En el partido: sobre todo disparos de lejos y salidas jugadas; poca área.": "Di laga: terutama tembakan jarak jauh dan build-up dari belakang; jarang masuk kotak.",
		"TE QUIEREN DE {0}": "DIINCAR DI {0}",
		"PAGA MÁS": "GAJI+",
		"MEJOR CLUB": "KLUB TOP",
		"MÁS MINUTOS": "MENIT LEBIH",
		"OFERTA {0} DE {1}": "TAWARAN {0}/{1}",
		"SU ONCE MÁS FUERTE": "TIM INTI TERKUAT",
		"SI TE VAS, LO MEJOR DE LA MESA": "KALAU PERGI, TERBAIK DI MEJA",
		"TE HAN OFRECIDO": "DITAWARKAN",
		"DESTINOS": "PINJAMAN",
		"TU SALIDA": "KELUARMU",
		"EN CESIÓN": "DIPINJAMKAN",
		"FUERA DEL PLAN": "TAK DIPAKAI",
		"NO TE VENDEN": "TAK DIJUAL",
		"TE ESCUCHAN": "TERBUKA",
		"Salvo cláusula: {0}": "Kecuali klausul: {0}",
		"Te llegan {0} ofertas más y tu club pide un {1}% menos": "Kamu dapat {0} tawaran lagi dan klubmu minta {1}% lebih murah",
		"Te queda un año: no te retienen.": "Kontrakmu tinggal setahun: mereka tak menahanmu.",
		"TU SITIO · {0}": "TEMPATMU · {0}",
		"TU SITIO ESTA LIBRE": "TEMPATMU KOSONG",
		"CESIÓN {0} DE {1}": "PINJAMAN {0}/{1}",
		"SIN OPCIÓN": "TANPA OPSI",
		"Jugarías de": "Kamu akan main di",
		"Vuelves en": "Kembali dalam",
		"Opción de compra": "Opsi beli",
		"Creces": "Kamu berkembang",
		"Con la ventana abierta ya no se da pie: si quieren, su oferta llega a la mesa.": "Saat bursa sudah buka, tak ada lagi bujukan: kalau mereka mau, tawarannya langsung masuk ke meja.",
		"{0} TEMP": "{0} MSM",
		"mercadoMESA": "MEJA",
		"MINUTOS": "MENIT",
		"Nada de lo que hay encima de la mesa te mejora: ni el club, ni la ficha, ni los minutos.":
			"Tak ada tawaran di meja yang lebih baik dari yang kamu punya: bukan klubnya, bukan gajinya, bukan menitnya.",
		"TE PEDIRÁN GOLES": "MEREKA MINTA GOL",
		"TE PEDIRÁN ASISTENCIAS": "MEREKA MINTA ASSIST",
		"Sin club: no hay plantilla que mostrar. Ficha por un equipo y aquí verás a los tuyos.":
			"Tanpa klub: tak ada skuad untuk ditampilkan. Gabung ke satu tim dan rekan-rekanmu muncul di sini.",
		"Sales de inicio.": "Kamu main sejak awal.",
		"Viajas, pero no juegas.": "Kamu ikut berangkat, tapi tidak main.",
		"El torneo ya empezó y la lista está cerrada: tu sitio se juega en la próxima.":
			"Turnamen sudah mulai dan daftar pemain ditutup: tempatmu ditentukan di edisi berikutnya.",
		"Ya das el nivel: te llaman en la próxima fecha FIFA.":
			"Levelmu sudah cukup: kamu dipanggil di jeda internasional berikutnya.",
		"BOTA DE LA LIGA": "TOP SKOR LIGA",
		"Tu premio te avala: este año no te piden nota ni nivel.":
			"Penghargaanmu menjaminmu: tahun ini mereka tak menuntut rating maupun level.",
		"MEJOR DE LA LIGA": "TERBAIK LIGA",
		"PREMIO DE CAMPEONES": "PENGHARGAAN ELITE",
		"CAMPEON DEL MUNDO": "JUARA DUNIA",
		"CAMPEON CONTINENTAL": "JUARA BENUA",
		"BOTA DEL MUNDIAL": "TOP SKOR DUNIA",
		"JUGAR INFILTRADO": "MAIN DISUNTIK",
		"PIDE": "MAU",
		"TIENES": "PUNYAMU",
		"Decide si SALES. Si le caes mal, no pasas del banquillo. Lo que haces en las fechas FIFA te sube o te baja con él, y en amistosos rota.":
			"Menentukan apakah kamu MAIN. Kalau dia tak suka, kamu tak lepas dari bangku. Yang kamu lakukan di jeda FIFA menaikkan atau menurunkanmu di matanya, dan di laga persahabatan dia merotasi.",
		"Deciden si te la PASAN: si el grupo no te quiere, te llegan dos balones. Se gana ganando juntos.":
			"Mereka yang menentukan kamu DIUMPAN: kalau grup tak menginginkanmu, kamu hanya dapat dua bola. Itu didapat dengan menang bersama.",
		"PARA ENTRAR": "UNTUK MASUK",
		"PARA SER TITULAR": "UNTUK JADI INTI",


		"MI EQUIPO":
			"TIMKU",
		"GERENCIA":
			"MANAJEMEN",
		"DAR UNA CHARLA AL VESTUARIO":
			"PIDATO DI RUANG GANTI",
		"Reúnes al grupo tú, sin el míster delante. Si te siguen, el equipo entero se suelta; si no eres nadie ahí dentro, se nota.":
			"Kamu kumpulkan grup sendiri, tanpa pelatih di depan. Kalau mereka mengikutimu, seluruh tim jadi lepas; kalau kamu bukan siapa-siapa di sana, itu kelihatan.",
		"PEDIR CAMBIO DE PUESTO":
			"MINTA PINDAH POSISI",
		"Le dices al técnico dónde quieres jugar. Cuenta lo cómodo que estés ahí y lo que se fíe de ti.":
			"Kamu bilang ke pelatih di mana kamu mau main. Yang dihitung: seberapa nyaman kamu di sana dan seberapa dia percaya padamu.",
		"PEDIR LOS BALONES PARADOS":
			"MINTA BOLA MATI",
		"Penales, faltas y córners para ti el resto de la temporada, aunque haya alguien con mejor pie en la plantilla.":
			"Penalti, tendangan bebas dan tendangan sudut jadi milikmu sampai akhir musim, meski ada rekan yang kakinya lebih bagus.",
		"SUGERIR UN FICHAJE":
			"USUL REKRUTAN",
		"Señalas a un jugador de otro club. El club mira su precio y su caja, y decide.":
			"Kamu tunjuk pemain dari klub lain. Klub melihat harganya dan kasnya sendiri, lalu memutuskan.",
		"AVISAR QUE TE VAS LA PROXIMA TEMPORADA":
			"UMUMKAN KAMU PERGI MUSIM DEPAN",
		"No pides permiso: avisas. Entras en la lista, bajan lo que piden por ti y llegan ofertas de verdad. La grada no lo olvida.":
			"Kamu tidak minta izin: kamu memberi kabar. Kamu masuk daftar, harga jualmu turun dan tawaran sungguhan berdatangan. Suporter tidak melupakannya.",
		"NIVEL EN EL VESTUARIO":
			"LEVEL DI RUANG GANTI",
		"CONFIANZA DEL TECNICO":
			"KEPERCAYAAN PELATIH",
		"EL VESTUARIO":
			"RUANG GANTI",
		"LA GRADA":
			"TRIBUN",
		"ANOS EN EL CLUB":
			"TAHUN DI KLUB",
		"Sin club no hay nada que pedir. Ficha por un equipo y aquí decidirás con él.":
			"Tanpa klub tak ada yang bisa diminta. Gabung ke satu tim dan di sini kamu memutuskan bersama mereka.",
		"TU PESO EN EL CLUB":
			"PENGARUHMU DI KLUB",
		"No se compra: sale de lo que eres en ese vestuario.":
			"Tidak bisa dibeli: datang dari siapa kamu di ruang ganti itu.",
		"QUE LE PIDES":
			"YANG KAMU MINTA",
		"Esperas respuesta a: {0}.":
			"Kamu menunggu jawaban soal: {0}.",
		"Te contestan en la próxima jornada.":
			"Mereka menjawab di pekan depan.",
		"Te contestan en {0} jornadas.":
			"Mereka menjawab dalam {0} pekan.",
		"Acabas de pedir algo: la próxima jornada puedes volver.":
			"Kamu baru saja meminta sesuatu: kembali lagi pekan depan.",
		"Acabas de pedir algo: puedes volver en {0} jornadas.":
			"Kamu baru saja meminta sesuatu: kembali lagi dalam {0} pekan.",
		"Cedido no decides tu vida aquí: el club que te tiene prestado no manda, y el tuyo ya decidió tu año.":
			"Saat dipinjamkan, kamu tak memutuskan apa pun di sini: klub peminjam tidak berkuasa, dan klub pemilikmu sudah menentukan tahunmu.",
		"LA RESPUESTA DEL CLUB":
			"JAWABAN KLUB",
		"Te escucharon y dijeron que no. Queda dicho.":
			"Mereka mendengarkan dan bilang tidak. Itu final.",
		"Hablaste tú y el grupo se soltó: el vestuario está contigo.":
			"Kamu bicara dan grup jadi lepas: ruang ganti bersamamu.",
		"Dijeron que sí, pero el puesto ya no estaba libre.":
			"Mereka bilang ya, tapi posisinya sudah tak kosong.",
		"Desde hoy juegas de {0}.":
			"Mulai hari ini kamu main di {0}.",
		"Los penales, las faltas y los córners son tuyos el resto de la temporada.":
			"Penalti, tendangan bebas dan tendangan sudut jadi milikmu sampai akhir musim.",
		"Queda dicho: te vas al acabar la temporada. Estás en la lista y van a llegar ofertas.":
			"Sudah diumumkan: kamu pergi di akhir musim. Kamu masuk daftar dan tawaran akan berdatangan.",
		"Dijeron que sí, pero el fichaje se cayó: ese jugador ya no estaba donde lo viste.":
			"Mereka bilang ya, tapi transfernya batal: pemain itu sudah tak ada di tempat yang kamu lihat.",
		"{0} firma por tu club. Lo pediste tú.":
			"{0} bergabung ke klubmu. Kamu yang memintanya.",
		"Te dijeron que sí.":
			"Mereka bilang ya.",
		"Peso {0} · {1}":
			"Pengaruh {0} · {1}",
		"Abrir la boca ya cuesta, digan lo que digan.":
			"Membuka mulut saja sudah ada harganya, apa pun jawabannya.",
		"PEDIRLO":
			"MINTA",
		"DEJARLO":
			"BATAL",
		"DONDE QUIERES JUGAR":
			"DI MANA KAMU MAU MAIN",
		"Sólo sabes jugar en un sitio. Aprende otro y podrás pedirlo.":
			"Kamu hanya bisa main di satu posisi. Pelajari yang lain dan kamu bisa memintanya.",
		"A QUIEN FICHAMOS":
			"REKRUT SIAPA",
		"Lo más flojo del once es el {0} ({1}).":
			"Yang paling lemah di tim inti adalah {0} ({1}).",
		"{0} · media {1} · {2} años · {3}":
			"{0} · OVR {1} · {2} tahun · {3}",
		"Hoy no hay nadie que mejore tu once y esté a tiro. Vuelve otra jornada.":
			"Hari ini tak ada yang bisa memperkuat timmu dan terjangkau. Kembali lagi pekan lain.",


		"LO ESTAN VIENDO":
			"SEDANG DITIMBANG",
		"MIENTRAS TANTO":
			"SEMENTARA ITU",
		"Tu peso subió a {0} desde que lo pediste.":
			"Pengaruhmu naik jadi {0} sejak kamu memintanya.",
		"Tu peso bajó a {0} desde que lo pediste.":
			"Pengaruhmu turun jadi {0} sejak kamu memintanya.",
		"Tu peso sigue en {0}.":
			"Pengaruhmu masih {0}.",
		"Te contestan con el peso que tengas ese día, no con el de hoy: lo que hagas hasta entonces cuenta.":
			"Mereka menjawab dengan pengaruh yang kamu punya di hari itu, bukan hari ini: yang kamu lakukan sampai saat itu dihitung.",
		"A {0} ya se lo llevaron: cuando contesten, la petición se caerá sola.":
			"{0} sudah diambil klub lain: saat mereka menjawab, permintaannya gugur sendiri.",
		"{0} sigue donde lo viste.":
			"{0} masih di tempat yang kamu lihat.",
		"LO QUE PUEDE PAGAR EL CLUB":
			"YANG BISA DIBAYAR KLUB",
		"La raya es el más caro de la lista.":
			"Garisnya menandai yang termahal di daftar.",
		"No cabe en la caja. Puedes señalarlo igual.":
			"Melebihi kas klub. Kamu tetap boleh menunjuknya.",
		"EL DESPACHO":
			"RUANG MANAJEMEN",
		"TE DIJERON QUE SI":
			"DISETUJUI",
		"TE DIJERON QUE NO":
			"DITOLAK",


		"Le quedan {0} temporadas: es un parche.":
			"Kontraknya tinggal {0} musim: itu solusi tambal sulam.",
		"Le quedan {0} temporadas.":
			"Kontraknya tinggal {0} musim.",


		"LO QUE LES HAS PEDIDO":
			"YANG SUDAH KAMU MINTA",
		"T{0} J{1} · {2}":
			"M{0} P{1} · {2}",
		"FICHAR A {0}":
			"REKRUT {0}",
		"JUGAR DE {0}":
			"MAIN DI {0}",
		"TE SIGUIERON":
			"MEREKA MENURUTIMU",
		"TE CAMBIARON DE SITIO":
			"KAMU DIPINDAH",
		"TE LOS DIERON":
			"MEREKA MEMBERIKANNYA",
		"QUEDO DICHO":
			"DIUMUMKAN",
		"LO FICHARON":
			"DIREKRUT",


		"LO QUE MAS TE FALTA":
			"YANG PALING KURANG",
		"{0}, {1} PUNTOS":
			"{0}, {1} POIN",
		"Se mide contra tu vestuario, no en absoluto: sube tu media, o cámbiate a un club donde destaques.":
			"Diukur terhadap ruang gantimu, bukan secara mutlak: naikkan OVR-mu, atau pindah ke klub tempat kamu menonjol.",
		"Cada partido la mueve, arriba o abajo, según tu nota.":
			"Setiap laga menggesernya, naik atau turun, sesuai ratingmu.",
		"Se gana fuera del campo: la charla, los retos en casa y lo que decides con ellos.":
			"Didapat di luar lapangan: pidato, tantangan di rumah, dan yang kamu putuskan bersama mereka.",
		"Sube al cumplir tu objetivo de contrato, y con el año que haga el club.":
			"Naik saat kamu memenuhi target kontrak, dan sesuai musim yang dijalani klub.",
		"Se revisa al cerrar la temporada, contra la mejor media de tus compañeros.":
			"Ditinjau di akhir musim, dibandingkan rating terbaik rekan setimmu.",
		"Se gana quedándote: cada temporada en el mismo club suma.":
			"Didapat dengan bertahan: tiap musim di klub yang sama ikut dihitung.",



		"NO SE PIDE, SE AVISA":
			"UMUMKAN, BUKAN MINTA",
		"Años en el club":
			"Tahun di klub",
		"DE CIEN":
			"DARI SERATUS",
		"PRESUPUESTO PARA FICHAJES":
			"ANGGARAN TRANSFER",

		"ENTRA SIN APRETAR":
			"AMAN DIBELANJAKAN",
		"CABE":
			"MUAT",
		"APRIETA":
			"MEPET",
		"NO LLEGA":
			"KURANG",
		"FICHAJES ESPERADOS":
			"TARGET TRANSFER",
		"Gastado en esta ventana: {0} de {1}.":
			"Terpakai di bursa ini: {0} dari {1}.",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede.":
			"Mereka jalan sesuai urutan ini: kalau satu teken, sisanya menawar dengan sisa uang.",
		"1 partido con ellos":
			"1 laga bersama mereka",
		"{0} partidos con ellos":
			"{0} laga bersama mereka",
		"Te faltan {0} de relación.":
			"Hubunganmu kurang {0}.",
		"TE ESCUCHA":
			"DIDENGAR",
		"LO QUE HICIERON CON TU LISTA":
			"NASIB DAFTARMU",
		"Ficharon a {0}. Lo señalaste tú.":
			"Mereka merekrut {0}. Kamu yang menunjuknya.",
		"Miraron tu lista y no ficharon a ninguno.":
			"Mereka melihat daftarmu dan tak merekrut satu pun.",
		"A QUIEN LE HAS SENALADO":
			"SIAPA YANG KAMU TUNJUK",
		"Marca hasta {0} jugadores en el RANKING y el club los mirará al cerrarse el mercado.":
			"Tandai sampai {0} pemain di RANKING dan klub akan melihat mereka saat bursa tutup.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y los mirarán al cerrarse el mercado.":
			"Yang paling lemah di tim intimu adalah {0} ({1}). Tandai sampai {2} di RANKING dan mereka akan dilihat saat bursa tutup.",
		"Ventana abierta: {0} {1} por delante. En cada una el club decide, y un objetivo vivo puede caerse solo.":
			"Bursa buka: {0} {1} lagi. Klub memutuskan di tiap pekan, dan target yang masih ada bisa gugur sendiri.",
		"Mercado cerrado. La próxima ventana dura {0} {1}: lo que marques ahora espera a que abra.":
			"Bursa tutup. Bursa berikutnya berlangsung {0} {1}: yang kamu tandai sekarang menunggu sampai dibuka.",
		"{0} de {1} esta temporada. Toca uno para quitarlo.":
			"{0} dari {1} musim ini. Ketuk satu untuk melepasnya.",

		"RECOMENDAR AL CLUB ({0})":
			"REKOMENDASI KE KLUB ({0})",
		"QUITAR DE TU LISTA":
			"HAPUS DARI DAFTAR",
		"Señalado: interés {0}%, fichaje {1}%.":
			"Ditandai: minat {0}%, transfer {1}%.",
		"Tu once {0}": "Tim intimu {0}",
		"Rival en su puesto {0}": "Saingan di posisinya {0}",
		"Tu once {0} · rival en su puesto {1}": "Tim intimu {0} · saingan di posisinya {1}",
		"Brazalete +{0}": "Ban kapten +{0}",
		"Ojeo -{0}: no conoce tu liga": "Scouting -{0}: tak kenal ligamu",
		"Ojeo -{0}: {1} cesiones": "Scouting -{0}: {1} pinjaman",
		"Ojeo -{0}: no conoce tu liga, {1} cesiones": "Scouting -{0}: tak kenal ligamu, {1} pinjaman",
		"Viene de más arriba: precio +{0} %": "Datang dari klub lebih besar: harga +{0} %",

		"Tu pasado pesa: {0} temporadas en ligas grandes, {1} cesiones, {2} clubes": "Masa lalumu berpengaruh: {0} musim di liga besar, {1} pinjaman, {2} klub",
		"Trayectoria: precio +{0} % ({1} temporadas en ligas grandes)": "Riwayat: harga +{0} % ({1} musim di liga besar)",
		"Trotamundos: precio −{0} % ({1} cesiones, {2} clubes)": "Kutu loncat: harga −{0} % ({1} pinjaman, {2} klub)",

		"Jugaste aquí {0} temporadas: te dejan volver por un {1} % menos": "Kamu main di sini {0} musim: kamu boleh kembali dengan harga {1} % lebih murah",
		"Te dejan volver a casa por un {0} % menos": "Kamu boleh pulang dengan harga {0} % lebih murah",

		"REGRESA A CASA": "BALIK KANDANG",
		"VUELVE A CASA": "PULANG",
		"La grada no lo olvidó: {0} con esta camiseta. Desde hoy vuelve a entrenar contigo.": "Suporter tak melupakannya: {0} dengan jersey ini. Mulai hari ini dia berlatih lagi bersamamu.",
		"Jugó aquí {0} · traspaso -{1} %": "Pernah main di sini {0} · biaya -{1} %",
		"Jugó aquí {0}": "Pernah main di sini {0}",
		"VUELVE": "BALIK",
		"INTERES": "MINAT",
		"LO PEDISTE TU":
			"PILIHANMU",
		"TUS FICHAJES":
			"REKRUTANMU",
		"YA NO ESTA":
			"PERGI",
		"Tu ojo: {0} cerró el año con nota {1}":
			"Matamu jeli: {0} menutup tahun dengan rating {1}",
		"{0} no convenció al técnico":
			"{0} tak meyakinkan pelatih",
		"MARCAR EN EL RANKING ({0})":
			"TANDAI DI RANKING ({0})",
		"Ya has gastado tus recomendaciones de esta temporada. El año que viene vuelves a tener cinco.":
			"Rekomendasimu musim ini sudah habis. Tahun depan kamu dapat lima lagi.",
		"Ya gastaste tus {0} recomendaciones de esta temporada.":
			"Kamu sudah memakai {0} rekomendasimu musim ini.",
		"{0} de {1}. Toca uno para quitarlo.":
			"{0} dari {1}. Ketuk satu untuk melepasnya.",
		"Ya has señalado {0}. Quita a alguno primero.":
			"Kamu sudah menandai {0}. Lepas salah satu dulu.",
		"Le dices al técnico dónde quieres jugar.":
			"Kamu bilang ke pelatih di mana kamu mau main.",
		"Penales, faltas y córners para ti el resto de la temporada.":
			"Penalti, tendangan bebas dan tendangan sudut jadi milikmu sampai akhir musim.",
		"No pides permiso: avisas. Entras en la lista y llegan ofertas de verdad.":
			"Kamu tidak minta izin: kamu memberi kabar. Kamu masuk daftar dan tawaran sungguhan berdatangan.",



		"QUE LO FICHEN":
			"REKRUT DIA",
		"LO QUE PASO CON TUS OBJETIVOS":
			"NASIB TARGETMU",
		"FALLIDO":
			"GAGAL",
		"Marca hasta {0} jugadores en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"Tandai sampai {0} pemain di RANKING dan klub akan memutuskan tiap pekan bursa.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"Yang paling lemah di tim intimu adalah {0} ({1}). Tandai sampai {2} di RANKING dan klub akan memutuskan tiap pekan bursa.",
		"Ya lo intentaste esta temporada y se cayó. Podrás volver a señalarlo el año que viene.":
			"Kamu sudah mencobanya musim ini dan gagal. Kamu bisa menunjuknya lagi tahun depan.",
		"FICHARON A {0}":
			"{0} DIREKRUT",
		"SE CAYO {0}":
			"{0} GAGAL",
		"TU ONCE {0}": "INTIMU {0}",
		"No te mira: tu once está en {0} y él en {1}.":
			"Dia tak melirik: tim intimu di {0} dan dia di {1}.",
		"ALTAS Y BAJAS": "IN & OUT",
		"ALTA": "IN",
		"BAJA": "OUT",
		"SE CAYO SOLO": "GUGUR SENDIRI",
		"CERRO EL MERCADO": "BURSA TUTUP",
		"YA NO JUGABA AHI": "SUDAH PINDAH",
		"SE RETIRABA": "AKAN PENSIUN",
		"TE FUISTE DEL CLUB": "KAMU PERGI",
		"Ya no le quedan jornadas: se cae al cerrar.":
			"Pekannya habis: dia gugur saat bursa tutup.",
		"Está acabando su carrera: el club no ficha a quien se retira.":
			"Dia sedang mengakhiri kariernya: klub tak merekrut yang akan pensiun.",
		"Ya no juega ahí.": "Dia sudah tak main di sana.",
		"NO CABIA NADIE": "SKUAD PENUH",
		"Tu plantilla está llena y no hay a quien soltar: aunque el club diga que sí, no cabrá.":
			"Skuadmu penuh dan tak ada yang bisa dilepas: meski klub bilang ya, dia tak akan muat.",
		"El club está en apuro: solo entran los LIBRES.":
			"Klub sedang sulit: hanya PEMAIN BEBAS yang boleh masuk.",
		"SE LO LLEVO {0}": "DIAMBIL {0}",
		"Llegaron porque tú los señalaste":
			"Mereka datang karena kamu menunjuknya",
		"Fichajes que le pediste al club y el club hizo.":
			"Rekrutan yang kamu minta ke klub dan klub wujudkan.",
		"Un fichaje que le pediste al club y el club hizo.":
			"Satu rekrutan yang kamu minta ke klub dan klub wujudkan.",
		"CLAUSULAZO":
			"TEBUS KLAUSUL",
		"Mis outfits":
			"Outfitku",
		"Nombre del outfit":
			"Nama outfit",
		"Escribe un nombre para guardar tu outfit.":
			"Tulis nama untuk menyimpan outfitmu.",
		"Outfit guardado.":
			"Outfit disimpan.",
		"Outfit aplicado.":
			"Outfit dipakai.",
		"Outfit actualizado con tu ropa actual.":
			"Outfit diperbarui dengan pakaianmu sekarang.",
		"Outfit eliminado.":
			"Outfit dihapus.",
		"Guarda tu combinación actual y úsala con un toque.":
			"Simpan kombinasimu sekarang dan pakai lagi dengan satu ketukan.",
		"Guardar outfit":
			"Simpan outfit",
		"Playera gráfica":
			"Kaos grafis",
		"Jersey retro":
			"Jersey retro",
		"Polo tejido":
			"Polo rajut",
		"Camisa de lino":
			"Kemeja linen",
		"Cierre corto":
			"Quarter zip",
		"Polo rugby":
			"Polo rugby",
		"Sobrecamisa":
			"Overshirt",
		"Parka":
			"Parka",
		"Pants deportivos":
			"Celana training",
		"Pantalón de pinzas":
			"Celana lipit",
		"Jeans barril":
			"Jeans barrel",
		"Cargo técnico":
			"Celana cargo teknis",
		"Tenis retro":
			"Sneakers retro",
		"Tenis deportivos":
			"Sepatu lari",
		"Zapatos de charol":
			"Sepatu mengilap",
		"Tenis gruesos":
			"Sneakers chunky",
		"Cinturón de cuero":
			"Ikat pinggang kulit",
		"Hebilla metálica":
			"Gesper logam",
		"Pañuelo recto":
			"Lipatan lurus",
		"Pañuelo de pico":
			"Lipatan runcing",
		"Casual elegante":
			"Smart casual",
		"Corbata de moño":
			"Dasi kupu-kupu",
		"Corbata, moño o bufanda":
			"Dasi, dasi kupu-kupu atau syal",
		"Ya no juega ahí. Quítalo y señala a otro.":
			"Dia sudah tak main di sana. Lepas dan tunjuk yang lain.",
		"Está acabando su carrera. Quítalo y señala a otro.":
			"Dia sedang mengakhiri kariernya. Lepas dan tunjuk yang lain.",
		"Hoy no hay presupuesto. Si el club vende, vuelve a haberlo.":
			"Hari ini tak ada anggaran. Kalau klub menjual, anggarannya ada lagi.",


		"REFUERZO":
			"AMUNISI",
		"TE HICIERON CASO":
			"DITURUTI",
		"Lo señalaste tú y el club puso el dinero. Desde hoy entrena contigo.":
			"Kamu yang menunjuknya dan klub yang mengeluarkan uang. Mulai hari ini dia berlatih bersamamu.",
		"Te Hicieron Caso":
			"Dituruti",
		"El club fichó a alguien que TÚ le señalaste.":
			"Klub merekrut orang yang KAMU tunjuk.",
		"Que el club fiche a alguien que TÚ le hayas señalado.": "Buat klub merekrut orang yang KAMU tunjuk.",


		"FICHAJES DE VERANO": "TRANSFER M. PANAS",
		"Y {0} MÁS": "DAN {0} LAGI",

		"NUEVA YORK":
			"NEW YORK",
		"TU CARA EN NUEVA YORK":
			"WAJAHMU DI NEW YORK",
		"La marca compró la plaza entera. Todas las pantallas a la vez, y en todas tú.":
			"Merek itu membeli seluruh alun-alun. Semua layar sekaligus, dan di semuanya ada kamu.",
		"ÚLTIMA HORA":
			"BREAKING NEWS",
		"{0} FIRMA CON {1}":
			"{0} TEKEN DI {1}",
		"ALINEACIÓN":
			"LINE-UP",
		"PITADA":
			"EJEKAN",
		"TU GRADA TE PITA":
			"TRIBUN MENGEJEK",
		"Te silbaron al oír tu nombre. El partido de hoy es la respuesta.":
			"Mereka menyoraki begitu namamu disebut. Laga hari ini jawabannya.",
		"tardes malas":
			"hari buruk",
		"{0} veces con esta camiseta. El club te lo agradece antes del saque.":
			"{0} kali dengan jersey ini. Klub berterima kasih sebelum kick-off.",
		"asistencias":
			"assist",
		"OJEADOR":
			"SCOUT",
		"Llegó una hora antes y sólo miró a uno. Su oferta llega en la próxima ventana.":
			"Dia datang sejam lebih awal dan hanya menonton satu pemain. Tawarannya masuk di bursa transfer berikutnya.",
		"A SEGUIR":
			"PANTAU",
		"MURAL":
			"MURAL",
		"TU CARA EN EL BARRIO":
			"WAJAHMU DI TEMBOK",
		"Nadie te pidió permiso para pintarte. Mejor así.":
			"Tak ada yang minta izin untuk melukismu. Lebih baik begitu.",
		"ANUNCIO":
			"IKLAN",
		"TU CARA EN LA CIUDAD":
			"WAJAHMU DI KOTA",
		"FIJO POR PARTIDO":
			"TETAP PER LAGA",
		"Pasas por debajo y te ves en grande. Los que pasan, también.":
			"Kamu lewat di bawahnya dan melihat dirimu dalam ukuran raksasa. Orang yang lewat juga.",
		"LLEGADA":
			"TIBA",
		"LA COPA VUELVE A CASA":
			"PIALA PULANG",
		"Viajó en su propio asiento, con el cinturón puesto. Nadie la soltó en todo el vuelo.":
			"Piala itu terbang di kursinya sendiri, sabuk terpasang. Tak ada yang melepasnya sepanjang penerbangan.",

		"TOMA {0}": "TAKE {0}",
		"TOMA 7": "TAKE 7",
		"REC": "REC",
		"La séptima fue la buena. El cámara estaba con el celular.":
			"Take ketujuh yang jadi. Juru kameranya malah main ponsel.",


		"LA PANCARTA CON FALTA":
			"SPANDUK TYPO",
		"LA PANCARTA":
			"SPANDUK",
		"CASI":
			"HAMPIR",
		"ARREGLADA":
			"BERES",
		"la tela":
			"spanduk",
		"tu apellido":
			"namamu",
		"Una letra mal. La van a colgar igual todos los domingos.":
			"Satu huruf salah. Tetap saja mereka pasang tiap hari Minggu.",
		"Tardaron años, pero la arreglaron. Con cinta.":
			"Butuh bertahun-tahun, tapi akhirnya mereka perbaiki. Pakai selotip.",


		"LAS PALOMAS NO OLVIDAN":
			"MERPATI TAK LUPA",
		"Una paloma del larguero no volvió a casa. Las demás se acuerdan.":
			"Satu merpati dari mistar gawang tak pernah pulang. Yang lain ingat.",
		"Otra vez tú. Ellas llevan la cuenta.":
			"Kamu lagi. Mereka menghitungnya.",
		"SANCION": "SANKSI",
		"FAIR PLAY": "FAIR PLAY",
		"{0} arranca la liga con -{1} puntos por el fair play": "{0} mulai liga dengan -{1} poin karena fair play",
		"{0} incumple el fair play: si repite, perderá {1} puntos": "{0} melanggar fair play: jika terulang, akan kehilangan {1} poin",
		"CUENTAS DEL CLUB": "KAS KLUB",
		"SANAS": "SEHAT",
		"EN APURO": "TERJEPIT",
		"-{0} PTS": "-{0} PTS",
		"AVISO {0}/{1}": "AWAS {0}/{1}",
		"INGRESOS / AÑO": "PEMASUKAN/THN",
		"NOMINA / AÑO": "GAJI / THN",
		"RAYA ROJA": "BATAS",
		"Cerrar la temporada con la caja bajo la raya roja es un aviso. Dos seguidas: la liga siguiente empieza con -{0} puntos.": "Menutup musim dengan kas di bawah batas adalah peringatan. Dua kali berturut-turut: liga berikutnya dimulai dengan -{0} poin.",
		"-{0} por fair play": "-{0} karena fair play",
		"SANCION DE FAIR PLAY": "SANKSI FAIR PLAY",
		"-{0} PTS EN LA LIGA": "-{0} POIN DI LIGA",
		"AVISO DE FAIR PLAY": "AWAS FAIR PLAY",
		"SI REPITE: -{0} PTS": "ULANG: -{0} POIN",
		"EL CLUB CAMBIA DE DUEÑO": "KLUB GANTI PEMILIK",
		"DINERO DE FUERA": "UANG BARU",
		"LOS INGRESOS SE DISPARAN": "PENDAPATAN MELONJAK",
		"TEMPORADAS DE PROYECTO": "MUSIM PROYEK",
		"ingreso de antes": "pendapatan lama",
		"ingreso ahora": "pendapatan kini",
		"la caja": "kas",
		"Compra el club y trae dinero de fuera: habrá más presupuesto en GERENCIA, y el club va a fichar, también en tu puesto.": "Ia membeli klub dan membawa uang dari luar: anggaran di MANAJEMEN bertambah, dan klub akan merekrut, juga di posisimu.",
		"EL CLUB ENTRA EN CRISIS": "KLUB MASUK KRISIS",
		"LA CAJA EN ROJO": "KAS DEFISIT",
		"PUNTOS EN JUEGO": "POIN TERANCAM",
		"la raya roja": "batas",
		"ingreso": "pendapatan",
		"DUEÑO NUEVO": "BOS BARU",
		"EN CRISIS": "KRISIS",
		"TOCA VENDER": "HARUS JUAL",
		"Te sientan en el vestuario con el director deportivo. {0} está en crisis: si la caja sigue bajo la raya roja al cierre, la liga le quita {1} puntos. Eres lo que más vale del vestuario, y tu traspaso es el dinero que falta.": "Kamu didudukkan di ruang ganti bersama direktur olahraga. {0} sedang krisis: jika kas masih di bawah batas saat musim ditutup, liga memotong {1} poin. Kamu yang paling berharga di ruang ganti, dan transfermu adalah uang yang kurang.",
		"EL CLUB NO PAGA": "KLUB TAK BAYAR",
		"Te sientan en el vestuario con el director deportivo. {0} no tiene con qué pagarte: llevas {1} partidos sin cobrar y te deben ${2}. Si aguantas, cobras cuando llegue el dinero. Si pides la carta, en verano eres libre.": "Kamu didudukkan di ruang ganti bersama direktur olahraga. {0} tidak punya uang untuk membayarmu: sudah {1} laga tanpa gaji dan kamu dihutangi ${2}. Kalau bertahan, kamu dibayar saat uangnya datang. Kalau minta surat bebas, musim panas nanti kamu bebas.",
		"AGUANTO": "TETAP",
		"PIDO LA CARTA": "MINTA BEBAS",
		"IMPAGO DEL CLUB": "TUNGGAKAN KLUB",
		"Lo que te debía el club": "Yang dulu dihutang klub padamu",
		"El dueño nuevo te paga lo que te debía el club: ${0}": "Pemilik baru membayarmu apa yang dulu dihutang klub: ${0}",
		"El club te paga la mitad de lo que te debía: ${0} de ${1}": "Klub membayarmu separuh dari hutangnya: ${0} dari ${1}",
		"EL CLUB TE DEBE": "KLUB UTANG",
		"TE DEBE": "UTANG",
		"caja": "kas",
		"MULTA POR LA ROJA": "DENDA KARTU MERAH",
		"MULTA DEL COMITÉ": "DENDA KOMITE",
		"multa {0}": "denda {0}",
		"Esta temporada pagaste ${0} en multas": "Musim ini kamu membayar ${0} untuk denda",
		"ELECCIONES EN EL CLUB": "PEMILU KLUB",
		"Hay elecciones en {0}. El candidato promete sanear la caja vendiéndote este verano y quiere saber de qué lado estás. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "Ada pemilu di {0}. Sang kandidat berjanji membenahi kas dengan menjualmu musim panas ini dan ingin tahu kamu berpihak ke mana. Fotomu menggeser suara; suporter ingat siapa yang memilih pihak yang kalah.",
		"Hay elecciones en {0}. El candidato promete dinero para fichar y quiere tu foto en su campaña. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "Ada pemilu di {0}. Sang kandidat berjanji memberi dana untuk belanja pemain dan ingin fotomu di kampanyenya. Fotomu menggeser suara; suporter ingat siapa yang memilih pihak yang kalah.",
		"CON EL PRESIDENTE": "DUKUNG PRESIDEN",
		"CON EL CANDIDATO": "DUKUNG KANDIDAT",
		"AL MARGEN": "NETRAL",
		"El presidente gana las elecciones y sigue": "Presiden menang pemilu dan tetap menjabat",
		"Gana el candidato: el presidente nuevo quiere venderte este verano": "Kandidat menang: presiden baru ingin menjualmu musim panas ini",
		"Gana el candidato: el presidente nuevo mete ${0} en la caja para fichar": "Kandidat menang: presiden baru menyuntik ${0} ke kas untuk belanja pemain",
		"PRESIDENTE": "PRESIDEN",
		"CANDIDATO": "CALON",
		"GANA EL CANDIDATO": "CALON MENANG",
		"SIGUE EL PRESIDENTE": "KETUA BERTAHAN",
		"LA GRADA TE APLAUDE": "PENONTON BERTEPUK",
		"LA GRADA TE PITA": "KAMU DISORAKI",
		"EL JEQUE SE VA": "SYEIKH PERGI",
		"El jeque deja el {0} y su nómina se queda: crisis": "Syeikh meninggalkan {0}, gajinya tetap: krisis",
		"El jeque se ha ido y su dinero con él, pero la nómina que firmó se queda. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "Syeikh sudah pergi bersama uangnya, tetapi gaji yang ia tanda tangani tetap tinggal. Musim panas ini klub harus menjual pemain, dan jika kas masih di bawah batas saat musim berakhir, liga mengurangi {0} poin.",
		"LA SALA DE JUNTAS": "RAPAT DEWAN",
		"Sin rodeos: no hay dinero. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "Terus terang: uang tidak ada. Musim panas ini klub harus menjual pemain, dan jika kas masih di bawah batas saat musim ditutup, liga memotong {0} poin.",
		"SIN EUROPA": "NO EROPA",
		"TEMPORADA SIN EUROPA": "MUSIM TANPA EROPA",
		"la plaza perdida": "tempat hilang",
		"puntos de sanción": "poin sanksi",
		"CONTROL FINANCIERO": "KONTROL KEUANGAN",
		"NO SE VENDE": "TAK DIJUAL",
		"EL ESTADIO SE VENDE": "STADION DIJUAL",
		"cobra el club": "klub dapat",
		"La crisis aprieta y el club vende el nombre del campo. La grada no lo perdona: este año entra menos gente y en el muro cuelga una pancarta.": "Krisis menekan dan klub menjual nama stadion. Tribun tidak memaafkannya: tahun ini penonton berkurang dan sebuah spanduk terpasang di tembok.",
		"El {0} vende el nombre de su estadio: ahora es el {1}": "{0} menjual nama stadionnya: kini bernama {1}",
		"VENDE EL ESTADIO": "JUAL STADION",
		"Sin rodeos: no hay dinero. Para tapar el agujero, el club vende el nombre del estadio, y aun así este verano tiene que vender.": "Terus terang: uang sudah tidak ada. Untuk menutup lubang, klub menjual nama stadion, dan musim panas ini tetap harus menjual pemain.",
		"CONCURSO": "PAILIT",
		"El {0} entra en concurso de acreedores: este verano no ficha": "{0} masuk kepailitan: tidak belanja pemain musim panas ini",
		"EL CONCURSO DE ACREEDORES": "KEPAILITAN",
		"CONCURSO DE ACREEDORES": "KEPAILITAN",
		"EN CONCURSO": "PAILIT",
		"LO LLEVA UN ADMINISTRADOR": "DIKELOLA KURATOR",
		"FICHAJES ESTE VERANO": "TRANSFER MUSIM PANAS",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Lo que se pueda vender, se vende.": "Klub tidak sanggup membayar utangnya dan seorang hakim menunjuk kurator sebagai pengendali. Sampai bursa transfer musim dingin tidak ada yang direkrut dan tidak ada kontrak yang diubah, termasuk kontrakmu. Apa pun yang bisa dijual, dijual.",
		"CONTRATOS CONGELADOS": "KONTRAK DIBEKUKAN",
		"Tu club está en concurso: hasta el mercado de invierno no se toca un contrato.": "Klubmu sedang pailit: tidak ada kontrak yang diubah sampai bursa transfer musim dingin.",
		"Tu club está en concurso: hasta el mercado de invierno no ficha a nadie.": "Klubmu sedang pailit: tidak merekrut siapa pun sampai bursa transfer musim dingin.",
		"EL ADMINISTRADOR TE VENDE": "KAMU DIJUAL",
		"El juez puso a un administrador al frente de {0} y te recibe en el despacho del presidente, con las cuentas sobre la mesa. En la lista de lo que se vende, tu nombre va el primero: o sales este verano, o te quedas cobrando menos.": "Hakim menunjuk seorang kurator untuk memimpin {0}, dan ia menerimamu di ruang presiden dengan laporan keuangan di atas meja. Di daftar yang dijual, namamu paling atas: kamu pergi musim panas ini, atau tetap dengan gaji lebih kecil.",
		"Tu club está en concurso y vas el primero de la lista. O sales este verano, o te quedas cobrando menos.": "Klubmu sedang dalam kepailitan dan kamu yang pertama di daftar. Kamu pergi musim panas ini, atau tetap dengan gaji lebih kecil.",
		"Cobras menos lo que reste de contrato y el administrador te saca de la lista. El vestuario y la grada lo ven.": "Gajimu berkurang selama sisa kontrak dan kurator mencoretmu dari daftar. Ruang ganti dan tribun melihatnya.",
		"LA REBAJA DEL VESTUARIO": "POTONG GAJI TIM",
		"El presidente baja al vestuario: {0} está en crisis y no llega a fin de mes. Pide a la plantilla un {1}% menos de ficha esta temporada, y quien firme cobra a tiempo. El capitán ya ha firmado; faltas tú.": "Presiden turun ke ruang ganti: {0} sedang krisis dan tidak sanggup bertahan sampai akhir bulan. Ia meminta skuad menerima gaji {1}% lebih rendah musim ini, dan yang menandatangani dibayar tepat waktu. Kapten sudah menandatangani; tinggal kamu.",
		"FIRMO: {0}/sem": "OKE: {0}/mgg",
		"NO FIRMO": "TOLAK",
		"LA ASAMBLEA DE SOCIOS": "RAPAT ANGGOTA",
		"El juez cerró el concurso y {0} es de sus socios: la asamblea votó la compra a mano alzada, un {1}% a favor. No hay dueño que ponga dinero, así que piden a la plantilla que entre con una acción. La grada mira a sus jugadores.": "Hakim menutup kasus kepailitan dan {0} kini dimiliki para anggotanya: rapat memilih pembelian dengan angkat tangan, {1}% setuju. Tidak ada pemilik yang menyuntik dana, jadi skuad diminta ikut dengan satu saham. Tribun menatap para pemainnya.",
		"COMPRO ACCIONES": "BELI SAHAM",
		"SÓLO VOTO": "SUARA",
		"SOCIOS": "WARGA",
		"Los socios compran el {0}: un {1}% vota sí en la asamblea": "Anggota membeli {0}: {1}% memilih setuju di rapat",
		"DE LOS SOCIOS": "MILIK ANGGOTA",
		"Los socios te pagan lo que te debía el club: ${0}": "Para anggota membayarmu apa yang dulu terutang klub: ${0}",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tienes acciones: tu voto arrastra a la grada.": "Tiga musim kemudian, seorang investor ingin membeli {0} dan rapat anggota memilihnya di akhir musim. Jajak pendapat menunjukkan {1}% mendukung penjualan. Kamu punya saham: suaramu menyeret tribun.",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tu voto es uno más, pero la grada escucha a sus jugadores.": "Tiga musim kemudian, seorang investor ingin membeli {0} dan rapat anggota memilihnya di akhir musim. Jajak pendapat menunjukkan {1}% mendukung penjualan. Suaramu hanya satu di antara banyak, tetapi tribun mendengarkan para pemainnya.",
		"LA ASAMBLEA VOTA LA VENTA": "RAPAT VOTING PENJUALAN",
		"VOTO VENDER": "VOTE JUAL",
		"VOTO SEGUIR": "VOTE TAHAN",
		"Los socios venden el {0} a un inversor: un {1}% vota sí": "Anggota menjual {0} ke investor: {1}% memilih ya",
		"Los socios del {0} no venden: un {1}% vota seguir": "Anggota {0} tidak menjual: {1}% memilih bertahan",
		"ASAMBLEA DE SOCIOS": "RAPAT ANGGOTA",
		"EL DUEÑO QUIERE TUS ACCIONES": "PEMILIK INGIN SAHAMMU",
		"No regatea: el dinero no es su problema.": "Ia tidak menawar: uang bukan masalah baginya.",
		"Sabe lo que vale cada parte y lo paga.": "Ia tahu nilai tiap bagian dan membayarnya.",
		"Su fondo regatea cada céntimo.": "Dananya menawar setiap sen.",
		"VENDO": "JUAL",
		"NO VENDO": "TAHAN",
		"EN EL DESPACHO": "DI KANTOR",
		"tus acciones": "sahammu",
		"{0} tiene dueño nuevo y lo quiere entero: te ofrece ${1} por la parte que compraste en la asamblea, que te costó ${2}.": "{0} punya pemilik baru dan ia menginginkan semuanya: ia menawarkan ${1} untuk bagian yang kamu beli di rapat anggota, yang harganya ${2}.",
		"HUELGA EN EL VESTUARIO": "MOGOK DI RUANG GANTI",
		"{0} lleva {1} partidos sin pagar a nadie y a ti te debe ${2}. El capitán os reúne antes de entrenar: nadie sale al campo hasta que el club pague. Si os plantáis todos, la directiva rasca la caja y paga ${3}. Si tú entrenas, la huelga se rompe.": "{0} sudah {1} pertandingan tidak membayar siapa pun dan berutang ${2} padamu. Kapten mengumpulkan kalian sebelum latihan: tak ada yang turun ke lapangan sampai klub membayar. Jika kalian semua bertahan, direksi mengais kas dan membayar ${3}. Jika kamu berlatih, mogoknya gagal.",
		"ME SUMO": "IKUT",
		"SALGO A ENTRENAR": "AKU LATIHAN",
		"El {0} entra en concurso y le embargan el estadio: jugará en el campo del {1}": "{0} dinyatakan pailit dan stadionnya disita: bermain di lapangan {1}",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Y el estadio queda embargado: esta temporada jugáis de local en {0}, el campo del {1}.": "Klub tidak sanggup membayar utangnya dan seorang hakim menunjuk kurator sebagai pengendali. Sampai bursa transfer musim dingin tidak ada yang direkrut dan tidak ada kontrak yang diubah, termasuk kontrakmu. Stadion disita: musim ini kalian bermain kandang di {0}, lapangan {1}.",
		"El {0} sale del concurso: pacta con sus acreedores y vuelve a fichar": "{0} keluar dari kepailitan: sepakat dengan kreditor, kembali boleh belanja pemain",
		"TE PEDIRÁN GOL Y PASE": "MINTA GOL DAN ASSIST",
		"En el partido: juegas arriba y pegado a tu banda, con más ángulo, contras y balones servidos.": "Di laga: kamu bermain di depan dan menempel di sayapmu, dengan lebih banyak sudut sempit, serangan balik dan bola kiriman.",
		"EL RESBALÓN": "TERPELESET",
		"ESTAMBUL": "ISTANBUL",
		"LA REMONTADA": "KEBANGKITAN",
		"EL 92:48": "92:48",
		"EL CÓRNER RÁPIDO": "POJOK KILAT",
		"LA FINAL EN SU CASA": "FINAL DI RUMAH",
		"LA NOCHE DE LONDRES": "MALAM LONDON",
		"EL PORTERO CABECEA": "KIPER SUNDUL",
		"LA FINAL EN MADRID": "FINAL DI MADRID",
		"SE RESBALÓ": "TERPELESET",
		"IBAN 3-0": "3-0 DULU",
		"NADIE MIRABA": "LENGAH",
		"NI UN PENAL": "NOL PENALTI",
		"FUE EL PORTERO": "GOL KIPER",
		"Juega con uno de los dos clubes contra el otro.": "Mainkan salah satu dari dua klub melawan yang lain.",
		"Falta una jornada para el derbi.": "Pekan depan: derbi.",
		"Faltan {0} jornadas para el derbi.": "{0} pekan lagi menuju derbi.",
		"Falta una jornada para la fecha de selecciones.": "Satu pekan lagi jeda internasional.",
		"Faltan {0} jornadas para la fecha de selecciones.": "{0} pekan lagi jeda internasional.",
		"Te juegas el ascenso": "Penentu promosi",
		"Te juegas la salvación": "Penentu bertahan",
		"Te juegas el título": "Penentu gelar",
		"Te espera el derbi": "Derbi menantimu",
		"Derbi ante {0}": "Derbi melawan {0}",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que bote.": "Bola diberikan ke dadamu: kamu kontrol lalu voli sebelum memantul.",
		"Stick izquierdo para correr; pulsa {0} para barrerte": "Stik kiri untuk lari; tekan {0} untuk tekel",
		"Ponte entre el balón y tu portería para robar, o pulsa {0} para barrerte. Al recuperar, sigue con WASD y ataca.": "Masuk di antara bola dan gawangmu untuk merebutnya, atau tekan {0} untuk tekel. Setelah dapat, terus dengan WASD dan serang.",
		"WASD para correr; pulsa {0} para barrerte": "WASD untuk lari; tekan {0} untuk tekel",
		"TU TITULAR LLEGÓ A SU VESTUARIO": "UCAPANMU DIBACA RUANG GANTI",
		"TRES GOLES Y EL MICRO": "HAT-TRICK & MIKROFON",
		"Hat-trick y el balón bajo el brazo. La cadena te para con él todavía en la mano y quiere oírtelo decir en directo.": "Hat-trick dengan bola di bawah lengan. Stasiun TV menghentikanmu saat bola masih di tangan dan ingin mendengarmu bicara langsung.",
		"EL GOL DEL FINAL": "GOL TERAKHIR",
		"Tu gol en el último suspiro decidió el partido. La cadena te para con el estadio aún temblando y quiere la frase de la noche.": "Golmu di detik terakhir menentukan pertandingan. Stasiun TV menghentikanmu saat stadion masih bergetar dan ingin kata-kata malam ini.",
		"EL PENAL FALLADO": "PENALTI GAGAL",
		"Fallaste un penal y la sala de prensa sólo quiere hablar de eso. Hay cámaras, hay micro y una pregunta esperándote.": "Kamu gagal mengeksekusi penalti dan ruang pers hanya ingin membahas itu. Ada kamera, mikrofon, dan satu pertanyaan yang menunggumu.",
		"ASUMIRLO": "AKUI",
		"EL PRÓXIMO LO METO": "BERIKUTNYA MASUK",
		"PENAL FALLADO": "PENALTI GAGAL",
		"Un penal fallado pesa más que tres metidos. Lo que digas ahora es lo que se lee mañana.": "Satu penalti gagal lebih berat daripada tiga yang masuk. Apa yang kamu katakan sekarang adalah yang dibaca besok.",
		"RUEDA DE PRENSA": "KONFERENSI PERS",
		"· te buscarán": "· mereka akan mengincarmu",
		"Colgaste las botas y volviste. Esa puerta sólo se abre una vez: la próxima despedida es la última.": "Kamu sudah gantung sepatu lalu kembali. Pintu itu hanya terbuka sekali: perpisahan berikutnya adalah yang terakhir.",
		"Se viene contigo.": "Dia ikut denganmu.",
		"No se viene. Os toca la distancia.": "Dia tidak ikut. Kalian harus LDR.",
		"¿SE VIENE CONTIGO?": "DIA IKUT?",
		"El contrato nuevo está encima de la mesa de la cocina, y es en otro país. {0} lo ha leído dos veces sin decir nada. Su vida está aquí.": "Kontrak baru ada di meja dapur, dan itu di negara lain. {0} membacanya dua kali tanpa berkata apa-apa. Hidupnya ada di sini.",
		"PEDIRLE QUE VENGA": "AJAK DIA",
		"QUE SE QUEDE": "BIARKAN",
		"LA CLÍNICA": "KLINIK",
		"{0} se ha enterado por la tele antes que por ti. Está en la puerta de la clínica con una bolsa de ropa tuya y cara de no pensar irse.": "{0} tahu dari TV sebelum tahu darimu. Dia berdiri di pintu klinik membawa tas berisi bajumu, dengan wajah yang tak berniat pergi.",
		"DEJAR QUE TE CUIDE": "BIARKAN",
		"PEDIRLE ESPACIO": "BUTUH RUANG",
		"Ser el máximo goleador de las ligas de Europa.": "Jadi pencetak gol terbanyak liga-liga Eropa.",
		"El pase del Mundial": "Umpan Kejuaraan Dunia",
		"Ser el máximo asistente del Mundial con tu selección.": "Jadi raja assist Kejuaraan Dunia bersama timnasmu.",
		"Centenario Internacional": "Seratus Laga Internasional",
		"Jugar 100 partidos con tu selección.": "Mainkan 100 laga bersama timnasmu.",
		"FOTO OFICIAL": "FOTO RESMI",
		"LA FOTO OFICIAL": "FOTO RESMI TIM",
		"La plantilla de este año ya tiene su foto. Colgará en la sede toda la temporada.": "Skuad tahun ini sudah punya fotonya. Foto itu akan terpajang di markas klub sepanjang musim.",
		"FIRMA EL CONTRATO": "TEKEN KONTRAK",
		"Tu firma queda guardada: será la de tus autógrafos.": "Tanda tanganmu tersimpan: itulah yang dipakai untuk autografmu.",
		"RENOVACIÓN DE CONTRATO": "PERPANJANGAN KONTRAK",
		"CONTRATO DE JUGADOR": "KONTRAK PEMAIN",
		"FIRMA DEL JUGADOR": "TANDA TANGAN",
		"TU CAMISETA A LA GRADA": "JERSEY KE TRIBUN",
		"Arrastra hacia atrás y suelta": "Tarik ke belakang lalu lepas",
		"Más fuerte": "Lebih kuat",
		"El niño del cartel se lleva tu camiseta.": "Anak dengan papan itu membawa pulang kausmu.",
		"Iba para el niño, pero se la quedó el de al lado.": "Untuk si anak, tapi orang di sebelahnya yang menangkap.",
		"La atrapó el de al lado del niño.": "Orang di sebelah anak itu menangkapnya.",
		"La atrapó uno del muro.": "Seseorang di tembok menangkapnya.",
		"Se la llevó la grada de arriba.": "Tribun atas yang mendapatkannya.",
		"Se quedó corta.": "Kurang jauh.",
		"LA PIZARRA DEL MÍSTER": "PAPAN PELATIH",
		"Dibuja tu jugada": "Gambar rancangan mainmu",
		"LE GUSTÓ": "SUKA",
		"A SU MANERA": "CARANYA",
		"El míster deja tu jugada en la pizarra.": "Pelatih membiarkan rancanganmu di papan.",
		"El míster borra tus flechas y dibuja las suyas.": "Pelatih menghapus panahmu dan menggambar miliknya.",
		"PASEO DE LEYENDAS": "JALAN LEGENDA",
		"TU HUELLA": "JEJAKMU",
		"DEJA TU HUELLA": "BERI JEJAK",
		"Mantén el dedo en el cemento": "Tahan jarimu di semen",
		"Mantén {0} en el cemento": "Tahan {0} di semen",
		"Bien honda: ahí se queda para siempre.": "Dalam sekali: tetap di sana selamanya.",
		"La plaza ya tiene tu mano.": "Alun-alun kini punya cetak tanganmu.",
		"Apenas se marca: el cemento ya estaba duro.": "Nyaris tak berbekas: semennya sudah keras.",
		"¡JUNTITOS, TODOS MIRANDO A LA CÁMARA!": "MERAPAT, SEMUA LIHAT KE KAMERA!",
		"¡A LA CUENTA DE TRES!": "PADA HITUNGAN KETIGA!",
		"Primera ronda": "Babak 1",
		"Segunda ronda": "Babak 2",
		"Tercera ronda": "Babak 3",
		"Cuarta ronda": "Babak 4",
		"Quinta ronda": "Babak 5",
		"Sexta ronda": "Babak 6",
		"Séptima ronda": "Babak 7",
		"Octava ronda": "Babak 8",
		"Treintaidosavos": "64 besar",
		"32avos": "R64",
		"1.ª ronda": "Babak 1",
		"2.ª ronda": "Babak 2",
		"3.ª ronda": "Babak 3",
		"4.ª ronda": "Babak 4",
		"5.ª ronda": "Babak 5",
		"6.ª ronda": "Babak 6",
		"7.ª ronda": "Babak 7",
		"8.ª ronda": "Babak 8",
		"¡FESTEJO DESBLOQUEADO!": "SELEBRASI TERBUKA!",
		"LA OCARINA": "OKARINA",
		"Te pones el gorro verde, te salen orejas de duende y tocas la ocarina. Lo estrenas en tu próximo gol.": "Kamu memakai topi hijau, telingamu jadi runcing seperti peri, dan meniup okarina. Debutnya di golmu berikutnya.",
		"Se gana en el piano de casa, tocando de oído una canción de la ocarina: te pones el gorro verde, te salen orejas de duende y la tocas. Uno de cada once goles.": "Didapat di piano rumah, dengan memainkan lagu okarina tanpa partitur: kamu memakai topi hijau, telingamu jadi runcing seperti peri, lalu meniupnya. Satu dari setiap sebelas gol.",
		"¡SEXTETE!": "ENAM GELAR!",
		"¡SEPTETE!": "TUJUH GELAR!",
		"¡OCTETE!": "DELAPAN GELAR!",
		"Esto ya no es una temporada: es la historia del club.": "Ini bukan lagi sekadar musim: ini sejarah klub.",
		"SUS PADRES, EL DOMINGO": "ORTUNYA, MINGGU",
		"Los padres de {0} vienen a comer el domingo, como cada mes. Tu agente te ha cerrado una sesión de fotos a la misma hora.": "Orang tua {0} datang makan siang hari Minggu, seperti tiap bulan. Agenmu sudah menjadwalkan sesi foto di jam yang sama.",
		"PONER LA MESA": "TATA MEJA",
		"LA SESIÓN DE FOTOS": "SESI FOTO",
		"LAS FIESTAS DE SU PUEBLO": "PESTA DESANYA",
		"{0} quiere llevarte a las fiestas de su pueblo. Medio pueblo sabe ya que vas, y el otro medio lo sabrá en cuanto aparques.": "{0} ingin mengajakmu ke pesta desanya. Separuh desa sudah tahu kamu datang, dan separuhnya lagi akan tahu begitu kamu parkir.",
		"IR AL PUEBLO": "KE DESA",
		"ESTE AÑO NO": "LEWATKAN",
		"SU CUMPLEAÑOS, EN UNA ISLA": "ULTAHNYA DI PULAU",
		"{0} celebra su cumpleaños en una isla: avión fletado, cuarenta amigos y tres noches. Tú entrenas el viernes.": "{0} merayakan ulang tahun di sebuah pulau: pesawat carter, empat puluh teman, tiga malam. Kamu latihan hari Jumat.",
		"IR Y VOLVER EN EL DÍA": "PULANG-PERGI HARI ITU",
		"LLAMARLA A MEDIANOCHE": "TELEPON TENGAH MALAM",
		"LA FOTO DE LAS CINCO": "FOTO JAM LIMA",
		"Sale una foto de {0} a las cinco de la mañana en una discoteca, la víspera de tu partido. Tú dormías en casa; en las redes nadie lo cree.": "Muncul foto {0} pukul lima pagi di sebuah klub malam, sehari sebelum pertandinganmu. Kamu tidur di rumah; di media sosial tak ada yang percaya.",
		"DEFENDERLA EN PÚBLICO": "BELA DIA DI PUBLIK",
		"PEDIRLE QUE BAJE EL RITMO": "MINTA DIA MELAMBAT",
		"LA MESA DEL PRESIDENTE": "MEJA PRESIDEN",
		"{0} ha conseguido sentarte en la mesa del presidente en la cena del club. No te lo ha consultado: te ha dicho a qué hora pasa el coche.": "{0} berhasil mendudukkanmu di meja presiden pada makan malam klub. Dia tak bertanya dulu: dia hanya bilang jam berapa mobilnya datang.",
		"IR Y SONREÍR": "TERSENYUM",
		"NO ME MUEVAS LOS HILOS": "JANGAN ATUR AKU",
		"SU MARCA, TU CARA": "MEREKNYA, WAJAHMU",
		"{0} lanza su propia línea de ropa y quiere que la presentes tú. Dice que es un negocio de los dos; el contrato lo firma ella.": "{0} meluncurkan lini pakaiannya sendiri dan ingin kamu yang memperkenalkannya. Katanya ini bisnis berdua; tapi yang menandatangani kontrak dia.",
		"PRESENTARLA": "PERKENALKAN",
		"MI CARA NO SE PRESTA": "WAJAHKU TAK DISEWA",
		"EL MENSAJE DE LAS TRES": "PESAN JAM TIGA",
		"A las tres de la mañana se ha encendido tu teléfono: una periodista, por un reportaje. {0} ha visto la pantalla y ya no se ha vuelto a dormir.": "Pukul tiga pagi ponselmu menyala: seorang jurnalis, soal sebuah liputan. {0} melihat layarnya dan tak bisa tidur lagi.",
		"ENSEÑARLE EL TELÉFONO": "TUNJUKKAN PONSEL",
		"ES MI TRABAJO": "INI KERJAAN",
		"LA FISIO NUEVA": "FISIO BARU",
		"El club ha fichado una fisioterapeuta y {0} ya sabe cómo se llama. Pregunta, como quien no quiere la cosa, a qué hora te toca.": "Klub merekrut seorang fisioterapis dan {0} sudah tahu namanya. Dia bertanya, seolah tak sengaja, jam berapa gilirannya kamu.",
		"CAMBIAR DE TURNO": "TUKAR SHIFT",
		"ES MI FISIO": "DIA FISIOKU",
		"SU INAUGURACIÓN": "PEMBUKAANNYA",
		"{0} inaugura su primera exposición el sábado, y el sábado juegas en la otra punta del país. No te ha pedido que vayas.": "{0} membuka pameran pertamanya hari Sabtu, dan hari Sabtu kamu bermain di ujung lain negeri. Dia tidak memintamu datang.",
		"LLEGAR AUNQUE SEA AL FINAL": "TIBA WALAU DI AKHIR",
		"MANDARLE FLORES": "KIRIM BUNGA",
		"TE HA DICHO QUE NO": "DIA BILANG TIDAK",
		"Le pediste a {0} que viniera a la gala del club. Tiene un plan con sus amigas desde hace meses, y te ha dicho que no sin ningún drama.": "Kamu mengajak {0} ke gala klub. Dia sudah berbulan-bulan punya rencana dengan teman-temannya, dan dia bilang tidak tanpa drama sedikit pun.",
		"IR SOLO Y CONTÁRSELO": "PERGI SENDIRI",
		"PEDIRLE QUE LO CAMBIE": "MINTA DIA UBAH",
		"MADRINA DE LA PEÑA": "DUTA FAN KLUB",
		"La peña del barrio quiere a {0} de madrina en su aniversario. Ella ya ha dicho que sí, y a ti te esperan para firmar camisetas.": "Fan klub lingkungan ingin {0} jadi duta di hari jadinya. Dia sudah bilang ya, dan kamu ditunggu untuk menandatangani jersey.",
		"IR CON ELLA": "BERSAMA DIA",
		"QUE VAYA ELLA": "BIAR DIA SAJA",
		"TE LO DIJO EN EL COCHE": "DIA BILANG DI MOBIL",
		"Jugaste mal y {0} te lo ha dicho en el coche, con datos y sin anestesia. Sabe de qué habla: lleva veinte años en la grada.": "Kamu bermain buruk dan {0} mengatakannya di mobil, dengan data dan tanpa bius. Dia tahu apa yang dia bicarakan: sudah dua puluh tahun di tribun.",
		"HOY NO, POR FAVOR": "JANGAN HARI INI",
		"DIJISTE SU NOMBRE": "KAU SEBUT NAMANYA",
		"En una entrevista nombraste a {0}, de pasada y con cariño. Desde entonces le escriben desconocidos.": "Dalam sebuah wawancara kamu menyebut {0}, sambil lalu dan penuh sayang. Sejak itu, orang asing terus mengirim pesan padanya.",
		"PEDIRLE PERDÓN": "MINTA MAAF",
		"LO DIJE CON CARIÑO": "NIATNYA SAYANG",
		"UNA VALLA MÁS ALTA": "PAGAR LEBIH TINGGI",
		"{0} quiere una valla alta y cámaras en la entrada de tu casa. Los vecinos, que te saludan cada mañana, no lo van a entender.": "{0} ingin pagar tinggi dan kamera di pintu masuk rumahmu. Para tetangga, yang menyapamu tiap pagi, tak akan mengerti.",
		"PONER LA VALLA": "PASANG PAGAR",
		"AQUÍ NO HACE FALTA": "DI SINI TAK PERLU",
		"UNA CUENTA DE LOS DOS": "REKENING BERSAMA",
		"{0} ha encontrado un banco que os abre una cuenta conjunta con tarjeta de cristal. Dice que así no tiene que pedirte cada cosa.": "{0} menemukan bank yang membukakan rekening bersama dengan kartu kaca untuk kalian. Katanya begitu dia tak perlu meminta tiap hal padamu.",
		"ABRIRLA": "BUKA",
		"CADA UNO LA SUYA": "MASING-MASING",
		"EL ESCAPARATE": "ETALASE",
		"Paseabais y {0} se ha parado delante de un escaparate. No ha dicho nada. Al día siguiente ha vuelto a pasar por la misma calle.": "Kalian sedang berjalan dan {0} berhenti di depan sebuah etalase. Dia tak berkata apa-apa. Keesokan harinya dia melewati jalan yang sama lagi.",
		"SEGUIR ANDANDO": "TERUS JALAN",
		"SU EXAMEN": "UJIANNYA",
		"{0} tiene el lunes el examen más importante de su carrera. Lleva meses aguantando tus viajes; esta semana sólo te pide la casa en silencio.": "{0} punya ujian terpenting dalam kariernya hari Senin. Berbulan-bulan dia menahan perjalananmu; minggu ini dia hanya minta rumah yang tenang.",
		"DORMIR EN EL HOTEL DEL CLUB": "MENGINAP DI HOTEL",
		"LA CASA ES DE LOS DOS": "RUMAH KITA",
		"LA CENA DE FIN DE TEMPORADA": "MAKAN MALAM AKHIR MUSIM",
		"{0} se ha hecho amiga de medio vestuario, y ahora el capitán quiere hacer la cena de fin de temporada en tu casa.": "{0} berteman dengan separuh ruang ganti, dan kini kapten ingin mengadakan makan malam akhir musim di rumahmu.",
		"HACERLA EN CASA": "ADAKAN DI RUMAH",
		"MEJOR EN UN RESTAURANTE": "LEBIH BAIK DI RESTORAN",
		"SU AVIÓN": "JETNYA",
		"{0} te ofrece su avión para volver del partido de fuera, en vez del autobús del equipo. Llegarías a casa tres horas antes.": "{0} menawarkan pesawatnya untuk pulang dari laga tandang, bukan bus tim. Kamu akan tiba di rumah tiga jam lebih awal.",
		"EL AVIÓN": "PESAWAT",
		"EL AUTOBÚS": "BUS",
		"LA CENA CON SU PADRE": "MAKAN DENGAN AYAHNYA",
		"El padre de {0} te ha invitado a cenar. Tiene tres empresas y una sola pregunta: qué vas a hacer cuando dejes el fútbol.": "Ayah {0} mengundangmu makan malam. Dia punya tiga perusahaan dan satu pertanyaan saja: apa yang akan kamu lakukan setelah berhenti dari sepak bola?",
		"TENGO UN PLAN": "ADA RENCANA",
		"NO LO HE PENSADO": "BELUM KUPIKIRKAN",
		"LA LUNA DE MIEL": "BULAN MADU",
		"Os casasteis en plena temporada y la luna de miel sigue en un cajón. {0} ha encontrado diez días en tu calendario y ya ha mirado vuelos.": "Kalian menikah di tengah musim dan bulan madu masih tersimpan di laci. {0} menemukan sepuluh hari di kalendermu dan sudah melihat penerbangan.",
		"IROS LOS DIEZ DÍAS": "PERGI SEPULUH HARI",
		"EN VERANO, PROMETIDO": "MUSIM PANAS, JANJI",
		"NAVIDAD, ¿EN QUÉ CASA?": "NATAL, DI RUMAH SIAPA?",
		"Tu madre y {0} se tratan con una educación que da frío. Este año hay que elegir dónde se pasa la Navidad, y las dos esperan la misma respuesta.": "Ibumu dan {0} saling bersikap dengan kesopanan yang membuat dingin. Tahun ini harus dipilih di mana Natal dirayakan, dan keduanya menunggu jawaban yang sama.",
		"CON SU FAMILIA": "KELUARGANYA",
		"CON LA TUYA": "KELUARGAMU",
		"LA MESA DE LA PRIMERA CENA": "MEJA MAKAN PERTAMA",
		"Lleváis meses sin salir solos. {0} ha reservado el jueves en el restaurante de vuestra primera cena, sin preguntarte si tenías algo.": "Sudah berbulan-bulan kalian tak keluar berdua. {0} memesan hari Kamis di restoran makan malam pertama kalian, tanpa bertanya apakah kamu ada acara.",
		"IR EL JUEVES": "KAMIS",
		"CAMBIARLO DE DÍA": "GANTI HARI",
		"LAS FOTOS DE LA BODA": "FOTO PERNIKAHAN",
		"Una revista ofrece una fortuna por las fotos de vuestra boda, que nunca enseñasteis a nadie. {0} dice que decidas tú.": "Sebuah majalah menawarkan uang besar untuk foto pernikahan kalian, yang tak pernah kalian tunjukkan pada siapa pun. {0} bilang kamu yang putuskan.",
		"VENDERLAS": "JUAL",
		"SON NUESTRAS": "MILIK KITA",
		"¿CUÁNTOS AÑOS MÁS?": "BERAPA TAHUN LAGI?",
		"{0} te ha preguntado, por primera vez, cuántos años más piensas jugar. No era un reproche: quería saber cuándo empezáis a vivir.": "{0} bertanya padamu, untuk pertama kalinya, berapa tahun lagi kamu berencana bermain. Itu bukan celaan: dia ingin tahu kapan kalian mulai hidup.",
		"LOS QUE AGUANTEN LAS PIERNAS": "SELAMA KAKI KUAT",
		"COMPRA": "BELI",
		"Empezáis a salir, {0} y tú. Si no es lo tuyo, se deja en RELACIONES y no cuesta nada.": "Kamu dan {0} mulai pacaran. Kalau bukan untukmu, akhiri di RELASI, dan tidak ada biayanya.",
		"Va a vibrar tres veces. Guarda el teléfono y escucha lo que te cuenta.": "Akan bergetar tiga kali. Simpan ponselnya dan dengarkan ceritanya.",
		"En la próxima cita te lo preguntará:": "Di kencan berikutnya dia akan menanyakannya:",
		"Lo que te contó en la cena · {0} de {1}": "Yang dia ceritakan saat makan malam · {0} dari {1}",
		"Pulsa con la línea dentro de la franja · {0} de {1}": "Ketuk saat garis ada di dalam pita · {0} dari {1}",
		"Alguien te pregunta a qué te dedicas. Contesta sin presumir.": "Seseorang bertanya apa pekerjaanmu. Jawab tanpa pamer.",
		"EL ROBOT": "ROBOT",
		"Baile suelto: codos en ángulo recto y la cabeza girando a tirones, como una máquina. Pide sitio a la vista.": "Tarian bebas: siku bersudut siku-siku dan kepala menoleh patah-patah, seperti mesin. Butuh ruang yang terlihat.",
		"Tienes pareja: meces un bebé invisible en los brazos, para quien te espera en casa.": "Kamu punya pasangan: kamu menimang bayi tak kasatmata di lengan, untuk yang menunggumu di rumah.",
		"LA LLAMADA": "TELEPON",
		"Hay clubes preguntando por ti: te llevas la mano a la oreja como un teléfono. Que llame tu agente.": "Ada klub yang menanyakanmu: kamu menempelkan tangan ke telinga seperti telepon. Suruh agenmu menelepon.",
		"EL SURF": "SURFING",
		"Baile suelto: te tiras de panza y te deslizas por el césped con los brazos abiertos.": "Tarian bebas: kamu menjatuhkan diri tengkurap dan meluncur di rumput dengan tangan terentang.",
		"LOS BOLOS": "BOWLING",
		"Baile suelto: zancada baja y lanzas una bola invisible de bolos rasa por el césped.": "Tarian bebas: langkah rendah dan kamu melempar bola bowling tak kasatmata menyusuri rumput.",
		"EL ABRAZO": "PELUKAN",
		"Baile suelto: abres los brazos y le das un abrazo enorme a la grada.": "Tarian bebas: kamu membuka tangan dan memberi pelukan besar kepada tribun.",
		"LA CUMBIA": "CUMBIA",
		"Baile suelto: pasito a un lado y al otro, cadera y brazos al ritmo.": "Tarian bebas: langkah kecil ke satu sisi lalu sisi lain, pinggul dan tangan mengikuti irama.",
		"EL RUGIDO": "AUMAN",
		"Un golazo: te agachas, sacas las garras y ruges como un león.": "Gol indah: kamu berjongkok, mengeluarkan cakar, dan mengaum seperti singa.",
		"EL BEBE": "BAYI",
		"Tener un amigo que juega en otro tipo de teléfono.": "Punya teman yang main di jenis ponsel lain.",
		"Cuatro Goles": "Empat Gol",
		"Partidos de 4 goles o más": "Laga dengan 4 gol atau lebih",
		"DUELO DE CONSOLA": "DUEL KONSOL",
		"El portero te reta a penaltis al acabar el entreno y medio vestuario se queda a mirar y a picarse.": "Kiper menantangmu adu penalti seusai latihan dan separuh ruang ganti tinggal untuk menonton dan memanas-manasi.",
		"El comité europeo deja al {0} sin Europa una temporada": "Komite Eropa larang {0} tampil di Eropa selama semusim",
		"El comité europeo investiga el dinero del jeque del {0}": "Komite Eropa menyelidiki uang sang syekh di {0}",
		"EUROPA DICTA SENTENCIA": "VONIS EROPA",
		"FALLO EUROPEO": "PUTUSAN EROPA",
		"EL FALLO EUROPEO": "PUTUSAN EROPA",
		"El comité europeo ha investigado los patrocinios del jeque y los da por inflados: el club no jugará en Europa la temporada que viene. En la liga no pierde ni un punto.": "Komite Eropa telah menyelidiki sponsor sang syekh dan menilainya digelembungkan: klub tidak akan tampil di Eropa musim depan. Di liga, klub tidak kehilangan satu poin pun.",
		"· tienes que marcar": "· kamu harus mencetak gol",
		"ASÍ VA EL CHICO DE ORO": "BURU ANAK EMAS",
		"El mejor de {0} años o menos, con el mismo baremo que el Jugador del Año.": "Terbaik usia {0} tahun ke bawah, dinilai seperti Pemain Terbaik.",
		"LA PROMESA DEL AÑO": "BINTANG MUDA TAHUN INI",
		"LA PROMESA DEL AÑO · {0}": "BINTANG MUDA TAHUN INI · {0}",
		"TU PRIMER CHICO DE ORO": "ANAK EMAS PERTAMAMU",
		"TU CHICO DE ORO Nº {0}": "ANAK EMAS KE-{0}",
		"LA GALA DEL CHICO DE ORO": "GALA ANAK EMAS",
		"¿QUIÉN ES TU ÍDOLO?": "SIAPA IDOLAMU?",
		"ELEGIR A TU ÍDOLO": "PILIH IDOLAMU",
		"Primer premio en primera. Y la pregunta que te van a hacer toda la carrera.": "Penghargaan pertama di divisi utama. Dan pertanyaan yang akan terus ditanyakan sepanjang kariermu.",
		"MANTÉN PULSADO PARA ELEGIRLO: NO PODRÁS CAMBIARLO": "TAHAN UNTUK MEMILIH: TAK BISA DIUBAH",
		"LA TERTULIA": "DISKUSI",
		"EL DEBATE": "DEBAT",
		"TE ADORAN": "DIPUJA",
		"TE CRITICAN": "DIKRITIK",
		"OPINIONES DIVIDIDAS": "PENDAPAT TERBELAH",
		"A FAVOR": "SETUJU",
		"EN CONTRA": "TOLAK",
		"CON DUDAS": "RAGU",
		"¿ES PARA PRIMERA?": "LAYAK DI LIGA 1?",
		"¿YA ES UN CRACK?": "SUDAH JAGOAN?",
		"¿CUMPLE O NO CUMPLE?": "BERHASIL ATAU TIDAK?",
		"En la tele ya hablan de ti como de los buenos.": "Di TV kamu sudah dibicarakan sebagai salah satu yang terbaik.",
		"En la tele piden más. En el campo se contesta.": "Di TV mereka minta lebih. Di lapangan, kamu menjawab.",
		"En la tele no terminan de decidirse contigo.": "Di TV mereka belum bisa memutuskan soal dirimu.",
		"EL EXJUGADOR": "EKS PEMAIN",
		"LA PERIODISTA": "SANG WARTAWAN",
		"EL CRÍTICO": "KRITIKUS",
		"Una media de {0}. Eso en Primera no lo firma cualquiera.": "Rata-rata {0}. Di divisi utama tidak semua orang bisa begitu.",
		"Cada jornada, de lo mejor del campo: {0} de media.": "Tiap pekan salah satu yang terbaik di lapangan: rata-rata {0}.",
		"Un {0} de media. Cumple, pero de él se espera más.": "Rata-rata {0}. Cukup, tapi dari dia diharapkan lebih.",
		"{0} de nota. Ni para tirar cohetes ni para preocuparse.": "Nilai {0}. Tidak perlu dirayakan, tidak perlu dikhawatirkan.",
		"Un {0} de media es muy poco para Primera.": "Rata-rata {0} terlalu rendah untuk divisi utama.",
		"Con {0} de nota, yo me lo pensaría para el once.": "Dengan nilai {0}, saya akan pikir dua kali untuk memasukkannya ke susunan utama.",
		"Goles: {0}. Asistencias: {1}. Está decidiendo partidos.": "Gol: {0}. Assist: {1}. Dia menentukan hasil pertandingan.",
		"Los números hablan solos. Goles: {0}. Asistencias: {1}.": "Angkanya berbicara sendiri. Gol: {0}. Assist: {1}.",
		"Goles: {0}. Asistencias: {1}. Correcto, sin más.": "Gol: {0}. Assist: {1}. Lumayan, tidak lebih.",
		"Goles: {0}. Asistencias: {1}. Aporta, pero no basta.": "Gol: {0}. Assist: {1}. Dia berkontribusi, tapi belum cukup.",
		"Goles: {0}. Asistencias: {1}. En toda la temporada. Así no.": "Gol: {0}. Assist: {1}. Sepanjang musim. Begini tidak bisa.",
		"Goles: {0}. Asistencias: {1}. No aparece: hay que exigirle.": "Gol: {0}. Assist: {1}. Dia tak muncul: harus dituntut lebih.",
		"{0} de {1} partidos. El técnico no lo saca del once.": "{0} dari {1} laga. Pelatih tidak mencoretnya dari susunan utama.",
		"Es fijo: {0} partidos de {1}. Eso es confianza.": "Dia pemain tetap: {0} laga dari {1}. Itu kepercayaan.",
		"{0} partidos de {1}. Todavía no es indiscutible.": "{0} laga dari {1}. Belum tak tergantikan.",
		"Entra y sale: {0} de {1}. Tiene que ganarse el sitio.": "Keluar masuk: {0} dari {1}. Dia harus merebut tempatnya.",
		"Sólo {0} de {1} partidos. Ni su técnico confía en él.": "Hanya {0} dari {1} laga. Pelatihnya sendiri tidak percaya padanya.",
		"{0} partidos de {1}. Así es imposible que crezca.": "{0} laga dari {1}. Dengan begini mustahil dia berkembang.",
		"El equipo va en el puesto {0} y él tiene mucho que ver.": "Tim ada di posisi {0} dan dia punya andil besar.",
		"Puesto {0} en la tabla. Cuando el equipo gana, todos brillan.": "Posisi {0} di klasemen. Saat tim menang, semua bersinar.",
		"El equipo va en el puesto {0}, en tierra de nadie. Y él, igual.": "Tim ada di posisi {0}, di zona abu-abu. Dia pun sama.",
		"Puesto {0}. Una temporada gris para todos.": "Posisi {0}. Musim yang kelabu bagi semua.",
		"El equipo va en el puesto {0} y él no ayuda a salir de ahí.": "Tim ada di posisi {0} dan dia tidak membantu keluar dari sana.",
		"Puesto {0} en la tabla. Alguien tiene que dar un paso al frente.": "Posisi {0} di klasemen. Seseorang harus maju.",
		"MANTÉN PARA SALTAR": "TAHAN UNTUK LEWATI",
		"TU ÍDOLO": "IDOLAMU",
		"A GANARSE EL PUESTO": "REBUT POSISI",
		"Ahora le toca al banquillo dar la cara.": "Sekarang giliran bangku cadangan unjuk gigi.",
		"Ahora tiene que demostrar que es imprescindible.": "Sekarang dia harus membuktikan bahwa dia tak tergantikan.",
		"Apareció cuando nadie lo esperaba. Eso es un crack.": "Dia muncul saat tak ada yang menduga. Itulah bintang sejati.",
		"BAJA SENSIBLE": "ABSEN BESAR",
		"Buen gol, pero el partido lo jugó a ratos.": "Gol bagus, tapi dia bermain hanya sesekali.",
		"CON ÉL": "ADA",
		"CON ÉL Y SIN ÉL": "ADA & TANPANYA",
		"Cada partido, su gol. Así se gana una liga.": "Satu gol tiap laga. Begitulah liga dimenangkan.",
		"Con ese penalti se escaparon los puntos.": "Dengan penalti itu, poin pun melayang.",
		"Con o sin ti, el equipo fue igual. Ahora, a marcar la diferencia.": "Dengan atau tanpamu, tim sama saja. Sekarang, buat perbedaan.",
		"Con él, {0} puntos por partido; sin él, {1}.": "Dengannya, {0} poin per laga; tanpanya, {1}.",
		"Convocado, pero desde el banquillo.": "Dipanggil, tapi dari bangku cadangan.",
		"Convocado. Ahora a ganarse el once.": "Dipanggil. Sekarang tinggal merebut tempat di starter.",
		"Dejó al equipo con diez. Eso no se hace.": "Dia membuat tim bermain sepuluh orang. Itu tak boleh terjadi.",
		"EL ONCE DE LA TELE": "TIM IDEAL TV",
		"EL ONCE DE LA TEMPORADA": "TIM TERBAIK MUSIM",
		"EL PARTE MÉDICO": "LAPORAN MEDIS",
		"EL PENALTI FALLADO": "PENALTI GAGAL",
		"El equipo aguanta {0} semanas sin él.": "Tim sanggup bertahan {0} pekan tanpanya.",
		"El equipo ha vivido muy bien sin él.": "Tim baik-baik saja tanpa dia.",
		"El equipo lo ha echado mucho de menos.": "Tim sangat merindukannya.",
		"El equipo ni ganó ni perdió sin él.": "Tim tak untung dan tak rugi tanpanya.",
		"El equipo sumó más sin ti. Toca demostrar en el campo.": "Tim meraih lebih banyak poin tanpamu. Buktikan di lapangan.",
		"El portero lo adivinó. Mérito suyo.": "Kiper menebak arahnya. Itu jasanya.",
		"El seleccionador cuenta contigo de inicio.": "Pelatih timnas mengandalkanmu sejak menit awal.",
		"El seleccionador tiene otros nombres.": "Pelatih timnas punya nama-nama lain.",
		"Entre los once mejores de la liga. Ahí es nada.": "Masuk sebelas terbaik liga. Bukan main.",
		"Entre los once mejores de la liga. La tele te pone de ejemplo.": "Masuk sebelas terbaik liga. TV menjadikanmu contoh.",
		"Ese gol vale puntos y vale una temporada.": "Gol itu berharga poin dan berharga satu musim.",
		"Ese penalti no se puede fallar.": "Penalti itu tak boleh gagal.",
		"Esta vez no entraste. El once del año que viene se gana desde ya.": "Kali ini kamu tak masuk. Tim terbaik tahun depan diperjuangkan mulai sekarang.",
		"Esta vez no estás. La próxima lista se gana con tu club.": "Kali ini kamu tak masuk. Daftar berikutnya direbut lewat klubmu.",
		"Estuvo cerca. El año que viene, dentro.": "Nyaris masuk. Tahun depan, pasti masuk.",
		"Está dentro, que es lo primero.": "Dia masuk, itu yang utama.",
		"Estás en la lista. El once, a ganárselo en los entrenamientos.": "Kamu masuk daftar. Posisi starter direbut lewat latihan.",
		"Fallar un penalti le pasa a cualquiera.": "Gagal penalti bisa terjadi pada siapa saja.",
		"Fuera de la lista. Mensaje claro del seleccionador.": "Tak masuk daftar. Pesan jelas dari pelatih timnas.",
		"Hay que verla diez veces. No lo tengo claro.": "Harus ditonton sepuluh kali. Saya tidak yakin.",
		"IMPRESCINDIBLE": "TAK TERGANTI",
		"Indiscutible en el once de la temporada.": "Tak terbantahkan di tim terbaik musim ini.",
		"LA LISTA DE LA SELECCIÓN": "DAFTAR TIMNAS",
		"LA MOVIOLA": "MOVIOLA",
		"LA RACHA": "RENTETAN",
		"LA ROJA": "MERAH",
		"LA SEQUÍA": "PACEKLIK",
		"La portería se te resiste. Un gol lo cambia todo.": "Gawang seolah menolakmu. Satu gol mengubah segalanya.",
		"La selección se construye a su alrededor.": "Timnas dibangun di sekelilingnya.",
		"La tele lo repite una y otra vez. Al siguiente, se marca.": "TV memutarnya berulang kali. Laga berikutnya, cetak gol.",
		"La tele no habla de otra cosa: estás en racha.": "TV tak membicarakan hal lain: kamu sedang on fire.",
		"Le faltó regularidad para entrar.": "Dia kurang konsisten untuk bisa masuk.",
		"Le toca ganarse el puesto otra vez.": "Dia harus merebut posisinya lagi.",
		"Lo decidió él, sí. Ochenta minutos discretos.": "Dia penentunya, ya. Delapan puluh menit biasa saja.",
		"Lo ha merecido, partido a partido.": "Dia layak mendapatkannya, laga demi laga.",
		"MAZAZO": "BERAT",
		"Marca en {0} partidos seguidos. Está en racha.": "Mencetak gol dalam {0} laga beruntun. Sedang on fire.",
		"Necesita un gol, aunque sea de rebote.": "Dia butuh satu gol, meski dari rebound.",
		"Ni rastro de él en el once. Temporada floja.": "Tak ada namanya di sebelas terbaik. Musim yang lemah.",
		"No hay defensa que lo pare ahora mismo.": "Tak ada pertahanan yang bisa menghentikannya saat ini.",
		"Otros lo hicieron mejor en su puesto.": "Yang lain tampil lebih baik di posisinya.",
		"PARTE MÉDICO": "INFO MEDIS",
		"PUNTOS POR PARTIDO": "POIN PER LAGA",
		"Para mí, la roja fue muy rigurosa.": "Menurut saya, kartu merah itu terlalu keras.",
		"Partidos que se pierde: {1}. Se notará.": "Laga yang dilewatkan: {1}. Pasti terasa.",
		"Partidos que se pierde: {1}. Y de los gordos.": "Laga yang dilewatkan: {1}. Dan yang besar-besar.",
		"Poca cosa. En nada vuelves a estar disponible.": "Tidak parah. Sebentar lagi kamu bisa bermain lagi.",
		"SE PIERDE": "ABSEN",
		"SEMANAS": "PEKAN",
		"SIN PARTIDOS A LA VISTA": "TANPA LAGA",
		"SIN ÉL": "TANPA",
		"Se le ha cerrado la portería.": "Gawang seolah tertutup baginya.",
		"Se queda fuera, pero la puerta sigue abierta.": "Dia tersisih, tapi pintu masih terbuka.",
		"Sin marcar en {0} partidos. Un delantero vive del gol.": "Tak mencetak gol dalam {0} laga. Penyerang hidup dari gol.",
		"Sin ti el equipo se resintió. Vuelve su referente.": "Tanpamu tim terpuruk. Sang andalan kembali.",
		"Sin él, el equipo se queda cojo.": "Tanpanya, tim pincang.",
		"Sin él, el equipo sumó más: {1} por partido.": "Tanpanya tim meraih lebih banyak: {1} per laga.",
		"Sin él, {1} puntos por partido. Con él, {0}.": "Tanpanya, {1} poin per laga. Dengannya, {0}.",
		"Su temporada no le alcanza para la selección.": "Musimnya belum cukup untuk timnas.",
		"TE QUEDAS FUERA": "KAMU TERSISIH",
		"Te toca mirar desde la grada unas semanas.": "Kamu akan menonton dari tribun selama beberapa pekan.",
		"Titular con su país. Se lo ha ganado.": "Starter untuk negaranya. Dia pantas mendapatkannya.",
		"Tu gol del final es la jugada de la semana.": "Gol penutupmu adalah aksi pekan ini.",
		"Tu roja es la polémica de la semana.": "Kartu merahmu adalah kontroversi pekan ini.",
		"UN SUSTO": "KAGET",
		"Un susto y poco más: {0} semanas.": "Hanya kaget saja: {0} pekan.",
		"Una roja infantil. La paga el equipo.": "Kartu merah bodoh. Tim yang menanggungnya.",
		"Va con la selección, pero no es titular.": "Dia ikut timnas, tapi bukan starter.",
		"Va para largo. El equipo tendrá que apañarse sin ti.": "Ini akan lama. Tim harus bertahan tanpamu.",
		"Vuelve el que marca la diferencia.": "Pembuat perbedaan telah kembali.",
		"Vuelve enseguida. Nada que lamentar.": "Segera kembali. Tak ada yang perlu disesali.",
		"Ya es fijo para el seleccionador.": "Kini dia pilar tetap bagi pelatih timnas.",
		"{0} PARTIDOS MARCANDO": "{0} LAGA CETAK GOL",
		"{0} PARTIDOS SIN MARCAR": "{0} LAGA TANPA GOL",
		"{0} semanas fuera, justo cuando iba lanzado.": "Absen {0} pekan, tepat saat sedang bagus-bagusnya.",
		"{0} semanas fuera. Mazazo para el club.": "Absen {0} pekan. Pukulan berat bagi klub.",
		"¿LO HAN ECHADO DE MENOS?": "DIRINDUKAN?",
		"ÚLTIMOS PARTIDOS": "LAGA TERAKHIR",
		"Hay respuestas que te siguen toda la carrera.": "Ada jawaban yang mengikutimu sepanjang karier.",
		"HACE {0} TEMPORADAS": "{0} MUSIM LALU",
		"MI ÍDOLO ES {0}": "IDOLAKU {0}",
		"LA PRENSA RECUPERA AQUEL VÍDEO": "MEDIA MENGGALI VIDEO ITU",
		"PREMIOS DEL MES DESDE ENTONCES": "GELAR BULANAN SEJAK ITU",
		"¿SIGUE SIENDO TU ÍDOLO?": "MASIH IDOLAMU?",
		"La sala pone el vídeo de hace {0} temporadas. Lo que digas hoy sale mañana al lado.": "Ruangan memutar video dari {0} musim lalu. Apa yang kamu katakan hari ini terbit besok di sampingnya.",
		"SIEMPRE LO SERÁ": "SELAMANYA",
		"YA JUEGO MI PROPIA HISTORIA": "KINI KISAHKU SENDIRI",
		"EL FAN DE SIEMPRE": "FANS SEJATI",
		"DE MANOS DE TU IDOLO": "DARI TANGAN IDOLAMU",
		"Nunca lo gané. Verlo en tus manos es casi lo mismo.": "Aku tak pernah memenangkannya. Melihatnya di tanganmu hampir sama rasanya.",
		"Yo también lo levanté una vez. Ahora es tuyo.": "Aku juga pernah mengangkatnya sekali. Sekarang milikmu.",
		"Lo levanté {0} veces. Ninguna pesó como ésta.": "Aku mengangkatnya {0} kali. Tak satu pun seberat yang ini.",
		"Te lo entregó {0}, el ídolo del que hablaste aquella noche.": "{0} menyerahkannya kepadamu, idola yang kamu sebut malam itu.",
		"Te Elijo a Ti": "Aku Memilihmu",
		"Ponerle a una mascota el nombre del ratón eléctrico más famoso.": "Beri nama hewan peliharaan seperti tikus listrik paling terkenal.",
		"Hay un nombre amarillo y eléctrico que tus mascotas llevan esperando.": "Ada nama kuning dan listrik yang ditunggu hewan peliharaanmu.",
		"LO CONOCES": "BERTEMU DIA",
		"TU IDOLO VINO A VERTE": "IDOLAMU DATANG MENEMUIMU",
		"LA PRIMERA VEZ EN PERSONA": "PERTAMA KALI BERTATAP MUKA",
		"la final": "final",
		"el derbi": "derbi",
		"temporadas después": "musim kemudian",
		"Lo dijiste hace {0} temporadas en una rueda de prensa. Hoy bajó a buscarte.": "Kamu mengatakannya {0} musim lalu di konferensi pers. Hari ini dia turun untuk menemuimu.",
		"Te vi levantarla. Yo también temblaba la primera vez.": "Aku melihatmu mengangkatnya. Aku juga gemetar saat pertama kali.",
		"Hoy duele. Guárdalo: la próxima vez te toca a ti.": "Hari ini sakit. Simpan itu: lain kali giliranmu.",
		"Esta casa también fue la mía. Gracias por cuidarla.": "Rumah ini juga pernah jadi milikku. Terima kasih sudah menjaganya.",
		"Esta grada no olvida, y yo tampoco. Sigue.": "Tribun ini tak pernah lupa, begitu juga aku. Teruslah.",
		"PINGÜINO": "PINGUIN",
		"Un pingüino que anda a pasitos por la casa. Dicen que trae suerte en el próximo gol.": "Seekor pinguin yang berjalan kecil-kecil di rumah. Katanya membawa keberuntungan di gol berikutnya.",
		"EL PINGUINAZO": "PINGUINATOR",
		"Se gana comprando el pingüino de casa: en tu siguiente gol tu equipo se vuelve pingüinos y los rivales, dinosaurios. Sale una sola vez.": "Didapat dengan membeli pinguin untuk rumah: di gol berikutnya timmu berubah jadi pinguin dan lawan jadi dinosaurus. Hanya sekali.",
		"Tu equipo se vuelve pingüinos y los rivales, dinosaurios. Lo estrenas en tu próximo gol, y sólo esa vez.": "Timmu berubah jadi pinguin dan lawan jadi dinosaurus. Kamu memakainya perdana di gol berikutnya, dan hanya saat itu.",
		"SU FESTEJO": "PERAYAANNYA",
		"TU IDOLO TE ESPERABA": "IDOLAMU MENUNGGUMU",
		"NUEVO FESTEJO": "PERAYAAN BARU",
		"La levanté con esta misma camiseta. Ahora mi festejo es tuyo.": "Aku mengangkatnya dengan seragam yang sama ini. Sekarang perayaanku milikmu.",
		"Me has ganado la final. Esto ya no es mío.": "Kamu mengalahkanku di final. Ini bukan milikku lagi.",
		"Se lo ganaste en una final, a él.": "Kamu merebutnya darinya, di sebuah final.",
		"Ganaste una final con su camiseta.": "Kamu memenangi final dengan seragamnya.",
		"Lo estrenas en tu próximo gol.": "Kamu akan memamerkannya di golmu berikutnya.",
		"SU ULTIMO CONSEJO": "NASIHAT TERAKHIRNYA",
		"TE INVITO A CENAR": "AKU TRAKTIR MAKAN MALAM",
		"LA CENA": "MAKAN MALAM",
		"La felicidad está en cada día.": "Kebahagiaan ada di setiap hari.",
		"Hace {0} años dijiste en una rueda de prensa que yo era tu ídolo.": "{0} tahun lalu kau bilang di konferensi pers bahwa aku idolamu.",
		"Y lo sigues siendo.": "Dan kau masih idolaku.",
		"Cuando me retiré pensé que echaría de menos las finales.": "Waktu pensiun, kukira aku akan merindukan final.",
		"Pero echo de menos los martes. El autobús, el café malo, las risas del vestuario.": "Tapi aku merindukan hari Selasa. Bus, kopi yang tak enak, tawa di ruang ganti.",
		"Me he pasado la vida esperando el próximo gran día. Y la felicidad estaba en todos los demás.": "Seumur hidup aku menunggu hari besar berikutnya. Padahal kebahagiaan ada di semua hari lainnya.",
		"¿Y ahora qué hago?": "Lalu sekarang aku harus apa?",
		"Lo mismo que en el campo: un día cada vez. En el fútbol y en la vida, la felicidad está en cada día.": "Sama seperti di lapangan: satu hari demi satu hari. Di sepak bola dan di hidup, kebahagiaan ada di setiap hari.",
		"Por cada día.": "Untuk setiap hari.",
		"Yo todavía juego, y ya sé lo que voy a echar de menos.": "Aku masih bermain, dan aku sudah tahu apa yang akan kurindukan.",
		"No serán las finales. Serán los martes: el autobús, el café malo, las risas del vestuario.": "Bukan final. Tapi hari Selasa: bus, kopi yang tak enak, tawa di ruang ganti.",
		"TE ELIJO A TI": "AKU MEMILIHMU",
		"Se gana poniéndole a una mascota el nombre del ratón eléctrico: te calas la gorra roja y lanzas la bola. Lo estrena tu siguiente gol; luego, uno de cada trece.": "Didapat dengan memberi hewan peliharaan nama tikus listrik: kamu memakai topi merah dan melempar bola. Gol berikutnya jadi debutnya; setelah itu, satu dari tiga belas.",
		"El club lo guardaba para alguien como tú.": "Klub menyimpannya untuk orang sepertimu.",
		"{0} te lo cede.": "{0} memberikannya padamu.",
		"¿LLEVAS SU {0}?": "PAKAI {0}-NYA?",
		"LLEVARLO": "PAKAI",
		"Cada domingo te compararán con él.": "Setiap Minggu kamu akan dibandingkan dengannya.",
		"Tu número, tu historia.": "Nomormu, kisahmu.",
		"Ya llevas el {0}.": "Kini kamu memakai nomor {0}.",
		"La grada compara tu {0} con el de {1}": "Tribun membandingkan nomor {0}-mu dengan milik {1}",
		"Llevas el {0} a su altura": "Kamu memakai nomor {0} setara dengannya",
		"su dorsal": "nomornya",
		"títulos aquí": "gelar di sini",
		"LA ENTREVISTA AL REVES": "WAWANCARA TERBALIK",
		"¿Quién es tu ídolo?": "Siapa idolamu?",
		"{0}. Me firmó la playera cuando tenía {1} años. Todavía la tengo.": "{0}. Dia menandatangani kausku waktu aku {1} tahun. Masih kusimpan.",
		"Y ahora me pasa el balón todos los fines de semana.": "Dan sekarang dia mengoper bola padaku setiap akhir pekan.",
		"Hoy lo tuve enfrente. Sigue siendo él.": "Hari ini aku melawannya. Dia tetap idolaku.",
		"SU ÍDOLO ERES TÚ": "IDOLANYA ADALAH KAMU",
		"TEMPORADAS DESDE QUE DIJISTE EL TUYO": "MUSIM SEJAK KAMU MENYEBUT IDOLAMU",
		"Hace {0} temporadas dijiste {1}. Hoy el nombre que dicen es el tuyo.": "{0} musim lalu kamu menyebut {1}. Hari ini nama yang mereka sebut adalah namamu.",
		"CONTRA TU ÍDOLO": "MELAWAN IDOLAMU",
		"CONTRA TU IDOLO": "MELAWAN IDOLAMU",
		"LO ELEGISTE HACE {0} TEMPORADAS": "KAMU MEMILIHNYA {0} MUSIM LALU",
		"ranking": "peringkat",
		"Alguien le enseñó aquella rueda de prensa. Te reconoce.": "Seseorang menunjukkan konferensi pers itu kepadanya. Dia mengenalimu.",
		"Hoy no eres su aficionado. Eres su rival.": "Hari ini kamu bukan penggemarnya. Kamu rivalnya.",
		"Noventa minutos sin pedirle un autógrafo.": "Sembilan puluh menit tanpa meminta tanda tangannya.",
		"LA CAMISETA DE TU ÍDOLO": "JERSEY IDOLAMU",
		"Esta no se cambia por nada.": "Yang ini tak akan kau tukar dengan apa pun.",
		"FICHA CONTIGO": "BERGABUNG DENGANMU",
		"JUGARÁS CON ÉL": "KALIAN SETIM",
		"años después": "tahun kemudian",
		"Hace {0} años dijiste su nombre delante de todos.": "{0} tahun lalu kamu menyebut namanya di depan semua orang.",
		"Hace un año dijiste su nombre delante de todos.": "Setahun lalu kau menyebut namanya di depan semua orang.",
		"Llegas nuevo, y el primero que viene a darte la bienvenida es él.": "Kau datang sebagai pemain baru, dan yang pertama menyambutmu adalah dia.",
		"El club lo ha fichado. Ahora entrenas cada día con el que veías por la tele.": "Klub merekrutnya. Kini kau berlatih setiap hari dengan orang yang dulu kau tonton di TV.",
		"Lo pediste tú y el club lo trajo. Ahora te toca estar a su altura.": "Kau yang memintanya dan klub mendatangkannya. Kini giliranmu menyamai levelnya.",
		"ES TU ÍDOLO": "IDOLAMU",
		"EN EL PALCO": "DI TRIBUN",
		"TU ÍDOLO, EN EL PALCO": "IDOLAMU, DI TRIBUN",
		"SE LEVANTÓ POR TI": "DIA BERDIRI UNTUKMU",
		"el partido": "pertandingan",
		"Dos en mi casa. Esta grada ya tiene otro nombre que cantar.": "Dua gol di rumahku. Tribun ini punya nama baru untuk dinyanyikan.",
		"Un gol en el derbi, en esta casa. Eso no se olvida nunca.": "Gol di derbi, di rumah ini. Itu tak akan pernah terlupakan.",
		"Lo dijiste hace {0} temporadas. Hoy, en la que fue su casa, el palco entero miró cómo te aplaudía.": "Kamu mengatakannya {0} musim lalu. Hari ini, di rumah lamanya, seluruh tribun melihatnya bertepuk tangan untukmu.",
		"SE MIDE CON SU ÍDOLO": "MELAWAN IDOLANYA",
		"EL DISCIPULO YA ES MEJOR": "SANG MURID KINI LEBIH BAIK",
		"EL DISCÍPULO YA ES MEJOR": "SANG MURID KINI LEBIH BAIK",
		"EDICIÓN ESPECIAL": "EDISI KHUSUS",
		"EL ALUMNO SUPERA AL MAESTRO": "MURID MELAMPAUI SANG GURU",
		"ÚLTIMA HORA: {0} SUPERA A {1} EN EL RANKING": "BERITA TERKINI: {0} MELAMPAUI {1} DI PERINGKAT",
		"TU RANKING": "PERINGKATMU",
		"SU RANKING": "PERINGKATNYA",
		"tu ranking": "peringkatmu",
		"su ranking": "peringkatnya",
		"El día que lo nombraste te sacaba {0} puestos.": "Saat kamu menyebut namanya, dia unggul {0} peringkat darimu.",
		"El día que lo nombraste lo mirabas desde muy abajo.": "Saat kamu menyebut namanya, kamu memandangnya dari jauh di bawah.",
		"Hace {0} temporadas dijo en una rueda de prensa que su ídolo era {1}. Hoy el ranking los pone al revés.": "{0} musim lalu dia bilang di konferensi pers bahwa idolanya adalah {1}. Hari ini peringkat membalik posisi mereka.",
		"Un número no es una carrera. {1} ya tiene la suya; a {2} todavía le falta escribirla.": "Angka bukan karier. {1} sudah punya kariernya; {2} masih harus menuliskannya.",
		"Hemos hablado con {1} esta mañana. Dice que alguien tenía que pasarle algún día, y que se alegra de que haya sido {2}.": "Kami bicara dengan {1} pagi ini. Katanya suatu hari pasti ada yang melampauinya, dan dia senang itu {2}.",
		"SU DESPEDIDA": "PERPISAHANNYA",
		"Compartisteis vestuario. Hoy le aplaudes desde la grada.": "Kalian pernah berbagi ruang ganti. Hari ini kamu bertepuk tangan untuknya dari tribun.",
		"Te tocó enfrentarte a él. Hoy te tocó despedirlo.": "Kamu pernah harus melawannya. Hari ini kamu mengantar kepergiannya.",
		"Él tampoco lo olvidó: tu nombre estaba en su lista de invitados.": "Dia juga tidak lupa: namamu ada di daftar tamunya.",
		"En el borde del área": "Di tepi kotak penalti",
		"Abierto al segundo palo": "Terbuka di tiang jauh",
		"VUELTA DE HONOR": "PUTARAN HORMAT",
		"LA VUELTA DE HONOR": "PUTARAN HORMAT",
		"LA ÚLTIMA DE {0}": "TERAKHIR {0}",
		"{0} cuelga las botas este verano. La última vuelta fue suya.": "{0} gantung sepatu musim panas ini. Putaran terakhir adalah miliknya.",
		"Más Premios al Mejor en una carrera": "Gelar Pemain Terbaik terbanyak dalam satu karier",
		"Tus amigos te esperan para una noche de videojuegos. El técnico ofrece una sesión extra de vídeo y tiros a puerta. No llegas a las dos.": "Teman-temanmu menunggu untuk malam main gim. Pelatih menawarkan sesi ekstra video dan latihan tembakan. Kamu tak bisa dua-duanya.",
		"CONSOLA CON AMIGOS": "KONSOL BARENG TEMAN",
		"Caños": "Nutmeg",
		"Año redondo del club: el técnico cuenta más contigo": "Tahun sempurna klub: pelatih lebih mengandalkanmu",
		"Año para olvidar: el club escucharía ofertas por ti": "Tahun yang ingin dilupakan: klub akan mendengar tawaran untukmu",
		"DIRECTIVA": "DIREKSI",
		"El {0} se ilusiona: la directiva pide acabar {1}": "{0} bersemangat: direksi menuntut finis {1}",
		"El {0} rebaja la meta: ahora le basta acabar {1}": "{0} menurunkan target: kini cukup finis {1}",
		"El {0} cae en {1} antes de lo que pedía la directiva": "{0} gugur di {1} lebih cepat dari tuntutan direksi",
		"Cuadrar las cuentas": "Menyeimbangkan keuangan",
		"Salir del rojo del fair play": "Keluar dari zona merah fair play",
		"CAJA SANA": "KAS SEHAT",
		"CUENTAS": "KAS",
		"¡Que alguien le pite!": "Wasit, Tiup Peluitnya!",
		"Un recogepelotas de casa te tira el balón detrás de la valla para hacer tiempo.": "Anak gawang tuan rumah melempar bola ke balik pagar untuk mengulur waktu.",
		"Balón largo": "Bola panjang",
		"Te cuelgan un balón largo: pica cuando el aro se cierre para bajarlo. Si te rebota, pierdes la jugada.": "Kamu dapat bola panjang: ketuk saat cincin menutup untuk menghentikannya. Kalau memantul darimu, peluangnya hilang.",
		"ESA NOCHE": "MALAM ITU",
		"EN CASA DE UN COLEGA": "DI RUMAH TEMAN",
		"¡LO PUSE DE CAPITÁN!": "KUJADIKAN KAPTEN!",
		"¡Y YO LO TENÍA EN EL BANQUILLO!": "AKU MALAH MENCADANGKANNYA!",
		"EL CAPITÁN DEL FANTASY": "KAPTEN FANTASY",
		"FANTASY": "FANTASY",
		"LOS DEL SOFÁ": "TIM SOFA",
		"{0} goles tuyos y un colega que no se calla: te tenía de capitán.": "{0} golmu dan seorang teman yang tak mau diam: dia menjadikanmu kapten.",
		"MÁXIMO": "TERTINGGI",
		"TU CAPITÁN SUMA {0} PTS": "KAPTENMU DAPAT {0} POIN",
		"FIRMADA": "BERTANDA TANGAN",
		"CON BARRO": "BERLUMPUR",
		"SU ÚLTIMA TEMPORADA": "MUSIM TERAKHIRNYA",
		"PROMESA CUMPLIDA": "BAKAT TERBUKTI",
		"El mejor de su equipo te buscó a ti.": "Pemain terbaik mereka datang mencarimu.",
		"Te la firmó antes de dártela.": "Ia menandatanganinya sebelum memberikannya padamu.",
		"Con el barro de esta tarde todavía encima.": "Masih berlumur lumpur sore ini.",
		"Se retira este verano. Es de las últimas que vestirá.": "Ia pensiun musim panas ini. Salah satu yang terakhir ia kenakan.",
		"TÚ: {0} DE MEDIA": "KAMU: RATING {0}",
		"PRIMAS": "BONUS",
		"TU CONTRATO PAGA": "KONTRAK BAYAR",
		"ESTA TEMPORADA": "MUSIM INI",
		"FICHA": "GAJI",
		"CADA PARTIDO": "TIAP LAGA",
		"COBRADO": "CAIR",
		"FIRMA": "AWAL",
		"PACTADA": "SEPAKAT",
		"BASE": "BASE",
		"MEJOR DEL CLUB": "TERBAIK KLUB",
		"Primas por goles": "Bonus gol",
		"Lo que llevas cobrado en primas esta temporada.": "Bonus yang sudah kamu terima musim ini.",
		"Se cobra al cierre de la temporada si cumples el objetivo.": "Dibayar di akhir musim jika kamu mencapai target.",
		"Se cobra al cierre de la temporada si el club cumple lo que pide.": "Dibayar di akhir musim jika klub memenuhi tuntutannya.",
		"Se cobra al cierre de la temporada si el club gana el título.": "Dibayar di akhir musim jika klub menjuarai gelar.",
		"Se cobra en cuanto ganas el premio.": "Dibayar begitu kamu memenangi penghargaan.",
		"Se cobra en el partido, por cada gol que marques.": "Dibayar saat laga, untuk setiap gol yang kamu cetak.",
		"Se cobra en el partido, por cada asistencia que des.": "Dibayar saat laga, untuk setiap assist yang kamu berikan.",
		"TU BOMBO": "PILIHANMU",
		"SU MOMENTO": "MOMENNYA",
		"DE VISITA": "TANDANG",
		"EN TU BOMBO": "DIPILIH",
		"AL BOMBO": "PILIH",
		"Elige con la estrella cuáles salen al marcar. Lo nuevo sigue saliendo.": "Pilih dengan bintang mana yang keluar saat mencetak gol. Yang baru tetap muncul.",
		"{0}, jugador del partido. Hoy no hay más preguntas.": "{0}, pemain terbaik laga ini. Hari ini tak ada pertanyaan lagi.",
		"Qué partido, {0}. Hoy la cena la pagas tú.": "Laga yang luar biasa, {0}. Malam ini kamu yang traktir makan.",
		"¡Hoy {0} lo ha bordado! Que no se vaya nunca.": "Hari ini {0} tampil sempurna! Jangan sampai dia pergi.",
		"{0} se ve en lo más alto. Su frase ya es la portada de la semana.": "{0} merasa di puncak. Ucapannya sudah jadi berita utama minggu ini.",
		"Mucho hablar, {0}. En el campo nos vemos.": "Banyak omong, {0}. Kita ketemu di lapangan.",
		"{0} contesta a la crítica. Ahora le toca demostrarlo en el campo.": "{0} membalas kritik. Sekarang dia harus membuktikannya di lapangan.",
		"¡Así se contesta, {0}! Ahora, a callar bocas.": "Begitu cara menjawab, {0}! Sekarang bungkam mereka.",
		"Lo dijo y lo cumplió. {0} es de los nuestros.": "Dia bilang dan dia buktikan. {0} salah satu dari kita.",
		"Palabra de {0}. Así da gusto.": "{0} menepati janji. Begini baru mantap.",
		"¿Y la bravata, {0}? Seguimos esperando.": "Mana omong besarnya, {0}? Kami masih menunggu.",
		"La frase de {0} le salió cara.": "Ucapan {0} harus dibayar mahal.",
		"Me firmó la camiseta {0}. Un crack también fuera del campo.": "{0} menandatangani jersiku. Bintang juga di luar lapangan.",
		"Soy del otro equipo, pero {0} me firmó la camiseta. Respeto.": "Aku dukung tim lain, tapi {0} menandatangani jersiku. Respek.",
		"Una hora esperando y {0} pasó de largo.": "Sejam menunggu dan {0} lewat begitu saja.",
		"¡Me ha caído la camiseta de {0}! No me la quito en un año.": "Aku dapat jersi {0}! Tidak akan kulepas setahun.",
		"El balonazo de {0} al móvil lleva todo el día dando vueltas.": "Tendangan {0} yang kena ponsel itu beredar seharian.",
		"Lo de {0} ya es viral. Así se mueven unas redes.": "Aksi {0} sudah viral. Begini cara menggerakkan media sosial.",
		"Ese festejo de {0} no se olvida. Te esperamos en la vuelta.": "Selebrasi {0} itu tidak akan dilupakan. Kami tunggu di laga balasan.",
		"Polémica por el festejo de {0}: el comité ya lo mira.": "Kontroversi selebrasi {0}: komisi sudah menyelidikinya.",
		"Roja para {0}, y su equipo con uno menos.": "Kartu merah untuk {0}, dan timnya kekurangan satu pemain.",
		"A la ducha temprano, {0}.": "Mandi lebih awal, {0}.",
		"Ánimo, {0}. El vestuario te espera.": "Semangat, {0}. Ruang ganti menunggumu.",
		"Recupérate pronto, {0}. Te necesitamos.": "Cepat pulih, {0}. Kami membutuhkanmu.",
		"Bienvenido a {1}, {0}. Aquí se suda la camiseta.": "Selamat datang di {1}, {0}. Di sini kita berjuang untuk seragam ini.",
		"Es oficial: {0} ya es jugador de {1}.": "Resmi: {0} kini pemain {1}.",
		"Partido para olvidar de {0}. ¿Dónde estuvo?": "Laga yang ingin dilupakan bagi {0}. Ke mana dia?",
		"{0} calla bocas: después del zasca, partidazo.": "{0} membungkam semua: setelah skakmat itu, laga luar biasa.",
		"¡Zasca y partidazo! {0} tenía razón.": "Skakmat dan laga hebat! {0} benar.",
		"Tanto zasca para esto: {0}, otra vez gris.": "Sok skakmat, hasilnya begini: {0}, lagi-lagi melempem.",
		"Mucho móvil y poco fútbol, {0}.": "Banyak main ponsel, sedikit main bola, {0}.",
		"Esto es cosa de todos. Orgulloso de este vestuario.": "Ini kerja kita semua. Bangga dengan ruang ganti ini.",
		"Trabajo, trabajo y más trabajo. Y esto sólo acaba de empezar.": "Kerja, kerja, dan kerja lagi. Dan ini baru permulaan.",
		"Esto es para vosotros. Sin vuestra voz no somos nada.": "Ini untuk kalian. Tanpa suara kalian, kami bukan apa-apa.",
		"¡Grande, {0}! Juntos hasta el final.": "Mantap, {0}! Bersama sampai akhir.",
		"Así se habla. Equipo.": "Begitu baru benar. Tim.",
		"{0} reparte el mérito. Gesto de capitán.": "{0} berbagi pujian. Sikap seorang kapten.",
		"¡Ese es mi jugador!": "Itu dia pemainku!",
		"Menos postureo, {0}.": "Kurangi pamer, {0}.",
		"El fútbol es de once, {0}.": "Sepak bola dimainkan sebelas orang, {0}.",
		"¡Te queremos, {0}!": "Kami sayang kamu, {0}!",
		"La grada es nuestro jugador número doce.": "Suporter adalah pemain kedua belas kami.",
		"{0} se gana a la grada otra vez.": "{0} kembali memikat suporter.",
		"Foto lista para publicar tras el partido. Lo que subas lo verá todo el mundo, y cada mensaje tiene su público.": "Foto siap diunggah setelah laga. Semua orang akan melihat yang kamu unggah, dan setiap pesan punya penontonnya.",
		"FOTO CON EL VESTUARIO": "FOTO BERSAMA TIM",
		"TU MOMENTO": "MOMENMU",
		"PARA LA GRADA": "BUAT SUPORTER",
		"TE CRITICAN EN REDES": "DIKRITIK DI MEDSOS",
		"Partido gris y el hashtag ya corre. Te etiquetan en cada crítica y el móvil no para de vibrar. ¿Contestas?": "Laga yang hambar dan tagarnya sudah menyebar. Kamu ditandai di setiap kritik dan ponselmu tak berhenti bergetar. Mau membalas?",
		"IGNORAR": "ABAIKAN",
		"CON CLASE": "BERKELAS",
		"ZASCA": "SKAKMAT",
		"TU ZASCA CORRE POR LAS REDES": "SKAKMATMU VIRAL DI MEDSOS",
		"Verdugo de Suecia": "Momok Swedia",
		"Verdugo de Rumanía": "Momok Rumania",
		"Vencer a todos los clubes de Suecia (las tres divisiones).": "Kalahkan semua klub Swedia (ketiga divisinya).",
		"Vencer a todos los clubes de Rumanía (las tres divisiones).": "Kalahkan semua klub Rumania (ketiga divisinya).",
		"LLEGADAS": "DATANG",
		"ACABA DE ATERRIZAR": "BARU MENDARAT",
		"LA LLEGADA": "KEDATANGAN",
		"te esperaban en el aeropuerto": "menunggumu di bandara",
		"periodistas": "wartawan",
		"LA LLEGADA AL AEROPUERTO": "KEDATANGAN DI BANDARA",
		"Media ciudad vino a verte bajar del avión.": "Setengah kota datang melihatmu turun dari pesawat.",
		"En Primera, hasta el aeropuerto tiene micrófonos.": "Di kasta tertinggi, bandara pun penuh mikrofon.",
		"En Segunda no se ve esto todos los días.": "Di divisi dua, pemandangan ini tidak tiap hari.",
		"Pocos, pero ya se saben tu nombre.": "Hanya sedikit, tapi mereka sudah tahu namamu.",
		"¿CÓMO LO CELEBRAS?": "RAYAKAN BAGAIMANA?",
		"SI NO TOCAS, A TU MANERA": "TAK DISENTUH, CARAMU",
		"PROVOCAR": "EJEK",
		"PERDÓN": "MAAF",
		"A LOS TUYOS": "KE FANSMU",
		"MULTA": "DENDA",
		"CONTRA TU EX": "LAWAN MANTAN",
		"ROCE CON EL TÉCNICO": "BENTROK PELATIH",
		"ROCE CON EL VESTUARIO": "RUANG GANTI RETAK",
		"RECIÉN SALIDO": "BARU MASUK",
		"{0} corrió a abrazar a su técnico. Paz en el banquillo.": "{0} berlari memeluk pelatihnya. Damai di bangku cadangan.",
		"Ese abrazo de {0} con el míster dice mucho.": "Pelukan {0} dengan pelatih itu sangat berarti.",
		"Gol de {0} y todos con él. Este vestuario está unido.": "Gol {0} dan semua bersamanya. Ruang ganti ini kompak.",
		"¡{0} vino a celebrarlo con nosotros!": "{0} datang merayakannya bersama kami!",
		"{0} no lo celebró contra nosotros. Respeto.": "{0} tidak merayakan gol ke gawang kami. Hormat.",
		"{0} marca a su ex y no lo celebra.": "{0} mencetak gol ke mantan klubnya dan tidak merayakan.",
		"NADA QUE ARREGLAR": "SUDAH PULIH",
		"Me equivoqué. Pido perdón al club, al míster y a mis compañeros.": "Aku salah. Aku minta maaf kepada klub, pelatih, dan rekan-rekan setim.",
		"{0} pide perdón en un comunicado. El club da el asunto por cerrado.": "{0} minta maaf lewat pernyataan. Klub menganggap masalah selesai.",
		"Errores los tenemos todos. A seguir, {0}.": "Semua orang pernah salah. Lanjut, {0}.",
		"Disculpas aceptadas. Ahora, a darlo todo.": "Maaf diterima. Sekarang berikan semuanya.",
		"Mucho perdón ahora, {0}…": "Banyak minta maaf sekarang, {0}…",
		"Dije lo que pienso y no me escondo.": "Aku bilang apa yang kupikirkan dan aku tidak bersembunyi.",
		"{0} no rectifica: ni una palabra de disculpa.": "{0} tidak mundur: tak sepatah kata maaf pun.",
		"¡Sin miedo, {0}! Con dos.": "Tanpa takut, {0}! Berani.",
		"Así no ayudas al equipo, {0}.": "Begitu kamu tidak membantu tim, {0}.",
		"{0} se planta. El míster toma nota.": "{0} bersikukuh. Pelatih mencatatnya.",
		"Ni comunicado ni disculpa: {0} guarda silencio.": "Tanpa pernyataan, tanpa maaf: {0} memilih diam.",
		"¿Y el comunicado, {0}? Seguimos esperando.": "Mana pernyataannya, {0}? Kami masih menunggu.",
		"¿QUÉ TE CONVENCIÓ DE VENIR?": "APA YANG MEYAKINKANMU?",
		"{0} periodistas y una pregunta. Lo que contestes lo va a oír todo el club.": "{0} wartawan dan satu pertanyaan. Apa pun jawabanmu, seluruh klub akan mendengarnya.",
		"EL TÉCNICO": "PELATIHNYA",
		"EL EQUIPO": "TIMNYA",
		"LA AFICIÓN": "SUPORTERNYA",
		"LA PROXIMA: MULTA ×2 · ROJA {0}": "BERIKUTNYA: DENDA ×2 · KARTU MERAH {0}",
		"LA PROXIMA: TECNICO {0}": "BERIKUTNYA: PELATIH {0}",
		"VIGILADO: MULTA ×2": "DIAWASI: DENDA ×2",
		"VIGILADO: TECNICO {0}": "DIAWASI: PELATIH {0}",
		"{0} no cierra la puerta a {1}. ¿Se va?": "{0} tidak menutup pintu untuk {1}. Mau pergi?",
		"¿{0} coqueteando con {1}? Así no.": "{0} main mata dengan {1}? Jangan begitu.",
		"{0} se queda. ¡Eso es compromiso!": "{0} bertahan. Itu baru komitmen!",
		"{0} corta el rumor de {1}.": "{0} menepis rumor soal {1}.",
		"Gracias a {0} por el pase de hoy.": "Terima kasih {0} atas umpan hari ini.",
		"Se sabe que te seguimos. Lo que digas lo oyen tu grada y nuestro despacho.": "Semua tahu kami memantaumu. Apa pun katamu, suportermu dan manajemen kami akan dengar.",
		"Respetamos tu palabra, {0}. La puerta sigue abierta.": "Kami hormati janjimu, {0}. Pintu tetap terbuka.",
		"¡Vaya pase me diste, crack! Ese gol es medio tuyo.": "Umpan mantap, bro! Gol itu separuh milikmu.",
		"Gracias por la camiseta del túnel, {0}. Desde entonces no me pierdo un gol tuyo.": "Makasih jersey di lorong, {0}. Sejak itu aku tak pernah lewatkan golmu.",
		"¡Tu camiseta ya está colgada en mi cuarto, {0}!": "Jersey-mu sudah tergantung di kamarku, {0}!",
		"Me alegró verte, {0}. Sigue así.": "Senang bertemu kamu, {0}. Pertahankan.",
		"En el fútbol nunca se sabe.": "Di sepak bola, tak ada yang tahu.",
		"Mi sitio está aquí.": "Tempatku di sini.",
		"El próximo te lo pongo yo.": "Berikutnya giliranku kasih umpan.",
		"¡Gracias por estar siempre!": "Makasih selalu ada!",
		"Verdugo de Bosnia y Herzegovina": "Momok Bosnia & Herzegovina",
		"Vencer a todos los clubes de Bosnia y Herzegovina (las tres divisiones).": "Kalahkan semua klub Bosnia & Herzegovina (ketiga divisinya).",
		"Las copas europeas estrenan rondas previas este verano": "Piala-piala Eropa menggelar babak kualifikasi musim panas ini",
		"El {0} jugará la ronda {1} de la {2} contra el {3}": "{0} akan memainkan babak {1} {2} melawan {3}",
		"El {0} elimina al {1} y entra en la fase de liga de la {2}": "{0} singkirkan {1} dan lolos ke fase liga {2}",
		"El {0} elimina al {1} y pasa a la ronda {2} de la {3}": "{0} singkirkan {1} dan melaju ke babak {2} {3}",
		"El {0} cae ante el {1} y se queda sin Europa": "{0} kalah dari {1} dan gagal ke Eropa",
		"El {0} cae ante el {1} y baja a la fase de liga de la {2}": "{0} kalah dari {1} dan turun ke fase liga {2}",
		"El {0} cae ante el {1} y baja a la ronda {2} de la {3}": "{0} kalah dari {1} dan turun ke babak {2} {3}",
		"{0} gana una plaza extra en la {1} por su temporada europea": "{0} dapat satu tempat tambahan di {1} berkat musim Eropanya",
		"Mil Goles": "Seribu Gol",
		"1.000 goles en tu carrera.": "1.000 gol dalam kariermu.",
		"Hat-Trick en la Final": "Hat-Trick di Final",
		"3 goles en una final.": "3 gol dalam satu final.",
		"Goleador de la Patria": "Pencetak Gol Tanah Air",
		"50 goles con tu selección.": "50 gol bersama timnasmu.",
		"Bicampeón del Mundo": "Juara Dunia Dua Kali",
		"Ganar 2 Mundiales con tu selección.": "Menangkan Kejuaraan Dunia 2 kali bersama timnasmu.",
		"Era Dorada": "Era Emas",
		"5 Balones de Oro.": "5 kali Pemain Terbaik.",
		"Mr. Champions": "Mr. Piala Elite",
		"Ganar la Champions 5 veces en tu carrera.": "Menangkan Piala Elite 5 kali dalam kariermu.",
		"Tricampeón de Europa": "Tiga Kali Juara Eropa",
		"Ganar la Champions 3 temporadas seguidas.": "Menangkan Piala Elite 3 musim berturut-turut.",
		"Mr. Libertadores": "Mr. Piala Kejayaan",
		"Ganar la Libertadores 5 veces en tu carrera.": "Juarai Piala Kejayaan 5 kali dalam kariermu.",
		"Mr. Copa del Norte": "Mr. Piala Utara",
		"Ganar la Concacaf Champions Cup 5 veces en tu carrera.": "Juarai Piala Utara 5 kali dalam kariermu.",
		"Killer de Europa": "Killer Eropa",
		"Ser 3 veces el máximo goleador de la Champions.": "Jadi top skor Piala Elite sebanyak 3 kali.",
		"¡Llamen a Mantenimiento!": "Panggil Petugas!",
		"Romper de dos balonazos las dos cuerdas que tensan la red y que salga el staff a tenderlas.": "Putuskan dua tali penegang jaring dengan dua tendangan dan buat petugas keluar memasangnya lagi.",
		"La red no se sostiene sola: algo la tensa por detrás.": "Jaring tak bisa tegak sendiri: ada yang menariknya dari belakang.",
	},








	"plural": {


		"pluralTIRO": ["TEMBAKAN", "TEMBAKAN"],
		"pluralPASE": ["UMPAN", "UMPAN"],
		"FIRMA DE AUTÓGRAFOS": "SESI TANDA TANGAN",
		"AUTÓGRAFOS FIRMADOS": "TTD SELESAI",
		"FIRMA LA CAJA": "TTD KOTAKNYA",
		"FIRMAS EN EL SÚPER": "TTD DI SUPERMARKET",
		"Diez cajas firmadas. Ésas no se las come nadie.": "Sepuluh kotak bertanda tangan. Tak ada yang mau memakannya.",
		"FIRMA EL CROMO": "TTD KARTU INI",
		"FIRMAS EN EL BARRIO": "TTD DI LINGKUNGAN",
		"FIRMA EL PÓSTER": "TEKEN POSTER",
		"FIRMA LA CLAQUETA": "TEKEN CLAPPER",
		"FIRMAS BAJO LA VALLA": "TANDA TANGAN BALIHO",
		"FIRMAS EN LA PLAZA": "TANDA TANGAN PLAZA",
		"FIRMAS EN EL PLATÓ": "TANDA TANGAN SET",
		"Diez pósters firmados. Ésos acaban enmarcados.": "Sepuluh poster bertanda tangan. Yang ini pasti dibingkai.",
		"Diez fotos firmadas. Ésas brillan más que las pantallas.": "Sepuluh foto bertanda tangan. Sinarnya melebihi layar-layar itu.",
		"Diez claquetas firmadas. Esta vez sí lo grabó alguien.": "Sepuluh clapperboard bertanda tangan. Kali ini ada yang benar-benar merekam.",
		"SELFIE": "SELFIE",
		"ENCUADRA Y DISPARA": "BIDIK DAN JEPRET",
		"FOTO": "FOTO",
		"ARRASTRA": "GESER",
		"MOVIDA": "GOYANG",
		"SELFIES": "SELFIE",
		"A TUS REDES": "KE MEDSOSMU",
		"Diez cromos firmados. Ésos ya no se cambian.": "Sepuluh kartu bertanda tangan. Kartu itu tak akan ditukar lagi.",
		"FIRMA EL CARTEL": "TTD POSTERNYA",
		"FIRMAS EN LA PARADA": "TTD DI HALTE",
		"Diez carteles firmados. Ésos no los arranca nadie.": "Sepuluh poster bertanda tangan. Tak ada yang berani mencopotnya.",
		"FIRMA LA PORTADA": "TTD SAMPUL INI",
		"FIRMAS EN LA TIENDA": "TTD DI TOKO GIM",
		"Diez portadas firmadas. Ésas no se revenden.": "Sepuluh sampul bertanda tangan. Tak akan dijual lagi.",
		"pluralASISTENCIA": ["ASSIST", "ASSIST"],
		"pluralA PUERTA": ["TEPAT SASARAN", "TEPAT SASARAN"],
		"pluralREGATE": ["DRIBEL", "DRIBEL"],
		"pluralPÉRDIDA": ["BOLA HILANG", "BOLA HILANG"],
		"pluralFALTA RECIBIDA": ["DILANGGAR", "DILANGGAR"],


		"pluralFIJADO": ["DIKUNCI", "DIKUNCI"],
		"pluralVETADO": ["DICORET", "DICORET"],

		"pluralJORNADA": ["PEKAN", "PEKAN"],
		"pluraljornada": ["pekan", "pekan"],
		"pluralPUNTO": ["POIN", "POIN"],
		"pluralsemana": ["minggu", "minggu"],
		"pluraldía": ["hari", "hari"],
		"pluralclub": ["klub", "klub"],
		"pluraloferta": ["tawaran", "tawaran"],
		"pluralpatrocinador": ["sponsor", "sponsor"],
		"pluralquiere": ["ingin", "ingin"],
		"pluraltemporada": ["musim", "musim"],
		"pluraljugador": ["pemain", "pemain"],
		"pluralrival": ["lawan", "lawan"],
		"pluralpar": ["pasang", "pasang"],
		"pluralcompañero": ["rekan setim", "rekan setim"],
		"pluralgol": ["gol", "gol"],
		"pluralasistencia": ["assist", "assist"],
		"pluralAÑO": ["THN", "THN"],
		"pluralSEMANA": ["MINGGU", "MINGGU"],
		"pluralDÍA": ["HARI", "HARI"],
		"pluralpartido": ["laga", "laga"],
		"pluralPARTIDO": ["LAGA", "LAGA"],

		"pluralGOL": ["GOL", "GOL"],
		"pluralTEMPORADA": ["MUSIM", "MUSIM"],
		"pluralPARADA": ["SAVE", "SAVE"],
		"pluralfichaje": ["transfer", "transfer"],
		"pluralescudo": ["lambang", "lambang"],
		"pluralcompeticion": ["kompetisi", "kompetisi"],
		"pluralestadio": ["stadion", "stadion"],
		"pluralderbi": ["derbi", "derbi"],
		"pluraltécnico": ["pelatih", "pelatih"],
		"pluraltécnico sin equipo": ["pelatih tanpa klub", "pelatih tanpa klub"],
		"pluralseleccionador": ["pelatih timnas", "pelatih timnas"],
		"pluralcara de leyenda": ["wajah legenda", "wajah legenda"],
	},










	"guias": {
		"Tu equipo: quién sale hoy, quién descansa y quién te compite el puesto.": "Timmu: siapa main hari ini, siapa istirahat, dan siapa yang bersaing denganmu merebut tempat.",
		"PARA QUÉ SIRVEN": "FUNGSINYA",
		"Ninguna barra es adorno. El técnico y el vestuario deciden si juegas; la afición y la prensa, cuánto vales y qué marcas te buscan; el agente, cuántas ofertas ves.": "Tak ada bar yang sekadar hiasan. Pelatih dan ruang ganti menentukan kamu main atau tidak; suporter dan pers, berapa nilaimu dan merek mana yang mengincarmu; agenmu, berapa banyak tawaran yang kamu lihat.",
		"EL VESTUARIO TE DA EL BALÓN": "RUANG GANTI MENGUMPANMU",
		"No es simpatía: con el vestuario hundido te llegan MENOS ocasiones por partido, y con él alto, una o dos más.": "Bukan soal akrab: kalau ruang ganti hancur kamu dapat LEBIH SEDIKIT peluang per laga, dan kalau tinggi, satu atau dua lebih banyak.",
		"LA GRADA JUEGA": "TRIBUN MAIN",
		"Con la afición por los suelos, el estadio te arruina jugadas. Con la afición contigo, apuntas más fino.": "Kalau suporter di titik terendah, stadion menggagalkan peluangmu. Kalau suporter bersamamu, bidikanmu makin tajam.",
		"SUBEN Y BAJAN": "NAIK TURUN",
		"Quien te reclama esta semana mueve su barra según lo que contestes. Y todas tiran hacia el medio cada temporada: lo alto cae rápido, lo bajo sube despacio.": "Yang meminta bantuanmu minggu ini menggeser barnya sesuai jawabanmu. Dan semuanya ditarik ke tengah tiap musim: yang tinggi turun cepat, yang rendah naik pelan.",
		"Quién te quiere, cuánto pagan y qué te ofrece cada club. Sólo se mueve en sus dos ventanas: verano e invierno.": "Siapa yang mengincarmu, berapa bayarannya, dan apa tawaran tiap klub. Hanya bergerak di dua bursa: musim panas dan musim dingin.",
		"QUIÉN PUEDE FICHARTE": "YANG BISA MEREKRUTMU",
		"Hay dos vetos: un grande no ficha a quien no le da el nivel, y un modesto no puede pagarte. Por eso no te llama todo el mundo.": "Ada dua pembatas: klub besar tak merekrut pemain di bawah levelnya, dan klub kecil tak sanggup membayarmu. Makanya tidak semua klub menelepon.",
		"LO QUE VALES": "NILAIMU",
		"Cuatro cosas: lo que sabes hacer, tu puesto, lo que llevas hecho esta temporada y lo que la gente sabe de ti. Y la edad manda: de joven multiplica, y desde los 28 pierdes casi un cuarto cada año.": "Empat hal: apa yang bisa kamu lakukan, posisimu, apa yang sudah kamu capai musim ini, dan apa yang orang tahu tentangmu. Umur menentukan: saat muda nilainya berlipat, dan sejak umur 28 kamu kehilangan hampir seperempat tiap tahun.",
		"TU AGENTE ABRE PUERTAS": "AGENMU BUKA PINTU",
		"Su nivel decide CUÁNTAS ofertas ves, y ayuda a arrancarle más sueldo al club. Por eso cobra.": "Levelnya menentukan BERAPA BANYAK tawaran yang kamu lihat, dan membantu memeras gaji lebih besar dari klub. Untuk itulah dia dibayar.",
		"Puedes pedir salir o irte cedido. Al club no le gusta que se lo pidan.": "Kamu bisa minta pergi atau dipinjamkan. Klub tidak suka diminta begitu.",
		"EL ÁRBITRO PITA": "PELUIT WASIT",
		"TU PLANTEL": "SKUADMU",
		"El once de hoy sobre la cancha y, debajo, quién descansa. Es una foto: el once lo pone el técnico, no tú.": "Sebelas pemain hari ini di lapangan dan, di bawahnya, siapa yang istirahat. Ini cuma potret: pelatih yang memilih susunan pemain, bukan kamu.",
		"LA ENERGÍA MANDA": "ENERGI PENENTU",
		"Tus compañeros se cansan y el técnico los rota: la cancha, la banca y los que no viajan son los del PRÓXIMO partido, no una lista fija. FRESCO, EN FORMA y CARGADO dicen cómo llega cada uno.":
			"Rekan setimmu lelah dan pelatih merotasi mereka: lapangan, cadangan, dan yang tak ikut berangkat adalah untuk laga BERIKUTNYA, bukan daftar tetap. SEGAR, PRIMA, dan BERAT menunjukkan kondisi tiap orang.",
		"TU COMPETENCIA": "SAINGANMU",
		"Arriba, tú contra el que juega en tu puesto: la raya blanca es lo que el club pide para ese sitio. Debajo, de qué depende que salgas — tus cualidades, el técnico y tu racha.":
			"Di atas, kamu melawan yang bermain di posisimu: garis putih adalah yang diminta klub untuk posisi itu. Di bawah, apa yang menentukan kamu main: kemampuanmu, pelatih, dan tren performamu.",
		"TU HABILIDAD": "SKILLMU",
		"Tus diez cualidades. Las ocho de arriba deciden cómo te sale el balón; las dos de abajo son tu especialidad.": "Sepuluh atributmu. Delapan di atas menentukan bagaimana bola keluar dari kakimu; dua di bawah adalah spesialisasimu.",
		"LA ESPECIALIDAD": "SPESIALISASI",
		"Penales y balón parado NO suben tu media: te hacen el lanzador del equipo. Es una elección de estilo, no un atajo.": "Penalti dan bola mati TIDAK menaikkan OVR-mu: keduanya menjadikanmu eksekutor tim. Ini pilihan gaya, bukan jalan pintas.",
		"LOS PUNTOS": "POIN",
		"Al subir de nivel ganas puntos. Se gastan con el más de cada fila, y mientras no salgas de la pantalla puedes deshacer.": "Naik level memberimu poin. Dipakai lewat tanda plus di tiap baris, dan selama belum keluar dari layar kamu bisa mengurungkannya.",
		"LOS DESPACHOS": "KANTOR KLUB",
		"Aquí se trata con el club fuera de la cancha: cuánto te escuchan y a quién te traen.": "Di sini kamu berurusan dengan klub di luar lapangan: seberapa kamu didengar dan siapa yang mereka datangkan untukmu.",
		"CUÁNTO TE ESCUCHAN": "SEBERAPA DIDENGAR",
		"Seis niveles, y cada uno te deja pedir más. Los sube tu relación (técnico, vestuario, años, afición y títulos aquí) y se revisan en invierno y en verano. Toca uno: verás qué pide y qué da.": "Enam level, dan tiap level membolehkanmu meminta lebih. Dinaikkan oleh relasimu (di sini pelatih, ruang ganti, tahun bermain, suporter dan gelar), dan ditinjau tiap musim dingin dan musim panas. Ketuk salah satu untuk melihat apa yang diminta dan diberikan.",
		"LA MESA DE FICHAJES": "DAFTAR TRANSFER",
		"Con la ventana abierta marcas a quién vendes y a quién fichas, y el presupuesto se rehace con cada toque. Nada se mueve hasta que confirmas.": "Saat bursa buka, kamu tandai siapa yang dijual dan siapa yang direkrut, dan anggaran dihitung ulang tiap ketukan. Tak ada yang bergerak sampai kamu konfirmasi.",
		"LO QUE SE MUEVE": "KELUAR MASUK",
		"Son fichajes de verdad del mercado, no adorno: el que entra viene de un club real y por un precio.": "Ini transfer sungguhan dari bursa, bukan hiasan: yang datang berasal dari klub nyata dengan harga tertentu.",
		"EL MERCADO DE LOS DEMÁS": "BURSA ORANG LAIN",
		"Quién ficha por quién en todo el mundo, con lo que pagaron.": "Siapa pindah ke klub mana di seluruh dunia, beserta harganya.",
		"ORDÉNALO": "URUTKAN",
		"Las fichas de arriba ordenan por fecha, media o precio, y recortan a tu club, tu liga o el mundo.": "Chip di atas mengurutkan berdasarkan tanggal, OVR, atau harga, dan mempersempit ke klubmu, ligamu, atau dunia.",
		"EL MUNDO SIGUE": "DUNIA TERUS JALAN",
		"Lo que pasa en los partidos que no juegas. La liga vive aunque tú no estés.": "Apa yang terjadi di laga yang tidak kamu mainkan. Liga tetap hidup meski kamu tak ada.",
		"CAMBIA EL RECORTE": "GANTI CAKUPAN",
		"La etiqueta subrayada no es un título: se toca y va rotando entre tu club, tu liga y el mundo entero.": "Label bergaris bawah bukan judul: ketuk untuk berganti antara klubmu, ligamu, dan seluruh dunia.",
		"LO TUYO VA MARCADO": "BERITAMU DITANDAI",
		"Las noticias que te tocan llevan el borde de color, y sólo salen las últimas: esto es una portada, no un archivo.": "Berita yang menyangkutmu berbingkai warna, dan hanya yang terbaru yang tampil: ini halaman depan, bukan arsip.",
		"TU CONTRATO": "KONTRAKMU",
		"El trato que tienes con el club: tu rol, tu sueldo y hasta cuándo.": "Kesepakatanmu dengan klub: peranmu, gajimu, dan sampai kapan.",
		"LO QUE TE PIDEN": "TUNTUTAN",
		"El club te marca una meta del año. De cómo la lleves depende lo que te ofrezcan al renovar.": "Klub memberimu target tahun ini. Seberapa jauh kamu mencapainya menentukan tawaran saat perpanjangan.",
		"Se pide en AGENTE, junto a las ofertas. Lo que puedes pedir sale de cómo vienes jugando, no de lo que te gustaría.": "Permintaan diajukan di AGEN, di samping tawaran. Yang bisa kamu minta bergantung pada permainanmu selama ini, bukan pada keinginanmu.",
		"Tu cara y tu pelo, lo que llevas en la cancha y la ropa de calle, en tres pestañas.": "Wajah dan rambutmu, yang kamu pakai di lapangan, dan pakaian santai, dalam tiga tab.",
		"SE GUARDA SOLO": "AUTO-SIMPAN",
		"Cada toque queda guardado. Y lo que compres en TIENDA aparece aquí para ponértelo.": "Tiap ketukan tersimpan. Dan yang kamu beli di TOKO muncul di sini untuk dipakai.",
		"LAS BOTAS": "SEPATU",
		"Dan un bono a tu golpeo, y SE GASTAN con el uso: al agotarse dejan de dártelo.": "Memberi bonus pada tendanganmu, dan AUS karena dipakai: begitu habis, bonusnya hilang.",
		"PARA LA JORNADA": "HARI LAGA",
		"Lo que se consume: recuperarte, ponerte a punto y llegar mejor al siguiente partido.": "Barang habis pakai: untuk pulih, menajamkan form, dan tiba lebih baik di laga berikutnya.",
		"Se lleva una comisión de lo que ingresas, y otra al firmar. Es el precio de que alguien te mueva.": "Dia ambil komisi dari penghasilanmu, dan satu lagi saat kamu teken. Itulah harga punya orang yang mengurus kepindahanmu.",
		"Donde vives entre partidos. Subir de casa mejora cómo llegas al siguiente.": "Tempat tinggalmu di antara laga. Rumah yang lebih baik berarti kamu tiba lebih bugar di laga berikutnya.",
		"LA SEMANA": "PEKAN",
		"Lo que puedes hacer en casa esta semana, sin salir a ningún lado.": "Yang bisa kamu lakukan di rumah minggu ini, tanpa pergi ke mana-mana.",
		"El siguiente peldaño, con lo que cuesta y lo que da. Ojo: el descanso tiene techo, no se acumula sin fin.": "Anak tangga berikutnya, beserta biaya dan manfaatnya. Hati-hati: istirahat ada batasnya, tidak menumpuk tanpa akhir.",
		"Cada competición que juegas, por dentro: su tabla, su cuadro o su grupo, y quién lleva los goles.": "Tiap kompetisi yang kamu mainkan, dari dalam: klasemennya, bagannya atau grupnya, dan siapa top skornya.",
		"EL MUNDO ENTERO": "SELURUH DUNIA",
		"En la liga puedes viajar a otro país y a otra división: las tablas del planeta están aquí.": "Di liga kamu bisa pergi ke negara dan divisi lain: klasemen seluruh planet ada di sini.",
		"EL HISTORIAL": "RIWAYAT JUARA",
		"Quién ganó cada año. Tu nombre entra en esa lista si te lo ganas.": "Siapa juara tiap tahun. Namamu masuk daftar itu kalau kamu meraihnya.",
		"EL MERCADO": "BURSA",
		"SI NO JUEGAS": "KALAU TAK MAIN",
		"TU TEMPORADA": "MUSIMMU",
		"Todos tus partidos en el orden en que se juegan, con lo ya jugado y su resultado.": "Semua lagamu sesuai urutan main, beserta yang sudah dimainkan dan hasilnya.",
		"MIRA ADELANTE": "KE DEPAN",
		"Aquí se ve cuándo se te juntan liga, copa y selección: ésas son las semanas en que el cansancio pesa.": "Di sini terlihat kapan liga, piala, dan timnas menumpuk: itulah minggu-minggu saat lelah terasa.",
		"EL RANKING": "RANKING",
		"Los jugadores del planeta ordenados por su media, con la tuya dentro para compararte.": "Pemain seluruh planet diurutkan menurut OVR, dengan milikmu di dalamnya sebagai pembanding.",
		"ACÓTALO": "PERSEMPIT",
		"Se puede filtrar por puesto y por país: así se ve contra quién compites de verdad.": "Bisa difilter menurut posisi dan negara: dari situ kelihatan siapa saingan sejatimu.",
		"Los números de todo lo que llevas hecho: temporada a temporada y torneo por torneo.": "Angka dari semua yang sudah kamu lakukan: musim demi musim dan turnamen demi turnamen.",
		"Cada club por el que pasaste y lo que costó cada movimiento.": "Tiap klub yang pernah kamu singgahi dan berapa biaya tiap perpindahan.",
		"La curva de lo que vales: el termómetro de si vas subiendo o cayendo.": "Kurva nilaimu: termometer apakah kamu sedang naik atau turun.",
		"TU PUNTERÍA": "BIDIKANMU",
		"Desde dónde tiras y desde dónde te entra. Cada marca es un remate tuyo, no una media inventada, y la curva es el vuelo que tuvo ese balón.":
			"Dari mana kamu menembak dan dari mana bola masuk. Tiap tanda adalah tembakanmu, bukan rata-rata rekaan, dan kurvanya adalah lintasan terbang bola itu.",
		"El gol más lejano, el mejor acierto… lo que hiciste, no lo que crees que haces.": "Gol terjauh, akurasi terbaik… apa yang kamu lakukan, bukan yang kamu kira kamu lakukan.",
		"AÑO POR AÑO": "PER TAHUN",
		"Con las flechas se mira cualquier temporada ya cerrada.": "Dengan panah kamu bisa melihat musim mana pun yang sudah selesai.",
		"TU VITRINA": "LEMARIMU",
		"Lo que ya ganaste. Se queda para siempre y se ve también dentro de tu casa.": "Yang sudah kamu menangkan. Tersimpan selamanya dan terlihat juga di dalam rumahmu.",
		"LO QUE FALTA": "SISANYA",
		"Todo lo que existe por ganar, incluido lo que hoy te queda lejos.": "Semua yang bisa dimenangkan, termasuk yang hari ini masih jauh darimu.",
		"LA CASA POR DENTRO": "DALAM KLUB",
		"Lo que tu club ganó antes de que llegaras, y quiénes lo hicieron.": "Yang dimenangkan klubmu sebelum kamu datang, dan siapa yang meraihnya.",
		"LOS DE SIEMPRE": "SEPANJANG MASA",
		"Los máximos goleadores de la casa. Ahí es donde hay que meterse.": "Top skor klub sepanjang masa. Daftar itulah yang harus kamu tembus.",
		"LAS LEYENDAS": "LEGENDA",
		"Los grandes del juego, por liga y por club. Son la vara con la que se te mide.": "Para bintang besar sepak bola, per liga dan per klub. Merekalah tolok ukur yang dipakai untuk menilaimu.",
		"TU SITIO": "TEMPATMU",
		"Con los años, tu nombre aparece en estas listas. Eso es el legado.": "Seiring tahun, namamu muncul di daftar ini. Itulah legacy.",
		"EL JUGADOR DEL AÑO": "PEMAIN TERBAIK",
		"Quién lo ganó cada año y con qué números. Si no lo ganas tú, lo gana alguien.": "Siapa yang memenangkannya tiap tahun dan dengan angka berapa. Kalau bukan kamu, orang lain yang menang.",
		"CÓMO SE GANA": "CARA MENANG",
		"Lo que pesa en la votación. Meter goles es una parte, no toda.": "Apa yang berbobot dalam pemungutan suara. Mencetak gol hanya sebagian, bukan segalanya.",
		"ESTE AÑO": "TAHUN INI",
		"Cómo va la votación ahora mismo, contigo dentro si andas cerca.": "Klasemen suara saat ini, termasuk kamu kalau kamu dekat.",
		"EL PARTIDO": "LAGA",
		"Tu equipo, el rival y el minuto. Un partido no se juega de corrido: se juega por OCASIONES, y cada una es tuya.": "Timmu, lawan, dan menit. Laga tidak dimainkan terus-menerus: dimainkan per PELUANG, dan tiap peluang milikmu.",
		"A QUIÉN LLEVAS": "KENDALIMU",
		"El jugador que controlas ahora. Un pase FUERA del área te pasa el mando al que lo recibe; dentro del área remata él de primera y no hay relevo.": "Pemain yang kamu kendalikan saat ini. Umpan yang berakhir DI LUAR kotak penalti memindahkan kendali ke penerimanya; di dalam kotak dia langsung menembak dan tak ada pergantian kendali.",
		"TU NOTA": "RATINGMU",
		"Sube y baja con cada cosa que haces. Es la nota con la que el técnico te juzga, y la que decide tu temporada.": "Naik turun mengikuti semua yang kamu lakukan. Itu rating yang dipakai pelatih untuk menilaimu, dan yang menentukan musimmu.",
		"EL VIENTO": "ANGIN",
		"Hacia dónde sopla y cuánto. El balón se va con él: cuéntalo al apuntar o el centro se te pasa largo.": "Ke mana arahnya dan sekencang apa. Bola ikut terbawa: hitung saat membidik atau umpan silangnya terlalu jauh.",
		"EL PARTIDO SE INCLINA": "MOMENTUM BERGESER",
		"Cuando tu equipo se enciende, el rival marca menos entre tus jugadas. Cuando se enfría, aprieta él. Lo verás avisado.": "Saat timmu menyala, lawan lebih jarang mencetak gol di antara peluangmu. Saat dingin, mereka menekan. Kamu akan diberi tahu.",
		"FUERA DE LUGAR": "OFFSIDE",
		"Cuando salió el pase, el que lo recibió estaba más cerca del arco que el balón y que el penúltimo rival (el portero cuenta): el abanderado levanta y la jugada se anula. A la altura, en juego.": "Saat umpan dilepas, penerimanya lebih dekat ke gawang daripada bola dan lawan kedua terakhir (kiper dihitung): hakim garis mengangkat bendera dan serangan dibatalkan. Kalau sejajar, tidak offside.",
		"El árbitro pita lo que ve. No siempre a tu favor: también te la pitan a ti.": "Wasit meniup apa yang dia lihat. Tak selalu menguntungkanmu: kamu juga bisa kena peluit.",
		"TARJETA": "KARTU",
		"Queda anotada. La amarilla es un aviso; una roja te deja fuera de los próximos partidos de ese torneo, y ahí no se juega ni se entrena: se espera.": "Tercatat. Kuning adalah peringatan; merah membuatmu absen di laga berikutnya di kompetisi itu, dan di situ kamu tidak main dan tidak latihan: kamu menunggu.",
		"AHORA LLEVAS A OTRO": "KENDALI BERPINDAH",
		"Diste el pase y el mando saltó al que la recibió. Termina tú la jugada: si él vuelve a pasar, el mando se queda contigo.": "Kamu memberi umpan dan kendali berpindah ke penerimanya. Selesaikan sendiri serangannya: kalau dia mengumpan lagi, kendali tetap padamu.",
		"Desperdiciar ocasiones SEGUIDAS con la nota por los suelos te saca del partido. Si el técnico confía en ti te compra una más, pero no muchas.": "Menyia-nyiakan peluang BERUNTUN dengan rating anjlok membuatmu ditarik keluar. Kalau pelatih percaya padamu, dia beri satu lagi, tapi tak banyak.",
		"CÓMO SE JUEGA": "CARA MAIN",
		"TUS PASES": "UMPANMU",
		"TUS REGATES": "DRIBELMU",
		"Asistencia": "Assist",
		"Acabó en remate": "Berujung tembakan",
		"Sin remate": "Tanpa tembakan",
		"Por donde pisaste": "Area jelajahmu",
		"Te la quitaron": "Direbut",
		"Falta a favor": "Dilanggar",
		" de {0}": " dari {0}",
		"EL BAR DE SIEMPRE": "BAR LANGGANAN",

		"GALA DEL CLUB": "GALA KLUB",
		"GALA DE LA LIGA": "GALA LIGA",
		"La liga te elige su mejor jugador de la temporada.": "Liga memilihmu sebagai pemain terbaik musim ini.",
		"El mejor de tu línea en toda la liga. El del año fue para {0}.": "Yang terbaik di liniamu di seluruh liga. Pemain terbaik musim ini diraih {0}.",
		"La liga eligió a {0}. El año que viene, la gala también es tuya.": "Liga memilih {0}. Tahun depan, gala juga bisa jadi milikmu.",
		"SUSPENDIDA": "BATAL",
		"GALA SUSPENDIDA": "GALA BATAL",
		"MEJOR DEFENSA": "BEK TOP",
		"MEJOR PORTERO": "KIPER TOP",
		"MEJOR MEDIO": "GELANDANG TOP",
		"MEJOR DELANTERO": "PENYERANG TOP",
		"MEJOR JUGADOR DE LA TEMPORADA": "PEMAIN TERBAIK MUSIM",
		"TROFEOS SUSPENDIDOS": "PENGHARGAAN BATAL",
		"puesto": "peringkat",
		"objetivos": "target",
		"Tu vestuario te eligió el mejor de la temporada.": "Ruang gantimu memilihmu sebagai yang terbaik musim ini.",
		"El mejor de tu línea. El del año fue para {0}.": "Yang terbaik di liniamu. Pemain terbaik musim ini diraih {0}.",
		"El vestuario eligió a {0}. La próxima gala se empieza a ganar en agosto.": "Ruang ganti memilih {0}. Gala berikutnya mulai dimenangkan sejak Agustus.",
		"El club bajó de categoría. La directiva suspende los premios del año por el mal rendimiento del equipo.": "Klub terdegradasi. Direksi membatalkan penghargaan tahun ini karena performa buruk tim.",
		"El club no cumplió ninguno de sus objetivos. La directiva suspende los premios del año por el mal rendimiento del equipo.": "Klub gagal memenuhi satu pun targetnya. Direksi membatalkan penghargaan tahun ini karena performa buruk tim.",
		"El club suspende sus premios del año por el mal rendimiento": "Klub membatalkan penghargaan tahun ini karena performa buruk",
		"Mejor (Club)": "Terbaik (Klub)",
		"Delantero (Club)": "Penyerang (Klub)",
		"Medio (Club)": "Gelandang (Klub)",
		"Defensa (Club)": "Bek (Klub)",
		"Mejor Jugador del Club": "Pemain Terbaik Klub",
		"Mejor Delantero del Club": "Penyerang Terbaik Klub",
		"Mejor Medio del Club": "Gelandang Terbaik Klub",
		"Mejor Defensa del Club": "Bek Terbaik Klub",
		"LA GUARDARON": "DISIMPAN",
		"tenías": "kamu berusia",
		"gol": "gol",
		"Alguien la enmarcó y la colgó. Nadie te lo dijo nunca.": "Seseorang membingkainya dan menggantungnya. Tak pernah ada yang memberitahumu.",
		"Sigue ahí. Ya casi nadie se acuerda de aquella tarde, pero sigue ahí.": "Masih di situ. Hampir tak ada yang ingat sore itu, tapi masih di situ.",
		"TU CELULAR": "PONSELMU",
		"Cada app es un recorte: tu club, tu liga, el mundo y tus redes, donde se contesta a quien te critica.": "Tiap aplikasi adalah potongan: klubmu, ligamu, dunia, dan media sosialmu, tempat kamu membalas yang mengkritikmu.",
	},












	"caja": {
		"CONSEGUIR DINERO": "DAPAT UANG",
		"CONSEGUIR PUNTOS": "DAPAT POIN",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu Apple ID.":
			"Ini dibayar dengan UANG ASLI, bukan uang game: ditagih ke Apple ID-mu.",
		"Lo que compres entra en esta carrera al instante.":
			"Yang kamu beli langsung masuk ke karier ini.",
		"DINERO REAL": "UANG ASLI",
		"DINERO DEL JUEGO": "UANG GAME",
		"LA CAJA": "TOP UP",
		"PUNTOS DE HABILIDAD": "POIN SKILL",
		"Se reparten a mano en TU JUGADOR. Un punto cuesta 1 por debajo de 80, 2 de 80 a 89 y 3 de 90 en adelante: cuanto mejor eres, menos rinde el paquete.":
			"Dibagi manual di PEMAINKU. Satu poin berharga 1 di bawah 80, 2 dari 80 sampai 89, dan 3 dari 90 ke atas: makin bagus kamu, makin sedikit hasil paketnya.",
		"+ {0} PUNTOS DE HABILIDAD": "+ {0} POIN SKILL",
		"EXTRA": "EXTRA",
		"COMPRA LISTA": "SUDAH DIBELI",
		"Se sumaron ${0} a tu carrera.": "${0} ditambahkan ke kariermu.",
		"Tienes {0} puntos nuevos para repartir en TU JUGADOR.":
			"Kamu punya {0} poin baru untuk dibagi di PEMAINKU.",
		"Ya lo tienes todo al máximo, así que los puntos entraron como {0} de experiencia.":
			"Semuanya sudah maksimal, jadi poinnya masuk sebagai {0} XP.",
		"Se registró tu compra. Si no ves lo que compraste, cierra y vuelve a abrir el juego.":
			"Pembelianmu tercatat. Kalau tak terlihat, tutup lalu buka game lagi.",
		"PRIMA DE PARTIDO": "BONUS LAGA",
		"Para lo que te falta hoy: unas botas, o el gel y la bebida antes del derbi.":
			"Untuk yang kurang hari ini: sepasang sepatu, atau gel dan minuman sebelum derby.",
		"BONO DE CONTRATO": "BONUS KONTRAK",
		"El deportivo, o unas botas de las buenas con repuesto para toda la temporada.":
			"Mobil sport, atau sepatu bagus dengan cadangan untuk satu musim penuh.",
		"Alcanza para el preparador físico, o para subir de escalón con tu agente.":
			"Cukup untuk pelatih fisik, atau naik satu tingkat dengan agenmu.",
		"TRASPASO RÉCORD": "TRANSFER REKOR",
		"La clínica y el analista de vídeo, de una sentada.":
			"Klinik dan analis video, sekaligus.",
		"El agente que te sienta con los grandes de Europa, pagado de golpe.":
			"Agen yang mempertemukanmu dengan klub-klub terbesar Eropa, dibayar lunas.",
		"SESIÓN EXTRA": "SESI EKSTRA",
		"Cuatro niveles de golpe. Para rematar la habilidad que traes a medias.":
			"Empat level sekaligus. Untuk menuntaskan skill yang baru setengah jalan.",
		"Sube una habilidad entera de 60 a 85, o reparte donde más duela.":
			"Naikkan satu skill penuh dari 60 ke 85, atau bagi di mana paling perlu.",
		"Una habilidad de 60 a 99, y todavía sobra para empezar la siguiente.":
			"Satu skill dari 60 ke 99, dan masih sisa untuk memulai yang berikutnya.",
		"TALENTO GENERACIONAL": "BAKAT LANGKA",
		"Trescientos puntos. Casi la mitad de todo lo que se puede subir en una carrera.":
			"Tiga ratus poin. Hampir setengah dari semua yang bisa dinaikkan dalam satu karier.",







		"TODAS LAS VENTAJAS": "SEMUA PERK",
		"Abre de golpe la vitrina entera de NUEVA CARRERA+, sin esperar a sus logros.":
			"Membuka seluruh lemari KARIER BARU+ sekaligus, tanpa menunggu prestasinya.",
		"PARA SIEMPRE": "SELAMANYA",
		"{0} VENTAJAS": "{0} PERK",


		"DOBLE PAGA": "GAJI GANDA",
		"Sueldo, primas y patrocinios ×2 en todas tus carreras, las de hoy y las que vengan.":
			"Gaji, bonus, dan sponsor ×2 di semua kariermu, yang sekarang dan yang akan datang.",
		"Activa: cobras el doble en cada partido y en cada cierre.":
			"Aktif: kamu dibayar dua kali lipat tiap laga dan tiap akhir musim.",
		"TODAS TUS CARRERAS": "SEMUA KARIERMU",
		"PAGO ÚNICO": "SEKALI BAYAR",
		"COBRA ×2": "GAJI ×2",


		"DOBLE XP": "XP GANDA",
		"La XP de cada partido ×2 en todas tus carreras, las de hoy y las que vengan.":
			"XP tiap laga ×2 di semua kariermu, yang sekarang dan yang akan datang.",
		"Activa: ganas el doble de XP en cada partido.":
			"Aktif: kamu dapat XP dua kali lipat tiap laga.",
		"GANA XP ×2": "XP ×2",


		"PACK LEYENDA": "PAKET LEGENDA",
		"DOBLE PAGA y DOBLE XP juntos, en todas tus carreras, las de hoy y las que vengan.":
			"GAJI GANDA dan XP GANDA sekaligus, di semua kariermu, yang sekarang dan yang akan datang.",
		"Activa: cobras el doble y ganas el doble de XP en cada partido.":
			"Aktif: kamu dibayar dua kali lipat dan dapat XP dua kali lipat tiap laga.",
		"LOS DOS ×2": "SEMUA ×2",
		"PAGA": "GAJI",
		"XP": "XP",
		"AHORRO": "HEMAT",
		"CUARTA RANURA": "SLOT KEEMPAT",
		"Una cuarta ranura en la portada, para llevar otra carrera a la vez.":
			"Slot keempat di layar judul, untuk menjalankan karier lain sekaligus.",
		"Activa: tu portada tiene cuatro ranuras.": "Aktif: layar judulmu punya empat slot.",
		"ABRE LA CUARTA": "BUKA SLOT 4",
		"RANURA": "SLOT",
		"A LA VEZ": "BARENG",
		"HITOS": "PENCAPAIAN",
		"Tus {0} ventajas siguen entrando en cada carrera nueva.":
			"{0} perk-mu tetap masuk ke tiap karier baru.",
		"Se abren todas de golpe en NUEVA CARRERA+, y también las que se añadan después.":
			"Semuanya terbuka sekaligus di KARIER BARU+, termasuk yang ditambahkan kemudian.",
		"No marca ningún logro: tu palmarés sigue siendo lo que jugaste.":
			"Tidak menandai prestasi apa pun: palmaresmu tetap apa yang benar-benar kamu mainkan.",
		"Se paga una vez y queda en tu Apple ID: vale para las 3 ranuras y para cada carrera nueva.":
			"Dibayar sekali dan terikat ke Apple ID-mu: berlaku untuk 3 slot dan setiap karier baru.",
		"Listo: ya están abiertas todas. Las eliges al empezar una carrera nueva, en TUS VENTAJAS.":
			"Beres: semuanya sudah terbuka. Kamu memilihnya saat memulai karier baru, di PERKMU.",
		"COMPRAS": "PEMBELIAN",
		"¿Reinstalaste el juego o cambiaste de teléfono? Recupera aquí lo que ya pagaste con este Apple ID.":
			"Pasang ulang game atau ganti HP? Pulihkan di sini apa yang sudah kamu bayar dengan Apple ID ini.",
		"RESTAURAR COMPRAS": "PULIHKAN BELIAN",
		"RESTAURANDO": "MEMULIHKAN",
		"Listo: ya recuperaste lo que habías comprado con este Apple ID.":
			"Beres: pembelianmu dengan Apple ID ini sudah pulih.",
		"Este Apple ID no tiene compras que recuperar en Football Legacy.":
			"Apple ID ini tak punya pembelian untuk dipulihkan di Football Legacy.",

		"PACK DOBLE": "PAKET GANDA",
		"Las dos monedas en una compra, y sale mejor que por separado.":
			"Dua mata uang dalam satu pembelian, dan lebih hemat daripada beli terpisah.",





		"POSTE": "TIANG",
		"TU {0}%": "KAMU {0}%",
		"RIVAL {0}%": "LAWAN {0}%",
		"subMANTEN": "TAHAN",
		"subPEDIDO": "MINTA",
		"subAGUANTA": "TETAP",
		"subFUERA": "OUT",
		"subLESIONADO": "CEDERA",
		"Subirla cuesta 1 punto y tienes {0}.": "Menaikkannya butuh 1 poin dan kamu punya {0}.",
		"Subirla cuesta {0} puntos y tienes {1}.": "Menaikkannya butuh {0} poin dan kamu punya {1}.",
	},

	"casa_pack_2": {
		"COLCHÓN DE ESTIRAMIENTOS": "MATRAS PEREGANGAN",
		"Rutina corta de movilidad: recupera energía y un punto de ánimo.": "Rutinitas mobilitas singkat: memulihkan energi dan satu poin moral.",
		"Zona de movilidad para soltar piernas. Su rutina da energía y ánimo.": "Area mobilitas untuk melemaskan kaki. Rutinitasnya memberi energi dan moral.",
		"MÁQUINA DE RESPIRACIÓN": "MESIN PERNAPASAN",
		"Respiración guiada para centrarte. Da ánimo y confianza con el técnico.": "Pernapasan terpandu untuk memusatkan diri. Memberi moral dan kepercayaan dari pelatih.",
		"Cabina de respiración guiada para bajar pulsaciones antes de competir.": "Bilik pernapasan terpandu untuk menurunkan detak jantung sebelum bertanding.",
		"PANEL DE OBJETIVOS": "PAPAN TARGET",
		"Metas, notas y hábitos de temporada para vestir la pared.": "Target, catatan, dan kebiasaan musim untuk menghias dinding.",
		"Panel de objetivos y hábitos. Decora la pared y ordena tu semana.": "Papan target dan kebiasaan. Menghias dinding dan menata minggumu.",
		"BAR SALUDABLE": "BAR SEHAT",
		"Jugos, agua mineral y snacks medidos: recupera energía sin salir.": "Jus, air mineral, dan camilan terukur: memulihkan energi tanpa keluar rumah.",
		"Bar de jugos, agua mineral y snacks. Recupera un poco de energía.": "Bar jus, air mineral, dan camilan. Memulihkan sedikit energi.",
		"LÁMPARA SOLAR": "LAMPU SURYA",
		"Luz cálida de ambiente para que los rincones se sientan habitados.": "Cahaya hangat yang bikin sudut ruangan terasa berpenghuni.",
		"Luz cálida de ambiente. No da bonus, pero levanta mucho el rincón.": "Cahaya hangat. Tanpa bonus, tapi sudut ruangan jadi jauh lebih hidup.",
		"ESTIRAR EN CASA": "REGANG DI RUMAH",
		"Hasta +4 de energía y +1 de ánimo. Una acción semanal.": "Hingga +4 energi dan +1 moral. Satu aksi mingguan.",
		"RESPIRAR Y ENFOCAR": "NAPAS & FOKUS",
		"+1 de ánimo y +1 con el técnico si aún hay margen. Una acción semanal.": "+1 moral dan +1 dengan pelatih bila masih ada ruang. Satu aksi mingguan.",
		"HIDRATARSE BIEN": "MINUM CUKUP",
		"Hasta +4 de energía. Una acción semanal.": "Hingga +4 energi. Satu aksi mingguan.",
	},




















	"aspecto": {

		"Corte César": "Potongan Caesar",
		"Coleta": "Kuncir ekor kuda",
		"Coleta alta": "Kuncir tinggi",
		"Calvicie en coronilla": "Botak di ubun-ubun",
		"Dos trenzas": "Dua kepang",
		"Flat top": "Flat top",
		"Flequillo": "Poni",
		"Corte hongo": "Potongan mangkuk",
		"Pelo largo": "Rambut panjang",
		"Melena a la mandíbula": "Bob sepanjang rahang",
		"Moño": "Sanggul",
		"Mullet rizado": "Mullet keriting",
		"Peinado hacia atrás": "Sisir ke belakang",
		"Raya al lado": "Belah samping",
		"Rizado": "Keriting",
		"Semicalvo": "Setengah botak",
		"Trenzas pegadas": "Cornrow",
		"Trenzas largas sueltas": "Kepang panjang lepas",
		"Tupé": "Quiff",
		"Undercut": "Undercut",

		"French crop texturizado": "French crop bertekstur",
		"Crop con degradado alto": "Crop fade tinggi",
		"Crew cut": "Crew cut",
		"Buzz con degradado": "Buzz dengan fade",
		"Tupé corto": "Quiff pendek",
		"Raya lateral corta": "Belah samping pendek",
		"Edgar con fleco recto": "Edgar, poni lurus",
		"Crop rizado": "Crop keriting",
		"Ivy League": "Ivy League",
		"Ondas cortas con degradado": "Gelombang pendek, fade",
		"Fleco de cortina largo": "Poni tirai panjang",
		"Wolf cut suave": "Wolf cut lembut",
		"Mullet moderno": "Mullet modern",
		"Rizos sueltos": "Ikal lepas",
		"Rastas recogidas arriba": "Dreadlock diikat ke atas",
		"Rastas hacia un lado": "Dreadlock ke satu sisi",
		"Trenzas pegadas con diseños": "Cornrow bermotif",
		"Twists cortos": "Twist pendek",
		"Melena ondulada": "Rambut bergelombang",
		"Capas despeinadas": "Layer acak-acakan",
		"Media coleta": "Setengah kuncir",
		"Rastas cortas": "Dreadlock pendek",
		"Rastas con degradado": "Dreadlock dengan fade",
		"Rastas a la mandíbula": "Dreadlock sepanjang rahang",
		"Rastas largas sueltas": "Dreadlock panjang lepas",
		"Rastas gruesas": "Dreadlock tebal",
		"Fleco recto": "Poni lurus",
		"Fleco irregular": "Poni acak",
		"Fleco diagonal": "Poni miring",
		"Fleco de cortina": "Poni tirai",
		"Fleco ondulado": "Poni bergelombang",

		"Barba cuadrada": "Jenggot kotak",
		"Barba redondeada": "Jenggot bulat",
		"Barba trenzada": "Jenggot kepang",
		"Bigote de puntas curvadas": "Kumis melengkung",
		"Bigote fino": "Kumis tipis",
		"Bigote chevrón": "Kumis chevron",
		"Chiva larga": "Jenggot kambing panjang",
		"Bigote herradura": "Kumis tapal kuda",
		"Barba larga": "Jenggot panjang",
		"Bigote morsa": "Kumis walrus",
		"Patillas unidas al bigote": "Cambang menyambung kumis",
		"Perilla": "Jenggot dagu",
		"Barba sin bigote": "Jenggot tanpa kumis",
		"Barba de tres días": "Brewok tipis",

		"Arqueadas": "Melengkung",
		"Caídas": "Turun",
		"Con cortes": "Bercelah",
		"Finas": "Tipis",
		"Inclinadas": "Miring",
		"Naturales": "Alami",
		"Pobladas": "Lebat",

		"Altas": "Tinggi",
		"Unidas": "Menyatu",
		"Cortas": "Pendek",
		"Largas": "Panjang",
		"Puntiagudas": "Runcing",
		"Una levantada": "Satu naik",
		"Furiosas": "Garang",
		"Muy pobladas": "Sangat lebat",
		"Rectas gruesas": "Lurus tebal",
		"Despeinadas": "Berantakan",
		"Cuadradas": "Kotak",
		"Gruesas arqueadas": "Tebal melengkung",


		"Crop": "Crop",
		"Cesar": "Caesar",
		"Crew": "Crew",
		"Bun": "Bun",
		"Zigzag": "Zigzag",
		"Rombos": "Wajik",
		"Espiga": "Tulang ikan",
		"Malla": "Jaring",
		"Entrenamiento": "Latihan",
		"Lujo": "Mewah",
		"Ninguna": "Tak ada",
		"Varsity": "Varsity",
		"Gabardina": "Trench coat",
		"Acolchada": "Puffer",
		"Gimnasio": "Gym",
		"Streetwear": "Streetwear",
		"Retro": "Retro",
		"Invierno": "Musim dingin",
		"Vaquero": "Koboi",
		"Playero": "Hari pantai",
		"Rockero": "Rocker",
		"Urbano": "Urban",
		"Día de nieve": "Hari bersalju",
		"Festival": "Festival",
		"Llegada al estadio": "Tiba di stadion",
		"Aeropuerto": "Bandara",
		"Rueda de prensa": "Konferensi pers",
		"Terraza clásica": "Tribun klasik",
		"Usar": "Pakai",
		"Actualizar": "Perbarui",
		"Eliminar": "Hapus",
		"Bajas": "Rendah",
		"Villano": "Penjahat",
		"Doble corte": "Potongan ganda",
		"Escalón": "Bertingkat",
	},
	"paises": {
		"Afganistán": "Afganistan",
		"Albania": "Albania",
		"Alemania": "Jerman",
		"Andorra": "Andorra",
		"Angola": "Angola",
		"Anguila": "Anguilla",
		"Antigua y Barbuda": "Antigua & Barbuda",
		"Arabia Saudí": "Arab Saudi",
		"Argelia": "Aljazair",
		"Argentina": "Argentina",
		"Armenia": "Armenia",
		"Aruba": "Aruba",
		"Australia": "Australia",
		"Austria": "Austria",
		"Azerbaiyán": "Azerbaijan",
		"Bahamas": "Bahama",
		"Bangladés": "Bangladesh",
		"Barbados": "Barbados",
		"Baréin": "Bahrain",
		"Belice": "Belize",
		"Benín": "Benin",
		"Bermudas": "Bermuda",
		"Bielorrusia": "Belarus",
		"Bolivia": "Bolivia",
		"Bosnia y Herzegovina": "Bosnia & Herzegovina",
		"Botsuana": "Botswana",
		"Brasil": "Brasil",
		"Brunéi": "Brunei",
		"Bulgaria": "Bulgaria",
		"Burkina Faso": "Burkina Faso",
		"Burundi": "Burundi",
		"Bután": "Bhutan",
		"Bélgica": "Belgia",
		"Cabo Verde": "Tanjung Verde",
		"Camboya": "Kamboja",
		"Camerún": "Kamerun",
		"Canadá": "Kanada",
		"Catar": "Qatar",
		"Chad": "Chad",
		"Chequia": "Ceko",
		"Chile": "Chili",
		"China": "China",
		"China Taipéi": "Taipei China",
		"Chipre": "Siprus",
		"Colombia": "Kolombia",
		"Comoras": "Komoro",
		"Congo": "Kongo",
		"Corea del Norte": "Korea Utara",
		"Corea del Sur": "Korea Selatan",
		"Costa de Marfil": "Pantai Gading",
		"Costa Rica": "Kosta Rika",
		"Croacia": "Kroasia",
		"Cuba": "Kuba",
		"Curazao": "Curacao",
		"Dinamarca": "Denmark",
		"Dominica": "Dominika",
		"Ecuador": "Ekuador",
		"Egipto": "Mesir",
		"El Salvador": "El Salvador",
		"Emiratos Árabes": "UEA",
		"Eritrea": "Eritrea",
		"Escocia": "Skotlandia",
		"Eslovaquia": "Slowakia",
		"Eslovenia": "Slovenia",
		"España": "Spanyol",
		"Estados Unidos": "Amerika Serikat",
		"Estonia": "Estonia",
		"Esuatini": "Eswatini",
		"Etiopía": "Etiopia",
		"Filipinas": "Filipina",
		"Finlandia": "Finlandia",
		"Fiyi": "Fiji",
		"Francia": "Prancis",
		"Gabón": "Gabon",
		"Gales": "Wales",
		"Gambia": "Gambia",
		"Georgia": "Georgia",
		"Ghana": "Ghana",
		"Gibraltar": "Gibraltar",
		"Granada": "Grenada",
		"Grecia": "Yunani",
		"Guam": "Guam",
		"Guatemala": "Guatemala",
		"Guinea": "Guinea",
		"Guinea Ecuatorial": "Guinea Khatulistiwa",
		"Guinea-Bisáu": "Guinea-Bissau",
		"Guyana": "Guyana",
		"Haití": "Haiti",
		"Honduras": "Honduras",
		"Hong Kong": "Hong Kong",
		"Hungría": "Hungaria",
		"India": "India",
		"Indonesia": "Indonesia",
		"Inglaterra": "Inggris",
		"Irak": "Irak",
		"Irlanda": "Irlandia",
		"Irlanda del Norte": "Irlandia Utara",
		"Irán": "Iran",
		"Islandia": "Islandia",
		"Islas Caimán": "Kepulauan Cayman",
		"Islas Cook": "Kepulauan Cook",
		"Islas Feroe": "Kepulauan Faroe",
		"Islas Marianas del Norte": "Mariana Utara",
		"Islas Salomón": "Kepulauan Solomon",
		"Islas Turcas y Caicos": "Turks & Caicos",
		"Islas Vírgenes Británicas": "Kep. Virgin Britania",
		"Islas Vírgenes de EE.UU.": "Kep. Virgin AS",
		"Israel": "Israel",
		"Italia": "Italia",
		"Jamaica": "Jamaika",
		"Japón": "Jepang",
		"Jordania": "Yordania",
		"Kazajistán": "Kazakhstan",
		"Kenia": "Kenya",
		"Kirguistán": "Kirgizstan",
		"Kosovo": "Kosovo",
		"Kuwait": "Kuwait",
		"Laos": "Laos",
		"Lesoto": "Lesotho",
		"Letonia": "Latvia",
		"Liberia": "Liberia",
		"Libia": "Libya",
		"Liechtenstein": "Liechtenstein",
		"Lituania": "Lituania",
		"Luxemburgo": "Luksemburg",
		"Líbano": "Lebanon",
		"Macao": "Makau",
		"Macedonia del Norte": "Makedonia Utara",
		"Madagascar": "Madagaskar",
		"Malasia": "Malaysia",
		"Malaui": "Malawi",
		"Maldivas": "Maladewa",
		"Malta": "Malta",
		"Malí": "Mali",
		"Marruecos": "Maroko",
		"Mauricio": "Mauritius",
		"Mauritania": "Mauritania",
		"Moldova": "Moldova",
		"Mongolia": "Mongolia",
		"Montenegro": "Montenegro",
		"Montserrat": "Montserrat",
		"Mozambique": "Mozambik",
		"Myanmar": "Myanmar",
		"México": "Meksiko",
		"Namibia": "Namibia",
		"Nepal": "Nepal",
		"Nicaragua": "Nikaragua",
		"Nigeria": "Nigeria",
		"Noruega": "Norwegia",
		"Nueva Caledonia": "Kaledonia Baru",
		"Nueva Zelanda": "Selandia Baru",
		"Níger": "Niger",
		"Omán": "Oman",
		"Pakistán": "Pakistan",
		"Palestina": "Palestina",
		"Panamá": "Panama",
		"Papúa Nueva Guinea": "Papua Nugini",
		"Paraguay": "Paraguay",
		"Países Bajos": "Belanda",
		"Perú": "Peru",
		"Polonia": "Polandia",
		"Portugal": "Portugal",
		"Puerto Rico": "Puerto Riko",
		"RD Congo": "RD Kongo",
		"República Centroafricana": "Rep. Afrika Tengah",
		"República Dominicana": "Republik Dominika",
		"Ruanda": "Rwanda",
		"Rumanía": "Rumania",
		"Rusia": "Rusia",
		"Samoa": "Samoa",
		"Samoa Americana": "Samoa Amerika",
		"San Cristóbal y Nieves": "Saint Kitts & Nevis",
		"San Marino": "San Marino",
		"San Vicente y las Granadinas": "St. Vincent & Grenadines",
		"Santa Lucía": "Saint Lucia",
		"Santo Tomé y Príncipe": "Sao Tome & Principe",
		"Senegal": "Senegal",
		"Serbia": "Serbia",
		"Seychelles": "Seychelles",
		"Sierra Leona": "Sierra Leone",
		"Singapur": "Singapura",
		"Siria": "Suriah",
		"Somalia": "Somalia",
		"Sri Lanka": "Sri Lanka",
		"Sudáfrica": "Afrika Selatan",
		"Sudán": "Sudan",
		"Sudán del Sur": "Sudan Selatan",
		"Suecia": "Swedia",
		"Suiza": "Swiss",
		"Surinam": "Suriname",
		"Tahití": "Tahiti",
		"Tailandia": "Thailand",
		"Tanzania": "Tanzania",
		"Tayikistán": "Tajikistan",
		"Timor Oriental": "Timor Leste",
		"Togo": "Togo",
		"Tonga": "Tonga",
		"Trinidad y Tobago": "Trinidad & Tobago",
		"Turkmenistán": "Turkmenistan",
		"Turquía": "Turki",
		"Túnez": "Tunisia",
		"Ucrania": "Ukraina",
		"Uganda": "Uganda",
		"Uruguay": "Uruguay",
		"Uzbekistán": "Uzbekistan",
		"Vanuatu": "Vanuatu",
		"Venezuela": "Venezuela",
		"Vietnam": "Vietnam",
		"Yemen": "Yaman",
		"Yibuti": "Djibouti",
		"Zambia": "Zambia",
		"Zimbabue": "Zimbabwe",
	},

	"herencia": {
		"ESTRELLAS": "BINTANG",
		"KITS": "KIT",
		"VENTAJAS": "PERK",
		"COMPRAR": "BELI",
		"ABIERTA": "TERBUKA",
		"EL ALTA": "MULAI BARU",
		"DE SALIDA": "AWAL",
		"DE TU HERENCIA": "DARI WARISANMU",
		"SOLAR": "LAHAN",
		"TE ALCANZA": "KAMU MAMPU",
		"TE FALTAN {0} ★": "KURANG {0} ★",
		"BOTAS DE BARRIO": "SEPATU KAMPUNG",
		"REFUERZOS": "BOOSTER",
		"Vale en TODAS tus carreras, las de hoy y las que empieces.": "Berlaku di SEMUA kariermu, yang berjalan sekarang dan yang akan kamu mulai.",
		"Al empezar una carrera las eliges en el paso TUS VENTAJAS.": "Saat memulai karier, kamu memilihnya di langkah PERKMU.",
		"Lo que se compra aquí no se gana: se hereda. Cada ventaja entra sola en toda carrera nueva, hoy y siempre.": "Yang kamu beli di sini tidak diraih: diwariskan. Setiap perk masuk sendiri ke setiap karier baru, sekarang dan selamanya.",
		"En tu herencia: entra en toda carrera nueva.": "Di warisanmu: masuk ke setiap karier baru.",
		"Abierta por TODAS LAS VENTAJAS: en tu herencia, en toda carrera nueva.": "Terbuka lewat SEMUA PERK: ada di warisanmu, di setiap karier baru.",
		"Estrellas y la vitrina entera, con dinero real. Son de tu cuenta, no de una carrera: sobreviven a borrar ranuras.": "Bintang dan seluruh lemari perk, dengan uang asli. Milik akunmu, bukan satu karier: tetap ada meski slot dihapus.",
		"Elige una pieza. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "Pilih satu. Apa pun yang kamu beli di sini ikut denganmu di setiap karier, yang sekarang dan yang akan datang.",
		"Desde hoy va contigo en cada carrera, las de ahora y las que vengan. No se devuelve.": "Mulai hari ini ikut denganmu di setiap karier, yang sekarang dan yang akan datang. Tidak bisa dikembalikan.",
		"La vitrina entera, en tu herencia: las veinticuatro en toda carrera nueva.": "Seluruh lemari perk, di warisanmu: ke-24 perk masuk ke setiap karier baru.",
		"Ciento cincuenta estrellas: tu primera ventaja, la de nivel 1, sin esperar al primer retiro.": "Seratus lima puluh bintang: perk pertamamu, yang level 1, tanpa menunggu pensiun pertama.",
		"Toca una con cadenas y cómprala aquí mismo, con estrellas o con dinero real. Son tuyas para siempre: cada una entra sola en toda carrera nueva.": "Ketuk yang terkunci rantai dan beli langsung di sini, dengan bintang atau uang asli. Milikmu selamanya: masing-masing masuk sendiri ke setiap karier baru.",
		"Consigue más en LEGADO, desde el menú.": "Dapatkan lebih banyak di LEGACY, dari menu.",
		"CANTERA DE ORO": "AKADEMI EMAS",
		"Toda carrera nueva arranca con 65 en las ocho habilidades en vez de 60. Es un año de entrenamiento antes de debutar.": "Setiap karier baru mulai dengan 65 di kedelapan skill, bukan 60. Setara setahun latihan sebelum debut.",
		"LA CARTERA DEL ABUELO": "DOMPET KAKEK",
		"Diez mil de salida en toda carrera nueva, encima de los cinco mil de siempre. Para no vivir al día el primer año.": "Sepuluh ribu tambahan di awal setiap karier baru, di atas lima ribu yang biasa. Biar tahun pertama tidak pas-pasan.",
		"UN AGENTE QUE TE CONOCE": "AGEN YANG MENGENALMU",
		"EL SOLAR DE LA FAMILIA": "LAHAN KELUARGA",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} compradas · {3} gastadas": "Didapat dari setiap prestasi dan setiap pensiun: {0} dari prestasi · {1} dari pensiun · {2} dibeli · {3} dipakai",
		"No marca ningún logro: LOGROS y Game Center siguen contando sólo lo jugado.": "Tidak membuka prestasi apa pun: PRESTASI dan Game Center tetap hanya menghitung yang kamu mainkan.",
		"Pagas {0} ★ · te quedan {1} ★": "Kamu bayar {0} ★ · sisa {1} ★",
		"Este retiro deja {0} ★ en tu herencia · {1} ★ por gastar en el menú": "Pensiun ini menyisakan {0} ★ di warisanmu · {1} ★ siap dipakai dari menu",
		"Ventajas abiertas para tu próxima carrera: {0} de {1}": "Perk terbuka untuk karier berikutnya: {0} dari {1}",
		"Toda carrera nueva arranca con unas BARRIO 90 nuevas puestas en vez de las de cantera. Se gastan, como todas.": "Setiap karier baru mulai dengan BARRIO 90 baru, bukan sepatu akademi. Bisa aus, seperti semua sepatu.",
		"Tu agente empieza cada carrera creyendo en ti: llamadas y encargos desde el primer mes, no a media carrera.": "Agenmu memulai setiap karier dengan percaya padamu: telepon dan tugas sejak bulan pertama, bukan di tengah karier.",
		"Un terreno donde construir, en toda carrera nueva. El terreno sin la casa: lo que levantes encima lo pagas tú.": "Lahan untuk membangun, di setiap karier baru. Hanya tanahnya tanpa rumah: apa pun yang kamu dirikan di atasnya, kamu yang bayar.",
		"CONSEGUIR ESTRELLAS": "DAPATKAN BINTANG",
		"UN PUÑADO DE ESTRELLAS": "SEGENGGAM BINTANG",
		"REINICIAR PARTIDO": "ULANGI LAGA",
		"YA PAGADO": "SUDAH LUNAS",
		"La App Store no ha devuelto la ficha. Entra con conexión y vuelve a probar.": "App Store belum mengirim daftar produknya. Sambungkan ke internet lalu coba lagi.",
		"BRONCE": "BRONZE",
		"PLATA": "PERAK",
		"DIAMANTE": "BERLIAN",
		"BUEN TOQUE": "KAKI EMAS",
		"Le pegas con rosca desde niño: +4 de efecto desde el debut.": "Kamu sudah melengkungkan bola sejak kecil: +4 efek sejak debut.",
		"PULMONES": "NAPAS",
		"Ibas corriendo al colegio y de vuelta: +4 de físico desde el debut.": "Dulu kamu lari pulang-pergi ke sekolah: +4 fisik sejak debut.",
		"LOS AHORROS": "TABUNGAN",
		"La familia guardó para tu debut: veinticinco mil de salida en toda carrera nueva.": "Keluarga menabung untuk debutmu: dua puluh lima ribu di awal setiap karier baru.",
		"El vestuario te sigue antes de que abras la boca: el equipo nunca por debajo de 55.": "Ruang ganti mengikutimu sebelum kamu bicara: tim tak pernah di bawah 55.",
		"EL CEREBRO": "OTAK",
		"Ves la jugada antes que nadie: +6 de visión y +3 de precisión y efecto.": "Kamu melihat permainan lebih dulu dari siapa pun: +6 visi dan +3 akurasi dan efek.",
		"EL RELOJ DEL ABUELO": "JAM KAKEK",
		"Un reloj de lujo que ya era de la familia: la prensa te mira distinto desde el primer día.": "Jam mewah yang sudah ada di keluarga: pers memandangmu beda sejak hari pertama.",
		"SUPERDOTADO": "BERBAKAT",
		"Naciste para esto: 8 puntos de habilidad por repartir antes de debutar.": "Lahir untuk ini: 8 poin skill untuk dibagi sebelum debut.",
		"LA FORTUNA FAMILIAR": "HARTA KELUARGA",
		"Doscientos cincuenta mil de salida en toda carrera nueva. Nunca vas a vivir al día.": "Dua ratus lima puluh ribu di awal setiap karier baru. Kamu tak akan pernah pas-pasan.",
		"La vitrina entera, en tu herencia: todas en toda carrera nueva.": "Seluruh lemari perk, di warisanmu: semuanya masuk ke setiap karier baru.",

		"BAJO LOS FOCOS": "JADI SOROTAN",
		"CON PADRINO": "PUNYA KONEKSI",
		"LA DINASTIA": "DINASTI",
		"CUERPO DE ATLETA": "TUBUH ATLET",
		"PURO TALENTO": "BAKAT MURNI",
		"Llegas ya famoso: la grada te corea, la prensa te sigue y el seleccionador sabe tu nombre.": "Kamu datang sudah terkenal: tribun menyanyikan namamu, pers mengikutimu, dan pelatih timnas tahu namamu.",
		"Tu agente contesta, el vestuario te respeta y firmas el debut un rol más arriba.": "Agenmu mengangkat telepon, ruang ganti menghormatimu, dan kamu teken kontrak debut satu peran lebih tinggi.",
		"Naces con herencia: un cuarto de millón en el banco, el terreno del abuelo y la casa del viejo.": "Kamu lahir bergelimang warisan: seperempat juta di bank, lahan kakek, dan rumah ayah.",
		"Un cuerpo que no se rompe: piernas de niño, 20 % menos lesiones y fisio gratis toda la carrera.": "Tubuh yang tak mudah patah: kaki muda, cedera 20 % lebih sedikit, dan fisio gratis sepanjang karier.",
		"Naces crack: 65 en todo, ocho puntos por repartir y un disparo que asusta desde el primer partido.": "Lahir jadi bintang: 65 di semuanya, delapan poin untuk dibagi, dan tembakan yang menakutkan sejak laga pertama.",
		"PACKS": "PAKET",
		"COMPRAR PACK": "BELI PAKET",
		"TAMBIÉN TUYAS": "JUGA MILIKMU",
		"Cinco packs de tres ventajas. Cada una entra sola en toda carrera nueva, hoy y siempre.": "Lima paket berisi tiga perk. Masing-masing masuk sendiri ke setiap karier baru, sekarang dan selamanya.",
		"En tu herencia: sus tres ventajas entran en toda carrera nueva.": "Di warisanmu: ketiga perknya masuk ke setiap karier baru.",
		"YA TIENES {0} DE 3: con estrellas pagas sólo lo que te falta.": "SUDAH PUNYA {0} DARI 3: dengan bintang kamu hanya bayar yang kurang.",
		"Y {0} ventajas sueltas de antes, tuyas: entran igual en cada carrera.": "Plus {0} perk satuan lama, milikmu: tetap masuk ke setiap karier.",
		"Elige un pack. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "Pilih satu paket. Apa pun yang kamu beli di sini ikut denganmu di setiap karier, yang sekarang dan yang akan datang.",
		"Toca una con cadenas y compra su pack aquí mismo, con estrellas o con dinero real. Es tuyo para siempre: sus tres ventajas entran solas en toda carrera nueva.": "Ketuk yang terkunci rantai dan beli paketnya langsung di sini, dengan bintang atau uang asli. Milikmu selamanya: ketiga perknya masuk sendiri ke setiap karier baru.",
		"Las estrellas se ganan jugando: con cada logro y con cada retiro.": "Bintang didapat dengan bermain: lewat setiap prestasi dan setiap pensiun.",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} gastadas": "Didapat dari setiap prestasi dan setiap pensiun: {0} dari prestasi · {1} dari pensiun · {2} dipakai",

		"¡DOBLETE DE {0}!": "DUA GOL {0}!",
		"¡TERCERO DE {0}: HAT-TRICK!": "GOL KETIGA {0}: HAT-TRICK!",
		"¡CUATRO DE {0}! SÚPER HAT-TRICK": "EMPAT GOL {0}! LUAR BIASA",
		"¡CINCO DE {0}! LA MANITA": "LIMA GOL {0}! BRUTAL",
		"¡{1} GOLES DE {0}! DE LEYENDA": "{1} GOL {0}! LEGENDARIS",
		"¡OTRA ASISTENCIA DE {0}! VAN DOS": "ASSIST LAGI DARI {0}! SUDAH DUA",
		"¡TERCERA ASISTENCIA DE {0}!": "ASSIST KETIGA {0}!",
		"¡{1} ASISTENCIAS DE {0}!": "{1} ASSIST {0}!",
		"{0} YA LLEVA TRES PARADAS": "{0} SUDAH TIGA SAVE",
		"¡CINCO PARADAS DE {0}!": "LIMA SAVE {0}!",
		"¡{1} PARADAS! {0} ES UN MURO": "{1} SAVE! {0} BAGAI TEMBOK",
		"{0} YA TENÍA AMARILLA ({1}')": "{0} SUDAH KENA KUNING ({1}')",
		"¡OTRA ROJA! TU EQUIPO SE QUEDA CON NUEVE": "KARTU MERAH LAGI! TIMMU TINGGAL SEMBILAN",
		"¡OTRA ROJA! EL RIVAL SE QUEDA CON NUEVE": "KARTU MERAH LAGI! LAWAN TINGGAL SEMBILAN",
		"YA SON TRES AMARILLAS DE TU EQUIPO": "SUDAH TIGA KUNING UNTUK TIMMU",
		"YA SON TRES AMARILLAS DEL RIVAL": "SUDAH TIGA KUNING UNTUK LAWAN",
		"¡CINCO AMARILLAS DE TU EQUIPO!": "LIMA KUNING UNTUK TIMMU!",
		"¡CINCO AMARILLAS DEL RIVAL!": "LIMA KUNING UNTUK LAWAN!",
	},

	"salon_fama": {
		"SALÓN DE LA FAMA": "HALL OF FAME",
		"ESPERAN SU PLACA": "MENUNGGU PLAKAT",
		"TUS LEYENDAS": "LEGENDAMU",
		"Aún no hay placas. Cuando una carrera se retire, cuelga aquí su placa: su ranura queda libre para empezar otra y su historia se queda en este salón.": "Belum ada plakat. Saat sebuah karier pensiun, gantung plakatnya di sini: slotnya kosong untuk memulai yang lain dan kisahnya tetap di aula ini.",
		"RANURA {0} · RETIRADO": "SLOT {0} · PENSIUN",
		"Antes de colgarla, termina su despedida: entra en su carrera desde el menú.": "Sebelum menggantungnya, selesaikan perpisahannya: masuk ke kariernya dari menu.",
		"COLGAR SU PLACA": "GANTUNG PLAKAT",
		"¿COLGAR SU PLACA?": "GANTUNG PLAKAT?",
		"La carrera de {0} sale de la RANURA {1} y se queda en el SALÓN DE LA FAMA. La ranura queda libre para empezar otra.": "Karier {0} keluar dari SLOT {1} dan tinggal di HALL OF FAME. Slotnya kosong untuk memulai yang lain.",
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida y su museo se borran. Esto no se puede deshacer.": "Di hall tetap ada plakatnya: statistik, trofi, dan klub. Data game dan museumnya dihapus. Ini tidak bisa dibatalkan.",
		"No se pudo. La carrera sigue donde estaba.": "Gagal. Kariernya tetap di tempat semula.",
		"COLGAR MI PLACA": "GANTUNG PLAKAT",
		"Pieza de Museo": "Koleksi Museum",
		"Entrar por primera vez al museo de tu carrera.": "Masuki museum kariermu untuk pertama kali.",
	},

	"casa_legado": {
		"MESA DE PING-PONG": "MEJA PING-PONG",
		"VITRINA DEL CAPITÁN": "LEMARI KAPTEN",
		"POSADERO PARA LORO": "TENGGERAN NURI",
		"Mesa con red y palas. Juega al ping-pong contra un rival.": "Meja dengan net dan bet. Main ping-pong melawan seorang lawan.",
		"Tu capitanía bajo cristal. Conserva los nombramientos ganados.": "Jabatan kaptenmu di balik kaca. Menyimpan penunjukan yang kamu raih.",
		"Rama de madera con agua y semillas. Tu loro descansa aquí.": "Dahan kayu dengan air dan biji-bijian. Nurimu beristirahat di sini.",
		"JUGAR PING-PONG": "MAIN PING-PONG",
		"VER BRAZALETES": "LIHAT BAN",
		"TUS BRAZALETES": "BAN KAPTENMU",
		"El nombramiento se gana jugando. La vitrina conserva tus brazaletes.": "Jabatan diraih dengan bermain. Lemari menyimpan ban kaptenmu.",
		"Tu primer brazalete aparecerá cuando te nombren capitán.": "Ban kapten pertamamu akan muncul saat kamu ditunjuk jadi kapten.",
		"CAPITÁN DE LA SELECCIÓN": "KAPTEN TIMNAS",
		"CAPITÁN DEL CLUB": "KAPTEN KLUB",
		"REGISTRADO EN LA TEMPORADA {0}": "TERCATAT DI MUSIM {0}",
		"Esta partida ya tenía la capitanía. Se conserva la vigente, sin inventar fechas anteriores.": "Data game ini sudah punya jabatan kapten. Yang berlaku dipertahankan, tanpa mengarang tanggal sebelumnya.",
		"PING-PONG": "PING-PONG",
		"A 11 puntos, con ventaja de 2. Punto decisivo en 20-20.": "Sampai 11 poin, selisih 2. Poin penentu di 20-20.",
		"ARRASTRA AQUÍ PARA MOVER LA PALA": "SERET DI SINI UNTUK GESER BET",
		"IZQUIERDA": "KIRI",
		"CENTRO": "TENGAH",
		"DERECHA": "KANAN",
		"Mueve la pala con el dedo. El golpe es automático.": "Geser bet dengan jarimu. Pukulan otomatis.",
		"Compra la mesa de ping-pong para jugar.": "Beli meja ping-pong untuk bermain.",
		"Elige dónde devolver: izquierda, centro o derecha.": "Pilih arah balasan: kiri, tengah, atau kanan.",
		"GANÓ EL RIVAL": "LAWAN MENANG",
		"REVANCHA": "REMATCH",
		"TU SAQUE": "SERVISMU",
		"SAQUE RIVAL": "SERVIS LAWAN",
		"SACAR": "SERVE",
		"PUNTO PARA TI": "POIN UNTUKMU",
		"PUNTO PARA EL RIVAL": "POIN UNTUK LAWAN",
		"DEVOLUCIONES: {0}": "BALASAN: {0}",
		"AHORA ENFRENTE": "KINI LAWANMU",
		"AHORA JUEGA EN {0}": "KINI MAIN DI {0}",
		"DEBUTA": "DEBUT",
		"EL DEBUT DEL CHAVAL": "DEBUT BOCAH",
		"EL QUE SE FUE": "YANG PERGI",
		"FICHA POR {0}": "TEKEN DI {0}",
		"FIRMA SU PLAYERA": "TEKEN JERSEY",
		"Firmó su primer contrato. Quiso que estuvieras tú a su lado.": "Dia teken kontrak pertamanya. Dia ingin kamu ada di sampingnya.",
		"Hoy entra por primera vez. Tú te acuerdas de lo que se siente.": "Hari ini dia tampil untuk pertama kali. Kamu ingat rasanya.",
		"LA CANTERA": "AKADEMI",
		"LLEGA DE LA CANTERA": "DARI AKADEMI",
		"La encontró colgada en su taquilla. No hizo falta decir nada.": "Dia menemukannya tergantung di lokernya. Tak perlu bilang apa-apa.",
		"Lo viste debutar a tu lado. Hoy te va a tocar marcarlo.": "Kamu melihatnya debut di sampingmu. Hari ini kamu harus menjaganya.",
		"Lo viste debutar. Ahora lo cuentan en la tele del bar.": "Kamu melihatnya debut. Sekarang beritanya ada di TV bar.",
		"PRIMER CONTRATO": "KONTRAK PERTAMA",
		"PRIMER CONTRATO PROFESIONAL": "KONTRAK PRO PERTAMA",
		"Podía correr a la grada. Corrió hacia ti.": "Dia bisa lari ke tribun. Dia lari ke arahmu.",
		"SU PRIMER CONTRATO": "KONTRAK PERTAMANYA",
		"SU PRIMER GOL": "GOL PERTAMANYA",
		"Se quedó con la playera en blanco en las manos. No dijo nada.": "Dia hanya memegang jersey kosong itu. Tak berkata apa-apa.",
		"TU DORSAL ES SUYO": "NOMORMU MILIKNYA",
		"{0} AÑOS · CANTERA": "{0} THN · AKADEMI",
		"{0} AÑOS · PRIMER GOL": "{0} THN · GOL PERTAMA",
		"{0} AÑOS · PRIMER PARTIDO": "{0} THN · LAGA PERTAMA",
		"«Mi sueño es jugar junto a ti pronto.»": "«Mimpiku bisa segera main bersamamu.»",
		"«Mi sueño es jugar junto a ti pronto.» Ya está aquí.": "«Mimpiku bisa segera main bersamamu.» Sekarang dia sudah di sini.",
		"—¿Me firmas la playera?": "—Boleh tanda tangani jerseyku?",
		"PRESENTADO": "DIKENALKAN",
		"Tu ahijado ya tiene dorsal. Esta temporada jugáis juntos.": "Anak asuhmu sudah punya nomor. Musim ini kalian main bersama.",
		"DESPUÉS DEL ENTRENO": "SETELAH LATIHAN",
		"—Me quedé para verte. ¿Me enseñas a pegarle como tú?": "—Aku tinggal untuk menontonmu. Ajari aku menendang seperti kamu, ya?",
		"IRTE": "PERGI",
		"UNA HORA MÁS": "SEJAM LAGI",
		"Se fue a casa ya de noche, con el balón bajo el brazo.": "Dia pulang saat sudah malam, bola terselip di bawah lengan.",
		"Recogió el balón y se quedó tirando solo.": "Dia memungut bola dan terus menembak sendirian.",
		"SU PADRINO": "MENTORNYA",
		"SUBE AL PRIMER EQUIPO": "NAIK KE TIM UTAMA",
		"—Lo subimos contigo. ¿Quieres ser su padrino?": "—Kami naikkan dia bersamamu. Mau jadi mentornya?",
		"TU AHIJADO": "ANAK ASUHMU",
		"La temporada que viene, jugará a tu lado.": "Musim depan, dia akan main di sampingmu.",
		"SIGUE EN LA CANTERA": "TETAP DI AKADEMI",
		"El director asintió. El niño miró al suelo.": "Direktur mengangguk. Anak itu menatap lantai.",
		"El Ahijado": "Anak Asuh",
		"Apadrinar a un niño de la cantera hasta el primer equipo.": "Bimbing anak akademi sampai ke tim utama.",
		"VER SALÓN": "LEGENDA",
		"ESCALÓN": "TINGKAT",
		"AQUÍ EMPEZASTE": "AWAL KARIER",
		"PARED DE REFLEJOS": "DINDING REFLEKS",
		"MEMORAMA": "MEMORI",
		"JUGAR REFLEJOS": "MAIN REFLEKS",
		"JUGAR MEMORAMA": "MAIN MEMORI",
		"¡RÉCORD!": "REKOR!",
		"ANTES {0}": "DULU {0}",
		"RÉCORD {0}": "REKOR {0}",
		"RÉCORDS · {0}": "REKOR · {0}",
		"MS": "MS",
		"NO TOQUES": "HINDARI",
		"TOCA": "SENTUH",
		"REFLEJO": "REAKSI",
		"TIEMPO": "WAKTU",
		"COMPLETADO": "SELESAI",
		"MEMORIZA": "INGAT",
		"MOVIMIENTOS": "LANGKAH",
		"TU COLECCIÓN": "KOLEKSIMU",
		"{0} S": "{0} D",
		"memoramaEN JUEGO": "DIMAINKAN",
		"memoramaPAREJAS": "PASANGAN",
		"reflejosRACHA": "BERUNTUN",
		"Pared de luces: toca la que se enciende. Récord de reflejos.": "Dinding lampu: sentuh yang menyala. Rekor refleks.",
		"Mesa de cartas con tu colección: encuentra las parejas.": "Meja kartu dengan koleksimu: temukan pasangannya.",
	},


	"pique": {
		"CALMA": "TENANG",
		"ENCÁRATE": "HADAPI",
		"{0} TE BUSCA": "{0} MENGINCARMU",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE ENCARAN": "{0} MENENDANG {1} DARI BELAKANG, KEDUANYA BERHADAPAN",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1}, QUE NO RESPONDE": "{0} MENENDANG {1} DARI BELAKANG, TANPA BALASAN",
		"notaTEMPLE": "SABAR",
		"notaAMARILLA": "KUNING",
		"Otra vez le ganas a {0}. Ya no le hace ninguna gracia.": "Kamu mengalahkan {0} lagi. Dia sudah tidak senang.",
		"{0} ya te tiene entre ceja y ceja.": "{0} sudah mengincarmu.",
		"{0} va a por ti, no a por el balón. Patada por detrás.": "{0} mengincarmu, bukan bola. Tendangan dari belakang.",
		"Ni mira la pelota: {0} te pega por detrás.": "Bola pun tak dilirik: {0} menendangmu dari belakang.",
		"Te levantas y te vas a por {0}. Frente con frente.": "Kamu bangun dan langsung menghampiri {0}. Dahi lawan dahi.",
		"No te lo callas: cara a cara con {0}, y la grada se enciende.": "Kamu tak mau diam: berhadapan dengan {0}, dan tribun memanas.",
		"{0} te busca y no te encuentra. Te das la vuelta.": "{0} memancing reaksi tapi tak dapat. Kamu berbalik pergi.",
		"Ni lo miras. {0} se queda con el dedo en el aire.": "Kamu bahkan tak menoleh. {0} tinggal dengan jari menggantung di udara.",
		"{1} NO LE PIERDE LA PISTA A {0}": "{1} TERUS MEMBUNTUTI {0}",
		"{0} SE LE ESCAPA A {1} UNA Y OTRA VEZ": "{0} TERUS LOLOS DARI {1}",
		"AMBIENTE CALDEADO ENTRE {0} Y {1}": "SUASANA MEMANAS ANTARA {0} DAN {1}",
		"CADA BALÓN ENTRE {0} Y {1} ES UNA GUERRA": "TIAP BOLA {0} DAN {1} JADI PERANG",
		"{0} NO ENTRA AL TRAPO Y SIGUE A LO SUYO": "{0} TAK TERPANCING, LANJUT MAIN",
		"{1} BUSCA LA REACCIÓN DE {0} Y NO LA ENCUENTRA": "{1} MENCARI REAKSI {0} TAPI TAK DAPAT",
		"SIN {1} EN EL CAMPO, {0} RESPIRA": "TANPA {1}, {0} BISA BERNAPAS",
		"{1} JUEGA CON LA AMARILLA A CUESTAS": "{1} MAIN DENGAN KARTU KUNING",
		"{0} JUEGA AL LÍMITE CON LA AMARILLA": "{0} RAWAN, SUDAH KENA KUNING",
		"Viven en tu casa y cobran cada jornada.": "Mereka tinggal di rumahmu dan digaji setiap pekan.",

		"¡Derribaste el dron de la tele!": "Kamu menjatuhkan drone TV!",
		"Señal Perdida": "Sinyal Hilang",
		"Derribar el dron de la tele de un balonazo.": "Jatuhkan drone TV dengan tendangan.",
		"Algunos partidos los graba un dron desde el cielo.": "Beberapa pertandingan direkam drone dari langit.",

		"¡Balón de playa en el área!": "Bola pantai di kotak penalti!",
		"¡Desvío en el balón de playa!": "Dibelokkan bola pantai!",
		"Gol de Playa": "Gol Pantai",
		"Marcar un gol desviado por el balón de playa.": "Cetak gol yang dibelokkan bola pantai.",
		"A veces cae algo inflable desde la grada.": "Kadang sesuatu yang bisa ditiup jatuh dari tribun.",

		"¡Le volaste el celular a un fan!": "Kamu membuat ponsel fan terlempar!",
		"¡Tu balonazo se hizo viral!": "Tendanganmu jadi viral!",
		"REC": "REC",
		"{0} vistas": "{0} tayangan",
		"Se Hizo Viral": "Jadi Viral",
		"Tirarle el celular a un fan que te graba.": "Jatuhkan ponsel fan yang sedang merekammu.",
		"Hay quien graba el partido desde detrás de la valla.": "Ada yang merekam pertandingan dari balik papan iklan.",
		"Tangana en pleno derbi: {0} te empuja y se forma el corro.": "Keributan di tengah derbi: {0} mendorongmu dan semua pemain mengerumun.",
		"Empujones entre los dos equipos. {0} lo empezó y el árbitro tiene que meterse en medio.": "Saling dorong antara kedua tim. {0} yang memulai dan wasit harus turun tangan.",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE MONTA LA TANGANA": "{0} MENENDANG {1} DARI BELAKANG, LALU RICUH",
		"LA TANGANA DEJA EL DERBI AL ROJO VIVO": "KERICUHAN MEMANASKAN DERBI",
		"DESDE LA TANGANA, {1} Y {0} NO SE QUITAN LA VISTA": "SEJAK RICUH, {1} DAN {0} SALING MENATAP",
		"{0} ARRASTRA LA AMARILLA DE LA TANGANA": "{0} BAWA KARTU KUNING RICUH",
		"Y en los bares sólo se habla de la tangana.": "Dan di warung-warung, semua hanya membicarakan keributan itu.",
	},


	"editor_estadio_derbi": {
		"ESTADIO": "STADION",
		"estadioPLANTA": "DENAH",
		"VOLVER AL ESTADIO AUTOMATICO": "STADION OTOMATIS",
		"El nombre sale en la carátula de TV y en el hub. La planta es la forma de las gradas en el partido.": "Nama tampil di grafis TV dan di hub. Denah adalah bentuk tribun saat pertandingan.",
		"SIN DERBI": "TANPA DERBI",
		"VOLVER AL DERBI AUTOMATICO": "DERBI OTOMATIS",
		"Es el partido con más ambiente del año. Tiene que ser del mismo país; puede ser de otra división.": "Laga paling panas sepanjang tahun. Harus dari negara yang sama; boleh dari divisi lain.",
		"ELIGE SU RIVAL DE DERBI": "PILIH RIVAL DERBINYA",
		"Tiene que ser del mismo país.\nPuede ser de otra división.": "Harus dari negara yang sama.\nBoleh dari divisi lain.",
		"DERBI DE: {0}": "DERBI: {0}",
		"{0} y {1} pasan a ser rivales de derbi.": "{0} dan {1} menjadi rival derbi.",
		"Los rivales que tenían hasta hoy se quedan sin derbi, y el juego les busca otro.": "Rival mereka sampai hari ini kehilangan derbi, dan game mencarikan yang lain.",
		"AÑADIR OTRO DERBI": "TAMBAH DERBI",
		"Hasta tres rivales; el primero es el derbi principal.": "Sampai tiga rival; yang pertama adalah derbi utama.",
		"Se suma a los derbis que ya tenían elegidos.": "Ditambahkan ke derbi yang sudah mereka pilih.",
		"Es el partido con más ambiente del año. Puede ser de cualquier confederación; sus otros rivales de siempre se quedan.": "Ini laga paling panas sepanjang tahun. Bisa dari konfederasi mana pun; rival lainnya yang biasa tetap ada.",
		"Puede ser de cualquier confederación.": "Bisa dari konfederasi mana pun.",
		"El rival que cada una tenía elegido vuelve a los suyos de siempre.": "Rival yang dipilih masing-masing kembali ke rival biasanya.",
		"derbi con selección desconocida: {0}": "derbi dengan timnas tak dikenal: {0}",
		"derbi consigo misma: {0}": "derbi dengan dirinya sendiri: {0}",
		"Las carreras ya empezadas lo estrenan al volver a cargar la partida.": "Karier yang sudah berjalan mendapatkannya saat memuat ulang simpanan.",
		"CONFIRMAR DERBI": "KONFIRMASI DERBI",
		"· DERBI: {0}": "· DERBI: {0}",
		"· ESTADIO": "· STADION",
		"derbi": "derbi",
		"derbis": "derbi",
		"Su estadio y su derbi, también.": "Stadion dan derbinya juga.",
		"derbi con club desconocido: {0}": "derbi dengan klub tak dikenal: {0}",
		"demasiados derbis para: {0}": "terlalu banyak derbi untuk: {0}",
		"derbi entre países distintos: {0}": "derbi beda negara: {0}",
		"CUENCO CERRADO": "MANGKUK TERTUTUP",
		"CUATRO TRIBUNAS": "EMPAT TRIBUN",
		"HERRADURA": "TAPAL KUDA",
		"TRIBUNA EN L": "TRIBUN BENTUK L",
		"DOS TRIBUNAS": "DUA TRIBUN",
		"CON PISTA": "DENGAN LINTASAN",
		"CUENCO REDONDO": "MANGKUK BULAT",
		"COLISEO": "KOLOSEUM",
		"OCTAGONO": "OKTAGON",
		"CATEDRAL": "KATEDRAL",
		"VELAS": "LAYAR",
		"DOS ANILLOS": "DUA CINCIN",
		"MEMBRANA": "MEMBRAN",
		"TRIBUNA ALTA": "TRIBUN TINGGI",
		"CALDERA": "KUALI",
		"TRIBUNA DOBLE": "TRIBUN GANDA",
		"TECHO DE TELA": "ATAP KAIN",
		"FONDO ALTO": "UJUNG TINGGI",
		"FONDO EN BLOQUES": "UJUNG BERBLOK",
		"SIN FONDO, ARBOLES": "TANPA UJUNG, POHON",
		"TECHO A DOS AGUAS": "ATAP PELANA",
		"CAMPO HUNDIDO": "LAPANGAN CEKUNG",
		"PANTALLA GIGANTE": "LAYAR RAKSASA",
		"ARCO AL FONDO": "LENGKUNG DI UJUNG",
		"TERRAPLEN": "TANGGUL",
		"GRADAS TUBO": "TRIBUN TABUNG",
		"MURO DE PIE": "DINDING BERDIRI",
		"TRES ANILLOS": "TIGA CINCIN",
		"FONDO DE BANDERAS": "UJUNG BENDERA",
		"TRIBUNA CON POSTES": "TRIBUN BERTIANG",
		"TORRE DEL RELOJ": "MENARA JAM",
		"CAMPO CON COCHES": "LAPANGAN BERMOBIL",
		"FONDO DE CHIMENEAS": "UJUNG CEROBONG",
		"PIEL ENVOLVENTE": "KULIT MELINGKAR",
		"LATERAL PLANO": "SISI DATAR",
		"ANILLO COLGADO": "CINCIN GANTUNG",
		"TECHO DE DIENTES": "ATAP BERGERIGI",
		"COLUMNATA": "KOLONADE",
		"TECHO FLOTANTE": "ATAP MELAYANG",
		"TORRES CON RAMPA": "MENARA RAMPA",
		"CALABAZA": "LABU",
		"PUERTA MONUMENTAL": "GERBANG MONUMENTAL",
		"OLA DE VIDRIO": "OMBAK KACA",
		"OLIMPICO DE PIEDRA": "OLIMPIK BATU",
		"COLOSO": "KOLOSUS",
		"CAJON VERTICAL": "KOTAK VERTIKAL",
		"HERRADURA DE TRES PISOS": "TAPAL KUDA 3 TINGKAT",
		"TRES GRADAS ABIERTAS": "TIGA TRIBUN TERBUKA",

		"TU ESTADO": "STATUSMU",
		"LO DECIDE LA DIRECTIVA": "DIREKSI MEMUTUSKAN",
		"SI PAGAN": "JIKA DIBAYAR",
		"La directiva te bloquea {0} ofertas": "Direksi memblokir {0} tawaran untukmu",
		"Tu club rechaza las ofertas por ti: sólo la cláusula te saca.": "Klubmu menolak tawaran untukmu: hanya klausul pelepasan yang bisa membawamu keluar.",
		"Tu club no te retiene.": "Klubmu tidak menahanmu.",
		"Si alguien paga lo que pide tu club, te vende.": "Jika ada yang membayar harga klubmu, kamu dijual.",
		"Hoy tu club no negocia por ti.": "Saat ini klubmu tidak bernegosiasi soal dirimu.",
		"Tu club te ofrece a quien pregunte.": "Klubmu menawarkanmu ke siapa pun yang bertanya.",
		"No estás en venta.": "Kamu tidak dijual.",
		"La directiva dijo NO: no cuentas lo bastante. Puedes volver a pedirlo la temporada que viene.": "Direksi bilang TIDAK: kamu belum cukup penting. Kamu bisa meminta lagi musim depan.",
		"PEDIR QUE NO ME VENDAN": "JANGAN JUAL AKU",
		"¿PEDIR QUE NO TE VENDAN?": "MINTA TIDAK DIJUAL?",
		"Lo decide la directiva, una vez por temporada. Si dice que sí, rechaza las ofertas por ti este año. La cláusula sigue valiendo.": "Direksi yang memutuskan, sekali per musim. Jika ya, mereka menolak tawaran untukmu tahun ini. Klausul tetap berlaku.",
		"LA DIRECTIVA DICE SÍ": "DIREKSI BILANG YA",
		"LA DIRECTIVA DICE NO": "DIREKSI BILANG TIDAK",
		"Pedir el traspaso te pone en venta y te quita minutos hasta que salgas. La cesión, si no eres titular.": "Meminta transfer membuatmu dijual dan mengurangi menit bermainmu sampai kamu pergi. Peminjaman, jika kamu bukan pemain inti.",

		"Quiere venir: sale sin cláusula (+{0} %).": "Ingin datang: pergi tanpa klausul (+{0} %).",

		"TU OFERTA": "TAWARANMU",
		"OFRECER": "TAWAR",
		"INTENTOS": "PERCOBAAN",
		"PACTADO": "DISEPAKATI",
		"Trato cerrado ({0}). Te queda {1}.": "Sepakat ({0}). Sisa {1}.",
		"No aceptan. Piden {0}.": "Ditolak. Mereka minta {0}.",

		"NO FIRMAR": "TOLAK",
		"TE FUISTE SIN FIRMAR": "PERGI TANPA TTD",
		"La valla te vio pasar. Mañana lo contará.": "Fan di balik pagar melihatmu lewat. Besok mereka akan cerita.",
		"Cien Firmas": "Seratus Tanda Tangan",
		"Firmar 100 autógrafos.": "Beri 100 tanda tangan.",
		"Mil Firmas": "Seribu Tanda Tangan",
		"Firmar 1.000 autógrafos.": "Beri 1.000 tanda tangan.",
		"La Mano de Oro": "Tangan Emas",
		"Firmar 10.000 autógrafos.": "Beri 10.000 tanda tangan.",
		"UN FAN TE PARA": "FAN MENCEGATMU",
		"EN EL AEROPUERTO": "DI BANDARA",
		"EN EL TÚNEL": "DI TEROWONGAN",
		"EN LA CENA": "SAAT MAKAN MALAM",
		"SEMANA DE DERBI": "PEKAN DERBI",
		"{0} AUTÓGRAFOS EN TU CARRERA": "{0} TANDA TANGAN SEPANJANG KARIER",
		"FIRMA EN LA TERMINAL": "TTD DI TERMINAL",
		"El grupo esperó un minuto en la puerta de embarque.": "Tim menunggu semenit di gerbang.",
		"DIRECTO AL AVIÓN": "LANGSUNG KE PESAWAT",
		"Ni lo miraste. El grupo llegó puntual.": "Kamu bahkan tak menoleh. Tim tepat waktu.",
		"EL NIÑO DEL TÚNEL": "ANAK DI TEROWONGAN",
		"Sale al campo de tu mano con tu firma puesta.": "Ia masuk lapangan menggandengmu, dengan tanda tanganmu.",
		"LO DEJASTE PLANTADO": "KAMU MENGABAIKANNYA",
		"Las cámaras del túnel lo grabaron todo.": "Kamera terowongan merekam semuanya.",
		"FIRMA EN LA CENA": "TTD SAAT MAKAN",
		"A tu pareja se le enfrió el plato.": "Makanan pasanganmu jadi dingin.",
		"ESTA NOCHE NO": "TIDAK MALAM INI",
		"Hoy cenabas con tu pareja. Lo entendió… o casi.": "Malam ini makan berdua. Pasanganmu mengerti… hampir.",
		"FIRMASTE AL RIVAL": "TTD BUAT RIVAL",
		"Tu firma en la camiseta del rival. Mañana sale en portada.": "Tanda tanganmu di jersey rival. Besok jadi berita utama.",
		"ESA CAMISETA, NO": "BUKAN JERSEY ITU",
		"Tu grada aplaude que no la firmaras.": "Suportermu bertepuk tangan atas penolakanmu.",
		"EL HINCHA DE SIEMPRE": "SANG FAN SETIA",
		"NO VOLVERÁ": "DIA TAK AKAN KEMBALI",
		"Le firmaste la primera hace {0} temporadas. Sigue aquí.": "Kamu memberinya tanda tangan pertama {0} musim lalu. Dia masih di sini.",
		"Ahora trae a su hijo. Hace {0} temporadas, el niño era él.": "Kini dia membawa anaknya. {0} musim lalu, anak itu adalah dia.",
		"Te esperó {0} temporadas. No volverá a pedírtelo.": "Dia menunggumu {0} musim. Dia tak akan meminta lagi.",
		"EL FOTÓGRAFO": "SI FOTOGRAFER",
		"La foto era con {0}. Tú sólo sujetabas el móvil.": "Fotonya bersama {0}. Kamu cuma memegang ponselnya.",
	},


	"descanso_pactado": {
		"PEDIR DESCANSO": "MINTA REHAT",
		"EL MÍSTER DICE QUE NO": "PELATIH BILANG TIDAK",
		"Hoy no. Éste es de los que se juegan.": "Hari ini tidak. Ini pertandingan yang harus dimainkan.",
		"Hoy te necesito. Este partido pesa demasiado.": "Hari ini aku butuh kamu. Pertandingan ini terlalu penting.",
		"Aquí juegan los once de siempre. Tú también.": "Di sini sebelas pemain biasa yang main. Kamu juga.",
		"Contra éste te quiero en el campo. Juegas.": "Lawan mereka aku mau kamu di lapangan. Kamu main.",
		"Me lo pides tú y te lo concedo. ¿Banca por si hace falta, descansas del todo, o al final juegas?": "Kamu yang minta, jadi kuizinkan. Cadangan kalau perlu, istirahat penuh, atau akhirnya main?",
		"¿JUEGAS O DESCANSAS?": "MAIN ATAU REHAT?",
		"EL MÍSTER DECIDE": "KATA PELATIH",
		"Entonces sales de inicio. Que se note que lo querías.": "Kalau begitu kamu starter. Tunjukkan kamu memang mau.",
		"Te quiero fresco, pero a mano. Si se tuerce, entras.": "Aku mau kamu segar, tapi siap. Kalau memburuk, kamu masuk.",
		"Descansa. Te quiero entero para lo que viene.": "Istirahatlah. Aku butuh kamu bugar untuk laga berikutnya.",
		"Contra éste no te necesito de inicio y después viene {0}. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "Lawan tim ini aku tak butuh kamu sejak awal, dan setelahnya ada {0}. Main, duduk di bangku cadangan kalau perlu, atau istirahat?",
		"Contra éste no te necesito de inicio. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "Lawan tim ini aku tak butuh kamu sejak awal. Main, duduk di bangku cadangan kalau perlu, atau istirahat?",
		"BANCA, POR SI HACE FALTA": "CADANGAN, JIKA PERLU",
		"DECISIÓN": "KEPUTUSAN",
		"EL MÍSTER QUIERE HABLAR CONTIGO": "PELATIH INGIN BICARA",
		"DESCANSAS": "ISTIRAHAT",
		"Te quiere entero para el partido grande que viene.": "Pelatih ingin kamu bugar untuk laga besar berikutnya.",
		"Llegas justo de energía. Hoy no te vistes.": "Energimu tipis. Hari ini kamu tidak dipanggil.",
		"Contra este rival te guarda. Si el partido se tuerce, entras.": "Lawan tim ini pelatih menyimpanmu. Kalau laga memburuk, kamu masuk.",
		"DESPUÉS": "SETELAH",
		"EL MÍSTER TE GUARDA": "DISIMPAN",
		"Hoy el partido no se juega nada. Sólo entras si se lesiona un compañero.": "Hari ini laga tak menentukan apa pun. Kamu hanya masuk jika rekan cedera.",
		"Se mira el global de la eliminatoria.": "Yang dihitung adalah skor agregat.",
		"Si el partido se tuerce, el míster te llama.": "Kalau laga memburuk, pelatih memanggilmu.",
		"PERDIENDO": "KALAH",
		"EMPATANDO": "IMBANG",
		"GANANDO POR 1": "UNGGUL 1",
		"LO VES DESDE CASA": "NONTON DI RUMAH",
		"Ganaron sin ti. Llegas entero a lo que viene.": "Mereka menang tanpamu. Kamu bugar untuk laga berikutnya.",
		"Empate sin ti. La prensa pregunta dónde estabas.": "Imbang tanpamu. Media bertanya di mana kamu.",
		"Perdieron sin ti. La prensa pregunta dónde estabas.": "Mereka kalah tanpamu. Media bertanya di mana kamu.",
		"DÍA LIBRE · LO VES DESDE CASA": "LIBUR · NONTON DI RUMAH",
		"EL MÍSTER NO TE NECESITA HOY · TE QUEDAS EN LA BANCA": "TAK DIBUTUHKAN HARI INI · TETAP DI BANGKU",
		"JUEGAS O DESCANSAS": "MAIN ATAU REHAT",
		"POR SI HACE FALTA": "JIKA PERLU",
		"DIA LIBRE": "LIBUR",

		"CLASIFICADOS": "LOLOS",
		"ELIMINADOS": "TERSINGKIR",
		"AL {0}": "KE {0}",
		"SIN {0}": "TANPA {0}",
		"FUERA DEL TORNEO": "GAGAL LOLOS",
		"Un país entero lo celebra contigo.": "Satu negara merayakan bersamamu.",
		"Un país entero apagó la tele.": "Satu negara mematikan TV.",
	},

	"banca_juego": {
		"CHIN CHAN PU": "SUIT",
		"BOTELLA DE PIE": "BOTTLE FLIP",
		"DOMINADAS": "TIMANG BOLA",
		"CONTRA {0}": "LAWAN {0}",
		"TU COMPAÑERO": "REKANMU",
		"¡ELIGE!": "PILIH!",
		"CHIN": "GUNTING",
		"CHAN": "BATU",
		"¡PU!": "KERTAS!",
		"¡TUYA!": "KAMU!",
		"¡SUYA!": "DIA!",
		"¡OTRA!": "LAGI!",
		"¡LANZA!": "LEMPAR!",
		"SU TURNO": "GILIRANNYA",
		"¡DE PIE!": "BERDIRI!",
		"¡SE CAE!": "JATUH!",
		"¡TOCA!": "KETUK!",
		"¡GANASTE!": "MENANG!",
		"Hoy recoge él los conos.": "Hari ini dia yang membereskan kerucut.",
		"Hoy recoges tú los conos.": "Hari ini kamu yang membereskan kerucut.",
		"Los conos, a medias.": "Kerucutnya dibagi dua.",
		"CREAR LIGA": "BUAT LIGA",
		"UNIRSE": "GABUNG",
		"UNIRSE A UNA LIGA": "GABUNG LIGA",
		"TERMINADA": "SELESAI",
		"{0} D": "{0} H",
		"LIGA NO ENCONTRADA": "LIGA TIDAK DITEMUKAN",
		"LIGA LLENA": "LIGA PENUH",
		"DEMASIADAS LIGAS": "TERLALU BANYAK LIGA",
		"Crea una liga y pasa su código: 28 días, gana quien más sume.": "Buat liga dan bagikan kodenya: 28 hari, yang terbanyak menang.",
		"Únete a mi liga de Football Legacy: código {0}": "Gabung ke liga Football Legacy-ku: kode {0}",
		"Reto de {0}": "Tantangan dari {0}",
		"Tienes un reto": "Ada tantangan untukmu",
		"Se acaba pronto: juégalo antes de que venza.": "Segera berakhir: mainkan sebelum kedaluwarsa.",
		"PADRINO": "MENTOR",
		"Embajador": "Duta",
		"Que 3 amigos que invitaste jueguen 10 partidos.": "3 teman undanganmu main 10 laga.",
		"Fundador": "Pendiri",
		"Que 10 amigos que invitaste jueguen 10 partidos.": "10 teman undanganmu main 10 laga.",
		"~{0} BALONES": "~{0} BOLA",
		"+{0} SUELDO": "+{0} GAJI",
		"+1 BALÓN EN CASA": "+1 BOLA DI KANDANG",
		"-1 BALÓN EN CASA": "-1 BOLA DI KANDANG",
		"DESDE CERO": "DARI NOL",
		"CON TU CARRERA": "DENGAN KARIERMU",
		"Sólo cuenta una carrera que empieces después de crearla.": "Hanya karier yang kamu mulai setelah membuatnya yang dihitung.",
		"Cuenta lo que sumes desde hoy con tu carrera.": "Menghitung yang kamu tambah mulai hari ini dengan kariermu.",
		"Empieza una carrera nueva para contar en esta liga.": "Mulai karier baru agar dihitung di liga ini.",
		"Podio": "Podium",
		"Acabar entre los 3 primeros de una liga de amigos.": "Finis 3 besar di liga teman.",
		"Campeón de liga": "Juara liga",
		"Ganar una liga de amigos.": "Menangkan liga teman.",
		"Tricampeón": "Juara tiga kali",
		"Ganar 3 ligas de amigos.": "Menangkan 3 liga teman.",
		"OTRA TEMPORADA": "MUSIM BARU",
		"Liga {0}: último día": "Liga {0}: hari terakhir",
		"Vas {0}º. Aún puedes remontar.": "Kamu peringkat {0}. Masih bisa naik.",
		"Aún puedes sumar antes del final.": "Kamu masih bisa menambah sebelum akhir.",

		"PECHO Y VOLEA": "DADA DAN VOLI",
		"¡CLAVADO!": "SEMPURNA!",
		"¡CONTROL!": "TERKONTROL!",
		"¡SE TE ESCAPA!": "LEPAS!",
		"¡DESLIZA HACIA ÉL!": "GESER KE ARAHNYA!",
		"TOCA EN EL ARO": "KETUK DI LINGKARAN",
		"¡AL PIE!": "TEPAT DI KAKI!",
		"¡CON ROSCA!": "MELENGKUNG!",
		"¡CORTO!": "KURANG JAUH!",
		"¡LARGO!": "KEJAUHAN!",
		"¡DESVIADO!": "MELENCENG!",
		"CONTROL Y VOLEA": "KONTROL DAN VOLI",
		"¡GLOBO!": "LAMBUNG!",
		"PULSA {0} EN EL ARO": "TEKAN {0} DI LINGKARAN",
		"STICK: APUNTA · {0}: GLOBO": "STIK: BIDIK · {0}: LAMBUNG",
		"EL 1-7": "1-7",
		"Juega con una de las dos selecciones contra la otra.": "Mainkan salah satu dari dua tim nasional melawan yang lain.",
		"EL TREN": "KERETA",
		"Un gol en una final: te tiras en plancha y detrás de ti se tiran los cuatro más cerca, uno a uno, cada uno a los pies del de delante.": "Gol di final: kamu meluncur tengkurap dan empat rekan terdekat ikut meluncur di belakangmu, satu per satu, masing-masing di kaki yang di depannya.",
		"EL CORRO": "LINGKARAN",
		"Con el vestuario a tu lado: tus compañeros te rodean aplaudiendo y tú festejas en medio.": "Dengan ruang ganti di pihakmu: rekan-rekan mengelilingimu sambil bertepuk tangan dan kamu merayakan di tengah.",
		"LA OREJA": "TELINGA",
		"Tu grada te está cantando: te giras hacia ella con las manos en las orejas y la grada se viene abajo. Sólo delante de los tuyos.": "Tribunmu sedang menyanyikan namamu: kamu berbalik ke arahnya dengan tangan di telinga dan tribun pun meledak. Hanya di depan pendukungmu.",
		"LA MANO DE DIOS": "TANGAN TUHAN",
		"EL GOL FANTASMA": "GOL HANTU",
		"LA MANO EN LA LÍNEA": "TANGAN DI GARIS",
		"EL PENAL AL CIELO": "PENALTI LANGIT",
		"EL MINUTO 116": "MENIT 116",
		"FUE CON LA MANO": "PAKAI TANGAN",
		"NO LO DIERON": "TAK DISAHKAN",
		"ESTAMPAS LUNA": "ESTAMPAS LUNA",
		"CEREALES ALBA": "CEREALES ALBA",
		"AUTOCARES ATLAS": "AUTOCARES ATLAS",
		"PIXEL ARENA": "PIXEL ARENA",
		"Tu cara en el álbum del barrio. Cada gol, un sobre más.": "Wajahmu di album lingkungan. Setiap gol, satu bungkus lagi.",
		"Tu cara en la caja del desayuno. Pagan fijo y piden poco.": "Wajahmu di kotak sarapan. Bayarannya tetap dan permintaannya sedikit.",
		"Tu cara recorre la ciudad en el autobús. Si no juegas, no ruedas.": "Wajahmu keliling kota di bus. Kalau kamu tidak main, bus tidak jalan.",
		"La portada del videojuego del año. Cada gol tuyo vende una copia más.": "Sampul gim terbaik tahun ini. Setiap golmu menjual satu kopi lagi.",
		"TU ESTAMPA": "STIKERMU",
		"TU CARA EN LA CAJA": "WAJAHMU DI KOTAK",
		"TU CARA EN LA RUTA": "WAJAHMU DI BUS",
		"TU PORTADA": "SAMPULMU",
		"DESAYUNO DE CAMPEÓN": "SARAPAN JUARA",
		"Tres sobres y ya te tenían repetido. Te cambian por dos.": "Tiga bungkus dan kamu sudah dobel. Kamu ditukar dengan dua.",
		"Medio barrio desayuna contigo. El otro medio, con la competencia.": "Setengah lingkungan sarapan bersamamu. Setengahnya lagi bersama pesaing.",
		"Doce metros de cara. Y para cada parada, en todas las rutas.": "Dua belas meter wajah. Dan di setiap halte, di semua rute.",
		"La cola da la vuelta a la manzana. Dentro del juego también eres tú.": "Antreannya mengular satu blok. Di dalam gim pun itu kamu.",
	},
}
