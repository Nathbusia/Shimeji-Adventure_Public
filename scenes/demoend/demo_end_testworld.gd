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
	
	match LanguageManager.language:
		"spanish":
			$Text.texture = load("res://sprites/demoend/demoend_testworld_text_spa.png")
			$Continue_Button.texture_normal.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_spa0001.png"))
			$Continue_Button.texture_normal.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_spa0002.png"))
			$Continue_Button.texture_normal.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_spa0003.png"))
			$Continue_Button.texture_hover.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_spa0004.png"))
			$Continue_Button.texture_hover.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_spa0005.png"))
			$Continue_Button.texture_hover.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_spa0006.png"))
			$Continue_Button.texture_pressed.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_spa0007.png"))
			$Continue_Button.texture_pressed.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_spa0008.png"))
			$Continue_Button.texture_pressed.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_spa0009.png"))
		"french":
			$Text.texture = load("res://sprites/demoend/demoend_testworld_text_fre.png")
			$Continue_Button.texture_normal.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_fre0001.png"))
			$Continue_Button.texture_normal.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_fre0002.png"))
			$Continue_Button.texture_normal.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_fre0003.png"))
			$Continue_Button.texture_hover.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_fre0004.png"))
			$Continue_Button.texture_hover.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_fre0005.png"))
			$Continue_Button.texture_hover.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_fre0006.png"))
			$Continue_Button.texture_pressed.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_fre0007.png"))
			$Continue_Button.texture_pressed.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_fre0008.png"))
			$Continue_Button.texture_pressed.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_fre0009.png"))
		"italian":
			$Text.texture = load("res://sprites/demoend/demoend_testworld_text_ita.png")
			$Continue_Button.texture_normal.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_ita0001.png"))
			$Continue_Button.texture_normal.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_ita0002.png"))
			$Continue_Button.texture_normal.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_ita0003.png"))
			$Continue_Button.texture_hover.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_ita0004.png"))
			$Continue_Button.texture_hover.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_ita0005.png"))
			$Continue_Button.texture_hover.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_ita0006.png"))
			$Continue_Button.texture_pressed.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_ita0007.png"))
			$Continue_Button.texture_pressed.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_ita0008.png"))
			$Continue_Button.texture_pressed.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_ita0009.png"))
		"german":
			$Text.texture = load("res://sprites/demoend/demoend_testworld_text_ger.png")
			$Continue_Button.texture_normal.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_ger0001.png"))
			$Continue_Button.texture_normal.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_ger0002.png"))
			$Continue_Button.texture_normal.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_ger0003.png"))
			$Continue_Button.texture_hover.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_ger0004.png"))
			$Continue_Button.texture_hover.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_ger0005.png"))
			$Continue_Button.texture_hover.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_ger0006.png"))
			$Continue_Button.texture_pressed.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_ger0007.png"))
			$Continue_Button.texture_pressed.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_ger0008.png"))
			$Continue_Button.texture_pressed.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_ger0009.png"))
		"japanese":
			$Text.texture = load("res://sprites/demoend/demoend_testworld_text_jpn.png")
			$Continue_Button.texture_normal.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_jpn0001.png"))
			$Continue_Button.texture_normal.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_jpn0002.png"))
			$Continue_Button.texture_normal.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_jpn0003.png"))
			$Continue_Button.texture_hover.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_jpn0004.png"))
			$Continue_Button.texture_hover.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_jpn0005.png"))
			$Continue_Button.texture_hover.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_jpn0006.png"))
			$Continue_Button.texture_pressed.set_frame_texture(0, load("res://sprites/demoend/demoend_continue_jpn0007.png"))
			$Continue_Button.texture_pressed.set_frame_texture(1, load("res://sprites/demoend/demoend_continue_jpn0008.png"))
			$Continue_Button.texture_pressed.set_frame_texture(2, load("res://sprites/demoend/demoend_continue_jpn0009.png"))
		_:
			return
			#English as usual.

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
