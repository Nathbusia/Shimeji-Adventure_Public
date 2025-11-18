extends Node2D

@onready var shimeji_character_cutscene: Node2D = $Characters/ShimejiCharacter_Cutscene
@onready var shimeji_character_cutscene_playable_2: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable2
@onready var shimeji_character_cutscene_playable_3: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable3
@onready var shimeji_character_cutscene_playable_4: Node2D = $Characters/ShimejiCharacter_Cutscene_Playable4
@onready var stickbuddy: Node2D = $Characters/Stickbuddy
@onready var black_screen_anim: AnimationPlayer = $BlackScreenAnim
@onready var black_screen: Panel = $BlackScreen

#Playable Characters Thing
var player_character_path = "res://scenes/characters/playable/" + CharactersManager.charactername + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable : Node2D 
var player_charactermod_path = "res://mods/characters/" + CharactersManager.charactername + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod : Node2D

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
	SaveFileManager.world1_boss_dic["hasbeencompleted"] = true
	SaveFileManager.world_unlocks_dic["world2unlocked"] = true
	var scene = get_node("Characters")
	var _shimeplayer1 = get_node("Characters/ShimejiCharacter_Cutscene") 
	var _shimeplayer2 = get_node("Characters/ShimejiCharacter_Cutscene_Playable2") 
	var _shimeplayer3 = get_node("Characters/ShimejiCharacter_Cutscene_Playable3") 
	var _shimeplayer4 = get_node("Characters/ShimejiCharacter_Cutscene_Playable4") 
	DiscordRPC.state = "In a Cutscene"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	
	if AltBgmManager.enabled:
		$Level_BGM.stream = load("res://bgm/levels/world1/bgm_world1_outro_cutscene_ytsafe.ogg")
		$Level_BGM.play()
	else:
		pass
	
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
		stickbuddy.friend_amin.play("walk_in")
		stickbuddy.friend.flip_h = true
	else:
		ShimejiCharacter_Playable.position = shimeji_character_cutscene.global_position
		scene.remove_child(shimeji_character_cutscene)
		scene.add_child(ShimejiCharacter_Playable)
		ShimejiCharacter_Playable.name = shimeji_character_cutscene.name
		stickbuddy.friend_amin.play("walk_in")
		stickbuddy.friend.flip_h = true

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
	LoadManager.load_scene("res://scenes/worldmap/worldmap_world1.tscn")

func DialogicSignal(argument:String):
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

	if argument == "blackscreen":
		black_screen.show()
		black_screen_anim.play("FadeOut")
