extends Node

func _ready():
	var sim_scene = load("res://ui/sim_screen.tscn")
	var rma = Teams.by_id("rma")
	var bar = Teams.by_id("bar")
	
	var sim = sim_scene.instantiate()
	add_child(sim)
	
	print("--- APOS INSTANCIAR ---")
	print("_you_name font_color: ", sim._you_name.get_theme_color("font_color") if sim._you_name.has_theme_color_override("font_color") else "default")
	print("_you_sub font_color: ", sim._you_sub.get_theme_color("font_color") if sim._you_sub.has_theme_color_override("font_color") else "default")
	
	print("\n--- CHAMANDO BEGIN(RMA, BAR, 1) ---")
	sim.begin(rma, bar, 1)
	print("_you_name text: ", sim._you_name.text)
	print("_you_name font_color: ", sim._you_name.get_theme_color("font_color") if sim._you_name.has_theme_color_override("font_color") else "default")
	print("_you_name outline_size: ", sim._you_name.get_theme_constant("outline_size") if sim._you_name.has_theme_constant_override("outline_size") else "default")
	print("_you_name outline_color: ", sim._you_name.get_theme_color("font_outline_color") if sim._you_name.has_theme_color_override("font_outline_color") else "default")
	
	print("_you_sub text: ", sim._you_sub.text)
	print("_you_sub font_color: ", sim._you_sub.get_theme_color("font_color") if sim._you_sub.has_theme_color_override("font_color") else "default")
	print("_you_sub outline_size: ", sim._you_sub.get_theme_constant("outline_size") if sim._you_sub.has_theme_constant_override("outline_size") else "default")
	print("_you_sub outline_color: ", sim._you_sub.get_theme_color("font_outline_color") if sim._you_sub.has_theme_color_override("font_outline_color") else "default")

	print("\n--- CHAMANDO AGORA _update_team_color_header() ---")
	sim._update_team_color_header()
	print("_you_name font_color: ", sim._you_name.get_theme_color("font_color") if sim._you_name.has_theme_color_override("font_color") else "default")
	print("_you_sub font_color: ", sim._you_sub.get_theme_color("font_color") if sim._you_sub.has_theme_color_override("font_color") else "default")
	print("_you_sub outline_size: ", sim._you_sub.get_theme_constant("outline_size") if sim._you_sub.has_theme_constant_override("outline_size") else "default")

	get_tree().quit(0)
