extends Panel

@export var characterPath: String
@export var characterTexture: CompressedTexture2D
@onready var character_select: Node2D = $"../../.."

@onready var char_select_bg: AnimatedSprite2D = $CharSelect_BG
@onready var char_select_char: TextureRect = $CharSelect_BG/CharSelect_Char
@onready var char_select_fg: TextureRect = $CharSelect_BG/CharSelect_Char/CharSelect_FG
@onready var slot_button: TextureButton = $CharSelect_BG/CharSelect_Char/CharSelect_FG/SlotButton

var icon = null:
	set(value):
		icon = value
		$TextureButton.texture_normal = value
 
signal pressed
 
func _ready():
	char_select_char.texture = characterTexture 
 
func _on_texture_button_pressed():
	pressed.emit()

func _on_slot_button_pressed() -> void:
	pass # Replace with function body.
