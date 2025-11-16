extends Node2D

#Sprites & Animations
@onready var spotlight: Sprite2D = $Spotlight
@onready var game_over_text: AnimatedSprite2D = $GameOverText
@onready var continue_text: AnimatedSprite2D = $ContinueText
@onready var shimeji_character_gameover: Node2D = $Character/ShimejiCharacter_Gameover
@onready var shimeji_character_gameover_player_2: Node2D = $Character/ShimejiCharacter_Gameover_Player2
@onready var shimeji_character_gameover_player_3: Node2D = $Character/ShimejiCharacter_Gameover_Player3
@onready var shimeji_character_gameover_player_4: Node2D = $Character/ShimejiCharacter_Gameover_Player4
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

var player_character_path_player2 = "res://scenes/characters/playable/" + CharactersManager.charactername_player2 + "/shimeji_character_gameover.tscn"
@onready var ShimejiCharacter_Playable_Player2 : Node2D 
var player_charactermod_path_player2 = "res://mods/characters/" + CharactersManager.charactername_player2 + "/scene/shimeji_character_gameover.tscn"
@onready var ShimejiCharacter_PlayableMod_Player2  : Node2D
@onready var cutscene_anim_p2: AnimationPlayer = $Characters/ShimejiCharacter_Cutscene_Playable2/CutsceneAnim

var player_character_path_player3 = "res://scenes/characters/playable/" + CharactersManager.charactername_player3 + "/shimeji_character_gameover.tscn"
@onready var ShimejiCharacter_Playable_Player3 : Node2D 
var player_charactermod_path_player3 = "res://mods/characters/" + CharactersManager.charactername_player3 + "/scene/shimeji_character_gameover.tscn"
@onready var ShimejiCharacter_PlayableMod_Player3  : Node2D
@onready var cutscene_anim_p3: AnimationPlayer = $Characters/ShimejiCharacter_Cutscene_Playable3/CutsceneAnim

var player_character_path_player4 = "res://scenes/characters/playable/" + CharactersManager.charactername_player4 + "/shimeji_character_gameover.tscn"
@onready var ShimejiCharacter_Playable_Player4 : Node2D 
var player_charactermod_path_player4 = "res://mods/characters/" + CharactersManager.charactername_player4 + "/scene/shimeji_character_gameover.tscn"
@onready var ShimejiCharacter_PlayableMod_Player4  : Node2D
@onready var cutscene_anim_p4: AnimationPlayer = $Characters/ShimejiCharacter_Cutscene_Playable4/CutsceneAnim

var haschoosed = false
var has_hoverplayed = false
var pressed_yes = false
var pressed_no = false

func _ready():
	var scene = get_node("Character") 
	DiscordRPC.state = "Got a Game Over"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	
	match LanguageManager.language:
		"spanish":
			$Yes_Button.hide()
			$Yes_Button_SPA.show()
		"french":
			$Yes_Button.hide()
			$Yes_Button_FRE.show()
			$No_Button.hide()
			$No_Button_FRE.show()
		"italian":
			$Yes_Button.hide()
			$Yes_Button_ITA.show()
		"german":
			$Yes_Button.hide()
			$Yes_Button_GER.show()
			$No_Button.hide()
			$No_Button_GER.show()
		"japanese":
			$Yes_Button.hide()
			$Yes_Button_JPN.show()
			$No_Button.hide()
			$No_Button_JPN.show()
		_:
			pass
	
	$GameOverText.play("default_" + LanguageManager.shortlang)
	$ContinueText.play("default_" + LanguageManager.shortlang)
	
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod = load(player_charactermod_path).instantiate()
	else:
		ShimejiCharacter_Playable = load(player_character_path).instantiate()
	
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2 = load(player_charactermod_path_player2).instantiate()
			else:
				ShimejiCharacter_Playable_Player2 = load(player_character_path_player2).instantiate()
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3 = load(player_charactermod_path_player3).instantiate()
			else:
				ShimejiCharacter_Playable_Player3 = load(player_character_path_player3).instantiate()
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4 = load(player_charactermod_path_player4).instantiate()
			else:
				ShimejiCharacter_Playable_Player4 = load(player_character_path_player4).instantiate()
	
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

	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.position = shimeji_character_gameover_player_2.global_position
				ShimejiCharacter_PlayableMod_Player2.hide()
				scene.remove_child(shimeji_character_gameover_player_2)
				scene.add_child(ShimejiCharacter_PlayableMod_Player2)
				ShimejiCharacter_PlayableMod_Player2.name = shimeji_character_gameover_player_2.name
			else:
				ShimejiCharacter_Playable_Player2.position = shimeji_character_gameover_player_2.global_position
				ShimejiCharacter_Playable_Player2.hide()
				scene.remove_child(shimeji_character_gameover_player_2)
				scene.add_child(ShimejiCharacter_Playable_Player2)
				ShimejiCharacter_Playable_Player2.name = shimeji_character_gameover_player_2.name
				
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.position = shimeji_character_gameover_player_3.global_position
				ShimejiCharacter_PlayableMod_Player3.hide()
				scene.remove_child(shimeji_character_gameover_player_3)
				scene.add_child(ShimejiCharacter_PlayableMod_Player3)
				ShimejiCharacter_PlayableMod_Player3.name = shimeji_character_gameover_player_3.name
			else:
				ShimejiCharacter_Playable_Player3.position = shimeji_character_gameover_player_3.global_position
				ShimejiCharacter_Playable_Player3.hide()
				scene.remove_child(shimeji_character_gameover_player_3)
				scene.add_child(ShimejiCharacter_Playable_Player3)
				ShimejiCharacter_Playable_Player3.name = shimeji_character_gameover_player_3.name
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.position = shimeji_character_gameover_player_4.global_position
				ShimejiCharacter_PlayableMod_Player4.hide()
				scene.remove_child(shimeji_character_gameover_player_4)
				scene.add_child(ShimejiCharacter_PlayableMod_Player4)
				ShimejiCharacter_PlayableMod_Player4.name = shimeji_character_gameover_player_4.name
			else:
				ShimejiCharacter_Playable_Player4.position = shimeji_character_gameover_player_4.global_position
				ShimejiCharacter_Playable_Player4.hide()
				scene.remove_child(shimeji_character_gameover_player_4)
				scene.add_child(ShimejiCharacter_Playable_Player4)
				ShimejiCharacter_Playable_Player4.name = shimeji_character_gameover_player_4.name
					
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players:
			scene.remove_child(shimeji_character_gameover_player_3)
			scene.remove_child(shimeji_character_gameover_player_4)
		if ModeManager.multi_3players:
			scene.remove_child(shimeji_character_gameover_player_4)
	else:
		scene.remove_child(shimeji_character_gameover_player_2)
		scene.remove_child(shimeji_character_gameover_player_3)
		scene.remove_child(shimeji_character_gameover_player_4)

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

func char_fall_p2():
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.falling()
				ShimejiCharacter_PlayableMod_Player2.show()
			else:
				ShimejiCharacter_Playable_Player2.falling()
				ShimejiCharacter_Playable_Player2.show()

func char_fall_p3():
	if ModeManager.is_multiplayer:
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.falling()
				ShimejiCharacter_PlayableMod_Player3.show()
			else:
				ShimejiCharacter_Playable_Player3.falling()
				ShimejiCharacter_Playable_Player3.show()

func char_fall_p4():
	if ModeManager.is_multiplayer:
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.falling()
				ShimejiCharacter_PlayableMod_Player4.show()
			else:
				ShimejiCharacter_Playable_Player4.falling()
				ShimejiCharacter_Playable_Player4.show()

func play_cotinuetheme():
	continue_bgm.play()
	
func funny_crash():
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.crash_land()
	else:
		ShimejiCharacter_Playable.crash_land()

func funny_crash_p2():
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.crash_land()
			else:
				ShimejiCharacter_Playable_Player2.crash_land()

func funny_crash_p3():
	if ModeManager.is_multiplayer:
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.crash_land()
			else:
				ShimejiCharacter_Playable_Player3.crash_land()

func funny_crash_p4():
	if ModeManager.is_multiplayer:
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.crash_land()
			else:
				ShimejiCharacter_Playable_Player4.crash_land()

func start_transition():
	black_screen_anim.play("FadeOut")

func load_scene():
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.idle()
	else:
		ShimejiCharacter_Playable.idle()
	
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.idle()
			else:
				ShimejiCharacter_Playable_Player2.idle()
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.idle()
			else:
				ShimejiCharacter_Playable_Player3.idle()
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.idle()
			else:
				ShimejiCharacter_Playable_Player4.idle()

	if pressed_yes:
		if LevelsManager.is_mod:
			LoadManager.load_scene("res://mods/levels-bosses/" + LevelsManager.levelname + "/scene/" + LevelsManager.levelname + ".tscn")
		else:
			LoadManager.load_scene("res://scenes/levels/" + LevelsManager.worldname + "/" + LevelsManager.levelname + ".tscn")
	elif pressed_no:
		if ModeManager.is_story:
			LoadManager.load_scene("res://scenes/worldmap/worldmap_world1.tscn")
		else:
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
		
		if ModeManager.is_multiplayer:
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				$Player2Act.start()
			if ModeManager.multi_3players || ModeManager.multi_4players:
				$Player3Act.start()
			if ModeManager.multi_4players:
				$Player4Act.start()

		if ModeManager.is_story:
			SaveFileManager.currentplayerlives = 3
			SaveFileManager.currentplayerlivest = 0
			SaveFileManager.maxcurrentlives = 3
			SaveGame.save_game()
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

		if ModeManager.is_multiplayer:
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				$Player2Act.start()
			if ModeManager.multi_3players || ModeManager.multi_4players:
				$Player3Act.start()
			if ModeManager.multi_4players:
				$Player4Act.start()
		
		if ModeManager.is_story:
			SaveFileManager.currentplayerlives = 3
			SaveFileManager.currentplayerlivest = 0
			SaveFileManager.maxcurrentlives = 3
			SaveGame.save_game()
		game_over_screen_anim.play("outro")


func _on_player_2_act_timeout() -> void:
	if pressed_yes:
		if CharactersManager.is_mod_p2:
			ShimejiCharacter_PlayableMod_Player2.yes_click()
		else:
			ShimejiCharacter_Playable_Player2.yes_click()
	if pressed_no:
		if CharactersManager.is_mod_p2:
			ShimejiCharacter_PlayableMod_Player2.no_click()
		else:
			ShimejiCharacter_Playable_Player2.no_click()
	$Player2Act.stop()


func _on_player_3_act_timeout() -> void:
	if pressed_yes:
		if CharactersManager.is_mod_p3:
			ShimejiCharacter_PlayableMod_Player3.yes_click()
		else:
			ShimejiCharacter_Playable_Player3.yes_click()
	if pressed_no:
		if CharactersManager.is_mod_p3:
			ShimejiCharacter_PlayableMod_Player3.no_click()
		else:
			ShimejiCharacter_Playable_Player3.no_click()
	$Player3Act.stop()


func _on_player_4_act_timeout() -> void:
	if pressed_yes:
		if CharactersManager.is_mod_p4:
			ShimejiCharacter_PlayableMod_Player4.yes_click()
		else:
			ShimejiCharacter_Playable_Player4.yes_click()
	if pressed_no:
		if CharactersManager.is_mod_p4:
			ShimejiCharacter_PlayableMod_Player4.no_click()
		else:
			ShimejiCharacter_Playable_Player4.no_click()
	$Player4Act.stop()
