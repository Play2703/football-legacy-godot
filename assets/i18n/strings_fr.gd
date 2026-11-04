extends RefCounted





























const DOMAINS: Dictionary = {



	"trueno_himno": {
		"GOLEADA": "RACLEE",
		"¡HUH!": "HUH !",
		"¡CON EL BOMBO!": "AU TAMBOUR !",
		"¡DESCUADRE!": "DECALE !",
		"¡TRUENO!": "TONNERRE !",
		"SE DESCUADRO": "DESYNCHRO",
		"goleada": "raclée",
		"palmas": "frappes",
		"La grada entera, a tu compás.": "Toute la tribune, à ton rythme.",
		"Las palmas se fueron cada una por su lado.": "Les frappes sont parties chacune de leur côté.",
		"EL TRUENO": "TONNERRE",
		"EL APRETON": "LA POIGNEE",
		"EL HIMNO": "L'HYMNE",
		"A TU LADO: {0}": "VOISIN : {0}",
		"EN DIRECTO": "EN DIRECT",
		"RISA": "RIRE",
		"AGUANTA": "RETIENS",
		"¡TE BUSCA!": "GARE !",
		"¡REVIENTAS!": "TU CRAQUES !",
		"¡LA TELE!": "LA TELE !",
		"¡JA, JA!": "HA HA !",
		"¡PILLADO!": "GRILLE !",
		"¡AGUANTASTE!": "TU AS TENU !",
		"Todo el país te ha visto reírte en pleno himno.": "Tout le pays t'a vu rire en plein hymne.",
		"Cara de piedra con todo el país mirando.":
			"Visage impassible, avec tout le pays qui regarde.",
		"El Trueno": "Le Tonnerre",
		"Llevar a la grada entera hasta el redoble tras una goleada en casa.": "Mener toute la tribune jusqu'au roulement final après une raclée à domicile.",
		"Aguantar el himno sin reírte con la tele delante.": "Tenir tout l'hymne sans rire devant la caméra.",
		"Pillado en Directo": "Grillé en Direct",
		"Que la tele te pille riéndote durante el himno.": "Te faire griller par la télé en train de rire pendant l'hymne.",
		"Tras una goleada en casa, la grada espera a que alguien marque el compás.": "Après une raclée à domicile, la tribune attend que quelqu'un donne le rythme.",
		"Con tu selección, el himno se canta serio... aunque el de al lado no ayude.": "Avec ta sélection, l'hymne se chante sérieusement... même si ton voisin n'aide pas.",
		"Con tu selección, ojo con quién tienes al lado cuando suena el himno.": "Avec ta sélection, méfie-toi de ton voisin quand l'hymne retentit.",
		"El Míster Aún Sabe": "Le Coach a encore la touche",
		"Que tu técnico baje de pecho un balón fuera y se la dé al que saca de banda.": "Que ton entraîneur contrôle de la poitrine un ballon sorti et le donne au joueur qui fait la touche.",
		"Cuando el balón sale por tu banquillo, a veces el míster no se resiste.": "Quand le ballon sort près de ton banc, le coach ne résiste pas toujours.",
		"¡PENAL!": "PENALTY !",
		"NO ERA PENAL": "PAS PENALTY",
		"{0} NO LO OLVIDA": "{0} N'OUBLIE PAS",
		"¡ESE NO ES!": "PAS CELLE-LA !",
		"EL MARACANAZO": "LE MARACANAZO",
		"EL CABEZAZO": "LE COUP DE BOULE",
		"LA PRÓRROGA DE RÍO": "LA PROLONGATION DE RIO",
		"LOS PENALES DE DOHA": "LES TIRS AU BUT DE DOHA",
		"EL GOL DE ORO": "LE BUT EN OR",
		"GOL DE ORO": "BUT EN OR",
		"DOS EN EL DESCUENTO": "DEUX DANS LES ARRETS",
		"EL ÚLTIMO SUSPIRO": "LE DERNIER SOUFFLE",
		"LA VUELTA DE ÁMSTERDAM": "LE RETOUR A AMSTERDAM",
		"LA MANITA": "LA MANITA",
		"ROJA DIRECTA": "ROUGE DIRECT",
		"EN LOS PENALES": "AUX TIRS AU BUT",
		"ESTABA ADELANTADO": "IL ETAIT HORS JEU",
		"LA CHILENA": "LE RETOURNE",
		"LA GRADA APLAUDE": "LE STADE APPLAUDIT",
		"Cara de Piedra": "Visage Impassible",
	},


	"mando_f2": {
		"IZQUIERDA · AJUSTA EL STICK": "GAUCHE · AJUSTE LE STICK",
		"DERECHA · AJUSTA EL STICK": "DROITE · AJUSTE LE STICK",
		"mandoCRUZ": "CROIX",
		"mandoCÍRCULO": "ROND",
		"mandoCUADRADO": "CARRE",
		"mandoTRIÁNGULO": "TRIANGLE",
		"Stick izquierdo para moverte · llega al balón y remata": "Stick gauche pour bouger · atteins le ballon pour frapper",
		"Con mando se juega en horizontal: {0} > {1} > {2}": "À la manette, on joue en paysage : {0} > {1} > {2}",
		"MANTÉN {0} Y SUELTA": "MAINTIENS {0} ET LACHE",
		"Apunta con el stick y mantén {0}. Más carga, más fuerte.": "Vise au stick et maintiens {0}. Plus de charge, plus de puissance.",
		"PULSA {0} PARA CONTINUAR": "{0} POUR CONTINUER",
		"PULSA {0} PARA JUGAR": "{0} POUR JOUER",
		"El coche acelera solo. Gira con el stick y frena con {0}.": "La voiture accélère toute seule. Tourne avec le stick et freine avec {0}.",
		"Pulsa {0} para saltar": "Appuie sur {0} pour passer",
		"CENTRO · apunta y pulsa {0}": "CENTRE · vise et appuie sur {0}",
		"Apunta con el stick · pulsa {0}": "Vise au stick · appuie sur {0}",
		"Pulsa {0} para continuar": "Appuie sur {0} pour continuer",
		"Mueve un stick para seguir": "Bouge un stick pour continuer",
		"PULSA {0} PARA EMPEZAR": "{0} POUR COMMENCER",
		"CABEZAZO · jala el stick derecho y suelta": "TETE · tire le stick droit et relâche",
		"Empuja el stick izquierdo y corres hacia donde lo empujas. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Pousse le stick gauche et tu cours dans le sens où tu le pousses. Lâche-le et tu t'arrêtes net. Emmène le ballon jusqu'au disque rouge : quand tu marches dessus il s'éteint et allume le suivant, toujours de l'autre côté. Conduire, c'est choisir où aller, pas courir tout droit.",
		"Dos sticks: el izquierdo conduce y el derecho tira. Jala el derecho hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltarlo, apunta al balón con el izquierdo y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "Deux sticks : le gauche conduit et le droit frappe. Tire le droit vers l'arrière comme un lance-pierre : le guide pointe vers l'avant. En le relâchant, vise le ballon avec le gauche et appuie sur {0} — et l'endroit où tu le frappes commande. La première fois, le ballon est peint par zones : en haut elle part rasante et lente, en bas elle monte et retombe, sur les côtés elle prend de l'effet. Et plus tu vas vers le bord, moins il y a de puissance : la frappe sèche part du centre.",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: {2} gira la vista a la banda y te enseña a los compañeros; otra vez y vuelve.": "Il n'y a pas de bouton de passe : passer, c'est TIRER en visant un coéquipier, et le ballon revient à celui qui arrive le premier. Tu en as deux : celui hors de la surface et celui dedans. Si ta passe tombe hors de la surface, tu passes à jouer avec celui qui la reçoit. Si elle tombe dedans, aucun contrôle n'est possible : il reprend de volée. Et pour les voir : {2} tourne la vue vers la touche et te montre tes coéquipiers ; encore une fois et elle revient.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con el stick izquierdo y tira con el derecho cuando lo veas.": "Des rivaux sur toi et le terrain devant : conduis et FRANCHIS le camp adverse — jusqu'à la ligne allumée on ne tire pas, on dribble, et chaque portion gagnée fait surgir de nouveaux joueurs. Ensuite, le un contre un : conduis avec le stick gauche et tire avec le droit quand tu le sens.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el botón TIRO/CENTRO de la pantalla. Para cambiar entre CENTRO (colgado) y TIRO (raso), pulsa {1} mientras apuntas. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "Ce sont des CENTRES : le ballon est envoyé dans la surface. Un corner naît déjà en CENTRE ; le bouton TIR/CENTRE à l'écran le dit. Pour passer de CENTRE (en cloche) à TIR (à ras de terre), appuie sur {1} pendant que tu vises. Cherche la tête d'un coéquipier, pas le but. Et pour finir, le changement d'aile : le même service, mais en cherchant le coéquipier libre à l'opposé.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con el stick izquierdo, pásala con el derecho a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "Tu pars de ton camp avec le ballon et le but au loin. Conduis avec le stick gauche, passe à un coéquipier avec le droit et continue : la passe se frappe comme un tir et tu joues celui qui la reçoit. Si tu restes derrière sans avancer, l'adversaire presse plus fort. Ensuite, le un contre un : tire quand tu le sens.",
		"Con {1} cambias entre CENTRO y TIRO.": "{1} change entre CENTRE et TIR.",
		"Apunta al área y aguanta el stick.": "Vise la surface et garde le stick.",
		"Sueltas, apuntas y pulsas {0}.": "Lâche, vise et appuie sur {0}.",
		"Stick izquierdo para conducir; jala el derecho y suelta para tirar": "Stick gauche pour conduire ; tire le droit et relâche pour frapper",
		"Stick izquierdo para conducir; no se tira": "Stick gauche pour conduire ; pas de tir",
		"Stick izquierdo para conducir; apunta con el derecho a un compañero y suelta": "Stick gauche pour conduire ; vise un coéquipier avec le droit et relâche",
		"Mientras apuntas, {0} elige compañero y {1} cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.": "Pendant que tu vises, {0} choisit un coéquipier et {1} change son ordre. Bleu clair fonce au but, ambre reste, magenta entraîne son marqueur ailleurs.",
		"STICK DERECHO: CÁMARA · {0}/{1}: BUSCAR · {2}/{3}: RITMO": "STICK DROIT: CAMERA · {0}/{1}: DEFILER · {2}/{3}: VITESSE",
		"LB ALTERNA": "LB BASCULE",
		"¿SALIR DEL JUEGO?": "QUITTER LE JEU ?",
		"MUEVE EL STICK PARA GIRAR": "BOUGE LE STICK POUR VIRER",
		"PULSA {0} PARA OTRA": "{0} POUR REJOUER",
		"Mueve la pala con el stick. {0} para sacar.": "Bouge la raquette avec le stick. {0} pour servir.",
		"Pulsa {0} para firmar": "Appuie sur {0} pour signer",
		"Gira el campo con el stick derecho. Los esquemas son de consulta.": "Tourne le terrain avec le stick droit. Les schémas sont à titre indicatif.",
		"Apunta con WASD · pulsa {0}": "Vise avec WASD · appuie sur {0}",
		"WASD para moverte · llega al balón y remata": "WASD pour bouger · rejoins le ballon et frappe",
		"Pulsa WASD o una flecha para seguir": "Appuie sur WASD ou une flèche pour continuer",
		"CABEZAZO · mantén una flecha y suelta": "TETE · maintiens une flèche et relâche",
		"HAZ CLIC PARA CONTINUAR": "CLIQUE POUR CONTINUER",
		"HAZ CLIC EN EL ARO": "CLIQUE SUR PANIER",
		"¡ARRASTRA HACIA ÉL!": "GLISSE VERS LUI !",
		"Arrastra para girar el campo. Los esquemas son de consulta.": "Glisse pour faire tourner le terrain. Les schémas sont à titre de consultation.",
		"El coche acelera solo. Gira con las flechas y frena con la de abajo.": "La voiture accélère toute seule. Tourne avec les flèches et freine avec celle du bas.",
		"Arrastra el balón hacia la canasta. Más rápido, más fuerte.": "Glisse le ballon vers le panier. Plus vite, plus fort.",
		"ARRASTRA HACIA LA CANASTA": "GLISSE VERS LE PANIER",
		"HAZ CLIC PARA OTRA": "CLIQUE: ENCORE",
		"USA LAS FLECHAS PARA GIRAR": "UTILISE LES FLECHES",
		"Arrastra hacia el aro y suelta.": "Glisse vers le panier et relâche.",
		"Mantén una flecha y suelta para tirar": "Maintiens une flèche et relâche pour tirer",
		"Mantén una flecha y suelta para centrar": "Maintiens une flèche et relâche pour centrer",
		"teclaESPACIO": "ESPACE",
		"teclaMAYÚS": "MAJ",
		"Con WASD corres hacia donde pulsas. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Avec WASD tu cours dans le sens où tu appuies. Lâche-les et tu t'arrêtes net. Emmène le ballon jusqu'au disque rouge : en le piétinant, il s'éteint et le suivant s'allume, toujours de l'autre côté. Conduire, c'est choisir où aller, pas courir tout droit.",
		"WASD conduce y las flechas tiran. Mantén una flecha, como una resortera: la guía apunta al lado contrario. Al soltarla, apunta al balón con WASD y pulsa {0} — y dónde le pegas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro.": "WASD conduit et les flèches frappent. Maintiens une flèche, comme un lance-pierre : le guide pointe du côté opposé. En la relâchant, vise le ballon avec WASD et appuie sur {0} — et l'endroit où tu le frappes commande. La première fois, le ballon est peint par zones : en haut elle part rasante et lente, en bas elle monte et retombe, sur les côtés elle prend de l'effet. Et plus tu vas vers le bord, moins il y a de puissance : la frappe sèche part du centre.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: conduce con WASD y tira con las flechas cuando lo veas.": "Des adversaires sur toi et le terrain devant : conduis et FRANCHIS dans le camp adverse — jusqu'à la ligne allumée on ne tire pas, on dribble, et à chaque tronçon gagné de nouveaux joueurs te barrent la route. Ensuite, le face-à-face : conduis avec WASD et tire avec les flèches quand tu le vois.",
		"Naces en tu campo con el balón y el arco lejos. Conduce con WASD, pásala con las flechas a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira cuando lo veas.": "Tu démarres dans ton camp avec le ballon et le but loin. Conduis avec WASD, passe-la avec les flèches à un coéquipier et continue : la passe se frappe comme un tir et tu joues avec celui qui la reçoit. Si tu restes derrière sans avancer, l'adversaire presse. Ensuite, le face-à-face : tire quand tu le vois.",
		"Sueltas, apuntas con WASD y pulsas {0}.": "Lâche, vise avec WASD et appuie sur {0}.",
		"Apunta al área y aguanta la flecha.": "Vise la surface et garde la flèche.",
		"WASD para conducir; mantén una flecha y suelta para tirar": "WASD pour conduire ; maintiens une flèche et relâche pour tirer",
		"WASD para conducir; no se tira": "WASD pour conduire ; pas de tir",
		"WASD para conducir; mantén una flecha hacia un compañero y suelta": "WASD pour conduire ; maintiens une flèche vers un coéquipier et relâche",
		"PULSA LAS TECLAS O HAZ CLIC": "TAPE AU CLAVIER OU CLIQUE",
		"LA PARTIDA ESTÁ GUARDADA": "PARTIE SAUVEGARDEE",
		"SE PIERDE PARA SIEMPRE": "PERDU POUR TOUJOURS",
		"NO HAY VUELTA ATRÁS": "IRREVERSIBLE",
		"SALIR DEL PARTIDO": "QUITTER LE MATCH",
		"¿SALIR DEL PARTIDO?": "QUITTER LE MATCH ?",
		"¿REINICIAR EL PARTIDO?": "RECOMMENCER LE MATCH ?",
		"¿{0}?": "{0} ?",
		"APUNTA Y TIRA": "VISE ET TIRE",
		"GOLPEA": "FRAPPE",
		"TIRO O CENTRO": "TIR OU CENTRE",
		"CANCELA": "ANNULE",
		"ORDENA": "ORDONNE",
		"COMPAÑERO U OBJETIVO": "COEQUIPIER OU CIBLE",
		"MANTIENE": "GARDE",
		"CÁMARA": "CAMERA",
		"SE PIERDE LO JUGADO": "LE JEU EST PERDU",
		"EL PARTIDO QUEDA POR JUGAR": "LE MATCH RESTE A JOUER",
		"VUELVES AL 0' CON LA MISMA ENERGÍA": "RETOUR A 0' AVEC LA MEME ENERGIE",
		"SE PIERDEN LAS ESTRELLAS": "LES ETOILES SONT PERDUES",
		"MUEVE": "DEPLACE",
		"A/B NINTENDO": "A/B NINTENDO",
		"CORRE Y TIRA": "COURS ET TIRE",
		"Mantén {0} para correr · cruza al campo rival": "Maintiens {0} pour courir · passe dans leur moitié de terrain",
		"Mantén {0} para correr · lleva el balón a la zona roja": "Maintiens {0} pour courir · amène le ballon dans la zone rouge",
		"Empuja el stick izquierdo y vas al paso hacia donde lo empujas; mantén {3} y corres. Suéltalo y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Pousse le stick gauche et tu avances au pas dans le sens où tu le pousses ; maintiens {3} et tu cours. Lâche-le et tu t'arrêtes net. Emmène le ballon jusqu'au disque rouge : en le piétinant, il s'éteint et le suivant s'allume, toujours de l'autre côté. Conduire, c'est choisir où aller, pas courir tout droit.",
		"Con WASD vas al paso hacia donde pulsas; mantén {3} y corres. Suéltalas y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Avec WASD tu avances au pas dans le sens où tu appuies ; maintiens {3} et tu cours. Lâche-les et tu t'arrêtes net. Emmène le ballon jusqu'au disque rouge : en le piétinant, il s'éteint et le suivant s'allume, toujours de l'autre côté. Conduire, c'est choisir où aller, pas courir tout droit.",
		"Empuja este stick hacia el disco; con {3}, corres.": "Pousse ce stick vers le disque ; avec {3}, tu cours.",
		"Pulsa WASD y vas al disco; con {3}, corres.": "Appuie sur WASD et tu vas au disque ; avec {3}, tu cours.",
		"CANCELA O PAUSA": "ANNULE OU PAUSE",
		"CORRE": "COURS",
	},


	"previa_pases": {
		"MÁXIMO GOLEADOR": "MEILLEUR BUTEUR",
		"MÁXIMO ASISTENTE": "MEILLEUR PASSEUR",
		"{0} EN GOLEO": "{0} DES BUTEURS",
	},

	"amigos": {
		"AMIGOS": "AMIS",
		"TABLA": "TABLEAU",
		"TU CÓDIGO": "TON CODE",
		"INVITAR": "INVITER",
		"TÍTULOS": "TITRES",
		"{0} AÑOS · TEMPORADA {1}": "{0} ANS · SAISON {1}",
		"HACE {0} D": "IL Y A {0} J",
		"Vista previa: amigos de ejemplo": "Aperçu : amis d'exemple",
		"AGREGAR AMIGO": "AJOUTER UN AMI",
		"AGREGAR": "AJOUTER",
		"CÓDIGO NO ENCONTRADO": "CODE INTROUVABLE",
		"ES TU CÓDIGO": "C'EST TON CODE",
		"SIN CONEXIÓN": "PAS DE CONNEXION",
		"Amigo agregado.": "Ami ajouté.",
		"Juega Football Legacy conmigo: {0} · código {1}": "Joue à Football Legacy avec moi : {0} · code {1}",
		"Invitación copiada.": "Invitation copiée.",
		"¿SALIR DE LA LIGA?": "QUITTER LA LIGUE ?",
		"Si vuelves, empiezas de 0.": "Si tu reviens, tu repars de 0.",
		"No podrás volver.": "Tu ne pourras pas revenir.",
		"Empieza una carrera para compararte.": "Commence une carrière pour te comparer.",
		"{0} fichó por {1}": "{0} a signé à {1}",
		"{0} ganó la liga": "{0} a gagné le championnat",
		"{0} se lesionó: {1} semanas": "{0} s'est blessé : {1} semaines",
		"{0} subió a {1} de media": "{0} est passé à {1} de note",
		"{0} llegó a {1} goles": "{0} a atteint {1} buts",
		"{0} ganó el premio al Jugador del Año": "{0} a été élu Joueur de l'Année",
		"VER CASA": "VOIR MAISON",
		"CASA DE {0}": "MAISON DE {0}",
		"AÚN NO HAY CASA": "PAS ENCORE DE MAISON",
		"TU CALLE": "TA RUE",
		"VECINOS": "VOISINS",
		"apodoCAÑÓN": "CANON",
		"apodoRAYO": "ECLAIR",
		"apodoCOHETE": "FUSEE",
		"apodoTANQUE": "TANK",
		"apodoMURO": "MUR",
		"apodoTORNADO": "TORNADE",
		"apodoTITÁN": "TITAN",
		"apodoLEÓN": "LION",
		"apodoTIBURÓN": "REQUIN",
		"apodoHALCÓN": "FAUCON",
		"apodoLOBO": "LOUP",
		"apodoTORO": "TAUREAU",
		"apodoMAGO": "MAGICIEN",
		"apodoCÓNDOR": "CONDOR",
		"apodoTRUENO": "TONNERRE",
		"apodoVOLCÁN": "VOLCAN",
		"apodoDE ORO": "D'OR",
		"apodoDE ACERO": "D'ACIER",
		"apodoDE FUEGO": "DE FEU",
		"apodoDE HIELO": "DE GLACE",
		"apodoDEL SUR": "DU SUD",
		"apodoDEL NORTE": "DU NORD",
		"apodoDEL BARRIO": "DU QUARTIER",
		"apodoDEL ÁREA": "DE LA SURFACE",
		"apodoDE PLATA": "D'ARGENT",
		"apodoDE LEYENDA": "DE LEGENDE",
		"apodoIMPARABLE": "IMPARABLE",
		"apodoVELOZ": "VELOCE",
		"apodoLETAL": "SANS PITIE",
		"apodoSALVAJE": "SAUVAGE",
		"apodoSIN FRENO": "SANS FREIN",
		"apodoDE MEDIANOCHE": "DE MINUIT",
		"apodo{0} {1} {2}": "{0} {1} {2}",
		"ELIGE TU NOMBRE": "CHOISIS TON NOM",
		"ESCRIBE TU NOMBRE": "ECRIS TON NOM",
		"Lo ven todos. Un nombre ofensivo se puede denunciar.": "Tout le monde le voit. Un nom offensant peut être signalé.",
		"MÁXIMO 16 LETRAS": "16 LETTRES MAX",
		"SÓLO LETRAS Y NÚMEROS": "LETTRES ET CHIFFRES SEULEMENT",
		"MÍNIMO 2 LETRAS": "2 LETTRES MINIMUM",
		"ESE NOMBRE NO SE PUEDE USAR": "CE NOM N'EST PAS AUTORISE",
		"OCULTAR SU NOMBRE": "MASQUER SON NOM",
		"MOSTRAR SU NOMBRE": "AFFICHER SON NOM",
		"DENUNCIAR": "SIGNALER",
		"AMIGOS crea un perfil anónimo y sube tu carrera y tu apodo para rankings y retos.": "AMIS crée un profil anonyme et envoie ta carrière et ton pseudo pour les classements et les défis.",
		"Tolerancia cero con apodos ofensivos o abusivos.": "Tolérance zéro pour les pseudos offensants ou abusifs.",
		"AHORA NO": "PAS MAINTENANT",
		"BORRAR MI CUENTA": "SUPPRIMER MON COMPTE",
		"¿BORRAR TU CUENTA?": "SUPPRIMER TON COMPTE ?",
		"Se borran del servidor tu perfil, amigos, retos, ligas, ranking y casa. Tu carrera en este dispositivo no se toca.": "Ton profil, tes amis, défis, ligues, classement et maison sont supprimés du serveur. Ta carrière sur cet appareil n'est pas touchée.",
		"Cuenta borrada.": "Compte supprimé.",
		"No se pudo borrar. Revisa tu conexión e inténtalo luego.": "Impossible de supprimer. Vérifie ta connexion et réessaie plus tard.",
		"QUITAR AMIGO": "RETIRER L'AMI",
		"¿QUITAR AMIGO?": "RETIRER L'AMI ?",
		"¿DENUNCIAR?": "SIGNALER ?",
		"Deja de ser tu amigo y se oculta su nombre.": "Il ne sera plus ton ami et son nom sera masqué.",
		"Deja de ser tu amigo.": "Il ne sera plus ton ami.",
		"Queda bloqueado: no vuelve a aparecer en AMIGOS.": "Bloqué : il n'apparaîtra plus dans AMIS.",
		"BLOQUEAR": "BLOQUER",
		"Al aceptar, aceptas estas normas: tolerancia cero con el contenido ofensivo y con los usuarios abusivos. Lo denunciado se oculta y la cuenta se expulsa.": "En acceptant, tu acceptes ces règles : tolérance zéro pour les contenus offensants et les utilisateurs abusifs. Ce qui est signalé est masqué et le compte est exclu.",
		"cocheSUBIR": "MONTER",
		"BAJAR": "SORTIR",
		"FRENO": "FREIN",
		"KM/H": "KM/H",
		"R": "R",
		"ACELERA": "GAZ",
	},


	"amigos_retos": {
		"RETOS": "DEFIS",
		"RETO": "DEFI",
		"RETAR": "DEFIER",
		"RETAR A UN AMIGO": "DEFIER UN AMI",
		"JUGADAS": "TIRS",
		"{0} JUGADAS": "{0} TIRS",
		"{0} · {1} JUGADAS": "{0} · {1} TIRS",
		"TE TOCA": "A TOI",
		"ESPERANDO": "EN ATTENTE",
		"ENVIANDO": "ENVOI",
		"CADUCADO": "EXPIRE",
		"QUEDAN {0} H": "RESTE {0} H",
		"QUEDAN {0} D": "RESTE {0} J",
		"Sin conexión: lo último guardado": "Hors ligne : dernière sauvegarde",
		"+{0} ★ por amigo que juegue 10 partidos": "+{0} ★ par ami qui joue 10 matchs",
		"+{0} ★ por invitar amigos": "+{0} ★ pour tes invitations",
		"Aún no hay novedades de tus amigos.": "Pas encore de nouvelles de tes amis.",
		"Reta a un amigo: mismas jugadas para los dos, gana quien marque más.": "Défie un ami : mêmes tirs pour les deux, le plus de buts gagne.",
		"Agrega un amigo para retarlo.": "Ajoute un ami pour le défier.",
		"Reto enviado.": "Défi envoyé.",
		"Sólo vale el primer intento. Si sales, cuenta lo que lleves.": "Seul le premier essai compte. Si tu quittes, ton score actuel reste.",
		"Marca guardada. El resultado sale cuando juegue tu amigo.": "Score enregistré. Le résultat s'affiche quand ton ami joue.",
		"SALIR DEL RANKING": "QUITTER LE CLASSEMENT",
		"ENTRAR EN EL RANKING": "REJOINDRE LE CLASSEMENT",
		"DEMASIADOS RETOS HOY": "TROP DE DEFIS",

		"EN GRUPO": "EN GROUPE",
		"RETO EN GRUPO": "DEFI DE GROUPE",
		"ELIGE AL MENOS 2 AMIGOS": "CHOISIS AU MOINS 2 AMIS",
		"PUESTO {0} DE {1}": "PLACE {0} SUR {1}",
		"Las marcas de los demás se ven al terminar la tuya.": "Les scores des autres s'affichent quand tu as fini le tien.",
		"Agrega al menos dos amigos para un reto en grupo.": "Ajoute au moins deux amis pour un défi de groupe.",
		"Marca guardada. El resultado sale cuando jueguen todos.": "Score enregistré. Le résultat s'affiche quand tout le monde a joué.",
		"YA NO ES TU AMIGO": "N'EST PLUS TON AMI",
		"YA LO JUGASTE": "DEJA JOUE",
		"RETO CADUCADO": "DEFI EXPIRE",
		"{0} ganó un título": "{0} a gagné un titre",
		"{0} ganó un premio individual": "{0} a remporté un prix individuel",
		"{0} colgó las botas": "{0} a raccroché les crampons",
		"Guante Lanzado": "Gant Jeté",
		"Jugar tu primer reto contra un amigo.": "Joue ton premier défi contre un ami.",
		"El Pique": "Le Chambrage",
		"Ganar un reto a un amigo.": "Gagne un défi contre un ami.",
		"Rey del Barrio": "Roi du Quartier",
		"Ganar 10 retos a tus amigos.": "Gagne 10 défis contre tes amis.",
		"Pleno": "Sans-Faute",
		"Marcar todas en un reto de 10 o 15 jugadas.": "Marque tous tes tirs dans un défi de 10 ou 15 tirs.",
		"Padrino": "Parrain",
		"Que un amigo que invitaste juegue 10 partidos.": "Un ami que tu as invité joue 10 matchs.",
		"Cazatalentos": "Dénicheur de Talents",
		"Que 5 amigos que invitaste jueguen 10 partidos.": "5 amis que tu as invités jouent 10 matchs.",
	},

	"amigos_carreras": {
		"{0} CARRERAS": "{0} CARRIERES",
		"SU JUGADOR": "SON JOUEUR",
		"JUEGAS CON": "TU JOUES AVEC",
	},


	"logros_hito": {
		"Oro Precoz": "Or Précoce",
		"Ganar el Balón de Oro antes de cumplir 19 años.": "Gagner le titre de Joueur de l'Année avant tes 19 ans.",
		"Triplete": "Triplé",
		"Liga, copa y tu gran copa continental en la misma temporada.": "Championnat, coupe et ta grande coupe continentale la même saison.",
		"Último Baile": "La Dernière Danse",
		"Levantar un título en tu temporada de retiro.": "Soulever un titre lors de ta saison d'adieu.",
		"De la Nada": "Parti de Rien",
		"Debutar en Tercera y ganar la liga de Primera en la misma carrera.": "Débuter en troisième division et gagner le championnat de première dans la même carrière.",
		"Álbum de un Continente": "L'Album d'un Continent",
		"Completar en la VITRINA todas las ligas y copas de una confederación.": "Compléter dans la VITRINE tous les championnats et coupes d'une confédération.",
		"La Vitrina Completa": "La Vitrine Complète",
		"Completar el álbum de la VITRINA al 100 %.": "Compléter l'album de la VITRINE à 100 %.",
		"Sextete": "Sextuplé",
		"Seis títulos con tu club en doce meses.": "Six titres avec ton club en douze mois.",
		"Desde la Primera Ronda": "Depuis le Premier Tour",
		"Ganar una copa de Europa entrando por la primera ronda previa.": "Gagner une coupe d'Europe en entrant dès le premier tour de qualification.",
	},


	"vitrina_album": {
		"NACIONAL": "NATIONAL",
		"Ganado {0} veces.": "Gagné {0} fois.",
		"Trofeo por ganar. Sigue jugando tu carrera.": "Trophée à gagner. Continue ta carrière.",
	},






	"grada_tifos": {
		"EL TIFO DEL DERBI": "LE TIFO DU DERBY",
		"La peña está pintando las cartulinas para el derbi contra {0} y te pregunta si pones el dinero. Si lo pones, el domingo la curva levanta tu número.": "Le groupe de supporters peint les cartons pour le derby contre {0} et te demande si tu mets l'argent. Si tu le fais, dimanche le virage brandira ton numéro.",
		"PAGAR EL TIFO": "PAYER LE TIFO",
		"QUE SAQUEN SU ESCUDO": "LEUR BLASON SUFFIRA",
		"Premio de la Afición": "Prix des Supporters",
		"EL ESTADIO, EN PIE: APLAUDEN TU DORSAL": "LE STADE DEBOUT POUR TON NUMERO",
		"TU EX GRADA, EN PIE: APLAUDEN TU DORSAL": "TES ANCIENS FANS DEBOUT POUR TON NUMERO",
		"PAÑUELOS BLANCOS EN LA GRADA: VAN POR TI": "MOUCHOIRS BLANCS : C'EST CONTRE TOI",
		"PAÑUELOS BLANCOS CONTRA EL PALCO": "MOUCHOIRS BLANCS VERS LA LOGE",
		"PAÑOLADA": "GROGNE",
		"OS VAIS A VUESTRA GRADA: OS APLAUDEN IGUAL": "VERS VOS FANS : ILS APPLAUDISSENT",
		"OS VAIS A VUESTRA GRADA: PITOS Y PAÑUELOS": "VERS VOS FANS : SIFFLETS, MOUCHOIRS",
		"APLAUSOS": "BRAVOS",
		"PITOS": "HUEES",
		"REGALO": "CADEAU",
		"{0} le da su camiseta a un niño de la grada": "{0} offre son maillot à un enfant dans les tribunes",
		"Goleada ante el {0}: la grada del {1} aplaude igual": "Corrigé par {0} : les supporters de {1} applaudissent quand même",
		"Goleada ante el {0}: pitos y pañuelos para el {1}": "Corrigé par {0} : sifflets et mouchoirs pour {1}",
		"FIRMA TU CAMISETA": "SIGNE TON MAILLOT",
		"Es para el niño del cartel": "C'est pour le gamin à la pancarte",
		"Marcaste, y el niño del cartel se lleva tu camiseta.": "Tu as marqué, et le gamin à la pancarte repart avec ton maillot.",
		"TRIBUNA {0}": "TRIBUNE {0}",
		"Es para tu hincha de siempre": "C'est pour ton supporter de toujours",
		"Tu hincha de siempre se lleva tu camiseta.": "Ton supporter de toujours repart avec ton maillot.",
		"Le negaste tu camiseta a tu hincha de siempre.": "Tu as refusé ton maillot à ton supporter de toujours.",
	},
	"ajustes_tumbado": {

		"ZURDO": "GAUCHER",
		"TAMAÑO": "TAILLE",
		"OPACIDAD": "OPACITE",
		"CRT": "CRT",
		"ICONO": "ICONE",
		"DATOS": "DONNEES",
		"TELÉFONO": "MOBILE",
		"CUMPLE": "ANNIV",
		"MOVIMIENTO": "MOUVEMENT",
		"SACUDIDA": "SECOUSSE",
		"MANDO": "PAD",
		"CONECTAR": "LIER",
		"CONECTADO": "CONNECTE",
		"ESPERANDO MANDO": "ATTENTE PAD",
		"EN EL MANDO": "SUR LE PAD",
		"EN EL TELÉFONO": "SUR LE MOBILE",
		"EN EL ORDENADOR": "SUR LE PC",
		"MANTÉN": "TIENS",
		"HASTA QUE PARPADEE": "JUSQU'AU CLIGNOT.",
		"EMPAREJAR": "ASSOCIER",
		"SINCRONIZAR": "SYNC",
		"TOCA EL MANDO": "TOUCHE LE PAD",
		"VINCULAR": "ASSOCIER",
		"PRIVACIDAD": "VIE PRIVEE",
		"LICENCIAS": "LICENCES",
		"Licencia: {0}": "Licence : {0}",
	},






	"copas_america": {
		"COPA GLORIA": "COUPE GLOIRE",
		"Copa Gloria": "Coupe Gloire",
		"LIBERTADORES": "COUPE GLOIRE",
		"COPA DEL SUR": "COUPE DU SUD",
		"Copa del Sur": "Coupe du Sud",
		"SUDAMERICANA": "COUPE DU SUD",
		"COPA DEL NORTE": "COUPE DU NORD",
		"Copa del Norte": "Coupe du Nord",
		"CONCACAF CHAMPIONS CUP": "COUPE DU NORD",
		"MEJOR DE LA COPA GLORIA": "MEILLEUR DE LA COUPE GLOIRE",
		"MEJOR DE LA COPA DEL SUR": "MEILLEUR DE LA COUPE DU SUD",
		"MEJOR DE LA COPA DEL NORTE": "MEILLEUR DE LA COUPE DU NORD",
		"Todo un continente soñando con esta copa. Y la levantas tú.":
			"Tout un continent rêve de cette coupe. Et c'est toi qui la soulèves.",
		"La otra copa de América. Se suda igual y se levanta igual.":
			"L'autre coupe d'Amérique. On y transpire autant, on la soulève pareil.",
		"El norte del continente entero, a tus pies.":
			"Tout le nord du continent à tes pieds.",
		"El mejor de América en la copa que todo el continente mira.":
			"Le meilleur d'Amérique dans la coupe que tout le continent regarde.",
		"El mejor de la otra copa de América. Nadie la jugó como tú.":
			"Le meilleur de l'autre coupe d'Amérique. Personne ne l'a jouée comme toi.",
		"El mejor del norte del continente. Las noches de copa fueron tuyas.":
			"Le meilleur du nord du continent. Les soirs de coupe étaient à toi.",
		"Previa": "Tour préliminaire",
		"PREVIA": "TOUR PRELIMINAIRE",
		"Preliminar": "Préliminaire",
		"PRELIMINAR": "PRELIMINAIRE",
		"Campeón de Libertadores": "Vainqueur de la Coupe Gloire",
		"Campeón de Copa Gloria": "Vainqueur de la Coupe Gloire",
		"Campeón de Sudamericana": "Vainqueur de la Coupe du Sud",
		"Campeón de Copa del Sur": "Vainqueur de la Coupe du Sud",
		"Campeón de Concacaf": "Vainqueur de la Coupe du Nord",
		"Campeón de Copa del Norte": "Vainqueur de la Coupe du Nord",
		"Bota de la Libertadores": "Soulier de la Coupe Gloire",
		"Bota de la Copa Gloria": "Soulier de la Coupe Gloire",
		"Bota de la Sudamericana": "Soulier de la Coupe du Sud",
		"Bota de la Copa del Sur": "Soulier de la Coupe du Sud",
		"Bota de la Concacaf": "Soulier de la Coupe du Nord",
		"Bota de la Copa del Norte": "Soulier de la Coupe du Nord",
		"Máximo Asistente de la Libertadores": "Meilleur passeur de la Coupe Gloire",
		"Máximo Asistente de la Copa Gloria": "Meilleur passeur de la Coupe Gloire",
		"Máximo Asistente de la Sudamericana": "Meilleur passeur de la Coupe du Sud",
		"Máximo Asistente de la Copa del Sur": "Meilleur passeur de la Coupe du Sud",
		"Máximo Asistente de la Concacaf": "Meilleur passeur de la Coupe du Nord",
		"Máximo Asistente de la Copa del Norte": "Meilleur passeur de la Coupe du Nord",
		"Mejor de la Libertadores": "Meilleur joueur de la Coupe Gloire",
		"Mejor de la Copa Gloria": "Meilleur joueur de la Coupe Gloire",
		"Mejor de la Sudamericana": "Meilleur joueur de la Coupe du Sud",
		"Mejor de la Copa del Sur": "Meilleur joueur de la Coupe du Sud",
		"Mejor de la Concacaf": "Meilleur joueur de la Coupe du Nord",
		"Mejor de la Copa del Norte": "Meilleur joueur de la Coupe du Nord",
		"¡Campeón de Copa Gloria!": "Champion de la Coupe Gloire !",
		"¡Campeón de Copa del Sur!": "Champion de la Coupe du Sud !",
		"¡Campeón de Copa del Norte!": "Champion de la Coupe du Nord !",
		"¡CAMPEÓN DE COPA GLORIA!": "CHAMPION DE LA COUPE GLOIRE !",
		"¡CAMPEÓN DE COPA DEL SUR!": "CHAMPION DE LA COUPE DU SUD !",
		"¡CAMPEÓN DE COPA DEL NORTE!": "CHAMPION DE LA COUPE DU NORD !",
		"Clasificado a Copa Gloria": "Qualifié pour la Coupe Gloire",
		"Clasificado a Copa del Sur": "Qualifié pour la Coupe du Sud",
		"Clasificado a Copa del Norte": "Qualifié pour la Coupe du Nord",
		"Fase final de Copa Gloria": "Phase finale de la Coupe Gloire",
		"Fase final de Copa del Sur": "Phase finale de la Coupe du Sud",
		"Fase final de Copa del Norte": "Phase finale de la Coupe du Nord",
		"Mejor (Copa Gloria)": "Meilleur (Coupe Gloire)",
		"Mejor (Copa del Sur)": "Meilleur (Coupe du Sud)",
		"Mejor (Copa del Norte)": "Meilleur (Coupe du Nord)",
		"Bota (Copa Gloria)": "Soulier (Coupe Gloire)",
		"Bota (Copa del Sur)": "Soulier (Coupe du Sud)",
		"Bota (Copa del Norte)": "Soulier (Coupe du Nord)",
		"Asist. (Copa Gloria)": "Pass. (Coupe Gloire)",
		"Asist. (Copa del Sur)": "Pass. (Coupe du Sud)",
		"Asist. (Copa del Norte)": "Pass. (Coupe du Nord)",
		"Gloria Eterna": "Gloire éternelle",
		"Rey del Sur": "Roi du Sud",
		"Rey del Norte": "Roi du Nord",
		"Amo de América": "Maître des Amériques",
		"Dos Mundos": "Deux mondes",
		"Cerebro de la Libertadores": "Cerveau de la Coupe Gloire",
		"Cerebro de la Copa Gloria": "Cerveau de la Coupe Gloire",
		"Cerebro de la Sudamericana": "Cerveau de la Coupe du Sud",
		"Cerebro de la Copa del Sur": "Cerveau de la Coupe du Sud",
		"Cerebro de la Concacaf": "Cerveau de la Coupe du Nord",
		"Cerebro de la Copa del Norte": "Cerveau de la Coupe du Nord",
		"Ganar la Libertadores.": "Gagner la Coupe Gloire.",
		"Ganar la Copa Gloria.": "Gagner la Coupe Gloire.",
		"Ganar la Sudamericana.": "Gagner la Coupe du Sud.",
		"Ganar la Copa del Sur.": "Gagner la Coupe du Sud.",
		"Ganar la Concacaf Champions Cup.": "Gagner la Coupe du Nord.",
		"Ganar la Copa del Norte.": "Gagner la Coupe du Nord.",
		"Ser el máximo goleador de la Libertadores.": "Finir meilleur buteur de la Coupe Gloire.",
		"Ser el máximo goleador de la Copa Gloria.": "Finir meilleur buteur de la Coupe Gloire.",
		"Ser el máximo goleador de la Sudamericana.": "Finir meilleur buteur de la Coupe du Sud.",
		"Ser el máximo goleador de la Copa del Sur.": "Finir meilleur buteur de la Coupe du Sud.",
		"Ser el máximo goleador de la Concacaf Champions Cup.": "Finir meilleur buteur de la Coupe du Nord.",
		"Ser el máximo goleador de la Copa del Norte.": "Finir meilleur buteur de la Coupe du Nord.",
		"Máximo asistente de la Libertadores.": "Meilleur passeur de la Coupe Gloire.",
		"Máximo asistente de la Copa Gloria.": "Meilleur passeur de la Coupe Gloire.",
		"Máximo asistente de la Sudamericana.": "Meilleur passeur de la Coupe du Sud.",
		"Máximo asistente de la Copa del Sur.": "Meilleur passeur de la Coupe du Sud.",
		"Máximo asistente de la Concacaf Champions Cup.": "Meilleur passeur de la Coupe du Nord.",
		"Máximo asistente de la Copa del Norte.": "Meilleur passeur de la Coupe du Nord.",
		"Ganar la Libertadores con 3 clubes distintos.": "Gagner la Coupe Gloire avec 3 clubs différents.",
		"Ganar la Copa Gloria con 3 clubes distintos.": "Gagner la Coupe Gloire avec 3 clubs différents.",
		"Ganar la Champions y también la Libertadores o la Concacaf Champions Cup.": "Gagner la Coupe Elite et aussi la Coupe Gloire ou la Coupe du Nord.",
		"Ganar la Copa de Campeones y también la Copa Gloria o la Copa del Norte.": "Gagner la Coupe Elite et aussi la Coupe Gloire ou la Coupe du Nord.",
		"Máximo goleador de tu liga Y de tu gran copa continental en la misma temporada.": "Meilleur buteur de ton championnat ET de ta grande coupe continentale la même saison.",
		"Ganar los seis grandes: liga, copa, tu gran copa continental, Mundial de Clubes, continental y Mundial.": "Gagner les six grands : championnat, coupe, ta grande coupe continentale, Mondial des clubs, continentale et Mondial.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de esa copa.": "En PREMIERE et en une seule saison : championnat, coupe et ta grande coupe continentale, plus Joueur de l'Année, MVP et meilleur buteur du championnat, et MVP et soulier de cette coupe.",
		"En PRIMERA y en una sola temporada: liga, copa y tu gran copa continental, más Jugador del Año, MVP y goleo de la liga, y MVP y bota de esa copa.": "En PREMIERE et en une seule saison : championnat, coupe et ta grande coupe continentale, plus Joueur de l'Année, MVP et meilleur buteur du championnat, et MVP et soulier de cette coupe.",
		"TORNEOS CONTINENTALES": "COUPES CONTINENTALES",
		"continentales": "coupes continentales",
		"bota_libertadoresBota de la Libertadores": "Soulier de la Coupe Gloire",
		"bota_sudamericanaBota de la Sudamericana": "Soulier de la Coupe du Sud",
		"bota_concacafBota de la Concacaf": "Soulier de la Coupe du Nord",
		"max_asist_sudCerebro de la Sudamericana": "Cerveau de la Coupe du Sud",
		"nombre del logro max_asist_sudCerebro de la Sudamericana": "Cerveau de la Coupe du Sud",



		"tabGLORIA": "GLOIRE",
		"tabSUR": "SUD",
		"tabNORTE": "NORD",
		"GLO": "CG",
		"SUR": "CS",
		"NOR": "CN",
	},


	"copas_asia": {
		"COPA DE ORIENTE": "COUPE D'ORIENT",
		"Copa de Oriente": "Coupe d'Orient",
		"MEJOR DE LA COPA DE ORIENTE": "MEILLEUR DE LA COUPE D'ORIENT",
		"Campeón de Copa de Oriente": "Vainqueur de la Coupe d'Orient",
		"Bota de la Copa de Oriente": "Soulier de la Coupe d'Orient",
		"Máximo Asistente de la Copa de Oriente": "Meilleur passeur de la Coupe d'Orient",
		"Mejor de la Copa de Oriente": "Meilleur joueur de la Coupe d'Orient",
		"¡Campeón de Copa de Oriente!": "Champion de la Coupe d'Orient !",
		"¡CAMPEÓN DE COPA DE ORIENTE!": "CHAMPION DE LA COUPE D'ORIENT !",
		"Clasificado a Copa de Oriente": "Qualifié pour la Coupe d'Orient",
		"Fase final de Copa de Oriente": "Phase finale de la Coupe d'Orient",
		"Mejor (Copa de Oriente)": "Meilleur (Coupe d'Orient)",
		"Bota (Copa de Oriente)": "Soulier (Coupe d'Orient)",
		"Asist. (Copa de Oriente)": "Pass. (Coupe d'Orient)",
		"Cerebro de la Copa de Oriente": "Cerveau de la Coupe d'Orient",
		"Ganar la Copa de Oriente.": "Gagner la Coupe d'Orient.",
		"Ser el máximo goleador de la Copa de Oriente.": "Finir meilleur buteur de la Coupe d'Orient.",
		"Máximo asistente de la Copa de Oriente.": "Meilleur passeur de la Coupe d'Orient.",
		"COPA DEL SOL": "COUPE DU SOLEIL",
		"Copa del Sol": "Coupe du Soleil",
		"MEJOR DE LA COPA DEL SOL": "MEILLEUR DE LA COUPE DU SOLEIL",
		"Campeón de Copa del Sol": "Vainqueur de la Coupe du Soleil",
		"Bota de la Copa del Sol": "Soulier de la Coupe du Soleil",
		"Máximo Asistente de la Copa del Sol": "Meilleur passeur de la Coupe du Soleil",
		"Mejor de la Copa del Sol": "Meilleur joueur de la Coupe du Soleil",
		"¡Campeón de Copa del Sol!": "Champion de la Coupe du Soleil !",
		"¡CAMPEÓN DE COPA DEL SOL!": "CHAMPION DE LA COUPE DU SOLEIL !",
		"Clasificado a Copa del Sol": "Qualifié pour la Coupe du Soleil",
		"Fase final de Copa del Sol": "Phase finale de la Coupe du Soleil",
		"Mejor (Copa del Sol)": "Meilleur (Coupe du Soleil)",
		"Bota (Copa del Sol)": "Soulier (Coupe du Soleil)",
		"Asist. (Copa del Sol)": "Pass. (Coupe du Soleil)",
		"Cerebro de la Copa del Sol": "Cerveau de la Coupe du Soleil",
		"Ganar la Copa del Sol.": "Gagner la Coupe du Soleil.",
		"Ser el máximo goleador de la Copa del Sol.": "Finir meilleur buteur de la Coupe du Soleil.",
		"Máximo asistente de la Copa del Sol.": "Meilleur passeur de la Coupe du Soleil.",
		"Rey de Oriente": "Roi d'Orient",
		"Rey del Sol": "Roi du Soleil",
		"tabORIENTE": "ORIENT",
		"tabSOL": "SOLEIL",
		"ORI": "CO",
		"CSO": "CS",
		"Medio mundo de distancia y una sola copa. Es tuya.": "À l'autre bout du monde, et une seule coupe. Elle est à toi.",
		"Viajes largos, noches largas. Y al final, la copa.": "Longs voyages, longues nuits. Et au bout, la coupe.",
		"El mejor de la copa grande de Asia. Nadie brilló como tú.": "Le meilleur de la grande coupe d'Asie. Personne n'a brillé comme toi.",
		"El mejor de la otra copa de Asia. Cada noche fue tuya.": "Le meilleur de l'autre coupe d'Asie. Chaque soirée était à toi.",
	},


	"copas_africa": {
		"COPA DEL ATLAS": "COUPE DE L'ATLAS",
		"Copa del Atlas": "Coupe de l'Atlas",
		"MEJOR DE LA COPA DEL ATLAS": "MEILLEUR DE LA COUPE DE L'ATLAS",
		"Campeón de Copa del Atlas": "Vainqueur de la Coupe de l'Atlas",
		"Bota de la Copa del Atlas": "Soulier de la Coupe de l'Atlas",
		"Máximo Asistente de la Copa del Atlas": "Meilleur passeur de la Coupe de l'Atlas",
		"Mejor de la Copa del Atlas": "Meilleur joueur de la Coupe de l'Atlas",
		"¡Campeón de Copa del Atlas!": "Champion de la Coupe de l'Atlas !",
		"¡CAMPEÓN DE COPA DEL ATLAS!": "CHAMPION DE LA COUPE DE L'ATLAS !",
		"Clasificado a Copa del Atlas": "Qualifié pour la Coupe de l'Atlas",
		"Fase final de Copa del Atlas": "Phase finale de la Coupe de l'Atlas",
		"Mejor (Copa del Atlas)": "Meilleur (Coupe de l'Atlas)",
		"Bota (Copa del Atlas)": "Soulier (Coupe de l'Atlas)",
		"Asist. (Copa del Atlas)": "Pass. (Coupe de l'Atlas)",
		"Cerebro de la Copa del Atlas": "Cerveau de la Coupe de l'Atlas",
		"Ganar la Copa del Atlas.": "Gagner la Coupe de l'Atlas.",
		"Ser el máximo goleador de la Copa del Atlas.": "Finir meilleur buteur de la Coupe de l'Atlas.",
		"Máximo asistente de la Copa del Atlas.": "Meilleur passeur de la Coupe de l'Atlas.",
		"COPA DEL BAOBAB": "COUPE DU BAOBAB",
		"Copa del Baobab": "Coupe du Baobab",
		"MEJOR DE LA COPA DEL BAOBAB": "MEILLEUR DE LA COUPE DU BAOBAB",
		"Campeón de Copa del Baobab": "Vainqueur de la Coupe du Baobab",
		"Bota de la Copa del Baobab": "Soulier de la Coupe du Baobab",
		"Máximo Asistente de la Copa del Baobab": "Meilleur passeur de la Coupe du Baobab",
		"Mejor de la Copa del Baobab": "Meilleur joueur de la Coupe du Baobab",
		"¡Campeón de Copa del Baobab!": "Champion de la Coupe du Baobab !",
		"¡CAMPEÓN DE COPA DEL BAOBAB!": "CHAMPION DE LA COUPE DU BAOBAB !",
		"Clasificado a Copa del Baobab": "Qualifié pour la Coupe du Baobab",
		"Fase final de Copa del Baobab": "Phase finale de la Coupe du Baobab",
		"Mejor (Copa del Baobab)": "Meilleur (Coupe du Baobab)",
		"Bota (Copa del Baobab)": "Soulier (Coupe du Baobab)",
		"Asist. (Copa del Baobab)": "Pass. (Coupe du Baobab)",
		"Cerebro de la Copa del Baobab": "Cerveau de la Coupe du Baobab",
		"Ganar la Copa del Baobab.": "Gagner la Coupe du Baobab.",
		"Ser el máximo goleador de la Copa del Baobab.": "Finir meilleur buteur de la Coupe du Baobab.",
		"Máximo asistente de la Copa del Baobab.": "Meilleur passeur de la Coupe du Baobab.",
		"Rey del Atlas": "Roi de l'Atlas",
		"Rey del Baobab": "Roi du Baobab",
		"tabATLAS": "ATLAS",
		"tabBAOBAB": "BAOBAB",
		"ATL": "ATL",
		"BAO": "BAO",
		"El mejor de la copa grande de África. Nadie brilló como tú.": "Le meilleur de la grande coupe d'Afrique. Personne n'a brillé comme toi.",
		"El mejor de la otra copa de África. Cada noche fue tuya.": "Le meilleur de l'autre coupe d'Afrique. Chaque soirée était à toi.",
	},



	"copas_oceania": {
		"COPA DEL CORAL": "COUPE DU CORAIL",
		"Copa del Coral": "Coupe du Corail",
		"MEJOR DE LA COPA DEL CORAL": "MEILLEUR DE LA COUPE DU CORAIL",
		"Campeón de Copa del Coral": "Vainqueur de la Coupe du Corail",
		"Bota de la Copa del Coral": "Soulier de la Coupe du Corail",
		"Máximo Asistente de la Copa del Coral": "Meilleur passeur de la Coupe du Corail",
		"Mejor de la Copa del Coral": "Meilleur joueur de la Coupe du Corail",
		"¡Campeón de Copa del Coral!": "Champion de la Coupe du Corail !",
		"¡CAMPEÓN DE COPA DEL CORAL!": "CHAMPION DE LA COUPE DU CORAIL !",
		"Clasificado a Copa del Coral": "Qualifié pour la Coupe du Corail",
		"Fase final de Copa del Coral": "Phase finale de la Coupe du Corail",
		"Mejor (Copa del Coral)": "Meilleur (Coupe du Corail)",
		"Bota (Copa del Coral)": "Soulier (Coupe du Corail)",
		"Asist. (Copa del Coral)": "Pass. (Coupe du Corail)",
		"Cerebro de la Copa del Coral": "Cerveau de la Coupe du Corail",
		"Ganar la Copa del Coral.": "Gagner la Coupe du Corail.",
		"Ser el máximo goleador de la Copa del Coral.": "Finir meilleur buteur de la Coupe du Corail.",
		"Máximo asistente de la Copa del Coral.": "Meilleur passeur de la Coupe du Corail.",
		"Rey del Coral": "Roi du Corail",
		"Señor del Arrecife": "Seigneur du Récif",
		"Ganar 3 veces la Copa del Coral.": "Gagner 3 fois la Coupe du Corail.",
		"Tiburón del Pacífico": "Requin du Pacifique",
		"Ser 2 veces el máximo goleador de la Copa del Coral.": "Finir 2 fois meilleur buteur de la Coupe du Corail.",
		"Ser el mejor jugador de la Copa del Coral.": "Finir meilleur joueur de la Coupe du Corail.",
		"tabCORAL": "CORAL",
		"COR": "COR",
		"Islas lejanas, un solo estadio. Y la copa del Pacífico es tuya.": "Des îles lointaines, un seul stade. Et la coupe du Pacifique est à toi.",
		"El mejor de la copa del Pacífico. Cada isla habló de ti.": "Le meilleur de la coupe du Pacifique. Chaque île a parlé de toi.",
	},









	"campeon_de_campeones": {
		"CAMPEÓN DE CAMPEONES": "CAMPEON DE CAMPEONES",
		"Campeón de Campeones": "Campeón de Campeones",
		"Ganar el Campeón de Campeones.": "Remporter le Campeón de Campeones.",
		"Dos campeones y una sola copa. La tuya.": "Deux champions, un seul trophée. Le tien.",
	},
	"supercopas": {
		"Campeón de la Finalísima": "Vainqueur de la Mégafinale",
		"Finalísima": "Mégafinale",
		"FINALÍSIMA": "MEGAFINALE",
		"FINALÍSIMA: {0} le gana a {1}": "MEGAFINALE : {0} bat {1}",
		"Dos Continentes": "Deux Continents",
		"Ganar la Finalísima con tu país.": "Gagner la Mégafinale avec ton pays.",
		"Campeón de tu continente contra campeón del otro. Ganó el tuyo.": "Le champion de ton continent contre celui de l'autre. Le tien a gagné.",
		"COPA DE LA LIGA": "COUPE LIGUE",
		"Copa de la Liga": "Coupe de la Ligue",
		"Campeón de la Copa de la Liga": "Vainqueur de la Coupe de la Ligue",
		"La otra copa del país. También es tuya.": "L'autre coupe du pays. Elle est aussi à toi.",
		"Doble Copa": "Double coupe",
		"Ganar la Copa de la Liga.": "Remporter la Coupe de la Ligue.",
		"LIGA DE NACIONES": "LIGUE NATIONS",
		"Liga de Naciones": "Ligue des nations",
		"Campeón de la Liga de Naciones": "Vainqueur de la Ligue des nations",
		"Liga A": "Ligue A",
		"Ganar la Liga de Naciones con tu país.": "Remporte la Ligue des nations avec ton pays.",
		"Seis jornadas, una Final Four. La primera de tu continente.": "Six journées, une Final Four. La première de ton continent.",
		"LIGA DE NACIONES: {0}": "LIGUE NATIONS : {0}",
		"SUPERCOPA DE ÁFRICA": "SUPERCOUPE AFRIQUE",
		"Supercopa de África": "Supercoupe d'Afrique",
		"Campeón de la Supercopa de África": "Vainqueur de la Supercoupe d'Afrique",
		"Supercampeón de África": "Super champion d'Afrique",
		"Ganar la Supercopa de África.": "Gagner la Supercoupe d'Afrique.",
		"Los dos campeones de África, y la copa es tuya.": "Les deux champions d'Afrique, et la coupe est à toi.",
		"RECOPA DEL SUR": "SUPERCOUPE SUD",
		"Recopa del Sur": "Supercoupe Sud",
		"COPA INTERCONTINENTAL": "COUPE INTERCONTINENTALE",
		"Copa Intercontinental": "Coupe intercontinentale",
		"DERBI DE LAS AMÉRICAS": "DERBY DES AMERIQUES",
		"COPA AFROASIÁTICA": "COUPE AFRO-ASIATIQUE",

		"PLAY-OFF ASIA-PACÍFICO": "BARRAGE ASIE-PACIFIQUE",
		"COPA CHALLENGER": "COUPE CHALLENGER",
		"Campeón de la Recopa": "Vainqueur de la Supercoupe Sud",
		"Campeón Intercontinental": "Champion intercontinental",
		"Campeón contra Campeón": "Champion contre champion",
		"Rey Intercontinental": "Roi intercontinental",
		"Ganar la Recopa del Sur.": "Gagner la Supercoupe Sud.",
		"Ganar la Copa Intercontinental.": "Gagner la Coupe intercontinentale.",
		"Campeón contra campeón. Y la copa se queda contigo.": "Champion contre champion. Et la coupe reste avec toi.",
		"Los campeones de cada continente, y el mejor eres tú.": "Les champions de chaque continent, et le meilleur, c'est toi.",
		"SUPERCOPA DE EUROPA": "SUPERCOUPE D'EUROPE",
		"Supercopa de Europa": "Supercoupe d'Europe",
		"Campeón de la Supercopa de Europa": "Vainqueur de la Supercoupe d'Europe",
		"Supercampeón de Europa": "Super champion d'Europe",
		"Ganar la Supercopa de Europa.": "Gagner la Supercoupe d'Europe.",
		"Los dos campeones de Europa, y la copa es tuya.": "Les deux champions d'Europe, et la coupe est à toi.",
		"SUPERCOPA": "SUPERCOUPE",
		"Supercopa": "Supercoupe",
		"Campeón de Supercopa": "Vainqueur de la Supercoupe",
		"Supercampeón": "Super champion",
		"Ganar la Supercopa de tu país.": "Gagner la Supercoupe de ton pays.",
		"El campeón contra el campeón. Y la copa, tuya.": "Champion contre champion. Et la coupe est à toi.",
		"SUPERCOPA · FINAL": "SUPERCOUPE · FINALE",
		"COPA DE LA ASOCIACIÓN": "COUPE DE L'ASSOCIATION",
		"Copa de la Asociación": "Coupe de l'Association",
		"COPA DE LAS LIGAS": "COUPE DES LIGUES",
		"Copa de las Ligas": "Coupe des Ligues",
		"Campeón de la Copa de las Ligas": "Vainqueur de la Coupe des Ligues",
		"DUELO DE CAMPEONES": "DUEL DES CHAMPIONS",
		"Rey de las Dos Ligas": "Roi des Deux Ligues",
		"Ganar la Copa de las Ligas.": "Gagner la Coupe des Ligues.",
		"Duelo de campeones entre dos ligas. Y la copa, tuya.": "Duel de champions entre deux ligues. Et la coupe est à toi.",
	},
	"apertura_clausura": {
		"APERTURA": "APERTURA",
		"CLAUSURA": "CLAUSURA",
		"Apertura": "Apertura",
		"Clausura": "Clausura",
		"EN LIGUILLA": "EN LIGUILLA",
		"IGUALADO CON LA LIGUILLA": "A HAUTEUR DE LA LIGUILLA",
		"A {0} PTS DE LA LIGUILLA": "A {0} PTS DE LA LIGUILLA",
		"{0} es bicampeón: Apertura y Clausura": "{0} réussit le doublé Apertura-Clausura",
		"{0} gana el Clausura; el Apertura fue de {1}": "{0} gagne le Clausura ; l'Apertura était pour {1}",
		"ANUAL": "ANNUEL",
		"El torneo aún no arranca.": "Ce tournoi n'a pas encore commencé.",
		"{0} os deja fuera. Se acabó el Apertura; queda el Clausura.": "{0} vous élimine. L'Apertura est fini ; place au Clausura.",
	},
	"liguilla": {
		"ESTO SE VA A LOS PENALES": "ÇA PART AUX TIRS AU BUT",
		"GLOBAL EMPATADO: PASAS POR POSICIÓN": "EGALITE : TU PASSES AU CLASSEMENT",
		"GLOBAL EMPATADO: PASA EL RIVAL POR POSICIÓN": "EGALITE : L'ADVERSAIRE PASSE AU CLASSEMENT",
		"PASAS POR POSICIÓN": "PASSE AU RANG",
		"FUERA POR POSICIÓN": "SORTI AU RANG",
		"POR POSICIÓN": "AU RANG",
		"SI ACABA ASÍ: PENALTIS": "AINSI : TIRS AU BUT",
		"SI ACABA ASÍ: OTRA NOCHE": "AINSI : UN AUTRE SOIR",
		"Así, nos toca otra noche. Que no haga falta.": "Comme ça, il faudra un autre soir. Évitons-le.",
		"Así, penaltis. Y nadie quiere penaltis.": "Comme ça, tirs au but. Personne n'en veut.",
		"LIGUILLA": "LIGUILLA",
		"PLAY-IN": "PLAY-IN",
		"Play-in": "Play-in",
		"FINAL DE LA LIGUILLA": "FINALE LIGUILLA",
		"SUPERLÍDER: {0}": "LEADER : {0}",
		"Entrar a la liguilla": "Entrer en Liguilla",
		"Superlíder": "Leader",
		"No entró": "Non qualifié",
		"{0} en la tabla": "{0} au classement",
		"Campeón de Liga: {0}": "Champion : {0}",
		"Del 1º al 6º, a cuartos; del 7º al 10º, al play-in.": "Du 1er au 6e en quarts ; du 7e au 10e en play-in.",
		"Así quedaría si la liga acabara hoy.": "Si le championnat finissait aujourd'hui.",
		"Dos partidos y la liga es vuestra. En esta sala ya no habla nadie de suerte.": "Deux matchs et le championnat est à vous. Ici, plus personne ne parle de chance.",
		"Semifinales. Dos cruces más y la liga es vuestra.": "Demi-finales. Deux tours de plus et le titre est à vous.",
		"Global igualado y pasa el mejor de la tabla: {0}. No hizo falta ni la tanda.": "Égalité au cumul, le mieux classé passe : {0}. Même pas de tirs au but.",
		"A un cruce de la final. Esta sala va a tardar en olvidarlo.": "À un tour de la finale. Ce vestiaire mettra du temps à oublier.",
		"{0} os deja fuera. Se acabó la liguilla y con ella el año.": "{0} vous élimine. La Liguilla est finie, et la saison avec.",
		"Una liga entera para perderla en la última noche. La vuelta al campo la dan ellos.": "Toute une saison perdue le dernier soir. Le tour d'honneur, c'est pour eux.",
		"{0} gana la liguilla y la liga; {1} fue superlíder": "{0} gagne la Liguilla et le titre ; {1} a fini en tête",
		"{0} es Campeón de Campeones": "{0} est Campeón de Campeones",
		"{0} es Campeón de Campeones ante {1}": "{0} bat {1} et devient Campeón de Campeones",
		"Del 1º al 8º, a cuartos.": "Du 1er au 8e en quarts.",
	},


	"golpeo_puntero": {
		"Jala el stick derecho y suelta para tirar": "Tire le stick droit et relâche pour frapper",
		"Jala el stick derecho y suelta para centrar": "Tire le stick droit et relâche pour centrer",

		"Jala el stick izquierdo y suelta para tirar": "Tire le stick gauche et relâche pour frapper",
		"Jala el stick izquierdo y suelta para centrar": "Tire le stick gauche et relâche pour centrer",


		"Apunta con el stick · pulsa el botón": "Vise au stick · appuie sur le bouton",
		"CENTRO · apunta y pulsa el botón": "CENTRE · vise et appuie",
	},

	"pingpong_matt": {
		"pingpong_mattRETO DE MATT": "DEFI DE MATT",
		"pingpong_mattENTRENO": "PRATIQUE",
		"pingpong_mattDESAFIO": "DEFI",
		"pingpong_mattLEYENDA": "LEGENDE",
		"pingpong_mattVENCISTE A MATT": "MATT BATTU",
		"pingpong_mattGANO MATT": "MATT GAGNE",
		"pingpong_mattSAQUE DE MATT": "MATT SERT",
		"pingpong_mattPUNTO PARA MATT": "POINT POUR MATT",
		"pingpong_mattATAQUE": "ATTAQUE",
		"pingpong_mattMATT ATACA": "MATT ATTAQUE",
		"pingpong_mattVICTORIAS": "VICTOIRES",
		"pingpong_mattRECORD": "RECORD",
		"pingpong_mattCAMPEON": "CHAMPION",
		"pingpong_mattINTERCAMBIO: {0}": "ECHANGE : {0}",
		"pingpong_mattMueve la pala. Toca para sacar.": "Bouge la raquette. Touche pour servir.",
		"pingpong_mattCentro: ataque. Lateral: colocación.": "Centre : attaque. Côté : placement.",
	},
	"museo_visita": {
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida se borra; su museo queda disponible para visitar. Esto no se puede deshacer.": "Sa plaque reste au salon : statistiques, trophées et clubs. La sauvegarde est supprimée ; son musée reste accessible. Cette action est irréversible.",
		"MEJOR TEMPORADA": "Meilleure saison",
		"Por premios, media y aportación.": "Selon les prix, la note et la contribution.",
		"ELIGE DOS CARRERAS": "Choisis deux carrières",
		"ELIGE OTRA CARRERA": "Choisis une autre carrière",
		"COMPARAR CARRERAS": "Comparer les carrières",
		"CAMBIAR CARRERAS": "Changer de carrières",
		"DERROTAS": "Défaites",
		"EMPATES": "Nuls",
		"VICTORIAS": "Victoires",
		"RECONOCIMIENTOS": "Distinctions",
		"LEYENDA DEL CLUB": "Légende du club",
		"LEYENDA DE LA LIGA": "Légende de la ligue",
		"LEYENDA DE LA SELECCIÓN": "Légende de la sélection",
		"RÉCORDS REGISTRADOS": "Records enregistrés",
		"MEJOR DE LA HISTORIA": "Meilleur de l’histoire",
		"TROFEOS": "Trophées",
		"PREMIOS": "Prix",
		"POR EQUIPO": "Par équipe",
		"No se conservaron las estadísticas por temporada.": "Les statistiques par saison n’ont pas été conservées.",
		"V": "V",
		"D": "D",
		"VISITAR MUSEO": "Visiter le musée",
		"SALAS": "SALLES",
		"VESTÍBULO": "Entrée",
		"HAT-TRICKS": "Triplés",
		"TU MUSEO": "Ton musée",
		"ESTÁS AQUÍ": "TU ES ICI",
		"VISITAR SALA": "VISITER LA SALLE",
		"TOCA PARA EXPLORAR": "TOUCHE POUR EXPLORER",
	},
	"coleccion_pistas": {
		"TIROS LIBRES": "COUPS FRANCS",
		"CÓRNERS": "CORNERS",
		"SAQUES DE BANDA": "TOUCHES",
		"INDIRECTAS": "INDIRECTS",
		"MANO A MANO": "FACE-A-FACE",
		"TIRO FRONTAL": "FRAPPE AXIALE",
		"TIRO LEJANO": "FRAPPE DE LOIN",
		"TIRO CRUZADO": "FRAPPE EN ANGLE",
		"CONTRAS": "CONTRES",
		"CENTROS": "CENTRES",
		"PRIMERA OCASIÓN": "PREMIERE OCCASION",
		"GOLES DE TU EQUIPO": "BUTS DE TON EQUIPE",
		"GOLES DEL RIVAL": "BUTS ADVERSES",
		"{0} GANANDO": "{0} EN MENANT",
		"{0} SIN GANAR": "{0} SANS MENER",
		"{0} DESDE EL {1}'": "{0} DES LA {1}'",
		"{0} HASTA EL {1}'": "{0} JUSQU'A LA {1}'",
		"CUÁNDO": "QUAND",
		"EN DERBIS": "EN DERBY",
		"DE VISITANTE": "A L'EXTERIEUR",
		"SÓLO EN CLUB": "CLUB SEULEMENT",
		"EXPULSIONES": "EXPULSIONS",
		"OCASIÓN FALLADA": "OCCASION RATEE",

		"PISTA: {0}": "INDICE : {0}",
		"BALONES PARA TI": "BALLONS POUR TOI",
		"LESIONES": "BLESSURES",
		"GASTO DE ENERGÍA": "DEPENSE D'ENERGIE",
		"TE SIENTA BAJO": "AU BANC SOUS",
		"RECUPERACIÓN": "RECUPERATION",
		"PUESTO HASTA LOS 23": "PLACE AVANT 23 ANS",
		"PUESTO SIN SU CONFIANZA": "PLACE SANS SA CONFIANCE",
		"JORNADAS EN LA GRADA": "JOURNEES EN TRIBUNE",
		"TRAS GANAR": "APRES UNE VICTOIRE",
		"REPITE EL ONCE": "MEME ONZE",
		"BRONCA TRAS MAL PARTIDO": "SAVON APRES UN MAUVAIS MATCH",
		"AFICIÓN Y PRENSA AL PERDER": "FANS ET PRESSE APRES DEFAITE",
		"MEJORA DE CONTRATO": "HAUSSE DE CONTRAT",
		"CAMBIO DE DIBUJO": "CHANGEMENT DE SCHEMA",
		"Ser generoso desde los once metros también tiene premio.": "Être généreux à onze mètres a aussi sa récompense.",
		"En la cantera hay un chaval que necesita a alguien que crea en él.": "Au centre de formation, un gamin a besoin que quelqu'un croie en lui.",
		"Desde los once metros, a veces el balón es sólo tuyo.": "À onze mètres, parfois le ballon n'est qu'à toi.",
		"Ningún partido está perdido aunque vayas dos goles abajo.": "Aucun match n'est perdu, même mené de deux buts.",
		"Los de la tele graban muy pegados a la línea de fondo.": "Les caméras de la télé filment collées à la ligne de but.",
		"No todo balón tiene que acabar en la portería rival.": "Tout ballon ne doit pas finir dans le but adverse.",
		"El portero deja algo para beber junto a su poste.": "Le gardien laisse de quoi boire près de son poteau.",
		"En una final, alguien de la grada quiere un recuerdo contigo.": "En finale, quelqu'un en tribune veut un souvenir avec toi.",
		"A veces se posan visitas con alas sobre el césped.": "Parfois, des visiteurs ailés se posent sur la pelouse.",
		"Arriba, los del palco miran el partido detrás de un cristal.": "Là-haut, les invités de la loge regardent derrière une vitre.",
		"El que te devuelve los balones espera junto a la banda.": "Celui qui te rend les ballons attend le long de la ligne.",
		"Al acabar un derbi, mira lo que pasa entre los dos banquillos.": "Après un derby, regarde ce qui se passe entre les deux bancs.",
		"En el apretón del derbi, el que aprieta más gana.": "Dans la poignée de main du derby, celui qui serre le plus gagne.",
		"El banquillo de enfrente también está a tiro.": "Le banc d'en face est aussi à portée.",
		"Tu propio banquillo también está a tiro.": "Ton propre banc est aussi à portée.",
		"El míster de enfrente grita de pie en su área técnica.": "L'entraîneur adverse crie debout dans sa zone technique.",
		"Tu propio míster también está de pie en la banda.": "Ton propre entraîneur est aussi debout au bord du terrain.",
		"A fuerza de balonazos, un banquillo se puede vaciar.": "À force de frappes, un banc peut se vider.",
		"Entre la hierba asoman las cabezas del riego.": "Des têtes d'arrosage dépassent de la pelouse.",
		"En la grada hay vasos llenos, y los balones que se van caen en algún sitio.": "En tribune il y a des gobelets pleins, et les ballons perdus tombent quelque part.",
		"En la grada alguien pasea con una bandeja de comida.": "En tribune, quelqu'un se promène avec un plateau de nourriture.",
		"Si la grada te abuchea, contéstale donde más duele.": "Si la tribune te siffle, réponds-lui là où ça fait mal.",
		"En algunos campos de barrio no hay nada detrás del arco.": "Sur certains terrains de quartier, il n'y a rien derrière le but.",
		"No todas las finales acaban con la copa en tus manos.": "Toutes les finales ne finissent pas avec la coupe dans tes mains.",
		"Si un club te quita una final, búscalo en otra.": "Si un club te prend une finale, retrouve-le dans une autre.",
		"Una Nueva Carrera+ con ventajas, jugada hasta el último día.": "Une Nouvelle Carrière+ avec avantages, jouée jusqu'au dernier jour.",
		"En tu casa hay un volante esperando: ni frenos ni hierba.": "Chez toi, un volant t'attend : ni freins ni herbe.",
		"La maquinita de tu casa guarda un récord por batir.": "La borne d'arcade de ta maison garde un record à battre.",
		"La diana de tu casa premia la puntería fina.": "La cible de ta maison récompense la précision.",
		"Hay balones sueltos por el banquillo, y el míster no siempre mira.": "Il traîne des ballons autour du banc, et le coach ne regarde pas toujours.",
		"En el billar de tu casa, no dejes jugar al rival.": "Au billard de ta maison, ne laisse pas jouer l'adversaire.",
		"Si te casas, piensa bien a nombre de quién pones la casa.": "Si tu te maries, réfléchis bien au nom sur l'acte de la maison.",
		"De visita, tarde y perdiendo por la mínima, el balón tarda en volver.": "À l'extérieur, en fin de match et mené d'un but, le ballon met du temps à revenir.",
	},
	"tapetes_formas": {
		"TAPETE OVALADO": "TAPIS OVALE",
		"Lana de contorno oval, con borde tejido y centro suave.": "Laine ovale, bord tissé et centre doux.",
		"TAPETE HEXAGONAL": "TAPIS HEXAGONAL",
		"Seis lados y franjas concéntricas para vestir un rincón.": "Six côtés et des bandes concentriques pour habiller un coin.",
		"TAPETE ORGÁNICO": "TAPIS ORGANIQUE",
		"Curvas suaves e irregulares, como una piedra de río.": "Des courbes douces et irrégulières, comme un galet de rivière.",
		"TAPETE DE PASILLO": "TAPIS DE COULOIR",
		"Tejido alargado con esquinas redondas y bandas claras.": "Un tissage allongé aux coins ronds et aux bandes claires.",
		"el tapete no puede atravesar una pared": "le tapis ne peut pas traverser un mur",
	},
	"decoracion_salon": {
		"TAPETE REDONDO": "TAPIS ROND",
		"TAPETE TEJIDO": "TAPIS TISSE",
		"BOCINAS DE TORRE": "COLONNES AUDIO",
		"BOCINAS DE ESTANTE": "ENCEINTES BIBLIO",
		"LIBRERO ABIERTO": "ETAGERE OUVERTE",
		"LIBRERO MODULAR": "ETAGERE A CASES",
		"Yute trenzado en círculos. Va debajo de mesas y sillones.": "Jute tressé en cercles. Se place sous les tables et fauteuils.",
		"Lana con rombos y flecos. Viste el suelo sin estorbar el paso.": "Laine à losanges et franges. Habille le sol sans gêner le passage.",
		"Dos torres de audio con conos y puertos al frente.": "Deux colonnes audio avec haut-parleurs et évents à l’avant.",
		"Dos bocinas compactas y receptor sobre un mueble bajo.": "Deux enceintes compactes et un ampli sur un meuble bas.",
		"Madera y tubos oscuros, con baldas abiertas para libros.": "Bois et tubes sombres, avec des étagères ouvertes pour les livres.",
		"Cubos, cajones y libros en una composición de madera.": "Casiers, tiroirs et livres dans un ensemble en bois.",
	},
	"nivel_club": {
		"TU NIVEL EN EL CLUB": "TON NIVEAU AU CLUB",
		"CON VOZ": "ECOUTE",
		"DE CONFIANZA": "DE CONFIANCE",
		"HOMBRE DE LA CASA": "PILIER DU CLUB",
		"Subes de nivel en el club: {0}.": "Tu montes d'un niveau au club : {0}.",
		"Bajas de nivel en el club: {0}.": "Tu descends d'un niveau au club : {0}.",
		"Pierdes el brazalete del club.": "Tu perds le brassard du club.",
		"Tu peso en el club te deja pedir número sin esperar a renovar. Llevas el {0}: uno libre es tuyo; el de un compañero, depende de él.": "Ton poids au club te permet de demander un numéro sans attendre de prolonger. Tu portes le {0} : un libre est à toi ; celui d'un coéquipier dépend de lui.",
		"{0} no te cede el {1}. Sigues con el {2}.": "{0} ne te cède pas le {1}. Tu gardes le {2}.",
		"{0} te cede el {1}.": "{0} te cède le {1}.",
		"El club ya te dijo que no a este fichaje en esta ventana.": "Le club a déjà refusé cette recrue pendant ce mercato.",
		"Acabas de llegar: el club aún no te consulta los fichajes. Con {0} de relación pasas a {1} y puedes proponerlos.": "Tu viens d'arriver : le club ne te consulte pas encore sur ses recrues. À {0} de relation tu passes au niveau {1} et tu peux en proposer.",
		"EN RIESGO": "EN DANGER",
		"ES EL NIVEL {0}: VAS EN EL {1}": "IL FAUT LE {0} : TU ES AU {1}",
		"TE FALTAN {0} DE RELACIÓN": "MANQUE {0} DE RELATION",
		"TITULAR EL {0} %: PIDE {1} %": "TITULAIRE {0} % : IL FAUT {1} %",
		"NO ERES TITULAR": "PAS TITULAIRE",
		"Venderlo, protegerlo o pedir que lo renueven es del nivel {0}: {1} de relación con el club.": "Le vendre, le protéger ou demander sa prolongation, c'est au niveau {0} : {1} de relation avec le club.",
		"Vender es del nivel {0}: {1} de relación con el club.": "Vendre, c'est au niveau {0} : {1} de relation avec le club.",
		"Pedir otro técnico es del nivel {0}: {1} de relación con el club.": "Demander un autre entraîneur, c'est au niveau {0} : {1} de relation avec le club.",
		"Ya lo pediste esta temporada.": "Tu l'as déjà demandé cette saison.",
		"Antes, contesta lo que tienes pendiente.": "D'abord, réponds à ce qui est en attente.",
		"PEDIR OTRO DORSAL": "AUTRE NUMERO",
		"Con tu nivel, el club decide cada fichaje al confirmar: {0} % de que diga que sí. Al que rechace no se le vuelve a proponer en esta ventana.": "À ton niveau, le club décide chaque recrue à la confirmation : {0} % de chances qu'il dise oui. Celle qu'il refuse ne peut plus être proposée pendant ce mercato.",
		"VENDER": "VENDRE",
		"EL CLUB DIJO NO": "REFUS DU CLUB",
		"relación": "relation",
		"nivel": "niveau",
		"El {0} lo lleva {1}. Toca otra vez y se lo pides: hay un {2} % de que te lo ceda.": "Le {0}, c'est {1} qui le porte. Touche encore pour le lui demander : {2} % de chances qu'il te le cède.",
		"El {0} lo lleva {1}. Mantén y se lo pides: hay un {2} % de que te lo ceda.": "Le {0}, c'est {1} qui le porte. Maintiens pour le lui demander : {2} % de chances qu'il te le cède.",
		"TU NIVEL: {0}": "NIVEAU : {0}",
		"BAJAS DE NIVEL EN EL CLUB": "TU BAISSES D'UN NIVEAU",
		"PIDES OTRO DORSAL": "UN AUTRE NUMERO",
		"TU PETICIÓN": "TA DEMANDE",
		"El club te dio la voz y el vestuario la reconoce. Ahora la cinta es tuya.": "Le club t'a donné la parole et le vestiaire la reconnaît. Le brassard est à toi.",
		"VES LA MESA": "VOIR LES TRANSFERTS",
		"PROPONES FICHAJES": "PROPOSER DES RECRUES",
		"COMPRAS Y VENTAS": "ACHATS ET VENTES",
		"OTRO DORSAL": "AUTRE NUMERO",
		"OTRO TECNICO": "AUTRE ENTRAINEUR",
		"PRIMA FIDELIDAD": "PRIME DE FIDELITE",
		"GRADA FIEL": "TRIBUNE FIDELE",
		"MAS MARGEN": "PLUS DE MARGE",
		"Pediste salir: el club ya no te consulta su plantilla.": "Tu as demandé à partir : le club ne te consulte plus sur son effectif.",
		"Prima de fidelidad": "Prime de fidélité",
		"CEDIDO: TU NIVEL TE ESPERA": "PRETE : NIVEAU EN PAUSE",
		"BAJAS EN {0}": "TU DESCENDS EN {0}",
		"PROMETIDO AL VETERANO": "PROMIS AU VETERAN",
		"CLUB NUEVO": "NOUVEAU CLUB",
		"Una vez por temporada.": "Une fois par saison.",
	},
	"mesa_fichajes": {
		"BUSCAR EN EL RANKING": "VOIR LE CLASSEMENT",
		"Los fichajes se marcan con + en el ranking.": "Les recrues se marquent avec + dans le classement.",
		"VENDER ({0})": "VENDRE ({0})",
		"CONFIRMAR ({0})": "CONFIRMER ({0})",
		"{0} SIN CONFIRMAR": "{0} EN ATTENTE",
		"Es tu último {0}: sin él no hay quien juegue ahí.": "C'est ton dernier {0} : sans lui, personne ne peut jouer là.",
		"Estás cedido: tu club no te pregunta por sus fichajes.": "Tu es prêté : ton club ne te consulte pas sur ses recrues.",
		"FICHADOS": "RECRUTES",
		"VENDIDOS": "VENDUS",
		"FICHAJES ({0})": "ACHATS ({0})",
		"VENTAS ({0})": "VENTES ({0})",
		"FICHAR EN LA MESA": "CIBLER CE JOUEUR",
		"VENDER EN LA MESA": "METTRE EN VENTE",
		"QUITAR DE LA MESA": "RETIRER",
		"FICHAS": "ACHATS",
		"VENDES": "VENTES",
		"FIRMO ESTE AÑO": "RECRUE RECENTE",
		"Firmaste con otro club: la plantilla del año que viene ya no la haces tú.": "Tu as signé ailleurs : l'effectif de l'an prochain, ce n'est plus toi qui le construis.",
		"Firmó esta temporada: no se vende hasta la próxima.": "Arrivé cette saison : pas de vente avant la prochaine.",
		"Juega aquí cedido: no es tuyo para venderlo.": "Il joue ici en prêt : ce n'est pas à toi de le vendre.",
		"LA MESA": "BILAN",
		"La plantilla quedaría en {0}: el máximo es {1}.": "L'effectif passerait à {0} : le maximum est {1}.",
		"La plantilla quedaría en {0}: el mínimo es {1}.": "L'effectif passerait à {0} : le minimum est {1}.",
		"Lo pide tu técnico: si llega, te lo apunta.": "Ton coach le demande : s'il arrive, c'est noté.",
		"Si fichas a uno de esa línea, el técnico te lo apunta.": "Si tu recrutes un joueur de cette ligne, le coach le note.",
		"Marca a quién vendes y a quién fichas.": "Choisis qui tu vends et qui tu recrutes.",
		"Marcado ({0}). Te faltan {1}.": "Ciblé ({0}). Il te manque {1}.",
		"Marcado ({0}). Te queda {1}.": "Ciblé ({0}). Il te reste {1}.",
		"Mercado cerrado. La mesa abre con la próxima ventana, que dura {0} {1}.": "Mercato fermé. Les transferts reprennent au prochain mercato, qui dure {0} {1}.",
		"Mercado cerrado: la mesa abre con la próxima ventana.": "Mercato fermé : les transferts reprennent au prochain mercato.",
		"NO QUIERE VENIR": "PAS INTERESSE",
		"NO QUISO VENIR": "A REFUSE",
		"NO SALIERON": "ECHOUES",
		"Nada de lo marcado sale hoy: mira los avisos en rojo.": "Rien de ce que tu as choisi ne passe aujourd'hui : regarde les alertes en rouge.",
		"Nadie lo compra hoy a ese precio.": "Personne ne l'achète à ce prix aujourd'hui.",
		"No hay vuelta atrás: se mueve todo a la vez.": "Pas de retour en arrière : tout se fait d'un coup.",
		"No quiere venir: interés {0} % (mínimo {1} %).": "Il ne veut pas venir : intérêt {0} % (minimum {1} %).",
		"PRESUPUESTO": "BUDGET",
		"QUEDA": "RESTE",
		"QUEDA EN LA MESA": "BUDGET RESTANT",
		"SIN COMPRADOR": "SANS ACHETEUR",
		"SIN DINERO": "TROP CHER",
		"Sin club no hay mesa de fichajes.": "Sans club, pas de transferts.",
		"Está cedido: quien lo tiene no lo puede vender.": "Il est prêté : le club qui l'a ne peut pas le vendre.",
		"Su club no lo vende: sólo sale pagando su cláusula.": "Son club ne le vend pas : il ne part qu'en payant sa clause.",
		"Te faltan {0}: vende a alguien o quita un fichaje.": "Il te manque {0} : vends quelqu'un ou retire une recrue.",
		"Te pagan un {0} % menos de lo que vale: el comprador sabe que tienes prisa.": "On te paie {0} % de moins que sa valeur : l'acheteur sait que tu es pressé.",
		"ULTIMO {0}": "SEUL {0}",
		"VA AL {0}": "VERS {0}",
		"Va al {0} por {1} cuando confirmes la mesa.": "Il part à {0} pour {1} quand tu confirmes tes transferts.",
		"Ventana abierta: {0} {1} por delante. Nada se mueve hasta que confirmes.": "Mercato ouvert : encore {0} {1}. Rien ne bouge tant que tu ne confirmes pas.",
		"Ya juega en tu club.": "Il joue déjà dans ton club.",
		"DEF": "DEF",
		"MED": "MIL",
		"DEL": "ATT",
	},
	"surf_casa": {
		"ALBERCA DE OLAS": "PISCINE A VAGUES",
		"Alberca decorativa con olas en movimiento, agua translúcida y espuma. Incluye generador y tabla.": "Piscine décorative avec vagues en mouvement, eau translucide et écume. Générateur de vagues et planche inclus.",
	},
	"penthouse_tecnologia": {
		"SEMANA {0}": "SEMAINE {0}",
		"SOFÁ PENTHOUSE": "CANAPE PENTHOUSE",
		"Sofá modular de piel crema, nogal y latón. Recibe visitas en tu salón.": "Canapé modulable en cuir crème, noyer et laiton. Reçois tes invités au salon.",
		"COMEDOR PENTHOUSE": "SALLE A MANGER PENTHOUSE",
		"Mesa de mármol negro con seis sillas de piel y detalles de latón.": "Table en marbre noir, six chaises en cuir et détails en laiton.",
		"CAMA PENTHOUSE": "LIT PENTHOUSE",
		"Cama flotante de nogal con cabecero iluminado. Permite dormir de verdad.": "Lit flottant en noyer avec tête de lit éclairée. Pour bien dormir.",
		"ROBOT ASPIRADOR": "ROBOT ASPIRATEUR",
		"Robot con base de carga. Recorre el suelo libre al colocarlo en casa.": "Robot avec station de charge. Parcourt le sol libre une fois placé chez toi.",
		"ESPEJO INTELIGENTE": "MIROIR CONNECTE",
		"Espejo de pie con pantalla: consulta tu estado y los próximos partidos.": "Miroir sur pied avec écran : consulte ton état et les prochains matchs.",
		"MESA HOLOGRÁFICA": "TABLE HOLOGRAPHIQUE",
		"Mesa táctica con proyección 3D. Explora cuatro formaciones y gira la vista.": "Table tactique avec projection 3D. Explore quatre formations et tourne la vue.",
		"CONSULTAR ESPEJO": "VOIR LE MIROIR",
		"EXPLORAR TÁCTICA": "VOIR LA TACTIQUE",
		"TECNOLOGÍA": "TECHNOLOGIE",
		"Compra este objeto para usarlo.": "Achète cet objet pour l’utiliser.",
		"ENERGÍA {0}/100": "ENERGIE {0}/100",
		"ÁNIMO {0} · LESIÓN: {1} SEMANAS": "MORAL {0} · BLESSURE : {1} SEM.",
		"PRÓXIMOS PARTIDOS": "PROCHAINS MATCHS",
		"No hay partidos programados.": "Aucun match programmé.",
		"FECHA POR CONFIRMAR": "DATE A CONFIRMER",
		"Tu estado se actualiza cada vez que consultas el espejo.": "Ton état est actualisé à chaque fois que tu consultes le miroir.",
		"CAMBIAR ESQUEMA": "CHANGER DE SYSTEME",
		"VISTA INICIAL": "VUE INITIALE",
		"Gira el campo con el dedo. Los esquemas son de consulta.": "Tourne le terrain avec le doigt. Les schémas sont à titre indicatif.",
		"FORMACIÓN {0}": "FORMATION {0}",
		"ÁNIMO {0} · LESIÓN: {1} DÍAS": "MORAL {0} · BLESSURE : {1} J.",
	},
	"basket_reloj": {
		"SEGUIDAS": "SERIE",
		"CANASTAS": "PANIERS",
		"LIMPIAS": "NETS",
		"TIRO {0}/10": "TIR {0}/10",
		"POSICIÓN {0}/5": "POSITION {0}/5",
		"Desliza hacia el aro y suelta.": "Glisse vers le panier et relâche.",
		"2 por canasta · 3 limpia · +1 cada 3 seguidas": "2 par panier · 3 sans toucher · +1 tous les 3 de suite",
		"¡LIMPIA!": "NET !",
		"CORTO · MÁS FUERZA": "COURT · PLUS FORT",
		"LARGO · MENOS FUERZA": "LONG · MOINS FORT",
		"IZQUIERDA · AJUSTA EL GESTO": "GAUCHE · AJUSTE LE GESTE",
		"DERECHA · AJUSTA EL GESTO": "DROITE · AJUSTE LE GESTE",
		"+{0} PUNTOS": "+{0} POINTS",
		"{0} PUNTOS · {1}/10": "{0} POINTS · {1}/10",
		"MEJOR RACHA {0} · LIMPIAS {1}": "MEILLEURE SERIE {0} · NETS {1}",
		"RÉCORD DE SESIÓN": "RECORD SESSION",
		"TIRO FALLADO": "TIR MANQUE",
		"CANASTA DE BASKET": "PANIER DE BASKET",
		"RELOJ DE PIE": "HORLOGE SUR PIED",
		"Canasta con tablero, red y balón. Diez tiros haciendo flick hacia el aro.": "Panier, panneau, filet et ballon. Dix tirs en lançant le doigt vers le panier.",
		"Reloj decorativo de madera con esfera, péndulo y pesas de latón.": "Horloge décorative en bois avec cadran, pendule et poids en laiton.",
		"JUGAR BASKET": "JOUER AU BASKET",
		"BASKET": "BASKET",
		"Toca el balón, haz flick hacia el aro y suelta.": "Touche le ballon, lance le doigt vers le panier et relâche.",
		"TIRO {0}/10 · CANASTAS {1}": "TIR {0}/10 · PANIERS {1}",
		"Compra una canasta para jugar.": "Achète un panier pour jouer.",
		"DIEZ TIROS · CINCO POSICIONES": "DIX TIRS · CINQ POSITIONS",
		"{0}/10 CANASTAS · MEJOR RACHA {1}": "{0}/10 PANIERS · MEILLEURE SERIE {1}",
		"OTRA RONDA": "REJOUER",
		"DESLIZA HACIA LA CANASTA": "GLISSE VERS LE PANIER",
		"Desliza el balón hacia la canasta. Más rápido, más fuerte.": "Glisse le ballon vers le panier. Plus vite, plus fort.",
		"TOCA EL BALÓN Y LANZA": "TOUCHE LE BALLON ET LANCE",
		"¡CANASTA!": "PANIER !",
	},
	"pingpong_dedo": {
		"Mueve la raqueta con el dedo sobre la mesa. Toca para sacar.": "Déplace la raquette avec le doigt sur la table. Touche pour servir.",
		"La raqueta sigue tu dedo. Golpea de lado para dirigir la pelota.": "La raquette suit ton doigt. Frappe sur le côté pour diriger la balle.",
	},
	"minijuegos_mandos": {
		"PARTIDA EN CURSO": "PARTIE EN COURS",
		"SUAVE": "FACILE",
		"EXPERTO": "EXPERT",
		"CONTROL": "PLACE",
		"ATAQUE": "ATTAQUE",
		"MEJOR INTERCAMBIO: {0}": "MEILLEUR ECHANGE : {0}",
		"Centra la pala para atacar; de canto, bloqueas suave.": "Centre la raquette pour attaquer ; sur le bord, tu bloques doucement.",
		"La pelota tocó la red.": "La balle a touché le filet.",
		"La pelota salió de la mesa.": "La balle est sortie de la table.",
		"La pala no llegó a la pelota.": "La raquette a manqué la balle.",
		"La pelota botó dos veces.": "La balle a rebondi deux fois.",
		"La pelota botó en el campo propio.": "La balle a rebondi du côté du frappeur.",
		"El saque no botó en ambos campos.": "Le service n’a pas rebondi des deux côtés.",
		"PUNTO DE PARTIDO": "BALLE DE MATCH",
		"ARRASTRA PARA GIRAR · SUELTA PARA CENTRAR": "GLISSE POUR BRAQUER · RELACHE POUR CENTRER",
		"FUERA DEL ASFALTO: VUELVE A LA PISTA": "HORS PISTE : REVIENS SUR LA ROUTE",
		"CONTROL {0} · {1} s": "PASSAGE {0} · {1} s",
		"CONTROL PERDIDO · PUEDES REINICIAR EN PAUSA": "PASSAGE MANQUE · RECOMMENCE DEPUIS LA PAUSE",
		"Avance automático. Arrastra para girar y toca el freno.": "Avance automatique. Glisse pour braquer, touche pour freiner.",
		"PRÓXIMO CONTROL: {0} m": "PROCHAIN PASSAGE : {0} m",
		"META: {0} m": "ARRIVEE : {0} m",
	},


	"clausulas": {
		"NEGOCIAR CLÁUSULAS": "NEGOCIER CLAUSES",
		"MANTÉN PARA PRESENTAR": "MAINTIENS : ENVOYER",
		"Hasta {0}.": "Jusqu'à {0}.",
		"ACEPTAN": "OUI",
		"CONTRAOFERTA": "CONTRE-OFFRE",
		"×1": "×1",
		"×1,5": "×1,5",
		"×2": "×2",
		"×3": "×3",
		"NO JUEGAN CON ESE PUESTO": "PAS DANS LEUR SYSTEME",
		"SU TITULAR ES MUCHO MEJOR": "TITULAIRE BIEN MEILLEUR",
		"ESPERAS SU RESPUESTA": "REPONSE EN ATTENTE",
		"YA NEGOCIASTE LAS CLÁUSULAS": "CLAUSES DEJA NEGOCIEES",
		"SIN MESA ABIERTA": "PAS DE TABLE",
		"YA NEGOCIASTE ESTE AÑO": "DEJA FAIT CETTE ANNEE",
		"Ya negociaste tus cláusulas esta temporada.": "Tu as déjà négocié tes clauses cette saison.",
		"RENOVAR EN AGENTE": "RENOUVELER · AGENT",
		"RENEGOCIAR EN AGENTE": "RENEGOCIER · AGENT",
	},


	"avisos_hoy": {
		"HOY, EL TÍTULO": "TITRE EN JEU",
		"HOY, EL ASCENSO": "MONTEE EN JEU",
		"HOY, LA SALVACIÓN": "MAINTIEN EN JEU",
		"GANA Y LO SELLAS": "GAGNER SUFFIT",
		"UN PUNTO BASTA": "UN NUL SUFFIT",
		"COMPRA UN MUEBLE": "ACHETE UN MEUBLE",
		"MIRA QUIÉN TE SIGUE": "VOIS QUI TE SUIT",
	},


	"alineaciones": {
		"ALINEACIONES": "COMPOSITIONS",
	},


	"radio": {
		"TEMA DEL JUEGO": "THEME DU JEU",
		"LUCES DEL ESTADIO": "LUMIERES DU STADE",
		"CAMINO A LA GLORIA": "CAP SUR LA GLOIRE",
		"DOMINGO DE SOL": "BEAU DIMANCHE",
		"NOCHE LARGA": "LONGUE NUIT",
		"SEMANA DE FINAL": "AVANT LA FINALE",
		"VENTANA DE FICHAJES": "MERCATO",
		"LEVANTAR LA COPA": "LA COUPE AU CIEL",
		"NOCHE DE COPA": "NUIT DE COUPE",
		"NOCHE DE ESTRELLAS": "NUIT DES ETOILES",
		"JUEVES EUROPEO": "JEUDI EUROPEEN",
		"CAMINO EUROPEO": "ROUTE D'EUROPE",
		"RADIO": "RADIO",
		"TOCA PARA CAMBIAR DE TEMA": "TOUCHE : MORCEAU SUIVANT",
		"AL AZAR": "ALEATOIRE",
		"Cada título que ganes suma su himno a la música del vestuario.": "Chaque titre que tu gagnes ajoute son hymne à la musique du vestiaire.",
		"CAMPO AL AMANECER": "TERRAIN A L'AUBE",
		"LLUVIA SUAVE": "PLUIE DOUCE",
		"HIERBA FRESCA": "HERBE FRAICHE",
	},


	"resultado": {
		"SIN GOLES": "AUCUN BUT",
		"PARADA": "ARRET",
		"PARADAS": "ARRETS",
	},


	"promo": {
		"¿TIENES UN CODIGO?": "TU AS UN CODE ?",
		"CANJEAR CODIGO": "SAISIR UN CODE",
		"Escribe el código tal cual te lo dieron. Cada código se canjea una sola vez en este teléfono.": "Écris le code tel qu'on te l'a donné. Chaque code ne s'utilise qu'une seule fois sur ce téléphone.",
		"TU CODIGO": "TON CODE",
		"CANJEAR": "VALIDER",
		"COMPROBANDO...": "VERIFICATION...",
		"Escribe un código.": "Écris un code.",
		"No encontramos ese código. Si es nuevo, conéctate a internet y vuelve a probar.": "Code introuvable. S'il est nouveau, connecte-toi à internet et réessaie.",
		"Ese código ya no está activo.": "Ce code n'est plus actif.",
		"Ese código ya caducó.": "Ce code a expiré.",
		"Ya canjeaste ese código en este teléfono.": "Tu as déjà utilisé ce code sur ce téléphone.",
		"Ese código ya lo canjeó otra persona.": "Quelqu'un d'autre a déjà utilisé ce code.",
		"Este código va a una carrera: ábrela y canjéalo desde su tienda.": "Ce code va dans une carrière : ouvre-la et utilise-le depuis sa boutique.",
		"Ese código no existe. Revisa que esté bien escrito.": "Ce code n'existe pas. Vérifie qu'il est bien écrit.",
		"¡CODIGO CANJEADO!": "CODE VALIDE !",
		"+ {0} ★ EN TU HERENCIA": "+ {0} ★ DANS TON HERITAGE",
		"ABIERTA EN TU HERENCIA: {0}": "DEBLOQUE DANS TON HERITAGE : {0}",
	},
	"simulador_conduccion": {
		"Compra el simulador en CASA > COCHERA. Incluye un compacto para jugar.": "Achète le simulateur dans MAISON > GARAGE. Une compacte est incluse pour jouer.",
		"Compacto incluido sólo para jugar. Tus compras desbloquean más coches.": "Compacte incluse uniquement pour jouer. Tes achats débloquent d’autres voitures.",
		"Incluye un compacto para jugar y permite usar tus coches comprados. No gasta dinero ni acciones semanales.": "Une compacte incluse pour jouer, plus tes voitures achetées. Sans argent ni action hebdomadaire dépensés.",
		"Asiento deportivo, volante y tres pantallas. Incluye un compacto virtual; tus compras desbloquean más coches. Sin mantenimiento.": "Siège de course, volant et trois écrans. Compacte virtuelle incluse ; tes achats débloquent d’autres voitures. Sans entretien.",
		"AUTO · A/D GIRAR · S FRENAR": "AUTO · A/D VIRER · S FREIN",
		"NUEVO RÉCORD DE TIEMPO": "NOUVEAU RECORD",
		"Sin récord: faltaron controles.": "Pas de record : passages manqués.",
		"As del volante": "As du volant",
		"Cruzar los tres controles del simulador y llegar antes del tiempo objetivo.": "Franchir les trois points de passage du simulateur et terminer avant le temps cible.",
		"Primera Medalla": "Première Médaille",
		"Sacar el oro en el simulador con el compacto urbano.": "Décrocher l'or au simulateur avec la compacte urbaine.",
		"Piloto de Domingo": "Pilote du Dimanche",
		"Terminar 25 vueltas en el simulador.": "Terminer 25 tours au simulateur.",
		"Vuelta Limpia": "Tour Propre",
		"Terminar una vuelta del simulador sin salirte nunca del asfalto.": "Terminer un tour du simulateur sans jamais quitter l'asphalte.",
		"Cazamonedas": "Chasseur de Pièces",
		"Recoger las 72 monedas en una vuelta del simulador.": "Ramasser les 72 pièces en un seul tour du simulateur.",
		"Pie a Fondo": "Pied au Plancher",
		"Dar una vuelta con el hiperdeportivo sin tocar el freno ni salirte del asfalto.": "Faire un tour en hypercar sans toucher au frein ni quitter l'asphalte.",
		"Garaje de Oro": "Garage en Or",
		"Sacar el oro en el simulador con los ocho coches.": "Décrocher l'or au simulateur avec les huit voitures.",
		"MONEDAS {0}/{1} · {2}": "PIECES {0}/{1} · {2}",
		"PUNTOS DE ESTA CARRERA": "POINTS DE CETTE COURSE",
		"CURVA CERRADA: FRENA": "VIRAGE SERRE : FREINE",
		"CONTROLES {0}/3 · OBJETIVO {1} s · MÁX. {2} km/h": "PASSAGES {0}/3 · CIBLE {1} s · MAX. {2} km/h",
		"OBJETIVO CUMPLIDO": "OBJECTIF REUSSI",
		"OBJETIVO PENDIENTE": "OBJECTIF MANQUE",
		"El coche acelera solo. Mantén un botón para girar y los dos a la vez para frenar.": "La voiture accélère toute seule. Maintiens un bouton pour tourner et les deux à la fois pour freiner.",
		"LOS DOS: FRENO": "LES DEUX : FREIN",
		"CAMBIAR COCHE": "CHANGER DE VOITURE",
		"¡META!": "ARRIVEE !",
		"¡BRONCE!": "BRONZE !",
		"¡PLATA!": "ARGENT !",
		"¡ORO!": "OR !",
		"MONEDAS {0}/{1}": "PIECES {0}/{1}",
		"¡YA!": "PARTEZ !",
		"TU RÉCORD: {0} s": "TON RECORD : {0} s",
		"SIN RÉCORD TODAVÍA": "PAS ENCORE DE RECORD",
		"CORRES CONTRA TU FANTASMA": "TU AFFRONTES TON FANTOME",
		"SIGUIENTE MEDALLA: {0} s": "PROCHAINE MEDAILLE : {0} s",
		"SIN MEDALLA": "PAS DE MEDAILLE",
		"MEDALLA DE BRONCE": "MEDAILLE DE BRONZE",
		"MEDALLA DE PLATA": "MEDAILLE D'ARGENT",
		"MEDALLA DE ORO": "MEDAILLE D'OR",
	},


	"menu": {
		"SIMULADOR DE CARRERAS": "SIMULATEUR DE COURSE",
		"Asiento deportivo, volante y tres pantallas. Conduce sólo los coches que has comprado. Sin mantenimiento.": "Siège sport, volant et trois écrans. Conduis uniquement les voitures achetées. Sans entretien.",
		"Conduce los coches de tu colección. No gasta dinero ni acciones semanales.": "Conduis les voitures de ta collection. Sans argent ni action hebdomadaire dépensés.",
		"CONDUCIR": "CONDUIRE",
		"SALIR": "SORTIR",


		"ligaSALIR": "QUITTER",
		"FRENAR": "FREIN",
		"ACELERAR": "GAZ",
		"SIN COCHES": "SANS AUTO",
		"OTRA CARRERA": "REJOUER",
		"Sólo tus coches. Sin gastos ni acciones semanales.": "Tes voitures uniquement. Sans frais ni action hebdomadaire.",
		"Compra el simulador y un coche en CASA > COCHERA.": "Achète le simulateur et une voiture dans MAISON > GARAGE.",
		"Llega a la meta. Salir del asfalto te frena.": "Atteins l’arrivée. Sortir de la route te ralentit.",
		"Mantén ACELERAR y dirige. Flechas o WASD en teclado.": "Maintiens GAZ et dirige. Flèches ou WASD au clavier.",
		"META: {0} s · MEJOR DE ESTA SESIÓN: {1} s": "ARRIVEE : {0} s · RECORD DE SESSION : {1} s",
		"COCHERA": "GARAGE",
		"COCHES": "AUTOS",
		"La ampliación está ocupada. No se moverá tu construcción.": "L’extension est occupée. Ta construction ne sera pas déplacée.",

		"COPIADO · PÉGALO DONDE QUIERAS": "COPIE · COLLE-LE OU TU VEUX",

		"NOVEDADES": "NOUVEAUTES",
		"VERSIÓN {0}": "VERSION {0}",

		"POTENCIAL": "POTENTIEL",
		"CONTACTO": "CONTACT",
		"REDES": "RESEAUX",
		"CORREO": "E-MAIL",
		"¿Una idea, un fallo o sólo quieres saludar? Escríbeme directo.": "Une idée, un bug ou juste envie de dire bonjour ? Écris-moi directement.",





		"ESTE ESTADIO NO SABE TU NOMBRE.": "CE STADE NE CONNAIT PAS TON NOM.",



		"¿CÓMO TE LLAMAS?": "COMMENT TU T'APPELLES ?",
		"ESO EMPIEZA HOY.": "CA COMMENCE AUJOURD'HUI.",
		"IDIOMA": "LANGUE",
		"RANURA {0}": "EMPLACEMENT {0}",
		"HOY, DERBI": "DERBY DU JOUR",
		"HOY, DERBI · {0}": "DERBY DU JOUR · {0}",
		"ACTIVA": "ACTIVE",
		"CONTINUAR": "CONTINUER",
		"VER LEGADO": "VOIR LEGENDE",
		"Ranura libre.": "Emplacement libre.",
		"+ NUEVA CARRERA": "+ NOUVELLE CARRIERE",
		"{0} AÑOS": "{0} ANS",
		"SIN CLUB": "SANS CLUB",
		"Sin club": "Sans club",
		"MÁS": "PLUS",
		"OTRAS RANURAS": "AUTRES SLOTS",
		"PRÁCTICA": "ENTRAINEMENT",
		"AJUSTES": "REGLAGES",
		"LOGROS": "SUCCES",
		"COLECCIÓN": "COLLECTION",
		"EDITOR": "EDITER",
		"CLUB Y PAIS": "CLUB ET PAYS",
		"TODOS": "TOUS",
		"PENDIENTES": "VERROUILLES",
		"LOGRADOS": "DEBLOQUES",
		"A PUNTO DE CAER": "PRESQUE LA",



		"{0} % del mundo": "{0} % des joueurs",
		"Logro secreto. Sigue jugando para descubrirlo.":
			"Succès secret. Continue à jouer pour le découvrir.",
		"Preparando el estadio…": "Préparation du stade…",
		"Cargando…": "Chargement…",
		"RESTAURAR": "RESTAURER",
		"RESTAURAR CARRERA": "RESTAURER UNE CARRIERE",
		"Copias guardadas en iCloud.": "Copies enregistrées dans iCloud.",
		"No se pudo restaurar la carrera.": "Impossible de restaurer la carrière.",
		"Carrera restaurada.": "Carrière restaurée.",
		"VERSION MAS NUEVA": "VERSION PLUS RECENTE",
		"Se jugó después en {0}.": "Elle a été jouée plus tard sur {0}.",
		"Se jugó después en otro aparato.": "Elle a été jouée plus tard sur un autre appareil.",
		"iCLOUD": "iCLOUD",
		"ESTE APARATO": "CET APPAREIL",
		"PARTIDO LIBRE": "MATCH LIBRE",
		"ELIGE TU EQUIPO": "TON EQUIPE",
		"ELIGE EL RIVAL": "L'ADVERSAIRE",
		"ELIGE TU JUGADOR": "TON JOUEUR",
		"Amistoso de exhibición · no cuenta para la carrera": "Match d'exhibition · ne compte pas pour la carrière",
		"PRÁCTICA LIBRE": "ENTRAINEMENT LIBRE",
		"RECOMIENDA": "RECOMMANDE",
		"ENCARGO": "MISSION",
		"DETALLE": "DETAIL",
		"QUIERE VERTE": "VEUT TE VOIR",
	},



	"compra": {
		"{0} PARTIDOS": "{0} MATCHS",
		"{0} GOLES": "{0} BUTS",
		"{0} ASIST": "{0} PASSES D",
		"La App Store no responde. Revisa tu conexión y vuelve a intentarlo.":
			"L'App Store ne répond pas. Vérifie ta connexion et réessaie.",
		"Google Play no responde. Revisa tu conexión y vuelve a intentarlo.":
			"Google Play ne répond pas. Vérifie ta connexion et réessaie.",
		"Tu pago quedó pendiente: lo recibirás en cuanto se confirme.":
			"Ton paiement est en attente : tu le recevras dès qu’il sera confirmé.",
		"Listo: ya recuperaste lo que habías comprado con esta cuenta de Google.":
			"C’est fait : tu as récupéré ce que tu avais acheté avec ce compte Google.",
		"Esta cuenta de Google no tiene compras que recuperar en Football Legacy.":
			"Ce compte Google n’a aucun achat à récupérer dans Football Legacy.",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu cuenta de Google.":
			"Ceci se paie en ARGENT REEL, pas avec l’argent du jeu : c’est débité sur ton compte Google.",
		"GOOGLE PLAY":
			"GOOGLE PLAY",
		"Este aparato no tiene permitidas las compras.":
			"Les achats ne sont pas autorisés sur cet appareil.",

		"No se pudo completar la compra.": "L'achat n'a pas pu être finalisé.",
		"Apple rechazó el pago.": "Apple a refusé le paiement.",
		"La compra no está disponible en tu región.":
			"Cet achat n'est pas disponible dans ta région.",
		"No hay conexión con la App Store.": "Aucune connexion à l'App Store.",
		"No se pudo verificar la compra con Apple. Se reintentará al volver a abrir el juego.":
			"Apple n'a pas pu vérifier l'achat. Nouvel essai à la prochaine ouverture du jeu.",
	},




	"hub": {

		"SANCIONADO · {0} {1} DE CASTIGO": "SUSPENDU · {0} {1} DE SUSPENSION",

		"FORMA": "FORME",
		"ovrMEDIA": "MOY",
		"NIVEL": "NIVEAU",
		"DINERO": "ARGENT",
		"TEMPORADA": "SAISON",
		"{0} · {1} AÑOS": "{0} · {1} ANS",
		"AGENTE LIBRE · {0} AÑOS": "AGENT LIBRE · {0} ANS",
		"ENERGÍA {0}%": "ENERGIE {0}%",

		"NO CONVOCADO": "NON CONVOQUE",
		"BANQUILLO": "REMPLACANT",
		"YA NO QUEDAN CAMBIOS": "PLUS DE REMPLACEMENTS",
		"SE VA {0}": "{0} SORT",
		"¡PARADÓN DE {0}!": "QUEL ARRET DE {0} !",
		"{0} SE ESTIRA Y LA SACA": "{0} SE DETEND ET LA SORT",
		"LA ATAJA {0}": "{0} L'ARRETE",
		"SE SALVA EL PORTERO": "LE GARDIEN S'EN SORT",
		"PARADAS EN EL PARTIDO": "ARRETS DANS CE MATCH",
		"asistA": "D",
		"PLANTILLAS": "EFFECTIFS",
		"RELATO": "COMMENTAIRE",
		"OVR": "NOTE GLB",
		"ROTACIÓN": "ROTATION",
		"TITULAR": "TITULAIRE",
		"INDISCUTIBLE": "INTOUCHABLE",

		"AGENTE LIBRE": "AGENT LIBRE",
		"ELIGE CLUB": "CHOISIS UN CLUB",
		"TE VENDEN": "ON TE VEND",
		"RESPONDE YA": "REPONDS MAINTENANT",
		"EN VENTA": "EN VENTE",
		"ESPERANDO OFERTAS": "EN ATTENTE D'OFFRES",
		"CIERRA HOY": "FERME AUJOURD'HUI",
		"CIERRA EN {0}J": "FERME DANS {0}J",
		"MERCADO CERRADO": "MERCATO FERME",
		"ABRE EN {0}J": "OUVRE DANS {0}J",
		"PRÓXIMA TEMPORADA": "SAISON PROCHAINE",

		"MERCADO DE VERANO": "MERCATO D'ETE",
		"MERCADO DE INVIERNO": "MERCATO D'HIVER",
		"VERANO": "ETE",
		"INVIERNO": "HIVER",

		"BUZON": "MESSAGES",
		"{0} NUEVOS": "{0} NOUVEAUX",
		"AL DIA": "TOUT LU",
		"Elige tu próximo club": "Choisis ton prochain club",
		"¡TE BUSCAN!": "ON TE CHERCHE !",
		"PLANTEL": "EFFECTIF",
		"PERFIL": "PROFIL",
		"CONTRATO": "CONTRAT",
		"MERCADO": "MERCATO",
		"TIENDA": "BOUTIQUE",
		"ASPECTO": "APPARENCE",
		"CASUAL": "DECONTRACTE",
		"Tu ropa de calle. La eliges tú.": "Tes vêtements de ville. C'est toi qui choisis.",
		"Eres el mismo con las dos ropas.": "Tu es le même avec les deux tenues.",
		"{0} · el uniforme es el de tu club.":
			"{0} · le maillot est celui de ton club.",
		"RELACIONES": "RELATIONS",

		"Para el próximo: {0}, ~{1}'.": "Pour le prochain : {0}, ~{1}'.",
		"El balón te llega ~{0} veces por partido.":
			"Le ballon t'arrive ~{0} fois par match.",
		"El balón te llega ~{0} vez por partido.":
			"Le ballon t'arrive ~{0} fois par match.",
		"Vales ${0} en el mercado.": "Tu vaux {0}$ sur le mercato.",



		"famaDESCONOCIDO": "INCONNU",
		"famaLOCAL": "LOCAL",
		"famaCONOCIDO": "CONNU",
		"famaCARA CONOCIDA": "VISAGE CONNU",
		"famaESTRELLA": "STAR",
		"{0} de {1} marcas te pueden ofertar.": "{0} marques sur {1} peuvent te faire une offre.",
		"Y 1 ya te queda chica.": "Et 1 est déjà trop petite pour toi.",
		"Y {0} ya te quedan chicas.": "Et {0} sont déjà trop petites pour toi.",
		"Estrella: esta temporada aguantas {0} partidos flojos sin que te olviden. Por debajo de {1} dejas de serlo.": "Star : cette saison, tu peux rater {0} matchs avant qu'on t'oublie. Sous {1}, tu ne l'es plus.",
		"Estrella: esta temporada aguantas 1 partido flojo sin que te olviden. Por debajo de {0} dejas de serlo.": "Star : cette saison, tu peux rater 1 match avant qu'on t'oublie. Sous {0}, tu ne l'es plus.",
		"Estrella: esta temporada ya te están olvidando. Por debajo de {0} dejas de serlo.": "Star : cette saison, on commence déjà à t'oublier. Sous {0}, tu ne l'es plus.",
		"Sólo te llama una: te falta nombre. Con más prensa te llaman hasta tres.": "Une seule t'appelle : il te manque un nom. Avec plus de presse, jusqu'à trois t'appellent.",
		"PUJA CON {0}: +{1} %": "ENCHERE CONTRE {0} : +{1} %",
		"Te saca +{0} de sueldo en cada oferta. Tócalo para darle un encargo.":
			"Il te sort +{0} de salaire à chaque offre. Touche-le pour lui confier une mission.",
		"TUS RELACIONES": "TES RELATIONS",
		"TORNEOS": "COMPETITIONS",

		"CALENDARIO": "CALENDRIER",
		"CLASIF {0}": "QUALIF {0}",
		"La temporada aún no tiene calendario.":
			"La saison n'a pas encore de calendrier.",

		"RANKING": "CLASSEMENT",
		"RANKING DE JUGADORES": "CLASSEMENT DES JOUEURS",
		"Los jugadores de 1ª división del mundo, ordenados por su media."
			+ " Tú entras en la misma lista.":
			"Les joueurs de 1ère division du monde, classés par note."
			+ " Tu es sur la même liste.",
		"Ningún jugador cumple estos filtros. Prueba a soltar alguno.":
			"Aucun joueur ne correspond à ces filtres. Essaie d'en enlever un.",
		"Ahora mismo no hay nadie sin club. La bolsa se llena al cerrar cada ventana de mercado.":
			"Personne n'est sans club pour l'instant. La liste se remplit à la fermeture de chaque mercato.",
		"TU SITIO: {0}° DE {1}": "TA PLACE : {0}E SUR {1}",
		"A {0} de media del {1}°": "A {0} de moyenne du {1}e",
		"IR A MI FILA": "ALLER A MA LIGNE",
		"MARCADOS": "CIBLES",
		"TODO": "TOUT",
		"PAÍS": "PAYS",
		"PORTEROS": "GARDIENS",
		"DEFENSAS": "DEFENSEURS",
		"MEDIOS": "MILIEUX",
		"DELANTEROS": "ATTAQUANTS",
		"FILTRAR POR PUESTO": "FILTRER PAR POSTE",
		"FILTRAR POR EDAD": "FILTRER PAR AGE",
		"FILTRAR POR VALOR": "FILTRER PAR VALEUR",
		"DIVISIÓN": "DIVISION",
		"FILTRAR POR LIGA": "FILTRER PAR CHAMPIONNAT",
		"FILTRAR POR DIVISIÓN": "FILTRER PAR DIVISION",
		"Los jugadores del mundo, por liga y división, ordenados por su media. Tú entras en la misma lista.": "Les joueurs du monde, par championnat et division, classés par note. Tu es dans la même liste.",
		"{0} PUESTOS": "{0} POSTES",
		"FILTRAR POR PAÍS": "FILTRER PAR PAYS",
		"FILTRAR POR BANQUILLO": "FILTRER PAR BANC",
		"FILTRAR POR ESTRELLAS": "FILTRER PAR ETOILES",
		"FILTRAR POR IDEA": "FILTRER PAR STYLE",
		"IDEA": "STYLE",
		"Ningún técnico cumple estos filtros.": "Aucun entraîneur ne correspond à ces filtres.",
		"{0}-{1} DE {2}": "{0}-{1} SUR {2}",
		"ANTERIOR": "PRECEDENT",
		"PALMARÉS": "PALMARES",
		"LEYENDAS": "LEGENDES",
		"SELECCIÓN": "SELECTION",
		"VITRINA": "VITRINE",
		"HISTORIA": "HISTOIRE",
		"LEGADO": "LEGS",

		"ABIERTO · {0}J": "OUVERT · {0}J",
		"EN VENTA · {0} OFERTAS": "EN VENTE · {0} OFFRES",

		"CLUBES Y LEYENDAS": "CLUBS ET LEGENDES",
		"JUGADOR DEL ANO · {0}": "JOUEUR DE L'ANNEE · {0}",
		"{0} PUNTOS": "{0} POINTS",
		"TOPE {0}": "PLAFOND {0}",
		"NIVEL {0}": "NIVEAU {0}",
		"SIN CONTRATO": "SANS CONTRAT",
		"ÚLTIMO AÑO": "DERNIERE ANNEE",
		"{0} TEMPORADAS": "{0} SAISONS",

		"1 TEMPORADA": "1 SAISON",
		"{0}% SOBRE TU SUELDO": "{0}% SUR TON SALAIRE",

		"PEDIR UN POCO": "DEMANDER UN PEU",
		"PEDIR MUCHO": "VISER HAUT",
		"+{0} si acepta": "+{0} s'il accepte",
		"ROMPER EL HIELO": "BRISER LA GLACE",
		"YA ROMPISTE EL HIELO": "GLACE DEJA BRISEE",
		"Hablan de otra cosa un rato · SE RELAJA":
			"Ils parlent d'autre chose un moment · IL SE DETEND",
		"EL DURO": "LE DUR",
		"EL AMABLE": "LE GENTIL",
		"EL SUSCEPTIBLE": "LE SUSCEPTIBLE",
		"EL PACIENTE": "LE PATIENT",

		"SU HUMOR": "SON HUMEUR",
		"DE BUENAS": "DE BONNE HUMEUR",
		"SE LO PIENSA": "IL REFLECHIT",
		"IMPACIENTE": "IMPATIENT",
		"HARTO": "A BOUT",
		"TE CEDEN": "TU ES PRETE",
		"{0} OFERTAS": "{0} OFFRES",
		"{0} DESTINO": "{0} DESTINATION",
		"{0} DESTINOS": "{0} DESTINATIONS",
		"CERRADO": "FERME",
		"SIN OFERTAS · {0}J": "SANS OFFRE · {0}J",
		"{0} OFERTAS · {1}J": "{0} OFFRES · {1}J",

		"CIERRA HOY · {0} OFERTAS": "FERME AUJOURD'HUI · {0} OFFRES",
		"{0} OFERTAS SOBRE LA MESA": "{0} OFFRES SUR LA TABLE",

		"MEJORA": "HAUSSE",
		"TU CLUB TE LA OFRECE": "TON CLUB L'OFFRE",
		"TU CLUB TE MEJORA": "CLUB T'AUGMENTE",
		"Se adelanta a los que vienen a por ti.": "Il devance ceux qui viennent te chercher.",
		"EL MEJOR QUE TRAJISTE": "TON MEILLEUR CHOIX",
		"{0} partidos · nota {1}": "{0} matchs · note {1}",
		"EL TECNICO PIDE": "LE COACH VEUT",
		"Si fichan a uno de esa línea: +{0} % de que salga y el técnico te lo apunta.": "S'il en signe un de cette ligne : +{0} % de chances et le coach le note.",
		"Ya le trajiste uno: te lo apunta.": "Tu lui en as amené un : c'est noté.",
		"Lo pide el técnico: sale más fácil": "Le coach le veut : plus facile",
		"SUBIR": "HAUT",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede. SUBIR cambia el orden.": "Ils passent dans cet ordre : si l'un signe, les autres jouent avec ce qui reste. HAUT change l'ordre.",
		"PAGAR LO QUE PIDEN": "PAYER LE PRIX",
		"REGATEAR -{0} %": "RABAIS -{0} %",
		"MANDAR OJEADOR ({0})": "ENVOYER RECRUTEUR ({0})",
		"Ojeado: el club ya se fía de él.": "Observé : le club lui fait confiance.",
		"QUITAR DE LA VENTA": "RETIRER",
		"PONER EN VENTA": "METTRE EN VENTE",
		"En venta: en la próxima ventana se ofrece a un club de su nivel, un {0} % por debajo de su valor.": "En vente : à la prochaine fenêtre, il est proposé à un club de son niveau, {0} % sous sa valeur.",
		"Ya tienes {0} en venta.": "Tu en as déjà {0} en vente.",
		"Se ofrecen al abrir la ventana a clubes de su nivel, un {0} % por debajo de su valor. Se quitan desde su ficha.": "Proposés à l'ouverture de la fenêtre à des clubs de leur niveau, {0} % sous leur valeur. Retire-les depuis leur fiche.",
		"No vendría a tu club: no casa con su categoría.": "Il ne viendrait pas : pas le bon niveau pour lui.",
		"RETIRAR LA PETICION": "ANNULER",
		"SI DICE QUE NO, TU TÉCNICO LO SABE": "SI C'EST NON, TON COACH LE SAIT",
		"PETICIONES": "DEMANDES",
		"TODAVÍA NADA": "RIEN ENCORE",
		"TU TÉCNICO CUMPLE": "TON COACH REUSSIT",
		"DE TUS {0} MEJORES": "UN DE TES {0} MEILLEURS",
		"SUPLENTE Y CLUB EN APURO": "REMPLACANT, CLUB EN DIFFICULTE",
		"VETERANO SUPLENTE": "VETERAN REMPLACANT",
		"DEJAS LA CAJA VACIA": "TU VIDES LA CAISSE",
		"NADIE PARA TU PUESTO": "PERSONNE A TON POSTE",
		"VAS EN RACHA": "TU ES EN FORME",
		"Si te lo cede: -{0} con el vestuario.": "S'il te le cède : -{0} avec le vestiaire.",
		"Se lo pediste al club: {0} % de que lo traiga en la próxima ventana de técnicos.": "Tu l'as demandé au club : {0} % qu'il arrive à la prochaine fenêtre des entraîneurs.",
		"El club lo decide en la próxima ventana de técnicos (invierno o final de temporada). Si dice que no, tu técnico se entera.": "Le club décide à la prochaine fenêtre des entraîneurs (hiver ou fin de saison). S'il refuse, ton entraîneur l'apprend.",
		"El club te hizo caso: llegó {0}.": "Le club t'a écouté : {0} est arrivé.",
		"El club dijo que no a {0}, y tu técnico se enteró.": "Le club a dit non pour {0}, et ton entraîneur l'a appris.",
		"El club cambió de técnico, pero no trajo a {0}.": "Le club a changé d'entraîneur, mais sans {0}.",
		"{0} ya no estaba a tu alcance.": "{0} n'était plus à ta portée.",
		"¿Otro técnico? Pídelo desde su ficha, en {0}, pestaña {1}.": "Un autre entraîneur ? Demande-le depuis sa fiche, dans {0}, onglet {1}.",
		"PEDISTE A": "TON CHOIX",
		"QUE LO TRAIGAN": "CHANCES",
		"QUE LO ECHEN": "CHANCES",
		"ENCAJA": "COLLE",
		"NO ENCAJA": "NE COLLE PAS",
		"CUMPLE SUS METAS": "OBJECTIFS TENUS",
		"PEDIR QUE LO ECHEN": "DEMANDER SON RENVOI",
		"ELEGIR QUIÉN VIENE · NIVEL {0}": "CHOISIR LE REMPLAÇANT · NIVEAU {0}",
		"{0} · FUERA": "{0} · DEHORS",
		"{0} SIN VICTORIA": "{0} SANS VICTOIRE",
		"El club te hace caso: destituye al técnico": "Le club t'écoute : l'entraîneur est limogé",
		"Se decide en la próxima ventana de técnicos: la de invierno o el final de la temporada. Si dice que no, tu técnico se entera.": "Décidé à la prochaine fenêtre des entraîneurs : l'hiver ou la fin de saison. S'il refuse, ton entraîneur l'apprend.",
		"El club te hace caso: llega {0} al banquillo": "Le club t'écoute : {0} prend le banc",
		"NO LO VENDAIS": "INTOUCHABLE",
		"QUITAR PROTECCION": "DEPROTEGER",
		"Protegido: el club no lo vende ni lo cede y pide el doble por él. Si lo pagan, se va igual; cada ventana en que rechace ofertas te quita {0} de relación.": "Protégé : le club ne le vend ni ne le prête, et en demande le double. Si quelqu'un paie, il part quand même ; chaque mercato où le club refuse des offres te coûte {0} de relation.",
		"QUE LO RENUEVEN": "PROLONGEZ-LE",
		"Se decide en la próxima ventana de contratos.": "Décidé au prochain mercato des contrats.",
		"Pedido: {0} % de que renueve en la próxima ventana de contratos.": "Demande : {0} % qu'il prolonge au prochain mercato des contrats.",
		"Si lo pides: {0} % de que renueve.": "Si tu demandes : {0} % qu'il prolonge.",
		"Ya pides {0} renovaciones.": "Tu demandes déjà {0} prolongations.",
		"INTOCABLE": "PROTEGE",
		"PROTEGES A": "TU PROTEGES",
		"Pagaron el doble ({2}) y {0} se fue a {1}.": "Ils ont payé le double ({2}) et {0} est parti à {1}.",
		"El club rechazó {0} de {1} por {2}.": "Le club a refusé {0} de {1} pour {2}.",
		"Te cuesta {0} de relación hasta final de temporada.": "Ça te coûte {0} de relation jusqu'à la fin de la saison.",
		"RENOVACIONES": "PROLONGATIONS",
		"{0} renovo.": "{0} a prolongé.",
		"El club no quiso renovar a {0}.": "Le club n'a pas voulu prolonger {0}.",
		"{0} no quiso renovar.": "{0} n'a pas voulu prolonger.",
		"{0} ya había firmado con otro club.": "{0} avait déjà signé ailleurs.",
		"PIDE UN PUESTO": "DEMANDE UN POSTE",
		"El club busca un {0}: va a por {1}.": "Le club cherche un {0} : il vise {1}.",
		"Tú pides el puesto y el club elige a quién: sale más a menudo y, si se cae, prueba con otro. Gasta una recomendación.": "Tu demandes le poste et le club choisit qui : ça marche plus souvent et, si ça tombe à l'eau, il en essaie un autre. Coûte une recommandation.",
		"No te quedan recomendaciones esta temporada.": "Tu n'as plus de recommandations cette saison.",
		"Ya hay un puesto pedido.": "Un poste est déjà demandé.",
		"El club no encuentra a nadie mejor para ese puesto.": "Le club ne trouve personne de mieux à ce poste.",
		"VENTANAS ANTERIORES": "FENETRES PASSEES",
		"Gastado {0} · ventas {1}": "Dépensé {0} · ventes {1}",
		"RENOVACIÓN SOBRE LA MESA": "PROLONGATION SUR LA TABLE",
		"SALDRÁS LIBRE AL CIERRE": "TU SORS LIBRE A LA FIN",
		"ABIERTO · {0} FICHAJES": "OUVERT · {0} TRANSFERTS",
		"OBJETIVO": "OBJECTIF",
		"VAS CORTO": "TU ES LOIN",
		"{0} DE {1} · VAS CORTO": "{0} SUR {1} · TU ES LOIN",
		"RÉCORD A LA VISTA": "RECORD EN VUE",
		"A {0} {1} DEL LIBRO": "A {0} {1} DU RECORD",
		"GOL": "BUT",

		"ESTA TEMPORADA POR TORNEO": "CETTE SAISON PAR COMPETITION",
		"TORNEO": "COMPETITION",
		"CHAMPIONS": "ELITE",
		"EUROPA": "EUROPA",
		"CONFERENCE": "CHALL.",
		"MUNDIALITO": "MOND. CLUBS",
		"{0} OFERTAS · {1} EXPIRA HOY": "{0} OFFRES · {1} EXPIRE AUJOURD'HUI",
		"{0} OFERTAS · {1} EXPIRAN HOY": "{0} OFFRES · {1} EXPIRENT AUJOURD'HUI",
		"NEGOCIACIÓN": "NEGOCIATION",
		"{0} CLUBES RESPONDIERON": "{0} CLUBS ONT REPONDU",
		"{0} TE BUSCAN · YA": "{0} TE VEULENT · VITE",
		"{0} MARCAS": "{0} MARQUES",
		"SIN JUGAR": "SANS JOUER",
		"{0} EN LIGA": "{0} EN CHAMPIONNAT",
		"CONVOCADO": "CONVOQUE",
		"seleccionFUERA": "DEHORS",
		"{0} TROFEOS": "{0} TROPHEES",
		"{0} GOLES": "{0} BUTS",

		"TIENES {0} {1} SIN REPARTIR": "TU AS {0} {1} NON REPARTIS",
		"SEMANA · {0} DE {1} ACCIONES": "SEMAINE · {0} SUR {1} ACTIONS",




		"previaGANAS": "GAGNE",
		"previaEMPATE": "NUL",
		"previaPIERDES": "PERD",
		"iniV": "V",
		"iniE": "N",
		"iniD": "D",




		"SUBIR HABILIDADES · {0}": "PROGRESSER · {0}",
		"SIN PUNTOS": "SANS POINTS",
		"PERSONALIZAR": "PERSONNALISER",
		"MENÚ": "MENU",

		"ELEGIR CLUB": "CHOISIR UN CLUB",
		"LESIONADO · VER LA JORNADA": "BLESSE · VOIR LA JOURNEE",
		"LESIONADO · {0} {1} DE BAJA": "BLESSE · {0} {1} D'ARRET",
		"YA USADA": "DEJA UTILISEE",
		"{0} {1} DE BAJA": "{0} {1} D'ARRET",

		"ALTA MÉDICA": "AUTORISE A JOUER",
		"VUELVES AL EQUIPO": "TU RETROUVES L'EQUIPE",
		"PARTIDOS PERDIDOS": "MATCHS MANQUES",
		"El cuerpo aguantó. El puesto no se guardó solo: ahora hay que "
		+ "ganárselo otra vez.":
			"Ton corps a tenu. Ta place ne s'est pas gardée toute seule : "
			+ "il faut la regagner.",
		"LA TEMPORADA, EN EL AIRE": "LA SAISON, EN SUSPENS",
		"MESES FUERA": "DES MOIS D'ARRET",
		"BAJA LARGA": "ARRET LONG",
		"TE PIERDES LO QUE VIENE": "TU RATES CE QUI ARRIVE",
		"SEMANAS DE BAJA": "SEMAINES D'ARRET",
		"{0} SEMANAS DE BAJA": "{0} SEMAINES D'ARRET",
		"Vuelves cuando el cuerpo diga. Mientras tanto el equipo juega sin ti "
		+ "y el puesto no se guarda solo.":
			"Tu reviens quand ton corps le dira. Pendant ce temps l'équipe joue sans toi "
			+ "et ta place ne se garde pas toute seule.",
		"Esta baja ya te costó {0} {1}": "Cet arrêt t'a déjà coûté {0} {1}",
		"SIMULAR {0}": "SIMULER {0}",
		"JUGAR CON TU SELECCIÓN": "JOUER AVEC TA SELECTION",
		"FECHA DE SELECCIONES": "TREVE INTERNATIONALE",
		"FECHA DE SELECCIONES · SALES DE TITULAR": "TREVE INTERNATIONALE · TU ES TITULAIRE",
		"FECHA DE SELECCIONES · ENTRAS DESDE LA BANCA": "TREVE INTERNATIONALE · TU ENTRES EN COURS",
		"VER EL PARTIDO": "VOIR LE MATCH",
		"JUGAR PARTIDO": "JOUER LE MATCH",
		"MANTENER PARA PASAR A FIN DE TEMPORADA": "MAINTENIR POUR CLORE LA SAISON",
		"LA TEMPORADA HA TERMINADO": "LA SAISON EST TERMINEE",

		"TE LO PERDISTE LESIONADO": "TU L'AS RATE, BLESSE",
		"TE VE FLOJO DE": "POINT FAIBLE",
		"NO CONVOCADO · TE VE FLOJO DE {0}": "NON RETENU · POINT FAIBLE {0}",
		"EL MÍSTER TE PIDE ALGO": "LE COACH TE DEMANDE UN TRUC",
		"NO TE CONVOCARON": "NON RETENU",
		"Algo es algo.": "C'est déjà ça.",
		"Aprovecha para entrenar e impresionar al míster.": "Profites-en pour t'entraîner et impressionner le coach.",
		"Porterías chiquitas": "Mini-buts",
		"Métela en la portería pequeña, no en la grande. Cada balón sale de más lejos.": "Mets-la dans le petit but, pas dans le grand. Chaque ballon part de plus loin.",
		"Jala y suelta a la portería pequeña": "Tire en arrière et lâche vers le petit but",
		"Rompe las dianas": "Casse les cibles",
		"Eslalon con rival": "Slalom avec adversaire",
		"OTRO BALÓN": "AUTRE BALLON",
		"Pisa los conos con el balón. El chico paga el triple, pero está del lado del que te marca.": "Touche les cônes avec le ballon. Le petit paie triple, mais il est du côté de ton marqueur.",
		"Arrastra para conducir; no se tira": "Glisse pour conduire ; on ne tire pas",
		"Rompe las dianas del arco. La chiquita de arriba paga el triple que la gorda de abajo.": "Casse les cibles du but. La petite d'en haut rapporte le triple de la grosse d'en bas.",
		"Jala y suelta a una diana": "Tire en arrière et lâche vers une cible",
		"TU RÉCORD": "TON RECORD",
		"NUEVO RÉCORD": "NOUVEAU RECORD",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario distinto. Aquí no se juega nada de la carrera — el que cuenta es EL ENCARGO DEL MÍSTER, y ése sale la jornada que no te convocan. Se sale con PAUSA.": "Choisis un exercice et répète-le sans limite : chaque essai construit une situation différente. Rien ici ne touche ta carrière — celui qui compte, c'est LA MISSION DU COACH, et elle arrive la journée où tu n'es pas retenu. On sort avec PAUSE.",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada de esto cuenta para la carrera — el que cuenta es EL ENCARGO DEL MÍSTER. Se sale con PAUSA.": "Choisis une action et répète-la sans limite : chaque essai construit une situation différente de ce type. Rien de tout ça ne compte pour ta carrière — celle qui compte, c'est LA MISSION DU COACH. On sort avec PAUSE.",
		"Ya te vio cumplir. Ahora te pide más.": "Il t'a vu assurer. Maintenant il en demande plus.",
		"EL MÍSTER TE MIRA EN": "IL TE REGARDE DANS",
		"LA PRÓXIMA": "LA PROCHAINE",
		"TE VE FLOJO DE {0}": "IL TE TROUVE FAIBLE EN {0}",
		"LA META": "L'OBJECTIF",
		"COMPLETA EL CIRCUITO": "TERMINE LE PARCOURS",
		"EL PRECIO": "LE PRIX",
		"-{0} ENERGÍA": "-{0} ENERGIE",
		"CUMPLIR EL ENCARGO": "FAIRE CE QU'IL DEMANDE",
		"SOLO SIMULAR": "SIMULER SEULEMENT",
		"EL ENCARGO": "LA MISSION",
		"NO LLEGASTE": "TU N'Y ES PAS ARRIVE",
		"Así sí. El sábado te veo en la lista.": "Voilà. Samedi, je te vois sur la feuille de match.",
		"Otra semana igual y no.": "Encore une semaine comme ça et c'est non.",
		"EL PRÓXIMO": "LE PROCHAIN",
		"SIGUES FUERA": "TOUJOURS DEHORS",
		"TE DAN DESCANSO": "AU REPOS",
		"Te llegan balones y no los defines": "Les ballons t'arrivent et tu ne conclus pas",
		"Le pegas flojo": "Tu frappes mou",
		"No sabes curvarla": "Tu ne sais pas l'enrouler",
		"No me das confianza desde los once": "Tu ne me rassures pas depuis le point",
		"Los balones parados los tira otro": "Les coups de pied arrêtés, c'est un autre qui les tire",
		"El primero que te sale te come": "Le premier qui vient sur toi te croque",
		"NO FUISTE CONVOCADO": "TU N'AS PAS ETE CONVOQUE",
		"{0} ganó sin ti": "{0} a gagné sans toi",
		"Tu selección": "Ta sélection",
		"Tu equipo": "Ton équipe",
		"Empató sin ti": "A fait match nul sans toi",
		"Perdió sin ti": "A perdu sans toi",
		"Recuperado: vuelves el próximo partido": "Remis : tu reviens au prochain match",
		"Te quedan {0} {1} de baja": "Il te reste {0} {1} d'arrêt",
		"Sin goles": "Aucun but",
		"TU EQUIPO": "TON EQUIPE",
		"Gol": "But",


		"A puerta": "Cadré",
		"Fuera del marco": "Hors cadre",
		"Tapado": "Contré",

		"SIN TIEMPO ESTA SEMANA": "PAS LE TEMPS CETTE SEMAINE",
		"NO TE ALCANZA": "TU N'AS PAS ASSEZ",
		"LO PIENSO": "J'Y REFLECHIS",
		"ANTES DEL MERCADO": "AVANT LE MERCATO",
		"DESPUÉS DEL PARTIDO": "APRES LE MATCH",
		"CÓMO QUEDAN LAS COSAS": "OU EN SONT LES CHOSES",
		"TU DECISIÓN": "TA DECISION",
		"otro club": "un autre club",
		"Un intermediario te susurra que al {0} le gustas. Si dices que te interesaría, "
		+ "puede que oferten por ti en el mercado… pero en tu club no te lo perdonarán.":
			"Un intermédiaire te souffle que {0} te veut. Si tu dis que ça t'intéresserait, "
			+ "ils pourraient faire une offre sur le mercato… mais ton club ne te le pardonnera pas.",

		"Técnico": "Entraîneur",
		"Vestuario": "Vestiaire",

		"SOCIEDAD": "COMPLICITE",


		"YA JUGASTEIS JUNTOS EN {0}": "DEJA COEQUIPIERS A {0}",
		"TAMBIÉN PASÓ POR {0}": "PASSE AUSSI PAR {0}",
		"VIENE DE {0}, TU RIVAL": "VIENT DU RIVAL {0}",


		"SOCIO": "DUO",

		"SÓLO CABE UNO": "UNE SEULE PLACE",
		"SABES DÓNDE ESTUVO": "TU SAIS OU IL ETAIT",
		"{0} salió la víspera y lo sabes tú solo. El míster acaba de preguntar en voz alta por qué se movió como si llevara piedras en los pies.": "{0} est sorti la veille et tu es le seul à le savoir. Le coach vient de demander à voix haute pourquoi il courait comme s'il avait des pierres dans les crampons.",
		"TAPARLO": "LE COUVRIR",
		"EL GOL ES TUYO": "LE BUT EST A TOI",
		"Acabas de marcar y la grada corea tu nombre. {0} lleva un mes sin jugar y te mira desde el banquillo, aplaudiendo con las manos flojas.": "Tu viens de marquer et le stade scande ton nom. {0} n'a pas joué depuis un mois et te regarde du banc, applaudissant mollement.",
		"DEDICÁRSELO": "LE DEDIER",
		"CORRER A LA GRADA": "COURIR VERS LES TRIBUNES",
		"TE PIDE DINERO": "IL TE DEMANDE DE L'ARGENT",
		"{0} te llama de noche y tarda un rato en llegar al punto: en su casa hay un lío y necesita una mano. No dice cuándo te lo devuelve.": "{0} t'appelle de nuit et met du temps à en venir au fait : il y a un souci chez lui et il a besoin d'un coup de main. Il ne dit pas quand il te rembourse.",
		"PRESTÁRSELO": "LUI PRETER",
		"SU ÚLTIMO DÍA": "SON DERNIER JOUR",
		"El traspaso de {0} está firmado y mañana ya no entrena aquí. El vestuario hará lo de siempre: un aplauso, una foto y a lo suyo.": "Le transfert de {0} est signé et demain il ne s'entraîne plus ici. Le vestiaire fera comme toujours : une salve d'applaudissements, une photo, et au boulot.",
		"ORGANIZARLE UNA DESPEDIDA": "LUI ORGANISER UN ADIEU",
		"UN ABRAZO Y YA": "UNE ACCOLADE ET VOILA",
		"Un programa os invita a {0} y a ti, pero la productora sólo tiene caché para uno y te lo ha ofrecido a ti primero. Él todavía no lo sabe.": "Une émission vous invite, {0} et toi, mais la production n'a un cachet que pour un seul et te l'a proposé en premier. Lui ne le sait pas encore.",
		"QUE VAYA ÉL": "QU'IL Y AILLE",
		"IR YO": "Y ALLER MOI",

		"LO DEJÓ FUERA": "IL L'A LAISSE DEHORS",
		"{0} no entró en la lista y lleva media hora sin hablar con nadie. Tú sí juegas, y el míster te escucha más que a él.": "{0} n'est pas dans le groupe et n'a parlé à personne depuis une demi-heure. Toi tu joues, et le coach t'écoute plus que lui.",
		"HABLAR POR ÉL": "PARLER POUR LUI",
		"NO ES MI PELEA": "PAS MON COMBAT",
		"OS GRITASTEIS": "VOUS VOUS ETES CRIE DESSUS",
		"Le pediste el balón a gritos, él te contestó peor, y el banquillo entero lo vio. En el vestuario nadie ha dicho una palabra desde entonces.": "Tu as réclamé le ballon en hurlant, il t'a répondu pire, et tout le banc l'a vu. Depuis, personne n'a dit un mot au vestiaire.",
		"PEDIR PERDÓN YO": "M'EXCUSER LE PREMIER",
		"QUE SE LE PASE": "QU'IL SE CALME",
		"LA REHABILITACIÓN ES SOLA": "LA REEDUCATION EST SOLITAIRE",
		"{0} se rompió y hace la recuperación por su cuenta, en un gimnasio vacío mientras los demás entrenan. Nadie va a saber si apareces o no.": "{0} s'est blessé et se rééduque seul, dans une salle vide pendant que les autres s'entraînent. Personne ne saura si tu viens ou non.",
		"ACOMPAÑARLO": "L'ACCOMPAGNER",
		"YA VOLVERÁ": "IL REVIENDRA",
		"TE QUIERE DE PADRINO": "IL TE VEUT COMME TEMOIN",
		"{0} se casa en pretemporada y te pide que estés a su lado. Es un fin de semana entero, y tú tenías otros planes con tu descanso.": "{0} se marie en présaison et te veut à ses côtés. C'est tout un week-end, et tu avais d'autres projets pour ton repos.",

		"ÉL QUIERE EL PENALTI": "IL VEUT LE PENALTY",
		"{0} lleva tres partidos sin marcar y te pide el próximo penalti. Los dos sabéis que el goleo del año se decide en detalles como éste.": "{0} n'a pas marqué depuis trois matches et te demande le prochain penalty. Vous savez tous les deux que le classement des buteurs se joue là-dessus.",
		"SE LO DEJO": "JE LUI LAISSE",
		"LOS TIRO YO": "JE LES TIRE",
		"TE PREGUNTAN POR ÉL": "ON T'INTERROGE SUR LUI",
		"Un periodista quiere que valores el mal momento de {0}. La pregunta viene con la respuesta puesta y toda la sala esperando.": "Un journaliste veut ton avis sur la mauvaise passe de {0}. La question contient déjà sa réponse, et toute la salle attend.",
		"LO DEFIENDO": "JE LE DEFENDS",
		"NO ME MOJO": "JE RESTE NEUTRE",
		"CENA EN SU CASA": "DINER CHEZ LUI",
		"{0} te invita a cenar con su familia la víspera del partido. Es media noche que no duermes, y de las que se recuerdan.": "{0} t'invite à dîner en famille la veille du match. C'est une demi-nuit de sommeil en moins, et de celles qu'on retient.",
		"VOY": "J'Y VAIS",
		"LA SOCIEDAD": "LA COMPLICITE",
		"en este partido": "dans ce match",
		"y {0} más": "et {0} de plus",
		"Afición": "Supporters",
		"Prensa": "Presse",
		"Agente": "Agent",
		"Pareja": "Partenaire",
		"{0} energía": "{0} énergie",
		"o": "ou",
		"· 1 acción": "· 1 action",
		"· posible oferta": "· offre possible",

		"VS": "VS",
		"GANASTE": "TU AS GAGNE",
		"EMPATASTE": "TU AS FAIT NUL",
		"PERDISTE": "TU AS PERDU",
		"GOL DE {0}": "BUT DE {0}",
		"{0} DE {1}": "{0} DE {1}",
		"EN CASA": "A DOMICILE",
		"XP {0} / {1} · AL NIVEL {2}": "XP {0} / {1} · AU NIVEAU {2}",
		"{0} {1} SIN ASIGNAR · REPARTELOS": "{0} {1} NON REPARTIS · REPARTIS-LES",
		"LA CARRERA": "LA COURSE",
		"EL CUADRO": "LE TABLEAU",
		"LA TABLA": "LE CLASSEMENT",


		"GOLEADORES": "BUTEURS",
		"GRUPO {0} · PASAN {1}": "GROUPE {0} · {1} QUALIFIES",

		"FASE DE LIGA · {0}/{1} · {2}": "PHASE DE LIGUE · {0}/{1} · {2}",
		"A OCTAVOS": "VERS LES 8EMES",
		"AL PLAYOFF": "VERS LES BARRAGES",
		"faseligaFUERA": "ELIMINE",
		"EN LISTA DE VENTA": "TRANSFERABLE",
		"EN LISTA DE CESIÓN": "SUR LA LISTE DE PRET",
		"CESIÓN · {0} DESTINOS": "PRET · {0} DESTINATIONS",
		"VER LA JORNADA": "VOIR LA JOURNEE",
		"SIMULAR PARTIDO": "SIMULER LE MATCH",
		"NO CONVOCADO · LO VES DESDE LA GRADA": "NON CONVOQUE · TU REGARDES DES TRIBUNES",
		"SALES DE TITULAR · ~{0} MIN": "TU ES TITULAIRE · ~{0} MIN",

		"DERBI · TITULAR · ~{0} MIN": "DERBY · TITULAIRE · ~{0} MIN",
		"DERBI · DESDE LA BANCA · ~{0} MIN": "DERBY · SUR LE BANC · ~{0} MIN",
		"ENTRAS DESDE LA BANCA · ~{0} MIN": "ENTREE EN COURS · ~{0} MIN",
		"SIN GASOLINA · EMPIEZAS EN LA BANCA · ~{0} MIN": "RESERVOIR VIDE · TU COMMENCES SUR LE BANC · ~{0} MIN",
		"EL MÍSTER NO TE QUIERE · DESDE LA BANCA · ~{0} MIN": "LE COACH TE BOUDE · DEPUIS LE BANC · ~{0} MIN",
		"TE CUIDAN AL VOLVER · DESDE LA BANCA · ~{0} MIN": "ON TE MENAGE AU RETOUR · DEPUIS LE BANC · ~{0} MIN",
		"EL TÉCNICO TE DA UNA OPORTUNIDAD": "LE COACH TE DONNE UNE CHANCE",
		"EL TÉCNICO TE ESTÁ BUSCANDO HUECO": "LE COACH TE CHERCHE UNE PLACE",
		"EL TÉCNICO TE DA DESCANSO": "LE COACH TE MET AU REPOS",
		"SIN GASOLINA": "RESERVOIR VIDE",
		"TE CUIDAN AL VOLVER": "ON TE MENAGE AU RETOUR",
		"DESDE LA BANCA · ~{0} MIN": "DEPUIS LE BANC · ~{0} MIN",
		"MEDIA Y FAMA: {0} · EL MÉRITO LO PONES TÚ": "TON NIVEAU ICI EST {0} · LE RESTE, C'EST TOI",
		"Te faltan {0}: sube de nivel, marca más o gánate al seleccionador en la concentración.":
			"Il te manque {0} : monte de niveau, marque plus ou gagne la confiance du sélectionneur.",
		"AL CAMPO": "EN PISTE",
		"SIMULAR LA FECHA": "SIMULER LA JOURNEE",
		"NO ENTRASTE EN LA LISTA": "TU N'ES PAS DANS LA LISTE",
		"PUESTO {0} DE {1} EN {2}": "{0}E SUR {1} EN {2}",
		"Debes mejorar para ser convocado: sube ~{0} de media o fama.":
			"Tu dois progresser pour être convoqué : gagne ~{0} de moyenne ou de renom.",
		"Debes mejorar para ser convocado: más nivel y más nombre.":
			"Tu dois progresser pour être convoqué : plus de niveau et plus de renom.",
		"PRÓXIMO MUNDIAL · EN {0} {1}": "PROCHAIN MONDIAL · DANS {0} {1}",
		"{0} AÑOS · NIVEL {1}": "{0} ANS · NIVEAU {1}",
		"AÑO {0} · SEM {1}": "AN {0} · SEM {1}",
		"LESIÓN": "BLESSURE",
		"EL CUERPO DECIDE": "LE CORPS DECIDE",
		"EN JUEGO": "EN JEU",
		"TE GUARDA PARA {0}": "GARDE POUR {0}",
		"TE DIO DESCANSO": "LE COACH T'A REPOSE",
		"Para el próximo: {0}.": "Pour le prochain : {0}.",
		"FECHAS": "DATES",
		"riel_pieSIGUIENTE": "SUIVANT",
		"riel_pieS{0}": "S{0}",
		"rielGENTE": "PROCHES",
		"rielDESTREZA": "TALENTS",
		"rielGERENCIA": "GESTION",
		"rielFICHAJES": "RECRUES",
		"rielASPECTO": "LOOK",
		"rielCONTRATO": "CONTRAT",
		"rielTORNEOS": "TOURNOIS",
		"rielRANKING": "RANKING",
		"rielNOTICIAS": "ACTUS",
		"rielJUGADOR": "JOUEUR",
		"rielEQUIPO": "EQUIPE",
		"· das tu palabra": "· tu donnes ta parole",
		"Diste tu palabra: si te vas esta ventana o la siguiente, tu grada te lo cobrará.": "Tu as donné ta parole : si tu pars pendant ce mercato ou le suivant, tes supporters te le feront payer.",
		"· empezáis a salir": "· vous sortez ensemble",
		"J{0}/{1}": "J{0}/{1}",
		"CÓMO SE VOTA": "LE VOTE",
		"NO CUENTAS": "HORS VOTE",
		"AL 1º": "AU 1E",
		"SOBRE EL 2º": "SUR LE 2E",
		"AL {0} · {1}": "A {0} · {1}",
		"HASTA {0}": "MAX {0}",
		"1 OFERTA": "1 OFFRE",
		"SIN OFERTAS AÚN": "AUCUNE OFFRE",
		"QUITAR DE VENTA": "RETIRER",
		"SU VALOR": "VALEUR",
		"ESPERAR": "ATTENDS",
		"{0} MÁS EN CAMINO": "{0} DE PLUS",
		"{0} DE SU VALOR": "{0} DE VALEUR",
		"ACEPTADA": "ACCEPTEE",
		"¡Sube su oferta!": "Il augmente son offre !",
		"Se planta: no pone más.": "Il campe sur sa position : pas plus.",
		"Se ofende y retira su oferta.": "Il se vexe et retire son offre.",
		"Esa oferta ya no está.": "Cette offre n'est plus là.",
		"Ya le pediste más: no pondrá más.": "Tu en as déjà demandé plus : il n'ajoutera rien.",
		"Ya aceptaste una oferta.": "Tu as déjà accepté une offre.",
		"Ya no está en venta.": "Il n'est plus en vente.",
		"En venta: sus ofertas, en la lista VENDER.": "En vente : ses offres sont dans la liste VENDRE.",
		"TU VENTANA": "MERCATO",
		"TRATOS CERRADOS": "AFFAIRES FAITES",
		"CERRAR TRATOS": "CONCLURE",
		"TE QUEDA": "RESTE",
		"VENTAS": "VENTES",
		"GENTE": "GENS",
		"SECCION": "SECTION",
		"DECORAR": "DECORER",
		"VENDER MUEBLE": "VENDRE",
		"¿Esperabas este recibimiento?": "Tu t'attendais à cet accueil ?",
		"¿Qué esperas de esta nueva etapa?": "Qu'attends-tu de cette nouvelle étape ?",
		"Vengo a devolverles todo este cariño en el campo.": "Je viens vous rendre tout cet amour sur le terrain.",
		"Es un sueño. Ahora toca ganarse el sitio.": "C'est un rêve. Maintenant, il faut gagner sa place.",
		"Vengo a dejarlo todo por esta camiseta.": "Je viens tout donner pour ce maillot.",
		"Q1": "Q1",
		"Q2": "Q2",
		"Q3": "Q3",
		"PO": "PO",
		"SI PIERDES": "SI DEFAITE",
		"CAMINO A LA FASE DE LIGA": "VERS LA PHASE DE LIGUE",
		"VÍA DE LIGA": "VOIE LIGUE",
		"VÍA DE CAMPEONES": "VOIE CHAMPIONS",
		"GANADOR DE": "GAGNANT DE",
		"PERDEDOR DE": "PERDANT DE",
		"SORTEO {0}": "TIR. {0}",
		"IDA {0}": "ALLER {0}",
		"VUELTA {0}": "RETOUR {0}",
		"DESDE LA FASE DE LIGA YA NO SE BAJA": "PHASE DE LIGUE : PLUS DE CHUTE",
		"GLOBAL A FAVOR": "GLOBAL POUR",
		"GLOBAL EN CONTRA": "GLOBAL CONTRE",
		"GLOBAL IGUALADO": "GLOBAL EGAL",
		"UEFA": "UEFA",
		"COEFICIENTE DE 5 TEMPORADAS": "COEFFICIENT SUR 5 SAISONS",
		"Tu liga no juega las copas de la UEFA.": "Ta ligue ne joue pas les coupes de l'UEFA.",
		"PLAZAS {0}": "PLACES {0}",
		"uefaSUSPENDIDA": "SUSPENDUE",
		"uefa{0} A {1}": "{1} DU {0}",
		"COEFICIENTE UEFA": "COEFFICIENT UEFA",
		"5 TEMPORADAS": "5 SAISONS",
		"CABEZA DE SERIE": "TETE DE SERIE",
		"SUELO DE TU LIGA": "PLANCHER DE LIGUE",
		"LP": "PL",
	},


	"career_pages": {
		"TUYA": "A TOI",

		"¿Te la compras?": "Tu l'achètes ?",
		"Va a tu clóset: te la pones en PERSONALIZAR.": "Direction ton dressing : mets-la dans PERSONNALISER.",
		"COMPRAR ${0}": "ACHETER ${0}",





		"LO QUE PIDE EL CLUB": "CE QUE VEUT LE CLUB",
		"Lo que se le exige al equipo, medido contra sus rivales de cada torneo.": "Ce qu'on exige de l'équipe, mesuré face à ses rivaux dans chaque tournoi.",
		"{0}: {1} o mejor": "{0} : {1} ou mieux",
		"Pelear arriba ({0} o mejor)": "Viser le haut ({0} ou mieux)",
		"Te lo suben: el año pasado diste más de lo pedido.": "Objectif relevé : la saison passée tu as fait plus que demandé.",
		"Te lo bajan: el año pasado te quedaste corto.": "Objectif abaissé : la saison passée, tu es resté en deçà.",
		"A este ritmo: {0} de {1}": "Projection : {0} sur {1}",
		"EL CLUB": "LE CLUB",
		"GRUPO": "POULE",
		"{0} goles · hiciste {1}": "{0} buts · tu en as mis {1}",
		"{0} asistencias · diste {1}": "{0} passes déc. · tu en as fait {1}",
		"{0} partidos · jugaste {1}": "{0} matchs · tu en as joué {1}",
		"nota {0} · hiciste {1}": "note {0} · tu as fait {1}",
		"acabar {0} o mejor": "finir {0} ou mieux",
		"TE SIENTAN POR NO CUMPLIR": "AU BANC, OBJECTIF RATE",
		"Ganar la liga": "Gagner le championnat",
		"Acabar {0} o mejor": "Finir {0} ou mieux",
		"Mantener la categoría": "Se maintenir",
		"Ascender de categoría": "Monter en division",
		"Pelear el ascenso ({0} o mejor)": "Jouer la montée ({0} ou mieux)",
		"Levantar el título": "Soulever le trophée",
		"Llegar a la final": "Atteindre la finale",
		"Llegar a semifinales": "Atteindre les demi-finales",
		"Llegar a cuartos": "Atteindre les quarts",
		"Pasar una ronda": "Passer un tour",
		"Pasar la fase de liga": "Passer la phase de ligue",
		"Dar la cara": "Faire bonne figure",
		"Competir": "Rivaliser",
		"FALLADO": "RATE",
		"SIN EMPEZAR": "PAS DEBUTE",
		"VAS {0}": "AU {0}",
		"SIN DATOS": "SANS DATA",
		"EN FASE DE LIGA": "PHASE DE LIGUE",
		"{0}/{1} RONDAS": "{0}/{1} TOURS",
		"EL CLUB, CORTO": "CLUB EN RETARD",
		"{0} · PIDE {1}": "{0} · VEUT {1}",
		"Prima por el año del club: ${0}": "Prime pour la saison du club : ${0}",
		"El club destituye al técnico": "Le club limoge l'entraîneur",
		"Las copas le salvan el puesto al técnico": "Les coupes sauvent la place de l'entraîneur",
		"El club le mantiene la confianza al técnico": "Le club renouvelle sa confiance à l'entraîneur",
		"TU OBJETIVO": "OBJECTIF",
		"EL AÑO DEL CLUB": "L'ANNEE DU CLUB",

		"TU JUEGO": "TON JEU",

		"HABILIDAD": "APTITUDES",

		"CLUBES": "CLUBS",
		"JUGADORES": "JOUEURS",
		"BALON DE ORO": "MEILLEUR JOUEUR",
		"TU CARRERA": "TA CARRIERE",
		"TROFEOS": "TROPHEES",

		"SONIDO": "SON",
		"MÚSICA": "MUSIQUE",
		"EFECTOS": "EFFETS",
		"PARTIDO": "MATCH",
		"DIFICULTAD": "DIFFICULTE",
		"NORMAL": "NORMAL",



		"LA DIFICULTAD": "LA DIFFICULTE",
		"Así de duro te lo va a poner el rival. No lo eliges para siempre.": "Voilà la dureté que l'adversaire va t'imposer. Ce n'est pas définitif.",
		"Puedes cambiarla en cualquier momento desde PAUSA > AJUSTES, sin salir del partido.": "Tu peux la changer à tout moment depuis PAUSE > REGLAGES, sans quitter le match.",
		"FACIL: el rival se para mientras apuntas y no te quita el balón nunca. El portero falla más.": "FACILE : l'adversaire se fige pendant que tu vises et ne te prend jamais le ballon. Le gardien commet plus d'erreurs.",
		"NORMAL: el rival va más lento mientras apuntas y te roba de más cerca. El portero falla algo más.": "NORMAL : l'adversaire ralentit pendant que tu vises et doit s'approcher davantage pour te prendre le ballon. Le gardien commet un peu plus d'erreurs.",
		"DIFICIL: el juego completo. Te aprietan mientras apuntas, te roban el balón y el portero no regala nada.": "DIFFICILE : le jeu complet. On te presse pendant que tu vises, on te prend le ballon et le gardien ne fait aucun cadeau.",
		"EXTREMO: marcan a la estrella, una ocasión menos, cansado tiras peor, tapan más, roban sin aviso y todos te exigen más.": "EXTREME : la star est marquée, une occasion de moins, fatigué tu tires moins bien, plus de contres, ballons volés sans prévenir et tout le monde exige plus.",
		"PERSPECTIVA": "PERSPECTIVE",
		"TV": "TV",
		"CAMPO": "TERRAIN",
		"TV: el plano alto de siempre. Toda la cancha por delante para ver a quién pasarla.": "TV : le plan haut habituel. Tout le terrain devant toi, pour voir à qui passer.",
		"CAMPO: la cámara baja y se acerca, casi a tu espalda. Entra el fondo del estadio y el partido se ve desde dentro.": "TERRAIN : caméra plus basse et plus proche, presque dans ton dos. Le fond du stade entre dans le cadre et tu vis le match de l'intérieur.",
		"SACUDIDA DE CÁMARA": "SECOUSSE CAMERA",
		"DISTANCIA DE CÁMARA": "DISTANCE CAMERA",
		"GIRO DE VISTA": "ROTATION DE VUE",
		"MENOS MOVIMIENTO DE CÁMARA": "REDUIRE LE MOUVEMENT CAMERA",
		"VIBRACIÓN": "VIBRATIONS",
		"TEMA CLARO": "THEME CLAIR",
		"TEMA OSCURO": "THEME SOMBRE",
		"PANTALLA": "ECRAN",
		"EFECTO CRT": "EFFET CRT",
		"AHORRO DE BATERÍA": "ECONOMIE DE BATTERIE",

		"CALIDAD BAJA": "QUALITE BASSE",
		"MUY BAJA": "TRES BASSE",

		"Rayas de tele retro": "Lignes de télé rétro",
		"Más fluido, menos detalle y sin CRT": "Plus fluide, moins de détails, sans CRT",
		"Aún más fluido, menos nítido": "Encore plus fluide, moins net",
		"Menús a 30 fps cuando no tocas": "Menus à 30 fps au repos",
		"Cambia el icono de la app": "Change l'icône de l'app",
		"Juega con el teléfono girado": "Joue avec le téléphone à l'horizontale",

		"HORIZONTAL": "PAYSAGE",
		"EN CONSTRUCCIÓN": "EN CHANTIER",
		"PROBAR": "TESTER",
		"La vista horizontal todavía no está terminada: algunas pantallas "
		+ "pueden verse descuadradas o cortadas. Puedes volver a la vertical aquí mismo "
		+ "cuando quieras.":
			"La vue paysage n'est pas encore terminée : certains écrans peuvent paraître décalés ou coupés. Tu peux revenir à la vue portrait ici même quand tu veux.",
		"Para teléfonos que van lentos: menos resolución en el estadio, sin filtro "
		+ "CRT ni sombras, y la mitad de lluvia y nieve.":
			"Pour les téléphones lents : moins de résolution dans le stade, "
			+ "sans filtre CRT ni ombres, et moitié moins de pluie et de neige.",
		"Tu teléfono iba lento: activamos CALIDAD BAJA. Puedes quitarla en "
		+ "AJUSTES.":
			"Ton téléphone ramait : on a activé QUALITE BASSE. Tu peux la "
			+ "retirer dans REGLAGES.",

		"ICONO DE LA APP": "ICONE DE L'APP",
		"CLÁSICO": "CLASSIQUE",
		"NOCHE DE BRUJAS": "HALLOWEEN",
		"Cambia el icono del juego en tu pantalla de inicio.":
			"Change l'icône du jeu sur ton écran d'accueil.",
		"El teléfono no dejó cambiar el icono. Vuelve a intentarlo.":
			"Ton téléphone n'a pas pu changer l'icône. Réessaie.",
		"Con el juego quieto baja el refresco y deja que la pantalla se apague "
		+ "sola. El partido no cambia.":
			"Quand le jeu reste immobile, le rafraîchissement baisse et l'écran "
			+ "peut s'éteindre tout seul. Le match ne change pas.",
		"CARRERAS": "CARRIERES",
		"Borra la carrera de cualquier ranura para dejarla libre. No se puede deshacer.":
			"Efface la carrière de n'importe quel emplacement pour le libérer. C'est irréversible.",
		"EMPEZAR DE CERO": "TOUT EFFACER",
		"Borra todas las carreras Y todos los logros. El juego queda como recién instalado. No se puede deshacer.":
			"Efface toutes les carrières ET tous les succès. Le jeu redevient comme neuf. C'est irréversible.",
		"REINICIAR TODO": "TOUT REINITIALISER",
		"¿REINICIAR TODO?": "TOUT REINITIALISER ?",
		"Se pierden todas las carreras y TODOS los logros. El juego vuelve a empezar de cero. Esto no se puede deshacer.":
			"Tu perds toutes les carrières et TOUS les succès. Le jeu repart de zéro. C'est irréversible.",
		"SÍ": "OUI",
		"BORRAR": "EFFACER",
		"SÍ, BORRAR": "OUI, EFFACER",
		"SÍ, BORRAR TODO": "OUI, TOUT EFFACER",
		"CANCELAR": "ANNULER",
		"VACÍA": "VIDE",
		"RETIRADO": "RETRAITE",
		"T{0}": "S{0}",
		"¿BORRAR RANURA {0}?": "EFFACER L'EMPLACEMENT {0} ?",
		"Es tu carrera ACTIVA.": "C'est ta carrière ACTIVE.",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.{1}\n"
		+ "Las otras ranuras no se tocan.":
			"Tu perds la carrière de {0} : niveau, argent, contrat et palmarès.{1}\n"
			+ "Les autres emplacements ne sont pas touchés.",

		"TU NOMBRE": "TON NOM",
		"NOMBRE EN LA ESPALDA": "NOM AU DOS",
		"16 AÑOS · DEBUTANTE": "16 ANS · DEBUTANT",
		"Debutante": "Débutant",
		"TU ASPECTO": "TON APPARENCE",
		"NUEVA CARRERA+": "NOUVELLE CARRIERE+",
		"Lo que te ganaste en carreras anteriores. Elige con qué ventaja arrancas esta "
		+ "vez —o ninguna, y empieza de cero como todos.":
			"Ce que tu as gagné lors de carrières précédentes. Choisis l'avantage avec "
			+ "lequel tu démarres cette fois — ou aucun, et pars de zéro comme tout le monde.",
		"QUITAR": "RETIRER",
		"ELEGIR": "CHOISIR",
		"TU NACIONALIDAD": "TA NATIONALITE",
		"ELIGE TU NACIONALIDAD": "CHOISIS TA NATION",
		"FALTA TU NOMBRE Y TU NACIONALIDAD": "NOM ET NATION MANQUANTS",
		"FALTA ESCRIBIR TU NOMBRE": "ECRIS TON NOM D'ABORD",
		"FALTA ELEGIR TU NACIONALIDAD": "CHOISIS TA NATION D'ABORD",
		"TU CLUB": "TON CLUB",
		"LEYENDAS DEL CLUB": "LEGENDES DU CLUB",
		"NO EXISTEN LEYENDAS AÚN": "PAS ENCORE DE LEGENDES",
		"CREA TU JUGADOR": "CREE TON JOUEUR",



		"PASO 1 DE 2 · NOMBRE Y ASPECTO": "ETAPE 1 SUR 2 · NOM ET APPARENCE",
		"SIGUIENTE  >": "SUIVANT  >",
		"< ATRÁS": "< RETOUR",
		"NACIONALIDAD Y CLUB": "NATIONALITE ET CLUB",
		"PASO 2 DE 2 · CON QUIÉN Y DÓNDE EMPIEZAS": "ETAPE 2 SUR 2 · AVEC QUI ET OU TU COMMENCES",
		"EMPEZAR CARRERA": "COMMENCER LA CARRIERE",
		"< VOLVER": "< RETOUR",



		"Primera": "Première",
		"Segunda": "Deuxième",
		"Tercera": "Troisième",
		"{0} DIVISIÓN": "{0}E DIVISION",
		"¡NUEVO!": "NOUVEAU !",
		"DESBLOQUEADA": "DEBLOQUEE",
		"BLOQUEADO": "VERROUILLE",

		"< ATRAS": "< RETOUR",



		"Piel": "Peau",
		"Pelo": "Cheveux",
		"Corte": "Coupe",
		"Vello facial": "Pilosité faciale",



		"Puntas": "Pointes",
		"Botines": "Crampons",
		"Playera casual": "T-shirt casual",
		"Pantalón casual": "Pantalon casual",
		"Estampado": "Motif",
		"2º color playera": "2e couleur maillot",
		"Manga": "Manche",
		"Prenda": "Vêtement",
		"Chamarra": "Blouson",
		"Rectangulares": "Rectangulaires",
		"Deportivos": "Sport",
		"Short de mezclilla": "Short en jean",
		"Short cargo": "Short cargo",
		"Bermuda": "Bermuda",
		"Short de baño": "Short de bain",
		"Diamante": "Diamant",
		"Doble aro": "Double anneau",
		"Colgante": "Pendant",
		"Ear cuff": "Ear cuff",
		"Oxford": "Oxford",
		"Chelsea": "Chelsea",
		"Chanclas": "Claquettes",
		"Gala": "Gala",
		"Traje de gala": "Tenue de gala",
		"Esmoquin clásico": "Smoking noir",
		"Traje azul": "Costume bleu",
		"Esmoquin marfil": "Smoking ivoire",
		"Terciopelo granate": "Velours grenat",
		"Tres piezas gris": "Trois pièces gris",
		"Traje cruzado": "Costume croisé",
		"Oficina azul": "Bureau bleu",
		"Básico grafito": "Graphite basique",
		"Lino arena": "Lin sable",
		"Traje café": "Costume marron",
		"Satén medianoche": "Satin nuit",
		"Terciopelo esmeralda": "Velours émeraude",
		"Seda perla": "Soie perle",
		"Marfil y oro": "Ivoire et or",
		"Negro y oro": "Noir et or",
		"Diplomático": "Diplomate",
		"Traje sin corbata": "Costume sans cravate",
		"Saco y cuello alto": "Veste et col roulé",
		"Conjunto con chaleco": "Costume avec gilet",
		"Oversize": "Oversize",
		"Sin mangas": "Débardeur",
		"Cuello alto": "Col roulé",
		"Camisa abierta": "Chemise ouverte",
		"Chinos": "Chinos",
		"Mezclilla ancha": "Jean large",
		"De vestir": "Habillé",
		"Short deportivo": "Short de sport",
		"Bomber": "Bomber",
		"Mezclilla": "Denim",
		"Cuero": "Cuir",
		"Rompevientos": "Coupe-vent",
		"Blazer": "Blazer",
		"Cierre": "Fermeture",
		"Abierta": "Ouverte",
		"Cerrada": "Fermée",
		"Hacia atrás": "À l’envers",
		"Gorro tejido": "Bonnet",
		"Bucket": "Bob",
		"Redondos": "Rondes",
		"Aviador": "Aviateur",
		"Con dije": "Pendentif",
		"Reloj": "Montre",
		"Pulsera": "Bracelet",
		"Calzado": "Chaussures",
		"Tenis bajos": "Baskets basses",
		"Tenis altos": "Baskets hautes",
		"Botas": "Bottes",
		"Mocasines": "Mocassins",
		"Sandalias": "Sandales",
		"Color del calzado": "Couleur des chaussures",
		"Playeras": "Hauts",
		"Pantalones": "Pantalons",
		"Chamarras": "Vestes",
		"Gorras": "Casquettes",
		"Accesorios": "Accessoires",
		"Color de playera": "Couleur du haut",
		"Prenda exterior": "Veste",
		"Color de chamarra": "Couleur de veste",
		"Recto": "Droit",
		"Jeans": "Jean",
		"Cargo": "Cargo",
		"Jogger": "Jogging",
		"Aretes": "Boucles",
		"Broquel": "Clou",
		"Aro": "Anneau",
		"Cadena": "Chaîne",
		"Metal": "Métal",
		"Polo": "Polo",
		"Camisa": "Chemise",
		"Suéter": "Pull",
		"Chaleco": "Gilet",
		"Abrigo": "Manteau",
		"Hoodie": "Sweat à capuche",
		"Largo del pantalón": "Longueur du pantalon",
		"Largo": "Long",
		"Corto": "Court",
		"Gorra": "Casquette",
		"Sombrero": "Chapeau",
		"Color de la gorra": "Couleur de la casquette",
		"Corta": "Courte",
		"Larga": "Longue",
		"Gafas": "Lunettes",
		"De sol": "De soleil",
		"Lentes": "De vue",
		"Liso": "Uni",
		"Rayas": "Rayures",
		"Raya fina": "Fines rayures",
		"Mitad": "Moitié",
		"Tatuajes": "Tatouages",

		"Tinte": "Teinture",
		"Rostro": "Visage",
		"Mediano": "Mi-long",
		"Accesorio": "Accessoire",
		"Brazos": "Bras",
		"Arriba": "Haut",
		"Abajo": "Bas",
		"Detalles": "Détails",
		"Outfits": "Tenues",
		"Traje": "Costume",
		"Cuello": "Cou",
		"Muñeca": "Poignet",
		"Brazo izq": "Bras gauche",
		"Brazo der": "Bras droit",
		"Ambos": "Les deux",


		"Tatuaje de cuello": "Tatouage du cou",
		"Tinta del cuello": "Encre du cou",
		"Dibujo de la pierna": "Motif de jambe",
		"Tinta de la pierna": "Encre de jambe",
		"Guantes de campo": "Gants de terrain",
		"Guantes": "Gants",
		"Muñequeras": "Poignets éponge",
		"Color de la muñequera": "Couleur du poignet",
		"Manga de compresión": "Manchon de compression",
		"Color de la manga": "Couleur du manchon",
		"Vendaje": "Bandage",
		"Medias": "Chaussettes",
		"Cinta de la media": "Bande de chaussette",
		"Normales": "Normales",
		"Con cinta": "Avec bande",
		"Bajadas": "Baissées",
		"Piernas": "Jambes",
		"Pierna izq": "Jambe g.",
		"Pierna der": "Jambe d.",
		"Manga entera": "Manche pleine",
		"Antebrazo": "Avant-bras",
		"Bíceps": "Biceps",
		"Manga difuminada": "Manche fondue",
		"Escamas": "Écailles",
		"Eslabones": "Maillons",
		"Ondas": "Vagues",
		"Cuadros": "Carreaux",
		"Aros finos": "Anneaux fins",
		"Salpicado": "Moucheté",
		"Tres aros": "3 anneaux",
		"Lágrima": "Larme",
		"Estrella": "Étoile",
		"Barra": "Barre",
		"Triángulo": "Triangle",
		"Galón": "Chevron",
		"Flecha": "Flèche",
		"Cuadro": "Carré",
		"Anillo": "Anneau",
		"Gancho": "Crochet",
		"Raya corta": "Trait",
		"Dos barras": "Deux barres",
		"Cruz": "Croix",
		"Franja": "Bande",
		"Franja ancha": "Bande large",
		"Tres puntos": "Trois points",
		"Rombo": "Losange",
		"Dibujo del tatuaje": "Motif du tatouage",
		"Tinta del tatuaje": "Encre du tatouage",
		"Punto": "Point",
		"Dos puntos": "Deux points",
		"Línea corta": "Trait court",
		"Cruz pequeña": "Petite croix",
		"Rombo pequeño": "Petit losange",
		"Izquierda": "Gauche",
		"Derecha": "Droite",
		"Ambas": "Les deux",
		"Damero": "Damier",
		"Aros": "Anneaux",
		"Brazalete": "Brassard",
		"Tribal": "Tribal",
		"Cepillo": "Coupe brosse",
		"Un costado": "Rasé sur un côté",
		"Mullet": "Mulet",
		"Afro": "Afro",
		"Melena": "Cheveux longs",
		"Ojos": "Yeux",
		"Cejas": "Sourcils",
		"Accesorio de cabeza": "Accessoire de tête",
		"Raya al medio": "Raie au milieu",
		"Coronilla": "Couronne",
		"Herradura": "Fer à cheval",
		"Normal": "Normal",
		"Calvo": "Chauve",
		"Rapado": "Rasé court",
		"Cresta": "Crête",
		"Lados": "Undercut",
		"Degradado": "Dégradé",
		"Entradas": "Golfes",
		"Cresta ancha": "Crête large",
		"Raya": "Raie",
		"Franjas": "Lignes",
		"Nada": "Aucun",
		"Barba": "Barbe",
		"Candado": "Barbichette",
		"Bigote": "Moustache",
		"Sombra": "Ombre",
		"Patillas": "Pattes",
		"Mosca": "Mouche",
		"Contorno": "Collier",
		"Barbón": "Barbe pleine",
		"Manillar": "Guidon",

		"CAMBIAR": "CHANGER",
		"BUSCAR": "CHERCHER",
		"SIN RESULTADOS": "AUCUN RESULTAT",
		"SUGERIDAS": "SUGGESTIONS",
		"TODAS": "TOUTES",
		"Color libre": "Couleur libre",


		"ANTES": "AVANT",
		"AHORA": "MAINTENANT",
		"PAÍS DEL CLUB": "PAYS DU CLUB",
		"VER LOS {0} CLUBES": "VOIR LES {0} CLUBS",
		"TUS OFERTAS": "TES OFFRES",
		"INICIA DESDE ABAJO": "TU COMMENCES EN BAS",
		"INICIA DONDE QUIERAS": "COMMENCE OU TU VEUX",
		"ELIGE TU CLUB": "CHOISIS TON CLUB",
		"VER LAS {0} OFERTAS": "VOIR LES {0} OFFRES",
		"{0} DE TU PAÍS · {1} DEL EXTRANJERO": "{0} DE TON PAYS · {1} DE L'ETRANGER",
		"DIVISIÓN BLOQUEADA": "DIVISION VERROUILLEE",
		"TELEMETRÍA": "TELEMETRIE",
		"Contadores de uso guardados en este teléfono. Sirven para saber qué partes del juego se usan y no hay ningún dato tuyo dentro.":
			"Compteurs d'usage enregistrés sur ce téléphone. Ils servent à savoir quelles parties du jeu sont utilisées et aucune de tes données n'y figure.",
		"COMPARTIR CONTADORES":
			"PARTAGER LES COMPTEURS",
		"Estos mismos números se envían al desarrollador para saber qué partes del juego se usan. Nunca van tu nombre, tu partida ni nada que te identifique. Apágalo cuando quieras.":
			"Ces mêmes chiffres sont envoyés au développeur pour savoir quelles parties du jeu sont utilisées. Ton nom, ta partie et tout ce qui t'identifie ne partent jamais. Désactive-le quand tu veux.",
		"VER CONTADORES": "VOIR LES COMPTEURS",
		"BORRAR CONTADORES": "EFFACER LES COMPTEURS",
		"PEDIR BORRADO": "DEMANDER LA SUPPRESSION",
		"CERRAR": "FERMER",
		"NO": "NON",
		"MANTEN PARA REINICIAR TODO": "MAINTIENS POUR TOUT REINITIALISER",
		"MANTEN PARA PEDIR CAMBIO": "MAINTIENS POUR SORTIR",
		"BORRAR TODO": "TOUT EFFACER",
		"MANTÉN PULSADO PARA BORRAR TODO": "MAINTIENS APPUYE POUR TOUT EFFACER",

		"REY DEL GOL": "ROI DU BUT",
		"REY DEL PASE": "ROI DE LA PASSE",
		"{0} lidera el goleo con {1}": "{0} est en tête des buteurs avec {1}",
		"{0} acaba de máximo goleador con {1}": "{0} finit meilleur buteur avec {1}",
		"{0} manda en asistencias con {1}": "{0} domine les passes avec {1}",
		"{0} acaba líder de asistencias con {1}": "{0} finit meilleur passeur avec {1}",
		"{0} es el jugador de la temporada ({1})": "{0} est le joueur de la saison ({1})",
		"CAMPEÓN DE LIGA": "CHAMPION",
		"DESCIENDE": "RELEGUE",
		"BOMBAZO": "RECORD",
		"SORPRESA": "SURPRISE",
		"{0} se lleva la liga": "{0} remporte le championnat",
		"{0} baja a {1}": "{0} descend en {1}",
		"{0} es el fichaje más caro de la ventana": "{0} est le transfert le plus cher du mercato",
		"{0} cuelga las botas": "{0} raccroche les crampons",
		"{0} tumba al {1}": "{0} fait tomber {1}",
		"{0} lleva {1} victorias seguidas": "{0} enchaîne {1} victoires",
		"{0} lleva {1} partidos sin ganar": "{0} reste sur {1} matchs sans victoire",
		"El {0} destituye a {1}": "{0} limoge {1}",
		"{0} coge el banquillo del {1}": "{0} prend les rênes du {1}",
		"{0} deja el {1} y coge el {2}": "{0} quitte le {1} pour le {2}",
		"El {0} se lleva a {1} del {2}": "Le {0} débauche {1} du {2}",

		"SELECCIONES": "SELECTIONS",
		"{0} deja de ser seleccionador de {1}": "{1} : {0} n'est plus sélectionneur",
		"{0}, nuevo seleccionador de {1}": "{1} : {0} nommé sélectionneur",
		"{0} deja el {1} para dirigir a {2}": "{2} : {0} quitte le {1} et devient sélectionneur",
		"{0} deja la selección de {1} y coge la de {2}": "{2} : {0} nommé sélectionneur, après {1}",
		"{0} deja la selección de {1} y coge el {2}": "{0} quitte son poste de sélectionneur ({1}) pour le {2}",

		"INVERSOR": "INVESTISSEUR",
		"CRISIS": "CRISE",
		"{0} cambia de dueño: llega dinero para fichar": "{0} change de propriétaire : de l'argent arrive pour recruter",
		"{0} entra en crisis y tendrá que vender": "{0} plonge dans la crise et devra vendre",
		"Se acaba el dinero del nuevo dueño del {0}": "L'argent du nouveau propriétaire du {0} est épuisé",
		"NOTICIAS": "ACTUS",
		"Tu club todavía no ha sido noticia.": "Ton club n'a pas encore fait parler de lui.",
		"Tu liga todavía no ha sido noticia.": "Ton championnat n'a pas encore fait parler de lui.",
		"El mundo todavía no ha dado que hablar.": "Le monde n'a encore rien donné à raconter.",
		"Un jeque compra el {0}: viene a ganarlo todo": "Un cheikh rachète {0} : il vient tout gagner",
		"Un magnate compra el {0}: llega dinero para fichar": "Un magnat rachète {0} : de l'argent arrive pour recruter",
		"Un fondo compra el {0} para revenderlo": "Un fonds rachète {0} pour le revendre",
		"PRIMER PARTIDO": "PREMIER MATCH",
		"BODA": "OUI",
		"DIVORCIO": "DIVORCE",
		"RUPTURA": "RUPTURE",
		"JUNTOS": "A DEUX",
		"A DISTANCIA": "A DISTANCE",
		"{0} se casa": "{0} se marie",
		"{0} se divorcia": "{0} divorce",
		"{0} rompe con su pareja": "{0} rompt avec sa compagne",
		"{0} llega al {1} con su pareja": "{0} arrive à {1} avec sa compagne",
		"{0} llega solo al {1}: su pareja no se muda": "{0} arrive seul à {1} : sa compagne ne déménage pas",
		"NOTICIA": "ACTU",
		"EL DOBLETE": "LE DOUBLE",
		"EL TRIPLETE": "LE TRIPLE",
		"ASCENDISTE": "PROMU",
		"DESCENDISTE": "RELEGUE",
		"de {0} equipos": "sur {0} équipes",
		"Bolsa": "Sac",
		"Mallas": "Collant",
		"Térmicas": "Thermiques",
		"Rodillera": "Genouillère",
		"Material": "Matière",
		"Neopreno": "Néoprène",
		"LEER": "LIRE",
		"SIN PERDER": "INVAINCU",
		"ORDEN": "ORDRE",
		"ORDENAR": "TRIER",
		"TUS REDES": "RESEAUX",
		"TU POST": "POST",
		"FUEGO": "FEU",
		"APLAUSO": "BRAVO",
		"HINCHA": "FAN",
		"MARCA": "PUB",
		"¿CONTESTAS?": "REPONDS?",
		"No contestas. Pasa solo.": "Pas de réponse. Ça passe.",
		"Toca mejorar. Y mejoraré.": "À progresser. Je le ferai.",
		"En el próximo hablo yo. #CALLABOCAS": "Prochain: je parle. #SILENCE",
		"SE COBRA": "ECHEANCE",
		"te ha mencionado · nota {0}": "t'a cité · note {0}",
		"Tu muro todavía está vacío.": "Ton mur est encore vide.",
		"El Diario": "Le Quotidien",
		"@eldiario": "@lequotidien",
		"La Grada": "Les Tribunes",
		"@lagradafiel": "@tribunefidele",
		"@el_10_del_equipo": "@le_10_du_club",
		"Hincha rival": "Supporter rival",
		"@ultra_norte": "@ultra_nord",
		"Tu marca": "Ta marque",
		"@tumarca_oficial": "@tamarque_off",
		"tras la {0}": "après la {0}",
		"SEGUIDORES": "ABONNES",
		"RESPONDER": "REPONDRE",
		"RESPONDIENDO A": "EN REPONSE A",
		"Nos vemos en el campo. #ALLÍTEESPERO": "Rendez-vous sur le terrain. #JYSERAI",
		"¡Así se habla, capitán!": "Bien dit, capitaine !",
		"Mucho hablar...": "Beaucoup de blabla...",
		"TE ETIQUETAN": "TAGUE",
		"Un rival te ha mencionado antes del partido. Todo el mundo mira qué contestas.": "Un rival t'a mentionné avant le match. Tout le monde attend ta réponse.",
		"Lo dijiste en redes. Hoy te toca callar.": "Tu l'as dit sur les réseaux. Aujourd'hui, tu te tais.",
		"antes de la {0}": "avant la {0}",
		"{0} te ha etiquetado": "{0} t'a taggué",
		"¿ENTRAS AL TRAPO?": "TU REPONDS ?",
		"Ni le contestas. Tu técnico lo agradece.": "Tu ne réponds même pas. Ton coach apprécie.",
		"el campo es mi casa. A ver si esta vez das la cara.": "le terrain, c'est chez moi. On verra si tu te montres cette fois.",
		"¿te acuerdas de la final? Yo sí. Te espero en el campo.": "tu te souviens de la finale ? Moi oui. Je t'attends sur le terrain.",
		"Hablamos en el campo.": "On en reparle sur le terrain.",
		"La final ya pasó. Ahora, otra historia.": "La finale, c'est du passé. Maintenant, c'est une autre histoire.",
		"LA REVANCHA": "LA REVANCHE",
		"MENSAJES": "MESSAGES",
		"AGRADECER": "REMERCIER",
		"DISTE TU PALABRA": "PAROLE DONNEE",
		"No tienes mensajes.": "Tu n'as aucun message.",
		"{0}, de la grada": "{0}, des tribunes",
		"CADUCA EN {0}": "FIN DANS {0}",
		"TU ASISTENCIA · {0}": "TA PASSE · {0}",
		"RUMOR": "BRUIT",
		"PALABRA": "PAROLE",
		"Si no contestas, no pasa nada.": "Si tu ne réponds pas, il ne se passe rien.",
		"¿Con qué festejo nos celebras el próximo gol en casa?": "Avec quelle célébration fêtes-tu le prochain but à domicile ?",
		"ENCUESTA": "SONDAGE",
		"{0} VOTOS": "{0} VOTES",
		"Ganó {0}": "{0} a gagné",
		"Lo votó {0}": "Voté par {0}",
		"LLEVAR AL BOMBO": "AU TAMBOUR",
		"Abre tu bombo de CELEBRACIONES.": "Ouvre ton tambour de CELEBRATIONS.",
		"SI SALE EN CASA": "CHEZ NOUS",
		"Tú celebras a tu manera.": "Tu fêtes à ta façon.",
		"NO CUESTA NADA": "C'EST GRATUIT",
		"Tu próximo gol en casa": "Ton prochain but à domicile",
		"LA PEÑA LA PIDE": "VOEU DES FANS",
		"encuesta del mes · gana {0}": "sondage du mois · {0} gagne",
		"La peña vota el festejo del mes. Gana {2}: ¡lo queremos ver en casa, {0}!": "Les fans votent pour la célébration du mois. {2} gagne : on veut la voir à domicile, {0} !",
		"{0} le hace caso a su peña: {2} en casa.": "{0} écoute ses fans : {2} à domicile.",
		"¡Lo pedimos y {0} lo hizo! {2} delante de la peña.": "On l'a demandé et {0} l'a fait ! {2} devant les fans.",
		"Llegar a la fase de liga": "Atteindre la phase de ligue",
		"Ganar el cruce de {0}": "Gagner la double confrontation {0}",
		"¡La selfie de mi vida con {0}! Ya es mi foto de perfil.": "Le selfie de ma vie avec {0} ! C'est ma photo de profil maintenant.",
		"Me firmó y encima nos hicimos una selfie. Gracias, {0}.": "Il m'a signé un autographe et on a pris un selfie. Merci, {0}.",
		"Salió movida, pero os juro que es {0}.": "Elle est floue, mais je vous jure que c'est {0}.",
		"TECLAS": "TOUCHES",
		"PULSA UNA TECLA": "APPUIE SUR UNE TOUCHE",
		"MANTEN PARA RESTABLECER": "MAINTIENS POUR RESET",
		"FAN": "FAN",
		"Pillaron al revendedor que se colaba en la firma de {0}. ¡Bien visto!": "Ils ont attrapé le revendeur qui resquillait à la séance de dédicaces de {0}. Bien vu !",
		"A {0} no se la cuelan: seguridad saca a un revendedor de su firma.": "On ne la fait pas à {0} : la sécurité sort un revendeur de sa séance de dédicaces.",
		"Ya hay firmas de {0} a la venta por 5 €. El de la cola se puso las botas.": "Il y a déjà des autographes de {0} en vente à 5 €. Le gars de la file s'en est mis plein les poches.",
		"Nuestra tarde de firmas con {0} ya está en reventa. No era la idea.": "Notre séance de dédicaces avec {0} est déjà revendue. Ce n'était pas l'idée.",
		"Esperé toda la tarde para ver a {0} y me sacó seguridad. Sólo quería su firma.": "J'ai attendu tout l'après-midi pour voir {0} et la sécurité m'a sorti. Je voulais juste un autographe.",
	},




	"match": {
		"Mejor del Mundial": "Meilleur du Mondial",
		"Mejor de la Copa continental": "Meilleur de la Coupe continentale",
		"Bota de la Copa continental": "Soulier de la Coupe continentale",
		"Mejor (Mundial)": "Meilleur (Mondial)",
		"Mejor (Continental)": "Meilleur (Cont.)",
		"Bota (Continental)": "Soulier (Cont.)",
		"Figura del Mundial": "Star du Mondial",
		"JUEGOS OLÍMPICOS": "JEUX OLYMPIQUES",
		"Campeón Olímpico": "Champion olympique",
		"Oro olímpico": "Or olympique",
		"Oro Olímpico": "Or Olympique",
		"Ganar el oro en los Juegos Olímpicos.": "Remporter l'or aux Jeux olympiques.",
		"El oro que no se compra. Se cuelga del cuello.": "L'or qui ne s'achète pas. Il se porte autour du cou.",
		"JUEGOS OLÍMPICOS: oro para {0}": "JEUX OLYMPIQUES : l'or pour {0}",
		"{0}: ORO en los Juegos Olímpicos": "{0} : OR aux Jeux olympiques",
		"{0}: plata en los Juegos Olímpicos": "{0} : argent aux Jeux olympiques",
		"{0}: bronce en los Juegos Olímpicos": "{0} : bronze aux Jeux olympiques",


		"NO SOLTÓ": "IL N'A PAS LACHE",
		"SE LA APRETÓ": "IL S'EST FAIT SERRER",
		"ÉSTA VA POR TI": "CELLE-LA EST POUR TOI",
		"SE LA APRETARON, Y LO SABE": "IL S'EST FAIT SERRER, ET IL LE SAIT",
		"COMO SIEMPRE: NO SOLTÓ": "COMME TOUJOURS : IL N'A PAS LACHE",
		"HOY SE LA APRETARON": "AUJOURD'HUI IL S'EST FAIT SERRER",
		"NI UN CENTÍMETRO": "PAS UN CENTIMETRE",
		"SE DEJÓ APRETAR": "IL S'EST LAISSE SERRER",
		"NO SOLTÓ, POR UNA VEZ": "IL N'A PAS LACHE, POUR UNE FOIS",
		"SE LA APRETÓ. LE DA IGUAL": "IL S'EST FAIT SERRER. IL S'EN FICHE",



		"TU EX TÉCNICO NO CONTABA CONTIGO": "TON EX-ENTRAINEUR NE COMPTAIT PAS SUR TOI",
		"TU EX TÉCNICO APLAUDE TU GOL": "TON EX-ENTRAINEUR APPLAUDIT TON BUT",
		"GOL A TU EX TÉCNICO": "BUT CONTRE TON EX-ENTRAINEUR",
		"TU EX TÉCNICO SE VA SIN MIRARTE": "TON EX-ENTRAINEUR PART SANS TE REGARDER",
		"TU EX TÉCNICO TE APLAUDE": "TON EX-ENTRAINEUR T'APPLAUDIT",
		"TU EX TÉCNICO FESTEJA": "TON EX-ENTRAINEUR FAIT LA FETE",
		"APRETASTE A TU EX TÉCNICO": "TU AS SERRE TON EX-ENTRAINEUR",
		"TU EX TÉCNICO PUEDE CONTIGO": "TON EX-COACH TE DOMINE",
		"¡PICA RÁPIDO!": "TAPE VITE !",
		"LLEVA LA RAYA HASTA TU LADO": "AMENE LA LIGNE DE TON COTE",



		"EL VOLADO": "LE TIRAGE",
		"Cara": "Face",
		"Sol": "Pile",
		"¿Cara o sol?": "Pile ou face ?",
		"Tu equipo pide {0}.": "Ton équipe demande {0}.",
		"La moneda dice {0}.": "La pièce dit {0}.",
		"¡GANAS EL VOLADO! Pateas con tu gente.": "TU GAGNES LE TIRAGE ! Tu tires devant tes supporters.",
		"Pierdes el volado: pateas ante la grada rival.": "Tu perds le tirage : tu tires face au public adverse.",

		"¡LE DISTE AL ÁRBITRO!": "TU AS TOUCHE L'ARBITRE !",
		"ROJA DIRECTA · {0} {1} DE SANCIÓN": "ROUGE DIRECT · {0} {1} DE SUSPENSION",



		"El derbi. Fuera de casa. Aquí no se perdona nada.": "Le derby. À l'extérieur. Ici, on ne pardonne rien.",
		"Derbi. Noventa minutos que se recuerdan un año.": "Derby. Quatre-vingt-dix minutes dont on parlera un an.",
		"Última jornada. Lo que pase aquí ya no se arregla.": "Dernière journée. Ce qui se passe ici ne se rattrape plus.",
		"{0}. Y tú llegas en racha.": "{0}. Et tu arrives en forme.",

		"Te van a apretar arriba desde el primer balón. Sacúdetelos rápido.": "Ils vont te presser haut dès le premier ballon. Débarrasse-t'en vite.",
		"Hoy toca autobús: once atrás esperándote. La paciencia también juega.": "Bus garé aujourd'hui : onze derrière à t'attendre. La patience aussi, ça joue.",
		"Te marcan al hombre. Cada carrera tuya se lleva a uno puesto.": "Ils marquent à l'homme. Chacun de tes appels emmène un défenseur.",
		"Línea alta y sin prisa. La espalda de esa zaga es la jugada.": "Ligne haute et sans hâte. Le dos de cette défense, voilà le coup à jouer.",
		"Campo de {0}. A ver quién se acuerda de ti al final.": "Le stade de {0}. On verra qui se souvient de toi à la fin.",

		"Enfrente, {0}. Una temporada juntos en {1}; se acuerda de ti.": "En face, {0}. Une saison ensemble à {1} ; il se souvient de toi.",
		"Enfrente, {0}: {2} temporadas juntos en {1}. Te conoce de memoria.": "En face, {0} : {2} saisons ensemble à {1}. Il te connaît par cœur.",
		"{0} te conoce de {1}. Sabe hacia dónde vas a romper.": "{0} te connaît de {1}. Il sait de quel côté tu vas partir.",
		"{0} jugó contigo en {1}: te lee antes de que toques.": "{0} a joué avec toi à {1} : il te lit avant même que tu touches le ballon.",
		"Lo callaste. Su estadio entero, callado.": "Tu les as fait taire. Tout leur stade, muet.",
		"En el 90 y en su casa. De esos que no se olvidan.": "Minute 90, chez eux. De ceux qu'on n'oublie pas.",
		"Le has dado la vuelta. Tú solo.": "Tu as renversé le match. Tout seul.",
		"Tres. Te llevas el balón a casa.": "Trois. Tu repars avec le ballon.",
		"Y van dos. El campo es tuyo.": "Et de deux. Le terrain est à toi.",
		"En el derbi. Ese lo vas a contar mucho tiempo.": "Dans le derby. Celui-là, tu le raconteras longtemps.",
		"Empate. Y quedan minutos.": "Tu égalises. Et il reste du temps.",
		"Te lo empatan al final. Y te toca a ti arreglarlo.": "Ils égalisent à la fin. Et c'est à toi de réparer ça.",
		"{0} se pone por delante. La grada lo nota.": "{0} passe devant. Les tribunes le sentent.",
		"Otro. Esto se está yendo.": "Encore un. Ça part en vrille.",

		"Vuelves a {0}. Aquí jugaste {1} temporadas.": "De retour à {0}. Tu y as joué {1} saisons.",
		"Enfrente, {0}. Tu antiguo club.": "En face, {0}. Ton ancien club.",
		"{0} te cedió. Hoy le devuelves el favor.": "{0} t'a prêté. Aujourd'hui, tu lui rends la pareille.",
		"{1} temporadas en {0}. Hoy celebras allí.": "{1} saisons à {0}. Aujourd'hui, tu fêtes ça là-bas.",
		"{0} te dejó ir hace nada. Error suyo.": "{0} t'a laissé partir il y a peu. Leur erreur.",
		"Le marcas a {0}, tu antiguo club.": "Tu marques contre {0}, ton ancien club.",
		"{0} jugó contigo en {1}. Y hoy te marca.": "{0} a joué avec toi à {1}. Et aujourd'hui, il te marque.",
		"Tu club cedió a {0}. Y él se lo cobra.": "Ton club a prêté {0}. Et il le lui fait payer.",
		"{0}: {1} temporadas en tu club. Hoy, rival.": "{0} : {1} saisons dans ton club. Aujourd'hui, adversaire.",
		"{0}, ex de tu club. Duele el doble.": "{0}, un ancien de ton club. Ça fait deux fois plus mal.",
		"El palo. Un centímetro más adentro y estabas celebrando.": "Le poteau. Un centimètre de plus et tu célébrais.",
		"Otra vez el hierro. Hoy no te quiere.": "Encore le montant. Il ne t'aime pas aujourd'hui.",
		"Se lo pusiste. El gol es suyo; el pase, tuyo.": "Tu le lui as servi. Le but est à lui ; la passe, à toi.",


		"Levanta la mano. Nadie lo mira. Otra vez.": "Il lève la main. Personne ne le regarde. Encore.",
		"Está solo y lo ve todo el estadio menos sus compañeros.": "Il est seul, et tout le stade le voit sauf ses coéquipiers.",
		"La juegan por el otro lado. Ya ni la pide.": "Ils jouent de l'autre côté. Il ne la demande même plus.",
		"Se ofrece, le dan la espalda. Este equipo no es suyo.": "Il se propose, on lui tourne le dos. Cette équipe n'est pas la sienne.",
		"Había pase y eligieron el otro. Pasa mucho últimamente.": "La passe était là et ils ont choisi l'autre. Ça arrive souvent ces temps-ci.",
		"Le llega y el estadio entero silba. Se le va larga.": "Le ballon lui arrive et tout le stade siffle. Il le pousse trop loin.",
		"El balón es suyo. El abucheo también. La pierde.": "Le ballon est à lui. Les sifflets aussi. Il le perd.",
		"Un pito por cada toque. No controla ni la más fácil.": "Un sifflet à chaque touche. Il ne contrôle même pas la plus simple.",
		"La grada le cae encima y el control se le va largo.": "Les tribunes lui tombent dessus et son contrôle file trop loin.",



		"Uno se levanta en la tercera fila. Y no es para aplaudir.": "Un type se lève au troisième rang. Ce n'est pas pour applaudir.",
		"Ya hay quien le lleva la cuenta de los fallos desde la grada.": "Quelqu'un en tribune compte déjà ses ratés.",
		"Se oye a uno solo por encima de todos, y no dice nada bonito.": "On en entend un seul par-dessus les autres, et ce n'est pas joli.",
		"El estadio se levanta sólo de verlo con el balón.": "Le stade se lève rien qu'en le voyant au ballon.",
		"Corean su nombre. Y todavía no ha hecho nada.": "On scande son nom. Et il n'a encore rien fait.",
		"Se oye el murmullo en cuanto la toca.": "On entend la rumeur dès qu'il la touche.",
		"Hasta su propia gente le silba al oír su nombre.": "Même ses propres supporters sifflent à l'appel de son nom.",
		"Silbidos de los suyos. Hoy lo miran con lupa.": "Des sifflets des siens. Aujourd'hui, on l'épie à la loupe.",
		"Su grada no le perdona una. Cada toque, con lupa.": "Son public ne lui pardonne rien. Chaque touche, à la loupe.",
		"Ganado en su campo. Eso vale doble.": "Gagné chez eux. Ça vaut double.",
		"El derbi es tuyo.": "Le derby est à toi.",
		"Dijiste que lo ganarías, y lo ganaste.": "Tu avais dit que tu le gagnerais, et tu l'as gagné.",
		"Hablaste antes del derbi. Hoy te toca callar.": "Tu as parlé avant le derby. Aujourd'hui, tu te tais.",
		"BRAVATA": "BRAVADE",
		"{0} cumplió su palabra ante el {1}": "{0} a tenu parole face à {1}",
		"{0} se traga sus palabras ante el {1}": "{0} ravale ses paroles face à {1}",
		"Cumpliste tu palabra ante el {0}": "Tu as tenu parole face à {0}",
		"Te tragas tus palabras ante el {0}": "Tu ravales tes paroles face à {0}",
		"Se acabó. Y lo dejaste escapar.": "C'est fini. Et tu l'as laissé filer.",


		"Desde tu campo. Todo el césped por delante.": "Depuis ton camp. Toute la pelouse devant toi.",
		"Balón tuyo en tu mitad. Ahora hay que cruzarla entera.": "Ballon à toi, dans ta moitié. Maintenant il faut la traverser entière.",
		"Se la das y sigues. Así se sale de la presión.": "Tu la donnes et tu suis. C'est comme ça qu'on sort du pressing.",
		"Un toque y a correr. La presión se queda atrás.": "Une touche et tu cours. Le pressing reste derrière.",
		"Se la das a {0}, que ya sabía que venía.": "Tu la donnes à {0}, qui savait qu'elle arrivait.",
		"{0} y tú, de memoria. Ni hizo falta mirar.": "{0} et toi, par cœur. Pas besoin de regarder.",
		"Medio campo cruzado sin un susto.": "Moitié de terrain traversée sans frayeur.",
		"Ya estás en su mitad. Y con el balón.": "Tu es déjà dans leur moitié. Et avec le ballon.",
		"Se repliegan. Te dejaron llegar, no entrar.": "Ils reculent. Ils t'ont laissé arriver, pas entrer.",
		"Cuarenta y cinco segundos de toque. Y nada que contar.": "Quarante-cinq secondes de passes. Et rien à raconter.",
		"Demasiado solo, demasiado tiempo. Te la quitaron.": "Trop seul, trop longtemps. Ils te l'ont prise.",
		"Se enamoró del balón. Y lo pagó.": "Il est tombé amoureux du ballon. Et il l'a payé.",
		"Te bajan en tu campo. Falta, y a empezar de nuevo.": "Ils te fauchent dans ton camp. Faute, et on recommence.",
		"Salió de tu área y acabó en la suya. La jugada es tuya.": "Sortie de ta surface, finie dans la leur. L'action est à toi.",
		"Tú la sacaste, él la metió. Así se construye.": "Tu l'as sortie, il l'a mise. C'est comme ça qu'on construit.",

		"Robo en tu campo. ¡A la contra!": "Récupéré dans ton camp. En contre !",
		"La recuperas en tu mitad. Ahora, rápido.": "Tu la récupères dans ta moitié. Maintenant, vite.",
		"Están todos arriba. Hay campo para correr.": "Ils sont tous montés. Il y a de l'espace pour courir.",
		"Se volcaron buscando el gol. Su espalda es tuya.": "Ils se sont jetés à l'attaque pour marquer. Leur dos est à toi.",
		"Con uno menos, a la contra. Es lo que toca.": "À dix, on joue en contre. C'est ce qu'il faut.",
		"Diez contra once: se defiende y se sale rápido.": "Dix contre onze : on défend et on sort vite.",
		"Se la das y arrancas. Cada segundo cuenta.": "Tu la donnes et tu pars. Chaque seconde compte.",
		"Pase y a correr. Que no les dé tiempo a volver.": "Passe et cours. Ne leur laisse pas le temps de revenir.",
		"Tardaste. Ya volvieron todos.": "Trop lent. Ils sont tous revenus.",
		"La contra se enfrió. Ya están ordenados atrás.": "Le contre s'est refroidi. Ils sont en place derrière.",
		"Falta táctica. Te cortan la contra.": "Faute tactique. Ils cassent le contre.",
		"Contra de manual. De tu campo a la red.": "Contre parfait. De ton camp jusqu'au filet.",
		"Tú la llevaste, él la metió. Contra perfecta.": "Tu l'as portée, il l'a mise. Contre parfait.",
		"Juegan con diez. Busca al que está libre.": "Ils jouent à dix. Trouve l'homme libre.",
		"Tres contra dos. Uno de los tuyos está solo.": "Trois contre deux. Un des tiens est seul.",

		"Contragolpe": "Contre-attaque",
		"El hombre de más": "L'homme en plus",
		"Te la quitaron en tu área. Ese regalo no se devuelve.": "Ils te l'ont prise dans ta surface. Ce cadeau-là ne se rend pas.",
		"Perdida en tu área, gol en tu portería. Así de corto.": "Perdue dans ta surface, but dans tes filets. Aussi court que ça.",
		"Te la roban ahí mismo y tu portero te salva la cara.": "Ils te la volent là même et ton gardien te sauve la face.",
		"Se la quitaron en tu área y la tiraron fuera. Hoy sí; mañana, no.": "Ils te l'ont prise dans ta surface et l'ont mise dehors. Aujourd'hui oui ; demain, non.",
		"Desde el portero. Corta, y sin regalar.": "Depuis le gardien. Court, et sans rien offrir.",
		"Le cortan el primer pase. En tu área. Malo.": "Ils coupent la première passe. Dans ta surface. Mauvais.",
		"Saque de meta. Tu portero tiene el balón y tú, la decisión.": "Coup de pied de but. Ton gardien a le ballon, et toi, la décision.",
		"Te vienen a buscar arriba. El portero no puede pensárselo.": "Ils viennent te chercher haut. Le gardien ne peut pas hésiter.",
		"Presión alta al saque. Corto es un riesgo; largo, una moneda al aire.": "Pressing haut sur la relance. Court, c'est un risque ; long, pile ou face.",
		"En corto, a los pies. Salida limpia desde atrás.": "Court, dans les pieds. Une relance propre depuis l'arrière.",
		"Saque corto y balón dominado. Así empieza una jugada, no un despeje.": "Relance courte et ballon maîtrisé. Ainsi commence une action, pas un dégagement.",
		"La revienta y la baja un compañero. Medio campo de un golpe.": "Il l'envoie loin et un coéquipier la fait redescendre. Un demi-terrain d'un coup.",
		"Largo y con destinatario. La gana tu jugador y sigue el juego.": "Long, et avec un destinataire. Ton joueur la gagne et le jeu continue.",
		"Tu portero te busca. Ahora es tuya, con todo el campo por delante.": "Ton gardien te cherche. Elle est à toi maintenant, avec tout le terrain devant.",
		"Del guante a tus pies. A partir de aquí, la jugada es tuya.": "Du gant à tes pieds. À partir d'ici, l'action est à toi.",
		"La reventó y la ganaron ellos. Saque largo, balón perdido.": "Il l'a envoyée loin et ce sont eux qui l'ont gagnée. Relance longue, ballon perdu.",
		"Saque largo a ninguna parte: cabeza rival y a defender.": "Relance longue vers nulle part : tête adverse, et retour en défense.",
		"El saque no encuentra a nadie. Balón muerto y a empezar otra vez.": "La relance ne trouve personne. Ballon mort, et on recommence.",
		"Se fue sin dueño. Un saque de meta que no llegó a nadie.": "Partie sans propriétaire. Un coup de pied de but qui n'a trouvé personne.",
		"Se la quitan al primer pase, a un paso de tu portería. Regalo.": "Ils la prennent sur la première passe, à un pas de ton but. Cadeau.",
		"Del saque de meta al fondo de la red. Toda la cancha en una jugada.": "Du coup de pied de but au fond des filets. Tout le terrain en une action.",
		"Empezó en el guante de tu portero y acabó en gol. Así se sale.": "Ça a commencé dans le gant de ton gardien et fini en but. Voilà comment on relance.",
		"De tu portero a la red sin pasar por ti. Lo viste de cerca.": "De ton gardien aux filets sans passer par toi. Tu l'as vu de près.",
		"Gol de la salida de meta. Tú no la tocaste, pero la viste nacer.": "But sur la relance du gardien. Tu ne l'as pas touchée, mais tu l'as vue naître.",
		"Salió de tu portero y la acabaste tú. Cien metros de jugada.": "Partie de ton gardien, et c'est toi qui l'as finie. Cent mètres d'action.",
		"Saque de meta, campo cruzado y gol tuyo. De área a área.": "Coup de pied de but, terrain traversé et but pour toi. De surface à surface.",
		"Saque de banda en corto, a tus pies. Ahora decides tú.": "Touche jouée court, dans tes pieds. À toi de décider.",
		"Te la saca el lateral y la jugada sigue. Balón cuidado.": "Le latéral joue la touche et l'action continue. Ballon conservé.",
		"Te la saca al pecho. Bájala y a jugar.": "Touche sur ta poitrine. Amortis et joue.",
		"Saque de banda, control de pecho y la jugada viva.": "Touche, contrôle de la poitrine et l'action reste vivante.",
		"La colgaron con las manos y la metiste con la cabeza.": "Ils l'ont lancée à la main et tu l'as mise de la tête.",
		"Saque de banda al área y cabezazo a la red. De pizarra.": "Longue touche dans la surface et tête au fond. Comme au tableau noir.",
		"La cuelgan desde la banda y la despejan ellos. A por la siguiente.": "Lancée depuis la ligne de touche, et ils dégagent. Au suivant.",
		"Saque largo al área y cabeza rival. Esta vez no.": "Longue touche dans la surface et tête adverse. Pas cette fois.",
		"Cabezazo tras el saque de banda y el portero lo saca.": "Tête sur la touche et le gardien la sort.",
		"Saque largo, remate de cabeza y una parada de las buenas.": "Longue touche, tête et un arrêt de grande classe.",
		"Saque de banda al área, cabezazo y fuera. Faltó dirección.": "Longue touche dans la surface, tête et à côté. Il manquait la direction.",
		"La peinas tras el saque largo y se marcha. Cerca.": "Tu la prolonges sur la longue touche et elle s'en va. Pas loin.",
		"SELECCION": "SELECTION",
		"LIBRO DE RECORDS": "LIVRE DES RECORDS",
		"Campeón del Mundo": "Champion du monde",
		"Bota de Oro del Mundial": "Soulier du Mondial",
		"Campeón de Champions": "Vainqueur de la Coupe Elite",
		"Campeón de Europa League": "Vainqueur de la Coupe Europa",
		"Campeón del Mundo de Clubes": "Vainqueur du Mondial des clubs",
		"Campeón continental": "Champion continental",
		"Campeón de Liga": "Vainqueur du championnat",
		"Campeón de Copa": "Vainqueur de la Coupe",
		"Ascenso": "Montée",
		"Mejor Jugador de la Liga": "Meilleur joueur du championnat",
		"Pichichi de la Liga": "Meilleur buteur du championnat",
		"Máximo Asistente de la Liga": "Meilleur passeur du championnat",
		"Mejor de la Champions": "Meilleur joueur de la Coupe Elite",
		"Bota de la Champions": "Meilleur buteur de la Coupe Elite",
		"Máximo Asistente de la Champions": "Meilleur passeur de la Coupe Elite",
		"Mejor de la Europa League": "Meilleur joueur de la Coupe Europa",
		"Bota de la Europa League": "Meilleur buteur de la Coupe Europa",
		"Máximo Asistente de la Europa League": "Meilleur passeur de la Coupe Europa",
		"Campeón de Conference": "Vainqueur de la Coupe Challenge",
		"Mejor de la Conference": "Meilleur joueur de la Coupe Challenge",
		"Bota de la Conference": "Meilleur buteur de la Coupe Challenge",
		"Máximo Asistente de la Conference": "Meilleur passeur de la Coupe Challenge",
		"Mejor de la Copa": "Meilleur joueur de la Coupe",
		"Bota de la Copa": "Meilleur buteur de la Coupe",
		"Máximo Asistente de la Copa": "Meilleur passeur de la Coupe",
		"Mejor del Mundial de Clubes": "Meilleur joueur du Mondial des clubs",
		"Bota del Mundial de Clubes": "Meilleur buteur du Mondial des clubs",
		"Máximo Asistente del Mundial de Clubes": "Meilleur passeur du Mondial des clubs",
		"Jugador del Partido": "Homme du match",
		"Jugador del Mes": "Joueur du mois",
		"Bota de Oro": "Meilleur buteur du championnat",
		"MVP de la temporada": "MVP de la saison",
		"Bota (Mundial)": "Soulier (Mondial)",
		"Mundial de Clubes": "Mondial des clubs",
		"Continental (selección)": "Continental (sél.)",
		"Liga": "Championnat",
		"Copa": "Coupe",
		"Mejor (Liga)": "Meilleur (Champ.)",
		"Pichichi (Liga)": "Soulier (Champ.)",
		"Asist. (Liga)": "Passes (Champ.)",
		"Mejor (Champions)": "Meilleur (Coupe Elite)",
		"Bota (Champions)": "Soulier (Coupe Elite)",
		"Asist. (Champions)": "Passes (Coupe Elite)",
		"Mejor (Europa)": "Meilleur (Coupe Europa)",
		"Bota (Europa)": "Soulier (Coupe Europa)",
		"Asist. (Europa)": "Passes (Coupe Europa)",
		"Mejor (Conference)": "Meilleur (Coupe Challenge)",
		"Bota (Conference)": "Soulier (Coupe Challenge)",
		"Asist. (Conference)": "Passes (Coupe Challenge)",
		"Mejor (Copa)": "Meilleur (Coupe)",
		"Bota (Copa)": "Soulier (Coupe)",
		"Asist. (Copa)": "Passes (Coupe)",
		"Mejor (Mundialito)": "Meilleur (Mondial des clubs)",
		"Bota (Mundialito)": "Soulier (Mondial des clubs)",
		"Asist. (Mundialito)": "Passes (Mondial des clubs)",
		"MVP": "MVP",
		"PAUSA": "PAUSE",
		"REANUDAR": "REPRENDRE",
		"REINICIAR": "RECOMMENCER",
		"OTRO PARTIDO": "REJOUER",
		"Toca para saltar": "Touche pour passer",
		"Gira la vista · suelta para volver a apuntar":
			"Tourne la vue · relâche pour viser à nouveau",
		"Arrastra hacia atrás para apuntar": "Tire vers l'arrière pour viser",
		"CABEZAZO · arrastra hacia atrás para apuntar": "TETE · tire vers l'arrière pour viser",
		"Toca el balón · arrastra para girar": "Touche le ballon · tire pour tourner",
		"CENTRO · otro dedo vuelve al tiro": "CENTRE · un autre doigt repasse en TIR",
		"CENTRO · toca el balón": "CENTRE · touche le ballon",
		"modoTIRO": "TIR",
		"modoCENTRO": "CENTRE",
		"modoREGATE": "DRIBBLE",


		"modoCORRER": "COURSE",

		"modoDESPEJE": "DEGAGEMENT",

		"modoVOLEA": "VOLEE",
		"modoCABEZAZO": "TETE",
		"modoCHILENA": "RETOURNEE",



		"vistaARCO": "BUT",
		"vistaCOMPAÑEROS": "COEQUIPIERS",
		"Toca para continuar": "Touche pour continuer",


		"Arrastra para seguir": "Glisse pour continuer",
		"hudNOTA": "NOTE",
		"notaGOL": "BUT",
		"notaATAJADA": "ARRETEE",
		"notaPALO": "POTEAU",
		"notaFUERA": "HORS CADRE",
		"notaBLOQUEADO": "CONTRE",
		"notaDESPEJE": "DEGAGEMENT",
		"notaFUERA DE JUEGO": "HORS-JEU",
		"notaBALÓN PERDIDO": "BALLON PERDU",
		"notaSIN CONTACTO": "RATE",
		"notaEN PROPIA": "C.S.C.",
		"notaREGATE": "DRIBBLE",

		"notaROBO": "INTERCEPTION",
		"notaDESBORDADO": "DEBORDE",
		"notaPENAL": "PENALTY",
		"notaFALTA": "FAUTE",
		"notaPASE": "PASSE",
		"notaPASE CLAVE": "PASSE CLE",
		"notaASISTENCIA": "PASSE DECISIVE",




		"notaLA ATRAPA EL PORTERO": "LE GARDIEN LA CAPTE",



		"notaSE TE FUE FUERA": "SORTI EN TOUCHE",



		"notaFALLOS SEGUIDOS": "RATES EN SERIE",
		"notaNADA": "RIEN",
		"EJERCICIO {0} DE {1}": "EXERCICE {0} SUR {1}",
		"META:": "OBJECTIF :",
		"EMPEZAR": "COMMENCER",
		"SIGUIENTE": "SUIVANT",
		"TERMINAR": "TERMINER",
		"LA ACADEMIA": "L'ACADEMIE",
		"{0} / {1} ESTRELLAS": "{0} / {1} ETOILES",
		"Cinco ejercicios para aprender a jugar."
		+ " Cuantas más estrellas saques, mejores ofertas de club recibirás.":
			"Cinq exercices pour apprendre à jouer. Plus tu gagnes"
			+ " d'étoiles, meilleures seront les offres de club que tu recevras.",
		"JUGAR LA ACADEMIA": "JOUER L'ACADEMIE",
		"ÚLTIMOS 15 MINUTOS": "15 DERNIERES MINUTES",
		"TOCA PARA SEGUIR": "APPUIE POUR CONTINUER",
		"SALTAR TUTORIAL": "PASSER LE TUTORIEL",
		"Estos clubes se fijaron en ti. Elige tu oferta:":
			"Ces clubs t'ont repéré. Choisis ton offre :",
		"ELEGIR YO MISMO": "CHOISIR MOI-MEME",
		"FICHAR": "SIGNER",
		"LA OFERTA DEL OJEADOR": "L'OFFRE DE L'OBSERVATEUR",
		"Boletín perfecto: mejor sueldo y rol, y +2 puntos de habilidad.":
			"Bulletin parfait : meilleur salaire et meilleur rôle, plus 2 points de compétence.",
		"Tu boletín mejora el sueldo y el rol de estas ofertas.":
			"Ton bulletin améliore le salaire et le rôle de ces offres.",
		"Tu boletín mejora el sueldo de estas ofertas.":
			"Ton bulletin améliore le salaire de ces offres.",
		"TE FICHAN COMO: {0}": "TON ROLE : {0}",
		"EMPEZARÍAS: {0}": "TU DEMARRES : {0}",
		"MUÉVETE": "BOUGE-TOI",
		"PÉGALE": "FRAPPE FORT",
		"ENCARA": "AFFRONTE-LE",
		"SIRVE AL ÁREA": "SERS LA SURFACE",



		"Apoya el dedo dentro del círculo: ahí nace todo. Sácalo del círculo y corres hacia el lado contrario al que jalas. Suelta y paras en seco. Lleva el balón hasta el disco rojo: al pisarlo se apaga y enciende el siguiente, siempre al otro lado. Conducir es elegir a dónde, no correr de frente.": "Pose le doigt dans le cercle : tout part de là. Sors-le du cercle et tu cours dans le sens opposé à ta traction. Lâche et tu t'arrêtes net. Emmène le ballon jusqu'au disque rouge : quand tu marches dessus il s'éteint et allume le suivant, toujours de l'autre côté. Conduire, c'est choisir où aller, pas courir tout droit.",
		"Pisa las 4 zonas rojas, en orden.": "Marche sur les 4 zones rouges, dans l'ordre.",
		"Nadie te la quita y no hay reloj. Las estrellas son para quien las encadena rápido.": "Personne ne te prend le ballon et il n'y a pas de chrono. Les étoiles sont pour qui les enchaîne vite.",
		"Jala hacia atrás y sales corriendo hacia el disco.": "Tire vers l'arrière et tu pars en courant vers le disque.",
		"Dos tiros de práctica: el primero a puerta vacía, el segundo ya con portero. Después, 2 goles en 4 intentos.": "Deux tirs d'entraînement : le premier sans gardien, le deuxième avec. Ensuite, 2 buts en 4 tentatives.",
		"Los dos primeros no puntúan. En los otros, cuantos menos intentos gastes, más estrellas.": "Les deux premiers ne comptent pas. Sur les autres, moins tu utilises de tentatives, plus tu gagnes d'étoiles.",
		"Las cuatro zonas": "Les quatre zones",
		"Tiro a puerta": "Tir au but",
		"Jala hacia atrás, como una resortera: la guía apunta hacia"
		+ " adelante. Al soltar, toca el balón — y dónde lo tocas manda."
		+ " La costura marca el centro: ahí sale tenso. Cuanto más abajo"
		+ " de ella, más lo elevas, hasta la cuchara. Y cuanto más al"
		+ " borde, menos potencia: el pepinazo va al centro. Con dos dedos"
		+ " giras la vista y apuntas desde otro ángulo.":
			"Tire vers l'arrière comme une fronde : la ligne de visée"
			+ " pointe vers l'avant. En relâchant, touche le ballon — et l'endroit où"
			+ " tu le touches est décisif. La couture marque le centre : frappe là et"
			+ " il part tendu. Plus tu descends, plus tu le lèves, jusqu'au lob. Et"
			+ " plus tu vas vers le bord, moins il y a de puissance : le missile part"
			+ " au centre. Avec deux doigts, tu tournes la vue pour viser sous un"
			+ " autre angle.",
		"Cuantos menos intentos gastes, más estrellas.":
			"Moins tu utilises d'essais, plus tu gagnes d'étoiles.",
		"Rivales encima y el campo por delante: conduce y CRUZA al campo rival — hasta la raya encendida no se tira, se regatea, y cada tramo que avanzas te sale gente nueva al paso. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "Des rivaux sur toi et le terrain devant : conduis et FRANCHIS le camp adverse — jusqu'à la ligne allumée on ne tire pas, on dribble, et chaque portion gagnée fait surgir de nouveaux joueurs. Ensuite, le un contre un : tire tout de suite, ou conduis-le et reviens au cercle pour t'arrêter net et viser calmement.",
		"Primero cruza la media cancha, hasta la raya encendida. Después, el mano a mano: 1 gol en 3 intentos.": "D'abord franchis la moitié de terrain, jusqu'à la ligne allumée. Ensuite, le un contre un : 1 but en 3 tentatives.",
		"La salida es un ensayo y no puntúa. Cuantos menos intentos"
		+ " gastes en el mano a mano, más estrellas.":
			"La sortie est un entraînement et ne compte pas. Moins tu"
			+ " utilises d'essais dans le face-à-face, plus tu gagnes d'étoiles.",
		"Marca 1 gol en 3 intentos.": "Marque 1 but en 3 essais.",



		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, dos PASES — dentro del círculo pasas —: el cambio de banda, buscando al compañero libre en la otra punta, y el relevo. El relevo es la regla más rara del juego: si el pase le llega a un compañero fuera del área, pasas a jugar con él; si cae dentro del área no hay control que valga y remata de primera.": "Ce sont des CENTRES : le ballon est envoyé dans la surface. Un corner naît déjà en CENTRE ; l'indicateur en haut à droite le dit. Pour passer de CENTRE (en cloche) à TIR (à ras de terre), touche avec un autre doigt pendant que tu vises, ou touche cet indicateur. Cherche la tête d'un coéquipier, pas le but. Et pour finir, deux PASSES — dans le cercle tu fais la passe — : le changement d'aile, en cherchant l'homme libre à l'opposé, et le relais. Le relais est la règle la plus étrange du jeu : si la passe arrive à un coéquipier hors de la surface, tu continues à jouer avec lui ; si elle tombe dans la surface, aucun contrôle n'est possible et il frappe en première intention.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve los dos pases.": "Marque 1 but en 6 tentatives : 3 corners et 3 centres. Et sers les deux passes.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. Los dos pases son ensayo y no puntúan.": "Le but peut tomber sur n'importe lequel des six. Plus c'est tôt, plus il y a d'étoiles. Les deux passes sont un essai et ne comptent pas.",
		"El relevo": "Le relais",
		"Dentro del círculo pasas · al de fuera del área lo controlas tú": "Dans le cercle tu fais la passe · celui hors de la surface devient le tien",
		"La barrera tapa el camino raso: elévalo por encima tocando el"
		+ " balón abajo. El costado lo curva, si te atreves. Y el examen"
		+ " final: el penal. Respira. Tú eliges la esquina.":
			"Le mur bloque le chemin rasant : lève-le par-dessus en"
			+ " touchant le ballon en bas. Le côté le fait courber, si tu oses. Et"
			+ " l'examen final : le penalty. Respire. Tu choisis le coin.",
		"Libre: 1 gol en 3 intentos · Penal: 1 en 2.":
			"Coup franc : 1 but en 3 essais · Penalty : 1 sur 2.",
		"SE ACABARON LOS INTENTOS": "PLUS D'ESSAIS",
		"TE LA QUITÓ EL PORTERO": "LE GARDIEN TE L'A PRIS",
		"EJERCICIO {0} TERMINADO": "{0} TERMINE",
		"SIN ESTRELLAS": "AUCUNE ETOILE",
		"REPETIR {0}": "REPETER {0}",
		"VER MIS OFERTAS": "VOIR MES OFFRES",
		"Con ellas se decide qué clubes te ofrecen contrato."
		+ " Todo esto se entrena en Práctica cuando quieras.":
			"Elles décident quels clubs t'offrent un contrat. Tout ça"
			+ " s'entraîne en Entraînement quand tu veux.",
		"Unos diez minutos. Puedes salirte cuando quieras.":
			"Environ dix minutes. Tu peux quitter quand tu veux.",
		"SALTAR LA ACADEMIA": "PASSER L'ACADEMIE",
		"Eligiendo tu club a mano pierdes el premio del"
		+ " boletín.":
			"Choisir ton club toi-même te fait perdre le bonus du"
			+ " bulletin.",
		"< MENÚ": "< MENU",
		"TERMINAR Y VER OFERTAS": "TERMINER · VOIR LES OFFRES",
		"EMPEZAR LA ACADEMIA DE CERO": "RECOMMENCER L'ACADEMIE",
		"¿SEGURO? TOCA OTRA VEZ": "SUR ? TOUCHE ENCORE",
		"PASO 1 DE 3 · QUIÉN ERES": "ETAPE 1 SUR 3 · QUI TU ES",
		"PASO 3 DE 3 · DÓNDE EMPIEZAS": "ETAPE 3 SUR 3 · OU TU COMMENCES",
		"TUS CUALIDADES EN ESTE EJERCICIO": "TES QUALITES DANS CET EXERCICE",
		"TOCA PARA JUGAR": "TOUCHE POUR JOUER",
		"TOCA PARA EMPEZAR": "TOUCHE POUR COMMENCER",
		"{0}: SIN ESTRELLAS": "{0} : AUCUNE ETOILE",



		"Apoya el dedo dentro de tu círculo.":
			"Pose le doigt dans ton cercle.",
		"Saca el dedo del círculo: corres al lado contrario.":
			"Sors du cercle : tu cours du côté opposé.",
		"Suelta y paras en seco.":
			"Lâche et tu t'arrêtes net.",
		"Dentro del círculo apuntas: la guía crece.":
			"Dans le cercle tu vises : le guide grandit.",
		"Sacas el dedo del círculo y regateas, sin soltar.":
			"Sors du cercle et tu dribbles, sans lâcher.",
		"Vuelves a entrar y paras en seco, apuntando.":
			"Reviens dedans et tu t'arrêtes net, en visant.",
		"Sueltas dentro y le pegas.":
			"Lâche dedans et tu frappes.",
		"Toca el pasto fuera de tu círculo y giras la vista.":
			"Touche la pelouse hors de ton cercle et la vue pivote.",
		"Otro toque y la vista vuelve.":
			"Un autre appui et la vue revient.",
		"Fuera del círculo conduces: cruza la raya.":
			"Hors du cercle tu conduis : franchis la ligne.",
		"Apunta al área y aguanta el dedo.":
			"Vise la surface et garde le doigt.",
		"Con otro dedo cambias entre CENTRO y TIRO.":
			"Un autre doigt change entre CENTRE et TIR.",

		"Empuja este stick y corres hacia el disco.":
			"Pousse ce stick et tu cours vers le disque.",
		"Empuja este stick y conduces: cruza la raya.":
			"Pousse ce stick et tu conduis : franchis la ligne.",
		"Empuja este stick y conduces.":
			"Pousse ce stick et tu conduis.",
		"Jala este stick hacia atrás y apuntas.":
			"Tire ce stick en arrière et tu vises.",
		"Sueltas y le pegas.":
			"Lâche et tu frappes.",
		"Con este botón cambias entre CENTRO y TIRO.":
			"Ce bouton change entre CENTRE et TIR.",
		"Empuja este stick y avanza hacia el arco.":
			"Pousse ce stick et file vers le but.",
		"Jala este stick y pásala a un compañero.":
			"Tire ce stick et passe à un coéquipier.",
		"Suelta y la cuelgas.":
			"Lâche et tu la centres.",
		"Jala hacia atrás y suelta para pegarle.":
			"Tire vers l'arrière et relâche pour frapper.",
		"Jala hacia atrás y corre: cruza la raya de la media cancha.": "Tire vers l'arrière et cours : franchis la ligne médiane.",
		"Cuélgala al área. Con otro dedo cambias entre CENTRO y TIRO.":
			"Envoie-le dans la surface. Un autre doigt change entre CENTRE et TIR.",
		"Jala hacia atrás para pegarle a la falta.":
			"Tire vers l'arrière pour frapper le coup franc.",
		"GUÍA {0}/{1}": "GUIDE {0}/{1}",
		"SALTAR": "PASSER",
		"LISTO": "COMPRIS",
		"TIRO o CENTRO": "TIR ou CENTRE",
		"Este indicador dice cómo va a salir el balón. Toca con OTRO dedo"
		+ " mientras apuntas —o toca este chip— para cambiar entre TIRO (raso)"
		+ " y CENTRO (colgado). Los córners empiezan en CENTRO.":
			"Cet indicateur montre comment le ballon va sortir. Touche"
			+ " avec UN AUTRE doigt pendant que tu vises —ou touche cette pastille—"
			+ " pour passer entre TIR (rasant) et CENTRE (en cloche). Les corners"
			+ " commencent en CENTRE.",
		"ESTA ES TU CARRERA": "VOICI TA CARRIERE",
		"Bienvenido. Aquí arriba estás tú: tu media, tu energía y tu"
		+ " dinero, en todas las pantallas.":
			"Bienvenue. Ici en haut, c'est toi : ta note, ton énergie et"
			+ " ton argent, sur tous les écrans.",
		"TU PARTIDO": "TON MATCH",
		"El partido de hoy sale de este botón. Y el campo del fondo es"
		+ " para entrenar cuando quieras.":
			"Le match du jour part de ce bouton. Et le terrain en"
			+ " arrière-plan sert à t'entraîner quand tu veux.",
		"Estás aquí: tu partido y lo que reclama tu atención esta"
		+ " semana.":
			"Tu es ici : ton match et ce qui réclame ton attention"
			+ " cette semaine.",
		"Tus habilidades, tu contrato, tu gente, tu tienda y tu casa.":
			"Tes compétences, ton contrat, tes proches, ta boutique et ta maison.",
		"Lo que pasa fuera y te afecta: los torneos y el mercado de"
		+ " fichajes.":
			"Ce qui se passe dehors et qui te concerne : les"
			+ " compétitions et le mercato.",
		"Lo que ya no cambia: tu carrera, tus trofeos y las leyendas.":
			"Ce qui ne change plus : ta carrière, tes trophées et les légendes.",
		"¿REPASAR?": "UN RAPPEL ?",
		"Este botón vuelve a abrir esta guía siempre que quieras.":
			"Ce bouton rouvre ce guide quand tu veux.",
		"Jala hacia atrás para correr · déjalos atrás":
			"Tire vers l'arrière pour courir · laisse-les derrière",
		"Arrastra desde tu círculo: dentro apuntas · fuera corres":
			"Tire depuis ton cercle : dedans tu vises · dehors tu cours",
		"bandaFUERA": "SORTIE",
		"La bajas…": "Tu le contrôles…",
		"Conduciendo · vuelve al círculo para apuntar":
			"En conduite · reviens dans le cercle pour viser",
		"Conduciendo · toca tu círculo para apuntar": "En conduite · touche ton cercle pour viser",
		"Jala para tirar · sal del círculo para conducir":
			"Tire pour frapper · sors du cercle pour conduire",
		"Jala para centrar · sal del círculo para conducir":
			"Tire pour centrer · sors du cercle pour conduire",
		"Arrastra dentro para apuntar · fuera conduces": "Glisse dedans pour viser · dehors tu conduis",
		"Toca tu jugador · dentro del círculo tiras, fuera conduces":
			"Touche ton joueur · dans le cercle tu tires, dehors tu conduis",
		"¡Cabezazo de {0}!": "Tête de {0} !",
		"¡Al rechace {0}!": "{0} sur le rebond !",
		"¡Al rechace!": "Sur le rebond !",
		"¡Pase a {0}!": "Passe pour {0} !",
		"¡Cabezazo!": "Tête !",
		"¡Palomita de {0}!": "Plongeon de {0} !",
		"¡Palomita!": "Plongeon !",
		"¡Chilena de {0}!": "Retourné de {0} !",
		"¡Chilena!": "Retourné !",
		"¡El portero le saca la chilena!": "Le gardien sort le retourné !",
		"¡Vaya chilena! Y vaya atajada": "Quel retourné ! Et quel arrêt",
		"La chilena choca con la defensa": "Le retourné bute sur la défense",
		"¡Chilena bloqueada!": "Retourné contré !",
		"¡Chilena a las nubes!": "Retourné dans les nuages !",
		"La chilena se va por encima": "Le retourné passe au-dessus",
		"¡La chilena al poste!": "Le retourné sur le poteau !",
		"¡Qué chilena! Y el palo dice no": "Quel retourné ! Et le poteau dit non",
		"La chilena se va por poco": "Le retourné passe de peu à côté",
		"¡Casi! La chilena no entró": "Presque ! Le retourné n'est pas rentré",
		"¡CHILENA DE {0}! GOLAZO DE OTRO PLANETA": "RETOURNE DE {0} ! UN BUT D'UNE AUTRE PLANETE",
		"¡DE CHILENA! {0} FIRMA EL GOL DEL AÑO": "EN RETOURNE ! {0} SIGNE LE BUT DE L'ANNEE",
		"¡Pase!": "Passe !",
		"¡Pase clave!": "Passe clé !",
		"¡Pase clave a {0}!": "Passe clé pour {0} !",
		"¡Conduce {0}!": "{0} conduit !",
		"¡Conduce!": "En conduite !",
		"Segunda jugada": "Deuxième ballon",
		"¡Bloqueado!": "Contré !",
		"¡Desviado!": "Dévié !",
		"¡Desviado a córner!": "Dévié en corner !",
		"¡AUTOGOL DEL RIVAL!": "CSC DE L'ADVERSAIRE !",
		"AUTOGOL": "CSC",
		"notaDESVIADO": "DEVIE",
		"Tu tiro se iba fuera, pero el defensa la mete en su propia portería.": "Ton tir partait à côté, mais le défenseur la pousse dans son propre but.",
		"Iba fuera y rebota en el defensa hasta el fondo de su red. Autogol.": "Ça partait dehors et ça rebondit sur le défenseur jusqu'au fond de ses filets. Contre son camp.",
		"¡Le diste al camarógrafo!": "Tu as touché le cameraman !",
		"¡REVENTASTE EL CRISTAL DEL PALCO!": "TU AS EXPLOSE LA VITRE DE LA LOGE !",
		"¡Agrietaste el cristal del palco!": "Tu as fissuré la vitre de la loge !",
		"¡Le diste a TU entrenador!": "Tu as touché TON entraîneur !",
		"¡Le diste al entrenador rival!": "Tu as touché l'entraîneur adverse !",
		"¡Le diste a tu propio banquillo!": "Tu as touché ton propre banc !",
		"¡Balonazo al banquillo rival!": "Ballon en plein banc adverse !",
		" · EL MÍSTER TE SACA": " · LE COACH TE SORT",
		"EL TÉCNICO RETIRA A {0} · BALONAZO A SU PROPIO BANQUILLO": "L'ENTRAINEUR SORT {0} · BALLON SUR SON PROPRE BANC",
		"BALONAZOS A TU PROPIO BANQUILLO": "BALLONS SUR TON PROPRE BANC",
		"Le diste un balonazo a tu propia banca. Al túnel, sin discutir.": "Tu as envoyé le ballon sur ton propre banc. Au tunnel, sans discuter.",
		"Le diste un balonazo a tu propia banca. Fuera del campo, sin discutir.": "Tu as envoyé le ballon sur ton propre banc. Hors du terrain, sans discuter.",
		"Recado a la Banca": "Message au Banc",
		"Darle un balonazo a alguien del banquillo rival.": "Toucher quelqu'un du banc adverse d'un ballon.",
		"Fuego Amigo": "Tir Ami",
		"Gloria Prestada": "Gloire Prêtée",
		"Cederle un penal al compañero que iba por su hat-trick.": "Laisser un penalty au coéquipier qui visait son triplé.",
		"Nadie Toca Mi Balón": "Personne Ne Touche Mon Ballon",
		"Quedarte el penal con un compañero pidiéndotelo para su hat-trick.": "Garder le penalty avec un coéquipier qui le réclamait pour son triplé.",
		"Darle un balonazo a alguien de tu propio banquillo.": "Toucher quelqu'un de ton propre banc d'un ballon.",
		"Con el Míster No": "Pas le Coach",
		"Tumbar al entrenador rival de un balonazo.": "Faire tomber l'entraîneur adverse d'un ballon.",
		"Te Vas al Banquillo": "Tu Sors",
		"Tumbar a tu propio entrenador de un balonazo.": "Faire tomber ton propre entraîneur d'un ballon.",
		"Desalojo": "Banc Évacué",
		"Tumbar a diez personas de los banquillos a lo largo de tu carrera.":
			"Faire tomber dix personnes des bancs au cours de ta carrière.",
		"¡Le diste al recogepelotas! La prensa no te lo perdona": "Tu as touché le ramasseur de balles ! La presse ne te le pardonnera pas",
		"¡Tiraste las botellas del portero!": "Tu as renversé les bouteilles d'eau du gardien !",



		"¡LE DISTE AL ASPERSOR!": "EN PLEIN DANS L'ARROSEUR !",
		"¡LE TIRASTE LA BEBIDA A UN AFICIONADO!": "TU AS FAIT VALSER LA BOISSON D'UN SUPPORTER !",
		"¡Le diste a una paloma!": "Tu as touché un pigeon !",
		"¡Se fue a la calle!": "Il est parti dans la rue !",
		"¡Se quedan el balón!": "Ils gardent le ballon !",
		"¡Fuera de juego!": "Hors-jeu !",
		"¡GOL! (asistencia)": "BUT ! (passe décisive)",
		"¡GOOOL!": "BUUUT !",
		"Despeje del rival": "Dégagement adverse",


		"¡EN PROPIA PUERTA!": "BUT CONTRE SON CAMP !",
		"¡Se te escapó el balón!": "Le ballon t'a échappé !",
		"TE LA DEVUELVE EL PORTERO": "LE GARDIEN TE LE RENVOIE",
		"EL BALÓN VUELVE A TI": "LE BALLON REVIENT VERS TOI",
		"¡Atajada del portero!": "Arrêt du gardien !",
		"Tiro bloqueado": "Tir contré",
		"Por encima del arco": "Au-dessus",
		"¡Al poste!": "Sur le poteau !",
		"¡Al poste y fuera!": "Poteau et sortie !",
		"¡Fuera!": "A côté !",
		"¡Salió el portero!": "Le gardien est sorti !",
		"Se te fue por la línea": "Il est sorti en touche",
		"Te ganó el defensa": "Le défenseur l'a emporté",


		"Te resbalaste en el charco": "Tu as glissé dans la flaque",
		"¡Gran regate!": "Beau dribble !",
		"La cobra {0}": "{0} la tire",
		"¡El portero se la ataja a {0}!": "Le gardien arrête la frappe de {0} !",
		"¡{0} la estrella en el palo!": "{0} trouve le poteau !",
		"¡La barrera se lo tapa a {0}!": "Le mur détourne la frappe de {0} !",
		"Lo saca {0}…": "{0} le tire…",
		"Arrastra para moverte · toca el balón y remata": "Glisse pour te déplacer · touche le ballon pour frapper",
		"¡{0} la manda fuera!": "{0} l'envoie à côté !",
		"¡Gol de {0}!": "But de {0} !",
		"{0} NO FALLA DESDE LOS ONCE METROS": "{0} NE TREMBLE PAS SUR PENALTY",
		"{0} FALLA DESDE LOS ONCE METROS": "{0} MANQUE SON PENALTY",
		"LA FALTA DE {0} SE PIERDE SIN PELIGRO": "LE COUP FRANC DE {0} SE PERD",
		"{0} LA CLAVA DE FALTA DIRECTA": "{0} MARQUE SUR COUP FRANC",
		"{0} REMATA EL CÓRNER A LA RED": "{0} CONCLUT LE CORNER",
		"AHORA MANDA TU EQUIPO EL {0}": "TON EQUIPE PASSE DEVANT, {0}",
		"TU EQUIPO EMPATA EL PARTIDO, {0}": "TON EQUIPE EGALISE, {0}",
		"TU EQUIPO RECORTA, {0}": "TON EQUIPE REDUIT L'ECART, {0}",
		"SE ADELANTA EL RIVAL, {0}": "L'ADVERSAIRE PASSE DEVANT, {0}",
		"EL RIVAL EMPATA, {0}": "L'ADVERSAIRE EGALISE, {0}",
		"EL RIVAL RECORTA, {0}": "L'ADVERSAIRE REDUIT L'ECART, {0}",
		"ENTRA {0}": "{0} ENTRE",
		"SALE {0}": "{0} SORT",
		"EL TÉCNICO RETIRA A {0} · ACTUACIÓN DEFICIENTE": "LE COACH SORT {0} · MATCH INSUFFISANT",
		"{0} SALE LESIONADO · NO PUEDE CONTINUAR": "{0} SORT BLESSE · NE PEUT PAS CONTINUER",
		"LESIONADO EN EL {0}'": "BLESSE A LA {0}E MINUTE",
		"{0} PIDE EL CAMBIO": "{0} DEMANDE A SORTIR",

		"{0} PIDE EL CAMBIO · NO LE QUEDA NADA": "{0} DEMANDE A SORTIR · IL N'EN PEUT PLUS",
		"{0} PIDE EL CAMBIO · EL BANQUILLO NO LO ENTIENDE":
			"{0} DEMANDE A SORTIR · LE BANC NE COMPREND PAS",

		"{0} PIDE EL CAMBIO AL BANQUILLO": "{0} FAIT SIGNE AU BANC POUR SORTIR",
		"EL BANQUILLO TE DICE QUE AGUANTES: YA NO DA TIEMPO":
			"LE BANC TE DIT DE TENIR : IL N'Y A PLUS LE TEMPS",

		"PEDIR CAMBIO": "SORTIR",
		"CAMBIO PEDIDO": "DEMANDE",


		"VAS AL LÍMITE: MEJOR NO FORZAR": "TU ES A LA LIMITE : MIEUX VAUT NE PAS FORCER",
		"EL TÉCNICO RETIRA A {0} · OVACIÓN DEL ESTADIO":
			"LE COACH SORT {0} · OVATION DU STADE",
		"{0} SE VA ENTRE APLAUSOS · EL PARTIDO ESTÁ HECHO":
			"{0} SORT SOUS LES APPLAUDISSEMENTS · LE MATCH EST PLIE",
		"EL BANQUILLO PREPARA TU CAMBIO: EL PARTIDO ESTÁ HECHO":
			"LE BANC PREPARE TON REMPLACEMENT : LE MATCH EST PLIE",



		"EL PARTIDO ESTÁ EN JUEGO: TE VA A DECIR QUE AGUANTES":
			"LE MATCH EST ENCORE OUVERT : IL VA TE DIRE DE TENIR",
		"YA TE DIJO QUE NO: INSISTIR SALE CARO": "IL A DEJA DIT NON : INSISTER COUTERA CHER",
		"EL MÍSTER TE DICE QUE AGUANTES: TE NECESITA AHÍ":
			"LE COACH TE DIT DE TENIR : IL A BESOIN DE TOI",
		"EL BANQUILLO DICE QUE AGUANTES": "LE COACH A DIT DE TENIR",
		"SALIDA GESTIONADA": "SORTIE MAITRISEE",
		"PEDISTE EL CAMBIO": "TU AS DEMANDE A SORTIR",
		"{0} MIN Y {1} % DE ENERGÍA QUE NO GASTASTE":
			"{0} MIN ET {1} % D'ENERGIE NON DEPENSEE",



		"YA NO DA TIEMPO: IBAS A SALIR IGUAL":
			"PLUS LE TEMPS : TU ALLAIS SORTIR DE TOUTE MANIERE",
		"EL PARTIDO ESTÁ HECHO: TE LO VAN A AGRADECER":
			"LE MATCH EST PLIE : ON T'EN SERA RECONNAISSANT",
		"NO TE QUEDA NADA: EL MÍSTER LO ENTIENDE": "TU N'EN PEUX PLUS : LE COACH COMPREND",
		"QUEDA PARTIDO Y TE QUEDAN PIERNAS: ES UN DESPLANTE":
			"IL RESTE DU MATCH ET DES JAMBES : C'EST UN AFFRONT",
		"{0} PIDE EL CAMBIO Y EL BANQUILLO ASIENTE":
			"{0} DEMANDE A SORTIR ET LE BANC APPROUVE",
		"FUERA DEL CAMPO": "HORS DU TERRAIN",
		"FUERA POR LESION": "SORTI SUR BLESSURE",
		"{0} SALE JUGANDO DE LA PRESIÓN": "{0} SE JOUE DU PRESSING",
		"{0} ROMPE LÍNEAS CON UN GRAN REGATE": "{0} CASSE LES LIGNES D'UN GRAND DRIBBLE",
		"{0} PIERDE EL BALÓN EN UN REGATE": "{0} PERD LE BALLON DANS UN DRIBBLE",
		"DERRIBAN A {0}: FALTA PELIGROSA": "{0} EST FAUCHE : COUP FRANC DANGEREUX",
		"DERRIBAN A {0} EN EL ÁREA: ¡PENAL!": "{0} FAUCHE DANS LA SURFACE : PENALTY !",
		"CARGAN A {0} EN LA SALIDA: FALTA": "FAUTE SUR {0} A LA RELANCE",
		"FRENAN A {0} EN LA SALIDA: FALTA": "FAUTE SUR {0} A LA RELANCE",
		"CARGAN A {0} POR LA ESPALDA: FALTA": "FAUTE DANS LE DOS DE {0}",
		"MODO TIRO": "MODE TIR",
		"MODO CENTRO": "MODE CENTRE",
		"REGATEANDO": "EN DRIBBLE",
		"CARGAN A {0} POR LA ESPALDA EN EL ÁREA: ¡PENAL!": "PENALTY : FAUTE DANS LE DOS DE {0} !",
		"¡ROMPISTE LÍNEAS!": "LIGNES CASSEES !",
		"¡FALTA! Se cobra aquí mismo": "FAUTE ! Coup franc ici même",
		"¡PENAL! Se cobra en los once metros": "PENALTY ! Tir des onze mètres",
		"{0} QUIERE COBRAR EL PENAL": "{0} VEUT TIRER LE PENALTY",
		"SE LO DAS": "TU LUI LAISSES",
		"NO SE LO DAS": "TU LE GARDES",
		"VA POR SU HAT-TRICK": "IL VISE LE TRIPLE",
		"TE QUEDAS EL PENAL Y {0} SE APARTA": "TU GARDES LE PENALTY, {0} S'ECARTE",
		"EL PENAL ES TUYO": "LE PENALTY EST A TOI",
		"SE LO DAS A {0}": "TU LE LAISSES A {0}",
		"LE CEDES EL PENAL A {0} PARA SU HAT-TRICK": "TU LAISSES LE PENALTY A {0} : TRIPLE",
		"LE CEDES EL PENAL A {0} Y NO ENTRA": "TU LAISSES LE PENALTY A {0} ET IL RATE",
		"EL EQUIPO TE DEJA EL PENAL: HAT-TRICK": "L'EQUIPE TE LAISSE LE PENALTY : TRIPLE",
		"EL EQUIPO TE DEJA EL PENAL Y LO FALLAS": "L'EQUIPE TE LAISSE LE PENALTY ET TU RATES",
		"{0} TE DA EL PENAL": "{0} TE LAISSE LE PENALTY",
		"EL PENAL ES DE {0}": "LE PENALTY EST POUR {0}",
		"LA FALTA ES DE {0}": "LE COUP FRANC EST POUR {0}",
		"SÍ {0} % · NO {1} %": "OUI {0} % · NON {1} %",
		"PÍDESELO": "DEMANDE-LE",
		"DÉJASELO": "LAISSE-LE",
		"LE PIDES EL BALÓN A {0}": "TU DEMANDES LE BALLON A {0}",
		"{0} TE DA LA FALTA": "{0} TE LAISSE LE COUP FRANC",
		"{0} SE LO QUEDA": "{0} LE GARDE",
		"{0} SE LA QUEDA": "{0} LE GARDE",
		"LE PIDES EL PENAL A {0} Y SE LO QUEDA": "TU DEMANDES LE PENALTY A {0}, IL LE GARDE",
		"LE PIDES LA FALTA A {0} Y SE LA QUEDA": "TU DEMANDES LE COUP FRANC A {0}, IL LE GARDE",
		"{0} TE DEJA EL PENAL Y RESPONDES": "{0} TE LAISSE LE PENALTY ET TU ASSURES",
		"{0} TE DEJA EL PENAL Y NO RESPONDES": "{0} TE LAISSE LE PENALTY ET TU N'ASSURES PAS",
		"{0} TE DEJA LA FALTA Y RESPONDES": "{0} TE LAISSE LE COUP FRANC ET TU ASSURES",
		"{0} TE DEJA LA FALTA Y NO RESPONDES": "{0} TE LAISSE LE COUP FRANC ET TU N'ASSURES PAS",
		"¡TANDA DE PENALES!": "SEANCE DE TIRS AU BUT !",
		"TANDA {0}-{1}": "TAB {0}-{1}",
		"TANDA {0}-{1} · TIRA TU EQUIPO...": "TAB {0}-{1} · TON EQUIPE TIRE...",
		"TANDA {0}-{1} · ¡TE TOCA A TI!": "TAB {0}-{1} · A TOI !",
		"TANDA {0}-{1} · Cobra {2}...": "TAB {0}-{1} · {2} s'avance…",
		"¡GOL! Cobras con personalidad.": "BUT ! Tu frappes avec caractère.",
		"¡FALLAS TU PENAL!": "TU RATES TON PENALTY !",
		"¡GOL!": "BUT !",
		"¡FALLA TU EQUIPO!": "TON EQUIPE RATE !",
		"TANDA {0}-{1} · TIRA EL RIVAL...": "TAB {0}-{1} · L'ADVERSAIRE TIRE...",
		"GOL DEL RIVAL": "BUT ADVERSE",
		"¡LO ATAJA TU PORTERO!": "TON GARDIEN L'ARRETE !",
		"¡AL PALO!": "SUR LE POTEAU !",
		"¡AL TRAVESAÑO!": "SUR LA BARRE !",
		"¡LA MANDA POR ENCIMA!": "AU-DESSUS !",
		"¡LA MANDA FUERA!": "A COTE !",
		"PENALES {0}-{1}": "TAB {0}-{1}",
		"¡PASAS TÚ! ({0}-{1})": "TU PASSES ! ({0}-{1})",
		"ELIMINADO EN PENALES ({0}-{1})": "ELIMINE AUX TIRS AU BUT ({0}-{1})",
		"VICTORIA": "VICTOIRE",
		"EMPATE": "MATCH NUL",
		"DERROTA": "DEFAITE",
		"Encarada por la banda": "Percée sur l'aile",
		"Disparo escorado": "Tir en angle",
		"Desde la banda": "Depuis l'aile",
		"Contra por la banda": "Contre sur l'aile",
		"Falta lateral al área": "Coup franc latéral",
		"Uno contra uno": "Un contre un",
		"Falta a {0} m": "Coup franc à {0} m",
		"Volea al bote": "Demi-volée",
		"Volea bombeada": "Volée en cloche",
		"Volea al vuelo": "Reprise de volée",
		"Volea rasa": "Volée rasante",
		"balón botando": "ballon qui rebondit",
		"llega bombeado": "arrive en cloche",
		"balón al vuelo": "ballon en l'air",
		"balón rodando": "ballon au sol",
		"línea adelantada": "ligne haute",
		"bajo presión": "sous pression",
		"con superioridad": "en supériorité",
		"Tras el regate": "Après le dribble",
		"Pared con el pivote": "Une-deux avec le pivot",
		"Ruptura al espacio": "Appel dans l'espace",
		"Cabezazo al segundo palo": "Tête au deuxième poteau",
		"Cabezazo en el primer palo": "Tête au premier poteau",
		"Palomita": "Plongeon",
		"El autobús": "Le bus garé",
		"Mano a mano franco": "Face-à-face net",
		"Falta escorada al palo corto": "Coup franc excentré, premier poteau",
		"Falta sobre la muralla": "Coup franc par-dessus le mur",
		"Falta a la escuadra": "Coup franc dans la lucarne",
		"Saque de banda a la torre": "Touche longue pour la tour",
		"RIVAL": "ADVERSAIRE",
		"RESULTADOS": "RESULTATS",
		"DOMINIO": "POSSESSION",
		"TU": "TOI",
		"TU APUESTA": "TON PARI",
		"ELLOS": "EUX",
		"FORMACIÓN": "FORMATION",
		"FUERZA": "FORCE",
		"SU PELIGRO": "LEUR DANGER",
		"FRESCO": "FRAIS",
		"EN FORMA": "EN FORME",
		"CARGADO": "FATIGUE",
		"ENERGÍA": "ENERGIE",
		"EN VIVO": "EN DIRECT",

		"1T": "1MT",
		"2T": "2MT",
		"PR": "PROL",
		"TOCA PARA AVANZAR  ▸": "TOUCHE POUR AVANCER  ▸",
		"ARRASTRA PARA LEER · TOCA PARA AVANZAR  ▸":
			"GLISSE POUR RELIRE · TOUCHE POUR AVANCER  ▸",
		"▸ VER EL GOL": "▸ REVOIR LE BUT",
		"▸ GOL": "▸ BUT",
		"¡GOLAZO! {0} LA MANDA A GUARDAR": "QUEL BUT ! {0} LA MET AU FOND",
		"GOL EN CONTRA: {0} CASTIGA EL ROBO EN TU ÁREA": "BUT ENCAISSE : {0} PUNIT LE VOL DANS TA SURFACE",
		"LA REPETICION": "LE REPLAY",
		"AL POSTE": "SUR LE POTEAU",
		"AL LARGUERO": "SUR LA BARRE",
		"REVISION VAR": "REVISION VAR",
		"COMPROBANDO EL LARGUERO": "VERIFICATION DE LA BARRE",
		"EL PIQUE, BAJO EL LARGUERO": "LE REBOND, SOUS LA BARRE",
		"TECNOLOGIA DE LINEA DE GOL": "TECHNOLOGIE DE LA LIGNE DE BUT",
		"COMPROBANDO EL POSTE": "VERIFICATION DU POTEAU",
		"EL PIQUE, FUERA DE LA RAYA": "LE REBOND, HORS DE LA LIGNE",
		"NO ES GOL": "PAS DE BUT",
		"ARRASTRA PARA GIRAR LA CÁMARA": "GLISSE POUR TOURNER LA CAMERA",
		"ARCO": "BUT",
		"ORBITA": "ORBITE",
		"TU CAMARA": "TA CAMERA",


		"repeLIBRE": "LIBRE",
		"GUARDADO": "ENREGISTRE",
		"Guardado en tus fotos": "Enregistré dans tes photos",
		"Da permiso a Fotos para guardar el video": "Autorise l'accès à Photos pour enregistrer la vidéo",
		"No se pudo guardar en tus fotos": "Impossible d'enregistrer dans tes photos",
		"Este aparato no puede guardar el video": "Cet appareil ne peut pas enregistrer la vidéo",
		"No se pudo empezar a grabar": "Impossible de démarrer l'enregistrement",
		"Se cortó la grabación": "L'enregistrement a été coupé",
		"No hay jugada que guardar": "Aucune action à enregistrer",
		"No hay nada grabado": "Rien n'a été enregistré",
		"No se pudo cerrar el video": "Impossible de finaliser la vidéo",
		"¡Mira mi gol en Football Legacy!": "Regarde mon but dans Football Legacy !",
		"Compartido": "Partagé",
		"No se pudo abrir compartir": "Impossible d'ouvrir le partage",
		"ENLACE COPIADO: PEGALO EN TU POST": "LIEN COPIE : COLLE-LE DANS TON POST",
		"Listo": "Terminé",
		"ORDEN DESDE LA BANDA: TODOS ATRÁS, SE DEFIENDE EL RESULTADO":
			"CONSIGNE DU BANC : TOUT LE MONDE DERRIERE, ON PROTEGE LE RESULTAT",
		"ORDEN DESDE LA BANDA: EQUILIBRIO, NI ATRÁS NI ARRIBA":
			"CONSIGNE DU BANC : EQUILIBRE, NI DERRIERE NI DEVANT",
		"ORDEN DESDE LA BANDA: TODOS ARRIBA, SE VA A POR EL PARTIDO":
			"CONSIGNE DU BANC : TOUT LE MONDE DEVANT, ON VA CHERCHER LE MATCH",
		"EL EQUIPO BAJA EL PISTÓN: A ADMINISTRAR PIERNAS":
			"L'EQUIPE LEVE LE PIED : ON GERE LES JAMBES",
		"EL EQUIPO VUELVE A SU RITMO NORMAL": "L'EQUIPE REVIENT A SON RYTHME NORMAL",
		"EL EQUIPO SUBE EL PISTÓN: A MORDER CADA BALÓN":
			"L'EQUIPE APPUIE SUR L'ACCELERATEUR : ON MORD CHAQUE BALLON",
		"PLANTEAMIENTO": "APPROCHE",
		"INTENSIDAD": "INTENSITE",
		"planDEFENSIVO": "DEFENSIF",
		"planBALANCEADO": "EQUILIBRE",
		"planOFENSIVO": "OFFENSIF",
		"planBAJA": "BASSE",
		"planMEDIA": "MOYENNE",
		"planALTA": "HAUTE",
		"Aguantas atrás: encajas menos, pero el balón te llega lejos del área.":
			"Tu restes bas : tu encaisses moins, mais le ballon t'arrive loin de la surface.",
		"El equipo juega parejo.": "L'équipe joue équilibré.",
		"Vas al frente: te llega más cerca del arco, pero atrás quedas expuesto.":
			"Tu pousses vers l'avant : le ballon t'arrive plus près du but, mais tu es exposé"
			+ " derrière.",
		"Dosificas: tocas menos el balón, pero terminas entero.":
			"Tu gères ton effort : tu touches moins le ballon, mais tu termines frais.",
		"Ritmo normal.": "Rythme normal.",
		"Buscas cada pelota, pero acabas fundido (y más expuesto a la lesión).":
			"Tu cherches chaque ballon, mais tu finis épuisé (et plus exposé à la blessure).",
		"SE ACABO": "C'EST FINI",
		"HASTA AQUI": "JUSQU'ICI",
		"{0} · {1} de {2}": "{0} · {1} sur {2}",
		"EL ULTIMO PITIDO": "LE DERNIER COUP DE SIFFLET",
		"EL ESTADIO EN PIE": "LE STADE DEBOUT",
		"AÑO A AÑO": "ANNEE APRES ANNEE",
		"COMO CRECISTE": "COMMENT TU AS GRANDI",
		"LA VITRINA": "LA VITRINE",
		"¿ERES LEYENDA?": "UNE LEGENDE ?",
		"LA PRENSA": "LA PRESSE",
		"LO QUE DEJAS": "CE QUE TU LAISSES",
		"GRACIAS {0}": "MERCI {0}",
		"GRACIAS": "MERCI",
		"Suena el silbato y ya no hay temporada siguiente.":
			"Le sifflet retentit et il n'y a plus de saison suivante.",
		"{0} años. El cuerpo pidió la cuenta.":
			"{0} ans. Le corps a demandé l'addition.",
		"Suena el silbato y esta vez lo eliges tú.":
			"Le sifflet retentit, et cette fois c'est toi qui choisis.",
		"Suena el silbato y esta vez no hay vuelta.":
			"Le sifflet retentit, et cette fois il n'y a pas de retour.",
		"El cuerpo pidió la cuenta antes de tiempo.":
			"Le corps a demandé l'addition avant l'heure.",
		"\"EL CUERPO LE PASO LA FACTURA\"": "\"LE CORPS LUI A PRESENTE LA FACTURE\"",
		"A los {0} años, una lesión decidió por él.":
			"A {0} ans, une blessure a décidé pour lui.",
		"Te vas cuando todavía te quedaba algo dentro.":
			"Tu pars alors qu'il te restait encore quelque chose.",
		"{0} temporadas · {1} partidos": "{0} saisons · {1} matchs",
		"Las camisetas que vestiste": "Les maillots que tu as portés",
		"DE PIE": "DEBOUT",
		"El estadio entero, en pie, coreando tu nombre.":
			"Le stade entier, debout, scande ton nom.",
		"Muchos de los que aplauden no vieron tu debut.":
			"Beaucoup de ceux qui applaudissent n'ont pas vu tes débuts.",
		"{0} veces internacional con {1}": "{0} sélections avec {1}",
		"No hay historial que enseñar.": "Il n'y a pas d'historique à montrer.",
		"TOTAL": "TOTAL",
		"LA CARRERA EN CIFRAS": "LA CARRIERE EN CHIFFRES",
		"ASIST": "PASSES",
		"De todo eso, {0} goles y {1} asistencias fueron en la elite (1ª y seleccion):"
		+ " es lo que te compara con las leyendas.":
			"Sur tout ça, {0} buts et {1} passes décisives ont été"
			+ " marqués dans l'élite (1ère division et sélection) : c'est ce qui te"
			+ " compare aux légendes.",
		"TEMP · CLUB": "SAISON · CLUB",
		"TITULOS": "TITRES",
		"T{0} {1}": "S{0} {1}",
		"Una carrera tan corta no dibuja curva.":
			"Une carrière aussi courte ne dessine pas de courbe.",
		"Lo que valias y lo que sabias, año a año":
			"Ce que tu valais et ce que tu savais, année après année",
		"VALOR": "VALEUR",
		"curvaMEDIA": "NOTE",
		"Valiste más que nunca en la temporada {0}: $ {1}":
			"Tu n'as jamais valu aussi cher qu'en saison {0} : $ {1}",
		"Tu mejor media fue {0}, y la de hoy es {1}":
			"Ta meilleure note était {0}, et aujourd'hui c'est {1}",
		"El mercado dejó de creer en ti {0} temporadas antes de que se te acabara el"
		+ " fútbol.":
			"Le marché a cessé de croire en toi {0} saisons avant que"
			+ " le football ne s'arrête.",
		"LA VITRINA VACIA": "LA VITRINE VIDE",
		"No ganaste nada, y aun así jugaste {0} temporadas.":
			"Tu n'as rien gagné, et tu as quand même joué {0} saisons.",
		"Hay carreras que no caben en una vitrina.":
			"Il y a des carrières qui ne tiennent pas dans une vitrine.",
		"{0} de equipo · {1} individuales": "{0} d'équipe · {1} individuels",
		"CON TU EQUIPO": "AVEC TON EQUIPE",
		"TUYOS Y DE NADIE MAS": "LES TIENS, RIEN QU'A TOI",
		"UNO POR UNO": "UN PAR UN",
		"COPA · {0}": "COUPE · {0}",
		"MAXIMO GOLEADOR": "MEILLEUR BUTEUR",
		"MAXIMO ASISTENTE": "MEILLEUR PASSEUR",
		"PODIO DE LA LIGA": "PODIUM DE LA LIGUE",
		"MEJOR JUGADOR": "MEILLEUR JOUEUR",
		"Tu nombre por delante de {0} leyendas del fútbol":
			"Ton nom devant {0} légendes du football",
		"Los grandes de la historia siguen todos por delante.":
			"Les grands de l'histoire sont tous encore devant.",
		"PRODUCCION HISTORICA": "PRODUCTION HISTORIQUE",
		"{0} goles y {1} asistencias en la elite":
			"{0} buts et {1} passes décisives dans l'élite",
		"Nº{0} de la historia, por delante de {1} leyendas":
			"N°{0} de l'histoire, devant {1} légendes",
		"Ninguna leyenda del fútbol se queda por detrás de ti.":
			"Aucune légende du football ne reste derrière toi.",
		"Los récords del mundo siguen donde estaban.":
			"Les records du monde sont toujours là où ils étaient.",
		"RECORD DEL MUNDO: {0}": "RECORD DU MONDE : {0}",
		"Goles en una carrera": "Buts en carrière",
		"Balones de Oro": "Titres de Joueur de l'Année",
		"Ligas ganadas": "Championnats gagnés",
		"DONDE TE VAS SIENDO LEYENDA": "OU TU DEVIENS UNE LEGENDE",
		"En ninguna parte, todavía.": "Nulle part, pour l'instant.",
		"Al top histórico de un club se entra ganando allí, siendo"
		+ " su máximo goleador o su récord de partidos, o con 10 temporadas seguidas; al"
		+ " de una liga, ganando o marcando goles en su primera división; al de tu"
		+ " selección, siendo uno de sus 5 máximos goleadores.":
			"On entre dans le top historique d'un club en y gagnant, en étant son meilleur"
			+ " buteur ou son recordman de matchs, ou avec 10 saisons d'affilée ; dans celui"
			+ " d'un championnat, en y gagnant ou en marquant des buts en première division ;"
			+ " dans celui de ta sélection, en étant l'un de ses 5 meilleurs buteurs.",
		"leyenda del club": "légende du club",
		"goleador histórico del club": "meilleur buteur du club",
		"récord de partidos del club": "recordman de matchs du club",
		"leyenda de la liga": "légende du championnat",
		"leyenda de la selección": "légende de la sélection",
		"Nº{0}": "N°{0}",
		"\"{0} GOLES Y UNA SOLA MANERA DE ENTENDER EL JUEGO\"":
			"\"{0} BUTS ET UNE SEULE FACON DE VOIR LE JEU\"",
		"Se retira uno de los grandes rematadores de su generación.":
			"L'un des grands finisseurs de sa génération raccroche les crampons.",
		"\"{0} GOLES DESPUES, EL AREA SE QUEDA VACIA\"":
			"\"{0} BUTS PLUS TARD, LA SURFACE SE VIDE\"",
		"El delantero deja el fútbol tras {0} temporadas.":
			"L'attaquant quitte le football après {0} saisons.",
		"\"NO TODO SE MIDE EN GOLES\"": "\"TOUT NE SE MESURE PAS EN BUTS\"",
		"{0} goles y {1} asistencias en {2} temporadas de oficio.":
			"{0} buts et {1} passes décisives en {2} saisons de métier.",
		"\"LA VITRINA QUE DEJA: {0} TITULOS\"": "\"LA VITRINE QU'IL LAISSE : {0} TITRES\"",
		"Pocos futbolistas se han ido con tanto ganado.":
			"Peu de footballeurs sont partis avec autant de trophées.",
		"\"SE VA CON {0} TITULOS Y NINGUNA DEUDA\"":
			"\"IL PART AVEC {0} TITRES ET AUCUNE DETTE\"",
		"Ganó lo que pudo donde le tocó jugar.":
			"Il a gagné ce qu'il a pu, là où il a joué.",
		"\"EL FUTBOL NO SIEMPRE PAGA LO QUE DEBE\"":
			"\"LE FOOTBALL NE PAIE PAS TOUJOURS SES DETTES\"",
		"Se retira sin títulos, que no es lo mismo que sin carrera.":
			"Il raccroche sans titres, ce qui n'est pas pareil que sans carrière.",
		"\"VUELVE A CASA PARA SIEMPRE\"": "\"DE RETOUR CHEZ LUI POUR TOUJOURS\"",
		"Se retira en el {0}, donde empezó todo.":
			"Il raccroche à {0}, là où tout a commencé.",
		"\"JUGO HASTA EL ULTIMO DIA QUE LE DEJARON\"":
			"\"IL A JOUE JUSQU'AU DERNIER JOUR QU'ON LUI A LAISSE\"",
		"A los {0} años, el calendario decidio por él.":
			"A {0} ans, le calendrier a décidé pour lui.",
		"\"ME VOY AHORA QUE TODAVIA SE JUGAR\"": "\"JE PARS TANT QUE JE SAIS ENCORE JOUER\"",
		"Anuncia su retirada a los {0} años, por decision propia.":
			"Il annonce sa retraite à {0} ans, de son propre choix.",
		"Te vas siendo": "Tu pars en étant",
		"{0} retira tu dorsal": "{0} retire ton numéro",
		"{0} temporadas con el mismo número a la espalda.":
			"{0} saisons avec le même numéro dans le dos.",
		"LA CAMISETA QUE SE QUEDA": "LE MAILLOT QUI RESTE",
		"{0} temporadas con él": "{0} saisons avec lui",
		"Prestigio: {0} puntos": "Prestige : {0} points",
		"El vestuario se queda vacío, pero el nombre no se borra.":
			"Le vestiaire se vide, mais le nom ne s'efface pas.",
		"Ahora ya solo queda mirar lo que hiciste.":
			"Il ne reste plus qu'à regarder ce que tu as fait.",
		"ELIGE EL CLUB DONDE ENTRA": "CHOISIS LE CLUB QU'IL REJOINT",
		"ELIGE EL CLUB DESTINO": "CHOISIS LE CLUB DESTINATION",
		"También puede ser su propio club, para cambiarlo de asiento.":
			"Ça peut aussi être son propre club, pour le changer de poste.",
		"Fichajes, cualidades, caras y escudos a tu gusto.\nSe guarda solo y vale para"
		+ " todas las carreras.":
			"Transferts, qualités, visages et écussons à ta guise.\nÇa"
			+ " s'enregistre tout seul et s'applique à toutes les carrières.",
		"EDITADO": "MODIFIE",
		"ELIGE EL ASIENTO QUE OCUPA": "CHOISIS LE POSTE QU'IL OCCUPE",
		"Quien tenga ese asiento hoy SALE del juego; el nuevo\nhereda su puesto y su"
		+ " dorsal.":
			"Qui occupe ce poste aujourd'hui SORT du jeu ;\nle nouveau"
			+ " hérite de sa position et de son numéro.",
		"ELIGE CON QUIEN SE INTERCAMBIA": "CHOISIS AVEC QUI IL ECHANGE",
		"Los dos jugadores se cambian de club; el puesto y el dorsal\nson del asiento,"
		+ " no viajan.":
			"Les deux joueurs changent de club ; la position et le"
			+ " numéro\nappartiennent au poste, ils ne voyagent pas.",
		"{0} · FUERZA {1}": "{0} · FORCE {1}",
		"SOLO SU POSICION ({0}): {1}": "MEME POSTE ({0}) : {1}",
		"editorSI": "OUI",
		"editorNO": "NON",
		"CREAR JUGADOR": "CREER UN JOUEUR",
		"EDITAR CLUB": "MODIFIER LE CLUB",
		"IDENTIDAD": "IDENTITE",
		"AL TOCAR UN CLUB SE ABRE": "TOUCHER UN CLUB OUVRE",
		"Nadie encaja aquí con el filtro puesto. Apágalo para ver el plantel completo.":
			"Personne ne correspond avec ce filtre. Désactive-le pour voir tout l'effectif.",
		"— BANCA —": "— BANC —",


		"LISTA": "LISTE",
		"— RESERVA —": "— RESERVE —",
		"QUITAR EDICIONES DEL CLUB": "ANNULER LES MODIFS DU CLUB",
		"{0}  · TU PUESTO": "{0}  · TON POSTE",
		"EDAD": "AGE",
		"POSICIÓN": "POSTE",
		"AÑOS": "ANS",
		"NACION": "NATION",
		"PUESTO": "POSTE",

		"POR": "G", "DFC": "DC", "LTI": "DG", "LTD": "DD",
		"MCD": "MDC", "MC": "MC", "MI": "MG", "MD": "MD",
		"DC": "BU", "CAM": "MOC", "MCO": "MOC", "EI": "AIG", "ED": "AID",


		"SABE JUGAR DE": "PEUT AUSSI JOUER",




		"AL MENOS UN PUESTO: MARCA OTRO ANTES DE QUITAR ESTE.": "AU MOINS UN POSTE : COCHE UN AUTRE AVANT D'ENLEVER CELUI-CI.",
		"EL ARCO ES EXCLUYENTE: UN PORTERO NO JUEGA DE NADA MAS.": "LE BUT EST EXCLUSIF : UN GARDIEN NE JOUE NULLE PART AILLEURS.",
		"MARCA SU PUESTO DE CAMPO: ASI SALE DEL ARCO.": "COCHE SON POSTE DE CHAMP : IL SORT DES BUTS.",
		"ES EL ULTIMO {0} DEL CLUB: MARCA A OTRO PRIMERO.": "DERNIER {0} DU CLUB : COCHE D'ABORD QUELQU'UN D'AUTRE.",
		"El primero es su puesto (hoy {0}) y el número es su OVR ahí: quítalo y pasa al siguiente. Hasta {1}, y viajan con la persona.": "Le premier est son poste (aujourd'hui {0}) et le chiffre est son OVR à ce poste : enlève-le et le suivant prend la relève. Jusqu'à {1}, et ils suivent la personne.",
		"— TITULARES · {0} —": "— TITULAIRES · {0} —",
		"EL ARCO ES EXCLUYENTE: NI ENTRA NI SALE NADIE.": "LE BUT EST EXCLUSIF : NI ENTREE NI SORTIE.",
		"SU PUESTO VA SIEMPRE: NO SE PUEDE QUITAR.": "SON PROPRE POSTE COMPTE TOUJOURS : PAS RETIRABLE.",
		"HASTA {0} PUESTOS: QUITA UNO PARA PONER OTRO.": "JUSQU'A {0} POSTES : ENLEVE-EN UN POUR EN METTRE UN AUTRE.",
		"Su puesto va siempre. Hasta {0}, y viajan con la persona.": "Son propre poste est toujours coché. Jusqu'à {0}, et ils suivent la personne.",
		"Mientras juegues aquí, este asiento lo ocupas tú; el jugador editado vale para"
		+ " el resto del mundo.":
			"Tant que tu joues ici, ce poste est le tien ; le joueur"
			+ " modifié compte pour le reste du monde.",
		"El puesto es del ASIENTO: en un intercambio se queda aquí.":
			"Le poste appartient à la PLACE : dans un échange, il reste ici.",
		"VELOCIDAD": "VITESSE",
		"PEGADA": "PUISSANCE",
		"PUNTERIA": "PRECISION",
		"ROSCA": "EFFET",
		"CABEZA": "TETE",
		"PENAL": "PENALTY",
		"BALON PARADO": "BALLE ARRETEE",
		"REFLEJOS": "REFLEXES",
		"REFLEJOS solo cuenta en porteros. Se guarda solo.":
			"REFLEXES ne compte que pour les gardiens. Ça s'enregistre tout seul.",
		"Cada puesto se mide por sus cualidades. Se guarda solo.":
			"Chaque poste se mesure à ses qualités. Sauvegarde auto.",
		"REFLEJOS solo cuenta en porteros.": "REFLEXES ne compte que pour les gardiens.",
		"TRASPASAR": "TRANSFERER",
		"QUITAR EDICION (VOLVER AL DE BASE)": "ANNULER LA MODIF (RETOUR PAR DEFAUT)",
		"ES EL ULTIMO DE SU PUESTO: NO SE PUEDE CAMBIAR.":
			"DERNIER A CE POSTE : IMPOSSIBLE A CHANGER.",

		"MIS EDICIONES": "MES MODIFICATIONS",

		"IMPORTAR DATOS": "IMPORTER DES DONNEES",
		"Catálogo completo": "Catalogue complet",
		"EXPORTAR EL MUNDO ENTERO": "EXPORTER LE MONDE ENTIER",
		"IMPORTAR: ABRIR ARCHIVOS": "IMPORTER : OUVRIR FICHIERS",
		"IMPORTAR UN ARCHIVO": "IMPORTER UN FICHIER",
		"Exportar te da un archivo para editarlo en el ordenador; importar lo trae de vuelta. Vale .json o un .zip con la carpeta de escudos dentro.": "Exporter te donne un fichier à modifier sur l'ordinateur ; importer le ramène. Un .json convient, ou un .zip avec le dossier des écussons dedans.",
		"Al terminar se abre COMPARTIR: mándalo a Archivos o a tu ordenador para editarlo y volver a importarlo.": "PARTAGER s'ouvre à la fin : envoie-le vers Fichiers ou vers ton ordinateur pour l'éditer et le réimporter.",
		"Al terminar se abre GUARDAR: déjalo en Descargas y desde ahí pásalo al ordenador o a tu nube para editarlo y volver a importarlo.": "ENREGISTRER s'ouvre à la fin : mets-le dans Téléchargements, puis passe-le de là sur l'ordinateur ou dans ton cloud pour l'éditer et le réimporter.",
		"Si el archivo está en Drive, bájalo antes a Descargas.": "Si le fichier est sur Drive, télécharge-le d'abord dans Téléchargements.",
		"IMPORTANDO…": "IMPORT…",
		"Guardando el catálogo y los escudos. No cierres el juego.": "Enregistrement du catalogue et des écussons. Ne ferme pas le jeu.",
		"No se pudo guardar el archivo donde elegiste.": "Le fichier n'a pas pu être enregistré là où tu as choisi.",
		"El archivo es tuyo y para tu uso personal: el juego no aloja ni reparte packs.": "Le fichier est à toi et pour ton usage personnel : le jeu n'héberge ni ne distribue de packs.",
		"Lo que importes es tuyo y se queda en tu dispositivo: tú respondes de lo que metas en el archivo.": "Ce que tu importes est à toi et reste sur ton appareil : tu réponds de ce que tu mets dans le fichier.",
		"El .zip no trae ningún archivo .json dentro.": "Ce .zip ne contient aucun fichier .json.",
		"El archivo es demasiado grande: no se importó nada.": "Ce fichier est trop lourd : rien n'a été importé.",
		"no se pudo abrir el selector": "le sélecteur de fichiers n'a pas pu s'ouvrir",
		"no se pudo copiar el archivo elegido": "le fichier choisi n'a pas pu être copié",
		"no se encontró el archivo exportado": "fichier exporté introuvable",
		"EXPORTADO A {0}": "EXPORTE VERS {0}",
		"Queda en la carpeta de Football Legacy como {0}: ábrelo en el ordenador para ajustar tus plantillas y vuelve a importarlo.": "Le fichier arrive dans le dossier Football Legacy sous le nom {0} : ouvre-le sur l'ordinateur pour ajuster tes effectifs et réimporte-le.",
		"EXPORTAR PLANTILLA": "EXPORTER LE MODELE",
		"EXPORTAR": "EXPORTER",
		"NO SE PUDO ESCRIBIR": "ECRITURE IMPOSSIBLE",
		"Saca todos los clubes, plantillas y competiciones tal y como están ahora.": "Sort tous les clubs, effectifs et compétitions tels qu'ils sont maintenant.",
		"Los escudos no van dentro: esos los pones tú.": "Les blasons ne sont pas inclus : ceux-là, c'est toi qui les mets.",
		"club": "club",
		"clubes": "clubs",
		"jugador": "joueur",
		"jugadores": "joueurs",
		"escudo": "blason",
		"escudos": "blasons",
		"competicion": "competition",
		"competiciones": "competitions",
		"club desconocido": "club inconnu",
		"competición desconocida": "compétition inconnue",
		"marca desconocida": "marque inconnue",
		"id vacío": "identifiant vide",
		"nombre vacío": "nom vide",
		"marca {0}: {1}": "marque {0} : {1}",
		"marca deportiva {0}: {1}": "équipementier {0} : {1}",
		"pesa {0} KB (tope {1})": "{0} Ko (limite {1})",
		"no es un PNG válido": "PNG invalide",
		"no es un SVG válido": "SVG invalide",
		"{0}x{1} (tope {2}x{3})": "{0}x{1} (limite {2}x{3})",
		"no se pudo escribir": "écriture impossible",
		"no se encontró el archivo": "fichier introuvable",
		"no se pudo abrir el archivo": "impossible d'ouvrir le fichier",
		"el archivo pesa más de {0} MB": "le fichier dépasse {0} Mo",
		"el archivo no es un JSON válido": "le fichier n'est pas un JSON valide",
		"formato {0}: este juego lee el {1}": "format {0} : ce jeu lit le {1}",
		"{0} pide {1} asientos y el juego admite de {2} a {3}": "{0} demande {1} places et le jeu en accepte de {2} à {3}",
		"{0} se queda en {1} asientos: el último es su único {2}": "{0} reste à {1} places : la dernière est son seul {2}",
		"{0}: el asiento {1} se queda de {2} (el pack lo dejaba sin ninguno)": "{0} : la place {1} reste {2} (le pack n'en laissait aucun)",
		"no se pudo cruzar {0} con {1} (¿mismo país? ¿misma división?)": "impossible d'échanger {0} avec {1} (même pays ? même division ?)",
		"club desconocido: {0}": "club inconnu : {0}",
		"formación desconocida: {0}": "formation inconnue : {0}",
		"país desconocido: {0}": "pays inconnu : {0}",
		"leyenda desconocida: {0}": "légende inconnue : {0}",
		"planta desconocida: {0}": "forme de stade inconnue : {0}",
		"estadio": "stade",
		"estadios": "stades",
		"logo de {0}: {1}": "blason de {0} : {1}",
		"base64 ilegible": "base64 illisible",
		"{0} trae {1} jugadores y hay {2} asientos": "{0} apporte {1} joueurs et il y a {2} places",
		"{0} trae {1} jugadores para {2} asientos: {3} sin cubrir": "{0} apporte {1} joueurs pour {2} places : {3} non couvertes",
		"{0}: {1} clubes sin jugadores en el pack (se quedan los del juego)": "{0} : {1} clubs sans joueurs dans le pack (ceux du jeu restent)",
		"{0} de {1} jugadores": "{0} sur {1} joueurs",
		"{0} sin cubrir": "{0} non couvertes",
		"{0} descartados": "{0} ecartes",
		"IMPORTAR": "IMPORTER",

		"EL MUNDO SE MOVIO": "LE MONDE A BOUGE",
		"Los clubes llevan {0} en esta carrera. Esos jugadores se quedan con su nombre anterior: el pack no los reescribe.":
			"Les clubs ont fait {0} dans cette carrière. Ces joueurs gardent leur ancien nom : le pack ne les réécrit pas.",
		"fichaje": "transfert",
		"fichajes": "transferts",
		"Puedes devolver el mundo al catálogo que acabas de importar. Se pierden esos fichajes, también los de tu plantilla; tu carrera, tu club y tus estadísticas no se tocan.":
			"Tu peux remettre le monde au catalogue que tu viens d'importer. Ces transferts sont perdus, ceux de ton effectif compris ; ta carrière, ton club et tes stats ne bougent pas.",
		"VOLVER AL PACK": "RETOUR AU PACK",
		"DEJARLO ASI": "LAISSER AINSI",
		"QUITAR TODO LO IMPORTADO": "TOUT SUPPRIMER",
		"NO SE PUDO LEER": "LECTURE IMPOSSIBLE",
		"Nombres, plantillas y escudos desde un archivo tuyo. Se puede deshacer entero.":
			"Noms, effectifs et blasons depuis ton propre fichier. Entièrement réversible.",
		"No hay ningún archivo todavía. Toca IMPORTAR, deja tu .json en esa carpeta y vuelve.":
			"Aucun fichier pour l'instant. Touche IMPORTER, dépose ton fichier .json dans ce dossier et reviens.",
		"Pisa los nombres y las plantillas que tengas ahora.":
			"Cela remplace les noms et les effectifs actuels.",
		"Vale para todas las ranuras y se puede quitar entero.":
			"Valable pour tous les emplacements et supprimable d'un coup.",
		"Todo lo que has tocado, para llegar de un toque y para poder deshacerlo.":
			"Tout ce que tu as modifié, à portée d'un geste et réversible.",





		"CAMBIAR DE DIVISION": "CHANGER DE DIVISION",
		"La división solo se cambia con la temporada recién empezada: el calendario,"
		+ " la tabla y el bombo de copa ya están armados con las de ahora.":
			"La division ne se change qu'en début de saison : le calendrier, le"
			+ " classement et le tirage de coupe sont déjà faits avec celles d'aujourd'hui.",
		"El calendario se vuelve a sortear: liga, copa y europeas.":
			"Le calendrier est de nouveau tiré au sort : championnat, coupe et Europe.",
		"EDITOR DE ESTA CARRERA": "EDITEUR DE CETTE CARRIERE",
		"EDITAR MI CARRERA": "MODIFIER MA CARRIERE",
		"Retoca el plantel que tienes HOY: con sus fichajes, sus retiros y sus años"
		+ " encima. Sólo cambia esta partida; tu base de datos global no se toca.":
			"Retouche l'effectif que tu as AUJOURD'HUI : transferts, retraites et"
			+ " années comprises. Ça ne change que cette partie ; ta base globale n'y"
			+ " touche pas.",
		"EDITANDO TU CARRERA · {0} · TEMPORADA {1}":
			"TU MODIFIES TA CARRIERE · {0} · SAISON {1}",
		"Lo que toques aquí cambia SOLO esta carrera.\nTu base de datos global no se"
		+ " entera.":
			"Ce que tu touches ici ne change QUE cette carrière.\nTa base globale n'en"
			+ " saura rien.",
		"{0} de {1} asientos editados en esta carrera.":
			"{0} sur {1} postes modifiés dans cette carrière.",
		"Todavía no has editado nada en esta carrera.":
			"Tu n'as encore rien modifié dans cette carrière.",
		"NO CABE": "PLUS DE PLACE",
		"Esta carrera ya tiene {0} asientos editados, que es el tope.":
			"Cette carrière a déjà {0} postes modifiés, c'est la limite.",
		"Esta carrera ya tiene {0} asientos editados, que es el tope. Quita alguno en"
		+ " MIS EDICIONES.":
			"Cette carrière a déjà {0} postes modifiés, c'est la limite. Enlèves-en"
			+ " dans MES MODIFS.",
		"Todo lo que has tocado EN ESTA CARRERA vuelve a como estaba.":
			"Tout ce que tu as touché DANS CETTE CARRIERE revient comme avant.",
		"La base de datos global no se toca: sigue igual en todas las ranuras.":
			"La base de données globale n'est pas touchée : elle reste identique dans tous les emplacements.",
		"Los fichajes que hiciste aquí NO se deshacen: son parte de la partida.":
			"Les transferts que tu as faits ici ne sont PAS annulés : ils font partie"
			+ " de la partie.",
		"Todavía no has editado nada.": "Tu n'as encore rien modifié.",
		"· IDENTIDAD DEL CLUB (NOMBRE, COLORES, ESCUDO)":
			"· IDENTITE DU CLUB (NOM, COULEURS, BLASON)",
		"VER MÁS ({0})": "VOIR PLUS ({0})",
		"QUITAR TODO LO EDITADO": "TOUT REINITIALISER",
		"Las plantillas, los traspasos, las caras y los escudos vuelven a la base de fábrica.":
			"Effectifs, transferts, visages et blasons reviennent aux valeurs d'origine.",
		"Vale para todas las ranuras de partida, no solo para esta.":
			"Cela vaut pour toutes les sauvegardes, pas seulement celle-ci.",
		"Esto SI es para siempre.": "Ceci est DEFINITIF.",
		"Ningún {0} encaja con esa búsqueda. Toca TODOS para ver el resto.":
			"Aucun {0} ne correspond. Touche TOUS pour voir le reste.",
		"SUBIR O BAJAR TODO EL CLUB": "AUGMENTER OU BAISSER TOUT LE CLUB",
		"AJUSTAR EL CLUB": "AJUSTER LE CLUB",
		"Suma o resta a TODAS las cualidades de los 23 asientos.":
			"Ajoute ou retire à TOUTES les qualités des 23 places.",
		"Nada baja de {0} ni pasa de {1}. Se deshace entero con QUITAR EDICIONES DEL CLUB.":
			"Rien ne descend sous {0} ni ne dépasse {1}. Annule tout avec RETIRER LES MODIFS DU CLUB.",
		"DUPLICAR": "DUPLIQUER",
		"No es para siempre: QUITAR EDICION devuelve al de antes.":
			"Ce n'est pas définitif : RETIRER LA MODIF ramène l'ancien.",
		"JUGADOR NUEVO": "NOUVEAU JOUEUR",
		"El puesto y el dorsal los da el asiento\nque elijas al final.":
			"Le poste et le numéro dépendent du poste\nque tu choisiras à la fin.",
		"NOMBRE DEL JUGADOR": "NOM DU JOUEUR",
		"ELEGIR ASIENTO": "CHOISIR UN POSTE",
		"JUGADOR NUEVO: {0}": "NOUVEAU JOUEUR : {0}",
		"TRASPASO: {0} ({1} · {2})": "TRANSFERT : {0} ({1} · {2})",
		"CANCELAR ALTA": "ANNULER LA CREATION",
		"CANCELAR TRASPASO": "ANNULER LE TRANSFERT",
		"CONFIRMAR ALTA": "CONFIRMER LA CREATION",
		"{0} entra en {1}.": "{0} rejoint {1}.",
		"SE VA SOLO (SIN CAMBIO)":
			"IL PART SEUL (SANS ECHANGE)",
		"INTERCAMBIO CON OTRO JUGADOR":
			"ECHANGE AVEC UN AUTRE JOUEUR",
		"Los dos jugadores cambian de club.":
			"Les deux joueurs changent de club.",
		"TRASPASO HECHO: {0} FICHA POR {1}.":
			"TRANSFERT FAIT : {0} SIGNE A {1}.",
		"Nadie vuelve a cambio: su club se queda con un jugador menos.":
			"Personne en retour : son club se retrouve avec un joueur de moins.",
		"Al tocar un club se ficha ahí mismo: no eliges asiento.":
			"Toucher un club le fait signer aussitôt : pas de place à choisir.",
		"Nadie vuelve a cambio y nadie deja su asiento.":
			"Personne en retour et personne ne perd sa place.",
		"{0} se queda con {1} jugadores y {2} pasa a {3}.":
			"{0} reste à {1} joueurs et {2} passe à {3}.",
		"Sigue jugando en su puesto, con un dorsal libre del club nuevo.":
			"Il garde son poste, avec un numéro libre de son nouveau club.",
		"NO SE PUDO":
			"IMPOSSIBLE",
		"Ya juega en ese club.":
			"Il joue déjà dans ce club.",
		"Un club no puede bajar de {0} jugadores.":
			"Un club ne peut pas descendre sous {0} joueurs.",
		"Un club no puede pasar de {0} jugadores.":
			"Un club ne peut pas dépasser {0} joueurs.",
		"{0} se quedaría sin ningún {1}.":
			"{0} n'aurait plus aucun {1}.",
		"Ese traspaso no se puede hacer.":
			"Ce transfert est impossible.",
		"{0} deja su asiento y SALE del juego.":
			"{0} quitte son poste et SORT du jeu.",
		"El nuevo jugará de {0} con el dorsal {1}.":
			"Le nouveau jouera {0} avec le numéro {1}.",
		"CREAR": "CREER",
		"ALTA HECHA: {0} ENTRA POR {1}.": "CREATION FAITE : {0} REMPLACE {1}.",
		"{0} ficha por {1}.": "{0} signe à {1}.",
		"{0} se marcha a {1}.": "{0} part à {1}.",
		"OJO: {0} pasa a jugar de {1} y {2} de {3}.":
			"ATTENTION : {0} joue maintenant {1} et {2} joue {3}.",
		"CONFIRMAR TRASPASO": "CONFIRMER LE TRANSFERT",
		"CONFIRMAR": "CONFIRMER",
		"TRASPASO HECHO: {0} LLEGA POR {1}.": "TRANSFERT FAIT : {0} ARRIVE CONTRE {1}.",
		"QUITAR EDICIONES": "ANNULER TOUTES LES MODIFS",
		"Todo el {0} vuelve a su plantilla de base.":
			"Tout le {0} revient à son effectif de base.",
		"Los traspasos hechos con este club también se deshacen aquí.":
			"Les transferts faits avec ce club sont aussi annulés ici.",
		"QUITAR TODO": "TOUT SUPPRIMER",
		"FISICO": "APPARENCE",
		"FISICO (PIEL, PELO, BARBA)": "APPARENCE (PEAU, CHEVEUX, BARBE)",
		"La cara viaja con la persona: si la traspasas, se la lleva. Se guarda solo.":
			"Le visage voyage avec la personne : si tu la transfères, il"
			+ " part avec elle. Ça s'enregistre tout seul.",
		"QUITAR FISICO (VOLVER AL DE FABRICA)": "ANNULER L'APPARENCE (RETOUR PAR DEFAUT)",
		"Nace con esta cara. El alta no se confirma hasta elegir asiento.":
			"Il naît avec ce visage. La création n'est confirmée"
			+ " qu'une fois le poste choisi.",
		"NOMBRE": "NOM",
		"SIGLAS (VAN EN EL ESCUDO)": "INITIALES (SUR L'ECUSSON)",
		"UNIFORME": "MAILLOT",
		"UNIFORME · {0}": "MAILLOT · {0}",
		"Playera": "Maillot",
		"Shorts": "Short",
		"Acento del patrón": "Accent du motif",
		"PATRON": "MOTIF",
		"LOCAL": "DOMICILE",
		"VISITA": "EXTERIEUR",
		"ALTERNA": "TROISIEME",
		"El acento solo se ve si la playera lleva patrón.":
			"L'accent n'apparaît que si le maillot a un motif.",
		"PECHO DE LA PLAYERA": "POITRINE DU MAILLOT",
		"PATROCINADOR": "SPONSOR",
		"MARCA DEPORTIVA": "EQUIPEMENTIER",
		"Estas son las marcas del juego: importa un pack de logos para usar las tuyas. El club estrena lo que elijas en esta misma temporada, y desde ahí los contratos siguen rotando solos cada pocas temporadas.":
			"Ce sont les marques du jeu : importe un pack de logos pour utiliser les tiennes. Le club porte ton choix dès cette saison, et ensuite les contrats continuent de tourner tout seuls toutes les quelques saisons.",
		"Las marcas salen de tu pack. El club estrena lo que elijas en esta misma"
		+ " temporada, y desde ahí los contratos siguen rotando solos cada pocas"
		+ " temporadas.":
			"Les marques viennent de ton pack. Le club porte ton choix dès cette"
			+ " saison, et ensuite les contrats continuent de tourner tout seuls toutes"
			+ " les quelques saisons.",


		"tintaAUTO": "AUTO",
		"TINTA DEL PECHO · {0}": "ENCRE DE POITRINE · {0}",
		"Color del patrocinador": "Couleur du sponsor",
		"Color de la marca deportiva": "Couleur de l'équipementier",
		"Con AUTO el juego elige el color que mejor se lee sobre esta playera. El color que fijes vale solo para este uniforme.":
			"Avec AUTO, le jeu choisit la couleur la plus lisible sur ce maillot. La couleur que tu fixes ne vaut que pour cette tenue.",
		"Este uniforme se genera solo cada temporada. El club lo estrena tal cual"
		+ " en la temporada en que lo elijas, y a partir de ahí sigue cambiando de"
		+ " color y dibujo cada año.":
			"Ce maillot est généré à chaque saison. Le club porte exactement ton choix"
			+ " la saison où tu le fais, et ensuite il change de couleur et de motif"
			+ " chaque année.",
		"ESCUDO": "ECUSSON",
		"escudoFORMA": "FORME",
		"FONDO": "FOND",
		"TINTA": "ENCRE",
		"EMBLEMA": "EMBLEME",
		"BORDE": "BORDURE",
		"La fuerza y el país no se tocan aquí: son la estructura de la liga.":
			"La force et le pays ne se modifient pas ici"
			+ " : c'est la structure du championnat.",


		"Se INTERCAMBIA con un club de otra división del mismo país: uno sube y el"
		+ " otro baja, y cada liga sigue con los mismos equipos.":
			"Il S'ECHANGE avec un club d'une autre division du même pays : l'un monte, l'autre descend, et chaque championnat garde ses effectifs.",
		"ELIGE EL CLUB CON EL QUE SE CAMBIA": "CHOISIS LE CLUB DE L'ECHANGE",
		"Los dos se cruzan: uno sube y el otro baja.\nTiene que ser de otra división"
		+ " del mismo país.":
			"Les deux s'échangent : l'un monte, l'autre descend.\nIl doit venir d'une autre division du même pays.",
		"CAMBIO DE DIVISION: {0} ({1})": "DIVISION : {0} ({1})",
		"CANCELAR CAMBIO": "ANNULER",
		"CONFIRMAR CAMBIO DE DIVISION": "CONFIRMER L'ECHANGE",
		"{0} pasa a {1}.": "{0} passe en {1}.",
		"Se cruzan los dos, así que cada división sigue con los mismos equipos.":
			"Les deux s'échangent, donc chaque division garde le même nombre d'équipes.",
		"Su plantel y su fuerza no cambian.": "Son effectif et sa force ne bougent pas.",
		"Las carreras ya empezadas siguen con la división que tengan.":
			"Les carrières déjà lancées gardent la division qu'elles ont.",
		"CAMBIO HECHO: {0} A {1}.": "C'EST FAIT : {0} EN {1}.",

		"ELIGE SU EQUIPO NUEVO": "CHOISIS SON CLUB",
		"Se cruza con el técnico de ese club: cada uno se sienta en el banquillo del otro.":
			"Il échange avec l'entraîneur de ce club : chacun prend le banc de l'autre.",
		"CAMBIO DE EQUIPO: {0} ({1})": "NOUVEAU CLUB : {0} ({1})",
		"— TÉCNICOS —": "— COACHS —",
		"SU CARA": "VISAGE",
		"CAMBIAR DE EQUIPO": "CHANGER DE CLUB",
		"DEJARLO LIBRE": "LE LIBERER",
		"{0} SE QUEDA SIN EQUIPO. EN SU BANQUILLO SE SIENTA {1}.":
			"{0} SE RETROUVE SANS CLUB. {1} PREND LE BANC.",
		"Se va al mercado de técnicos y puede volver.":
			"Il part au marché des entraîneurs et peut revenir.",
		"DEVOLVER A SU CLUB": "RENDRE A SON CLUB",
		"{0} VUELVE A {1}.": "{0} REVIENT A {1}.",
		"QUITAR EDICIÓN DEL TÉCNICO": "ANNULER LES MODIFS COACH",

		"— SELECCIONES —": "— SELECTIONS —",
		"Las selecciones vuelven a su uniforme y su convocatoria de fábrica.":
			"Les sélections retrouvent leurs maillots et leurs convocations d'origine.",
		"El uniforme y la convocatoria de cada selección valen para todas tus partidas.":
			"Le maillot et la convocation de chaque sélection valent pour toutes tes parties.",
		"BUSCAR SELECCION": "CHERCHER UNE SELECTION",
		"Ninguna selección se llama así.": "Aucune sélection ne porte ce nom.",
		"EDITADO: {0}": "MODIFIE : {0}",
		"AUTOMATICA": "AUTOMATIQUE",
		"ELEGIR CONVOCADOS": "CHOISIR LES CONVOQUES",
		"Este uniforme se genera solo cada temporada. La selección lo estrena tal cual en la temporada en que lo elijas, y a partir de ahí sigue cambiando de color y dibujo cada año.":
			"Ce maillot se génère tout seul chaque saison. La sélection l'étrenne tel quel la saison où tu le choisis, puis il continue de changer de couleur et de motif chaque année.",
		"La bandera, el nombre y la fuerza de un país no se tocan aquí.":
			"Le drapeau, le nom et la force d'un pays ne se modifient pas ici.",
		"QUITAR EDICION DEL UNIFORME": "ANNULER LES MODIFS DU MAILLOT",
		"{0} vuelve a sus uniformes de fábrica.": "{0} retrouve ses maillots d'origine.",
		"Su convocatoria no se toca.": "Sa convocation ne change pas.",
		"FIJAR: va siempre. VETAR: no va nunca. El resto de la lista la arma el juego con los mejores del país.":
			"FIXER : toujours convoqué. EXCLURE : jamais. Le jeu complète la liste avec les meilleurs du pays.",
		"CONVOCADOS · {0}": "CONVOQUES · {0}",
		"A LAS PUERTAS": "AUX PORTES",
		"VER {0} MAS": "VOIR {0} DE PLUS",
		"FUERA DE LA LISTA": "HORS DE LA LISTE",
		"VETADO": "EXCLU",
		"QUITAR VETO": "LEVER L'EXCLUSION",
		"FIJADO, PERO YA NO ESTA EN EL PAIS": "FIXE, MAIS PLUS DISPONIBLE",
		"FIJADO, SIN SITIO": "FIXE, SANS PLACE",
		"SOLTAR": "LIBERER",
		"QUITAR FIJADOS Y VETOS": "RETIRER FIXES ET EXCLUS",
		"{0} vuelve a convocar solo a sus mejores.": "{0} convoque de nouveau seulement ses meilleurs.",
		"Su uniforme no se toca.": "Son maillot ne change pas.",
		"FIJADO": "FIXE",
		"FIJAR": "FIXER",
		"VETAR": "EXCLURE",

		"— LEYENDAS —": "— LEGENDES —",
		"Los grandes de la historia no juegan en ningún club: su cara se toca aquí.":
			"Les grands de l'histoire ne jouent dans aucun club : leur visage se modifie ici.",
		"Sale con esta cara donde aparezca: al conocerla, en la gala y en la cancha. Se guarda sola.":
			"Ce visage apparaît partout où ils sortent : à la rencontre, au gala et sur le terrain. Ça s'enregistre tout seul.",
		"QUITAR CARA (VOLVER A LA SUYA)": "ANNULER VISAGE (LE SIEN)",
		"La cara viaja con él: si cambia de banquillo, se la lleva. Se guarda sola.":
			"Le visage voyage avec lui : s'il change de banc, il l'emporte. Ça s'enregistre tout seul.",
		"Fija en todas tus carreras. Sus resultados la suben o la bajan.":
			"Fixée dans toutes tes carrières. Ses résultats la font monter ou baisser.",
		"Sin tocar, se sortea en cada carrera alrededor de esto.":
			"Sans retouche, chaque carrière la tire au sort autour de ça.",
		"Sus resultados la suben o la bajan hasta estrella y media.":
			"Ses résultats peuvent la faire varier d'une étoile et demie.",
		"El cambio de equipo vale para las carreras nuevas.":
			"Le changement de club vaut pour les nouvelles carrières.",
		"El cambio de equipo vale desde hoy en esta carrera.":
			"Le changement de club vaut dès aujourd'hui dans cette carrière.",
		"CONFIRMAR CAMBIO DE EQUIPO": "CONFIRMER LE CHANGEMENT",
		"{0} pasa a entrenar al {1}.": "{0} prend les rênes de {1}.",
		"Cada uno se lleva su habilidad, su cara y sus trofeos.":
			"Chacun garde son niveau, son visage et ses trophées.",
		"Las carreras ya empezadas siguen con sus banquillos.":
			"Les carrières déjà lancées gardent leurs bancs.",
		"Tu relación con tu técnico no cambia.": "Ta relation avec ton entraîneur ne change pas.",
		"CAMBIO HECHO: {0} ENTRENA AL {1}.": "C'EST FAIT : {0} ENTRAINE {1}.",
		"· DIVISION CAMBIADA ({0})": "· DIVISION CHANGEE ({0})",
		"La división tampoco: se deshace intercambiando otra vez.":
			"La division non plus : refais un échange pour l'annuler.",
		"QUITAR EDICION DEL CLUB": "ANNULER LA MODIF DU CLUB",
		"{0} vuelve a su nombre, uniforme y escudo de fábrica.":
			"{0} retrouve son nom, son maillot et son écusson d'origine.",
		"Su plantel no se toca.": "Son effectif n'est pas touché.",
		"LISO": "UNI",
		"RAYAS": "RAYURES",
		"AROS": "CERCLES",
		"MITADES": "MOITIES",
		"MANGAS": "MANCHES",
		"RAYA FINA": "FINE RAYURE",
		"BANDA": "BANDE",
		"DIAGONAL": "DIAGONALE",
		"CUADROS": "DAMIER",
		"FRANJA VERTICAL": "BANDE CENTRALE",
		"FRANJA PECHO": "BANDE POITRINE",
		"REDONDO": "ROND",
		"SCUDETTO": "SCUDETTO",
		"HEXAGONO": "HEXAGONE",
		"BANDERIN": "FANION",
		"ROMBO": "LOSANGE",
		"ESTANDARTE": "BANNIERE",
		"TRAPECIO": "TRAPEZE",
		"FRANCES": "FRANCAIS",
		"PICA": "PIQUE",
		"CUADRADO": "CARRE",
		"PALO": "PAL",
		"FAJA": "FASCE",
		"CUARTELES": "ECARTELE",
		"CHEVRON": "CHEVRON",
		"JEFE": "CHEF",
		"PIE": "POINTE",
		"ORLA": "BORDURE ORNEE",
		"PUNTA": "PILE",
		"ROMBOS": "LOSANGES",
		"TRICOLOR": "TRICOLORE",
		"SEGUNDO COLOR": "DEUXIEME COULEUR",
		"OSCURO": "FONCE",
		"CLARO": "CLAIR",
		"NADA": "AUCUN",
		"LETRAS": "LETTRES",
		"ESTRELLA": "ETOILE",
		"DOS ESTRELLAS": "DEUX ETOILES",
		"ARO": "ANNEAU",
		"BALON": "BALLON",
		"AGUILA": "AIGLE",
		"TORO": "TAUREAU",
		"CORONA": "COURONNE",
		"RAYO": "ECLAIR",
		"LUNA": "CROISSANT",
		"TORRE": "TOUR",
		"ANCLA": "ANCRE",
		"ENGRANE": "ENGRENAGE",
		"HOJA": "FEUILLE",
		"ORO": "OR",
		"BLANCO": "BLANC",
		"NEGRO": "NOIR",
		"TEMPORADA {0}": "SAISON {0}",
		"FIN DE TEMPORADA": "FIN DE SAISON",
		"TU AÑO": "TON ANNEE",
		"PROGRESION": "PROGRESSION",
		"EL MUNDO": "LE MONDE",
		"LO QUE VIENE": "CE QUI ARRIVE",
		"LA DESPEDIDA": "L'ADIEU",
		"IR AL MERCADO": "ALLER AU MERCATO",
		"Objetivo del club: {0}": "Objectif du club : {0}",
		"CUMPLIDO": "REMPLI",
		"NO CUMPLIDO": "NON REMPLI",
		"temporadaMEDIA": "NOTE",
		"{0} vs. el año pasado": "{0} vs. l'an dernier",
		"TUS HABILIDADES": "TES COMPETENCES",
		"TU SITIO EN EL MUNDO": "TA PLACE DANS LE MONDE",
		"TU CARRERA HASTA HOY": "TA CARRIERE JUSQU'ICI",
		"Tu mejor partido: {0}": "Ton meilleur match : {0}",
		"HITOS DE CARRERA": "ETAPES DE CARRIERE",
		"{0} partidos como profesional": "{0} matchs en professionnel",
		"{0} goles de carrera": "{0} buts en carrière",
		"{0} asistencias de carrera": "{0} passes décisives en carrière",
		"{0} partidos disputados": "{0} matchs disputés",
		"{0} goles marcados": "{0} buts marqués",
		"{0} asistencias repartidas": "{0} passes décisives délivrées",
		"TÚ Y TUS COMPAÑEROS": "TOI ET TES COEQUIPIERS",
		"TU MEJOR PARTIDO": "TON MEILLEUR MATCH",
		"OBJETIVO DEL CLUB": "OBJECTIF DU CLUB",
		"vs {0}": "vs {0}",
		"vs. el año pasado": "vs. la saison dernière",
		"EL CLUB Y TÚ": "LE CLUB ET TOI",
		"EL CLUB CUENTA CONTIGO": "LE CLUB COMPTE SUR TOI",
		"EL CLUB ESPERA MÁS DE TI": "LE CLUB EN ATTEND PLUS DE TOI",
		"EL CLUB TE BUSCARÁ MINUTOS FUERA": "LE CLUB PENSE A TE PRETER",
		"EL CLUB TE PONE EN EL ESCAPARATE": "LE CLUB TE MET SUR LE MARCHE",
		"TU MEDIA AÑO A AÑO": "TA NOTE ANNEE APRES ANNEE",
		"Valor de mercado": "Valeur marchande",
		"Dinero": "Argent",
		"SIN TÍTULOS": "AUCUN TITRE",
		"Este año no levantaste nada. Se vuelve a empezar.":
			"Cette année tu n'as rien soulevé. On repart de zéro.",
		"En color, lo que levantaste; apagado, lo que se escapó.": "En couleur, ce que tu as soulevé ; éteint, ce qui t'a échappé.",
		"LO QUE GANASTE": "CE QUE TU AS GAGNE",
		"GOLEO DE LA LIGA": "MEILLEURS BUTEURS",
		"CÓMO ACABÓ TU LIGA": "TON CLASSEMENT FINAL",
		"Acabaste {0} de {1}.": "Tu as fini {0}e sur {1}.",
		"SIN NOVEDAD": "RIEN DE NEUF",
		"El mundo siguió su curso sin sobresaltos.": "Le monde a suivi son cours, sans surprise.",
		"LO QUE SE LLEVARON OTROS": "CE QUE LES AUTRES ONT GAGNE",

		"EN EL MUNDO": "AILLEURS",
		"FICHAJE DEL AÑO": "TRANSFERT PHARE",
		"Suben de categoría: {0}": "Montent en division : {0}",
		"{0} pts": "{0} pts",
		"Y HASTA AQUI": "ET C'EST TOUT",
		"NO HAY TEMPORADA SIGUIENTE.": "IL N'Y A PAS DE SAISON SUIVANTE.",
		"Se acabó el futbol jugado. Lo que viene ahora es la despedida, y despues lo"
		+ " que dejaste.":
			"Ton temps de jeu s'arrête là. Ce qui vient maintenant,"
			+ " c'est l'adieu, et ensuite ce que tu laisses.",


		"{0} temporadas": "{0} saisons",
		"Hiciste {0} goles el año pasado": "Tu as marqué {0} buts la saison passée",
		"Diste {0} asistencias el año pasado": "Tu as donné {0} passes décisives la saison passée",
		"Jugaste {0} partidos el año pasado": "Tu as joué {0} matchs la saison passée",
		"PRIMA": "PRIME",
		"EL AÑO EN DINERO": "L'ANNEE EN ARGENT",
		"GANASTE ESTE AÑO": "TU AS GAGNE",
		"Primas por títulos": "Primes de titres",
		"Prima de objetivo": "Prime d'objectif",
		"Prima por el año del club": "Prime de saison du club",
		"Royalties de camiseta": "Royalties de maillot",
		"Premio del patrocinador": "Prime du sponsor",

		"TU SELECCIÓN": "TA SELECTION",
		"TU CUERPO": "TON CORPS",
		"EL RESTO DEL AÑO": "LE RESTE DE L'ANNEE",
		"TU SITUACIÓN": "TA SITUATION",
		"ERES AGENTE LIBRE: tu contrato terminó.": "TU ES AGENT LIBRE : ton contrat s'est terminé.",
		"Ningún club es dueño de tu pase. Elige destino en el mercado: fichas sin"
		+ " traspaso y con prima.":
			"Aucun club ne détient ton contrat. Choisis ta destination"
			+ " dans le mercato : tu signes sans indemnité de transfert et avec une"
			+ " prime à la signature.",
		"Contrato: ÚLTIMO AÑO": "Contrat : DERNIERE ANNEE",
		"Contrato: {0} temporadas por delante": "Contrat : {0} saisons restantes",
		"Renueva o escucha ofertas: si acabas el año sin firmar, te vas gratis.":
			"Prolonge ou écoute les offres : si tu finis l'année sans"
			+ " signer, tu pars libre.",
		"LO QUE TE PIDEN AHORA": "CE QU'ON TE DEMANDE MAINTENANT",
		"QUIÉN TE QUIERE": "QUI TE VEUT",
		"TE QUIERE YA": "TE VEUT TOUT DE SUITE",
		"MUY INTERESADO": "TRES INTERESSE",
		"Y {0} clubes más preguntaron por ti.": "Et {0} autres clubs ont demandé après toi.",
		"ÚLTIMA JUGADA": "DERNIERE CHANCE",
		"GOLEADOR": "BUTEUR",
		"ASISTENCIA": "PASSE DECISIVE",
		"hudFINAL": "FIN DU MATCH",
		"CALIFICACIÓN": "NOTE",
		"EXPERIENCIA": "EXPERIENCE",
		"¡NIVEL {0}!  +{1} puntos": "NIVEAU {0} !  +{1} points",
		"¡NIVEL {0}!": "NIVEAU {0} !",

		"RECUPERADAS": "RECUPERATIONS",



		"Recuperadas": "Récupérations",
		"OCASIONES": "OCCASIONS",
		"PASES": "PASSES",
		"{0} CLAVE": "{0} CLES",
		"HAT-TRICK": "TRIPLE",
		"HÉROE DEL DERBI": "HEROS DU DERBY",
		"PARTIDAZO": "GROS MATCH",
		"REPARTIDOR": "DISTRIBUTEUR",
		"DOBLETE": "DOUBLE",
		"GOL Y ASISTENCIA": "BUT ET PASSE DECISIVE",
		"GRAN PARTIDO": "GRAND MATCH",
		"LOS 90 MINUTOS": "LES 90 MINUTES",
		"UNIFORMES PARECIDOS · EL RIVAL SALE DE VISITA":
			"MAILLOTS TROP PROCHES · L'ADVERSAIRE JOUE EN EXTERIEUR",
		"JUGAR": "JOUER",
		"SALTAR AL CAMPO": "ENTRER SUR LE TERRAIN",
		"SUPLENTE": "REMPLACANT",
		"CANSADO": "FATIGUE",
		"JORNADA {0}": "JOURNEE {0}",
		"Uniforme titular": "Maillot domicile",
		"Uniforme visitante": "Maillot extérieur",
		"Tercer uniforme": "Troisième maillot",
		"Uniforme conmemorativo": "Maillot commémoratif",
		"uniformeLOCAL": "DOMICILE",
		"uniformeVISITA": "EXTERIEUR",
		"uniformeALTERNA": "TROISIEME",
		"El balón debe estar al menos a {0} m de la línea de gol.":
			"Le ballon doit être à au moins {0} m de la ligne de but.",
		"El balón está demasiado cerca del arco (mínimo {0} m).":
			"Le ballon est trop près du but (minimum {0} m).",
		"Con el balón tan abierto la cámara cae tras la tribuna (máx {0} m).":
			"Avec le ballon aussi excentré, la caméra tombe derrière la tribune (max {0} m).",
		"Hay un jugador fuera del campo.": "Un joueur est hors du terrain.",
		"Un balón en movimiento tan lento nunca sale de la pantalla de tiro.":
			"Un ballon aussi lent ne quitte jamais l'écran de tir.",
		"Tipo de jugada desconocido.": "Type d'action inconnu.",
		"Un jugador de la barrera no está a los 9.15 m.":
			"Un joueur du mur n'est pas à 9,15 m.",
		"{0} {1} CERCA de la jugada quedan fuera del encuadre.":
			"{0} {1} PRES de l'action sont hors cadre.",
		"{0} {1} tapan tu carril de tiro.": "{0} {1} bloquent ta ligne de tir.",
		"{0} {1} pegados al balón o a tu carrera.":
			"{0} {1} collés au ballon ou à ta course.",
		"{0} {1} de jugadores encimados.": "{0} {1} de joueurs entassés.",
		"{0} {1} en fuera de juego: el pase se pitará.":
			"{0} {1} hors-jeu : la passe sera sifflée.",
		"Un centro sin rematadores no tiene a quién buscar.":
			"Un centre sans attaquants n'a personne à chercher.",
		"TUS MARCAS": "TES RECORDS",
		"TORNEOS DE EUROPA": "COUPES D'EUROPE",

		"BALONES DE ORO": "JOUEUR ANNEE",
		"LIGAS": "TITRES",
		"RÉCORD / TÚ": "RECORD / TOI",
		"RÉCORD / {0}": "RECORD / {0}",
		"EN ACTIVO": "EN ACTIVITE",
		"a los {0}": "à {0} ans",

		"TUS VÍCTIMAS": "TES VICTIMES",
		"G+A": "B+P",
		"G+A/PJ": "B+P/M",
		"{0} RIVALES": "{0} RIVAUX",
		"Todavía no le has hecho daño a nadie.": "Tu n'as encore fait de mal à personne.",
		"Aún no hay historia que contar: sal a jugar.":
			"Il n'y a pas encore d'histoire à raconter : va jouer.",
		"Mejor temporada goleadora": "Meilleure saison en buts",
		"Más asistencias en un año": "Plus de passes décisives en un an",
		"Mejor media (10+ partidos)": "Meilleure note (10+ matchs)",
		"Valor pico: $ {0} a los {1} años": "Valeur maximale : $ {0} à {1} ans",
		"Mayor presentación: {0} personas ({1}, T{2})":
			"Plus grande présentation : {0} personnes ({1}, S{2})",
		"{0}: {1} (T{2}, {3})": "{0} : {1} (S{2}, {3})",
		"RÉCORDS DE LA LIGA · {0}": "RECORDS DU CHAMPIONNAT · {0}",
		"EL REGISTRO DE {0}": "LE RECORD DE {0}",
		"RÉCORDS DEL MUNDO": "RECORDS DU MONDE",
		"★ {0}: {1} — RÉCORD TUYO": "★ {0} : {1} — TON RECORD",
		"{0}: {1} — TU RÉCORD (T{2})": "{0} : {1} — TON RECORD (S{2})",
		"Antes: {0} ({1}), con {2}": "Avant : {0} ({1}), avec {2}",
		"Tu mejor: {0}": "Ton meilleur : {0}",
		"Goles en una temporada": "Buts en une saison",
		"Asistencias en una temporada": "Passes décisives en une saison",
		"Mejor media en una temporada": "Meilleure note en une saison",
		"Goles en una temporada con el club": "Buts en une saison avec le club",
		"Goles con el club": "Buts avec le club",
		"SUPERAS A": "TU DEPASSES",
		"LEYENDA Nº{0}": "LEGENDE N°{0}",
		"Partidos jugados en la liga": "Matchs joués en championnat",
		"Partidos jugados con el club": "Matchs joués avec le club",
		"Goles en una edición de Champions": "Buts en une campagne de Coupe Elite",
		"Asistencias en una edición de Champions": "Passes décisives en une campagne de Coupe Elite",
		"Mejor media en una edición de Champions": "Meilleure note en une campagne de Coupe Elite",
		"Goles en una edición de Europa League": "Buts en une campagne de Coupe Europa",
		"Asistencias en una edición de Europa League": "Passes décisives en une campagne de Coupe Europa",
		"Mejor media en una edición de Europa League": "Meilleure note en une campagne de Coupe Europa",
		"Goles en una edición de Conference": "Buts en une campagne de Coupe Challenge",
		"Asistencias en una edición de Conference": "Passes décisives en une campagne de Coupe Challenge",
		"Mejor media en una edición de Conference": "Meilleure note en une campagne de Coupe Challenge",
		"Goles con la selección": "Buts avec la sélection",
		"LA SELECCIÓN · {0}": "LA SELECTION · {0}",
		"Reescrito {0} veces: {1}": "Réécrit {0} fois : {1}",
		"{0} reescribió el libro: {1} ({2})": "{0} a réécrit le livre : {1} ({2})",
		"RÉCORD": "RECORD",
		"SUPERAS A UNA LEYENDA": "TU DEPASSES UNE LEGENDE",
		"SUPERADA": "DEPASSEE",
		"TE ADELANTÓ": "T'A DEPASSE",
		"Tu palmarés sólo cuenta lo ganado en 1ª división y el Mundial: es la vara con la que se mide a los grandes.":
			"Ton palmarès ne compte que ce que tu as gagné en 1ère"
			+ " division et au Mondial : c'est la barre à laquelle on mesure les"
			+ " grands.",
		"Superar a tu primera leyenda de la historia (sólo cuenta lo hecho en 1ª división o con la selección).":
			"Dépasser ta première légende de l'histoire (seuls comptent les exploits en 1ère division ou avec la sélection).",
		"SUPERADO EN TÍTULOS": "DEPASSE EN TITRES",
		"SUPERADO EN GOLES + ASISTENCIAS": "DEPASSE EN BUTS + PASSES",
		"TUS TÍTULOS (1ª Y SELECCIÓN)": "TES TITRES (1ERE DIV. ET SELECTION)",
		"TUS GOLES + ASISTENCIAS DE ÉLITE": "TES BUTS + PASSES D'ELITE",
		"la tuya": "la tienne",
		"por delante": "encore devant",
		"SEGUIR": "CONTINUER",
		"lo tenía": "détenu par",
		"su marca": "sa marque",
		"desde": "depuis",
		"Tu nombre entra en los libros. Ese registro ya es tuyo.":
			"Ton nom entre dans les livres. Ce record est désormais le tien.",
		"{0}: {1}. El registro era de {2} ({3}).":
			"{0} : {1}. Le record appartenait à {2} ({3}).",
		"{0} · {1} JUGADORES": "{0} · {1} JOUEURS",
		"CAPITÁN": "CAPITAINE",
		"PENALES": "PENALTYS",
		"EL GLOBAL ES TUYO: AL RIVAL NO LE SIRVE ESTE MARCADOR": "TU MENES AU CUMUL : CE SCORE NE LEUR SUFFIT PAS",
		"{0} SE VUELCA ARRIBA: LE FALTAN {1} PARA PASAR": "{0} MONTE TOUT LE MONDE : {1} DE PLUS POUR PASSER",
		"EL RIVAL DEJA MEDIO EQUIPO EN TU CAMPO, ATRÁS HAY PRADERA": "MOITIE DE LEUR EQUIPE CHEZ TOI : DERRIERE, UN BOULEVARD",
		"GLOBAL EMPATADO: ESTO HUELE A PRÓRROGA": "EGALITE AU CUMUL : CA SENT LA PROLONGATION",
		"TE FALTAN {0} EN EL GLOBAL, HAY QUE IR A POR ELLOS": "IL TE MANQUE {0} AU CUMUL, VA LES CHERCHER",
		"TU EQUIPO SE VUELCA Y DEJA LA ESPALDA VENDIDA": "TON EQUIPE MONTE ET LAISSE LE DOS GRAND OUVERT",
		"GLOBAL {0}-{1}": "CUMUL {0}-{1}",
		"PASA {0}": "{0} SE QUALIFIE",
		"FALTAS / CÓRNERS": "CF / CORNERS",
		"Sin plantel: aún no tienes club.": "Pas d'effectif : tu n'as pas encore de club.",
		"SUELDO": "SALAIRE",
		"NOTA": "NOTE",
		"Capitán": "Capitaine",
		"Lanza los penales": "Tire les penaltys",
		"Lanza faltas y córners": "Tire les coups francs et les corners",
		"Aún no hay convocatoria que mostrar.": "Pas encore de sélection à afficher.",
		"CONVOCATORIA": "SELECTION",


		"— banca —": "— banc —",
		"— corte de la convocatoria —": "— limite de la sélection —",
		"No tienes avisos todavía.": "Aucune notification pour l'instant.",
		"{0} · NUEVO": "{0} · NOUVEAU",
		"T{0} · día {1}": "S{0} · jour {1}",
		"buzonPREMIO": "RECOMPENSE",
		"buzonCLUB Y SELECCION": "CLUB ET SELECTION",
		"buzonMARCA Y NIVEL": "MARQUE ET NIVEAU",
		"buzonLESION": "BLESSURE",
		"buzonAVISO": "ACTU",
		"COMÚN": "COMMUN",
		"RARO": "RARE",
		"ÉPICO": "EPIQUE",
		"LEGENDARIO": "LEGENDAIRE",
		"ADIÓS A LAS CANCHAS": "ADIEU AUX TERRAINS",
		"{0} TEMPORADAS · SE RETIRA A LOS {1}": "{0} SAISONS · RETRAITE A {1} ANS",
		"JUGO HASTA EL FINAL": "A JOUE JUSQU'AU BOUT",
		"SE FUE CUANDO QUISO": "PARTI QUAND IL L'A VOULU",
		"EL CUERPO DIJO BASTA": "LE CORPS A DIT STOP",
		"TU LEGADO": "TON HERITAGE",
		"por rango": "par rang",
		"Club: {0} partidos  ({1}V · {2}E · {3}D)": "Club : {0} matchs  ({1}V · {2}N · {3}D)",
		"Goles: {0}   Asistencias: {1}   Media: {2}": "Buts : {0}   Passes : {1}   Note : {2}",
		"{0}: {1} partidos · {2} goles · {3} asistencias":
			"{0} : {1} matchs · {2} buts · {3} passes",
		"TOTAL: {0} partidos · {1} goles · {2} asistencias":
			"TOTAL : {0} matchs · {1} buts · {2} passes",
		"{0} títulos de equipo · {1} premios individuales":
			"{0} titres d'équipe · {1} récompenses individuelles",
		"TUS CLUBES": "TES CLUBS",
		"EMPEZAR OTRA CARRERA": "COMMENCER UNE AUTRE CARRIERE",
		"ENTRAR AL MUSEO": "ENTRER AU MUSEE",
		"TE QUIEREN DE VUELTA": "ON TE VEUT DE RETOUR",
		"JUGASTE AQUÍ": "TU AS JOUE ICI",
		"Ya jugaste aquí, y no te han olvidado.": "Tu as déjà joué ici, et ils ne t'ont pas oublié.",
		"Su {0} tiene {1}. Tú vuelves con {2}.": "Leur {0} est à {1}. Tu reviens à {2}.",
		"¿FIRMAS?": "SIGNER ?",
		"{0} · {1} por temporada, {2} años.": "{0} · {1} par saison, {2} ans.",
		"Vuelves como agente libre y sin traspaso. Es la única vuelta que tiene esta carrera: si la firmas, el retiro que viene después ya es el definitivo.": "Tu reviens comme agent libre, sans transfert. C'est le seul retour de cette carrière : si tu signes, la retraite qui suivra sera la vraie.",
		"FIRMAR Y VOLVER": "SIGNER ET REVENIR",
		"¿VOLVER A JUGAR?": "REJOUER ?",
		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos. Volverías con 10 puntos menos en todas tus habilidades.": "Ecouter les offres coûte une année : le monde continue sans toi et tu vieillis sans jouer. Tu reviendrais avec 10 points de moins dans chaque compétence.",
		"VER QUIÉN ME QUIERE": "VOIR QUI ME VEUT",


		"¿SALIR DEL RETIRO?": "SORTIR DE LA RETRAITE ?",
		"Escuchar ofertas cuesta un año, y vuelves con 10 menos en todo.": "Ecouter des offres coûte un an, et tu reviens avec 10 de moins partout.",
		"SÍ, VUELVO": "OUI, JE REVIENS",
		"YA PAGASTE EL AÑO": "TU AS DEJA PAYE L'ANNEE",
		"CUESTA UN AÑO · 10 MENOS EN TODO": "COUTE UN AN · 10 DE MOINS PARTOUT",
		"¿CON QUIÉN VUELVES?": "AVEC QUI REVIENS-TU ?",
		"VOLVER AL MUSEO": "RETOUR AU MUSEE",


		"Escuchar ofertas cuesta un año: el mundo sigue sin ti y tú cumples años sin jugarlos.": "Ecouter les offres coûte une année : le monde continue sans toi et tu vieillis sans jouer.",
		"LO QUE CUESTA": "CE QUE CA COUTE",
		"HABILIDADES": "COMPETENCES",
		"VUELVES": "TU REVIENS",
		"EL ÚLTIMO VISTAZO": "UN DERNIER REGARD",
		"años": "ans",
		"tu OVR": "ton OVR",
		"Ni una copa detrás del cristal. Por eso vuelves.": "Pas une seule coupe derrière la vitre. C'est pour ça que tu reviens.",
		"Todo eso ya lo ganaste. Y aun así te vas a poner las botas otra vez.": "Tu as déjà gagné tout ça. Et pourtant tu vas rechausser les crampons.",
		"Se está bien aquí dentro. Pero aquí dentro ya no pasa nada.": "On est bien ici. Mais ici, il ne se passe plus rien.",
		"EL AÑO QUE TE PERDISTE": "L'ANNEE MANQUEE",
		"La liga la ganó {0}.": "{0} a gagné le championnat.",
		"No llamó nadie. El teléfono de un retirado de tu edad suena poco, y ese silencio también es una respuesta.": "Personne n'a appelé. Le téléphone d'un retraité de ton âge sonne peu, et ce silence est aussi une réponse.",
		"MUSEO": "MUSEE",
		"SALIR DEL MUSEO": "SORTIR DU MUSEE",
		"NO QUEDAN RANURAS": "PLUS D'EMPLACEMENTS",
		"Todas las ranuras tienen carrera. Cuelga esta placa en el SALÓN DE LA FAMA o borra una desde AJUSTES para empezar otra.": "Tous les emplacements sont occupés. Accroche cette plaque au PANTHEON ou efface-en un depuis REGLAGES pour en commencer une autre.",
		"ELEGIR CARRERA": "CHOISIR UNE CARRIERE",
		"Tres carreras, cada una con su propia partida.":
			"Trois carrières, chacune avec sa propre partie.",
		"RETIRADO · {0} PARTIDOS · {1} GOLES": "RETRAITE · {0} MATCHS · {1} BUTS",
		"RETIRADO · {0} PARTIDOS": "RETRAITE · {0} MATCHS",
		"MANTÉN PULSADO PARA BORRAR": "MAINTIENS APPUYE POUR SUPPRIMER",
		"TEMPORADA {0} · {1} AÑOS · {2} PJ": "SAISON {0} · {1} ANS · {2} MJ",
		"¿BORRAR ESTA CARRERA?": "SUPPRIMER CETTE CARRIERE ?",
		"Se pierde la carrera de {0}: nivel, dinero, contrato y palmarés.\nLas otras dos"
		+ " no se tocan.":
			"Tu perds la carrière de {0} : niveau, argent, contrat et"
			+ " palmarès.\nLes deux autres ne sont pas touchées.",
		"TU JUGADOR": "TON JOUEUR",
		"TU CLUB · SE CAMBIA EN EL MERCADO": "TON CLUB · SE CHANGE AU MERCATO",
		"Se guarda solo.": "Ça s'enregistre tout seul.",
		"GUARDAR": "ENREGISTRER",
		"¡Peina {0}!": "{0} la dévie !",
		"¡La peina!": "Déviée !",
		"¡Cambio de banda!": "Changement d'aile !",
		"Te quedaste con la salida corta": "Tu t'es contenté de la sortie courte",
		"El pase no llegó": "La passe n'est pas arrivée",
		"¡Saliste jugando!": "Tu es sorti en jouant !",
		"Te encerraron": "Ils t'ont enfermé",
		"Toca a tu jugador para empezar": "Touche ton joueur pour commencer",
		"Te frenaron con falta": "Ils t'ont arrêté en faute",
		"¡El perro cortó la jugada!": "Le chien a coupé l'action !",

		"El rival se repliega": "L'adversaire se replie",
		"Falta en tu campo: se reanuda": "Faute dans ton camp : on reprend",

		"SAL JUGANDO": "RELANCE EN JOUANT",

		"¡DE PRIMERA! PASE DE {0}": "EN UNE TOUCHE ! PASSE DE {0}",
		"¡DE PRIMERA! TE LA PONEN": "EN UNE TOUCHE ! LA PASSE ARRIVE",
		"¡CABEZAZO! TE LA CUELGAN": "TETE ! LE CENTRE ARRIVE",
		"¡CABEZAZO! CENTRO DE {0}": "TETE ! CENTRE DE {0}",
		"¡VOLEA! TE LA CUELGAN": "VOLEE ! LE CENTRE ARRIVE",
		"¡VOLEA! CENTRO DE {0}": "VOLEE ! CENTRE DE {0}",
		"¡CHILENA! TE LA CUELGAN": "RETOURNE ! LE CENTRE ARRIVE",
		"¡CHILENA! CENTRO DE {0}": "RETOURNE ! CENTRE DE {0}",
		"¡CÓRNER! TE LA CUELGAN": "CORNER ! LE CENTRE ARRIVE",
		"¡CÓRNER! LO SACA {0}": "CORNER ! {0} LE TIRE",
		"¡FALTA! TE LA CUELGAN": "COUP FRANC ! LE CENTRE ARRIVE",
		"¡FALTA! LA CUELGA {0}": "COUP FRANC ! {0} LE BROSSE",

		"Salida de meta": "Relance du gardien",
		"Sacas de meta con tu portero: juégala en corto o revienta el pase largo. Luego juegas con quien la recibe.": "Tu joues le six mètres avec ton gardien : relance court ou tente le long ballon. Ensuite, tu joues avec celui qui la reçoit.",
		"Apunta a un compañero y suelta": "Vise un coéquipier et relâche",
		"SALIDA DE META": "RELANCE DU GARDIEN",
		"Te cortaron el pase": "Ta passe a été interceptée",
		"PASE CORTADO": "INTERCEPTION",

		"Salida jugada": "Sortie de balle",
		"Naces en tu campo con el balón. Conduce, pásala y avanza: cada pase lo golpeas tú y juegas con quien la recibe.": "Tu pars de ton camp avec le ballon. Conduis, passe et avance : chaque passe, c'est toi qui la frappes, et tu joues celui qui la reçoit.",
		"Arrastra para conducir; apunta a un compañero y suelta": "Glisse pour conduire ; vise un coéquipier et relâche",
		"Saque de banda corto": "Touche courte",
		"Saque de banda al área": "Touche dans la surface",
		"Te la sacan de banda al área. No se controla: espera a que llegue y cabecea a puerta.": "On te fait la touche dans la surface. Pas de contrôle : attends-la et reprends de la tête.",
		"Espera el saque; luego jala y suelta": "Attends la touche ; puis tire et relâche",
		"Un compañero te la saca de banda: la controlas solo y juegas libre. Regatea, tira o devuélvesela.": "Un coéquipier joue la touche : tu contrôles tout seul et tu joues librement. Dribble, tire ou rends-la-lui.",
		"¡SAQUE DE BANDA!": "TOUCHE !",
		"¡{0} SACA DE BANDA!": "TOUCHE DE {0} !",
		"Naces en tu campo con el balón y el arco lejos. Conduce, pásala a un compañero y sigue: el pase se golpea como un tiro y juegas con quien la recibe. Si te quedas atrás sin avanzar, el rival aprieta. Después, el mano a mano: tira ya, o condúcela y vuelve al círculo para parar en seco y apuntar con calma.": "Tu pars de ton camp avec le ballon et le but au loin. Conduis, passe à un coéquipier et continue : la passe se frappe comme un tir et tu joues celui qui la reçoit. Si tu restes derrière sans avancer, l'adversaire presse plus fort. Ensuite, le un contre un : tire tout de suite, ou conduis-le et reviens au cercle pour t'arrêter net et viser calmement.",
		"Primero sal jugando desde tu campo: conduce, pasa y llega hasta el arco. Después, el mano a mano: 1 gol en 3 intentos.": "D'abord sors le ballon proprement de ton camp : conduis, passe et va jusqu'au but. Ensuite, le un contre un : 1 but en 3 tentatives.",
		"Pásala a un compañero y avanza hacia el arco.": "Passe à un coéquipier et avance vers le but.",
		"PASA Y AVANZA": "PASSE ET VA",
		"ATAJADA": "ARRETEE",
		"DESPEJE": "DEGAGEMENT",
		"FUERA DE JUEGO": "HORS-JEU",
		"BALÓN PERDIDO": "BALLON PERDU",


		"TE RESBALASTE": "GLISSADE",
		"SIN CONTACTO": "RATE",
		"CAMBIO DE BANDA": "CHANGEMENT D'AILE",
		"PASE FALLADO": "MAUVAISE PASSE",
		"SALIDA LIMPIA": "SORTIE PROPRE",
		"TOCA PARA SALIR": "TOUCHE POUR SORTIR",
		"ENCERRADO": "ENFERME",
		"FALTA AL SALIR": "FAUTE A LA SORTIE",
		"LA COBRA OTRO": "UN AUTRE LA TIRE",
		"¡PRÓRROGA! Dos tiempos de 15 minutos.": "PROLONGATION ! Deux périodes de 15 minutes.",
		"Fin del primer tiempo extra.": "Fin de la première période de prolongation.",
		"¡TE TOCA A TI!": "A TOI !",
		"Cobra tu compañero…": "Ton coéquipier s'avance…",
		"Cobra el rival…": "Le tireur adverse s'avance…",
		"Cobra {0}…": "{0} s'avance…",
		"Arrastra hacia atrás para correr · lleva el balón a la zona roja":
			"Glisse vers l'arrière pour courir · amène le ballon dans la zone rouge",
		"Arrastra hacia atrás para correr · cruza al campo rival":
			"Glisse vers l'arrière pour courir · passe dans leur moitié de terrain",
		"CAMPO RIVAL · TIRA O PASA": "CAMP ADVERSE · TIRE OU PASSE",
		"CAMPO RIVAL · TIRA": "CAMP ADVERSE · TIRE",


		"LLEVA EL BALON AL DISCO ROJO": "AMENE LE BALLON AU DISQUE ROUGE",




		"AL DISCO ROJO": "VERS LE DISQUE ROUGE",
		"RASA Y LENTA": "RASANTE ET LENTE",
		"SUBE Y CAE": "ELLE MONTE ET RETOMBE",
		"COMBA": "EFFET",
		"EL CENTRO PEGA MAS FUERTE": "LE CENTRE FRAPPE LE PLUS FORT",
		"DENTRO TIRAS / FUERA REGATEAS": "DEDANS TU TIRES / DEHORS TU DRIBBLES",
		"IZQUIERDO CONDUCE / DERECHO TIRA": "GAUCHE CONDUIT / DROIT TIRE",
		"PASALA": "PASSE-LA",
		"No hay botón de pase: pasar es TIRAR apuntando a un compañero, y el balón se lo queda quien llegue antes. Tienes dos: el de fuera del área y el de dentro. Si tu pase cae fuera del área, pasas a jugar con quien lo recibe. Si cae dentro, no hay control que valga: remata de primera. Y para verlos: un toque en el pasto, fuera de tu círculo y sin nadie debajo, gira la vista a la banda y te enseña a los compañeros; otro toque y vuelve.":
			"Il n'y a pas de bouton de passe : passer, c'est TIRER en visant un coéquipier, et le ballon revient à celui qui arrive le premier. Tu en as deux : celui hors de la surface et celui dedans. Si ta passe tombe hors de la surface, tu passes à jouer avec celui qui la reçoit. Si elle tombe dedans, aucun contrôle n'est possible : il reprend de volée. Et pour les voir : un appui sur la pelouse, hors de ton cercle et sans personne dessous, tourne la vue vers la touche et te montre tes coéquipiers ; un autre appui et elle revient.",
		"Un pase de práctica. Después, 1 gol en 3 pases al área.": "Une passe d'entraînement. Ensuite, 1 but sur 3 passes dans la surface.",
		"El primero no puntúa. En los otros, cuantos menos intentos gastes, más estrellas.": "La première ne compte pas. Sur les autres, moins tu dépenses d'essais, plus tu as d'étoiles.",
		"Apunta a un compañero y suelta.": "Vise un coéquipier et relâche.",
		"FUERA LO JUEGAS TU / DENTRO REMATA": "DEHORS TU CONTINUES / DEDANS IL REPREND",
		"SE ACABO EL REGATE": "FINI LE DRIBBLE",
		"Ahora aprendes a TIRAR": "Maintenant tu apprends à TIRER",
		"LO TIENES": "TU L'AS",
		"NO SUPERASTE LA PRUEBA": "EXERCICE NON VALIDE",
		"OTRA VEZ": "ENCORE UNE FOIS",
		"Aquí no se avanza hasta que te sale. Tómate el tiempo que necesites.": "Ici on n'avance pas tant que ce n'est pas réussi. Prends tout le temps qu'il faut.",
		"Eso es la escuela: cada ejercicio te enseña un gesto y te paga en estrellas. Quedan unos pocos, y sacan mejores ofertas de club.": "C'est ça l'école : chaque exercice t'apprend un geste et te paie en étoiles. Il en reste quelques-uns, et ils font venir de meilleures offres de club.",
		"PARA EN SECO Y APUNTA": "ARRETE-TOI NET ET VISE",
		"BUSCA LA OTRA BANDA": "CHERCHE L'AUTRE COTE",
		"Todo se decide en tu círculo: con el dedo DENTRO apuntas y tiras, y en cuanto lo sacas conduces. Es el mismo arrastre sin levantar el dedo: mira la palabra del círculo, que dice TIRO o REGATE según dónde estés. Volver a entrar te para en seco y te devuelve la puntería. Jala hacia atrás, como una resortera: la guía apunta hacia adelante. Al soltar, toca el balón — y dónde lo tocas manda. La primera vez el balón se pinta por zonas: arriba sale rasa y lenta, abajo sube y cae, a los lados comba. Y cuanto más al borde, menos potencia: el pepinazo va al centro. Con dos dedos giras la vista y apuntas desde otro ángulo.":
			"Tout se décide dans ton cercle : le doigt DEDANS tu vises et tu frappes, dès que tu le sors tu conduis. C'est le même glissement sans lever le doigt : regarde le mot du cercle, il dit TIR ou DRIBBLE selon où tu es. Revenir dedans t'arrête net et te rend la visée. Tire vers l'arrière comme un lance-pierre : le guide pointe vers l'avant. En relâchant, touche le ballon — et l'endroit où tu le touches commande. La première fois, le ballon est peint par zones : en haut elle part rasante et lente, en bas elle monte et retombe, sur les côtés elle prend de l'effet. Et plus tu vas vers le bord, moins il y a de puissance : la frappe sèche part du centre. Avec deux doigts tu fais tourner la vue et tu vises sous un autre angle.",
		"Estos son CENTROS: el balón se cuelga al área. En un córner ya nace en CENTRO; lo dice el indicador de arriba a la derecha. Para cambiar entre CENTRO (colgado) y TIRO (raso), toca con otro dedo mientras apuntas, o toca ese indicador. Busca la cabeza de un compañero, no el arco. Y al cerrar, el cambio de banda: el mismo servicio pero buscando al compañero libre de la otra punta.": "Ce sont des CENTRES : le ballon est déposé dans la surface. Un corner démarre déjà en CENTRE ; l'indicateur en haut à droite le dit. Pour basculer entre CENTRE (en cloche) et TIR (à ras de terre), touche avec un autre doigt en visant, ou touche cet indicateur. Cherche la tête d'un coéquipier, pas le but. Et pour finir, le changement d'aile : le même service, mais en cherchant le coéquipier libre à l'opposé.",
		"Marca 1 gol en 6 intentos: 3 córners y 3 centros. Y sirve el cambio de banda.": "Marque 1 but en 6 essais : 3 corners et 3 centres. Et sers le changement d'aile.",
		"El gol puede caer en cualquiera de los seis. Cuanto antes, más estrellas. El cambio de banda es ensayo y no puntúa.": "Le but peut tomber sur n'importe lequel des six. Plus tôt, plus d'étoiles. Le changement d'aile est un entraînement et ne compte pas.",
		"METE DOS GOLES": "MARQUE DEUX BUTS",
		"CRUZA Y ENCARA": "TRAVERSE ET AFFRONTE",
		"CUELGALA AL AREA": "CENTRE DANS LA SURFACE",
		"SALVA LA BARRERA": "PAR-DESSUS LE MUR",
		"REGATEA HASTA EL MEDIO CAMPO": "DRIBBLE JUSQU'AU MILIEU DE TERRAIN",


		"Salir de atrás": "Relance depuis l'arrière",
		"Encerrado en tu banda": "Coincé sur la ligne",
		"Atrapado en el medio": "Pris au milieu",
		"Contra el bloque": "Contre le bloc",
		"Te salta el delantero": "L'attaquant te saute dessus",
		"Desde tu área": "Depuis ta surface",
		"ZONA {0} DE {1}": "ZONE {0} SUR {1}",
		"Busca al compañero de la otra banda · dentro del círculo pasas":
			"Cherche le coéquipier de l'autre côté · dans le cercle tu passes",
		"El video salió con un tamaño raro": "La vidéo est sortie avec une taille bizarre",
		"Tu gol más lejano del año: {0} m.": "Ton but le plus lointain de l'année : {0} m.",
		"Tu pase más largo del año: {0} m.": "Ta passe la plus longue de l'année : {0} m.",
		"BUSCAR CLUB O JUGADOR": "CHERCHER UN CLUB OU UN JOUEUR",
		"Escribe al menos dos letras para buscar.": "Tape au moins deux lettres pour chercher.",
		"Nada encaja con esa búsqueda.": "Rien ne correspond à cette recherche.",
		"{0} · {1} DE {2} — AFINA LA BUSQUEDA": "{0} · {1} SUR {2} — AFFINE LA RECHERCHE",
		"PAIS": "PAYS",
		"SI": "OUI",
		"PIDE ALIENTO": "CHAUFFE-LES",
		"A LO TUYO": "TON JEU",
		"RUGE {0} % · PITA {1} %": "OLE {0} % · HOU {1} %",
		"LA GRADA RUGE": "OVATION",
		"PIDES ALIENTO Y LA GRADA RUGE": "TU CHAUFFES LA FOULE: OVATION",
		"PIDES ALIENTO Y LA GRADA TE PITA": "TU CHAUFFES LA FOULE : ON SIFFLE",
		"¡{0}, {0}!": "{0} ! {0} !",
		"¡{0}, TRAIDOR!": "{0}, TRAITRE !",
		"La entrada": "Le tacle",
		"Toca cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "Touche quand le repère passe sur le blanc : tu tacles et tu récupères le ballon proprement. Sur le rouge, c'est faute ; sur le jaune, carton.",
		"Toca en el blanco para barrerte": "Touche sur le blanc pour tacler",
		"¡BALÓN LIMPIO!": "TACLE PROPRE !",
		"¡AMARILLA!": "CARTON JAUNE !",
		"¡SE TE VA!": "ECHAPPE !",
		"La barrera tapa el camino raso: elévalo por encima pegándole al balón abajo. El costado lo curva, si te atreves. Y el examen final: el penal. Respira. Tú eliges la esquina.": "Le mur bloque le chemin rasant : lève-le par-dessus en frappant le ballon en bas. Le côté le fait courber, si tu oses. Et l'examen final : le penalty. Respire. C'est toi qui choisis le coin.",
		"WASD CONDUCE / FLECHAS TIRAN": "WASD MENE / FLECHES TIRENT",
		"Pulsa WASD y corres hacia el disco.": "Appuie sur WASD et tu cours vers le disque.",
		"Pulsa WASD y conduces.": "Appuie sur WASD et tu conduis.",
		"Mantén una flecha y apuntas.": "Maintiens une flèche et tu vises.",
		"Pulsa WASD y conduces: cruza la raya.": "Appuie sur WASD et tu conduis : franchis la ligne.",
		"Pulsa WASD y avanza hacia el arco.": "Appuie sur WASD et avance vers le but.",
		"Mantén una flecha y pásala a un compañero.": "Maintiens une flèche et passe à un coéquipier.",
		"Mantén una flecha y suelta para pegarle a la falta.": "Maintiens une flèche et relâche pour frapper le coup franc.",
		"Pulsa WASD para empezar": "Appuie sur WASD pour commencer",
		"WASD para correr · cruza al campo rival": "WASD pour courir · passe dans leur moitié de terrain",
		"WASD para correr · lleva el balón a la zona roja": "WASD pour courir · emmène le ballon dans la zone rouge",
		"Pulsa {0} en el blanco para barrerte": "Appuie sur {0} sur le blanc pour tacler",
		"PULSA WASD PARA SALIR": "WASD POUR SORTIR",
		"Pulsa {0} cuando la marca pase por el blanco: te barres y le quitas el balón limpio. En el rojo le haces falta; en el amarillo, te sacan tarjeta.": "Appuie sur {0} quand le repère passe sur le blanc : tu tacles et tu récupères le ballon proprement. Sur le rouge, c'est faute ; sur le jaune, tu prends un carton.",
		"VOLVIO, Y SE FUE POR LA PUERTA DE ATRAS": "REVENU, PUIS PARTI PAR LA PETITE PORTE",
		"LA VUELTA": "LE RETOUR",
		"Bota de Oro de Europa": "Soulier d'Europe",
		"BOTA DE ORO DE EUROPA": "SOULIER D'EUROPE",
		"Máximo Asistente del Mundial": "Meilleur passeur du Mondial",
		"Máximo Asistente de la Copa continental": "Meilleur passeur de la Coupe continentale",
		"Asist. (Mundial)": "Passes (Mondial)",
		"Asist. (Continental)": "Passes (Cont.)",
		"ASISTENTE DEL MUNDIAL": "PASSEUR DU MONDIAL",
		"Once Ideal de la Liga": "Équipe type de la Ligue",
		"Once Ideal": "Équipe type",
		"Bota de Oro (Europa)": "Soulier (Europe)",
		"Prometiste un gol, y lo metiste.": "Tu avais promis un but, et tu l'as marqué.",
		"Prometiste un gol. Hoy no llegó.": "Tu avais promis un but. Il n'est pas venu aujourd'hui.",
		"Cumpliste tu promesa de gol ante el {0}": "Tu as tenu ta promesse de but face à {0}",
		"Prometiste un gol ante el {0} y no llegó": "Tu avais promis un but face à {0} et il n'est pas venu",
		"{0} cumplió su promesa de gol ante el {1}": "{0} a tenu sa promesse de but face à {1}",
		"{0} prometió un gol ante el {1} y no llegó": "{0} avait promis un but face à {1} et il n'est pas venu",
		"DIBUJO DEL SHORT": "MOTIF DU SHORT",
		"Acento del short": "Accent du short",
		"DIBUJO DE LAS MEDIAS": "MOTIF DES CHAUSSETTES",
		"Acento de las medias": "Accent des chaussettes",
		"Cuello polo": "Col polo",
		"Fin de manga": "Bout de manche",
		"FILO": "LISERE",
		"DOBLE FILO": "DOUBLE LISERE",
		"RIBETE": "OURLET",
		"FILO Y RIBETE": "LISERE + OURLET",
		"PANEL": "PANNEAU",
		"ABERTURA": "FENTE",
		"VUELTA FINA": "REVERS FIN",
		"DOBLE VUELTA": "DOUBLE REVERS",
		"DOS RAYAS": "DEUX RAYURES",
		"RAYA ALTA": "RAYURE HAUTE",
		"BANDA ANCHA": "BANDE LARGE",
		"AROS ANCHOS": "CERCLES LARGES",
		"VUELTA DE COLOR": "REVERS COLORE",
		"FRANJA": "BANDE",
		"DOS FRANJAS": "DEUX BANDES",
		"SHORT, MEDIAS Y CUELLO": "SHORT, CHAUSSETTES ET COL",
		"PICA CUANDO SE CIERRE": "TAPE A LA FERMETURE",
		"¡CAÑO!": "PONT !",
		"SE LO OLIÓ": "IL A VU !",
		"YA ESTÁ EN SU HUECO": "A SA PLACE",
		"EN TU VITRINA": "DANS TA VITRINE",
		"TODAVÍA SE HABLA DEL CAÑO DE {0} A {1}": "ON PARLE ENCORE DU PONT DE {0} SUR {1}",
		"{1} YA NO SE LE ACERCA TANTO A {0} TRAS EL CAÑO": "{1} N'OSE PLUS COLLER {0} APRES LE PONT",
		"LA GRADA PIDE OTRO CAÑO DE {0}": "LA TRIBUNE RECLAME UN AUTRE PONT DE {0}",
		"{1} LE LEYÓ EL CAÑO A {0} Y NO SE LO PERDONA": "{1} A VU VENIR LE PONT DE {0} ET LE LUI RAPPELLE",
		"{0} QUISO EL CAÑO Y LA GRADA AÚN SILBA": "{0} A TENTE LE PONT ET LA TRIBUNE SIFFLE ENCORE",
		"PRESENTACIÓN DEL TÍTULO": "PRESENTATION DU TITRE",
		"ANTE TU AFICIÓN": "DEVANT TES SUPPORTERS",
		"JUEGOS DE VERANO": "JEUX D'ETE",
		"Campeón de Verano": "Champion d'été",
		"Oro de Verano": "Or d'été",
		"Ganar el oro en los Juegos de Verano.": "Remporter l'or aux Jeux d'été.",
		"JUEGOS DE VERANO: oro para {0}": "JEUX D'ETE : l'or pour {0}",
		"{0}: ORO en los Juegos de Verano": "{0} : OR aux Jeux d'été",
		"{0}: plata en los Juegos de Verano": "{0} : argent aux Jeux d'été",
		"{0}: bronce en los Juegos de Verano": "{0} : bronze aux Jeux d'été",
		"El juego no trae nombres, escudos ni marcas reales. Importa sólo lo que tengas derecho a usar: es responsabilidad tuya.": "Le jeu ne contient aucun nom, blason ni marque réels. N'importe que ce que tu as le droit d'utiliser : c'est ta responsabilité.",
		"¡El recogepelotas hace tiempo!": "Le ramasseur gagne du temps !",
		"¡BALÓN LARGO!": "BALLON LONG !",
		"¡{0} TE LA CUELGA!": "{0} TE L'ENVOIE !",
		"¡CONTROLADA!": "CONTROLE !",
		"Primas por premios": "Primes de prix",
		"Prima de firma": "Prime à la signature",
		"+${0} DE PRIMA": "+${0} DE PRIME",
		"SI EL CLUB CUMPLE": "SI CLUB REUSSIT",
		"GUARDANDO EN TU ALBUM...": "SAUVEGARDE...",
		"EN TU ALBUM · %d/%d": "DANS L'ALBUM · %d/%d",
		"ALBUM LLENO %d/%d · BORRA UNO EN COLECCION": "ALBUM PLEIN %d/%d · EFFACE-EN UN DANS COLLECTION",
		"SIN ESPACIO EN EL TELEFONO": "TELEPHONE PLEIN",
		"NO SE PUDO GUARDAR · TOCA PARA REINTENTAR": "ECHEC · TOUCHE POUR REESSAYER",
		"¡Se queda corto!": "Trop court !",
		"Cosechas del huerto": "Récoltes du potager",
		"PLANTILLAS DE COMUNIDAD": "EQUIPES COMMUNAUTE",
		"Packs que hace la gente. Cada uno vive en la web de quien lo hizo.": "Des packs faits par les joueurs. Chacun vit sur le site de son créateur.",
		"BUSCAR PACK O CREADOR": "CHERCHER PACK/AUTEUR",
		"BÁJALO": "PRENDS",
		"en su web": "sur son site",
		"TÓCALO": "TOUCHE",
		"en Descargas": "dans Téléchargements",
		"IMPORTA": "IMPORTE",
		"se abre en el juego": "s'ouvre dans le jeu",
		"CARGANDO": "EN COURS",
		"TODAVÍA NO HAY": "PAS ENCORE",
		"Cuando alguien comparta un pack, sale aquí.": "Quand quelqu'un partagera un pack, il apparaîtra ici.",
		"Conéctate a internet para ver la lista.": "Connecte-toi à internet pour voir la liste.",
		"REINTENTAR": "REESSAYER",
		"¡ROMPISTE UNA CUERDA DE LA RED!": "TU AS CASSE UNE CORDE DU FILET !",
		"¡LAS DOS CUERDAS DE LA RED!": "LES DEUX CORDES DU FILET !",
		"¡El staff arregla la red!": "Le staff répare le filet !",
	},




	"sim": {




		"simFINAL DEL PARTIDO": "FIN DU MATCH",
		"simDESCANSO": "MI-TEMPS",
		"simGOOOL": "BUUUT",
		"simGOLAZO": "BUT MONSTRE",
		"simGOLES": "BUTS",
		"simGOL": "BUT",
		"simASISTENCIA": "PASSE DECISIVE",
		"simASISTE": "PASSE DE",
		"simATAJADÓN": "QUEL ARRET",
		"simPARADA": "ARRET",
		"simPOSTE": "POTEAU",
		"simTRAVESAÑO": "BARRE",
		"simCABECEA": "TETE",
		"simREMATA": "TIRE",
		"simREMATE": "TIR",
		"simDISPARO": "TIR",
		"simCÓRNER": "CORNER",
		"simPENAL": "PENALTY",
		"simENTRA": "ENTRE",
		"simCAMBIO": "CHANGEMENT",
		"simTIRO LIBRE": "COUP FRANC",
		"simFUERA DE JUEGO": "HORS-JEU",
		"simAMARILLA": "JAUNE",
		"simROJA": "ROUGE",
		"simEXPULSADO": "EXPULSE",
		"simLESIÓN": "BLESSURE",
		"simLESIONADO": "BLESSE",
		"simFALTA": "FAUTE",
		"simPÉRDIDA": "PERTE DE BALLON",
		"¡GOL DE {0}!": "BUT DE {0} !",
		"ASISTE {0}": "PASSE DECISIVE DE {0}",
		"DESCANSO": "MI-TEMPS",
		"FINAL DEL PARTIDO": "FIN DU MATCH",
		"TOQUE EN EL MEDIO CAMPO": "PETITES PASSES AU MILIEU",
		"TU EQUIPO CONTROLA EL BALÓN": "TON EQUIPE GARDE LE BALLON",
		"EL RIVAL PRESIONA ARRIBA": "L'ADVERSAIRE PRESSE HAUT",
		"FALTA EN MEDIA CANCHA": "FAUTE AU MILIEU DE TERRAIN",
		"SAQUE DE BANDA": "TOUCHE",
		"LA AFICIÓN ANIMA": "LES SUPPORTERS ENCOURAGENT",
		"DUELO FÍSICO EN EL CENTRO": "DUEL PHYSIQUE AU MILIEU",
		"EL ÁRBITRO DEJA SEGUIR": "L'ARBITRE LAISSE JOUER",
		"PASES EN CORTO, SIN PRISA": "PETITES PASSES, SANS PRECIPITATION",
		"CÓRNER SIN REMATE CLARO": "CORNER SANS DANGER",
		"FUERA DE JUEGO SEÑALADO": "HORS-JEU SIFFLE",
		"BALÓN LARGO SIN DUEÑO": "BALLON LONG, PERSONNE NE LE PREND",
		"TU DEFENSA CORTA EL AVANCE": "TA DEFENSE COUPE L'ACTION",
		"EL PORTERO ACHICA A TIEMPO": "LE GARDIEN REDUIT L'ANGLE A TEMPS",
		"CAMBIO DE ORIENTACIÓN AL OTRO COSTADO": "CHANGEMENT D'AILE",
		"PRESIÓN TRAS PÉRDIDA EN CAMPO RIVAL": "PRESSING APRES PERTE DANS LEUR CAMP",
		"EL BALÓN NO QUIERE ENTRAR EN EL ÁREA": "LE BALLON REFUSE D'ENTRER DANS LA SURFACE",
		"AMARILLA POR CORTAR EL CONTRA": "JAUNE POUR AVOIR STOPPE LA CONTRE-ATTAQUE",
		"LA GRADA PIDE MÁS RITMO": "LES TRIBUNES VEULENT PLUS DE RYTHME",
		"SE JUEGA A UN SOLO ARCO": "ON NE JOUE QUE DANS UN SEUL CAMP",
		"PARADO EL JUEGO POR UN GOLPE": "JEU ARRETE POUR UN COUP",
		"BUEN RELEVO EN LA BANDA": "BONNE COUVERTURE SUR LE COTE",
		"CENTRO PASADO, NO HABÍA NADIE": "CENTRE TROP LONG, PERSONNE AU RENDEZ-VOUS",
		"EL MEDIOCAMPO SE PARTE EN DOS": "LE MILIEU DE TERRAIN SE DECHIRE EN DEUX",
		"CÓRNER BOTADO EN CORTO": "CORNER JOUE COURT",
		"FALTA AL BORDE DEL ÁREA, SE ARMA LA BARRERA": "FAUTE AUX 18 METRES, LE MUR SE FORME",
		"EL ÁRBITRO MIDE LOS NUEVE METROS": "L'ARBITRE MESURE LES NEUF METRES",
		"SAQUE DE ESQUINA QUE DESPEJA EL PRIMER PALO": "CORNER DEGAGE AU PREMIER POTEAU",
		"TIRO LIBRE LEJANO QUE SE VA A LA GRADA": "COUP FRANC LOINTAIN QUI FINIT DANS LES TRIBUNES",
		"SAQUE DE PUERTA LARGO, A DISPUTAR": "LONGUE RELANCE DU GARDIEN, BALLON DISPUTE",
		"SEGUNDA JUGADA DEL CÓRNER, RECHAZA LA ZAGA": "DEUXIEME BALLON DU CORNER, LA DEFENSE DEGAGE",
		"SAQUE DE BANDA LARGO AL ÁREA": "LONGUE TOUCHE DANS LA SURFACE",
		"ROBO EN TRES CUARTOS Y VUELTA A EMPEZAR": "BALLON RECUPERE HAUT, ET ON RECOMMENCE",
		"DOS HOMBRES AL BALÓN, NO LO DEJAN SALIR": "DEUX JOUEURS SUR LE BALLON, PAS DE SORTIE",
		"LA ZAGA SE JUNTA Y CIERRA EL PASILLO": "LA DEFENSE SE RESSERRE ET FERME LE COULOIR",
		"DESPEJE LARGO PARA QUITARSE EL AGOBIO": "DEGAGEMENT LONG POUR SOULAGER LA PRESSION",
		"RUEDA EL BALÓN DE LADO A LADO": "LE BALLON CIRCULE D'UN COTE A L'AUTRE",
		"PAREDES EN EL CENTRO DEL CAMPO": "UNE-DEUX AU MILIEU DE TERRAIN",
		"CONTRA A CAMPO ABIERTO QUE SE QUEDA EN NADA": "CONTRE-ATTAQUE EN ESPACE QUI NE DONNE RIEN",
		"TODOS CORREN, NADIE PIENSA": "TOUT LE MONDE COURT, PERSONNE NE REFLECHIT",
		"EL RITMO BAJA Y EL PARTIDO SE ADORMECE": "LE RYTHME BAISSE ET LE MATCH S'ENDORT",
		"SE JUEGA CON EL FRENO DE MANO": "ON JOUE AVEC LE FREIN A MAIN",
		"PIDE EL CAMBIO UN JUGADOR TOCADO": "UN JOUEUR TOUCHE DEMANDE A SORTIR",
		"PROTESTAS AL LINIER DESDE EL BANQUILLO": "PROTESTATIONS AU JUGE DE TOUCHE DEPUIS LE BANC",
		"APLAUDE LA GRADA UNA JUGADA DE OFICIO": "LES TRIBUNES APPLAUDISSENT UN GESTE TECHNIQUE",
		"EL BALÓN SE VA AL FONDO SIN DUEÑO": "LE BALLON SORT SANS QUE PERSONNE NE LE SUIVE",
		"{0} REMATA FUERA POR POCO": "{0} TIRE JUSTE A COTE",
		"¡{0} LA TUVO, GRAN PARADA!": "{0} Y ETAIT PRESQUE, QUEL ARRET !",
		"{0} CABECEA ALTO": "{0} MET SA TETE AU-DESSUS",
		"DISPARO DE {0}, ¡ATAJADÓN!": "TIR DE {0}, QUEL ARRET !",
		"{0} ESTRELLA EL POSTE": "{0} TOUCHE LE POTEAU",
		"{0} REMATA DESVIADO": "{0} TIRE A COTE",


		"{0} DISPARA Y LO TAPA UN DEFENSA": "{0} FRAPPE ET UN DEFENSEUR CONTRE",
		"EL TIRO DE {0} TOCA EN UN DEFENSA Y SE VA A CÓRNER": "LE TIR DE {0} EST DEVIE EN CORNER",
		"TU DEFENSA SE TIRA Y TAPA EL DISPARO DE {0}": "TON DEFENSEUR SE JETTE ET CONTRE LE TIR DE {0}",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA, CÓRNER": "LE TIR DE {0} EST DEVIE PAR TA DEFENSE, CORNER",
		"¡GOL DE {0}! TOCA EN UN DEFENSA Y SE CUELA": "BUT DE {0} ! LE BALLON EST DEVIE ET ENTRE",
		"¡{0} DISPARA, LA DESVÍA UN DEFENSA Y ADENTRO!": "{0} FRAPPE, UN DEFENSEUR DEVIE, ET C'EST DEDANS !",
		"EL DISPARO DE {0} SE DESVÍA EN TU ZAGA Y ENTRA": "LE TIR DE {0} EST DEVIE PAR TA DEFENSE ET ENTRE",
		"¡AUTOGOL DE {0}!": "BUT CONTRE SON CAMP DE {0} !",
		"{0} LA METE EN SU PROPIA PUERTA": "{0} MARQUE CONTRE SON CAMP",


		"¡{0} SE ELEVA Y LA CLAVA DE CABEZA!": "{0} S'ELEVE ET LA PLANTE DE LA TETE !",
		"¡CABEZAZO DE {0} AL FONDO DE LA RED!": "TETE DE {0} AU FOND DES FILETS !",
		"¡{0} GANA ARRIBA Y NO PERDONA!": "{0} DOMINE DANS LES AIRS ET MARQUE !",
		"¡{0} LA ENGANCHA DE VOLEA!": "{0} LA REPREND DE VOLEE !",
		"¡{0} LA PRENDE AL AIRE Y ADENTRO!": "{0} LA FRAPPE EN L'AIR, ET C'EST DEDANS !",
		"¡SIN DEJARLA CAER! GOL DE {0}": "SANS LA LAISSER TOMBER ! BUT DE {0}",
		"¡DE CHILENA! ¡{0}, INCREÍBLE!": "EN RETOURNE ! {0}, INCROYABLE !",
		"¡CHILENA DE {0}! GOL PARA LA HISTORIA": "RETOURNE DE {0} ! UN BUT HISTORIQUE",
		"¡{0} DE CHILENA! ¡SE CAE EL ESTADIO!": "{0} EN RETOURNE ! LE STADE EXPLOSE !",
		"{0} CABECEA SOLO Y MARCA": "{0}, SEUL, MARQUE DE LA TETE",
		"LA VOLEA DE {0} SE CUELA": "LA VOLEE DE {0} FILE AU FOND",
		"{0} MARCA DE CHILENA. QUÉ CASTIGO": "{0} MARQUE EN RETOURNE. QUELLE PUNITION",
		"¡{0} CABECEA Y LA SACA EL PORTERO!": "TETE DE {0}, LE GARDIEN LA SORT !",
		"LA VOLEA DE {0} SE VA POR ENCIMA": "LA VOLEE DE {0} PASSE AU-DESSUS",
		"{0} INTENTA LA CHILENA, ¡POR POCO!": "{0} TENTE LE RETOURNE, DE PEU !",
		"CABEZAZO DE {0} AL POSTE": "TETE DE {0} SUR LE POTEAU",
		"{0} LO PRUEBA DE VOLEA, DESVIADO": "{0} TENTE LA VOLEE, A COTE",
		"TU EQUIPO REMATA FUERA": "TON EQUIPE TIRE A COTE",
		"¡CASI GOL DE TU EQUIPO!": "TON EQUIPE Y ETAIT PRESQUE !",
		"GRAN PARADA DEL PORTERO": "GRAND ARRET DU GARDIEN",
		"DISPARO DEL RIVAL, ¡ATAJADÓN!": "TIR ADVERSE, QUEL ARRET !",
		"EL RIVAL ESTRELLA EL POSTE": "L'ADVERSAIRE TOUCHE LE POTEAU",
		"EL RIVAL REMATA FUERA": "L'ADVERSAIRE TIRE A COTE",
		"CÓRNER PARA TU EQUIPO, LO CUELGA {0}": "CORNER POUR TON EQUIPE, {0} LE CENTRE",
		"FALTA PELIGROSA Y {0} SE PLANTA SOBRE EL BALÓN":
			"COUP FRANC DANGEREUX, {0} SE PLACE SUR LE BALLON",
		"{0} SACA EL CÓRNER AL SEGUNDO PALO Y DESPEJA LA ZAGA":
			"{0} TROUVE LE DEUXIEME POTEAU, LA DEFENSE DEGAGE",
		"TIRO LIBRE DE {0}: LA BARRERA LA MANDA AL CÓRNER":
			"COUP FRANC DE {0} : LE MUR RENVOIE EN CORNER",
		"{0} LA COLGÓ AL ÁREA Y EL PORTERO LA ATRAPÓ EN EL AIRE":
			"{0} CENTRE DANS LA SURFACE, LE GARDIEN LA CAPTE EN L'AIR",
		"SAQUE DE BANDA LARGO DE {0} BUSCANDO EL SEGUNDO PALO":
			"LONGUE TOUCHE DE {0} VERS LE DEUXIEME POTEAU",
		"FALTA LATERAL: {0} PONE EL CENTRO Y SE ARMA EL LÍO":
			"COUP FRANC LATERAL : {0} CENTRE ET CA S'EMBROUILLE",
		"CÓRNER EN CORTO ENTRE {0} Y SU COMPAÑERO":
			"CORNER JOUE COURT ENTRE {0} ET SON COEQUIPIER",
		"{0} ENSAYA UNA FALTA LEJANA Y SE VA ALTA":
			"{0} TENTE UN COUP FRANC LOINTAIN, LE BALLON PASSE AU-DESSUS",
		"OTRO CÓRNER: {0} VUELVE A COLGARLA AL ÁREA": "ENCORE UN CORNER : {0} CENTRE DE NOUVEAU",
		"CÓRNER PARA EL RIVAL, LO SACA {0}": "CORNER POUR L'ADVERSAIRE, TIRE PAR {0}",
		"FALTA AL BORDE DEL ÁREA, LA PONE {0}": "COUP FRANC AUX 18 METRES, {0} SE PLACE",
		"{0} CUELGA EL CÓRNER Y TU DEFENSA DESPEJA DE CABEZA":
			"{0} CENTRE LE CORNER, TA DEFENSE DEGAGE DE LA TETE",
		"TIRO LIBRE DE {0} QUE SE ESTRELLA EN LA BARRERA":
			"COUP FRANC DE {0} QUI S'ECRASE SUR LE MUR",
		"{0} LA MANDA AL ÁREA Y TU PORTERO SALE A PUÑOS":
			"{0} CENTRE DANS LA SURFACE, TON GARDIEN SORT DU POING",
		"SAQUE DE BANDA LARGO DE {0}, SIN CONSECUENCIAS":
			"LONGUE TOUCHE DE {0}, SANS CONSEQUENCE",
		"FALTA EN TRES CUARTOS: {0} ESPERA A QUE SUBAN LOS CENTRALES":
			"COUP FRANC EN ATTAQUE : {0} ATTEND LES DEFENSEURS CENTRAUX",
		"{0} BOTA EL CÓRNER EN CORTO Y TU EQUIPO ACHICA":
			"{0} JOUE LE CORNER COURT, TON EQUIPE RESSERRE LES LIGNES",
		"FALTA LEJANA DE {0} POR ENCIMA DEL TRAVESAÑO":
			"COUP FRANC LOINTAIN DE {0} AU-DESSUS DE LA BARRE",
		"OTRO CÓRNER RIVAL: {0} LO CUELGA AL PRIMER PALO":
			"ENCORE UN CORNER ADVERSE : {0} CENTRE AU PREMIER POTEAU",
		"CÓRNER PARA TU EQUIPO, DESPEJA LA ZAGA": "CORNER POUR TON EQUIPE, LA DEFENSE DEGAGE",
		"FALTA PELIGROSA A FAVOR, SE ARMA LA BARRERA":
			"COUP FRANC DANGEREUX POUR TOI, LE MUR SE FORME",
		"TIRO LIBRE DE TU EQUIPO QUE SE VA ALTO": "COUP FRANC DE TON EQUIPE QUI PASSE AU-DESSUS",
		"CÓRNER PARA EL RIVAL, DESPEJA TU DEFENSA":
			"CORNER POUR L'ADVERSAIRE, TA DEFENSE DEGAGE",
		"FALTA PELIGROSA EN CONTRA, TU EQUIPO ARMA LA BARRERA":
			"COUP FRANC DANGEREUX CONTRE TOI, TON EQUIPE FORME LE MUR",
		"TIRO LIBRE DEL RIVAL A LAS MANOS DEL PORTERO":
			"COUP FRANC ADVERSE DIRECTEMENT DANS LES MAINS DU GARDIEN",

		"AMARILLA PARA {0} POR UNA ENTRADA TARDÍA": "JAUNE POUR {0} SUR UN TACLE TARDIF",
		"EL ÁRBITRO AMONESTA A {0} POR PROTESTAR": "L'ARBITRE AVERTIT {0} POUR CONTESTATION",
		"AMARILLA A {0} POR FRENAR EL CONTRA CON FALTA":
			"JAUNE POUR {0} POUR AVOIR STOPPE LA CONTRE-ATTAQUE PAR UNE FAUTE",
		"AMARILLA PARA {0} POR UNA FALTA DURA": "JAUNE POUR {0} SUR UNE FAUTE DURE",
		"{0} VE LA AMARILLA POR PERDER TIEMPO": "{0} EST AVERTI POUR AVOIR FAIT PERDRE DU TEMPS",
		"AMARILLA A {0} POR DERRIBAR AL EXTREMO": "JAUNE POUR {0} POUR AVOIR FAUCHE L'AILIER",
		"AMARILLA PARA TU EQUIPO": "JAUNE POUR TON EQUIPE",
		"AMARILLA PARA EL RIVAL": "JAUNE POUR L'ADVERSAIRE",
		"AMARILLA PARA {0}": "JAUNE POUR {0}",
		"SEGUNDA AMARILLA PARA {0}": "DEUXIEME JAUNE POUR {0}",
		"¡ROJA! {0} SE VA EXPULSADO": "ROUGE ! {0} EST EXPULSE",
		"EL ÁRBITRO PERDONA A {0}": "L'ARBITRE EPARGNE {0}",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA A TU EQUIPO CON DIEZ":
			"DEUXIEME JAUNE, ROUGE ! {0} LAISSE TON EQUIPE A DIX",
		"¡SEGUNDA AMARILLA Y ROJA! {0} DEJA AL RIVAL CON DIEZ":
			"DEUXIEME JAUNE, ROUGE ! {0} LAISSE L'ADVERSAIRE A DIX",
		"¡ROJA DIRECTA A {0}! TU EQUIPO SE QUEDA CON DIEZ":
			"ROUGE DIRECT POUR {0} ! TON EQUIPE PASSE A DIX",
		"¡ROJA DIRECTA A {0}! EL RIVAL SE QUEDA CON DIEZ":
			"ROUGE DIRECT POUR {0} ! L'ADVERSAIRE PASSE A DIX",
		"ROJA DIRECTA POR EL BALONAZO AL ÁRBITRO":
			"ROUGE DIRECT POUR AVOIR TIRE SUR L'ARBITRE",
		"{0} SE MARCHA LESIONADO, NO PUEDE SEGUIR":
			"{0} SORT BLESSE, IL NE PEUT PAS CONTINUER",
		"LESIÓN EN EL RIVAL: {0} DEJA LA CANCHA": "BLESSURE CHEZ L'ADVERSAIRE : {0} QUITTE LE TERRAIN",
		"PARÓN POR LESIÓN, ENTRA LA CAMILLA": "ARRET DE JEU POUR BLESSURE, LE BRANCARD ENTRE",
		"BLOQUE BAJO Y SIN PRISA: EL PARTIDO SE JUEGA AL RALENTÍ":
			"BLOC BAS ET SANS PRECIPITATION : LE MATCH SE JOUE AU RALENTI",
		"TU EQUIPO CEDE EL BALÓN Y ESPERA AGAZAPADO":
			"TON EQUIPE CEDE LE BALLON ET ATTEND, TAPIE",
		"ONCE HOMBRES POR DETRÁS DE LA PELOTA, SIN GASTAR UNA GOTA":
			"ONZE JOUEURS DERRIERE LE BALLON, SANS GASPILLER UNE GOUTTE",
		"SE JUEGA A LO QUE QUIERE {0}, PERO NO ENTRA NADIE":
			"ON JOUE AU RYTHME DE {0}, MAIS PERSONNE NE PASSE",
		"CADA DESPEJE ES UN SEGUNDO MÁS QUE SE VA DEL RELOJ":
			"CHAQUE DEGAGEMENT EST UNE SECONDE DE MOINS SUR L'HORLOGE",
		"EL BANQUILLO PIDE CALMA: NI UN PASO ADELANTE":
			"LE BANC DEMANDE DU CALME : PAS UN PAS EN AVANT",
		"MURO Y PACIENCIA, EL PLAN ES QUE NO PASE NADA":
			"MUR ET PATIENCE, LE PLAN EST QU'IL NE SE PASSE RIEN",
		"TU EQUIPO ADMINISTRA PIERNAS Y METROS ATRÁS":
			"TON EQUIPE GERE SES JAMBES ET SON TERRAIN DERRIERE",
		"REPLIEGUE ORDENADO, SIN SALIR A LA PRESIÓN":
			"REPLI ORDONNE, SANS SORTIR PRESSER",
		"{0} TOCA Y TOCA CONTRA UN MURO QUE NO SE MUEVE":
			"{0} FAIT CIRCULER LE BALLON CONTRE UN MUR QUI NE BOUGE PAS",
		"BLOQUE BAJO Y SALIDA RÁPIDA: TU EQUIPO ESPERA SU MOMENTO":
			"BLOC BAS ET SORTIE RAPIDE : TON EQUIPE ATTEND SON MOMENT",
		"REPLIEGUE Y CONTRA, ASÍ SE PLANTEÓ ESTE PARTIDO":
			"REPLI ET CONTRE-ATTAQUE, C'EST LE PLAN DE CE MATCH",
		"TU EQUIPO CEDE EL CENTRO DEL CAMPO Y CIERRA EL ÁREA":
			"TON EQUIPE CEDE LE MILIEU ET FERME LA SURFACE",
		"LÍNEAS JUNTAS, SIN UN HUECO ENTRE ELLAS": "LES LIGNES SONT SERREES, PAS UN ESPACE ENTRE ELLES",
		"SE DEFIENDE CON ORDEN Y SE SALE CON CRITERIO":
			"ON DEFEND AVEC ORDRE ET ON SORT AVEC INTELLIGENCE",
		"{0} TIENE EL BALÓN; TU EQUIPO TIENE EL PLAN": "{0} A LE BALLON ; TON EQUIPE A LE PLAN",
		"CADA ROBO SE CONVIERTE EN UN BALÓN LARGO": "CHAQUE BALLON RECUPERE DEVIENT UNE LONGUE BALLE",
		"LA ZAGA MANDA: NADA PASA POR EL MEDIO":
			"LA DEFENSE COMMANDE : RIEN NE PASSE PAR LE MILIEU",
		"TU EQUIPO JUEGA AL ERROR DEL RIVAL": "TON EQUIPE JOUE SUR L'ERREUR ADVERSE",
		"DEFENSA EN BLOQUE, SIN REGALAR LA ESPALDA":
			"DEFENSE EN BLOC, SANS RIEN OFFRIR DANS LE DOS",
		"REPLIEGUE FEROZ: SE DEFIENDE COMO SI FUERA EL ÚLTIMO MINUTO":
			"REPLI FEROCE : ON DEFEND COMME SI C'ETAIT LA DERNIERE MINUTE",
		"BLOQUE BAJO PERO A MIL POR HORA, NO SE RESPIRA NI ATRÁS":
			"BLOC BAS MAIS A FOND, MEME LES DEFENSEURS N'ONT PAS DE REPIT",
		"TU EQUIPO SE PARTE EL ALMA EN CADA DESPEJE":
			"TON EQUIPE SE DONNE A FOND SUR CHAQUE DEGAGEMENT",
		"SE DEFIENDE Y SE SALE AL CONTRAGOLPE COMO UN LATIGAZO":
			"ON DEFEND ET ON REPART EN CONTRE COMME UN COUP DE FOUET",
		"TRABAJO SUCIO A TODA VELOCIDAD: DOS HOMBRES A CADA BALÓN":
			"TRAVAIL DE L'OMBRE A PLEINE VITESSE : DEUX JOUEURS SUR CHAQUE BALLON",
		"CIERRAN ATRÁS Y ARRANCAN AL ESPACIO EN CUANTO ROBAN":
			"ILS FERMENT DERRIERE ET PARTENT VITE DES QU'ILS RECUPERENT",
		"ENTREGA TOTAL EN EL REPLIEGUE, Y ESTO SE PAGA EN PIERNAS":
			"ENGAGEMENT TOTAL DANS LE REPLI, ET LES JAMBES EN PAIENT LE PRIX",
		"{0} SE ESTRELLA CONTRA UNA MURALLA QUE ADEMÁS CORRE":
			"{0} SE HEURTE A UN MUR QUI COURT EN PLUS",
		"NI UN METRO GRATIS: PERSIGUEN AL RIVAL HASTA EL CÓRNER":
			"PAS UN METRE GRATUIT : ILS POURSUIVENT L'ADVERSAIRE JUSQU'AU CORNER",
		"DEFENDER ASÍ QUEMA, PERO EL ARCO SIGUE EN PIE":
			"DEFENDRE AINSI EPUISE, MAIS LE BUT TIENT BON",
		"PARTIDO DE TRÁMITE: TU EQUIPO NO ARRIESGA NI UN PASE":
			"MATCH SANS ENJEU : TON EQUIPE NE RISQUE PAS UNE PASSE",
		"RITMO BAJO Y POSICIONES FIJAS, NADIE SE DESCUELGA":
			"RYTHME BAS ET POSITIONS FIXES, PERSONNE NE BOUGE",
		"SE TOCA EN HORIZONTAL, SIN ROMPER LÍNEAS": "ON JOUE A L'HORIZONTALE, SANS CASSER LES LIGNES",
		"EL PARTIDO SE DUERME Y A TU EQUIPO NO LE MOLESTA":
			"LE MATCH S'ENDORT ET CA NE DERANGE PAS TON EQUIPE",
		"PLAN SOBRIO: NI ATRÁS NI ARRIBA, DEJAR CORRER EL RELOJ":
			"PLAN SOBRE : NI ARRIERE NI AVANT, LAISSER TOURNER L'HORLOGE",
		"TU EQUIPO DOSIFICA, GUARDANDO PIERNAS PARA EL FINAL":
			"TON EQUIPE DOSE SES EFFORTS, GARDANT DES JAMBES POUR LA FIN",
		"PASES DE SEGURIDAD Y MIRADAS AL BANQUILLO": "PASSES DE SECURITE ET REGARDS VERS LE BANC",
		"SIN PRESIÓN Y SIN PRISA, EL PARTIDO ESTÁ EN PAUSA":
			"SANS PRESSION ET SANS PRECIPITATION, LE MATCH EST EN PAUSE",
		"EQUILIBRIO Y CALMA, NADIE QUIERE ROMPER LA MESA":
			"EQUILIBRE ET CALME, PERSONNE NE VEUT TOUT CASSER",
		"SE JUEGA A MEDIO GAS, ESPERANDO UNA GRIETA":
			"ON JOUE A MOITIE, EN ATTENDANT UNE FAILLE",
		"PARTIDO PAREJO: TU EQUIPO SOSTIENE EL EQUILIBRIO":
			"MATCH EQUILIBRE : TON EQUIPE MAINTIENT LA BALANCE",
		"NI REPLIEGUE NI LOCURA, EL PLAN ES EL ORDEN":
			"NI REPLI NI FOLIE, LE PLAN C'EST L'ORDRE",
		"SE JUEGA DE IGUAL A IGUAL EN EL MEDIO CAMPO": "ON SE BAT A ARMES EGALES AU MILIEU DE TERRAIN",
		"TU EQUIPO ALTERNA TOQUE Y VERTICALIDAD": "TON EQUIPE ALTERNE PATIENCE ET VERTICALITE",
		"BLOQUE MEDIO Y PRESIÓN SÓLO CUANDO TOCA": "BLOC MEDIAN ET PRESSING SEULEMENT QUAND IL LE FAUT",
		"PLAN CLÁSICO: SUJETAR ATRÁS, PROBAR ARRIBA":
			"PLAN CLASSIQUE : TENIR DERRIERE, TENTER DEVANT",
		"EL PARTIDO SE JUEGA DONDE TU EQUIPO QUIERE, EN EL MEDIO":
			"LE MATCH SE JOUE LA OU TON EQUIPE LE VEUT, AU MILIEU",
		"SIN DESAJUSTES, CADA UNO EN SU SITIO": "SANS DESORDRE, CHACUN A SA PLACE",
		"SE ESPERA EL MOMENTO SIN REGALAR NADA":
			"ON ATTEND LE MOMENT SANS RIEN OFFRIR",
		"{0} NO ENCUENTRA GRIETAS EN UN EQUIPO BIEN PLANTADO":
			"{0} NE TROUVE PAS DE FAILLE DANS UNE EQUIPE BIEN EN PLACE",
		"MISMO PLAN, OTRO PULSO: TU EQUIPO CORRE EL DOBLE":
			"MEME PLAN, AUTRE RYTHME : TON EQUIPE COURT DEUX FOIS PLUS",
		"IDA Y VUELTA A TODO TREN, ESTO ES UN PARTIDO ROTO":
			"CA VA ET VIENT A TOUTE VITESSE, CE MATCH EST OUVERT",
		"PRESIÓN EN CUANTO SE PIERDE, ORDEN EN CUANTO SE TIENE":
			"PRESSING DES LA PERTE, ORDRE DES QU'ON L'A",
		"RITMO ALTO SIN PERDER LA FORMA": "RYTHME ELEVE SANS PERDRE LA FORME",
		"SE DISPUTA CADA SEGUNDA PELOTA COMO SI FUERA LA ÚLTIMA":
			"CHAQUE DEUXIEME BALLON EST DISPUTE COMME LE DERNIER",
		"TU EQUIPO ACELERA CADA VEZ QUE PISA CAMPO CONTRARIO":
			"TON EQUIPE ACCELERE DES QU'ELLE ENTRE DANS LEUR CAMP",
		"EL PARTIDO VUELA DE ÁREA A ÁREA": "LE MATCH VOLE D'UNE SURFACE A L'AUTRE",
		"INTENSIDAD ARRIBA: {0} NO ENCUENTRA UN SEGUNDO DE PAZ":
			"INTENSITE MAXIMALE : {0} NE TROUVE PAS UNE SECONDE DE REPOS",
		"EQUILIBRIO CON EL ACELERADOR PISADO": "EQUILIBRE AVEC L'ACCELERATEUR AU PLANCHER",
		"SE CORRE MUCHO Y SE PIENSA RÁPIDO": "ON COURT BEAUCOUP ET ON REFLECHIT VITE",
		"TODOS ARRIBA, PERO SIN QUEMARSE: SE BUSCA CON CABEZA":
			"TOUT LE MONDE DEVANT, MAIS SANS S'EPUISER : ON JOUE INTELLIGEMMENT",
		"ATAQUE PACIENTE: SE RODEA EL ÁREA ESPERANDO EL HUECO":
			"ATTAQUE PATIENTE : ON TOURNE AUTOUR DE LA SURFACE EN ATTENDANT LA BRECHE",
		"TU EQUIPO ADELANTA LÍNEAS Y ADMINISTRA EL ESFUERZO":
			"TON EQUIPE AVANCE SES LIGNES ET GERE SON EFFORT",
		"MUCHA GENTE ARRIBA Y NINGUNA PRISA POR LLEGAR":
			"BEAUCOUP DE MONDE DEVANT ET AUCUNE HATE D'ARRIVER",
		"SE ATACA AL PASO, CON EL BALÓN COMO ÚNICO ARGUMENTO":
			"ON ATTAQUE AU PAS, LE BALLON COMME SEUL ARGUMENT",
		"PROPUESTA OFENSIVA SIN DESGASTE: TOQUE Y ESPERA":
			"PLAN OFFENSIF SANS EFFORT : PASSES ET PATIENCE",
		"LOS LATERALES SUBEN, PERO NADIE CORRE DE MÁS":
			"LES LATERAUX MONTENT, MAIS PERSONNE NE COURT TROP",
		"TU EQUIPO ACAMPA EN CAMPO DE {0} SIN APRETAR EL PASO":
			"TON EQUIPE CAMPE DANS LE CAMP DE {0} SANS ACCELERER",
		"AMBICIÓN CON LAS PIERNAS GUARDADAS PARA EL FINAL":
			"AMBITION AVEC LES JAMBES GARDEES POUR LA FIN",
		"SE INSISTE ARRIBA, AUNQUE SIN PRESIÓN TRAS PÉRDIDA":
			"ON INSISTE DEVANT, MAIS SANS PRESSING APRES LA PERTE",
		"PLANTEAMIENTO OFENSIVO: TODOS ARRIBA SOBRE {0}":
			"PLAN OFFENSIF : TOUT LE MONDE DEVANT CONTRE {0}",
		"TU EQUIPO ADELANTA LA LÍNEA Y BUSCA EL ÁREA RIVAL":
			"TON EQUIPE AVANCE SA LIGNE ET CHERCHE LEUR SURFACE",
		"LOS LATERALES VIVEN EN CAMPO CONTRARIO":
			"LES LATERAUX VIVENT DANS LE CAMP ADVERSE",
		"SE ATACA CON GENTE: CINCO HOMBRES POR DELANTE DEL BALÓN":
			"ON ATTAQUE EN NOMBRE : CINQ JOUEURS DEVANT LE BALLON",
		"TU EQUIPO EMPUJA Y EL RIVAL ACUMULA GENTE ATRÁS":
			"TON EQUIPE POUSSE ET L'ADVERSAIRE ENTASSE DU MONDE DERRIERE",
		"CENTRO TRAS CENTRO, EL PLAN ES AHOGAR EL ÁREA":
			"CENTRE APRES CENTRE, LE PLAN EST D'ETOUFFER LA SURFACE",
		"PROPUESTA VALIENTE, AUNQUE DEJE ESPACIOS A LA ESPALDA":
			"PLAN AUDACIEUX, MEME S'IL LAISSE DES ESPACES DERRIERE",
		"TU EQUIPO JUEGA EN CAMPO DE {0} Y NO PIENSA SALIR":
			"TON EQUIPE JOUE DANS LE CAMP DE {0} ET NE COMPTE PAS SORTIR",
		"SE ARRIESGA EN CADA SALIDA BUSCANDO AL DELANTERO":
			"ON RISQUE A CHAQUE RELANCE EN CHERCHANT L'ATTAQUANT",
		"EL BLOQUE ESTÁ ALTO Y LA ZAGA, MUY SOLA":
			"LE BLOC EST HAUT ET LA DEFENSE, TRES SEULE",
		"ASEDIO TOTAL: TODOS ARRIBA Y A MÁXIMO PULSO": "SIEGE TOTAL : TOUT LE MONDE DEVANT A FOND",
		"PRESIÓN ASFIXIANTE SOBRE {0}, NO LES DEJAN NI SACAR":
			"PRESSING ETOUFFANT SUR {0}, ILS NE PEUVENT MEME PAS RELANCER",
		"TU EQUIPO SE VOLCÓ Y NO HAY QUIEN LO FRENE":
			"TON EQUIPE S'EST TOTALEMENT LANCEE ET RIEN NE L'ARRETE",
		"OLA TRAS OLA SOBRE EL ÁREA RIVAL": "VAGUE APRES VAGUE SUR LEUR SURFACE",
		"ROBO ARRIBA Y REMATE: ESTO ES UNA TORMENTA": "BALLON RECUPERE HAUT ET TIR : C'EST UNE TEMPETE",
		"EL RIVAL NO PASA DE MEDIO CAMPO, Y ESO SE PAGA EN PIERNAS":
			"L'ADVERSAIRE NE DEPASSE PAS LE MILIEU, ET LES JAMBES EN PAIENT LE PRIX",
		"TODO EL EQUIPO METIDO EN VEINTE METROS DE CAMPO CONTRARIO":
			"TOUTE L'EQUIPE ENTASSEE DANS VINGT METRES DE LEUR CAMP",
		"RITMO ALTÍSIMO, NO DEJAN RESPIRAR A {0}": "RYTHME INFERNAL, {0} N'A AUCUN REPIT",
		"UN SOLO EQUIPO EN EL CAMPO, Y ES EL TUYO": "UNE SEULE EQUIPE SUR LE TERRAIN, ET C'EST LA TIENNE",
		"ATAQUE SIN RED: ATRÁS SÓLO QUEDAN DOS":
			"ATTAQUE SANS FILET : IL NE RESTE QUE DEUX DERRIERE",
		"CON EL {0} ABAJO, TU EQUIPO VA AL FRENTE": "MENE {0}, TON EQUIPE VA DE L'AVANT",
		"ARRANCA EL PARTIDO, PRIMEROS TANTEOS ANTE {0}": "LE MATCH DEMARRE, PREMIERS TATONNEMENTS FACE A {0}",
		"CON EL {0} ABAJO, TU EQUIPO SE VUELCA AL FRENTE":
			"MENE {0}, TON EQUIPE SE JETTE VERS L'AVANT",
		"FRÍOS: A TU EQUIPO NO LE SALE NADA": "FROIDS : RIEN NE REUSSIT A TON EQUIPE",
		"PIERNAS PESADAS: {0} ACUSA EL CANSANCIO": "JAMBES LOURDES : {0} ACCUSE LA FATIGUE",
		"{0} SE COLOCA EL BALÓN EN EL PUNTO": "{0} POSE LE BALLON SUR LE POINT DE PENALTY",
		"LA PENA MÁXIMA LA COBRA {0}": "C'EST {0} QUI TIRE LE PENALTY",
		"SE PREPARA {0} SOBRE LA FALTA": "{0} SE PLACE SUR LE COUP FRANC",
		"SE HACE CARGO {0} DE LA FALTA": "C'EST {0} QUI S'OCCUPE DU COUP FRANC",
		"SACA EL CÓRNER {0}": "{0} TIRE LE CORNER",
		"SAQUE DE ESQUINA, LLEGA EL CENTRO": "CORNER, LE CENTRE ARRIVE",
		"{0} MINUTOS AÑADIDOS": "{0} MINUTES DE TEMPS ADDITIONNEL",
		"ESTO SE VA A LA PRÓRROGA": "CA PART EN PROLONGATION",
		"{0} LLEGA TARDE A TODO, SIN PIERNAS": "{0} EN RETARD, PLUS DE JAMBES",
		"{0} PIDE EL CAMBIO CON LA MIRADA": "{0} RECLAME LE CHANGEMENT DU REGARD",
		"SE LE ACABA LA GASOLINA A {0}": "{0} N'A PLUS D'ESSENCE",
		"{0} ANDA ENCHUFADÍSIMO HOY": "{0} EST A FOND AUJOURD'HUI",
		"NO PARA DE CORRER, {0}": "{0} N'ARRETE PAS DE COURIR",
		"{0} ESTÁ ADMINISTRANDO FUERZAS": "{0} GERE SON EFFORT",
		"{0} ANDA MUY FLOJO, LE FALTA CHISPA": "{0} EST TRES MOU, IL MANQUE D'ETINCELLE",
		"{0} DEBERÍA PISAR MÁS EL ÁREA": "{0} DEVRAIT ENTRER PLUS DANS LA SURFACE",
		"A {0} LE FALTA AYUDAR ATRÁS": "{0} DOIT AIDER DAVANTAGE DERRIERE",
		"ASÍ NO LE LLEGA UN BALÓN A {0}": "COMME CA {0} NE VERRA PAS LE BALLON",
		"{0} SE ESTÁ ADUEÑANDO DEL PARTIDO": "{0} PREND LE MATCH EN MAIN",
		"PARTIDAZO DE {0}": "QUEL MATCH DE {0}",
		"SE LE ESTÁ ATRAGANTANDO EL PARTIDO A {0}": "LE MATCH ECHAPPE A {0}",
		"{0} NO APARECE": "{0} EST AUX ABONNES ABSENTS",
		"{0} LLEVA LA MANIJA DEL EQUIPO": "{0} TIENT LES RENES DE L'EQUIPE",
		"{0} SE QUEDA SOLO ARRIBA, NADIE SUBE": "{0} EST SEUL DEVANT, PERSONNE NE MONTE",
		"TODO PASA POR {0}": "TOUT PASSE PAR {0}",
		"{0} NO PARA DE APAGAR FUEGOS ATRÁS": "{0} ETEINT DES INCENDIES DERRIERE",
		"{0} SE PASA EL PARTIDO CORRIENDO DETRÁS DEL BALÓN": "{0} PASSE LE MATCH A COURIR APRES LE BALLON",
		"{0} MANEJA LOS TIEMPOS DESDE EL MEDIO": "{0} DICTE LE TEMPO AU MILIEU",
		"TARDE TRANQUILA PARA {0} EN LA ZAGA": "APRES-MIDI TRANQUILLE POUR {0} EN DEFENSE",
		"LA GRADA CANTA TU NOMBRE, {0}": "LES TRIBUNES CHANTENT TON NOM, {0}",
		"{0} BAJA A ORDENAR EL JUEGO": "{0} DESCEND POUR ORGANISER LE JEU",
		"{0} CALIENTA EN LA BANDA, PIDE ENTRAR":
			"{0} S'ECHAUFFE SUR LA TOUCHE, IL VEUT ENTRER",

		"{0} MIRA EL PARTIDO DESDE EL BANQUILLO, CABIZBAJO":
			"{0} REGARDE LE MATCH DEPUIS LE BANC, TETE BASSE",
		"{0} SE SIENTA FUNDIDO, EL BANQUILLO LE DA HIELO":
			"{0} S'ASSOIT VIDE, LE BANC LUI APPORTE DE LA GLACE",
		"UNA PALMADA PARA {0} AL LLEGAR AL BANQUILLO":
			"UNE TAPE DANS LE DOS POUR {0} EN ARRIVANT AU BANC",
		"NADIE DEL BANQUILLO MIRA A {0}": "PERSONNE SUR LE BANC NE REGARDE {0}",
		"EN EL BANQUILLO SE COMENTA LA SALIDA DE {0}":
			"SUR LE BANC ON COMMENTE LA SORTIE DE {0}",
		"{0} SIGUE EL PARTIDO DESDE EL BANQUILLO": "{0} SUIT LE MATCH DEPUIS LE BANC",
		"EQUIPO ENCENDIDO, HUELE A GOL ANTE {0}":
			"EQUIPE EN FEU, CA SENT LE BUT FACE A {0}",
		"DUELO PAREJO, NADIE QUIERE EL ERROR": "DUEL EQUILIBRE, PERSONNE NE VEUT COMMETTRE L'ERREUR",
		"TU EQUIPO MANEJA EL {0}": "TON EQUIPE GERE LE {0}",
		"TU EQUIPO MANEJA EL {0} SIN PRISA": "TON EQUIPE GERE LE {0} SANS PRECIPITATION",
		"SE ACERCA EL DESCANSO CON EL {0}": "LA MI-TEMPS APPROCHE SUR LE {0}",
		"RECTA FINAL, URGE EL EMPATE: TODOS ARRIBA":
			"DERNIERE LIGNE DROITE, L'EGALISATION URGE : TOUT LE MONDE DEVANT",
		"RECTA FINAL Y EL {0} SIGUE ABIERTO": "DERNIERE LIGNE DROITE ET LE {0} RESTE OUVERT",
		"RECTA FINAL: TU EQUIPO AGUANTA EL {0} CON EL ALMA":
			"DERNIERE LIGNE DROITE : TON EQUIPE DEFEND LE {0} DE TOUTE SON AME",
	},


	"notifications": {
		"ESA CAMISETA TIENE DUEÑO": "CE MAILLOT A UN PROPRIETAIRE",
		"El número que quieres cuelga dos perchas más allá, con el nombre de {0} encima. Cambiarlo se hace más de lo que parece.":
			"Le numéro que tu veux est accroché deux patères plus loin, avec le nom de {0} dessus. Le changer est plus compliqué qu'il n'y paraît.",
		"COMPRÁRSELO": "LE LUI RACHETER",
		"PEDIRLO AL CLUB": "LE DEMANDER AU CLUB",
		"DEJARLO ESTAR": "LAISSER TOMBER",
		"UN OJEADOR EN LA GRADA": "UN RECRUTEUR EN TRIBUNE",
		"Un club grande mandó ojeador a verte y la prensa local se enteró. Todos quieren saber si sueñas con irte.":
			"Un grand club a envoyé un recruteur pour te voir et la presse locale l'a su. Tout le monde veut savoir si tu rêves de partir.",
		"HABLAR DEL SUEÑO": "AVOUER LE REVE",
		"QUITARLE HIERRO": "RELATIVISER",
		"EL SEGUNDO TRABAJO": "LE DEUXIEME BOULOT",
		"Un compañero reparte paquetes por las mañanas para llegar a fin de mes. Esta semana no puede y te pide cubrirle una tarde.":
			"Un coéquipier livre des colis le matin pour boucler les fins de mois. Cette semaine il ne peut pas, et il te demande de le couvrir un après-midi.",
		"ECHARLE LA TARDE": "LE COUVRIR",
		"NO PUEDO": "JE NE PEUX PAS",
		"ESTE CAMPO ES UN PATATAL": "CE TERRAIN EST UNE HONTE",
		"El césped es un parche de tierra y bote falso. Un periodista te pregunta, sonriendo, qué te parece tu nuevo estadio.":
			"La pelouse est un parterre de terre et de rebonds pourris. Un journaliste te demande, en souriant, ce que tu penses de ton nouveau stade.",
		"DECIR LA VERDAD": "DIRE LA VERITE",
		"'AQUÍ SE JUEGA IGUAL'": "'ICI ON JOUE PAREIL'",
		"CÁMARAS EN EL VESTUARIO": "DES CAMERAS AU VESTIAIRE",
		"Una plataforma quiere rodar tu documental: un mes de cámaras siguiéndote hasta dentro del vestuario. Pagan bien. El grupo no sonríe.":
			"Une plateforme veut tourner ton documentaire : un mois de caméras qui te suivent jusque dans le vestiaire. Ça paie bien. Le groupe ne sourit pas.",
		"FIRMAR EL RODAJE": "SIGNER LE TOURNAGE",
		"PROTEGER EL GRUPO": "PROTEGER LE GROUPE",
		"TU CIFRA EN PORTADA": "TON CHIFFRE EN UNE",
		"Un diario publica lo que pides por renovar, con cifra y todo. Es casi exacta. Confirmarla presiona al club; negarla te protege.":
			"Un journal publie ce que tu demandes pour prolonger, chiffre à l'appui. C'est presque exact. Le confirmer met la pression sur le club ; le nier te protège.",
		"CONFIRMARLA": "LE CONFIRMER",
		"NEGARLO TODO": "TOUT NIER",
		"EL PENALTI QUE NO TIRASTE": "LE PENALTY QUE TU N'AS PAS TIRE",
		"El designado falló el penalti que costó el partido. Tú eras el segundo de la lista y la prensa lo sabe.":
			"Le tireur désigné a raté le penalty qui a coûté le match. Tu étais deuxième sur la liste et la presse le sait.",
		"RESPALDARLO": "LE SOUTENIR",
		"'YO LO PEDÍ'": "'JE L'AI DEMANDE'",
		"TUS NÚMEROS EN LA PIZARRA": "TES STATS AU TABLEAU",
		"Un analista joven te espera con tu mala racha desmenuzada en la pizarra: mapas, flechas y todo lo que no estás haciendo.":
			"Un jeune analyste t'attend avec ta mauvaise série décortiquée au tableau : cartes, flèches et tout ce que tu ne fais pas.",
		"TRAGARTE EL ORGULLO": "AVALER TA FIERTE",
		"MANDARLO A PASEO": "L'ENVOYER PROMENER",
		"El siguiente partido te da la razón.": "Le prochain match te donne raison.",
		"La racha sigue y el míster no olvida.": "La série continue et l'entraîneur n'oublie pas.",
		"LA CÁMARA TE ENFOCÓ": "PRIS PAR LA CAMERA",
		"Otro partido desde el banco, y la cámara te pilló con cara larga. En redes debaten si eres mal compañero.":
			"Encore un match depuis le banc, et la caméra t'a filmé la mine longue. Sur les réseaux, on débat pour savoir si tu es un mauvais coéquipier.",
		"'APOYO AL EQUIPO'": "'JE SOUTIENS L'EQUIPE'",
		"NO ACLARAR NADA": "NE RIEN EXPLIQUER",
		"EL DISCURSO DEL NUEVO": "LE DISCOURS DU NOUVEAU",
		"Primer día con el grupo entero sentado y el míster te cede la palabra. Cuarenta segundos y todo el vestuario midiéndote.":
			"Premier jour, tout le groupe assis, et l'entraîneur te donne la parole. Quarante secondes, et tout le vestiaire qui te jauge.",
		"PROMETER TÍTULOS": "PROMETTRE DES TITRES",
		"VENGO A APRENDER": "JE VIENS APPRENDRE",
		"SÓLO SALUDAR Y SENTARTE": "SALUER ET S'ASSEOIR",
		"DÓNDE VAS A VIVIR": "OU TU VAS VIVRE",
		"El club te pasa tres opciones: el ático del centro que sale en las revistas, una casa pegada a la ciudad deportiva, o seguir en el hotel y no gastar.":
			"Le club te propose trois options : le penthouse du centre-ville qui fait la une des magazines, une maison collée au centre d'entraînement, ou rester à l'hôtel sans rien dépenser.",
		"EL ÁTICO DEL CENTRO": "LE PENTHOUSE DU CENTRE",
		"PEGADO AL ENTRENAMIENTO": "PRES DU CENTRE D'ENTRAINEMENT",
		"SEGUIR EN EL HOTEL": "RESTER A L'HOTEL",
		"EL PLANTE POR LOS MINUTOS": "L'ULTIMATUM DU TEMPS DE JEU",
		"Otra jornada mirando desde el banco. Tu agente ya tiene el titular escrito y un periodista esperando; el míster te ha citado a solas antes de que salga.":
			"Encore une journée à regarder depuis le banc. Ton agent a déjà le titre écrit et un journaliste qui attend ; l'entraîneur t'a convoqué en tête-à-tête avant que ça sorte.",
		"EXIGIRLO EN PÚBLICO": "L'EXIGER PUBLIQUEMENT",
		"TRAGAR Y CALLARTE": "AVALER ET TE TAIRE",
		"EL MOTÍN": "LA MUTINERIE",
		"El vestuario ha decidido que el míster se tiene que ir y hay una carta con firmas dando vueltas. Falta la tuya, y el despacho está a diez metros por el otro pasillo.":
			"Le vestiaire a décidé que l'entraîneur doit partir et une lettre signée circule. Il manque ta signature, et son bureau est à dix mètres, dans l'autre couloir.",
		"FIRMAR CON EL GRUPO": "SIGNER AVEC LE GROUPE",
		"AVISAR AL MÍSTER": "PREVENIR L'ENTRAINEUR",
		"EL AÑO QUE TE QUEDA": "TA DERNIERE ANNEE",
		"Tu agente tiene un periodista al teléfono y una frase preparada: que escuchas ofertas. Filtrarla te dobla el precio y te convierte, esta misma noche, en el que ya se fue.":
			"Ton agent a un journaliste au téléphone et une phrase toute prête : que tu écoutes des offres. La laisser filtrer double ton prix et fait de toi, dès ce soir, celui qui est déjà parti.",
		"DEJARLA CAER": "LA LAISSER FILTRER",
		"JURAR QUE TE QUEDAS": "JURER QUE TU RESTES",
		"LO QUE SABE EL CAPITÁN": "CE QUE SAIT LE CAPITAINE",
		"Tres se saltaron la concentración y tú los viste salir. El club te pregunta a la cara, como capitán, y el vestuario entero espera en el pasillo a ver qué dices.":
			"Trois ont séché la mise au vert et tu les as vus sortir. Le club te demande en face, en tant que capitaine, et tout le vestiaire attend dans le couloir pour savoir ce que tu vas dire.",
		"DAR LOS NOMBRES": "DONNER LES NOMS",
		"TAPARLOS": "LES COUVRIR",
		"LA OFERTA QUE NO SE RECHAZA": "L'OFFRE QUI NE SE REFUSE PAS",
		"Una casa de apuestas pone medio año de sueldo por tu cara en su cartel. La grada odia esa marca —hay pancartas cada domingo— y el club firmó contra ella.":
			"Un bookmaker propose une demi-année de salaire pour ton visage sur son affiche. Les tribunes détestent cette marque —il y a des banderoles chaque dimanche— et le club a signé une charte contre elle.",
		"COBRAR Y FIRMAR": "ENCAISSER ET SIGNER",
		"DECIR QUE NO": "DIRE NON",
		"EL VESTUARIO YA LO SABE": "LE VESTIAIRE LE SAIT DEJA",
		"Pediste salir y la noticia llegó antes que tú al vestuario. Nadie te dice nada, que es peor. El capitán te espera apoyado en tu taquilla.":
			"Tu as demandé à partir et la nouvelle est arrivée au vestiaire avant toi. Personne ne dit rien, ce qui est pire. Le capitaine t'attend, appuyé contre ton casier.",
		"NO ES ASUNTO SUYO": "CE N'EST PAS LEURS AFFAIRES",
		"LA GRADA TE CANTA": "LA TRIBUNE TE CHANTE",
		"En el calentamiento un fondo entero te canta que te vayas ya. A la salida hay bufandas en el suelo y una cámara esperando tu cara.":
			"Pendant l'échauffement, tout un virage te chante de partir maintenant. À la sortie, il y a des écharpes au sol et une caméra qui attend ton visage.",
		"APLAUDIR AL FONDO": "APPLAUDIR LE VIRAGE",
		"SALIR SIN MIRAR": "SORTIR SANS REGARDER",
		"TE HAN PUESTO EN LA LISTA": "TU ES SUR LA LISTE",
		"El club te metió en la lista de transferibles sin avisarte, y te enteraste por la prensa. Hay un micrófono delante y la pregunta ya está hecha.":
			"Le club t'a mis sur la liste des transferts sans te prévenir, et tu l'as appris par la presse. Il y a un micro devant toi et la question est déjà posée.",
		"TRAGARME EL SAPO": "AVALER LA COULEUVRE",
		"CONTAR LA VERDAD": "DIRE LA VERITE",
		"LA MEDALLA DE PLATA": "LA MEDAILLE D'ARGENT",
		"Perdiste la final. En el círculo central te cuelgan la medalla que nadie quiere, y en el túnel hay treinta micrófonos esperando a que señales a alguien.":
			"Tu as perdu la finale. Au rond central, on te passe autour du cou la médaille que personne ne veut, et dans le tunnel trente micros attendent que tu montres quelqu'un du doigt.",
		"CULPAR AL PLANTEAMIENTO": "BLAMER LA TACTIQUE",
		"SEÑALAR AL VESTUARIO": "POINTER LE VESTIAIRE",
		"PASAR DE LARGO SIN HABLAR": "PASSER SANS UN MOT",
		"LA REUNIÓN DE JUNIO": "LA REUNION DE JUIN",
		"Despacho, dos directivos y una carpeta con tu temporada abierta encima de la mesa. No cumpliste, y de aquí nadie sale hasta que la culpa tenga un nombre.":
			"Un bureau, deux dirigeants et un dossier avec ta saison ouvert sur la table. Tu n'as pas été à la hauteur, et personne ne sort d'ici tant que la faute n'a pas de nom.",
		"SEÑALAR AL TÉCNICO": "BLAMER L'ENTRAINEUR",
		"SEÑALAR A LA PLANTILLA": "BLAMER L'EFFECTIF",
		"FIRMAR QUE FUE TU CULPA": "SIGNER QUE C'ETAIT TA FAUTE",
		"CUATRO EN CONTRA": "QUATRE ENCAISSES",
		"Ridículo de los que se recuerdan. La grada se quedó de pie esperando a que alguien subiera a dar la cara, y en el vestuario nadie levanta la vista del suelo.":
			"Une humiliation dont on se souviendra. Les tribunes sont restées debout à attendre que quelqu'un monte assumer, et dans le vestiaire personne ne relève les yeux du sol.",
		"PEDIR PERDÓN EN CALIENTE": "S'EXCUSER A CHAUD",
		"DECIR QUE NO ES PARA TANTO": "DIRE QUE C'EST EXAGERE",
		"REVENTAR EL VESTUARIO": "SECOUER LE VESTIAIRE",
		"PERDISTE EL DERBI": "DERBY PERDU",
		"La ciudad es de ellos durante un año entero. En la puerta hay gente esperando el autobús del equipo, y no vienen a pedir autógrafos.":
			"La ville leur appartient pour une année entière. À la sortie, il y a des gens qui attendent le bus de l'équipe, et ils ne viennent pas pour des autographes.",
		"ENCARARTE CON LA VALLA": "AFFRONTER LA TRIBUNE",
		"CARGAR CONTRA EL ÁRBITRO": "CHARGER L'ARBITRE",
		"IRTE EN SILENCIO": "PARTIR EN SILENCE",
		"FUERA CONTRA UN MODESTO": "ELIMINE PAR UN PETIT",
		"Os echó un equipo de dos categorías más abajo, en un campo de mil personas y con el vestuario de local celebrándolo al lado del vuestro.":
			"Vous avez été éliminés par une équipe de deux divisions en dessous, dans un stade de mille personnes, avec le vestiaire adverse qui fêtait ça juste à côté du vôtre.",
		"DECIR QUE OS SOBRÓ CONFIANZA": "AVOUER L'EXCES DE CONFIANCE",
		"DEFENDER AL GRUPO CONTRA TODOS": "DEFENDRE LE GROUPE CONTRE TOUS",
		"NO ABRIR LA BOCA": "NE PAS OUVRIR LA BOUCHE",
		"EL ESTADIO LLEVARÁ TU NOMBRE": "LE STADE PORTERA TON NOM",
		"La directiva lo anuncia en la próxima junta: quiere ponerle tu nombre al estadio. Es el honor más grande que da un club, y sólo se da una vez.":
			"La direction l'annoncera à la prochaine assemblée : elle veut donner ton nom au stade. C'est le plus grand honneur qu'offre un club, et il ne se donne qu'une fois.",
		"ACEPTAR EL HONOR": "ACCEPTER L'HONNEUR",
		"QUE SEA PARA TODO EL VESTUARIO": "QUE CE SOIT POUR TOUT LE VESTIAIRE",
		"DEJARLO CON SU NOMBRE DE SIEMPRE": "GARDER SON NOM D'ORIGINE",
		"TE PONEN EL MICRO": "LE MICRO SOUS LE NEZ",
		"Figura del partido. La cadena te para antes del vestuario y hay treinta segundos en directo. Lo que digas se repite toda la semana.":
			"Homme du match. La chaîne t'arrête avant le vestiaire et tu as trente secondes en direct. Ce que tu diras sera repassé toute la semaine.",
		"MÉRITO DEL EQUIPO": "MERITE DE L'EQUIPE",
		"HABLAR DE TU MOMENTO": "PARLER DE TA FORME",
		"DEDICÁRSELO A LA GENTE": "LE DEDIER AUX SUPPORTERS",
		"CÓMO LO CUENTAS": "COMMENT TU LE RACONTES",
		"El parte ya salió y el teléfono no para. Toca decir algo sobre la baja, y cada versión tiene su precio.":
			"Le communiqué médical est sorti et le téléphone n'arrête pas. Il faut dire quelque chose sur la blessure, et chaque version a son prix.",
		"VOLVERÉ ANTES DE TIEMPO": "JE REVIENDRAI EN AVANCE",
		"SEGUIR LOS PLAZOS": "RESPECTER LES DELAIS",
		"NO DECIR NADA": "NE RIEN DIRE",
		"El médico no dice plazos: dice que a tu edad una rotura así no vuelve entera. Puedes pelear la rehabilitación y volver mermado, o parar tú antes de que te paren.":
			"Le médecin ne donne pas de délais : il dit qu'à ton âge, une déchirure pareille ne revient jamais entière. Tu peux te battre en rééducation et revenir diminué, ou t'arrêter toi-même avant qu'on ne t'arrête.",
		"REHABILITARME": "ME BATTRE EN REEDUCATION",
		"MÉRITO DE {0}": "MERITE A {0}",
	},





	"leyenda_casa": {
		"DE LA CASA": "FIDELES",
		"Diez temporadas seguidas o más en el club. Una cesión no corta la racha.": "Dix saisons d'affilée ou plus au club. Un prêt ne brise pas la série.",
		"Nadie lleva aún diez temporadas seguidas en {0}.": "Personne n'a encore joué dix saisons d'affilée à {0}.",

		"PASARON POR AQUÍ": "PASSES PAR ICI",
		"Jugaron aquí y hoy están en otro club, los mejores primero.": "Ils ont joué ici et sont aujourd'hui dans un autre club, les meilleurs d'abord.",
		"Nadie que pasara por {0} sigue en activo en otro club.": "Personne passé par {0} n'est encore en activité dans un autre club.",
		"TEMP.": "SAIS.",
		"Bandera del Club": "Emblème du Club",
		"Jugar 10 temporadas seguidas en un mismo club.": "Jouer 10 saisons d'affilée dans le même club.",
	},

	"achievements": {},




	"practice": {
		"VOLVER": "RETOUR",
		"SALIR A MENÚ": "QUITTER VERS MENU",
		"EMPEZAR DE NUEVO": "RECOMMENCER",
		"Elige una jugada y repítela sin límite: cada intento arma un escenario distinto dentro de ese tipo. Nada cuenta para la carrera. Se sale con PAUSA.": "Choisis une action et répète-la sans limite : chaque essai construit un scénario différent dans ce type. Rien ne compte pour la carrière. Tu sors avec PAUSE.",
		"JUEGO ABIERTO": "JEU OUVERT",
		"BALÓN PARADO": "BALLE ARRETEE",
		"CONDUCCIÓN": "CONDUITE",
		"Mano a mano": "Un contre un",
		"Disparo frontal": "Tir en bordure de surface",
		"Desde lejos": "Tir de loin",
		"Ángulo cerrado": "Angle fermé",
		"Rebote en el área": "Ballon perdu dans la surface",
		"Contraataque": "Contre-attaque",
		"Volea": "Volée",
		"Centro al área": "Centre dans la surface",
		"Centro desde el fondo": "Centre depuis la ligne de fond",
		"Tiro libre": "Coup franc",
		"Tiro de esquina": "Corner",
		"Penal": "Penalty",
		"Saque de banda largo": "Longue touche",
		"Falta al borde del área": "Coup franc à l'entrée de la surface",
		"Regate 1 contra 1": "Dribble 1 contre 1",



		"EL CAMPO": "LE TERRAIN",
		"AZOTEA": "LE TOIT",
		"TU ESTADIO": "TON STADE",
		"EL TIEMPO": "LE TEMPS",
		"SORTEO": "AU HASARD",


		"SOL": "SOLEIL",
		"NUBES": "NUAGES",
		"TARDE": "SOIR",
		"LLUVIA": "PLUIE",
		"NOCHE": "NUIT",
		"NIEVE": "NEIGE",
		"En la azotea siempre anochece y siempre llueve: es su hora. Juega en TU ESTADIO si quieres mandar sobre el tiempo.": "Sur le toit il fait toujours nuit et il pleut toujours : c'est son heure. Joue dans TON STADE si tu veux commander le temps.",
		"Se sortea como en un partido de verdad.": "Tiré au sort, comme dans un vrai match.",
		"Sin límite · no cuenta para la carrera": "Sans limite · ne compte pas pour la carrière",
		"Tu estadio con {0}.": "Ton stade, {0}.",






		"Soleado": "Ensoleillé",
		"Nublado": "Couvert",
		"Atardecer": "Crépuscule",
		"Lluvia": "Pluie",
		"Noche": "Nuit",
		"Nieve": "Neige",



		"Llovizna": "Bruine",
		"Tormenta": "Orage",
	},


		"career_screens": {

		"TRAYECTORIA": "PARCOURS",
		"DESDE T{0}": "DES S{0}",

		"DESDE {0}": "DES {0}",


		"viaLIBRE": "LIBRE",
		"viaEDITOR": "EDITEUR",
		"TRASPASO": "VENDU",
		"FIN CESION": "FIN PRET",
		"COMPRADO": "ACHETE",

		"HAY UNA PARED AHI": "IL Y A UN MUR ICI",
		"PUERTAS Y VENTANAS": "PORTES ET FENETRES",

		"PINO": "PIN",
		"NOGAL": "NOYER",
		"NEGRO MATE": "NOIR MAT",
		"ALUMINIO": "ALUMINIUM",
		"LATÓN": "LAITON",




		"RITMO": "RYTHME",
		"FALTO DE RITMO · SE PASA JUGANDO": "MANQUE DE RYTHME · ÇA PASSE EN JOUANT",
		"EL TÉCNICO TE DA DESCANSO · LO VES DESDE LA GRADA":
			"LE COACH TE MET AU REPOS · TU REGARDES DES TRIBUNES",
		"POR DEBAJO DE {0} EMPIEZAS EN LA BANCA": "EN DESSOUS DE {0} TU COMMENCES SUR LE BANC",




		"POR DEBAJO DE {0} NO TE CONVOCAN": "EN DESSOUS DE {0} TU N'ES PAS RETENU",


		"AÑO {0} · SEM {1}/{2}": "AN {0} · SEM {1}/{2}",
		"energiaFUERA": "HORS",
		"energiaBANCA": "BANC",
		"Aún no llevas {0} partidos: esta vez no cuenta.":
			"Tu n'as pas encore joué {0} matchs : cette fois ça ne compte pas.",

		"MANTENIMIENTO": "ENTRETIEN",
		"En segunda tu club abre tienda oficial: merch, y la tabla de las camisetas más vendidas del vestuario.":
			"En deuxième division ton club ouvre une boutique officielle : du merch, et le tableau des maillots les plus vendus du vestiaire.",
		"LAS MÁS VENDIDAS": "LES PLUS VENDUS",
		"{0} AL AÑO": "{0} PAR AN",
		"Lo que mueve cada uno de la marca del club. Vender camisetas te hace más difícil de vender a ti.":
			"Ce que chacun fait bouger de la marque du club. Vendre des maillots te rend plus difficile à vendre.",
		"JUGADOR": "JOUEUR",
		"CUOTA": "PART",

		"TUS TEMPORADAS": "TES SAISONS",
		"AÑO": "ANNEE",
		"{0}º de {1}": "{0}e sur {1}",
		"Tu dorsal, el {0}, se elige al fichar o al renovar.":
			"Ton numéro, le {0}, se choisit à la signature ou à la prolongation.",
		"A la espalda: {0}": "Dans le dos : {0}",
		"GOL DE PENAL EN LIGA": "BUT SUR PENALTY EN CHAMPIONNAT",
		"GOL DE PENAL EN {0}": "BUT SUR PENALTY EN {0}",

		"Tu media es {0}. Con la vara de {1} son {2}, y ése es el número que se mide contra la lista.":
			"Ta moyenne est {0}. À l'aune de {1} elle vaut {2}, et c'est ce chiffre qui est mesuré face à la liste.",
		"Y el seleccionador te apunta {0} por lo de fuera del campo, así que la lista te lee {1}.":
			"Et le sélectionneur te compte {0} pour ce que tu fais hors du terrain, donc la liste te lit à {1}.",
		"Tu país no tiene liga propia: eres su estrella indiscutible.":
			"Ton pays n'a pas de championnat propre : tu es sa star incontestée.",
		"Te faltan {0} puntos para entrar en la convocatoria.":
			"Il te manque {0} points pour entrer dans la sélection.",
		"Aún no entras en la convocatoria.": "Tu n'es pas encore dans la sélection.",
		"Sin nacionalidad: no hay selección que disputar.":
			"Sans nationalité : aucune sélection à disputer.",
		"{0} · {1} CANDIDATOS": "{0} · {1} CANDIDATS",
		"DORSAL {0}": "NUMERO {0}",
		"1-{0} ONCE": "1-{0} ONZE",
		"{0}-{1} BANCA": "{0}-{1} BANC",
		"El suelo, la pared y la carpintería, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.": "Le sol, le mur et les menuiseries, à ton goût. Achetés séparément et gardés : tu peux en changer quand tu veux.",
		"MUDARSE": "DEMENAGER",
		"El terreno crece a {0}×{0} m y todo lo que construiste se queda.": "Le terrain passe à {0}×{0} m et tout ce que tu as construit reste.",
		"La casa más grande que se vende, y una planta hecha a la medida.": "La plus grande maison en vente, et un plan sur mesure.",
		"Todo lo que construiste se queda.": "Tout ce que tu as construit reste.",
		"Ya vives en la mejor casa: no hay ninguna encima.": "Tu vis déjà dans la meilleure maison : il n'y a rien au-dessus.",
		"PRECIO": "PRIX",

		"PONER VENTANA": "METTRE FENETRE",
		"PUERTA DOBLE": "PORTE DOUBLE",
		"PONER ARCO": "POSER ARCHE",
		"PONER VENTANAL": "POSER BAIE VITREE",
		"PONER OJO DE BUEY": "POSER OEIL DE BOEUF",
		"DOBLE": "DOUBLE",
		"ARCADA": "ARCHE",
		"VENTNL": "VITREE",
		"OJO": "OEIL",
		"QUITAR VENTANA": "MURER",
		"VENTAN": "FENETRE",
		"TAPIAR": "MURER",

		"VACIAR": "VIDER",
		"PUESTOS": "POSES",
		"TABIQUES": "CLOISONS",
		"PINTADO": "PEINT",
		"TIRADOS": "ABATTUS",
		"DESPINTADO": "EFFACE",
		"MANTEN PARA GUARDAR TODO": "MAINTIENS POUR TOUT RANGER",
		"MANTEN PARA DEJARLO LIMPIO": "MAINTIENS POUR TOUT VIDER",
		"MANTEN PARA ARRASAR": "MAINTIENS POUR TOUT RASER",
		"PLANOS": "PLANS",
		"Cuartos ya repartidos, con sus puertas puestas.": "Des pièces déjà réparties, portes comprises.",
		"Este terreno es demasiado chico para repartirlo en cuartos.": "Ce terrain est trop petit pour être divisé en pièces.",
		"LO QUE SE VA": "CE QUI DISPARAIT",
		"El plano REEMPLAZA tu casa: tira tus paredes, borra la pintura y recoge tus muebles al inventario.": "Le plan REMPLACE ta maison : tes murs tombent, la peinture s'efface et tes meubles retournent à l'inventaire.",
		"PAREDES QUE HAY": "MURS ACTUELS",
		"Aplicar un plano las tira todas y pone las suyas.": "Appliquer un plan les abat tous et pose les siens.",
		"DOS AMBIENTES": "DEUX ESPACES",
		"Un muro con puerta: día de un lado, noche del otro.": "Un mur avec porte : le jour d'un côté, la nuit de l'autre.",
		"DOS RECÁMARAS": "DEUX CHAMBRES",
		"TRES CUARTOS Y BAÑO": "TROIS PIECES ET SALLE DE BAIN",
		"Añade un baño en la esquina de la entrada.": "Ajoute une salle de bain dans le coin de l'entrée.",
		"Dos cuartos al fondo, con su puerta cada uno, y el salón al frente.": "Deux pièces au fond, chacune avec sa porte, et le salon devant.",
		"CUATRO CUARTOS": "QUATRE PIECES",
		"Cocina aparte, salón al frente y dos cuartos al fondo.": "Une cuisine à part, le salon devant et deux pièces au fond.",
		"PASILLO Y CUATRO CUARTOS": "COULOIR ET QUATRE PIECES",
		"Un pasillo desde la puerta, dos cuartos por lado y el salón al fondo.": "Un couloir depuis la porte, deux pièces de chaque côté et le salon au fond.",
		"{0} cuartos": "{0} pièces",
		"O YA AMUEBLADA": "OU AVEC LES MEUBLES",





		"rotANULAR": "ANNUL.",
		"rotDESHAZ": "DEFAIT",
		"rotCERRAR": "FERMER",
		"rotGIRAR": "TOURNE",
		"rotMOVER": "BOUGER",
		"rotOTRO": "SUIV.",
		"rotPINTAR": "PEINT",
		"rotPLANOS": "PLANS",
		"rotQUITAR": "RETIR.",
		"rotTAPAR": "SCELL.",
		"rotTAPIAR": "MURER",
		"rotTAPONA": "BLOQUE",
		"rotTIRAR": "DEMOL.",
		"rotTRAMO": "TRONC.",
		"rotVACIAR": "VIDER",
		"rotVENTAN": "FENETR",
		"En este plano no cabe el juego de muebles completo.": "L'ensemble complet de meubles ne tient pas dans ce plan.",
		"Llega con {0} muebles ya puestos en su sitio.": "Livrée avec {0} meubles déjà en place.",
		"Sueltos costarían {0}": "Séparément : {0}",
		"AMUEBLADA": "AVEC MEUBLES",
		"Calculando la oferta…": "Calcul de l'offre…",
		"COMPRAR AMUEBLADA · {0}": "ACHETER AVEC MEUBLES · {0}",
		"PAGASTE": "MONTANT",
		"Y de paso te acomodamos {0} muebles que ya tenías guardados.": "On a aussi installé {0} meubles que tu avais en réserve.",
		"Muévelo todo si quieres: la casa ya es tuya y nada está clavado.": "Déplace tout si tu veux : la maison est à toi et rien n'est cloué.",
		"MANTEN PARA PONER ESTE PLANO": "MAINTIENS POUR CE PLAN",
		"Tira TAMBIÉN el cascarón y las paredes de fábrica. Queda el terreno con su piso.": "Abat AUSSI la coque et les murs d'origine. Il reste le terrain et son sol.",
		"Ni muebles, ni paredes, ni pintura: este terreno ya está pelado.": "Ni meubles, ni murs, ni peinture : ce terrain est déjà nu.",
		"{0} paredes": "{0} murs",
		"PLANO": "PLAN",
		"Muévelas, tíralas o ábreles más puertas: ahora son tuyas.": "Déplace-les, abats-les ou ouvre d'autres portes : elles sont à toi.",
		"MARCOS DE TODA LA CASA": "MENUISERIE DE LA MAISON",
		"Puertas, ventanas, corredizas, rodapiés y remates.": "Portes, fenêtres, baies, plinthes et couronnements.",
		"PONER CORREDIZA": "POSER BAIE COULISSANTE",
		"QUITAR CORREDIZA": "RETIRER LA BAIE",
		"PARED CORTA": "MUR TROP COURT",
		"CORRED": "BAIE",
		"CORTA": "COURT",
		"TAPAR": "SCELLER",
		"YA ESTA PELADO": "DEJA NU",
		"TIRAR TODO EL TRAMO": "ABATTRE TOUT LE PAN",
		"NO HAY NADA PUESTO": "RIEN N'EST POSE",
		"YA ESTA LIMPIO": "DEJA VIDE",
		"Recoge tus muebles al inventario. Las paredes y la pintura se quedan.": "Range tes meubles dans l'inventaire. Les murs et la peinture restent.",
		"Además tira tus tabiques, cierra los boquetes y borra la pintura del suelo.": "Abat aussi tes cloisons, referme les brèches et efface la peinture du sol.",
		"Nada se pierde: todo lo que compraste sigue en tu inventario.": "Rien n'est perdu : tout ce que tu as acheté reste dans ton inventaire.",
		"Esta planta ya está vacía: todo lo tuyo está en el inventario.": "Cet étage est déjà vide : tout ce qui est à toi est dans l'inventaire.",
		"Ni muebles puestos, ni tabiques tuyos, ni pintura: no hay nada que quitar.": "Ni meubles posés, ni cloisons à toi, ni peinture : il n'y a rien à enlever.",
		"YA ESTA": "FINI",
		"A CAJAS": "EN BOITE",
			"VALOR DE MERCADO": "VALEUR MARCHANDE",
			"TU SITIO EN EL EQUIPO": "TA PLACE DANS L'EQUIPE",
			"ROL DE CONTRATO": "ROLE DU CONTRAT",
			"PRÓXIMO PARTIDO": "PROCHAIN MATCH",
			"{0} · ~{1} MIN": "{0} · ~{1} MIN",
			"ÚLTIMO PARTIDO": "DERNIER MATCH",
			"{0} MIN · {1}": "{0} MIN · {1}",
			"NO JUGASTE": "PAS JOUE",
			"FORMA · {0}": "FORME · {0}",
			"MEDIA TEMPORADA": "NOTE SAISON",
			"MEDIA CARRERA": "NOTE CARRIERE",
			"HABILIDADES · {0} PUNTOS": "COMPETENCES · {0} POINTS",
			"HABILIDADES · TODO AL TOPE": "COMPETENCES AU MAX",
			"Ya no queda nada que subir: los puntos que ganes se convierten en experiencia.": "Plus rien à monter : les points gagnés deviennent de l'expérience.",
			"Penales": "Penalties",
			"Tiros libres y córners": "Coups francs et corners",
			"{0}: los lanzas TÚ": "{0} : c'est TOI qui les tires",
			"{0}: los lanza {1} — tú cobras ~{2} de cada 10":
				"{0} : c'est {1} qui les tire — tu en récupères ~{2} sur 10",
			"{0}: los lanza {1} — supéralo para quitárselos":
				"{0} : c'est {1} qui les tire — dépasse-le pour les récupérer",
			"SU NIVEL": "SON NIVEAU",
			"TU NIVEL": "TON NIVEAU",
			"TÚ COBRAS": "TU LES TIRES",
			"En racha (+{0})": "En forme (+{0})",
			"En baja ({0})": "En méforme ({0})",
			"Estable": "Stable",
			"Potencia": "Puissance",
			"Precisión": "Précision",
			"Efecto": "Effet",
			"Visión": "Vision",
			"Físico": "Physique",
			"Velocidad": "Vitesse",
			"Aceleración": "Accélération",
			"Regate": "Dribble",
			"Balón parado": "Coups de pied arrêtés",
			"Pegada": "Frappe",
			"Puntería": "Finition",
			"Rosca": "Enroulé",
			"Cabeza": "Jeu de tête",
			"Reflejos": "Réflexes",
			"Entrada": "Tacle",
			"{0} · MEDIA {1}": "{0} · NOTE {1}",
			"TE PELEA EL PUESTO": "TE DISPUTE LA PLACE",
			"VER PLANTEL": "VOIR L'EFFECTIF",
			"La velocidad a la que sale el balón de tu pie. Sólo la entregas entera si le pegas al empeine.":
				"La vitesse à laquelle le ballon quitte ton pied. Tu ne la donnes en entier que sur une frappe du cou-de-pied bien nette.",
			"Cuánto respeta el balón la línea que trazaste. Cierra el abanico de error del apuntador.":
				"Jusqu'à quel point le ballon suit la ligne que tu as tracée. Ça réduit la marge d'erreur de la visée.",
			"Cuánto comba el balón en el aire. También es el toque con el que conduces en el regate.":
				"Combien le ballon se courbe dans les airs. C'est aussi le toucher avec lequel tu conduis en dribble.",
			"Desde 85 ves dibujada la línea de fuera de juego. El árbitro la pita igual sin ella.":
				"Dès 85 tu vois la ligne de hors-jeu dessinée sur le terrain. L'arbitre la siffle pareil sans elle.",
			"Lo rápido que corres con el balón en el regate: si eres lento te la quitan, si eres rápido no te alcanzan. No toca el tiro.":
				"La vitesse à laquelle tu cours balle au pied en dribble : si tu es lent on te la prend, si tu es rapide on ne te rattrape pas. Ça ne touche pas au tir.",
			"Qué tan rápido llegas a tu velocidad máxima: el arranque, el frenazo y la marcha atrás al conducir.":
				"Ta rapidité pour atteindre ta vitesse maximale : le démarrage, le freinage et la marche arrière en conduite.",
			"Tu control del balón en carrera: el quiebre sin perder velocidad y a qué distancia te lo pueden robar.":
				"Ton contrôle du ballon en course : le crochet sans perdre de vitesse, et à quelle distance on peut te le voler.",
			"DE PARADO A TU MÁXIMA EN {0} S": "DE L'ARRET A TON MAX EN {0} S",
			"TE ROBAN A {0} CM DEL BALÓN": "ON TE LE PREND A {0} CM",
			"Cada punto sobre el lanzador de tu equipo te da más penales. NO cuenta para tu media.":
				"Chaque point au-dessus du tireur de ton équipe te donne plus de penalties. ÇA NE compte PAS pour ta note.",
			"Cada punto sobre el lanzador de tu equipo te da más faltas y córners. NO cuenta para tu media.":
				"Chaque point au-dessus du tireur de ton équipe te donne plus de coups francs et corners. ÇA NE compte PAS pour ta note.",
			"TU TIRO: {0} KM/H": "TON TIR : {0} KM/H",
			"TU CABEZAZO: {0} KM/H": "TA TETE : {0} KM/H",
			"A {0} M EL BALÓN SALE DENTRO DE ±{1} CM": "A {0} M LE BALLON SORT DANS ±{1} CM",
			"SIN ABANICO: EL BALÓN VA POR DONDE APUNTAS": "SANS MARGE : LE BALLON VA OU TU VISES",
			"COMBA ×{0}": "EFFET ×{0}",
			"VES LA LÍNEA DE FUERA DE JUEGO EN LA CANCHA": "TU VOIS LA LIGNE DE HORS-JEU SUR LE TERRAIN",
			"TE FALTAN {0} PARA VER LA LÍNEA DE FUERA DE JUEGO": "IL TE MANQUE {0} POUR VOIR LA LIGNE DE HORS-JEU",
			"CORRES A {0} M/S · EL DEFENSA MÁS RÁPIDO, {1}":
				"TU COURS A {0} M/S · LE DEFENSEUR LE PLUS RAPIDE, {1}",
			"LOS COBRAS TODOS": "TU LES TIRES TOUS",
			"COBRAS {0} DE CADA 10": "TU EN TIRES {0} SUR 10",
			"DESHACER": "ANNULER",
			"PUNTO DEVUELTO · {0}": "POINT REMBOURSE · {0}",
			"Al salir del perfil, lo repartido queda firmado.":
				"En quittant le profil, la répartition est actée.",
			"ESPORÁDICO": "MARGINAL",
			"ROTACIÓN": "ROTATION",
			"MEDIA {0}": "NOTE {0}",
			"MEDIA {0} EN {1} JORNADAS": "NOTE {0} SUR {1} JOURNEES",
			"{0} de {1} · {2}/{3} jornadas": "{0} sur {1} · {2}/{3} journées",
			"JUGAR {0} JORNADAS": "JOUER {0} JOURNEES",
			"JUGAR {0} JORNADAS DE {1}' O MÁS": "JOUER {0} JOURNEES DE {1}' OU PLUS",
			"{0} GOLES": "{0} BUTS",
			"CONTRATO": "CONTRAT",
			"Club: {0} ({1})": "Club : {0} ({1})",
			"Sueldo: ${0} por partido": "Salaire : {0}$ par match",
			"Temporadas restantes: {0}": "Saisons restantes : {0}",
			"tu club": "ton club",
			"CEDIDO · el contrato es con {0}": "PRETE · le contrat est avec {0}",
			"Mantenimiento del estilo de vida: -${0} por partido":
				"Entretien du train de vie : -{0}$ par match",
			"OBJETIVO DE TEMPORADA": "OBJECTIF DE SAISON",
			"CLÁUSULA PERSONAL": "CLAUSE PERSONNELLE",
			"Sin cláusula. Una condición con dientes a cambio de renunciar a las otras.": "Aucune clause. Une condition qui mord, en échange de renoncer aux autres.",
			"ANTI-DESCENSO": "ANTI-RELEGATION",
			"Si el club baja de categoría, quedas AGENTE LIBRE.": "Si le club descend, tu deviens AGENT LIBRE.",
			"PROMESA DE TITULARIDAD": "PROMESSE DE TITULAIRE",
			"Si juegas pocos partidos esta temporada, quedas AGENTE LIBRE.": "Si tu joues peu cette saison, tu deviens AGENT LIBRE.",
			"NO A UN RIVAL": "PAS CHEZ UN RIVAL",
			"Tu club no puede venderte a tu rival de siempre.": "Ton club ne peut pas te vendre à ton rival de toujours.",
			"ELEGIR CLÁUSULA": "CHOISIR CLAUSE",
			"CAMBIAR CLÁUSULA": "CHANGER CLAUSE",
			"La cláusula se pacta al arranque de la temporada.": "La clause se fixe en début de saison.",
			"Sólo una a la vez. Se pacta al arranque de la temporada.": "Une seule à la fois. Fixée en début de saison.",
			"SIN CLÁUSULA": "AUCUNE CLAUSE",
			"CLÁUSULA PACTADA": "CLAUSE FIXEE",
			"ES TU RIVAL: tu CLÁUSULA impide que acabes aquí.": "C'EST TON RIVAL : ta CLAUSE t'empêche de finir ici.",
			"CLÁUSULA ANTI-DESCENSO: el club bajó y quedas AGENTE LIBRE.": "CLAUSE ANTI-RELEGATION : le club est descendu, tu es AGENT LIBRE.",
			"PROMESA DE TITULARIDAD incumplida ({0} partidos): quedas AGENTE LIBRE.": "PROMESSE DE TITULAIRE non tenue ({0} matchs) : tu es AGENT LIBRE.",
			"PACTAR OBJETIVO": "FIXER L'OBJECTIF",
			"PACTAR EL OBJETIVO": "FIXER L'OBJECTIF",
			"Más exigente paga más prima; más cómodo, menos. Se pacta una vez, al arranque de la temporada.":
				"Plus dur paie plus de prime ; plus facile, moins. Une fois, en début de saison.",
			"CÓMODO": "PLUS FACILE",
			"COMO ESTÁ": "TEL QUEL",
			"EXIGENTE": "PLUS DUR",
			"OBJETIVO PACTADO": "OBJECTIF FIXE",
			"Ya pactaste tu objetivo esta temporada.": "Tu as déjà fixé ton objectif cette saison.",
			"top {0}": "top {0}",
			"{0} asist.": "{0} passes d.",
			"{0} part.": "{0} matchs",
			"nota {0}": "note {0}",
			"{0} goles": "{0} buts",
			"RENOVAR CONTRATO": "RENOUVELER LE CONTRAT",
			"LA OFERTA DEL CLUB": "L'OFFRE DU CLUB",
			"AÑOS QUE OFRECEN": "ANNEES PROPOSEES",
			"NINGUNO": "AUCUN",
			"SUELDO NUEVO": "NOUVEAU SALAIRE",


			"EQUILIBRIO": "EQUILIBRE",
			"MÁS AÑOS": "DUREE",
			"LIBERTAD": "LIBERTE",
			"PRIMA DE FIRMA": "PRIME",
			"CLÁUSULA": "CLAUSE",
			"Cobras $ {0} de prima al firmar.":
				"Tu touches {0}$ de prime à la signature.",
			"Cláusula baja: si un club la paga, el tuyo no puede negarse.":
				"Clause basse : si un club la paie, le tien ne peut pas refuser.",
			"Cláusula en $ {0}: quien la pague, te lleva.":
				"Clause à {0}$ : qui la paie t'emmène.",

			"BANDERA":
				"SYMBOLE",
			"Tu grada frena tu venta: cobras más y el club te blinda con una cláusula un {0} % más alta.":
				"Tes supporters freinent ta vente : tu gagnes plus et le club te protège avec une clause {0} % plus haute.",
			"Cláusula en $ {0}: tu grada frena tu venta.":
				"Clause à {0}$ : tes supporters freinent ta vente.",
			"Aceptaste salir: tu grada ya no te quiere y el club te ofrece a quien pregunte, más barato. Sigues jugando mientras llega tu destino.":
				"Tu as accepté de partir : tes supporters ne veulent plus de toi et le club te propose à qui demande, moins cher. Tu continues à jouer en attendant ta destination.",
			"TU GRADA TE QUIERE FUERA":
				"TES SUPPORTERS VEULENT TON DEPART",
			"Negarte no te cuesta nada: el club no necesita tu dinero, necesita que dejen de pitarte. Si aceptas, te venden más barato.":
				"Refuser ne te coûte rien : le club n'a pas besoin de ton argent, il a besoin qu'on arrête de te siffler. Si tu acceptes, on te vend moins cher.",
			"Te quedas, y en el vestuario nadie te lo reprocha. La grada no cambia sola: esa hay que ganársela en el campo.":
				"Tu restes, et personne au vestiaire ne te le reproche. Les tribunes ne changeront pas seules : il faut les reconquérir sur le terrain.",
			"Te sientan en el vestuario con el director deportivo. En {0} la grada ya no te quiere y el club la escucha: te ofrecen a quien pregunte, y más barato. Si te quedas, nadie aquí dentro te lo reprocha.":
				"On t'assoit au vestiaire avec le directeur sportif. Chez {0}, les supporters ne veulent plus de toi et le club les écoute : on te propose à qui demande, et moins cher. Si tu restes, personne ici ne te le reprochera.",

			"La ficha sale de: {0}": "Le salaire vient de : {0}",
			"tu nivel": "ton niveau",
			"tu prestigio": "ton prestige",
			"tus títulos": "tes titres",
			"tu afición": "tes supporters",
			"tus récords": "tes records",
			"su interés": "leur intérêt",
			"tu temporada": "ta saison",
			"Quedan {0} · al firmar tendrías {1} en total":
				"Il reste {0} · en signant tu aurais {1} au total",
			"Tu sueldo {0} de $ {1} a $ {2} por partido":
				"Ton salaire {0} de {1}$ à {2}$ par match",
			"sube": "augmente",
			"baja": "diminue",
			"Te renuevan con el mismo sueldo.": "Ils te renouvellent au même salaire.",
			"Te firman como {0}": "Ils te signent comme {0}",
			"Por tu temporada: {0}{1}% sobre el sueldo":
				"Pour ta saison : {0}{1}% sur le salaire",
			"Es el techo salarial del club: no pueden pagar más.":
				"C'est le plafond salarial du club : ils ne peuvent pas payer plus.",
			"Negocian sobre tu ficha actual: nadie da más salto en una firma.": "Ils négocient sur ton salaire actuel : personne ne saute plus haut en une signature.",
			"¿RENOVAR?": "RENOUVELER ?",
			"{0} años más (tendrías {1}) y ficha de $ {2} por partido.":
				"{0} an(s) de plus (tu aurais {1}) et une paie de {2}$ par match.",
			"Es MENOS de lo que cobras ahora.": "C'est MOINS que ce que tu touches maintenant.",
			"CONTRATO RENOVADO": "CONTRAT RENOUVELE",
			"SOLO EN TU ÚLTIMO AÑO": "SEULEMENT LA DERNIERE ANNEE",
			"EL TÉCNICO NO RENUEVA": "L'ENTRAINEUR REFUSE",
			"RENEGOCIAR": "RENEGOCIER",
			"PEDIR RENEGOCIACIÓN": "RENEGOCIER",
			"LO QUE PUEDES PEDIR": "CE QUE TU PEUX DEMANDER",
			"AÑOS QUE SUMAS": "ANNEES AJOUTEES",
			"PRIMAS PACTADAS": "PRIMES CONVENUES",
			"MESA DE CONTRATO": "TABLE DE NEGOCIATION",
			"CONTRATO MEJORADO": "CONTRAT AMELIORE",
			"Tu sueldo sube de $ {0} a $ {1} por partido":
				"Ton salaire passe de {0}$ à {1}$ par match",
			"Te reconocen como {0}": "Ils te reconnaissent comme {0}",
			"Por tu temporada: +{0}% sobre el sueldo": "Pour ta saison : +{0}% sur le salaire",
			"Sueldo: $ {0} → $ {1} (+$ {2})": "Salaire : {0}$ → {1}$ (+{2}$)",
			"Años: +{0} (tendrías {1})": "Années : +{0} (tu aurais {1})",
			"Prima por gol: +$ {0}": "Prime par but : +{0}$",
			"Prima por asistencia: +$ {0}": "Prime par passe décisive : +{0}$",
			"Rol: te reconocen como {0}": "Rôle : reconnu comme {0}",
			"Para renegociar antes: {0}": "Pour renégocier plus tôt : {0}",
			"Eres agente libre: negocia con un club nuevo.":
				"Tu es agent libre : négocie avec un nouveau club.",
			"Estás cedido: tu contrato lo lleva el club dueño.":
				"Tu es prêté : ton contrat appartient au club propriétaire.",
			"Ya firmaste un precontrato con otro club.":
				"Tu as déjà signé un précontrat avec un autre club.",
			"El club te dio por perdido; no hay mesa.":
				"Le club a fait une croix sur toi ; pas de négociation.",
			"Pediste salir: arréglalo con el club antes de negociar.":
				"Tu as demandé à partir : règle ça avec le club avant de négocier.",
			"Es tu último año: el club ya te ofrece renovar.":
			"C'est ta dernière année : le club te propose déjà de prolonger.",
		"Acabas de firmar: cumple una temporada antes de pedir mejora.":
			"Tu viens de signer : termine une saison avant de demander mieux.",
		"Te queda mucho contrato: el club no tiene por qué moverlo.":
			"Il te reste beaucoup de contrat : le club n'a aucune raison d'y toucher.",
		"El club no negocia fichas con el mercado cerrado.":
			"Le club ne négocie pas de salaire quand le marché est fermé.",
		"El club no se sentó contigo este año. Vuelve la temporada que viene.":
			"Le club n'a pas voulu s'asseoir avec toi cette année. Reviens la saison prochaine.",
		"FIRMAR LA MEJORA":
			"SIGNER L'ACCORD",
		"El club ya cuenta con tu salida: no te convoca.":
			"Le club a déjà acté ton départ : plus de convocation.",
		"Renueva o busca club, o no juegas.":
			"Prolonge ou trouve un club, sinon tu ne joues pas.",
		"Una bala al año. Si fallas, esperas.":
			"Une cartouche par an. Si tu rates, tu attends.",
		"PEDIR MESA AL CLUB":
			"DEMANDER A NEGOCIER",
		"SE SIENTAN":
			"ILS ACCEPTENT",
		"Se sientan contigo un {0}% de las veces. Si dicen que no, no habrá mesa esta temporada.":
			"Ils acceptent {0}% du temps. S'ils refusent, il n'y aura pas de table cette saison.",
		"PEDIR MESA":
			"DEMANDER",
		"SE SIENTAN CONTIGO":
			"ILS ACCEPTENT",
		"NO HAY MESA ESTE AÑO":
			"AUCUNE TABLE CETTE SAISON",
		"Ya renegociaste esta temporada. Vuelve el año que viene.":
				"Tu as déjà renégocié cette saison. Reviens l'an prochain.",
			"Aún no jugaste lo suficiente esta temporada.":
				"Tu n'as pas encore assez joué cette saison.",
			"Sube tu media a {0} para sentarte a negociar.":
				"Monte ta note à {0} pour t'asseoir à la table.",
			"Gánate al técnico antes de pedir mejora.":
				"Gagne la confiance de l'entraîneur avant de demander mieux.",
			"EN EL ESCAPARATE": "EN VITRINE",
			"No renuevas: el club te vende y juegas menos hasta que salgas.":
				"Tu ne renouvelles pas : le club te vend et tu joues moins jusqu'à ton départ.",
			"Busca una salida en el MERCADO, o aguanta el año y quedarás AGENTE LIBRE al"
			+ " final.":
				"Trouve une sortie sur le MARCHE, ou tiens l'année et tu deviendras AGENT LIBRE"
				+ " à la fin.",
			"NO RENOVAR": "NE PAS RENOUVELER",
			"¿NO RENOVAR?": "NE PAS RENOUVELER ?",
			"El club te pondrá en venta para no perderte gratis. Si no sales, jugarás menos"
			+ " el resto del año. Si aguantas, quedarás libre al final.":
				"Le club te mettra sur le marché pour ne pas te perdre gratuitement. Si tu ne"
				+ " pars pas, tu joueras moins le reste de l'année. Si tu tiens bon, tu seras"
				+ " libre à la fin.",
			"NO RENUEVO": "JE NE RENOUVELLE PAS",
			"NO RENUEVAS · EL CLUB TE VENDE": "PAS DE RENOUVELLEMENT · LE CLUB TE VEND",
			"EL CLUB TE VENDE": "LE CLUB TE VEND",
			"EL FINAL": "LA FIN",
			"Los años ya pesan. Puedes seguir peleando... o cerrar la carrera y entrar en"
			+ " la historia con lo que ganaste.":
				"Les années pèsent déjà. Tu peux continuer à te battre... ou clore ta carrière"
				+ " et entrer dans l'histoire avec ce que tu as gagné.",
			"Juegues lo que juegues, a los {0} años se acaba: te queda {1} temporada.": "Quoi que tu fasses, ça s'arrête à {0} ans : il te reste {1} saison.",
			"Juegues lo que juegues, a los {0} años se acaba: te quedan {1} temporadas.":
				"Quoi que tu fasses, ça s'arrête à {0} ans : il te reste {1} saisons.",
			"COLGAR LAS BOTAS": "RACCROCHER LES CRAMPONS",
			"MEJOR NO": "PLUTOT PAS",
			"¿COLGAR LAS BOTAS?": "RACCROCHER LES CRAMPONS ?",
			"Se acaba de verdad: no hay más partidos. Tu legado, tu vitrina y tu historia"
			+ " quedan guardados para siempre.":
				"C'est vraiment fini : plus aucun match. Ton héritage, ta vitrine et ton"
				+ " histoire restent gravés pour toujours.",
			"ME RETIRO": "JE PRENDS MA RETRAITE",
			"MANTÉN PARA RETIRARTE": "MAINTIENS POUR ARRETER",
			"AÚN ME QUEDA FÚTBOL": "J'AI ENCORE DU FOOT EN MOI",
			"Termina {0} o mejor en la liga.": "Termine {0} ou mieux en championnat.",
			"La liga aún no arranca.": "Le championnat n'a pas encore commencé.",
			"Vas {0}{1}": "Tu es {0}{1}",
			"sin clasificar": "non classé",
			"Da {0} asistencias  (llevas {1})": "Fais {0} passes décisives  (tu en as {1})",
			"Marca {0} goles  (llevas {1})": "Marque {0} buts  (tu en as {1})",
			"TU VALOR": "TA VALEUR",
			"TE PIDEN": "DEMANDE",
			"EN LISTA": "SUR LA LISTE",
			"CONTRATO CORTO": "CONTRAT COURT",
			"Tu agente está en {0}: te consigue {1} oferta(s) por ventana.":
				"Ton agent est à {0} : il te trouve {1} offre(s) par mercato.",
			"LOS OJEADORES": "LES RECRUTEURS",
			"Un club mira tres cosas y te juzga por la más floja. Para que te busque un"
			+ " grande, tienes que ser bueno en las tres.":
				"Un club regarde trois choses et te juge sur la plus faible. Pour qu'un grand"
				+ " club te recherche, tu dois être bon dans les trois.",
			"Fama": "Notoriété",
			"Que te conozcan: prensa y afición.": "Qu'on te connaisse : presse et supporters.",
			"Nivel": "Niveau",
			"Tus habilidades frente a la élite.": "Tes compétences face à l'élite.",
			"Forma": "Forme",
			"Tu media de la temporada: {0}.": "Ta note de la saison : {0}.",
			"Verano: fechas 1 a {0}. Invierno: {1} a {2}. Hoy es la {3}.":
				"L'été : journées 1 à {0}. L'hiver : {1} à {2}. On est à la {3}.",
			"TU CLUB TE VENDE": "TON CLUB TE VEND",
			"Dijiste que no renuevas: el club te ofrece para no perderte gratis. Mientras"
			+ " no salgas, juegas menos. Elige una salida:":
				"Tu as dit que tu ne renouvelles pas : le club te propose pour ne pas te perdre"
				+ " gratuitement. Tant que tu ne pars pas, tu joues moins. Choisis une sortie :",
			"ESTÁS EN VENTA": "TU ES SUR LE MARCHE",
			"Aceptaste salir: el club te ofrece a quien pregunte para hacer caja. Sigues"
			+ " jugando mientras llega tu destino.":
				"Tu as accepté de partir : le club te propose à qui demande pour renflouer les caisses. Tu continues à jouer en attendant ta destination.",
			"ULTIMO DIA · mañana se cierra": "DERNIER JOUR · ça ferme demain",
			"Cierra en {0} jornadas. Lo que hagas en el campo mueve las ofertas: hay clubes"
			+ " que entran y clubes que se van.":
				"Ça ferme dans {0} journées. Ce que tu fais sur le terrain fait bouger les"
				+ " offres : des clubs arrivent, d'autres repartent.",
			"Nadie ha preguntado por ti. Rinde y hazte ver.":
				"Personne ne s'est renseigné sur toi. Brille et fais-toi remarquer.",
			"FICHAJES": "TRANSFERTS",
			"RECIENTES": "RECENTS",
			"MAS CAROS": "LES PLUS CHERS",
			"MUNDO": "MONDE",
			"MI JUGADOR": "MON JOUEUR",
			"DIVISION": "DIVISION",
			"TU LIGA": "TON CHAMPIONNAT",
			"Ningún movimiento en tu liga todavía.": "Aucun mouvement dans ton championnat pour l'instant.",


			"Tu vestuario sigue igual: ni una alta ni una baja.":
				"Ton vestiaire n'a pas bougé : ni une arrivée ni un départ.",
			"Sin club: nadie entra ni sale de un vestuario que no tienes.":
				"Sans club : personne n'entre ni ne sort d'un vestiaire que tu n'as pas.",
			"El mercado todavía no se ha movido.": "Le mercato n'a pas encore bougé.",
			"EN TU VESTUARIO": "TON VESTIAIRE",
			"MANTÉN · TRASPASO": "MAINTIENS · TRANSFERT",
			"MANTÉN · CESIÓN": "MAINTIENS · PRET",
			"VENDIDO": "VENDU",
			"LLEGA": "ARRIVE",
			"SE VA": "PART",
			"DEJA EL CLUB": "QUITTE LE CLUB",


			"{0} ALTA": "{0} RECRUE",
			"{0} ALTAS": "{0} RECRUES",
			"{0} BAJA": "{0} SORTIE",
			"{0} BAJAS": "{0} SORTIES",
			"De {0} a {1}": "De {0} à {1}",
			"Cedido de {0} a {1}": "Prêté de {0} à {1}",
			"Deja {0}": "Quitte {0}",
			"LIBRE": "LIBRE",
			"ERES AGENTE LIBRE": "TU ES AGENT LIBRE",
			"Tu contrato terminó. Fichas SIN traspaso (Bosman): el club se ahorra el fee y"
			+ " una parte es tu PRIMA de fichaje. El rol que te espera se dice antes de firmar"
			+ " — elige con cabeza.":
				"Ton contrat est terminé. Tu signes SANS indemnité (Bosman) : le club économise"
				+ " le montant et une partie devient ta PRIME de signature. Le rôle qui t'attend"
				+ " est annoncé avant de signer — choisis avec ta tête.",
			"Tu valor: $ {0}": "Ta valeur : {0}$",
			"Ningún club por ahora. Vuelve a intentarlo más tarde.":
				"Aucun club pour l'instant. Réessaie plus tard.",
			"{0} OPCIONES A TU NIVEL": "{0} OPTIONS A TON NIVEAU",
			"TU CLUB QUIERE RETENERTE": "TON CLUB VEUT TE GARDER",
			"Te mejora el contrato para que te quedes:":
				"Il améliore ton contrat pour que tu restes :",
			"Sueldo: ${0} por partido (ahora ${1})": "Salaire : {0}$ par match (actuellement {1}$)",
			"Contrato: {0} temporadas": "Contrat : {0} saisons",
			"Eres un ídolo de la casa: {0} temporadas aquí.":
				"Tu es une idole de la maison : {0} saisons ici.",
			"RENOVAR Y QUEDARME": "RENOUVELER ET RESTER",
			"RENOVADO · TE QUEDAS": "RENOUVELE · TU RESTES",
			"EL CLUB NECESITA VENDERTE": "LE CLUB DOIT TE VENDRE",

			"RIESGO DE VENTA": "RISQUE DE VENTE",
			"VENTANA EN {0}J": "MERCATO J-{0}",
			"POR TU GRADA": "TES TRIBUNES",
			"AFICIÓN A {0}": "TRIBUNES A {0}",
			"Y ESTÁS A SALVO": "ET TU ES SAUVE",
			"SALVO ASCENSO": "SAUF MONTEE",
			"O EUROPA": "OU EUROPE",
			"En {0} no pueden pagarte: venderte les cuadra las cuentas. Negarte tiene precio en el vestuario:":
				"A {0} ils ne peuvent plus te payer : te vendre équilibre leurs comptes. Refuser a un prix dans le vestiaire :",
			"Negarte: técnico {0} · equipo {1} · afición {2}":
				"Refuser : entraîneur {0} · équipe {1} · supporters {2}",


			"El club te quiso vender y te plantaste. Después de este año, te lo"
				+ " reconocen: el vestuario te lo devuelve.":
				"Le club voulait te vendre et tu as tenu bon. Après cette saison,"
				+ " ils le reconnaissent : le vestiaire te le rend.",
			"TENÍAS RAZÓN": "TU AVAIS RAISON",
			"Te querían vender y dijiste que no. El año te dio la razón, y el"
				+ " club sale a decirlo delante de todos.":
				"Ils voulaient te vendre et tu as dit non. La saison t'a donné"
				+ " raison, et le club le dit devant tout le monde.",
			"HAY OTRA MANERA": "IL Y A UNE AUTRE VOIE",
			"ENTONCES, PON TÚ": "ALORS, TU PAIES",
			"El director deportivo te escucha y no dice que no. Pero el agujero"
				+ " de {0} sigue ahí, y si no sale de tu traspaso tiene que salir de tu"
				+ " contrato. Elige por dónde.":
				"Le directeur sportif t'écoute et ne dit pas non. Mais le trou de {0}"
				+ " est toujours là, et s'il ne sort pas de ton transfert, il doit"
				+ " sortir de ton contrat. Choisis par où.",
			"FICHA: {0}/sem": "SALAIRE : {0}/sem",
			"CLÁUSULA: {0}": "CLAUSE : {0}",
			"O te quedas pagándolo tú: el club retira la venta dos temporadas y"
				+ " refuerza en el próximo mercado de verano. Elige por dónde pagas.":
				"Ou tu restes en payant toi-même : le club retire la vente pendant"
				+ " deux saisons et recrute au prochain mercato d'été. Choisis comment"
				+ " tu paies.",
			"ME BAJO LA FICHA A {0}/sem": "JE BAISSE MON SALAIRE A {0}/sem",
			"¿TE BAJAS LA FICHA?": "BAISSER TON SALAIRE ?",
			"Cobras menos lo que reste de contrato, pero el club retira la venta"
				+ " y refuerza. Sigues libre de salir cuando quieras.":
				"Tu gagnes moins jusqu'à la fin de ton contrat, mais le club retire"
				+ " la vente et recrute. Tu restes libre de partir quand tu veux.",
			"ME SUBO LA CLÁUSULA A {0}": "JE MONTE MA CLAUSE A {0}",
			"¿TE SUBES LA CLÁUSULA?": "MONTER TA CLAUSE ?",
			"No cobras menos, pero te blindas: salir de aquí costará mucho más y"
				+ " firmas {0} temporada más.":
				"Tu ne gagnes pas moins, mais tu es verrouillé : partir coûtera bien"
				+ " plus cher et tu signes {0} saison de plus.",
			"ACEPTO SALIR": "J'ACCEPTE DE PARTIR",
			"¿ACEPTAS SALIR?": "TU ACCEPTES DE PARTIR ?",
			"El club te ofrecerá a quien pregunte y verás más ofertas. Sigues jugando"
			+ " mientras tanto.":
				"Le club te proposera à qui demande et tu verras plus d'offres. Tu continues"
				+ " à jouer en attendant.",
			"ACEPTO": "J'ACCEPTE",
			"ME NIEGO": "JE REFUSE",
			"¿TE NIEGAS A SALIR?": "TU REFUSES DE PARTIR ?",
			"Te quedas, pero el club contaba con ese traspaso: bajan técnico, equipo y"
			+ " afición.":
				"Tu restes, mais le club comptait sur ce transfert : entraîneur, équipe et"
				+ " supporters baissent.",
			"ME QUEDO": "JE RESTE",
			"EL CLUB TE BUSCA MINUTOS": "LE CLUB TE CHERCHE DU TEMPS DE JEU",
			"En {0} no cuentan contigo para jugar y no te lo ocultan: te ofrecen salir"
			+ " CEDIDO una temporada, a un club donde seas titular. Puedes negarte, pero te"
			+ " quedas justo donde no juegas.":
				"A {0} ils ne comptent pas sur toi et ne te le cachent pas : ils te proposent"
				+ " de partir en PRET une saison, dans un club où tu serais titulaire. Tu peux"
				+ " refuser, mais tu restes là où tu ne joues pas.",
			"Negarte: técnico {0} · equipo {1} · y esta temporada, ni la copa":
				"Refuser : entraîneur {0} · équipe {1} · et cette saison, même pas la coupe",
			"Destino: {0}": "Destination : {0}",
			"ME VOY CEDIDO": "JE PARS EN PRET",
			"¿SALIR CEDIDO?": "PARTIR EN PRET ?",
			"Una temporada jugando de titular en un club menor. Vuelves al terminar, y"
			+ " creces más rápido mientras estás fuera.":
				"Une saison comme titulaire dans un club plus modeste. Tu reviens à la fin, et"
				+ " tu progresses plus vite pendant que tu es parti.",
			"ME VOY": "JE PARS",
			"¿TE QUEDAS?": "TU RESTES ?",
			"Seguirás sin jugar y el técnico se lo tomará mal. Esta temporada perderás"
			+ " hasta los partidos de rotación.":
				"Tu continueras à ne pas jouer et l'entraîneur le prendra mal. Cette saison tu"
				+ " perdras même les matchs de rotation.",
			"TU CLUB NO TE VENDE": "TON CLUB NE TE VEND PAS",
			"Con contrato largo y rindiendo, tu club prefiere retenerte. Puedes forzar la"
			+ " salida, pero el técnico, el vestuario y la afición lo pagarán.":
				"Avec un contrat long et de bonnes performances, ton club préfère te garder."
				+ " Tu peux forcer ton départ, mais l'entraîneur, le vestiaire et les"
				+ " supporters le paieront.",
			"PEDIR EL TRASPASO": "DEMANDER LE TRANSFERT",
			"¿PEDIR EL TRASPASO?": "DEMANDER LE TRANSFERT ?",
			"Tu club dejará de retenerte, pero el vestuario se lo tomará como una traición:"
			+ " bajan técnico, equipo y afición.":
				"Ton club arrêtera de te retenir, mais le vestiaire le prendra comme une"
				+ " trahison : entraîneur, équipe et supporters baissent.",
			"LO PIDO": "JE LE DEMANDE",
			"Nadie suena por ti todavía. Rinde y hazte ver.":
				"Personne ne parle de toi pour l'instant. Performe et fais-toi remarquer.",
			"TE SIGUEN": "ILS TE SUIVENT",
			"Rumores de cara a la próxima ventana. Puedes darle pie a uno para que apriete"
			+ " —pero tu vestuario lo notará—.":
				"Des rumeurs pour le prochain mercato. Tu peux en encourager un pour qu'il"
				+ " pousse — mais ton vestiaire le remarquera.",
			"Te siguen de cerca": "Ils te suivent de près",
			"Interés serio": "Intérêt sérieux",
			"Suena flojo": "Rumeur faible",
			"Va {0} de {1} en su liga · {2}": "{0}e sur {1} de son championnat · {2}",
			"LE DISTE PIE": "FEU VERT DONNE",
			"LE DISTE PIE · APRETARÁ EN LA VENTANA":
				"TU L'AS ENCOURAGE · IL POUSSERA AU MERCATO",
			"MOSTRAR INTERÉS": "MONTRER DE L'INTERET",
			"¿MOSTRAR INTERÉS EN {0}?": "MONTRER DE L'INTERET POUR {0} ?",
			"Le das pie para que apriete en la próxima ventana. Tu vestuario lo nota: bajan"
			+ " un poco técnico, equipo y afición.":
				"Tu l'encourages à pousser au prochain mercato. Ton vestiaire le remarque :"
				+ " entraîneur, équipe et supporters baissent un peu.",
			"LE DOY PIE": "JE L'ENCOURAGE",
			"NO ME INTERESA":
				"PAS INTERESSE",
			"¿DESCARTAR A {0}?":
				"ECARTER {0} ?",
			"DESCARTAR":
				"ECARTER",
			"Dejas de verlo entre los que te siguen y su sitio lo ocupa otro club interesado. No cuesta nada: todavía no hay ninguna oferta que rechazar. Vuelven a sonar la próxima temporada.":
				"Il quitte la liste de ceux qui te suivent et un autre club intéressé prend sa place. Ça ne coûte rien : il n'y a encore aucune offre à refuser. Il peut revenir la saison prochaine.",
			"TU EX":
				"TON EX",
			"Volver a un club TUYO es mucho más fácil: allí ya saben quién eres y tu agente entra por la puerta grande.":
				"Revenir dans un de TES anciens clubs est bien plus facile : là-bas on sait déjà qui tu es et ton agent entre par la grande porte.",
			"Ya le diste pie a otro club.": "Tu as déjà encouragé un autre club.",
			"CEDIDO": "PRETE",
			"Perteneces a {0}: vuelves al cerrar la temporada.":
				"Tu appartiens à {0} : tu reviens à la fin de la saison.",
			"¿QUIERES MÁS MINUTOS?": "TU VEUX PLUS DE TEMPS DE JEU ?",
			"Puedes pedir salir CEDIDO a un club menor donde juegues de titular. De joven,"
			+ " además, crecerás más rápido jugando.":
				"Tu peux demander à partir en PRET dans un club plus modeste où tu serais"
				+ " titulaire. Jeune, en plus, tu progresseras plus vite en jouant.",
			"PEDIR SALIR CEDIDO": "DEMANDER UN PRET",
			"¿PEDIR SALIR CEDIDO?": "DEMANDER UN PRET ?",
			"Buscarás minutos en un club menor durante una temporada. El técnico lo nota un"
			+ " poco, pero entiende que quieras jugar.":
				"Tu chercheras du temps de jeu dans un club plus modeste pendant une saison."
				+ " L'entraîneur le remarque un peu, mais comprend que tu veuilles jouer.",
			"PEDISTE SALIR": "TU AS DEMANDE A PARTIR",
			"¿QUIERES SALIR?": "TU VEUX PARTIR ?",
			"PEDISTE SALIR CEDIDO": "TU AS DEMANDE UN PRET",
			"TE QUIEREN A PRÉSTAMO": "ILS TE VEULENT EN PRET",
			"Tu club no cuenta contigo. Cedido tendrías sitio en el once — y volverías con"
			+ " el crédito que te ganes.":
				"Ton club ne compte pas sur toi. En prêt tu aurais une place dans le onze — et"
				+ " tu reviendrais avec le crédit que tu auras gagné.",
			"Cesión una temporada · misma ficha · TITULAR probable":
				"Prêt d'une saison · même salaire · TITULAIRE probable",
			"IRTE CEDIDO": "PARTIR EN PRET",
			"MANTÉN PARA IRTE CEDIDO": "MAINTIENS POUR LE PRET",
			"¿IRTE CEDIDO A {0}?": "PARTIR EN PRET A {0} ?",
			"Una temporada fuera para jugar de verdad. Tu contrato sigue siendo del club"
			+ " dueño.":
				"Une saison ailleurs pour vraiment jouer. Ton contrat reste celui du club"
				+ " propriétaire.",
			"PREGUNTARON POR TI": "ILS ONT DEMANDE APRES TOI",
			"ES TU RIVAL · NO TE LO PERDONARÁN": "C'EST TON RIVAL · ILS NE TE PARDONNERONT PAS",
			"SE ACABÓ EL TIEMPO": "TEMPS ECOULE",
			"SE ENFRÍAN": "ILS SE REFROIDISSENT",
			"NUEVO": "NOUVEAU",
			"SUBEN EL SUELDO": "SALAIRE EN HAUSSE",
			"TE BAJARON EL SUELDO": "TON SALAIRE A BAISSE",
			"NEGOCIAR TU SUELDO": "NEGOCIER TON SALAIRE",
			"NEGOCIAR MI SUELDO": "NEGOCIER MON SALAIRE",
			"YA NEGOCIASTE ESTA TEMPORADA": "DEJA NEGOCIE CETTE SAISON",
			"Ya negociaste tu ficha esta temporada.":
				"Tu as déjà négocié ton salaire cette saison.",
			"YA NEGOCIASTE CON ELLOS": "TU AS DEJA NEGOCIE AVEC EUX",
			"YA PAGAN SU TOPE": "ILS PAIENT DEJA LEUR PLAFOND",
			"SIN OFERTA": "SANS OFFRE",
			"TE OFRECEN DE SUELDO POR PARTIDO": "SALAIRE PROPOSE PAR MATCH",
			"MANTÉN PARA ACEPTAR ${0}": "MAINTIENS POUR ACCEPTER {0}$",
			"MANTÉN PARA SALIR CON ${0}": "MAINTIENS POUR SORTIR AVEC {0}$",
			"MANTÉN PARA SALIR": "MAINTIENS POUR SORTIR",
			"MANTÉN PULSADO": "MAINTIENS APPUYE",
			"RETIRAN LA OFERTA · SE ACABÓ": "ILS RETIRENT L'OFFRE · FINI",
			"SE LEVANTAN DE LA MESA · SE ACABÓ": "ILS QUITTENT LA TABLE · FINI",
			"ESTÁ A PUNTO DE CORTAR · ROMPE EL HIELO O CIERRA":
				"SUR LE POINT DE PARTIR · BRISE LA GLACE OU CONCLUS",
			"Si pides más, pueden subirlo… o bajarlo": "Si tu demandes plus, ça peut monter… ou baisser",
			"Pediste {0} vez(ces) · llegaste con ${1}": "{0} relance(s) · tu es arrivé avec {1}$",
			"TU AGENTE TE MIRA: ES EL MOMENTO": "TON AGENT TE REGARDE : C'EST LE MOMENT",
			"Lo consultan…": "Ils en discutent…",
			"PODEMOS LLEGAR AHÍ  (+{0})": "ON PEUT Y ARRIVER  (+{0})",
			"ENTONCES REVISAMOS LA OFERTA  (−{0})":
				"ALORS ON REVOIT L'OFFRE  (−{0})",
			"MEJOR ROL": "MEILLEUR ROLE",
			"SE PLANTARON": "ILS CAMPENT SUR LEUR POSITION",
			"SE RETIRAN": "ILS SE RETIRENT",
			"LO RECHAZASTE": "TU AS DIT NON",
			"NADIE OCUPÓ EL HUECO": "PERSONNE N'A PRIS LA PLACE",
			"VUELVE DE CESIÓN": "RETOUR DE PRET",
			"SE QUEDAN AL CEDIDO": "PRET RENDU DEFINITIF",
			"SE FUERON": "ILS SONT PARTIS",
			"CIERRA": "FERME",
			"{0} J": "{0} J",
			"FAMA": "NOTORIETE",
			"CÓMO TE FICHAN": "COMMENT ON TE RECRUTE",
			"Un club mira cuatro cosas —fama, nivel, forma y PRESTIGIO— y te juzga"
			+ " por la MÁS FLOJA: para que te busque un grande tienes que ser bueno en las"
			+ " cuatro a la vez.\n\nEl PRESTIGIO es lo que hiciste el año pasado: dónde"
			+ " quedaste en el Balón de Oro, o lo más grande que levantaste. Los tres"
			+ " primeros dicen cómo juegas HOY; éste dice de quién se habló en junio, y es"
			+ " el que abre la puerta de los más grandes.\n\nDentro de la ventana, lo que"
			+ " hagas en el campo mueve las ofertas: hay clubes que entran y clubes que se"
			+ " van. Tu agente decide CUÁNTAS de las que existen llegan hasta ti.":
				"Un club regarde quatre choses — notoriété, niveau, forme et PRESTIGE — et te"
				+ " juge sur la PLUS FAIBLE : pour qu'un grand club te recherche, tu dois être"
				+ " bon dans les quatre à la fois.\n\nLe PRESTIGE, c'est ce que tu as fait l'an"
				+ " dernier : ta place au Joueur de l'Année, ou le plus grand trophée soulevé. Les"
				+ " trois premiers disent comment tu joues AUJOURD'HUI ; celui-ci dit de qui on"
				+ " a parlé en juin, et c'est celui qui ouvre la porte des plus grands.\n\nDans"
				+ " la fenêtre, ce que tu fais sur le terrain fait bouger les offres : des clubs"
				+ " arrivent, d'autres repartent. Ton agent décide COMBIEN de celles qui"
				+ " existent arrivent jusqu'à toi.",
			"PRESTIGIO": "PRESTIGE",
			"Te falta PRESTIGIO: acaba alto en la votación del Jugador del Año o levanta algo.":
				"Il te manque du PRESTIGE : termine haut au Joueur de l'Année ou soulève un trophée.",
			"Tu prestigio viene de haber sido {0}º del mundo.":
				"Ton prestige vient d'avoir terminé {0}e mondial.",
			"Tu prestigio lo sostiene lo que ganaste: {0}.":
				"Ton prestige repose sur ce que tu as gagné : {0}.",
			"Quedaste {0}º en el Jugador del Año: del {1}º en adelante el puesto ya no cuenta.":
				"Tu as terminé {0}e au Joueur de l'Année : à partir de la {1}e place le classement ne"
				+ " compte plus.",
			"No tienes prestigio: ni entraste en la gala ni levantaste nada.":
				"Tu n'as pas de prestige : ni invité au gala, ni le moindre trophée soulevé.",
			"TRASPASO SIN PACTAR": "TRANSFERT NON CONCLU",
			"Ofrecen {0} · tu club pide {1} · faltan {2}":
				"Ils offrent {0} · ton club demande {1} · il manque {2}",
			"PELEAN POR TI ({0} MÁS)": "ILS SE BATTENT POUR TOI ({0} DE PLUS)",
			"EJERCEN LA RECOMPRA": "OPTION DE RACHAT ACTIVEE",
			"LO QUE SE GUARDARON": "CE QU'ILS ONT GARDE",
			"{0} se lleva el {1}% de tu próximo traspaso (hoy serían {2}).":
				"{0} garde {1}% de ton prochain transfert (ce serait {2} aujourd'hui).",
			"{0} puede recomprarte por {1}{2}.": "{0} peut te racheter pour {1}{2}.",
			" (ya caducó)": " (expiré)",
			"AHÍ NO LLEGAS": "HORS DE TA PORTEE",
			"DÉJALO": "LAISSE TOMBER",
			"LLAMA IGUAL": "APPELLE QUAND MEME",
			"En NEGRITA los que hoy te ficharían si tu agente les entra. Los demás puedes"
			+ " pedirlos igual, pero te dirá que no.":
				"En GRAS, ceux qui te signeraient aujourd'hui si ton agent les approchait. Tu"
				+ " peux demander les autres quand même, mais il reviendra bredouille.",
			"ENTENDIDO": "COMPRIS",
			"SE VAN MAÑANA": "ILS PARTENT DEMAIN",
			"REBAJADO: FIN DE CONTRATO": "PRIX CASSE : FIN DE CONTRAT",
			"VINO A VERTE": "IL EST VENU TE VOIR",
			"TE SIGUE": "IL TE SUIT",
			"TE QUIERE": "IL TE VEUT",
			"VA EN SERIO": "C'EST SERIEUX",
			"Ya elegiste: tu junio tiene dueño. Ningún otro club puede moverte.": "Tu as déjà choisi : ton mois de juin est pris. Aucun autre club ne peut te faire bouger.",
			"SOLO LIGA Y COPA": "SEULEMENT LIGUE ET COUPE",
			"NEGOCIAR…": "NEGOCIER…",
			"PEDIR TRASPASO": "DEMANDER UN TRANSFERT",
			"PEDIR CESIÓN": "DEMANDER UN PRET",
			"Pedir el TRASPASO te pone en LISTA DE VENTA: tu club te ofrece a quien"
			+ " pregunte y llegan más ofertas — pero el vestuario lo paga y el técnico"
			+ " te da MENOS minutos mientras no salgas: ya dijiste que te vas.\n\nSi no"
			+ " eres titular, puedes pedir salir CEDIDO a un club menor donde juegues:"
			+ " de joven, además, creces más rápido jugando.":
				"Demander un TRANSFERT te met sur la LISTE DES TRANSFERTS : ton club te"
				+ " propose à qui demande et les offres arrivent — mais le vestiaire le paie et"
				+ " l'entraîneur te donne MOINS de temps de jeu tant que tu ne pars pas : tu as"
				+ " déjà dit que tu t'en vas.\n\nSi tu n'es pas titulaire, tu peux demander à"
				+ " partir en PRET dans un club plus modeste où tu joues : jeune, en plus, tu"
				+ " progresses plus vite en jouant.",
			"Estás EN LISTA DE VENTA: tu club ya no te retiene y te ofrece a quien"
			+ " pregunte. Cada ventana te trae más ofertas."
			+ " Mientras no salgas, el técnico te da menos minutos.":
				"Tu es SUR LA LISTE DES TRANSFERTS : ton club ne te retient plus et te propose"
				+ " à qui demande. Chaque mercato t'apporte plus d'offres. Tant que tu ne pars"
				+ " pas, l'entraîneur te donne moins de temps de jeu.",
			"Te pones EN LISTA DE VENTA: el club deja de retenerte y te ofrece a"
			+ " quien pregunte. El vestuario se lo toma a mal: bajan técnico, equipo y"
			+ " afición. Y mientras no salgas, el técnico te dará MENOS MINUTOS por"
			+ " bien que juegues: ya dijiste que te vas.":
				"Tu te mets SUR LA LISTE DES TRANSFERTS : le club arrête de te retenir et te"
				+ " propose à qui demande. Le vestiaire le prend mal : entraîneur, équipe et"
				+ " supporters baissent. Et tant que tu ne pars pas, l'entraîneur te donnera"
				+ " MOINS DE TEMPS DE JEU quelle que soit ta forme : tu as déjà dit que tu"
				+ " t'en vas.",
			"DESDE VERANO": "DES L'ETE",
			"BUSCAN DELANTERO": "CHERCHENT UN ATTAQUANT",
			"PRECIO DE ENERO": "PRIX DE JANVIER",

			"TRAYECTORIA +{0}%": "PARCOURS +{0}%",
			"TROTAMUNDOS −{0}%": "NOMADE −{0}%",

			"YA FICHARON DE TU CLUB ({0})": "DEJA RECRUTE CHEZ VOUS ({0})",
			"SUELEN FICHAR DE TU LIGA": "RECRUTENT DANS TA LIGUE",

			"VUELVES A CASA": "RETOUR AU CLUB",
			"TU EX CLUB": "EX-CLUB",

			"VUELVE CEDIDO A CASA": "PRETE A LA MAISON",
			"PAGAN LA CLÁUSULA": "CLAUSE PAYEE",
			"CLÁUSULA DE RESCISIÓN": "CLAUSE LIBERATOIRE",
			"TE PREGUNTAN POR EL RUMOR": "ON T'INTERROGE SUR LA RUMEUR",
			"Se sabe que {0} te sigue y la prensa te pone el micro delante. Lo que digas"
			+ " lo oyen todos: tu grada y su despacho.":
				"On sait que {0} te suit et la presse te tend le micro. Ce que tu dis, tout le"
				+ " monde l'entend : tes tribunes et leur direction.",
			"NO ME CIERRO A NADA": "JE N'EXCLUS RIEN",
			"ESTOY CENTRADO AQUÍ": "JE SUIS CONCENTRE ICI",
			"RETIRAR LA PETICIÓN": "RETIRER LA DEMANDE",
			"¿RETIRAR LA PETICIÓN?": "RETIRER TA DEMANDE ?",

			"CUMPLE LO DICHO": "TU TIENS PAROLE",
			"CONTRADICE LO DICHO": "TU TRAHIS TA PAROLE",
			"DIJISTE: {0}": "TU AS DIT : {0}",
			"TE COMPROMETE: {0}": "TU T'ENGAGES A : {0}",
			"IR DONDE JUEGUES MÁS": "ALLER OU TU JOUES PLUS",
			"IR A UN CLUB MAYOR": "ALLER DANS UN PLUS GRAND CLUB",
			"IRTE DE ESTE CLUB": "QUITTER CE CLUB",

			"PIDE SALIR": "VEUT PARTIR",
			"{0} pide salir cedido para jugar más": "{0} demande un prêt pour jouer plus",
			"{0} busca una cesión donde lo vean": "{0} cherche un prêt pour se faire voir",

			"NO RENUEVA": "NE PROLONGE PAS",
			"PRECONTRATO · {0}": "PRE-CONTRAT · {0}",
			"EN JUNIO": "EN JUIN",
			"RENUEVA": "PROLONGE",
			"SE VA LIBRE": "PART LIBRE",
			"PRECONTRATO": "PRE-CONTRAT",
			"{0} renueva con el {1} hasta {2}": "{0} prolonge avec le {1} jusqu'en {2}",
			"{0} no renovará con el {1}: se va libre en junio": "{0} ne prolongera pas avec le {1} : libre en juin",
			"{0} firma un precontrato con el {1}": "{0} signe un pré-contrat avec le {1}",
			"{0} pide una cesión: no ve futuro en el {1}":
				"{0} demande un prêt : aucun avenir au {1}",
			"{0} se ofrece para salir cedido": "{0} se propose pour un prêt",
			"{0} pide salir del {1}: quiere jugar más":
				"{0} demande à quitter le {1} : il veut jouer plus",
			"{0} pide salir del {1} y busca un club mayor":
				"{0} demande à quitter le {1} et vise plus haut",
			"{0} no cree en el proyecto del {1} y pide salir":
				"{0} ne croit pas au projet du {1} et veut partir",
			"{0} pide salir del {1}": "{0} demande à quitter le {1}",
			"Dijiste «{0}», y te vas a donde dijiste.":
				"Tu as dit « {0} », et tu vas là où tu as dit.",
			"Dijiste «{0}». Acabas firmando otra cosa.":
				"Tu as dit « {0} ». Tu signes finalement autre chose.",

			"¿POR QUÉ TE QUIERES IR?": "POURQUOI VEUX-TU PARTIR ?",
			"EL DIRECTOR DEPORTIVO": "LE DIRECTEUR SPORTIF",
			"BUSCO MÁS MINUTOS": "PLUS DE TEMPS DE JEU",
			"QUIERO UN CLUB MEJOR": "UN PLUS GRAND CLUB",
			"NO CREO EN EL PROYECTO": "JE NE CROIS PAS AU PROJET",
			"QUIERO JUGAR": "JE VEUX JOUER",
			"QUIERO QUE ME VEAN": "JE VEUX ETRE VU",
			"AQUÍ NO TENGO FUTURO": "PAS D'AVENIR ICI",
			"ME LO PIENSO": "JE VAIS Y REFLECHIR",
			"NADA, OLVÍDELO": "RIEN, OUBLIEZ",
			"YA LO JUEGAS TODO": "TU JOUES DEJA TOUT",
			"TE BUSCAMOS SITIO.": "ON TE TROUVE UNE PLACE.",
			"PUES QUE PAGUEN LO QUE VALES.": "QU'ILS PAIENT CE QUE TU VAUX.",
			"AQUÍ NO SE REGALA A NADIE.": "ICI, ON NE BRADE PERSONNE.",
			"EL PROYECTO SIGUE, CONTIGO O SIN TI.": "LE PROJET CONTINUE, AVEC OU SANS TOI.",
			"NO TE FALTA RAZÓN.": "TU N'AS PAS TORT.",
			"ME DUELE, PERO TE ENTIENDO. VUELVE MEJOR.": "ÇA ME FAIT MAL, MAIS JE COMPRENDS. REVIENS PLUS FORT.",
			"JUEGA FUERA Y A LA VUELTA HABLAMOS.": "VA JOUER, ON EN REPARLE A TON RETOUR.",
			"TE BUSCAMOS UN SITIO DONDE JUGAR.": "ON TE TROUVE UN ENDROIT OU JOUER.",
			"AQUÍ TAMBIÉN SE JUEGA SI TE LO GANAS.": "ICI AUSSI ON JOUE SI ON LE MERITE.",
			"HACES BIEN.": "TU FAIS BIEN.",
			"Antes de ponerte en la lista quiere oírlo de tu boca. Lo que le digas decide a quién llama y cuánto pide por ti.": "Avant de te mettre sur la liste, il veut l'entendre de ta bouche. Ce que tu lui dis décide qui il appelle et combien il demande pour toi.",
			"{0} te para en el pasillo, junto a la lista. Quiere saber por qué pides salir cedido.": "{0} t'arrête dans le couloir, près de la feuille de match. Il veut savoir pourquoi tu demandes un prêt.",
			"EL EQUIPO SE HUNDE": "L'EQUIPE COULE",
			"PELEÁIS ARRIBA": "VOUS JOUEZ LE HAUT",
			"ÍDOLO DE LA GRADA": "IDOLE DES TRIBUNES",
			"RECIÉN LLEGADO": "NOUVEAU VENU",
			"YA LO DIJISTE ANTES": "TU L'AS DEJA DIT",
			"HOY NADIE MÁS GRANDE": "PERSONNE DE PLUS GRAND",
			"HOY NO PREGUNTA NADIE": "PERSONNE NE DEMANDE",
			"SIN DESTINO HOY": "PAS DE DESTINATION",
			"PIDEN {0}": "ILS DEMANDENT {0}",

			"Tu mercado ya no abre esta temporada: podrás pedir salir cuando abra el"
			+ " de verano.":
				"Ton mercato ne rouvrira pas cette saison : tu pourras demander à partir à l'ouverture du mercato d'été.",
			"Disculpa pública: sales de la lista de venta. La afición se lo cobra, y el"
			+ " técnico tardará un par de partidos en volver a contar contigo — dijiste"
			+ " que te ibas.":
				"Excuses publiques : tu sors de la liste des transferts. Les supporters te le"
				+ " font payer, et l'entraîneur mettra quelques matchs avant de recompter sur"
				+ " toi — tu avais dit que tu partais.",
			"RETIRASTE LA PETICIÓN": "DEMANDE RETIREE",
			"Sube de la cantera de {0}": "Monté du centre de formation de {0}",
			"CANTERA": "CENTRE DE FORMATION",
			"LA BOMBA DEL CIERRE": "LA BOMBE DE LA CLOTURE",
			"Opción de compra pactada: $ {0}": "Option d'achat convenue : {0}$",
			"EJECUTAN LA OPCIÓN": "OPTION D'ACHAT ACTIVEE",
			"{0} quiere que vuelvas: pide repetir la cesión y puja por ti": "{0} veut ton retour : il demande un nouveau prêt et fait une offre pour toi",
			"{0} quiere que vuelvas: pide repetir la cesión": "{0} veut ton retour : il demande un nouveau prêt",
			"{0} quiere que vuelvas: intentará comprarte": "{0} veut ton retour : il va tenter de t'acheter",
			"{0} quería que volvieras, pero tu club cuenta contigo": "{0} voulait ton retour, mais ton club compte sur toi",
			"{0} ejecuta la opción de compra pactada":
				"{0} active l'option d'achat convenue",
			"ENCARGO AL AGENTE…": "MISSION POUR TON AGENT…",
			"{0} LIBRES": "{0} RESTANTES",
			"ENCARGOS": "MISSIONS",
			"CONFIANZA": "CONFIANCE",
			"TU DINERO": "TON ARGENT",
			"CUESTA VESTUARIO": "COUTE DU VESTIAIRE",
			"La cifra de cada botón es LO QUE TE COBRA por ese encargo, y sale de tu bolsillo al momento. Tienes ${0}.":
				"Le chiffre sur chaque bouton, c'EST CE QU'IL TE FACTURE pour cette mission, et"
				+ " ça sort de ta poche tout de suite. Tu as {0}$.",
			"TU AGENTE": "TON AGENT",
			"MUÉVEME POR EL MERCADO": "FAIS-MOI CIRCULER SUR LE MARCHE",
			"BUSCA EN UNA LIGA…": "CHERCHE DANS UN CHAMPIONNAT…",
			"TOCA LA PUERTA DE UN CLUB…": "FRAPPE A LA PORTE D'UN CLUB…",
			"¿QUÉ LIGA?": "QUEL CHAMPIONNAT ?",
			"¿QUÉ CLUB?": "QUEL CLUB ?",
			"TU AGENTE SE MUEVE": "TON AGENT S'ACTIVE",
			"LO TRAJO TU AGENTE": "TON AGENT L'A TROUVE",
			"TU AGENTE NO PUDO": "TON AGENT N'A RIEN TROUVE",
			"TU MESA ESTÁ LLENA": "TA TABLE EST PLEINE",
			"NO TRAS TU RECHAZO": "PAS APRES TON REFUS",
			"FUERA DE TU ALCANCE": "HORS DE TA PORTEE",
			"YA ESTABA EN TU MESA": "DEJA A TA TABLE",
			"TRAJO A {0}": "A RAMENE {0}",
			"El mercado cierra hoy: ya no hay tiempo para encargos.":
				"Le marché ferme aujourd'hui : plus de temps pour les missions.",
			"Tu agente trabaja la liga de {0}: sus clubes entran primero.":
				"Ton agent travaille le championnat de {0} : ses clubs arrivent en premier.",
			"Tu agente está tocando esa puerta: se sabe en la próxima jornada.":
				"Ton agent frappe à cette porte : réponse la prochaine journée.",
			"Tu agente te está moviendo: esta ventana entran más clubes.":
				"Ton agent te fait circuler : plus de clubs arrivent ce mercato.",
			"FIRMAR PRECONTRATO": "SIGNER LE PRECONTRAT",
			"¿FIRMAR PRECONTRATO CON {0}?": "SIGNER UN PRECONTRAT AVEC {0} ?",
			"Firmas para el VERANO: terminas la temporada aquí y al cierre te vas"
			+ " GRATIS, con tu prima. Tu mercado se cierra este año, no podrás renovar, y"
			+ " el técnico te dará menos minutos: ya sabe que te vas.":
				"Tu signes pour l'ETE : tu finis la saison ici et tu pars LIBRE à la fin, avec"
				+ " ta prime. Ton marché se ferme cette année, tu ne pourras pas renouveler, et"
				+ " l'entraîneur te donnera moins de temps de jeu : il sait que tu pars.",

			"Te vas a tu RIVAL: la grada no te lo perdona. Técnico −{0}, afición −{1}; cuanto más te quieren, más duele.": "Tu pars chez ton RIVAL : la tribune ne te le pardonnera pas. Entraîneur −{0}, supporters −{1} ; plus ils t'aiment, plus ça fait mal.",
			"Te vas a un club de tu LIGA: los tendrás enfrente. Técnico −{0}, afición −{1}.": "Tu pars dans un club de ton CHAMPIONNAT : tu les affronteras. Entraîneur −{0}, supporters −{1}.",
			"Te vas a otra liga de tu PAÍS. Técnico −{0}, afición −{1}.": "Tu pars dans un autre championnat de ton PAYS. Entraîneur −{0}, supporters −{1}.",
			"Te vas al EXTRANJERO: se entiende más. Técnico −{0}, afición −{1}.": "Tu pars à l'ETRANGER : ça passe mieux. Entraîneur −{0}, supporters −{1}.",
			"PRECONTRATO FIRMADO": "PRECONTRAT SIGNE",
			"PRECONTRATO FIRMADO · TE VAS EN VERANO": "PRECONTRAT SIGNE · DEPART EN ETE",
			"Al cerrar la temporada te vas GRATIS a {0}."
			+ " Ya elegiste destino: tu mercado está resuelto y juegas menos"
			+ " mientras tanto.":
				"A la fin de la saison tu pars LIBRE à {0}. Tu as déjà choisi ta"
				+ " destination : ton marché est réglé et tu joues moins en attendant.",
			"Se cumple tu precontrato: llegas GRATIS a {0}":
				"Ton précontrat se réalise : tu arrives LIBRE à {0}",

			"FIRMADO: {0}": "SIGNE : {0}",
			"YA FIRMASTE CON {0}": "DEJA SIGNE AVEC {0}",

			"TE CONSIGUE EL PRECONTRATO": "PRECONTRAT DECROCHE",
			"TE GUARDAN EL {0}": "ON TE GARDE LE {0}",
			"Ya firmaste con {0}: el técnico cuenta menos contigo.": "Tu as déjà signé avec {0} : l'entraîneur compte moins sur toi.",
			"HITO": "TROPHEE",
			"SIN HITO": "SANS TROPHEE",
			"Tienes nivel de grande: te falta GANAR algo.":
				"Tu as le niveau des grands : il te reste à GAGNER quelque chose.",
			"ABRE": "OUVRE",
			"EL AÑO QUE VIENE": "L'ANNEE PROCHAINE",
			"LOS QUE TE SIGUEN": "CEUX QUI TE SUIVENT",
			"Clubes que preguntan por ti de cara a la próxima ventana. Puedes darle pie a UNO"
			+ " para que apriete cuando abra: llegará con oferta y su distintivo.\n\nNo sale"
			+ " gratis —el vestuario se entera de que miras fuera— y sólo se puede con un club"
			+ " por ventana.":
				"Des clubs qui demandent après toi pour le prochain mercato. Tu peux en"
				+ " encourager UN à pousser à l'ouverture : il arrivera avec une offre et son"
				+ " écusson.\n\nÇa ne sort pas gratuit — le vestiaire apprend que tu regardes"
				+ " ailleurs — et c'est un seul club par mercato.",
			"DE CERCA": "DE PRES",
			"SERIO": "SERIEUX",
			"FLOJO": "TIEDE",
			"FUERA DE COPA": "ELIMINE DE LA COUPE",
			"OCTAVOS": "8es DE FINALE",
			"CUARTOS": "QUARTS",
			"SEMIS": "DEMIES",
			"FINAL": "FINALE",
			"Sin traspaso (agente libre) · prima de fichaje: ${0}":
				"Sans indemnité (agent libre) · prime de signature : {0}$",
			"Traspaso: ${0} · tu prima: ${1}": "Transfert : {0}$ · ta prime : {1}$",
			"Te esperan como: {0}": "Ils t'attendent comme : {0}",
			"Se retiran mañana": "Ils se retirent demain",
			"Aguantan {0} jornadas más": "Ils tiennent {0} journées de plus",
			"ULTIMATUM: hoy o nunca": "ULTIMATUM : aujourd'hui ou jamais",
			"Ahora cobras ${0}/partido · esta oferta {1}%":
				"Tu touches {0}$/match actuellement · cette offre {1}%",
			"Un club por encima del tuyo": "Un club au-dessus du tien",
			"Un club por debajo del tuyo": "Un club en dessous du tien",
			"Un club a tu nivel": "Un club à ton niveau",
			"FICHAR (LIBRE)": "SIGNER (LIBRE)",
			"Esperas respuesta a tu {0} (próxima jornada)":
				"Tu attends une réponse à ta {0} (prochaine journée)",
			"petición de sueldo": "demande de salaire",
			"petición de titular": "demande de titularisation",
			"Ya negociaste esta oferta: sin más margen.":
				"Tu as déjà négocié cette offre : plus de marge.",
			"PEDIR SER TITULAR": "DEMANDER A ETRE TITULAIRE",
			"PEDIR MÁS SUELDO": "DEMANDER PLUS",
			"TU CLUB NO TE DEJA SALIR": "TON CLUB NE TE LAISSE PAS PARTIR",
			"FICHAR": "SIGNER",
			"que suban el sueldo": "un meilleur salaire",
			"que te fichen de titular": "être signé comme titulaire",
			"¿NEGOCIAR CON {0}?": "NEGOCIER AVEC {0} ?",
			"Pides {0}. Responden la próxima jornada: pueden ceder, plantarse o RETIRAR la"
			+ " oferta.":
				"Tu demandes {0}. Ils répondent la prochaine journée : ils peuvent céder,"
				+ " camper sur leur position ou RETIRER l'offre.",
			"NEGOCIAR": "NEGOCIER",
			"NEGOCIACIÓN ABIERTA · RESPONDEN LA PRÓXIMA JORNADA":
				"NEGOCIATION OUVERTE · REPONSE LA PROCHAINE JOURNEE",
			"RECHAZAR": "REFUSER",
			"¿RECHAZAR A {0}?": "REFUSER {0} ?",
			"Se retiran de la puja para siempre en este mercado. Otros clubes pueden ocupar"
			+ " su hueco, pero no hoy: se sabe en la próxima jornada.":
				"Ils se retirent définitivement des enchères ce mercato. D'autres clubs"
				+ " peuvent prendre leur place, mais pas aujourd'hui : réponse la prochaine"
				+ " journée.",
			"RECHAZO": "JE REFUSE",
			"OFERTA RECHAZADA · SE BUSCA OTRO DESTINO":
				"OFFRE REFUSEE · RECHERCHE D'UNE AUTRE DESTINATION",
			"¿FICHAR POR {0}?": "SIGNER A {0} ?",
			"Te esperan como {0}. Llegas al vestuario desde abajo: el puesto se gana.":
				"Ils t'attendent comme {0}. Tu pars du bas de la hiérarchie : la place se gagne.",
			"FIRMO": "JE SIGNE",
			"Fichaje libre: sin traspaso, con prima de ${0}. Te esperan como {1}; el puesto"
			+ " se gana.":
				"Transfert libre : sans indemnité, avec une prime de {0}$. Ils t'attendent"
				+ " comme {1} ; la place se gagne.",
			"ELIGE TU DORSAL": "CHOISIS TON NUMERO",
			"HAY DORSAL LIBRE": "UN NUMERO EST LIBRE",
			"Te fichan como un acontecimiento y el club te deja elegir. Llevas el {0}, pero"
			+ " la camiseta que quieras es tuya.":
				"Ils te signent comme un grand événement et le club te laisse choisir. Tu"
				+ " portes le {0}, mais le maillot que tu veux est à toi.",
			"Se cerró el mercado y el club repasa los números. Llevas el {0}, y este año hay"
			+ " camiseta libre si la quieres.":
				"Le marché est fermé et le club revoit les numéros. Tu portes le {0}, et cette"
				+ " année il y a un maillot libre si tu le veux.",
			"PONERME EL {0}": "PRENDRE LE {0}",
			"SEGUIR CON EL {0}": "GARDER LE {0}",
			"ELIGE OTRO": "CHOISIS-EN UN AUTRE",
			"TU DORSAL EN EL CLUB": "TON NUMERO AU CLUB",
			"RENUEVAS: TU DORSAL": "TU PROLONGES : TON NUMERO",
			"Llegas nuevo y el club te deja escoger número. Llevas el {0}; si prefieres otro de los que están libres, es tuyo.": "Tu viens d'arriver et le club te laisse choisir un numéro. Tu portes le {0} ; si tu préfères un autre parmi les libres, il est à toi.",
			"Firmas con el club y aprovechas para repasar tu número. Llevas el {0}; si quieres otro de los que están libres, cámbialo.": "Tu signes avec le club et en profites pour revoir ton numéro. Tu portes le {0} ; si tu en veux un autre parmi les libres, change-le.",
			"ELIGE TU NÚMERO": "CHOISIS TON NUMERO",
			"Te pones el {0}.": "Tu prends le {0}.",
			"Sigues con el {0}.": "Tu gardes le {0}.",
			"BOTAS": "CRAMPONS",
			"OFERTA DE LA JORNADA": "OFFRE DE LA JOURNEE",
			"OFERTA": "PROMO",
			"ANTES ${0}": "AVANT {0}$",
			"Sólo estética: pintan tus botas en el partido y en las escenas, y no cambian sus bonos. Se ponen en TIENDA, en BOTAS.": "Purement esthétique : elles colorent tes crampons en match et dans les scènes, sans changer leurs bonus. À équiper dans BOUTIQUE, CRAMPONS.",
			"+ {0} PUNTOS": "+ {0} POINTS",
			"Sólo color, no da bonos. Es tuya hasta que empieces otra carrera.": "Juste la couleur, aucun bonus. À toi jusqu'à ta prochaine carrière.",
			"PINTA TUS BOTAS": "COLORE TES CRAMPONS",
			"YA LA TIENES: SE PONE EN TIENDA, EN BOTAS": "TU L'AS DEJA : A EQUIPER DANS BOUTIQUE",
			"SE PONE EN TIENDA, EN BOTAS": "A EQUIPER DANS BOUTIQUE, CHAUSSURES",
			"Tus botas estrenan la {0}.": "Tes chaussures portent désormais l'{0}.",
			"TUS EDICIONES": "TES EDITIONS",
			"SIN EDICIÓN": "SANS EDITION",
			"EDICIÓN DEBUT": "EDITION DEBUTS",
			"EDICIÓN ASCENSO": "EDITION MONTEE",
			"EDICIÓN ORO": "EDITION OR",
			"EDICIÓN NOCHE": "EDITION NUIT",
			"EDICIÓN FUEGO": "EDITION FEU",
			"EDICIÓN HIELO": "EDITION GLACE",
			"EDICIÓN NEÓN": "EDITION NEON",
			"PACK DEBUT": "PACK DEBUTS",
			"PACK ASCENSO": "PACK MONTEE",
			"PACK JUGADOR DEL AÑO": "PACK JOUEUR ANNEE",
			"EL QUE MÁS RINDE": "LE PLUS RENTABLE",
			"ALCANZA": "SUFFIT",
			"ALCANZA PARA {0}": "SUFFIT POUR {0}",
			"TE ALCANZARÍA PARA: {0}": "DE QUOI T'OFFRIR : {0}",
			"QUEDARÍAS CON ${0}": "IL TE RESTERAIT {0}$",
			"QUEDARÍAS CON {0} PUNTOS": "IL TE RESTERAIT {0} POINTS",
			"QUEDARÍAS CON ${0} Y {1} PUNTOS": "IL TE RESTERAIT {0}$ ET {1} POINTS",
			"TUS HABILIDADES ESTÁN AL MÁXIMO: ENTRARÍAN COMO ≈{0} XP": "TES COMPETENCES SONT AU MAX : ELLES DEVIENDRAIENT ≈{0} XP",
			"TE FALTAN ${0} PARA {1}": "IL TE MANQUE {0}$ POUR {1}",
			"YA TE ALCANZA PARA {0}": "TU PEUX DEJA T'OFFRIR {0}",
			"VOLVER A {0}": "RETOUR A {0}",
			"REPARTIR PUNTOS": "REPARTIR LES POINTS",
			"PERSONAL": "PERSONNEL",
			"PARA EL CUERPO": "POUR LE CORPS",
			"PARA EL VESTUARIO": "POUR LE VESTIAIRE",
			"TU CUERPO TÉCNICO": "TON STAFF TECHNIQUE",
			"ROPA": "VETEMENTS",
			"LUJOS": "LUXE",
			"PELUQUERÍA": "COIFFEUR",
			"Cortes y barbas de autor. Los de siempre siguen gratis en ASPECTO.": "Coupes et barbes signature. Les classiques restent gratuites dans APPARENCE.",
			"VER MARCAS": "VOIR LES MARQUES",
			"PONÉRTELO": "LE PORTER",
			"TU PUESTO: {0}º · {1} · {2}%": "TA PLACE : {0}e · {1} · {2}%",
			"{0} % POR TU GRADA": "{0} % DU PUBLIC",
			"TE LLEVA: {0}": "TON AGENT : {0}",
			"LLEVAS PUESTAS": "AUX PIEDS",
			"VS LAS TUYAS": "VS LES TIENNES",
			"LO MISMO": "PAREIL",
			"DURA {0} MÁS": "DURE {0} DE PLUS",
			"DURA {0} MENOS": "DURE {0} DE MOINS",
			"USA LO QUE TIENES": "UTILISE CE QUE TU AS",

			"POTENCIA": "PUISSANCE",
			"EFECTO": "EFFET",
			"${1} POR PARTIDO · DURA {0}": "{1}$ PAR MATCH · DURE {0}",
			"CON TU NETO DE HOY NO LLEGAS": "TON NET ACTUEL NE SUFFIT PAS",
			"TE FALTAN {0} · {1}": "IL TE MANQUE {0} · {1}",
			"EL MÁS CERCA": "LE PLUS PROCHE",
			"SIN MANTENIMIENTO": "SANS ENTRETIEN",
			"SE ESTRENA AL COMPRAR · ROTA, VUELVE EN {0}": "PORTEE TOUT DE SUITE · CASSEE, RETOUR DANS {0}",
			"COMISIÓN {0}% · HOY {1}%": "COMMISSION {0}% · AUJ. {1}%",
			"SOBRE TU SUELDO: {0} / PARTIDO": "SUR TON SALAIRE : {0} / MATCH",
			"PARA SIEMPRE · SIN MANTENIMIENTO": "POUR TOUJOURS · SANS ENTRETIEN",
			"VER EN CASA": "VOIR A LA MAISON",
			"MIENTRAS SIGAS AQUÍ · TE QUEDAN {0} {1}": "TANT QUE TU RESTES · ENCORE {0} {1}",
			"TU CARTERA": "TON PORTEFEUILLE",
			"{0} PUNTOS LIBRES": "{0} POINTS LIBRES",
			"TOCA UNA BOTA PARA PROBÁRTELA": "TOUCHE UNE CHAUSSURE POUR L'ESSAYER",
			"TU TREN DE VIDA": "TON TRAIN DE VIE",
			"TOCA UNA FICHA PARA ELEGIRLA": "TOUCHE UNE FICHE POUR LA CHOISIR",
			"TU PERSONAL": "TON PERSONNEL",
			"TIENES {0} DE {1}": "TU EN AS {0} SUR {1}",
			"TU MERCH": "TON MERCH",
			"NO TIENES NADA GUARDADO": "RIEN EN RESERVE",
			"LO QUE CAMBIA": "CE QUI CHANGE",
			"PAGAS ${0} · TE QUEDAN ${1}": "TU PAIES {0}$ · IL RESTE {1}$",
			"HOY NO SIRVE: {0}": "INUTILE AUJOURD'HUI : {0}",
			"-{0}% HOY": "-{0}% AUJ.",
			"ABRIENDO": "OUVERTURE",
			"APP STORE": "APP STORE",
			"CONSUMO": "CONSOMMABLES",
			"Lo que compras aquí te mejora MIENTRAS SIGAS EN ESTE CLUB. Si fichas por otro, se queda con este escudo.": "Ce que tu achètes ici t'améliore TANT QUE TU RESTES DANS CE CLUB. Si tu signes ailleurs, ça reste avec ce blason.",
			"El escudo en la cabeza, todos los días. Lo más barato que dice de qué eres.": "Le blason sur la tête, tous les jours. Le moins cher pour dire ce que tu es.",
			"La que se levanta en el himno. Mientras juegues aquí, la grada te la reconoce.": "Celle qu'on lève pendant l'hymne. Tant que tu joues ici, le public la reconnaît.",
			"El del año, con el sello del club. Lo usas a diario y llegas algo más entero.": "Celui de l'année, marqué du club. Tu t'en sers tous les jours et tu arrives plus frais.",
			"La de este año, con tu dorsal. Sales con ella y la prensa lo nota.": "Celui de l'année, avec ton numéro. Tu le portes et la presse le remarque.",
			"TIENDA DEL CLUB": "BOUTIQUE DU CLUB",
			"En primera, la tienda saca además la playera firmada de la vitrina.": "En première division, la boutique sort aussi le maillot dédicacé de la vitrine.",
			"GORRA DEL CLUB": "CASQUETTE DU CLUB",
			"BUFANDA DEL CLUB": "ECHARPE DU CLUB",
			"BALÓN OFICIAL": "BALLON OFFICIEL",
			"PLAYERA DE LA TEMPORADA": "MAILLOT DE LA SAISON",
			"PLAYERA FIRMADA": "MAILLOT DEDICACE",
			"La de la vitrina, firmada por la plantilla. Sólo en primera.": "Celui de la vitrine, signé par l'effectif. Première division seulement.",
			"ESTILO": "STYLE",
			"INVERSION": "INVESTIR",
			"Toca una bota para probártela en el espejo.":
				"Touche une paire pour l'essayer devant le miroir.",
			"Llevas ahorrado el {0}%.": "Tu as économisé {0}%.",
			"EN USO": "EN USAGE",
			"EQUIPAR": "EQUIPER",
			"CON TUS BOTAS": "AVEC TES CRAMPONS",
			"VIDA {0}%  ·  se gastan al jugar": "VIE {0}%  ·  s'usent en jouant",
			"SIN DESGASTE  ·  las de pago dan más": "SANS USURE  ·  les payantes donnent plus",
			"EN USO · {0}%": "EN USAGE · {0}%",
			"Se te acabaron tus {0}. Toca otras para reponerlas.":
				"Tes {0} sont hors d'usage. Touche-en d'autres pour les remplacer.",
			"Tu fama interesó a {0}. Míralo en PATROCINIOS.":
				"Ta notoriété a intéressé {0}. Regarde dans SPONSORS.",
			"CONSUMIBLES": "CONSOMMABLES",
			"ESTILO DE VIDA": "TRAIN DE VIE",
			"DINERO PARADO": "ARGENT DORMANT",
			"NÓMINA": "SALAIRE",
			"INGRESOS": "REVENUS",
			"DESCUENTOS": "RETENUES",
			"VER DESGLOSE": "VOIR LE DETAIL",
			"OCULTAR DESGLOSE": "MASQUER LE DETAIL",
			"PRIMA DE RESULTADO": "PRIME DE RESULTAT",
			"PRIMA POR GOL": "PRIME PAR BUT",
			"PRIMA POR ASISTENCIA": "PRIME PAR PASSE DECISIVE",
			"PATROCINIO": "SPONSOR",
			"COMISIÓN DEL AGENTE": "COMMISSION DE L'AGENT",
			"CÁMARA ROTA": "CAMERA CASSEE",
			"BALÓN A LA GRADA": "BALLON DANS LES TRIBUNES",



			"BALÓN A LA CALLE": "BALLON DANS LA RUE",
			"RECOGEPELOTAS DERRIBADO": "RAMASSEUR DE BALLES RENVERSE",
			"CRISTAL DEL PALCO": "VITRE DE LA LOGE",
			"EN NÚMEROS ROJOS": "DANS LE ROUGE",
			"ficha $ {0} / partido": "salaire {0}$ / match",
			"ficha $ {0} − gastos $ {1}": "salaire {0}$ − dépenses {1}$",
			"Te miden como {0}": "Tu es jugé comme {0}",
			"Juega {0} partidos  (llevas {1})": "Joue {0} matchs  (tu en as {1})",
			"Promedia {0} de nota  (llevas {1})": "Fais une moyenne de {0}  (tu en as {1})",
			"Te hacen famoso, pero casi todo le sienta mal al técnico o al vestuario.":
				"Ça te rend célèbre, mais presque tout ça passe mal auprès de l'entraîneur"
				+ " ou du vestiaire.",
			"TUYO": "A TOI",
			"ESTÉTICA": "ESTHETIQUE",
			"Lo único que se compra y SE VE: te cambia de verdad en el hub, en la previa y"
			+ " en la cancha. No da ventaja ninguna, y por eso mismo es tuyo elegirlo. Los"
			+ " cortes y barbas de siempre siguen siendo gratis en PERSONALIZAR.":
				"La seule chose que tu achètes et qui SE VOIT : elle te change vraiment dans"
				+ " le hub, l'avant-match et sur le terrain. Ça ne donne aucun avantage, et"
				+ " c'est justement pour ça que le choix t'appartient. Les coupes et barbes"
				+ " classiques restent gratuites dans PERSONNALISER.",
			"INVERSIONES": "INVESTISSEMENTS",
			"Para cuando el dinero sobra: mejoran tu cuerpo o tu bolsillo, para siempre y sin mantenimiento.":
				"Pour quand l'argent ne manque plus : ça améliore ton corps ou ton portefeuille,"
				+ " pour toujours et sans entretien.",
			"PONER": "PORTER",
			"TE QUEDA BIEN": "ÇA TE VA BIEN",
			"LOGRO: {0}": "SUCCES : {0}",
			"MANTENIMIENTO  -${0} / PARTIDO": "ENTRETIEN  -{0}$ / MATCH",
			"USAR": "UTILISER",
			"Tu míster. Convéncelo en la cancha.": "Ton entraîneur. Convaincs-le sur le terrain.",
			"Decide si juegas y cuántos minutos.":
				"Il décide si tu joues, et combien de minutes.",
			"Decide si el balón te llega.": "Il décide si le ballon t'arrive.",
			"Sube tu valor y abre las puertas de las marcas.":
				"Fait monter ta valeur et ouvre la porte des marques.",
			"Tu fama: qué marcas te buscan y qué clubes se fijan en ti.":
				"Ta notoriété : quelles marques te recherchent et quels clubs te remarquent.",
			"Cuántas ofertas ves, la ficha que te sacan (hasta +15%) y qué tan bien regateas.":
				"Combien d'offres tu vois, le salaire qu'ils t'accordent (jusqu'à +15%) et à"
				+ " quel point tu négocies bien.",
			"Patrocinadores": "Sponsors",
			"Cómo vas con los objetivos de tus marcas.":
				"Où tu en es avec les objectifs de tes marques.",
			"TUS MARCAS · {0} DE {1}": "TES MARQUES · {0} SUR {1}",
			"Ninguna todavía. Sal en la prensa y vendrán solas.":
				"Aucune pour l'instant. Fais parler de toi dans la presse et elles viendront.",
			"TE BUSCAN": "ON TE RECHERCHE",
			"La temporada ya está en marcha: las marcas cerraron sus contratos en"
			+ " pretemporada. Vuelven a buscarte cuando empiece la siguiente.":
				"La saison a déjà commencé : les marques ont signé leurs contrats en"
				+ " présaison. Elles reviendront te chercher à la prochaine.",
			"Nadie por ahora. La prensa manda aquí.": "Personne pour l'instant. C'est la presse qui décide ici.",
			"PRETEMPORADA: es ahora o el año que viene. En cuanto juegues la primera"
			+ " jornada se cierra, y lo que no firmes ya no vuelve esta temporada.":
				"PRESAISON : c'est maintenant ou l'an prochain. Dès que tu joues la première"
				+ " journée ça se ferme, et ce que tu ne signes pas ne revient plus cette"
				+ " saison.",
			"OBJETIVO: {0}": "OBJECTIF : {0}",
			"SIN HUECO": "PAS DE PLACE",
			"FIRMAR": "SIGNER",
			"{0}  ({1}/{2})  ·  premio ${3}": "{0}  ({1}/{2})  ·  prime {3}$",
			"{0}  ({1})  ·  premio ${2}": "{0}  ({1})  ·  prime {2}$",
			"Se cobra al final de la temporada.": "Payée en fin de saison.",
			"ROMPER": "RESILIER",
			"¿ROMPER CON {0}?": "RESILIER AVEC {0} ?",
			"Pierdes el contrato, su pago por partido y el premio del objetivo. No vuelve.":
				"Tu perds le contrat, sa paie par match et la prime d'objectif. Ça ne revient"
				+ " pas.",
			"TUS PATROCINADORES": "TES SPONSORS",
			"SIN MARCAS": "SANS MARQUES",
			"{0}/{1} OBJETIVOS": "{0}/{1} OBJECTIFS",
			"Desde el banquillo no cobras: sólo cuentan (y se pagan) las jornadas de {0}' o más.":
				"Depuis le banc tu ne touches rien : seules comptent (et sont payées) les"
				+ " journées de {0}' ou plus.",
			"Te perdonan parte del objetivo por las {0} jornadas que te perdiste lesionado (firmaste {1}).":
				"Ils te pardonnent une partie de l'objectif pour les {0} journées manquées sur"
				+ " blessure (tu as signé pour {1}).",
			"Te piden menos jornadas por las {0} que te perdiste lesionado. La media no baja.":
				"Ils te demandent moins de journées pour les {0} manquées sur blessure. La"
				+ " moyenne ne baisse pas.",
			"{0} no te llama: le fallaste. Le quedan {1} temporada(s) de enfado.":
				"{0} ne t'appelle pas : tu l'as déçu. Il lui reste {1} saison(s) de rancune.",
			"INDEMNIZACIÓN: ${0} de lo que ya te pagaron.":
				"INDEMNITE : {0}$ de ce qu'ils t'ont déjà payé.",
			"ROMPO EL CONTRATO": "JE RESILIE LE CONTRAT",
			"CLASIFICACIÓN · {0}": "CLASSEMENT · {0}",
			"{0} (TÚ)": "{0} (TOI)",
			"{0} PTS ({1} PJ)": "{0} PTS ({1} MJ)",
			"— objetivo del club: {0} —": "— objectif du club : {0} —",
			"TU GRUPO": "TON GROUPE",
			"TU CUADRO": "TON TABLEAU",
			"¡CAMPEÓN!": "CHAMPION !",
			"Eliminado": "Eliminé",
			"Fuera en la fase de grupos": "Sorti en phase de groupes",
			"Fuera en la fase de liga": "Sorti en phase de championnat",
			"No la juegas esta temporada — así va en el mundo.":
				"Tu ne la joues pas cette saison — voici comment ça se passe dans le monde.",
			"Tu club no está esta temporada — así va en el mundo.":
				"Ton club n'y est pas cette saison — voici comment ça se passe dans le monde.",
			"Sin campo europeo esta temporada.": "Pas de coupe européenne cette saison.",
			"CAMPEÓN: {0}": "CHAMPION : {0}",
			"ACTIVO": "EN COURS",
			"No la juegas esta temporada — mira su carrera de goleo.":
				"Tu ne la joues pas cette saison — regarde sa course au titre de buteur.",
			"COPA NACIONAL": "COUPE NATIONALE",
			"Aún no arranca.": "Elle n'a pas encore commencé.",
			"¡CAMPEÓN DE COPA!": "CHAMPION DE LA COUPE !",
			"¡CAMPEÓN DE LIGA!": "CHAMPION DE LIGUE !",
			"¡CAMPEÓN DE COPA DE CAMPEONES!": "CHAMPION DE LA COUPE ELITE !",
			"¡CAMPEÓN DE COPA EUROPA!": "CHAMPION DE LA COUPE EUROPA !",
			"¡CAMPEÓN DE COPA CONFERENCIA!": "CHAMPION DE LA COUPE CHALLENGE !",
			"Fase final de Copa de Campeones": "Phase finale de la Coupe Elite",
			"Fase final de Copa Europa": "Phase finale de la Coupe Europa",
			"Fase final de Copa Conferencia": "Phase finale de la Coupe Challenge",
			"Clasificado a Copa de Campeones": "Qualifié pour la Coupe Elite",
			"Clasificado a Copa Europa": "Qualifié pour la Coupe Europa",
			"Clasificado a Copa Conferencia": "Qualifié pour la Coupe Challenge",
			"Eliminado de la Copa": "Eliminé de la Coupe",
			"A eliminatoria directa: sin tabla de goleadores.":
				"Elimination directe : pas de classement des buteurs.",
			"MUNDIAL DE CLUBES": "MONDIAL DES CLUBS",
			"Contra los mejores clubes de otras confederaciones.":
				"Contre les meilleurs clubs des autres confédérations.",
			"¡CAMPEÓN DEL MUNDO DE CLUBES!": "CHAMPION DU MONDE DES CLUBS !",
			"Eliminado del Mundial de Clubes": "Eliminé du Mondial des clubs",
			"Aún sin nacionalidad.": "Pas encore de nationalité.",
			"El Mundial se juega cada {0} temporadas; quedar entre los {1} primeros del"
			+ " grupo clasifica.":
				"Le Mondial se joue toutes les {0} saisons ; finir dans les {1} premiers du groupe qualifie.",
			"Sin datos de esta competición todavía.": "Pas encore de données pour cette compétition.",
			"TOP 10 · GOLEO": "TOP 10 · BUTS",
			"TOP 10 · ASISTENCIAS": "TOP 10 · PASSES DECISIVES",
			"TOP 10 · MEDIA": "TOP 10 · NOTE",
			"{0} {1} · vs": "{0} {1} · vs",
			"Por definir": "A définir",
			"Por definir.": "A définir.",
			"Fase de grupos": "Phase de groupes",
			"Fase de liga": "Phase de championnat",
			"EL SORTEO": "LE TIRAGE",


			"GRUPO DE LA MUERTE": "GROUPE DE LA MORT",


			"EL MUNDIAL ES ESTE AÑO": "LE MONDIAL, C'EST CETTE ANNEE",
			"EL MUNDIAL ES EL AÑO QUE VIENE": "LE MONDIAL, C'EST L'AN PROCHAIN",
			"MUNDIAL EN {0} TEMPORADAS": "MONDIAL DANS {0} SAISONS",
			"Lo juegas con {0} años.": "Tu la joues à {0} ans.",
			"Llegarás con {0} años.": "Tu y arriveras à {0} ans.",
			"No llegarás: a esa edad ya estarás retirado.": "Tu n'y arriveras pas : tu seras déjà à la retraite.",
			"TUS RIVALES": "TES ADVERSAIRES",
			"{0} EN CASA · {1} FUERA": "{0} A DOMICILE · {1} A L'EXTERIEUR",
			"Los mismos que verás en tu calendario.":
				"Les mêmes que tu verras dans ton calendrier.",
			"FASE DE LIGA": "PHASE DE CHAMPIONNAT",
			"TÚ": "TOI",
			"{0}. {1}  {2} PTS ({3} PJ)": "{0}. {1}  {2} PTS ({3} MJ)",
			"Aún no arranca": "Pas encore commencé",
			"¡Campeón de Copa!": "Champion de la Coupe !",
			"En {0}": "En {0}",
			"En juego": "En cours",
			"¡Campeón de Copa de Campeones!": "Champion de la Coupe Elite !",
			"Fase final": "Phase finale",
			"OCTAVOS DE FINAL": "8es DE FINALE",
			"CUARTOS DE FINAL": "QUARTS DE FINALE",
			"SEMIFINAL": "DEMI-FINALE",
			"Playoff": "Barrage",
			"PLAYOFF": "BARRAGE",
			"Octavos": "8es de finale",
			"Cuartos": "Quarts de finale",
			"Semifinal": "Demi-finale",
			"Final": "Finale",
			"LEYENDAS DEL MUNDO": "LEGENDES DU MONDE",
			"TABLEROS MUNDIALES": "CLASSEMENTS MONDIAUX",
			"Arriba, las leyendas de tu partida. Aquí, jugadores reales de todo el mundo: tu mejor carrera se manda al cerrar cada temporada.": "Au-dessus, les légendes de ta partie. Ici, des joueurs réels du monde entier : ta meilleure carrière est envoyée à la fin de chaque saison.",
			"VER EN GAME CENTER": "VOIR DANS GAME CENTER",
			"FORTUNA": "FORTUNE",
			"LOGROS EN GAME CENTER": "SUCCES DANS GAME CENTER",
			"Arriba, tu catálogo completo. En Game Center, los que Apple conoce: se mandan solos al desbloquearse, y ahí se ve cuántos jugadores del mundo tienen cada medalla.": "Au-dessus, ton catalogue complet. Dans Game Center, ceux qu'Apple connaît : ils sont envoyés automatiquement au déblocage, et tu y vois combien de joueurs dans le monde possèdent chaque médaille.",
			"TOP {0}": "TOP {0}",
			"MÁS TROFEOS INDIVIDUALES": "PLUS DE TROPHEES INDIVIDUELS",
			"MÁS TROFEOS DE EQUIPO": "PLUS DE TROPHEES COLLECTIFS",
			"MÁS TROFEOS EN TOTAL": "PLUS DE TROPHEES AU TOTAL",
			"Los premios que se ganan uno solo: el mejor del año y las botas de goleo.":
				"Les titres qui se gagnent seul : meilleur joueur de l'année et souliers de buteur.",
			"Ligas, copas, continentales y Mundiales: lo que se levanta con once.":
				"Championnats, coupes, continentales et Mondiaux : ce qui se soulève à onze.",
			"La vitrina entera, sin preguntar de dónde salió cada trofeo.":
				"Toute la vitrine, sans demander d'où vient chaque trophée.",
			"LEYENDAS POR LIGA": "LEGENDES PAR CHAMPIONNAT",
			"LEYENDAS POR CLUB": "LEGENDES PAR CLUB",
			"No ha habido leyendas en {0}… aún.": "Pas encore de légendes à {0}… pour l'instant.",
			"este club": "ce club",
			"INDIV.": "INDIV.",
			"EQUIPO": "EQUIPE",
			"GOLES + ASISTENCIAS": "BUTS + PASSES DECISIVES",
			"LA LEYENDA A TIRO": "LA LEGENDE EN LIGNE DE MIRE",
			"A {0} DE LA LEYENDA": "A {0} DE LA LEGENDE",
			"IGUALADO CON LA LEYENDA": "A EGALITE AVEC LA LEGENDE",
			"Máximos productores de la historia (G+A). Sólo cuenta lo hecho en 1ª división"
			+ " o con tu selección: es lo que mide a los grandes.":
				"Les plus productifs de l'histoire (B+PD). Seul compte ce qui a été fait en"
				+ " 1ère division ou en sélection : c'est ce qui mesure les grands.",
			"TU PRODUCCIÓN · POR CATEGORÍA": "TA PRODUCTION · PAR CATEGORIE",
			"ÉLITE (1ª + SELECCIÓN)": "ELITE (D1 + SELECTION)",
			"TOTAL (TODAS LAS CATEGORÍAS)": "TOTAL (TOUTES CATEGORIES)",
			"La diferencia ({0} G · {1} A) es lo hecho en 2ª y 3ª división.":
				"La différence ({0} B · {1} PD) vient de la 2e et de la 3e division.",
			"Balón de Oro": "Joueur de l'Année",
			"Goleo": "Soulier",
			"Ligas": "Championnats",
			"Copas": "Coupes",
			"Continental": "Continental",
			"Mundial": "Mondial",
			"LOS MÁS LAUREADOS DEL MUNDO": "LES PLUS DECORES DU MONDE",
			"CLUBES · {0}": "CLUBS · {0}",
			"TE QUIEREN": "ILS TE VEULENT",
		"TE MIRA": "TE SUIT",
		"NADIE": "PERSONNE",
			"1 CLUB": "1 CLUB",
			"Hoy ningún club te ficharía a tu nivel. Rinde y sube tu valor para que empiecen a mirarte.": "Aucun club ne te signerait à ton niveau aujourd’hui. Performe et fais monter ta valeur pour qu’on te regarde.",
			"{0} CLUBES": "{0} CLUBS",
			"CLUB": "CLUB",
			"INTERNACIONALIDADES": "SELECTIONS",
			"GOLES": "BUTS",
			"{0} · TEMPORADA {1}{2}": "{0} · SAISON {1}{2}",
			"no convocado": "non convoqué",
			"RUMBO AL MUNDIAL": "ROUTE VERS LE MONDIAL",
			"El Mundial se juega cada 4 temporadas. Quedar entre los {0} primeros de tu"
			+ " grupo clasifica.":
				"Le Mondial se joue toutes les 4 saisons. Finir dans les {0} premiers de ton groupe qualifie.",
			"HISTORIAL": "HISTORIQUE",
			"Aún no has cerrado una temporada con la selección.":
				"Tu n'as pas encore terminé une saison avec ta sélection.",
			"T{0} · {1}": "S{0} · {1}",
			"SELECCIÓN DE {0}": "SELECTION DE {0}",
			"FUERA DE LA CONVOCATORIA": "HORS DE LA LISTE",
			"SIN DORSAL": "SANS NUMERO",
			"VER CONVOCATORIA": "VOIR LA LISTE",

			"PTS": "PTS",
			"A {0} PUESTOS": "A {0} PLACES",
			"PUESTO {0}": "{0}e AU CLASSEMENT",
			"Tu media es {0}. Con la vara de {1} son {2}; {3} de fama y {4} de mérito la dejan en {5}.":
				"Ta moyenne est {0}. À l'échelle de {1}, c'est {2} ; {3} de notoriété et {4}"
				+ " de mérite la portent à {5}.",
			"CORTE LISTA": "SEUIL LISTE",
			"CORTE ONCE": "SEUIL ONZE",

			"Eres el número {0} de {1} por puntuación, pero el sitio que ocuparías es el de {2} ({3}): a nadie que te saque más de {4} se le quita el puesto. Necesitas {5}.":
				"Au classement tu es le numéro {0} de {1}, mais la place que tu prendrais est"
				+ " celle de {2} ({3}) : on ne sort personne qui te devance de plus de {4}."
				+ " Il te faut {5}.",
			"Entras en la lista, pero no en el once: el sitio que ocuparías es el de {0} ({1}) y a nadie que te saque más de {2} se le quita el puesto. Necesitas {3}.":
				"Tu es dans la liste mais pas dans le onze : la place que tu prendrais est"
				+ " celle de {0} ({1}), et on ne sort personne qui te devance de plus de {2}."
				+ " Il te faut {3}.",
			"Lo que más te acerca: ganarte al seleccionador en la concentración (hasta {0}), un título individual (hasta {1}) y tu temporada de club (hasta {2}).":
				"Ce qui pèse le plus : convaincre le sélectionneur en stage (jusqu'à {0}), un"
				+ " titre individuel (jusqu'à {1}) et ta saison en club (jusqu'à {2}).",

			"Tu puntuación ya es {0} y hoy daría para entrar, pero la lista de esta campaña se cerró antes de que llegaras: el seleccionador no la rehace a mitad de camino. Tu sitio se juega en la próxima.":
				"Tu es déjà à {0}, de quoi entrer aujourd'hui, mais la liste de cette campagne"
				+ " a été arrêtée avant que tu n'arrives : le sélectionneur ne la refait pas"
				+ " en cours de route. Ta place se joue à la prochaine.",
			"Sigues en la lista de esta campaña: al seleccionador no le gusta cortar a nadie a mitad de camino. Pero tu puntuación cayó a {0} y el corte está en {1}: si no reaccionas, la próxima lista se hace sin ti.":
				"Tu restes dans la liste de cette campagne : le sélectionneur n'aime pas"
				+ " couper quelqu'un en cours de route. Mais tu es tombé à {0} et le seuil"
				+ " est à {1} : sans réaction, la prochaine liste se fera sans toi.",
			"Debut: {0} años": "Débuts : {0} ans",
			"Temporada {0}": "Saison {0}",
			"marcaste": "tu as marqué",
			"RETIRADO DE LA SELECCIÓN": "RETRAITE DE LA SELECTION",
			"RETIRARTE DE LA SELECCIÓN": "TE RETIRER DE LA SELECTION",
			"YA NO ENTRAS EN LA LISTA": "TU N'ES PLUS SUR LA LISTE",
			"GOLEADORES HISTÓRICOS": "MEILLEURS BUTEURS HISTORIQUES",
			"¿CUELGAS LA CAMISETA DE TU PAÍS?": "TU RACCROCHES LE MAILLOT DE TON PAYS ?",
			"El seleccionador ya no cuenta contigo. Tus {0} partidos y {1} goles quedan sellados, y las fechas de selecciones dejan de costarte energía. Sólo un Mundial podría hacerte volver.": "Le sélectionneur ne compte plus sur toi. Tes {0} sélections et {1} buts restent gravés, et les trêves internationales ne te coûtent plus d'énergie. Seul un Mondial pourrait te faire revenir.",
			"Colgaste la camiseta de {0}. Sus torneos siguen en tu calendario, pero"
			+ " los ves desde fuera.":
				"Tu as raccroché le maillot de {0}. Ses tournois restent dans ton calendrier,"
				+ " mais tu les regardes de l'extérieur.",
			"VOLVER PARA EL MUNDIAL": "REVENIR POUR LE MONDIAL",
			"¿VUELVES DEL RETIRO?": "TU REVIENS DE RETRAITE ?",
			"{0} juega el Mundial y el seleccionador te quiere en la lista. Volver es volver de verdad: las fechas de selecciones vuelven a contar contigo.": "{0} joue le Mondial et le sélectionneur te veut dans la liste. Revenir, c'est revenir pour de vrai : les trêves internationales recomptent sur toi.",
			"VUELVO": "JE REVIENS",
			"{0} JUGADORES": "{0} JOUEURS",
			"Grupo por definir.": "Groupe à définir.",
			"{0}. {1}  {2} PTS ({3})": "{0}. {1}  {2} PTS ({3})",
			"— corte de clasificación —": "— seuil de qualification —",
			"Ahora mismo: {0}": "Actuellement : {0}",
			"CLASIFICADA": "QUALIFIEE",
			"fuera del Mundial": "hors du Mondial",
			"fuera de {0}": "hors de {0}",
			"Cuadro por definir.": "Tableau à définir.",
			"{0} no está en {1}.": "{0} n'est pas à {1}.",
			"Clasifícala la próxima vez quedando entre los tres primeros de tu grupo.":
				"Qualifie-la la prochaine fois en finissant dans les trois premiers de ton"
				+ " groupe.",
			"¡{0}, CAMPEÓN de {1}!": "{0}, CHAMPION de {1} !",
			"Proyección de {0}: {1}": "Projection de {0} : {1}",
			"{0} selecciones en el cuadro. Tu papel en el club mueve la aguja: rinde y"
			+ " llévala lejos.":
				"{0} sélections dans le tableau. Ton rôle en club fait bouger l'aiguille :"
				+ " performe et emmène-la loin.",
			"Las clasificatorias aún no empiezan.": "Les qualifications n'ont pas encore commencé.",
			"{0}. {1}  {2} PTS ({3}, {4} PJ)": "{0}. {1}  {2} PTS ({3}, {4} MJ)",
			"— corte de clasificación al Mundial —": "— seuil de qualification au Mondial —",
			"¡{0} CLASIFICADA!": "{0} QUALIFIEE !",
			"{0} se quedó fuera del Mundial": "{0} est restée hors du Mondial",
			"{0} · vs": "{0} · vs",
			"{0} quedó eliminada de {1}": "{0} a été éliminée de {1}",
			"LIBRO DE RÉCORDS": "LIVRE DES RECORDS",
			"LIGA · CLUB · MUNDO": "LIGUE · CLUB · MONDE",
			"ABRIR": "OUVRIR",
			"VITRINA": "VITRINE",
			"Aún vacía. Gana una liga, una copa o una bota y aquí lucirá tu primer trofeo.":
				"Encore vide. Gagne un championnat, une coupe ou un titre de meilleur buteur et ton premier trophée brillera ici.",
			"TEMPORADA A TEMPORADA": "SAISON PAR SAISON",
			"EN EQUIPO · {0}": "EN EQUIPE · {0}",
			"INDIVIDUALES · {0}": "INDIVIDUEL · {0}",
			"Aún no has cerrado ninguna temporada.": "Tu n'as encore terminé aucune saison.",
			"* temporada en curso": "* saison en cours",
			"El detalle por temporada aparecerá aquí al cerrar la temporada en la que ganes"
			+ " tu próximo premio.":
				"Le détail par saison apparaîtra ici quand tu termineras la saison où tu"
				+ " gagnes ton prochain prix.",
			"POR TEMPORADA": "PAR SAISON",
			"TRASPASOS": "TRANSFERTS",
			"Sigues donde empezaste.": "Tu es toujours où tu as commencé.",
			"LEGADO": "HERITAGE",
			"Puntos de legado: {0} — suben con goles, títulos y partidos con tu"
			+ " selección.":
				"Points d'héritage : {0} — ils montent avec les buts, les titres et les"
				+ " sélections en équipe nationale.",
			"Vía Mundo · prestigio {0}/{1}": "Voie Monde · prestige {0}/{1}",
			"necesitas {0} puntos de legado": "il te faut {0} points d'héritage",
			"Vía Club · {0}/{1} títulos": "Voie Club · {0}/{1} titres",
			"{0} histórico del club": "{0} de l'histoire du club",
			"(pide top-2)": "(top 2 requis)",
			"aún no figuras entre sus leyendas": "tu ne figures pas encore parmi ses légendes",
			"Fuera del top {0} de la historia": "Hors du top {0} de l'histoire",
			"{0} de la historia": "{0} de l'histoire",
			"Nadie por encima: el más grande que ha pisado un campo.":
				"Personne au-dessus : le plus grand à avoir foulé un terrain.",
			"El siguiente a superar": "Le prochain à dépasser",
			"Te falta 1 trofeo": "Il te manque 1 trophée",
			"Te faltan {0} trofeos": "Il te manque {0} trophées",
			"Goles por temporada": "Buts par saison",
			"{0}T": "{0}S",
			"COMO SE SUBE": "COMMENT PROGRESSER",
			"Goles, asistencias y partidos con tu selección suman siempre — los"
			+ " primeros valen mucho y el volumen se aplana. Los trofeos suman entero"
			+ " lo suyo:":
				"Buts, passes décisives et sélections nationales rapportent toujours — les"
				+ " premiers valent beaucoup et le volume s'aplatit ensuite. Les trophées"
				+ " rapportent leur valeur entière :",
			"{0} a los {1}": "{0} à {1}",
			"ASÍ VA LA VOTACIÓN": "LE VOTE EN CE MOMENT",
			"Con lo jugado hasta la jornada {0} de {1}. Si la temporada cerrara hoy,"
			+ " el 1º se lo lleva: el ranking manda, sin excepciones.":
				"Avec ce qui a été joué jusqu'à la journée {0} sur {1}. Si la saison se"
				+ " terminait aujourd'hui, le 1er l'emporterait : le classement décide, sans"
				+ " exception.",
			"Sólo votan la PRIMERA división de las ligas EUROPEAS. Y los títulos del"
			+ " año entran al cierre: una {0} son {1} puntos que hoy no lleva nadie.":
				"Seule la PREMIERE division des championnats EUROPEENS vote. Et les titres"
				+ " de l'année entrent à la clôture : une {0} vaut {1} points que personne ne"
				+ " porte aujourd'hui.",
			"Gana el que más puntos suma, sin excepciones. Los títulos no son una"
			+ " llave aparte: son la forma más rápida de sumar.":
				"Celui qui cumule le plus de points gagne, sans exception. Les titres ne sont"
				+ " pas une voie à part : c'est le moyen le plus rapide d'en cumuler.",
			"La LIGA y la COPA valen según la liga en que se ganan: las cinco grandes"
			+ " pagan el doble que las ligas pequeñas. Abajo van los puntos de TU liga.":
				"Le CHAMPIONNAT et la COUPE valent selon la ligue où ils sont gagnés : les cinq"
				+ " grands championnats paient le double des petits. Ci-dessous, les points de"
				+ " TON championnat.",
			"Tú vas más abajo:": "Toi tu es plus bas :",
			"El mejor de tu equipo:": "Le meilleur de ton club :",
			"Aún no has jugado este año: sin partidos no hay votación que valga.":
				"Tu n'as pas encore joué cette année : sans matchs, pas de vote qui compte.",
			"Tu liga no vota: para entrar hay que jugar la PRIMERA división de una"
			+ " liga EUROPEA.":
				"Ton championnat ne vote pas : pour entrer il faut jouer la PREMIERE division"
				+ " d'un championnat EUROPEEN.",
			"{0} para {1}": "{0} pour {1}",
			"TU RECORRIDO": "TON PARCOURS",
			"T{0}-T{1}": "S{0}-S{1}",
			"Llegaste CEDIDO": "Arrivé en PRET",
			"Pagaron ${0} por ti": "Ils ont payé {0}$ pour toi",
			"Aquí empezaste": "C'est ici que tu as commencé",
			"Llegaste gratis": "Arrivé libre",
			"GLOBAL": "GLOBAL",
			"PARTIDOS": "MATCHS",
			"{0}V · {1}E · {2}D": "{0}V · {1}N · {2}D",
			"ASISTENCIAS": "PASSES DECISIVES",
			"MEDIA": "NOTE",
			"GOLEO": "BUTS",
			"mejor: {0}": "meilleur : {0}",
			"TEMPORADAS": "SAISONS",
			"en {0} {1}": "à {0} {1}",
			"INTERNACIONAL": "INTERNATIONAL",
			"{0} goles con {1}": "{0} buts avec {1}",
			"$ {0}  ·  ahora": "{0}$  ·  maintenant",
			"La curva aparece al cerrar tu segunda temporada.":
				"La courbe apparaît quand tu termines ta deuxième saison.",
			"Pico: ${0} en la temporada {1}": "Pic : {0}$ en saison {1}",
			"T{0} · ${1}": "S{0} · {1}$",
			"tabLIGA": "LIGUE",
			"tabCHAMP": "ELITE",
			"tabEUROPA": "EUROPA",
			"tabCOPA": "COUPE",
			"tabCLUBES": "CLUBS",
			"tabMUNDIAL": "MONDIAL",
			"tabCONTIN.": "CONT.",
			"tabCLASIF": "QUALIF",
			"palmaresLIGA": "LGE",
			"palmaresCOPA": "COUPE",
			"palmaresCONT.": "CONT.",
			"tablaTEMP": "SAI",
			"tablaCLUB": "CLUB",
			"tablaPJ": "M",
			"tablaG": "B",
			"tablaA": "PD",
			"tablaNOTA": "NOTE",
			"tabla_ligaEQUIPO": "EQUIPE",
			"tabla_ligaPJ": "M",
			"tabla_ligaG": "V",
			"tabla_ligaE": "N",
			"tabla_ligaP": "D",
			"tabla_ligaPTS": "PTS",
			"tabla_ligaGOLES": "BUTS",
			"tabla_ligaASIST": "PD",
			"CED": "PRET",
			"{0}A": "{0}A",
			"{0}S": "{0}S",
			"{0}P": "{0}M",
			"CEDIDO · NO SE RENUEVA": "PRETE · PAS DE RENOUVELLEMENT",
			"TREN DE VIDA": "TRAIN DE VIE",
			"NETO POR PARTIDO": "NET PAR MATCH",
			"TUS NOES": "TES REFUS",
			"SE VAN HOY": "PARTENT AUJOURD'HUI",
			"Se hartaron de tus noes: el club contaba con esa venta. El técnico deja de contar contigo hasta el año que viene.":
				"Ils en ont assez de tes refus : le club comptait sur cette vente."
				+ " L'entraîneur arrête de compter sur toi jusqu'à l'an prochain.",
			"Llevas muchos noes: lo que llega ahora ya no es del nivel de lo que tumbaste.":
				"Tu as accumulé les refus : ce qui arrive maintenant n'est plus au niveau de"
				+ " ce que tu as repoussé.",
			"Tu agente sostiene esa oferta: se sabe en la próxima jornada.":
				"Ton agent maintient cette offre : réponse la prochaine journée.",
			"Tu agente no acepta más encargos esta ventana.":
				"Ton agent n'accepte plus de missions ce mercato.",
			"Te quedan {0} encargo(s) esta ventana (tu agente acepta más cuanto mejor te trate).":
				"Il te reste {0} mission(s) ce mercato (ton agent en accepte plus si tu le"
				+ " traites bien).",
			"Tu agente puede llamar igual, pero volverá con las manos vacías y te costará {0}, un poco de vestuario y el trato con él.":
				"Ton agent peut appeler quand même, mais il reviendra bredouille et ça te"
				+ " coûtera {0}, un peu de vestiaire et ta relation avec lui.",
			"Tu club no te deja salir: pide el traspaso primero.":
				"Ton club ne te laisse pas partir : demande le transfert d'abord.",
			"El mercado está cerrado: el botón de irte aparece al abrir la ventana. Negarte, puedes ya.":
				"Le marché est fermé : le bouton pour partir apparaît à l'ouverture du"
				+ " mercato. Refuser, tu peux déjà.",
			"PEDISTE EL TRASPASO": "TU AS DEMANDE LE TRANSFERT",
			"ESTÁS CEDIDO": "TU ES PRETE",
			"Juegas en {0}, pero tu pase es de {1}.":
				"Tu joues à {0}, mais ton contrat appartient à {1}.",
			"tu club dueño": "ton club propriétaire",
			"Mientras dure la cesión, aquí no hay nada que firmar ni negociar. Vuelves a {0} al cerrar la temporada.":
				"Tant que dure le prêt, il n'y a rien à signer ni négocier ici. Tu reviens à"
				+ " {0} à la fin de la saison.",
			"Hay clubes esperándote cedido, pero el mercado está cerrado: la cesión se firma cuando abra la ventana.":
				"Des clubs t'attendent en prêt, mais le marché est fermé : le prêt se signe à"
				+ " l'ouverture du mercato.",
			"Estás EN LISTA DE CESIÓN: mientras sigas en ella, cada ventana te trae destinos nuevos.":
				"Tu es SUR LA LISTE DE PRET : tant que tu y restes, chaque mercato t'apporte de"
				+ " nouvelles destinations.",
			"{0} · titular probable · una temporada": "{0} · titulaire probable · une saison",
			"Sueldo/partido": "Salaire/match",
			"Prima (sin traspaso)": "Prime (sans indemnité)",
			"Traspaso": "Indemnité",
			"Tu prima": "Ta prime",
			"Prima (bruta)": "Prime (brute)",
			"Te queda limpio": "Il te reste net",
			"Tu prima (limpia)": "Ta prime (nette)",
			"(−{0}% agente)": "(−{0}% agent)",
			"LA SOSTIENE TU AGENTE": "TON AGENT LA MAINTIENT",
			"HOY O NUNCA": "DERNIERE CHANCE",
			"Va {0} de {1} en {2} · {3}": "{0}e sur {1} à {2} · {3}",
			"RECHAZAR ESTA OFERTA": "REFUSER CETTE OFFRE",
			"MANTÉN PARA FICHAR": "MAINTIENS POUR SIGNER",
			"¿ENCARGAR?": "MISSIONNER ?",
			"MANTÉN PARA ENCARGAR": "MAINTIENS POUR MISSIONNER",
			"Tu agente trabajará {0} esta ventana. Cuesta {1}.": "Ton agent travaillera {0} cette fenêtre. Coûte {1}.",
			"la liga de {0}": "le championnat de {0}",
			"MANTÉN PARA FIRMAR": "MAINTIENS POUR SIGNER",
			"MANTÉN PARA NO RENOVAR": "MAINTIENS POUR NE PAS PROLONGER",
			"MANTÉN PARA FIRMAR EL PRECONTRATO": "MAINTIENS POUR SIGNER LE PRECONTRAT",
			"MANTÉN PARA RECHAZAR": "MAINTIENS POUR REFUSER",
			"TU CLUB NO TE VENDE: te queda contrato y cuentan contigo. Pide el traspaso ahí abajo para poder firmar.":
				"TON CLUB NE TE VEND PAS : il te reste du contrat et on compte sur toi."
				+ " Demande le transfert ci-dessous pour pouvoir signer.",
			"QUE TU AGENTE LA SOSTENGA": "QUE TON AGENT LA MAINTIENNE",
			"TU AGENTE LA SOSTIENE · RESPONDEN MAÑANA": "TON AGENT LA MAINTIENT · REPONSE DEMAIN",
			"Se retiran de la puja para siempre en este mercado. El mercado cierra hoy: nadie ocupará su hueco.":
				"Ils se retirent définitivement des enchères ce mercato. Le marché ferme"
				+ " aujourd'hui : personne ne prendra leur place.",
			"Tu club contaba con esta venta: con este NO se les acaba la paciencia y el técnico dejará de contar contigo.":
				"Ton club comptait sur cette vente : avec ce NON leur patience s'épuise et"
				+ " l'entraîneur arrêtera de compter sur toi.",
			"Tu club contaba con esta venta: te quedan {0} noes antes de que se les acabe la paciencia.":
				"Ton club comptait sur cette vente : il te reste {0} refus avant que leur"
				+ " patience s'épuise.",
			"Y llevas muchos noes: lo que llegue en su lugar vendrá por debajo de lo que estás tumbando.":
				"Et tu as accumulé les refus : ce qui arrivera à sa place sera en dessous de ce"
				+ " que tu repousses.",
			"OFERTA RECHAZADA · EL MERCADO CIERRA HOY": "OFFRE REFUSEE · LE MARCHE FERME AUJOURD'HUI",
			"CONCENTRADO CON {0}": "EN STAGE AVEC {0}",
			"Aquí mandan otros. Que tu club te adore no le dice nada al seleccionador: a esta gente te la ganas jugando las fechas FIFA.":
				"Ici, d'autres décident. Que ton club t'adore ne dit rien au sélectionneur :"
				+ " ces gens-là, tu les gagnes en jouant les dates FIFA.",
			"Seleccionador": "Sélectionneur",
			"Es quien firma la lista. Mira tu nota cuando juegas con el país.":
				"C'est lui qui signe la liste. Il regarde ta note quand tu joues pour le pays.",
			"Las tres suman {0} puntos a tu convocatoria.":
				"Les trois ajoutent {0} points à ta convocation.",
			"Vestuario de la selección": "Vestiaire de la sélection",
			"Se gana ganando juntos. Una derrota jugando mal es lo que más resta.":
				"Ça se gagne en gagnant ensemble. Une défaite en jouant mal, c'est ce qui coûte"
				+ " le plus.",
			"Afición de {0}": "Supporters de {0}",
			"Le enamora que marques. En casa, si te quiere te llega un balón más; si te pita, uno menos.":
				"Marquer les séduit. À domicile, s'il t'aime, tu reçois un ballon de plus ; s'il te siffle, un de moins.",
			"LOS TUYOS, ESTÉS DONDE ESTÉS": "LES TIENS, OU QUE TU SOIS",
			"Te siguen a todas partes: lo que hagas con tu país también cuenta.":
				"Ils te suivent partout : ce que tu fais avec ton pays compte aussi.",
			"Sigue siendo el tuyo. Una buena fecha FIFA sube tu precio.":
				"Il reste le tien. Une bonne date FIFA fait monter ton prix.",
			"COPA EU": "ELITE",
			"COPA C.": "EUROPA",
			"COPA 3": "CHALL.",
			"ASCENSO": "MONTEE",
			"DESCENSO": "DESCENTE",
			"CUADRO": "TABLEAU",
			"Torneo en curso.": "Tournoi en cours.",
			"Quedar entre los {0} primeros del grupo clasifica para {1}.":
				"Finir dans les {0} premiers du groupe qualifie pour {1}.",
			"Pasan los {0} primeros de cada grupo.": "Les {0} premiers de chaque groupe passent.",
			"El cuadro se sortea al acabar la fase de grupos.":
				"Le tableau est tiré au sort à la fin de la phase de groupes.",
			"El cuadro se sortea al acabar la primera fase.":
				"Le tableau est tiré au sort à la fin de la première phase.",
			"Del 1 al {0}, a octavos. Del {1} al {2}, al playoff. El resto, fuera.":
				"De 1 à {0}, en 8es de finale. De {1} à {2}, au barrage. Le reste, éliminé.",
			"Todavía no se ha entregado ninguno. Se falla al cerrar cada temporada, con los números de todo el mundo.":
				"Aucun n'a encore été décerné. Ça se décide à la clôture de chaque saison, avec"
				+ " les chiffres de tout le monde.",
			"LA VOTACIÓN": "LE VOTE",

			"EL ONCE IDEAL": "L'EQUIPE TYPE",

			"{0} ligas en {1} años": "{0} championnats en {1} ans",
			"Aún no se ha cerrado ninguna temporada.": "Aucune saison n'a encore été bouclée.",
			"Antes de tu carrera, sin fechas: {0}": "Avant ta carrière, sans dates : {0}",
			"Los once mejores de {0} esa temporada, por nota media.": "Les onze meilleurs de {0} cette saison-là, à la note moyenne.",
			"Los que más cerca estuvieron, con lo que hizo cada uno. Los puntos salen del baremo de abajo.":
				"Ceux qui s'en sont approchés le plus, avec ce que chacun a fait. Les points"
				+ " viennent du barème ci-dessous.",
			"Tú quedaste más abajo:": "Toi tu as fini plus bas :",
			"Ese año no entraste en la votación.": "Cette année-là tu n'es pas entré dans le vote.",
			"Una línea por temporada: goles, asistencias, media y puntos de la votación. Toca una para verla completa.":
				"Une ligne par saison : buts, passes décisives, note et points du vote. Touche-en"
				+ " une pour la voir en entier.",
			"ASIST.": "PD",
			"PUNTOS": "POINTS",
			"No levantó ningún título esa temporada.": "N'a soulevé aucun titre cette saison-là.",
			"También: {0}": "Aussi : {0}",
			"COMO SE GANA": "COMMENT ON LE GAGNE",
			"Los puntos con los que se elige al mejor del año. Los de tu selección y los de Europa pesan más.":
				"Les points qui désignent le meilleur de l'année. Ceux de ta sélection et de"
				+ " l'Europe pèsent plus.",
			"Sólo entran en la votación los que juegan la PRIMERA DIVISIÓN de una liga EUROPEA.":
				"Seuls entrent dans le vote ceux qui jouent la PREMIERE DIVISION d'un"
				+ " championnat EUROPEEN.",
			"GOL EN LIGA": "BUT EN CHAMPIONNAT",
			"ASISTENCIA EN LIGA": "PASSE DECISIVE EN CHAMPIONNAT",
			"GOL EN {0}": "BUT EN {0}",
			"ASISTENCIA EN {0}": "PASSE DECISIVE EN {0}",
			"CADA DECIMA DE MEDIA SOBRE {0}": "CHAQUE DIXIEME DE NOTE AU-DESSUS DE {0}",
			"{0} PTS": "{0} PTS",
			"{0}G {1}A  ·  {2}": "{0}B {1}PD  ·  {2}",
			"  ({0} en {1})": "  ({0} en {1})",
			"TE PIDIERON: {0}   {1}/{2}": "ON T'A DEMANDE : {0}   {1}/{2}",
			"CAPITÁN DE {0}": "CAPITAINE DE {0}",
			"Llevas la cinta desde hace {0} temporadas.": "Tu portes le brassard depuis {0} saisons.",
			"JUGAR PARA {0}": "JOUER POUR {0}",
			"SU ONCE CORTA EN {0}": "LEUR ONZE COUPE A {0}",
			"¿JUGAR PARA {0}?": "JOUER POUR {0} ?",
			"Llevas {0} temporadas jugando ahí y ningún partido oficial te ata todavía a {1}. Su once corta en {2}; el de {1}, en {3}.":
				"Ça fait {0} saisons que tu joues là-bas et aucun match officiel ne t'attache"
				+ " encore à {1}. Leur onze coupe à {2} ; celui de {1}, à {3}.",
			"No hay marcha atrás. Empiezas de cero con ellos: el seleccionador, el vestuario y la afición vuelven a no conocerte, y pierdes el brazalete si lo llevabas. Tus partidos y tus goles se quedan en tu historial.":
				"Pas de retour en arrière. Tu repars de zéro avec eux : le sélectionneur, le"
				+ " vestiaire et les supporters ne te connaissent plus, et tu perds le"
				+ " brassard si tu le portais. Tes matchs et tes buts restent dans ton"
				+ " historique.",
			"SÍ, ELIJO {0}": "OUI, JE CHOISIS {0}",
			"SEGUIR CON LOS MÍOS": "RESTER AVEC LES MIENS",
			"{0} se juega al terminar la temporada de clubes; el campeón se sabrá entonces.":
				"{0} se joue à la fin de la saison des clubs ; le champion sera connu à ce"
				+ " moment-là.",
			"Clasifícala la próxima vez quedando entre los {0} primeros de tu grupo.":
				"Qualifie-la la prochaine fois en finissant dans les {0} premiers de ton"
				+ " groupe.",
			"Cada sello es un título: temporada · club · división.":
				"Chaque cachet est un titre : saison · club · division.",
			"LO QUE SE PUEDE GANAR": "CE QU'IL Y A A GAGNER",
			"+{0} SIN REGISTRO": "+{0} SANS TRACE",
			"GRADA": "TRIBUNES",
			"+{0} más": "+{0} de plus",
			"CED = esa temporada la jugaste CEDIDO: el club de la fila te tenía prestado, no eras suyo.":
				"PRET = cette saison-là tu l'as jouée en PRET : le club de la ligne t'avait"
				+ " emprunté, tu n'étais pas à lui.",
			"MAPA DE TIROS": "CARTE DES TIRS",
			"PEDIR EL CAMBIO": "DEMANDER LE CHANGEMENT",
			"PROGRESIÓN": "PROGRESSION",
			"Aún no has rematado. Cada tiro que pegues este año queda marcado aquí, con el sitio desde el que salió.":
				"Tu n'as pas encore tiré. Chaque tir que tu frappes cette année est marqué ici,"
				+ " avec l'endroit d'où il est parti.",
		"Ese año aún no se apuntaban los remates.":
			"Cette année-là, les tirs n'étaient pas encore notés.",
		"Ese año aún no se apuntaban los pases.":
			"Cette année-là, les passes n'étaient pas encore notées.",
		"Ese año aún no se apuntaba por dónde te movías.":
			"Cette année-là, tes déplacements n'étaient pas encore notés.",
		"En este partido no remataste.":
			"Dans ce match, tu n'as pas tiré une seule fois.",
		"En este partido no le dejaste el balón a nadie.":
			"Dans ce match, tu n'as donné le ballon à personne.",
		"En este partido no quedó rastro de tus movimientos.":
			"Dans ce match, tes déplacements n'ont laissé aucune trace.",
			"A PUERTA": "CADRES",
			"Sobre {0} remates medidos": "Sur {0} tirs mesurés",
			" · {0} bloqueados (no cuentan: no fue tu puntería)":
				" · {0} contrés (ne comptent pas : ce n'était pas ta visée)",
			"EL MARCO — dónde cruzó cada tiro": "LE CADRE — où chaque tir a franchi la ligne",
			"EL CAMPO — desde dónde tiraste": "LE TERRAIN — d'où tu as tiré",



		"DESVIADO": "A COTE",
		"TAPADO": "CONTRE",
		"ANULADO": "ANNULE",
		"POR DÓNDE ANDUVISTE": "TES ZONES",

		"REGATE GANADO": "DRIBBLE REUSSI",
		"SALISTE CON {0}": "DEPART A {0}",
		"ACABAS EN {0}": "FIN A {0}",
		"RECUPERASTE": "RECUPERE",
		"OTRAS COMPRAS": "AUTRES ACHATS",
		"DESCANSO Y FÍSICO": "REPOS ET PHYSIQUE",
		"SIN CAMBIOS": "INCHANGE",
			"EN TODA TU CARRERA": "SUR TOUTE TA CARRIERE",
			"DESDE MÁS LEJOS": "DE PLUS LOIN",
			"TU GOL MÁS LEJANO": "TON BUT LE PLUS LOINTAIN",
			"TU PASE MÁS LARGO": "TA PASSE LA PLUS LONGUE",
			"Ese año: gol desde {0} m": "Cette année-là : but à {0} m",
			"Esta temporada: gol desde {0} m": "Cette saison : but à {0} m",
			"EL MÁS LARGO": "LA PLUS LONGUE",
			"Ese año: pase de {0} m": "Cette année-là : passe de {0} m",
			"Esta temporada: pase de {0} m": "Cette saison : passe de {0} m",
			"MAPA": "CARTE",
			"MAPA DE PASES": "CARTE DES PASSES",
			"REGATES": "DRIBBLES",
			"MAPA DE REGATES": "CARTE DES DRIBBLES",
			"JUGADA ABIERTA": "JEU OUVERT",
			"TODA TU CARRERA": "TOUTE TA CARRIERE",
			"JUGADA": "ACTION",
			"TIRO LIBRE": "COUP FRANC",
			"CÓRNER": "CORNER",
			" · sólo {0}": " · {0} uniquement",
			"Aún no has pisado el campo. Aquí va a quedar el rastro de por dónde te mueves, dónde te quitan el balón y dónde te hacen falta.":
				"Tu n'as pas encore foulé la pelouse. C'est ici que restera la trace de tes déplacements, des ballons qu'on te prend et des fautes qu'on te fait.",
			"TE LA QUITARON": "BALLON PERDU",
			"FALTAS A FAVOR": "FAUTES OBTENUES",
			"LA CANCHA — atacas hacia la derecha": "LE TERRAIN — tu attaques vers la droite",
			"Toca una marca del campo para ver la jugada.":
				"Touche une marque sur le terrain pour voir l'action.",
			"min {0}": "{0}e min",
			"Viendo {0} de {1} · toca otra vez el chip para verlo todo":
				"{0} sur {1} affichés · retouche la pastille pour tout revoir",
			"{0}: {1}": "{0} : {1}",
			"ninguno en {0}": "aucun sur {0}",
			"1 de cada {0}": "1 sur {0}",
			"Tus asistencias salen sobre todo {0}: {1} de {2}":
				"Tes passes décisives viennent surtout {0} : {1} sur {2}",
			"Donde más te la quitan: {0}, {1}.": "Là où on te la prend le plus : {0}, {1}.",
			"en el último tercio": "dans le dernier tiers",
			"en el medio campo": "au milieu de terrain",
			"en tu propio campo": "dans ton propre camp",
			"POR LA IZQUIERDA": "A GAUCHE",
			"POR EL CENTRO": "DANS L'AXE",
			"POR LA DERECHA": "A DROITE",
			"AL LADO IZQUIERDO": "VERS LA GAUCHE",
			"AL LADO DERECHO": "VERS LA DROITE",
			"AL PALO": "SUR LE POTEAU",
			"POR ENCIMA": "AU-DESSUS",
			"DESPEJADO": "DEGAGE",
			"REMATE": "FRAPPE",
			"ACABÓ EN GOL": "A FINI EN BUT",
			"ACABÓ EN REMATE": "A FINI EN FRAPPE",
			"ANULADO POR FUERA DE JUEGO": "ANNULE POUR HORS-JEU",
			"SE QUEDÓ SIN REMATE": "SANS FRAPPE AU BOUT",
			"SE TE ESCAPÓ": "ELLE T'A ECHAPPE",
			"TE GANÓ EL PORTERO": "LE GARDIEN T'A DEVANCE",
			"NO LLEGASTE AL BALÓN": "TU N'AS PAS ATTEINT LE BALLON",
			"TE ENCERRARON": "ILS T'ONT ENFERME",
			"TE HICIERON FALTA": "ON T'A FAIT FAUTE",
			"PENAL A TU FAVOR": "PENALTY POUR TOI",
			"PERDISTE EL BALÓN": "TU AS PERDU LE BALLON",
			"Y TUS REGATES": "ET TES DRIBBLES",
			"El tercer mapa: por dónde te mueves de verdad, dónde te quitan el balón y dónde te hacen falta.":
				"La troisième carte : où tu te déplaces vraiment, où on te prend le ballon et où on te fait faute.",
			"TOCA UNA MARCA": "TOUCHE UNE MARQUE",
			"Cada balón del campo se puede tocar: te dice contra quién fue, en qué minuto, y te dibuja el vuelo que tuvo.":
				"Chaque ballon du terrain se touche : il te dit contre qui c'était, à quelle minute, et te dessine le vol qu'il a eu.",
			"A REMATE": "VERS UN TIR",
			"SIN REMATE": "SANS TIR",
			"Sobre {0} pases que llegaron": "Sur {0} passes réussies",
			" · {0} pases clave": " · {0} passes clés",
			" · {0} anulados por fuera de juego (no cuentan: no fue tu pase)":
				" · {0} annulées pour hors-jeu (elles ne comptent pas : ce n'était pas ta passe)",
			"EL CAMPO — de dónde a dónde repartes": "LE TERRAIN — d'où et vers où tu distribues",


			"LA CANCHA — tu último pase de cada jugada": "LE TERRAIN — ta dernière passe de chaque action",
			"LA CANCHA — desde dónde tiraste": "LE TERRAIN — d'où tu as tiré",
			"POR QUÉ ESA NOTA": "POURQUOI CETTE NOTE",
			"LO QUE SUMÓ": "LES PLUS",
			"LO QUE RESTÓ": "LES MOINS",
			"Aún no le has dejado el balón a nadie. Cada pase que llegue a un compañero queda marcado aquí, con el viaje que hizo y en qué acabó la jugada.":
				"Tu n'as encore servi personne. Chaque passe qui atteint un coéquipier est marquée ici, avec le trajet qu'elle a fait et comment l'action s'est terminée.",
			"LARGO": "LONGUEUR",
			"tablaP": "P",
			"PASE CORTO": "PASSE COURTE",
			"PASE MEDIO": "PASSE MOYENNE",
			"PASE LARGO": "PASSE LONGUE",
			"Y TUS PASES": "ET TES PASSES",
			"Arriba se cambia a PASES: a dónde repartes, y cuántos de esos balones acaban en remate o en gol.":
				"En haut on passe à PASSES : où tu distribues, et combien de ces ballons finissent en tir ou en but.",
			"{0}: todavía sin marca.": "{0} : pas encore de record.",
			"T{0} · CEDIDO": "S{0} · PRET",
			"Mantenimiento: -{0} por partido": "Entretien : -{0} par match",
			"RONDA {0}": "RONDE {0}",
			"TU": "TOI",
			"EN RACHA": "EN FORME",
			"PJ": "M",
			"A": "PD",
			"SEMANA SIN PARTIDO": "SEMAINE SANS MATCH",
			"JORNADA": "JOURNEE",
			"Tu casillero · abre la TIENDA": "Ton casier · ouvre la BOUTIQUE",
			"Tu playera · cambia de uniforme": "Ton maillot · change de tenue",
			"ENERO": "JANVIER",
			"FEBRERO": "FEVRIER",
			"MARZO": "MARS",
			"ABRIL": "AVRIL",
			"MAYO": "MAI",
			"JUNIO": "JUIN",
			"JULIO": "JUILLET",
			"AGOSTO": "AOUT",
			"SEPTIEMBRE": "SEPTEMBRE",
			"OCTUBRE": "OCTOBRE",
			"NOVIEMBRE": "NOVEMBRE",
			"DICIEMBRE": "DECEMBRE",
			"diaLU": "LU",
			"diaMA": "MA",
			"diaMI": "ME",
			"diaJU": "JE",
			"diaVI": "VE",
			"diaSA": "SA",
			"diaDO": "DI",
			"DÍAS DE DESCANSO": "JOURS DE REPOS",
			"{0}d": "{0}j",
			"TU PAPEL": "TON ROLE",
			"lesionBAJA": "BLESSE",
			"lesionALTA": "APTE",
			"{0}D": "{0}J",
			"VER EN GOOGLE PLAY": "VOIR DANS GOOGLE PLAY",
			"LOGROS EN GOOGLE PLAY": "SUCCES DANS GOOGLE PLAY",
			"Arriba, tu catálogo completo. En Google Play, los que Google conoce: se mandan solos al desbloquearse y se ven en tu perfil de jugador.": "Ci-dessus, ton catalogue complet. Dans Google Play, ceux que Google connaît : ils sont envoyés automatiquement quand tu les débloques et apparaissent sur ton profil de joueur.",
			"Tu fachada {0} es de esta casa: la nueva luce la de fábrica.": "Ta façade {0} est celle de cette maison : la nouvelle garde celle d'origine.",
			"S{0}": "S{0}",
			"AYUDA": "AIDE",
			"tabla_ligaDG": "DB",
			"TÚ {0}": "TOI {0}",
			"{0} PTS · +{1} AL {2}": "{0} PTS · +{1} SUR LE {2}",
			"{0} PTS · -{1} DEL {2}": "{0} PTS · -{1} DU {2}",
			"{0} · {1} PTS": "{0} · {1} PTS",
			"COMPETICIÓN": "COMPETITION",
			"ZONAS": "ZONES",
			"NO LA JUEGAS": "TU N'Y JOUES PAS",
			"GRUPOS": "GROUPES",
			"EXENTO": "EXEMPTE",
			"POR DEFINIR": "A DEFINIR",
			"VIGENTE": "TENANT",
			"Pasan los {0} primeros de cada grupo y los {1} mejores terceros.": "Les {0} premiers de chaque groupe passent, plus les {1} meilleurs troisièmes.",
			"Pasan también los {0} mejores terceros.": "Les {0} meilleurs troisièmes passent aussi.",
			"{0} MEJORES": "{0} MEILLEURS",
			"VIVOS": "EN LICE",
			"cuadroGLOBAL": "CUMUL",
			"FALTAS A TU PALABRA": "TU TRAHIS TA PAROLE",
			"Dijiste que te quedabas, y te vas igual. Tu grada no lo olvida.": "Tu as dit que tu restais, et tu pars quand même. Tes supporters ne l'oublient pas.",
			"DT": "ENT",
			"DE {0}": "SUR {0}",
			"TU PAÍS": "TON PAYS",
			"TU EDAD": "TON AGE",
			"CON +1 DE MEDIA: {0}": "AVEC +1 DE NOTE : {0}",
			"TOP 10 DE {0}": "TOP 10 · {0}",
			"rankingEN EL MUNDO": "AU MONDE",
			"FILTRAR": "FILTRER",
			"{0} TÍTULOS · -{1} DEL {2}": "{0} TITRES · -{1} DU {2}",
			"{0} TÍTULOS · +{1} AL {2}": "{0} TITRES · +{1} SUR LE {2}",
			"carreraLIGAS": "CHAMPIONNATS",
			"carreraCOPAS": "COUPES",
			"tablaTOT": "TOT",
			"{0} PARA {1}": "{0} POUR {1}",
			"FUERA DEL TOP {0}": "HORS DU TOP {0}",
			"-{0} TÍTULOS": "-{0} TITRES",
			"PICO {0} · T{1}": "PIC {0} · S{1}",
			"RECORRIDO": "PARCOURS",
			"TEMPS.": "SAIS.",
			"ESTA TEMP.": "SAISON",
			"{0}/{1} BATIDOS": "{0}/{1} BATTUS",
			"MÁS CERCA": "PLUS PROCHE",
			"AÚN SIN MARCA": "AUCUN RECORD",
			"ambitoAMÉRICA": "AMERIQUE",
			"REQUISITOS": "CONDITIONS",
			"¿CÓMO SE CALCULA?": "COMMENT ÇA MARCHE ?",
			"-{0} PARA ENTRAR": "-{0} POUR ENTRER",
			"-{0} PARA SER TITULAR": "-{0} POUR ETRE TITULAIRE",
			"EN {0} TEMP.": "DANS {0} SAIS.",
			"CON {0} AÑOS": "A {0} ANS",
			"{0} TEMPORADAS · {1} TÍTULOS": "{0} SAISONS · {1} TITRES",
			"OFERTAS": "OFFRES",
			"VER CESIÓN": "VOIR LE PRET",
			"carreraGASTO": "DEPENSES",
			"SIN FICHAJES": "AUCUNE RECRUE",
			"EL MÁS CARO": "LE PLUS CHER",
			"{0} FICHAJES": "{0} RECRUES",
			"1 FICHAJE": "1 RECRUE",
			"TÍTULOS · -{0} DEL {1}": "TITRES · -{0} DU {1}",
			"POR DELANTE": "DEVANT TOI",
			"SELECCIONADOR": "SELECTIONNEUR",
			"-1 TÍTULO": "-1 TITRE",
			"1 TÍTULO": "1 TITRE",
			"RENOVAR": "PROLONGER",
			"CESIÓN": "PRET",
			"PEDIR": "DEMANDER",
			"RETIRAR": "RETIRER",
			"CLÁUSULAS": "CLAUSES",
			"CAMINO": "VOIE",
			"MUÉVEME": "BOUGE-MOI",
			"UNA LIGA": "UNE LIGUE",
			"UN CLUB": "UN CLUB",
			"BAJAR FICHA": "BAISSER SALAIRE",
			"SUBIR CLÁUSULA": "HAUSSER CLAUSE",
			"NO VENDERME": "NE PAS VENDRE",
			"{0} BLOQUEADAS": "{0} BLOQUEES",
			"C. LIGA": "C. LIGUE",
			"Patrocinador: {0}": "Sponsor : {0}",
			"{0} LIBRE": "{0} RESTANT",
			"VENTA": "VENTE",
			"COMPRA": "ACHAT",
			"Este año no cuentas: hay que jugar la temporada ENTERA en una Primera europea.": "Tu ne comptes pas cette année : il faut jouer TOUTE la saison dans une première division européenne.",
			"C. LIGAS": "C.LIGUES",
			"¡CAMPEÓN DE LA COPA DE LAS LIGAS!": "CHAMPION DE LA COUPE DES LIGUES !",
			"Eliminado de la Copa de las Ligas": "Eliminé de la Coupe des Ligues",
			"{0} SIN GUARDAR": "{0} EN ATTENTE",
			"PIERNAS": "JAMBES",
			"TODO AL TOPE": "TOUT AU MAX",
			"SALARIO": "SALAIRE",
			"ESTATUS": "STATUT",
			"EL CLUB DICE": "LE CLUB DIT",
			"PEDIR SALIDA": "DEMANDER A PARTIR",
			"HASTA T{0}": "JUSQU'A S{0}",
			"QUEDAN {0} TEMPORADAS": "ENCORE {0} SAISONS",
			"MANTÉN 1 S": "TIENS 1 S",
			"Tu temporada da para pedir mejora: siéntate con el club.": "Ta saison mérite mieux : va t'asseoir avec le club.",
			"El club está contento con lo firmado.": "Le club est content de ce qui a été signé.",
			"YA LO PEDISTE": "DEJA DEMANDE",
			"CONTESTA LO PENDIENTE": "REPONDS D'ABORD",
			"AÚN NO TE ESCUCHAN": "PAS ENCORE ECOUTE",
			"CUANDO ABRA EL MERCADO": "A L'OUVERTURE DU MERCATO",
			"PRÓXIMO CRUCE": "PROCHAIN MATCH",
			"TU TÉCNICO": "TON COACH",
			"GRUPOS {0}-{1}": "GROUPES {0}-{1}",
			"VER EL GOL": "VOIR BUT",
			"MANTEN PARA BORRAR": "MAINTIENS: EFFACER",
			"NO SE PUEDE LEER": "ILLISIBLE",
			"SIN GOLES TODAVIA": "AUCUN BUT",
			"MARCA, Y EN LA REPETICION PULSA": "BUT, PUIS AU RALENTI APPUIE",
			"LLENO · BORRA UNO PARA GUARDAR OTRO": "PLEIN · EFFACE-EN UN POUR EN GARDER",
			"TOCA UN GOL Y VELO. BORRAR SE MANTIENE.": "TOUCHE UN BUT. MAINTIENS: EFFACER.",
			"{0} M/S": "{0} M/S",
			"Hasta 30 goles por carrera. Se ven con el cielo y el viento de aquel día, en tu estadio de hoy.": "Jusqu'à 30 buts par carrière. Ils se revoient avec le ciel et le vent de ce jour-là, dans ton stade actuel.",
			"El archivo se dañó. Sólo queda borrarlo.": "Le fichier est endommagé. Il ne reste qu'à l'effacer.",
			"GALAS": "GALAS",
			"GANADOR": "LAUREAT",
			"La votación del año arranca con la primera jornada.": "Le vote de l'année démarre avec la première journée.",
			"ONCE IDEAL": "ONZE TYPE",
			"VER TODOS": "VOIR TOUT",
			"VOTACIÓN": "VOTE",
		},


	"shop": {

		"ROPA DE CALLE": "TENUE DE VILLE",
		"Toca una prenda para comprarla. Lo que compres te espera en ASPECTO.": "Touche une pièce pour l'acheter. Tes achats t'attendent dans APPARENCE.",

		"CAMILLA DE FISIOTERAPIA": "TABLE DE KINE",
		"PIZARRA TÁCTICA": "ARDOISE TACT.",
		"BICICLETA ESTÁTICA": "VELO D'INTERIEUR",
		"MURO DE RÉCORDS": "MUR DES RECORDS",
		"RINCÓN DE LECTURA": "COIN LECTURE",
		"MESA DE RECUERDOS": "TABLE SOUVENIRS",
		"Camilla y material de recuperación. Su sesión recupera energía, no cura lesiones.": "Table et matériel de récupération. Une séance rend de l'énergie, sans soigner les blessures.",
		"Pizarra móvil para preparar el próximo partido. El bono se activa al usarla.": "Tableau mobile pour préparer le prochain match. Son bonus s'active à l'utilisation.",
		"Cardio suave en casa; requiere estar sin lesión para pedalear.": "Cardio doux à domicile ; aucune blessure pour pouvoir pédaler.",
		"Tus goles, asistencias, títulos y mejores temporadas, con datos reales.": "Tes buts, passes, titres et meilleures saisons, avec tes vraies statistiques.",
		"Sillón, libro y luz cálida: lee para recuperar energía y ánimo.": "Fauteuil, livre et lumière chaude : lis pour retrouver énergie et moral.",
		"Cartas y recuerdos de tu carrera. Consulta los momentos guardados.": "Lettres et souvenirs de ta carrière. Consulte les moments enregistrés.",
		"SESIÓN DE FISIOTERAPIA": "SEANCE DE KINE",
		"PREPARAR EL PARTIDO": "PREPARER LE MATCH",
		"PEDALEAR SUAVE": "VELO DOUX",
		"LEER CON CALMA": "LIRE AU CALME",
		"Recupera hasta 12 de energía. No acorta las lesiones. Una acción semanal.": "Récupère jusqu'à 12 d'énergie. Ne réduit pas les blessures. Une action hebdomadaire.",
		"+3 puntos de precisión efectiva para el próximo partido. Una acción semanal.": "+3 points de précision effective au prochain match. Une action hebdomadaire.",
		"Hasta +5 de energía y +1 con el técnico, sin lesión. Una acción semanal.": "Jusqu'à +5 d'énergie et +1 avec le coach, sans blessure. Une action hebdomadaire.",
		"Hasta +3 de energía y +1 de ánimo. Una acción semanal.": "Jusqu'à +3 d'énergie et +1 de moral. Une action hebdomadaire.",
		"VER RÉCORDS": "RECORDS",
		"ABRIR RECUERDOS": "VOIR SOUVENIRS",
		"VER CONDICIÓN": "VOIR LA FORME",
		"de ánimo": "de moral",
		"PRECISIÓN +3 · PRÓXIMO PARTIDO": "PRECISION +3 · PROCHAIN MATCH",
		"Coloca este mueble para usarlo.": "Place ce meuble pour l'utiliser.",
		"Espera al alta médica para pedalear.": "Attends le feu vert médical pour pédaler.",
		"La preparación táctica ya está lista para el próximo partido.": "Ta préparation tactique est déjà prête pour le prochain match.",
		"Ahora mismo no necesitas esta sesión.": "Tu n'as pas besoin de cette séance pour le moment.",
		"Consultar no consume acciones ni cambia tus estadísticas.": "Consulter ne coûte aucune action et ne change pas tes statistiques.",
		"Aún no hay partidos registrados para este muro.": "Aucun match enregistré pour ce mur pour l'instant.",
		"Los recuerdos aparecerán cuando tu carrera deje momentos guardados.": "Les souvenirs apparaîtront quand ta carrière laissera des moments enregistrés.",
		"TU HISTORIA EMPIEZA AQUÍ": "TON HISTOIRE DEBUTE ICI",
		"RECUERDOS": "SOUVENIRS",
		"{0} TÍTULOS": "{0} TITRES",
		"{0} / {1}": "{0} / {1}",
		"GOLES CON TUS CLUBES": "BUTS AVEC TES CLUBS",
		"ASISTENCIAS CON TUS CLUBES": "PASSES AVEC TES CLUBS",
		"TU MEJOR TEMPORADA GOLEADORA": "TA MEILLEURE SAISON DE BUTS",
		"TU MEJOR TEMPORADA DE ASISTENCIAS": "TA MEILLEURE SAISON DE PASSES",
		"TU MEJOR MEDIA DE TEMPORADA": "TA MEILLEURE NOTE DE SAISON",
		"NOTA {0} · {1} PARTIDOS": "NOTE {0} · {1} MATCHS",
		"TÍTULOS GANADOS": "TITRES GAGNES",
		"TU DEBUT CON UN CLUB": "TON DEBUT EN CLUB",
		"TU DEBUT CON LA SELECCIÓN": "TON DEBUT EN SELECTION",
		"TU CESIÓN": "TON PRET",
		"CAMISETA INTERCAMBIADA": "MAILLOT ECHANGE",
		"BALÓN DEL PARTIDO": "BALLON DU MATCH",
		"RESULTADO {0}–{1}": "RESULTAT {0}–{1}",
		"Los grandes de Europa se fijan en ti.": "Les grands d'Europe te surveillent.",
		"Tienes con qué, pero te falta FAMA: haz ruido marcando.":
			"Tu as le niveau, mais il te manque la RENOMMEE : fais du bruit en marquant.",
		"Gustas, pero necesitas más NIVEL: al gimnasio.":
			"Tu plais, mais il te faut plus de NIVEAU : direction la salle.",
		"Te siguen, pero tu MEDIA no acompaña: hay que rendir.":
			"Ils te suivent, mais ta MOYENNE ne suit pas : il faut rendre.",
		"POT": "PUI",
		"PRE": "PRE",
		"EFE": "EFF",
		"ENERGIA": "ENERGIE",
		"RIESGO": "RISQUE",
		"SEMANAS BAJA": "SEMAINES ABSENT",
		"COMISION": "COMMISSION",
		"PRENSA": "PRESSE",
		"AFICIÓN": "SUPPORTERS",
		"AGENTE": "AGENT",
		"TÉCNICO": "ENTRAINEUR",
		"VESTUARIO": "VESTIAIRE",
		"ROTO": "BRISE",
		"FRÍO": "FROID",
		"BUENO": "BON",
		"INCONDICIONAL": "INCONDITIONNEL",
		"BARRIO 90": "QUARTIER 90",
		"Tu primer salto. Un poco de todo, a tu alcance.": "Ton premier cap. Un peu de tout, à ta portée.",
		"ACERO PRO": "ACIER PRO",
		"Hechas para durar. Rendimiento modesto, muchos partidos.": "Conçues pour durer. Des bonus modestes, beaucoup de matchs.",
		"ÓRBITA 10": "ORBITE 10",
		"Coloca y dibuja la curva. Menos fuerza, más intención.": "Place et enroule. Moins de force, plus de finesse.",
		"ECLIPSE X": "ECLIPSE X",
		"Oscuridad y neón. Potencia, puntería y una comba de élite.": "Ombre et néon. Puissance, précision et effet d’élite.",
		"NOVA PRISM": "NOVA PRISM",
		"Brillo de otro mundo. Cada disparo traza su propia curva.": "Un éclat venu d’ailleurs. Chaque tir dessine sa courbe.",
		"ZÉNIT SUPREMA": "ZENITH SUPREME",
		"La cima del juego. Fuerza, precisión y comba sin concesiones.": "Le sommet. Puissance, précision et effet sans compromis.",
		"+ {0} · DURAN {1} PARTIDOS": "+ {0} · DURENT {1} MATCHS",
		"Si ya las tienes, vuelven al 100% de vida.": "Si tu les as déjà, leur durée de vie revient à 100%.",
		"{0} están en tu ropero con el 100% de vida.": "{0} sont dans ton armoire avec 100% de durée de vie.",
		"BOTA DE CANTERA": "CRAMPONS DE BASE",
		"Las de siempre. Sin trucos.": "Les habituels. Sans artifice.",
		"TRUENO XT": "TONNERRE XT",
		"Pega más fuerte, pero cuesta domarla.": "Frappe plus fort, mais dure à dompter.",
		"BISTURÍ 09": "SCALPEL 09",
		"Para quien coloca en vez de reventar.":
			"Pour celui qui place au lieu de frapper fort.",
		"COMBA CLÁSICA": "COURBE CLASSIQUE",
		"Rosca de verdad. La falta es tuya.": "Un vrai effet. Le coup franc est à toi.",
		"CORONA DE ORO": "COURONNE D'OR",
		"Sin peros. Si puedes pagarla.": "Sans compromis. Si tu peux te la payer.",
		"BEBIDA ENERGÉTICA": "BOISSON ENERGISANTE",
		"+35 de energía. Ábrela entre semana o en el descanso.":
			"+35 d'énergie. Ouvre-la en semaine ou à la mi-temps.",
		"GEL ANTIINFLAMATORIO": "GEL ANTI-INFLAMMATOIRE",
		"Adelanta una semana tu recuperación.": "Avance ta guérison d'une semaine.",
		"SESIÓN DE VÍDEO": "SEANCE VIDEO",
		"+1 de forma. Estudias al rival.": "+1 de forme. Tu étudies l'adversaire.",
		"CÁMARA HIPERBÁRICA": "CHAMBRE HYPERBARE",
		"Borra cualquier lesión al instante y devuelve +20 de energía. El cuerpo sólo la aguanta una vez por temporada.":
			"Efface n'importe quelle blessure à l'instant et rend +20 d'énergie. Le corps ne la supporte qu'une fois par saison.",
		"CORTE DE AUTOR": "COUPE SIGNATURE",
		"Sales en las fotos. Barato y sin enemigos.":
			"Tu sors bien en photo. Pas cher, et sans faire d'ennemis.",
		"CENA CON EL VESTUARIO": "DINER AVEC LE VESTIAIRE",
		"La química se compra. Se puede repetir.":
			"L'alchimie s'achète. Tu peux recommencer.",

		"TU AGENTE": "TON AGENT",
		"EL DE SIEMPRE": "CELUI DE TOUJOURS",
		"Ahora te lleva: {0} · se queda el {1}% de lo que cobras": "Ton agent : {0} · prend {1}% de tes gains",
		"No hay nadie por encima. La agencia es tuya.": "Personne au-dessus. L'agence est à toi.",
		"VUELVE EN {0}": "REVIENT DANS {0}",
		"YA ESTE AÑO": "DEJA CETTE ANNEE",
		"COMISIÓN %": "COMMISSION %",
		"AGENTE CON OFICINA": "AGENT AVEC BUREAU",
		"Deja de atenderte desde el coche. Comisión del 7%.": "Fini les appels depuis sa voiture. Commission de 7%.",
		"AGENTE CON CARTERA": "AGENT AVEC PORTEFEUILLE",
		"Ya lleva a otros profesionales. Más clubes te miran, y cobra el 6%.": "Il suit d'autres pros. Plus de clubs te regardent, et il prend 6%.",
		"AGENCIA DE PRIMERA": "AGENCE DE PREMIER PLAN",
		"Un equipo detrás de tu nombre: ofertas de fuera y prensa a favor. El 5%.": "Une équipe derrière ton nom: offres de l'étranger et presse favorable. 5%.",
		"AGENTE DE ESTRELLAS": "AGENT DE STARS",
		"Sólo lleva a quince jugadores en el mundo y tú eres uno. El 3,5%.": "Il ne suit que quinze joueurs au monde et tu en fais partie. 3,5%.",
		"TU PROPIA AGENCIA": "TA PROPRE AGENCE",
		"El despacho es tuyo y él trabaja para ti. La comisión baja al 2,5%.": "Le cabinet est à toi et il travaille pour toi. La commission tombe à 2,5%.",
		"La grada corea tu nombre. Las marcas lo notan. Una vez por temporada.": "Les tribunes scandent ton nom. Les marques le remarquent. Une fois par saison.",

		"CHARLA CON EL PSICÓLOGO": "SEANCE CHEZ LE PSY",
		"Tu próximo partido no te bajará la forma, juegues como juegues.": "Ton prochain match ne fera pas baisser ta forme, quel que soit ton niveau.",
		"BOTELLÍN ISOTÓNICO": "BOISSON ISOTONIQUE",
		"+10 de energía, y tus botas no se gastan en el próximo partido.": "+10 d'énergie, et tes crampons ne s'usent pas au prochain match.",

		"CENA CON EL CAPITÁN": "REPAS AVEC LE CAPITAINE",
		"Invitas al vestuario y pagas tú. +7 con el equipo. No se puede repetir en 10 partidos.":
			"Tu invites le vestiaire et tu paies. +7 avec l'équipe. Impossible à répéter avant 10 matchs.",
		"REUNIÓN CON EL TÉCNICO": "PARLER AU COACH",
		"Le pides explicaciones y sales reforzado. +6 con el técnico — pero si fallas en el próximo partido, se lo cobra el doble.":
			"Tu demandes des comptes et tu en sors grandi. +6 avec le coach — mais si tu rates le prochain match, il te le fait payer double.",
		"INFILTRACIÓN": "INFILTRATION",
		"Juegas el próximo partido aunque estés lesionado. Al acabar, tu baja crece 2 semanas.":
			"Tu joues le prochain match même blessé. Ensuite, ton arrêt augmente de 2 semaines.",
		"SIN LESIÓN": "PAS BLESSE",
		"NO DISPONIBLE": "INDISPONIBLE",
		"EN {0} {1}": "DANS {0} {1}",
		"JUGAR INFILTRADO": "JOUER INFILTRE",
		"LESIONADO · TU BAJA CRECERÁ {0} SEMANAS": "BLESSE · TON ARRET AUGMENTE DE {0} SEMAINES",
		"YA PUESTO": "PORTE",
		"Te pones el atuendo {0} en ASPECTO.": "Tu enfiles la tenue {0} dans APPARENCE.",
		"Ya vistes el atuendo {0} en ASPECTO.": "Tu portes la tenue {0} dans APPARENCE.",

		"Atuendo": "Tenue",
		"DE ORO": "EN OR",
		"DEL BARRIO": "QUARTIER",
		"DE PISTA": "CIRCUIT",
		"DE OFICINA": "BUREAU",
		"RELOJ DE ORO": "MONTRE EN OR",
		"Todos lo ven. El técnico también.": "Tout le monde la voit. L'entraîneur aussi.",
		"DONACIÓN AL BARRIO": "DON AU QUARTIER",
		"La grada corea tu nombre. Las marcas lo notan.":
			"La tribune scande ton nom. Les marques le remarquent.",
		"GIMNASIO EN CASA": "SALLE DE MUSCU",
		"Cuidas el cuerpo: recuperas algo más tras cada partido.":
			"Tu prends soin de ton corps : tu récupères un peu plus après chaque match.",
		"DEPORTIVO": "SPORTIVE",
		"MUSCLE CAR": "MUSCLE CAR",
		"COMPACTO URBANO": "COMPACTE URBAINE",
		"SEDÁN CLÁSICO": "BERLINE CLASSIQUE",
		"FAMILIAR VIAJERO": "BREAK VOYAGEUR",
		"PICKUP DE CAMPO": "PICKUP RURAL",
		"Pequeño, amarillo y práctico. Tu primer coche sin presumir.": "Petite, jaune et pratique. Ta première voiture, sans frime.",
		"Cuatro puertas, azul discreto y espacio para el día a día.": "Quatre portes, un bleu discret et de la place au quotidien.",
		"Carrocería larga, barras de techo y maletero para todo el equipo.": "Une longue carrosserie, des barres de toit et un coffre pour tout le matériel.",
		"Robusta, sencilla y con caja abierta. Para salir de la ciudad.": "Robuste, simple et à benne ouverte. Pour quitter la ville.",
		"COCHERA DE COLECCIÓN": "GARAGE DE COLLECTION",
		"Ocho plazas en una ampliación a la derecha de casa. Terreno incluido y coches colocados automáticamente. Sin mantenimiento.": "Huit places dans une extension à droite de la maison. Terrain inclus et voitures placées automatiquement. Sans entretien.",
		"ESTACIONAR LOS CUATRO": "GARER LES QUATRE",
		"Cuatro plazas, portón abierto y paso a casa. Sin mantenimiento.": "Quatre places, porte ouverte et accès à la maison. Sans entretien.",
		"Primero coloca la cochera.": "Place d’abord le garage.",
		"Necesitas tener los cuatro coches.": "Tu dois posséder les quatre voitures.",
		"Apártate de las plazas antes de estacionar.": "Éloigne-toi des places avant de garer les voitures.",
		"Hay una plaza bloqueada. No se movió ningún coche.": "Une place est bloquée. Aucune voiture n’a été déplacée.",
		"La cochera necesita un espacio libre de paredes.": "Le garage nécessite un espace sans murs.",
		"Tu coche de colección. Colócalo, gíralo o guárdalo en casa.": "Ta voiture de collection. Place-la, tourne-la ou range-la chez toi.",
		"Tu reloj de oro, expuesto en casa.": "Ta montre en or, exposée chez toi.",
		"GRAN TURISMO": "GRAND TOURISME",
		"HIPERDEPORTIVO": "HYPERCAR",
		"Franjas negras y cuatro faros. Te oyen antes de verte.": "Bandes noires et quatre phares. On t’entend avant de te voir.",
		"Capó largo y verde de lujo. Elegancia que sale en todas las fotos.": "Un long capot et un vert luxueux. L’élégance sur toutes les photos.",
		"Plata, carbono y alerón. Una pieza de colección que acapara portadas.": "Argent, carbone et aileron. Une voiture de collection qui fait la une.",
		"Llegas tarde a entrenar, pero llegas.":
			"Tu arrives en retard à l'entraînement, mais tu arrives.",
		"AGENTE DE PRIMERA": "AGENT DE PREMIER PLAN",
		"Más ofertas sobre la mesa y mejor regateo.":
			"Plus d'offres sur la table et un meilleur marchandage.",
		"CASA CON JARDÍN": "MAISON AVEC JARDIN",
		"Descansas de verdad: recuperas bastante más tras cada partido.":
			"Tu te reposes vraiment : tu récupères bien plus après chaque match.",
		"DEPARTAMENTO": "STUDIO",
		"Un cuarto, una ventana y el sitio justo para la primera copa.":
			"Une pièce, une fenêtre et juste la place pour ta première coupe.",
		"CASA MODERNA": "MAISON MODERNE",
		"Sala de trofeos propia y aún mejor descanso entre partidos.":
			"Sa propre salle des trophées et un repos encore meilleur entre les matchs.",
		"Galería, garage y tu cancha tras la puerta del fondo.":
			"Une galerie, un garage et ton terrain derrière la porte du fond.",
		"CAMPO DE ENTRENAMIENTO": "TERRAIN D'ENTRAINEMENT",
		"TU FRASE ESTÁ EN SU GRADA": "TA PHRASE EST DANS LEUR TRIBUNE",
		"TU CUMPLEAÑOS": "TON ANNIVERSAIRE",
		"SIN PONER": "NON RENSEIGNE",
		"¿QUÉ MES?": "QUEL MOIS ?",
		"¿QUÉ DÍA DE {0}?": "QUEL JOUR DE {0} ?",
		"HOY NO SE ENTRENA": "JOUR DE RELACHE",
		"FELIZ CUMPLEAÑOS": "JOYEUX ANNIVERSAIRE",
		"Te esperaban dentro. Alguien del vestuario se acordó, y eso en un vestuario no es poco.": "Ils t'attendaient à l'intérieur. Quelqu'un du vestiaire s'en est souvenu, et dans un vestiaire ça compte.",
		"ENE": "JAN",
		"FEB": "FEV",
		"MAR": "MAR",
		"ABR": "AVR",
		"MAY": "MAI",
		"JUN": "JUN",
		"JUL": "JUL",
		"AGO": "AOU",
		"SEP": "SEP",
		"OCT": "OCT",
		"NOV": "NOV",
		"DIC": "DEC",
		"EL MICRÓFONO ABIERTO": "LE MICRO OUVERT",
		"Semana de derbi y el periodista deja el micro abierto: '¿os ven por encima de {0}?'. Sabes que lo que digas va a estar en su grada el domingo.": "Semaine de derby et le journaliste laisse le micro ouvert : « vous vous voyez au-dessus de {0} ? ». Ce que tu diras sera dans leur tribune dimanche.",
		"MEDIR LAS PALABRAS": "PESER TES MOTS",
		"SOLTAR LA BRAVATA": "LACHER LA PHRASE",

		"LLEGAN SIN SU ESTRELLA": "SANS LEUR STAR",
		"Tu próximo rival llega sin uno de sus mejores jugadores, que está lesionado. En la rueda de prensa te preguntan si es el partido para aprovecharlo.": "Ton prochain adversaire arrive sans l'un de ses meilleurs joueurs, qui est blessé. En conférence de presse, on te demande si c'est le match à ne pas laisser passer.",
		"RESPETAR AL RIVAL": "RESPECT AU RIVAL",
		"HAY QUE APROVECHARLO": "IL FAUT EN PROFITER",

		"VIENEN LANZADOS": "ILS SONT LANCES",
		"{0} llega con cinco victorias seguidas en liga. En la rueda de prensa te preguntan si os dan miedo.": "{0} arrive avec cinq victoires de suite en championnat. En conférence de presse, on te demande s'ils vous font peur.",
		"RESPETO, NO MIEDO": "DU RESPECT, PAS DE PEUR",
		"LA RACHA SE ACABA AQUÍ": "LA SERIE S'ARRETE ICI",
		"UN GRANDE HERIDO": "UN GRAND BLESSE",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Te preguntan si es el mejor momento para cruzártelos.": "{0} n'a plus gagné depuis cinq journées et ses tribunes réclament des têtes. On te demande si c'est le meilleur moment pour les affronter.",
		"UN GRANDE SIEMPRE ES UN GRANDE": "UN GRAND RESTE UN GRAND",
		"HAY QUE REMATARLOS": "IL FAUT LES ACHEVER",
		"BANQUILLO NUEVO ENFRENTE": "NOUVEAU BANC EN FACE",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y la prensa quiere saber si tú sí.": "{0} a un nouvel entraîneur cette saison : {1}. Personne ne sait encore comment ils jouent, et la presse veut savoir si toi, tu le sais.",
		"ESTUDIARLO CON EL MÍSTER": "L'ETUDIER AVEC LE COACH",
		"QUE SE PREOCUPE ÉL": "C'EST SON PROBLEME",
		"TU ANTIGUO TÉCNICO": "TON ANCIEN ENTRAINEUR",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Los periodistas buscan la foto del reencuentro.": "{0}, l'entraîneur qui t'a eu sous ses ordres, est maintenant sur le banc de {1}. Les journalistes veulent la photo des retrouvailles.",
		"UN ABRAZO ANTES DEL PARTIDO": "UNE ACCOLADE AVANT LE MATCH",
		"HOY ES UN RIVAL MÁS": "AUJOURD'HUI, C'EST UN RIVAL",
		"SU GRAN FICHAJE": "SA GROSSE RECRUE",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Te preguntan si el duelo es entre vosotros dos.": "{1} a recruté {0} cette saison, et il est déjà parmi les meilleurs de son onze. On te demande si c'est un duel entre vous deux.",
		"ES UN PARTIDO DE EQUIPOS": "C'EST UN MATCH D'EQUIPES",
		"AQUÍ LE ESPERO": "QU'IL VIENNE",
		"CAMPEÓN EN CASA": "CHAMPION AU PAYS",
		"En tu país se ha coronado {0}, y la prensa de allí te pregunta si algún día te verán jugar en casa.": "Dans ton pays, {0} a été sacré, et la presse de là-bas te demande si on te verra un jour jouer à la maison.",
		"ALGÚN DÍA, QUIÉN SABE": "UN JOUR, QUI SAIT",
		"AQUÍ ESTOY A GUSTO": "JE SUIS BIEN ICI",
		"TE PIDEN QUE LO ACLARES": "ON TE DEMANDE DE CLARIFIER",
		"Tu frase lleva toda la semana en la portada y en la grada de {0}. El club te pregunta si quieres suavizarla antes del domingo.": "Ta phrase fait la une et traîne dans la tribune de {0} depuis une semaine. Le club te demande si tu veux l'adoucir avant dimanche.",
		"SOSTENERLA": "L'ASSUMER",
		"SUAVIZARLA": "L'ADOUCIR",
		"UN GOL EN DOS JORNADAS": "UN BUT EN DEUX JOURNEES",
		"Te llama al despacho y no se anda con rodeos: si no marcas en las dos próximas jornadas, te sientas.": "Il te convoque dans son bureau et ne prend pas de gants : si tu ne marques pas lors des deux prochaines journées, tu files sur le banc.",
		"AGACHAR LA CABEZA": "BAISSER LA TETE",
		"DECIRLE LO QUE PIENSAS": "LUI DIRE CE QUE TU PENSES",
		"LO MARCASTE": "TU L'AS MARQUE",
		"Marcaste dentro del plazo. En el pasillo no te dijo nada, pero el lunes tu nombre volvió a la pizarra del once.": "Tu as marqué dans les temps. Dans le couloir il n'a rien dit, mais lundi ton nom était de retour sur le tableau du onze.",
		"SE ACABÓ EL PLAZO": "LE DELAI EST ECOULE",
		"Dos jornadas, ningún gol. No hizo falta que te lo dijera: el once del domingo ya no te lleva.": "Deux journées, aucun but. Il n'a pas eu besoin de te le dire : tu n'es plus dans le onze de dimanche.",
		"EL CAPITÁN TE PARA": "LE CAPITAINE T'ARRETE",
		"{0} te espera en la puerta del vestuario. No levanta la voz: te dice que el equipo lleva semanas jugando para ti y que eso se acaba hoy.": "{0} t'attend à la porte du vestiaire. Il ne hausse pas la voix : il te dit que l'équipe joue pour toi depuis des semaines, et que ça s'arrête aujourd'hui.",
		"CONTESTARLE": "LUI REPONDRE",
		"TE ESPERAN EN EL TÚNEL": "ON T'ATTEND DANS LE TUNNEL",
		"Un crío con tu nombre en la espalda lleva media hora esperando en la boca del túnel. Su padre le dice que no molestes, que ya vas tarde.": "Un gamin avec ton nom dans le dos attend depuis une demi-heure à l'entrée du tunnel. Son père lui dit de ne pas te déranger, que tu es déjà en retard.",
		"PARARTE CON ÉL": "T'ARRETER POUR LUI",
		"SALUDAR Y SEGUIR": "SALUER ET CONTINUER",
		"TU CASILLERO NO ESTÁ COMO LO DEJASTE": "TON CASIER N'EST PLUS COMME TU L'AS LAISSE",
		"Llegas al vestuario y tu hueco está lleno de espuma hasta arriba. Nadie te mira, pero nadie está haciendo nada tampoco.": "Tu arrives au vestiaire et ta place est remplie de mousse jusqu'en haut. Personne ne te regarde, mais personne ne fait rien non plus.",
		"SEGUIRLES EL JUEGO": "ENTRER DANS LEUR JEU",
		"LIMPIAR EN SILENCIO": "NETTOYER EN SILENCE",
		"TE PARA EN LA BANDA": "IL T'ARRETE SUR LA TOUCHE",
		"Te sustituye, y en vez de darte la mano y mirar al campo te para, te dice algo al oído y te abraza hasta que la grada se levanta.": "Il te remplace et, au lieu de te serrer la main et de regarder le terrain, il t'arrête, te glisse un mot à l'oreille et te serre jusqu'à ce que la tribune se lève.",
		"ESCUCHARLE": "L'ECOUTER",
		"IRTE AL BANQUILLO": "ALLER AU BANC",
		"EL ONCE YA ESTÁ DIBUJADO": "LE ONZE EST DEJA AU TABLEAU",
		"Entras al vestuario antes que nadie y la pizarra ya tiene el once del domingo. Lo lees dos veces: tu nombre no está en ninguna de las dos.": "Tu arrives au vestiaire avant tout le monde et le onze de dimanche est déjà au tableau. Tu le lis deux fois : ton nom n'y est ni l'une ni l'autre.",
		"BORRARLA": "L'EFFACER",
		"AQUÍ NO TE OLVIDAN": "ICI, ON NE T'OUBLIE PAS",

		"EX CLUB · TITULAR · ~{0} MIN": "EX-CLUB · TITULAIRE · ~{0} MIN",
		"EX CLUB · DESDE LA BANCA · ~{0} MIN": "EX-CLUB · SUR LE BANC · ~{0} MIN",
		"SU GRADA NO OLVIDA TU TRASPASO": "ILS N'OUBLIENT PAS TA VENTE",
		"SU GRADA RECUERDA TU CESIÓN": "ILS SE RAPPELLENT TON PRET",
		"SU GRADA NI SE INMUTA": "ILS S'EN FICHENT",
		"TU EX CLUB, DE VISITA": "TON EX-CLUB EN VISITE",
		"TU EX CLUB, ENFRENTE": "TON EX-CLUB EN FACE",
		"{0} · MÁRCALE: HAY PRIMA": "{0} · MARQUE-LUI : PRIME",
		"GOL AL EX CLUB": "BUT A L'EX-CLUB",
		"TRAIDOR": "TRAITRE",
		"BENGALA EN EL CÉSPED": "FUMIGENE SUR LA PELOUSE",
		"SE PELEAN EN TU GRADA": "ÇA SE BAT DANS TA TRIBUNE",
		"CANCHA DE {0}": "TERRAIN DE {0}",
		"VISITAR MI CASA": "VISITER MA MAISON",
		"SALIR DE CASA": "QUITTER LA MAISON",
		"SEGUNDO PISO": "DEUXIEME ETAGE",
		"TERCER PISO": "TROISIEME ETAGE",
		"Una planta más. Se levanta sobre lo que ya cerraste.": "Un étage de plus. Il s'élève sur ce que tu as déjà fermé.",
		"La última planta, y la que se ve desde la calle.": "Le dernier étage, celui qu'on voit depuis la rue.",
		"PRIMERO EL SEGUNDO PISO": "D'ABORD LE DEUXIEME ETAGE",
		"NO HAY NADA CERRADO DEBAJO": "RIEN DE FERME EN DESSOUS",
		"ADICIONES": "AJOUTS",
		"ACABADOS": "FINITIONS",
		"MATERIAL DE ESTA PARED": "MATIERE DE CE MUR",
		"EL DE LA CASA": "CELLE DE LA MAISON",
		"PISO": "SOL",
		"PARED": "MUR",
		"El suelo y la pared, a tu gusto. Se compran sueltos y se quedan: puedes cambiarlos cuando quieras.":
			"Le sol et le mur, à ton goût. Achetés séparément et gardés pour toujours : change-les quand tu veux.",
		"Instaladas: {0} de {1}.": "Installés : {0} sur {1}.",
		"Muebles, mejoras y mascotas para tu casa. Se compran una vez y las colocas donde quieras desde VISITAR.": "Meubles, améliorations et animaux pour ta maison. Achetés une fois, tu les places où tu veux depuis VISITER.",
		"TIENES {0}": "TU EN AS {0}",
		"POR PARTIDO": "PAR MATCH",
		"TE CONVIENE": "CA VAUT LE COUP",
		"AL ALCANCE": "ABORDABLE",
		"COLOCAR AHORA": "PLACER MAINTENANT",
		"Compraste {0}. Está en tus cajas.": "Tu as acheté {0}. C'est dans tes cartons.",
		"Así quedaría tu casa.": "Voilà à quoi ressemblerait ta maison.",
		"Nada al alcance en este cajón.": "Rien d'abordable dans ce tiroir.",
		"{0} x {0} m": "{0} x {0} m",
		"OTRA MÁS": "UNE DE PLUS",
		"OTRA MÁS · {0}": "UNE DE PLUS · {0}",
		"Se compran en MI JUGADOR ▸ CASA.": "Ils s'achètent dans MON JOUEUR ▸ MAISON.",
		"TU CASA se reinicia a 0: se vende y te devuelven el 80% de lo invertido.":
			"TA MAISON repart à zéro : elle est vendue et on te rend 80% de ce que tu as investi.",
		"INSTALADO": "INSTALLE",
		"INSTALAR · {0}": "INSTALLER · {0}",
		"Abre: {0}.": "Débloque : {0}.",
		"Si cambias de club la vendes y empiezas de cero: te devuelven el 80% de lo invertido.":
			"Si tu changes de club, tu la vends et tu repars de zéro : on te rend 80% de ce que tu as investi.",
		"Si cambias de club empiezas de cero: la casa se queda, y te devuelven el 80% de lo invertido.":
			"Si tu changes de club, tu repars de zéro : la maison reste, et on te rend 80% de ce que tu as investi.",
		"fuera de la cuadrícula": "hors de la grille",
		"se sale del suelo": "sort du sol",
		"tapa la puerta": "bloque la porte",
		"sin sitio para usarlo": "pas de place pour l'utiliser",
		"tiene que ir pegado a una pared": "doit être collé à un mur",
		"no puede mirar a la pared": "ne peut pas faire face au mur",
		"a la intemperie no se cuelga nada": "rien ne s'accroche dehors",
		"el helipuerto va en el jardín, sobre el pasto": "l'héliport va dans le jardin, sur l'herbe",
		"el helipuerto pide cielo abierto: ni una pared alrededor": "l'héliport exige le ciel ouvert : aucun mur autour",
		"TERRENO": "TERRAIN",
		"La casa es tuya: te la llevas contigo aunque cambies de club.":
			"La maison est à toi : tu l'emportes même si tu changes de club.",
		"Suelo nuevo pegado a tu casa: pártelo con paredes y amuéblalo a tu gusto en el modo edición.":
			"Un nouveau sol collé à ta maison : divise-le avec des murs et meuble-le à ta guise en mode édition.",
		"TERRENO ESTE": "TERRAIN EST",
		"TERRENO DEL FONDO": "TERRAIN DU FOND",
		"TERRENO OESTE": "TERRAIN OUEST",
		"ALA NORTE": "AILE NORD",
		"TERRENO DEL GARAGE": "TERRAIN DU GARAGE",
		"Suelo nuevo pegado a la sala. Tuyo para lo que quieras.":
			"Un nouveau sol collé au salon. A toi pour en faire ce que tu veux.",
		"El fondo del edificio, ganado al patio de luces.":
			"Le fond de l'immeuble, gagné sur la cour intérieure.",
		"Suelo nuevo junto a la recámara.":
			"Un nouveau sol à côté de la chambre.",
		"El fondo del patio, allanado y tuyo.":
			"Le fond de la cour, aplani et à toi.",
		"Suelo nuevo sobre el gimnasio, con paso a la sala.":
			"Un nouveau sol au-dessus de la salle de sport, avec un accès au salon.",
		"Del jardín a la sala de premios, todo tuyo.":
			"Du jardin à la salle des trophées, tout est à toi.",
		"Un ala entera tras el salón, pegada a la suite.":
			"Toute une aile derrière le salon, collée à la suite.",
		"El costado del garage, listo para lo que sea.":
			"Le côté du garage, prêt pour n'importe quoi.",
		"AMPLIAR · {0}": "AGRANDIR · {0}",
		"YA ES TUYO": "DEJA A TOI",
		"VENTANA": "FENETRE",
		"VENTANA NUEVA": "NOUVELLE FENETRE",
		"Una ventana más, en el muro que tú elijas.":
			"Une fenêtre de plus, sur le mur que tu choisis.",
		"Luz de verdad en el muro que tú elijas.":
			"De la vraie lumière sur le mur que tu choisis.",

		"VENTANAL": "BAIE VITREE",
		"OJO DE BUEY": "HUBLOT",
		"Del suelo al techo: el muro entero se vuelve luz.":
			"Du sol au plafond : tout le mur devient lumière.",
		"Un redondel alto, para el rincón que pide poco.":
			"Un petit rond en hauteur, pour le coin qui demande peu.",
		"~{0} partidos de sueldo": "~{0} matchs de salaire",
		"menos de un partido de sueldo": "moins d'un match de salaire",
		"TE CONVIENE: llegas justo de energía":
			"CA VAUT LE COUP : tu manques d'énergie",
		"TE CONVIENE: el vestuario anda frío":
			"CA VAUT LE COUP : le vestiaire est froid",
		"TE CONVIENE: la afición anda fría": "CA VAUT LE COUP : les supporters sont froids",
		"TE CONVIENE: la prensa no habla de ti":
			"CA VAUT LE COUP : la presse ne parle pas de toi",
		"TE CONVIENE: el técnico no te ve":
			"CA VAUT LE COUP : l'entraîneur ne te voit pas",
		"TE CONVIENE: tu agente no se mueve":
			"CA VAUT LE COUP : ton agent ne bouge pas",
		"VER": "VOIR",
		"AQUI VA: {0}": "VA ICI : {0}",
		"REPISA DE PARED": "ETAGERE MURALE",
		"Una balda más para tus trofeos, donde tú digas.":
			"Une étagère de plus pour tes trophées, où tu veux.",
		"MASCOTA": "ANIMAL",
		"PERRO": "CHIEN",
		"GATO": "CHAT",
		"Un perro que te espera y te sigue por los cuartos.":
			"Un chien qui t'attend et te suit de pièce en pièce.",
		"Un gato que pasea a lo suyo... y a veces te sigue.":
			"Un chat qui se promène à sa guise... et te suit parfois.",
		"YA TIENES {0}": "TU AS DEJA UN {0}",
		"TECNICO": "ENTRAINEUR",
		"AFICION": "SUPPORTERS",
		"TU CASA": "TA MAISON",
		"{0} de {1} adiciones": "{0} sur {1} ajouts",
		"PATRIMONIO": "PATRIMOINE",
		"La mejor casa de tu carrera: {0}.": "La meilleure maison de ta carrière : {0}.",
		"Se quedó atrás con un traspaso.": "Laissée derrière lors d'un transfert.",
		"RECIBIR VISITA": "RECEVOIR DU MONDE",
		"ESTILO NORDICO": "STYLE NORDIQUE",
		"Madera clara y paredes de leche: la casa respira.":
			"Bois clair et murs blanc lait : la maison respire.",
		"ESTILO NOCTURNO": "STYLE NOCTURNE",
		"Grafito, humo y madera oscura. Serio como un 0-0 fuera.":
			"Graphite, fumée et bois sombre. Sérieux comme un 0-0 à l'extérieur.",
		"ESTILO DEL CLUB": "STYLE DU CLUB",
		"Telas y detalles con los colores de tu escudo.":
			"Tissus et détails aux couleurs de ton blason.",
		"MUDANZA": "DEMENAGEMENT",
		"LAS LLAVES SON TUYAS": "LES CLES SONT A TOI",
		"EL SOLAR CRECE": "ESPACE EN PLUS",
		"EL DIA DESPUES": "LE LENDEMAIN",
		"HOY MEJOR NO SALIR": "RESTE CHEZ TOI",
		"EL MARCADOR": "LE SCORE",
		"Mañana en el barrio no se hablará de otra cosa.":
			"Demain, dans le quartier, on ne parlera que de ça.",
		"Esa bandera la ataron a tu reja de madrugada.":
			"Ce drapeau, ils l'ont attaché à ta grille au petit matin.",
		"LO QUE COSTO": "LA FACTURE",
		"Tu agente te esperaba: hay ofertas sobre la mesa.":
			"Ton agent t'attendait : il y a des offres sur la table.",
		"Un compañero vino a revivir la goleada.":
			"Un coéquipier est venu revivre le carton.",
		"Un compañero pasó a saludar.": "Un coéquipier est passé dire bonjour.",
		"{0} vino a revivir la goleada.": "{0} est venu revivre le carton.",
		"{0} pasó a saludar.": "{0} est passé dire bonjour.",
		"{0} se queda hasta tarde. El vestuario se entera de cómo vives.":
			"{0} reste tard. Le vestiaire apprend comment tu vis.",
		"YA RECIBISTE ESTA SEMANA": "DEJA RECU CETTE SEMAINE",
		"¿A QUIÉN RECIBES?": "QUI REÇOIS-TU ?",
		"Tu casa de hoy rinde {0} de hospitalidad.":
			"Ta maison d'aujourd'hui vaut {0} d'hospitalité.",
		"HOY NO": "PAS AUJOURD'HUI",
		"A UN COMPAÑERO": "UN COEQUIPIER",
		"AL TÉCNICO": "L'ENTRAINEUR",
		"A TU AGENTE": "TON AGENT",
		"Se queda hasta tarde. El vestuario se entera de cómo vives.":
			"Il reste tard. Le vestiaire apprend comment tu vis.",
		"Café, vídeo y charla larga. Te ve como alguien serio.":
			"Café, vidéo et longue discussion. Il te voit comme quelqu'un de sérieux.",
		"Negocio en la sala de tu casa: aquí las cifras suenan mejor.":
			"Affaires dans le salon de ta maison : ici, les chiffres sonnent mieux.",
		"ESTA SEMANA, EN CASA": "CETTE SEMAINE, A LA MAISON",
		"Te quedan {0} de {1} acciones.": "Il te reste {0} action(s) sur {1}.",
		"ya, esta semana": "déjà fait cette semaine",
		"YA LO HICISTE ESTA SEMANA": "DEJA FAIT CETTE SEMAINE",
		"NO TE QUEDA TIEMPO ESTA SEMANA": "PLUS DE TEMPS CETTE SEMAINE",
		"de energía": "d'énergie",
		"DORMIR DE VERDAD": "VRAIMENT DORMIR",
		"Ocho horas seguidas y el cuerpo lo agradece.":
			"Huit heures d'affilée et le corps dit merci.",
		"COMER BIEN": "BIEN MANGER",
		"Cocinas tú, y comes lo que te toca comer.":
			"Tu cuisines toi-même, et tu manges ce qu'il faut.",
		"ESTUDIAR AL RIVAL": "ETUDIER L'ADVERSAIRE",
		"Te tragas el partido del rival con libreta.":
			"Tu avales le match de l'adversaire, carnet en main.",
		"NADAR": "NAGER",
		"Largos suaves: descarga las piernas sin cargarlas.":
			"Des longueurs tranquilles : ça décharge les jambes sans les charger.",
		"INVITAR AL VESTUARIO": "INVITER LE VESTIAIRE",
		"Caen dos compañeros y se hace de noche jugando.":
			"Deux coéquipiers débarquent et la nuit tombe en jouant.",
		"SALIR A RODAR": "SORTIR ROULER",
		"Estrenas: {0}.": "Tu inaugures : {0}.",
		"JUGAR AL SNAKE": "JOUER AU SNAKE",
		"SNAKE": "SNAKE",
		"DESLIZA PARA GIRAR": "GLISSE POUR TOURNER",
		"TOCA PARA OTRA": "TOUCHE POUR REJOUER",
		"SE ACABO · {0}": "TERMINE · {0}",
		"¡RECORD! · {0}": "RECORD ! · {0}",
		"PUNTOS {0}   ·   RECORD {1}": "POINTS {0}   ·   RECORD {1}",
		"AL VESTUARIO ENTERO": "TOUT LE VESTIAIRE",
		"Veinticinco tíos en tu casa hasta la madrugada. La química se cocina.":
			"Vingt-cinq gars chez toi jusqu'à l'aube. L'alchimie se cuisine.",
		"PIDE {0}": "DEMANDE {0}",
		"Necesitas {0} en tu casa.": "Il te faut {0} chez toi.",
		"LEVANTAR PESAS": "FAIRE DE LA MUSCU",
		"Una hora seria de hierro. El técnico se entera.":
			"Une heure sérieuse de fonte. L'entraineur le remarque.",
		"CORRER EN LA CINTA": "COURIR SUR LE TAPIS",
		"Fondo tranquilo: llegas al domingo con otra gasolina.":
			"Course tranquille : tu arrives dimanche avec plus d'essence.",
		"Una vuelta sin rumbo. La gente te saluda.":
			"Un tour sans but précis. Les gens te saluent.",
		"JUGAR CON TU MASCOTA": "JOUER AVEC TON ANIMAL",
		"Media hora de correr tras algo que no cuenta.":
			"Une demi-heure à courir après quelque chose qui ne compte pas.",
		"PARED DE MOMENTOS": "MUR DE SOUVENIRS",
		"Tus récords, enmarcados donde se vean.":
			"Tes records, encadrés bien en vue.",
		"MAQUETA DEL ESTADIO": "MAQUETTE DU STADE",
		"Tu estadio en miniatura, con los colores de tu club.":
			"Ton stade en miniature, aux couleurs de ton club.",
		"ARCADE RETRO": "BORNE RETRO",
		"Partidas viejas para despejar la cabeza. El vestuario pide turno.":
			"De vieux jeux pour se vider la tête. Le vestiaire fait la queue.",
		"PISCINA": "PISCINE",
		"Largos suaves al día siguiente: las piernas lo agradecen.":
			"Des longueurs tranquilles le lendemain : les jambes disent merci.",
		"MOTO DE COLECCIÓN": "MOTO DE COLLECTION",
		"El garage por fin parece garage.":
			"Le garage ressemble enfin à un garage.",
		"MAQUETA DE TU ESTADIO": "MAQUETTE DE TON STADE",
		"ARCADE": "ARCADE",
		"MOTO": "MOTO",
		"ESTUDIO DE VIDEO": "SALLE VIDEO",
		"Estudias al rival en tu sala. El técnico lo agradece.":
			"Tu étudies l'adversaire dans ton salon. L'entraineur apprécie.",
		"ASADOR EN EL PATIO": "BARBECUE DANS LA COUR",
		"El vestuario viene a comer. La química se cocina.":
			"Le vestiaire vient manger. L'alchimie se cuisine.",
		"JACUZZI": "JACUZZI",
		"Piernas nuevas al día siguiente del partido.":
			"Des jambes neuves le lendemain du match.",
		"SALA DE CINE": "SALLE DE CINEMA",
		"Desconectas de verdad. Y todos quieren venir.":
			"Tu déconnectes vraiment. Et tout le monde veut venir.",
		"SPA CON FISIO": "SPA AVEC KINE",
		"Tratamiento en casa: el mejor descanso que se compra.":
			"Traitement à domicile : le meilleur repos que l'argent puisse acheter.",
		"CANCHA DE ENTRENAMIENTO": "TERRAIN D'ENTRAINEMENT",
		"Sales de casa y practicas campo abierto cuando quieras.":
			"Tu sors de chez toi et tu t'entraînes en plein champ quand tu veux.",
		"SALIR A ENTRENAR": "SORTIR S'ENTRAINER",
		"MODO EDICION": "MODE EDITION",
		"INVENTARIO": "INVENTAIRE",
		"TUS COSAS": "TES AFFAIRES",
		"EN LA CASA": "DANS LA MAISON",
		"EN CAJAS": "EN CARTONS",
		"Aquí no hay nada todavía.": "Il n'y a encore rien ici.",
		"No te sobra nada: todo lo que compraste está puesto en la casa.": "Rien en trop : tout ce que tu as acheté est posé dans la maison.",
		"EXHIBICION": "EN VITRINE",
		"OCIO": "LOISIRS",
		"ENTRENAR": "ENTRAINEMENT",
		"DECORACION": "DECORATION",
		"ALFOMBRA": "TAPIS",
		"Aquí se duerme de verdad y se recupera la energía.": "Ici on dort vraiment et on récupère l'énergie.",
		"Donde se reciben las visitas del vestuario.": "Là où l'on reçoit les gars du vestiaire.",
		"Un sitio más donde sentarse sin ocupar medio cuarto.": "Une place de plus pour s'asseoir sans prendre la moitié de la pièce.",
		"Comer bien en casa cuesta menos que comer fuera.": "Bien manger à la maison coûte moins cher que manger dehors.",
		"El centro de la sala: todo lo demás se acomoda alrededor.": "Le centre du salon : tout le reste s'organise autour.",
		"Tus copas, a la vista. Cuantas más perchas, más palmarés.": "Tes coupes, bien en vue. Plus d'étagères, plus de palmarès.",
		"La vitrina del que empieza: pocas copas, pero las tuyas.": "La vitrine du débutant : peu de coupes, mais les tiennes.",
		"Una playera enmarcada por cada club en el que jugaste.": "Un maillot encadré pour chaque club où tu as joué.",
		"Los récords de tu carrera, colgados.": "Les records de ta carrière, accrochés au mur.",
		"Lo único de la tienda que se exhibe en casa.": "Le seul achat de la boutique qui s'expose chez toi.",
		"Estudiar al rival antes del partido.": "Etudier l'adversaire avant le match.",
		"Una partida no cuesta acción de semana. Se está por estar.": "Une partie ne coûte aucune action de la semaine. C'est juste pour le plaisir.",
		"Tu estadio en pequeño, con su marcador.": "Ton stade en petit, avec son tableau d'affichage.",
		"Nadar descansa y no gasta energía de entrenamiento.": "Nager repose et ne coûte aucune énergie d'entraînement.",
		"Salir a rodar. No sirve para nada y por eso está.": "Sortir rouler. Ça ne sert à rien, et c'est bien pour ça que c'est là.",
		"El rack con la barra: levantar pesas sube tu físico.": "Le rack avec la barre : soulever de la fonte améliore ton physique.",
		"La torre de mancuernas. Un rack solo no hace un gimnasio.": "La tour d'haltères. Un rack seul ne fait pas une salle de sport.",
		"Correr en casa los días que no hay cancha.": "Courir à la maison les jours sans terrain.",
		"Va debajo de todo y no estorba a nada.": "Il se met sous tout et ne gêne rien.",
		"Verde en un rincón. Cuesta poco y se nota.": "Du vert dans un coin. Ça coûte peu et ça se voit.",
		"Luz propia en el rincón que quede oscuro.": "Sa propre lumière pour le coin qui reste sombre.",
		"Se apoya a ras de muro y llena una pared entera.": "Il s'appuie au ras du mur et remplit un mur entier.",
		"De cuerpo entero. Pide muro, como todo lo que cuelga.": "Pleine longueur. Demande un mur, comme tout ce qui s'accroche.",
		"{0} EN CAJAS": "{0} EN CARTONS",
		"{0} EN CAJAS · VALEN {1}": "{0} EN CARTONS · VALENT {1}",
		"VENDER {0}": "VENDRE {0}",
		"¿SEGURO? SE VAN {0} PIEZAS": "SUR ? {0} PIECES PARTENT",
		"MANTÉN PARA VENDER": "MAINTIENS POUR VENDRE",
		"MANTÉN · SE VAN {0} PIEZAS": "MAINTIENS · {0} PIECES PARTENT",
		"SALDO {0}": "SOLDE {0}",
		"{0} x {1} celdas  ·  {2} m de alto": "{0} x {1} cases  ·  {2} m de haut",
		"EN CAJAS · TOCA PARA SACARLO": "EN CARTONS · TOUCHE POUR LE SORTIR",
		"EN LA CASA · TOCA PARA GUARDARLO": "DANS LA MAISON · TOUCHE POUR LE RANGER",
		"MASCOTAS": "ANIMAUX",
		"OTRO": "SUIVANT",
		"OTRO ({0}/{1})": "SUIVANT ({0}/{1})",
		"PAREDES": "MURS",
		"MUEBLES": "MEUBLES",
		"PONER AQUI": "POSER ICI",
		"INICIAR PARED": "DEBUT DU MUR",
		"FIN DE PARED": "FIN DU MUR",
		"CANCELAR TRAZO": "ANNULER",
		"BAÑO": "SALLE DE BAIN",
		"INODORO": "TOILETTES",
		"Cerámica, tapa y cisterna para completar el baño.":
			"Céramique, abattant et réservoir pour compléter la salle de bains.",
		"Lavabo con espejo y grifo, listo junto al muro.":
			"Un lavabo avec miroir et robinet, à placer contre le mur.",
		"Mampara de cristal y regadera para el rincón del baño.":
			"Une paroi vitrée et une douchette pour le coin salle de bains.",
		"Una tina de baño de borde ancho.": "Une baignoire à rebord large.",
		"LAVABO": "LAVABO",
		"DUCHA": "DOUCHE",
		"TINA": "BAIGNOIRE",
		"Lo primero que echa en falta una casa.": "Ce qui manque en premier dans une maison.",
		"Con espejo, para mirarte antes de salir.": "Avec miroir, pour te regarder avant de sortir.",
		"Agua caliente después de entrenar.": "De l'eau chaude après l'entrainement.",
		"Para las piernas cargadas de después del partido.": "Pour les jambes lourdes d'après-match.",
		"AMPLIAR EL TERRENO": "AGRANDIR LE TERRAIN",
		"PARED DE CAMISETAS": "MUR DE MAILLOTS",
		"Donde van las copas que ganas.": "Là où vont les coupes que tu gagnes.",
		"Una playera por cada club en el que jugaste.": "Un maillot pour chaque club où tu as joué.",
		"Para los trofeos que no caben en la vitrina.": "Pour les trophées qui ne tiennent pas dans la vitrine.",
		"LEVANTAR PARED": "MONTER UN MUR",
		"TIRAR ESTA PARED": "ABATTRE CE MUR",
		"REHACER ESTA PARED": "REMONTER CE MUR",

		"PONER PUERTA": "POSER PORTE",
		"QUITAR PUERTA": "OTER PORTE",
		"DEJARIA SIN PASO": "SANS PASSAGE",
		"las paredes van rectas": "les murs vont droit",
		"demasiado corta": "trop court",
		"ahí no hay suelo": "il n'y a pas de sol là",
		"te quedarías dentro": "tu resterais enfermé dedans",
		"dejarías {0} sin paso": "tu laisserais {0} sans passage",
		"HOY NO SALE · TOCA PARA SACARLA": "RANGE · TOUCHE POUR LE SORTIR",
		"ANDA POR LA CASA · TOCA PARA GUARDARLA": "EN BALADE · TOUCHE POUR LE RANGER",
		"TAPETES": "TAPIS",



		"CUADRO DE PARED": "TABLEAU MURAL",
		"CUADRO GRANDE": "GRAND TABLEAU",
		"ÓLEO DE AUTOR": "HUILE SIGNEE",
		"BANDERINES": "FANIONS",
		"MIS BUFANDAS": "MES ECHARPES",
		"MIS BOTINES": "MES CRAMPONS",

		"MUSEO DE BALONES": "MUSEE DU BALLON",
		"ESCUDO DEL CLUB": "ECUSSON DU CLUB",
		"BANDERINES DE CAMBIO": "FANIONS D'ECHANGE",
		"TIFO ENMARCADO": "TIFO ENCADRE",
		"BALONES DE TEMPORADA": "BALLONS DE SAISON",
		"BUTACAS DEL ESTADIO": "SIEGES DU STADE",
		"ALFOMBRA DEL CÍRCULO": "TAPIS ROND CENTRAL",
		"CASILLERO DEL VESTIDOR": "CASIER DU VESTIAIRE",
		"TAPIZ": "TENTURE",
		"PANEL DE MADERA": "LAMBRIS",
		"MAPA DE GIRAS": "CARTE DES TOURNEES",
		"CARTEL DE PARTIDO": "AFFICHE DE MATCH",
		"PORTADA ENMARCADA": "UNE ENCADREE",
		"PLACA DE FICHAJE": "PLAQUE DE TRANSFERT",
		"AUN NO SE JUEGA": "PAS ENCORE JOUE",
		"VS {0}": "VS {0}",
		"{0} GOLES · NOTA {1}": "{0} BUTS · NOTE {1}",
		"\"EL QUE VIENE PISANDO FUERTE\"": "\"CELUI QUI MONTE\"",
		"DE LA CANTERA": "FORME AU CLUB",
		"El cartel de tu mejor partido: rival, goles y nota.":
			"L'affiche de ton meilleur match : adversaire, buts et note.",
		"La portada del día que ganaste algo. Se reescribe sola.":
			"La une du jour où tu as gagné quelque chose. Elle se réécrit seule.",
		"El club, la temporada y lo que costó tu fichaje.":
			"Le club, la saison et le prix de ton transfert.",
		"PANTALLA DE MURO": "ECRAN MURAL",
		"CHIMENEA": "CHEMINEE",
		"PLAFÓN": "PLAFONNIER",
		"ARAÑA": "LUSTRE",
		"APLIQUE": "APPLIQUE",
		"LÁMPARA DE BURÓ": "LAMPE DE CHEVET",
		"RÓTULO DE NEÓN": "ENSEIGNE NEON",
		"TIRA LED": "BANDEAU LED",
		"MACETERO": "GRAND POT",
		"PECERA DE PIE": "AQUARIUM COLONNE",
		"CARRITO DE REFRESCOS": "CHARIOT DE SODAS",
		"PUF": "POUF",
		"BAÚL": "MALLE",
		"PERCHERO": "PORTEMANTEAU",
		"NEVERA DE JUGOS": "FRIGO A JUS",
		"TOCADISCOS": "TOURNE-DISQUE",
		"Un lienzo con marco. Lo más barato contra un muro pelado.":
			"Une toile encadrée. Le remède le moins cher au mur nu.",
		"Metro y medio de lienzo. Ya no es un detalle.":
			"Un mètre cinquante de toile. Ce n'est plus un détail.",
		"Dos metros firmados. La pared entera es él.":
			"Deux mètres signés. Le mur entier, c'est lui.",
		"Los de tus clubes, cruzando el rincón en diagonal.":
			"Ceux de tes clubs, en diagonale dans le coin.",
		"Una bufanda por cada afición que te cantó.":
			"Une écharpe par public qui a chanté ton nom.",
		"Los botines de tus noches grandes, en peanas.":
			"Les crampons de tes grands soirs, sur socle.",
		"Treinta y dos balones tras el cristal, con luz de museo.":
			"Trente-deux ballons sous verre, éclairés comme au musée.",
		"El escudo de tu club, retroiluminado contra el muro.":
			"L'écusson de ton club, rétroéclairé sur le mur.",
		"Un banderín de intercambio por cada club que pisaste.":
			"Un fanion d'échange par club où tu es passé.",
		"Un trozo del tifo que te dedicó tu grada, enmarcado.":
			"Un morceau du tifo que ton virage t'a dédié, encadré.",
		"Un balón por temporada, con los colores de aquel año.":
			"Un ballon par saison, aux couleurs de l'année.",
		"Dos butacas originales de la grada, con su número.":
			"Deux vrais sièges de la tribune, avec leur numéro.",
		"El círculo central tejido, con tu escudo en medio.":
			"Le rond central tissé, ton écusson au milieu.",
		"Tu taquilla del vestidor, con tu dorsal en la puerta.":
			"Ton casier du vestiaire, ton numéro sur la porte.",
		"Un tramo de muro con otra tela, de suelo a techo.":
			"Un pan de mur en tissu, du sol au plafond.",
		"Duelas de suelo a techo: el muro deja de ser pared.":
			"Des lames du sol au plafond : le mur n'est plus un mur.",
		"Un mapamundi con una chincheta en cada país donde jugaste. Se llena solo.":
			"Une mappemonde avec une punaise dans chaque pays où tu as joué. Elle se remplit seule.",
		"La pantalla colgada, sin mueble que la sostenga.":
			"L'écran au mur, sans meuble pour le porter.",
		"Fuego de verdad: da luz propia y calienta el rincón.":
			"Du vrai feu : sa propre lumière, et le coin se réchauffe.",
		"Luz de techo, la que hace que un cuarto deje de ser cueva.":
			"La lumière du plafond : la pièce cesse d'être une grotte.",
		"Cristal colgado en medio del salón. Se nota al entrar.":
			"Du cristal au milieu du salon. Ça se voit en entrant.",
		"Va en pareja, uno a cada lado del muro que enseñas.":
			"Par paire, un de chaque côté du mur que tu montres.",
		"Con su buró incluido, para leer sin encender el cuarto.":
			"Chevet compris, pour lire sans allumer la pièce.",
		"Tu nombre en neón, encendido toda la noche.":
			"Ton nom en néon, allumé toute la nuit.",
		"Bordea el muro y baña el cuarto de color.":
			"Longe le mur et baigne la pièce de couleur.",
		"Verde de metro ochenta para el rincón que sobra.":
			"Un mètre quatre-vingts de vert pour le coin qui reste.",
		"Una columna de agua con peces. No hace nada y se mira.":
			"Une colonne d'eau avec des poissons. Inutile, et on la regarde.",
		"Refrescos a mano cuando llega la visita.": "Des sodas à portée quand la visite arrive.",
		"Se tira al suelo y ya hay un sitio más donde caer.":
			"On le pose par terre et voilà une place de plus.",
		"Guarda lo que no se enseña, y hace de banco.":
			"Range ce qu'on ne montre pas, et sert de banc.",
		"Donde va la chamarra al entrar por la puerta.":
			"Où va la veste dès qu'on passe la porte.",
		"Jugos en frío, iluminados. La compra del que presume.":
			"Des jus au frais, éclairés. L'achat de celui qui frime.",
		"Vinilo, brazo y altavoces sobre su mueble de madera.":
			"Vinyle, bras de lecture et haut-parleurs sur un meuble en bois.",
		"El suelo deja de estar desnudo.": "Le sol n'est plus nu.",
		"PLANTAS": "PLANTES",
		"Algo vivo en cada cuarto.": "Quelque chose de vivant dans chaque pièce.",
		"Los libros visten más que el mármol.":
			"Les livres habillent mieux qu'un sol en marbre.",
		"LÁMPARAS DE PIE": "LAMPADAIRES",
		"Rincones cálidos al caer la tarde.": "Des coins chaleureux à la tombée du soir.",
		"RECÁMARA": "CHAMBRE",
		"SUITE": "SUITE",
		"SALÓN": "SALON",
		"Camina y mira lo que has ganado": "Marche et regarde ce que tu as gagné",
		"Por colocar: {0} en cajas": "À placer : {0} en cartons",
		"Lo que se compra aquí, por secciones:": "Ce qui s'achète ici, par sections :",
		"ENTRAR": "ENTRER",
		"LA SIGUIENTE": "LA SUIVANTE",
		"EL TECHO": "LE SOMMET",
		"No hay casa mejor. Ahora llénala.":
			"Il n'y a pas de meilleure maison. Maintenant, remplis-la.",
		"Descanso: +{0} de energía tras cada partido.":
			"Repos : +{0} d'énergie après chaque match.",
		"Suma +{0} de energía tras cada partido.":
			"Ajoute +{0} d'énergie après chaque match.",
		"Sólo cabe en el jardín de un solar de {0} x {0} o más.": "Ne tient que dans le jardin d'un terrain de {0} x {0} ou plus.",
		"Mantenimiento: {0} por partido.": "Entretien : {0} par match.",
		"MUDARSE · {0}": "EMMENAGER · {0}",
		"TE FALTA {0}": "IL TE MANQUE {0}",
		"SALA": "SALON",
		"PATIO": "COUR",
		"JARDIN": "JARDIN",
		"SALA DE TROFEOS": "SALLE DES TROPHEES",
		"SALA DE PREMIOS": "SALLE DES RECOMPENSES",
		"GALERIA": "GALERIE",
		"GARAGE": "GARAGE",
		"CANCHA": "TERRAIN",
		"SOFÁ": "CANAPE",
		"MESA": "TABLE",
		"REPISA": "ETAGERE",
		"CAMA": "LIT",
		"VITRINA": "VITRINE",
		"MARCO": "CADRE",
		"BANCA": "BANC",
		"AUTO": "VOITURE",
		"PORTERÍA": "BUTS",




		"A PRESTAMO": "EN PRET",
		"MESA DE POQUER": "TABLE DE POKER",
		"AQUI": "ICI",
		"SUELO": "SOL",
		"BASTA": "FINI",
		"PINTAR TODAS LAS PAREDES": "PEINDRE TOUS LES MURS",
		"PINTAR SUELO": "PEINDRE LE SOL",
		"DEJAR DE PINTAR": "ARRETER",
		"QUITAR PINTURA": "ENLEVER",
		"QUITAR PISO": "ENLEVER LE SOL",
		"Ancho de la brocha, en casillas.": "Largeur du pinceau, en cases.",
		"PINTAR ESTE CUARTO": "PEINDRE CETTE PIECE",
		"Se pinta el cuarto donde tengas la mano.": "Peint la pièce où se trouve ta main.",
		"DERRIBAR EN LINEA": "DEMOLIR EN LIGNE",
		"DEJAR LA MAZA": "LACHER LA MASSE",
		"EMPEZAR DERRIBO": "COMMENCER DEMOLITION",
		"TIRAR LO MARCADO": "ABATTRE LE TRACE",
		"DERRIBAR": "DEMOLIR",
		"PASTO": "PELOUSE",
		"Ciegas: {0} y {1}": "Blindes : {0} et {1}",
		"{0} se retira": "{0} se couche",
		"{0} pasa": "{0} parle",
		"{0} iguala": "{0} suit",
		"{0} sube a {1}": "{0} relance à {1}",
		"PAREJA": "PAIRE",
		"relacionesPAREJA": "COMPAGNE",
		"ESCALERA": "QUINTE",
		"COLOR": "COULEUR",
		"FULL": "FULL",
		"PREFLOP": "PREFLOP",
		"FLOP": "FLOP",
		"TURN": "TURN",
		"RIVER": "RIVER",
		"SHOWDOWN": "ABATTAGE",
		"SIGUENOS":
			"SUIVEZ-NOUS",
		"Síguenos y comparte el juego con tus amigos.":
			"Suis-nous et partage le jeu avec tes amis.",
		"COMPARTIR EL JUEGO": "PARTAGER LE JEU",
		"COMPARTIR": "PARTAGER",
		"ENLACE COPIADO · PÉGALO DONDE QUIERAS": "LIEN COPIE · COLLE-LE OU TU VEUX",
		"PULSA OTRA VEZ PARA SALIR": "APPUIE ENCORE POUR QUITTER",
		"VALORAR EL JUEGO": "NOTER LE JEU",
		"GIRAR": "TOURNER",
		"CAJA": "BOITE",
		"MUEBLE": "MEUBLE",
		"GUARDA": "RANGER",
		"ANULAR": "ANNULER",
		"MOVER": "BOUGER",
		"ALZAR": "MONTER",
		"TRAZAR": "TRACER",
		"TIRAR": "ABATTRE",
		"NO PASA": "BLOQUE",
		"PINTAR": "PEINDRE",
		"GIRO": "TOURNE",
		"COLGAR PLAYERAS": "ACCROCHER LES MAILLOTS",
		"PLAYERA ENMARCADA": "MAILLOT ENCADRE",
		"COLGAR PLAYERA": "ACCROCHER LE MAILLOT",
		"Una playera enmarcada, la que tú elijas. Cuelga las que quieras.": "Un maillot encadré, celui que tu choisis. Accroches-en autant que tu veux.",
		"MARCO {0} · VACÍO": "CADRE {0} · VIDE",
		"MARCO {0}": "CADRE {0}",
		"AUTOMÁTICO": "AUTO",
		"DORSAL": "NUMERO",
		"Toca el número que quieras. Los que llevan tus compañeros se piden dos veces.": "Touche le numéro que tu veux. Ceux que portent tes coéquipiers demandent deux touches.",
		"El {0} lo lleva {1}. Toca otra vez y te lo pones: a él le dan otro.": "Le {0}, c'est {1}. Touche encore et il est à toi : on lui en donne un autre.",
		"El {0} lo lleva {1}. Mantén y te lo pones: a él le dan otro.": "Le {0}, c'est {1}. Maintiens et il est à toi : on lui en donne un autre.",
		"DEJARLO AUTOMÁTICO": "LAISSER EN AUTO",
		"SILLA": "CHAISE",
		"Para sentarse a la mesa.": "Pour s'asseoir à table.",
		"BANCO DE BARRA": "TABOURET",
		"Para la barra de la cocina.": "Pour le bar de la cuisine.",
		"SILLÓN": "FAUTEUIL",
		"Tu sitio para ver el partido.": "Ta place pour regarder le match.",
		"Tu solar pasa a {0} x {0}. Crece por los cuatro lados.":
			"Ton terrain passe à {0} x {0}. Il s'agrandit des quatre côtés.",
		"{0} en una edición de {1}": "{0} sur une édition de {1}",
		"Mejor media": "Meilleure moyenne",
		"{0} va con todo ({1})": "{0} fait tapis ({1})",
		"{0} se lleva {1} (los demás se fueron)":
			"{0} rafle {1} (les autres se sont couchés)",
		"Gana {0} con {1} ({2})": "{0} gagne avec {1} ({2})",




		"ARCE CLARO": "ERABLE CLAIR",
		"HORMIGÓN": "BETON",
		"MÁRMOL": "MARBRE",
		"CARBÓN": "CHARBON",
		"PARTIDA DE PÓQUER": "PARTIE DE POKER",
		"Invitas, se reparten cartas y se juega con tu dinero.":
			"Tu invites, on distribue les cartes et on joue ton argent.",
		"LOS DEL VESTUARIO": "LE VESTIAIRE",
		"Tres compañeros y una noche larga.":
			"Trois coéquipiers et une longue nuit.",
		"GENTE DE OTROS CLUBES": "DES JOUEURS D'AUTRES CLUBS",
		"Se juega más fuerte, y se cuenta por ahí.":
			"On joue plus gros, et ça se raconte.",
		"GENTE CONOCIDA": "DES GENS CONNUS",
		"Apuestas de las que salen en el periódico.":
			"Des mises qui finissent dans le journal.",
		"CARTA ALTA": "CARTE HAUTE",
		"DOBLE PAREJA": "DOUBLE PAIRE",
		"TRÍO": "BRELAN",
		"PÓQUER": "CARRE",
		"ESCALERA DE COLOR": "QUINTE FLUSH",
		"PUNTERÍA": "VISEE",
		"AQUI GIRA": "TOURNE ICI",
		"SIN MESA": "PAS DE TABLE",
		"dejarías un rincón sin paso": "tu laisserais un coin sans passage",
		"Solo ante el portero: define el mano a mano.":
			"Seul face au gardien : conclus le duel.",
		"Jala hacia atrás y suelta al arco":
			"Tire vers l'arrière et lâche au but",
		"Disparo de frente: aprovecha el ángulo abierto.":
			"Tir de face : profite de l'angle ouvert.",
		"Jala y suelta con fuerza al arco": "Tire et lâche fort au but",
		"Desde lejos: la puntería pesa más que la fuerza.":
			"De loin : la visée compte plus que la force.",
		"Apunta fino y suelta al arco": "Vise juste et lâche au but",
		"Ángulo cerrado: mete efecto para colarla.":
			"Angle fermé : mets de l'effet pour la glisser.",
		"Curva el tiro hacia el palo largo":
			"Enroule le tir vers le second poteau",
		"Contragolpe: resuelve antes de que cierre la defensa.":
			"Contre : conclus avant que la défense se referme.",
		"Jala y suelta antes de que te tapen":
			"Tire et lâche avant qu'on te ferme",
		"El balón es TUYO y estás en la banda: cuélgalo al área o prueba el tiro escorado.":
			"Le ballon est le TIEN et tu es sur l'aile : centre dans la surface ou tente la frappe.",
		"Jala y suelta: al área o al arco":
			"Tire et relâche : surface ou but",
		"Tiro libre directo: sortea la barrera al arco.":
			"Coup franc direct : passe le mur au but.",
		"Jala y suelta por encima de la barrera":
			"Tire et lâche par-dessus le mur",
		"Córner: coloca el centro para el remate.":
			"Corner : place le centre pour la reprise.",
		"Pon el balón al corazón del área":
			"Mets le ballon au cœur de la surface",
		"Penal: tú y el portero, a sangre fría.":
			"Penalty : toi et le gardien, sang-froid.",
		"Elige tu lado y suelta ajustado":
			"Choisis ton côté et lâche ajusté",
		"Falta al borde del área: monta el disparo desde fuera.":
			"Faute à l'entrée de la surface : arme le tir de l'extérieur.",
		"Jala y suelta buscando el hueco":
			"Tire et lâche en cherchant le trou",
		"Saque de banda: reanuda el ataque con un compañero.":
			"Touche : relance l'attaque avec un coéquipier.",
		"Saca rápido hacia un compañero": "Remets vite vers un coéquipier",
		"Cancha entera y sin reloj: siente la conducción y tira cuando quieras.":
			"Terrain entier, sans chrono : sens la conduite et tire quand tu veux.",
		"Arrastra para conducir; suelta en el círculo para tirar":
			"Glisse pour conduire ; lâche dans le cercle pour tirer",
		"Ganas COMPLETANDO el pase largo a la otra banda, no marcando.":
			"Tu gagnes en REUSSISSANT la longue passe sur l'autre aile, pas en marquant.",
		"Apunta al compañero de la otra banda":
			"Vise le coéquipier sur l'autre aile",
		"Aquí NO se tira: llega a las zonas rojas para salir limpio.":
			"Ici on ne tire PAS : atteins les zones rouges pour ressortir proprement.",
		"Arrastra para correr y zafarte de la marca":
			"Glisse pour courir et te défaire du marquage",
		"Trofeos": "Trophées",
		"ANDA POR LA CASA · TOCA PARA RENOMBRAR O GUARDAR":
			"EN BALADE · TOUCHE POUR RENOMMER OU RANGER",
		"Ampliar a {0} x {0}: levanta las paredes donde quieras y amuébla­lo a tu gusto en el modo edición.":
			"Agrandir à {0} x {0} : monte les murs où tu veux et meuble-la à ton goût en mode édition.",
		"Asistencias": "Passes déc.",
		"Aún no hay cartas en la mesa.":
			"Pas encore de cartes sur la table.",
		"BOTE: {0}": "POT : {0}",
		"CESION": "PRET",
		"LEY BOSMAN": "ARRET BOSMAN",
		"DEADLINE DAY": "DEADLINE DAY",
		"División": "Division",
		"EL DIARIO": "LE JOURNAL",
		"EL TRASPASO": "LE TRANSFERT",
		"EL VESTUARIO DEL AÑO": "EQUIPE DE L'ANNEE",
		"EN CURSO": "EN COURS",
		"Edad": "Ans",
		"El club te sube a {0}": "Le club te monte à {0}",
		"El primero de muchos. Este no se te olvida en toda la carrera.":
			"Le premier d'une longue série. Celui-là, tu ne l'oublies jamais.",
		"GANO EL DERBI": "A GAGNE LE DERBY",
		"GUARDARLA (HOY NO SALE)": "RANGER POUR AUJOURD'HUI",
		"Goles": "Buts",
		"Guardado": "Enregistré",
		"HOY NO SALE · TOCA PARA RENOMBRAR O SACAR":
			"RANGE · TOUCHE POUR RENOMMER OU SORTIR",
		"Hoy la ciudad amaneció con la portada buena.": "Aujourd'hui la ville s'est réveillée avec la bonne une.",
		"Hoy la ciudad amaneció con tu nombre en la portada.":
			"Aujourd'hui la ville s'est réveillée avec ton nom à la une.",
		"IGUALAR": "SUIVRE",
		"INVITADO": "INVITE",
		"JUGAR PÓQUER": "JOUER AU POKER",
		"FACIL": "FACILE",
		"MEDIO": "MOYEN",
		"DIFICIL": "DIFFICILE",
		"EXTREMO": "EXTREME",

		"MANTEN PULSADO": "MAINTIENS APPUYE",
		"SUELTA PARA TIRAR": "RELACHE POUR LANCER",
		"¡SE TE FUE LA MANO!": "TROP FORT !",
		"DIANA": "CENTRE",
		"ANILLO": "ANNEAU",
		"TRIPLE {0}": "TRIPLE {0}",
		"DOBLE {0}": "DOUBLE {0}",
		"VISITA {0} DE {1}": "VOLEE {0} SUR {1}",
		"TU {0}   ·   {1} {2}": "TOI {0}   ·   {1} {2}",
		"TIRA {0}": "{0} LANCE",
		"GANAS EL RETO": "DEFI GAGNE",
		"GANAS LA PARTIDA": "PARTIE GAGNEE",
		"OTRO DIA SERA": "UNE AUTRE FOIS",
		"QUIMICA +{0}": "ALCHIMIE +{0}",
		"ARRASTRA Y SUELTA": "TIRE ET RELACHE",
		"FALTA · BOLA EN MANO": "FAUTE · BILLE EN MAIN",
		"MESA ABIERTA": "TABLE OUVERTE",
		"LISAS": "PLEINES",
		"RAYADAS": "RAYEES",
		"LA NEGRA": "LA NOIRE",
		"{0} · TE QUEDAN {1}": "{0} · IL RESTE {1}",
		"TIRAR DARDOS": "FLECHETTES",
		"JUGAR BILLAR": "JOUER AU BILLARD",
		"¿CONTRA QUIEN?": "CONTRE QUI ?",
		"TIRAR UN RATO": "LANCER UN PEU",
		"UNA PARTIDA SOLO": "UNE PARTIE SEUL",
		"Ya ganaste química esta semana. Se juega por el récord.": "Tu as déjà gagné de l'alchimie cette semaine. Là, c'est pour le record.",
		"EL UTILERO": "L'INTENDANT",
		"UN COMPAÑERO": "UN COEQUIPIER",
		"EL CAPITAN": "LE CAPITAINE",
		"DIANA DE DARDOS": "CIBLE DE FLECHETTES",
		"Se tira como se chuta. Reta al vestuario y gana química.": "On lance comme on tire. Défie le vestiaire et gagne de l'alchimie.",
		"Se tira como se chuta: tensas y sueltas. Reta a quien quieras.": "On lance comme on tire : on tend et on relâche. Défie qui tu veux.",
		"La resortera, sobre el paño. Una partida con el vestuario.": "La fronde, sur le tapis. Une partie avec le vestiaire.",
		"NOCHE DE DARDOS": "SOIREE FLECHETTES",
		"Caen dos del vestuario y se tira hasta tarde.": "Deux du vestiaire débarquent et on lance jusqu'à tard.",
		"NOCHE DE BILLAR": "SOIREE BILLARD",
		"Tacos, hielo y una mesa que no se apaga.": "Queues, glaçons et une table qui ne s'éteint jamais.",
		"LEVANTARSE DE LA MESA": "QUITTER LA TABLE",
		"LOS NUEVOS UNIFORMES": "LES NOUVEAUX MAILLOTS",
		"Media (OVR)": "Moyenne (OVR)",
		"Mejor gol": "Meilleur but",
		"Mejor pase": "Meilleure passe",
		"NUEVO CLUB": "NOUVEAU CLUB",
		"No se pudo crear el video": "Impossible de créer la vidéo",
		"No se pudo escribir el video": "Impossible d'écrire la vidéo",
		"No se pudo preparar la carpeta del video":
			"Impossible de préparer le dossier vidéo",
		"Nota media": "Note moy.",
		"OTRA MANO": "NOUVELLE MAIN",
		"PASAR": "CHECKER",
		"PONER NOMBRE": "DONNER UN NOM",
		"PRIMER GOL": "PREMIER BUT",
		"Partidos": "Matchs",
		"Prima de objetivo: ${0}": "Prime d'objectif : {0} $",
		"Primas por títulos: ${0}": "Primes de titres : {0} $",
		"Cláusula de ascenso: tu ficha sube a ${0}":
			"Clause de montée : ton salaire passe à {0} $",
		"Cláusula de descenso: tu ficha baja a ${0}":
			"Clause de relégation : ton salaire tombe à {0} $",
		"RETIRARSE": "SE COUCHER",
		"SACARLA A LA CASA": "LA SORTIR DANS LA MAISON",
		"SE RETIRÓ": "S'EST COUCHE",
		"SIN TRASPASO": "SANS TRANSFERT",
		"SUBIR A {0}": "RELANCER A {0}",
		"Sin títulos esta temporada.": "Aucun titre cette saison.",
		"TRAMO": "TRONÇON",
		"TU PRIMER GOL": "TON PREMIER BUT",
		"TU TURNO": "A TOI",
		"PIENSA {0}…": "{0} REFLECHIT…",
		"TERMINA LA MANO PARA LEVANTARTE": "FINIS LA MAIN POUR TE LEVER",
		"ESTA NOCHE: {0}": "CE SOIR : {0}",
		"MANO {0}/{1} · CIEGA {2}": "MAIN {0}/{1} · BLINDE {2}",
		"ULTIMA MANO DE LA NOCHE": "DERNIERE MAIN DE LA SOIREE",
		"MEJOR MANO: {0}": "MEILLEURE MAIN : {0}",
		"ARRUINASTE A {0}": "TU AS RUINE {0}",
		"NERVIOSO": "NERVEUX",
		"TRANQUILO": "SEREIN",
		"PRUDENTE": "PRUDENT",
		"EQUILIBRADO": "EQUILIBRE",
		"KAMIKAZE": "KAMIKAZE",
		"FAROLERO": "BLUFFEUR",
		"TIENES: {0}": "TU AS : {0}",
		"IGUALAR {0}": "SUIVRE {0}",
		"TORNEO · MANO {0} · CIEGA {1}": "TOURNOI · MAIN {0} · BLINDE {1}",
		"¡CAMPEÓN DEL TORNEO!": "CHAMPION DU TOURNOI !",
		"TORNEO DE LA TEMPORADA": "TOURNOI DE LA SAISON",
		"TORNEO: YA JUGADO ESTA TEMPORADA": "TOURNOI : DEJA JOUE CETTE SAISON",
		"Torneo de Póquer": "Tournoi de poker",
		"Campeón del Torneo de Póquer": "Champion du tournoi de poker",
		"RETO: GANA UN BOTE DE FAROL": "DEFI : GAGNE UN POT AU BLUFF",
		"RETO: DEJA A UN RIVAL SIN FICHAS": "DEFI : RUINE UN RIVAL",
		"RETO: GANA {0} EN UNA MANO": "DEFI : GAGNE {0} EN UNE MAIN",
		"RETO: GANA CON COLOR O MEJOR": "DEFI : GAGNE AVEC COULEUR OU MIEUX",
		"RETO: ACABA LA NOCHE GANANDO": "DEFI : FINIS LA SOIREE GAGNANT",
		"RETO CUMPLIDO · QUIMICA +{0}": "DEFI REUSSI · ALCHIMIE +{0}",
		"RETO CUMPLIDO": "DEFI REUSSI",
		"RETO DE LA SEMANA: HECHO": "DEFI DE LA SEMAINE : FAIT",
		"TE DEBE {0}": "TE DOIT {0}",
		"LE DEBES {0}": "TU LUI DOIS {0}",
		"CIEGA {0} · PARA IGUALAR {1}": "BLINDE {0} · POUR SUIVRE {1}",
		"OVR {0}": "OVR {0}",
		"SUBIDA MINIMA {0} · TODO DENTRO {1}": "RELANCE MIN {0} · TAPIS {1}",
		"TODO DENTRO ({0})": "TAPIS ({0})",
		"TODO {0}": "TAPIS {0}",
		"½ BOTE {0}": "½ POT {0}",
		"BOTE {0}": "POT {0}",
		"TUS FICHAS: {0}": "TES JETONS : {0}",
		"Tan cerca. La medalla de plata es la que enseña lo que todavía falta.":
			"Si près. La médaille d'argent montre ce qui manque encore.",
		"Te sientan en el vestuario con el director deportivo. En {0} no pueden con tu sueldo y tu traspaso les cuadra el ejercicio: contaban con ese dinero antes de decírtelo.":
			"On te convoque au vestiaire avec le directeur sportif. À {0}, ils ne peuvent plus assumer ton salaire et ton transfert équilibre l'exercice : ils comptaient sur cet argent avant de te le dire.",
		"Toca una temporada para verla en detalle.":
			"Touche une saison pour la voir en détail.",
		"Toda la ciudad amaneció con esa portada.":
			"Toute la ville s'est réveillée avec cette une.",
		"Toda la ciudad amaneció con tu fichaje en la portada.":
			"Toute la ville s'est réveillée avec ta signature à la une.",
		"Tres equipaciones nuevas. El club estrena piel.":
			"Trois nouveaux maillots. Le club change de peau.",
		"Tu solar mide {0} x {0} metros.":
			"Ton terrain fait {0} x {0} mètres.",
		"VER TEMPORADA A TEMPORADA": "SAISON PAR SAISON",
		"VER RESUMEN": "VOIR LE BILAN",
		"Valor": "Valeur",
		"Ya no se puede ampliar más.": "Impossible d'agrandir davantage.",
		"{0}  (liga {1})": "{0}  (ligue {1})",
		"{0} m": "{0} m",
		"{0} · TEMPORADA {1}": "{0} · SAISON {1}",
		"¿CON QUIÉN JUEGAS?": "AVEC QUI JOUES-TU ?",




		"MESA DE PÓQUER": "TABLE DE POKER",
		"Invita a quien quieras y juégate el dinero de verdad.":
			"Invite qui tu veux et joue ton vrai argent.",
		"CAMA SENCILLA": "LIT SIMPLE",
		"Un colchón y a dormir.": "Un matelas, et au lit.",
		"CAMA DOBLE": "LIT DOUBLE",
		"De verdad se descansa.": "Là, on se repose vraiment.",
		"CAMA KING": "LIT KING",
		"La cama de alguien que ya llegó.":
			"Le lit de quelqu'un qui a réussi.",
		"Para ver el partido sentado.": "Pour regarder le match assis.",
		"SOFÁ ESQUINERO": "CANAPE D'ANGLE",
		"Caben los amigos.": "Il y a la place pour les potes.",
		"SOFÁ DE PIEL": "CANAPE EN CUIR",
		"Piel de verdad, del color del salón de un fichaje caro.":
			"Du vrai cuir, la couleur du salon d'un transfert cher.",
		"Donde se come.": "Là où on mange.",
		"MESA DE COMEDOR": "TABLE A MANGER",
		"Para sentar a la familia.": "De quoi asseoir toute la famille.",
		"MESA DE MÁRMOL": "TABLE EN MARBRE",
		"Pesa media tonelada y se nota.": "Une demi-tonne, et ça se voit.",
		"COCINETA": "KITCHENETTE",
		"Dos fuegos y un fregadero.": "Deux feux et un évier.",
		"COCINA COMPLETA": "CUISINE EQUIPEE",
		"Aquí ya se cocina en serio.": "Ici, on cuisine pour de bon.",
		"COCINA CON ISLA": "CUISINE ILOT",
		"Con isla en medio, como las de revista.":
			"Avec un îlot au milieu, comme dans les magazines.",
		"GALLINA": "POULE",
		"Una gallina que picotea y trota por la casa.":
			"Une poule qui picore et trottine dans la maison.",
		"LORO": "PERROQUET",
		"Un loro de colores que brinca y no para quieto.":
			"Un perroquet coloré qui sautille et ne tient pas en place.",
		"PIANO DE COLA": "PIANO A QUEUE",
		"Laca negra en el salón. Suena a que llegaste.":
			"Laque noire au salon. Ça sonne comme une arrivée.",
		"MESA DE BILLAR": "BILLARD",
		"Una partida con el vestuario. La química se juega.":
			"Une partie avec le vestiaire. L'alchimie se joue là.",
		"FUTBOLITO": "BABY-FOOT",
		"Piques rápidos en casa. Nadie se va sin revancha.":
			"Des duels rapides à la maison. Personne ne part sans revanche.",
		"ESCULTURA": "SCULPTURE",
		"Una pieza de autor. Puro caché en el salón.":
			"Une pièce d'auteur. Du pur standing au salon.",
		"ACUARIO": "AQUARIUM",
		"Un muro de agua y peces. Baja las pulsaciones.":
			"Un mur d'eau et de poissons. Le pouls redescend.",
		"ESTILO CALIDO": "STYLE CHALEUR",
		"Terracota, roble y luz de tarde. La casa abraza.":
			"Terre cuite, chêne et lumière du soir. La maison enveloppe.",
		"ESTILO INDUSTRIAL": "STYLE INDUS",
		"Cemento visto, acero y madera cruda. Sin adornos.":
			"Béton brut, acier et bois cru. Sans fioritures.",
		"ESTILO MARMOL": "STYLE MARBRE",
		"Mármol blanco y filos de oro. La casa de un campeón.":
			"Marbre blanc et arêtes dorées. La maison d'un champion.",
		"PANTALLA GRANDE": "GRAND ECRAN",
		"Una tele más grande para ver el gol en condiciones.":
			"Une télé plus grande, pour voir le but comme il faut.",
		"PANTALLA MURAL": "ECRAN MURAL",
		"Pantalla de pared, como en el palco. Se ve desde la cocina.":
			"Un écran mural, comme en loge. Visible depuis la cuisine.",
		"MESA DE JARDÍN": "TABLE DE JARDIN",
		"BANCA DE JARDÍN": "BANC DE JARDIN",
		"Un sitio donde sentarse fuera y ver pasar la temporada.": "Un endroit où s'asseoir dehors et regarder passer la saison.",
		"Con sombrilla. Para comer fuera cuando aprieta el calor.": "Parasol inclus. Pour manger dehors quand il fait chaud.",
		"Agua corriendo en el patio. Se oye antes de verse.": "De l'eau qui coule dans la cour. On l'entend avant de la voir.",
		"Sombra de vigas sobre el patio. Se pasa por debajo.": "Une ombre de poutres sur la cour. On passe dessous.",

		"ARBUSTO": "ARBUSTE",
		"SOMBRILLA": "PARASOL",
		"FAROL DE JARDÍN": "LANTERNE DE JARDIN",
		"HAMACA": "HAMAC",
		"CAMASTRO": "TRANSAT",
		"ÁRBOL": "ARBRE",
		"COLUMPIO DE TERRAZA": "BALANCELLE",
		"FOGATA": "BRASERO",
		"HUERTO": "POTAGER",
		"PORTERÍA DE ENTRENO": "BUT D'ENTRAINEMENT",
		"ESTANQUE DE KOI": "BASSIN A KOIS",
		"COCINA EXTERIOR": "CUISINE D'EXTERIEUR",
		"HELICÓPTERO": "HELICOPTERE",
		"Nada de carreteras: llegas a todo volando y el cuerpo lo nota.": "Fini les routes : tu voles partout et ton corps le sent.",
		"HELIPUERTO": "HELIPORT",
		"Verde bajo para el borde del terreno. Se ponen varios.":
			"De la verdure basse pour le bord du terrain. On en met plusieurs.",
		"Sombra donde no hay árbol. Va sola, sin mesa debajo.":
			"De l'ombre là où il n'y a pas d'arbre. Seul, sans table dessous.",
		"Luz propia fuera: de noche el jardín deja de ser un hueco negro.":
			"Sa propre lumière dehors : la nuit, le jardin cesse d'être un trou noir.",
		"Lona suspendida entre dos postes para descansar al aire libre.":
			"Toile suspendue entre deux poteaux pour se détendre en plein air.",
		"Tumbarse al sol. Junto a la piscina se ven de a dos.":
			"S'allonger au soleil. Au bord de la piscine, ils vont par deux.",
		"Tres metros de copa: lo único que da sombra de verdad.":
			"Trois mètres de frondaison : la seule vraie ombre du terrain.",
		"Un banco colgado que se mece. Para ver caer la tarde.":
			"Un banc suspendu qui se balance. Pour voir tomber le soir.",
		"Fuego fuera: alumbra el patio y calienta la noche.":
			"Du feu dehors : ça éclaire la cour et ça réchauffe la nuit.",
		"Bancales con verdura. Se come lo que sale de tu terreno.":
			"Des carrés de légumes. On mange ce que ton terrain donne.",
		"Portería con red: entrenar en casa deja de ser una idea.":
			"Un but avec filet : s'entraîner chez soi n'est plus une idée.",
		"Agua quieta con carpas y una cascada que no calla.":
			"De l'eau calme avec des carpes et une cascade qui ne se tait jamais.",
		"Barra, fuegos y fregadero fuera. El asador con casa.":
			"Plan de travail, feux et évier dehors. Le barbecue avec sa maison.",
		"La losa con la H. No sirve para nada y se ve desde el aire.":
			"La dalle avec le H. Ça ne sert à rien et ça se voit du ciel.",
		"Sombra donde no hay árbol. Se planta y ya hay sitio.":
			"De l'ombre là où il n'y a pas d'arbre. On le plante et la place est faite.",
		"Verde bajo para el borde. Lo barato que llena metros.":
			"De la verdure basse pour le bord. Le pas cher qui remplit des mètres.",
		"Luz propia en el jardín, encendida en cuanto cae la noche.":
			"Sa propre lumière au jardin, allumée dès que la nuit tombe.",
		"FUENTE": "FONTAINE",
		"PÉRGOLA": "PERGOLA",
		"ENTRENO": "ENTRAINEMENT",
		"ENTRENAMIENTO": "ENTRAINEMENT",
		"EL CAMPO DE ATRÁS": "LE TERRAIN DU FOND",
		"Un campo cercado, una caseta y los conos. Con eso se empieza.":
			"Un terrain clôturé, un cabanon et les plots. On commence avec ça.",
		"LA CIUDAD DEPORTIVA": "LE CENTRE SPORTIF",
		"CIUDAD DEPORTIVA": "CENTRE D'ENTRAINEMENT",
		"Vallado en condiciones, vestuarios y material para el balón parado.":
			"Une clôture correcte, des vestiaires et le matériel pour les coups de pied arrêtés.",
		"EL CENTRO DE ALTO RENDIMIENTO": "LE CENTRE DE HAUTE PERFORMANCE",
		"Tribuna, torre de filmación y una estación para cada cosa que sabes hacer.":
			"Une tribune, une tour de tournage et un poste pour chaque chose que tu sais faire.",
		"Elige un ejercicio y repítelo sin límite: cada intento arma un escenario"
		+ " distinto. Todavía no cuenta para la carrera. Se sale con PAUSA.":
			"Choisis un exercice et répète-le sans limite : chaque tentative crée un"
			+ " scénario différent. Ça ne compte pas encore pour la carrière. On sort avec PAUSE.",
		"QUE SE ENTRENA AQUI": "CE QUI S'ENTRAINE ICI",
		"SI SUBES DE CATEGORIA": "SI TU MONTES DE DIVISION",
		"Se abre: {0}.": "Débloque : {0}.",
		"PREPARADOR FÍSICO": "PREPARATEUR PHYSIQUE",
		"Alguien que cuida tu cuerpo a jornada completa: la mayor recuperación tras"
		+ " cada partido.":
			"Quelqu'un qui s'occupe de ton corps à temps plein : la meilleure récupération"
			+ " après chaque match.",
		"CHEF PERSONAL": "CHEF PERSONNEL",
		"Cocina para ti cada semana: COMER BIEN no te gasta acción y recuperas más energía tras cada partido.":
			"Il cuisine pour toi chaque semaine : BIEN MANGER ne te coûte plus d'action et tu récupères plus d'énergie après chaque match.",
		"TU CHEF COCINÓ · SIN GASTAR ACCIÓN": "TON CHEF A CUISINE · SANS DEPENSER D'ACTION",
		"NUTRICIONISTA": "NUTRITIONNISTE",
		"Te arma la dieta de cada semana: cada partido te gasta menos energía.": "Prépare ton régime chaque semaine : chaque match te coûte moins d'énergie.",
		"ENTRENADOR PERSONAL": "COACH PERSONNEL",
		"Te espera en tu gimnasio: LEVANTAR PESAS no te gasta acción.": "T'attend dans ta salle de sport : SOULEVER DE LA FONTE ne coûte plus d'action.",
		"CON TU ENTRENADOR · SIN GASTAR ACCIÓN": "AVEC TON COACH · SANS DEPENSER D'ACTION",
		"GASTO": "DEPENSE",
		"ACCIONES": "ACTIONS",
		"NIVEL {0}/{1}": "NIVEAU {0}/{1}",
		"TUYO · NIVEL {0}/{1}": "A TOI · NIVEAU {0}/{1}",
		"SUBE A NIVEL {0} · PAGO ÚNICO": "PASSER AU NIVEAU {0} · PAIEMENT UNIQUE",
		"Comes como atleta: +{0}% de experiencia en cada partido.": "Tu manges comme un athlète : +{0}% d'expérience à chaque match.",
		"Te cuida el cuerpo: {0}% menos riesgo de lesión.": "Elle prend soin de ton corps : {0}% de risque de blessure en moins.",
		"Más exigente: LEVANTAR PESAS te da +{0} de técnico.": "Plus exigeant : SOULEVER DE LA FONTE te donne +{0} avec l'entraîneur.",
		"CONSULTORIO DE NUTRICIÓN": "CABINET DE NUTRITION",
		"Escritorio, báscula con tallímetro y el plato en la pared: donde trabaja tu nutricionista.": "Bureau, balance avec toise et l'assiette au mur : là où travaille ta nutritionniste.",
		"El consultorio de tu nutricionista: escritorio, báscula con tallímetro y el póster del plato.": "Le cabinet de ta nutritionniste : bureau, balance avec toise et l'affiche de l'assiette.",
		"CLÍNICA PRIVADA": "CLINIQUE PRIVEE",
		"Casi la mitad de riesgo de lesión, y toda baja dura la mitad.":
			"Presque moitié moins de risque de blessure, et chaque absence dure deux fois moins longtemps.",
		"ANALISTA DE VÍDEO": "ANALYSTE VIDEO",
		"Estudias cada partido con alguien que sabe mirar: +25% de experiencia.":
			"Tu étudies chaque match avec quelqu'un qui sait observer : +25% d'expérience.",
		"RENEGOCIAR CON EL AGENTE": "RENEGOCIER AVEC TON AGENT",
		"Su comisión baja del 8% al 3%. Cara, pero cuanto antes la firmes, más te"
		+ " devuelve.":
			"Sa commission passe de 8% à 3%. Cher, mais plus tôt tu signes, plus ça te"
			+ " rapporte.",
		"CORTES DE PELO": "COUPES DE CHEVEUX",
		"VELLO FACIAL": "PILOSITE FACIALE",
		"TINTES": "COLORATIONS",
		"PUNTAS": "POINTES",
		"ENTRADAS": "GOLFES",
		"La frente que gana terreno. Asúmelo con dignidad.":
			"Le front qui gagne du terrain. Assume-le avec dignité.",
		"RAPADO A LOS LADOS": "UNDERCUT",
		"Máquina en los lados, tupé arriba. El corte de vestuario.":
			"Tondeuse sur les côtés, banane sur le dessus. La coupe du vestiaire.",
		"RAYA AL LADO": "RAIE SUR LE COTE",
		"Una raya rapada a navaja. Detalle de peluquería cara.":
			"Une raie rasée au rasoir. La touche du coiffeur cher.",
		"DEGRADADO": "DEGRADE",
		"Se difumina hacia abajo. Nunca pasa de moda.":
			"Ça s'estompe vers le bas. Jamais démodé.",
		"FRANJAS RAPADAS": "LIGNES RASEES",
		"Rayas marcadas al ras. Para el que ya tuvo su noche perfecta.":
			"Des lignes rasées au ras du crâne. Pour celui qui a déjà vécu sa nuit parfaite.",
		"CRESTA ANCHA": "CRETE LARGE",
		"El mohicano de los campeones. Se lleva con una liga en la vitrina.":
			"La crête des champions. Elle se porte avec un titre de champion en vitrine.",
		"PATILLAS": "FAVORIS",
		"Bajan por la mandíbula y ahí se quedan.": "Ils descendent le long de la mâchoire et restent là.",
		"MOSCA": "MOUCHE",
		"Un toque bajo el labio. Poco pelo, mucha actitud.":
			"Une touche sous la lèvre. Peu de poils, beaucoup d'attitude.",
		"CANDADO": "BOUC",
		"Contorno fino, mejilla limpia. Requiere pulso.":
			"Contour fin, joue nette. Ça demande une main sûre.",
		"BARBÓN": "BARBE FOURNIE",
		"Barba cerrada de verdad. Diez años encima en una semana.":
			"Une vraie barbe fournie. Dix ans de plus en une semaine.",
		"BIGOTE MANILLAR": "MOUSTACHE GUIDON",
		"Las puntas caen. Solo se lo permite quien lleva una década.":
			"Les pointes tombent. Seul se le permet celui qui en porte depuis dix ans.",
		"PLATINO": "PLATINE",
		"Decolorado entero. Te van a encontrar en cualquier repetición.":
			"Décoloré intégralement. On te repérera dans n'importe quel ralenti.",
		"ROJO FUEGO": "ROUGE FEU",
		"Se ve desde el último anillo de la grada.":
			"Ça se voit depuis le dernier anneau de la tribune.",
		"AZUL ELÉCTRICO": "BLEU ELECTRIQUE",
		"Para el que ya fue el mejor de un mes y quiere que se note.":
			"Pour celui qui a déjà été le meilleur du mois et qui veut que ça se voie.",
		"ROSA": "ROSE",
		"Solo se lo puede permitir alguien con un Balón de Oro en casa.":
			"Seul peut se le permettre celui qui a un trophée de Joueur de l'Année chez lui.",
		"PUNTAS DECOLORADAS": "POINTES DECOLOREES",
		"Solo las puntas. El resto se queda como estaba.":
			"Seulement les pointes. Le reste reste comme avant.",
		"PUNTAS DORADAS": "POINTES DOREES",
		"Oro en las puntas. Se gana ganando Europa.":
			"De l'or sur les pointes. Ça se gagne en gagnant l'Europe.",


		"RADIO COMARCAL": "RADIO LOCALE",
		"CERÁMICA NORTE": "CERAMIQUE DU NORD",
		"NOVA MÓVIL": "NOVA MOBILE",
		"HELIOS SEGUROS": "HELIOS ASSURANCES",
		"IMPERIAL": "IMPERIAL",
		"Te conocen del barrio. Cada año que cumples, te suben el trato.":
			"On te connaît dans le quartier. Chaque année de fidélité, ils revalorisent le contrat.",
		"Narran tus partidos y te pagan por el pase, no por el remate.":
			"Ils commentent tes matchs et paient la passe, pas la frappe.",
		"Casi no te pagan por venir. Te pagan por el año entero.":
			"Ils ne te paient presque rien pour venir. Ils paient l'année entière.",
		"La valla del estadio es tuya, pero sólo cobras cuando marcas.":
			"Le panneau du stade est à toi, mais tu n'es payé que si tu marques.",
		"Les gusta el balón parado. Lo demás no se lo cuentan.":
			"Ils aiment les coups de pied arrêtés. Le reste ne compte pas.",
		"Pagan la asistencia como otros pagan el gol.":
			"Ils paient la passe décisive comme d'autres paient le but.",
		"La llevan los que deciden partidos. Les da igual cómo.":
			"Portée par ceux qui décident les matchs. Peu importe comment.",
		"Quieren regularidad, no fuegos artificiales. Y la quieren todo el año.":
			"Ils veulent de la régularité, pas des feux d'artifice. Et toute l'année.",
		"Sólo miran las noches grandes: Europa y copa. La liga no existe.":
			"Ils ne regardent que les grands soirs : Europe et coupe. Le championnat n'existe pas.",
		"La marca del mundo te mira, y el mundo no se conforma.":
			"Une marque mondiale te regarde, et le monde ne se contente pas de peu.",
		"El contrato de una vida, y pide la temporada de una vida.":
			"Le contrat d'une vie, et il exige la saison d'une vie.",
		"{0} ASISTENCIAS": "{0} PASSES DECISIVES",
		"{0} ENTRE GOLES Y ASISTENCIAS": "{0} BUTS ET PASSES DECISIVES",
		"{0} GOLES A BALÓN PARADO": "{0} BUTS SUR COUP DE PIED ARRETE",
		"{0} GOLES EN EUROPA O COPA": "{0} BUTS EN EUROPE OU EN COUPE",
		" Y MEDIA {0}": " ET NOTE {0}",
		" · media {0}/{1}": " · note {0}/{1}",
		"GOL O ASISTENCIA": "BUT OU PASSE DECISIVE",
		"GOL DE BALÓN PARADO": "BUT SUR COUP DE PIED ARRETE",
		"GOL EN EUROPA O COPA": "BUT EN EUROPE OU EN COUPE",
		"GOL DE PENAL": "BUT SUR PENALTY",
		"{0} te sube el trato: ${1} por partido": "{0} améliore ton contrat : ${1} par match",
		"${0} por partido + ${1} por {2}": "${0} par match + ${1} par {2}",
		"${0} / PARTIDO   +${1} POR {2}": "${0} / MATCH   +${1} PAR {2}",
		"PREMIO ${0}": "PRIME ${0}",
		"TU MARCA": "TA MARQUE",
		"PANADERÍA DEL BARRIO": "BOULANGERIE DU QUARTIER",
		"IRON FIT": "IRON FIT",
		"VOLT COLA": "VOLT COLA",
		"BANCO MERIDIÁN": "BANQUE MERIDIAN",
		"Pagan por estar en el campo. Si te sientan, no cobras.":
			"Ils paient pour que tu sois sur le terrain. Si tu es sur le banc, tu n'es pas payé.",
		"KRONOS SPORT": "KRONOS SPORT",
		"MOTORES ARIA": "ARIA MOTORS",
		"AEROLÍNEAS CÉNIT": "AEROLIGNES ZENITH",
		"PROMESA": "ESPOIR",
		"PROFESIONAL": "PROFESSIONNEL",
		"FIGURA": "VEDETTE",
		"ESTRELLA MUNDIAL": "STAR MONDIALE",
		"LEYENDA": "LEGENDE",
		"INMORTAL": "IMMORTEL",
		"del Mundo": "du monde",
		"de tu club": "de ton club",
		"de {0}": "de {0}",
		"INMORTAL {0}": "IMMORTEL {0}",
		"INMORTAL ★{0}": "IMMORTEL ★{0}",
		"Leyenda eterna {0}.": "Légende éternelle {0}.",
		"—a las puertas": "—aux portes",
		"Te falta prestigio de leyenda mundial (o palmarés de club) para LEYENDA.":
			"Il te manque le prestige de légende mondiale (ou un palmarès en club) pour LEGENDE.",
		"CLASIFICATORIAS": "QUALIFICATIONS",
		"CLASIF. MUNDIAL": "QUALIF. MONDIAL",
		"CLASIF. EUROPA": "QUALIF. EUROPE",
		"CLASIF. SUDAMÉRICA": "QUALIF. AM. SUD",
		"CLASIF. NORTEAMÉRICA": "QUALIF. AM. NORD",
		"CLASIF. ASIA": "QUALIF. ASIE",
		"CLASIF. ÁFRICA": "QUALIF. AFRIQUE",
		"CLASIF. OCEANÍA": "QUALIF. OCEANIE",
		"MUNDIAL": "MONDIAL",
		"CONTINENTAL": "CONTINENTAL",
		"AMISTOSOS": "AMICAUX",
		"TODA LA CARRERA POR TORNEO": "CARRIERE PAR COMPETITION",
		"Ningún puesto de esta liga da plaza de {0}: las plazas se reparten por el"
		+ " coeficiente del país, y la última competición es la puerta de las ligas"
		+ " pequeñas.":
			"Aucune place de ce championnat ne donne accès à {0} : les places se répartissent"
			+ " selon le coefficient du pays, et la dernière compétition est la porte d'entrée"
			+ " des petits championnats.",
		"De {0} temporada(s) vieja(s) sólo se guardó el total, sin repartir por"
		+ " torneo: no entran en esta tabla.":
			"Pour {0} ancienne(s) saison(s), seul le total a été conservé, sans répartition"
			+ " par compétition : elles n'apparaissent pas dans ce tableau.",
		"EUROCOPA": "TOURNOI EUROPEEN",
		"COPA AMÉRICA": "TOURNOI SUD-AMERICAIN",
		"COPA ORO": "TOURNOI NORD-AMERICAIN",
		"COPA DE ASIA": "TOURNOI ASIATIQUE",
		"COPA AFRICANA": "TOURNOI AFRICAIN",
		"COPA CONTINENTAL": "COUPE CONTINENTALE",
		"COPA DE CAMPEONES": "COUPE ELITE",
		"COPA EUROPA": "COUPE EUROPA",
		"COPA CONFERENCIA": "COUPE CHALLENGE",
		"Aún no hay nada que exponer": "Il n'y a encore rien à exposer",
		"sin sitio · pon otra vitrina o repisa": "sans place · ajoute une vitrine ou étagère",
		"sin sitio · pon otro estante de balones": "sans place · ajoute une étagère à ballons",
		"CAMISETAS": "MAILLOTS",
		"EN EQUIPO": "EQUIPE",
		"INDIVIDUALES": "INDIVIDUEL",
		"Sin registro del año": "Aucune année enregistrée",
		"SALIR DE LA CANCHA": "QUITTER LE TERRAIN",
		"Pronto podrás entrenar aquí.": "Tu pourras bientôt t'entraîner ici.",
		"ISLA CON BARRA": "ILOT AVEC BAR",
		"La barra exenta: se cocina de un lado y se come del otro.":
			"L'îlot libre : on cuisine d'un côté, on mange de l'autre.",
		"TOCADOR CON ESPEJO": "COIFFEUSE AVEC MIROIR",
		"CAMA PARA PERRO": "PANIER DU CHIEN",
		"RASCADOR PARA GATO": "ARBRE A CHAT",
		"LAVANDERÍA": "BUANDERIE",
		"MUEBLE DE RECIBIDOR": "MEUBLE D'ENTREE",
		"VESTIDOR DE ROPA DE CALLE": "DRESSING DE VILLE",
		"TELESCOPIO": "TELESCOPE",
		"CAMBIAR DE ROPA": "SE CHANGER",
		"VOLVER A CASA": "RENTRER A LA MAISON",
		"Cojín, manta y juguete: el perro tiene dónde descansar.":
			"Coussin, couverture et jouet : un coin repos pour ton chien.",
		"Postes y plataformas para que el gato tenga su rincón.":
			"Des poteaux et des plateformes pour le coin de ton chat.",
		"Lavadora, cesta y toallas para la ropa de entrenamiento.":
			"Lave-linge, panier et serviettes pour ta tenue d'entraînement.",
		"Llaves, mochila y zapatos: todo a mano junto a la entrada.":
			"Clés, sac à dos et chaussures : tout à portée près de l'entrée.",
		"Ropa de calle, tenis y espejo. Acércate para cambiarte.":
			"Tenues de ville, baskets et miroir. Approche pour te changer.",
		"Tubo óptico sobre trípode para tu rincón junto a la ventana.":
			"Un tube optique sur trépied pour ton coin près de la fenêtre.",
		"Un rincón para los dos: espejo, frascos y banqueta.":
			"Un coin pour deux : miroir, flacons et tabouret.",
		"TOCADOR": "COIFFEUSE",
		"El rincón de arreglarse, con espejo y su banqueta.":
			"Le coin pour se préparer : miroir et son tabouret.",
		"DESPACHO CON CAJA FUERTE": "BUREAU AVEC COFFRE",
		"Escritorio, carpetas y caja fuerte. Aquí se firma lo que ganas.":
			"Un bureau, des dossiers et un coffre. Ici tu signes ce que tu gagnes.",
		"REPASAR CONTRATOS": "REVOIR LES CONTRATS",
		"Una tarde con tu agente y los papeles sobre la mesa.":
			"Un après-midi avec ton agent et les papiers sur la table.",
		"SAUNA": "SAUNA",
		"Duelas, piedras calientes y media hora de calor seco.":
			"Lambris, pierres chaudes et une demi-heure de chaleur sèche.",
		"Calor seco en duelas de pino. Sales otro después del partido.":
			"Chaleur sèche en lambris de pin. Tu en sors transformé après le match.",
		"GORRAS DE LA SELECCIÓN": "CASQUETTES DE SELECTION",
		"Una gorra por partido con tu país. Se llena sola.":
			"Une casquette par match avec ton pays. Elle se remplit toute seule.",
		"BALÓN DEL PRIMER GOL": "BALLON DU PREMIER BUT",
		"El balón de tu primer gol, bajo cristal y con su cartela.":
			"Le ballon de ton premier but, sous verre avec sa plaque.",
		"COCINA DEL NUTRICIONISTA": "CUISINE DU NUTRITIONNISTE",
		"Nevera de raciones pesadas y báscula en la barra.":
			"Un frigo de portions pesées et une balance sur le plan.",
		"Comer medido: la misma comida de casa, pero pesada.":
			"Manger mesuré : la même cuisine maison, mais pesée.",
		"Todo pesado y a su hora: el cuerpo lo nota el domingo.":
			"Tout pesé et à l'heure : le corps le sent le dimanche.",
		"Barra central con fregadero: aquí se cocina y se come.":
			"Un plan central avec évier : on y cuisine et on y mange.",
		"MALETAS APILADAS": "VALISES EMPILEES",
		"Una maleta por club. La pila crece con cada traspaso.":
			"Une valise par club. La pile grandit à chaque transfert.",
		"SILLÓN DE BARBERO": "SIEGE DE BARBIER",
		"Cuero, espejo con bombillas y carrito. Aquí se hacen las portadas.":
			"Cuir, miroir à ampoules et chariot. C'est ici que naissent les unes.",
		"VITRINA ISLA": "VITRINE ILOT",
		"La isla de museo: cristal por los cuatro lados y tres baldas.":
			"L'îlot de musée : vitré sur les quatre faces, avec trois étagères.",
		"ESTATUA DE BRONCE": "STATUE EN BRONZE",
		"Tú en bronce, sobre un plinto con tu nombre y tus títulos.":
			"Toi en bronze, sur un socle avec ton nom et tes trophées.",
		"SIESTA AL SOL": "SIESTE AU SOLEIL",
		"Media hora fuera, sin teléfono. El cuerpo lo agradece.":
			"Une demi-heure dehors, sans téléphone. Le corps apprécie.",


		"CABINA DE PÓDCAST": "CABINE PODCAST",
		"TINA DE HIELO": "CUVE GLACEE",
		"BANCO DE BOTAS": "BANC A BOTTES",
		"TOALLERO": "PORTE-SERVIETTES",
		"ESPEJO DE CUERPO ENTERO": "MIROIR EN PIED",
		"MESA DE CENTRO": "TABLE BASSE",
		"RINCÓN DEL CAFÉ": "COIN CAFE",
		"APARADOR DE VAJILLA": "VAISSELIER",
		"GALLINERO": "POULAILLER",
		"GRABAR UN PÓDCAST": "FAIRE UN PODCAST",
		"BAÑO DE HIELO": "BAIN GLACE",
		"LIMPIAR LAS BOTAS": "CIRER LES BOTTES",
		"MINIJUEGOS": "MINI-JEUX",
		"Micro, cascos y panel acústico. Graba tu semana: rinde con la prensa.":
			"Micro, casque et panneaux acoustiques. Raconte ta semaine : la presse apprécie.",
		"Agua a tres grados. Tres minutos que las piernas agradecen.":
			"De l'eau à trois degrés. Trois minutes que tes jambes remercient.",
		"Balda, cepillo y hormas. Botas cuidadas se gastan la mitad.":
			"Étagère, brosse et embauchoirs. Des crampons soignés s'usent moitié moins.",
		"Barra de pared con toallas limpias. Pide muro para colgarse.":
			"Barre murale avec des serviettes propres. Il lui faut un mur.",
		"Luna de cuerpo entero para mirarte antes de salir.":
			"Un miroir en pied pour te regarder avant de sortir.",
		"Baja, delante del sofá: ahí van el café y el mando.":
			"Basse, devant le canapé : on y pose le café et la télécommande.",
		"Cafetera, tazas y molinillo. El primer café del día, en casa.":
			"Cafetière, tasses et moulin. Le premier café de la journée, à la maison.",
		"Vajilla a la vista tras el cristal. La mesa se pone desde aquí.":
			"La vaisselle en vitrine. C'est d'ici qu'on met la table.",
		"Caseta con tejadillo y nidal: la gallina tiene dónde dormir.":
			"Une cabane avec son toit et son pondoir : ta poule a où dormir.",
		"Una hora de micrófono contando tu semana. Una acción semanal.":
			"Une heure au micro à raconter ta semaine. Une action par semaine.",
		"Cepillo, betún y cordones: el próximo partido gasta la mitad.":
			"Brosse, cirage et lacets : le prochain match les use moitié moins.",
		"Con las botas de cantera no hay nada que cuidar.":
			"Il n'y a rien à entretenir sur des crampons de base.",
		"Tus botas ya están listas para el próximo partido.":
			"Tes crampons sont déjà prêts pour le prochain match.",
		"Espera al alta médica para entrenar.": "Attends le feu vert médical pour t'entraîner.",
		"UN JEQUE": "CHEIKH",
		"UN MAGNATE": "UN MAGNAT",
		"UN FONDO": "UN FONDS",
		"LOS INGRESOS SE DOBLAN": "REVENUS DOUBLES",
		"COMPRA PARA VENDER": "ACHETE POUR VENDRE",
		"Compra el club para ganarlo todo: el doble de presupuesto en GERENCIA, y la directiva te va a pedir mucho más arriba en la tabla.": "Il rachète le club pour tout gagner : le double de budget dans DIRECTION, et les dirigeants vont viser bien plus haut au classement.",
		"Un fondo de inversión compra el club para revenderlo: algo más de presupuesto, y en su último año vende lo que más vale del vestuario.": "Un fonds d'investissement rachète le club pour le revendre : un peu plus de budget, et sa dernière année il vend ce que le vestiaire a de plus précieux.",
		"Te sientan en el vestuario con el director deportivo. El fondo que compró {0} se va este verano y quiere su beneficio: eres lo que más vale del vestuario, y tu traspaso es la plusvalía.": "On te convoque au vestiaire avec le directeur sportif. Le fonds qui a racheté {0} part cet été et veut son bénéfice : tu es ce que le vestiaire a de plus précieux, et ton transfert est la plus-value.",
		"FACHADA": "FACADE",
		"TORRE DE CRISTAL": "TOUR DE VERRE",
		"Tu piso en una torre de vidrio y acero: la ciudad entera en la ventana.": "Ton appartement dans une tour de verre et d'acier : toute la ville à ta fenêtre.",
		"EDIFICIO COLONIAL": "IMMEUBLE COLONIAL",
		"Balcones de hierro, arcos y muros de color: el barrio viejo de la ciudad.": "Balcons en fer, arcs et murs colorés : le vieux quartier de la ville.",
		"CASA MEDITERRANEA": "MAISON DU SUD",
		"Muros encalados, teja árabe y buganvilla: huele a mar.": "Murs chaulés, tuiles canal et bougainvillée : ça sent la mer.",
		"CABAÑA DE MADERA": "CHALET EN BOIS",
		"Troncos, porche con mecedora y chimenea de piedra: el bosque en tu puerta.": "Rondins, porche avec fauteuil à bascule et cheminée de pierre : la forêt à ta porte.",
		"CUBO DE CRISTAL": "CUBE DE VERRE",
		"Un cubo de vidrio sobre el jardín: todo luz, nada que esconder.": "Un cube de verre sur le jardin : que de la lumière, rien à cacher.",
		"LOFT DE HORMIGON": "LOFT BETON",
		"Hormigón visto, ventanales de taller y puerta de acero: industrial de verdad.": "Béton brut, grandes verrières d'atelier et porte en acier : un vrai style industriel.",
		"MANSION VICTORIANA": "MANOIR VICTORIEN",
		"Torreón, buhardillas y balaustradas: la casa de las películas.": "Tourelle, lucarnes et balustrades : la maison des films.",
		"VILLA MEDITERRANEA": "VILLA MARINE",
		"Arcos, palmeras y terraza con pérgola: una villa junto al mar.": "Arcs, palmiers et terrasse avec pergola : une villa au bord de la mer.",
		"HACIENDA": "HACIENDA",
		"Portón de madera, patio con arcos y campanario: la casa grande del campo.": "Grand portail en bois, patio à arcades et clocher : la grande maison de la campagne.",
		"RANCHO": "RANCH",
		"Cercas de madera, granero rojo y establo: tierra tuya hasta donde alcanza la vista.": "Clôtures en bois, grange rouge et écurie : tes terres à perte de vue.",
		"Bono de relación ya estrenado: no vuelve a sumar.": "Bonus de relation déjà encaissé : il ne s'ajoute plus.",
		"¿VOLVER A LA DE FÁBRICA?": "REVENIR A CELLE D'ORIGINE ?",
		"Se quita sin reembolso y la casa vuelve a la de fábrica. Comprarla otra vez cuesta lo mismo.": "Elle est retirée sans remboursement et la maison revient à celle d'origine. La racheter coûte le même prix.",
		"BUZÓN": "BOITE AUX LETTRES",
		"COLUMPIO": "BALANÇOIRE",
		"UN AFICIONADO": "UN SUPPORTER",
		"Hay {0} ofertas sobre la mesa. No las dejes enfriar.": "Il y a {0} offres sur la table. Ne les laisse pas refroidir.",
		"Tu precontrato está firmado. En verano cambias de aires.": "Ton précontrat est signé. Cet été, tu changes d'air.",
		"Te vi el último partido y no me moví del asiento. Gracias.": "Je t'ai vu au dernier match et je n'ai pas bougé de mon siège. Merci.",
		"Tu nuevo contrato ya está en vigor: {0} temporadas más con nosotros.": "Ton nouveau contrat est en vigueur : {0} saisons de plus avec nous.",
		"Van {0} goles esta temporada. La directiva lo celebra contigo.": "Ça fait {0} buts cette saison. La direction fête ça avec toi.",
		"Gracias por los títulos de la temporada pasada. La vitrina también es tuya.": "Merci pour les titres de la saison passée. La vitrine est aussi la tienne.",
		"Te cortan la rueda a gritos. Esta noche el vestuario no espera a nadie.": "On coupe la conférence à coups de cris. Ce soir, le vestiaire n'attend personne.",
		"El confeti del suelo es del otro. Y aun así te toca contestar.": "Les confettis par terre sont à l'autre. Et pourtant, il faut répondre.",
		"Se cuela uno a gritar detrás de ti. Un derbi también se gana delante del micro.": "Un coéquipier se glisse en criant derrière toi. Un derby se gagne aussi devant le micro.",
		"TOCAR EL PIANO": "JOUER DU PIANO",
		"OCTAVA {0}": "OCTAVE {0}",
		"TOCA LAS TECLAS": "TAPE LES TOUCHES",
		"CRUCETA ELIGE · {0} TOCA": "CROIX CHOISIT · {0} JOUE",
		"INTERCAMBIADAS": "ECHANGES",
		"AQUÍ": "ICI",
		"PONER AQUÍ": "METTRE ICI",
		"TRAER AQUÍ": "AMENER ICI",
		"DEJARLA AUTOMÁTICA": "REMETTRE EN AUTO",
		"PROMETER UN GOL": "PROMETTRE UN BUT",
		"{0} llega con cinco victorias seguidas en liga. El de la radio local, el único que te espera a la salida, te pregunta si os dan miedo.": "{0} arrive avec cinq victoires de suite en championnat. Le gars de la radio locale, le seul qui t'attend à la sortie, te demande s'ils vous font peur.",
		"{0} llega con cinco victorias seguidas en liga. La sala de prensa está llena hasta el pasillo, y todas las cámaras te preguntan si os dan miedo.": "{0} arrive avec cinq victoires de suite en championnat. La salle de presse déborde jusque dans le couloir, et toutes les caméras te demandent s'ils vous font peur.",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Un periodista de la radio local te para en el aparcamiento: ¿es el mejor momento para cruzártelos?": "{0} n'a plus gagné depuis cinq journées et ses tribunes réclament des têtes. Un journaliste de la radio locale t'arrête sur le parking : est-ce le meilleur moment pour les affronter ?",
		"{0} no gana desde hace cinco jornadas y su grada ya pide cabezas. Con la sala llena, la primera pregunta es para ti: ¿es el mejor momento para cruzártelos?": "{0} n'a plus gagné depuis cinq journées et ses tribunes réclament des têtes. Salle comble, la première question est pour toi : est-ce le meilleur moment pour les affronter ?",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y el chico de la radio local quiere saber si tú sí.": "{0} a un nouvel entraîneur cette saison : {1}. Personne ne sait encore comment ils jouent, et le jeune de la radio locale veut savoir si toi, tu le sais.",
		"{0} estrena técnico esta temporada: {1}. Nadie sabe todavía a qué juega, y una sala llena de cámaras quiere saber si tú sí.": "{0} a un nouvel entraîneur cette saison : {1}. Personne ne sait encore comment ils jouent, et une salle pleine de caméras veut savoir si toi, tu le sais.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Sólo el fotógrafo del periódico local busca la foto del reencuentro.": "{0}, l'entraîneur qui t'a eu sous ses ordres, est maintenant sur le banc de {1}. Seul le photographe du journal local cherche la photo des retrouvailles.",
		"{0}, el técnico que te tuvo a sus órdenes, se sienta ahora en el banquillo de {1}. Medio país quiere la foto del reencuentro, y las cámaras ya os esperan en el túnel.": "{0}, l'entraîneur qui t'a eu sous ses ordres, est maintenant sur le banc de {1}. La moitié du pays veut la photo des retrouvailles, et les caméras vous attendent déjà dans le tunnel.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. En la radio local te preguntan si podrás con él.": "{1} a recruté {0} cette saison, et il est déjà parmi les meilleurs de son onze. À la radio locale, on te demande si tu pourras le contenir.",
		"{1} fichó a {0} esta temporada, y ya es de lo mejor de su once. Las portadas ya venden el partido como vuestro duelo, y la sala entera te pregunta por él.": "{1} a recruté {0} cette saison, et il est déjà parmi les meilleurs de son onze. Les unes vendent déjà le match comme votre duel, et toute la salle te questionne sur lui.",
		"En tu país se ha coronado {0}. Una radio de allí, de las pocas que te siguen, te pregunta si algún día te verán jugar en casa.": "Dans ton pays, {0} a été sacré. Une radio de là-bas, l'une des rares qui te suivent, te demande si on te verra un jour jouer à la maison.",
		"En tu país se ha coronado {0}, y la prensa de allí abre con tu cara: ¿algún día te verán jugar en casa?": "Dans ton pays, {0} a été sacré, et la presse de là-bas fait sa une avec ton visage : te verra-t-on un jour jouer à la maison ?",
		"COPAS": "COUPES",
		"TASACIÓN": "ESTIMATION",
		"AFICIONADO": "SUPPORTER",
		"COLECCIONISTA": "COLLECTIONNEUR",
		"QUEDÁRMELA": "LA GARDER",
		"VENDIDA": "VENDU",
		"PERCHERO DE TIENDA": "PORTANT BOUTIQUE",
		"Doce playeras en ganchos, como en la tienda: las tuyas y las que cambiaste.": "Douze maillots sur des cintres, comme en boutique : les tiens et ceux que tu as échangés.",
		"Te sale a encarar: pica cuando el aro llegue a sus piernas y pásasela por el túnel.": "Il vient te presser : touche quand l'anneau atteint ses jambes et fais-lui un petit pont.",
		"Toca la pantalla cuando el aro se cierre": "Touche l'écran quand l'anneau se ferme",
		"Pulsa cuando el aro se cierre": "Appuie quand l'anneau se ferme",
		"SUBASTAR": "ENCHERES",
		"SALIDA": "DEPART",
		"PUJA": "MISE",
		"PARA EL {0}": "AU N° {0}",
		"SE FUE": "PERDU",
		"ADJUDICAR": "ADJUGE",
		"COBRAR": "TOUCHE",
		"¡VENDIDA!": "VENDUE !",
		"DESIERTA": "INVENDUE",
		"DUDA": "EUH",
		"${0} / PARTIDO": "${0} / MATCH",
		"+${0} POR {1}": "+${0} PAR {1}",
		"INDEMNIZACIÓN ${0}": "INDEMNITE ${0}",
		"ROMPISTE CON {0}": "RESILIE AVEC {0}",
		"URNA DE PLAYERAS": "URNE A MAILLOTS",
		"MURAL DE PLAYERAS": "MUR DE MAILLOTS",
		"VITRINA DE ESPECIALES": "VITRINE DES RARES",
		"Tres playeras tras el cristal, con luz de museo.": "Trois maillots derrière la vitre, sous une lumière de musée.",
		"Seis playeras enmarcadas en dos filas: tu salón de la fama.": "Six maillots encadrés sur deux rangées : ton panthéon.",
		"Se llena sola con tus cambiadas más raras y valiosas.": "Se remplit seule de tes maillots échangés les plus rares.",
		"CHIHUAHUA": "CHIHUAHUA",
		"SALCHICHA": "TECKEL",
		"GOLDEN": "GOLDEN",
		"HUSKY": "HUSKY",
		"GATO NEGRO": "CHAT NOIR",
		"GATO GRIS": "CHAT GRIS",
		"SIAMES": "SIAMOIS",
		"PERSA": "PERSAN",
		"Cabe en una mano y ladra como uno grande.": "Tient dans une main et aboie comme un grand.",
		"Largo, bajito y siempre detrás de ti.": "Long, tout bas et toujours derrière toi.",
		"Dorado, bonachón y el favorito del vestuario.": "Doré, débonnaire et le chouchou du vestiaire.",
		"Ojos de hielo y energía para dar y regalar.": "Des yeux de glace et une énergie à revendre.",
		"Dicen que da mala suerte... al rival.": "On dit qu'il porte malheur... à l'adversaire.",
		"Tranquilo, elegante y dueño del sofá.": "Calme, élégant et maître du canapé.",
		"Ojos azules y opinión sobre todo.": "Des yeux bleus et un avis sur tout.",
		"Una nube blanca que duerme donde quiere.": "Un nuage blanc qui dort où bon lui semble.",
		"LUEGO": "PLUS TARD",
		"AL VECINDARIO": "DANS LA RUE",
		"EL COMUNICADO": "LE COMMUNIQUE",
		"Tus palabras siguen dando vueltas y el club espera un comunicado antes del próximo partido.": "Tes mots font encore le tour et le club attend un communiqué avant le prochain match.",
		"Tu roja dejó al equipo con diez. El club te pide un comunicado antes del próximo partido.": "Ton rouge a laissé l'équipe à dix. Le club te demande un communiqué avant le prochain match.",
		"Tu festejo le costó una multa al club y la polémica no se apaga. Esperan tu comunicado.": "Ta célébration a coûté une amende au club et la polémique ne retombe pas. On attend ton communiqué.",
		"PEDIR PERDÓN": "S'EXCUSER",
		"SOSTENERLO": "ASSUMER",
		"HIERBAS": "HERBES",
		"LECHUGA": "LAITUE",
		"JITOMATE": "TOMATE",
		"CHILES": "PIMENTS",
		"FRESAS": "FRAISES",
		"MAÍZ": "MAIS",
		"AGUACATE": "AVOCAT",
		"AGAVE": "AGAVE",
	},


	"match_strip": {
		"ULTIMO": "DERNIER",
		"PROXIMO": "PROCHAIN",
		"DEBUT": "DEBUT",
		"FIN": "FIN",
		"HOY": "AUJOURD'HUI",
		"DERBI": "DERBY",
		"CASA": "DOMICILE",
		"FUERA": "EXTERIEUR",


		"{0} DERBIS · {1}": "{0} DERBYS · {1}",
		"{0} DERBIS SIN GANARLE": "{0} DERBYS SANS GAGNER",
		"{0} DERBIS GANADOS SEGUIDOS": "{0} DERBYS GAGNES DE SUITE",
		"NUNCA LE HAS GANADO": "JAMAIS BATTU",
		"NO LE GANAS DESDE HACE {0} AÑOS": "SANS VICTOIRE DEPUIS {0} ANS",


		"G": "V",
		"E": "N",
		"P": "D",


		"LIGA": "LIGUE",
		"COPA": "COUPE",
		"CLASIF": "QUALIF",
		"MUNDIAL": "MONDIAL",

		"J{0}": "J{0}",
		"GRUPO {0}": "GROUPE {0}",

		"LIGA {0}": "LIGUE {0}",

		"DIECISEISAVOS": "16EMES",
		"OCTAVOS": "8EMES",
		"CUARTOS": "QUARTS",
		"SEMIFINAL": "DEMI-FINALE",



		"rondaIDA": "ALLER",
		"rondaVUELTA": "RETOUR",
		"FINAL": "FINALE",
		"PRIMERA RONDA": "1ER TOUR",
		"SEGUNDA RONDA": "2E TOUR",
		"TERCERA RONDA": "3E TOUR",
		"CUARTA RONDA": "4E TOUR",
		"QUINTA RONDA": "5E TOUR",
		"SEXTA RONDA": "6E TOUR",
		"SÉPTIMA RONDA": "7E TOUR",
		"OCTAVA RONDA": "8E TOUR",
		"TREINTAIDOSAVOS": "32EMES",
		"FASE DE GRUPOS": "POULES",
	},


	"content": {
		"MEJOR DEL MUNDIAL": "MEILLEUR MONDIAL",
		"MEJOR DE LA COPA CONTINENTAL": "MEILLEUR COUPE CONT.",
		"PREMIO CONTINENTAL": "PRIX CONTINENTAL",
		"El mundo entero miraba. Y el mejor fuiste tú.": "Le monde entier regardait. Et le meilleur, c'était toi.",
		"Tu continente tuvo un dueño este verano.": "Ton continent a eu un maître cet été.",
		"Ser el Mejor del Mundial con tu selección.": "Finir meilleur joueur du Mondial avec ta sélection.",
		"PREMIO DEL MUNDO": "PRIX MONDIAL",
		"CHICO DE ORO": "JEUNE D'OR",
		"Premio del Mundo": "Prix Mondial",
		"Chico de Oro": "Jeune d'Or",
		"El Mejor del Planeta": "Le Meilleur de la Planète",
		"Ganar el Chico de Oro, la promesa del año.": "Remporter le Jeune d'Or, la promesse de l'année.",
		"Ganar el Premio del Mundo.": "Remporter le Prix Mondial.",
		"GOL DEL AÑO": "BUT DE L'ANNEE",
		"Gol del Año": "But de l'année",
		"GOL OLÍMPICO": "OLYMPIQUE",
		"BAJO LA BARRERA": "SOUS LE MUR",
		"DESDE LEJOS": "DE LOIN",
		"CON ROSCA": "CINTRE",
		"CHILENA": "CISEAUX",
		"VOLEA": "VOLEE",
		"PANENKA": "PANENKA",
		"DE FALTA": "COUP FRANC",
		"DE CABEZA": "TETE",
		"Obra de Arte": "Chef-d'œuvre",
		"Ganar el Gol del Año.": "Remporter le But de l'année.",
		"EL PASILLO": "LA HAIE",
		"Tu gol 100, 250 o 500 con el club: tus compañeros se abren en dos filas aplaudiendo y tú cruzas por el medio saludando.": "Ton 100e, 250e ou 500e but avec le club : tes coéquipiers forment deux rangées en applaudissant et tu passes au milieu en saluant.",
		"EL MARCADOR SIGUE PUESTO": "LE TABLEAU BRILLE ENCORE",
		"Tres horas después del pitido. Nadie ha venido a apagarlo.": "Trois heures après le coup de sifflet. Personne n'est venu l'éteindre.",
		"Tres horas después del pitido. En su casa nadie ha venido a apagarlo.": "Trois heures après le coup de sifflet. Chez eux, personne n'est venu l'éteindre.",
		"TE AGUANTAS LA MIRADA": "TU SOUTIENS TON REGARD",
		"NO TE AGUANTAS LA MIRADA": "TU NE SOUTIENS PAS TON REGARD",
		"El de enfrente durmió bien. Es el mismo que juega el jueves.": "Celui d'en face a bien dormi. C'est le même qui joue jeudi.",
		"El de enfrente no durmió. Y es el que juega el jueves.": "Celui d'en face n'a pas dormi. Et c'est lui qui joue jeudi.",
		"VEINTE MINUTOS DESPUÉS": "VINGT MINUTES PLUS TARD",
		"el marcador": "le score",
		"minutos": "minutes",
		"El escudo que amaneció clavado en tu hueco lo pisó media plantilla al salir.": "L'écusson punaisé à ton casier ce matin, la moitié de l'équipe l'a piétiné en sortant.",
		"Nadie descolgó la hoja del rival. Tu camiseta se quedó donde la tiraste.": "Personne n'a décroché la feuille du rival. Ton maillot est resté où tu l'as jeté.",










		"SE ABRE EL MERCADO": "LE MERCATO OUVRE",
		"LOS QUE QUIERE": "CEUX QU'IL VEUT",
		"LOS QUE SUELTA": "CEUX QU'IL LACHE",
		"MERCADO DE VERANO": "MERCATO D'ETE",
		"El club no busca a nadie": "Le club ne cherche personne",
		"El club no suelta a nadie": "Le club ne lâche personne",
		"PARA CEDER": "A PRETER",
		"INTOCABLES": "INTOUCHABLES",
		"Nadie en venta": "Personne à vendre",
		"Nadie para ceder": "Personne à prêter",
		"Nadie es intocable": "Personne n'est intouchable",
		"TU MEDIA": "TA NOTE",
		"TU VALOR": "TA VALEUR",
		"ENTRAN": "ARRIVEES",
		"SALEN": "DEPARTS",
		"CEDIDO": "PRETE",
		"LIBRE": "LIBRE",
		"Nadie ha visto todavía lo que haces": "Personne n'a encore vu ce que tu fais",
		"La temporada que hiciste te pone por encima": "La saison que tu as faite te met au-dessus",
		"Llevas años aquí y eso pesa": "Tu es ici depuis des années, et ça compte",
		"El once no se entiende sin ti": "Le onze ne tient pas debout sans toi",
		"La temporada que hiciste no te defiende": "La saison que tu as faite ne te défend pas",
		"Casi no juegas, y eso se nota en la lista": "Tu ne joues presque pas, et la liste le montre",
		"El club se hundió y hay que hacer caja": "Le club a coulé, il faut rentrer de l'argent",
		"El club salvó el año y no necesita vender": "Le club a sauvé l'année et n'a pas besoin de vendre",
		"Lo que vales hoy es dinero que el club mira": "Ce que tu vaux aujourd'hui, c'est de l'argent que le club regarde",


		"Un año. Lo que le regales dice si la conociste.":
			"Un an. Ce que tu lui offres dit si tu as appris à la connaître.",
		"{0} años. Lo que le regales dice si la conociste.":
			"{0} ans. Ce que tu lui offres dit si tu as appris à la connaître.",
		"Poso de los años: {0}%":
			"Les années derrière vous : {0} %",
		"Se te pasó la fecha. Ella no dijo nada.":
			"La date t'est passée sous le nez. Elle n'a rien dit.",
		"Se quedó callada un momento. Era exactamente eso.":
			"Elle est restée silencieuse un instant. C'était exactement ça.",
		"Poso de los años: {0}% — las malas rachas pesan menos.":
			"Les années derrière vous : {0} % — les mauvaises passes pèsent moins.",
		"Dio las gracias y lo dejó en la mesa del recibidor.":
			"Elle a remercié et l'a laissé sur la table de l'entrée.",
		"Un año más, y sigues sin saber quién es.":
			"Une année de plus, et tu ne sais toujours pas qui elle est.",
		"Un fin de semana los dos solos, sin teléfono":
			"Un week-end à deux, sans téléphone",
		"Una fiesta con toda la gente que quiere":
			"Une fête avec tous ceux qu'elle aime",
		"Poner su nombre en algo tuyo: el coche, la casa, la cuenta": "Mettre son nom sur quelque chose à toi : la voiture, la maison, le compte",
		"Algo que compraste con prisa y sin pensar":
			"Quelque chose acheté à la hâte, sans réfléchir",
		"Un billete abierto para que se vaya donde quiera":
			"Un billet ouvert pour qu'elle parte où elle veut",
		"Repetir exactamente la primera cena, mesa incluida":
			"Refaire exactement le premier dîner, même table comprise",
		"UN AÑO MÁS":
			"UNE ANNEE DE PLUS",
		"Hoy hace justo un año de aquello, y {0} no lo ha mencionado"
		+ " ni una vez en toda la semana. Eso no significa que se le"
		+ " haya olvidado.":
			"Aujourd'hui cela fait exactement un an, et {0} ne l'a pas mentionné une seule fois de la semaine. Cela ne veut pas dire qu'elle l'a oublié.",
		"PREPARARLE ALGO":
			"LUI PREPARER QUELQUE CHOSE",
		"DEJARLO PASAR":
			"LAISSER PASSER",



		"Le queda una noche. Aciertos: {0} de {1}":
			"Il lui reste une nuit. Bonnes réponses : {0} sur {1}",
		"Lo que digas ahora depende de quién es ella.":
			"Ce que tu dis maintenant dépend de qui elle est.",
		"Deshizo una maleta. Sólo una, y sin decir nada.":
			"Elle a défait une valise. Une seule, et sans rien dire.",
		"Se queda. No es lo de antes, pero se queda.":
			"Elle reste. Ce n'est plus comme avant, mais elle reste.",
		"Cerró la puerta despacio, que es peor que un portazo.":
			"Elle a fermé la porte doucement, ce qui est pire qu'un claquement.",
		"Se acabó.":
			"C'est fini.",


		"EL CUARTO DE INVITADOS":
			"LA CHAMBRE D'AMIS",
		"Llevas tres noches durmiendo solo. {0} dice que es por la espalda, y en la"
		+ " cama de al lado hay una almohada que no estaba.":
			"Trois nuits que tu dors seul. {0} dit que c'est son dos, et sur l'autre lit il"
			+ " y a un oreiller qui n'y était pas.",
		"PREGUNTARLE QUÉ PASA":
			"LUI DEMANDER CE QU'IL Y A",
		"SERÁ LA ESPALDA":
			"CE SERA SON DOS",
		"NO PREGUNTÓ POR EL PARTIDO":
			"ELLE N'A PAS PARLE DU MATCH",
		"Entras, dejas la bolsa, y {0} sigue con lo suyo. Antes preguntaba antes de que"
		+ " te quitaras el abrigo. Hoy no, y ayer tampoco.":
			"Tu rentres, tu poses le sac, et {0} continue ce qu'elle fait. Avant, elle"
			+ " demandait avant que tu enlèves ton manteau. Pas aujourd'hui, ni hier.",
		"APAGAR EL TELÉFONO Y SENTARTE":
			"ETEINDRE LE TELEPHONE ET T'ASSEOIR",
		"SUBIR A DUCHARTE":
			"MONTER TE DOUCHER",
		"LA MALETA PEQUEÑA":
			"LA PETITE VALISE",
		"La maleta de mano lleva dos semanas junto a la puerta, hecha. {0} no la ha"
		+ " deshecho ni una vez, y tampoco se ha ido.":
			"Le bagage cabine est près de la porte depuis deux semaines, fait. {0} ne l'a"
			+ " pas défait une seule fois, et elle n'est pas partie non plus.",
		"PEDIR PERMISO Y LLEVÁRTELA":
			"DEMANDER UN CONGE ET L'EMMENER",
		"NO ABRIR ESE TEMA":
			"NE PAS OUVRIR CE SUJET",
		"PASAR LA TARDE JUNTOS":
			"PASSER L'APRES-MIDI ENSEMBLE",
		"Sin teléfono y sin prisa. Se nota más de lo que parece.":
			"Sans téléphone et sans hâte. Ça compte plus qu'il n'y paraît.",
		"En casa se descansa: +{0} de energía cada jornada.":
			"Chez toi tu récupères : +{0} d'énergie par journée.",
		"Así no se duerme: {0} de energía cada jornada.":
			"On ne dort pas comme ça : {0} d'énergie par journée.",
		"DEJARLA":
			"LA QUITTER",
		"PEDIR EL DIVORCIO":
			"DEMANDER LE DIVORCE",
		"¿DIVORCIARTE DE {0}?":
			"DIVORCER DE {0} ?",
		"¿DEJAR A {0}?":
			"QUITTER {0} ?",
		"El reparto se paga igual que si lo pidiera ella: ${0}.":
			"Le partage coûte pareil que si elle le demandait : {0} $.",
		"La separación de bienes que firmasteis sigue valiendo. Es todo lo que te"
		+ " protege.":
			"La séparation de biens que vous avez signée tient toujours. C'est tout ce qui"
			+ " te protège.",
		"No firmasteis nada, así que entra todo: el dinero y lo que tienes puesto.":
			"Vous n'avez rien signé, donc tout y passe : l'argent et ce que tu possèdes.",
		"No cuesta nada. Ni dinero ni prensa.":
			"Ça ne coûte rien. Ni argent ni presse.",
		"Y no te va a presentar nadie a nadie en una buena temporada. Estas cosas se"
		+ " cuentan.":
			"Et personne ne te présentera personne pendant un bon moment. Ces choses-là se"
			+ " racontent.",
		"SÍ, SE ACABÓ":
			"OUI, C'EST FINI",
		"SE LLEVA ${0}":
			"ELLE EMPORTE {0} $",
		"«Me quedo. Los viajes que pueda perdonar, los pierdo.»":
			"« Je reste. Les déplacements que je peux sauter, je les saute. »",
		"«No te voy a pedir que esperes. Te pido que elijas tú.»":
			"« Je ne vais pas te demander d'attendre. Je te demande de choisir. »",
		"«Esto se arregla con tiempo. Dame la temporada.»":
			"« Le temps arrangera ça. Donne-moi la saison. »",
		"«Dime qué necesitas y lo hago mañana.»":
			"« Dis-moi ce qu'il te faut et je le fais demain. »",
		"«No hace falta que digas nada. Me siento y te escucho.»":
			"« Tu n'as rien à dire. Je m'assois et je t'écoute. »",
		"«Piensa en todo lo que hemos hecho.»":
			"« Pense à tout ce qu'on a fait. »",
		"«Si te vas lo entiendo. Pero prefiero que te quedes.»":
			"« Si tu pars, je comprends. Mais je préfère que tu restes. »",
		"«Mañana no hay entrenamiento. Vámonos donde quieras.»":
			"« Pas d'entraînement demain. Partons où tu veux. »",
		"«Ya está, ¿no? Pues ya está.»":
			"« C'est tout, alors ? Bon, c'est tout. »",
		"Se sienta en el brazo del sofá, sin quitarse el abrigo.":
			"Elle s'assoit sur l'accoudoir du canapé, sans enlever son manteau.",
		"No ha dicho que no. Sigue ahí.":
			"Elle n'a pas dit non. Elle est toujours là.",
		"Mira las maletas y luego te mira a ti.":
			"Elle regarde les valises, puis elle te regarde.",
		"Las maletas de {0} llevan dos días en el recibidor y esta"
		+ " vez no las está deshaciendo. Queda una conversación, y es"
		+ " esta noche.":
			"Les valises de {0} sont dans l'entrée depuis deux jours et cette fois elle ne les défait pas. Il reste une conversation, et c'est ce soir.",
		"HABLAR CON ELLA":
			"LUI PARLER",
		"DEJAR QUE SE VAYA":
			"LA LAISSER PARTIR",


		"TU EX HABLA":
			"TON EX PARLE",
		"Una revista le ha pagado a {1} por contar cómo eras"
		+ " entonces. No miente en nada, y eso es lo peor. {0} lo ha"
		+ " leído entero.":
			"Un magazine a payé {1} pour raconter comment tu étais à l'époque. Elle ne ment sur rien, et c'est bien ça le pire. {0} l'a lu en entier.",
		"NO CONTESTAR":
			"NE RIEN REPONDRE",
		"DESMENTIRLO EN PÚBLICO":
			"DEMENTIR EN PUBLIC",
		"ESTABA EN LA MISMA MESA":
			"ELLE ETAIT A TA TABLE",
		"Cena de gala, y en la mesa de al lado está {1}. {0} la ha"
		+ " reconocido antes de sentarse y no ha soltado tu mano en toda"
		+ " la noche.":
			"Dîner de gala, et à la table d'à côté il y a {1}. {0} l'a reconnue avant même de s'asseoir et n'a pas lâché ta main de la soirée.",
		"SALUDARLA Y VOLVER":
			"LA SALUER ET REVENIR",
		"HACER COMO QUE NO":
			"FAIRE COMME SI DE RIEN N'ETAIT",




		"LA CENA DEL VESTUARIO":
			"LE DINER DU VESTIAIRE",
		"El grupo sale a cenar y alguien lo deja caer con una"
		+ " sonrisa: «esta vez, solos». {0} ya se estaba arreglando.":
			"Le groupe sort dîner et quelqu'un le glisse avec un sourire : « cette fois, entre nous ». {0} était déjà en train de se préparer.",
		"LLEVARLA IGUAL":
			"L'EMMENER QUAND MEME",
		"LA ENTRADA DEL PALCO":
			"LA PLACE EN LOGE",
		"El club te ofrece una butaca de palco para {0}. Desde ahí se"
		+ " ve el partido; desde la grada de siempre se ve a la gente.":
			"Le club offre à {0} une place en tribune d'honneur. De là-haut on voit le match ; du virage habituel on voit les gens.",
		"AL PALCO":
			"EN TRIBUNE",
		"CON LA GRADA":
			"AVEC LE VIRAGE",
		"LA QUIEREN EN LA CAMPAÑA":
			"ILS LA VEULENT DANS LA CAMPAGNE",
		"La marca ha visto una foto vuestra y quiere a {0} en el"
		+ " anuncio. Pagan por los dos y no aceptan un no fácil.":
			"La marque a vu une photo de vous deux et veut {0} dans la pub. Ils paient pour les deux et n'acceptent pas un non facile.",
		"QUE SALGA ELLA":
			"QU'ELLE Y SOIT",
		"ELLA NO SE VENDE":
			"ELLE N'EST PAS A VENDRE",
		"LA CENA DE TU AGENTE":
			"LE DINER DE TON AGENT",
		"Tu agente ha montado una cena con gente que decide cosas. Es"
		+ " esta noche, y esta noche ya la teníais ocupada.":
			"Ton agent a organisé un dîner avec des gens qui décident. C'est ce soir, et ce soir était déjà pris.",
		"IR A LA CENA":
			"ALLER AU DINER",
		"LO QUE TENÍAIS":
			"CE QUE VOUS AVIEZ PREVU",
		"EL VÍDEO DEL MÍSTER":
			"LA VIDEO DU COACH",
		"El técnico ha mandado dos horas de vídeo para esta noche."
		+ " {0} lleva toda la semana esperando esta noche.":
			"L'entraîneur a envoyé deux heures de vidéo pour ce soir. {0} attend ce soir depuis toute la semaine.",
		"VERLO ENTERO":
			"TOUT REGARDER",
		"MAÑANA LO VES":
			"ÇA ATTENDRA",
		"OS QUIEREN A LOS DOS":
			"ILS VOUS VEULENT TOUS LES DEUX",
		"Un programa quiere una entrevista de pareja. Sería la"
		+ " primera vez que {0} habla delante de una cámara.":
			"Une émission veut une interview de vous deux. Ce serait la première fois que {0} parle devant une caméra.",
		"IR JUNTOS":
			"Y ALLER ENSEMBLE",
		"IR TÚ SOLO":
			"Y ALLER SEUL",
		"EL PLAN DE NO HACER NADA":
			"LE PLAN DE NE RIEN FAIRE",
		"Hay tres sitios donde deberías dejarte ver este fin de"
		+ " semana. {0} ha comprado comida para dos y no piensa moverse"
		+ " de casa.":
			"Il y a trois endroits où tu devrais te montrer ce week-end. {0} a acheté de quoi manger pour deux et ne compte pas bouger de la maison.",
		"QUEDARTE CON ELLA":
			"RESTER AVEC ELLE",
		"DEJARTE VER":
			"TE MONTRER",
		"ELLA CREE QUE VALES MÁS":
			"ELLE PENSE QUE TU VAUX PLUS",
		"{0} ha leído lo que cobra el que juega en tu puesto en otro"
		+ " sitio. «Pide lo tuyo o pídelo yo por ti.»":
			"{0} a lu ce que touche celui qui joue à ton poste ailleurs. « Demande ce qui te revient, ou je le demande pour toi. »",
		"PEDIR MÁS AL CLUB":
			"DEMANDER PLUS AU CLUB",
		"ESTOY BIEN AQUÍ":
			"JE SUIS BIEN ICI",
		"LA FOTO DEL PATROCINIO":
			"LA PHOTO DU SPONSOR",
		"En la foto de la marca sales con una modelo a medio metro."
		+ " {0} la ha visto antes que tú y no ha dicho nada, que es"
		+ " peor.":
			"Sur la photo de la marque, tu es à un demi-mètre d'un mannequin. {0} l'a vue avant toi et n'a rien dit, ce qui est pire.",
		"HABLARLO ESA NOCHE":
			"EN PARLER LE SOIR MEME",
		"ES TRABAJO, SE LE PASA":
			"C'EST LE BOULOT, ÇA LUI PASSERA",
		"SE FUE SIN AVISAR":
			"ELLE EST PARTIE SANS PREVENIR",
		"{0} se ha ido diez días con sus amigas y te has enterado por"
		+ " una foto. No es una prueba: es que no se le ocurrió que"
		+ " hubiera que pedir permiso.":
			"{0} est partie dix jours avec ses amies et tu l'as appris par une photo. Ce n'est pas un test : il ne lui est pas venu à l'idée qu'il fallait demander.",
		"DESEARLE BUEN VIAJE":
			"LUI SOUHAITER BON VOYAGE",
		"PEDIRLE EXPLICACIONES":
			"EXIGER DES EXPLICATIONS",
		"ELLA YA ERA DE AQUÍ":
			"ELLE ETAIT DEJA D'ICI",
		"{0} tiene su sitio en la grada desde antes de conocerte y no"
		+ " piensa cambiarlo por un palco. Hoy le toca cantar contigo"
		+ " abajo.":
			"{0} a sa place dans le virage depuis avant de te connaître et ne l'échangera pas contre une tribune. Aujourd'hui, c'est d'en bas qu'elle chante pour toi.",
		"SALUDARLA AL GOL":
			"LA SALUER APRES LE BUT",
		"ESO NO SE HACE":
			"ÇA NE SE FAIT PAS",
		"LA CAZARON EN LA PUERTA":
			"ILS L'ONT SURPRISE A LA PORTE",
		"Alguien vendió una foto de {0} saliendo de tu casa. No sale"
		+ " mal; sale sin querer salir, que para ella es lo mismo.":
			"Quelqu'un a vendu une photo de {0} sortant de chez toi. Elle n'y est pas mal ; elle y est sans vouloir y être, ce qui pour elle revient au même.",
		"PARAR ESO COMO SEA":
			"ARRETER ÇA COUTE QUE COUTE",
		"SE OLVIDA EN DOS DÍAS":
			"ÇA S'OUBLIE EN DEUX JOURS",
		"LA SEMANA MALA":
			"LA MAUVAISE SEMAINE",
		"Otra derrota, y en casa no se habla de otra"
		+ " cosa. {0} no te pregunta: te pone las botas en la puerta y"
		+ " se calla.":
			"Encore une défaite, et à la maison on ne parle que de ça. {0} ne te demande rien : elle pose tes crampons devant la porte et se tait.",
		"SALIR A CORRER CON ELLA":
			"ALLER COURIR AVEC ELLE",

		"TU AGENTE · «llámame, es importante»":
			"TON AGENT · « appelle-moi, c'est important »",
		"EL MÍSTER · vídeo del rival, para hoy":
			"LE COACH · vidéo de l'adversaire, pour ce soir",
		"TU MARCA · quieren una foto mañana":
			"TA MARQUE · ils veulent une photo demain",




		"Le gusta la vida tranquila. No pide focos, pide que estés.":
			"Elle aime la vie tranquille. Elle ne demande pas les projecteurs, elle demande que tu sois là.",
		"Vive de noche. Contigo o sin ti, y eso es justo el problema.":
			"Elle vit la nuit. Avec toi ou sans toi, et c'est justement là le problème.",
		"Tiene lo suyo y va en serio. Te quiere arriba, y lo dice.":
			"Elle a ses affaires et elle est sérieuse. Elle te veut au sommet, et elle le dit.",
		"Te quiere entero. Cada foto con otra le cuesta una noche.":
			"Elle te veut tout entier. Chaque photo avec une autre lui coûte une nuit.",
		"No te necesita, te eligió. Aguanta todo menos que la des por"
		+ " hecha.":
			"Elle n'a pas besoin de toi, elle t'a choisi. Elle supporte tout sauf d'être considérée comme acquise.",
		"Iba al estadio antes de conocerte. Los domingos son"
		+ " sagrados.":
			"Elle allait au stade avant de te connaître. Les dimanches sont sacrés.",
		"Odia la prensa. Contigo en privado lo da todo; en público,"
		+ " nada.":
			"Elle déteste la presse. En privé elle te donne tout ; en public, rien.",
		"Entiende el oficio: entrena, viaja, aguanta. Y espera lo"
		+ " mismo.":
			"Elle comprend le métier : elle s'entraîne, voyage, tient bon. Et attend la même chose.",

		"Trabaja en algo que nunca termina de explicar. Invita ella, y no deja discutirlo.":
			"Elle travaille dans un domaine qu'elle n'explique jamais vraiment. C'est elle qui invite, sans discussion.",
		"LA CUENTA YA ESTABA PAGADA":
			"L'ADDITION ETAIT DEJA REGLEE",
		"{0} ha pagado la cena, el hotel y un coche nuevo para tu madre, y no entiende qué te molesta. «Tengo más de lo que me voy a gastar nunca. Déjame.»":
			"{0} a payé le dîner, l'hôtel et une voiture neuve pour ta mère, et ne comprend pas ce qui te gêne. « J'ai plus que ce que je dépenserai jamais. Laisse-moi faire. »",
		"DEJAR QUE PAGUE":
			"LA LAISSER PAYER",
		"LA PRÓXIMA PAGO YO":
			"LA PROCHAINE FOIS, JE PAIE",
		"REGALO DE ELLA":
			"SON CADEAU",
		"FESTEJOS":
			"CELEBRATIONS",
		"FALTAN {0}": "IL EN MANQUE {0}",
		"COMPLETA":
			"COMPLET",
		"continenteEUROPA": "EUROPE",
		"continenteSUDAMÉRICA": "AMERIQUE DU SUD",
		"continenteNORTEAMÉRICA": "AMERIQUE DU NORD",
		"continenteÁFRICA": "AFRIQUE",
		"continenteASIA": "ASIE",
		"continenteOCEANÍA": "OCEANIE",
		"RIVALES":
			"RIVAUX",
		"VENCIDO":
			"BATTU",
		"Cada rival al que le ganes un partido queda apuntado aquí para siempre, en todas tus carreras.":
			"Chaque rival que tu bats en match est noté ici pour toujours, dans toutes tes carrières.",
		"PAREJAS":
			"COMPAGNES",
		"Las mujeres de tu vida. Cada una destapa su medalla el día que se muda contigo, te casas con ella o se acaba.":
			"Les femmes de ta vie. Chacune dévoile sa médaille le jour où elle s'installe chez toi, où tu l'épouses ou où tout s'arrête.",
		"Pareja por descubrir. Sabrás quién es el día que se mude contigo.":
			"Compagne à découvrir. Tu sauras qui elle est le jour où elle s'installera chez toi.",
		"La última: {0}":
			"La dernière : {0}",
		"LA CENA DEL CLUB":
			"LE DINER DU CLUB",
		"EL BAR":
			"LE BAR",
		"LA GALERÍA":
			"LA GALERIE",
		"LA PUERTA DEL ESTADIO":
			"LA SORTIE DU STADE",
		"DÓNDE LA CONOCES":
			"OU TU LA RENCONTRES",
		"GASTO EN CASA":
			"DEPENSES DU FOYER",
		"DESCANSO EN CASA":
			"REPOS A LA MAISON",
		"SE ENFADA":
			"SE FACHE",
		"SE CONTENTA":
			"SE REJOUIT",
		"PIDE DINERO":
			"DEMANDE DE L'ARGENT",
		"EL {0} DEL SUELDO":
			"{0} DU SALAIRE",
		"NUNCA":
			"JAMAIS",
		"PIDE EL DIVORCIO":
			"DEMANDE LE DIVORCE",
		"PUEDE HACERLO":
			"ELLE PEUT",
		"TU CASA O TU SUELDO":
			"TA MAISON OU TON SALAIRE",
		"EL {0} DE LO TUYO":
			"{0} DE TES BIENS",
		"SE LLEVA AL IRSE":
			"EMPORTE EN PARTANT",
		"TE REGALA":
			"T'OFFRE",
		"HASTA EL {0} DEL SUELDO":
			"JUSQU'A {0} DU SALAIRE",
		"SE MUDA CONTIGO":
			"S'INSTALLE CHEZ TOI",
		"PRONTO":
			"VITE",
		"SIN PRISA":
			"SANS HATE",
		"BAJA SOLA DESDE":
			"BAISSE SEULE DES",
		"{0} · RÁPIDO":
			"{0} · VITE",
		"{0} · DESPACIO":
			"{0} · LENTEMENT",
		"{0} · APENAS":
			"{0} · A PEINE",
		"VIVIR CON ELLA":
			"VIVRE AVEC ELLE",
		"INVITA ELLA":
			"ELLE INVITE",
		"· invita ella":
			"· elle invite",
		"La boda la paga ella: ${0}.":
			"C'est elle qui paie le mariage : {0} $.",
		"Boda pagada por ella: ${0}.":
			"Mariage payé par elle : {0} $.",
		"LA TASACIÓN":
			"L'ESTIMATION",
		"Ha venido un señor con una carpeta a medir el salón y a fotografiar la vitrina. {0} dice que es por el seguro. Nadie ha cambiado el seguro.":
			"Un monsieur avec un dossier est venu mesurer le salon et photographier la vitrine. {0} dit que c'est pour l'assurance. Personne n'a changé d'assurance.",
		"SUBIRLE LA ASIGNACIÓN":
			"AUGMENTER SON ARGENT DE POCHE",
		"NO LE DOY MÁS":
			"PAS UN CENTIME DE PLUS",
		"CUANDO LE CONVENGA":
			"QUAND ÇA L'ARRANGE",
		"TE CUESTA MÁS":
			"TE COUTE PLUS",
		"TE SUMA MÁS":
			"TE RAPPORTE PLUS",
		"TE CUESTA MENOS":
			"TE COUTE MOINS",
		"TE SUMA MENOS":
			"TE RAPPORTE MOINS",

		"LAS ESCRITURAS":
			"LES ACTES",
		"Tu agente trae las escrituras de la casa y una sola pregunta: a nombre de quién. {0} ya ha preguntado dos veces si hay que firmar algo.":
			"Ton agent apporte les actes de la maison et une seule question : à quel nom. {0} a déjà demandé deux fois s'il y a quelque chose à signer.",
		"QUE DECIDA ELLA":
			"QU'ELLE DECIDE",
		"Tu agente pone las escrituras sobre la mesa y pregunta sin mirarte: «¿a nombre de quién?».":
			"Ton agent pose les actes sur la table et demande sans te regarder : « à quel nom ? ».",
		"MANTÉN · A NOMBRE DE MI MADRE":
			"MAINTIENS · AU NOM DE MA MERE",
		"MANTÉN · A SU NOMBRE":
			"MAINTIENS · A SON NOM",
		"Tu madre firmó sin gafas y sin preguntar. Al salir te dijo: «Yo no entiendo de papeles, hijo. Pero de esa casa no me saca nadie».":
			"Ta mère a signé sans lunettes et sans poser de questions. En sortant, elle t'a dit : « Je ne comprends rien aux papiers, mon fils. Mais de cette maison, personne ne me sortira ».",
		"Ella se enteró esa noche y pidió más asignación: el {0} de tu sueldo.":
			"Elle l'a appris le soir même et a réclamé plus d'argent de poche : {0} de ton salaire.",
		"Leyó su nombre dos veces y sonrió. Esa noche no habló de la asignación.":
			"Elle a lu son nom deux fois et a souri. Ce soir-là, elle n'a pas parlé de l'argent de poche.",
		"Su abogado pidió la casa. Las escrituras dicen otra cosa.":
			"Son avocat a réclamé la maison. Les actes disent autre chose.",
		"La casa está a nombre de tu madre.":
			"La maison est au nom de ta mère.",
		"FIRMAR Y QUE SE VAYA":
			"SIGNER ET QU'ELLE PARTE",
		"Su abogado trae las escrituras con su nombre. El tuyo consigue cambiarlas por la mitad de tu cuenta.":
			"Son avocat apporte les actes à son nom. Le tien réussit à les échanger contre la moitié de ton compte.",
		"La casa y tu ficha se quedan.":
			"La maison et ton salaire restent.",
		"LA MITAD DE TU DINERO · ${0}":
			"LA MOITIE DE TON ARGENT · {0} $",
		"Se fue con dos maletas, las mismas con las que llegó.":
			"Elle est partie avec deux valises, les mêmes qu'à son arrivée.",
		"La casa sigue a nombre de tu madre.":
			"La maison est toujours au nom de ta mère.",
		"Firmaste. La casa vuelve a ser tuya; la cuenta, la mitad.":
			"Tu as signé. La maison est de nouveau à toi ; le compte, à moitié.",
		"DEPENDE DE LAS ESCRITURAS":
			"ÇA DEPEND DES ACTES",
		"Todo a Nombre de Mamá":
			"Tout au nom de maman",
		"Que su abogado pidiera la casa y las escrituras dijeran otra cosa.":
			"Que son avocat réclame la maison et que les actes disent autre chose.",
		"Lo pediste tú, y las escrituras están a nombre de tu madre: no hay nada que repartir.":
			"C'est toi qui l'as demandé, et les actes sont au nom de ta mère : il n'y a rien à partager.",
		"Su abogado trae las escrituras con su nombre, pero tu cuenta está a cero: no hay mitad que llevarse.":
			"Son avocat apporte les actes à son nom, mais ton compte est à zéro : il n'y a pas de moitié à prendre.",
		"Las escrituras están a nombre de tu madre: no se lleva nada.":
			"Les actes sont au nom de ta mère : elle ne part avec rien.",
		"Las escrituras están a su nombre: se lleva la mitad de tu dinero, ${0}.":
			"Les actes sont à son nom : elle part avec la moitié de ton argent, {0} $.",
		"La casera":
			"La casanière",
		"La fiestera":
			"La fêtarde",
		"La ambiciosa":
			"L'ambitieuse",
		"La celosa":
			"La jalouse",
		"La independiente":
			"L'indépendante",
		"La hincha":
			"La supportrice",
		"La reservada":
			"La discrète",
		"La cazafortunas":
			"La croqueuse de diamants",
		"La compañera":
			"La partenaire",
		"La millonaria":
			"La millionnaire",
		"Quiere tu tiempo, no tu dinero. En casa se duerme.":
			"Elle veut ton temps, pas ton argent. À la maison, on dort.",
		"Vive de noche, contigo o sin ti. Te cuesta sueño y dinero.":
			"Elle vit la nuit, avec ou sans toi. Elle te coûte du sommeil et de l'argent.",
		"Te quiere arriba, y te pasa la factura por subir.":
			"Elle te veut au sommet, et te facture l'ascension.",
		"Te quiere entero, y cada foto tuya con otra le cuesta una noche.":
			"Elle te veut tout entier, et chaque photo de toi avec une autre lui coûte une nuit.",
		"No te necesita: te eligió. Nunca acepta tu dinero.":
			"Elle n'a pas besoin de toi : elle t'a choisi. Elle n'accepte jamais ton argent.",
		"Iba al estadio antes que tú. Los domingos son sagrados.":
			"Elle allait au stade avant toi. Le dimanche est sacré.",
		"Odia la prensa. En privado lo da todo.":
			"Elle déteste la presse. En privé, elle donne tout.",
		"No te quiere. Cuando le salgan las cuentas, se va con lo tuyo; con papel, tarda más y se lleva menos.":
			"Elle ne t'aime pas. Quand ses comptes tomberont juste, elle partira avec ce qui est à toi ; avec un contrat, elle attend plus et prend moins.",
		"Entiende el oficio. Entrena, viaja y aguanta contigo.":
			"Elle comprend le métier. Elle s'entraîne, voyage et tient bon avec toi.",
		"Tiene más que tú y no te lo dice. Te regala dinero cada jornada y paga la boda.":
			"Elle a plus que toi et ne le dit pas. Elle t'offre de l'argent à chaque journée et paie le mariage.",



		"Tu agente lo dice sin mirarte: «firma la separación de"
		+ " bienes».":
			"Ton agent le dit sans te regarder : « signe la séparation de biens ».",
		"La boda cuesta ${0}.":
			"Le mariage coûte {0} $.",
		"FIRMAR EL PRENUPCIAL":
			"SIGNER LE CONTRAT",
		"CASARSE SIN PAPELES":
			"SE MARIER SANS CONTRAT",
		"Firmó sin leerlo y no volvió a mencionarlo en toda la noche.":
			"Elle a signé sans le lire et n'en a plus reparlé de la soirée.",
		"Rompiste el papel delante de ella. Ese gesto lo va a"
		+ " recordar.":
			"Tu as déchiré le papier devant elle. Ce geste, elle s'en souviendra.",
		"Boda pagada: ${0}.":
			"Mariage payé : {0} $.",
		"Piden ${0}: ${1} de tu dinero y ${2} de lo que tienes"
		+ " puesto.":
			"Ils demandent {0} $ : {1} $ de ton argent et {2} $ de ce que tu possèdes.",
		"Con separación de bienes firmada":
			"Avec séparation de biens signée",
		"Sin separación de bienes: entra todo":
			"Sans séparation de biens : tout y passe",
		"FIRMAR Y ACABAR":
			"SIGNER ET EN FINIR",
		"PELEAR LA CIFRA":
			"CONTESTER LE MONTANT",
		"IR A JUICIO":
			"ALLER AU TRIBUNAL",
		"Su abogado tarda dos días en contestar. Baja un poco, y"
		+ " poco.":
			"Son avocat met deux jours à répondre. Il baisse un peu, et à peine.",
		"El juez no le dio todo lo que pedía. Te llevas ${0} menos.":
			"Le juge ne lui a pas tout accordé. Tu gardes {0} $ de plus.",
		"El juez no le dio lo que pedía. Tampoco había mucho que repartir.": "Le juge ne lui a pas donné ce qu'elle demandait. Il n'y avait pas grand-chose à partager.",
		"Salió peor que el acuerdo. Los abogados también se cobran.":
			"C'est sorti pire que l'accord. Les avocats se paient aussi.",
		"Firmaste sin leerlo entero. Se acabó.":
			"Tu as signé sans tout lire. C'est fini.",
		"Se lleva ${0}. Te quedan ${1}.":
			"Elle emporte {0} $. Il te reste {1} $.",

		"Reservaste sin decirle por qué, y {0} bajó vestida para algo que no sabe qué"
		+ " es. El anillo lleva un mes pagado y lo llevas encima.":
			"Tu as réservé sans lui dire pourquoi, et {0} est descendue habillée pour"
			+ " quelque chose qu'elle ne sait pas nommer. La bague est payée depuis un mois et"
			+ " tu l'as sur toi.",
		"PEDÍRSELO ESTA NOCHE":
			"LA DEMANDER CE SOIR",
		"LO QUE FIRMÁIS":
			"CE QUE VOUS SIGNEZ",
		"Tu agente lleva tres días pidiendo veinte minutos. Trae una carpeta y no la ha"
		+ " abierto delante de nadie.":
			"Ton agent réclame vingt minutes depuis trois jours. Il a une chemise sous le"
			+ " bras et ne l'a ouverte devant personne.",
		"ESCUCHARLE":
			"L'ECOUTER",
		"NO HAY NADA QUE FIRMAR":
			"IL N'Y A RIEN A SIGNER",

		"UN FAVOR PARA SU HERMANO":
			"UN SERVICE POUR SON FRERE",
		"El hermano de {0} tiene un negocio que va a salir seguro y le falta el"
		+ " arranque. Ella no lo pide para ella, y eso es justo lo que hace difícil decir"
		+ " que no.":
			"Le frère de {0} a une affaire qui ne peut pas rater et il ne manque que la"
			+ " mise de départ. Elle ne demande pas pour elle, et c'est justement ce qui rend"
			+ " le refus difficile.",
		"ADELANTARLE EL DINERO":
			"AVANCER L'ARGENT",
		"QUE LO PIDA AL BANCO":
			"QU'IL AILLE VOIR SA BANQUE",
		"Tranquila, cariñosa y sin dramas. Nunca te pide explicaciones.":
			"Calme, affectueuse et sans drames. Elle ne te demande jamais de comptes.",
		"Su abogado no negocia. Pone dos papeles sobre la mesa y te dice que firmes"
		+ " uno.":
			"Son avocat ne négocie pas. Il pose deux papiers sur la table et te dit d'en"
			+ " signer un.",
		"No hay tercera opción, y él lo sabe desde el día que os conocisteis.":
			"Il n'y a pas de troisième option, et il le sait depuis le jour où vous vous"
			+ " êtes rencontrés.",
		"No hay tercera opción.":
			"Il n'y a pas de troisième option.",
		"Se fue con una maleta y dejó el resto. Su abogado llamará el lunes.": "Elle est partie avec une valise et a laissé le reste. Son avocat appellera lundi.",
		"Todavía estáis casados. Eso se firma, no se dice.": "Vous êtes encore mariés. Ça se signe, ça ne se dit pas.",
		"La separación de bienes que firmasteis recorta las dos.": "La séparation de biens que vous avez signée réduit les deux.",
		"PAGAR Y QUEDÁRTELA · ${0}": "PAYER ET LA GARDER · {0} $",
		"Pagaste por tu propia casa. El papel valió justo eso.": "Tu as payé pour ta propre maison. Le papier valait exactement ça.",
		"${0}, y las llaves siguen siendo tuyas.": "{0} $, et les clés restent les tiennes.",
		"Firmaste el otro. Cinco años pagando lo que ya no está en tu cuenta.": "Tu as signé l'autre. Cinq ans à payer ce qui n'est plus sur ton compte.",
		"Con ella no hay reparto que negociar: su abogado te hará elegir entre la casa y cinco temporadas de tu ficha.": "Avec elle il n'y a rien à partager : son avocat te fera choisir entre la maison et cinq saisons de ton salaire.",
		"Eliges tú, y se elige esta semana.": "C'est toi qui choisis, et c'est cette semaine.",
		"SU ABOGADO YA LLAMÓ": "SON AVOCAT A APPELE",
		"LA CASA · ${0}":
			"LA MAISON · {0} $",
				"{0} DE TU FICHA · ${1} POR PARTIDO · {2} TEMPORADAS":
			"{0} DE TON SALAIRE · {1} $ PAR MATCH · {2} SAISONS",
		"Con ella este papel es una acusación.":
			"Avec elle ce papier est une accusation.",
		"A ella el dinero le da igual.":
			"L'argent lui est égal.",
		"LA CASA":
			"LA MAISON",
		"EL {0}% DE TU FICHA · {1} TEMPORADAS":
			"{0} % DE TON SALAIRE · {1} SAISONS",
		"La casa que tienes vale ${0}. La ficha, ${1} por partido.":
			"Ta maison vaut {0} $. Le salaire, {1} $ par match.",
		"Recogiste en dos cajas. La vitrina se quedó donde estaba.":
			"Tu as fait deux cartons. La vitrine est restée où elle était.",
		"La casa es suya, y todo lo que le metiste dentro.":
			"La maison est à elle, et tout ce que tu y as mis.",
		"Firmaste el otro. Cinco años de que cada partido rinda la mitad.":
			"Tu as signé l'autre. Cinq ans où chaque match rapporte moitié moins.",
		"${0} por partido, y sube si tú subes.":
			"{0} $ par match, et ça monte si tu montes.",
		"A ella el dinero le da igual: firmar apenas le va a doler.":
			"L'argent lui est égal : signer ne lui fera presque rien.",
		"Con ella este papel es una acusación. Y es de quien más te protege.":
			"Avec elle ce papier est une accusation. Et c'est d'elle qu'il te protège le"
			+ " plus.",
		"Le va a doler más de lo que va a decir.":
			"Ça lui fera plus mal qu'elle ne le dira.",

		"Va a vibrar tres veces. Contestar es perderla a ella.":
			"Ça va vibrer trois fois. Répondre, c'est la perdre elle.",
		"Aguantados sin mirar: {0} de {1}":
			"Tenus sans regarder : {0} sur {1}",
		"Ella se calla y espera a que termines. Se le fue lo que iba a decir.":
			"Elle se tait et attend que tu finisses. Ce qu'elle allait dire est parti.",
		"No te contó nada. Estabas en otra cosa.":
			"Elle ne t'a rien raconté. Tu étais ailleurs.",
		"CONTESTAR":
			"REPONDRE",
		"GUARDAR EL TELÉFONO":
			"RANGER LE TELEPHONE",
		"PEDÍRSELO":
			"LA DEMANDER",
		"Lleváis dos temporadas viviendo juntos y el anillo está"
		+ " pagado desde hace un mes. Tu agente quiere hablar contigo"
		+ " antes de que se lo pidas.":
			"Vous vivez ensemble depuis deux saisons et la bague est payée depuis un mois. Ton agent veut te parler avant que tu ne la demandes.",
		"HABLAR CON ÉL":
			"L'ECOUTER",
		"¿LOS TIRAS TÚ?":
			"TU LES TIRES ?",
		"{0} ha fallado dos penales este año y en el vestuario nadie dice nada. Llevas el brazalete: el siguiente lo decides tú.":
			"{0} a raté deux penaltys cette année et personne ne dit rien dans le vestiaire. Tu portes le brassard : le prochain, c'est toi qui décides.",
		"LOS COBRO YO":
			"JE LES TIRE",
		"SIGUE ÉL":
			"IL LES GARDE",
		"EL PUESTO QUE QUERÍAS":
			"LE POSTE QUE TU VOULAIS",
		"Tres años seguidos siendo el goleador del equipo desde donde no querías jugar. El técnico te para en el pasillo: el {0} es tuyo si lo quieres.":
			"Trois ans de suite meilleur buteur de l'équipe depuis un poste que tu ne voulais pas. Le coach t'arrête dans le couloir : le poste de {0} est à toi si tu le veux.",
		"ES MÍO":
			"IL EST A MOI",
		"ME QUEDO DONDE ESTOY":
			"JE RESTE OU JE SUIS",
		"EL RIVAL DE LA DÉCADA":
			"LE RIVAL DE LA DECENNIE",
		"SE LLEVA TU LIGA OTRA VEZ":
			"IL REPREND TON TITRE",
		"LIGAS SEGUIDAS DE ELLOS":
			"TITRES D'AFFILEE POUR EUX",
		"sus ligas":
			"leurs titres",
		"las tuyas":
			"les tiens",
		"sus goles contra ti":
			"ses buts contre toi",
		"Tres años viéndolos levantar la liga que querías. No abre la boca: la cifra habla por él, y dice que el año que viene vuelve.":
			"Trois ans à les regarder soulever le titre que tu voulais. Il n'ouvre pas la bouche : le chiffre parle pour lui, et il dit qu'il revient l'an prochain.",
		"EL SELECCIONADOR SE ACUERDA":
			"LE SELECTIONNEUR SE SOUVIENT",
		"TU PRIMERA CONVOCATORIA, TARDE":
			"TA PREMIERE SELECTION, TARDIVE",
		"TEMPORADAS SIN LLAMARTE":
			"SAISONS SANS T'APPELER",
		"goles de liga":
			"buts en championnat",
		"años sin llamada":
			"années sans appel",
		"edad":
			"âge",
		"Dos temporadas de goleador en primera y el teléfono sin sonar. Hoy viene en persona: no pide perdón, pero te mira a los ojos.":
			"Deux saisons de buteur en première division et le téléphone muet. Aujourd'hui il vient en personne : il ne s'excuse pas, mais il te regarde dans les yeux.",
		"EL PRESIDENTE TE PIDE QUEDARTE":
			"LE PRESIDENT TE DEMANDE DE RESTER",
		"HAN PAGADO TU CLÁUSULA":
			"ILS ONT PAYE TA CLAUSE",
		"TEMPORADAS EN EL CLUB":
			"SAISONS AU CLUB",
		"la cláusula":
			"la clause",
		"balones de oro":
			"titres de Joueur de l'Année",
		"Baja al césped sin prensa ni cámaras. No puede retener a quien paga la cláusula, y lo sabe: sólo viene a pedírtelo. La oferta sigue en MERCADO.":
			"Il descend sur la pelouse sans presse ni caméras. Il ne peut pas retenir celui dont la clause est payée, et il le sait : il vient juste te le demander. L'offre reste dans MERCATO.",
		"OTRO AÑO":
			"UNE AUTRE ANNEE",
		"SU ABOGADO HA LLAMADO":
			"SON AVOCAT A APPELE",
		"No fue una discusión ni una noche mala: fue una carta. {0}"
		+ " quiere el divorcio, y su abogado ya ha puesto una cifra"
		+ " encima de la mesa.":
			"Ce n'était pas une dispute ni une mauvaise soirée : c'était une lettre. {0} veut divorcer, et son avocat a déjà posé un montant sur la table.",
		"VER LA CIFRA":
			"VOIR LE MONTANT",
		"NO ABRIR ESA CARTA":
			"NE PAS OUVRIR CETTE LETTRE",




		"Deja el teléfono boca abajo y escúchala.":
			"Pose ton téléphone face contre table et écoute-la.",
		"Si vibra, no pasa nada. Es no tocarlo.":
			"S'il vibre, ce n'est rien. Il suffit de ne pas y toucher.",
		"Avisos ignorados: {0} de {1}":
			"Notifications ignorées : {0} sur {1}",
		"Ella se calla y espera a que termines.":
			"Elle se tait et attend que tu aies fini.",
		"No miraste el teléfono ni una vez. Ella lo notó.":
			"Tu n'as pas regardé ton téléphone une seule fois. Elle l'a remarqué.",
		"Contestaste alguna. La noche se salvó a medias.":
			"Tu en as pris quelques-unes. La soirée s'est à moitié sauvée.",
		"Contestaste todas. Pidió la cuenta antes del postre.":
			"Tu les as toutes prises. Elle a demandé l'addition avant le dessert.",
		"Pregunta {0} de {1}":
			"Question {0} sur {1}",
		"Te acordabas de todo. No se lo esperaba.":
			"Tu te souvenais de tout. Elle ne s'y attendait pas.",
		"Casi todo. Se rió del que fallaste.":
			"Presque tout. Elle a ri de celle que tu as ratée.",
		"Uno de tres. «¿Me estabas escuchando?»":
			"Une sur trois. « Tu m'écoutais, au moins ? »",
		"Ni uno. Esa noche no la escuchaste.":
			"Aucune. Ce soir-là, tu ne l'écoutais pas.",
		"Aciertos: {0} de {1}":
			"Bonnes réponses : {0} sur {1}",
		"Ronda {0} de {1}":
			"Manche {0} sur {1}",
		"DECIRLO AHORA":
			"LE DIRE MAINTENANT",
		"Dijiste lo justo y cuando tocaba. Te presentó a los suyos.":
			"Tu as dit ce qu'il fallait, quand il fallait. Elle t'a présenté aux siens.",
		"Alguna la acertaste. Al salir te tomó del brazo.":
			"Tu en as réussi quelques-unes. En sortant, elle t'a pris le bras.",
		"Hablaste siempre a destiempo. Salisteis pronto.":
			"Tu as toujours parlé au mauvais moment. Vous êtes partis tôt.",
		"Quiere el {0} de tu sueldo, todos los meses.":
			"Elle veut {0} de ton salaire, tous les mois.",
		"Serían ${0} por partido.":
			"Cela ferait {0} $ par match.",
		"NO OFRECERLE NADA":
			"NE RIEN LUI OFFRIR",
		"OFRECERLE LA MITAD":
			"LUI OFFRIR LA MOITIE",
		"OFRECERLE CASI TODO":
			"LUI OFFRIR PRESQUE TOUT",
		"DARLE LO QUE PIDE":
			"LUI DONNER CE QU'ELLE DEMANDE",
		"«¿{0}? No me hagas esto.» Baja al {1}.":
			"« {0} ? Ne me fais pas ça. » Elle descend à {1}.",
		"Trato hecho: el {0} de tu sueldo, cada partido.":
			"Marché conclu : {0} de ton salaire, à chaque match.",
		"Sube tu mantenimiento en ${0} por partido.":
			"Augmente ton entretien de {0} $ par match.",
		"Se levantó de la mesa sin acabar la frase.":
			"Elle s'est levée de table sans finir sa phrase.",
		"Esto no queda así.":
			"Ça ne va pas en rester là.",
		"Creció en un pueblo de la costa":
			"Elle a grandi dans un village au bord de la mer",
		"Creció en un barrio del norte":
			"Elle a grandi dans un quartier du nord",
		"Se crió en el campo, lejos de todo":
			"Elle a été élevée à la campagne, loin de tout",
		"Es de una ciudad de montaña":
			"Elle vient d'une ville de montagne",
		"Cambió de casa cada dos años":
			"Elle a déménagé tous les deux ans",
		"Nunca ha salido de esta ciudad":
			"Elle n'a jamais quitté cette ville",
		"Vivió un tiempo en el extranjero":
			"Elle a vécu un temps à l'étranger",
		"Es del mismo barrio que tú":
			"Elle est du même quartier que toi",
		"No soporta que le hablen de fútbol":
			"Elle ne supporte pas qu'on lui parle de football",
		"No soporta la gente que llega tarde":
			"Elle ne supporte pas les gens en retard",
		"No soporta las fotos sin avisar":
			"Elle ne supporte pas les photos sans prévenir",
		"No soporta el ruido de los sitios de moda":
			"Elle ne supporte pas le bruit des endroits à la mode",
		"No soporta que le mientan por educación":
			"Elle ne supporte pas qu'on lui mente par politesse",
		"No soporta madrugar":
			"Elle ne supporte pas de se lever tôt",
		"No soporta que le pidan permiso para todo":
			"Elle ne supporte pas qu'on lui demande la permission pour tout",
		"No soporta el mar":
			"Elle ne supporte pas la mer",
		"Pidió pescado y no se lo acabó":
			"Elle a pris du poisson et ne l'a pas fini",
		"Pidió lo mismo que tú":
			"Elle a pris la même chose que toi",
		"Pidió sólo postre":
			"Elle n'a pris qu'un dessert",
		"Pidió el plato más raro de la carta":
			"Elle a pris le plat le plus étrange de la carte",
		"No pidió nada, dijo que no tenía hambre":
			"Elle n'a rien pris, elle a dit qu'elle n'avait pas faim",
		"Pidió carne muy hecha":
			"Elle a pris sa viande bien cuite",
		"Pidió que eligieras tú":
			"Elle t'a demandé de choisir",
		"Pidió la sopa del día":
			"Elle a pris la soupe du jour",
		"Ella habla con gente que no conoces. Espera el hueco.":
			"Elle parle à des gens que tu ne connais pas. Attends le creux.",
		"Alguien pregunta a qué te dedicas. No es el momento de"
		+ " decirlo.":
			"Quelqu'un demande ce que tu fais dans la vie. Ce n'est pas le moment de le dire.",
		"Se gira hacia ti. Ahora sí.":
			"Elle se tourne vers toi. Maintenant.",
		"¿De dónde te dijo que era?":
			"D'où t'a-t-elle dit qu'elle venait ?",
		"¿Qué te dijo que no soporta?":
			"Qu'est-ce qu'elle t'a dit ne pas supporter ?",
		"¿Qué pidió aquella noche?":
			"Qu'a-t-elle commandé ce soir-là ?",
		"LA PRIMERA CENA":
			"LE PREMIER DINER",
		"Mesa para dos y el teléfono boca abajo. Esta noche va de"
		+ " escucharla — y de que no te pillen mirando la pantalla.":
			"Table pour deux et téléphone face contre table. Ce soir, il s'agit de l'écouter — et de ne pas se faire prendre à regarder l'écran.",
		"ESTA SEMANA NO":
			"PAS CETTE SEMAINE",
		"LO QUE TE CONTÓ":
			"CE QU'ELLE T'A RACONTE",
		"Una copa y la conversación de la otra noche encima de la"
		+ " mesa. Vas a tener que acordarte de lo que te dijo.":
			"Un verre, et la conversation de l'autre soir de nouveau sur la table. Tu vas devoir te rappeler ce qu'elle t'a dit.",
		"LA INAUGURACIÓN DE ELLA":
			"SON VERNISSAGE",
		"Te lleva a una exposición donde no conoces a nadie. Aquí no"
		+ " se trata de entender los cuadros: se trata de saber cuándo"
		+ " hablar.":
			"Elle t'emmène à une exposition où tu ne connais personne. Il ne s'agit pas de comprendre les tableaux : il s'agit de savoir quand parler.",
		"HABLEMOS DE DINERO":
			"PARLONS D'ARGENT",
		"{0} ha esperado a que acabe la cena para decirlo, y lo dice"
		+ " sin rodeos: quiere una cantidad fija todos los meses, o esto"
		+ " no tiene sentido.":
			"{0} a attendu la fin du dîner pour le dire, et elle le dit sans détour : elle veut une somme fixe tous les mois, sinon tout cela n'a aucun sens.",
		"HABLARLO":
			"EN PARLER",
		"NO PIENSO DISCUTIR ESO":
			"JE N'EN DISCUTERAI PAS",


		"PRÓRROGA": "PROLONG.",
		"DESCANSO · FINAL": "PAUSE · FINALE",
		"DESCANSO · DERBI": "PAUSE · DERBY",
		"SEGUNDO TIEMPO EXTRA": "2E PROLONGATION",
		"SI NADIE MARCA, PENALTIS": "SANS BUT, TIRS AU BUT",
		"QUINCE MINUTOS PARA AGUANTAR": "15 MINUTES A TENIR",
		"QUINCE MINUTOS PARA REMONTAR": "15 MINUTES POUR REVENIR",
		"SI ACABA ASÍ: PRÓRROGA": "AINSI : PROLONGATION",
		"SI ACABA ASÍ: CAMPEONES": "AINSI : CHAMPIONS",
		"SI ACABA ASÍ: SUBCAMPEONES": "AINSI : VICE-CHAMPIONS",
		"SI ACABA ASÍ: PASÁIS": "AINSI : QUALIFIES",
		"SI ACABA ASÍ: FUERA": "AINSI : ELIMINES",
		"GLOBAL {0}-{1} · PRÓRROGA": "CUMUL {0}-{1} · PROLONG.",
		"GLOBAL {0}-{1} · PASÁIS": "CUMUL {0}-{1} · QUALIF",
		"GLOBAL {0}-{1} · FUERA": "CUMUL {0}-{1} · DEHORS",
		"10 CONTRA 11": "10 CONTRE 11",
		"11 CONTRA 10": "11 CONTRE 10",
		"LÍDER": "1ER",
		"EN ASCENSO": "EN MONTEE",
		"EN DESCENSO": "RELEGABLE",
		"IGUALADO CON EL LÍDER": "A HAUTEUR DU LEADER",
		"IGUALADO CON EL ASCENSO": "A HAUTEUR DE LA MONTEE",
		"IGUALADO CON EL DESCENSO": "A HAUTEUR DE LA DESCENTE",
		"A {0} PTS DEL LÍDER": "A {0} PTS DU LEADER",
		"A {0} PTS DEL ASCENSO": "A {0} PTS DE MONTER",
		"A {0} PTS DEL DESCENSO": "A {0} PTS DE DESCENDRE",
		"ÚLTIMA JORNADA": "ULTIME JOURNEE",
		"El míster se ha ido a por {0} delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"L'entraîneur s'en prend à {0} devant tout le vestiaire. Personne ne lève les yeux du sol. Tu es assis à côté de lui.",
		"Lo has dicho delante de todos. El míster no lo olvidará, y {0} tampoco.":
			"Tu l'as dit devant tous. Le coach ne l'oubliera pas, {0} non plus.",
		"Te has callado. {0} se ha dado cuenta.": "Tu t'es tu. {0} l'a remarqué.",
		"{0}, nos has dejado con diez. Hoy no me hables.":
			"{0}, à dix à cause de toi. Pas un mot.",
		"{0}, {1} goles. ¿Vas a parar alguno en la segunda?":
			"{0}, {1} buts. Tu vas en arrêter un en 2e période ?",
		"LA HA TOMADO CON ÉL": "IL S'EN PREND A LUI",
		"El míster se ha ido a por un compañero delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.":
			"L'entraîneur s'en prend à un coéquipier devant tout le vestiaire. Personne ne lève les yeux du sol. Tu es assis à côté de lui.",
		"DAR LA CARA POR ÉL": "PRENDRE SA DEFENSE",
		"QUEDARTE CALLADO": "TE TAIRE",

		"PREGUNTA DE VESTUARIO": "LE QUIZ DU VESTIAIRE",
		"En el banco, alguien saca el móvil y lanza una pregunta a todo el vestuario.": "Sur le banc, quelqu'un sort son téléphone et lance une question à tout le vestiaire.",
		"¿De dónde llegó {0} a {1}?": "Avant {1}, d'où venait {0} ?",
		"ACIERTA Y SUMAS +{0} DE ENERGÍA AL PITIDO": "BONNE REPONSE : +{0} D'ENERGIE AU COUP DE SIFFLET FINAL",
		"¡Exacto! Llegó de {0}. +{1} de energía al pitido.": "Exact ! Il venait de {0}. +{1} d'énergie au coup de sifflet final.",
		"No. Llegó de {0}.": "Non. Il venait de {0}.",
		"Esto no es lo que somos. Tú tira del carro y los demás irán detrás.":
			"Ce n'est pas nous, ça. Toi, montre la voie et les autres suivront.",
		"Nos hemos salido del plan. Volved a lo de siempre y el resto llegará.":
			"On est sortis du plan. Revenez à l'essentiel et le reste viendra.",
		"Me dais vergüenza. A todos. Esa camiseta no se regala así.":
			"Vous me faites honte. Tous. Ce maillot se mérite.",
		"Ya está. Que por lo menos no sea peor.": "C'est fini. Au moins, pas pire.",
		"Tú no eres éste. Te conozco: sal y demuéstramelo.":
			"C'est pas toi, ça. Je te connais : prouve-le.",
		"Haz lo sencillo. Lo que te ha traído hasta aquí, nada más.":
			"Fais simple. Ce qui t'a amené jusqu'ici, rien de plus.",
		"Así no. Si en diez minutos sigues igual, te cambio.":
			"Non. Dans dix minutes, si c'est pareil, tu sors.",
		"Lo que esperaba de ti. Ni más ni menos.":
			"Ce que j'attendais. Ni plus, ni moins.",
		"Un gol no es nada. Dádsela a él, que sabe qué hacer con ella.":
			"Un but, c'est rien. Donnez-lui le ballon, il sait y faire.",
		"Vamos bien aunque no lo parezca. Mismo plan, y el gol llegará.":
			"On est bien, ça ne se voit pas. Même plan, et le but viendra.",
		"Uno abajo y nadie se ha manchado la camiseta. Quiero verlo en la segunda.":
			"Mené d'un but et personne n'a sali son maillot. Je veux voir ça après.",
		"Un gol abajo. Haré cambios.": "Mené d'un but. Je change.",
		"Cero a cero. La próxima que tengas, adentro. Confío en ti.":
			"Zéro à zéro. La prochaine, tu la mets. J'ai confiance.",
		"Cero a cero, como estaba pensado. Paciencia, que el gol viene solo.":
			"Zéro à zéro, comme prévu. Patience, le but viendra tout seul.",
		"Cero a cero y nadie ha probado al portero. Eso se acabó.":
			"Zéro à zéro, pas un tir sur leur gardien. C'est fini.",
		"Cero a cero. Seguid así y ya veremos.":
			"Zéro à zéro. Continuez et on verra.",
		"Empate. Marca tú la diferencia, que para eso te traje.":
			"Égalité. Fais la différence : je t'ai pris pour ça.",
		"Empate. No cambiéis nada: si seguimos así, el partido es nuestro.":
			"Égalité. Ne changez rien : si ça continue, le match est à nous.",
		"Un empate no me vale. Quiero más de todos, y de ti el primero.":
			"Un nul ne me suffit pas. Plus de tous, et de toi d'abord.",
		"Empate. Algo tocaremos.": "Nul. On ajustera.",
		"Bien. Seguid buscándole, que el segundo lo lleva en las botas.":
			"Bien. Cherchez-le encore, le deuxième, il l'a dans les pieds.",
		"Ganamos haciendo lo nuestro. Seguid igual.":
			"On mène avec notre jeu. Continuez pareil.",
		"Uno a cero no es nada. No quiero ver ni un paso atrás.":
			"Un à zéro, ce n'est rien. Pas un seul pas en arrière.",
		"Ganamos. No toquéis nada.": "On mène. Ne changez rien.",
		"Esto es lo que sois. Disfrutadlo, pero sin regalar nada.":
			"Voilà qui vous êtes. Profitez-en, mais sans rien offrir.",
		"El plan funciona. Cuarenta y cinco minutos más de lo mismo.":
			"Le plan marche. Quarante-cinq minutes de plus, pareil.",
		"Bien. Y ahora no quiero ver a nadie relajándose. A nadie.":
			"Bien. Maintenant, personne ne se relâche. Personne.",
		"Está hecho. Aprovecharé para mover el banquillo.":
			"C'est plié. J'en profiterai pour faire tourner.",
		"{0} no vuelve. Los demás, a correr también por él.":
			"{0} ne revient pas. Les autres, courez pour lui.",
		"Nos lo han metido en el peor minuto. Olvidadlo ya, o nos come la segunda.":
			"Ils l'ont mis au pire moment. Oubliez ça, ou la seconde nous mange.",
		"Íbamos perdiendo y lo habéis levantado. Eso no os lo regala nadie.":
			"On était menés et vous l'avez renversé. Personne ne l'offre.",
		"Íbamos ganando y lo hemos regalado. Eso no vuelve a pasar.":
			"On menait et on l'a offert. Ça n'arrivera plus.",
		"El gol en el mejor momento. Ahora están tocados: a por el siguiente.":
			"Le but au bon moment. Ils sont touchés : allez chercher le suivant.",
		"Con diez. Cada uno corre por dos, y sin una queja.":
			"À dix. Chacun court pour deux, sans une plainte.",
		"Tienen uno menos. Que lo noten sus piernas, no las nuestras.":
			"Ils sont à dix. Que leurs jambes le sentent, pas les nôtres.",
		"Si llegamos a los penaltis, quiero once que se tengan en pie.":
			"Si on va aux tirs au but, je veux onze gars debout.",
		"Quince minutos. Aguantadlos como si fueran noventa.":
			"Quinze minutes. Tenez-les comme un match entier.",
		"Quince minutos para darle la vuelta. Lo que os quede, ahí fuera.":
			"Quinze minutes pour renverser ça. Laissez tout sur le terrain.",
		"Así, prórroga. Y nadie quiere prórroga.":
			"Là, prolongation. Personne n'en veut.",
		"Ahora mismo pasamos. Que no se os note que lo sabéis.":
			"Là, on passe. Qu'on ne voie pas que vous le savez.",
		"Ahora mismo estamos fuera. Cuarenta y cinco minutos para cambiarlo.":
			"Là, on est dehors. Quarante-cinq minutes pour changer ça.",
		"Una final no se juega: se gana. El que se esconda, al banquillo.":
			"Une finale ne se joue pas, elle se gagne. Qui se cache, au banc.",
		"Cuarenta y cinco minutos entre vosotros y la copa. Ni uno menos.":
			"Quarante-cinq minutes entre vous et la coupe. Pas une de moins.",
		"Nadie se acuerda de los subcampeones. Nadie. Salid a por ella.":
			"Qui se souvient des finalistes ? Personne. Allez la chercher.",
		"¿Los oís? Pues que sea lo último que cantan hoy.":
			"Vous les entendez ? Qu'ils ne chantent plus.",
		"Esto no es un partido más y lo sabéis. Hoy no se pierde.":
			"Ce match est à part, vous le savez. On ne le perd pas.",
		"Media ciudad está callada ahora mismo. Que siga así.":
			"La moitié de la ville se tait, là. Que ça dure.",
		"Así acabado, la tabla se nos pone cuesta arriba. Hay que darle la vuelta.":
			"Si ça finit comme ça, le classement se complique. Il faut renverser ça.",
		"Un punto aquí no arregla nada. Quedan pocos partidos y éste es uno.":
			"Un point ici ne règle rien. Il reste peu de matchs, et c'en est un.",
		"Si esto acaba así, la tabla se mueve a nuestro favor. No lo tiréis.":
			"Si ça finit ainsi, le classement bouge pour nous. Ne gâchez rien.",


		"NO SALES": "REMPLACE",
		"Le metiste un balonazo a tu propio banquillo. No hacía falta nada más.":
			"Tu as envoyé un ballon dans ton propre banc. Il n'en fallait pas plus.",
		"{0} ocasiones tiradas antes del descanso. Ya lo había decidido en la tercera.":
			"{0} occasions gâchées avant la pause. J'avais décidé dès la troisième.",
		"Cuarenta y cinco minutos y no te he visto. Hoy se acabó aquí.":
			"Quarante-cinq minutes et je ne t'ai pas vu. Aujourd'hui ça s'arrête là.",



		"VAS POR DELANTE": "TU MENES",
		"VAS POR DETRÁS": "TU ES MENE",
		"TODO IGUAL": "EGALITE",
		"SEGUNDA PARTE": "2E MI-TEMPS",

		"No la tenías: en el túnel cuesta el triple.":
			"Tu n'en avais pas : dans le tunnel, c'est le triple.",
		"energía": "énergie",
		"tus minutos": "tes minutes",
		"Te están pasando por encima. Esto no se arregla solo en la segunda.":
			"Ils te passent dessus. Ça ne se règle pas tout seul en seconde période.",
		"Desde la banca también se juega. Cuando te toque, no preguntes.":
			"Sur le banc aussi on joue. Quand ce sera ton tour, ne demande pas.",
		"A ti no te he visto. O apareces en la segunda, o te sientas.":
			"Toi, je ne t'ai pas vu. Soit tu te montres en 2e période, soit tu sors.",
		"Vas fundido. Piensa bien dónde gastas lo que te queda.":
			"Tu es cuit. Réfléchis bien à où tu dépenses ce qu'il te reste.",
		"Un gol. Sólo eso os separa, y quedan cuarenta y cinco minutos.":
			"Un but. Rien que ça vous sépare, et il reste quarante-cinq minutes.",
		"Cero a cero. Esto lo gana el primero que acierte.":
			"Zéro à zéro. Ça se gagne au premier qui ne se trompe pas.",
		"Empate. El que se canse primero, pierde.":
			"Match nul. Le premier qui fatigue, perd.",
		"Un gol no es nada. Salid como si fuerais perdiendo.":
			"Un but d'avance, ce n'est rien. Sortez comme si vous perdiez.",
		"Bien. Ahora lo difícil: no regalar lo que ya es vuestro.":
			"Bien. Maintenant le dur : ne pas offrir ce qui est déjà à vous.",

		"EL BALÓN ES TUYO": "LE BALLON EST A TOI",
		"EL BALÓN ES DE LOS DOS": "UN BALLON POUR DEUX",
		"UN BALÓN PARA CADA UNO": "UN BALLON CHACUN",
		"PASES TUYOS, GOLES DE {0}": "TES PASSES, LES BUTS DE {0}",
		"GOLES ENTRE LOS DOS": "BUTS A VOUS DEUX",
		"Te lo dio a ti. Sabe de dónde salieron.": "Il te l'a donné. Il sait d'où ils viennent.",
		"{0} tuyos, {1} suyos. Cada uno con el suyo.": "{0} à toi, {1} à lui. Chacun le sien.",
		"DOS HAT-TRICKS": "DEUX TRIPLES",
		"GOLES EN UN PARTIDO": "BUTS EN UN MATCH",
		"Firmado por todos. Ya sabes dónde va.": "Signé par tout le vestiaire. Tu sais où il va.",
		"INTERCAMBIO": "ECHANGE",
		"SU CAMISETA": "SON MAILLOT",
		"La suya se queda contigo. La tuya se va con él.": "Le sien reste avec toi. Le tien part avec lui.",
		"TE PIDE LA CAMISETA": "IL VEUT TON MAILLOT",
		"{0} te espera en el círculo con la suya ya enrollada en la mano. La grada todavía no se va, y desde arriba se ve todo.": "{0} t'attend dans le rond central, le sien déjà roulé dans la main. Les tribunes ne sont pas vides, et de là-haut on voit tout.",
		"CAMBIARLA": "L'ECHANGER",
		"DÁRSELA SIN PEDIR NADA": "LE DONNER SANS RIEN",
		"NO SE CAMBIA": "JE GARDE LE MIEN",
		"BALONES": "BALLONS",
		"PLAYERAS": "MAILLOTS",
		"VITRINA DE BALONES": "VITRINE BALLONS",



		"VITRINA TORRE": "VITRINE TOUR",
		"VITRINA GALERÍA": "VITRINE GALERIE",
		"VITRINA DE PREMIOS": "VITRINE DES PRIX",
		"Tres baldas en un metro: para el rincón que no da más.":
			"Trois étagères en un mètre : pour le coin qui n'en peut plus.",
		"Cuatro metros de mostrador para alinear el palmarés.":
			"Quatre mètres de comptoir pour aligner le palmarès.",
		"Solo para lo tuyo: los galardones individuales.":
			"Rien que pour toi : les trophées individuels.",
		"Sólo para lo tuyo: los galardones individuales.":
			"Rien que pour toi : les trophées individuels.",
		"Cada balón, con el día y el rival al que se lo metiste.": "Chaque ballon, avec le jour et l'adversaire à qui tu l'as fait.",
		"Los balones de tus hat-tricks y las camisetas que cambiaste.": "Les ballons de tes triplés et les maillots que tu as échangés.",
		"CAMBIO EN EL BANQUILLO": "CHANGEMENT DE COACH",
		"EL NUEVO": "LE NOUVEAU",
		"TÉCNICO NUEVO": "NOUVEAU COACH",
		"Destituyen a {0}. {1}": "{0} est limogé. {1}",
		"TE QUERÍA A TI": "IL T'A DEMANDE",
		"Pidió tu nombre antes de firmar. Vienes de serie en su plan.": "Il a demandé ton nom avant de signer. Tu es de série dans son plan.",
		"NO TOCA LO QUE FUNCIONA": "ON NE TOUCHE A RIEN",
		"Ha visto los vídeos y no piensa cambiar lo que ya andaba.": "Il a vu les vidéos et ne changera pas ce qui marchait.",
		"EMPEZAMOS DE CERO": "ON REPART DE ZERO",
		"No te conoce de nada. Todo el mundo parte del mismo sitio.": "Il ne te connaît pas. Tout le monde part du même endroit.",
		"TE LO VAS A GANAR": "TU VAS LE MERITER",
		"Dice que aquí no hay intocables, y te mira a ti al decirlo.": "Il dit qu'ici personne n'est intouchable, et il te regarde en le disant.",
		"NO CUENTA CONTIGO": "IL NE COMPTE PAS SUR TOI",
		"Tiene otro plan, y en su pizarra tu nombre no aparece.": "Il a un autre plan, et ton nom n'est pas sur son tableau.",

		"TÉCNICOS": "COACHS",
		"RANKING DE TÉCNICOS": "CLASSEMENT COACHS",
		"Los técnicos del mundo, ordenados por sus estrellas.": "Les entraîneurs du monde, classés par leurs étoiles.",
		"Los trofeos cuentan desde la temporada {0}.": "Les trophées comptent depuis la saison {0}.",
		"1ª DIVISIÓN": "1RE DIV.",
		"EN EL PARO": "SANS CLUB",
		"Nadie en esta lista todavía. Los que echan de su club pasan aquí hasta que otro los ficha.": "Personne dans cette liste pour l'instant. Ceux qui sont limogés arrivent ici jusqu'à ce qu'un autre club les engage.",
		"TU TÉCNICO: {0}° DE {1}": "TON COACH: #{0} SUR {1}",
		"En el cargo desde la temporada {0}.": "En poste depuis la saison {0}.",
		"Sin títulos todavía.": "Aucun titre pour l'instant.",

		"MÍSTER": "COACH",
		"2ª DIVISIÓN": "2E DIVISION",
		"técnico": "entraîneur",
		"técnicos": "entraîneurs",
		"técnico sin equipo": "entraîneur sans club",
		"técnicos sin equipo": "entraîneurs sans club",
		"seleccionador": "sélectionneur",
		"seleccionadores": "sélectionneurs",

		"cara de leyenda": "visage de légende",
		"caras de leyenda": "visages de légende",
		"Palmarés real, más lo que ganen desde la temporada {0}.": "Palmarès réel, plus ce qu'ils gagnent depuis la saison {0}.",
		"{0} destituye a {1}. Llega {2}.": "{0} limoge {1}. {2} prend la suite.",

		"BALÓN AL ÁREA": "JEU DIRECT",
		"No quiere elaborar: quiere el balón arriba y gente rematando.": "Il ne veut pas construire : il veut le ballon devant et du monde dans la surface.",
		"TOQUE Y PACIENCIA": "JEU DE POSSESSION",
		"Prefiere diez pases a un balonazo. Aquí se juega con la cabeza.": "Il préfère dix passes à un dégagement. Ici on joue avec la tête.",
		"PRESIÓN ALTA": "PRESSING",
		"Noventa minutos corriendo. El que no llega, descansa.": "Quatre-vingt-dix minutes à courir. Celui qui ne suit pas se repose.",
		"OFICIO": "METIER",
		"Once fijo y partido controlado. Aquí mandan los que ya saben.": "Onze fixe et match maîtrisé. Ici ce sont ceux qui savent qui commandent.",
		"DOBLE PIVOTE": "DOUBLE PIVOT",
		"Dos que barren, uno que piensa y uno arriba. Primero, no perder.": "Deux qui récupèrent, un qui pense et un devant. D'abord, ne pas perdre.",
		"ATAQUE TOTAL": "ATTAQUE TOTALE",
		"Tres atrás y tres arriba. Si nos meten dos, metemos tres.": "Trois derrière, trois devant. S'ils en marquent deux, on en marque trois.",
		"AUTOBÚS": "LE BUS",
		"Cinco atrás y a la contra. Un 1-0 es una goleada.": "Cinq derrière et on joue le contre. Un 1-0, c'est une raclée.",
		"PIZARRA": "TABLEAU",
		"El {0} ya juega el {1} de {2}": "Le {0} joue désormais le {1} de {2}",

		"ESPECIALISTA A BALÓN PARADO": "SPECIALISTE DES COUPS DE PIED ARRETES",
		"Ensaya el balón parado: si eres el lanzador, te llegan muchas más faltas, córners y penales.": "Répète les coups de pied arrêtés : si tu es le tireur, tu as bien plus de coups francs, de corners et de penalties.",
		"EL CÓRNER ES UN PENAL": "LE CORNER EST UN PENALTY",
		"Ensaya el córner: si eres el lanzador, sacas casi el doble de córners y tiras menos faltas.": "Il travaille le corner : si tu es le tireur, tu tires presque deux fois plus de corners et moins de coups francs.",
		"CONTRAGOLPE": "CONTRE-ATTAQUE",
		"Cede el balón y sale a la carrera: más contras y menos posesión.": "Laisse le ballon et part en courant : plus de contres et moins de possession.",
		"AL ÁREA, SIEMPRE": "DANS LA SURFACE, TOUJOURS",
		"Todo por las bandas: llueven centros al área y hay menos disparos desde fuera.": "Tout par les ailes : il pleut des centres dans la surface et moins de frappes de loin.",
		"JUEGO DE ESPACIOS": "JEU DANS LES ESPACES",
		"Busca el pase al hueco: más mano a mano con el portero.": "Cherche la passe dans l'intervalle : plus de face-à-face avec le gardien.",
		"PEGA DESDE FUERA": "FRAPPE DE LOIN",
		"Pide el disparo desde fuera del área: más tiros lejanos.": "Demande la frappe hors de la surface : plus de tirs lointains.",
		"CERROJO": "VERROU",
		"Con ventaja cierra el partido: el rival casi no remonta desde el 75'.": "Avec l'avantage il ferme le match : l'adversaire ne revient presque jamais après la 75e.",
		"FERGIE TIME": "FERGIE TIME",
		"Sus equipos no se rinden: más goles propios en el descuento.": "Ses équipes ne lâchent rien : plus de buts pour vous dans le temps additionnel.",
		"EL ÁREA ES UN CAMPO DE MINAS": "LA SURFACE EST UN CHAMP DE MINES",
		"Juega por dentro y lo derriban: el doble de penales a favor.": "Joue dans l'axe et se fait faucher : deux fois plus de penalties pour vous.",
		"CONFÍA EN EL CHAVAL": "FAIT CONFIANCE AU GAMIN",
		"Apuesta por los jóvenes: hasta los 23 juegas más y antes eres titular.": "Mise sur les jeunes : jusqu'à 23 ans, tu joues plus et tu deviens titulaire plus tôt.",
		"EL BALÓN ES NUESTRO": "LE BALLON EST A NOUS",
		"Con el balón el rival no llega: encaja menos, pero el partido va más lento.": "Avec le ballon l'adversaire n'arrive pas : moins de buts encaissés, mais un match plus lent.",
		"SALE A MORDER": "SORT LES CROCS",
		"Empieza a mil: la primera media hora es de tu equipo, ida y vuelta.": "Démarre à fond : la première demi-heure est à ton équipe, dans les deux sens.",
		"POCAS PERO CLARAS": "PEU MAIS NETTES",
		"Menos ocasiones y mejores: llegan más cerca de la portería, y fallarlas cuesta el doble.": "Moins d'occasions mais meilleures : plus près du but, et les rater coûte deux fois plus.",
		"HOMBRE DE DERBIS": "HOMME DES DERBYS",
		"Se crece en los derbis: más juego y una ocasión más contra el rival de siempre.": "Se transcende dans les derbys : plus de jeu et une occasion de plus contre l'ennemi juré.",
		"CUIDA LAS PIERNAS": "MENAGE LES JAMBES",
		"Menos lesiones y mejor descanso, a cambio de rotarte más.": "Moins de blessures et un meilleur repos, contre plus de rotation.",
		"EL LOCO": "EL LOCO",
		"Ida y vuelta sin freno: más energía por partido y más lesiones.": "Du jeu dans les deux sens sans frein : plus d'énergie par match et plus de blessures.",
		"NO TE FÍAS DEL CHAVAL": "SE MEFIE DU GAMIN",
		"No se fía de los jóvenes: hasta los 23 te cuesta más el puesto.": "Se méfie des jeunes : jusqu'à 23 ans, ta place te coûte plus cher.",
		"BRONCA POR TODO": "GUEULE POUR TOUT",
		"Bronca por todo: cada mal partido te pesa el doble con él.": "Gueule pour tout : chaque mauvais match pèse deux fois plus avec lui.",
		"CARRUSEL": "CARROUSEL",
		"Rota sin parar: te sienta aunque llegues fresco.": "Fait tourner sans arrêt : te met sur le banc même frais.",
		"NO SUELTA UN DURO": "NE LACHE PAS UN SOU",
		"Manda en los fichajes y no suelta un duro: las mejoras de contrato cuestan más.": "Dirige les transferts et ne lâche pas un sou : les revalorisations coûtent plus.",
		"ONCE DE LA SUERTE": "ONZE PORTE-BONHEUR",
		"Si el once ganó, repite: para entrar hay que esperar a que pierda.": "Si le onze a gagné, il le garde : pour entrer, il faut attendre une défaite.",
		"VE ROJAS DONDE NO LAS HAY": "VOIT ROUGE PARTOUT",
		"Sus equipos ven más rojas: jugarás con diez más veces.": "Ses équipes prennent plus de rouges : tu joueras à dix plus souvent.",
		"FUERA DE CASA SE ENCOGE": "SE RECROQUEVILLE A L'EXTERIEUR",
		"Fuera de casa se encoge: el rival aprieta más en su campo.": "Se recroqueville à l'extérieur : l'adversaire pousse plus chez lui.",
		"SU OJITO DERECHO": "SON CHOUCHOU",
		"Tiene favoritos: hasta que te lo ganes, otro juega en tu sitio.": "A ses chouchous : tant que tu ne l'as pas conquis, un autre joue à ta place.",
		"PARTIDOS LOCOS": "MATCHS FOUS",
		"Sus partidos son locos: goleadas en las dos porterías.": "Ses matchs sont fous : des buts à la pelle des deux côtés.",
		"DESPIERTA AL DESCANSO": "SE REVEILLE A LA PAUSE",
		"Sale dormido: nada antes del 25', y el rival manda la primera parte.": "Démarre endormi : rien avant la 25e, et l'adversaire domine la première période.",
		"ONCE DE HIERRO": "ONZE DE FER",
		"Casi no rota: repite el once mientras aguanten las piernas; el que no juega, espera.": "Ne fait presque jamais tourner : garde le même onze tant que les jambes tiennent ; celui qui ne joue pas attend.",
		"LA CULPA ES TUYA": "C'EST TA FAUTE",
		"Tras perder, la culpa es tuya: afición y prensa te lo cobran el doble.": "Après une défaite c'est ta faute : supporters et presse te le font payer double.",
		"REVOLUCIÓN": "REVOLUTION",
		"Llega y manda: lleva al equipo a su dibujo el doble de rápido.": "Il arrive et commande : l'équipe passe à son schéma deux fois plus vite.",
		"LO QUE FUNCIONA NO SE TOCA": "ON NE CHANGE PAS CE QUI MARCHE",
		"Respeta lo heredado: tarda el doble en llevar al equipo a su dibujo.": "Respecte l'héritage : l'équipe met deux fois plus de temps à passer à son schéma.",

		"RASGOS DEL MÍSTER": "TRAITS DU COACH",
		"RASGOS": "TRAITS",
		"RASGO BUENO": "BON TRAIT",
		"RASGO MALO": "MAUVAIS TRAIT",
		"Juega para un técnico con este rasgo para descubrirlo.": "Joue pour un coach qui a ce trait pour le découvrir.",
		"Con la selección no se descubre: juega para un técnico de club con este rasgo.": "Ne se découvre pas en sélection : joue pour un coach de club qui a ce trait.",
		"Los rasgos de los técnicos para los que has jugado. Cada uno se descubre con el primer partido a sus órdenes.": "Les traits des coachs pour qui tu as joué. Chacun se découvre au premier match sous ses ordres.",
		"Sin rasgos conocidos.": "Aucun trait connu.",
		"BUENOS": "BONS",
		"MALOS": "MAUVAIS",
		"Rasgo nuevo: {0}": "Nouveau trait : {0}",
		"MOVER ESTO": "DEPLACER CECI",
		"choca con {0}": "percute {0}",
		"encima de {0}": "sur {0}",






		"GANAS LA TANDA": "SEANCE GAGNEE",
		"ELIMINADO EN PENALES": "ELIMINE AUX PENALTYS",
		"La metió {0}. Los otros diez cruzaron medio campo para decírselo.":
			"{0} l'a mise au fond. Les dix autres ont traversé un demi-terrain pour le lui dire.",
		"La metiste tú. Los otros diez cruzaron medio campo para decírtelo.":
			"Tu l'as mise au fond. Les dix autres ont traversé un demi-terrain pour te le dire.",
		"La sacó {0}. Los otros diez cruzaron medio campo para decírselo.":
			"{0} l'a sortie. Les dix autres ont traversé un demi-terrain pour le lui dire.",
		"La mandaron fuera. Los otros diez cruzaron medio campo igual.":
			"Ils l'ont envoyée dehors. Les dix autres ont traversé un demi-terrain quand même.",
		"La metiste tú. Hasta el banquillo saltó al campo a por ti.":
			"C'est toi qui l'as mis. Même le banc a envahi le terrain pour toi.",
		"La metió {0}. Hasta el banquillo saltó al campo a por él.":
			"{0} l'a mis. Même le banc a envahi le terrain pour lui.",
		"La sacó {0}. Hasta el banquillo saltó al campo a por él.":
			"{0} l'a arrêté. Même le banc a envahi le terrain pour lui.",
		"La mandaron fuera. Hasta el banquillo saltó al campo.":
			"Ils l'ont envoyé au-dessus. Même le banc a envahi le terrain.",
		"La fiesta la dan ellos. A ti te quedan cuarenta metros hasta el túnel.":
			"La fête est pour eux. Il te reste quarante mètres jusqu'au tunnel.",
		"Subcampeón": "Finaliste",

		"Campeón: {0}": "Champion : {0}",
		"La fiesta estaba lista. La están dando ellos, en el sitio donde ibas a estar tú.":
			"La fête était prête. Ce sont eux qui la font — à l'endroit où tu aurais dû être.",

		"ÁNGULO": "ANGLE",

		"Presión alta": "Pressing haut",
		"Bloque bajo": "Bloc bas",
		"Marcaje al hombre": "Marquage individuel",
		"Bloque alto paciente": "Ligne haute patiente",


		"Equilibrado": "Neutre",

		"ÁRBITRO": "ARBITRE",
		"Tarjetero": "Cartonneur",
		"Permisivo": "Permissif",
		"Deja seguir": "Laisse jouer",
		"Pita todo": "Siffle tout",

		"Encerrado en la banda": "Coincé sur l'aile",
		"El último hombre": "Le dernier homme",

		"Juega la {0}": "Joue la {0}",

		"Su comisión baja del 8% al 3% en cada partido, y también en lo que"
		+ " cobras al firmar. Cara, pero cuanto antes la firmes, más te devuelve.":
			"Sa commission passe de 8% à 3% sur chaque match, et aussi sur ta"
			+ " prime de signature. Chère, mais plus tu la signes tôt, plus elle rapporte.",

		"EL CHAVO TE COMIÓ EL PUESTO": "LE GAMIN T'A PIQUE TA PLACE",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la"
		+ " nómina: el tuyo. Te piden por las buenas un 20% de tu sueldo, y el"
		+ " vestuario ya sabe que te lo han pedido.":
			"Le club a un phénomène sous contrat verbal et il ne manque qu'une"
			+ " place dans la masse salariale : la tienne. On te demande gentiment"
			+ " 20% de ton salaire, et le vestiaire sait déjà qu'on te l'a demandé.",
		"DECIR QUE LES SOBRÓ CONFIANZA": "DIRE QU'ILS ONT ETE TROP SURS D'EUX",
		"Los eliminó un equipo de dos categorías más abajo, en una cancha de mil"
		+ " personas y con el vestuario de local festejando junto al de ustedes.":
			"Vous avez été éliminés par une équipe de deux divisions en dessous,"
			+ " dans un stade de mille places, avec le vestiaire local qui fêtait ça juste à côté du vôtre.",

		"max_asist_eulCerebro de la Europa League": "Cerveau de la Coupe Europa",
		"pichichi_x5Dueño del Area": "Maître de la Surface",
		"pichichi_3_paisesEl Gol No Entiende de Idiomas":
			"Le But N'a Pas de Langue",
		"doblete_ligaGoles y Pases": "Buts et Passes",
		"verdugo_paises_bajosVerdugo de Países Bajos": "Bourreau des Pays-Bas",
		"presentacion_40kCuarenta Mil": "Quarante Mille",
		"TE QUIEREN EN EL PLATÓ": "ON TE VEUT A LA TELE",
		"UN MICRÓFONO CALIENTE": "UN MICRO OUVERT",
		"DESCANSAR EN CASA": "REPOS A LA MAISON",
		"SALIR CON EL EQUIPO": "SORTIR AVEC L'EQUIPE",
		"¡Subiste a nivel {0}!": "Tu es passé niveau {0} !",
		"Tienes {0} puntos para repartir en tus habilidades.":
			"Tu as {0} points à répartir dans tes qualités.",
		"un compañero": "un coéquipier",
		"Le abriste la puerta a {0}. Atento al mercado.":
			"Tu as ouvert la porte à {0}. Surveille le mercato.",
		"Aún no hay ofertas. Se pueden mover fichas.":
			"Pas encore d'offres. Ça peut encore bouger.",
		"{0} {1} sobre la mesa.": "{0} {1} sur la table.",
		"Marcas interesadas": "Des marques s'intéressent à toi",
		"{0} {1} {2} ficharte.": "{0} {1} {2} te recruter.",
		"Convocado con tu selección": "Convoqué avec ta sélection",
		"Entras en la lista ({0}). Jugarás las fechas FIFA.":
			"Tu es sur la liste ({0}). Tu joueras la trêve internationale.",
		"Te dan el alta": "Tu es déclaré apte",
		"Recuperado. Vuelves a estar disponible para el próximo partido.":
			"Rétabli. Tu es de nouveau disponible pour le prochain match.",
		"Lesión": "Blessure",
		"Estarás de baja {0} {1}.": "Tu seras absent {0} {1}.",
		"Fuera de la lista": "Hors de la liste",
		"El seleccionador de {0} te deja fuera de la convocatoria.":
			"Le sélectionneur de {0} ne te convoque pas.",
		"Vuelves a la selección": "Tu retrouves la sélection",
		"Regresas a la lista de {0} ({1}).": "Tu es de retour dans la liste de {0} ({1}).",
		"Titular con tu selección": "Titulaire avec ta sélection",
		"Te ganas el puesto en el once de {0}.":
			"Tu gagnes ta place dans le onze de {0}.",
		"Te quedas fuera": "Tu es laissé de côté",
		"El técnico no te convoca para el próximo partido.":
			"L'entraîneur ne te convoque pas pour le prochain match.",
		"Pierdes la titularidad": "Tu perds ta place de titulaire",
		"Empezarás en el banquillo el próximo partido.":
			"Tu débuteras sur le banc le prochain match.",
		"Vuelves al once": "Tu retrouves le onze",
		"El técnico te devuelve la titularidad.": "L'entraîneur te redonne ta place de titulaire.",
		"Energía en rojo": "Energie dans le rouge",
		"Vas al {0}%. Jugando así rindes menos y te arriesgas a lesionarte.":
			"Tu es à {0}%. En jouant comme ça tu rends moins et tu risques la blessure.",
		"Semana de derbi": "Semaine de derby",
		"Toca {0}. Gana y todo cuenta doble.":
			"C'est {0} cette semaine. Gagne et tout compte double.",
		"Logro: {0}": "Succès : {0}",
		"El técnico cuenta más contigo": "L'entraîneur compte plus sur toi",
		"Tu rol en el club sube a {0}.": "Ton rôle au club passe à {0}.",
		"El técnico te nombra capitán": "L'entraîneur te nomme capitaine",
		"Tu rendimiento manda en el vestuario: llevas el brazalete.":
			"Ta forme fait autorité dans le vestiaire : tu portes le brassard.",
		"Te quitan el brazalete": "On te retire le brassard",
		"Otro compañero rinde por encima de ti esta temporada.":
			"Un autre coéquipier te surclasse cette saison.",
		", {0} goles": ", {0} buts",
		"Fuiste la figura ({0} de nota{1}).":
			"Tu as été l'homme du match (note de {0}{1}).",
		"Media {0}: el mejor de tu liga este mes (listón {1}).":
			"Moyenne de {0} : le meilleur de ta ligue ce mois-ci (barre à {1}).",
		"Premio de la temporada {0}.": "Prix de la saison {0}.",
		"¡Campeón de Liga!": "Titre de champion !",
		"Levantaste la liga con tu club.": "Tu as remporté le championnat avec ton club.",
		"¡Ascenso!": "Promotion !",
		"Subes a {0} con tu club.": "Tu montes en {0} avec ton club.",
		"Descenso a {0}": "Relégué en {0}",
		"Ganar la copa nacional.": "Remporter la coupe nationale.",
		"Eres campeón de Europa.": "Tu es champion d'Europe.",
		"Fase final de Champions": "Phase finale de la Coupe Elite",

		"Entraste en el ONCE IDEAL de la liga": "Tu es dans l'EQUIPE TYPE du championnat",
		"¡Campeón de Europa League!": "Vainqueur de la Coupe Europa !",
		"Ganas Europa y con ella la plaza para la próxima Champions.":
			"Tu remportes la Coupe Europa, et avec elle une place pour la prochaine Coupe Elite.",
		"Fase final de Europa League": "Phase finale de la Coupe Europa",
		"¡Campeón del Mundo de Clubes!": "Champion du Monde des Clubs !",
		"El título más grande a nivel de club.": "Le plus grand titre au niveau club.",
		"Objetivo cumplido": "Objectif atteint",
		"El club queda contento con tu temporada.": "Le club est satisfait de ta saison.",
		"Objetivo no cumplido": "Objectif manqué",
		"El club esperaba más. Sube la presión.":
			"Le club en attendait plus. La pression monte.",
		"El club te pone en venta por no cumplir":
			"Le club te met en vente pour objectif manqué",
		"El club te pone en venta": "Le club te met en vente",
		"Dos temporadas sin dar lo que firmaste. En {0} escuchan ofertas por ti.":
			"Deux saisons sans tenir ce que tu avais promis. A {0} on écoute les offres te concernant.",
		"El club te buscará minutos fuera": "Le club te cherchera du temps de jeu ailleurs",
		"El club te buscará sitio fuera": "Le club te cherchera une place ailleurs",
		"No cumpliste lo que te pidieron y en {0} creen que necesitas jugar. En el próximo mercado te buscarán una cesión.":
			"Tu n'as pas rempli ce qu'on te demandait, et à {0} on pense que tu as besoin de jouer. Au prochain mercato, on te trouvera un prêt.",
		"Contrato en el último año": "Contrat en dernière année",
		"Renueva o escucha ofertas antes de quedar libre.":
			"Prolonge ou écoute les offres avant d'être libre.",
		"Se acabó: te retiras a los {0}": "C'est fini : tu prends ta retraite à {0} ans",
		"Mercado de verano abierto": "Mercato d'été ouvert",
		"{0}: OBJETIVO CUMPLIDO": "{0} : OBJECTIF ATTEINT",
		"{0} no renueva, y no volverá en {1} temporadas":
			"{0} ne prolonge pas, et ne reviendra pas avant {1} saisons",
		"{0} no renueva: tu club no juega en Europa": "{0} ne prolonge pas : ton club ne joue pas en Europe",
		"{0}: objetivo a {1} por tus {2} jornadas de baja":
			"{0} : objectif ramené à {1} pour tes {2} journées d'absence",
		"{0} no renueva": "{0} ne prolonge pas",
		"Los años pesan: -{0} en lo físico": "Les années pèsent : -{0} au physique",
		"Los años pesan: -{0} en lo físico y -{1} en lo técnico": "Les années pèsent : -{0} au physique, -{1} en technique",
		"Los años pesan: -{0} en lo técnico": "Les années pèsent : -{0} en technique",
		"Terminar {0} o mejor en la liga.": "Terminer {0} ou mieux en ligue.",
		"Dar {0} asistencias.": "Faire {0} passes décisives.",
		"Jugar {0} partidos.": "Jouer {0} matchs.",
		"Promediar {0} de nota.": "Faire une moyenne de {0}.",
		"Marcar {0} goles.": "Marquer {0} buts.",
		"Preguntaron por ti": "On s'est renseigné sur toi",
		"{0} te ha hecho una oferta.": "{0} t'a fait une offre.",
		"Un club": "Un club",
		"Mercado de invierno abierto": "Mercato d'hiver ouvert",
		"Se retiran de la puja": "Ils se retirent de la course",
		"Rechazaste una oferta": "Tu as refusé une offre",
		"Dijiste no a {0}. Se busca otro destino para la próxima jornada.":
			"Tu as dit non à {0}. On te cherche une autre destination pour la prochaine journée.",
		"Nadie ocupa el hueco": "Personne ne prend la place",
		"Rechazaste y de momento no ha llegado nadie más.":
			"Tu as refusé et pour l'instant personne d'autre ne s'est présenté.",
		"{0} ya no cuenta contigo: buscan a otro.":
			"{0} ne compte plus sur toi : ils cherchent quelqu'un d'autre.",
		"Enfrían el interés": "L'intérêt refroidit",
		"{0} se baja tras tu último partido.": "{0} se retire après ton dernier match.",
		"Último día de mercado": "Dernier jour du mercato",
		"{0} {1} sobre la mesa. Mañana se cierra.":
			"{0} {1} sur la table. Ça ferme demain.",
		"Nueva oferta": "Nouvelle offre",
		"{0} entra en la puja por ti.": "{0} entre dans la course pour toi.",
		"El club": "Le club",
		"mejor ficha": "un meilleur salaire",
		"ser titular": "une place de titulaire",
		"Negociación abierta": "Négociation ouverte",
		"Pediste {0} a {1}. Te responden en la próxima jornada.":
			"Tu as demandé {0} à {1}. Ils te répondent la prochaine journée.",
		"sube la ficha a ${0}/partido": "monte ton salaire à ${0}/match",
		"acepta ficharte como {0}": "accepte de te recruter comme {0}",
		"Ceden en la negociación": "Ils cèdent du terrain",
		"Rompen la negociación": "Ils rompent la négociation",
		"{0} retira su oferta: te apretaste de más.":
			"{0} retire son offre : tu as trop tiré la corde.",
		"Se plantan": "Ils campent sur leur position",
		"{0} mantiene su oferta tal cual. No hay más margen.":
			"{0} maintient son offre telle quelle. Il n'y a plus de marge.",
		"Rumores de mercado": "Rumeurs de mercato",
		"{0} pregunta por ti de cara al mercado de invierno.":
			"{0} se renseigne sur toi en vue du mercato d'hiver.",
		"El club necesita venderte": "Le club a besoin de te vendre",
		"En {0} dicen que tu traspaso les cuadra el año. Puedes negarte, pero no te lo"
		+ " van a agradecer. Decide en MERCADO.":
			"A {0} on dit que ton transfert équilibre les comptes de l'année. Tu peux refuser,"
			+ " mais on ne te remerciera pas. Décide dans MERCATO.",
		"el club": "le club",
		"Aceptas salir": "Tu acceptes de partir",
		"El club te ofrece a quien pregunte. Busca destino en MERCADO.":
			"Le club te propose à qui se renseigne. Trouve une destination dans MERCATO.",
		"Te niegas a salir": "Tu refuses de partir",
		"Te quedas, pero el club contaba con ese traspaso y se nota en el vestuario.":
			"Tu restes, mais le club comptait sur ce transfert et ça se sent dans le vestiaire.",
		"El club te busca minutos": "Le club te cherche du temps de jeu",
		"En {0} no vas a jugar y lo saben: te ofrecen salir CEDIDO para que juegues."
		+ " Puedes negarte, pero te quedas donde estás. Decide en MERCADO.":
			"A {0} tu ne vas pas jouer et ils le savent : on te propose un PRET pour"
			+ " que tu joues. Tu peux refuser, mais tu restes où tu es. Décide dans MERCATO.",
		"Te niegas a salir cedido": "Tu refuses le prêt",
		"Te quedas. El club te buscó minutos y dijiste que no: esta temporada vas a"
		+ " mirar muchos partidos desde fuera.":
			"Tu restes. Le club t'a cherché du temps de jeu et tu as dit non : cette saison"
			+ " tu vas regarder beaucoup de matchs depuis le banc.",
		"El club deja de contar contigo: buscan salida":
			"Le club ne compte plus sur toi : on te cherche une sortie",
		"El club deja de esperarte": "Le club arrête de t'attendre",
		"Dos temporadas sin crecer y sin sitio en el equipo: {0} te pone en la puerta"
		+ " de salida y no te va a renovar.":
			"Deux saisons sans progresser et sans place dans l'équipe : {0} te montre la"
			+ " sortie et ne va pas te prolonger.",
		"Vuelve de su cesión": "Revient de son prêt",
		"{0} regresa al vestuario tras un año jugando fuera.":
			"{0} revient au vestiaire après un an passé ailleurs.",
		"Un canterano": "Un jeune du centre de formation",
		"Sale cedido": "Part en prêt",
		"{0} se va cedido a {1} por una temporada.":
			"{0} part en prêt à {1} pour une saison.",
		"Llega cedido": "Arrive en prêt",
		"{0} ({1}) llega cedido desde {2}.": "{0} ({1}) arrive en prêt en provenance de {2}.",
		"Sube uno de la cantera": "Un jeune monte du centre de formation",
		"{0} ({1}) se queda con el hueco en el primer equipo.":
			"{0} ({1}) prend la place dans l'équipe première.",
		"Tu club ficha": "Ton club recrute",
		"Llega {0} ({1}) desde {2}.": "{0} ({1}) arrive en provenance de {2}.",
		"El descenso vacía el vestuario": "La relégation vide le vestiaire",
		"{0} ({1}) se va: el club necesita hacer caja.":
			"{0} ({1}) s'en va : le club a besoin de faire de la trésorerie.",
		"Se va un compañero": "Un coéquipier s'en va",
		"{0} deja el vestuario: firma por {1}.":
			"{0} quitte le vestiaire : il signe pour {1}.",
		"El fichaje del mercado": "Le transfert du mercato",
		"{0} pasa de {1} a {2} por ${3}.": "{0} passe de {1} à {2} pour ${3}.",




		"Se mueve tu vestuario": "Ton vestiaire bouge",
		"Llegan {0}. Se van {1}.": "Arrivées : {0}. Départs : {1}.",
		"Llegan {0}.": "Arrivées : {0}.",
		"Se vacía tu vestuario": "Ton vestiaire se vide",
		"Se van {0}.": "Départs : {0}.",
		"Cesiones en tu club": "Prêts dans ton club",
		"Llegan cedidos {0}. Salen cedidos {1}.":
			"Arrivées en prêt : {0}. Départs en prêt : {1}.",
		"Llegan cedidos {0}.": "Arrivées en prêt : {0}.",
		"Salen cedidos {0}.": "Départs en prêt : {0}.",
		"El mercado se movió": "Un mercato agité",
		"{0} traspasos en el mundo. Los tienes en MERCADO.":
			"{0} transferts dans le monde. Tu les trouves dans MERCATO.",
		"{0} traspasos en el mundo. El más caro: {1} a {2} por ${3}.":
			"{0} transferts dans le monde. Le plus cher : {1} à {2} pour ${3}.",
		"Fichaste por un club nuevo": "Tu as signé pour un nouveau club",
		"Te incorporas a {0}. Empiezas de cero en el vestuario.":
			"Tu rejoins {0}. Tu repars de zéro dans le vestiaire.",
		"tu nuevo club": "ton nouveau club",
		"Tu contrato terminó: eres AGENTE LIBRE":
			"Ton contrat est terminé : tu es AGENT LIBRE",
		"Eres agente libre": "Tu es agent libre",
		"Tu contrato terminó. Elige tu próximo club.":
			"Ton contrat est terminé. Choisis ton prochain club.",
		"Firmaste como agente libre": "Tu as signé comme agent libre",
		"Fichas por {0} sin traspaso.": "Tu signes pour {0} sans indemnité de transfert.",
		"Fin de la cesión: vuelves a {0}": "Fin du prêt : tu retournes à {0}",
		"Renovaste tu contrato": "Tu as prolongé ton contrat",
		"Sigues en {0}: {1} {2} más.": "Tu restes à {0} : {1} {2} de plus.",
		"No renuevas: al escaparate": "Pas de prolongation : sur le marché",
		"El club te pone en venta para no perderte gratis. Si te quedas, jugarás menos.":
			"Le club te met en vente pour ne pas te perdre gratuitement. Si tu restes,"
			+ " tu joueras moins.",
		"Sin destinos de cesión": "Aucune destination de prêt",
		"Ningún club menor te quiere cedido ahora mismo.":
			"Aucun club plus petit ne veut de toi en prêt pour l'instant.",
		"Pediste salir cedido": "Tu as demandé un prêt",
		"Clubes menores donde jugarías de titular. Elige en el MERCADO.":
			"Des clubs plus petits où tu serais titulaire. Choisis dans MERCATO.",
		"Tu club quiere retenerte": "Ton club veut te retenir",
		"{0} pone sobre la mesa una mejora de contrato para que te quedes.":
			"{0} met sur la table une amélioration de contrat pour te garder.",
		"Tu club": "Ton club",
		"Sin sitio en la selección de {0}": "Pas de place en sélection de {0}",
		"Titular de {0}": "Titulaire de {0}",
		"Convocado con {0}": "Convoqué avec {0}",
		"¡{0} se clasificó al Mundial!": "{0} s'est qualifié pour le Mondial !",
		"{0} CAMPEÓN de la {1}… sin ti": "{0} CHAMPION de la {1}… sans toi",
		"{0}: {1} CAMPEÓN, y tú sin jugar un minuto": "{0} : {1} CHAMPION, et toi sans jouer une minute",
		"{0} subcampeón de la {1} (sin ti)": "{0} finaliste de la {1} (sans toi)",
		"{0}: {1} eliminada en {2} (sin ti)":
			"{0} : {1} éliminée en {2} (sans toi)",
		"{0} sin ti": "{0} sans toi",
		"{0} se clasificó al Mundial (sin ti)":
			"{0} s'est qualifié pour le Mondial (sans toi)",
		"¡CAMPEÓN DEL MUNDO con {0}!": "CHAMPION DU MONDE avec {0} !",
		"¡CAMPEÓN de la {0} con {1}!": "CHAMPION de la {0} avec {1} !",
		"Subcampeón de la {0} con {1}": "Finaliste de la {0} avec {1}",
		"{0}: eliminado en {1} con {2}": "{0} : éliminé en {1} avec {2}",
		"{0} con {1}": "{0} avec {1}",
		"{0} se clasificó al Mundial": "{0} s'est qualifié pour le Mondial",
		"{0} no fue al Mundial": "{0} n'est pas allé au Mondial",
		"Mundial sin ti: {0} de {1}": "Mondial sans toi : {1}, {0}",
		"{0} sin ti: {1} de {2}": "{0} sans toi : {2}, {1}",
		"{0} no se clasificó al Mundial": "{0} ne s'est pas qualifié pour le Mondial",


		"natdieciseisavos": "seizièmes",
		"natoctavos": "huitièmes",
		"natcuartos": "quarts",
		"natsemifinal": "demi-finales",
		"natfinal": "finale",
		"natfase de grupos": "phase de groupes",
		"natno clasificada": "non qualifiée",
		"natcampeón": "champion",
		"natsubcampeón": "finaliste",
		"natronda": "tour",
		"calluptitular": "titulaire",
		"callupconvocado": "convoqué",
		"SUENA OTRO CLUB": "UN AUTRE CLUB APPELLE",
		"ME INTERESARÍA": "JE SERAIS TENTE",
		"ESTOY COMPROMETIDO AQUÍ": "JE SUIS ENGAGE ICI",
		"DOS CLUBES PREGUNTAN": "DEUX CLUBS DEMANDENT",
		"Te ponen el micro delante: {0} y {1} preguntan por ti. ¿A cuál te irías? Lo que"
		+ " digas lo oye tu técnico.":
			"On te met le micro devant : {0} et {1} se renseignent sur toi. Lequel"
			+ " choisirais-tu ? Ton entraîneur entend ce que tu dis.",
		"ME IRÍA A {0}": "J'IRAIS A {0}",
		"ME QUEDO EN {0}": "JE RESTE A {0}",
		"LESIONADO": "BLESSE",
		"Selección": "Sélection",
		"buzonMERCADO": "MERCATO",
		"¡LOGRO DESBLOQUEADO!": "SUCCES DEBLOQUE !",
		"¡ARQUETIPO DESBLOQUEADO!": "ARCHETYPE DEBLOQUE !",
		"¡RASGO DESCUBIERTO!": "TRAIT DECOUVERT !",
		"TOCA PARA CONTINUAR": "APPUIE POUR CONTINUER",
		"REGATEA Y REMATA": "DRIBBLE ET CONCLUS",
		"Puedes tirar ya. O jala desde dentro del círculo para conducir, vuelve al círculo y paras en seco: ahí apuntas con calma y tiras. Combinar regate y tiro es lo que abre a un defensa.": "Tu peux tirer tout de suite. Ou tire depuis l'intérieur du cercle pour conduire, reviens au cercle et arrête-toi net : là tu vises calmement et tu tires. Combiner dribble et tir, c'est ce qui ouvre un défenseur.",
		"MODO PASE": "MODE PASSE",
		"Dentro del círculo, el mismo trazo es un pase. Jala hacia atrás y el balón sale hacia adelante, al compañero libre de la otra banda. Sin defensa encima, es la salida más segura.": "Dans le cercle, le même geste est une passe. Tire vers l'arrière et le ballon part vers l'avant, vers le coéquipier libre de l'autre aile. Sans défenseur sur toi, c'est la sortie la plus sûre.",
		"EL RELEVO": "LE RELAIS",
		"Si tu pase llega a un compañero fuera del área, pasas a jugar con él. Si cae dentro del área no hay control que valga: remata de primera.": "Si ta passe arrive à un coéquipier hors de la surface, tu passes à jouer avec lui. Si elle tombe dans la surface, pas de contrôle possible : il reprend de volée.",
		"LA PANTALLA DE GOLPEO": "L'ECRAN DE FRAPPE",
		"Soltaste la resortera: ahora eliges dónde tocar el balón. La costura marca el centro: ahí sale tenso. Cuanto más abajo la toques, más lo elevas; cuanto más al borde, menos potencia.": "Tu as lâché le lance-pierre : maintenant tu choisis où toucher le ballon. La couture marque le centre : là il part tendu. Plus tu touches bas, plus tu le lèves ; plus tu touches le bord, moins il y a de puissance.",

		"Primera Mudanza": "Premier Déménagement",
		"Subir de casa por primera vez.": "Changer de maison pour la première fois.",
		"Vida Acomodada": "Bien Installé",
		"Llegar a vivir en una casa moderna.": "Vivre dans une maison moderne.",
		"La Mansión": "La Demeure",
		"Llegar a vivir en una mansión.": "Vivre dans une demeure.",
		"Hogar, Dulce Hogar": "Foyer, Doux Foyer",
		"Amueblar tu casa con 10 adiciones.": "Meubler ta maison avec 10 ajouts.",
		"La Finca": "Le Domaine",
		"Llegar a vivir en una finca.": "Vivre dans un domaine.",
		"Casa Llena": "Maison Pleine",
		"Amueblar tu casa con 40 adiciones.": "Meubler ta maison avec 40 ajouts.",
		"La Casa Soñada": "La Maison de Rêve",
		"Amueblar tu casa con 80 adiciones.": "Meubler ta maison avec 80 ajouts.",


		"Hacer 10 puntos en la maquinita de tu casa.": "Faire 10 points sur la borne d'arcade de ta maison.",
		"Serpiente Legendaria": "Serpent Légendaire",
		"¡TE TOCAN LAS LISAS!": "A TOI LES PLEINES !",
		"¡TE TOCAN LAS RAYADAS!": "A TOI LES RAYEES !",
		"Bullseye": "Dans le Mille",
		"Clavar un dardo en el mero centro de la diana.": "Planter une fléchette en plein centre de la cible.",
		"Ganar cinco retos de billar al vestuario en tu casa.":
			"Gagner cinq défis de billard contre le vestiaire chez toi.",

		"Buen Pulso": "Bon Poignet",
		"Hacer 200 puntos en la diana de tu casa.": "Faire 200 points sur la cible de chez toi.",
		"Mano de Seda": "Main de Soie",
		"Hacer 320 puntos en la diana de tu casa.": "Faire 320 points sur la cible de chez toi.",
		"Nueve Dardos": "Neuf Fléchettes",
		"Hacer 400 puntos en la diana de tu casa.": "Faire 400 points sur la cible de chez toi.",
		"La Mirada del Míster": "Le Regard du Coach",
		"Llegar a cien dominadas en el banquillo.": "Atteindre cent jongles au bord du banc.",
		"Compañero de Vestuario": "Coéquipier",
		"Agregar a tu primer amigo.": "Ajouter ton premier ami.",
		"La Peña": "La Bande",
		"Tener 5 amigos.": "Avoir 5 amis.",
		"Hinchada Propia": "Tes Propres Supporters",
		"Tener 10 amigos.": "Avoir 10 amis.",
		"Sin Fronteras": "Sans Frontières",
		"El Mejor del Grupo": "Le Meilleur de la Bande",
		"Ser primero en LEGADO entre al menos 3 amigos.": "Être premier en LEGS parmi au moins 3 amis.",
		"Bola Ocho": "La Noire",
		"Ganar tu primera partida de billar en casa.": "Gagner ta première partie de billard chez toi.",
		"Mesa Limpia": "Table Rase",
		"Ganar una partida de billar sin que el rival meta una sola bola.":
			"Gagner une partie de billard sans que l'adversaire empoche une seule bille.",
		"El Dueño de la Casa": "Le Maître de Maison",
		"Ganaste cinco retos al vestuario en tu casa, entre la diana y la mesa.": "Tu as gagné cinq défis contre le vestiaire chez toi, entre la cible et le billard.",
		"Hacer 50 puntos en la maquinita de tu casa.": "Faire 50 points sur la borne d'arcade de ta maison.",
		"Graduado de la Academia": "Diplômé de l'Académie",
		"Completar el entrenamiento de la Academia.": "Terminer l'entraînement de l'Académie.",
		"Ocho Años":
			"Huit ans",
		"Ocho temporadas con la misma persona.":
			"Huit saisons avec la même personne.",
		"Media Naranja": "L'Âme Sœur",
		"Formalizar una relación.": "Officialiser une relation.",
		"Vitrina Dorada": "Vitrine Dorée",
		"Desbloquear todos los logros épicos.": "Débloquer tous les succès épiques.",
		"¡Corten!": "Coupez !",
		"Tumbar a un camarógrafo de un balonazo.": "Mettre un cameraman au sol d'un tir puissant.",


		"¡Plumas!": "Des plumes !",
		"Alcanzar a una paloma del campo de un balonazo.": "Toucher un pigeon du terrain d'un tir puissant.",


		"¡Agua Va!": "Attention, ça arrose !",
		"Reventar una cabeza de riego de un balonazo y que escupa torcida el resto del partido.":
			"Exploser un arroseur d'un tir et le laisser cracher de travers jusqu'à la fin du match.",
		"¡Remojón!": "Douché !",
		"Tirarle la bebida a diez aficionados con balones que se van a la grada.":
			"Renverser la boisson de dix supporters avec des ballons partis dans les tribunes.",


		"¡Ahí Va la Bandeja!": "Et Voilà le Plateau !",
		"Tumbarle la bandeja de comida al vendedor de la grada de un balonazo.":
			"Faire voler le plateau du vendeur des tribunes d'un coup de ballon.",
		"¡LE TIRASTE LA COMIDA AL VENDEDOR!":
			"TU AS FAIT VOLER LA BOUFFE DU VENDEUR !",
		"Le Callaste la Boca": "Tu L'as Fait Taire",
		"Marcar después de que te abucheen desde la grada, en el mismo partido.":
			"Marquer après t'être fait siffler depuis les tribunes, dans le même match.",
		"Ese Balón No Vuelve": "Ce Ballon Ne Revient Pas",
		"Mandar un balón a la calle en un campo sin nada detrás del arco.":
			"Envoyer un ballon dans la rue sur un terrain sans rien derrière le but.",
		"Cesión al Portero": "Passe au Gardien",
		"Pasarle el balón a tu propio portero en vez de tirar a puerta.":
			"Passer le ballon à ton propre gardien au lieu de tirer au but.",
		"¡A por agua!": "Pause fraîcheur !",
		"Tirar las botellas de agua del portero de un balonazo.":
			"Renverser les bouteilles d'eau du gardien d'un tir puissant.",
		"La mano del derbi": "La main du derby",
		"Descubrir el apretón de manos de los técnicos al acabar un derbi.":
			"Découvrir la poignée de main des entraîneurs à la fin d'un derby.",
		"Mano de hierro": "Poigne de fer",
		"Ganarle el apretón de manos al técnico rival al acabar un derbi.":
			"Remporter la poignée de main contre l'entraîneur adverse à la fin d'un derby.",
		"¡Una foto y me voy!": "Juste une photo !",
		"Un aficionado salta al campo en una final para tomarse una foto contigo.":
			"Un supporter entre sur le terrain lors d'une finale pour prendre une photo avec toi.",
		"¡Cristales!": "Verre brisé !",
		"Reventar el cristal de un palco de un balonazo.": "Exploser la vitre d'une loge d'un coup de pied.",
		"Sin Piedad con el Chaval": "Sans Pitié pour le Gamin",
		"Tumbar al recogepelotas de un balonazo.": "Renverser le ramasseur de balles d'un tir puissant.",
		"De Espaldas a la Copa": "Dos Tourné au Trophée",
		"Perder una final y ver al rival levantar el título.":
			"Perdre une finale et regarder ton rival soulever le trophée.",

		"{0} decidió la final. Su nombre se queda contigo.":
			"{0} a décidé la finale. Ce nom, tu ne l'oublieras pas.",
		"{0} metió el penalti que decidió la final. Su nombre se queda contigo.":
			"{0} a marqué le penalty qui a décidé la finale. Ce nom, tu ne l'oublieras pas.",
		"{0} paró el penalti que decidió la final. Su nombre se queda contigo.":
			"{0} a arrêté le penalty qui a décidé la finale. Ce nom, tu ne l'oublieras pas.",
		"REVANCHA · TEMPORADA {0}": "REVANCHE · SAISON {0}",
		"{0} te quitó la final de la temporada {1} ({2}). Esta noche los que miran son ellos.":
			"{0} t'a pris la finale de la saison {1} ({2}). Ce soir, ce sont eux qui regardent.",
		"Final vengada en la temporada {0}": "Finale vengée lors de la saison {0}",
		"Te ganó la final de la temporada {0}": "T'a battu en finale lors de la saison {0}",
		"Revancha": "Revanche",
		"Ganar una final al club que te quitó otra.": "Gagner une finale contre le club qui t'en a pris une autre.",
		"Tres Pases, Tres Goles": "Trois Passes, Trois Buts",
		"Darle tres asistencias al mismo compañero en un partido.": "Donner trois passes décisives au même coéquipier dans un match.",
		"Un Balón Cada Uno": "Un Ballon Chacun",
		"Hacer hat-trick en el partido en que le das tres asistencias al mismo compañero.": "Réussir un triplé dans le match où tu donnes trois passes décisives au même coéquipier.",
		"Piel Nueva": "Peau Neuve",
		"Ver la presentación de las equipaciones de la temporada.":
			"Voir la présentation des maillots de la saison.",
		"Primer Gol": "Premier But",


		"El Año Perfecto": "L'Année Parfaite",
		"En PRIMERA y en una sola temporada: liga, copa y Champions, más Balón de Oro, MVP y goleo de la liga, y MVP y bota de la Champions.":
			"En PREMIERE et en une seule saison : championnat, coupe et Coupe Elite, plus Joueur de l'Année, MVP et meilleur buteur du championnat, et MVP et soulier de la Coupe Elite.",
		"De la Camilla al Gol": "De la Civière au But",
		"Volver de una lesión grave y marcar en tu regreso.":
			"Revenir d'une grave blessure et marquer pour ton retour.",
		"Marcar tu primer gol.": "Marquer ton premier but.",
		"Marcar rematando un córner.": "Marquer sur un corner.",
		"Marcar directo desde el córner, sin que nadie toque el balón.":
			"Marquer directement du corner, sans que personne ne touche le ballon.",
		"Marcar un penal picado: cambiar a modo CENTRO antes de golpear.":
			"Marquer une panenka : passer en mode CENTRE avant de frapper.",
		"Goleador": "Finisseur",
		"10 goles en tu carrera.": "10 buts en carrière.",
		"Artillero": "Buteur d'Elite",
		"50 goles en tu carrera.": "50 buts en carrière.",
		"Centenario": "Centurion",
		"100 goles en tu carrera.": "100 buts en carrière.",
		"Killer": "Tueur",
		"250 goles en tu carrera.": "250 buts en carrière.",
		"Máquina de Goles": "Machine à Buts",
		"500 goles en tu carrera.": "500 buts en carrière.",
		"Asistente": "Passeur",
		"Dar tu primera asistencia.": "Faire ta première passe décisive.",
		"Cerebro": "Cerveau",
		"100 asistencias en tu carrera.": "100 passes décisives en carrière.",
		"Doblete": "Doublé",
		"2 goles en un mismo partido.": "2 buts dans un même match.",
		"Hat-Trick": "Triplé",
		"3 goles en un mismo partido.": "3 buts dans un même match.",
		"4 goles en un mismo partido.": "4 buts dans un même match.",
		"Manita": "Quintuplé",
		"5 goles en un mismo partido.": "5 buts dans un même match.",
		"Sangre Fría": "Sang-Froid",
		"Marcar tu primer penalti.": "Marquer ton premier penalty.",
		"Especialista de Penales": "Roi des Penaltys",
		"25 penaltis marcados.": "25 penaltys marqués.",
		"Maestro de la Falta": "Maître du Coup Franc",
		"Marcar de tiro libre directo.": "Marquer sur coup franc direct.",
		"El Muro No Existe": "Le Mur N'existe Pas",
		"10 goles de tiro libre.": "10 buts sur coup franc.",
		"Jugada de Estrategia": "Combinaison travaillée",
		"Por Debajo": "Sous le Mur",
		"Marcar un tiro libre por debajo de la barrera.": "Marquer un coup franc sous le mur.",
		"Gol Olímpico": "But Olympique",

		"Testarazo": "Coup de Tête",
		"Marcar de cabeza.": "Marquer de la tête.",
		"Sin Dejarla Caer": "Sans la Laisser Tomber",
		"Marcar de volea.": "Marquer de volée.",
		"Chilena de Antología": "Retourné d'Anthologie",
		"Marcar de chilena.": "Marquer d'un retourné acrobatique.",
		"Perro en la Cancha": "Un Chien sur le Terrain",
		"Que un perro se meta en la cancha durante un partido tuyo.":
			"Qu'un chien entre sur le terrain pendant un de tes matchs.",
		"Marcaste de cabeza tras un córner.": "Tu as marqué de la tête sur corner.",
		"Campeón": "Champion",
		"Ganar tu primera liga.": "Remporter ta première ligue.",
		"Rey de Primera": "Roi de la D1",
		"Campeón de la máxima categoría.": "Champion de l'élite.",
		"Subir de categoría.": "Monter de division.",
		"Copa en Vitrina": "Coupe en Vitrine",
		"Rey de Europa": "Roi d'Europe",
		"Ganar la Champions continental.": "Remporter la Coupe Elite continentale.",
		"Ganar el Mundial de Clubes.": "Remporter le Mondial des clubs.",
		"Noche Europea": "Soir Européen",
		"Marcar en un partido continental.": "Marquer lors d'un match continental.",
		"Orgullo Nacional": "Fierté Nationale",
		"Marcar con tu selección.": "Marquer avec ta sélection.",
		"Asistencia Internacional": "Passe Internationale",
		"Dar una asistencia con tu selección.": "Faire une passe décisive avec ta sélection.",
		"Héroe Mundialista": "Héros du Mondial",
		"Marcar en el Mundial.": "Marquer au Mondial.",
		"Gloria Continental": "Gloire Continentale",
		"Ganar la Euro/Copa América con tu país.": "Remporter le Tournoi Européen/Sud-Américain avec ton pays.",
		"Ganar el Mundial con tu selección.": "Remporter le Mondial avec ta sélection.",
		"El Mejor del Mundo": "Le Meilleur du Monde",
		"Ganar el Balón de Oro.": "Remporter le titre de Joueur de l'Année.",
		"Tríada Dorada": "Triade Dorée",
		"3 Balones de Oro.": "3 titres de Joueur de l'Année.",
		"El Que Te Lo Quitó": "Celui Qui Te L'a Pris",
		"Quedar segundo en el Balón de Oro, justo detrás del ganador.": "Finir deuxième au vote du Joueur de l'Année, juste derrière le vainqueur.",
		"Nivel Plata": "Palier Argent",
		"Llegar a ser jugador de plata: media 65 en una carrera.":
			"Devenir joueur argent : moyenne de 65 en carrière.",
		"Nivel Oro": "Palier Or",
		"Llegar a ser jugador de oro: media 75 en una carrera.": "Devenir joueur or : moyenne de 75 en carrière.",
		"Nivel Diamante": "Palier Diamant",
		"Llegar a ser jugador de diamante: media 85 en una carrera.":
			"Devenir joueur diamant : moyenne de 85 en carrière.",
		"Clase Mundial": "Classe Mondiale",
		"Media de habilidades de nivel élite (90).": "Moyenne de qualités au niveau élite (90).",
		"Actuación Perfecta": "Prestation Parfaite",
		"Un partido con nota 9.5 o más.": "Un match noté 9.5 ou plus.",
		"¿El Mejor de la Historia?": "Le Meilleur de l'Histoire ?",
		"Liga, copa, continental, Balón de Oro y goleo en una misma temporada.":
			"Ligue, coupe, continental, Joueur de l'Année et meilleur buteur la même saison.",
		"Trotamundos": "Globe-Trotter",
		"Ganar liga con 3 clubes distintos.": "Remporter la ligue avec 3 clubs différents.",
		"El Conquistador": "Le Conquérant",
		"Ganar la 1ª división de las cinco grandes: España, Inglaterra, Italia, Alemania y Francia.":
			"Remporter la D1 des cinq grands championnats : Espagne, Angleterre, Italie, Allemagne et France.",
		"La Vuelta al Mundo": "Le Tour du Monde",
		"Ganar la liga en 3 confederaciones distintas (Europa, América, Asia…).":
			"Remporter la ligue dans 3 confédérations différentes (Europe, Amérique, Asie…).",
		"Un Solo Amor": "Un Seul Amour",
		"5 títulos de liga con un mismo club.": "5 titres de ligue avec le même club.",
		"Mi Único Amor": "Fidèle à un Club",
		"Diez temporadas o más en el mismo club sin fichar nunca por otro; una cesión no lo rompe.":
			"Dix saisons ou plus dans le même club sans jamais signer ailleurs ; un prêt ne le brise pas.",
		"Uno Siempre Vuelve": "On Revient Toujours",
		"Volver a fichar por un club en el que ya hayas jugado antes.":
			"Re-signer pour un club où tu avais déjà joué.",
		"Dinastía": "Dynastie",
		"Ganar la liga 3 temporadas seguidas.": "Remporter la ligue 3 saisons de suite.",
		"Amo de Europa": "Maître de l'Europe",
		"Ganar la Champions con 3 clubes distintos.": "Remporter la Coupe Elite avec 3 clubs différents.",
		"Coleccionista de Títulos": "Collectionneur de Titres",







		"Ganar la Copa de Campeones continental.": "Remporter la Coupe Elite continentale.",
		"Ganar la Euro/Torneo Sudamericano con tu país.":
			"Remporter le Tournoi Européen/Sud-Américain avec ton pays.",
		"Ganar el Jugador del Año.": "Remporter le titre de Joueur de l'Année.",
		"3 Premios al Mejor.": "3 titres de Joueur de l'Année.",
		"Liga, copa, continental, Jugador del Año y goleo en una misma temporada.": "Ligue, coupe, continental, Joueur de l'Année et meilleur buteur la même saison.",
		"Ganar la Copa de Campeones con 3 clubes distintos.": "Remporter la Coupe Elite avec 3 clubs différents.",
		"Ganar los seis grandes: liga, copa, Copa de Campeones, Mundial de Clubes, continental y Mundial.":
			"Remporter les six majeurs : ligue, coupe, Coupe Elite, Mondial des clubs, continental et Mondial.",
		"Rey de Copa Europa": "Roi de la Coupe Europa",
		"Ganar la Copa Europa.": "Remporter la Coupe Europa.",
		"Rey de la Copa Conferencia": "Roi de la Coupe Challenge",
		"Ganar la Copa Conferencia.": "Gagner la Coupe Challenge.",
		"Ganar el Bota de la Liga.": "Finir meilleur buteur du championnat.",
		"Bota de la Copa de Campeones": "Soulier de la Coupe Elite",
		"Ser el máximo goleador de la Copa de Campeones.": "Finir meilleur buteur de la Coupe Elite.",
		"Bota de la Copa Europa": "Soulier de la Coupe Europa",
		"Ser el máximo goleador de la Copa Europa.": "Finir meilleur buteur de la Coupe Europa.",
		"Bota de la Copa Conferencia": "Soulier de la Coupe Challenge",
		"Ser el máximo goleador de la Copa Conferencia.": "Finir meilleur buteur de la Coupe Challenge.",
		"Máximo asistente de la Copa de Campeones.": "Meilleur passeur de la Coupe Elite.",
		"Cerebro de la Copa Europa": "Cerveau de la Coupe Europa",
		"Máximo asistente de la Copa Europa.": "Meilleur passeur de la Coupe Europa.",
		"Máximo goleador de tu liga Y de la Copa de Campeones en la misma temporada.": "Meilleur buteur de ta ligue ET de la Coupe Elite la même saison.",
		"Ganar los seis grandes: liga, copa, Champions, Mundial de Clubes, continental y Mundial.":
			"Remporter les six majeurs : ligue, coupe, Coupe Elite, Mondial des clubs, continental et Mondial.",
		"Leal de Corazón": "Loyal de Cœur",
		"500 partidos con un mismo club.": "500 matches avec le même club.",
		"Círculo Completo": "Boucle Bouclée",
		"Retirarte en el club donde empezaste.": "Prendre ta retraite dans le club où tu as débuté.",
		"Hasta el Final": "Jusqu'au Bout",
		"Jugar hasta el final: que el calendario te retire a ti.":
			"Jouer jusqu'au bout : laisser le calendrier te mettre à la retraite.",
		"Salir a Tiempo": "Partir au Sommet",
		"El Cuerpo Dijo Basta": "Le Corps a Dit Stop",
		"Que una lesión grave de veterano te retire antes de tiempo.":
			"Qu'une grave blessure en fin de carrière te force à raccrocher tôt.",
		"Colgar las botas por decisión propia, antes de que te lo digan.":
			"Raccrocher les crampons de ton propre chef, avant qu'on ne te le dise.",
		"Leyenda del Club": "Légende du Club",
		"Entrar al top 5 de leyendas de tu club.": "Entrer dans le top 5 des légendes de ton club.",
		"Cara a Cara": "Face à Face",
		"Entre los Grandes": "Parmi les Grands",
		"Dejar atrás a 5 leyendas.": "Dépasser 5 légendes.",
		"Nombre Propio": "Un Nom à Part",
		"Dejar atrás a 15 leyendas.": "Dépasser 15 légendes.",
		"Mejor de la Historia": "Meilleur de l'Histoire",
		"Nadie en la historia hizo más goles + asistencias de élite que tú.": "Personne dans l'histoire n'a fait plus de buts + passes d'élite que toi.",
		"Por Encima de Todos": "Au-Dessus de Tous",
		"En los Libros": "Dans les Livres",
		"Batir tu primer récord histórico.": "Battre ton premier record historique.",
		"Hombre de Récords": "Homme à Records",
		"Batir 10 récords históricos.": "Battre 10 records historiques.",
		"Dejar atrás a 30 leyendas de la historia.": "Dépasser 30 légendes de l'histoire.",
		"Veterano": "Vétéran",
		"100 partidos disputados.": "100 matches disputés.",
		"Inoxidable": "Increvable",
		"300 partidos disputados.": "300 matches disputés.",
		"Un Lustro": "5 Ans",
		"5 temporadas completadas.": "5 saisons terminées.",
		"Una Década": "10 Ans",
		"10 temporadas completadas.": "10 saisons terminées.",
		"Leyenda": "Légende",
		"Alcanzar el escalón LEYENDA.": "Atteindre le palier LEGENDE.",
		"Inmortal": "Immortel",
		"Alcanzar el escalón INMORTAL.": "Atteindre le palier IMMORTEL.",
		"Curtido en la Cantera": "Formé à la Dure",
		"Completar una temporada entera en Tercera División.":
			"Terminer une saison complète en Troisième Division.",
		"Veterano de Segunda": "Vétéran de D2",
		"Completar una temporada entera en Segunda División.": "Terminer une saison complète en Deuxième Division.",
		"Bautizo en Primera": "Baptême en D1",
		"Completar una temporada entera en Primera División.": "Terminer une saison complète en Première Division.",
		"Rey de Europa League": "Roi de la Coupe Europa",
		"Ganar la Europa League.": "Remporter la Coupe Europa.",
		"Pichichi": "Meilleur Buteur",
		"Ganar el Pichichi de la Liga.": "Finir meilleur buteur du championnat.",
		"bota_championsBota de la Champions": "Soulier de la Coupe Elite",
		"Ser el máximo goleador de la Champions.": "Finir meilleur buteur de la Coupe Elite.",
		"bota_europaBota de la Europa League": "Soulier de la Coupe Europa",
		"Ser el máximo goleador de la Europa League.": "Finir meilleur buteur de la Coupe Europa.",
		"Cerebro de la Liga": "Cerveau de la Ligue",
		"Máximo asistente de la Liga.": "Meilleur passeur de la ligue.",
		"Cerebro de Europa": "Cerveau de l'Europe",
		"Máximo asistente de la Champions.": "Meilleur passeur de la Coupe Elite.",
		"nombre del logro max_asist_eulCerebro de la Europa League": "Cerveau de la Coupe Europa",
		"Máximo asistente de la Europa League.": "Meilleur passeur de la Coupe Europa.",
		"COLISIÓN: misma clave ya existe en el dominio 'match' (trofeos) con este MISMO"
		+ " valor; se repite idéntica a propósitoBota de Oro del Mundial":
			"Soulier du Mondial",
		"Máximo goleador del Mundial con tu selección.":
			"Meilleur buteur du Mondial avec ta sélection.",
		"Killer de la Liga": "Tueur de la Ligue",
		"Ganar 3 veces el trofeo de máximo goleador de tu liga.":
			"Remporter 3 fois le trophée de meilleur buteur de ta ligue.",
		"'dueño del área' -> quien manda dentro del área; 'BOX' es el área en inglés"
		+ " británicoDueño del Area":
			"Roi de la Surface",
		"Ganar 5 veces el trofeo de máximo goleador de tu liga.":
			"Remporter 5 fois le trophée de meilleur buteur de ta ligue.",
		"El Que Reparte": "Celui Qui Distribue",
		"Ganar 3 veces el trofeo de máximo asistente de tu liga.":
			"Remporter 3 fois le trophée de meilleur passeur de ta ligue.",
		"Goleador Sin Fronteras": "Buteur Sans Frontières",
		"Ser máximo goleador de la liga en 2 países distintos.":
			"Finir meilleur buteur de la ligue dans 2 pays différents.",
		"el chiste: el gol se entiende en cualquier idiomaEl Gol No Entiende de"
		+ " Idiomas":
			"Le But N'a Pas de Langue",
		"Ser máximo goleador de la liga en 3 países distintos.":
			"Finir meilleur buteur de la ligue dans 3 pays différents.",
		"cabeza de ambas tablas (goles y asistencias); 'Goals & Assists' no cabe en 13"
		+ " caracteresGoles y Pases":
			"Buts et Passes",
		"Máximo goleador Y máximo asistente de tu liga en la misma temporada.":
			"Meilleur buteur ET meilleur passeur de ta ligue la même saison.",
		"Nadie Marca Más": "Personne Ne Marque Plus",
		"Máximo goleador de tu liga Y de la Champions en la misma temporada.":
			"Meilleur buteur de ta ligue ET de la Coupe Elite la même saison.",
		"Estrella del Partido": "Homme du Match",
		"Ser elegido Jugador del Partido.": "Devenir l'Homme du Match.",
		"jugador_mesJugador del Mes": "Joueur du Mois",
		"Ganar el Jugador del Mes.": "Remporter le titre de Joueur du Mois.",
		"Verdugo de España": "Bourreau de l'Espagne",
		"Vencer a todos los clubes de España (las tres divisiones).":
			"Battre tous les clubs d'Espagne (les trois divisions).",
		"Verdugo de Inglaterra": "Bourreau de l'Angleterre",
		"Vencer a todos los clubes de Inglaterra (las tres divisiones).":
			"Battre tous les clubs d'Angleterre (les trois divisions).",
		"Verdugo de Italia": "Bourreau de l'Italie",
		"Vencer a todos los clubes de Italia (las tres divisiones).":
			"Battre tous les clubs d'Italie (les trois divisions).",
		"Verdugo de Alemania": "Bourreau de l'Allemagne",
		"Vencer a todos los clubes de Alemania (las tres divisiones).":
			"Battre tous les clubs d'Allemagne (les trois divisions).",
		"Verdugo de Francia": "Bourreau de la France",
		"Vencer a todos los clubes de Francia (las tres divisiones).":
			"Battre tous les clubs de France (les trois divisions).",
		"Verdugo de Portugal": "Bourreau du Portugal",
		"Vencer a todos los clubes de Portugal (las tres divisiones).":
			"Battre tous les clubs du Portugal (les trois divisions).",
		"'Holland' porque 'the Netherlands' se pasa del ancho del español en la fila"
		+ " del logroVerdugo de Países Bajos":
			"Bourreau des Pays-Bas",
		"Vencer a todos los clubes de Países Bajos (las tres divisiones).":
			"Battre tous les clubs des Pays-Bas (les trois divisions).",
		"Verdugo de Bélgica": "Bourreau de la Belgique",
		"Vencer a todos los clubes de Bélgica (las tres divisiones).":
			"Battre tous les clubs de Belgique (les trois divisions).",
		"Verdugo de Turquía": "Bourreau de la Turquie",
		"Vencer a todos los clubes de Turquía (las tres divisiones).":
			"Battre tous les clubs de Turquie (les trois divisions).",
		"Verdugo de Argentina": "Bourreau de l'Argentine",
		"Vencer a todos los clubes de Argentina (las tres divisiones).":
			"Battre tous les clubs d'Argentine (les trois divisions).",
		"Verdugo de Brasil": "Bourreau du Brésil",
		"Vencer a todos los clubes de Brasil (las tres divisiones).":
			"Battre tous les clubs du Brésil (les trois divisions).",
		"Verdugo de México": "Bourreau du Mexique",
		"Vencer a todos los clubes de México (las tres divisiones).":
			"Battre tous les clubs du Mexique (les trois divisions).",
		"Verdugo de Estados Unidos": "Bourreau des Etats-Unis",
		"Vencer a todos los clubes de Estados Unidos (las tres divisiones).":
			"Battre tous les clubs des États-Unis (les trois divisions).",
		"Verdugo de Arabia Saudí": "Bourreau de l'Arabie Saoudite",
		"Vencer a todos los clubes de Arabia Saudí (las tres divisiones).":
			"Battre tous les clubs d'Arabie Saoudite (les trois divisions).",

		"Verdugo de Escocia": "Bourreau de l'Écosse",
		"Vencer a todos los clubes de Escocia (las tres divisiones).":
			"Battre tous les clubs d'Écosse (les trois divisions).",
		"Verdugo de Grecia": "Bourreau de la Grèce",
		"Vencer a todos los clubes de Grecia (las tres divisiones).":
			"Battre tous les clubs de Grèce (les trois divisions).",
		"Verdugo de Ucrania": "Bourreau de l'Ukraine",
		"Vencer a todos los clubes de Ucrania (las tres divisiones).":
			"Battre tous les clubs d'Ukraine (les trois divisions).",
		"Verdugo de Austria": "Bourreau de l'Autriche",
		"Vencer a todos los clubes de Austria (las tres divisiones).":
			"Battre tous les clubs d'Autriche (les trois divisions).",
		"Verdugo de Suiza": "Bourreau de la Suisse",
		"Vencer a todos los clubes de Suiza (las tres divisiones).":
			"Battre tous les clubs de Suisse (les trois divisions).",
		"Verdugo de Chequia": "Bourreau de la Tchéquie",
		"Vencer a todos los clubes de Chequia (las tres divisiones).":
			"Battre tous les clubs de Tchéquie (les trois divisions).",
		"Verdugo de Croacia": "Bourreau de la Croatie",
		"Vencer a todos los clubes de Croacia (las tres divisiones).":
			"Battre tous les clubs de Croatie (les trois divisions).",
		"Verdugo de Serbia": "Bourreau de la Serbie",
		"Vencer a todos los clubes de Serbia (las tres divisiones).":
			"Battre tous les clubs de Serbie (les trois divisions).",
		"Verdugo de Dinamarca": "Bourreau du Danemark",
		"Vencer a todos los clubes de Dinamarca (las tres divisiones).":
			"Battre tous les clubs du Danemark (les trois divisions).",
		"Verdugo de Noruega": "Bourreau de la Norvège",
		"Vencer a todos los clubes de Noruega (las tres divisiones).":
			"Battre tous les clubs de Norvège (les trois divisions).",
		"Verdugo de Japón": "Bourreau du Japon",
		"Vencer a todos los clubes de Japón (las tres divisiones).":
			"Battre tous les clubs du Japon (les trois divisions).",
		"Verdugo de Corea del Sur": "Bourreau de la Corée du Sud",
		"Vencer a todos los clubes de Corea del Sur (las tres divisiones).":
			"Battre tous les clubs de Corée du Sud (les trois divisions).",
		"Verdugo de Colombia": "Bourreau de la Colombie",
		"Vencer a todos los clubes de Colombia (las tres divisiones).":
			"Battre tous les clubs de Colombie (les trois divisions).",
		"Verdugo de Chile": "Bourreau du Chili",
		"Vencer a todos los clubes de Chile (las tres divisiones).":
			"Battre tous les clubs du Chili (les trois divisions).",
		"Verdugo de Uruguay": "Bourreau de l'Uruguay",
		"Vencer a todos los clubes de Uruguay (las tres divisiones).":
			"Battre tous les clubs d'Uruguay (les trois divisions).",
		"Verdugo de Paraguay": "Bourreau du Paraguay",
		"Vencer a todos los clubes de Paraguay (las tres divisiones).":
			"Battre tous les clubs du Paraguay (les trois divisions).",
		"Verdugo de Ecuador": "Bourreau de l'Équateur",
		"Vencer a todos los clubes de Ecuador (las tres divisiones).":
			"Battre tous les clubs d'Équateur (les trois divisions).",
		"Verdugo de Perú": "Bourreau du Pérou",
		"Vencer a todos los clubes de Perú (las tres divisiones).":
			"Battre tous les clubs du Pérou (les trois divisions).",
		"Verdugo de Bolivia": "Bourreau de la Bolivie",
		"Vencer a todos los clubes de Bolivia (las tres divisiones).":
			"Battre tous les clubs de Bolivie (les trois divisions).",
		"Verdugo de Venezuela": "Bourreau du Venezuela",
		"Vencer a todos los clubes de Venezuela (las tres divisiones).":
			"Battre tous les clubs du Venezuela (les trois divisions).",
		"Verdugo de Egipto": "Bourreau de l'Égypte",
		"Vencer a todos los clubes de Egipto (las tres divisiones).":
			"Battre tous les clubs d'Égypte (les trois divisions).",
		"Verdugo de Marruecos": "Bourreau du Maroc",
		"Vencer a todos los clubes de Marruecos (las tres divisiones).":
			"Battre tous les clubs du Maroc (les trois divisions).",
		"Verdugo de Túnez": "Bourreau de la Tunisie",
		"Vencer a todos los clubes de Túnez (las tres divisiones).":
			"Battre tous les clubs de Tunisie (les trois divisions).",
		"Verdugo de Nueva Zelanda": "Bourreau de la Nouvelle-Zélande",
		"Vencer a todos los clubes de Nueva Zelanda (las tres divisiones).":
			"Battre tous les clubs de Nouvelle-Zélande (les trois divisions).",
		"Némesis del Mundo": "Némésis du Monde",
		"Vencer a TODOS los clubes del juego: cada liga, cada división. La cima del hardcore.":
			"Battre TOUS les clubs du jeu : chaque ligue, chaque division. Le sommet du hardcore.",
		"Nuevo Fichaje": "Nouvelle Recrue",
		"Ser presentado ante tu nueva afición por primera vez.":
			"Se faire présenter à tes nouveaux supporters pour la première fois.",
		"Diez Mil Curiosos": "10 000 Curieux",
		"10.000 personas fueron a tu presentación.":
			"10 000 personnes sont venues à ta présentation.",
		"No Cabe Un Alma": "Salle Comble",
		"Llenar el estadio el día de tu presentación, sin haber jugado un solo minuto.":
			"Remplir le stade le jour de ta présentation, sans avoir joué une seule minute.",
		"'Forty Thousand' (14) se pasa del español (12); el número mantiene el"
		+ " anchoCuarenta Mil":
			"40 000 Fans",
		"40.000 personas fueron a verte firmar.": "40 000 personnes sont venues te voir signer.",
		"Fichaje Galáctico": "Recrue Galactique",
		"Que 65.000 personas vayan a tu presentación. Dejar de ser un jugador para ser una noticia.":
			"Attirer 65 000 personnes à ta présentation. Ne plus être un joueur : devenir un événement.",
		"Ochenta Mil Almas": "Quatre-vingt mille âmes",
		"Que 80.000 personas llenen el estadio SÓLO para verte llegar. Ni un partido, ni un gol: tu nombre.":
			"Que 80 000 personnes remplissent le stade JUSTE pour te voir arriver. Pas un match, pas un but : ton nom.",
		"Siempre Te Esperan": "Ils T'attendent Toujours",
		"Llenar el estadio en TRES presentaciones distintas.":
			"Remplir le stade lors de TROIS présentations différentes.",


		"Rompelíneas": "Perce-Lignes",
		"Ganar tu primer regate.": "Réussir ton premier dribble.",
		"Bailarín": "Danseur",
		"25 regates ganados.": "25 dribbles réussis.",
		"Imparable": "Inarrêtable",
		"100 regates ganados.": "100 dribbles réussis.",
		"Agónico": "Au Buzzer",
		"Marcar en el minuto 85 o después.": "Marquer à la 85e minute ou après.",
		"Rey del Descuento": "Roi du Temps Additionnel",
		"10 goles del minuto 85 en adelante.": "10 buts à partir de la 85e minute.",
		"Noche de Remontada": "Nuit de Remontada",
		"Ganar un partido en el que llegues a ir perdiendo por 2 goles.":
			"Gagner un match où tu étais mené de 2 buts.",
		"Orgullo de la Ciudad": "Fierté de la Ville",
		"Ganar tu primer derbi.": "Gagner ton premier derby.",
		"El Gol que Vale Doble": "Le But qui Vaut Double",
		"Marcar en un derbi.": "Marquer en derby.",
		"Rey del Derbi": "Roi du Derby",
		"Ganar 5 derbis.": "Gagner 5 derbies.",
		"Millonario": "Millionnaire",
		"Juntar 1.000.000 en el banco.": "Amasser 1 000 000 en banque.",
		"Magnate": "Magnat",
		"Juntar 10.000.000 en el banco.": "Amasser 10 000 000 en banque.",
		"Imagen de Marca": "Visage de Marque",
		"Firmar tu primer contrato de patrocinio.": "Signer ton premier contrat de sponsoring.",
		"Hombre Anuncio": "Homme-Pub",
		"Firmar 10 contratos de patrocinio.": "Signer 10 contrats de sponsoring.",
		"Vida de Futbolista": "Vie de Footballeur",
		"Comprar tu primer artículo de estilo de vida.": "Acheter ton premier article lifestyle.",
		"Inversor": "Investisseur",
		"Hacer tu primera inversión.": "Faire ton premier investissement.",
		"Hombre del Vestuario": "Homme du Vestiaire",
		"Responder 25 decisiones.": "Répondre à 25 décisions.",
		"La Voz del Equipo": "La Voix de l'Equipe",
		"Responder 100 decisiones.": "Répondre à 100 décisions.",
		"Vía Bosman": "La Voie Bosman",
		"Firmar por un club siendo agente libre, sin traspaso de por medio.":
			"Signer pour un club en tant qu'agent libre, sans transfert.",
		"Nunca te Enamores de un Cedido": "Coup de Foudre Temporaire",
		"Ser elegido Mejor Jugador del Club en el equipo donde juegas cedido.": "Se faire élire meilleur joueur du club dans l'équipe où tu es prêté.",
		"Ida y Vuelta": "Aller-Retour",
		"Completar una cesión entera y volver a tu club.": "Terminer un prêt complet et revenir dans ton club.",
		"Pasaporte Sellado": "Passeport Tamponné",
		"Jugar en clubes de 3 países distintos.": "Jouer dans des clubs de 3 pays différents.",
		"Ciudadano del Mundo": "Citoyen du Monde",
		"Jugar en clubes de 5 países distintos.": "Jouer dans des clubs de 5 pays différents.",
		"Segunda Vida": "Seconde Vie",
		"Cerrar una carrera entera (hasta el retiro) con un modificador de Nueva Carrera+ activo.":
			"Boucler une carrière entière (jusqu'à la retraite) avec un modificateur Nouvelle Carrière+ actif.",
		"Primera Vitrina": "Première Vitrine",
		"Desbloquear todos los logros comunes.": "Débloquer tous les trophées communs.",
		"Vitrina Azul": "Vitrine Bleue",
		"Desbloquear todos los logros raros.": "Débloquer tous les trophées rares.",
		"título (sale en 2 entradas: entrevista y plato_o_descanso)TE QUIEREN EN EL"
		+ " PLATÓ":
			"ILS TE VEULENT SUR LE PLATEAU",
		"La televisión te invita a la entrevista de la semana. Media tarde de foco,"
		+ " preguntas y sonrisas.":
			"La télé te veut pour l'interview de la semaine. Une demi-journée de"
			+ " projecteurs, de questions et de sourires.",
		"ACUDIR": "J'Y VAIS",
		"PLANTARLES": "LES PLANTER",
		"ACTO DE TU PATROCINADOR": "L'EVENEMENT DE TON SPONSOR",
		"Tu marca monta una firma de autógrafos y te quiere ahí. Pagan aparte, pero es"
		+ " un día entero.":
			"Ta marque organise une séance de dédicaces et te veut sur place. Ils"
			+ " paient à part, mais ça bouffe la journée entière.",
		"IR AL ACTO": "Y ALLER",
		"también en benefico_ciudad (línea 276, fuera de mi rango)EXCUSARTE":
			"TE DEFILER",

		"LA HUELGA DE PRIMAS": "LA GREVE DES PRIMES",
		"El club debe tres meses de primas y la plantilla ha decidido no salir a"
		+ " calentar. El míster está en el túnel mirando el reloj, y hay una cámara en"
		+ " la boca del vestuario.":
			"Le club doit trois mois de primes et l'effectif a décidé de ne pas sortir"
			+ " s'échauffer. Le coach est dans le tunnel à regarder l'horloge, et il y a"
			+ " une caméra à l'entrée du vestiaire.",
		"SUMARTE AL PARO": "REJOINDRE LA GREVE",
		"SALIR A CALENTAR SOLO": "T'ECHAUFFER SEUL",
		"LA FINAL ES EL SÁBADO": "LA FINALE EST SAMEDI",
		"El parte médico dice que no llegas. El míster te lo pide a la cara, delante"
		+ " del cuerpo técnico, y el doctor niega con la cabeza sin decir nada.":
			"Le rapport médical dit que tu n'y seras pas. Le coach te le demande en face,"
			+ " devant le staff, et le médecin secoue la tête sans un mot.",
		"APRETAR LOS DIENTES": "SERRER LES DENTS",
		"HACERLE CASO AL MÉDICO": "ECOUTER LE MEDECIN",
		"Aguantaste: estás disponible para el partido grande.":
			"Tu as tenu bon : tu es disponible pour le grand match.",
		"Se rompió del todo. La baja es larga.":
			"Ça a complètement lâché. La blessure sera longue.",
		"EL EQUIPO VIAJA SIN TI": "L'EQUIPE PART SANS TOI",
		"El autobús sale a las nueve y tu nombre no está en la lista. El doctor dice"
		+ " que el viaje no te hace bien; el vestuario, que verte en el banquillo les"
		+ " hace bien a ellos.":
			"Le bus part à neuf heures et ton nom n'est pas sur la liste. Le médecin dit"
			+ " que le voyage ne te fera pas de bien ; le vestiaire dit que te voir sur"
			+ " le banc leur en fera à eux.",
		"VIAJAR CON LA EXPEDICIÓN": "PARTIR AVEC L'EQUIPE",
		"QUEDARTE EN REHABILITACIÓN": "RESTER EN REEDUCATION",
		"EL PARTE QUE SE FILTRÓ": "LE RAPPORT QUI A FUITE",
		"Un diario publica tu parte médico con dos semanas de más y un titular con la"
		+ " palabra «calvario». El club no fue; alguien de dentro, sí.":
			"Un journal publie ton rapport médical avec deux semaines en plus et un titre"
			+ " avec le mot « calvaire ». Ce n'est pas le club qui a parlé ; quelqu'un"
			+ " de l'intérieur, oui.",
		"DESMENTIRLO A CÁMARA": "DEMENTIR FACE CAMERA",
		"CALLAR Y RECUPERARTE": "TE TAIRE ET TE SOIGNER",
		"EL MÉDICO DE TU AGENTE": "LE MEDECIN DE TON AGENT",
		"Tu agente te manda la tarjeta de un doctor «que hace milagros» y que no es"
		+ " del club. El médico del club no sabe nada, y mejor que siga así.":
			"Ton agent t'envoie la carte d'un médecin « qui fait des miracles » et qui"
			+ " n'est pas du club. Le médecin du club ne sait rien, et mieux vaut que ça"
			+ " reste comme ça.",
		"PROBAR EL TRATAMIENTO": "TENTER LE TRAITEMENT",
		"CONFIAR EN EL CLUB": "FAIRE CONFIANCE AU CLUB",
		"El milagro existe: dos semanas menos de baja.":
			"Le miracle existe : deux semaines de moins d'absence.",
		"Se rompió del todo. Y el club se enteró de dónde.":
			"Ca a complètement lâché. Et le club a su d'où ça venait.",
		"CABE UNO MÁS SI TE BAJAS": "IL Y A DE LA PLACE SI TU BAISSES TON SALAIRE",
		"El club tiene apalabrado a un fenómeno y sólo le falta hueco en la nómina: el"
		+ " tuyo. Te piden por las buenas un 20% de tu ficha, y el vestuario ya sabe"
		+ " que te lo han pedido.":
			"Le club a un phénomène quasiment signé et il ne manque qu'une place dans la"
			+ " masse salariale : la tienne. On te demande gentiment 20% de ton salaire,"
			+ " et le vestiaire sait déjà qu'on te l'a demandé.",
		"BAJARTE EL SUELDO": "ACCEPTER LA BAISSE",
		"NI UN PESO": "PAS UN CENTIME",
		"Te bajas la ficha": "Tu baisses ton salaire",
		"Cobrarás ${0} por partido en vez de ${1}. El club ya tiene su hueco.":
			"Tu toucheras ${0} par match au lieu de ${1}. Le club a sa place.",
		"EL BANDO DEL BRAZALETE": "LE CAMP DU BRASSARD",
		"{0} está señalado y el vestuario busca relevo. Suenan dos nombres: el tuyo y"
		+ " el del veterano que lleva once años aquí.":
			"{0} est pointé du doigt et le vestiaire cherche un remplaçant. Deux noms"
			+ " circulent : le tien et celui du vétéran qui est là depuis onze ans.",


		"MOVER FICHA POR EL BRAZALETE": "POUSSER POUR LE BRASSARD",
		"LA ENTRADA EN EL ENTRENO": "LE TACLE A L'ENTRAINEMENT",
		"Fuiste a por un balón que no era tuyo y {0}, el que te disputa el puesto, se"
		+ " ha ido al vestuario cojeando y sin mirarte. El grupo lo vio todo.":
			"Tu es allé chercher un ballon qui n'était pas à toi et {0}, celui qui te"
			+ " dispute ta place, est reparti au vestiaire en boitant sans te regarder."
			+ " Le groupe a tout vu.",
		"PEDIR PERDÓN DELANTE DE TODOS": "T'EXCUSER DEVANT TOUT LE MONDE",
		"NO DAR EXPLICACIONES": "NE DONNER AUCUNE EXPLICATION",
		"EL CHAVAL TE COMIÓ EL PUESTO": "LE GAMIN T'A PRIS TA PLACE",
		"{0} entró por ti y volvió a hacerlo bien. Te busca al acabar para que le"
		+ " corrijas dos cosas del perfil de tiro. Enseñárselas es enseñárselas.":
			"{0} est entré à ta place et a encore bien fait. Il vient te voir après pour"
			+ " que tu corriges deux détails de sa frappe. Lui montrer, c'est l'armer.",

		"SE ROMPIÓ EL QUE TE PELEA EL PUESTO": "TON RIVAL EST BLESSE",
		"{0} se rompió en el entreno y el puesto es tuyo hasta nuevo aviso. El vestuario mira a ver qué cara pones.":
			"{0} s'est blessé à l'entraînement et la place est à toi jusqu'à nouvel ordre. Le vestiaire regarde ta tête.",
		"LLEVARLE LA REHABILITACIÓN": "L'ACCOMPAGNER EN REEDUCATION",
		"APROVECHAR EL HUECO": "SAISIR TA CHANCE",
		"EL CAPITÁN TE SIENTA": "LE CAPITAINE TE PREND A PART",
		"{0} te aparta antes del entreno con el brazalete en la mano: dice que el grupo"
		+ " está harto de tu forma de celebrar, y que te lo dice él antes de que te lo"
		+ " diga otro.":
			"{0} t'écarte avant l'entraînement, le brassard à la main : il dit que le"
			+ " groupe en a marre de ta façon de célébrer, et qu'il préfère te le dire"
			+ " lui-même avant qu'un autre le fasse.",
		"BAJAR LA CABEZA": "BAISSER LA TETE",
		"CONTESTARLE DELANTE DE TODOS": "LUI REPONDRE DEVANT TOUT LE MONDE",

		"LA VUELTA AL CAMPO": "LE TOUR D'HONNEUR",
		"Campeón. La copa pesa de verdad y el estadio no se va a ir a ninguna parte."
		+ " Queda una vuelta al campo y todos esperan que se la des a alguien.":
			"Champion. La coupe pèse vraiment lourd et le stade ne va nulle part. Il"
			+ " reste un tour d'honneur, et tout le monde s'attend à ce que tu le"
			+ " dédies à quelqu'un.",
		"LEVANTARLA ANTE EL FONDO": "LA LEVER DEVANT LE VIRAGE",
		"QUE LA LEVANTE EL GRUPO": "LAISSER LE GROUPE LA LEVER",
		"LLEVÁRSELA AL MÍSTER": "L'APPORTER AU COACH",
		"LA CIUDAD ESTÁ EN LA CALLE": "LA VILLE EST DANS LA RUE",
		"Ascenso. Hay gente en la avenida desde antes de que acabara el partido, un"
		+ " autobús descapotable esperando y un micrófono que va a llegar a todas"
		+ " las casas.":
			"Montée. Il y a du monde dans l'avenue depuis avant la fin du match, un"
			+ " bus décapotable qui attend et un micro qui va entrer dans toutes les"
			+ " maisons.",
		"PROMETER QUE TE QUEDAS": "PROMETTRE QUE TU RESTES",
		"NOMBRAR UNO A UNO AL VESTUARIO": "CITER LE VESTIAIRE UN PAR UN",
		"PEDIR REFUERZOS EN DIRECTO": "DEMANDER DES RENFORTS EN DIRECT",
		"EL MEJOR DEL MUNDO": "LE MEILLEUR DU MONDE",
		"Jugador del Año. Estás de pie con el trofeo en la mano, la sala en silencio y"
		+ " treinta segundos que se van a repetir el resto de tu carrera.":
			"Joueur de l'Année. Tu es debout, le trophée à la main, la salle silencieuse et"
			+ " trente secondes qu'on repassera le reste de ta carrière.",
		"A LOS QUE TE PASAN EL BALÓN": "A CEUX QUI ME PASSENT LE BALLON",
		"A LA GENTE QUE TE VIO EMPEZAR": "AUX GENS QUI M'ONT VU DEBUTER",
		"AL CAMINO QUE TE TRAJO AQUÍ": "AU CHEMIN QUI M'A MENE ICI",
		"EL MEJOR DE LA TEMPORADA": "LE MEILLEUR DE LA SAISON",
		"Te dan el premio al mejor del año y hay que decir algo. La sala está llena"
		+ " de gente que decide cosas sobre ti: tu club, tu competición y los que"
		+ " escriben.":
			"On te remet le prix du meilleur de l'année et il faut dire quelque chose."
			+ " La salle est pleine de gens qui décident de ton sort : ton club, ta"
			+ " compétition et ceux qui écrivent.",
		"HABLAR DEL EQUIPO QUE TE SOSTUVO": "PARLER DE L'EQUIPE QUI T'A PORTE",
		"AGRADECER AL MÍSTER QUE TE PUSO": "REMERCIER LE COACH QUI T'A FAIT JOUER",
		"DEDICÁRSELO A LA GRADA": "LE DEDIER AUX TRIBUNES",

		"LA CIUDAD ES TUYA": "LA VILLE EST A TOI",
		"Ganasteis el derbi. Hay gente esperando el autobús en la puerta, esta vez"
		+ " para llevaros en volandas, y mañana no se va a hablar de otra cosa en"
		+ " toda la ciudad.":
			"Vous avez gagné le derby. Il y a du monde qui attend le bus dehors, cette"
			+ " fois pour vous porter en triomphe, et demain on ne parlera que de ça"
			+ " dans toute la ville.",
		"CELEBRARLO EN LA VALLA": "LE FETER A LA GRILLE",
		"DECIR QUE SÓLO SON TRES PUNTOS": "DIRE QUE CE N'EST QUE TROIS POINTS",
		"DEDICÁRSELO AL VESTUARIO": "LE DEDIER AU VESTIAIRE",


		"selección": "l'équipe nationale",
		"competidor": "ton rival",
		"TU PRIMERA VEZ CON TU PAÍS": "TA PREMIERE SELECTION",
		"Debutaste con la selección. En el túnel te esperan la cámara de tu país y el"
		+ " utillero con la camiseta del partido, que se guarda o se regala.":
			"Tu as fait tes débuts en sélection. Dans le tunnel t'attendent la caméra de"
			+ " ton pays et l'intendant avec le maillot du match — à garder ou à donner.",
		"ENMARCARLA PARA TU FAMILIA": "L'ENCADRER POUR TA FAMILLE",
		"REGALÁRSELA AL SELECCIONADOR": "LA DONNER AU SELECTIONNEUR",
		"SUBIRLA A TUS REDES": "LA POSTER SUR TES RESEAUX",
		"EL SELECCIONADOR TE APARTA": "LE SELECTIONNEUR TE PREND A PART",
		"Al acabar te lleva a un lado, lejos del grupo. Puedes escuchar lo que tenga"
		+ " que decirte, o aprovechar los dos minutos para pedirle el puesto de"
		+ " titular.":
			"A la fin il t'emmène à l'écart, loin du groupe. Tu peux écouter ce qu'il a"
			+ " à te dire, ou profiter des deux minutes pour lui demander une place de"
			+ " titulaire.",
		"ESCUCHAR Y CALLAR": "ECOUTER ET SE TAIRE",
		"PEDIRLE EL PUESTO": "DEMANDER SA PLACE",
		"Le gustó tu descaro: cuenta contigo.": "Ton culot lui a plu : il compte sur toi.",
		"No era el momento ni el sitio. Tomó nota.":
			"Ce n'était ni le moment ni l'endroit. Il a pris note.",
		"TU CLUB TE RECLAMA": "TON CLUB TE RECLAME",
		"Tu club llamó a la federación: quieren que vuelvas en el primer vuelo y te"
		+ " saltes el segundo partido. El seleccionador te deja elegir a ti, que es la"
		+ " peor parte.":
			"Ton club a appelé la fédération : ils veulent que tu rentres sur le premier"
			+ " vol et que tu sautes le deuxième match. Le sélectionneur te laisse"
			+ " choisir, ce qui est le pire.",
		"VOLVER AL CLUB": "RENTRER AU CLUB",
		"QUEDARTE CON TU PAÍS": "RESTER AVEC TON PAYS",
		"MARCASTE CON TU PAÍS": "TU AS MARQUE AVEC TON PAYS",
		"Gol con la camiseta de tu selección y un micrófono de tu país esperándote. Se"
		+ " puede repartir de tres maneras, y las tres se oyen en tu casa.":
			"But avec le maillot de ta sélection et un micro de ton pays qui t'attend."
			+ " Tu peux le partager de trois façons, et les trois s'entendent chez toi.",
		"AL PAÍS QUE TE VIO NACER": "AU PAYS QUI M'A VU NAITRE",
		"AL SELECCIONADOR QUE TE LLAMÓ": "AU SELECTIONNEUR QUI M'A APPELE",
		"AL CLUB QUE TE PAGA": "AU CLUB QUI ME PAIE",
		"LA PRENSA DE TU PAÍS": "LA PRESSE DE TON PAYS",
		"Perdisteis y el país entero pide explicaciones. Te esperan en zona mixta con"
		+ " la pregunta ya escrita: quién tuvo la culpa.":
			"Vous avez perdu et tout le pays réclame des explications. On t'attend en"
			+ " zone mixte avec la question déjà écrite : qui est fautif.",
		"DAR LA CARA POR EL GRUPO": "ASSUMER POUR LE GROUPE",
		"DECIR QUE TÚ CUMPLISTE": "DIRE QUE TU AS FAIT TON TRAVAIL",
		"NOVENTA MINUTOS MIRANDO": "QUATRE-VINGT-DIX MINUTES A REGARDER",
		"Viajaste medio mundo para calentar dos veces y volver a sentarte. Tu agente"
		+ " quiere que se sepa; el segundo entrenador te ha visto la cara desde el"
		+ " banquillo.":
			"Tu as traversé la moitié du monde pour t'échauffer deux fois et te rasseoir. Ton agent veut que ça se sache ; l'adjoint a vu ta tête depuis le banc.",
		"APLAUDIR DESDE EL BANCO": "APPLAUDIR DEPUIS LE BANC",
		"QUE SE ENTERE TU AGENTE": "LAISSER PARLER TON AGENT",
		"AYUDARLE": "L'AIDER",
		"CERRARLE LA PUERTA": "LUI FERMER LA PORTE",
		"LA CAMISETA DEL RIVAL": "LE MAILLOT DE L'ADVERSAIRE",
		"Su estrella se acerca en el túnel y te ofrece cambiar camisetas. Hay veinte"
		+ " cámaras esperando el gesto, y la grada de tu fondo sigue ahí arriba.":
			"Leur star s'approche dans le tunnel et propose d'échanger les maillots."
			+ " Vingt caméras attendent le geste, et ton virage est toujours là-haut.",
		"CAMBIARLA DELANTE DE TODOS": "L'ECHANGER DEVANT TOUT LE MONDE",
		"DEJARLE CON LA MANO TENDIDA": "LE LAISSER LA MAIN TENDUE",








		"ALGUIEN EN LA MESA DE AL LADO": "QUELQU'UN A LA TABLE D'A COTE",
		"Cena del club, y la conversación de tu mesa lleva una hora girando"
		+ " alrededor de {0}. Te está mirando desde hace rato.":
			"Dîner du club, et depuis une heure la conversation à ta table tourne"
			+ " autour de {0}. Ca fait un moment qu'elle te regarde.",
		"ACERCARTE": "T'APPROCHER",







		"TE LA QUIEREN PRESENTAR": "ILS VEULENT TE LA PRESENTER",
		"Un compañero insiste toda la semana: {0} es amiga de su mujer y ya le"
		+ " habló de ti. Sólo tienes que decir que sí.":
			"Un coéquipier insiste toute la semaine : {0} est une amie de sa femme"
			+ " et elle lui a déjà parlé de toi. Il te suffit de dire oui.",
		"QUE SEA EL SÁBADO": "QUE CE SOIT SAMEDI",
		"NO ESTÁS PARA ESO": "PAS LE MOMENT",
		"TE ESPERABA EN LA PUERTA": "ELLE T'ATTENDAIT A LA PORTE",
		"LA INAUGURACIÓN": "LE VERNISSAGE",
		"Tu marca te lleva a la inauguración de una exposición y no entiendes ni uno de los"
		+ " cuadros. {0} lleva veinte minutos delante del mismo, y acaba de darse cuenta"
		+ " de que la miras a ella.":
			"Ta marque t'emmène au vernissage d'une exposition et tu ne comprends pas un seul tableau. {0} est devant le même depuis vingt minutes, et vient de remarquer que c'est elle que tu regardes.",
		"PREGUNTARLE QUÉ VE": "LUI DEMANDER CE QU'ELLE VOIT",
		"VOLVER CON LOS TUYOS": "RETOURNER AVEC LES TIENS",
		"{0} llevaba dos horas en la puerta de jugadores. No traía camiseta que"
		+ " firmar: traía su número escrito en un papel.":
			"{0} attendait depuis deux heures à la porte des joueurs. Pas de maillot"
			+ " à signer : juste son numéro écrit sur un bout de papier.",
		"GUARDARTE EL PAPEL": "GARDER LE PAPIER",
		"SUBIR AL AUTOBÚS": "MONTER DANS LE BUS",
		"LA LLAVE DE TU CASA": "LES CLES DE CHEZ TOI",
		"{0} lleva media semana durmiendo aquí y sus cosas ya ocupan un cajón."
		+ " Alguien tiene que decirlo en voz alta.":
			"{0} dort ici depuis la moitié de la semaine et ses affaires occupent"
			+ " déjà un tiroir. Quelqu'un doit le dire tout haut.",
		"PEDIRLE QUE SE MUDE": "LUI DEMANDER D'EMMENAGER",
		"TODAVÍA NO": "PAS ENCORE",
		"LA CENA QUE LE DEBES": "LE DINER QUE TU LUI DOIS",
		"Reservaste hace tres semanas y hoy es la noche. También es la noche del"
		+ " vídeo del rival, que el técnico mandó a todo el plantel.":
			"Tu as réservé il y a trois semaines et c'est ce soir. C'est aussi le"
			+ " soir de la vidéo de l'adversaire que le coach a envoyée à tout l'effectif.",
		"IR A CENAR": "ALLER DINER",
		"VER EL VÍDEO": "REGARDER LA VIDEO",
		"OTRA SEMANA FUERA": "ENCORE UNE SEMAINE LOIN",
		"Cuatro días de concentración, el tercer viaje del mes. {0} ya no"
		+ " pregunta cuándo vuelves: mira el calendario y se calla.":
			"Quatre jours de stage, le troisième déplacement du mois. {0} ne"
			+ " demande plus quand tu reviens : elle regarde le calendrier et"
			+ " se tait.",
		"LLAMARLA CADA NOCHE": "L'APPELER CHAQUE SOIR",
		"CONCENTRARTE EN EL PARTIDO": "TE CONCENTRER SUR LE MATCH",
		"SU CUMPLEAÑOS ES HOY": "C'EST SON ANNIVERSAIRE",
		"Es el cumpleaños de {0} y hay treinta personas en tu casa. Mañana a las"
		+ " nueve hay partido y el técnico avisó de que mirará las caras.":
			"C'est l'anniversaire de {0} et il y a trente personnes chez toi."
			+ " Demain à neuf heures il y a match et le coach a prévenu qu'il"
			+ " observerait les têtes.",
		"QUEDARTE HASTA EL FINAL": "RESTER JUSQU'AU BOUT",
		"SUBIR A DORMIR": "ALLER TE COUCHER",
		"HAY QUE HABLAR": "IL FAUT PARLER",
		"{0} apagó la televisión en mitad del resumen de la jornada y se sentó"
		+ " enfrente. Esta conversación llevaba meses pendiente.":
			"{0} a éteint la télé en plein résumé de la journée et s'est assise"
			+ " en face. Cette conversation était en attente depuis des mois.",
		"ESCUCHARLA ENTERA": "L'ECOUTER JUSQU'AU BOUT",
		"DECIRLE QUE NO ES EL MOMENTO": "LUI DIRE QUE CE N'EST PAS LE MOMENT",
		"TE ESPERÓ DESPIERTA": "ELLE T'A ATTENDU EVEILLEE",
		"Son las dos de la mañana, perdisteis, y {0} sigue despierta en la cocina"
		+ " con dos platos servidos. No preguntó por el partido.":
			"Il est deux heures du matin, vous avez perdu, et {0} est encore"
			+ " éveillée dans la cuisine avec deux assiettes servies. Elle n'a"
			+ " pas demandé pour le match.",
		"SENTARTE A CENAR": "T'ASSEOIR POUR DINER",
		"IRTE DERECHO A LA CAMA": "ALLER DIRECT AU LIT",
		"LA FOTO DEL DOMINGO": "LA PHOTO DU DIMANCHE",
		"Una revista ofrece portada: tú y {0}, en casa, ocho páginas. Pagan bien"
		+ " y a ella la fotografiarían por primera vez.":
			"Un magazine propose la une : toi et {0}, chez vous, huit pages."
			+ " Ils paient bien, et ce serait la première fois qu'on la photographie.",
		"ACEPTAR LA PORTADA": "ACCEPTER LA UNE",
		"PROTEGERLA": "LA PROTEGER",
		"ELLA QUIERE SALIR": "ELLE VEUT SORTIR",
		"Ganasteis y {0} ya tiene mesa reservada para las dos de la mañana."
		+ " Mañana hay recuperación a las nueve.":
			"Vous avez gagné et {0} a déjà réservé une table pour deux heures"
			+ " du matin. Demain il y a récupération à neuf heures.",
		"SALIR CON ELLA": "SORTIR AVEC ELLE",
		"MAÑANA HAY TRABAJO": "DEMAIN IL Y A DU TRAVAIL",
		"LA GIRA DE PRETEMPORADA": "LA TOURNEE DE PRESAISON",
		"Tres semanas al otro lado del mundo. El club permite acompañantes, pero"
		+ " el vestuario mira raro al que viaja con pareja.":
			"Trois semaines à l'autre bout du monde. Le club autorise les"
			+ " accompagnants, mais le vestiaire regarde de travers celui qui"
			+ " voyage avec sa compagne.",
		"QUE VENGA CONTIGO": "QU'ELLE VIENNE AVEC TOI",
		"IR SOLO": "Y ALLER SEUL",
		"SE ACABÓ": "C'EST FINI",
		"Las maletas de {0} llevan dos días en el recibidor y esta vez no las"
		+ " está deshaciendo. Lo que queda por decidir no es si se va: es cómo.":
			"Les valises de {0} sont dans l'entrée depuis deux jours et cette"
			+ " fois elle ne les défait pas. Ce qui reste à décider, ce n'est"
			+ " pas si elle part : c'est comment.",
		"SUPLICARLE DELANTE DE TODOS": "LA SUPPLIER DEVANT TOUT LE MONDE",
		"DECIRLE QUE ERA SU DECISIÓN": "LUI DIRE QUE C'ETAIT SON CHOIX",
		"DEJAR QUE LO CUENTE ELLA": "LA LAISSER LE RACONTER",

		"Vivís juntos: ${0} por partido.": "Vous vivez ensemble : ${0} par match.",
		"Estáis empezando. Todavía no vive contigo.":
			"Ca commence à peine. Elle n'habite pas encore avec toi.",
		"ASADO DEL VESTUARIO": "BARBECUE DU VESTIAIRE",
		"Los veteranos organizan un asado y te toca poner la carne. Caro, pero ahí se"
		+ " hacen los amigos.":
			"Les anciens organisent un barbecue et c'est à toi d'apporter la viande."
			+ " Cher, mais c'est là que se font les amitiés.",
		"PAGAR EL ASADO": "PAYER LE BARBECUE",
		"NO HAY TIEMPO": "PAS LE TEMPS",
		"EL TÉCNICO TE LLAMA": "LE COACH T'APPELLE",
		"EL MÍSTER TIENE UNA IDEA": "LE COACH A UNE IDEE",
		"Te enseña la pizarra con tu nombre fuera de tu sitio de siempre: te ve de {0}. Dice que ahí hay hueco y que lo llenas tú.": "Il te montre le tableau avec ton nom hors de ta place habituelle : il te voit en {0}. Il dit qu'il y a un trou là-bas et que tu le combles.",
		"ACEPTAR EL CAMBIO": "ACCEPTER LE CHANGEMENT",
		"PEDIR GARANTÍAS": "DEMANDER DES GARANTIES",
		"SEGUIR EN LO TUYO": "RESTER A TA PLACE",
		"Te promete el puesto y los minutos.": "Il te promet le poste et les minutes.",
		"No le gustó que le pusieras condiciones.": "Il n'a pas aimé que tu poses des conditions.",
		"Puerta cerrada. Puedes escuchar y asentir, o jugártela y pedirle más"
		+ " protagonismo.":
			"Porte fermée. Tu peux écouter et hocher la tête, ou tenter le tout"
			+ " pour le tout et lui demander plus de temps de jeu.",
		"ESCUCHAR": "ECOUTER",
		"PEDIR MÁS": "EN DEMANDER PLUS",
		"¡El técnico te compra la idea!": "Le coach adhère à l'idée !",
		"Mala lectura: al técnico no le gustó.": "Mauvaise lecture : le coach n'a pas aimé.",
		"VISITA A LA CANTERA": "VISITE AU CENTRE DE FORMATION",
		"El club organiza una visita a los niños de la cantera y del hospital. Nadie te"
		+ " obliga.":
			"Le club organise une visite aux jeunes du centre de formation et de"
			+ " l'hôpital. Personne ne t'y oblige.",
		"IR": "Y ALLER",
		"DESCANSAR": "TE REPOSER",
		"título (sale en 2 entradas: polemica y micro_polemica)UN MICRÓFONO CALIENTE":
			"UN MICRO QUI CHAUFFE",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el equipo?'":
			"Un journaliste te tend la perche : 'es-tu vraiment content de ton rôle dans l'équipe ?'",
		"MORDERTE LA LENGUA": "TE MORDRE LA LANGUE",
		"SOLTARLO": "TOUT LACHER",
		"SALIDA DEL EQUIPO": "SORTIE DE L'EQUIPE",
		"El vestuario sale esta noche. Habrá fotos, habrá risas, y mañana habrá"
		+ " entrenamiento.":
			"Le vestiaire sort ce soir. Il y aura des photos, il y aura des rires,"
			+ " et demain il y aura entraînement.",
		"IR CON ELLOS": "Y ALLER AVEC EUX",
		"QUEDARTE": "RESTER",

		"ALBOROTO EN TU CALLE": "REMUE-MENAGE DANS TA RUE",
		"Hay aficionados acampados frente a tu casa desde temprano. Los vecinos ya"
		+ " llamaron dos veces.":
			"Des supporters campent devant chez toi depuis tôt ce matin. Les"
			+ " voisins ont déjà appelé deux fois.",
		"SALIR A FIRMAR": "SORTIR SIGNER",
		"CERRAR CORTINAS": "FERMER LES RIDEAUX",
		"TU MASCOTA AMANECIÓ MAL": "TON ANIMAL S'EST REVEILLE MALADE",
		"No quiso comer y te mira raro. El veterinario bueno atiende hoy... a la"
		+ " hora del entrenamiento de recuperación.":
			"Il n'a pas voulu manger et te regarde bizarrement. Le bon vétérinaire"
			+ " reçoit aujourd'hui... à l'heure de la séance de récupération.",
		"LLEVARLA AL VETERINARIO": "L'EMMENER CHEZ LE VETO",
		"ESPERAR A MAÑANA": "ATTENDRE DEMAIN",
		"Falsa alarma: por la tarde ya corría por la casa.":
			"Fausse alerte : dans l'après-midi il courait déjà partout dans la maison.",
		"Mala noche para los dos. No pegaste ojo.":
			"Mauvaise nuit pour vous deux. Tu n'as pas fermé l'oeil.",
		"ASADO EN TU JARDÍN": "BARBECUE DANS TON JARDIN",
		"Compraste el asador y el vestuario se enteró. 'El sábado en tu casa',"
		+ " dicen. No era pregunta.":
			"Tu as acheté le barbecue et le vestiaire l'a su. 'Samedi chez toi',"
			+ " disent-ils. Ce n'était pas une question.",
		"ENCENDER EL ASADOR": "ALLUMER LE BARBECUE",


		"TARDE DE PISCINA": "APRES-MIDI PISCINE",
		"Hace calor, tu piscina está impecable y media plantilla tiene tu"
		+ " dirección. El timbre va a sonar.":
			"Il fait chaud, ta piscine est impeccable et la moitié de l'effectif"
			+ " a ton adresse. La sonnette va retentir.",
		"ABRIR LA CASA": "OUVRIR LA MAISON",
		"TARDE PARA TI": "APRES-MIDI POUR TOI",
		"PEREGRINACIÓN A TU VITRINA": "PELERINAGE A TA VITRINE",
		"El club pregunta si puedes recibir a los juveniles en tu mansión: quieren"
		+ " ver la vitrina con sus propios ojos.":
			"Le club demande si tu peux recevoir les jeunes dans ta villa : ils"
			+ " veulent voir la vitrine de leurs propres yeux.",
		"RECIBIRLOS": "LES RECEVOIR",
		"OTRA SEMANA": "UNE AUTRE SEMAINE",
		"NOCHE LIBRE": "SOIREE LIBRE",
		"Tus amigos te esperan para una noche de PlayStation. El técnico ofrece una"
		+ " sesión extra de vídeo y tiros a puerta. No llegas a las dos.":
			"Tes amis t'attendent pour une soirée PlayStation. Le coach propose une"
			+ " séance en plus de vidéo et de tirs au but. Tu ne peux pas faire les deux.",
		"PS4 CON LOS AMIGOS": "PS4 AVEC LES POTES",
		"ENTRENAR CON EL DT": "S'ENTRAINER AVEC LE COACH",
		"El programa deportivo de la noche te reserva el asiento bueno. O eso, o el"
		+ " sofá de casa con las piernas en alto.":
			"L'émission sportive du soir te garde la bonne place. Ca, ou le canapé"
			+ " à la maison avec les jambes en l'air.",
		"IR A LA ENTREVISTA": "ALLER A L'INTERVIEW",
		"sale en 2 entradas: plato_o_descanso y dia_libre_tripleDESCANSAR EN CASA":
			"TE REPOSER CHEZ TOI",
		"TODOS TE BUSCAN": "TOUT LE MONDE TE CHERCHE",
		"A la salida hay dos corros: la afición con camisetas y bufandas, y los"
		+ " periodistas con micrófonos. Solo te da tiempo a uno.":
			"A la sortie il y a deux groupes : les supporters avec maillots et"
			+ " écharpes, et les journalistes avec micros. Tu n'as le temps que"
			+ " pour un seul.",
		"FIRMAR A LA AFICIÓN": "SIGNER AUX SUPPORTERS",
		"ATENDER A LA PRENSA": "PARLER A LA PRESSE",
		"DOS CENAS, UNA NOCHE": "DEUX DINERS, UN SEUL SOIR",
		"Tu agente reservó mesa para hablar de tu futuro. El técnico te invitó a la"
		+ " suya para hablar del equipo. Coinciden a la misma hora.":
			"Ton agent a réservé une table pour parler de ton avenir. Le coach t'a"
			+ " invité à la sienne pour parler de l'équipe. Même heure, les deux.",
		"CENAR CON TU AGENTE": "DINER AVEC TON AGENT",
		"CENAR CON EL DT": "DINER AVEC LE COACH",
		"LA TARDE DESPUÉS": "L'APRES-MIDI D'APRES",
		"El readaptador te espera en el gimnasio para soltar piernas. Tu marca, a la"
		+ " misma hora, monta una firma pagada.":
			"Le préparateur physique t'attend en salle pour décrasser les jambes."
			+ " Ta marque, à la même heure, organise une séance de dédicaces payée.",
		"GIMNASIO": "LA SALLE",
		"ACTO DE LA MARCA": "L'EVENEMENT DE LA MARQUE",
		"TERCER TIEMPO": "TROISIEME MI-TEMPS",
		"El vestuario se va a celebrar (o a lamentar) el resultado hasta tarde. En casa"
		+ " te esperaban para cenar tranquilo.":
			"Le vestiaire va fêter (ou noyer) le résultat jusqu'à tard. A la maison"
			+ " on t'attendait pour un dîner tranquille.",
		"sale en 2 entradas: equipo_o_casa y dia_libre_tripleSALIR CON EL EQUIPO":
			"SORTIR AVEC L'EQUIPE",
		"NOCHE EN CASA": "SOIREE A LA MAISON",
		"TE POSTULAN DE CAPITÁN": "ON TE PROPOSE COMME CAPITAINE",
		"El vestuario vota y tu nombre suena para el brazalete. Aceptar es echarte el"
		+ " equipo a la espalda; ceder es un gesto al veterano de siempre.":
			"Le vestiaire vote et ton nom circule pour le brassard. Accepter, c'est"
			+ " prendre l'équipe sur ton dos ; céder, c'est un geste envers le"
			+ " vétéran de toujours.",
		"ACEPTAR EL BRAZALETE": "ACCEPTER LE BRASSARD",
		"APOYAR AL VETERANO": "SOUTENIR LE VETERAN",
		"QUIEREN TU VIDA PRIVADA": "ILS VEULENT TA VIE PRIVEE",
		"Una revista ofrece una fortuna por abrir las puertas de tu casa. Tu agente"
		+ " prefiere que sigas siendo un misterio que se cotiza.":
			"Un magazine offre une fortune pour ouvrir les portes de chez toi. Ton"
			+ " agent préfère que tu restes un mystère qui a de la valeur.",
		"ABRIR LAS PUERTAS": "OUVRIR LES PORTES",
		"MANTENER EL MISTERIO": "GARDER LE MYSTERE",
		"LOS PAPARAZZI": "LES PAPARAZZI",
		"Un fotógrafo lleva días pegado a ti: el coche, el restaurante, la salida del entreno. Anoche te sacó cenando a las tantas y mañana sale en portada.":
			"Un photographe te colle depuis des jours : la voiture, le restaurant, la sortie de l'entraînement. Hier soir, il t'a pris en train de dîner à pas d'heure, et demain c'est en une.",
		"DENUNCIARLO": "PORTER PLAINTE",
		"EL BAILE DE MODA": "LA DANSE A LA MODE",
		"El community manager del club te persigue para grabar el baile viral del"
		+ " momento. El míster odia esas cosas.":
			"Le community manager du club te poursuit pour filmer la danse virale"
			+ " du moment. Le coach déteste ce genre de trucs.",
		"GRABAR EL BAILE": "FILMER LA DANSE",
		"NI DE BROMA": "PAS QUESTION",
		"EL HIJO DEL MÍSTER": "LE FILS DU COACH",
		"En el rondo te toca marcar al hijo del técnico, que anda de pruebas. Puedes"
		+ " hacerle un caño de los que duelen o dejarle lucirse.":
			"Au rondo tu dois marquer le fils du coach, qui est à l'essai. Tu peux"
			+ " lui faire un petit pont qui fait mal, ou le laisser briller.",
		"HACERLE UN CAÑO": "LUI FAIRE UN PETIT PONT",
		"DEJARLE LUCIRSE": "LE LAISSER BRILLER",
		"UN NIÑO BAJO LA LLUVIA": "UN ENFANT SOUS LA PLUIE",
		"Sales muerto y llueve, pero un niño lleva dos horas esperando con tu camiseta"
		+ " y un rotulador.":
			"Tu sors épuisé et il pleut, mais un enfant attend depuis deux heures"
			+ " avec ton maillot et un feutre.",
		"PARARTE A FIRMAR": "T'ARRETER POUR SIGNER",
		"AL AUTOBÚS": "AU BUS",
		"Un periodista te tienta: '¿de verdad estás contento con tu papel en el"
		+ " equipo?'. Una frase gorda vende titulares, pero el míster lo verá.":
			"Un journaliste te tend la perche : 'es-tu vraiment content de ton rôle"
			+ " dans l'équipe ?'. Une grosse phrase vend des titres, mais le coach"
			+ " le verra.",
		"SOLTARLO TODO": "TOUT DIRE",
		"¿CON QUIÉN TE SIENTAS?": "AVEC QUI TU T'ASSOIS ?",
		"Primer viaje con el equipo. En el autobús quedan tres sitios libres, y con quién te sientas se nota.":
			"Premier déplacement avec l'équipe. Il reste trois places libres dans le bus, et avec qui tu t'assois, ça se remarque.",
		"CON LOS VETERANOS": "AVEC LES VETERANS",
		"CON EL MÍSTER": "AVEC LE COACH",
		"GRABANDO PARA REDES": "TOURNAGE POUR LES RESEAUX",
		"TU PRIMERA ENTREVISTA": "TA PREMIERE INTERVIEW",
		"Micrófono delante y una sola pregunta abierta. Lo que digas te retrata.":
			"Micro devant toi et une seule question ouverte. Ce que tu diras te définit.",
		"DEL EQUIPO": "L'EQUIPE",
		"DE TUS METAS": "TES OBJECTIFS",
		"DE LA AFICIÓN": "LES SUPPORTERS",
		"¿A QUIÉN LO DEDICAS?": "A QUI TU LE DEDIES ?",
		"Acabas de marcar y la cámara te busca. El gesto que hagas ahora lo verá todo"
		+ " el estadio.":
			"Tu viens de marquer et la caméra te cherche. Le geste que tu fais"
			+ " maintenant, tout le stade le verra.",
		"AL MÍSTER": "AU COACH",
		"A LA GRADA": "AUX TRIBUNES",
		"A CÁMARA, TU MARCA": "A LA CAMERA, TA MARQUE",
		"DÍA LIBRE": "JOUR DE REPOS",
		"Jornada sin obligaciones. Puedes desconectar en casa, salir con el grupo, o"
		+ " meter horas de gimnasio por tu cuenta.":
			"Une journée sans obligations. Tu peux déconnecter chez toi, sortir"
			+ " avec le groupe, ou enchaîner des heures de salle en solo.",
		"GIMNASIO POR TU CUENTA": "SALLE EN SOLO",
		"LA FOTO DE EQUIPO": "LA PHOTO D'EQUIPE",
		"El fotógrafo coloca la foto de plantilla. Hay hueco delante con el capitán, en"
		+ " el centro entre todos, o pegado al cuerpo técnico.":
			"Le photographe met en place la photo d'effectif. Il y a une place"
			+ " devant avec le capitaine, au centre avec tout le monde, ou collé"
			+ " au staff technique.",
		"DELANTE, PROTAGONISTA": "DEVANT, LA VEDETTE",
		"EN EL CENTRO, CON TODOS": "AU CENTRE, AVEC TOUT LE MONDE",
		"AL LADO DEL MÍSTER": "A COTE DU COACH",
		"TRES MARCAS TE TANTEAN": "TROIS MARQUES TE COURTISENT",
		"Tres patrocinadores mueven ficha a la vez: la deportiva de siempre, una firma"
		+ " de moda, y la marca local de tu ciudad.":
			"Trois sponsors bougent en même temps : l'équipementier de toujours,"
			+ " une marque de mode, et la marque locale de ta ville.",
		"LA DEPORTIVA": "L'EQUIPEMENTIER",
		"LA DE MODA": "LA MODE",
		"LA LOCAL": "LA LOCALE",
		"¿QUÉ SUBES A TUS REDES?": "QUE POSTES-TU ?",
		"Foto lista para publicar tras el partido. Un gesto para la grada, un elogio al"
		+ " vestuario, o un guiño al míster.":
			"Photo prête à publier après le match. Un geste pour les tribunes, un"
			+ " éloge au vestiaire, ou un clin d'oeil au coach.",
		"GUIÑO A LA AFICIÓN": "CLIN D'OEIL AUX SUPPORTERS",
		"ELOGIO AL VESTUARIO": "ELOGE AU VESTIAIRE",
		"GRACIAS, MÍSTER": "MERCI, COACH",
		"NOVATADA EN LA COMIDA": "BIZUTAGE AU REPAS",
		"Primera comida con la plantilla y toca ritual de novato: subirte a la silla a"
		+ " cantar, o marcarte un baile. Elige tu veneno y reza.":
			"Premier repas avec l'effectif et c'est le rituel du nouveau : monter"
			+ " sur la chaise pour chanter, ou te lancer dans une danse. Choisis"
			+ " ton poison et prie.",
		"CANTAR": "CHANTER",
		"Te saliste: el vestuario te corea de pie.":
			"Tu as assuré : le vestiaire te chante debout.",
		"Desafinaste fatal. Qué vergüenza ajena.": "Complètement faux. La honte pour tout le monde.",
		"BAILAR": "DANSER",
		"¡La rompiste! Hasta el utillero lo grabó.":
			"Tu as tout cassé ! Même l'intendant a filmé.",
		"Bailaste terrible. No lo superan.": "Une danse horrible. Ils ne s'en remettent pas.",
		"RETO VIRAL DE DOMINADAS": "DEFI VIRAL DE JONGLES",
		"Un compañero saca el móvil: reto de toques al balón para subirlo a redes. La"
		+ " cámara ya está grabando.":
			"Un coéquipier sort son téléphone : défi de jongles à poster en ligne."
			+ " La caméra tourne déjà.",
		"INTENTARLO": "TENTER LE COUP",
		"¡Clip perfecto! Se hace viral.": "Clip parfait ! Ca devient viral.",
		"Se te cae a la segunda. Meme asegurado.":
			"Il tombe au deuxième contact. Le mème est assuré.",
		"NO ME LA JUEGO": "JE NE PRENDS PAS LE RISQUE",
		"El crack del vestuario te reta a la consola delante de todos. Ganarle da"
		+ " galones; perder, cachondeo para semanas.":
			"Le crack du vestiaire te défie à la console devant tout le monde. Le"
			+ " battre te vaut du galon ; perdre, des semaines de moqueries.",
		"ACEPTAR EL DUELO": "ACCEPTER LE DUEL",
		"¡Le ganas en la prórroga! Respeto total.":
			"Tu le bats en prolongation ! Respect total.",
		"Paliza. Te lo recordarán a diario.": "Une raclée. Ils te le rappelleront tous les jours.",
		"OTRO DÍA": "UNE AUTRE FOIS",
		"NOCHE DE CASINO": "SOIREE CASINO",
		"Tu agente te lleva al casino a 'hacer contactos'. La ruleta llama y él te"
		+ " anima a mojarte.":
			"Ton agent t'emmène au casino pour 'réseauter'. La roulette t'appelle"
			+ " et il t'encourage à tenter le coup.",
		"APOSTAR FUERTE": "MISER GROS",
		"¡Pleno! El agente te mira con otros ojos.":
			"Plein carton ! Ton agent te regarde autrement.",
		"Lo dejas todo en la mesa. Ay.": "Tu laisses tout sur la table. Aïe.",
		"SOLO MIRAR": "JUSTE REGARDER",
		"UN PRONÓSTICO ATREVIDO": "UN PRONOSTIC AUDACIEUX",
		"En directo te piden mojarte con el próximo gran partido. Acertar te hace"
		+ " profeta; fallar, el hazmerreír.":
			"En direct on te demande de te mouiller sur le prochain grand match."
			+ " Réussir fait de toi un prophète ; se tromper, le dindon de la farce.",
		"MOJARTE": "TE MOUILLER",
		"Clavaste el pronóstico. Portada.": "Tu as vu juste. Une du journal.",
		"Ni una. Los memes no perdonan.": "Pas une seule bonne. Les mèmes ne pardonnent pas.",
		"AGUA, NI ME MOJO": "JE NE ME MOUILLE PAS",
		"DUELO DE PENALTIS": "DUEL DE PENALTYS",
		"ACEPTAR": "ACCEPTER",
		"Le ganas la tanda. Ovación del grupo.": "Tu gagnes la séance. Ovation du groupe.",
		"Te para tres. Sonrojo.": "Il t'en arrête trois. La honte.",
		"A LA DUCHA": "AUX DOUCHES",
		"KARAOKE DE CONCENTRACIÓN": "KARAOKE EN STAGE",
		"Noche de karaoke en la concentración. Todos esperan a ver si te atreves con el"
		+ " micro.":
			"Soirée karaoké en stage. Tout le monde attend de voir si tu oses"
			+ " prendre le micro.",
		"COGER EL MICRO": "PRENDRE LE MICRO",
		"¡Estrella de la noche! Grupo rendido.":
			"Star de la soirée ! Le groupe est conquis.",
		"Un desastre. Y alguien lo grabó.": "Un désastre. Et quelqu'un a filmé.",
		"PASAR EL MICRO": "PASSER LE MICRO",
		"ESTRENAR BAILE DE GOL": "UNE NOUVELLE DANSE DE BUT",
		"El vestuario te pincha para que te inventes una celebración nueva para el"
		+ " próximo gol. O sale icónica, o sale ridícula.":
			"Le vestiaire te charrie pour que tu inventes une nouvelle célébration"
			+ " pour ton prochain but. Soit c'est iconique, soit c'est ridicule.",
		"INVENTARME UNO": "EN INVENTER UNE",
		"¡Se copia en todos los patios! Icónico.": "Ca se copie dans toutes les cours ! Iconique.",
		"Ridículo total. Mejor no marcar.": "Ridicule absolu. Mieux vaut ne pas marquer.",
		"CELEBRAR NORMAL": "CELEBRER NORMALEMENT",
		"LA CENA LA PAGAS TÚ": "LE DINER EST POUR TOI",
		"Victoria y el vestuario mira al recién llegado: la cena de celebración la paga el nuevo. Es tradición, y es cara.":
			"Victoire, et le vestiaire regarde le petit nouveau : le dîner de la fête, c'est le nouveau qui paie. C'est la tradition, et ça coûte cher.",
		"PAGAR CON GUSTO": "PAYER DE BON COEUR",
		"ESCAQUEARTE": "TE DEFILER",
		"FUISTE LA FIGURA": "TU AS ETE L'HOMME DU MATCH",
		"Ganasteis y todos preguntan por ti. La sala de prensa está llena y tienes las"
		+ " piernas fundidas.":
			"Vous avez gagné et tout le monde te réclame. La salle de presse est"
			+ " pleine et tu as les jambes en compote.",
		"ATENDER A TODOS": "REPONDRE A TOUT LE MONDE",
		"DIRECTO A CASA": "DROIT A LA MAISON",
		"BUSCANDO CULPABLES": "A LA RECHERCHE DE COUPABLES",
		"Derrota y el vestuario arde. El míster pide explicaciones mirando a los ojos."
		+ " Puedes dar la cara o mirar al suelo.":
			"Défaite et le vestiaire est en feu. Le coach demande des explications"
			+ " en te regardant dans les yeux. Tu peux assumer ou regarder par terre.",
		"DAR LA CARA": "ASSUMER",
		"MIRAR AL SUELO": "REGARDER PAR TERRE",
		"BRONCA EN EL VESTUARIO": "ENGUEULADE AU VESTIAIRE",
		"Tras perder, el capitán monta un pollo y señala a los que no corrieron. Puedes"
		+ " respaldarle o quedarte callado.":
			"Après la défaite, le capitaine monte au créneau et pointe du doigt"
			+ " ceux qui n'ont pas couru. Tu peux le soutenir ou rester silencieux.",
		"RESPALDAR AL CAPITÁN": "SOUTENIR LE CAPITAINE",
		"CALLAR Y AGUANTAR": "TE TAIRE ET ENCAISSER",
		"PREGUNTA ENVENENADA": "QUESTION EMPOISONNEE",
		"Recién perdido, un periodista te empuja a cargar contra el árbitro. Un titular"
		+ " fácil, pero el técnico odia el circo.":
			"Juste après la défaite, un journaliste te pousse à charger contre"
			+ " l'arbitre. Un titre facile, mais le coach déteste le cirque.",
		"CONTENERTE": "TE RETENIR",
		"CARGAR CONTRA TODO": "TOUT DEBALLER",
		"GANASTE EL DERBI": "DERBY GAGNE",
		"El derbi cayó de tu lado y la ciudad es una fiesta. La grada corea tu nombre y"
		+ " te invitan a salir a celebrar hasta el amanecer.":
			"Le derby a tourné en ta faveur et la ville est en fête. Les tribunes"
			+ " scandent ton nom et on t'invite à sortir fêter ça jusqu'à l'aube.",
		"CELEBRAR CON LA GRADA": "FETER AVEC LES TRIBUNES",
		"CELEBRAR CON MODESTIA": "FETER DISCRETEMENT",
		"EL RETO DEL DERBI": "LE DEFI DU DERBY",
		"Antes del derbi el vestuario se retó: el que marque, se rapa. Marcaste. Ahora toca cumplir delante de las cámaras… o rajarte.":
			"Avant le derby le vestiaire s'est lancé un défi : celui qui marque se rase la tête. Tu as marqué. Maintenant il faut tenir parole devant les caméras... ou te dégonfler.",
		"CUMPLIR Y RAPARTE": "TENIR PAROLE ET TE RASER",
		"¡Leyenda del vestuario! La grada lo adora.":
			"Légende du vestiaire ! Les tribunes adorent.",
		"El corte sale fatal. Cachondeo eterno.":
			"La coupe est ratée. Moqueries éternelles.",
		"RAJARTE": "TE DEGONFLER",
		"MOLESTIA A CUESTAS": "UNE GENE QUI TRAINE",
		"Arrastras una molestia. El médico aconseja parar; el míster quiere verte en el"
		+ " próximo entreno fuerte, sin excusas.":
			"Tu traînes une gêne. Le médecin conseille d'arrêter ; le coach veut"
			+ " te voir au prochain entraînement à fond, sans excuses.",
		"FORZAR POR EL MÍSTER": "FORCER POUR LE COACH",
		"HACER CASO AL MÉDICO": "ECOUTER LE MEDECIN",
		"TU CIUDAD TE LLAMA": "TA VILLE T'APPELLE",
		"Tu ciudad natal organiza un partido benéfico y quieren tu cara en el cartel."
		+ " Es un día entero fuera.":
			"Ta ville natale organise un match caritatif et veut ta tête sur"
			+ " l'affiche. C'est une journée entière loin d'ici.",
		"IR AL BENÉFICO": "JOUER LE CARITATIF",
		"EXCUSARTE": "TE DEFILER",
		"ELIGES DORSAL": "CHOISIR TON NUMERO",
		"El utillero te deja elegir número: el 10 mediático que todos miran, el del"
		+ " ídolo que se retiró, o uno humilde de currante.":
			"L'intendant te laisse choisir ton numéro : le 10 médiatique que tout"
			+ " le monde regarde, celui de l'idole retraitée, ou un numéro humble"
			+ " de travailleur de l'ombre.",
		"EL 10 MEDIÁTICO": "LE 10 MEDIATIQUE",
		"EL DEL ÍDOLO": "CELUI DE L'IDOLE",
		"UNO DISCRETO": "UN NUMERO DISCRET",
		"CAMPEONATO DE DARDOS": "CHAMPIONNAT DE FLECHETTES",
		"En la concentración montan un torneo de dardos con piques de por medio. El que"
		+ " gana, manda esa semana.":
			"En stage ils montent un tournoi de fléchettes avec de la rivalité au"
			+ " milieu. Celui qui gagne commande cette semaine-là.",
		"APUNTARTE": "T'INSCRIRE",
		"¡Campeón! Mandas en el vestuario.": "Champion ! Tu commandes au vestiaire.",
		"Última ronda de vergüenza.": "Dernier de la tournée. La honte.",
		"EL PRESIDENTE BAJA": "LE PRESIDENT DESCEND",
		"Tras la victoria el presidente baja eufórico al vestuario a felicitar uno por"
		+ " uno. Todos miran a quién saluda primero.":
			"Après la victoire le président descend euphorique au vestiaire féliciter"
			+ " tout le monde un par un. Tous regardent qui il salue en premier.",
		"DEDICARLE LA VICTORIA": "LUI DEDIER LA VICTOIRE",
		"CELEBRAR CON EL GRUPO": "FETER AVEC LE GROUPE",

		"El mundo": "Le monde",
		"Fase final de Conference": "Phase finale de la Coupe Challenge",
		"El club te ofrece cambiar de dorsal (llevas el {0})":
			"Le club te propose de changer de numéro (tu portes le {0})",
		"ESTÁS EN EL ONCE DE {0}": "TU ES DANS LE ONZE DE {0}",
		"El seleccionador te pone de salida. Tu puntuación ({0}) supera el corte del once ({1}).":
			"Le sélectionneur te titularise. Ta note ({0}) dépasse le seuil du onze ({1}).",
		"CONVOCADO POR {0}": "CONVOQUE PAR {0}",
		"Entras en la lista de 23 y empiezas en el banquillo. Para el once te faltan {0} puntos.":
			"Tu entres dans la liste des 23 et démarres sur le banc. Il te manque {0} points pour le onze.",
		"FUERA DE LA LISTA DE {0}": "HORS DE LA LISTE DE {0}",
		"El seleccionador no te llama esta vez. Tu puntuación es {0} y el último convocado marca {1}: te faltan {2}.":
			"Le sélectionneur ne te convoque pas cette fois. Ta note est {0} et le dernier convoqué a {1} : il te manque {2}.",
		"Le quitaste el sitio a {0}.": "Tu as pris la place de {0}.",
		"El once lo tiene {0}, con {1}.": "{0} a la place dans le onze, avec {1}.",
		"El último de la lista es {0}, con {1}.": "Le dernier de la liste est {0}, avec {1}.",
		"AMISTOSO: el seleccionador prueba gente y el corte baja {0} puntos. {1}":
			"AMICAL : le sélectionneur teste du monde et le niveau requis baisse de {0} points. {1}",
		"TE PIDEN: {0} ({1}/{2})": "ON TE DEMANDE : {0} ({1}/{2})",
		"Juega {0} partidos con tu país.": "Joue {0} matchs avec ton pays.",
		"Marca {0} goles con tu país.": "Marque {0} buts avec ton pays.",
		"Cumpliste lo que te pidió {0}": "Tu as fait ce que {0} t'a demandé",
		"No cumpliste lo que te pidió {0}": "Tu n'as pas fait ce que {0} t'a demandé",
		"CAPITÁN de {0}": "CAPITAINE de {0}",
		"Perdiste el brazalete de {0}": "Tu as perdu le brassard de {0}",
		"PERDISTE EL BRAZALETE": "BRASSARD PERDU",
		"{0} {1} · TU MEDIA {2}": "{0} {1} · TOI {2}",
		"EL TÉCNICO NUEVO REPARTE DE CERO": "NOUVEAU COACH, TOUT A ZERO",
		"VESTUARIO NUEVO": "AUTRE VESTIAIRE",
		"SE QUEDA EN {0}": "RESTE A {0}",
		"BRAZALETE": "BRASSARD",
		"BRAZALETE TUYO": "TON BRASSARD",
		"SIN RIVAL": "PERSONNE",
		"FRENADO POR TU PALABRA": "TU AS DONNE TA PAROLE",
		"BRAZALETE: {0}/{1} PARTIDOS · SELECCIONADOR {2}/{3} · VESTUARIO {4}/{5} · SIENDO TITULAR": "BRASSARD : {0}/{1} SELECTIONS · SELECTIONNEUR {2}/{3} · VESTIAIRE {4}/{5} · TITULAIRE",
		"¡{0} se clasificó para {1}!": "{0} s'est qualifié pour {1} !",

		"Dieciseisavos": "Seizièmes",
		"Ronda": "Manche",
		"AMISTOSO": "AMICAL",
		"TUS TIROS": "TES TIRS",
		"LOS AMISTOSOS": "LES AMICAUX",
		"TORNEO EUROPEO": "TOURNOI EUROPEEN",
		"TORNEO SUDAMERICANO": "TOURNOI SUD-AMERICAIN",
		"TORNEO NORTEAMERICANO": "TOURNOI NORD-AMERICAIN",
		"TORNEO ASIÁTICO": "TOURNOI ASIATIQUE",
		"TORNEO AFRICANO": "TOURNOI AFRICAIN",
		"TORNEO DE OCEANÍA": "TOURNOI D'OCEANIE",
		"TORNEO CONTINENTAL": "TOURNOI CONTINENTAL",
		"DIF": "DIF",
		"CC": "CEL",
		"CEU": "CEU",
		"CCF": "CCH",
		"Pediste salir: el club te ofrece a quien pregunte, también con el mercado cerrado. Estas ofertas no caducan con la ventana.":
			"Tu as demandé à partir : le club te propose à qui le demande, même mercato fermé. Ces offres n'expirent pas avec la fenêtre.",
		"16avos": "16es",
		"DISTANCIA": "DISTANCE",
		"T": "S",
		"DENTRO DEL ÁREA": "DANS LA SURFACE",
		"FUERA DEL ÁREA": "HORS DE LA SURFACE",
		"DE MUY LEJOS": "DE TRES LOIN",
		"PRODIGIO": "PRODIGE",
		"HEREDERO": "HERITIER",
		"RECOMENDADO": "RECOMMANDE",
		"KILLER NATO": "TUEUR NE",
		"HIJO DE LEYENDA": "FILS DE LEGENDE",


		"PICARDIA": "MALICE",
		"MANO FRIA": "SANG-FROID",
		"CARA DE ANUNCIO": "VISAGE DE PUB",
		"EL TELEFONO": "LE TELEPHONE",
		"EL NUEVE": "LE NEUF",
		"EL QUE VOLVIO": "CELUI QUI EST REVENU",
		"EL DEPORTIVO": "LA SPORTIVE",
		"EL PATIO DE LA FAMILIA": "LA COUR DE LA FAMILLE",
		"EL PREPARADOR DE LA FAMILIA": "LE PREPARATEUR DE LA FAMILLE",
		"RECUPERACION": "RECUP",
		"Cuarenta mil personas fueron a verte firmar y te compraste el coche. Llegas tarde a entrenar, pero llegas: la prensa te adora y el vestuario menos.":
			"Quarante mille personnes sont venues te voir signer, alors tu as acheté la voiture. Tu arrives en retard à l'entraînement, mais tu arrives : la presse t'adore, le vestiaire beaucoup moins.",
		"El terreno de la familia ya era tuyo antes de firmar nada. La casa la levantas tú, pero el sitio donde ponerla no lo pagas.":
			"Le terrain de la famille était à toi avant même que tu signes quoi que ce soit. La maison, tu la construis ; l'endroit où la poser, tu ne le paies pas.",
		"El que puso en pie a tu padre te conoce desde niño. Te recuperas entre partidos como nadie de tu edad, y a él no hay que pagarle.":
			"Celui qui a remis ton père sur pied te connaît depuis tout petit. Tu récupères entre les matchs comme personne de ton âge, et lui ne se fait pas payer.",
		"EL AHIJADO": "LE FILLEUL",
		"BOTAS DE ORO": "CRAMPONS D'OR",
		"PIERNAS DE NIÑO": "JAMBES DE GAMIN",
		"El uno contra uno lo aprendiste en una cancha sin red: +4 de regate desde el debut.":
			"Le un contre un, tu l'as appris sur un terrain sans filet : +4 en dribble dès tes débuts.",
		"Cuando pitan penalti, el balón lo coges tú: +5 de penales, que es lo que decide quién lo tira en tu equipo.":
			"Quand l'arbitre siffle penalty, c'est toi qui prends le ballon : +5 en penalty, et c'est ça qui décide qui tire dans ton équipe.",
		"Sales bien en foto y la prensa lo nota: empiezas con la puerta de los patrocinios abierta, no en tu segunda temporada.":
			"Tu passes bien en photo et la presse l'a remarqué : tu démarres avec la porte des sponsors déjà ouverte, pas à ta deuxième saison.",
		"Tienes el teléfono de alguien que mueve fichas: tu agente arranca con la mesa llena y el mercado abierto desde el primer mes.":
			"Tu as le numéro de quelqu'un qui fait bouger les joueurs : ton agent démarre avec le bureau plein et le marché ouvert dès le premier mois.",
		"El área es tuya: +3 de potencia, y si el 9 está libre en tu club, te lo guardan.":
			"La surface est à toi : +3 en puissance, et si le 9 est libre dans ton club, on te le garde.",
		"Ya jugaste aquí una vez y nadie lo olvidó: la grada te espera y la prensa te da el beneficio de la duda.":
			"Tu as déjà joué ici et personne ne l'a oublié : les tribunes t'attendent et la presse t'accorde le bénéfice du doute.",
		"En este vestuario tu apellido ya sonaba: el técnico te conoce antes de verte jugar, y la prensa lo sabe.":
			"Dans ce vestiaire, ton nom disait déjà quelque chose : le coach te connaît avant de te voir jouer, et la presse le sait.",
		"Tres trofeos de goleador vinieron con unas CORONA DE ORO. Estrenas un par, sin estrenar y sin pagar.":
			"Trois trophées de meilleur buteur sont venus avec une paire de COURONNE D'OR. Tu démarres avec une paire neuve que tu n'as pas payée.",
		"Las piernas no se acuerdan de los años: +6 a velocidad, aceleración y regate de salida.":
			"Tes jambes ne se souviennent pas des années : +6 en vitesse, accélération et dribble au départ.",
		"TE LLEVAS": "TU EMPORTES",
		"PASO 2 DE 3 · LO QUE TE GANASTE": "ETAPE 2 SUR 3 · CE QUE TU AS GAGNE",
		"LIBRES": "LIBRES",
		"POR DESBLOQUEAR": "A DEBLOQUER",
		"VIDA": "DUREE",
		"LESION": "BLESSURE",
		"BANCO": "BANQUE",
		"TUS VENTAJAS": "TES ATOUTS",
		"BOTAS HEREDADAS": "VIEUX CRAMPONS",
		"CON CARTEL": "UN NOM CONNU",
		"PIE EDUCADO": "PIED FIN",
		"MANO DERECHA": "BRAS DROIT",
		"EL DIEZ": "LE DIX",
		"CUERPO DE HIERRO": "CORPS DE FER",
		"FICHAJE DE ORO": "RECRUE EN OR",
		"SANGRE AZUL": "SANG BLEU",
		"SE ABRE CON": "OUVERT PAR",
		"Lo que te ganaste en carreras anteriores. Cada ventaja gasta puntos de legado, y no alcanzan para todas: elige con cuáles arrancas —o con ninguna, y empieza de cero como todos.": "Ce que tu as gagné dans tes carrières passées. Chaque avantage coûte des points d'héritage, et ils ne suffisent jamais pour tout : choisis avec quoi tu démarres — ou avec rien, et repars de zéro comme les autres.",
		"Te quedaste las botas de aquel año en Tercera. Estrenas unas TRUENO XT: pegan más fuerte, y duran lo que duran.": "Tu as gardé les crampons de cette saison en troisième division. Tu débutes en TRUENO XT : ça frappe plus fort, et ça dure ce que ça dure.",
		"Llegas con cartel: la grada ya coreó tu nombre una vez y te lo guarda.": "Tu arrives précédé d'une réputation : ce public a déjà chanté ton nom une fois, et il s'en souvient.",
		"Los primeros diez goles no se olvidan: +3 de precisión desde el debut.": "On n'oublie pas ses dix premiers buts : +3 en précision dès tes débuts.",
		"Un agente con oficina te firma antes que ningún club: más puertas y menos comisión. Su cuota mensual, también desde el día uno.": "Un agent avec un bureau te signe avant le moindre club : plus de portes, moins de commission. Et ses honoraires mensuels dès le premier jour.",
		"Ya llevaste el 10 y no se te olvidó: +3 de visión, y si el 10 está libre en tu club, te lo guardan.": "Tu as porté le 10 et tu ne l'as pas oublié : +3 en vision, et si le 10 est libre dans ton club, il est pour toi.",
		"Trescientos partidos enseñan a caer: 20% menos de riesgo de lesión, toda la carrera.": "Trois cents matchs, ça apprend à tomber : 20% de risque de blessure en moins, toute la carrière.",
		"Heredas el apellido y la casa: entras a vivir el primer día. El mantenimiento también se hereda.": "Tu hérites du nom et de la maison : tu emménages le premier jour. L'entretien s'hérite aussi.",
		"No llegas a pelear un sitio: llegas a ocuparlo. Un peldaño más de rol en tu contrato de debut.": "Tu n'arrives pas pour te battre pour une place : tu arrives pour la prendre. Un cran de plus dans ton contrat de débuts.",
		"El seleccionador ya sabe quién eres: empiezas con crédito para entrar en la primera lista.": "Le sélectionneur sait déjà qui tu es : tu démarres avec du crédit pour la première liste.",
		"Naciste con algo. Empiezas con 3 puntos de habilidad por repartir.":
			"Tu es né avec quelque chose. Tu commences avec 3 points de compétence à répartir.",
		"La familia te respalda: +$35.000 en el banco desde el primer día.":
			"La famille te soutient : +35 000 $ en banque dès le premier jour.",
		"El técnico ya oyó hablar de ti. Debutas con su confianza, no en la grada.":
			"L'entraîneur a déjà entendu parler de toi. Tu débutes avec sa confiance, pas en tribune.",
		"El gol lo llevas puesto: +6 a potencia, precisión y efecto de salida.":
			"Le but, tu l'as dans le sang : +6 en puissance, précision et effet de frappe.",
		"Cargas un apellido: +$20.000 y 2 puntos de habilidad. La sombra pesa.":
			"Tu portes un nom : +20 000 $ et 2 points de compétence. L'ombre pèse lourd.",
		"Véncelo en un partido (con cualquier carrera) para desbloquearlo.":
			"Bats-le en match (avec n'importe quelle carrière) pour le débloquer.",
		"Completa una temporada en {0}ª división o ficha por un club de {1}ª para desbloquear.":
			"Termine une saison en {0}e division ou signe dans un club de {1}e pour débloquer.",
		"LIGA ESPAÑOLA": "LIGUE ESPAGNOLE",
		"LIGA INGLESA": "LIGUE ANGLAISE",
		"LIGA ITALIANA": "LIGUE ITALIENNE",
		"LIGA ALEMANA": "LIGUE ALLEMANDE",
		"LIGA MEXICANA": "LIGUE MEXICAINE",
		"LIGA LUSA": "LIGUE LUSITANIENNE",
		"LIGA FRANCESA": "LIGUE FRANCAISE",
		"LIGA NEERLANDESA": "LIGUE NEERLANDAISE",
		"LIGA BRASILEÑA": "LIGUE BRESILIENNE",
		"LIGA ARGENTINA": "LIGUE ARGENTINE",
		"LIGA AMERICANA": "LIGUE AMERICAINE",
		"LIGA SAUDI": "LIGUE SAOUDIENNE",
		"LIGA TURCA": "LIGUE TURQUE",
		"LIGA BELGA": "LIGUE BELGE",
		"{0}G {1}A · {2} · {3}": "{0}B {1}P · {2} · {3}",
		"EQUIPO ENCENDIDO": "EQUIPE EN FEU",
		"EQUIPO FRÍO": "EQUIPE FROIDE",
		"PORTERO EN LOS NERVIOS": "GARDIEN A CRAN",
		"PORTERO TENSO": "GARDIEN TENDU",




		"Diagonal del extremo": "Diagonale de l'ailier",
		"El pasillo interior": "Le demi-espace",
		"El embudo": "L'entonnoir",
		"La defensa volcada": "Défense déportée",
		"Doblada por fuera": "Débordement extérieur",
		"Aislado en la banda": "Isolé sur l'aile",
		"La subida por fuera": "Montée par l'extérieur",
		"El tercer hombre": "Le troisième homme",
		"Indirecta al costado del área": "Coup franc à côté de la surface",
		"Indirecta de segunda línea": "Coup franc de loin",
		"Contra el muro replegado": "Contre le mur replié",
		"Presión alta tras la pérdida": "Pressing haut après la perte",
		"Contra tras córner rival": "Contre après corner adverse",
		"Ley de la ventaja": "Loi de l'avantage",
		"Tres contra tres": "Trois contre trois",
		"Falta lejana colgada al área": "Coup franc lointain centré dans la surface",
		"Falta lejana desde la banda": "Coup franc lointain sur l'aile",
		"Falta desde tres cuartos": "Coup franc des trois quarts",
		"Cambio corto": "Changement court",
		"Cambio de banda": "Renversement du jeu",
		"Cambio largo": "Changement long",
		"Salir de la presión": "Sortir du pressing",
		"Cruza el medio campo": "Franchis la ligne médiane",

		"¡LA RECUPERASTE! ATACA": "TU L'AS RECUPERE ! ATTAQUE",
		"GOL EN CONTRA": "BUT ENCAISSE",
		"DESBORDADO": "BATTU",
		"LA PARÓ TU PORTERO": "TON GARDIEN L'A ARRETEE",
		"LE DEJASTE TIRAR": "TU L'AS LAISSE TIRER",
		"Recuperar el balón": "Récupérer le ballon",
		"DEFENSA": "DEFENDRE",
		"El balón NO es tuyo. Métete entre él y tu portería: al llegarle bien puesto, se la quitas.": "Le ballon n'est PAS à toi. Place-toi entre lui et ton but : arrive bien placé et tu le récupères.",
		"Te la sirven": "On te la sert",
		"Te la traen conduciendo y te la pasan. Apunta y remátala de primera, o se te escapa.": "Il arrive balle au pied et te la passe. Vise et reprends-la directement, ou elle file.",
		"Espera el pase; luego jala y suelta": "Attends la passe ; puis tire et relâche",
		"REMATE AÉREO": "FINITION AERIENNE",
		"Cabezazos": "Coups de tête",
		"Voleas": "Volées",
		"Chilenas": "Retournés",
		"Te cuelgan el centro a la cabeza. Espera a que llegue y cabecea a puerta.": "On te centre sur la tête. Attends qu'il arrive et reprends de la tête vers le but.",
		"Espera el centro; luego jala y suelta": "Attends le centre ; puis tire et relâche",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que toque el suelo.": "On te la met sur la poitrine : tu contrôles et tu reprends de volée avant qu'elle touche le sol.",
		"Espera el control; luego jala y suelta": "Attends le contrôle ; puis tire et relâche",
		"Saltas de espaldas al arco: apunta a puerta aunque no la veas.": "Tu sautes dos au but : vise-le même sans le voir.",
		"Raso al pie": "Au ras du sol",
		"Te la ponen botando": "Servie en rebond",
		"¡De primera!": "Du premier coup !",
		"Espera el momento perfecto": "Attends le moment parfait",
		"¡Cabecea!": "De la tête !",
		"Tocada a destiempo": "Mauvais timing",
		"Tocada de refilón": "Contact fuyant",
		"¡Al primer toque!": "Première touche !",
		"¡Al bote pronto!": "Demi-volée !",
		"¡Cazada al bote!": "Prise au rebond !",
		"El bote te ganó": "Le rebond t'a eu",
		"Bote de refilón": "Rebond mal frappé",
		"¡La bajaste y pegaste!": "Amortie et frappe !",
		"¡Control y tiro!": "Contrôle et tir !",
		"Tiro a destiempo tras el control": "Tir à contretemps après le contrôle",
		"De refilón tras el control": "Frappe de biais après le contrôle",
		"¡Cabezazo pleno!": "Tête pleine !",
		"¡Con toda la frente!": "De tout le front !",
		"Saltaste a destiempo": "Saut à contretemps",
		"De refilón con la frente": "De biais avec le front",
		"¡Volea!": "Volée !",
		"¡De pecho y volea!": "Poitrine et volée !",
		"Volea a destiempo": "Volée à contretemps",
		"Volea de refilón": "Volée de biais",
		"¡Chilena de libro!": "Retourné d'école !",
		"Chilena a destiempo": "Retourné à contretemps",
		"Chilena de refilón": "Retourné de biais",
		"Saltaste tarde": "Saut trop tardif",
		"Chilena tardía": "Retourné trop tardif",
		"Te adelantaste a la volea": "Volée trop précipitée",
		"Volea tardía": "Volée trop tardive",
		"Raso del lado ciego": "Au ras, côté aveugle",
		"Raso a la carrera": "Au ras, en course",
		"Tensa por el aire": "Tendue dans les airs",
		"Te la cuelgan": "Centre flotté",
		"Raso con rosca": "Au ras avec effet",
		"Raso largo": "Long au ras du sol",
		"Filtrado al hueco": "Dans la profondeur",
		"Filtrado con rosca": "Dans la profondeur, avec effet",
		"Con comba": "Brossée",
		"Centro a la cabeza": "Centre pour ta tête",
		"Centro al pecho": "Centre sur ta poitrine",
		"Centro a la chilena": "Centre pour un retourné",
		"Cambio de juego": "Renversement de jeu",
		"Centro de la otra banda": "Centre de l'autre aile",
		"Al pecho desde la otra banda": "Centre de l'autre aile sur la poitrine",
		"Al pecho desde la banda": "Centre de l'aile sur la poitrine",
		"Botando desde lejos": "En rebond de loin",
		"Chilena desde la otra banda": "Retourné sur un centre de l'autre aile",
		"A media altura": "À mi-hauteur",
		"Botando de muy lejos": "Rebond de très loin",
		"Centro con rosca": "Centre brossé",
		"Chilena con rosca": "Centre brossé pour un retourné",
		"Al pecho con rosca": "Centre brossé sur la poitrine",
		"Tras el punto penal": "Derrière le point de penalty",
		"Córner a la cabeza": "Corner pour ta tête",
		"Córner a la chilena": "Corner pour une retournée",
		"Córner al borde del área": "Corner à l'entrée de la surface",
		"Falta colgada a la cabeza": "Coup franc brossé pour ta tête",
		"Falta colgada a la chilena": "Coup franc brossé pour une retournée",
		"Falta colgada al pecho": "Coup franc brossé sur ta poitrine",
		"En la frontal": "Aux abords de la surface",
		"En el área": "Dans la surface",
		"En el área chica": "Dans les six mètres",
		"Escorado en el área": "Excentré dans la surface",
		"Al costado del área": "À côté de la surface",
		"Pegado a la banda": "Collé à la ligne",
		"Centrar por la banda": "Centrer depuis l'aile",
		"Pon el CENTRO a un compañero: se gana completándolo, no tirando a puerta.": "Mets le CENTRE sur un coéquipier : tu gagnes en le réussissant, pas en tirant.",
		"Cuelga el centro a un compañero": "Dépose le centre sur un coéquipier",
		"Centro corto": "Centre court",
		"Centro largo": "Centre long",
		"¡Centro puesto!": "Centre réussi !",
		"El centro no llegó": "Le centre n'est pas arrivé",
		"notaCENTRO PUESTO": "CENTRE REUSSI",
		"Arrastra para correr; no hay nada más que tocar": "Glisse pour courir ; il n'y a rien d'autre à toucher",
		"Ponte entre el balón y tu portería para robar. Al recuperar, sigue arrastrando y ataca.": "Place-toi entre le ballon et ton but pour le récupérer. Continue à glisser pour attaquer.",
		"Arrastra para correr; toca con un segundo dedo para barrerte": "Glisse pour courir ; touche avec un second doigt pour tacler",
		"POSTE": "POTEAU",
		"FALTA": "FAUTE",
		"RECUPERADA": "BALLON RECUPERE",
		"TE DESBORDÓ": "IL T'A DEBORDE",
		"Campo abierto": "Jeu ouvert",
		"PASE": "PASSE",
		"Tu fondo: los minutos que aguantas —a tope juegas los 90' y llegas a la prórroga—, lo que te cuesta cada partido y lo que repones. También te hace menos propenso a lesionarte.":
			"Ton coffre : les minutes que tu tiens — au maximum tu joues les 90 et tu atteins la prolongation —, ce que chaque match te coûte et ce que tu récupères. Il te rend aussi moins sujet aux blessures.",
		"Copa de Campeones": "Coupe Elite",
		"Copa Europa": "Coupe Europa",
		"Copa Conferencia": "Coupe Challenge",
		"Jugador del Año": "Joueur de l'Année",


		"Bota (Liga)": "Soulier (Champ.)",
		"Mejor (Copa de Campeones)": "Meilleur (Coupe Elite)",
		"Bota (Copa de Campeones)": "Soulier (Coupe Elite)",
		"Asist. (Copa de Campeones)": "Passes (Coupe Elite)",
		"Mejor (Copa Europa)": "Meilleur (Coupe Europa)",
		"Bota (Copa Europa)": "Soulier (Coupe Europa)",
		"Asist. (Copa Europa)": "Passes (Coupe Europa)",
		"Mejor (Copa Conferencia)": "Meilleur (Coupe Challenge)",
		"Bota (Copa Conferencia)": "Soulier (Coupe Challenge)",
		"Asist. (Copa Conferencia)": "Passes (Coupe Challenge)",
		"VUELVEN A LLAMAR": "ILS RAPPELLENT",
		"TU AGENTE LA SOSTIENE": "TON AGENT TIENT BON",
		"NO SE DEJÓ SOSTENER": "CA N'A PAS TENU",
		"SE HARTARON DE TUS NOES": "LASSES DE TES REFUS",
		"LLEGA MENOS DE LO QUE ERA": "MOINS QUE PREVU",
		"MEJORAN LA OFERTA": "OFFRE AMELIOREE",
		"TRASPASO PACTADO": "TRANSFERT CONCLU",
		"NO LLEGAN A LO QUE PIDEN": "N'ATTEIGNENT PAS LE PRIX",
		"RETIRAN LA PUJA": "OFFRE RETIREE",
		"HAY PELEA POR TI": "ON SE BAT POUR TOI",
		"APRIETA POR TI": "IL INSISTE POUR TOI",
		"COBRAN POR TU VENTA": "TOUCHENT SUR TA VENTE",
		"¡Salió bien!": "Ca a marché !",
		"Salió mal…": "Ca a mal tourné…",
		"No les das el perfil todavía.": "Tu ne colles pas encore à leur profil.",
		"Ese club no existe.": "Ce club n'existe pas.",
		"Ya juegas ahí.": "Tu joues déjà là-bas.",
		"Ya tienes su oferta sobre la mesa.": "Leur offre est déjà sur la table.",
		"Les dijiste que no en esta ventana.": "Tu leur as dit non ce mercato.",
		"Es un club muy por debajo del tuyo: no bajan a por ti.":
			"Ce club est bien en dessous du tien : ils ne viendront pas te chercher.",
		"Está demasiadas categorías por encima: se sube de una en una.":
			"Trop de divisions au-dessus : on monte une par une.",
		"No pueden pagar lo que costaría sacarte.":
			"Ils ne peuvent pas payer ce qu'il faudrait pour te sortir de là.",
		"Tu última concentración": "Ton dernier rassemblement",
		"{0}: {1} fuera en la fase de grupos (sin ti)": "{0} : {1} éliminé en phase de groupes (sans toi)",
		"{0} se clasificó para {1} (sin ti)": "{0} s'est qualifié pour {1} (sans toi)",
		"{0} se quedó fuera de {1}": "{0} n'a pas participé à {1}",
		"{0}: fuera en la fase de grupos con {1}": "{0} : éliminé en phase de groupes avec {1}",
		"{0} se clasificó para {1}": "{0} s'est qualifié pour {1}",
		"{0} no se clasificó para {1}": "{0} ne s'est pas qualifié pour {1}",
		"{0} sólo jugó amistosos este año": "{0} n'a joué que des amicaux cette année",
		"{0} amistosos con {1}: {2} ganados": "{0} amicaux avec {1} : {2} gagnés",
		"Tu palmarés": "Ton palmarès",
		"Tu temporada": "Ta saison",
		"Dónde juegas": "Où tu joues",
		"El seleccionador": "Le sélectionneur",
		"Llevas el brazalete": "Tu portes le brassard",
		"Ya eres del grupo": "Tu fais partie du groupe",
		"Eliminado de la copa": "Eliminé de la coupe",
		"En dieciseisavos de copa": "En seizièmes de coupe",
		"En octavos de copa": "En huitièmes de coupe",
		"En cuartos de copa": "En quarts de coupe",
		"En semifinales de copa": "En demi-finales de coupe",
		"En la final de copa": "En finale de coupe",
		"Partidos con la selección": "Sélections avec ton pays",
		"Asistencias con la selección": "Passes décisives en sélection",
		"El Diez": "Le Dix",
		"Llegar a llevar el 10 a la espalda.": "Porter le 10 dans le dos.",
		"El Nueve de un Grande": "Le Neuf d'un Grand",
		"Llevar el 9 en uno de los clubes más fuertes del mundo.":
			"Porter le 9 dans l'un des plus grands clubs du monde.",
		"Adiós Internacional": "Adieux Internationaux",
		"Colgar la camiseta de tu país por decisión propia, sin dejar el club.":
			"Raccrocher le maillot de ton pays de ton propre choix, sans quitter ton club.",
		"Brazalete del País": "Brassard National",
		"Llevar la cinta de capitán de tu selección.": "Porter le brassard de capitaine de ta sélection.",
		"Rey de la Conference": "Roi de la Coupe Challenge",
		"Ganar la Conference.": "Gagner la Coupe Challenge.",
		"Ser el máximo goleador de la Conference.": "Finir meilleur buteur de la Coupe Challenge.",
		"Goles y Pases": "Buts et Passes",
		"Verdugo de Países Bajos": "Bourreau des Pays-Bas",
		"Cuarenta Mil": "Quarante Mille",
		"TELEVISIÓN": "TELEVISION",
		"MIS CAMISETAS": "MES MAILLOTS",
		"LÁMPARA": "LAMPE",
		"JARDÍN": "JARDIN",
		"CINTA": "TAPIS DE COURSE",
		"COCINA": "CUISINE",
		"ESPEJO": "MIROIR",
		"LIBRERO": "BIBLIOTHEQUE",
		"MANCUERNAS": "HALTERES",
		"PLANTA": "PLANTE",
		"MANSION": "MANOIR",
		"FINCA": "DOMAINE",
		"PREMIOS AL MEJOR": "JOUEURS DE L'ANNEE",
		"Premios al Mejor": "Titres de Joueur de l'Année",
		"JUGADOR DEL AÑO": "JOUEUR DE L'ANNEE",
		"BOTA": "SOULIER",
		"Bota": "Soulier",
		"Torneo Europeo": "Tournoi Européen",
		"Torneo Sudamericano": "Tournoi Sud-Américain",
		"Torneo Norteamericano": "Tournoi Nord-Américain",
		"Torneo Asiático": "Tournoi Asiatique",
		"Torneo Africano": "Tournoi Africain",
		"Torneo de Oceanía": "Tournoi d'Océanie",
		"TODOS LOS PREMIOS AL MEJOR": "TOUS LES JOUEURS DE L'ANNEE",
		"{0} PREMIOS AL MEJOR": "{0}X JOUEUR DE L'ANNEE",
		"Falta indirecta en el área": "Coup franc indirect dans la surface",
		"CARRERA": "CARRIERE",
		"TIROS": "TIRS",
		"ACELERACION": "ACCELERATION",
		"ENTRADA": "TACLE",
		"CRUZ": "CROIX",
		"INICIAL": "INITIAL",
		"Sólido": "Uni",
		"Espina": "Epine",
		"Puntos": "Points",
		"Estrellas": "Etoiles",
		"Pelo 2": "Cheveux 2",
		"Pelo 3": "Cheveux 3",
		"Pelo 5": "Cheveux 5",
		"Pelo 6": "Cheveux 6",
		"Cejas 1": "Sourcils 1",
		"Cejas 2": "Sourcils 2",
		"Cejas 3": "Sourcils 3",
		"Cejas 4": "Sourcils 4",
		"Cejas 5": "Sourcils 5",
		"Rastas": "Dreadlocks",
		"Peinado (pieza)": "Coiffure (accessoire)",
		"Ninguno": "Aucun",
		"Máscara": "Masque",
		"Banda": "Bandeau",
		"Banda roja": "Bandeau rouge",
		"Banda azul": "Bandeau bleu",
		"Banda negra": "Bandeau noir",
		"Banda oro": "Bandeau or",
		"Fade alto": "Dégradé haut",
		"Fade bajo": "Dégradé bas",
		"Peinado atrás": "Plaqué arrière",
		"Quiff corto": "Quiff court",
		"Banda pelo": "Bandeau",
		"Doble brazalete": "Double bande",
		"Media manga": "Demi-manche",
		"Banda verde": "Bandeau vert",
		"Banda rosa": "Bandeau rose",
		"Banda naranja": "Bandeau orange",
		"Económicos": "Économiques",
		"Clásicos": "Classiques",
		"Contemporáneos": "Modernes",
		"Sin pelo": "Sans cheveux",
		"Cortes cortos": "Coupes courtes",
		"Cortes medianos": "Coupes mi-longues",
		"Cortes largos": "Coupes longues",
		"Accesorio de pelo": "Accessoire cheveux",
		"Banda deportiva": "Bandeau sport",
		"Cinta fina": "Ruban fin",
		"Liga para recogido": "Élastique",
		"Máscara de protección": "Masque de protection",
		"Sin máscara": "Sans masque",
		"Con máscara": "Avec masque",
		"Tipo de ceja": "Forme des sourcils",
		"Sin cejas": "Sans sourcils",
		"Tatuaje facial": "Tatouage visage",
		"Lado del rostro": "Côté du visage",
		"Tinta facial": "Encre visage",
		"Conjuntos completos": "Tenues complètes",
		"Clásico": "Classique",
		"Del traje": "Assorti",
		"Pañuelo de saco": "Pochette",
		"Cinturón": "Ceinture",
		"Color del accesorio": "Couleur accessoire",
		"Deportivo": "Sport",
		"De lujo": "Luxe",
		"CLASIF J{0}": "QUALIF J{0}",
		"SIN PARTIDO": "PAS DE MATCH",


		"Aperturas vistas": "Ouvertures vues",
		"· la saltaron": "· l'ont passée",
		"· salieron al campo": "· sont entrés sur le terrain",
		"· el estadio tardó más de 3 s (el cine perdió hasta 1 s)": "· le stade a mis plus de 3 s (l'intro a perdu jusqu'à 1 s)",
		"Apertura: décimas hasta ver el estadio (peor)": "Ouverture : dixièmes de seconde avant de voir le stade (pire)",
		"·· sin ninguna tirada (no gastó cupo)": "·· sans aucun tirage (quota non utilisé)",
		"·· con una tirada": "·· avec un tirage",
		"·· con dos o más tiradas": "·· avec deux tirages ou plus",
		"Academias empezadas": "Académies commencées",
		"· pasaron el 1 (MUEVETE)": "· ont réussi le 1 (BOUGE-TOI)",
		"· pasaron el 2 (PEGALE)": "· ont réussi le 2 (FRAPPE)",
		"· pasaron el 3 (ENCARA)": "· ont réussi le 3 (AFFRONTE)",
		"· pasaron el 4 (SIRVE AL AREA)": "· ont réussi le 4 (SERS LA SURFACE)",
		"· pasaron el 5 (BALON PARADO)": "· ont réussi le 5 (COUPS DE PIED ARRETES)",
		"Academias terminadas": "Académies terminées",
		"{0} espera respuesta":
			"{0} attend une réponse",
		"Tu oferta caduca. Nadie va a decidir por ti.":
			"Ton offre expire. Personne ne décidera à ta place.",
		"Hoy es tu cumpleaños":
			"C'est ton anniversaire",
		"El vestuario te ha preparado algo.":
			"Le vestiaire t'a préparé quelque chose.",
		"Tu once te espera.":
			"Ton onze t'attend.",
		"Ya casi estás en forma":
			"Tu es presque remis",
		"Una semana más y vuelves al once.":
			"Encore une semaine et tu retrouves le onze.",
		"Tu carrera sigue ahí":
			"Ta carrière est toujours là",
		"Tu temporada con el {0} sigue a medias.":
			"Ta saison avec le {0} est à moitié faite.",
		"AVISOS":
			"ALERTES",
		"AVISARME EN EL TELÉFONO":
			"ME PREVENIR SUR MON TELEPHONE",
		"Un recordatorio cuando algo te espera: una oferta que caduca, tu cumpleaños, la vuelta de una lesión. Nunca más de uno al día.":
			"Un rappel quand quelque chose t'attend : une offre qui expire, ton anniversaire, la fin d'une blessure. Jamais plus d'un par jour.",
		"Los tienes bloqueados para este juego en los Ajustes de tu teléfono.":
			"Tu les as bloquées pour ce jeu dans les Réglages de ton téléphone.",
		"Altas abiertas (NUEVA CARRERA)": "Inscriptions ouvertes (NOUVELLE CARRIERE)",
		"QUITARLO":
			"L'ENLEVER",
		"El día del calendario de fuera en el que el juego se acuerda de ti. Sin año: no hace falta.":
			"Le jour du calendrier du dehors où le jeu pense à toi. Sans année : ça ne sert à rien.",
		"· entraron al campo":
			"· sont entrés sur le terrain",
		"· escribieron un nombre (ya jugando)":
			"· ont écrit un nom (déjà en train de jouer)",
		"SIGO":
			"JE CONTINUE",
		"LO DEJO POR HOY":
			"J'ARRETE POUR AUJOURD'HUI",
		"Eso es el juego entero: apuntas, ajustas la fuerza y pegas. Quedan unos ejercicios más para sacarte mejores ofertas de club.":
			"Voilà tout le jeu : tu vises, tu règles la puissance et tu frappes. Encore quelques exercices pour décrocher de meilleures offres de club.",
		"· marcaron su primer gol en la escuela":
			"· ont marqué leur premier but à l'académie",
		"· escribieron un nombre": "· ont écrit un nom",
		"· aceptaron jugarla": "· ont accepté d'y jouer",
		"· llegaron a marcar un gol": "· ont fini par marquer un but",
		"Entradas a LA CAJA desde el hub": "Entrées dans LA CAISSE depuis le hub",
		"Carreras creadas": "Carrières créées",
		"Jornadas jugadas": "Journées jouées",
		"Arranques del juego (en frío)": "Lancements du jeu (à froid)",
		"· el anterior se cerró solo (crash o memoria)": "· le précédent s'est fermé seul (crash ou mémoire)",
		"· · y fue en pleno partido": "· · et c'était en plein match",
		"· · con la app inactiva (¿cerrada desde el selector?)": "· · avec l'app inactive (fermée depuis le sélecteur ?)",
		"· · tras un aviso de memoria de iOS": "· · après une alerte mémoire d'iOS",
		"Avisos de memoria de iOS": "Alertes mémoire d'iOS",
		"· en pleno partido": "· en plein match",
		"Partidos jugados: ganados": "Matchs joués : gagnés",
		"· empatados": "· nuls",
		"· perdidos": "· perdus",
		"Partidos abandonados desde la pausa": "Matchs abandonnés depuis la pause",
		"Minutos en el campo": "Minutes sur le terrain",
		"Minutos en menús": "Minutes dans les menus",
		"Goles marcados": "Buts marqués",
		"· con la selección": "· en sélection",
		"· de penal": "· sur penalty",
		"· · a lo Panenka": "· · façon Panenka",
		"· de tiro libre": "· sur coup franc",
		"· de córner": "· sur corner",
		"· · olímpicos": "· · corners directs",
		"· de cabeza": "· de la tête",
		"· de volea": "· de volée",
		"· de chilena": "· en retourné",
		"· en mano a mano": "· en face-à-face",
		"· en disparo frontal": "· sur tir de face",
		"· desde lejos": "· de loin",
		"· desde ángulo cerrado": "· dans un angle fermé",
		"· al contraataque": "· en contre-attaque",
		"· en centro al área": "· sur centre dans la surface",
		"· en rebote en el área": "· sur rebond dans la surface",
		"· en la jugada de volea": "· sur action de volée",
		"· en saque de banda largo": "· sur longue touche",
		"· en falta indirecta en el área": "· sur coup franc indirect dans la surface",
		"· tras regate libre": "· après dribble libre",
		"· saliendo desde tu campo": "· en relance depuis ton camp",
		"· desde un saque de meta": "· sur une sortie de but",
		"· en otras jugadas": "· sur d'autres actions",
		"Hat-tricks (3 goles o más en un partido)": "Triplés (3 buts ou plus dans un match)",
		"Autogoles": "Buts contre son camp",
		"Penales fallados en el partido": "Penalties manqués en match",
		"Penales fallados en tandas": "Tirs au but manqués en séance",
		"Tiros desviados por un defensa": "Tirs déviés par un défenseur",
		"· que acabaron en córner": "· terminés en corner",
		"· que el defensa metió en su portería": "· que le défenseur a mis dans son propre but",
		"· · a menos de 20 m": "· · à moins de 20 m",
		"· · de 20 a 25 m": "· · de 20 à 25 m",
		"· · de 25 a 30 m": "· · de 25 à 30 m",
		"· · a 30 m o más": "· · à 30 m ou plus",
		"· · rematados de cabeza": "· · repris de la tête",
		"· · rematados de volea": "· · repris de volée",
		"· · rematados de chilena": "· · repris en retourné",
		"· a menos de 6 m del arco": "· à moins de 6 m du but",
		"· de 6 a 16 m": "· de 6 à 16 m",
		"· de 16 a 25 m": "· de 16 à 25 m",
		"· de 25 a 30 m": "· de 25 à 30 m",
		"· a 30 m o más": "· à 30 m ou plus",
		"Gol más lejano (m)": "But le plus lointain (m)",
		"Tiro libre más lejano metido (m)": "Coup franc marqué le plus lointain (m)",
		"Pase de gol más largo (m)": "Passe décisive la plus longue (m)",
		"Asistencias dadas": "Passes décisives données",
		"Partidos jugados con el club": "Matchs joués en club",
		"Partidos jugados con la selección": "Matchs joués en sélection",
		"Derbis ganados": "Derbys gagnés",
		"Partidos ganados remontando": "Victoires après avoir été mené",
		"Títulos de equipo ganados": "Titres collectifs gagnés",
		"· ligas": "· championnats",
		"· copas": "· coupes",
		"· continentales de clubes y Mundial de Clubes": "· titres continentaux de clubs et Mondiaux des clubs",
		"· ascensos": "· montées",
		"· Mundiales con la selección": "· Mondiaux avec la sélection",
		"· continentales con la selección": "· titres continentaux avec la sélection",
		"Premios individuales": "Récompenses individuelles",
		"· Balones de Oro": "· Titres de Joueur de l'Année",
		"Veces Jugador del Partido": "Fois homme du match",
		"Veces Jugador del Mes": "Fois joueur du mois",
		"Traspasos firmados": "Transferts signés",
		"· millones pagados por ellos": "· millions payés pour eux",
		"Cargas con un técnico duplicado (se arregló solo)": "Chargements avec un entraîneur en double (corrigé automatiquement)",
		"· arreglos del carrusel de técnicos en ellas": "· corrections du carrousel d'entraîneurs",
		"Goles de club de antes (carreras guardadas)": "Buts en club d'avant (carrières sauvegardées)",
		"Asistencias de club de antes": "Passes décisives en club d'avant",
		"Partidos de club de antes": "Matchs en club d'avant",
		"Títulos de equipo de antes": "Titres collectifs d'avant",
		"Premios individuales de antes": "Récompenses individuelles d'avant",
		"Más goles de club en una carrera": "Plus de buts en club sur une carrière",
		"Más asistencias de club en una carrera": "Plus de passes décisives en club sur une carrière",
		"Más goles en un partido": "Plus de buts en un match",
		"Más títulos de equipo en una carrera": "Plus de titres collectifs sur une carrière",
		"Más Balones de Oro en una carrera": "Plus de titres de Joueur de l'Année sur une carrière",
		"Jornadas simuladas o vistas": "Journées simulées ou vues",
		"Temporadas terminadas": "Saisons terminées",
		"Carreras llevadas hasta el retiro": "Carrières menées jusqu'à la retraite",
		"Aperturas de HABILIDAD": "Ouvertures de COMPETENCES",
		"Aperturas de CONTRATO": "Ouvertures de CONTRAT",
		"Aperturas de RELACIONES": "Ouvertures de RELATIONS",
		"Aperturas de ASPECTO": "Ouvertures d'APPARENCE",
		"Aperturas de TIENDA": "Ouvertures de BOUTIQUE",
		"Aperturas de CASA": "Ouvertures de MAISON",
		"Aperturas de TORNEOS": "Ouvertures de TOURNOIS",
		"Aperturas de MERCADO": "Ouvertures de MERCATO",
		"Aperturas de CARRERA": "Ouvertures de CARRIERE",
		"Aperturas de CALENDARIO": "Ouvertures de CALENDRIER",
		"Aperturas de PLANTILLA": "Ouvertures d'EFFECTIF",
		"Aperturas de RANKING": "Ouvertures de CLASSEMENT",
		"Aperturas de MAPA": "Ouvertures de CARTE",
		"Aperturas de TROFEOS": "Ouvertures de TROPHEES",
		"Aperturas de CLUBES": "Ouvertures de CLUBS",
		"Aperturas de LEYENDAS": "Ouvertures de LEGENDES",
		"Aperturas de BALON": "Ouvertures de JOUEUR DE L'ANNEE",
		"Sesiones de PRÁCTICA": "Sessions d'ENTRAINEMENT LIBRE",
		"Sesiones de ENTRENO en el club": "Sessions d'ENTRAINEMENT au club",
		"Aperturas del EDITOR de planteles": "Ouvertures de l'EDITEUR d'effectifs",
		"Decisiones contestadas": "Décisions répondues",
		"Semana más lejana alcanzada": "Semaine la plus lointaine atteinte",
		"Temporada más lejana alcanzada": "Saison la plus lointaine atteinte",
		"Nivel más alto alcanzado": "Niveau le plus haut atteint",
		"+{0} PTS DE HABILIDAD": "+{0} PTS DE COMPETENCE",
		"+{0} XP": "+{0} XP",
		"AL BANQUILLO": "SUR LE BANC",
		"PIERDES LA TITULARIDAD": "TU PERDS TA PLACE",



		"CAMBIO": "SORTIE",
		"TE CAMBIAN":
			"ON TE REMPLACE",
		"TU NOTA CUANDO TE CAMBIARON":
			"TA NOTE A LA SORTIE",
		"Te cambian, y no por descansar. Al túnel, y nadie aplaude.":
			"On te remplace, et pas pour te reposer. Au tunnel, et personne n'applaudit.",
		"Te cambian, y no por descansar. Fuera del campo, y nadie aplaude.":
			"On te remplace, et pas pour te reposer. Hors du terrain, personne n'applaudit.",
		"TE SACAN DEL CAMPO": "ON TE FAIT SORTIR",
		"OCASIONES SEGUIDAS FALLADAS": "OCCASIONS RATEES DE SUITE",
		"MINUTO": "MINUTE",
		"El míster no esperó a la cuarta. Fuera del campo, y nadie aplaude.":
			"Le coach n'a pas attendu la quatrième. Hors du terrain, personne n'applaudit.",
		"El míster no esperó a la cuarta. Al túnel, y nadie aplaude.":
			"Le coach n'a pas attendu la quatrième. Au tunnel, et personne n'applaudit.",
		"LA CONFIANZA DEL TÉCNICO": "LA CONFIANCE DE L'ENTRAINEUR",
		"Hoy miras desde aquí. El sitio no se pierde: se deja de merecer.":
			"Aujourd'hui tu regardes d'ici. La place ne se perd pas : on cesse de la mériter.",
		"LA FINAL": "LA FINALE",
		"VAMOS": "ALLEZ",
		"HIMNO": "HYMNE",
		"CAMISETA DE VITRINA": "MAILLOT A ENCADRER",
		"LA FINAL DE EUROPA": "LA FINALE EUROPEENNE",
		"LA FINAL DE TU SELECCION": "LA FINALE DE TON PAYS",
		"LA FINAL DEL MUNDIALITO": "LA FINALE DU MONDIAL DES CLUBS",
		"LA FINAL DE COPA": "LA FINALE DE COUPE",
		"ENFRENTE, {0}": "EN FACE, {0}",
		"NOCHE EUROPEA": "SOIREE EUROPEENNE",
		"DESDE EL BANQUILLO": "DEPUIS LE BANC",



		"TU SELECCION": "TON PAYS",
		"RENOVACION": "PROLONGATION",
		"FICHAJE": "TRANSFERT",
		"SIGUES EN CASA": "TU RESTES CHEZ TOI",
		"FIRMADO Y CERRADO": "SIGNE ET SCELLE",
		"por partido": "par match",
		"Te quedas porque quieres. Eso, en este oficio, lo firman pocos.":
			"Tu restes parce que tu le veux. Dans ce métier, peu signent ça.",



		"Pagaron por ti antes de verte jugar aquí. Ahora hay que darles la razón.":
			"Ils ont payé pour toi avant même de te voir jouer ici. Maintenant, prouve-leur qu'ils ont eu raison.",
		"Llegaste sin que nadie pagara un peso. Eso también hay que demostrarlo.":
			"Tu es arrivé sans que personne ne paie un centime. Ca aussi, il faut le prouver.",
		"HOY, EN TU CASA": "AUJOURD'HUI, CHEZ TOI",
		"HOY, EN LA SUYA": "AUJOURD'HUI, CHEZ EUX",
		"tu puesto": "ta place",
		"el suyo": "la leur",
		"tus goles": "tes buts",
		"Esa casa fue tuya. Hoy no te van a perdonar ni una.": "Cette maison était la tienne. Aujourd'hui ils ne te passeront rien.",
		"tu dorsal": "ton numéro",
		"No hay plan de partido que arregle un derbi. Se gana o se aguanta.":
			"Aucun plan de match n'arrange un derby. On le gagne ou on l'encaisse.",




		"Sois vecinos en la tabla y en la ciudad. Esto no se olvida ni ganándolo.":
			"Vous êtes voisins au classement et dans la ville. Même en le gagnant, ça ne s'oublie pas.",
		"Vienen a tu casa a quitarte el sitio. Perder hoy vale por tres derrotas.":
			"Ils viennent chez toi pour te prendre ta place. Perdre aujourd'hui compte triple.",
		"Vas a su casa de líder. No hay tarde que les guste más.":
			"Tu vas chez eux en leader. Il n'y a pas d'après-midi qu'ils préfèrent.",
		"Van por delante todo el año. Hoy la tabla no cuenta.":
			"Ils sont devant depuis le début de l'année. Aujourd'hui le classement ne compte pas.",




		"PASAS DE RONDA": "QUALIFIE",
		"ELIMINADO": "ELIMINE",
		"el cruce": "le match",
		"rondas ganadas": "tours gagnés",
		"Una noche más y hay copa. En esta sala ya no habla nadie de suerte.":
			"Encore un soir et il y a une coupe. Ici, personne ne parle plus de chance.",
		"Semifinales. Quedan dos partidos para levantarla.":
			"Demi-finales. Deux matchs pour la soulever.",
		"{0} fuera. El cuadro sigue abierto y vosotros dentro.":
			"{0} dehors. Le tableau reste ouvert et vous êtes encore dedans.",
		"Fuera a la primera. El vestuario se vacía sin que nadie diga nada.":
			"Dehors dès le premier tour. Le vestiaire se vide sans un mot.",
		"A un partido de la final. Esta sala va a tardar en olvidarlo.":
			"Si près de la finale. Ce vestiaire mettra du temps à l'oublier.",
		"{0} os deja fuera. Se acabó la copa y quedan cuarenta domingos.":
			"{0} vous élimine. La coupe est finie et il reste quarante dimanches.",
		"{0} os deja fuera. El siguiente es dentro de cuatro años.":
			"{0} vous élimine. Le prochain, c'est dans quatre ans.",
		"Llevas {0} sin ganarles. En esta sala nadie lo ha olvidado.":
			"Ca fait {0} que tu ne les as pas battus. Dans cette salle, personne n'a oublié.",
		"Nunca les has ganado. Algún día tiene que ser el primero.":
			"Tu ne les as jamais battus. Un jour, il faudra bien une première fois.",
		"No les ganas desde hace {0} años. La gente lleva la cuenta.":
			"Tu ne les as pas battus depuis {0} ans. Les gens comptent.",
		"Llevas {0} seguidos contra ellos. Hoy vienen a por eso.":
			"Ca fait {0} d'affilée contre eux. Aujourd'hui, c'est ça qu'ils viennent chercher.",


		"{0} os ha marcado {1} en estos derbis. Hoy no lo pierdas de vista.":
			"{0} vous a marqué {1} dans ces derbys. Aujourd'hui, ne le quitte pas des yeux.",

		"AHORA MANDAS TÚ": "MAINTENANT C'EST TOI QUI COMMANDES",
		"LAS ÓRDENES": "LES ORDRES",
		"EL CAMINO": "LE CHEMIN",
		"Mientras apuntas, toca a un compañero: cada toque cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.":
			"Pendant que tu vises, touche un coéquipier : chaque touche change son ordre. Bleu clair fonce au but, ambre reste, magenta entraîne son marqueur ailleurs.",
		"El suelo enseña a dónde irá y se borra conforme lo corre. Máximo tres órdenes, sólo duran esa jugada, y arrancan cuando tiras o regateas.":
			"Le sol montre où il ira et s'efface au fur et à mesure. Trois ordres maximum, ils ne durent que cette action, et démarrent quand tu tires ou dribbles.",

		"TU TAQUILLA": "TON CASIER",
		"FIN DE ETAPA": "FIN D'UNE ERE",

		"SE VA AL RIVAL": "IL PART CHEZ EUX",
		"FICHA POR EL RIVAL": "SIGNE CHEZ LE RIVAL",
		"venía de": "venait de",
		"Se fue gratis. A ellos.": "Parti gratuitement. Chez eux.",
		"Lo pagaron, y lo pagaron caro. Sigue doliendo.": "Ils ont payé, et cher. Ça fait encore mal.",

		"CIERRA EL MERCADO": "LE MERCATO FERME",
		"PIDEN": "DEMANDE",
		"SOLO PREGUNTA": "SIMPLE INTERET",
		"LES FALTAN {0}": "IL MANQUE {0}",

		"SE QUEDA": "IL RESTE",
		"Se queda. El traspaso se cae.": "Il reste. Le transfert tombe à l'eau.",
		"Ya lo tenía decidido. Al menos sabe que se lo pediste.": "C'était déjà décidé. Au moins il sait que tu lui as demandé.",
		"Le has quitado la última duda: se va.": "Tu lui as ôté son dernier doute : il part.",
		"Le dio la vuelta: se queda igual.": "Il a tout retourné : il reste quand même.",
		"Sin que nadie le dijera nada, se queda.": "Sans que personne ne lui dise rien, il reste.",
		"Se va, y tú no tuviste nada que ver.": "Il part, et tu n'y es pour rien.",
		"SE LO QUIEREN LLEVAR": "ON VEUT LE PRENDRE",
		"SUENA PARA OTRO": "IL INTERESSE",
		"PEDIRLE QUE SE QUEDE": "LE RETENIR",
		"DECIRLE QUE ES SU OPORTUNIDAD": "LUI DIRE D'Y ALLER",
		"TU VESTUARIO": "LE VESTIAIRE",
		"SE LLEVAN A {0}": "{0} S'EN VA",
		"lo quiere": "le veut",
		"le quedan": "il reste",
		"Un compañero tuyo tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "Un de tes coéquipiers a une offre sur la table et n'a pas encore dit oui. Vous êtes seuls au vestiaire et il va te demander ce que tu ferais.",
		"{0} tiene una oferta encima de la mesa y todavía no ha dicho que sí. Estáis solos en el vestuario y te va a preguntar qué harías tú.": "{0} a une offre sur la table et n'a pas encore dit oui. Vous êtes seuls au vestiaire et il va te demander ce que tu ferais.",
		"TU CLUB TE RETIENE": "TON CLUB TE RETIENT",
		"No te dejan salir: pide el traspaso primero.": "On ne te laisse pas partir : demande un transfert.",
		"No renuevas: te ponen en el escaparate.": "Pas de prolongation : te voilà en vitrine.",
		"Tu club te vende. Falta tu respuesta.": "Ton club te vend. Ta réponse est attendue.",
		"Quieren cederte. Falta tu respuesta.": "Ils veulent te prêter. Ta réponse est attendue.",
		"Aceptaste salir: te ofrecen a quien pregunte.": "Tu as accepté : ils te proposent à tout le monde.",
		"Pediste salir: ya no te retienen.": "Tu as demandé à partir : on ne te retient plus.",
		"Pediste cesión: llegan destinos cada ventana.": "Prêt demandé : des destinations à chaque mercato.",
		"ULTIMA JORNADA": "DERNIERE JOURNEE",
		"Ultima jornada: mañana ya no hay mercado.": "Dernière journée : demain, plus de mercato.",
		"MERCADO ABIERTO": "MERCATO OUVERT",
		"QUEDAN {0}": "IL RESTE {0}",
		"INTERESADO": "INTERESSE",
		"Quedan {0} jornadas de mercado.": "Il reste {0} journées de mercato.",
		"La ventana cierra esta noche.": "Le mercato ferme ce soir.",
		"Se cerró la ventana.": "Le mercato est fermé.",
		"TE VAS": "TU PARS",
		"TE QUEDAS": "TU RESTES",
		"ofertas": "offres",
		"la mejor": "meilleure",
		"pedían": "demandaient",
		"Acordado en el último minuto.": "Conclu à la dernière minute.",
		"Nadie llegó a lo que pedía tu club.": "Personne n'a atteint le prix de ton club.",
		"Se cerró la ventana y no llamó nadie.": "Le mercato a fermé et personne n'a appelé.",

		"SE VA LA ESTRELLA": "LA STAR S'EN VA",
		"destino": "destination",
		"traspaso": "transfert",
		"Con ese dinero llega {0}.": "Avec cet argent arrive {0}.",
		"Acabó contrato y nadie lo renovó.": "Son contrat a expiré et personne ne l'a prolongé.",
		"El club todavía no ha fichado a nadie en su lugar.": "Le club n'a encore signé personne pour le remplacer.",
		"Ni un balón, ni una camiseta. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "Pas un ballon, pas un maillot. Tu n'as rien laissé ici, et tu n'emportes rien.",
		"Una sola cosa cabe en la maleta. Con una basta para acordarse.": "Une seule chose tient dans le sac. Une suffit pour se souvenir.",
		"Lo que cabe en una maleta después de todos estos años.": "Tout ce qui tient dans un sac après toutes ces années.",
		"EL DORSAL QUE DEJASTE": "LE NUMERO LAISSE",
		"SIGUE AHI": "TOUJOURS LA",
		"EL {0}": "LE {0}",
		"lo llevaste": "tu portais",
		"hoy llevas": "tu portes",
		"Lo llevaste una temporada. A alguien le bastó.": "Tu l'as porté une saison. A quelqu'un, cela a suffi.",
		"Tú cambiaste de número. Él no.": "Toi, tu as changé de numero. Lui, non.",
		"EL PORTERO DE ENFRENTE": "LE GARDIEN D'EN FACE",
		"YA TE CONOCE": "IL TE CONNAIT",
		"LE HAS METIDO {0}": "{0} DANS SES FILETS",
		"TU VILLANO": "TA BETE NOIRE",
		"TE HA MARCADO {0} EN ESTE DERBI": "IL T'A MARQUE {0} BUTS DANS CE DERBY",
		"TE CONOCE DE ANTES": "IL TE CONNAIT",
		"CARA A CARA": "FACE A FACE",
		"TE PELEA EL GOLEO": "TON RIVAL BUTEUR",
		"TE PELEA LAS ASISTENCIAS": "TON RIVAL PASSEUR",
		"PRONÓSTICO": "PRONOSTIC",
		"FAVORITO": "FAVORI",
		"{0} TEMPORADAS JUNTOS EN {1}": "{0} SAISONS ENSEMBLE : {1}",
		"reencuentros": "retrouvailles",
		"Todavía no sabe por dónde le vas a entrar.": "Il ne sait toujours pas par où tu vas passer.",
		"Nadie le ha hecho más daño que tú.": "Personne ne lui a fait plus de mal que toi.",
		"LA PIZARRA DEL RIVAL": "LE TABLEAU D'EN FACE",
		"ESE ERES TU": "C'EST TOI",
		"LA CHARLA DE HOY": "LA CAUSERIE",
		"TE ESPERABAN": "ILS T'ATTENDAIENT",
		"EL VERDUGO": "LA BETE NOIRE",
		"{0} GOLES DESPUES": "{0} BUTS PLUS TARD",
		"No se junta esta gente por un jugador cualquiera.": "On ne se déplace pas comme ça pour n'importe quel joueur.",
		"De todo lo que hay en esa pizarra, la única foto es la tuya.": "De tout ce qu'il y a sur ce tableau, la seule photo, c'est la tienne.",
		"TE CANTAN": "ILS TE CHANTENT",
		"OVACION": "OVATION",
		"TE OVACIONAN": "DEBOUT POUR TOI",
		"Aplauden los que venían a verte perder. Eso no lo dan dos veces.":
			"Ceux qui venaient te voir perdre t'applaudissent. Ça n'arrive pas deux fois.",
		"domingos": "dimanches",
		"tu nota": "ta note",
		"afición": "public",
		"No marcaste. Da igual: se aprendieron tu nombre igual.": "Tu n'as pas marqué. Peu importe : ils ont appris ton nom quand même.",
		"EMPIEZAS EN EL BANQUILLO": "TU COMMENCES SUR LE BANC",
		"La primera vez que el once empieza sin ti. Desde aquí también se mira el partido.": "La première fois que le onze commence sans toi. D'ici aussi on regarde le match.",
		"división": "division",
		"aforo": "capacite",
		"Hasta aquí se sube. Ahora hay que quedarse.": "On ne monte pas plus haut. Maintenant, il faut y rester.",
		"Un escalón más. Desde aquí se ve el de arriba.": "Un échelon de plus. D'ici on voit le suivant.",
		"Todo el mundo empieza en un campo como éste.": "Tout le monde commence sur un terrain comme celui-ci.",
		"SE RETIRA": "IL RACCROCHE",
		"La cantera del {1} no para: {0}, {2} años, ya es titular": "Le centre de formation de {1} ne s'arrête plus : {0}, {2} ans, déjà titulaire",
		"{0}, {2} años, se gana un puesto en el once del {1}": "{0}, {2} ans, gagne sa place dans le onze de {1}",
		"{0}, {2} años, vuelve de su cesión en el {3} y se gana el once del {1}": "{0}, {2} ans, revient de son prêt au {3} et gagne sa place dans le onze de {1}",
		"EL ADIOS": "LES ADIEUX",
		"TEMPORADAS EN ESTA CASA": "SAISONS DANS CETTE MAISON",
		"Ni una copa que sacar al césped, y el estadio en pie igual.":
			"Pas une seule coupe à sortir sur la pelouse, et le stade debout quand même.",
		"Aquí empezó todo. Y aquí se acaba, con todo lo que ganaste puesto.":
			"Tout a commencé ici. Et tout finit ici, avec tout ce que tu as gagné posé là.",
		"Los que te vieron crecer se quedaron de pie hasta el final.":
			"Ceux qui t'ont vu grandir sont restés debout jusqu'au bout.",
		"EL BRAZALETE": "LE BRASSARD",
		"tu media": "ta moyenne",
		"temporada": "saison",
		"El vestuario votó y salió tu nombre. Ahora te toca sostenerlo.":
			"Le vestiaire a voté et ton nom est sorti. Maintenant, à toi de le porter.",
		"Nadie regala esta cinta: la ganaste domingo a domingo. Ahora no la sueltes.":
			"Personne n'offre ce brassard : tu l'as gagné dimanche après dimanche. Maintenant, ne le lâche pas.",
		"VISITANTE": "EXTERIEUR",
		"VUELTA": "RETOUR",
		"NO TE HAN PERDONADO": "ILS N'ONT PAS TOUT PARDONNE",
		"Te fuiste al rival. Cada vez que vuelvas a este campo la grada empezará en tu contra, y eso ya no se quita.":
			"Tu es parti chez le rival. A chaque retour sur ce terrain, le public commencera contre toi, et ça ne s'efface plus.",
		"BALÓN DE ORO": "JOUEUR ANNEE",
		"Ningún equipo levanta esto por ti. Este se gana solo.":
			"Aucune équipe ne soulève ça pour toi. Celui-là se gagne seul.",
		"Tú quedaste {0}.": "Tu as fini {0}.",
		"Tú quedaste {0}, detrás de {1}.": "Tu as fini {0}, derrière {1}.",
		"{0} GALA JUNTOS: ÉL {1}, TÚ {2}": "{0} GALA ENSEMBLE : LUI {1}, TOI {2}",
		"{0} GALA JUNTOS: {1} {2}, {3} {4}": "{0} GALA ENSEMBLE : {1} {2}, {3} {4}",
		"Este año no entraste en la votación.": "Cette année tu n'as pas figuré dans le vote.",
		"EL MEJOR DEL MUNDO · {0}": "LE MEILLEUR DU MONDE · {0}",
		"TU PRIMER JUGADOR DEL AÑO": "TON PREMIER JOUEUR DE L'ANNEE",
		"TU JUGADOR DEL AÑO Nº {0}": "TON JOUEUR DE L'ANNEE N° {0}",
		"TEMPORADAS EN EL OFICIO · CIFRAS EN PRIMERA": "SAISONS DANS LE METIER · CHIFFRES EN ELITE",
		"LO DEJA CUANDO QUIERE": "IL PART QUAND IL LE VEUT",
		"{0} años. El cuerpo mandó y no hubo discusión.":
			"{0} ans. Le corps a tranché et il n'y a pas eu de discussion.",
		"Nadie te empujó a esto: te vas de pie, que es como se van los pocos.":
			"Personne ne t'a poussé à ça : tu pars debout, comme le font les rares.",
		"FIGURA DEL PARTIDO": "HOMME DU MATCH",
		"RENOVACIÓN": "PROLONGATION",
		"SE DESPIDE": "FAIT SES ADIEUX",
		"SE DESPIDE UNA LEYENDA": "UNE LEGENDE S'EN VA",
		"SE VA UNA LEYENDA": "UNE LEGENDE PART",
		"VUELVE UNA LEYENDA": "RETOUR D'UNE LEGENDE",
		"Te vas siendo leyenda de esta casa. Tu nombre se queda aquí.": "Tu pars en légende de ce club. Ton nom reste ici.",
		"Fuiste leyenda aquí. Vienes de rival y aun así se ponen de pie.": "Tu as été une légende ici. Tu reviens en adversaire et ils se lèvent quand même.",
		"HOMENAJE": "JUBILE",
		"Toda una etapa en el mismo club. El club te lo devuelve delante de los tuyos.":
			"Toute une ère au même club. Le club te le rend devant les tiens.",
		"HOMENAJE en {0}: {1} temporadas de lealtad. Prima de ${2} y la grada rendida.":
			"JUBILE à {0} : {1} saisons de loyauté. Prime de ${2} et le public conquis.",
		"LA CAMISETA DEL CLUB ES LA TUYA: {0} unidades": "LE MAILLOT DU CLUB, C'EST TOI : {0} unités",
		"Camisetas: {0} unidades, el nº{1} del vestuario": "Maillots : {0} unités, le n° {1} du vestiaire",
		"Dos minutos de micrófono y a la ducha. Mañana no se acuerda nadie.":
			"Deux minutes au micro et direction la douche. Demain, plus personne ne s'en souvient.",
		"Firmado. El club apuesta por ti y ahora hay que devolverlo en el campo.":
			"Signé. Le club mise sur toi, maintenant il faut le rendre sur le terrain.",
		"Se acabó aquí. Lo que hiciste con esta camiseta ya no te lo quita nadie.":
			"C'est fini ici. Ce que tu as fait sous ce maillot, personne ne te l'enlève plus.",
		"Te llamaron. Ahora hay que ir y quedarse.": "Ils t'ont appelé. Maintenant il faut y aller, et rester.",
		"ÚLTIMO DÍA EN EL CLUB": "DERNIER JOUR AU CLUB",
		"TITULAR CON TU SELECCIÓN": "TITULAIRE AVEC TON PAYS",
		"EN LA LISTA DE TU SELECCIÓN": "DANS LA LISTE DE TON PAYS",

		"VAS AL MUNDIAL": "TU VAS AU MONDIAL",
		"PIDE TU DORSAL": "DEMANDE TON NUMERO",
		"ME QUEDO EL {0}": "JE GARDE LE {0}",
		"SIGUES CON EL {0}": "TU GARDES LE {0}",
		"CAMBIA TU DORSAL": "CHANGE TON NUMERO",
		"EL {0} ES TUYO HASTA EL PROXIMO TORNEO": "LE {0} EST A TOI JUSQU'AU PROCHAIN TOURNOI",
		"PEDISTE EL {0}": "TU AS DEMANDE LE {0}",
		"Un continente entero, y tú dentro.": "Tout un continent, et tu en es.",
		"AÑOS AL IR AL MUNDIAL": "ANS EN PARTANT AU MONDIAL",
		"CONVOCATORIA OFICIAL": "CONVOCATION OFFICIELLE",
		"QUEDAS CONVOCADO": "TU ES CONVOQUE",
		"Una carrera cabe en tres o cuatro. Éste es uno.": "Une carrière en compte trois ou quatre. En voici une.",
		"RENUEVA UNA TEMPORADA MÁS": "PROLONGE POUR UNE SAISON DE PLUS",
		"RENUEVA HASTA {0} TEMPORADAS MÁS": "PROLONGE JUSQU'A {0} SAISONS DE PLUS",



		"SE VA EN VERANO": "PARTIRA CET ETE",
		"FIRMA CON {0} PARA EL VERANO": "SIGNE AVEC {0} POUR CET ETE",
		"Ya está firmado y todavía quedan cinco meses de temporada. Lo que digas hoy es lo que te van a gritar hasta junio.":
			"C'est signé, et il reste encore cinq mois de saison. Ce que tu diras aujourd'hui, on te le criera jusqu'en juin.",
		"¿POR QUÉ TE VAS?": "POURQUOI TU PARS ?",
		"Treinta micrófonos y una sola pregunta. Lo que contestes decide quién carga con esto: el míster, la grada o la prensa.":
			"Trente micros et une seule question. Ta réponse décide qui porte ça : le coach, les tribunes ou la presse.",
		"SE LO DIJE AL MÍSTER A LA CARA": "JE L'AI DIT AU COACH EN FACE",
		"LE DEBO A ESTA GENTE HASTA JUNIO": "JE LEUR DOIS TOUT JUSQU'EN JUIN",
		"ES FÚTBOL, NADA PERSONAL": "LE FOOT, RIEN DE PERSONNEL",
		"YA NO HAY NADA QUE REPARTIR": "PLUS RIEN A REPARTIR",
		"EN VERANO": "CET ETE",
		"TU NUEVO SUELDO POR TEMPORADA": "TON NOUVEAU SALAIRE PAR SAISON",
		"GOLES CON ESTA CAMISETA · {0} PARTIDOS": "BUTS SOUS CE MAILLOT · {0} MATCHS",
		"AÑOS AL ENTRAR EN LA LISTA": "AGE A TA PREMIERE SELECTION",
		"TU NOTA DEL PARTIDO (×10)": "TA NOTE DU MATCH (×10)",
		"JUGADOR DEL PARTIDO": "HOMME DU MATCH",
		"{0} GOLES · JUGADOR DEL PARTIDO": "{0} BUTS · HOMME DU MATCH",
		"HASTA EL AÑO QUE VIENE": "RENDEZ-VOUS L'AN PROCHAIN",
		"PASAR PÁGINA": "TOURNER LA PAGE",
		"GOLES EN {0} PARTIDOS · {1} ASISTENCIAS": "BUTS EN {0} MATCHS · {1} PASSES DEC.",
		"Se quedaron a aplaudir igual. Eso también se gana.":
			"Ils sont restés applaudir quand même. Ca aussi, ça se mérite.",
		"Media grada de vuelta a casa. El año que viene se empieza de cero.":
			"La moitié des tribunes déjà rentrées. L'an prochain on repart de zéro.",
		"Las gradas se vaciaron antes del pitido. Hay años así.":
			"Les tribunes se sont vidées avant le coup de sifflet. Il y a des années comme ça.",
		"{0} DE {1} · SIN TÍTULOS": "{0}E SUR {1} · SANS TITRE",
		"YA FIRMASTE CON OTRO": "TU AS DEJA SIGNE AILLEURS",
		"TE VAS Y ELLOS LO SABEN": "TU PARS, ET ILS LE SAVENT",
		"SE TE ACABA EL CONTRATO": "TON CONTRAT SE TERMINE",
		"SE ACABA TU CESIÓN": "TON PRET SE TERMINE",

		"Te vas dejando una vitrina. Esta grada va a tardar en cantarle a otro.":
			"Tu pars en laissant une vitrine pleine. Ce public mettra du temps à chanter pour un autre.",
		"No siempre se gana, pero aquí ganaste. Eso ya no te lo quita nadie.":
			"On ne gagne pas toujours, mais ici tu as gagné. Ca, personne ne te l'enlève plus.",
		"Ni un título, y aun así están todos de pie. Algo hiciste bien.":
			"Pas un seul titre, et pourtant ils sont tous debout. Tu as fait quelque chose de bien.",
		"JUGADOR DEL MES": "JOUEUR DU MOIS",
		"MEJOR DEL MES EN TU LIGA": "MEILLEUR DU MOIS DE TA LIGUE",
		"TU MEDIA DEL MES (×10)": "TA MOYENNE DU MOIS (×10)",
		"EL MEJOR DEL MES DE TU LIGA": "MEILLEUR DU MOIS",
		"SU MEDIA DEL MES (×10)": "MOYENNE DU MOIS (×10)",
		"GOLES EN EL PARTIDO": "BUTS DANS CE MATCH",
		"goles año": "buts (an)",
		"asist. año": "passes (an)",
		"SU MEDIA DE LA TEMPORADA (×10)": "MOYENNE DE LA SAISON (×10)",
		"El mejor del año de tu competición, y este año no fue para ti.": "Le meilleur de l'année dans ta compétition, et cette année ce n'était pas toi.",
		"Este mes fue suyo. El siguiente empieza de cero para los dos.": "Ce mois-ci était pour lui. Le suivant repart de zéro pour vous deux.",
		"Hoy el micro es suyo. La semana que viene se vuelve a repartir.": "Aujourd'hui le micro est pour lui. La semaine prochaine, ça se rejoue.",
		"el listón": "le niveau requis",
		"{0} partidos por encima de todos. El mes siguiente empieza de cero.":
			"{0} matchs au-dessus de tout le monde. Le mois suivant repart de zéro.",
		"MEJOR DEL AÑO": "MEILLEUR DE L'ANNEE",
		"TU MEDIA DE LA TEMPORADA (×10)": "TA MOYENNE DE LA SAISON (×10)",
		"goles": "buts",
		"asist.": "passes",
		"partidos": "matchs",
		"El mejor del año en tu competición.": "Le meilleur de l'année dans ta compétition.",
		"ADIÓS INTERNACIONAL": "ADIEUX INTERNATIONAUX",
		"SE RETIRA DE LA SELECCIÓN": "QUITTE LA SELECTION",
		"APARICIONES CON TU PAÍS": "SELECTIONS AVEC TON PAYS",
		"títulos": "titres",
		"La camiseta del país no se cuelga: se entrega. Que la sude otro.":
			"Le maillot national ne se raccroche pas : il se transmet. Qu'un autre le fasse suer.",
		"NO SE PUDO GUARDAR": "ECHEC DE L'ENREGISTREMENT",
		"CELEBRACIÓN DE TÍTULOS": "CELEBRATION DES TITRES",
		"LA CIUDAD ES VUESTRA": "LA VILLE EST A VOUS",
		"TÍTULOS SOBRE EL AUTOBÚS": "TROPHEES SUR LE BUS",
		"Hay años que se cuentan por títulos. Éste no cabe en una vitrina.":
			"Il y a des saisons qui se comptent en trophées. Celle-ci ne tient pas dans une vitrine.",
		"Dos en la misma temporada. La ciudad no se lo va a callar.":
			"Deux dans la même saison. La ville ne va pas se taire.",
		"Un año entero cabe en esta calle, y toda esta gente vino a verlo.":
			"Une saison entière tient dans cette rue, et tous ces gens sont venus la voir.",

		"RECIBIMIENTO EN EL AYUNTAMIENTO": "RECEPTION A LA MAIRIE",
		"LA PLAZA ES VUESTRA": "LA PLACE EST A VOUS",

		"RECIBIMIENTO EN EL PALACIO": "RECEPTION AU PALAIS",
		"EL PAÍS ES VUESTRO": "LE PAYS EST A VOUS",
		"Un país entero bajo un balcón, y una sola copa que enseñarle.":
			"Tout un pays sous un balcon, et une seule coupe à lui montrer.",
		"TÍTULOS EN EL BALCÓN": "TROPHEES AU BALCON",
		"Tres títulos y un balcón. El año que nadie esperaba de vosotros.":
			"Trois titres et un balcon. La saison que personne n'attendait de vous.",
		"Dos en la misma temporada. Abajo no cabe nadie más.":
			"Deux dans la même saison. En bas, il n'y a plus de place.",
		"No hizo falta cortar la avenida: vino la ciudad entera aquí.":
			"Pas besoin de fermer l'avenue : c'est toute la ville qui est venue ici.",
		"LA PEÑA DEL CLUB": "LE CLUB DE SUPPORTERS",
		"AQUÍ CABE TODO EL CLUB": "TOUT LE CLUB TIENT ICI",
		"TÍTULOS SOBRE LA BARRA": "TROPHEES SUR LE COMPTOIR",
		"Tres copas en una barra de seis metros. Ya no caben más.":
			"Trois coupes sur six mètres de comptoir. Il n'en tiendra pas une de plus.",
		"Dos en la misma temporada, y el local se quedó pequeño.":
			"Deux dans la même saison, et le local est devenu trop petit.",
		"No vino la ciudad entera. Vinieron los que siempre vienen.":
			"La ville entière n'est pas venue. Ceux qui viennent toujours, si.",
		"SUBIMOS": "ON MONTE",
		"SALTARON AL CÉSPED · Y NO CABÍA NADIE MÁS": "ILS ONT ENVAHI LA PELOUSE · PLUS DE PLACE POUR PERSONNE",
		"Subir cambia el club entero: otro presupuesto, otros rivales, otra vida.":
			"Monter change tout le club : autre budget, autres rivaux, autre vie.",
		"PUESTO FINAL · DE {0} EQUIPOS": "PLACE FINALE · SUR {0} EQUIPES",
		"El club entero baja contigo: menos presupuesto, otros rivales, y una temporada para volver.":
			"Tout le club descend avec toi : moins de budget, d'autres rivaux, et une saison pour remonter.",
		"CAMPEON": "CHAMPION",
		"PASILLO DE HONOR": "HAIE D'HONNEUR",
		"EN CASA DE {0}": "CHEZ {0}",
		"de ventaja": "d'avance",

		"Con jornadas de sobra y ya no hay nada que discutir. Por eso te aplauden ellos.":
			"Avec des journées d'avance et plus rien à discuter. C'est pour ça qu'eux aussi t'applaudissent.",
		"Te lo reconocen los que lo perdieron. No hay elogio mejor.":
			"Ceux qui l'ont perdu te le reconnaissent. Il n'y a pas plus bel éloge.",
		"LA LISTA": "LA LISTE",
		"ONCE INICIAL": "ONZE DE DEPART",
		"TITULARES": "TITULAIRES",
		"SUPLENTES": "REMPLACANTS",
		"ESTÁS EN EL ONCE": "TU ES DANS LE ONZE",
		"TE QUEDAS FUERA DEL ONCE": "TU ES HORS DU ONZE",
		"NO ESTÁS EN LA LISTA": "TU N'ES PAS DANS LA LISTE",
		"A ENTRENAR": "A L'ENTRAINEMENT",
		"El míster te pone de salida. El sitio hay que sostenerlo.":
			"Le coach te titularise. Maintenant il faut garder la place.",
		"Empiezas en el banco. Se recupera jugando, no discutiendo.":
			"Tu commences sur le banc. Ca se récupère en jouant, pas en discutant.",
		"Esta semana ni te vistes. El lunes se vuelve a empezar.":
			"Cette semaine tu ne te changes même pas. Lundi on repart de zéro.",
		"EL ESTADIO LLEVA TU NOMBRE": "LE STADE PORTE TON NOM",
		"ASÍ SE LLAMA DESDE HOY": "C'EST SON NOM DES AUJOURD'HUI",
		"TÍTULOS CON ESTE CLUB": "TITRES AVEC CE CLUB",
		"Los que vengan detrás van a jugar en un sitio que se llama como tú. Eso ya no te lo quita nadie.":
			"Ceux qui viendront après joueront dans un endroit qui porte ton nom. Ca, personne ne te l'enlève.",
		"CAMPEONES": "CHAMPIONS",
		"TUS GOLES EN ESTE TORNEO · {0} PARTIDOS": "TES BUTS DANS CE TOURNOI · {0} MATCHS",
		"CAMPEÓN DE {0}": "CHAMPION DE {0}",
		"CAMPEÓN · {0}": "CHAMPION · {0}",
		"BIENVENIDO": "BIENVENUE",
		"DE VUELTA": "DE RETOUR",
		"Aquí ya sabes dónde está todo. Falta que te vuelvan a ver.": "Ici tu connais chaque recoin. Reste à te faire revoir.",
		"LLEGAS CEDIDO": "TU ARRIVES EN PRET",
		"FICHAJE LIBRE": "TRANSFERT LIBRE",
		"NUEVO FICHAJE": "NOUVELLE RECRUE",
		"EN LAS GRADAS · AFORO {0}": "EN TRIBUNES · CAPACITE {0}",
		"En equipo": "En équipe",
		"Individuales": "Individuels",
		"TRASPASO ${0}": "TRANSFERT ${0}",
		"AL VESTUARIO": "AU VESTIAIRE",
		"ESTA SEMANA": "CETTE SEMAINE",
		"PRETEMPORADA": "PRESAISON",
		"TU FICHAJE": "TON TRANSFERT",
		"TU RENOVACIÓN": "TA PROLONGATION",
		"FINAL DE TEMPORADA": "FIN DE SAISON",
		"CAMPEÓN": "CHAMPION",
		"LA GALA": "LA CEREMONIE",
		"Campeón del mundo. No hay nada por encima de esto.":
			"Champion du monde. Il n'y a rien au-dessus de ça.",
		"La noche que Europa se quedó mirándote a ti.": "La nuit où toute l'Europe te regardait, toi.",
		"El mejor club del mundo, y tú dentro.": "Le meilleur club du monde, et toi dedans.",
		"Tu continente lleva tu nombre este verano.": "Ton continent porte ton nom cet été.",
		"Europa por la puerta de atrás. Se entra igual.":
			"L'Europe par la petite porte. On y entre quand même.",
		"La tercera copa de Europa también pesa al levantarla.":
			"La troisième coupe d'Europe pèse tout autant quand on la soulève.",
		"Nueve meses para esta tarde. Campeones.": "Neuf mois pour cet après-midi. Champions.",
		"Una final, un título. Así de simple y así de difícil.":
			"Une finale, un titre. Aussi simple, aussi difficile que ça.",
		"MEJOR DE LA CHAMPIONS": "MEILLEUR COUPE ELITE",
		"El mejor de Europa en la competición que todos miran.":
			"Le meilleur d'Europe dans la compétition que tout le monde regarde.",
		"MEJOR DE LA EUROPA LEAGUE": "MEILLEUR COUPE EUROPA",
		"El mejor de tu Europa. La otra también se gana jugando.":
			"Le meilleur de ton Europe. L'autre aussi se gagne en jouant.",
		"MEJOR DE LA CONFERENCE": "MEILLEUR COUPE CHALLENGE",
		"El mejor de la tercera Europa. Se juega con la misma pelota.":
			"Le meilleur de la troisième Europe. On y joue avec le même ballon.",
		"MEJOR JUGADOR DE LA LIGA": "MEILLEUR JOUEUR DU CHAMPIONNAT",
		"Nueve meses de competición y el mejor fuiste tú.":
			"Neuf mois de compétition, et le meilleur, c'était toi.",
		"MEJOR DEL MUNDIALITO": "MEILLEUR DU MONDIAL DES CLUBS",
		"Dos partidos contra los campeones del mundo. Mandaste tú.":
			"Deux matchs contre les champions du monde. C'est toi qui as commandé.",
		"MEJOR DE LA COPA": "MEILLEUR DE LA COUPE",
		"El torneo donde un mal día te elimina. No lo tuviste.":
			"Le tournoi où un jour sans t'élimine. Tu n'en as pas eu.",
		"LLENO HISTÓRICO": "AFFLUENCE RECORD",
		"ESTADIO LLENO": "STADE PLEIN",
		"MEDIA ENTRADA": "STADE A MOITIE",
		"PRESENTACIÓN DISCRETA": "PRESENTATION DISCRETE",
		"¿Última parada o retiro dorado? La grada vino a averiguarlo.":
			"Dernière étape ou retraite dorée ? Le public est venu pour le savoir.",
		"Nadie entiende qué haces aquí. Vinieron por morbo; convéncelos.":
			"Personne ne comprend ce que tu fais ici. Ils sont venus par curiosité ; convaincs-les.",
		"Vienen a ver si eres el refuerzo que les faltaba.":
			"Ils sont venus voir si tu es le renfort qui leur manquait.",
		"Media grada se acercó a conocer al cedido.": "La moitié du stade est venue voir le prêté.",
		"Una cesión más. Aquí se demuestra jugando.": "Un prêt de plus. Ici, ça se prouve en jouant.",
		"Sin pagar un peso y el estadio no cabe. Eso es un fichajazo.":
			"Pas un centime payé, et le stade est plein à craquer. Ca, c'est une sacrée recrue.",
		"Se agotaron las entradas para ver un fichaje gratis.": "Stade complet pour voir un transfert gratuit.",
		"Llegas libre y media grada quiso verte la cara.":
			"Tu arrives libre et la moitié du stade est venue voir ta tête.",
		"Sin traspaso y sin ruido. El ruido lo haces tú.":
			"Sans indemnité et sans bruit. Le bruit, c'est toi qui le fais.",
		"El club paró la ciudad para presentarte. No se olvida un día así.":
			"Le club a arrêté la ville pour te présenter. Un jour pareil, ça ne s'oublie pas.",
		"Lleno para ver a su fichaje. Ahora hay que responder.":
			"Stade plein pour voir leur recrue. Maintenant il faut répondre présent.",
		"Media entrada. Te conocen; falta que te quieran.":
			"Stade à moitié. Ils te connaissent ; reste à ce qu'ils t'aiment.",
		"El mejor jugador del mundo es suyo. No cabe un alma para verlo.":
			"Le meilleur joueur du monde est à eux. Pas une place libre pour le voir.",
		"Cuatro curiosos y una cámara. Aquí se empieza desde abajo.":
			"Quelques curieux et une caméra. Ici, on commence tout en bas.",
		"Yo también creí que nadie me alcanzaría. Sigue así.":
			"Moi aussi je pensais que personne ne me rattraperait. Continue comme ça.",
		"Los títulos pesan más cuando los cuentan otros. Ya son más los tuyos.":
			"Les titres pèsent plus quand ce sont les autres qui comptent. Les tiens sont déjà plus nombreux.",
		"Me costó una vida llegar ahí arriba. A ti te va a costar quedarte.":
			"Il m'a fallu une vie pour arriver là-haut. Toi, ça va te coûter d'y rester.",
		"No te acostumbres a mirar hacia abajo. Sigue ganando.":
			"Ne t'habitue pas à regarder en bas. Continue de gagner.",
		"Bienvenido. Aquí arriba se está solo, pero se ve todo.":
			"Bienvenue. Là-haut on est seul, mais on voit tout.",
		"Cada gol mío lo llevo contado. Ahora los tuyos son más. Sigue.":
			"J'ai compté chacun de mes buts. Les tiens sont plus nombreux maintenant. Continue.",
		"Yo marqué hasta el último día. Tú vas más rápido que yo.":
			"J'ai marqué jusqu'au dernier jour. Toi, tu vas plus vite que moi.",
		"Los números se rompen para eso. Que alguien rompa los tuyos.":
			"Les records existent pour ça. Que quelqu'un batte les tiens.",
		"No pares ahora: al que deja de marcar lo alcanzan en un año.":
			"N'arrête pas maintenant : celui qui cesse de marquer se fait rattraper en un an.",
		"Me tocó verlo desde aquí. Sigue así y no te alcanza nadie.":
			"J'ai dû regarder ça d'ici. Continue comme ça et personne ne te rattrape.",
		"MÁS TÍTULOS DE LA HISTORIA": "PLUS DE TITRES DE L'HISTOIRE",
		"MÁS TÍTULOS": "PLUS DE TITRES",
		"trofeos": "trophées",



		"MEJOR JUGADOR DE LA HISTORIA": "MEILLEUR JOUEUR DE L'HISTOIRE",
		"YA NO QUEDA NADIE POR DELANTE": "PLUS PERSONNE DEVANT TOI",
		"DE LA HISTORIA": "DE L'HISTOIRE",
		"Todavía no he colgado las botas. Nos vemos en el campo.":
			"Je n'ai pas encore raccroché les crampons. On se voit sur le terrain.",
		"Disfrútalo, que esta temporada pienso quitártelo.":
			"Profites-en, parce que cette saison je compte te le reprendre.",
		"Pasarme con los dos en activo tiene mérito. Ahora aguántalo.":
			"Me dépasser alors qu'on joue encore tous les deux, ça a du mérite. Maintenant, tiens bon.",
		"Sigo jugando, y ya sé a quién me toca perseguir.":
			"Je joue encore, et je sais maintenant qui je dois poursuivre.",
		"Si me tenía que pasar alguien, mejor uno de casa. Sigamos ganando juntos.":
			"S'il fallait que quelqu'un me dépasse, autant que ce soit un gars de la maison. Continuons à gagner ensemble.",
		"Hoy te lo celebro yo. Mañana, a entrenar como siempre.":
			"Aujourd'hui, je fête ça avec toi. Demain, entraînement comme d'habitude.",
		"Que se entere el vestuario: aquí jugamos dos de los grandes.":
			"Que le vestiaire le sache : ici, deux des grands jouent ensemble.",
		"Ya no hay nadie delante de ti. Yo sigo jugando, así que no te relajes.":
			"Il n'y a plus personne devant toi. Moi, je joue encore, alors ne te relâche pas.",
		"Ya no hay nadie delante de ti. Ahora el nombre a batir es el tuyo.":
			"Il n'y a plus personne devant toi. Maintenant, le nom à battre, c'est le tien.",

		"{0}G {1}A": "{0}B {1}P",
		"media": "moyenne",
		"clubes": "clubs",
		"A {0}": "A {0}",
		"temporadas": "saisons",
		"Ni un balón. Aquí no se quedó nada tuyo, y tú no te llevas nada.": "Pas un seul ballon. Rien de toi n'est resté ici, et tu ne remportes rien.",
		"La maleta va vacía. Lo que dejaste aquí no cabe en ella: se queda en la grada.": "Ton sac part vide. Ce que tu as laissé ici n'y tient pas : ça reste dans les tribunes.",
		"dorsal": "numéro",
		"{0} {1} · JUGADOR DEL PARTIDO": "{0} {1} · HOMME DU MATCH",
		"tiros": "tirs",
		"pases": "passes",
		"RECORD": "RECORD",
		"¡A {0}!": "A {0} !",
		"puntos": "points",
		"jornadas": "matchs restants",
		"ligas": "championnats",
		"copas": "coupes",
		"europas": "coupes d'Europe",
		"ascensos": "montées",
		"Este club no había ganado nada parecido en toda su historia. Lo trajiste tú, y aquí no se va a olvidar.":
			"Ce club n'avait jamais rien gagné de tel de toute son histoire. Tu l'as apporté, et ici on ne l'oubliera pas.",
		"MENU PRINCIPAL": "MENU PRINCIPAL",
		"UN JUEGO DE": "UN JEU DE",
		"Clubes, ligas, competiciones, estadios y jugadores son ficticios. Football Legacy no está afiliado, patrocinado ni respaldado por ninguna liga, club, federación o competición real.": "Clubs, ligues, compétitions, stades et joueurs sont fictifs. Football Legacy n'est ni affilié, ni sponsorisé, ni approuvé par une ligue, un club, une fédération ou une compétition réels.",
		"CODIGO · DISENO · ARTE · SONIDO": "CODE · DESIGN · GRAPHISME · SON",
		"TU PRESENTACION": "TA PRESENTATION",
		"SELECCION T{0}": "SELECTION S{0}",
		"TU MEJOR GOL": "TON PLUS BEAU BUT",
		"GOLES DE CARRERA": "BUTS EN CARRIERE",
		"Completa una temporada en {0} división o ficha por un club de {1} para desbloquear.":
			"Termine une saison en {0} division ou signe dans un club de {1} pour débloquer.",



















		"COMO SALE": "COMMENT L'OBTENIR",
		"CELEBRACION NUEVA": "NOUVELLE CELEBRATION",
		"CELEBRACIONES": "CELEBRATIONS",
		"SITIOS": "ENDROITS",
		"GESTOS": "GESTES",
		"Celebración por descubrir. Sigue marcando goles.":
			"Célébration à découvrir. Continue à marquer des buts.",


		"ESCENAS": "SCENES",
		"GLORIA": "GLOIRE",
		"DUELO": "DEUIL",
		"MOMENTOS": "MOMENTS",
		"REVIVIR": "REVIVRE",
		"Toca para revivir cómo fue.": "Touche pour revivre comment ça s'est passé.",
		"Puedes verla otra vez con el botón.": "Tu peux la revoir avec le bouton.",
		"Escena por vivir. Sigue jugando tu carrera.": "Scène à vivre. Continue ta carrière.",
		"EL ASCENSO": "LA MONTEE",
		"LA VUELTA CON LA COPA": "LE TOUR AVEC LA COUPE",
		"LA GALA DEL JUGADOR DEL AÑO": "GALA DU MEILLEUR JOUEUR",
		"LA GALA DEL CLUB": "LE GALA DU CLUB",
		"LA GALA DE LA LIGA": "LE GALA DE LA LIGUE",
		"EL RECORD": "LE RECORD",
		"LA LEYENDA TE SALUDA": "LA LEGENDE TE SALUE",
		"TU SITIO EN LA HISTORIA": "TA PLACE DANS L'HISTOIRE",
		"EL ESTADIO CON TU NOMBRE": "LE STADE A TON NOM",
		"EL HOMENAJE": "L'HOMMAGE",
		"EL DESFILE": "LE DEFILE",
		"EL BALCON DEL AYUNTAMIENTO": "LE BALCON DE LA MAIRIE",
		"LA PEÑA DEL BARRIO": "LES SUPPORTERS DU QUARTIER",
		"LAS PANTALLAS DE NUEVA YORK": "LES ECRANS DE NEW YORK",
		"LA COPA VUELVE EN AVION": "LA COUPE RENTRE EN AVION",
		"LA OVACION AJENA": "L'OVATION ADVERSE",
		"TU CANTO EN LA GRADA": "TON CHANT DANS LES TRIBUNES",
		"EL PASILLO DEL RIVAL": "LA HAIE D'HONNEUR DU RIVAL",
		"LA PRIMERA CONVOCATORIA": "LA PREMIERE SELECTION",
		"LA LISTA DEL MUNDIAL": "LA LISTE DU MONDIAL",
		"TU VIEJO DORSAL": "TON ANCIEN NUMERO",
		"EL BAR DEL BARRIO": "LE BAR DU QUARTIER",
		"EL DESCENSO": "LA DESCENTE",
		"SUBCAMPEON": "FINALISTE",
		"LA FINAL PERDIDA": "LA FINALE PERDUE",
		"LA ULTIMA TARDE": "LE DERNIER APRES-MIDI",
		"LA LESION": "LA BLESSURE",
		"LA PRIMERA BANCA": "LE PREMIER BANC",
		"LA PITADA": "LES SIFFLETS",
		"EL TECNICO SE VA": "LE COACH S'EN VA",
		"LA TAQUILLA VACIA": "LE CASIER VIDE",
		"SE FUE AL RIVAL": "PARTI CHEZ LE RIVAL",
		"LA VUELTA AL CAMPO ENEMIGO": "LE RETOUR EN TERRE ENNEMIE",
		"EL RECIBIMIENTO AL VERDUGO": "L'ACCUEIL DU BOURREAU",
		"LA DESPEDIDA DEL VESTUARIO": "L'ADIEU AU VESTIAIRE",
		"EL ULTIMO PARTIDO EN CASA": "LE DERNIER MATCH A LA MAISON",
		"EL ADIOS A LA SELECCION": "L'ADIEU A LA SELECTION",
		"EL PASILLO DE HONOR": "LA HAIE D'HONNEUR",
		"LA PRESENTACION": "LA PRESENTATION",
		"LA BIENVENIDA": "LA BIENVENUE",
		"LA FIRMA": "LA SIGNATURE",
		"LA RUEDA DE PRENSA": "LA CONFERENCE DE PRESSE",
		"LA PREGUNTA DEL PRECONTRATO": "LA QUESTION DU PRECONTRAT",
		"EL OJEADOR EN LA TRIBUNA": "LE RECRUTEUR EN TRIBUNE",
		"LLEGA EL REFUERZO": "LE RENFORT ARRIVE",
		"LOS FICHAJES DEL VERANO": "LES RECRUES DE L'ETE",
		"LA NOCHE DEL CIERRE": "LA NUIT DE LA CLOTURE",
		"TU FICHAJE EN LA PORTADA": "TON TRANSFERT A LA UNE",
		"LA CHARLA CON EL COMPAÑERO": "LA DISCUSSION AVEC LE COEQUIPIER",
		"LA LISTA DE LA SELECCION": "LA LISTE DE LA SELECTION",
		"EL VESTUARIO DE COPA": "LE VESTIAIRE DE COUPE",
		"EL SORTEO": "LE TIRAGE",
		"EL VESTUARIO DEL DERBI": "LE VESTIAIRE DU DERBY",
		"LA PORTADA DEL DERBI": "LA UNE DU DERBY",
		"EL MARCADOR DEL DERBI": "LE TABLEAU DU DERBY",
		"EL ESPEJO DEL DERBI": "LE MIROIR DU DERBY",
		"EL HUECO DEL DERBI": "LE VIDE DU DERBY",
		"EL PORTERO TE CONOCE": "LE GARDIEN TE CONNAIT",
		"LA TANDA DE PENALES": "LA SEANCE DE TIRS AU BUT",
		"EL RECUERDO": "LE SOUVENIR",
		"LA PASARELA DE EQUIPACIONES": "LE DEFILE DES MAILLOTS",

		"LOS AUTOGRAFOS EN LA PUERTA": "AUTOGRAPHES A L'ENTREE",
		"FIRMA LA CAMISETA": "SIGNE LE MAILLOT",
		"TRES CAMISETAS PARA LA GRADA": "TROIS MAILLOTS POUR LA TRIBUNE",
		"CAMISETAS FIRMADAS": "MAILLOTS SIGNES",
		"Ganaste, y tres se van a casa con tu firma.": "Victoire, et trois repartent avec ta signature.",
		"No hubo victoria, pero tres se van a casa con tu firma.": "Pas de victoire, mais trois repartent avec ta signature.",
		"LAS FIRMAS EN LA GRADA": "LES SIGNATURES EN TRIBUNE",
		"LA FIRMA DE FOTOS": "LA SEANCE DE DEDICACES",
		"FIRMA LA FOTO": "SIGNE LA PHOTO",
		"FOTOS FIRMADAS": "PHOTOS SIGNEES",
		"EVENTO CON LA AFICION": "RENCONTRE AVEC LES SUPPORTERS",
		"FIRMA DE FOTOS": "DEDICACE DE PHOTOS",
		"Tu primer evento con la afición: cinco fotos con tu firma.": "Ta première rencontre avec les supporters : cinq photos signées.",
		"Y la cola seguía: {0} más esperando su foto.": "Et la file continuait : {0} de plus attendaient leur photo.",
		"Cinco fotos con tu firma, cinco que se van contentos.": "Cinq photos signées, cinq supporters ravis.",
		"Firma con el dedo": "Signe avec ton doigt",
		"BORRAR FIRMA": "EFFACER",
		"AFICIÓN +{0}": "SUPPORTERS +{0}",
		"AFICIONADOS ESPERANDO": "SUPPORTERS EN ATTENTE",
		"TU PRIMER AUTÓGRAFO": "TON PREMIER AUTOGRAPHE",
		"TE ESPERABAN EN LA PUERTA": "ILS T'ATTENDAIENT A L'ENTREE",
		"Pocos, pero vinieron por ti. Así empieza todo.": "Peu nombreux, mais venus pour toi. Tout commence comme ça.",
		"Ya te reconocen desde lejos. Y tu coche también.": "On te reconnaît de loin. Ta voiture aussi.",
		"Llegar a entrenar ya es un acontecimiento.": "Arriver à l'entraînement est devenu un événement.",
		"Primer Autógrafo": "Premier Autographe",
		"Firmar una camiseta a la gente que te espera en la puerta de la ciudad deportiva.": "Signer un maillot pour ceux qui t'attendent à l'entrée du centre d'entraînement.",

		"La Más Vendida": "La Plus Vendue",
		"Que tu camiseta sea la más vendida del vestuario en una temporada.": "Avoir le maillot le plus vendu du vestiaire sur une saison.",
		"All-in": "All-in",
		"Ganar el torneo de póquer de tu casa.": "Gagner le tournoi de poker de ta maison.",
		"La Ley del Ex": "La Loi de l'Ex",
		"Marcarle un gol a un club del que te fuiste.": "Marquer contre un club que tu as quitté.",
		"Una Vida Entera": "Une Vie Entière",
		"Vivir 50 escenas distintas del álbum en una misma carrera.": "Vivre 50 scènes différentes de l'album dans une même carrière.",
		"Conquistador de Europa": "Maître de l'Europe",
		"Conquistador de Sudamérica": "Maître de l'Amérique du Sud",
		"Conquistador de Norteamérica": "Maître de l'Amérique du Nord",
		"Conquistador de África": "Maître de l'Afrique",
		"Conquistador de Asia": "Maître de l'Asie",
		"Conquistador de Oceanía": "Maître de l'Océanie",
		"Libro Completo": "Livre Complet",
		"Vencer a todos los clubes y selecciones de Europa.": "Battre tous les clubs et sélections d'Europe.",
		"Vencer a todos los clubes y selecciones de Sudamérica.": "Battre tous les clubs et sélections d'Amérique du Sud.",
		"Vencer a todos los clubes y selecciones de Norteamérica, Centroamérica y el Caribe.": "Battre tous les clubs et sélections d'Amérique du Nord, centrale et des Caraïbes.",
		"Vencer a todos los clubes y selecciones de África.": "Battre tous les clubs et sélections d'Afrique.",
		"Vencer a todos los clubes y selecciones de Asia.": "Battre tous les clubs et sélections d'Asie.",
		"Vencer a todos los clubes y selecciones de Oceanía.": "Battre tous les clubs et sélections d'Océanie.",
		"Vencer a todos los rivales del juego: cada club y cada selección del mundo.": "Battre tous les rivaux du jeu : chaque club et chaque sélection du monde.",
		"Álbum Completo": "Album Complet",
		"Descubrir todos los arquetipos de pareja.": "Découvrir tous les archétypes de partenaire.",
		"Rodeado": "Assailli",
		"Firmar autógrafos con 40 aficionados o más esperándote en la puerta.": "Signer des autographes avec 40 supporters ou plus qui t'attendent à l'entrée.",
		"Turista de Estadios": "Touriste des Stades",
		"Jugar en 25 estadios distintos.": "Jouer dans 25 stades différents.",
		"El Brazalete": "Le Brassard",
		"Ser el capitán de tu club.": "Devenir le capitaine de ton club.",
		"Desde los Once Metros": "Des Onze Mètres",
		"Marcar el penal que gana una tanda.": "Marquer le penalty qui gagne une séance de tirs au but.",
		"Carta de Presentación": "Carte de Visite",
		"Marcar en tu debut con un club nuevo.": "Marquer lors de tes débuts avec un nouveau club.",
		"De Hierro": "D'Acier",
		"Jugar 20 partidos o más en una temporada sin perderte ninguno por lesión.": "Jouer 20 matchs ou plus en une saison sans en manquer aucun sur blessure.",
		"Niño Prodigio": "Enfant Prodige",
		"Debutar en Primera División antes de cumplir 18 años.": "Débuter en Première Division avant tes 18 ans.",
		"Roble Viejo": "Vieux Chêne",
		"Marcar un gol con 38 años o más.": "Marquer un but à 38 ans ou plus.",
		"EL ALTA MEDICA": "LE RETOUR DE BLESSURE",
		"LA MUDANZA": "LE DEMENAGEMENT",
		"LAS OFERTAS DEL REGRESO": "LES OFFRES DU RETOUR",
		"¡ALARMA!": "ALARME !",
		"MUSEO DE {0}": "MUSEE DE {0}",
		"¿ME FIRMA LA GORRA?": "VOUS ME SIGNEZ LA CASQUETTE ?",
		"EL MUSEO DE TU EGO": "LE MUSEE DE TON EGO",
		"CLASE DE BAILE": "COURS DE DANSE",
		"PROFESOR: {0}": "PROFESSEUR : {0}",
		"LA CLASE DE LAS ABUELAS": "LE COURS DES MAMIES",
		"ESTRENO MUNDIAL": "AVANT-PREMIERE MONDIALE",
		"LA PELÍCULA DE {0}": "LE FILM DE {0}",
		"LA PELÍCULA DE TU VIDA": "LE FILM DE TA VIE",
		"DURACIÓN: 4 H 38 MIN": "DUREE : 4 H 38 MIN",
		"EL ESTRENO": "L'AVANT-PREMIERE",
		"TODAS LAS ESCENAS": "TOUTES LES SCENES",
		"Tu vida, en cines. Dura cuatro horas y media y nadie se ha ido.": "Ta vie au cinéma. Quatre heures et demie, et personne n'est parti.",
		"¡NO ME CUENTES EL FINAL!": "NE ME RACONTE PAS LA FIN !",
		"MARTES, 19:00": "MARDI, 19H00",
		"MÍSTERS ANÓNIMOS": "ENTRAINEURS ANONYMES",
		"PASO 1: ACEPTAR QUE LO SENTASTE": "ETAPE 1 : ACCEPTER DE L'AVOIR MIS SUR LE BANC",
		"TERAPIA DE MÍSTERS": "THERAPIE D'ENTRAINEURS",
		"TERAPIA DE MISTERS": "THERAPIE D'ENTRAINEURS",
		"TODOS LOS TÉCNICOS": "TOUS LES ENTRAINEURS",
		"Los has tenido a todos. Ahora se reúnen los martes para superarlo.": "Tu les as tous eus. Maintenant ils se retrouvent le mardi pour s'en remettre.",
		"¡ES ÉL! ¡EL QUE PEDÍA SER TITULAR!": "C'EST LUI ! CELUI QUI VOULAIT ETRE TITULAIRE !",
		"RESERVA PARA SIETE": "TABLE POUR SEPT",
		"LA CENA DE LAS EX": "LE DINER DES EX",
		"TODAS LAS PAREJAS": "TOUTES LES COMPAGNES",
		"Las has conocido a todas. Todas. En la misma mesa.": "Tu les as toutes connues. Toutes. À la même table.",
		"PAGA ÉL, ¿NO?": "C'EST LUI QUI PAIE, NON ?",
		"DOMINGO, 13:00": "DIMANCHE, 13H",
		"LOS DERROTADOS": "LES VAINCUS",
		"BARBACOA DE LOS DERROTADOS": "LE BARBECUE DES VAINCUS",
		"TODOS LOS RIVALES": "TOUS LES RIVAUX",
		"Les ganaste a todos. Te invitaron igual. La salchicha, quemada.": "Tu les as tous battus. Ils t'ont invité quand même. La saucisse est brûlée.",
		"BARBACOA ANUAL": "BARBECUE ANNUEL",
		"PERDIMOS CONTRA {0}": "ON A PERDU CONTRE {0}",
		"TE GUARDAMOS LA SALCHICHA QUEMADA": "ON T'A GARDE LA SAUCISSE BRULEE",
		"03:12 · MUSEO CERRADO": "03:12 · MUSEE FERME",
		"EL CONSERJE DEL SALÓN": "LE CONCIERGE DU TEMPLE",
		"TU PRIMERA PLACA": "TA PREMIERE PLAQUE",
		"Ya estás en el Salón de la Fama. El conserje tiene la foto que lo demuestra.": "Te voilà au Temple de la renommée. Le concierge a la photo pour le prouver.",
		"PARA MI CUÑADO, QUE NO SE LO CREE": "POUR MON BEAU-FRERE, IL NE ME CROIT PAS",
		"INAUGURACIÓN": "INAUGURATION",
		"TU ESTATUA": "TA STATUE",
		"LA ESTATUA": "LA STATUE",
		"TODA LA COLECCIÓN": "TOUTE LA COLLECTION",
		"Lo has completado todo. Te han hecho una estatua. El pelo es del utillero.": "Tu as tout complété. On t'a fait une statue. Les cheveux sont ceux de l'intendant.",
		"LEYENDA ETERNA": "LEGENDE ETERNELLE",
		"¿ESE PELO ES DEL UTILLERO?": "CE SONT LES CHEVEUX DE L'INTENDANT ?",
		"TODOS LOS FESTEJOS": "TOUTES LES CELEBRATIONS",
		"Te sabes todos los festejos. Ahora ellas también.": "Tu connais toutes les célébrations. Elles aussi, maintenant.",
		"¡AHORA LA DE QUITARSE LA CAMISETA!": "MAINTENANT CELLE DU MAILLOT ENLEVE !",
		"TODOS LOS LOGROS": "TOUS LES SUCCES",
		"Lo tienes todo. Hasta el guardia de noche es fan tuyo.": "Tu as tout. Même le gardien de nuit est fan de toi.",
		"LA FIRMA DEL REGRESO": "LA SIGNATURE DU RETOUR",


		"EL BANDERIN": "LE DRAPEAU",
		"El clásico: todo el equipo corre al banderín del lado por donde entró el balón.":
			"Le grand classique : toute l'équipe court au drapeau de corner,"
			+ " du côté par où le ballon est entré.",
		"CON LA GENTE": "AVEC LE PUBLIC",
		"Al fondo, detrás de la línea de gol. En casa, además, te abrazas con un aficionado.":
			"Au virage, derrière la ligne de but. Et à domicile, tu tombes"
			+ " dans les bras d'un supporter.",
		"LA PIÑA": "LA GRAPPE",
		"Nadie se va a ningún lado: la montonera se arma justo donde marcaste.":
			"Personne ne part nulle part : tout le monde se jette sur toi,"
			+ " pile là où tu as marqué.",
		"CON LOS SUPLENTES": "AVEC LE BANC",
		"A la banda, con los suplentes. El gol del que acaba de entrar se festeja con los que siguen en el banco.":
			"Direction la touche, avec les remplaçants. Le but de celui qui vient"
			+ " d'entrer se fête avec ceux qui sont restés sur le banc.",
		"AL CENTRO": "AU ROND CENTRAL",
		"Balón bajo el brazo y a sacar de nuevo. Todavía no hay nada que festejar.":
			"Ballon sous le bras et retour au coup d'envoi. Il n'y a encore rien à fêter.",
		"TU RINCON": "TON PARCAGE",
		"Sólo de visita: a la esquina donde está tu puñado de aficionados.":
			"Seulement à l'extérieur : jusqu'au parcage où tient ta poignée de supporters.",
		"SALTAR LA VALLA": "SAUTER LES PANNEAUX",
		"Sólo en casa: saltas la publicidad y te vas hasta el pie de la grada. Esa esquina se vuelve loca.":
			"Seulement à domicile : tu franchis les panneaux et tu vas jusqu'au pied"
			+ " de la tribune. Ce coin-là devient fou.",
		"AL TECNICO": "L'ACCOLADE DU COACH",
		"Vienes de bronca con el entrenador y te vas a la raya a abrazarlo. Una sola vez por partido.":
			"Tu sors d'une engueulade avec l'entraîneur et tu files à la ligne de touche"
			+ " le prendre dans tes bras. Une seule fois par match.",
		"EN SU CASA": "CHEZ EUX",
		"Gol en un derbi, de visita: lo festejas frente a su fondo. Te abuchea el estadio entero y te llueven botellas.":
			"But en derby, à l'extérieur : tu le fêtes face à leur virage. Tout le stade"
			+ " te siffle et les bouteilles pleuvent.",
		"PARA LA TELE": "PLEIN CADRE",
		"Te plantas delante de la cámara de televisión y el gol se ve por su visor. Sólo donde hay transmisión: en tercera no hay cámaras.":
			"Tu te plantes devant la caméra de télévision et le but se voit par son viseur. Seulement là où il y a une retransmission : pas de caméras en troisième division.",
		"ES NUESTRO": "IL EST A NOUS",
		"Última jornada, y el gol te pone por delante. Salta hasta el banquillo al campo.":
			"Dernière journée, et ton but vous met devant. Même le banc saute sur la pelouse.",


		"DE RODILLAS": "LA GLISSADE",
		"Llegas barriéndote de rodillas. Una de cada tres veces, en los festejos con carrera de verdad.":
			"Tu arrives en glissade sur les genoux. Une fois sur trois, dans les"
			+ " célébrations avec une vraie course.",
		"PUÑO AL AIRE": "POING LEVE",
		"El salto con el puño cerrado, en el gol agónico que lo cambia todo.":
			"Le saut, poing serré, sur le but de la dernière seconde qui change tout.",
		"BALON A LA GRADA": "BALLON EN TRIBUNE",
		"La otra cara del gol agónico: reventar el balón hacia arriba y que caiga donde caiga.":
			"L'autre visage du but de la dernière seconde : expédier le ballon en l'air"
			+ " et tant pis où il retombe.",
		"BANDERIN PARTIDO": "DRAPEAU BRISE",
		"Llegas al córner y le metes una patada al mástil. Se parte. Uno de cada seis córners.":
			"Tu arrives au corner et tu mets un coup de pied dans le mât. Il casse."
			+ " Un corner sur six.",
		"MASTIL AGARRADO": "POING SUR LE DRAPEAU",
		"Llegas al córner, agarras el mástil con el puño y te plantas con la mano en la cadera.": "Tu arrives au corner, tu saisis le poteau du poing et tu poses, la main sur la hanche.",
		"SIN CAMISETA": "TORSE NU",
		"Te quitas la camiseta y les enseñas el dorsal. Siempre trae factura: abucheo y botellas.":
			"Tu enlèves ton maillot et tu leur montres ton numéro. La note arrive"
			+ " toujours : sifflets et bouteilles.",
		"EL SILENCIO": "LE SILENCE",
		"Plantarte quieto frente a su fondo mientras el estadio te abuchea. No hacer nada es el gesto.":
			"Rester planté face à leur virage pendant que le stade te siffle."
			+ " Ne rien faire, c'est ça le geste.",
		"BRAZOS ABIERTOS": "BRAS OUVERTS",
		"Con el brazalete de tu país: brazos abiertos, pidiéndole más a tu gente.":
			"Avec le brassard de ton pays : bras ouverts, pour en réclamer encore plus aux tiens.",
		"GRACIAS, SOCIO": "MERCI, L'AMI",
		"El gol lo empezó otro: vino de un centro o de un córner, y lo primero que haces es señalar a quien lo puso.":
			"Le but a commencé ailleurs : il vient d'un centre ou d'un corner, et la première chose que tu fais est de désigner celui qui l'a mis.",
		"LA REVERENCIA": "LE SALUT",
		"Un golazo: desde fuera del área o de falta directa. Te giras hacia la grada y te inclinas. La mitad de las veces.":
			"Une frappe de loin ou un coup franc direct. Tu te tournes vers la tribune et tu salues. Une fois sur deux.",
		"BESO AL ESCUDO": "LE BAISER AU BLASON",
		"Tres temporadas o más en el mismo club. Ya no eres un fichaje, eres de la casa: besas el escudo y la grada lo sabe.":
			"Trois saisons ou plus au même club. Tu n'es plus une recrue, tu es de la maison : tu embrasses le blason et la tribune le sait.",
		"TRES DEDOS": "TROIS DOIGTS",
		"Tu tercer gol del partido. No hay nada que explicar: levantas tres dedos y que los cuenten ellos.":
			"Ton troisième but du match. Rien à expliquer : tu lèves trois doigts et ils n'ont qu'à compter.",
		"SIN FESTEJAR": "SANS CELEBRER",
		"Le marcaste al club que te formó. Te quedas quieto, con la mano en alto. Los otros nueve vienen a abrazarte igual.":
			"Tu viens de marquer contre le club qui t'a formé. Tu restes immobile, une main levée. Les neuf autres viennent t'embrasser quand même.",
		"AL CIELO": "VERS LE CIEL",
		"Tu primer gol después de una lesión larga. Señalas al cielo. Sólo cuenta ese gol, no los de después.":
			"Ton premier but après une longue blessure. Tu pointes le ciel."
			+ " Seul ce but-là compte, pas ceux d'après.",


		"A TU PORTERO":
			"VERS TON GARDIEN",
		"Tu portero te salvó el partido con una parada. El festejo se va hacia TU campo y él viene corriendo desde su área.":
			"Ton gardien t'a sauvé le match sur un arrêt. La fête part vers TON camp et il arrive en courant de sa surface.",
		"AL FOSO":
			"VERS LA FOSSE",
		"Sólo de noche, con los focos encendidos: te plantas contra la valla del fondo y el estadio entero se te llena de flashes.":
			"Seulement la nuit, sous les projecteurs : tu te plantes contre les panneaux derrière le but et tout le stade s'illumine de flashs.",
		"A LA TRIBUNA":
			"VERS LA TRIBUNE",
		"Hay clubes preguntando por ti. Te vas a la banda de la tribuna principal y señalas hacia el palco: que decidan ellos.":
			"Des clubs se renseignent sur toi. Tu files sur la ligne de touche devant la tribune et tu montres la loge : à eux de décider.",
		"EN SU AREA":
			"DANS LEUR SURFACE",
		"Derbi de visita: no corres a ningún lado. Te plantas en el punto de penalti, de espaldas al arco y de cara a su gente, con los brazos abiertos.":
			"Derby à l'extérieur : tu ne cours nulle part. Tu te plantes sur le point de penalty, dos au but, face à leurs supporters, les bras grands ouverts.",
		"NADIE VIENE":
			"PERSONNE NE VIENT",
		"El vestuario no te quiere. Marcas, y ninguno de los diez va a abrazarte: se dan la vuelta y te dejan ahí.":
			"Le vestiaire ne t'aime pas. Tu marques, et aucun des dix ne vient te prendre dans ses bras : ils se retournent et te laissent là.",
		"MAS RUIDO":
			"PLUS FORT",
		"En casa: las dos manos a las orejas, pidiéndole a tu gente que se oiga.":
			"Chez toi : les deux mains derrière les oreilles, pour demander à ton public de se faire entendre.",
		"BESAR EL CESPED":
			"EMBRASSER LA PELOUSE",
		"Tu primera temporada en el club: te arrodillas y besas el césped de tu casa nueva.":
			"Ta première saison au club : tu tombes à genoux et tu embrasses la pelouse de ta nouvelle maison.",
		"APLAUSO A TU GENTE":
			"APPLAUDIR TES SUPPORTERS",
		"Marcas, pero seguís perdiendo: nada de gritos, aplaudes a los que vinieron a verte.":
			"Tu marques, mais vous perdez encore : pas de cris, tu applaudis ceux qui sont venus te voir.",
		"SALUDO DE GOLEADA":
			"SALUT DU CARTON",
		"Con tres goles o más de ventaja ya no hay nada que gritar: caminas saludando a la grada.":
			"Avec trois buts d'avance ou plus, plus rien à crier : tu marches en saluant la tribune.",
		"SALTO DE CABEZA":
			"SAUT DE LA TETE",
		"Gol por alto: saltas una y otra vez con los brazos al cielo.":
			"But aérien : tu sautes encore et encore, les bras au ciel.",
		"EL AVION":
			"L'AVION",
		"Corres al festejo con los brazos abiertos, planeando como un avión. Sólo en los festejos con carrera de verdad.":
			"Tu cours fêter le but les bras grands ouverts, en planant comme un avion. Seulement dans les célébrations avec une vraie course.",
		"LA SELFIE":
			"LE SELFIE",
		"Pegado a tu gente —tu fondo o la valla en casa, tu rincón de visita—: sacas el teléfono y te haces una foto con ellos.":
			"Collé à ton public —ton virage ou la barrière à domicile, ton coin à l'extérieur— : tu sors ton téléphone et tu fais une photo avec eux.",
		"ES MI HORA":
			"MON HEURE",
		"Gol del minuto 80 en adelante: te señalas la muñeca, que es tu hora. Una de cada tres veces.":
			"Un but à partir de la 80e minute : tu montres ton poignet, c'est ton heure. Une fois sur trois.",
		"MODO ZEN":
			"MODE ZEN",
		"Con dos goles de ventaja o más: te sientas en el césped con las piernas cruzadas y meditas. Que se preocupen ellos.":
			"Avec deux buts d'avance ou plus : tu t'assois en tailleur sur la pelouse et tu médites. Qu'ils s'inquiètent, eux.",
		"BESO AL ANILLO":
			"BAISER A L'ALLIANCE",
		"Tienes pareja: besas el anillo y señalas a la grada, a quien te mira desde allí. Uno de cada cinco goles.":
			"Tu es en couple : tu embrasses ton alliance et tu montres la tribune, vers la personne qui te regarde de là-haut. Un but sur cinq.",
		"MI NOMBRE":
			"MON NOM",
		"Hay clubes preguntando por ti: te das la vuelta y te señalas el nombre de la espalda para que lo apunten. La mitad de las veces.":
			"Des clubs se renseignent sur toi : tu te retournes et tu montres le nom dans ton dos pour qu'ils le notent. Une fois sur deux.",
		"LA MORTAL":
			"LE SALTO ARRIERE",
		"Un golazo, desde fuera del área o de falta: llegas, tomas impulso y das una mortal hacia atrás. La otra mitad de los golazos.":
			"Un but d'anthologie, de loin ou sur coup franc : tu arrives, tu prends ton élan et tu fais un salto arrière. L'autre moitié des grands buts.",
		"EL DAB":
			"LE DAB",
		"Se gana en el banquillo, con tus tres botellas de pie: escondes la cara en el codo y apuntas con el otro brazo. Uno de cada siete goles.":
			"Se gagne sur le banc, avec tes trois bouteilles debout : tu caches ton visage dans ton coude et tu pointes de l'autre bras. Un but sur sept.",
		"¡DAB DESBLOQUEADO! Ya sale en tus goles.":
			"DAB DEBLOQUE ! Il est dans tes célébrations.",
		"Se gana en el banquillo, con tres partidas ganadas 2-0: te plantas cara a cara con un compañero y os jugáis el gol a una mano. Uno de cada siete goles.":
			"Se gagne sur le banc, avec trois parties gagnées 2-0 : tu te mets face à un coéquipier et vous jouez le but à une main. Un but sur sept.",
		"2-0: {0} de {1} para festejar tus goles con CHIN CHAN PU.":
			"2-0 : {0} sur {1} pour fêter tes buts avec un CHIFOUMI.",
		"¡CHIN CHAN PU DESBLOQUEADO! Ya sale en tus goles.":
			"CHIFOUMI DEBLOQUE ! Il est dans tes célébrations.",
		"BRAZOS CRUZADOS":
			"BRAS CROISES",
		"Ya habías fallado dos claras hoy. A la tercera no festejas: te cruzas de brazos y que hablen ellos.":
			"Tu avais déjà raté deux occasions énormes aujourd'hui. À la troisième tu ne célèbres pas : tu croises les bras et tu les laisses parler.",


		"AL CHARCO":
			"DANS LA FLAQUE",
		"Sólo con lluvia y campo encharcado: todo el equipo corre al charco más cercano y se lanza de panza. Salpica hasta la valla.":
			"Seulement sous la pluie, sur un terrain détrempé : toute l'équipe court à la flaque la plus proche et plonge à plat ventre. Ça éclabousse jusqu'aux panneaux.",
		"EN LA VALLA":
			"SUR LES PANNEAUX",
		"Sólo en casa: te subes a la publicidad con los dos que llegan contigo. Los tres, sentados y de brazos cruzados, mirando al campo.":
			"Seulement à domicile : tu montes sur les panneaux publicitaires avec les deux qui arrivent avec toi. Tous les trois assis, bras croisés, face au terrain.",
		"LA BOTELLA":
			"LA BOUTEILLE",
		"Festejando pegado a tu grada, alguien te tira una botella de agua: la atrapas al vuelo, te la bebes y la mandas de vuelta.":
			"En fêtant collé à ton virage, quelqu'un te lance une bouteille d'eau : tu l'attrapes au vol, tu la bois et tu la renvoies.",


		"EN TU PUESTO MANDA": "A TON POSTE, C'EST",
		"Empiezas en el banquillo.": "Tu commences sur le banc.",

		"JUEGAS EN {0} · PIDE {1}": "TU JOUES EN {0} · EXIGE {1}",
		"NOTA {0} · PIDE {1}": "NOTE {0} · EXIGE {1}",
		"{0} A {1} DE TU SITIO": "{0} A {1} DE TA PLACE",
		"{0} A {1}": "{0} A {1}",
		"DE TU SITIO": "DE TA PLACE",
		"TÉCNICO {0} · PIDE {1}": "SELECTIONNEUR {0} · DEMANDE {1}",
		"TÉCNICO {0}": "COACH {0}",
		"A {0} DE {1}": "A {0} DE {1}",
		"TE ACERCAS": "TU TE RAPPROCHES",
		"TE ALEJAS": "TU T'ELOIGNES",
		"Por nivel saldrías de inicio, pero el seleccionador te tiene en {0} y sólo pone de titular a quien le tiene en {1}. Se gana con partidos de selección.": "Par niveau tu serais titulaire, mais le sélectionneur t'estime à {0} et ne titularise que ceux qu'il estime à {1}. Ça se gagne avec des matchs en sélection.",
		"El vestuario te tiene en {0}: hasta {1} te llegarán {2} balones como mucho.": "Le vestiaire t'estime à {0} : jusqu'à {1}, tu recevras {2} ballons au plus.",
		"En casa la afición está contigo ({0}): un balón más.": "À domicile, le public est avec toi ({0}) : un ballon de plus.",
		"En casa la afición te pita ({0}): un balón menos.": "À domicile, le public te siffle ({0}) : un ballon de moins.",
		"LE QUITASTE EL SITIO A": "TU AS PRIS LA PLACE DE",
		"RESERVA": "RESERVE",
		"PLANTILLA": "EFFECTIF",
		"EL ONCE": "LE ONZE",
		"NO CONVOCADOS": "NON CONVOQUES",
		"RACHA": "FORME",
		"TU PUESTO": "TON POSTE",
		"PEDIR JUGAR DE {0} · {1}": "DEMANDER A JOUER EN {0} · {1}",
		"LO VERA BIEN": "IL SERA POUR",
		"PUEDE ESCUCHARTE": "IL POURRAIT T'ECOUTER",
		"LO VERA DIFICIL": "IL EN DOUTERA",
		"NI LO ESCUCHA": "IL N'ECOUTERA PAS",
		"Ya le pediste un cambio de puesto en esta ventana.": "Tu as déjà demandé un changement de poste ce mercato.",
		"El club te pasa a jugar de {0}.": "Le club te fait jouer {0}.",
		"{0} · RINDES {1}%": "{0} · RENDEMENT {1}%",
		"{0} · RINDES AL {1}% AQUI": "{0} · TU RENDS A {1}% ICI",
		"TUS PUESTOS": "TES POSTES",
		"PUEDES APRENDERLO": "TU PEUX L'APPRENDRE",
		"FAVORITA": "FAVORI",
		"Tu FAVORITA pesa: los clubes que te quieren ahí salen antes y el técnico te escucha más si se la pides.": "Ton FAVORI compte : les clubs qui te veulent la passent en premier, et le coach t'écoute plus si tu le demandes.",


		"¿APRENDER {0}?": "APPRENDRE {0} ?",
		"APRENDERLO": "L'APPRENDRE",
		"PUESTO DEVUELTO · {0}": "POSTE REMBOURSE · {0}",
		"NATURAL": "NATUREL",
		"COMODO": "A L'AISE",
		"PROBANDO": "EN APPRENTISSAGE",
		"AJENO": "ETRANGER",
		"Aprender un puesto hace que los clubes puedan ficharte para él. El oficio sale de jugarlo.": "Apprendre un poste permet aux clubs de te recruter pour lui. Le métier vient en jouant.",

		"En el partido: rematas dentro del área y te llegan más centros para cabecear.": "En match : tu frappes dans la surface et reçois plus de centres à reprendre de la tête.",
		"En el partido: más disparos desde la frontal y más balones para la volea.": "En match : plus de tirs à l'entrée de la surface et plus de ballons à reprendre de volée.",
		"En el partido: más contras por tu banda, disparos de lejos y salidas jugadas.": "En match : plus de contres dans ton couloir, de tirs de loin et de relances en jouant.",
		"En el partido: disparos de lejos y desde la frontal, voleas y salidas jugadas.": "En match : tirs de loin et à l'entrée de la surface, volées et relances en jouant.",
		"En el partido: sobre todo disparos de lejos y salidas jugadas; poca área.": "En match : surtout des tirs de loin et des relances en jouant ; peu de surface.",
		"TE QUIEREN DE {0}": "ILS TE VEULENT EN {0}",
		"PAGA MÁS": "PAIE PLUS",
		"MEJOR CLUB": "MEILLEUR CLUB",
		"MÁS MINUTOS": "PLUS DE JEU",
		"OFERTA {0} DE {1}": "OFFRE {0} SUR {1}",
		"SU ONCE MÁS FUERTE": "LEUR MEILLEUR ONZE",
		"SI TE VAS, LO MEJOR DE LA MESA": "SI TU PARS, LE MIEUX DE LA TABLE",
		"TE HAN OFRECIDO": "SUR LA TABLE",
		"DESTINOS": "DESTINATIONS",
		"TU SALIDA": "TON DEPART",
		"EN CESIÓN": "LISTE DE PRET",
		"FUERA DEL PLAN": "HORS DU PROJET",
		"NO TE VENDEN": "PAS A VENDRE",
		"TE ESCUCHAN": "ILS ECOUTENT",
		"Salvo cláusula: {0}": "Sauf clause : {0}",
		"Te llegan {0} ofertas más y tu club pide un {1}% menos": "Tu reçois {0} offres de plus et ton club demande {1}% de moins",
		"Te queda un año: no te retienen.": "Il te reste un an : ils ne te retiennent pas.",
		"TU SITIO · {0}": "TA PLACE · {0}",
		"TU SITIO ESTA LIBRE": "TA PLACE EST LIBRE",
		"CESIÓN {0} DE {1}": "PRET {0} SUR {1}",
		"SIN OPCIÓN": "SANS OPTION",
		"Jugarías de": "Tu jouerais",
		"Vuelves en": "Retour dans",
		"Opción de compra": "Option d'achat",
		"Creces": "Tu progresses",
		"Con la ventana abierta ya no se da pie: si quieren, su oferta llega a la mesa.": "Avec le mercato ouvert, on ne pousse plus : s'ils te veulent, leur offre arrive sur la table.",
		"{0} TEMP": "{0} SAIS",
		"mercadoMESA": "LA TABLE",
		"MINUTOS": "TEMPS DE JEU",
		"Nada de lo que hay encima de la mesa te mejora: ni el club, ni la ficha, ni los minutos.":
			"Rien sur la table ne te fait progresser: ni le club, ni le salaire, ni le temps de jeu.",
		"TE PEDIRÁN GOLES": "ON TE DEMANDERA DES BUTS",
		"TE PEDIRÁN ASISTENCIAS": "ON TE DEMANDERA DES PASSES DEC.",
		"Sin club: no hay plantilla que mostrar. Ficha por un equipo y aquí verás a los tuyos.":
			"Sans club : pas d'effectif à afficher. Signe dans une équipe et tu verras les tiens ici.",
		"Sales de inicio.": "Tu es titulaire.",
		"Viajas, pero no juegas.": "Tu voyages, mais tu ne joues pas.",
		"El torneo ya empezó y la lista está cerrada: tu sitio se juega en la próxima.":
			"Le tournoi a commencé et la liste est arrêtée : ta place se joue la prochaine fois.",
		"Ya das el nivel: te llaman en la próxima fecha FIFA.":
			"Tu as le niveau : on t'appelle à la prochaine date FIFA.",
		"BOTA DE LA LIGA": "MEILLEUR BUTEUR",
		"Tu premio te avala: este año no te piden nota ni nivel.":
			"Ton trophée parle pour toi : cette année, on ne te demande ni note ni niveau.",
		"MEJOR DE LA LIGA": "MEILLEUR JOUEUR",
		"PREMIO DE CAMPEONES": "PRIX COUPE ELITE",
		"CAMPEON DEL MUNDO": "CHAMPION DU MONDE",
		"CAMPEON CONTINENTAL": "CHAMPION CONTINENTAL",
		"BOTA DEL MUNDIAL": "BUTEUR DU MONDIAL",
		"JUGAR INFILTRADO": "JOUER BLESSE",
		"PIDE": "DEMANDE",
		"TIENES": "TU AS",
		"Decide si SALES. Si le caes mal, no pasas del banquillo. Lo que haces en las fechas FIFA te sube o te baja con él, y en amistosos rota.":
			"Décide si tu JOUES. S'il ne t'aime pas, tu ne quittes pas le banc. Ce que tu fais pendant les dates FIFA te fait monter ou descendre avec lui, et en amical il fait tourner.",
		"Deciden si te la PASAN: si el grupo no te quiere, te llegan dos balones. Se gana ganando juntos.":
			"Ils décident si on te la PASSE : si le groupe ne veut pas de toi, tu touches deux ballons de tout le match. Ça se gagne en gagnant ensemble.",
		"PARA ENTRAR": "POUR ETRE RETENU",
		"PARA SER TITULAR": "POUR ETRE TITULAIRE",


		"MI EQUIPO":
			"MON EQUIPE",
		"GERENCIA":
			"DIRECTION",
		"DAR UNA CHARLA AL VESTUARIO":
			"PARLER AU VESTIAIRE",
		"Reúnes al grupo tú, sin el míster delante. Si te siguen, el equipo entero se suelta; si no eres nadie ahí dentro, se nota.":
			"Tu réunis le groupe toi-même, sans le coach. S'ils te suivent, toute l'équipe se libère ; si tu n'es personne là-dedans, ça se voit.",
		"PEDIR CAMBIO DE PUESTO":
			"DEMANDER UN CHANGEMENT DE POSTE",
		"Le dices al técnico dónde quieres jugar. Cuenta lo cómodo que estés ahí y lo que se fíe de ti.":
			"Tu dis au coach où tu veux jouer. Ce qui compte, c'est ton aisance à ce poste et la confiance qu'il te porte.",
		"PEDIR LOS BALONES PARADOS":
			"DEMANDER LES COUPS DE PIED ARRETES",
		"Penales, faltas y córners para ti el resto de la temporada, aunque haya alguien con mejor pie en la plantilla.":
			"Penaltys, coups francs et corners pour toi le reste de la saison, même s'il y a un meilleur pied dans l'effectif.",
		"SUGERIR UN FICHAJE":
			"SUGGERER UNE RECRUE",
		"Señalas a un jugador de otro club. El club mira su precio y su caja, y decide.":
			"Tu désignes un joueur d'un autre club. Le tien regarde son prix et sa caisse, puis décide.",
		"AVISAR QUE TE VAS LA PROXIMA TEMPORADA":
			"ANNONCER TON DEPART LA SAISON PROCHAINE",
		"No pides permiso: avisas. Entras en la lista, bajan lo que piden por ti y llegan ofertas de verdad. La grada no lo olvida.":
			"Tu ne demandes pas la permission : tu préviens. Tu passes sur la liste, ton prix baisse et de vraies offres arrivent. Les tribunes ne l'oublient pas.",
		"NIVEL EN EL VESTUARIO":
			"NIVEAU DANS LE VESTIAIRE",
		"CONFIANZA DEL TECNICO":
			"CONFIANCE DU COACH",
		"EL VESTUARIO":
			"LE VESTIAIRE",
		"LA GRADA":
			"LES TRIBUNES",
		"ANOS EN EL CLUB":
			"ANNEES AU CLUB",
		"Sin club no hay nada que pedir. Ficha por un equipo y aquí decidirás con él.":
			"Sans club, rien à demander. Signe dans une équipe et tu décideras avec elle ici.",
		"TU PESO EN EL CLUB":
			"TON POIDS AU CLUB",
		"No se compra: sale de lo que eres en ese vestuario.":
			"Ça ne s'achète pas : ça vient de ce que tu es dans ce vestiaire.",
		"QUE LE PIDES":
			"CE QUE TU DEMANDES",
		"Esperas respuesta a: {0}.":
			"Tu attends une réponse à : {0}.",
		"Te contestan en la próxima jornada.":
			"Ils répondent à la prochaine journée.",
		"Te contestan en {0} jornadas.":
			"Ils répondent dans {0} journées.",
		"Acabas de pedir algo: la próxima jornada puedes volver.":
			"Tu viens de demander quelque chose : reviens à la prochaine journée.",
		"Acabas de pedir algo: puedes volver en {0} jornadas.":
			"Tu viens de demander quelque chose : reviens dans {0} journées.",
		"Cedido no decides tu vida aquí: el club que te tiene prestado no manda, y el tuyo ya decidió tu año.":
			"En prêt, tu ne décides rien ici : le club qui t'emprunte ne commande pas, et le tien a déjà décidé ta saison.",
		"LA RESPUESTA DEL CLUB":
			"LA REPONSE DU CLUB",
		"Te escucharon y dijeron que no. Queda dicho.":
			"Ils ont écouté et ont dit non. C'est dit.",
		"Hablaste tú y el grupo se soltó: el vestuario está contigo.":
			"Tu as parlé et le groupe s'est libéré : le vestiaire est avec toi.",
		"Dijeron que sí, pero el puesto ya no estaba libre.":
			"Ils ont dit oui, mais le poste n'était plus libre.",
		"Desde hoy juegas de {0}.":
			"Désormais tu joues {0}.",
		"Los penales, las faltas y los córners son tuyos el resto de la temporada.":
			"Les penaltys, les coups francs et les corners sont à toi le reste de la saison.",
		"Queda dicho: te vas al acabar la temporada. Estás en la lista y van a llegar ofertas.":
			"C'est dit : tu pars à la fin de la saison. Tu es sur la liste et les offres vont arriver.",
		"Dijeron que sí, pero el fichaje se cayó: ese jugador ya no estaba donde lo viste.":
			"Ils ont dit oui, mais le transfert est tombé : ce joueur n'était plus là où tu l'avais vu.",
		"{0} firma por tu club. Lo pediste tú.":
			"{0} signe dans ton club. C'est toi qui l'as demandé.",
		"Te dijeron que sí.":
			"Ils ont dit oui.",
		"Peso {0} · {1}":
			"Poids {0} · {1}",
		"Abrir la boca ya cuesta, digan lo que digan.":
			"Ouvrir la bouche coûte déjà, quoi qu'ils répondent.",
		"PEDIRLO":
			"LE DEMANDER",
		"DEJARLO":
			"LAISSER TOMBER",
		"DONDE QUIERES JUGAR":
			"OU TU VEUX JOUER",
		"Sólo sabes jugar en un sitio. Aprende otro y podrás pedirlo.":
			"Tu ne sais jouer qu'à un poste. Apprends-en un autre et tu pourras le demander.",
		"A QUIEN FICHAMOS":
			"QUI ON RECRUTE",
		"Lo más flojo del once es el {0} ({1}).":
			"Le maillon faible du onze, c'est le {0} ({1}).",
		"{0} · media {1} · {2} años · {3}":
			"{0} · moyenne {1} · {2} ans · {3}",
		"Hoy no hay nadie que mejore tu once y esté a tiro. Vuelve otra jornada.":
			"Aujourd'hui personne n'améliore ton onze et n'est à portée. Reviens une autre journée.",


		"LO ESTAN VIENDO":
			"ILS L'ETUDIENT",
		"MIENTRAS TANTO":
			"PENDANT CE TEMPS",
		"Tu peso subió a {0} desde que lo pediste.":
			"Ton poids est monté à {0} depuis ta demande.",
		"Tu peso bajó a {0} desde que lo pediste.":
			"Ton poids est descendu à {0} depuis ta demande.",
		"Tu peso sigue en {0}.":
			"Ton poids reste à {0}.",
		"Te contestan con el peso que tengas ese día, no con el de hoy: lo que hagas hasta entonces cuenta.":
			"Ils répondront avec le poids que tu auras ce jour-là, pas celui d'aujourd'hui : ce que tu fais d'ici là compte.",
		"A {0} ya se lo llevaron: cuando contesten, la petición se caerá sola.":
			"{0} est déjà parti : quand ils répondront, la demande tombera d'elle-même.",
		"{0} sigue donde lo viste.":
			"{0} est toujours là où tu l'as vu.",
		"LO QUE PUEDE PAGAR EL CLUB":
			"CE QUE LE CLUB PEUT PAYER",
		"La raya es el más caro de la lista.":
			"Le trait, c'est le plus cher de la liste.",
		"No cabe en la caja. Puedes señalarlo igual.":
			"Au-dessus des moyens du club. Tu peux le désigner quand même.",
		"EL DESPACHO":
			"LE BUREAU",
		"TE DIJERON QUE SI":
			"ILS ONT DIT OUI",
		"TE DIJERON QUE NO":
			"ILS ONT DIT NON",


		"Le quedan {0} temporadas: es un parche.":
			"Il lui reste {0} saisons : c'est un dépannage.",
		"Le quedan {0} temporadas.":
			"Il lui reste {0} saisons.",


		"LO QUE LES HAS PEDIDO":
			"CE QUE TU LEUR AS DEMANDE",
		"T{0} J{1} · {2}":
			"S{0} J{1} · {2}",
		"FICHAR A {0}":
			"RECRUTER {0}",
		"JUGAR DE {0}":
			"JOUER {0}",
		"TE SIGUIERON":
			"ILS T ONT SUIVI",
		"TE CAMBIARON DE SITIO":
			"ILS T ONT DEPLACE",
		"TE LOS DIERON":
			"ILS TE LES ONT DONNES",
		"QUEDO DICHO":
			"C'EST DIT",
		"LO FICHARON":
			"ILS L ONT RECRUTE",


		"LO QUE MAS TE FALTA":
			"CE QUI TE MANQUE LE PLUS",
		"{0}, {1} PUNTOS":
			"{0}, {1} POINTS",
		"Se mide contra tu vestuario, no en absoluto: sube tu media, o cámbiate a un club donde destaques.":
			"Ça se mesure face à ton vestiaire, pas dans l'absolu : monte ta moyenne, ou pars dans un club où tu ressors.",
		"Cada partido la mueve, arriba o abajo, según tu nota.":
			"Chaque match la fait bouger, en haut ou en bas, selon ta note.",
		"Se gana fuera del campo: la charla, los retos en casa y lo que decides con ellos.":
			"Ça se gagne hors du terrain : la causerie, les défis à la maison et ce que tu décides avec eux.",
		"Sube al cumplir tu objetivo de contrato, y con el año que haga el club.":
			"Ça monte quand tu remplis ton objectif de contrat, et selon la saison du club.",
		"Se revisa al cerrar la temporada, contra la mejor media de tus compañeros.":
			"Ça se revoit à la fin de la saison, face à la meilleure moyenne de tes coéquipiers.",
		"Se gana quedándote: cada temporada en el mismo club suma.":
			"Ça se gagne en restant : chaque saison au même club compte.",



		"NO SE PIDE, SE AVISA":
			"CA NE SE DEMANDE PAS",
		"Años en el club":
			"Années au club",
		"DE CIEN":
			"SUR CENT",
		"PRESUPUESTO PARA FICHAJES":
			"BUDGET TRANSFERTS",

		"ENTRA SIN APRETAR":
			"SANS FORCER",
		"CABE":
			"PASSE",
		"APRIETA":
			"JUSTE",
		"NO LLEGA":
			"TROP CHER",
		"FICHAJES ESPERADOS":
			"RECRUES ATTENDUES",
		"Gastado en esta ventana: {0} de {1}.":
			"Dépensé sur ce mercato : {0} sur {1}.",
		"Tiran en este orden: si firma uno, los demás pujan con lo que quede.":
			"Ils passent dans cet ordre : si l'un signe, les autres font avec ce qui reste.",
		"1 partido con ellos":
			"1 match avec eux",
		"{0} partidos con ellos":
			"{0} matchs avec eux",
		"Te faltan {0} de relación.":
			"Il te manque {0} de relation.",
		"TE ESCUCHA":
			"IL T ECOUTE",
		"LO QUE HICIERON CON TU LISTA":
			"CE QU ILS ONT FAIT DE TA LISTE",
		"Ficharon a {0}. Lo señalaste tú.":
			"Ils ont recruté {0}. C'est toi qui l'as désigné.",
		"Miraron tu lista y no ficharon a ninguno.":
			"Ils ont regardé ta liste et n'en ont recruté aucun.",
		"A QUIEN LE HAS SENALADO":
			"QUI TU AS DESIGNE",
		"Marca hasta {0} jugadores en el RANKING y el club los mirará al cerrarse el mercado.":
			"Désigne jusqu'à {0} joueurs dans le CLASSEMENT et le club les regardera à la fermeture du mercato.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y los mirarán al cerrarse el mercado.":
			"Le maillon faible de ton onze est le {0} ({1}). Désigne jusqu'à {2} dans le CLASSEMENT et ils les regarderont à la fermeture du mercato.",
		"Ventana abierta: {0} {1} por delante. En cada una el club decide, y un objetivo vivo puede caerse solo.":
			"Mercato ouvert : encore {0} {1}. Le club décide à chacune, et une cible encore possible peut tomber toute seule.",
		"Mercado cerrado. La próxima ventana dura {0} {1}: lo que marques ahora espera a que abra.":
			"Mercato fermé. Le prochain mercato dure {0} {1} : ce que tu coches maintenant attend l'ouverture.",
		"{0} de {1} esta temporada. Toca uno para quitarlo.":
			"{0} sur {1} cette saison. Touche-en un pour le retirer.",

		"RECOMENDAR AL CLUB ({0})":
			"RECOMMANDER AU CLUB ({0})",
		"QUITAR DE TU LISTA":
			"RETIRER DE TA LISTE",
		"Señalado: interés {0}%, fichaje {1}%.":
			"Signalé : intérêt {0} %, transfert {1} %.",
		"Tu once {0}": "Ton onze {0}",
		"Rival en su puesto {0}": "Rival à son poste {0}",
		"Tu once {0} · rival en su puesto {1}": "Ton onze {0} · rival à son poste {1}",
		"Brazalete +{0}": "Brassard +{0}",
		"Ojeo -{0}: no conoce tu liga": "Recrutement -{0} : ne connaît pas ta ligue",
		"Ojeo -{0}: {1} cesiones": "Recrutement -{0} : {1} prêts",
		"Ojeo -{0}: no conoce tu liga, {1} cesiones": "Recrutement -{0} : ne connaît pas ta ligue, {1} prêts",
		"Viene de más arriba: precio +{0} %": "Vient d'un club plus grand : prix +{0} %",

		"Tu pasado pesa: {0} temporadas en ligas grandes, {1} cesiones, {2} clubes": "Ton passé pèse : {0} saisons en grand championnat, {1} prêts, {2} clubs",
		"Trayectoria: precio +{0} % ({1} temporadas en ligas grandes)": "Parcours : prix +{0} % ({1} saisons en grand championnat)",
		"Trotamundos: precio −{0} % ({1} cesiones, {2} clubes)": "Nomade : prix −{0} % ({1} prêts, {2} clubs)",

		"Jugaste aquí {0} temporadas: te dejan volver por un {1} % menos": "Tu as joué ici {0} saisons : ils te laissent revenir pour {1} % de moins",
		"Te dejan volver a casa por un {0} % menos": "Ils te laissent rentrer à la maison pour {0} % de moins",

		"REGRESA A CASA": "RETOUR MAISON",
		"VUELVE A CASA": "IL REVIENT",
		"La grada no lo olvidó: {0} con esta camiseta. Desde hoy vuelve a entrenar contigo.": "Les tribunes ne l'ont pas oublié : {0} sous ce maillot. Dès aujourd'hui, il s'entraîne de nouveau avec toi.",
		"Jugó aquí {0} · traspaso -{1} %": "A joué ici {0} · transfert -{1} %",
		"Jugó aquí {0}": "A joué ici {0}",
		"VUELVE": "RETOUR",
		"INTERES": "INTERET",
		"LO PEDISTE TU":
			"TON CHOIX",
		"TUS FICHAJES":
			"TES RECRUES",
		"YA NO ESTA":
			"PARTI",
		"Tu ojo: {0} cerró el año con nota {1}":
			"Ton flair : {0} a fini l'année avec une note de {1}",
		"{0} no convenció al técnico":
			"{0} n'a pas convaincu l'entraîneur",
		"MARCAR EN EL RANKING ({0})":
			"CHOISIR DANS LE CLASSEMENT ({0})",
		"Ya has gastado tus recomendaciones de esta temporada. El año que viene vuelves a tener cinco.":
			"Tu as épuisé tes recommandations de la saison. L'an prochain tu en auras cinq de nouveau.",
		"Ya gastaste tus {0} recomendaciones de esta temporada.":
			"Tu as déjà utilisé tes {0} recommandations de la saison.",
		"{0} de {1}. Toca uno para quitarlo.":
			"{0} sur {1}. Touche-en un pour le retirer.",
		"Ya has señalado {0}. Quita a alguno primero.":
			"Tu en as déjà désigné {0}. Retires-en un d'abord.",
		"Le dices al técnico dónde quieres jugar.":
			"Tu dis au coach où tu veux jouer.",
		"Penales, faltas y córners para ti el resto de la temporada.":
			"Penaltys, coups francs et corners pour toi le reste de la saison.",
		"No pides permiso: avisas. Entras en la lista y llegan ofertas de verdad.":
			"Tu ne demandes pas la permission : tu préviens. Tu passes sur la liste et de vraies offres arrivent.",



		"QUE LO FICHEN":
			"QU ILS LE RECRUTENT",
		"LO QUE PASO CON TUS OBJETIVOS":
			"CE QUI EST ARRIVE A TES CIBLES",
		"FALLIDO":
			"ECHOUE",
		"Marca hasta {0} jugadores en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"Désigne jusqu'à {0} joueurs dans le CLASSEMENT et le club tranchera à chaque journée du mercato.",
		"Lo más flojo de tu once es el {0} ({1}). Marca hasta {2} en el RANKING y el club irá decidiendo cada jornada de mercado.":
			"Le maillon faible de ton onze est le {0} ({1}). Désigne jusqu'à {2} dans le CLASSEMENT et le club tranchera à chaque journée du mercato.",
		"Ya lo intentaste esta temporada y se cayó. Podrás volver a señalarlo el año que viene.":
			"Tu as déjà essayé cette saison et ça a échoué. Tu pourras le redésigner l'an prochain.",
		"FICHARON A {0}":
			"ILS ONT RECRUTE {0}",
		"SE CAYO {0}":
			"{0} A ECHOUE",
		"TU ONCE {0}": "TON ONZE {0}",
		"No te mira: tu once está en {0} y él en {1}.":
			"Il ne te regarde même pas : ton onze est à {0} et lui à {1}.",
		"ALTAS Y BAJAS": "ARRIVEES ET DEPARTS",
		"ALTA": "ARRIVEE",
		"BAJA": "DEPART",
		"SE CAYO SOLO": "CA A CAPOTE",
		"CERRO EL MERCADO": "MERCATO FERME",
		"YA NO JUGABA AHI": "IL ETAIT PARTI",
		"SE RETIRABA": "IL PRENAIT SA RETRAITE",
		"TE FUISTE DEL CLUB": "TU AS QUITTE LE CLUB",
		"Ya no le quedan jornadas: se cae al cerrar.":
			"Plus aucune journée devant lui : il tombe à la fermeture.",
		"Está acabando su carrera: el club no ficha a quien se retira.":
			"Il est en fin de carrière : le club ne recrute pas un joueur qui prend sa retraite.",
		"Ya no juega ahí.": "Il ne joue plus là-bas.",
		"NO CABIA NADIE": "PLUS DE PLACE",
		"Tu plantilla está llena y no hay a quien soltar: aunque el club diga que sí, no cabrá.":
			"Ton effectif est complet et personne ne peut partir : même si le club dit oui, il n'y aura pas de place.",
		"El club está en apuro: solo entran los LIBRES.":
			"Le club est dans le rouge : seuls les joueurs LIBRES peuvent arriver.",
		"SE LO LLEVO {0}": "{0} L'A PRIS",
		"Llegaron porque tú los señalaste":
			"Ils sont venus parce que tu les as désignés",
		"Fichajes que le pediste al club y el club hizo.":
			"Des recrues que tu as demandées au club, et que le club a faites.",
		"Un fichaje que le pediste al club y el club hizo.":
			"Une recrue que tu as demandée au club, et que le club a faite.",
		"CLAUSULAZO":
			"CLAUSE LIBERATOIRE",
		"Mis outfits":
			"Mes tenues",
		"Nombre del outfit":
			"Nom de la tenue",
		"Escribe un nombre para guardar tu outfit.":
			"Ecris un nom pour enregistrer ta tenue.",
		"Outfit guardado.":
			"Tenue enregistrée.",
		"Outfit aplicado.":
			"Tenue appliquée.",
		"Outfit actualizado con tu ropa actual.":
			"Tenue mise à jour avec ce que tu portes.",
		"Outfit eliminado.":
			"Tenue supprimée.",
		"Guarda tu combinación actual y úsala con un toque.":
			"Enregistre ta tenue actuelle et remets-la d'un toucher.",
		"Guardar outfit":
			"Enregistrer",
		"Playera gráfica":
			"T-shirt imprimé",
		"Jersey retro":
			"Maillot rétro",
		"Polo tejido":
			"Polo en maille",
		"Camisa de lino":
			"Chemise en lin",
		"Cierre corto":
			"Col zippé",
		"Polo rugby":
			"Polo rugby",
		"Sobrecamisa":
			"Surchemise",
		"Parka":
			"Parka",
		"Pants deportivos":
			"Pantalon sport",
		"Pantalón de pinzas":
			"Pantalon à pinces",
		"Jeans barril":
			"Jean ballon",
		"Cargo técnico":
			"Cargo technique",
		"Tenis retro":
			"Baskets rétro",
		"Tenis deportivos":
			"Baskets de sport",
		"Zapatos de charol":
			"Souliers vernis",
		"Tenis gruesos":
			"Baskets épaisses",
		"Cinturón de cuero":
			"Ceinture en cuir",
		"Hebilla metálica":
			"Boucle en métal",
		"Pañuelo recto":
			"Pochette droite",
		"Pañuelo de pico":
			"Pochette pointe",
		"Casual elegante":
			"Chic décontracté",
		"Corbata de moño":
			"Noeud papillon",
		"Corbata, moño o bufanda":
			"Cravate, noeud, écharpe",
		"Ya no juega ahí. Quítalo y señala a otro.":
			"Il ne joue plus là-bas. Retire-le et désigne quelqu'un d'autre.",
		"Está acabando su carrera. Quítalo y señala a otro.":
			"Il termine sa carrière. Retire-le et désigne quelqu'un d'autre.",
		"Hoy no hay presupuesto. Si el club vende, vuelve a haberlo.":
			"Pas de budget aujourd'hui. Si le club vend, il y en aura de nouveau.",


		"REFUERZO":
			"RENFORT",
		"TE HICIERON CASO":
			"ILS T'ONT ECOUTE",
		"Lo señalaste tú y el club puso el dinero. Desde hoy entrena contigo.":
			"C'est toi qui l'as désigné et le club a mis l'argent. Dès aujourd'hui il s'entraîne avec toi.",
		"Te Hicieron Caso":
			"Ils T'ont Écouté",
		"El club fichó a alguien que TÚ le señalaste.":
			"Le club a recruté quelqu'un que TU as désigné.",
		"Que el club fiche a alguien que TÚ le hayas señalado.": "Que le club recrute quelqu'un que TU as désigné.",


		"FICHAJES DE VERANO": "RECRUES ESTIVALES",
		"Y {0} MÁS": "ET {0} DE PLUS",

		"NUEVA YORK":
			"NEW YORK",
		"TU CARA EN NUEVA YORK":
			"TON VISAGE A NEW YORK",
		"La marca compró la plaza entera. Todas las pantallas a la vez, y en todas tú.":
			"La marque a acheté toute la place. Tous les écrans en même temps, et toi sur chacun.",
		"ÚLTIMA HORA":
			"DERNIERE MINUTE",
		"{0} FIRMA CON {1}":
			"{0} SIGNE AVEC {1}",
		"ALINEACIÓN":
			"COMPO",
		"PITADA":
			"HUEES",
		"TU GRADA TE PITA":
			"SIFFLE CHEZ TOI",
		"Te silbaron al oír tu nombre. El partido de hoy es la respuesta.":
			"Ils ont sifflé en entendant ton nom. Le match d'aujourd'hui est ta réponse.",
		"tardes malas":
			"matchs ratés",
		"{0} veces con esta camiseta. El club te lo agradece antes del saque.":
			"{0} fois avec ce maillot. Le club te remercie avant le coup d'envoi.",
		"asistencias":
			"passes déc.",
		"OJEADOR":
			"SCOUT",
		"Llegó una hora antes y sólo miró a uno. Su oferta llega en la próxima ventana.":
			"Il est venu une heure avant et n'a regardé qu'un joueur. Son offre arrive au prochain mercato.",
		"A SEGUIR":
			"A SUIVRE",
		"MURAL":
			"FRESQUE",
		"TU CARA EN EL BARRIO":
			"TA TETE DANS TA RUE",
		"Nadie te pidió permiso para pintarte. Mejor así.":
			"Personne ne t'a demandé la permission de te peindre. C'est mieux ainsi.",
		"ANUNCIO":
			"PUB",
		"TU CARA EN LA CIUDAD":
			"TA TETE EN VILLE",
		"FIJO POR PARTIDO":
			"FIXE PAR MATCH",
		"Pasas por debajo y te ves en grande. Los que pasan, también.":
			"Tu passes dessous et tu te vois en grand. Les passants aussi.",
		"LLEGADA":
			"ARRIVEE",
		"LA COPA VUELVE A CASA":
			"LA COUPE RENTRE",
		"Viajó en su propio asiento, con el cinturón puesto. Nadie la soltó en todo el vuelo.":
			"Elle a voyagé sur son propre siège, ceinture bouclée. Personne ne l'a lâchée du vol.",

		"TOMA {0}": "PRISE {0}",
		"TOMA 7": "PRISE 7",
		"REC": "REC",
		"La séptima fue la buena. El cámara estaba con el celular.":
			"La septième était la bonne. Le cadreur était sur son portable.",

		"LA PANCARTA CON FALTA":
			"LA BANDEROLE AVEC UNE FAUTE",
		"LA PANCARTA":
			"LA BANDEROLE",
		"CASI":
			"PRESQUE",
		"ARREGLADA":
			"CORRIGEE",
		"la tela":
			"la banderole",
		"tu apellido":
			"ton nom",
		"Una letra mal. La van a colgar igual todos los domingos.":
			"Une lettre de travers. Ils l'accrocheront quand même tous les dimanches.",
		"Tardaron años, pero la arreglaron. Con cinta.":
			"Ça leur a pris des années, mais ils l'ont corrigée. Au scotch.",

		"LAS PALOMAS NO OLVIDAN":
			"LES PIGEONS N'OUBLIENT PAS",
		"Una paloma del larguero no volvió a casa. Las demás se acuerdan.":
			"Un pigeon de la barre n'est jamais rentré. Les autres s'en souviennent.",
		"Otra vez tú. Ellas llevan la cuenta.":
			"Encore toi. Ils tiennent les comptes.",
		"SANCION": "PUNI",
		"FAIR PLAY": "FAIR PLAY",
		"{0} arranca la liga con -{1} puntos por el fair play": "{0} commence le championnat avec -{1} points pour le fair-play",
		"{0} incumple el fair play: si repite, perderá {1} puntos": "{0} enfreint le fair-play : en cas de récidive, il perdra {1} points",
		"CUENTAS DEL CLUB": "COMPTES CLUB",
		"SANAS": "SAINS",
		"EN APURO": "TENDU",
		"-{0} PTS": "-{0} PTS",
		"AVISO {0}/{1}": "AVIS {0}/{1}",
		"INGRESOS / AÑO": "REVENUS / AN",
		"NOMINA / AÑO": "PAIES / AN",
		"RAYA ROJA": "SEUIL",
		"Cerrar la temporada con la caja bajo la raya roja es un aviso. Dos seguidas: la liga siguiente empieza con -{0} puntos.": "Finir la saison avec la caisse sous le seuil est un avertissement. Deux fois de suite : la ligue suivante démarre avec -{0} points.",
		"-{0} por fair play": "-{0} fair-play",
		"SANCION DE FAIR PLAY": "SANCTION FAIR PLAY",
		"-{0} PTS EN LA LIGA": "-{0} PTS EN LIGUE",
		"AVISO DE FAIR PLAY": "ALERTE FAIR PLAY",
		"SI REPITE: -{0} PTS": "RECIDIVE: -{0} PTS",
		"EL CLUB CAMBIA DE DUEÑO": "LE CLUB CHANGE DE MAIN",
		"DINERO DE FUERA": "ARGENT FRAIS",
		"LOS INGRESOS SE DISPARAN": "LES REVENUS EXPLOSENT",
		"TEMPORADAS DE PROYECTO": "SAISONS DE PROJET",
		"ingreso de antes": "revenu avant",
		"ingreso ahora": "revenu actuel",
		"la caja": "la caisse",
		"Compra el club y trae dinero de fuera: habrá más presupuesto en GERENCIA, y el club va a fichar, también en tu puesto.": "Il rachète le club et amène de l'argent frais : plus de budget en DIRECTION, et le club va recruter, même à ton poste.",
		"EL CLUB ENTRA EN CRISIS": "LE CLUB EN CRISE",
		"LA CAJA EN ROJO": "CAISSE A SEC",
		"PUNTOS EN JUEGO": "POINTS EN JEU",
		"la raya roja": "le seuil",
		"ingreso": "revenu",
		"DUEÑO NUEVO": "NOUVEAU PDG",
		"EN CRISIS": "EN CRISE",
		"TOCA VENDER": "DOIT VENDRE",
		"Te sientan en el vestuario con el director deportivo. {0} está en crisis: si la caja sigue bajo la raya roja al cierre, la liga le quita {1} puntos. Eres lo que más vale del vestuario, y tu traspaso es el dinero que falta.": "On te fait asseoir au vestiaire avec le directeur sportif. {0} est en crise : si la caisse reste sous le seuil à la clôture, la ligue lui retire {1} points. Tu es ce qui vaut le plus dans le vestiaire, et ton transfert est l'argent qui manque.",
		"EL CLUB NO PAGA": "CLUB SANS PAIE",
		"Te sientan en el vestuario con el director deportivo. {0} no tiene con qué pagarte: llevas {1} partidos sin cobrar y te deben ${2}. Si aguantas, cobras cuando llegue el dinero. Si pides la carta, en verano eres libre.": "On te convoque au vestiaire avec le directeur sportif. {0} n'a pas de quoi te payer : ça fait {1} matchs sans salaire et on te doit ${2}. Si tu tiens, tu es payé quand l'argent arrive. Si tu demandes ta lettre de libération, tu es libre cet été.",
		"AGUANTO": "RESTER",
		"PIDO LA CARTA": "JE PARS",
		"IMPAGO DEL CLUB": "IMPAYE CLUB",
		"Lo que te debía el club": "Ce que le club te devait",
		"El dueño nuevo te paga lo que te debía el club: ${0}": "Le nouveau propriétaire te paie ce que le club te devait : ${0}",
		"El club te paga la mitad de lo que te debía: ${0} de ${1}": "Le club te paie la moitié de ce qu'il te devait : ${0} sur ${1}",
		"EL CLUB TE DEBE": "CLUB TE DOIT",
		"TE DEBE": "DU",
		"caja": "trésorerie",
		"MULTA POR LA ROJA": "AMENDE ROUGE",
		"MULTA DEL COMITÉ": "AMENDE COMITE",
		"multa {0}": "amende {0}",
		"Esta temporada pagaste ${0} en multas": "Cette saison, tu as payé ${0} d'amendes",
		"ELECCIONES EN EL CLUB": "ELECTIONS AU CLUB",
		"Hay elecciones en {0}. El candidato promete sanear la caja vendiéndote este verano y quiere saber de qué lado estás. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "Il y a des élections à {0}. Le candidat promet d'assainir les comptes en te vendant cet été et veut savoir de quel côté tu es. Ta photo fait bouger des voix ; les supporters n'oublient pas qui soutient le perdant.",
		"Hay elecciones en {0}. El candidato promete dinero para fichar y quiere tu foto en su campaña. Tu foto mueve votos; la grada se acuerda de quien elige al que pierde.": "Il y a des élections à {0}. Le candidat promet de l'argent pour recruter et veut ta photo dans sa campagne. Ta photo fait bouger des voix ; les supporters n'oublient pas qui soutient le perdant.",
		"CON EL PRESIDENTE": "AVEC LE PRESIDENT",
		"CON EL CANDIDATO": "AVEC LE CANDIDAT",
		"AL MARGEN": "NEUTRE",
		"El presidente gana las elecciones y sigue": "Le président remporte les élections et reste",
		"Gana el candidato: el presidente nuevo quiere venderte este verano": "Le candidat gagne : le nouveau président veut te vendre cet été",
		"Gana el candidato: el presidente nuevo mete ${0} en la caja para fichar": "Le candidat gagne : le nouveau président injecte ${0} dans les caisses pour recruter",
		"PRESIDENTE": "PRESIDENT",
		"CANDIDATO": "CANDIDAT",
		"GANA EL CANDIDATO": "LE CANDIDAT GAGNE",
		"SIGUE EL PRESIDENTE": "LE PRESIDENT RESTE",
		"LA GRADA TE APLAUDE": "LA FOULE T'ACCLAME",
		"LA GRADA TE PITA": "ON TE SIFFLE",
		"EL JEQUE SE VA": "CHEIKH PART",
		"El jeque deja el {0} y su nómina se queda: crisis": "Le cheikh quitte {0} mais sa masse salariale reste : crise",
		"El jeque se ha ido y su dinero con él, pero la nómina que firmó se queda. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "Le cheikh est parti avec son argent, mais la masse salariale qu'il a signée reste. Cet été le club doit vendre, et si la caisse reste sous le seuil à la clôture, la ligue lui retire {0} points.",
		"LA SALA DE JUNTAS": "LE CONSEIL",
		"Sin rodeos: no hay dinero. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.": "Sans détour : il n'y a plus d'argent. Cet été le club doit vendre, et si la caisse reste sous le seuil à la clôture, la ligue lui retire {0} points.",
		"SIN EUROPA": "PAS EUROPE",
		"TEMPORADA SIN EUROPA": "SAISON SANS EUROPE",
		"la plaza perdida": "place perdue",
		"puntos de sanción": "points de sanction",
		"CONTROL FINANCIERO": "CONTROLE FINANCIER",
		"NO SE VENDE": "INVENDABLE",
		"EL ESTADIO SE VENDE": "STADE VENDU",
		"cobra el club": "le club touche",
		"La crisis aprieta y el club vende el nombre del campo. La grada no lo perdona: este año entra menos gente y en el muro cuelga una pancarta.": "La crise se fait sentir et le club vend le nom du stade. Les tribunes ne pardonnent pas : moins de monde cette année et une banderole pend au mur.",
		"El {0} vende el nombre de su estadio: ahora es el {1}": "{0} vend le nom de son stade : il devient le {1}",
		"VENDE EL ESTADIO": "VEND SON STADE",
		"Sin rodeos: no hay dinero. Para tapar el agujero, el club vende el nombre del estadio, y aun así este verano tiene que vender.": "Sans détour : il n'y a plus d'argent. Pour boucher le trou, le club vend le nom du stade, et il doit quand même vendre des joueurs cet été.",
		"CONCURSO": "FAILLITE",
		"El {0} entra en concurso de acreedores: este verano no ficha": "{0} entre en procédure collective : pas de recrues cet été",
		"EL CONCURSO DE ACREEDORES": "LA FAILLITE",
		"CONCURSO DE ACREEDORES": "MISE EN FAILLITE",
		"EN CONCURSO": "EN FAILLITE",
		"LO LLEVA UN ADMINISTRADOR": "SOUS ADMINISTRATEUR",
		"FICHAJES ESTE VERANO": "RECRUES CET ETE",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Lo que se pueda vender, se vende.": "Le club ne peut pas payer ses dettes et un juge place un administrateur aux commandes. Jusqu'au mercato d'hiver, personne n'est recruté et aucun contrat n'est touché, pas même le tien. Ce qui peut être vendu, est vendu.",
		"CONTRATOS CONGELADOS": "CONTRATS GELES",
		"Tu club está en concurso: hasta el mercado de invierno no se toca un contrato.": "Ton club est en faillite : aucun contrat n'est touché avant le mercato d'hiver.",
		"Tu club está en concurso: hasta el mercado de invierno no ficha a nadie.": "Ton club est en faillite : il ne recrute personne avant le mercato d'hiver.",
		"EL ADMINISTRADOR TE VENDE": "ON TE VEND",
		"El juez puso a un administrador al frente de {0} y te recibe en el despacho del presidente, con las cuentas sobre la mesa. En la lista de lo que se vende, tu nombre va el primero: o sales este verano, o te quedas cobrando menos.": "Le juge a placé un administrateur à la tête de {0} et il te reçoit dans le bureau du président, les comptes sur la table. Sur la liste de ce qui est à vendre, ton nom arrive en premier : soit tu pars cet été, soit tu restes en gagnant moins.",
		"Tu club está en concurso y vas el primero de la lista. O sales este verano, o te quedas cobrando menos.": "Ton club est en redressement judiciaire et tu es le premier de la liste. Soit tu pars cet été, soit tu restes en gagnant moins.",
		"Cobras menos lo que reste de contrato y el administrador te saca de la lista. El vestuario y la grada lo ven.": "Tu gagnes moins jusqu'à la fin de ton contrat et l'administrateur te retire de la liste. Le vestiaire et les tribunes le voient.",
		"LA REBAJA DEL VESTUARIO": "BAISSE DU VESTIAIRE",
		"El presidente baja al vestuario: {0} está en crisis y no llega a fin de mes. Pide a la plantilla un {1}% menos de ficha esta temporada, y quien firme cobra a tiempo. El capitán ya ha firmado; faltas tú.": "Le président descend au vestiaire : {0} est en crise et n'arrive pas à boucler le mois. Il demande à l'effectif {1}% de salaire en moins cette saison, et celui qui signe est payé à temps. Le capitaine a déjà signé ; il ne manque que toi.",
		"FIRMO: {0}/sem": "SIGNE: {0}/sem",
		"NO FIRMO": "REFUSER",
		"LA ASAMBLEA DE SOCIOS": "L'ASSEMBLEE GENERALE",
		"El juez cerró el concurso y {0} es de sus socios: la asamblea votó la compra a mano alzada, un {1}% a favor. No hay dueño que ponga dinero, así que piden a la plantilla que entre con una acción. La grada mira a sus jugadores.": "Le juge a clos la procédure et {0} appartient désormais à ses membres : l'assemblée a voté l'achat à main levée, {1} % pour. Il n'y a aucun propriétaire pour investir, alors on demande à l'effectif de prendre une action. Les tribunes regardent leurs joueurs.",
		"COMPRO ACCIONES": "J'ACHETE",
		"SÓLO VOTO": "JE VOTE",
		"SOCIOS": "SOCIOS",
		"Los socios compran el {0}: un {1}% vota sí en la asamblea": "Les membres rachètent {0} : {1} % votent oui en assemblée",
		"DE LOS SOCIOS": "AUX SOCIOS",
		"Los socios te pagan lo que te debía el club: ${0}": "Les membres te paient ce que le club te devait : ${0}",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tienes acciones: tu voto arrastra a la grada.": "Trois saisons plus tard, un investisseur veut racheter {0} et l'assemblée vote en fin de saison. Les sondages donnent {1}% pour la vente. Tu as des actions : ton vote entraîne les tribunes.",
		"Tres temporadas después, un inversor quiere comprar {0} y la asamblea lo vota al cierre. Los sondeos dan un {1}% a favor de vender. Tu voto es uno más, pero la grada escucha a sus jugadores.": "Trois saisons plus tard, un investisseur veut racheter {0} et l'assemblée vote en fin de saison. Les sondages donnent {1}% pour la vente. Ton vote n'est qu'un parmi d'autres, mais les tribunes écoutent leurs joueurs.",
		"LA ASAMBLEA VOTA LA VENTA": "L'ASSEMBLEE VOTE LA VENTE",
		"VOTO VENDER": "JE VENDS",
		"VOTO SEGUIR": "JE GARDE",
		"Los socios venden el {0} a un inversor: un {1}% vota sí": "Les sociétaires vendent {0} à un investisseur : {1}% votent oui",
		"Los socios del {0} no venden: un {1}% vota seguir": "Les sociétaires de {0} ne vendent pas : {1}% votent pour rester",
		"ASAMBLEA DE SOCIOS": "ASSEMBLEE GENERALE",
		"EL DUEÑO QUIERE TUS ACCIONES": "LE PATRON VEUT TES ACTIONS",
		"No regatea: el dinero no es su problema.": "Il ne marchande pas : l'argent n'est pas son problème.",
		"Sabe lo que vale cada parte y lo paga.": "Il sait ce que vaut chaque part et il la paie.",
		"Su fondo regatea cada céntimo.": "Son fonds marchande chaque centime.",
		"VENDO": "VENDS",
		"NO VENDO": "JE GARDE",
		"EN EL DESPACHO": "AU BUREAU",
		"tus acciones": "tes actions",
		"{0} tiene dueño nuevo y lo quiere entero: te ofrece ${1} por la parte que compraste en la asamblea, que te costó ${2}.": "{0} a un nouveau propriétaire qui veut tout : il t'offre ${1} pour la part achetée à l'assemblée, qui t'avait coûté ${2}.",
		"HUELGA EN EL VESTUARIO": "GREVE AU VESTIAIRE",
		"{0} lleva {1} partidos sin pagar a nadie y a ti te debe ${2}. El capitán os reúne antes de entrenar: nadie sale al campo hasta que el club pague. Si os plantáis todos, la directiva rasca la caja y paga ${3}. Si tú entrenas, la huelga se rompe.": "{0} n'a payé personne depuis {1} matchs et vous doit ${2}. Le capitaine réunit le groupe avant l'entraînement : personne n'entre sur le terrain tant que le club ne paie pas. Si vous tenez tous bon, la direction gratte les caisses et verse ${3}. Si tu t'entraînes, la grève est brisée.",
		"ME SUMO": "JE SUIS",
		"SALGO A ENTRENAR": "JE M'ENTRAINE",
		"El {0} entra en concurso y le embargan el estadio: jugará en el campo del {1}": "{0} entre en redressement et se fait saisir son stade : il jouera sur le terrain de {1}",
		"El club no puede pagar lo que debe y un juez pone a un administrador al mando. Hasta el mercado de invierno no se ficha a nadie ni se toca un contrato, tampoco el tuyo. Y el estadio queda embargado: esta temporada jugáis de local en {0}, el campo del {1}.": "Le club ne peut pas payer ses dettes et un juge place un administrateur aux commandes. Jusqu'au mercato d'hiver, personne n'est recruté et aucun contrat n'est touché, pas même le tien. Le stade est saisi : cette saison, vous jouez à domicile à {0}, le terrain de {1}.",
		"El {0} sale del concurso: pacta con sus acreedores y vuelve a fichar": "{0} sort de la procédure collective : accord avec ses créanciers, retour sur le marché",
		"TE PEDIRÁN GOL Y PASE": "BUTS ET PASSES DEC.",
		"En el partido: juegas arriba y pegado a tu banda, con más ángulo, contras y balones servidos.": "En match : tu joues haut et collé à ton aile, avec plus d'angles fermés, de contres et de ballons servis.",
		"EL RESBALÓN": "LA GLISSADE",
		"ESTAMBUL": "ISTANBUL",
		"LA REMONTADA": "LA REMONTADA",
		"EL 92:48": "LE 92:48",
		"EL CÓRNER RÁPIDO": "LE CORNER RAPIDE",
		"LA FINAL EN SU CASA": "LA FINALE CHEZ EUX",
		"LA NOCHE DE LONDRES": "LA NUIT DE LONDRES",
		"EL PORTERO CABECEA": "LA TETE DU GARDIEN",
		"LA FINAL EN MADRID": "LA FINALE A MADRID",
		"SE RESBALÓ": "IL GLISSE",
		"IBAN 3-0": "MENE 3-0",
		"NADIE MIRABA": "NUL REGARD",
		"NI UN PENAL": "AUCUN PENO",
		"FUE EL PORTERO": "LE GARDIEN",
		"Juega con uno de los dos clubes contra el otro.": "Joue avec l'un des deux clubs contre l'autre.",
		"Falta una jornada para el derbi.": "Le derby, c'est la prochaine journée.",
		"Faltan {0} jornadas para el derbi.": "Le derby est dans {0} journées.",
		"Falta una jornada para la fecha de selecciones.": "Prochaine journée, puis la trêve internationale.",
		"Faltan {0} jornadas para la fecha de selecciones.": "{0} journées avant la trêve internationale.",
		"Te juegas el ascenso": "L'accession se joue",
		"Te juegas la salvación": "Le maintien se joue",
		"Te juegas el título": "Le titre se joue",
		"Te espera el derbi": "Le derby t'attend",
		"Derbi ante {0}": "Derby contre {0}",
		"Te la ponen al pecho: la paras y le pegas de volea antes de que bote.": "On te la met sur la poitrine : tu contrôles et tu reprends de volée avant le rebond.",
		"Stick izquierdo para correr; pulsa {0} para barrerte": "Stick gauche pour courir ; appuie sur {0} pour tacler",
		"Ponte entre el balón y tu portería para robar, o pulsa {0} para barrerte. Al recuperar, sigue con WASD y ataca.": "Place-toi entre le ballon et ton but pour le récupérer, ou appuie sur {0} pour tacler. Continue avec WASD pour attaquer.",
		"WASD para correr; pulsa {0} para barrerte": "WASD pour courir ; appuie sur {0} pour tacler",
		"TU TITULAR LLEGÓ A SU VESTUARIO": "TA PHRASE ARRIVE AU VESTIAIRE",
		"TRES GOLES Y EL MICRO": "TRIPLE ET MICRO",
		"Hat-trick y el balón bajo el brazo. La cadena te para con él todavía en la mano y quiere oírtelo decir en directo.": "Triplé et le ballon sous le bras. La chaîne t'arrête avec encore dans la main et veut te l'entendre dire en direct.",
		"EL GOL DEL FINAL": "LE BUT DE LA FIN",
		"Tu gol en el último suspiro decidió el partido. La cadena te para con el estadio aún temblando y quiere la frase de la noche.": "Ton but au dernier souffle a décidé du match. La chaîne t'arrête alors que le stade tremble encore et veut la phrase de la soirée.",
		"EL PENAL FALLADO": "LE PENALTY RATE",
		"Fallaste un penal y la sala de prensa sólo quiere hablar de eso. Hay cámaras, hay micro y una pregunta esperándote.": "Tu as raté un penalty et la salle de presse ne veut parler que de ça. Il y a des caméras, un micro et une question qui t'attend.",
		"ASUMIRLO": "ASSUMER",
		"EL PRÓXIMO LO METO": "LE PROCHAIN ENTRE",
		"PENAL FALLADO": "PENALTY RATE",
		"Un penal fallado pesa más que tres metidos. Lo que digas ahora es lo que se lee mañana.": "Un penalty raté pèse plus que trois marqués. Ce que tu dis maintenant, c'est ce qu'on lira demain.",
		"RUEDA DE PRENSA": "CONF. DE PRESSE",
		"· te buscarán": "· ils viendront te chercher",
		"Colgaste las botas y volviste. Esa puerta sólo se abre una vez: la próxima despedida es la última.": "Tu as raccroché les crampons et tu es revenu. Cette porte ne s'ouvre qu'une fois : ton prochain adieu sera le dernier.",
		"Se viene contigo.": "Elle vient avec toi.",
		"No se viene. Os toca la distancia.": "Elle ne vient pas. Ce sera la distance.",
		"¿SE VIENE CONTIGO?": "ELLE VIENT ?",
		"El contrato nuevo está encima de la mesa de la cocina, y es en otro país. {0} lo ha leído dos veces sin decir nada. Su vida está aquí.": "Le nouveau contrat est sur la table de la cuisine, et c'est dans un autre pays. {0} l'a lu deux fois sans dire un mot. Sa vie est ici.",
		"PEDIRLE QUE VENGA": "LUI DEMANDER",
		"QUE SE QUEDE": "RESTE ICI",
		"LA CLÍNICA": "CLINIQUE",
		"{0} se ha enterado por la tele antes que por ti. Está en la puerta de la clínica con una bolsa de ropa tuya y cara de no pensar irse.": "{0} l'a appris à la télé avant de l'apprendre de toi. Elle est à la porte de la clinique avec un sac de tes vêtements et un air de ne pas vouloir partir.",
		"DEJAR QUE TE CUIDE": "DEJA-LA FAIRE",
		"PEDIRLE ESPACIO": "DE L'ESPACE",
		"Ser el máximo goleador de las ligas de Europa.": "Finir meilleur buteur des championnats d'Europe.",
		"El pase del Mundial": "La passe du Mondial",
		"Ser el máximo asistente del Mundial con tu selección.": "Finir meilleur passeur du Mondial avec ta sélection.",
		"Centenario Internacional": "Centenaire International",
		"Jugar 100 partidos con tu selección.": "Jouer 100 matchs avec ta sélection.",
		"FOTO OFICIAL": "PHOTO OFFICIELLE",
		"LA FOTO OFICIAL": "LA PHOTO OFFICIELLE",
		"La plantilla de este año ya tiene su foto. Colgará en la sede toda la temporada.": "L'effectif de cette année a sa photo. Elle restera accrochée au siège toute la saison.",
		"FIRMA EL CONTRATO": "SIGNE LE CONTRAT",
		"Tu firma queda guardada: será la de tus autógrafos.": "Ta signature est enregistrée : ce sera celle de tes autographes.",
		"RENOVACIÓN DE CONTRATO": "RENOUVELLEMENT",
		"CONTRATO DE JUGADOR": "CONTRAT JOUEUR",
		"FIRMA DEL JUGADOR": "SIGNATURE JOUEUR",
		"TU CAMISETA A LA GRADA": "MAILLOT AUX GRADINS",
		"Arrastra hacia atrás y suelta": "Tire en arrière et lâche",
		"Más fuerte": "Plus fort",
		"El niño del cartel se lleva tu camiseta.": "Le gamin de la pancarte repart avec ton maillot.",
		"Iba para el niño, pero se la quedó el de al lado.": "Elle était pour le gamin, mais son voisin l'a gardée.",
		"La atrapó el de al lado del niño.": "Celui à côté du gamin l'a attrapée.",
		"La atrapó uno del muro.": "Quelqu'un du mur l'a attrapée.",
		"Se la llevó la grada de arriba.": "Le haut des gradins l'a prise.",
		"Se quedó corta.": "Trop courte.",
		"LA PIZARRA DEL MÍSTER": "LE TABLEAU DU COACH",
		"Dibuja tu jugada": "Dessine ton action",
		"LE GUSTÓ": "APPROUVE",
		"A SU MANERA": "A SA SAUCE",
		"El míster deja tu jugada en la pizarra.": "Le coach garde ton schéma au tableau.",
		"El míster borra tus flechas y dibuja las suyas.": "Le coach efface tes flèches et dessine les siennes.",
		"PASEO DE LEYENDAS": "ALLEE DES STARS",
		"TU HUELLA": "TA TRACE",
		"DEJA TU HUELLA": "MARQUE TA MAIN",
		"Mantén el dedo en el cemento": "Garde le doigt sur le ciment",
		"Mantén {0} en el cemento": "Maintiens {0} sur le ciment",
		"Bien honda: ahí se queda para siempre.": "Bien profonde : elle reste là pour toujours.",
		"La plaza ya tiene tu mano.": "La place a ta main, désormais.",
		"Apenas se marca: el cemento ya estaba duro.": "À peine marquée : le ciment avait déjà durci.",
		"¡JUNTITOS, TODOS MIRANDO A LA CÁMARA!": "SERREZ-VOUS, TOUT LE MONDE REGARDE L'OBJECTIF !",
		"¡A LA CUENTA DE TRES!": "A TROIS !",
		"Primera ronda": "1er tour",
		"Segunda ronda": "2e tour",
		"Tercera ronda": "3e tour",
		"Cuarta ronda": "4e tour",
		"Quinta ronda": "5e tour",
		"Sexta ronda": "6e tour",
		"Séptima ronda": "7e tour",
		"Octava ronda": "8e tour",
		"Treintaidosavos": "Trente-deuxièmes",
		"32avos": "32es",
		"1.ª ronda": "1er tour",
		"2.ª ronda": "2e tour",
		"3.ª ronda": "3e tour",
		"4.ª ronda": "4e tour",
		"5.ª ronda": "5e tour",
		"6.ª ronda": "6e tour",
		"7.ª ronda": "7e tour",
		"8.ª ronda": "8e tour",
		"¡FESTEJO DESBLOQUEADO!": "CELEBRATION DEBLOQUEE !",
		"LA OCARINA": "L'OCARINA",
		"Te pones el gorro verde, te salen orejas de duende y tocas la ocarina. Lo estrenas en tu próximo gol.": "Tu mets le bonnet vert, des oreilles d'elfe te poussent et tu joues de l'ocarina. Tu l'étrennes à ton prochain but.",
		"Se gana en el piano de casa, tocando de oído una canción de la ocarina: te pones el gorro verde, te salen orejas de duende y la tocas. Uno de cada once goles.": "Se gagne au piano de la maison, en jouant d'oreille une chanson d'ocarina : tu mets le bonnet vert, des oreilles d'elfe te poussent et tu en joues. Un but sur onze.",
		"¡SEXTETE!": "SEXTUPLE !",
		"¡SEPTETE!": "SEPTUPLE !",
		"¡OCTETE!": "OCTUPLE !",
		"Esto ya no es una temporada: es la historia del club.": "Ce n'est plus une saison : c'est l'histoire du club.",
		"SUS PADRES, EL DOMINGO": "SES PARENTS, DIMANCHE",
		"Los padres de {0} vienen a comer el domingo, como cada mes. Tu agente te ha cerrado una sesión de fotos a la misma hora.": "Les parents de {0} viennent déjeuner dimanche, comme chaque mois. Ton agent t'a calé une séance photo à la même heure.",
		"PONER LA MESA": "A TABLE !",
		"LA SESIÓN DE FOTOS": "LA SEANCE PHOTO",
		"LAS FIESTAS DE SU PUEBLO": "LA FETE DE SON VILLAGE",
		"{0} quiere llevarte a las fiestas de su pueblo. Medio pueblo sabe ya que vas, y el otro medio lo sabrá en cuanto aparques.": "{0} veut t'emmener à la fête de son village. La moitié du village sait déjà que tu viens, et l'autre moitié le saura dès que tu te gareras.",
		"IR AL PUEBLO": "Y ALLER",
		"ESTE AÑO NO": "SAUTER",
		"SU CUMPLEAÑOS, EN UNA ISLA": "SON ANNIV., SUR UNE ILE",
		"{0} celebra su cumpleaños en una isla: avión fletado, cuarenta amigos y tres noches. Tú entrenas el viernes.": "{0} fête son anniversaire sur une île : avion affrété, quarante amis et trois nuits. Toi, tu t'entraînes vendredi.",
		"IR Y VOLVER EN EL DÍA": "ALLER-RETOUR",
		"LLAMARLA A MEDIANOCHE": "L'APPELER A MINUIT",
		"LA FOTO DE LAS CINCO": "LA PHOTO DE 5 H",
		"Sale una foto de {0} a las cinco de la mañana en una discoteca, la víspera de tu partido. Tú dormías en casa; en las redes nadie lo cree.": "Une photo de {0} sort, à cinq heures du matin dans une boîte de nuit, la veille de ton match. Tu dormais chez toi ; sur les réseaux, personne n'y croit.",
		"DEFENDERLA EN PÚBLICO": "LA DEFENDRE EN PUBLIC",
		"PEDIRLE QUE BAJE EL RITMO": "LUI DIRE DE RALENTIR",
		"LA MESA DEL PRESIDENTE": "LA TABLE DU PRESIDENT",
		"{0} ha conseguido sentarte en la mesa del presidente en la cena del club. No te lo ha consultado: te ha dicho a qué hora pasa el coche.": "{0} a réussi à te placer à la table du président au dîner du club. Elle ne t'a rien demandé : elle t'a juste dit à quelle heure passe la voiture.",
		"IR Y SONREÍR": "SOURIRE",
		"NO ME MUEVAS LOS HILOS": "PAS DE MARIONNETTE",
		"SU MARCA, TU CARA": "SA MARQUE, TOI",
		"{0} lanza su propia línea de ropa y quiere que la presentes tú. Dice que es un negocio de los dos; el contrato lo firma ella.": "{0} lance sa propre ligne de vêtements et veut que ce soit toi qui la présentes. Elle dit que c'est une affaire à deux ; le contrat, c'est elle qui le signe.",
		"PRESENTARLA": "PRESENTER",
		"MI CARA NO SE PRESTA": "MON VISAGE EST A MOI",
		"EL MENSAJE DE LAS TRES": "LE MESSAGE DE 3 H",
		"A las tres de la mañana se ha encendido tu teléfono: una periodista, por un reportaje. {0} ha visto la pantalla y ya no se ha vuelto a dormir.": "À trois heures du matin, ton téléphone s'est allumé : une journaliste, pour un reportage. {0} a vu l'écran et ne s'est pas rendormie.",
		"ENSEÑARLE EL TELÉFONO": "MONTRER L'ECRAN",
		"ES MI TRABAJO": "MON TRAVAIL",
		"LA FISIO NUEVA": "NOUVELLE KINE",
		"El club ha fichado una fisioterapeuta y {0} ya sabe cómo se llama. Pregunta, como quien no quiere la cosa, a qué hora te toca.": "Le club a recruté une kinésithérapeute et {0} connaît déjà son nom. Elle demande, l'air de rien, à quelle heure tu passes.",
		"CAMBIAR DE TURNO": "CHANGER HORAIRE",
		"ES MI FISIO": "MA KINE",
		"SU INAUGURACIÓN": "SON VERNISSAGE",
		"{0} inaugura su primera exposición el sábado, y el sábado juegas en la otra punta del país. No te ha pedido que vayas.": "{0} inaugure sa première exposition samedi, et samedi tu joues à l'autre bout du pays. Elle ne t'a pas demandé de venir.",
		"LLEGAR AUNQUE SEA AL FINAL": "ARRIVER, MEME A LA FIN",
		"MANDARLE FLORES": "ENVOYER FLEURS",
		"TE HA DICHO QUE NO": "ELLE A DIT NON",
		"Le pediste a {0} que viniera a la gala del club. Tiene un plan con sus amigas desde hace meses, y te ha dicho que no sin ningún drama.": "Tu as demandé à {0} de venir au gala du club. Elle a un plan avec ses amies depuis des mois, et elle a dit non sans aucun drame.",
		"IR SOLO Y CONTÁRSELO": "ALLER SEUL",
		"PEDIRLE QUE LO CAMBIE": "FAIRE DECALER",
		"MADRINA DE LA PEÑA": "MARRAINE FAN-CLUB",
		"La peña del barrio quiere a {0} de madrina en su aniversario. Ella ya ha dicho que sí, y a ti te esperan para firmar camisetas.": "Le fan-club du quartier veut {0} comme marraine pour son anniversaire. Elle a déjà dit oui, et toi, on t'attend pour signer des maillots.",
		"IR CON ELLA": "AVEC ELLE",
		"QUE VAYA ELLA": "ELLE Y VA",
		"TE LO DIJO EN EL COCHE": "DANS LA VOITURE",
		"Jugaste mal y {0} te lo ha dicho en el coche, con datos y sin anestesia. Sabe de qué habla: lleva veinte años en la grada.": "Tu as mal joué et {0} te l'a dit dans la voiture, chiffres à l'appui et sans anesthésie. Elle sait de quoi elle parle : elle est en tribune depuis vingt ans.",
		"HOY NO, POR FAVOR": "PAS AUJOURD'HUI",
		"DIJISTE SU NOMBRE": "TU AS DIT SON NOM",
		"En una entrevista nombraste a {0}, de pasada y con cariño. Desde entonces le escriben desconocidos.": "Dans une interview, tu as cité {0}, en passant et avec tendresse. Depuis, des inconnus lui écrivent.",
		"PEDIRLE PERDÓN": "S'EXCUSER",
		"LO DIJE CON CARIÑO": "C'ETAIT TENDRE",
		"UNA VALLA MÁS ALTA": "CLOTURE PLUS HAUTE",
		"{0} quiere una valla alta y cámaras en la entrada de tu casa. Los vecinos, que te saludan cada mañana, no lo van a entender.": "{0} veut une haute clôture et des caméras à l'entrée de chez toi. Les voisins, qui te saluent chaque matin, ne vont pas comprendre.",
		"PONER LA VALLA": "POSER CLOTURE",
		"AQUÍ NO HACE FALTA": "PAS BESOIN ICI",
		"UNA CUENTA DE LOS DOS": "UN COMPTE COMMUN",
		"{0} ha encontrado un banco que os abre una cuenta conjunta con tarjeta de cristal. Dice que así no tiene que pedirte cada cosa.": "{0} a trouvé une banque qui vous ouvre un compte joint avec une carte en cristal. Elle dit qu'ainsi, elle n'aura plus à te demander chaque chose.",
		"ABRIRLA": "OUVRIR",
		"CADA UNO LA SUYA": "CHACUN LE SIEN",
		"EL ESCAPARATE": "LA VITRINE",
		"Paseabais y {0} se ha parado delante de un escaparate. No ha dicho nada. Al día siguiente ha vuelto a pasar por la misma calle.": "Vous vous promeniez et {0} s'est arrêtée devant une vitrine. Elle n'a rien dit. Le lendemain, elle est repassée par la même rue.",
		"SEGUIR ANDANDO": "AVANCER",
		"SU EXAMEN": "EXAMEN",
		"{0} tiene el lunes el examen más importante de su carrera. Lleva meses aguantando tus viajes; esta semana sólo te pide la casa en silencio.": "{0} passe lundi l'examen le plus important de sa carrière. Elle supporte tes déplacements depuis des mois ; cette semaine, elle ne te demande que le silence à la maison.",
		"DORMIR EN EL HOTEL DEL CLUB": "DORMIR A L'HOTEL DU CLUB",
		"LA CASA ES DE LOS DOS": "LA MAISON EST A NOUS",
		"LA CENA DE FIN DE TEMPORADA": "LE DINER DE FIN DE SAISON",
		"{0} se ha hecho amiga de medio vestuario, y ahora el capitán quiere hacer la cena de fin de temporada en tu casa.": "{0} est devenue amie avec la moitié du vestiaire, et maintenant le capitaine veut faire le dîner de fin de saison chez toi.",
		"HACERLA EN CASA": "FAIRE CHEZ NOUS",
		"MEJOR EN UN RESTAURANTE": "MIEUX AU RESTAURANT",
		"SU AVIÓN": "SON JET",
		"{0} te ofrece su avión para volver del partido de fuera, en vez del autobús del equipo. Llegarías a casa tres horas antes.": "{0} te propose son avion pour rentrer du match à l'extérieur, au lieu du bus de l'équipe. Tu serais à la maison trois heures plus tôt.",
		"EL AVIÓN": "L'AVION",
		"EL AUTOBÚS": "LE BUS",
		"LA CENA CON SU PADRE": "DINER AVEC SON PERE",
		"El padre de {0} te ha invitado a cenar. Tiene tres empresas y una sola pregunta: qué vas a hacer cuando dejes el fútbol.": "Le père de {0} t'a invité à dîner. Il a trois entreprises et une seule question : que feras-tu quand tu quitteras le football ?",
		"TENGO UN PLAN": "J'AI UN PLAN",
		"NO LO HE PENSADO": "PAS REFLECHI",
		"LA LUNA DE MIEL": "LUNE DE MIEL",
		"Os casasteis en plena temporada y la luna de miel sigue en un cajón. {0} ha encontrado diez días en tu calendario y ya ha mirado vuelos.": "Vous vous êtes mariés en pleine saison et le voyage de noces dort toujours dans un tiroir. {0} a trouvé dix jours dans ton calendrier et a déjà regardé les vols.",
		"IROS LOS DIEZ DÍAS": "PARTIR 10 JOURS",
		"EN VERANO, PROMETIDO": "EN ETE, PROMIS",
		"NAVIDAD, ¿EN QUÉ CASA?": "NOEL, CHEZ QUI ?",
		"Tu madre y {0} se tratan con una educación que da frío. Este año hay que elegir dónde se pasa la Navidad, y las dos esperan la misma respuesta.": "Ta mère et {0} se parlent avec une politesse qui glace. Cette année, il faut choisir chez qui passer Noël, et toutes deux attendent la même réponse.",
		"CON SU FAMILIA": "SA FAMILLE",
		"CON LA TUYA": "LA TIENNE",
		"LA MESA DE LA PRIMERA CENA": "LA TABLE DU PREMIER DINER",
		"Lleváis meses sin salir solos. {0} ha reservado el jueves en el restaurante de vuestra primera cena, sin preguntarte si tenías algo.": "Cela fait des mois que vous n'êtes pas sortis en tête-à-tête. {0} a réservé jeudi au restaurant de votre premier dîner, sans te demander si tu avais quelque chose.",
		"IR EL JUEVES": "ALLER JEUDI",
		"CAMBIARLO DE DÍA": "LE DECALER",
		"LAS FOTOS DE LA BODA": "PHOTOS DE MARIAGE",
		"Una revista ofrece una fortuna por las fotos de vuestra boda, que nunca enseñasteis a nadie. {0} dice que decidas tú.": "Un magazine offre une fortune pour les photos de votre mariage, que vous n'avez jamais montrées à personne. {0} dit que c'est à toi de décider.",
		"VENDERLAS": "VENDRE",
		"SON NUESTRAS": "A NOUS",
		"¿CUÁNTOS AÑOS MÁS?": "ENCORE COMBIEN ?",
		"{0} te ha preguntado, por primera vez, cuántos años más piensas jugar. No era un reproche: quería saber cuándo empezáis a vivir.": "{0} t'a demandé, pour la première fois, combien d'années tu comptes encore jouer. Ce n'était pas un reproche : elle voulait savoir quand vous commencez à vivre.",
		"LOS QUE AGUANTEN LAS PIERNAS": "TANT QUE LES JAMBES TIENNENT",
		"Empezáis a salir, {0} y tú. Si no es lo tuyo, se deja en RELACIONES y no cuesta nada.": "{0} et toi, vous sortez ensemble. Si ça ne te va pas, tu romps dans RELATIONS, et ça ne coûte rien.",
		"Va a vibrar tres veces. Guarda el teléfono y escucha lo que te cuenta.": "Ça va vibrer trois fois. Range le téléphone et écoute ce qu'elle te raconte.",
		"En la próxima cita te lo preguntará:": "Au prochain rendez-vous, elle te le demandera :",
		"Lo que te contó en la cena · {0} de {1}": "Ce qu'elle t'a raconté au dîner · {0} sur {1}",
		"Pulsa con la línea dentro de la franja · {0} de {1}": "Touche quand la ligne est dans la bande · {0} sur {1}",
		"Alguien te pregunta a qué te dedicas. Contesta sin presumir.": "Quelqu'un te demande ce que tu fais dans la vie. Réponds sans frimer.",
		"EL ROBOT": "LE ROBOT",
		"Baile suelto: codos en ángulo recto y la cabeza girando a tirones, como una máquina. Pide sitio a la vista.": "Danse libre : coudes à angle droit et tête qui tourne par saccades, comme une machine. Demande de la place en vue.",
		"Tienes pareja: meces un bebé invisible en los brazos, para quien te espera en casa.": "Tu as un partenaire : tu berces un bébé invisible dans tes bras, pour celui ou celle qui t'attend à la maison.",
		"LA LLAMADA": "L'APPEL",
		"Hay clubes preguntando por ti: te llevas la mano a la oreja como un teléfono. Que llame tu agente.": "Des clubs se renseignent sur toi : tu portes la main à l'oreille comme un téléphone. Que ton agent appelle.",
		"EL SURF": "SURF",
		"Baile suelto: te tiras de panza y te deslizas por el césped con los brazos abiertos.": "Danse libre : tu te jettes sur le ventre et glisses sur la pelouse, les bras écartés.",
		"LOS BOLOS": "BOWLING",
		"Baile suelto: zancada baja y lanzas una bola invisible de bolos rasa por el césped.": "Danse libre : fente basse et tu lances une boule de bowling invisible au ras de la pelouse.",
		"EL ABRAZO": "CALIN",
		"Baile suelto: abres los brazos y le das un abrazo enorme a la grada.": "Danse libre : tu ouvres les bras et fais un énorme câlin à la tribune.",
		"LA CUMBIA": "CUMBIA",
		"Baile suelto: pasito a un lado y al otro, cadera y brazos al ritmo.": "Danse libre : petits pas d'un côté puis de l'autre, hanches et bras en rythme.",
		"EL RUGIDO": "LE LION",
		"Un golazo: te agachas, sacas las garras y ruges como un león.": "Un but superbe : tu t'accroupis, sors les griffes et rugis comme un lion.",
		"EL BEBE": "BEBE",
		"Tener un amigo que juega en otro tipo de teléfono.": "Avoir un ami qui joue sur un autre type de téléphone.",
		"Cuatro Goles": "Quadruplé",
		"Partidos de 4 goles o más": "Matchs à 4 buts ou plus",
		"DUELO DE CONSOLA": "DUEL SUR CONSOLE",
		"El portero te reta a penaltis al acabar el entreno y medio vestuario se queda a mirar y a picarse.": "Le gardien te défie aux penaltys après l'entraînement et la moitié du vestiaire reste regarder et chambrer.",
		"El comité europeo deja al {0} sin Europa una temporada": "Le comité européen prive {0} d'Europe pour une saison",
		"El comité europeo investiga el dinero del jeque del {0}": "Le comité européen enquête sur l'argent du cheikh de {0}",
		"EUROPA DICTA SENTENCIA": "VERDICT EUROPEEN",
		"FALLO EUROPEO": "VERDICT EUROPEEN",
		"EL FALLO EUROPEO": "LE VERDICT EUROPEEN",
		"El comité europeo ha investigado los patrocinios del jeque y los da por inflados: el club no jugará en Europa la temporada que viene. En la liga no pierde ni un punto.": "Le comité européen a enquêté sur les parrainages du cheikh et les juge gonflés : le club ne jouera pas en Europe la saison prochaine. En championnat, il ne perd pas un seul point.",
		"· tienes que marcar": "· tu dois marquer",
		"ASÍ VA EL CHICO DE ORO": "COURSE JEUNE D'OR",
		"El mejor de {0} años o menos, con el mismo baremo que el Jugador del Año.": "Le meilleur de {0} ans ou moins, au même barème que le Joueur de l'Année.",
		"LA PROMESA DEL AÑO": "ESPOIR DE L'ANNEE",
		"LA PROMESA DEL AÑO · {0}": "ESPOIR DE L'ANNEE · {0}",
		"TU PRIMER CHICO DE ORO": "TON PREMIER JEUNE D'OR",
		"TU CHICO DE ORO Nº {0}": "TON JEUNE D'OR Nº {0}",
		"LA GALA DEL CHICO DE ORO": "LE GALA DU JEUNE D'OR",
		"¿QUIÉN ES TU ÍDOLO?": "TON IDOLE ?",
		"ELEGIR A TU ÍDOLO": "CHOISIR TON IDOLE",
		"Primer premio en primera. Y la pregunta que te van a hacer toda la carrera.": "Premier trophée en première division. Et la question qu'on te posera toute ta carrière.",
		"MANTÉN PULSADO PARA ELEGIRLO: NO PODRÁS CAMBIARLO": "MAINTIENS POUR CHOISIR : DEFINITIF",
		"LA TERTULIA": "LA TABLE",
		"EL DEBATE": "DEBAT",
		"TE ADORAN": "ADULE",
		"TE CRITICAN": "CRITIQUE",
		"OPINIONES DIVIDIDAS": "AVIS PARTAGES",
		"A FAVOR": "POUR",
		"EN CONTRA": "CONTRE",
		"CON DUDAS": "DOUTE",
		"¿ES PARA PRIMERA?": "NIVEAU D1 ?",
		"¿YA ES UN CRACK?": "DEJA UN CRACK ?",
		"¿CUMPLE O NO CUMPLE?": "IL TIENT SA PLACE ?",
		"En la tele ya hablan de ti como de los buenos.": "A la télé, on parle déjà de toi comme des meilleurs.",
		"En la tele piden más. En el campo se contesta.": "À la télé, on en veut plus. Sur le terrain, on répond.",
		"En la tele no terminan de decidirse contigo.": "À la télé, ils n'arrivent pas à se décider sur toi.",
		"EL EXJUGADOR": "L'EX-JOUEUR",
		"LA PERIODISTA": "LA REPORTER",
		"EL CRÍTICO": "LE CRITIC",
		"Una media de {0}. Eso en Primera no lo firma cualquiera.": "Une moyenne de {0}. En première division, tout le monde ne signe pas ça.",
		"Cada jornada, de lo mejor del campo: {0} de media.": "Chaque journée, parmi les meilleurs du terrain : {0} de moyenne.",
		"Un {0} de media. Cumple, pero de él se espera más.": "{0} de moyenne. Il assure, mais on en attend plus de lui.",
		"{0} de nota. Ni para tirar cohetes ni para preocuparse.": "{0} de note. Pas de quoi s'emballer, ni de s'inquiéter.",
		"Un {0} de media es muy poco para Primera.": "{0} de moyenne, c'est bien trop peu pour la première division.",
		"Con {0} de nota, yo me lo pensaría para el once.": "Avec {0} de note, j'y réfléchirais à deux fois pour le onze de départ.",
		"Goles: {0}. Asistencias: {1}. Está decidiendo partidos.": "Buts : {0}. Passes décisives : {1}. Il fait basculer des matchs.",
		"Los números hablan solos. Goles: {0}. Asistencias: {1}.": "Les chiffres parlent d'eux-mêmes. Buts : {0}. Passes décisives : {1}.",
		"Goles: {0}. Asistencias: {1}. Correcto, sin más.": "Buts : {0}. Passes décisives : {1}. Correct, sans plus.",
		"Goles: {0}. Asistencias: {1}. Aporta, pero no basta.": "Buts : {0}. Passes décisives : {1}. Il apporte, mais ça ne suffit pas.",
		"Goles: {0}. Asistencias: {1}. En toda la temporada. Así no.": "Buts : {0}. Passes décisives : {1}. Sur toute la saison. Ça ne va pas.",
		"Goles: {0}. Asistencias: {1}. No aparece: hay que exigirle.": "Buts : {0}. Passes décisives : {1}. Il est absent : il faut être exigeant avec lui.",
		"{0} de {1} partidos. El técnico no lo saca del once.": "{0} matchs sur {1}. L'entraîneur ne le sort pas du onze.",
		"Es fijo: {0} partidos de {1}. Eso es confianza.": "Il est titulaire : {0} matchs sur {1}. C'est de la confiance.",
		"{0} partidos de {1}. Todavía no es indiscutible.": "{0} matchs sur {1}. Il n'est pas encore incontestable.",
		"Entra y sale: {0} de {1}. Tiene que ganarse el sitio.": "Il entre et il sort : {0} sur {1}. Il doit gagner sa place.",
		"Sólo {0} de {1} partidos. Ni su técnico confía en él.": "Seulement {0} matchs sur {1}. Même son entraîneur ne lui fait pas confiance.",
		"{0} partidos de {1}. Así es imposible que crezca.": "{0} matchs sur {1}. Impossible de progresser comme ça.",
		"El equipo va en el puesto {0} y él tiene mucho que ver.": "L'équipe est à la {0}e place et il y est pour beaucoup.",
		"Puesto {0} en la tabla. Cuando el equipo gana, todos brillan.": "{0}e place au classement. Quand l'équipe gagne, tout le monde brille.",
		"El equipo va en el puesto {0}, en tierra de nadie. Y él, igual.": "L'équipe est à la {0}e place, dans le ventre mou. Et lui aussi.",
		"Puesto {0}. Una temporada gris para todos.": "{0}e place. Une saison grise pour tout le monde.",
		"El equipo va en el puesto {0} y él no ayuda a salir de ahí.": "L'équipe est à la {0}e place et il n'aide pas à en sortir.",
		"Puesto {0} en la tabla. Alguien tiene que dar un paso al frente.": "{0}e place au classement. Quelqu'un doit se lever.",
		"MANTÉN PARA SALTAR": "MAINTIENS POUR PASSER",
		"TU ÍDOLO": "TON IDOLE",
		"A GANARSE EL PUESTO": "GAGNER SA PLACE",
		"Ahora le toca al banquillo dar la cara.": "Maintenant, c'est au banc de se montrer.",
		"Ahora tiene que demostrar que es imprescindible.": "Maintenant, il doit prouver qu'il est indispensable.",
		"Apareció cuando nadie lo esperaba. Eso es un crack.": "Il est apparu quand personne ne l'attendait. Ça, c'est un crack.",
		"BAJA SENSIBLE": "GROSSE PERTE",
		"Buen gol, pero el partido lo jugó a ratos.": "Beau but, mais il n'a joué le match que par moments.",
		"CON ÉL": "AVEC",
		"CON ÉL Y SIN ÉL": "AVEC / SANS LUI",
		"Cada partido, su gol. Así se gana una liga.": "Un match, un but. C'est comme ça qu'on gagne un championnat.",
		"Con ese penalti se escaparon los puntos.": "Les points se sont envolés avec ce penalty.",
		"Con o sin ti, el equipo fue igual. Ahora, a marcar la diferencia.": "Avec ou sans toi, l'équipe était pareille. À toi de faire la différence.",
		"Con él, {0} puntos por partido; sin él, {1}.": "Avec lui, {0} points par match ; sans lui, {1}.",
		"Convocado, pero desde el banquillo.": "Convoqué, mais depuis le banc.",
		"Convocado. Ahora a ganarse el once.": "Convoqué. Maintenant, il faut gagner sa place de titulaire.",
		"Dejó al equipo con diez. Eso no se hace.": "Il a laissé l'équipe à dix. On ne fait pas ça.",
		"EL ONCE DE LA TELE": "LE ONZE DE LA TV",
		"EL ONCE DE LA TEMPORADA": "ONZE DE LA SAISON",
		"EL PARTE MÉDICO": "BILAN MEDICAL",
		"EL PENALTI FALLADO": "LE PENALTY RATE",
		"El equipo aguanta {0} semanas sin él.": "L'équipe tient {0} semaines sans lui.",
		"El equipo ha vivido muy bien sin él.": "L'équipe s'est très bien portée sans lui.",
		"El equipo lo ha echado mucho de menos.": "L'équipe l'a beaucoup regretté.",
		"El equipo ni ganó ni perdió sin él.": "L'équipe n'a ni gagné ni perdu sans lui.",
		"El equipo sumó más sin ti. Toca demostrar en el campo.": "L'équipe a pris plus de points sans toi. À toi de le prouver sur le terrain.",
		"El portero lo adivinó. Mérito suyo.": "Le gardien a deviné. Mérite à lui.",
		"El seleccionador cuenta contigo de inicio.": "Le sélectionneur compte sur toi dès le coup d'envoi.",
		"El seleccionador tiene otros nombres.": "Le sélectionneur a d'autres noms en tête.",
		"Entre los once mejores de la liga. Ahí es nada.": "Parmi les onze meilleurs du championnat. Pas mal du tout.",
		"Entre los once mejores de la liga. La tele te pone de ejemplo.": "Parmi les onze meilleurs du championnat. La télé te cite en exemple.",
		"Ese gol vale puntos y vale una temporada.": "Ce but vaut des points et une saison.",
		"Ese penalti no se puede fallar.": "On ne peut pas rater ce penalty.",
		"Esta vez no entraste. El once del año que viene se gana desde ya.": "Tu n'y es pas cette fois. Le onze de l'an prochain se gagne dès maintenant.",
		"Esta vez no estás. La próxima lista se gana con tu club.": "Tu n'y es pas cette fois. La prochaine liste se gagne avec ton club.",
		"Estuvo cerca. El año que viene, dentro.": "Il était tout près. L'an prochain, il y sera.",
		"Está dentro, que es lo primero.": "Il est dedans, c'est déjà ça.",
		"Estás en la lista. El once, a ganárselo en los entrenamientos.": "Tu es dans la liste. Le onze, il faut le gagner à l'entraînement.",
		"Fallar un penalti le pasa a cualquiera.": "Rater un penalty, ça arrive à tout le monde.",
		"Fuera de la lista. Mensaje claro del seleccionador.": "Hors de la liste. Message clair du sélectionneur.",
		"Hay que verla diez veces. No lo tengo claro.": "Il faut la revoir dix fois. Je n'en suis pas sûr.",
		"IMPRESCINDIBLE": "INDISPENSABLE",
		"Indiscutible en el once de la temporada.": "Incontestable dans le onze de la saison.",
		"LA LISTA DE LA SELECCIÓN": "LA LISTE DE LA SELECTION",
		"LA MOVIOLA": "LE RALENTI",
		"LA RACHA": "LA SERIE",
		"LA ROJA": "ROUGE",
		"LA SEQUÍA": "DISETTE",
		"La portería se te resiste. Un gol lo cambia todo.": "Le but te résiste. Un seul but change tout.",
		"La selección se construye a su alrededor.": "La sélection se construit autour de lui.",
		"La tele lo repite una y otra vez. Al siguiente, se marca.": "La télé le repasse en boucle. Au prochain, tu marques.",
		"La tele no habla de otra cosa: estás en racha.": "La télé ne parle que de ça : tu es en série.",
		"Le faltó regularidad para entrar.": "Il lui a manqué de la régularité pour y entrer.",
		"Le toca ganarse el puesto otra vez.": "Il doit regagner sa place.",
		"Lo decidió él, sí. Ochenta minutos discretos.": "C'est lui qui a décidé, oui. Quatre-vingts minutes discrètes.",
		"Lo ha merecido, partido a partido.": "Il l'a mérité, match après match.",
		"MAZAZO": "CHOC",
		"Marca en {0} partidos seguidos. Está en racha.": "Il marque depuis {0} matchs d'affilée. Il est en série.",
		"Necesita un gol, aunque sea de rebote.": "Il lui faut un but, même sur un rebond.",
		"Ni rastro de él en el once. Temporada floja.": "Aucune trace de lui dans l'onze. Saison faible.",
		"No hay defensa que lo pare ahora mismo.": "Aucune défense ne peut l'arrêter en ce moment.",
		"Otros lo hicieron mejor en su puesto.": "D'autres ont fait mieux à son poste.",
		"PARTE MÉDICO": "BULLETIN",
		"PUNTOS POR PARTIDO": "POINTS PAR MATCH",
		"Para mí, la roja fue muy rigurosa.": "Pour moi, le rouge était très sévère.",
		"Partidos que se pierde: {1}. Se notará.": "Matchs manqués : {1}. Ça va se sentir.",
		"Partidos que se pierde: {1}. Y de los gordos.": "Matchs manqués : {1}. Et des gros.",
		"Poca cosa. En nada vuelves a estar disponible.": "Pas grand-chose. Tu seras bientôt de nouveau disponible.",
		"SE PIERDE": "MANQUE",
		"SEMANAS": "SEM.",
		"SIN PARTIDOS A LA VISTA": "AUCUN MATCH EN VUE",
		"SIN ÉL": "SANS",
		"Se le ha cerrado la portería.": "Le but s'est fermé.",
		"Se queda fuera, pero la puerta sigue abierta.": "Il reste dehors, mais la porte reste ouverte.",
		"Sin marcar en {0} partidos. Un delantero vive del gol.": "Sans marquer depuis {0} matchs. Un attaquant vit de buts.",
		"Sin ti el equipo se resintió. Vuelve su referente.": "Sans toi, l'équipe a souffert. Son référent est de retour.",
		"Sin él, el equipo se queda cojo.": "Sans lui, l'équipe boite.",
		"Sin él, el equipo sumó más: {1} por partido.": "Sans lui, l'équipe a pris plus : {1} par match.",
		"Sin él, {1} puntos por partido. Con él, {0}.": "Sans lui, {1} points par match. Avec lui, {0}.",
		"Su temporada no le alcanza para la selección.": "Sa saison ne suffit pas pour la sélection.",
		"TE QUEDAS FUERA": "PAS TITULAIRE",
		"Te toca mirar desde la grada unas semanas.": "Tu vas regarder depuis les tribunes pendant quelques semaines.",
		"Titular con su país. Se lo ha ganado.": "Titulaire avec son pays. Il l'a mérité.",
		"Tu gol del final es la jugada de la semana.": "Ton but de la fin est l'action de la semaine.",
		"Tu roja es la polémica de la semana.": "Ton rouge est la polémique de la semaine.",
		"UN SUSTO": "FRAYEUR",
		"Un susto y poco más: {0} semanas.": "Une frayeur et pas grand-chose de plus : {0} semaines.",
		"Una roja infantil. La paga el equipo.": "Un rouge puéril. C'est l'équipe qui paie.",
		"Va con la selección, pero no es titular.": "Il part avec la sélection, mais n'est pas titulaire.",
		"Va para largo. El equipo tendrá que apañarse sin ti.": "Ça va durer. L'équipe devra se débrouiller sans toi.",
		"Vuelve el que marca la diferencia.": "Celui qui fait la différence est de retour.",
		"Vuelve enseguida. Nada que lamentar.": "Il revient vite. Rien à regretter.",
		"Ya es fijo para el seleccionador.": "Il est désormais indispensable pour le sélectionneur.",
		"{0} PARTIDOS MARCANDO": "{0} MATCHS AVEC BUT",
		"{0} PARTIDOS SIN MARCAR": "{0} MATCHS SANS BUT",
		"{0} semanas fuera, justo cuando iba lanzado.": "{0} semaines out, juste au moment où il était lancé.",
		"{0} semanas fuera. Mazazo para el club.": "{0} semaines out. Coup dur pour le club.",
		"¿LO HAN ECHADO DE MENOS?": "L'A-T-ON REGRETTE ?",
		"ÚLTIMOS PARTIDOS": "DERNIERS MATCHS",
		"Hay respuestas que te siguen toda la carrera.": "Certaines réponses te suivent toute ta carrière.",
		"HACE {0} TEMPORADAS": "IL Y A {0} SAISONS",
		"MI ÍDOLO ES {0}": "MON IDOLE, C'EST {0}",
		"LA PRENSA RECUPERA AQUEL VÍDEO": "LA PRESSE RESSORT CETTE VIDEO",
		"PREMIOS DEL MES DESDE ENTONCES": "PRIX DU MOIS DEPUIS",
		"¿SIGUE SIENDO TU ÍDOLO?": "EST-IL TOUJOURS TON IDOLE ?",
		"La sala pone el vídeo de hace {0} temporadas. Lo que digas hoy sale mañana al lado.": "La salle diffuse la vidéo d'il y a {0} saisons. Ce que tu dis aujourd'hui sortira demain à côté.",
		"SIEMPRE LO SERÁ": "IL LE SERA TOUJOURS",
		"YA JUEGO MI PROPIA HISTORIA": "J'ECRIS MA PROPRE HISTOIRE",
		"EL FAN DE SIEMPRE": "FAN POUR TOUJOURS",
		"DE MANOS DE TU IDOLO": "DES MAINS DE TON IDOLE",
		"Nunca lo gané. Verlo en tus manos es casi lo mismo.": "Je ne l'ai jamais gagné. Le voir dans tes mains, c'est presque pareil.",
		"Yo también lo levanté una vez. Ahora es tuyo.": "Moi aussi, je l'ai soulevé une fois. Maintenant, il est à toi.",
		"Lo levanté {0} veces. Ninguna pesó como ésta.": "Je l'ai soulevé {0} fois. Aucune n'a pesé comme celle-ci.",
		"Te lo entregó {0}, el ídolo del que hablaste aquella noche.": "{0} te l'a remis, l'idole dont tu avais parlé ce soir-là.",
		"Te Elijo a Ti": "Je te Choisis",
		"Ponerle a una mascota el nombre del ratón eléctrico más famoso.": "Donner à un animal le nom de la souris électrique la plus célèbre.",
		"Hay un nombre amarillo y eléctrico que tus mascotas llevan esperando.": "Il y a un nom jaune et électrique que tes animaux attendent.",
		"LO CONOCES": "LA RENCONTRE",
		"TU IDOLO VINO A VERTE": "TON IDOLE EST VENU TE VOIR",
		"LA PRIMERA VEZ EN PERSONA": "LA PREMIERE FOIS EN PERSONNE",
		"la final": "la finale",
		"el derbi": "le derby",
		"temporadas después": "saisons plus tard",
		"Lo dijiste hace {0} temporadas en una rueda de prensa. Hoy bajó a buscarte.": "Tu l'as dit il y a {0} saisons en conférence de presse. Aujourd'hui, il est descendu te chercher.",
		"Te vi levantarla. Yo también temblaba la primera vez.": "Je t'ai vu la soulever. Moi aussi, je tremblais la première fois.",
		"Hoy duele. Guárdalo: la próxima vez te toca a ti.": "Aujourd'hui, ça fait mal. Garde-le : la prochaine fois, ce sera ton tour.",
		"Esta casa también fue la mía. Gracias por cuidarla.": "Cette maison a été la mienne aussi. Merci d'en prendre soin.",
		"Esta grada no olvida, y yo tampoco. Sigue.": "Ces tribunes n'oublient pas, et moi non plus. Continue.",
		"PINGÜINO": "PINGOUIN",
		"Un pingüino que anda a pasitos por la casa. Dicen que trae suerte en el próximo gol.": "Un pingouin qui trottine dans la maison. On dit qu'il porte chance pour ton prochain but.",
		"EL PINGUINAZO": "PINGOUINATOR",
		"Se gana comprando el pingüino de casa: en tu siguiente gol tu equipo se vuelve pingüinos y los rivales, dinosaurios. Sale una sola vez.": "Se gagne en achetant le pingouin de la maison : à ton prochain but, ton équipe devient des pingouins et les adversaires des dinosaures. Une seule fois.",
		"Tu equipo se vuelve pingüinos y los rivales, dinosaurios. Lo estrenas en tu próximo gol, y sólo esa vez.": "Ton équipe devient des pingouins et les adversaires des dinosaures. Tu l'étrennes à ton prochain but, et rien que cette fois.",
		"SU FESTEJO": "SA CELEBRATION",
		"TU IDOLO TE ESPERABA": "TON IDOLE T'ATTENDAIT",
		"NUEVO FESTEJO": "NOUVELLE CELEBRATION",
		"La levanté con esta misma camiseta. Ahora mi festejo es tuyo.": "Je l'ai soulevée avec ce même maillot. Maintenant, ma célébration est à toi.",
		"Me has ganado la final. Esto ya no es mío.": "Tu m'as battu en finale. Ce n'est plus à moi.",
		"Se lo ganaste en una final, a él.": "Tu le lui as pris, en finale.",
		"Ganaste una final con su camiseta.": "Tu as gagné une finale avec son maillot.",
		"Lo estrenas en tu próximo gol.": "Tu l'étrenneras à ton prochain but.",
		"SU ULTIMO CONSEJO": "SON DERNIER CONSEIL",
		"TE INVITO A CENAR": "JE T'INVITE A DINER",
		"LA CENA": "LE DINER",
		"La felicidad está en cada día.": "Le bonheur est dans chaque jour.",
		"Hace {0} años dijiste en una rueda de prensa que yo era tu ídolo.": "Il y a {0} ans, tu as dit en conférence de presse que j'étais ton idole.",
		"Y lo sigues siendo.": "Et tu l'es toujours.",
		"Cuando me retiré pensé que echaría de menos las finales.": "Quand j'ai pris ma retraite, je pensais que les finales me manqueraient.",
		"Pero echo de menos los martes. El autobús, el café malo, las risas del vestuario.": "Mais ce sont les mardis qui me manquent. Le bus, le mauvais café, les rires du vestiaire.",
		"Me he pasado la vida esperando el próximo gran día. Y la felicidad estaba en todos los demás.": "J'ai passé ma vie à attendre le prochain grand jour. Et le bonheur était dans tous les autres.",
		"¿Y ahora qué hago?": "Et maintenant, je fais quoi ?",
		"Lo mismo que en el campo: un día cada vez. En el fútbol y en la vida, la felicidad está en cada día.": "Comme sur le terrain : un jour à la fois. Dans le foot comme dans la vie, le bonheur est dans chaque jour.",
		"Por cada día.": "À chaque jour.",
		"Yo todavía juego, y ya sé lo que voy a echar de menos.": "Je joue encore, et je sais déjà ce qui va me manquer.",
		"No serán las finales. Serán los martes: el autobús, el café malo, las risas del vestuario.": "Ce ne seront pas les finales. Ce seront les mardis : le bus, le mauvais café, les rires du vestiaire.",
		"TE ELIJO A TI": "JE TE CHOISIS",
		"Se gana poniéndole a una mascota el nombre del ratón eléctrico: te calas la gorra roja y lanzas la bola. Lo estrena tu siguiente gol; luego, uno de cada trece.": "S'obtient en donnant à un animal le nom de la souris électrique : tu enfiles la casquette rouge et tu lances la balle. Ton prochain but l'inaugure ; ensuite, un sur treize.",
		"El club lo guardaba para alguien como tú.": "Le club le gardait pour quelqu'un comme toi.",
		"{0} te lo cede.": "{0} te le cède.",
		"¿LLEVAS SU {0}?": "TU PORTES SON {0} ?",
		"LLEVARLO": "LE PORTER",
		"Cada domingo te compararán con él.": "Chaque dimanche, on te comparera à lui.",
		"Tu número, tu historia.": "Ton numéro, ton histoire.",
		"Ya llevas el {0}.": "Tu portes désormais le {0}.",
		"La grada compara tu {0} con el de {1}": "Les tribunes comparent ton {0} à celui de {1}",
		"Llevas el {0} a su altura": "Tu portes le {0} à sa hauteur",
		"su dorsal": "son numéro",
		"títulos aquí": "titres ici",
		"LA ENTREVISTA AL REVES": "L'INTERVIEW A L'ENVERS",
		"¿Quién es tu ídolo?": "Qui est ton idole ?",
		"{0}. Me firmó la playera cuando tenía {1} años. Todavía la tengo.": "{0}. Il m'a signé mon maillot quand j'avais {1} ans. Je l'ai toujours.",
		"Y ahora me pasa el balón todos los fines de semana.": "Et maintenant il me passe le ballon chaque week-end.",
		"Hoy lo tuve enfrente. Sigue siendo él.": "Aujourd'hui je l'avais en face. C'est toujours lui.",
		"SU ÍDOLO ERES TÚ": "SON IDOLE, C'EST TOI",
		"TEMPORADAS DESDE QUE DIJISTE EL TUYO": "SAISONS DEPUIS QUE TU AS DIT LE TIEN",
		"Hace {0} temporadas dijiste {1}. Hoy el nombre que dicen es el tuyo.": "Il y a {0} saisons, tu as dit {1}. Aujourd'hui, le nom qu'on prononce est le tien.",
		"CONTRA TU ÍDOLO": "CONTRE TON IDOLE",
		"CONTRA TU IDOLO": "CONTRE TON IDOLE",
		"LO ELEGISTE HACE {0} TEMPORADAS": "TU L'AS CHOISI IL Y A {0} SAISONS",
		"ranking": "classement",
		"Alguien le enseñó aquella rueda de prensa. Te reconoce.": "Quelqu'un lui a montré cette conférence de presse. Il te reconnaît.",
		"Hoy no eres su aficionado. Eres su rival.": "Aujourd'hui, tu n'es pas son fan. Tu es son rival.",
		"Noventa minutos sin pedirle un autógrafo.": "Quatre-vingt-dix minutes sans lui demander d'autographe.",
		"LA CAMISETA DE TU ÍDOLO": "LE MAILLOT DE TON IDOLE",
		"Esta no se cambia por nada.": "Celui-là, tu ne l'échangerais pour rien au monde.",
		"FICHA CONTIGO": "IL SIGNE AVEC TOI",
		"JUGARÁS CON ÉL": "TU JOUERAS AVEC LUI",
		"años después": "ans plus tard",
		"Hace {0} años dijiste su nombre delante de todos.": "Il y a {0} ans, tu as dit son nom devant tout le monde.",
		"Hace un año dijiste su nombre delante de todos.": "Il y a un an, tu as dit son nom devant tout le monde.",
		"Llegas nuevo, y el primero que viene a darte la bienvenida es él.": "Tu arrives, tout nouveau, et le premier à t'accueillir, c'est lui.",
		"El club lo ha fichado. Ahora entrenas cada día con el que veías por la tele.": "Le club l'a recruté. Maintenant tu t'entraînes chaque jour avec celui que tu regardais à la télé.",
		"Lo pediste tú y el club lo trajo. Ahora te toca estar a su altura.": "Tu l'as demandé et le club l'a fait venir. À toi d'être à sa hauteur.",
		"ES TU ÍDOLO": "TON IDOLE",
		"EN EL PALCO": "EN TRIBUNE",
		"TU ÍDOLO, EN EL PALCO": "TON IDOLE, EN TRIBUNE",
		"SE LEVANTÓ POR TI": "IL S'EST LEVE POUR TOI",
		"el partido": "le match",
		"Dos en mi casa. Esta grada ya tiene otro nombre que cantar.": "Deux chez moi. Cette tribune a un nouveau nom à chanter.",
		"Un gol en el derbi, en esta casa. Eso no se olvida nunca.": "Un but dans le derby, dans cette maison. Ça ne s'oublie jamais.",
		"Lo dijiste hace {0} temporadas. Hoy, en la que fue su casa, el palco entero miró cómo te aplaudía.": "Tu l'as dit il y a {0} saisons. Aujourd'hui, chez lui, toute la tribune l'a vu t'applaudir.",
		"SE MIDE CON SU ÍDOLO": "FACE A SON IDOLE",
		"EL DISCIPULO YA ES MEJOR": "L'ELEVE EST DEVENU MEILLEUR",
		"EL DISCÍPULO YA ES MEJOR": "L'ELEVE EST DEVENU MEILLEUR",
		"EDICIÓN ESPECIAL": "EDITION SPECIALE",
		"EL ALUMNO SUPERA AL MAESTRO": "L'ELEVE DEPASSE LE MAITRE",
		"ÚLTIMA HORA: {0} SUPERA A {1} EN EL RANKING": "DERNIERE MINUTE : {0} DEPASSE {1} AU CLASSEMENT",
		"TU RANKING": "TON RANG",
		"SU RANKING": "SON RANG",
		"tu ranking": "ton rang",
		"su ranking": "son rang",
		"El día que lo nombraste te sacaba {0} puestos.": "Le jour où tu l'as nommé, il avait {0} places d'avance sur toi.",
		"El día que lo nombraste lo mirabas desde muy abajo.": "Le jour où tu l'as nommé, tu le regardais de tout en bas.",
		"Hace {0} temporadas dijo en una rueda de prensa que su ídolo era {1}. Hoy el ranking los pone al revés.": "Il y a {0} saisons, il a dit en conférence de presse que son idole était {1}. Aujourd'hui, le classement les met dans l'autre sens.",
		"Un número no es una carrera. {1} ya tiene la suya; a {2} todavía le falta escribirla.": "Un chiffre n'est pas une carrière. {1} a déjà la sienne ; {2} doit encore écrire la sienne.",
		"Hemos hablado con {1} esta mañana. Dice que alguien tenía que pasarle algún día, y que se alegra de que haya sido {2}.": "Nous avons parlé à {1} ce matin. Il dit que quelqu'un devait le dépasser un jour, et qu'il est content que ce soit {2}.",
		"SU DESPEDIDA": "SES ADIEUX",
		"Compartisteis vestuario. Hoy le aplaudes desde la grada.": "Vous avez partagé un vestiaire. Aujourd'hui, tu l'applaudis depuis la tribune.",
		"Te tocó enfrentarte a él. Hoy te tocó despedirlo.": "Tu as dû l'affronter. Aujourd'hui, tu lui dis adieu.",
		"Él tampoco lo olvidó: tu nombre estaba en su lista de invitados.": "Lui non plus n'a pas oublié : ton nom figurait sur sa liste d'invités.",
		"En el borde del área": "Au bord de la surface",
		"Abierto al segundo palo": "Excentré au second poteau",
		"VUELTA DE HONOR": "TOUR D'HONNEUR",
		"LA VUELTA DE HONOR": "LE TOUR D'HONNEUR",
		"LA ÚLTIMA DE {0}": "DERNIER TOUR {0}",
		"{0} cuelga las botas este verano. La última vuelta fue suya.": "{0} raccroche les crampons cet été. Le dernier tour était le sien.",
		"Más Premios al Mejor en una carrera": "Plus de titres de Joueur de l'Année sur une carrière",
		"Tus amigos te esperan para una noche de videojuegos. El técnico ofrece una sesión extra de vídeo y tiros a puerta. No llegas a las dos.": "Tes amis t'attendent pour une soirée jeux vidéo. Le coach propose une séance en plus de vidéo et de tirs au but. Tu ne peux pas faire les deux.",
		"CONSOLA CON AMIGOS": "CONSOLE ENTRE POTES",
		"Caños": "Petits ponts",
		"Año redondo del club: el técnico cuenta más contigo": "Année en or pour le club : l'entraîneur compte davantage sur toi",
		"Año para olvidar: el club escucharía ofertas por ti": "Année à oublier : le club écouterait des offres pour toi",
		"DIRECTIVA": "CONSEIL",
		"El {0} se ilusiona: la directiva pide acabar {1}": "{0} s'enthousiasme : la direction demande de finir {1}",
		"El {0} rebaja la meta: ahora le basta acabar {1}": "{0} revoit ses ambitions : finir {1} suffit désormais",
		"El {0} cae en {1} antes de lo que pedía la directiva": "{0} chute en {1} plus tôt que ne l'exigeait la direction",
		"Cuadrar las cuentas": "Équilibrer les comptes",
		"Salir del rojo del fair play": "Sortir du rouge du fair-play",
		"CAJA SANA": "CAISSE OK",
		"CUENTAS": "COMPTES",
		"¡Que alguien le pite!": "Sifflez, quelqu'un !",
		"Un recogepelotas de casa te tira el balón detrás de la valla para hacer tiempo.": "Un ramasseur de balles local envoie le ballon derrière la barrière pour gagner du temps.",
		"Balón largo": "Ballon long",
		"Te cuelgan un balón largo: pica cuando el aro se cierre para bajarlo. Si te rebota, pierdes la jugada.": "On t'envoie un ballon long : touche quand l'anneau se referme pour le contrôler. S'il te rebondit dessus, tu perds l'action.",
		"ESA NOCHE": "CE SOIR",
		"EN CASA DE UN COLEGA": "CHEZ UN POTE",
		"¡LO PUSE DE CAPITÁN!": "MON CAPITAINE !",
		"¡Y YO LO TENÍA EN EL BANQUILLO!": "MOI, IL ETAIT SUR LE BANC !",
		"EL CAPITÁN DEL FANTASY": "CAPITAINE FANTASY",
		"FANTASY": "FANTASY",
		"LOS DEL SOFÁ": "TEAM CANAPE",
		"{0} goles tuyos y un colega que no se calla: te tenía de capitán.": "{0} buts de toi et un pote qui n'arrête pas : il t'avait pris comme capitaine.",
		"MÁXIMO": "MAX",
		"TU CAPITÁN SUMA {0} PTS": "TON CAPITAINE MARQUE {0} PTS",
		"FIRMADA": "SIGNE",
		"CON BARRO": "BOUEUX",
		"SU ÚLTIMA TEMPORADA": "SA DERNIERE SAISON",
		"PROMESA CUMPLIDA": "PROMESSE TENUE",
		"El mejor de su equipo te buscó a ti.": "Le meilleur de son équipe est venu te chercher.",
		"Te la firmó antes de dártela.": "Il te l'a signé avant de te le donner.",
		"Con el barro de esta tarde todavía encima.": "Encore couvert de la boue de cet après-midi.",
		"Se retira este verano. Es de las últimas que vestirá.": "Il prend sa retraite cet été. L'un des derniers qu'il portera.",
		"TÚ: {0} DE MEDIA": "TOI : {0} DE MOYENNE",
		"PRIMAS": "PRIMES",
		"TU CONTRATO PAGA": "TON CONTRAT PAIE",
		"ESTA TEMPORADA": "CETTE SAISON",
		"FICHA": "PAIE",
		"CADA PARTIDO": "CHAQUE MATCH",
		"COBRADO": "PERÇU",
		"FIRMA": "SIGN.",
		"PACTADA": "ACCORD",
		"BASE": "BASE",
		"MEJOR DEL CLUB": "MEILLEUR CLUB",
		"Primas por goles": "Primes de buts",
		"Lo que llevas cobrado en primas esta temporada.": "Ce que tu as touché en primes cette saison.",
		"Se cobra al cierre de la temporada si cumples el objetivo.": "Versée en fin de saison si tu atteins l'objectif.",
		"Se cobra al cierre de la temporada si el club cumple lo que pide.": "Versée en fin de saison si le club remplit ses objectifs.",
		"Se cobra al cierre de la temporada si el club gana el título.": "Versée en fin de saison si le club remporte le titre.",
		"Se cobra en cuanto ganas el premio.": "Versée dès que tu remportes le prix.",
		"Se cobra en el partido, por cada gol que marques.": "Versée pendant le match, pour chaque but que tu marques.",
		"Se cobra en el partido, por cada asistencia que des.": "Versée pendant le match, pour chaque passe décisive que tu donnes.",
		"TU BOMBO": "TES CHOIX",
		"SU MOMENTO": "SON MOMENT",
		"DE VISITA": "EXTERIEUR",
		"EN TU BOMBO": "CHOISIE",
		"AL BOMBO": "CHOISIR",
		"Elige con la estrella cuáles salen al marcar. Lo nuevo sigue saliendo.": "Choisis avec l'étoile celles qui sortent quand tu marques. Les nouvelles continuent d'apparaître.",
		"{0}, jugador del partido. Hoy no hay más preguntas.": "{0}, homme du match. Pas d'autres questions aujourd'hui.",
		"Qué partido, {0}. Hoy la cena la pagas tú.": "Quel match, {0}. Ce soir, c'est toi qui paies le dîner.",
		"¡Hoy {0} lo ha bordado! Que no se vaya nunca.": "Aujourd'hui, {0} a été parfait ! Qu'il ne parte jamais.",
		"{0} se ve en lo más alto. Su frase ya es la portada de la semana.": "{0} se voit tout en haut. Sa phrase fait déjà la une de la semaine.",
		"Mucho hablar, {0}. En el campo nos vemos.": "Beaucoup de paroles, {0}. On se voit sur le terrain.",
		"{0} contesta a la crítica. Ahora le toca demostrarlo en el campo.": "{0} répond aux critiques. À lui de le prouver sur le terrain.",
		"¡Así se contesta, {0}! Ahora, a callar bocas.": "C'est comme ça qu'on répond, {0} ! Maintenant, fais-les taire.",
		"Lo dijo y lo cumplió. {0} es de los nuestros.": "Il l'a dit et il l'a fait. {0} est des nôtres.",
		"Palabra de {0}. Así da gusto.": "Parole de {0}. Ça fait plaisir.",
		"¿Y la bravata, {0}? Seguimos esperando.": "Et la fanfaronnade, {0} ? On attend toujours.",
		"La frase de {0} le salió cara.": "La phrase de {0} lui a coûté cher.",
		"Me firmó la camiseta {0}. Un crack también fuera del campo.": "{0} m'a signé mon maillot. Un crack aussi en dehors du terrain.",
		"Soy del otro equipo, pero {0} me firmó la camiseta. Respeto.": "Je suis de l'autre équipe, mais {0} m'a signé mon maillot. Respect.",
		"Una hora esperando y {0} pasó de largo.": "Une heure d'attente et {0} est passé sans s'arrêter.",
		"¡Me ha caído la camiseta de {0}! No me la quito en un año.": "J'ai attrapé le maillot de {0} ! Je ne l'enlève pas avant un an.",
		"El balonazo de {0} al móvil lleva todo el día dando vueltas.": "Le tir de {0} sur le téléphone tourne en boucle depuis ce matin.",
		"Lo de {0} ya es viral. Así se mueven unas redes.": "Le coup de {0} est déjà viral. Voilà comment on fait bouger les réseaux.",
		"Ese festejo de {0} no se olvida. Te esperamos en la vuelta.": "On n'oubliera pas cette célébration de {0}. On t'attend au match retour.",
		"Polémica por el festejo de {0}: el comité ya lo mira.": "Polémique autour de la célébration de {0} : la commission s'en mêle.",
		"Roja para {0}, y su equipo con uno menos.": "Carton rouge pour {0}, et son équipe à dix.",
		"A la ducha temprano, {0}.": "Douche anticipée, {0}.",
		"Ánimo, {0}. El vestuario te espera.": "Courage, {0}. Le vestiaire t'attend.",
		"Recupérate pronto, {0}. Te necesitamos.": "Remets-toi vite, {0}. On a besoin de toi.",
		"Bienvenido a {1}, {0}. Aquí se suda la camiseta.": "Bienvenue à {1}, {0}. Ici, on mouille le maillot.",
		"Es oficial: {0} ya es jugador de {1}.": "C'est officiel : {0} est désormais un joueur de {1}.",
		"Partido para olvidar de {0}. ¿Dónde estuvo?": "Un match à oublier pour {0}. Où était-il ?",
		"{0} calla bocas: después del zasca, partidazo.": "{0} fait taire tout le monde : après le clash, un match énorme.",
		"¡Zasca y partidazo! {0} tenía razón.": "Clash et gros match ! {0} avait raison.",
		"Tanto zasca para esto: {0}, otra vez gris.": "Tout ce clash pour ça : {0}, encore terne.",
		"Mucho móvil y poco fútbol, {0}.": "Beaucoup de téléphone et peu de football, {0}.",
		"Esto es cosa de todos. Orgulloso de este vestuario.": "C'est l'affaire de tous. Fier de ce vestiaire.",
		"Trabajo, trabajo y más trabajo. Y esto sólo acaba de empezar.": "Du travail, du travail et encore du travail. Et ce n'est que le début.",
		"Esto es para vosotros. Sin vuestra voz no somos nada.": "C'est pour vous. Sans votre voix, nous ne sommes rien.",
		"¡Grande, {0}! Juntos hasta el final.": "Énorme, {0} ! Ensemble jusqu'au bout.",
		"Así se habla. Equipo.": "Bien dit. Équipe.",
		"{0} reparte el mérito. Gesto de capitán.": "{0} partage le mérite. Un geste de capitaine.",
		"¡Ese es mi jugador!": "C'est mon joueur !",
		"Menos postureo, {0}.": "Moins de frime, {0}.",
		"El fútbol es de once, {0}.": "Le football se joue à onze, {0}.",
		"¡Te queremos, {0}!": "On t'aime, {0} !",
		"La grada es nuestro jugador número doce.": "Les tribunes sont notre douzième homme.",
		"{0} se gana a la grada otra vez.": "{0} conquiert encore les tribunes.",
		"Foto lista para publicar tras el partido. Lo que subas lo verá todo el mundo, y cada mensaje tiene su público.": "Une photo prête à publier après le match. Tout le monde verra ce que tu postes, et chaque message a son public.",
		"FOTO CON EL VESTUARIO": "PHOTO D'EQUIPE",
		"TU MOMENTO": "TON MOMENT",
		"PARA LA GRADA": "POUR LES FANS",
		"TE CRITICAN EN REDES": "CRITIQUE EN LIGNE",
		"Partido gris y el hashtag ya corre. Te etiquetan en cada crítica y el móvil no para de vibrar. ¿Contestas?": "Match terne et le hashtag circule déjà. On t'identifie dans chaque critique et ton téléphone n'arrête pas de vibrer. Tu réponds ?",
		"IGNORAR": "IGNORER",
		"CON CLASE": "CLASSE",
		"ZASCA": "CLASH",
		"TU ZASCA CORRE POR LAS REDES": "TON CLASH FAIT LE BUZZ",
		"Verdugo de Suecia": "Bourreau de la Suède",
		"Verdugo de Rumanía": "Bourreau de la Roumanie",
		"Vencer a todos los clubes de Suecia (las tres divisiones).": "Battre tous les clubs de Suède (les trois divisions).",
		"Vencer a todos los clubes de Rumanía (las tres divisiones).": "Battre tous les clubs de Roumanie (les trois divisions).",
		"LLEGADAS": "ARRIVEES",
		"ACABA DE ATERRIZAR": "VIENT D'ATTERRIR",
		"LA LLEGADA": "L'ARRIVEE",
		"te esperaban en el aeropuerto": "t'attendaient à l'aéroport",
		"periodistas": "journalistes",
		"LA LLEGADA AL AEROPUERTO": "L'ARRIVEE A L'AEROPORT",
		"Media ciudad vino a verte bajar del avión.": "La moitié de la ville est venue te voir descendre de l'avion.",
		"En Primera, hasta el aeropuerto tiene micrófonos.": "En première division, même l'aéroport a des micros.",
		"En Segunda no se ve esto todos los días.": "En deuxième division, on ne voit pas ça tous les jours.",
		"Pocos, pero ya se saben tu nombre.": "Peu nombreux, mais ils connaissent déjà ton nom.",
		"¿CÓMO LO CELEBRAS?": "TA CELEBRATION ?",
		"SI NO TOCAS, A TU MANERA": "SANS TOUCHER, A TA FAÇON",
		"PROVOCAR": "CHAMBRER",
		"PERDÓN": "PARDON",
		"A LOS TUYOS": "AUX TIENS",
		"MULTA": "PV",
		"CONTRA TU EX": "VS TON EX",
		"ROCE CON EL TÉCNICO": "FROID AVEC LE COACH",
		"ROCE CON EL VESTUARIO": "FROID AU VESTIAIRE",
		"RECIÉN SALIDO": "ENTRE EN JEU",
		"{0} corrió a abrazar a su técnico. Paz en el banquillo.": "{0} a couru enlacer son entraîneur. La paix sur le banc.",
		"Ese abrazo de {0} con el míster dice mucho.": "Cette accolade de {0} avec le coach en dit long.",
		"Gol de {0} y todos con él. Este vestuario está unido.": "But de {0} et tout le monde avec lui. Ce vestiaire est uni.",
		"¡{0} vino a celebrarlo con nosotros!": "{0} est venu le fêter avec nous !",
		"{0} no lo celebró contra nosotros. Respeto.": "{0} n'a pas célébré contre nous. Respect.",
		"{0} marca a su ex y no lo celebra.": "{0} marque contre son ancien club et ne célèbre pas.",
		"NADA QUE ARREGLAR": "RIEN A REPARER",
		"Me equivoqué. Pido perdón al club, al míster y a mis compañeros.": "Je me suis trompé. Je demande pardon au club, au coach et à mes coéquipiers.",
		"{0} pide perdón en un comunicado. El club da el asunto por cerrado.": "{0} s'excuse dans un communiqué. Le club considère l'affaire close.",
		"Errores los tenemos todos. A seguir, {0}.": "Tout le monde fait des erreurs. On avance, {0}.",
		"Disculpas aceptadas. Ahora, a darlo todo.": "Excuses acceptées. Maintenant, tout donner.",
		"Mucho perdón ahora, {0}…": "Beaucoup d'excuses maintenant, {0}…",
		"Dije lo que pienso y no me escondo.": "J'ai dit ce que je pense et je ne me cache pas.",
		"{0} no rectifica: ni una palabra de disculpa.": "{0} ne recule pas : pas un mot d'excuse.",
		"¡Sin miedo, {0}! Con dos.": "Sans peur, {0} ! Du cran.",
		"Así no ayudas al equipo, {0}.": "Comme ça tu n'aides pas l'équipe, {0}.",
		"{0} se planta. El míster toma nota.": "{0} campe sur ses positions. Le coach prend note.",
		"Ni comunicado ni disculpa: {0} guarda silencio.": "Ni communiqué ni excuses : {0} garde le silence.",
		"¿Y el comunicado, {0}? Seguimos esperando.": "Et ce communiqué, {0} ? On attend toujours.",
		"¿QUÉ TE CONVENCIÓ DE VENIR?": "QU'EST-CE QUI T'A CONVAINCU ?",
		"{0} periodistas y una pregunta. Lo que contestes lo va a oír todo el club.": "{0} journalistes et une question. Ce que tu réponds, tout le club l'entendra.",
		"EL TÉCNICO": "L'ENTRAINEUR",
		"EL EQUIPO": "L'EQUIPE",
		"LA AFICIÓN": "LES SUPPORTERS",
		"LA PROXIMA: MULTA ×2 · ROJA {0}": "LA PROCHAINE : AMENDE ×2 · ROUGE {0}",
		"LA PROXIMA: TECNICO {0}": "LA PROCHAINE : ENTRAINEUR {0}",
		"VIGILADO: MULTA ×2": "SOUS SURVEILLANCE : AMENDE ×2",
		"VIGILADO: TECNICO {0}": "SOUS SURVEILLANCE : ENTRAINEUR {0}",
		"{0} no cierra la puerta a {1}. ¿Se va?": "{0} ne ferme pas la porte à {1}. Il s'en va ?",
		"¿{0} coqueteando con {1}? Así no.": "{0} qui flirte avec {1} ? Pas comme ça.",
		"{0} se queda. ¡Eso es compromiso!": "{0} reste. Ça, c'est de l'engagement !",
		"{0} corta el rumor de {1}.": "{0} coupe court à la rumeur {1}.",
		"Gracias a {0} por el pase de hoy.": "Merci à {0} pour la passe d'aujourd'hui.",
		"Se sabe que te seguimos. Lo que digas lo oyen tu grada y nuestro despacho.": "Tout le monde sait qu'on te suit. Ce que tu diras, tes supporters et notre bureau l'entendront.",
		"Respetamos tu palabra, {0}. La puerta sigue abierta.": "On respecte ta parole, {0}. La porte reste ouverte.",
		"¡Vaya pase me diste, crack! Ese gol es medio tuyo.": "Quelle passe, champion ! Ce but est à moitié à toi.",
		"Gracias por la camiseta del túnel, {0}. Desde entonces no me pierdo un gol tuyo.": "Merci pour le maillot du tunnel, {0}. Depuis, je ne rate aucun de tes buts.",
		"¡Tu camiseta ya está colgada en mi cuarto, {0}!": "Ton maillot est déjà accroché dans ma chambre, {0} !",
		"Me alegró verte, {0}. Sigue así.": "Content de t'avoir vu, {0}. Continue comme ça.",
		"En el fútbol nunca se sabe.": "Au foot, on ne sait jamais.",
		"Mi sitio está aquí.": "Ma place est ici.",
		"El próximo te lo pongo yo.": "Le prochain, c'est moi qui te le donne.",
		"¡Gracias por estar siempre!": "Merci d'être toujours là !",
		"Verdugo de Bosnia y Herzegovina": "Bourreau de la Bosnie-Herzégovine",
		"Vencer a todos los clubes de Bosnia y Herzegovina (las tres divisiones).": "Battre tous les clubs de Bosnie-Herzégovine (les trois divisions).",
		"Las copas europeas estrenan rondas previas este verano": "Les coupes européennes inaugurent des tours préliminaires cet été",
		"El {0} jugará la ronda {1} de la {2} contra el {3}": "{0} jouera le tour {1} de la {2} contre {3}",
		"El {0} elimina al {1} y entra en la fase de liga de la {2}": "{0} élimine {1} et entre en phase de ligue de la {2}",
		"El {0} elimina al {1} y pasa a la ronda {2} de la {3}": "{0} élimine {1} et passe au tour {2} de la {3}",
		"El {0} cae ante el {1} y se queda sin Europa": "{0} tombe face à {1} et reste sans Europe",
		"El {0} cae ante el {1} y baja a la fase de liga de la {2}": "{0} tombe face à {1} et redescend en phase de ligue de la {2}",
		"El {0} cae ante el {1} y baja a la ronda {2} de la {3}": "{0} tombe face à {1} et redescend au tour {2} de la {3}",
		"{0} gana una plaza extra en la {1} por su temporada europea": "{0} gagne une place supplémentaire en {1} grâce à sa saison européenne",
		"Mil Goles": "Mille buts",
		"1.000 goles en tu carrera.": "1 000 buts dans ta carrière.",
		"Hat-Trick en la Final": "Triplé en finale",
		"3 goles en una final.": "3 buts en une finale.",
		"Goleador de la Patria": "Buteur de la Patrie",
		"50 goles con tu selección.": "50 buts avec ta sélection.",
		"Bicampeón del Mundo": "Double champion du monde",
		"Ganar 2 Mundiales con tu selección.": "Remporter 2 Mondiaux avec ta sélection.",
		"Era Dorada": "Âge d'or",
		"5 Balones de Oro.": "5 titres de Joueur de l'Année.",
		"Mr. Champions": "M. Coupe Elite",
		"Ganar la Champions 5 veces en tu carrera.": "Remporter la Coupe Elite 5 fois dans ta carrière.",
		"Tricampeón de Europa": "Triple champion d'Europe",
		"Ganar la Champions 3 temporadas seguidas.": "Remporter la Coupe Elite 3 saisons de suite.",
		"Mr. Libertadores": "M. Coupe Gloire",
		"Ganar la Libertadores 5 veces en tu carrera.": "Gagner la Coupe Gloire 5 fois dans ta carrière.",
		"Mr. Copa del Norte": "M. Coupe du Nord",
		"Ganar la Concacaf Champions Cup 5 veces en tu carrera.": "Gagner la Coupe du Nord 5 fois dans ta carrière.",
		"Killer de Europa": "Tueur de l'Europe",
		"Ser 3 veces el máximo goleador de la Champions.": "Être 3 fois meilleur buteur de la Coupe Elite.",
		"¡Llamen a Mantenimiento!": "Appelez la maintenance !",
		"Romper de dos balonazos las dos cuerdas que tensan la red y que salga el staff a tenderlas.": "Casser en deux frappes les deux cordes qui tendent le filet et faire venir le staff pour les retendre.",
		"La red no se sostiene sola: algo la tensa por detrás.": "Le filet ne tient pas tout seul : quelque chose le tend par derrière.",
	},



	"plural": {


		"pluralTIRO": ["TIR", "TIRS"],
		"pluralPASE": ["PASSE", "PASSES"],
		"pluralASISTENCIA": ["PASSE DECISIVE", "PASSES DECISIVES"],
		"pluralA PUERTA": ["CADRE", "CADRES"],
		"pluralREGATE": ["DRIBBLE", "DRIBBLES"],
		"pluralPÉRDIDA": ["PERTE", "PERTES"],
		"pluralFALTA RECIBIDA": ["FAUTE SUBIE", "FAUTES SUBIES"],
		"FIRMA DE AUTÓGRAFOS": "SEANCE DE DEDICACES",
		"AUTÓGRAFOS FIRMADOS": "DEDICACES SIGNEES",
		"FIRMA LA CAJA": "SIGNE LE PACK",
		"FIRMAS EN EL SÚPER": "DEDICACES AU SUPER",
		"Diez cajas firmadas. Ésas no se las come nadie.": "Dix boîtes signées. Personne ne va les manger.",
		"FIRMA EL CROMO": "SIGNE LA CARTE",
		"FIRMAS EN EL BARRIO": "DEDICACE QUARTIER",
		"FIRMA EL PÓSTER": "SIGNE L'AFFICHE",
		"FIRMA LA CLAQUETA": "SIGNE LA CLAP",
		"FIRMAS BAJO LA VALLA": "DEDICACES SOUS PUB",
		"FIRMAS EN LA PLAZA": "DEDICACES PLACE",
		"FIRMAS EN EL PLATÓ": "DEDICACES PLATEAU",
		"Diez pósters firmados. Ésos acaban enmarcados.": "Dix affiches signées. Celles-là finissent encadrées.",
		"Diez fotos firmadas. Ésas brillan más que las pantallas.": "Dix photos signées. Elles brillent plus que les écrans.",
		"Diez claquetas firmadas. Esta vez sí lo grabó alguien.": "Dix claps signés. Cette fois, quelqu'un a bien filmé.",
		"SELFIE": "SELFIE",
		"ENCUADRA Y DISPARA": "CADRE ET DECLENCHE",
		"FOTO": "CLIC",
		"ARRASTRA": "GLISSE",
		"MOVIDA": "FLOUE",
		"SELFIES": "SELFIES",
		"A TUS REDES": "SUR TES RESEAUX",
		"Diez cromos firmados. Ésos ya no se cambian.": "Dix cartes signées. Celles-là ne s'échangent plus.",
		"FIRMA EL CARTEL": "SIGNE L'AFFICHE",
		"FIRMAS EN LA PARADA": "DEDICACES A L'ARRET",
		"Diez carteles firmados. Ésos no los arranca nadie.": "Dix affiches signées. Personne ne les arrachera.",
		"FIRMA LA PORTADA": "SIGNE LA COVER",
		"FIRMAS EN LA TIENDA": "DEDICACE MAGASIN",
		"Diez portadas firmadas. Ésas no se revenden.": "Dix jaquettes signées. Celles-là ne se revendent pas.",


		"pluralFIJADO": ["FIXE", "FIXES"],
		"pluralVETADO": ["EXCLU", "EXCLUS"],

		"pluralJORNADA": ["JOURNEE", "JOURNEES"],
		"pluraljornada": ["journee", "journees"],
		"pluralPUNTO": ["POINT", "POINTS"],
		"pluralsemana": ["semaine", "semaines"],
		"pluraldía": ["jour", "jours"],
		"pluralclub": ["club", "clubs"],
		"pluraloferta": ["offre", "offres"],
		"pluralpatrocinador": ["sponsor", "sponsors"],
		"pluralquiere": ["veut", "veulent"],
		"pluraltemporada": ["saison", "saisons"],
		"pluraljugador": ["joueur", "joueurs"],
		"pluralrival": ["adversaire", "adversaires"],
		"pluralpar": ["paire", "paires"],
		"pluralcompañero": ["coéquipier", "coéquipiers"],
		"pluralgol": ["but", "buts"],
		"pluralasistencia": ["passe décisive", "passes décisives"],
		"pluralAÑO": ["AN", "ANS"],
		"pluralSEMANA": ["SEMAINE", "SEMAINES"],
		"pluralDÍA": ["JOUR", "JOURS"],
		"pluralpartido": ["match", "matchs"],
		"pluralPARTIDO": ["MATCH", "MATCHS"],

		"pluralGOL": ["BUT", "BUTS"],
		"pluralTEMPORADA": ["SAISON", "SAISONS"],
		"pluralPARADA": ["ARRET", "ARRETS"],
		"pluralfichaje": ["transfert", "transferts"],
		"pluralescudo": ["blason", "blasons"],
		"pluralcompeticion": ["competition", "competitions"],
		"pluralestadio": ["stade", "stades"],
		"pluralderbi": ["derby", "derbys"],
		"pluraltécnico": ["entraîneur", "entraîneurs"],
		"pluraltécnico sin equipo": ["entraîneur sans club", "entraîneurs sans club"],
		"pluralseleccionador": ["sélectionneur", "sélectionneurs"],
		"pluralcara de leyenda": ["visage de légende", "visages de légende"],
	},










	"guias": {
		"Tu equipo: quién sale hoy, quién descansa y quién te compite el puesto.": "Ton équipe : qui débute aujourd'hui, qui souffle et qui te dispute la place.",
		"PARA QUÉ SIRVEN": "A QUOI ÇA SERT",
		"Ninguna barra es adorno. El técnico y el vestuario deciden si juegas; la afición y la prensa, cuánto vales y qué marcas te buscan; el agente, cuántas ofertas ves.": "Aucune barre n'est décorative. L'entraîneur et le vestiaire décident si tu joues ; le public et la presse, ce que tu vaux et quelles marques te veulent ; ton agent, combien d'offres tu vois.",
		"EL VESTUARIO TE DA EL BALÓN": "LE VESTIAIRE TE SERT",
		"No es simpatía: con el vestuario hundido te llegan MENOS ocasiones por partido, y con él alto, una o dos más.": "Ce n'est pas une question de sympathie : vestiaire au plus bas, tu as MOINS d'occasions par match ; vestiaire au top, une ou deux de plus.",
		"LA GRADA JUEGA": "LE PUBLIC JOUE",
		"Con la afición por los suelos, el estadio te arruina jugadas. Con la afición contigo, apuntas más fino.": "Avec un public à terre, le stade te gâche des actions. Avec le public derrière toi, tu vises plus juste.",
		"SUBEN Y BAJAN": "ÇA MONTE ET ÇA DESCEND",
		"Quien te reclama esta semana mueve su barra según lo que contestes. Y todas tiran hacia el medio cada temporada: lo alto cae rápido, lo bajo sube despacio.": "Celui qui te sollicite cette semaine fait bouger sa barre selon ta réponse. Et chaque saison, toutes reviennent vers le milieu : le haut chute vite, le bas remonte lentement.",
		"Quién te quiere, cuánto pagan y qué te ofrece cada club. Sólo se mueve en sus dos ventanas: verano e invierno.": "Qui te veut, combien on paie et ce que chaque club propose. Ça ne bouge que pendant ses deux fenêtres : été et hiver.",
		"QUIÉN PUEDE FICHARTE": "QUI PEUT TE SIGNER",
		"Hay dos vetos: un grande no ficha a quien no le da el nivel, y un modesto no puede pagarte. Por eso no te llama todo el mundo.": "Il y a deux vetos : un grand ne signe pas quelqu'un qui n'a pas le niveau, et un modeste ne peut pas te payer. C'est pour ça que tout le monde ne t'appelle pas.",
		"LO QUE VALES": "CE QUE TU VAUX",
		"Cuatro cosas: lo que sabes hacer, tu puesto, lo que llevas hecho esta temporada y lo que la gente sabe de ti. Y la edad manda: de joven multiplica, y desde los 28 pierdes casi un cuarto cada año.": "Quatre choses : ce que tu sais faire, ton poste, ce que tu as fait cette saison et ce que les gens savent de toi. Et l'âge commande : jeune, il multiplie, et à partir de 28 ans tu perds presque un quart par an.",
		"TU AGENTE ABRE PUERTAS": "TON AGENT OUVRE DES PORTES",
		"Su nivel decide CUÁNTAS ofertas ves, y ayuda a arrancarle más sueldo al club. Por eso cobra.": "Son niveau décide COMBIEN d'offres tu vois, et il aide à arracher un meilleur salaire au club. C'est pour ça qu'il se paie.",
		"Puedes pedir salir o irte cedido. Al club no le gusta que se lo pidan.": "Tu peux demander à partir ou être prêté. Le club n'aime pas qu'on le lui demande.",
		"EL ÁRBITRO PITA": "L'ARBITRE SIFFLE",
		"TU PLANTEL": "TON EFFECTIF",
		"El once de hoy sobre la cancha y, debajo, quién descansa. Es una foto: el once lo pone el técnico, no tú.": "Le onze du jour sur le terrain et, dessous, qui se repose. C'est une photo : c'est l'entraîneur qui choisit le onze, pas toi.",
		"LA ENERGÍA MANDA": "L'ENERGIE DECIDE",
		"Tus compañeros se cansan y el técnico los rota: la cancha, la banca y los que no viajan son los del PRÓXIMO partido, no una lista fija. FRESCO, EN FORMA y CARGADO dicen cómo llega cada uno.":
			"Tes coéquipiers se fatiguent et le coach fait tourner : le terrain, le banc et ceux qui ne voyagent pas sont ceux du PROCHAIN match, pas une liste figée. FRAIS, EN FORME et LOURD disent comment chacun arrive.",
		"TU COMPETENCIA": "TA CONCURRENCE",
		"Arriba, tú contra el que juega en tu puesto: la raya blanca es lo que el club pide para ese sitio. Debajo, de qué depende que salgas — tus cualidades, el técnico y tu racha.":
			"En haut, toi face à celui qui joue à ton poste : le repère blanc, c'est ce que le club exige pour cette place. En dessous, ce dont dépend ta titularisation — tes qualités, le coach et ta forme.",
		"TU HABILIDAD": "TES QUALITES",
		"Tus diez cualidades. Las ocho de arriba deciden cómo te sale el balón; las dos de abajo son tu especialidad.": "Tes dix qualités. Les huit du haut décident comment le ballon sort ; les deux du bas sont ta spécialité.",
		"LA ESPECIALIDAD": "LA SPECIALITE",
		"Penales y balón parado NO suben tu media: te hacen el lanzador del equipo. Es una elección de estilo, no un atajo.": "Penaltys et coups de pied arrêtés ne montent PAS ta moyenne : ils font de toi le tireur de l'équipe. Un choix de style, pas un raccourci.",
		"LOS PUNTOS": "LES POINTS",
		"Al subir de nivel ganas puntos. Se gastan con el más de cada fila, y mientras no salgas de la pantalla puedes deshacer.": "En montant de niveau tu gagnes des points. Dépense-les avec le plus de chaque ligne ; tant que tu restes ici, tu peux annuler.",
		"LOS DESPACHOS": "LES BUREAUX",
		"Aquí se trata con el club fuera de la cancha: cuánto te escuchan y a quién te traen.": "Ici, on traite avec le club en dehors du terrain : à quel point on t'écoute, et qui on te fait venir.",
		"CUÁNTO TE ESCUCHAN": "TON POIDS AU CLUB",
		"Seis niveles, y cada uno te deja pedir más. Los sube tu relación (técnico, vestuario, años, afición y títulos aquí) y se revisan en invierno y en verano. Toca uno: verás qué pide y qué da.": "Six niveaux, et chacun te permet d'en demander plus. Ta relation les fait monter (entraîneur, vestiaire, années, supporters et titres ici), et ils sont revus en hiver et en été. Touches-en un : ce qu'il demande et ce qu'il donne.",
		"LA MESA DE FICHAJES": "TES TRANSFERTS",
		"Con la ventana abierta marcas a quién vendes y a quién fichas, y el presupuesto se rehace con cada toque. Nada se mueve hasta que confirmas.": "Pendant le mercato, tu choisis qui tu vends et qui tu recrutes, et le budget se recalcule à chaque toucher. Rien ne bouge tant que tu ne confirmes pas.",
		"LO QUE SE MUEVE": "CE QUI BOUGE",
		"Son fichajes de verdad del mercado, no adorno: el que entra viene de un club real y por un precio.": "Ce sont de vrais transferts du marché, pas du décor : celui qui arrive vient d'un vrai club et pour un prix.",
		"EL MERCADO DE LOS DEMÁS": "LE MERCATO DES AUTRES",
		"Quién ficha por quién en todo el mundo, con lo que pagaron.": "Qui signe où dans le monde entier, et pour combien.",
		"ORDÉNALO": "TRIE-LE",
		"Las fichas de arriba ordenan por fecha, media o precio, y recortan a tu club, tu liga o el mundo.": "Les pastilles du haut trient par date, note ou prix, et filtrent ton club, ton championnat ou le monde.",
		"EL MUNDO SIGUE": "LE MONDE CONTINUE",
		"Lo que pasa en los partidos que no juegas. La liga vive aunque tú no estés.": "Ce qui se passe dans les matchs que tu ne joues pas. Le championnat vit même sans toi.",
		"CAMBIA EL RECORTE": "CHANGE LE FILTRE",
		"La etiqueta subrayada no es un título: se toca y va rotando entre tu club, tu liga y el mundo entero.": "L'étiquette soulignée n'est pas un titre : on la touche et elle tourne entre ton club, ton championnat et le monde entier.",
		"LO TUYO VA MARCADO": "TES INFOS MARQUEES",
		"Las noticias que te tocan llevan el borde de color, y sólo salen las últimas: esto es una portada, no un archivo.": "Les nouvelles qui te concernent ont une bordure de couleur, et seules les dernières sortent : c'est une une, pas des archives.",
		"TU CONTRATO": "TON CONTRAT",
		"El trato que tienes con el club: tu rol, tu sueldo y hasta cuándo.": "L'accord que tu as avec le club : ton rôle, ton salaire et jusqu'à quand.",
		"LO QUE TE PIDEN": "CE QU'ON TE DEMANDE",
		"El club te marca una meta del año. De cómo la lleves depende lo que te ofrezcan al renovar.": "Le club te fixe un objectif annuel. Ce qu'on t'offrira à la prolongation dépend de comment tu le tiens.",
		"Se pide en AGENTE, junto a las ofertas. Lo que puedes pedir sale de cómo vienes jugando, no de lo que te gustaría.": "Ça se demande dans AGENT, à côté des offres. Ce que tu peux exiger vient de tes performances, pas de tes envies.",
		"Tu cara y tu pelo, lo que llevas en la cancha y la ropa de calle, en tres pestañas.": "Ton visage et tes cheveux, ta tenue sur le terrain et tes vêtements de ville, en trois onglets.",
		"SE GUARDA SOLO": "ÇA S'ENREGISTRE",
		"Cada toque queda guardado. Y lo que compres en TIENDA aparece aquí para ponértelo.": "Chaque appui est enregistré. Et ce que tu achètes en BOUTIQUE apparaît ici pour l'enfiler.",
		"LAS BOTAS": "LES CRAMPONS",
		"Dan un bono a tu golpeo, y SE GASTAN con el uso: al agotarse dejan de dártelo.": "Ils donnent un bonus à ta frappe, et ils S'USENT : une fois finis, le bonus disparaît.",
		"PARA LA JORNADA": "POUR LE MATCH",
		"Lo que se consume: recuperarte, ponerte a punto y llegar mejor al siguiente partido.": "Ce qui se consomme : récupérer, s'affûter et arriver mieux au match suivant.",
		"Se lleva una comisión de lo que ingresas, y otra al firmar. Es el precio de que alguien te mueva.": "Il prend une commission sur ce que tu gagnes, et une autre à la signature. C'est le prix pour qu'on te déplace.",
		"Donde vives entre partidos. Subir de casa mejora cómo llegas al siguiente.": "Là où tu vis entre les matchs. Une meilleure maison, et tu arrives mieux au suivant.",
		"LA SEMANA": "LA SEMAINE",
		"Lo que puedes hacer en casa esta semana, sin salir a ningún lado.": "Ce que tu peux faire chez toi cette semaine, sans sortir.",
		"El siguiente peldaño, con lo que cuesta y lo que da. Ojo: el descanso tiene techo, no se acumula sin fin.": "L'échelon suivant, avec son prix et ce qu'il rapporte. Attention : le repos a un plafond, il ne s'accumule pas sans fin.",
		"Cada competición que juegas, por dentro: su tabla, su cuadro o su grupo, y quién lleva los goles.": "Chaque compétition que tu joues, de l'intérieur : son classement, son tableau ou sa poule, et qui mène au but.",
		"EL MUNDO ENTERO": "LE MONDE ENTIER",
		"En la liga puedes viajar a otro país y a otra división: las tablas del planeta están aquí.": "En championnat, tu peux voyager vers un autre pays et une autre division : tous les classements de la planète sont ici.",
		"EL HISTORIAL": "LE PALMARES",
		"Quién ganó cada año. Tu nombre entra en esa lista si te lo ganas.": "Qui l'a gagné chaque année. Ton nom entre dans cette liste si tu le mérites.",
		"EL MERCADO": "LE MARCHE",
		"SI NO JUEGAS": "SI TU NE JOUES PAS",
		"TU TEMPORADA": "TA SAISON",
		"Todos tus partidos en el orden en que se juegan, con lo ya jugado y su resultado.": "Tous tes matchs dans l'ordre où ils se jouent, avec ceux déjà joués et leur résultat.",
		"MIRA ADELANTE": "REGARDE DEVANT",
		"Aquí se ve cuándo se te juntan liga, copa y selección: ésas son las semanas en que el cansancio pesa.": "Ici tu vois quand championnat, coupe et sélection s'accumulent : ce sont les semaines où la fatigue pèse.",
		"EL RANKING": "LE CLASSEMENT",
		"Los jugadores del planeta ordenados por su media, con la tuya dentro para compararte.": "Les joueurs de la planète triés par moyenne, avec la tienne dedans pour te comparer.",
		"ACÓTALO": "AFFINE",
		"Se puede filtrar por puesto y por país: así se ve contra quién compites de verdad.": "On peut filtrer par poste et par pays : c'est ainsi qu'on voit contre qui tu joues vraiment.",
		"Los números de todo lo que llevas hecho: temporada a temporada y torneo por torneo.": "Les chiffres de tout ce que tu as fait : saison par saison et compétition par compétition.",
		"Cada club por el que pasaste y lo que costó cada movimiento.": "Chaque club par lequel tu es passé et ce qu'a coûté chaque transfert.",
		"La curva de lo que vales: el termómetro de si vas subiendo o cayendo.": "La courbe de ta valeur : le thermomètre qui dit si tu montes ou si tu chutes.",
		"TU PUNTERÍA": "TA PRECISION",
		"Desde dónde tiras y desde dónde te entra. Cada marca es un remate tuyo, no una media inventada, y la curva es el vuelo que tuvo ese balón.":
			"D'où tu tires et d'où ça rentre. Chaque marque est une de tes frappes, pas une moyenne inventée, et la courbe est le vol qu'a eu ce ballon.",
		"El gol más lejano, el mejor acierto… lo que hiciste, no lo que crees que haces.": "Le but le plus lointain, la meilleure réussite… ce que tu as fait, pas ce que tu crois faire.",
		"AÑO POR AÑO": "ANNEE PAR ANNEE",
		"Con las flechas se mira cualquier temporada ya cerrada.": "Les flèches permettent de revoir n'importe quelle saison déjà close.",
		"TU VITRINA": "TA VITRINE",
		"Lo que ya ganaste. Se queda para siempre y se ve también dentro de tu casa.": "Ce que tu as déjà gagné. Ça reste pour toujours, et ça se voit aussi chez toi.",
		"LO QUE FALTA": "CE QUI MANQUE",
		"Todo lo que existe por ganar, incluido lo que hoy te queda lejos.": "Tout ce qu'il y a à gagner, y compris ce qui est encore hors de portée.",
		"LA CASA POR DENTRO": "LE CLUB DE L'INTERIEUR",
		"Lo que tu club ganó antes de que llegaras, y quiénes lo hicieron.": "Ce que ton club a gagné avant toi, et qui l'a fait.",
		"LOS DE SIEMPRE": "LES INDEBOULONNABLES",
		"Los máximos goleadores de la casa. Ahí es donde hay que meterse.": "Les meilleurs buteurs de la maison. C'est là qu'il faut entrer.",
		"LAS LEYENDAS": "LES LEGENDES",
		"Los grandes del juego, por liga y por club. Son la vara con la que se te mide.": "Les grands du jeu, par championnat et par club. C'est l'étalon auquel on te mesure.",
		"TU SITIO": "TA PLACE",
		"Con los años, tu nombre aparece en estas listas. Eso es el legado.": "Avec les années, ton nom apparaît dans ces listes. C'est ça, l'héritage.",
		"EL JUGADOR DEL AÑO": "MEILLEUR JOUEUR",
		"Quién lo ganó cada año y con qué números. Si no lo ganas tú, lo gana alguien.": "Qui l'a remporté chaque année et avec quels chiffres. Si ce n'est pas toi, c'est quelqu'un d'autre.",
		"CÓMO SE GANA": "COMMENT ON LE GAGNE",
		"Lo que pesa en la votación. Meter goles es una parte, no toda.": "Ce qui compte dans le vote. Marquer, c'est une part, pas le tout.",
		"ESTE AÑO": "CETTE ANNEE",
		"Cómo va la votación ahora mismo, contigo dentro si andas cerca.": "Où en est le vote à cet instant, avec toi dedans si tu es dans le coup.",
		"EL PARTIDO": "LE MATCH",
		"Tu equipo, el rival y el minuto. Un partido no se juega de corrido: se juega por OCASIONES, y cada una es tuya.": "Ton équipe, l'adversaire et le chrono. Un match ne se joue pas d'un trait : il se joue par OCCASIONS, et chacune est la tienne.",
		"A QUIÉN LLEVAS": "QUI TU CONTROLES",
		"El jugador que controlas ahora. Un pase FUERA del área te pasa el mando al que lo recibe; dentro del área remata él de primera y no hay relevo.": "Le joueur que tu contrôles. Une passe qui finit HORS de la surface donne le contrôle à celui qui la reçoit ; dans la surface, il reprend directement et il n'y a pas de relais.",
		"TU NOTA": "TA NOTE",
		"Sube y baja con cada cosa que haces. Es la nota con la que el técnico te juzga, y la que decide tu temporada.": "Elle monte et descend avec tout ce que tu fais. C'est la note qui te juge aux yeux du coach, et celle qui décide de ta saison.",
		"EL VIENTO": "LE VENT",
		"Hacia dónde sopla y cuánto. El balón se va con él: cuéntalo al apuntar o el centro se te pasa largo.": "Sa direction et sa force. Le ballon part avec lui : tiens-en compte en visant, sinon le centre file trop loin.",
		"EL PARTIDO SE INCLINA": "LE MATCH BASCULE",
		"Cuando tu equipo se enciende, el rival marca menos entre tus jugadas. Cuando se enfría, aprieta él. Lo verás avisado.": "Quand ton équipe s'enflamme, l'adversaire marque moins entre tes occasions. Quand elle refroidit, c'est lui qui pousse. Tu seras prévenu.",
		"FUERA DE LUGAR": "HORS-JEU",
		"Cuando salió el pase, el que lo recibió estaba más cerca del arco que el balón y que el penúltimo rival (el portero cuenta): el abanderado levanta y la jugada se anula. A la altura, en juego.": "Au moment de la passe, celui qui l'a reçue était plus près du but que le ballon et que l'avant-dernier adversaire (le gardien compte) : le juge de touche lève son drapeau et l'action est annulée. À hauteur, c'est valable.",
		"El árbitro pita lo que ve. No siempre a tu favor: también te la pitan a ti.": "L'arbitre siffle ce qu'il voit. Pas toujours pour toi : on en siffle aussi contre toi.",
		"TARJETA": "CARTON",
		"Queda anotada. La amarilla es un aviso; una roja te deja fuera de los próximos partidos de ese torneo, y ahí no se juega ni se entrena: se espera.": "Il est inscrit. Un jaune est un avertissement ; un rouge t'écarte des prochains matchs de cette compétition, et là on ne joue ni ne s'entraîne : on attend.",
		"AHORA LLEVAS A OTRO": "TU CONTROLES UN AUTRE",
		"Diste el pase y el mando saltó al que la recibió. Termina tú la jugada: si él vuelve a pasar, el mando se queda contigo.": "Tu as fait la passe et le contrôle a sauté au receveur. Termine l'action toi-même : s'il repasse, le contrôle reste avec toi.",
		"Desperdiciar ocasiones SEGUIDAS con la nota por los suelos te saca del partido. Si el técnico confía en ti te compra una más, pero no muchas.": "Gâcher des occasions D'AFFILEE avec une note au plus bas te fait sortir. La confiance du coach t'en achète une de plus, pas beaucoup.",
		"CÓMO SE JUEGA": "COMMENT JOUER",
		"TUS PASES": "TES PASSES",
		"TUS REGATES": "TES DRIBBLES",
		"Asistencia": "Passe décisive",
		"Acabó en remate": "A fini en tir",
		"Sin remate": "Sans tir",
		"Por donde pisaste": "Où tu as joué",
		"Te la quitaron": "Ballon perdu",
		"Falta a favor": "Faute obtenue",
		" de {0}": " sur {0}",
		"EL BAR DE SIEMPRE": "LE BAR DE TOUJOURS",

		"GALA DEL CLUB": "GALA DU CLUB",
		"GALA DE LA LIGA": "GALA DE LA LIGUE",
		"La liga te elige su mejor jugador de la temporada.": "La ligue fait de toi son meilleur joueur de la saison.",
		"El mejor de tu línea en toda la liga. El del año fue para {0}.": "Le meilleur de ta ligne dans toute la ligue. Le titre de l'année est allé à {0}.",
		"La liga eligió a {0}. El año que viene, la gala también es tuya.": "La ligue a choisi {0}. L'an prochain, le gala peut aussi être le tien.",
		"SUSPENDIDA": "ANNULEE",
		"GALA SUSPENDIDA": "GALA ANNULE",
		"MEJOR DEFENSA": "TOP DEFENSEUR",
		"MEJOR PORTERO": "TOP GARDIEN",
		"MEJOR MEDIO": "TOP MILIEU",
		"MEJOR DELANTERO": "TOP ATTAQUANT",
		"MEJOR JUGADOR DE LA TEMPORADA": "JOUEUR DE LA SAISON",
		"TROFEOS SUSPENDIDOS": "TROPHEES ANNULES",
		"puesto": "classement",
		"objetivos": "objectifs",
		"Tu vestuario te eligió el mejor de la temporada.": "Ton vestiaire t'a élu meilleur joueur de la saison.",
		"El mejor de tu línea. El del año fue para {0}.": "Le meilleur de ta ligne. Celui de l'année est revenu à {0}.",
		"El vestuario eligió a {0}. La próxima gala se empieza a ganar en agosto.": "Le vestiaire a choisi {0}. Le prochain gala se gagne dès le mois d'août.",
		"El club bajó de categoría. La directiva suspende los premios del año por el mal rendimiento del equipo.": "Le club est descendu. La direction annule les trophées de l'année à cause des mauvais résultats de l'équipe.",
		"El club no cumplió ninguno de sus objetivos. La directiva suspende los premios del año por el mal rendimiento del equipo.": "Le club n'a atteint aucun de ses objectifs. La direction annule les trophées de l'année à cause des mauvais résultats de l'équipe.",
		"El club suspende sus premios del año por el mal rendimiento": "Le club annule ses trophées de l'année pour mauvais résultats",
		"Mejor (Club)": "Meilleur (Club)",
		"Delantero (Club)": "Attaquant (Club)",
		"Medio (Club)": "Milieu (Club)",
		"Defensa (Club)": "Défenseur (Club)",
		"Mejor Jugador del Club": "Meilleur joueur du club",
		"Mejor Delantero del Club": "Meilleur attaquant du club",
		"Mejor Medio del Club": "Meilleur milieu du club",
		"Mejor Defensa del Club": "Meilleur défenseur du club",
		"LA GUARDARON": "ILS L'ONT GARDE",
		"tenías": "tu avais",
		"gol": "but",
		"Alguien la enmarcó y la colgó. Nadie te lo dijo nunca.": "Quelqu'un l'a encadré et accroché. Personne ne te l'a jamais dit.",
		"Sigue ahí. Ya casi nadie se acuerda de aquella tarde, pero sigue ahí.": "Toujours là. Presque plus personne ne se souvient de cet après-midi, mais il est toujours là.",
		"TU CELULAR": "TELEPHONE",
		"Cada app es un recorte: tu club, tu liga, el mundo y tus redes, donde se contesta a quien te critica.": "Chaque appli est un extrait : ton club, ta ligue, le monde et tes réseaux, où l'on répond à ceux qui te critiquent.",
	},












	"caja": {
		"CONSEGUIR DINERO": "OBTENIR DE L'ARGENT",
		"CONSEGUIR PUNTOS": "OBTENIR DES POINTS",
		"Esto se paga con DINERO REAL, no con el dinero del juego: se cobra a tu Apple ID.":
			"Ceci se paie en ARGENT REEL, pas avec l’argent du jeu : c’est débité sur ton identifiant Apple.",
		"Lo que compres entra en esta carrera al instante.":
			"Ce que tu achètes arrive aussitôt dans cette carrière.",
		"DINERO REAL": "ARGENT REEL",
		"DINERO DEL JUEGO": "ARGENT DU JEU",
		"LA CAJA": "RECHARGE",
		"PUNTOS DE HABILIDAD": "PTS DE COMPETENCE",
		"Se reparten a mano en TU JUGADOR. Un punto cuesta 1 por debajo de 80, 2 de 80 a 89 y 3 de 90 en adelante: cuanto mejor eres, menos rinde el paquete.":
			"Tu les répartis à la main dans MON JOUEUR. Un point coûte 1 en dessous de 80, 2 de 80 à 89 et 3 à partir de 90 : plus tu es fort, moins le pack rapporte.",
		"+ {0} PUNTOS DE HABILIDAD": "+ {0} POINTS DE TALENT",
		"EXTRA": "EN PLUS",
		"COMPRA LISTA": "ACHAT VALIDE",
		"Se sumaron ${0} a tu carrera.": "{0} $ ajoutés à ta carrière.",
		"Tienes {0} puntos nuevos para repartir en TU JUGADOR.":
			"Tu as {0} nouveaux points à répartir dans MON JOUEUR.",
		"Ya lo tienes todo al máximo, así que los puntos entraron como {0} de experiencia.":
			"Tu es déjà au maximum partout : les points sont entrés en {0} d’expérience.",
		"Se registró tu compra. Si no ves lo que compraste, cierra y vuelve a abrir el juego.":
			"Ton achat est enregistré. Si tu ne le vois pas, ferme le jeu et rouvre-le.",
		"PRIMA DE PARTIDO": "PRIME DE MATCH",
		"Para lo que te falta hoy: unas botas, o el gel y la bebida antes del derbi.":
			"Pour ce qui te manque aujourd’hui : des crampons, ou le gel et la boisson avant le derby.",
		"BONO DE CONTRATO": "PRIME DE CONTRAT",
		"El deportivo, o unas botas de las buenas con repuesto para toda la temporada.":
			"La sportive, ou de bons crampons avec de quoi les remplacer toute la saison.",
		"Alcanza para el preparador físico, o para subir de escalón con tu agente.":
			"De quoi payer le préparateur physique, ou monter d’un cran avec ton agent.",
		"TRASPASO RÉCORD": "TRANSFERT RECORD",
		"La clínica y el analista de vídeo, de una sentada.":
			"La clinique et l’analyste vidéo, d’un coup.",
		"El agente que te sienta con los grandes de Europa, pagado de golpe.":
			"L’agent qui t’assoit avec les grands d’Europe, payé d’un coup.",
		"SESIÓN EXTRA": "SEANCE EN PLUS",
		"Cuatro niveles de golpe. Para rematar la habilidad que traes a medias.":
			"Quatre niveaux d’un coup. Pour finir le talent laissé à moitié.",
		"Sube una habilidad entera de 60 a 85, o reparte donde más duela.":
			"Monte un talent entier de 60 à 85, ou répartis là où ça fait mal.",
		"Una habilidad de 60 a 99, y todavía sobra para empezar la siguiente.":
			"Un talent de 60 à 99, et il en reste pour attaquer le suivant.",
		"TALENTO GENERACIONAL": "TALENT DE GENERATION",
		"Trescientos puntos. Casi la mitad de todo lo que se puede subir en una carrera.":
			"Trois cents points. Presque la moitié de tout ce qu’une carrière peut monter.",







		"TODAS LAS VENTAJAS": "TOUS LES ATOUTS",
		"Abre de golpe la vitrina entera de NUEVA CARRERA+, sin esperar a sus logros.":
			"Ouvre d’un coup toute la vitrine de NOUVELLE CARRIERE+, sans attendre ses succès.",
		"PARA SIEMPRE": "POUR TOUJOURS",
		"{0} VENTAJAS": "{0} ATOUTS",


		"DOBLE PAGA": "DOUBLE PAIE",
		"Sueldo, primas y patrocinios ×2 en todas tus carreras, las de hoy y las que vengan.":
			"Salaire, primes et sponsors ×2 dans toutes tes carrières, celles d'aujourd'hui et celles à venir.",
		"Activa: cobras el doble en cada partido y en cada cierre.":
			"Active : tu touches le double à chaque match et à chaque fin de saison.",
		"TODAS TUS CARRERAS": "TOUTES TES CARRIERES",
		"PAGO ÚNICO": "PAIEMENT UNIQUE",
		"COBRA ×2": "GAGNE ×2",


		"DOBLE XP": "XP DOUBLE",
		"La XP de cada partido ×2 en todas tus carreras, las de hoy y las que vengan.":
			"L'XP de chaque match ×2 dans toutes tes carrières, celles d'aujourd'hui et celles à venir.",
		"Activa: ganas el doble de XP en cada partido.":
			"Active : tu gagnes le double d'XP à chaque match.",
		"GANA XP ×2": "GAGNE XP ×2",


		"PACK LEYENDA": "PACK LEGENDE",
		"DOBLE PAGA y DOBLE XP juntos, en todas tus carreras, las de hoy y las que vengan.":
			"DOUBLE PAIE et XP DOUBLE ensemble, dans toutes tes carrières, celles d'aujourd'hui et celles à venir.",
		"Activa: cobras el doble y ganas el doble de XP en cada partido.":
			"Active : tu touches le double et gagnes le double d'XP à chaque match.",
		"LOS DOS ×2": "LES DEUX ×2",
		"PAGA": "PAIE",
		"XP": "XP",
		"AHORRO": "ECONOMIE",
		"CUARTA RANURA": "4E EMPLACEMENT",
		"Una cuarta ranura en la portada, para llevar otra carrera a la vez.":
			"Un quatrième emplacement sur l'écran titre, pour mener une autre carrière en même temps.",
		"Activa: tu portada tiene cuatro ranuras.": "Active : ton écran titre a quatre emplacements.",
		"ABRE LA CUARTA": "+1 EMPLACEMENT",
		"RANURA": "EMPLACEMENT",
		"A LA VEZ": "EN MEME TEMPS",
		"HITOS": "ETAPES",
		"Tus {0} ventajas siguen entrando en cada carrera nueva.":
			"Tes {0} atouts entrent toujours dans chaque nouvelle carrière.",
		"Se abren todas de golpe en NUEVA CARRERA+, y también las que se añadan después.":
			"Ils s’ouvrent tous d’un coup dans NOUVELLE CARRIERE+, y compris ceux ajoutés plus tard.",
		"No marca ningún logro: tu palmarés sigue siendo lo que jugaste.":
			"Aucun succès n’est validé : ton palmarès reste ce que tu as joué.",
		"Se paga una vez y queda en tu Apple ID: vale para las 3 ranuras y para cada carrera nueva.":
			"Payé une seule fois et lié à ton Apple ID : valable pour les 3 emplacements et chaque nouvelle carrière.",
		"Listo: ya están abiertas todas. Las eliges al empezar una carrera nueva, en TUS VENTAJAS.":
			"C’est fait : tous sont ouverts. Tu les choisis au début d’une nouvelle carrière, dans TES ATOUTS.",
		"COMPRAS": "ACHATS",
		"¿Reinstalaste el juego o cambiaste de teléfono? Recupera aquí lo que ya pagaste con este Apple ID.":
			"Tu as réinstallé le jeu ou changé de téléphone ? Récupère ici ce que tu as déjà payé avec cet Apple ID.",
		"RESTAURAR COMPRAS": "RESTAURER LES ACHATS",
		"RESTAURANDO": "RESTAURATION",
		"Listo: ya recuperaste lo que habías comprado con este Apple ID.":
			"C’est fait : tu as récupéré ce que tu avais acheté avec cet Apple ID.",
		"Este Apple ID no tiene compras que recuperar en Football Legacy.":
			"Cet Apple ID n’a aucun achat à récupérer dans Football Legacy.",

		"PACK DOBLE": "PACK DOUBLE",
		"Las dos monedas en una compra, y sale mejor que por separado.":
			"Les deux monnaies en un seul achat, et moins cher que séparément.",





		"TU {0}%": "TOI {0}%",
		"RIVAL {0}%": "ADV. {0}%",
		"subMANTEN": "MAINTIENS",
		"subPEDIDO": "DEMANDE",
		"subAGUANTA": "RESTE",
		"subFUERA": "SORTI",
		"subLESIONADO": "BLESSE",
		"Subirla cuesta 1 punto y tienes {0}.": "La monter coûte 1 point et tu en as {0}.",
		"Subirla cuesta {0} puntos y tienes {1}.": "La monter coûte {0} points et tu en as {1}.",
	},

	"casa_pack_2": {
		"COLCHÓN DE ESTIRAMIENTOS": "TAPIS D'ETIREMENT",
		"Rutina corta de movilidad: recupera energía y un punto de ánimo.": "Routine courte de mobilité : récupère de l’énergie et un point de moral.",
		"Zona de movilidad para soltar piernas. Su rutina da energía y ánimo.": "Zone de mobilité pour délier les jambes. Sa routine donne énergie et forme.",
		"MÁQUINA DE RESPIRACIÓN": "MACHINE DE RESPIRATION",
		"Respiración guiada para centrarte. Da ánimo y confianza con el técnico.": "Respiration guidée pour te recentrer. Donne du moral et la confiance du coach.",
		"Cabina de respiración guiada para bajar pulsaciones antes de competir.": "Cabine de respiration guidée pour faire baisser le pouls avant de jouer.",
		"PANEL DE OBJETIVOS": "TABLEAU D'OBJECTIFS",
		"Metas, notas y hábitos de temporada para vestir la pared.": "Objectifs, notes et habitudes de saison pour habiller le mur.",
		"Panel de objetivos y hábitos. Decora la pared y ordena tu semana.": "Tableau d’objectifs et d’habitudes. Il décore le mur et organise ta semaine.",
		"BAR SALUDABLE": "BAR SAIN",
		"Jugos, agua mineral y snacks medidos: recupera energía sin salir.": "Jus, eau minérale et snacks mesurés : récupère de l’énergie sans sortir.",
		"Bar de jugos, agua mineral y snacks. Recupera un poco de energía.": "Bar à jus, eau minérale et snacks. Récupère un peu d’énergie.",
		"LÁMPARA SOLAR": "LAMPE SOLAIRE",
		"Luz cálida de ambiente para que los rincones se sientan habitados.": "Lumière chaude d’ambiance pour rendre les coins plus habités.",
		"Luz cálida de ambiente. No da bonus, pero levanta mucho el rincón.": "Lumière chaude d’ambiance. Pas de bonus, mais le coin vit mieux.",
		"ESTIRAR EN CASA": "S'ETIRER CHEZ SOI",
		"Hasta +4 de energía y +1 de ánimo. Una acción semanal.": "Jusqu’à +4 énergie et +1 forme. Une action hebdomadaire.",
		"RESPIRAR Y ENFOCAR": "RESPIRER ET SE CENTRER",
		"+1 de ánimo y +1 con el técnico si aún hay margen. Una acción semanal.": "+1 forme et +1 avec le coach s’il reste de la marge. Une action hebdomadaire.",
		"HIDRATARSE BIEN": "BIEN S'HYDRATER",
		"Hasta +4 de energía. Una acción semanal.": "Jusqu’à +4 énergie. Une action hebdomadaire.",
	},




















	"aspecto": {

		"Corte César": "Coupe César",
		"Coleta": "Queue de cheval",
		"Coleta alta": "Queue haute",
		"Calvicie en coronilla": "Calvitie au sommet",
		"Dos trenzas": "Deux tresses",
		"Flat top": "Flat top",
		"Flequillo": "Frange",
		"Corte hongo": "Coupe au bol",
		"Pelo largo": "Cheveux longs",
		"Melena a la mandíbula": "Carré mâchoire",
		"Moño": "Chignon",
		"Mullet rizado": "Mulet bouclé",
		"Peinado hacia atrás": "Coiffé en arrière",
		"Raya al lado": "Raie sur le côté",
		"Rizado": "Bouclé",
		"Semicalvo": "Dégarni",
		"Trenzas pegadas": "Tresses collées",
		"Trenzas largas sueltas": "Longues tresses libres",
		"Tupé": "Banane",
		"Undercut": "Undercut",

		"French crop texturizado": "French crop texturisé",
		"Crop con degradado alto": "Crop dégradé haut",
		"Crew cut": "Coupe en brosse",
		"Buzz con degradado": "Rasé dégradé",
		"Tupé corto": "Banane courte",
		"Raya lateral corta": "Raie latérale courte",
		"Edgar con fleco recto": "Edgar à frange droite",
		"Crop rizado": "Crop bouclé",
		"Ivy League": "Ivy League",
		"Ondas cortas con degradado": "Vagues courtes dégradées",
		"Fleco de cortina largo": "Rideau long",
		"Wolf cut suave": "Wolf cut doux",
		"Mullet moderno": "Mulet moderne",
		"Rizos sueltos": "Boucles libres",
		"Rastas recogidas arriba": "Dreads relevées",
		"Rastas hacia un lado": "Dreads sur le côté",
		"Trenzas pegadas con diseños": "Tresses collées à motifs",
		"Twists cortos": "Twists courts",
		"Melena ondulada": "Crinière ondulée",
		"Capas despeinadas": "Dégradé décoiffé",
		"Media coleta": "Demi-queue",
		"Rastas cortas": "Dreads courtes",
		"Rastas con degradado": "Dreads dégradées",
		"Rastas a la mandíbula": "Dreads à la mâchoire",
		"Rastas largas sueltas": "Longues dreads libres",
		"Rastas gruesas": "Dreads épaisses",
		"Fleco recto": "Frange droite",
		"Fleco irregular": "Frange effilée",
		"Fleco diagonal": "Frange de côté",
		"Fleco de cortina": "Frange rideau",
		"Fleco ondulado": "Frange ondulée",

		"Barba cuadrada": "Barbe carrée",
		"Barba redondeada": "Barbe arrondie",
		"Barba trenzada": "Barbe tressée",
		"Bigote de puntas curvadas": "Moustache à pointes",
		"Bigote fino": "Moustache fine",
		"Bigote chevrón": "Moustache chevron",
		"Chiva larga": "Bouc long",
		"Bigote herradura": "Moustache fer à cheval",
		"Barba larga": "Barbe longue",
		"Bigote morsa": "Moustache morse",
		"Patillas unidas al bigote": "Pattes jusqu'à la moustache",
		"Perilla": "Bouc",
		"Barba sin bigote": "Barbe sans moustache",
		"Barba de tres días": "Barbe de trois jours",

		"Arqueadas": "Arqués",
		"Caídas": "Tombants",
		"Con cortes": "Entaillés",
		"Finas": "Fins",
		"Inclinadas": "Inclinés",
		"Naturales": "Naturels",
		"Pobladas": "Épais",

		"Altas": "Hauts",
		"Unidas": "Monosourcil",
		"Cortas": "Courts",
		"Largas": "Longs",
		"Puntiagudas": "Effilés",
		"Una levantada": "Un relevé",
		"Furiosas": "Furieux",
		"Muy pobladas": "Très épais",
		"Rectas gruesas": "Droits épais",
		"Despeinadas": "Ébouriffés",
		"Cuadradas": "Carrés",
		"Gruesas arqueadas": "Arqués épais",


		"Crop": "Crop",
		"Cesar": "César",
		"Crew": "Crew",
		"Bun": "Chignon",
		"Zigzag": "Zigzag",
		"Rombos": "Losanges",
		"Espiga": "Chevrons",
		"Malla": "Résille",
		"Entrenamiento": "Entraînement",
		"Lujo": "Luxe",
		"Ninguna": "Aucune",
		"Varsity": "Teddy",
		"Gabardina": "Trench",
		"Acolchada": "Doudoune",
		"Gimnasio": "Gym",
		"Streetwear": "Streetwear",
		"Retro": "Rétro",
		"Invierno": "Hiver",
		"Vaquero": "Cow-boy",
		"Playero": "Plage",
		"Rockero": "Rockeur",
		"Urbano": "Urbain",
		"Día de nieve": "Jour de neige",
		"Festival": "Festival",
		"Llegada al estadio": "Arrivée au stade",
		"Aeropuerto": "Aéroport",
		"Rueda de prensa": "Conférence de presse",
		"Terraza clásica": "Style tribune",
		"Usar": "Utiliser",
		"Actualizar": "Actualiser",
		"Eliminar": "Supprimer",
		"Bajas": "Basses",
		"Villano": "Méchant",
		"Doble corte": "Double entaille",
		"Escalón": "En escalier",
	},
	"paises": {
		"Afganistán": "Afghanistan",
		"Albania": "Albanie",
		"Alemania": "Allemagne",
		"Andorra": "Andorre",
		"Angola": "Angola",
		"Anguila": "Anguilla",
		"Antigua y Barbuda": "Antigua-et-Barbuda",
		"Arabia Saudí": "Arabie saoudite",
		"Argelia": "Algérie",
		"Argentina": "Argentine",
		"Armenia": "Arménie",
		"Aruba": "Aruba",
		"Australia": "Australie",
		"Austria": "Autriche",
		"Azerbaiyán": "Azerbaïdjan",
		"Bahamas": "Bahamas",
		"Bangladés": "Bangladesh",
		"Barbados": "Barbade",
		"Baréin": "Bahreïn",
		"Belice": "Belize",
		"Benín": "Bénin",
		"Bermudas": "Bermudes",
		"Bielorrusia": "Biélorussie",
		"Bolivia": "Bolivie",
		"Bosnia y Herzegovina": "Bosnie-Herzégovine",
		"Botsuana": "Botswana",
		"Brasil": "Brésil",
		"Brunéi": "Brunei",
		"Bulgaria": "Bulgarie",
		"Burkina Faso": "Burkina Faso",
		"Burundi": "Burundi",
		"Bután": "Bhoutan",
		"Bélgica": "Belgique",
		"Cabo Verde": "Cap-Vert",
		"Camboya": "Cambodge",
		"Camerún": "Cameroun",
		"Canadá": "Canada",
		"Catar": "Qatar",
		"Chad": "Tchad",
		"Chequia": "Tchéquie",
		"Chile": "Chili",
		"China": "Chine",
		"China Taipéi": "Taipei chinois",
		"Chipre": "Chypre",
		"Colombia": "Colombie",
		"Comoras": "Comores",
		"Congo": "Congo",
		"Corea del Norte": "Corée du Nord",
		"Corea del Sur": "Corée du Sud",
		"Costa de Marfil": "Côte d'Ivoire",
		"Costa Rica": "Costa Rica",
		"Croacia": "Croatie",
		"Cuba": "Cuba",
		"Curazao": "Curaçao",
		"Dinamarca": "Danemark",
		"Dominica": "Dominique",
		"Ecuador": "Équateur",
		"Egipto": "Égypte",
		"El Salvador": "Salvador",
		"Emiratos Árabes": "Émirats arabes",
		"Eritrea": "Érythrée",
		"Escocia": "Écosse",
		"Eslovaquia": "Slovaquie",
		"Eslovenia": "Slovénie",
		"España": "Espagne",
		"Estados Unidos": "États-Unis",
		"Estonia": "Estonie",
		"Esuatini": "Eswatini",
		"Etiopía": "Éthiopie",
		"Filipinas": "Philippines",
		"Finlandia": "Finlande",
		"Fiyi": "Fidji",
		"Francia": "France",
		"Gabón": "Gabon",
		"Gales": "Pays de Galles",
		"Gambia": "Gambie",
		"Georgia": "Géorgie",
		"Ghana": "Ghana",
		"Gibraltar": "Gibraltar",
		"Granada": "Grenade",
		"Grecia": "Grèce",
		"Guam": "Guam",
		"Guatemala": "Guatemala",
		"Guinea": "Guinée",
		"Guinea Ecuatorial": "Guinée équatoriale",
		"Guinea-Bisáu": "Guinée-Bissau",
		"Guyana": "Guyana",
		"Haití": "Haïti",
		"Honduras": "Honduras",
		"Hong Kong": "Hong Kong",
		"Hungría": "Hongrie",
		"India": "Inde",
		"Indonesia": "Indonésie",
		"Inglaterra": "Angleterre",
		"Irak": "Irak",
		"Irlanda": "Irlande",
		"Irlanda del Norte": "Irlande du Nord",
		"Irán": "Iran",
		"Islandia": "Islande",
		"Islas Caimán": "Îles Caïmans",
		"Islas Cook": "Îles Cook",
		"Islas Feroe": "Îles Féroé",
		"Islas Marianas del Norte": "Mariannes du Nord",
		"Islas Salomón": "Îles Salomon",
		"Islas Turcas y Caicos": "Turques-et-Caïques",
		"Islas Vírgenes Británicas": "Îles Vierges brit.",
		"Islas Vírgenes de EE.UU.": "Îles Vierges des É.-U.",
		"Israel": "Israël",
		"Italia": "Italie",
		"Jamaica": "Jamaïque",
		"Japón": "Japon",
		"Jordania": "Jordanie",
		"Kazajistán": "Kazakhstan",
		"Kenia": "Kenya",
		"Kirguistán": "Kirghizstan",
		"Kosovo": "Kosovo",
		"Kuwait": "Koweït",
		"Laos": "Laos",
		"Lesoto": "Lesotho",
		"Letonia": "Lettonie",
		"Liberia": "Libéria",
		"Libia": "Libye",
		"Liechtenstein": "Liechtenstein",
		"Lituania": "Lituanie",
		"Luxemburgo": "Luxembourg",
		"Líbano": "Liban",
		"Macao": "Macao",
		"Macedonia del Norte": "Macédoine du Nord",
		"Madagascar": "Madagascar",
		"Malasia": "Malaisie",
		"Malaui": "Malawi",
		"Maldivas": "Maldives",
		"Malta": "Malte",
		"Malí": "Mali",
		"Marruecos": "Maroc",
		"Mauricio": "Maurice",
		"Mauritania": "Mauritanie",
		"Moldova": "Moldavie",
		"Mongolia": "Mongolie",
		"Montenegro": "Monténégro",
		"Montserrat": "Montserrat",
		"Mozambique": "Mozambique",
		"Myanmar": "Myanmar",
		"México": "Mexique",
		"Namibia": "Namibie",
		"Nepal": "Népal",
		"Nicaragua": "Nicaragua",
		"Nigeria": "Nigeria",
		"Noruega": "Norvège",
		"Nueva Caledonia": "Nouvelle-Calédonie",
		"Nueva Zelanda": "Nouvelle-Zélande",
		"Níger": "Niger",
		"Omán": "Oman",
		"Pakistán": "Pakistan",
		"Palestina": "Palestine",
		"Panamá": "Panama",
		"Papúa Nueva Guinea": "Papouasie-N.-Guinée",
		"Paraguay": "Paraguay",
		"Países Bajos": "Pays-Bas",
		"Perú": "Pérou",
		"Polonia": "Pologne",
		"Portugal": "Portugal",
		"Puerto Rico": "Porto Rico",
		"RD Congo": "RD Congo",
		"República Centroafricana": "Rép. centrafricaine",
		"República Dominicana": "Rép. dominicaine",
		"Ruanda": "Rwanda",
		"Rumanía": "Roumanie",
		"Rusia": "Russie",
		"Samoa": "Samoa",
		"Samoa Americana": "Samoa américaines",
		"San Cristóbal y Nieves": "Saint-Kitts-et-Nevis",
		"San Marino": "Saint-Marin",
		"San Vicente y las Granadinas": "Saint-Vincent-et-Grenadines",
		"Santa Lucía": "Sainte-Lucie",
		"Santo Tomé y Príncipe": "Sao Tomé-et-Principe",
		"Senegal": "Sénégal",
		"Serbia": "Serbie",
		"Seychelles": "Seychelles",
		"Sierra Leona": "Sierra Leone",
		"Singapur": "Singapour",
		"Siria": "Syrie",
		"Somalia": "Somalie",
		"Sri Lanka": "Sri Lanka",
		"Sudáfrica": "Afrique du Sud",
		"Sudán": "Soudan",
		"Sudán del Sur": "Soudan du Sud",
		"Suecia": "Suède",
		"Suiza": "Suisse",
		"Surinam": "Suriname",
		"Tahití": "Tahiti",
		"Tailandia": "Thaïlande",
		"Tanzania": "Tanzanie",
		"Tayikistán": "Tadjikistan",
		"Timor Oriental": "Timor oriental",
		"Togo": "Togo",
		"Tonga": "Tonga",
		"Trinidad y Tobago": "Trinité-et-Tobago",
		"Turkmenistán": "Turkménistan",
		"Turquía": "Turquie",
		"Túnez": "Tunisie",
		"Ucrania": "Ukraine",
		"Uganda": "Ouganda",
		"Uruguay": "Uruguay",
		"Uzbekistán": "Ouzbékistan",
		"Vanuatu": "Vanuatu",
		"Venezuela": "Venezuela",
		"Vietnam": "Viêt Nam",
		"Yemen": "Yémen",
		"Yibuti": "Djibouti",
		"Zambia": "Zambie",
		"Zimbabue": "Zimbabwe",
	},

	"herencia": {
		"ESTRELLAS": "ETOILES",
		"KITS": "KITS",
		"VENTAJAS": "ATOUTS",
		"COMPRAR": "ACHETER",
		"ABIERTA": "DEBLOQUE",
		"EL ALTA": "NOUVELLE CARRIERE",
		"DE SALIDA": "DE DEPART",
		"DE TU HERENCIA": "DE TON HERITAGE",
		"SOLAR": "TERRAIN",
		"TE ALCANZA": "TU AS ASSEZ",
		"TE FALTAN {0} ★": "IL MANQUE {0} ★",
		"BOTAS DE BARRIO": "CRAMPONS DU QUARTIER",
		"REFUERZOS": "RENFORTS",
		"Vale en TODAS tus carreras, las de hoy y las que empieces.": "Vaut dans TOUTES tes carrières, celles d'aujourd'hui et celles que tu lanceras.",
		"Al empezar una carrera las eliges en el paso TUS VENTAJAS.": "Au lancement d'une carrière, tu les choisis à l'étape TES ATOUTS.",
		"Lo que se compra aquí no se gana: se hereda. Cada ventaja entra sola en toda carrera nueva, hoy y siempre.": "Ce qui s'achète ici ne se gagne pas : ça s'hérite. Chaque atout entre tout seul dans toute nouvelle carrière, aujourd'hui et pour toujours.",
		"En tu herencia: entra en toda carrera nueva.": "Dans ton héritage : ça entre dans toute nouvelle carrière.",
		"Abierta por TODAS LAS VENTAJAS: en tu herencia, en toda carrera nueva.": "Ouvert par TOUS LES ATOUTS : dans ton héritage, dans toute nouvelle carrière.",
		"Estrellas y la vitrina entera, con dinero real. Son de tu cuenta, no de una carrera: sobreviven a borrar ranuras.": "Des étoiles et la vitrine entière, en argent réel. Elles sont à ton compte, pas à une carrière : elles survivent à l'effacement des emplacements.",
		"Elige una pieza. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "Choisis une pièce. Ce que tu achètes ici t'accompagne dans chaque carrière, celle d'aujourd'hui et celles à venir.",
		"Desde hoy va contigo en cada carrera, las de ahora y las que vengan. No se devuelve.": "Dès aujourd'hui, ça t'accompagne dans chaque carrière, celles d'aujourd'hui et celles à venir. Pas de remboursement.",
		"La vitrina entera, en tu herencia: las veinticuatro en toda carrera nueva.": "La vitrine entière, dans ton héritage : les vingt-quatre dans toute nouvelle carrière.",
		"Ciento cincuenta estrellas: tu primera ventaja, la de nivel 1, sin esperar al primer retiro.": "Cent cinquante étoiles : ton premier atout, celui de niveau 1, sans attendre la première retraite.",
		"Toca una con cadenas y cómprala aquí mismo, con estrellas o con dinero real. Son tuyas para siempre: cada una entra sola en toda carrera nueva.": "Touche une carte enchaînée et achète-la ici même, avec des étoiles ou de l'argent réel. Elles sont à toi pour toujours : chacune entre seule dans chaque nouvelle carrière.",
		"Consigue más en LEGADO, desde el menú.": "Gagnes-en plus dans LEGS, depuis le menu.",
		"CANTERA DE ORO": "PEPINIERE EN OR",
		"Toda carrera nueva arranca con 65 en las ocho habilidades en vez de 60. Es un año de entrenamiento antes de debutar.": "Chaque nouvelle carrière démarre avec 65 dans les huit qualités au lieu de 60. Un an d'entraînement avant de débuter.",
		"LA CARTERA DEL ABUELO": "LE PORTEFEUILLE DU GRAND-PERE",
		"Diez mil de salida en toda carrera nueva, encima de los cinco mil de siempre. Para no vivir al día el primer año.": "Dix mille de plus au départ de chaque nouvelle carrière, en plus des cinq mille habituels. Pour ne pas vivre au jour le jour la première année.",
		"UN AGENTE QUE TE CONOCE": "UN AGENT QUI TE CONNAIT",
		"EL SOLAR DE LA FAMILIA": "LE TERRAIN FAMILIAL",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} compradas · {3} gastadas": "Gagnées à chaque succès et à chaque retraite : {0} de succès · {1} de retraites · {2} achetées · {3} dépensées",
		"No marca ningún logro: LOGROS y Game Center siguen contando sólo lo jugado.": "Ne débloque aucun succès : SUCCES et Game Center ne comptent que ce que tu as joué.",
		"Pagas {0} ★ · te quedan {1} ★": "Tu paies {0} ★ · il te reste {1} ★",
		"Este retiro deja {0} ★ en tu herencia · {1} ★ por gastar en el menú": "Cette retraite laisse {0} ★ dans ton héritage · {1} ★ à dépenser au menu",
		"Ventajas abiertas para tu próxima carrera: {0} de {1}": "Atouts débloqués pour ta prochaine carrière : {0} sur {1}",
		"Toda carrera nueva arranca con unas BARRIO 90 nuevas puestas en vez de las de cantera. Se gastan, como todas.": "Chaque nouvelle carrière démarre avec des BARRIO 90 neuves au lieu des crampons de base. Elles s'usent, comme toutes.",
		"Tu agente empieza cada carrera creyendo en ti: llamadas y encargos desde el primer mes, no a media carrera.": "Ton agent commence chaque carrière en croyant en toi : appels et missions dès le premier mois, pas à mi-carrière.",
		"Un terreno donde construir, en toda carrera nueva. El terreno sin la casa: lo que levantes encima lo pagas tú.": "Un terrain où construire, à chaque nouvelle carrière. Le terrain sans la maison : ce que tu bâtis dessus, tu le paies.",
		"CONSEGUIR ESTRELLAS": "OBTENIR DES ETOILES",
		"UN PUÑADO DE ESTRELLAS": "UNE POIGNEE D'ETOILES",
		"REINICIAR PARTIDO": "REJOUER LE MATCH",
		"YA PAGADO": "DEJA PAYE",
		"La App Store no ha devuelto la ficha. Entra con conexión y vuelve a probar.": "L'App Store n'a pas renvoyé la fiche. Connecte-toi et réessaie.",
		"BRONCE": "BRONZE",
		"PLATA": "ARGENT",
		"DIAMANTE": "DIAMANT",
		"BUEN TOQUE": "BON TOUCHER",
		"Le pegas con rosca desde niño: +4 de efecto desde el debut.": "Tu brosses le ballon depuis tout petit : +4 en effet dès tes débuts.",
		"PULMONES": "POUMONS",
		"Ibas corriendo al colegio y de vuelta: +4 de físico desde el debut.": "Tu allais à l'école en courant, aller et retour : +4 en physique dès tes débuts.",
		"LOS AHORROS": "LES ECONOMIES",
		"La familia guardó para tu debut: veinticinco mil de salida en toda carrera nueva.": "La famille a mis de côté pour tes débuts : vingt-cinq mille au départ de chaque nouvelle carrière.",
		"El vestuario te sigue antes de que abras la boca: el equipo nunca por debajo de 55.": "Le vestiaire te suit avant que tu ouvres la bouche : l'équipe jamais sous 55.",
		"EL CEREBRO": "LE CERVEAU",
		"Ves la jugada antes que nadie: +6 de visión y +3 de precisión y efecto.": "Tu vois l'action avant tout le monde : +6 en vision et +3 en précision et effet.",
		"EL RELOJ DEL ABUELO": "LA MONTRE DU GRAND-PERE",
		"Un reloj de lujo que ya era de la familia: la prensa te mira distinto desde el primer día.": "Une montre de luxe déjà dans la famille : la presse te regarde autrement dès le premier jour.",
		"SUPERDOTADO": "SURDOUE",
		"Naciste para esto: 8 puntos de habilidad por repartir antes de debutar.": "Né pour ça : 8 points de compétence à répartir avant tes débuts.",
		"LA FORTUNA FAMILIAR": "LA FORTUNE FAMILIALE",
		"Doscientos cincuenta mil de salida en toda carrera nueva. Nunca vas a vivir al día.": "Deux cent cinquante mille au départ de chaque nouvelle carrière. Tu ne vivras jamais au jour le jour.",
		"La vitrina entera, en tu herencia: todas en toda carrera nueva.": "Toute la vitrine, dans ton héritage : toutes dans chaque nouvelle carrière.",

		"BAJO LOS FOCOS": "SOUS LES PROJECTEURS",
		"CON PADRINO": "BIEN PISTONNE",
		"LA DINASTIA": "LA DYNASTIE",
		"CUERPO DE ATLETA": "CORPS D'ATHLETE",
		"PURO TALENTO": "PUR TALENT",
		"Llegas ya famoso: la grada te corea, la prensa te sigue y el seleccionador sabe tu nombre.": "Tu arrives déjà célèbre : la tribune scande ton nom, la presse te suit et le sélectionneur te connaît.",
		"Tu agente contesta, el vestuario te respeta y firmas el debut un rol más arriba.": "Ton agent répond, le vestiaire te respecte et tu signes ton premier contrat un rôle plus haut.",
		"Naces con herencia: un cuarto de millón en el banco, el terreno del abuelo y la casa del viejo.": "Tu nais avec un héritage : un quart de million à la banque, le terrain du grand-père et la maison du vieux.",
		"Un cuerpo que no se rompe: piernas de niño, 20 % menos lesiones y fisio gratis toda la carrera.": "Un corps qui ne casse pas : des jambes de gamin, 20 % de blessures en moins et le kiné gratuit toute la carrière.",
		"Naces crack: 65 en todo, ocho puntos por repartir y un disparo que asusta desde el primer partido.": "Tu nais crack : 65 partout, huit points à répartir et une frappe qui fait peur dès le premier match.",
		"PACKS": "PACKS",
		"COMPRAR PACK": "ACHETER LE PACK",
		"TAMBIÉN TUYAS": "A TOI AUSSI",
		"Cinco packs de tres ventajas. Cada una entra sola en toda carrera nueva, hoy y siempre.": "Cinq packs de trois atouts. Chacun entre seul dans chaque nouvelle carrière, aujourd'hui et pour toujours.",
		"En tu herencia: sus tres ventajas entran en toda carrera nueva.": "Dans ton héritage : ses trois atouts entrent dans chaque nouvelle carrière.",
		"YA TIENES {0} DE 3: con estrellas pagas sólo lo que te falta.": "TU EN AS {0} SUR 3 : avec des étoiles, tu ne paies que ce qui manque.",
		"Y {0} ventajas sueltas de antes, tuyas: entran igual en cada carrera.": "Et {0} atouts à l'unité d'avant, à toi : ils entrent quand même dans chaque carrière.",
		"Elige un pack. Lo que compres aquí te acompaña en cada carrera, la de hoy y las que vengan.": "Choisis un pack. Ce que tu achètes ici t'accompagne dans chaque carrière, celle d'aujourd'hui et celles à venir.",
		"Toca una con cadenas y compra su pack aquí mismo, con estrellas o con dinero real. Es tuyo para siempre: sus tres ventajas entran solas en toda carrera nueva.": "Touche une carte enchaînée et achète son pack ici même, avec des étoiles ou de l'argent réel. Il est à toi pour toujours : ses trois atouts entrent seuls dans chaque nouvelle carrière.",
		"Las estrellas se ganan jugando: con cada logro y con cada retiro.": "Les étoiles se gagnent en jouant : à chaque succès et à chaque retraite.",
		"Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} gastadas": "Gagnées à chaque succès et à chaque retraite : {0} de succès · {1} de retraites · {2} dépensées",

		"¡DOBLETE DE {0}!": "DOUBLE DE {0} !",
		"¡TERCERO DE {0}: HAT-TRICK!": "ENCORE {0} : TRIPLE !",
		"¡CUATRO DE {0}! SÚPER HAT-TRICK": "QUATRE POUR {0} ! UN QUADRUPLE",
		"¡CINCO DE {0}! LA MANITA": "CINQ POUR {0} ! LA MANITA",
		"¡{1} GOLES DE {0}! DE LEYENDA": "{1} BUTS DE {0} ! LEGENDAIRE",
		"¡OTRA ASISTENCIA DE {0}! VAN DOS": "ENCORE UNE PASSE DE {0} ! DEUX",
		"¡TERCERA ASISTENCIA DE {0}!": "TROISIEME PASSE DECISIVE DE {0} !",
		"¡{1} ASISTENCIAS DE {0}!": "{1} PASSES DECISIVES DE {0} !",
		"{0} YA LLEVA TRES PARADAS": "DEJA TROIS ARRETS POUR {0}",
		"¡CINCO PARADAS DE {0}!": "CINQ ARRETS DE {0} !",
		"¡{1} PARADAS! {0} ES UN MURO": "{1} ARRETS ! {0} EST UN MUR",
		"{0} YA TENÍA AMARILLA ({1}')": "{0} ETAIT DEJA AVERTI ({1}')",
		"¡OTRA ROJA! TU EQUIPO SE QUEDA CON NUEVE": "ENCORE UN ROUGE ! TON EQUIPE JOUE A NEUF",
		"¡OTRA ROJA! EL RIVAL SE QUEDA CON NUEVE": "ENCORE UN ROUGE ! L'ADVERSAIRE JOUE A NEUF",
		"YA SON TRES AMARILLAS DE TU EQUIPO": "DEJA TROIS JAUNES POUR TON EQUIPE",
		"YA SON TRES AMARILLAS DEL RIVAL": "DEJA TROIS JAUNES POUR L'ADVERSAIRE",
		"¡CINCO AMARILLAS DE TU EQUIPO!": "CINQ JAUNES POUR TON EQUIPE !",
		"¡CINCO AMARILLAS DEL RIVAL!": "CINQ JAUNES POUR L'ADVERSAIRE !",
	},

	"salon_fama": {
		"SALÓN DE LA FAMA": "PANTHEON",
		"ESPERAN SU PLACA": "EN ATTENTE DE PLAQUE",
		"TUS LEYENDAS": "TES LEGENDES",
		"Aún no hay placas. Cuando una carrera se retire, cuelga aquí su placa: su ranura queda libre para empezar otra y su historia se queda en este salón.": "Pas encore de plaques. Quand une carrière s'achève, accroche ici sa plaque : son emplacement se libère pour en commencer une autre, et son histoire reste dans ce panthéon.",
		"RANURA {0} · RETIRADO": "EMPLACEMENT {0} · RETRAITE",
		"Antes de colgarla, termina su despedida: entra en su carrera desde el menú.": "Avant de l'accrocher, termine son adieu : ouvre cette carrière depuis le menu.",
		"COLGAR SU PLACA": "ACCROCHER SA PLAQUE",
		"¿COLGAR SU PLACA?": "ACCROCHER SA PLAQUE ?",
		"La carrera de {0} sale de la RANURA {1} y se queda en el SALÓN DE LA FAMA. La ranura queda libre para empezar otra.": "La carrière de {0} quitte l'EMPLACEMENT {1} et reste au PANTHEON. L'emplacement se libère pour en commencer une autre.",
		"En el salón se queda su placa: cifras, trofeos y clubes. La partida y su museo se borran. Esto no se puede deshacer.": "Sa plaque reste au panthéon : chiffres, trophées et clubs. La partie et son musée sont effacés. C'est irréversible.",
		"No se pudo. La carrera sigue donde estaba.": "Impossible. La carrière est toujours à sa place.",
		"COLGAR MI PLACA": "ACCROCHER MA PLAQUE",
		"Pieza de Museo": "Pièce de Musée",
		"Entrar por primera vez al museo de tu carrera.": "Entrer pour la première fois dans le musée de ta carrière.",
	},

	"casa_legado": {
		"MESA DE PING-PONG": "TABLE DE PING-PONG",
		"VITRINA DEL CAPITÁN": "VITRINE DU CAPITAINE",
		"POSADERO PARA LORO": "PERCHOIR POUR PERROQUET",
		"Mesa con red y palas. Juega al ping-pong contra un rival.": "Table avec filet et raquettes. Affronte un adversaire au ping-pong.",
		"Tu capitanía bajo cristal. Conserva los nombramientos ganados.": "Ton capitanat sous verre. Conserve les nominations méritées.",
		"Rama de madera con agua y semillas. Tu loro descansa aquí.": "Branche en bois avec eau et graines. Ton perroquet se repose ici.",
		"JUGAR PING-PONG": "JOUER AU PING-PONG",
		"VER BRAZALETES": "VOIR LES BRASSARDS",
		"TUS BRAZALETES": "TES BRASSARDS",
		"El nombramiento se gana jugando. La vitrina conserva tus brazaletes.": "La nomination se mérite sur le terrain. La vitrine conserve tes brassards.",
		"Tu primer brazalete aparecerá cuando te nombren capitán.": "Ton premier brassard apparaîtra quand tu seras nommé capitaine.",
		"CAPITÁN DE LA SELECCIÓN": "CAPITAINE DE LA SELECTION",
		"CAPITÁN DEL CLUB": "CAPITAINE DU CLUB",
		"REGISTRADO EN LA TEMPORADA {0}": "ENREGISTRE EN SAISON {0}",
		"Esta partida ya tenía la capitanía. Se conserva la vigente, sin inventar fechas anteriores.": "Cette partie avait déjà un capitanat. Le capitanat actuel est conservé, sans inventer de dates antérieures.",
		"PING-PONG": "PING-PONG",
		"A 11 puntos, con ventaja de 2. Punto decisivo en 20-20.": "À 11 points, avec 2 points d’écart. Point décisif à 20–20.",
		"ARRASTRA AQUÍ PARA MOVER LA PALA": "GLISSE ICI POUR BOUGER LA RAQUETTE",
		"IZQUIERDA": "GAUCHE",
		"CENTRO": "CENTRE",
		"DERECHA": "DROITE",
		"Mueve la pala con el dedo. El golpe es automático.": "Déplace la raquette avec le doigt. La frappe est automatique.",
		"Compra la mesa de ping-pong para jugar.": "Achète la table de ping-pong pour jouer.",
		"Elige dónde devolver: izquierda, centro o derecha.": "Choisis où renvoyer : gauche, centre ou droite.",
		"GANÓ EL RIVAL": "L’ADVERSAIRE A GAGNE",
		"REVANCHA": "REVANCHE",
		"TU SAQUE": "TON SERVICE",
		"SAQUE RIVAL": "SERVICE ADVERSE",
		"SACAR": "SERVIR",
		"PUNTO PARA TI": "POINT POUR TOI",
		"PUNTO PARA EL RIVAL": "POINT POUR L’ADVERSAIRE",
		"DEVOLUCIONES: {0}": "RENVOIS : {0}",
		"AHORA ENFRENTE": "DESORMAIS EN FACE",
		"AHORA JUEGA EN {0}": "JOUE DESORMAIS A {0}",
		"DEBUTA": "PREMIERE",
		"EL DEBUT DEL CHAVAL": "LES DEBUTS DU GAMIN",
		"EL QUE SE FUE": "CELUI QUI EST PARTI",
		"FICHA POR {0}": "SIGNE A {0}",
		"FIRMA SU PLAYERA": "SIGNE SON MAILLOT",
		"Firmó su primer contrato. Quiso que estuvieras tú a su lado.": "Il a signé son premier contrat. Il voulait que tu sois à ses côtés.",
		"Hoy entra por primera vez. Tú te acuerdas de lo que se siente.": "Aujourd'hui il entre pour la première fois. Tu te souviens de ce que ça fait.",
		"LA CANTERA": "LE CENTRE DE FORMATION",
		"LLEGA DE LA CANTERA": "ISSU DU CENTRE DE FORMATION",
		"La encontró colgada en su taquilla. No hizo falta decir nada.": "Il l'a trouvé accroché dans son casier. Pas besoin de mots.",
		"Lo viste debutar a tu lado. Hoy te va a tocar marcarlo.": "Tu l'as vu débuter à tes côtés. Aujourd'hui, il faudra le marquer.",
		"Lo viste debutar. Ahora lo cuentan en la tele del bar.": "Tu l'as vu débuter. Maintenant, c'est à la télé du bar.",
		"PRIMER CONTRATO": "PREMIER CONTRAT",
		"PRIMER CONTRATO PROFESIONAL": "PREMIER CONTRAT PRO",
		"Podía correr a la grada. Corrió hacia ti.": "Il pouvait courir vers la tribune. Il a couru vers toi.",
		"SU PRIMER CONTRATO": "SON PREMIER CONTRAT",
		"SU PRIMER GOL": "SON PREMIER BUT",
		"Se quedó con la playera en blanco en las manos. No dijo nada.": "Il est resté avec le maillot vierge dans les mains. Il n'a rien dit.",
		"TU DORSAL ES SUYO": "TON NUMERO EST A LUI",
		"{0} AÑOS · CANTERA": "{0} ANS · CENTRE DE FORMATION",
		"{0} AÑOS · PRIMER GOL": "{0} ANS · PREMIER BUT",
		"{0} AÑOS · PRIMER PARTIDO": "{0} ANS · PREMIER MATCH",
		"«Mi sueño es jugar junto a ti pronto.»": "« Mon rêve, c'est de jouer à tes côtés bientôt. »",
		"«Mi sueño es jugar junto a ti pronto.» Ya está aquí.": "« Mon rêve, c'est de jouer à tes côtés bientôt. » Le voilà.",
		"—¿Me firmas la playera?": "« Tu me signes mon maillot ? »",
		"PRESENTADO": "PRESENTE",
		"Tu ahijado ya tiene dorsal. Esta temporada jugáis juntos.": "Ton filleul a son numéro. Cette saison, vous jouez ensemble.",
		"DESPUÉS DEL ENTRENO": "APRES L'ENTRAINEMENT",
		"—Me quedé para verte. ¿Me enseñas a pegarle como tú?": "« Je suis resté pour te voir. Tu m'apprends à frapper comme toi ? »",
		"IRTE": "PARTIR",
		"UNA HORA MÁS": "UNE HEURE DE PLUS",
		"Se fue a casa ya de noche, con el balón bajo el brazo.": "Il est rentré à la nuit tombée, le ballon sous le bras.",
		"Recogió el balón y se quedó tirando solo.": "Il a ramassé le ballon et a continué à tirer seul.",
		"SU PADRINO": "SON PARRAIN",
		"SUBE AL PRIMER EQUIPO": "MONTE EN EQUIPE PREMIERE",
		"—Lo subimos contigo. ¿Quieres ser su padrino?": "« On le fait monter avec toi. Tu veux être son parrain ? »",
		"TU AHIJADO": "TON FILLEUL",
		"La temporada que viene, jugará a tu lado.": "La saison prochaine, il jouera à tes côtés.",
		"SIGUE EN LA CANTERA": "RESTE AU CENTRE DE FORMATION",
		"El director asintió. El niño miró al suelo.": "Le directeur a hoché la tête. Le gamin a baissé les yeux.",
		"El Ahijado": "Le Filleul",
		"Apadrinar a un niño de la cantera hasta el primer equipo.": "Parrainer un gamin du centre de formation jusqu'en équipe première.",
		"VER SALÓN": "LEGENDES",
		"ESCALÓN": "PALIER",
		"AQUÍ EMPEZASTE": "TES DEBUTS",
		"PARED DE REFLEJOS": "MUR DE REFLEXES",
		"MEMORAMA": "MEMORY",
		"JUGAR REFLEJOS": "JOUER AUX REFLEXES",
		"JUGAR MEMORAMA": "JOUER AU MEMORY",
		"¡RÉCORD!": "RECORD !",
		"ANTES {0}": "AVANT {0}",
		"RÉCORD {0}": "RECORD {0}",
		"RÉCORDS · {0}": "RECORDS · {0}",
		"MS": "MS",
		"NO TOQUES": "EVITE",
		"TOCA": "TOUCHE",
		"REFLEJO": "REACTION",
		"TIEMPO": "TEMPS",
		"COMPLETADO": "TERMINE",
		"MEMORIZA": "MEMORISE",
		"MOVIMIENTOS": "COUPS",
		"TU COLECCIÓN": "TA COLLECTION",
		"{0} S": "{0} S",
		"memoramaEN JUEGO": "EN JEU",
		"memoramaPAREJAS": "PAIRES",
		"reflejosRACHA": "SERIE",
		"Pared de luces: toca la que se enciende. Récord de reflejos.": "Mur de lumières : touche celle qui s'allume. Record de réflexes.",
		"Mesa de cartas con tu colección: encuentra las parejas.": "Table de cartes avec ta collection : trouve les paires.",
	},


	"pique": {
		"CALMA": "CALME",
		"ENCÁRATE": "FAIS-LUI FACE",
		"{0} TE BUSCA": "{0} TE CHERCHE",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE ENCARAN": "{0} DONNE UN COUP DE PIED PAR DERRIERE A {1} ET ILS SE FONT FACE",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1}, QUE NO RESPONDE": "{0} DONNE UN COUP DE PIED PAR DERRIERE A {1}, QUI NE REPOND PAS",
		"notaTEMPLE": "SANG-FROID",
		"notaAMARILLA": "CARTON JAUNE",
		"Otra vez le ganas a {0}. Ya no le hace ninguna gracia.": "Tu as encore battu {0}. Ça ne l'amuse plus du tout.",
		"{0} ya te tiene entre ceja y ceja.": "{0} t'a dans le collimateur.",
		"{0} va a por ti, no a por el balón. Patada por detrás.": "{0} vise l'homme, pas le ballon. Coup de pied par derrière.",
		"Ni mira la pelota: {0} te pega por detrás.": "Il ne regarde même pas le ballon : {0} te frappe par derrière.",
		"Te levantas y te vas a por {0}. Frente con frente.": "Tu te relèves et tu vas droit sur {0}. Front contre front.",
		"No te lo callas: cara a cara con {0}, y la grada se enciende.": "Tu ne laisses pas passer : face à face avec {0}, et les tribunes s'enflamment.",
		"{0} te busca y no te encuentra. Te das la vuelta.": "{0} te cherche et ne te trouve pas. Tu tournes les talons.",
		"Ni lo miras. {0} se queda con el dedo en el aire.": "Tu ne le regardes même pas. {0} reste le doigt en l'air.",
		"{1} NO LE PIERDE LA PISTA A {0}": "{1} NE LACHE PAS {0} D'UNE SEMELLE",
		"{0} SE LE ESCAPA A {1} UNA Y OTRA VEZ": "{0} ECHAPPE A {1} ENCORE ET ENCORE",
		"AMBIENTE CALDEADO ENTRE {0} Y {1}": "AMBIANCE ELECTRIQUE ENTRE {0} ET {1}",
		"CADA BALÓN ENTRE {0} Y {1} ES UNA GUERRA": "CHAQUE BALLON ENTRE {0} ET {1} EST UNE GUERRE",
		"{0} NO ENTRA AL TRAPO Y SIGUE A LO SUYO": "{0} NE MORD PAS A L'HAMEÇON ET CONTINUE SON MATCH",
		"{1} BUSCA LA REACCIÓN DE {0} Y NO LA ENCUENTRA": "{1} CHERCHE A FAIRE REAGIR {0}, EN VAIN",
		"SIN {1} EN EL CAMPO, {0} RESPIRA": "SANS {1} SUR LE TERRAIN, {0} RESPIRE",
		"{1} JUEGA CON LA AMARILLA A CUESTAS": "{1} JOUE AVEC UN JAUNE SUR LE DOS",
		"{0} JUEGA AL LÍMITE CON LA AMARILLA": "{0} JOUE SUR LE FIL AVEC UN JAUNE",
		"Viven en tu casa y cobran cada jornada.": "Ils vivent chez toi et sont payés à chaque journée.",

		"¡Derribaste el dron de la tele!": "Tu as abattu le drone de la télé !",
		"Señal Perdida": "Signal Perdu",
		"Derribar el dron de la tele de un balonazo.": "Abattre le drone de la télé d'un tir.",
		"Algunos partidos los graba un dron desde el cielo.": "Certains matchs sont filmés par un drone dans le ciel.",

		"¡Balón de playa en el área!": "Ballon de plage dans la surface !",
		"¡Desvío en el balón de playa!": "Dévié par le ballon de plage !",
		"Gol de Playa": "But de Plage",
		"Marcar un gol desviado por el balón de playa.": "Marquer un but dévié par le ballon de plage.",
		"A veces cae algo inflable desde la grada.": "Parfois, quelque chose de gonflable tombe des tribunes.",

		"¡Le volaste el celular a un fan!": "Tu as fait voler le portable d'un fan !",
		"¡Tu balonazo se hizo viral!": "Ta frappe est devenue virale !",
		"REC": "REC",
		"{0} vistas": "{0} vues",
		"Se Hizo Viral": "Devenu Viral",
		"Tirarle el celular a un fan que te graba.": "Faire tomber le portable d'un fan qui te filme.",
		"Hay quien graba el partido desde detrás de la valla.": "Quelqu'un filme le match derrière les panneaux.",
		"Tangana en pleno derbi: {0} te empuja y se forma el corro.": "Bousculade en plein derby : {0} te pousse et tout le monde s'attroupe.",
		"Empujones entre los dos equipos. {0} lo empezó y el árbitro tiene que meterse en medio.": "Bousculade entre les deux équipes. {0} a commencé et l'arbitre doit s'interposer.",
		"{0} LE PEGA UNA PATADA POR DETRÁS A {1} Y SE MONTA LA TANGANA": "{0} TACLE {1} PAR DERRIERE ET CA CHAUFFE",
		"LA TANGANA DEJA EL DERBI AL ROJO VIVO": "LA BOUSCULADE EMBRASE LE DERBY",
		"DESDE LA TANGANA, {1} Y {0} NO SE QUITAN LA VISTA": "DEPUIS LA BOUSCULADE, {1} ET {0} SE GUETTENT",
		"{0} ARRASTRA LA AMARILLA DE LA TANGANA": "{0} PORTE LE JAUNE DE LA BOUSCULADE",
		"Y en los bares sólo se habla de la tangana.": "Et dans les bars, on ne parle que de la bousculade.",
	},


	"editor_estadio_derbi": {
		"ESTADIO": "STADE",
		"estadioPLANTA": "PLAN",
		"VOLVER AL ESTADIO AUTOMATICO": "STADE AUTOMATIQUE",
		"El nombre sale en la carátula de TV y en el hub. La planta es la forma de las gradas en el partido.": "Le nom apparaît sur l'habillage TV et dans le hub. Le plan est la forme des tribunes pendant le match.",
		"SIN DERBI": "SANS DERBY",
		"VOLVER AL DERBI AUTOMATICO": "DERBY AUTOMATIQUE",
		"Es el partido con más ambiente del año. Tiene que ser del mismo país; puede ser de otra división.": "C'est le match le plus chaud de l'année. Même pays obligatoire ; une autre division est possible.",
		"ELIGE SU RIVAL DE DERBI": "CHOISIS SON RIVAL DE DERBY",
		"Tiene que ser del mismo país.\nPuede ser de otra división.": "Même pays obligatoire.\nUne autre division est possible.",
		"DERBI DE: {0}": "DERBY DE : {0}",
		"{0} y {1} pasan a ser rivales de derbi.": "{0} et {1} deviennent rivaux de derby.",
		"Los rivales que tenían hasta hoy se quedan sin derbi, y el juego les busca otro.": "Leurs rivaux d'aujourd'hui perdent leur derby, et le jeu leur en trouve un autre.",
		"AÑADIR OTRO DERBI": "AJOUTER UN DERBY",
		"Hasta tres rivales; el primero es el derbi principal.": "Jusqu'à trois rivaux ; le premier est le derby principal.",
		"Se suma a los derbis que ya tenían elegidos.": "Il s'ajoute aux derbys déjà choisis.",
		"Es el partido con más ambiente del año. Puede ser de cualquier confederación; sus otros rivales de siempre se quedan.": "C'est le match le plus chaud de l'année. Il peut venir de n'importe quelle confédération ; ses autres rivaux habituels restent.",
		"Puede ser de cualquier confederación.": "Peut venir de n'importe quelle confédération.",
		"El rival que cada una tenía elegido vuelve a los suyos de siempre.": "Le rival que chacune avait choisi retrouve ses rivaux habituels.",
		"derbi con selección desconocida: {0}": "derby avec une sélection inconnue : {0}",
		"derbi consigo misma: {0}": "derby avec elle-même : {0}",
		"Las carreras ya empezadas lo estrenan al volver a cargar la partida.": "Les carrières déjà lancées l'auront au prochain chargement de la partie.",
		"CONFIRMAR DERBI": "CONFIRMER LE DERBY",
		"· DERBI: {0}": "· DERBY : {0}",
		"· ESTADIO": "· STADE",
		"derbi": "derby",
		"derbis": "derbys",
		"Su estadio y su derbi, también.": "Son stade et son derby aussi.",
		"derbi con club desconocido: {0}": "derby avec un club inconnu : {0}",
		"demasiados derbis para: {0}": "trop de derbys pour : {0}",
		"derbi entre países distintos: {0}": "derby entre deux pays : {0}",
		"CUENCO CERRADO": "CUVETTE FERMEE",
		"CUATRO TRIBUNAS": "QUATRE TRIBUNES",
		"HERRADURA": "FER A CHEVAL",
		"TRIBUNA EN L": "TRIBUNE EN L",
		"DOS TRIBUNAS": "DEUX TRIBUNES",
		"CON PISTA": "AVEC PISTE",
		"CUENCO REDONDO": "CUVETTE RONDE",
		"COLISEO": "COLISEE",
		"OCTAGONO": "OCTOGONE",
		"CATEDRAL": "CATHEDRALE",
		"VELAS": "VOILES",
		"DOS ANILLOS": "DEUX ANNEAUX",
		"MEMBRANA": "MEMBRANE",
		"TRIBUNA ALTA": "TRIBUNE HAUTE",
		"CALDERA": "CHAUDRON",
		"TRIBUNA DOBLE": "TRIBUNE DOUBLE",
		"TECHO DE TELA": "TOIT EN TOILE",
		"FONDO ALTO": "VIRAGE HAUT",
		"FONDO EN BLOQUES": "VIRAGE EN BLOCS",
		"SIN FONDO, ARBOLES": "SANS VIRAGE, ARBRES",
		"TECHO A DOS AGUAS": "TOIT A DEUX PANS",
		"CAMPO HUNDIDO": "TERRAIN ENCAISSE",
		"PANTALLA GIGANTE": "ECRAN GEANT",
		"ARCO AL FONDO": "ARCHE AU FOND",
		"TERRAPLEN": "TALUS",
		"GRADAS TUBO": "TRIBUNES TUBE",
		"MURO DE PIE": "MUR DEBOUT",
		"TRES ANILLOS": "TROIS ANNEAUX",
		"FONDO DE BANDERAS": "VIRAGE AUX DRAPEAUX",
		"TRIBUNA CON POSTES": "TRIBUNE A POTEAUX",
		"TORRE DEL RELOJ": "TOUR DE L'HORLOGE",
		"CAMPO CON COCHES": "TERRAIN AUX VOITURES",
		"FONDO DE CHIMENEAS": "VIRAGE AUX CHEMINEES",
		"PIEL ENVOLVENTE": "PEAU ENVELOPPANTE",
		"LATERAL PLANO": "LATERAL PLAT",
		"ANILLO COLGADO": "ANNEAU SUSPENDU",
		"TECHO DE DIENTES": "TOIT EN DENTS",
		"COLUMNATA": "COLONNADE",
		"TECHO FLOTANTE": "TOIT FLOTTANT",
		"TORRES CON RAMPA": "TOURS A RAMPE",
		"CALABAZA": "CITROUILLE",
		"PUERTA MONUMENTAL": "PORTE MONUMENTALE",
		"OLA DE VIDRIO": "VAGUE DE VERRE",
		"OLIMPICO DE PIEDRA": "OLYMPIQUE DE PIERRE",
		"COLOSO": "COLOSSE",
		"CAJON VERTICAL": "BOITE VERTICALE",
		"HERRADURA DE TRES PISOS": "FER A CHEVAL 3 ETAGES",
		"TRES GRADAS ABIERTAS": "TROIS GRADINS OUVERTS",

		"TU ESTADO": "TON STATUT",
		"LO DECIDE LA DIRECTIVA": "LA DIRECTION DECIDE",
		"SI PAGAN": "S'ILS PAIENT",
		"La directiva te bloquea {0} ofertas": "La direction bloque {0} offres pour toi",
		"Tu club rechaza las ofertas por ti: sólo la cláusula te saca.": "Ton club refuse les offres pour toi : seule la clause te libère.",
		"Tu club no te retiene.": "Ton club ne te retient pas.",
		"Si alguien paga lo que pide tu club, te vende.": "Si quelqu'un paie ce que demande ton club, il te vend.",
		"Hoy tu club no negocia por ti.": "Pour l'instant ton club ne négocie pas pour toi.",
		"Tu club te ofrece a quien pregunte.": "Ton club te propose à quiconque demande.",
		"No estás en venta.": "Tu n'es pas à vendre.",
		"La directiva dijo NO: no cuentas lo bastante. Puedes volver a pedirlo la temporada que viene.": "La direction a dit NON : tu ne comptes pas assez. Tu pourras redemander la saison prochaine.",
		"PEDIR QUE NO ME VENDAN": "NE PAS ETRE VENDU",
		"¿PEDIR QUE NO TE VENDAN?": "NE PAS ETRE VENDU ?",
		"Lo decide la directiva, una vez por temporada. Si dice que sí, rechaza las ofertas por ti este año. La cláusula sigue valiendo.": "La direction décide, une fois par saison. Si elle dit oui, elle refuse les offres pour toi cette année. La clause reste valable.",
		"LA DIRECTIVA DICE SÍ": "LA DIRECTION DIT OUI",
		"LA DIRECTIVA DICE NO": "LA DIRECTION DIT NON",
		"Pedir el traspaso te pone en venta y te quita minutos hasta que salgas. La cesión, si no eres titular.": "Demander un transfert te met en vente et te coûte du temps de jeu jusqu'à ton départ. Le prêt, si tu n'es pas titulaire.",

		"Quiere venir: sale sin cláusula (+{0} %).": "Veut venir : part sans clause (+{0} %).",

		"TU OFERTA": "TON OFFRE",
		"OFRECER": "OFFRIR",
		"INTENTOS": "ESSAIS",
		"PACTADO": "CONVENU",
		"Trato cerrado ({0}). Te queda {1}.": "Accord conclu ({0}). Il te reste {1}.",
		"No aceptan. Piden {0}.": "Refusé. Ils demandent {0}.",

		"NO FIRMAR": "NE PAS SIGNER",
		"TE FUISTE SIN FIRMAR": "TU ES PARTI SANS SIGNER",
		"La valla te vio pasar. Mañana lo contará.": "La barrière t'a vu passer. Demain, tout le monde le saura.",
		"Cien Firmas": "Cent Signatures",
		"Firmar 100 autógrafos.": "Signer 100 autographes.",
		"Mil Firmas": "Mille Signatures",
		"Firmar 1.000 autógrafos.": "Signer 1 000 autographes.",
		"La Mano de Oro": "La Main d'Or",
		"Firmar 10.000 autógrafos.": "Signer 10 000 autographes.",
		"UN FAN TE PARA": "UN FAN T'ARRETE",
		"EN EL AEROPUERTO": "A L'AEROPORT",
		"EN EL TÚNEL": "DANS LE TUNNEL",
		"EN LA CENA": "AU DINER",
		"SEMANA DE DERBI": "SEMAINE DE DERBY",
		"{0} AUTÓGRAFOS EN TU CARRERA": "{0} AUTOGRAPHES EN CARRIERE",
		"FIRMA EN LA TERMINAL": "SIGNATURE AU TERMINAL",
		"El grupo esperó un minuto en la puerta de embarque.": "Le groupe a attendu une minute à la porte d'embarquement.",
		"DIRECTO AL AVIÓN": "DIRECT A L'AVION",
		"Ni lo miraste. El grupo llegó puntual.": "Tu ne l'as même pas regardé. Le groupe était à l'heure.",
		"EL NIÑO DEL TÚNEL": "L'ENFANT DU TUNNEL",
		"Sale al campo de tu mano con tu firma puesta.": "Il entre sur le terrain en te tenant la main, ta signature sur le maillot.",
		"LO DEJASTE PLANTADO": "TU L'AS PLANTE LA",
		"Las cámaras del túnel lo grabaron todo.": "Les caméras du tunnel ont tout filmé.",
		"FIRMA EN LA CENA": "SIGNATURE AU DINER",
		"A tu pareja se le enfrió el plato.": "L'assiette de ta moitié a refroidi.",
		"ESTA NOCHE NO": "PAS CE SOIR",
		"Hoy cenabas con tu pareja. Lo entendió… o casi.": "Ce soir, tu dînais en couple. Message compris… ou presque.",
		"FIRMASTE AL RIVAL": "MAILLOT RIVAL SIGNE",
		"Tu firma en la camiseta del rival. Mañana sale en portada.": "Ta signature sur le maillot du rival. En une demain.",
		"ESA CAMISETA, NO": "PAS CE MAILLOT",
		"Tu grada aplaude que no la firmaras.": "Tes supporters applaudissent ton refus.",
		"EL HINCHA DE SIEMPRE": "LE SUPPORTER DE TOUJOURS",
		"NO VOLVERÁ": "IL NE REVIENDRA PAS",
		"Le firmaste la primera hace {0} temporadas. Sigue aquí.": "Tu lui as signé la première il y a {0} saisons. Il est toujours là.",
		"Ahora trae a su hijo. Hace {0} temporadas, el niño era él.": "Maintenant il amène son fils. Il y a {0} saisons, l'enfant, c'était lui.",
		"Te esperó {0} temporadas. No volverá a pedírtelo.": "Il t'a attendu {0} saisons. Il ne te le demandera plus.",
		"EL FOTÓGRAFO": "LE PHOTOGRAPHE",
		"La foto era con {0}. Tú sólo sujetabas el móvil.": "La photo, c'était avec {0}. Toi, tu tenais le téléphone.",
	},


	"descanso_pactado": {
		"PEDIR DESCANSO": "DEMANDER REPOS",
		"EL MÍSTER DICE QUE NO": "LE COACH DIT NON",
		"Hoy no. Éste es de los que se juegan.": "Pas aujourd'hui. Celui-là, on le joue.",
		"Hoy te necesito. Este partido pesa demasiado.": "Aujourd'hui j'ai besoin de toi. Ce match pèse trop lourd.",
		"Aquí juegan los once de siempre. Tú también.": "Ici, ce sont les onze habituels qui jouent. Toi aussi.",
		"Contra éste te quiero en el campo. Juegas.": "Contre eux, je te veux sur le terrain. Tu joues.",
		"Me lo pides tú y te lo concedo. ¿Banca por si hace falta, descansas del todo, o al final juegas?": "C'est toi qui me le demandes, alors d'accord. Sur le banc au cas où, repos complet, ou tu joues finalement ?",
		"¿JUEGAS O DESCANSAS?": "JOUER OU SOUFFLER ?",
		"EL MÍSTER DECIDE": "LE COACH DECIDE",
		"Entonces sales de inicio. Que se note que lo querías.": "Alors tu es titulaire. Montre que tu le voulais.",
		"Te quiero fresco, pero a mano. Si se tuerce, entras.": "Je te veux frais, mais sous la main. Si ça tourne mal, tu entres.",
		"Descansa. Te quiero entero para lo que viene.": "Repose-toi. Je te veux entier pour la suite.",
		"Contra éste no te necesito de inicio y después viene {0}. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "Contre eux, je n'ai pas besoin de toi d'entrée, et ensuite il y a {0}. Tu joues, tu restes sur le banc au cas où, ou tu te reposes ?",
		"Contra éste no te necesito de inicio. ¿Juegas, te quedas en la banca por si hace falta o descansas?": "Contre eux, je n'ai pas besoin de toi d'entrée. Tu joues, tu restes sur le banc au cas où, ou tu te reposes ?",
		"BANCA, POR SI HACE FALTA": "BANC, AU CAS OU",
		"DECISIÓN": "DECISION",
		"EL MÍSTER QUIERE HABLAR CONTIGO": "LE COACH VEUT TE PARLER",
		"DESCANSAS": "REPOS",
		"Te quiere entero para el partido grande que viene.": "Le coach te veut entier pour le grand match qui arrive.",
		"Llegas justo de energía. Hoy no te vistes.": "Tu manques d'énergie. Aujourd'hui, tu n'es pas convoqué.",
		"Contra este rival te guarda. Si el partido se tuerce, entras.": "Contre cet adversaire, le coach te garde en réserve. Si le match tourne mal, tu entres.",
		"DESPUÉS": "APRES",
		"EL MÍSTER TE GUARDA": "GARDE EN RESERVE",
		"Hoy el partido no se juega nada. Sólo entras si se lesiona un compañero.": "Rien n'est en jeu aujourd'hui. Tu n'entres que si un coéquipier se blesse.",
		"Se mira el global de la eliminatoria.": "C'est le score cumulé qui compte.",
		"Si el partido se tuerce, el míster te llama.": "Si le match tourne mal, le coach t'appelle.",
		"PERDIENDO": "MENES",
		"EMPATANDO": "A EGALITE",
		"GANANDO POR 1": "DEVANT DE 1",
		"LO VES DESDE CASA": "VU DE CHEZ TOI",
		"Ganaron sin ti. Llegas entero a lo que viene.": "Victoire sans toi. Tu arrives frais pour la suite.",
		"Empate sin ti. La prensa pregunta dónde estabas.": "Nul sans toi. La presse demande où tu étais.",
		"Perdieron sin ti. La prensa pregunta dónde estabas.": "Défaite sans toi. La presse demande où tu étais.",
		"DÍA LIBRE · LO VES DESDE CASA": "REPOS · VU DE CHEZ TOI",
		"EL MÍSTER NO TE NECESITA HOY · TE QUEDAS EN LA BANCA": "PAS BESOIN DE TOI · TU RESTES SUR LE BANC",
		"JUEGAS O DESCANSAS": "JOUER OU SOUFFLER",
		"POR SI HACE FALTA": "AU CAS OU",
		"DIA LIBRE": "REPOS",

		"CLASIFICADOS": "QUALIFIES",
		"ELIMINADOS": "ELIMINES",
		"AL {0}": "CAP : {0}",
		"SIN {0}": "SANS {0}",
		"FUERA DEL TORNEO": "HORS TOURNOI",
		"Un país entero lo celebra contigo.": "Tout un pays fête ça avec toi.",
		"Un país entero apagó la tele.": "Tout un pays a éteint la télé.",
	},

	"banca_juego": {
		"CHIN CHAN PU": "CHIFOUMI",
		"BOTELLA DE PIE": "BOTTLE FLIP",
		"DOMINADAS": "JONGLES",
		"CONTRA {0}": "CONTRE {0}",
		"TU COMPAÑERO": "TON COEQUIPIER",
		"¡ELIGE!": "CHOISIS !",
		"CHIN": "CHI",
		"CHAN": "FOU",
		"¡PU!": "MI !",
		"¡TUYA!": "A TOI !",
		"¡SUYA!": "A LUI !",
		"¡OTRA!": "ENCORE !",
		"¡LANZA!": "LANCE !",
		"SU TURNO": "SON TOUR",
		"¡DE PIE!": "DEBOUT !",
		"¡SE CAE!": "TOMBEE !",
		"¡TOCA!": "TAPE !",
		"¡GANASTE!": "GAGNE !",
		"Hoy recoge él los conos.": "Aujourd'hui, c'est lui qui range les plots.",
		"Hoy recoges tú los conos.": "Aujourd'hui, c'est toi qui ranges les plots.",
		"Los conos, a medias.": "Les plots, chacun sa moitié.",
		"CREAR LIGA": "Créer ligue",
		"UNIRSE": "REJOINDRE",
		"UNIRSE A UNA LIGA": "REJOINDRE UNE LIGUE",
		"TERMINADA": "Terminée",
		"{0} D": "{0} J",
		"LIGA NO ENCONTRADA": "LIGUE INTROUVABLE",
		"LIGA LLENA": "LIGUE PLEINE",
		"DEMASIADAS LIGAS": "TROP DE LIGUES",
		"Crea una liga y pasa su código: 28 días, gana quien más sume.": "Crée une ligue et partage son code : 28 jours, le meilleur gagne.",
		"Únete a mi liga de Football Legacy: código {0}": "Rejoins ma ligue Football Legacy : code {0}",
		"Reto de {0}": "Défi de {0}",
		"Tienes un reto": "Tu as un défi",
		"Se acaba pronto: juégalo antes de que venza.": "Bientôt fini : joue-le avant qu'il expire.",
		"PADRINO": "PARRAIN",
		"Embajador": "Ambassadeur",
		"Que 3 amigos que invitaste jueguen 10 partidos.": "Que 3 amis invités jouent 10 matchs.",
		"Fundador": "Fondateur",
		"Que 10 amigos que invitaste jueguen 10 partidos.": "Que 10 amis invités jouent 10 matchs.",
		"~{0} BALONES": "~{0} BALLONS",
		"+{0} SUELDO": "+{0} SALAIRE",
		"+1 BALÓN EN CASA": "+1 BALLON CHEZ TOI",
		"-1 BALÓN EN CASA": "-1 BALLON CHEZ TOI",
		"DESDE CERO": "Depuis zéro",
		"CON TU CARRERA": "Avec ta carrière",
		"Sólo cuenta una carrera que empieces después de crearla.": "Seule une carrière commencée après sa création compte.",
		"Cuenta lo que sumes desde hoy con tu carrera.": "Compte ce que tu ajoutes dès aujourd'hui avec ta carrière.",
		"Empieza una carrera nueva para contar en esta liga.": "Commence une nouvelle carrière pour compter dans cette ligue.",
		"Podio": "Podium",
		"Acabar entre los 3 primeros de una liga de amigos.": "Finir dans les 3 premiers d'une ligue d'amis.",
		"Campeón de liga": "Champion de ligue",
		"Ganar una liga de amigos.": "Gagner une ligue d'amis.",
		"Tricampeón": "Triple champion",
		"Ganar 3 ligas de amigos.": "Gagner 3 ligues d'amis.",
		"OTRA TEMPORADA": "Nouvelle saison",
		"Liga {0}: último día": "Ligue {0} : dernier jour",
		"Vas {0}º. Aún puedes remontar.": "Tu es {0}e. Tu peux encore remonter.",
		"Aún puedes sumar antes del final.": "Tu peux encore marquer des points avant la fin.",

		"PECHO Y VOLEA": "POITRINE ET VOLEE",
		"¡CLAVADO!": "PARFAIT !",
		"¡CONTROL!": "CONTROLE !",
		"¡SE TE ESCAPA!": "IL T'ECHAPPE !",
		"¡DESLIZA HACIA ÉL!": "GLISSE VERS LUI !",
		"TOCA EN EL ARO": "TOUCHE DANS LE CERCLE",
		"¡AL PIE!": "DANS LES PIEDS !",
		"¡CON ROSCA!": "AVEC EFFET !",
		"¡CORTO!": "TROP COURT !",
		"¡LARGO!": "TROP LONG !",
		"¡DESVIADO!": "A COTE !",
		"CONTROL Y VOLEA": "CONTROLE ET VOLEE",
		"¡GLOBO!": "LOB !",
		"PULSA {0} EN EL ARO": "{0} DANS LE CERCLE",
		"STICK: APUNTA · {0}: GLOBO": "STICK: VISE · {0}: LOB",
		"EL 1-7": "LE 1-7",
		"Juega con una de las dos selecciones contra la otra.": "Joue avec l'une des deux sélections contre l'autre.",
		"EL TREN": "LE TRAIN",
		"Un gol en una final: te tiras en plancha y detrás de ti se tiran los cuatro más cerca, uno a uno, cada uno a los pies del de delante.": "Un but en finale : tu plonges à plat ventre et les quatre plus proches plongent derrière toi, un par un, chacun aux pieds de celui de devant.",
		"EL CORRO": "LA RONDE",
		"Con el vestuario a tu lado: tus compañeros te rodean aplaudiendo y tú festejas en medio.": "Avec le vestiaire derrière toi : tes coéquipiers t'entourent en applaudissant et tu fêtes au milieu.",
		"LA OREJA": "L'OREILLE",
		"Tu grada te está cantando: te giras hacia ella con las manos en las orejas y la grada se viene abajo. Sólo delante de los tuyos.": "Ta tribune chante ton nom : tu te tournes vers elle, les mains aux oreilles, et la tribune explose. Seulement devant les tiens.",
		"LA MANO DE DIOS": "LA MAIN DE DIEU",
		"EL GOL FANTASMA": "LE BUT FANTOME",
		"LA MANO EN LA LÍNEA": "MAIN SUR LA LIGNE",
		"EL PENAL AL CIELO": "PENALTY AU CIEL",
		"EL MINUTO 116": "MINUTE 116",
		"FUE CON LA MANO": "DE LA MAIN",
		"NO LO DIERON": "REFUSE",
		"ESTAMPAS LUNA": "ESTAMPAS LUNA",
		"CEREALES ALBA": "CEREALES ALBA",
		"AUTOCARES ATLAS": "AUTOCARES ATLAS",
		"PIXEL ARENA": "PIXEL ARENA",
		"Tu cara en el álbum del barrio. Cada gol, un sobre más.": "Ton visage dans l'album du quartier. Chaque but, une pochette de plus.",
		"Tu cara en la caja del desayuno. Pagan fijo y piden poco.": "Ton visage sur la boîte du petit-déjeuner. Ils paient un fixe et demandent peu.",
		"Tu cara recorre la ciudad en el autobús. Si no juegas, no ruedas.": "Ton visage parcourt la ville en bus. Si tu ne joues pas, il ne roule pas.",
		"La portada del videojuego del año. Cada gol tuyo vende una copia más.": "La jaquette du jeu de l'année. Chacun de tes buts vend un exemplaire de plus.",
		"TU ESTAMPA": "TON IMAGE",
		"TU CARA EN LA CAJA": "TA TETE EN BOITE",
		"TU CARA EN LA RUTA": "TA TETE SUR BUS",
		"TU PORTADA": "JAQUETTE",
		"DESAYUNO DE CAMPEÓN": "PETIT-DEJ CHAMPION",
		"Tres sobres y ya te tenían repetido. Te cambian por dos.": "Trois pochettes et tu étais déjà en double. On t'échange contre deux.",
		"Medio barrio desayuna contigo. El otro medio, con la competencia.": "La moitié du quartier prend son petit-déj avec toi. L'autre moitié, avec la concurrence.",
		"Doce metros de cara. Y para cada parada, en todas las rutas.": "Douze mètres de visage. Et à chaque arrêt, sur toutes les lignes.",
		"La cola da la vuelta a la manzana. Dentro del juego también eres tú.": "La file fait le tour du pâté de maisons. Dans le jeu aussi, c'est toi.",
	},
}
