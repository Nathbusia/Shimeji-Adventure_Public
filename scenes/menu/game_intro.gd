extends Node2D


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("dialogic_default_action"):
		LoadManager.load_scene("res://scenes/menu/title_screen.tscn")

func gameintroend():
	LoadManager.load_scene("res://scenes/menu/title_screen.tscn")
