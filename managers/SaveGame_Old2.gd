extends Node

var save_game_path = "user://savefiles/"
var save_game_name = "shime_story_savefile1.tres"
var save_game_name_file2 = "shime_story_savefile2.tres"
var save_game_name_file3 = "shime_story_savefile3.tres"

var save_data: SaveDataResource = SaveDataResource.new()

func _ready() -> void:
	verify_save_directory(save_game_path)

func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)

func load_game():
	if FileAccess.file_exists(save_game_path + save_game_name):
		save_data = ResourceLoader.load(save_game_path + save_game_name).duplicate(true)
		SaveFileManager.data_dic = save_data.data_dic
		SaveFileManager.world1_tutorial_dic = save_data.world1_tutorial_dic
		SaveFileManager.world1_level1_dic = save_data.world1_level1_dic
		SaveFileManager.world1_level2_dic = save_data.world1_level2_dic
		SaveFileManager.world1_boss_dic = save_data.world1_boss_dic
	if FileAccess.file_exists(save_game_path + save_game_name_file2):
		save_data = ResourceLoader.load(save_game_path + save_game_name_file2).duplicate(true)
		SaveFileManager.data_dic = save_data.data_dic
		SaveFileManager.world1_tutorial_dic = save_data.world1_tutorial_dic
		SaveFileManager.world1_level1_dic = save_data.world1_level1_dic
		SaveFileManager.world1_level2_dic = save_data.world1_level2_dic
		SaveFileManager.world1_boss_dic = save_data.world1_boss_dic
	if FileAccess.file_exists(save_game_path + save_game_name_file3):
		save_data = ResourceLoader.load(save_game_path + save_game_name_file3).duplicate(true)
		SaveFileManager.data_dic = save_data.data_dic
		SaveFileManager.world1_tutorial_dic = save_data.world1_tutorial_dic
		SaveFileManager.world1_level1_dic = save_data.world1_level1_dic
		SaveFileManager.world1_level2_dic = save_data.world1_level2_dic
		SaveFileManager.world1_boss_dic = save_data.world1_boss_dic

func save_game():
	save_data.data_dic = SaveFileManager.data_dic
	save_data.world1_tutorial_dic = SaveFileManager.world1_tutorial_dic
	save_data.world1_level1_dic = SaveFileManager.world1_level1_dic
	save_data.world1_level2_dic = SaveFileManager.world1_level2_dic
	save_data.world1_boss_dic = SaveFileManager.world1_boss_dic
	if ModeManager.is_savefile1:
		ResourceSaver.save(save_data, save_game_path + save_game_name)
	if ModeManager.is_savefile2:
		ResourceSaver.save(save_data, save_game_path + save_game_name_file2)
	if ModeManager.is_savefile3:
		ResourceSaver.save(save_data, save_game_path + save_game_name_file3)
