extends Node2D

@onready var back_button: TextureButton = $BACK_Button
@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover

@onready var save_file_1: TextureButton = $SaveFIleButtons/SaveFile1
@onready var save_file_2: TextureButton = $SaveFIleButtons/SaveFile2
@onready var save_file_3: TextureButton = $SaveFIleButtons/SaveFile3
@onready var save_info1: Label = $SaveFIleButtons/SaveFile1/SaveInfo
@onready var save_info2: Label = $SaveFIleButtons/SaveFile2/SaveInfo
@onready var save_info3: Label = $SaveFIleButtons/SaveFile3/SaveInfo

@onready var new_game_screen: Panel = $NewGameScreen
@onready var current_save_screen: Panel = $CurrentSaveScreen

@onready var save_name: Label = $CurrentSaveScreen/InfoBG/SaveName
@onready var world_text: Label = $CurrentSaveScreen/InfoBG/WorldText
@onready var lives_count: Label = $CurrentSaveScreen/InfoBG/LivesCount
@onready var tri_amount: Label = $CurrentSaveScreen/InfoBG/TriAmount


var alreadysave = false
var in_currentsaveinfo = false
var can_choose = true
var has_hoverplayed = false
var has_hovertext = false
var choose_savefile1
var choose_savefile2
var choose_savefile3
var has_clicked

func _ready() -> void:
	DiscordRPC.state = "In the Story Mode Menu"
	DiscordRPC.details = ""
	DiscordRPC.refresh()
	SaveGame.load_game()

func _process(delta):
	if FileAccess.file_exists("user://savefiles/shime_story_savefile1.tres"):
		save_info1.text = "Continue"
	if FileAccess.file_exists("user://savefiles/shime_story_savefile2.tres"):
		save_info2.text = "Continue"
	if FileAccess.file_exists("user://savefiles/shime_story_savefile3.tres"):
		save_info3.text = "Continue"
	
	if save_file_1.is_hovered() && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
			save_info1.add_theme_color_override("font_outline_color",Color.ORANGE)
	elif save_file_2.is_hovered() && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
			save_info2.add_theme_color_override("font_outline_color",Color.ORANGE)
	elif save_file_3.is_hovered() && can_choose:
		if !has_hoverplayed:
			hover.play()
			has_hoverplayed = true
			save_info3.add_theme_color_override("font_outline_color",Color.ORANGE)
	else:
		if !save_file_1.is_hovered():
			save_info1.add_theme_color_override("font_outline_color",Color.BLACK)
		if !save_file_2.is_hovered():
			save_info2.add_theme_color_override("font_outline_color",Color.BLACK)
		if !save_file_3.is_hovered():
			save_info3.add_theme_color_override("font_outline_color",Color.BLACK)
		has_hoverplayed = false

func _on_back_button_pressed() -> void:
	deselect.play()
	LoadManager.load_scene("res://scenes/menu/main_menu.tscn")
	ModeManager.is_story = false
	ModeManager.isin_worldmap = false


func _on_save_file_1_pressed() -> void:
	save_info1.add_theme_color_override("font_outline_color",Color.ORANGE_RED)
	select.play()
	choose_savefile1 = true
	if !FileAccess.file_exists("user://savefiles/shime_story_savefile1.tres"):
		new_game_screen.show()
	else:
		current_save_screen.show()
		save_name.text = "Save File 1"
		world_text.text = SaveFileManager.data_dic["currentworld"]
		lives_count.text = str(SaveFileManager.data_dic["maxlives"])
		tri_amount.text = str(SaveFileManager.data_dic["maxtriangles"])
		


func _on_save_file_2_pressed() -> void:
	save_info2.add_theme_color_override("font_outline_color",Color.ORANGE_RED)
	select.play()
	choose_savefile2 = true
	if !FileAccess.file_exists("user://savefiles/shime_story_savefile2.tres"):
		new_game_screen.show()
	else:
		current_save_screen.show()
		save_name.text = "Save File 2"
		world_text.text = SaveFileManager2.data_dic["currentworld"]
		lives_count.text = str(SaveFileManager2.data_dic["maxlives"])
		tri_amount.text = str(SaveFileManager2.data_dic["maxtriangles"])


func _on_save_file_3_pressed() -> void:
	save_info3.add_theme_color_override("font_outline_color",Color.ORANGE_RED)
	select.play()
	choose_savefile3 = true
	if !FileAccess.file_exists("user://savefiles/shime_story_savefile3.tres"):
		new_game_screen.show()
	else:
		current_save_screen.show()
		save_name.text = "Save File 3"
		world_text.text = SaveFileManager3.data_dic["currentworld"]
		lives_count.text = str(SaveFileManager3.data_dic["maxlives"])
		tri_amount.text = str(SaveFileManager3.data_dic["maxtriangles"])

func _on_yes_button_pressed() -> void:
	if choose_savefile1:
		ModeManager.is_savefile1 = true
	if choose_savefile2:
		ModeManager.is_savefile2 = true
	if choose_savefile3:
		ModeManager.is_savefile3 = true
	ModeManager.isin_worldmap = true
	LoadManager.load_scene("res://scenes/menu/character_select.tscn")
	select.play()


func _on_no_button_pressed() -> void:
	deselect.play()
	new_game_screen.hide()
	choose_savefile1 = false
	choose_savefile2 = false
	choose_savefile3 = false


func _on_back_button_current_pressed() -> void:
	deselect.play()
	current_save_screen.hide()
	choose_savefile1 = false
	choose_savefile2 = false
	choose_savefile3 = false


func _on_go_button_pressed() -> void:
	if choose_savefile1:
		ModeManager.is_savefile1 = true
	if choose_savefile2:
		ModeManager.is_savefile2 = true
	if choose_savefile3:
		ModeManager.is_savefile3 = true
	ModeManager.isin_worldmap = true
	LoadManager.load_scene("res://scenes/menu/character_select.tscn")
	select.play()
