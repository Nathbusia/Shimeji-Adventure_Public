extends Node2D

@onready var shimeji_character_cutscene: Node2D = $Characters/ShimejiCharacter_Cutscene
@onready var stickbuddy: Node2D = $Characters/Stickbuddy
@onready var black_screen_anim: AnimationPlayer = $BlackScreenAnim
@onready var black_screen: Panel = $BlackScreen

#Playable Characters Thing
var player_character_path = "res://scenes/characters/playable/" + CharactersManager.charactername + "/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_Playable : Node2D 
var player_charactermod_path = "res://mods/characters/" + CharactersManager.charactername + "/scene/shimeji_character_cutscene.tscn"
@onready var ShimejiCharacter_PlayableMod : Node2D

func _ready():
	DiscordRPC.state = "In a Cutscene"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	if CharactersManager.is_mod:
		ShimejiCharacter_PlayableMod = load(player_charactermod_path).instantiate()
	else:
		ShimejiCharacter_Playable = load(player_character_path).instantiate()
	
	Dialogic.signal_event.connect(DialogicSignal)
	if CharactersManager.is_mod:
		var scene = get_node("Characters") 
		ShimejiCharacter_PlayableMod.position = shimeji_character_cutscene.global_position
		scene.remove_child(shimeji_character_cutscene)
		scene.add_child(ShimejiCharacter_PlayableMod)
		ShimejiCharacter_PlayableMod.name = shimeji_character_cutscene.name
		stickbuddy.friend_amin.play("walk_in")
		stickbuddy.friend.flip_h = true
	else:
		var scene = get_node("Characters") 
		ShimejiCharacter_Playable.position = shimeji_character_cutscene.global_position
		scene.remove_child(shimeji_character_cutscene)
		scene.add_child(ShimejiCharacter_Playable)
		ShimejiCharacter_Playable.name = shimeji_character_cutscene.name
		stickbuddy.friend_amin.play("walk_in")
		stickbuddy.friend.flip_h = true

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
	if ModeManager.is_savefile2:
		SaveFileManager.update_data02(
		LevelsManager.worldname, 
		SaveFileManager.currentplayerlives,
		SaveFileManager.currentplayerlivest,
		SaveFileManager.maxcurrentlives,
		SaveFileManager.trianglestotal,
		SaveFileManager.trianglestotalt,
		SaveFileManager.trianglestotalh,
		SaveFileManager.maxtrianglestotal)
	if ModeManager.is_savefile3:
		SaveFileManager.update_data03(
		LevelsManager.worldname, 
		SaveFileManager.currentplayerlives,
		SaveFileManager.currentplayerlivest,
		SaveFileManager.maxcurrentlives,
		SaveFileManager.trianglestotal,
		SaveFileManager.trianglestotalt,
		SaveFileManager.trianglestotalh,
		SaveFileManager.maxtrianglestotal)
			
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
	SaveGame.save_game()
	LoadManager.load_scene("res://scenes/demoend/demo_end.tscn")

func DialogicSignal(argument:String):
	if argument == "blackscreen":
		black_screen.show()
		black_screen_anim.play("FadeOut")
