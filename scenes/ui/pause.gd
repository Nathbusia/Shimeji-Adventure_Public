extends Node

@onready var pause_panel: Panel = %PausePanel
@onready var level_bgm: AudioStreamPlayer = $"../../SceneObjects/Level_BGM"
@onready var pause_sound: AudioStreamPlayer = $PausePanel/PauseSound
@onready var game_manager: GameManager = $"../../GameManager"
@onready var triangle_counter_1: AnimatedSprite2D = $PausePanel/SecretUIPause/TriangleCounter1
@onready var triangle_counter_2: AnimatedSprite2D = $PausePanel/SecretUIPause/TriangleCounter2
@onready var triangle_counter_3: AnimatedSprite2D = $PausePanel/SecretUIPause/TriangleCounter3
@onready var triangle_counter_4: AnimatedSprite2D = $PausePanel/SecretUIPause/TriangleCounter4


@onready var Settings: Control

var secretfound = 0
var level_complete = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("pause")
	if level_complete:
		return #You won't be able to paused after completing a level.
	else:
		if (esc_pressed == true && !game_manager.is_incutscene):
			get_tree().paused = true
			pause_sound.play()
			pause_panel.show()


func _on_resume_pressed() -> void:
	pause_panel.hide()
	get_tree().paused = false


func _on_restart_pressed() -> void:
	pause_panel.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()

func levelcomplete():
	level_complete = true

func secretfounded():
	secretfound += 1
	if secretfound == 1:
		triangle_counter_1.animation = "found"
	if secretfound == 2:
		triangle_counter_2.animation = "found" 
	if secretfound == 3:
		triangle_counter_3.animation = "found" 
	if secretfound == 4:
		triangle_counter_4.animation = "found" 

func _on_quit_pressed() -> void:
	pause_panel.hide()
	if ModeManager.is_story:
		if ModeManager.isin_worldmap:
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
			if ModeManager.is_savefile2:
				SaveFileManager2.update_data(
				LevelsManager.worldname, 
				SaveFileManager2.currentplayerlives,
				SaveFileManager2.currentplayerlivest,
				SaveFileManager2.maxcurrentlives,
				SaveFileManager2.trianglestotal,
				SaveFileManager2.trianglestotalt,
				SaveFileManager2.trianglestotalh,
				SaveFileManager2.maxtrianglestotal)
				
				SaveFileManager2.currentplayerlives = SaveFileManager2.data_dic["currentlives"]
				SaveFileManager2.currentplayerlivest = SaveFileManager2.data_dic["currentlivest"]
				SaveFileManager2.maxcurrentlives = SaveFileManager2.data_dic["maxlives"]
				SaveFileManager2.trianglestotal = SaveFileManager2.data_dic["trianglestotal"]
				SaveFileManager2.trianglestotalt = SaveFileManager2.data_dic["trianglestotalt"]
				SaveFileManager2.trianglestotalh = SaveFileManager2.data_dic["trianglestotalh"]
				SaveFileManager2.maxtrianglestotal = SaveFileManager2.data_dic["maxtriangles"]
				
				SaveFileManager2.update_w1_tut(
				SaveFileManager2.world1_tutorial_dic["trianglecollected1"], 
				SaveFileManager2.world1_tutorial_dic["trianglecollected2"], 
				SaveFileManager2.world1_tutorial_dic["trianglecollected3"],
				SaveFileManager2.world1_tutorial_dic["trianglecollected4"],
				SaveFileManager2.world1_tutorial_dic["hasbeencompleted"])

				SaveFileManager2.update_w1_lv1(
				SaveFileManager2.world1_level1_dic["unlocked"],
				SaveFileManager2.world1_level1_dic["trianglecollected1"], 
				SaveFileManager2.world1_level1_dic["trianglecollected2"], 
				SaveFileManager2.world1_level1_dic["trianglecollected3"],
				SaveFileManager2.world1_level1_dic["trianglecollected4"],
				SaveFileManager2.world1_level1_dic["hasbeencompleted"])

				SaveFileManager2.update_w1_lv2(
				SaveFileManager2.world1_level2_dic["unlocked"],
				SaveFileManager2.world1_level2_dic["trianglecollected1"], 
				SaveFileManager2.world1_level2_dic["trianglecollected2"], 
				SaveFileManager2.world1_level2_dic["trianglecollected3"],
				SaveFileManager2.world1_level2_dic["trianglecollected4"],
				SaveFileManager2.world1_level2_dic["hasbeencompleted"])

				SaveFileManager2.update_w1_boss(
				SaveFileManager2.world1_boss_dic["unlocked"],
				SaveFileManager2.world1_boss_dic["hasbeencompleted"])
			if ModeManager.is_savefile3:
				SaveFileManager3.update_data(
				LevelsManager.worldname, 
				SaveFileManager3.currentplayerlives,
				SaveFileManager3.currentplayerlivest,
				SaveFileManager3.maxcurrentlives,
				SaveFileManager3.trianglestotal,
				SaveFileManager3.trianglestotalt,
				SaveFileManager3.trianglestotalh,
				SaveFileManager3.maxtrianglestotal)
				
				SaveFileManager3.currentplayerlives = SaveFileManager3.data_dic["currentlives"]
				SaveFileManager3.currentplayerlivest = SaveFileManager3.data_dic["currentlivest"]
				SaveFileManager3.maxcurrentlives = SaveFileManager3.data_dic["maxlives"]
				SaveFileManager3.trianglestotal = SaveFileManager3.data_dic["trianglestotal"]
				SaveFileManager3.trianglestotalt = SaveFileManager3.data_dic["trianglestotalt"]
				SaveFileManager3.trianglestotalh = SaveFileManager3.data_dic["trianglestotalh"]
				SaveFileManager3.maxtrianglestotal = SaveFileManager3.data_dic["maxtriangles"]
				
				SaveFileManager3.update_w1_tut(
				SaveFileManager3.world1_tutorial_dic["trianglecollected1"], 
				SaveFileManager3.world1_tutorial_dic["trianglecollected2"], 
				SaveFileManager3.world1_tutorial_dic["trianglecollected3"],
				SaveFileManager3.world1_tutorial_dic["trianglecollected4"],
				SaveFileManager3.world1_tutorial_dic["hasbeencompleted"])

				SaveFileManager3.update_w1_lv1(
				SaveFileManager3.world1_level1_dic["unlocked"],
				SaveFileManager3.world1_level1_dic["trianglecollected1"], 
				SaveFileManager3.world1_level1_dic["trianglecollected2"], 
				SaveFileManager3.world1_level1_dic["trianglecollected3"],
				SaveFileManager3.world1_level1_dic["trianglecollected4"],
				SaveFileManager3.world1_level1_dic["hasbeencompleted"])

				SaveFileManager3.update_w1_lv2(
				SaveFileManager3.world1_level2_dic["unlocked"],
				SaveFileManager3.world1_level2_dic["trianglecollected1"], 
				SaveFileManager3.world1_level2_dic["trianglecollected2"], 
				SaveFileManager3.world1_level2_dic["trianglecollected3"],
				SaveFileManager3.world1_level2_dic["trianglecollected4"],
				SaveFileManager3.world1_level2_dic["hasbeencompleted"])

				SaveFileManager3.update_w1_boss(
				SaveFileManager3.world1_boss_dic["unlocked"],
				SaveFileManager3.world1_boss_dic["hasbeencompleted"])
			SaveGame.save_game()
			ModeManager.is_savefile1 = false
			ModeManager.is_savefile2 = false
			ModeManager.is_savefile3 = false
			ModeManager.in_gameplay = false
			ModeManager.isin_worldmap = false
			LoadManager.load_scene("res://scenes/menu/story_save_file_select.tscn")
		else:
			ModeManager.isin_worldmap = true
			LoadManager.load_scene("res://scenes/worldmap/worldmap_world1.tscn")
	else:
		LevelsManager.is_mod = false
		ModeManager.in_gameplay = false
		LoadManager.load_scene("res://scenes/menu/level_select.tscn")

func _on_settings_pressed() -> void:
	var scene =  get_node("/root/Node/UI")
	Settings = load("res://scenes/menu/settings.tscn").instantiate()
	scene.add_child(Settings)
	
