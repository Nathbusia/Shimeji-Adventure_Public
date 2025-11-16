extends Node2D


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("dialogic_default_action"):
		LoadManager.load_scene("res://scenes/menu/title_screen.tscn")

func gameintroend():
	LoadManager.load_scene("res://scenes/menu/title_screen.tscn")

func controlthing():
	match LanguageManager.language:
		"english":
			$AnimatedSprite2D.play("control_eng")
		"spanish":
			$AnimatedSprite2D.play("control_spa")
		"french":
			$AnimatedSprite2D.play("control_fre")
		"italian":
			$AnimatedSprite2D.play("control_ita")
		"german":
			$AnimatedSprite2D.play("control_ger")
		"japanese":
			$AnimatedSprite2D.play("control_jpn")
