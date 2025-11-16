extends Node2D
@onready var shimeji_character_cutscene: Node2D = $Characters/ShimejiCharacter_Cutscene
@onready var shimeji_character_cutscene_playable_2: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable2
@onready var shimeji_character_cutscene_playable_3: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable3
@onready var shimeji_character_cutscene_playable_4: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable4
@onready var interfly_cutscene: Node2D = $Characters/Interfly_Cutscene
@onready var pop_out_pete_cutscene: AnimatableBody2D = $Characters/PopOutPete_Cutscene
@onready var camera_anim: AnimationPlayer = $CameraAnim
@onready var interfly_anim: AnimationPlayer = $InterflyAnim

#Playable Thing
var player_character_path = "res://scenes/characters/playable/" + CharactersManager.charactername + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable : Node2D 
var player_charactermod_path = "res://mods/characters/" + CharactersManager.charactername + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod : Node2D

var player_character_path_player2 = "res://scenes/characters/playable/" + CharactersManager.charactername_player2 + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable_Player2 : Node2D 
var player_charactermod_path_player2 = "res://mods/characters/" + CharactersManager.charactername_player2 + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod_Player2  : Node2D

var player_character_path_player3 = "res://scenes/characters/playable/" + CharactersManager.charactername_player3 + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable_Player3 : Node2D 
var player_charactermod_path_player3 = "res://mods/characters/" + CharactersManager.charactername_player3 + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod_Player3  : Node2D

var player_character_path_player4 = "res://scenes/characters/playable/" + CharactersManager.charactername_player4 + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable_Player4 : Node2D 
var player_charactermod_path_player4 = "res://mods/characters/" + CharactersManager.charactername_player4 + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod_Player4  : Node2D

func _ready():
	var scene = get_node("Characters")
	var _shimeplayer1 = get_node("Characters/ShimejiCharacter_Cutscene") 
	var _shimeplayer2 = get_node("Characters/ShimejiCharacter_Cutscene_Playable2") 
	var _shimeplayer3 = get_node("Characters/ShimejiCharacter_Cutscene_Playable3") 
	var _shimeplayer4 = get_node("Characters/ShimejiCharacter_Cutscene_Playable4") 
	DiscordRPC.state = "In a Cutscene"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	
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
	
	Dialogic.signal_event.connect(DialogicSignal)
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.position = shimeji_character_cutscene.global_position
		scene.remove_child(shimeji_character_cutscene)
		scene.add_child(ShimejiCharacter_PlayableMod)
		ShimejiCharacter_PlayableMod.name = shimeji_character_cutscene.name
		ShimejiCharacter_PlayableMod.cutscene_anim.play("walk_boss1")
	else:
		ShimejiCharacter_Playable.position = shimeji_character_cutscene.global_position
		scene.remove_child(shimeji_character_cutscene)
		scene.add_child(ShimejiCharacter_Playable)
		ShimejiCharacter_Playable.name = shimeji_character_cutscene.name
		ShimejiCharacter_Playable.cutscene_anim.play("walk_boss1")
	
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.position = shimeji_character_cutscene_playable_2.global_position
				scene.remove_child(shimeji_character_cutscene_playable_2)
				scene.add_child(ShimejiCharacter_PlayableMod_Player2)
				ShimejiCharacter_PlayableMod_Player2.name = shimeji_character_cutscene_playable_2.name
				ShimejiCharacter_PlayableMod_Player2.cutscene_anim.play("walk_boss1")
			else:
				ShimejiCharacter_Playable_Player2.position = shimeji_character_cutscene_playable_2.global_position
				scene.remove_child(shimeji_character_cutscene_playable_2)
				scene.add_child(ShimejiCharacter_Playable_Player2)
				ShimejiCharacter_Playable_Player2.name = shimeji_character_cutscene_playable_2.name
				ShimejiCharacter_Playable_Player2.cutscene_anim.play("walk_boss1")
				
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.position = shimeji_character_cutscene_playable_3.global_position
				scene.remove_child(shimeji_character_cutscene_playable_3)
				scene.add_child(ShimejiCharacter_PlayableMod_Player3)
				ShimejiCharacter_PlayableMod_Player3.name = shimeji_character_cutscene_playable_3.name
				ShimejiCharacter_PlayableMod_Player3.cutscene_anim.play("walk_boss1")
			else:
				ShimejiCharacter_Playable_Player3.position = shimeji_character_cutscene_playable_3.global_position
				scene.remove_child(shimeji_character_cutscene_playable_3)
				scene.add_child(ShimejiCharacter_Playable_Player3)
				ShimejiCharacter_Playable_Player3.name = shimeji_character_cutscene_playable_3.name
				ShimejiCharacter_Playable_Player3.cutscene_anim.play("walk_boss1")
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.position = shimeji_character_cutscene_playable_4.global_position
				scene.remove_child(shimeji_character_cutscene_playable_4)
				scene.add_child(ShimejiCharacter_PlayableMod_Player4)
				ShimejiCharacter_PlayableMod_Player4.name = shimeji_character_cutscene_playable_4.name
				ShimejiCharacter_PlayableMod_Player4.cutscene_anim.play("walk_boss1")
			else:
				ShimejiCharacter_Playable_Player4.position = shimeji_character_cutscene_playable_4.global_position
				scene.remove_child(shimeji_character_cutscene_playable_4)
				scene.add_child(ShimejiCharacter_Playable_Player4)
				ShimejiCharacter_Playable_Player4.name = shimeji_character_cutscene_playable_4.name
				ShimejiCharacter_Playable_Player4.cutscene_anim.play("walk_boss1")
					
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players:
			scene.remove_child(shimeji_character_cutscene_playable_3)
			scene.remove_child(shimeji_character_cutscene_playable_4)
		if ModeManager.multi_3players:
			scene.remove_child(shimeji_character_cutscene_playable_4)
	else:
		scene.remove_child(shimeji_character_cutscene_playable_2)
		scene.remove_child(shimeji_character_cutscene_playable_3)
		scene.remove_child(shimeji_character_cutscene_playable_4)

	interfly_cutscene.friend.flip_h = false
	interfly_cutscene.interfly_anim.play("intro_boss")

func load_scene():
	LoadManager.load_scene("res://scenes/levels/world2/boss_pete.tscn")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func start_dialouge():
	match LanguageManager.language:
		"spanish":
			if ModeManager.is_multiplayer:
				run_dialogue("world2_boss_openingintro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("world2_boss_openingintro_" + LanguageManager.shortlang)
		"french":
			if ModeManager.is_multiplayer:
				run_dialogue("world2_boss_openingintro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("world2_boss_openingintro_" + LanguageManager.shortlang)
		"italian":
			if ModeManager.is_multiplayer:
				run_dialogue("world2_boss_openingintro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("world2_boss_openingintro_" + LanguageManager.shortlang)
		"german":
			if ModeManager.is_multiplayer:
				run_dialogue("world2_boss_openingintro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("world2_boss_openingintro_" + LanguageManager.shortlang)
		"japanese":
			run_dialogue("world2_boss_openingintro_" + LanguageManager.shortlang)
		_:
			if ModeManager.is_multiplayer:
				run_dialogue("world2_boss_openingintro_multi_en")
			else:
				run_dialogue("world2_boss_openingintro_en")

func DialogicSignal(argument:String):
	if argument == "cam_players":
		camera_anim.play("cam_players")
	if argument == "cam_default":
		camera_anim.play("cam_default")
	if argument == "flyaway":
		interfly_anim.play("interleave")
	if argument == "inter_close":
		interfly_anim.play("moveclose")
	if argument == "inter_back":
		interfly_anim.play("moveback")
	if argument == "beginboss":
		load_scene()


func _on_begin_talk_timer_timeout() -> void:
	start_dialouge()
	$BeginTalkTimer.stop()
