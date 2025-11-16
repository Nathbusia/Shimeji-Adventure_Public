extends Node2D
@onready var shimeji_character_cutscene: Node2D = $Characters/ShimejiCharacter_Cutscene
@onready var shimeji_character_cutscene_playable_2: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable2
@onready var shimeji_character_cutscene_playable_3: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable3
@onready var shimeji_character_cutscene_playable_4: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable4
@onready var interfly_cutscene: Node2D = $Characters/Interfly_Cutscene
@onready var cutscene_backstory: Node2D = $CutsceneBackstory
@onready var black_screen: Panel = $CutsceneAnimations/BlackScreen
@onready var black_screen_anim: AnimationPlayer = $CutsceneAnimations/BlackScreenAnim

@onready var camera_anim: AnimationPlayer = $CutsceneAnimations/CameraAnim
@onready var interfly_anim: AnimationPlayer = $CutsceneAnimations/InterflyAnim
@onready var backstory_anim: AnimationPlayer = $CutsceneAnimations/BackstoryAnim
@onready var backstory_fade_anim: AnimationPlayer = $CutsceneAnimations/BackstoryFadeAnim


#Playable Thing
var player_character_path = "res://scenes/characters/playable/" + CharactersManager.charactername + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable : Node2D 
var player_charactermod_path = "res://mods/characters/" + CharactersManager.charactername + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod : Node2D
@onready var cutscene_anim: AnimationPlayer = $Characters/ShimejiCharacter_Cutscene/CutsceneAnim


var player_character_path_player2 = "res://scenes/characters/playable/" + CharactersManager.charactername_player2 + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable_Player2 : Node2D 
var player_charactermod_path_player2 = "res://mods/characters/" + CharactersManager.charactername_player2 + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod_Player2  : Node2D
@onready var cutscene_anim_p2: AnimationPlayer = $Characters/ShimejiCharacter_Cutscene_Playable2/CutsceneAnim


var player_character_path_player3 = "res://scenes/characters/playable/" + CharactersManager.charactername_player3 + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable_Player3 : Node2D 
var player_charactermod_path_player3 = "res://mods/characters/" + CharactersManager.charactername_player3 + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod_Player3  : Node2D
@onready var cutscene_anim_p3: AnimationPlayer = $Characters/ShimejiCharacter_Cutscene_Playable3/CutsceneAnim

var player_character_path_player4 = "res://scenes/characters/playable/" + CharactersManager.charactername_player4 + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable_Player4 : Node2D 
var player_charactermod_path_player4 = "res://mods/characters/" + CharactersManager.charactername_player4 + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod_Player4  : Node2D
@onready var cutscene_anim_p4: AnimationPlayer = $Characters/ShimejiCharacter_Cutscene_Playable4/CutsceneAnim

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
		ShimejiCharacter_PlayableMod.cutscene_anim.play("walk_w2lv1")
	else:
		ShimejiCharacter_Playable.position = shimeji_character_cutscene.global_position
		scene.remove_child(shimeji_character_cutscene)
		scene.add_child(ShimejiCharacter_Playable)
		ShimejiCharacter_Playable.name = shimeji_character_cutscene.name
		ShimejiCharacter_Playable.cutscene_anim.play("walk_w2lv1")
	
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.position = shimeji_character_cutscene_playable_2.global_position
				scene.remove_child(shimeji_character_cutscene_playable_2)
				scene.add_child(ShimejiCharacter_PlayableMod_Player2)
				ShimejiCharacter_PlayableMod_Player2.name = shimeji_character_cutscene_playable_2.name
				ShimejiCharacter_PlayableMod_Player2.cutscene_anim.play("walk_w2lv1")
			else:
				ShimejiCharacter_Playable_Player2.position = shimeji_character_cutscene_playable_2.global_position
				scene.remove_child(shimeji_character_cutscene_playable_2)
				scene.add_child(ShimejiCharacter_Playable_Player2)
				ShimejiCharacter_Playable_Player2.name = shimeji_character_cutscene_playable_2.name
				ShimejiCharacter_Playable_Player2.cutscene_anim.play("walk_w2lv1")
				
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.position = shimeji_character_cutscene_playable_3.global_position
				scene.remove_child(shimeji_character_cutscene_playable_3)
				scene.add_child(ShimejiCharacter_PlayableMod_Player3)
				ShimejiCharacter_PlayableMod_Player3.name = shimeji_character_cutscene_playable_3.name
				ShimejiCharacter_PlayableMod_Player3.cutscene_anim.play("walk_w2lv1")
			else:
				ShimejiCharacter_Playable_Player3.position = shimeji_character_cutscene_playable_3.global_position
				scene.remove_child(shimeji_character_cutscene_playable_3)
				scene.add_child(ShimejiCharacter_Playable_Player3)
				ShimejiCharacter_Playable_Player3.name = shimeji_character_cutscene_playable_3.name
				ShimejiCharacter_Playable_Player3.cutscene_anim.play("walk_w2lv1")
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.position = shimeji_character_cutscene_playable_4.global_position
				scene.remove_child(shimeji_character_cutscene_playable_4)
				scene.add_child(ShimejiCharacter_PlayableMod_Player4)
				ShimejiCharacter_PlayableMod_Player4.name = shimeji_character_cutscene_playable_4.name
				ShimejiCharacter_PlayableMod_Player4.cutscene_anim.play("walk_w2lv1")
			else:
				ShimejiCharacter_Playable_Player4.position = shimeji_character_cutscene_playable_4.global_position
				scene.remove_child(shimeji_character_cutscene_playable_4)
				scene.add_child(ShimejiCharacter_Playable_Player4)
				ShimejiCharacter_Playable_Player4.name = shimeji_character_cutscene_playable_4.name
				ShimejiCharacter_Playable_Player4.cutscene_anim.play("walk_w2lv1")
					
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

func load_scene():
	LoadManager.load_scene("res://scenes/levels/world2/world2_level1.tscn")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func start_dialouge():
	match LanguageManager.language:
		"spanish":
			if ModeManager.is_multiplayer:
				run_dialogue("w2_intro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("w2_intro_" + LanguageManager.shortlang)
		"french":
			if ModeManager.is_multiplayer:
				run_dialogue("w2_intro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("w2_intro_" + LanguageManager.shortlang)
		"italian":
			if ModeManager.is_multiplayer:
				run_dialogue("w2_intro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("w2_intro_" + LanguageManager.shortlang)
		"german":
			if ModeManager.is_multiplayer:
				run_dialogue("w2_intro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("w2_intro_" + LanguageManager.shortlang)
		"japanese":
			run_dialogue("w2_intro_" + LanguageManager.shortlang)
		_:
			if ModeManager.is_multiplayer:
				run_dialogue("w2_intro_multi_en")
			else:
				run_dialogue("w2_intro_en")

func DialogicSignal(argument:String):
	if argument == "blackscreen":
		black_screen.show()
		black_screen_anim.play("FadeOut")
	if argument == "shimep1_jump":
		if CharactersManager.is_mod:
			if ShimejiCharacter_PlayableMod.has_specialanim:
				pass
			else:
				ShimejiCharacter_PlayableMod.cutscene_anim.play("jump")
		else:
			ShimejiCharacter_Playable.cutscene_anim.play("jump")
	if argument == "shimemodp1_specialanim_1":
		if CharactersManager.is_mod:
			if ShimejiCharacter_PlayableMod.has_specialanim:
				pass
	if argument == "allshime_sit":
		if CharactersManager.is_mod:
			ShimejiCharacter_PlayableMod.cutscene_anim.play("start_sit")
		else:
			ShimejiCharacter_Playable.cutscene_anim.play("start_sit")
		if ModeManager.is_multiplayer:
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p2:
					ShimejiCharacter_PlayableMod_Player2.cutscene_anim.play("start_sit")
				else:
					ShimejiCharacter_Playable_Player2.cutscene_anim.play("start_sit")
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					ShimejiCharacter_PlayableMod_Player3.cutscene_anim.play("start_sit")
				else:
					ShimejiCharacter_Playable_Player3.cutscene_anim.play("start_sit")
			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					ShimejiCharacter_PlayableMod_Player4.cutscene_anim.play("start_sit")
				else:
					ShimejiCharacter_Playable_Player4.cutscene_anim.play("start_sit")
	if argument == "adjustcamera_shime":
		camera_anim.play("cam_shime")
	if argument == "adjustcamera_default":
		camera_anim.play("cam_default")
	if argument == "adjustcamera_focusdoor":
		camera_anim.play("cam_door")
	if argument == "adjustcamera_moveup":
		camera_anim.play("cam_end")
	if argument == "flashback_start":
		cutscene_backstory.show()
		backstory_fade_anim.play("part1_fade")
		backstory_anim.play("part1_move")
	if argument == "flashback_part2":
		backstory_fade_anim.play("part2_fade")
		backstory_anim.play("part2_move")
	if argument == "flashback_part3":
		backstory_fade_anim.play("part3_fade")
		backstory_anim.play("part3_move")
	if argument == "flashback_part4":
		backstory_fade_anim.play("part4_fade")
		backstory_anim.play("part4_move")
	if argument == "flashback_end":
		backstory_fade_anim.play("part4_end")
	if argument == "allshime_stand":
		if CharactersManager.is_mod:
			ShimejiCharacter_PlayableMod.cutscene_anim.play("end_sit")
		else:
			ShimejiCharacter_Playable.cutscene_anim.play("end_sit")
		if ModeManager.is_multiplayer:
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p2:
					ShimejiCharacter_PlayableMod_Player2.cutscene_anim.play("end_sit")
				else:
					ShimejiCharacter_Playable_Player2.cutscene_anim.play("end_sit")
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					ShimejiCharacter_PlayableMod_Player3.cutscene_anim.play("end_sit")
				else:
					ShimejiCharacter_Playable_Player3.cutscene_anim.play("end_sit")
			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					ShimejiCharacter_PlayableMod_Player4.cutscene_anim.play("end_sit")
				else:
					ShimejiCharacter_Playable_Player4.cutscene_anim.play("end_sit")
	if argument == "flyright":
		interfly_anim.play("interfly_flyaway")
