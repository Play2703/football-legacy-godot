class_name Squad
extends RefCounted



























const SURNAMES: Dictionary = {
	"España": [
		"Garrido", "Serrano", "Ibáñez", "Molina", "Castaño", "Peiró", "Arrieta", "Ballester",
		"Querol", "Zubiría", "Merino", "Alcántara", "Olmedo", "Rebollo", "Vilanova", "Echeverría",
		"Delgado", "Campos", "Segovia", "Lorente", "Gallardo", "Prieto", "Vázquez", "Herrera",
		"Aranguren", "Benavente", "Cifuentes", "Domínguez", "Esparza", "Fonseca", "Galván",
		"Hormazábal", "Iriarte", "Jimeno", "Landázuri", "Montoro", "Navarrete", "Ordóñez",
		"Palomares", "Requena", "Salazar", "Torralba", "Urdangarín"],
	"Inglaterra": [
		"Holland", "Whitfield", "Branagh", "Oakley", "Pemberton", "Hargrave", "Sutcliffe", "Marlowe",
		"Redfern", "Ashworth", "Kinsella", "Brighton", "Fairweather", "Lockwood", "Stanbury",
		"Weatherall", "Whitmore", "Ellery", "Carlisle", "Prescott", "Dunmore", "Radcliffe",
		"Thornton", "Halliwell", "Abbott", "Barlow", "Chadwick", "Denton", "Eastwood", "Farley",
		"Grimshaw", "Hawthorne", "Irving", "Jeffries", "Kendall", "Latimer", "Merrick", "Newsome",
		"Ormerod", "Parrish", "Quincey", "Ravenhill", "Shackleton",
		"Tillotson", "Unsworth", "Vickers", "Wainwright", "Yardley", "Bramwell",
		"Culliford", "Dewhurst"],
	"Italia": [
		"Rizzoli", "Mancuso", "Bertoldi", "Scarpa", "Lombardi", "Ventura", "Capelli", "Travaglio",
		"Moretti", "Salvatori", "Pagano", "Brunori", "De Rossi", "Vitale", "Galli", "Zanetti",
		"Ferraro", "Conti", "Greco", "Marino", "Barbieri", "Fontana", "Colombo", "Rinaldi",
		"Albanese", "Benedetti", "Caruso", "Donati", "Esposito", "Falcone", "Gentile", "Iannone",
		"Leone", "Mazzola", "Neri", "Orlando", "Palumbo", "Quaranta", "Ruggeri", "Santoro",
		"Toscano", "Vergara", "Zampini"],
	"Alemania": [
		"Kellermann", "Brandt", "Hofmeier", "Schreiber", "Vogt", "Reinhardt", "Staub", "Wendler",
		"Kaufmann", "Lindner", "Baumert", "Herzog", "Steinbach", "Fichtner", "Rothe", "Dietrich",
		"Friedrich", "Hartmann", "Keller", "Schumann", "Engel", "Werner", "Krüger", "Lange",
		"Altmann", "Bergmann", "Clausen", "Dahlke", "Ehlers", "Falkenberg", "Gerlach", "Hellwig",
		"Ilgner", "Junker", "Kaiser", "Lohmann", "Mertens", "Neubauer", "Ostermann", "Pfeifer",
		"Riedel", "Seifert", "Thaler"],
	"México": [
		"Zamudio", "Olvera", "Canales", "Trejo", "Barrios", "Arellano", "Niebla", "Montalvo",
		"Carrizo", "Galindo", "Palacios", "Reynoso", "Benítez", "Aguayo", "Sandoval", "Esquivel",
		"Villalobos", "Meza", "Lozano", "Pizarro", "Cervantes", "Duarte", "Padilla", "Rangel",
		"Arredondo", "Bustamante", "Ceballos", "De la Torre", "Escalante", "Figueroa", "Grijalva",
		"Huerta", "Ibarra", "Jáuregui", "Ledesma", "Magaña", "Noriega", "Ochoa", "Parra", "Quezada",
		"Robledo", "Saucedo", "Tovar",
		"Velázquez", "Zepeda", "Alcántar"],
	"Portugal": [
		"Figueira", "Mendonça", "Tavares", "Resende", "Couto", "Barbosa", "Seabra", "Pinheiro",
		"Magalhães", "Azevedo", "Carvalhal", "Nogueira", "Esteves", "Lourenço", "Amorim",
		"Sá Pereira", "Correia", "Moura", "Freitas", "Branco", "Valente", "Gaspar", "Neves", "Abreu",
		"Albuquerque", "Bettencourt", "Campelo", "Duarte", "Estrela", "Fernandes", "Guedes",
		"Henriques", "Inácio", "Justino", "Leitão", "Marques", "Nunes", "Olival", "Pacheco",
		"Queirós", "Ribas", "Simões", "Trindade"],
	"Francia": [
		"Lefebvre", "Mercier", "Girard", "Laurent", "Moreau", "Fontaine", "Chevalier", "Bonnet",
		"Marchand", "Renard", "Gauthier", "Perrin", "Lemaître", "Rousseau", "Delacroix", "Vasseur",
		"Dubois", "Morel", "Garnier", "Faure", "Blanc", "Leroy", "Masson", "Roux", "Albert",
		"Boucher", "Carpentier", "Deschamps", "Étienne", "Fabre", "Guilbert", "Hubert", "Imbert",
		"Joly", "Lacombe", "Martel", "Noël", "Olivier", "Poncet", "Quentin", "Regnier", "Sauvage",
		"Thibault", "Urbain", "Vaillant", "Weber", "Xavier", "Zimmer",
		"Poirier", "Brunet", "Marchetti"],
	"Países Bajos": [
		"Van Dijk", "De Jong", "Bakker", "Visser", "Meijer", "Dekker", "Van der Berg", "Hendriks",
		"Jansen", "Smit", "Bosman", "Kooiman", "Verhoeven", "Mulder", "Van Leeuwen", "Peters",
		"De Vries", "Van der Meer", "Brouwer", "Vos", "Kemper", "Postma", "Veldman", "De Boer",
		"Aarts", "Beekman", "Claassen", "Driessen", "Elshout", "Franken", "Goudsmit", "Heemskerk",
		"Ijsselstein", "Joosten", "Kruijt", "Lindeboom", "Meerkerk", "Noteboom", "Oosterhuis",
		"Prinsen", "Rietveld", "Scholten", "Timmermans"],
	"Brasil": [
		"Silva", "Santos", "Oliveira", "Souza", "Pereira", "Costa", "Ribeiro", "Alves", "Gomes",
		"Batista", "Cardoso", "Moreira", "Nascimento", "Teixeira", "Barbosa", "Cavalcanti",
		"Almeida", "Rocha", "Mendes", "Martins", "Pinto", "Araújo", "Monteiro", "Freitas", "Andrade",
		"Barros", "Campos", "Duarte", "Esteves", "Faria", "Guimarães", "Henrique", "Iturbe",
		"Jardim", "Leal", "Maciel", "Novaes", "Pacheco", "Queiroz", "Ramalho", "Siqueira", "Torres",
		"Vargas"],
	"Argentina": [
		"González", "Rodríguez", "Fernández", "Martínez", "Romero", "Giménez", "Sosa", "Agüero",
		"Ojeda", "Paredes", "Quiroga", "Acosta", "Benítez", "Ibarra", "Cabrera", "Morón", "Díaz",
		"López", "Torres", "Medina", "Suárez", "Luna", "Ponce", "Oyola", "Almada", "Bustos",
		"Carrizo", "Delgado", "Escobar", "Figueroa", "Gaitán", "Heredia", "Iturbe", "Juárez",
		"Ledesma", "Maldonado", "Navarro", "Olguín", "Peralta", "Quintana", "Riquelme",
		"Salvatierra", "Tevera",
		"Zárate", "Verón", "Castellano", "Balbuena"],
	"Estados Unidos": [
		"Miller", "Davis", "Wilson", "Anderson", "Thompson", "Martin", "Harris", "Robinson", "Clark",
		"Walker", "Young", "Allen", "Hernández", "Scott", "Morris", "Reyes", "Brooks", "Hayes",
		"Russell", "Coleman", "Jenkins", "Perry", "Foster", "Bryant", "Abernathy", "Baldwin",
		"Cartwright", "Delaney", "Easton", "Fletcher", "Gallagher", "Holloway", "Ingram", "Jennings",
		"Keaton", "Langston", "Merritt", "Norwood", "Osborne", "Pratt", "Quigley", "Redding",
		"Summers"],
	"Arabia Saudí": [
		"Al-Dosari", "Al-Ghamdi", "Al-Shehri", "Al-Qahtani", "Al-Harbi", "Al-Zahrani", "Al-Owais",
		"Al-Faraj", "Al-Bulayhi", "Al-Malki", "Al-Najei", "Al-Hassan", "Al-Amri", "Al-Khaibari",
		"Al-Brikan", "Al-Tambakti", "Al-Shahrani", "Al-Breik", "Al-Julaydan", "Al-Yami", "Al-Salem",
		"Al-Rashid", "Al-Muwallad", "Al-Fatil", "Al-Anazi", "Al-Bishi", "Al-Dawsari", "Al-Enezi",
		"Al-Fuhaid", "Al-Ghannam", "Al-Hamdan", "Al-Juhani", "Al-Khaldi", "Al-Mutairi", "Al-Nassar",
		"Al-Otaibi", "Al-Qurashi", "Al-Ruwaili", "Al-Subaie", "Al-Thunayan", "Al-Utaibi", "Al-Wadai",
		"Al-Zaid"],
	"Turquía": [
		"Yilmaz", "Kaya", "Demir", "Şahin", "Çelik", "Yildiz", "Arslan", "Doğan", "Kiliç", "Aslan",
		"Öztürk", "Kurt", "Koç", "Şimşek", "Aydin", "Erdoğan", "Çakir", "Erdem", "Kaplan", "Topal",
		"Yalçin", "Bozkurt", "Türel", "Güneş", "Akgün", "Bayrak", "Ceylan", "Durmaz", "Ergün",
		"Firat", "Güler", "Hakverdi", "Işik", "Karaca", "Levent", "Mutlu", "Nalbant", "Özkan",
		"Polat", "Savaş", "Tekin", "Uysal", "Vural"],
	"Bélgica": [
		"Janssens", "Maes", "Peeters", "Willems", "Claes", "Goossens", "De Clercq", "Wouters",
		"Lambert", "Dupont", "Vermeulen", "De Smet", "Hermans", "Cools", "Mertens", "Van Damme",
		"Vandenberghe", "Jacobs", "Michiels", "Stevens", "Deckers", "Lambrechts", "Dhondt",
		"Vereecken", "Aerts", "Bogaert", "Ceulemans", "Deckmyn", "Engels", "Fransen", "Geerts",
		"Hofmans", "Impens", "Joris", "Kempeneers", "Leemans", "Moens", "Nijs", "Osselaer",
		"Pauwels", "Renard", "Segers", "Thys"],
	"Balcanes": [
		"Jovanović", "Petrović", "Nikolić", "Marković", "Đorđević", "Stojanović", "Ilić", "Pavlović",
		"Kovačević", "Popović", "Horvat", "Kovač", "Babić", "Novak", "Knežević", "Vuković", "Tomić",
		"Radić", "Lukić", "Simić", "Bogdanović", "Marić", "Zupančič", "Krstić", "Antić", "Bošković",
		"Cvetković", "Damjanović", "Erceg", "Filipović", "Grubišić", "Hadžić", "Ivanović", "Jakšić",
		"Kralj", "Lučić", "Miladinov", "Nedeljković", "Obradović", "Perković", "Rajković",
		"Stojković", "Vujić"],
	"Japón": [
		"Sato", "Suzuki", "Takahashi", "Tanaka", "Watanabe", "Ito", "Yamamoto", "Nakamura",
		"Kobayashi", "Kato", "Yoshida", "Yamada", "Sasaki", "Matsumoto", "Inoue", "Kimura",
		"Hayashi", "Shimizu", "Mori", "Abe", "Ikeda", "Hashimoto", "Ishikawa", "Ogawa", "Aoki",
		"Endo", "Fujita", "Goto", "Harada", "Imai", "Kaneko", "Maeda", "Nakajima", "Okada",
		"Sakamoto", "Tamura", "Uchida", "Wada", "Yamashita", "Noguchi", "Miura", "Kubota", "Arai"],
	"Corea": [
		"Kim", "Lee", "Park", "Choi", "Jung", "Kang", "Cho", "Yoon", "Jang", "Lim", "Han", "Oh",
		"Seo", "Shin", "Kwon", "Hwang", "Song", "Ahn", "Yoo", "Hong", "Jeon", "Moon", "Bae", "Nam",
		"Chung", "Gil", "Heo", "Jin", "Kwak", "Min", "Noh", "Pyo", "Ryu", "Sakong", "Tak", "Won",
		"Yang", "Cha", "Koo", "Baek", "Sim", "Uhm", "Pil"],
	"China": [
		"Wang", "Li", "Zhang", "Liu", "Chen", "Yang", "Huang", "Zhao", "Wu", "Zhou", "Xu", "Sun",
		"Ma", "Zhu", "Hu", "Guo", "Lin", "He", "Gao", "Luo", "Zheng", "Liang", "Xie", "Tang", "Cao",
		"Deng", "Feng", "Han", "Jiang", "Kong", "Lu", "Meng", "Pan", "Qiu", "Shen", "Tan", "Wei",
		"Xiong", "Yao", "Zeng", "Dai", "Fang", "Jia"],
	"Escocia": [
		"MacLeod", "Ferguson", "Campbell", "Stewart", "Mackay", "Robertson", "Murray", "McGregor",
		"Sutherland", "McLean", "Fraser", "Douglas", "Henderson", "Crawford", "Wallace", "Buchanan",
		"McKenna", "Graham", "Ritchie", "Armstrong", "McCall", "Duncan", "Gallacher", "Morrison",
		"Aitken", "Blackwood", "Cairns", "Dalgleish", "Erskine", "Findlay", "Gilchrist", "Hamilton",
		"Irvine", "Jardine", "Kerr", "Lamont", "McAllister", "Nairn", "Ogilvie", "Paterson",
		"Rennie", "Sinclair", "Urquhart"],
	"Grecia": [
		"Papadopoulos", "Georgiou", "Nikolaou", "Vasileiou", "Ioannou", "Konstantinou", "Dimitriou",
		"Antoniou", "Athanasiou", "Christodoulou", "Karagiannis", "Mavromatis", "Stavropoulos",
		"Oikonomou", "Pappas", "Papanikolaou", "Angelopoulos", "Makris", "Vlachos", "Lazaridis",
		"Sidiropoulos", "Giannakopoulos", "Theodorou", "Kyriakidis", "Alexiou", "Bouras", "Chatzis",
		"Delis", "Efthymiou", "Fotiadis", "Galanis", "Halkias", "Iliadis", "Kalogerou", "Liakos",
		"Manolas", "Ntouros", "Orfanos", "Panou", "Rallis", "Spanos", "Tsolakis", "Voulgaris"],
	"Ucrania": [
		"Shevchenko", "Kovalenko", "Bondarenko", "Tkachenko", "Kravchenko", "Melnyk", "Polishchuk",
		"Boyko", "Kovalchuk", "Tkachuk", "Oliynyk", "Shevchuk", "Koval", "Lysenko", "Moroz",
		"Rudenko", "Savchenko", "Petrenko", "Hrytsenko", "Marchenko", "Danylenko", "Zinchenko",
		"Yarmolenko", "Sydorenko", "Andrushchenko", "Babenko", "Chumachenko", "Didenko", "Fedorenko",
		"Honcharenko", "Ishchenko", "Klymenko", "Lutsenko", "Maksymenko", "Nazarenko", "Onyshchenko",
		"Pavlenko", "Romanenko", "Semenenko", "Tymoshenko", "Usenko", "Vasylenko", "Yakovenko"],
	"Austria": [
		"Gruber", "Huber", "Wagner", "Müller", "Pichler", "Steiner", "Moser", "Mayer", "Leitner",
		"Berger", "Fuchs", "Eder", "Fischer", "Schmid", "Winkler", "Weber", "Bauer", "Lang",
		"Reiter", "Wallner", "Egger", "Hofer", "Brandstätter", "Auer", "Achleitner", "Binder",
		"Dorfer", "Ertl", "Fellner", "Gassner", "Haslinger", "Innerhofer", "Jauk", "Kogler",
		"Lackner", "Mairhofer", "Neuhold", "Obermayer", "Prantl", "Riegler", "Schachner", "Trauner",
		"Wiesinger"],
	"Suiza": [
		"Müller", "Schneider", "Keller", "Widmer", "Brunner", "Zimmermann", "Steffen", "Freuler",
		"Schär", "Aebischer", "Rieder", "Zuber", "Fassnacht", "Huber", "Meier", "Gerber", "Baumann",
		"Frey", "Vonlanthen", "Rochat", "Favre", "Chapuisat", "Bernasconi", "Stocker", "Ammann",
		"Bühler", "Christen", "Dubois", "Egli", "Flückiger", "Graf", "Häberli", "Imhof", "Jaquet",
		"Kälin", "Lüthi", "Moser", "Niederer", "Oberli", "Perroud", "Rey", "Studer", "Tschudi"],
	"Chequia": [
		"Novák", "Svoboda", "Novotný", "Dvořák", "Černý", "Procházka", "Kučera", "Veselý", "Horák",
		"Němec", "Marek", "Pospíšil", "Hájek", "Jelínek", "Král", "Beneš", "Fiala", "Sedláček",
		"Doležal", "Zeman", "Kolář", "Navrátil", "Čermák", "Vaněk", "Bartoš", "Chalupa", "Dušek",
		"Eliáš", "Fišer", "Havlíček", "Janda", "Kadlec", "Liška", "Macháček", "Němeček", "Ondráček",
		"Pazdera", "Růžička", "Slavík", "Tichý", "Urban", "Vlček", "Zítka"],
	"Croacia": [
		"Horvat", "Kovačević", "Babić", "Marić", "Jurić", "Novak", "Vuković", "Knežević", "Marković",
		"Petrović", "Tomić", "Božić", "Pavličić", "Radić", "Blažević", "Grgić", "Perić", "Šimić",
		"Vidović", "Lovrić", "Klarić", "Matešić", "Šarić", "Bilić", "Antunović", "Brezovec",
		"Cindrić", "Delić", "Erceg", "Franić", "Galić", "Hrgović", "Ivanković", "Jakelić", "Kozina",
		"Lukšić", "Medved", "Novosel", "Orešković", "Prskalo", "Rukavina", "Skelin", "Tomljanović"],
	"Serbia": [
		"Jovanović", "Petrović", "Nikolić", "Marković", "Đorđević", "Stojanović", "Ilić",
		"Stanković", "Pavlović", "Milošević", "Popović", "Todorović", "Ristić", "Lazarević",
		"Mitrović", "Vuković", "Kostić", "Savić", "Živković", "Radovanović", "Jakovljević",
		"Milenković", "Đukić", "Krstić", "Andrić", "Bojović", "Cvijanović", "Damnjanović", "Erić",
		"Filipović", "Gajić", "Hristić", "Ivković", "Joksimović", "Karadžić", "Luković",
		"Mladenović", "Nenadović", "Obrenović", "Pantić", "Rakić", "Simonović", "Tanasković"],
	"Dinamarca": [
		"Nielsen", "Jensen", "Hansen", "Pedersen", "Andersen", "Christensen", "Larsen", "Sørensen",
		"Rasmussen", "Jørgensen", "Petersen", "Madsen", "Kristensen", "Olsen", "Thomsen", "Poulsen",
		"Johansen", "Knudsen", "Møller", "Mortensen", "Jakobsen", "Eriksen", "Højbjerg",
		"Schmeichel", "Agerskov", "Bilde", "Clausen", "Damgaard", "Enevoldsen", "Frandsen", "Gade",
		"Holmgaard", "Iversen", "Jeppesen", "Kofoed", "Lundgaard", "Munkholm", "Nørgaard", "Ovesen",
		"Pallesen", "Riis", "Skov", "Toft"],
	"Noruega": [
		"Hansen", "Johansen", "Olsen", "Larsen", "Andersen", "Pedersen", "Nilsen", "Kristiansen",
		"Jensen", "Karlsen", "Johnsen", "Pettersen", "Eriksen", "Berg", "Haugen", "Hagen",
		"Johannessen", "Andreassen", "Jacobsen", "Halvorsen", "Dahl", "Solberg", "Moen", "Lund",
		"Aasen", "Bakken", "Dalen", "Engebretsen", "Fossum", "Grønvold", "Helland", "Ingebrigtsen",
		"Johnsrud", "Kvam", "Langeland", "Myhre", "Nordby", "Opsahl", "Reiersen", "Strand", "Tveit",
		"Ulriksen", "Viken"],
	"Corea del Sur": [
		"Kim", "Lee", "Park", "Choi", "Jung", "Kang", "Cho", "Yoon", "Jang", "Lim", "Han", "Oh",
		"Seo", "Shin", "Kwon", "Hwang", "Ahn", "Song", "Hong", "Yoo", "Ko", "Moon", "Son", "Bae",
		"Byun", "Chun", "Do", "Eom", "Geum", "Hyun", "Im", "Jin", "Ma", "Na", "Pil", "Ra", "Sul",
		"Tae", "Woo", "Yeo", "Jeong", "Gu", "Ban"],
	"Colombia": [
		"Rodríguez", "Gómez", "Moreno", "Castaño", "Quintero", "Arias", "Mosquera", "Valencia",
		"Zapata", "Ospina", "Restrepo", "Cardona", "Murillo", "Córdoba", "Rentería", "Borja",
		"Palacios", "Velásquez", "Arango", "Hinestroza", "Castro", "Bedoya", "Peñaranda", "Uribe",
		"Agudelo", "Balanta", "Caicedo", "Díaz", "Echeverri", "Flórez", "Guerrero", "Herrera",
		"Izquierdo", "Jaramillo", "Lerma", "Mejía", "Narváez", "Ortiz", "Perlaza", "Quiñones",
		"Riascos", "Salazar", "Torrijos"],
	"Chile": [
		"González", "Muñoz", "Rojas", "Díaz", "Contreras", "Silva", "Sepúlveda", "Morales", "Valdés",
		"Fuentes", "Araya", "Tapia", "Vergara", "Espinoza", "Cáceres", "Carrasco", "Galdames",
		"Núñez", "Saavedra", "Soto", "Reyes", "Valenzuela", "Castillo", "Henríquez", "Acuña",
		"Bravo", "Cornejo", "Donoso", "Echeverría", "Figueroa", "Gutiérrez", "Herrera", "Inostroza",
		"Jara", "Leiva", "Maldonado", "Navarrete", "Oyarzún", "Pizarro", "Quinteros", "Riquelme",
		"Salinas", "Toro"],
	"Uruguay": [
		"Rodríguez", "González", "Fernández", "Martínez", "Pérez", "Sosa", "Silva", "Gómez",
		"Techera", "Olivera", "Viera", "Cabrera", "Machado", "Acosta", "Bentancur", "Varela",
		"Lemos", "Píriz", "Medina", "Cáceres", "Duarte", "Arévalo", "Izquierdo", "Gargano", "Alonso",
		"Benítez", "Corujo", "Delgado", "Estoyanoff", "Ferreira", "Giménez", "Hernández", "Ibarra",
		"Jaume", "Larriera", "Méndez", "Núñez", "Ortiz", "Pereyra", "Queirolo", "Ríos", "Sanabria",
		"Tabárez"],
	"Egipto": [
		"Hassan", "Mohamed", "Ibrahim", "Abdelrahman", "Fathy", "Salah", "Hegazi", "Elneny", "Gaber",
		"Sobhi", "Abdelmonem", "Magdy", "Fotouh", "Sherif", "Attia", "Ramadan", "Mostafa",
		"Aboutrika", "El Said", "El Shenawy", "Abdelaziz", "Farag", "Samir", "Nabil", "Abdelhamid",
		"Badr", "Darwish", "Ezzat", "Fawzy", "Gomaa", "Hamdy", "Ismail", "Kamel", "Lotfy", "Mansour",
		"Nasser", "Omran", "Qassem", "Rashed", "Saad", "Taha", "Wahba", "Zaki"],










	"Nigeria": [
		"Okafor", "Okonkwo", "Okoye", "Eze", "Nwachukwu", "Obi", "Chukwu", "Anyanwu", "Onyeka",
		"Igwe", "Adeyemi", "Adebayo", "Adesanya", "Ogundimu", "Oladipo", "Babatunde", "Akintola",
		"Oyelaran", "Fashola", "Balogun", "Lawal", "Sanusi", "Yusuf", "Aliyu", "Danjuma", "Musa",
		"Bello", "Suleiman", "Etim", "Effiong", "Udoh", "Bassey", "Akpan", "Okon", "Edet", "Umoh",
		"Nnamdi", "Uche", "Emeka", "Obiora", "Iloabuchi", "Maduka", "Nwosu"],
	"Ghana": [
		"Mensah", "Boateng", "Asamoah", "Agyemang", "Owusu", "Osei", "Appiah", "Adomah", "Kuffour",
		"Antwi", "Darko", "Frimpong", "Ofori", "Opoku", "Sarfo", "Tetteh", "Yeboah", "Annan",
		"Badu", "Duah", "Gyasi", "Koomson", "Lamptey", "Nyarko", "Odoi", "Quaye", "Sackey",
		"Tagoe", "Acheampong", "Ampadu", "Bonsu", "Donkor", "Fosu", "Nuamah", "Adjei", "Arthur",
		"Boakye", "Danquah", "Gyimah", "Kyei", "Mensa", "Otoo", "Twumasi"],
	"Senegal": [
		"Diop", "Ndiaye", "Fall", "Sarr", "Gueye", "Sow", "Ba", "Diallo", "Cissé", "Seck",
		"Mbaye", "Thiam", "Faye", "Diatta", "Niang", "Kane", "Dieng", "Sylla", "Touré", "Camara",
		"Badji", "Goudiaby", "Diagne", "Samb", "Loum", "Diédhiou", "Boye", "Diakhaté", "Gassama",
		"Jallow", "Kébé", "Mendy", "Ndoye", "Sakho", "Tall", "Wade", "Yade", "Diouf", "Gaye",
		"Lo", "Niasse", "Seye", "Sonko"],
	"Costa de Marfil": [
		"Kouassi", "Kouamé", "Konan", "N'Zi", "Koffi", "N'Guessan", "Aka", "Assamoi", "Brou",
		"Diabaté", "Traoré", "Coulibaly", "Ouattara", "Bamba", "Fofana", "Doumbia", "Keita",
		"Sanogo", "Gnahoré", "Zoro", "Tanoh", "Séri", "Diomandé", "Ehouman", "Ahoué", "Dosso",
		"Gosso", "Kanga", "Loua", "Meité", "N'Dri", "Oulaï", "Silué", "Tiéné", "Vanga", "Yeboué",
		"Zézé", "Adou", "Binaté", "Guéhi", "Koné", "Sangaré", "Tiéhi"],
	"Camerún": [
		"Njoya", "Ngando", "Etame", "Essomba", "Mballa", "Atangana", "Belinga", "Ebodé", "Fouda",
		"Manga", "Ndjock", "Owona", "Zanga", "Abanda", "Bikok", "Djomo", "Enama", "Fokou", "Gouet",
		"Haman", "Issa", "Kombou", "Leke", "Mbida", "Nana", "Onguene", "Penda", "Samba", "Tagne",
		"Wandji", "Yombi", "Zambo", "Anaba", "Beyala", "Dika", "Eyoum", "Ghomsi", "Happi",
		"Kemajou", "Nkembe", "Oyono", "Tchatchoua", "Wouamba"],






	"Suecia": [
		"Andersson", "Johansson", "Karlsson", "Nilsson", "Eriksson", "Larsson", "Olsson",
		"Persson", "Svensson", "Gustafsson", "Pettersson", "Jonsson", "Jansson", "Hansson",
		"Bengtsson", "Lindberg", "Jakobsson", "Magnusson", "Lindström", "Lindqvist", "Lindgren",
		"Berglund", "Fredriksson", "Sandberg", "Henriksson", "Sjöberg", "Wallin", "Engström",
		"Eklund", "Danielsson", "Håkansson", "Lundin", "Björk", "Bergström", "Holmberg",
		"Nyström", "Mårtensson", "Öberg", "Åkesson", "Ström", "Hedlund", "Sundberg", "Wikström"],
	"Marruecos": [
		"Bennani", "Alaoui", "Idrissi", "Tazi", "Berrada", "Lahlou", "Fassi", "Chraibi",
		"Benjelloun", "Sqalli", "Amrani", "Boukhari", "Chakir", "Daoudi", "Ettalhi", "Filali",
		"Ghali", "Hajji", "Kabbaj", "Lamrani", "Mansouri", "Naciri", "Ouali", "Rachidi", "Saidi",
		"Touzani", "Zeroual", "Belkacem", "Cherkaoui", "Drissi", "Fadili", "Guessous", "Hamdaoui",
		"Karimi", "Lazrak", "Mekouar", "Naji", "Ouazzani", "Rami", "Sekkat", "Talbi", "Bensaid",
		"Moujahid"],
	"Polonia": [
		"Nowak", "Kowalski", "Wiśniewski", "Wójcik", "Kowalczyk", "Kamiński", "Zając", "Król",
		"Jankowski", "Mazur", "Wojciechowski", "Kwiatkowski", "Kaczmarek", "Piotrowski",
		"Grabowski", "Pawłowski", "Michalski", "Nowicki", "Adamczyk", "Dudek", "Stępień",
		"Górski", "Ostrowski", "Walczak", "Sikora", "Baran", "Rutkowski", "Michalak", "Jasiński",
		"Malinowski", "Pawlak", "Witkowski", "Wróbel", "Jabłoński", "Majewski", "Olszewski",
		"Stasiak", "Urbański", "Wieczorek", "Zalewski", "Chmielewski", "Borkowski", "Sokołowski"],
	"Ecuador": [
		"Quiñónez", "Angulo", "Arroyo", "Preciado", "Mina", "Estupiñán", "Gruezo", "Plata",
		"Tenorio", "Sarmiento", "Alcívar", "Bagüí", "Cedeño", "Intriago", "Loor", "Nazareno",
		"Vite", "Reasco", "Urbano", "Villafuerte", "Yépez", "Zurita", "Anchundia", "Burbano",
		"Chalá", "Solís", "Cifuentes", "Arboleda", "Intriago Suárez", "Mendoza", "Caguana", "Porozo",
		"Guerrón", "Cortez", "Cazares", "Jimbo", "Lastra", "Macías", "Noboa", "Erazo", "Palma",
		"Villamar", "Segura"],
	"Perú": [
		"Quispe", "Mamani", "Huamán", "Condori", "Choque", "Yotún", "Corzo", "Ascues",
		"Calcaterra", "Iberico", "Lazo", "Cartagena", "Olivares", "Reyna", "Salcedo", "Urruti",
		"Valera", "Zevallos", "Arce", "Bazán", "Deza", "Loyola", "Peña", "Araujo", "Balbín",
		"Chumpitaz", "Duárez", "Elías", "Callens", "Garcés", "Cordero", "Llontop", "Mifflin",
		"Neyra", "Oblitas", "Garro", "Lapadula", "Polo", "Seminario", "Távara", "Ugaz",
		"Trauco", "Zúñiga"],






	"Venezuela": [
		"Rondón", "Machís", "Savarino", "Osorio", "Feltscher", "Seijas", "Magallanes", "Basanta",
		"Chancellor", "Villanueva", "Cásseres", "Cumana", "Graterol", "Farías", "Guerra",
		"Mariño", "Mikolta", "Murillo", "Pariata", "Rivas", "Soteldo", "Urdaneta", "Velázquez",
		"Rey", "Boscán", "Cichero", "Dudamel", "Echenique", "Fuenmayor", "Romo", "Sangronis",
		"Lucena", "Mea Vitali", "Tovar Vera", "Otero", "Urribarri", "Vizcarrondo", "Rincón", "Yriarte",
		"Torrealba", "Vallenilla", "Yánez", "Zerpa"],
	"Paraguay": [
		"Ayala", "Rolón", "Báez", "Alderete", "Villalba", "Cañete", "Aquino", "Candia",
		"Cabañas", "Bogado", "Centurión", "Galeano", "Insfrán", "Lezcano", "Chamorro", "Fleitas",
		"Gaona", "Isasi", "Leguizamón", "Riveros", "Mendieta", "Torales", "Verón", "Orué",
		"Bobadilla", "Patiño", "Saldívar", "Espínola", "Troche", "Gamarra", "Irala", "Villasanti",
		"Zárate", "Melgarejo", "Ovelar", "Piris", "Recalde", "Samudio", "Trinidad", "Valdez",
		"Yegros", "Zaracho", "Arzamendia"],




	"Bolivia": [
		"Mamani", "Quispe", "Condori", "Choque", "Vaca", "Saavedra", "Arce", "Flores",
		"Gutiérrez", "Rojas", "Vargas", "Justiniano", "Suárez", "Roca", "Cuéllar", "Áñez",
		"Chávez", "Moreno", "Torrico", "Rocha", "Villarroel", "Zeballos", "Paz", "Aguilar",
		"Montaño", "Limachi", "Huanca", "Apaza", "Ticona", "Callisaya", "Cruz", "Ribera",
		"Peredo", "Ortiz", "Salvatierra", "Banegas", "Céspedes", "Mercado", "Galindo", "Arteaga",
		"Coimbra", "Bejarano", "Medina"],
	"Gales": [
		"Jones", "Davies", "Williams", "Evans", "Thomas", "Roberts", "Lewis", "Meurig", "Morgan",
		"Griffiths", "Owen", "Price", "Rees", "Gwilt", "Phillips", "James", "Edwards", "Parry",
		"Powell", "Probert", "Bevan", "Cadwaladr", "Treharne", "Ellis", "Gittins", "Howells",
		"Lloyd", "Meredith", "Pugh", "Vaughan", "Wynne", "Bowen", "Caradoc", "Gwilym", "Hopkin",
		"Llewellyn", "Madoc", "Pritchard", "Rhys", "Tudor", "Vaughn", "Watkins", "Yorath"],
	"Irlanda": [
		"O'Brien", "Murphy", "Kelly", "O'Sullivan", "Walsh", "Smyth", "O'Connor", "Byrne", "Ryan",
		"O'Neill", "Reilly", "Doyle", "McCarthy", "O'Donovan", "Doherty", "Kennedy", "Lynch",
		"McElhenney", "Quinn", "Moore", "McLoughlin", "O'Carroll", "Connolly", "Daly", "Duffy",
		"Fitzgerald", "Brennan", "Burke", "Collins", "O'Shaughnessy", "Clarke", "Johnston", "O'Halloran",
		"Farrell", "Fitzpatrick", "Casey", "Maguire", "Dunne", "Flynn", "Kavanagh", "Keane",
		"McGrath", "Nolan"],




	"Rusia": [
		"Ivanov", "Smirnov", "Kuznetsov", "Popov", "Vasiliev", "Petrov", "Sokolov", "Mikhailov",
		"Novikov", "Fedorov", "Morozov", "Volkov", "Alekseev", "Lebedev", "Semenov", "Egorov",
		"Pavlov", "Kozlov", "Stepanov", "Nikolaev", "Orlov", "Andreev", "Makarov", "Nikitin",
		"Zakharov", "Zaytsev", "Solovyov", "Borisov", "Yakovlev", "Grigoriev", "Romanov",
		"Vorobyov", "Sergeev", "Kuzmin", "Frolov", "Dmitriev", "Korolev", "Gusev", "Kiselyov",
		"Maksimov", "Tarasov", "Belyaev", "Bogdanov"],








	"Rumanía": [
		"Popescu", "Ionescu", "Popa", "Radu", "Dumitru", "Stoica", "Gheorghe", "Constantin",
		"Marin", "Stan", "Munteanu", "Matei", "Diaconu", "Barbu", "Nistor", "Lupu", "Cojocaru",
		"Ciobanu", "Florea", "Dragomir", "Tudor", "Vasile", "Oprea", "Neagu", "Dinu", "Preda",
		"Toma", "Anghel", "Petre", "Ilie", "Savu", "Vlad", "Iordache", "Mocanu", "Rusu", "Badea",
		"Croitoru", "Enache", "Sandu", "Voicu", "Zamfir", "Păun", "Grigore"],












	"Bosnia y Herzegovina": [
		"Hodžić", "Mehmedović", "Alić", "Begić", "Mujić", "Suljić", "Imamović", "Husić", "Karić",
		"Kadrić", "Hasanović", "Omerović", "Avdić", "Softić", "Mešić", "Ćatić", "Hamzić", "Smajić",
		"Hrnjić", "Mustafić", "Osmanović", "Bećirović", "Selimović", "Kurtović", "Pašić",
		"Bošnjak", "Mikulić", "Zovko", "Raguž", "Bevanda", "Pehar", "Vukoja", "Bubalo",
		"Stanić", "Janković", "Tešić", "Kecman", "Gligorić", "Ostojić", "Pejić",
		"Kovačević", "Marić", "Savić"],
	"Sudáfrica": [
		"Mokoena", "Zwane", "Dlamini", "Khumalo", "Ndlovu", "Mabena", "Motaung", "Sithole",
		"Mashego", "Mahlangu", "Nkosi", "Mthembu", "Radebe", "Molefe", "Makhanya", "Tshabalala",
		"Mabaso", "Ngcobo", "Sibeko", "Mofokeng", "Msimango", "Jali", "Modise", "Hlongwane",
		"Moela", "Sibiya", "Mashiane", "Makgopa", "Booysen", "Parker", "Arendse", "De Reuck",
		"Van Heerden", "Pretorius", "Botha", "Du Plessis", "Grobler", "Appollis", "Mbatha",
		"Sibisi", "Nyauza", "Erasmus", "Maphosa"],











	"Túnez": [
		"Hammami", "Chaouachi", "Riahi", "Zouari", "Ouerghi", "Bouzid", "Jlassi",
		"Khelifi", "Mejri", "Hamdi", "Abidi", "Arfaoui", "Baccouche", "Cherni", "Khemiri",
		"Laabidi", "Kammoun", "Sassi", "Oueslati", "Rezgui", "Mzoughi", "Dhifallah", "Ghanmi",
		"Toumi", "Lassoued", "Bguir", "Ghandri", "Khaoui", "Bouguerra", "Bouslama", "Mabrouk",
		"Hamrouni", "Chebbi", "Ksouri", "Zouaghi", "Belhadj", "Mouelhi", "Jendoubi", "Dridi",
		"Hannachi", "Tlili", "Brahmi", "Sellami"],
	"Catar": [
		"Al-Thani", "Al-Haydos", "Al-Hajri", "Khoukhi", "Al-Rawi", "Al-Yazidi", "Al-Bakri",
		"Al-Sheeb", "Al-Binali", "Al-Ghanim", "Al-Kuwari", "Al-Mohannadi", "Al-Emadi", "Al-Sulaiti",
		"Al-Khater", "Al-Muftah", "Al-Marri", "Al-Hammadi", "Al-Naimi", "Al-Mannai", "Al-Rakeb",
		"Al-Hashmi", "Al-Yafei", "Al-Abdullah", "Al-Junaibi", "Al-Haroon", "Al-Madibo", "Al-Boainain",
		"Al-Karbi", "Al-Sliti", "Al-Dosari", "Al-Khaldi", "Al-Noaimi", "Al-Sahlawi", "Al-Sada",
		"Al-Meer", "Al-Ghassani", "Al-Kaabi", "Al-Rashid", "Al-Breik", "Al-Wakrah", "Al-Duhail", "Al-Jaber"],




	"Jordania": [
		"Al-Taamari", "Al-Naimat", "Al-Rashdan", "Al-Mardi", "Al-Bakhit", "Al-Dardour", "Al-Sabbah",
		"Al-Arab", "Abu Zrai", "Abu Alieh", "Al-Fakhouri", "Al-Mahameed", "Al-Lahaleh", "Al-Saify",
		"Al-Zboun", "Al-Ajalin", "Al-Bawab", "Al-Rawashdeh", "Al-Khalayleh", "Al-Sheyab", "Al-Qudah",
		"Al-Momani", "Al-Tarawneh", "Al-Majali", "Al-Adwan", "Al-Zoubi", "Al-Shaqran", "Al-Hawatmeh",
		"Al-Nuaimat", "Al-Sarayrah", "Haddad", "Sharbini", "Obeidat", "Bani Attiah", "Bani Yaseen",
		"Attieh", "Daboub", "Mustafa", "Kasih", "Shelbaieh", "Ateeq", "Khattab", "Jaber", "Nassar"],
	"Emiratos": [
		"Al-Ahbabi", "Mabkhout", "Al-Hammadi", "Al-Menhali", "Al-Abduli", "Al-Baloushi", "Al-Ketbi",
		"Al-Rashidi", "Al-Dhanhani", "Al-Kaabi", "Al-Shamsi", "Al-Naqbi", "Al-Zaabi", "Al-Mazrouei",
		"Al-Junaibi", "Al-Hosani", "Al-Breiki", "Al-Tamimi", "Al-Nuaimi", "Al-Yammahi", "Al-Attas",
		"Al-Jasmi", "Al-Marzooqi", "Al-Hosni", "Al-Saadi", "Al-Darmaki", "Al-Khoori", "Al-Hashmi",
		"Al-Raqbani", "Al-Ghafri", "Al-Akbari", "Salmeen", "Meftah", "Khamis", "Ghannam", "Butti",
		"Al-Shehhi", "Al-Balooshi", "Al-Kamali", "Al-Wahishi", "Rashed", "Al-Harbi", "Al-Qassimi"],

	"Irán": [
		"Ahmadi", "Rezaei", "Mohammadi", "Hosseini", "Karimi", "Jafari", "Moradi", "Gholami",
		"Naderi", "Ebrahimi", "Rashidi", "Sadeghi", "Mirzaei", "Azizi", "Heydari", "Nasiri",
		"Bagheri", "Soltani", "Abbasi", "Taheri", "Farahani", "Ghasemi", "Kazemi", "Mahdavi",
		"Najafi", "Rahimi", "Sharifi", "Vahedi", "Yazdani", "Zarei", "Eslami", "Fallah",
		"Ghorbani", "Hashemi", "Jalali", "Khosravi", "Noroozi", "Saberi", "Tabatabaei", "Vakili",
		"Zanganeh", "Salehi", "Mousavi"],




	"Uzbekistán": [
		"Shomurodov", "Yusupov", "Nematov", "Ergashev", "Alijonov", "Sayfiev", "Ashurmatov",
		"Nasrullaev", "Eshmurodov", "Karimov", "Ulmasaliev", "Urozov", "Shukurov", "Iskanderov",
		"Hamrobekov", "Urunov", "Khamdamov", "Ganiev", "Fayzullaev", "Esanov", "Jiyanov", "Amonov",
		"Rashidov", "Turgunboev", "Sergeyev", "Tursunov", "Ibragimov", "Nazarov", "Abdullaev",
		"Juraev", "Masharipov", "Sidikov", "Hoshimov", "Qosimov", "Boltaboev", "Rustamov",
		"Salomov", "Toshmatov", "Vokhidov", "Xolmatov", "Yakhshiboev", "Zoirov", "Kholiqov",
		"Xudoyberdiev"],
	"Hungría": [
		"Nagy", "Kovács", "Tóth", "Szabó", "Horváth", "Varga", "Kiss", "Molnár", "Németh", "Farkas",
		"Balogh", "Papp", "Takács", "Juhász", "Lakatos", "Mészáros", "Oláh", "Simon", "Rácz",
		"Fekete", "Szilágyi", "Török", "Fodor", "Gál", "Bíró", "Kelemen", "Szűcs", "Orosz",
		"Hegedűs", "Vörös", "Gáspár", "Bogdán", "Lukács", "Magyar", "Pintér", "Veres", "Bálint",
		"Deák", "Fábián", "Hajdu", "Sólyom", "Szalai", "Sztojka"],
	"Finlandia": [
		"Virtanen", "Nieminen", "Korhonen", "Mäkinen", "Hämäläinen", "Laine", "Heikkinen", "Koskinen",
		"Järvinen", "Lehtonen", "Saarinen", "Heinonen", "Salminen", "Turunen", "Lahtinen", "Kallio",
		"Rantanen", "Tuominen", "Ollila", "Ahonen", "Lehtinen", "Räsänen", "Parviainen", "Hakala",
		"Koivisto", "Savolainen", "Kinnunen", "Mäkelä", "Numminen", "Peltonen", "Aaltonen", "Kanerva",
		"Laakso", "Mattila", "Nurmi", "Paavola", "Sipilä", "Toivonen", "Väisänen", "Jokinen",
		"Halonen", "Kettunen", "Leppänen"],
	"Vietnam": [
		"Nguyen", "Tran", "Le", "Pham", "Hoang", "Phan", "Vu", "Dang", "Bui", "Do", "Ho", "Ngo",
		"Duong", "Ly", "Truong", "Dinh", "Doan", "Lam", "Mai", "Trinh", "Dao", "Cao", "Thai",
		"Luong", "Vuong", "Ta", "Ton", "Ha", "Chu", "Tong", "Nghiem", "Quach", "Thach", "La",
		"Huynh", "Giang", "Khuong", "Luu", "Mach", "Nong", "Tieu", "Au", "Bach"],
	"Tailandia": [
		"Saengdao", "Boonmee", "Rattanakorn", "Srisuwan", "Charoen", "Wongsa", "Kaewkla", "Promma",
		"Intarat", "Suksawat", "Phuangphet", "Saelim", "Bunnag", "Meechai", "Nakarin", "Rungroj",
		"Tanakan", "Udom", "Wichit", "Yingyong", "Chantha", "Hansa", "Jinda", "Kosol", "Manop",
		"Paitoon", "Ratana", "Sawatdee", "Tawan", "Watchara", "Arun", "Boonruang", "Chaiyo",
		"Duangjai", "Kamol", "Prasert", "Sombat", "Thaworn", "Wiriya", "Panya", "Sakda", "Phromma", "Siriwat"],
	"Israel": [
		"Cohen", "Levi", "Mizrahi", "Peretz", "Biton", "Dahan", "Avraham", "Friedman", "Katz",
		"Malka", "Azulay", "Gabay", "Sharon", "Ben-David", "Elbaz", "Hadad", "Ohayon", "Rosen",
		"Shapira", "Tal", "Vaknin", "Yosef", "Zohar", "Amar", "Barak", "Dayan", "Edri", "Golan",
		"Hershko", "Klein", "Lerner", "Moshe", "Nahmias", "Oren", "Peled", "Regev", "Segel", "Tzur",
		"Weiss", "Yarden", "Zaken", "Ashkenazi", "Benayoun"],
	"Georgia": [
		"Beridze", "Gelashvili", "Kapanadze", "Lomidze", "Tsuladze", "Japaridze", "Kiladze",
		"Margvelashvili", "Zurabishvili", "Gvaramia", "Nadiradze", "Samkharadze", "Urushadze",
		"Vasadze", "Chanturia", "Gabelia", "Iremadze", "Lobjanidze", "Okropiridze", "Pirtskhalava",
		"Bokuchava", "Tatanashvili", "Rukhadze", "Mchedlidze", "Chkheidze", "Papava", "Eliava",
		"Gogoladze", "Kveladze", "Meladze", "Nikoladze", "Tsereteli", "Jorbenadze", "Abashidze",
		"Chavchavadze", "Gurieli", "Maisuradze", "Tskhovrebadze", "Kharadze", "Bagrationi",
		"Shengelia", "Tvildiani", "Tsiklauri"],
	"Armenia": [
		"Sargsyan", "Harutyunyan", "Grigoryan", "Hovhannisyan", "Khachatryan", "Petrosyan",
		"Mkrtchyan", "Hakobyan", "Manukyan", "Galstyan", "Martirosyan", "Muradyan", "Karapetyan",
		"Avetisyan", "Gevorgyan", "Minasyan", "Vardanyan", "Ghazaryan", "Stepanyan", "Tadevosyan",
		"Babayan", "Davtyan", "Hambardzumyan", "Israyelyan", "Kocharyan", "Movsisyan", "Nazaryan",
		"Ohanyan", "Poghosyan", "Simonyan", "Torosyan", "Voskanyan", "Yeghiazaryan", "Zakaryan",
		"Arakelyan", "Baghdasaryan", "Danielyan", "Gabrielyan", "Hovsepyan", "Melkonyan", "Sahakyan",
		"Terteryan", "Asatryan"],
	"Indonesia": [
		"Setiawan", "Wijaya", "Pratama", "Kurniawan", "Saputra", "Hidayat", "Nugraha", "Ramadhan",
		"Firmansyah", "Permana", "Gunawan", "Wibowo", "Santoso", "Purnomo", "Hartono", "Susanto",
		"Hermansyah", "Irawan", "Maulana", "Iskandar", "Rahman", "Hakim", "Syahputra", "Anwar",
		"Basri", "Darmawan", "Fauzi", "Hamzah", "Junaidi", "Kamaruddin", "Mansur", "Nasution",
		"Panjaitan", "Sudirman", "Tanjung", "Utama", "Wahyudi", "Yusuf", "Zulkifli", "Harahap",
		"Siregar", "Lubis", "Kusuma"],

















	"Nueva Zelanda": [
		"Hollis", "Kirkwood", "Pennington", "Ashby", "Faulkner", "Dalziel", "Hensley", "Lockyer",
		"Brightwell", "Cotterill", "Pickering", "Haddon", "Langley", "Tasker", "Whitcombe",
		"Burrows", "Dunlop", "McKinnon", "Gillies", "Muirhead", "Calder", "Fairbairn", "Marsden",
		"Coutts", "Blackmore", "Sowerby", "Lambie", "Ritson", "Torrance", "Cleland", "Moffat",
		"Dinsdale", "Tipene", "Herewini", "Waaka", "Manihera", "Paewai", "Hetaraka", "Kereama",
		"Rangihuna", "Tautahi", "Wihapi", "Tamatea", "Huata", "Pirihi", "Mataira", "Ruatapu"],






	"Fiyi": [
		"Ravuama", "Qalo", "Rokotui", "Vuniwai", "Delai", "Koroi", "Nailevu", "Lomani",
		"Vulaono", "Naqase", "Tuidraki", "Naceba", "Seruvatu", "Bulivou", "Rokobaro", "Vunisa",
		"Raikoti", "Matanitobua", "Nasilasila", "Bainivalu", "Cakau", "Vakaloloma", "Uluvula",
		"Tawake", "Naisoro", "Vuetaki", "Railumu", "Qiolevu", "Naiduki", "Ravulo", "Prasad",
		"Kumar", "Sharma", "Chand", "Lal", "Narayan", "Naidu", "Reddy", "Khan", "Goundar",
		"Pillay", "Maharaj", "Deo"],






	"Tahití": [
		"Teriitahi", "Tetuanui", "Tumahai", "Teihotu", "Tauraa", "Tuheiava", "Raapoto", "Mairai",
		"Tefaatau", "Tetaura", "Terorotua", "Teururai", "Tauotaha", "Teahu", "Tehaamoana",
		"Teihoarii", "Maitere", "Faatau", "Toomaru", "Hapairai", "Tinorua", "Vairaaroa",
		"Tapuni", "Mahinui", "Pambrun", "Salmon", "Drollet", "Lehartel", "Ellacott", "Wong",
		"Lai", "Chan", "Lemoine", "Picard", "Barbier", "Guérin", "Rivière", "Bouvier",
		"Delmas", "Cordier", "Maillard", "Tessier", "Colin"],






	"Nueva Caledonia": [
		"Hnawia", "Gowé", "Waia", "Poédi", "Iékawé", "Wénéhoua", "Hnaije", "Haocas", "Kaloï",
		"Wanabo", "Teimboueone", "Bouarate", "Tiaou", "Pourawa", "Ounou", "Néchéro", "Waheo",
		"Tuifua", "Manufekai", "Falelavaki", "Tauvale", "Tuikalepa", "Lakina", "Mailagi",
		"Felomaki", "Folituu", "Tialetagi", "Dubreuil", "Ohlen", "Martinet", "Jaunay", "Courtot",
		"Gaillard", "Leconte", "Rossignol", "Vautrin", "Charpin", "Mauduit", "Pidoux", "Brunel",
		"Lagrange", "Raffin", "Tessandier"],

}







const FIRST_NAMES: Dictionary = {
	"España": [
		"Marco", "Diego", "Pablo", "Álvaro", "Javier", "Sergio", "Hugo", "Iván", "Rubén", "Adrián",
		"Gonzalo", "Bruno", "Mateo", "Daniel", "Arnau", "Carlos", "Enrique", "Guillermo", "Jorge",
		"Lucas", "Martín", "Nicolás", "Víctor",
		"Aitor", "Borja", "César", "Fernando", "Iker", "Manuel", "Raúl", "Tomás"],
	"Inglaterra": [
		"Jack", "Harry", "George", "Oliver", "James", "Callum", "Lewis", "Mason", "Tommy", "Charlie",
		"Elliot", "Reece", "Joe", "Danny", "Alfie", "Ben", "Connor", "Declan", "Finley", "Jamie",
		"Kyle", "Luke", "Ryan",
		"Archie", "Dominic", "Freddie", "Harvey", "Marcus", "Owen", "Scott", "Tyler", "Adam", "Billy", "Charlie-Joe", "Edward", "Nathan", "Samuel"],
	"Italia": [
		"Marco", "Lorenzo", "Matteo", "Andrea", "Federico", "Davide", "Alessio", "Luca", "Riccardo",
		"Stefano", "Antonio", "Gianluca", "Simone", "Nicola", "Alberto", "Claudio", "Emanuele",
		"Fabio", "Giuseppe", "Leonardo", "Massimo", "Pietro", "Tommaso",
		"Cristian", "Daniele", "Enrico", "Francesco", "Gabriele", "Michele", "Paolo", "Samuele"],
	"Alemania": [
		"Lukas", "Felix", "Jonas", "Leon", "Niklas", "Moritz", "Tim", "Florian", "Max", "Julian",
		"Philipp", "Tobias", "Fabian", "David", "Andreas", "Benedikt", "Christian", "Dominik",
		"Erik", "Hendrik", "Marvin", "Sebastian", "Thomas",
		"Arne", "Bastian", "Jannik", "Kevin", "Lars", "Marcel", "Patrick", "Sven"],
	"México": [
		"Luis", "Carlos", "Jorge", "Miguel", "Diego", "Javier", "Raúl", "Emiliano", "Santiago",
		"Héctor", "César", "Fernando", "Rodrigo", "Ángel", "Alejandro", "Bruno", "Eduardo",
		"Gerardo", "Ignacio", "Martín", "Oscar", "Ricardo", "Sergio",
		"Andrés", "Efraín", "Gilberto", "Ismael", "Joaquín", "Mauricio", "Pablo", "Ulises"],
	"Portugal": [
		"João", "Pedro", "Tiago", "Rui", "Diogo", "André", "Gonçalo", "Ricardo", "Bruno", "Nuno",
		"Miguel", "Fábio", "Rafael", "Hugo", "Afonso", "Daniel", "Eduardo", "Francisco", "Guilherme",
		"Luís", "Mário", "Simão", "Vasco",
		"Artur", "Carlos", "Dário", "Filipe", "Jorge", "Marco", "Paulo", "Tomás"],
	"Francia": [
		"Lucas", "Hugo", "Théo", "Enzo", "Nathan", "Maxime", "Clément", "Antoine", "Jules", "Léo",
		"Mathis", "Romain", "Kévin", "Baptiste", "Adrien", "Benoît", "Cédric", "Damien", "Florian",
		"Gaël", "Loïc", "Olivier", "Quentin",
		"Alexis", "Corentin", "Dylan", "Étienne", "Grégoire", "Morgan", "Thibault", "Valentin", "Arnaud", "Bastien", "Didier", "Fabien", "Guillaume", "Mathieu", "Pascal", "Sebastien", "Yannick"],
	"Países Bajos": [
		"Daan", "Sem", "Lars", "Bram", "Luuk", "Thijs", "Jordy", "Ruud", "Koen", "Joris", "Stijn",
		"Niels", "Jasper", "Teun", "Bas", "Dirk", "Floris", "Gijs", "Hugo", "Jelle", "Maarten",
		"Pieter", "Sander",
		"Arjen", "Cas", "Dennis", "Ferdi", "Henk", "Menno", "Rik", "Willem", "Joost", "Timo"],
	"Brasil": [
		"Lucas", "Gabriel", "Rafael", "Bruno", "Felipe", "Thiago", "Matheus", "Rodrigo", "Diego",
		"Caio", "Enzo", "João", "Pedro", "Igor", "André", "Carlos", "Davi", "Eduardo", "Fábio",
		"Gustavo", "Leonardo", "Marcelo", "Vinícius",
		"Alisson", "Douglas", "Emerson", "Jonas", "Luciano", "Paulinho", "Renato", "Wesley", "Murilo", "Otavio", "Vitor", "Samuel", "Arthur", "Henrique", "Ricardo", "Marcos", "Roberto", "Fernando", "Gilberto", "Claudio", "Evandro", "Juliano", "Leandro", "Maicon", "Romulo", "Wallace"],





	"Argentina": [
		"Matías", "Lucas", "Santiago", "Nicolás", "Franco", "Agustín", "Joaquín", "Tomás", "Gonzalo",
		"Emiliano", "Ignacio", "Julián", "Ramiro", "Bruno", "Alejo", "Benjamín", "Cristian", "Diego",
		"Federico", "Leandro", "Martín", "Rodrigo", "Valentín",
		"Braian", "Ezequiel", "Gastón", "Hernán", "Lautaro", "Nahuel", "Pablo", "Thiago", "Emanuel", "German", "Ivan", "Lisandro", "Mariano", "Mauro", "Ruben", "Sebastian", "Walter",
		"Alan", "Axel", "Claudio", "Damián", "Enzo", "Facundo", "Gabriel", "Kevin", "Maximiliano"],
	"Estados Unidos": [
		"Tyler", "Brandon", "Kevin", "Jordan", "Austin", "Dylan", "Chase", "Mason", "Logan", "Cody",
		"Trevor", "Blake", "Devin", "Cole", "Aaron", "Brett", "Cameron", "Derek", "Ethan", "Garrett",
		"Hunter", "Jared", "Shane",
		"Brady", "Carson", "Grant", "Jackson", "Landon", "Preston", "Riley", "Wyatt"],
	"Arabia Saudí": [
		"Mohammed", "Abdullah", "Fahad", "Khalid", "Salem", "Nasser", "Turki", "Youssef", "Sultan",
		"Faisal", "Omar", "Saad", "Bandar", "Ziyad", "Ahmed", "Badr", "Firas", "Hassan", "Ibrahim",
		"Majed", "Rakan", "Talal", "Waleed",
		"Abdulaziz", "Ayman", "Hattan", "Meshal", "Nawaf", "Raed", "Sami", "Yasser", "Ali", "Hamdan", "Jaber", "Musab", "Osama", "Rayan", "Ziyad-Abdul"],
	"Turquía": [
		"Mehmet", "Emre", "Burak", "Can", "Arda", "Ozan", "Kerem", "Yusuf", "Kaan", "Tolga",
		"Serkan", "Onur", "Hakan", "Umut", "Alper", "Berkay", "Cem", "Deniz", "Efe", "Fatih",
		"Gökhan", "Ilkay", "Mert",
		"Alperen", "Bariş", "Doğan", "Ertuğrul", "Halil", "Kutay", "Sinan", "Volkan", "Okan", "Semih"],
	"Bélgica": [
		"Lucas", "Noah", "Liam", "Arthur", "Louis", "Victor", "Jules", "Finn", "Thomas", "Dries",
		"Senne", "Milan", "Robbe", "Wout", "Bram", "Cédric", "Elias", "Gilles", "Jasper", "Koen",
		"Matthias", "Ruben", "Siebe",
		"Arne", "Daan", "Florian", "Hugo", "Loïc", "Maxime", "Seppe", "Wouter"],
	"Balcanes": [
		"Luka", "Marko", "Ivan", "Nikola", "Stefan", "Ante", "Petar", "Matej", "Filip", "Josip",
		"Darko", "Milan", "Dragan", "Nemanja", "Aleksa", "Boris", "Danilo", "Goran", "Igor", "Jovan",
		"Miroslav", "Slaven", "Zoran",
		"Bojan", "Dušan", "Emir", "Mladen", "Predrag", "Saša", "Vladan", "Željko"],
	"Japón": [
		"Haruto", "Yuto", "Sota", "Ren", "Hinata", "Yuma", "Kaito", "Riku", "Sora", "Takumi",
		"Kenta", "Daiki", "Sho", "Yuki", "Akira", "Daisuke", "Hiroto", "Kenji", "Masashi", "Naoki",
		"Ryota", "Shinji", "Tatsuya",
		"Genki", "Haruki", "Koji", "Masaya", "Shun", "Takashi", "Yoshiki", "Yusuke", "Kazuki", "Ryo", "Tomoya", "Hideki", "Makoto", "Noriaki", "Satoshi", "Takaya", "Tetsuya", "Toshiro", "Yosuke", "Keisuke", "Masato"],
	"Corea": [
		"Minjun", "Seojun", "Jihu", "Hajun", "Doyun", "Siwoo", "Juwon", "Minseok", "Hyun", "Joon",
		"Sungmin", "Taeyang", "Woojin", "Jiho", "Byungho", "Chanho", "Daehyun", "Eunwoo", "Gitae",
		"Hyejun", "Jaewon", "Kyungsu", "Sangwoo",
		"Beomseok", "Donghyun", "Hyeonwoo", "Jinyoung", "Minsu", "Sangho", "Youngjin", "Yunho"],
	"China": [
		"Wei", "Hao", "Lei", "Jun", "Ming", "Yu", "Peng", "Tao", "Bin", "Feng", "Chao", "Kai",
		"Yuan", "Gang", "Cheng", "Dong", "Guang", "Hui", "Jian", "Long", "Qiang", "Sheng", "Xin",
		"Bingwen", "Haoran", "Jianhua", "Liwei", "Rui", "Xiaotian", "Yang", "Zhenyu"],
	"Escocia": [
		"Callum", "Ewan", "Hamish", "Angus", "Lachlan", "Alasdair", "Kenneth", "Malcolm", "Stuart",
		"Gordon", "Rory", "Kieran", "Liam", "Grant", "Dougal", "Blair", "Archie", "Brodie",
		"Cameron", "Donald", "Fraser", "Gregor", "Innes",
		"Craig", "Duncan", "Fergus", "Murray", "Niall", "Ronan", "Scott", "Torquil"],
	"Grecia": [
		"Giorgos", "Dimitris", "Kostas", "Nikos", "Vasilis", "Panagiotis", "Christos", "Andreas",
		"Thanasis", "Stelios", "Lefteris", "Manolis", "Petros", "Alexandros", "Sotiris", "Yiannis",
		"Angelos", "Babis", "Fotis", "Ilias", "Lambros", "Michalis", "Spyros",
		"Achilleas", "Dimosthenis", "Grigoris", "Haralampos", "Pantelis", "Stavros", "Tasos", "Vangelis"],
	"Ucrania": [
		"Andriy", "Oleksandr", "Serhiy", "Volodymyr", "Mykola", "Vitaliy", "Yuriy", "Taras",
		"Bohdan", "Artem", "Denys", "Viktor", "Ihor", "Ruslan", "Mykhailo", "Oleh", "Anatoliy",
		"Dmytro", "Hryhoriy", "Kyrylo", "Maksym", "Nazar", "Pavlo",
		"Danylo", "Leonid", "Markiyan", "Mykyta", "Ostap", "Roman", "Stanislav", "Vasyl"],
	"Austria": [
		"Markus", "Stefan", "Thomas", "Michael", "Andreas", "Christoph", "Florian", "Lukas",
		"Dominik", "Patrick", "Manuel", "David", "Julian", "Sebastian", "Marcel", "Tobias",
		"Alexander", "Bernhard", "Clemens", "Fabio", "Georg", "Jakob", "Mario",
		"Alois", "Gregor", "Hannes", "Kilian", "Moritz", "Raphael", "Simon", "Valentin"],
	"Suiza": [
		"Noah", "Luca", "Reto", "Fabian", "Yann", "Remo", "Silvan", "Michel", "Loris", "Andreas",
		"Renato", "Sébastien", "Urs", "Florian", "Denis", "Marco", "Adrian", "Benjamin", "Cédric",
		"Dario", "Gian", "Jonas", "Mathias",
		"Andrin", "Basil", "Cyril", "Joel", "Levin", "Nico", "Sandro", "Timo"],
	"Chequia": [
		"Jakub", "Tomáš", "Jan", "Martin", "Petr", "Lukáš", "Ondřej", "David", "Filip", "Vojtěch",
		"Adam", "Matěj", "Michal", "Pavel", "Zdeněk", "Václav", "Aleš", "Daniel", "Ivan", "Jaroslav",
		"Karel", "Marek", "Roman",
		"Bohumil", "Dalibor", "Jiří", "Ladislav", "Luboš", "Milan", "Oldřich", "Stanislav"],
	"Croacia": [
		"Ivan", "Marko", "Luka", "Ante", "Josip", "Mateo", "Petar", "Tomislav", "Domagoj", "Nikola",
		"Filip", "Karlo", "Dario", "Bruno", "Stipe", "Mislav", "Antonio", "Borna", "Dino", "Fran",
		"Goran", "Roko", "Tin",
		"Damir", "Frano", "Hrvoje", "Jakov", "Krešimir", "Marin", "Toni", "Zvonimir"],
	"Serbia": [
		"Nemanja", "Aleksandar", "Miloš", "Stefan", "Dušan", "Luka", "Marko", "Nikola", "Filip",
		"Veljko", "Strahinja", "Andrija", "Bogdan", "Mihailo", "Predrag", "Dragan", "Branko",
		"Dejan", "Goran", "Ivan", "Milan", "Ognjen", "Slobodan",
		"Damjan", "Đorđe", "Lazar", "Miroslav", "Petar", "Saša", "Uroš", "Vukašin"],
	"Dinamarca": [
		"Mads", "Rasmus", "Mikkel", "Jonas", "Frederik", "Kasper", "Andreas", "Lasse", "Simon",
		"Nikolaj", "Emil", "Magnus", "Jesper", "Søren", "Anders", "Victor", "Albert", "Christian",
		"Esben", "Gustav", "Jakob", "Martin", "Oliver",
		"Asger", "Birk", "Jeppe", "Malthe", "Morten", "Niclas", "Tobias", "Valdemar"],
	"Noruega": [
		"Magnus", "Lars", "Håkon", "Sondre", "Erling", "Kristian", "Jonas", "Henrik", "Martin",
		"Sverre", "Bjørn", "Eirik", "Tore", "Øyvind", "Andreas", "Morten", "Anders", "Birger",
		"Eivind", "Fredrik", "Gunnar", "Jørgen", "Olav",
		"Arne", "Emil", "Håvard", "Joakim", "Kristoffer", "Ole", "Simen", "Tobias"],
	"Corea del Sur": [
		"Ji-Hwan", "Seung-Jun", "Dong-Hyun", "Myung-Jin", "Woo-Young", "Seung-Ho", "Won-Sik",
		"Ho-Jin", "Tae-Yoon", "Hyun-Woo", "Sang-Ho", "Tae-Hwan", "Gyeong-Won", "Jun-Ho",
		"Chan-Young", "Seok-Ho", "Byung-Hun", "Chul-Soo", "Dae-Jung", "Eun-Sang", "Gi-Chan",
		"Hae-Il", "In-Su",
		"Changmin", "Geonwoo", "Hyunsik", "Jihoon", "Myungjun", "Seungho", "Woojin", "Yongdae", "Jae-Won", "Kwang-Min", "Sung-Hyun", "Young-Jin", "Do-Hyun", "Bo-Kyung", "Min-Jae", "Sang-Woo", "Tae-Seok", "Joon-Young"],
	"Colombia": [
		"Juan", "Carlos", "Andrés", "Santiago", "Mateo", "Sebastián", "Jhon", "Yerson", "Wilmar",
		"Duván", "Luis", "Jefferson", "Óscar", "Freddy", "Miguel", "Dídier", "Alexis", "Brayan",
		"Cristian", "Daniel", "Edwin", "Fabián", "Harold",
		"Alirio", "Deiver", "Germán", "Jader", "Mauricio", "Néstor", "Stiven", "Yeison", "Arley", "Camilo", "Ever", "Helmer", "Norberto", "Wilder",
		"Kevin", "Jhojan", "Rafael", "Teófilo"],
	"Chile": [
		"Matías", "Ignacio", "Vicente", "Cristián", "Sebastián", "Felipe", "Nicolás", "Rodrigo",
		"Esteban", "Claudio", "Gonzalo", "Mauricio", "Alexis", "Benjamín", "Tomás", "Franco",
		"Álvaro", "Bruno", "César", "Diego", "Eduardo", "Javier", "Martín",
		"Alonso", "Damián", "Enrique", "Hernán", "Leonardo", "Nelson", "Rodolfo", "Salvador", "Andres", "Joaquin", "Manuel",


		"Arturo", "Jorge", "Patricio", "Marcelo", "Humberto", "Iván", "Raúl"],
	"Uruguay": [
		"Santiago", "Matías", "Facundo", "Rodrigo", "Nicolás", "Maximiliano", "Gastón", "Agustín",
		"Diego", "Sebastián", "Mauro", "Brian", "Thiago", "Emiliano", "Joaquín", "Federico",
		"Alejandro", "Bruno", "Cristian", "Damián", "Franco", "Ignacio", "Leandro",
		"Camilo", "Enzo", "Guzmán", "Martín", "Nahuel", "Pablo", "Renzo", "Valentín", "Emilio", "Gonzalo", "Luciano", "Marcelo", "Álvaro", "Carlos", "Fabián", "Germán", "Jonathan", "Mauricio", "Octavio", "Rubén", "Washington"],
	"Egipto": [
		"Ahmed", "Mahmoud", "Mostafa", "Omar", "Karim", "Youssef", "Hossam", "Tarek", "Amr", "Walid",
		"Hussein", "Ziad", "Marwan", "Mohamed", "Ayman", "Khaled", "Abdallah", "Bassem", "Essam",
		"Fady", "Gamal", "Hany", "Islam",
		"Adel", "Emad", "Faris", "Ihab", "Magdy", "Nader", "Ramy", "Sherif"],



	"Nigeria": [
		"Chinedu", "Emeka", "Ifeanyi", "Obinna", "Chidi", "Nnamdi", "Kelechi", "Uche",
		"Ikechukwu", "Chukwuemeka", "Oluwaseun", "Ademola", "Temitope", "Babajide", "Olumide",
		"Tunde", "Segun", "Femi", "Kunle", "Dayo", "Musa", "Ibrahim", "Yakubu", "Ahmed", "Sani",
		"Umar", "Victor", "Samuel", "Daniel", "Peter", "Joseph"],
	"Ghana": [
		"Kwame", "Kofi", "Kwabena", "Yaw", "Kwaku", "Kojo", "Kwasi", "Abeiku", "Emmanuel",
		"Michael", "Richmond", "Jordan", "Thomas", "Daniel", "Andre", "Samuel", "Isaac", "Joseph",
		"Mohammed", "Abdul", "Ibrahim", "Rahim", "Elisha", "Baffour", "Nana", "Osman", "Gideon",
		"Patrick", "Ernest", "Fatawu", "Majeed"],
	"Senegal": [
		"Mamadou", "Ousmane", "Ibrahima", "Abdoulaye", "Cheikh", "Moussa", "Alioune", "Pape",
		"Modou", "Saliou", "Babacar", "Demba", "El Hadji", "Fallou", "Idrissa", "Khadim", "Lamine",
		"Mouhamed", "Ndiaga", "Omar", "Pathé", "Saer", "Tapha", "Youssoupha", "Assane", "Boubacar",
		"Daouda", "Gora", "Malick", "Sény", "Thierno"],
	"Costa de Marfil": [
		"Koffi", "Kouakou", "Yao", "Konan", "Amani", "Brou", "Kouadio", "N'Da", "Ibrahim",
		"Lassina", "Sékou", "Mamadou", "Issouf", "Karim", "Siaka", "Adama", "Jean-Baptiste",
		"Serge", "Wilfried", "Franck", "Arthur", "Maxwell", "Ghislain", "Romaric", "Christian",
		"Emmanuel", "Gervais", "Hervé", "Landry", "Olivier", "Thierry"],
	"Camerún": [
		"Jean", "Pierre", "Paul", "Martin", "André", "Georges", "Éric", "Patrick", "Serge",
		"Vincent", "Arnaud", "Christian", "Didier", "Fabrice", "Gaëtan", "Hervé", "Joël", "Landry",
		"Marcel", "Nicolas", "Olivier", "Rigobert", "Stéphane", "Thierry", "Yannick", "Achille",
		"Benoît", "Clinton", "Elvis", "Franck", "Idriss"],







	"Suecia": [
		"Erik", "Lars", "Karl", "Anders", "Johan", "Per", "Nils", "Olof", "Gustav", "Magnus",
		"Mattias", "Fredrik", "Henrik", "Jonas", "Marcus", "Viktor", "Emil", "Albin", "Ludvig",
		"Oscar", "Axel", "Hugo", "Elias", "Isak", "Leo", "Melvin", "Theo", "Vilhelm", "Arvid",
		"Filip", "Gabriel", "Linus", "Pontus", "Hampus", "Måns", "Sixten", "Viggo", "Alfred",
		"Sigge", "Wilmer", "Olle", "Ebbe", "Folke", "Valter", "Edvin", "Hjalmar", "Ture"],










	"Marruecos": [
		"Youssef", "Mehdi", "Hamza", "Ayoub", "Omar", "Karim", "Anas", "Bilal", "Réda", "Zakaria",
		"Ismail", "Soufiane", "Abdelali", "Khalid", "Mohamed", "Rachid", "Said", "Tarik", "Yassine",
		"Adil", "Amine", "Badr", "Driss", "Fouad", "Hicham", "Jawad", "Mourad", "Nabil", "Othmane",
		"Samir", "Walid", "Achraf", "Hakim", "Noussair", "Azzedine", "Abdelhamid", "Ilias",
		"Brahim", "Aymane", "Nayef", "Abdessamad", "Yahya", "Mounir", "Abderrazak", "Jamal",
		"Hassan", "Abdelilah"],
	"Polonia": [
		"Jakub", "Kacper", "Antoni", "Jan", "Szymon", "Filip", "Michał", "Bartosz", "Wojciech",
		"Piotr", "Tomasz", "Marcin", "Paweł", "Łukasz", "Mateusz", "Kamil", "Dawid", "Adrian",
		"Krzysztof", "Grzegorz", "Rafał", "Damian", "Przemysław", "Sebastian", "Arkadiusz",
		"Błażej", "Cezary", "Igor", "Mariusz", "Oliwier", "Patryk"],






	"Ecuador": [
		"Ángel", "Jefferson", "Antonio", "Carlos", "Luis", "Jorge", "José", "Miguel", "Juan",
		"Pedro", "Bryan", "Kevin", "Alexander", "Washington", "Wilson", "Edison", "Néicer",
		"Romario", "Dixon", "Joao", "Gonzalo", "Marlon", "Pervis", "Renato", "Segundo", "Ulises",
		"Vinicio", "Xavier", "Yerson", "Éder", "Fidel",
		"Byron", "Cristhian", "Darío", "Enner", "Felipe", "Geovanny", "Holger", "Jhegson",
		"Kendry", "Leonardo", "Moisés", "Nilson", "Óscar", "Patricio", "Robert", "Stalin"],
	"Perú": [
		"José", "Luis", "Carlos", "Miguel", "Jorge", "Pedro", "Juan", "Manuel", "Andrés", "Raúl",
		"Christian", "Renato", "Edison", "Yoshimar", "Alexander", "Aldo", "Gianluca", "Paolo",
		"Sergio", "Wilder", "Anderson", "Bryan", "César", "Diego", "Franco", "Horacio", "Iván",
		"Marcos", "Oscar", "Piero", "Santiago",
		"Alexis", "Alonso", "Claudio", "Erick", "Gustavo", "Hernán", "Jair", "Jesús",
		"Kenji", "Leandro", "Nolberto", "Roberto", "Teófilo", "Víctor", "Yordy", "Hugo"],
	"Venezuela": [
		"José", "Luis", "Carlos", "Jefferson", "Salomón", "Tomás", "Yeferson", "Darwin", "Rómulo",
		"Wuilker", "Alejandro", "Cristian", "Eduard", "Fernando", "Gabriel", "Jhon", "Junior",
		"Mikel", "Nahuel", "Rafael", "Sergio", "Yangel", "Adrián", "Bernardo", "Daniel", "Eric",
		"Josef", "Manuel", "Óscar", "Richard", "Víctor",
		"Andrés", "Arquímedes", "Edson", "Franklin", "Giovanni", "Héctor", "Jhonder", "Kervin",
		"Leonardo", "Miguel", "Nicolás", "Ronald", "Telasco", "Yohandry", "Juan", "Freddy"],
	"Paraguay": [
		"Juan", "Miguel", "Óscar", "Derlis", "Gustavo", "Roque", "Antonio", "Carlos", "Julio",
		"Blas", "Ángel", "Braian", "César", "Diego", "Fabián", "Gastón", "Hernán", "Iván",
		"Jorge", "Luis", "Matías", "Néstor", "Pedro", "Ramón", "Richard", "Rodrigo", "Santiago",
		"Tomás", "Víctor", "Wilson", "Alberto",
		"Celso", "Cristhian", "Darío", "Édgar", "Francisco", "Hugo", "Julián", "Junior",
		"Lorenzo", "Marcos", "Nelson", "Osvaldo", "Paulo", "Robert", "Salvador", "Teodoro"],


	"Bolivia": [
		"Juan", "Carlos", "José", "Luis", "Marcelo", "Ronald", "Erwin", "Jhasmani", "Diego",
		"Henry", "Pablo", "Gilbert", "Leonel", "Alejandro", "Miguel", "Fernando", "Jaime",
		"Wálter", "Rodrigo", "Danny", "Boris", "Jhon", "Víctor", "Ramiro", "Óscar", "Limberg",
		"Jesús", "Franz", "Moisés", "Gabriel", "Héctor",
		"Álvaro", "Bruno", "Cristian", "Edgar", "Fabio", "Gualberto", "Joselito", "Leonardo",
		"Mauricio", "Nelson", "Pedro", "Raúl", "Ronaldo", "Sebastián", "Vladimir", "Wilfredo"],
	"Gales": [
		"Gareth", "Dylan", "Rhys", "Owain", "Ieuan", "Geraint", "Huw", "Ifan", "Carwyn", "Meirion",
		"Aled", "Bedwyr", "Ceri", "Dafydd", "Emlyn", "Gareth John", "Hywel", "Iestyn", "Llŷr",
		"Morgan", "Osian", "Padrig", "Sion", "Taliesin", "Tomos", "Wyn", "Aneurin", "Bryn",
		"Cadog", "Eifion", "Gwyn"],
	"Irlanda": [
		"Seán", "Conor", "Liam", "Ciarán", "Declan", "Eoin", "Finn", "Oisín", "Pádraig", "Ronan",
		"Aidan", "Brendan", "Cillian", "Darragh", "Fergal", "Garrett", "Killian", "Lorcan",
		"Niall", "Odhrán", "Ruairí", "Shane", "Tadhg", "Barry", "Cathal", "Dermot", "Eamon",
		"Kevin", "Micheál", "Patrick", "Stephen"],

	"Rusia": [
		"Aleksandr", "Dmitri", "Sergei", "Andrei", "Aleksei", "Maksim", "Ivan", "Artem", "Nikita",
		"Mikhail", "Kirill", "Roman", "Egor", "Denis", "Pavel", "Vladislav", "Nikolai", "Anton",
		"Viktor", "Yuri", "Igor", "Oleg", "Vadim", "Timur", "Stanislav", "Gleb", "Fyodor", "Ruslan",
		"Bogdan", "Lev", "Konstantin"],
	"Rumanía": [
		"Andrei", "Alexandru", "Gabriel", "Mihai", "Florin", "Cristian", "Ionuț", "Răzvan", "Bogdan",
		"Adrian", "Daniel", "Marius", "Nicolae", "Vlad", "George", "Cătălin", "Dragoş", "Ciprian",
		"Sorin", "Valentin", "Radu", "Ovidiu", "Lucian", "Sebastian", "Tudor", "Darius", "Ionel",
		"Constantin", "Vasile", "Petru", "Emil"],





	"Bosnia y Herzegovina": [
		"Amar", "Armin", "Emir", "Haris", "Kenan", "Mirza", "Nermin", "Samir", "Admir", "Damir",
		"Adnan", "Tarik", "Jasmin", "Elvir", "Senad", "Almir", "Benjamin", "Eldin", "Muhamed",
		"Nedim", "Faruk", "Ajdin", "Selmir", "Ermin",
		"Ante", "Ivan", "Josip", "Mario", "Ivica", "Dario",
		"Stefan", "Nemanja", "Dejan", "Miloš", "Siniša", "Srđan", "Vladimir"],
	"Sudáfrica": [
		"Thabo", "Sipho", "Lucas", "Kagiso", "Bongani", "Themba", "Lebogang", "Tshepo", "Mandla",
		"Sibusiso", "Katlego", "Percy", "Kamohelo", "Teboho", "Itumeleng", "Keagan", "Dean", "Bradley",
		"Ryan", "Ethan", "Keegan", "Lyle", "Grant", "Dillon", "Siyabonga", "Nkosinathi", "Andile",
		"Lindokuhle", "Thapelo", "Oscarine", "Wayne"],






	"Túnez": [
		"Karim", "Aymen", "Nabil", "Anis", "Mourad", "Moez", "Tarek", "Lotfi", "Ali",
		"Hichem", "Firas", "Oussama", "Hamza", "Bassem", "Faouzi", "Yassine", "Issam",
		"Saber", "Adel", "Haythem", "Chiheb", "Zied", "Nidhal", "Houssem", "Mortadha", "Skander",
		"Rami", "Bilel", "Mehdi", "Achref", "Iheb", "Khalil", "Sami", "Riadh", "Slim", "Marouen",
		"Amine"],
	"Catar": [
		"Akram", "Hassan", "Almoez", "Karim", "Abdelkarim", "Tarek", "Bassam", "Mohammed", "Ahmed",
		"Ali", "Khalid", "Yousef", "Jassem", "Saad", "Hamza", "Abdullah", "Mostafa", "Ibrahim",
		"Rashid", "Nasser", "Salem", "Boualem", "Musab", "Osama", "Assim", "Homam", "Tameem", "Fahad",
		"Ghanim", "Mahmoud", "Pedro"],


	"Jordania": [
		"Musa", "Yazan", "Ehsan", "Mahmoud", "Abdallah", "Nizar", "Rajaei", "Anas", "Yazeed", "Ali",
		"Mohannad", "Odai", "Saleh", "Ahmad", "Baha", "Hamza", "Feras", "Amer", "Noor", "Ibrahim",
		"Khalil", "Tareq", "Laith", "Mutaz", "Bahaa", "Sami", "Karam", "Zaid", "Adnan", "Mansour",
		"Rami"],
	"Emiratos": [
		"Ali", "Ahmed", "Khalid", "Rashid", "Saeed", "Abdullah", "Mohammed", "Hamdan", "Khalfan",
		"Sultan", "Majed", "Hamad", "Omar", "Yahya", "Walid", "Tahnoon", "Habib", "Zayed", "Salem",
		"Ismail", "Haroon", "Bandar", "Jasim", "Nader", "Youssef", "Adel", "Obaid", "Fabio", "Caio",
		"Marcus", "Sebastian"],

	"Irán": [
		"Ali", "Mohammad", "Reza", "Hossein", "Amir", "Mehdi", "Saeid", "Majid", "Hamid", "Vahid",
		"Mehrdad", "Behnam", "Karim", "Omid", "Farzad", "Arash", "Kaveh", "Siavash", "Dariush",
		"Babak", "Pouria", "Milad", "Ehsan", "Navid", "Saman", "Peyman", "Kourosh", "Shahin",
		"Arman", "Behzad", "Farhad"],


	"Uzbekistán": [
		"Eldor", "Otabek", "Jasurbek", "Abbosbek", "Oston", "Sanjar", "Doston", "Azizbek", "Husniddin",
		"Rustam", "Javokhir", "Bobur", "Temur", "Farrukh", "Odiljon", "Shokhrukh", "Ulugbek",
		"Alisher", "Bekzod", "Sardor", "Umidjon", "Iskandar", "Shohruh", "Diyor", "Ruslan", "Igor",
		"Vitaliy", "Anvar", "Mirjalol", "Khojiakbar", "Fozil"],
	"Hungría": [
		"László", "István", "Zoltán", "Gábor", "Tamás", "Attila", "András", "Péter", "Balázs",
		"Gergő", "Márton", "Bence", "Dániel", "Ádám", "Krisztián", "Róbert", "Máté", "Dávid", "Zsolt",
		"Norbert", "Botond", "Levente", "Ákos", "Csaba", "Dénes", "Ferenc", "Gyula", "Imre", "Károly",
		"Miklós", "Sándor"],
	"Finlandia": [
		"Mikko", "Juho", "Antti", "Ville", "Joonas", "Teemu", "Eero", "Lauri", "Tuomas", "Aki", "Jari",
		"Petri", "Sami", "Markus", "Janne", "Toni", "Niko", "Kalle", "Otto", "Veeti", "Eetu", "Onni",
		"Elias", "Leevi", "Rasmus", "Arttu", "Jere", "Kasper", "Pyry", "Väinö", "Aarne"],
	"Vietnam": [
		"Minh", "Tuan", "Huy", "Anh", "Duc", "Quang", "Hai", "Son", "Thanh", "Hung", "Nam", "Long",
		"Phong", "Tai", "Viet", "Khanh", "Trung", "Cuong", "Dung", "Hoang", "Kien", "Bao", "Dat",
		"Giang", "Hieu", "Khoa", "Loc", "Nghia", "Phuc", "Tien", "Vinh"],
	"Tailandia": [
		"Somchai", "Suchart", "Wichai", "Anon", "Narong", "Thana", "Phirom", "Kritsada", "Anucha",
		"Boonsong", "Chalerm", "Decha", "Kamphol", "Manop", "Niwat", "Parot", "Prasit", "Sakchai",
		"Sombat", "Thawee", "Wirat", "Adisorn", "Chatchai", "Pongsak", "Ruangsak", "Sitthichai",
		"Taweesak", "Watchara", "Yuthana", "Prayoon", "Surachai"],
	"Israel": [
		"Yossi", "Itay", "Eden", "Ofir", "Tal", "Gal", "Omri", "Lior", "Dor", "Moshe", "Avi", "Yarden",
		"Shon", "Idan", "Nir", "Guy", "Amit", "Eyal", "Ronen", "Tomer", "Yaniv", "Ziv", "Bar", "Elior",
		"Gilad", "Hananel", "Maor", "Nadav", "Oz", "Shahar", "Yuval"],
	"Georgia": [
		"Giorgi", "Levan", "Davit", "Irakli", "Zurab", "Nika", "Lasha", "Vakhtang", "Gela", "Tornike",
		"Saba", "Luka", "Besik", "Kakha", "Merab", "Otar", "Revaz", "Shota", "Temur", "Vano", "Zaza",
		"Badri", "Dato", "Guram", "Koba", "Mamuka", "Nodar", "Rati", "Sandro", "Vaso", "Beka"],
	"Armenia": [
		"Armen", "Aram", "Hovhannes", "Vahagn", "Gevorg", "Davit", "Tigran", "Narek", "Hayk", "Artur",
		"Garik", "Karen", "Levon", "Sargis", "Vahe", "Ashot", "Edgar", "Gor", "Hrach", "Mher", "Nshan",
		"Raffi", "Samvel", "Vardan", "Yervand", "Arsen", "Bagrat", "Grigor", "Martin", "Suren",
		"Taron"],
	"Indonesia": [
		"Budi", "Agus", "Dedi", "Eko", "Rizky", "Andika", "Bayu", "Dimas", "Fajar", "Hendra", "Irfan",
		"Joko", "Rendi", "Satrio", "Taufik", "Wahyu", "Yoga", "Arif", "Bagas", "Fadil", "Febri",
		"Gilang", "Hanif", "Ilham", "Rizal", "Sandi", "Teguh", "Zainal", "Aditya", "Ridwan", "Putra"],




	"Nueva Zelanda": [
		"Sam", "Jake", "Josh", "Blake", "Cooper", "Logan", "Ethan", "Jordan", "Riley", "Mitchell",
		"Zac", "Bailey", "Hayden", "Kurt", "Brady", "Toby", "Nick", "Matt", "Corey", "Luke",
		"Ben", "Tom", "Cameron", "Hamish", "Angus", "Nikau", "Tane", "Rawiri", "Wiremu",
		"Manaia", "Ihaia", "Tamati", "Hemi", "Kauri", "Rangi", "Mikaere", "Ari"],


	"Fiyi": [
		"Josaia", "Epeli", "Isoa", "Jone", "Joeli", "Kalivati", "Lepani", "Maika", "Mosese",
		"Netani", "Osea", "Peni", "Semi", "Sakiusa", "Tevita", "Timoci", "Vilikesa", "Waisake",
		"Apisai", "Inoke", "Aisea", "Manasa", "Ravinesh", "Shalendra", "Rajesh", "Avinesh",
		"Sunil", "Pranil", "Ashneel", "Anish", "Vikash"],
	"Tahití": [
		"Teva", "Tehei", "Heimana", "Manutea", "Moana", "Raiarii", "Hiro", "Tamatoa", "Teiki",
		"Vaitea", "Heiarii", "Tuarii", "Rahiti", "Mahiti", "Teriitea", "Raimana", "Steeve",
		"Jean-Marc", "Rodolphe", "Yohan", "Mickaël", "Rémy", "Christophe", "Sébastien",
		"Thierry", "Patrick", "Lionel", "Frédéric", "Jérôme", "Ludovic", "Gilles"],



	"Nueva Caledonia": [
		"Néhémie", "Ézéchiel", "Josué", "Élie", "Matthias", "Gédéon", "Isaac", "Zacharie",
		"Siméon", "Sosefo", "Petelo", "Malakai", "Soane", "Manuele", "Kalolo", "Tomasi",
		"Jérémy", "Dimitri", "Anthony", "Cyril", "Franck", "Yoann", "Brice", "Loris", "Teddy",
		"Sylvain", "Hervé", "Noa", "Raphaël", "Wilfried", "Johan"],

}











const FORMATION: Array[String] = [

	"POR", "DFC", "DFC", "LTI", "LTD", "MC", "MC", "MI", "MD", "DC", "DC",

	"POR", "DFC", "LTI", "LTD", "MC", "MD", "CAM",









	"POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
	"MC", "MC", "MI", "MI", "MD", "CAM", "CAM"]






















const FORMATIONS: Dictionary = {


	"4-4-2": {
		"xi": ["POR", "DFC", "DFC", "LTI", "LTD", "MC", "MC", "MI", "MD", "DC", "DC"],
		"bench": ["POR", "DFC", "LTI", "LTD", "MC", "MD", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
			"MC", "MC", "MI", "MI", "MD", "CAM", "CAM"],
	},














	"4-3-3": {
		"xi": ["POR", "DFC", "DFC", "LTI", "LTD", "MC", "MC", "MC", "MI", "DC", "MD"],
		"bench": ["POR", "DFC", "LTI", "LTD", "MCD", "MC", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
			"MC", "MC", "MC", "MI", "MD", "CAM", "CAM"],
	},






	"4-5-1": {
		"xi": ["POR", "DFC", "DFC", "LTI", "LTD", "MCD", "MC", "MC", "MI", "MD", "DC"],
		"bench": ["POR", "DFC", "LTI", "LTD", "MCD", "MC", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
			"MC", "MC", "MI", "MI", "MD", "MD", "CAM"],
	},

	"5-3-2": {
		"xi": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MC", "MC", "MC", "DC", "DC"],
		"bench": ["POR", "DFC", "DFC", "LTI", "LTD", "MC", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "DFC", "LTI", "LTD",
			"MCD", "MC", "MC", "MC", "MI", "MD", "CAM"],
	},

	"3-5-2": {
		"xi": ["POR", "DFC", "DFC", "DFC", "MI", "MC", "MCD", "MC", "MD", "DC", "DC"],
		"bench": ["POR", "DFC", "DFC", "MCD", "MC", "MI", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "DFC", "MCD", "MC",
			"MC", "MC", "MI", "MI", "MD", "MD", "CAM"],
	},























	"4-1-2-3": {
		"xi": ["POR", "DFC", "DFC", "LTI", "LTD", "MCD", "MC", "MC", "EI", "DC", "ED"],
		"bench": ["POR", "DFC", "LTI", "LTD", "MCD", "MC", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
			"MC", "MC", "MI", "MD", "CAM", "EI", "ED"],
	},



	"4-2-1-3": {
		"xi": ["POR", "DFC", "DFC", "LTI", "LTD", "MCD", "MCD", "CAM", "EI", "DC", "ED"],
		"bench": ["POR", "DFC", "LTI", "LTD", "MCD", "MC", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
			"MC", "MC", "MI", "MD", "CAM", "EI", "ED"],
	},












	"4-2-3-1": {
		"xi": ["POR", "DFC", "DFC", "LTI", "LTD", "MC", "MC", "EI", "CAM", "ED", "DC"],
		"bench": ["POR", "DFC", "LTI", "LTD", "MCD", "MC", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
			"MC", "MC", "MI", "MD", "CAM", "EI", "ED"],
	},

	"4-3-1-2": {
		"xi": ["POR", "DFC", "DFC", "LTI", "LTD", "MC", "MCD", "MC", "CAM", "DC", "DC"],
		"bench": ["POR", "DFC", "LTI", "LTD", "MCD", "MC", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
			"MC", "MC", "MI", "MD", "CAM", "EI", "ED"],
	},



	"4-4-1-1": {
		"xi": ["POR", "DFC", "DFC", "LTI", "LTD", "MI", "MC", "MC", "MD", "CAM", "DC"],
		"bench": ["POR", "DFC", "LTI", "LTD", "MC", "MD", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "LTI", "LTD", "MCD",
			"MC", "MC", "MI", "MD", "CAM", "EI", "ED"],
	},

	"3-4-1-2": {
		"xi": ["POR", "DFC", "DFC", "DFC", "MI", "MC", "MC", "MD", "CAM", "DC", "DC"],
		"bench": ["POR", "DFC", "DFC", "MCD", "MC", "MI", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "DFC", "MCD", "MC",
			"MC", "MI", "MI", "MD", "CAM", "EI", "ED"],
	},

	"3-4-3": {
		"xi": ["POR", "DFC", "DFC", "DFC", "MI", "MC", "MC", "MD", "EI", "DC", "ED"],
		"bench": ["POR", "DFC", "DFC", "MCD", "MC", "MI", "CAM"],
		"reserve": ["POR", "DFC", "DFC", "DFC", "DFC", "MCD", "MC",
			"MC", "MI", "MI", "MD", "CAM", "EI", "ED"],
	},
}








const FAMILIA: Dictionary = {
	"4-4-2": ["4-4-1-1", "4-3-1-2"],
	"4-3-3": ["4-1-2-3", "4-2-1-3", "4-2-3-1"],
	"4-5-1": ["4-4-1-1", "4-2-3-1"],
	"3-5-2": ["3-4-1-2", "3-4-3"],
	"5-3-2": [],
}






const FAMILIA_IDEA: Dictionary = {
	"4-2-3-1": ["4-4-1-1", "4-2-1-3"],
	"3-4-3": ["3-4-1-2", "3-5-2"],
}




static func familia_idea(quiere: String) -> Array:
	if FAMILIA.has(quiere):
		return FAMILIA[quiere] as Array
	return FAMILIA_IDEA.get(quiere, []) as Array












static func base_formation_of(team_id: String) -> String:
	if _base_cache.has(team_id):
		return String(_base_cache[team_id])
	var team: Dictionary = Teams.by_id(team_id)
	if team.is_empty():
		team = Nations.as_team(team_id)
	var pool: Array = _pool_formaciones(team_id)



	var plan: String = String(pool[abs(hash(team_id + "form")) % pool.size()])



	var fijada: String = String(team.get("formacion", ""))
	if FORMATIONS.has(fijada):
		_base_cache[team_id] = fijada
		return fijada

















	if not Teams.by_id(team_id).is_empty():



		var plantel: Array = []
		if not _plantel_llena(team_id, plan, plantel):
			for f in _formas_candidatas(team_id):
				if _plantel_llena(team_id, String(f), plantel):
					plan = String(f)
					break




		plan = _hermana_que_sienta(team_id, plan, plantel)
	_base_cache[team_id] = plan
	return plan





static var _base_cache: Dictionary = {}






static func _pool_formaciones(team_id: String) -> Array:
	var team: Dictionary = Teams.by_id(team_id)
	if team.is_empty():
		team = Nations.as_team(team_id)
	var rating: int = int(team.get("rating", 68))
	if rating >= 78:
		return ["4-3-3", "4-3-3", "4-4-2", "3-5-2"]
	if rating >= 66:
		return ["4-4-2", "4-3-3", "4-4-2", "3-5-2"]
	return ["4-4-2", "4-5-1", "5-3-2", "4-5-1"]







const SLUMP_DIVS: int = -1


const DEFENSIVE_LADDER: Array[String] = ["5-3-2", "4-5-1"]

static var _plan_cache: Dictionary = {}













static var coach_plan: Dictionary = {}





static var coach_plan_tuyo: String = ""


















static func formation_of(team_id: String) -> String:



	if _forma_dia.has(team_id):
		return String(_forma_dia[team_id])
	if _plan_plantel.has(team_id):
		return String(_plan_plantel[team_id])
	return formation_plan(team_id)








static var _plan_plantel: Dictionary = {}







static func formation_plan(team_id: String) -> String:
	if _plan_cache.has(team_id):
		return String(_plan_cache[team_id])

	var plan: String = base_formation_of(team_id)

















	var quiere: String = String(coach_plan.get(team_id, ""))
	if not quiere.is_empty() and FORMATIONS.has(quiere):
		plan = _forma_del_tecnico(team_id, quiere, plan)


	if ClubForm.pyramid_of(team_id) <= SLUMP_DIVS and not Teams.by_id(team_id).is_empty():
		for f in DEFENSIVE_LADDER:
			if f != plan and _plantel_cubre(team_id, String(f)):
				plan = String(f)
				break
	_plan_cache[team_id] = plan
	return plan






























static func _forma_del_tecnico(team_id: String, quiere: String, plan: String) -> String:
	var hermanas: Array = familia_idea(quiere)



	if team_id != coach_plan_tuyo:
		if quiere == plan or hermanas.has(plan):
			return plan
		for f in [quiere] + hermanas:
			if _plantel_cubre(team_id, String(f)):
				return String(f)
		return plan
	var antes: String = plan
	if quiere != plan and not hermanas.has(plan) and _plantel_cubre(team_id, quiere):
		antes = quiere
	if USER_POS == "POR" or sienta(antes, USER_POS):
		return antes
	var familia: Array = [quiere]
	familia.append_array(hermanas)
	for f in familia:
		if sienta(String(f), USER_POS) and _plantel_cubre(team_id, String(f)):
			return String(f)
	return plan if sienta(plan, USER_POS) else antes




static func sienta(forma: String, pos: String) -> bool:
	return ((FORMATIONS.get(forma, {}) as Dictionary).get("xi", []) as Array).has(pos)



















static var _forma_dia: Dictionary = {}


static func set_forma_dia(team_id: String, forma: String) -> void:
	if forma.is_empty() or not FORMATIONS.has(forma) or forma == _plan_de_hoy(team_id):
		if _forma_dia.erase(team_id):
			_marca_orden_cambiado()
		return
	if String(_forma_dia.get(team_id, "")) == forma:
		return
	_forma_dia[team_id] = forma
	_marca_orden_cambiado()







static func _plan_de_hoy(team_id: String) -> String:
	return String(_plan_plantel.get(team_id, formation_plan(team_id)))












static func forma_del_dia(team_id: String, squad: Array, meta: Array) -> String:
	var del_tecnico: String = _forma_del_tecnico_hoy(team_id, squad, meta)
	if not del_tecnico.is_empty():
		return del_tecnico
	var plan: String = _plan_de_hoy(team_id)
	var mejor: String = plan
	var mejor_h: int = Rotation.huecos_sin_puesto(squad, meta,
		slots_of(plan).slice(0, STARTING_XI))
	if mejor_h == 0:
		return plan
	var tuyo: String = _asiento_de(team_id)
	var mejor_s: bool = sienta(plan, tuyo)
	for f in _formas_candidatas(team_id):
		if String(f) == plan:
			continue
		var h: int = Rotation.huecos_sin_puesto(squad, meta,
			slots_of(String(f)).slice(0, STARTING_XI))
		var s: bool = sienta(String(f), tuyo)
		if h < mejor_h or (h == mejor_h and s and not mejor_s):
			mejor_h = h
			mejor = String(f)
			mejor_s = s
			if h == 0 and (s or tuyo.is_empty()):
				break
	return mejor























static func _forma_del_tecnico_hoy(team_id: String, squad: Array, meta: Array) -> String:
	var quiere: String = String(coach_plan.get(team_id, ""))
	if quiere.is_empty() or not FORMATIONS.has(quiere):
		return ""
	var plan: String = _plan_de_hoy(team_id)
	if DEFENSIVE_LADDER.has(plan) and ClubForm.pyramid_of(team_id) <= SLUMP_DIVS:
		return ""
	var familia: Array = [quiere]
	familia.append_array(familia_idea(quiere))
	if familia.has(plan):
		return ""
	var tuyo: String = _asiento_de(team_id)
	var mejor: String = ""
	var mejor_v: int = -1
	for f in familia:
		var forma: String = String(f)
		if not tuyo.is_empty() and not sienta(forma, tuyo):
			continue
		var slots: Array = slots_of(forma).slice(0, STARTING_XI)
		if Rotation.huecos_sin_puesto(squad, meta, slots) > 0:
			continue
		var once: Array = Rotation.lineup(squad, meta, slots)
		if once.size() != slots.size():
			continue
		var v: int = 0
		for k in once.size():
			v += SquadMeta.media_of(squad[int(once[k])], String(slots[k]))
		if v > mejor_v:
			mejor_v = v
			mejor = forma
	return mejor





static func _asiento_de(team_id: String) -> String:
	if USER_POS == "POR" or not coach_plan.has(team_id) or team_id != coach_plan_tuyo:
		return ""
	return USER_POS




















static var _urgencias: Dictionary = {}


static func set_urgencias(team_id: String, fichas: Dictionary) -> void:
	if fichas.is_empty():
		if _urgencias.erase(team_id):
			_marca_orden_cambiado()
		return
	if _urgencias.get(team_id, {}) == fichas:
		return
	_urgencias[team_id] = fichas
	_marca_orden_cambiado()




static func aplica_urgencias(team_id: String, squad: Array) -> Array:
	var fichas: Dictionary = _urgencias.get(team_id, {})
	if fichas.is_empty():
		return squad
	for i in squad.size():
		var a: int = home_seat(squad, i)
		if fichas.has(a):
			squad[i] =(fichas[a] as Dictionary).duplicate(true)
	return squad





static func canterano_urgencia(team_id: String, pos: String, seat: int,
		ocupados: Dictionary = {}) -> Dictionary:
	var t: Dictionary = Teams.by_id(team_id)
	var ficha: Dictionary = AiMarket.youth_identity(team_id, pos,
		int(t.get("rating", 65)), Teams.country_of(team_id),
		int(GameState.season_num), 7000 + seat, ocupados)
	ficha["pos"] = pos
	ficha["poss"] = [pos]
	ficha[SEAT_KEY] = seat
	ficha["urgencia"] = true
	return ficha







static func convoca_urgencia(team_id: String, squad: Array, meta: Array,
		slots: Array) -> Dictionary:
	var sq: Array = squad.duplicate()
	var mt: Array = meta.duplicate()
	var fichas: Dictionary = {}
	var faltan: int = Rotation.huecos_sin_puesto(sq, mt, slots)
	if faltan <= 0:
		return {"squad": sq, "meta": mt, "fichas": fichas}
	var ocupados: Dictionary = {}
	for p in sq:
		ocupados[String((p as Dictionary).get("name", ""))] = true


	var plazas: Array[int] = []
	for i in mini(sq.size(), mt.size()):
		if not Rotation.disponible(mt[i]):
			plazas.append(i)
	for i in range(mini(sq.size(), mt.size()) - 1, -1, -1):
		if not plazas.has(i):
			plazas.append(i)




	var usadas: Dictionary = {}
	var guarda: int = 0
	while faltan > 0 and guarda < slots.size():
		guarda += 1
		var falta: Array = Rotation.huecos_descubiertos(sq, mt, slots)
		if falta.is_empty():
			break
		var pos: String = "POR" if falta.has("POR") else String(falta[0])
		var hecho: bool = false



		for i in plazas:
			if usadas.has(i):
				continue
			var antes_p: Dictionary = sq[i]
			var antes_m: Dictionary = mt[i]
			var chaval: Dictionary = canterano_urgencia(team_id, pos,
				home_seat(squad, i), ocupados)
			sq[i] = chaval
			mt[i] = {}
			var h: int = Rotation.huecos_sin_puesto(sq, mt, slots)
			if h < faltan:
				faltan = h
				usadas[i] = true
				fichas[home_seat(squad, i)] = chaval
				ocupados[String(chaval.get("name", ""))] = true
				hecho = true
				break
			sq[i] = antes_p
			mt[i] = antes_m
		if not hecho:
			break
	return {"squad": sq, "meta": mt, "fichas": fichas}







static func _plantel_cubre(team_id: String, forma: String) -> bool:
	var xi: Array =(FORMATIONS.get(forma, {}) as Dictionary).get("xi", []) as Array
	if xi.is_empty():
		return false
	var hay: Dictionary = {}
	for p in WorldDB.squad_of(team_id):
		var pos: String = String((p as Dictionary).get("pos", ""))
		hay[pos] = int(hay.get(pos, 0)) + 1
	if hay.is_empty():
		return false
	for slot in xi:
		var k: String = String(slot)
		if int(hay.get(k, 0)) <= 0:
			return false
		hay[k] = int(hay[k]) - 1
	return true
























static func _plantel_de_fabrica(team_id: String) -> Array:
	var plantel: Array = WorldDB.squad_of(team_id)
	if plantel.is_empty():
		return []


	SquadEdits.alarga_fabrica(team_id, plantel)
	SquadEdits.apply(team_id, plantel)
	return plantel















static var _llena_cache: Dictionary = {}


static func invalidate_formaciones(team_id: String = "") -> void:
	if team_id.is_empty():
		_llena_cache.clear()
		_hermana_cache.clear()
		_orden_fabrica.clear()
		return
	_orden_fabrica.erase(team_id)
	for k in _llena_cache.keys():
		if String(k).begins_with(team_id + "|"):
			_llena_cache.erase(k)

	for k in _hermana_cache.keys():
		if String(k).begins_with(team_id + "|"):
			_hermana_cache.erase(k)








static func _plantel_llena(team_id: String, forma: String,
		plantel_ref: Array = []) -> bool:
	var clave: String = team_id + "|" + forma
	if _llena_cache.has(clave):
		return bool(_llena_cache[clave])
	if plantel_ref.is_empty():
		plantel_ref.append_array(_plantel_de_fabrica(team_id))
	var ok: bool = _calcula_llena(team_id, forma, plantel_ref)
	_llena_cache[clave] = ok
	return ok


static func _calcula_llena(team_id: String, forma: String,
		plantel_in: Array = []) -> bool:
	var xi: Array =(FORMATIONS.get(forma, {}) as Dictionary).get("xi", []) as Array
	if xi.is_empty():
		return false
	var plantel: Array = plantel_in if not plantel_in.is_empty() \
			else _plantel_de_fabrica(team_id)
	if plantel.is_empty():
		return false

	var puede: Array = []
	var cabe: Array = _cabe_pre(plantel)
	for slot in xi:
		var lista: Array[int] = []
		for i in plantel.size():
			if _cabe_pre_en(cabe[i], String(slot)):
				lista.append(i)
		if lista.is_empty():
			return false
		puede.append(lista)
	var de_quien: Dictionary = {}
	for k in xi.size():
		if not _aumenta(k, puede, de_quien, {}):
			return false
	return true





static func _aumenta(k: int, puede: Array, de_quien: Dictionary,
		visto: Dictionary) -> bool:
	for raw in (puede[k] as Array):
		var i: int = int(raw)
		if visto.has(i):
			continue
		visto[i] = true
		if not de_quien.has(i) or _aumenta(int(de_quien[i]), puede, de_quien, visto):
			de_quien[i] = k
			return true
	return false






static func _formas_candidatas(team_id: String) -> Array:
	var out: Array = []
	for f in _pool_formaciones(team_id):
		if not out.has(f):
			out.append(f)
	for f in FORMATIONS:
		if not out.has(f):
			out.append(f)
	return out


























const HERMANA_MARGEN: int = 1



const HERMANA_TOP: int = 14






static var _hermana_cache: Dictionary = {}


static func _hermana_que_sienta(team_id: String, base: String,
		plantel_ref: Array = []) -> String:
	var hermanas: Array = FAMILIA.get(base, []) as Array
	if hermanas.is_empty():
		return base
	var clave: String = team_id + "|" + base
	if _hermana_cache.has(clave):
		return String(_hermana_cache[clave])
	if plantel_ref.is_empty():
		plantel_ref.append_array(_plantel_de_fabrica(team_id))
	var elegida: String = base
	if not plantel_ref.is_empty():
		var top: Array = _top_de_fabrica(plantel_ref)



		var listar: int = _asientos_exactos(base, top) + HERMANA_MARGEN - 1
		for f in hermanas:
			if not _plantel_llena(team_id, String(f), plantel_ref):
				continue
			var s: int = _asientos_exactos(String(f), top)
			if s > listar:
				listar = s
				elegida = String(f)
	_hermana_cache[clave] = elegida
	return elegida






static func _top_de_fabrica(plantel: Array) -> Array:
	var orden: Array = plantel.duplicate()
	orden.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return _nivel_fabrica(a) > _nivel_fabrica(b))
	return orden.slice(0, HERMANA_TOP)


static func _nivel_fabrica(p: Dictionary) -> float:
	var suma: float = 0.0
	for k in WorldDB.STATS:
		suma += float(p.get(k, 50))
	return suma / float(WorldDB.STATS.size())






static func _asientos_exactos(forma: String, top: Array) -> int:
	var xi: Array =(FORMATIONS.get(forma, {}) as Dictionary).get("xi", []) as Array
	if xi.is_empty():
		return 0
	var puede: Array = []
	for slot in xi:
		var lista: Array[int] = []
		for i in top.size():
			if String((top[i] as Dictionary).get("pos", "")) == String(slot):
				lista.append(i)
		puede.append(lista)
	var de_quien: Dictionary = {}
	var n: int = 0
	for k in xi.size():
		if _aumenta(k, puede, de_quien, {}):
			n += 1
	return n






static func formation_slots(team_id: String) -> Array:
	return slots_of(formation_of(team_id))







static func slots_of(forma: String) -> Array:
	var f: Dictionary = FORMATIONS.get(forma, FORMATIONS[DEFAULT_FORMATION])
	var out: Array = []
	out.append_array(f["xi"])
	out.append_array(f["bench"])
	out.append_array(f["reserve"])
	return out















static func banca_con_banda(xi: Array, banca: Array) -> Array:
	const BANDAS: Array = ["EI", "ED", "MI", "MD"]
	for b in banca:
		if BANDAS.has(String(b)):
			return banca
	var banda: String = ""
	for s in xi:
		if BANDAS.has(String(s)):
			banda = String(s)
			break
	if banda.is_empty():
		return banca
	var out: Array = banca.duplicate()
	for lat in ["LTD", "LTI"]:
		if out.count("LTI") + out.count("LTD") < 2:
			break
		var k: int = out.rfind(lat)
		if k >= 0:
			out[k] = banda
			return out
	return banca




const DEFAULT_FORMATION: String = "4-4-2"



















static var USER_POS: String = "DC"































const PUESTOS_ALTA: Array[String] = ["DC", "CAM", "EI", "ED", "MC", "MI", "MD", "MCD"]







const PUESTOS_RECONVERSION: Array[String] = ["DC", "CAM"]




static func puesto_elegible(pos: String) -> bool:
	if pos == "POR":
		return false
	var linea: String = String(POS_LINE.get(pos, ""))
	return linea == "DEL" or linea == "MED"






const STARTING_XI: int = 11















const BENCH_SIZE: int = 7









const RESERVE_SIZE: int = 14
const SQUAD_SIZE: int = STARTING_XI + BENCH_SIZE + RESERVE_SIZE








static func tier_of(rank: int) -> String:
	if rank < STARTING_XI:
		return "titular"
	if rank < STARTING_XI + BENCH_SIZE:
		return "banca"
	return "reserva"












const NUM_PREF: Dictionary = {
	"POR": [1, 13, 25],
	"DFC": [4, 5, 6, 3, 16],
	"LTI": [3, 15, 23],
	"LTD": [2, 12, 24],
	"MCD": [6, 5, 14, 8],
	"MC": [8, 10, 14, 18],
	"MI": [11, 17, 21],
	"MD": [7, 16, 22],
	"DC": [9, 19, 20],
	"CAM": [10, 7, 11, 20],
	"EI": [11, 7, 17, 21],
	"ED": [7, 11, 22, 26],
}




const NUM_SPARE: Array[int] = [12, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
	25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38]





static func assign_numbers(squad: Array) -> void:
	var taken: Dictionary = {}
	for p in squad:
		p["number"] = _sirve_dorsal(String(p.get("pos", "DC")), taken)













static func free_number(squad: Array, pos: String, team_id: String = "") -> int:
	var taken: Dictionary = {}
	if team_id == user_shirt_team and user_shirt_number > 0:
		taken[user_shirt_number] = true
	for p in squad:
		taken[int((p as Dictionary).get("number", 0))] = true
	return _sirve_dorsal(pos, taken)






static func _sirve_dorsal(pos: String, taken: Dictionary) -> int:
	for cand in NUM_PREF.get(pos, NUM_PREF["DC"]) as Array:
		if not taken.has(int(cand)):
			taken[int(cand)] = true
			return int(cand)
	for cand in NUM_SPARE:
		if not taken.has(cand):
			taken[cand] = true
			return cand



	var n: int = taken.size() + 1
	while taken.has(n):
		n += 1
	taken[n] = true
	return n



































const ROLE_BONUS: Dictionary = {



























































	"POR": [-25, -25, -20, 0, -35, -35, 4, -8, -2, -6, -35, -10],
	"DFC": [-6, -12, -14, 12, -16, -14, -35, -8, 10, -8, -20, 18],
	"LTI": [-4, -6, 4, -4, -8, -4, -35, 10, 4, 8, 2, 0],
	"LTD": [-4, -6, 4, -4, -8, -4, -35, 10, 4, 8, 2, 0],
	"MCD": [0, -4, -2, 4, -4, -2, -35, -6, 8, -6, -6, 12],
	"MC": [2, 4, 6, -2, 4, 6, -35, -2, 0, 0, 6, 0],
	"MI": [0, 2, 10, -6, 2, 12, -35, 14, -10, 12, 12, -8],
	"MD": [0, 2, 10, -6, 2, 12, -35, 14, -10, 12, 12, -8],
	"DC": [10, 8, -2, 10, 8, 2, -35, 8, -24, 8, 6, 10],
	"CAM": [4, 10, 8, 0, 10, 10, -35, 10, -20, 10, 14, -8],





	"EI": [0, 4, 10, -10, 2, 10, -35, 13, -16, 14, 10, -10],
	"ED": [0, 4, 10, -10, 2, 10, -35, 13, -16, 14, 10, -10],
}

























































































const LEVEL_ANCHORS: Array = [
	[57, 54], [65, 59], [75, 65], [82, 69], [88, 72], [92, 76], [94, 79],
	[96, 82], [97, 83], [99, 85],
]



static func club_level(rating: int) -> int:
	var r: float = float(rating)
	if r <= float(LEVEL_ANCHORS[0][0]):
		return int(LEVEL_ANCHORS[0][1])
	for i in range(1, LEVEL_ANCHORS.size()):
		var x1: float = float(LEVEL_ANCHORS[i][0])
		if r <= x1:
			var x0: float = float(LEVEL_ANCHORS[i - 1][0])
			var y0: float = float(LEVEL_ANCHORS[i - 1][1])
			var y1: float = float(LEVEL_ANCHORS[i][1])
			return int(round(y0 +(y1 - y0) *(r - x0) /(x1 - x0)))
	return int(LEVEL_ANCHORS[-1][1])




















static func rating_for_level(level: float) -> float:
	if level <= float(LEVEL_ANCHORS[0][1]):
		var y_a: float = float(LEVEL_ANCHORS[0][1])
		var y_b: float = float(LEVEL_ANCHORS[1][1])
		var x_a: float = float(LEVEL_ANCHORS[0][0])
		var x_b: float = float(LEVEL_ANCHORS[1][0])
		if y_b <= y_a:
			return x_a
		return x_a +(x_b - x_a) *(level - y_a) /(y_b - y_a)
	for i in range(1, LEVEL_ANCHORS.size()):
		var y1: float = float(LEVEL_ANCHORS[i][1])
		if level <= y1:
			var y0: float = float(LEVEL_ANCHORS[i - 1][1])
			var x0: float = float(LEVEL_ANCHORS[i - 1][0])
			var x1: float = float(LEVEL_ANCHORS[i][0])
			if y1 <= y0:
				return x1
			return x0 +(x1 - x0) *(level - y0) /(y1 - y0)

	var n: int = LEVEL_ANCHORS.size()
	var ya: float = float(LEVEL_ANCHORS[n - 2][1])
	var yb: float = float(LEVEL_ANCHORS[n - 1][1])
	var xa: float = float(LEVEL_ANCHORS[n - 2][0])
	var xb: float = float(LEVEL_ANCHORS[n - 1][0])
	if yb <= ya:
		return xb
	return xa +(xb - xa) *(level - ya) /(yb - ya)













































const SEAT_LADDER: Array[int] = [
	5, 3, 2, 1, 1, 1, 0, 0, -1, -2, -2,
	-4, -5, -5, -6, -6, -7, -7,
	-8, -8, -9, -9, -10, -10, -11,




	-11, -12, -12, -13, -13, -14, -14,
]











































































const TOP_LEAGUES: Array[String] = [
	"España", "Inglaterra", "Italia", "Alemania", "Francia",
]
const GOLD_FLOOR: int = 75


static func gold_floor(team: Dictionary) -> int:
	if not TOP_LEAGUES.has(String(team.get("country", ""))):
		return 0



	if bool(team.get("is_nation", false)):
		return 0








	var id: String = String(team.get("id", ""))
	var div: int = Teams.base_div(id) if not id.is_empty() \
			else int(team.get("div", 0))
	return GOLD_FLOOR if div == 1 else 0







































const DEPTH_BENCH_RATING: int = 93
const DEPTH_RESERVE_RATING: int = 97



const DEPTH_RESERVE_FLOOR: int = 70







const DEPTH_RAMP: int = 14
const DEPTH_BENCH_GAP: int = 5







static func seat_floor(team: Dictionary, rank: int) -> int:
	var base: int = gold_floor(team)
	if base <= 0:
		return 0
	var rating: int = int(team.get("rating", 62))


	if rank < STARTING_XI:
		return base



















	var hondo: int = maxi(SQUAD_SIZE - STARTING_XI, 1)
	var paso: int = rank - STARTING_XI + 1
	var arranque: int = base if rating >= DEPTH_BENCH_RATING else base - DEPTH_BENCH_GAP
	var piso: int = arranque - int(round(float(DEPTH_RAMP) * float(paso) / float(hondo)))
	if rating >= DEPTH_RESERVE_RATING:
		piso = maxi(piso, DEPTH_RESERVE_FLOOR)
	return maxi(piso, 0)


















static func _lift_to_floor(p: Dictionary, pos: String, floor_lvl: int) -> void:
	if floor_lvl <= 0:
		return




	if p.has("media"):
		return






















	for _intento in 4:
		var falta: int = floor_lvl - SquadMeta.media_of(p, pos)
		if falta <= 0:
			return
		for k in ["pegada", "punteria", "rosca", "cabeza", "penal", "parado",
				"reflejos", "velocidad", "entrada", "aceleracion"]:
			if p.has(k):
				p[k] = _stat(int(p[k]) + falta)















const STAR_GATE: int = 93
const STAR_W: float = 0.2


static func star_bonus(rating: int) -> int:
	return int(round(maxf(0.0, float(rating - STAR_GATE)) * STAR_W))





static func seat_level(rating: int, rank: int) -> int:
	var r: int = clampi(rank, 0, SEAT_LADDER.size() - 1)
	var lvl: int = club_level(rating) + SEAT_LADDER[r]
	if r == 0:
		lvl += star_bonus(rating)
	return lvl










































































const OVR_WEIGHTS: Dictionary = {



















	"POR": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.2, 0.2, 0.2, 0.0, 0.0],
	"DFC": [0.03, 0.02, 0.0, 0.23, 0.0, 0.0, 0.0, 0.08, 0.32, 0.08, 0.1, 0.14],
	"LTI": [0.12, 0.11, 0.0, 0.08, 0.0, 0.0, 0.0, 0.18, 0.24, 0.12, 0.05, 0.1],
	"LTD": [0.12, 0.11, 0.0, 0.08, 0.0, 0.0, 0.0, 0.18, 0.24, 0.12, 0.05, 0.1],
	"MCD": [0.12, 0.09, 0.0, 0.07, 0.0, 0.0, 0.0, 0.07, 0.37, 0.05, 0.09, 0.14],
	"MC": [0.2, 0.23, 0.0, 0.05, 0.0, 0.0, 0.0, 0.09, 0.16, 0.05, 0.12, 0.1],
	"MI": [0.16, 0.23, 0.0, 0.05, 0.0, 0.0, 0.0, 0.18, 0.08, 0.11, 0.12, 0.07],
	"MD": [0.16, 0.23, 0.0, 0.05, 0.0, 0.0, 0.0, 0.18, 0.08, 0.11, 0.12, 0.07],
	"DC": [0.2, 0.2, 0.0, 0.14, 0.0, 0.0, 0.0, 0.12, 0.03, 0.1, 0.12, 0.09],
	"CAM": [0.2, 0.3, 0.0, 0.07, 0.0, 0.0, 0.0, 0.12, 0.08, 0.08, 0.09, 0.06],
	"EI": [0.16, 0.25, 0.0, 0.03, 0.0, 0.0, 0.0, 0.22, 0.05, 0.14, 0.1, 0.05],
	"ED": [0.16, 0.25, 0.0, 0.03, 0.0, 0.0, 0.0, 0.22, 0.05, 0.14, 0.1, 0.05],
}



static func ovr_weights(pos: String) -> Array:
	var w: Variant = OVR_WEIGHTS.get(pos, null)
	return w if w is Array else (OVR_WEIGHTS["MC"] as Array)

















static func role_offset(pos: String) -> float:
	var b: Variant = ROLE_BONUS.get(pos, null)
	if not (b is Array):
		return 0.0
	var a: Array = b
	var w: Array = ovr_weights(pos)
	var acc: float = 0.0
	for i in mini(a.size(), w.size()):
		acc += float(w[i]) * float(int(a[i]))
	return acc





















































const OVR_PIVOTE: float = 60.0




static var _ovr_offset_top: float = -1.0

static func ovr_max_offset() -> float:
	if _ovr_offset_top < 0.0:
		var top: float = 0.0
		for pos in OVR_WEIGHTS.keys():
			top = maxf(top, role_offset(String(pos)))
		_ovr_offset_top = top
	return _ovr_offset_top





const OVR_CURVE: float = 5.0











static func ovr_scale(nivel: float) -> int:
	return int(round(ovr_scale_f(nivel)))





static func ovr_scale_f(nivel: float) -> float:




	return clampf(ovr_scale_raw(nivel), 25.0, 99.0)











static func ovr_scale_raw(nivel: float) -> float:
	var techo: float = floorf(99.0 - ovr_max_offset())
	var t: float = clampf((nivel - OVR_PIVOTE) / maxf(1.0, techo - OVR_PIVOTE),
		0.0, 1.0)
	return nivel + ovr_max_offset() * pow(t, OVR_CURVE)





static func ovr_unscale(ovr: float) -> float:
	var lo: float = 25.0
	var hi: float = 99.0
	for _i in 40:
		var mid: float =(lo + hi) * 0.5
		if ovr_scale_f(mid) < ovr:
			lo = mid
		else:
			hi = mid
	return (lo + hi) * 0.5















const KEEPER_STATS: Array[String] = ["velocidad", "aceleracion", "entrada", "reflejos"]
const FIELD_STATS: Array[String] = ["velocidad", "aceleracion", "regate", "fisico",
	"entrada", "pegada", "punteria", "rosca", "cabeza", "penal", "parado"]

static func stat_keys_for(pos: String) -> Array:
	return KEEPER_STATS if pos == "POR" else FIELD_STATS


static func pos_expect(base_rating: int, pos: String) -> int:











	return club_level(base_rating) if base_rating > 0 else 0




































const STRENGTH_CLAMP: int = 4


const STRENGTH_W: float = 0.75

static var _strength_cache: Dictionary = {}





static func strength(team_id: String) -> int:
	if _strength_cache.has(team_id):
		return _strength_cache[team_id]
	var base: int = Teams.rating(team_id)





	var squad: Array = plantel_sin_once(team_id)
	var out: int = base
	if not squad.is_empty():
		var sum_gap: float = 0.0
		var n: int = 0
		for i in mini(STARTING_XI, squad.size()):
			var p: Dictionary = squad[i]
			var pos: String = String(p.get("pos", "MC"))
			sum_gap += float(SquadMeta.media_of(p, pos) - pos_expect(base, pos))
			n += 1
		if n > 0:
			out = base + clampi(int(round(sum_gap / float(n) * STRENGTH_W)),
				- STRENGTH_CLAMP, STRENGTH_CLAMP)
	_strength_cache[team_id] = out
	return out



























const FUERZA_SIM_PIVOTE: float = 85.0















const FUERZA_SIM_ESTIRA: float = 0.9






static func estira_fuerza(s: float) -> float:
	return s + FUERZA_SIM_ESTIRA * maxf(0.0, s - FUERZA_SIM_PIVOTE)











static func fuerza_sim(team_id: String) -> float:
	return estira_fuerza(float(strength(team_id)))













static func fuerza_sim_sin_ti(team_id: String) -> float:
	return estira_fuerza(float(strength_sin_ti(team_id)))



static func strength_sin_ti(team_id: String) -> int:
	if team_id.is_empty() or team_id != coach_plan_tuyo:
		return strength(team_id)
	var cajas: Array = _cajas_del_club()
	var foto: Array = []
	for caja in cajas:
		var d: Dictionary = caja
		foto.append([d.has(team_id), d.get(team_id)])
	var plan: Dictionary = coach_plan
	coach_plan = plan.duplicate()
	coach_plan.erase(team_id)
	coach_plan_tuyo = ""
	_tira_club(team_id)
	var f: int = strength(team_id)
	coach_plan = plan
	coach_plan_tuyo = team_id
	for i in cajas.size():
		var d2: Dictionary = cajas[i]
		if bool(foto[i][0]):
			d2[team_id] = foto[i][1]
		else:
			d2.erase(team_id)
	return f







static func fuerza_con_delta(team_id: String, d: float) -> float:
	return estira_fuerza(float(strength(team_id)) + d)





























const BAJAS_TOPE: float = 3.0








static func plantel_sin_once(team_id: String) -> Array:
	if _lineups.has(team_id):
		if not _cache.has(team_id):
			of(team_id)
		if _cache.has(team_id):
			return _cache[team_id]
	return of(team_id)



















static func orden_con_bajas(team_id: String, fuera: Dictionary) -> Array:
	var squad: Array = plantel_sin_once(team_id)
	var n: int = squad.size()



	var huecos: Array = slots_of(_plan_de_hoy(team_id))
	var corto: bool = Rotation.huecos_sin_puesto(squad, _meta_de_bajas(squad, {}),
		huecos.slice(0, STARTING_XI)) > 0
	var toca: bool = corto
	for i in mini(STARTING_XI + BENCH_SIZE, n):
		if fuera.has(home_seat(squad, i)):
			toca = true
			break
	if not toca:
		return []
	var usado: Dictionary = {}
	var once: Array[int] = []
	for i in mini(STARTING_XI, n):
		if fuera.has(home_seat(squad, i)):
			once.append(-1)
		else:
			once.append(i)
			usado[i] = true


	var legal: bool = _rellena(squad, huecos, fuera, once, usado) and not corto






	if not legal:
		var dia: Dictionary = dia_con_bajas(team_id, fuera)
		var xi_slots: Array = slots_of(String(dia["forma"])).slice(0, STARTING_XI)
		var xi: Array = []





		if String(dia["forma"]) == _plan_de_hoy(team_id):
			var fijos: Dictionary = {}
			for k in mini(STARTING_XI, n):
				var i: int = int(once[k]) if k < once.size() else -1
				if i >= 0 and i < STARTING_XI and not (dia["fichas"] as Dictionary).has(
						home_seat(squad, i)) and _cabe_en(squad[i], String(xi_slots[k])):
					fijos[k] = i
			xi = Rotation.lineup(dia["squad"], dia["meta"], xi_slots, 1.0, fijos)
			for k in xi.size():
				if not _cabe_en(dia["squad"][int(xi[k])], String(xi_slots[k])):
					xi = []
					break
		if xi.size() != STARTING_XI:
			xi = Rotation.lineup(dia["squad"], dia["meta"], xi_slots)
		if xi.size() == STARTING_XI:
			usado.clear()
			once.clear()
			for i in xi:
				once.append(int(i))
				usado[int(i)] = true
	var out: Array = []
	for k in once.size():
		if once[k] >= 0:
			out.append(home_seat(squad, once[k]))
	for i in n:
		if usado.has(i) or fuera.has(home_seat(squad, i)):
			continue
		out.append(home_seat(squad, i))
	return out










static func _rellena(squad: Array, huecos: Array, fuera: Dictionary, once: Array[int],
		usado: Dictionary) -> bool:
	var legal: bool = true
	for k in once.size():
		if once[k] >= 0:
			continue
		var hueco: String = String(huecos[k]) if k < huecos.size() \
				else String((squad[k] as Dictionary).get("pos", "MC"))
		var j: int = _quien_entra(squad, hueco, fuera, usado)
		if j >= 0:
			once[k] = j
			usado[j] = true
		else:
			legal = false
	return legal





static func _quien_entra(squad: Array, pos_hueco: String, fuera: Dictionary,
		usado: Dictionary) -> int:
	var es_por: bool = pos_hueco == "POR"
	var linea: String = line_of(pos_hueco)
	var banca_fin: int = mini(STARTING_XI + BENCH_SIZE, squad.size())
	for tramo in [[STARTING_XI, banca_fin], [banca_fin, squad.size()]]:
		var primero: int = -1
		for i in range(int(tramo[0]), int(tramo[1])):
			if usado.has(i) or fuera.has(home_seat(squad, i)):
				continue
			var p: Dictionary = squad[i]
			var pos_i: String = String(p.get("pos", "MC"))
			if (pos_i == "POR") != es_por:
				continue



			if not _cabe_en(p, pos_hueco):
				continue
			if primero < 0:
				primero = i
			if es_por or line_of(pos_i) == linea:
				return i
		if primero >= 0:
			return primero
	return -1








static func _lista_entrada(squad: Array, pos_hueco: String) -> PackedInt32Array:
	var out: PackedInt32Array = PackedInt32Array()
	var es_por: bool = pos_hueco == "POR"
	var linea: String = line_of(pos_hueco)
	var banca_fin: int = mini(STARTING_XI + BENCH_SIZE, squad.size())
	for tramo in [[STARTING_XI, banca_fin], [banca_fin, squad.size()]]:
		var otros: PackedInt32Array = PackedInt32Array()
		for i in range(int(tramo[0]), int(tramo[1])):
			var p: Dictionary = squad[i]
			var pos_i: String = String(p.get("pos", "MC"))
			if (pos_i == "POR") != es_por or not _cabe_en(p, pos_hueco):
				continue
			if es_por or line_of(pos_i) == linea:
				out.append(i)
			else:
				otros.append(i)
		out.append_array(otros)
	return out





static func _meta_de_bajas(squad: Array, fuera: Dictionary) -> Array:
	var meta: Array = []
	meta.resize(squad.size())
	for i in squad.size():
		meta[i] = {"injury_weeks": 1} if fuera.has(home_seat(squad, i)) else {}
	return meta





static func forma_con_bajas(team_id: String, fuera: Dictionary) -> String:
	return String(dia_con_bajas(team_id, fuera)["forma"])






static func dia_con_bajas(team_id: String, fuera: Dictionary) -> Dictionary:
	var squad: Array = plantel_sin_once(team_id)
	var meta: Array = _meta_de_bajas(squad, fuera)
	var forma: String = forma_del_dia(team_id, squad, meta)
	var u: Dictionary = convoca_urgencia(team_id, squad, meta,
		slots_of(forma).slice(0, STARTING_XI))
	u["forma"] = forma
	return u




static func fija_dia_con_bajas(team_id: String, fuera: Dictionary) -> void:
	var dia: Dictionary = dia_con_bajas(team_id, fuera)
	set_forma_dia(team_id, String(dia["forma"]))
	set_urgencias(team_id, dia["fichas"])








static func delta_bajas(team_id: String, fuera: Dictionary) -> float:
	return clampf(_desvio_del_once(team_id, orden_con_bajas(team_id, fuera)), - BAJAS_TOPE, 0.0)














static func delta_once(squad: Array, slots: Array, hoy: Array, fresco: Array, k_mio: int = -1) -> float:
	var xi: int = mini(STARTING_XI, slots.size())
	if xi <= 0 or hoy.size() < xi or fresco.size() < xi:
		return 0.0
	var gap: float = 0.0
	for k in xi:
		if k == k_mio:
			continue
		var i_hoy: int = int(hoy[k])
		var i_fresco: int = int(fresco[k])
		if i_hoy == i_fresco or i_hoy < 0 or i_fresco < 0 \
				or i_hoy >= squad.size() or i_fresco >= squad.size():
			continue
		var pos: String = String(slots[k])
		gap += float(SquadMeta.media_of(squad[i_hoy], pos) - SquadMeta.media_of(squad[i_fresco], pos))
	return clampf(gap / float(xi) * STRENGTH_W, - ONCE_TOPE, 0.0)







static func _desvio_del_once(team_id: String, orden: Array) -> float:
	if orden.is_empty():
		return 0.0
	var squad: Array = plantel_sin_once(team_id)
	var xi: int = mini(STARTING_XI, squad.size())
	if xi <= 0:
		return 0.0
	var por_asiento: Dictionary = {}
	for i in squad.size():
		por_asiento[home_seat(squad, i)] = i
	var gap: float = 0.0
	for k in mini(xi, orden.size()):
		var j: int = int(por_asiento.get(int(orden[k]), k))
		if j == k:
			continue
		var titular: Dictionary = squad[k]
		var pos: String = String(titular.get("pos", "MC"))
		gap += float(SquadMeta.media_of(squad[j], pos) - SquadMeta.media_of(titular, pos))
	return gap / float(xi) * STRENGTH_W














static func fuerza_sim_con_bajas(team_id: String, fuera: Dictionary, carga_hoy: int = 1,
		carga_prev: int = 1, semilla: int = 0, extra: float = 0.0) -> float:
	var sentados: int = sentados_por_carga(carga_hoy, carga_prev)
	if fuera.is_empty() and sentados <= 0 and extra == 0.0:
		return fuerza_sim(team_id)
	var d: float = 0.0
	if not fuera.is_empty():
		d += delta_bajas(team_id, fuera)
	if sentados > 0:
		d += delta_carga(team_id, carga_hoy, carga_prev, semilla, fuera)
	d += extra
	return fuerza_con_delta(team_id, d)





























const CARGA_TOPE: float = 2.0









const ONCE_TOPE: float = BAJAS_TOPE + CARGA_TOPE















const CARGA_SENTADOS_POR_PARTIDO: int = 4




const CARGA_SENTADOS_MAX: int = 6


static var carga_sentados_por_partido: int = CARGA_SENTADOS_POR_PARTIDO




const CARGA_RUIDO: float = 1.0










static func sentados_por_carga(carga_hoy: int, carga_prev: int) -> int:
	var hoy: int = maxi(carga_hoy - 1, 0)
	var prev: int = maxi(carga_prev - 1, 0)
	return clampi((carga_sentados_por_partido *(2 * hoy + prev))>>1, 0, CARGA_SENTADOS_MAX)





















static func orden_con_carga(team_id: String, carga_hoy: int, carga_prev: int, semilla: int,
		fuera: Dictionary = {}) -> Array:
	var sentar: int = sentados_por_carga(carga_hoy, carga_prev)
	if sentar <= 0:
		return orden_con_bajas(team_id, fuera)
	var squad: Array = plantel_sin_once(team_id)
	var n: int = squad.size()
	var xi_n: int = mini(STARTING_XI, n)
	var huecos: Array = slots_of(_plan_de_hoy(team_id))
	if Rotation.huecos_sin_puesto(squad, _meta_de_bajas(squad, {}),
			huecos.slice(0, STARTING_XI)) > 0:
		return orden_con_bajas(team_id, fuera)
	var usado_xi: Dictionary = {}
	for i in xi_n:
		if not fuera.has(home_seat(squad, i)):
			usado_xi[i] = true
	var cand: Array = []
	for k in xi_n:
		var asiento: int = home_seat(squad, k)
		if fuera.has(asiento):
			continue
		var titular: Dictionary = squad[k]
		var pos: String = String(titular.get("pos", "MC"))
		var hueco: String = String(huecos[k]) if k < huecos.size() else pos
		if pos == "POR" or hueco == "POR":
			continue
		var j: int = _quien_entra(squad, hueco, fuera, usado_xi)
		if j < 0:
			continue
		var ventaja: float = float(SquadMeta.media_of(titular, pos)
			- SquadMeta.media_of(squad[j], pos))
		var ruido: float = float(absi(hash([team_id, semilla, asiento])) % 1000) / 1000.0 \
				* CARGA_RUIDO
		cand.append([ventaja + ruido, k])
	cand.sort_custom(func(a: Array, b: Array) -> bool:
		return a[0] < b[0] or (a[0] == b[0] and a[1] < b[1]))
	var elegidos: Array = []
	for c in cand.slice(0, sentar):
		elegidos.append(int(c[1]))
	var once: Array[int] = []
	var usado: Dictionary = {}
	var fuera2: Dictionary = {}
	while not elegidos.is_empty():
		fuera2 = fuera.duplicate()
		for k in elegidos:
			fuera2[home_seat(squad, int(k))] = true
		once.clear()
		usado.clear()
		for i in xi_n:
			if fuera2.has(home_seat(squad, i)):
				once.append(-1)
			else:
				once.append(i)
				usado[i] = true
		if _rellena(squad, huecos, fuera2, once, usado):
			break
		elegidos.pop_back()
	if elegidos.is_empty():
		return orden_con_bajas(team_id, fuera)
	var out: Array = []
	for k in once.size():
		out.append(home_seat(squad, once[k]))
	elegidos.sort()
	for k in elegidos:
		out.append(home_seat(squad, int(k)))
	for i in n:
		if usado.has(i) or fuera2.has(home_seat(squad, i)):
			continue
		out.append(home_seat(squad, i))
	return out










static func delta_carga(team_id: String, carga_hoy: int, carga_prev: int, semilla: int,
		fuera: Dictionary = {}) -> float:
	if sentados_por_carga(carga_hoy, carga_prev) <= 0:
		return 0.0
	if fuera.is_empty():
		return delta_carga_rapida(team_id, carga_hoy, carga_prev, semilla)
	return _delta_carga_exacta(team_id, carga_hoy, carga_prev, semilla, fuera)






static func _delta_carga_exacta(team_id: String, carga_hoy: int, carga_prev: int,
		semilla: int, fuera: Dictionary) -> float:
	if sentados_por_carga(carga_hoy, carga_prev) <= 0:
		return 0.0
	var con: float = _desvio_del_once(team_id,
		orden_con_carga(team_id, carga_hoy, carga_prev, semilla, fuera))
	var sin: float = _desvio_del_once(team_id, orden_con_bajas(team_id, fuera))
	return clampf(con - sin, - CARGA_TOPE, 0.0)









static var _fichas_carga: Dictionary = {}
static var _fichas_carga_version: int = -1


const FICHAS_CARGA_MAX: int = 1024


static func _ficha_carga(team_id: String) -> Dictionary:
	if _fichas_carga_version != cache_version():
		_fichas_carga.clear()
		_fichas_carga_version = cache_version()
	var plan: String = _plan_de_hoy(team_id)
	var f: Dictionary = _fichas_carga.get(team_id, {})
	if not f.is_empty() and String(f["plan"]) == plan:
		return f
	if _fichas_carga.size() >= FICHAS_CARGA_MAX:
		_fichas_carga.clear()
	var squad: Array = plantel_sin_once(team_id)
	var xi_n: int = mini(STARTING_XI, squad.size())
	var huecos: Array = slots_of(plan)
	f = {"plan": plan, "squad": squad, "xi": xi_n, "legal": false, "cand": [], "colas": []}


	if xi_n > 0 and Rotation.huecos_sin_puesto(squad, _meta_de_bajas(squad, {}),
			huecos.slice(0, STARTING_XI)) == 0:
		f["legal"] = true
		var colas: Array = []
		colas.resize(xi_n)
		var cand: Array = []
		for k in xi_n:
			var titular: Dictionary = squad[k]
			var pos: String = String(titular.get("pos", "MC"))
			var hueco: String = String(huecos[k]) if k < huecos.size() else pos
			var cola: PackedInt32Array = _lista_entrada(squad, hueco)
			colas[k] = cola

			if pos == "POR" or hueco == "POR" or cola.is_empty():
				continue
			cand.append([float(SquadMeta.media_of(titular, pos)
				- SquadMeta.media_of(squad[cola[0]], pos)), k, home_seat(squad, k)])
		f["cand"] = cand
		f["colas"] = colas
	_fichas_carga[team_id] = f
	return f










static func delta_carga_rapida(team_id: String, carga_hoy: int, carga_prev: int,
		semilla: int) -> float:
	var sentar: int = sentados_por_carga(carga_hoy, carga_prev)
	if sentar <= 0:
		return 0.0
	var f: Dictionary = _ficha_carga(team_id)
	if not bool(f["legal"]):
		return 0.0
	var squad: Array = f["squad"]
	var cand: Array = []
	for c in (f["cand"] as Array):
		var ruido: float = float(absi(hash([team_id, semilla, int(c[2])])) % 1000) / 1000.0 \
				* CARGA_RUIDO
		cand.append([float(c[0]) + ruido, int(c[1])])
	cand.sort_custom(func(a: Array, b: Array) -> bool:
		return a[0] < b[0] or (a[0] == b[0] and a[1] < b[1]))
	var elegidos: Array = []
	for c in cand.slice(0, sentar):
		elegidos.append(int(c[1]))
	var colas: Array = f["colas"]
	var entra: Dictionary = {}
	while not elegidos.is_empty():
		entra.clear()
		var huecos: Array = elegidos.duplicate()
		huecos.sort()
		var usado: Dictionary = {}
		for k in huecos:
			var j: int = -1
			for cj in (colas[int(k)] as PackedInt32Array):
				if not usado.has(cj):
					j = cj
					break
			if j < 0:
				entra.clear()
				break
			usado[j] = true
			entra[int(k)] = j
		if entra.size() == huecos.size():
			break


		elegidos.pop_back()
	if entra.is_empty():
		return 0.0
	var ks: Array = entra.keys()
	ks.sort()
	var gap: float = 0.0
	for k in ks:
		var titular: Dictionary = squad[int(k)]
		var pos: String = String(titular.get("pos", "MC"))
		gap += float(SquadMeta.media_of(squad[int(entra[k])], pos)
			- SquadMeta.media_of(titular, pos))
	return clampf(gap / float(int(f["xi"])) * STRENGTH_W, - CARGA_TOPE, 0.0)


static var _media_once_cache: Dictionary = {}











static func media_once(team_id: String) -> int:
	if _media_once_cache.has(team_id):
		return _media_once_cache[team_id]

	var squad: Array = plantel_sin_once(team_id)
	var out: int = 0
	if not squad.is_empty():
		var sum_m: float = 0.0
		var n: int = 0
		for i in mini(STARTING_XI, squad.size()):
			var p: Dictionary = squad[i]
			sum_m += float(SquadMeta.media_of(p, String(p.get("pos", "MC"))))
			n += 1
		if n > 0:
			out = int(round(sum_m / float(n)))
	_media_once_cache[team_id] = out
	return out



const FINISH_WEIGHT: Dictionary = {
	"DC": 5, "CAM": 5, "EI": 4, "ED": 4, "MI": 4, "MD": 4, "MC": 3, "MCD": 2,
	"LTI": 2, "LTD": 2, "DFC": 1, "POR": 0,
}






const POS_LINE: Dictionary = {
	"POR": "POR",
	"DFC": "DEF", "LTI": "DEF", "LTD": "DEF",
	"MCD": "MED", "MC": "MED", "MI": "MED", "MD": "MED",
	"DC": "DEL", "CAM": "DEL", "EI": "DEL", "ED": "DEL",
}


static func line_of(pos: String) -> String:
	return String(POS_LINE.get(pos, "MED"))













static func line_pintada(pos: String) -> String:
	return "MED" if pos == "CAM" else line_of(pos)











static func forma_de_slots(slots: Array) -> String:
	for nombre in FORMATIONS:
		var xi: Array =(FORMATIONS[nombre] as Dictionary).get("xi", []) as Array
		if xi.size() != slots.size():
			continue
		var igual: bool = true
		for i in xi.size():
			if String(xi[i]) != String(slots[i]):
				igual = false
				break
		if igual:
			return String(nombre)
	return ""









const POS_AFFINITY: Dictionary = {






	"CAM": ["EI", "ED", "MI", "MD", "MC", "DC"],


	"EI": ["MI", "ED", "CAM", "DC"], "ED": ["MD", "EI", "CAM", "DC"],
	"MI": ["EI", "CAM", "MD"], "MD": ["ED", "CAM", "MI"],
	"MC": ["MCD", "MI", "MD"], "MCD": ["MC", "DFC"],
	"LTI": ["LTD", "MI", "EI"], "LTD": ["LTI", "MD", "ED"],
	"DFC": ["LTI", "LTD", "MCD"],
	"DC": ["CAM", "EI", "ED"],
}





























const POS_MAX: int = 5



static func poss_of(player: Dictionary) -> Array:
	var pos: String = String(player.get("pos", "MC"))
	if pos == "POR":
		return ["POR"]
	var fuera: Array = []
	if player.get("poss", null) is Array:
		for v in (player["poss"] as Array):
			var p: String = String(v)


			if p != "POR" and OVR_WEIGHTS.has(p) and not fuera.has(p):
				fuera.append(p)
	if fuera.is_empty():
		fuera = _poss_derivadas(pos, String(player.get("name", "")))
	elif not fuera.has(pos):



		pass
	return fuera.slice(0, POS_MAX)



static func can_play(player: Dictionary, pos: String) -> bool:
	return String(player.get("pos", "")) == pos or poss_of(player).has(pos)




static func _poss_derivadas(pos: String, nombre: String) -> Array:


	var nace: int = PlayerLooks.nace_regen(nombre)
	if nace != PlayerLooks.SIN_NACER:
		return poss_regen(pos, nombre, GameState.season_num - nace)
	var fuera: Array = [pos]
	var afines: Array = POS_AFFINITY.get(pos, [])
	if afines.is_empty():
		return fuera
	var h: int = abs(hash(nombre + "|" + pos))


	var cuantos: int = [1, 1, 1, 2, 2, 2, 3, 3, 4, 5][h % 10]
	for a in afines:
		if fuera.size() >= cuantos:
			break
		var p: String = String(a)
		if p != "POR" and not fuera.has(p):
			fuera.append(p)
	return fuera















const REGEN_POSS_EDAD: int = 26
const REGEN_POSS_DESDE: int = 17
const REGEN_POSS_CUANTOS: Array = [0, 1, 1, 2, 2, 2, 3, 3, 4, 4]
const PUESTOS_CAMPO: Array = ["DC", "CAM", "EI", "ED", "MI", "MD", "MC", "MCD",
	"LTI", "LTD", "DFC"]





const REGEN_POSS_VECINOS: Dictionary = {
	"DC": ["CAM", "EI", "ED"],
	"CAM": ["MC", "EI", "ED", "DC", "MI", "MD"],
	"EI": ["MI", "ED", "CAM", "DC", "MD"],
	"ED": ["MD", "EI", "CAM", "DC", "MI"],
	"MI": ["EI", "MD", "MC", "CAM", "LTI", "ED"],
	"MD": ["ED", "MI", "MC", "CAM", "LTD", "EI"],
	"MC": ["MCD", "CAM", "MI", "MD"],
	"MCD": ["MC", "DFC", "MI", "MD"],
	"LTI": ["LTD", "MI", "EI", "DFC"],
	"LTD": ["LTI", "MD", "ED", "DFC"],
	"DFC": ["MCD", "LTI", "LTD"],
}


static func poss_regen(pos: String, nombre: String, edad: int) -> Array:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(nombre + "|poss")
	var cuantos: int = int(REGEN_POSS_CUANTOS[rng.randi_range(0, REGEN_POSS_CUANTOS.size() - 1)])
	var resto: Array =(REGEN_POSS_VECINOS.get(pos, []) as Array).duplicate()
	_baraja(resto, rng)
	cuantos = mini(cuantos, resto.size())
	var edades: Array = []
	for e in range(REGEN_POSS_DESDE + 1, REGEN_POSS_EDAD + 1):
		edades.append(e)
	_baraja(edades, rng)
	var cuando: Array = edades.slice(0, cuantos)
	cuando.sort()
	var out: Array = [pos]
	var i: int = 0
	for e in cuando:
		if int(e) <= edad:
			out.append(resto[i])
		i += 1
	return out


static func _baraja(arr: Array, rng: RandomNumberGenerator) -> void:
	for i in range(arr.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var t: Variant = arr[i]
		arr[i] = arr[j]
		arr[j] = t


static var _cache: Dictionary = {}











static var _lineups: Dictionary = {}





static func cuenta_pos(squad: Array, pos: String) -> int:
	var n: int = 0
	for p in squad:
		if p is Dictionary and String((p as Dictionary).get("pos", "")) == pos:
			n += 1
	return n


















static func porteros(squad: Array) -> int:
	return cuenta_pos(squad, "POR")







static func of_nominal(team_id: String) -> Array:
	var had: bool = _lineups.has(team_id)
	var saved: Variant = _lineups.get(team_id, null)
	if had:
		_lineups.erase(team_id)
	var out: Array = of(team_id)
	if had:
		_lineups[team_id] = saved






	return _en_orden_de_casa(out)
















static func set_match_lineup(team_id: String, eleven: Array) -> void:
	var nuevo: Array = eleven.duplicate()
	if _lineups.get(team_id, null) == nuevo:
		return
	_lineups[team_id] = nuevo
	_marca_orden_cambiado()



static func clear_match_lineup(team_id: String = "") -> void:


	if team_id.is_empty():
		_forma_dia.clear()
		_urgencias.clear()
	else:
		_forma_dia.erase(team_id)
		_urgencias.erase(team_id)
	if team_id.is_empty():
		if _lineups.is_empty():
			return
		_lineups.clear()
	else:
		if not _lineups.has(team_id):
			return
		_lineups.erase(team_id)
	_marca_orden_cambiado()


















static func xi_con(team_id: String, orden: Array) -> Array:
	var visto: Array = of(team_id)
	var crudo: Array = _cache.get(team_id, visto)
	return _apply_lineup(crudo, orden, team_id).slice(0, STARTING_XI)


static func match_lineups_snapshot() -> Dictionary:
	var out: Dictionary = {}
	for k in _lineups:
		out[k] =(_lineups[k] as Array).duplicate()
	return out


static func restore_match_lineups(snap: Dictionary) -> void:
	var nuevo: Dictionary = {}
	for k in snap:
		nuevo[k] =(snap[k] as Array).duplicate()
	if _lineups == nuevo:
		return
	_lineups = nuevo
	_marca_orden_cambiado()











static func _marca_orden_cambiado() -> void:
	_cache_version += 1










static func _apply_lineup(squad: Array, orden: Array, team_id: String = "") -> Array:



	if _urgencias.has(team_id):
		squad = aplica_urgencias(team_id, squad.duplicate())
	var por_asiento: Dictionary = {}
	for k in squad.size():
		por_asiento[int((squad[k] as Dictionary).get(SEAT_KEY, k))] = k
	var out: Array = []
	var puestos: Dictionary = {}
	for a in orden:
		var i: int = int(por_asiento.get(int(a), int(a)))
		if i >= 0 and i < squad.size() and not puestos.has(i):
			out.append(squad[i])
			puestos[i] = true
	for i in squad.size():
		if not puestos.has(i):
			out.append(squad[i])
	return out






static func of(team_id: String) -> Array:
	if _cache.has(team_id):



		if _lineups.has(team_id):
			return _apply_lineup(_cache[team_id], _lineups[team_id], team_id)
		return _cache[team_id]
	var team: Dictionary = Teams.by_id(team_id)


	if team.is_empty():
		team = Nations.as_team(team_id)






	var squad: Array = factory_of(team_id)





	RosterDelta.apply(team_id, squad, true)



	SquadEdits.apply(team_id, squad)




	var de_fabrica: Dictionary = {}
	for p0 in squad:
		de_fabrica[String((p0 as Dictionary).get("name", ""))] = true
	TransferBook.apply(team_id, squad)

	var llegados: Dictionary = {}
	for p1 in squad:
		var n1: String = String((p1 as Dictionary).get("name", ""))
		if not de_fabrica.has(n1):
			llegados[n1] = true
	_llegados[team_id] = llegados






























	_apply_gold_floor(squad, team)





	WorldAging.apply(team_id, squad)














	if WorldAging.season() <= 1:
		_apply_gold_floor(squad, team)


















	RosterDelta.apply(team_id, squad, false)
	CareerEdits.apply(team_id, squad)




	_apply_user_shirt(team_id, squad)














	EuroCrown.apply(team_id, squad)





















	_sella_asiento(squad)
	_once_legal(team_id, squad, team)
	_once_sin_dos_porteros(squad, team)
	_banca_legal(team_id, squad, team)
	_aplica_plan(team_id, squad, team)
	_once_polivalente(team_id, squad, team)











	for f in squad:
		if f is Dictionary:
			var nm: String = String((f as Dictionary).get("name", ""))
			var nt: String = String((f as Dictionary).get("nat", ""))
			if not nm.is_empty() and not nt.is_empty():
				PlayerNations.register(nm, Nations.canon_id(nt))
	_cache[team_id] = squad
	if _lineups.has(team_id):
		return _apply_lineup(squad, _lineups[team_id], team_id)
	return squad
















































static func _once_legal(team_id: String, squad: Array, team: Dictionary = {}) -> void:
	if squad.size() < STARTING_XI:
		return


	var slots: Array = slots_of(base_formation_of(team_id)).slice(0, STARTING_XI)


	var roto: bool = false
	for k in STARTING_XI:
		if not _cabe_en(squad[k], String(slots[k])):
			roto = true
			break
	if not roto:
		return
	var elegido: Array[int] = []
	elegido.resize(STARTING_XI)
	elegido.fill(-1)
	var usados: Dictionary = {}














	var cubos: Dictionary = {}
	var media_suya: Dictionary = {}
	for j in squad.size():
		var suyo_j: String = String((squad[j] as Dictionary).get("pos", "MC"))
		if not cubos.has(suyo_j):
			cubos[suyo_j] = []
		(cubos[suyo_j] as Array).append(j)
	for k in STARTING_XI:
		var pos_s: String = String(slots[k])
		if not cubos.has(pos_s):
			continue
		var mejor: int = -1
		var cual: int = -1
		for j in cubos[pos_s]:
			if usados.has(j):
				continue
			if not media_suya.has(j):
				media_suya[j] = SquadMeta.media_of(squad[j], pos_s)
			var v: int = media_suya[j]
			if v > mejor:
				mejor = v
				cual = j
		if cual >= 0:
			elegido[k] = cual
			usados[cual] = true





	var cabe: Array = []
	if elegido.has(-1):
		cabe = _cabe_pre(squad)
	for k in STARTING_XI:
		if elegido[k] >= 0:
			continue
		var pos_s: String = String(slots[k])
		var mejor: int = -1
		var cual: int = -1
		for j in squad.size():
			if usados.has(j):
				continue
			var p: Dictionary = squad[j]
			var suyo: String = String(cabe[j][0])
			if suyo == pos_s or not _cabe_pre_en(cabe[j], pos_s):
				continue
			var v: int = SquadMeta.media_of(p, suyo)
			if v > mejor:
				mejor = v
				cual = j
		if cual >= 0:
			elegido[k] = cual
			usados[cual] = true



	var duenio: Dictionary = {}
	for k in STARTING_XI:
		if elegido[k] >= 0:
			duenio[elegido[k]] = k
	for k in STARTING_XI:
		if elegido[k] >= 0:
			continue
		if _reacomoda(k, slots, squad, elegido, duenio, {}, false, cabe):
			continue













		usados.clear()
		for kk in STARTING_XI:
			if elegido[kk] >= 0:
				usados[elegido[kk]] = true
		var cand: int = k if not usados.has(k) else -1
		if cand < 0:
			var mejor_resto: int = -1
			for j in squad.size():
				if usados.has(j):
					continue
				var v2: int = SquadMeta.media_of(squad[j], String(slots[k]))
				if v2 > mejor_resto:
					mejor_resto = v2
					cand = j
		if cand < 0:
			return
		elegido[k] = cand
		usados[cand] = true
		duenio[cand] = k
	usados.clear()
	for k in STARTING_XI:
		usados[elegido[k]] = true
	var out: Array = []
	for k in STARTING_XI:
		out.append(squad[elegido[k]])


	for j in squad.size():
		if not usados.has(j):
			out.append(squad[j])
	for i in squad.size():
		squad[i] = out[i]




	if team.is_empty() or gold_floor(team) <= 0 or not _gold_floor_enabled:
		return
	for k in STARTING_XI:
		if elegido[k] < STARTING_XI:
			continue
		var sube: Dictionary = squad[k]
		if _sube_con_piso(team, sube):
			_lift_to_floor(sube, String(sube.get("pos", "MC")), seat_floor(team, k))


static func _once_sin_dos_porteros(squad: Array, team: Dictionary = {}) -> void:
	var porteros: int = 0
	for k in mini(STARTING_XI, squad.size()):
		if String((squad[k] as Dictionary).get("pos", "")) != "POR":
			continue
		porteros += 1
		if porteros == 1:
			continue
		var mejor: int = -1
		var cual: int = -1
		for j in range(STARTING_XI, squad.size()):
			var p: Dictionary = squad[j]
			if String(p.get("pos", "MC")) == "POR":
				continue
			var v: int = SquadMeta.media_of(p, String(p.get("pos", "MC")))
			if v > mejor:
				mejor = v
				cual = j
		if cual < 0:
			return
		var fuera: Variant = squad[k]
		squad[k] = squad[cual]
		squad[cual] = fuera
		var sube: Dictionary = squad[k]
		if _sube_con_piso(team, sube):
			_lift_to_floor(sube, String(sube.get("pos", "MC")), seat_floor(team, k))
		porteros -= 1

































static func _banca_legal(team_id: String, squad: Array, team: Dictionary = {}) -> void:
	var hasta: int = mini(STARTING_XI + BENCH_SIZE, squad.size())
	if hasta <= STARTING_XI:
		return

	var slots: Array = slots_of(base_formation_of(team_id))
	if slots.size() < hasta:
		return








	var roto: bool = false
	for k in range(STARTING_XI, hasta):
		if String((squad[k] as Dictionary).get("pos", "MC")) != String(slots[k]):
			roto = true
			break
	if not roto:
		return



	var elegido: Dictionary = {}
	var usados: Dictionary = {}


	var cubos: Dictionary = {}
	var media_suya: Dictionary = {}
	for j in range(STARTING_XI, squad.size()):
		var suyo_j: String = String((squad[j] as Dictionary).get("pos", "MC"))
		if not cubos.has(suyo_j):
			cubos[suyo_j] = []
		(cubos[suyo_j] as Array).append(j)
	for k in range(STARTING_XI, hasta):
		var pos_s: String = String(slots[k])
		if not cubos.has(pos_s):
			continue
		var mejor: int = -1
		var cual: int = -1
		for j in cubos[pos_s]:
			if usados.has(j):
				continue
			if not media_suya.has(j):
				media_suya[j] = SquadMeta.media_of(squad[j], pos_s)
			var v: int = media_suya[j]
			if v > mejor:
				mejor = v
				cual = j
		if cual >= 0:
			elegido[k] = cual
			usados[cual] = true
	for k in range(STARTING_XI, hasta):
		if elegido.has(k):
			continue
		var pos_s: String = String(slots[k])
		var mejor: int = -1
		var cual: int = -1
		for j in range(STARTING_XI, squad.size()):
			if usados.has(j):
				continue
			var p: Dictionary = squad[j]
			var suyo: String = String(p.get("pos", "MC"))
			if suyo == pos_s or not _cabe_en(p, pos_s):
				continue
			var v: int = SquadMeta.media_of(p, suyo)
			if v > mejor:
				mejor = v
				cual = j
		if cual >= 0:
			elegido[k] = cual
			usados[cual] = true





	for k in range(STARTING_XI, hasta):
		if elegido.has(k):
			continue
		var pos_k: String = String(slots[k])
		var cand: int = k if not usados.has(k) else -1
		if cand < 0:
			var mejor_resto: int = -1
			for j in range(STARTING_XI, squad.size()):
				if usados.has(j):
					continue
				var q: Dictionary = squad[j]
				if String(q.get("pos", "MC")) == "POR" and pos_k != "POR":
					continue
				var v2: int = SquadMeta.media_of(q, pos_k)
				if v2 > mejor_resto:
					mejor_resto = v2
					cand = j
		if cand < 0:
			return
		elegido[k] = cand
		usados[cand] = true

	var out: Array = []
	for k in range(STARTING_XI, hasta):
		out.append(squad[int(elegido[k])])
	for j in range(STARTING_XI, squad.size()):
		if not usados.has(j):
			out.append(squad[j])
	for i in range(STARTING_XI, squad.size()):
		squad[i] = out[i - STARTING_XI]




	if team.is_empty() or gold_floor(team) <= 0 or not _gold_floor_enabled:
		return
	for k in range(STARTING_XI, hasta):
		if int(elegido[k]) < STARTING_XI + BENCH_SIZE:
			continue
		var sube: Dictionary = squad[k]
		if _sube_con_piso(team, sube):
			_lift_to_floor(sube, String(sube.get("pos", "MC")), seat_floor(team, k))






static func _aplica_plan(team_id: String, squad: Array, team: Dictionary = {}) -> void:
	var plan: String = formation_plan(team_id)







	if not Teams.by_id(team_id).is_empty():
		var vacio: Array = []
		vacio.resize(squad.size())
		for i in squad.size():
			vacio[i] = {}
		_plan_plantel.erase(team_id)
		var hoy: String = forma_del_dia(team_id, squad, vacio)
		if hoy != plan:
			plan = hoy
			_plan_plantel[team_id] = plan
		else:
			_plan_plantel.erase(team_id)
	if plan == base_formation_of(team_id):
		return
	_ordena_por_formacion(team_id, squad, plan, team)











































static func _once_polivalente(team_id: String, squad: Array, team: Dictionary = {}) -> void:
	var n: int = squad.size()
	if n <= STARTING_XI or Teams.by_id(team_id).is_empty():
		return
	var slots: Array = slots_of(String(_plan_plantel.get(team_id, formation_plan(team_id))))
	if slots.size() < STARTING_XI:
		return
	var tuyo: int = user_index(squad)






	var cabe: Array = _cabe_pre(squad)
	for _ronda in RONDAS_POLIVALENTE:
		if not _once_polivalente_ronda(squad, cabe, slots, tuyo, team):
			return


const RONDAS_POLIVALENTE: int = 6






static func _once_polivalente_ronda(squad: Array, cabe: Array, slots: Array, tuyo: int,
		team: Dictionary) -> bool:
	var n: int = squad.size()
	var vale_tit: Array[float] = []
	vale_tit.resize(STARTING_XI)
	for k in STARTING_XI:
		vale_tit[k] = _vale_en_hueco(squad[k], cabe[k], String(slots[k]))



	var parejas: Array = []
	for j in range(STARTING_XI, n):
		var c: Array = cabe[j]
		if String(c[0]) == "POR":
			continue
		var vale_j: Dictionary = {}
		for k in STARTING_XI:
			var hueco: String = String(slots[k])
			if hueco == "POR" or k == tuyo or not _cabe_pre_en(c, hueco):
				continue
			if not vale_j.has(hueco):
				vale_j[hueco] = _vale_en_hueco(squad[j], c, hueco)
			var g: float = float(vale_j[hueco]) - vale_tit[k]
			if g > 0.0:
				parejas.append([g, k, home_seat(squad, j)])
	if parejas.is_empty():
		return false
	parejas.sort_custom(func(a: Array, b: Array) -> bool:
		if float(a[0]) != float(b[0]):
			return float(a[0]) > float(b[0])
		if int(a[1]) != int(b[1]):
			return int(a[1]) < int(b[1])
		return int(a[2]) < int(b[2]))
	var donde: Dictionary = {}
	for i in n:
		donde[home_seat(squad, i)] = i
	var hueco_hecho: Dictionary = {}
	var subio: Dictionary = {}
	var banca_hasta: int = mini(STARTING_XI + BENCH_SIZE, n)
	var hubo: bool = false
	for par in parejas:
		var k: int = int(par[1])
		var casa_j: int = int(par[2])
		if hueco_hecho.has(k) or subio.has(casa_j):
			continue
		var j: int = int(donde[casa_j])
		var baja: Dictionary = squad[k]
		var sube: Dictionary = squad[j]
		squad[k] = sube
		squad[j] = baja




		if user_index(squad) != tuyo:
			squad[k] = baja
			squad[j] = sube
			continue
		var c_sube: Array = cabe[j]
		cabe[j] = cabe[k]
		cabe[k] = c_sube
		donde[casa_j] = k
		donde[home_seat(squad, j)] = j
		hueco_hecho[k] = true
		subio[casa_j] = true
		hubo = true


		if j >= banca_hasta:
			var linea: String = line_of(String(baja.get("pos", "MC")))
			var su_media: int = SquadMeta.media_of(baja, String(baja.get("pos", "MC")))
			var peor: int = -1
			var peor_media: int = su_media
			for b in range(STARTING_XI, banca_hasta):
				var q: Dictionary = squad[b]
				var q_pos: String = String(q.get("pos", "MC"))
				if line_of(q_pos) != linea:
					continue
				var qm: int = SquadMeta.media_of(q, q_pos)
				if qm < peor_media:
					peor_media = qm
					peor = b
			if peor >= 0:
				var al_fondo: Dictionary = squad[peor]
				squad[peor] = baja
				squad[j] = al_fondo
				var c_fondo: Array = cabe[peor]
				cabe[peor] = cabe[j]
				cabe[j] = c_fondo
				donde[home_seat(squad, peor)] = peor
				donde[home_seat(squad, j)] = j


		if _sube_con_piso(team, sube):
			_lift_to_floor(sube, String(sube.get("pos", "MC")), seat_floor(team, k))
	return hubo







static func _vale_en_hueco(p: Dictionary, c: Array, hueco: String) -> float:
	if not _cabe_pre_en(c, hueco):
		return - Rotation.MURO
	var v: float = float(SquadMeta.media_of(p, hueco))
	return v if String(c[0]) == hueco else v - Rotation.CASTIGO_DECLARADO














































static func seats_of(team_id: String) -> int:
	var squad: Array = []
	var n: int = WorldDB.size_of(team_id)
	if n > 0:
		squad.resize(n + SquadEdits.extra_seats(team_id, n))
	else:
		squad = factory_of(team_id)
	RosterDelta.apply(team_id, squad, true)
	return squad.size()


static func factory_slots(team_id: String) -> Array:
	var out: Array = []









	if WorldDB.has(team_id):
		for p in factory_of(team_id):
			out.append({"pos": String((p as Dictionary).get("pos", "MC"))})
		return out
	for pos in slots_of(formation_plan(team_id)):
		out.append({"pos": String(pos)})
	return out













static func factory_of(team_id: String, con_pack: bool = true) -> Array:
	var team: Dictionary = Teams.by_id(team_id)
	if team.is_empty():
		team = Nations.as_team(team_id)











	var mundo: Array = WorldDB.squad_of(team_id)
	if not mundo.is_empty():
		_ordena_de_fabrica(team_id, mundo)



		if con_pack:
			SquadEdits.alarga_fabrica(team_id, mundo)
		_dorsales_unicos(mundo)
		return mundo





	return _build_generated(team_id, team)









static func factory_view(team_id: String) -> Array:
	var mundo: Array = WorldDB.squad_ref(team_id)
	if mundo.is_empty():
		return factory_of(team_id)
	_ordena_de_fabrica(team_id, mundo)
	SquadEdits.alarga_fabrica(team_id, mundo)
	return mundo
























static var _orden_fabrica: Dictionary = {}


static func _ordena_de_fabrica(team_id: String, mundo: Array) -> void:
	var forma: String = base_formation_of(team_id)
	var huella: int = mundo.hash()
	var antes: Array = mundo.duplicate()
	var hecho: Array = _orden_fabrica.get(team_id, [])
	if hecho.size() == 3 and String(hecho[0]) == forma and int(hecho[1]) == huella:
		var perm: PackedInt32Array = hecho[2]
		if perm.size() == mundo.size():
			for k in perm.size():
				mundo[k] = antes[perm[k]]
			return


	_ordena_por_formacion(team_id, mundo, forma)
	var nueva: PackedInt32Array = PackedInt32Array()
	nueva.resize(mundo.size())
	for k in mundo.size():
		for j in antes.size():
			if is_same(mundo[k], antes[j]):
				nueva[k] = j
				break
	_orden_fabrica[team_id] = [forma, huella, nueva]














const SEAT_KEY: String = "seat0"

static func _sella_asiento(squad: Array) -> void:
	for i in squad.size():
		(squad[i] as Dictionary)[SEAT_KEY] = i





static func _sello_sano(squad: Array) -> bool:
	var vistos: Dictionary = {}
	for i in squad.size():
		var seat: int = int((squad[i] as Dictionary).get(SEAT_KEY, i))
		if seat < 0 or seat >= squad.size() or vistos.has(seat):
			return false
		vistos[seat] = true
	return true




static func home_seat(squad: Array, idx: int) -> int:
	if idx < 0 or idx >= squad.size():
		return idx
	return int((squad[idx] as Dictionary).get(SEAT_KEY, idx))














static func asiento_de_fabrica(team_id: String, bin_idx: int) -> int:
	if bin_idx < 0 or team_id.is_empty():
		return bin_idx
	if not _orden_fabrica.has(team_id):
		factory_of(team_id)
	var hecho: Array = _orden_fabrica.get(team_id, [])
	if hecho.size() != 3:
		return bin_idx
	var k: int =(hecho[2] as PackedInt32Array).find(bin_idx)
	return k if k >= 0 else bin_idx







static func home_of(team_id: String, nominal: bool = false) -> Array:




	return _en_orden_de_casa(of_nominal(team_id) if nominal else of(team_id))









static func plan_order(team_id: String) -> Array:
	var out: Array = []
	var squad: Array = of(team_id)
	for i in squad.size():
		out.append(int((squad[i] as Dictionary).get(SEAT_KEY, i)))
	return out


static func _en_orden_de_casa(squad: Array) -> Array:



	var mueve: bool = false
	for i in squad.size():
		if int((squad[i] as Dictionary).get(SEAT_KEY, i)) != i:
			mueve = true
			break
	if not mueve:
		return squad
	var out: Array = squad.duplicate()
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a.get(SEAT_KEY, 0)) < int(b.get(SEAT_KEY, 0)))
	return out

























































static func _cabe_en(p: Dictionary, pos_s: String) -> bool:
	var suyo: String = String(p.get("pos", "MC"))
	if suyo == pos_s:
		return true
	return poss_of(p).has(pos_s)










static func _cabe_pre(squad: Array) -> Array:
	var out: Array = []
	out.resize(squad.size())
	for j in squad.size():
		var p: Dictionary = squad[j]
		out[j] = [String(p.get("pos", "MC")), poss_of(p)]
	return out


static func _cabe_pre_en(c: Array, pos_s: String) -> bool:
	return String(c[0]) == pos_s or (c[1] as Array).has(pos_s)


















static func _reacomoda(k: int, slots: Array, squad: Array, elegido: Array[int],
		duenio: Dictionary, visto: Dictionary, protege_once: bool = false,
		cabe: Array = []) -> bool:

	if cabe.is_empty():
		cabe = _cabe_pre(squad)
	var pos_s: String = String(slots[k])
	for j in squad.size():
		if visto.has(j):
			continue
		var c: Array = cabe[j]

		if String(c[0]) == "POR" and pos_s != "POR":
			continue
		if not _cabe_pre_en(c, pos_s):
			continue
		if protege_once and int(duenio.get(j, STARTING_XI)) < STARTING_XI:
			continue
		visto[j] = true
		if not duenio.has(j) \
				or _reacomoda(int(duenio[j]), slots, squad, elegido, duenio, visto,
					protege_once, cabe):
			elegido[k] = j
			duenio[j] = k
			return true
	return false






static func _ordena_por_formacion(team_id: String, squad: Array,
		forma: String = "", team: Dictionary = {}) -> void:



	var slots: Array = slots_of(
		base_formation_of(team_id) if forma.is_empty() else forma)
	var elegido: Array[int] = []
	elegido.resize(slots.size())
	elegido.fill(-1)
	var usados: Dictionary = {}


	var cabe: Array = _cabe_pre(squad)
	var media_suya: Array[int] = []
	media_suya.resize(squad.size())
	for j in squad.size():
		media_suya[j] = SquadMeta.media_of(squad[j], String(cabe[j][0]))






	for pasada in 2:
		for k in slots.size():
			if elegido[k] >= 0:
				continue
			var pos_s: String = String(slots[k])
			var mejor: int = -1
			var cual: int = -1
			for j in squad.size():
				if usados.has(j):
					continue
				var suyo: String = String(cabe[j][0])
				if pasada == 0:
					if suyo != pos_s:
						continue
				elif suyo == pos_s or not _cabe_pre_en(cabe[j], pos_s):



					continue
				var v: int = media_suya[j]
				if v > mejor:
					mejor = v
					cual = j
			if cual >= 0:
				elegido[k] = cual
				usados[cual] = true
















	var duenio: Dictionary = {}
	for k in slots.size():
		if elegido[k] >= 0:
			duenio[elegido[k]] = k
	for k in slots.size():
		if elegido[k] >= 0 or String(slots[k]) == "POR":
			continue
		if _reacomoda(k, slots, squad, elegido, duenio, {}, k >= STARTING_XI, cabe):
			continue










		var mejor_resto: int = -1
		var cual_resto: int = -1
		for j in squad.size():
			var suyo_k: int = int(duenio.get(j, -1))
			if suyo_k >= 0 and (k >= STARTING_XI or suyo_k < STARTING_XI):
				continue
			var p_resto: Dictionary = squad[j]
			if String(p_resto.get("pos", "MC")) == "POR":
				continue
			var v_resto: int = SquadMeta.media_of(p_resto, String(slots[k]))
			if v_resto > mejor_resto:
				mejor_resto = v_resto
				cual_resto = j
		if cual_resto >= 0:
			var antes_k: int = int(duenio.get(cual_resto, -1))
			if antes_k >= 0:
				elegido[antes_k] = -1
			elegido[k] = cual_resto
			duenio[cual_resto] = k

	usados.clear()
	for k in slots.size():
		if elegido[k] >= 0:
			usados[elegido[k]] = true
	var out: Array = []
	for k in slots.size():
		if elegido[k] >= 0:
			out.append(squad[elegido[k]])

	for j in squad.size():
		if not usados.has(j):
			out.append(squad[j])
	squad.assign(out)













	if team.is_empty() or gold_floor(team) <= 0 or not _gold_floor_enabled:
		return
	for k in mini(STARTING_XI, slots.size()):
		if elegido[k] < 0 or elegido[k] < STARTING_XI or k >= squad.size():
			continue
		var sube: Dictionary = squad[k]
		if _sube_con_piso(team, sube):
			_lift_to_floor(sube, String(sube.get("pos", "MC")), seat_floor(team, k))







static func _dorsales_unicos(squad: Array) -> void:
	var taken: Dictionary = {}
	for p in squad:
		var n: int = int((p as Dictionary).get("number", 0))
		if n <= 0 or taken.has(n):
			n = _sirve_dorsal(String((p as Dictionary).get("pos", "DC")), taken)
			(p as Dictionary)["number"] = n
		else:
			taken[n] = true





static var _base_names: Dictionary = {}


static var _base_pasados: Dictionary = {}



static var _base_puestos: Dictionary = {}

static func base_name(team_id: String, idx: int) -> String:
	if idx < 0 or team_id.is_empty():
		return ""
	_arma_base(team_id)
	var nombres_de: Array = _base_names[team_id]
	return String(nombres_de[idx]) if idx < nombres_de.size() else ""




static func base_puestos(team_id: String, idx: int) -> Array:
	if idx < 0 or team_id.is_empty():
		return []
	_arma_base(team_id)
	var de: Array = _base_puestos.get(team_id, [])
	return (de[idx] as Array).duplicate() if idx < de.size() else []








static func puestos_de_persona(p: Dictionary) -> Array:
	var pos: String = String(p.get("pos", ""))
	if pos == "POR" or pos.is_empty():
		return []
	var out: Array = [pos]
	for q in poss_of(p):
		if String(q) != "POR" and not out.has(String(q)):
			out.append(String(q))
	return out.slice(0, POS_MAX)




static func base_size(team_id: String) -> int:
	if team_id.is_empty():
		return 0
	_arma_base(team_id)
	return (_base_names[team_id] as Array).size()








static func base_pasado(team_id: String, idx: int) -> Dictionary:
	if idx < 0 or team_id.is_empty():
		return {}
	_arma_base(team_id)
	return (_base_pasados[team_id] as Dictionary).get(idx, {})


static func _arma_base(team_id: String) -> void:
	if _base_names.has(team_id):
		return
	var squad: Array = factory_of(team_id)



	RosterDelta.apply(team_id, squad, true)
	SquadEdits.apply(team_id, squad)
	var nombres: Array[String] = []
	var pasados: Dictionary = {}
	for i in squad.size():
		var p: Dictionary = squad[i]
		nombres.append(String(p.get("name", "")))
		if p.has("carrera") or p.has("etapa_desde"):
			pasados[i] = {"carrera": p.get("carrera", []),
				"etapa_desde": int(p.get("etapa_desde", 0))}
	_base_names[team_id] = nombres
	_base_pasados[team_id] = pasados
	var puestos: Array = []
	for p2 in squad:
		puestos.append(puestos_de_persona(p2))
	_base_puestos[team_id] = puestos







static func _apply_gold_floor(squad: Array, team: Dictionary) -> void:
	if gold_floor(team) <= 0 or not _gold_floor_enabled:
		return
	var llegados: Dictionary = _llegados.get(String(team.get("id", "")), {})
	for i in squad.size():
		var p: Dictionary = squad[i]
		if llegados.has(String(p.get("name", ""))):
			continue
		_lift_to_floor(p, String(p.get("pos", "MC")), seat_floor(team, i))













static var _llegados: Dictionary = {}






static func _sube_con_piso(team: Dictionary, sube: Dictionary) -> bool:
	if team.is_empty() or gold_floor(team) <= 0 or not _gold_floor_enabled:
		return false
	if WorldAging.season() > 1:
		return false
	var llegados: Dictionary = _llegados.get(String(team.get("id", "")), {})
	return not llegados.has(String(sube.get("name", "")))















static var _gold_floor_enabled: bool = true


static func suspend_gold_floor() -> void:
	if not _gold_floor_enabled:
		return
	_gold_floor_enabled = false
	invalidate()


static func resume_gold_floor() -> void:
	if _gold_floor_enabled:
		return
	_gold_floor_enabled = true
	invalidate()





static var user_shirt_team: String = ""
static var user_shirt_number: int = 0



static var captain_pick_team: String = ""
static var captain_pick_name: String = ""


static func set_captain_pick(team_id: String, name: String) -> void:
	captain_pick_team = team_id
	captain_pick_name = name





static func set_user_shirt(team_id: String, number: int) -> void:
	var prev: String = user_shirt_team
	user_shirt_team = team_id
	user_shirt_number = number
	if not prev.is_empty() and prev != team_id:
		invalidate(prev)
	if not team_id.is_empty():
		invalidate(team_id)

















static func _apply_user_shirt(team_id: String, squad: Array) -> void:
	if team_id != user_shirt_team or user_shirt_number <= 0:
		return
	var taken: Dictionary = {user_shirt_number: true}
	for p in squad:
		taken[int(p.get("number", 0))] = true
	for i in squad.size():
		if int(squad[i].get("number", 0)) != user_shirt_number:
			continue
		squad[i]["number"] = _sirve_dorsal(String(squad[i].get("pos", "DC")), taken)
		break










static var _cache_version: int = 0






static func invalidate(team_id: String = "") -> void:
	_cache_version += 1





	if team_id.is_empty():
		_plan_cache.clear()
		_plan_plantel.clear()
		_base_cache.clear()
		_cache.clear()
		_llegados.clear()
		_base_names.clear()
		_base_pasados.clear()
		_base_puestos.clear()
		_registered.clear()
		_strength_cache.clear()
		_media_once_cache.clear()
	else:
		_tira_club(team_id)





static func _tira_club(team_id: String) -> void:
	for caja in _cajas_del_club():
		(caja as Dictionary).erase(team_id)






static func _cajas_del_club() -> Array:
	return [_plan_cache, _plan_plantel, _base_cache, _cache, _llegados, _base_names,
		_base_pasados, _base_puestos, _registered, _strength_cache, _media_once_cache]







static var _invalida_global: bool = OS.get_cmdline_user_args().has("--invalida-global")






























static func invalidate_clubs(ids: Array) -> void:
	if _invalida_global:
		invalidate()
		return
	_cache_version += 1
	var tirar: Dictionary = {}
	for id in ids:
		tirar[String(id)] = true
	for nat in _registered:
		tirar[String(nat)] = true
	for club in RosterDelta.clubes_que_leen_el_cupo():
		tirar[String(club)] = true
	for club2 in SquadEdits.clubes_alargados():
		tirar[String(club2)] = true
	for id2 in tirar:
		_tira_club(String(id2))





static func cache_version() -> int:
	return _cache_version



static func has_cached(team_id: String) -> bool:
	return _cache.has(team_id)






static var _registered: Dictionary = {}



static func is_registered(team_id: String) -> bool:
	return bool(_registered.get(team_id, false)) and _cache.has(team_id)
















static func register(team_id: String, squad: Array, forma: String = "") -> void:
	if team_id.is_empty() or squad.is_empty():
		return











	if not _sello_sano(squad):
		_sella_asiento(squad)
	_cache[team_id] = squad
	_registered[team_id] = true
	_strength_cache.erase(team_id)
	_media_once_cache.erase(team_id)
	if FORMATIONS.has(forma):
		_plan_plantel[team_id] = forma







const NAME_STRIDE: int = SQUAD_SIZE































static var _name_slot_cache: Dictionary = {}



static func name_slot_of(team_id: String) -> int:
	return _name_slot(team_id)


static func _name_slot(team_id: String) -> int:
	if _name_slot_cache.is_empty():
		var ids: Array = []
		for t in Teams.all():
			ids.append(String(t["id"]))
		ids.sort()
		var usados: Dictionary = {}
		for raw in ids:
			var id: String = String(raw)
			var t2: Dictionary = Teams.by_id(id)
			var key: String = String(t2.get("surnames", t2.get("league", "España")))
			var n: int = int(usados.get(key, 0))
			_name_slot_cache[id] = n
			usados[key] = n + 1
	return int(_name_slot_cache.get(team_id, -1))














const LADDER_JITTER: int = 5













static func _ladder_ranks(slots: Array, rng: RandomNumberGenerator) -> Array[int]:
	var n: int = slots.size()
	var out: Array[int] = []
	out.resize(n)
	var xi: int = mini(STARTING_XI, n)
	var top: Array = []
	var rest: Array = []
	for i in n:






		var key: int = rng.randi_range(- LADDER_JITTER, LADDER_JITTER)
		if i < xi:
			top.append([key, i])
		else:
			rest.append([key, i])
	var mejor := func(a, b): return int(a[0]) > int(b[0])
	top.sort_custom(mejor)
	rest.sort_custom(mejor)











	if top.size() > 1 and String(slots[int(top[0][1])]) == "POR":
		for k in range(1, top.size()):
			if String(slots[int(top[k][1])]) != "POR":
				var cambio: Array = top[0]
				top[0] = top[k]
				top[k] = cambio
				break
	for r in top.size():
		out[int(top[r][1])] = r
	for r in rest.size():
		out[int(rest[r][1])] = xi + r
	return out




static var _foreign_slot_cache: Dictionary = {}




















static func _foreign_slot(team_id: String, idx: int) -> int:







	if _foreign_slot_cache.is_empty():
		_build_foreign_slots()
	return int(_foreign_slot_cache.get("%s#%d" % [team_id, idx], idx))




static func build_foreign_slots_table() -> Dictionary:
	_foreign_slot_cache.clear()
	_build_foreign_slots()
	var out: Dictionary = {}
	for t in Teams.all():
		var id: String = String(t["id"])
		var n: int = slots_of(formation_plan(id)).size()
		var fila: Array = []
		for i in n:
			fila.append(int(_foreign_slot_cache.get("%s#%d" % [id, i], -1)))
		out[id] = fila
	return out


static func _build_foreign_slots() -> void:
	var ids: Array = []
	for t in Teams.all():
		ids.append(String(t["id"]))
	ids.sort()






	var ocupados: Dictionary = {}
	var demanda: Dictionary = {}
	var por_club: Dictionary = {}



	var club_ape: Dictionary = {}
	var club_pila: Dictionary = {}
	for raw in ids:
		var id: String = String(raw)
		var t2: Dictionary = Teams.by_id(id)
		var pais: String = String(t2.get("country", ""))
		var key0: String = String(t2.get("surnames", t2.get("league", "España")))
		var slot0: int = _name_slot(id) * NAME_STRIDE
		var slots: Array = slots_of(formation_plan(id))
		for i in slots.size():
			var nat: String = SquadMeta.nation_at(id, pais, i, String(slots[i]))
			var k: String = Nations.surname_key(nat)
			if k == key0 or not SURNAMES.has(k):

				if slot0 >= 0:
					if not ocupados.has(key0):
						ocupados[key0] = {}
					(ocupados[key0] as Dictionary)[slot0 + i] = true
					if SURNAMES.has(key0):
						if not club_ape.has(id):
							club_ape[id] = {}
							club_pila[id] = {}
						(club_ape[id] as Dictionary)[_ape_de(key0, slot0 + i)] = true
						(club_pila[id] as Dictionary)[_pila_de(key0, slot0 + i)] = true
				continue
			if not demanda.has(k):
				demanda[k] = []
			(demanda[k] as Array).append("%s#%d" % [id, i])
			if not por_club.has(id):
				por_club[id] = []
			(por_club[id] as Array).append([i, k])
















	var libres: Dictionary = {}
	var consumido: Dictionary = {}
	var cursor: Dictionary = {}
	for k in demanda:
		var lst: Array = []
		var occ: Dictionary = ocupados.get(k, {})
		var cap: int =(SURNAMES[k] as Array).size() \
				*(FIRST_NAMES.get(k, []) as Array).size()
		for s in cap:
			if not occ.has(s):
				lst.append(s)
		if lst.is_empty():
			lst.append(0)
		libres[k] = lst
		consumido[k] = {}
		cursor[k] = 0
	var clubes: Array = por_club.keys()
	clubes.sort()
	for id2 in clubes:
		if not club_ape.has(id2):
			club_ape[id2] = {}
			club_pila[id2] = {}
		var apes: Dictionary = club_ape[id2]
		var pilas: Dictionary = club_pila[id2]
		for par in por_club[id2]:
			var i2: int = int(par[0])
			var k2: String = String(par[1])
			var lst2: Array = libres[k2]
			var cons: Dictionary = consumido[k2]
			var p0: int = int(cursor[k2])
			var elegido: int = -1
			var respaldo: int = -1
			for paso in lst2.size():
				var cand: int = int(lst2[(p0 + paso) % lst2.size()])
				if cons.has(cand):
					continue
				if respaldo < 0:
					respaldo = cand
				if apes.has(_ape_de(k2, cand)) or pilas.has(_pila_de(k2, cand)):
					continue
				elegido = cand
				break



			if elegido < 0:
				elegido = respaldo if respaldo >= 0 else int(lst2[0])
			cons[elegido] = true
			cursor[k2] = p0 + 1
			apes[_ape_de(k2, elegido)] = true
			pilas[_pila_de(k2, elegido)] = true
			_foreign_slot_cache["%s#%d" % [id2, i2]] = elegido





static func _ape_de(pool: String, idx: int) -> String:
	var a: Array = SURNAMES[pool]
	return String(a[idx % a.size()])


static func _pila_de(pool: String, idx: int) -> String:
	var a: Array = FIRST_NAMES.get(pool, SURNAMES[pool])
	return String(a[idx % a.size()])


static func _build_generated(team_id: String, team: Dictionary) -> Array:


	var rating: int = int(team.get("rating", 62))



	var league: String = String(team.get("league", "España"))



	var names_key: String = String(team.get("surnames", league))
	var names: Array = SURNAMES.get(names_key, SURNAMES["España"])
	var firsts: Array = FIRST_NAMES.get(names_key, FIRST_NAMES["España"])




	var country: String = String(team.get("country", league))

	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(team_id)
	var pool: Array = names.duplicate()
	var squad: Array = []




	var slot0: int = _name_slot(team_id) * NAME_STRIDE




	var slots: Array = slots_of(formation_plan(team_id))







	var ranks: Array[int] = _ladder_ranks(slots, rng)
	for i in slots.size():
		var pos: String = String(slots[i])
		var bonus: Array = ROLE_BONUS[pos]




		if pool.is_empty():
			pool = names.duplicate()
		var pick: int = rng.randi_range(0, pool.size() - 1)
		var surname: String = String(pool[pick])
		pool.remove_at(pick)


		var first: String = String(firsts[rng.randi_range(0, firsts.size() - 1)])










		var nat: String = SquadMeta.nation_at(team_id, country, i, pos)
		if slot0 >= 0:
			var s: int = slot0 + i
			surname = String(names[s % names.size()])
			first = String(firsts[s % firsts.size()])











			var nat_key: String = Nations.surname_key(nat)
			if nat_key != names_key and SURNAMES.has(nat_key):
				var n2: Array = SURNAMES[nat_key]
				var f2: Array = FIRST_NAMES.get(nat_key, firsts)





				var s2: int = _foreign_slot(team_id, i)
				surname = String(n2[s2 % n2.size()])
				first = String(f2[s2 % f2.size()])




		var _spread_viejo: int = rng.randi_range(-7, 7)





		var base: int = maxi(seat_level(rating, ranks[i]), seat_floor(team, ranks[i]))
		squad.append({







			"_lvl": base,
			"name": "%s %s" % [first, surname],






			"nat": nat,
			"pos": pos,


			"number": 0,
			"pegada": _stat(base + int(bonus[0]) + rng.randi_range(-6, 6)),
			"punteria": _stat(base + int(bonus[1]) + rng.randi_range(-6, 6)),
			"rosca": _stat(base + int(bonus[2]) + rng.randi_range(-9, 9)),
			"cabeza": _stat(base + int(bonus[3]) + rng.randi_range(-6, 6)),
			"penal": _stat(base + int(bonus[4]) + rng.randi_range(-6, 6)),
			"parado": _stat(base + int(bonus[5]) + rng.randi_range(-8, 8)),
			"reflejos": _stat(base + int(bonus[6]) + rng.randi_range(-8, 8)),
			"velocidad": _stat(base + int(bonus[7]) + rng.randi_range(-6, 6)),
			"entrada": _stat(base + int(bonus[8]) + rng.randi_range(-7, 7)),
		})




		var q: Dictionary = squad[squad.size() - 1]
		q["aceleracion"] = _stat(int(q["velocidad"]) + int(bonus[9]) - int(bonus[7])
			+(int(String(q["name"]).hash() % 13) - 6))






		q["regate"] = _stat(base + int(bonus[10])
			+(int(String(q["name"] + "reg").hash() % 17) - 8))



		q["fisico"] = _stat(base + int(bonus[11])
			+(int(String(q["name"] + "fis").hash() % 19) - 9))
	assign_numbers(squad)
	return squad








static func person_name(pool_key: String, seed_val: int) -> String:
	var names: Array = SURNAMES.get(pool_key, SURNAMES["España"])
	var firsts: Array = FIRST_NAMES.get(pool_key, FIRST_NAMES["España"])
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = seed_val
	var surname: String = String(names[rng.randi_range(0, names.size() - 1)])
	var first: String = String(firsts[rng.randi_range(0, firsts.size() - 1)])
	return "%s %s" % [first, surname]























































static func captain_name(team_id: String) -> String:
	if team_id == captain_pick_team and not captain_pick_name.is_empty():
		for p in of(team_id):
			var fila: Dictionary = p
			if String(fila.get("name", "")) == captain_pick_name \
					and String(fila.get("pos", "")) != "POR" \
					and not (int(fila.get("number", -1)) == user_shirt_number
						and team_id == user_shirt_team):
				return captain_pick_name
	var best: String = ""
	var best_ovr: float = -1.0
	for p in of(team_id).slice(0, STARTING_XI):
		var row: Dictionary = p
		if String(row.get("pos", "")) == "POR":
			continue
		if int(row.get("number", -1)) == user_shirt_number \
				and team_id == user_shirt_team:
			continue
		var o: float = ovr(row)
		if o > best_ovr:
			best_ovr = o
			best = String(row.get("name", ""))
	return best


static func finishers(team_id: String, mine: bool) -> Array:
	return finishers_de(of(team_id).slice(0, STARTING_XI), mine)





static func finishers_de(xi: Array, mine: bool) -> Array:
	var squad: Array = []



	var mio: int = user_index(xi) if mine else -1
	for i in xi.size():
		var p: Dictionary = xi[i]
		var pos: String = String(p["pos"])
		if pos == "POR" or i == mio:
			continue
		squad.append(p)
	squad.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var wa: int = int(FINISH_WEIGHT.get(String(a["pos"]), 0))
		var wb: int = int(FINISH_WEIGHT.get(String(b["pos"]), 0))
		if wa != wb:
			return wa > wb
		return int(a["pegada"]) + int(a["punteria"]) > int(b["pegada"]) + int(b["punteria"]))
	return squad

































static func suplente_para(team_id: String, nombre: String, mine: bool = false,
		excluye: Dictionary = {}, fundidos: Dictionary = {}) -> Dictionary:
	if not fundidos.is_empty():
		var sin_ellos: Dictionary = excluye.duplicate()
		sin_ellos.merge(fundidos)
		var fresco: Dictionary = suplente_para(team_id, nombre, mine, sin_ellos)
		if not fresco.is_empty():
			return fresco
	if nombre.is_empty():
		return {}
	var squad: Array = of(team_id)
	var fuera: int = -1
	for i in mini(STARTING_XI, squad.size()):
		if String((squad[i] as Dictionary).get("name", "")) == nombre:
			fuera = i
			break
	if fuera < 0 or String((squad[fuera] as Dictionary).get("pos", "")) == "POR":
		return {}
	var pos: String = String((squad[fuera] as Dictionary).get("pos", ""))



	var slots: Array = formation_slots(team_id)
	if fuera < slots.size() and poss_of(squad[fuera]).has(String(slots[fuera])):
		pos = String(slots[fuera])
	var linea: String = line_of(pos)
	var xi: Array = squad.slice(0, STARTING_XI)
	var yo: int = user_index(xi) if mine else -1
	var mismo: int = -1
	var mismo_nota: float = - INF
	var de_linea: int = -1
	var primero: int = -1
	for i in range(STARTING_XI, mini(STARTING_XI + BENCH_SIZE, squad.size())):
		var row: Dictionary = squad[i]
		var rpos: String = String(row.get("pos", ""))
		if rpos == "POR" or excluye.has(String(row.get("name", ""))):
			continue
		if mine:
			var prueba: Array = xi.duplicate()
			prueba[fuera] = row
			if user_index(prueba) != yo:
				continue
		if primero < 0:
			primero = i
		if de_linea < 0 and line_of(rpos) == linea:
			de_linea = i




		if poss_of(row).has(pos):
			var n: float = float(SquadMeta.media_of(row, pos)) \
					-(0.0 if rpos == pos else Rotation.CASTIGO_DECLARADO)
			if n > mismo_nota:
				mismo_nota = n
				mismo = i
	var entra: int = mismo if mismo >= 0 else (de_linea if de_linea >= 0 else primero)
	if entra < 0:
		return {}
	return {"fuera": fuera, "entra": entra, "ficha": squad[entra]}













static func orden_con_cambio(squad: Array, sale: int, entra: int) -> Array:
	var orden: Array = []
	var k_sale: int = -1
	var k_entra: int = -1
	for k in squad.size():
		var seat: int = int((squad[k] as Dictionary).get(SEAT_KEY, k))
		orden.append(seat)
		if seat == sale:
			k_sale = k
		elif seat == entra:
			k_entra = k
	if k_sale < 0 or k_sale >= STARTING_XI or k_entra < STARTING_XI:
		return []
	orden[k_sale] = entra
	orden[k_entra] = sale
	return orden






static func keeper(team_id: String) -> Dictionary:
	for p in of(team_id):
		if String(p["pos"]) == "POR":
			return p
	return fallback()























static func puesto_ofrecido(team_id: String, candidatos: Array, fav: String = "") -> String:
	var xi: Array = of(team_id).slice(0, STARTING_XI)
	if xi.is_empty():
		return ""



	var muro: Dictionary = {}
	for p in xi:
		var ficha: Dictionary = p as Dictionary
		var pos: String = String(ficha.get("pos", ""))
		var m: int = SquadMeta.media_of(ficha, pos)
		if not muro.has(pos) or m > int(muro[pos]):
			muro[pos] = m
	var mejor: String = ""
	var mejor_m: int = 999
	for c in candidatos:
		var pos2: String = String(c)
		if not muro.has(pos2):
			continue
		if int(muro[pos2]) < mejor_m:
			mejor_m = int(muro[pos2])
			mejor = pos2


	if not fav.is_empty() and fav != mejor and candidatos.has(fav) and muro.has(fav) \
			and int(muro[fav]) <= mejor_m + FAV_HOLGURA:
		return fav
	return mejor





const FAV_HOLGURA: int = 4












static func muros_once(team_id: String, sin_usuario: bool = false) -> Dictionary:
	var xi: Array = of(team_id).slice(0, STARTING_XI)
	var yo: int = user_index(xi) if sin_usuario else -1
	var muro: Dictionary = {}
	for i in range(xi.size()):
		var ficha: Dictionary = xi[i] as Dictionary
		var pos: String = String(ficha.get("pos", ""))
		if pos.is_empty():
			continue
		if not muro.has(pos):
			muro[pos] = 0
		if i == yo:
			continue
		muro[pos] = maxi(int(muro[pos]), SquadMeta.media_of(ficha, pos))
	return muro





static func user_slot(team_id: String) -> Dictionary:
	var squad: Array = of(team_id)
	var i: int = user_index(squad)
	return squad[i] if i >= 0 else fallback()



















static func user_index(squad: Array) -> int:
	return user_index_en(squad, USER_POS)












static func user_index_en(squad: Array, pos: String, con_identidad: bool = true) -> int:
	var tope: int = mini(squad.size(), STARTING_XI)



	if pos == "POR":
		return -1










	if con_identidad and _yo_hoy != null:
		for i in range(tope):
			if es_yo_hoy(squad[i]):
				return i
	for i in range(tope):
		if String((squad[i] as Dictionary).get("pos", "")) == pos:
			return i



















	for vecino in (POS_AFFINITY.get(pos, []) as Array):
		var v: String = String(vecino)
		if v == "POR":
			continue
		for i in range(tope):
			if String((squad[i] as Dictionary).get("pos", "")) == v:
				return i
	var mi_linea: String = line_of(pos)
	if mi_linea != "POR":
		for i in range(tope):
			if line_of(String((squad[i] as Dictionary).get("pos", ""))) == mi_linea:
				return i
	return -1






static var _yo_hoy: Variant = null


static func marca_yo_hoy(ficha: Variant) -> void:
	_yo_hoy = ficha









static func es_yo_hoy(ficha: Variant) -> bool:
	if _yo_hoy == null or not (ficha is Dictionary) or not (_yo_hoy is Dictionary):
		return false
	if is_same(ficha, _yo_hoy):
		return true
	var f: Dictionary = ficha
	var yo: Dictionary = _yo_hoy
	return int(f.get(SEAT_KEY, -1)) == int(yo.get(SEAT_KEY, -2)) \
			and String(f.get("name", "")) == String(yo.get("name", ""))









static func asiento_de_ficha(squad: Array, ficha: Variant) -> int:
	if not (ficha is Dictionary):
		return -1
	var f: Dictionary = ficha
	if f.is_empty() or bool(f.get("urgencia", false)):
		return -1
	var casa: int = int(f.get(SEAT_KEY, -1))
	if casa >= 0 and casa < squad.size() and is_same(squad[casa], f):
		return casa
	for i in squad.size():
		if is_same(squad[i], f):
			return i
	return -1



static func fallback() -> Dictionary:
	return {"name": "", "pos": "DC", "number": 9,
		"pegada": 70, "punteria": 70, "rosca": 70, "cabeza": 70,
		"penal": 70, "parado": 70, "reflejos": 70, "velocidad": 70,
		"entrada": 70, "aceleracion": 70}







static func best_specialist(team_id: String, key: String) -> Dictionary:
	var best: Dictionary = {}
	var xi: Array = of(team_id).slice(0, STARTING_XI)
	var mio: int = user_index(xi)
	for i in xi.size():
		var p: Dictionary = xi[i]
		if String(p["pos"]) == "POR" or i == mio:
			continue
		if best.is_empty() or int(p.get(key, 0)) > int(best.get(key, 0)):
			best = p
	return best














static func taker_name_in(squad: Array, key: String,
		mis_skills: Dictionary = {}) -> String:
	var best_i: int = -1
	var best_v: int = -1
	var mio: int = user_index(squad)
	for i in range(mini(squad.size(), STARTING_XI)):
		var pos: String = String((squad[i] as Dictionary).get("pos", ""))
		if pos == "POR":
			continue
		var v: int = int((squad[i] as Dictionary).get(key, 0))
		if i == mio and mis_skills.has(key):
			v = int(mis_skills[key])




		if v > best_v or (v == best_v and i == mio):
			best_v = v
			best_i = i
	return "" if best_i < 0 else String((squad[best_i] as Dictionary).get("name", ""))






const NORM_LO: float = 25.0
const NORM_SPAN: float = 74.0


static func norm(player: Dictionary, key: String) -> float:
	return clampf((float(player.get(key, 70)) - NORM_LO) / NORM_SPAN, 0.0, 1.0)










static func desnorm(frac: float) -> float:
	return NORM_LO + NORM_SPAN * clampf(frac, 0.0, 1.0)




















































const KEEPER_SKILL_ANCLAS: Array = [[50, 0.635], [65, 0.878], [79, 1.0]]




static func keeper_skill(player: Dictionary) -> float:
	var r: float = float(player.get("reflejos", 70))
	var a: Array = KEEPER_SKILL_ANCLAS
	if r <= float(a[0][0]):
		return float(a[0][1])
	for i in range(1, a.size()):
		if r <= float(a[i][0]):
			var x0: float = float(a[i - 1][0])
			var y0: float = float(a[i - 1][1])
			var x1: float = float(a[i][0])
			var y1: float = float(a[i][1])
			return y0 +(y1 - y0) *(r - x0) /(x1 - x0)
	return float(a[a.size() - 1][1])




const BONUS_IDX: Dictionary = {
	"pegada": 0, "punteria": 1, "rosca": 2, "cabeza": 3, "penal": 4,
	"parado": 5, "reflejos": 6, "velocidad": 7, "entrada": 8, "aceleracion": 9,





	"regate": 10,





	"fisico": 11,
}















static func norm_role(player: Dictionary, key: String, pos: String) -> float:
	var bonus: Variant = ROLE_BONUS.get(pos, null)
	var back: int = 0
	if bonus is Array and BONUS_IDX.has(key):
		back = - int((bonus as Array)[int(BONUS_IDX[key])])
	return clampf((float(player.get(key, 70)) + float(back) - 25.0) / 74.0, 0.0, 1.0)



















static var control_legacy: bool = false


static func control(player: Dictionary) -> float:






	if control_legacy or not player.has("regate"):
		return clampf(norm(player, "rosca") * 0.72 + norm(player, "punteria") * 0.28,
			0.0, 1.0)
	return clampf(norm(player, "regate") * 0.75 + norm(player, "rosca") * 0.25,
		0.0, 1.0)















static func ovr(player: Dictionary) -> float:
	return (norm(player, "pegada") + norm(player, "punteria")
		+ norm(player, "rosca") + norm(player, "cabeza")) / 4.0


static func _stat(value: int) -> int:
	return clampi(value, 25, 99)
