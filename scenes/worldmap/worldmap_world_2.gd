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
@onready var bubble_anim_world1: AnimationPlayer = $SceneObjects/WorldMap_LevelSpots/WorldSign_Back/SignSprite/BubbleAnim

@onready var score_numbers_life_t: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeT
@onready var score_numbers_life_dark_t: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkT
@onready var score_numbers_life_u: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeU
@onready var score_numbers_life_dark_u: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkU

@onready var tri_amount_numbers_u: AnimatedSprite2D = $UI/GUI/TrianglesTotal/TrianglesTotalBG/TriAmount_NumbersU
@onready var tri_amount_numbers_t: AnimatedSprite2D = $UI/GUI/TrianglesTotal/TrianglesTotalBG/TriAmount_NumbersT
@onready var tri_amount_numbers_h: AnimatedSprite2D = $UI/GUI/TrianglesTotal/TrianglesTotalBG/TriAmount_NumbersH

@onready var triangle_counter_1: AnimatedSprite2D = $UI/LevelInfo/LevelInfoPanel/SecretUIBase/TriangleCounter1
@onready var triangle_counter_2: AnimatedSprite2D = $UI/LevelInfo/LevelInfoPanel/SecretUIBase/TriangleCounter2
@onready var triangle_counter_3: AnimatedSprite2D = $UI/LevelInfo/LevelInfoPanel/SecretUIBase/TriangleCounter3
@onready var triangle_counter_4: AnimatedSprite2D = $UI/LevelInfo/LevelInfoPanel/SecretUIBase/TriangleCounter4

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

@onready var map_menu_panel: Panel = $UI/MapMenu/MapMenuPanel
@onready var ui: CanvasLayer = $UI


var has_hoverplayed = false
var is_inlevelinfo
var on_tutorial
var on_level1
var on_level2
var on_boss
var on_world1
var can_choose = true
var curLevel = ""
var curWorld = "world2"
var level_path = ""

func _ready() -> void:
	print_tree_pretty()
	
	if AltBgmManager.enabled:
		$SceneObjects/World_BGM.stream = load("res://bgm/worldmap/bgm_world2_worldmap_ytsafe.ogg")
		$SceneObjects/World_BGM.play()
	else:
		pass
	
	LevelsManager.worldname = curWorld
	ModeManager.isin_worldmap = true
	if ModeManager.is_savefile1:
		if SaveFileManager.world2_level2_dic["unlocked"]:
			connect_groundtut.play("avaliable")
			level_spot_sprite_lv1.play("available")
			level_spot_sprite_tut.play("clear")
			unlock_wall_level_1.disabled = true
		if SaveFileManager.world2_level3_dic["unlocked"]:
			connect_groundlvl1.play("avaliable")
			level_spot_sprite_lv2.play("available")
			level_spot_sprite_lv1.play("clear")
			unlock_wall_level_2.disabled = true
		if SaveFileManager.world2_boss_dic["unlocked"]:
			connect_groundlvl2.play("avaliable")
			if SaveFileManager.world2_boss_dic["hasbeencompleted"]:
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
	SaveGame.load_game()

	match LanguageManager.language:
		"spanish":
			$UI/MapMenu/MapMenuPanel/MapMenu_Text.text = "¡Selecciona un mundo!"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World1/WorldText.text = "Mundo 1"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World2/WorldText.text = "Mundo 2"
			$UI/GUI/CurrentWorld/CW_BG/WorldName.text = "Mundo 2"
		"french":
			$UI/MapMenu/MapMenuPanel/MapMenu_Text.text = "Choisissez un monde !"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World1/WorldText.text = "Monde 1"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World2/WorldText.text = "Monde 2"
			$UI/GUI/CurrentWorld/CW_BG/WorldName.text = "Monde 2"
		"italian":
			$UI/MapMenu/MapMenuPanel/MapMenu_Text.text = "Seleziona un mondo!"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World1/WorldText.text = "Mondo 1"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World2/WorldText.text = "Mondo 2"
			$UI/GUI/CurrentWorld/CW_BG/WorldName.text = "Mondo 2"
		"german":
			$UI/MapMenu/MapMenuPanel/MapMenu_Text.text = "Wähle eine Welt!"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World1/WorldText.text = "Welt 1"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World2/WorldText.text = "Welt 2"
			$UI/GUI/CurrentWorld/CW_BG/WorldName.text = "Welt 2"
		"japanese":
			$UI/MapMenu/MapMenuPanel/MapMenu_Text.text = "ワールドを選択してください!"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World1/WorldText.text = "ワールド1"
			$UI/MapMenu/MapMenuPanel/MapMenuBG/HBoxContainer/World2/WorldText.text = "ワールド2"
			$UI/GUI/CurrentWorld/CW_BG/WorldName.text = "ワールド2"
		_:
			return
			#It's just English


func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("grab"):
		if is_inlevelinfo:
			pass #So you can't press the button or any other levels until the menu's close.
		if on_tutorial:
			select.play()
			curLevel = "world2_level1"
			level_path = "res://scenes/levelmanager/world2_level1.tscn"
			var level = load(level_path).instantiate()
			LevelsManager.is_bossbattle = false
			add_child(level)
			level_thumbnail.texture = level.levelthumb
			LevelsManager.leveldisplay = level.levelname
			match LanguageManager.language:
				"spanish":
					level_name.text = level.levelname_spa
					level_description.text = level.leveldesc_spa
				"french":
					level_name.text = level.levelname_fre
					level_description.text = level.leveldesc_fre
				"italian":
					level_name.text = level.levelname_ita
					level_description.text = level.leveldesc_ita
				"german":
					level_name.text = level.levelname_ger
					level_description.text = level.leveldesc_ger
				"japanese":
					level_name.text = level.levelname_jpn
					level_description.text = level.leveldesc_jpn
				_:
					level_name.text = level.levelname
					level_description.text = level.leveldesc
			LevelsManager.levelname = curLevel
			print("Current Level is now " + curLevel + "!")
			level_info_panel.show()
			is_inlevelinfo = true
			$UI/LevelInfo/LevelInfoPanel/SecretUIBase.show()
			if SaveFileManager.world2_level1_dic["trianglecollected1"]:
				triangle_counter_1.play("found")
			else:
				triangle_counter_1.play("empty")
			if SaveFileManager.world2_level1_dic["trianglecollected2"]:
				triangle_counter_2.play("found")
			else:
				triangle_counter_2.play("empty")
			if SaveFileManager.world2_level1_dic["trianglecollected3"]:
				triangle_counter_3.play("found")
			else:
				triangle_counter_3.play("empty")
			if SaveFileManager.world2_level1_dic["trianglecollected4"]:
				triangle_counter_4.play("found")
			else:
				triangle_counter_4.play("empty")
		if on_level1:
			select.play()
			curLevel = "world2_level2"
			level_path = "res://scenes/levelmanager/world2_level2.tscn"
			var level = load(level_path).instantiate()
			LevelsManager.is_bossbattle = false
			add_child(level)
			level_thumbnail.texture = level.levelthumb
			LevelsManager.leveldisplay = level.levelname
			match LanguageManager.language:
				"spanish":
					level_name.text = level.levelname_spa
					level_description.text = level.leveldesc_spa
				"french":
					level_name.text = level.levelname_fre
					level_description.text = level.leveldesc_fre
				"italian":
					level_name.text = level.levelname_ita
					level_description.text = level.leveldesc_ita
				"german":
					level_name.text = level.levelname_ger
					level_description.text = level.leveldesc_ger
				"japanese":
					level_name.text = level.levelname_jpn
					level_description.text = level.leveldesc_jpn
				_:
					level_name.text = level.levelname
					level_description.text = level.leveldesc
			LevelsManager.levelname = curLevel
			print("Current Level is now " + curLevel + "!")
			level_info_panel.show()
			is_inlevelinfo = true
			$UI/LevelInfo/LevelInfoPanel/SecretUIBase.show()
			if SaveFileManager.world2_level2_dic["trianglecollected1"]:
				triangle_counter_1.play("found")
			else:
				triangle_counter_1.play("empty")
			if SaveFileManager.world2_level2_dic["trianglecollected2"]:
				triangle_counter_2.play("found")
			else:
				triangle_counter_2.play("empty")
			if SaveFileManager.world2_level2_dic["trianglecollected3"]:
				triangle_counter_3.play("found")
			else:
				triangle_counter_3.play("empty")
			if SaveFileManager.world2_level2_dic["trianglecollected4"]:
				triangle_counter_4.play("found")
			else:
				triangle_counter_4.play("empty")
		if on_level2:
			select.play()
			curLevel = "world2_level3"
			level_path = "res://scenes/levelmanager/world2_level3.tscn"
			var level = load(level_path).instantiate()
			LevelsManager.is_bossbattle = false
			add_child(level)
			level_thumbnail.texture = level.levelthumb
			LevelsManager.leveldisplay = level.levelname
			match LanguageManager.language:
				"spanish":
					level_name.text = level.levelname_spa
					level_description.text = level.leveldesc_spa
				"french":
					level_name.text = level.levelname_fre
					level_description.text = level.leveldesc_fre
				"italian":
					level_name.text = level.levelname_ita
					level_description.text = level.leveldesc_ita
				"german":
					level_name.text = level.levelname_ger
					level_description.text = level.leveldesc_ger
				"japanese":
					level_name.text = level.levelname_jpn
					level_description.text = level.leveldesc_jpn
				_:
					level_name.text = level.levelname
					level_description.text = level.leveldesc
			LevelsManager.levelname = curLevel
			print("Current Level is now " + curLevel + "!")
			level_info_panel.show()
			is_inlevelinfo = true
			$UI/LevelInfo/LevelInfoPanel/SecretUIBase.show()
			if SaveFileManager.world2_level3_dic["trianglecollected1"]:
				triangle_counter_1.play("found")
			else:
				triangle_counter_1.play("empty")
			if SaveFileManager.world2_level3_dic["trianglecollected2"]:
				triangle_counter_2.play("found")
			else:
				triangle_counter_2.play("empty")
			if SaveFileManager.world2_level3_dic["trianglecollected3"]:
				triangle_counter_3.play("found")
			else:
				triangle_counter_3.play("empty")
			if SaveFileManager.world2_level3_dic["trianglecollected4"]:
				triangle_counter_4.play("found")
			else:
				triangle_counter_4.play("empty")
		if on_boss:
			select.play()
			curLevel = "boss_pete"
			level_path = "res://scenes/levelmanager/boss_pete.tscn"
			var level = load(level_path).instantiate()
			LevelsManager.is_bossbattle = true
			add_child(level)
			level_thumbnail.texture = level.levelthumb
			LevelsManager.leveldisplay = level.levelname
			match LanguageManager.language:
				"spanish":
					level_name.text = level.levelname_spa
					level_description.text = level.leveldesc_spa
				"french":
					level_name.text = level.levelname_fre
					level_description.text = level.leveldesc_fre
				"italian":
					level_name.text = level.levelname_ita
					level_description.text = level.leveldesc_ita
				"german":
					level_name.text = level.levelname_ger
					level_description.text = level.leveldesc_ger
				"japanese":
					level_name.text = level.levelname_jpn
					level_description.text = level.leveldesc_jpn
				_:
					level_name.text = level.levelname
					level_description.text = level.leveldesc
			LevelsManager.levelname = curLevel
			print("Current Level is now " + curLevel + "!")
			level_info_panel.show()
			is_inlevelinfo = true
			$UI/LevelInfo/LevelInfoPanel/SecretUIBase.hide()
		if on_world1:
			select.play()
			go.play()
			ui.hide()
			LoadManager.load_scene("res://scenes/worldmap/worldmap_world1.tscn")
			is_inlevelinfo = false
			if on_tutorial:
				on_tutorial = false
			if on_level1:
				on_level1 = false
			if on_level2:
				on_level2 = false
			if on_boss:
				on_boss = false
			if on_world1:
				on_world1 = false

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
	if LevelsManager.levelname == "world2_level1":
		LoadManager.load_scene("res://scenes/cutscenes/world2/world_2_level_1_cutscene.tscn")
	elif LevelsManager.levelname == "boss_pete":
		ModeManager.isin_worldmap = false
		LoadManager.load_scene("res://scenes/cutscenes/world2/boss_pete_opening.tscn")
	else:
		LoadManager.load_scene("res://scenes/levels/" + LevelsManager.worldname + "/" + LevelsManager.levelname + ".tscn")
	ui.hide()
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
	if on_world1:
		on_world1 = false


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


func _on_map_icon_pressed() -> void:
	select.play()
	map_menu_panel.show()
	can_choose = false
	game_manager.cutscenemode_on()


func _on_back_button_map_menu_pressed() -> void:
	deselect.play()
	map_menu_panel.hide()
	can_choose = true
	game_manager.cutscenemode_off()



func _on_world_2_button_pressed() -> void:
	select.play()


func _on_world_1_button_pressed() -> void:
	select.play()
	curWorld = "world1"
	map_menu_panel.hide()
	ui.hide()
	LoadManager.load_scene("res://scenes/worldmap/worldmap_world1.tscn")


func _on_trigger_spot_world_1_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_world1.play("popin")
		bubble_pop_in.play()
		on_world1 = true


func _on_trigger_spot_world_1_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		bubble_anim_world1.play("popout")
		on_world1 = false
