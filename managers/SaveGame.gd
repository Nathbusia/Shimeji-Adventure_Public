extends Node

var save_game_path = "user://savefiles/"
var save_game_name = "shime_story_savefile1.tres"

var save_data: SaveDataResource = SaveDataResource.new()

func _ready() -> void:
	verify_save_directory(save_game_path)

func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)

func load_game():
	if FileAccess.file_exists("user://savefiles/shime_story_savefile1.tres"):
		save_data = ResourceLoader.load(save_game_path + save_game_name).duplicate(true)
		SaveFileManager.currentworld = save_data.currentworld
		SaveFileManager.currentplayerlives = save_data.currentplayerlives
		SaveFileManager.currentplayerlivest = save_data.currentplayerlivest
		SaveFileManager.maxcurrentlives = save_data.maxcurrentlives
		SaveFileManager.trianglestotal = save_data.trianglestotal
		SaveFileManager.trianglestotalt = save_data.trianglestotalt
		SaveFileManager.trianglestotalh = save_data.trianglestotalh
		SaveFileManager.maxtrianglestotal = save_data.maxtrianglestotal
		SaveFileManager.data_dic = save_data.data_dic
		SaveFileManager.world1_tutorial_dic = save_data.world1_tutorial_dic
		SaveFileManager.world1_level1_dic = save_data.world1_level1_dic
		SaveFileManager.world1_level2_dic = save_data.world1_level2_dic
		SaveFileManager.world1_boss_dic = save_data.world1_boss_dic
		SaveFileManager.world2_level1_dic = save_data.world2_level1_dic
		SaveFileManager.world2_level2_dic = save_data.world2_level2_dic
		SaveFileManager.world2_level3_dic = save_data.world2_level3_dic
		SaveFileManager.world2_boss_dic = save_data.world2_boss_dic
		SaveFileManager.world_unlocks_dic = save_data.world_unlocks_dic

func save_game():
	save_data.currentworld = SaveFileManager.currentworld
	save_data.currentplayerlives = SaveFileManager.currentplayerlives
	save_data.currentplayerlivest = SaveFileManager.currentplayerlivest
	save_data.maxcurrentlives = SaveFileManager.maxcurrentlives
	save_data.trianglestotal = SaveFileManager.trianglestotal
	save_data.trianglestotalt = SaveFileManager.trianglestotalt
	save_data.trianglestotalh = SaveFileManager.trianglestotalh
	save_data.maxtrianglestotal = SaveFileManager.maxtrianglestotal
	save_data.data_dic = SaveFileManager.data_dic
	save_data.world1_tutorial_dic = SaveFileManager.world1_tutorial_dic
	save_data.world1_level1_dic = SaveFileManager.world1_level1_dic
	save_data.world1_level2_dic = SaveFileManager.world1_level2_dic
	save_data.world1_boss_dic = SaveFileManager.world1_boss_dic
	save_data.world2_level1_dic = SaveFileManager.world2_level1_dic
	save_data.world2_level2_dic = SaveFileManager.world2_level2_dic
	save_data.world2_level3_dic = SaveFileManager.world2_level3_dic
	save_data.world2_boss_dic = SaveFileManager.world2_boss_dic
	save_data.world_unlocks_dic = SaveFileManager.world_unlocks_dic
	ResourceSaver.save(save_data, save_game_path + save_game_name)

func reset_save():
	SaveFileManager.currentworld = save_data.currentworld
	SaveFileManager.currentplayerlives = save_data.currentplayerlives
	SaveFileManager.currentplayerlivest = save_data.currentplayerlivest
	SaveFileManager.maxcurrentlives = save_data.maxcurrentlives
	SaveFileManager.trianglestotal = save_data.trianglestotal
	SaveFileManager.trianglestotalt = save_data.trianglestotalt
	SaveFileManager.trianglestotalh = save_data.trianglestotalh
	SaveFileManager.maxtrianglestotal = save_data.maxtrianglestotal
	SaveFileManager.data_dic = save_data.data_dic
	SaveFileManager.world1_tutorial_dic = save_data.world1_tutorial_dic
	SaveFileManager.world1_level1_dic = save_data.world1_level1_dic
	SaveFileManager.world1_level2_dic = save_data.world1_level2_dic
	SaveFileManager.world1_boss_dic = save_data.world1_boss_dic
	SaveFileManager.world2_level1_dic = save_data.world2_level1_dic
	SaveFileManager.world2_level2_dic = save_data.world2_level2_dic
	SaveFileManager.world2_level3_dic = save_data.world2_level3_dic
	SaveFileManager.world2_boss_dic = save_data.world2_boss_dic
	SaveFileManager.world_unlocks_dic = save_data.world_unlocks_dic
