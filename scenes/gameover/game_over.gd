extends Node2D

#Sprites & Animations
@onready var spotlight: Sprite2D = $Spotlight
@onready var game_over_text: AnimatedSprite2D = $GameOverText
@onready var continue_text: AnimatedSprite2D = $ContinueText
@onready var shimeji_character_gameover: Node2D = $Character/ShimejiCharacter_Gameover
@onready var game_over_screen_anim: AnimationPlayer = $GameOverScreenAnim
@onready var black_screen: Panel = $BlackScreen
@onready var black_screen_anim: AnimationPlayer = $BlackScreenAnim

#Buttons
@onready var yes_button: TextureButton = $Yes_Button
@onready var no_button: TextureButton = $No_Button

#BGM
@onready var game_over: AudioStreamPlayer2D = $BGM/GameOver
@onready var continue_bgm: AudioStreamPlayer2D = $BGM/Continue
@onready var yes_jingle: AudioStreamPlayer2D = $BGM/YesJingle
@onready var no_jingle: AudioStreamPlayer2D = $BGM/NoJingle

#Sounds
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover

#Playable Characters Thing
var player_character_path = "res://scenes/characters/playable/" + CharactersManager.charactername + "/shimeji_character_gameover.tscn"
@onready var ShimejiCharacter_Playable : Node2D
var player_charactermod_path = "res://mods/characters/" + CharactersManager.charactername + "/scene/shimeji_character_gameover.tscn"
@onready var ShimejiCharacter_PlayableMod : Node2D

var haschoosed = false
var has_hoverplayed = false
var pressed_yes = false
var pressed_no = false

func _ready():
	DiscordRPC.state = "Got a Game Over"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod = load(player_charactermod_path).instantiate()
	else:
		ShimejiCharacter_Playable = load(player_character_path).instantiate()
	
	var scene = get_node("Character") 
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.position = shimeji_character_gameover.global_position
		scene.remove_child(shimeji_character_gameover)
		scene.add_child(ShimejiCharacter_PlayableMod)
		ShimejiCharacter_PlayableMod.name = shimeji_character_gameover.name
	else:
		ShimejiCharacter_Playable.position = shimeji_character_gameover.global_position
		scene.remove_child(shimeji_character_gameover)
		scene.add_child(ShimejiCharacter_Playable)
		ShimejiCharacter_Playable.name = shimeji_character_gameover.name

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if yes_button.is_hovered() && !haschoosed:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	elif no_button.is_hovered() && !haschoosed:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	else:
		has_hoverplayed = false

func char_fall():
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.falling()
	else:
		ShimejiCharacter_Playable.falling()

func play_cotinuetheme():
	continue_bgm.play()
	
func funny_crash():
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.crash_land()
	else:
		ShimejiCharacter_Playable.crash_land()
	
func start_transition():
	black_screen_anim.play("FadeOut")

func load_scene():
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.idle()
	else:
		ShimejiCharacter_Playable.idle()
	if pressed_yes:
		if LevelsManager.is_mod:
			LoadManager.load_scene("res://mods/levels-bosses/" + LevelsManager.levelname + "/scene/" + LevelsManager.levelname + ".tscn")
		else:
			LoadManager.load_scene("res://scenes/levels/" + LevelsManager.worldname + "/" + LevelsManager.levelname + ".tscn")
	elif pressed_no:
		LoadManager.load_scene("res://scenes/menu/level_select.tscn")


func _on_yes_button_pressed() -> void:
	if haschoosed:
		return
	else:
		select.play()
		pressed_yes = true
		haschoosed = true
		black_screen.show()
		continue_bgm.stop()
		yes_jingle.play()
		if CharactersManager.is_mod:
			ShimejiCharacter_PlayableMod.yes_click()
		else:
			ShimejiCharacter_Playable.yes_click()
		game_over_screen_anim.play("outro")
		


func _on_no_button_pressed() -> void:
	if haschoosed:
		return
	else:
		deselect.play()
		pressed_no = true
		haschoosed = true
		black_screen.show()
		continue_bgm.stop()
		no_jingle.play()
		if CharactersManager.is_mod:
			ShimejiCharacter_PlayableMod.no_click()
		else:
			ShimejiCharacter_Playable.no_click()
		game_over_screen_anim.play("outro")
