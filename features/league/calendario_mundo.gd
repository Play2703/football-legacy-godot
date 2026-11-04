class_name CalendarioMundo
extends RefCounted







const FASE_LIGA: String = "liga"
const FASE_COPA: String = "copa"
const FASE_GRUPO: String = "grupo"
const FASE_KO: String = "ko"
const FASE_PREVIA: String = "previa"
const FASE_PRELIMINAR: String = "preliminar"
const FASE_LIGUILLA: String = "liguilla"
const FASE_FIFA: String = "fifa"









const SIN_SEMANA: float = -1000000000.0
const SIN_DIA: int = -(1<<30)








const DIA_SEMANA_0: int = 9






const DIAS_SEMANA: Array[String] = ["LU", "MA", "MI", "JU", "VI", "SA", "DO"]


static func semana_conocida(w: float) -> bool:
	return w > SIN_SEMANA * 0.5


static func dia_conocido(d: int) -> bool:
	return d > SIN_DIA / 2




const OFF_EURO_LIGA: float = 0.25
const OFF_NAT: float = 0.35
const OFF_NAT_DOBLE: float = 0.025
const OFF_COPA: float = 0.5
const OFF_EURO_KO: float = 0.5


const OFF_FINAL_CONF: float = 0.3



const COPA_DESDE: float = 0.18
const COPA_TRAMO: float = 0.7




const CARGA_MAX: int = 3



static var _anos: Dictionary = {}




static var _anos_de: Dictionary = {}




static var _torneos: Dictionary = {}
static var _torneos_clave: String = ""




static var _proyecciones: Dictionary = {}





static var _liguillas_en_curso: Dictionary = {}







static func semana_liga(r: int) -> float:
	return float(r + 1)






static func copa_rondas(size: int) -> int:
	if size < 2:
		return 0
	return int(log(size) / log(2.0))



static func semana_copa(i: int, n: int, league_len: int) -> float:
	return float(league_len) *(COPA_DESDE + COPA_TRAMO *(float(i) / maxf(float(n - 1), 1.0))) \
			+ OFF_COPA












static func semana_euro_liga(r: int, league_len: int, comp: String = "ucl",
		pais: String = "") -> float:
	var ws: Array = _semanas_euro(comp, league_len, pais)
	var n: int = GameState.euro_league_spots(comp).size()
	if r < 0 or r >= n or r >= ws.size():
		return float(league_len) * GameState.euro_league_spots(comp)[clampi(r, 0, n - 1)] \
				+ OFF_EURO_LIGA
	return float(ws[r])



static func euro_ko_dos_partidos(ko_idx: int) -> bool:
	return ko_idx < GameState.EURO_KO_TWO_LEGS.size() and GameState.EURO_KO_TWO_LEGS[ko_idx]






static func semana_euro_ko(ko_idx: int, leg: int, league_len: int, comp: String = "ucl",
		pais: String = "") -> float:
	var ws: Array = _semanas_euro(comp, league_len, pais)
	var i: int = GameState.euro_league_spots(comp).size()
	for k in GameState.euro_ko_spots(comp).size():
		var dos: bool = euro_ko_dos_partidos(k)
		if k == ko_idx:
			if dos and leg != 0:
				i += 1
			return float(ws[i]) if i < ws.size() else SIN_SEMANA
		i += 2 if dos else 1
	return SIN_SEMANA



static var _memo_euro: Dictionary = {}






static func _semanas_euro(comp: String, league_len: int, pais: String = "") -> Array:



	if GameState.previas_vivas():
		return semanas_euro_con_previa(comp, league_len, pais)["resto"]
	var clave: String = "%s|%d|%s" % [comp, league_len, pais]
	if _memo_euro.has(clave):
		return _memo_euro[clave]
	var e: Dictionary = _entradas_euro(comp, league_len, pais)












	var copa: Dictionary = Continental.semanas_copa(pais, league_len)
	var ws: Array = Continental.semanas_reales(e["fracs"], e["offs"], league_len, 1, [], copa,
		e["metas"], pais, -1.0, _fifa_euro(league_len, copa, pais), e["dobla"], e["pegable"])
	_memo_euro[clave] = ws
	return ws



static func _fifa_euro(league_len: int, copa: Dictionary, pais: String) -> Dictionary:
	var fifa: Dictionary = {}
	for v in semanas_fifa(league_len, copa, pais):
		fifa[int(v)] = true
	return fifa






static func _entradas_euro(comp: String, league_len: int, pais: String) -> Dictionary:
	var fracs: Array = []
	var offs: Array = []
	var dobla: Array = []
	var pegable: Array = []
	for sp in GameState.euro_league_spots(comp):
		dobla.append(not fracs.is_empty())
		pegable.append(false)
		fracs.append(float(sp))
		offs.append(OFF_EURO_LIGA)
	var ko_spots: Array[float] = GameState.euro_ko_spots(comp)
	for k in ko_spots.size():
		var final: bool = k == ko_spots.size() - 1
		if euro_ko_dos_partidos(k):
			dobla.append(false)
			pegable.append(not final)
			fracs.append(float(GameState.EURO_KO_LEG1_SPOTS[k]))
			offs.append(OFF_EURO_KO)
		dobla.append(false)
		pegable.append(not final and not euro_ko_dos_partidos(k))
		fracs.append(float(ko_spots[k]))


		var ultima: bool = k == ko_spots.size() - 1
		offs.append(OFF_FINAL_CONF if (ultima and comp == "conf") else OFF_EURO_KO)









	var ultimo: int = Continental.tramo_real(pais, 5.5, league_len)
	var metas: Array = []
	for f in fracs:
		var mes: float = fposmod(7.0 + 10.0 * float(f), 12.0) + 1.0
		metas.append(Continental.tramo_real(pais, mes, league_len) if float(f) < 1.0 else ultimo)



	return {"fracs": fracs, "offs": offs, "dobla": dobla, "pegable": pegable, "metas": metas}



static var _memo_previa: Dictionary = {}
























static func semanas_euro_con_previa(comp: String, league_len: int, pais: String = "") -> Dictionary:
	var clave: String = "%s|%d|%s" % [comp, league_len, pais]
	if _memo_previa.has(clave):
		return _memo_previa[clave]
	var off: float = OFF_EURO_LIGA if comp == "ucl" else OFF_EURO_KO
	var previa: Array = []
	var copa: Dictionary = Continental.semanas_copa(pais, league_len)
	var ocupadas: Dictionary = copa.duplicate()
	for ronda in VeranoUefa.RONDAS:
		for leg in 2:
			var k: int = VeranoUefa.semana(comp, ronda, leg)
			previa.append(float(k) + off)
			if k >= 0:
				ocupadas[k] = true
	var e: Dictionary = _entradas_euro(comp, league_len, pais)


	var resto: Array = Continental.semanas_reales(e["fracs"], e["offs"], league_len, 1, [], ocupadas,
		e["metas"], pais, -1.0, _fifa_euro(league_len, copa, pais), e["dobla"], e["pegable"])
	var out: Dictionary = {"previa": previa, "resto": resto}
	_memo_previa[clave] = out
	return out





































static func semanas_fifa(league_len: int, ocupadas: Dictionary, pais: String = "") -> Array:
	var L: int = maxi(league_len, 1)
	var n: int = GameState.NAT_FIFA_WINDOWS.size()
	var bases: Array[int] = []
	for spot in GameState.NAT_FIFA_WINDOWS:
		bases.append(int(floor(float(league_len) * float(spot))))
	var con_mes: bool = largo_de(L, pais) <= float(L)


	var cand: Array = []
	var coste: Array = []
	for i in n:
		var base: int = bases[i]
		var mes: int = tramo_de(float(base) + OFF_NAT, L, pais)
		var ws: Array[int] = []
		var cs: Array[float] = []
		for d in VENTANA_RADIO + 1:
			for w in ([base] if d == 0 else [base + d, base - d]):
				if w < 1 or w > L:
					continue
				var c: float = _peso_semana(ocupadas.get(w, 0)) + 0.001 * float(ws.size())
				if con_mes and tramo_de(float(w) + OFF_NAT, L, pais) != mes:


					var hacia: int = w - signi(w - base)
					var al_borde: bool = tramo_de(float(hacia) + OFF_NAT, L, pais) == mes
					c += PENA_OTRO_MES_AL_LADO if al_borde else PENA_OTRO_MES
				ws.append(w)
				cs.append(c)
		cand.append(ws)
		coste.append(cs)





	var mejor: Array = []
	var de: Array = []
	for i in n:
		var m: Array[float] = []
		var o: Array[int] = []
		for j in (cand[i] as Array).size():
			var w: int = int(cand[i][j])
			var c: float = float(coste[i][j])
			var ant: float = 0.0
			var ant_j: int = -1
			if i > 0:
				ant = INF
				for j2 in (cand[i - 1] as Array).size():
					if int(cand[i - 1][j2]) < w and float(mejor[i - 1][j2]) < ant:
						ant = float(mejor[i - 1][j2])
						ant_j = j2
			m.append(c + ant)
			o.append(ant_j)
		mejor.append(m)
		de.append(o)
	var fin_j: int = -1
	var fin_c: float = INF
	if n > 0:
		for j in (mejor[n - 1] as Array).size():
			if float(mejor[n - 1][j]) < fin_c:
				fin_c = float(mejor[n - 1][j])
				fin_j = j
	var out: Array = []
	out.resize(n)
	if fin_j >= 0 and fin_c < INF:
		var j: int = fin_j
		for i in range(n - 1, -1, -1):
			out[i] = int(cand[i][j])
			j = int(de[i][j])
		return out


	var prev: int = 0
	for i in n:
		out[i] = maxi(bases[i], prev + 1)
		prev = int(out[i])
	return out



const VENTANA_RADIO: int = 5











const PESO_COPA: float = 1.0
const PESO_NOCHE: float = 4.0
const PENA_OTRO_MES: float = 1.5
const PENA_OTRO_MES_AL_LADO: float = 0.5



static func peso_ocupa(comp: String) -> float:
	return PESO_COPA if comp == "cup" else PESO_NOCHE



static func _peso_semana(v: Variant) -> float:
	if typeof(v) == TYPE_BOOL:
		return 1.0 if bool(v) else 0.0
	return float(v)





static func semana_nat(semana_ventana: int, paso: int = 0) -> float:
	return float(semana_ventana) + OFF_NAT + OFF_NAT_DOBLE * float(paso)





static func semana_liguilla(base: float, fe: Array) -> float:
	return base + float(fe[2])




static func mitad(league_len: int) -> float:
	return float(league_len / 2)






static func en_torneos(w: float, league_len: int, torneos: bool) -> float:
	return Continental.semana_en_calendario(w, league_len, torneos)








const MESES: Array[String] = ["ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO",
	"AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"]


















































static func mes_de(w: float, league_len: int, pais: String = "") -> int:
	if not semana_conocida(w) or league_len < 1:
		return 0
	var ini: int = int(FormatoCopa.temporada(pais)[0])
	return posmod(ini - 1 + tramo_con_verano(w, league_len, pais), 12) + 1







static func tramo_con_verano(w: float, league_len: int, pais: String = "") -> int:
	if w < 0.0 and semana_conocida(w):
		return floori((float(DIA_SEMANA_0) + 7.0 * w - 1.0) / 31.0)
	return tramo_de(w, league_len, pais)










static func tramo_de(w: float, league_len: int, pais: String = "") -> int:
	var dur: int = int(FormatoCopa.temporada(pais)[1])
	var largo: float = largo_de(league_len, pais)
	if w >= largo + 1.0:
		return mini(dur, 11)
	return clampi(floori(maxf(w, 0.0) * float(dur) / largo), 0, dur - 1)






static func largo_de(league_len: int, pais: String = "") -> float:
	var largo: float = float(maxi(league_len, 1))
	if Liguilla.aplica(pais, 1) and league_len >=(Liguilla.CLUBES_MIN - 1) * 2:
		largo += 2.0 * Liguilla.SEMANAS
	return largo











static func semana_en_su_mes(w: float, off: float, league_len: int, pais: String = "",
		tope: int = 2) -> float:
	var dur: int = int(FormatoCopa.temporada(pais)[1])
	if off < 0.0 or off >= float(dur) or league_len < 1:
		return w
	var meta: int = clampi(floori(off), 0, dur - 1)
	var dec: float = w - floor(w)
	var largo: float = largo_de(league_len, pais)
	var x: float = w
	for paso in tope + 1:
		var t: int = tramo_de(x, league_len, pais)
		if t == meta:
			return x
		x += 1.0 if t < meta else -1.0
		if x < dec or x >= largo + 1.0:
			break
	return w






static func mes_del_partido(f: Dictionary) -> int:
	var pais: String = Teams.country_of(GameState.player_team_id)
	return mes_de_fixture(f, league_len_de(pais, GameState.player_div()), pais)













static func mes_de_fixture(f: Dictionary, league_len: int, pais: String) -> int:
	var w: float = GameState.fixture_week(f)
	var comp: String = String(f.get("comp", ""))
	if w >= 0.0 and w < 1.0 and league_len >= 1:
		var previo: int = _mes_previo(f, comp, pais)
		if previo > 0:
			return previo
	if w < 0.0 or league_len < 1 or not (comp == "cwc" or comp == "nat"):
		return mes_de(w, league_len, pais)
	var fin: float = float(league_len)
	if Liguilla.aplica(pais, 1) and league_len >=(Liguilla.CLUBES_MIN - 1) * 2:
		fin += 2.0 * Liguilla.SEMANAS
	if w < fin + 1.0:
		return mes_de(w, league_len, pais)
	if String(f.get("round", "")) in JuegosOlimpicos.RONDAS:
		return 7
	return 6 if w < fin + 4.0 else 7










static func _mes_previo(f: Dictionary, comp: String, pais: String) -> int:
	var mes: float = -1.0
	if comp == SupercopaNacional.COMP:
		var sc: Dictionary = FormatoCopa.supercopa(pais)
		var k: String = "mes2" if int(f.get("leg", 0)) == 1 and sc.has("mes2") else "mes"
		mes = float(sc.get(k, -1.0))
	elif comp == "cup" or comp == CopaLiga.COMP:
		var tipo: String = FormatoCopa.LIGA if comp == CopaLiga.COMP else FormatoCopa.COPA
		for ro in FormatoCopa.rondas_reales(pais, tipo):
			if String((ro as Dictionary).get("n", "")) == String(f.get("round", "")):
				var doble: bool = int(ro.get("p", 1)) == 2 and not ro.has("g")
				mes = float(ro.get("mes2", -1.0)) if doble and int(f.get("leg", 0)) == 1 \
						else float(ro.get("mes", -1.0))
				break
	if mes < 1.0 or FormatoCopa._off(pais, mes) >= 0.0:
		return 0
	return int(floor(mes))



static func nombre_mes(m: int) -> String:
	return MESES[m - 1] if m >= 1 and m <= 12 else ""

































static func dias_de(semanas: Array, fijas: Array = []) -> Array:
	var dias: Array = []
	var desfase: int = 0
	var ultimo: int = SIN_DIA
	for i in semanas.size():
		var w: float = float(semanas[i])
		var sem: int = floori(w + 0.001)
		var frac: float = w - float(sem)
		var fila: int = 0
		var col: int = 0
		if frac < 0.01:
			col = 6
			fila = sem + desfase
			while fila * 7 + col < ultimo + 2:
				fila += 1
			desfase = fila - sem
		else:
			var d: int = maxi((sem + 1 + desfase) * 7 + columna_de(frac), ultimo + 2)
			if i + 1 < fijas.size() and bool(fijas[i + 1]) and not bool(fijas[i]):
				var w2: float = float(semanas[i + 1])
				var sem2: int = floori(w2 + 0.001)
				var frac2: float = w2 - float(sem2)

				var antes: int =(sem2 + 1 + desfase) * 7 + columna_de(frac2) - 2
				if frac2 >= 0.01 and d > antes and antes >= maxi(ultimo + 2,(sem + 1 + desfase) * 7 + 1) \
						and posmod(antes, 7) <= 4:
					d = antes
			fila = floori(float(d) / 7.0)
			col = d - fila * 7
			if col < 1:
				col = 1
			elif col > 4:
				fila += 1
				col = 1
		ultimo = fila * 7 + col
		dias.append(ultimo)
	return dias





static func columna_de(frac: float) -> int:
	if frac < 0.01:
		return 6
	if frac < 0.3:
		return 1
	if frac < 0.45:
		return 2
	if frac < 0.6:
		return 3
	return 4




static func league_len_de(pais: String, div: int) -> int:
	return _league_len(GameState.teams_in_div(pais, div).size())


static func _league_len(clubes: int) -> int:
	if clubes < 2:
		return 0
	var ids: Array = []
	for i in clubes:
		ids.append("c%d" % i)
	return Schedule.league(ids).size()






















static func ano(league_len: int, torneos: bool, copa: Array, copas: Array,
		pais: String = "") -> Array:
	var firma_copa: PackedStringArray = []
	for c in copa:
		firma_copa.append("%d:%.2f" % [int(c["r"]), float(c["week"])])
	var pais_clave: String = ""
	for comp in copas:
		if not GameState.EURO_COMPS.has(String(comp)):
			pais_clave = pais



	var t: Array = FormatoCopa.temporada(pais)
	var clave: String = "%d|%d|%s|%s|%s|%d-%d" % [league_len, int(torneos), ",".join(firma_copa),
		",".join(copas), pais_clave, int(t[0]), int(t[1])]
	if _anos.has(clave):
		return _anos[clave]
	var out: Array = []
	for r in league_len:
		out.append(_partido("league", FASE_LIGA, r, 1, semana_liga(r)))

	for c in copa:
		out.append(_partido("cup", FASE_COPA, int(c["r"]), int(c["leg"]), float(c["week"])))
	for comp in copas:
		if GameState.EURO_COMPS.has(String(comp)):
			_europea(out, String(comp), league_len, pais)
		else:
			_continental(out, String(comp), league_len, pais)
	if torneos:




		var ultima: float = float(league_len)
		for p in out:
			if not Continental.es_americana(String(p["comp"])):
				ultima = maxf(ultima, float(p["week"]))
		for fe in Liguilla.FECHAS:
			out.append(_liguilla(Liguilla.CLAUSURA, fe, ultima))


	var busy: Dictionary = {}
	for p in out:
		if String(p["comp"]) != "league":
			var k: int = int(floor(float(p["week"])))
			busy[k] = float(busy.get(k, 0.0)) + peso_ocupa(String(p["comp"]))
	var ventanas: Array = semanas_fifa(league_len, busy, pais)
	for win in ventanas.size():
		out.append(_partido("nat", FASE_FIFA, win, 1, semana_nat(int(ventanas[win]))))
	if torneos:
		for p in out:
			p["week"] = en_torneos(float(p["week"]), league_len, true)
		for fe in Liguilla.FECHAS:
			out.append(_liguilla(Liguilla.APERTURA, fe, mitad(league_len)))
	out.sort_custom(func(a, b): return float(a["week"]) < float(b["week"]))
	_anos[clave] = out
	return out









static func ano_de(pais: String, div: int) -> Array:
	return _ano_indexado(pais, div).get("ano", [])





static func _ano_indexado(pais: String, div: int) -> Dictionary:
	var clave: String = "%s|%d|%d|%s" % [pais, div, GameState.pyramid_version(),
		GameState.player_team_id]
	if _anos_de.has(clave):
		return _anos_de[clave]
	if _anos_de.size() > 256:
		_anos_de.clear()
	var partidos: Array = _arma_ano_de(pais, div)
	var semanas: Dictionary = {}
	for p in partidos:
		var semana: int = int(floorf(float(p["week"])))
		if not semanas.has(semana):
			semanas[semana] = []
		(semanas[semana] as Array).append(p)
	var entrada: Dictionary = {"ano": partidos, "semanas": semanas}
	_anos_de[clave] = entrada
	return entrada


static func _arma_ano_de(pais: String, div: int) -> Array:
	var clubes: int = GameState.teams_in_div(pais, div).size()
	var league_len: int = _league_len(clubes)
	if league_len < 1:
		return []
	var torneos: bool = Liguilla.aplica(pais, div) and clubes >= Liguilla.CLUBES_MIN
	return ano(league_len, torneos, agenda_copa(pais, league_len), copas_de(pais, div), pais)







static func agenda_copa(pais: String, league_len: int) -> Array:
	if not FormatoCopa.tiene(pais, FormatoCopa.COPA):
		return []
	var rondas: Array = rondas_copa(pais)
	var out: Array = []
	for s in FormatoCopa.agenda(pais, rondas, league_len):
		var ro: Dictionary = rondas[int(s["r"])]
		var doble: bool = int(ro.get("p", 1)) == 2 and not ro.has("g")
		out.append({"r": int(s["r"]), "leg": int(s["leg"]) if doble else 1, "week": float(s["week"])})
	return out





static func rondas_copa(pais: String) -> Array:
	if pais == Teams.country_of(GameState.player_team_id) and GameState.cup_state.has("fmt"):
		return GameState.cup_state["fmt"].get("rondas", [])
	return FormatoCopa.plan(pais, FormatoCopa.COPA, GameState.cup_sembrado(pais)).get("rondas", [])




static func copas_de(pais: String, div: int) -> Array:
	if div != 1:
		return []
	if Teams.is_european(pais):
		return GameState.EURO_COMPS.duplicate()
	var out: Array = []
	for c in Continental.copas_de_pais(pais):
		out.append(String(c))
	return out




static func partidos_en(w: float, pais: String, div: int) -> Array:
	return (_ano_indexado(pais, div).get("semanas", {}) as Dictionary).get(int(floorf(w)), [])



static func en_semana(w: float, partidos: Array) -> Array:
	var semana: int = int(floorf(w))
	var out: Array = []
	for p in partidos:
		if int(floorf(float(p["week"]))) == semana:
			out.append(p)
	return out













static func carga(team_id: String, w: float) -> int:
	var pais: String = Teams.country_of(team_id)
	if pais.is_empty():
		return 0
	var div: int = GameState.div_of(team_id)
	var n: int = 0
	for p in partidos_en(w, pais, div):
		var comp: String = String(p["comp"])
		match comp:
			"league":
				n += 1
			"nat":
				pass
			"cup":
				if en_copa(pais, int(p["idx"]), team_id):
					n += 1
			"liguilla":
				if en_liguilla(pais, div, int(p["torneo"]), int(p["idx"]), team_id):
					n += 1
			_:
				if en_torneo(comp, String(p["fase"]), int(p["idx"]), team_id):
					n += 1
	return mini(n, CARGA_MAX)





















static func cargas_de(pais: String, div: int, ids: Array) -> Dictionary:
	var out: Dictionary = {}
	var semanas: Dictionary = _ano_indexado(pais, div).get("semanas", {})
	var tope: int = -1
	for s in semanas:
		tope = maxi(tope, int(s))
	var base: PackedByteArray = PackedByteArray()
	base.resize(maxi(tope + 1, 0))


	var torneos: Dictionary = {}
	var extras: Array = []
	var en_alguno: Dictionary = {}
	for s in semanas:
		var semana: int = int(s)


		if semana < 0:
			continue
		for p in (semanas[s] as Array):
			var comp: String = String(p["comp"])
			var fase: String = String(p["fase"])
			if comp == "league":
				base[semana] += 1
				continue
			if comp == "nat" or comp == "liguilla":
				continue


			var clave: String = comp
			if comp == "cup":
				clave = _clave_copa(pais)
				fase = FASE_COPA
			if not torneos.has(clave):
				var t: Dictionary = _torneo(clave)
				torneos[clave] = t
				for k in _todos_de(t):
					en_alguno[k] = true
			extras.append([semana, clave, fase, int(p["idx"])])
	for id in ids:
		var c: PackedByteArray = base.duplicate()
		if en_alguno.has(id):
			for e in extras:
				if _esta(torneos[e[1]], String(e[2]), int(e[3]), String(id)):
					c[int(e[0])] += 1
			for w in c.size():
				c[w] = mini(int(c[w]), CARGA_MAX)
		out[String(id)] = c
	return out




static func carga_en(tabla: PackedByteArray, w: int) -> int:
	return int(tabla[w]) if w >= 0 and w < tabla.size() else 0




static func _todos_de(t: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for lista in ["campo", "previa", "preliminar", "vivos"]:
		for k in (t.get(lista, {}) as Dictionary):
			out[k] = true
	for r in (t.get("rondas", []) as Array):
		for k in (r as Dictionary):
			out[k] = true
	return out







static func en_torneo(comp: String, fase: String, idx: int, team_id: String) -> bool:
	return _esta(_torneo(comp), fase, idx, team_id)






static func en_liguilla(pais: String, div: int, torneo: int, ko_idx: int, team_id: String) -> bool:
	return _esta(_torneo("liguilla|%s|%d|%d" % [pais, div, torneo]), FASE_LIGUILLA, ko_idx, team_id)






static func en_copa(pais: String, idx: int, team_id: String) -> bool:
	return _esta(_torneo(_clave_copa(pais)), FASE_COPA, idx, team_id)


static func _clave_copa(pais: String) -> String:
	return "cup" if pais == Teams.country_of(GameState.player_team_id) else "copa|%s" % pais


static func _esta(t: Dictionary, fase: String, idx: int, team_id: String) -> bool:
	if t.is_empty():
		return false
	match fase:
		FASE_GRUPO, FASE_LIGA:
			return (t["campo"] as Dictionary).has(team_id)
		FASE_PREVIA:
			return (t["previa"] as Dictionary).has(team_id)
		FASE_PRELIMINAR:
			return (t["preliminar"] as Dictionary).has(team_id)
		FASE_COPA, FASE_KO, FASE_LIGUILLA:
			var rondas: Array = t["rondas"]
			if idx >= 0 and idx < rondas.size():
				return (rondas[idx] as Dictionary).has(team_id)
			return (t["vivos"] as Dictionary).has(team_id)
	return false





static func _torneo(clave: String) -> Dictionary:
	var firma: String = "%d|%d|%d|%d|%s|%d" % [GameState.season_num, WorldAging.world_seed(),
		Squad.cache_version(), GameState.pyramid_version(), GameState.player_team_id,
		GameState.season_day]
	if firma != _torneos_clave:
		_torneos = {}
		_torneos_clave = firma
	if _torneos.has(clave):
		return _torneos[clave]
	var t: Dictionary = {}
	if clave == "cup":


		if GameState.cup_state.has("fmt"):
			t = _participantes_copa(FormatoCopa.quien_juega(GameState.cup_state["fmt"]))
		else:
			t = _participantes(GameState.cup_state, "cup")
	elif clave.begins_with("copa|"):
		t = _participantes_copa(CopaMundo.cuadro(clave.substr(5)))
	elif clave.begins_with("liguilla|"):
		var tr: PackedStringArray = clave.split("|")
		t = _liguilla_de(String(tr[1]), int(tr[2]), int(tr[3]), clave)
	elif GameState.EURO_COMPS.has(clave) or Continental.es_americana(clave):
		var st: Dictionary = GameState.euro_state(clave)


		if st.is_empty() or (not bool(st.get("playing", false))
				and (st.get("groups", []) as Array).is_empty()):
			st = _proyeccion(clave)
		t = _participantes(st, clave)
	_torneos[clave] = t
	return t





static func _proyeccion(comp: String) -> Dictionary:
	if Continental.es_americana(comp):
		return GameState.amer_proyectado(comp, GameState.season_num, 1.0)
	var campo: Array = []
	match comp:
		"ucl": campo = GameState.ucl_field(GameState.UCL_FIELD)
		"eul": campo = GameState.eul_field(GameState.EUL_FIELD)
		"conf": campo = GameState.conf_field(GameState.CONF_FIELD)
	if campo.is_empty():
		return {}
	var clave: String = "%s|%d|%d|%d|%d" % [comp, GameState.season_num, WorldAging.world_seed(),
		Squad.cache_version(), hash(campo)]
	if _proyecciones.has(clave):
		return _proyecciones[clave]
	if _proyecciones.size() > 12:
		_proyecciones.clear()
	var st: Dictionary = EuroSim.simulate(comp, campo, GameState.season_num, 1.0)
	_proyecciones[clave] = st
	return st






static func _liguilla_de(pais: String, div: int, torneo: int, clave: String) -> Dictionary:
	var st: Dictionary = {}
	if pais == Teams.country_of(GameState.player_team_id) and div == GameState.player_div():
		var mia: Dictionary = GameState.liguilla_state
		if bool(mia.get("seeded", false)) \
				and int(mia.get("torneo", Liguilla.CLAUSURA)) == torneo:
			st = mia
	else:
		if _liguillas_en_curso.has(clave):
			return {}
		_liguillas_en_curso[clave] = true
		st = SimLeague.liguilla(pais, div, GameState.season_num, [], torneo)
		_liguillas_en_curso.erase(clave)
	if st.is_empty():
		return {}
	var orden: Array = st.get("orden", [])
	return _participantes({"field0": orden, "seeds": orden.slice(0, 6),
		"bracket": st.get("bracket", [])}, "liguilla")









static func _participantes(st: Dictionary, comp: String) -> Dictionary:
	var campo: Dictionary = {}
	for g in (st.get("groups", []) as Array):
		for k in ((g as Dictionary).get("keys", []) as Array):
			campo[_id(String(k))] = true
	for k in (st.get("field0", []) as Array):
		campo[_id(String(k))] = true
	var americana: bool = Continental.es_americana(comp)
	var cupos: Dictionary = {}
	if americana:
		cupos = GameState.amer_cupos(Continental.confed_de(comp)).get(comp, {})
	if campo.is_empty() and americana:
		_ids_de(cupos.get("grupos", []), campo)
		_ids_de(cupos.get("cuadro", []), campo)
	var rondas: Array = []
	var en_cuadro: Dictionary = {}
	var perdedores: Dictionary = {}
	for ronda in (st.get("bracket", []) as Array):
		var r: Dictionary = {}
		for t in (ronda as Array):
			if not (t is Dictionary):
				continue
			var a: String = _id(String((t as Dictionary).get("a", "")))
			var b: String = _id(String((t as Dictionary).get("b", "")))
			for k in [a, b]:
				if not k.is_empty():
					r[k] = true
					en_cuadro[k] = true
			var w: String = _id(String((t as Dictionary).get("winner", "")))
			if not w.is_empty():
				var perdedor: String = b if w == a else a
				if not perdedor.is_empty():
					perdedores[perdedor] = true
		rondas.append(r)
	var vivos: Dictionary = campo.duplicate()
	if not rondas.is_empty():
		vivos = en_cuadro
		for k in (st.get("seeds", []) as Array):
			vivos[_id(String(k))] = true
		for k in perdedores:
			vivos.erase(k)
	var previa: Dictionary = {}
	_ids_de(st.get("previa", null), previa)
	if previa.is_empty():
		_ids_de(cupos.get("previa", []), previa)
	var preliminar: Dictionary = {}
	_ids_de(st.get("preliminar", null), preliminar)
	if preliminar.is_empty():
		_ids_de(cupos.get("preliminar", {}), preliminar)
	return {"campo": campo, "rondas": rondas, "vivos": vivos, "previa": previa,
		"preliminar": preliminar}





static func _participantes_copa(q: Dictionary) -> Dictionary:
	if q.is_empty():
		return {}
	var campo: Dictionary = {}
	for k in (q.get("field0", []) as Array):
		campo[String(k)] = true
	var rondas: Array = []
	for r in (q.get("rondas", []) as Array):
		var d: Dictionary = {}
		for k in (r as Array):
			d[String(k)] = true
		rondas.append(d)
	var vivos: Dictionary = campo.duplicate()
	for k in (q.get("fuera", []) as Array):
		vivos.erase(String(k))
	return {"campo": campo, "rondas": rondas, "vivos": vivos, "previa": {}, "preliminar": {}}





static func _ids_de(v: Variant, out: Dictionary) -> void:
	if v is String:
		var id: String = _id(String(v))
		if not id.is_empty():
			out[id] = true
	elif v is Array:
		for e in (v as Array):
			_ids_de(e, out)
	elif v is Dictionary:
		var d: Dictionary = v
		if d.has("a") and d.has("b"):
			_ids_de(d["a"], out)
			_ids_de(d["b"], out)
		else:
			for k in d:
				_ids_de(d[k], out)


static func _id(key: String) -> String:
	return GameState.player_team_id if key == GameState.YOU_KEY else key









static func _europea(out: Array, comp: String, league_len: int, pais: String = "") -> void:
	var jornadas: int = int(GameState.EURO_MATCHDAYS.get(comp, GameState.EURO_MATCHDAYS_DEFAULT))
	for r in jornadas:
		out.append(_partido(comp, FASE_GRUPO, r, 1, semana_euro_liga(r, league_len, comp, pais)))
	for i in GameState.UCL_KO_NAMES.size():
		if euro_ko_dos_partidos(i):
			out.append(_partido(comp, FASE_KO, i, 0, semana_euro_ko(i, 0, league_len, comp, pais)))
		out.append(_partido(comp, FASE_KO, i, 1, semana_euro_ko(i, 1, league_len, comp, pais)))








static func _continental(out: Array, comp: String, league_len: int, pais: String = "") -> void:
	if comp == "lib":
		for leg in 2:
			out.append(_partido(comp, FASE_PREVIA, -1, leg,
				Continental.semana_previa(leg, league_len, pais)))
	if comp == "sud":
		out.append(_partido(comp, FASE_PRELIMINAR, -1, 1,
			Continental.semana_preliminar(league_len, pais)))
	if not Continental.CUADRO_COMPS.has(comp):
		var gf: Dictionary = Continental.grupos_de(comp)
		var n: int = Continental.GRUPO_SPOT_IDX.size() if gf.is_empty() \
				else (int(gf.get("tam", EuroSim.GROUP_SIZE)) - 1) * int(gf.get("vueltas", 2))
		for r in n:
			out.append(_partido(comp, FASE_GRUPO, r, 1,
				Continental.semana_grupo(comp, r, league_len, pais)))
	var names: Array[String] = Continental.ko_names(comp)
	for i in names.size():
		if Continental.ko_dos_partidos(comp, i):
			out.append(_partido(comp, FASE_KO, i, 0,
				Continental.semana_ko(comp, i, 0, league_len, pais)))
		out.append(_partido(comp, FASE_KO, i, 1,
			Continental.semana_ko(comp, i, 1, league_len, pais)))


static func _liguilla(torneo: int, fe: Array, base: float) -> Dictionary:
	var p: Dictionary = _partido("liguilla", FASE_LIGUILLA, int(fe[0]), int(fe[1]),
		semana_liguilla(base, fe))
	p["torneo"] = torneo
	return p


static func _partido(comp: String, fase: String, idx: int, leg: int, week: float) -> Dictionary:
	return {"comp": comp, "fase": fase, "idx": idx, "leg": leg, "week": week}
