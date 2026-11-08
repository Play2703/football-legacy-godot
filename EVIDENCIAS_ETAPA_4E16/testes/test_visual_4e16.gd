extends Node

# Suíte de testes automatizados para ETAPA 4e.16 - Refinamento Visual e Conformidade de Conteúdo
# Validação de:
# - C09: 36 cortes de cabelo completos (KitRecolor e LookMigracion)
# - C16: Óculos escuros nas comemorações (robot, surf, pinguinazo) com GafasCeleb
# - H05: Efeito fotográfico sépia com matriz de convolução fotográfica em Keepsake

const Keepsake = preload("res://ui/ceremonies/keepsake.gd")
const GafasCeleb = preload("res://features/match/gafas_celeb.gd")
const LookMigracion = preload("res://features/match/look_migracion.gd")

var total_tests: int = 0
var passed_tests: int = 0
var failed_tests: int = 0
var results: Array[Dictionary] = []

func _ready() -> void:
	print("=================================================================")
	print("INICIANDO SUÍTE DE TESTES — ETAPA 4e.16: REFINAMENTO VISUAL")
	print("=================================================================")

	test_c09_hairstyles_count_and_definitions()
	test_c09_modular_migration_and_assets()
	test_c09_hair_rendering_and_shading()

	test_c16_sunglasses_celebrations_configuration()
	test_c16_gafas_celeb_node_lifecycle_and_billboard()
	test_c16_pinguinazo_integration()

	test_h05_sepia_shader_and_matrix()
	test_h05_sepia_image_pixel_transformation()
	test_h05_keepsake_node_integration()

	test_regression_career_and_kit_recolor()

	gera_evidencias_visuais()

	print_summary()
	get_tree().quit(0 if failed_tests == 0 else 1)

func record_result(categoria: String, nome: String, cond: bool, detalhe: String = "") -> void:
	total_tests += 1
	if cond:
		passed_tests += 1
		print("[PASS] %s: %s" % [categoria, nome])
	else:
		failed_tests += 1
		printerr("[FAIL] %s: %s -> %s" % [categoria, nome, detalhe])
	results.append({
		"categoria": categoria,
		"nome": nome,
		"sucesso": cond,
		"detalhe": detalhe
	})

# =================================================================
# C09: 36 CORTES DE CABELO COMPLETOS
# =================================================================
func test_c09_hairstyles_count_and_definitions() -> void:
	var base_count: int = KitRecolor.HAIR_STYLES.size()
	var extra_count: int = KitRecolor.EXTRA_HAIR_STYLES.size()
	var total_hair: int = base_count + extra_count

	record_result("C09 CABELOS", "Total de estilos de cabelo é exatamente 36 (4 base + 32 extra)", total_hair == 36, "esperado 36, obtido %d (base=%d, extra=%d)" % [total_hair, base_count, extra_count])
	record_result("C09 CABELOS", "4 estilos base preservados (normal, bald, buzz, mohawk)", base_count == 4 and KitRecolor.HAIR_STYLES == ["normal", "bald", "buzz", "mohawk"], "estilos base incorretos")

	var novos_estilos: Array[String] = ["afro", "trenzas", "largo", "edgar", "tupe", "hongo", "rastas"]
	for est in novos_estilos:
		var existe: bool = est in KitRecolor.EXTRA_HAIR_STYLES
		record_result("C09 CABELOS", "Novo estilo '%s' registrado em EXTRA_HAIR_STYLES" % est, existe, "estilo ausente")

func test_c09_modular_migration_and_assets() -> void:
	var todos_estilos: Array[String] = []
	for s in KitRecolor.HAIR_STYLES:
		todos_estilos.append(s)
	for s in KitRecolor.EXTRA_HAIR_STYLES:
		todos_estilos.append(s)

	record_result("C09 CABELOS", "Total unificado de estilos para migração é 36", todos_estilos.size() == 36, "tamanho: %d" % todos_estilos.size())

	var todos_mapeados: bool = true
	var ausentes_map: Array[String] = []
	for est in todos_estilos:
		if not LookMigracion.HAIR.has(est):
			todos_mapeados = false
			ausentes_map.append(est)
	record_result("C09 CABELOS", "Todos os 36 estilos possuem mapeamento em LookMigracion.HAIR", todos_mapeados, "ausentes: %s" % str(ausentes_map))

	# Validar que os arquivos de sprites modulares existem no disco
	var novos_estilos_arquivos: Dictionary = {
		"afro": "p_afro_redondo",
		"trenzas": "p_trenzas_de_caja",
		"largo": "p_melena_surfera",
		"edgar": "p_edgar",
		"tupe": "p_tupe_ladeado",
		"hongo": "p_tazon_con_rapado",
		"rastas": "p_rastas_finas"
	}
	var todos_arquivos_existem: bool = true
	for est in novos_estilos_arquivos:
		var prefix: String = novos_estilos_arquivos[est]
		var caminho: String = "res://assets/sprites/modular/propias/hair/%s_south_front.png" % prefix
		if not FileAccess.file_exists(caminho):
			todos_arquivos_existem = false
			printerr("Arquivo não encontrado: %s" % caminho)
	record_result("C09 CABELOS", "Texturas modulares dos novos 7 estilos existem em res://assets/sprites/modular/propias/hair/", todos_arquivos_existem, "arquivos de textura ausentes")

func test_c09_hair_rendering_and_shading() -> void:
	var dummy_img: Image = Image.create(92, 92, false, Image.FORMAT_RGBA8)
	dummy_img.fill(Color(0, 0, 0, 0))

	var hair_px: Array[Vector2i] = [
		Vector2i(44, 20), Vector2i(45, 20), Vector2i(46, 20),
		Vector2i(44, 21), Vector2i(45, 21), Vector2i(46, 21),
		Vector2i(44, 22), Vector2i(45, 22), Vector2i(46, 22)
	]
	var hair_orig: Array[Color] = [
		Color.BLACK, Color.BLACK, Color.BLACK,
		Color.BLACK, Color.BLACK, Color.BLACK,
		Color.BLACK, Color.BLACK, Color.BLACK
	]
	var face_bb: Rect2i = Rect2i(40, 24, 12, 16)
	var skin_c: Color = Color(0.8, 0.6, 0.4, 1.0)

	var novos: Array[String] = ["afro", "trenzas", "largo", "edgar", "tupe", "hongo", "rastas"]
	var shading_ok: bool = true
	for st in novos:
		var img_copy: Image = Image.create(92, 92, false, Image.FORMAT_RGBA8)
		for p in hair_px:
			img_copy.set_pixel(p.x, p.y, Color.BLACK)
		var kept: Dictionary = {}
		KitRecolor._apply_hair_style(img_copy, st, hair_px, hair_orig, 0.2, 0.1, face_bb, skin_c, kept, "front")
		if img_copy.get_width() != 92 or img_copy.get_height() != 92 or kept.is_empty():
			shading_ok = false
	record_result("C09 CABELOS", "Shading e desenho procedural dos 7 novos estilos executa com sucesso em Image 92x92", shading_ok, "falha de execução no shader procedural")

# =================================================================
# C16: ÓCULOS ESCUROS NAS COMEMORAÇÕES (GafasCeleb)
# =================================================================
func test_c16_sunglasses_celebrations_configuration() -> void:
	record_result("C16 GAFAS", "Celebs.usa_gafas('robot') == true", Celebs.usa_gafas("robot") == true, "robot deve usar óculos")
	record_result("C16 GAFAS", "Celebs.usa_gafas('surf') == true", Celebs.usa_gafas("surf") == true, "surf deve usar óculos")
	record_result("C16 GAFAS", "Celebs.usa_gafas('pinguinazo') == true", Celebs.usa_gafas("pinguinazo") == true, "pinguinazo deve usar óculos")
	record_result("C16 GAFAS", "Celebs.usa_gafas('cumbia') == false", Celebs.usa_gafas("cumbia") == false, "cumbia não usa óculos")
	record_result("C16 GAFAS", "Celebs.usa_gafas('pasillo') == false", Celebs.usa_gafas("pasillo") == false, "pasillo não usa óculos")
	record_result("C16 GAFAS", "Celebs.usa_gafas('chotis') == false", Celebs.usa_gafas("chotis") == false, "chotis não usa óculos")
	record_result("C16 GAFAS", "Celebs.usa_gafas('') == false", Celebs.usa_gafas("") == false, "string vazia não usa óculos")

func test_c16_gafas_celeb_node_lifecycle_and_billboard() -> void:
	var dummy_actor: Node3D = Node3D.new()
	var actor_sprite: Sprite3D = Sprite3D.new()
	actor_sprite.name = "Sprite"
	dummy_actor.add_child(actor_sprite)

	# 1. Aplicar óculos
	var g: GafasCeleb = GafasCeleb.pon(dummy_actor)
	record_result("C16 GAFAS", "GafasCeleb.pon(actor) instancia e anexa nó", is_instance_valid(g) and g.get_parent() == dummy_actor, "nó inválido ou parent incorreto")
	record_result("C16 GAFAS", "Metadado 'gafas_celeb' configurado no ator", dummy_actor.has_meta("gafas_celeb") and dummy_actor.get_meta("gafas_celeb") == g, "metadado ausente")
	record_result("C16 GAFAS", "GafasCeleb.de(actor) retorna instância ativa", GafasCeleb.de(dummy_actor) == g, "de(actor) retornou objeto incorreto")
	record_result("C16 GAFAS", "Billboard mode habilitado como BILLBOARD_ENABLED", g.billboard == BaseMaterial3D.BILLBOARD_ENABLED, "billboard não habilitado")
	record_result("C16 GAFAS", "Textura padrão de óculos atribuída", g.texture != null, "textura nula")
	record_result("C16 GAFAS", "Render priority elevada (+5 sobre sprite do jogador)", g.render_priority == 5, "render_priority esperado 5, obtido %d" % g.render_priority)

	# 2. Idempotência de GafasCeleb.pon()
	var g2: GafasCeleb = GafasCeleb.pon(dummy_actor)
	record_result("C16 GAFAS", "GafasCeleb.pon() é idempotente no mesmo ator", g2 == g, "criou segunda instância")

	# 3. Remoção limpa com GafasCeleb.quita_de()
	GafasCeleb.quita_de(dummy_actor)
	record_result("C16 GAFAS", "GafasCeleb.quita_de() remove metadado do ator", not dummy_actor.has_meta("gafas_celeb"), "metadado ainda presente")
	record_result("C16 GAFAS", "GafasCeleb.de(actor) retorna null após quita_de", GafasCeleb.de(dummy_actor) == null, "não retornou null")

	actor_sprite.queue_free()
	dummy_actor.queue_free()

func test_c16_pinguinazo_integration() -> void:
	# Validação estática das chamadas em Celebs e Pinguinazo
	var celebb_usa: bool = Celebs.usa_gafas("pinguinazo")
	record_result("C16 GAFAS", "Pinguinazo habilitado no filtro Celebs.usa_gafas", celebb_usa, "pinguinazo não configurado")

# =================================================================
# H05: EFEITO FOTOGRÁFICO SÉPIA NAS RECORDAÇÕES (Keepsake)
# =================================================================
func test_h05_sepia_shader_and_matrix() -> void:
	var code: String = Keepsake.SEPIA_SHADER_CODE
	var has_r_row: bool = code.find("0.393") != -1 and code.find("0.769") != -1 and code.find("0.189") != -1
	var has_g_row: bool = code.find("0.349") != -1 and code.find("0.686") != -1 and code.find("0.168") != -1
	var has_b_row: bool = code.find("0.272") != -1 and code.find("0.534") != -1 and code.find("0.131") != -1

	record_result("H05 SÉPIA", "Matriz sépia linha R (0.393, 0.769, 0.189) exata no shader", has_r_row, "coeficientes R incorretos")
	record_result("H05 SÉPIA", "Matriz sépia linha G (0.349, 0.686, 0.168) exata no shader", has_g_row, "coeficientes G incorretos")
	record_result("H05 SÉPIA", "Matriz sépia linha B (0.272, 0.534, 0.131) exata no shader", has_b_row, "coeficientes B incorretos")

	var mat: ShaderMaterial = Keepsake.crea_sepia_material(1.0)
	record_result("H05 SÉPIA", "crea_sepia_material(1.0) retorna ShaderMaterial válido com shader atribuído", mat != null and mat.shader != null, "material ou shader nulo")
	var intens_val: Variant = mat.get_shader_parameter("sepia_intensity")
	record_result("H05 SÉPIA", "Uniform 'sepia_intensity' configurado com 1.0", intens_val != null and is_equal_approx(float(intens_val), 1.0), "intensity incorreto")

func test_h05_sepia_image_pixel_transformation() -> void:
	# Teste de precisão matemática da matriz sépia com imagem CPU
	var img: Image = Image.create(2, 2, false, Image.FORMAT_RGBA8)
	# Pixel 0,0: Branco puro (1, 1, 1, 1)
	img.set_pixel(0, 0, Color(1, 1, 1, 1))
	# Pixel 1,0: Vermelho puro (1, 0, 0, 1)
	img.set_pixel(1, 0, Color(1, 0, 0, 1))
	# Pixel 0,1: Verde puro (0, 1, 0, 1)
	img.set_pixel(0, 1, Color(0, 1, 0, 1))
	# Pixel 1,1: Azul puro (0, 0, 1, 1)
	img.set_pixel(1, 1, Color(0, 0, 1, 1))

	var sepia_img: Image = Keepsake.aplica_sepia_image(img, 1.0)
	record_result("H05 SÉPIA", "aplica_sepia_image retorna imagem válida com dimensões idênticas", sepia_img != null and sepia_img.get_width() == 2 and sepia_img.get_height() == 2, "dimensões alteradas")

	# Validação pixel branco (satura R e G em 1.0, B fica 0.272 + 0.534 + 0.131 = 0.937)
	var px_white: Color = sepia_img.get_pixel(0, 0)
	record_result("H05 SÉPIA", "Transformação sépia em branco: R=1.0, G=1.0, B≈0.937, A=1.0", 
		is_equal_approx(px_white.r, 1.0) and is_equal_approx(px_white.g, 1.0) and abs(px_white.b - 0.937) < 0.02 and is_equal_approx(px_white.a, 1.0),
		"obtido: %s" % str(px_white))

	# Validação pixel vermelho: R=0.393, G=0.349, B=0.272
	var px_red: Color = sepia_img.get_pixel(1, 0)
	record_result("H05 SÉPIA", "Transformação sépia em vermelho: R≈0.393, G≈0.349, B≈0.272", 
		abs(px_red.r - 0.393) < 0.02 and abs(px_red.g - 0.349) < 0.02 and abs(px_red.b - 0.272) < 0.02,
		"obtido: %s" % str(px_red))

	# Validação pixel verde: R=0.769, G=0.686, B=0.534
	var px_green: Color = sepia_img.get_pixel(0, 1)
	record_result("H05 SÉPIA", "Transformação sépia em verde: R≈0.769, G≈0.686, B≈0.534", 
		abs(px_green.r - 0.769) < 0.02 and abs(px_green.g - 0.686) < 0.02 and abs(px_green.b - 0.534) < 0.02,
		"obtido: %s" % str(px_green))

	# Validação pixel azul: R=0.189, G=0.168, B=0.131
	var px_blue: Color = sepia_img.get_pixel(1, 1)
	record_result("H05 SÉPIA", "Transformação sépia em azul: R≈0.189, G≈0.168, B≈0.131", 
		abs(px_blue.r - 0.189) < 0.02 and abs(px_blue.g - 0.168) < 0.02 and abs(px_blue.b - 0.131) < 0.02,
		"obtido: %s" % str(px_blue))

func test_h05_keepsake_node_integration() -> void:
	var item: Control = Control.new()
	var box: Control = Control.new()
	box.name = "viewport_box"
	item.add_child(box)

	Keepsake.aplica_sepia(item, 1.0)
	record_result("H05 SÉPIA", "aplica_sepia(item) atribui ShaderMaterial no viewport_box", box.material != null and box.material is ShaderMaterial, "material não atribuído")
	
	box.queue_free()
	item.queue_free()

# =================================================================
# REGRESSÃO
# =================================================================
func test_regression_career_and_kit_recolor() -> void:
	# Declínio blindado na 4e.15
	Career.age = 36
	record_result("REGRESSÃO", "Declínio físico ativo aos 36 anos (4e.15)", Career.skill_en_declive("velocidad") == true, "falha de regressão")
	record_result("REGRESSÃO", "Declínio técnico ativo aos 36 anos (4e.15)", Career.skill_en_declive("potencia") == true, "falha de regressão")
	record_result("REGRESSÃO", "Atributo de maturidade livre aos 36 anos (4e.15)", Career.skill_en_declive("vision") == false, "falha de regressão")

func gera_evidencias_visuais() -> void:
	print("--- Gerando capturas visuais da ETAPA 4e.16 ---")
	var img_orig: Image = Image.load_from_file("res://assets/branding/android/icon_192.png")
	if img_orig != null and not img_orig.is_empty():
		img_orig.convert(Image.FORMAT_RGBA8)
		var img_sepia: Image = Keepsake.aplica_sepia_image(img_orig, 1.0)
		img_sepia.convert(Image.FORMAT_RGBA8)
		var w: int = img_orig.get_width()
		var h: int = img_orig.get_height()
		var composite: Image = Image.create(w * 2 + 20, h + 40, false, Image.FORMAT_RGBA8)
		composite.fill(Color(0.12, 0.12, 0.15, 1.0))
		composite.blit_rect(img_orig, Rect2i(0, 0, w, h), Vector2i(10, 30))
		composite.blit_rect(img_sepia, Rect2i(0, 0, w, h), Vector2i(w + 15, 30))
		composite.save_png("res://EVIDENCIAS_ETAPA_4E16/capturas/h05_sepia_side_by_side.png")
		print("[OK] Gerado EVIDENCIAS_ETAPA_4E16/capturas/h05_sepia_side_by_side.png")

	var g_front: Image = Image.load_from_file("res://assets/sprites/acc/gafas.png")
	var g_east: Image = Image.load_from_file("res://assets/sprites/acc/gafas_east.png")
	var g_west: Image = Image.load_from_file("res://assets/sprites/acc/gafas_west.png")
	var comp_gafas: Image = Image.create(320, 120, false, Image.FORMAT_RGBA8)
	comp_gafas.fill(Color(0.1, 0.14, 0.18, 1.0))
	if g_front != null and not g_front.is_empty():
		g_front.convert(Image.FORMAT_RGBA8)
		comp_gafas.blit_rect(g_front, Rect2i(0, 0, g_front.get_width(), g_front.get_height()), Vector2i(10, 14))
	if g_east != null and not g_east.is_empty():
		g_east.convert(Image.FORMAT_RGBA8)
		comp_gafas.blit_rect(g_east, Rect2i(0, 0, g_east.get_width(), g_east.get_height()), Vector2i(115, 14))
	if g_west != null and not g_west.is_empty():
		g_west.convert(Image.FORMAT_RGBA8)
		comp_gafas.blit_rect(g_west, Rect2i(0, 0, g_west.get_width(), g_west.get_height()), Vector2i(220, 14))
	comp_gafas.save_png("res://EVIDENCIAS_ETAPA_4E16/capturas/c16_gafas_celeb_views.png")
	print("[OK] Gerado EVIDENCIAS_ETAPA_4E16/capturas/c16_gafas_celeb_views.png")

	var styles: Array[String] = [
		"p_afro_redondo", "p_trenzas_de_caja", "p_melena_surfera",
		"p_edgar", "p_tupe_ladeado", "p_tazon_con_rapado", "p_rastas_finas"
	]
	var comp_hair: Image = Image.create(7 * 70 + 20, 100, false, Image.FORMAT_RGBA8)
	comp_hair.fill(Color(0.15, 0.15, 0.2, 1.0))
	var x_offset: int = 10
	for st in styles:
		var path: String = "res://assets/sprites/modular/propias/hair/%s_south_front.png" % st
		if FileAccess.file_exists(path):
			var img: Image = Image.load_from_file(path)
			if img != null and not img.is_empty():
				img.convert(Image.FORMAT_RGBA8)
				comp_hair.blit_rect(img, Rect2i(0, 0, mini(img.get_width(), 64), mini(img.get_height(), 64)), Vector2i(x_offset, 18))
		x_offset += 70
	comp_hair.save_png("res://EVIDENCIAS_ETAPA_4E16/capturas/c09_novos_cabelos_modular.png")
	print("[OK] Gerado EVIDENCIAS_ETAPA_4E16/capturas/c09_novos_cabelos_modular.png")

func print_summary() -> void:
	print("=================================================================")
	print("RESUMO DOS TESTES — ETAPA 4e.16")
	print("Total de testes: %d" % total_tests)
	print("Testes APROVADOS: %d" % passed_tests)
	print("Testes REPROVADOS: %d" % failed_tests)
	var taxa: float = (float(passed_tests) / float(total_tests)) * 100.0 if total_tests > 0 else 0.0
	print("Taxa de Conformidade: %.1f%%" % taxa)
	print("=================================================================")
