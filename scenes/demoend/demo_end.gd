extends Node2D
@onready var continue_button: TextureButton = $Continue_Button
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select

var haschoosed = false
var has_hoverplayed = false

func _ready():
	DiscordRPC.state = "Finished the Demo"
	DiscordRPC.details = ""
	DiscordRPC.refresh()

func _process(_delta):
	if continue_button.is_hovered() && !haschoosed:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
	else:
		has_hoverplayed = false


func _on_continue_button_pressed() -> void:
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
	select.play()
	ModeManager.in_gameplay = false
	LoadManager.load_scene("res://scenes/menu/title_screen.tscn")
	ModeManager.is_story = false
	LevelsManager.is_bossbattle = false
