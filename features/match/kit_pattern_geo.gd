class_name KitPatternGeo
extends RefCounted






















const COMBOS: Dictionary = {

	"stripes_yoke": ["yoke", "stripes", true],

	"hoops_sash": ["sash", "hoops", true],



	"half_stripes": ["half", "stripes", false],

	"band_h_stripes": ["band_h", "stripes", true],

	"quarters_pin": ["quarters", "pinstripes", true],


	"rombos_half": ["half", "rombos", false],

	"escamas_half": ["half", "escamas", false],

	"speckle_half": ["half", "speckle", false],


	"hoops_yoke": ["yoke", "hoops", true],

	"pin_yoke": ["yoke", "pinstripes", true],

	"hoops_half": ["half", "hoops", false],

	"checkers_half": ["half", "checkers", false],

	"trenza_half": ["half", "trenza", false],

	"waves_half": ["half", "waves", false],

	"stripes_sash": ["sash", "stripes", true],

	"pin_sash_r": ["sash_r", "pinstripes", true],

	"stripes_chevron": ["chevron", "stripes", true],

	"quarters_hoops": ["quarters", "hoops", true],

	"stripes_diagonal": ["diagonal", "stripes", true],


	"arrows_yoke": ["yoke", "arrows", true],

	"rayas_desig_yoke": ["yoke", "rayas_desig", true],

	"aros_desig_half": ["half", "aros_desig", false],







	"gradient_yoke": ["yoke", "gradient", true],

	"gradient_half": ["half", "gradient", false],

	"gradient_sash": ["sash", "gradient", true],

	"gradient_h_half": ["half", "gradient_h", false],







	"gradient_cintura": ["cintura", "gradient", true],

	"gradient_galon_doble": ["galon_doble", "gradient", true],

	"gradient_aspa": ["aspa", "gradient", true],



	"gradient_half_h": ["half_h", "gradient", false],
	"stripes_half_h": ["half_h", "stripes", false],
	"aros_fino_half_h": ["half_h", "aros_fino", false],

	"aros_fino_yoke": ["yoke", "aros_fino", true],
	"rayas_diag_yoke": ["yoke", "rayas_diag", true],

	"gradient_diag_half": ["half", "gradient_diag", false],
	"gradient_diag_yoke": ["yoke", "gradient_diag", true],



	"waves_v_yoke": ["yoke", "waves_v", true],
	"lineas_pares_yoke": ["yoke", "lineas_pares", true],
	"espiga_fina_yoke": ["yoke", "espiga_fina", true],
	"lluvia_half": ["half", "lluvia", false],
	"zigzag_half": ["half", "zigzag", false],
	"rejilla_diag_half": ["half", "rejilla_diag", false],
	"punteado_sash": ["sash", "punteado", true],
	"contornos_cintura": ["cintura", "contornos", true],






	"waves_fino_half_h": ["half_h", "waves_fino", false],
}















static func franjas_2d(familia: String, w: float, h: float) -> Array[PackedVector2Array]:
	var out: Array[PackedVector2Array] = []
	match familia:
		"v":
			var paso: float = maxf(w * 0.054, 12.0)
			var x: float = 0.0
			while x < w:
				out.append(_caja(x, 0.0, paso * 0.5, h))
				x += paso
		"h":
			var pasoh: float = maxf(h * 0.124, 10.0)
			var y: float = 0.0
			while y < h:
				out.append(_caja(0.0, y, w, pasoh * 0.5))
				y += pasoh
		"half":

			out.append(_caja(0.0, 0.0, w * 0.25, h))
			out.append(_caja(w * 0.5, 0.0, w * 0.25, h))
		"sash":
			var ancho: float = maxf(h * 0.2, 14.0)
			out.append(PackedVector2Array([
				Vector2(- h, h), Vector2(- h + ancho, h),
				Vector2(w + ancho, -20.0), Vector2(w, -20.0)]))
		"hombros":
			out.append(_caja(0.0, 0.0, w, h * 0.26))
		"banda":
			var b: float = maxf(w * 0.085, 16.0)
			out.append(_caja(w * 0.5 - b, 0.0, b * 2.0, h))
	return out


static func _caja(x: float, y: float, w: float, h: float) -> PackedVector2Array:
	return PackedVector2Array([
		Vector2(x, y), Vector2(x + w, y), Vector2(x + w, y + h), Vector2(x, y + h)])






static func pixel(pattern: String, x: int, y: int, bb: Rect2i,
		a: Color, b: Color, pat_w: int = 3, brazo: int = -1) -> Color:
	var rel: float = float(x - bb.position.x) / maxf(float(bb.size.x), 1.0)

	var rel_y: float = float(y - bb.position.y) / maxf(bb.size.y * 0.62, 1.0)














	if pattern.begins_with("grad_") or pattern.begins_with("gradh_"):
		var horiz: bool = pattern.begins_with("gradh_")
		var trama: String = pattern.substr(6 if horiz else 5)
		var rampa: float = clampf(rel, 0.0, 1.0) if horiz \
				else clampf((rel_y - 0.48) / 0.52, 0.0, 1.0)
		return pixel(trama, x, y, bb, a, b, pat_w, brazo).lerp(a, rampa)
	if COMBOS.has(pattern):




		var cmb: Array = COMBOS[pattern]
		var dentro: bool = pixel(String(cmb[0]), x, y, bb, Color.BLACK, Color.WHITE,
			pat_w, brazo).r > 0.5
		if bool(cmb[2]):
			return b if dentro else pixel(String(cmb[1]), x, y, bb, a, b, pat_w, brazo)
		return pixel(String(cmb[1]), x, y, bb, a, b, pat_w, brazo) if dentro else a
	match pattern:
		"stripes":


			return a if (x - bb.position.x) / maxi(pat_w, 1) % 2 == 0 else b
		"hoops":
			return a if (y - bb.position.y) / maxi(pat_w, 1) % 2 == 0 else b
		"half":
			return a if rel < 0.5 else b
		"sleeves":





			if brazo >= 0:
				return b if brazo == 1 else a
			return b if rel < 0.24 or rel > 0.76 else a
		"pinstripes":
			return b if (x - bb.position.x) % 4 == 0 else a
		"sash":
			return b if absf(rel - rel_y) < 0.14 else a
		"diagonal":
			return a if rel + rel_y < 1.0 else b
		"checkers":
			return a if ((x - bb.position.x) / 3 +(y - bb.position.y) / 3) % 2 == 0 else b
		"band_v":

			return b if absf(rel - 0.5) < 0.17 else a
		"band_h":


			return b if rel_y >= 0.6 and rel_y <= 0.78 else a
		"quarters":


			return a if (rel < 0.5) ==(rel_y < 0.74) else b
		"chevron":


			return b if absf(rel_y -(0.58 + absf(rel - 0.5) * 0.45)) < 0.09 else a
		"gradient":


			return a.lerp(b, clampf((rel_y - 0.48) / 0.52, 0.0, 1.0))
		"gradient_h":

			return a.lerp(b, rel)
		"diag_thin":


			return b if ((x - bb.position.x) +(y - bb.position.y)) % 7 < 2 else a
		"yoke":


			return b if rel_y < 0.58 else a
		"sash_r":



			return b if absf((1.0 - rel) - rel_y) < 0.14 else a
		"flank":


			return b if absf(rel - 0.5) > 0.26 and absf(rel - 0.5) < 0.4 else a
		"arrows":


			return b if int((rel_y * 26.0) + absf(rel - 0.5) * 14.0) % 5 < 2 else a
		"waves":


			return b if int(rel_y * 22.0 + sin(rel * TAU) * 1.6) % 2 == 0 else a


		"speckle":



			var h: int =((x - bb.position.x) * 73 +(y - bb.position.y) * 151) % 17
			return a.lerp(b, 0.55) if h < 5 else a
		"rombos":




			var fx: float = rel * 4.0
			fx -= floor(fx)
			var fy: float = rel_y * 3.2
			fy -= floor(fy)
			return b if absf(fx - 0.5) + absf(fy - 0.5) < 0.42 else a
		"chevron_up":


			return b if absf(rel_y -(0.86 - absf(rel - 0.5) * 0.45)) < 0.09 else a
		"escamas":


			var col: int = int(rel * 6.0)
			var ey: float = rel_y * 7.0 +(0.5 if col % 2 == 1 else 0.0)
			ey -= floor(ey)
			var ex: float = rel * 6.0
			ex -= floor(ex)
			return b if (ex - 0.5) *(ex - 0.5) +(ey * 0.7) *(ey * 0.7) < 0.16 else a
		"trenza":


			var band: int = int(rel * 5.0)
			var d: int =(x - bb.position.x) +(y - bb.position.y) *(1 if band % 2 == 0 else -1)
			return b if posmod(d, 6) < 2 else a
		"raglan":





			var syn: float = clampf((rel_y - 0.48) / 0.52, 0.0, 1.0)



			if syn > 0.74:
				return a



			var off: float = 0.1 + 0.2 * sqrt(syn)
			var m: float = absf(rel - 0.5)
			if absf(m - off) < 0.017 or absf(m -(off - 0.085)) < 0.015:
				return b
			return a
		"rayas_desig":



			return b if (x - bb.position.x) % 6 >= 4 else a
		"aros_desig":

			return b if (y - bb.position.y) % 6 >= 4 else a
		"rayas_duo":


			var pv: int =(x - bb.position.x) % 11
			return b if pv == 4 or pv >= 8 else a
		"gradient_stripes":




			if (x - bb.position.x) / maxi(pat_w, 1) % 2 == 0:
				return a
			return b.lerp(a, clampf((rel_y - 0.48) / 0.52, 0.0, 1.0))
		"gradient_hoops":



			if (y - bb.position.y) / maxi(pat_w, 1) % 2 == 0:
				return a
			return b.lerp(a, clampf((rel_y - 0.48) / 0.52, 0.0, 1.0))
		"gradient_h_hoops":


			if (y - bb.position.y) / maxi(pat_w, 1) % 2 == 0:
				return a
			return b.lerp(a, clampf(rel, 0.0, 1.0))
		"gradient_waves":


			if int(rel_y * 22.0 + sin(rel * TAU) * 1.6) % 2 == 0:
				return a
			return b.lerp(a, clampf((rel_y - 0.48) / 0.52, 0.0, 1.0))
		"gradient_pin":

			if (x - bb.position.x) % 4 != 0:
				return a
			return b.lerp(a, clampf((rel_y - 0.48) / 0.52, 0.0, 1.0))
		"gradient_checkers":


			if ((x - bb.position.x) / 3 +(y - bb.position.y) / 3) % 2 == 0:
				return a
			return b.lerp(a, clampf((rel_y - 0.48) / 0.52, 0.0, 1.0))
		"aros_duo":

			var ph: int =(y - bb.position.y) % 11
			return b if ph == 4 or ph >= 8 else a














		"aspa":
















			var sx: float = clampf((rel_y - 0.48) / 0.52, 0.0, 1.0)
			return b if absf(rel - sx) < 0.1 \
					or absf((1.0 - rel) - sx) < 0.1 else a
		"half_h":




			return a if rel_y < 0.74 else b
		"aros_fino":



			return b if (y - bb.position.y) % 4 == 0 else a
		"rayas_diag":



			return b if ((x - bb.position.x) +(y - bb.position.y)) % 8 < 4 else a






		"galon_doble":








			var cv: float = 0.56 + absf(rel - 0.5) * 0.8
			return b if absf(rel_y - cv) < 0.05 \
					or absf(rel_y -(cv + 0.16)) < 0.05 else a
		"cintura":




			return b if rel_y >= 0.86 else a















		"waves_fino":


			var wf: int = int(float(y - bb.position.y) + sin(rel * TAU) * 1.6)
			return b if posmod(wf, 3) == 0 else a
		"waves_v":



			var wv: int = int(float(x - bb.position.x) + sin(rel_y * TAU * 1.6) * 1.8)
			return b if posmod(wv, 4) == 0 else a
		"zigzag":



			var zz: float = absf(fposmod(rel * 3.0, 1.0) - 0.5) * 4.0
			var zi: int = int(float(y - bb.position.y) + zz)
			return b if posmod(zi, 4) == 0 else a
		"lineas_pares":



			var lp: int =(x - bb.position.x) % 7
			return b if lp == 0 or lp == 2 else a
		"aros_pares":

			var ap: int =(y - bb.position.y) % 6
			return b if ap == 0 or ap == 2 else a
		"rejilla_diag":



			var d1: int = posmod((x - bb.position.x) +(y - bb.position.y), 5)
			var d2: int = posmod((x - bb.position.x) -(y - bb.position.y), 5)
			return b if d1 == 0 or d2 == 0 else a
		"punteado":



			if (y - bb.position.y) % 3 != 0:
				return a
			return b if ((x - bb.position.x) +(y - bb.position.y) * 2) % 4 < 2 else a
		"contornos":



			var cn: int = int(float(y - bb.position.y) + sin(rel * TAU * 1.5) * 2.4 \
					+ cos(rel * TAU * 0.7) * 1.4)
			return b if posmod(cn, 4) == 0 else a
		"lluvia":


			return b if posmod((x - bb.position.x) +(y - bb.position.y), 4) == 0 else a
		"espiga_fina":


			var bf: int = int(rel * 7.0)
			var df: int =(x - bb.position.x) \
					+(y - bb.position.y) *(1 if bf % 2 == 0 else -1)
			return b if posmod(df, 4) == 0 else a
		"gradient_diag":



			var gd: float =(rel + clampf((rel_y - 0.48) / 0.52, 0.0, 1.0)) * 0.5
			return a.lerp(b, clampf(gd, 0.0, 1.0))
	return a











static func trim_hit(trim: String, x: int, y: int, bb: Rect2i) -> bool:
	var rel: float = clampf(float(x - bb.position.x) / maxf(float(bb.size.x), 1.0),
		0.0, 1.0)
	var sy: float = clampf(float(y - bb.position.y) / maxf(float(bb.size.y), 1.0),
		0.0, 1.0)
	match trim:
		"collar":

			return sy < 0.09
		"cuff":


			return (rel < 0.12 or rel > 0.88) and sy > 0.14 and sy < 0.4
		"vneck":

			return sy < 0.3 and absf(absf(rel - 0.5) - sy * 0.45) < 0.045
		"hem":

			return sy > 0.91
		"shoulder":


			return sy < 0.07 and (rel < 0.3 or rel > 0.7)
		"piping":

			return absf(rel - 0.5) > 0.3 and absf(rel - 0.5) < 0.345 and sy > 0.1


	return false
