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
@onready var players_anim: AnimationPlayer = $CutsceneAnimations/PlayersAnim
@onready var platform_anim: AnimationPlayer = $CutsceneAnimations/PlatformAnim

@onready var crowd_agree: AudioStreamPlayer = $Ambience/CrowdAgree

@onready var platform_hover: AudioStreamPlayer2D = $MovingPlatformThing/Platform/PlatformHover
@onready var platform_activate: AudioStreamPlayer = $MovingPlatformThing/PlatformActivate


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
	else:
		ShimejiCharacter_Playable.position = shimeji_character_cutscene.global_position
		scene.remove_child(shimeji_character_cutscene)
		scene.add_child(ShimejiCharacter_Playable)
		ShimejiCharacter_Playable.name = shimeji_character_cutscene.name
	
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.position = shimeji_character_cutscene_playable_2.global_position
				scene.remove_child(shimeji_character_cutscene_playable_2)
				scene.add_child(ShimejiCharacter_PlayableMod_Player2)
				ShimejiCharacter_PlayableMod_Player2.name = shimeji_character_cutscene_playable_2.name
			else:
				ShimejiCharacter_Playable_Player2.position = shimeji_character_cutscene_playable_2.global_position
				scene.remove_child(shimeji_character_cutscene_playable_2)
				scene.add_child(ShimejiCharacter_Playable_Player2)
				ShimejiCharacter_Playable_Player2.name = shimeji_character_cutscene_playable_2.name
				
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.position = shimeji_character_cutscene_playable_3.global_position
				scene.remove_child(shimeji_character_cutscene_playable_3)
				scene.add_child(ShimejiCharacter_PlayableMod_Player3)
				ShimejiCharacter_PlayableMod_Player3.name = shimeji_character_cutscene_playable_3.name
			else:
				ShimejiCharacter_Playable_Player3.position = shimeji_character_cutscene_playable_3.global_position
				scene.remove_child(shimeji_character_cutscene_playable_3)
				scene.add_child(ShimejiCharacter_Playable_Player3)
				ShimejiCharacter_Playable_Player3.name = shimeji_character_cutscene_playable_3.name
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.position = shimeji_character_cutscene_playable_4.global_position
				scene.remove_child(shimeji_character_cutscene_playable_4)
				scene.add_child(ShimejiCharacter_PlayableMod_Player4)
				ShimejiCharacter_PlayableMod_Player4.name = shimeji_character_cutscene_playable_4.name
			else:
				ShimejiCharacter_Playable_Player4.position = shimeji_character_cutscene_playable_4.global_position
				scene.remove_child(shimeji_character_cutscene_playable_4)
				scene.add_child(ShimejiCharacter_Playable_Player4)
				ShimejiCharacter_Playable_Player4.name = shimeji_character_cutscene_playable_4.name
					
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
	if ModeManager.is_savefile1:
		SaveFileManager.update_data(
		LevelsManager.worldname, 
		SaveFileManager.currentplayerlives,
		SaveFileManager.currentplayerlivest,
		SaveFileManager.maxcurrentlives,
		SaveFileManager.trianglestotal,
		SaveFileManager.trianglestotalt,
		SaveFileManager.trianglestotalh,
		SaveFileManager.maxtrianglestotal)

		SaveFileManager.currentplayerlives = SaveFileManager.data_dic["currentlives"]
		SaveFileManager.currentplayerlivest = SaveFileManager.data_dic["currentlivest"]
		SaveFileManager.maxcurrentlives = SaveFileManager.data_dic["maxlives"]
		SaveFileManager.trianglestotal = SaveFileManager.data_dic["trianglestotal"]
		SaveFileManager.trianglestotalt = SaveFileManager.data_dic["trianglestotalt"]
		SaveFileManager.trianglestotalh = SaveFileManager.data_dic["trianglestotalh"]
		SaveFileManager.maxtrianglestotal = SaveFileManager.data_dic["maxtriangles"]

		SaveFileManager.update_w1_tut(
		SaveFileManager.world1_tutorial_dic["trianglecollected1"], 
		SaveFileManager.world1_tutorial_dic["trianglecollected2"], 
		SaveFileManager.world1_tutorial_dic["trianglecollected3"],
		SaveFileManager.world1_tutorial_dic["trianglecollected4"],
		SaveFileManager.world1_tutorial_dic["hasbeencompleted"])

		SaveFileManager.update_w1_lv1(
		SaveFileManager.world1_level1_dic["unlocked"],
		SaveFileManager.world1_level1_dic["trianglecollected1"], 
		SaveFileManager.world1_level1_dic["trianglecollected2"], 
		SaveFileManager.world1_level1_dic["trianglecollected3"],
		SaveFileManager.world1_level1_dic["trianglecollected4"],
		SaveFileManager.world1_level1_dic["hasbeencompleted"])

		SaveFileManager.update_w1_lv2(
		SaveFileManager.world1_level2_dic["unlocked"],
		SaveFileManager.world1_level2_dic["trianglecollected1"], 
		SaveFileManager.world1_level2_dic["trianglecollected2"], 
		SaveFileManager.world1_level2_dic["trianglecollected3"],
		SaveFileManager.world1_level2_dic["trianglecollected4"],
		SaveFileManager.world1_level2_dic["hasbeencompleted"])

		SaveFileManager.update_w1_boss(
		SaveFileManager.world1_boss_dic["unlocked"],
		SaveFileManager.world1_boss_dic["hasbeencompleted"])

		SaveFileManager.update_w2_lv1(
			SaveFileManager.world2_level1_dic["trianglecollected1"], 
			SaveFileManager.world2_level1_dic["trianglecollected2"], 
			SaveFileManager.world2_level1_dic["trianglecollected3"],
			SaveFileManager.world2_level1_dic["trianglecollected4"],
			SaveFileManager.world2_level1_dic["hasbeencompleted"])

		SaveFileManager.update_w2_lv2(
			SaveFileManager.world2_level2_dic["unlocked"],
			SaveFileManager.world2_level2_dic["trianglecollected1"], 
			SaveFileManager.world2_level2_dic["trianglecollected2"], 
			SaveFileManager.world2_level2_dic["trianglecollected3"],
			SaveFileManager.world2_level2_dic["trianglecollected4"],
			SaveFileManager.world2_level2_dic["hasbeencompleted"])

		SaveFileManager.update_w2_lv3(
			SaveFileManager.world2_level3_dic["unlocked"],
			SaveFileManager.world2_level3_dic["trianglecollected1"], 
			SaveFileManager.world2_level3_dic["trianglecollected2"], 
			SaveFileManager.world2_level3_dic["trianglecollected3"],
			SaveFileManager.world2_level3_dic["trianglecollected4"],
			SaveFileManager.world2_level3_dic["hasbeencompleted"])

		SaveFileManager.update_w2_boss(
			SaveFileManager.world2_boss_dic["unlocked"],
			SaveFileManager.world2_boss_dic["hasbeencompleted"])
		
		SaveFileManager.update_world_unlocks_dic(
			SaveFileManager.world_unlocks_dic["world2unlocked"],
			SaveFileManager.world_unlocks_dic["recentlyunlocked_world2"],
			SaveFileManager.world_unlocks_dic["world3unlocked"],
			SaveFileManager.world_unlocks_dic["world4unlocked"],
			SaveFileManager.world_unlocks_dic["world5unlocked"],
			SaveFileManager.world_unlocks_dic["world6unlocked"],
			SaveFileManager.world_unlocks_dic["world7unlocked"],
			SaveFileManager.world_unlocks_dic["world8unlocked"])
	SaveGame.save_game()
	LoadManager.load_scene("res://scenes/demoend/demo_end.tscn")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func start_dialouge():
	match LanguageManager.language:
		"spanish":
			if ModeManager.is_multiplayer:
				run_dialogue("world2_outro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("world2_outro_" + LanguageManager.shortlang)
		"french":
			if ModeManager.is_multiplayer:
				run_dialogue("world2_outro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("world2_outro_" + LanguageManager.shortlang)
		"italian":
			if ModeManager.is_multiplayer:
				run_dialogue("world2_outro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("world2_outro_" + LanguageManager.shortlang)
		"german":
			if ModeManager.is_multiplayer:
				run_dialogue("world2_outro_multi_" + LanguageManager.shortlang)
			else:
				run_dialogue("world2_outro_" + LanguageManager.shortlang)
		"japanese":
			run_dialogue("world2_outro_" + LanguageManager.shortlang)
		_:
			if ModeManager.is_multiplayer:
				run_dialogue("world2_outro_multi")
			else:
				run_dialogue("world2_outro")

func black_screen_start():
	black_screen.show()
	black_screen_anim.play("FadeOut")

func platform_engage():
	platform_hover.play()
	platform_activate.play()

func player_walk():
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.walk()
	else:
		ShimejiCharacter_Playable.walk()
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.walk()
			else:
				ShimejiCharacter_Playable_Player2.walk()
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.walk()
			else:
				ShimejiCharacter_Playable_Player3.walk()
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.walk()
			else:
				ShimejiCharacter_Playable_Player4.walk()

func player_jump():
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod.jump()
	else:
		ShimejiCharacter_Playable.jump()
	if ModeManager.is_multiplayer:
		if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p2:
				ShimejiCharacter_PlayableMod_Player2.jump()
			else:
				ShimejiCharacter_Playable_Player2.jump()
		if ModeManager.multi_3players || ModeManager.multi_4players:
			if CharactersManager.is_mod_p3:
				ShimejiCharacter_PlayableMod_Player3.jump()
			else:
				ShimejiCharacter_Playable_Player3.jump()
		if ModeManager.multi_4players:
			if CharactersManager.is_mod_p4:
				ShimejiCharacter_PlayableMod_Player4.jump()
			else:
				ShimejiCharacter_Playable_Player4.jump()
				
func player_idle():
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
				
func DialogicSignal(argument:String):
	if argument == "blackscreen":
		black_screen.show()
		black_screen_anim.play("FadeOut")
	if argument == "shimep1_jumptwo":
		if CharactersManager.is_mod:
			if ShimejiCharacter_PlayableMod.has_specialanim:
				pass
			else:
				ShimejiCharacter_PlayableMod.cutscene_anim.play("jump_two")
		else:
			ShimejiCharacter_Playable.cutscene_anim.play("jump_two")
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
				print("Special Animations working like a fiddle.")
				ShimejiCharacter_PlayableMod.specialanim_1()

	if argument == "shimemodp1_specialanim_2":
		if CharactersManager.is_mod:
			if ShimejiCharacter_PlayableMod.has_specialanim:
				print("Special Animations working like a fiddle.")
				ShimejiCharacter_PlayableMod.specialanim_2()

	if argument == "shimemodp1_specialanim_6":
		if CharactersManager.is_mod:
			if ShimejiCharacter_PlayableMod.has_specialanim:
				print("Special Animations working like a fiddle.")
				ShimejiCharacter_PlayableMod.specialanim_6()

	if argument == "othershime_taunt":
		if ModeManager.is_multiplayer:
			if ModeManager.multi_2players || ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p2:
					ShimejiCharacter_PlayableMod_Player2.taunt()
				else:
					ShimejiCharacter_Playable_Player2.taunt()
			if ModeManager.multi_3players || ModeManager.multi_4players:
				if CharactersManager.is_mod_p3:
					ShimejiCharacter_PlayableMod_Player3.taunt()
				else:
					ShimejiCharacter_Playable_Player3.taunt()
			if ModeManager.multi_4players:
				if CharactersManager.is_mod_p4:
					ShimejiCharacter_PlayableMod_Player4.taunt()
				else:
					ShimejiCharacter_Playable_Player4.taunt()
	if argument == "othershime_backtoidle":
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
	if argument == "crowdcheer":
		crowd_agree.play()
	if argument == "allshime_gotoplatform":
		players_anim.play("player_movetoplatform")
	if argument == "cam_player":
		camera_anim.play("cam_player")
	if argument == "cam_default":
		camera_anim.play("cam_default")
	if argument == "cam_movingplatform":
		camera_anim.play("cam_movingplatform")
	if argument == "cam_ending":
		camera_anim.play("cam_ending")
	if argument == "movingplatform_move":
		platform_anim.play("platform_takeoff_part1")
	if argument == "movingplatform_moveon":
		platform_anim.play("platform_takeoff_part2")

func _on_begin_dialogue_timer_timeout() -> void:
	start_dialouge()
	$BeginDialogueTimer.stop()
