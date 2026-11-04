extends RefCounted


















const B: float = 0.21


static func de(id: String) -> Dictionary:
	match id:
		Flashback.MARACANAZO:
			return _maracanazo()
		Flashback.CABEZAZO:
			return _cabezazo()
		Flashback.PRORROGA_DE_RIO:
			return _prorroga_de_rio()
		Flashback.PENALES_DE_DOHA:
			return _penales_de_doha()
		Flashback.EL_TRUENO:
			return _el_trueno()
		Flashback.GOL_DE_ORO:
			return _gol_de_oro()
		Flashback.DESCUENTO_99:
			return _descuento_99()
		Flashback.ULTIMO_SUSPIRO:
			return _ultimo_suspiro()
		Flashback.LA_VUELTA:
			return _la_vuelta()
		Flashback.FUERA_DE_JUEGO:
			return _fuera_de_juego()
		Flashback.LA_MANITA:
			return _la_manita()
		Flashback.LA_CHILENA:
			return _la_chilena()
	return {}



static func _k(t: float, dist: float, h: float, yaw: float, aim_y: float, fx: float,
		fz: float, fov: float = 40.0) -> Dictionary:
	return {"t": t, "dist": dist, "h": h, "yaw": yaw, "aim_y": aim_y, "fov": fov,
		"focus_x": fx, "focus_z": fz}


static func _v(x: float, z: float) -> Vector3:
	return Vector3(x, 0.0, z)




static func _maracanazo() -> Dictionary:
	return {
		"actores": [
			{"id": "att", "bando": "a", "en": _v(8.0, 12.0), "anims": ["kick", "celebration"]},
			{"id": "por", "bando": "b", "en": _v(2.2, 0.8), "portero": true},
			{"id": "d1", "bando": "b", "en": _v(3.6, 5.2), "anims": ["lost"]},
			{"id": "d2", "bando": "b", "en": _v(-1.2, 6.5), "anims": ["cesped"]},
		],
		"bola": [
			[0.4, 2.4, Vector3(8.0, B, 11.6), Vector3(5.1, B, 6.6), 0.0],
			[2.4, 2.85, Vector3(5.1, B, 6.6), Vector3(3.2, 0.5, -0.3), 0.15],
			[2.85, 3.2, Vector3(3.2, 0.5, -0.3), Vector3(2.6, B, -1.0), 0.05],
		],
		"pasos": [
			["corre", "att", _v(8.0, 12.0), _v(5.3, 7.0), 0.4, 2.35],
			["gesto", "att", "kick", Vector3(-0.4, 0.0, -1.0), 2.4, false],
			["corre", "att", _v(5.3, 7.0), _v(7.5, 6.0), 3.0, 3.7],
			["lanza", "att", "celebration", 3.75],
			["mira", "por", "bola", 0.0, 2.5],
			["estira", "por", _v(2.2, 0.8), _v(3.0, 0.6), 2.6, false],
			["mira", "d1", "bola", 0.0, 3.3],
			["gesto", "d1", "lost", Vector3(0.0, 0.0, 1.0), 3.3, true],
			["cara", "d1", "llorar", 3.3],
			["mira", "d2", "bola", 0.0, 3.6],
			["lanza", "d2", "cesped_south", 3.6],
			["suena", "kick", -8.0, 2.4],
			["suena", "net_swish", -4.0, 2.85],
			["suena", "crowd_ooh", -6.0, 3.1],
			["suena", "stinger_bad", -6.0, 4.4],
			["tiembla", 0.06, 0.4, 4.4],
		],
		"focus": _v(4.5, 6.0),
		"camara": [
			_k(0.0, 11.0, 2.2, 160.0, 1.4, 5.5, 7.5),
			_k(2.6, 10.0, 2.0, 166.0, 1.2, 3.8, 4.5),
			_k(9.0, 8.5, 1.7, 186.0, 1.2, 3.5, 5.0),
		],
		"orbita": 0.4, "excita": 0.2, "t_cifra": 4.4,
	}





static func _cabezazo() -> Dictionary:
	return {
		"actores": [
			{"id": "zz", "bando": "a", "en": _v(0.6, 15.0), "cara": "Zidane",
				"anims": ["header", "lost"]},
			{"id": "mat", "bando": "b", "en": _v(1.0, 16.4), "anims": ["fall"]},
			{"id": "gk", "bando": "b", "en": _v(-3.2, 18.5), "cara": "Buffon",
				"anims": ["angry"]},
		],
		"arbitro": _v(7.0, 20.0),
		"bola": [[0.0, 1.0, Vector3(9.0, B, 24.0), Vector3(9.0, B, 24.0), 0.0]],
		"pasos": [
			["corre", "zz", _v(0.6, 17.6), _v(0.6, 15.6), 0.3, 1.6],
			["corre", "mat", _v(1.2, 18.6), _v(1.0, 16.6), 0.4, 1.7],
			["mira", "zz", Vector3(0.3, 0.0, 1.0), 1.7, 2.2],
			["corre", "zz", _v(0.6, 15.6), _v(0.8, 16.0), 2.0, 2.15],
			["gesto", "zz", "header", Vector3(0.3, 0.0, 1.0), 2.15, false],
			["gesto", "mat", "fall", Vector3(0.0, 0.0, 1.0), 2.3, true],
			["mira", "mat", Vector3(0.0, 0.0, -1.0), 1.7, 2.3],
			["corre", "arb", _v(7.0, 20.0), _v(2.8, 16.2), 2.6, 3.8],
			["corre", "gk", _v(-3.2, 18.5), _v(-1.6, 17.0), 2.6, 3.4],
			["lanza", "gk", "angry", 3.5],
			["cara", "gk", "protesta", 3.5],
			["gesto", "zz", "lost", Vector3(0.0, 0.0, 1.0), 4.2, false],
			["corre", "zz", _v(0.8, 16.0), _v(0.4, 22.0), 5.2, 8.5],
			["suena", "crowd_ooh", -5.0, 2.3],
			["suena", "whistle", -4.0, 3.6],
			["suena", "crowd_boo", -6.0, 4.0],
			["suena", "stinger_bad", -6.0, 4.6],
			["tiembla", 0.05, 0.3, 4.6],
		],
		"focus": _v(0.8, 16.5),
		"camara": [
			_k(0.0, 9.0, 1.9, 128.0, 1.3, 0.8, 16.5),
			_k(2.4, 7.5, 1.7, 132.0, 1.2, 0.9, 16.3),
			_k(9.0, 9.5, 2.0, 140.0, 1.3, 1.0, 17.0),
		],
		"orbita": 0.3, "excita": 0.6, "t_cifra": 4.6, "t_sello": 4.6,
	}




static func _prorroga_de_rio() -> Dictionary:
	return {
		"actores": [
			{"id": "centra", "bando": "a", "en": _v(-13.0, 12.5), "anims": ["kick"]},
			{"id": "att", "bando": "a", "en": _v(3.0, 10.5),
				"anims": ["control", "volea", "celebration"]},
			{"id": "por", "bando": "b", "en": _v(-0.4, 1.0), "portero": true},
			{"id": "d1", "bando": "b", "en": _v(-0.2, 6.0), "anims": ["lost"]},
			{"id": "diez", "bando": "b", "en": _v(3.8, 13.5), "cara": "Lionel Messi",
				"anims": ["lost"]},
		],
		"bola": [
			[1.0, 2.2, Vector3(-12.6, B, 12.3), Vector3(1.2, 1.3, 7.5), 3.5],
			[2.2, 2.7, Vector3(1.2, 1.3, 7.5), Vector3(1.0, 0.45, 7.0), 0.1],
			[2.75, 3.1, Vector3(1.0, 0.45, 7.0), Vector3(-2.6, 1.0, -0.3), 0.1],
			[3.1, 3.4, Vector3(-2.6, 1.0, -0.3), Vector3(-2.2, B, -1.0), 0.05],
		],
		"pasos": [
			["gesto", "centra", "kick", Vector3(1.0, 0.0, -0.3), 0.95, false],
			["corre", "att", _v(3.0, 10.5), _v(1.3, 7.8), 0.6, 2.1],
			["gesto", "att", "control", Vector3(-1.0, 0.0, 0.0), 2.15, false],
			["gesto", "att", "volea", Vector3(-0.3, 0.0, -1.0), 2.75, false],
			["corre", "att", _v(1.3, 7.8), _v(4.2, 9.6), 3.2, 3.8],
			["lanza", "att", "celebration", 3.85],
			["cara", "att", "reir", 3.85],
			["mira", "por", "bola", 0.0, 2.85],
			["estira", "por", _v(-0.4, 1.0), _v(-1.7, 0.8), 2.85, true],
			["mira", "d1", "bola", 0.0, 3.3],
			["gesto", "d1", "lost", Vector3(0.0, 0.0, 1.0), 3.3, true],
			["mira", "diez", "bola", 0.0, 3.4],
			["gesto", "diez", "lost", Vector3(0.0, 0.0, 1.0), 3.4, true],
			["cara", "diez", "llorar", 3.6],
			["suena", "kick", -10.0, 1.0],
			["suena", "kick", -8.0, 2.75],
			["suena", "net_swish", -4.0, 3.1],
			["suena", "crowd_roar", -2.0, 3.15],
		],
		"focus": _v(1.0, 7.5),
		"camara": [
			_k(0.0, 12.0, 2.6, 172.0, 1.6, -1.5, 8.0),
			_k(2.3, 9.5, 2.0, 170.0, 1.3, 0.8, 6.0),
			_k(4.0, 8.0, 1.7, 196.0, 1.3, 3.0, 10.5),
			_k(9.0, 7.5, 1.6, 200.0, 1.3, 3.5, 12.0),
		],
		"orbita": 0.4, "excita": 0.9, "t_cifra": 3.3,
	}





static func _penales_de_doha() -> Dictionary:
	return {
		"actores": [
			{"id": "tira", "bando": "a", "en": _v(0.6, 13.2), "anims": ["kick", "cielo"]},
			{"id": "por", "bando": "b", "en": _v(0.0, 0.4), "portero": true},
			{"id": "diez", "bando": "a", "en": _v(-1.5, 22.0), "cara": "Lionel Messi",
				"anims": ["rodillas"]},
			{"id": "emi", "bando": "a", "en": _v(-3.2, 23.0), "cara": "Emiliano Martínez",
				"anims": ["celebration"]},
			{"id": "kyl", "bando": "b", "en": _v(1.6, 21.2), "cara": "Kylian Mbappé",
				"anims": ["lost"]},
		],
		"bola": [
			[1.9, 2.3, Vector3(0.0, B, 11.0), Vector3(1.8, 0.6, -0.3), 0.0],
			[2.3, 2.6, Vector3(1.8, 0.6, -0.3), Vector3(1.3, B, -1.0), 0.05],
		],
		"pasos": [
			["corre", "tira", _v(0.6, 13.2), _v(0.15, 11.4), 0.8, 1.85],
			["gesto", "tira", "kick", Vector3(0.15, 0.0, -1.0), 1.9, false],
			["lanza", "tira", "cielo", 2.6],
			["mira", "por", Vector3(0.0, 0.0, 1.0), 0.0, 2.0],
			["estira", "por", _v(0.0, 0.4), _v(-1.6, 0.4), 2.0, true],
			["mira", "diez", Vector3(0.0, 0.0, -1.0), 0.0, 3.0],
			["lanza", "diez", "rodillas_south", 3.0],
			["cara", "diez", "llorar", 3.2],
			["mira", "emi", Vector3(0.0, 0.0, -1.0), 0.0, 3.2],
			["corre", "emi", _v(-3.2, 23.0), _v(-2.4, 21.6), 3.2, 3.8],
			["lanza", "emi", "celebration", 3.85],
			["mira", "kyl", Vector3(0.0, 0.0, -1.0), 0.0, 3.4],
			["gesto", "kyl", "lost", Vector3(0.0, 0.0, 1.0), 3.4, true],
			["cara", "kyl", "llorar", 3.7],
			["suena", "kick", -8.0, 1.9],
			["suena", "net_swish", -4.0, 2.3],
			["suena", "crowd_roar", -2.0, 2.4],
			["suena", "stinger_bad", -6.0, 4.4],
			["tiembla", 0.06, 0.4, 4.4],
		],
		"focus": _v(0.3, 6.0),
		"camara": [
			_k(0.0, 7.0, 1.8, 178.0, 1.2, 0.3, 9.0),
			_k(2.89, 7.5, 1.8, 176.0, 1.1, 0.4, 7.0),
			_k(2.9, 8.5, 1.8, 172.0, 1.2, -0.6, 21.6),
			_k(9.0, 7.0, 1.6, 168.0, 1.1, -0.5, 21.8),
		],
		"cortes": [2.9], "orbita": 0.3, "excita": 1.0, "t_cifra": 4.4, "t_sello": 5.3,
	}





static func _el_trueno() -> Dictionary:
	return {
		"actores": [
			{"id": "att", "bando": "b", "en": _v(-2.0, 17.0), "anims": ["kick", "clap"]},
			{"id": "por", "bando": "a", "en": _v(0.0, 1.0), "portero": true},
			{"id": "i1", "bando": "b", "en": _v(-5.0, 14.0), "anims": ["clap"]},
			{"id": "i2", "bando": "b", "en": _v(2.6, 15.5), "anims": ["clap"]},
			{"id": "roo", "bando": "a", "en": _v(1.4, 9.0), "cara": "Rooney",
				"anims": ["lost"]},
		],
		"bola": [
			[0.4, 1.6, Vector3(-2.0, B, 16.6), Vector3(-1.0, B, 13.6), 0.0],
			[1.6, 2.2, Vector3(-1.0, B, 13.6), Vector3(-0.4, 0.25, -0.3), 0.0],
			[2.2, 2.5, Vector3(-0.4, 0.25, -0.3), Vector3(-0.2, B, -1.0), 0.02],
		],
		"pasos": [
			["corre", "att", _v(-2.0, 17.0), _v(-1.0, 14.0), 0.4, 1.55],
			["gesto", "att", "kick", Vector3(0.1, 0.0, -1.0), 1.6, false],
			["corre", "att", _v(-1.0, 14.0), _v(-2.2, 12.4), 2.8, 3.3],
			["corre", "i1", _v(-5.0, 14.0), _v(-3.3, 12.2), 2.6, 3.3],
			["corre", "i2", _v(2.6, 15.5), _v(-0.9, 12.6), 2.6, 3.4],
			["gesto", "att", "clap", Vector3(0.0, 0.0, 1.0), 3.8, false],
			["gesto", "i1", "clap", Vector3(0.0, 0.0, 1.0), 3.8, false],
			["gesto", "i2", "clap", Vector3(0.0, 0.0, 1.0), 3.8, false],
			["mira", "por", "bola", 0.0, 2.0],
			["estira", "por", _v(0.0, 1.0), _v(-0.6, 0.9), 2.0, true],
			["mira", "roo", "bola", 0.0, 3.0],
			["gesto", "roo", "lost", Vector3(0.0, 0.0, 1.0), 3.0, true],
			["cara", "roo", "llorar", 3.2],
			["suena", "kick", -8.0, 1.6],
			["suena", "net_swish", -4.0, 2.2],
			["suena", "crowd_roar", -2.0, 2.3],
			["suena", "crowd_roar", -4.0, 3.85],
			["suena", "crowd_roar", -4.0, 5.0],
			["tiembla", 0.08, 0.3, 3.85],
			["tiembla", 0.08, 0.3, 5.0],
		],
		"focus": _v(-0.6, 9.0),
		"camara": [
			_k(0.0, 10.0, 2.2, 176.0, 1.3, -0.8, 10.0),
			_k(2.4, 9.0, 2.0, 180.0, 1.2, -0.4, 8.0),
			_k(9.0, 10.0, 2.0, 188.0, 1.3, -1.2, 11.0),
		],
		"orbita": 0.4, "excita": 0.9, "t_cifra": 4.4,
	}





static func _gol_de_oro() -> Dictionary:
	return {
		"actores": [
			{"id": "centra", "bando": "a", "en": _v(14.0, 12.0), "anims": ["kick"]},
			{"id": "att", "bando": "a", "en": _v(1.6, 10.0),
				"anims": ["header", "celebration"]},
			{"id": "mal", "bando": "b", "en": _v(0.2, 6.2), "cara": "Maldini",
				"anims": ["header", "lost"]},
			{"id": "por", "bando": "b", "en": _v(0.0, 0.8), "portero": true, "cara": "Buffon"},
			{"id": "tot", "bando": "b", "en": _v(-4.0, 10.5), "cara": "Totti",
				"anims": ["angry"]},
		],
		"bola": [
			[1.0, 2.2, Vector3(13.6, B, 11.8), Vector3(0.5, 2.3, 6.5), 3.0],
			[2.2, 2.6, Vector3(0.5, 2.3, 6.5), Vector3(-1.6, 1.6, -0.3), 0.0],
			[2.6, 2.9, Vector3(-1.6, 1.6, -0.3), Vector3(-1.4, B, -1.0), 0.05],
		],
		"pasos": [
			["gesto", "centra", "kick", Vector3(-1.0, 0.0, -0.4), 0.95, false],
			["corre", "att", _v(1.6, 10.0), _v(0.6, 6.9), 0.6, 2.0],
			["gesto", "att", "header", Vector3(-0.3, 0.0, -1.0), 2.05, false],
			["salta", "att", 2.0, 0.55, 0.55],
			["corre", "att", _v(0.6, 6.9), _v(3.6, 9.0), 2.8, 3.5],
			["lanza", "att", "celebration", 3.55],
			["cara", "att", "reir", 3.55],
			["mira", "mal", "bola", 0.0, 2.0],
			["gesto", "mal", "header", Vector3(0.6, 0.0, 1.0), 2.07, false],
			["salta", "mal", 2.02, 0.5, 0.3],
			["gesto", "mal", "lost", Vector3(0.0, 0.0, 1.0), 3.0, true],
			["mira", "por", "bola", 0.0, 2.3],
			["estira", "por", _v(0.0, 0.8), _v(-1.2, 0.8), 2.3, true],
			["mira", "tot", "bola", 0.0, 3.4],
			["lanza", "tot", "angry", 3.4],
			["cara", "tot", "protesta", 3.4],
			["suena", "kick", -10.0, 1.0],
			["suena", "kick", -9.0, 2.2],
			["suena", "net_swish", -4.0, 2.6],
			["suena", "crowd_roar", -2.0, 2.65],
		],
		"focus": _v(0.4, 6.5),
		"camara": [
			_k(0.0, 11.0, 2.4, 166.0, 1.7, 2.0, 7.0),
			_k(2.2, 9.5, 2.2, 170.0, 1.6, 0.3, 5.5),
			_k(9.0, 8.5, 1.8, 158.0, 1.3, 1.0, 8.0),
		],
		"orbita": 0.4, "excita": 1.0, "t_cifra": 2.9, "t_sello": 4.0,
	}





static func _descuento_99() -> Dictionary:
	return {
		"actores": [
			{"id": "peina", "bando": "a", "en": _v(0.6, 5.4), "anims": ["header"]},
			{"id": "att", "bando": "a", "en": _v(-1.6, 5.2), "anims": ["volea", "celebration"]},
			{"id": "por", "bando": "b", "en": _v(0.6, 0.6), "portero": true},
			{"id": "d1", "bando": "b", "en": _v(-0.2, 4.4), "anims": ["cesped"]},
			{"id": "d2", "bando": "b", "en": _v(2.2, 6.4), "anims": ["rodillas"]},
		],
		"bola": [
			[0.6, 1.8, Vector3(20.0, B, 0.3), Vector3(0.6, 1.7, 5.0), 4.0],
			[1.8, 2.2, Vector3(0.6, 1.7, 5.0), Vector3(-0.8, 0.5, 2.3), 0.3],
			[2.25, 2.5, Vector3(-0.8, 0.5, 2.3), Vector3(-0.5, 2.25, -0.3), 0.05],
			[2.5, 2.8, Vector3(-0.5, 2.25, -0.3), Vector3(-0.4, B, -0.9), 0.0],
		],
		"pasos": [
			["mira", "peina", "bola", 0.0, 1.8],
			["gesto", "peina", "header", Vector3(-0.6, 0.0, -1.0), 1.8, false],
			["salta", "peina", 1.75, 0.45, 0.35],
			["corre", "att", _v(-1.6, 5.2), _v(-0.9, 2.7), 1.2, 2.15],
			["gesto", "att", "volea", Vector3(0.1, 0.0, -1.0), 2.2, false],
			["corre", "att", _v(-0.9, 2.7), _v(-3.5, 6.0), 2.9, 3.6],
			["lanza", "att", "celebration", 3.65],
			["cara", "att", "reir", 3.65],
			["mira", "por", "bola", 0.0, 9.0],
			["mira", "d1", "bola", 0.0, 3.2],
			["lanza", "d1", "cesped_south", 3.2],
			["mira", "d2", "bola", 0.0, 3.5],
			["lanza", "d2", "rodillas_south", 3.5],
			["cara", "d2", "llorar", 3.7],
			["suena", "kick", -10.0, 0.6],
			["suena", "kick", -9.0, 1.8],
			["suena", "kick", -7.0, 2.25],
			["suena", "net_swish", -4.0, 2.5],
			["suena", "crowd_roar", -2.0, 2.55],
			["suena", "stinger_bad", -6.0, 4.2],
			["tiembla", 0.06, 0.4, 4.2],
		],
		"focus": _v(0.0, 4.0),
		"camara": [
			_k(0.0, 10.0, 2.4, 160.0, 1.6, 1.5, 4.0),
			_k(2.3, 8.5, 2.0, 168.0, 1.4, -0.3, 3.0),
			_k(9.0, 8.0, 1.7, 150.0, 1.2, 0.0, 4.6),
		],
		"orbita": 0.4, "excita": 1.0, "t_cifra": 4.2,
	}




static func _ultimo_suspiro() -> Dictionary:
	return {
		"actores": [
			{"id": "att", "bando": "a", "en": _v(6.0, 14.0), "anims": ["kick", "celebration"]},
			{"id": "def", "bando": "b", "en": _v(2.0, 8.0), "anims": ["cesped"]},
			{"id": "por", "bando": "b", "en": _v(1.4, 0.8), "portero": true},
			{"id": "d2", "bando": "b", "en": _v(-1.5, 6.0), "anims": ["lost"]},
		],
		"bola": [
			[0.4, 2.2, Vector3(6.0, B, 13.6), Vector3(3.0, B, 8.1), 0.0],
			[2.3, 2.65, Vector3(3.0, B, 8.1), Vector3(2.9, 1.0, -0.3), 0.1],
			[2.65, 2.95, Vector3(2.9, 1.0, -0.3), Vector3(2.5, B, -1.0), 0.05],
		],
		"pasos": [
			["corre", "att", _v(6.0, 14.0), _v(3.2, 8.6), 0.4, 2.2],
			["gesto", "att", "kick", Vector3(0.0, 0.0, -1.0), 2.3, false],
			["corre", "att", _v(3.2, 8.6), _v(8.5, 12.0), 2.9, 3.8],
			["lanza", "att", "celebration", 3.85],
			["cara", "att", "reir", 3.85],
			["mira", "def", "bola", 0.0, 3.2],
			["lanza", "def", "cesped_south", 3.2],
			["mira", "por", "bola", 0.0, 2.4],
			["estira", "por", _v(1.4, 0.8), _v(2.6, 0.7), 2.4, false],
			["mira", "d2", "bola", 0.0, 3.0],
			["gesto", "d2", "lost", Vector3(0.0, 0.0, 1.0), 3.0, true],
			["cara", "d2", "llorar", 3.2],
			["suena", "kick", -8.0, 2.3],
			["suena", "net_swish", -4.0, 2.65],
			["suena", "crowd_roar", 0.0, 2.7],
			["suena", "stinger_bad", -6.0, 4.4],
			["tiembla", 0.1, 0.5, 2.7],
		],
		"focus": _v(3.0, 7.0),
		"camara": [
			_k(0.0, 11.0, 2.3, 160.0, 1.4, 4.0, 9.0),
			_k(2.4, 9.5, 2.0, 168.0, 1.2, 2.6, 5.0),
			_k(9.0, 9.0, 1.8, 194.0, 1.3, 5.5, 9.5),
		],
		"orbita": 0.4, "excita": 1.0, "t_cifra": 4.4,
	}





static func _la_vuelta() -> Dictionary:
	return {
		"actores": [
			{"id": "att", "bando": "b", "en": _v(-3.0, 15.0), "anims": ["kick", "celebration"]},
			{"id": "por", "bando": "a", "en": _v(0.0, 0.8), "portero": true},
			{"id": "lig", "bando": "a", "en": _v(-0.8, 9.0), "cara": "Matthijs de Ligt",
				"anims": ["lost", "cesped"]},
			{"id": "d2", "bando": "a", "en": _v(2.4, 7.0), "anims": ["lost"]},
		],
		"bola": [
			[0.5, 2.1, Vector3(-3.0, B, 14.6), Vector3(-2.0, B, 11.6), 0.0],
			[2.2, 2.6, Vector3(-2.0, B, 11.6), Vector3(2.9, 0.25, -0.3), 0.0],
			[2.6, 2.9, Vector3(2.9, 0.25, -0.3), Vector3(2.6, B, -1.0), 0.02],
		],
		"pasos": [
			["corre", "att", _v(-3.0, 15.0), _v(-2.1, 12.0), 0.5, 2.1],
			["gesto", "att", "kick", Vector3(0.4, 0.0, -1.0), 2.2, false],
			["corre", "att", _v(-2.1, 12.0), _v(-5.5, 10.5), 2.9, 3.6],
			["lanza", "att", "celebration", 3.65],
			["mira", "por", "bola", 0.0, 2.3],
			["estira", "por", _v(0.0, 0.8), _v(1.3, 0.8), 2.3, false],
			["mira", "lig", "bola", 0.0, 3.0],
			["gesto", "lig", "lost", Vector3(0.0, 0.0, 1.0), 3.0, true],
			["cara", "lig", "llorar", 3.3],
			["lanza", "lig", "cesped_south", 4.6],
			["mira", "d2", "bola", 0.0, 3.2],
			["gesto", "d2", "lost", Vector3(0.0, 0.0, 1.0), 3.2, true],
			["suena", "kick", -8.0, 2.2],
			["suena", "net_swish", -4.0, 2.6],
			["suena", "crowd_ooh", -4.0, 2.7],
			["suena", "stinger_bad", -6.0, 4.4],
			["tiembla", 0.06, 0.4, 4.4],
		],
		"focus": _v(-0.6, 8.0),
		"camara": [
			_k(0.0, 10.5, 2.2, 182.0, 1.3, -1.5, 10.0),
			_k(2.4, 9.5, 2.0, 178.0, 1.2, 0.0, 6.0),
			_k(9.0, 7.0, 1.6, 168.0, 1.1, -0.8, 9.0),
		],
		"orbita": 0.4, "excita": 0.5, "t_cifra": 4.4,
	}





static func _fuera_de_juego() -> Dictionary:
	return {
		"actores": [
			{"id": "att", "bando": "a", "en": _v(2.6, 4.2), "anims": ["kick", "celebration"]},
			{"id": "por", "bando": "b", "en": _v(-0.5, 1.2), "portero": true},
			{"id": "d1", "bando": "b", "en": _v(0.0, 3.0), "anims": ["header", "perdon"]},
			{"id": "d2", "bando": "b", "en": _v(-2.4, 5.0), "anims": ["perdon"]},
			{"id": "d3", "bando": "b", "en": _v(3.6, 6.5), "anims": ["angry"]},
		],
		"arbitro": _v(5.5, 14.0),
		"bola": [
			[0.4, 1.6, Vector3(12.0, B, 8.0), Vector3(0.3, 1.0, 2.0), 2.5],
			[1.6, 2.1, Vector3(0.3, 1.0, 2.0), Vector3(1.1, B, 1.0), 0.2],
			[2.15, 2.35, Vector3(1.1, B, 1.0), Vector3(0.8, 0.4, -0.3), 0.0],
			[2.35, 2.6, Vector3(0.8, 0.4, -0.3), Vector3(0.7, B, -0.9), 0.0],
		],
		"pasos": [
			["corre", "att", _v(2.6, 4.2), _v(1.3, 1.3), 1.0, 2.05],
			["gesto", "att", "kick", Vector3(-0.3, 0.0, -1.0), 2.1, false],
			["corre", "att", _v(1.3, 1.3), _v(5.0, 5.0), 2.7, 3.5],
			["lanza", "att", "celebration", 3.55],
			["mira", "d1", "bola", 0.0, 1.6],
			["gesto", "d1", "header", Vector3(1.0, 0.0, 0.6), 1.55, false],
			["salta", "d1", 1.5, 0.45, 0.3],
			["mira", "por", "bola", 0.0, 1.7],
			["estira", "por", _v(-0.5, 1.2), _v(0.3, 1.0), 1.7, false],
			["mira", "d2", "bola", 0.0, 3.0],
			["lanza", "d1", "perdon", 3.0],
			["lanza", "d2", "perdon", 3.1],
			["cara", "d1", "protesta", 3.0],
			["mira", "d3", "bola", 0.0, 3.2],
			["lanza", "d3", "angry", 3.2],
			["cara", "d3", "protesta", 3.2],
			["mira", "arb", Vector3(0.0, 0.0, 1.0), 3.0, 9.0],
			["suena", "kick", -10.0, 0.4],
			["suena", "kick", -8.0, 2.1],
			["suena", "net_swish", -4.0, 2.35],
			["suena", "crowd_roar", -2.0, 2.4],
			["suena", "whistle", -6.0, 3.3],
		],
		"focus": _v(0.8, 3.0),
		"camara": [
			_k(0.0, 9.5, 2.4, 164.0, 1.3, 2.0, 4.0),
			_k(2.3, 8.0, 2.0, 172.0, 1.1, 0.8, 2.5),
			_k(9.0, 8.5, 1.9, 186.0, 1.2, 0.5, 4.0),
		],
		"orbita": 0.4, "excita": 1.0, "t_cifra": 2.5, "t_sello": 3.6,
	}





static func _la_manita() -> Dictionary:
	return {
		"actores": [
			{"id": "att", "bando": "a", "en": _v(2.0, 14.0), "anims": ["kick", "celebration"]},
			{"id": "por", "bando": "b", "en": _v(0.3, 1.2), "portero": true, "cara": "Casillas"},
			{"id": "xavi", "bando": "a", "en": _v(-3.5, 13.0), "cara": "Xavi",
				"anims": ["perdon"]},
			{"id": "ini", "bando": "a", "en": _v(4.5, 13.5), "cara": "Iniesta",
				"anims": ["perdon"]},
			{"id": "cr", "bando": "b", "en": _v(-1.2, 15.5), "cara": "Cristiano Ronaldo",
				"anims": ["lost"]},
		],
		"bola": [
			[0.5, 2.0, Vector3(2.0, B, 13.6), Vector3(0.8, B, 8.6), 0.0],
			[2.1, 2.5, Vector3(0.8, B, 8.6), Vector3(0.1, B, -0.3), 0.0],
			[2.5, 2.8, Vector3(0.1, B, -0.3), Vector3(0.0, B, -1.0), 0.0],
		],
		"pasos": [
			["corre", "att", _v(2.0, 14.0), _v(0.9, 9.0), 0.5, 2.0],
			["gesto", "att", "kick", Vector3(-0.1, 0.0, -1.0), 2.1, false],
			["corre", "att", _v(0.9, 9.0), _v(1.0, 11.6), 2.7, 3.3],
			["lanza", "att", "celebration", 3.35],
			["mira", "por", "bola", 0.0, 9.0],
			["corre", "xavi", _v(-3.5, 13.0), _v(-0.8, 11.8), 2.6, 3.3],
			["lanza", "xavi", "perdon", 3.4],
			["cara", "xavi", "reir", 3.4],
			["corre", "ini", _v(4.5, 13.5), _v(2.6, 12.0), 2.6, 3.4],
			["lanza", "ini", "perdon", 3.6],
			["cara", "ini", "reir", 3.6],
			["mira", "cr", "bola", 0.0, 3.0],
			["gesto", "cr", "lost", Vector3(0.0, 0.0, 1.0), 3.0, true],
			["cara", "cr", "protesta", 3.2],
			["suena", "kick", -8.0, 2.1],
			["suena", "net_swish", -4.0, 2.5],
			["suena", "crowd_roar", -2.0, 2.55],
			["suena", "crowd_roar", -4.0, 3.5],
			["suena", "stinger_bad", -6.0, 4.4],
			["tiembla", 0.06, 0.4, 4.4],
		],
		"focus": _v(0.6, 8.0),
		"camara": [
			_k(0.0, 10.0, 2.2, 176.0, 1.3, 1.0, 9.0),
			_k(2.4, 9.0, 2.0, 178.0, 1.2, 0.5, 6.0),
			_k(3.2, 8.0, 1.8, 186.0, 1.3, 0.8, 12.0),
			_k(9.0, 7.5, 1.7, 190.0, 1.3, 0.8, 12.6),
		],
		"orbita": 0.3, "excita": 1.0, "t_cifra": 4.4,
	}






static func _la_chilena() -> Dictionary:
	return {
		"actores": [
			{"id": "centra", "bando": "a", "en": _v(14.0, 10.0), "anims": ["kick"]},
			{"id": "cr", "bando": "a", "en": _v(1.6, 12.0), "cara": "Cristiano Ronaldo",
				"anims": ["chilena", "celebration"]},
			{"id": "por", "bando": "b", "en": _v(0.0, 0.8), "portero": true, "cara": "Buffon"},
			{"id": "d1", "bando": "b", "en": _v(1.4, 8.0), "anims": ["lost", "clap"]},
			{"id": "d2", "bando": "b", "en": _v(-2.6, 9.5), "anims": ["clap"]},
		],
		"bola": [
			[1.0, 2.2, Vector3(13.6, B, 10.0), Vector3(0.8, 2.3, 9.0), 3.0],
			[2.25, 2.6, Vector3(0.8, 2.3, 9.0), Vector3(-1.8, 0.7, -0.3), 0.0],
			[2.6, 2.9, Vector3(-1.8, 0.7, -0.3), Vector3(-1.6, B, -1.0), 0.05],
		],
		"pasos": [
			["gesto", "centra", "kick", Vector3(-1.0, 0.0, -0.1), 0.95, false],
			["corre", "cr", _v(1.6, 12.0), _v(0.8, 9.4), 0.6, 1.95],

			["gesto", "cr", "chilena", Vector3(0.0, 0.0, 1.0), 1.95, true],
			["salta", "cr", 1.95, 0.7, 0.45],
			["corre", "cr", _v(0.8, 9.4), _v(-2.0, 12.0), 3.4, 4.0],
			["lanza", "cr", "celebration", 4.05],
			["cara", "cr", "reir", 4.05],
			["mira", "por", "bola", 0.0, 9.0],
			["mira", "d1", "bola", 0.0, 3.0],
			["gesto", "d1", "lost", Vector3(0.0, 0.0, 1.0), 3.0, false],
			["gesto", "d1", "clap", Vector3(0.0, 0.0, 1.0), 4.9, false],
			["mira", "d2", "bola", 0.0, 4.9],
			["gesto", "d2", "clap", Vector3(0.0, 0.0, 1.0), 5.0, false],
			["suena", "kick", -10.0, 1.0],
			["suena", "kick", -6.0, 2.15],
			["suena", "net_swish", -4.0, 2.6],
			["suena", "crowd_ooh", -3.0, 2.7],
			["suena", "crowd_roar", -4.0, 5.0],
		],
		"focus": _v(0.6, 7.0),
		"camara": [
			_k(0.0, 11.0, 2.0, 132.0, 1.6, 2.5, 8.0),
			_k(2.2, 9.5, 1.6, 128.0, 1.7, 0.6, 7.5),
			_k(9.0, 9.0, 1.8, 150.0, 1.3, 1.5, 9.0),
		],
		"orbita": 0.3, "excita": 0.7, "t_cifra": 4.4, "t_sello": 5.8,
	}
