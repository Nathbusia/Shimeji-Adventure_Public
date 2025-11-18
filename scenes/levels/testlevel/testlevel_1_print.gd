extends Node
@onready var secret_triangle: Area2D = $SceneObjects/SecretTriangles/SecretTriangle
@onready var secret_triangle_2: Area2D = $SceneObjects/SecretTriangles/SecretTriangle2
@onready var secret_triangle_3: Area2D = $SceneObjects/SecretTriangles/SecretTriangle3
@onready var secret_triangle_4: Area2D = $SceneObjects/SecretTriangles/SecretTriangle4
@onready var finish_star: Area2D = $SceneObjects/FinishStar
@onready var score_numbers_life_t: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeT
@onready var score_numbers_life_dark_t: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkT
@onready var score_numbers_life_u: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeU
@onready var score_numbers_life_dark_u: AnimatedSprite2D = $UI/GUI/CharUIBase/LayoutMain/CharLife/NumbersLife/Score_NumbersLifeDarkU

@onready var game_manager: GameManager = $GameManager
@onready var multiplayer_cam: Camera2D = $MultiplayerCam
@onready var tile_map_layer: TileMapLayer = $SceneObjects/TileMap/TileMapLayer

func _ready() -> void:
	print_tree_pretty()
	
	match LevelsManager.levelname:
		"testlevel1":
			if AltBgmManager.enabled:
				$SceneObjects/Level_BGM.stream = load("res://bgm/levels/testlevels/mus_testlevel_01_ytsafe.ogg")
				$SceneObjects/Level_BGM.play()
			else:
				pass

		"testlevel2":
			if AltBgmManager.enabled:
				$SceneObjects/Level_BGM.stream = load("res://bgm/levels/testlevels/mus_testlevel_02_ytsafe.ogg")
				$SceneObjects/Level_BGM.play()
			else:
				pass

		"tutorial":
			if AltBgmManager.enabled:
				$SceneObjects/Level_BGM.stream = load("res://bgm/levels/tutorial/bgm_tutorial_ytsafe.ogg")
				$SceneObjects/Level_BGM.play()
			else:
				pass

		_:
			pass
	
	ModeManager.isin_worldmap = false
	if ModeManager.is_story:
		if ModeManager.is_savefile1:
			if SaveFileManager.currentplayerlives == 1 or SaveFileManager.currentplayerlives == 2 or SaveFileManager.currentplayerlives == 3 or SaveFileManager.currentplayerlives == 4 or SaveFileManager.currentplayerlives == 5 or SaveFileManager.currentplayerlives == 6 or SaveFileManager.currentplayerlives == 7 or SaveFileManager.currentplayerlives == 8 or SaveFileManager.currentplayerlives == 9:
				score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
			if SaveFileManager.currentplayerlivest == 1 or SaveFileManager.currentplayerlivest == 2 or SaveFileManager.currentplayerlivest == 3 or SaveFileManager.currentplayerlivest == 4 or SaveFileManager.currentplayerlivest == 5 or SaveFileManager.currentplayerlivest == 6 or SaveFileManager.currentplayerlivest == 7 or SaveFileManager.currentplayerlivest == 8 or SaveFileManager.currentplayerlivest == 9:
				score_numbers_life_t.animation = str(SaveFileManager.currentplayerlivest)
				score_numbers_life_dark_t.animation = str(SaveFileManager.currentplayerlivest)
				score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
				score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
				
func _process(delta: float) -> void:
	if ModeManager.is_savefile1:
		if LevelsManager.levelname == "tutorial" && ModeManager.is_story:
			if game_manager.got_triangle1:
				if SaveFileManager.world1_tutorial_dic["trianglecollected1"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle1 = false
				SaveFileManager.world1_tutorial_dic["trianglecollected1"] = true
			if game_manager.got_triangle2:
				if SaveFileManager.world1_tutorial_dic["trianglecollected2"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle2 = false
				SaveFileManager.world1_tutorial_dic["trianglecollected2"] = true
			if game_manager.got_triangle3:
				if SaveFileManager.world1_tutorial_dic["trianglecollected3"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle3 = false
				SaveFileManager.world1_tutorial_dic["trianglecollected3"] = true
			if game_manager.got_triangle4:
				if SaveFileManager.world1_tutorial_dic["trianglecollected4"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle4 = false
				SaveFileManager.world1_tutorial_dic["trianglecollected4"] = true
			if game_manager.startouched:
				SaveFileManager.world1_tutorial_dic["hasbeencompleted"] = true
				SaveFileManager.world1_level1_dic["unlocked"] = true
				game_manager.startouched = false
		if LevelsManager.levelname == "level1" && ModeManager.is_story:
			if game_manager.got_triangle1:
				if SaveFileManager.world1_level1_dic["trianglecollected1"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle1 = false
				SaveFileManager.world1_level1_dic["trianglecollected1"] = true
			if game_manager.got_triangle2:
				if SaveFileManager.world1_level1_dic["trianglecollected2"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle2 = false
				SaveFileManager.world1_level1_dic["trianglecollected2"] = true
			if game_manager.got_triangle3:
				if SaveFileManager.world1_level1_dic["trianglecollected3"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle3 = false
				SaveFileManager.world1_level1_dic["trianglecollected3"] = true
			if game_manager.got_triangle4:
				if SaveFileManager.world1_level1_dic["trianglecollected4"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle4 = false
				SaveFileManager.world1_level1_dic["trianglecollected4"] = true
			if game_manager.startouched:
				SaveFileManager.world1_level1_dic["hasbeencompleted"] = true
				SaveFileManager.world1_level2_dic["unlocked"] = true
				game_manager.startouched = false
		if LevelsManager.levelname == "level2" && ModeManager.is_story:
			if game_manager.got_triangle1:
				if SaveFileManager.world1_level2_dic["trianglecollected1"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle1 = false
				SaveFileManager.world1_level2_dic["trianglecollected1"] = true
			if game_manager.got_triangle2:
				if SaveFileManager.world1_level2_dic["trianglecollected2"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle2 = false
				SaveFileManager.world1_level2_dic["trianglecollected2"] = true
			if game_manager.got_triangle3:
				if SaveFileManager.world1_level2_dic["trianglecollected3"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle3 = false
				SaveFileManager.world1_level2_dic["trianglecollected3"] = true
			if game_manager.got_triangle4:
				if SaveFileManager.world1_level2_dic["trianglecollected4"] == true:
					pass #So it won't add up if you already collected it before...
				SaveFileManager.new_triangle()
				game_manager.got_triangle4 = false
				SaveFileManager.world1_level2_dic["trianglecollected4"] = true
			if game_manager.startouched:
				SaveFileManager.world1_level2_dic["hasbeencompleted"] = true
				SaveFileManager.world1_boss_dic["unlocked"] = true
				game_manager.startouched = false


func _on_fall_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "EmailShooter"):
		$SceneObjects/EmailShooter.global_position = $SceneObjects/EmailShooterPos.global_position
