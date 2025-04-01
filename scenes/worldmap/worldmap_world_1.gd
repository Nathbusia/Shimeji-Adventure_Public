extends Node

@onready var connect_ground_start: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/ConnectGroundStart
@onready var connect_ground_end: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/ConnectGroundEnd

@onready var connect_groundtut: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Tutorial/ConnectGround
@onready var connect_groundlvl1: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Level1/ConnectGround
@onready var connect_groundlvl2: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Level2/ConnectGround

@onready var bubble_anim_tut: AnimationPlayer = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Tutorial/LevelSpotSprite/BubbleAnim
@onready var bubble_anim_lvl1: AnimationPlayer = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Level1/LevelSpotSprite/BubbleAnim
@onready var bubble_anim_lvl2: AnimationPlayer = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Level2/LevelSpotSprite/BubbleAnim
@onready var bubble_anim_boss: AnimationPlayer = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Boss/LevelSpotSprite/BubbleAnim

@onready var score_numbers_life_t: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeT
@onready var score_numbers_life_dark_t: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkT
@onready var score_numbers_life_u: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeU
@onready var score_numbers_life_dark_u: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkU

@onready var tri_amount_numbers_u: AnimatedSprite2D = $UI/GUI/TrianglesTotal/TrianglesTotalBG/TriAmount_NumbersU
@onready var tri_amount_numbers_t: AnimatedSprite2D = $UI/GUI/TrianglesTotal/TrianglesTotalBG/TriAmount_NumbersT
@onready var tri_amount_numbers_h: AnimatedSprite2D = $UI/GUI/TrianglesTotal/TrianglesTotalBG/TriAmount_NumbersH

@onready var select: AudioStreamPlayer2D = $ButtonSounds/Select
@onready var deselect: AudioStreamPlayer2D = $ButtonSounds/Deselect
@onready var hover: AudioStreamPlayer2D = $ButtonSounds/Hover
@onready var bubble_pop_in: AudioStreamPlayer2D = $ButtonSounds/BubblePopIn
@onready var go: AudioStreamPlayer2D = $ButtonSounds/Go

@onready var level_info_panel: Panel = $UI/LevelInfo/LevelInfoPanel
@onready var level_thumbnail: TextureRect = $UI/LevelInfo/LevelInfoPanel/ResultsBG/LevelThumbnail
@onready var level_name: Label = $UI/LevelInfo/LevelInfoPanel/ResultsBG/LevelName
@onready var level_description: Label = $UI/LevelInfo/LevelInfoPanel/ResultsBG/DescriptionThing/LevelDescription

@onready var unlock_wall_level_1: CollisionShape2D = $Background/Ground/UnlockWall_Level1
@onready var unlock_wall_level_2: CollisionShape2D = $Background/Ground/UnlockWall_Level2
@onready var unlock_wall_boss: CollisionShape2D = $Background/Ground/UnlockWall_Boss

@onready var trigger_spot_tut: Area2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Tutorial/TriggerSpotTut
@onready var trigger_spot_level_1: Area2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Level1/TriggerSpotLevel1
@onready var trigger_spot_level_2: Area2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Level2/TriggerSpotLevel2
@onready var trigger_spot_boss: Area2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Boss/TriggerSpotBoss

@onready var level_spot_sprite_tut: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Tutorial/LevelSpotSprite
@onready var level_spot_sprite_lv1: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Level1/LevelSpotSprite
@onready var level_spot_sprite_lv2: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Level2/LevelSpotSprite
@onready var level_spot_sprite_boss: AnimatedSprite2D = $SceneObjects/WorldMap_LevelSpots/LevelSpot_Boss/LevelSpotSprite
@onready var game_manager: GameManager = $GameManager

var has_hoverplayed = false
var is_inlevelinfo
var on_tutorial
var on_level1
var on_level2
var on_boss
var can_choose = true
var curLevel = ""
var curWorld = "world1"
var level_path = ""

func _ready() -> void:
	print_tree_pretty()
	LevelsManager.worldname = "world1"
	DiscordRPC.details = "World Map in: " + LevelsManager.worldname + ""
	DiscordRPC.state = "Playing as: " + CharactersManager.characterdisplay + ""
	DiscordRPC.refresh()
	ModeManager.isin_worldmap = true
	if ModeManager.is_savefile1:
		if SaveFileManager.world1_level1_dic["unlocked"]:
			connect_groundtut.play("avaliable")
			level_spot_sprite_lv1.play("available")
			level_spot_sprite_tut.play("clear")
			unlock_wall_level_1.disabled = true
		if SaveFileManager.world1_level2_dic["unlocked"]:
			connect_groundlvl1.play("avaliable")
			level_spot_sprite_lv2.play("available")
			level_spot_sprite_lv1.play("clear")
			unlock_wall_level_2.disabled = true
		if SaveFileManager.world1_boss_dic["unlocked"]:
			connect_groundlvl2.play("avaliable")
			if SaveFileManager.world1_boss_dic["hasbeencompleted"]:
				level_spot_sprite_boss.play("clear")
			else:
				level_spot_sprite_boss.play("available")
			level_spot_sprite_lv2.play("clear")
			unlock_wall_boss.disabled = true
			
			SaveFileManager.currentplayerlives = SaveFileManager.data_dic["currentlives"]
			SaveFileManager.currentplayerlivest = SaveFileManager.data_dic["currentlivest"]
			SaveFileManager.maxcurrentlives = SaveFileManager.data_dic["maxlives"]
			SaveFileManager.trianglestotal = SaveFileManager.data_dic["trianglestotal"]
			SaveFileManager.trianglestotalt = SaveFileManager.data_dic["trianglestotalt"]
			SaveFileManager.trianglestotalh = SaveFileManager.data_dic["trianglestotalh"]
			SaveFileManager.maxtrianglestotal = SaveFileManager.data_dic["maxtriangles"]
		
		if SaveFileManager.trianglestotal == 1 or SaveFileManager.trianglestotal == 2 or SaveFileManager.trianglestotal == 3 or SaveFileManager.trianglestotal == 4 or SaveFileManager.trianglestotal == 5 or SaveFileManager.trianglestotal == 6 or SaveFileManager.trianglestotal == 7 or SaveFileManager.trianglestotal == 8 or SaveFileManager.trianglestotal == 9:
			tri_amount_numbers_u.animation = str(SaveFileManager.trianglestotal)
		if SaveFileManager.trianglestotalt == 1 or SaveFileManager.trianglestotalt == 2 or SaveFileManager.trianglestotalt == 3 or SaveFileManager.trianglestotalt == 4 or SaveFileManager.trianglestotalt == 5 or SaveFileManager.trianglestotalt == 6 or SaveFileManager.trianglestotalt == 7 or SaveFileManager.trianglestotalt == 8 or SaveFileManager.trianglestotalt == 9:
			tri_amount_numbers_t.animation = str(SaveFileManager.trianglestotalt)
		if SaveFileManager.trianglestotalh == 1 or SaveFileManager.trianglestotalh == 2 or SaveFileManager.trianglestotalh == 3 or SaveFileManager.trianglestotalh == 4 or SaveFileManager.trianglestotalh == 5 or SaveFileManager.trianglestotalh == 6 or SaveFileManager.trianglestotalh == 7 or SaveFileManager.trianglestotalh == 8 or SaveFileManager.trianglestotalh == 9:
			tri_amount_numbers_h.animation = str(SaveFileManager.trianglestotalh)
			
		if SaveFileManager.currentplayerlives == 1 or SaveFileManager.currentplayerlives == 2 or SaveFileManager.currentplayerlives == 3 or SaveFileManager.currentplayerlives == 4 or SaveFileManager.currentplayerlives == 5 or SaveFileManager.currentplayerlives == 6 or SaveFileManager.currentplayerlives == 7 or SaveFileManager.currentplayerlives == 8 or SaveFileManager.currentplayerlives == 9:
			score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
			score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
		if SaveFileManager.currentplayerlivest == 1 or SaveFileManager.currentplayerlivest == 2 or SaveFileManager.currentplayerlivest == 3 or SaveFileManager.currentplayerlivest == 4 or SaveFileManager.currentplayerlivest == 5 or SaveFileManager.currentplayerlivest == 6 or SaveFileManager.currentplayerlivest == 7 or SaveFileManager.currentplayerlivest == 8 or SaveFileManager.currentplayerlivest == 9:
			score_numbers_life_t.animation = str(SaveFileManager.currentplayerlivest)
			score_numbers_life_dark_t.animation = str(SaveFileManager.currentplayerlivest)

	if ModeManager.is_savefile2:
		if SaveFileManager2.world1_level1_dic["unlocked"]:
			connect_groundtut.play("avaliable")
			level_spot_sprite_lv1.play("available")
			level_spot_sprite_tut.play("clear")
			unlock_wall_level_1.disabled = true
		if SaveFileManager2.world1_level2_dic["unlocked"]:
			connect_groundlvl1.play("avaliable")
			level_spot_sprite_lv2.play("available")
			level_spot_sprite_lv1.play("clear")
			unlock_wall_level_2.disabled = true
		if SaveFileManager2.world1_boss_dic["unlocked"]:
			connect_groundlvl2.play("avaliable")
			if SaveFileManager2.world1_boss_dic["hasbeencompleted"]:
				level_spot_sprite_boss.play("clear")
			else:
				level_spot_sprite_boss.play("available")
			level_spot_sprite_lv2.play("clear")
			unlock_wall_boss.disabled = true

			SaveFileManager2.currentplayerlives = SaveFileManager2.data_dic["currentlives"]
			SaveFileManager2.currentplayerlivest = SaveFileManager2.data_dic["currentlivest"]
			SaveFileManager2.maxcurrentlives = SaveFileManager2.data_dic["maxlives"]
			SaveFileManager2.trianglestotal = SaveFileManager2.data_dic["trianglestotal"]
			SaveFileManager2.trianglestotalt = SaveFileManager2.data_dic["trianglestotalt"]
			SaveFileManager2.trianglestotalh = SaveFileManager2.data_dic["trianglestotalh"]
			SaveFileManager2.maxtrianglestotal = SaveFileManager2.data_dic["maxtriangles"]

		if SaveFileManager2.trianglestotal == 1 or SaveFileManager2.trianglestotal == 2 or SaveFileManager2.trianglestotal == 3 or SaveFileManager2.trianglestotal == 4 or SaveFileManager2.trianglestotal == 5 or SaveFileManager2.trianglestotal == 6 or SaveFileManager2.trianglestotal == 7 or SaveFileManager2.trianglestotal == 8 or SaveFileManager2.trianglestotal == 9:
			tri_amount_numbers_u.animation = str(SaveFileManager2.trianglestotal)
		if SaveFileManager2.trianglestotalt == 1 or SaveFileManager2.trianglestotalt == 2 or SaveFileManager2.trianglestotalt == 3 or SaveFileManager2.trianglestotalt == 4 or SaveFileManager2.trianglestotalt == 5 or SaveFileManager2.trianglestotalt == 6 or SaveFileManager2.trianglestotalt == 7 or SaveFileManager2.trianglestotalt == 8 or SaveFileManager2.trianglestotalt == 9:
			tri_amount_numbers_t.animation = str(SaveFileManager2.trianglestotalt)
		if SaveFileManager2.trianglestotalh == 1 or SaveFileManager2.trianglestotalh == 2 or SaveFileManager2.trianglestotalh == 3 or SaveFileManager2.trianglestotalh == 4 or SaveFileManager2.trianglestotalh == 5 or SaveFileManager2.trianglestotalh == 6 or SaveFileManager2.trianglestotalh == 7 or SaveFileManager2.trianglestotalh == 8 or SaveFileManager2.trianglestotalh == 9:
			tri_amount_numbers_h.animation = str(SaveFileManager2.trianglestotalh)
			
		if SaveFileManager2.currentplayerlives == 1 or SaveFileManager2.currentplayerlives == 2 or SaveFileManager2.currentplayerlives == 3 or SaveFileManager2.currentplayerlives == 4 or SaveFileManager2.currentplayerlives == 5 or SaveFileManager2.currentplayerlives == 6 or SaveFileManager2.currentplayerlives == 7 or SaveFileManager2.currentplayerlives == 8 or SaveFileManager2.currentplayerlives == 9:
			score_numbers_life_u.animation = str(SaveFileManager2.currentplayerlives)
			score_numbers_life_dark_u.animation = str(SaveFileManager2.currentplayerlives)
		if SaveFileManager2.currentplayerlivest == 1 or SaveFileManager2.currentplayerlivest == 2 or SaveFileManager2.currentplayerlivest == 3 or SaveFileManager2.currentplayerlivest == 4 or SaveFileManager2.currentplayerlivest == 5 or SaveFileManager2.currentplayerlivest == 6 or SaveFileManager2.currentplayerlivest == 7 or SaveFileManager2.currentplayerlivest == 8 or SaveFileManager2.currentplayerlivest == 9:
			score_numbers_life_t.animation = str(SaveFileManager2.currentplayerlivest)
			score_numbers_life_dark_t.animation = str(SaveFileManager2.currentplayerlivest)

	if ModeManager.is_savefile3:
		if SaveFileManager3.world1_level1_dic["unlocked"]:
			connect_groundtut.play("avaliable")
			level_spot_sprite_lv1.play("available")
			level_spot_sprite_tut.play("clear")
			unlock_wall_level_1.disabled = true
		if SaveFileManager3.world1_level2_dic["unlocked"]:
			connect_groundlvl1.play("avaliable")
			level_spot_sprite_lv2.play("available")
			level_spot_sprite_lv1.play("clear")
			unlock_wall_level_2.disabled = true
		if SaveFileManager3.world1_boss_dic["unlocked"]:
			connect_groundlvl2.play("avaliable")
			if SaveFileManager3.world1_boss_dic["hasbeencompleted"]:
				level_spot_sprite_boss.play("clear")
			else:
				level_spot_sprite_boss.play("available")
			level_spot_sprite_lv2.play("clear")
			unlock_wall_boss.disabled = true

			SaveFileManager3.currentplayerlives = SaveFileManager3.data_dic["currentlives"]
			SaveFileManager3.currentplayerlivest = SaveFileManager3.data_dic["currentlivest"]
			SaveFileManager3.maxcurrentlives = SaveFileManager3.data_dic["maxlives"]
			SaveFileManager3.trianglestotal = SaveFileManager3.data_dic["trianglestotal"]
			SaveFileManager3.trianglestotalt = SaveFileManager3.data_dic["trianglestotalt"]
			SaveFileManager3.trianglestotalh = SaveFileManager3.data_dic["trianglestotalh"]
			SaveFileManager3.maxtrianglestotal = SaveFileManager3.data_dic["maxtriangles"]

		if SaveFileManager3.trianglestotal == 1 or SaveFileManager3.trianglestotal == 2 or SaveFileManager3.trianglestotal == 3 or SaveFileManager3.trianglestotal == 4 or SaveFileManager3.trianglestotal == 5 or SaveFileManager3.trianglestotal == 6 or SaveFileManager3.trianglestotal == 7 or SaveFileManager3.trianglestotal == 8 or SaveFileManager3.trianglestotal == 9:
			tri_amount_numbers_u.animation = str(SaveFileManager3.trianglestotal)
		if SaveFileManager3.trianglestotalt == 1 or SaveFileManager3.trianglestotalt == 2 or SaveFileManager3.trianglestotalt == 3 or SaveFileManager3.trianglestotalt == 4 or SaveFileManager3.trianglestotalt == 5 or SaveFileManager3.trianglestotalt == 6 or SaveFileManager3.trianglestotalt == 7 or SaveFileManager3.trianglestotalt == 8 or SaveFileManager3.trianglestotalt == 9:
			tri_amount_numbers_t.animation = str(SaveFileManager3.trianglestotalt)
		if SaveFileManager3.trianglestotalh == 1 or SaveFileManager3.trianglestotalh == 2 or SaveFileManager3.trianglestotalh == 3 or SaveFileManager3.trianglestotalh == 4 or SaveFileManager3.trianglestotalh == 5 or SaveFileManager3.trianglestotalh == 6 or SaveFileManager3.trianglestotalh == 7 or SaveFileManager3.trianglestotalh == 8 or SaveFileManager3.trianglestotalh == 9:
			tri_amount_numbers_h.animation = str(SaveFileManager3.trianglestotalh)
			
		if SaveFileManager3.currentplayerlives == 1 or SaveFileManager3.currentplayerlives == 2 or SaveFileManager3.currentplayerlives == 3 or SaveFileManager3.currentplayerlives == 4 or SaveFileManager3.currentplayerlives == 5 or SaveFileManager3.currentplayerlives == 6 or SaveFileManager3.currentplayerlives == 7 or SaveFileManager3.currentplayerlives == 8 or SaveFileManager3.currentplayerlives == 9:
			score_numbers_life_u.animation = str(SaveFileManager3.currentplayerlives)
			score_numbers_life_dark_u.animation = str(SaveFileManager3.currentplayerlives)
		if SaveFileManager3.currentplayerlivest == 1 or SaveFileManager3.currentplayerlivest == 2 or SaveFileManager3.currentplayerlivest == 3 or SaveFileManager3.currentplayerlivest == 4 or SaveFileManager3.currentplayerlivest == 5 or SaveFileManager3.currentplayerlivest == 6 or SaveFileManager3.currentplayerlivest == 7 or SaveFileManager3.currentplayerlivest == 8 or SaveFileManager3.currentplayerlivest == 9:
			score_numbers_life_t.animation = str(SaveFileManager3.currentplayerlivest)
			score_numbers_life_dark_t.animation = str(SaveFileManager3.currentplayerlivest)
	SaveGame.load_game()



func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("grab"):
		if is_inlevelinfo:
			pass #So you can't press the button or any other levels until the menu's close.
		if on_tutorial:
			select.play()
			curLevel = "tutorial"
			level_path = "res://scenes/levelmanager/tutorial.tscn"
			var level = load(level_path).instantiate()
			LevelsManager.is_bossbattle = false
			add_child(level)
			level_thumbnail.texture = level.levelthumb
			LevelsManager.leveldisplay = level.levelname
			level_name.text = level.levelname
			level_description.text = level.leveldesc
			LevelsManager.levelname = curLevel
			print("Current Level is now " + curLevel + "!")
			level_info_panel.show()
			is_inlevelinfo = true
		if on_level1:
			select.play()
			curLevel = "level1"
			level_path = "res://scenes/levelmanager/level1.tscn"
			var level = load(level_path).instantiate()
			LevelsManager.is_bossbattle = false
			add_child(level)
			level_thumbnail.texture = level.levelthumb
			LevelsManager.leveldisplay = level.levelname
			level_name.text = level.levelname
			level_description.text = level.leveldesc
			LevelsManager.levelname = curLevel
			print("Current Level is now " + curLevel + "!")
			level_info_panel.show()
			is_inlevelinfo = true
		if on_level2:
			select.play()
			curLevel = "level2"
			level_path = "res://scenes/levelmanager/level2.tscn"
			var level = load(level_path).instantiate()
			LevelsManager.is_bossbattle = false
			add_child(level)
			level_thumbnail.texture = level.levelthumb
			LevelsManager.leveldisplay = level.levelname
			level_name.text = level.levelname
			level_description.text = level.leveldesc
			LevelsManager.levelname = curLevel
			print("Current Level is now " + curLevel + "!")
			level_info_panel.show()
			is_inlevelinfo = true
		if on_boss:
			select.play()
			curLevel = "boss_monstequare"
			level_path = "res://scenes/levelmanager/boss_mostequare.tscn"
			var level = load(level_path).instantiate()
			LevelsManager.is_bossbattle = true
			add_child(level)
			level_thumbnail.texture = level.levelthumb
			LevelsManager.leveldisplay = level.levelname
			level_name.text = level.levelname
			level_description.text = level.leveldesc
			LevelsManager.levelname = curLevel
			print("Current Level is now " + curLevel + "!")
			level_info_panel.show()
			is_inlevelinfo = true

func _on_trigger_spot_tut_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_tut.play("popin")
		bubble_pop_in.play()
		on_tutorial = true
			


func _on_trigger_spot_tut_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_tut.play("popout")
		on_tutorial = false


func _on_go_button_pressed() -> void:
	LevelsManager.levelname = curLevel
	LevelsManager.worldname = curWorld
	if LevelsManager.levelname == "boss_monstequare":
		ModeManager.isin_worldmap = false
		LoadManager.load_scene("res://scenes/cutscenes/world1/boss_monstequare_opening.tscn")
	else:
		LoadManager.load_scene("res://scenes/levels/" + LevelsManager.worldname + "/" + LevelsManager.levelname + ".tscn")
	select.play()
	go.play()
	level_info_panel.hide()
	is_inlevelinfo = false
	if on_tutorial:
		on_tutorial = false
	if on_level1:
		on_level1 = false
	if on_level2:
		on_level2 = false
	if on_boss:
		on_boss = false


func _on_back_button_pressed() -> void:
	deselect.play()
	level_info_panel.hide()
	is_inlevelinfo = false
		


func _on_trigger_spot_level_1_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_lvl1.play("popin")
		bubble_pop_in.play()
		on_level1 = true


func _on_trigger_spot_level_1_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_lvl1.play("popout")
		on_level1 = false


func _on_trigger_spot_level_2_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_lvl2.play("popin")
		bubble_pop_in.play()
		on_level2 = true


func _on_trigger_spot_level_2_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_lvl2.play("popout")
		on_level2 = false


func _on_trigger_spot_boss_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_boss.play("popin")
		bubble_pop_in.play()
		on_boss = true


func _on_trigger_spot_boss_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_boss.play("popout")
		on_boss = false
