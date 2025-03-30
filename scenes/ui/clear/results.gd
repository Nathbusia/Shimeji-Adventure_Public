extends Node

@onready var pause_panel: Panel = %PausePanel
@onready var results_panel: Panel = $ResultsPanel
@onready var bg_anim: AnimationPlayer = $ResultsPanel/ResultsBG/BGAnim
@onready var results_anim: AnimationPlayer = $ResultsPanel/ResultsText/ResultsAnim
@onready var points_apperance: AnimationPlayer = $ResultsPanel/PointsApperance
@onready var buttons_apperance: AnimationPlayer = $ResultsPanel/ButtonsApperance
@onready var triangle_counter_apperance: AnimationPlayer = $ResultsPanel/SecretUIBase/TriangleCounterApperance
@onready var game_manager: GameManager = $"../../GameManager"
@onready var score_numbers_h: AnimatedSprite2D = $ResultsPanel/Numbers/Score_NumbersH
@onready var score_numbers_t: AnimatedSprite2D = $ResultsPanel/Numbers/Score_NumbersT
@onready var score_numbers_u: AnimatedSprite2D = $ResultsPanel/Numbers/Score_NumbersU
@onready var triangle_counter_1: AnimatedSprite2D = $ResultsPanel/SecretUIBase/TriangleCounter1
@onready var triangle_counter_2: AnimatedSprite2D = $ResultsPanel/SecretUIBase/TriangleCounter2
@onready var triangle_counter_3: AnimatedSprite2D = $ResultsPanel/SecretUIBase/TriangleCounter3
@onready var triangle_counter_4: AnimatedSprite2D = $ResultsPanel/SecretUIBase/TriangleCounter4
@onready var results_show: Timer = $ResultsShow
@onready var change_level: TextureButton = $ResultsPanel/ChangeLevel
@onready var continue_button: TextureButton = $ResultsPanel/Continue


var has_shown = false

var points = 0
var pointst = 0
var pointsh = 0
var secretfound = 0

func _ready() -> void:
	if ModeManager.is_story:
		change_level.hide()
	if LevelsManager.is_mod:
		continue_button.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_results_panel_visibility_changed() -> void:
	if results_panel.show:
		bg_anim.play("bgpopin")
		results_anim.play("resultspopin")
		points_apperance.play("pointspopin")
		buttons_apperance.play("buttonspopin")
		triangle_counter_apperance.play("tripopin")

func add_point():
	points += 1
	if points == 1 or points == 2 or points == 3 or points == 4 or points == 5 or points == 6 or points == 7 or points == 8 or points == 9:
		score_numbers_u.animation = str(points)
	if points == 10 or points == 20 or points == 30 or points == 40 or points == 50 or points == 60 or points == 70 or points == 80 or points == 90:
		pointst += 1
		score_numbers_t.animation = str(pointst)
		points = 0
		score_numbers_u.animation = str(points)
	if points == 100 or points == 200 or points == 300 or points == 400 or points == 500 or points == 600 or points == 700 or points == 800 or points == 900:
		pointsh += 1
		score_numbers_h.animation = str(pointsh)
		pointst = 0
		score_numbers_t.animation = str(pointst)
		points = 0
		score_numbers_u.animation = str(points)

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

func _on_replay_pressed() -> void:
	results_panel.hide()
	get_tree().reload_current_scene()



func _on_continue_pressed() -> void:
	if ModeManager.is_story:
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
		if LevelsManager.levelname == "boss_monstequare":
			LoadManager.load_scene("res://scenes/cutscenes/world1/world1_ending.tscn")
		else:
			ModeManager.isin_worldmap = true
			LoadManager.load_scene("res://scenes/worldmap/worldmap_world1.tscn")
		results_panel.hide()
	else:
		match LevelsManager.levelname:
			"testlevel1":
				LoadManager.load_scene("res://scenes/levels/testlevel/testlevel2.tscn")
				LevelsManager.levelname = "testlevel2"
				LevelsManager.is_bossbattle = false
			"testlevel2":
				LoadManager.load_scene("res://scenes/demoend/demo_end_testworld.tscn")
			"tutorial":
				LoadManager.load_scene("res://scenes/levels/world1/level1.tscn")
				LevelsManager.levelname = "level1"
				LevelsManager.is_bossbattle = false
			"level1":
				LoadManager.load_scene("res://scenes/levels/world1/level2.tscn")
				LevelsManager.levelname = "level2"
				LevelsManager.is_bossbattle = false
			"level2":
				LoadManager.load_scene("res://scenes/levels/world1/boss_monstequare.tscn")
				LevelsManager.levelname = "boss_monstequare"
				LevelsManager.is_bossbattle = true
			"boss_monstequare":
				LoadManager.load_scene("res://scenes/demoend/demo_end.tscn")
		results_panel.hide()



func _on_change_level_pressed() -> void:
	LevelsManager.is_mod = false
	LoadManager.load_scene("res://scenes/menu/level_select.tscn")
	results_panel.hide()


func _on_quit_pressed() -> void:
	if ModeManager.is_story:
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
		results_panel.hide()
		ModeManager.isin_worldmap = false
		LoadManager.load_scene("res://scenes/menu/story_save_file_select.tscn")
	else:
		LevelsManager.is_mod = false
		ModeManager.in_gameplay = false
		LoadManager.load_scene("res://scenes/menu/main_menu.tscn")
		results_panel.hide()
