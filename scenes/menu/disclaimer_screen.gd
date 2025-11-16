extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var disclaim_image: TextureRect = $DisclaimImage

var has_pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match LanguageManager.language:
		"english":
			disclaim_image.texture = load("res://sprites/menu/disclaimer/DisclaimerScreen.png")
			$UnderstandButton/TextureButton.show()
		"spanish":
			disclaim_image.texture = load("res://sprites/menu/disclaimer/DisclaimerScreen_SPA.png")
			$UnderstandButton/TextureButton_SPA.show()
		"french":
			disclaim_image.texture = load("res://sprites/menu/disclaimer/DisclaimerScreen_FRE.png")
			$UnderstandButton/TextureButton_FRE.show()
		"italian":
			disclaim_image.texture = load("res://sprites/menu/disclaimer/DisclaimerScreen_ITA.png")
			$UnderstandButton/TextureButton_ITA.show()
		"german":
			disclaim_image.texture = load("res://sprites/menu/disclaimer/DisclaimerScreen_GER.png")
			$UnderstandButton/TextureButton_GER.show()
		"japanese":
			disclaim_image.texture = load("res://sprites/menu/disclaimer/DisclaimerScreen_JPN.png")
			$UnderstandButton/TextureButton_JPN.show()


func _on_texture_button_pressed() -> void:
	if has_pressed:
		return
	else:
		animation_player.play("outro")
		has_pressed = true

func transition():
	LoadManager.load_scene("res://scenes/menu/game_intro.tscn")
