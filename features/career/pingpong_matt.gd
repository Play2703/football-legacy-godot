extends Node3D




const RinconLib := preload("res://ui/house/rincon.gd")
const POSTURA := preload("res://assets/sprites/anim/puno_south_03.png")


const MANO_PX := Vector2(42.5, 52.5)
const MANGO := Vector3(0, - 0.2, 0)
const ASPECTO: Dictionary = {
	"skin": Color("a9653b"), "hair": Color("242323"), "brows": Color("242323"),
	"eyes": Color("42332b"), "modular_hair": "none", "modular_brows": "inclinadas",
	"modular_beard": "p_candado_marcado", "casual_shirt": Color("ec802b"),
	"casual_pants": Color("414e54"), "casual_shoes_color": Color("292929"),
	"casual_top": "playera", "casual_outer": "none", "casual_pants_style": "recto",
	"casual_print": "solid", "casual_sleeves": "corta", "casual_pants_len": "largo",
}
var sprite: AnimatedSprite3D
var nombre: PlacaNombre


func _ready() -> void:
	name = "Matt"
	sprite = RinconLib.jugador("south", ASPECTO)
	sprite.name = "SpriteMatt"


	sprite.sprite_frames.clear("idle")
	sprite.sprite_frames.add_frame("idle", KitRecolor.apply(POSTURA, KitRecolor.casual_of(ASPECTO)))
	sprite.stop()
	sprite.position.y = RinconLib.altura_pies(sprite.pixel_size)
	add_child(sprite)


	nombre = PlacaNombre.cuelga(sprite, "MATT", true, true)
	actualizar(0, false, false, 0)


func actualizar(pala: float, _prepara: bool, _jugando: bool, _dt: float) -> void:
	position = Vector3(- pala - 0.18, 0, 1.45)


func _mano_desde_pies(camara: Camera3D) -> Vector3:


	var derecha: Vector3 = camara.global_basis.x
	derecha.y = 0
	derecha = derecha.normalized()
	var tex: Texture2D = sprite.sprite_frames.get_frame_texture("idle", 0)
	var ancho: float =(MANO_PX.x - tex.get_width() * 0.5) * sprite.pixel_size * global_basis.x.length()
	var alto: float = sprite.position.y +(tex.get_height() * 0.5 - MANO_PX.y) * sprite.pixel_size
	return derecha * ancho + Vector3.UP * alto


func mano_global(camara: Camera3D) -> Vector3:
	return global_position + _mano_desde_pies(camara)


func sujetar_pala(pala: Node3D, camara: Camera3D) -> void:



	var mano: Vector3 = _mano_desde_pies(camara)
	var mango: Vector3 = pala.global_basis * MANGO
	var centro: Vector3 = pala.global_position
	centro.y = global_position.y + mano.y - mango.y
	pala.global_position = centro
	global_position = pala.to_global(MANGO) - mano
