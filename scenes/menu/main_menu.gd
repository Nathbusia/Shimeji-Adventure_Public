extends Node2D
@onready var previews_image: AnimatedSprite2D = $MenuBG/WindowsBG/PreviewsImage
@onready var story: TextureButton = $Buttons/Story
@onready var freeplay: TextureButton = $Buttons/Freeplay
@onready var settings: TextureButton = $Buttons/Settings
@onready var quit: TextureButton = $Buttons/Quit
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover
@onready var button_anim: AnimationPlayer = $Buttons/ButtonAnim

var has_hoverplayed = false
var can_choose = true

func _ready() -> void:
	DiscordRPC.state = "In the Main Menu"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	can_choose = true
	
	match LanguageManager.language:
		"spanish":
			$Buttons/Story/Text.text = "Historia"
			$Buttons/Freeplay/Text.text = "Juego libre"
			$Buttons/Settings/Label.text = "Configuración"
			$Buttons/Quit/Text.text = "Abandonar"
		"french":
			$Buttons/Story/Text.text = "Histoire"
			$Buttons/Freeplay/Text.text = "Jeu libre"
			$Buttons/Settings/Label.text = "Paramètres"
			$Buttons/Quit/Text.text = "Quitter"
		"italian":
			$Buttons/Story/Text.text = "Storia"
			$Buttons/Freeplay/Text.text = "Gioco libero"
			$Buttons/Settings/Label.text = "Impostazioni"
			$Buttons/Quit/Text.text = "Esentato"
		"german":
			$Buttons/Story/Text.text = "Geschichte"
			$Buttons/Freeplay/Text.text = "Freispiel"
			$Buttons/Settings/Label.text = "Einstellungen"
			$Buttons/Quit/Text.text = "Verlassen"
		"japanese":
			$GameLogo.texture = load("res://sprites/menu/title/Logo_New_Final3_JPN.png")
			$Buttons/Story/Text.text = "ストーリー"
			$Buttons/Freeplay/Text.text = "フリープレイ"
			$Buttons/Settings/Label.text = "オプション"
			$Buttons/Quit/Text.text = "終了"
		_:
			return
			#It's just English

func _process(delta):
	if story.is_hovered() && can_choose:
		previews_image.play("story")
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	elif freeplay.is_hovered() && can_choose:
		previews_image.play("freeplay")
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	elif settings.is_hovered() && can_choose:
		previews_image.play("settings")
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	elif quit.is_hovered() && can_choose:
		previews_image.play("quit")
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	else:
		has_hoverplayed = false


func _on_story_pressed() -> void:
	if can_choose:
		select.play()
		LoadManager.load_scene("res://scenes/menu/story_save_file_select.tscn")
		ModeManager.is_freeplay = false
		ModeManager.is_story = true


func _on_freeplay_pressed() -> void:
	if can_choose:
		select.play()
		LoadManager.load_scene("res://scenes/menu/level_select.tscn")
		ModeManager.is_freeplay = true
		ModeManager.is_story = false


func _on_settings_pressed() -> void:
	if can_choose:
		select.play()
		LoadManager.load_scene("res://scenes/menu/settings.tscn")


func _on_quit_pressed() -> void:
	button_anim.play("popout")
	can_choose = false
	deselect.play()

func backtotitle():
	LoadManager.load_scene("res://scenes/menu/title_screen.tscn")
