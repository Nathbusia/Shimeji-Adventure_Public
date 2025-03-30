extends Node2D
@onready var continue_button: TextureButton = $Continue_Button
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var mb_slide: AnimationPlayer = $Char3/MBSlide
@onready var ms_slide: AnimationPlayer = $Char4/MSSlide

var haschoosed = false
var has_hoverplayed = false

func _ready():
	DiscordRPC.state = "Finished the Test Levels"
	DiscordRPC.details = ""
	DiscordRPC.refresh()

func _process(_delta):
	if continue_button.is_hovered() && !haschoosed:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	else:
		has_hoverplayed = false


func _on_continue_button_pressed() -> void:
	select.play()
	ModeManager.in_gameplay = false
	LoadManager.load_scene("res://scenes/menu/level_select.tscn")
	LevelsManager.is_bossbattle = false
