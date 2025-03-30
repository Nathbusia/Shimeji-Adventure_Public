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

func _ready() -> void:
	print_tree_pretty()
	ModeManager.isin_worldmap = false
	if ModeManager.is_story:
		if SaveFileManager.currentplayerlives == 1 or SaveFileManager.currentplayerlives == 2 or SaveFileManager.currentplayerlives == 3 or SaveFileManager.currentplayerlives == 4 or SaveFileManager.currentplayerlives == 5 or SaveFileManager.currentplayerlives == 6 or SaveFileManager.currentplayerlives == 7 or SaveFileManager.currentplayerlives == 8 or SaveFileManager.currentplayerlives == 9:
			score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
			score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)
		if SaveFileManager.currentplayerlives == 10 or SaveFileManager.currentplayerlives == 20 or SaveFileManager.currentplayerlives == 30 or SaveFileManager.currentplayerlives == 40 or SaveFileManager.currentplayerlives == 50 or SaveFileManager.currentplayerlives == 60 or SaveFileManager.currentplayerlives == 70 or SaveFileManager.currentplayerlives == 80 or SaveFileManager.currentplayerlives == 90:
			score_numbers_life_t.animation = str(SaveFileManager.currentplayerlivest)
			score_numbers_life_dark_t.animation = str(SaveFileManager.currentplayerlivest)
			score_numbers_life_u.animation = str(SaveFileManager.currentplayerlives)
			score_numbers_life_dark_u.animation = str(SaveFileManager.currentplayerlives)

func _process(delta: float) -> void:
	if LevelsManager.levelname == "tutorial" && ModeManager.is_story:
		if game_manager.got_triangle1:
			if SaveFileManager.world1_tutorial_dic["trianglecollected1"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_tutorial_dic["trianglecollected1"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle1 = false
		if game_manager.got_triangle2:
			if SaveFileManager.world1_tutorial_dic["trianglecollected2"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_tutorial_dic["trianglecollected2"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle2 = false
		if game_manager.got_triangle3:
			if SaveFileManager.world1_tutorial_dic["trianglecollected3"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_tutorial_dic["trianglecollected3"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle3 = false
		if game_manager.got_triangle4:
			if SaveFileManager.world1_tutorial_dic["trianglecollected4"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_tutorial_dic["trianglecollected4"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle4 = false
		if game_manager.startouched:
			SaveFileManager.world1_tutorial_dic["hasbeencompleted"] = true
			SaveFileManager.world1_level1_dic["unlocked"] = true
			game_manager.startouched = false
	if LevelsManager.levelname == "level1" && ModeManager.is_story:
		if game_manager.got_triangle1:
			if SaveFileManager.world1_level1_dic["trianglecollected1"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_level1_dic["trianglecollected1"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle1 = false
		if game_manager.got_triangle2:
			if SaveFileManager.world1_level1_dic["trianglecollected2"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_level1_dic["trianglecollected2"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle2 = false
		if game_manager.got_triangle3:
			if SaveFileManager.world1_level1_dic["trianglecollected3"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_level1_dic["trianglecollected3"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle3 = false
		if game_manager.got_triangle4:
			if SaveFileManager.world1_level1_dic["trianglecollected4"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_level1_dic["trianglecollected4"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle4 = false
		if game_manager.startouched:
			SaveFileManager.world1_level1_dic["hasbeencompleted"] = true
			SaveFileManager.world1_level2_dic["unlocked"] = true
			game_manager.startouched = false
	if LevelsManager.levelname == "level2" && ModeManager.is_story:
		if game_manager.got_triangle1:
			if SaveFileManager.world1_level2_dic["trianglecollected1"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_level2_dic["trianglecollected1"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle1 = false
		if game_manager.got_triangle2:
			if SaveFileManager.world1_level2_dic["trianglecollected2"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_level2_dic["trianglecollected2"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle2 = false
		if game_manager.got_triangle3:
			if SaveFileManager.world1_level2_dic["trianglecollected3"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_level2_dic["trianglecollected3"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle3 = false
		if game_manager.got_triangle4:
			if SaveFileManager.world1_level2_dic["trianglecollected4"] == true:
				pass #So it won't add up if you already collected it before...
			SaveFileManager.world1_level2_dic["trianglecollected4"] = true
			SaveFileManager.new_triangle()
			game_manager.got_triangle4 = false
		if game_manager.startouched:
			SaveFileManager.world1_level2_dic["hasbeencompleted"] = true
			SaveFileManager.world1_boss_dic["unlocked"] = true
			game_manager.startouched = false
