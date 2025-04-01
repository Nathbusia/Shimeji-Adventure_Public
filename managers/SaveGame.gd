extends Node

var save_game_path = "user://savefiles/"
var save_game_name = "shime_story_savefile1.tres"
var save_game_name_file2 = "shime_story_savefile2.tres"
var save_game_name_file3 = "shime_story_savefile3.tres"

var save_data: SaveDataResource = SaveDataResource.new()
var save_data2: SaveDataTwoResource = SaveDataTwoResource.new()
var save_data3: SaveDataThreeResource = SaveDataThreeResource.new()

func _ready() -> void:
	verify_save_directory(save_game_path)

func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)

func load_game():
	if FileAccess.file_exists(save_game_path + save_game_name):
		save_data = ResourceLoader.load(save_game_path + save_game_name).duplicate(true)
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
	if FileAccess.file_exists(save_game_path + save_game_name_file2):
		save_data2 = ResourceLoader.load(save_game_path + save_game_name_file2).duplicate(true)
		SaveFileManager2.currentplayerlives = save_data2.currentplayerlives
		SaveFileManager2.currentplayerlivest = save_data2.currentplayerlivest
		SaveFileManager2.maxcurrentlives = save_data2.maxcurrentlives
		SaveFileManager2.trianglestotal = save_data2.trianglestotal
		SaveFileManager2.trianglestotalt = save_data2.trianglestotalt
		SaveFileManager2.trianglestotalh = save_data2.trianglestotalh
		SaveFileManager2.maxtrianglestotal = save_data2.maxtrianglestotal
		SaveFileManager2.data_dic = save_data2.data_dic
		SaveFileManager2.world1_tutorial_dic = save_data2.world1_tutorial_dic
		SaveFileManager2.world1_level1_dic = save_data2.world1_level1_dic
		SaveFileManager2.world1_level2_dic = save_data2.world1_level2_dic
		SaveFileManager2.world1_boss_dic = save_data2.world1_boss_dic
	if FileAccess.file_exists(save_game_path + save_game_name_file3):
		save_data3 = ResourceLoader.load(save_game_path + save_game_name_file3).duplicate(true)
		SaveFileManager3.currentplayerlives = save_data3.currentplayerlives
		SaveFileManager3.currentplayerlivest = save_data3.currentplayerlivest
		SaveFileManager3.maxcurrentlives = save_data3.maxcurrentlives
		SaveFileManager3.trianglestotal = save_data3.trianglestotal
		SaveFileManager3.trianglestotalt = save_data3.trianglestotalt
		SaveFileManager3.trianglestotalh = save_data3.trianglestotalh
		SaveFileManager3.maxtrianglestotal = save_data3.maxtrianglestotal
		SaveFileManager3.data_dic = save_data3.data_dic
		SaveFileManager3.world1_tutorial_dic = save_data3.world1_tutorial_dic
		SaveFileManager3.world1_level1_dic = save_data3.world1_level1_dic
		SaveFileManager3.world1_level2_dic = save_data3.world1_level2_dic
		SaveFileManager3.world1_boss_dic = save_data3.world1_boss_dic

func save_game():
	if ModeManager.is_savefile1:
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
		ResourceSaver.save(save_data, save_game_path + save_game_name)
	if ModeManager.is_savefile2:
		save_data2.currentplayerlives = SaveFileManager2.currentplayerlives
		save_data2.currentplayerlivest = SaveFileManager2.currentplayerlivest
		save_data2.maxcurrentlives = SaveFileManager2.maxcurrentlives
		save_data2.trianglestotal = SaveFileManager2.trianglestotal
		save_data2.trianglestotalt = SaveFileManager2.trianglestotalt
		save_data2.trianglestotalh = SaveFileManager2.trianglestotalh
		save_data2.maxtrianglestotal = SaveFileManager2.maxtrianglestotal
		save_data2.data_dic = SaveFileManager2.data_dic
		save_data2.world1_tutorial_dic = SaveFileManager2.world1_tutorial_dic
		save_data2.world1_level1_dic = SaveFileManager2.world1_level1_dic
		save_data2.world1_level2_dic = SaveFileManager2.world1_level2_dic
		save_data2.world1_boss_dic = SaveFileManager2.world1_boss_dic
		ResourceSaver.save(save_data2, save_game_path + save_game_name_file2)
	if ModeManager.is_savefile3:
		save_data3.currentplayerlives = SaveFileManager3.currentplayerlives
		save_data3.currentplayerlivest = SaveFileManager3.currentplayerlivest
		save_data3.maxcurrentlives = SaveFileManager3.maxcurrentlives
		save_data3.trianglestotal = SaveFileManager3.trianglestotal
		save_data3.trianglestotalt = SaveFileManager3.trianglestotalt
		save_data3.trianglestotalh = SaveFileManager3.trianglestotalh
		save_data3.maxtrianglestotal = SaveFileManager3.maxtrianglestotal
		save_data3.data_dic = SaveFileManager3.data_dic
		save_data3.world1_tutorial_dic = SaveFileManager3.world1_tutorial_dic
		save_data3.world1_level1_dic = SaveFileManager3.world1_level1_dic
		save_data3.world1_level2_dic = SaveFileManager3.world1_level2_dic
		save_data3.world1_boss_dic = SaveFileManager3.world1_boss_dic
		ResourceSaver.save(save_data3, save_game_path + save_game_name_file3)
