extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	return





func _on_texture_button_pressed() -> void:
	animation_player.play("outro")

func transition():
	LoadManager.load_scene("res://scenes/menu/game_intro.tscn")
